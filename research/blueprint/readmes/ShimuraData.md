# Shimura data, Hermitian domains, and adelic level structures

This roadmap plans the theory of Shimura data that lies beyond what the open TauCetiRoadmap pull requests already state. Revision 4 (job BP-ShimuraData~4, 17 October 2026) follows the maintainer's instruction: Shimura data are treated in full generality — Deligne's axioms, the reflex field, canonical models — with the PEL and Hodge-type cases as specialisations, and ShimuraVarieties and PELModuli, which are open upstream pull requests, own what they state. This document therefore *consumes* their statements and plans only the rest.

The plan has 53 declaration-sized nodes in six layers, all **planned** and none closed; every node keeps implementation status *unchecked*. Seventy-four nodes of revision 3 are superseded by upstream statements of the same targets; each is listed below with its owner, and the 126 prerequisites in seven other packets that cited them are listed in the packet's `consumerRetargets`. A restructure proposal (end of this document) reverses the atlas edges to ShimuraVarieties and PELModuli and merges D0 into D5 and D2 into D3.

## Scope and ownership

**What the upstream pull requests own, and this roadmap consumes.**

- ShimuraVarieties (TauCetiRoadmap pull request #933, read at head 1dd09ed7a8), §§P.1–P.5, constructed before its Layer 0: `TauCeti.Shimura.PureDatum` (a connected reductive `ℚ`-group with a nonempty full `G(ℝ)`-class of algebraic `h : S → G_ℝ` satisfying SV1–SV3; morphisms; products; adjoint data and the connected convention (C1)–(C3); special pairs and points; Hodge type; abelian type; central-isogeny lifts), the Hermitian components (§P.2), the representation–Hodge dictionary, holomorphic and polarized homogeneous variations, the Borel embedding, the cocharacter class and the reflex field `E(D)` with finiteness and functoriality (§P.3), levels, effective stabilizers and the GL₂, genus-`g` Siegel and torus examples (§P.4), and maximal tori through `h` (§P.5). Canonical models are its §§4.4 (the canonical-model condition), 4.12 (uniqueness) and 7.14 (existence for every pure datum); CM types are §5.1.
- PELModuli (pull request #966, head 7577fe7ccc): §M0.12 `RationalPELDatum.toShimuraDatum` and `siegelMorphism`; §M5.4 the scalar-determinant Hilbert datum, `hilbertPairing` and `hilbertTraceEmbedding`; §M5.1 the Siegel PEL data.
- ReductiveGroupsPartII (pull request #785, head f24efef614): Weil restriction and the Deligne torus (§RG2.0a.3); the GSp₄ lattices, corrected base and self-duality in Pilloni's coordinates (§RG2.5); the pro-unipotent Iwahori (§RG2.3).
- AdelicAlgebraicGroups (pull request #792, head 241d5d6a9b): functoriality and discreteness of adelic points (§1.3), restriction of scalars on adelic points (§1.4), compactness of anisotropic arithmetic quotients (§3.4), neat elements and levels and the distance of `p`-adic roots of unity from one (§4.3).
- ArithmeticLocallySymmetricSpaces (pull request #871, head e7e16145f2): real points as Lie groups (§ALS.F.1) and Cartan involutions (§§ALS.0.1–0.2).
- AbelianSchemesAndArithmeticModuli (pull request #849): the polarized Hodge structure `H¹(A, ℚ)` of a complex abelian variety (§§A5.2, A5.5).

In the atlas these upstream roadmaps are still represented by the proposed roadmaps of the same names, so the packet cites them through their atlas stages: ShimuraVarieties §§P.1–P.5 through `ShimuraVarieties:V0` (the layer those sections precede), PELModuli through `PELModuli:M0` and `PELModuli:M5`, the others through their own stage ids; each citation has a supplier request naming the exact upstream section.

**What this roadmap owns.** The rational-weight criterion; Mumford–Tate groups, their connectedness and reductivity, and Hodge genericity (D1). Uniqueness of the complex structure on `X` (D2). Variations of Hodge structure in general, with morphisms and rational and integral polarizations; the filtration parabolic; the compact dual and its descent to the reflex field; Kostant representatives and the integral Bruhat and Schubert geometry of `P\G` (D3). The additional axioms SV2\*, SV4, SV5, SV6, the SV5 criterion, PEL type, the PEL–Hodge–abelian–preabelian implications, preabelian type, and the lifting of connected data to full data (D4). The restriction-of-scalars Hilbert datum and its comparison with the scalar-determinant datum, the Siegel compact dual, the Siegel and genus-two coordinate dictionaries, adelic neatness and the unipotent-Iwahori neatness criterion (D5). The two Hilbert point comparisons (D0).

## Conventions

- `S = Res_{ℂ/ℝ} G_m` is ReductiveGroupsPartII §RG2.0a.3's Deligne torus; over `ℂ` a real point `z` maps to `(z, z̄)`. Type `(p,q)` means the split character `(−p,−q)`: `h_ℂ(z₁,z₂)` acts on `V^{p,q}` by `z₁^{−p} z₂^{−q}`, and `μ_h(z) = h_ℂ(z,1)`. The weight `w = d ∘ inv` acts on a pure weight-`n` piece by `tⁿ`; `ℚ(1)` has type `(−1,−1)` and character `Nm`; elliptic homology has types `(−1,0), (0,−1)`. This is ShimuraVarieties §P.3's homology convention.
- The Hodge filtration is `F^a = ⊕_{p ≥ a} V^{p,q}`; its stabilizer is `P(μ_h⁻¹)` for the convention `P(λ) = {g : lim_{t→0} λ(t) g λ(t)⁻¹ exists}`.
- A pure datum has no distinguished base point; SV1–SV3 are ShimuraVarieties §P.1's. SV2\* asks `Int h(i)` to be Cartan on `G_ℝ/w_X(G_m)`, SV4 that `w_X` be defined over `ℚ`, SV5 that `Z(ℚ)` be discrete in `Z(𝔸_f)`, SV6 that `Z°` split over a CM field (Milne SVI p.63). In Deligne's numbering SV1–SV4 and SV2\* are 2.1.1.1–2.1.1.5 (Milne SVI p.66).
- Kostant representatives are for left cosets `W_M \ W`, with the left action `(wκ)(t) = κ(w⁻¹ t w)`; `w ∈ ^M W` iff `w⁻¹ Φ_M⁺ ⊂ Φ⁺`. Flag schemes are left-coset quotients `P\G`; the compact dual of the Borel embedding is the right-coset `G/P`, identified by inversion.
- Neatness is measured in a faithful algebraic representation (AdelicAlgebraicGroups §4.3). For `Res_{F/ℚ} G` the eigenvalues include all Galois conjugates, so neatness over `ℚ` is stronger than over `F`; this is why the Iwahori criterion needs every place above one prime (E17).

## Generality: axioms, reflex field, canonical models, PEL and Hodge type

Deligne's definition of a Shimura datum is used without restriction to PEL, Hodge or abelian type: `TauCeti.Shimura.PureDatum` of ShimuraVarieties §P.1 imposes SV1–SV3 only, and the further conditions are separate predicates (D4/additional-axioms). The reflex field `E(G,X)` is the field of definition of the conjugacy class of `μ_h` (ShimuraVarieties §P.3); D3/reflex-flag-descent descends the compact dual to it as the variety of parabolics of the Galois-stable type, without assuming a rational representative. Canonical models — the condition (§4.4), uniqueness (§4.12) and existence for every pure datum (§7.14) — are ShimuraVarieties'; nothing about them is planned again here, and the predicates of D4 are the hypotheses their consumers impose. The specialisations are predicates with witnesses: PEL type through PELModuli §M0.12's Shimura datum of a PEL datum (D4/pel-type), Hodge type and abelian type as in ShimuraVarieties §P.1, and preabelian type as in Hansen–Johansson (D4/preabelian-type), with PEL ⇒ Hodge ⇒ abelian ⇒ preabelian and no converse (D4/type-implications). D4/connected-datum-lift shows that nothing is lost by working with full data: every connected datum is the connected datum of a full datum satisfying every axiom.

## Layer overview

| Layer | Atlas title | This revision | Nodes | Planets | Coverage |
| --- | --- | --- | ---: | ---: | --- |
| [D0](#d0) | Restriction of scalars and topological points | Points of the Hilbert groups | 2 | 1 | planned |
| [D1](#d1) | The Deligne torus and Hodge structures | Rational weight, Mumford–Tate groups and Hodge genericity | 5 | 2 | planned |
| [D2](#d2) | Real reductive groups and Hermitian domains | Uniqueness of the complex structure | 1 | 1 | planned |
| [D3](#d3) | Homogeneous variations and compact duals | Variations, compact duals and Kostant–Bruhat geometry | 18 | 5 | planned |
| [D4](#d4) | Data, morphisms, and distinguished classes | Generality of data: additional axioms, PEL type and lifting | 6 | 5 | planned |
| [D5](#d5) | Levels and explicit examples | Explicit data, coordinates and neatness | 21 | 5 | planned |

The register has 53 nodes: 11 definitions, 8 constructions, 20 lemmas and 14 theorems, with 68 API items, 58 unit tests, 19 planets, 22 checked baseline declarations, 25 supplier requests and 8 recorded gaps.

## Sources and pinned baseline

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every baseline declaration below was read in its source file at these commits.

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) — J. S. Milne; Author notes, 2017 edition. Read: §1 pp.10–12,15–18; §2 pp.23–31; §3 pp.32,34; §4 pp.44–45; §5 pp.54–59; §5 pp.63–64; §6 pp.67–69; §9 pp.91–95; §12 pp.111–113; Complements A, Lemmas A.5–A.6 p.155; Re-read 2026-10-17 (BP-ShimuraData~4): Proposition 5.9 p.56; §5 Additional axioms, Example 5.24, Theorem 5.26, Remark 5.27 and Notes pp.63–66; §8 PEL data and PEL Shimura data pp.82–88. SHA-256: f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e.
- [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf) — Pierre Deligne; Published Proc. Symp. Pure Math. 33 II (1979), IAS scan. Read: Introduction pp.247–248; §1.1 pp.251–256; §2.1 pp.265–267. SHA-256: 591ee837c4c87e5263b76427b393742e111d615c6e098c940f132519a0861922.
- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) — George Boxer; Vincent Pilloni; Author copy 2025-11-05; published Invent. Math. 244 (2026) version not accessible here. Read: §1.1 p.2; §1.3 pp.3–5; §3.1 pp.33–34; §6.1 p.60. SHA-256: af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6.
- [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1) — George Boxer; Vincent Pilloni; arXiv:2110.10251v1 (2021). Read: §3.1 pp.31–32, especially Lemma 3.1.2. SHA-256: 85526b90c48d0955f2a042f63d619a22584e3801391934504563994733d58596.
- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) — Frank Calegari; David Geraghty; Publisher-typeset Duke Math. J. advance-publication PDF, ©2019, DOI 10.1215/00127094-2019-0044, pp.1–96, hosted on author site; final volume/issue/page numbers unassigned in this copy. Read: §§2.1–2.2, PDF pp.7–11; §5.3/Theorem 5.5 proof, PDF pp.28–29. SHA-256: fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5.
- [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) — Vincent Pilloni; Author copy 2019-06-17, 113 pages; published Duke version not accessible here. Read: §5.1.1 p.20; §5.1.2–5.1.6 pp.21–24; §15.2.1 pp.107–108. SHA-256: 4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58.
- [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://par.nsf.gov/servlets/purl/10200187) — Benjamin Bakker; Bruno Klingler; Jacob Tsimerman; Published JAMS 33 (2020), NSF copy. Read: §1.3, published pp.920–921 (PDF pp.4–5); §2.1, published pp.922–923 (PDF pp.6–7). SHA-256: b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058.
- [The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) — Olivier Benoist; Published Publ. Math. IHÉS 130 (2019), pp.63–110. Read: §6.2, published pp.93–95, especially Proposition 6.6 proof p.94 (PDF p.32). SHA-256: 8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b.
- [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) — George Boxer; Frank Calegari; Toby Gee; Vincent Pilloni; Published Publ. Math. IHÉS 134 (2021), pp.153–501. Read: Definition 3.2.1 pp.201–202; Lemma 7.8.3 p.409. SHA-256: b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af.
- [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf) — David Masser; Umberto Zannier; Published Annals of Math. 191 (2020), pp.635–674. Read: §1 (Introduction), p.637, paragraph preceding Theorem 1.1. SHA-256: 8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60.
- [Completed cohomology and preabelian type Shimura varieties](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content) — David Hansen; Christian Johansson; Published J. Lond. Math. Soc. 107 (2023), §4.1 p.1980 (PDF p.27), DOI 10.1112/jlms.12799; public MPG copy. Read: §4.1, p.1980 (PDF p.27), Definition 4.1 and preceding Hodge/abelian-type definitions. SHA-256: 24fa8fb4040cb374d90fd9fafc7d086027312eb16a1dfc6e37f65ded817f4cdf.
- [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf) — J. S. Milne; Published Handbook of Moduli, Vol. II (2013), author-hosted typeset chapter; printed pagination. Read: §6, definition of Mumford–Tate groups and connectedness, p.494; §6, Propositions 6.3–6.4 and Corollary 6.5, p.495; Re-read 2026-10-17 (BP-ShimuraData~4): §8, Proposition 8.1 p.509, Proposition 8.8 and Corollary 8.9 pp.512–513. SHA-256: 7237c2a4dda0727923d4ec3d9c6ca8aac6e618ed90be3fa3c6ba34f79b94aaaa.

Baseline declarations:

- `mathlib:AddValuation` (`Mathlib/RingTheory/Valuation/Basic.lean`): The existing additive valuation carrier: valuations into an ordered additive monoid with top; zero maps to top, one to zero, products add, and sums satisfy the ultrametric bound.
- `mathlib:AddValuation.map_inv` (`Mathlib/RingTheory/Valuation/Basic.lean`): The valuation of an inverse is the negative of the original valuation.
- `mathlib:AddValuation.map_le_add` (`Mathlib/RingTheory/Valuation/Basic.lean`): A common lower valuation bound for two summands is a lower bound for their sum.
- `mathlib:AddValuation.map_mul` (`Mathlib/RingTheory/Valuation/Basic.lean`): Products add their valuations.
- `mathlib:AddValuation.map_zero` (`Mathlib/RingTheory/Valuation/Basic.lean`): Zero has top valuation.
- `mathlib:IsDedekindDomain.FiniteAdeleRing` (`Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean`): Restricted product of finite completions with their integral subrings, with ring and topology instances and the canonical fraction-field algebra map. For ℤ and ℚ this is the existing rational finite-adele carrier.
- `mathlib:Matrix.GeneralLinearGroup.map` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`): A homomorphism of commutative rings induces the corresponding group homomorphism on finite square general linear groups.
- `mathlib:Matrix.GeneralLinearGroup.toLin` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`): Multiplicative equivalence from invertible matrices to invertible linear maps on coordinate functions, used to define the inverse-image Lagrangian.
- `mathlib:Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`): Native star-unitary matrix group, specialized to 2×2 complex matrices in the centralizer isomorphism.
- `mathlib:NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean`): A totally complex quadratic extension of its maximal real subfield; the field over which SV6 asks the connected centre to split.
- `mathlib:NumberField.IsTotallyReal` (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`): A field all of whose infinite places are real; the hypothesis on F for the Hilbert groups.
- `mathlib:NumberField.RingOfIntegers` (`Mathlib/NumberTheory/NumberField/Basic.lean`): Integral closure of ℤ in F, with its commutative domain structure; supplies the ring for finite places and finite adeles.
- `mathlib:RootPairing` (`Mathlib/LinearAlgebra/RootSystem/Defs.lean`): Perfectly paired root/coroot modules with their reflection permutations; the GSp and Borel identifications remain R7 inputs.
- `mathlib:RootPairing.Base` (`Mathlib/LinearAlgebra/RootSystem/Base.lean`): Simple-root support, linear independence and positive-or-negative generation for the native root pairing.
- `mathlib:RootPairing.Base.IsPos` (`Mathlib/LinearAlgebra/RootSystem/Base.lean`): Positivity with respect to the supplied base, defined by positive root height.
- `mathlib:RootPairing.weylGroup` (`Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean`): Subgroup of root-pairing automorphisms generated by reflections; the standard-representation permutation and Levi/length comparisons remain R7 inputs.
- `tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra` (`TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean`): The coordinate Hopf algebra of GL_n over a commutative ring, the determinant localization of the matrix coordinate ring with its comultiplication, counit and antipode; the ambient group of the Mumford–Tate subgroup.
- `tauceti:TauCeti.Hodge.IsPolarization` (`TauCeti/Geometry/Hodge/Polarization.lean`): Native integral Hodge–Riemann predicate on a ℤ-bilinear form: weight parity, integral nondegeneracy Q.Nondegenerate, filtration orthogonality and i^(p−q) positivity on each pure piece. It does not impose unimodularity, and is not a predicate directly on rational bilinear forms.
- `tauceti:TauCeti.HopfIdeal.ker` (`TauCeti/Algebra/HopfAlgebra/Kernel.lean`): The kernel of a Hopf algebra morphism with flat kernel quotient (automatic over a field) as a Hopf ideal, with ker_toIdeal identifying its ideal with the ring-hom kernel; used for the Mumford–Tate ideal.
- `tauceti:TauCeti.LocalCoefficientSystem` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`): FundamentalGroupoid X ⥤ ModuleCat R; transport, constant and pullback API. Does not itself supply a holomorphic flat bundle.
- `tauceti:TauCeti.geometricallyConnectedCommHopfAlgProperty` (`TauCeti/Algebra/AlgebraicGroup/Connected/CommHopfAlgCat.lean`): Geometric connectedness of a commutative Hopf algebra: its prime spectrum stays connected after every field extension. Used to state the separate MT connectedness target; it does not prove connectedness.
- `tauceti:TauCeti.reductiveCommHopfAlgProperty` (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`): Reductivity predicate on finite-type commutative Hopf algebras, including smoothness, geometric connectedness and trivial connected normal smooth unipotent subgroups of the geometric fiber. Used to state the separate MT reductivity target; it does not prove reductivity.

<a id="d0"></a>

## D0. Points of the Hilbert groups

The restriction of scalars, the Deligne torus and the topology of points are owned upstream: ReductiveGroupsPartII §RG2.0a.3 constructs `S = Res_{ℂ/ℝ} G_m` with `realPointsMulEquiv`, its homeomorphism `isHomeomorph_realPointsMulEquiv`, the splitting `z ↦ (z, z̄)` (`complexSplitting_real`) and the conjugation `(z₁, z₂) ↦ (z̄₂, z̄₁)` (`conj_swap`); ArithmeticLocallySymmetricSpaces §ALS.F.1 makes the real points of a linear algebraic group a real Lie group with Lie algebra `Lie(H)`; AdelicAlgebraicGroups §§1.3–1.4 give functoriality of adelic points and the restriction-of-scalars isomorphism `Res_{E/F}G(𝔸_F) ≅ G(𝔸_E)`. These are exactly the conclusions the earlier D0 prototypes had to restore, so the nodes `deligne-points-topology`, `deligne-lie-points` and `datum-map-points` are superseded (see *Superseded targets*). What remains here is the application to the two Hilbert groups `G = Res_{F/ℚ} GL₂` and `G* = G ×_{Res G_m} G_m`, which D5 uses.

**Dependencies.** Within this roadmap: none. Other roadmaps: `AdelicAlgebraicGroups:AA.1`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `ReductiveGroupsPartII:RG2.0a`.

**Remaining refinements.** The Deligne-torus point comparison, the Lie structure of real points and the point maps of datum morphisms are owned upstream (ReductiveGroupsPartII §RG2.0a.3, ArithmeticLocallySymmetricSpaces §ALS.F.1, AdelicAlgebraicGroups §1.3); the layer keeps the two Hilbert-group point comparisons, and the restructure proposal moves them into D5.

<a id="d0-hilbert-real-points"></a>

### Real points of the Hilbert groups

Node `ShimuraData:D0/hilbert-real-points` (theorem). Lean name: `TauCeti.Shimura.hilbertRealPoints`.

Let F be a totally real number field of degree d with real embeddings σ₁,…,σ\_d, G=Res_{F/ℚ}GL₂ and G\*=G×\_{Res_{F/ℚ}G_m}G_m the fibre product of det:G→Res_{F/ℚ}G_m with the diagonal G_m→Res_{F/ℚ}G_m. The Weil-restriction point comparison gives G(ℝ)=GL₂(F⊗\_ℚℝ), and the ℝ-algebra isomorphism F⊗\_ℚℝ≅ℝ^d, x⊗r↦(σ\_i(x)r)_i, identifies it with ∏\_i GL₂(ℝ), sending a∈GL₂(F) to (σ₁(a),…,σ\_d(a)). Under this identification G\*(ℝ) is the set of tuples (g_i) whose determinants all equal one t∈ℝ^×, of either sign. Both identifications are isomorphisms of real Lie groups; G(ℝ) has 2^d connected components, indexed by the signs of the d determinants, and G\*(ℝ) has exactly two.

Hypotheses and conventions:

- F is a totally real number field of degree d≥1; G and G\* are as stated, with G\* the fibre product over Res_{F/ℚ}G_m.
- Weil restriction and its point comparison are ReductiveGroupsPartII §RG2.0a's (WeilRestriction.pointsMulEquiv); the archimedean local factor of restriction of scalars is AdelicAlgebraicGroups §1.4's; the Lie group structure on real points is ArithmeticLocallySymmetricSpaces §ALS.F.1's (realPoints_lieGroup).

Proof or construction:

1. RG2.0a gives G(ℝ)=GL₂(F⊗\_ℚℝ), naturally in the coefficient algebra.
2. Because F is totally real, x⊗r↦(σ\_i(x)r)_i is an ℝ-algebra isomorphism F⊗\_ℚℝ≅ℝ^d (the archimedean case of AA §1.4's local factors); GL₂ of a finite product of rings is the product of the GL₂'s.
3. Points of a fibre product are the fibre product of the points, and the diagonal G_m(ℝ)→(Res_{F/ℚ}G_m)(ℝ)=(ℝ^×)^d is the scalar embedding, so G\*(ℝ) consists of the tuples with a common determinant t.
4. GL₂(ℝ) has the two components det>0 and det<0, so G(ℝ) has 2^d. For a fixed sign of t, dividing every g_i by |t|^{1/2} and, when t<0, multiplying by one fixed element of determinant −1 identifies {(g_i): det g_i=t for all i} with ℝ\_{>0}×∏\_iSL₂(ℝ), which is connected; hence G\*(ℝ) has two components.
5. ALS.F.1 applied to the closed embeddings G_ℝ⊂GL_{2d,ℝ} and G\*_ℝ⊂G_ℝ makes the identifications isomorphisms of real Lie groups.

Acceptance:

- For F=ℚ, G=G\*=GL₂ and both identifications are the identity of GL₂(ℝ).
- For F=ℚ(√2), G(ℝ)=GL₂(ℝ)×GL₂(ℝ) has four components; the pair (I₂,diag(1,−1)) lies in G(ℝ) but not in G\*(ℝ), whose two components consist of the pairs with determinants of a common sign.
- For F=ℚ(√2) the rational element diag(√2,1)∈GL₂(F) goes to (diag(√2,1),diag(−√2,1)), whose determinants have opposite signs; diag(√2,√2) goes to a pair with common determinant 2.

Direct prerequisites: `ReductiveGroupsPartII:RG2.0a`; `AdelicAlgebraicGroups:AA.1`; `ArithmeticLocallySymmetricSpaces:ALS.0`; `mathlib:NumberField.IsTotallyReal`; `mathlib:Matrix.GeneralLinearGroup.map`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64. For a quaternion algebra B over a totally real F, Milne tabulates B⊗\_ℚℝ and G(ℝ) factor by factor over the real embeddings, with GL₂(ℝ) and the standard h at each split place; the split case B=M₂(F) is this node's G, and the common-determinant condition is the fibre product added here.

Planet: Real points of the Hilbert groups.

<a id="d0-hilbert-adelic-points"></a>

### Finite-adelic points of the Hilbert groups

Node `ShimuraData:D0/hilbert-adelic-points` (theorem). Lean name: `TauCeti.Shimura.hilbertAdelicPoints`.

For the same F, AdelicAlgebraicGroups §1.4 (restriction of scalars on adelic points) identifies G(𝔸\_{ℚ,f})=GL₂(F⊗\_ℚ𝔸\_{ℚ,f}) with GL₂(𝔸\_{F,f}) as topological groups, carrying the diagonal image of G(ℚ)=GL₂(F) to the diagonal image of GL₂(F), naturally in algebraic group maps. Under it G\*(𝔸\_{ℚ,f}) is the closed subgroup of g∈GL₂(𝔸\_{F,f}) with det g in the image of 𝔸\_{ℚ,f}^×→𝔸\_{F,f}^×, and G\*(ℚ) is the subgroup of GL₂(F) with determinant in ℚ^×. Every compact open subgroup of G\*(𝔸\_{ℚ,f}) is V∩G\*(𝔸\_{ℚ,f}) for some compact open subgroup V⊂GL₂(𝔸\_{F,f}), and every such intersection is compact open in G\*(𝔸\_{ℚ,f}). Nothing is asserted about discreteness of G(ℚ) or G\*(ℚ) in the finite adeles.

Hypotheses and conventions:

- F, G and G\* are as in D0/hilbert-real-points.
- The adelic restriction-of-scalars isomorphism (base-change-adelic) is AdelicAlgebraicGroups §1.4's; functoriality of adelic points under the determinant and the diagonal is §1.3's.

Proof or construction:

1. AA §1.4 gives the topological isomorphism together with its diagonal and naturality clauses.
2. Apply AA §1.3's functoriality to det:G→Res_{F/ℚ}G_m and to the diagonal G_m→Res_{F/ℚ}G_m; points of the fibre product are the fibre product of points, giving the determinant locus. It is closed because both maps are continuous and the ideles are Hausdorff.
3. Compact opens: given a compact open subgroup U of G\*(𝔸\_{ℚ,f}), pick a compact open subgroup V₀ of GL₂(𝔸\_{F,f}) with V₀∩G\*⊂U and normalized by U (intersect the finitely many U-conjugates of a small V₀, U being compact and open in G\*); then V=UV₀ is a compact open subgroup with V∩G\*=U(V₀∩G\*)=U. Conversely V∩G\* is open in G\*, and compact because G\* is closed.
4. No discreteness is claimed: G\*(ℚ) contains the infinite group SL₂(O_F), which lies in the compact open GL₂(Ô\_F)∩G\*.

Acceptance:

- For F=ℚ both groups are GL₂ and the identification is the identity of GL₂(𝔸\_{ℚ,f}).
- For F=ℚ(√2), diag(√2,√2)∈GL₂(F) has determinant 2∈ℚ^× and lies in G\*(ℚ); diag(√2,1) has determinant √2∉ℚ and lies in G(ℚ) but not in G\*(ℚ).
- For V=GL₂(Ô\_F), V∩G\*(𝔸\_{ℚ,f}) is the group of integral matrices whose determinant lies in the image of Ẑ^×.

Direct prerequisites: `ReductiveGroupsPartII:RG2.0a`; `AdelicAlgebraicGroups:AA.1`; `mathlib:IsDedekindDomain.FiniteAdeleRing`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64; §5, compact open levels in G(𝔸\_f), pp.57–58. Milne's quaternion example gives the group G with G(ℚ)=B^×, which for B=M₂(F) is GL₂(F); the levels of the Shimura variety are compact open subgroups of G(𝔸\_f). The base-change comparison and the determinant locus of G\* are supplied by the adelic-groups roadmap and the fibre product, not by this page.

<a id="d1"></a>

## D1. Rational weight, Mumford–Tate groups and Hodge genericity

ShimuraVarieties §P.3 states the representation–Hodge dictionary in the homology convention (type `(p,q)` is the split character `(−p,−q)`, `μ_h(z) = h_ℂ(z,1)`), with its conjugation, tensor, dual and Tate compatibilities; the twenty-two D1 nodes that planned that dictionary and its test objects are superseded by it. This layer keeps what no upstream roadmap states: the criterion for the weight to be rational, the Mumford–Tate group of a rational Hodge structure with its connectedness and, under polarizability, reductivity, and Hodge genericity of a polarized abelian variety (Masser–Zannier). The Mumford–Tate group is the Zariski closure over `ℚ` of the image of `h`: the kernel of `O(GL(V)) → O(S)` is a Hopf ideal (Tau Ceti's `HopfIdeal.ker` over a field), and its quotient is `MT(V)`. HodgeStructures L0 supplies rational Hodge structures and L1 polarization and semisimplicity (RT-AREA-algebraicgeometry/27).

**Dependencies.** Within this roadmap: none. Other roadmaps: `AbelianSchemesAndArithmeticModuli:A5`, `ReductiveGroupsPartII:RG2.0a`, `ShimuraVarieties:V0`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Remaining refinements.** Mumford–Tate and genericity proof inputs (gap): finite-type subgroup representability for the Mumford–Tate quotient and the elliptic endomorphism-to-Mumford–Tate classification remain explicit supplier leaves. Suggested signatures state the Mumford–Tate ideal on Tau Ceti's GL coordinate ring and the complexified split torus; the real structure of S is not at the pins and is omitted openly.

<a id="d1-rational-weight-criterion"></a>

### Rational weight criterion

Node `ShimuraData:D1/rational-weight-criterion` (lemma). Lean name: `TauCeti.Shimura.rationalWeightCriterion`.

For a finite-dimensional rational V with an algebraic real S-action h, its weight w_h=h∘(inverse diagonal) descends to a ℚ-cocharacter of GL(V) if and only if the real weight decomposition is the scalar extension of an internal finite ℚ-grading. The rational grading acts by t^n on weight n. The full homomorphism h need not descend to ℚ.

Hypotheses and conventions:

- V is a finite-dimensional ℚ-vector space with an algebraic homomorphism h:S→GL(V)_ℝ; S and its weight cocharacter w=d∘inv are ReductiveGroupsPartII §RG2.0a.3's, and type (p,q) means the split character (−p,−q), as in ShimuraVarieties §P.3's representation–Hodge dictionary.

Proof or construction:

1. A rational Gm-action has rational eigenspaces. Conversely a rational grading defines t↦tⁿ on its rational summands, whose real extension is h∘w.

Acceptance:

- For a finite-dimensional rational V with an algebraic real S-action h, its weight w_h=h∘(inverse diagonal) descends to a ℚ-cocharacter of GL(V) if and only if the real weight decomposition is the scalar extension of an internal finite ℚ-grading. The rational grading acts by t^n on weight n. The full homomorphism h need not descend to ℚ.
- The signature concludes this named comparison on the specified constructed object; it does not take that conclusion as a premise.

Direct prerequisites: `ReductiveGroupsPartII:RG2.0a`; `ShimuraVarieties:V0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Homomorphisms S→GL(V), p.26. The passage says a rational Hodge structure corresponds to an S-action whose weight map is rational. R4 supplies the rational Gm eigenspace dictionary.

<a id="d1-mumford-tate-group"></a>

### Mumford–Tate group

Node `ShimuraData:D1/mumford-tate-group` (construction). Lean name: `TauCeti.Shimura.mumfordTateGroup`.

Let V be a finite-dimensional ℚ-vector space and h:S→GL(V)_ℝ an algebraic homomorphism with weight defined over ℚ (a rational Hodge structure, D1/rational-weight-criterion). Let I_MT⊂O(GL(V)) be the kernel of the ℚ-algebra map O(GL(V))→O(GL(V))⊗\_ℚℝ→O(S) given by h. Then I_MT is a Hopf ideal, and MT(V)=Spec(O(GL(V))/I_MT) is the smallest ℚ-algebraic subgroup of GL(V) whose real extension contains h(S): a Hopf ideal I satisfies h(S)⊂V(I)_ℝ exactly when I⊂I_MT. The same ideal is the kernel of the complexified split map O(GL(V))→O(S_ℂ)=ℂ\[z₁^{±1},z₂^{±1}]. The image of the weight cocharacter lies in MT(V) and is trivial in weight zero. MT uses the whole S-map, not its restriction to the norm-one circle.

Hypotheses and conventions:

- V is finite-dimensional over ℚ with an algebraic real S-map h whose weight is rational; no polarizability is required.
- O(GL(V)) is Tau Ceti's GL coordinate Hopf algebra (TauCeti.GeneralLinear.coordinateHopfAlgebra) after a choice of basis; the result is independent of the basis (mumfordTateIsomorphism).

Proof or construction:

1. h is a homomorphism of real algebraic groups, so h\*:O(GL(V))⊗ℝ→O(S) respects comultiplication, counit and antipode; I_MT is the kernel of its restriction to O(GL(V)).
2. Over the field ℚ the kernel of a map respecting the Hopf operations is a Hopf ideal: the comultiplication of f∈I_MT maps to Δ\_S(h\*f)=0, and over a field ker(h\*⊗h\*)=I_MT⊗O+O⊗I_MT (Tau Ceti's HopfIdeal.ker and ker_lTensor_eq_rightTensorIdeal); the counit and antipode conditions are immediate.
3. Minimality: for a Hopf ideal I, h factors through V(I)_ℝ iff h\* kills I⊗ℝ iff h\* kills I (h\* is ℝ-linear and I spans I⊗ℝ) iff I⊂I_MT.
4. O(S)→O(S_ℂ) is injective, so the complexified split map has the same kernel on O(GL(V)).
5. The weight w_h=h∘w is defined over ℚ and factors through h, hence through MT(V).

API:

- `TauCeti.Shimura.mumfordTateMinimal` (universal-property): For any Hopf ideal I of O(GL(V)) killed by h\*, I⊂I_MT; equivalently MT(V) is contained in every ℚ-algebraic subgroup through which h factors.
- `TauCeti.Shimura.mumfordTateHopf` (structure): I_MT is a Hopf ideal: its comultiplication lands in I_MT⊗O+O⊗I_MT, the counit kills it and the antipode preserves it.
- `TauCeti.Shimura.mumfordTateWeight` (compatibility): The rational weight cocharacter factors through MT(V); for the trivial object its image is trivial, and no central G_m is asserted in that case.
- `TauCeti.Shimura.mumfordTateIsomorphism` (compatibility): A ℚ-linear isomorphism V≅V′ intertwining h and h′ carries I_MT to I′\_MT under the induced Hopf isomorphism of coordinate rings.
- `TauCeti.Shimura.mumfordTateComplexified` (characterisation): I_MT is the kernel of the ℚ-algebra map O(GL(V))→ℂ\[z₁^{±1},z₂^{±1}] given by the complexified split action.

Unit tests:

- `TauCeti.Shimura.tests.mtTrivial` (degenerate): For the trivial action on ℚ (n=1), the coordinate X maps to 1, so I_MT=(X−1) and MT is the trivial group.
- `TauCeti.Shimura.tests.mtTate` (computation): For ℚ(1), of type (−1,−1), X maps to z₁z₂, which is injective on ℚ\[X^{±1}]; so I_MT=0 and MT=G_m.
- `TauCeti.Shimura.tests.mtCmElliptic` (non-example): For H₁(ℂ/ℤ\[i],ℚ) in the basis (1,i), X₁₁−X₂₂ and X₁₂+X₂₁ lie in I_MT, so MT is not all of GL₂ (it lies in the torus Res_{ℚ(i)/ℚ}G_m).

Acceptance:

- For any Hopf ideal I of O(GL(V)) killed by h\*, I⊂I_MT; equivalently MT(V) is contained in every ℚ-algebraic subgroup through which h factors.
- I_MT is a Hopf ideal.
- The rational weight cocharacter factors through MT(V); for the trivial object its image is trivial.
- A ℚ-linear isomorphism V≅V′ intertwining h and h′ carries I_MT to I′\_MT under the induced Hopf isomorphism of coordinate rings.
- I_MT is the kernel of the complexified split map O(GL(V))→ℂ\[z₁^{±1},z₂^{±1}].
- MT of the trivial rational line is trivial: X↦1, so I_MT=(X−1).
- MT of ℚ(1) is G_m: X↦z₁z₂ is injective on ℚ\[X^{±1}], so I_MT=0.
- For H₁(ℂ/ℤ\[i],ℚ) with basis (1,i), h(a+bi) has matrix \[\[a,−b],\[b,a]]; X₁₁−X₂₂ and X₁₂+X₂₁ lie in I_MT, so MT is contained in the torus Res_{ℚ(i)/ℚ}G_m and is a proper subgroup of GL₂.

Uses:

- ShimuraData:D1/hodge-generic: Hodge-generic abelian variety consumes mumford–tate group: Any ℚ-algebraic subgroup containing h after real extension contains MT(V).
- LogicAndDefinabilityInNumberTheoryPartII: genericity interfaces: The arithmetic/genericity consumer compares rational MT with the full symplectic similitude group; D1 does not own weakly-special loci or Ax–Schanuel.
- ShimuraVarieties §5.12 (TauCetiRoadmap PR #933): the Mumford–Tate torus criterion for a polarized weight-one Hodge structure decides which Siegel points are special

Direct prerequisites: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`; `ShimuraData:D1/rational-weight-criterion`; `tauceti:TauCeti.HopfIdeal.ker`; `tauceti:TauCeti.GeneralLinear.coordinateHopfAlgebra`; `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition`; `ReductiveGroupsPartII:RG2.0a`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Aside following 2.16, p.31. Defines the smallest rational algebraic subgroup containing h(S); this aside does not explicitly establish connectedness or polarizable reductivity. Those are separately sourced below.
- [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §6, definition of Mumford–Tate groups, p.494. Defines MT as the smallest rational algebraic subgroup through which h factors and explains connectedness. Finite-type Hopf-ideal representability is still the specified R0/R3 proof input.

Planet: Mumford–Tate group.

<a id="d1-mumford-tate-connected"></a>

### Connectedness of the Mumford–Tate group

Node `ShimuraData:D1/mumford-tate-connected` (lemma). Lean name: `TauCeti.Shimura.mumfordTateConnected`.

For any finite-dimensional rational pure Hodge structure V, MT(V) is geometrically connected over ℚ. Polarizability is not required.

Hypotheses and conventions:

- V is finite-dimensional over ℚ; h is the algebraic real S-map of its pure Hodge structure. The characteristic-zero component-group comparison is the R3 input.

Proof or construction:

1. In characteristic zero the rational identity component is a normal ℚ-subgroup with finite component quotient. Connected S maps trivially to that finite quotient after real extension. Its preimage therefore contains h, so minimality forces MT(V) to equal its identity component.

Acceptance:

- For any finite-dimensional rational pure Hodge structure V, MT(V) is geometrically connected over ℚ. Polarizability is not required.

Direct prerequisites: `ShimuraData:D1/mumford-tate-group`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCeti.geometricallyConnectedCommHopfAlgProperty`.

Sources:

- [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §6, definition of Mumford–Tate groups, p.494. Minimality allows replacement by the identity component, proving connectedness. The scheme-theoretic component and scalar-extension comparison remain R3 inputs.

<a id="d1-mumford-tate-reductive"></a>

### Reductivity of a polarizable Mumford–Tate group

Node `ShimuraData:D1/mumford-tate-reductive` (lemma). Lean name: `TauCeti.Shimura.mumfordTateReductive`.

For a finite-dimensional polarizable rational pure Hodge structure V, the connected group MT(V) is reductive over ℚ.

Hypotheses and conventions:

- V is finite-dimensional and polarizable over ℚ. The H1 semisimplicity and R6 faithful-semisimple-representation criterion are supplier inputs.

Proof or construction:

1. Each rational MT-stable subspace is a Hodge substructure, and H1 semisimplicity gives a rational Hodge complement. Its rational stabilizer contains h, so minimality makes that complement MT-stable. Apply the characteristic-zero reductivity criterion to the faithful semisimple rational representation V (R6).

Acceptance:

- For a finite-dimensional polarizable rational pure Hodge structure V, the connected group MT(V) is reductive over ℚ.

Direct prerequisites: `ShimuraData:D1/mumford-tate-group`; `ShimuraData:D1/mumford-tate-connected`; `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; `tauceti:TauCeti.reductiveCommHopfAlgProperty`.

Sources:

- [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §6, Corollary 6.5, p.495. States reductivity for polarizable rational Hodge structures, with a semisimplicity proof route. The planned proof imports H1 semisimplicity and the R6 faithful-representation criterion.

<a id="d1-hodge-generic"></a>

### Hodge-generic abelian variety

Node `ShimuraData:D1/hodge-generic` (definition). Lean name: `TauCeti.Shimura.hodgeGeneric`.

A polarized complex abelian variety A of dimension g≥1 is Hodge generic if MT(H¹(A,ℚ)) is the full group of symplectic similitudes of its rational polarization. Equality is as ℚ-algebraic subgroups; it is invariant under the chosen symplectic identification. This is not defined merely by End(A)=ℤ.

Hypotheses and conventions:

- A is a polarized complex abelian variety of dimension g≥1; H¹(A,ℚ) with its polarization is the polarized rational Hodge structure of weight one of AbelianSchemesAndArithmeticModuli §§A5.2 and A5.5 (Riemann forms and the polarized Hodge equivalence); MT is D1/mumford-tate-group.

Proof or construction:

1. Use the cohomological polarization with weight +1 and the corresponding similitude target; transport equality through change of symplectic basis.

API:

- `TauCeti.Shimura.hodgeGenericBasis` (compatibility): The predicate is independent of symplectic basis and scaling of the polarization.
- `TauCeti.Shimura.hodgeGenericIsogeny` (compatibility): A rational Hodge isomorphism on H¹ identifies MT by conjugation and transports the symplectic-similitude group, so full-GSp genericity is invariant under an isogeny. Equality of MT groups is derived, not assumed.
- `TauCeti.Shimura.hodgeGenericElliptic` (compatibility): For Eτ=ℂ/(ℤ+τℤ), Im τ>0, genericity is equivalent to absence of a nonzero rational quadratic relation for τ. The CM/non-CM endomorphism-to-MT classification remains an explicit H0/H1 supplier leaf.

Unit tests:

- `TauCeti.Shimura.tests.genericCmFalse` (non-example): For τ=i the actual polarized rational H¹(Eτ) has CM MT and is not Hodge-generic.
- `TauCeti.Shimura.tests.genericNonCmElliptic` (computation): For transcendental τ with Im τ>0, the actual elliptic H¹ is Hodge-generic; no subgroup equality is assumed.
- `TauCeti.Shimura.tests.genericProductFalse` (non-example): For E_i×E_i with product polarization, H¹ has proper MT inside GSp₄ and is not Hodge-generic.

Acceptance:

- The predicate is independent of symplectic basis and scaling of the polarization.
- A rational Hodge isomorphism on H¹ identifies MT by conjugation and transports the symplectic-similitude group, so full-GSp genericity is invariant under an isogeny. Equality of MT groups is derived, not assumed.
- For Eτ=ℂ/(ℤ+τℤ), Im τ>0, genericity is equivalent to absence of a nonzero rational quadratic relation for τ. The CM/non-CM endomorphism-to-MT classification remains an explicit H0/H1 supplier leaf.
- For τ=i the actual polarized rational H¹(Eτ) has CM MT and is not Hodge-generic.
- For transcendental τ with Im τ>0, the actual elliptic H¹ is Hodge-generic; no subgroup equality is assumed.
- For E_i×E_i with product polarization, H¹ has proper MT inside GSp₄ and is not Hodge-generic.

Uses:

- LogicAndDefinabilityInNumberTheoryPartII: weakly special/generic loci: The arithmetic/genericity consumer compares rational MT with the full symplectic similitude group; D1 does not own weakly-special loci or Ax–Schanuel.
- PAPER-MASSER-ZANNIER-20/4: The consumer uses hodge-generic abelian variety through these concrete interfaces: The predicate is independent of symplectic basis and scaling of the polarization. Polarized rational isogenies preserve Hodge genericity.

Direct prerequisites: `ShimuraData:D1/mumford-tate-group`; `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; `AbelianSchemesAndArithmeticModuli:A5`.

Sources:

- [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §1 (Introduction), p.637, paragraph preceding Theorem 1.1. Defines Hodge genericity by the full symplectic-similitude Mumford–Tate group of a polarized abelian variety. The definition is not Corollary 1.2, and it is stronger than a mere endomorphism-ring condition.

Planet: Hodge-generic abelian variety.

<a id="d2"></a>

## D2. Uniqueness of the complex structure

ShimuraVarieties §P.2 constructs the complex structure on `X` from the adjoint Hodge types, proves integrability and invariance, identifies the components with Hermitian symmetric domains and records the compact and central ineffective kernel; ArithmeticLocallySymmetricSpaces §§ALS.0.1–0.2 own Cartan involutions with the Killing criterion and its central-torus clause. The twelve D2 nodes that planned those steps are superseded. The uniqueness half of Milne's Proposition 5.9, which no upstream roadmap states, remains: the complex structure is the only one for which the Hodge filtration of a faithful representation varies holomorphically.

**Dependencies.** Within this roadmap: none. Other roadmaps: `ShimuraVarieties:V0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`.

**Remaining refinements.** Only the uniqueness half of Milne Proposition 5.9 remains here (SV §§P.2–P.3 own the rest); the restructure proposal merges D2 into D3.

<a id="d2-unique-complex-structure"></a>

### Uniqueness of the domain complex structure

Node `ShimuraData:D2/unique-complex-structure` (theorem). Lean name: `TauCeti.Shimura.uniqueComplexStructure`.

Let (G,X) be a pure Shimura datum with the complex structure of ShimuraVarieties §P.2, for which §P.3 makes the Hodge filtration of every representation a holomorphic variation. That complex structure is the only one with this property: if J′ is a complex-manifold structure on the same underlying smooth manifold X for which, for one faithful real representation ρ of G, the filtration map x↦F_x(ρ) into the flag manifold of ρ is holomorphic, then the identity of X is a biholomorphism between J′ and the §P.2 structure. One faithful representation suffices because every representation is a subquotient of tensor constructions on ρ and its dual.

Hypotheses and conventions:

- (G,X) is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (TauCetiRoadmap pull request #933): G connected reductive over ℚ, X a nonempty full G(ℝ)-class of algebraic h:S→G_ℝ satisfying SV1–SV3, with S the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.
- The complex structure on X, its integrability and the holomorphic variations are ShimuraVarieties §§P.2–P.3's; J′ is a complex-manifold structure inducing the given smooth structure.

Proof or construction:

1. The filtration map of a faithful ρ is injective with injective differential (the Borel embedding of ShimuraVarieties §P.3), so it is an immersion of the smooth manifold X into the flag manifold.
2. If it is holomorphic both for J and for J′, its differential intertwines J and J′ with the complex structure of the flag manifold; injectivity of the differential forces J=J′ on every tangent space.
3. Two integrable complex structures with the same almost complex structure have the same local holomorphic functions, so the identity is biholomorphic. Tensor, dual and subquotient constructions transport holomorphicity from ρ to every representation, so the conditions 'for one faithful ρ' and 'for every representation' agree.

Acceptance:

- For the GL₂ datum, the conjugate complex structure on ℍ^± (holomorphic coordinate z̄) makes the filtration map antiholomorphic, so it is excluded.
- For a torus datum X is a point and the statement is trivial.
- The comparison concludes biholomorphy of the identity; it does not assume equality of chart atlases.

Direct prerequisites: `ShimuraVarieties:V0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 5.9 and proof, p.56. Milne's Proposition 5.9 asserts that X has a unique complex-manifold structure for which every representation gives a holomorphic family of Hodge structures, and that each such family is then a variation; the proof reduces to one faithful representation. ShimuraVarieties §P.3 states the existence half; this node is the uniqueness half.

Planet: Uniqueness of the domain complex structure.

<a id="d3"></a>

## D3. Variations, compact duals and Kostant–Bruhat geometry

This layer owns the general notion of a variation of Hodge structure used by Bakker–Klingler–Tsimerman and Benoist (local system, holomorphic filtration of the associated flat bundle, fibrewise opposedness, Griffiths transversality), its morphisms and its rational and integral polarized forms, with the local-frame description of transversality. ShimuraVarieties §P.3 makes the Hodge filtration of every representation of a datum such a variation and states the Borel embedding and the reflex field; those nodes are superseded. Here remain the filtration parabolic `P_h` and the compact dual `X^∨ = G_ℂ/P_h`, its descent to the reflex field as the variety of parabolics of the Galois-stable type, and the Kostant and Bruhat combinatorics of a general `(G, μ)` routed from Boxer–Pilloni: minimal representatives `^M W`, the cone criterion and decomposition, the opposition involution, the integral Bruhat stratification of `P\G` and the Schubert and opposite Schubert loci with `X^w ⊂ Y_w`.

**Dependencies.** Within this roadmap: none. Other roadmaps: `SchemeAndStackFoundations:SF.1`, `ShimuraVarieties:V0`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`.

**Remaining refinements.** Holomorphic flat bundles and connections from local systems (gap). Integral flag geometry over ℤ exceeds the field Bruhat theorem of ReductiveGroups layer 7 (gap; layer 9 request). Representability and descent of the parabolic-type functor for the reflex-field compact dual (gap). Complex-manifold structure of the compact dual G_ℂ/P_h from LieGroups layer 8 (gap narrowed to the compact dual).

<a id="d3-variation"></a>

### Variation of Hodge structure

Node `ShimuraData:D3/variation` (definition). Lean name: `TauCeti.Shimura.Variation`.

On a complex manifold B, a pure real (or rational) variation of weight n is a finite-rank local system L, its associated holomorphic bundle L⊗O_B with flat connection ∇, and a finite bounded decreasing filtration F by holomorphic subbundles. Each fiber has n-opposed conjugate filtrations and ∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹\_B. Morphisms are flat maps preserving F. This includes nonconstant monodromy; it is not just a map into a set of Hodge structures.

Hypotheses and conventions:

- B is a complex manifold; n is an integer; L is a locally constant finite-rank real/rational system. In the integral polarized case its ℤ-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Proof or construction:

1. Use local-system trivializations to glue the flat bundle and filtration; fiber purity is the pinned opposed-filtration condition. The holomorphic bundle/connection infrastructure is explicitly a missing input, not a field of arbitrary propositions.

API:

- `TauCeti.Shimura.variationFiber` (projection): Evaluation returns the native pure Hodge structure on the complexified local-system fiber, including the opposed-filtration identity.
- `TauCeti.Shimura.variationPullback` (functoriality): Holomorphic pullback constructs the entire variation: local system, associated holomorphic flat bundle, induced connection and pulled-back filtration. Its local system agrees with the native fundamental-groupoid pullback.
- `TauCeti.Shimura.variationMk` (constructor): From a finite-rank local system, its glued flat holomorphic bundle and connection, a holomorphic subbundle filtration, opposed fibers and Griffiths transversality, construct the variation.
- `TauCeti.Shimura.variationExt` (extensionality): Two variations on the same base and weight agree when their underlying flat filtered bundles agree; the transversality proofs add no data.

Unit tests:

- `TauCeti.Shimura.tests.variationConstant` (computation): A constant pure Hodge structure with constant filtration is a variation.
- `TauCeti.Shimura.tests.variationElliptic` (computation): The weight-one elliptic family over ℍ has moving F¹ and satisfies transversality.
- `TauCeti.Shimura.tests.variationNonHorizontal` (computation): On a small disk take a constant weight-three rank-four polarized real space with complex basis e₀,e₁,e₂,e₃, conjugation e₀↔e₃,e₁↔e₂, Q(e₀,e₃)=i,Q(e₁,e₂)=−i (skew extended). Put F³(z)=ℂ(e₀+ze₃), F²(z)=F³(z)+ℂe₁ and F¹(z)=F³(z)^⊥. Near 0 the fibers are polarized and the flags holomorphic, but dF³(0)=e₃ mod F³(0) is outside F²(0)/F³(0), so this is not a variation.

Acceptance:

- Evaluation returns the native pure Hodge structure on the complexified local-system fiber, including the opposed-filtration identity.
- Holomorphic pullback constructs the entire variation: local system, associated holomorphic flat bundle, induced connection and pulled-back filtration. Its local system agrees with the native fundamental-groupoid pullback.
- From a finite-rank local system, its glued flat holomorphic bundle and connection, a holomorphic subbundle filtration, opposed fibers and Griffiths transversality, construct the variation.
- Two variations on the same base and weight agree when their underlying flat filtered bundles agree; the transversality proofs add no data.
- A constant pure Hodge structure with constant filtration is a variation.
- The weight-one elliptic family over ℍ has moving F¹ and satisfies transversality.
- On a small disk take a constant weight-three rank-four polarized real space with complex basis e₀,e₁,e₂,e₃, conjugation e₀↔e₃,e₁↔e₂, Q(e₀,e₃)=i,Q(e₁,e₂)=−i (skew extended). Put F³(z)=ℂ(e₀+ze₃), F²(z)=F³(z)+ℂe₁ and F¹(z)=F³(z)^⊥. Near 0 the fibers are polarized and the flags holomorphic, but dF³(0)=e₃ mod F³(0) is outside F²(0)/F³(0), so this is not a variation.

Uses:

- ShimuraVarieties §P.3 Hodge filtrations and reflex fields: Homogeneous Hodge variation consumes variation of hodge structure: Evaluation at b returns the existing pure Hodge structure of weight n. (the consumer is now owned upstream; see supersededNodes)
- BKT period-map definitions: Its period maps require a finite-free integral local system, flat polarization and Griffiths-transverse holomorphic filtration, including nontrivial monodromy.
- Benoist vanishing-cycle subvariation: The H² vanishing-cycle variation supplies the polarized integral carrier; real involution and geometric vanishing-cycle criteria belong to HodgeStructures Part II.

Direct prerequisites: `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition`; `tauceti:TauCeti.LocalCoefficientSystem`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Variations of Hodge structures, pp.28–29. The notes explain general local systems before restricting to constant ones on simply connected Hermitian domains. This node retains general finite-rank monodromy, holomorphic subbundles and the −1 connection condition.

Planet: Variation of Hodge structure.

<a id="d3-variation-morphism"></a>

### Morphism of Hodge variations

Node `ShimuraData:D3/variation-morphism` (definition). Lean name: `TauCeti.Shimura.VariationHom`.

For variations H,K of the same weight over the same complex manifold, a morphism is a map of their finite-rank local systems whose complexification preserves F^p on each fiber and commutes with the induced flat connections. Identity, zero, composition and holomorphic pullback preserve these conditions.

Hypotheses and conventions:

- All local systems are finite rank, scalar-extension comparisons use the specified canonical conjugation, and all analytic comparisons use the named complex-manifold structure.

Proof or construction:

1. Use the native fundamental-groupoid natural transformations. Filtration inequalities and connection squares are preserved by linear identity, zero and composition; naturality is the flat transport condition.

API:

- `TauCeti.Shimura.variationHomMk` (constructor): Bundle the local-system natural transformation, filtration preservation and connection compatibility.
- `TauCeti.Shimura.variationHomExt` (extensionality): Morphisms agree if their underlying local-system natural transformations agree.
- `TauCeti.Shimura.variationHomIdentity` (constructor): The identity variation morphism has the identity local-system map.
- `TauCeti.Shimura.variationMorphism` (functoriality): Compose the underlying local-system maps; filtration and connection compatibility compose.
- `TauCeti.Shimura.variationHomCompMap` (simp): The local-system map of the composite is the categorical composite.

Unit tests:

- `TauCeti.Shimura.tests.variationHomIdentity` (compatibility): The identity local-system map is a variation morphism.
- `TauCeti.Shimura.tests.variationHomZero` (degenerate): The zero flat map between two equal-weight variations is a variation morphism.
- `TauCeti.Shimura.tests.variationHomReject` (non-example): A flat local-system map carrying a specified F^p fiber vector outside the target F^p cannot underlie a variation morphism.

Acceptance:

- The identity local-system map is a variation morphism.
- The zero flat map between two equal-weight variations is a variation morphism.
- A flat local-system map carrying a specified F^p fiber vector outside the target F^p cannot underlie a variation morphism.

Uses:

- ShimuraVarieties §P.3 Hodge filtrations and reflex fields: The homogeneous tensor comparison must be an isomorphism of variations, not a local-system pullback equality. (the consumer is now owned upstream; see supersededNodes)

Direct prerequisites: `ShimuraData:D3/variation`; `tauceti:TauCeti.LocalCoefficientSystem`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, pp.28–29. This is the category, morphism or coefficient refinement of the object in this passage; the pure Hodge and general comodule operations are existing supplier inputs.

<a id="d3-rational-polarized-variation"></a>

### Polarized rational variation

Node `ShimuraData:D3/rational-polarized-variation` (definition). Lean name: `TauCeti.Shimura.RationalPolarizedVariation`.

A polarized rational variation of weight n has a finite-rank rational local system, its natural scalar-extension identification with a real variation, and a parallel nondegenerate ℚ-bilinear form of parity (−1)^n. The complexified form annihilates F^p×F^{n+1−p} and i^{2p−n}Q(x,conjugate x) is positive real for nonzero x∈H^{p,n−p}. The Tate normalization is the native H1 normalization.

Hypotheses and conventions:

- All local systems are finite rank, scalar-extension comparisons use the specified canonical conjugation, and all analytic comparisons use the named complex-manifold structure.

Proof or construction:

1. Use the already existing pure Hodge–Riemann conditions on rationalized fibers. Parallel forms glue over local flat frames and are checked against the same real variation; scalar-extension comparisons are required to be natural.

API:

- `TauCeti.Shimura.rationalVariationMk` (constructor): Bundle the rational local system, real variation, natural comparison and full parallel Hodge–Riemann form.
- `TauCeti.Shimura.rationalVariationExt` (extensionality): Equality of the rational local system, real variation, scalar-extension comparison and form implies equality of polarized rational variations.
- `TauCeti.Shimura.rationalVariationParallel` (compatibility): Parallel transport preserves the rational form on each pair of fiber vectors.

Unit tests:

- `TauCeti.Shimura.tests.rationalTate` (compatibility): Rationalizing the constant integral Tate variation retains weight −2, F^{−1}=Vℂ and its nonzero polarization.
- `TauCeti.Shimura.tests.rationalScaled` (computation): Rationalization of twice an integral polarization gives twice its rational form, under the canonical common fiber comparison.
- `TauCeti.Shimura.tests.rationalNegativeFalse` (non-example): On any nonzero pure piece the negative of the polarizing form fails the native positive-real Hodge–Riemann inequality with the same Hodge filtration.

Acceptance:

- Rationalizing the constant integral Tate variation retains weight −2, F^{−1}=Vℂ and its nonzero polarization.
- Rationalization of twice an integral polarization gives twice its rational form, under the canonical common fiber comparison.
- On any nonzero pure piece the negative of the polarizing form fails the native positive-real Hodge–Riemann inequality with the same Hodge filtration.

Uses:

- ShimuraData:D3/polarized-integral-variation: This is the actual target of rationalization, with its flat filtration and form retained.

Direct prerequisites: `ShimuraData:D3/variation`; `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory`; `tauceti:TauCeti.Hodge.IsPolarization`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, pp.28–29; polarization pp.27–28. This is the category, morphism or coefficient refinement of the object in this passage; the pure Hodge and general comodule operations are existing supplier inputs.

<a id="d3-polarized-integral-variation"></a>

### Polarized integral variation

Node `ShimuraData:D3/polarized-integral-variation` (definition). Lean name: `TauCeti.Shimura.polarizedIntegralVariation`.

A polarized integral variation of weight n is a variation with a locally constant finite free ℤ-lattice and a parallel ℤ-bilinear polarizing form, with the explicit Tate normalization used to compare its rational and complex scalar extensions. The integral form is nondegenerate, has parity (−1)ⁿ and satisfies the pinned Hodge–Riemann orthogonality and positivity on every fiber. Rational nondegeneracy agrees after scalar extension, but an arbitrary rational polarization is not thereby integral. The lattice is locally free, not forced to be globally constant or unimodular.

Hypotheses and conventions:

- B is a complex manifold and n is an integer. The locally constant ℤ-lattice has finite free fibers; its polarizing form is ℤ-bilinear, parallel and nondegenerate, with the stated Tate normalization. The H0/H1 scalar-extension and filtered-bundle comparisons are supplier inputs.

Proof or construction:

1. Bundle the finite-free integral local system and parallel pairing; identify the fiberwise polarization with the supplied pure polarization after the chosen Tate factor. Do not require perfect integral pairing unless specified.

API:

- `TauCeti.Shimura.integralVariationRational` (compatibility): Tensor the lattice and its parallel form with ℚ and retain the induced real flat filtered bundle and connection; the result is the specified rational polarized variation.
- `TauCeti.Shimura.integralVariationPairing` (compatibility): On each integral fiber the form satisfies the native IsPolarization predicate, including filtration orthogonality and positivity. The parallel field of the integral variation supplies transport invariance.
- `TauCeti.Shimura.integralVariationPullback` (functoriality): Holomorphic pullback constructs the full polarized integral variation and preserves the lattice, connection, filtration, scalar-extension comparisons and polarizing form.
- `TauCeti.Shimura.integralVariationMk` (constructor): Construct from a locally finite-free integral local system, scalar-extension comparisons with a real variation, native pure Hodge fibers, a parallel form and full native Hodge–Riemann polarization conditions. Comparisons are natural in transport.
- `TauCeti.Shimura.integralVariationExt` (extensionality): Equality of the lattice local system, real variation, scalar-extension comparisons, integral Hodge fibers and polarizing form implies equality of the polarized variation.

Unit tests:

- `TauCeti.Shimura.tests.integralConstantTate` (computation): The rank-one constant ℤ(1) lattice has weight −2 and the usual Tate polarization.
- `TauCeti.Shimura.tests.integralScaledPairing` (computation): Multiplying a lattice polarization by 2 still gives a polarized integral variation.
- `TauCeti.Shimura.tests.integralMonodromy` (degenerate): An elliptic variation around a cusp has nontrivial integral monodromy and remains admissible here.

Acceptance:

- Tensor the lattice and its parallel form with ℚ and retain the induced real flat filtered bundle and connection; the result is the specified rational polarized variation.
- On each integral fiber, the form satisfies the native IsPolarization predicate, including filtration orthogonality and positivity; parallel transport preserves it.
- Holomorphic pullback constructs the full polarized integral variation and preserves the lattice, connection, filtration, scalar-extension comparisons and polarizing form.
- Construct from a locally finite-free integral local system, scalar-extension comparisons with a real variation, native pure Hodge fibers, a parallel form and full native Hodge–Riemann polarization conditions. Comparisons are natural in transport.
- Equality of the lattice local system, real variation, scalar-extension comparisons, integral Hodge fibers and polarizing form implies equality of the polarized variation.
- The rank-one constant ℤ(1) lattice has weight −2 and the usual Tate polarization.
- Multiplying a lattice polarization by 2 still gives a polarized integral variation.
- An elliptic variation around a cusp has nontrivial integral monodromy and remains admissible here.

Uses:

- BKT period maps: Its period maps require a finite-free integral local system, flat polarization and Griffiths-transverse holomorphic filtration, including nontrivial monodromy.
- Benoist H² vanishing cycles: The H² vanishing-cycle variation supplies the polarized integral carrier; real involution and geometric vanishing-cycle criteria belong to HodgeStructures Part II.

Direct prerequisites: `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory`; `ShimuraData:D3/variation`; `tauceti:TauCeti.Hodge.IsPolarization`; `ShimuraData:D3/rational-polarized-variation`.

Sources:

- [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://par.nsf.gov/servlets/purl/10200187), §1.3, published p.920 (PDF p.4); §4.2, published p.928 (PDF p.12). The paper uses polarized ℤ-Hodge variations and later an integral polarization form Qℤ and its complex extension. This supports an integral pairing carrier, without identifying every rational pairing on a fixed lattice with an integral form.

<a id="d3-flat-bundle-local"></a>

### Flat bundle local comparison

Node `ShimuraData:D3/flat-bundle-local` (lemma). Lean name: `TauCeti.Shimura.flatBundleLocal`.

In every simply connected local-system trivialization, the associated connection is the ordinary differential on holomorphic sections, and fiberwise opposedness is exactly the existing pure HodgeStructureOn condition. These descriptions agree on overlaps by locally constant transition maps. In local flat frames the connection is the differential of the local coordinate section, and transition maps are locally constant. Gluing produces L⊗O_B; path transport identities alone do not produce this object.

Hypotheses and conventions:

- B is a complex manifold; n is an integer; L is a locally constant finite-rank real/rational system. In the integral polarized case its ℤ-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Proof or construction:

1. Check the change-of-frame formula for constant transition matrices; apply the chain rule to filtration sections.

Acceptance:

- In every simply connected local-system trivialization, the associated connection is the ordinary differential on holomorphic sections, and fiberwise opposedness is exactly the existing pure HodgeStructureOn condition. These descriptions agree on overlaps by locally constant transition maps. In local flat frames the connection is the differential of the local coordinate section, and transition maps are locally constant. Gluing produces L⊗O_B; path transport identities alone do not produce this object.
- The signature concludes this named comparison on the specified constructed object; it does not take that conclusion as a premise.

Direct prerequisites: `ShimuraData:D3/variation`; `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, pp.28–29. For flat bundle local comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-transversality-tangent"></a>

### Tangent criterion for transversality

Node `ShimuraData:D3/transversality-tangent` (lemma). Lean name: `TauCeti.Shimura.transversalityTangent`.

For a holomorphic family with constant local system V, Griffiths transversality is equivalent to the differential of its flag map lying in F^{−1}End(Vℂ)/F⁰End(Vℂ) at every point. This is a first-order condition, not merely continuity of the Hodge pieces.

Hypotheses and conventions:

- The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Identify tangent to the flag variety with End/F⁰ and differentiate each filtration step; compare with ∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹.

Acceptance:

- For a holomorphic family with constant local system V, Griffiths transversality is equivalent to the differential of its flag map lying in F^{−1}End(Vℂ)/F⁰End(Vℂ) at every point. This is a first-order condition, not merely continuity of the Hodge pieces.

Direct prerequisites: `ShimuraData:D3/flat-bundle-local`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, equations (18)–(19), p.29. For tangent criterion for transversality, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-filtration-parabolic"></a>

### Parabolic of the Hodge filtration

Node `ShimuraData:D3/filtration-parabolic` (construction). Lean name: `TauCeti.Shimura.filtrationParabolic`.

For h and any faithful representation, the stabilizer of all F_hᵖ is the parabolic P_h⊂Gℂ with Lie algebra F⁰gℂ. It is independent of the faithful representation. With μh(z)=hℂ(z,1), this is P(μh⁻¹) under the limit t→0 convention; equivalently use P(μh) with the opposite filtration convention. Its Levi is ZGℂ(μh), not its unipotent radical.

Hypotheses and conventions:

- The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. The filtration uses p while μ acts by −p: matrices preserving p≥a have nonpositive μ-weight entries. Apply the dynamic parabolic theorem to −μ, and the faithful-representation comparison.

API:

- `TauCeti.Shimura.filtrationParabolicLie` (compatibility): The Lie algebra of the algebraic filtration stabilizer is the actual subalgebra of endomorphisms preserving every F^p, identified with F⁰gℂ.
- `TauCeti.Shimura.filtrationParabolicLevi` (characterisation): The Levi is the algebraic centralizer of the specific μ\_h; on the representation it preserves each μ weight piece, hence the Hodge grading.
- `TauCeti.Shimura.filtrationParabolicConjugate` (characterisation): P_{ghg⁻¹}=gP_hg⁻¹ and does not depend on faithful representation.

Unit tests:

- `TauCeti.Shimura.tests.parabolicGl2` (computation): For GL₂, P_h stabilizes the one-dimensional F⁰ line and is a Borel.
- `TauCeti.Shimura.tests.parabolicTorus` (degenerate): For a torus datum, P_h=Tℂ and its unipotent radical is trivial.
- `TauCeti.Shimura.tests.parabolicSiegel` (computation): For GSp₂g, P_h is the Lagrangian stabilizer with Levi GLg×Gm.

Acceptance:

- The Lie algebra of the algebraic filtration stabilizer is the actual subalgebra of endomorphisms preserving every F^p, identified with F⁰gℂ.
- The Levi is the algebraic centralizer of the specific μ\_h; on the representation it preserves each μ weight piece, hence the Hodge grading.
- P_{ghg⁻¹}=gP_hg⁻¹ and does not depend on faithful representation.
- For GL₂, P_h stabilizes the one-dimensional F⁰ line and is a Borel.
- For a torus datum, P_h=Tℂ and its unipotent radical is trivial.
- For GSp₂g, P_h is the Lagrangian stabilizer with Levi GLg×Gm.

Uses:

- ShimuraData:D3/compact-dual: Compact dual consumes parabolic of the hodge filtration: Lie(P_h)=F⁰gℂ.
- ShimuraData:D3/kostant-representatives: Kostant representatives consumes parabolic of the hodge filtration: Lie(P_h)=F⁰gℂ.

Direct prerequisites: `ShimuraVarieties:V0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Flag varieties pp.23–24; Theorem 2.14 proof p.30; §12 p.111. The flag stabilizer has Lie algebra F⁰End, pulled back along a faithful representation. With μ acting as z^−p the dynamic parabolic uses μ inverse; R7 supplies its representability and Levi.

<a id="d3-compact-dual"></a>

### Compact dual

Node `ShimuraData:D3/compact-dual` (construction). Lean name: `TauCeti.Shimura.compactDual`.

For a Shimura orbit X, construct its complex projective homogeneous flag variety X∨=Gℂ/P_h, independent up to canonical Gℂ-isomorphism of the chosen h. Use right cosets G/P for the Borel embedding; identify it by inversion with left cosets P\\G for the routed Bruhat convention.

Hypotheses and conventions:

- The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Proof or construction:

1. Use the represented parabolic quotient and conjugation isomorphisms. Give transition maps for changing h and the inversion comparison to left cosets.

API:

- `TauCeti.Shimura.compactDualBasepoint` (characterisation): The basepoint has stabilizer P_h.
- `TauCeti.Shimura.compactDualChangePoint` (characterisation): Changing h by g gives the equivariant conjugate-parabolic identification.
- `TauCeti.Shimura.compactDualTangent` (compatibility): The complex tangent at the filtration point of the actual flag manifold is gℂ/F⁰gℂ, with its homogeneous differential.

Unit tests:

- `TauCeti.Shimura.tests.dualGl2` (computation): The GL₂ compact dual is ℙ¹ℂ.
- `TauCeti.Shimura.tests.dualTorus` (computation): The torus compact dual is a point.
- `TauCeti.Shimura.tests.dualSiegel` (computation): The Siegel compact dual is the Lagrangian Grassmannian with dimension g(g+1)/2.

Acceptance:

- The basepoint has stabilizer P_h.
- Changing h by g gives the equivariant conjugate-parabolic identification.
- The complex tangent at the filtration point of the actual flag manifold is gℂ/F⁰gℂ, with its homogeneous differential.
- The GL₂ compact dual is ℙ¹ℂ.
- The torus compact dual is a point.
- The Siegel compact dual is the Lagrangian Grassmannian with dimension g(g+1)/2.

Uses:

- ShimuraVarieties §P.3 (Borel embedding): the Borel embedding of X lands in the compact dual X^∨=G_ℂ/P_h as an open G(ℝ)-orbit; its basepoint has stabilizer P_h
- ShimuraData:D3/reflex-flag-descent: Compact dual over the reflex field consumes compact dual: The basepoint has stabilizer P_h.
- PerfectoidShimuraVarieties Hodge–Tate target: The consumer uses compact dual through these concrete interfaces: The basepoint has stabilizer P_h. Changing h by g gives the equivariant conjugate-parabolic identification.

Direct prerequisites: `ShimuraData:D3/filtration-parabolic`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Flag varieties, pp.23–24. For compact dual, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Compact dual.

<a id="d3-reflex-flag-descent"></a>

### Compact dual over the reflex field

Node `ShimuraData:D3/reflex-flag-descent` (theorem). Lean name: `TauCeti.Shimura.reflexFlagDescent`.

Let E=E(G,X) be the reflex field of ShimuraVarieties §P.3 (the field of definition of the conjugacy class of μ\_h) and t the geometric conjugacy type of P_h (D3/filtration-parabolic). The Galois-stable type t defines the projective E-scheme Par_t(G_E) of parabolic subgroups of type t. Its complex fibre is X^∨ (D3/compact-dual), and over any extension L/E with an L-rational parabolic P of type t it is G_L/P. The E-scheme need not have E-points.

Hypotheses and conventions:

- The Hodge sign dictionary of D1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.
- Galois acts on the geometric cocharacter conjugacy class in ℚ̄. The field is the fixed field of its open stabilizer; no rational representative or parabolic point is assumed.

Proof or construction:

1. The class determines its parabolic type equivariantly. Import representability and equivariant descent of the parabolic-type functor, then identify the complex fiber by transitivity. No descent of a selected P is used. The exact projective parabolic-type theorem is requested and remains an open leaf.

Acceptance:

- Let t be the geometric conjugacy type of P_h. The Galois-stable type over E defines the projective E-scheme Par_t(G_E) of parabolic subgroups of that type. Its complex extension is X∨; over any L/E with an L-rational P of type t, it is G_L/P. The E-scheme may have no E-points.

Direct prerequisites: `ShimuraData:D3/filtration-parabolic`; `ShimuraData:D3/compact-dual`; `ShimuraVarieties:V0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `SchemeAndStackFoundations:SF.1`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Lemma 12.1 and Definition 12.2, pp.111–112; parabolic-type representability/descent is an explicit supplier gap. For compact dual over the reflex field, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Compact dual over the reflex field.

<a id="d3-kostant-representatives"></a>

### Kostant representatives

Node `ShimuraData:D3/kostant-representatives` (definition). Lean name: `TauCeti.Shimura.kostantRepresentatives`.

For a split reductive group with T⊂B⊂P and Levi M containing T, ^MW consists of the unique minimal-length representatives of the left cosets WM\\W. Use the left action wκ(t)=κ(w⁻¹tw); in particular ^MW is characterized by w⁻¹ΦM⁺⊂Φ⁺. Specialize to the cocharacter parabolic only after choosing its compatible Borel.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use the Weyl Coxeter length and standard parabolic subgroup supplied by reductive theory. Specify the side of the cosets, rather than silently using W/WM.

API:

- `TauCeti.Shimura.kostantUnique` (characterisation): Every left coset has exactly one minimal representative.
- `TauCeti.Shimura.kostantPositive` (characterisation): w belongs iff w⁻¹ΦM⁺⊂Φ⁺.
- `TauCeti.Shimura.kostantLengthAdd` (characterisation): For u∈WM and w∈^MW, ℓ(uw)=ℓ(u)+ℓ(w).
- `TauCeti.Shimura.kostantKostantIndex` (compatibility): ^MW is the index set W^P of ArithmeticLocallySymmetricSpaces §ALS.4.5: w lies in ^MW iff w⁻¹α>0 for every simple root α of M.

Unit tests:

- `TauCeti.Shimura.tests.kostantBorel` (degenerate): When M=T, ^MW=W.
- `TauCeti.Shimura.tests.kostantWholeGroup` (degenerate): When P=G, ^MW={1}.
- `TauCeti.Shimura.tests.kostantA2Left` (computation): For A₂ and WM=⟨s₁⟩, ^MW={1,s₂,s₂s₁}.

Acceptance:

- For a split reductive group with T⊂B⊂P and Levi M containing T, ^MW consists of the unique minimal-length representatives of the left cosets WM\\W. Use the left action wκ(t)=κ(w⁻¹tw); in particular ^MW is characterized by w⁻¹ΦM⁺⊂Φ⁺. Specialize to the cocharacter parabolic only after choosing its compatible Borel.

Uses:

- ShimuraData:D3/kostant-cones: Levi dominant cone decomposition consumes kostant representatives: Every left coset has exactly one minimal representative.
- ShimuraData:D5/siegel-weyl-permutations: the Siegel minimal representatives are computed as the elements w with w⁻¹Φ\_M⁺⊂Φ⁺
- PotentialAutomorphyInfrastructure Kostant input: The consumer uses kostant representatives through these concrete interfaces: Every left coset has exactly one minimal representative. w belongs iff w⁻¹ΦM⁺⊂Φ⁺.
- ArithmeticLocallySymmetricSpaces §ALS.4.5 (TauCetiRoadmap PR #871): Kostant's theorem over a splitting field is indexed by the same set W^P (w⁻¹α>0 for every simple root α of M)

Direct prerequisites: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `ShimuraData:D3/filtration-parabolic`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Definition 1.3.1, p.3; §3.1, p.34. For kostant representatives, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Kostant representatives.

<a id="d3-kostant-cone-criterion"></a>

### Kostant cone criterion

Node `ShimuraData:D3/kostant-cone-criterion` (lemma). Lean name: `TauCeti.Shimura.kostantConeCriterion`.

For w∈W, w(X\*(T)⁺)⊆X\*(T)^{+,M} iff w⁻¹ΦM⁺⊂Φ⁺ iff w∈^MW. ΦM⁺ denotes positive Levi roots, distinct from the complementary noncompact roots Φ^{+,M}.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Pair wκ with Levi coroots and use w⁻¹ on the coroot. If an image root is negative, choose an integral strictly dominant weight to witness failure.

Acceptance:

- For w∈W, w(X\*(T)⁺)⊆X\*(T)^{+,M} iff w⁻¹ΦM⁺⊂Φ⁺ iff w∈^MW. ΦM⁺ denotes positive Levi roots, distinct from the complementary noncompact roots Φ^{+,M}.

Direct prerequisites: `ShimuraData:D3/kostant-representatives`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34; root criterion corrected as E2. For kostant cone criterion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-kostant-cones"></a>

### Levi dominant cone decomposition

Node `ShimuraData:D3/kostant-cones` (theorem). Lean name: `TauCeti.Shimura.kostantCones`.

X\*(T)^{+,M}=⋃w∈^MW wX\*(T)⁺, including boundary weights. In the real weight space the same union covers the closed Levi chamber.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Choose a full-W dominant translate. Move its coset into a minimal left representative; any remaining Levi chamber motion fixes the wall weight after using its stabilizer. Use Coxeter parabolic factorization, not disjointness on walls.

Acceptance:

- X\*(T)^{+,M}=⋃w∈^MW wX\*(T)⁺, including boundary weights. In the real weight space the same union covers the closed Levi chamber.

Direct prerequisites: `ShimuraData:D3/kostant-cone-criterion`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §1.3.3, p.3. For levi dominant cone decomposition, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-kostant-involution"></a>

### Kostant opposition involution

Node `ShimuraData:D3/kostant-involution` (lemma). Lean name: `TauCeti.Shimura.kostantInvolution`.

Writing w0,G and w0,M for the longest elements of W and WM, w↦w0,M w w0,G preserves ^MW, is an involution, and changes length to dim(G/P)−ℓ(w). The longest Levi and full Weyl elements are different.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use positive-root characterization and longest-element root reversal; count roots outside the Levi, then square the map.

Acceptance:

- Writing w0,G and w0,M for the longest elements of W and WM, w↦w0,M w w0,G preserves ^MW, is an involution, and changes length to dim(G/P)−ℓ(w). The longest Levi and full Weyl elements are different.

Direct prerequisites: `ShimuraData:D3/kostant-representatives`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §1.3, p.5. For kostant opposition involution, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-bruhat-integral"></a>

### Integral Bruhat stratification

Node `ShimuraData:D3/bruhat-integral` (theorem). Lean name: `TauCeti.Shimura.bruhatIntegral`.

For a split pinned reductive group over ℤ and standard P, the left-coset flag scheme P\\G has B-orbit cells Cw=P\\PwB indexed by ^MW, each isomorphic to A^{ℓ(w)}_ℤ. The cells stratify the flag scheme, commute with base change, and have relative dimension ℓ(w). This includes ℤp and 𝔽p, not only characteristic-zero points.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Import the integral root-subgroup cell factorization and base-change compatibility from layer9; specialize the quotient and identify its indexing with ^MW. Its full integral proof is a precise supplier request.

Acceptance:

- For a split pinned reductive group over ℤ and standard P, the left-coset flag scheme P\\G has B-orbit cells Cw=P\\PwB indexed by ^MW, each isomorphic to A^{ℓ(w)}_ℤ. The cells stratify the flag scheme, commute with base change, and have relative dimension ℓ(w). This includes ℤp and 𝔽p, not only characteristic-zero points.

Direct prerequisites: `ShimuraData:D3/kostant-representatives`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For integral bruhat stratification, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Integral Bruhat stratification.

<a id="d3-schubert-families"></a>

### Schubert and opposite Schubert loci

Node `ShimuraData:D3/schubert-families` (construction). Lean name: `TauCeti.Shimura.schubertFamilies`.

On P\\G, define Xw as the scheme-theoretic closure of Cw and X^w as closure of the opposite-Borel cell C^w. Define Yw as the open union of standard cells Cv with v≥w. Use the corrected distinction between cells and their closures.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use the integral Schubert closure and opposite-Borel action; the complement of Yw is a lower Bruhat ideal and hence a closed union of Schubert varieties.

API:

- `TauCeti.Shimura.schubertClosure` (characterisation): The underlying locus of Xw is ⋃v≤w Cv; the reduced schematic closure is the supplied Schubert variety, compatibly with base change. A disjoint cell union is not asserted to equal Xw as a scheme.
- `TauCeti.Shimura.oppositeSchubertClosure` (characterisation): The underlying locus of X^w is ⋃v≥w C^v, fiberwise and compatibly with the supplied integral stratification. The disjoint cell union is not an equality of schemes.
- `TauCeti.Shimura.schubertUpperOpen` (characterisation): Yw is open, contains Cw, and its complement is the lower closed Bruhat union.

Unit tests:

- `TauCeti.Shimura.tests.schubertRankOne` (computation): For P=B in SL₂, X₁ is a point, X_s=ℙ¹, Y₁=ℙ¹ and Y_s is an affine open.
- `TauCeti.Shimura.tests.schubertOppositeRankOne` (computation): The opposite closed point X^s is contained in the standard open cell Y_s, not in X₁.
- `TauCeti.Shimura.tests.schubertTrivialFlag` (computation): For P=G all three loci are the point and ℓ(1)=0.

Acceptance:

- On P\\G, define Xw as the scheme-theoretic closure of Cw and X^w as closure of the opposite-Borel cell C^w. Define Yw as the open union of standard cells Cv with v≥w. Use the corrected distinction between cells and their closures.

Uses:

- ShimuraData:D3/opposite-inside-upper: Opposite Schubert inclusion consumes schubert and opposite schubert loci: The underlying locus of Xw is ⋃v≤w Cv; the reduced schematic closure is the supplied Schubert variety, compatibly with base change. A disjoint cell union is not asserted to equal Xw as a scheme.
- Boxer–Pilloni support conditions: The consumer uses schubert and opposite schubert loci through these concrete interfaces: The underlying locus of Xw is ⋃v≤w Cv; the reduced schematic closure is the supplied Schubert variety, compatibly with base change. A disjoint cell union is not asserted to equal Xw as a scheme. The underlying locus of X^w is ⋃v≥w C^v.

Direct prerequisites: `ShimuraData:D3/bruhat-integral`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §6.1.8, p.60; corrected ShimuraData/E4 (extraction PAPER-BOXER-PILLONI-26/E116). For schubert and opposite schubert loci, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.
- [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), §3.1, pp.31–32. For schubert and opposite schubert loci, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-bruhat-closure-order"></a>

### Bruhat closure criterion

Node `ShimuraData:D3/bruhat-closure-order` (lemma). Lean name: `TauCeti.Shimura.bruhatClosureOrder`.

The underlying locus of Cv is contained in that of Xw iff v≤w, and the underlying locus of Xw is the union of those cell loci, fiberwise through the integral stratification. This is not an isomorphism from the disjoint union of cell schemes onto Xw.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Apply integral root-subgroup closure relations imported from layer9 and the Coxeter Bruhat order.

Acceptance:

- The underlying locus of Cv is contained in that of Xw iff v≤w, and the underlying locus of Xw is the union of those cell loci, fiberwise through the integral stratification. This is not an isomorphism from the disjoint union of cell schemes onto Xw.

Direct prerequisites: `ShimuraData:D3/bruhat-integral`; `ShimuraData:D3/schubert-families`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For bruhat closure criterion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-opposite-intersection"></a>

### Opposite Schubert intersection criterion

Node `ShimuraData:D3/opposite-intersection` (lemma). Lean name: `TauCeti.Shimura.oppositeIntersection`.

For the standard and opposite Schubert varieties over an algebraically closed field, X^w∩Xv is nonempty iff w≤v. The integral closure/emptiness statements needed for the inclusion must remain valid after every base change.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Import the opposite/standard Schubert incidence theorem including the base-change version; the BL03 I Lemma1 invoked by BP21 is not treated as an unread proof.

Acceptance:

- For the standard and opposite Schubert varieties over an algebraically closed field, X^w∩Xv is nonempty iff w≤v. The integral closure/emptiness statements needed for the inclusion must remain valid after every base change.

Direct prerequisites: `ShimuraData:D3/schubert-families`; `ShimuraData:D3/bruhat-closure-order`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

Sources:

- [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), Lemma 3.1.2 proof, p.32; cited BL03 proof leaf not read. For opposite schubert intersection criterion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d3-opposite-inside-upper"></a>

### Opposite Schubert inclusion

Node `ShimuraData:D3/opposite-inside-upper` (theorem). Lean name: `TauCeti.Shimura.oppositeInsideUpper`.

For every w∈^MW, X^w⊂Yw as a closed subscheme of the open Yw. This holds for the integral flag and its ℤp and 𝔽p fibers.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. If X^w meets Cv then it meets Xv, so v≥w. All excluded cells lie in its disjoint complement; the factorization through an open subscheme follows from the underlying containment. Use the integral incidence supplier to justify the statement over ℤ.

Acceptance:

- For every w∈^MW, X^w⊂Yw as a closed subscheme of the open Yw. This holds for the integral flag and its ℤp and 𝔽p fibers.

Direct prerequisites: `ShimuraData:D3/opposite-intersection`; `ShimuraData:D3/bruhat-closure-order`; `ShimuraData:D3/schubert-families`.

Sources:

- [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), Lemma 3.1.2, p.32. For opposite schubert inclusion, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d4"></a>

## D4. Generality of data: additional axioms, PEL type and lifting

Pure Shimura data — Deligne's axioms SV1–SV3, morphisms, products, adjoint and connected data, special pairs and points, Hodge and abelian type — are ShimuraVarieties §P.1's (`TauCeti.Shimura.PureDatum`); the thirteen D4 nodes that planned them are superseded. Reflex fields are §P.3's and canonical models §§4.4, 4.12 and 7.14's (the canonical-model condition, uniqueness, and existence for every pure datum). This layer states the generality those roadmaps leave out. The *additional axioms* SV2\*, SV4, SV5 and SV6 complete Deligne's list 2.1.1.1–2.1.1.5 and Milne's SV5–SV6; SV5 is characterised through the anisotropic part of the centre (Milne, Theorem 5.26). *PEL type* is the specialisation through PELModuli §M0.12, and the chain PEL ⇒ Hodge ⇒ abelian ⇒ preabelian (Hansen–Johansson) is proved without identifying the predicates. Finally, every connected datum lifts to a full datum satisfying all the axioms (Milne 2013, Proposition 8.8 and Corollary 8.9).

**Dependencies.** Within this roadmap: `ShimuraData:D1`. Other roadmaps: `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.3`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `PELModuli:M0`, `ReductiveGroupsPartII:RG2.1`, `ShimuraVarieties:V0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Remaining refinements.** The finite-index half of Ono's theorem for tori is an AdelicAlgebraicGroups §3.4 extension request. The Milne–Shih central extension with prescribed derived cover is a ReductiveGroupsPartII §RG2.1 extension request (gap).

<a id="d4-preabelian-type"></a>

### Preabelian type

Node `ShimuraData:D4/preabelian-type` (definition). Lean name: `TauCeti.Shimura.preabelianType`.

A pure datum (G,X) (ShimuraVarieties §P.1) is of preabelian type if there are a datum (G₁,X₁) of Hodge type (§P.1) and components X⁺⊂X, X₁⁺⊂X₁ with an isomorphism of connected adjoint data (G₁^ad,X₁⁺)≅(G^ad,X⁺) in §P.1's connected convention. This is Hansen–Johansson's Definition 4.1: no central isogeny of derived groups is required, and no isomorphism of the full orbits.

Hypotheses and conventions:

- (G,X) is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (TauCetiRoadmap pull request #933): G connected reductive over ℚ, X a nonempty full G(ℝ)-class of algebraic h:S→G_ℝ satisfying SV1–SV3, with S the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.
- Hodge type, adjoint data and the connected convention (C1)–(C3) are ShimuraVarieties §P.1's.

Proof or construction:

1. Quantify over the Hodge-type witness and connected-adjoint datum isomorphism; descend the predicate from any chosen component.

API:

- `TauCeti.Shimura.abelianTypePreabelian` (characterisation): Abelian type implies preabelian type by forgetting the derived isogeny.
- `TauCeti.Shimura.preabelianTypeAdjoint` (characterisation): The predicate depends only on the connected adjoint datum.
- `TauCeti.Shimura.preabelianTypeIsomorphism` (characterisation): Isomorphic connected adjoint data have equivalent preabelian predicates.

Unit tests:

- `TauCeti.Shimura.tests.preabelianSiegel` (computation): The Siegel datum is preabelian type.
- `TauCeti.Shimura.tests.preabelianTorus` (computation): Every torus datum is preabelian type.
- `TauCeti.Shimura.tests.preabelianComponent` (non-example): For real quadratic F, the general Hilbert datum is preabelian via the Hodge-type common-determinant datum, although their full domains have four and two components respectively.

Acceptance:

- Abelian type (ShimuraVarieties §P.1) implies preabelian type by forgetting the derived isogeny.
- The predicate depends only on the connected adjoint datum.
- Isomorphic connected adjoint data have equivalent preabelian predicates.
- The Siegel datum is of preabelian type.
- Every torus datum is of preabelian type (its adjoint group is trivial, as is that of a torus Hodge-type datum).
- For real quadratic F, the restriction-of-scalars Hilbert datum is of preabelian type through the scalar-determinant datum, although the two full domains have four and two components.

Uses:

- PerfectoidShimuraVarieties:PSV.0: The consumer uses preabelian type through these concrete interfaces: Abelian type implies preabelian type by forgetting the derived isogeny. The predicate depends only on the connected adjoint datum.
- Hansen–Johansson completed-cohomology route: The consumer uses preabelian type through these concrete interfaces: Abelian type implies preabelian type by forgetting the derived isogeny. The predicate depends only on the connected adjoint datum.

Direct prerequisites: `ShimuraVarieties:V0`.

Sources:

- [Completed cohomology and preabelian type Shimura varieties](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content), Definition 4.1, §4.1, published p.1980 (PDF p.27). For preabelian type, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Preabelian type.

<a id="d4-type-implications"></a>

### PEL–Hodge–abelian–preabelian implications

Node `ShimuraData:D4/type-implications` (theorem). Lean name: `TauCeti.Shimura.typeImplications`.

For every pure datum: PEL type (D4/pel-type) implies Hodge type, through PELModuli §M0.12's Siegel morphism; Hodge type implies abelian type, through the identity of the derived group; abelian type implies preabelian type, by forgetting the derived isogeny. These are implications between separately defined predicates; no converse is asserted. The restriction-of-scalars Hilbert datum over a real quadratic field is of abelian type but not of Hodge type, because it fails SV5 while Hodge-type data satisfy SV2\* and hence SV5.

Hypotheses and conventions:

- (G,X) is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (TauCetiRoadmap pull request #933): G connected reductive over ℚ, X a nonempty full G(ℝ)-class of algebraic h:S→G_ℝ satisfying SV1–SV3, with S the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.
- Hodge and abelian type are ShimuraVarieties §P.1's; PEL type is D4/pel-type; preabelian type is D4/preabelian-type.

Proof or construction:

1. PEL⇒Hodge: the witness of D4/pel-type carries PELModuli §M0.12's siegelMorphism, a closed immersion of groups mapping the domain into the Siegel domain.
2. Hodge⇒abelian: take the Hodge-type datum itself and the identity of its derived group.
3. Abelian⇒preabelian: forget the central derived isogeny and keep the adjoint isomorphism.
4. Non-converse: a Hodge-type datum (G,X)⊂(GSp,ℋ^±) satisfies SV2\* because Int(h(i)) is Cartan on GSp_ℝ/G_m and restricts to a Cartan involution of the closed subgroup G_ℝ/w(G_m); SV2\* gives compactness of Z(ℝ)/w(ℝ^×) and so SV5 (D4/sv5-criterion). The Hilbert datum over ℚ(√2) fails SV5 (D4/additional-axioms test) but is of abelian type through the scalar-determinant datum.

Acceptance:

- For every pure datum, PEL type ⇒ Hodge type ⇒ abelian type ⇒ preabelian type.
- The genus-g Siegel datum has all four properties.
- The restriction-of-scalars Hilbert datum over ℚ(√2) is of abelian type and not of Hodge type.

Direct prerequisites: `ShimuraData:D4/pel-type`; `ShimuraData:D4/preabelian-type`; `ShimuraData:D4/additional-axioms`; `ShimuraData:D4/sv5-criterion`; `ShimuraVarieties:V0`; `PELModuli:M0`.

Sources:

- [Completed cohomology and preabelian type Shimura varieties](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content), §4.1 and Definition 4.1, published p.1980 (PDF p.27). Hansen and Johansson recall Hodge and abelian type and define preabelian type by an isomorphism of connected adjoint data with a Hodge-type datum, observing that abelian type implies preabelian type.
- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §8, PEL Shimura data, p.88; §5, Notes, p.66. Milne observes that a PEL datum maps into the Siegel datum, so a PEL Shimura datum is of Hodge type, and his dictionary on p.66 records that SV5 is weaker than Deligne's 2.1.1.5 (SV2\*).

<a id="d4-additional-axioms"></a>

### Additional axioms SV2\*, SV4, SV5, SV6

Node `ShimuraData:D4/additional-axioms` (definition). Lean name: `TauCeti.Shimura.PureDatum.AdditionalAxioms`.

For a pure Shimura datum (G,X) with weight w_X:G_{m,ℝ}→Z(G)°\_ℝ and centre Z=Z(G), define four predicates. SV2\*: for h∈X, Int(h(i)) is a Cartan involution of G_ℝ/w_X(G_m) (Deligne's 2.1.1.5). SV4: w_X is defined over ℚ, i.e. the weight is rational (Deligne's 2.1.1.4). SV5: Z(ℚ) is discrete in Z(𝔸\_f). SV6: the torus Z° splits over a CM field. Each is a property of the datum: independent of h∈X and invariant under isomorphism of data. With SV1–SV3 of ShimuraVarieties §P.1, SV4 and SV2\* are Deligne's conditions 2.1.1.1–2.1.1.5. SV2\* implies SV2, and under SV4 every rational representation of G and every h∈X give a rational Hodge structure.

Hypotheses and conventions:

- (G,X) is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (TauCetiRoadmap pull request #933): G connected reductive over ℚ, X a nonempty full G(ℝ)-class of algebraic h:S→G_ℝ satisfying SV1–SV3, with S the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.
- Cartan involutions are ArithmeticLocallySymmetricSpaces §ALS.0.1's (compact twisted real form, with the Killing criterion on the derived algebra and a separate condition on the central torus); Z(𝔸\_f) carries AdelicAlgebraicGroups §1.3's topology; a CM field is a totally imaginary quadratic extension of a totally real number field (Mathlib NumberField.IsCMField).

Proof or construction:

1. Independence of h: points of X are G(ℝ)-conjugate; conjugation fixes the central weight and carries Int(h(i)) to Int(gh(i)g⁻¹), and inner automorphisms preserve Cartan involutions (ALS.0.1, conjugacy of Cartan involutions). SV4–SV6 do not involve h.
2. SV2\*⇒SV2: by ALS.0.1's Killing criterion, a Cartan involution of G_ℝ/w_X(G_m) is positive on the derived algebra, which is the Lie algebra of G^ad_ℝ; that positivity is SV2.
3. Isomorphism invariance: an isomorphism of data is a ℚ-isomorphism of groups carrying X to X′, so it carries weights, centres and their ℚ-structures to each other.
4. SV4 and rational Hodge structures: if w_X is defined over ℚ then ρ∘w_X is a ℚ-cocharacter of GL(V) for every rational representation ρ, and D1/rational-weight-criterion makes (V,ρ∘h) a rational Hodge structure.

API:

- `TauCeti.Shimura.sv2Star_indep` (characterisation): SV2\* holds for one h∈X iff it holds for every h∈X.
- `TauCeti.Shimura.sv2Star_sv2` (relation): SV2\* implies SV2.
- `TauCeti.Shimura.sv4_rationalHodge` (compatibility): Under SV4, for every rational representation ρ:G→GL(V) and h∈X, (V,ρ∘h) is a rational Hodge structure (D1/rational-weight-criterion).
- `TauCeti.Shimura.additionalAxioms_iso` (compatibility): Each of SV2\*, SV4, SV5, SV6 is invariant under isomorphism of data.
- `TauCeti.Shimura.additionalAxioms_prod` (functoriality): Each of SV2\*, SV4, SV5, SV6 holds for a product of data iff it holds for both factors (the centre of a product is the product of the centres, and a compositum of CM fields is CM).

Unit tests:

- `TauCeti.Shimura.tests.additionalGl2` (computation): The GL₂ datum satisfies SV2\*, SV4 (w(r)=r⁻¹I₂), SV5 (ℚ^×∩Ẑ^×={±1} is finite, so ℚ^× is discrete in 𝔸\_f^×) and SV6 (the centre G_m is split).
- `TauCeti.Shimura.tests.additionalHilbertSV5` (non-example): For F=ℚ(√2) the restriction-of-scalars Hilbert datum satisfies SV4 but not SV5: Z(ℚ)=F^× meets the compact open Ô\_F^× in the infinite group O_F^×∋1+√2.
- `TauCeti.Shimura.tests.additionalQuaternionWeight` (non-example): For a quaternion algebra over ℚ(√2) split at exactly one real place, Milne's Example 5.24 datum has weight r↦(1,r⁻¹I₂) on ℍ^×·GL₂(ℝ), not defined over ℚ: SV4 fails while SV1–SV3 hold.
- `TauCeti.Shimura.tests.additionalTrivialTorus` (degenerate): The torus datum (G_m,{1}) satisfies SV1–SV6 but not SV2\*: the identity is not a Cartan involution of G_m,ℝ, whose real points ℝ^× are not compact.

Acceptance:

- SV2\* holds for one h∈X iff it holds for every h∈X.
- SV2\* implies SV2.
- Under SV4 every rational representation and every h∈X give a rational Hodge structure.
- Each of SV2\*, SV4, SV5, SV6 is invariant under isomorphism of data and holds for a product iff it holds for both factors.
- The GL₂ datum satisfies SV2\*, SV4, SV5 and SV6.
- For F=ℚ(√2) the restriction-of-scalars Hilbert datum satisfies SV4 but not SV5.
- The quaternion datum of Milne's Example 5.24 with exactly one split real place of ℚ(√2) satisfies SV1–SV3 but not SV4.
- The torus datum (G_m,{1}) with trivial h satisfies SV1–SV6 but not SV2\*.

Uses:

- Milne SVI §5, Additional axioms, p.63: SV4 makes the Hodge structures of rational representations rational; SV5 is the hypothesis of Theorem 5.28's description of the inverse limit of the Sh_K
- ShimuraVarieties §§4.4–7.14 (TauCetiRoadmap PR #933): the canonical-model statements are made for every pure datum; SV2\*, SV4–SV6 are the standard simplifying hypotheses a consumer imposes, named once here
- PELModuli §M0.12 (TauCetiRoadmap PR #966): a PEL datum with connected group satisfies SV4
- ShimuraData:D4/sv5-criterion: SV5 is characterised through the largest anisotropic subtorus of the centre
- ShimuraData:D4/connected-datum-lift: the lift satisfies SV2\*, SV4, SV5 and SV6
- ShimuraData:D4/type-implications: Hodge type implies SV2\* and hence SV5, which separates Hodge from abelian type

Direct prerequisites: `ShimuraVarieties:V0`; `ShimuraData:D1/rational-weight-criterion`; `ArithmeticLocallySymmetricSpaces:ALS.0`; `AdelicAlgebraicGroups:AA.1`; `mathlib:NumberField.IsCMField`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Additional axioms, p.63; Notes, p.66. After the main definition Milne lists SV2\*, SV4, SV5 and SV6, notes that SV4 makes the Hodge structures of rational representations rational, and on p.66 matches SV1–SV4 and SV2\* with Deligne's 2.1.1.1–2.1.1.5, remarking that SV5 is weaker than 2.1.1.5.
- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64. For a quaternion algebra over a totally real field the weight is 1 at the compact places and r⁻¹I₂ at the split ones, so it is defined over ℚ only when every real place splits; this is the SV4 non-example.

Planet: Additional axioms SV2\*, SV4–SV6.

<a id="d4-sv5-criterion"></a>

### Discreteness criterion for the rational centre

Node `ShimuraData:D4/sv5-criterion` (theorem). Lean name: `TauCeti.Shimura.sv5_iff_anisotropic`.

For a ℚ-torus T let T_a be its largest ℚ-anisotropic subtorus (the identity component of the common kernel of the ℚ-rational characters). Then T(ℚ) is discrete in T(𝔸\_f) if and only if T_a(ℝ) is compact, that is, T_a stays anisotropic over ℝ. Consequently a pure datum (G,X) satisfies SV5 if and only if the largest ℚ-anisotropic subtorus of Z(G)° is anisotropic over ℝ.

Hypotheses and conventions:

- T is a torus over ℚ; T(𝔸\_f) carries AdelicAlgebraicGroups §1.3's topology and T(ℚ) its diagonal image.
- For the consequence, (G,X) is a pure datum (ShimuraVarieties §P.1); Z(ℚ) is discrete iff Z°(ℚ) is, Z°(ℚ) having finite index.

Proof or construction:

1. AdelicAlgebraicGroups §1.3 (discreteness in the finite adeles alone): T(ℚ) is discrete in T(𝔸\_f) iff T(ℚ)∩U is finite for one compact open U; for U the integral points of a model this intersection is an arithmetic subgroup T(ℤ).
2. Ono's theorem as used by Milne: T(ℤ)∩T_a(ℚ) has finite index in T(ℤ), and T_a(ℝ)/(T(ℤ)∩T_a(ℚ)) is compact. The compactness half is AdelicAlgebraicGroups §3.4 (arithmetic quotients of anisotropic groups are compact) applied to T_a; the finite-index half is requested.
3. For a faithful representation T⊂GL_n, T(ℤ)⊂GL_n(ℤ) is discrete in T(ℝ)⊂GL_n(ℝ), and so is T(ℤ)∩T_a(ℚ) in T_a(ℝ); a discrete subgroup with compact quotient of the abelian Lie group T_a(ℝ) is finite iff T_a(ℝ) is compact. With the finite-index statement, T(ℤ) is finite iff T_a(ℝ) is compact.
4. For a datum, apply this to T=Z(G)°.

Acceptance:

- For G_m, T_a=1, so ℚ^× is discrete in 𝔸\_f^×.
- For the norm-one torus of ℚ(i), T_a=T has compact real points U(1), so T(ℚ) is discrete; T(ℤ)={±1,±i}.
- For the norm-one torus of ℚ(√2), T_a=T has real points {(a,b):ab=1}, not compact, and T(ℤ)={±(1+√2)^n} is infinite, so T(ℚ) is not discrete.
- The GL₂ datum satisfies SV5 and the restriction-of-scalars Hilbert datum over ℚ(√2) does not.

Direct prerequisites: `ShimuraData:D4/additional-axioms`; `AdelicAlgebraicGroups:AA.1`; `AdelicAlgebraicGroups:AA.3`; `ArithmeticLocallySymmetricSpaces:ALS.0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 5.26, Example 5.25 and Remark 5.27, p.64. Milne proves that T(ℚ) is discrete in T(𝔸\_f) exactly when the largest ℚ-anisotropic subtorus has compact real points, using Ono's theorem on arithmetic subgroups of tori, checks G_m and the norm-one tori of ℚ(i) and ℚ(√2), and restates SV5 through the centre.

Planet: Discreteness criterion for the centre.

<a id="d4-pel-type"></a>

### PEL type

Node `ShimuraData:D4/pel-type` (definition). Lean name: `TauCeti.Shimura.PureDatum.IsPELType`.

A pure datum (G,X) is of PEL type if it is isomorphic, as a datum, to RationalPELDatum.toShimuraDatum(𝒟) of PELModuli §M0.12 for a rational PEL datum 𝒟=(B,\*,V,ψ,h) with V≠0 whose similitude group G_𝒟 is connected and satisfies SV3; the witness is 𝒟 together with the isomorphism. By §M0.12 the Siegel embedding G_𝒟→GSp(V,ψ) is a morphism to the genus-g Siegel datum (2g=dim_ℚV), so PEL type implies Hodge type; a datum of PEL type satisfies SV4.

Hypotheses and conventions:

- Rational PEL data, their groups, domains and Shimura data are PELModuli §§M0.6–M0.12's; data and their isomorphisms are ShimuraVarieties §P.1's.
- Connectedness of G_𝒟 and SV3 are imposed explicitly: §M0.12 shows that type D groups are disconnected and that wholly definite unitary data of rank at least two fail SV3 (see ShimuraData/E18).

Proof or construction:

1. The predicate is an existential over rational PEL data with V≠0, connected group and SV3, and over isomorphisms of data.
2. Invariance under isomorphism: compose the witness isomorphism.
3. PEL⇒Hodge: §M0.12's siegelMorphism is a closed immersion of groups carrying X_𝒟 into the Siegel domain, a Hodge-type witness in the sense of ShimuraVarieties §P.1.
4. SV4: the weight of toShimuraDatum(𝒟) acts on V by the scalar r⁻¹, which is defined over ℚ.

API:

- `TauCeti.Shimura.pelType_iso` (compatibility): PEL type is invariant under isomorphism of data.
- `TauCeti.Shimura.pelType_hodgeType` (relation): PEL type implies Hodge type, through PELModuli §M0.12's siegelMorphism.
- `TauCeti.Shimura.pelType_sv4` (relation): A datum of PEL type satisfies SV4.
- `TauCeti.Shimura.pelType_ofDatum` (constructor): A rational PEL datum with V≠0, connected group and SV3 gives a datum of PEL type.

Unit tests:

- `TauCeti.Shimura.tests.pelSiegel` (computation): The genus-g Siegel datum (g≥1) is of PEL type, through the Siegel PEL datum with B=ℚ (PELModuli §M5.1).
- `TauCeti.Shimura.tests.pelHilbertStar` (computation): For totally real F the scalar-determinant Hilbert datum of PELModuli §M5.4 is of PEL type.
- `TauCeti.Shimura.tests.pelQuaternionNot` (non-example): Milne's Example 5.24 datum for a quaternion algebra over ℚ(√2) split at exactly one real place is not of PEL type: it fails SV4.

Acceptance:

- PEL type is invariant under isomorphism of data.
- PEL type implies Hodge type.
- A datum of PEL type satisfies SV4.
- A rational PEL datum with V≠0, connected group and SV3 gives a datum of PEL type.
- The genus-g Siegel datum (g≥1) is of PEL type, through the Siegel PEL datum with B=ℚ (PELModuli §M5.1).
- For totally real F the scalar-determinant Hilbert datum of PELModuli §M5.4 is of PEL type.
- The quaternion datum of Milne's Example 5.24 with exactly one split real place of ℚ(√2) is not of PEL type, since it fails SV4.

Uses:

- PELModuli §M0.12 (TauCetiRoadmap PR #966): toShimuraDatum and siegelMorphism are the witnesses and the Hodge-type comparison
- ShimuraData:D4/type-implications: PEL type heads the chain PEL ⇒ Hodge ⇒ abelian ⇒ preabelian
- Milne SVI §8, p.88: a PEL Shimura datum is defined when G is connected and maps into the Siegel datum

Direct prerequisites: `ShimuraVarieties:V0`; `PELModuli:M0`; `ShimuraData:D4/additional-axioms`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §8, PEL data and Proposition 8.14, pp.86–88. Milne builds PEL data from a simple ℚ-algebra with positive involution of type A or C and a symplectic module, constructs h by Proposition 8.14, and calls (G,X) a PEL Shimura datum when G is connected, observing that G embeds into the Siegel group carrying X into the Siegel domain. His claim on p.88 that SV1–SV4 then hold needs SV3 as an extra hypothesis (E18).

Planet: PEL type.

<a id="d4-connected-datum-lift"></a>

### Lifting connected data to full data

Node `ShimuraData:D4/connected-datum-lift` (theorem). Lean name: `TauCeti.Shimura.exists_pureDatum_lift`.

Let H be a semisimple ℚ-group and h̄:S→H^ad_ℝ satisfy SV1–SV3 (a connected datum in ShimuraVarieties §P.1's convention). Then there are a connected reductive ℚ-group G with G^der=H and an algebraic h:S→G_ℝ with ad∘h=h̄ such that the G(ℝ)-class of h is a pure datum satisfying SV1, SV2, SV2\*, SV3, SV4, SV5 and SV6. In Milne's two steps: first G with G^der=H, rational weight and centre split by a CM field; then, replacing G by the preimage of the smallest subtorus of G/G^der whose real points contain the image of h, SV2\* as well.

Hypotheses and conventions:

- H is semisimple over ℚ and h̄ satisfies SV1–SV3; the connected convention, special pairs and maximal tori through h̄ are ShimuraVarieties §§P.1 and P.5's.
- The central extension with prescribed derived cover (Milne–Shih 1982, 3.1, as quoted by Milne 2013) is requested from ReductiveGroupsPartII §RG2.1.

Proof or construction:

1. Replace h̄ by an H^ad(ℝ)^+-conjugate factoring through T̄\_ℝ for a maximal ℚ-torus T̄ of H^ad (Milne 2013, Proposition 8.1; ShimuraVarieties §P.5). T̄\_ℝ is anisotropic by SV2, so complex conjugation acts as −1 on X\*(T̄) and T̄ splits over a CM field L, chosen Galois over ℚ.
2. Take a central extension 1→N→G→H^ad→1 with G^der=H and N a product of copies of Res_{L/ℚ}G_m (ReductiveGroupsPartII §RG2.1, requested).
3. The preimage T of T̄ is a maximal torus. Lift μ\_h̄ to μ∈X_\*(T), possible because N is connected. Its weight w=−μ−ιμ lies in X_\*(N); X_\*(N) is an induced Gal(ℂ/ℝ)-module, so its Tate group Ĥ⁰ vanishes and w=(ι+1)μ₀ with μ₀∈X_\*(N). Replacing μ by μ−μ₀ makes w=0, in particular rational; let h correspond to μ.
4. Replace G by the preimage of the smallest subtorus of G/G^der whose real points contain the image of h; it is ℝ-anisotropic, which gives SV2\*. SV1 and SV3 depend only on h̄; SV2 follows from SV2\*; SV5 follows from SV2\* and D4/sv5-criterion, since Z(ℝ)/w(ℝ^×) is compact; SV6 holds because the new centre lies in N, split by L.

Acceptance:

- For H=SL₂ and its connected datum on ℍ, G=GL₂ with its usual h is such a lift.
- The fundamental PGL₂ cocharacter does not lift to SL₂ (ShimuraVarieties §P.1 Check), so a lift with G^der=SL₂ must have G≠SL₂.
- For H trivial the construction returns a torus G and may return G=1 with h trivial.

Direct prerequisites: `ShimuraData:D4/additional-axioms`; `ShimuraData:D4/sv5-criterion`; `ShimuraVarieties:V0`; `ReductiveGroupsPartII:RG2.1`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

Sources:

- [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §8, Proposition 8.8 and Corollary 8.9, pp.512–513; Proposition 8.1, p.509. Milne proves that a semisimple H with h̄ satisfying SV1–SV3 is the derived group of a reductive G with a lift h whose weight is rational and whose centre is split by a CM field, and that after shrinking the centre the lift satisfies SV1, SV2\* and SV3; Proposition 8.1 moves h into a rational maximal torus. The central-extension input is quoted there from Milne–Shih.
- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Aside after Remark 5.30, p.66. Milne restates the result: every connected datum lifts to a datum with G^der=H satisfying SV1, SV2, SV2\*, SV3, SV4, SV5 and SV6.

Planet: Lifting connected Shimura data.

<a id="d5"></a>

## D5. Explicit data, coordinates and neatness

Neat elements and levels, the arithmetic component subgroups with their ineffective kernel, the torus, CM, GL₂ and Siegel data, and the scalar-determinant Hilbert datum with its trace embedding are owned upstream (AdelicAlgebraicGroups §4.3; ShimuraVarieties §§P.4, 0.1, 0.4, 5.1; PELModuli §M5.4). This layer keeps the restriction-of-scalars Hilbert datum and its comparison with the scalar-determinant one, the Siegel compact dual `LG(g,2g)`, the coordinate dictionaries the routed papers need (the Siegel Borel, Weyl permutations and Kostant sequences of Boxer–Pilloni; the genus-two roots, Kostant actions, compact Cartan and Cayley transform of Calegari–Geraghty; Pilloni's lower-Borel conventions, beside ReductiveGroupsPartII §RG2.5's lattices), the adelic neatness of BCGP Definition 3.2.1 and the corrected unipotent-Iwahori neatness criterion of BCGP Lemma 7.8.3 (ShimuraData/E17).

**Dependencies.** Within this roadmap: `ShimuraData:D0`, `ShimuraData:D3`. Other roadmaps: `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.4`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `PELModuli:M0`, `PELModuli:M5`, `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.5`, `ShimuraVarieties:V0`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`.

**Remaining refinements.** Hilbert compact dual requires nonaffine Weil restriction of ℙ¹ (gap). Suggested signatures for the Siegel and GSp₄ computations use explicit coordinates; their identification with the supplier root data of ReductiveGroups layer 7 is stated as a hypothesis-free comparison only where both sides exist at the pins.

<a id="d5-adelic-neat"></a>

### Adelic torsion-intersection neatness

Node `ShimuraData:D5/adelic-neat` (definition). Lean name: `TauCeti.Shimura.adelicNeat`.

Fix compatible embeddings ℚ̄→ℚ̄ℓ. For g∈G(𝔸f), let Λg,ℓ be the subgroup of ℚ̄ℓˣ generated by its local eigenvalues. g is adelically neat when the intersection over ℓ of the torsion subgroups ℚ̄ˣ∩Λg,ℓ is {1}; for prime-to-p adeles intersect only ℓ≠p. An adelic compact open is neat when every element is. Rationally conjugate elements and rational elements are compared explicitly.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.
- For Res_F/ℚ GSp₄, indices ℓ in Definition 3.2.1 are rational primes. Λg,ℓ uses all eigenvalues of the faithful ℚ\_ℓ representation, including every F-place above ℓ. Its pullback from ℚ̄\_ℓ to ℚ̄ retains algebraic products of local eigenvalues even when the individual eigenvalues are not algebraic over ℚ.

Proof or construction:

1. Use eigenvalue-generated subgroups at all local places and transport only global torsion roots via the fixed embeddings. Non-torsion intersection is not required trivial.

API:

- `TauCeti.Shimura.adelicNeatRational` (characterisation): An adelically neat element coming from G(ℚ) is rationally neat.
- `TauCeti.Shimura.adelicNeatConjugate` (characterisation): Local/adelic conjugation preserves the eigenvalue torsion condition.
- `TauCeti.Shimura.primeToPNeatInsert` (characterisation): An adelically neat prime-to-p level remains adelically neat after inserting any compact open p-component.

Unit tests:

- `TauCeti.Shimura.tests.adelicIdentity` (computation): The identity adele is adelically neat.
- `TauCeti.Shimura.tests.adelicRationalMinusOne` (computation): The rational scalar −1 is not adelically neat.
- `TauCeti.Shimura.tests.primeToPInsert` (computation): A prime-to-p level certified at v≠p stays neat for every p-level.

Acceptance:

- Fix compatible embeddings ℚ̄→ℚ̄ℓ. For g∈G(𝔸f), let Λg,ℓ be the subgroup of ℚ̄ℓˣ generated by its local eigenvalues. g is adelically neat when the intersection over ℓ of the torsion subgroups ℚ̄ˣ∩Λg,ℓ is {1}; for prime-to-p adeles intersect only ℓ≠p. An adelic compact open is neat when every element is. Rationally conjugate elements and rational elements are compared explicitly.

Uses:

- PAPER-BOXER-CALEGARI-GEE-PILLONI-21 Definition3.2.1: The consumer uses adelic torsion-intersection neatness through these concrete interfaces: An adelically neat element coming from G(ℚ) is rationally neat. Local/adelic conjugation preserves the eigenvalue torsion condition.
- ShimuraData:D5/iwahori-neat: the Iw₁ criterion concludes adelic neatness of every element of K, then rational neatness of the conjugate intersections

Direct prerequisites: `AdelicAlgebraicGroups:AA.4`; `AdelicAlgebraicGroups:AA.1`.

Sources:

- [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Definition 3.2.1, pp.201–202. For adelic torsion-intersection neatness, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Adelic neatness.

<a id="d5-siegel-reflex-dual"></a>

### Siegel compact dual

Node `ShimuraData:D5/siegel-reflex-dual` (lemma). Lean name: `TauCeti.Shimura.siegelReflexDual`.

For the genus-g Siegel datum of ShimuraVarieties §P.4 (g≥1) on a symplectic ℚ-space of dimension 2g, μ\_h is GSp_{2g}(ℂ)-conjugate to the ℚ-rational cocharacter z↦diag(zI_g,I_g) in a symplectic basis whose first g vectors span a Lagrangian L₀. Its filtration parabolic (D3/filtration-parabolic) is the Siegel parabolic stabilizing a Lagrangian, so the compact dual (D3/compact-dual) is the Lagrangian Grassmannian LG(g,2g), of dimension g(g+1)/2=dim_ℂX. It is already defined over ℚ=E(G,X), and the descended compact dual of D3/reflex-flag-descent has the ℚ-point L₀.

Hypotheses and conventions:

- The Siegel datum and its reflex field ℚ are ShimuraVarieties §§P.3–P.4's; the filtration parabolic and compact dual are D3/filtration-parabolic and D3/compact-dual.

Proof or construction:

1. The cocharacter diag(zI_g,I_g) has similitude z and weights 1 on L₀ and 0 on a complementary Lagrangian; it is conjugate to μ\_h because both have these weights on a Lagrangian splitting and GSp_{2g}(ℂ) acts transitively on such splittings.
2. The stabilizer of the filtration L₀⊂V is the Siegel parabolic with Levi GL_g×G_m; G/P is the variety of Lagrangians.
3. The tangent space at L₀ is the space of symmetric maps L₀→V/L₀, of dimension g(g+1)/2.
4. The cocharacter is defined over ℚ, so the parabolic type is ℚ-rational and Par_t(G) has the rational point L₀.

Acceptance:

- For g=1, LG(1,2)=ℙ¹ and dim=1.
- For g=2, LG(2,4) has dimension 3 and is a smooth quadric threefold.
- The full Grassmannian Gr(g,2g), of dimension g², is not the compact dual for g≥2.

Direct prerequisites: `ShimuraVarieties:V0`; `ShimuraData:D3/filtration-parabolic`; `ShimuraData:D3/compact-dual`; `ShimuraData:D3/reflex-flag-descent`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §6, Siegel datum, pp.68–69; §12, Example 12.4(b), p.112. Milne describes the Siegel datum, its domain of positive or negative complex structures, and computes its reflex field ℚ from a ℚ-rational representative of the μ class; the Lagrangian compact dual is the flag variety of the Siegel parabolic.

<a id="d5-hilbert-datum"></a>

### Restriction-of-scalars Hilbert datum

Node `ShimuraData:D5/hilbert-datum` (construction). Lean name: `TauCeti.Shimura.hilbertDatum`.

For totally real F/ℚ of degree d, let G=ResF/ℚGL₂ and h have the standard GL₂ map at every real embedding. Its full real class is the product of ℍ± across embeddings, with 2ᵈ components and dimension d. Its reflex field is ℚ, compact dual ResF/ℚℙ¹, and weight is inverse scalar at every embedding. The determinant maps to ResF/ℚGm with diagonal norm h.

Hypotheses and conventions:

- The constructed (G,X) is to be a pure Shimura datum in the sense of ShimuraVarieties §P.1 (TauCetiRoadmap pull request #933): G connected reductive over ℚ, X a nonempty full G(ℝ)-class of algebraic h:S→G_ℝ satisfying SV1–SV3, with S the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.
- F/ℚ is a totally real number field of degree d≥1; G=Res_{F/ℚ}GL₂ with h equal to the GL₂ map of the ShimuraVarieties §P.4 GL₂ datum at every real embedding.

Proof or construction:

1. Check the axioms factorwise over ℝ and SV3 on the rational restriction-of-scalars adjoint group. μ is the same {1,0} cocharacter at every embedding, making its class Galois invariant.
2. Apply restriction of scalars to the determinant Hopf map and compare it with the split real point map. At every embedding det(h(z))=z z̄; this proves full-orbit compatibility because the target torus is commutative.

API:

- `TauCeti.Shimura.hilbertDomain` (compatibility): For totally real F of degree d, the constructed full domain is the product over real embeddings of the two half-planes, has complex dimension d and 2^d components.
- `TauCeti.Shimura.hilbertReflexDual` (compatibility): The actual uniform μ class has reflex field ℚ. Its descended projective compact dual splits into d copies of ℙ¹; the nonaffine Res_F/ℚℙ¹ functor comparison is an explicitly requested input, not supplied by affine Weil restriction.
- `TauCeti.Shimura.hilbertDeterminantMap` (characterisation): For T=Res_F/ℚ Gm with h_T(z)_σ=z z̄, Res(det) is a rational datum morphism (Res_F/ℚ GL₂,X)→(T,{h_T}). Its coordinate map is O(T)→O(G); after real base change its composition with the Hilbert S-map is h_T. Under the splitting at σ:F→ℝ its point map is (M_σ)_σ↦(det M_σ)_σ. This target has dimension \[F:ℚ], rather than the one-dimensional scalar norm torus.

Unit tests:

- `TauCeti.Shimura.tests.hilbertRational` (compatibility): For F=ℚ this recovers the GL₂ datum.
- `TauCeti.Shimura.tests.hilbertQuadratic` (computation): For F=ℚ(√2) the actual restriction-of-scalars Hilbert datum has dimension two and four connected components.
- `TauCeti.Shimura.tests.hilbertNonHodge` (non-example): For d>1 the standard trace representation of G does not land in rational GSp; determinants at real embeddings can differ.

Acceptance:

- For totally real F of degree d, the constructed full domain is the product over real embeddings of the two half-planes, has complex dimension d and 2^d components.
- The actual uniform μ class has reflex field ℚ. Its descended projective compact dual splits into d copies of ℙ¹; the nonaffine Res_F/ℚℙ¹ functor comparison is an explicitly requested input, not supplied by affine Weil restriction.
- For T=Res_F/ℚ Gm with h_T(z)_σ=z z̄, Res(det) is a rational datum morphism (Res_F/ℚ GL₂,X)→(T,{h_T}). Its coordinate map is O(T)→O(G); after real base change its composition with the Hilbert S-map is h_T. Under the splitting at σ:F→ℝ its point map is (M_σ)_σ↦(det M_σ)_σ. This target has dimension \[F:ℚ], rather than the one-dimensional scalar norm torus.
- For F=ℚ this recovers the GL₂ datum.
- For F=ℚ(√2) the actual restriction-of-scalars Hilbert datum has dimension two and four connected components.
- For d>1 the standard trace representation of G does not land in rational GSp; determinants at real embeddings can differ.

Uses:

- HilbertModularVarietiesAndShimuraCurves:H1: The consumer uses restriction-of-scalars hilbert datum through these concrete interfaces: X=(ℍ±)^Hom(F,ℝ), dim=d and number of components=2ᵈ. Reflex=ℚ and compact dual is ResF/ℚℙ¹.
- PELModuli:M5 boundary accepted RS-23: The consumer uses restriction-of-scalars hilbert datum through these concrete interfaces: X=(ℍ±)^Hom(F,ℝ), dim=d and number of components=2ᵈ. Reflex=ℚ and compact dual is ResF/ℚℙ¹.

Direct prerequisites: `ShimuraData:D0/hilbert-real-points`; `ShimuraVarieties:V0`; `ShimuraData:D3/reflex-flag-descent`; `ShimuraData:D3/compact-dual`; `ReductiveGroupsPartII:RG2.0a`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64, split quaternion case B=M₂(F). All real places are noncompact in this specialization, giving independently signed GL₂ components. The standard cocharacter at every embedding makes the entire class Galois invariant.

Planet: Restriction-of-scalars Hilbert datum.

<a id="d5-hilbert-star-datum"></a>

### Scalar-determinant Hilbert datum and its inclusion

Node `ShimuraData:D5/hilbert-star-datum` (construction). Lean name: `TauCeti.Shimura.hilbertStarDatum`.

Let G\*⊂G=Res_{F/ℚ}GL₂ be the subgroup with determinant in G_m, the group of PELModuli §M5.4's Case C Hilbert datum, whose Shimura datum (G\*,X\*) is RationalPELDatum.toShimuraDatum of §M0.12. Its domain X\* consists of the all-upper and all-lower products of half-planes inside the domain X of D5/hilbert-datum, so it has two components and dimension d; its compact dual is the descended Res_{F/ℚ}ℙ¹ of D5/hilbert-datum. The inclusion G\*→G is a morphism of data whose image in X is exactly those two components; it is a closed immersion of groups, an isomorphism on derived groups (Res_{F/ℚ}SL₂) and on adjoint data.

Hypotheses and conventions:

- F is a totally real number field of degree d≥1. The datum (G\*,X\*), its reflex field ℚ and relative dimension d are PELModuli §M5.4's (with §M0.12); D5/hilbert-datum is the restriction-of-scalars datum.
- PELModuli §M5.4 uses h(√−1)(a,b)=(−b,a) in each real factor; this h lies in the same GL₂(ℝ)^d-class as the h of D5/hilbert-datum, so no change of convention is needed.

Proof or construction:

1. G\* is the fibre product of det with the diagonal G_m (D0/hilbert-real-points); the inclusion is a closed immersion.
2. X\* is the G\*(ℝ)-class of h. A common determinant t acts on all factors with the same sign, and the determinant-one factors act transitively on each ℍ^±, so X\* is the union of the two same-sign products.
3. G\*^der=G^der=Res_{F/ℚ}SL₂ and G\*^ad=G^ad=Res_{F/ℚ}PGL₂, so the connected adjoint data agree.
4. The compact dual of X\* is the flag variety of the same parabolic type, hence the same descended Res_{F/ℚ}ℙ¹.

API:

- `TauCeti.Shimura.hilbertStarPoints` (characterisation): The points of G\* are the points of Res_{F/ℚ}GL₂ with a common scalar determinant (D0/hilbert-real-points and D0/hilbert-adelic-points).
- `TauCeti.Shimura.hilbertStarDomain` (compatibility): X\* is the union of the two same-sign products of half-planes in X; dimension d; reflex field ℚ (PELModuli §M5.4).
- `TauCeti.Shimura.hilbertStarInclusion` (compatibility): The inclusion G\*→Res_{F/ℚ}GL₂ is a closed immersion and a morphism of data, an isomorphism on derived groups and on connected adjoint data.

Unit tests:

- `TauCeti.Shimura.tests.starRational` (degenerate): At F=ℚ, the constructed G\* datum is isomorphic to the GL₂ datum, including its full Hodge orbit.
- `TauCeti.Shimura.tests.starQuadratic` (computation): For F=ℚ(√2) the actual common-determinant Hilbert datum has dimension two and two connected components.
- `TauCeti.Shimura.tests.starMixedSignFalse` (non-example): A real tuple with determinants of opposite signs does not lie in G\*.

Acceptance:

- Points of G\* have a common scalar determinant.
- The datum (G\*,X\*) has the two same-sign products of half-planes, dimension d and reflex field ℚ; mixed signs are absent.
- The inclusion G\*→Res_{F/ℚ}GL₂ is a closed immersion and a morphism of data whose real point map is the tuple inclusion.
- At F=ℚ, G\*=GL₂ and the inclusion is the identity datum morphism.
- For F=ℚ(√2) the datum (G\*,X\*) has dimension two and two components, against four for Res_{F/ℚ}GL₂.
- A real tuple with determinants of opposite signs does not lie in G\*(ℝ).

Uses:

- PELModuli §M5.4 hilbertTraceEmbedding: the trace embedding into GSp is defined on G\*, whose points have a common scalar determinant
- PELModuli:M5: The consumer uses scalar-determinant hilbert datum through these concrete interfaces: Its points have a common scalar determinant. Its full domain has two same-sign components and dimension d.
- HilbertModularVarietiesAndShimuraCurves:H1: The consumer uses scalar-determinant hilbert datum through these concrete interfaces: Its points have a common scalar determinant. Its full domain has two same-sign components and dimension d.

Direct prerequisites: `PELModuli:M5`; `PELModuli:M0`; `ShimuraVarieties:V0`; `ShimuraData:D5/hilbert-datum`; `ShimuraData:D0/hilbert-real-points`; `ShimuraData:D3/reflex-flag-descent`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

Sources:

- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §9, Hilbert modular varieties (type C PEL), pp.94–95; Example 5.24, pp.63–64. Milne treats Hilbert modular varieties as PEL varieties whose group is the subgroup of Res_{F/ℚ}GL₂ with rational determinant, and Example 5.24 gives the full restriction-of-scalars group; the comparison of the two domains is computed here.

<a id="d5-siegel-root-convention"></a>

### Siegel Borel and dominant cones

Node `ShimuraData:D5/siegel-root-convention` (lemma). Lean name: `TauCeti.Shimura.siegelRootConvention`.

Use the native R7 symplectic root datum. In BP coordinates κ=(k₁,…,k_g;k), Σk_i≡k mod 2, and the Borel inside the opposite Siegel parabolic is upper triangular on each diagonal block. Its compact roots are e_i−e_j (i<j), and its noncompact roots are −e_i−e_j (i≤j). Thus ρ\_i=−i, ρ\_nc,i=−(g+1)/2, both with central coordinate zero; G-dominance is 0≥k₁≥⋯≥k_g and M-dominance k₁≥⋯≥k_g. These are not the CG upper-triangular full-Borel signs.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.
- g≥1. R7 supplies the GSp₂g torus, based root pairing over ℚ, integral parity character lattice and the BP Borel/Levi comparison; the lattice pairing is retained when specifying the dominant cones.

Proof or construction:

1. Subtract the compact positive roots from the full positive system; count occurrences of each e_i in the two sums and pair with simple coroots.

Acceptance:

- Use the native R7 symplectic root datum. In BP coordinates κ=(k₁,…,k_g;k), Σk_i≡k mod 2, and the Borel inside the opposite Siegel parabolic is upper triangular on each diagonal block. Its compact roots are e_i−e_j (i<j), and its noncompact roots are −e_i−e_j (i≤j). Thus ρ\_i=−i, ρ\_nc,i=−(g+1)/2, both with central coordinate zero; G-dominance is 0≥k₁≥⋯≥k_g and M-dominance k₁≥⋯≥k_g. These are not the CG upper-triangular full-Borel signs.

Direct prerequisites: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ShimuraVarieties:V0`; `ShimuraData:D3/filtration-parabolic`; `mathlib:RootPairing`; `mathlib:RootPairing.Base`; `mathlib:RootPairing.Base.IsPos`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, pp.33–34. For siegel borel and dominant cones, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-siegel-weyl-permutations"></a>

### Siegel Weyl permutation comparison

Node `ShimuraData:D5/siegel-weyl-permutations` (lemma). Lean name: `TauCeti.Shimura.siegelWeylPermutations`.

For g≥1 the supplier Weyl group identifies with permutations of {1,…,2g} commuting with i↦2g+1−i. The Siegel Levi subgroup preserves {1,…,g}. Minimal left-coset representatives satisfy w⁻¹(g+1)≺⋯≺w⁻¹(2g), for the cyclic order g+1≺⋯≺2g≺1≺⋯≺g, not the usual numeric order. There are 2^g such representatives.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.
- g≥1. The permutation is the Weyl action on the ordered standard-representation weights, and length and the Levi subgroup come from the same BP based root datum. This identification precedes the representative count.

Proof or construction:

1. Translate the positive Levi roots using the cyclic order determined by this Borel, then choose one element from each reflected pair for the inverse image of the last half. Their cyclic order determines a unique representative.

Acceptance:

- For g≥1 the supplier Weyl group identifies with permutations of {1,…,2g} commuting with i↦2g+1−i. The Siegel Levi subgroup preserves {1,…,g}. Minimal left-coset representatives satisfy w⁻¹(g+1)≺⋯≺w⁻¹(2g), for the cyclic order g+1≺⋯≺2g≺1≺⋯≺g, not the usual numeric order. There are 2^g such representatives.

Direct prerequisites: `ShimuraData:D5/siegel-root-convention`; `ShimuraData:D3/kostant-representatives`; `ShimuraData:D3/kostant-cone-criterion`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `mathlib:RootPairing.weylGroup`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34; corrected cyclic criterion ShimuraData/E3. For siegel weyl permutation comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-kostant-sequence"></a>

### Siegel Kostant sequence

Node `ShimuraData:D5/kostant-sequence` (definition). Lean name: `TauCeti.Shimura.kostantSequence`.

For w∈^MW set a₀=0 and a_i=#{j≤i:g+j∈w⁻¹{g+1,…,2g}}. Thus a_i−a_{i−1}∈{0,1}. The increment subset determines w using the cyclic order. This sequence is unrelated to the names of Weyl elements w₀,w₁,… used in CG.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.

Proof or construction:

1. Use finite cardinalities of initial segments of the selected subset.

API:

- `TauCeti.Shimura.kostantSequenceZero` (characterisation): a₀=0.
- `TauCeti.Shimura.kostantSequenceStep` (characterisation): The increment at i is the indicator of g+i∈w⁻¹{g+1,…,2g}.
- `TauCeti.Shimura.kostantSequenceInjective` (characterisation): The sequence determines w uniquely among minimal left representatives.

Unit tests:

- `TauCeti.Shimura.tests.sequenceGenusOne` (degenerate): For g=1 the two sequences are (0,0) and (0,1).
- `TauCeti.Shimura.tests.sequenceGenusTwo` (computation): For g=2 the four sequences are (0,0,0),(0,0,1),(0,1,1),(0,1,2).
- `TauCeti.Shimura.tests.sequenceStepFalse` (non-example): (0,0,2) cannot occur.

Acceptance:

- For w∈^MW set a₀=0 and a_i=#{j≤i:g+j∈w⁻¹{g+1,…,2g}}. Thus a_i−a_{i−1}∈{0,1}. The increment subset determines w using the cyclic order. This sequence is unrelated to the names of Weyl elements w₀,w₁,… used in CG.

Uses:

- ShimuraData:D5/kostant-sequence-geometry: Intersection meaning of Kostant sequences consumes siegel kostant sequence: a₀=0.
- HigherHidaAndColemanTheory: support conditions: The consumer uses siegel kostant sequence through these concrete interfaces: a₀=0. The increment at i is the indicator of g+i∈w⁻¹{g+1,…,2g}.

Direct prerequisites: `ShimuraData:D5/siegel-weyl-permutations`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For siegel kostant sequence, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Siegel Kostant sequence.

<a id="d5-kostant-sequence-geometry"></a>

### Intersection meaning of Kostant sequences

Node `ShimuraData:D5/kostant-sequence-geometry` (theorem). Lean name: `TauCeti.Shimura.kostantSequenceGeometry`.

For x∈C_w⊂P\\G over any field, let L_x=x⁻¹⟨e_{g+1},…,e_{2g}⟩. Then a_i(w)=dim(L_x∩⟨e_{g+1},…,e_{g+i}⟩). The equality is invariant under the parabolic representative and constant on the Bruhat cell.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.
- In the BP matrix convention P stabilizes L₀=span(e_{g+1},…,e_{2g}), B preserves every E_i=span(e_{g+1},…,e_{g+i}), w is a minimal left representative and x lies in P·w̃·B. The Weyl lift acts on basis lines by its reflected permutation. No intersection-rank equality is assumed.

Proof or construction:

1. Check at the Weyl representative by counting basis indices; right B multiplication preserves the reference partial flag. Left P multiplication preserves its stabilized Lagrangian.

Acceptance:

- For x∈C_w⊂P\\G over any field, let L_x=x⁻¹⟨e_{g+1},…,e_{2g}⟩. Then a_i(w)=dim(L_x∩⟨e_{g+1},…,e_{g+i}⟩). The equality is invariant under the parabolic representative and constant on the Bruhat cell.

Direct prerequisites: `ShimuraData:D5/kostant-sequence`; `ShimuraData:D3/bruhat-integral`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `mathlib:Matrix.GeneralLinearGroup.toLin`.

Sources:

- [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34. For intersection meaning of kostant sequences, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-cg-roots"></a>

### Genus-two CG coordinate comparison

Node `ShimuraData:D5/gsp4-cg-roots` (lemma). Lean name: `TauCeti.Shimura.gsp4CgRoots`.

In CG upper-triangular coordinates χ=(a,b;c), χ(diag(t₁,t₂,νt₂⁻¹,νt₁⁻¹))=t₁ᵃt₂ᵇνᶜ. Positive roots are (1,−1;0),(0,2;−1),(1,1;−1),(2,0;−1), with simple first two, ρ=(2,1;−3/2), and coroots (1,−1;0),(0,1;0),(1,1;0),(1,0;0). Dominant cones are a≥b≥0 for G and a≥b for M. The isogeny Tder×Z→T sends χ to Pilloni parity coordinates (a,b;a+b+2c).

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.
- R7 supplies the CG torus, its character/coroot pairing, upper full Borel and Siegel Levi. The displayed positive roots are paired in order with the displayed coroots; the first two pairs are simple and the first is the Levi simple pair.

Proof or construction:

1. Evaluate each root on the torus and check coroot pairings; sum roots for ρ. Pull back a character along diag(st₁,st₂,st₂⁻¹,st₁⁻¹) to get the coordinate conversion.

Acceptance:

- In CG upper-triangular coordinates χ=(a,b;c), χ(diag(t₁,t₂,νt₂⁻¹,νt₁⁻¹))=t₁ᵃt₂ᵇνᶜ. Positive roots are (1,−1;0),(0,2;−1),(1,1;−1),(2,0;−1), with simple first two, ρ=(2,1;−3/2), and coroots (1,−1;0),(0,1;0),(1,1;0),(1,0;0). Dominant cones are a≥b≥0 for G and a≥b for M. The isogeny Tder×Z→T sends χ to Pilloni parity coordinates (a,b;a+b+2c).

Direct prerequisites: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ShimuraData:D5/siegel-root-convention`; `mathlib:RootPairing`; `mathlib:RootPairing.Base`; `mathlib:RootPairing.Base.IsPos`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1, PDF pp.7–8. For genus-two cg coordinate comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-kostant"></a>

### Genus-two Kostant actions

Node `ShimuraData:D5/gsp4-kostant` (lemma). Lean name: `TauCeti.Shimura.gsp4Kostant`.

In CG coordinates ^MW has four elements with actions (a,b;c), (a,−b;b+c), (b,−a;a+c), (−b,−a;a+b+c), of lengths 0,1,2,3. The element called w₀ in CG acts (a,b;c)↦(b,a;c) and is the longest Levi element. The full longest Weyl element acts (−a,−b;a+b+c). The duality involution w↦w₀,Mww₀,G reverses these four lengths.

Hypotheses and conventions:

- G is split reductive with T⊂B⊂P, standard Levi M and its Weyl subgroup WM. Length/Bruhat order use this based root datum; representatives are for left cosets WM\\W. Integral assertions additionally require the pinned split reductive ℤ-model and base-change-compatible supplier cells/closures.
- The four representatives are actual elements of the imported Weyl group with its length function, indexed by a bijection Fin 4→^MW. Their coordinate actions are required for every rational weight. The involution sends index i to 3−i; the longest Levi and full elements have lengths 1 and 4.

Proof or construction:

1. Generate signed permutations, pair with the single positive Levi root, and compute the four minimal representatives and actions. Check the longest elements separately.

Acceptance:

- In CG coordinates ^MW has four elements with actions (a,b;c), (a,−b;b+c), (b,−a;a+c), (−b,−a;a+b+c), of lengths 0,1,2,3. The element called w₀ in CG acts (a,b;c)↦(b,a;c) and is the longest Levi element. The full longest Weyl element acts (−a,−b;a+b+c). The duality involution w↦w₀,Mww₀,G reverses these four lengths.

Direct prerequisites: `ShimuraData:D5/gsp4-cg-roots`; `ShimuraData:D3/kostant-involution`; `ShimuraData:D3/kostant-representatives`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `mathlib:RootPairing.weylGroup`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1.1, PDF p.8; corrections in sourceIssues: E6. For genus-two kostant actions, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-cone-reversal"></a>

### Genus-two chamber reversal

Node `ShimuraData:D5/gsp4-cone-reversal` (lemma). Lean name: `TauCeti.Shimura.gsp4ConeReversal`.

For C_i=ŵ\_i C_G⁺, i=0,1,2,3, the map −w₀,M on the character vector space sends C_i to C_{3−i}. Here the minus negates all three coordinates and w₀,M swaps a,b; the central coordinate is unrestricted. This distinguishes the Levi longest element from the full longest element.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Apply (a,b;c)↦(−b,−a;−c) to the inequalities defining each chamber. This is the chamber-level form of the Kostant involution.

Acceptance:

- For C_i=ŵ\_i C_G⁺, i=0,1,2,3, the map −w₀,M on the character vector space sends C_i to C_{3−i}. Here the minus negates all three coordinates and w₀,M swaps a,b; the central coordinate is unrestricted. This distinguishes the Levi longest element from the full longest element.

Direct prerequisites: `ShimuraData:D5/gsp4-kostant`; `ShimuraData:D3/kostant-cones`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1, PDF p.8; Theorem 5.5 proof, PDF pp.28–29. For genus-two chamber reversal, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-centralizer"></a>

### Genus-two real centralizer

Node `ShimuraData:D5/gsp4-centralizer` (theorem). Lean name: `TauCeti.Shimura.gsp4Centralizer`.

For CG J=h(i), K^h={g∈GSp₄(ℝ):gᵀg=ν(g)I₄}=ℝ\_{>0}K∞,1=ℝˣK∞,1, with K∞,1=Sp₄(ℝ)∩O(4). Every element has positive similitude. The full K∞=GSp₄(ℝ)∩O(4) also has negative similitudes and does not centralize h.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Use the symplectic equation together with gJ=Jg to derive gᵀg=ν(g)I. Positivity gives the positive scalar normalization. A negative-similitude orthogonal element sends J to −J.

Acceptance:

- For CG J=h(i), K^h={g∈GSp₄(ℝ):gᵀg=ν(g)I₄}=ℝ\_{>0}K∞,1=ℝˣK∞,1, with K∞,1=Sp₄(ℝ)∩O(4). Every element has positive similitude. The full K∞=GSp₄(ℝ)∩O(4) also has negative similitudes and does not centralize h.

Direct prerequisites: `ShimuraVarieties:V0`; `ShimuraData:D5/gsp4-cg-roots`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF pp.8–9; corrections in sourceIssues: E7,E8. For genus-two real centralizer, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

Planet: Genus-two real centralizer.

<a id="d5-gsp4-unitary"></a>

### Unitary identification of the centralizer

Node `ShimuraData:D5/gsp4-unitary` (theorem). Lean name: `TauCeti.Shimura.gsp4Unitary`.

Put S=\[\[0,1],\[1,0]]. Elements of K∞,1 are \[\[SAS,SB],\[−BS,A]] with AᵀA+BᵀB=I and AᵀB=BᵀA. The map k↦A+iB is a real Lie-group isomorphism K∞,1≅U(2).

Hypotheses and conventions:

- K∞,1 is the subgroup of GL₄(ℝ) satisfying kᵀk=I and kJ=Jk for the CG symplectic matrix J. U(2) is Mathlib's Matrix.unitaryGroup (Fin 2) ℂ. A and B are recovered from the lower-right block and from S times the upper-right block, so the isomorphism has the displayed inverse on every unitary matrix; ArithmeticLocallySymmetricSpaces §ALS.F.1 supplies the Lie group structures, for which a continuous isomorphism of closed matrix groups is an isomorphism of Lie groups.

Proof or construction:

1. Expand kᵀk=I and the J centralizer relation, then compare with (A+iB)\* (A+iB)=I. Block multiplication verifies the homomorphism and the displayed formula its inverse.

Acceptance:

- Put S=\[\[0,1],\[1,0]]. Elements of K∞,1 are \[\[SAS,SB],\[−BS,A]] with AᵀA+BᵀB=I and AᵀB=BᵀA. The map k↦A+iB is a real Lie-group isomorphism K∞,1≅U(2).

Direct prerequisites: `ShimuraData:D5/gsp4-centralizer`; `ArithmeticLocallySymmetricSpaces:ALS.0`; `mathlib:Matrix.unitaryGroup`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.9. For unitary identification of the centralizer, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-compact-cartan"></a>

### Genus-two compact Cartan

Node `ShimuraData:D5/gsp4-compact-cartan` (construction). Lean name: `TauCeti.Shimura.gsp4CompactCartan`.

Let H=ℝ\_{>0}H₁ in K^h with H₁ the diagonal U(1)² under K∞,1≅U(2). Its complex algebraic torus is (Gm³)/⟨(−1,−1,−1)⟩ in angular/scalar coordinates; its character lattice is {(a,b;c)∈ℤ³:a+b≡c mod2}. Characters evaluate as the corresponding exponential on h_C. Compact Cartan coordinates differ from split CG coordinates.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Take the inverse image of the diagonal unitary subgroup and multiply by positive scalars. The simultaneous sign identifies the complexified parametrization, yielding the parity character lattice.

API:

- `TauCeti.Shimura.compactCartanRank` (structure): The actual real rotation/scalar subgroup is isomorphic to ℝ\_{>0}×U(1)². Separately, its rank-three character lattice is additively isomorphic to ℤ³ in the parity coordinates.
- `TauCeti.Shimura.compactCartanParity` (characterisation): An angular/scalar character (a,b;c) lies in the separate character lattice precisely when a+b≡c modulo two.
- `TauCeti.Shimura.compactCartanEmbedding` (universal-property): A character u^a v^b r^c on the complex covering torus factors through the actual Cartan complexification if and only if it is trivial on (−1,−1,−1), equivalently a+b≡c modulo two.

Unit tests:

- `TauCeti.Shimura.tests.cartanParityTrue` (computation): (1,0;1),(0,1;1),(0,0;2) descend.
- `TauCeti.Shimura.tests.cartanParityFalse` (non-example): (1,0;0) does not descend.
- `TauCeti.Shimura.tests.cartanRank` (computation): The actual real group is ℝ\_{>0}×U(1)², and (a,b,k)↦(a,b;a+b+2k) bijects ℤ³ with its character lattice. This distinguishes the torus from its lattice.

Acceptance:

- The actual real rotation/scalar subgroup is isomorphic to ℝ\_{>0}×U(1)². Separately, its rank-three character lattice is additively isomorphic to ℤ³ in the parity coordinates.
- An angular/scalar character (a,b;c) lies in the separate character lattice precisely when a+b≡c modulo two.
- A character u^a v^b r^c on the complex covering torus factors through the actual Cartan complexification if and only if it is trivial on (−1,−1,−1), equivalently a+b≡c modulo two.
- (1,0;1),(0,1;1),(0,0;2) descend.
- (1,0;0) does not descend.
- The actual real group is ℝ\_{>0}×U(1)², and (a,b,k)↦(a,b;a+b+2k) bijects ℤ³ with its character lattice. This distinguishes the torus from its lattice.

Uses:

- ShimuraData:D5/gsp4-exp-kernel: Compact Cartan exponential kernel consumes genus-two compact cartan: H₁ has real dimension two and H has dimension three.
- AutomorphicFormsOnReductiveGroups:AF.4: The consumer uses genus-two compact cartan through these concrete interfaces: H₁ has real dimension two and H has dimension three. A character (a,b;c) descends iff a+b≡c mod2.
- GSp4NonregularModularityLifting: The consumer uses genus-two compact cartan through these concrete interfaces: H₁ has real dimension two and H has dimension three. A character (a,b;c) descends iff a+b≡c mod2.

Direct prerequisites: `ShimuraData:D5/gsp4-unitary`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF pp.9–10; Theorem 5.5 proof, PDF p.28; source issues E9–E10 record the kernel/parity correction. For genus-two compact cartan, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-exp-kernel"></a>

### Compact Cartan exponential kernel

Node `ShimuraData:D5/gsp4-exp-kernel` (lemma). Lean name: `TauCeti.Shimura.gsp4ExpKernel`.

In CG coordinates h(t₁,t₂;z) on h_C, the exponential kernel consists of (2πm,2πn;2πik) and (π+2πm,π+2πn;πi+2πik), for m,n,k∈ℤ. In particular the extra element h(π,π;πi) forces a+b≡c mod2 on integral characters.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Exponentiate the two commuting angular blocks and scalar block. The image is identity exactly when all three individual factors have the same sign; solve the two sign cases.

Acceptance:

- In CG coordinates h(t₁,t₂;z) on h_C, the exponential kernel consists of (2πm,2πn;2πik) and (π+2πm,π+2πn;πi+2πik), for m,n,k∈ℤ. In particular the extra element h(π,π;πi) forces a+b≡c mod2 on integral characters.

Direct prerequisites: `ShimuraData:D5/gsp4-compact-cartan`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.9. For compact cartan exponential kernel, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-cayley-basis"></a>

### Genus-two Cayley basis

Node `ShimuraData:D5/gsp4-cayley-basis` (construction). Lean name: `TauCeti.Shimura.gsp4CayleyBasis`.

For the CG J and real basis e₁,…,e₄, take f₁=e₁−ie₄,f₂=e₂−ie₃,f₃=e₃−ie₂,f₄=e₄−ie₁. They are the columns of C=\[\[I₂,−iS],\[−iS,I₂]] and give bases of the two ±i-eigenspaces of J. C is invertible, with inverse 1/2 \[\[I₂,iS],\[iS,I₂]].

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Multiply C by the proposed inverse and use S²=I. Apply J to each column to identify the eigenspaces.

API:

- `TauCeti.Shimura.cayleyInverse` (characterisation): C⁻¹=1/2 \[\[I₂,iS],\[iS,I₂]].
- `TauCeti.Shimura.cayleyHodgeLines` (compatibility): The first and last two columns span the two complex Hodge summands.
- `TauCeti.Shimura.cayleyConjugation` (characterisation): Conjugation exchanges the two summands with the reverse-order identification.

Unit tests:

- `TauCeti.Shimura.tests.cayleyProduct` (computation): C times the displayed inverse is I₄.
- `TauCeti.Shimura.tests.cayleyColumn` (computation): The first column is e₁−ie₄.
- `TauCeti.Shimura.tests.cayleyWrongSign` (computation): Replacing −iS in only one off-diagonal block makes the resulting matrix singular.

Acceptance:

- For the CG J and real basis e₁,…,e₄, take f₁=e₁−ie₄,f₂=e₂−ie₃,f₃=e₃−ie₂,f₄=e₄−ie₁. They are the columns of C=\[\[I₂,−iS],\[−iS,I₂]] and give bases of the two ±i-eigenspaces of J. C is invertible, with inverse 1/2 \[\[I₂,iS],\[iS,I₂]].

Uses:

- ShimuraData:D5/gsp4-cayley-action: Centralizer action in the Cayley basis consumes genus-two cayley basis: C⁻¹=1/2 \[\[I₂,iS],\[iS,I₂]].
- ShimuraData:D5/gsp4-pilloni-convention: Pilloni genus-two convention comparison consumes genus-two cayley basis: C⁻¹=1/2 \[\[I₂,iS],\[iS,I₂]].

Direct prerequisites: `ShimuraData:D5/gsp4-centralizer`; `ShimuraVarieties:V0`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.10. For genus-two cayley basis, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-cayley-action"></a>

### Centralizer action in the Cayley basis

Node `ShimuraData:D5/gsp4-cayley-action` (lemma). Lean name: `TauCeti.Shimura.gsp4CayleyAction`.

For k=\[\[SAS,SB],\[−BS,A]], C⁻¹kC=diag(SAS−iSBS,A+iB). In compact coordinates the positive compact root is (1,−1;0) and the three positive noncompact roots are (0,2;0),(1,1;0),(2,0;0), according to CG convention.

Hypotheses and conventions:

- Each rational group, real domain, and finite-adelic point comparison is the specified supplier object. Eigenvalue neatness uses the generated subgroup; all component and Borel conventions are stated explicitly.

Proof or construction:

1. Multiply the three block matrices; the off-diagonal blocks vanish and the diagonal blocks are as displayed. Evaluate compact torus characters on Hom blocks to identify compact and noncompact roots.

Acceptance:

- For k=\[\[SAS,SB],\[−BS,A]], C⁻¹kC=diag(SAS−iSBS,A+iB). In compact coordinates the positive compact root is (1,−1;0) and the three positive noncompact roots are (0,2;0),(1,1;0),(2,0;0), according to CG convention.

Direct prerequisites: `ShimuraData:D5/gsp4-cayley-basis`; `ShimuraData:D5/gsp4-unitary`; `ShimuraData:D5/gsp4-compact-cartan`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.10. For centralizer action in the cayley basis, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-gsp4-pilloni-convention"></a>

### Pilloni genus-two convention comparison

Node `ShimuraData:D5/gsp4-pilloni-convention` (lemma). Lean name: `TauCeti.Shimura.gsp4PilloniConvention`.

Import from ReductiveGroupsPartII §RG2.5 (gsp4-self-dual) the parity lattice X\*(T)={(a₁,a₂;c)∈ℤ³: c≡a₁+a₂ mod 2} with basis e₁=(1,0;1), e₂=(0,1;1), e₃=(0,0;2)=ν, its half-integral dual with basis f₁=(1,0;0), f₂=(0,1;0), f₃=(−½,−½;½), and the corrected base α₁=e₂−e₁, α₂=e₃−2e₂ with coroots f₂−f₁ and −f₂. For the Siegel datum in Pilloni's coordinates the positive system is that of the lower-triangular Borel: e₂−e₁, −2e₁+e₃, −e₁−e₂+e₃, −2e₂+e₃; ρ=(−2,−1;0); α₁ is the compact simple root and the other three positive roots are the noncompact roots in g_ℂ/p_Si. CG coordinates convert by (a,b;c)_CG↦(a,b;a+b+2c)_P, and the BP Borel swaps the compact order, giving ρ\_BP=(−1,−2;0) for g=2.

Hypotheses and conventions:

- The lattices, dual basis, corrected base and self-duality are ReductiveGroupsPartII §RG2.5's (PR #785), stated there in Pilloni's coordinates. Rational coordinates pair e_i with f_j by the ordinary dot product; a dual vector has coordinates (m−r/2,n−r/2;r/2) for integers m,n,r.

Proof or construction:

1. Apply the lattice conversion and negate the CG full positive roots, then pair with the imported coroots. Distinguish the BP block Borel from Pilloni’s lower full Borel.

Acceptance:

- Import R7 parity coordinates e₁=(1,0;1),e₂=(0,1;1),e₃=(0,0;2)=ν and the half-integral dual lattice {(b₁,b₂;d)∈(1/2)ℤ³:b₁+d,b₂+d∈ℤ}. Pilloni uses the lower full Borel: positives e₂−e₁,−2e₁+e₃,−e₁−e₂+e₃,−2e₂+e₃; simples e₂−e₁,−2e₂+e₃; ρ=(−2,−1;0), with coroots f₂−f₁ and −f₂ in the displayed dual basis. The first simple root is compact and the other positives lie in g_C/p_Si. The R7 lattice pairing and RG2.5 dualization must use these corrected root/coroot bases. The CG conversion is (a,b;c)_CG↦(a,b;a+b+2c)_P. The BP Borel swaps the compact order, giving ρ\_BP=(−1,−2;0) for g=2.

Direct prerequisites: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ShimuraData:D5/gsp4-cg-roots`; `ShimuraData:D5/siegel-root-convention`; `ShimuraData:D5/gsp4-cayley-action`; `ReductiveGroupsPartII:RG2.5`; `mathlib:RootPairing`; `mathlib:RootPairing.Base`; `mathlib:RootPairing.Base.IsPos`.

Sources:

- [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.1.1, author p.20; Remark 5.2.1.1, author p.23; corrected E11, scoped to the author copy. For pilloni genus-two convention comparison, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-local-eigenvalue-bound"></a>

### Unipotent reduction eigenvalue bound

Node `ShimuraData:D5/local-eigenvalue-bound` (lemma). Lean name: `TauCeti.Shimura.localEigenvalueBound`.

Let F_v/ℚ\_l be absolutely unramified, normalize v(l)=1, and let γ∈Iw₁(v)⊂GSp₄(F_v). Every eigenvalue λ in an algebraic closure satisfies v(λ−1)≥1/4, since χγ(X)≡(X−1)^4 modulo the maximal ideal.

Hypotheses and conventions:

- The local valuation extends to an algebraic closure and is normalized by v(l)=1. The eigenvalue bound uses absolute unramifiedness and the Iw₁ congruence χ(X)≡(X−1)^4. The torsion gap and final criterion require residue characteristic l>5; products use integer exponents.

Proof or construction:

1. Shift χγ to Y=X−1. All lower coefficients have valuation ≥1. If v(Y)<1/4, Y⁴ has strictly smaller valuation than every other term, contradicting the ultrametric equality at a root. The leading coefficient is 1.

Acceptance:

- Let F_v/ℚ\_l be absolutely unramified, normalize v(l)=1, and let γ∈Iw₁(v)⊂GSp₄(F_v). Every eigenvalue λ in an algebraic closure satisfies v(λ−1)≥1/4, since χγ(X)≡(X−1)^4 modulo the maximal ideal.

Direct prerequisites: `AdelicAlgebraicGroups:AA.4`; `ReductiveGroupsPartII:RG2.3`; `mathlib:AddValuation`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`; `mathlib:AddValuation.map_mul`; `mathlib:AddValuation.map_le_add`; `mathlib:AddValuation.map_inv`; `mathlib:AddValuation.map_zero`.

Sources:

- [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 7.8.3, published p.409. For unipotent reduction eigenvalue bound, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-local-products-bound"></a>

### Eigenvalue products retain the bound

Node `ShimuraData:D5/local-products-bound` (lemma). Lean name: `TauCeti.Shimura.localProductsBound`.

If v(λ\_j−1)≥1/4 for finitely many λ\_j, every integer product η=∏λ\_j^{n_j} also satisfies v(η−1)≥1/4. All λ\_j are units. Inversion preserves v(λ−1), and multiplication uses ab−1=(a−1)b+(b−1).

Hypotheses and conventions:

- The local valuation extends to an algebraic closure and is normalized by v(l)=1. The eigenvalue bound uses absolute unramifiedness and the Iw₁ congruence χ(X)≡(X−1)^4. The torsion gap and final criterion require residue characteristic l>5; products use integer exponents.

Proof or construction:

1. The closed ball 1+{x:v(x)≥1/4} is a multiplicative subgroup by the two identities. Induct on products and integer powers.

Acceptance:

- If v(λ\_j−1)≥1/4 for finitely many λ\_j, every integer product η=∏λ\_j^{n_j} also satisfies v(η−1)≥1/4. All λ\_j are units. Inversion preserves v(λ−1), and multiplication uses ab−1=(a−1)b+(b−1).

Direct prerequisites: `ShimuraData:D5/local-eigenvalue-bound`; `mathlib:AddValuation`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`; `mathlib:AddValuation.map_mul`; `mathlib:AddValuation.map_le_add`; `mathlib:AddValuation.map_inv`; `mathlib:AddValuation.map_zero`.

Sources:

- [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proof of Lemma 7.8.3, published p.409 (generated-group step expanded here). For eigenvalue products retain the bound, the passage fixes the object/convention used in the statement. The proof outline specifies the specialization; its external inputs remain prerequisites rather than additional claims about this source.

<a id="d5-iwahori-neat"></a>

### Unipotent Iwahori criterion for neatness

Node `ShimuraData:D5/iwahori-neat` (theorem). Lean name: `TauCeti.Shimura.iwahoriNeat`.

For a number field F and a compact open K⊂GSp₄(𝔸F,f), choose one rational prime ℓ>5. Suppose every place v|ℓ is absolutely unramified and the projection of K to GSp₄(F_v) is contained in Iw₁(v). Then every k∈K is adelically neat for the faithful ℚ-representation of Res_F/ℚ GSp₄ on the underlying ℚ-space of F⁴, as in Definition 3.2.1. Hence for every g∈GSp₄(𝔸F,f), every γ∈GSp₄(F)∩gKg⁻¹ is rationally neat in that representation. The same certification proves the prime-to-p statement when ℓ≠p and all places above ℓ are retained. For F=ℚ this recovers the one-place criterion. One arbitrary F-place does not suffice for this rational conclusion: see E17.

Hypotheses and conventions:

- The local valuation extends to an algebraic closure and is normalized by v(l)=1. The eigenvalue bound uses absolute unramifiedness and the Iw₁ congruence χ(X)≡(X−1)^4. The torsion gap and final criterion require residue characteristic l>5; products use integer exponents.
- The rational group is Res_F/ℚ GSp₄ and the faithful representation is the restriction of scalars of F⁴. At a rational prime ℓ its spectrum includes the standard eigenvalues for every completion F_v with v|ℓ and all embeddings of these completions into ℚ̄\_ℓ. K need not be a product, provided every certification projection lies in Iw₁(v). Absolute unramifiedness is required at every v|ℓ.

Proof or construction:

1. For each v|ℓ, the shifted degree-four characteristic polynomial and v(ℓ)=1 bound every standard eigenvalue λ by v(λ−1)≥1/4 (D5/local-eigenvalue-bound). Transport through every embedding of F_v into ℚ̄\_ℓ; the same normalized bound holds for every eigenvalue of the faithful rational representation, not just one four-dimensional factor.
2. D5/local-products-bound bounds the whole subgroup generated by these eigenvalues. By AdelicAlgebraicGroups §4.3 (distance of p-adic roots of unity from one), a nontrivial root of unity ζ has v(ζ−1)=0 if its order is prime to ℓ and v(ζ−1)=1/(ℓ^{k−1}(ℓ−1))≤1/(ℓ−1) if it is a primitive ℓ^k-th root; for ℓ>5 both are <1/4. So the ℓ-term of Definition 3.2.1 is torsion free and the global intersection is trivial for every k∈K.
3. Adelic conjugation preserves each local spectrum. A rational element of a conjugate level has the same eigenvalues in every local realization of its faithful rational representation, so adelic neatness gives rational neatness (AA §4.3's Neat.IsNeatAut). Removing a prime p≠ℓ leaves the certifying term available.

Acceptance:

- For a number field F and a compact open K⊂GSp₄(𝔸F,f), choose one rational prime ℓ>5. Suppose every place v|ℓ is absolutely unramified and the projection of K to GSp₄(F_v) is contained in Iw₁(v). Then every k∈K is adelically neat for the faithful ℚ-representation of Res_F/ℚ GSp₄ on the underlying ℚ-space of F⁴, as in Definition 3.2.1. Hence for every g∈GSp₄(𝔸F,f), every γ∈GSp₄(F)∩gKg⁻¹ is rationally neat in that representation. The same certification proves the prime-to-p statement when ℓ≠p and all places above ℓ are retained. For F=ℚ this recovers the one-place criterion. One arbitrary F-place does not suffice for this rational conclusion: see E17.

Direct prerequisites: `ShimuraData:D5/local-eigenvalue-bound`; `ShimuraData:D5/local-products-bound`; `ShimuraData:D5/adelic-neat`; `AdelicAlgebraicGroups:AA.4`; `mathlib:AddValuation`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`; `AdelicAlgebraicGroups:AA.1`; `ReductiveGroupsPartII:RG2.3`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `mathlib:NumberField.RingOfIntegers`; `mathlib:IsDedekindDomain.FiniteAdeleRing`.

Sources:

- [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 7.8.3, published p.409. The published single-F-place formulation requires correction for its own Definition 3.2.1: E17 gives a rational quadratic-unit counterexample. The corrected all-v|ℓ statement applies the source degree-four local bound to every restriction-of-scalars factor. E15 separately supplies closure under eigenvalue products and inverses.

Planet: Unipotent Iwahori criterion for neatness.

## Superseded targets and their owners

Each row is a revision-3 node whose target an upstream pull request now states; its consumers should cite the owner instead (packet `supersededNodes` and `consumerRetargets`).

| Former node | Owner | Why the owner states it |
| --- | --- | --- |
| `ShimuraData:D0/deligne-points-topology` (Real points of the Deligne torus) | ReductiveGroupsPartII §RG2.0a.3 The Deligne torus | RG2.0a.3 defines S=Res_{ℂ/ℝ}G_m with realPointsMulEquiv S(ℝ)≃ℂ^× and proves isHomeomorph_realPointsMulEquiv for the point topology, complexSplitting_real (z↦(z,z̄)) and conj_swap ((z₁,z₂)↦(z̄₂,z̄₁)). These are exactly the three conclusions REV-ShimuraData~3 asked this node to restore, stated there on the actual point carrier. |
| `ShimuraData:D0/deligne-lie-points` (Analytic Deligne torus comparison) | ArithmeticLocallySymmetricSpaces §ALS.F.1 Real points of linear algebraic groups; ReductiveGroupsPartII §RG2.0a.3 The Deligne torus | ALS.F.1 makes the real points of a linear algebraic group (here S⊂GL₂,ℝ as the matrices \[\[a,b],\[−b,a]]) a real Lie group with Lie algebra Lie(S) independent of the embedding; RG2.0a.3 supplies the comparison with ℂ^×, the diagonal and the norm. The differentials (norm ↦ 2Re, diagonal ↦ t) are computations inside that statement, not a separate target. |
| `ShimuraData:D0/datum-map-points` (Point maps of datum morphisms) | AdelicAlgebraicGroups §1.3 Rational points and functoriality; ReductiveGroupsPartII §RG2.0.1–RG2.0.2 point topology and its functoriality; ArithmeticLocallySymmetricSpaces §ALS.F.1 Real points of linear algebraic groups | AA §1.3 (functoriality of adelic points) proves continuity, the identity and composition laws, compatibility with the rational diagonal and with every local projection; RG2.0's affine-point-topology-functoriality does the same for local points; ALS.F.1 gives the Lie structure on real points, for which continuous homomorphisms are real analytic. Nothing Shimura-specific remains. |
| `ShimuraData:D1/deligne-torus` (Deligne torus representation input) | ReductiveGroupsPartII §RG2.0a.3 The Deligne torus; ShimuraVarieties §P.3 Hodge filtrations and reflex fields | RG2.0a.3 constructs S as the Hopf algebra Res_{ℂ/ℝ}ℂ\[t,t⁻¹] with its split character lattice; SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters. Reading a real representation as a comodule is that dictionary's input. |
| `ShimuraData:D1/deligne-torus-points` (Deligne character sign dictionary) | ReductiveGroupsPartII §RG2.0a.3 The Deligne torus; ShimuraVarieties §P.3 Hodge filtrations and reflex fields | RG2.0a.3 checks characterGroup_mu and characterGroup_weight; SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/weight-norm-cocharacters` (Diagonal, weight and norm signs) | ReductiveGroupsPartII §RG2.0a.3 The Deligne torus; ShimuraVarieties §P.3 Hodge filtrations and reflex fields | RG2.0a.3 fixes d(r)=r, w=d∘inv, Nm(z)=zz̄ and proves characterGroup_weight ((p,q) takes r^{−(p+q)} on w(r)) and characterGroup_norm; SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/graded-real-hodge` (Graded real Hodge structure) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters. The graded real Hodge structure is the target category of that dictionary. |
| `ShimuraData:D1/hodge-decomposition-of-representation` (Hodge pieces of a representation) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/graded-hodge-category` (Category of graded real Hodge structures) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/conjugation-pieces` (Conjugation of Hodge pieces) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/pure-hodge-of-representation` (Pure weight part of a representation) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/graded-hodge-of-representation` (Full grading of an S-representation) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/representation-of-hodge` (Representation from a Hodge grading) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/comparison-roundtrip` (Representation comparison round trip) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/representation-hodge-equivalence` (Deligne torus–Hodge equivalence) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters. The equivalence on morphisms is part of that dictionary; an upstream note asks for it as an explicit Check. |
| `ShimuraData:D1/tensor-comparison` (Tensor comparison) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/dual-comparison` (Dual comparison) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/tate-comparison` (Tate twist comparison) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D1/weil-operator-sign` (Weil operator sign comparison) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters. With that convention h(i) acts on type (p,q) by i^{q−p}, the inverse of Tau Ceti's Weil operator; this is a one-line consequence, not a separate target. |
| `ShimuraData:D1/test-objects` (Trivial comparison object) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters. The trivial object is a Check of that dictionary (upstream note). |
| `ShimuraData:D1/tate-test-object` (Tate comparison object) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields; ReductiveGroupsPartII §RG2.0a.3 The Deligne torus | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters. RG2.0a.3's characterGroup_norm identifies ℚ(1) with the norm character. |
| `ShimuraData:D1/elliptic-homology-object` (Elliptic homology comparison) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters. SV §P.3's first Check is exactly the elliptic homology types (−1,0),(0,−1) with μ-exponents 1,0. |
| `ShimuraData:D1/adjoint-gl2-object` (Adjoint GL₂ comparison) | ShimuraVarieties §P.1 Pure data and special pairs; ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.1's Check (GL₂ with its usual h has X=ℍ±) verifies SV1 for GL₂, i.e. the adjoint types (−1,1),(0,0),(1,−1); SV §P.3 constructs the representation–Hodge dictionary for S-representations in the homology convention (h_C(z₁,z₂) acts on type (p,q) by z₁^(−p)z₂^(−q), μ\_h(z)=h_C(z,1)) and proves its conjugation, tensor, dual and Tate compatibilities from the split S-characters.  |
| `ShimuraData:D2/cartan-adjoint-criterion` (Cartan involution criterion) | ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.2 Cartan involutions and the Lie-theoretic Cartan datum | ALS.0.1 defines IsCartanInvolution by compactness of the twisted real form and proves IsCartanInvolution.killing (positive definiteness of −B(X,dθY) on the derived algebra, with compactness of the twisted central torus as a separate condition) and the check not_cartanInvolution_id_GL2; ALS.0.2 compares the algebraic and Lie-theoretic predicates. This is the node's whole statement. |
| `ShimuraData:D2/shimura-cartan-involution` (Adjoint involution from h(i)) | ShimuraVarieties §P.1 Pure data and special pairs; ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.2 Cartan involutions and the Lie-theoretic Cartan datum | SV §P.1 states SV2 as 'Int(h(i)) is Cartan on G_ℝ^ad' and proves conjugation invariance of all axioms; the involution property is a step of that target. |
| `ShimuraData:D2/stabilizer-h` (Centralizer of a Hodge homomorphism) | ShimuraVarieties §P.2 Hermitian components | SV §P.2 identifies the tangent space at h with g_ℝ/Lie Z_{G_ℝ}(h) through the differential of the actual orbit map; the stabilizer and its Lie algebra are steps of that target. |
| `ShimuraData:D2/tangent-quotient` (Tangent quotient of the h-orbit) | ShimuraVarieties §P.2 Hermitian components | SV §P.2 identifies the tangent space at h with g_ℝ/Lie Z_{G_ℝ}(h) using the differential of the actual orbit map. |
| `ShimuraData:D2/hodge-tangent-operator` (Hodge complex structure on the tangent) | ShimuraVarieties §P.2 Hermitian components | SV §P.2: the two nonzero adjoint Hodge types define the complex structure. |
| `ShimuraData:D2/adjoint-bracket` (Bracket of adjoint Hodge pieces) | ShimuraVarieties §P.2 Hermitian components | SV §P.2 proves integrability of the complex structure; the bracket relation is a step of that proof. |
| `ShimuraData:D2/filtration-lie-subalgebra` (Hodge filtration Lie subalgebra) | ShimuraVarieties §P.2 Hermitian components | SV §P.2 proves integrability of the complex structure; that F⁰g_ℂ is a subalgebra is a step of that proof. |
| `ShimuraData:D2/hodge-integrability` (Integrability of the Hodge complex structure) | ShimuraVarieties §P.2 Hermitian components | SV §P.2 proves integrability and G(ℝ)-invariance of the complex structure. |
| `ShimuraData:D2/quotient-separation` (Separation of the h-orbit) | ShimuraVarieties §P.2 Hermitian components; ArithmeticLocallySymmetricSpaces §ALS.F.1 Real points of linear algebraic groups | SV §P.2 constructs the complex structure on X; ALS.F.1 supplies the Lie group G(ℝ) whose closed-subgroup quotient G(ℝ)/K_h is Hausdorff and second countable. |
| `ShimuraData:D2/orbit-finite-components` (Finitely many components of the real h-orbit) | ShimuraVarieties §P.2 Hermitian components; ArithmeticLocallySymmetricSpaces §ALS.F.1 Real points of linear algebraic groups | SV §P.2 constructs the finite component set of X; ALS.F.1 proves that the real points have finitely many components. |
| `ShimuraData:D2/compact-real-factor` (Compact real factors) | ShimuraVarieties §P.2 Hermitian components | SV §P.2 records the central and compact ineffective kernel of the domain action, and its Check states that compact real adjoint factors contribute zero tangent; the compactness criterion is a step of that target. |
| `ShimuraData:D2/hermitian-domain-components` (Hermitian domain theorem) | ShimuraVarieties §P.2 Hermitian components | SV §P.2 identifies each component with a Hermitian symmetric domain, gives its bounded realization, proves the action of G^ad(ℝ)^+ holomorphic and constructs the finite component set. |
| `ShimuraData:D3/homogeneous-variation` (Homogeneous Hodge variation) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3: for an actual datum the complex structure of §P.2 makes the Hodge filtration of every rational representation a holomorphic variation, and under the rational-weight and Cartan conditions it constructs the polarized homogeneous variations. The real-representation case is the same construction (upstream note). |
| `ShimuraData:D3/homogeneous-horizontal` (Horizontality of homogeneous families) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | Horizontality is the transversality half of the variation statement of SV §P.3. |
| `ShimuraData:D3/borel-tangent` (Differential of the Borel map) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3: a faithful representation gives the Borel embedding into the compact flag variety; its differential is a step of that target. |
| `ShimuraData:D3/borel-injective` (Injectivity of the Borel map) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | Injectivity is part of the Borel embedding of SV §P.3. |
| `ShimuraData:D3/borel-embedding` (Borel embedding) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 states the Borel embedding of X into its compact flag variety. ShimuraData keeps the compact dual X^∨=G_ℂ/P_h (D3/compact-dual), into which that embedding lands. |
| `ShimuraData:D3/cocharacter-class` (Hodge cocharacter conjugacy class) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 defines the cocharacter conjugacy class of μ\_h. |
| `ShimuraData:D3/reflex-field` (Reflex field) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 defines E(D) as the fixed field of the open stabilizer of the cocharacter class in Gal(ℚ̄/ℚ). |
| `ShimuraData:D3/reflex-stabilizer-open` (Open cocharacter-class stabilizer) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 defines E(D) through the open stabilizer and proves its finite degree. |
| `ShimuraData:D3/reflex-finite` (Finiteness of the reflex field) | ShimuraVarieties §P.3 Hodge filtrations and reflex fields | SV §P.3 proves finite degree of E(D), independence of h, containment E(D′)⊂E(D) under datum morphisms and equality with the field of definition of the class. |
| `ShimuraData:D4/shimura-datum` (Shimura datum) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1 defines TauCeti.Shimura.PureDatum: connected reductive ℚ-group G, nonempty full G(ℝ)-class X of algebraic h:S→G_ℝ, SV1–SV3; rationality of the weight is a separate predicate. Identical to this node. |
| `ShimuraData:D4/axioms-conjugation` (Conjugation invariance of the axioms) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1 proves conjugation invariance of all axioms. |
| `ShimuraData:D4/weight-central` (Central weight of a datum) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1: the central inverse-diagonal weight is independent of h; rationality is a separate predicate. |
| `ShimuraData:D4/datum-morphism` (Morphism of Shimura data) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1: morphisms are rational group maps carrying the actual class into the target class. |
| `ShimuraData:D4/datum-category` (Category of Shimura data) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1 constructs the pure datum and its category, with identity and composition. |
| `ShimuraData:D4/product-datum` (Product of Shimura data) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1 constructs products of data with their point maps and the product comparisons. |
| `ShimuraData:D4/adjoint-datum` (Adjoint Shimura datum) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1 constructs adjoint data and the connected adjoint S-map convention (C1)–(C3). |
| `ShimuraData:D4/central-isogeny-lift` (Central-isogeny change of datum) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1: a central isogeny lifts a full datum only when an algebraic S-lift is supplied; the connected convention is invariant under central covers. |
| `ShimuraData:D4/special-pair` (Special pair) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1: a special pair retains a rational torus immersion T→G and h factoring through T_ℝ. |
| `ShimuraData:D4/special-point` (Special point) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1: specialness means existence of a special pair. |
| `ShimuraData:D4/special-image` (Preservation of special points) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1 provides the special-pair map under datum morphisms. |
| `ShimuraData:D4/hodge-type` (Hodge type) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1: Hodge type means a rational closed immersion into a Siegel datum (the Siegel data of §P.4). |
| `ShimuraData:D4/abelian-type` (Abelian type) | ShimuraVarieties §P.1 Pure data and special pairs | SV §P.1: abelian type means a central derived isogeny inducing an isomorphism of the connected adjoint data with a Hodge-type datum. |
| `ShimuraData:D5/neat` (Neat rational element) | AdelicAlgebraicGroups §4.3 Neat elements and levels | AA §4.3 defines Neat.IsNeatAut (eigenvalues generate a torsion-free subgroup of ℂ^×) and neatness of g∈G(F) through a faithful algebraic representation, with neat subgroups. |
| `ShimuraData:D5/neat-representation-independence` (Representation independence of neatness) | AdelicAlgebraicGroups §4.3 Neat elements and levels | AA §4.3 proves that eigenvalues of every algebraic representation lie in the group generated by those of a faithful one, hence representation independence and stability under homomorphisms. |
| `ShimuraData:D5/neat-level` (Neat compact open level) | AdelicAlgebraicGroups §4.3 Neat elements and levels | AA §4.3 defines Neat.IsNeatLevel by neatness of every G(F)∩xUx⁻¹ and proves stability under smaller levels and conjugation. |
| `ShimuraData:D5/component-subgroup` (Level subgroup of a component) | ShimuraVarieties §P.4 Levels and basic examples; ShimuraVarieties §0.1 Arithmetic component stabilizers; §0.4 Proper effective arithmetic action | SV §P.4 constructs the compact-open level interface with rational component stabilizers; SV §0.1 the arithmetic component stabilizers Γ\_a=G(ℚ)_+∩aKa⁻¹ with G(ℚ)_+ the preimage of G^ad(ℝ)^+. |
| `ShimuraData:D5/effective-kernel` (Kernel of the arithmetic domain action) | ShimuraVarieties §P.4 Levels and basic examples; ShimuraVarieties §P.2 Hermitian components | SV §P.2 records the central and compact ineffective kernel; SV §P.4 retains it separately; its Check removes an infinite ineffective central kernel before freeness. |
| `ShimuraData:D5/effective-free` (Freeness at neat level) | ShimuraVarieties §P.4 Levels and basic examples; ShimuraVarieties §0.1 Arithmetic component stabilizers; §0.4 Proper effective arithmetic action | SV §P.4: for the effective domain image of a rationally neat arithmetic subgroup, trivial point stabilizers; SV §0.4 proper effective arithmetic action. |
| `ShimuraData:D5/torus-datum` (Torus Shimura datum) | ShimuraVarieties §P.1 Pure data and special pairs; ShimuraVarieties §P.4 Levels and basic examples | SV §P.1 Check: every rational torus with an algebraic S-map gives a singleton datum; SV §P.4 constructs the strict singleton torus example with its reflex field. |
| `ShimuraData:D5/cm-torus` (CM-type torus datum) | ShimuraVarieties §P.4 Levels and basic examples; ShimuraVarieties §5.1 CM types, reflex fields and reflex norms | SV §P.4 constructs the CM torus from the CM types of §5.1, which owns CMType and its reflex field. |
| `ShimuraData:D5/gl2-datum` (GL₂ Shimura datum) | ShimuraVarieties §P.4 Levels and basic examples; ShimuraVarieties §P.1 Pure data and special pairs | SV §P.4 constructs the GL₂ example with its S-map, domain and reflex field; SV §P.1 Check: X=ℍ^± with both components. |
| `ShimuraData:D5/gl2-types` (GL₂ Hodge and weight checks) | ShimuraVarieties §P.1 Pure data and special pairs; ShimuraVarieties §P.3 Hodge filtrations and reflex fields | The adjoint types are SV1 for the GL₂ datum (SV §P.1 Check); the homology types (−1,0),(0,−1) and μ-exponents 1,0 are SV §P.3's first Check. |
| `ShimuraData:D5/siegel-datum` (Siegel Shimura datum) | ShimuraVarieties §P.4 Levels and basic examples | SV §P.4 constructs the genus-g Siegel datum, g≥1, with its S-map, domain and reflex field. |
| `ShimuraData:D5/siegel-lie-types` (Siegel adjoint Hodge types) | ShimuraVarieties §P.4 Levels and basic examples | Verification of SV1 for the Siegel datum is part of its construction in SV §P.4; the corrected Lie(GSp) equation of E13 is recorded in an upstream note. |
| `ShimuraData:D5/hilbert-trace-form` (Hilbert trace symplectic form) | PELModuli §M5.4 The principal Hilbert datum | PEL §M5.4 defines hilbertPairing ψ((x₁,x₂),(y₁,y₂))=Tr_{F/ℚ}(x₁y₂−x₂y₁), proves it alternating, O_F-balanced and positive for its h (ψ((a,b),(−b,a))=a²+b²). |
| `ShimuraData:D5/hilbert-trace-embedding` (Hilbert trace symplectic embedding) | PELModuli §M5.4 The principal Hilbert datum | PEL §M5.4 constructs hilbertTraceEmbedding G→GSp(F²,ψ), with multiplier the common rational determinant and compatibility with h, and proves it a morphism of pure data through §M0.12. |
| `ShimuraData:D5/local-torsion-gap` (Torsion gap at large residue characteristic) | AdelicAlgebraicGroups §4.3 Neat elements and levels | AA §4.3 (distance of p-adic roots of unity from one) proves that a primitive p^k-th root has distance p^{−1/(p^{k−1}(p−1))} and a nontrivial prime-to-p root distance one; for ℓ>5 the bound 1/(ℓ−1)<1/4 is arithmetic. This closes the former 'cyclotomic valuation exceeds LF0' gap. |
| `ShimuraData:D5/gl2-integral-torsion-root` (Torsion eigenvalues at integral GL₂ principal level) | AdelicAlgebraicGroups §4.3 Neat elements and levels | AA §4.3's eigenvalue bound for congruence matrices and strict torsion-free ball give it at a prime p≥3 dividing N, or at 2 when 4\|N. |
| `ShimuraData:D5/gl2-congruence-neat` (Neatness of principal GL₂ levels) | AdelicAlgebraicGroups §4.3 Neat elements and levels; ShimuraVarieties §P.4 Levels and basic examples | AA §4.3's one-prime criterion with the Check that K(3) is neat, and SV §P.4's Check 'GL₂ principal level N≥3 is rationally neat; N=2 retains −I'. |

## Supplier requests

- `AbelianSchemesAndArithmeticModuli:A5` — H¹(A,ℚ) of a polarized complex abelian variety as a polarized rational Hodge structure of weight one, with the symplectic form of its Riemann form and its similitude group (§§A5.2 and A5.5 of TauCetiRoadmap pull request #849, RiemannForm and the polarized Hodge equivalence); used to state Hodge genericity. Needed by: `ShimuraData:D1/hodge-generic`.
- `AdelicAlgebraicGroups:AA.1` — Import §§1.3–1.4 of TauCetiRoadmap pull request #792 (head 241d5d6a9b) as stated: functoriality of adelic points, discreteness in the finite adeles alone, and restriction of scalars on adelic points (base-change-adelic) with its local factors, including the archimedean ones. Applied to Res_{F/ℚ}GL₂, its scalar-determinant subgroup and the centres of Shimura data. Needed by: `ShimuraData:D0/hilbert-adelic-points`, `ShimuraData:D0/hilbert-real-points`, `ShimuraData:D4/additional-axioms`, `ShimuraData:D4/sv5-criterion`, `ShimuraData:D5/adelic-neat`, `ShimuraData:D5/iwahori-neat`.
- `AdelicAlgebraicGroups:AA.3` — §3.4 of pull request #792 (arithmetic quotients of anisotropic groups are compact), applied to an anisotropic ℚ-torus T_a: T_a(ℝ) modulo an arithmetic subgroup is compact. Requested as an extension of §3.4: for a ℚ-torus T with largest anisotropic subtorus T_a, the arithmetic subgroup T(ℤ)∩T_a(ℚ) has finite index in T(ℤ) (the finite-index half of Ono's theorem used in Milne SVI Theorem 5.26). Needed by: `ShimuraData:D4/sv5-criterion`.
- `AdelicAlgebraicGroups:AA.4` — Import §4.3 of pull request #792 as stated: Neat.IsNeatAut, neatness through a faithful algebraic representation and its independence of the representation, Neat.IsNeatLevel, torsion-freeness, and the distance of p-adic roots of unity from one (v(ζ−1)=1/(p^{k−1}(p−1)) for a primitive p^k-th root, 0 for a nontrivial root of prime-to-p order). Needed by: `ShimuraData:D5/adelic-neat`, `ShimuraData:D5/iwahori-neat`, `ShimuraData:D5/local-eigenvalue-bound`.
- `ArithmeticLocallySymmetricSpaces:ALS.0` — Import from TauCetiRoadmap pull request #871 (head e7e16145f2), as stated: §ALS.F.1 realPoints_lieGroup (real points of a linear algebraic group form a real Lie group with finitely many components and Lie algebra Lie(H), independent of the embedding) and §§ALS.0.1–0.2 (IsCartanInvolution by compactness of the twisted real form, with the Killing criterion on the derived algebra and a separate condition on the central torus). Needed by: `ShimuraData:D0/hilbert-real-points`, `ShimuraData:D4/additional-axioms`, `ShimuraData:D4/sv5-criterion`, `ShimuraData:D5/gsp4-unitary`.
- `PELModuli:M0` — Import §M0.12 of TauCetiRoadmap pull request #966 (head 7577fe7ccc) as stated: RationalPELDatum.toShimuraDatum for a rational PEL datum with connected group and SV3, and RationalPELDatum.siegelMorphism to the genus-g Siegel datum of ShimuraVarieties §P.4, with §§M0.6–M0.11 behind them. Nothing new is requested. Needed by: `ShimuraData:D4/pel-type`, `ShimuraData:D4/type-implications`, `ShimuraData:D5/hilbert-star-datum`.
- `PELModuli:M5` — Import §M5.4 of TauCetiRoadmap pull request #966 as stated: hilbertRationalDatum (Case C: the subgroup G\* of Res_{F/ℚ}GL₂ with determinant in G_m), hilbertPairing and hilbertTraceEmbedding with its multiplier and h-compatibility; and §M5.1's Siegel PEL data. Nothing new is requested. Needed by: `ShimuraData:D5/hilbert-star-datum`.
- `ReductiveGroupsPartII:RG2.0a` — Import §RG2.0a of TauCetiRoadmap pull request #785 (head f24efef614) as stated: WeilRestriction (functor, representing Hopf algebra, pointsMulEquiv, mapHopf) and §RG2.0a.3 DeligneTorus (realPointsMulEquiv with isHomeomorph_realPointsMulEquiv, complexSplitting with complexSplitting_real and conj_swap, diagonal, weight, norm, mu and characterGroup). Needed by: `ShimuraData:D0/hilbert-adelic-points`, `ShimuraData:D0/hilbert-real-points`, `ShimuraData:D1/mumford-tate-group`, `ShimuraData:D1/rational-weight-criterion`, `ShimuraData:D5/hilbert-datum`.
- `ReductiveGroupsPartII:RG2.1` — For a reductive ℚ-group G split by a finite Galois extension L and a central isogeny H′→G^der, a central extension 1→N→G₁→G→1 with N a product of copies of Res_{L/ℚ}G_m and G₁^der→G^der equal to H′→G^der (Milne–Shih 1982, 3.1, as quoted in Milne 2013, §8). §RG2.1.5 constructs z-extensions, the simply connected case; the prescribed-cover form is requested as an extension. Needed by: `ShimuraData:D4/connected-datum-lift`.
- `ReductiveGroupsPartII:RG2.3` — The pro-unipotent Iwahori Iw₁(v)⊂GSp₄(O_v) of an absolutely unramified place (LevelSubgroups.proPIwahori in the symplectic case) and the fact that the characteristic polynomial of each of its elements reduces to (X−1)⁴ modulo the maximal ideal. Needed by: `ShimuraData:D5/iwahori-neat`, `ShimuraData:D5/local-eigenvalue-bound`.
- `ReductiveGroupsPartII:RG2.5` — Import §RG2.5's gsp4-self-dual as stated: the parity character lattice of the GSp₄ torus in Pilloni's coordinates, its half-integral dual with basis f₁,f₂,f₃, the corrected base α₁=e₂−e₁, α₂=e₃−2e₂ with coroots f₂−f₁ and −f₂, and the unimodular self-duality. D5 adds only the Siegel-datum positive system, ρ and the compact root. Needed by: `ShimuraData:D5/gsp4-pilloni-convention`.
- `SchemeAndStackFoundations:SF.1` — Supply effective equivariant descent of projective schemes along finite separable field extensions, applied to the represented parabolic-type functor from R7. Descent does not imply a rational point. Needed by: `ShimuraData:D3/reflex-flag-descent`.
- `ShimuraVarieties:V0` — Import, as stated in TauCetiRoadmap pull request #933 (head 1dd09ed7a8), the prerequisites §§P.1–P.5 that ShimuraVarieties constructs before its Layer 0 (atlas stage V0): §P.1 TauCeti.Shimura.PureDatum (SV1–SV3, morphisms, products, adjoint data, the connected convention (C1)–(C3), special pairs and points, Hodge and abelian type, central-isogeny lifts); §P.2 the Hermitian components; §P.3 the representation–Hodge dictionary, holomorphic and polarized homogeneous variations, the Borel embedding, the cocharacter class and the reflex field with finiteness and functoriality; §P.4 levels, effective stabilizers and the GL₂, Siegel and torus examples; §P.5 maximal tori through h. Nothing new is requested; revision 4 consumes these instead of planning them. Needed by: `ShimuraData:D1/rational-weight-criterion`, `ShimuraData:D2/unique-complex-structure`, `ShimuraData:D3/filtration-parabolic`, `ShimuraData:D3/reflex-flag-descent`, `ShimuraData:D4/additional-axioms`, `ShimuraData:D4/connected-datum-lift`, `ShimuraData:D4/pel-type`, `ShimuraData:D4/preabelian-type`, `ShimuraData:D4/type-implications`, `ShimuraData:D5/gsp4-cayley-basis`, `ShimuraData:D5/gsp4-centralizer`, `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`, `ShimuraData:D5/siegel-reflex-dual`, `ShimuraData:D5/siegel-root-convention`.
- `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l0--pure-hodge-structures-the-hodge-decomposition` — Use existing pure real/rational/integral Hodge carriers, conjugation, opposed filtrations, decomposition, tensor, dual and Tate conventions; supply elliptic H₁/H¹ comparison. Record the missing H0→D1 stage dependence required by RT-AREA-algebraicgeometry/27. Needed by: `ShimuraData:D1/mumford-tate-group`, `ShimuraData:D1/rational-weight-criterion`, `ShimuraData:D3/flat-bundle-local`, `ShimuraData:D3/variation`.
- `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory` — Supply rational polarization, positive Hermitian comparison, polarizable rational semisimplicity and invariance under rational isogeny; these are used in MT and fiberwise polarized variations. Record H1→D3 required by RT-AREA-algebraicgeometry/27. Needed by: `ShimuraData:D1/hodge-generic`, `ShimuraData:D1/mumford-tate-reductive`, `ShimuraData:D3/polarized-integral-variation`, `ShimuraData:D3/rational-polarized-variation`.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions` — Extension of the normalized valuation of an absolutely unramified ℓ-adic field to an algebraic closure, with v(ℓ)=1, and the ultrametric rules used for the Iw₁ eigenvalue bound. The cyclotomic distances are now AdelicAlgebraicGroups §4.3's. Needed by: `ShimuraData:D5/iwahori-neat`, `ShimuraData:D5/local-eigenvalue-bound`, `ShimuraData:D5/local-products-bound`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary` — Use the algebraic group/functor/Hopf dictionary, matrix representations, base change and closed immersion criterion. Supply finite-type noetherian sum of subgroup ideals representing their scheme-theoretic intersection for the smallest rational algebraic subgroup containing an S-map after real extension. Needed by: `ShimuraData:D1/mumford-tate-group`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules` — Finite-dimensional algebraic representations are comodules; supply tensor/dual/subquotient operations, scalar-extension faithfulness, and effective conjugate-semilinear descent of comodules over the supplied descended torus. A faithful representation tensor-generates finite-dimensional representations for neatness independence. Tensor generation must also hold after extension to any subfield of ℂ, so neatness passes to real algebraic effective quotients. For the rational Iwahori conclusion identify the faithful ℚ-representation on the underlying ℚ-space of F⁴, with its dimension 4\[F:ℚ], and its scalar-extension local spectra. Needed by: `ShimuraData:D1/rational-weight-criterion`, `ShimuraData:D2/unique-complex-structure`, `ShimuraData:D3/filtration-parabolic`, `ShimuraData:D5/iwahori-neat`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` — Use algebraic closed subgroups, quotients and connected components; scheme-theoretic image of a torus is a torus. For MT use that connected real S lies in the scalar extension of the rational identity component. Needed by: `ShimuraData:D1/mumford-tate-connected`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori` — Supply rational Gm weight-space grading, diagonalizable closure of a semisimple element, and rational torus factorization; finite-dimensional rational representations have rational eigenspaces under a rational Gm. Needed by: `ShimuraData:D1/rational-weight-criterion`, `ShimuraData:D4/connected-datum-lift`, `ShimuraData:D4/sv5-criterion`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` — Use connected reductive/adjoint/derived groups, rational simple-factor quotients, central isogenies, centers and semisimple representation criterion. Provide reductivity of MT of a polarizable rational Hodge structure using H1 semisimplicity. Supply the rational algebraic GSp of a nondegenerate alternating form independently of its later D5 datum; D1 genericity consumes only this group. Needed by: `ShimuraData:D1/hodge-generic`, `ShimuraData:D1/mumford-tate-reductive`, `ShimuraData:D4/connected-datum-lift`, `ShimuraData:D5/hilbert-star-datum`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory` — Supply cocharacter parabolics, Levi factors, flag varieties, tangent/Lie quotient, finite-type conjugacy classes and Bruhat order over fields. Supply the parabolic-type variety representing a Galois-invariant type, without assuming an E-rational representative parabolic. Supply the absolute symplectic based root datum, Weyl action and split/parity character and dual cocharacter coordinates; these are native R7 outputs under RS-31, distinct from RG2.5 dualization. Needed by: `ShimuraData:D3/bruhat-integral`, `ShimuraData:D3/compact-dual`, `ShimuraData:D3/filtration-parabolic`, `ShimuraData:D3/kostant-cone-criterion`, `ShimuraData:D3/kostant-cones`, `ShimuraData:D3/kostant-involution`, `ShimuraData:D3/kostant-representatives`, `ShimuraData:D3/reflex-flag-descent`, `ShimuraData:D3/transversality-tangent`, `ShimuraData:D5/gsp4-cayley-action`, `ShimuraData:D5/gsp4-cg-roots`, `ShimuraData:D5/gsp4-compact-cartan`, `ShimuraData:D5/gsp4-kostant`, `ShimuraData:D5/gsp4-pilloni-convention`, `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/siegel-reflex-dual`, `ShimuraData:D5/siegel-root-convention`, `ShimuraData:D5/siegel-weyl-permutations`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` — Supply pinned split reductive ℤ-group schemes and smooth parabolic quotients; integral Bruhat affine cells, flat Schubert/opposite closures, base-change-compatible incidence and the nonemptiness criterion X^w∩C_v≠∅ iff v≥w. These are stronger than the field-only layer7 statements and must hold over every residue field. Needed by: `ShimuraData:D3/bruhat-closure-order`, `ShimuraData:D3/bruhat-integral`, `ShimuraData:D3/kostant-representatives`, `ShimuraData:D3/opposite-intersection`, `ShimuraData:D3/schubert-families`, `ShimuraData:D5/kostant-sequence-geometry`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms` — Supply compact twisted real forms, conjugation-compatible Lie complexification and complexified compact torus exponential. D2 consumes the native layer7→D2 dependency. Needed by: `ShimuraData:D5/gsp4-exp-kernel`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat` — Supply complex flag quotient charts, tangent identification and open real orbit criterion used in Borel embedding. Needed by: `ShimuraData:D2/unique-complex-structure`, `ShimuraData:D3/compact-dual`, `ShimuraData:D3/transversality-tangent`.

## Gaps

- **Holomorphic flat bundles and connections from local systems.** The pinned fundamental-groupoid local coefficient system supplies monodromy/transport. It does not provide L⊗O_B, holomorphic subbundles, Ω¹, or a flat connection. The variation node plans their use; a general complex analytic bundle/connection supplier is still missing. Required result: local trivializations glue the flat holomorphic bundle, pullback commutes, and filtered derivative is well defined. Needed by: `ShimuraData:D3/variation`, `ShimuraData:D3/variation-morphism`, `ShimuraData:D3/rational-polarized-variation`.
- **Integral flag geometry supplier exceeds field Bruhat theorem.** RG layer7 is over a field. RG layer9 must supply integral parabolic quotients, Schubert flatness and base-change-compatible opposite incidence. BP and BP21 cite \[BL03] I Lemma1 for incidence; that proof has not been read. The exact requested incidence theorem is a leaf, not an unproved claim of library coverage. Needed by: `ShimuraData:D3/bruhat-integral`, `ShimuraData:D3/opposite-intersection`.
- **Reflex parabolic-type descent representability.** Need the representability and descent of the parabolic-type functor requested from R7, with descent compatible with the μ conjugacy class. General SGA3 representability proof has not been read. No E-point, E-rational μ, or E-rational parabolic is inferred. Needed by: `ShimuraData:D3/reflex-flag-descent`.
- **Mumford–Tate and genericity proof inputs.** The Hopf-ideal sum and the native finite-comodule carriers are available. Finite-type rational subgroup representability and its comparison with the MT quotient remain R0/R3 inputs; polarizable semisimplicity and the faithful representation criterion remain H1/R6 inputs. The exact independent elliptic classification is: MT(H¹(Eτ,ℚ)) is the two-dimensional CM torus for a rational imaginary-quadratic relation for τ, and GL₂ otherwise. H0/H1 must supply the rational Hodge-endomorphism calculation and geometric H₁/H¹ comparison; D1/D4 cannot import all of later CM.0, since CM.0 consumes D3. Masser–Zannier states full-GSp genericity but does not prove these classification inputs. Needed by: `ShimuraData:D1/mumford-tate-group`, `ShimuraData:D1/hodge-generic`.
- **Hilbert compact dual requires nonaffine geometry.** RG2.0a explicitly supplies affine Weil restriction, so it does not supply ResF/ℚℙ¹. Construct the projective compact dual as the R7 parabolic-type variety and apply D3 reflex-flag descent; after a splitting extension it is the product of d copies of ℙ¹. A scheme/functor identification with the nonaffine Weil restriction requires a separate representability/comparison input. Neither affine Weil restriction nor a set-level product proves this identification. Needed by: `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`.
- **Complex analytic quotient input.** The compact dual X^∨=G_ℂ/P_h is a projective variety (ReductiveGroups layer 7 flag variety); its complex-manifold structure and tangent identification g_ℂ/F⁰g_ℂ are requested from RepresentationTheory/LieGroups layer 8 (complex flag quotient charts). The integrability of the complex structure on X itself, and the unread Wolf 1984 Theorem 8.7.9 behind Milne Theorem 1.21, now belong to ShimuraVarieties §P.2. Needed by: `ShimuraData:D3/compact-dual`.
- **Central extension with prescribed derived cover.** Milne 2013 §8 quotes Milne–Shih 1982, 3.1: for G reductive split by L and a cover H′→G^der there is a central extension by a product of Res_{L/ℚ}G_m with derived group H′. ReductiveGroupsPartII §RG2.1.5 constructs z-extensions (H′ simply connected) only; the general cover is requested and its proof was not read here. Needed by: `ShimuraData:D4/connected-datum-lift`.
- **Suggested signatures omit unavailable conditions explicitly.** The pinned libraries have no Weil restriction, Deligne torus, pure Shimura datum, holomorphic flat bundle or flag scheme over ℤ. The suggested file states the retained targets on carriers that exist (GL coordinate Hopf algebras, the split torus algebra ℂ\[ℤ²], matrices, root pairings, valuations, finite adeles, local coefficient systems) and leaves out, with a comment at each declaration, the conditions those carriers cannot express. No condition is replaced by an arbitrary proposition field and no data is defined by a placeholder. Needed by: `ShimuraData:D1/mumford-tate-group`, `ShimuraData:D3/variation`, `ShimuraData:D3/bruhat-integral`, `ShimuraData:D4/additional-axioms`, `ShimuraData:D5/hilbert-datum`.

## Mistakes found in the sources

Each finding is stated in our own words at its locator, with the correction the nodes use (packet `sourceIssues`).

- **ShimuraData/E1** (Higher Hida theory for Siegel modular forms, §1.1, p. 2; scoped here to the author copy recorded in sourceVersions; misprint). The source defines M_µ as the radical of P_µ that is unipotent. Correction: M_µ is the Levi centralizing µ; U_P denotes the unipotent radical. Reason: The next representation and dominant-weight statements require a reductive Levi containing T; §3.1 defines it correctly. Affects: nothing. Known: Recorded in PAPER-BOXER-PILLONI-26/E1; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E2** (Higher Hida theory for Siegel modular forms, §3.1, paragraph defining ᴹW, p. 34; scoped here to the author copy recorded in sourceVersions; misprint). w⁻¹Φ^{+,M} ⊆ Φ⁺ Correction: Use positive Levi roots: w⁻¹Φ\_M⁺⊂Φ⁺. Reason: For g=1 the printed condition excludes the nonidentity minimal representative although WM is trivial. Affects: nothing. Known: Recorded in PAPER-BOXER-PILLONI-26/E52; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E3** (Higher Hida theory for Siegel modular forms, §3.1, concrete description of ᴹW, p. 34; scoped here to the author copy recorded in sourceVersions; error). w⁻¹(g+1)<⋯<w⁻¹(2g) Correction: The comparison uses cyclic order g+1≺⋯≺2g≺1≺⋯≺g. Reason: Using the usual numeric order disagrees with minimal left coset representatives for the paper’s block Borel. Affects: a stated result. Known: Recorded in PAPER-BOXER-PILLONI-26/E53; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E4** (Higher Hida theory for Siegel modular forms, §6.1.8, p. 60 (paragraph before Proposition 6.1.11). The 2024 preprint has the same text (p. 58).; scoped here to the author copy recorded in sourceVersions; misprint). The source uses the names Schubert cell and opposite Schubert cell. Correction: In this paragraph replace these two names by Schubert variety and opposite Schubert variety. X_w is already correctly defined as the closure of C_w. Reason: The displayed formulas on p.60 already define X_w=closure(C_w) and X^w as an opposite-cell closure. The slip is in the word cell, not in the symbol X_w or in a cell-stratification formula. Affects: nothing. Known: Recorded in PAPER-BOXER-PILLONI-26/E116; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E5** (Minimal modularity lifting for nonregular symplectic representations, §2.1, PDF p.7, displayed character formula; scoped to the recorded advance-publication copy in sourceVersions; misprint). t₁ᵃt₂ᵃνᶜ Correction: Use t₁ᵃt₂ᵇνᶜ. Reason: The second coordinate b must affect evaluation; (a,b,c)=(0,1,0) detects the slip. Affects: nothing. Known: Recorded in PAPER-CALEGARI-GERAGHTY-20/E9; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E6** (Minimal modularity lifting for nonregular symplectic representations, §2.1, PDF p.8, longest-element sentence; used again in Theorem 5.5 proof, PDF pp.28–29; scoped to the recorded advance-publication copy; misprint). w₀ Correction: The element swapping a,b is the longest Levi element w₀,M; the full longest acts (−a,−b;a+b+c). Reason: Swapping leaves the noncompact positive roots positive, so it cannot reverse all positive roots. Affects: nothing. Known: Recorded in PAPER-CALEGARI-GERAGHTY-20/E10; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E7** (Minimal modularity lifting for nonregular symplectic representations, §2.2, PDF pp.8–9, centralizer sentence; scoped to the recorded advance-publication copy; error). K^h = R×K∞ Correction: Use K^h=ℝ\_{>0}K∞,1, where K∞,1=Sp₄(ℝ)∩O(4). Reason: diag(1,1,−1,−1) is orthogonal with negative similitude, but anticommutes with J and does not centralize h. Affects: nothing. Known: Recorded in PAPER-CALEGARI-GERAGHTY-20/E11; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E8** (Minimal modularity lifting for nonregular symplectic representations, §2.2, PDF pp.9–10, unitary subgroup display and basis-action label; scoped to the recorded advance-publication copy; misprint). K_{1,∞} Correction: Use K_{∞,1} in the unitary subgroup display and basis-action label. Reason: The paper defines K_{∞,1}=K_∞∩Sp₄(ℝ). The displays on PDF pp.9–10 transpose the indices; the block matrices are symplectic and orthogonal, and the map A+iB identifies precisely this defined subgroup with U(2). Affects: nothing. Known: Recorded in PAPER-CALEGARI-GERAGHTY-20/E12; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E9** (Minimal modularity lifting for nonregular symplectic representations, §2.2, PDF p.9, kernel of exp; scoped to the recorded advance-publication copy; error). h(2πm,2πn;2πik) Correction: Also include h(π+2πm,π+2πn;πi+2πik). Reason: Both angular rotations and the scalar exponential are −1 on the extra coset, giving their product +1. Affects: nothing. Known: Recorded in PAPER-CALEGARI-GERAGHTY-20/E14; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E10** (Minimal modularity lifting for nonregular symplectic representations, Theorem 5.5 proof, PDF p.28, character-lattice identification; compare the correct parity lattice in §2.2 PDF p.9; scoped to the recorded advance-publication copy; misprint). The source equates the character lattice X\*(H_C) with Z³. Correction: In the angular/scalar coordinates fixed in §2.2 use {(a,b;c)∈ℤ³:a+b≡c mod2}. An abstract isomorphism with ℤ³, or an identification after tensoring with ℝ, is valid. Reason: The extra exponential-kernel element imposes a+b+c even. Thus (1,0;0) is not a character in the fixed coordinates. The issue is the claimed coordinate identification: the rank-three abstract lattice remains isomorphic to ℤ³. Affects: nothing. Known: Recorded in PAPER-CALEGARI-GERAGHTY-20/E37; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E11** (Higher coherent cohomology and p-adic modular forms of singular weights, §5.1.1 (The dual group of GSp4), p. 20; scoped here to the author copy recorded in sourceVersions; error). α₁=e₁−e₂ and α₂=−2e₂+e₃ Correction: For the lower full Borel replace the compact positive root by e₂−e₁, leaving the negative noncompact roots; the simple roots are e₂−e₁,−2e₂+e₃, with coroots f₂−f₁,−f₂ and ρ=(−2,−1;0). The printed positive root set itself is a valid different positive system; its declared simple pair is not a base. Reason: The printed pair has positive off-diagonal Cartan pairing. Moreover the printed α₂ coroot f₂ pairs to −2, whereas a root pairs to 2 with its coroot. Corrected lower-Borel roots agree with the later chamber 0≥λ₂>λ₁ and yield the stated negative half-sum. BP uses a different block Borel. Affects: nothing. Known: Recorded in PAPER-PILLONI-20/E20; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E12** (Higher coherent cohomology and p-adic modular forms of singular weights, §15.2.2, p. 107, and §5.2.1 (Siegel datum), p. 23 of the author version. HAL v3 has the same 'a1_2 + bJ' in both places (§5.2.1, p. 19; §15.2.2, p. 90).; scoped here to the author copy recorded in sourceVersions; misprint). h(a+ib)=a1₂+bJ Correction: Use a1₄+bJ. Reason: J is 4×4 on V=ℤ⁴; a 2×2 identity cannot be added to it. Affects: nothing. Known: Recorded in PAPER-PILLONI-20/E148; confirmed by its independent extraction review. This does not claim an author/publisher corrigendum.. Review: confirmed.
- **ShimuraData/E13** (Introduction to Shimura varieties, §6, SV1 verification, p.69 (2017 author notes); misprint). ψ(Xu,v)+ψ(u,Xv)=0 Correction: For Lie(GSp), use ψ(Xu,v)+ψ(u,Xv)=c(X)ψ(u,v); zero is the Lie(Sp) equation. Reason: For X=id the left side is 2ψ, and scalar matrices belong to Lie(GSp). The middle Hodge dimension is g²+1, with the center in type (0,0). Affects: nothing. Known: new. Review: confirmed.
- **ShimuraData/E14** (Introduction to Shimura varieties, §6, SV4 verification, p.69 (2017 author notes); misprint). w_h(r)=r Correction: With the inverse-diagonal weight convention fixed on p.56, w_h(r)=r⁻¹ id. Reason: The printed h_J(r)=r id has homology weight −1; its inverse is the defined weight map. Both are rational, so the SV4 verification still holds. Affects: nothing. Known: new. Review: confirmed.
- **ShimuraData/E15** (Abelian surfaces over totally real fields are potentially modular, Lemma 7.8.3 proof, published p.409; gap). The proof takes ζ ∈ F̄\_v to be an eigenvalue having finite multiplicative order. Correction: First extend v(λ−1)≥1/4 from eigenvalues to their entire generated subgroup using inversion and the ultrametric product inequality. Then apply the cyclotomic torsion gap to every generated torsion element. Reason: Neatness tests torsion in the subgroup generated by eigenvalues. Individual nontorsion eigenvalues can have torsion product: diag(2,−1/2) generates −1. The omitted closure step is valid and supplied by D5/local-products-bound; this leaves the four-dimensional local bound intact. This repairs the single-local generated-group argument only; E17 records a separate failure of the one-F-place statement for the faithful rational restriction-of-scalars representation. Affects: the proof. Known: new. Review: confirmed.
- **ShimuraData/E16** (Higher coherent cohomology and p-adic modular forms of singular weights, §5.1.2, author p.20, copy recorded in sourceVersions; misprint). The source specifies P_W as the object being stabilized. Correction: The parabolic subgroup P_W stabilizes the totally isotropic direct factor W. Reason: The sentence is defining P_W from W, and the following examples identify the line stabilizer as the Klingen parabolic and the maximal isotropic plane stabilizer as the Siegel parabolic. Stabilizing P_W itself is not this defining action on V. Affects: nothing. Known: Recorded in PAPER-PILLONI-20/E21 and its extraction review; no author or publisher corrigendum is claimed.. Review: confirmed.
- **ShimuraData/E17** (Abelian surfaces over totally real fields are potentially modular, Lemma 7.8.3, published p.409, compared with Definition 3.2.1 and §3.1, published pp.201–202; error). A single absolutely unramified F-place of residue characteristic greater than five, with Iw₁ level there, is asserted to certify neatness for G₁=Res_F/ℚ GSp₄ in the rational-prime definition. Correction: Require Iw₁ containment at every F-place above one rational prime ℓ>5, all absolutely unramified. The four-dimensional single-place generated-eigenvalue bound remains valid but does not alone control the faithful rational restriction-of-scalars representation. Reason: Take F=ℚ(√2), O_F=ℤ\[√2], u=7+5√2=(1+√2)³ of norm −1, and ℓ=7. At v=(7,√2−3), F_v=ℚ₇ and u≡1 mod v. The scalar γ=uI₄ belongs to Iw₁(v) and to full integral level at every other finite place. In the faithful rational representation on F⁴ the eigenvalues include u and its conjugate 7−5√2, whose product is −1. Thus γ is not rationally neat and its diagonal adele fails Definition 3.2.1 at every rational prime. Its similitude u² is totally positive, so restricting to G₁(ℚ)⁺ does not remove it. The other 7-adic place has u≡−1, illustrating the missing factor. E15 product closure within one local factor cannot repair this counterexample. Affects: a stated result. Known: Independently confirmed by REV-ShimuraData~3. No corresponding author or publisher corrigendum was located in the Numdam/journal listing, arXiv history or Calegari publication page as checked on 2026-10-09; this search is not a claim that none exists.. Review: confirmed.
- **ShimuraData/E18** (Introduction to Shimura varieties, §8, PEL Shimura varieties, p.88, sentence before the definition of a PEL Shimura datum (2017 author notes); error). Milne deduces from the embedding of G into the Siegel group, which carries X into the Siegel domain, that (G,X) satisfies SV1–SV4. Correction: SV1, SV2 and SV4 follow; SV3 must be added as a hypothesis. For a wholly definite unitary PEL datum of rank n≥2 (signature (n,0) at every real place) h is central, G^ad is a nontrivial ℚ-simple group with compact real points, and SV3 fails. Reason: Take K imaginary quadratic, B=K with complex conjugation, V=K^n with a definite skew-hermitian form and h(z) acting on V⊗ℝ=ℂ^n by the scalar z. The positivity condition of Proposition 8.14 holds, h(S) is central, so its projection to G^ad=PU(n) is trivial while PU(n) is a nontrivial ℚ-simple factor for n≥2. The embedding into the Siegel datum transfers SV1, SV2 and SV4 but not SV3. Affects: a stated result. Known: new. Review: awaiting review.

## Restructure proposal

**rescope** (ShimuraData, ShimuraVarieties, PELModuli, ReductiveGroupsPartII, AdelicAlgebraicGroups, ArithmeticLocallySymmetricSpaces). The upstream pull requests now state most of what this roadmap planned. ShimuraVarieties (#933) constructs, before its Layer 0, the pure datum and its category, Hermitian components, the representation–Hodge dictionary, homogeneous variations, the Borel embedding, the cocharacter class and reflex field, levels and the GL₂/Siegel/torus examples (§§P.1–P.5); PELModuli (#966) the PEL Shimura datum and the scalar-determinant Hilbert datum with its trace embedding (§§M0.12, M5.4); ReductiveGroupsPartII (#785) the Deligne torus (§RG2.0a.3) and the GSp₄ self-duality (§RG2.5); AdelicAlgebraicGroups (#792) restriction of scalars on adelic points and neatness (§§1.3–1.4, 4.3); ArithmeticLocallySymmetricSpaces (#871) the Lie structure of real points and Cartan involutions (§§ALS.F.1, ALS.0.1–0.2). Revision 4 supersedes 74 nodes accordingly (supersededNodes). The atlas still draws ShimuraData as their supplier: stage edges ShimuraData:D5→ShimuraVarieties:V0, ShimuraData:D3→ShimuraVarieties:V4 and ShimuraData:D4→PELModuli:M0, and tier 12 below the PEL/ShimuraVarieties bundle of tier 13.

Proposal: Rescope ShimuraData as the roadmap that builds on ShimuraVarieties §§P.1–P.5 and PELModuli §§M0.12, M5.4 rather than supplying them: (1) remove the three stage edges above and add ShimuraVarieties:V0→ShimuraData:D1–D5, PELModuli:M0→ShimuraData:D4 and PELModuli:M5→ShimuraData:D5; (2) move ShimuraData to the tier after the PEL/ShimuraVarieties bundle; (3) retitle it "Shimura data, Part II: additional axioms, Mumford–Tate groups, variations and explicit coordinates", with ShimuraVarieties as parent; (4) merge D0 (two Hilbert point comparisons) into D5 and D2 (uniqueness of the complex structure) into D3, keeping the stage ids D1 (Mumford–Tate groups and Hodge genericity), D3 (variations, compact duals, Kostant and Bruhat geometry), D4 (additional axioms, the SV5 criterion, PEL type, the type implications and the lifting of connected data) and D5 (Hilbert data, Siegel and GSp₄ coordinates, adelic neatness and the Iw₁ criterion); (5) retarget the 126 prerequisites in seven packets listed in consumerRetargets to the upstream stages named there.

## Suggested Lean file

`research/blueprint/suggested/ShimuraData.lean` states the retained targets on carriers that exist at the pins — Tau Ceti's GL coordinate Hopf algebras and Hopf ideals, the split torus algebra `ℂ[ℤ²]`, local coefficient systems and pure Hodge structures, Mathlib's Coxeter systems, root pairings, matrices, valuations and finite adeles — and elaborates at Mathlib 082e2d3 and Tau Ceti f790474 with placeholder-proof warnings only. Statements whose carriers are not at the pins (a pure Shimura datum, flag schemes over `ℤ`, the parabolic-type scheme over the reflex field, holomorphic flat bundles) are README targets; the file names each of them, with its intended form, in a closing section, and leaves out, with a comment, every condition its carriers cannot express.

