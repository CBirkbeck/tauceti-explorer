# Shimura data, Hermitian domains, and adelic level structures

This roadmap constructs the input to complex Shimura varieties: a rational reductive group and a full real conjugacy class of algebraic maps from the Deligne torus, with its homogeneous complex geometry, Hodge variations, reflex field and level conditions. It includes general pure data, then identifies Hodge, abelian and pre-abelian type as predicates with witnesses. A moduli interpretation belongs to the particular downstream construction that proves one.

The planning pass covers D0–D5. Every target and every in-scope item routed from the papers has a named declaration, or imports a named library declaration or supplier stage. All six stages are **planned**; none is closed. The packet is complete as a planning pass, and all declarations retain implementation status **unchecked**. The seven gaps and exact supplier requests below identify where proof leaves and prototype conditions remain open. The suggested Lean file is an uncompiled collection of interfaces; its comments identify the conditions left out. Its linear and point-level statements do not substitute for the complete specifications here.

## Conventions and ownership

Let S=Resℂ/ℝ Gₘ. Over ℂ its two factors are ordered so that a real point z maps to (z,z̄). Deligne's 1979 convention is

- V^{p,q} carries z^{−p}z̄^{−q}; its split character is (−p,−q).
- The Hodge cocharacter is μₕ(z)=hℂ(z,1), acting by z^{−p}.
- The diagonal d(t)=t acts on a pure weight-n object by t^{−n}; the inverse diagonal w(t)=t⁻¹ acts by tⁿ.
- ℚ(m) has type (−m,−m), weight −2m and character Nmᵐ. The homology of an elliptic curve has types (−1,0),(0,−1); its μ weights are 1 and 0.
- The pinned Hodge library's Weil operator acts by i^{p−q}; h(i) is its inverse. Milne and Deligne's references that call h(i) the Weil operator use that inverse convention.
- Fᵃ is the sum of pieces with p≥a. With the convention P(λ)={g: limₜ→₀ λ(t)gλ(t)⁻¹ exists}, its filtration stabilizer is P(μ⁻¹).

A datum (G,X) has a nonempty **full** G(ℝ)-conjugacy class X of algebraic S→Gℝ maps. It stores no distinguished base point. SV1 permits only the adjoint types (−1,1),(0,0),(1,−1); SV2 asks that conjugation by h(i) be Cartan on the adjoint group; SV3 excludes a trivial projection to a nontrivial ℚ-simple adjoint factor. Compact factors after extension to ℝ are permitted. Rationality of the weight, restrictions on its type and conditions on the rational center are stated separately when used.

The accepted RS-31 ownership is binding: ReductiveGroupsPartII RG2.0a constructs S, its Weil restriction, splitting, lattices, diagonal, inverse diagonal, norm and conjugation. D0 specializes its point comparisons; D1 exports the Hodge dictionary. The earlier checkpoint's first three node identifiers are retained as comparisons rather than duplicate constructions. Pure Hodge structures, opposed filtrations, polarization, tensors, duals and Tate twists come from the existing HodgeStructures roadmap and pinned declarations.

D2 adds the invariant Hodge complex structure to the general real-group and symmetric-space suppliers. D3 owns the common variation carrier, homogeneous variation, compact dual, conjugacy-class reflex definition, and the Kostant/Schubert interfaces used by the routed higher Hida and Coleman papers. It imports group/root/Bruhat theory and integral group schemes rather than rebuilding them. General non-Hermitian period domains, real-involution criteria and degeneration extensions belong to HodgeStructures Part II.

The accepted RS-23 assignment places the rational Hilbert G and G* data, reflex comparisons and trace embedding in D5. HilbertModularVarietiesAndShimuraCurves H1 and PELModuli M5 consume these results. General CM-type and reflex-type algebra belongs to CM.0; D5 constructs the associated torus datum. D1/D4 do not import the whole downstream CM.0 stage merely to prove their elliptic tests. Those rational Hodge-endomorphism comparison leaves are recorded precisely as a gap.

ArithmeticLocallySymmetricSpaces supplies general proper symmetric-space action. D5 constructs component subgroups and proves freeness **conditional on discreteness of the effective image**. ShimuraVarieties V0 consumes D5 and proves arithmeticity, automatic discreteness, existence of general neat levels and the component quotient theorem. There is no reverse V0→D5 prerequisite. D5's rank-two principal-level calculation and its unramified Iw₁ criterion are concrete tests and examples.

Weakly special subvarieties of A_g and the special-subvariety characterization of Hodge genericity remain with LogicAndDefinabilityPartII, downstream of the moduli space. D1 defines Hodge genericity by the rational Mumford–Tate group; it makes no premature assertion about a moduli-space locus.

## Layer overview


| Layer | Named declarations | Planets | Coverage |
| --- | ---: | ---: | --- |
| [D0 — Restriction of scalars and topological points](#d0) | 5 | 1 | planned |
| [D1 — The Deligne torus and Hodge structures](#d1) | 21 | 4 | planned |
| [D2 — Real reductive groups and Hermitian domains](#d2) | 12 | 4 | planned |
| [D3 — Homogeneous variations and compact duals](#d3) | 25 | 6 | planned |
| [D4 — Data, morphisms, and distinguished classes](#d4) | 15 | 6 | planned |
| [D5 — Levels and explicit examples](#d5) | 37 | 6 | planned |

## Sources read and baseline

The reviewed library audit was read before this extension. Each baseline declaration below was located in the full declaration index and its head and hypotheses read in the source tree at the exact recorded commits. The index is a search aid, not evidence that a near-matching statement supplies an input. Mathlib already provides traces, fixed fields, generated subgroups, matrices and additive valuations; Tau Ceti supplies the weight-space and pure Hodge operations. The plan adds their stated comparisons and missing geometry.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) — J. S. Milne; Author notes, 2017 edition. Read passages: §1 pp.15–18; §2 pp.23–31; §3 p.34; §4 pp.44–45; §5 pp.54–59; §6 pp.67–69; §9 pp.91–95; §12 pp.111–113; Complements A, Lemmas A.5–A.6 p.155.
  PDF SHA-256: f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e.
- [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf) — Pierre Deligne; Published Proc. Symp. Pure Math. 33 II (1979), IAS scan. Read passages: §0 p.251; §1.1 pp.251–256; §2.1 pp.265–267.
  PDF SHA-256: 591ee837c4c87e5263b76427b393742e111d615c6e098c940f132519a0861922.
- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) — George Boxer; Vincent Pilloni; Author copy 2025-11-05; published Invent. Math. 244 (2026) version not accessible here. Read passages: §1.3 pp.3–5; §3.1 pp.33–34; §6.1 p.60.
  PDF SHA-256: af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6.
- [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1) — George Boxer; Vincent Pilloni; arXiv:2110.10251v1 (2021). Read passages: §3.1 pp.31–32, especially Lemma 3.1.2.
  PDF SHA-256: 85526b90c48d0955f2a042f63d619a22584e3801391934504563994733d58596.
- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) — Frank Calegari; David Geraghty; Author prepublication copy pp.1–96; routed journal locators are pp.807–810,828–829. Read passages: §§2.1–2.2, author pp.7–11; §5.3/Theorem 5.5 proof, author pp.28–29.
  PDF SHA-256: fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5.
- [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) — Vincent Pilloni; Author copy 2019-06-17, 113 pages; published Duke version not accessible here. Read passages: §5.1.1 p.20; §5.1.2–5.1.6 pp.21–24; §15.2.1 pp.107–108.
  PDF SHA-256: 4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58.
- [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://par.nsf.gov/servlets/purl/10200187) — Benjamin Bakker; Bruno Klingler; Jacob Tsimerman; Published JAMS 33 (2020), NSF copy. Read passages: §1.3 pp.6–7.
  PDF SHA-256: b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058.
- [The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) — Olivier Benoist; Published Publ. Math. IHÉS 130 (2019), pp.63–110. Read passages: §5.3 pp.93–95.
  PDF SHA-256: 8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b.
- [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) — George Boxer; Frank Calegari; Toby Gee; Vincent Pilloni; Published Publ. Math. IHÉS 134 (2021), pp.153–501. Read passages: Definition 3.2.1 pp.201–202; Lemma 7.8.3 p.409.
  PDF SHA-256: b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af.
- [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf) — David Masser; Umberto Zannier; Published Annals of Math. 191 (2020), pp.635–674. Read passages: §1.2 p.637.
  PDF SHA-256: 8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60.
- [Completed cohomology and preabelian type Shimura varieties](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.12799) — David Hansen; Christian Johansson; Published Journal of the London Mathematical Society, DOI 10.1112/jlms.12799, §4.1 read online. Read passages: §4.1, Definition 4.1 and preceding type definitions.

The exact source versions and access dates are in the packet. Published versions, author copies and arXiv preprints are distinguished; findings against an author copy do not assert that an inaccessible version of record has the same text. Unread reference leaves include Wolf 1984 Theorem 8.7.9, BL03 I Lemma 1, the general SGA3 representability proof, and the foundational MT comparison references noted below.

<a id="d0"></a>

## D0. Restriction of scalars and topological points

Use the supplier functor-of-points construction of finite-separable affine Weil restriction. The identifications S(ℝ)≅ℂˣ and (ResF/ℚ GL₂)(ℝ)≅∏σ GL₂(ℝ) must preserve the local topology, group laws and differentials; finite-adelic Hilbert points must preserve the rational diagonal and conjugation of compact opens. Pointwise bijections alone do not supply the chart and continuity statements. The real analytic interface comes from AF.1, not the obsolete broad AA.1 real-Lie request. Rational points are discrete in full adeles, with an archimedean factor; discreteness in finite adeles is not assumed.


Planets: Real points of the Deligne torus.

### Real points of the Deligne torus

Declaration: **TauCeti.Shimura.delignePointsTopology**. Node: ShimuraData:D0/deligne-points-topology. Kind: theorem.

The supplier identification S(ℝ) ≅ ℂˣ is an isomorphism of topological groups for the topology induced by the real affine coordinates. Its scalar-extension map to S(ℂ) is z ↦ (z,z̄); complex conjugation acts by (a,b) ↦ (b̄,ā).

Hypotheses and conventions: Finite-separable restriction is imported from RG2.0a; all maps are algebraic point maps with their supplier coordinate topology.

Proof or construction:

1. Use the representing affine restriction, then the coordinate splitting and the local-points topology; the inverse uses real and imaginary coordinates.

Acceptance: The supplier identification S(ℝ) ≅ ℂˣ is an isomorphism of topological groups for the topology induced by the real affine coordinates. Its scalar-extension map to S(ℂ) is z ↦ (z,z̄); complex conjugation acts by (a,b) ↦ (b̄,ā).

Direct prerequisites: ReductiveGroupsPartII:RG2.0a; ReductiveGroupsPartII:RG2.0.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, pp.251–252. For real points of the deligne torus, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Analytic Deligne torus comparison

Declaration: **TauCeti.Shimura.deligneLiePoints**. Node: ShimuraData:D0/deligne-lie-points. Kind: lemma.

The real-points isomorphism S(ℝ) ≅ ℂˣ is real analytic in both directions; its differential identifies Lie(S)(ℝ) with ℂ as a two-dimensional real space. Norm has differential z ↦ 2 Re(z), and diagonal has differential t ↦ t.

Hypotheses and conventions: Finite-separable restriction is imported from RG2.0a; all maps are algebraic point maps with their supplier coordinate topology.

Proof or construction:

1. Differentiate the explicit maps z↦z z̄ and t↦t in the supplier charts.

Acceptance: The real-points isomorphism S(ℝ) ≅ ℂˣ is real analytic in both directions; its differential identifies Lie(S)(ℝ) with ℂ as a two-dimensional real space. Norm has differential z ↦ 2 Re(z), and diagonal has differential t ↦ t.

Direct prerequisites: ShimuraData:D0/deligne-points-topology; AutomorphicFormsOnReductiveGroups:AF.1; tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, p.252. For analytic deligne torus comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Real points of Hilbert groups

Declaration: **TauCeti.Shimura.hilbertRealPoints**. Node: ShimuraData:D0/hilbert-real-points. Kind: theorem.

For a totally real number field F, (ResF/ℚ GL₂)(ℝ) ≅ ∏σ:F→ℝ GL₂(ℝ), as real analytic groups. The scalar-determinant subgroup G* has real points the tuples with a common determinant in ℝˣ, retaining all permitted determinant signs.

Hypotheses and conventions: Finite-separable restriction is imported from RG2.0a; all maps are algebraic point maps with their supplier coordinate topology. F/ℚ is a totally real number field of degree d≥1. The trace embedding uses the common scalar determinant subgroup G*, not unrestricted ResF/ℚ GL₂.

Proof or construction:

1. Apply finite-separable restriction and F⊗ℚℝ≅∏σℝ; take the fiber product of determinant with the diagonal Gm. The common determinant condition is closed and the algebraic group is smooth.

Acceptance: For a totally real number field F, (ResF/ℚ GL₂)(ℝ) ≅ ∏σ:F→ℝ GL₂(ℝ), as real analytic groups. The scalar-determinant subgroup G* has real points the tuples with a common determinant in ℝˣ, retaining all permitted determinant signs.

Direct prerequisites: ReductiveGroupsPartII:RG2.0a; ReductiveGroupsPartII:RG2.0; AutomorphicFormsOnReductiveGroups:AF.1.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64; Example 9, p.94. For real points of hilbert groups, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Adelic Hilbert point comparison

Declaration: **TauCeti.Shimura.hilbertAdelicPoints**. Node: ShimuraData:D0/hilbert-adelic-points. Kind: theorem.

For the same F, (ResF/ℚ GL₂)(𝔸ℚ,f) ≅ GL₂(𝔸F,f) as topological groups, and G*(𝔸ℚ,f) consists of matrices with determinant in the diagonal image of 𝔸ℚ,fˣ. Compact open subgroups and rational diagonal maps correspond. No assertion of discreteness of G(ℚ) in finite adeles is made.

Hypotheses and conventions: Finite-separable restriction is imported from RG2.0a; all maps are algebraic point maps with their supplier coordinate topology. F/ℚ is a totally real number field of degree d≥1. The trace embedding uses the common scalar determinant subgroup G*, not unrestricted ResF/ℚ GL₂.

Proof or construction:

1. Apply the supplier restricted-product comparison and the determinant fiber-product universal property.

Acceptance: For the same F, (ResF/ℚ GL₂)(𝔸ℚ,f) ≅ GL₂(𝔸F,f) as topological groups, and G*(𝔸ℚ,f) consists of matrices with determinant in the diagonal image of 𝔸ℚ,fˣ. Compact open subgroups and rational diagonal maps correspond. No assertion of discreteness of G(ℚ) in finite adeles is made.

Direct prerequisites: ReductiveGroupsPartII:RG2.0a; AdelicAlgebraicGroups:AA.1.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 0.6–0.7, p.251; 2.1.2, p.265. For adelic hilbert point comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Point maps of datum morphisms

Declaration: **TauCeti.Shimura.datumMapPoints**. Node: ShimuraData:D0/datum-map-points. Kind: theorem.

A ℚ-algebraic homomorphism of connected reductive groups induces continuous local and finite-adelic homomorphisms and a real analytic homomorphism on real points; these commute with rational diagonals, product projections and the S/Hilbert comparisons.

Hypotheses and conventions: Finite-separable restriction is imported from RG2.0a; all maps are algebraic point maps with their supplier coordinate topology.

Proof or construction:

1. Specialize the supplier functoriality squares to these groups; verify equality on coordinate evaluation.

Acceptance: A ℚ-algebraic homomorphism of connected reductive groups induces continuous local and finite-adelic homomorphisms and a real analytic homomorphism on real points; these commute with rational diagonals, product projections and the S/Hilbert comparisons.

Direct prerequisites: tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary; ReductiveGroupsPartII:RG2.0; AdelicAlgebraicGroups:AA.1; AutomorphicFormsOnReductiveGroups:AF.1; ShimuraData:D0/deligne-points-topology; ShimuraData:D0/hilbert-real-points; ShimuraData:D0/hilbert-adelic-points.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 5.15(a), p.58; functorial point/topological comparisons imported from suppliers. For point maps of datum morphisms, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d1"></a>

## D1. The Deligne torus and Hodge structures

A finite real S-representation is allowed to have several weights. First decompose its complexification by the split character lattice, index the piece (p,q) by (−p,−q), and use the supplied semilinear descent to interchange p and q under conjugation. Each diagonal weight summand is compared to the existing pure opposed-filtration carrier. The inverse construction uses finite support to make the split coaction and then descends it. Effective descent of the coordinate Hopf algebra alone does not descend an arbitrary comodule. The category equivalence and its tensor, dual and Tate compatibilities depend on that representation descent request.

The rational-weight criterion concerns descent of the weight cocharacter, giving rational weight summands; it does not force every rational representation to be pure. The trivial representation, Tate line, elliptic homology and GL₂ adjoint representation test the same sign dictionary. The standard real GL₂ homology map is h(a+ib)=[[a,b],[−b,a]], so its split μ has eigenvalues z and 1. The adjoint off-diagonal matrix units have μ weights z and z⁻¹, while the diagonal has weight 1.

The Mumford–Tate group is the smallest rational algebraic subgroup containing the real S-map, with the weight included. Its existence uses noetherian intersection of subgroup ideals; connectedness uses the connected real S-image and rational identity component; reductivity requires polarizability and semisimplicity. It is distinct from the Hodge group. Hodge genericity for a polarized abelian variety asks for equality with the full rational symplectic-similitude group, independently of symplectic basis or scaling of polarization. A product decomposition supplies a rational Hodge projector and obstructs that equality. End(A)=ℤ alone is not used as a general definition of Hodge genericity.


Planets: Graded real Hodge structure; Hodge pieces of a representation; Deligne torus–Hodge equivalence; Mumford–Tate group.

### Deligne torus representation input

Declaration: **TauCeti.Shimura.deligneTorus**. Node: ShimuraData:D1/deligne-torus. Kind: theorem.

Use S=Resℂ/ℝ Gm from RG2.0a, with O(Sℂ)=ℂ[ℤ²] and Galois swap. A finite-dimensional algebraic real representation is a finite-dimensional O(S)-comodule; after scalar extension its splitting is the supplier splitting, not an arbitrary abstract ℂˣ action.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Compose the points/comodule dictionary with the supplied Hopf-algebra splitting. This replaces the duplicate descended-torus construction in the checkpoint.

Acceptance: Use S=Resℂ/ℝ Gm from RG2.0a, with O(Sℂ)=ℂ[ℤ²] and Galois swap. A finite-dimensional algebraic real representation is a finite-dimensional O(S)-comodule; after scalar extension its splitting is the supplier splitting, not an arbitrary abstract ℂˣ action.

Direct prerequisites: ReductiveGroupsPartII:RG2.0a; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, pp.251–252. For deligne torus representation input, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Deligne character sign dictionary

Declaration: **TauCeti.Shimura.deligneTorusPoints**. Node: ShimuraData:D1/deligne-torus-points. Kind: lemma.

For the supplier split character (a,b), its value at a real point z is zᵃ z̄ᵇ; Deligne type (p,q) corresponds to character (−p,−q), and μh(z)=hℂ(z,1) acts by z⁻ᵖ.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Evaluate the two split coordinates on (z,z̄) and substitute (a,b)=(−p,−q).

Acceptance: For the supplier split character (a,b), its value at a real point z is zᵃ z̄ᵇ; Deligne type (p,q) corresponds to character (−p,−q), and μh(z)=hℂ(z,1) acts by z⁻ᵖ.

Direct prerequisites: ShimuraData:D1/deligne-torus; ReductiveGroupsPartII:RG2.0a.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, p.251. For deligne character sign dictionary, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Diagonal, weight and norm signs

Declaration: **TauCeti.Shimura.weightNormCocharacters**. Node: ShimuraData:D1/weight-norm-cocharacters. Kind: lemma.

Write d(t)=t and w(t)=t⁻¹ for the supplier cocharacters Gm,ℝ→S. On type (p,q), h∘d acts by t⁻⁽ᵖ⁺ᑫ⁾ and h∘w by tᵖ⁺ᑫ. Norm has split character (1,1); the Tate object ℚ(m) therefore corresponds to Nmᵐ and has weight −2m.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Evaluate characters on the diagonal and inverse diagonal; keep h∘d and h∘w distinct.

Acceptance: Write d(t)=t and w(t)=t⁻¹ for the supplier cocharacters Gm,ℝ→S. On type (p,q), h∘d acts by t⁻⁽ᵖ⁺ᑫ⁾ and h∘w by tᵖ⁺ᑫ. Norm has split character (1,1); the Tate object ℚ(m) therefore corresponds to Nmᵐ and has weight −2m.

Direct prerequisites: ShimuraData:D1/deligne-torus-points; ReductiveGroupsPartII:RG2.0a.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, pp.25–27; §5, p.56. For diagonal, weight and norm signs, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Graded real Hodge structure

Declaration: **TauCeti.Shimura.gradedRealHodge**. Node: ShimuraData:D1/graded-real-hodge. Kind: definition.

On a finite-dimensional real space V, a graded real Hodge structure consists of a finite internal decomposition V=⊕n Vn and, for every n, a weight-n HodgeStructureOn on ℂ⊗ℝVn with canonical conjugation. The zero space and multiple weights are allowed; it is not a mixed Hodge structure with an extension filtration.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Bundle the finite real grading and the existing pure structures. Use DirectSum.IsInternal rather than a new direct-sum definition.

API:

- **TauCeti.Shimura.gradedWeight** (characterisation): The weight-n summand is Vn; summands with different n are disjoint.
- **TauCeti.Shimura.gradedPure** (characterisation): The pure object on Vn has weight exactly n and the canonical conjugation.
- **TauCeti.Shimura.gradedSupport** (characterisation): The set of n with Vn≠0 is finite; its supremum is V.

Discriminating unit tests:

- **TauCeti.Shimura.tests.gradedZero** (computation): For V=0 every weight summand is zero. Rejects: Nonempty/nonzero weight required.
- **TauCeti.Shimura.tests.gradedTwoWeights** (computation): ℝ(0)⊕ℝ(1) has one-dimensional weights 0 and −2. Rejects: All representations forced pure.
- **TauCeti.Shimura.tests.gradedTate** (computation): The degree −2 summand of ℝ(1) is the whole line. Rejects: Weight sign reversed.

Uses:

- ShimuraData:D1/hodge-decomposition-of-representation: Hodge pieces of a representation consumes graded real hodge structure: The weight-n summand is Vn; summands with different n are disjoint.
- ShimuraData:D1/representation-hodge-equivalence: Deligne torus–Hodge equivalence consumes graded real hodge structure: The weight-n summand is Vn; summands with different n are disjoint.

Acceptance: On a finite-dimensional real space V, a graded real Hodge structure consists of a finite internal decomposition V=⊕n Vn and, for every n, a weight-n HodgeStructureOn on ℂ⊗ℝVn with canonical conjugation. The zero space and multiple weights are allowed; it is not a mixed Hodge structure with an extension filtration.

Direct prerequisites: tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition; tauceti:TauCeti.Hodge.HodgeStructureOn; tauceti:TauCeti.Hodge.complexificationConjugation.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, pp.251–252. Group the finite character decomposition by total bidegree and descend each conjugation-stable total-weight subspace. Pure summands are the pinned Hodge carrier.

### Hodge pieces of a representation

Declaration: **TauCeti.Shimura.hodgePiece**. Node: ShimuraData:D1/hodge-decomposition-of-representation. Kind: construction.

For an algebraic real S-representation V, define V^{p,q} in ℂ⊗ℝV to be its (−p,−q)-weight submodule under Sℂ≅Gm². It has finite support, is an internal direct sum, and canonical conjugation exchanges p and q. Construct Vn by real descent of ⊕p+q=n V^{p,q}.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Corestrict the complexified coaction using the supplied splitting, relabel weights, and descend each conjugation-stable diagonal sum using the representation descent interface.

API:

- **TauCeti.Shimura.hodgePieceAction** (compatibility): On V^{p,q}, h(z) acts by z⁻ᵖ z̄⁻ᑫ.
- **TauCeti.Shimura.conjHodgePiece** (compatibility): Canonical conjugation maps V^{p,q} onto V^{q,p}.
- **TauCeti.Shimura.hodgePieceInternal** (compatibility): The (p,q) pieces form an internal direct sum with finite nonzero support.

Discriminating unit tests:

- **TauCeti.Shimura.tests.pieceTrivial** (degenerate): The trivial line has only V^{0,0}=ℂ. Rejects: Weight labels incorrectly shifted.
- **TauCeti.Shimura.tests.pieceNorm** (computation): Nm has only V^{−1,−1}=ℂ. Rejects: 1971 signs used without conversion.
- **TauCeti.Shimura.tests.pieceStandard** (computation): The real standard ℂ-multiplication plane has dim V^{−1,0}=dim V^{0,−1}=1. Rejects: Both eigenspaces assigned same bidegree.

Uses:

- ShimuraData:D2/adjoint-bracket: Bracket of adjoint Hodge pieces consumes hodge pieces of a representation: On V^{p,q}, h(z) acts by z⁻ᵖ z̄⁻ᑫ.
- ShimuraData:D3/filtration-parabolic: Parabolic of the Hodge filtration consumes hodge pieces of a representation: On V^{p,q}, h(z) acts by z⁻ᵖ z̄⁻ᑫ.
- ShimuraData:D5/gl2-types: GL₂ Hodge and weight checks consumes hodge pieces of a representation: On V^{p,q}, h(z) acts by z⁻ᵖ z̄⁻ᑫ.

Acceptance: For an algebraic real S-representation V, define V^{p,q} in ℂ⊗ℝV to be its (−p,−q)-weight submodule under Sℂ≅Gm². It has finite support, is an internal direct sum, and canonical conjugation exchanges p and q. Construct Vn by real descent of ⊕p+q=n V^{p,q}.

Direct prerequisites: ShimuraData:D1/deligne-torus-points; tauceti:TauCeti.DiagonalizableGroup.weightSpace; tauceti:TauCeti.DiagonalizableGroup.isInternal_weightSpace; tauceti:TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, pp.251–252. For hodge pieces of a representation, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Conjugation of Hodge pieces

Declaration: **TauCeti.Shimura.conjugationPieces**. Node: ShimuraData:D1/conjugation-pieces. Kind: lemma.

For each p,q, canonical conjugation maps V^{p,q} isomorphically, conjugate linearly, onto V^{q,p}.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Conjugation swaps coefficients and lattice coordinates in the complexified coaction; apply the weight-membership equality.

Acceptance: For each p,q, canonical conjugation maps V^{p,q} isomorphically, conjugate linearly, onto V^{q,p}.

Direct prerequisites: ShimuraData:D1/hodge-decomposition-of-representation; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules; ReductiveGroupsPartII:RG2.0a.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, p.251. The real-conjugation condition is exactly the swap of the two character coordinates.

### Pure weight part of a representation

Declaration: **TauCeti.Shimura.hodgeOfRepresentation**. Node: ShimuraData:D1/pure-hodge-of-representation. Kind: construction.

For every n, on ℂ⊗ℝVn set Fᵃ=⊕p≥a V^{p,n−p}. Construct the existing pure HodgeStructureOn of weight n, with n-opposed canonical-conjugate filtration, and assemble the graded real object.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Transport each diagonal sum through real descent, then invoke the pinned decomposition-to-filtration construction; finite support gives boundedness.

API:

- **TauCeti.Shimura.hodgeOfRepresentationPiece** (compatibility): The library piece indexed p is V^{p,n−p} under the base-change identification.
- **TauCeti.Shimura.hodgeOfRepresentationFiltration** (compatibility): Fᵃ is the supremum of the pieces with p≥a.
- **TauCeti.Shimura.hodgeOfRepresentationOpposed** (compatibility): Fᵃ and conjugate Fⁿ⁺¹⁻ᵃ are complementary.

Discriminating unit tests:

- **TauCeti.Shimura.tests.pureTateFiltration** (computation): For ℝ(1), F^{−1}=ℂ and F⁰=0. Rejects: Filtration inequality reversed.
- **TauCeti.Shimura.tests.pureZero** (degenerate): The zero representation yields the existing zero pure structure in every weight. Rejects: Zero object excluded.
- **TauCeti.Shimura.tests.pureElliptic** (computation): For elliptic homology, F⁰ is the (0,−1) line and F^{−1} is the whole plane. Rejects: Homology confused with cohomology.

Uses:

- ShimuraData:D1/representation-hodge-equivalence: Deligne torus–Hodge equivalence consumes pure weight part of a representation: The library piece indexed p is V^{p,n−p} under the base-change identification.
- ShimuraData:D3/homogeneous-variation: Homogeneous Hodge variation consumes pure weight part of a representation: The library piece indexed p is V^{p,n−p} under the base-change identification.

Acceptance: For every n, on ℂ⊗ℝVn set Fᵃ=⊕p≥a V^{p,n−p}. Construct the existing pure HodgeStructureOn of weight n, with n-opposed canonical-conjugate filtration, and assemble the graded real object.

Direct prerequisites: ShimuraData:D1/hodge-decomposition-of-representation; ShimuraData:D1/conjugation-pieces; ShimuraData:D1/graded-real-hodge; tauceti:TauCeti.Hodge.HodgeStructureOn.ofDecomposition.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, pp.25–26. For pure weight part of a representation, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Representation from a Hodge grading

Declaration: **TauCeti.Shimura.representationOfHodge**. Node: ShimuraData:D1/representation-of-hodge. Kind: construction.

Given a graded real Hodge structure on V, the split coaction acts on V^{p,q} by the monomial (−p,−q); conjugation compatibility descends it to an algebraic S-representation on V.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Form the monomial coaction on the internal direct sum; coassociativity and counit hold on each summand. Apply effective semilinear descent of comodules, retaining the fixed real carrier.

API:

- **TauCeti.Shimura.representationOfHodgePiece** (compatibility): The descended coaction acts by (−p,−q) on each Hodge piece.
- **TauCeti.Shimura.representationOfHodgeReal** (compatibility): The resulting point action preserves the real fixed subspace.
- **TauCeti.Shimura.representationOfHodgePure** (compatibility): Inverse construction on one pure piece recovers its n-opposed filtration.

Discriminating unit tests:

- **TauCeti.Shimura.tests.inverseTrivial** (degenerate): The pure (0,0) line descends to the trivial representation. Rejects: Character offset.
- **TauCeti.Shimura.tests.inverseTate** (computation): ℝ(1) descends to the norm character. Rejects: Inverse norm used.
- **TauCeti.Shimura.tests.inverseTwoWeights** (computation): ℝ(0)⊕ℝ(1) descends to 1⊕Nm. Rejects: Mixed extension substituted for direct grading.

Uses:

- ShimuraData:D1/representation-hodge-equivalence: Deligne torus–Hodge equivalence consumes representation from a hodge grading: The descended coaction acts by (−p,−q) on each Hodge piece.

Acceptance: Given a graded real Hodge structure on V, the split coaction acts on V^{p,q} by the monomial (−p,−q); conjugation compatibility descends it to an algebraic S-representation on V.

Direct prerequisites: ShimuraData:D1/graded-real-hodge; ShimuraData:D1/conjugation-pieces; ReductiveGroupsPartII:RG2.0a; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules; tauceti:TauCeti.Hodge.HodgeStructureOn.decompositionEquiv.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, pp.251–252. The passage states the algebraic real S-action/Hodge-structure equivalence. The inverse construction needs the explicitly requested effective comodule descent.

### Representation comparison round trip

Declaration: **TauCeti.Shimura.comparisonRoundtrip**. Node: ShimuraData:D1/comparison-roundtrip. Kind: lemma.

Starting with an S-comodule, forming its graded Hodge structure and applying the inverse construction recovers the same coaction under canonical scalar extension. Conversely the grading and each existing pure filtration are recovered.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Check equality after faithfully flat complex scalar extension on each weight summand; the inverse grading follows from decompositionEquiv.

Acceptance: Starting with an S-comodule, forming its graded Hodge structure and applying the inverse construction recovers the same coaction under canonical scalar extension. Conversely the grading and each existing pure filtration are recovered.

Direct prerequisites: ShimuraData:D1/representation-of-hodge; ShimuraData:D1/pure-hodge-of-representation; tauceti:TauCeti.Hodge.HodgeStructureOn.decompositionEquiv; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, pp.251–252. This expands the two inverse object constructions from the stated equivalence into equality after scalar extension.

### Deligne torus–Hodge equivalence

Declaration: **TauCeti.Shimura.representationHodgeEquivalence**. Node: ShimuraData:D1/representation-hodge-equivalence. Kind: theorem.

Finite-dimensional algebraic real S-representations and finite graded real Hodge structures are equivalent categories. Maps are exactly real-linear maps whose complexifications preserve every bidegree; the equivalence respects direct sums.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Construct the functors on objects above and on maps by restriction to pieces; round trips give natural isomorphisms.

Acceptance: Finite-dimensional algebraic real S-representations and finite graded real Hodge structures are equivalent categories. Maps are exactly real-linear maps whose complexifications preserve every bidegree; the equivalence respects direct sums.

Direct prerequisites: ShimuraData:D1/comparison-roundtrip; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1, pp.251–252. The real-linear morphisms preserving each character piece give the morphism dictionary; the real comodule descent request remains open.

### Tensor comparison

Declaration: **TauCeti.Shimura.tensorComparison**. Node: ShimuraData:D1/tensor-comparison. Kind: lemma.

Under the equivalence, (V⊗W)^{p,q}=⊕a+c=p,b+d=q V^{a,b}⊗W^{c,d}, with the induced graded weights adding and the existing pure tensor filtration on each pair of pure summands.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Multiply split characters and apply uniqueness of the decomposition-to-filtration comparison.

Acceptance: Under the equivalence, (V⊗W)^{p,q}=⊕a+c=p,b+d=q V^{a,b}⊗W^{c,d}, with the induced graded weights adding and the existing pure tensor filtration on each pair of pure summands.

Direct prerequisites: ShimuraData:D1/representation-hodge-equivalence; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition; tauceti:TauCeti.Hodge.HodgeStructureOn.tensorProduct.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Hodge tensors, p.27. For tensor comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Dual comparison

Declaration: **TauCeti.Shimura.dualComparison**. Node: ShimuraData:D1/dual-comparison. Kind: lemma.

Duality sends type (p,q) to (−p,−q), negates the weight, and agrees with the existing dual Hodge structure and annihilator filtration.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Invert the character on the dual and identify its filtration by annihilators.

Acceptance: Duality sends type (p,q) to (−p,−q), negates the weight, and agrees with the existing dual Hodge structure and annihilator filtration.

Direct prerequisites: ShimuraData:D1/representation-hodge-equivalence; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition; tauceti:TauCeti.Hodge.HodgeStructureOn.dual.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Hodge tensors, p.27. For dual comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Tate twist comparison

Declaration: **TauCeti.Shimura.tateComparison**. Node: ShimuraData:D1/tate-comparison. Kind: lemma.

Twisting a representation by Nmᵐ corresponds to the existing Tate twist by m: type (p,q) goes to (p−m,q−m) and weight n to n−2m.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Tensor with the norm line and use its sole bidegree (−m,−m).

Acceptance: Twisting a representation by Nmᵐ corresponds to the existing Tate twist by m: type (p,q) goes to (p−m,q−m) and weight n to n−2m.

Direct prerequisites: ShimuraData:D1/tensor-comparison; ShimuraData:D1/weight-norm-cocharacters; tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist; tauceti:TauCeti.Hodge.tate.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 2.6, p.25; Example 2.9, p.26. For tate twist comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Weil operator sign comparison

Declaration: **TauCeti.Shimura.weilOperatorSign**. Node: ShimuraData:D1/weil-operator-sign. Kind: lemma.

On a weight-n piece h(i) acts by i^{q−p}; hence it is inverse to the pinned Weil operator C, which acts by i^{p−q}. Equivalently h(i)∘C=id, without treating the library linear map as an unbundled inverse.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Substitute z=i and z̄=−i, then compare scalar actions on the internal decomposition.

Acceptance: On a weight-n piece h(i) acts by i^{q−p}; hence it is inverse to the pinned Weil operator C, which acts by i^{p−q}. Equivalently h(i)∘C=id, without treating the library linear map as an unbundled inverse.

Direct prerequisites: ShimuraData:D1/hodge-decomposition-of-representation; tauceti:TauCeti.Hodge.HodgeStructureOn.weilOperator; tauceti:TauCeti.Hodge.HodgeStructureOn.weilOperator_apply_of_mem.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.1 and 1.1.10, pp.251–253. Evaluating the displayed character at i gives i^(q−p). Deligne and Milne call h(i) the Weil operator; the pinned Tau Ceti declaration instead uses i^(p−q). This node is their explicit conversion.

### Rational weight criterion

Declaration: **TauCeti.Shimura.rationalWeightCriterion**. Node: ShimuraData:D1/rational-weight-criterion. Kind: lemma.

For a ℚ-vector space VQ with an algebraic S-action on VR, its graded real Hodge structure is a direct sum of rational pure Hodge structures on VQ if and only if the central weight cocharacter h∘w:Gm,ℝ→GL(VR) descends to ℚ. Equivalently the weight summands descend to rational subspaces. The S-map itself need not descend over ℚ.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. A rational Gm-action has rational eigenspaces. Conversely a rational grading defines t↦tⁿ on its rational summands, whose real extension is h∘w.

Acceptance: For a ℚ-vector space VQ with an algebraic S-action on VR, its graded real Hodge structure is a direct sum of rational pure Hodge structures on VQ if and only if the central weight cocharacter h∘w:Gm,ℝ→GL(VR) descends to ℚ. Equivalently the weight summands descend to rational subspaces. The S-map itself need not descend over ℚ.

Direct prerequisites: ShimuraData:D1/weight-norm-cocharacters; ShimuraData:D1/representation-hodge-equivalence; tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Homomorphisms S→GL(V), p.26. The passage says a rational Hodge structure corresponds to an S-action whose weight map is rational. R4 supplies the rational Gm eigenspace dictionary.

### Trivial comparison object

Declaration: **TauCeti.Shimura.testObjects**. Node: ShimuraData:D1/test-objects. Kind: lemma.

The trivial rational representation has weight zero, sole type (0,0), F⁰=Vℂ and F¹=0, and h(i)=C=id.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Evaluate the zero split character.

Acceptance: The trivial rational representation has weight zero, sole type (0,0), F⁰=Vℂ and F¹=0, and h(i)=C=id.

Direct prerequisites: ShimuraData:D1/pure-hodge-of-representation; ShimuraData:D1/weil-operator-sign.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, p.26. For trivial comparison object, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Tate comparison object

Declaration: **TauCeti.Shimura.tateTestObject**. Node: ShimuraData:D1/tate-test-object. Kind: lemma.

The rational norm line is ℚ(1), of weight −2 and sole type (−1,−1), with F^{−1}=Vℂ and F⁰=0.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Specialize m=1.

Acceptance: The rational norm line is ℚ(1), of weight −2 and sole type (−1,−1), with F^{−1}=Vℂ and F⁰=0.

Direct prerequisites: ShimuraData:D1/tate-comparison.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 2.6, p.25; Example 2.9, p.26. For tate comparison object, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Elliptic homology comparison

Declaration: **TauCeti.Shimura.ellipticHomologyObject**. Node: ShimuraData:D1/elliptic-homology-object. Kind: lemma.

The real plane with complex multiplication h(z)=multiplication by z has types (−1,0),(0,−1), each dimension one, weight −1 and h(i)=J=C⁻¹. An elliptic curve H₁(E,ℚ) has this type; H¹ is its dual with positive weight.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Complexify J and take its ±i eigenspaces; apply the supplied elliptic Hodge comparison for the geometric identification.

Acceptance: The real plane with complex multiplication h(z)=multiplication by z has types (−1,0),(0,−1), each dimension one, weight −1 and h(i)=J=C⁻¹. An elliptic curve H₁(E,ℚ) has this type; H¹ is its dual with positive weight.

Direct prerequisites: ShimuraData:D1/pure-hodge-of-representation; ShimuraData:D1/dual-comparison; ShimuraData:D1/weil-operator-sign; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Examples 2.4 and 2.8, pp.25–26. For elliptic homology comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Adjoint GL₂ comparison

Declaration: **TauCeti.Shimura.adjointGl2Object**. Node: ShimuraData:D1/adjoint-gl2-object. Kind: lemma.

The adjoint action of the standard h on gl₂,ℂ has only types (−1,1),(0,0),(1,−1), of dimensions 1,2,1. The scalar center lies in type (0,0); sl₂ has dimensions 1,1,1.

Hypotheses and conventions: Representations of S are finite-dimensional algebraic real representations with the supplier Hopf splitting; type (p,q) means character (−p,−q). Pure structures use canonical conjugation and the pinned opposed filtration.

Proof or construction:

1. Decompose End(V⁺⊕V⁻) into the four Hom blocks and then take trace-zero elements.

Acceptance: The adjoint action of the standard h on gl₂,ℂ has only types (−1,1),(0,0),(1,−1), of dimensions 1,2,1. The scalar center lies in type (0,0); sl₂ has dimensions 1,1,1.

Direct prerequisites: ShimuraData:D1/elliptic-homology-object; ShimuraData:D1/tensor-comparison; ShimuraData:D1/dual-comparison; tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §6, SV1 verification, p.69, specialized to genus one. For adjoint gl₂ comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Mumford–Tate group

Declaration: **TauCeti.Shimura.mumfordTateGroup**. Node: ShimuraData:D1/mumford-tate-group. Kind: construction.

For a finite-dimensional rational pure Hodge structure with real S-map h, MT(V) is the smallest ℚ-algebraic subgroup of GL(V) whose real extension contains h(S). Define via the intersection of closed ℚ-subgroups; it is connected, and for polarizable V reductive. The construction includes the weight Gm, so it is not the Hodge group.

Hypotheses and conventions: V is finite-dimensional over ℚ with a pure rational Hodge structure; its real S-map is algebraic. Reductivity requires polarizability, while the construction and connectedness do not.

Proof or construction:

1. Use noetherian stabilization of intersections of closed subgroup ideals to represent the intersection. Minimality is immediate; connectedness follows from connected S; reductivity is supplied by polarization and the rational semisimple representation criterion.

API:

- **TauCeti.Shimura.mumfordTateMinimal** (characterisation): Any ℚ-algebraic subgroup containing h after real extension contains MT(V).
- **TauCeti.Shimura.mumfordTateWeight** (characterisation): The rational weight cocharacter factors through MT(V).
- **TauCeti.Shimura.mumfordTateIsomorphism** (characterisation): Rational Hodge isomorphisms conjugate the MT subgroups of GL.

Discriminating unit tests:

- **TauCeti.Shimura.tests.mtTrivial** (degenerate): MT of the trivial rational line is the trivial subgroup. Rejects: Always adjoining Gm.
- **TauCeti.Shimura.tests.mtTate** (computation): MT of ℚ(1) is Gm. Rejects: Hodge group substituted for MT.
- **TauCeti.Shimura.tests.mtCmElliptic** (compatibility): For CM elliptic H¹, MT is the corresponding two-dimensional torus, a proper subgroup of GSp₂. Rejects: All polarized H¹ assigned full GSp.

Uses:

- ShimuraData:D1/hodge-generic: Hodge-generic abelian variety consumes mumford–tate group: Any ℚ-algebraic subgroup containing h after real extension contains MT(V).
- LogicAndDefinabilityInNumberTheoryPartII: genericity interfaces: The arithmetic/genericity consumer compares rational MT with the full symplectic similitude group; D1 does not own weakly-special loci or Ax–Schanuel.

Acceptance: For a finite-dimensional rational pure Hodge structure with real S-map h, MT(V) is the smallest ℚ-algebraic subgroup of GL(V) whose real extension contains h(S). Define via the intersection of closed ℚ-subgroups; it is connected, and for polarizable V reductive. The construction includes the weight Gm, so it is not the Hodge group.

Direct prerequisites: tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components; ShimuraData:D1/rational-weight-criterion; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Aside following 2.16, p.31. This defines MT and states its polarizability characterization, while citing Milne 1994b/2013 for proofs. The noetherian intersection, connectedness and reductivity inputs remain explicit R0/R3/H1/R6 requests.

### Hodge-generic abelian variety

Declaration: **TauCeti.Shimura.hodgeGeneric**. Node: ShimuraData:D1/hodge-generic. Kind: definition.

A polarized complex abelian variety A of dimension g≥1 is Hodge generic if MT(H¹(A,ℚ)) is the full group of symplectic similitudes of its rational polarization. Equality is as ℚ-algebraic subgroups; it is invariant under the chosen symplectic identification. This is not defined merely by End(A)=ℤ.

Hypotheses and conventions: A is a polarized complex abelian variety of dimension g≥1; its rational H¹ and symplectic polarization are supplied by H0/H1; MT is the rational algebraic group defined in D1.

Proof or construction:

1. Use the cohomological polarization with weight +1 and the corresponding similitude target; transport equality through change of symplectic basis.

API:

- **TauCeti.Shimura.hodgeGenericBasis** (compatibility): The predicate is independent of symplectic basis and scaling of the polarization.
- **TauCeti.Shimura.hodgeGenericIsogeny** (compatibility): Polarized rational isogenies preserve Hodge genericity.
- **TauCeti.Shimura.hodgeGenericElliptic** (compatibility): An elliptic curve is Hodge generic iff it has no complex multiplication.

Discriminating unit tests:

- **TauCeti.Shimura.tests.genericCmFalse** (non-example): A CM elliptic curve is not Hodge generic. Rejects: Endomorphism dimension ignored.
- **TauCeti.Shimura.tests.genericNonCmElliptic** (computation): An elliptic curve without CM is Hodge generic. Rejects: MT replaced by derived Sp.
- **TauCeti.Shimura.tests.genericProductFalse** (non-example): The product of two nonisogenous non-CM elliptic curves with product polarization is not Hodge generic in dimension two. Rejects: No CM mistaken for Hodge genericity.

Uses:

- LogicAndDefinabilityInNumberTheoryPartII: weakly special/generic loci: The arithmetic/genericity consumer compares rational MT with the full symplectic similitude group; D1 does not own weakly-special loci or Ax–Schanuel.
- PAPER-MASSER-ZANNIER-20/4: The consumer uses hodge-generic abelian variety through these concrete interfaces: The predicate is independent of symplectic basis and scaling of the polarization. Polarized rational isogenies preserve Hodge genericity.

Acceptance: A polarized complex abelian variety A of dimension g≥1 is Hodge generic if MT(H¹(A,ℚ)) is the full group of symplectic similitudes of its rational polarization. Equality is as ℚ-algebraic subgroups; it is invariant under the chosen symplectic identification. This is not defined merely by End(A)=ℤ.

Direct prerequisites: ShimuraData:D1/mumford-tate-group; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory; ShimuraData:D5/siegel-datum.

Source evidence: [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §1.2, p.637. For hodge-generic abelian variety, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d2"></a>

## D2. Real reductive groups and Hermitian domains

Work on the adjoint group for the Cartan criterion. On a semisimple real Lie algebra with Killing form B, the form −B(x,θy) must be positive definite; a reductive scalar center cannot be treated by the same nondegenerate-Killing-form argument. The stabilizer of h is a real centralizer, and the tangent space is its Lie quotient. The adjoint Hodge decomposition induces an invariant J, with the eigenvalues fixed by the convention above. The bracket sends type (p,q) times type (r,s) to type (p+r,q+s); the appropriate nonnegative filtration is a Lie subalgebra.

Closed real-subgroup quotient charts, separation, second countability and the complex homogeneous-quotient theorem are supplier inputs. Smooth Frobenius alone does not prove the complex quotient/integrability step: Milne's reference to Wolf's theorem remains an unread proof leaf. The Hermitian-domain theorem applies componentwise, allowing disconnected X. A compact real factor has zero noncompact tangent and hence contributes a point; it must not be excluded by replacing SV3 with a real-simple-factor condition.


Planets: Cartan involution criterion; Integrability of the Hodge complex structure; Hermitian domain theorem; Uniqueness of the domain complex structure.

### Cartan involution criterion

Declaration: **TauCeti.Shimura.cartanAdjointCriterion**. Node: ShimuraData:D2/cartan-adjoint-criterion. Kind: theorem.

Let G be connected reductive over ℝ and θ an algebraic involution. The Cartan condition is compactness of the real form with conjugation θ∘c in Gℂ. For semisimple G it is equivalent to positive definiteness of Bθ(X,Y)=−B(X,dθY). For reductive G this Killing criterion is applied to g^{ad}; θ on the central torus must separately give its compact real form. In particular identity on split Gm is not Cartan.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Import the compact real form and Cartan criterion, then split the reductive Lie algebra into center and derived factors. Do not infer positivity on a central Killing-null space.

Acceptance: Let G be connected reductive over ℝ and θ an algebraic involution. The Cartan condition is compactness of the real form with conjugation θ∘c in Gℂ. For semisimple G it is equivalent to positive definiteness of Bθ(X,Y)=−B(X,dθY). For reductive G this Killing criterion is applied to g^{ad}; θ on the central torus must separately give its compact real form. In particular identity on split Gm is not Cartan.

Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.0; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §1, Cartan involutions, pp.15–17. For cartan involution criterion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Adjoint involution from h(i)

Declaration: **TauCeti.Shimura.shimuraCartanInvolution**. Node: ShimuraData:D2/shimura-cartan-involution. Kind: lemma.

For h satisfying the three-type condition, Int(h(i)) is an involution on G^{ad}, since h(−1) acts trivially in the adjoint representation. Its Cartan property is exactly SV2, independent of adding a central component to h.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. On types p+q=0, h(i)² acts by (−1)^{p+q}=1. Faithfulness of the adjoint action for the adjoint group identifies the inner square with identity.

Acceptance: For h satisfying the three-type condition, Int(h(i)) is an involution on G^{ad}, since h(−1) acts trivially in the adjoint representation. Its Cartan property is exactly SV2, independent of adding a central component to h.

Direct prerequisites: ShimuraData:D1/adjoint-gl2-object; ShimuraData:D1/weight-norm-cocharacters; tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; ShimuraData:D2/cartan-adjoint-criterion.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 2.1.1.2, p.265. For adjoint involution from h(i), the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Centralizer of a Hodge homomorphism

Declaration: **TauCeti.Shimura.stabilizerH**. Node: ShimuraData:D2/stabilizer-h. Kind: theorem.

For a real algebraic h:S→G, its stabilizer for conjugation by G(ℝ) is Kh=CG(ℝ)(h(S(ℝ))). It is closed; its Lie algebra is the fixed subalgebra of Ad∘h, hence g^{0,0} under SV1. Central directions are retained.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. The equality is the stabilizer definition. Closedness is an intersection of centralizers. Differentiate the centralizer equations and use the torus weight zero subspace.

Acceptance: For a real algebraic h:S→G, its stabilizer for conjugation by G(ℝ) is Kh=CG(ℝ)(h(S(ℝ))). It is closed; its Lie algebra is the fixed subalgebra of Ad∘h, hence g^{0,0} under SV1. Central directions are retained.

Direct prerequisites: ShimuraData:D1/hodge-decomposition-of-representation; ReductiveGroupsPartII:RG2.0; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem; tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 1.21 proof, pp.17–18. This identifies the homogeneous stabilizer. R2 and LieGroups layer2 supply the closed subgroup and differentiated centralizer equations.

### Tangent quotient of the h-orbit

Declaration: **TauCeti.Shimura.tangentQuotient**. Node: ShimuraData:D2/tangent-quotient. Kind: theorem.

The orbit of h, with its homogeneous quotient topology, is G(ℝ)/Kh. The tangent at h is gℝ/kℝ, and its complexification is g^{−1,1}⊕g^{1,−1} under SV1. The center and all compact real factors on which h is trivial contribute zero tangent.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Use the quotient differential exact sequence and remove its weight-zero kernel; the remaining two types are conjugate.

Acceptance: The orbit of h, with its homogeneous quotient topology, is G(ℝ)/Kh. The tangent at h is gℝ/kℝ, and its complexification is g^{−1,1}⊕g^{1,−1} under SV1. The center and all compact real factors on which h is trivial contribute zero tangent.

Direct prerequisites: ShimuraData:D2/stabilizer-h; AutomorphicFormsOnReductiveGroups:AF.1; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem; ShimuraData:D2/shimura-cartan-involution.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 1.21, proof, p.18. For tangent quotient of the h-orbit, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Hodge complex structure on the tangent

Declaration: **TauCeti.Shimura.hodgeTangentOperator**. Node: ShimuraData:D2/hodge-tangent-operator. Kind: construction.

On the real tangent gℝ/kℝ define J by J=i on g^{−1,1} and J=−i on g^{1,−1}. These conjugate rules descend to a real operator with J²=−id, independent of representative and invariant under Kh. This sign agrees with μh(z)=hℂ(z,1) and makes the filtration period map holomorphic.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Define the complex operator on the two internal summands and descend the conjugation-compatible map; centralizer equivariance follows since it preserves the grading.

API:

- **TauCeti.Shimura.hodgeTangentSquare** (compatibility): J²=−id on gℝ/kℝ.
- **TauCeti.Shimura.hodgeTangentPositive** (compatibility): Its complexification acts by +i on g^{−1,1}.
- **TauCeti.Shimura.hodgeTangentEquivariant** (compatibility): J commutes with the Kh action and with differentials of datum maps.

Discriminating unit tests:

- **TauCeti.Shimura.tests.tangentGl2** (computation): For GL₂ at i, J is multiplication by +i on the upper-half-plane tangent. Rejects: Conjugate complex structure chosen.
- **TauCeti.Shimura.tests.tangentTorus** (degenerate): For a torus datum the tangent is zero and J is its unique endomorphism. Rejects: Center incorrectly contributes tangent.
- **TauCeti.Shimura.tests.tangentProduct** (computation): For a product, J is block diagonal with the two supplied tangent operators. Rejects: Cross terms introduced.

Uses:

- ShimuraData:D2/hodge-integrability: Integrability of the Hodge complex structure consumes hodge complex structure on the tangent: J²=−id on gℝ/kℝ.
- ShimuraData:D3/borel-tangent: Differential of the Borel map consumes hodge complex structure on the tangent: J²=−id on gℝ/kℝ.

Acceptance: On the real tangent gℝ/kℝ define J by J=i on g^{−1,1} and J=−i on g^{1,−1}. These conjugate rules descend to a real operator with J²=−id, independent of representative and invariant under Kh. This sign agrees with μh(z)=hℂ(z,1) and makes the filtration period map holomorphic.

Direct prerequisites: ShimuraData:D2/tangent-quotient; ShimuraData:D1/conjugation-pieces.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 1.21, proof, p.18. For hodge complex structure on the tangent, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Bracket of adjoint Hodge pieces

Declaration: **TauCeti.Shimura.adjointBracket**. Node: ShimuraData:D2/adjoint-bracket. Kind: lemma.

For the adjoint S-action, [g^{p,q},g^{r,s}]⊆g^{p+r,q+s}. Under SV1, [g^{−1,1},g^{−1,1}]=0 and [g^{1,−1},g^{1,−1}]=0; [g^{−1,1},g^{1,−1}]⊆g^{0,0}.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. The bracket is equivariant for algebraic automorphisms, so weights multiply; absent weight spaces are zero.

Acceptance: For the adjoint S-action, [g^{p,q},g^{r,s}]⊆g^{p+r,q+s}. Under SV1, [g^{−1,1},g^{−1,1}]=0 and [g^{1,−1},g^{1,−1}]=0; [g^{−1,1},g^{1,−1}]⊆g^{0,0}.

Direct prerequisites: ShimuraData:D1/tensor-comparison; tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation; ShimuraData:D1/hodge-decomposition-of-representation.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 1.1.11 and Proposition 1.1.14(ii), pp.253–255. The Lie action and bracket are equivariant maps; the type-addition computation is an expansion of this representation argument using R2 bracket equivariance.

### Hodge filtration Lie subalgebra

Declaration: **TauCeti.Shimura.filtrationLieSubalgebra**. Node: ShimuraData:D2/filtration-lie-subalgebra. Kind: lemma.

Under SV1, F⁰gℂ=g^{0,0}⊕g^{1,−1} is a complex Lie subalgebra. The complexified tangent quotient gℂ/F⁰gℂ is g^{−1,1}, with its induced complex structure.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Check each bracket block and quotient out the complementary summands.

Acceptance: Under SV1, F⁰gℂ=g^{0,0}⊕g^{1,−1} is a complex Lie subalgebra. The complexified tangent quotient gℂ/F⁰gℂ is g^{−1,1}, with its induced complex structure.

Direct prerequisites: ShimuraData:D2/adjoint-bracket; ShimuraData:D2/hodge-tangent-operator.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Theorem 2.14 proof, pp.30–31. For hodge filtration lie subalgebra, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Integrability of the Hodge complex structure

Declaration: **TauCeti.Shimura.hodgeIntegrability**. Node: ShimuraData:D2/hodge-integrability. Kind: theorem.

The invariant almost complex structure on the h-orbit defined above is integrable. Construct holomorphic homogeneous charts using the local complex quotient by the subgroup integrating F⁰gℂ; do not use smooth real Frobenius alone as a complex integrability theorem.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Apply complex analytic subgroup integration and local complex quotient charts to F⁰gℂ; the real orbit is open in that quotient by its tangent isomorphism. Transport the complex charts. The exact complex quotient input is a supplier request and a recorded source gap.

Acceptance: The invariant almost complex structure on the h-orbit defined above is integrable. Construct holomorphic homogeneous charts using the local complex quotient by the subgroup integrating F⁰gℂ; do not use smooth real Frobenius alone as a complex integrability theorem.

Direct prerequisites: ShimuraData:D2/filtration-lie-subalgebra; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-4-frobenius-lies-third-theorem-and-the-equivalence-of-categories; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 1.21 proof, p.18 (Wolf 1984, 8.7.9); Theorem 2.14(a) proof, p.30. The cited complex quotient step is not reproduced in these notes. The exact holomorphic quotient/integrability input is requested and recorded as a gap, with the Hodge Lie-subalgebra calculation supplied here.

### Separation of the h-orbit

Declaration: **TauCeti.Shimura.quotientSeparation**. Node: ShimuraData:D2/quotient-separation. Kind: lemma.

The homogeneous topology on G(ℝ)/Kh is Hausdorff and second countable. Its local quotient charts are compatible with the topology induced by h-orbits in any faithful representation.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Apply the closed-subgroup quotient separation and second-countability facts from local-points/quotient suppliers; prove the faithful orbit comparison using the local quotient chart.

Acceptance: The homogeneous topology on G(ℝ)/Kh is Hausdorff and second countable. Its local quotient charts are compatible with the topology induced by h-orbits in any faithful representation.

Direct prerequisites: ShimuraData:D2/stabilizer-h; ShimuraData:D2/hodge-integrability; AutomorphicFormsOnReductiveGroups:AF.1.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §1, pp.10–12; §2, pp.30–31. For separation of the h-orbit, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Compact real factors

Declaration: **TauCeti.Shimura.compactRealFactor**. Node: ShimuraData:D2/compact-real-factor. Kind: lemma.

For an adjoint real simple factor H with h satisfying SV1–SV2, H(ℝ) is compact iff the projected h is trivial. Consequently compact real factors give point factors; SV3 excludes a trivial projection on a ℚ-simple factor, not a compact real factor inside its real extension.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Factor the adjoint h through S/Gm≅U₁ and apply the three-character argument: if the Cartan involution is identity, the nonzero two weights cannot occur.

Acceptance: For an adjoint real simple factor H with h satisfying SV1–SV2, H(ℝ) is compact iff the projected h is trivial. Consequently compact real factors give point factors; SV3 excludes a trivial projection on a ℚ-simple factor, not a compact real factor inside its real extension.

Direct prerequisites: ShimuraData:D2/cartan-adjoint-criterion; ShimuraData:D2/shimura-cartan-involution; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; ShimuraData:D1/hodge-decomposition-of-representation.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Lemma 4.7 and Proposition 4.8, pp.44–45. For compact real factors, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Hermitian domain theorem

Declaration: **TauCeti.Shimura.hermitianDomainComponents**. Node: ShimuraData:D2/hermitian-domain-components. Kind: theorem.

For a nonempty full real conjugacy class satisfying SV1–SV3, each connected component is a Hermitian symmetric domain of noncompact type, with compact real factors collapsed to points. In dimension zero use the singleton empty-product domain. The group of effective holomorphic transformations is obtained after its compact kernel; X is a finite union of these domains.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Use the Cartan symmetric-space construction factorwise, add the invariant integrable complex structure, and take the product of noncompact real simple factors; involutive symmetry is induced by h(i). Finiteness of real components comes from the real algebraic group interface.

Acceptance: For a nonempty full real conjugacy class satisfying SV1–SV3, each connected component is a Hermitian symmetric domain of noncompact type, with compact real factors collapsed to points. In dimension zero use the singleton empty-product domain. The group of effective holomorphic transformations is obtained after its compact kernel; X is a finite union of these domains.

Direct prerequisites: ShimuraData:D2/hodge-integrability; ShimuraData:D2/quotient-separation; ShimuraData:D2/compact-real-factor; ArithmeticLocallySymmetricSpaces:ALS.0; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 4.8 and Corollary 5.8, pp.45,55. For hermitian domain theorem, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.; [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 2.1.1, p.265. For hermitian domain theorem, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Uniqueness of the domain complex structure

Declaration: **TauCeti.Shimura.uniqueComplexStructure**. Node: ShimuraData:D2/unique-complex-structure. Kind: theorem.

The complex structure on X is uniquely determined by the requirement that the Hodge filtration associated with every algebraic real representation vary holomorphically. One faithful representation suffices, since all representations are subquotients of tensors and duals.

Hypotheses and conventions: G is a connected reductive real algebraic group; where a Shimura orbit is used, h is algebraic and has SV1 adjoint types and the SV2 Cartan property on the adjoint. Quotient/real-form structures are supplier inputs.

Proof or construction:

1. Embed the orbit locally in the faithful representation flag variety and use its injective tangent/holomorphic chart construction; then transport holomorphicity through tensor and subquotient operations.

Acceptance: The complex structure on X is uniquely determined by the requirement that the Hodge filtration associated with every algebraic real representation vary holomorphically. One faithful representation suffices, since all representations are subquotients of tensors and duals.

Direct prerequisites: ShimuraData:D2/hermitian-domain-components; ShimuraData:D2/filtration-lie-subalgebra; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules; ShimuraData:D1/tensor-comparison; ShimuraData:D1/dual-comparison.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 5.9 and proof, p.56. For uniqueness of the domain complex structure, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3"></a>

## D3. Homogeneous variations and compact duals

A variation consists of a finite-rank local system, its associated flat holomorphic bundle, a locally free holomorphic decreasing filtration, fiberwise opposedness, and Griffiths transversality ∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹. The integral polarized version additionally uses a finite-free ℤ-local system and a parallel polarization with the rational Hodge–Riemann positivity condition; integrality does not require a unimodular pairing. The pinned local coefficient API provides fibers and transport. It does not provide the holomorphic bundle, connection or gluing theorem; this gap is explicit. The BKT and Benoist inputs use this common carrier, while their additional period-domain and real-geometric statements remain with their owners.

For a rational algebraic G-representation whose weight is rational, the homogeneous family h↦ρh gives its Hodge filtration over each domain component. The adjoint three-type condition gives horizontality, and polarizability is stated with its rational hypotheses. Tensor products and change of datum must agree with the supplied representation operations.

The filtration stabilizer is the cocharacter parabolic with the fixed inverse sign. Over a field where a representative parabolic exists, the compact dual is G/P; tangent is g/p and the real domain has an open holomorphic Borel embedding. Over the reflex field it is the variety of parabolics of the Galois-invariant type. Defining the reflex field by the stabilizer of **the conjugacy class** of μ avoids incorrectly forcing μ itself to be rational. Finite definition fields make the class stabilizer open; effective projective descent gives the parabolic-type variety without an E-rational point. Representability is an exact R7/SF request, not inferred from a point quotient.

For a supplied based root datum and Levi M, ^MW denotes minimal representatives of W_M\W. Its criterion is w⁻¹Φ_M⁺⊆Φ⁺, and its cone condition is w(X*(T)⁺)⊆X*(T)^{+,M}. M-dominant weights are the union of the Weyl-translated dominant cones. The involution is w↦w_{0,M}ww₀, distinguishing the longest Levi element from the longest full Weyl element.

The integral flag statements use pinned split reductive group schemes over ℤ and their parabolics: P\G is partitioned into affine cells C_w of dimension ℓ(w); the Schubert closure is the union of C_v for v≤w. Opposite closures X^w and the open upper union Y_w=⋃_{v≥w}C_v are different objects. The requested opposite incidence theorem implies X^w⊆Y_w and must hold after base change to every residue field. Field-only Bruhat theory is insufficient for the uses over ℤ_p and ℤ/pℤ. The cited BL03 proof leaf has not been read and is recorded accordingly.


Planets: Variation of Hodge structure; Homogeneous Hodge variation; Compact dual; Borel embedding; Reflex field; Compact dual over the reflex field.

### Variation of Hodge structure

Declaration: **TauCeti.Shimura.variation**. Node: ShimuraData:D3/variation. Kind: definition.

On a complex manifold B, a pure real (or rational) variation of weight n is a finite-rank local system L, its associated holomorphic bundle L⊗O_B with flat connection ∇, and a finite bounded decreasing filtration F by holomorphic subbundles. Each fiber has n-opposed conjugate filtrations and ∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹_B. Morphisms are flat maps preserving F. This includes nonconstant monodromy; it is not just a map into a set of Hodge structures.

Hypotheses and conventions: B is a complex manifold; n is an integer; L is a locally constant finite-rank real/rational system. In the integral polarized case its ℤ-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Proof or construction:

1. Use local-system trivializations to glue the flat bundle and filtration; fiber purity is the pinned opposed-filtration condition. The holomorphic bundle/connection infrastructure is explicitly a missing input, not a field of arbitrary propositions.

API:

- **TauCeti.Shimura.variationFiber** (characterisation): Evaluation at b returns the existing pure Hodge structure of weight n.
- **TauCeti.Shimura.variationPullback** (characterisation): Holomorphic pullback preserves flatness, opposedness and transversality.
- **TauCeti.Shimura.variationMorphism** (characterisation): Flat filtration-preserving maps compose and induce Hodge morphisms on fibers.

Discriminating unit tests:

- **TauCeti.Shimura.tests.variationConstant** (computation): A constant pure Hodge structure with constant filtration is a variation. Rejects: Nonconstant variation required.
- **TauCeti.Shimura.tests.variationElliptic** (computation): The weight-one elliptic family over ℍ has moving F¹ and satisfies transversality. Rejects: All filtrations required locally constant.
- **TauCeti.Shimura.tests.variationNonHorizontal** (computation): On a small disk take a constant weight-three rank-four polarized real space with complex basis e₀,e₁,e₂,e₃, conjugation e₀↔e₃,e₁↔e₂, Q(e₀,e₃)=i,Q(e₁,e₂)=−i (skew extended). Put F³(z)=ℂ(e₀+ze₃), F²(z)=F³(z)+ℂe₁ and F¹(z)=F³(z)^⊥. Near 0 the fibers are polarized and the flags holomorphic, but dF³(0)=e₃ mod F³(0) is outside F²(0)/F³(0), so this is not a variation. Rejects: Holomorphicity substituted for Griffiths transversality.

Uses:

- ShimuraData:D3/homogeneous-variation: Homogeneous Hodge variation consumes variation of hodge structure: Evaluation at b returns the existing pure Hodge structure of weight n.
- BKT period-map definitions: Its period maps require a finite-free integral local system, flat polarization and Griffiths-transverse holomorphic filtration, including nontrivial monodromy.
- Benoist vanishing-cycle subvariation: The H² vanishing-cycle variation supplies the polarized integral carrier; real involution and geometric vanishing-cycle criteria belong to HodgeStructures Part II.

Acceptance: On a complex manifold B, a pure real (or rational) variation of weight n is a finite-rank local system L, its associated holomorphic bundle L⊗O_B with flat connection ∇, and a finite bounded decreasing filtration F by holomorphic subbundles. Each fiber has n-opposed conjugate filtrations and ∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹_B. Morphisms are flat maps preserving F. This includes nonconstant monodromy; it is not just a map into a set of Hodge structures.

Direct prerequisites: tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition; tauceti:TauCeti.LocalCoefficientSystem.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Variations of Hodge structures, pp.28–29. The notes explain general local systems before restricting to constant ones on simply connected Hermitian domains. This node retains general finite-rank monodromy, holomorphic subbundles and the −1 connection condition.

### Polarized integral variation

Declaration: **TauCeti.Shimura.polarizedIntegralVariation**. Node: ShimuraData:D3/polarized-integral-variation. Kind: definition.

A polarized integral variation of weight n is a variation with a locally constant finite free ℤ-lattice, its rational/complex scalar extensions, and a flat nondegenerate rational polarizing form into ℚ(−n) (equivalently the conventional ℤ-valued form with explicit Tate normalization). The form has parity (−1)ⁿ and gives the pinned positive Hermitian form on every fiber. The lattice is locally free, not forced to be globally constant or unimodular.

Hypotheses and conventions: B is a complex manifold; n is an integer; L is a locally constant finite-rank real/rational system. In the integral polarized case its ℤ-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Proof or construction:

1. Bundle the finite-free integral local system and parallel pairing; identify the fiberwise polarization with the supplied pure polarization after the chosen Tate factor. Do not require perfect integral pairing unless specified.

API:

- **TauCeti.Shimura.integralVariationRational** (characterisation): Rationalization is a polarized rational variation.
- **TauCeti.Shimura.integralVariationPairing** (characterisation): Parallel transport preserves the form and integral lattice.
- **TauCeti.Shimura.integralVariationPullback** (characterisation): Pullback preserves finite freeness and fiber polarization.

Discriminating unit tests:

- **TauCeti.Shimura.tests.integralConstantTate** (computation): The rank-one constant ℤ(1) lattice has weight −2 and the usual Tate polarization. Rejects: Only nonnegative weights.
- **TauCeti.Shimura.tests.integralScaledPairing** (computation): Multiplying a lattice polarization by 2 still gives a polarized integral variation. Rejects: Unimodularity imposed.
- **TauCeti.Shimura.tests.integralMonodromy** (degenerate): An elliptic variation around a cusp has nontrivial integral monodromy and remains admissible here. Rejects: Global triviality imposed.

Uses:

- BKT period maps: Its period maps require a finite-free integral local system, flat polarization and Griffiths-transverse holomorphic filtration, including nontrivial monodromy.
- Benoist H² vanishing cycles: The H² vanishing-cycle variation supplies the polarized integral carrier; real involution and geometric vanishing-cycle criteria belong to HodgeStructures Part II.

Acceptance: A polarized integral variation of weight n is a variation with a locally constant finite free ℤ-lattice, its rational/complex scalar extensions, and a flat nondegenerate rational polarizing form into ℚ(−n) (equivalently the conventional ℤ-valued form with explicit Tate normalization). The form has parity (−1)ⁿ and gives the pinned positive Hermitian form on every fiber. The lattice is locally free, not forced to be globally constant or unimodular.

Direct prerequisites: tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory; ShimuraData:D3/variation.

Source evidence: [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://par.nsf.gov/servlets/purl/10200187), §1.3, pp.6–7. For polarized integral variation, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Flat bundle local comparison

Declaration: **TauCeti.Shimura.flatBundleLocal**. Node: ShimuraData:D3/flat-bundle-local. Kind: lemma.

In every simply connected local-system trivialization, the associated connection is the ordinary differential on holomorphic sections, and fiberwise opposedness is exactly the existing pure HodgeStructureOn condition. These descriptions agree on overlaps by locally constant transition maps.

Hypotheses and conventions: B is a complex manifold; n is an integer; L is a locally constant finite-rank real/rational system. In the integral polarized case its ℤ-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Proof or construction:

1. Check the change-of-frame formula for constant transition matrices; apply the chain rule to filtration sections.

Acceptance: In every simply connected local-system trivialization, the associated connection is the ordinary differential on holomorphic sections, and fiberwise opposedness is exactly the existing pure HodgeStructureOn condition. These descriptions agree on overlaps by locally constant transition maps.

Direct prerequisites: ShimuraData:D3/variation; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, pp.28–29. For flat bundle local comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Tangent criterion for transversality

Declaration: **TauCeti.Shimura.transversalityTangent**. Node: ShimuraData:D3/transversality-tangent. Kind: lemma.

For a holomorphic family with constant local system V, Griffiths transversality is equivalent to the differential of its flag map lying in F^{−1}End(Vℂ)/F⁰End(Vℂ) at every point. This is a first-order condition, not merely continuity of the Hodge pieces.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Identify tangent to the flag variety with End/F⁰ and differentiate each filtration step; compare with ∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹.

Acceptance: For a holomorphic family with constant local system V, Griffiths transversality is equivalent to the differential of its flag map lying in F^{−1}End(Vℂ)/F⁰End(Vℂ) at every point. This is a first-order condition, not merely continuity of the Hodge pieces.

Direct prerequisites: ShimuraData:D3/flat-bundle-local; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, equations (18)–(19), p.29. For tangent criterion for transversality, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Homogeneous Hodge variation

Declaration: **TauCeti.Shimura.homogeneousVariation**. Node: ShimuraData:D3/homogeneous-variation. Kind: construction.

For a Shimura orbit X and a finite-dimensional real algebraic representation ρ of G, each constant weight summand Vn with filtrations F_h gives a weight-n real variation over X. For a rational representation it is rational precisely when the weight summands descend over ℚ. A polarized version requires a G-covariant rational form and its positivity on the chosen component; arbitrary representations are not declared polarized.

Hypotheses and conventions: B is a complex manifold; n is an integer; L is a locally constant finite-rank real/rational system. In the integral polarized case its ℤ-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Proof or construction:

1. Holomorphicity is the domain characterization. The differential is induced by the adjoint action; its −1 filtration bound follows from SV1 and bracket/tensor compatibility. Rationality follows from rational weight.

API:

- **TauCeti.Shimura.homogeneousFiber** (characterisation): Its fiber at h is the existing pure weight-n object for ρ∘h.
- **TauCeti.Shimura.homogeneousTransversality** (characterisation): Its flag differential has image in F^{−1}End/F⁰End.
- **TauCeti.Shimura.homogeneousTensor** (compatibility): It respects tensors, duals, Tate twists and pullback along datum morphisms.

Discriminating unit tests:

- **TauCeti.Shimura.tests.homogeneousTrivial** (degenerate): The trivial representation gives the constant weight-zero variation. Rejects: Nonconstant filtration forced.
- **TauCeti.Shimura.tests.homogeneousSiegel** (computation): The standard Siegel representation gives the weight −1 homology variation. Rejects: Cohomology signs silently substituted.
- **TauCeti.Shimura.tests.homogeneousTorus** (computation): For a torus datum it is a variation over a point, with all its possible weights retained. Rejects: Positive-dimensional base assumed.

Uses:

- ShimuraVarieties:V1 coefficient systems: The consumer uses homogeneous hodge variation through these concrete interfaces: Its fiber at h is the existing pure weight-n object for ρ∘h. Its flag differential has image in F^{−1}End/F⁰End.
- ShimuraData:D3/borel-embedding: Borel embedding consumes homogeneous hodge variation: Its fiber at h is the existing pure weight-n object for ρ∘h.

Acceptance: For a Shimura orbit X and a finite-dimensional real algebraic representation ρ of G, each constant weight summand Vn with filtrations F_h gives a weight-n real variation over X. For a rational representation it is rational precisely when the weight summands descend over ℚ. A polarized version requires a G-covariant rational form and its positivity on the chosen component; arbitrary representations are not declared polarized.

Direct prerequisites: ShimuraData:D2/unique-complex-structure; ShimuraData:D1/pure-hodge-of-representation; ShimuraData:D1/rational-weight-criterion; ShimuraData:D3/variation; ShimuraData:D3/transversality-tangent; ShimuraData:D3/homogeneous-horizontal.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 5.9 and proof, p.56. The passage gives a holomorphic/transverse family for every real algebraic representation. The rational weight and polarizing-form qualifications are explicit; no arbitrary representation is declared polarized.

### Horizontality of homogeneous families

Declaration: **TauCeti.Shimura.homogeneousHorizontal**. Node: ShimuraData:D3/homogeneous-horizontal. Kind: lemma.

For A∈g^{−1,1}, the differential of F_h in a representation sends V^{p,q} into V^{p−1,q+1}; therefore it lowers F by at most one. The center has zero differential on the period filtration.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Differentiate the representation action and use equivariance g⊗V→V to add bidegrees.

Acceptance: For A∈g^{−1,1}, the differential of F_h in a representation sends V^{p,q} into V^{p−1,q+1}; therefore it lowers F by at most one. The center has zero differential on the period filtration.

Direct prerequisites: ShimuraData:D2/adjoint-bracket; ShimuraData:D1/tensor-comparison; ShimuraData:D3/transversality-tangent.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), Proposition 1.1.14(ii) and proof, pp.254–255. The proof identifies the filtered tangent differential and relates its −1 bound to the three adjoint types; representation equivariance then gives the stated lowering rule.

### Parabolic of the Hodge filtration

Declaration: **TauCeti.Shimura.filtrationParabolic**. Node: ShimuraData:D3/filtration-parabolic. Kind: construction.

For h and any faithful representation, the stabilizer of all F_hᵖ is the parabolic P_h⊂Gℂ with Lie algebra F⁰gℂ. It is independent of the faithful representation. With μh(z)=hℂ(z,1), this is P(μh⁻¹) under the limit t→0 convention; equivalently use P(μh) with the opposite filtration convention. Its Levi is ZGℂ(μh), not its unipotent radical.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. The filtration uses p while μ acts by −p: matrices preserving p≥a have nonpositive μ-weight entries. Apply the dynamic parabolic theorem to −μ, and the faithful-representation comparison.

API:

- **TauCeti.Shimura.filtrationParabolicLie** (characterisation): Lie(P_h)=F⁰gℂ.
- **TauCeti.Shimura.filtrationParabolicLevi** (characterisation): ZGℂ(μh) is a Levi of P_h.
- **TauCeti.Shimura.filtrationParabolicConjugate** (characterisation): P_{ghg⁻¹}=gP_hg⁻¹ and does not depend on faithful representation.

Discriminating unit tests:

- **TauCeti.Shimura.tests.parabolicGl2** (computation): For GL₂, P_h stabilizes the one-dimensional F⁰ line and is a Borel. Rejects: Whole GL₂ or opposite line selected.
- **TauCeti.Shimura.tests.parabolicTorus** (degenerate): For a torus datum, P_h=Tℂ and its unipotent radical is trivial. Rejects: Levi confused with unipotent radical.
- **TauCeti.Shimura.tests.parabolicSiegel** (computation): For GSp₂g, P_h is the Lagrangian stabilizer with Levi GLg×Gm. Rejects: General flag rather than Siegel parabolic.

Uses:

- ShimuraData:D3/compact-dual: Compact dual consumes parabolic of the hodge filtration: Lie(P_h)=F⁰gℂ.
- ShimuraData:D3/kostant-representatives: Kostant representatives consumes parabolic of the hodge filtration: Lie(P_h)=F⁰gℂ.

Acceptance: For h and any faithful representation, the stabilizer of all F_hᵖ is the parabolic P_h⊂Gℂ with Lie algebra F⁰gℂ. It is independent of the faithful representation. With μh(z)=hℂ(z,1), this is P(μh⁻¹) under the limit t→0 convention; equivalently use P(μh) with the opposite filtration convention. Its Levi is ZGℂ(μh), not its unipotent radical.

Direct prerequisites: ShimuraData:D2/filtration-lie-subalgebra; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Flag varieties pp.23–24; Theorem 2.14 proof p.30; §12 p.111. The flag stabilizer has Lie algebra F⁰End, pulled back along a faithful representation. With μ acting as z^−p the dynamic parabolic uses μ inverse; R7 supplies its representability and Levi.

Corrected source readings: ShimuraData/E1.

### Compact dual

Declaration: **TauCeti.Shimura.compactDual**. Node: ShimuraData:D3/compact-dual. Kind: construction.

For a Shimura orbit X, construct its complex projective homogeneous flag variety X∨=Gℂ/P_h, independent up to canonical Gℂ-isomorphism of the chosen h. Use right cosets G/P for the Borel embedding; identify it by inversion with left cosets P\G for the routed Bruhat convention.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Use the represented parabolic quotient and conjugation isomorphisms. Give transition maps for changing h and the inversion comparison to left cosets.

API:

- **TauCeti.Shimura.compactDualBasepoint** (characterisation): The basepoint has stabilizer P_h.
- **TauCeti.Shimura.compactDualChangePoint** (characterisation): Changing h by g gives the equivariant conjugate-parabolic identification.
- **TauCeti.Shimura.compactDualTangent** (characterisation): T_hX∨≅gℂ/F⁰gℂ≅g^{−1,1}.

Discriminating unit tests:

- **TauCeti.Shimura.tests.dualGl2** (computation): The GL₂ compact dual is ℙ¹ℂ. Rejects: Affine upper half plane taken as dual.
- **TauCeti.Shimura.tests.dualTorus** (computation): The torus compact dual is a point. Rejects: Torus dimension assigned to dual.
- **TauCeti.Shimura.tests.dualSiegel** (computation): The Siegel compact dual is the Lagrangian Grassmannian with dimension g(g+1)/2. Rejects: Full flag variety used.

Uses:

- ShimuraData:D3/borel-embedding: Borel embedding consumes compact dual: The basepoint has stabilizer P_h.
- ShimuraData:D3/reflex-flag-descent: Compact dual over the reflex field consumes compact dual: The basepoint has stabilizer P_h.
- PerfectoidShimuraVarieties Hodge–Tate target: The consumer uses compact dual through these concrete interfaces: The basepoint has stabilizer P_h. Changing h by g gives the equivariant conjugate-parabolic identification.

Acceptance: For a Shimura orbit X, construct its complex projective homogeneous flag variety X∨=Gℂ/P_h, independent up to canonical Gℂ-isomorphism of the chosen h. Use right cosets G/P for the Borel embedding; identify it by inversion with left cosets P\G for the routed Bruhat convention.

Direct prerequisites: ShimuraData:D3/filtration-parabolic; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Flag varieties, pp.23–24. For compact dual, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Differential of the Borel map

Declaration: **TauCeti.Shimura.borelTangent**. Node: ShimuraData:D3/borel-tangent. Kind: lemma.

The map h↦F_h into X∨ has differential gℝ/kℝ→gℂ/F⁰gℂ. It is a real-linear isomorphism compatible with J and multiplication by i, and hence a complex-linear isomorphism for the constructed complex tangent.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Project the complexified real tangent onto g^{−1,1}; conjugation identifies the second summand, yielding the real isomorphism.

Acceptance: The map h↦F_h into X∨ has differential gℝ/kℝ→gℂ/F⁰gℂ. It is a real-linear isomorphism compatible with J and multiplication by i, and hence a complex-linear isomorphism for the constructed complex tangent.

Direct prerequisites: ShimuraData:D2/hodge-tangent-operator; ShimuraData:D3/compact-dual.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 2.14 proof, p.30. For differential of the borel map, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Injectivity of the Borel map

Declaration: **TauCeti.Shimura.borelInjective**. Node: ShimuraData:D3/borel-injective. Kind: lemma.

Within a fixed full G(ℝ)-conjugacy class X, equality of Hodge filtrations in a faithful representation implies equality of h. The central weight is constant on X, and opposedness recovers every bidegree from the filtration and fixed real conjugation.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Recover pieces and the S-action from opposed filtrations and the fixed weight decomposition; faithfulness then recovers h.

Acceptance: Within a fixed full G(ℝ)-conjugacy class X, equality of Hodge filtrations in a faithful representation implies equality of h. The central weight is constant on X, and opposedness recovers every bidegree from the filtration and fixed real conjugation.

Direct prerequisites: ShimuraData:D1/representation-hodge-equivalence; ShimuraData:D3/compact-dual.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 2.14 proof, p.30. For injectivity of the borel map, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Borel embedding

Declaration: **TauCeti.Shimura.borelEmbedding**. Node: ShimuraData:D3/borel-embedding. Kind: theorem.

The filtration map X→X∨(ℂ) is a G(ℝ)-equivariant holomorphic open embedding, identifying every component with an open orbit. The full image can have several connected components.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Apply the complex inverse function theorem to the tangent isomorphism, then use injectivity for an open embedding.

Acceptance: The filtration map X→X∨(ℂ) is a G(ℝ)-equivariant holomorphic open embedding, identifying every component with an open orbit. The full image can have several connected components.

Direct prerequisites: ShimuraData:D3/borel-tangent; ShimuraData:D3/borel-injective; ShimuraData:D2/quotient-separation; ShimuraData:D2/unique-complex-structure.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 2.14 and proof, pp.30–31. For borel embedding, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Hodge cocharacter conjugacy class

Declaration: **TauCeti.Shimura.cocharacterClass**. Node: ShimuraData:D3/cocharacter-class. Kind: construction.

The cocharacters μh(z)=hℂ(z,1), for h∈X, lie in one G(ℂ)-conjugacy class. Identify this class with a unique G(ℚ̄)-conjugacy class using the bijection under algebraically closed extension. It is this class, with its natural Gal(ℚ̄/ℚ)-action, that is stored; a chosen representative over the reflex field is not stored.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Use split maximal tori and Weyl-orbits of their cocharacter lattice to identify the ℚ̄ and ℂ class sets. The conjugation relation makes the class independent of h.

API:

- **TauCeti.Shimura.cocharacterClassIndependent** (characterisation): All h in the same full real orbit give the same geometric class.
- **TauCeti.Shimura.cocharacterClassGalois** (characterisation): Scalar automorphisms act on the class set and respect conjugacy.
- **TauCeti.Shimura.cocharacterClassMap** (characterisation): A datum morphism induces an equivariant map sending source class to target class.

Discriminating unit tests:

- **TauCeti.Shimura.tests.classTorus** (degenerate): For a torus conjugacy is trivial and the class consists of μ itself. Rejects: Weyl quotient forced nontrivial.
- **TauCeti.Shimura.tests.classGl2** (computation): For GL₂ the class is the unordered cocharacter weights {1,0}. Rejects: −1,0 used with homology sign.
- **TauCeti.Shimura.tests.classProduct** (computation): A product datum has the product of its two classes. Rejects: Selecting one component instead of the full class.

Uses:

- ShimuraData:D3/reflex-field: Reflex field consumes hodge cocharacter conjugacy class: All h in the same full real orbit give the same geometric class.
- ShimuraData:D3/reflex-flag-descent: Compact dual over the reflex field consumes hodge cocharacter conjugacy class: All h in the same full real orbit give the same geometric class.

Acceptance: The cocharacters μh(z)=hℂ(z,1), for h∈X, lie in one G(ℂ)-conjugacy class. Identify this class with a unique G(ℚ̄)-conjugacy class using the bijection under algebraically closed extension. It is this class, with its natural Gal(ℚ̄/ℚ)-action, that is stored; a chosen representative over the reflex field is not stored.

Direct prerequisites: ShimuraData:D1/deligne-torus-points; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Lemma 12.1 and following paragraph, p.111. For hodge cocharacter conjugacy class, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Reflex field

Declaration: **TauCeti.Shimura.reflexField**. Node: ShimuraData:D3/reflex-field. Kind: definition.

E(G,X)⊂ℚ̄ is the fixed field of the Gal(ℚ̄/ℚ)-stabilizer of the geometric cocharacter conjugacy class. This is the field of definition of the class. Its definition does not assert existence of an E-rational μ or an E-rational parabolic.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects. Galois acts on the geometric cocharacter conjugacy class in ℚ̄. The field is the fixed field of its open stabilizer; no rational representative or parabolic point is assumed.

Proof or construction:

1. Take the stabilizer subgroup in the class action and its fixed intermediate field.

API:

- **TauCeti.Shimura.reflexStabilizer** (compatibility): An automorphism fixes E iff it stabilizes the class, after the openness/finiteness theorem.
- **TauCeti.Shimura.reflexMap** (compatibility): For a datum morphism (G,X)→(G′,X′), E(G′,X′)⊆E(G,X).
- **TauCeti.Shimura.reflexProduct** (compatibility): The reflex field of a product is the compositum of the two reflex fields.

Discriminating unit tests:

- **TauCeti.Shimura.tests.reflexGl2** (computation): The GL₂ datum has reflex field ℚ. Rejects: Field ℂ or real subfield used.
- **TauCeti.Shimura.tests.reflexCm** (computation): The CM torus datum has the CM-type stabilizer field. Rejects: All torus reflex fields forced ℚ.
- **TauCeti.Shimura.tests.reflexProductCm** (computation): Product with a rational-reflex datum leaves the CM reflex field unchanged. Rejects: Field intersection substituted for compositum.

Uses:

- ShimuraVarieties:V4–V7: The consumer uses reflex field through these concrete interfaces: An automorphism fixes E iff it stabilizes the class, after the openness/finiteness theorem. For a datum morphism (G,X)→(G′,X′), E(G′,X′)⊆E(G,X).
- PELModuli reflex field: The consumer uses reflex field through these concrete interfaces: An automorphism fixes E iff it stabilizes the class, after the openness/finiteness theorem. For a datum morphism (G,X)→(G′,X′), E(G′,X′)⊆E(G,X).
- ComplexMultiplicationAndExplicitReciprocity:CM.0 comparison: The consumer uses reflex field through these concrete interfaces: An automorphism fixes E iff it stabilizes the class, after the openness/finiteness theorem. For a datum morphism (G,X)→(G′,X′), E(G′,X′)⊆E(G,X).

Acceptance: E(G,X)⊂ℚ̄ is the fixed field of the Gal(ℚ̄/ℚ)-stabilizer of the geometric cocharacter conjugacy class. This is the field of definition of the class. Its definition does not assert existence of an E-rational μ or an E-rational parabolic.

Direct prerequisites: ShimuraData:D3/cocharacter-class; mathlib:IntermediateField.fixedField.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 12.2, p.112. For reflex field, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Open cocharacter-class stabilizer

Declaration: **TauCeti.Shimura.reflexStabilizerOpen**. Node: ShimuraData:D3/reflex-stabilizer-open. Kind: lemma.

The stabilizer of the geometric class is open and contains Gal(ℚ̄/L) for any finite splitting field L of G in ℚ̄. Hence its fixed field is finite over ℚ.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects. Galois acts on the geometric cocharacter conjugacy class in ℚ̄. The field is the fixed field of its open stabilizer; no rational representative or parabolic point is assumed.

Proof or construction:

1. Over a splitting field, every geometric class is represented by a split-torus cocharacter and its Weyl orbit is unchanged by algebraically closed extension. Apply finite Galois theory after a normal closure.

Acceptance: The stabilizer of the geometric class is open and contains Gal(ℚ̄/L) for any finite splitting field L of G in ℚ̄. Hence its fixed field is finite over ℚ.

Direct prerequisites: ShimuraData:D3/cocharacter-class; tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; mathlib:IntermediateField.fixedField.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Remark 12.3(a), p.112. For open cocharacter-class stabilizer, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Finiteness of the reflex field

Declaration: **TauCeti.Shimura.reflexFinite**. Node: ShimuraData:D3/reflex-finite. Kind: theorem.

The reflex field E(G,X) is a number field contained in every finite splitting field of G. A representative defined over L implies E⊆L; the converse is asserted only under an additional quasi-split hypothesis, and is not needed here.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects. Galois acts on the geometric cocharacter conjugacy class in ℚ̄. The field is the fixed field of its open stabilizer; no rational representative or parabolic point is assumed.

Proof or construction:

1. Apply the fixed-field degree bound from an open subgroup containing a finite-index Galois subgroup.

Acceptance: The reflex field E(G,X) is a number field contained in every finite splitting field of G. A representative defined over L implies E⊆L; the converse is asserted only under an additional quasi-split hypothesis, and is not needed here.

Direct prerequisites: ShimuraData:D3/reflex-field; ShimuraData:D3/reflex-stabilizer-open.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Remark 12.3(a)–(b), p.112. For finiteness of the reflex field, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Compact dual over the reflex field

Declaration: **TauCeti.Shimura.reflexFlagDescent**. Node: ShimuraData:D3/reflex-flag-descent. Kind: theorem.

Let t be the geometric conjugacy type of P_h. The Galois-stable type over E defines the projective E-scheme Par_t(G_E) of parabolic subgroups of that type. Its complex extension is X∨; over any L/E with an L-rational P of type t, it is G_L/P. The E-scheme may have no E-points.

Hypotheses and conventions: The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects. Galois acts on the geometric cocharacter conjugacy class in ℚ̄. The field is the fixed field of its open stabilizer; no rational representative or parabolic point is assumed.

Proof or construction:

1. The class determines its parabolic type equivariantly. Import representability and equivariant descent of the parabolic-type functor, then identify the complex fiber by transitivity. No descent of a selected P is used. The exact projective parabolic-type theorem is requested and remains an open leaf.

Acceptance: Let t be the geometric conjugacy type of P_h. The Galois-stable type over E defines the projective E-scheme Par_t(G_E) of parabolic subgroups of that type. Its complex extension is X∨; over any L/E with an L-rational P of type t, it is G_L/P. The E-scheme may have no E-points.

Direct prerequisites: ShimuraData:D3/filtration-parabolic; ShimuraData:D3/reflex-finite; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; SchemeAndStackFoundations:SF.1.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Lemma 12.1 and Definition 12.2, pp.111–112; parabolic-type representability/descent is an explicit supplier gap. For compact dual over the reflex field, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Kostant representatives

Declaration: **TauCeti.Shimura.kostantRepresentatives**. Node: ShimuraData:D3/kostant-representatives. Kind: definition.

For a split reductive group with T⊂B⊂P and Levi M containing T, ^MW consists of the unique minimal-length representatives of the left cosets WM\W. Use the left action wκ(t)=κ(w⁻¹tw); in particular ^MW is characterized by w⁻¹ΦM⁺⊂Φ⁺. Specialize to the cocharacter parabolic only after choosing its compatible Borel.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use the Weyl Coxeter length and standard parabolic subgroup supplied by reductive theory. Specify the side of the cosets, rather than silently using W/WM.

API:

- **TauCeti.Shimura.kostantUnique** (characterisation): Every left coset has exactly one minimal representative.
- **TauCeti.Shimura.kostantPositive** (characterisation): w belongs iff w⁻¹ΦM⁺⊂Φ⁺.
- **TauCeti.Shimura.kostantLengthAdd** (characterisation): For u∈WM and w∈^MW, ℓ(uw)=ℓ(u)+ℓ(w).

Discriminating unit tests:

- **TauCeti.Shimura.tests.kostantBorel** (degenerate): When M=T, ^MW=W. Rejects: Right/left subgroup reversed.
- **TauCeti.Shimura.tests.kostantWholeGroup** (degenerate): When P=G, ^MW={1}. Rejects: All W retained regardless of Levi.
- **TauCeti.Shimura.tests.kostantA2Left** (computation): For A₂ and WM=⟨s₁⟩, ^MW={1,s₂,s₂s₁}. Rejects: Right representatives {1,s₂,s₁s₂} used.

Uses:

- ShimuraData:D3/kostant-cones: Levi dominant cone decomposition consumes kostant representatives: Every left coset has exactly one minimal representative.
- ShimuraData:D5/siegel-kostant: The consumer uses kostant representatives through these concrete interfaces: Every left coset has exactly one minimal representative. w belongs iff w⁻¹ΦM⁺⊂Φ⁺.
- PotentialAutomorphyInfrastructure Kostant input: The consumer uses kostant representatives through these concrete interfaces: Every left coset has exactly one minimal representative. w belongs iff w⁻¹ΦM⁺⊂Φ⁺.

Acceptance: For a split reductive group with T⊂B⊂P and Levi M containing T, ^MW consists of the unique minimal-length representatives of the left cosets WM\W. Use the left action wκ(t)=κ(w⁻¹tw); in particular ^MW is characterized by w⁻¹ΦM⁺⊂Φ⁺. Specialize to the cocharacter parabolic only after choosing its compatible Borel.

Direct prerequisites: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; ShimuraData:D3/filtration-parabolic.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Definition 1.3.1, p.3; §3.1, p.34. For kostant representatives, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Kostant cone criterion

Declaration: **TauCeti.Shimura.kostantConeCriterion**. Node: ShimuraData:D3/kostant-cone-criterion. Kind: lemma.

For w∈W, w(X*(T)⁺)⊆X*(T)^{+,M} iff w⁻¹ΦM⁺⊂Φ⁺ iff w∈^MW. ΦM⁺ denotes positive Levi roots, distinct from the complementary noncompact roots Φ^{+,M}.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Pair wκ with Levi coroots and use w⁻¹ on the coroot. If an image root is negative, choose an integral strictly dominant weight to witness failure.

Acceptance: For w∈W, w(X*(T)⁺)⊆X*(T)^{+,M} iff w⁻¹ΦM⁺⊂Φ⁺ iff w∈^MW. ΦM⁺ denotes positive Levi roots, distinct from the complementary noncompact roots Φ^{+,M}.

Direct prerequisites: ShimuraData:D3/kostant-representatives; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34; root criterion corrected as E2. For kostant cone criterion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E2.

### Levi dominant cone decomposition

Declaration: **TauCeti.Shimura.kostantCones**. Node: ShimuraData:D3/kostant-cones. Kind: theorem.

X*(T)^{+,M}=⋃w∈^MW wX*(T)⁺, including boundary weights. In the real weight space the same union covers the closed Levi chamber.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Choose a full-W dominant translate. Move its coset into a minimal left representative; any remaining Levi chamber motion fixes the wall weight after using its stabilizer. Use Coxeter parabolic factorization, not disjointness on walls.

Acceptance: X*(T)^{+,M}=⋃w∈^MW wX*(T)⁺, including boundary weights. In the real weight space the same union covers the closed Levi chamber.

Direct prerequisites: ShimuraData:D3/kostant-cone-criterion; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §1.3.3, p.3. For levi dominant cone decomposition, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Kostant opposition involution

Declaration: **TauCeti.Shimura.kostantInvolution**. Node: ShimuraData:D3/kostant-involution. Kind: lemma.

Writing w0,G and w0,M for the longest elements of W and WM, w↦w0,M w w0,G preserves ^MW, is an involution, and changes length to dim(G/P)−ℓ(w). The longest Levi and full Weyl elements are different.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use positive-root characterization and longest-element root reversal; count roots outside the Levi, then square the map.

Acceptance: Writing w0,G and w0,M for the longest elements of W and WM, w↦w0,M w w0,G preserves ^MW, is an involution, and changes length to dim(G/P)−ℓ(w). The longest Levi and full Weyl elements are different.

Direct prerequisites: ShimuraData:D3/kostant-representatives; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §1.3, p.5. For kostant opposition involution, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Integral Bruhat stratification

Declaration: **TauCeti.Shimura.bruhatIntegral**. Node: ShimuraData:D3/bruhat-integral. Kind: theorem.

For a split pinned reductive group over ℤ and standard P, the left-coset flag scheme P\G has B-orbit cells Cw=P\PwB indexed by ^MW, each isomorphic to A^{ℓ(w)}_ℤ. The cells stratify the flag scheme, commute with base change, and have relative dimension ℓ(w). This includes ℤp and 𝔽p, not only characteristic-zero points.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Import the integral root-subgroup cell factorization and base-change compatibility from layer9; specialize the quotient and identify its indexing with ^MW. Its full integral proof is a precise supplier request.

Acceptance: For a split pinned reductive group over ℤ and standard P, the left-coset flag scheme P\G has B-orbit cells Cw=P\PwB indexed by ^MW, each isomorphic to A^{ℓ(w)}_ℤ. The cells stratify the flag scheme, commute with base change, and have relative dimension ℓ(w). This includes ℤp and 𝔽p, not only characteristic-zero points.

Direct prerequisites: ShimuraData:D3/kostant-representatives; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For integral bruhat stratification, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Schubert and opposite Schubert loci

Declaration: **TauCeti.Shimura.schubertFamilies**. Node: ShimuraData:D3/schubert-families. Kind: construction.

On P\G, define Xw as the scheme-theoretic closure of Cw and X^w as closure of the opposite-Borel cell C^w. Define Yw as the open union of standard cells Cv with v≥w. Use the corrected distinction between cells and their closures.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use the integral Schubert closure and opposite-Borel action; the complement of Yw is a lower Bruhat ideal and hence a closed union of Schubert varieties.

API:

- **TauCeti.Shimura.schubertClosure** (characterisation): The underlying locus of Xw is ⋃v≤w Cv; the reduced schematic closure is the supplied Schubert variety, compatibly with base change. A disjoint cell union is not asserted to equal Xw as a scheme.
- **TauCeti.Shimura.oppositeSchubertClosure** (characterisation): X^w=⋃v≥w C^v.
- **TauCeti.Shimura.schubertUpperOpen** (characterisation): Yw is open, contains Cw, and its complement is the lower closed Bruhat union.

Discriminating unit tests:

- **TauCeti.Shimura.tests.schubertRankOne** (computation): For P=B in SL₂, X₁ is a point, X_s=ℙ¹, Y₁=ℙ¹ and Y_s is an affine open. Rejects: Xw called the open cell.
- **TauCeti.Shimura.tests.schubertOppositeRankOne** (computation): The opposite closed point X^s is contained in the standard open cell Y_s, not in X₁. Rejects: Opposite and standard cells identified.
- **TauCeti.Shimura.tests.schubertTrivialFlag** (computation): For P=G all three loci are the point and ℓ(1)=0. Rejects: Positive-dimensional flag assumed.

Uses:

- ShimuraData:D3/opposite-inside-upper: Opposite Schubert inclusion consumes schubert and opposite schubert loci: The underlying locus of Xw is ⋃v≤w Cv; the reduced schematic closure is the supplied Schubert variety, compatibly with base change. A disjoint cell union is not asserted to equal Xw as a scheme.
- Boxer–Pilloni support conditions: The consumer uses schubert and opposite schubert loci through these concrete interfaces: The underlying locus of Xw is ⋃v≤w Cv; the reduced schematic closure is the supplied Schubert variety, compatibly with base change. A disjoint cell union is not asserted to equal Xw as a scheme. X^w=⋃v≥w C^v.

Acceptance: On P\G, define Xw as the scheme-theoretic closure of Cw and X^w as closure of the opposite-Borel cell C^w. Define Yw as the open union of standard cells Cv with v≥w. Use the corrected distinction between cells and their closures.

Direct prerequisites: ShimuraData:D3/bruhat-integral; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §6.1, p.60; corrected E116. For schubert and opposite schubert loci, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.; [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), §3.1, pp.31–32. For schubert and opposite schubert loci, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E4.

### Bruhat closure criterion

Declaration: **TauCeti.Shimura.bruhatClosureOrder**. Node: ShimuraData:D3/bruhat-closure-order. Kind: lemma.

Cv⊂Xw iff v≤w, and Xw is the union of those cells, with equality checked fiberwise through the integral stratification.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Apply integral root-subgroup closure relations imported from layer9 and the Coxeter Bruhat order.

Acceptance: Cv⊂Xw iff v≤w, and Xw is the union of those cells, with equality checked fiberwise through the integral stratification.

Direct prerequisites: ShimuraData:D3/bruhat-integral; ShimuraData:D3/schubert-families; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For bruhat closure criterion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Opposite Schubert intersection criterion

Declaration: **TauCeti.Shimura.oppositeIntersection**. Node: ShimuraData:D3/opposite-intersection. Kind: lemma.

For the standard and opposite Schubert varieties over an algebraically closed field, X^w∩Xv is nonempty iff w≤v. The integral closure/emptiness statements needed for the inclusion must remain valid after every base change.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Import the opposite/standard Schubert incidence theorem including the base-change version; the BL03 I Lemma1 invoked by BP21 is not treated as an unread proof.

Acceptance: For the standard and opposite Schubert varieties over an algebraically closed field, X^w∩Xv is nonempty iff w≤v. The integral closure/emptiness statements needed for the inclusion must remain valid after every base change.

Direct prerequisites: ShimuraData:D3/schubert-families; ShimuraData:D3/bruhat-closure-order; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

Source evidence: [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), Lemma 3.1.2 proof, p.32; cited BL03 proof leaf not read. For opposite schubert intersection criterion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Opposite Schubert inclusion

Declaration: **TauCeti.Shimura.oppositeInsideUpper**. Node: ShimuraData:D3/opposite-inside-upper. Kind: theorem.

For every w∈^MW, X^w⊂Yw as a closed subscheme of the open Yw. This holds for the integral flag and its ℤp and 𝔽p fibers.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. If X^w meets Cv then it meets Xv, so v≥w. All excluded cells lie in its disjoint complement; the factorization through an open subscheme follows from the underlying containment. Use the integral incidence supplier to justify the statement over ℤ.

Acceptance: For every w∈^MW, X^w⊂Yw as a closed subscheme of the open Yw. This holds for the integral flag and its ℤp and 𝔽p fibers.

Direct prerequisites: ShimuraData:D3/opposite-intersection; ShimuraData:D3/bruhat-closure-order; ShimuraData:D3/schubert-families.

Source evidence: [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), Lemma 3.1.2, p.32. For opposite schubert inclusion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d4"></a>

## D4. Data, morphisms, and distinguished classes

Construct morphisms as rational algebraic group maps carrying the full source class into the full target class. Products retain the product group and all combinations of real components. Passage to an adjoint group is injective on the source class but its image can be a union of target components; a central isogeny need not be surjective on real points. A lifted S-map defines the corresponding source datum only after checking the adjoint axioms and rational factors. These distinctions prevent a false universal surjectivity assertion for the domain map.

A special pair is a rational torus subdatum with a closed immersion into G; its torus need not be split or maximal. A special point is existence of such a factorization. Under a morphism, use the algebraic **image** of the source torus to retain the closed-subtorus condition. The GL₂ CM/non-CM tests are comparison theorems rather than part of this definition.

Hodge type has an injective morphism into a positive-rank Siegel datum. Abelian type requires a central isogeny of derived groups from a Hodge-type datum, together with its compatible adjoint comparison. Hansen–Johansson's pre-abelian condition is formulated on the **connected adjoint datum** and has no derived-isogeny witness. The implications Hodge→abelian→pre-abelian forget specific witnesses; neither converse nor equality of predicates is asserted. In the point prototype the supplied adjoint object must encode that connected datum. Equality of entire real conjugacy classes is not imposed on the final pre-abelian definition.


Planets: Shimura datum; Product of Shimura data; Special point; Hodge type; Abelian type; Preabelian type.

### Shimura datum

Declaration: **TauCeti.Shimura.shimuraDatum**. Node: ShimuraData:D4/shimura-datum. Kind: definition.

A pure Shimura datum consists of a connected reductive ℚ-algebraic group G and a nonempty single full G(ℝ)-conjugacy class X of algebraic maps S→Gℝ. For every h∈X impose SV1: Ad∘h has only types (−1,1),(0,0),(1,−1); SV2: Int(h(i)) is Cartan on Gℝ^{ad}; SV3: the projection of h on each nontrivial ℚ-simple factor of G^{ad} is nontrivial. There is no chosen base h. Rational weight, center splitting, and Hodge type are separate predicates.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Bundle G and the invariant nonempty orbit with the three explicit predicates. Conjugation invariance makes checking one representative equivalent to checking all.

API:

- **TauCeti.Shimura.datumConjugate** (characterisation): All three axioms are stable under G(ℝ)-conjugation.
- **TauCeti.Shimura.datumNoBasepoint** (characterisation): Changing the witness h within the same full orbit gives the same datum.
- **TauCeti.Shimura.datumWeightCentral** (characterisation): h∘d factors through Z(G)ℝ and is independent of h; its inverse is the weight cocharacter.

Discriminating unit tests:

- **TauCeti.Shimura.tests.datumTorus** (computation): Any ℚ-torus T with an algebraic h:S→Tℝ gives a singleton datum. Rejects: Positive-dimensional domain or semisimple G required.
- **TauCeti.Shimura.tests.datumEmptyFalse** (non-example): An empty class cannot form a datum. Rejects: Nonemptiness omitted.
- **TauCeti.Shimura.tests.datumCompactRationalFalse** (non-example): A nontrivial compact ℚ-adjoint simple group with trivial h fails SV3 even if SV1–SV2 hold. Rejects: SV3 omitted or checked over ℝ instead of ℚ.

Uses:

- D3 homogeneous exports: The consumer uses shimura datum through these concrete interfaces: All three axioms are stable under G(ℝ)-conjugation. Changing the witness h within the same full orbit gives the same datum.
- D5 explicit data: The consumer uses shimura datum through these concrete interfaces: All three axioms are stable under G(ℝ)-conjugation. Changing the witness h within the same full orbit gives the same datum.
- ShimuraVarieties all stages: The consumer uses shimura datum through these concrete interfaces: All three axioms are stable under G(ℝ)-conjugation. Changing the witness h within the same full orbit gives the same datum.

Acceptance: A pure Shimura datum consists of a connected reductive ℚ-algebraic group G and a nonempty single full G(ℝ)-conjugacy class X of algebraic maps S→Gℝ. For every h∈X impose SV1: Ad∘h has only types (−1,1),(0,0),(1,−1); SV2: Int(h(i)) is Cartan on Gℝ^{ad}; SV3: the projection of h on each nontrivial ℚ-simple factor of G^{ad} is nontrivial. There is no chosen base h. Rational weight, center splitting, and Hodge type are separate predicates.

Direct prerequisites: ShimuraData:D1/hodge-decomposition-of-representation; ShimuraData:D2/cartan-adjoint-criterion; ReductiveGroupsPartII:RG2.0a; tauceti:TauCeti.ReductiveCommHopfAlgCat; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 2.1.1, p.265. For shimura datum, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.; [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 5.5, pp.54–55. For shimura datum, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Conjugation invariance of the axioms

Declaration: **TauCeti.Shimura.axiomsConjugation**. Node: ShimuraData:D4/axioms-conjugation. Kind: lemma.

SV1–SV3 for one algebraic h are equivalent to SV1–SV3 for any G(ℝ)-conjugate. Cartan compactness is transported by the real inner automorphism, and ℚ-simple factor triviality is preserved under real conjugation.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Conjugate the representation and twisted real form; project the conjugation equation to each normal rational factor.

Acceptance: SV1–SV3 for one algebraic h are equivalent to SV1–SV3 for any G(ℝ)-conjugate. Cartan compactness is transported by the real inner automorphism, and ℚ-simple factor triviality is preserved under real conjugation.

Direct prerequisites: ShimuraData:D4/shimura-datum; ShimuraData:D2/cartan-adjoint-criterion; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Remark 4.6(a), p.44; Definition 5.5, p.54. For conjugation invariance of the axioms, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Central weight of a datum

Declaration: **TauCeti.Shimura.weightCentral**. Node: ShimuraData:D4/weight-central. Kind: lemma.

Under SV1, the diagonal restriction h∘d takes values in Z(G)ℝ and is constant on X. Thus wX=h∘w is a well-defined central real cocharacter. Rationality of wX is equivalent to rationality of its inverse h∘d and is an additional condition.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Diagonal acts trivially on all adjoint types; the kernel of the adjoint representation is the center. Conjugation fixes central maps.

Acceptance: Under SV1, the diagonal restriction h∘d takes values in Z(G)ℝ and is constant on X. Thus wX=h∘w is a well-defined central real cocharacter. Rationality of wX is equivalent to rationality of its inverse h∘d and is an additional condition.

Direct prerequisites: ShimuraData:D4/shimura-datum; ShimuraData:D1/weight-norm-cocharacters; tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, p.56. For central weight of a datum, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Morphism of Shimura data

Declaration: **TauCeti.Shimura.datumMorphism**. Node: ShimuraData:D4/datum-morphism. Kind: definition.

A morphism (G,X)→(G′,X′) is a ℚ-algebraic group homomorphism f with fℝ∘h∈X′ for every h∈X. Its map on X is induced and is not extra arbitrary data; injectivity is not required.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Bundle the algebraic homomorphism and the orbit preservation equation. Algebraic maps, not just abstract real group maps, are used.

API:

- **TauCeti.Shimura.datumMorphismIdentity** (characterisation): The identity group homomorphism gives the identity datum morphism.
- **TauCeti.Shimura.datumMorphismComp** (characterisation): Composition is group-map composition and induces composition on X.
- **TauCeti.Shimura.datumMorphismHolomorphic** (characterisation): The induced map on X is holomorphic and respects Hodge filtrations, μ-classes and central weights.

Discriminating unit tests:

- **TauCeti.Shimura.tests.morphismProjection** (degenerate): A product projection is a datum morphism and can have nontrivial kernel. Rejects: Morphisms required injective.
- **TauCeti.Shimura.tests.morphismTorusNorm** (computation): A torus character is eligible exactly when its composite sends the chosen h to the target h. Rejects: All group maps automatically datum maps.
- **TauCeti.Shimura.tests.morphismNonAlgebraicFalse** (non-example): An abstract continuous homomorphism without an algebraic group map cannot be used as a datum morphism. Rejects: Algebraicity discarded.

Uses:

- ShimuraData:D4/datum-category: Category of Shimura data consumes morphism of shimura data: The identity group homomorphism gives the identity datum morphism.
- D3 homogeneous pullback: The consumer uses morphism of shimura data through these concrete interfaces: The identity group homomorphism gives the identity datum morphism. Composition is group-map composition and induces composition on X.
- ShimuraVarieties:V1 maps: The consumer uses morphism of shimura data through these concrete interfaces: The identity group homomorphism gives the identity datum morphism. Composition is group-map composition and induces composition on X.

Acceptance: A morphism (G,X)→(G′,X′) is a ℚ-algebraic group homomorphism f with fℝ∘h∈X′ for every h∈X. Its map on X is induced and is not extra arbitrary data; injectivity is not required.

Direct prerequisites: ShimuraData:D4/shimura-datum; ShimuraData:D0/datum-map-points.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 5.15(a), p.58. For morphism of shimura data, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Category of Shimura data

Declaration: **TauCeti.Shimura.datumCategory**. Node: ShimuraData:D4/datum-category. Kind: construction.

With these morphisms, Shimura data form a category whose forgetful functor to connected reductive ℚ-groups is faithful. The category includes torus data and data without rational weight.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Use algebraic-map identity and associativity; extensionality follows because the X-map is determined by f.

API:

- **TauCeti.Shimura.datumCategoryExt** (characterisation): Two morphisms with equal group maps are equal.
- **TauCeti.Shimura.datumCategoryForget** (characterisation): The forgetful functor preserves identities and composition.
- **TauCeti.Shimura.datumCategoryIso** (characterisation): An algebraic group isomorphism carrying X bijectively to X′ gives a datum isomorphism.

Discriminating unit tests:

- **TauCeti.Shimura.tests.categoryTorusIdentity** (computation): The identity of a torus datum induces identity on its singleton domain. Rejects: Positive dimension assumed.
- **TauCeti.Shimura.tests.categoryProductProjection** (compatibility): Composition of a product inclusion with its projection is identity on the corresponding datum. Rejects: X-map independent of group map.
- **TauCeti.Shimura.tests.categoryOrbitSame** (computation): Two orbit presentations from conjugate h give an isomorphism with identity group map. Rejects: Distinguished h retained.

Uses:

- ShimuraData:D4/product-datum: Product of Shimura data consumes category of shimura data: Two morphisms with equal group maps are equal.
- ShimuraData:D4/type-predicates: The consumer uses category of shimura data through these concrete interfaces: Two morphisms with equal group maps are equal. The forgetful functor preserves identities and composition.

Acceptance: With these morphisms, Shimura data form a category whose forgetful functor to connected reductive ℚ-groups is faithful. The category includes torus data and data without rational weight.

Direct prerequisites: ShimuraData:D4/datum-morphism.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 5.15(a), p.58. For category of shimura data, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Product of Shimura data

Declaration: **TauCeti.Shimura.productDatum**. Node: ShimuraData:D4/product-datum. Kind: construction.

The product of (G₁,X₁),(G₂,X₂) is (G₁×G₂,X₁×X₂), with full conjugation action, componentwise h, and all three axioms. It is the categorical product; rational weight holds exactly when it holds for both factors.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Adjoint types and Cartan twisted forms are direct products; rational simple factors come from one factor. Projections and pairings give the universal property.

API:

- **TauCeti.Shimura.productDomain** (characterisation): Its domain is X₁×X₂ and its tangent is the direct sum.
- **TauCeti.Shimura.productMaps** (characterisation): Projections and paired maps satisfy the categorical product equations.
- **TauCeti.Shimura.productReflex** (compatibility): Its reflex field is the compositum E₁E₂.

Discriminating unit tests:

- **TauCeti.Shimura.tests.productTorus** (computation): Product of two torus data is a singleton torus datum of dimension zero. Rejects: Group dimension substituted for domain dimension.
- **TauCeti.Shimura.tests.productGl2** (computation): Product of two GL₂ data has dimension two and four domain components. Rejects: Only positive component retained.
- **TauCeti.Shimura.tests.productUnit** (degenerate): Product with the trivial torus datum is isomorphic to the original datum. Rejects: Empty product excluded.

Uses:

- D5 product test: The consumer uses product of shimura data through these concrete interfaces: Its domain is X₁×X₂ and its tangent is the direct sum. Projections and paired maps satisfy the categorical product equations.
- ShimuraVarieties products: The consumer uses product of shimura data through these concrete interfaces: Its domain is X₁×X₂ and its tangent is the direct sum. Projections and paired maps satisfy the categorical product equations.

Acceptance: The product of (G₁,X₁),(G₂,X₂) is (G₁×G₂,X₁×X₂), with full conjugation action, componentwise h, and all three axioms. It is the categorical product; rational weight holds exactly when it holds for both factors.

Direct prerequisites: ShimuraData:D4/datum-category; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; ShimuraData:D4/axioms-conjugation.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Definition 5.5, pp.54–55. For product of shimura data, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Adjoint Shimura datum

Declaration: **TauCeti.Shimura.adjointDatum**. Node: ShimuraData:D4/adjoint-datum. Kind: construction.

For (G,X), construct (G^{ad},X^{ad}) using the full G^{ad}(ℝ)-conjugacy class containing the projections of X. The map X→X^{ad} is injective with image a union of components; it is not generally surjective. Central weights vanish in the adjoint datum.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Transport SV1–SV3 to the quotient. Distinct lifts with the same adjoint and abelian quotient differ by a map from connected S to a finite kernel, hence coincide.

API:

- **TauCeti.Shimura.adjointMorphism** (characterisation): The quotient G→G^{ad} is a datum morphism.
- **TauCeti.Shimura.adjointDomainInjective** (characterisation): X→X^{ad} is injective and its image is a union of components.
- **TauCeti.Shimura.adjointIdempotent** (characterisation): Applying adjoint passage twice gives the same datum up to canonical isomorphism.

Discriminating unit tests:

- **TauCeti.Shimura.tests.adjointTorus** (degenerate): The adjoint of a torus datum is the trivial datum. Rejects: Center retained in adjoint.
- **TauCeti.Shimura.tests.adjointGl2** (computation): The GL₂ adjoint datum is PGL₂ with its full upper/lower domain. Rejects: Derived SL₂ confused with adjoint.
- **TauCeti.Shimura.tests.adjointComponentCaveat** (non-example): For a group with nontrivial real central obstruction, the component injection need not be onto. Rejects: Real quotient map assumed surjective.

Uses:

- ShimuraData:D4/abelian-type: Abelian type consumes adjoint shimura datum: The quotient G→G^{ad} is a datum morphism.
- ShimuraData:D4/preabelian-type: Preabelian type consumes adjoint shimura datum: The quotient G→G^{ad} is a datum morphism.
- D2 effective domains: The consumer uses adjoint shimura datum through these concrete interfaces: The quotient G→G^{ad} is a datum morphism. X→X^{ad} is injective and its image is a union of components.

Acceptance: For (G,X), construct (G^{ad},X^{ad}) using the full G^{ad}(ℝ)-conjugacy class containing the projections of X. The map X→X^{ad} is injective with image a union of components; it is not generally surjective. Central weights vanish in the adjoint datum.

Direct prerequisites: ShimuraData:D4/shimura-datum; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; ShimuraData:D2/hermitian-domain-components.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 5.7(a) and Aside 5.10, pp.55–56. The projection of X is injective, with component image; the full adjoint orbit can be larger because of the real central obstruction. This node does not infer surjectivity.

### Central-isogeny change of datum

Declaration: **TauCeti.Shimura.centralIsogenyLift**. Node: ShimuraData:D4/central-isogeny-lift. Kind: theorem.

Let f:G₁→G₂ be a central isogeny over ℚ and (G₂,X₂) a datum. If some h₂∈X₂ has an algebraic lift h₁:S→G₁,ℝ, its full G₁(ℝ)-class X₁ is a datum; f is a datum morphism, with an isomorphism of adjoint data. Different lift classes can have different central weights. Lifting is a hypothesis.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Central isogeny identifies adjoint groups and their Lie algebras; the lift therefore satisfies all three axioms. Take its full orbit.

Acceptance: Let f:G₁→G₂ be a central isogeny over ℚ and (G₂,X₂) a datum. If some h₂∈X₂ has an algebraic lift h₁:S→G₁,ℝ, its full G₁(ℝ)-class X₁ is a datum; f is a datum morphism, with an isomorphism of adjoint data. Different lift classes can have different central weights. Lifting is a hypothesis.

Direct prerequisites: ShimuraData:D4/axioms-conjugation; ShimuraData:D4/adjoint-datum; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 5.5 and Proposition 5.7(a), pp.54–55; lifting is a separately stated hypothesis. The adjoint comparison and axioms reduce a given algebraic lift along a central isogeny to the target datum. Existence of a lift is an explicit hypothesis, not a result imported from an unread covering construction.

### Special pair

Declaration: **TauCeti.Shimura.specialPair**. Node: ShimuraData:D4/special-pair. Kind: definition.

A special pair in (G,X) consists of a ℚ-torus T and a closed algebraic immersion T→G, together with hT:S→Tℝ whose composite lies in X. It is a torus subdatum. T is not required to be maximal or split.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. A torus hT automatically satisfies the datum axioms, so the composite is a datum morphism with injective group map.

API:

- **TauCeti.Shimura.specialPairPoint** (characterisation): The composite gives a point of X.
- **TauCeti.Shimura.specialPairSubdatum** (characterisation): The pair defines a torus subdatum with singleton domain.
- **TauCeti.Shimura.specialPairEnlarge** (characterisation): Factoring through a larger ℚ-torus yields a special pair with the same point.

Discriminating unit tests:

- **TauCeti.Shimura.tests.specialPairTorusSelf** (computation): A torus datum is its own special pair. Rejects: T required proper.
- **TauCeti.Shimura.tests.specialPairCmElliptic** (computation): A CM elliptic point of the GL₂ domain factors through ResE/ℚGm. Rejects: Only split tori allowed.
- **TauCeti.Shimura.tests.specialPairTrivial** (degenerate): The trivial torus datum admits the trivial special pair. Rejects: Positive-dimensional torus imposed.

Uses:

- ShimuraData:D4/special-point: Special point consumes special pair: The composite gives a point of X.
- ShimuraVarieties:V4 canonical-model condition: The consumer uses special pair through these concrete interfaces: The composite gives a point of X. The pair defines a torus subdatum with singleton domain.

Acceptance: A special pair in (G,X) consists of a ℚ-torus T and a closed algebraic immersion T→G, together with hT:S→Tℝ whose composite lies in X. It is a torus subdatum. T is not required to be maximal or split.

Direct prerequisites: ShimuraData:D4/datum-morphism; tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 12.5 and footnote 69, p.113. The footnote fixes the rational torus requirement; the definition describes its factorization and does not require maximality.

### Special point

Declaration: **TauCeti.Shimura.specialPoint**. Node: ShimuraData:D4/special-point. Kind: definition.

A point h∈X is special iff h factors algebraically through a ℚ-torus in G. This is existence of a special pair, not a chosen torus or a CM moduli interpretation.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Take the existential image of the special-pair point map; replace a noninjective torus map by its torus image if needed.

API:

- **TauCeti.Shimura.specialPointFactor** (characterisation): The predicate is equivalent to existence of a ℚ-torus factorization.
- **TauCeti.Shimura.specialPointMap** (characterisation): Datum morphisms send special points to special points.
- **TauCeti.Shimura.specialPointTorus** (characterisation): Every point of a torus datum is special.

Discriminating unit tests:

- **TauCeti.Shimura.tests.specialTorusAll** (computation): The singleton point of every torus datum is special. Rejects: CM field presentation required.
- **TauCeti.Shimura.tests.specialGl2Cm** (computation): In GL₂, elliptic CM points are special. Rejects: Maximal torus split condition.
- **TauCeti.Shimura.tests.specialGl2NonCm** (non-example): A non-CM elliptic point is not special. Rejects: All h-images declared ℚ-tori without descent.

Uses:

- ShimuraVarieties:V4: The consumer uses special point through these concrete interfaces: The predicate is equivalent to existence of a ℚ-torus factorization. Datum morphisms send special points to special points.
- CM reciprocity consumers: The consumer uses special point through these concrete interfaces: The predicate is equivalent to existence of a ℚ-torus factorization. Datum morphisms send special points to special points.

Acceptance: A point h∈X is special iff h factors algebraically through a ℚ-torus in G. This is existence of a special pair, not a chosen torus or a CM moduli interpretation.

Direct prerequisites: ShimuraData:D4/special-pair.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Definition 12.5 and Example 12.7, p.113. This is the existence predicate, independent of a chosen torus. Example 12.7 supplies the GL₂ CM and non-CM discriminating cases.

### Preservation of special points

Declaration: **TauCeti.Shimura.specialImage**. Node: ShimuraData:D4/special-image. Kind: lemma.

For a datum morphism f, an algebraic torus factorization of h gives one for f∘h through the scheme-theoretic image of T. Thus specialness is preserved even when f has kernel.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. The image of a ℚ-torus is a ℚ-torus; factor the composite through it.

Acceptance: For a datum morphism f, an algebraic torus factorization of h gives one for f∘h through the scheme-theoretic image of T. Thus specialness is preserved even when f has kernel.

Direct prerequisites: ShimuraData:D4/special-point; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components; tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §12, Special points, p.113. For preservation of special points, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Hodge type

Declaration: **TauCeti.Shimura.hodgeType**. Node: ShimuraData:D4/hodge-type. Kind: definition.

A datum is Hodge type if it admits a closed immersion of data into a Siegel datum of a nondegenerate alternating rational space of dimension 2g, g≥1. Over ℚ a faithful injective algebraic group map is a closed immersion here. Existence of a rational weight or of an abstract real symplectic representation alone is insufficient.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Quantify over the symplectic space and algebraic closed immersion preserving the full domain.

API:

- **TauCeti.Shimura.hodgeTypeWitness** (compatibility): A witness includes both the closed group immersion and the X-preservation equation.
- **TauCeti.Shimura.hodgeTypeIsomorphism** (compatibility): Datum isomorphisms preserve Hodge type.
- **TauCeti.Shimura.hodgeTypeRationalWeight** (compatibility): A Hodge-type datum has rational central weight, by faithfulness of the Siegel embedding.

Discriminating unit tests:

- **TauCeti.Shimura.tests.hodgeTypeSiegel** (computation): Every Siegel datum is Hodge type. Rejects: Proper embedding required.
- **TauCeti.Shimura.tests.hodgeTypeGl2** (computation): The GL₂ datum is Hodge type via GSp₂=GL₂. Rejects: g≥2 imposed.
- **TauCeti.Shimura.tests.hodgeTypeHilbertStar** (computation): The scalar-determinant Hilbert G* datum is Hodge type through the trace embedding. Rejects: The embedding checked only over ℝ.

Uses:

- ShimuraVarieties:V6: The consumer uses hodge type through these concrete interfaces: A witness includes both the closed group immersion and the X-preservation equation. Datum isomorphisms preserve Hodge type.
- integral/perfectoid Hodge-type models: The consumer uses hodge type through these concrete interfaces: A witness includes both the closed group immersion and the X-preservation equation. Datum isomorphisms preserve Hodge type.

Acceptance: A datum is Hodge type if it admits a closed immersion of data into a Siegel datum of a nondegenerate alternating rational space of dimension 2g, g≥1. Over ℚ a faithful injective algebraic group map is a closed immersion here. Existence of a rational weight or of an abstract real symplectic representation alone is insufficient.

Direct prerequisites: ShimuraData:D4/datum-morphism; ShimuraData:D5/siegel-datum; tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary.

Source evidence: [Completed cohomology and preabelian type Shimura varieties](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.12799), §4.1, preceding Definition 4.1. For hodge type, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Abelian type

Declaration: **TauCeti.Shimura.abelianType**. Node: ShimuraData:D4/abelian-type. Kind: definition.

A datum (G,X) is abelian type if there is a Hodge-type (G₁,X₁) and a central isogeny G₁^{der}→G^{der} inducing an isomorphism of the connected adjoint data (G₁^{ad},X₁⁺)≅(G^{ad},X⁺). Existence of the choices of components is part of the witness. It is not an assumed isogeny of the whole reductive groups.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Quantify over the Hodge-type datum, derived central isogeny and compatible connected-adjoint domain identification.

API:

- **TauCeti.Shimura.hodgeTypeAbelian** (compatibility): Hodge type implies abelian type via the identity derived isogeny.
- **TauCeti.Shimura.abelianTypeIsomorphism** (characterisation): Datum isomorphisms preserve abelian type.
- **TauCeti.Shimura.abelianTypeCentral** (characterisation): Central changes preserving the derived isogeny class and connected adjoint datum preserve abelian type.

Discriminating unit tests:

- **TauCeti.Shimura.tests.abelianSiegel** (computation): The Siegel datum is abelian type. Rejects: Identity isogeny excluded.
- **TauCeti.Shimura.tests.abelianTorus** (degenerate): Every torus datum is abelian type: its derived group and connected adjoint domain are trivial. Rejects: Hodge type and abelian type identified.
- **TauCeti.Shimura.tests.abelianAdjointOnlyCaveat** (non-example): An adjoint-domain isomorphism alone is not an abelian-type witness; a derived central isogeny must also be supplied. Rejects: Preabelian witness substituted.

Uses:

- ShimuraVarieties:V6: The consumer uses abelian type through these concrete interfaces: Hodge type implies abelian type via the identity derived isogeny. Datum isomorphisms preserve abelian type.
- PerfectoidShimuraVarieties abelian-type reduction: The consumer uses abelian type through these concrete interfaces: Hodge type implies abelian type via the identity derived isogeny. Datum isomorphisms preserve abelian type.

Acceptance: A datum (G,X) is abelian type if there is a Hodge-type (G₁,X₁) and a central isogeny G₁^{der}→G^{der} inducing an isomorphism of the connected adjoint data (G₁^{ad},X₁⁺)≅(G^{ad},X⁺). Existence of the choices of components is part of the witness. It is not an assumed isogeny of the whole reductive groups.

Direct prerequisites: ShimuraData:D4/hodge-type; ShimuraData:D4/adjoint-datum; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Completed cohomology and preabelian type Shimura varieties](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.12799), §4.1, preceding Definition 4.1. For abelian type, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Preabelian type

Declaration: **TauCeti.Shimura.preabelianType**. Node: ShimuraData:D4/preabelian-type. Kind: definition.

A datum is preabelian type if its connected adjoint datum is isomorphic to the connected adjoint datum of a Hodge-type datum. This is Hansen–Johansson Definition 4.1; it requires no particular derived-group central isogeny and no full-X adjoint isomorphism.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Quantify over the Hodge-type witness and connected-adjoint datum isomorphism; descend the predicate from any chosen component.

API:

- **TauCeti.Shimura.abelianTypePreabelian** (characterisation): Abelian type implies preabelian type by forgetting the derived isogeny.
- **TauCeti.Shimura.preabelianTypeAdjoint** (characterisation): The predicate depends only on the connected adjoint datum.
- **TauCeti.Shimura.preabelianTypeIsomorphism** (characterisation): Isomorphic connected adjoint data have equivalent preabelian predicates.

Discriminating unit tests:

- **TauCeti.Shimura.tests.preabelianSiegel** (computation): The Siegel datum is preabelian type. Rejects: Identity adjoint witness excluded.
- **TauCeti.Shimura.tests.preabelianTorus** (computation): Every torus datum is preabelian type. Rejects: Center constrained by an adjoint predicate.
- **TauCeti.Shimura.tests.preabelianComponent** (non-example): Changing the full-X real orbit while retaining the same connected adjoint datum does not change the predicate. Rejects: Full-X equality imposed.

Uses:

- PerfectoidShimuraVarieties:PSV.0: The consumer uses preabelian type through these concrete interfaces: Abelian type implies preabelian type by forgetting the derived isogeny. The predicate depends only on the connected adjoint datum.
- Hansen–Johansson completed-cohomology route: The consumer uses preabelian type through these concrete interfaces: Abelian type implies preabelian type by forgetting the derived isogeny. The predicate depends only on the connected adjoint datum.

Acceptance: A datum is preabelian type if its connected adjoint datum is isomorphic to the connected adjoint datum of a Hodge-type datum. This is Hansen–Johansson Definition 4.1; it requires no particular derived-group central isogeny and no full-X adjoint isomorphism.

Direct prerequisites: ShimuraData:D4/hodge-type; ShimuraData:D4/adjoint-datum.

Source evidence: [Completed cohomology and preabelian type Shimura varieties](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.12799), Definition 4.1, §4.1. For preabelian type, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Hodge–abelian–preabelian implications

Declaration: **TauCeti.Shimura.typeImplications**. Node: ShimuraData:D4/type-implications. Kind: theorem.

For every pure datum, Hodge type implies abelian type, and abelian type implies preabelian type. These are implications between separately defined predicates; no reverse implication is asserted.

Hypotheses and conventions: G is connected reductive over ℚ; X is a nonempty full real algebraic S-map conjugacy class satisfying SV1–SV3. Morphisms are ℚ-algebraic group maps preserving X.

Proof or construction:

1. Use identity on the derived group for the first implication and discard the derived isogeny for the second.

Acceptance: For every pure datum, Hodge type implies abelian type, and abelian type implies preabelian type. These are implications between separately defined predicates; no reverse implication is asserted.

Direct prerequisites: ShimuraData:D4/hodge-type; ShimuraData:D4/abelian-type; ShimuraData:D4/preabelian-type.

Source evidence: [Completed cohomology and preabelian type Shimura varieties](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.12799), §4.1 and Definition 4.1. For hodge–abelian–preabelian implications, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5"></a>

## D5. Levels and explicit examples

Neatness requires the subgroup generated by **all** eigenvalues to be torsion-free, in one faithful representation and consequently in every representation. Merely excluding nontrivial torsion eigenvalues individually fails: the eigenvalues 2 and −1/2 are individually of infinite order but their product is −1. Rational neatness of a compact open K quantifies over every adelic conjugate rational intersection. The stronger BCGP adelic intersection condition and its prime-to-p variant are retained separately.

For a connected component X⁺ and finite adele a, Γ_{a,X⁺} consists of rational elements stabilizing X⁺ whose finite-adelic images lie in aKa⁻¹. Stabilization is expressed through the adjoint real component; it need not mean membership in the identity component of G(ℝ). Remove the **actual** action kernel before asserting effective freeness. That kernel can include infinitely many central rational units and compact-factor elements. Neatness cannot make the original action faithful. The conditional freeness theorem uses a discrete effective image and compact effective stabilizers; arithmeticity and its automatic discreteness are V0's downstream work.

Torus domains are points, including dimension zero. A CM type determines h by z at the chosen embeddings and z̄ at their conjugates; its datum reflex field is compared with the CM-type reflex field. GL₂ has X=ℍ⁺⊔ℍ⁻, dimension one, reflex field ℚ and compact dual ℙ¹. For g≥1 the Siegel datum has two components, dimension g(g+1)/2, reflex ℚ and Lagrangian compact dual. In standard coordinates ψ((x,y),(x′,y′))=x·y′−y·x′ and J(x,y)=(y,−x), ψ(u,Ju) is negative definite; −J gives the opposite sign. Either sign is included in the full GSp real orbit. The infinitesimal similitude equation is ψ(Au,v)+ψ(u,Av)=c(A)ψ(u,v), retaining the scalar term.

For a totally real field F of degree d, G=ResF/ℚ GL₂ has independently signed components, hence 2ᵈ components and dimension d. The determinant fiber product G*=Res GL₂×_{Res Gₘ}Gₘ forces a common scalar determinant, so its full domain has only the all-upper and all-lower components. Both data have reflex ℚ and compact dual ResF/ℚ ℙ¹. The trace pairing TrF/ℚ(x₁y₂−x₂y₁) is nondegenerate by separability; only G* has a rational common similitude factor. With the standard J it has negative ψ(u,Ju); negate the form for the positive convention. Unrestricted G does not land in rational GSp under this representation.

The all-genus Siegel combinatorics uses the imported symplectic root datum, the cyclic order g+1,…,2g,1,…,g, its Kostant representatives and the cumulative sequence w₁,…,w_g. At g=2 there are four sequences (0,0),(0,1),(1,1),(1,2). In CG coordinates a weight is t₁ᵃt₂ᵇνᶜ; conversion to the parity coordinates is (a,b;a+b+2c). Pilloni's lower-triangular Borel has compact simple root e₂−e₁ and ρ=(−2,−1;0). This is a different Borel from CG's upper-triangular one.

The genus-two compact centralizer is ℝ_{>0}K_{∞,1}, with K_{∞,1}≅U(2); a negative-similitude element can conjugate J to −J rather than centralize it. The compact Cartan's exponential kernel includes the additional coset through (π,π;πi), so its character lattice is a+b≡c mod 2. The explicit Cayley basis, its inverse, Hodge eigenlines and block action record the paper's convention. These are datum comparisons of the imported root theory.

At an absolutely unramified place of residue characteristic l>5, the Iw₁ characteristic polynomial reduces to (X−1)⁴. After shifting by 1, all four lower coefficients have valuation at least one. The ultrametric argument gives v(λ−1)≥1/4. The set of units satisfying this bound is a subgroup, so **integer products** of eigenvalues satisfy it as well. Every nontrivial torsion unit has v(ζ−1)≤1/(l−1)<1/4 (or valuation zero). This proves BCGP's neatness criterion for the generated subgroup, filling the omitted product step in the printed proof. The local field, extended normalized valuation, Iw₁ integral group and cyclotomic valuation are exact LF.0/RG2.3/RG2.5 inputs.

The principal GL₂ level test at N≥3 is elementary after the AA.3 rational lattice comparison: an integral M≡I mod N has determinant one; if its eigenvalues are roots of unity then its integer trace is in [−2,2], while det(I−M)=2−tr M is divisible by N². Thus both eigenvalues are one. Since they are inverses, the same argument excludes nontrivial torsion in their generated subgroup. At N=2, −I gives the discriminating counterexample.


Planets: Neat rational element; Torus Shimura datum; GL₂ Shimura datum; Siegel Shimura datum; Restriction-of-scalars Hilbert datum; Hilbert trace symplectic embedding.

### Neat rational element

Declaration: **TauCeti.Shimura.neat**. Node: ShimuraData:D5/neat. Kind: definition.

For γ in a ℚ-algebraic group G, choose a faithful finite-dimensional rational representation and let Λγ⊂ℂˣ be the subgroup generated by all its eigenvalues. γ is neat iff Λγ has no nontrivial torsion. A rational subgroup is neat iff every element is neat. Representation independence is a theorem, not an assumption in the definition.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Use the subgroup generated by the eigenvalues in an algebraic closure embedded in ℂ; state torsion as ∀u∈Λγ, ∀n≥1, uⁿ=1→u=1.

API:

- **TauCeti.Shimura.neatIdentity** (characterisation): Identity is neat; a nonidentity finite-order rational matrix is not neat.
- **TauCeti.Shimura.neatSubgroup** (characterisation): Subgroups and conjugates of neat rational subgroups are neat.
- **TauCeti.Shimura.neatRepresentation** (compatibility): Neatness computed in one faithful rational representation is equivalent to computation in every faithful rational representation.

Discriminating unit tests:

- **TauCeti.Shimura.tests.neatOne** (computation): The identity matrix is neat. Rejects: Identity eigenvalue excluded.
- **TauCeti.Shimura.tests.neatMinusOne** (non-example): The scalar −1 in GL₁(ℚ) is not neat. Rejects: Individual eigenvalue order ignored.
- **TauCeti.Shimura.tests.neatProductEigenvalues** (non-example): diag(2,−1/2) is not neat although neither eigenvalue is a root of unity. Rejects: Testing only eigenvalues individually.

Uses:

- ShimuraData:D5/neat-level: Neat compact open level consumes neat rational element: Identity is neat; a nonidentity finite-order rational matrix is not neat.
- ShimuraData:D5/effective-free: Freeness at neat level consumes neat rational element: Identity is neat; a nonidentity finite-order rational matrix is not neat.
- ShimuraVarieties:V0: The consumer uses neat rational element through these concrete interfaces: Identity is neat; a nonidentity finite-order rational matrix is not neat. Subgroups and conjugates of neat rational subgroups are neat.

Acceptance: For γ in a ℚ-algebraic group G, choose a faithful finite-dimensional rational representation and let Λγ⊂ℂˣ be the subgroup generated by all its eigenvalues. γ is neat iff Λγ has no nontrivial torsion. A rational subgroup is neat iff every element is neat. Representation independence is a theorem, not an assumption in the definition.

Direct prerequisites: tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules; mathlib:Subgroup.closure.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §3, p.34. For neat rational element, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Representation independence of neatness

Declaration: **TauCeti.Shimura.neatRepresentationIndependence**. Node: ShimuraData:D5/neat-representation-independence. Kind: theorem.

For a ℚ-algebraic group element γ and a faithful rational representation ρ, eigenvalues of any rational representation lie in the subgroup generated by eigenvalues of ρ(γ). Thus neatness is independent of the faithful representation; if γ is neat, its image under any algebraic homomorphism is neat.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Pass to the semisimple part and a diagonalizable closure. Use that every representation is a subquotient of sums of tensors of a faithful representation and its dual; weights then multiply and invert.

Acceptance: For a ℚ-algebraic group element γ and a faithful rational representation ρ, eigenvalues of any rational representation lie in the subgroup generated by eigenvalues of ρ(γ). Thus neatness is independent of the faithful representation; if γ is neat, its image under any algebraic homomorphism is neat.

Direct prerequisites: ShimuraData:D5/neat; tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules; tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §3, p.34. For representation independence of neatness, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Neat compact open level

Declaration: **TauCeti.Shimura.neatLevel**. Node: ShimuraData:D5/neat-level. Kind: definition.

For compact open K⊂G(𝔸f), call K rationally neat if G(ℚ)∩aKa⁻¹ is neat for every a∈G(𝔸f). This is the condition needed for Shimura component actions. Also retain the stronger adelic torsion-intersection notion below and prove it implies this one; do not identify the two by definition.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Quantify over adelic conjugates and the rational subgroup; compactness and openness use the supplier topology.

API:

- **TauCeti.Shimura.neatLevelConjugate** (characterisation): Conjugation by a finite adele preserves rational neatness.
- **TauCeti.Shimura.neatLevelShrink** (characterisation): A compact open subgroup of a rationally neat compact open is rationally neat.
- **TauCeti.Shimura.neatLevelGamma** (characterisation): Every component subgroup Γ_{a,X⁺} at a rationally neat level is neat.

Discriminating unit tests:

- **TauCeti.Shimura.tests.levelPrincipal** (computation): The GL₂ principal level N≥3 is rationally neat, using the separate congruence theorem supplier. Rejects: No congruence threshold.
- **TauCeti.Shimura.tests.levelFullGl2False** (non-example): GL₂(Ẑ) is not neat because it contains rational −I. Rejects: Compact open alone sufficient.
- **TauCeti.Shimura.tests.levelConjugate** (computation): An adelic conjugate of a neat level remains neat. Rejects: Only the un-conjugated rational intersection checked.

Uses:

- ShimuraData:D5/component-subgroup: Level subgroup of a component consumes neat compact open level: Conjugation by a finite adele preserves rational neatness.
- ShimuraVarieties:V0–V1: The consumer uses neat compact open level through these concrete interfaces: Conjugation by a finite adele preserves rational neatness. A compact open subgroup of a rationally neat compact open is rationally neat.

Acceptance: For compact open K⊂G(𝔸f), call K rationally neat if G(ℚ)∩aKa⁻¹ is neat for every a∈G(𝔸f). This is the condition needed for Shimura component actions. Also retain the stronger adelic torsion-intersection notion below and prove it implies this one; do not identify the two by definition.

Direct prerequisites: ShimuraData:D5/neat; AdelicAlgebraicGroups:AA.1; ShimuraData:D5/gl2-congruence-neat.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58. For neat compact open level, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Adelic torsion-intersection neatness

Declaration: **TauCeti.Shimura.adelicNeat**. Node: ShimuraData:D5/adelic-neat. Kind: definition.

Fix compatible embeddings ℚ̄→ℚ̄ℓ. For g∈G(𝔸f), let Λg,ℓ be the subgroup of ℚ̄ℓˣ generated by its local eigenvalues. g is adelically neat when the intersection over ℓ of the torsion subgroups ℚ̄ˣ∩Λg,ℓ is {1}; for prime-to-p adeles intersect only ℓ≠p. An adelic compact open is neat when every element is. Rationally conjugate elements and rational elements are compared explicitly.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Use eigenvalue-generated subgroups at all local places and transport only global torsion roots via the fixed embeddings. Non-torsion intersection is not required trivial.

API:

- **TauCeti.Shimura.adelicNeatRational** (characterisation): An adelically neat element coming from G(ℚ) is rationally neat.
- **TauCeti.Shimura.adelicNeatConjugate** (characterisation): Local/adelic conjugation preserves the eigenvalue torsion condition.
- **TauCeti.Shimura.primeToPNeatInsert** (characterisation): An adelically neat prime-to-p level remains adelically neat after inserting any compact open p-component.

Discriminating unit tests:

- **TauCeti.Shimura.tests.adelicIdentity** (computation): The identity adele is adelically neat. Rejects: Nontrivial untorsioned subgroup confused with torsion.
- **TauCeti.Shimura.tests.adelicRationalMinusOne** (computation): The rational scalar −1 is not adelically neat. Rejects: Intersection over places erased.
- **TauCeti.Shimura.tests.primeToPInsert** (computation): A prime-to-p level certified at v≠p stays neat for every p-level. Rejects: The certification place accidentally omitted.

Uses:

- PAPER-BOXER-CALEGARI-GEE-PILLONI-21 Definition3.2.1: The consumer uses adelic torsion-intersection neatness through these concrete interfaces: An adelically neat element coming from G(ℚ) is rationally neat. Local/adelic conjugation preserves the eigenvalue torsion condition.
- ShimuraData:D5/iw1-neat: The consumer uses adelic torsion-intersection neatness through these concrete interfaces: An adelically neat element coming from G(ℚ) is rationally neat. Local/adelic conjugation preserves the eigenvalue torsion condition.

Acceptance: Fix compatible embeddings ℚ̄→ℚ̄ℓ. For g∈G(𝔸f), let Λg,ℓ be the subgroup of ℚ̄ℓˣ generated by its local eigenvalues. g is adelically neat when the intersection over ℓ of the torsion subgroups ℚ̄ˣ∩Λg,ℓ is {1}; for prime-to-p adeles intersect only ℓ≠p. An adelic compact open is neat when every element is. Rationally conjugate elements and rational elements are compared explicitly.

Direct prerequisites: ShimuraData:D5/neat-representation-independence; AdelicAlgebraicGroups:AA.1.

Source evidence: [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Definition 3.2.1, pp.201–202. For adelic torsion-intersection neatness, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Level subgroup of a component

Declaration: **TauCeti.Shimura.componentSubgroup**. Node: ShimuraData:D5/component-subgroup. Kind: construction.

For h-component X⁺ and a∈G(𝔸f), let Γ_{a,X⁺}={γ∈G(ℚ):γX⁺=X⁺ and γf∈aKa⁻¹}. Here G(ℚ)₊ is the preimage of G^{ad}(ℝ)⁺, equivalently the stabilizer of X⁺, and need not be G(ℚ)∩G(ℝ)⁺. This stage constructs the subgroup and its action. V0 consumes this definition to prove arithmeticity; that later theorem is not used in the construction.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Intersect the rational pullback of the adelic conjugate with the component stabilizer. Use the adjoint-component theorem to identify G(ℚ)₊.

API:

- **TauCeti.Shimura.componentGammaMem** (characterisation): Membership is exactly component stabilization and the adelic conjugate-level condition.
- **TauCeti.Shimura.componentGammaShrink** (characterisation): K′⊆K induces Γ_{a,K′}⊆Γ_{a,K}.
- **TauCeti.Shimura.componentGammaRepresentative** (characterisation): Replacing a by qak, q∈G(ℚ)₊ and k∈K, conjugates Γ by q.

Discriminating unit tests:

- **TauCeti.Shimura.tests.gammaGl2** (computation): For GL₂, a=1 and principal level N, Γ consists of determinant-positive rational matrices integral everywhere and congruent to I modulo N. Rejects: Real determinant sign omitted.
- **TauCeti.Shimura.tests.gammaTorus** (degenerate): For a torus datum, Γ=T(ℚ)∩K and acts trivially on its point. Rejects: Neatness mistaken for faithfulness.
- **TauCeti.Shimura.tests.gammaConjugate** (computation): The subgroups at a and qak are conjugate by q. Rejects: Double-coset representative treated canonical.

Uses:

- ShimuraVarieties:V0 component decomposition: The consumer uses level subgroup of a component through these concrete interfaces: Membership is exactly component stabilization and the adelic conjugate-level condition. K′⊆K induces Γ_{a,K′}⊆Γ_{a,K}.
- ShimuraData:D5/effective-kernel: Kernel of the arithmetic domain action consumes level subgroup of a component: Membership is exactly component stabilization and the adelic conjugate-level condition.

Acceptance: For h-component X⁺ and a∈G(𝔸f), let Γ_{a,X⁺}={γ∈G(ℚ):γX⁺=X⁺ and γf∈aKa⁻¹}. Here G(ℚ)₊ is the preimage of G^{ad}(ℝ)⁺, equivalently the stabilizer of X⁺, and need not be G(ℚ)∩G(ℝ)⁺. This stage constructs the subgroup and its action. V0 consumes this definition to prove arithmeticity; that later theorem is not used in the construction.

Direct prerequisites: ShimuraData:D5/neat-level; ShimuraData:D4/datum-morphism; AdelicAlgebraicGroups:AA.1; ShimuraData:D4/adjoint-datum.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Lemma 5.11 and Proposition 5.12, pp.56–57. The arithmetic subgroup is intersected with the component stabilizer, defined via the adjoint real identity component. The plus subscript is not redefined as the identity component of G(R).

### Kernel of the arithmetic domain action

Declaration: **TauCeti.Shimura.effectiveKernel**. Node: ShimuraData:D5/effective-kernel. Kind: lemma.

For Γ=Γ_{a,X⁺}, its action factors through the quotient by ker(Γ→Aut_hol(X⁺)). This kernel contains Γ∩Z(G)(ℚ) and may be infinite, including totally real central units. Neatness does not make this action faithful. Compact real adjoint factors are also included in the effective-action kernel.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Define the actual action kernel and apply the group quotient universal property; compare with center and compact effective factors.

Acceptance: For Γ=Γ_{a,X⁺}, its action factors through the quotient by ker(Γ→Aut_hol(X⁺)). This kernel contains Γ∩Z(G)(ℚ) and may be infinite, including totally real central units. Neatness does not make this action faithful. Compact real adjoint factors are also included in the effective-action kernel.

Direct prerequisites: ShimuraData:D5/component-subgroup; ShimuraData:D2/hermitian-domain-components; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; ArithmeticLocallySymmetricSpaces:ALS.0.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 9, p.94; Aside 5.10, p.56. For kernel of the arithmetic domain action, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Freeness at neat level

Declaration: **TauCeti.Shimura.effectiveFree**. Node: ShimuraData:D5/effective-free. Kind: theorem.

If K is rationally neat and the image Γeff of its component subgroup in Aut_hol(X⁺) is discrete, then Γeff is torsion-free and acts freely and properly discontinuously, and Γ\X⁺=Γeff\X⁺. The original action need not be free when it has central kernel. Compactness of effective point stabilizers and proper symmetric-space action are imported from ALS.0. Arithmeticity and automatic discreteness for these component subgroups are proved downstream at V0, which consumes D5; they are not prerequisites of this conditional result.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly. The effective image is discrete. Work modulo the actual kernel, including all central and compact-factor kernels. General proper symmetric-space action is supplied by ALS.0.

Proof or construction:

1. Use representation independence to pass neatness to the faithful representation of the effective algebraic image. A finite-order element in this image has only torsion eigenvalues, hence is identity. Compact effective stabilizers meet a discrete subgroup finitely; a finite torsion-free stabilizer is trivial. Restrict the supplied proper symmetric-space action to the discrete effective subgroup. The two orbit equivalence relations agree after removing the kernel. No finite central-unit kernel is assumed.

Acceptance: If K is rationally neat and the image Γeff of its component subgroup in Aut_hol(X⁺) is discrete, then Γeff is torsion-free and acts freely and properly discontinuously, and Γ\X⁺=Γeff\X⁺. The original action need not be free when it has central kernel. Compactness of effective point stabilizers and proper symmetric-space action are imported from ALS.0. Arithmeticity and automatic discreteness for these component subgroups are proved downstream at V0, which consumes D5; they are not prerequisites of this conditional result.

Direct prerequisites: ShimuraData:D5/effective-kernel; ShimuraData:D5/neat-representation-independence; ShimuraData:D5/neat-level; ArithmeticLocallySymmetricSpaces:ALS.0.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 3.1, p.32; §5, pp.57–58. For freeness at neat level, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Torus Shimura datum

Declaration: **TauCeti.Shimura.torusDatum**. Node: ShimuraData:D5/torus-datum. Kind: construction.

For any ℚ-torus T and algebraic h:S→Tℝ, (T,{h}) is a Shimura datum with zero-dimensional singleton domain and compact dual. Its reflex field is the stabilizer field of μh, since torus conjugacy is trivial. No rational-weight hypothesis or CM field presentation is imposed.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Adjoint group is trivial, so all three axioms are vacuous; use the singleton conjugacy class.

API:

- **TauCeti.Shimura.torusDomain** (characterisation): X and X∨ are points; tangent and complex dimension are zero.
- **TauCeti.Shimura.torusReflex** (compatibility): Gal fixes the reflex field precisely when it fixes μh.
- **TauCeti.Shimura.torusMap** (characterisation): A torus algebraic homomorphism gives a datum morphism iff it sends h to the target h.

Discriminating unit tests:

- **TauCeti.Shimura.tests.torusTrivial** (computation): T=1 gives the unit datum with reflex field ℚ. Rejects: Nontrivial T required.
- **TauCeti.Shimura.tests.torusNorm** (computation): For T=Gm and h=Nm, the reflex field is ℚ and weight is t↦t⁻². Rejects: Weight inverse sign lost.
- **TauCeti.Shimura.tests.torusCm** (non-example): For T=ResE/ℚGm and CM type Φ, the reflex field need not be ℚ. Rejects: Torus reflex always rational.

Uses:

- ShimuraVarieties:V4: The consumer uses torus shimura datum through these concrete interfaces: X and X∨ are points; tangent and complex dimension are zero. Gal fixes the reflex field precisely when it fixes μh.
- CM reciprocity: The consumer uses torus shimura datum through these concrete interfaces: X and X∨ are points; tangent and complex dimension are zero. Gal fixes the reflex field precisely when it fixes μh.

Acceptance: For any ℚ-torus T and algebraic h:S→Tℝ, (T,{h}) is a Shimura datum with zero-dimensional singleton domain and compact dual. Its reflex field is the stabilizer field of μh, since torus conjugacy is trivial. No rational-weight hypothesis or CM field presentation is imposed.

Direct prerequisites: ShimuraData:D4/shimura-datum; ShimuraData:D3/reflex-field; ShimuraData:D3/compact-dual; tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 12.4(a), p.112. For torus shimura datum, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### CM-type torus datum

Declaration: **TauCeti.Shimura.cmTorus**. Node: ShimuraData:D5/cm-torus. Kind: construction.

For a CM field E and CM type Φ, take T=ResE/ℚGm and hΦ with coordinates z at Φ and z̄ at its conjugate embeddings. Its μ has exponent one at Φ and zero at Φ̄; E(T,hΦ) equals the CM-type reflex field supplied by CM.0. This stage supplies the datum, not the CM-type/reflex algebra or reciprocity theorem.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Apply restriction of scalars, compute split coordinates and compare the exact Galois stabilizers.

API:

- **TauCeti.Shimura.cmTorusMu** (characterisation): μΦ has weights 1 at Φ and 0 at Φ̄.
- **TauCeti.Shimura.cmTorusReflex** (compatibility): The datum reflex field equals the CM-type reflex field as subfields of ℚ̄.
- **TauCeti.Shimura.cmTorusSpecial** (characterisation): The image under any datum morphism is a special point.

Discriminating unit tests:

- **TauCeti.Shimura.tests.cmImaginaryQuadratic** (computation): For imaginary quadratic E and either CM type, the reflex field is E. Rejects: Always ℚ.
- **TauCeti.Shimura.tests.cmConjugateType** (computation): Conjugating Φ conjugates μ and its reflex embedding. Rejects: Embedding data discarded.
- **TauCeti.Shimura.tests.cmWeight** (computation): The weight map is the inverse scalar cocharacter on E. Rejects: Central restriction mislabeled weight.

Uses:

- ShimuraData:D4/special-pair: Special pair consumes cm-type torus datum: μΦ has weights 1 at Φ and 0 at Φ̄.
- ShimuraVarieties:V4–V5: The consumer uses cm-type torus datum through these concrete interfaces: μΦ has weights 1 at Φ and 0 at Φ̄. The datum reflex field equals the CM-type reflex field as subfields of ℚ̄.

Acceptance: For a CM field E and CM type Φ, take T=ResE/ℚGm and hΦ with coordinates z at Φ and z̄ at its conjugate embeddings. Its μ has exponent one at Φ and zero at Φ̄; E(T,hΦ) equals the CM-type reflex field supplied by CM.0. This stage supplies the datum, not the CM-type/reflex algebra or reciprocity theorem.

Direct prerequisites: ShimuraData:D5/torus-datum; ReductiveGroupsPartII:RG2.0a; ComplexMultiplicationAndExplicitReciprocity:CM.0.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 12.4(b), p.112. For cm-type torus datum, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### GL₂ Shimura datum

Declaration: **TauCeti.Shimura.gl2Datum**. Node: ShimuraData:D5/gl2-datum. Kind: construction.

For G=GL₂/ℚ, let h₀(a+ib)=[[a,b],[−b,a]] and X its full real conjugacy class. X identifies holomorphically and equivariantly with ℍ⁺⊔ℍ⁻, with h₀↦i and the GL₂ Möbius action. Its dimension is one, reflex field ℚ and compact dual ℙ¹. This identifies both components, rather than using the convention that conjugates negative-determinant matrices on ℍ⁺.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Check SV1 by Hom blocks, SV2 by −transpose inverse on PGL₂, SV3 by its nontrivial adjoint character. Identify the stabilizer of i, then compute μ-conjugacy and the line flag.

API:

- **TauCeti.Shimura.gl2Domain** (characterisation): The full domain is ℍ± and its positive component has dimension one.
- **TauCeti.Shimura.gl2ReflexDual** (compatibility): The reflex field is ℚ and the compact dual is ℙ¹.
- **TauCeti.Shimura.gl2Determinant** (characterisation): Determinant sends h₀(z) to Nm(z), giving a morphism to the norm torus datum.

Discriminating unit tests:

- **TauCeti.Shimura.tests.gl2AtI** (computation): The standard h₀ corresponds to i. Rejects: Opposite sign J used.
- **TauCeti.Shimura.tests.gl2Negative** (computation): diag(1,−1) sends i to −i in the second component. Rejects: Full real orbit replaced by ℍ⁺.
- **TauCeti.Shimura.tests.gl2RankOneSiegel** (compatibility): The datum agrees with the g=1 Siegel datum under GSp₂=GL₂. Rejects: Homology and cohomology convention diverges.

Uses:

- ModularCurvesPartII uniformization: The consumer uses gl₂ shimura datum through these concrete interfaces: The full domain is ℍ± and its positive component has dimension one. The reflex field is ℚ and the compact dual is ℙ¹.
- ShimuraVarieties:V8: The consumer uses gl₂ shimura datum through these concrete interfaces: The full domain is ℍ± and its positive component has dimension one. The reflex field is ℚ and the compact dual is ℙ¹.

Acceptance: For G=GL₂/ℚ, let h₀(a+ib)=[[a,b],[−b,a]] and X its full real conjugacy class. X identifies holomorphically and equivariantly with ℍ⁺⊔ℍ⁻, with h₀↦i and the GL₂ Möbius action. Its dimension is one, reflex field ℚ and compact dual ℙ¹. This identifies both components, rather than using the convention that conjugates negative-determinant matrices on ℍ⁺.

Direct prerequisites: ShimuraData:D4/shimura-datum; ShimuraData:D1/adjoint-gl2-object; ShimuraData:D2/hermitian-domain-components; ShimuraData:D3/borel-embedding; ShimuraData:D3/reflex-field; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.6, p.55. For gl₂ shimura datum, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### GL₂ Hodge and weight checks

Declaration: **TauCeti.Shimura.gl2Types**. Node: ShimuraData:D5/gl2-types. Kind: lemma.

The standard GL₂ datum has homology weight −1, central restriction h∘d(t)=tI₂, weight wX(t)=t⁻¹I₂, and μ-conjugacy weights {1,0}. Its adjoint types have dimensions 1,2,1 including the center.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Apply the sign dictionary to the two eigenlines of h₀(i).

Acceptance: The standard GL₂ datum has homology weight −1, central restriction h∘d(t)=tI₂, weight wX(t)=t⁻¹I₂, and μ-conjugacy weights {1,0}. Its adjoint types have dimensions 1,2,1 including the center.

Direct prerequisites: ShimuraData:D5/gl2-datum; ShimuraData:D1/adjoint-gl2-object; ShimuraData:D4/weight-central.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.6, p.55; §6, p.69. For gl₂ hodge and weight checks, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Siegel Shimura datum

Declaration: **TauCeti.Shimura.siegelDatum**. Node: ShimuraData:D5/siegel-datum. Kind: construction.

For g≥1 and a rational symplectic space (V,ψ) of dimension 2g, use the supplied reductive GSp(V,ψ). Let X be all ψ-compatible real complex structures J such that ψ(u,Ju) is either positive definite or negative definite, with hJ(a+ib)=a id+bJ. The full GSp(ℝ)-orbit is X=X⁺⊔X⁻. It is a Shimura datum of dimension g(g+1)/2, reflex field ℚ, with Lagrangian compact dual. No genus-zero two-component claim is made.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Use symplectic bases and compatible positive complex structures for transitivity. Restrict the End decomposition to gsp; retain its scalar center. Cartan follows from ψ(u,Ju) positivity on the derived group. Simplicity of the Sp root system gives SV3.

API:

- **TauCeti.Shimura.siegelSimilitude** (characterisation): ν(hJ(z))=z z̄ and its central weight is t↦t⁻¹id.
- **TauCeti.Shimura.siegelGeometry** (characterisation): The positive component is Siegel upper half-space; dim X=g(g+1)/2 and X∨ is the Lagrangian Grassmannian.
- **TauCeti.Shimura.siegelReflex** (compatibility): The reflex field is ℚ and μ has g weights 1 and g weights 0.

Discriminating unit tests:

- **TauCeti.Shimura.tests.siegelGenusOne** (degenerate): At g=1 this is GL₂ with ℍ± and compact dual ℙ¹. Rejects: Only higher genus supported.
- **TauCeti.Shimura.tests.siegelGenusTwo** (computation): At g=2 the dimension is 3 and the compact dual is LG(2,4). Rejects: Full flag dimension 4 used.
- **TauCeti.Shimura.tests.siegelBothSigns** (computation): J and −J are in different connected components of the full domain. Rejects: Only positive polarization allowed in X.

Uses:

- ShimuraData:D4/hodge-type: Hodge type consumes siegel shimura datum: ν(hJ(z))=z z̄ and its central weight is t↦t⁻¹id.
- ShimuraData:D5/hilbert-trace-embedding: Hilbert trace symplectic embedding consumes siegel shimura datum: ν(hJ(z))=z z̄ and its central weight is t↦t⁻¹id.
- PELModuli and integral/perfectoid models: The consumer uses siegel shimura datum through these concrete interfaces: ν(hJ(z))=z z̄ and its central weight is t↦t⁻¹id. The positive component is Siegel upper half-space; dim X=g(g+1)/2 and X∨ is the Lagrangian Grassmannian.

Acceptance: For g≥1 and a rational symplectic space (V,ψ) of dimension 2g, use the supplied reductive GSp(V,ψ). Let X be all ψ-compatible real complex structures J such that ψ(u,Ju) is either positive definite or negative definite, with hJ(a+ib)=a id+bJ. The full GSp(ℝ)-orbit is X=X⁺⊔X⁻. It is a Shimura datum of dimension g(g+1)/2, reflex field ℚ, with Lagrangian compact dual. No genus-zero two-component claim is made.

Direct prerequisites: ShimuraData:D4/shimura-datum; ShimuraData:D1/tensor-comparison; ShimuraData:D1/dual-comparison; ShimuraData:D2/hermitian-domain-components; ShimuraData:D3/compact-dual; ShimuraData:D3/reflex-field; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §6, pp.67–69. For siegel shimura datum, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E12, ShimuraData/E14.

### Siegel adjoint Hodge types

Declaration: **TauCeti.Shimura.siegelLieTypes**. Node: ShimuraData:D5/siegel-lie-types. Kind: lemma.

For gsp(V), the infinitesimal condition is ψ(Au,v)+ψ(u,Av)=c(A)ψ(u,v), not zero. Its adjoint Hodge types are (−1,1),(0,0),(1,−1), with dimensions g(g+1)/2, g²+1, g(g+1)/2. The derived sp has middle dimension g².

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Differentiate the similitude equation and write the blocks relative to the two isotropic eigenspaces; off-diagonal blocks are symmetric. The scalar center adds one to the middle dimension.

Acceptance: For gsp(V), the infinitesimal condition is ψ(Au,v)+ψ(u,Av)=c(A)ψ(u,v), not zero. Its adjoint Hodge types are (−1,1),(0,0),(1,−1), with dimensions g(g+1)/2, g²+1, g(g+1)/2. The derived sp has middle dimension g².

Direct prerequisites: ShimuraData:D5/siegel-datum; ShimuraData:D1/tensor-comparison; ShimuraData:D1/dual-comparison; tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §6, SV1 verification, p.69. For siegel adjoint hodge types, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E13.

### Siegel reflex and compact dual

Declaration: **TauCeti.Shimura.siegelReflexDual**. Node: ShimuraData:D5/siegel-reflex-dual. Kind: lemma.

The Siegel μ class is represented by diag(zI_g,I_g) over ℚ in a symplectic basis. Its class stabilizer is all Gal(ℚ̄/ℚ). The filtration stabilizer is a Siegel parabolic, so X∨=LG(g,2g) over ℚ; dim LG=g(g+1)/2.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly. Galois acts on the geometric cocharacter conjugacy class in ℚ̄. The field is the fixed field of its open stabilizer; no rational representative or parabolic point is assumed.

Proof or construction:

1. Compute the μ weights and identify the parabolic with the stabilizer of a Lagrangian; use its tangent space of symmetric bilinear forms.

Acceptance: The Siegel μ class is represented by diag(zI_g,I_g) over ℚ in a symplectic basis. Its class stabilizer is all Gal(ℚ̄/ℚ). The filtration stabilizer is a Siegel parabolic, so X∨=LG(g,2g) over ℚ; dim LG=g(g+1)/2.

Direct prerequisites: ShimuraData:D5/siegel-datum; ShimuraData:D3/reflex-field; ShimuraData:D3/reflex-flag-descent; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §6, pp.68–69; §12, pp.111–112. For siegel reflex and compact dual, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Restriction-of-scalars Hilbert datum

Declaration: **TauCeti.Shimura.hilbertDatum**. Node: ShimuraData:D5/hilbert-datum. Kind: construction.

For totally real F/ℚ of degree d, let G=ResF/ℚGL₂ and h have the standard GL₂ map at every real embedding. Its full real class is the product of ℍ± across embeddings, with 2ᵈ components and dimension d. Its reflex field is ℚ, compact dual ResF/ℚℙ¹, and weight is inverse scalar at every embedding. The determinant maps to ResF/ℚGm with diagonal norm h.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly. F/ℚ is a totally real number field of degree d≥1. The trace embedding uses the common scalar determinant subgroup G*, not unrestricted ResF/ℚ GL₂.

Proof or construction:

1. Check the axioms factorwise over ℝ and SV3 on the rational restriction-of-scalars adjoint group. μ is the same {1,0} cocharacter at every embedding, making its class Galois invariant.

API:

- **TauCeti.Shimura.hilbertDomain** (characterisation): X=(ℍ±)^Hom(F,ℝ), dim=d and number of components=2ᵈ.
- **TauCeti.Shimura.hilbertReflexDual** (compatibility): Reflex=ℚ and compact dual is ResF/ℚℙ¹.
- **TauCeti.Shimura.hilbertDeterminantMap** (characterisation): The determinant is a datum morphism to the restriction-of-scalars norm torus.

Discriminating unit tests:

- **TauCeti.Shimura.tests.hilbertRational** (compatibility): For F=ℚ this recovers the GL₂ datum. Rejects: Restriction field degree ignored.
- **TauCeti.Shimura.tests.hilbertQuadratic** (computation): For real quadratic F the full domain has dimension two and four components. Rejects: All signs forced equal for general G.
- **TauCeti.Shimura.tests.hilbertNonHodge** (non-example): For d>1 the standard trace representation of G does not land in rational GSp; determinants at real embeddings can differ. Rejects: General G confused with G*.

Uses:

- HilbertModularVarietiesAndShimuraCurves:H1: The consumer uses restriction-of-scalars hilbert datum through these concrete interfaces: X=(ℍ±)^Hom(F,ℝ), dim=d and number of components=2ᵈ. Reflex=ℚ and compact dual is ResF/ℚℙ¹.
- PELModuli:M5 boundary accepted RS-23: The consumer uses restriction-of-scalars hilbert datum through these concrete interfaces: X=(ℍ±)^Hom(F,ℝ), dim=d and number of components=2ᵈ. Reflex=ℚ and compact dual is ResF/ℚℙ¹.

Acceptance: For totally real F/ℚ of degree d, let G=ResF/ℚGL₂ and h have the standard GL₂ map at every real embedding. Its full real class is the product of ℍ± across embeddings, with 2ᵈ components and dimension d. Its reflex field is ℚ, compact dual ResF/ℚℙ¹, and weight is inverse scalar at every embedding. The determinant maps to ResF/ℚGm with diagonal norm h.

Direct prerequisites: ShimuraData:D0/hilbert-real-points; ShimuraData:D5/gl2-datum; ShimuraData:D4/shimura-datum; ShimuraData:D3/reflex-field; ShimuraData:D3/reflex-flag-descent; ReductiveGroupsPartII:RG2.0a.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64, split quaternion case B=M₂(F). All real places are noncompact in this specialization, giving independently signed GL₂ components. The standard cocharacter at every embedding makes the entire class Galois invariant.

### Scalar-determinant Hilbert datum

Declaration: **TauCeti.Shimura.hilbertStarDatum**. Node: ShimuraData:D5/hilbert-star-datum. Kind: construction.

Let G*=ResF/ℚGL₂ ×_{ResF/ℚGm} Gm via determinant and the scalar diagonal. With the same h, its full domain consists of the all-upper and all-lower products, so it has two components and dimension d. Its reflex field is ℚ, compact dual ResF/ℚℙ¹, and inclusion G*→G is a datum morphism whose domain image is those two components.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly. F/ℚ is a totally real number field of degree d≥1. The trace embedding uses the common scalar determinant subgroup G*, not unrestricted ResF/ℚ GL₂.

Proof or construction:

1. Use the determinant fiber product. A common negative determinant changes all signs simultaneously; determinant-one factors act transitively within each same-sign component. The derived group is ResSL₂, so the adjoint axioms agree.

API:

- **TauCeti.Shimura.hilbertStarPoints** (characterisation): Its points have a common scalar determinant.
- **TauCeti.Shimura.hilbertStarDomain** (characterisation): Its full domain has two same-sign components and dimension d.
- **TauCeti.Shimura.hilbertStarInclusion** (characterisation): The inclusion into the general Hilbert datum is a morphism identifying its domain with two components.

Discriminating unit tests:

- **TauCeti.Shimura.tests.starRational** (degenerate): At F=ℚ, G*=G=GL₂. Rejects: Artificial smaller group in degree one.
- **TauCeti.Shimura.tests.starQuadratic** (computation): For real quadratic F, G* has two components whereas G has four. Rejects: Both Hilbert domains identified.
- **TauCeti.Shimura.tests.starMixedSignFalse** (non-example): A real tuple with determinants of opposite signs does not lie in G*. Rejects: Scalar determinant constraint forgotten.

Uses:

- ShimuraData:D5/hilbert-trace-embedding: Hilbert trace symplectic embedding consumes scalar-determinant hilbert datum: Its points have a common scalar determinant.
- PELModuli:M5: The consumer uses scalar-determinant hilbert datum through these concrete interfaces: Its points have a common scalar determinant. Its full domain has two same-sign components and dimension d.
- HilbertModularVarietiesAndShimuraCurves:H1: The consumer uses scalar-determinant hilbert datum through these concrete interfaces: Its points have a common scalar determinant. Its full domain has two same-sign components and dimension d.

Acceptance: Let G*=ResF/ℚGL₂ ×_{ResF/ℚGm} Gm via determinant and the scalar diagonal. With the same h, its full domain consists of the all-upper and all-lower products, so it has two components and dimension d. Its reflex field is ℚ, compact dual ResF/ℚℙ¹, and inclusion G*→G is a datum morphism whose domain image is those two components.

Direct prerequisites: ShimuraData:D5/hilbert-datum; ShimuraData:D0/hilbert-real-points; tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups; ShimuraData:D4/datum-morphism.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §6 pp.68–69 and PEL type C discussion §9 pp.94–95. This specializes the scalar-similitude condition to F² and trace polarization. The determinant fiber product, common sign, and real-component computation are derived here using RG2.0a; it is distinct from full Res GL₂.

### Hilbert trace symplectic form

Declaration: **TauCeti.Shimura.hilbertTraceForm**. Node: ShimuraData:D5/hilbert-trace-form. Kind: lemma.

On V=F² viewed over ℚ, ψ((x₁,x₂),(y₁,y₂))=TrF/ℚ(x₁y₂−x₂y₁) is nondegenerate alternating. More generally multiplying the alternating F-form by a totally positive c∈F gives the same definite sign at every embedding for the standard h. With h(i)(x,y)=(y,−x), ψ(u,h(i)u)<0; negate ψ to use the positive ψ(u,Ju) convention.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly. F/ℚ is a totally real number field of degree d≥1. The trace embedding uses the common scalar determinant subgroup G*, not unrestricted ResF/ℚ GL₂.

Proof or construction:

1. Use nondegeneracy of the separable trace pairing; the real decomposition is the sum of the standard alternating forms with coefficients σ(c)>0.

Acceptance: On V=F² viewed over ℚ, ψ((x₁,x₂),(y₁,y₂))=TrF/ℚ(x₁y₂−x₂y₁) is nondegenerate alternating. More generally multiplying the alternating F-form by a totally positive c∈F gives the same definite sign at every embedding for the standard h. With h(i)(x,y)=(y,−x), ψ(u,h(i)u)<0; negate ψ to use the positive ψ(u,Ju) convention.

Direct prerequisites: ShimuraData:D5/hilbert-star-datum; ReductiveGroupsPartII:RG2.0a; mathlib:Algebra.trace.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Complements A, Lemmas A.5–A.6, p.155. The trace-form nondegeneracy argument applies to the alternating F-form on F². Separability and total reality are stated explicitly; the standard J has a negative ψ(u,Ju), and −ψ has the positive normalization.

### Hilbert trace symplectic embedding

Declaration: **TauCeti.Shimura.hilbertTraceEmbedding**. Node: ShimuraData:D5/hilbert-trace-embedding. Kind: construction.

The standard action of G* on F² with the trace form gives a closed ℚ-algebraic immersion G*→GSp₂d with similitude the common scalar determinant. It sends the two same-sign Hilbert components into the two Siegel components, hence is a datum morphism. This construction applies to G*, not to arbitrary ResGL₂.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly. F/ℚ is a totally real number field of degree d≥1. The trace embedding uses the common scalar determinant subgroup G*, not unrestricted ResF/ℚ GL₂.

Proof or construction:

1. The determinant identity over F becomes a rational similitude identity exactly when det is scalar. Faithfulness of the regular F-action gives a closed immersion; positivity is the sum of positive embedding contributions.

API:

- **TauCeti.Shimura.traceEmbeddingSimilitude** (characterisation): The rational similitude equals the common scalar determinant.
- **TauCeti.Shimura.traceEmbeddingHodge** (compatibility): The standard h is mapped to the Siegel h on the real direct sum.
- **TauCeti.Shimura.traceEmbeddingClosed** (characterisation): The rational representation is faithful and is a closed algebraic group immersion.

Discriminating unit tests:

- **TauCeti.Shimura.tests.traceRational** (compatibility): For F=ℚ the map is the identity GL₂=GSp₂. Rejects: Wrong similitude normalization.
- **TauCeti.Shimura.tests.traceQuadratic** (computation): For real quadratic F, the image gives a dimension-two Hodge-type subdomain of genus-two Siegel space. Rejects: Dimensions equal to ambient three.
- **TauCeti.Shimura.tests.traceNonscalarFalse** (non-example): An F-matrix with nonscalar determinant fails the rational scalar-similitude equation for the trace form. Rejects: General Hilbert G mapped into GSp.

Uses:

- ShimuraData:D4/hodge-type: Hodge type consumes hilbert trace symplectic embedding: The rational similitude equals the common scalar determinant.
- PELModuli:M5: The consumer uses hilbert trace symplectic embedding through these concrete interfaces: The rational similitude equals the common scalar determinant. The standard h is mapped to the Siegel h on the real direct sum.
- HilbertSiegelModularForms: The consumer uses hilbert trace symplectic embedding through these concrete interfaces: The rational similitude equals the common scalar determinant. The standard h is mapped to the Siegel h on the real direct sum.

Acceptance: The standard action of G* on F² with the trace form gives a closed ℚ-algebraic immersion G*→GSp₂d with similitude the common scalar determinant. It sends the two same-sign Hilbert components into the two Siegel components, hence is a datum morphism. This construction applies to G*, not to arbitrary ResGL₂.

Direct prerequisites: ShimuraData:D5/hilbert-trace-form; ShimuraData:D5/siegel-datum; ShimuraData:D5/hilbert-star-datum; tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Complements A, Lemmas A.5–A.6, p.155; §6, pp.68–69. For hilbert trace symplectic embedding, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Siegel Borel and dominant cones

Declaration: **TauCeti.Shimura.siegelRootConvention**. Node: ShimuraData:D5/siegel-root-convention. Kind: lemma.

Use the RG2.5 symplectic root datum. In BP coordinates κ=(k₁,…,k_g;k), Σk_i≡k mod 2, and the Borel inside the opposite Siegel parabolic is upper triangular on each diagonal block. Its compact roots are e_i−e_j (i<j), and its noncompact roots are −e_i−e_j (i≤j). Thus ρ_i=−i, ρ_nc,i=−(g+1)/2, both with central coordinate zero; G-dominance is 0≥k₁≥⋯≥k_g and M-dominance k₁≥⋯≥k_g. These are not the CG upper-triangular full-Borel signs.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Subtract the compact positive roots from the full positive system; count occurrences of each e_i in the two sums and pair with simple coroots.

Acceptance: Use the RG2.5 symplectic root datum. In BP coordinates κ=(k₁,…,k_g;k), Σk_i≡k mod 2, and the Borel inside the opposite Siegel parabolic is upper triangular on each diagonal block. Its compact roots are e_i−e_j (i<j), and its noncompact roots are −e_i−e_j (i≤j). Thus ρ_i=−i, ρ_nc,i=−(g+1)/2, both with central coordinate zero; G-dominance is 0≥k₁≥⋯≥k_g and M-dominance k₁≥⋯≥k_g. These are not the CG upper-triangular full-Borel signs.

Direct prerequisites: ReductiveGroupsPartII:RG2.5; ShimuraData:D5/siegel-datum; ShimuraData:D3/filtration-parabolic.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, pp.33–34. For siegel borel and dominant cones, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Siegel Weyl permutation comparison

Declaration: **TauCeti.Shimura.siegelWeylPermutations**. Node: ShimuraData:D5/siegel-weyl-permutations. Kind: lemma.

For g≥1 the supplier Weyl group identifies with permutations of {1,…,2g} commuting with i↦2g+1−i. The Siegel Levi subgroup preserves {1,…,g}. Minimal left-coset representatives satisfy w⁻¹(g+1)≺⋯≺w⁻¹(2g), for the cyclic order g+1≺⋯≺2g≺1≺⋯≺g, not the usual numeric order. There are 2^g such representatives.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Translate the positive Levi roots using the cyclic order determined by this Borel, then choose one element from each reflected pair for the inverse image of the last half. Their cyclic order determines a unique representative.

Acceptance: For g≥1 the supplier Weyl group identifies with permutations of {1,…,2g} commuting with i↦2g+1−i. The Siegel Levi subgroup preserves {1,…,g}. Minimal left-coset representatives satisfy w⁻¹(g+1)≺⋯≺w⁻¹(2g), for the cyclic order g+1≺⋯≺2g≺1≺⋯≺g, not the usual numeric order. There are 2^g such representatives.

Direct prerequisites: ShimuraData:D5/siegel-root-convention; ShimuraData:D3/kostant-representatives; ShimuraData:D3/kostant-cone-criterion; ReductiveGroupsPartII:RG2.5.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34 (corrected E53). For siegel weyl permutation comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E3.

### Siegel Kostant sequence

Declaration: **TauCeti.Shimura.kostantSequence**. Node: ShimuraData:D5/kostant-sequence. Kind: definition.

For w∈^MW set a₀=0 and a_i=#{j≤i:g+j∈w⁻¹{g+1,…,2g}}. Thus a_i−a_{i−1}∈{0,1}. The increment subset determines w using the cyclic order. This sequence is unrelated to the names of Weyl elements w₀,w₁,… used in CG.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use finite cardinalities of initial segments of the selected subset.

API:

- **TauCeti.Shimura.kostantSequenceZero** (characterisation): a₀=0.
- **TauCeti.Shimura.kostantSequenceStep** (characterisation): The increment at i is the indicator of g+i∈w⁻¹{g+1,…,2g}.
- **TauCeti.Shimura.kostantSequenceInjective** (characterisation): The sequence determines w uniquely among minimal left representatives.

Discriminating unit tests:

- **TauCeti.Shimura.tests.sequenceGenusOne** (degenerate): For g=1 the two sequences are (0,0) and (0,1). Rejects: A single representative or reversed range.
- **TauCeti.Shimura.tests.sequenceGenusTwo** (computation): For g=2 the four sequences are (0,0,0),(0,0,1),(0,1,1),(0,1,2). Rejects: Arbitrary monotone integer sequences accepted.
- **TauCeti.Shimura.tests.sequenceStepFalse** (non-example): (0,0,2) cannot occur. Rejects: Increments larger than one permitted.

Uses:

- ShimuraData:D5/kostant-sequence-geometry: Intersection meaning of Kostant sequences consumes siegel kostant sequence: a₀=0.
- HigherHidaAndColemanTheory: support conditions: The consumer uses siegel kostant sequence through these concrete interfaces: a₀=0. The increment at i is the indicator of g+i∈w⁻¹{g+1,…,2g}.

Acceptance: For w∈^MW set a₀=0 and a_i=#{j≤i:g+j∈w⁻¹{g+1,…,2g}}. Thus a_i−a_{i−1}∈{0,1}. The increment subset determines w using the cyclic order. This sequence is unrelated to the names of Weyl elements w₀,w₁,… used in CG.

Direct prerequisites: ShimuraData:D5/siegel-weyl-permutations.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For siegel kostant sequence, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Intersection meaning of Kostant sequences

Declaration: **TauCeti.Shimura.kostantSequenceGeometry**. Node: ShimuraData:D5/kostant-sequence-geometry. Kind: theorem.

For x∈C_w⊂P\G over any field, let L_x=x⁻¹⟨e_{g+1},…,e_{2g}⟩. Then a_i(w)=dim(L_x∩⟨e_{g+1},…,e_{g+i}⟩). The equality is invariant under the parabolic representative and constant on the Bruhat cell.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Check at the Weyl representative by counting basis indices; right B multiplication preserves the reference partial flag. Left P multiplication preserves its stabilized Lagrangian.

Acceptance: For x∈C_w⊂P\G over any field, let L_x=x⁻¹⟨e_{g+1},…,e_{2g}⟩. Then a_i(w)=dim(L_x∩⟨e_{g+1},…,e_{g+i}⟩). The equality is invariant under the parabolic representative and constant on the Bruhat cell.

Direct prerequisites: ShimuraData:D5/kostant-sequence; ShimuraData:D3/bruhat-integral; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

Source evidence: [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For intersection meaning of kostant sequences, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Genus-two CG coordinate comparison

Declaration: **TauCeti.Shimura.gsp4CgRoots**. Node: ShimuraData:D5/gsp4-cg-roots. Kind: lemma.

In CG upper-triangular coordinates χ=(a,b;c), χ(diag(t₁,t₂,νt₂⁻¹,νt₁⁻¹))=t₁ᵃt₂ᵇνᶜ. Positive roots are (1,−1;0),(0,2;−1),(1,1;−1),(2,0;−1), with simple first two, ρ=(2,1;−3/2), and coroots (1,−1;0),(0,1;0),(1,1;0),(1,0;0). Dominant cones are a≥b≥0 for G and a≥b for M. The isogeny Tder×Z→T sends χ to Pilloni parity coordinates (a,b;a+b+2c).

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Evaluate each root on the torus and check coroot pairings; sum roots for ρ. Pull back a character along diag(st₁,st₂,st₂⁻¹,st₁⁻¹) to get the coordinate conversion.

Acceptance: In CG upper-triangular coordinates χ=(a,b;c), χ(diag(t₁,t₂,νt₂⁻¹,νt₁⁻¹))=t₁ᵃt₂ᵇνᶜ. Positive roots are (1,−1;0),(0,2;−1),(1,1;−1),(2,0;−1), with simple first two, ρ=(2,1;−3/2), and coroots (1,−1;0),(0,1;0),(1,1;0),(1,0;0). Dominant cones are a≥b≥0 for G and a≥b for M. The isogeny Tder×Z→T sends χ to Pilloni parity coordinates (a,b;a+b+2c).

Direct prerequisites: ReductiveGroupsPartII:RG2.5; ShimuraData:D5/siegel-root-convention.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1, author pp.7–8. For genus-two cg coordinate comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E5.

### Genus-two Kostant actions

Declaration: **TauCeti.Shimura.gsp4Kostant**. Node: ShimuraData:D5/gsp4-kostant. Kind: lemma.

In CG coordinates ^MW has four elements with actions (a,b;c), (a,−b;b+c), (b,−a;a+c), (−b,−a;a+b+c), of lengths 0,1,2,3. The element called w₀ in CG acts (a,b;c)↦(b,a;c) and is the longest Levi element. The full longest Weyl element acts (−a,−b;a+b+c). The duality involution w↦w₀,Mww₀,G reverses these four lengths.

Hypotheses and conventions: G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Generate signed permutations, pair with the single positive Levi root, and compute the four minimal representatives and actions. Check the longest elements separately.

Acceptance: In CG coordinates ^MW has four elements with actions (a,b;c), (a,−b;b+c), (b,−a;a+c), (−b,−a;a+b+c), of lengths 0,1,2,3. The element called w₀ in CG acts (a,b;c)↦(b,a;c) and is the longest Levi element. The full longest Weyl element acts (−a,−b;a+b+c). The duality involution w↦w₀,Mww₀,G reverses these four lengths.

Direct prerequisites: ShimuraData:D5/gsp4-cg-roots; ShimuraData:D3/kostant-involution.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1.1, author p.8; corrections in sourceIssues: E10. For genus-two kostant actions, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E6.

### Genus-two chamber reversal

Declaration: **TauCeti.Shimura.gsp4ConeReversal**. Node: ShimuraData:D5/gsp4-cone-reversal. Kind: lemma.

For C_i=ŵ_i C_G⁺, i=0,1,2,3, the map −w₀,M on the character vector space sends C_i to C_{3−i}. Here the minus negates all three coordinates and w₀,M swaps a,b; the central coordinate is unrestricted. This distinguishes the Levi longest element from the full longest element.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Apply (a,b;c)↦(−b,−a;−c) to the inequalities defining each chamber. This is the chamber-level form of the Kostant involution.

Acceptance: For C_i=ŵ_i C_G⁺, i=0,1,2,3, the map −w₀,M on the character vector space sends C_i to C_{3−i}. Here the minus negates all three coordinates and w₀,M swaps a,b; the central coordinate is unrestricted. This distinguishes the Levi longest element from the full longest element.

Direct prerequisites: ShimuraData:D5/gsp4-kostant; ShimuraData:D3/kostant-cones.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1, author p.8; Theorem 5.5 proof, author pp.28–29. For genus-two chamber reversal, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Genus-two real centralizer

Declaration: **TauCeti.Shimura.gsp4Centralizer**. Node: ShimuraData:D5/gsp4-centralizer. Kind: theorem.

For CG J=h(i), K^h={g∈GSp₄(ℝ):gᵀg=ν(g)I₄}=ℝ_{>0}K∞,1=ℝˣK∞,1, with K∞,1=Sp₄(ℝ)∩O(4). Every element has positive similitude. The full K∞=GSp₄(ℝ)∩O(4) also has negative similitudes and does not centralize h.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Use the symplectic equation together with gJ=Jg to derive gᵀg=ν(g)I. Positivity gives the positive scalar normalization. A negative-similitude orthogonal element sends J to −J.

Acceptance: For CG J=h(i), K^h={g∈GSp₄(ℝ):gᵀg=ν(g)I₄}=ℝ_{>0}K∞,1=ℝˣK∞,1, with K∞,1=Sp₄(ℝ)∩O(4). Every element has positive similitude. The full K∞=GSp₄(ℝ)∩O(4) also has negative similitudes and does not centralize h.

Direct prerequisites: ShimuraData:D5/siegel-datum; ShimuraData:D2/stabilizer-h; ShimuraData:D5/gsp4-cg-roots.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, author pp.8–9; corrections in sourceIssues: E11,E12. For genus-two real centralizer, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E7, ShimuraData/E8.

### Unitary identification of the centralizer

Declaration: **TauCeti.Shimura.gsp4Unitary**. Node: ShimuraData:D5/gsp4-unitary. Kind: theorem.

Put S=[[0,1],[1,0]]. Elements of K∞,1 are [[SAS,SB],[−BS,A]] with AᵀA+BᵀB=I and AᵀB=BᵀA. The map k↦A+iB is a real Lie-group isomorphism K∞,1≅U(2).

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Expand kᵀk=I and the J centralizer relation, then compare with (A+iB)* (A+iB)=I. Block multiplication verifies the homomorphism and the displayed formula its inverse.

Acceptance: Put S=[[0,1],[1,0]]. Elements of K∞,1 are [[SAS,SB],[−BS,A]] with AᵀA+BᵀB=I and AᵀB=BᵀA. The map k↦A+iB is a real Lie-group isomorphism K∞,1≅U(2).

Direct prerequisites: ShimuraData:D5/gsp4-centralizer; AutomorphicFormsOnReductiveGroups:AF.1.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, author p.9. For unitary identification of the centralizer, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Genus-two compact Cartan

Declaration: **TauCeti.Shimura.gsp4CompactCartan**. Node: ShimuraData:D5/gsp4-compact-cartan. Kind: construction.

Let H=ℝ_{>0}H₁ in K^h with H₁ the diagonal U(1)² under K∞,1≅U(2). Its complex algebraic torus is (Gm³)/⟨(−1,−1,−1)⟩ in angular/scalar coordinates; its character lattice is {(a,b;c)∈ℤ³:a+b≡c mod2}. Characters evaluate as the corresponding exponential on h_C. Compact Cartan coordinates differ from split CG coordinates.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Take the inverse image of the diagonal unitary subgroup and multiply by positive scalars. The simultaneous sign identifies the complexified parametrization, yielding the parity character lattice.

API:

- **TauCeti.Shimura.compactCartanRank** (characterisation): H₁ has real dimension two and H has dimension three.
- **TauCeti.Shimura.compactCartanParity** (characterisation): A character (a,b;c) descends iff a+b≡c mod2.
- **TauCeti.Shimura.compactCartanEmbedding** (characterisation): The diagonal unitary torus embeds into K∞,1 under the inverse of k↦A+iB.

Discriminating unit tests:

- **TauCeti.Shimura.tests.cartanParityTrue** (computation): (1,0;1),(0,1;1),(0,0;2) descend. Rejects: All characters forced even.
- **TauCeti.Shimura.tests.cartanParityFalse** (non-example): (1,0;0) does not descend. Rejects: Character lattice taken as all ℤ³.
- **TauCeti.Shimura.tests.cartanRank** (computation): At genus two there are two angular and one scalar directions. Rejects: Central scalar direction dropped.

Uses:

- ShimuraData:D5/gsp4-exp-kernel: Compact Cartan exponential kernel consumes genus-two compact cartan: H₁ has real dimension two and H has dimension three.
- AutomorphicFormsOnReductiveGroups:AF.4: The consumer uses genus-two compact cartan through these concrete interfaces: H₁ has real dimension two and H has dimension three. A character (a,b;c) descends iff a+b≡c mod2.
- GSp4NonregularModularityLifting: The consumer uses genus-two compact cartan through these concrete interfaces: H₁ has real dimension two and H has dimension three. A character (a,b;c) descends iff a+b≡c mod2.

Acceptance: Let H=ℝ_{>0}H₁ in K^h with H₁ the diagonal U(1)² under K∞,1≅U(2). Its complex algebraic torus is (Gm³)/⟨(−1,−1,−1)⟩ in angular/scalar coordinates; its character lattice is {(a,b;c)∈ℤ³:a+b≡c mod2}. Characters evaluate as the corresponding exponential on h_C. Compact Cartan coordinates differ from split CG coordinates.

Direct prerequisites: ShimuraData:D5/gsp4-unitary; ReductiveGroupsPartII:RG2.5.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, author pp.9–10; Theorem 5.5 proof, author p.28; source issues E9–E10 record the kernel/parity correction. For genus-two compact cartan, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E9, ShimuraData/E10.

### Compact Cartan exponential kernel

Declaration: **TauCeti.Shimura.gsp4ExpKernel**. Node: ShimuraData:D5/gsp4-exp-kernel. Kind: lemma.

In CG coordinates h(t₁,t₂;z) on h_C, the exponential kernel consists of (2πm,2πn;2πik) and (π+2πm,π+2πn;πi+2πik), for m,n,k∈ℤ. In particular the extra element h(π,π;πi) forces a+b≡c mod2 on integral characters.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Exponentiate the two commuting angular blocks and scalar block. The image is identity exactly when all three individual factors have the same sign; solve the two sign cases.

Acceptance: In CG coordinates h(t₁,t₂;z) on h_C, the exponential kernel consists of (2πm,2πn;2πik) and (π+2πm,π+2πn;πi+2πik), for m,n,k∈ℤ. In particular the extra element h(π,π;πi) forces a+b≡c mod2 on integral characters.

Direct prerequisites: ShimuraData:D5/gsp4-compact-cartan; tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, author p.9. For compact cartan exponential kernel, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E9.

### Genus-two Cayley basis

Declaration: **TauCeti.Shimura.gsp4CayleyBasis**. Node: ShimuraData:D5/gsp4-cayley-basis. Kind: construction.

For the CG J and real basis e₁,…,e₄, take f₁=e₁−ie₄,f₂=e₂−ie₃,f₃=e₃−ie₂,f₄=e₄−ie₁. They are the columns of C=[[I₂,−iS],[−iS,I₂]] and give bases of the two ±i-eigenspaces of J. C is invertible, with inverse 1/2 [[I₂,iS],[iS,I₂]].

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Multiply C by the proposed inverse and use S²=I. Apply J to each column to identify the eigenspaces.

API:

- **TauCeti.Shimura.cayleyInverse** (characterisation): C⁻¹=1/2 [[I₂,iS],[iS,I₂]].
- **TauCeti.Shimura.cayleyHodgeLines** (compatibility): The first and last two columns span the two complex Hodge summands.
- **TauCeti.Shimura.cayleyConjugation** (characterisation): Conjugation exchanges the two summands with the reverse-order identification.

Discriminating unit tests:

- **TauCeti.Shimura.tests.cayleyProduct** (computation): C times the displayed inverse is I₄. Rejects: Missing factor 1/2.
- **TauCeti.Shimura.tests.cayleyColumn** (computation): The first column is e₁−ie₄. Rejects: S replaced by I₂.
- **TauCeti.Shimura.tests.cayleyWrongSign** (computation): Replacing −iS in only one off-diagonal block makes the resulting matrix singular. Rejects: One off-diagonal sign changed.

Uses:

- ShimuraData:D5/gsp4-cayley-action: Centralizer action in the Cayley basis consumes genus-two cayley basis: C⁻¹=1/2 [[I₂,iS],[iS,I₂]].
- ShimuraData:D5/gsp4-pilloni-convention: Pilloni genus-two convention comparison consumes genus-two cayley basis: C⁻¹=1/2 [[I₂,iS],[iS,I₂]].

Acceptance: For the CG J and real basis e₁,…,e₄, take f₁=e₁−ie₄,f₂=e₂−ie₃,f₃=e₃−ie₂,f₄=e₄−ie₁. They are the columns of C=[[I₂,−iS],[−iS,I₂]] and give bases of the two ±i-eigenspaces of J. C is invertible, with inverse 1/2 [[I₂,iS],[iS,I₂]].

Direct prerequisites: ShimuraData:D5/gsp4-centralizer; ShimuraData:D1/elliptic-homology-object.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, author p.10. For genus-two cayley basis, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Centralizer action in the Cayley basis

Declaration: **TauCeti.Shimura.gsp4CayleyAction**. Node: ShimuraData:D5/gsp4-cayley-action. Kind: lemma.

For k=[[SAS,SB],[−BS,A]], C⁻¹kC=diag(SAS−iSBS,A+iB). In compact coordinates the positive compact root is (1,−1;0) and the three positive noncompact roots are (0,2;0),(1,1;0),(2,0;0), according to CG convention.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Multiply the three block matrices; the off-diagonal blocks vanish and the diagonal blocks are as displayed. Evaluate compact torus characters on Hom blocks to identify compact and noncompact roots.

Acceptance: For k=[[SAS,SB],[−BS,A]], C⁻¹kC=diag(SAS−iSBS,A+iB). In compact coordinates the positive compact root is (1,−1;0) and the three positive noncompact roots are (0,2;0),(1,1;0),(2,0;0), according to CG convention.

Direct prerequisites: ShimuraData:D5/gsp4-cayley-basis; ShimuraData:D5/gsp4-unitary; ShimuraData:D5/gsp4-compact-cartan; ReductiveGroupsPartII:RG2.5.

Source evidence: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, author p.10. For centralizer action in the cayley basis, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Pilloni genus-two convention comparison

Declaration: **TauCeti.Shimura.gsp4PilloniConvention**. Node: ShimuraData:D5/gsp4-pilloni-convention. Kind: lemma.

Import RG2.5 parity coordinates e₁=(1,0;1),e₂=(0,1;1),e₃=(0,0;2)=ν and the half-integral dual lattice {(b₁,b₂;d):b₁+d,b₂+d∈ℤ}. Pilloni uses the lower full Borel: positives e₂−e₁,−2e₁+e₃,−e₁−e₂+e₃,−2e₂+e₃; simples e₂−e₁,−2e₂+e₃; ρ=(−2,−1;0). The first simple root is compact and the other positives lie in g_C/p_Si. The CG conversion is (a,b;c)_CG↦(a,b;a+b+2c)_P. The BP Borel swaps the compact order, giving ρ_BP=(−1,−2;0) for g=2.

Hypotheses and conventions: Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Apply the lattice conversion and negate the CG full positive roots, then pair with the imported coroots. Distinguish the BP block Borel from Pilloni’s lower full Borel.

Acceptance: Import RG2.5 parity coordinates e₁=(1,0;1),e₂=(0,1;1),e₃=(0,0;2)=ν and the half-integral dual lattice {(b₁,b₂;d):b₁+d,b₂+d∈ℤ}. Pilloni uses the lower full Borel: positives e₂−e₁,−2e₁+e₃,−e₁−e₂+e₃,−2e₂+e₃; simples e₂−e₁,−2e₂+e₃; ρ=(−2,−1;0). The first simple root is compact and the other positives lie in g_C/p_Si. The CG conversion is (a,b;c)_CG↦(a,b;a+b+2c)_P. The BP Borel swaps the compact order, giving ρ_BP=(−1,−2;0) for g=2.

Direct prerequisites: ReductiveGroupsPartII:RG2.5; ShimuraData:D5/gsp4-cg-roots; ShimuraData:D5/siegel-root-convention; ShimuraData:D5/gsp4-cayley-action.

Source evidence: [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.1.1, author p.20; Remark 5.2.1.1, author p.23; corrected E11, scoped to the author copy. For pilloni genus-two convention comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E11.

### Unipotent reduction eigenvalue bound

Declaration: **TauCeti.Shimura.localEigenvalueBound**. Node: ShimuraData:D5/local-eigenvalue-bound. Kind: lemma.

Let F_v/ℚ_l be absolutely unramified, normalize v(l)=1, and let γ∈Iw₁(v)⊂GSp₄(F_v). Every eigenvalue λ in an algebraic closure satisfies v(λ−1)≥1/4, since χγ(X)≡(X−1)^4 modulo the maximal ideal.

Hypotheses and conventions: The local valuation extends to an algebraic closure and is normalized by v(l)=1. The eigenvalue bound uses absolute unramifiedness and the Iw₁ congruence χ(X)≡(X−1)^4. The torsion gap and final criterion require residue characteristic l>5; products use integer exponents.

Proof or construction:

1. Shift χγ to Y=X−1. All lower coefficients have valuation ≥1. If v(Y)<1/4, Y⁴ has strictly smaller valuation than every other term, contradicting the ultrametric equality at a root. The leading coefficient is 1.

Acceptance: Let F_v/ℚ_l be absolutely unramified, normalize v(l)=1, and let γ∈Iw₁(v)⊂GSp₄(F_v). Every eigenvalue λ in an algebraic closure satisfies v(λ−1)≥1/4, since χγ(X)≡(X−1)^4 modulo the maximal ideal.

Direct prerequisites: ShimuraData:D5/neat; ReductiveGroupsPartII:RG2.5; ReductiveGroupsPartII:RG2.3; mathlib:AddValuation; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions; mathlib:AddValuation.map_mul; mathlib:AddValuation.map_le_add; mathlib:AddValuation.map_inv; mathlib:AddValuation.map_zero.

Source evidence: [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 7.8.3, published p.409. For unipotent reduction eigenvalue bound, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Eigenvalue products retain the bound

Declaration: **TauCeti.Shimura.localProductsBound**. Node: ShimuraData:D5/local-products-bound. Kind: lemma.

If v(λ_j−1)≥1/4 for finitely many λ_j, every integer product η=∏λ_j^{n_j} also satisfies v(η−1)≥1/4. All λ_j are units. Inversion preserves v(λ−1), and multiplication uses ab−1=(a−1)b+(b−1).

Hypotheses and conventions: The local valuation extends to an algebraic closure and is normalized by v(l)=1. The eigenvalue bound uses absolute unramifiedness and the Iw₁ congruence χ(X)≡(X−1)^4. The torsion gap and final criterion require residue characteristic l>5; products use integer exponents.

Proof or construction:

1. The closed ball 1+{x:v(x)≥1/4} is a multiplicative subgroup by the two identities. Induct on products and integer powers.

Acceptance: If v(λ_j−1)≥1/4 for finitely many λ_j, every integer product η=∏λ_j^{n_j} also satisfies v(η−1)≥1/4. All λ_j are units. Inversion preserves v(λ−1), and multiplication uses ab−1=(a−1)b+(b−1).

Direct prerequisites: ShimuraData:D5/local-eigenvalue-bound; mathlib:AddValuation; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions; mathlib:AddValuation.map_mul; mathlib:AddValuation.map_le_add; mathlib:AddValuation.map_inv; mathlib:AddValuation.map_zero.

Source evidence: [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proof of Lemma 7.8.3, published p.409 (generated-group step expanded here). For eigenvalue products retain the bound, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E15.

### Torsion gap at large residue characteristic

Declaration: **TauCeti.Shimura.localTorsionGap**. Node: ShimuraData:D5/local-torsion-gap. Kind: lemma.

In the algebraic closure of an absolutely unramified l-adic field, a nontrivial root of unity ζ has v(ζ−1)=0 unless its order is an l-power; in the l-power case v(ζ−1)=1/(l^{r−1}(l−1)). For l>5 this is <1/4.

Hypotheses and conventions: The local valuation extends to an algebraic closure and is normalized by v(l)=1. The eigenvalue bound uses absolute unramifiedness and the Iw₁ congruence χ(X)≡(X−1)^4. The torsion gap and final criterion require residue characteristic l>5; products use integer exponents.

Proof or construction:

1. Use the cyclotomic valuation supplied by the local-fields roadmap. Prime-to-l torsion has distinct reduction; the l-power formula follows from the cyclotomic polynomial evaluated at 1.

Acceptance: In the algebraic closure of an absolutely unramified l-adic field, a nontrivial root of unity ζ has v(ζ−1)=0 unless its order is an l-power; in the l-power case v(ζ−1)=1/(l^{r−1}(l−1)). For l>5 this is <1/4.

Direct prerequisites: ShimuraData:D5/local-products-bound; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions; mathlib:AddValuation.

Source evidence: [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 7.8.3, published p.409. For torsion gap at large residue characteristic, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

### Unipotent Iwahori criterion for neatness

Declaration: **TauCeti.Shimura.iwahoriNeat**. Node: ShimuraData:D5/iwahori-neat. Kind: theorem.

For a number field F and compact open K=∏_vK_v⊂GSp₄(𝔸F,f), if K_v=Iw₁(v) at one absolutely unramified place of residue characteristic l>5, K is neat. The generated eigenvalue subgroup, for every rational γ∈GSp₄(F)∩gKg⁻¹, has no nontrivial torsion. Prime-to-p levels satisfy the same criterion when this v is retained.

Hypotheses and conventions: The local valuation extends to an algebraic closure and is normalized by v(l)=1. The eigenvalue bound uses absolute unramifiedness and the Iw₁ congruence χ(X)≡(X−1)^4. The torsion gap and final criterion require residue characteristic l>5; products use integer exponents.

Proof or construction:

1. Conjugation preserves eigenvalues. Embed the splitting field of χγ into the local algebraic closure; the local bound applies to all generated products and contradicts the torsion gap. Apply the faithful standard-representation criterion to every adelic conjugate.

Acceptance: For a number field F and compact open K=∏_vK_v⊂GSp₄(𝔸F,f), if K_v=Iw₁(v) at one absolutely unramified place of residue characteristic l>5, K is neat. The generated eigenvalue subgroup, for every rational γ∈GSp₄(F)∩gKg⁻¹, has no nontrivial torsion. Prime-to-p levels satisfy the same criterion when this v is retained.

Direct prerequisites: ShimuraData:D5/local-eigenvalue-bound; ShimuraData:D5/local-products-bound; ShimuraData:D5/local-torsion-gap; ShimuraData:D5/neat-representation-independence; ShimuraData:D5/adelic-neat; mathlib:AddValuation; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions.

Source evidence: [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 7.8.3, published p.409. For unipotent iwahori criterion for neatness, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Corrected source readings: ShimuraData/E15.

### Neatness of principal GL₂ levels

Declaration: **TauCeti.Shimura.gl2CongruenceNeat**. Node: ShimuraData:D5/gl2-congruence-neat. Kind: lemma.

For N≥3 let K(N) be the kernel of GL₂(Ẑ)→GL₂(ℤ/Nℤ). Every GL₂(ℚ)∩aK(N)a⁻¹ is neat, hence K(N) is rationally neat. This is the rank-two principal-level test, not a second proof of general neat-level existence.

Hypotheses and conventions: N is an integer at least 3. The full adelic conjugate intersection is used, not only its component subgroup. The rational lattice comparison is requested from AA.3, the general reduction-theory owner.

Proof or construction:

1. A finite-adelic rank-two lattice over ℚ has a rational basis, so a lies in GL₂(ℚ)GL₂(Ẑ). Since K(N) is normal in GL₂(Ẑ), its rational intersection is rationally conjugate to the principal integral subgroup.
2. If M≡I mod N and M is integral invertible, det M=±1 and det M≡1 mod N force det M=1. Its eigenvalues are λ and λ⁻¹. Any torsion product is λ^r, so nontrivial torsion would force λ to be a root of unity.
3. The integer trace λ+λ⁻¹ of a root of unity lies in [−2,2]. Also det(I−M)=2−tr M is divisible by N². Since N²>4, this determinant is zero, so λ=1. The generated eigenvalue subgroup is therefore torsion-free.

Acceptance: For N=3 this excludes the tempting primitive cube-root eigenvalues: det(I−M)=3 cannot be divisible by 9. At N=2 the scalar matrix −I is a counterexample.

Direct prerequisites: ShimuraData:D5/neat; ShimuraData:D5/neat-representation-independence; AdelicAlgebraicGroups:AA.3.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §3, neatness definition and Proposition 3.5, p.34; rank-two principal-level calculation given here. The source motivates the congruence/neat distinction. The explicit rank-two bound is derived from determinant divisibility and the source definition, rather than quoted as a general N≥3 theorem.

## Exact supplier requests

### AdelicAlgebraicGroups:AA.1

For ResF/ℚGL₂ and its determinant fiber product supply topological finite-adelic point comparison, rational diagonal and compact-open operations, compatible with conjugation. Finite adeles alone are not asserted to make rational points discrete.

Consumers: ShimuraData:D0/hilbert-adelic-points, ShimuraData:D0/datum-map-points, ShimuraData:D5/neat-level, ShimuraData:D5/adelic-neat, ShimuraData:D5/component-subgroup.

### ArithmeticLocallySymmetricSpaces:ALS.0

Supply the general Cartan involution/compact-real-form equivalence, Killing-form criterion on the semisimple adjoint Lie algebra, and reductive-center qualification. General symmetric-space geometry is imported; D2 owns its Hodge complex structure. Supply proper symmetric-space action and compact effective point stabilizers. D5 proves conditional freeness for a discrete effective subgroup; V0 later proves arithmeticity and discreteness for the component subgroup.

Consumers: ShimuraData:D2/cartan-adjoint-criterion, ShimuraData:D2/hermitian-domain-components, ShimuraData:D5/effective-kernel, ShimuraData:D5/effective-free.

### AutomorphicFormsOnReductiveGroups:AF.1

Supply smooth real analytic group charts for connected reductive algebraic real points, their Lie algebra comparison, orbit maps and closed-subgroup homogeneous quotient differentials. Specialized S/GL₂/Hilbert chart comparisons must commute with the algebraic point dictionary.

Consumers: ShimuraData:D0/deligne-lie-points, ShimuraData:D0/hilbert-real-points, ShimuraData:D0/datum-map-points, ShimuraData:D2/tangent-quotient, ShimuraData:D2/quotient-separation, ShimuraData:D5/gsp4-unitary.

### ComplexMultiplicationAndExplicitReciprocity:CM.0

For E/ℚ CM and CM type Φ, import the CM-type algebra, reflex-type class and polarization of the regular E action. D5 alone constructs its torus datum; D3 alone defines reflex field. Only the downstream D5 CM example imports CM.0; generic MT/special-point definitions do not depend on this later stage.

Consumers: ShimuraData:D5/cm-torus.

### ReductiveGroupsPartII:RG2.0

For affine finite-type groups supply functorial continuous local point maps, real-coordinate topology, and restriction-of-scalars comparison; identify S(ℝ) with ℂˣ topologically.

Consumers: ShimuraData:D0/deligne-points-topology, ShimuraData:D0/hilbert-real-points, ShimuraData:D0/datum-map-points, ShimuraData:D2/stabilizer-h.

### ReductiveGroupsPartII:RG2.0a

Import finite-separable Weil restriction, the Deligne torus with its universal point identification, real/complex splitting and Galois swap, diagonal d, inverse diagonal w, norm, conjugation, and split character/cocharacter lattices. For Hilbert F import F⊗ℚℝ splitting and the restriction/determinant fiber product; do not construct S a second time.

Consumers: ShimuraData:D0/deligne-points-topology, ShimuraData:D0/hilbert-real-points, ShimuraData:D0/hilbert-adelic-points, ShimuraData:D1/deligne-torus, ShimuraData:D1/deligne-torus-points, ShimuraData:D1/weight-norm-cocharacters, ShimuraData:D1/conjugation-pieces, ShimuraData:D1/representation-of-hodge, ShimuraData:D4/shimura-datum, ShimuraData:D5/cm-torus, ShimuraData:D5/hilbert-datum, ShimuraData:D5/hilbert-trace-form.

### ReductiveGroupsPartII:RG2.3

Import the integral symplectic Iwahori and pro-unipotent Iw₁(v) level, and the fact that its standard characteristic polynomial reduces to (X−1)^4.

Consumers: ShimuraData:D5/local-eigenvalue-bound.

### ReductiveGroupsPartII:RG2.5

Import the symplectic based root datum, Weyl actions and lattices in CG/Pilloni/BCGP coordinates, integral/half-integral parity conversion and symplectic dual groups. D5 adds only Borel/Hodge/Siegel and compact-Cartan comparisons.

Consumers: ShimuraData:D5/siegel-root-convention, ShimuraData:D5/siegel-weyl-permutations, ShimuraData:D5/gsp4-cg-roots, ShimuraData:D5/gsp4-compact-cartan, ShimuraData:D5/gsp4-cayley-action, ShimuraData:D5/gsp4-pilloni-convention, ShimuraData:D5/local-eigenvalue-bound.

### SchemeAndStackFoundations:SF.1

Supply effective equivariant descent of projective schemes along finite separable field extensions, applied to the represented parabolic-type functor from R7. Descent does not imply a rational point.

Consumers: ShimuraData:D3/reflex-flag-descent.

### tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition

Use existing pure real/rational/integral Hodge carriers, conjugation, opposed filtrations, decomposition, tensor, dual and Tate conventions; supply elliptic H₁/H¹ comparison. Record the missing H0→D1 stage dependence required by RT-AREA-algebraicgeometry/27.

Consumers: ShimuraData:D1/graded-real-hodge, ShimuraData:D1/representation-hodge-equivalence, ShimuraData:D1/tensor-comparison, ShimuraData:D1/dual-comparison, ShimuraData:D1/elliptic-homology-object, ShimuraData:D3/variation, ShimuraData:D3/flat-bundle-local.

### tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory

Supply rational polarization, positive Hermitian comparison, polarizable rational semisimplicity and invariance under rational isogeny; these are used in MT and fiberwise polarized variations. Record H1→D3 required by RT-AREA-algebraicgeometry/27.

Consumers: ShimuraData:D1/mumford-tate-group, ShimuraData:D1/hodge-generic, ShimuraData:D3/polarized-integral-variation.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions

Supply extension of normalized valuations to algebraic closures and the cyclotomic identity v(ζ_{l^r}−1)=1/(l^{r−1}(l−1)); prime-to-l torsion has nontrivial reduction. Use absolute unramifiedness to normalize v(l)=1.

Consumers: ShimuraData:D5/local-eigenvalue-bound, ShimuraData:D5/local-products-bound, ShimuraData:D5/local-torsion-gap, ShimuraData:D5/iwahori-neat.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary

Use the algebraic group/functor/Hopf dictionary, matrix representations, base change and closed immersion criterion. Supply finite-type noetherian intersection of subgroup ideals for the smallest rational algebraic subgroup containing an S-map after real extension.

Consumers: ShimuraData:D0/datum-map-points, ShimuraData:D1/mumford-tate-group, ShimuraData:D4/hodge-type, ShimuraData:D5/hilbert-trace-embedding.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules

Finite-dimensional algebraic representations are comodules; supply tensor/dual/subquotient operations, scalar-extension faithfulness, and effective conjugate-semilinear descent of comodules over the supplied descended torus. A faithful representation tensor-generates finite-dimensional representations for neatness independence.

Consumers: ShimuraData:D1/deligne-torus, ShimuraData:D1/hodge-decomposition-of-representation, ShimuraData:D1/conjugation-pieces, ShimuraData:D1/representation-of-hodge, ShimuraData:D1/comparison-roundtrip, ShimuraData:D1/representation-hodge-equivalence, ShimuraData:D1/rational-weight-criterion, ShimuraData:D2/unique-complex-structure, ShimuraData:D3/filtration-parabolic, ShimuraData:D5/neat, ShimuraData:D5/neat-representation-independence.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation

Supply adjoint representation, bracket equivariance, center as adjoint kernel and differential centralizer equations.

Consumers: ShimuraData:D0/deligne-lie-points, ShimuraData:D1/adjoint-gl2-object, ShimuraData:D2/shimura-cartan-involution, ShimuraData:D2/stabilizer-h, ShimuraData:D2/adjoint-bracket, ShimuraData:D4/weight-central, ShimuraData:D5/siegel-lie-types.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components

Use algebraic closed subgroups, quotients and connected components; scheme-theoretic image of a torus is a torus. For MT use that connected real S lies in the scalar extension of the rational identity component.

Consumers: ShimuraData:D1/mumford-tate-group, ShimuraData:D4/special-image.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori

Supply rational Gm weight-space grading, diagonalizable closure of a semisimple element, and rational torus factorization; finite-dimensional rational representations have rational eigenspaces under a rational Gm.

Consumers: ShimuraData:D1/rational-weight-criterion, ShimuraData:D3/cocharacter-class, ShimuraData:D3/reflex-stabilizer-open, ShimuraData:D4/special-pair, ShimuraData:D4/special-image, ShimuraData:D5/neat-representation-independence, ShimuraData:D5/torus-datum.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups

Use connected reductive/adjoint/derived groups, rational simple-factor quotients, central isogenies, centers and semisimple representation criterion. Provide reductivity of MT of a polarizable rational Hodge structure using H1 semisimplicity.

Consumers: ShimuraData:D1/mumford-tate-group, ShimuraData:D2/cartan-adjoint-criterion, ShimuraData:D2/shimura-cartan-involution, ShimuraData:D2/compact-real-factor, ShimuraData:D2/hermitian-domain-components, ShimuraData:D4/shimura-datum, ShimuraData:D4/axioms-conjugation, ShimuraData:D4/weight-central, ShimuraData:D4/product-datum, ShimuraData:D4/adjoint-datum, ShimuraData:D4/central-isogeny-lift, ShimuraData:D4/abelian-type, ShimuraData:D5/effective-kernel, ShimuraData:D5/gl2-datum, ShimuraData:D5/siegel-datum, ShimuraData:D5/hilbert-star-datum.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Supply cocharacter parabolics, Levi factors, flag varieties, tangent/Lie quotient, finite-type conjugacy classes and Bruhat order over fields. Supply the parabolic-type variety representing a Galois-invariant type, without assuming an E-rational representative parabolic.

Consumers: ShimuraData:D3/transversality-tangent, ShimuraData:D3/filtration-parabolic, ShimuraData:D3/compact-dual, ShimuraData:D3/cocharacter-class, ShimuraData:D3/reflex-stabilizer-open, ShimuraData:D3/reflex-flag-descent, ShimuraData:D3/kostant-representatives, ShimuraData:D3/kostant-cone-criterion, ShimuraData:D3/kostant-cones, ShimuraData:D3/kostant-involution, ShimuraData:D3/bruhat-integral, ShimuraData:D5/siegel-datum, ShimuraData:D5/siegel-reflex-dual.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ

Supply pinned split reductive ℤ-group schemes and smooth parabolic quotients; integral Bruhat affine cells, flat Schubert/opposite closures, base-change-compatible incidence and the nonemptiness criterion X^w∩C_v≠∅ iff v≥w. These are stronger than the field-only layer7 statements and must hold over every residue field.

Consumers: ShimuraData:D3/kostant-representatives, ShimuraData:D3/bruhat-integral, ShimuraData:D3/schubert-families, ShimuraData:D3/bruhat-closure-order, ShimuraData:D3/opposite-intersection, ShimuraData:D5/kostant-sequence-geometry.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem

Closed centralizers are embedded Lie subgroups; provide real homogeneous quotients and their tangent exact sequences.

Consumers: ShimuraData:D2/stabilizer-h, ShimuraData:D2/tangent-quotient.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-4-frobenius-lies-third-theorem-and-the-equivalence-of-categories

Supply the complex analytic homogeneous quotient theorem: a closed complex Lie subgroup with compatible real orbit and the subalgebra g^{0,0}⊕g^{1,−1} gives holomorphic charts and integrability of the invariant J. Smooth Frobenius alone does not establish this.

Consumers: ShimuraData:D2/hodge-integrability.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms

Supply compact twisted real forms, conjugation-compatible Lie complexification and complexified compact torus exponential. D2 consumes the native layer7→D2 dependency.

Consumers: ShimuraData:D2/cartan-adjoint-criterion, ShimuraData:D5/gsp4-exp-kernel.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat

Supply complex flag quotient charts, tangent identification and open real orbit criterion used in Borel embedding.

Consumers: ShimuraData:D2/hodge-integrability, ShimuraData:D3/transversality-tangent, ShimuraData:D3/compact-dual.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions

Supply Cartan decomposition, proper symmetric-space action and centralizer maximal compactness modulo center.

Consumers: ShimuraData:D2/cartan-adjoint-criterion, ShimuraData:D2/hermitian-domain-components.

### AdelicAlgebraicGroups:AA.3

For GL₂ over ℚ, supply the rank-two finite-adelic lattice/class-number-one comparison GL₂(𝔸f)=GL₂(ℚ)GL₂(Ẑ); every such lattice has a rational basis. Use this special instance of the general arithmetic component/reduction theory, with normality of principal K(N) in GL₂(Ẑ).

Consumers: ShimuraData:D5/gl2-congruence-neat.

## Open proof leaves and prototype omissions

### Effective comodule descent is requested, not closed

The pinned torus descent descends the Hopf algebra, not arbitrary representations. R1 must supply its effective comodule descent with real-carrier and scalar-extension uniqueness; no equivalence proof is claimed without it.

Consumers: ShimuraData:D1/representation-of-hodge.

### Holomorphic flat bundles and connections from local systems

The pinned fundamental-groupoid local coefficient system supplies monodromy/transport. It does not provide L⊗O_B, holomorphic subbundles, Ω¹, or a flat connection. The variation node plans their use; a general complex analytic bundle/connection supplier is still missing. Required result: local trivializations glue the flat holomorphic bundle, pullback commutes, and filtered derivative is well defined.

Consumers: ShimuraData:D3/variation.

### Complex analytic quotient input

Milne Theorem1.21 cites Wolf1984 Theorem8.7.9, not read here. The exact complex quotient/integrability theorem is requested at LieGroups layer4; no proof from real smooth Frobenius is asserted.

Consumers: ShimuraData:D2/hodge-integrability.

### Integral flag geometry supplier exceeds field Bruhat theorem

RG layer7 is over a field. RG layer9 must supply integral parabolic quotients, Schubert flatness and base-change-compatible opposite incidence. BP and BP21 cite [BL03] I Lemma1 for incidence; that proof has not been read. The exact requested incidence theorem is a leaf, not an unproved claim of library coverage.

Consumers: ShimuraData:D3/bruhat-integral, ShimuraData:D3/opposite-intersection.

### Reflex parabolic-type descent representability

Need the representability and descent of the parabolic-type functor requested from R7, with descent compatible with the μ conjugacy class. General SGA3 representability proof has not been read. No E-point, E-rational μ, or E-rational parabolic is inferred.

Consumers: ShimuraData:D3/reflex-flag-descent.

### Mumford–Tate and genericity proof inputs

Minimality is reduced to noetherian subgroup intersection (R0); reductivity to H1 semisimplicity and R6. CM elliptic and non-CM elliptic characterizations are requested from CM and H1. Masser–Zannier states genericity, not these foundational proofs; the packet does not cite it as proving them. The CM/non-CM elliptic test classification needs an independently proved rational Hodge-endomorphism calculation; it cannot import the entire CM.0 stage into D1 or D4, since CM.0 consumes D3. The exact missing result is: the polarized rational H¹ of a complex elliptic curve has MT a two-dimensional CM torus in the imaginary-quadratic endomorphism case, and GL₂ otherwise.

Consumers: ShimuraData:D1/mumford-tate-group, ShimuraData:D1/hodge-generic.

### Suggested signatures omit unavailable conditions explicitly

Suggested forms use actual pinned Hodge/comodule/local-system/linear/group/scheme carriers. Algebraic S-map base change, rational simple-factor axioms, holomorphic filtration/connection and connected adjoint-type interfaces are not yet available as one library API. Each prototype names the conditions omitted; its signature is a planning interface, not the full final specification. Review must compare with the complete node statements before implementation. The full point-orbit constructors now retain actual product, torus, GL₂, real symplectic-similitude, Hilbert and common-determinant groups. The local eigenvalue prototype is the monic shifted quartic with coefficient valuation ≥1, using existing AddValuation, and the product bound applies to the generated subgroup. Explicit remaining omissions: D0 algebraic point identifications are parameters; D1 real comodule descent and graded categorical equivalence; D2 quotient charts, Cartan/semisimple and integrability geometry; D3 holomorphic bundles, polarization positivity, connections, homogeneous tensor comparison, parabolic/flag schemes, compact-dual dimensions/isotropy, Borel embedding geometry, reflex effective descent, Coxeter and integral Schubert hypotheses; D4 rational group/algebraic map/SV/connected-adjoint interfaces; D5 algebraic/adelic eigenvalue identifications, actual reflex/compact-dual schemes and type classification, and compact Cartan exponential carrier. Auxiliary group/linear calculations in the suggested tests cover expressible parts only; packet test statements remain the complete acceptance requirements.

Consumers: ShimuraData:D0, ShimuraData:D1, ShimuraData:D2, ShimuraData:D3, ShimuraData:D4, ShimuraData:D5.

## Corrections used from the sources

These entries are findings awaiting the blueprint’s independent review. Existing extraction findings are credited in the packet. No reviewer verdict is supplied by this worker. Formulas in the named declarations use the corrected readings; the version ledger specifies what text was inspected.

- **ShimuraData/E1**, §1.1, p. 2; scoped here to the author copy recorded in sourceVersions (misprint; affects nothing): M_µ is the Levi centralizing µ; U_P denotes the unipotent radical. Reason: The next representation and dominant-weight statements require a reductive Levi containing T; §3.1 defines it correctly. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-BOXER-PILLONI-26/E1; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E2**, §3.1, paragraph defining ᴹW, p. 34; scoped here to the author copy recorded in sourceVersions (misprint; affects nothing): Use positive Levi roots: w⁻¹Φ_M⁺⊂Φ⁺. Reason: For g=1 the printed condition excludes the nonidentity minimal representative although WM is trivial. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-BOXER-PILLONI-26/E52; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E3**, §3.1, concrete description of ᴹW, p. 34; scoped here to the author copy recorded in sourceVersions (error; affects a stated result): The comparison uses cyclic order g+1≺⋯≺2g≺1≺⋯≺g. Reason: Using the usual numeric order disagrees with minimal left coset representatives for the paper’s block Borel. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-BOXER-PILLONI-26/E53; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E4**, §6.1.8, p. 60 (paragraph before Proposition 6.1.11). The 2024 preprint has the same text (p. 58).; scoped here to the author copy recorded in sourceVersions (misprint; affects nothing): In the cell-stratification sentence, use C_w; X_w denotes its closure. Reason: Closures overlap along smaller Bruhat strata, whereas cells form the stated disjoint stratification. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-BOXER-PILLONI-26/E116; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E5**, §2.1, author p.7 (published p.807), displayed character formula; scoped to the author copy in sourceVersions (misprint; affects nothing): Use t₁ᵃt₂ᵇνᶜ. Reason: The second coordinate b must affect evaluation; (a,b,c)=(0,1,0) detects the slip. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-CALEGARI-GERAGHTY-20/E9; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E6**, §2.1, author p.8 (published p.808), longest-element sentence; used again in Theorem 5.5 proof, author pp.28–29; scoped to the author copy (misprint; affects nothing): The element swapping a,b is the longest Levi element w₀,M; the full longest acts (−a,−b;a+b+c). Reason: Swapping leaves the noncompact positive roots positive, so it cannot reverse all positive roots. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-CALEGARI-GERAGHTY-20/E10; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E7**, §2.2, author pp.8–9 (published pp.808–809), centralizer sentence; scoped to the author copy (error; affects nothing): Use K^h=ℝ_{>0}K∞,1, where K∞,1=Sp₄(ℝ)∩O(4). Reason: diag(1,1,−1,−1) is orthogonal with negative similitude, but anticommutes with J and does not centralize h. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-CALEGARI-GERAGHTY-20/E11; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E8**, §2.2, author pp.9–10 (published pp.809–810), unitary subgroup display and basis-action label; scoped to the author copy (misprint; affects nothing): The unitary subgroup and compact angular torus are in K∞,1, not the full orthogonal similitude subgroup. Reason: The negative-similitude component is antiunitary, whereas A+iB has positive symplectic similitude one. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-CALEGARI-GERAGHTY-20/E12; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E9**, §2.2, author p.9 (published p.809), kernel of exp; scoped to the author copy (error; affects nothing): Also include h(π+2πm,π+2πn;πi+2πik). Reason: Both angular rotations and the scalar exponential are −1 on the extra coset, giving their product +1. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-CALEGARI-GERAGHTY-20/E14; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E10**, Theorem 5.5 proof, author p.28 (published p.828), character-lattice identification; compare the correct parity lattice in §2.2 author p.9; scoped to the author copy (misprint; affects nothing): Use the parity sublattice a+b≡c (mod 2) in the stated angular/scalar coordinates. Reason: The extra exponential-kernel element forces (−1)^(a+b+c)=1; (1,0;0) fails. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-CALEGARI-GERAGHTY-20/E37; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E11**, §5.1.1 (The dual group of GSp4), p. 20; scoped here to the author copy recorded in sourceVersions (error; affects nothing): For the lower full Borel use e₂−e₁ and the same negative noncompact roots; simples e₂−e₁,−2e₂+e₃, and ρ=(−2,−1;0). Reason: The printed simple pair has positive off-diagonal Cartan pairing. The chamber 0≥λ₂>λ₁ requires e₂−e₁ positive. This differs from BP’s block Borel. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-PILLONI-20/E20; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E12**, §15.2.2, p. 107, and §5.2.1 (Siegel datum), p. 23 of the author version. HAL v3 has the same 'a1_2 + bJ' in both places (§5.2.1, p. 19; §15.2.2, p. 90).; scoped here to the author copy recorded in sourceVersions (misprint; affects nothing): Use a1₄+bJ. Reason: J is 4×4 on V=ℤ⁴; a 2×2 identity cannot be added to it. Correction search: The recorded author PDF at the cited locator; The existing extraction finding and its independent review, cited in known. Status: Recorded in PAPER-PILLONI-20/E148; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum..
- **ShimuraData/E13**, §6, SV1 verification, p.69 (2017 author notes) (misprint; affects nothing): For Lie(GSp), use ψ(Xu,v)+ψ(u,Xv)=c(X)ψ(u,v); zero is the Lie(Sp) equation. Reason: For X=id the left side is 2ψ, and scalar matrices belong to Lie(GSp). The middle Hodge dimension is g²+1, with the center in type (0,0). Correction search: https://www.jmilne.org/math/xnotes/errata.html; https://www.jmilne.org/math/xnotes/SV_errata.pdf (Jungin Lee, read in full); https://www.jmilne.org/math/xnotes/svi.html (2017 revision listed). Status: new.
- **ShimuraData/E14**, §6, SV4 verification, p.69 (2017 author notes) (misprint; affects nothing): With the inverse-diagonal weight convention fixed on p.56, w_h(r)=r⁻¹ id. Reason: The printed h_J(r)=r id has homology weight −1; its inverse is the defined weight map. Both are rational, so the SV4 verification still holds. Correction search: https://www.jmilne.org/math/xnotes/errata.html; https://www.jmilne.org/math/xnotes/SV_errata.pdf (Jungin Lee, read in full); https://www.jmilne.org/math/xnotes/svi.html (2017 revision listed). Status: new.
- **ShimuraData/E15**, Lemma 7.8.3 proof, published p.409 (gap; affects the proof): First extend v(λ−1)≥1/4 from eigenvalues to their entire generated subgroup using inversion and the ultrametric product inequality. Then apply the cyclotomic torsion gap to every generated torsion element. Reason: Neatness tests torsion in the subgroup generated by eigenvalues. Individual nontorsion eigenvalues can have torsion product: diag(2,−1/2) generates −1. The omitted closure step is valid and supplied by D5/local-products-bound; the lemma’s statement does not change. Correction search: https://pmihes.centre-mersenne.org/articles/10.1007/s10240-021-00128-2/ (publisher article/correction listing); The authors’ surfaces.pdf proof and existing PAPER-BOXER-CALEGARI-GEE-PILLONI-21 extraction sourceIssues; Internet search for BCGP Lemma 7.8.3 neatness/eigenvalue correction. Status: new.

## Verified baseline declarations

- **mathlib:Algebra.trace**, Mathlib/RingTheory/Trace/Defs.lean:71: Trace of multiplication in a finite algebra, used for the Hilbert alternating form.
- **mathlib:IntermediateField.fixedField**, Mathlib/FieldTheory/Galois/Basic.lean:210: Intermediate field fixed by a subgroup of field automorphisms; finiteness of the reflex field is a separate theorem.
- **mathlib:Subgroup.closure**, Mathlib/Algebra/Group/Subgroup/Lattice.lean:329: Smallest subgroup containing a set, used for the generated eigenvalues, not just individual eigenvalues.
- **tauceti:TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot**, TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean:110: Finite support of the weight decomposition under Module.Finite.
- **tauceti:TauCeti.DiagonalizableGroup.isInternal_weightSpace**, TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean:103: A comodule over a monoid algebra is the internal direct sum of its weight submodules.
- **tauceti:TauCeti.DiagonalizableGroup.weightSpace**, TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean:81: The weight submodule of a comodule corestricted to a monoid algebra.
- **tauceti:TauCeti.Hodge.HodgeStructureOn**, TauCeti/Geometry/Hodge/Structure.lean:62: Pure Hodge structures of weight n on a complex space with conjugation, as opposed filtrations.
- **tauceti:TauCeti.Hodge.HodgeStructureOn.decompositionEquiv**, TauCeti/Geometry/Hodge/Decomposition.lean:528: Pure Hodge structures correspond to Hodge decompositions.
- **tauceti:TauCeti.Hodge.HodgeStructureOn.dual**, TauCeti/Geometry/Hodge/Dual.lean:76: Dual of a pure Hodge structure.
- **tauceti:TauCeti.Hodge.HodgeStructureOn.ofDecomposition**, TauCeti/Geometry/Hodge/Decomposition.lean:446: The pure Hodge structure defined by a Hodge decomposition.
- **tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist**, TauCeti/Geometry/Hodge/Tate/Twist.lean:57: Tate twist of a pure Hodge structure.
- **tauceti:TauCeti.Hodge.HodgeStructureOn.tensorProduct**, TauCeti/Geometry/Hodge/TensorProduct.lean:109: Tensor product of pure Hodge structures.
- **tauceti:TauCeti.Hodge.HodgeStructureOn.weilOperator**, TauCeti/Geometry/Hodge/WeilOperator.lean:83: The Weil operator C, acting by i^{p−q} on H^{p,q}.
- **tauceti:TauCeti.Hodge.HodgeStructureOn.weilOperator_apply_of_mem**, TauCeti/Geometry/Hodge/WeilOperator.lean:88: C acts on the p-th piece of weight n by i^{2p−n}.
- **tauceti:TauCeti.Hodge.complexificationConjugation**, TauCeti/Geometry/Hodge/Conjugation.lean:84: The conjugation of a complexification ℂ ⊗ V.
- **tauceti:TauCeti.Hodge.tate**, TauCeti/Geometry/Hodge/Tate/Basic.lean:90: The Tate Hodge structure ℤ(m), of type (−m, −m).
- **tauceti:TauCeti.LocalCoefficientSystem**, TauCeti/AlgebraicTopology/LocalCoefficient.lean:41: FundamentalGroupoid X ⥤ ModuleCat R; transport, constant and pullback API. Does not itself supply a holomorphic flat bundle.
- **tauceti:TauCeti.ReductiveCommHopfAlgCat**, TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:140: Full subcategory of reductive finite-type commutative Hopf algebras; smooth geometrically connected groups with no geometric unipotent radical.
- **mathlib:AddValuation**, Mathlib/RingTheory/Valuation/Basic.lean:1078: The existing additive valuation carrier: valuations into an ordered additive monoid with top; zero maps to top, one to zero, products add, and sums satisfy the ultrametric bound.
- **mathlib:AddValuation.map_mul**, Mathlib/RingTheory/Valuation/Basic.lean:1158: Products add their valuations.
- **mathlib:AddValuation.map_le_add**, Mathlib/RingTheory/Valuation/Basic.lean:1171: A common lower valuation bound for two summands is a lower bound for their sum.
- **mathlib:AddValuation.map_inv**, Mathlib/RingTheory/Valuation/Basic.lean:1288: The valuation of an inverse is the negative of the original valuation.
- **mathlib:AddValuation.map_zero**, Mathlib/RingTheory/Valuation/Basic.lean:1150: Zero has top valuation.

## Acceptance and validation

The six layer lists must collectively preserve full conjugacy classes, the single Hodge sign convention, the Q/real-factor distinction, and the separate rational and adelic level predicates. Every definition/construction has at least three API items and three examples. All named packet declarations, API items and test labels occur in the suggested file. Its actual orbit constructors retain the product, torus, GL₂, symplectic-similitude, Hilbert and common-determinant point groups; its local calculation uses the existing AddValuation carrier. The file explicitly omits the unavailable algebraic, analytic and connected-adjoint interfaces listed above.

The packet checker against the full pinned declaration index reports zero errors and zero warnings. Source-issue/version checks and path/name reconciliation are clean. The suggested file was not compiled: the shared build has the pinned Mathlib but a different Tau Ceti commit, and the worker rules permit compilation only at both exact pins. No library build or cache operation was run.
