# Cohomology comparisons: integral diagrams and rational period realizations

This roadmap compares cohomology theories through their actual maps. Its integral diagram starts with proper smooth A_inf cohomology and identifies its de Rham, Hodge–Tate, crystalline and étale specializations. Rational comparison then identifies the canonical B_dR⁺ lattice, proves filtered de Rham comparison, and transports semistable Frobenius and monodromy. Torsion inequalities, lattice recovery, products and characteristic classes are applications of those maps.

The plan has 83 declarations at target level: 2 definitions, 2 constructions, 55 theorems, 18 applications and 6 comparisons. The four definitions and constructions have 24 API items and 13 unit tests. All seven stages are planned; none is closed. The remaining gaps and supplier extensions below are mathematical obligations, and no declaration is claimed to be implemented. Independent review [REV-CohomologyComparisons~2](../reviews/REV-CohomologyComparisons~2.md) accepts this target-level pass after the corrections recorded in its report. Supplier requests and gaps remain open, and global promotion requires the external ordering repairs below.

## Scope and ownership

CP owns geometric comparison, normalization and agreement of maps. AInfCohomology owns coefficient algebra, décalage, AΩ and BKF linear algebra. CrystallineCohomology owns PD envelopes, crystalline and Hyodo–Kato complexes and their base-change theory. PrismaticCohomology owns prisms, derived prismatic and syntomic constructions. PadicHodgeTheory owns period rings, period functors and the early local period sheaves. The accepted September RS-01 boundary is retained. The October RS-01 revision currently has review pending; proposed supplier extensions in that revision are not assumed to exist.

The order of ordinary comparisons follows CP.0 → CP.1, CP.3 → CP.2 and then the semistable and integral applications. CP.3 supplies the good-reduction B_dR⁺ lattice used to check the filtered part of CP.2. The GR relative filtered agreement retains its CP.3 declaration id and realizes CP.3, but its actual parent is CP.6 because its PR.7 input is downstream of the ordinary comparison. Pan’s five coefficient adapters likewise have actual parent CP.6 and realize the routed CP.0/CP.3 targets. A displayed target is not a prerequisite edge back to its realizing stage.

## Conventions and the pinned libraries

Fix a prime p and a complete algebraically closed nonarchimedean extension C/Q_p with integers O_C. The discretely valued base K⊂C has perfect residue field k whenever a canonical K→B_dR⁺ lift is used; for semistable comparison C is the completed algebraic closure of K. Keep the special fibre over k, reduction over O_C/p, formal model and rigid generic fibre distinct. Let A=A_inf=W(O_C^♭), θ̃=θφ⁻¹, μ=[ε]−1, ξ=μ/φ⁻¹(μ) and ξ̃=φ(ξ). Witt reduction sends ξ to p and μ to zero. The Breuil–Kisin normalization uses u↦[π^♭]^p, so θ̃ sends u to π. Frobenius on W(k)[[u]] is an endomorphism, not an automorphism.

Derived tensor, p-completed tensor, Hodge completion and ξ-adic completion are separate operations. A field-valued rank identity does not establish a comparison map or its filtration. A Frobenius eigenspace of a complex denotes a derived fibre, unless a node explicitly discusses degreewise fixed vectors. The nearby-cycle square truncates the nearby-cycle sheaf before global sections. The tensor Hodge filtration convolves the filtration on de Rham cohomology with the period filtration.

Use HT(χ_p)=+1 and retain the contravariant Fontaine–Laffaille conventions at their owner. A trace-normalized period a in Betts–Stix is not asserted equal to Fontaine’s t. In semistable comparison the translation of the CR.6 monodromy convention to N=−d/dT must be proved before fixing the sign of the uniformizer-change exponential.

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed AUDIT-35 reports every CP stage as not built. Coefficient carriers and ordinary derived-category infrastructure exist, so the plan reuses them and imports the absent enhanced/geometric theories from their owners.

- `mathlib:WittVector` (Mathlib/RingTheory/WittVector/Defs.lean): Witt vectors. A_inf is the Witt vectors of the tilt, so this is the carrier of every module in this roadmap.
- `mathlib:WittVector.fontaineTheta` (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean): Fontaine's theta as a ring homomorphism. It is one of the four entries of the specialization dictionary this packet's single definition assembles, and it is already pinned, so the definition cites it rather than rebuilding it.
- `mathlib:BDeRhamPlus` (Mathlib/RingTheory/Perfectoid/BDeRham.lean): AdicCompletion of the kernel of fontaineThetaInvertP on Localization.Away p of WittVector p (PreTilt R p), with a CommRing instance, under Fact p.Prime, Fact ¬IsUnit (p:R), and p-adic completeness. It does not supply Fontaine field/DVR theorems.
- `mathlib:BDeRham` (Mathlib/RingTheory/Perfectoid/BDeRham.lean): Localization of BDeRhamPlus at the submonoid generated by images of generators of ker θ. The pinned declaration does not assert field or DVR structure; these are supplier needs.
- `mathlib:PadicInt` (Mathlib/NumberTheory/Padics/PadicIntegers.lean): The p-adic integers, the coefficients of the etale cohomology groups being compared.
- `mathlib:Module.length` (Mathlib/RingTheory/Length.lean): Extended-natural length defined by the Krull dimension of the submodule lattice for a Ring and module. Finite torsion hypotheses are needed for an ordinary finite length; no comparison theorem is built into this definition.
- `mathlib:Module.finrank` (Mathlib/LinearAlgebra/Dimension/Finrank.lean): Cardinal.toNat of Module.rank for a semiring module. Over a field with finite-dimensionality it is the natural dimension; it is not an extended torsion length.
- `mathlib:DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): The derived category of an abelian category (HomologicalComplexUpToQuasiIso), used as the carrier in which the rational degreewise comparison of CP.2/rational-degreewise-comparison distinguishes derived from degreewise specialization. It supplies no completed or filtered enhancement.
- `mathlib:TensorProduct` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): Tensor products, the form every base change in this roadmap takes.
- `mathlib:IsAdicComplete` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Adic completeness, a standing hypothesis on the rings involved.
- `mathlib:AdicCompletion` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Compatible inverse-limit elements of M/(I^n M); used as the underlying completion in a presented infinitesimal envelope, never reconstructed.
- `mathlib:AdicCompletion.isAdicComplete` (Mathlib/RingTheory/AdicCompletion/Completeness.lean): I-adic completeness of AdicCompletion I M under I.FG; finite generation is essential.
- `mathlib:AdicCompletion.eval_of` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Evaluation of a canonical completed element at level n equals its quotient class.
- `mathlib:AdicCompletion.ext` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Equality of completion elements from equality at every finite quotient.
- `mathlib:WittVector.frobeniusEquiv` (Mathlib/RingTheory/WittVector/Frobenius.lean): For a perfect ring R of characteristic p, WittVector.frobenius as a ring equivalence of W(R): the Frobenius φ of A_inf=W(O_C^♭) and of W(k).
- `mathlib:cyclotomicCharacter` (Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean): The p-adic cyclotomic character (L ≃+* L) →* ℤ_[p]ˣ of a domain L containing all p-power roots of unity (trivial otherwise): χ_p in the HT(χ_p)=+1 convention.

The suggested file uses individual Mathlib imports and no Tau Ceti import. Each absent geometric object is an owner-named carrier, and each imported-data structure has a specific value for the geometric object under discussion. Theorems concern those specific values. The AMMN signature uses a distinguished triangle in the ordinary derived category as the shadow of a homotopy cartesian square; it does not use an ordinary categorical pullback. Docstrings identify clauses that require stronger enhanced carriers. The Lean Fnr carrier is F̂^{nr}; Hyodo–Kato and D_pst modules are first scalar-extended to it, while original F^{nr} smooth-vector descent remains an owner obligation. Pan’s integral inverse-limit declarations represent almostified modules using the almost category’s right adjoint. Balanced monodromy requires a coefficient-killing derivation and a coefficient-linear HK operator; the exponential requires nilpotency. The semistable carrier includes the pure-dimensional special fibre hypothesis.

## CP.0. Common objects, coefficient maps and normalization

The normalized specialization dictionary assembles imported maps, rather than defining the coefficient rings again. Its APIs expose kernels, distinguished-element evaluations and Frobenius transport. The ordinary A1/H1/H0 site maps and geometric points are kept separate from the logarithmic analytic projections used by the CP.6 Pan adapter; a logarithmic PD site does not supply that analytic projection.

### Normalized specialization diagram

`CohomologyComparisons:CP.0/ainf-specialization-dictionary` — definition; declaration `SpecializationDictionary`.

For C complete algebraically closed over Q_p, assemble the imported maps of A=W(O_C^♭): θ:A→O_C, θ̃=θ∘φ⁻¹, w:A→W(k), A→A_cris→B_dR⁺, and A[1/μ]→B_cris→B_dR. The adapter records their actual composites, ξ=μ/φ⁻¹(μ), ξ̃=φ(ξ), ker θ=(ξ), ker θ̃=(ξ̃), θ(μ)=0, w(ξ)=p and w(μ)=0. It identifies the composite A→A_cris→B_dR⁺ with the canonical completion map. These are relations among imported objects, not constructions of the coefficient rings.

**Proof plan.**

- Use AI.0:integral for θ, φ, ξ, μ and reduction; use CR.0 and R06.1 for PD and rational maps.
- Check w(ξ)=p by reducing ε to 1 in the geometric sum for ξ; θ(ξ)=0 uses the primitive p-th root relation. Check every square on Teichmüller coordinates before scalar extension.

**Uses.**

- CP.1 integral squares: Pins the scalar map and the Frobenius pullback of each comparison.
- BMS1 Theorems 14.5–14.6: Distinguishes the Witt specialization from θ when recovering lattices.
- CP.1/witt-crystalline-specialization; BMS1 Theorem 14.5(iii): the Witt specialization intertwines φ on A_inf with the Frobenius of W(k), which the φ-compatible lattice recovery uses

**API.**

- `SpecializationDictionary.thetaTilde_apply` (simp): For a∈A, θ̃(a)=θ(φ⁻¹(a)).
- `SpecializationDictionary.period_composite` (compatibility): The map A→B_dR⁺ is the composite A→A_cris→B_dR⁺.
- `SpecializationDictionary.theta_xi` (simp): θ(ξ)=0.
- `SpecializationDictionary.witt_xi` (simp): w(ξ)=p.
- `SpecializationDictionary.witt_mu` (simp): w(μ)=0.
- `SpecializationDictionary.ker_theta` (characterisation): ker θ=(ξ) and ker θ̃=(ξ̃), where ξ̃=φ(ξ).
- `SpecializationDictionary.witt_frobenius` (compatibility): w∘φ=F∘w, where F is the Witt vector Frobenius of W(k) (Mathlib WittVector.frobeniusEquiv for the perfect ring k).

**Unit tests.**

- `SpecializationDictionary.test_theta` (computation): The θ-specialization sends the specified ξ to 0.
- `SpecializationDictionary.test_witt` (non-example): If p is nonzero in W(k), Witt specialization sends ξ to a nonzero element; replacing it by θ violates the dictionary.
- `SpecializationDictionary.test_composite` (compatibility): On every a∈A, the direct B_dR⁺ specialization equals the value through A_cris.
- `SpecializationDictionary.test_mathlib_theta` (compatibility): For the standard dictionary of O_C, θ is Mathlib's WittVector.fontaineTheta O_C p and the B_dR⁺ target is Mathlib's BDeRhamPlus O_C p.

**Acceptance.**

- θ and Witt reduction send ξ to different values, respectively 0 and p; they cannot be conflated.

**Direct prerequisites.** `AInfCohomology:AI.0:integral`, `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1`, `mathlib:WittVector.fontaineTheta`, `mathlib:BDeRhamPlus`, `mathlib:WittVector.frobeniusEquiv`, `AInfCohomology:AI.0:period-comparison`, `CrystallineCohomology:CR.0/fontaine-envelope`, `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`.

**Sources.**

- bms1-2019, Example 3.16, p.25; Definition 3.22, p.27; §4.3, p.40. BMS1 fixes µ = [ε] − 1 and ξ = µ/ϕ⁻¹(µ) generating ker θ, and ξ̃_r = ϕʳ(µ)/µ generating ker θ̃_r, which are exactly the node's normalizations ξ = μ/φ⁻¹(μ), ξ̃ = φ(ξ), ker θ = (ξ), ker θ̃ = (ξ̃).

Planet: Normalized specialization diagram.

Suggested signature: `SpecializationDictionary` with every API item and unit test of the packet, in the imported-data pattern (owner-named placeholder carriers where the libraries have none; Mathlib's WittVector, fontaineTheta, BDeRhamPlus, AdicCompletion where they exist). Completed by REV-CohomologyComparisons; elaborates with admitted proofs only.

### Formal and analytic cohomology dictionary

`CohomologyComparisons:CP.0/formal-algebraic-analytic-dictionary` — theorem; declaration `CP0.formal_algebraic_analytic_dictionary`.

For a proper smooth O_K-scheme X₀, let 𝔛₀ be its p-adic completion, 𝔛=𝔛₀⊗̂O_C, Y=𝔛_{O_C/p}, X_k its residue scheme, and X_C the geometric adic generic fibre. Identify algebraic and analytic étale cohomology of the proper generic fibre, algebraic and continuous formal de Rham cohomology, and the special-fibre crystalline objects through the imported GAGA/completion equivalences. Keep Spec O_C/p distinct from Spec k; the former is not the residue field. Geometric points and pullback morphisms are retained in each identification.

**Proof plan.**

- Compose formal completion and analytification from H1/H5, and proper cohomological GAGA. Record the induced maps of ringed sites; this is the geometric adapter, not a new formal model construction.

**Acceptance.**

- For X₀=Spec O_K every identification is the identity of the degree-zero coefficients (Z_p, O_C, W(k)).
- For X₀=P¹_{O_K} the algebraic, analytic and formal sides are free of rank one in degrees 0 and 2 and zero in degree 1, and the identifications match the classes of a K-rational point; the adic generic fibre of the completion is the analytic P¹_C, not an open disc.

**Direct prerequisites.** `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `CrystallineCohomology:CR.3`, `ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2`.

**Sources.**

- bms1-2019, Theorem 1.1 and Remarks 1.2–1.3, pp.2–4; §13.4, p.116. §13.4 sets Y = 𝔛 ×_{Spf O} Spec O/p, whose universal PD thickening is A_crys, and in the next sentence the special fibre Ȳ = 𝔛 ×_{Spf O} Spec k with W(k)-cohomology: the O_C/p versus k distinction the dictionary keeps.

Planet: Geometric cohomology dictionary.

Suggested signature: `CP0.formal_algebraic_analytic_dictionary` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Compatible geometric fibres and sites

`CohomologyComparisons:CP.0/site-and-geometric-point-compatibility` — theorem; declaration `CP0.site_and_geometric_point_compatibility`.

The projection from the generic analytic pro-étale to étale site and the formal-to-special-fibre specialization have compatible derived pullback/pushforward maps. For X descended from K, choose geometric points over K̄→C so that the G_K actions refer to the same geometric cohomology object. Use Scholze’s corrected covers, without the discarded classification of topological points. The analytic logarithmic projections are a separate T6:log-sites input of the late CP.6 adapter realizing CP.0; CR.5’s logarithmic PD site is not their supplier.

**Proof plan.**

- Compose the corrected ordinary projections from A1 and the formal/special-fibre specialization from H1. H0 supplies derived functoriality and the p-adic passage; existence of a cover is not an acyclicity theorem. Keep the logarithmic analytic and logarithmic PD site interfaces distinct.

**Acceptance.**

- Changing the embedding K̄→C conjugates the action and comparison, rather than producing unrelated representations.

**Direct prerequisites.** `AdicEtaleGeometry:A1`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `AdicEtaleGeometry:A1/proetale-field-extension-slice`, `AdicEtaleGeometry:A1/profinite-galois-cover-is-covering`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `ClassicalAdicEtaleCohomology:H0`.

**Sources.**

- sch13-erratum, Erratum (1)–(3), pp.1–2. Erratum item (1) replaces the open-cover condition of Definition 3.3 by transfinite inverse-limit covers, which is exactly the 'corrected pro-étale covers' the node requires.

Suggested signature: `CP0.site_and_geometric_point_compatibility` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Twists, Frobenius and filtration conventions

`CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization` — theorem; declaration `CP0.twist_frobenius_filtration_normalization`.

Use HT(χ_p)=+1, Q_p(1) with G_K action χ_p, t=log[ε] and φ(t)=pt. The filtration is decreasing, Fil^r B_dR=t^r B_dR⁺; Hodge–Tate forms use the Breuil–Kisin twist {−j}, not an unnormalized Tate twist over O_C. The semilinear φ on a module is displayed as φ* M→M. The BMS/Kisin map S=W(k)[[u]]→A_inf sends u↦[π^♭]^p and restricts to Witt Frobenius; S→W(k) sends u↦0 and is also Frobenius on W(k).

**Proof plan.**

- Read BMS1 Example 4.24 and §4.4 with the coefficient adapter; fix χ_p by Mathlib's cyclotomicCharacter. Test the trivial representation and Q_p(1). R07.3 and R06.4 consume these conventions (CP.0 is the common source of conventions for R07); their realizations are compared in CP.5/small-weight-integral-interface.

**Acceptance.**

- Q_p(1): t=log[ε] satisfies g(t)=χ_p(g)t and φ(t)=pt, and D_dR(Q_p(1))=K·t⁻¹ has its unique filtration jump at −1, i.e. Hodge–Tate weight +1 under HT(χ_p)=+1; the trivial representation has its jump at 0.
- The composite of S→A_inf (u↦[π^♭]^p, Frobenius on W(k)) with θ̃=θφ⁻¹ is u↦π and the natural map on W(k); composing with θ instead gives u↦π^p and the Frobenius-twisted map on W(k), so the two specializations are distinguished.

**Direct prerequisites.** `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `AInfCohomology:AI.2`, `mathlib:cyclotomicCharacter`, `PadicHodgeTheory:R06.1`.

**Sources.**

- bms1-2019, Example 4.24, p.41; §4.4, pp.43–44; introduction p.4. §4.4 defines 𝔖 = W(k)[[T]] → A_inf by T ↦ [π♭]^p and Frobenius on W(k), commuting with ϕ and θ̃, and p.4 defines 𝔖 → W(k) by T ↦ 0 and Frobenius on W(k), matching the node's map statements (BMS1 writes T, not u).

Planet: Twist and Frobenius normalization.

Suggested signature: `CP0.twist_frobenius_filtration_normalization` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Coefficient choices and transport

`CohomologyComparisons:CP.0/no-c-section-and-choice-transport` — theorem; declaration `CP0.no_c_section_and_choice_transport`.

No natural section C→B_dR⁺ is used. For a complete discretely valued subfield K⊂C with perfect residue field the continuous lift K→B_dR⁺ is unique, hence canonical (for an imperfect residue field the lifts to B_dR⁺/ξ² form a torsor under Hom(Ω̂¹_{O_K},C(1))≠0); a lift of a smooth spreading-out algebra A over K is a proof choice, whose resulting cohomology is compared by embedding-system quasi-isomorphisms. The residue-field section k→O_C/p in rational crystalline base change is separately recorded, with independence only in the cases stated by BMS1 Remark 13.22.

**Proof plan.**

- Use the distinction between Lemma 13.11, Theorem 13.19 and Remark 13.20. Transport two choices through the common embedding; do not choose a splitting of θ on C.

**Acceptance.**

- The point X=Spa(C) has B_dR⁺ cohomology without a chosen embedding C→B_dR⁺.

**Direct prerequisites.** `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `PadicHodgeTheory:R06.1`.

**Sources.**

- bms1-2019, Lemmas 13.11–13.13, pp.109–112; Remark 13.20, p.114; Remark 13.22, p.116. The source fixes one continuous lift A → B⁺_dR of the spreading-out algebra as a proof choice (p.109), while Remark 13.20 uses 'the unique continuous lift of K → C' and pp.5/104 stress that there is no (continuous) section C → B⁺_dR, matching the node's split between canonical and chosen data.

Suggested signature: `CP0.no_c_section_and_choice_transport` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

**Targets realized in another actual stage.**

- `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion` (Graded analytic vectors and decompletion), parent `CohomologyComparisons:CP.6`.
- `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map` (Étale-site truncated period map), parent `CohomologyComparisons:CP.6`.

## CP.1. The integral derived comparison diagram

Start with the perfect proper smooth A_inf complex from AI.5. The four specialization maps are derived maps with the indicated completed coefficients. BMS1 does not state every enhanced multiplicative or Frobenius clause in the form the roadmap needs; those clauses remain reconstruction targets with explicit supplier requests.

### Proper smooth A_inf input package

`CohomologyComparisons:CP.1/proper-ainf-input-package` — application; declaration `CP1.proper_ainf_input_package`.

For a proper smooth p-adic formal O_C-scheme 𝔛, import the actual K_A=RΓ(𝔛,AΩ_𝔛), its perfectness, and the BKF structures on H^i(K_A). H^i(K_A) is finitely presented and becomes finite free after inverting p. Its derived specializations are complexes attached to 𝔛 and its named generic and special fibres; arbitrary perfect complexes with these ranks do not substitute for this geometric input.

**Proof plan.**

- AI.4–AI.5 own BMS1 Theorems 14.1 and 14.3. Keep this as an interface adapter and cite those exact supplier requirements, then use the coefficient maps from CP.0.

**Acceptance.**

- The structure morphism 𝔛=Spf O_C gives A_inf in degree zero.

**Direct prerequisites.** `AInfCohomology:AI.4`, `AInfCohomology:AI.5`, `CohomologyComparisons:CP.0/ainf-specialization-dictionary`.

**Sources.**

- bms1-2019, Theorems 14.1 and 14.3, pp.118–120. Theorem 14.3 states that RΓ_{A_inf}(𝔛) = RΓ(𝔛, AΩ_𝔛) is perfect, carries a ϕ-linear map that is an isomorphism after inverting ξ, and has Breuil–Kisin–Fargues cohomology groups: finitely presented and free after inverting p (Definition 4.22).

Suggested signature: `CP1.proper_ainf_input_package` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Integral de Rham specialization

`CohomologyComparisons:CP.1/theta-de-rham-specialization` — theorem; declaration `CP1.theta_de_rham_specialization`.

For 𝔛 as above, the θ-base change K_A⊗^L_{A_inf,θ}O_C is canonically quasi-isomorphic to RΓ(𝔛,Ω^{•,cont}_{𝔛/O_C}), multiplicatively in the smooth BMS1 setting. The right side uses continuous differential forms; use derived tensor even when individual cohomology has torsion.

**Proof plan.**

- Apply BMS1 Theorem 14.1(ii) on sheaves, then proper global comparison from AI.5. The ring map is θ, not θ̃.

**Acceptance.**

- For 𝔛=Spf O_C, K_A=A_inf in degree zero and its θ-specialization is O_C=RΓ_dR(Spf O_C/O_C).
- For a proper smooth formal curve of genus g over O_C, the θ-specialization has H⁰≅O_C and, after inverting p, ranks 1, 2g, 1 in degrees 0, 1, 2.

**Direct prerequisites.** `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `AInfCohomology:AI.4`.

**Sources.**

- bms1-2019, Theorem 14.1(ii), p.118; Theorem 14.3(ii), p.120. Theorem 14.1(ii) gives AΩ_𝔛 ⊗^L_{A_inf} O ≃ Ω^{•,cont}_{𝔛/O} with continuous differentials inside a theorem 'compatible with multiplicative structures', and Theorem 14.3(ii) is the global RΓ_dR form the node uses.

Planet: Integral de Rham comparison.

Suggested signature: `CP1.theta_de_rham_specialization` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Hodge–Tate specialization and Bockstein

`CohomologyComparisons:CP.1/hodge-tate-specialization` — theorem; declaration `CP1.hodge_tate_specialization`.

The θ̃-base change of AΩ has cohomology Ω^j_{𝔛/O_C}{−j}; its Bockstein differential is the de Rham differential under the correctly twisted comparison. Preserve the cup product and the degree-j Breuil–Kisin twist. This is not the same reduction as θ-de Rham and is not automatically a split complex of untwisted forms.

**Proof plan.**

- Import AI.4’s Hodge–Tate comparison and AI.1’s Bockstein/Lη compatibility. Check dlog on torus coordinates; globalize the sheaf comparison.

**Acceptance.**

- For 𝔛=Spf O_C the θ̃-specialization is O_C in degree zero.
- On the formal torus Spf O_C⟨T^{±1}⟩, H¹ of the local θ̃-specialization is the free rank-one module on dlog T with the Breuil–Kisin twist {−1}, and the Bockstein differential sends the class of T to T·dlog T, the de Rham differential.

**Direct prerequisites.** `AInfCohomology:AI.4`, `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `AInfCohomology:AI.1/bockstein-reduction`.

**Sources.**

- bms1-2019, Theorem 8.3, p.61; Theorem 9.2(i), p.69; Proposition 6.12, p.52; Theorem 14.1 proof, p.118. Theorem 8.3 gives H^i(Ω̃_𝔛) ≅ Ω^{i,cont}_{𝔛/O}{−i}, which together with Ω̃_𝔛 ≃ AΩ_𝔛 ⊗^L_{A_inf,θ̃} O (Theorem 9.2(i)) and the Bockstein identification H^•(AΩ_𝔛/ξ̃) ≅ Ω^{•,cont}_{𝔛/O} in the proof of Theorem 14.1(ii) (via Proposition 6.12) supports the node.

Planet: Hodge–Tate comparison.

Suggested signature: `CP1.hodge_tate_specialization` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Derived Witt crystalline specialization

`CohomologyComparisons:CP.1/witt-crystalline-specialization` — theorem; declaration `CP1.witt_crystalline_specialization`.

The derived p-completed base change K_A⊗̂^L_{A_inf}W(k) identifies with RΓ_crys(𝔛_k/W(k)); locally AΩ⊗̂^L W(k) is WΩ^•. The Witt reduction has ξ↦p, and Frobenius is the de Rham–Witt/crystalline Frobenius (a target: Theorems 14.1(i)/14.3(i) do not state it; BMS1 uses it implicitly in Theorem 14.5(iii)). No ordinary tensor of H^i is claimed without Tor control in the next degree.

**Proof plan.**

- Use AI.4 Theorem 14.1(i), CR.4’s de Rham–Witt computation and AI.5 properness. Keep the derived completion in the local statement and the supplier perfectness in the global one.

**Acceptance.**

- For 𝔛=Spf O_C the Witt specialization is W(k) in degree zero, and the coefficient map sends ξ to p.
- For an elliptic curve with good reduction, H¹ of the Witt specialization is H¹_crys(E_k/W(k)), free of rank two, with its crystalline Frobenius (ordinary or supersingular).

**Direct prerequisites.** `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `CrystallineCohomology:CR.4/crystalline-comparison`, `CrystallineCohomology:CR.4/degree-scaled-frobenius`, `CrystallineCohomology:CR.4/perfectoid-base-change`.

**Sources.**

- bms1-2019, Theorem 14.1(i), p.118; Theorem 14.3(i), p.120. Theorem 14.1(i) gives AΩ_𝔛 ⊗̂^L_{A_inf} W(k) ≃ WΩ^•_{𝔛_k/W(k)} with a p-adically completed tensor, and Theorem 14.3(i) gives the proper global form RΓ_{A_inf}(𝔛) ⊗^L_{A_inf} W(k) ≃ RΓ_crys(𝔛_k/W(k)).

Planet: Integral crystalline comparison.

Suggested signature: `CP1.witt_crystalline_specialization` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Integral A_cris specialization

`CohomologyComparisons:CP.1/acris-specialization` — theorem; declaration `CP1.acris_specialization`.

For Y=𝔛_{O_C/p}, K_A⊗̂^L A_cris≃RΓ_crys(Y/A_cris). In the proper setting use the precise completed/ordinary tensor simplification supplied by perfectness, never a general assertion that derived completion is unnecessary. BMS1 states no Frobenius compatibility in Theorems 12.1 or 14.3(iii); φ-compatibility is a target checked on AI.4’s explicit maps. Multiplicativity is in the sense of commutative algebras in the derived category (BMS1 footnote 3); the E∞ form of §12.3 rests on an admitted lax symmetric monoidal Lη.

**Proof plan.**

- Import AI.4’s explicit all-coordinate PD comparison and CR.2’s PD de Rham calculation; globalize using AI.5. Retain the coefficient map through A_cris.

**Acceptance.**

- For 𝔛=Spf O_C the specialization is A_cris in degree zero, the crystalline cohomology of Spec(O_C/p) over A_cris.
- The Frobenius of the specialization is φ_{A_cris}⊗φ_{K_A}; replacing A_cris by its p-adically uncompleted PD envelope changes the base and is not this comparison.

**Direct prerequisites.** `CohomologyComparisons:CP.1/proper-ainf-input-package`, `AInfCohomology:AI.4`, `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.0/fontaine-envelope`, `CrystallineCohomology:CR.2/embedding-computation`.

**Sources.**

- bms1-2019, Theorem 12.1, p.96; Theorem 14.3(iii), p.120. Theorem 12.1 gives the canonical isomorphism AΩ_𝔛 ⊗̂_{A_inf} A_crys ≃ Ru_∗O^crys_{Y/A_crys}, and for qcqs 𝔛 the global RΓ(𝔛, AΩ_𝔛) ⊗̂_{A_inf} A_crys ≃ RΓ_crys(Y/A_crys) with Y = 𝔛 ×_{Spf O} Spec O/p.

Planet: A_cris comparison.

Suggested signature: `CP1.acris_specialization` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Étale specialization after μ inversion

`CohomologyComparisons:CP.1/mu-inverted-etale-specialization` — theorem; declaration `CP1.mu_inverted_etale_specialization`.

K_A[1/μ]≃RΓ_ét(X_C,Z_p)⊗^L_{Z_p}A_inf[1/μ] for the proper smooth formal scheme (BMS1 Theorem 14.3(iv), through the primitive comparison Theorem 5.7). Its φ-equivariance for the trivial Frobenius on étale cohomology and its multiplicativity are not stated there; they are targets checked on the local comparison of Theorem 14.1(iv) with Rν_∗A_inf,X. The same statement is not asserted for every qcqs nonproper formal scheme. Scalar extension to W(C^♭) is degreewise flat, and μ is a unit there.

**Proof plan.**

- AI.5 supplies BMS1 Theorem 14.3(iv). Use AI.0’s coefficient flatness; modulo p, ε−1 is nonzero in the field C^♭, hence μ is a Witt unit.

**Acceptance.**

- For 𝔛=Spf O_C both sides are A_inf[1/μ] in degree zero.
- For an elliptic curve E with good reduction, H¹(K_A)[1/μ] is free of rank two over A_inf[1/μ], and after base change to W(C^♭) its φ-invariants are H¹_ét(E_C,Z_p) (BMS1 Lemma 4.26).

**Direct prerequisites.** `CohomologyComparisons:CP.1/proper-ainf-input-package`, `AInfCohomology:AI.0:integral`.

**Sources.**

- bms1-2019, Theorem 14.3(iv), p.120; Lemma 4.26, p.41. Theorem 14.3(iv) states RΓ_{A_inf}(𝔛) ⊗_{A_inf} A_inf[1/µ] ≃ RΓ_ét(X, Z_p) ⊗_{Z_p} A_inf[1/µ] for proper smooth 𝔛, deduced from Theorem 14.1 and the primitive comparison Theorem 5.7.

Planet: μ-inverted étale comparison.

Suggested signature: `CP1.mu_inverted_etale_specialization` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Prismatic Frobenius pullback

`CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison` — theorem; declaration `CP1.prismatic_frobenius_pullback_comparison`.

For the bounded prism (A_inf,ker θ), identify φ*RΓ_Δ(𝔛/(A_inf,ker θ)) with K_A with its specified Frobenius and scalar maps. Track whether a source uses ker θ̃ and transport by φ rather than silently replacing the prism. The crystalline, de Rham and étale specializations of this map agree with the BMS maps under the qualified uniqueness theorem of BS22 §18. More precisely BS22 Notation 18.1 assumes a perfect prism (A,I), R=A/I, the category Sm_R of p-completely smooth R-algebras, a symmetric monoidal G:Sm_R→D_(p,I)-comp(A), and a symmetric monoidal natural transformation η:id→G⊗^L_A R. Theorem 18.2 says End(Δ_{−/A})={1} in that category; it is not uniqueness among arbitrary group isomorphisms or all maps without η. Frobenius compatibility need not be imposed separately in that uniqueness statement.

**Proof plan.**

- PR.6 owns the prismatic comparison construction. Use its φ-pullback statement and BS22 §18’s functorial hypotheses on the smooth site; equality of diagrams requires equality of natural transformations, not equality of dimensions.

**Acceptance.**

- On a framed torus the coordinate q-derivative and the specified φ-twist agree.

**Direct prerequisites.** `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `PrismaticCohomology:PR.6/ainf-omega-comparison`, `PrismaticCohomology:PR.6/comparison-uniqueness`.

**Sources.**

- bs22, Theorem 17.2, p.117 (proof pp.117–121); Notation 18.1, Theorem 18.2 and Lemma 18.3, pp.122–123. Theorem 18.2 is the uniqueness statement in the category of pairs (G, η) from Notation 18.1, and the next sentence confirms that Frobenius compatibility is not imposed, exactly as the node says.

Suggested signature: `CP1.prismatic_frobenius_pullback_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Crystalline–de Rham overlap square

`CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square` — theorem; declaration `CP1.crystalline_de_rham_overlap_square`.

Base change the A_cris comparison along θ:A_cris→O_C. Its composite with crystalline–de Rham reduction is the θ-de Rham specialization of K_A. In the W(k) specialization, crystalline reduction to k is the Frobenius-normalized base change of the de Rham complex, not the θ̃ Hodge–Tate object.

**Proof plan.**

- Write the two maps on the all-coordinate PD polynomial presentation and compare dlog generators. Apply CR.2 and the AI.4 explicit comparison, then descend; BS22 uniqueness is used only with its stated naturality hypotheses.

**Acceptance.**

- The point diagram is the actual ring triangle. The torus test compares differentials, not merely cohomology ranks.

**Direct prerequisites.** `CohomologyComparisons:CP.1/acris-specialization`, `CohomologyComparisons:CP.1/theta-de-rham-specialization`, `CohomologyComparisons:CP.1/witt-crystalline-specialization`, `CrystallineCohomology:CR.2`, `PrismaticCohomology:PR.6`, `CrystallineCohomology:CR.2/smooth-lift-filtration`, `PrismaticCohomology:PR.6/ainf-omega-comparison`, `PrismaticCohomology:PR.6/comparison-uniqueness`.

**Sources.**

- bms1-2019, Theorem 14.1 proof, pp.118–119; §12.2. The proof of Theorem 14.1 obtains the de Rham and crystalline specializations (i), (ii) from the A_crys comparison (iii) = Theorem 12.1, which is the overlap square the node records.

Suggested signature: `CP1.crystalline_de_rham_overlap_square` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Multiplication and Bockstein coherence

`CohomologyComparisons:CP.1/multiplicative-bockstein-coherence` — theorem; declaration `CP1.multiplicative_bockstein_coherence`.

For smooth BMS1 comparison maps, retain the multiplication, Frobenius and Bockstein structures through the derived diagram. Iterated scalar extension gives coherent associativity squares on the complexes; this and the Frobenius compatibility go beyond BMS1, which treats AΩ only as a commutative algebra in the derived category (footnote 3), and are targets requiring E4’s enhanced structures. Semistable analogues require their own source-qualified multiplicativity input and are not inferred from the smooth theorem.

**Proof plan.**

- Apply the multiplicative sheaf comparisons of Theorem 14.1 and the Lη/Bockstein API from AI.1. E4 supplies associativity and completion comparisons. Record the missing enhancement if an E∞ assertion is stronger than the source.

**Acceptance.**

- On the two-dimensional formal torus, dlog T₁∧dlog T₂ is the cup product of the two degree-one classes in the θ-, θ̃- and Witt specializations, and the comparison maps send products to products.
- For 𝔛=Spf O_C all structures are those of the coefficient rings A_inf, O_C and W(k) and the multiplicativity squares are the ring maps of CP.0.

**Direct prerequisites.** `AInfCohomology:AI.1`, `EnhancedDerivedSheaves:E4`, `CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square`, `AInfCohomology:AI.1/bockstein-reduction`.

**Sources.**

- bms1-2019, Theorem 14.1 opening and proof, pp.118–119. Theorem 14.1 asserts that its sheaf comparisons are 'compatible with multiplicative structures', the smooth-case multiplicativity the node imports.

Suggested signature: `CP1.multiplicative_bockstein_coherence` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Derived tensor and completion boundary

`CohomologyComparisons:CP.1/singular-and-completed-boundary` — application; declaration `CP1.singular_and_completed_boundary`.

The diagram for singular, semiperfectoid or nonproper objects is imported only with the owner’s actual derived-complete construction and its finiteness hypotheses. For smooth proper 𝔛 the preceding nodes give the entire target. A general replacement by H^i(K_A)⊗S can fail because Tor from H^{i+1} contributes; animated prismatic extensions require PR.5/PR.6 and E4, not the ordinary DerivedCategory alone.

**Proof plan.**

- Use the exact sequence for a non-zero-divisor from AI.5 and E4’s derived completion. State the broader target as the supplier-qualified specialization interface, with an explicit gap for the singular geometric comparison.

**Acceptance.**

- A complex with nonzero next-degree p-torsion produces a Tor term; the plan must not erase it.

**Direct prerequisites.** `EnhancedDerivedSheaves:E4`, `PrismaticCohomology:PR.5`, `AInfCohomology:AI.5`, `EnhancedDerivedSheaves:E4/the-imported-completion-interface`, `PrismaticCohomology:PR.5/relative-site-comparison`.

**Sources.**

- bms1-2019, Lemma 4.16, p.38; Theorems 14.1–14.3. Lemma 4.16 shows that H^i(C) ⊗ W(k) → H^i(C ⊗^L W(k)) is only injective in general and bijective when H^{i+1}(C) has no x-torsion, which is the Tor-from-H^{i+1} obstruction the node cites.

Suggested signature: `CP1.singular_and_completed_boundary` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

## CP.2. Rational crystalline comparison and descent

Comparison over O_C uses A_crys and the O_C/p fibre. The discretely valued comparison additionally transports the chosen residue-field section and the canonical B_dR⁺ lattice. AMMN’s nearby-cycle pullback is a shared CP.2/CP.3 refinement: it supplies a square in the good-reduction case, not an identification of the full nearby-cycle complex.

### Rational A_crys/B_crys comparison over O_C (BMS1 Theorem 14.5(i))

`CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C` — theorem; declaration `CP2.rational_crystalline_comparison_over_C`.

Let X be proper smooth formal over O = O_C with generic fibre X and i ≥ 0. There is a canonical isomorphism H^i_crys(X_{O/p}/A_crys) ⊗_{A_crys} B_crys ≅ H^i_ét(X,Z_p) ⊗_{Z_p} B_crys. It is compatible with the isomorphism H^i_crys(X/B_dR^+) ⊗_{B_dR^+} B_dR ≅ H^i_ét(X,Z_p) ⊗ B_dR of Theorem 13.1 via the identification H^i_crys(X_{O/p}/A_crys) ⊗_{A_crys} B_dR^+ ≅ H^i_crys(X/B_dR^+).

**Hypotheses.**

- X proper and smooth formal over O_C; C complete algebraically closed over Q_p (Remark 14.2: for Theorem 14.1, C perfectoid with all p-power roots of unity suffices).
- Input (AInfCohomology:AI.5, Theorem 14.3): RΓ_Ainf(X) ⊗^L A_crys ≃ RΓ_crys(X_{O/p}/A_crys) and RΓ_Ainf(X) ⊗ A_inf[1/μ] ≃ RΓ_ét(X,Z_p) ⊗ A_inf[1/μ]; all H^j_Ainf(X)[1/p] free.
- Normalization: A_inf → B_crys factors through A_inf[1/μ] because B_crys := A_crys[1/μ] (Definition 3.22(ii)); confirmed in the public source, so this is no longer a gap.

**Proof plan.**

- Source: 'The isomorphism in part (i) follows from Theorem 14.1' — base change the two derived comparisons of Theorem 14.3(iii),(iv) to B_crys.
- Passage to cohomology groups (reconstructed, following CP.2's instruction to use perfectness and rational flatness): B_crys = A_crys[1/μ] (Definition 3.22(ii)) is a localization of A_crys, hence A_crys-flat, so H^i(RΓ_crys(X_{O/p}/A_crys) ⊗^L_{A_crys} B_crys) = H^i_crys ⊗_{A_crys} B_crys; B_crys is Z_p-torsion-free, hence Z_p-flat, so the étale side is H^i_ét ⊗ B_crys; and H^i(RΓ_Ainf(X) ⊗^L B_crys) = H^i_Ainf(X) ⊗ B_crys because the H^j_Ainf(X)[1/p] are free (a complex over A_inf[1/p] with free cohomology is formal).
- Compatibility with the B_dR^+-lattice: the source says it 'amounts to the compatibility between the isomorphisms of Theorem 12.1 and Theorem 13.1, which one checks on the level of the explicit complexes'. The identification H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ ≅ H^i_crys(X/B_dR^+) comes from Proposition 13.23 (a natural quasi-isomorphism built from the explicit complexes of §12.2, confirmed in the public source), but the agreement of the two comparison isomorphisms is not displayed; see the CP.3 node and the corresponding gap.

**Acceptance.**

- Multiplicativity: the comparisons of Theorem 14.1 are compatible with multiplicative structures; φ acts on RΓ_Ainf(X) (Theorem 14.3), but Theorem 14.5(i) itself asserts no Frobenius compatibility and the O_C statement carries no Galois action — a Frobenius test here is a packet-authored target, not a source claim.
- Elliptic curve with good reduction over O_C, ordinary and supersingular; the trivial case X = Spf O_C.

**Direct prerequisites.** `CohomologyComparisons:CP.1/acris-specialization`, `CohomologyComparisons:CP.1/mu-inverted-etale-specialization`, `CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification`, `CrystallineCohomology:CR.3`, `mathlib:TensorProduct`.

**Sources.**

- bms1-2019, Theorem 14.5(i), pp.120–121. Theorem 14.5(i) gives the canonical B_crys isomorphism and its compatibility with the Theorem 13.1 B_dR isomorphism via H^i_crys(𝔛_{O/p}/A_crys) ⊗ B⁺_dR ≅ H^i_crys(X/B⁺_dR), exactly as the node states.

Planet: Rational crystalline comparison.

Suggested signature: `CP2.rational_crystalline_comparison_over_C` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Crystalline comparison and crystallinity of H^i_ét(X_C,Q_p) (BMS1 Theorem 14.6(i))

`CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base` — theorem; declaration `CP2.crystalline_comparison_over_discretely_valued_base`.

Let X be proper smooth formal over O_K, K complete discretely valued over Q_p with perfect residue field k, C a completed algebraic closure with Galois group G_K, X_C the geometric rigid-analytic generic fibre, i ≥ 0. There is a comparison isomorphism H^i_ét(X_C,Z_p) ⊗_{Z_p} B_crys ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} B_crys compatible with the G_K- and Frobenius actions and with the filtration; in particular H^i_ét(X_C,Q_p) is a crystalline G_K-representation.

**Hypotheses.**

- X proper smooth formal over O_K; K/Q_p complete discretely valued, k perfect.
- Inputs: Theorem 14.5(i) for X_{O_C}; Proposition 13.21 with the canonical section k → O_K/p → O_C/p; Theorem 13.1 and its agreement with Theorem 5.1 (Scholze: H^i_ét(X_C,Z_p) ⊗ B_dR ≅ H^i_dR(X/K) ⊗_K B_dR) under Remark 13.20, for the filtration.

**Proof plan.**

- Theorem 14.5(i) for X_{O_C}: H^i_crys(X_{O_C/p}/A_crys) ⊗ B_crys ≅ H^i_ét(X_C,Z_p) ⊗ B_crys.
- Proposition 13.21 with the canonical section: H^i_crys(X_{O_C/p}/A_crys)[1/p] ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} A_crys[1/p]; tensor to B_crys.
- Map-level G_K and φ compatibility: the AI.4 all-coordinate maps are equivariant for automorphisms of O_C and their Witt Frobenius; CR.3 residue-section descent is transported through the same maps. The canonical discrete-base map is invariant. Checking the exact supplier naturality statements is an open interface, not a claim based on canonicity alone.
- Filtration: the isomorphism H^i_crys(X_C/B_dR^+) ⊗ B_dR ≅ H^i_ét(X_C,Z_p) ⊗ B_dR of Theorem 13.1 is compatible with Theorem 5.1's H^i_dR(X) ⊗_K B_dR ≅ H^i_ét(X_C,Z_p) ⊗ B_dR; together with the B_dR^+-lattice compatibility in Theorem 14.5(i) this identifies the Hodge filtration. The source does not say which filtration is meant on H^i_crys(X_k/W(k)) ⊗ B_crys; composing Proposition 13.21 (canonical section), Proposition 13.23 and Remark 13.20 gives H^i_crys(X_k/W(k)) ⊗_{W(k)} B_dR^+ ≅ H^i_dR(X/K) ⊗_K B_dR^+ (packet-authored composite), which carries the Hodge filtration.
- Crystallinity (reconstructed; the source only says 'In particular'): taking G_K-invariants of the G_K-equivariant B_crys-linear isomorphism, with G_K acting trivially on H^i_crys(X_k/W(k)), gives D_crys(H^i_ét(X_C,Q_p)) = H^i_crys(X_k/W(k))[1/p] ⊗ B_crys^{G_K} = H^i_crys(X_k/W(k))[1/p] using B_crys^{G_K} = W(k)[1/p]; equality of dimensions then gives crystallinity by the period-functor formalism (PadicHodgeTheory R06.2).

**Acceptance.**

- Good-reduction elliptic curve E: D_crys(H^1_ét(E_C,Q_p)) = H^1_crys(E_k/W(k))[1/p] with its Frobenius (H^1_ét(E_C,Q_p) is the Q_p-dual of V_pE; keep the duality explicit); ordinary versus supersingular slopes.
- Frobenius compatibility must be checked with one normalization (arithmetic Frobenius on W(k), φ on A_crys) fixed in CP.0.
- The proof accepts a proper smooth formal model without a projective presentation. A separate nonprojective example computation requires a supplied formal model; no projective weak-Lefschetz hypothesis may enter this comparison proof.

**Direct prerequisites.** `CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C`, `CohomologyComparisons:CP.2/residue-section-descent-adapter`, `CohomologyComparisons:CP.3/descended-de-rham-lattice`, `CohomologyComparisons:CP.3/filtered-de-rham-comparison`, `PadicHodgeTheory:R06.2`.

**Sources.**

- bms1-2019, Theorem 14.6(i), pp.121–122. Theorem 14.6(i) states the G_K-, Frobenius- and filtration-compatible isomorphism H^i_ét(X_C,Z_p) ⊗ B_crys ≅ H^i_crys(𝔛_k/W(k)) ⊗ B_crys and the crystallinity of H^i_ét(X_C,Q_p), as in the node.

Planet: Crystalline comparison over K.

Suggested signature: `CP2.crystalline_comparison_over_discretely_valued_base` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Residue-section descent adapter

`CohomologyComparisons:CP.2/residue-section-descent-adapter` — application; declaration `CP2.residue_section_descent_adapter`.

Given the CR.3 rational base change of BMS1 Proposition 13.21, compose H_crys^i(Y/A_cris)[1/p]≃H_crys^i(X_k/W(k))⊗A_cris[1/p] with the B_cris comparison. In a discretely valued descent the map is normalized by the W(k)→O_K inclusion after the sufficiently small nilpotent reduction; record k versus its algebraic closure and every extension W(k)→W(k̄). A general choice of section does not disappear from the result.

**Proof plan.**

- Import Proposition 13.21 from CR.3 before AI.5 (avoids a cycle). For ramification e choose m with p^m≥e; O_K→O_C/p^{1/p^m} factors through k, fixing the transported map. Apply perfect-residue extension base change.

**Acceptance.**

- For k=F̄_p the section k→O_C/p is unique (BMS1 Remark 13.22), so the adapter is canonical.
- For 𝔛=𝔛₀⊗O_C with 𝔛₀ over W(k) (e=1, so m=0) the section is the reduction of W(k)→O_C and the adapter is base change along W(k)→A_cris.

**Direct prerequisites.** `CrystallineCohomology:CR.3`, `CrystallineCohomology:CR.3:Frobenius-isogeny`, `CohomologyComparisons:CP.0/ainf-specialization-dictionary`.

**Sources.**

- bms1-2019, Proposition 13.21 and Remark 13.22, p.116; Theorem 14.6 proof, p.122. For a fixed section k → O/p, Proposition 13.21 gives the canonical ϕ-equivariant isomorphism H^i_crys(Y/A_crys)[1/p] ≅ H^i_crys(Ȳ/W(k)) ⊗_{W(k)} A_crys[1/p], which the adapter composes with the B_crys comparison.

Suggested signature: `CP2.residue_section_descent_adapter` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### From derived to rational cohomology

`CohomologyComparisons:CP.2/rational-degreewise-comparison` — theorem; declaration `CP2.rational_degreewise_comparison`.

For the proper perfect K_A with H^j(K_A)[1/p] free, the rational base-change comparisons induce the stated degreewise B_cris isomorphisms. A_cris→B_cris is localization at μ, and B_cris is Z_p-flat; ordinary group tensors on these sides are justified separately. No integral equality H^i(K_A⊗^L W(k))=H^i(K_A)⊗W(k) follows from this rational argument.

**Proof plan.**

- Use AI.5 rational freeness and degeneration of the Tor spectral sequence over A_inf[1/p]; use flat localization on the crystalline side. Retain the actual map so filtered compatibility survives.

**Acceptance.**

- For an elliptic curve with good reduction the degreewise B_cris isomorphisms have ranks 1, 2, 1.
- For the BMS1 Theorem 2.1 surface over Z₂ the degree-two B_cris isomorphism holds although H²_crys has 2-torsion: the torsion dies after inverting p, so no integral statement follows.

**Direct prerequisites.** `AInfCohomology:AI.5`, `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.1/acris-specialization`, `mathlib:DerivedCategory`, `mathlib:TensorProduct`.

**Sources.**

- bms1-2019, Theorems 14.3–14.5, pp.119–121; §1.2, p.6. BMS1 passes from the derived B_crys comparison to individual cohomology groups using exactly the freeness of each H^i_{A_inf}(𝔛)[1/p], as the node does.

Suggested signature: `CP2.rational_degreewise_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Crystalline representation export

`CohomologyComparisons:CP.2/period-invariants-and-admissibility` — application; declaration `CP2.period_invariants_and_admissibility`.

For 𝔛₀/O_K proper smooth, V=H_ét^i(X_C,Q_p) is crystalline and D_cris(V) identifies φ-equivariantly with H_crys^i(X_k/W(k))[1/p]. Its K-linear filtered realization is H_dR^i(X_K/K). This consequence uses B_cris^{G_K}=K₀ and the dimension criterion from R06.2; it does not construct the period functor again.

**Proof plan.**

- Apply the G_K-equivariant comparison, take invariants using R06.1, and check dimensions by CR.3 finiteness. Transport the Hodge filtration through CP.3. Weak admissibility is supplied by the representation theorem under these hypotheses.

**Acceptance.**

- For an elliptic curve E with good reduction over O_K, D_cris(H¹_ét(E_{K̄},Q_p)) is H¹_crys(E_k/W(k))[1/p] with Frobenius slopes {0,1} (ordinary) or {1/2,1/2} (supersingular) and Hodge filtration jumps at 0 and 1; it is weakly admissible.
- For geometrically connected H⁰ the crystalline realization is K₀ with Witt Frobenius σ and filtration jump at 0; Frobenius acts trivially on the Q_p étale factor.

**Direct prerequisites.** `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `PadicHodgeTheory:R06.1`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible`.

**Sources.**

- bms1-2019, Theorem 14.6(i), p.121. Theorem 14.6(i) states that the comparison is compatible with Galois, Frobenius and filtration and that 'in particular' H^i_ét(X_C,Q_p) is crystalline, while the D_cris identification is on p.4: (H^i_ét(X_C,Z_p) ⊗ B_crys)^{G_K} = H^i_crys(𝔛_k/W(k))[1/p].

Suggested signature: `CP2.period_invariants_and_admissibility` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Good reduction examples

`CohomologyComparisons:CP.2/crystalline-geometric-examples` — application; declaration `CP2.crystalline_geometric_examples`.

For an ordinary good-reduction elliptic curve, D_cris H^1 has Newton slopes 0,1; for a supersingular elliptic curve it has slopes 1/2,1/2, while both have de Rham Hodge numbers 1,1. The comparison identifies these supplied crystalline computations with the Galois period modules. It also applies to a proper smooth formal model with nonprojective generic fibre; projectivity is absent from BMS1 Theorem 14.6.

**Proof plan.**

- Import the elliptic crystalline computations from CR.3 (its ordinary and supersingular elliptic acceptance cases) and the elliptic geometry anchor; apply the comparison without converting slopes into Hodge weights. The nonprojective acceptance is conditional on an imported actual formal example.

**Acceptance.**

- Check both Newton polygons against the same Hodge polygon; supply a specific nonprojective proper formal example before treating that test as closed.

**Direct prerequisites.** `CohomologyComparisons:CP.2/period-invariants-and-admissibility`, `CrystallineCohomology:CR.3`.

**Sources.**

- bms1-2019, Theorem 14.6, p.121. Theorem 14.6 is stated for an arbitrary proper smooth formal scheme over O_K with no projectivity hypothesis, which is the only part of this node that BMS1 supports.

Suggested signature: `CP2.crystalline_geometric_examples` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Nearby-cycle crystalline–de Rham pullback

`CohomologyComparisons:CP.2/nearby-cycle-crystalline-de-rham-pullback` — theorem; declaration `CP2.nearby_cycle_crystalline_de_rham_pullback`.

Realizes `CohomologyComparisons:CP.2`, `CohomologyComparisons:CP.3`; actual parent `CohomologyComparisons:CP.2`.

Let K⊂C be a complete mixed-characteristic discretely valued field with perfect residue field k, O_K its integers and π a uniformizer; C is complete algebraically closed. Let 𝔛₀/O_K be smooth proper, 𝔛 its completed O_C base change, X₀ its rigid generic fibre and 𝔛̄₀ its reduction modulo π. For every i≥0 there is a natural homotopy cartesian square in D(Q_p). Its upper left corner is RΓ(𝔛_proét, τ≤i Rψ_*Q_p(i)), its upper right corner is (A_crys⊗^L_{W(k)}RΓ_crys(𝔛̄₀/W(k)))^{φ=p^i}[1/p], its lower left is Fil≥i(RΓ_dR(X₀/K)⊗^L_K B_dR^+) and its lower right is RΓ_dR(X₀/K)⊗^L_K B_dR^+. The lower map is the filtration inclusion; the other maps are those transported from AMMN Theorem 6.17. The tensor filtration convolves the finite Hodge filtration and the ξ-adic period filtration. Frobenius eigenspaces mean the derived fibre of φ−p^i on the underlying Z_p-complex followed by rationalization. Truncation is inside the nearby-cycle sheaf before global sections, not a truncation of the final cohomology complex.

**Hypotheses.**

- The smooth proper good-reduction hypothesis is essential here; this does not replace the semistable or arbitrary-variety comparisons.
- The square is homotopy cartesian in the enhanced derived category. Its typed triangulated shadow is a distinguished triangle TL→TR⊕BL→BR→TL[1], using the actual comparison maps and their commutativity homotopy.

**Proof plan.**

- Import RT.3b/graded-beilinson-square on the p-torsion-free formally smooth O_C charts and descend. Theorem 7.13 uses Lemma 6.19 to replace reduction modulo p by reduction modulo π and Theorem 7.11 to identify the weight-i syntomic sheaf with τ≤i nearby cycles. Those two identifications remain precisely scoped supplier requests.
- Use crystalline/derived de Rham–Witt Künneth for 𝔛/π=𝔛̄₀⊗_k O_C/π. Smooth properness makes the crystalline factor perfect, so the tensor needs no additional p-completion. Transport the characteristic-p syntomic Frobenius-fibre formula to the upper right corner.
- Use filtered p-completed derived de Rham Künneth and Construction 7.12. The finite perfect Hodge filtration on 𝔛₀ permits Hodge completion after rationalization; Construction 7.6 identifies the coefficient factor with B_dR^+. Transport the whole square and its homotopy, not just the four object isomorphisms.

**Acceptance.**

- For i=0 retain τ≤0 Rψ_*Q_p and the derived φ=1 fibre, which can have nonzero higher cohomology even when the crystalline complex is concentrated in degree zero.
- For 𝔛₀=Spf O_K the square recovers the period fundamental fibre sequence of Theorem 7.7; the middle map is a difference of the two maps to B_dR^+.
- For a positive-dimensional smooth proper model, an i below the highest nearby-cycle degree does not identify the full étale complex; convolution with positive Hodge degrees prevents replacing Fil≥i by ξ^i times the entire de Rham complex.

**Direct prerequisites.** `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `RefinedTraceMethods:RT.3b/graded-beilinson-square`, `PrismaticCohomology:PR.4/syntomic-complex`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `CrystallineCohomology:CR.3/kunneth`, `CrystallineCohomology:CR.3/proper-perfectness`, `EnhancedDerivedSheaves:E4`, `PrismaticCohomology:PR.4`, `DerivedDeRhamCohomology:DD.2`.

**Sources.**

- ammn, Definition 7.10 and Theorem 7.11, p.52; Construction 7.12, Theorem 7.13 and proof, pp.53–54; Theorem 6.17, pp.44–45. Theorem 7.13 transports the graded Beilinson square to the four geometric corners specified here; its proof identifies nearby cycles, the Frobenius fibre and the completed tensor Hodge filtration separately.

Suggested signature: The canonical four corners and maps are owner-named imported data for the specified smooth proper model and i. The signature states commutativity and the distinguished-triangle shadow of the homotopy pullback. The enhanced commutativity homotopy and naturality remain supplier interfaces.

## CP.3. Canonical B_dR⁺ deformation and de Rham comparison

The infinitesimal construction uses very small affinoid embeddings, completion along the full embedding kernel and independence of sufficiently large choices. Spreading and degeneration give the finite free canonical lattice. The relative site uses nilpotent Zariski closed thickenings over the specified truncated base; the GR filtered prismatic agreement is listed under its actual CP.6 parent.

### Very small affinoid embeddings

`CohomologyComparisons:CP.3/very-small-affinoid-embedding` — theorem; declaration `CP3.very_small_affinoid_embedding`.

For smooth Tate C-algebra R of dimension d, choose a finite set Σ⊂R^{◦×} containing d coordinates T_i such that the map from the Laurent Tate algebra on Σ onto R is surjective and Spa(R,R◦)→T_C^d factors through rational embeddings and finite étale maps. Such very small affinoids form a basis. Enlarging Σ is a refinement, and functorial comparisons are obtained from the filtered family, rather than from one preferred torus chart.

**Proof plan.**

- BMS1 Definition 13.5 and Construction 13.6 fix the coordinate data. Import the very-small basis and the completed Tate algebra from AdicSpacesPartII and the rational étale basis from the adic site owner.

**Acceptance.**

- For a torus take its d standard unit coordinates; for a rational subdomain enlarge Σ by the invertible denominators.

**Direct prerequisites.** `AdicSpacesPartII:R0`, `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R0/smooth-toric-chart`.

**Sources.**

- bms1-2019, Definition 13.5 and Construction 13.6, p.106. Definition 13.5 defines very small R by finite {T_1,…,T_d} ⊂ Σ ⊂ (R°)^∗ with C⟨(X_u^{±1})⟩ → R surjective, and in its part (ii) Spa(R,R°) → T^d étale and a composite of rational embeddings and finite étale maps.

Suggested signature: `CP3.very_small_affinoid_embedding` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Presented infinitesimal envelope

`CohomologyComparisons:CP.3/infinitesimal-envelope` — construction; declaration `InfinitesimalEnvelope`.

For a very small R and Σ, put P_Σ=lim_n (B_dR⁺/ξ^n)⟨X_u^{±1}:u∈Σ⟩ and e:P_Σ→R, X_u↦u. Set D_Σ(R)=lim_m P_Σ/(ker e)^m, the ker(e)-adic completion, with the induced B_dR⁺-algebra structure. Its logarithmic derivations extend continuously to the completed de Rham complex. The presented completion is Mathlib AdicCompletion; the topology and Tate presentation are imported. Completion is along the full embedding ideal, not just ξ.

**Proof plan.**

- Use the ξ-complete Tate presentation and BMS1 Construction 13.6. The ideal is finitely generated by Lemma 13.4 under these hypotheses.
- Apply the pinned AdicCompletion construction. The logarithmic derivations follow by continuity from the coordinate algebra and then degreewise completion.

**Uses.**

- BMS1 Lemmas 13.12–13.13: Computes cohomology using the embedding ideal and coordinate normal form.
- Guo–Reinecke Example 10.5 and Construction 10.6: Relative Čech nerves use the same completion on each diagonal embedding.

**API.**

- `InfinitesimalEnvelope.of` (constructor): The canonical map P_Σ→D_Σ sends a to its compatible classes modulo (ker e)^m.
- `InfinitesimalEnvelope.level` (projection): The m-th projection is D_Σ→P_Σ/(ker e)^m.
- `InfinitesimalEnvelope.level_of` (simp): The m-th projection of the canonical image of a is the class of a modulo (ker e)^m.
- `InfinitesimalEnvelope.ext` (extensionality): Two envelope elements agree if their projections agree at every m.
- `InfinitesimalEnvelope.complete` (structure): If ker(e) is finitely generated, D_Σ is ker(e)-adically complete, using the P_Σ-module structure.
- `InfinitesimalEnvelope.map` (functoriality): A ring map g:P→P′ with e′∘g=e induces D(e)→D(e′), compatible with the canonical maps, with identity and composition laws; for Σ⊂Σ′ it gives the refinement maps of BMS1 Lemma 13.13.
- `InfinitesimalEnvelope.lift` (universal-property): If ker(e) is finitely generated and S is a P-algebra that is J-adically complete for an ideal J of S containing the image of ker e, the structure map P→S extends uniquely to D(e)→S.

**Unit tests.**

- `InfinitesimalEnvelope.test_point` (degenerate): For the identity presentation e:B→B, the completion along ker(e)=0 is canonically B.
- `InfinitesimalEnvelope.test_coordinate` (computation): In the presentation Q[X]→Q, X↦0, the level-two image of X is its nonzero class modulo (X)^2.
- `InfinitesimalEnvelope.test_nonzero_coordinate` (non-example): For Q[X]→Q, X↦0, the completed image of X is nonzero, even though its reduction at level one is zero; replacing completion by the quotient Q fails this test.

**Acceptance.**

- For R=C and Σ=∅, P_Σ=B_dR⁺ and e=θ, so D_Σ(C) is the ξ-adic completion of B_dR⁺, which is B_dR⁺ itself.
- For the torus R=C⟨T^{±1}⟩ and Σ={T}, ker e=ξ·P_Σ, so D_Σ(R)=P_Σ; completing only along ξ would give the wrong object as soon as Σ contains a redundant coordinate.

**Direct prerequisites.** `CohomologyComparisons:CP.3/very-small-affinoid-embedding`, `AdicSpacesPartII:R0`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.isAdicComplete`, `mathlib:AdicCompletion.eval_of`, `mathlib:AdicCompletion.ext`.

**Sources.**

- bms1-2019, Construction 13.6, p.106; Lemma 13.4, pp.105–106. Construction 13.6 defines D_Σ(R) as the completion of B⁺_dR⟨(X_u^{±1})⟩ along the full kernel I(R) of X_u ↦ u, with powers closed by Lemma 13.4, and extends the log derivations continuously.

Planet: Infinitesimal embedding envelope.

Suggested signature: `InfinitesimalEnvelope` with every API item and unit test of the packet, in the imported-data pattern (owner-named placeholder carriers where the libraries have none; Mathlib's WittVector, fontaineTheta, BDeRhamPlus, AdicCompletion where they exist). Completed by REV-CohomologyComparisons; elaborates with admitted proofs only.

### Noetherian approximation for embeddings

`CohomologyComparisons:CP.3/noetherian-approximation-interface` — application; declaration `CP3.noetherian_approximation_interface`.

At the expense of enlarging Σ (BMS1 Lemma 13.7), a very small smooth R/C descends to a smooth affinoid R_A over a smooth affinoid algebra A of a discretely valued subfield, with compatible Σ_A, étale torus coordinates and R_A⊗̂_A C≃R. The approximation uses BMS1 Lemmas 13.7–13.10: stability of a surjection under a sufficiently small perturbation, a rank-one rational neighbourhood retaining fiberwise surjectivity, and the p-power containment criterion for monic integral generators. Higher-rank neighbourhood surjectivity is excluded.

**Proof plan.**

- CP.3 owns BMS1 Lemmas 13.7–13.10 (they are routed here by the BMS1 extraction, route 8). Their proofs use étale toric charts (AdicSpacesPartII:R0/smooth-toric-chart), Tate-algebra facts of R0 and the stability of a surjection of Banach modules under small perturbation; AdicSpacesPartII R5 states none of these and is not a supplier. The descent of the chart to a discretely valued subfield is gap G-spreading-inputs.
- Apply them to the chosen torus chart as in Lemma 13.7, enlarging Σ where needed; record the rank-one point explicitly.

**Acceptance.**

- Keep the higher-rank counterexample from Lemma 13.9 as the supplier’s negative test; do not drop rank one.

**Direct prerequisites.** `AdicSpacesPartII:R0`, `CohomologyComparisons:CP.3/very-small-affinoid-embedding`, `AdicSpacesPartII:R0/smooth-toric-chart`.

**Sources.**

- bms1-2019, Lemmas 13.7–13.10, pp.106–109. Lemma 13.7 descends a very small R, after enlarging Σ, to R_A smooth over a smooth affinoid A over W(k′)[1/p] with R ≃ R_A ⊗̂_A C and compatible Σ_A, while Lemmas 13.8–13.10 are the perturbation, rank-one-neighbourhood and p^k-containment lemmas the node lists.

Suggested signature: `CP3.noetherian_approximation_interface` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Completed smooth lift over B_dR⁺

`CohomologyComparisons:CP.3/completed-smooth-lift` — theorem; declaration `CP3.completed_smooth_lift`.

For the noetherian approximation R_A/A and a chosen A→B_dR⁺ lifting A→C, the completed tensor R_A⊗̂_A B_dR⁺ is ξ-complete and flat, reduces to R, and has topologically free reductions modulo ξ^n. The tensor is formed from integral p-adic completions before inversion, as in BMS1 Lemma 13.11. A lift of A is a proof choice, not a canonical section of θ on C.

**Proof plan.**

- Import the topological tensor and Raynaud–Gruson freeness input from R0/R3; apply smoothness and the completed flat base-change lemma. Test modulo ξ^n, then use derived ξ-completeness.

**Acceptance.**

- For R_A=A=K (the point) the completed tensor is B_dR⁺ through a continuous lift K→B_dR⁺, which is unique when K has perfect residue field.
- For R_A=K⟨T^{±1}⟩ it is the ξ-adically completed B_dR⁺⟨T^{±1}⟩, flat over B_dR⁺ and reducing to C⟨T^{±1}⟩ modulo ξ.

**Direct prerequisites.** `AdicSpacesPartII:R0`, `AdicSpacesPartII:R3`, `CohomologyComparisons:CP.3/noetherian-approximation-interface`, `EnhancedDerivedSheaves:E4`, `AdicSpacesPartII:R0/differentials-unramified-smooth-etale`.

**Sources.**

- bms1-2019, Lemma 13.11, pp.109–110. Lemma 13.11 states that R_A ⊗̂_A B⁺_dR is ξ-adically complete and flat over B⁺_dR, reduces to R mod ξ, and has topologically free reductions mod ξⁿ, as the node says.

Suggested signature: `CP3.completed_smooth_lift` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Embedding envelope normal form

`CohomologyComparisons:CP.3/envelope-normal-form` — theorem; declaration `CP3.envelope_normal_form`.

For a sufficiently large Σ, D_Σ(R) identifies, after choosing lifts of its redundant coordinates, with (R_A⊗̂_A B_dR⁺)[[X_u−ũ:u∈Σ excluding {T_1,…,T_d}]]. The torus coordinates T_i lift by formal étaleness. This describes the envelope for proof purposes; the chosen ũ do not define the canonical global cohomology.

**Proof plan.**

- Follow BMS1 Lemma 13.12: lift the formally étale torus map, extend to p-complete rings of definition, then complete the redundant directions. The ordinary formal power series variables are contractible de Rham directions in characteristic zero.

**Acceptance.**

- Adding a redundant coordinate adds a formal disk to the envelope, not new cohomology.

**Direct prerequisites.** `CohomologyComparisons:CP.3/infinitesimal-envelope`, `CohomologyComparisons:CP.3/completed-smooth-lift`, `AdicSpacesPartII:R0`.

**Sources.**

- bms1-2019, Lemma 13.12, pp.110–111. Lemma 13.12(ii) gives D_Σ(R) ≅ (R_A ⊗̂_A B⁺_dR)[[(X_u − ũ)_{u∈Σ,u≠T_i}]] for sufficiently large Σ, with ũ chosen lifts, which is the node's normal form.

Suggested signature: `CP3.envelope_normal_form` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Embedding independence and de Rham reduction

`CohomologyComparisons:CP.3/embedding-independence-and-reduction` — theorem; declaration `CP3.embedding_independence_and_reduction`.

The completed de Rham complexes of D_Σ(R) are quasi-isomorphic under Σ⊂Σ′ (BMS1 Lemma 13.13). Comparing two different spreading-out lifts through a common embedding is a packet-authored step: BMS1 links D_Σ(R) to one chosen lift through D̃_Σ(R_A). Reduction modulo ξ is Ω_R/C^•; after a spreading-out choice it identifies with Ω_{R_A/A}^•⊗̂_A B_dR⁺. The transition maps are strict maps of complexes, so the limit over Σ is the coordinate-independent presheaf of BMS1 Definition 13.14.

**Proof plan.**

- Use the double-envelope diagram of Lemma 13.13. Formal disks are de Rham contractible over Q_p (division by positive integers); first check modulo ξ, then apply derived ξ-Nakayama to the complete complexes.

**Acceptance.**

- On the very small torus, enlarging Σ={T} to Σ′={T,T²} adds one formal variable, D_{Σ′}≅D_Σ[[X_{T²}−X_T²]], and the refinement map of completed de Rham complexes is a quasi-isomorphism.
- Modulo ξ both complexes reduce to Ω^•_{C⟨T^{±1}⟩/C}.

**Direct prerequisites.** `EnhancedDerivedSheaves:E4`, `CohomologyComparisons:CP.3/envelope-normal-form`, `AdicSpacesPartII:R0`, `EnhancedDerivedSheaves:E4/mod-ideal-detection`.

**Sources.**

- bms1-2019, Lemma 13.13 and Definition 13.14, pp.111–112. Lemma 13.13 shows that the envelope de Rham complex reduces mod ξ to Ω^•_{R/C} and is quasi-isomorphic to Ω^•_{R_A/A} ⊗̂_A B⁺_dR, hence independent of Σ, which Definition 13.14 uses to form the filtered colimit.

Planet: Embedding-independent de Rham complex.

Suggested signature: `CP3.embedding_independence_and_reduction` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Spreading out proper smooth rigid spaces

`CohomologyComparisons:CP.3/proper-formal-spreading` — application; declaration `CP3.proper_formal_spreading`.

For a proper smooth rigid X/C, choose a proper smooth family over a smooth rigid base S over a discretely valued subfield K⊂C with X as its C-valued fibre. The construction uses the noetherian descent of a proper flat formal model (BMS1 Proposition 13.15) over a complete noetherian local ring, then Corollary 13.16 and smooth neighbourhoods. Keep proper flat descent separate from the subsequent smooth shrinking.

**Proof plan.**

- CP.3 owns BMS1 Proposition 13.15 and Corollary 13.16 (route 8 of the BMS1 extraction). Formal models and admissible blow-ups come from AdicSpacesPartII R2 (R2/raynaud-theorem, R2/admissible-blow-up); algebraization and effectivity of the formal deformation from R09.6. Apply Proposition 13.15’s induction on artinian thickenings and Corollary 13.16.
- The deformation theory of a proper flat formal scheme over a complete noetherian local ring used in that induction has no supplier in the atlas: gap G-spreading-inputs.

**Acceptance.**

- This is a proper rigid statement; a projective polarization is not added.

**Direct prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.6`, `AdicSpacesPartII:R2/raynaud-theorem`, `AdicSpacesPartII:R2/admissible-blow-up`.

**Sources.**

- bms1-2019, Proposition 13.15 and Corollary 13.16, pp.112–113. Corollary 13.16 ends by realizing every proper smooth rigid space over C as a fibre of a proper smooth morphism of smooth rigid spaces over a discretely valued subfield, built from the formal-model descent of Proposition 13.15.

Suggested signature: `CP3.proper_formal_spreading` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Canonical B_dR⁺ cohomology

`CohomologyComparisons:CP.3/canonical-bdr-cohomology` — construction; declaration `CanonicalBdrCohomology`.

For a proper smooth adic X/C define K_dR⁺(X)=RΓ(X_very-small, Ω_X/B_dR⁺^•), where Ω_X/B_dR⁺^• is the filtered colimit of the completed envelope de Rham complexes over sufficiently large Σ (BMS1 Definition 13.18). The colimit is independent of embeddings by the previous comparison. This gives a derived ξ-complete perfect B_dR⁺ complex with K_dR⁺(X)⊗^L C≃RΓ_dR(X/C); its construction makes no choice of a lift X to B_dR⁺.

**Proof plan.**

- Use the very-small basis and Lemma 13.13 to form the presheaf and derived global sections. Reduction is de Rham cohomology; proper finiteness plus derived ξ-Nakayama gives perfectness, as in Definition 13.18.

**Uses.**

- BMS1 Theorems 13.1,13.19: Provides the canonical finite free lattice in the rational étale comparison.
- CK Proposition 6.8 and CP.5 lattice recovery: Fixes the B_dR⁺ lattice used in BKF classification.

**API.**

- `CanonicalBdrCohomology.affinoid` (characterisation): On a very small affinoid, the presheaf complex is the colimit of Ω_DΣ/B_dR⁺^• with the Lemma 13.13 refinement quasi-isomorphisms.
- `CanonicalBdrCohomology.map` (functoriality): A morphism f:X→Y gives K_dR⁺(Y)→K_dR⁺(X); common embedding refinements prove identity and composition laws.
- `CanonicalBdrCohomology.theta` (compatibility): K_dR⁺(X)⊗^L C≃RΓ_dR(X/C), using the canonical quotient B_dR⁺→C.
- `CanonicalBdrCohomology.complete` (structure): K_dR⁺(X) is derived ξ-complete and perfect for proper smooth X.
- `CanonicalBdrCohomology.independent` (equivalence): Two sufficiently large embedding systems yield the same object through canonical quasi-isomorphisms satisfying the refinement cocycle law.

**Unit tests.**

- `CanonicalBdrCohomology.test_point` (degenerate): K_dR⁺(Spa C)=B_dR⁺ concentrated in degree zero.
- `CanonicalBdrCohomology.test_projective_line` (computation): For P¹_C, H⁰ and H² are free rank one over B_dR⁺ and H¹=0; their θ-reductions are the corresponding C de Rham groups.
- `CanonicalBdrCohomology.test_redundant_embedding` (compatibility): On a very small torus, adjoining a redundant unit to Σ induces the Lemma 13.13 quasi-isomorphism and isomorphisms in every cohomological degree; this test makes no finite-rank assertion for the affinoid de Rham groups.

**Acceptance.**

- For X=Spa C the complex is B_dR⁺ in degree zero, with no chosen section C→B_dR⁺.
- For P¹_C the cohomology is free of rank one in degrees 0 and 2 and zero in degree 1, reducing modulo ξ to H_dR(P¹_C/C).

**Direct prerequisites.** `CohomologyComparisons:CP.3/embedding-independence-and-reduction`, `AdicEtaleGeometry:A1`, `EnhancedDerivedSheaves:E4`, `AdicSpacesPartII:R3`, `AdicSpacesPartII:R3/proper-affinoid-cohomology-finite`.

**Sources.**

- bms1-2019, Definition 13.18, p.114. Definition 13.18 defines RΓ_crys(X/B⁺_dR) as the hypercohomology of U ↦ C^•_crys(U/B⁺_dR) (the Σ-colimit of Definition 13.14) on very small affinoids, and the lines after it give ⊗^L_{B⁺_dR} C ≅ RΓ_dR(X), derived ξ-completeness and perfectness.

Planet: Canonical B_dR⁺ cohomology.

Suggested signature: `CanonicalBdrCohomology` with every API item and unit test of the packet, in the imported-data pattern (owner-named placeholder carriers where the libraries have none; Mathlib's WittVector, fontaineTheta, BDeRhamPlus, AdicCompletion where they exist). Completed by REV-CohomologyComparisons; elaborates with admitted proofs only.

### Finite freeness of B_dR⁺ cohomology

`CohomologyComparisons:CP.3/bdr-cohomology-finite-freeness` — theorem; declaration `CP3.bdr_cohomology_finite_freeness`.

For proper smooth X/C, every H^i(K_dR⁺(X)) is finite free over B_dR⁺. Reduction to C commutes with cohomology and identifies H^i with H_dR^i(X/C); dimensions give the common rank. Freeness comes from proper smooth spreading out and relative de Rham cohomology with integrable connection, not merely from perfectness of the complex.

**Proof plan.**

- Use Corollary 13.16 to spread X; relative de Rham cohomology is locally free by its integrable connection. Pull back along a chosen lift A→B_dR⁺ and use the embedding-independent comparison. Derived ξ-Nakayama identifies the complexes, proving Theorem 13.19.

**Acceptance.**

- For a proper smooth curve of genus g over C the cohomology is free over B_dR⁺ of ranks 1, 2g, 1; for an abelian variety of dimension g, H^i is free of rank C(2g,i).
- Perfectness alone would allow a torsion module such as B_dR⁺/ξ in some degree; the spreading-out argument excludes it.

**Direct prerequisites.** `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/proper-formal-spreading`, `CohomologyComparisons:CP.3/completed-smooth-lift`, `AdicSpacesPartII:R3`.

**Sources.**

- bms1-2019, Theorem 13.19, p.114. Theorem 13.19 states that H^i_crys(X/B⁺_dR) is finite free over B⁺_dR for all i, and its proof uses spreading out (Corollary 13.16) and local freeness of R^i f_dR∗O_𝒳 from its integrable connection, as the node says.

Planet: B_dR⁺ cohomology finite freeness.

Suggested signature: `CP3.bdr_cohomology_finite_freeness` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Local B_dR period comparison map

`CohomologyComparisons:CP.3/local-bdr-etale-map` — theorem; declaration `CP3.local_bdr_etale_map`.

For a very small X=Spa(R,R◦) and Σ, adjoining compatible p-power roots of all u∈Σ gives a perfectoid tower with Γ=∏_Σ Z_p(1). The degree-zero map D_Σ(R)→B_dR⁺(R_∞,Σ) sends X_u to [u^♭]. The normalized maps of completed logarithmic de Rham and Γ-Koszul complexes identify Ω_DΣ/B_dR⁺^• with η_ξ of the period Koszul complex. After ξ inversion this is the local comparison quasi-isomorphism.

**Proof plan.**

- Use the actual exponential/Koszul normalization from AI.4 §12.2, not an unscaled identification ∂logX=γ−1. The BMS1 Theorem 13.1 proof repeats Proposition 12.9. Perfectoid acyclicity and continuous group cohomology are early site/period inputs.

**Acceptance.**

- On X_u the map is Teichmüller [u^♭]; on dlog X_u the scale is the specified logarithmic period.

**Direct prerequisites.** `AInfCohomology:AI.4`, `CohomologyComparisons:CP.3/infinitesimal-envelope`, `AInfCohomology:AI.1`, `PadicHodgeTheory:P8:local-rational`, `AdicEtaleGeometry:A1`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`.

**Sources.**

- bms1-2019, Theorem 13.1 proof, p.115; Proposition 12.9. In the proof of Theorem 13.1, the degree-0 map D_Σ(R) → B⁺_dR(R_∞,Σ) induces a quasi-isomorphism Ω^•_{D_Σ(R)/B⁺_dR} ≃ η_ξ K_{B⁺_dR(R_∞,Σ)}((γ_u − 1)_{u∈Σ}), 'completely analogous to the proof of Proposition 12.9'.

Suggested signature: `CP3.local_bdr_etale_map` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Canonical de Rham period comparison

`CohomologyComparisons:CP.3/canonical-bdr-etale-comparison` — theorem; declaration `CP3.canonical_bdr_etale_comparison`.

For proper smooth X/C, the natural map K_dR⁺(X)→RΓ(X_proét,B_dR⁺) becomes a quasi-isomorphism after ξ inversion; proper primitive finiteness identifies the target with RΓ_ét(X,Z_p)⊗^L B_dR. Hence H^i(K_dR⁺(X))⊗B_dR≃H_ét^i(X,Z_p)⊗B_dR. Over C, BMS1 Theorem 13.1 establishes the underlying comparison; its filtered enhancement is stated separately with CN Theorem 6.8.

**Proof plan.**

- Globalize the strictly functorial local maps, use ξ inversion and the early primitive/global period input. The dependency is on P8:local-rational plus a recorded early primitive owner gap, never on the late P8 global theorem that consumes CP.3.

**Acceptance.**

- For P¹_C the comparison in degree two identifies two B_dR-lines; the lattices H²(K_dR⁺(P¹)) and H²_ét(P¹,Z_p)⊗B_dR⁺ differ by a power of t, so the isomorphism needs ξ inverted.
- For an elliptic curve the comparison identifies two free rank-two B_dR-modules in degree one.

**Direct prerequisites.** `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/local-bdr-etale-map`, `PadicHodgeTheory:P8:local-rational`.

**Sources.**

- bms1-2019, Theorem 13.1 and proof, pp.104,115. Theorem 13.1 gives the canonical isomorphism H^i_crys(X/B⁺_dR) ⊗ B_dR ≅ H^i_ét(X,Z_p) ⊗ B_dR for proper smooth X/C, and its proof (p.115) builds RΓ_crys(X/B⁺_dR) → RΓ(X_proét, B⁺_dR,X) ≅ RΓ_ét(X,Z_p) ⊗ B⁺_dR and inverts ξ.

Planet: Canonical de Rham comparison.

Suggested signature: `CP3.canonical_bdr_etale_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Descended de Rham lattice

`CohomologyComparisons:CP.3/descended-de-rham-lattice` — theorem; declaration `CP3.descended_de_rham_lattice`.

If X=X₀⊗̂_K C for X₀/K proper smooth and K complete discretely valued with perfect residue field (the hypothesis of BMS1 Theorem 13.1), H^i(K_dR⁺(X))≃H_dR^i(X₀/K)⊗_K B_dR⁺ via the continuous lift K→B_dR⁺. After inversion the canonical comparison agrees with the early local-period Poincaré comparison of Scholze/BMS1 Theorem 5.1. The equality is equality of comparison maps through a common envelope, not an arbitrary matching of two free modules.

**Proof plan.**

- Use Remark 13.20. In the final diagram of the Theorem 13.1 proof compare D_Σ(R)→D̃_Σ(R_K)←R_K⊗̂B_dR⁺ above B_dR⁺(R_∞)→OB_dR⁺(R_∞)←R_K⊗̂B_dR⁺. The corrected structural sheaf uses p-completion before ker θ completion.

**Acceptance.**

- For P¹_K the trace-normalized generator gives the same rational comparison in both diagrams.

**Direct prerequisites.** `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/embedding-independence-and-reduction`, `CohomologyComparisons:CP.3/canonical-bdr-etale-comparison`, `PadicHodgeTheory:P8:local-rational`.

**Sources.**

- bms1-2019, Remark 13.20, p.114; Theorem 13.1 proof diagram, p.115. Remark 13.20 gives the canonical identification H^i_dR(X_0/K) ⊗_K B⁺_dR ≃ H^i_crys(X/B⁺_dR) via the continuous lift K → B⁺_dR, and the diagram in the proof of Theorem 13.1 (p.115) gives the agreement with Theorem 5.1.

Suggested signature: `CP3.descended_de_rham_lattice` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Filtered de Rham comparison over K

`CohomologyComparisons:CP.3/filtered-de-rham-comparison` — theorem; declaration `CP3.filtered_de_rham_comparison`.

For proper smooth X₀/K, the rational comparison H_ét^i(X_C,Q_p)⊗B_dR≃H_dR^i(X₀/K)⊗B_dR is G_K-equivariant and strict for the tensor product Hodge/period filtrations. On the étale side the filtration is the period filtration; on the de Rham side Fil^r is the sum of Fil^a H_dR⊗Fil^{r−a}B_dR. The equality with the canonical B_dR⁺ deformation is the preceding map comparison.

**Proof plan.**

- The early P8 local-rational period sheaf Poincaré lemma supplies the filtered local map. Globalize using proper finiteness and the descended envelope diagram. Strictness means the inverse also preserves Fil^r, rather than mere filtration preservation; Scholze’s Theorem 8.4 states only "preserving filtrations", and strictness comes from its proof (the map is a quasi-isomorphism in the filtered derived category, checked on graded pieces).

**Acceptance.**

- Q_p(1) has HT weight +1; its period-invariant generator t⁻¹e lies in Fil^{-1}, fixing the sign.

**Direct prerequisites.** `CohomologyComparisons:CP.3/descended-de-rham-lattice`, `PadicHodgeTheory:P8:local-rational`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`.

**Sources.**

- sch13, Theorem 8.4, p.48, and its proof, pp.47–48; BMS1 Theorem 5.1 and Theorem 13.1 proof. Theorem 8.4 gives the Galois-equivariant isomorphism H^i(X_k̄,L)⊗B_dR ≅ H^i_dR(X,E)⊗_k B_dR 'preserving filtrations' for proper smooth X over a discretely valued k. With L = Ẑ_p this is the node's filtered de Rham comparison.

Suggested signature: `CP3.filtered_de_rham_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Hodge–de Rham degeneration

`CohomologyComparisons:CP.3/hodge-de-rham-degeneration` — theorem; declaration `CP3.hodge_de_rham_degeneration`.

For proper smooth rigid X/C in characteristic zero, E₁^{a,b}=H^b(X,Ω_X^a)⇒H_dR^{a+b}(X/C) degenerates at E₁. Over a discretely valued descent this follows from the filtered period comparison; the general C case follows by proper smooth spreading out and constancy of relative cohomology ranks. No integral or positive-characteristic degeneration is asserted.

**Proof plan.**

- Follow Theorem 13.3(i): shrink the spreading base so the coherent cohomology and base changes are locally free; test rank equality on classical points using Scholze’s de Rham comparison. Then specialize to the given C-point.

**Acceptance.**

- For a proper smooth curve of genus g, dim H¹_dR=2g=h^{1,0}+h^{0,1}; for an abelian variety, dim H^n_dR=Σ_{a+b=n} h^{a,b}.

**Direct prerequisites.** `CohomologyComparisons:CP.3/proper-formal-spreading`, `CohomologyComparisons:CP.3/filtered-de-rham-comparison`, `AdicSpacesPartII:R3`.

**Sources.**

- bms1-2019, Theorem 13.3(i) and proof, pp.104,116. Theorem 13.3(i) (credited to Conrad–Gabber) states E_1-degeneration of H^j(X,Ω^i_{X/C}) ⇒ H^{i+j}_dR(X) for proper smooth X/C, and its proof (p.116) spreads out and checks ranks at classical points via [58, Corollary 1.8].

Suggested signature: `CP3.hodge_de_rham_degeneration` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Hodge–Tate degeneration

`CohomologyComparisons:CP.3/hodge-tate-degeneration` — theorem; declaration `CP3.hodge_tate_degeneration`.

For proper smooth X/C, E₂^{a,b}=H^a(X,Ω_X^b)(−b)⇒H_ét^{a+b}(X,Q_p)⊗C degenerates at E₂. The source convention (−b) is translated through HT(χ_p)=+1. The dimension equality follows from the finite free canonical B_dR⁺ lattice and Hodge–de Rham degeneration; it does not imply a canonical splitting for every descended family.

**Proof plan.**

- BMS1 Theorem 13.3(ii): de Rham dimensions equal the sum of Hodge dimensions; canonical B_dR comparison equates them to étale dimensions. Apply the supplied Hodge–Tate spectral sequence.

**Acceptance.**

- For an abelian variety A/C of dimension g, dim_{Q_p}H¹_ét(A,Q_p)=2g=dim H¹(A,O)+dim H⁰(A,Ω¹).
- Degeneration gives equality of dimensions, not a canonical splitting of the filtration over C.

**Direct prerequisites.** `CohomologyComparisons:CP.3/hodge-de-rham-degeneration`, `CohomologyComparisons:CP.3/bdr-cohomology-finite-freeness`, `CohomologyComparisons:CP.3/canonical-bdr-etale-comparison`, `PadicHodgeTheory:P8:local-rational`.

**Sources.**

- bms1-2019, Theorem 13.3(ii) and proof, pp.105,116. Theorem 13.3(ii) states E_2-degeneration of H^i(X,Ω^j_{X/C})(−j) ⇒ H^{i+j}_ét(X,Z_p) ⊗ C, and its proof equates de Rham dimension with the rank of the free B⁺_dR-lattice and, via Theorem 13.1, with étale dimension.

Planet: Hodge–Tate spectral sequence degeneration.

Suggested signature: `CP3.hodge_tate_degeneration` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### The canonical B_dR^+-lattice in the good-reduction case

`CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification` — theorem; declaration `CP3.good_reduction_bdr_lattice_identification`.

For proper smooth formal 𝔛/O_C and Y=𝔛_{O_C/p}, there is a natural quasi-isomorphism RΓ_crys(Y/A_cris)⊗^L_{A_cris}B_dR⁺≃K_dR⁺(X_C). Its degreewise map is H_crys^i(Y/A_cris)⊗B_dR⁺≃H^i(K_dR⁺(X_C)); use CR.3 Proposition 13.21 rational freeness to justify this passage. This identifies the canonical deformation lattice. Agreement with the B_cris/étale map is a separate downstream comparison.

**Proof plan.**

- BMS1 Proposition 13.23 compares explicit PD de Rham complexes with the embedding envelopes of §13. On smooth lifts both are the same completed de Rham complex. Globalize and use rational crystalline freeness to pass to H^i.

**Acceptance.**

- The lattice is not an arbitrary free B_dR^+-lattice: it is determined by the A_crys-crystalline cohomology of X_{O/p} (good reduction) or by H^i_dR(X_0) (descent case).
- The identification must be compatible with Fargues' pair for H^i_Ainf(X) (used in Theorem 14.5(iii)).
- Finite freeness of H^i_crys(X/B_dR^+) over B_dR^+ (Theorem 13.19; in the good-reduction case also Proposition 13.23 with Proposition 13.21), so that it is a lattice in the sense of Theorem 4.28.

**Direct prerequisites.** `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/infinitesimal-envelope`, `AInfCohomology:AI.4`, `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.3`.

**Sources.**

- bms1-2019, Proposition 13.23, p.117. Proposition 13.23 gives the natural quasi-isomorphism RΓ_crys(Y/A_crys) ⊗_{A_crys} B⁺_dR ≅ RΓ_crys(X/B⁺_dR) and freeness of H^i_crys(X/B⁺_dR), and the line before it records that H^i_crys(Y/A_crys) ⊗ B⁺_dR is finite free.

Suggested signature: `CP3.good_reduction_bdr_lattice_identification` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Agreement of integral and rational period maps

`CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement` — theorem; declaration `CP3.integral_rational_bdr_map_agreement`.

After B_dR extension, the BMS1 A_inf→A_cris→B_cris/étale comparison and the canonical §13 de Rham/étale comparison coincide under Proposition 13.23. BMS1 only says the check is made on the level of the explicit complexes; verifying it on the common all-coordinate tower via X_u↦[u^♭] and the normalized logarithmic Koszul maps is a packet-authored reconstruction (gap G-map-agreement). It also matches the early local de Rham sheaf comparison when X descends to K.

**Proof plan.**

- Compare the degree-zero ring maps and the explicit comparison operators of §12.2 and the proof of Theorem 13.1. Theorem 14.5(i) cites this check without a full diagram; the map-level supplier API and homotopy coherence still need refinement.

**Acceptance.**

- Check the diagram on a torus, including the degree-one normalization; equal scalar rings or ranks do not suffice.

**Direct prerequisites.** `CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification`, `CohomologyComparisons:CP.3/local-bdr-etale-map`, `AInfCohomology:AI.4`.

**Sources.**

- bms1-2019, Theorem 14.5(i) proof, p.121; Theorem 13.1 proof, p.115. The proof of Theorem 14.5(i) reduces the B⁺_dR-lattice compatibility to the agreement of the Theorem 12.1 and Theorem 13.1 isomorphisms 'which one checks on the level of the explicit complexes', which is the agreement this node records.

Suggested signature: `CP3.integral_rational_bdr_map_agreement` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Relative B_dR⁺ infinitesimal site

`CohomologyComparisons:CP.3/relative-infinitesimal-site` — definition; declaration `RelativeInfinitesimalSite`.

For a smooth morphism of smooth formal O_K-schemes f:X→Y and the specified O_K→B_dR⁺, define X/Y_B_dR⁺,inf as in Guo–Reinecke Definition 10.1. An object is (U,T), U open in X_C, T topologically finite type over Y_{B_dR⁺/I^e} for some e, and a Zariski closed immersion U→T defined by a nilpotent ideal, compatible with the maps to Y. Morphisms are compatible maps of thickenings and open immersions on U; covers are simultaneous analytic covers of U and T. O_inf(U,T)=Γ(T,O_T). Generic crystals and their cartesian condition are imported from the crystalline/sheaf owners.

**Proof plan.**

- Use the imported adic spaces and completed base changes. Organize the pairs, morphisms and analytic coverage of Definition 10.1; the structure sheaf is evaluation on T.
- Increasing e gives compatible thickenings. The nilpotent lifting property of smooth ambient spaces proves the weakly final envelope statement, used below.

**Uses.**

- GR Theorem 10.7 and Corollary 10.9: Computes relative infinitesimal cohomology using crystals and envelopes.
- GR Propositions 10.10–10.11: Receives the crystalline-to-infinitesimal coefficient comparison.

**API.**

- `RelativeInfinitesimalSite.object` (constructor): An open U, a finite-level T and a nilpotent closed immersion U→T over the specified base give an object.
- `RelativeInfinitesimalSite.morphism` (data): Morphisms are compatible adic maps on T and open immersions on U, with identity and composition inherited from adic spaces.
- `RelativeInfinitesimalSite.structureSheaf` (projection): The structure sheaf evaluates a thickening at Γ(T,O_T), compatibly with restrictions.
- `RelativeInfinitesimalSite.baseChange` (functoriality): A compatible base change Y′→Y induces the pullback comparison on the corresponding relative thickenings and cartesian crystals.
- `RelativeInfinitesimalSite.envelope` (characterisation): The ind-system of infinitesimal neighbourhoods in a smooth ambient Z over Y_K is weakly final; its self-products are the diagonal embedding envelopes of GR Lemma 10.3.

**Unit tests.**

- `RelativeInfinitesimalSite.test_point` (degenerate): For X_C=Spa C over the point, its structure-sheaf cohomology is B_dR⁺ in degree zero, as computed by the canonical envelope.
- `RelativeInfinitesimalSite.test_identity` (computation): For an identity smooth relative morphism, the relative de Rham complex in an ambient lift has only degree zero; the Čech envelope computation agrees.
- `RelativeInfinitesimalSite.test_base` (non-example): A nilpotent thickening T with no map to the specified Y_{B_dR⁺/I^e} is not an object, even if it is an absolute B_dR⁺ thickening.

**Acceptance.**

- For f=id_X the relative de Rham complex is the structure sheaf in degree zero, so the infinitesimal cohomology of O_inf is that of the base thickening.
- For Y=Spf O_K the site recovers the absolute B_dR⁺ infinitesimal site of X_C used by Guo.

**Direct prerequisites.** `AdicSpacesPartII:R0`, `AdicEtaleGeometry:A1`, `CrystallineCohomology:CR.1`, `CrystallineCohomology:CR.1/crystal`.

**Sources.**

- gr, Definition 10.1, p.94. Definition 10.1 defines the objects of the relative B_dR^+ infinitesimal site exactly as the node describes: open U ⊂ X_C, T topologically of finite type over Y_{B_dR,e}^+, and a nilpotent closed immersion U → T.

Suggested signature: `RelativeInfinitesimalSite` with every API item and unit test of the packet, in the imported-data pattern (owner-named placeholder carriers where the libraries have none; Mathlib's WittVector, fontaineTheta, BDeRhamPlus, AdicCompletion where they exist). Completed by REV-CohomologyComparisons; elaborates with admitted proofs only.

### Relative Čech–de Rham comparison

`CohomologyComparisons:CP.3/relative-cech-de-rham-comparison` — theorem; declaration `CP3.relative_cech_de_rham_comparison`.

For a vector-bundle crystal F on X/Y_B_dR⁺,inf and a smooth ambient embedding, the Čech–Alexander complex of the weakly final envelope and the completed relative de Rham complex of F on that envelope both compute RΓ_inf(X/Y_B_dR⁺,F). In the formal affine smooth setting of GR Convention 10.4, the canonical lift and enlarged Laurent framing give the natural equivalences of Corollary 10.8.

**Proof plan.**

- Use Lemma 10.3 to compute by the Čech nerve. GR Construction 10.6 and Theorem 10.7 compare the two complexes through a double complex; contraction of formal power-series de Rham directions is Guo Lemma 4.1.10. Do not confuse weak finality with a single final thickening.

**Acceptance.**

- On an enlarged framing, deleting redundant formal coordinates is a quasi-isomorphism of both Čech and de Rham models.

**Direct prerequisites.** `CohomologyComparisons:CP.3/relative-infinitesimal-site`, `CohomologyComparisons:CP.3/infinitesimal-envelope`, `CrystallineCohomology:CR.2`, `EnhancedDerivedSheaves:E4`, `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/smooth-lift-filtration`.

**Sources.**

- gr, Construction 10.6 and Theorem 10.7, pp.95–96; Corollary 10.8, p.97. Theorem 10.7 builds the double complex whose total complex is isomorphic both to the Čech–Alexander complex and to the de Rham complex on the envelope. That is the node's claim that both compute RΓ_inf.

Suggested signature: `CP3.relative_cech_de_rham_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Relative infinitesimal perfectness

`CohomologyComparisons:CP.3/relative-infinitesimal-perfectness` — theorem; declaration `CP3.relative_infinitesimal_perfectness`.

For a proper smooth f:X→Y of smooth formal O_K-schemes with Y=Spf R and a vector-bundle crystal F on the relative infinitesimal site, RΓ_inf(X/Y_B_dR⁺,F) is a perfect R_{B_dR⁺}-complex. Its derived I-reduction is the relative de Rham cohomology of the associated vector bundle with flat connection on X_C/Y_C. This gives perfectness, not an unconditional statement that all higher direct images are free.

**Proof plan.**

- GR Corollary 10.9: proper smooth relative de Rham cohomology is perfect; I-completeness and the derived Nakayama criterion lift perfectness. Preserve the completed tensor defining R_{B_dR⁺}.

**Acceptance.**

- For f=id the complex is the base ring in degree zero.
- For a proper smooth relative curve of genus g, the derived I-reduction is relative de Rham cohomology, locally free of ranks 1, 2g, 1 with its Gauss–Manin connection.

**Direct prerequisites.** `CohomologyComparisons:CP.3/relative-cech-de-rham-comparison`, `EnhancedDerivedSheaves:E4`, `AdicSpacesPartII:R3`.

**Sources.**

- gr, Corollaries 10.8–10.9, p.97. Corollary 10.9 states verbatim that RΓ_inf is a perfect R_{B_dR^+}-complex for smooth proper X → Y. The preceding sentence is the I-completeness argument the node uses.

Suggested signature: `CP3.relative_infinitesimal_perfectness` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Crystalline-to-infinitesimal coefficient functor

`CohomologyComparisons:CP.3/crystalline-to-infinitesimal-coefficients` — comparison; declaration `CP3.crystalline_to_infinitesimal_coefficients`.

For the smooth relative setup, there is a natural functor D_perf(X_{p=0,crys})→D_perf(X/Y_B_dR⁺,inf), restricting from vector-bundle crystals to vector-bundle crystals. On an enlarged framing its value is E′(D_pd,Σ^n)⊗^L_{D_pd,Σ^n}D_Σ^n. The ring map is obtained by p-inversion followed by completion along the embedding ideal, and the cartesian crystal condition provides Čech descent.

**Proof plan.**

- GR Proposition 10.10 constructs maps D_pd,Σ→D_Σ by finite divided-power truncations, then passes to inverse limits. Apply the crystal condition on the Čech envelope to globalize, rather than choosing lifts of each coefficient.

**Acceptance.**

- A rank-one trivial crystal becomes the structure-sheaf crystal; the construction commutes with a change of enlarged framing.

**Direct prerequisites.** `CrystallineCohomology:CR.0`, `CohomologyComparisons:CP.3/relative-cech-de-rham-comparison`, `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.0/fontaine-envelope`.

**Sources.**

- gr, Proposition 10.10 and proof, pp.97–98. Proposition 10.10 states the natural functor D_perf(X_{p=0,crys}) → D_perf(X/Y_{B_dR^+},inf) that preserves vector-bundle crystals, as in the node.

Suggested signature: `CP3.crystalline_to_infinitesimal_coefficients` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Relative crystalline–infinitesimal base change

`CohomologyComparisons:CP.3/relative-crystalline-infinitesimal-base-change` — comparison; declaration `CP3.relative_crystalline_infinitesimal_base_change`.

In GR Convention 10.4 for a vector-bundle crystalline crystal E′ and its image F, crystalline cohomology over R, crystalline cohomology over R_Acrys, and infinitesimal cohomology over R_B_dR⁺ identify after the specified completed B_dR⁺ base change. The induced connections agree: ∇_inf is the ker θ̃_K-completion of ∇_crys[1/p]. This is the comparison of equation (36), not a blanket uncompleted base-change assertion.

**Proof plan.**

- Use the two Čech–Alexander/de Rham computations of Proposition 10.11 and the same double complex. Evaluate at degree zero and one of the diagonal envelope to identify connections; properness is used only for the subsequent finite perfect outputs.

**Acceptance.**

- For the trivial crystal, the comparison identifies crystalline cohomology over R_{A_crys} after completed B_dR⁺ base change with the infinitesimal cohomology of O_inf.
- The induced connection on the trivial crystal is the completion of the trivial connection d; a nontrivial connection is transported, not replaced by d.

**Direct prerequisites.** `CohomologyComparisons:CP.3/crystalline-to-infinitesimal-coefficients`, `CohomologyComparisons:CP.3/relative-cech-de-rham-comparison`, `CrystallineCohomology:CR.3`, `EnhancedDerivedSheaves:E4`, `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.3/proper-perfectness`.

**Sources.**

- gr, Proposition 10.11, pp.98–99, equation (36). The proof of Proposition 10.11 identifies ∇_inf with the ker θ̃_K-completion of ∇_crys[1/p] and concludes that the completed base change of crystalline cohomology gives infinitesimal cohomology. This is the node's (36) comparison.

Suggested signature: `CP3.relative_crystalline_infinitesimal_base_change` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Absolute and relative infinitesimal agreement

`CohomologyComparisons:CP.3/absolute-relative-infinitesimal-agreement` — comparison; declaration `CP3.absolute_relative_infinitesimal_agreement`.

For smooth X/C over the point, Guo’s B_dR⁺ infinitesimal cohomology agrees with the BMS1 canonical embedding cohomology. The relative formulation specializes to that construction using the same completed envelopes. Guo Theorem 1.2.7 also treats singular proper spaces via éh descent; that broader extension is an explicit requested interface and gap, not derived from the smooth statement in this packet.

**Proof plan.**

- Use Guo Corollary 1.2.11 and the envelope/Čech comparison. Restrict to smooth X for the present construction; preserve the filtered versus underlying distinction of Theorem 1.2.7. Request éh hyperdescent and analytic derived de Rham support separately.

**Acceptance.**

- The point gives the identical B_dR⁺ complex on both sides.

**Direct prerequisites.** `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/relative-cech-de-rham-comparison`.

**Sources.**

- guo, Theorem 1.2.7 and Corollary 1.2.11, pp.5–6. Corollary 1.2.11 states that Guo's infinitesimal cohomology over B_dR^+ is isomorphic to BMS crystalline cohomology over B_dR^+ (BMS §13), which is the node's agreement statement.
- guo, Definition 2.2.1, Remarks 2.2.2–2.2.4, pp.12–13; Lemma 4.1.10, p.31. Definition 2.2.1 defines the envelope D_X(Y) as the colimit of the infinitesimal neighbourhoods. These are the 'same completed envelopes' through which the node compares the absolute and relative constructions.

Suggested signature: `CP3.absolute_relative_infinitesimal_agreement` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

**Targets realized in another actual stage.**

- `CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement` (Relative filtered comparison adapter), parent `CohomologyComparisons:CP.6`.
- `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion` (Graded analytic vectors and decompletion), parent `CohomologyComparisons:CP.6`.
- `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit` (Bounded torsion in truncated coefficients), parent `CohomologyComparisons:CP.6`.
- `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent` (Completed coefficient and flag descent), parent `CohomologyComparisons:CP.6`.
- `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map` (Étale-site truncated period map), parent `CohomologyComparisons:CP.6`.
- `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism` (Truncated period comparison), parent `CohomologyComparisons:CP.6`.
- `CohomologyComparisons:CP.2/nearby-cycle-crystalline-de-rham-pullback` (Nearby-cycle crystalline–de Rham pullback), parent `CohomologyComparisons:CP.2`.

## CP.4. Semistable, logarithmic and monodromy comparison

Import the log AΩ diagram and Hyodo–Kato realization, then compare the maps over B_st and the induced filtered de Rham realization. Algebraic comparison for arbitrary varieties requires h-derived realizations and hyperdescent. Smooth proper rigid analytic comparison over K and over C has different descent and filtration data, which the nodes retain.

### Logarithmic integral comparison adapter

`CohomologyComparisons:CP.4/logarithmic-integral-diagram` — application; declaration `CP4.logarithmic_integral_diagram`.

For a proper flat p-adic O_K-formal scheme with divisorial log structure and étale local charts t₀⋯t_r=π′ (π′ a nonzero nonunit, allowed to vary), use the AI.6 semistable K_A and its θ-log de Rham, Witt-log crystalline, A_cris-log crystalline and μ-inverted étale comparisons. The log bases over W(k̄) and W(k₀) are displayed separately. Properness is retained for the étale comparison; CK §7.1 also assumes the special fibre purely d-dimensional. CK does not prove the full semistable all-coordinate A_cris map multiplicative.

**Proof plan.**

- Import AI.6 exact node statements, including its corrected properness and log-base qualifications. Compose with CP.0’s scalar diagram. Product/functorial enhancements not supplied there remain an explicit CP.6 gap.

**Acceptance.**

- For r=0 with smooth reduction, forgetting the log structure gives the smooth diagram.

**Direct prerequisites.** `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/crystalline-de-rham-square`, `CohomologyComparisons:CP.0/ainf-specialization-dictionary`.

**Sources.**

- ck, §7.1–7.2, pp.68–69; Corollary 5.43, pp.58–59; Theorem 2.3, p.9. (7.2.1) gives the three specializations of RΓ_Ainf(X): μ-inverted étale, θ-log de Rham and Witt-vector log crystalline. Corollary 5.43 adds the A_cris-log crystalline one. Together these are the node's integral diagram.

Suggested signature: `CP4.logarithmic_integral_diagram` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Hyodo–Kato log-base adapter

`CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter` — comparison; declaration `CP4.hyodo_kato_log_base_adapter`.

Relate the AI.6 log crystalline object over W(k̄) with Q_{≥0} log base to the arithmetic Hyodo–Kato complex over W(k₀) with N→W(k₀), 1↦0. The B_st⁺-base-change map of CK Proposition 9.2 is φ- and N-compatible; on the HK side N is N_HK⊗1+1⊗N_Bst, while on the A_cris side N acts on the period factor. Descent to k₀ and invariants require the precise CR.6 comparison, not an implicit identification of log bases.

**Proof plan.**

- Use AI.6/hyodo-kato-interface and CR.6. CK Proposition 9.2 uses a descent Y and Beilinson log period maps; keep that datum and its transport. Do not assert the unstated W(k₀)→W(k̄) descent without its requested theorem.

**Acceptance.**

- In good reduction (r=0) N_HK=0 and the adapter is the crystalline base change of CP.2/residue-section-descent-adapter.
- On B_st=B_cris[u] the monodromy is N=−d/du, so N_total=N_HK⊗1+1⊗N_{B_st}; Nφ=pφN holds on both factors.

**Direct prerequisites.** `AInfCohomology:AI.6/hyodo-kato-interface`, `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.1`, `CohomologyComparisons:CP.4/logarithmic-integral-diagram`, `CrystallineCohomology:CR.6/integral-hk`, `CrystallineCohomology:CR.6/n-phi-relation`.

**Sources.**

- ck, Proposition 9.2 and Remark 9.3, pp.75–76. The proof of Proposition 9.2 says that on the Hyodo–Kato side N is 'N⊗1+1⊗N' and on the A_cris side N is the monodromy of B_st^+, with φ acting on both factors. That is exactly the node's φ,N bookkeeping.

Suggested signature: `CP4.hyodo_kato_log_base_adapter` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Semistable period comparison

`CohomologyComparisons:CP.4/semistable-period-comparison` — theorem; declaration `CP4.semistable_period_comparison`.

For a proper p-adic O_K-formal scheme with the preceding semistable charts and perfect residue k₀, there is a natural G_K-equivariant quasi-isomorphism RΓ_ét(X_C,Z_p)⊗^L B_st≃RΓ_logcrys(X_{k₀}/W(k₀))⊗^L B_st, compatible with φ and N, where Nφ=pφN. Degreewise it gives semistable H_ét^i(X_C,Q_p). The right side uses the N→W(k₀),1↦0 log base.

**Proof plan.**

- CK Theorem 9.5: compose Proposition 9.2 with the A_cris specialization from AI.6, then invert μ and use the proper étale comparison. Check φ on both factors, N as the total monodromy and the trivial étale-factor N. The diagonal monodromy descends to the balanced tensor because N_Bst is a derivation killing the coefficient field and N_HK is coefficient-linear; these hypotheses are explicit in the Lean adapter.

**Acceptance.**

- In good reduction the comparison is the crystalline one of CP.2 with N=0.
- For a Tate curve E_q, H¹_logcrys is free of rank two with N≠0 and Nφ=pφN, so H¹_ét(E_{q,K̄},Q_p) is semistable and not crystalline.

**Direct prerequisites.** `CohomologyComparisons:CP.4/logarithmic-integral-diagram`, `CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter`, `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.1`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

**Sources.**

- ck, Theorem 9.5, p.76. Theorem 9.5 gives the natural G-equivariant φ,N-compatible isomorphism RΓ_ét(X_C^ad,Z_p)⊗^L B_st ≅ RΓ_logcris(X_{k0}/W(k0))⊗^L B_st with the N_{≥0}, 1↦0 log base. This is the node's statement.

Planet: Semistable comparison theorem.

Suggested signature: `CP4.semistable_period_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Semistable de Rham agreement

`CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement` — theorem; declaration `CP4.semistable_filtered_bdr_agreement`.

Choose a noncanonical A_cris-algebra embedding B_st→B_dR as in Fontaine/CK. The B_dR extension of the semistable comparison agrees with the canonical de Rham comparison of CP.3 under AI.6 Proposition 6.8. Transport the Hodge filtration through the chosen Hyodo–Kato identification; filtered compatibility is not a filtration on B_st independent of its embedding choice.

**Proof plan.**

- CK Remark 9.6 invokes Proposition 6.8. Import AI.6/etale-bdr-agreement, which compares the explicit maps, and apply the descended de Rham comparison. Preserve the choice of embedding as input.

**Acceptance.**

- In good reduction the agreement is the filtered crystalline comparison of CP.2.
- For a Tate curve, changing the chosen embedding B_st→B_dR (the logarithm of the uniformizer) changes the Hyodo–Kato-to-de Rham identification by the exponential of the logarithmic ratio times N, as in CP.4/uniformizer-change-and-monodromy.

**Direct prerequisites.** `CohomologyComparisons:CP.4/semistable-period-comparison`, `CohomologyComparisons:CP.3/descended-de-rham-lattice`, `CohomologyComparisons:CP.3/filtered-de-rham-comparison`, `AInfCohomology:AI.6/etale-bdr-agreement`.

**Sources.**

- ck, Remark 9.6, p.77; Proposition 6.8, pp.66–68. Remark 9.6 says the B_dR base change of (9.5.1), via a noncanonical A_cris-algebra map B_st → B_dR, is identified with the filtered de Rham comparison (6.7.2). This supports the node's agreement statement.

Planet: Filtered semistable comparison.

Suggested signature: `CP4.semistable_filtered_bdr_agreement` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Uniformizer change and monodromy transport

`CohomologyComparisons:CP.4/uniformizer-change-and-monodromy` — theorem; declaration `CP4.uniformizer_change_and_monodromy`.

For two uniformizer choices with ratio a, the corresponding Hyodo–Kato-to-de Rham identifications are transported by the exponential of the logarithmic ratio times N, with the sign obtained by translating CR.6’s formula ρ_{πu}=ρ_π∘exp(log_K(u)N), stated in CR.6’s own monodromy convention, into the B_st convention N=−d/dT of R06.1 and CK §9.1 (CK §9.1 itself treats only a change of torsor trivialization, T↦T+log(a)). B_st itself is the intrinsic HK torsor algebra, not one permanently chosen polynomial coordinate. The transport obeys the cocycle law and preserves the rational comparison.

**Proof plan.**

- CR.6 owns the uniformizer-change theorem and R06.1 the torsor/B_st normalization. CK §9.1 gives T↦T+log(a), N=−d/dT and φ(T)=pT; determine the exponential sign from those exact maps, rather than guessing it. The missing full convention interface is recorded.

**Acceptance.**

- Composition for ratios a,b equals transport for ab; supply the sign in the final owner API before this target is closed.

**Direct prerequisites.** `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.1`, `CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement`, `CrystallineCohomology:CR.6/uniformizer-change`.

**Sources.**

- ck, §9.1, p.75. CK §9.1 fixes the B_st normalization the node relies on: A_st ≃ A_cris[T], T ↦ T + log(a) when the trivialization changes by a ∈ 1+J, and N induced by −d/dT. On the same page, φ is T ↦ pT and Nφ = pφN.

Suggested signature: `CP4.uniformizer_change_and_monodromy` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Log prismatic comparison boundary

`CohomologyComparisons:CP.4/log-prismatic-agreement` — comparison; declaration `CP4.log_prismatic_agreement`.

For the precise boundedness, log smoothness and exact chart class furnished by PR.8, its log prismatic crystalline, de Rham and étale maps fit the semistable comparison after the indicated derived completions and rational period extensions. No assertion extends automatically to all fs log schemes, nonvertical log structures or nonexact charts.

**Proof plan.**

- Import the source-qualified PR.8 comparison and compare its chart maps with AI.6’s log exactification and CP.4’s HK base-change map. Record the exact range and map-uniqueness theorem needed; that agreement is still an explicit gap.

**Acceptance.**

- The nodal chart uses exactification before the log PD envelope; an ordinary PD envelope does not supply the same map.

**Direct prerequisites.** `CohomologyComparisons:CP.4/logarithmic-integral-diagram`, `CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter`, `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/log-de-rham-comparison`, `PrismaticCohomology:PR.8/etale-comparison-over-ainf`, `PrismaticCohomology:PR.8/semistable-aomega-comparison`, `PrismaticCohomology:PR.8/log-hyodo-kato-isomorphism`.

**Sources.**

- ck, §9 introduction and Theorem 9.5, pp.75–76. The §9 introduction confirms that CK covers only 'vertical' log structures, whereas Colmez–Nizioł [CN17] also treat non-vertical ones. This supports the node's scope restriction.

Suggested signature: `CP4.log_prismatic_agreement` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Good reduction and Tate-curve monodromy

`CohomologyComparisons:CP.4/semistable-geometric-examples` — application; declaration `CP4.semistable_geometric_examples`.

The semistable comparison restricts in good reduction to the crystalline comparison with N=0. For a split Tate elliptic curve with parameter q, the supplied two-dimensional HK module has nonzero rank-one N with Nφ=pφN, and the filtered de Rham realization records log(q) after the chosen period embedding. Thus the semistable theorem detects information that the N=0 crystalline theorem does not.

**Proof plan.**

- Import the Tate-curve HK/period computation from CR.6 and R06.2 and apply the diagram. Forget log structures on the smooth good-reduction case; compare through the CP.3 map agreement.

**Acceptance.**

- A Tate curve test must display a nonzero N, with the sign and bases imported from the supplier; a two-dimensional dimension count is insufficient.

**Direct prerequisites.** `CohomologyComparisons:CP.4/semistable-period-comparison`, `CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement`, `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.2`, `CrystallineCohomology:CR.6/hk-good-reduction`, `CrystallineCohomology:CR.6/hk-tate-curve`.

**Sources.**

- ck, §9 introduction, p.75; Theorem 9.5, p.76; §9.1, p.75. CK presents Theorem 9.5 as extending the good-reduction comparison of [BMS18, 1.1(i)]. This supports 'restricts in good reduction to the crystalline comparison'.

Suggested signature: `CP4.semistable_geometric_examples` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Algebraic period comparison without smoothness

`CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison` — theorem; declaration `CP4.algebraic_beilinson_period_comparison`.

**Hypothesis.** Here an algebraic variety is separated and of finite type over K, as in CN Theorem 6.2; neither smoothness nor properness is required.

For any algebraic variety X_K over K and r≥0, CN Theorem 6.2 records Beilinson’s B_st-linear G_K-equivariant period isomorphism H_ét^r(X_{K̄},Q_p)⊗B_st≃H_HK^r(X_{K̄})⊗_{F^{nr}}B_st preserving φ,N and inducing the filtered B_dR isomorphism with H_dR^r(X_K). No smoothness or properness assumption is added; HK and de Rham use the h-descent/derived realizations for arbitrary varieties, not the smooth proper model definitions.

**Proof plan.**

- Use R09.7 resolution together with a requested smooth h-hypercover construction. E2 supplies bounded-below hypercover descent once the h-derived HK and filtered de Rham realizations and their h-descent have been supplied by the CR.6 extension. CN Theorem 6.2 quotes Beilinson; the original algebraic comparison proof remains G-analytic-cst.

**Acceptance.**

- A singular or nonproper variety must use the h-derived realizations; the smooth proper CK model theorem is not enough.

**Direct prerequisites.** `CrystallineCohomology:CR.6`, `AlgebraicModuliForArithmeticGeometry:R09.7`, `PadicHodgeTheory:R06.2`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `EnhancedDerivedSheaves:E2`.

**Sources.**

- cn, Theorem 6.2 and footnote 17, p.40. Theorem 6.2 gives Beilinson's B_st-linear Galois-equivariant (φ,N)-compatible period isomorphism and the filtered B_dR isomorphism for H^r of an algebraic variety, as the node says. Footnote 17 explicitly removes smoothness and properness restrictions.

Planet: Beilinson algebraic period comparison.

Suggested signature: `CP4.algebraic_beilinson_period_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Period recovery and Hom descriptions

`CohomologyComparisons:CP.4/algebraic-period-recovery-and-duals` — application; declaration `CP4.algebraic_period_recovery_and_duals`.

**Hypothesis.** Here an algebraic variety is separated and of finite type over K, as in CN Theorem 6.2; neither smoothness nor properness is required.

For the algebraic comparison above, recover H_ét^r as (H_HK^r⊗B_st)^{φ=1,N=0}∩Fil⁰(H_dR^r⊗B_dR). The natural Hom^sm_{G_K}(H_ét^r,B_st)≃(H_HK^r)^* is an isomorphism of (φ,N,G_K)-modules and Hom_{G_K}(H_ét^r,B_dR)≃(H_dR^r)^* is filtered K-linear. The smooth-vector qualifier and the duals are essential; the theorem does not identify ordinary B_st Hom with undualized HK cohomology.

**Proof plan.**

- Use CN Theorem 6.2 equation (6.3) and the R06.2 admissible period-module theorem. Dualize the comparison and apply the correct smooth-invariant period functor. Topological strictness is qualified by Remark 6.7.

**Acceptance.**

- Weight zero gives Q_p through the φ=1,N=0,Fil⁰ intersection; forgetting the intersection produces B_st instead.

**Direct prerequisites.** `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`, `PadicHodgeTheory:R06.2`.

**Sources.**

- cn, Theorem 6.2, equation (6.3), p.40; Remark 6.7, p.41. The excerpt gives the period recovery (H_HK⊗B_st)^{φ=1,N=0} ∩ F^0(H_dR⊗B_dR) and the first line of (6.3), Hom^sm_{G_K}(H_ét^r, B_st) ≃ H_HK^r(X)^* as a (φ,N,G_K)-module, exactly as the node says.

Suggested signature: `CP4.algebraic_period_recovery_and_duals` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Proper rigid C_st comparison over K

`CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison` — theorem; declaration `CP4.proper_rigid_potential_semistable_comparison`.

For X_K proper smooth rigid over K and r≥0, CN Theorem 6.4 gives a natural G_K-equivariant B_st isomorphism H_ét^r(X_C,Q_p)⊗B_st≃H_HK^r(X_C)⊗_{F^{nr}}B_st preserving φ,N and inducing the filtered B_dR comparison. The resulting Galois representation is potentially semistable; the F^{nr} HK object with G_K action is the potential period realization, not a claim of semistability over K without further hypotheses.

**Proof plan.**

- Use the overconvergent syntomic/étale comparison in sufficiently high twists, HK–de Rham finiteness and the Banach–Colmez dimension argument in the proof of Theorem 6.4. These analytic inputs are requests; no semistable model is silently imposed.

**Acceptance.**

- For a proper smooth curve, the potential HK module equals D_pst H¹; its Hodge–Tate weights are 0,−1 with HT(χ_p)=+1.

**Direct prerequisites.** `CrystallineCohomology:CR.6`, `CohomologyComparisons:CP.3/filtered-de-rham-comparison`.

**Sources.**

- cn, Theorem 6.4 and proof, pp.40–41. Theorem 6.4 gives, for X_K proper smooth rigid analytic over K, the natural G_K-equivariant (φ,N)-compatible B_st isomorphism with H_HK^r(X)⊗_{F^nr}B_st and the induced filtered B_dR isomorphism, exactly as the node says.

Planet: Proper rigid C_st comparison.

Suggested signature: `CP4.proper_rigid_potential_semistable_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Proper rigid period comparison over C

`CohomologyComparisons:CP.4/proper-rigid-c-period-comparison` — theorem; declaration `CP4.proper_rigid_c_period_comparison`.

For X proper smooth rigid over C, CN Theorem 6.8 gives a natural φ,N-compatible B_st comparison with H_HK^r(X)⊗_{F^{nr}}B_st, inducing a filtered B_dR comparison with H_dR^r(X/B_dR⁺)⊗B_dR. The latter filtration is Im[H^r(Fil^i K_dR⁺)→H^r(K_dR⁺)], not only the free B_dR⁺ lattice. No G_K action is asserted without descent. This is a separate filtered extension of BMS1 §13; the unfiltered finite-free lattice theorem by itself is not used as a filtered comparison theorem.

**Proof plan.**

- Use the syntomic/étale comparison and the BC dimension proof in Theorem 6.8. Identify its canonical infinitesimal deformation with CP.3. Remark 6.10 explicitly says the earlier BMS1 Theorem 13.1 did not treat filtrations. The diagonal monodromy descends to the balanced tensor because N_Bst is a derivation killing the coefficient field and N_HK is coefficient-linear; these hypotheses are explicit in the Lean adapter.

**Acceptance.**

- Retain the filtered complex; a choice of free cohomology lattice alone cannot encode this filtration.

**Direct prerequisites.** `CrystallineCohomology:CR.6`, `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/canonical-bdr-etale-comparison`.

**Sources.**

- cn, Theorem 6.8 and Remark 6.10, p.42. Theorem 6.8's filtration definition F^iH^r_dR(X/B_dR^+) := Im(H^r(F^iRΓ_dR(X/B_dR^+)) → H^r_dR(X/B_dR^+)) and Remark 6.10's 'It did not treat filtrations' are exactly what the node cites.

Planet: Filtered period comparison over C.

Suggested signature: `CP4.proper_rigid_c_period_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Proper-curve potential period interface

`CohomologyComparisons:CP.4/proper-curve-potential-period-interface` — application; declaration `CP4.proper_curve_potential_period_interface`.

For a proper smooth curve X_K over a finite extension K/Q_p and X=X_K⊗C, V=H_ét¹(X,Q_p) is potentially semistable with Hodge–Tate weights 0,−1, D_pst(V)≃H_HK¹(X), and Fil¹D_dR(V)≃H⁰(X_K,Ω¹). These are precisely the comparison inputs to CDN Proposition 3.12, not an assertion of semistability over the original K. Its additional identity for the modified HK object uses the fundamental period exact sequence and pro-étale H¹(Ô), owned outside CP.

**Proof plan.**

- Apply the proper rigid comparison, the descended de Rham comparison and degeneration. Record D_pst over the maximal unramified coefficient field with inertia descent; extract the first Hodge piece. Leave the Drinfeld-tower and modified HK functor to its routed owner.

**Acceptance.**

- A curve acquiring semistable reduction only after extension has D_pst; it does not justify replacing that object by D_st over K.

**Direct prerequisites.** `CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison`, `CohomologyComparisons:CP.3/hodge-de-rham-degeneration`, `PadicHodgeTheory:R06.2`.

**Sources.**

- cdn, §3.3, Proposition 3.12 and first proof paragraph, p.36. The first proof paragraph of Proposition 3.12 states the inputs the node lists: V = H^1_ét is potentially semistable with Hodge–Tate weights 0, −1, Fil^1(M_dR) ≅ Ω^1(X_K), and D_pst(V) ≅ H^1_HK(X). It attributes them to the semistable comparison theorem [Tsuji].

Suggested signature: `CP4.proper_curve_potential_period_interface` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

## CP.5. Integral torsion inequalities and lattice recovery

The torsion inequalities concern finite reductions and their specified length normalization. Recovery over O_C requires the étale lattice together with its B_dR⁺ lattice; recovery from the G_K lattice over a discretely valued base requires the all-weight Kisin input. Adjacent-degree torsion-freeness cannot be discarded. The counterexamples show the boundaries of recovery from the special fibre alone.

### Torsion-freeness of the crystalline and de Rham specializations is equivalent degree by degree

`CohomologyComparisons:CP.5/crystalline-de-rham-torsionfreeness-equivalence` — theorem; declaration `CP5.crystalline_de_rham_torsionfreeness_equivalence`.

For proper smooth formal 𝔛/O_C, H_crys^i(𝔛_k/W(k)) is p-torsion-free if and only if H_dR^i(𝔛/O_C) is p-torsion-free; then H_Ainf^i(𝔛) is finite free and H_ét^i(X_C,Z_p) is torsion-free. This is the geometric application of AI.5’s generic complex criterion, not a converse from étale freeness.

**Hypotheses.**

- C is a complete algebraically closed extension of Q_p; 𝔛 is proper smooth formal over O_C; i≥0.
- The actual AI.5 perfect geometric complex and CP.1 specializations, with their finite-presentation/free-after-p hypotheses.

**Proof plan.**

- Import AI.5 Lemma 4.18 and Corollary 4.17, and substitute the two actual derived specializations of CP.1. BMS1 Remarks 14.4 and 14.7 make this geometric deduction.

**Acceptance.**

- The criterion is degree by degree; no degree i+1 freeness is needed for this equivalence.
- The Enriques-derived surface of CP.5/enriques-torsion-counterexample has torsion in H_crys² and H_dR² while all integral étale cohomology is free, detecting the invalid reverse implication.

**Direct prerequisites.** `AInfCohomology:AI.5`, `CohomologyComparisons:CP.1/theta-de-rham-specialization`, `CohomologyComparisons:CP.1/witt-crystalline-specialization`.

**Sources.**

- bms1-2019, Remarks 14.4 and 14.7, pp.120,122; supplier Lemma 4.18. Remark 14.4 states that for fixed i, H^i_crys(𝔛_k/W(k)) is torsion-free if and only if H^i_dR(𝔛) is, via Theorem 14.3(i),(ii) and Remark 4.21 (Lemma 4.18), as in the node.

Suggested signature: `CP5.crystalline_de_rham_torsionfreeness_equivalence` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Crystalline torsion dominates étale torsion over O_C (BMS1 Theorem 14.5(ii))

`CohomologyComparisons:CP.5/integral-torsion-length-inequality-over-C` — theorem; declaration `CP5.integral_torsion_length_inequality_over_C`.

Let X be a proper smooth formal scheme over the ring of integers O of a complete algebraically closed extension C of Q_p, with residue field k and generic fibre X, and let i ≥ 0. For all n ≥ 0, length_{W(k)}(H^i_crys(X_k/W(k))_tor/p^n) ≥ length_{Z_p}(H^i_ét(X,Z_p)_tor/p^n). In particular, if H^i_crys(X_k/W(k)) is p-torsion-free then so is H^i_ét(X,Z_p). The argument also gives rank_{W(k)} H^i_crys(X_k/W(k)) = rank_{Z_p} H^i_ét(X,Z_p).

**Hypotheses.**

- X proper and smooth formal over O_C; C complete algebraically closed over Q_p.
- Input package from AInfCohomology:AI.5 (Theorem 14.3): C := RΓ_Ainf(X) perfect with all H^j(C)[1/p] free over A_inf[1/p]; C ⊗^L W(k) ≃ RΓ_crys(X_k/W(k)); C ⊗ A_inf[1/μ] ≃ RΓ_ét(X,Z_p) ⊗ A_inf[1/μ].
- No torsion-freeness hypothesis: the inequality holds in every degree.

**Proof plan.**

- M := H^i(C) is finitely presented with M[1/p] free (Corollary 4.17 with Theorem 14.3).
- Lemma 4.16: M ⊗ W(k) ↪ H^i(C ⊗^L W(k)) = H^i_crys(X_k/W(k)), an isomorphism after inverting p, hence with torsion cokernel; so length(H^i_crys/p^n) ≥ length(M ⊗ W(k)/p^n) by the length-monotonicity lemma, and the ranks agree.
- Corollary 4.15: rank(M ⊗ W(k)) = rank(M ⊗ W(K♭)) and length_{W(k)}(M ⊗ W(k)/p^n) ≥ length_{W(K♭)}(M ⊗ W(K♭)/p^n).
- Étale identification (the source cites Theorem 14.1 for this step; details reconstructed): H^i(C)[1/μ] = H^i(C ⊗ A_inf[1/μ]) = H^i_ét(X,Z_p) ⊗_{Z_p} A_inf[1/μ] since localization is exact and A_inf[1/μ] is Z_p-flat; base change along A_inf[1/μ] → W(K♭) (μ a unit in W(K♭)) gives M ⊗ W(K♭) = H^i_ét(X,Z_p) ⊗_{Z_p} W(K♭); as Z_p → W(K♭) is flat with p remaining a uniformizer, length_{W(K♭)}((T ⊗ W(K♭))/p^n) = length_{Z_p}(T/p^n) and ranks agree.
- Chain the inequalities and subtract n·rank from both ends (ranks equal) to obtain the torsion inequality; the p-torsion-free corollary is the case where the left side vanishes for all n.

**Acceptance.**

- n = 0 is trivial; n = 1 gives dim_k(H^i_crys,tor/p) ≥ dim_{F_p}(H^i_ét,tor/p).
- Elliptic curve with good reduction over O_C: equality of ranks (1,2,1) and no torsion, in both the ordinary and the supersingular case.
- The two CP.5 counterexamples give a strict inequality for the Enriques-derived surface and distinct elementary divisors for the degenerating-group surface: at n=1 the latter is 1≤2 and at n≥2 it is 2≤2. A subquotient conclusion fails.

**Direct prerequisites.** `AInfCohomology:AI.5`, `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.1/witt-crystalline-specialization`, `CohomologyComparisons:CP.1/mu-inverted-etale-specialization`, `mathlib:Module.length`.

**Sources.**

- bms1-2019, Theorem 14.5(ii), pp.120–121. Theorem 14.5(ii) is the node's length inequality verbatim, including the p-torsion-free corollary.

Planet: Integral torsion bounds.

Suggested signature: `CP5.integral_torsion_length_inequality_over_C` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Recovering the crystalline lattice from étale cohomology with its B_dR^+-lattice (BMS1 Theorem 14.5(iii))

`CohomologyComparisons:CP.5/lattice-recovery-over-C` — theorem; declaration `CP5.lattice_recovery_over_C`.

Let X be proper smooth formal over O = O_C with generic fibre X and i ≥ 0. Tier 1 (hypothesis: H^i_crys(X_k/W(k)) p-torsion-free; then the finitely generated Z_p-module H^i_ét(X,Z_p) is p-torsion-free by part (ii), hence finite free, so the pair below satisfies the hypotheses of Theorem 4.28): H^i_Ainf(X) is a finite free Breuil–Kisin–Fargues module and there is a canonical isomorphism H^i_Ainf(X) ≅ BKF(H^i_ét(X,Z_p)), where BKF(H^i_ét(X,Z_p)) is the finite free BKF module attached by Fargues' equivalence (Theorem 4.28) to the pair (H^i_ét(X,Z_p), H^i_crys(X/B_dR^+) ⊂ H^i_ét(X,Z_p) ⊗ B_dR); moreover H^i_crys(X_k/W(k)) ⊃ BKF(H^i_ét(X,Z_p)) ⊗_{A_inf} W(k), compatibly with φ. Tier 2 (hypothesis: H^i_crys(X_k/W(k)) and H^{i+1}_crys(X_k/W(k)) both p-torsion-free): the inclusion is an equality, so H^i_crys(X_k/W(k)) with its φ-action is recovered from H^i_ét(X,Z_p) with its B_dR^+-lattice.

**Hypotheses.**

- X proper smooth formal over O_C.
- Tier 1: H^i_crys(X_k/W(k)) p-torsion-free (degree i only).
- Tier 2: H^{i+1}_crys(X_k/W(k)) p-torsion-free as well (degree i+1) — the source's exact adjacent-degree hypothesis; by Remark 14.7 either hypothesis may be replaced by torsion-freeness of H^i_dR(X), resp. H^{i+1}_dR(X).
- Input package (AInfCohomology:AI.5, Theorem 14.3): RΓ_Ainf(X) perfect, φ, comparisons (i),(iii),(iv), all H^j_Ainf(X) BKF modules.
- CP.3 input (Theorem 13.1): the B_dR^+-lattice H^i_crys(X/B_dR^+), identified in the good-reduction case with H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ (Proposition 13.23; the degreewise identification is displayed in Theorem 14.5(i)).

**Proof plan.**

- Corollary 4.20 (the source's citation; given Theorem 14.3's BKF conclusion, Corollary 4.17 already suffices) with C = RΓ_Ainf(X): H^i_crys(X_k/W(k)) = H^i(C ⊗^L W(k)) p-torsion-free ⇒ H^i(C) = H^i_Ainf(X) finite free; with its φ it is a finite free BKF module.
- Its Fargues pair (reconstructed from 'the identification of the B_dR^+-lattice in part (i)'; not displayed): T = (H^i_Ainf(X) ⊗ W(C♭))^{φ=1} = H^i_ét(X,Z_p) by Theorem 14.3(iv) and Lemma 4.26 — this uses that comparison (iv) is φ-equivariant for the trivial Frobenius on H^i_ét(X,Z_p), which Theorem 14.3 does not state explicitly; Ξ = H^i_Ainf(X) ⊗ B_dR^+ = H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ by Theorem 14.3(iii) (rational coefficients: derived and ordinary tensor agree because the H^j(C)[1/p] are free) = H^i_crys(X/B_dR^+) by the identification in part (i) (Proposition 13.23).
- Fargues' equivalence (Theorem 4.28; only full faithfulness is needed, Remark 4.29, which proves it directly: faithfulness from Lemma 4.26 and injectivity of A_inf → A_inf[1/μ], fullness by induction on φ^{−r}(μ)^{−1} using the B_dR^+-lattices and Lemma 3.23) gives the canonical isomorphism H^i_Ainf(X) ≅ BKF(H^i_ét(X,Z_p)).
- Lemma 4.16 gives the φ-compatible injection H^i_Ainf(X) ⊗ W(k) ↪ H^i(C ⊗^L W(k)) = H^i_crys(X_k/W(k)) (Tier 1 inclusion).
- Tier 2: Corollary 4.20's last clause — if H^{i+1}(C) ⊗ W(k) is p-torsion-free, e.g. if H^{i+1}(C ⊗^L W(k)) = H^{i+1}_crys(X_k/W(k)) is — the injection is bijective.

**Acceptance.**

- Elliptic curve E over O_C: H^1_crys(E_k/W(k)) is recovered from H^1_ét(E,Z_p) with its B_dR^+-lattice; H^2 is torsion-free so the adjacent condition holds.
- A test where H^{i+1}_crys has torsion but H^i_crys does not may assert only Tier 1 (the inclusion); the source neither proves equality nor gives an example of a strict inclusion in that case, and the generic Lemma 4.16 example (H^{i+1}(C) with x-torsion) shows only the algebraic mechanism.
- Test specifications must not force all cohomology to be free (CP.5 acceptance rule).

**Direct prerequisites.** `AInfCohomology:AI.5`, `AInfCohomology:AI.2`, `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification`, `CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement`.

**Sources.**

- bms1-2019, Theorem 14.5(iii), pp.120–121. Assuming only that H^i_crys is p-torsion-free, Theorem 14.5(iii) gives H^i_{A_inf}(𝔛) ≅ BKF(H^i_ét(X,Z_p)) and a ϕ-compatible inclusion into H^i_crys that becomes an equality when H^{i+1}_crys is also p-torsion-free, i.e. the node's Tier 1 and Tier 2.

Planet: Geometric lattice recovery.

Suggested signature: `CP5.lattice_recovery_over_C` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Recovering the crystalline lattice from the G_K-lattice over a discretely valued base (BMS1 Theorem 14.6(iii))

`CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin` — theorem; declaration `CP5.dvr_lattice_recovery_via_breuil_kisin`.

Let X be proper smooth formal over O_K, K complete discretely valued over Q_p with perfect residue field k, C a completed algebraic closure with Galois group G_K, X_C the geometric rigid generic fibre, i ≥ 0. Assume H^i_crys(X_k/W(k)) and H^{i+1}_crys(X_k/W(k)) are p-torsion-free. Kisin's functor (Theorem 4.4; it depends on the fixed uniformizer π and roots π^{1/p^n}) attaches to the lattice H^i_ét(X_C,Z_p) in the crystalline G_K-representation H^i_ét(X_C,Q_p) a finite free Breuil–Kisin module BK(H^i_ét(X_C,Z_p)) over S = W(k)[[T]] (written 𝔖 in the source); there is an identification BK(H^i_ét(X_C,Z_p)) ⊗_S B_crys^+ ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} B_crys^+ (Proposition 4.34 and part (i); S → A_inf sends T to [π♭]^p and is the Frobenius on W(k), §4.4); extending scalars along B_crys^+ → W(k̄)[1/p] gives BK(H^i_ét) ⊗_S W(k)[1/p] ≅ H^i_crys(X_k/W(k))[1/p], where S → W(k) sends T to 0 and is the Frobenius on W(k) (introduction, p.4); and BK(H^i_ét(X_C,Z_p)) ⊗_S W(k) = H^i_crys(X_k/W(k)) as submodules of the common base extension to W(k)[1/p]. Thus H^i_crys(X_k/W(k)) with φ is recovered from H^i_ét(X_C,Z_p) with its G_K-action.

**Hypotheses.**

- X proper smooth formal over O_K, K/Q_p complete discretely valued, k perfect; a uniformizer π and compatible p-power roots π^{1/p^n} ∈ C fixed (§4.1), defining θ̃: S → O_K (T ↦ π), the element π♭ ∈ C♭, K_∞ and S → A_inf (T ↦ [π♭]^p, Frobenius on W(k)).
- Both H^i_crys and H^{i+1}_crys(X_k/W(k)) p-torsion-free (the Theorem 1.1(iii) hypothesis; Remark 14.7 allows H^i_dR(X), H^{i+1}_dR(X) torsion-free instead).
- H^i_ét(X_C,Q_p) crystalline (Theorem 14.6(i)) so that Kisin's functor applies.
- External: Theorem 4.4 — existence and the identification M(T) ⊗_S W(C♭) ≅ T ⊗ W(C♭) from Kisin [49, Theorem 1.2.1]; uniqueness through [48, Proposition 2.1.12] and the equivalence between finite free φ-modules over S[1/T]^∧_p and finite free Z_p-modules with G_{K_∞}-action ([44, Proposition 4.1.1] or [35, Proposition 2.32]), with the implicit full faithfulness of restriction from crystalline G_K-representations to G_{K_∞}-representations; Proposition 4.34 — proof is one sentence: it 'follows from Kisin's construction of M(T), which starts with the crystalline side and an isomorphism between M(T) and D_crys(V) ⊗ S[1/p] on some rigid-analytic open of the generic fibre of Spf S, cf. [48, Section 1.2, Lemma 1.2.6]' (original Kisin proof is the exact G-kisin supplier gap).

**Proof plan.**

- Apply Theorem 14.5(iii) to X_{O_C} (residue field k̄): under torsion-freeness of H^i_crys and H^{i+1}_crys of X_{k̄} (base change of the hypotheses along k → k̄; import), H^i_crys(X_{k̄}/W(k̄)) = BKF(H^i_ét(X_C,Z_p)) ⊗_{A_inf} W(k̄), with the B_dR^+-lattice H^i_crys(X_C/B_dR^+) = H^i_dR(X/K) ⊗_K B_dR^+ (Remark 13.20) = D_dR(V) ⊗_K B_dR^+ (Theorem 5.1).
- Proposition 4.34 (restated geometrically in Remark 5.2: BKF(H^i_ét) = BK(H^i_ét) ⊗_S A_inf): under Fargues' classification BK(T) ⊗_S A_inf corresponds to the pair (T, D_dR(V) ⊗_K B_dR^+); by full faithfulness (Remark 4.29) BK(H^i_ét) ⊗_S A_inf ≅ BKF(H^i_ét) = H^i_Ainf(X_{O_C}).
- The identification BK ⊗_S B_crys^+ ≅ H^i_crys(X_k/W(k)) ⊗ B_crys^+ is Proposition 4.34's equality M(T) ⊗_S B_crys^+ = D_crys(V) ⊗ B_crys^+ combined with part (i) (D_crys(V) = H^i_crys(X_k/W(k))[1/p]); extending scalars along B_crys^+ → W(k̄)[1/p] (the Witt reduction A_inf → W(k̄) carries ξ to p and so extends to A_crys, introduction p.4) and taking G_{K_∞}-invariants as in Remark 4.5 gives BK ⊗_S W(k)[1/p] = H^i_crys[1/p], for the map S → W(k) with T ↦ 0 and Frobenius on W(k).
- Equality of lattices: BK ⊗_S W(k̄) = H^i_crys(X_k/W(k)) ⊗_{W(k)} W(k̄) inside the common W(k̄)[1/p]-space (step 1 with base change of crystalline cohomology along k → k̄); descend to W(k) by faithful flatness of W(k) → W(k̄) (reconstructed; the source states 'part (iii) follows from Theorem 14.5(iii) and Proposition 4.34').

**Acceptance.**

- Good-reduction elliptic curve over O_K: BK(H^1_ét(E_C,Z_p)) ⊗_S W(k) equals the Dieudonné module H^1_crys(E_k/W(k)).
- The hypothesis in degree i+1 is retained: a case with torsion in H^{i+1}_crys is not covered by this statement (only the Tier 1 inclusion over C).
- Consistency on Tate twists: Z_p(1) ↦ S{1} (Corollary 4.33, confirmed in the public source: S{1} ⊗_S A_inf ≅ A_inf{1} compatibly with G_{K_∞}, and A_inf{1} = μ^{−1}(Z_p(1) ⊗ A_inf)) versus A_inf{1} (Example 4.24).

**Direct prerequisites.** `AInfCohomology:AI.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `CohomologyComparisons:CP.5/lattice-recovery-over-C`, `CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization`, `CrystallineCohomology:CR.3`, `CrystallineCohomology:CR.3/derived-base-change`.

**Sources.**

- bms1-2019, Theorem 14.6(iii) and proof, pp.121–122. Theorem 14.6(iii) states BK(H^i_ét) ⊗_𝔖 W(k)[1/p] ≅ H^i_crys(𝔛_k/W(k))[1/p] and the lattice equality BK(H^i_ét) ⊗_𝔖 W(k) = H^i_crys(𝔛_k/W(k)) inside the W(k)[1/p]-extension, as in the node.

Planet: Breuil–Kisin lattice recovery.

Suggested signature: `CP5.dvr_lattice_recovery_via_breuil_kisin` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Torsion inequality over a discretely valued base (BMS1 Theorem 14.6(ii))

`CohomologyComparisons:CP.5/dvr-torsion-length-inequality` — theorem; declaration `CP5.dvr_torsion_length_inequality`.

With X proper smooth formal over O_K as in Theorem 14.6 and X_C its geometric generic fibre: for all n ≥ 0, length_{W(k)}(H^i_crys(X_k/W(k))_tor/p^n) ≥ length_{Z_p}(H^i_ét(X_C,Z_p)_tor/p^n); in particular H^i_crys(X_k/W(k)) p-torsion-free implies H^i_ét(X_C,Z_p) p-torsion-free (the converse fails, §2.1).

**Hypotheses.**

- X proper smooth formal over O_K, K complete discretely valued with perfect residue field k; no torsion hypothesis.

**Proof plan.**

- The base change X_{O_C} is proper smooth formal over O_C with special fibre X_{k̄}; Theorem 14.5(ii) gives the inequality with W(k̄)-lengths of H^i_crys(X_{k̄}/W(k̄))_tor.
- Reconstructed (the source says 'immediate'): RΓ_crys(X_{k̄}/W(k̄)) ≃ RΓ_crys(X_k/W(k)) ⊗^L_{W(k)} W(k̄) by crystalline base change along the perfect extension k → k̄ (import: CrystallineCohomology CR.3); W(k) → W(k̄) is flat with p a uniformizer on both sides, so torsion submodules and their lengths modulo p^n are preserved.

**Acceptance.**

- Same examples as the O_C statement; the inequality is independent of the choice of C.

**Direct prerequisites.** `CohomologyComparisons:CP.5/integral-torsion-length-inequality-over-C`, `CrystallineCohomology:CR.3`, `mathlib:Module.length`, `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.3/torsion-and-models`.

**Sources.**

- bms1-2019, Theorem 14.6(ii), pp.121–122. Theorem 14.6(ii) is the node's inequality and corollary verbatim, and its proof is 'immediate from Theorem 14.5 (ii)' (p.122).

Suggested signature: `CP5.dvr_torsion_length_inequality` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Mod-p de Rham dimension bounds mod-p étale dimension (BMS1 inequality (1))

`CohomologyComparisons:CP.5/mod-p-de-rham-dimension-bound` — theorem; declaration `CP5.mod_p_de_rham_dimension_bound`.

For X proper smooth formal over O_K as in Theorem 1.1, dim_k H^i_dR(X_k) ≥ dim_{F_p} H^i_ét(X_C, F_p) for every i.

**Hypotheses.**

- X proper smooth formal over O_K, K complete discretely valued with perfect residue field.
- Universal-coefficient identifications RΓ_crys(X_k/W(k)) ⊗^L_{W(k)} k ≃ RΓ_dR(X_k/k) (reduction of crystalline cohomology to the residue field — CrystallineCohomology CR.3's 'compatible reductions' together with the crystalline–de Rham comparison of CR.2) and RΓ_ét(X_C,Z_p) ⊗^L_{Z_p} F_p ≃ RΓ_ét(X_C,F_p), with the H^j_ét(X_C,Z_p) finitely generated (Theorem 5.1) so that all dimensions are finite.

**Proof plan.**

- The source states (1) as implied by Theorem 1.1(ii) without displaying the argument; reconstruction: universal coefficients give dim_k H^i_dR(X_k) = dim_k(H^i_crys/p) + dim_k(H^{i+1}_crys[p]) and dim_{F_p} H^i_ét(X_C,F_p) = dim(H^i_ét(Z_p)/p) + dim(H^{i+1}_ét(Z_p)[p]).
- Theorem 14.6(ii) with n = 1 in degree i, together with rank equality, gives dim_k(H^i_crys/p) ≥ dim_{F_p}(H^i_ét/p).
- Theorem 14.6(ii) with n = 1 in degree i+1 gives dim_k(H^{i+1}_crys[p]) = length(H^{i+1}_crys,tor/p) ≥ length(H^{i+1}_ét,tor/p) = dim_{F_p}(H^{i+1}_ét[p]) (for finite-length modules over a DVR the length of the p-kernel equals the length modulo p).
- Add the two inequalities. The argument uses the torsion inequality in the adjacent degrees i and i+1.

**Acceptance.**

- Elliptic curve: equalities 1, 2, 1 in degrees 0, 1, 2.
- Remark 2.11 (p.16): for the Theorem 2.10 surface H over a ramified O, H^1_ét(H_C, Z/p) ≅ Z/p while H^1_dR(H_k) ≅ k ⊕ k, so (1) — 'the inequality ... coming from Theorem 1.1 (ii)' — can be strict. For the Theorem 2.1 surface over Z_2 the universal-coefficient count makes (1) strict in degrees 1 and 2 (packet-authored consequence). Remark 1.2 (p.3): for an Enriques surface S_k over a perfect field of characteristic 2, lifted to characteristic 0 (possible by [25, 52]), the lift has H^1_ét(S_C, F_2) ≅ F_2, so (1) forces H^1_dR(S_k) ≠ 0 — the non-vanishing first observed via [42, Corollaire 7.3.4 (a)].

**Direct prerequisites.** `CohomologyComparisons:CP.5/dvr-torsion-length-inequality`, `CrystallineCohomology:CR.3`, `AInfCohomology:AI.5`, `mathlib:Module.finrank`, `CrystallineCohomology:CR.3/derived-base-change`.

**Sources.**

- bms1-2019, Theorem 1.1 and inequality (1), pp.2–3. BMS1's inequality (1) is exactly the node's dim_k H^i_dR(𝔛_k) ≥ dim_{F_p} H^i_ét(X_C,F_p), stated as implied by Theorem 1.1(ii).

Planet: Mod-p de Rham dimension bound.

Suggested signature: `CP5.mod_p_de_rham_dimension_bound` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Semistable log crystalline torsion export

`CohomologyComparisons:CP.5/semistable-crystalline-torsion-export` — application; declaration `CP5.semistable_crystalline_torsion_export`.

Under the AI.6 proper semistable hypotheses, import CK Theorem 7.9: for every i∈Z and n≥0, length_Zp(H_ét^i(X_C,Z_p)_tor/p^n)≤length_W(k)(H_logcrys^i(X_k/W(k))_tor/p^n), and length_Zp H_ét^i(X_C,Z/p^n)≤length_W(k) H_logcrys^i(X_k/W_n(k)). CP places these in the common diagram and records the rank equality needed to pass between full and torsion quotients.

**Proof plan.**

- Use AI.6/crystalline-torsion and rank-equality without redeveloping their generic AI.5 proof. The finite coefficient inequality uses universal coefficients in both adjacent degrees.

**Acceptance.**

- At n=0 both sides vanish. For n=1 both adjacent-degree Tor contributions must be kept.

**Direct prerequisites.** `AInfCohomology:AI.6/crystalline-torsion`, `AInfCohomology:AI.6/rank-equality`, `AInfCohomology:AI.6/degreewise-specializations`, `CohomologyComparisons:CP.4/logarithmic-integral-diagram`.

**Sources.**

- ck, Theorem 7.9 and proof, p.70. Theorem 7.9 states both inequalities exactly as in the node: torsion lengths mod p^n, and the finite-coefficient version with W_n(k).

Suggested signature: `CP5.semistable_crystalline_torsion_export` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Normalized log de Rham torsion export

`CohomologyComparisons:CP.5/semistable-normalized-de-rham-torsion-export` — application; declaration `CP5.semistable_normalized_de_rham_torsion_export`.

Import CK Theorem 7.12 with v(p)=1: v_Zp(H_ét^i(Z_p)_tor/p^n)≤v_OC(H_logdR^i(𝔛/O_C)_tor/p^n), including the finite-coefficient log de Rham inequality. For a discrete O_K of absolute ramification e, normalized torsion length is ordinary O_K length divided by e; it is not unscaled module length. The definition via the valuation of Fitt₀ and its scalar-extension invariance belong to AI.5/AI.6. The normalized valuation length is real-valued; for a finitely presented cyclic module O_C/(a) it is v(a).

**Proof plan.**

- Use AI.6/de-rham-torsion and CK §7.10 normalization, which follows the valuation-ring structure theorem. The geometric bound uses the ξ-specialization sequence in degree i and i+1; import CK Lemma 7.11 from the generic linear-algebra owner.

**Acceptance.**

- For O_K/(π), normalized length is 1/e; for O_K/(p), it is 1.

**Direct prerequisites.** `AInfCohomology:AI.6/de-rham-torsion`, `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.5`, `CohomologyComparisons:CP.4/logarithmic-integral-diagram`.

**Sources.**

- ck, §7.10, Lemma 7.11 and Theorem 7.12, p.71. Theorem 7.12 states both normalized inequalities, including the finite-coefficient one with RΓ(X_{O_C/p^n}, Ω•_log). The opening parenthesis recalls the §7.10 normalization val_{Z_p} = length_{Z_p}.

Suggested signature: `CP5.semistable_normalized_de_rham_torsion_export` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Functorial log de Rham lattice export

`CohomologyComparisons:CP.5/functorial-log-de-rham-lattice-export` — application; declaration `CP5.functorial_log_de_rham_lattice_export`.

Import AI.6’s M(T) from the pair (T,D_dR(T)⊗B_dR⁺) and L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K}. For a proper flat semistable model with H_logdR^i and H_logdR^{i+1} both O_K-free, AI.6/model-independent-lattice gives L_dR(H_ét^i)=H_logdR^i inside H_dR^i(X_K). Thus the comparison identifies the lattice functorially and independently of such a model. It does not claim equality after dropping either adjacent-degree condition.

**Proof plan.**

- Use the supplier’s construction, CK Theorem 8.7 and Remark 8.8, together with CP.3’s descended lattice map. The pair’s B_dR⁺ lattice is D_dR(T)⊗B_dR⁺, not T⊗B_dR⁺. Do not assert invariants commute with all integral scalar extensions.

**Acceptance.**

- Use the supplier’s trivial, cyclotomic and ramified-character tests. The ramified test detects a strict inclusion L_dR(T)⊗O_C⊂M(T)_dR.

**Direct prerequisites.** `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.6/model-independent-lattice`, `CohomologyComparisons:CP.3/descended-de-rham-lattice`, `CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement`.

**Sources.**

- ck, §8.5–8.6, p.73; Theorem 8.7 and Remark 8.8, p.74. Theorem 8.7 gives L^i_dR(X_K^ad) = H^i_logdR(𝔛/O_K) inside H^i_dR when H^i_logdR and H^{i+1}_logdR are O_K-free, plus the Breuil–Kisin–Fargues identification. This is the node's lattice statement.

Suggested signature: `CP5.functorial_log_de_rham_lattice_export` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Small-weight integral arithmetic interface

`CohomologyComparisons:CP.5/small-weight-integral-interface` — application; declaration `CP5.small_weight_integral_interface`.

For K absolutely unramified (e=1), after a common Tate shift restrict the Fontaine–Laffaille filtration indices to [0,p−2] for unrestricted torsion full faithfulness. The interval [0,p−1] requires the precise restricted subcategories of Fontaine–Laffaille §0.9/§6 excluding the specified endpoint subobjects or quotients; at p=2 the unrestricted safe interval is [0,0]. For the Breuil–Kisin alternative use R07.4’s separately proved height/ramification and dyadic hypotheses. In either case compare the supplied geometric realization with CP.5’s actual lattice, using the Kummer tower and the Frobenius-twisted S specialization. No classification is owned here.

**Proof plan.**

- Import the exact R07.3 Fontaine–Laffaille equivalence in its stated range, R07.4’s crystalline lattice functor and R06.4’s covariance/weight translation. Compare their realization maps with CP.5 lattice recovery. The all-weight Kisin lattice comparison used in BMS1 Theorem 14.6(iii) needs a scope extension of the current R07.4 text, which only promises finite-flat/p-divisible classification.

**Acceptance.**

- A weight interval must appear in the final imported theorem; “small weight” alone is not a hypothesis.

**Direct prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `PadicHodgeTheory:R06.4`, `CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-full-faithfulness`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`, `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`.

**Sources.**

- bms1-2019, §4.4, pp.43–44; Theorem 14.6(iii), pp.121–122. BMS1's only Breuil–Kisin input is Theorem 14.6(iii), Kisin's 𝔖-module BK(H^i_ét(X_C,Z_p)) attached to the crystalline lattice, together with the 𝔖 → A_inf map of §4.4, which is the part of this interface taken from BMS1.

Suggested signature: `CP5.small_weight_integral_interface` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Enriques torsion counterexample

`CohomologyComparisons:CP.5/enriques-torsion-counterexample` — theorem; declaration `CP5.enriques_torsion_counterexample`.

BMS1 Theorem 2.1 constructs a smooth projective geometrically connected surface over Z₂ with all geometric generic-fibre integral étale groups free and H_crys² of the special fibre having torsion F₂. The proof uses a singular Enriques surface S/Z₂ with Pic^τ=μ₂, a K3 double cover and an ordinary elliptic curve: a generically nontrivial Z/2→μ₂→E becomes zero in the special fibre, producing an E-torsor threefold D; a sufficiently ample smooth hypersurface gives the surface.

**Proof plan.**

- Follow Proposition 2.2’s π₁ and crystalline Künneth computations. Import Lang–Ogus liftability and Illusie’s Enriques crystalline computation; finite-field Bertini, étale cohomological bounds and crystalline weak Lefschetz (Lemma 2.12) are named supplier inputs. They were not proved by the comparison theorem.

**Acceptance.**

- Crystalline torsion-free implies étale torsion-free, but the reverse implication fails even for smooth projective surfaces.

**Direct prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `CrystallineCohomology:CR.3`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

**Sources.**

- bms1-2019, Theorem 2.1 and Proposition 2.2 with proofs, pp.13–15. For a smooth projective geometrically connected surface over Z₂, Theorem 2.1 states that every H^i_ét(X_{Q̄₂}, Z₂) is free while H²_crys(X_{F₂}/Z₂)_tor = F₂, as the node says.

Planet: Enriques torsion counterexample.

Suggested signature: `CP5.enriques_torsion_counterexample` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Degenerating torsion counterexample

`CohomologyComparisons:CP.5/degenerating-group-torsion-counterexample` — theorem; declaration `CP5.degenerating_group_torsion_counterexample`.

For the BMS1 Theorem 2.10 smooth projective surface H/O_C, H_ét²(H_C,Z_p)_tor≃Z/p² while H_crys²(H_k/W(k))_tor≃k⊕k. Hence étale torsion need not be a subquotient of crystalline torsion despite all-n length inequalities. The construction starts with the flat closure G of a p²-torsion point in a supersingular elliptic curve, G_C≃Z/p² and G_k=E_k[p]; approximate BG by a projective quotient with bad stabilizer locus of codimension >2.

**Proof plan.**

- Import R07.1’s flat closure and finite-flat quotient results corresponding to Lemmas 2.5,2.7,2.9. A general surface avoids the bad locus by Bertini. Étale Leray gives H²(Z/p²,Z_p); crystalline Leray of the E-torsor yields the cokernel of multiplication by p on rank-two H_crys¹(E), using the weakened weak Lefschetz Lemma 2.12.

**Acceptance.**

- At n=1 the length bound is strict: 1≤2. At n≥2 total lengths agree: 2=2. The elementary-divisor types still differ.

**Direct prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `CrystallineCohomology:CR.3`.

**Sources.**

- bms1-2019, Lemmas 2.5,2.7,2.9 and Theorem 2.10 proof, pp.15–17. Theorem 2.10 states H²_ét(H_C,Z_p)_tor ≃ Z/p²Z and H²_crys(H_k/W(k))_tor ≃ k ⊕ k for the smooth projective surface H over O = O_C, exactly as the node says.

Planet: Degenerating torsion counterexample.

Suggested signature: `CP5.degenerating_group_torsion_counterexample` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Special-fibre non-determination

`CohomologyComparisons:CP.5/special-fibre-does-not-determine-integral-etale` — application; declaration `CP5.special_fibre_does_not_determine_integral_etale`.

The two Z₂ lifts D and D′=S×E of the same smooth projective special fibre S_k×E_k in BMS1 Remark 2.4 have different generic-fibre H_ét² torsion. Therefore neither integral generic étale torsion nor RΓ_Ainf, even modulo p, is a functor only of the special fibre. This prevents replacing the formal model in the CP.1 diagram by its residue scheme.

**Proof plan.**

- Use the E-torsor construction and Proposition 2.2 for D, and the product/Künneth computation for D′. The finite-flat map degenerates, while the special fibre is unchanged; record the result as a geometric obstruction, not a new cohomology construction.

**Acceptance.**

- Any proposed integral comparison depending only on X_k fails this pair of lifts.

**Direct prerequisites.** `CohomologyComparisons:CP.5/enriques-torsion-counterexample`, `CrystallineCohomology:CR.3`.

**Sources.**

- bms1-2019, Remark 2.4, p.15. Remark 2.4 concludes that the generic-fibre étale torsion of a smooth proper Z₂-scheme, and RΓ_{A_inf}(𝔛) even modulo p, are not functors of the special fibre.

Suggested signature: `CP5.special_fibre_does_not_determine_integral_etale` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

## CP.6. Reusable coefficient, product and arithmetic exports

Normalize cup products, traces, cycles and Chern classes before returning cohomological realizations to arithmetic consumers. The proper P(O⊕L) repair keeps the first-Chern proof inside the scope of the proper cycle comparison. Pan §6.3 uses logarithmic structural coefficients, while §7.2 uses ordinary truncated period coefficients and affinoid perfectoid preimages of the flag basis. The GR adapter and all five Pan adapters belong to the explicit successor-cut proposal below.

### Relative filtered comparison adapter

`CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement` — comparison; declaration `CP3.relative_filtered_prismatic_agreement`.

Realizes `CohomologyComparisons:CP.6`, `CohomologyComparisons:CP.3`; actual parent `CohomologyComparisons:CP.6`.

For proper smooth f and crystalline Z_p-lisse T with the associated analytic prismatic F-crystal, the B_dR specialization of GR’s étale–crystalline comparison equals the Hodge-filtered relative de Rham comparison under Convention 10.12 and its compatible section R→A⊗W(k)O_K. Without the section, the structural OB_dR sheaf gives the canonical relative formulation. CP supplies the infinitesimal base-change comparison; PR.7 supplies the F-crystal equivalence and the comparison being specialized. The perfect prism (A,I) must be p-completely flat over (A_inf,[p]_q), q=[ε]; its I-adic period filtration and the tensor-product Hodge filtration on the de Rham side are the filtrations being compared.

**Proof plan.**

- Import GR Theorems 9.15,10.13 from PR.7 with their exact base prism and flatness conditions. Compare via Proposition 10.11; use Remark 10.14 and Griffiths transversality to remove the auxiliary section only after tensoring with OB_dR.

**Acceptance.**

- For the trivial local system Z_p both sides are relative de Rham cohomology with its Hodge filtration tensored with the period filtration.
- For Z_p(1) the filtration is shifted by one, which detects a sign error in the Tate twist.

**Direct prerequisites.** `PrismaticCohomology:PR.7`, `CohomologyComparisons:CP.3/relative-crystalline-infinitesimal-base-change`, `PadicHodgeTheory:P8:local-rational`, `PadicHodgeTheory:P8:local-rational/relative-poincare-lemma`.

**Sources.**

- gr, Theorem 10.13 and Remark 10.14, pp.99–100. Theorem 10.13 has exactly the node's hypotheses: a perfect prism satisfying Convention 10.12 and a compatible map R → A⊗_{W(k)}O_K. It concludes that the B_dR(A) base change of the étale–crystalline comparison underlies a filtered isomorphism.

Suggested signature: `CP3.relative_filtered_prismatic_agreement` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Naturality, scalar extension and cup products

`CohomologyComparisons:CP.6/naturality-base-change-and-cup-products` — theorem; declaration `CP6.naturality_base_change_and_cup_products`.

For smooth proper algebraic X/K and the CP.3 de Rham comparison c_dR, the total isomorphism is a graded B_dR-algebra map, natural for morphisms of such varieties and compatible with finite extension K′/K inside C. It commutes with the Künneth external product for X×_K Y. Integral/crystalline/prismatic enhancements have the exact same compatibility only in the source scopes of the CP.1 multiplicative maps and the supplied completed tensor/Künneth theorems. In particular this does not make CK’s semistable A_cris map multiplicative without further proof.

**Proof plan.**

- Betts–Stix Proposition 3.19 obtains (1)–(3) from the ring-valued filtered connection comparison and obtains Künneth from the two projections. Identify that map with CP.3 through the recorded map-agreement target. For integral enhancements use the actual local cup maps, the CP.1 Bockstein coherence and the supplier Künneth statement.

**Acceptance.**

- On P¹×P¹ the two degree-two hyperplane classes give their product in degree four. Finite scalar extension must commute with both projection pullbacks.

**Direct prerequisites.** `CohomologyComparisons:CP.3/filtered-de-rham-comparison`, `CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement`, `CohomologyComparisons:CP.1/multiplicative-bockstein-coherence`, `EnhancedDerivedSheaves:E4`, `ClassicalAdicEtaleCohomology:H5`.

**Sources.**

- bs, Proposition 3.19, p.27. Proposition 3.19(1)–(2) state that c_dR is an isomorphism of graded algebras under cup product and is natural in X; (3)–(4) give finite base extension and Künneth. These are exactly the node's compatibilities.

Planet: Multiplicative de Rham comparison.

Suggested signature: `CP6.naturality_base_change_and_cup_products` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Trace-normalized Tate period

`CohomologyComparisons:CP.6/trace-normalized-tate-period` — theorem; declaration `CP6.trace_normalized_tate_period`.

For the specific c_dR in Betts–Stix, there is a unique G_K-equivariant filtered B_dR-linear isomorphism a:B_dR(−1)≃B_dR⟨−1⟩ making the trace square commute on P¹. Here Fil^i(V⟨n⟩)=Fil^{i+n}V. For smooth proper geometrically connected X/K of dimension d, the étale trace to Q_p(−d) and de Rham trace to K⟨−d⟩ commute with c_dR and a^{⊗d}. Equality of a with the canonical Fontaine period is not asserted: Remark 3.21 explicitly leaves it unproved.

**Proof plan.**

- Normalize on P¹, transport along finite extensions, and prove the product (P¹)^d case by Künneth. Use a common generically finite alteration/morphism and degree compatibility of both traces to obtain the general case. Require the supplier trace normalizations, a nonzero degree over characteristic zero and geometrically connectedness.

**Acceptance.**

- The fundamental class of P¹ has trace 1 on both sides after a, detecting an arbitrary scalar rescaling of c_dR.

**Direct prerequisites.** `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `CrystallineCohomology:CR.3:duality`, `AlgebraicModuliForArithmeticGeometry:R09.7`.

**Sources.**

- bs, Proposition 3.20(5) and proof; Remark 3.21, pp.27–28. Remark 3.21 explicitly says only that the authors 'suspect' a equals the canonical isomorphism coming from Q_p(1) → B_dR, and 'do not prove it here'. This confirms the node's caveat.

Planet: Trace-normalized period comparison.

Suggested signature: `CP6.trace_normalized_tate_period` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Duality, cycles and Gysin compatibility

`CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility` — theorem; declaration `CP6.duality_and_cycle_class_compatibility`.

For X smooth proper geometrically connected of dimension d over K, c_dR and a^{⊗d} identify the perfect Poincaré pairings in degrees i and 2d−i. For a codimension-r algebraic cycle Z, (c_dR⊗a^{⊗−r})cl_ét(Z)=cl_dR(Z) in H_dR^{2r}(X)⟨r⟩⊗B_dR. Proper pushforward and regular-immersion Gysin commute in the duality/purity range supplied by EDC.3 and the crystalline owner (a packet extension: Betts–Stix Proposition 3.20 proves (6)–(7) only). No arbitrary nonproper trace is inferred.

**Proof plan.**

- Proposition 3.20(6) uses cup and trace. Resolve integral Z in characteristic zero; its cycle class is characterized by pairing with test classes and the trace of their pullback to the resolution. Transport via naturality and the perfect pairing. Gysin compatibility follows by that adjunction in the stated proper range, using supplier purity, not a newly defined cycle theory.

**Acceptance.**

- On P¹ the class of a K-rational point maps to the degree-one de Rham class with the a^{-1} twist. A codimension-r pushforward has degree shift 2r and Tate twist r.

**Direct prerequisites.** `CohomologyComparisons:CP.6/trace-normalized-tate-period`, `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.3`, `CrystallineCohomology:CR.3:duality`, `AlgebraicModuliForArithmeticGeometry:R09.7`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`.

**Sources.**

- bs, Proposition 3.20(6)–(7) and proof, pp.27–28. Proposition 3.20(7) identifies the étale and de Rham cycle classes of a codimension-r cycle under c_dR ⊗ a^{⊗−r}, which is the node's cycle-class statement. (6) gives the Poincaré-pairing compatibility.

Suggested signature: `CP6.duality_and_cycle_class_compatibility` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### First Chern class comparison

`CohomologyComparisons:CP.6/first-chern-class-comparison` — theorem; declaration `CP6.first_chern_class_comparison`.

For a line bundle L on smooth proper X/K or a smooth proper formal model in the common crystalline/prismatic range, compare its étale Kummer c₁∈H²_ét(X_C,Q_p(1)), de Rham dlog c₁∈Fil¹H²_dR(X), crystalline PD c₁ and prismatic logarithmic c₁ with their supplied twist objects. The de Rham rational map uses c_dR⊗a^{-1}; the crystalline and prismatic maps use the precise Frobenius-linearized comparisons. Claims about the canonical t-normalization or unrestricted integral semistable cup maps remain separate gaps.

**Proof plan.**

- Check the Kummer-to-dlog cocycle square in the supplier Poincaré resolution. For the proper cycle proof replace the nonproper total-space argument at the end of Betts–Stix Proposition 3.20 by the projective compactification P(O⊕L), its zero/infinity section Gysin classes and the projective-bundle formula, then pull back to X. PR.4 supplies the prismatic/syntomic/crystalline Chern constructions; CP compares them and does not define a second Chern class.

**Acceptance.**

- c₁(O)=0 and c₁(O(1)) on P¹ has trace 1 after the stated twist. Check additivity for L⊗M; forgetting the Tate/filtration shift fails the P¹ test.

**Direct prerequisites.** `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`, `CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison`, `CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.4`, `PrismaticCohomology:PR.4`, `PadicHodgeTheory:P8:local-rational`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`, `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`, `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`, `EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`.

**Sources.**

- bs, Proposition 3.20(8), final proof paragraph, p.28. This is the step recorded as E3: the proof identifies c_1 with the cycle class of the zero section in the total space V and finishes 'by (2) and (7)', although (7) and c_dR are only available for smooth proper varieties.

Planet: First Chern class comparison.

Suggested signature: `CP6.first_chern_class_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Higher Chern and projective bundle comparison

`CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison` — theorem; declaration `CP6.higher_chern_and_projective_bundle_comparison`.

For a vector bundle E of rank n on smooth proper X in the common range, identify each supplied c_r(E) under the same comparisons with twist r. On the complete flag bundle, the classes are the elementary symmetric polynomials in the line-quotient c₁’s; the iterated projective-bundle formula makes pullback injective. Thus the higher-class statement descends to X. Preserve the projective-bundle relation and its sign convention as provided by EDC.4 and PR.4.

**Proof plan.**

- Use splitting after the flag-bundle pullback, naturality and the c₁ comparison; use the injective summand from the projective-bundle formula to descend. Betts–Stix invokes Grothendieck’s formalism without proving these inputs. The crystalline/prismatic splitting API is an exact request.

**Acceptance.**

- For O(1)⊕O(1) on P², c₂=h² and c₁=2h. A rank-one test alone does not detect a wrong higher-class convention.

**Direct prerequisites.** `CohomologyComparisons:CP.6/first-chern-class-comparison`, `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`, `EtaleDualityAndPerverseSheaves:EDC.4`, `PrismaticCohomology:PR.4`, `CrystallineCohomology:CR.3`, `CrystallineCohomology:CR.3/kunneth`, `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`, `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`.

**Sources.**

- bs, Proposition 3.20(8) and proof, p.28. Proposition 3.20(8) is the higher Chern class statement the node generalizes. The proof reduces it to line bundles by 'Grothendieck's formalism of Chern classes' without further detail.

Suggested signature: `CP6.higher_chern_and_projective_bundle_comparison` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Geometric arithmetic export

`CohomologyComparisons:CP.6/geometric-arithmetic-export` — application; declaration `CP6.geometric_arithmetic_export`.

Return the actual comparison maps and their φ,N,G_K,filtration,duality and twist data to R06.6, R07 and AutomorphicGaloisRepresentationsPartII. Smooth proper good reduction supplies crystalline realizations; a proper semistable model supplies semistable realizations; a proper smooth rigid space over K supplies the potential realization in CP.4. The export does not make all de Rham representations crystalline. Small-weight integral consumers retain R07.3’s unramified base, interval and endpoint restrictions and R07.4’s height/ramification hypotheses.

**Proof plan.**

- Apply R06.2’s period invariants to the geometric comparisons already constructed; compose the CP.5 integral realization when its adjacent-degree freeness holds. R06.5–R06.6 are consumers, never prerequisites of CP.4. The return links specify these maps, rather than postulating a representation with the desired realization.

**Acceptance.**

- Good reduction has N=0. A Tate curve has N≠0 and needs B_st. Compare the dual representation with its cohomological pairing and dimension twist.

**Direct prerequisites.** `CohomologyComparisons:CP.2/period-invariants-and-admissibility`, `CohomologyComparisons:CP.4/semistable-period-comparison`, `CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison`, `CohomologyComparisons:CP.5/small-weight-integral-interface`, `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`.

**Sources.**

- cn, Theorems 6.4, 6.8 and proof, pp.40–42. The §6.2.2 setup gives CN's potential-semistable comparison for any proper smooth rigid X_K over K, generalizing the semistable-reduction case. This supports the node's 'proper smooth rigid space over K supplies the potential realization'.

Suggested signature: `CP6.geometric_arithmetic_export` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Habiro and trace specialization export

`CohomologyComparisons:CP.6/habiro-and-trace-specialization-export` — application; declaration `CP6.habiro_and_trace_specialization_export`.

Export the CP.0 normalization and CP.1/CP.6 commutative maps to HQ.8 for its own q=1, p-adic and cyclotomic specialization diagrams. The consumer records the base prism/perfectoid ring, completion ideal, inversions, filtration and BK/Tate twists and proves q-gluing compatibility in the intersection of the source hypotheses. RefinedTraceMethods owns the cyclotomic Chern character and its trace-to-prismatic map; CP supplies the class-comparison diagram into which that character maps. No unconditional analytic/algebraic Habiro equivalence or identification before base change is claimed.

**Proof plan.**

- Provide the already constructed coefficient and Chern maps as interface data. HQ.8 proves its global gluing square and RT proves the cyclotomic character square. These are return uses, not dependencies on the completed consumer theorem; register missing supplier character normalization as a gap for the consumer’s scope extension.

**Acceptance.**

- At q=1 retain derived specialization and Hodge completion. A p-adic localization is a map losing integral information, not an equivalence on the original Habiro coefficient category.
- The typed export returns the standard dictionary with its actual theta/period-composite equations and the geometric Chern identity for a specified bundle; it does not quantify over arbitrary comparison data.

**Direct prerequisites.** `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison`, `CohomologyComparisons:CP.6/first-chern-class-comparison`, `CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison`.

**Sources.**

- bms1-2019, Theorem 14.1, p.118; specialization picture §1.2, p.6. BMS1's specialization picture (RΓ_{A_inf} over Spec A_inf, described on overlapping subsets by other cohomology theories with comparison isomorphisms on the overlaps) is the diagram the export passes to HQ.8.

Suggested signature: Returns the standard specialization dictionary, its exact theta and period-composite equations, and the geometric de Rham Chern comparison for a vector bundle. Integral/prismatic enhancement and the HQ/RT consuming homotopies remain genuine owner interfaces; the signature makes no q-gluing assertion.

### Graded analytic vectors and decompletion

`CohomologyComparisons:CP.6/pan-graded-analytic-decompletion` — theorem; declaration `CP6.pan_graded_analytic_decompletion`.

Realizes `CohomologyComparisons:CP.6`, `CohomologyComparisons:CP.0`, `CohomologyComparisons:CP.3`; actual parent `CohomologyComparisons:CP.6`.

In Pan’s modular-curve tower and basis U∈B, suppose G_K acts on O B_dR,k⁺(U) for some finite K/Q_p. For i≥0, k>i and l>0, taking gr^i commutes with GL₂(Q_p)-locally analytic vectors, with the χ̃_l isotypic subspace, and with the decompleted G_{K∞}-fixed/G_K-analytic subspace. The i-th symmetric power of the log Faltings extension filters the latter by j=0,…,i with graded pieces O_{K^p}^{la,χ̃_l}(U)_K(j)⊗_{O_{V₀}}Ω¹_{V₀}(C)^{⊗(i−j)}. The stabilized gr^i is independent of k>i; ordinary fixed vectors without the analytic/decompletion condition are not substituted.

**Proof plan.**

- Import T6:log-sites/log-site-projections in its locally noetherian fs scope for the logarithmic analytic projections; the trivial-log locus has the ordinary étale site. This separate site interface realizes the logarithmic portion of CP.0 and is not a prerequisite of CP.0’s ordinary normalization node.
- Import the logarithmic period sheaf, Faltings extension and Poincaré lemma from T6:comparison, their analytic-vector exactness and decompletion for this tower, and Pan’s earlier LB-space arguments. Proposition 6.3.9 states the three maps, not commutation of every inverse limit with every analytic-vector functor.

**Acceptance.**

- For i=0 the only graded factor is O_{K^p}(U)_K; for i=1 there are the j=0 differential and j=1 cyclotomic pieces. The cutoff k>i must be tested.

**Direct prerequisites.** `HodgeTateAndCanonicalSubgroups:T6:comparison`, `HodgeTateAndCanonicalSubgroups:T6:log-sites`, `CompletedCohomologyPartII:CC.8`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections`.

**Sources.**

- pan, Proposition 6.3.9 and preceding paragraphs (§6.3.8), pp.100–101. Proposition 6.3.9 asserts that gr^i commutes with locally analytic vectors, χ̃_l-isotypic parts and G_{K∞}-fixed, G_K-analytic vectors, gives the Faltings-extension filtration of the graded pieces, and notes independence of k > i. This is the node's statement.

Planet: Graded period decompletion.

Suggested signature: `CP6.pan_graded_analytic_decompletion` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Bounded torsion in truncated coefficients

`CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit` — theorem; declaration `CP6.pan_bounded_torsion_inverse_limit`.

Realizes `CohomologyComparisons:CP.6`, `CohomologyComparisons:CP.3`; actual parent `CohomologyComparisons:CP.6`.

For each degree i and k≥1, H^i(X_{K^p},A_inf,X^a/(ker θ)^k) has p-primary torsion killed by p^n for some n depending on i,k, and is the inverse limit of H^i(X_{K^p},A_inf,X^a/((ker θ)^k,p^m)). The almost coefficient category and p-completion are retained. There is no uniform bound in every k or every degree.

**Proof plan.**

- Pan Lemma 7.2.5 starts from Pan22 Corollary 4.4.3 for k=1. Induct on k with multiplication by a chosen generator of ker θ; the quotient is p-torsion-free. In the cohomology coefficient exact sequence, transitions on H^{i+1}[p^m] are multiplication by p, so bounded torsion kills the inverse Tate module. Import completeness/control from CC.2 with its hypotheses.

**Acceptance.**

- For k=1 recover the almost O_C completed-cohomology comparison. The inverse Tate-module transition is multiplication by p, not the inclusions H[p^m]→H[p^{m+1}].

**Direct prerequisites.** `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.8`, `AInfCohomology:AI.3`, `PerfectoidSpaces:P3`, `PerfectoidSpaces:P3/etale-almost-acyclicity`.

**Sources.**

- pan, Lemma 7.2.5 and proof, p.119. Lemma 7.2.5 states bounded p-power torsion of H^i(X_{K^p}, A^a_inf/(ker θ)^k) and its identification with the inverse limit mod p^m, exactly as the node says.

Suggested signature: `CP6.pan_bounded_torsion_inverse_limit` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Completed coefficient and flag descent

`CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent` — theorem; declaration `CP6.pan_completed_coefficient_and_flag_descent`.

Realizes `CohomologyComparisons:CP.6`, `CohomologyComparisons:CP.3`; actual parent `CohomologyComparisons:CP.6`.

For k≥1, completed cohomology with A_inf/(ker θ)^k coefficients is lim_m H̃^i(K^p,Z/p^m)⊗_{Z_p}A_inf/((ker θ)^k,p^m). More generally Pan’s coefficient interchange holds for a p-adically complete p-torsion-free Z_p-module M in the specified completed tower model. On the perfectoid modular curve, R^jπ_HT,*A_inf,X^a/(ker θ)^k=0 for j>0, giving H^i(X_{K^p},A_inf,X^a/(ker θ)^k)≃H^i(Fl,π_HT,*A_inf,X^a/(ker θ)^k).

**Proof plan.**

- Pan Lemma 7.2.6 uses the p-complete torsion-free tower complex supplied by CC.4; keep its universal-coefficient exact sequence and multiplication-p Tor transitions. Vanishing follows on π_HT^{-1}(U), which is affinoid perfectoid, by induction on k. No arbitrary pushforward on all diamonds is inferred.

**Acceptance.**

- The coefficient M must be complete and p-torsion-free. The higher-direct-image argument requires the stated affinoid perfectoid preimages, not only a map to Fl.

**Direct prerequisites.** `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CompletedCohomologyPartII:CC.4`, `CompletedCohomologyPartII:CC.8`, `PerfectoidSpaces:P3`, `PerfectoidSpaces:P3/etale-almost-acyclicity`, `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety`, `AInfCohomology:AI.3`.

**Sources.**

- pan, Lemma 7.2.6 and proof, p.120. Lemma 7.2.6 gives both the completed-cohomology coefficient formula and H^i(X_{K^p}, A^a_inf/(ker θ)^k) ≅ H^i(Fℓ, π_HT∗(…)), as in the node.

Suggested signature: `CP6.pan_completed_coefficient_and_flag_descent` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Étale-site truncated period map

`CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map` — theorem; declaration `CP6.pan_etale_site_truncated_comparison_map`.

Realizes `CohomologyComparisons:CP.6`, `CohomologyComparisons:CP.0`, `CohomologyComparisons:CP.3`; actual parent `CohomologyComparisons:CP.6`.

For k≥1 construct Pan’s G_Qp-equivariant B_dR,k⁺-linear map H̃^i(K^p,B_dR,k⁺)→H^i(Fl,B_dR,k⁺), reducing modulo t to the k=1 completed C-coefficient isomorphism. At finite level use truncated Witt sheaves and, for each k,m, a sufficiently large projection φ_l:A_inf→W_l(O_C/p) through which A_inf→A_inf/((ker θ)^k,p^m) factors; the resulting almost maps g_{k,m} are compatible in k,m. After inverse p-adic limits and p-inversion they give the stated map.

**Proof plan.**

- Pan Lemma 7.2.4 sketches an étale-site construction independent of a claim that ordinary étale/pro-étale sites agree. Compare their almost O⁺/p cohomology on the affinoid-perfectoid basis, induct for W_n, use the kernel-of-θ factorization estimate for Teichmüller lifts, then PB/PC justify the limit. The alternative primitive proof is cited but not used to skip the Witt factorization.

**Acceptance.**

- Reduction modulo t is Pan22 Corollary 4.4.3. Independently check compatibility modulo p^m and (ker θ)^k before taking either limit.

**Direct prerequisites.** `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`, `AInfCohomology:AI.3`, `PerfectoidSpaces:P3`, `mathlib:WittVector`, `PerfectoidSpaces:P3/etale-almost-acyclicity`, `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational`.

**Sources.**

- pan, Lemma 7.2.4 and proof, pp.118–120. Lemma 7.2.4 states the natural G_{Q_p}-equivariant B^+_dR,k-linear map that reduces mod t to (7.2.1). This is the node's map.

Suggested signature: `CP6.pan_etale_site_truncated_comparison_map` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

### Truncated period comparison

`CohomologyComparisons:CP.6/pan-truncated-period-isomorphism` — theorem; declaration `CP6.pan_truncated_period_isomorphism`.

Realizes `CohomologyComparisons:CP.6`, `CohomologyComparisons:CP.3`; actual parent `CohomologyComparisons:CP.6`.

For Pan’s modular-curve tower, every k≥1 and degree i, the preceding map is a natural G_Qp-equivariant isomorphism of B_dR,k⁺-modules H̃^i(K^p,B_dR,k⁺)≃H^i(Fl,B_dR,k⁺), with the source’s truncated period sheaf on Fl.

**Proof plan.**

- Proposition 7.2.3 uses the k=1 result of Pan22 Corollary 4.4.3, the explicit map of Lemma 7.2.4 and flatness of the scalar algebra/sheaf over B_dR,k⁺ to induct on k. Flatness and the modulo-t exact sequences are inputs; agreement of dimensions alone does not produce this isomorphism.

**Acceptance.**

- At k=1 obtain H̃^i(K^p,C)≃H^i(Fl,O_{K^p}); the k=2 comparison respects the nontrivial t-extension.

**Direct prerequisites.** `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map`, `CompletedCohomologyPartII:CC.8`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational`.

**Sources.**

- pan, Proposition 7.2.3 and proof, p.118. Proposition 7.2.3 states the node’s natural G_{Q_p}-equivariant isomorphism H̃^i(K^p, B^+_dR,k) ≅ H^i(Fℓ, B^+_dR,k).

Planet: Truncated period comparison.

Suggested signature: `CP6.pan_truncated_period_isomorphism` is stated about specific imported-data values (no quantification over imported structures) and given an admitted proof; hypotheses or conclusions a carrier cannot express are left out and named in its docstring. Completed by REV-CohomologyComparisons.

## Structural proposals and return interfaces

FIX-RT-AREA-padic-1 settles P8:primitive after P8:local-rational and before CP.3. The proposed id is still neither an atlas stage nor reserved. CP.6 currently groups early core exports with six adapters that consume T6:comparison or PR.7; a return from this whole stage to R06.6 creates the reviewed cycles.

Split the present CP.6 into a core retaining its seven coefficient/product/arithmetic exports and a successor CP.6:log-truncated containing precisely the five Pan nodes and the GR relative filtered agreement node listed below. Order ordinary CP.3, T6:comparison, S3, CC.8 and the PR.7 relative extension before that successor. Only the core may supply R06.6 or the arithmetic local–global application. Keep the present parent ids until independent structural review authorizes new atlas ids. P8:primitive follows local-rational; the separate DLLZ log-primitive cut follows log-sites and precedes log comparison. For the CP.0 site target, keep ordinary A1/H1/H0 projections in CP.0 and route logarithmic analytic projections through the late Pan adapter. A separate early T6 log-site projection prefix can be proposed from the exact log-site-projections node; do not return the whole T6:log-sites stage to CP.0, since its log-algebra/Abhyankar closure is downstream of arithmetic stages.

The id `CohomologyComparisons:CP.6:log-truncated` is a proposal, absent from the atlas and reserved-id registry. Its membership is exact:

**Successor members.**

- `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion`
- `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`
- `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`
- `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map`
- `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism`
- `CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement`

**Core members.**

- `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`
- `CohomologyComparisons:CP.6/trace-normalized-tate-period`
- `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`
- `CohomologyComparisons:CP.6/first-chern-class-comparison`
- `CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison`
- `CohomologyComparisons:CP.6/geometric-arithmetic-export`
- `CohomologyComparisons:CP.6/habiro-and-trace-specialization-export`

After structural review moves every member to the successor and checks the global graph, add CP.6 core → R06.6; no such link is declared in this packet.

The routed Kisin, analytic/algebraic C_st, counterexample, prismatic-Chern and trace-character inputs go beyond some currently stated supplier scopes. They cannot be replaced by weaker classification or cohomological-rank assertions.

Extend the named owners with source-qualified Part II cuts: all-weight crystalline-lattice Kisin in R07.4; h-derived/overconvergent HK and the early BC/syntomic proof bridge for CN in CR.6/rational period theory before CP.4; positive-characteristic Bertini/Enriques lifting where the moduli owner supplies the §2 construction; PR.4 crystalline/prismatic/syntomic Chern and projective-bundle interfaces; RT cyclotomic-character normalization. Keep CP’s nodes as map-comparison applications of those inputs, not duplicate foundational developments. In RT.6 keep the early THH/prismatic/Nygaard comparison before PR.7 and put the CP.6-consuming cyclotomic-character compatibility in a distinct late suffix; a CP.6→whole RT.6 return would be circular through PR.7. Also: a PrismaticCohomology extension downstream of PR.7’s crystals for the Guo–Reinecke relative equivalence and GR Theorem 9.15 (PR.7 states the equivalence only for Spf O_K); and an owner for BMS1 §13’s approximation/spreading inputs (gap G-spreading-inputs), which AdicSpacesPartII R5 does not state.

- `CohomologyComparisons:CP.6` → `PadicHodgeTheory:R06.6`: Geometric period comparison maps and all equivariance/filtration/twist data for arithmetic consequences; no reverse prerequisite. Review: declared only after the T6- and PR.7-consuming adapters leave CP.6 (restructure); with them in CP.6 a CP.6 → R06.6 edge closes a stage cycle.
- `CohomologyComparisons:CP.6` → `AutomorphicGaloisRepresentationsPartII`: Actual local crystalline/semistable/de Rham cohomological realizations; the consumer proves automorphic local–global compatibility with its additional hypotheses. Review: declared only after the T6- and PR.7-consuming adapters leave CP.6 (restructure); with them in CP.6 a CP.6 → R06.6 edge closes a stage cycle.
- `CohomologyComparisons:CP.6` → `HabiroCohomologyFoundations:HQ.8`: Normalized specialization and Chern diagram in the common range; HQ.8 proves q-gluing.
- `CohomologyComparisons:CP.6` → `RefinedTraceMethods:RT.6`: Same coefficient/Chern maps for the owner’s cyclotomic-character compatibility. This means a late cyclotomic-character adapter, not a prerequisite on RT.6’s early generic THH/prismatic comparison, which supplies PR.7. The owner must split that suffix to avoid a cycle.

The packet declares no return link to the whole R06.6 or RT.6 stage. Whole-stage returns would feed late arithmetic or character consumers into their own comparison prerequisites. The exact CP node graph is acyclic; the union with unaccepted supplier packets has external stage cycles, recorded in the dependency gap and handoff.

## Inherited supplier evidence

These preserved ids identify imported evidence records, not declarations owned by CP. The accepted transfer of tagged generic §4.2 material to AI.5 does not transfer §3 Witt coherence or AI.2 torsion decompositions. AI.5 imports those inputs from their owners. The inline length observation and semistable normalized lengths remain requested scope extensions.

| Preserved evidence id | Supplier | Content |
| --- | --- | --- |
| `CohomologyComparisons:CP.0/coherence-of-witt-vectors-of-perfectoid-integers` | `AInfCohomology:AI.0:integral` | Coherence of W_r(O) and finite presentation over A_inf/p^n |
| `CohomologyComparisons:CP.2/rational-crystalline-base-change-along-residue-section` | `CrystallineCohomology:CR.3` | Rational crystalline base change from W(k) to A_crys along a residue-field section (BMS1 Proposition 13.21) |
| `CohomologyComparisons:CP.5/perfectness-and-tor-bounds-for-ainf-modules` | `AInfCohomology:AI.5` | Perfectness, bounded torsion and Tor-dimension of finitely presented A_inf-modules |
| `CohomologyComparisons:CP.5/ainf-module-structure-theorem` | `AInfCohomology:AI.2` | Structure of finitely presented A_inf-modules free after inverting p |
| `CohomologyComparisons:CP.5/specialization-length-inequality` | `AInfCohomology:AI.5` | Length goes up under specialization for finitely presented W_n(O♭)-modules |
| `CohomologyComparisons:CP.5/witt-versus-tilt-specialization-inequality` | `AInfCohomology:AI.5` | Rank equality and length inequality between the W(k)- and W(K♭)-specializations |
| `CohomologyComparisons:CP.5/derived-to-degreewise-witt-specialization` | `AInfCohomology:AI.5` | Degreewise versus derived W(k)-specialization: injectivity and the adjacent-degree obstruction |
| `CohomologyComparisons:CP.5/finite-presentation-and-freeness-criterion` | `AInfCohomology:AI.5` | Finite presentation of cohomology, freeness from a torsion-free crystalline specialization, and the adjacent-degree equality |
| `CohomologyComparisons:CP.5/mu-inverted-freeness-criterion` | `AInfCohomology:AI.5` | Freeness after inverting p from μ-inverted and B_crys^+ freeness |
| `CohomologyComparisons:CP.5/length-monotonicity-under-torsion-cokernel` | `AInfCohomology:AI.5` | Length modulo p^n is monotone along injections with torsion cokernel |

## Supplier contracts

A fine node is cited only for the portion of its statement inspected here. A remaining broad stage prerequisite is an explicit request for a stronger range, coefficient topology, enhancement or geometric extension; its presence does not assert supplier completion. Every request carries the current independent supplier-scope review in the packet; the review report gives the same boundary check.

### AInfCohomology:AI.0:integral

For complete algebraically closed C/Q_p, the shared A_inf=W(O_C^♭), its topology, φ, θ, θ̃=θφ⁻¹, compatible roots ε, μ=[ε]−1, ξ=μ/φ⁻¹μ, ker θ=(ξ), ker θ̃=(φξ), Witt reduction with ξ↦p and μ↦0, and the natural ring maps. Include μ a unit after W(C^♭) extension and the BK twists. Coefficient constructions remain AI.0, not CP.0. Witt-vector coherence and finite presentation over A_inf/p^n (BMS1 Propositions 3.24–3.29) are this owner’s supplier evidence, imported by AI.5; they were not transferred as tagged §4.2 material.

Consumers: `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `CohomologyComparisons:CP.1/mu-inverted-etale-specialization`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AInfCohomology:AI.0:period-comparison

The p-adically completed coefficient-to-period ring comparison and the μ-inverted étale sheaf comparison, with its actual functorial maps and φ action; supply the difference between the two topologies/completions before rational scalar extension.

Consumers: `CohomologyComparisons:CP.0/ainf-specialization-dictionary`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AInfCohomology:AI.1

Lη/Bockstein comparison for the ξ/ξ̃ specializations, its multiplicative enhanced form, logarithmic Koszul coordinates and the localization identity when the décalage element becomes a unit; actual natural transformations rather than rank identities.

Consumers: `CohomologyComparisons:CP.1/hodge-tate-specialization`, `CohomologyComparisons:CP.1/multiplicative-bockstein-coherence`, `CohomologyComparisons:CP.3/local-bdr-etale-map`.

Inspected fine inputs used for these consumers: `AInfCohomology:AI.1/bockstein-reduction`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AInfCohomology:AI.2

BKF modules, φ linearization, the Fargues functor to pairs (T,Ξ) with its full faithfulness in the range used for lattice recovery, and the normalization of twists. Essential surjectivity is only needed for constructing M(T); state the source proof and hypotheses rather than assuming it from the definition. Retain the BMS1 Lemmas 4.10–4.13 torsion-decomposition/module-structure package at AI.2 and export it upstream of AI.5; its inherited CP evidence alias is corrected to this owner.

Consumers: `CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization`, `CohomologyComparisons:CP.5/lattice-recovery-over-C`, `CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AInfCohomology:AI.3

The sheaf A_inf,X on the corrected pro-étale site and its almost/coefficient reductions; the local-coordinate Witt and perfectoid tower maps with compatibility in the finite truncation indices used by Pan. Extend the sheaf package to the infinite-level perfectoid modular curve and its A_inf/(ker θ)^k almost quotients; supply analytic/étale finite-Witt comparison and higher π_HT direct-image vanishing on S3 affinoid-perfectoid preimages. The finite smooth-formal toric construction alone does not supply this.

Consumers: `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map`, `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AInfCohomology:AI.4

BMS1 Theorem 14.1’s sheaf-level smooth AΩ comparison maps: θ-de Rham, θ̃-Hodge–Tate with BK twist, Witt/de Rham–Witt and A_cris/PD comparison with φ and products. Supply the all-coordinate explicit-complex maps from §12.2 for the CP.3 agreement check.

Consumers: `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.1/theta-de-rham-specialization`, `CohomologyComparisons:CP.1/hodge-tate-specialization`, `CohomologyComparisons:CP.1/acris-specialization`, `CohomologyComparisons:CP.3/local-bdr-etale-map`, `CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification`, `CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement`.

Historical supplier scope assessment: covered. The revised need above and the exact prerequisite lists define the current contract.

### AInfCohomology:AI.5

Proper smooth perfect K_A and its finite-presentation/BKF package, almost-to-integral étale comparison and specialized φ-compatible maps. AI.5 supplies the tagged generic §4.2 perfectness/Tor, length, adjacent-degree and μ-inverted-freeness statements; it imports Witt-vector coherence from AI.0:integral and Lemmas 4.10–4.13 torsion decompositions from AI.2. Lemma 4.18 and the inline length monotonicity are explicit generic scope clarifications. CK normalized valuation lengths and scalar-extension invariance are an AI.5 semistable extension consumed through AI.6, not consequences of the accepted smooth §4.2 transfer. CR.3 supplies the rational Frobenius-isogeny input upstream; neither CP.1 nor CP.2 may be a prerequisite of AI.5 perfectness. Correct the current unaccepted AI.0 packet’s CP.1 → AI.5/proper-perfectness back edge before promotion.

Consumers: `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.1/singular-and-completed-boundary`, `CohomologyComparisons:CP.2/rational-degreewise-comparison`, `CohomologyComparisons:CP.5/crystalline-de-rham-torsionfreeness-equivalence`, `CohomologyComparisons:CP.5/integral-torsion-length-inequality-over-C`, `CohomologyComparisons:CP.5/lattice-recovery-over-C`, `CohomologyComparisons:CP.5/mod-p-de-rham-dimension-bound`, `CohomologyComparisons:CP.5/semistable-normalized-de-rham-torsion-export`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AdicEtaleGeometry:A1

Compatible analytic étale and corrected pro-étale sites, geometric fibre pullbacks, perfectoid bases and site morphisms; base change on the explicitly specified formal/analytic objects and derived sheaf cohomology.

Consumers: `CohomologyComparisons:CP.0/site-and-geometric-point-compatibility`, `CohomologyComparisons:CP.3/very-small-affinoid-embedding`, `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/local-bdr-etale-map`, `CohomologyComparisons:CP.3/relative-infinitesimal-site`.

Inspected fine inputs used for these consumers: `AdicEtaleGeometry:A1/proetale-field-extension-slice`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `AdicEtaleGeometry:A1/profinite-galois-cover-is-covering`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AdicSpacesPartII:R0

Rigid affinoids over B_dR⁺/ξ^n and ξ-completed Tate algebras: BMS1 Lemma 13.4, noetherianity, flatness/completion for a finitely generated defining ideal, smooth lift and formal-étale coordinate extension. Supply these analytic algebra facts once; CP owns their embedding-cohomology application.

Consumers: `CohomologyComparisons:CP.3/very-small-affinoid-embedding`, `CohomologyComparisons:CP.3/infinitesimal-envelope`, `CohomologyComparisons:CP.3/noetherian-approximation-interface`, `CohomologyComparisons:CP.3/completed-smooth-lift`, `CohomologyComparisons:CP.3/envelope-normal-form`, `CohomologyComparisons:CP.3/embedding-independence-and-reduction`, `CohomologyComparisons:CP.3/relative-infinitesimal-site`.

Inspected fine inputs used for these consumers: `AdicSpacesPartII:R0/differentials-unramified-smooth-etale`, `AdicSpacesPartII:R0/smooth-toric-chart`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AdicSpacesPartII:R3

Proper coherent cohomological finiteness and continuous formal/analytic GAGA; finite-projective base change on a smooth affinoid base and the derived Nakayama/perfectness criterion used in BMS1 §13 and GR Corollary 10.9. These do not imply cohomology freeness without the separate degeneration argument.

Consumers: `CohomologyComparisons:CP.3/completed-smooth-lift`, `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/bdr-cohomology-finite-freeness`, `CohomologyComparisons:CP.3/hodge-de-rham-degeneration`, `CohomologyComparisons:CP.3/relative-infinitesimal-perfectness`.

Inspected fine inputs used for these consumers: `AdicSpacesPartII:R3/proper-affinoid-cohomology-finite`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AlgebraicModuliForArithmeticGeometry:R09.3

Existence and descent of finite-flat quotient spaces and E-torsors used by BMS1 §2, approximation of BG avoiding a codimension>2 stabilizer locus, and the projective quotient/ample-section construction. Supply the singular Enriques lift with Pic^τ=μ₂ and its K3 double cover, or an exact routed Part II source for it.

Consumers: `CohomologyComparisons:CP.5/enriques-torsion-counterexample`, `CohomologyComparisons:CP.5/degenerating-group-torsion-counterexample`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AlgebraicModuliForArithmeticGeometry:R09.6

Proper smooth formal spreading as in BMS1 Proposition 13.15 and Corollary 13.16, including algebraization/effectivity of the chosen deformation and descent along the complete filtered noetherian system, with base-change compatibility.

Consumers: `CohomologyComparisons:CP.3/proper-formal-spreading`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### AlgebraicModuliForArithmeticGeometry:R09.7

Characteristic-zero resolution and common generically finite domination used in trace/cycle arguments; h-hypercover/resolution support for arbitrary algebraic varieties in Beilinson’s comparison.

Consumers: `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`, `CohomologyComparisons:CP.6/trace-normalized-tate-period`, `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### ClassicalAdicEtaleCohomology:H1:formal-adic-comparison

Natural algebraic/formal/adic proper comparison for geometric étale cohomology and base change, retaining geometric points and finite coefficient systems, including its Z_p/Q_p passage under finiteness. Formal-to-special-fibre specialization morphism and compatible geometric points, distinct from Huber algebraic/analytic proper comparison. Expose the ordinary specialization/site prefix independently of the current whole-CR.5 stage closure; its log-algebra/Lefschetz-pencils dependency lies downstream of CP and cannot be a foundational site input.

Consumers: `CohomologyComparisons:CP.0/formal-algebraic-analytic-dictionary`, `CohomologyComparisons:CP.0/site-and-geometric-point-compatibility`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### ClassicalAdicEtaleCohomology:H5

Proper cohomology, derived scalar extension, Künneth and coefficient exact sequences on the specified analytic/étale sites. For Pan import the almost comparison of analytic and étale O⁺/p on an affinoid perfectoid basis and its truncated-Witt induction; do not identify the sites globally.

Consumers: `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CompletedCohomologyPartII:CC.2

p-adic derived inverse limits and cohomology control for the modular-curve tower, with Pan22 Lemma 4.4.4’s completeness input. The multiplication-p transition on adjacent-degree torsion, its inverse-Tate-module vanishing and the exact ML/lim¹ conditions must appear.

Consumers: `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CompletedCohomologyPartII:CC.4

A p-complete p-torsion-free Z_p chain complex S̃ with H^i(S̃)=H̃^i(K^p,Z_p) and H^i(S̃/p^m)=H̃^i(K^p,Z/p^m), functorial for tower transition/Hecke/Galois maps; coefficient interchange for complete p-torsion-free M in Pan Lemma 7.2.6.

Consumers: `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CompletedCohomologyPartII:CC.8

The modular-curve infinite-level tower, its π_HT: X_{K^p}→Fl and affinoid perfectoid preimages of the basis U∈B, with actions and coefficient sheaves; Pan22 Corollary 4.4.3’s almost integral and C-coefficient cohomology isomorphism. Supply an exact early adapter or scope extension, because CC.8 does not by its title alone promise Pan’s flag-variety calculation.

Consumers: `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion`, `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`, `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.0

Shared A_cris PD-envelope, its completed coefficient map from A_inf, PD reductions and extension to B_cris/B_dR⁺, with compatibility of the canonical period completion and Frobenius. Not a new coefficient-ring construction in CP.

Consumers: `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `CohomologyComparisons:CP.1/acris-specialization`, `CohomologyComparisons:CP.3/crystalline-to-infinitesimal-coefficients`.

Inspected fine inputs used for these consumers: `CrystallineCohomology:CR.0/fontaine-envelope`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.1

Crystalline sites and crystals in vector bundles/perfect complexes with the actual cartesian pullback condition, evaluation, functoriality and topology used to transfer crystalline coefficients to the relative infinitesimal site.

Consumers: `CohomologyComparisons:CP.3/relative-infinitesimal-site`, `CohomologyComparisons:CP.3/crystalline-to-infinitesimal-coefficients`.

Inspected fine inputs used for these consumers: `CrystallineCohomology:CR.1/crystal`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.2

PD-envelope Čech–Alexander and completed de Rham computation for smooth formal schemes and crystals, including independence of embeddings, scalar-extension maps and logarithmic differentials where admitted. The CP.3 relative comparison imports this generic computation.

Consumers: `CohomologyComparisons:CP.1/acris-specialization`, `CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square`, `CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification`, `CohomologyComparisons:CP.3/relative-cech-de-rham-comparison`.

Inspected fine inputs used for these consumers: `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/smooth-lift-filtration`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.3

Derived crystalline base change including BMS1 Proposition 13.21 after p-inversion for smooth qcqs residue schemes and an auxiliary residue-field section; its independence when descending from W(k). Proper smooth crystalline/de Rham comparison, weak Lefschetz in BMS1 Lemma 2.12’s range, Künneth/Leray, Illusie’s singular Enriques H_crys² torsion and the supersingular elliptic H_crys¹ calculation used in the two counterexamples are exact additional routed requests.

Consumers: `CohomologyComparisons:CP.0/formal-algebraic-analytic-dictionary`, `CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C`, `CohomologyComparisons:CP.2/residue-section-descent-adapter`, `CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification`, `CohomologyComparisons:CP.3/relative-crystalline-infinitesimal-base-change`, `CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin`, `CohomologyComparisons:CP.5/dvr-torsion-length-inequality`, `CohomologyComparisons:CP.5/mod-p-de-rham-dimension-bound`, `CohomologyComparisons:CP.5/enriques-torsion-counterexample`, `CohomologyComparisons:CP.5/degenerating-group-torsion-counterexample`, `CohomologyComparisons:CP.5/special-fibre-does-not-determine-integral-etale`, `CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison`, `CohomologyComparisons:CP.2/crystalline-geometric-examples`.

Inspected fine inputs used for these consumers: `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.3/kunneth`, `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/torsion-and-models`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.3:Frobenius-isogeny

Frobenius is an isogeny on rational crystalline cohomology of smooth affine and then smooth qcqs k-schemes, not just proper schemes; the affine range is needed in the proof of BMS1 Proposition 13.21. Include the crystalline base-change Frobenius-semilinear map.

Consumers: `CohomologyComparisons:CP.2/residue-section-descent-adapter`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.3:duality

Crystalline/de Rham Poincaré duality and trace with its dimension twist, degree formula under generically finite morphisms, regular-immersion Gysin adjunction and projective-bundle normalization in the proper smooth range.

Consumers: `CohomologyComparisons:CP.6/trace-normalized-tate-period`, `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.4

Smooth de Rham–Witt comparison with Frobenius and BMS1’s Witt specialization map, not merely the graded differential-form module.

Consumers: `CohomologyComparisons:CP.1/witt-crystalline-specialization`.

Inspected fine inputs used for these consumers: `CrystallineCohomology:CR.4/crystalline-comparison`, `CrystallineCohomology:CR.4/degree-scaled-frobenius`, `CrystallineCohomology:CR.4/perfectoid-base-change`.

Historical supplier scope assessment: covered. The revised need above and the exact prerequisite lists define the current contract.

### CrystallineCohomology:CR.6

Actual Hyodo–Kato complexes, φ,N with Nφ=pφN, log-base descent from the AI.6 W(k̄) model to arithmetic W(k₀), the B_st torsor map and the exact signed uniformizer-change cocycle. Also the algebraic h-derived and overconvergent rigid HK realizations of CN Theorems 6.2,6.4,6.8 and finite-dimensionality for proper rigid spaces. The latter require a CR Part II scope extension and do not follow from proper semistable log crystalline cohomology alone.

Consumers: `CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter`, `CohomologyComparisons:CP.4/semistable-period-comparison`, `CohomologyComparisons:CP.4/uniformizer-change-and-monodromy`, `CohomologyComparisons:CP.4/semistable-geometric-examples`, `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`, `CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison`, `CohomologyComparisons:CP.4/proper-rigid-c-period-comparison`.

Inspected fine inputs used for these consumers: `CrystallineCohomology:CR.6/hk-good-reduction`, `CrystallineCohomology:CR.6/hk-tate-curve`, `CrystallineCohomology:CR.6/integral-hk`, `CrystallineCohomology:CR.6/n-phi-relation`, `CrystallineCohomology:CR.6/uniformizer-change`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### EnhancedDerivedSheaves:E4

Derived completed tensor products, derived inverse limits, filtered stable/enhanced symmetric monoidal cohomology and sheaf hyperdescent, with Tor/ML and perfectness criteria. The ordinary baseline DerivedCategory is not a replacement for these structures. Support the proper comparison, completed envelope Čech systems and map-level multiplicativity.

Consumers: `CohomologyComparisons:CP.1/multiplicative-bockstein-coherence`, `CohomologyComparisons:CP.1/singular-and-completed-boundary`, `CohomologyComparisons:CP.3/completed-smooth-lift`, `CohomologyComparisons:CP.3/embedding-independence-and-reduction`, `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/relative-cech-de-rham-comparison`, `CohomologyComparisons:CP.3/relative-infinitesimal-perfectness`, `CohomologyComparisons:CP.3/relative-crystalline-infinitesimal-base-change`, `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`.

Inspected fine inputs used for these consumers: `EnhancedDerivedSheaves:E4/mod-ideal-detection`, `EnhancedDerivedSheaves:E4/the-imported-completion-interface`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### EtaleDualityAndPerverseSheaves:EDC.2:pairings

Perfect Poincaré pairings for smooth proper varieties with Z/p^n and Q_p coefficients in the used range, their dimension twist, cup normalization and comparison under scalar extension.

Consumers: `CohomologyComparisons:CP.5/enriques-torsion-counterexample`, `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`.

Inspected fine inputs used for these consumers: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`.

Historical supplier scope assessment: covered. The revised need above and the exact prerequisite lists define the current contract.

### EtaleDualityAndPerverseSheaves:EDC.2:trace-purity

Proper smooth trace with target Q_p(−d), degree compatibility and normalization on projective space; purity/Gysin interfaces sufficient for the trace-normalized period and cycle comparison.

Consumers: `CohomologyComparisons:CP.6/trace-normalized-tate-period`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### EtaleDualityAndPerverseSheaves:EDC.3

Étale Kummer c₁, cycle classes for algebraic cycles, regular-immersion Gysin, proper pushforward and trace-adjunction characterization, with degree and Tate twists. De Rham dlog and the proper projective compactification P(O⊕L) supply the matched cycle proof; CP compares these classes.

Consumers: `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`, `CohomologyComparisons:CP.6/first-chern-class-comparison`.

Inspected fine inputs used for these consumers: `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`, `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### EtaleDualityAndPerverseSheaves:EDC.4

Projective-bundle and complete flag-bundle splitting, injectivity of pullback and the elementary-symmetric-polynomial construction of higher Chern classes; sign/normalization and zero/infinity-section formulas for P(O⊕L) are explicit.

Consumers: `CohomologyComparisons:CP.6/first-chern-class-comparison`, `CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison`.

Inspected fine inputs used for these consumers: `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`, `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`, `EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1

Flat closure of a generic p² torsion point in a supersingular elliptic curve, G_C≃Z/p² and G_k=E_k[p]; finite-flat group quotients and degeneration Z/2→μ₂ used in BMS1 Lemmas 2.5,2.7,2.9 and Proposition 2.2. Supply their actual existence proofs rather than assuming equal ranks determine a finite-flat group.

Consumers: `CohomologyComparisons:CP.5/enriques-torsion-counterexample`, `CohomologyComparisons:CP.5/degenerating-group-torsion-counterexample`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3

Fontaine–Laffaille normalization and integral realization for absolutely unramified K, safe shifted interval [0,p−2], and the explicit restricted endpoint [0,p−1] subcategories. At p=2 the safe interval is [0,0]. Include the covariance and HT-sign translation, not only an unspecified small-weight condition.

Consumers: `CohomologyComparisons:CP.5/small-weight-integral-interface`.

Inspected fine inputs used for these consumers: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-full-faithfulness`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence`.

Historical supplier scope assessment: covered. The revised need above and the exact prerequisite lists define the current contract.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

Extend the finite-flat/p-divisible scope to the all-Hodge–Tate-weight crystalline-lattice Kisin functor in BMS1 Theorem 4.4: existence, full faithfulness, the S[1/u]^∧_p↔G_{K∞} equivalence, uniqueness, and Proposition 4.34’s B_cris⁺ comparison. S→A_inf is φ on W(k), u↦[π^♭]^p; S→W(k) is φ on W(k), u↦0. Include dyadic hypotheses. R06.2 rational admissibility cannot recover the integral lattice.

Consumers: `CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin`, `CohomologyComparisons:CP.5/small-weight-integral-interface`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### HodgeTateAndCanonicalSubgroups:T6:comparison

Log structural period sheaves, log Faltings extension, truncated log Poincaré complex and the filtered locally analytic coefficient construction needed only for Pan Proposition 6.3.9. Pan §7.2.3–7.2.6 uses ordinary truncated B_dR^+ and S3 perfectoid flag preimages instead.

Consumers: `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion`.

The former completed-coefficient and truncated-isomorphism consumers were removed: T6:comparison does not construct their ordinary Fl sheaf.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### HodgeTateAndCanonicalSubgroups:T6:log-sites

Log-site-projections supplies the pro-Kummer/Kummer/ordinary étale projections for locally noetherian fs log adic spaces, with ordinary generic-fibre cohomology on the trivial-log locus. Import it for the late Pan log adapter realizing CP.0. CR.5 supplies log-PD sites instead. A whole-stage T6:log-sites → CP.0 edge is forbidden: propose an early projection prefix before late logarithmic Abhyankar inputs if the atlas needs an early site-return link.

Consumers: `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion`.

Historical supplier scope assessment: covered. The revised need above and the exact prerequisite lists define the current contract.

### PadicHodgeTheory:P8:local-rational

Early rational relative period sheaves, local acyclicity, filtered Poincaré lemma and strictness from corrected Scholze covers: p-complete the integral tensor before p-inversion and ker θ completion. This request excludes the subsequent proper-global comparison theorem. Scholze’s primitive finiteness/almost comparison is a separate gap and proposed early owner, not smuggled into this stage’s scope. For Pan §7.2 use ordinary B_dR,k^+ on affinoid perfectoids, finite truncation/reduction maps and flatness over B_dR,k^+; extension to the pushforward sheaf on Fl and the coefficient-interchange map is the CP.6 adapter, not the global P8 proper comparison.

Consumers: `CohomologyComparisons:CP.3/local-bdr-etale-map`, `CohomologyComparisons:CP.3/canonical-bdr-etale-comparison`, `CohomologyComparisons:CP.3/descended-de-rham-lattice`, `CohomologyComparisons:CP.3/filtered-de-rham-comparison`, `CohomologyComparisons:CP.3/hodge-tate-degeneration`, `CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement`, `CohomologyComparisons:CP.6/first-chern-class-comparison`, `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map`, `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism`.

Inspected fine inputs used for these consumers: `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/relative-poincare-lemma`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### PadicHodgeTheory:R06.1

Shared B_cris⁺, B_cris, B_st torsor and B_dR⁺/B_dR as topological rings with actual field/DVR, flatness and invariant properties where proved, embeddings and t/φ/N normalizations. Pinned BDeRham only defines a localization and supplies none of these field theorems.

Consumers: `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `CohomologyComparisons:CP.0/no-c-section-and-choice-transport`, `CohomologyComparisons:CP.2/period-invariants-and-admissibility`, `CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter`, `CohomologyComparisons:CP.4/semistable-period-comparison`, `CohomologyComparisons:CP.4/uniformizer-change-and-monodromy`, `CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization`.

Inspected fine inputs used for these consumers: `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### PadicHodgeTheory:R06.2

Period invariants and admissibility for crystalline/semistable/potentially semistable representations with the precise coefficient field, descent, φ,N and Hodge filtration; identify D_cris/D_st/D_pst of an already compared geometric representation, never construct the geometric comparison here.

Consumers: `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `CohomologyComparisons:CP.2/period-invariants-and-admissibility`, `CohomologyComparisons:CP.4/semistable-period-comparison`, `CohomologyComparisons:CP.4/semistable-geometric-examples`, `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`, `CohomologyComparisons:CP.4/algebraic-period-recovery-and-duals`, `CohomologyComparisons:CP.4/proper-curve-potential-period-interface`.

Inspected fine inputs used for these consumers: `PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible`, `PadicHodgeTheory:R06.2/admissible-representations`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### PadicHodgeTheory:R06.4

Covariance, decreasing filtration and HT(χ_p)=+1 convention translation among rational, Fontaine–Laffaille and Breuil–Kisin realizations; compatible semilinear φ pullback and S-specialization normalizations.

Consumers: `CohomologyComparisons:CP.5/small-weight-integral-interface`.

Inspected fine inputs used for these consumers: `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### PerfectoidSpaces:P3

Almost acyclicity of O⁺/p on affinoid perfectoid spaces, its finite Witt induction and the actual perfectoid tower preimages used by Pan; almost equality must retain the chosen ideal/category.

Consumers: `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`, `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map`.

Inspected fine inputs used for these consumers: `PerfectoidSpaces:P3/etale-almost-acyclicity`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### PrismaticCohomology:PR.4

Construct the prismatic, syntomic and crystalline first Chern classes of Bhatt–Lurie §§7–8, logarithmic boundary maps, twists, projective-bundle/flag splitting and their realization maps. The current general prismatic-cohomology stage does not name every Chern input; flag the exact scope extension before claiming CP.6 closed. AMMN Theorem 7.11, p.52: for formally smooth O_C-algebras identify the BMS weight-i syntomic sheaf on the formal pro-étale site with τ≤i Rψ_*Z_p(i), and rationalize. PR.4/syntomic-complex defines the fibre but its full nearby-cycle comparison alone does not establish this truncation formula. Include Lemma 6.19 reduction modulo p versus π invariance and the characteristic-p derived Frobenius eigenspace realization used by Theorem 7.13.

Consumers: `CohomologyComparisons:CP.6/first-chern-class-comparison`, `CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison`, `CohomologyComparisons:CP.2/nearby-cycle-crystalline-de-rham-pullback`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### PrismaticCohomology:PR.5

Source-qualified singular/animated prismatic comparison with its bounded-prism and derived completion hypotheses. CP.1’s smooth diagram is only transported in the intersection of these hypotheses, not asserted for every animated base.

Consumers: `CohomologyComparisons:CP.1/singular-and-completed-boundary`.

Inspected fine inputs used for these consumers: `PrismaticCohomology:PR.5/relative-site-comparison`.

Historical supplier scope assessment: covered. The revised need above and the exact prerequisite lists define the current contract.

### PrismaticCohomology:PR.6

The A_inf/prismatic φ-pullback comparison and its local q-de Rham/PD maps; BS22 Theorem 17.2 and §18 symmetric monoidal uniqueness with the Hodge–Tate structure map, perfect prism and p-completely smooth input. Supply the crystalline and de Rham Frobenius-twisted versus ordinary Hodge–Tate base changes.

Consumers: `CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison`, `CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square`.

Inspected fine inputs used for these consumers: `PrismaticCohomology:PR.6/ainf-omega-comparison`, `PrismaticCohomology:PR.6/comparison-uniqueness`.

Historical supplier scope assessment: partly. The revised need above and the exact prerequisite lists define the current contract.

### PrismaticCohomology:PR.7

Not within PR.7’s present scope: PR.7 states the crystalline-lattice/prismatic F-crystal equivalence only for X=Spf O_K (BS22 Theorem 5.6). Requested as a PR.7 extension downstream of its crystals: the Guo–Reinecke equivalence between crystalline Z_p-local systems on the generic fibre of a smooth formal scheme and analytic prismatic F-crystals, and GR Theorem 9.15’s étale–crystalline comparison for proper smooth f with F-crystal coefficients, with the perfect-prism/base-flatness hypotheses. The consumer, now in CP.6, only compares its B_dR specialization with the infinitesimal/de Rham map.

Consumers: `CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement`.

Historical supplier scope assessment: not covered. The revised need above and the exact prerequisite lists define the current contract.

### ClassicalAdicEtaleCohomology:H0

Derived pullback/pushforward and global-sections functoriality for the corrected site morphisms; no perfectoid acyclicity follows merely from existence of a cover.

Consumers: `CohomologyComparisons:CP.0/site-and-geometric-point-compatibility`.

### EnhancedDerivedSheaves:E2

For bounded-below algebraic h-derived HK/de Rham realizations, import bounded-below hypercover descent with a uniform lower bound. This abstract descent theorem does not construct a smooth h-hypercover or prove that HK/de Rham are h-sheaves; those are the CR.6/R09.7 extension requests.

Consumers: `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`.

### DerivedDeRhamCohomology:DD.2

For AMMN Construction 7.12 and Theorem 7.13, supply filtered p-completed derived de Rham Künneth for 𝔛₀⊗O_C, compatibility with the finite perfect smooth-proper Hodge filtration, and the Hodge-completed rational coefficient identification LΩ_{O_C/O_K}→B_dR^+ (Construction 7.6). p-completion is distinct from Hodge completion and from inverting p.

Consumers: `CohomologyComparisons:CP.2/nearby-cycle-crystalline-de-rham-pullback`.

## Open proof and interface gaps

### Early absolute and relative primitive comparison owner

`CohomologyComparisons/G-primitive`. Scholze Theorems 1.1, 1.3 and 5.1 give finite F_p local-system cohomology and absolute/relative almost O⁺/p comparison. FIX-RT-AREA-padic-1 settles the proposed P8:primitive after P8:local-rational, before CP.3. The proposed id is absent from the atlas and reserved registry. Request this early input in the local-rational owner prefix until that split is authorized; never import the CP.3-consuming proper P8 suffix. Retain corrected covers and the A_inf sheaf variant used by AI.5.

Needed by `CohomologyComparisons:CP.3/canonical-bdr-etale-comparison`, `CohomologyComparisons:CP.3/hodge-tate-degeneration`, `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.4/semistable-period-comparison`.

### Explicit map and homotopy agreement

`CohomologyComparisons/G-map-agreement`. BMS1 Theorem 14.5(i) says the maps agree on explicit complexes, while Proposition 13.23 gives the lattice comparison. The all-coordinate ring map X_u↦[u^♭], normalized logarithmic Koszul operators and degree-one/higher cup homotopies must be written as actual natural-transformation identities, including agreement with corrected P8 local sheaves. Their source sketches do not supply a named complete map API.

Needed by `CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement`, `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `CohomologyComparisons:CP.5/lattice-recovery-over-C`, `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`.

### Rational affine crystalline invariance proof

`CohomologyComparisons/G-affine-crystalline`. Verify CR.3’s requested smooth affine/qcqs Frobenius-isogeny and completed residue-section base-change theorem with the actual Berthelot–Ogus/Illusie source proof. Proper crystalline finiteness alone is insufficient; integral section-independence is not claimed. The generic result is preserved as a supplier record, not owned in CP.2.

Needed by `CohomologyComparisons:CP.2/residue-section-descent-adapter`, `CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C`.

### Relative filtered and singular extensions

`CohomologyComparisons/G-relative-filtration`. GR Theorem 10.13 specializes a PR.7 étale-crystalline comparison in the p-completely flat perfect-prism range with a compatible section; Remark 10.14 removes it only through OB_dR and Griffiths transversality. Complete the supplier map API and analytic éh/derived-de-Rham support before extending the smooth BMS/Guo agreement to singular spaces. The relative target nodes specify the comparison, but these type/proof foundations are not yet supplied. Review (REV-CohomologyComparisons): PR.7 does not supply either input. Its packet states the crystalline-lattice/F-crystal equivalence only for X=Spf O_K and has no analytic prismatic F-crystals and no GR Theorem 9.15; the relative GR equivalence is planned nowhere. The consumer node moved to CP.6 because PR.7 lies downstream of CP.2–CP.4 (CP.2/CP.3/CP.4 → R06.5 → PadicHodgeRegulators:L1 → PG.5 → PG.6 → P7 → PR.7).

Needed by `CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement`, `CohomologyComparisons:CP.3/absolute-relative-infinitesimal-agreement`.

### Hyodo–Kato log-base descent and signed transport

`CohomologyComparisons/G-hk-conventions`. Read and supply CR.6’s exact descent from the W(k̄),Q_{≥0} log base to W(k₀),N and uniformizer-change formula with N=−d/dT. Determine the sign from the torsor coordinates and prove the cocycle; CP.4 states that qualified transport rather than guessing the sign.

Needed by `CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter`, `CohomologyComparisons:CP.4/uniformizer-change-and-monodromy`.

### Log-prismatic agreement and semistable products

`CohomologyComparisons/G-log-products`. PR.8’s precise admitted log chart class and comparison map must be checked against CK. The full semistable A_cris comparison in CK is not claimed multiplicative; any tensor/cup enhancement needed by CP.6 requires a separate source/proof. Importing a smooth E∞ comparison does not prove it in the log case.

Needed by `CohomologyComparisons:CP.4/log-prismatic-agreement`, `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`.

### Analytic and algebraic C_st proof suppliers

`CohomologyComparisons/G-analytic-cst`. CN Theorem 6.2 quotes Beilinson’s h-descent algebraic comparison for arbitrary varieties; its original proof and the h-derived HK/de Rham realization are not provided by the semistable model theory. Theorems 6.4/6.8 use overconvergent syntomic/étale comparison in high twists, proper HK/de Rham finiteness and Banach–Colmez dimension theory. No suitable early BC/syntomic stage has been identified; R06.5/R06.6 consume CP.4 and cannot fill this gap. Propose a source-qualified Part II early prefix of rational p-adic Hodge theory/CR.6 and preserve filtered-complex cohomology in the over-C case.

Needed by `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`, `CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison`, `CohomologyComparisons:CP.4/proper-rigid-c-period-comparison`.

### All-weight crystalline-lattice Kisin scope

`CohomologyComparisons/G-kisin`. R07.4’s stage promises finite-flat/p-divisible classification, which is weaker than BMS1 Theorem 4.4 and Proposition 4.34 needed here. The old checkpoint’s detailed Kisin references are retained in the request. Read existence/uniqueness/full faithfulness in Kisin’s original sources and the Kummer restriction theorem, then extend its owner; R06.2 rational classification and R07.3 small weights do not close this gap.

Needed by `CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin`, `CohomologyComparisons:CP.5/small-weight-integral-interface`.

### Geometric counterexample imported existence inputs

`CohomologyComparisons/G-counterexamples`. The §2 proof outlines and torsion computations are planned, but the original proofs of the singular Enriques Z₂ lift (Lang–Ogus), Illusie’s crystalline calculation, finite-field Bertini (Gabber/Poonen), finite-flat group degenerations and BMS1 Lemma 2.12 weak Lefschetz remain exact supplier requests. R09.7’s resolution stage alone does not promise positive-characteristic Bertini; a supplier scope extension must assign it before closure. Review: the finite-field Bertini input was listed in the R09.7 request, whose consumers are CP.4/CP.6 nodes; it belongs here, with the CP.5 counterexamples, and has no owner yet.

Needed by `CohomologyComparisons:CP.5/enriques-torsion-counterexample`, `CohomologyComparisons:CP.5/degenerating-group-torsion-counterexample`, `CohomologyComparisons:CP.5/special-fibre-does-not-determine-integral-etale`.

### Chern class owners and proper compactification proof

`CohomologyComparisons/G-chern`. PR.4 must explicitly construct prismatic/syntomic/crystalline Chern classes, twists and splitting before CP compares them. Betts–Stix Proposition 3.20’s last paragraph uses the nonproper total space of L after proving cycle compatibility only for proper spaces. Supply the proper P(O⊕L) section/Gysin/projective-bundle proof. Equality of its trace-normalized a with the canonical Fontaine period is separately unproved in Remark 3.21 and is not used.

Needed by `CohomologyComparisons:CP.6/first-chern-class-comparison`, `CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison`, `CohomologyComparisons:CP.6/trace-normalized-tate-period`.

### Pan early tower and analytic control

`CohomologyComparisons/G-pan`. Supply the actual Pan22 Corollary 4.4.3 coefficient/flag comparison, complete torsion-free tower complex, LB-space analytic exactness, χ̃_l decompletion and the flat truncated period sheaf from the named modular/log suppliers. The general distribution roadmap L0 does not by itself supply analytic-vector exactness, so no incorrect distribution-stage prerequisite is used. Keep the Pan cohomological adapters after T6:comparison and the ordinary CP.3 core; the proposed stage refinement makes the routed extension explicit.

Needed by `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion`, `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`, `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism`.

### Trace character and Habiro return interfaces

`CohomologyComparisons/G-exports`. HQ.8 owns q-gluing and RT owns the cyclotomic Chern character; neither is reconstructed or assumed complete here. The consumer interfaces must take CP’s actual map and normalization, preserve all intersection hypotheses and record the p-adic/q=1 specialization square. The current RT stage text does not explicitly name every required character normalization; propose the scope clarification rather than replace it with an unnamed regulator.

Needed by `CohomologyComparisons:CP.6/habiro-and-trace-specialization-export`.

### Missing geometric and enhanced Lean interfaces

`CohomologyComparisons/G-lean-types`. The pinned libraries do not supply formal schemes, rigid spaces, crystalline/Hyodo–Kato theories, period maps, analytic infinitesimal sites or the modular-curve tower. The suggested file now has a typed declaration for every node, API item and test, including the Habiro/trace export and AMMN square, using owner-named carriers and specific imported-data values. Elaborating these admitted signatures does not supply the genuine enhanced types, coherent homotopies or proofs. Docstrings list the omitted mathematical clauses; owners must supply those types and the signatures must then be strengthened. In particular the Fnr carrier is the completion F̂^{nr}; HK and D_pst values are scalar-extended to it, and original F^{nr} smooth-vector descent must be restored by the owner. Pan integral inverse-limit signatures represent almostified modules through the almost category’s right adjoint, not an ordinary integral isomorphism.

Needed by `CohomologyComparisons:CP.0/formal-algebraic-analytic-dictionary`, `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/relative-infinitesimal-site`, `CohomologyComparisons:CP.4/semistable-period-comparison`, `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism`.

### Approximation and spreading-out inputs of BMS1 §13

`CohomologyComparisons/G-spreading-inputs`. BMS1 Lemmas 13.7–13.10 and Proposition 13.15/Corollary 13.16 are routed to CP.3 and owned here. AdicSpacesPartII R5 was cited for them but its text, as narrowed by RS-05, and its 42 nodes state neither the noetherian approximation of very small affinoids nor the spreading out of proper smooth rigid spaces; R09.6 supplies only algebraization/effectivity. Still unsupplied: the descent of a smooth affinoid with its torus chart to a smooth affinoid over a discretely valued subfield, and the deformation theory of a proper flat formal scheme over a complete noetherian local ring used in Proposition 13.15’s induction on artinian thickenings. Assign these to AdicSpacesPartII (approximation) and to the deformation owner (R09.6 or A0-extension), or plan them as CP.3 lemma nodes when CP.3 is refined.

Needed by `CohomologyComparisons:CP.3/noetherian-approximation-interface`, `CohomologyComparisons:CP.3/proper-formal-spreading`, `CohomologyComparisons:CP.3/bdr-cohomology-finite-freeness`, `CohomologyComparisons:CP.3/hodge-de-rham-degeneration`.

### Geometric transport and map agreement for the nearby-cycle square

`CohomologyComparisons/G-ammn-transport`. Theorem 7.13 supplies the target square, but the PR.4 truncated nearby-cycle and reduction-invariance identifications and DD.2 filtered Künneth/completion interfaces remain requests. RT.3b supplies the graded Beilinson square only with its generic RT.6 filtration inputs, never the CP.6-consuming character suffix. Remark 7.9 does not establish unrestricted equality of trace-constructed maps with classical Fontaine comparison maps; transporting its commutativity homotopy and proving agreement with CP.2/CP.3’s explicit maps are refinements, not consequences of matching objects.

Needed by `CohomologyComparisons:CP.2/nearby-cycle-crystalline-de-rham-pullback`.

### External supplier stage ordering before promotion

`G-supplier-stage-order`. The exact declaration graph reachable from CP has no cycle. The promotion-style stage graph formed from the current atlas, accepted restructuring links and all current supplier drafts does have cycles through CP.0–CP.4. In particular, the unaccepted AI.0 packet places a CP.1 prerequisite on AI.5/proper-perfectness, while CP.1 imports AI.5. The unaccepted CR.5 packet imports LPV.5 into CR.5:log-algebra, downstream of the arithmetic and rational comparison chain; H1:formal-adic-comparison imports the whole CR.5 stage and therefore carries that closure into CP.0. Independent recomputation in REV-CohomologyComparisons~2 found no exact reachable declaration cycle and again found stage-union cycles through CP.0–CP.4. Their external supplier causes are outside this review’s editable scope. The AI.5 perfectness proof must use the upstream crystalline Frobenius-isogeny input, and the ordinary formal-site prefix and elementary log-algebra prefix must be separated from subsequent comparison and Lefschetz-pencils consumers by their owners. The proposed CP.6 cut, P8 primitive cut and early T6 analytic log-site prefix remain proposals until structural review authorizes them. No global stage acyclicity or promotion readiness is claimed.

Needed by `CohomologyComparisons:CP.0/formal-algebraic-analytic-dictionary`, `CohomologyComparisons:CP.0/site-and-geometric-point-compatibility`, `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.4/logarithmic-integral-diagram`.

## Coverage and routed sources

- `CohomologyComparisons:CP.0`: planned; no proof closure. Remaining obligations are the gap entries attached to this stage in the packet. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.
- `CohomologyComparisons:CP.1`: planned; no proof closure. Remaining obligations are the gap entries attached to this stage in the packet. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.
- `CohomologyComparisons:CP.2`: planned; no proof closure. Remaining obligations are the gap entries attached to this stage in the packet. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.
- `CohomologyComparisons:CP.3`: planned; no proof closure. Remaining obligations are the gap entries attached to this stage in the packet. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.
- `CohomologyComparisons:CP.4`: planned; no proof closure. Remaining obligations are the gap entries attached to this stage in the packet. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.
- `CohomologyComparisons:CP.5`: planned; no proof closure. Remaining obligations are the gap entries attached to this stage in the packet. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.
- `CohomologyComparisons:CP.6`: planned; no proof closure. Remaining obligations are the gap entries attached to this stage in the packet. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

- PAPER-GUO-REINECKE-24: Relative infinitesimal §10.1 is owned in CP.3. The filtered agreement of §10.2 has actual parent CP.6 and requires a PR.7 relative extension supplying the crystalline local-system/analytic F-crystal equivalence and Theorem 9.15, absent from the current PR.7 packet. Nodes: `CohomologyComparisons:CP.3/relative-infinitesimal-site`, `CohomologyComparisons:CP.3/relative-cech-de-rham-comparison`, `CohomologyComparisons:CP.3/relative-infinitesimal-perfectness`, `CohomologyComparisons:CP.3/crystalline-to-infinitesimal-coefficients`, `CohomologyComparisons:CP.3/relative-crystalline-infinitesimal-base-change`, `CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement`.
- PAPER-COLMEZ-NIZIOL-25: Arbitrary algebraic and proper rigid K/C statements separately planned; h/BC/syntomic inputs remain exact owner gaps. Nodes: `CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison`, `CohomologyComparisons:CP.4/algebraic-period-recovery-and-duals`, `CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison`, `CohomologyComparisons:CP.4/proper-rigid-c-period-comparison`, `CohomologyComparisons:CP.6/geometric-arithmetic-export`.
- PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B: Only Proposition 3.12’s proper-curve potential period input routed here; no Drinfeld tower reconstruction. Nodes: `CohomologyComparisons:CP.4/proper-curve-potential-period-interface`.
- PAPER-BHATT-MORROW-SCHOLZE-18: §13 supporting results and §2 counterexamples added; generic §4.2 and rational residue-section theorem preserved as supplier evidence under RS-01. Nodes: `CohomologyComparisons:CP.0/ainf-specialization-dictionary`, `CohomologyComparisons:CP.0/formal-algebraic-analytic-dictionary`, `CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization`, `CohomologyComparisons:CP.0/no-c-section-and-choice-transport`, `CohomologyComparisons:CP.1/proper-ainf-input-package`, `CohomologyComparisons:CP.1/theta-de-rham-specialization`, `CohomologyComparisons:CP.1/hodge-tate-specialization`, `CohomologyComparisons:CP.1/witt-crystalline-specialization`, `CohomologyComparisons:CP.1/acris-specialization`, `CohomologyComparisons:CP.1/mu-inverted-etale-specialization`, `CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square`, `CohomologyComparisons:CP.1/multiplicative-bockstein-coherence`, `CohomologyComparisons:CP.1/singular-and-completed-boundary`, `CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C`, `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `CohomologyComparisons:CP.2/residue-section-descent-adapter`, `CohomologyComparisons:CP.2/rational-degreewise-comparison`, `CohomologyComparisons:CP.2/period-invariants-and-admissibility`, `CohomologyComparisons:CP.2/crystalline-geometric-examples`, `CohomologyComparisons:CP.3/very-small-affinoid-embedding`, `CohomologyComparisons:CP.3/infinitesimal-envelope`, `CohomologyComparisons:CP.3/noetherian-approximation-interface`, `CohomologyComparisons:CP.3/completed-smooth-lift`, `CohomologyComparisons:CP.3/envelope-normal-form`, `CohomologyComparisons:CP.3/embedding-independence-and-reduction`, `CohomologyComparisons:CP.3/proper-formal-spreading`, `CohomologyComparisons:CP.3/canonical-bdr-cohomology`, `CohomologyComparisons:CP.3/bdr-cohomology-finite-freeness`, `CohomologyComparisons:CP.3/local-bdr-etale-map`, `CohomologyComparisons:CP.3/canonical-bdr-etale-comparison`, `CohomologyComparisons:CP.3/descended-de-rham-lattice`, `CohomologyComparisons:CP.3/hodge-de-rham-degeneration`, `CohomologyComparisons:CP.3/hodge-tate-degeneration`, `CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification`, `CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement`, `CohomologyComparisons:CP.5/crystalline-de-rham-torsionfreeness-equivalence`, `CohomologyComparisons:CP.5/integral-torsion-length-inequality-over-C`, `CohomologyComparisons:CP.5/lattice-recovery-over-C`, `CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin`, `CohomologyComparisons:CP.5/dvr-torsion-length-inequality`, `CohomologyComparisons:CP.5/mod-p-de-rham-dimension-bound`, `CohomologyComparisons:CP.5/small-weight-integral-interface`, `CohomologyComparisons:CP.5/enriques-torsion-counterexample`, `CohomologyComparisons:CP.5/degenerating-group-torsion-counterexample`, `CohomologyComparisons:CP.5/special-fibre-does-not-determine-integral-etale`, `CohomologyComparisons:CP.6/habiro-and-trace-specialization-export`.
- PAPER-PAN-26: Five adapters have actual parent CP.6 and realize routed CP.0/CP.3 coefficient targets. Only Proposition 6.3.9 uses log structural period sheaves from T6; §7.2.3–7.2.6 uses ordinary truncated B_dR^+, S3 perfectoid flag preimages and AI.3/P3 almost acyclicity. Nodes: `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion`, `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`, `CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map`, `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism`.
- PAPER-BETTS-STIX-25: Propositions 3.19–3.20, trace-normalized a, duality/cycles/Chern; Remark 3.21 remains an explicit normalization boundary and the manuscript’s properness gap is recorded. Nodes: `CohomologyComparisons:CP.6/naturality-base-change-and-cup-products`, `CohomologyComparisons:CP.6/trace-normalized-tate-period`, `CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility`, `CohomologyComparisons:CP.6/first-chern-class-comparison`, `CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison`.
- PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22/route-7: Theorem 7.13, preprint pp.53–54, is the shared CP.2/CP.3 good-reduction pullback. Foundations are imported; the exact map-agreement and transport refinements remain G-ammn-transport. Nodes: `CohomologyComparisons:CP.2/nearby-cycle-crystalline-de-rham-pullback`.

## Source corrections

The following records describe the source statements and corrections in our own words. Formula references use the listed manuscript versions and their printed pages; no published-version claim is inferred when that version was not checked.

### CohomologyComparisons/E1 (error)

Scholze 2013 Proposition 3.7(i), official erratum (1), pp.1–2.

Recorded source issue: The source claims that a surjection between profinite sets always has a continuous splitting whenever the map is continuous and open.

Correction: Use transfinite inverse systems whose successor-to-limit transition is the pullback of a surjection of finite sets; restrict the pro-étale covers accordingly. Do not use the deleted Propositions 3.8/3.13 point descriptions.

Reason: The official erratum rejects the general splitting assertion using Ribes–Zalesskii Example 5.6.9 and proves a transfinite finite-surjection criterion instead; it does not change the main comparison results.

Effect: the proof. Status: Official Scholze erratum, items (1)–(2); imported correction, not a newly claimed discovery.

### CohomologyComparisons/E2 (error)

Scholze 2013 Definition 6.8 (arXiv v2, p.37); official erratum (3), pp.1–2.

Recorded source issue: The source describes the definition of OB+dR as erroneous and says that, following Brinon’s book [1], OBinf = OX ⊗W(κ) Binf must first undergo an appropriate p-adic completion.

Correction: p-complete the integral tensor of the formal coefficients with A_inf before p-inversion; then take the kernel-of-θ completion and sheafification. Do not take the uncompleted tensor as the structural period sheaf.

Reason: Erratum (3), pp.1–2, replaces the structural period construction by integral p-completion, then p-inversion and kernel completion, and reproves its local description. The comparison results remain valid.

Effect: the proof. Status: Official Scholze erratum (3).

### CohomologyComparisons/E3 (gap)

Betts–Stix author manuscript 29 April 2022, Proposition 3.20(8), last proof paragraph, p.28.

Recorded source issue: The source refers to the zero section’s cycle class in V.

Correction: Give a proper projective-compactification argument in P(O⊕L) with its zero/infinity-section Gysin classes and projective-bundle formula, or first prove the corresponding nonproper cycle comparison.

Reason: In the 29 April 2022 manuscript, Proposition 3.20(7) assumes a smooth proper variety. The proof of (8) applies it to the nonproper total space of a line bundle. A section of the proper smooth P(O⊕L), with normal bundle L, repairs this use through self-intersection. This check makes no assertion about an inaccessible published proof.

Effect: the proof. Status: No correction found in the checked author manuscript, author publication list, arXiv v1 record or Annals landing page; the published full-text proof was not available in this check. No claim that the published version retains this step.

### CohomologyComparisons/E4 (misprint)

Česnavičius–Koshikawa, arXiv:1710.06145v3, proof of Proposition 9.2, p.76.

Recorded source issue: The source describes N as combining two monodromies, those of RΓlog cris(𝒳k0/W(k0)) and B+st.

Correction: Read RΓlog cris(𝒴k0/W(k0)), the log crystalline complex of the chosen descent 𝒴 on the left side of (9.2.2).

Reason: Proposition 9.2 involves 𝔛 over O_C and a descent 𝒴 of 𝔛_{O_C/p} over O/p; the left side of (9.2.2) is RΓlog cris(𝒴k0/W(k0)), while 𝒳k0 is undefined there (the O_K-model 𝒳 appears only in Theorem 9.5). In Theorem 9.5 the proposition is applied with 𝒴=𝒳_{O_K/p}, where the two agree.

Effect: nothing. Status: new; not checked against the published version (Compositio Math. 155 (2019)); arXiv v3 is the latest arXiv version

### CohomologyComparisons/E5 (misprint)

Pan, arXiv:2209.06366v1, Proposition 6.3.9, p.101.

Recorded source issue: The source introduces natural maps for integer parameters satisfying i ≥ 0 and l > 0.

Correction: Add the hypothesis k > i: the three maps from gr^i of OB+dR,k are isomorphisms for i < k.

Reason: The quotient by Fil^k has zero graded piece in degree i≥k, whereas the untruncated locally analytic target need not vanish. The paragraph following Proposition 6.3.9 explicitly restricts the stable graded piece to k>i.

Effect: nothing. Status: new; only arXiv v1 exists and the published 2026 version was not checked

### CohomologyComparisons/E6 (misprint)

Colmez–Nizioł, author manuscript CN5 (24 November 2024), Theorem 6.4, display (6.5), p.40.

Recorded source issue: Display (6.5) names the C-valued de Rham cohomology where the asserted filtered K-dual requires its K-structure.

Correction: Read H^r_{dR,K}(X)^*, the K-structure used in the statement of Theorem 6.4.

Reason: In §6.2.2, X = X_{K,C}, so H^r_dR(X) is a C-vector space and cannot be a filtered K-module; the theorem itself compares with H^r_{dR,K}(X) ⊗_K B_dR.

Effect: nothing. Status: new; the published 2025 version was not checked

### CohomologyComparisons/E7 (misprint)

BMS1 arXiv:1602.03148v3, §4.4, p.43.

Recorded source issue: The source gives 𝔖 = W(k)[[T]] a Frobenius ϕ and calls it an automorphism.

Correction: Frobenius endomorphism: ϕ (Frobenius on W(k), T ↦ T^p) is injective but not surjective on W(k)[[T]].

Reason: The Frobenius on W(k)[[T]] sends T to T^p, so T has no preimage. The §4.4 map is an endomorphism; its uses do not require surjectivity.

Effect: nothing. Status: new; not among PAPER-BHATT-MORROW-SCHOLZE-18/E1–E22; the published IHÉS version was not checked

## Source register

- **Integral p-adic Hodge theory**, Bhargav Bhatt, Matthew Morrow, Peter Scholze. arXiv:1602.03148v3 (2019), printed pagination. [Public source](https://arxiv.org/pdf/1602.03148v3). SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`. §2, pp.13–18; §3.3 and §4.2–4.4 retained source records; §5.1–5.2; §12.2 comparison models; §13, pp.104–117; §14, pp.118–122.
- **The A_inf-cohomology in the semistable case**, Kęstutis Česnavičius, Teruhisa Koshikawa. arXiv:1710.06145v3, printed pagination. [Public source](https://arxiv.org/pdf/1710.06145v3). SHA-256 `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57`. §§6–9, especially Proposition 6.8, §7.6, Theorems 7.9,7.12, §7.10–7.11, §8.2–8.6, Theorem 8.7, Remark 8.8, §9.1–9.6; supplier packet consulted for earlier construction.
- **A prismatic approach to crystalline local systems**, Haoyang Guo, Emanuel Reinecke. arXiv:2203.09490v3 (2023); source of published 2024 paper. [Public source](https://arxiv.org/pdf/2203.09490v3). SHA-256 `3c49a5f2aa6023c7b01a5ba83a370ddcb92642f4819f64446b7d93bf01b28d26`. §10.1, pp.93–99, Definitions 10.1, Lemma 10.3, Construction 10.6, Theorem 10.7, Corollaries 10.8–10.9, Propositions 10.10–10.11; §10.2 Theorem 10.13 and Remark 10.14 statements.
- **Crystalline cohomology of rigid analytic spaces**, Haoyang Guo. arXiv:2112.14304v1 (2021). [Public source](https://arxiv.org/pdf/2112.14304v1). SHA-256 `718c048a52f16ac86d8590283bb12bc705be2cc1fa6d800bf2d7cc0dae0ea6cb`. §1.2 Theorem 1.2.7 and Corollary 1.2.11; §2.2 envelopes; §4.1 Čech–de Rham comparison and Lemma 4.1.10; only the smooth comparison needed here, singular and éh proofs remain a gap.
- **On the cohomology of p-adic analytic spaces, II: The C_st-conjecture**, Pierre Colmez, Wiesława Nizioł. Author manuscript CN5, 24 November 2024, published 2025. [Public source](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). SHA-256 `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a`. §1.1 conjectures and Remark 1.3; §6.2, Theorems 6.2,6.4,6.8, their proofs and Remark 6.10, pp.40–43; earlier syntomic and Banach–Colmez inputs are supplier requests.
- **Galois sections and p-adic period mappings**, L. Alexander Betts, Jakob Stix. Author manuscript 29 April 2022, source of 2025 paper. [Public source](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf). SHA-256 `7aa79403eff72d06b481424ab4c1f34a8cde68edd62f0d0923ad89cca082f565`. §3.4, Propositions 3.16–3.20 and Remark 3.21, pp.25–28, trace, duality, cycles and Chern classes.
- **On locally analytic vectors of the completed cohomology of modular curves II**, Lue Pan. arXiv:2209.06366v1 (2022), source of published 2026 paper. [Public source](https://arxiv.org/pdf/2209.06366v1). SHA-256 `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`. §6.3.9, pp.100–101; §7.2, pp.118–120, Proposition 7.2.3 and Lemmas 7.2.4–7.2.6; constructions of period sheaves remain imports.
- **Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1**, Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł. Author manuscript GPW5, source of 2020 paper. [Public source](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). SHA-256 `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776`. §3.3, Proposition 3.12 and proof, pp.35–36; proper-curve C_st input, D_pst=H_HK¹ and Fil¹D_dR=Ω¹; the Drinfeld tower results are outside this route.
- **Prisms and prismatic cohomology**, Bhargav Bhatt, Peter Scholze. arXiv:1905.08229v4, 12 January 2022, printed pagination. [Public source](https://arxiv.org/pdf/1905.08229v4). SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`. §18 comparison of integral comparison maps; statements and uniqueness hypotheses checked, construction imported from PR.6.
- **p-adic Hodge theory for rigid-analytic varieties**, Peter Scholze. Public arXiv:1205.3463 PDF, read together with official erratum. [Public source](https://arxiv.org/pdf/1205.3463v2). SHA-256 `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959`. Theorems 1.1,1.3,5.1,8.4 and §6 local period sheaf comparison; primitive/global results are imports.
- **Erratum to p-adic Hodge theory for rigid-analytic varieties**, Peter Scholze. Official author PDF, 3 pages. [Public source](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeErratum.pdf). SHA-256 `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235`. Entire erratum, corrected pro-étale covers, deletion of point descriptions, p-adic completion before ker θ completion.
- **On the Beilinson fiber square**, Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus. arXiv:2003.12541v2 (29 September 2021), printed preprint pagination. [Public source](https://arxiv.org/pdf/2003.12541v2). SHA-256 `2a0224b2e8b7c5f19f326886b130f8be0158ba4cb602ba7eb5821990ca22b3fd`. Theorem 6.17 and proof, pp.44–45; §§7.2–7.3, pp.51–54, especially Definition 7.10, Theorem 7.11, Construction 7.12 and Theorem 7.13 with proof.

## Validation and refinement

- packetCheck: python3 scripts/check_blueprint.py research/blueprint/packets/CohomologyComparisons.json: 0 errors, 0 warnings (2026-10-08); 83 nodes, 24 API items, 13 unit tests, 32 planets, 16 baseline declarations, 16 gaps, 48 requests; all seven stages planned. Preserved every existing node id; replaced the historical review with independent-review-REV-CohomologyComparisons~2; all implementation statuses remain unchecked.
- baselineSearch: Read all 16 baseline declaration statements at the exact Mathlib pin on 2026-10-08. BDeRham does not supply field/DVR structure, completion uses its stated finite-generation hypotheses, and DerivedCategory provides only the ordinary triangulated shadow. Tau Ceti source search at f790474 is recorded in the handoff.
- graph: Independent recomputation (2026-10-08): 4,754 exact references reachable from the 83 CP nodes, no cycle. Stage-union stress check uses 1,968 atlas stages/3,508 atlas edges, accepted data/restructure links and current decomposition/blueprint/draft prerequisites mapped by actual parentStageId: cycles include CP.0–CP.4, with the AI.5/CP.1 and CR.5/LPV.5 causes recorded in G-supplier-stage-order. Conditional returns and proposed cuts are not inserted as edges. This is not a certification that all supplier drafts can be promoted together.
- lean: lean-check exited 0 at the pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-08; 423 warnings, all admitted proofs, and no errors. Every node, API item and unit test has a typed interface. The file imports no Tau Ceti module; ordinary triangulated shadows, completed HK coefficients and almost-module representatives retain the explicit G-lean-types limitations.

Refinement must supply the genuine owner interfaces, expand the explicitly reconstructed map and coherence proofs, implement the reviewed structural cuts, and discharge the attached gaps. The suggested file is a signature prototype with admitted proofs, not a cohomology implementation. Independent review REV-CohomologyComparisons~2 accepts the finished target-level pass with those implementation and promotion limitations recorded.
