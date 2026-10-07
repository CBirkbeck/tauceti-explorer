# Hochschild, cyclotomic and refined trace methods — part RT.1: layers RT.1–RT.4

This document plans layers RT.1, RT.2, RT.3, RT.3b and RT.4 (with its sub-layers RT.4:topological,
RT.4:q-Hodge and RT.4:Habiro-comparison) of the roadmap *Hochschild, cyclotomic and refined trace
methods* at target level: every definition, construction and theorem the layers state, and every
definition and key theorem those targets need, is a node with its exact statement, a proof outline
citing its source, its prerequisites, and, for definitions and constructions, an API outline and
unit tests. Layers RT.5 (refined localizing invariants) and RT.6 (the BMS2 quasisyntomic
computations and Habiro interfaces) are planned in the second part of this roadmap; RT.3b's graded
square cites RT.6 for the motivic filtration on TC.

## Purpose and scope

The roadmap builds one trace-theoretic library for local-field K-theory (KTheoryFiniteLocalFields),
prismatic cohomology (PrismaticCohomology PR.7) and Habiro cohomology (HabiroCohomologyFoundations,
HabiroRings). This part supplies:

- **RT.1** — the cyclic structure on Hochschild homology: Connes' cyclic category, the cyclic bar
  construction, Connes' operator B, mixed complexes, cyclic, negative cyclic and periodic cyclic
  homology with the two totalisations kept apart, the SBI sequence, Morita invariance and products
  of the cyclic theories, base change and étale base change, the Hochschild–Kostant–Rosenberg map
  and theorem, the identification of B with the de Rham differential, cyclic homology of smooth
  algebras in characteristic 0, the derived HKR filtration, the universal property HH(A/R) = A ⊗ T,
  and HH(𝔽_p/ℤ).
- **RT.2** — Nikolaus–Scholze's theory: spectra with group action, homotopy orbits and fixed points,
  norm maps and Tate constructions (with the Tate orbit and fixpoint lemmas), the circle Tate
  construction, cyclic realisation and edgewise subdivision, the Tate diagonal, THH of E₁-rings and
  of spectral categories with its cyclotomic Frobenius, relative THH, mixed complexes as circle
  modules, cyclotomic spectra, TC⁻, TP and TC with the Nikolaus–Scholze formula, and the full
  comparison with genuine equivariant TR and TC.
- **RT.3** — localizing and truncating invariants, the Dennis and cyclotomic traces with their
  uniqueness and multiplicativity, Goodwillie derivatives and stable K = THH, the
  Dundas–Goodwillie–McCarthy theorem, Goodwillie's rational theorem, excision for K^inv, the tower
  square and the C_p assembly input.
- **RT.3b** — the Beilinson fibre square of Antieau–Mathew–Morrow–Nikolaus (Theorem 2.12, Corollary
  3.9, Theorem 6.17) with its ℚ_p-convention and shift dictionary.
- **RT.4** — complex topological K-theory (Bott periodicity, KU and ku, Adams operations, Chern
  classes and character), Wagner's q-Hodge filtrations from THH over ku (with Devalapurkar's
  comparison, even filtrations, solid spectra and cyclonic spectra) and Wagner's Habiro comparison
  with Corollary 6.15 for number fields.

## Conventions

- Spectra form the presentably symmetric monoidal stable ∞-category Sp of StableHomotopyKTheory
  H.5:spectra (compared with EnhancedDerivedSheaves E5 by E5:spectra-comparison); Sp^{BG} =
  Fun(BG, Sp). For the circle T and C_n ⊂ T, the residual group T/C_n is identified with T by
  z ↦ z^n.
- Homological grading throughout; Σ is the homological suspension and [1] = Σ. For mixed complexes
  u has degree −2: CC = M ⊗ k[u^{−1}] (direct-sum totalisation), CC⁻ = M[[u]] and CP = M((u))
  (product totalisation). The circle norm sequence is ΣHC → HC⁻ → HP.
- ℚ_p-coefficients mean p-completion followed by inverting p: F(R; ℚ_p) = F(R)^∧_p[1/p]
  (RT.3b/qp-coefficients). Homotopy fixed points, genuine fixed points and Tate constructions are
  different functors and are never identified without a theorem.
- The Bott class β ∈ π_2 ku has q − 1 = βt in π_0(ku^{hT}) = ℤ[β][[t]] (|t| = −2), following Wagner.
- Hochschild homology is derived over the base (A ⊗^L_{A ⊗^L_k A^op} A); the underived Hochschild
  complex computes it for flat algebras.

## Boundaries

Imported, not planned here: Hochschild chains, their normalisation and (derived) Morita invariance
(Tau Ceti DGAInfinity layers 8–9); the cotangent complex and derived exterior powers
(DerivedDeRhamCohomology DD.0) and the algebraic de Rham complex (DD.2); spectra, smash products,
ring and module spectra, Postnikov sections, p-completion and rationalisation (StableHomotopyKTheory
H.5:spectra, H.6); ∞-categorical foundations (EnhancedDerivedSheaves E0–E5); algebraic K-theory,
relative K-theory and products (GeneralAlgebraicKTheory K.2:plus, K.4, K.5, K.6, K.7); λ-rings and
Adams operations on abstract λ-rings (KTheoryLowDegrees Z.3); Dennis–Stein symbols (K2SymbolsBrauer
T.6); syntomic complexes and quasisyntomic descent (PrismaticCohomology PR.2, PR.4); q-de Rham and
q-Hodge complexes (HabiroCohomologyFoundations HQ.3); relative Habiro rings and their degree-zero
identification (HabiroRings HR.5, HR.6); solid abelian groups (VStackSheavesAndLisseCategories
VS2). Not exported here: the henselian-pair K/TC square (owned by the Part II on henselian pairs
proposed by the Clausen–Mathew–Morrow extraction), and real and equivariant topological K-theory,
the Atiyah–Segal completion theorem and p-adic Adams operations (proposed as a Part II of this
roadmap). The full field, DVR and truncated-polynomial calculations are KTheoryFiniteLocalFields
L.5's.

## Sources


- **ammn-20** — Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus, *On the Beilinson fiber square*, arXiv:2003.12541v2 (29 Sep 2021); numbering checked against v1 (Corollary 3.9 exists only in v2). <https://arxiv.org/pdf/2003.12541v2>
- **bgt-13** — Andrew J. Blumberg, David Gepner, Gonçalo Tabuada, *A universal characterization of higher algebraic K-theory*, arXiv:1001.2282v4 (5 Feb 2013); published Geom. Topol. 17 (2013) 733–838. <https://arxiv.org/abs/1001.2282v4>
- **bgt-14** — Andrew J. Blumberg, David Gepner, Gonçalo Tabuada, *Uniqueness of the multiplicative cyclotomic trace*, arXiv:1103.3923v3 (1 Jul 2015). <https://arxiv.org/abs/1103.3923v3>
- **blumberg-mandell-12** — Andrew J. Blumberg, Michael A. Mandell, *Localization theorems in topological Hochschild homology and topological cyclic homology*, arXiv:0802.3938v4 (24 May 2012); published Geom. Topol. 16 (2012) 1053–1120. <https://arxiv.org/abs/0802.3938v4>
- **bms2-19** — Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*, arXiv:1802.03261v2 (9 Apr 2019); published Publ. Math. IHÉS 129 (2019) 199–310; arXiv pagination used. <https://arxiv.org/pdf/1802.03261>
- **cmm-21** — Dustin Clausen, Akhil Mathew, Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*, arXiv:1803.10897v2 (20 Jul 2020); published J. Amer. Math. Soc. 34 (2021) 411–473. <https://arxiv.org/abs/1803.10897v2>
- **cortinas-06** — Guillermo Cortiñas, *The obstruction to excision in K-theory and in cyclic homology*, arXiv:math/0111096v5 (3 Oct 2005); published Invent. Math. 164 (2006) 143–173. <https://arxiv.org/abs/math/0111096v5>
- **devalapurkar-raksit-25** — Sanath K. Devalapurkar, Arpon Raksit, *THH(Z) and the image of J*, arXiv:2505.02218v2 (20 Jul 2026). <https://arxiv.org/abs/2505.02218>
- **devalapurkar-thesis** — Sanath Devalapurkar, *Spherochromatism in representation theory and arithmetic geometry (Ph.D. thesis, Harvard University, April 2025)*, PhD thesis, Harvard University (PDF from the author's page, version of 4 Sep 2026); printed page numbers. <https://sanathdevalapurkar.github.io/files/thesis.pdf>
- **dundas-97** — Bjørn Ian Dundas, *Relative K-theory and topological cyclic homology*, Acta Math. 179 (1997) 223–242 (published scan). <https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf>
- **gepner-snaith-09** — David Gepner, Victor Snaith, *On the motivic spectra representing algebraic cobordism and algebraic K-theory*, arXiv:0712.2817v3 (27 May 2010); published Doc. Math. 14 (2009) 359–396. <https://arxiv.org/pdf/0712.2817>
- **ginzburg-05** — Victor Ginzburg, *Lectures on noncommutative geometry*, arXiv:math/0506603v1 (29 Jun 2005). <https://arxiv.org/pdf/math/0506603>
- **hatcher-vbkt** — Allen Hatcher, *Vector Bundles and K-Theory*, Version 2.2 (November 2017); printed page numbers. <https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf>
- **hesselholt-nikolaus-19** — Lars Hesselholt, Thomas Nikolaus, *Topological cyclic homology (chapter in Handbook of Homotopy Theory)*, arXiv:1905.08984v1 (22 May 2019); Handbook of Homotopy Theory (2020). <https://arxiv.org/abs/1905.08984v1>
- **hkr-62** — G. Hochschild, Bertram Kostant, Alex Rosenberg, *Differential forms on regular affine algebras*, Trans. Amer. Math. Soc. 102 (1962) 383–408 (published scan). <https://www.ams.org/journals/tran/1962-102-03/S0002-9947-1962-0142598-8/S0002-9947-1962-0142598-8.pdf>
- **hoyois-15** — Marc Hoyois, *The homotopy fixed points of the circle action on Hochschild homology*, arXiv:1506.07123v2 (21 Apr 2018). <https://arxiv.org/pdf/1506.07123>
- **hrw-22** — Jeremy Hahn, Arpon Raksit, Dylan Wilson, *A motivic filtration on the topological cyclic homology of commutative ring spectra*, arXiv:2206.11208v3 (19 Oct 2025). <https://arxiv.org/abs/2206.11208>
- **land-tamme-19** — Markus Land, Georg Tamme, *On the K-theory of pullbacks*, arXiv:1808.05559v3 (8 Nov 2019); published Ann. of Math. 190 (2019) 877–930. <https://arxiv.org/abs/1808.05559v3>
- **lmmt-24** — Markus Land, Akhil Mathew, Lennart Meier, Georg Tamme, *Purity in chromatically localized algebraic K-theory*, arXiv:2001.10425v5 (18 Dec 2023); published J. Amer. Math. Soc. (2024). <https://arxiv.org/abs/2001.10425v5>
- **loday-quillen-84** — Jean-Louis Loday, Daniel Quillen, *Cyclic homology and the Lie algebra homology of matrices*, Comment. Math. Helv. 59 (1984) 565–591 (published scan). <https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf>
- **lurie-ec2** — Jacob Lurie, *Elliptic Cohomology II: Orientations*, Version of 26 April 2018 (author's page). <https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf>
- **lurie-ha** — Jacob Lurie, *Higher Algebra*, Version of 18 September 2017 (author's page). <https://www.math.ias.edu/~lurie/papers/HA.pdf>
- **may-concise** — J. P. May, *A Concise Course in Algebraic Topology*, Revised author's PDF of the 1999 University of Chicago Press edition. <https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf>
- **mccarthy-97** — Randy McCarthy, *Relative algebraic K-theory and topological cyclic homology*, Acta Math. 179 (1997) 197–222 (published scan). <https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf>
- **nikolaus-scholze-18** — Thomas Nikolaus, Peter Scholze, *On topological cyclic homology*, Acta Math. 221 (2018) 203–409 (published version; printed pages), compared with arXiv:1707.01799v2. <https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf>
- **pstragowski-23** — Piotr Pstrągowski, *Perfect even modules and the even filtration*, arXiv:2304.04685v2 (24 Oct 2024). <https://arxiv.org/abs/2304.04685>
- **raskin-18** — Sam Raskin, *On the Dundas-Goodwillie-McCarthy theorem*, arXiv:1807.06709v1 (17 Jul 2018). <https://arxiv.org/abs/1807.06709v1>
- **wagner-habiro-25** — Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*, arXiv:2510.04782v2 (8 Oct 2025); Corollary 3.13 numbering identical in v1. <https://arxiv.org/abs/2510.04782>
- **wagner-ku-25** — Ferdinand Wagner, *q-de Rham cohomology and topological Hochschild homology over ku*, arXiv:2510.06057v1 (7 Oct 2025). <https://arxiv.org/abs/2510.06057>
- **weibel-geller-91** — Charles A. Weibel, Susan C. Geller, *Étale descent for Hochschild and cyclic homology*, Comment. Math. Helv. 66 (1991) 368–388 (published scan). <https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf>

## RT.1. Algebraic Hochschild and cyclic theory

The Hochschild complex of an algebra is imported from DGAInfinity layer 8; this layer adds the
cyclic operator t_n and with it Connes' operator B, so that Hochschild chains form a mixed complex.
Cyclic, negative cyclic and periodic cyclic homology are functors of mixed complexes, and they differ
exactly in how the (b, B) bicomplex is totalised: CC uses direct sums, CC⁻ and CP use products. The
SBI sequence relates HH and HC. Morita invariance and external products extend from Hochschild to
cyclic homology because the generalised trace and the shuffle map are maps of mixed complexes. For
smooth commutative algebras HKR identifies HH_* with differential forms and B with the de Rham
differential; over ℚ this computes HC, HC⁻ and HP by de Rham cohomology. For arbitrary commutative
rings HH carries the derived HKR filtration with graded pieces ∧^n L[n], which computes HH(𝔽_p/ℤ) as a
divided power algebra.

**Planets.** Cyclic homology, Hochschild–Kostant–Rosenberg theorem, Derived HKR filtration.

**From other roadmaps and the libraries it uses** `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-differential`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Smooth`, `mathlib:AlgebraicTopology.alternatingFaceMapComplex`, `mathlib:AlgebraicTopology.normalizedMooreComplex`, `mathlib:CategoryTheory.SimplicialObject`, `mathlib:CategoryTheory.Tor`, `mathlib:DividedPowerAlgebra`, `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:HomologicalComplex₂.total`, `mathlib:KaehlerDifferential`, `mathlib:Matrix.trace`, `mathlib:Module.Flat`, `mathlib:MoritaEquivalence`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`.

**Acceptance tests of the layer.** Each node below lists its acceptance properties; the layer is accepted when every node's acceptance list and every unit test holds.

### `RT.1/cyclic-category` — Connes' cyclic category and cyclic objects

*Definition.* Connes' cyclic category Λ has objects [n] = {0,…,n} (n ≥ 0); it contains the simplex category Δ, has an automorphism τ_n of [n] of order n+1, and every morphism of Λ factors uniquely as an automorphism followed by a morphism of Δ, with the relations τ_n d_i = d_{i−1} τ_{n−1} (1 ≤ i ≤ n), τ_n d_0 = d_n, τ_n s_i = s_{i−1} τ_{n+1} (1 ≤ i ≤ n), τ_n s_0 = s_n τ_{n+1}², τ_n^{n+1} = id. The paracyclic category Λ_∞ drops τ_n^{n+1} = id. A cyclic object of a category C is a functor Λ^op → C: a simplicial object X with operators t_n : X_n → X_n satisfying the dual relations (d_i t_n = t_{n−1} d_{i−1} for 1 ≤ i ≤ n, d_0 t_n = d_n, s_i t_n = t_{n+1} s_{i−1} for 1 ≤ i ≤ n, s_0 t_n = t_{n+1}² s_n, t_n^{n+1} = id). Cyclic objects form the functor category Fun(Λ^op, C) and restrict along Δ ⊂ Λ to simplicial objects.

**Hypotheses.**

- C an arbitrary category; for cyclic modules C = Mod_k with k a commutative ring.

**Construction and proof.**

1. Define Λ by generators (the coface, codegeneracy and cyclic maps) and the relations listed, following NS18 Appendix B, or as the category of nonempty finite cyclically ordered sets with degree-one maps.
2. Prove the unique factorisation Λ([m],[n]) = Δ([m],[n]) × Aut_Λ([m]) with Aut_Λ([m]) = ℤ/(m+1); this gives the presentation of cyclic objects by (d_i, s_j, t_n).
3. Define Λ_∞ with Aut([n]) = ℤ and the functor Λ_∞ → Λ; record Λ ≃ Λ^op (Connes' self-duality) as an API item, not used in the constructions.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CyclicCategory` | data | The category Λ with objects ℕ and morphisms the pairs (φ, g) of a Δ-morphism and a cyclic automorphism, with the composition law of NS18 Appendix B. |
| `CyclicCategory.toSimplex` | projection | The faithful wide inclusion Δ → Λ. |
| `CyclicCategory.factor` | characterisation | Every morphism of Λ is uniquely a cyclic automorphism followed by a morphism of Δ. |
| `CyclicObject` | data | Cyclic objects of C: functors Λ^op ⥤ C; CyclicObject.toSimplicial restricts along Δ ⊂ Λ. |
| `CyclicObject.mk` | constructor | A simplicial object with operators t_n satisfying the listed relations defines a cyclic object, and every cyclic object arises so. |
| `CyclicObject.t_pow` | simp | t_n^{n+1} = id on X_n. |
| `CyclicObject.map` | functoriality | Postcomposition with a functor C ⥤ D maps cyclic objects to cyclic objects, compatibly with identities and composition. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CyclicCategory.aut_card` | computation | Aut_Λ([n]) is cyclic of order n + 1; for n = 0 it is trivial. |
| `CyclicObject.constant` | degenerate | The constant simplicial object at an object c, with t_n = id, is a cyclic object. |
| `CyclicObject.nonexample_sign` | non-example | Building B = (1 − τ)sN from the unsigned rotation τ instead of t = (−1)^nτ fails bB + Bb = 0 already for A = k[x] in degree 1 (2 ≠ 0 in k): the cyclic structure is τ, but B needs the signed operator. |
| `CyclicObject.toSimplicial_alternatingFaceMap` | compatibility | For C abelian, the alternating face map complex of the underlying simplicial object of a cyclic object is Mathlib's alternatingFaceMapComplex. |

**Used by.**

- RT.1/cyclic-bar-construction: the Hochschild complex of an algebra is the cyclic module A^{⊗(•+1)}
- RT.2/cyclic-realisation: the geometric realisation of a cyclic object carries a circle action (NS18 Proposition B.5)
- RT.2/thh-e1-ring: THH is the realisation of the cyclic bar construction in spectra

**Acceptance.**

- The restriction of a cyclic object to Δ^op is its underlying simplicial object, and Mathlib's alternating face map complex applies to it.
- In a cyclic object, t_n^{n+1} = id and d_0 t_n = d_n hold; for the cyclic bar construction of RT.1/cyclic-bar-construction these are the identities of the cyclic operator.

**Depends on.** `mathlib:CategoryTheory.SimplicialObject`

**Source.** nikolaus-scholze-18, Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383); excerpt from the definition of Λ_∞ (p. 380): “Now, we construct Connes’ cyclic category Λ. We start with the definition of the paracyclic category Λ∞ . It is the full subcategory Λ∞ ⊆ZPoSet consisting of all objects isomorphic to (1/n)Z for n⩾1.” — NS18 Appendix B defines the paracyclic and cyclic categories used for THH and their relation to Δ.

**Source.** loday-quillen-84, §1, p. 567; Lemma 1.1, p. 567: “We define an action of the cyclic group Z/n on A^n by letting the generator act as the operator t(a_1, ..., a_n) = (−1)^{n−1}(a_n, a_1, ..., a_{n−1}). Let N = 1+t+ ··· +t^{n−1} denote the corresponding norm operator on A^n.” — The cyclic operator on the Hochschild complex is the structure a cyclic module carries.

### `RT.1/cyclic-bar-construction` — The cyclic bar construction of an algebra

*Construction.* For a commutative ring k and an associative unital k-algebra A, the cyclic k-module C_•(A/k) has C_n = A^{⊗_k(n+1)}, faces d_i(a_0⊗…⊗a_n) = a_0⊗…⊗a_i a_{i+1}⊗…⊗a_n for 0 ≤ i < n and d_n(a_0⊗…⊗a_n) = a_n a_0⊗a_1⊗…⊗a_{n−1}, degeneracies s_j inserting 1 after position j, and cyclic operator τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1} (the unsigned rotation, which satisfies the cyclic relations); the signed operator t_n := (−1)^n τ_n is the one entering b′, the norm N and Connes' B. Its alternating face map complex, with b = Σ_{i=0}^n (−1)^i d_i, is the Hochschild complex of A over k as constructed by DGAInfinity layer 8 for A viewed as a DG algebra concentrated in degree 0; its normalised complex is layer 8's normalised Hochschild complex. The construction is functorial in k-algebra maps.

**Hypotheses.**

- k a commutative ring; A an associative unital k-algebra. No flatness is assumed for the construction; RT.1/hochschild-homology uses it only for k-flat A or after flat resolution.

**Construction and proof.**

1. Import the Hochschild chain complex, its bar differential and its normalised version from DGAInfinity layer 8, specialised to an ungraded algebra; do not construct them again.
2. Exhibit the simplicial k-module structure (d_i, s_j) and identify its alternating face map complex (Mathlib alternatingFaceMapComplex) with layer 8's complex termwise.
3. Add the cyclic operator τ_n and verify the relations of RT.1/cyclic-category directly from the formulas; record the signed t_n = (−1)^nτ_n used by the operators of the complex.
4. Check functoriality: an algebra map f : A → A' induces f^{⊗(n+1)} commuting with d_i, s_j, τ_n.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CyclicBar` | constructor | CyclicBar k A : CyclicObject (ModuleCat k) with (CyclicBar k A)_n = A^{⊗_k(n+1)}. |
| `CyclicBar.face_apply` | simp | The face formulas d_i(a_0⊗…⊗a_n) displayed in the statement, including d_n's wrap-around. |
| `CyclicBar.cyclic_apply` | simp | τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1}; the signed operator t_n = (−1)^nτ_n is the one used in b′, N and B. |
| `CyclicBar.map` | functoriality | A k-algebra map A → A' induces a map of cyclic modules, with map_id and map_comp. |
| `CyclicBar.alternatingFaceMapComplex_iso` | compatibility | The alternating face map complex of the underlying simplicial module is DGAInfinity layer 8's Hochschild complex of A. |
| `CyclicBar.b_comp_b` | relation | b ∘ b = 0 (from the simplicial identities). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CyclicBar.ground_ring` | degenerate | For A = k, H_*(C_•(k/k), b) = k in degree 0 and 0 elsewhere. |
| `CyclicBar.H0` | computation | H_0(C_•(A/k), b) ≅ A/[A,A]; for A = M_2(k) this is k via the trace. |
| `CyclicBar.polynomial_H1` | computation | For A = k[x], H_1 ≅ k[x]·dx via a_0⊗a_1 ↦ a_0 da_1. |
| `CyclicBar.nonexample_signed` | non-example | The signed rotation (−1)^nτ_n is not a cyclic structure: for A = k with 2 ≠ 0, d_0 ∘ (−τ_1) = −d_1 ≠ d_1 on A^{⊗2}, whereas the unsigned τ_1 satisfies d_0τ_1 = d_1. |

**Used by.**

- RT.1/connes-operator: B is built from t_n, the extra degeneracy and the norm N
- KTheoryFiniteLocalFields:L.5/hochschild-homology-of-truncated-polynomial-algebra: the cyclic model of HH of k[x]/(x^e)
- RT.2/thh-e1-ring: the same formula in spectra (with smash products) defines the cyclic object whose realisation is THH

**Acceptance.**

- For A = k, C_n = k with all faces the identity, so b alternates between 0 and the identity, and the homology is k in degree 0.
- b ∘ b = 0 follows from the simplicial identities; b(a_0⊗a_1) = a_0a_1 − a_1a_0, so H_0 = A/[A,A].

**Depends on.** `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`, `RT.1/cyclic-category`, `mathlib:AlgebraicTopology.alternatingFaceMapComplex`, `mathlib:AlgebraicTopology.normalizedMooreComplex`

**Source.** loday-quillen-84, §1 'Hochschild and cyclic homology', pp. 566-567: “Let A be an associative algebra (with identity) over a commutative ring k. We will use the abbreviation A^n for A^{⊗n} ... b(a_0, ..., a_n) = Σ_{i=0}^{n−1} (−1)^i (a_0, ..., a_i a_{i+1}, ..., a_n) + (−1)^n (a_n a_0, ..., a_{n−1})” — States the Hochschild complex A^{⊗(n+1)} with the alternating face differential b.

**Source.** loday-quillen-84, §1, p. 567; Lemma 1.1, p. 567: “We define an action of the cyclic group Z/n on A^n by letting the generator act as the operator t(a_1, ..., a_n) = (−1)^{n−1}(a_n, a_1, ..., a_{n−1}). Let N = 1+t+ ··· +t^{n−1} denote the corresponding norm operator on A^n.” — States the cyclic operator that makes the Hochschild complex a cyclic module.

### `RT.1/hochschild-homology` — Hochschild homology, derived over the base

*Definition.* For k a commutative ring and A an associative k-algebra, Hochschild homology is HH(A/k) := A ⊗^L_{A ⊗^L_k A^op} A ∈ D(k), computed by the Hochschild complex (C_•(P/k), b) of any k-flat DG k-algebra P quasi-isomorphic to A (for commutative A one may take a simplicial resolution by polynomial k-algebras). HH_n(A/k) := H_n HH(A/k). When A is k-flat, HH(A/k) is computed by C_•(A/k) itself. For a two-sided ideal I ⊂ A the relative theory is HH(A, I) := fib(HH(A/k) → HH((A/I)/k)). HH(A/k) is functorial in pairs (k → A) and lands in the T-equivariant derived category through RT.2/mixed-complexes-are-circle-modules.

**Hypotheses.**

- k commutative; A associative unital k-algebra. When A is not k-flat the derived definition differs from the homology of A^{⊗_k(•+1)} (example: k = ℤ, A = 𝔽_p).

**Construction and proof.**

1. Construct HH(A/k) as the homology of layer 8's Hochschild complex of a k-flat DG resolution P → A, using layer 8's invariance under quasi-equivalence to see independence of P.
2. Identify it with A ⊗^L_{A^e} A in the enhanced derived category of EnhancedDerivedSheaves E1, using the bar resolution of A over A^e (K-flat when A is k-flat).
3. For commutative A, compare with the cyclic bar construction of a simplicial polynomial resolution (animated rings, EnhancedDerivedSheaves E5:animation): left Kan extension from polynomial algebras gives the same object (BMS2 §2.2).
4. Define relative HH by the fibre and record the long exact sequence.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HochschildHomology` | data | HH(A/k) ∈ D(k), functorial in the pair (k, A). |
| `HochschildHomology.ofFlat` | characterisation | For A flat over k, HH(A/k) ≅ (C_•(A/k), b) in D(k). |
| `HochschildHomology.map` | functoriality | A map of pairs (k → A) → (k' → A') induces HH(A/k) → HH(A'/k'), with map_id and map_comp. |
| `HochschildHomology.relative` | constructor | HH(A, I) := fib(HH(A/k) → HH((A/I)/k)) with its long exact sequence of homology. |
| `HochschildHomology.zeroth` | simp | HH_0(A/k) ≅ A/[A,A] (derived HH_0 agrees with the underived one). |
| `HochschildHomology.commutativeAlgebra` | structure | For commutative A, HH(A/k) is an E_∞-k-algebra with the shuffle product, and HH_0(A/k) = A as rings. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `HochschildHomology.base` | degenerate | HH(k/k) ≅ k in degree 0. |
| `HochschildHomology.polynomial` | computation | HH_*(k[x]/k) ≅ k[x] ⊕ k[x]dx, concentrated in degrees 0 and 1. |
| `HochschildHomology.Fp_over_Z_degree2` | computation | HH_2(𝔽_p/ℤ) ≅ 𝔽_p (the divided power generator), while HH_1(𝔽_p/ℤ) = 0. |
| `HochschildHomology.dual_numbers_nonvanishing` | non-example | For A = k[x]/(x²) with 2 invertible, HH_n(A/k) ≠ 0 for every n ≥ 0, so HH is not Ω^*_{A/k} for non-smooth A. |

**Used by.**

- KTheoryFiniteLocalFields:L.5/hochschild-homology-of-perfect-field: HH_*(k) = k for a perfect field k of characteristic p, relative to 𝔽_p
- RT.2/thh-over-thhz: THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ) (BMS2 Lemma 2.5)
- RT.3/dennis-trace: the Dennis trace lands in HH_*(A)
- NS18 Proposition IV.4.3: HH(𝔽_p/ℤ) is a divided power algebra

**Acceptance.**

- HH(𝔽_p/ℤ) is computed by a ℤ-flat resolution; it is not ⊕ 𝔽_p^{⊗(n+1)} homology (which would be 𝔽_p in degree 0 only).
- For A k-flat, HH(A/k) is the homology of C_•(A/k).

**Depends on.** `RT.1/cyclic-bar-construction`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `mathlib:Module.Flat`

**Source.** bms2-19, §2.2 'Hochschild homology', p. 13: “we will work throughout with the derived version of Hochschild homology (also known as Shukla homology following [Shu61]) ... Letting P_• → A be a simplicial resolution of A by flat R-algebras, let HH(A/R) denote the diagonal of the bisimplicial R-module C_•(P_•/R);” — BMS2 defines HH(A/R) for commutative rings as a derived object by left Kan extension / derived tensor products.

**Source.** loday-quillen-84, §1 'Hochschild and cyclic homology', pp. 566-567: “Let A be an associative algebra (with identity) over a commutative ring k. We will use the abbreviation A^n for A^{⊗n} ... b(a_0, ..., a_n) = Σ_{i=0}^{n−1} (−1)^i (a_0, ..., a_i a_{i+1}, ..., a_n) + (−1)^n (a_n a_0, ..., a_{n−1})” — The Hochschild complex computes HH for flat algebras.

### `RT.1/connes-operator` — Connes' operator B

*Construction.* On a cyclic k-module X with cyclic operators τ_n, put t_n := (−1)^nτ_n, N_n := Σ_{i=0}^n t_n^i and let s be the extra degeneracy (for the cyclic bar construction s(a_0⊗…⊗a_n) = 1⊗a_0⊗…⊗a_n). Connes' operator is B := (1 − t_{n+1}) s N_n : X_n → X_{n+1}; it satisfies b² = 0, B² = 0 and bB + Bb = 0 already on unnormalised chains, and descends to the normalised complex N(X) (the quotient by degenerate elements), where on Hochschild chains B(a_0⊗…⊗a_n) = Σ_{i=0}^n (−1)^{ni} 1⊗a_i⊗…⊗a_n⊗a_0⊗…⊗a_{i−1}. So (X, b, B) and (N(X), b, B) are mixed complexes (RT.1/mixed-complex), naturally in X and quasi-isomorphic.

**Hypotheses.**

- X a cyclic object in k-modules; the explicit formula for B holds on normalised chains.

**Construction and proof.**

1. Prove (1 − t)N = 0 = N(1 − t) and the identities b(1 − t) = (1 − t)b′, b′N = Nb, where b′ = Σ_{i<n}(−1)^i d_i (Connes; Ginzburg §2).
2. B² = (1 − t)sN(1 − t)sN = 0 since N(1 − t) = 0; bB + Bb = 0 from b(1 − t) = (1 − t)b′, b′N = Nb and sb′ + b′s = id (Loday–Quillen §1; Hoyois §2).
3. Naturality in maps of cyclic modules is immediate from the formula.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CyclicObject.connesB` | data | B : N(X)_n → N(X)_{n+1} for a cyclic k-module X. |
| `CyclicObject.connesB_sq` | relation | B ∘ B = 0. |
| `CyclicObject.connesB_comm` | relation | b ∘ B + B ∘ b = 0. |
| `CyclicObject.connesB_natural` | functoriality | B commutes with the maps induced by morphisms of cyclic modules. |
| `CyclicBar.connesB_apply` | simp | The explicit formula for B on normalised Hochschild chains. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CyclicBar.connesB_unit` | degenerate | B(1) = 0 in N_1(A) because 1⊗1 is degenerate. |
| `CyclicBar.connesB_polynomial` | computation | For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) = k[x]dx, i.e. m x^{m−1}dx. |
| `CyclicBar.connesB_sq_unnormalised` | characterisation | B ∘ B = 0 already on unnormalised chains, since N_{n+1}(1 − t_{n+1}) = 1 − t_{n+1}^{n+2} = 0; normalisation only simplifies the formula for B. |

**Used by.**

- RT.1/mixed-complex: the pair (b, B) is the basic example of a mixed complex
- KTheoryFiniteLocalFields:L.4/connes-operator: Connes' operator on π_* of a T-spectrum restricts to B on HH
- RT.1/b-equals-d: B corresponds to the de Rham differential under HKR

**Acceptance.**

- For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) (since 1⊗ab ≡ a⊗b + b⊗a modulo b-boundaries); under HKR this is d(x^m) = m x^{m−1}dx (RT.1/b-equals-d).
- B vanishes on HH_0(k/k) = k.

**Depends on.** `RT.1/cyclic-category`, `RT.1/cyclic-bar-construction`, `mathlib:AlgebraicTopology.normalizedMooreComplex`

**Source.** hoyois-15, §2, p. 4: “s_{−1} : M_n → M_{n+1}, s_{−1} = cs_n, t : M_n → M_n, t = (−1)^n c, N : M_n → M_n, N = Σ_{i=0}^{n} t^i, B : M_n → M_{n+1}, B = (id − t)s_{−1}N. We easily verify that b^2 = 0, B^2 = 0, and bB + Bb = 0.” — Defines Connes' operator B and states the identities b² = B² = bB + Bb = 0.

### `RT.1/mixed-complex` — Mixed complexes

*Definition.* A mixed complex over k is a graded k-module M = (M_n)_{n≥0} with maps b : M_n → M_{n−1} and B : M_n → M_{n+1} such that b² = 0, B² = 0 and bB + Bb = 0. A morphism is a graded map commuting with b and B; it is a quasi-isomorphism if it induces an isomorphism on b-homology. Equivalently a mixed complex is a dg-module over the exterior algebra k[ε]/(ε²) with |ε| = 1 (ε acting by B). The mixed complex of a cyclic module X is (N(X), b, B) (RT.1/connes-operator); the mixed complex of an algebra is C(A/k) := (N C_•(A/k), b, B).

**Hypotheses.**

- k commutative ring; homological grading with b of degree −1 and B of degree +1.

**Construction and proof.**

1. Define the category MixCx_k and the forgetful functor to chain complexes.
2. Identify MixCx_k with dg-modules over Λ_k = k[ε]/ε², |ε| = 1.
3. Localise at quasi-isomorphisms; RT.2/mixed-complexes-are-circle-modules identifies the localisation with D(k)^{BT}.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `MixedComplex` | structure | Graded k-module with b, B and the three relations. |
| `MixedComplex.Hom` | data | Morphisms commuting with b and B; identity and composition. |
| `MixedComplex.ofCyclic` | constructor | The normalised mixed complex of a cyclic k-module, natural in the cyclic module. |
| `MixedComplex.QuasiIso` | characterisation | A morphism is a quasi-isomorphism iff it induces isomorphisms on b-homology; then it induces isomorphisms on HC, HC⁻ and HP (RT.1/cyclic-homology). |
| `MixedComplex.equivDGModule` | equivalence | Mixed complexes are dg-modules over k[ε]/ε² with \|ε\| = 1. |
| `MixedComplex.tensor` | structure | Tensor product (M⊗N, b⊗1 ± 1⊗b, B⊗1 ± 1⊗B) making MixCx_k symmetric monoidal. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `MixedComplex.trivial` | degenerate | k in degree 0 with b = B = 0 is a mixed complex. |
| `MixedComplex.ofCyclic_ground` | computation | The mixed complex of k as a k-algebra is quasi-isomorphic to (k, 0, 0). |
| `MixedComplex.nonexample` | non-example | M = k in degrees 0 and 1, b : M_1 → M_0 and B : M_0 → M_1 both the identity: b² = 0 and B² = 0 but bB + Bb = id ≠ 0, so this is not a mixed complex. |

**Used by.**

- RT.1/cyclic-homology: HC, HC⁻ and HP are functors of mixed complexes
- RT.1/morita-invariance: Morita invariance is proved at the level of mixed complexes
- RT.2/mixed-complexes-are-circle-modules: mixed complexes model complexes with circle action

**Acceptance.**

- (k, 0, 0) concentrated in degree 0 is a mixed complex; its HC is k[u^{−1}] (RT.1/cyclic-homology).
- (N C_•(A/k), b, B) is a mixed complex by RT.1/connes-operator.

**Depends on.** `RT.1/connes-operator`

**Source.** hoyois-15, §2, p. 5: “We let k[ε] be the differential graded k-algebra ··· → 0 → kε →(0) k → 0 → ··· , which is nonzero in degrees 1 and 0. The ∞-category Mod_{k[ε]} is the localization of the category of differential graded k[ε]-modules, also called mixed complexes, at the quasi-isomorphisms.” — Defines mixed complexes (M, b, B) with b² = B² = bB + Bb = 0.

### `RT.1/cyclic-homology` — Cyclic, negative cyclic and periodic cyclic homology ★

*Planet:* Cyclic homology.

*Definition.* For a mixed complex (M, b, B) let u be a formal variable of homological degree −2. Then CC⁻(M) := (M[[u]], b + uB) (product totalisation, Π_{i≥0} M_{n+2i} in degree n), CP(M) := (M((u)), b + uB) (Π over i ∈ ℤ, Laurent series in u), and CC(M) := (M ⊗ k[u^{−1}], b + uB) = (⊕_{i≥0} M_{n−2i} in degree n, direct-sum totalisation, u·u^0 = 0). HC_n(M) = H_n CC(M), HC⁻_n(M) = H_n CC⁻(M), HP_n(M) = H_n CP(M) (2-periodic). For an algebra, HC_n(A/k) := HC_n(C(A/k)) etc., computed from a k-flat resolution when A is not flat. Product and sum totalisations are kept distinct: the direct-sum totalisation of the periodic bicomplex computes 0 for every mixed complex of the form (k,0,0) ⊗ k[u^{±1}] restricted, whereas HP(k) = k[u^{±1}].

**Hypotheses.**

- (M, b, B) a mixed complex over a commutative ring k; u has degree −2 throughout this roadmap (NS18 and BMS2 convention).

**Construction and proof.**

1. Define the three complexes and check (b + uB)² = b² + u(bB + Bb) + u²B² = 0.
2. Show quasi-isomorphisms of mixed complexes induce isomorphisms on all three: for CC by the bounded-below column filtration; for CC⁻ and CP by the complete u-adic filtration and the Milnor sequence (the product totalisation is what makes this argument work).
3. Compare with Connes' complex C^λ = C/(1 − t) when ℚ ⊂ k (classical, recorded as a comparison API item).
4. For Mathlib's direct-sum total complex HomologicalComplex₂.total, record that it computes CC but not CC⁻ or CP; product totalisation is constructed here.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `MixedComplex.cyclicComplex` | data | CC(M) with the direct-sum totalisation. |
| `MixedComplex.negativeCyclicComplex` | data | CC⁻(M) = M[[u]] with b + uB (product totalisation). |
| `MixedComplex.periodicCyclicComplex` | data | CP(M) = M((u)) with b + uB. |
| `cyclicHomology` | constructor | HC_n(A/k), HC⁻_n(A/k), HP_n(A/k) for an algebra, via its mixed complex. |
| `MixedComplex.cyclicComplex_quasiIso` | functoriality | Quasi-isomorphisms of mixed complexes induce isomorphisms on HC, HC⁻ and HP. |
| `periodicCyclicHomology.periodicity` | relation | Multiplication by u gives HP_n ≅ HP_{n−2}. |
| `cyclicHomology.connes_complex` | compatibility | If ℚ ⊆ k, HC_n(A/k) ≅ H_n(C_•(A)/(1 − t)) (Connes' complex). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `cyclicHomology.ground` | computation | HC_{2m}(k/k) = k and HC_{2m+1}(k/k) = 0 for m ≥ 0. |
| `periodicCyclicHomology.ground` | computation | HP_{2m}(k/k) = k for all m ∈ ℤ. |
| `negativeCyclicHomology.ground` | degenerate | HC⁻_n(k/k) = k for n ≤ 0 even and 0 otherwise. |
| `negativeCyclicHomology.not_cyclic` | non-example | HC⁻_2(k/k) = 0 while HC_2(k/k) = k: defining HC⁻ with k[u^{−1}] (the cyclic convention) instead of k[[u]] gives the wrong groups. |

**Used by.**

- RT.3b/beilinson-square-ordinary: HC⁻(R;ℚ_p) → HP(R;ℚ_p) is the bottom row of the Beilinson square
- RT.3/goodwillie-rational: relative K-theory is rationally relative HC shifted by one
- KTheoryFiniteLocalFields:L.5/relative-cyclic-homology-of-truncated-polynomial-algebra: rational relative cyclic homology of k[x]/(x^e)

**Acceptance.**

- HC_*(k/k) = k[u^{−1}] (k in each even degree ≥ 0), HC⁻_*(k/k) = k[u] (k in even degrees ≤ 0), HP_*(k/k) = k[u^{±1}].
- For A = k[x] over ℚ ⊂ k: HC_n(k[x]) = HC_n(k) for n ≥ 1 and HC_0 = k[x] (homotopy invariance in characteristic 0).

**Depends on.** `RT.1/mixed-complex`, `mathlib:HomologicalComplex₂.total`

**Source.** loday-quillen-84, Definition, p. 568; Proposition 1.2, p. 568; Proposition 1.5, p. 569: “DEFINITION. The cyclic homology HC_*(A) of the associative k-algebra A is the homology of Tot 𝒞(A).” — Defines cyclic homology from the (b, B) bicomplex with the direct-sum totalisation.

**Source.** hoyois-15, §2, p. 4: “Finally, we form the total complexes Tot BC, Tot BN, Tot BP : PSh(Λ, Ch_k) → Ch_k, where Tot(B)_n = colim_{r→∞} Π_{p≤r} B_{p,n−p}. These functors clearly preserve quasi-isomorphisms and hence induce functors CC, CN, CP : PSh(Λ, Mod_k) → Mod_k,” — Defines negative cyclic and periodic cyclic homology with product totalisation.

### `RT.1/sbi-sequence` — Connes' SBI exact sequence

*Theorem.* For every mixed complex M over k there is a natural long exact sequence … → HH_n(M) →^{I} HC_n(M) →^{S} HC_{n−2}(M) →^{B} HH_{n−1}(M) → …, where HH_n(M) = H_n(M, b), I is induced by the inclusion M = u^0-column ⊂ CC(M), S is multiplication by u (removing the u^0 column) and B is induced by Connes' operator. In particular for an algebra A over k: … → HH_n(A/k) → HC_n(A/k) → HC_{n−2}(A/k) → HH_{n−1}(A/k) → …. Analogously HC⁻ and HP sit in … → HC⁻_{n+2} →^{u} HC⁻_n → HH_n → HC⁻_{n+1} → … .

**Hypotheses.**

- M a mixed complex; degrees homological with HC_{n} = 0 for n < 0.

**Construction and proof.**

1. The short exact sequence of complexes 0 → M → CC(M) →^{u} CC(M)[2] → 0 (columns i = 0 and i ≥ 1).
2. Take the long exact homology sequence; identify the connecting map with B.
3. For HC⁻ use 0 → u CC⁻(M) → CC⁻(M) → M → 0.

**Acceptance.**

- For M = (k,0,0) the sequence splits into 0 → k → HC_{2m} → HC_{2m−2} → 0 with S an isomorphism for m ≥ 1.
- For A smooth over a ℚ-algebra, S agrees under HKR with the projection Ω^n/dΩ^{n−1} ⊕ H^{n−2}_dR ⊕ … → H^{n−2}_dR ⊕ … (RT.1/hkr-cyclic-char0).

**Depends on.** `RT.1/cyclic-homology`, `RT.1/mixed-complex`

**Source.** loday-quillen-84, Theorem 1.6 and its proof, p. 570: “THEOREM 1.6. For any associative k-algebra A there is a long exact sequence ··· → H_n(A) →(I) HC_n(A) →(S) HC_{n−2}(A) →(B) H_{n−1}(A) → ··· It is clear from the picture of ℬ(A) that one has an exact sequence of complexes 0 → (A^{*+1}, b) → Tot ℬ(A) → Tot ℬ(A)[−2] → 0” — Connes' periodicity exact sequence relating Hochschild and cyclic homology.

### `RT.1/morita-invariance` — Morita invariance of Hochschild and cyclic homology

*Theorem.* Let A and B be k-algebras that are Morita equivalent over k (Mathlib MoritaEquivalence), realised by a finitely generated projective generator P of A-modules with B ≅ End_A(P)^op, and assume A, B k-flat (or work with derived HH via flat resolutions). Then the Morita bimodules induce a quasi-isomorphism of mixed complexes C(A/k) ≃ C(B/k); hence HH_*, HC_*, HC⁻_* and HP_* of A and B are naturally isomorphic. In particular the generalised trace tr : C(M_r(A)) → C(A), tr(m^0⊗…⊗m^n) = Σ m^0_{i_0i_1}⊗m^1_{i_1i_2}⊗…⊗m^n_{i_ni_0}, commutes with b and B and is inverse up to homotopy to a ↦ E_{11}a.

**Hypotheses.**

- A, B k-algebras, Morita equivalent over k; flatness over k or derived HH.
- Derived Morita equivalences of DG algebras are covered by DGAInfinity layer 8 for HH; the compatibility with B is added here.

**Construction and proof.**

1. Import from DGAInfinity layer 8 the quasi-isomorphism of Hochschild complexes induced by a Morita equivalence (and its derived version).
2. Check that the generalised trace and the corner inclusion commute with t_n, hence with B, so the Hochschild quasi-isomorphism is one of mixed complexes.
3. Reduce a general Morita equivalence to P a direct summand of A^r: B = eM_r(A)e for an idempotent e, and use the matrix and corner cases.
4. Apply RT.1/cyclic-homology: quasi-isomorphisms of mixed complexes induce isomorphisms on HC, HC⁻, HP.

**Acceptance.**

- HC_*(M_2(k)/k) ≅ HC_*(k/k), with the isomorphism induced by the matrix trace in degree 0.
- HH_0(M_r(A)) = M_r(A)/[M_r(A), M_r(A)] ≅ A/[A,A] via the trace.

**Depends on.** `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`, `mathlib:MoritaEquivalence`, `mathlib:Matrix.trace`, `RT.1/mixed-complex`, `RT.1/cyclic-homology`

**Source.** loday-quillen-84, Corollary 1.7, p. 570: “COROLLARY 1.7. Cyclic homology is Morita invariant. Proof. This follows from the long exact sequence (1.6) and the Morita invariance of Hochschild homology (Cf. [14], theorem 3.7).” — Loday–Quillen Corollary 1.7: cyclic homology is Morita invariant (from the SBI sequence and Morita invariance of HH).

**Source.** ginzburg-05, Proposition 5.2.1, p. 21: “Proposition 5.2.1. The functors HH_• and HH^• are both Morita invariant. In particular, HH_•(A) = HH_•(Mat_r(A)), and HH^•(A) = HH^•(Mat_r(A)) where Mat_r(A) denotes r × r-matrices over A.” — Ginzburg Proposition 5.2.1: Hochschild homology is Morita invariant, HH(A) = HH(Mat_r(A)).

### `RT.1/external-products` — Shuffle and external products

*Construction.* For k-algebras A and A′ (k-flat), the shuffle map sh : C(A/k) ⊗_k C(A′/k) → C(A ⊗_k A′/k), (a_0⊗a)⊗(a′_0⊗a′) ↦ Σ_{(p,q)-shuffles σ} sgn(σ) (a_0a′_0)⊗σ·(a⊗a′), is a quasi-isomorphism of complexes (Eilenberg–Zilber) and is compatible with B up to the cyclic shuffle correction, giving a quasi-isomorphism of mixed complexes in the derived category. It induces the external products HH_p(A) ⊗ HH_q(A′) → HH_{p+q}(A⊗A′) and HC⁻_p(A) ⊗ HC⁻_q(A′) → HC⁻_{p+q}(A⊗A′), and makes HC(A⊗A′) a module over HC⁻; the Künneth isomorphism HH(A⊗_kA′/k) ≃ HH(A/k) ⊗^L_k HH(A′/k) holds in D(k). For commutative A, composing with multiplication A⊗A → A makes HH_*(A/k) a graded-commutative k-algebra with B a derivation.

**Hypotheses.**

- k commutative; A, A′ k-flat associative k-algebras (else replace by flat resolutions).

**Construction and proof.**

1. Construct the shuffle map from the Eilenberg–Zilber theorem for bisimplicial modules (the Hochschild complex of A⊗A′ is the diagonal of the bisimplicial module C_•(A) ⊠ C_•(A′)).
2. Prove sh is a quasi-isomorphism (Eilenberg–Zilber) and that B_{A⊗A′} ∘ sh − sh ∘ (B⊗1 + 1⊗B) is a boundary corrected by the cyclic shuffle map; this is the Künneth theorem for mixed complexes.
3. Deduce the products on HH and HC⁻; for commutative A compose with A⊗A → A, an algebra map, to get the algebra structure.
4. Equivalently: HH(−/k) is symmetric monoidal as a functor to D(k)^{BT} (RT.2/mixed-complexes-are-circle-modules), and HC⁻ = (−)^{hT} is lax symmetric monoidal.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HochschildHomology.shuffle` | data | The shuffle map C(A)⊗C(A′) → C(A⊗A′). |
| `HochschildHomology.shuffle_quasiIso` | characterisation | The shuffle map is a quasi-isomorphism of mixed complexes in D(k) for k-flat A, A′. |
| `HochschildHomology.kunneth` | equivalence | HH(A⊗_kA′/k) ≃ HH(A/k) ⊗^L_k HH(A′/k). |
| `HochschildHomology.commRing` | instance | For commutative A, HH_*(A/k) is a graded-commutative k-algebra with HH_0 = A. |
| `HochschildHomology.B_derivation` | relation | For commutative A, B is a graded derivation of HH_*(A/k). |
| `negativeCyclicHomology.externalProduct` | structure | External product on HC⁻ and the HC⁻-module structure on HC. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `HochschildHomology.kunneth_polynomial` | computation | HH_2(k[x,y]/k) is free of rank one over k[x,y] on dx∧dy. |
| `HochschildHomology.shuffle_unit` | degenerate | With A′ = k the shuffle map is the identity of C(A). |
| `HochschildHomology.commRing_compat_Kaehler` | compatibility | For commutative A, the degree-one part HH_1(A/k) ≅ Ω¹_{A/k} (Mathlib KaehlerDifferential) as A-modules, via a_0⊗a_1 ↦ a_0 da_1. |
| `HochschildHomology.noncommutative_nonexample` | non-example | For noncommutative A (A = M_2(k)), the shuffle product does not give HH_*(A) a ring structure, since multiplication A⊗A → A is not an algebra map. |

**Used by.**

- RT.1/hkr-theorem: HKR is an isomorphism of graded algebras, using the shuffle product
- RT.2/thh-symmetric-monoidal: the spectral version: THH is symmetric monoidal
- RT.3/trace-uniqueness-multiplicative: multiplicativity of the trace is with respect to these products

**Acceptance.**

- HH_*(k[x,y]/k) ≅ HH_*(k[x]/k) ⊗ HH_*(k[y]/k) = Ω^*_{k[x,y]/k} (compatible with HKR).
- For A commutative, HH_1(A) ∧ HH_1(A) → HH_2(A) sends da∧db to the class of the shuffle 1⊗a⊗b − 1⊗b⊗a.

**Depends on.** `RT.1/mixed-complex`, `RT.1/hochschild-homology`, `RT.1/cyclic-homology`, `mathlib:Module.Flat`

**Source.** ammn-20, Proof of Corollary 2.9, p. 9: “We have that THH(R) ⊗_S THH(F_p) ≃ THH(R ⊗_S F_p) which gives the identification of the third term.” — AMMN, proof of Corollary 2.9: the Künneth equivalence THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p), the spectral form of the external product.

**Source.** bms2-19, Remark 2.4 and footnote 7, p. 13: “write A ⊗_{E∞-R} T for the universal T-equivariant-E∞-R-algebra equipped with a non-equivariant map A → A ⊗_{E∞-R} T. Then one has a natural T-equivariant map A ⊗_{E∞-R} T → HH(A/R) of E∞-R-algebras by universality.” — BMS2 Remark 2.4: for commutative A, HH(A/R) is an E_∞-R-algebra (A ⊗_{E_∞-R} T), the source of the product on HH_*.

### `RT.1/base-change` — Base change and flat base change for Hochschild homology

*Theorem.* Let k → K be a map of commutative rings and A a k-algebra. Then HH((A ⊗^L_k K)/K) ≃ HH(A/k) ⊗^L_k K in D(K), naturally and compatibly with the mixed (circle) structures; hence HC⁻ and HP commute with base change along k → K when K is a perfect k-module, and HC commutes with all base change. If Tor^k_i(A, K) = 0 for i > 0 (for instance K or A flat over k), A ⊗^L_k K = A ⊗_k K and HH_*((A⊗_kK)/K) is computed by C_•(A⊗_kK/K) = C_•(A/k) ⊗_k K; if moreover K is k-flat, HH_n((A⊗_kK)/K) ≅ HH_n(A/k) ⊗_k K.

**Hypotheses.**

- k → K map of commutative rings; A a k-algebra. The underived statements need the stated Tor vanishing; flatness of K is needed for the last isomorphism on homology.

**Construction and proof.**

1. For A k-flat, C_n(A⊗_kK/K) = (A⊗_kK)^{⊗_K(n+1)} = A^{⊗_k(n+1)}⊗_kK compatibly with d_i, s_j, t_n.
2. In general replace A by a k-flat DG resolution P; P⊗_kK computes A⊗^L_kK and is K-flat.
3. For the homology statement use that −⊗_kK is exact when K is k-flat.
4. For HC⁻ and HP use that product totalisation commutes with −⊗_kK when K is perfect over k (finite limits); give the counterexample k = ℤ, K = ℚ for HP to show the hypothesis is needed.

**Acceptance.**

- HH_*(ℚ[x]/ℚ) = HH_*(ℤ[x]/ℤ) ⊗ ℚ.
- HP(ℤ/ℤ) ⊗ ℚ = ℚ[u^{±1}] = HP(ℚ/ℚ), while HP of a nontrivial mixed complex need not commute with ⊗ℚ (product totalisation).

**Depends on.** `RT.1/hochschild-homology`, `RT.1/cyclic-homology`, `mathlib:CategoryTheory.Tor`, `mathlib:Module.Flat`

**Source.** weibel-geller-91, Theorem 2.1, p. 374: “THEOREM 2.1. Let A ⊆ B be a flat extension of commutative k-algebras. Then, HH_*(A) ⊗_A B ≅ HH_*(B; B ⊗_A B).” — Weibel–Geller Theorem 2.1: flat base change for Hochschild homology of commutative algebras.

**Source.** bms2-19, Proof of Theorem 6.1, §6.1, p. 36: “Thus, it suffices to see that HH(R; Z_p)⊗^L_R R′ → HH(R′; Z_p) is an equivalence, which the HKR filtration reduces to (∧^i_R L_{R/Z_p})^∧_p ⊗^L_R R′ ≃ (∧^i_{R′} L_{R′/Z_p})^∧_p” — BMS2, proof of Theorem 6.1: derived base change HH(R) ⊗^L_R R′ ≃ HH(R′) via the HKR filtration.

### `RT.1/etale-base-change` — Étale base change (Weibel–Geller)

*Theorem.* Let k be a commutative ring and A → B an étale map of commutative k-algebras. Then the natural map B ⊗_A HH_*(A/k) → HH_*(B/k) is an isomorphism of graded B-algebras; equivalently HH(B/k) ≃ B ⊗^L_A HH(A/k) in D(B). Consequently HH(B/A) ≃ B (étale algebras have trivial relative Hochschild homology) and HH commutes with étale localisation, which is what makes HH, HC and HC⁻ Zariski and étale sheaves on affine schemes.

**Hypotheses.**

- A → B étale (Mathlib Algebra.Etale); k-flatness of A and B, or derived HH.

**Construction and proof.**

1. Show HH(B/A) ≃ B: B is flat over A and B ⊗_A B ≅ B × C as rings with the multiplication map a projection (étale ⇒ unramified ⇒ the diagonal is open and closed), so B is projective over B⊗_AB and Tor^{B⊗_AB}_{>0}(B,B) = 0.
2. Use the universal property of RT.1/hh-universal-property: for commutative A → B, HH(B/k) ⊗_{HH(A/k)} A ≃ HH(B/A) (both are the tensor of B with the circle relative to A, tensors with T commuting with pushouts of E_∞-algebras).
3. Combine: HH(B/k) ≃ HH(A/k) ⊗_{A} B, as in Weibel–Geller Theorem 0.1.

**Acceptance.**

- For B = A[1/f], HH_*(A[1/f]/k) = HH_*(A/k)[1/f].
- For a finite separable field extension L/K of characteristic 0, HH_*(L/ℚ) = L ⊗_K HH_*(K/ℚ).

**Depends on.** `RT.1/hochschild-homology`, `RT.1/hh-universal-property`, `RT.1/base-change`, `mathlib:Algebra.Etale`

**Source.** weibel-geller-91, Étale Descent Theorem (0.1), p. 368: “ÉTALE DESCENT THEOREM (0.1). Let A ⊂ B be an étale extension of commutative k-algebras. Then HH_*(B) ≅ HH_*(A) ⊗_A B.” — Weibel–Geller: Hochschild homology of an étale extension is the base change of that of the base.

### `RT.1/hkr-map` — The antisymmetrisation map and the HKR projection

*Construction.* For a commutative k-algebra A, the antisymmetrisation map ε_n : Ω^n_{A/k} → HH_n(A/k), a_0 da_1∧…∧da_n ↦ class of Σ_{σ∈S_n} sgn(σ) a_0⊗a_{σ^{−1}(1)}⊗…⊗a_{σ^{−1}(n)}, is a well-defined natural map of graded-commutative k-algebras Ω^*_{A/k} → HH_*(A/k) (with the shuffle product), where Ω^n_{A/k} = ⋀^n_A Ω¹_{A/k} is built from Mathlib's Kähler differentials and exterior powers. The map π_n : C_n(A/k) → Ω^n_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n, is a chain map (Ω^* with zero differential) and π_n ∘ ε_n = n!·id.

**Hypotheses.**

- k commutative, A commutative k-algebra (flat over k, or replace C_• by the derived HH and ε by its derived version).

**Construction and proof.**

1. Check that the antisymmetrised chain is a b-cycle and that its class is A-multilinear, alternating and a derivation in each slot, so ε_n factors through ⋀^n Ω¹ (universal property of Kähler differentials).
2. Check π ∘ b = 0, so π descends to HH_n; compute π_n ε_n = n! id.
3. Multiplicativity: ε is compatible with the shuffle product (RT.1/external-products).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `HochschildHomology.hkrMap` | data | ε : Ω^*_{A/k} → HH_*(A/k), natural in k → A. |
| `HochschildHomology.hkrMap_apply` | simp | The antisymmetrisation formula on a_0 da_1∧…∧da_n. |
| `HochschildHomology.hkrProj` | data | π : HH_*(A/k) → Ω^*_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n. |
| `HochschildHomology.hkrProj_comp_hkrMap` | relation | π_n ∘ ε_n = n! · id. |
| `HochschildHomology.hkrMap_mul` | structure | ε is a map of graded-commutative algebras. |
| `HochschildHomology.hkrMap_one` | compatibility | In degree one, ε_1 is an isomorphism with inverse π_1 (all commutative A), compatible with Mathlib's KaehlerDifferential. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `HochschildHomology.hkrMap_zero` | degenerate | ε_0 : A → HH_0(A/k) = A is the identity. |
| `HochschildHomology.hkrMap_polynomial_two` | computation | For A = k[x,y], ε_2(dx∧dy) = class of 1⊗x⊗y − 1⊗y⊗x, a generator of HH_2. |
| `HochschildHomology.hkrMap_not_surjective_singular` | non-example | For A = k[x]/(x²), ε_2 is not surjective: Ω²_{A/k} = 0 while HH_2(A/k) ≠ 0. |

**Used by.**

- RT.1/hkr-theorem: HKR asserts ε is an isomorphism for smooth A
- RT.1/b-equals-d: B ∘ ε is compared with ε ∘ d
- KTheoryFiniteLocalFields:L.5/log-thh-low-degrees: low-degree comparison of differential forms with THH

**Acceptance.**

- ε_1 : Ω¹_{A/k} → HH_1(A/k) is the inverse of a_0⊗a_1 ↦ a_0 da_1 (an isomorphism for every commutative A).
- π_n ε_n = n! shows ε_n is injective with a retraction whenever n! is invertible in k.

**Depends on.** `RT.1/hochschild-homology`, `RT.1/external-products`, `mathlib:KaehlerDifferential`, `mathlib:ExteriorAlgebra.exteriorPower`

**Source.** ginzburg-05, §9.2, p. 45: “where alt: Λ^p_k A → A^{⊗p} is the completely alternating map given by alt(a_1 ∧ ··· ∧ a_p) = Σ_{σ∈S_p} (−1)^{signσ} a_{σ(1)} ⊗ ··· ⊗ a_{σ(p)}.” — The antisymmetrisation map from differential forms to Hochschild homology and its left inverse up to n!.

### `RT.1/hkr-theorem` — The Hochschild–Kostant–Rosenberg theorem ★

*Planet:* Hochschild–Kostant–Rosenberg theorem.

*Theorem.* Let k be a commutative ring and A a smooth commutative k-algebra (Mathlib Algebra.Smooth). Then the antisymmetrisation map ε : Ω^*_{A/k} → HH_*(A/k) is an isomorphism of graded-commutative A-algebras, so HH_n(A/k) ≅ Ω^n_{A/k} for every n; since π_n ∘ ε_n = n!·id, the projection π_n is its inverse up to the factor n! (an inverse when n! is invertible in k). For k a perfect field this is HKR's theorem for regular affine algebras.

**Hypotheses.**

- A smooth over k (formally smooth and of finite presentation); in particular A is k-flat and Ω¹_{A/k} is finite projective.

**Construction and proof.**

1. Reduce to A étale over a polynomial algebra k[x_1,…,x_d] Zariski locally (Mathlib's structure theory of smooth algebras), using RT.1/etale-base-change and compatibility of both sides with localisation.
2. Compute HH of k[x_1,…,x_d] by the Koszul resolution of A over A^e = A⊗_kA (the diagonal ideal is generated by the regular sequence x_i⊗1 − 1⊗x_i), giving HH_n = ⋀^n A^d = Ω^n.
3. Identify the resulting isomorphism with ε (both are algebra maps agreeing in degree one, and HH_*(k[x_i]) is generated by degree one) — alternatively deduce from RT.1/hkr-filtration since L_{A/k} ≃ Ω¹_{A/k}[0] for smooth A (DerivedDeRhamCohomology DD.0/smooth-cotangent).

**Acceptance.**

- HH_*(k[x]/k) = k[x] ⊕ k[x]dx and HH_n(k[x]/k) = 0 for n ≥ 2.
- HH_*(k[t,t^{−1}]/k) = k[t^{±1}] ⊕ k[t^{±1}] dt/t.
- Fails for A = k[x]/(x²) (not smooth): HH_2 ≠ 0 = Ω².

**Depends on.** `RT.1/hkr-map`, `RT.1/etale-base-change`, `mathlib:Algebra.Smooth`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`

**Source.** hkr-62, Theorem 5.2, p. 395: “Let R be a regular affine K-algebra, where K is a perfect field. Then Tor^S(R, R) is naturally isomorphic with the exterior algebra E(D_R) constructed over the R-module D_R of the formal differentials, and Ext_S(R, R) is naturally isomorphic with the exterior algebra E(T_R)” — Theorem 5.2 of HKR: for a regular affine algebra over a perfect field, Hochschild homology is the module of differential forms.

**Source.** ginzburg-05, Theorem 9.1.3 (HKR), p. 44; proof §9.3, p. 46: “Theorem 9.1.3 (HKR). Let A = k[X], where X is a smooth affine variety. Then HH_k(A) = Γ(X, Λ^k T^*(X)) = Λ^k_A Ω^1_com(A) HH^k(A) = Γ(X, Λ^k T(X)) = Λ^k_A Der(A), where T(X) is the tangent bundle of X, T^*(X) is the cotangent bundle” — The HKR theorem for smooth algebras in the form ε : Ω^• ≅ HH_•.

### `RT.1/b-equals-d` — Connes' operator is the de Rham differential under HKR

*Theorem.* For a commutative k-algebra A, the antisymmetrisation map ε of RT.1/hkr-map satisfies B ∘ ε_n = ε_{n+1} ∘ d on Ω^n_{A/k} (Loday–Quillen, Proposition 2.2), where d is the de Rham differential of the algebraic de Rham complex Ω^•_{A/k} (imported from DerivedDeRhamCohomology DD.2) and B is Connes' operator; dually π_{n+1} ∘ B = (n+1)·d ∘ π_n. If ℚ ⊆ k, μ_n := π_n/n! is a map of mixed complexes (C(A/k), b, B) → (Ω^•_{A/k}, 0, d); for A smooth over k it is a quasi-isomorphism of mixed complexes (inverse ε), so C(A/k) is formal.

**Hypotheses.**

- A commutative k-algebra; for the formality statement ℚ ⊆ k and A smooth over k.

**Construction and proof.**

1. Apply the normalised formula for B to the shuffle product ε(a_0 da_1⋯da_n) = (a_0, a_1)·(1, a_2)⋯(1, a_n) (Loday–Quillen (2.3), Proposition 2.2).
2. Import d with d² = 0 and the Leibniz rule from DD.2; check π_{n+1}B = (n+1)dπ_n on generators.
3. For ℚ ⊆ k, μ = π/n! is a chain map (C, b) → (Ω, 0) intertwining B with d (Loday–Quillen (2.7)); with RT.1/hkr-theorem it is a quasi-isomorphism for smooth A.

**Acceptance.**

- For A = k[x] and n = 0: B(ε_0(x^m)) = [1⊗x^m] = m[x^{m−1}⊗x] = ε_1(d(x^m)) in HH_1(k[x]).
- For ℚ ⊆ k and A smooth, the SBI sequence becomes the de Rham sequence (RT.1/hkr-cyclic-char0).

**Depends on.** `RT.1/hkr-map`, `RT.1/connes-operator`, `RT.1/hkr-theorem`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/ordinary-differential`

**Source.** loday-quillen-84, Proposition 2.2 and proof, pp. 572-573: “PROPOSITION 2.2. One has a commutative square Ω^n_A →(γ) H_n(A), d ↓, ↓ B, Ω^{n+1}_A →(γ) H_{n+1}(A) where d is the exterior derivative on forms.” — Loday–Quillen Proposition 2.2 and (2.7): B∘γ = γ∘d for the antisymmetrisation γ, and μ = π/n! intertwines B with d.

### `RT.1/hkr-cyclic-char0` — Cyclic homology of smooth algebras in characteristic zero

*Theorem.* Let k be a commutative ℚ-algebra and A a smooth commutative k-algebra. Then HC_n(A/k) ≅ Ω^n_{A/k}/dΩ^{n−1}_{A/k} ⊕ H^{n−2}_{dR}(A/k) ⊕ H^{n−4}_{dR}(A/k) ⊕ …, HC⁻_n(A/k) ≅ Z^n Ω_{A/k} × Π_{i≥1} H^{n+2i}_{dR}(A/k), and HP_n(A/k) ≅ Π_{i∈ℤ} H^{n+2i}_{dR}(A/k), naturally in A, where H^*_{dR} is the cohomology of the algebraic de Rham complex (DD.2) and Z^nΩ the closed forms. Under these isomorphisms S, I, B of the SBI sequence become the evident projections, inclusions and d.

**Hypotheses.**

- ℚ ⊆ k; A smooth over k (for non-smooth A over a ℚ-algebra, HP is the derived/Hartshorne de Rham cohomology (Feigin–Tsygan) and is not recorded here).

**Construction and proof.**

1. By RT.1/b-equals-d the mixed complex C(A/k) is quasi-isomorphic to (Ω^*, 0, d).
2. Compute CC, CC⁻, CP of (Ω^*, 0, d) directly: CC(Ω, 0, d) in degree n is ⊕_{i≥0} Ω^{n−2i} with differential u·d, whose homology is as stated (truncation at i = 0 gives Ω^n/dΩ^{n−1}).
3. Apply RT.1/cyclic-homology (quasi-isomorphisms of mixed complexes preserve HC, HC⁻, HP).

**Acceptance.**

- HC_n(ℚ[x]/ℚ) = HC_n(ℚ/ℚ) for n ≥ 1, HC_0 = ℚ[x]; HP_*(ℚ[x]/ℚ) = HP_*(ℚ/ℚ) (homotopy invariance of de Rham cohomology).
- HP_0(ℚ[t^{±1}]/ℚ) = ℚ and HP_1 = ℚ (from H^1_dR spanned by dt/t).

**Depends on.** `RT.1/b-equals-d`, `RT.1/cyclic-homology`, `RT.1/sbi-sequence`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`

**Source.** loday-quillen-84, Theorem 2.9, pp. 574-575: “THEOREM 2.9. If k contains Q and if A is smooth over k, then there is a canonical isomorphism ⊕_i μ_{n,i}: HC_n(A) = Ω^n_A/dΩ^{n−1}_A ⊕ H^{n−2}_DR(A) ⊕ H^{n−4}_DR(A) ⊕ ··· .” — Cyclic and periodic cyclic homology of smooth algebras in characteristic 0 in terms of de Rham cohomology.

### `RT.1/hkr-filtration` — The derived HKR filtration ★

*Planet:* Derived HKR filtration.

*Theorem.* Let R → A be a map of commutative rings. Then HH(A/R) carries a natural exhaustive, increasing, multiplicative filtration Fil^{HKR}_n HH(A/R) (n ≥ 0), T-equivariant for the trivial action on the graded pieces, with gr_n ≃ ∧^n L_{A/R}[n], where L_{A/R} is the cotangent complex and ∧^n its derived exterior power (DerivedDeRhamCohomology DD.0). It is the left Kan extension, from polynomial R-algebras, of the Postnikov filtration τ_{≤n} (which by HKR has gr_n = Ω^n[n]). For A smooth over R it recovers HKR. If p is fixed and R → A is p-completely quasismooth (L_{A/R}^∧_p a p-completely flat A^∧_p-module in degree 0), then the p-completion HH(A/R)^∧_p has graded pieces (Ω^n_{A/R})^∧_p[n].

**Hypotheses.**

- R → A any map of commutative rings (derived HH); the p-complete statement needs p-complete quasismoothness as in BMS2 Remark 4.14.

**Construction and proof.**

1. On polynomial R-algebras P, the Postnikov filtration τ_{≤n}HH(P/R) has gr_n ≃ Ω^n_{P/R}[n] by RT.1/hkr-theorem.
2. Left Kan extend along polynomial algebras → animated rings (EnhancedDerivedSheaves E5:animation); HH(−/R) commutes with sifted colimits, so the filtration is exhaustive and its graded pieces are the left Kan extensions of Ω^n[n], i.e. ∧^n L_{A/R}[n] (DD.0 derived exterior powers of the cotangent complex).
3. Multiplicativity and T-equivariance: the Postnikov filtration on polynomial algebras is multiplicative and the circle acts trivially on τ-graded pieces.
4. p-complete quasismooth case: ∧^n L^∧_p ≃ (Ω^n)^∧_p in degree 0 by BMS2 Remark 4.14.

**Acceptance.**

- For A = 𝔽_p over R = ℤ: L_{𝔽_p/ℤ} ≃ 𝔽_p[1], so gr_n = ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] = 𝔽_p[2n] (used in RT.1/hh-of-fp).
- For A smooth over R the filtration splits only rationally; integrally it is the Postnikov filtration.

**Depends on.** `RT.1/hkr-theorem`, `RT.1/hochschild-homology`, `DerivedDeRhamCohomology:DD.0/cotangent-complex`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`

**Source.** nikolaus-scholze-18, Chapter IV, §IV.4, Proposition IV.4.1, Acta p. 356 (the text layer garbles '∧^i_A L_{A/Z}' and splits 'descending'): “Proposition IV.4.1. Let A be a commutative and unital ring. There is a descendVi ing separated filtration of HH(A) with graded pieces given by ( A LA/Z )[i], where LA/Z denotes the cotangent complex, and the exterior power is derived.” — NS18 Proposition IV.4.1: the HKR filtration on HH(A/R) for every commutative ring map, with graded pieces ∧^i L_{A/R}[i].

**Source.** bms2-19, §2.2, last paragraph, p. 14: “Hence by left Kan extension of the Postnikov filtration, it follows that the functor HH(−/R) on sCAlg_R comes equipped with a T-equivariant complete descending N-indexed filtration Fil^n_HKR with gr^i_HKR HH(−/R) ≃ ∧^i L_{−/R}[i] (with the trivial T-action).” — BMS2 §2.2: the HKR filtration by left Kan extension of the Postnikov filtration, and its p-complete quasismooth form (Remark 4.14).

### `RT.1/hh-universal-property` — Hochschild homology of a commutative ring is its tensor with the circle

*Theorem.* For a map of commutative rings R → A, HH(A/R) with its circle action is the free T-equivariant E_∞-R-algebra on A: HH(A/R) ≃ A ⊗_{R} T := colim_{T} A in CAlg(D(R)) (tensoring the E_∞-R-algebra A with the space T = S¹), and for every E_∞-R-algebra B with T-action, maps HH(A/R) → B of T-equivariant E_∞-algebras correspond to maps A → B of E_∞-R-algebras. In particular HH(A/R) ≃ A ⊗^L_{A⊗^L_RA} A as E_∞-algebras.

**Hypotheses.**

- R → A map of commutative rings (or animated rings); E_∞-algebras in D(R) from EnhancedDerivedSheaves E5:abstract.

**Construction and proof.**

1. T is the pushout ∗ ⊔_{∗⊔∗} ∗ (two arcs glued along their endpoints), so A ⊗ T ≃ A ⊗_{A⊗A} A (tensoring an E_∞-algebra with spaces turns colimits of spaces into colimits of E_∞-algebras).
2. The cyclic bar construction is the simplicial model of T (the simplicial circle Δ¹/∂Δ¹ has n+1 simplices in degree n), so |C_•(A/R)| ≃ A ⊗ T compatibly with the T-action (NS18 Proposition B.5 type argument, or BMS2 Remark 2.4).
3. The adjunction (A ↦ A ⊗ T) ⊣ (forget the T-action) gives the universal property.

**Acceptance.**

- HH(R/R) = R ⊗ T = R.
- HH(R[x]/R) = R[x] ⊗ T has π_* = R[x] ⊕ R[x]dx (consistent with HKR).

**Depends on.** `RT.1/hochschild-homology`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`

**Source.** bms2-19, Remark 2.4 and footnote 7, p. 13: “write A ⊗_{E∞-R} T for the universal T-equivariant-E∞-R-algebra equipped with a non-equivariant map A → A ⊗_{E∞-R} T. Then one has a natural T-equivariant map A ⊗_{E∞-R} T → HH(A/R) of E∞-R-algebras by universality.” — BMS2 Remark 2.4: HH(A/R) is the initial E_∞-R-algebra with T-action receiving A, i.e. A ⊗ T.

### `RT.1/hh-of-fp` — Hochschild homology of 𝔽_p over ℤ

*Theorem.* HH_*(𝔽_p/ℤ) ≅ 𝔽_p⟨u⟩, the divided power algebra over 𝔽_p on a class u of degree 2 (Mathlib DividedPowerAlgebra of 𝔽_p in degree 2): HH_{2n}(𝔽_p/ℤ) = 𝔽_p·u^{[n]}, HH_{odd} = 0. The first HKR quotient Fil_1 HH(𝔽_p/ℤ) is an extension of 𝔽_p by L_{𝔽_p/ℤ}[1] ≃ 𝔽_p[2] whose class corresponds, under the identification of the circle derivation, to the extension ℤ/p² of 𝔽_p by 𝔽_p (NS18 Lemma IV.4.7).

**Hypotheses.**

- Derived HH over ℤ (𝔽_p is not ℤ-flat).

**Construction and proof.**

1. L_{𝔽_p/ℤ} ≃ 𝔽_p[1] (𝔽_p = ℤ/p is a quotient by a nonzerodivisor; DD.0 regular quotients).
2. RT.1/hkr-filtration gives gr_n ≃ ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] (décalage: ∧^n(M[1]) ≃ Γ^n(M)[n]); so HH_{2n} is one-dimensional and HH_odd = 0, and the spectral sequence degenerates for degree reasons.
3. Identify the multiplicative structure with the divided power algebra: the shuffle product of u with itself is n!·u^{[n]} (NS18 Proposition IV.4.3).
4. Identify the first extension with ℤ/p² via the Bockstein (NS18 Lemma IV.4.7).

**Acceptance.**

- HH_2(𝔽_p/ℤ) = 𝔽_p and u^p = 0 in HH_*(𝔽_p/ℤ) (divided powers, not a polynomial algebra).
- Rationally nothing survives: HH(𝔽_p/ℤ) ⊗ ℚ = 0.

**Depends on.** `RT.1/hkr-filtration`, `RT.1/external-products`, `mathlib:DividedPowerAlgebra`, `DerivedDeRhamCohomology:DD.0/regular-quotient-cotangent`

**Source.** nikolaus-scholze-18, Chapter IV, §IV.4, Proposition IV.4.3, Acta p. 357 (preceded on p. 356 by the computation of ∧^i L_{F_p/Z_p}); excerpt is the second sentence of the proposition: “Let u∈H2 HH(Fp ) denote the canonical generator. Then, H∗ HH(Fp ) is isomorphic to the divided power algebra in u over Fp .” — NS18 Proposition IV.4.3: HH(𝔽_p/ℤ) is a divided power algebra on a degree-two class.

**Source.** nikolaus-scholze-18, Chapter IV, §IV.4, Lemma IV.4.7, Acta p. 359 (proof p. 359; used in Proposition IV.4.6, p. 358): “Lemma IV.4.7. The image of p∈π0 THH(HFp )hT in H 2 (BT, π2 THH(HFp )) is given by uv.” — NS18 Lemma IV.4.7: the first HKR quotient and the extension ℤ/p².

## RT.2. THH, circle actions and cyclotomic structure

THH of an E₁-ring is the realisation of its cyclic bar construction in spectra, and the cyclic
structure is exactly what gives a circle action. The Tate diagonal, which exists for spectra and not
in D(ℤ), gives the cyclotomic Frobenius THH(A) → THH(A)^{tC_p}. A cyclotomic spectrum is a
T-spectrum with such Frobenius maps, TC is the mapping spectrum from the cyclotomic sphere, and for
bounded-below inputs TC is the fibre of φ − can : TC⁻ → TP^∧. The Tate orbit lemma is the key input
that makes the modern definition agree with the classical genuine-equivariant TR/TC of
Bökstedt–Hsiang–Madsen; that comparison, which local K-theory calculations (KTheoryFiniteLocalFields
L.4) use with the Hesselholt–Madsen conventions R, F, V, is planned in full here. Mixed complexes are
complexes with circle action, so HC, HC⁻ and HP of RT.1 are the orbits, fixed points and Tate
construction of HH.

**Planets.** Topological Hochschild homology, Cyclotomic spectra, Topological cyclic homology, Nikolaus–Scholze formula for TC, TR and genuine TC, Genuine and modern TC agree.

**Within this roadmap it uses** RT.1.

**From other roadmaps and the libraries it uses** `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:abstract/infinity-operad`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:spectra-comparison`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`, `StableHomotopyKTheory:H.5:spectra/naive-homotopy-groups`, `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/ring-spectrum`, `StableHomotopyKTheory:H.5:spectra/smash-product`, `StableHomotopyKTheory:H.5:spectra/stable-model-structure`, `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, `StableHomotopyKTheory:H.6/arithmetic-fracture-square`, `StableHomotopyKTheory:H.6/p-completion`, `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`, `mathlib:tateCohomology`, `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven`.

**Acceptance tests of the layer.** Each node below lists its acceptance properties; the layer is accepted when every node's acceptance list and every unit test holds.

### `RT.2/spectra-with-action` — Spectra with an action of a group

*Definition.* For a topological group (or E_1-group in spaces) G with classifying space BG, the ∞-category of spectra with G-action is Sp^{BG} := Fun(BG, Sp), where Sp is the presentably symmetric monoidal stable ∞-category of spectra (the underlying ∞-category of symmetric spectra with the smash product, StableHomotopyKTheory H.5:spectra compared with EnhancedDerivedSheaves E5 by E5:spectra-comparison). It is presentable, stable and symmetric monoidal pointwise. For a closed normal subgroup H ⊆ G, restriction gives Sp^{BG} → Sp^{BH}, and the functors −^{hH}, −_{hH} (RT.2/homotopy-orbits-fixed-points) land in Sp^{B(G/H)}. For G = T = S¹ and H = C_n the identification T/C_n ≅ T by z ↦ z^n is fixed once and for all and used to regard residual actions as T-actions.

**Hypotheses.**

- G a topological group; BG its classifying Kan complex; Sp the stable ∞-category of spectra.

**Construction and proof.**

1. Form the functor ∞-category Fun(BG, Sp) (limits and colimits pointwise, EnhancedDerivedSheaves E0).
2. Identify it with homotopy fixed points of the trivial G-action on Sp (EnhancedDerivedSheaves E5:presentability/coherent-group-actions); stability and presentability are inherited.
3. Construct restriction along H → G and the residual (G/H)-action on fixed points/orbits by right/left Kan extension along BG → B(G/H) (EnhancedDerivedSheaves E3).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `SpectraWithAction` | data | Sp^{BG} = Fun(BG, Sp) for a topological group G. |
| `SpectraWithAction.res` | functoriality | Restriction along a group homomorphism H → G, with res_id and res_comp. |
| `SpectraWithAction.trivial` | constructor | The trivial action functor Sp → Sp^{BG}, left and right adjoint to −_{hG} and −^{hG} respectively. |
| `SpectraWithAction.instStable` | instance | Sp^{BG} is a presentable stable ∞-category; fibres and cofibres are computed underlying. |
| `SpectraWithAction.circleQuotient` | equivalence | The identification T/C_n ≅ T, z ↦ z^n, inducing Sp^{B(T/C_n)} ≃ Sp^{BT}. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `SpectraWithAction.trivialGroup` | degenerate | For G = 1, Sp^{BG} ≃ Sp. |
| `SpectraWithAction.underlying_conservative` | characterisation | A map in Sp^{BG} is an equivalence iff its underlying map of spectra is. |
| `SpectraWithAction.discrete_vs_continuous` | non-example | For G = T, Sp^{BT} is not Sp^{BT^δ} for the discrete circle: T acts trivially up to homotopy on π_* of every object of Sp^{BT} since T is connected, whereas T^δ can act nontrivially. |

**Used by.**

- RT.2/homotopy-orbits-fixed-points: orbits and fixed points are colimits and limits over BG
- RT.2/thh-e1-ring: THH(A) ∈ Sp^{BT}
- RT.2/cyclotomic-spectrum: a cyclotomic spectrum is an object of Sp^{BT} with Frobenius maps

**Acceptance.**

- For G trivial, Sp^{BG} = Sp.
- For a commutative ring k, D(k)^{BT} is computed by mixed complexes (RT.2/mixed-complexes-are-circle-modules).

**Depends on.** `StableHomotopyKTheory:H.5:spectra`, `EnhancedDerivedSheaves:E5:spectra-comparison`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Source.** nikolaus-scholze-18, Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'): “Definition I.1.13. Let C be a stable ∞-category which admits all limits and colimits indexed by BG for some finite group G. The Tate construction is the functor” — NS18 §I.1 works in Sp^{BG} = Fun(BG, Sp) and defines the Tate construction there.

### `RT.2/homotopy-orbits-fixed-points` — Homotopy orbits and homotopy fixed points

*Construction.* For X ∈ Sp^{BG}, the homotopy orbits X_{hG} := colim_{BG} X and homotopy fixed points X^{hG} := lim_{BG} X; −_{hG} and −^{hG} are left and right adjoint to the trivial-action functor Sp → Sp^{BG}. For H ⊆ G normal they refine to functors Sp^{BG} → Sp^{B(G/H)}. They are exact, −_{hG} preserves colimits and −^{hG} limits; −^{hG} is lax symmetric monoidal. For an abelian group M with G-action, π_{−i}(HM^{hG}) = H^i(G, M) and π_i(HM_{hG}) = H_i(G, M).

**Hypotheses.**

- G a topological group; X ∈ Sp^{BG}.

**Construction and proof.**

1. Define by Kan extension along BG → ∗ (residual versions along BG → B(G/H)).
2. Adjunctions and exactness are formal (EnhancedDerivedSheaves E0/E3); lax monoidality of the right adjoint of a symmetric monoidal functor.
3. Identify homotopy groups for Eilenberg–Mac Lane spectra with group (co)homology via the bar resolution (Mathlib groupCohomology for discrete G).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `homotopyOrbits` | data | −_{hG} : Sp^{BG} → Sp (and residual Sp^{BG} → Sp^{B(G/H)}). |
| `homotopyFixedPoints` | data | −^{hG} : Sp^{BG} → Sp (and residual). |
| `homotopyOrbits.adj` | universal-property | −_{hG} ⊣ triv ⊣ −^{hG}. |
| `homotopyFixedPoints.laxMonoidal` | structure | −^{hG} is lax symmetric monoidal; X^{hG} is an E_∞-ring if X is an E_∞-ring with G-action. |
| `homotopyFixedPoints.trans` | relation | (X^{hH})^{h(G/H)} ≃ X^{hG} for H normal (transitivity), and dually for orbits. |
| `homotopyFixedPoints.em` | compatibility | π_{−i}(HM^{hG}) ≅ H^i(G, M) for a discrete group G and G-module M (Mathlib groupCohomology). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `homotopyFixedPoints.trivialGroup` | degenerate | For G trivial, X^{hG} = X_{hG} = X. |
| `homotopyFixedPoints.HZ_circle` | computation | π_*((HZ)^{hT}) = ℤ[t] with \|t\| = −2. |
| `homotopyFixedPoints.not_genuine` | non-example | S^{hC_2} is not the genuine fixed points S^{C_2}: π_0S^{C_2} is the Burnside ring A(C_2) ≅ ℤ², while by the Segal conjecture π_0S^{hC_2} is its completion at the augmentation ideal, ℤ ⊕ ℤ_2. |

**Used by.**

- RT.2/norm-map-tate: the Tate construction is the cofibre of the norm X_{hG} → X^{hG}
- RT.2/tc-minus-and-tp: TC⁻ = THH^{hT}
- KTheoryFiniteLocalFields:L.1/fpsi: homotopy fixed points of the Adams operation

**Acceptance.**

- (HZ)^{hT} has π_* = ℤ[t], |t| = −2; (HZ)_{hT} has π_{2i} = ℤ for i ≥ 0.
- (S)^{hC_2} and (S)_{hC_2} are the stable cohomotopy and homotopy of ℝP^∞_+.

**Depends on.** `RT.2/spectra-with-action`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`

**Source.** nikolaus-scholze-18, Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'): “Definition I.1.13. Let C be a stable ∞-category which admits all limits and colimits indexed by BG for some finite group G. The Tate construction is the functor” — NS18 §I.1 uses −_{hG} and −^{hG} as colimit and limit over BG.

### `RT.2/norm-map-tate` — The norm map and the Tate construction

*Construction.* For a finite group G there is a natural transformation Nm_G : X_{hG} → X^{hG} of functors Sp^{BG} → Sp (characterised as the universal colimit-preserving functor over −^{hG}, or by the explicit norm on induced objects), and the Tate construction is X^{tG} := cofib(Nm_G : X_{hG} → X^{hG}). This gives the natural fibre sequence X_{hG} → X^{hG} → X^{tG}. For H ⊆ G normal there are residual versions Sp^{BG} → Sp^{B(G/H)}.

**Hypotheses.**

- G finite (for G = T see RT.2/circle-tate).

**Construction and proof.**

1. Construct Nm_G as in NS18 §I.1: for X = ⊕_{g∈G} Y induced, X_{hG} ≃ Y ≃ X^{hG}; extend by the universal property (the colimit-preserving approximation of −^{hG}).
2. Define X^{tG} as the cofibre; exactness of −^{tG} follows.
3. Residual versions by the same construction over B(G/H).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `normMap` | data | Nm_G : X_{hG} → X^{hG}, natural in X ∈ Sp^{BG}. |
| `tateConstruction` | constructor | X^{tG} := cofib(Nm_G), with the fibre sequence X_{hG} → X^{hG} → X^{tG}. |
| `tateConstruction.exact` | structure | −^{tG} : Sp^{BG} → Sp is an exact functor. |
| `tateConstruction.residual` | functoriality | Residual Tate −^{tH} : Sp^{BG} → Sp^{B(G/H)} for H normal finite. |
| `normMap.induced` | characterisation | On induced objects ⊕_{g∈G} Y the norm is an equivalence. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `tateConstruction.trivialGroup` | degenerate | For G trivial, Nm is the identity and X^{tG} = 0. |
| `tateConstruction.HZ_Cp` | computation | π_*(HZ^{tC_p}) ≅ 𝔽_p[t^{±1}], \|t\| = −2. |
| `tateConstruction.compat_mathlib` | compatibility | For a finite group G and a ℤ[G]-module M, π_{−i}(HM^{tG}) ≅ Ĥ^i(G, M), Mathlib's tateCohomology. |
| `tateConstruction.nonexample_Q` | non-example | (HQ)^{tG} = 0 for every finite G although (HQ)^{hG} = HQ ≠ 0: Tate is not fixed points. |

**Used by.**

- RT.2/cyclotomic-spectrum: the Frobenius maps land in X^{tC_p}
- KTheoryFiniteLocalFields:L.4/norm-restriction-cofibre-sequence: the norm–restriction sequence maps to the Tate cofibre sequence
- KTheoryFiniteLocalFields:L.1/finite-even-tate-k-groups: C_2-Tate constructions in hermitian K-theory

**Acceptance.**

- For induced X, X^{tG} ≃ 0 (RT.2/tate-vanishing-induced).
- π_*(HZ^{tC_p}) = 𝔽_p[t^{±1}] with |t| = −2 (RT.2/tate-of-eilenberg-maclane).

**Depends on.** `RT.2/homotopy-orbits-fixed-points`

**Source.** nikolaus-scholze-18, Chapter I, §I.1: Construction I.1.7 and Lemmas I.1.8–I.1.9 (Acta p. 216), Definition I.1.10, Examples I.1.11–I.1.12 (Acta p. 217); excerpt is Example I.1.11 (text layer drops the arrow in 'f : BG → ∗'): “Example I.1.11. Let C be a preadditive ∞-category which admits limits and colimits indexed by BG for some finite group G. Applying the previous definition in the special case of the projection f : BG ∗, we get a natural transformation” — NS18 §I.1 constructs the norm map for finite groups.

**Source.** nikolaus-scholze-18, Chapter I, §I.1, Definition I.1.13, Acta p. 218 (the displayed formula X ↦ cofib(Nm_G: X_hG → X^hG) is garbled in the text layer; the same definition is stated in running text on p. 213: 'we can define the Tate construction X tG =cofib(NmG : XhG X hG )'): “Definition I.1.13. Let C be a stable ∞-category which admits all limits and colimits indexed by BG for some finite group G. The Tate construction is the functor” — NS18 §I.1 defines X^{tG} as the cofibre of the norm.

### `RT.2/tate-of-eilenberg-maclane` — Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology

*Theorem.* For a finite group G and a G-module M (an abelian group with G-action), π_i(HM^{tG}) ≅ Ĥ^{−i}(G, M) naturally in M, where Ĥ is Tate cohomology (Mathlib tateCohomology, built from the norm map). For G = C_n cyclic, Ĥ^* is 2-periodic (Tau Ceti Rep.FiniteCyclicGroup.tateCohomologyIsoEven) and π_*(HZ^{tC_n}) ≅ ℤ/n[t^{±1}], |t| = −2.

**Hypotheses.**

- G finite; M a ℤ[G]-module.

**Construction and proof.**

1. Compute HM_{hG} and HM^{hG} by the bar resolution: group homology and cohomology.
2. Identify the norm map on homotopy with the norm used to splice the complete resolution; the long exact sequence identifies π_*HM^{tG} with the homology of the Tate complex.
3. Compare with Mathlib's Tate complex (built from the same norm) and Tau Ceti's periodicity for cyclic groups.

**Acceptance.**

- π_*(HZ^{tC_2}) = 𝔽_2[t^{±1}]: π_even = ℤ/2, π_odd = 0 (the input requested by the hermitian applications of KTheoryFiniteLocalFields).
- π_0(HM^{tG}) = M^G/Nm(M) = Ĥ^0(G, M).

**Depends on.** `RT.2/norm-map-tate`, `mathlib:tateCohomology`, `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`

**Source.** nikolaus-scholze-18, Chapter I, §I.1, unnumbered paragraph immediately after Definition I.1.13, Acta p. 218 (the formula π_i(HM^{tG}) ≅ Ĥ^{−i}(G,M) is garbled in the text layer): “If one takes the Tate spectrum of an Eilenberg–MacLane spectrum HM for a Gmodule M , then one gets back classical Tate cohomology” — NS18 §I.1: π_i of HM^{tG} is Tate cohomology Ĥ^{−i}(G, M).

### `RT.2/tate-vanishing-induced` — Tate constructions vanish on induced objects

*Theorem.* Let G be finite and Sp^{BG}_{ind} ⊆ Sp^{BG} the stable subcategory generated by induced spectra ⊕_{g∈G} Y. Then (i) X^{tG} ≃ 0 for X ∈ Sp^{BG}_{ind}; (ii) Sp^{BG}_{ind} is a ⊗-ideal; (iii) −^{tG} is the universal exact functor under −^{hG} killing Sp^{BG}_{ind}, so it factors through the Verdier quotient Sp^{BG}/Sp^{BG}_{ind}. For a ring spectrum R and G = C_p, End of R in the Verdier quotient Fun(BC_p, Perf(R))/Perf(R[C_p]) is R^{tC_p} (the identification used by Land–Mathew–Meier–Tamme, Remark 3.9).

**Hypotheses.**

- G finite; R a ring spectrum for the last statement.

**Construction and proof.**

1. Norm is an equivalence on induced objects (RT.2/norm-map-tate), so Tate vanishes there; ideal property from Y ⊗ (⊕_g Z) ≃ ⊕_g (Y⊗Z) with diagonal action.
2. NS18 Lemma I.3.8(iii): X^{tG} ≃ colim over induced objects mapping to X of cofib(Y → X)^{hG}.
3. Hence −^{tG} inverts maps with induced fibre and factors through the Verdier quotient; End of the unit there is computed by (iii).

**Acceptance.**

- R[C_p] = R ⊗ Σ^∞_+C_p is induced, so (R[C_p])^{tC_p} = 0.
- For R = HZ: End of HZ in Fun(BC_p, Perf(ℤ))/Perf(ℤ[C_p]) has π_0 = ℤ/p.

**Depends on.** `RT.2/norm-map-tate`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`

**Source.** nikolaus-scholze-18, Chapter I, §I.3: Theorem I.3.6 (Acta p. 230), Definition I.3.7 and Lemma I.3.8 (Acta p. 231; proof p. 232-233), and the factorization statement in the proof of Theorem I.3.1 (Acta p. 233); excerpt from arXiv v2 p. 25 (proof of Theorem I.3.1), since the Acta text layer garbles Definition I.3.7, Lemma I.3.8 and this sentence: “Thus, by Lemma I.3.8 (i) and Theorem I.3.3 (i), −tG factors over a functor which we still denote −tG : C/D → Sp.” — NS18 Definition I.3.7 and Lemma I.3.8: induced spectra, their Tate vanishing and the description of −^{tG}.

**Source.** lmmt-24, §3, Remark 3.9, pp. 15-16: “For the second, one uses that the Verdier quotient Fun(BCp, Perf(L^p,f_n S))/Perf(L^p,f_n S[Cp]) is linear over (L^p,f_n S)^tCp. Indeed, calling this quotient Q and writing R = L^p,f_n S, Theorem I.3.3ii and an analogue of Lemma I.3.8iii from [NS18] imply that EndQ(R) ≃ R^tCp.” — LMMT Remark 3.9: the Verdier quotient Fun(BC_p, Perf(R))/Perf(R[C_p]) is linear over R^{tC_p}.

### `RT.2/tate-multiplicativity` — Multiplicativity of the Tate construction

*Theorem.* For a finite group G, the space of pairs (a lax symmetric monoidal structure on −^{tG} : Sp^{BG} → Sp, a lax symmetric monoidal refinement of −^{hG} → −^{tG}) is contractible. For G a finite normal subgroup of a topological group H, the residual −^{tG} : Sp^{BH} → Sp^{B(H/G)} is lax symmetric monoidal compatibly; in particular −^{tC_p} : Sp^{BT} → Sp^{B(T/C_p)} ≃ Sp^{BT} is lax symmetric monoidal, so X^{tC_p} is an E_∞-ring with T-action when X is.

**Hypotheses.**

- G finite; for the residual statement G ⊴ H closed, H a topological group.

**Construction and proof.**

1. Lax symmetric monoidal functors killing a ⊗-ideal factor uniquely through the symmetric monoidal Verdier quotient (RT.2/tate-vanishing-induced; NS18 Theorem I.3.1).
2. −^{hG} is lax symmetric monoidal (RT.2/homotopy-orbits-fixed-points); its localisation away from the ideal is −^{tG}.
3. Residual version by working in Sp^{BH} (NS18 Corollary I.3.9).

**Acceptance.**

- HZ^{tC_p} is an E_∞-ring with π_* = 𝔽_p[t^{±1}] as a graded ring.
- The canonical map X^{hC_p} → X^{tC_p} is a map of E_∞-rings for X an E_∞-ring with C_p-action.

**Depends on.** `RT.2/tate-vanishing-induced`, `RT.2/homotopy-orbits-fixed-points`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`

**Source.** nikolaus-scholze-18, Chapter I, §I.3, Theorem I.3.1, Acta p. 225; proof on p. 233 (text layer drops the arrow in '−hG → −tG'): “Theorem I.3.1. The space consisting of all pairs of a lax symmetric monoidal structure on the functor −tG together with a lax symmetric monoidal refinement of the natural transformation −hG −tG is contractible.” — NS18 Theorem I.3.1: the lax symmetric monoidal structure on −^{tG} is unique.

**Source.** nikolaus-scholze-18, Chapter I, §I.3, Corollary I.3.9, Acta p. 233; proof p. 234 (text layer drops arrows): “Corollary I.3.9. Let G be a finite group, and assume that G is a normal subgroup of a (topological ) group H. The functor −tG : SpBH SpB(H/G) admits a natural lax symmetric monoidal structure” — NS18 Corollary I.3.9: the residual Tate construction is lax symmetric monoidal.

### `RT.2/tate-p-local-properties` — Tate constructions at C_p: convergence, vanishing and p-completeness

*Theorem.* For a finite group G and Y ∈ Sp^{BG}: (i) Y^{hG} → lim_n (τ_{≤n}Y)^{hG}, and likewise for −_{hG} and −^{tG}, are equivalences, and colim_n (τ_{≥−n}Y)^{tG} → Y^{tG} is an equivalence (and likewise for −^{hG}, −_{hG}); (ii) if p acts invertibly on π_*Y for Y ∈ Sp^{BC_p}, then Y^{tC_p} ≃ 0; (iii) if X ∈ Sp^{BC_p} is bounded below, X^{tC_p} is p-complete and X^{tC_p} ≃ (X^∧_p)^{tC_p}.

**Hypotheses.**

- G finite; for (iii) X bounded below.

**Construction and proof.**

1. (i): NS18 Lemma I.2.6 — Postnikov towers converge and −^{hG}, −_{hG} commute with the relevant limits/colimits by connectivity of the homotopy-orbit spectral sequences.
2. (ii): by (i) reduce to Eilenberg–Mac Lane spectra HM with p invertible on M; their Tate spectra have π_* = Ĥ^{−*}(C_p; M), which is killed by p and on which p is invertible, hence zero (NS18 Lemma I.2.8).
3. (iii): reduce to Eilenberg–Mac Lane pieces using (i); each (HM)^{tC_p} is p-torsion by RT.2/tate-of-eilenberg-maclane (NS18 Lemma I.2.9); p-completion via StableHomotopyKTheory H.6.

**Acceptance.**

- (HQ)^{tC_p} = 0 by (ii).
- S^{tC_p} ≃ S^∧_p (Segal conjecture for C_p; NS18 Example II.1.2(ii)), consistent with (iii).

**Depends on.** `RT.2/norm-map-tate`, `RT.2/tate-of-eilenberg-maclane`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.6/p-completion`

**Source.** nikolaus-scholze-18, Chapter I, §I.2, Lemma I.2.6, Acta p. 222; excerpt from arXiv v2 p. 17 (in both text layers the displayed maps are partly displaced; the Y^{tG} → lim_n(τ_{≤n}Y)^{tG} map of part (i) is not captured in the excerpt): “Lemma I.2.6. Let Y be a spectrum with G-action for some finite group G. (i) The natural maps Y hG → limn (τ≤n Y )hG , YhG → limn (τ≤n Y )hG , are equivalences.” — NS18 Lemma I.2.6: Postnikov convergence for orbits, fixed points and Tate.

**Source.** nikolaus-scholze-18, Chapter I, §I.2, Lemma I.2.8, Acta p. 223: “Lemma I.2.8. Let Y be a spectrum with Cp -action such that multiplication by p is an isomorphism on πi Y for all i∈Z. Then, Y tCp ≃0.” — NS18 Lemma I.2.8: Tate vanishes when p is invertible.

**Source.** nikolaus-scholze-18, Chapter I, §I.2, Lemma I.2.9, Acta p. 224; excerpt from arXiv v2 p. 18 (the Acta text layer moves the symbol X^{tC_p} out of the sentence): “Lemma I.2.9. Let X be a spectrum with Cp -action which is bounded below. Then X tCp is p-complete and equivalent to (Xp∧ )tCp .” — NS18 Lemma I.2.9: Tate spectra of bounded below spectra are p-complete.

### `RT.2/tate-orbit-lemma` — The Tate orbit lemma

*Theorem.* Let X ∈ Sp^{BC_{p²}} be bounded below. Then (X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

**Hypotheses.**

- X bounded below; C_p ⊂ C_{p²} the subgroup of order p.

**Construction and proof.**

1. By RT.2/tate-p-local-properties (i) reduce to X bounded (Postnikov), then to X = HM an Eilenberg–Mac Lane spectrum with C_{p²}-action.
2. For HM, compute via the lemma that HF_p with trivial action has (τ_{[2i,2i+1]}(HF_p)_{hC_p})^{t(C_{p²}/C_p)} ≃ 0, the two-stage Postnikov piece being a nonsplit extension whose Tate construction vanishes (NS18 Lemmas I.2.4, I.2.5, I.2.7).
3. Conclude by dévissage over Postnikov pieces and filtered colimits (NS18 Lemma I.2.1).

**Acceptance.**

- For X = HZ with trivial action the lemma says ((HZ)_{hC_p})^{tC_p} = 0, although (HZ)^{tC_p} ≠ 0.
- The hypothesis is needed: KU with trivial C_{p²}-action does not satisfy the conclusion (NS18 Example I.2.3(iii)).

**Depends on.** `RT.2/tate-p-local-properties`, `RT.2/tate-of-eilenberg-maclane`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`

**Source.** nikolaus-scholze-18, Chapter I, §I.2, Lemma I.2.1 (Tate orbit lemma), Acta p. 218; proof on p. 224: “Lemma I.2.1. (Tate orbit lemma) Let X be a spectrum with a Cp2 -action. Assume that X is bounded below, i.e. there exists some n∈Z such that πi (X)=0 for i<n. Then, (XhCp )t(Cp2 /Cp ) ≃ 0.” — NS18 Lemma I.2.1: (X_{hC_p})^{t(C_{p²}/C_p)} ≃ 0 for X bounded below.

### `RT.2/tate-fixpoint-lemma` — The Tate fixpoint lemma

*Theorem.* Let X ∈ Sp^{BC_{p²}} be bounded above. Then (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

**Hypotheses.**

- X bounded above.

**Construction and proof.**

1. Dual to RT.2/tate-orbit-lemma: reduce by Postnikov convergence (colimit form) to Eilenberg–Mac Lane spectra and use the vanishing for the coconnective two-stage pieces τ_{[−2i−1,−2i]} (NS18 Lemmas I.2.2, I.2.4).

**Acceptance.**

- For X = HF_p with trivial action: ((HF_p)^{hC_p})^{tC_p} = 0.
- The hypothesis is needed: for S with trivial action (S^{hC_p})^{t(C_{p²}/C_p)} ≃ S^∧_p ≠ 0 (NS18 Example I.2.3(i)).

**Depends on.** `RT.2/tate-p-local-properties`, `RT.2/tate-of-eilenberg-maclane`

**Source.** nikolaus-scholze-18, Chapter I, §I.2, Lemma I.2.2 (Tate fixpoint lemma), Acta p. 219; proof on p. 224: “Lemma I.2.2. (Tate fixpoint lemma) Assume that X is bounded above, i.e. there exists some n∈Z such that πi (X)=0 for i>n. Then, (X hCp )t(Cp2 /Cp ) ≃ 0.” — NS18 Lemma I.2.2: (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0 for X bounded above.

### `RT.2/parametrised-tate` — The Tate construction for a Kan complex and the dualizing spectrum

*Theorem.* For a Kan complex S with p : S → ∗: (i) Sp^S is compactly generated by the s_!S; (ii) there is an initial functor p^T_* under p_* such that p_* → p^T_* vanishes on compact objects; (iii) it is unique such that fib(p_* → p^T_*) preserves colimits; (iv) fib(p_* → p^T_*) ≃ p_!(D_S ⊗ −) for a unique D_S ∈ Sp^S, the dualizing spectrum (Spivak–Klein), with fibre lim_{t∈S} Σ^∞_+ Map(s, t); (v) p_!(D_S ⊗ −) → p_* is the universal colimit-preserving approximation (assembly); (vi) if p^T_* vanishes on all s_!X, p^T_* has a unique lax symmetric monoidal structure making p_* → p^T_* lax symmetric monoidal. For S = BG with G finite this recovers Nm_G and −^{tG}, with D_{BG} = S with the trivial action.

**Hypotheses.**

- S a Kan complex.

**Construction and proof.**

1. Compact generation and the universal property of colimit-preserving approximations (EnhancedDerivedSheaves E5:presentability).
2. Define p^T_* as the cofibre of the assembly map; identify the assembly with p_!(D_S ⊗ −) by evaluating on generators s_!S.
3. Multiplicativity as in RT.2/tate-multiplicativity (NS18 Theorem I.4.1).

**Acceptance.**

- For S = BG, G finite: D_{BG} ≃ S (trivial action) and p^T_* = −^{tG}.
- For S = BT the dualizing spectrum is a shift of the sphere (Klein), which gives the norm Σ(−_{hT}) → −^{hT} of RT.2/circle-tate.

**Depends on.** `RT.2/spectra-with-action`, `RT.2/norm-map-tate`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`

**Source.** nikolaus-scholze-18, Chapter I, §I.4, Theorem I.4.1 and Definition I.4.2, Acta p. 235; proof pp. 237-238: “Definition I.4.2. The Spivak–Klein dualizing spectrum of S is the object DS ∈SpS mentioned in Theorem I.4.1 (iv).” — NS18 Theorem I.4.1 and Definition I.4.2: Tate construction for Kan complexes and the dualizing spectrum.

### `RT.2/circle-tate` — The circle norm and the T-Tate construction

*Construction.* On Sp^{BT} there is a natural transformation Nm_T : Σ(X_{hT}) → X^{hT} exhibiting Σ(−_{hT}) as the universal colimit-preserving functor over −^{hT}; its cofibre X^{tT} := cofib(Nm_T) has a unique lax symmetric monoidal structure making −^{hT} → −^{tT} lax symmetric monoidal. For n ≥ 1 there is a unique lax symmetric monoidal transformation −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}. For HZ with trivial action π_*(HZ^{tT}) = ℤ[t^{±1}], |t| = −2, and π_i(HZ^{tT})/n ≅ π_i(HZ^{tC_n}).

**Hypotheses.**

- X ∈ Sp^{BT}; the shift Σ comes from the dualizing spectrum of BT (one-dimensional circle).

**Construction and proof.**

1. Apply RT.2/parametrised-tate to S = BT; Klein's computation D_{BT} ≃ ΣS (with the sign convention of NS18 Corollary I.4.3) gives the norm Σ(−_{hT}) → −^{hT}.
2. Multiplicativity from RT.2/parametrised-tate (vi).
3. Compare with C_n via restriction along C_n ⊂ T; compute the HZ case from the Gysin sequence and NS18 Lemma I.4.4.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `circleNorm` | data | Nm_T : Σ(X_{hT}) → X^{hT}, natural in X ∈ Sp^{BT}. |
| `circleTate` | constructor | X^{tT} := cofib(Nm_T) with the fibre sequence Σ X_{hT} → X^{hT} → X^{tT}. |
| `circleTate.laxMonoidal` | structure | −^{tT} is lax symmetric monoidal, uniquely compatible with −^{hT} → −^{tT}. |
| `circleTate.toCyclic` | projection | −^{tT} → −^{tC_n} compatible with −^{hT} → −^{hC_n}. |
| `circleTate.HZ` | example | π_*(HZ^{tT}) = ℤ[t^{±1}], \|t\| = −2. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `circleTate.zero` | degenerate | 0^{tT} = 0. |
| `circleTate.HZ_mod_n` | computation | π_0(HZ^{tT})/n ≅ π_0(HZ^{tC_n}) = ℤ/n. |
| `circleTate.not_shift_free` | non-example | Without the suspension, X_{hT} → X^{hT} does not exist naturally: for X = HZ the degrees of HZ_{hT} (≥ 0) and HZ^{hT} (≤ 0) only meet after the shift, so the norm has source Σ(X_{hT}). |

**Used by.**

- RT.2/tc-minus-and-tp: TP := THH^{tT}
- RT.1/norm-sequence-hc: for X = HH(A/k), ΣHC → HC⁻ → HP is the circle norm sequence
- RT.3b/beilinson-square-ordinary: HP(R;ℚ_p) is HH(R)^{tT} with ℚ_p-coefficients

**Acceptance.**

- π_*(HZ^{hT}) = ℤ[t], π_*(HZ^{tT}) = ℤ[t^{±1}] and π_*(ΣHZ_{hT}) is ℤ in each odd degree ≥ 1; in the long exact sequence of ΣHZ_{hT} → HZ^{hT} → HZ^{tT}, π_{2i}(HZ^{tT}) ≅ π_{2i−1}(ΣHZ_{hT}) for i > 0.
- π_0(HZ^{tT})/p = π_0(HZ^{tC_p}) = 𝔽_p.

**Depends on.** `RT.2/parametrised-tate`, `RT.2/homotopy-orbits-fixed-points`, `RT.2/tate-multiplicativity`

**Source.** nikolaus-scholze-18, Chapter I, §I.4, Corollary I.4.3, Acta p. 238 (text layer drops arrows): “Corollary I.4.3. Consider the ∞-category SpBT of spectra with T-action. There is a natural transformation Σ(−hT ) −hT which exhibits Σ(−hT ) as the universal colimit preserving functor mapping to the target.” — NS18 Corollary I.4.3: the circle norm Σ(−_{hT}) → −^{hT} and the lax symmetric monoidal −^{tT}.

**Source.** nikolaus-scholze-18, Chapter I, §I.4, Lemma I.4.4, Acta p. 239; excerpt from arXiv v2 p. 30 (the Acta text layer drops the arrow and inserts a stray symbol before the displayed isomorphism): “Lemma I.4.4. Consider HZ ∈ SpBT endowed with the trivial T-action. The natural map (HZ)tT → (HZ)tCn induces isomorphisms πi (HZ)tT /n ≃ πi (HZ)tCn .” — NS18 Lemma I.4.4: (HZ)^{tT}/n ≅ (HZ)^{tC_n}.

### `RT.2/tate-cpn-via-cp` — Iterated Tate constructions for bounded below spectra

*Theorem.* (i) For bounded below X ∈ Sp^{BC_{p^n}}, the canonical map X^{tC_{p^n}} → (X^{tC_p})^{hC_{p^{n−1}}} is an equivalence. (ii) For bounded below X ∈ Sp^{BT}, (X^{tC_p})^{hT} is p-complete and X^{tT} → (X^{tC_p})^{hT} is a p-completion; hence ∏_p (X^{tC_p})^{hT} is the profinite completion of X^{tT}.

**Hypotheses.**

- X bounded below.

**Construction and proof.**

1. (i) by induction on n using the Tate orbit lemma (RT.2/tate-orbit-lemma) to kill the norm term (NS18 Lemma II.4.1).
2. (ii) pass to the limit over n along C_{p^n} ⊂ T using (i) and RT.2/tate-p-local-properties (iii) (NS18 Lemma II.4.2, Remark II.4.3).

**Acceptance.**

- For X = HZ (trivial T-action): (HZ^{tC_p})^{hT} has π_* = ℤ_p[t^{±1}], the p-completion of ℤ[t^{±1}] = π_*HZ^{tT}.

**Depends on.** `RT.2/tate-orbit-lemma`, `RT.2/tate-p-local-properties`, `RT.2/circle-tate`, `StableHomotopyKTheory:H.6/p-completion`

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Lemma II.4.1, Acta p. 261 (text layer drops the arrow): “Lemma II.4.1. Let X ∈SpBCpn be a spectrum with Cpn -action that is bounded below. Then, the canonical morphism X tCpn (X tCp )hCpn−1 is an equivalence.” — NS18 Lemma II.4.1: X^{tC_{p^n}} ≃ (X^{tC_p})^{hC_{p^{n−1}}} for X bounded below.

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT'): “Lemma II.4.2. If X is a spectrum bounded below with T-action, then (X tCp )hT is p-complete and the canonical morphism X tT (X tCp )hT exhibits it as the p-completion of X tT .” — NS18 Lemma II.4.2: X^{tT} → (X^{tC_p})^{hT} is a p-completion for X bounded below.

### `RT.2/cyclic-realisation` — Geometric realisation of cyclic objects and the circle action

*Construction.* For a cyclic object X : Λ^op → C in an ∞-category C with geometric realisations, the realisation |X| := colim_{Δ^op} X|_{Δ^op} carries a natural T-action, i.e. |−| refines to a functor Fun(Λ^op, C) → Fun(BT, C); this comes from the cofinality of Δ^op → Λ_∞^op and the identification of the colimit over Λ_∞^op with a BT-indexed functor (Connes: the classifying space of Λ is BT; NS18 Appendix B). For cyclic sets the T-action is the classical one on the realisation of the cyclic set.

**Hypotheses.**

- C an ∞-category with geometric realisations (colimits over Δ^op).

**Construction and proof.**

1. Define Λ_∞ and Λ_p (NS18 Appendix B) and prove Δ^op → Λ_∞^op cofinal (NS18 Theorem B.3).
2. Λ_∞ has a free BZ-action with quotient Λ, whose classifying space realises BT; left Kan extend along Λ^op → BT to obtain the T-equivariant colimit (NS18 Proposition B.5).
3. Compare with the point-set realisation of paracyclic spaces (NS18 Construction B.9, Proposition B.13).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CyclicObject.realize` | data | \|X\| ∈ Fun(BT, C) for X ∈ Fun(Λ^op, C). |
| `CyclicObject.realize_underlying` | compatibility | The underlying object of \|X\| is the simplicial colimit of X\|_{Δ^op}. |
| `CyclicObject.realize_map` | functoriality | Naturality in maps of cyclic objects and in colimit-preserving functors C → D. |
| `ParacyclicCategory.cofinal` | characterisation | Δ^op → Λ_∞^op is cofinal (NS18 Theorem B.3). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CyclicObject.realize_const` | degenerate | The realisation of a constant cyclic object c is c with trivial T-action. |
| `CyclicObject.realize_circle` | computation | The representable cyclic set Λ(−, [0]) has underlying simplicial set the simplicial circle Δ¹/∂Δ¹ (n + 1 simplices in degree n) and realises to T with its translation action. |
| `CyclicObject.realize_not_simplicial` | non-example | The realisation of a simplicial object that is not cyclic carries no T-action: a simplicial set structure alone does not determine the circle action. |

**Used by.**

- RT.2/thh-e1-ring: THH is the realisation of the cyclic bar construction with its T-action
- RT.2/thh-spectral-categories: the cyclic nerve of a spectral category
- RT.2/mixed-complexes-are-circle-modules: for cyclic k-modules the T-action is the one encoded by B

**Acceptance.**

- The cyclic set Λ^1 (the simplicial circle with its cyclic structure) realises to T with its translation action.
- For the cyclic bar construction of a discrete group G, |B^{cyc}G| ≃ LBG with the rotation action.

**Depends on.** `RT.1/cyclic-category`, `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`

**Source.** nikolaus-scholze-18, Appendix B, Proposition B.5 (Acta p. 384), Construction B.9 (Acta p. 387), Proposition B.13 (Acta p. 390), with Corollary B.14 (p. 391); excerpt from arXiv v2 p. 147 (Proposition B.5) (the Acta text layer displaces the arrow and C^{BT}): “Proposition B.5. For any ∞-category C admitting geometric realizations of simplicial objects, there is a natural functor Fun(N (Λop ), C) → C BT from cyclic objects in C to T-equivariant objects in C.” — NS18 Proposition B.5: the realisation of a cyclic object carries a T-action.

**Source.** nikolaus-scholze-18, Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383); excerpt from the definition of Λ_∞ (p. 380): “Now, we construct Connes’ cyclic category Λ. We start with the definition of the paracyclic category Λ∞ . It is the full subcategory Λ∞ ⊆ZPoSet consisting of all objects isomorphic to (1/n)Z for n⩾1.” — NS18 Appendix B: Λ_∞, Λ_p, Λ and the cofinality Theorem B.3.

### `RT.2/edgewise-subdivision` — Edgewise subdivision and Tate constructions of realisations

*Theorem.* For a cyclic object X in an ∞-category with colimits and r ≥ 1, the r-fold edgewise subdivision sd_r X (a Λ_r-object, i.e. carries a C_r-action levelwise) has |sd_r X| ≃ |X| T-equivariantly, the C_r ⊂ T action on |X| being realised levelwise; and for the p-fold subdivision of a cyclic spectrum which is levelwise bounded below uniformly, −^{tC_p} commutes with geometric realisation (NS18 Propositions B.19, B.20).

**Hypotheses.**

- C presentable stable for the Tate statement; uniform boundedness below as in NS18 Proposition B.20.

**Construction and proof.**

1. Construct sd_r: Λ_r^op-objects from Λ^op-objects by precomposition with the r-fold subdivision functor (NS18 Appendix B).
2. Identify realisations (NS18 Proposition B.19).
3. For Tate: realisation is a colimit; −^{tC_p} commutes with it for uniformly bounded below inputs by RT.2/tate-p-local-properties (NS18 Proposition B.20).

**Acceptance.**

- For X the cyclic bar construction of an algebra, sd_p X in degree n is A^{⊗p(n+1)} with C_p permuting blocks: this is how the Tate diagonal enters the Frobenius.

**Depends on.** `RT.2/cyclic-realisation`, `RT.2/tate-p-local-properties`

**Source.** nikolaus-scholze-18, Appendix B, Proposition B.19 (Acta pp. 394-395) and Proposition B.20 (Acta pp. 395-396); excerpt is the sentence introducing Proposition B.19 (p. 394; text layer drops the arrow 'sdp : Λp → Λ'): “Using the functor sdp : Λp Λ, we get for every cyclic object X a subdivided Λp object sd∗p X, and we recall the well-known fact that they have the same geometric realization.” — NS18 Propositions B.19 and B.20: edgewise subdivision and Tate constructions of realisations.

### `RT.2/tate-diagonal` — The Tate diagonal

*Construction.* The functor T_p : Sp → Sp, X ↦ (X^{⊗p})^{tC_p} (C_p permuting factors) is exact; every exact functor Sp → Sp receives a unique-up-to-contractible-choice natural transformation from the identity determined by its value on S (natural transformations id → F correspond to points of F(S)); the Tate diagonal Δ_p : X → (X^{⊗p})^{tC_p} is the transformation corresponding to the composite S → (S^{⊗p})^{hC_p} → (S^{⊗p})^{tC_p}. It is the unique lax symmetric monoidal transformation id → T_p. In D(ℤ) no such transformation exists: there is no natural map M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) refining the diagonal (NS18 Theorem III.1.10).

**Hypotheses.**

- p a prime; ⊗ the smash product of spectra.

**Construction and proof.**

1. Show T_p is exact (the cross terms of (X⊕Y)^{⊗p} are induced, hence Tate-acyclic; NS18 Proposition III.1.1).
2. Natural transformations from id to an exact functor F : Sp → Sp are F(S) (Yoneda for exact functors, NS18 Proposition III.1.2); take the image of 1 under S → (S^{⊗p})^{tC_p}.
3. Uniqueness of lax symmetric monoidal structure (NS18 Proposition III.3.1) using the C_p-equivariant p-fold tensor functor (NS18 Proposition III.3.6, Lemma III.3.7).
4. Non-example in D(ℤ): NS18 Theorem III.1.10.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `tateDiagonal` | data | Δ_p : X → (X^{⊗p})^{tC_p}, natural in X ∈ Sp. |
| `tateDiagonal.exact_target` | structure | X ↦ (X^{⊗p})^{tC_p} is exact. |
| `tateDiagonal.unique` | universal-property | Δ_p is the unique (lax symmetric monoidal) natural transformation id → T_p up to contractible choice. |
| `tateDiagonal.sphere` | example | On S it is the canonical map S → S^{tC_p}, a p-completion. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `tateDiagonal.zero` | degenerate | Δ_p on the zero spectrum is the zero map. |
| `tateDiagonal.HFp` | computation | π_0 of Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} is the Frobenius of 𝔽_p (identity), nonzero. |
| `tateDiagonal.no_DZ` | non-example | There is no natural transformation M → (M^{⊗p})^{tC_p} of functors D(ℤ) → D(ℤ) lifting the diagonal (NS18 Theorem III.1.10): the construction needs spectra. |

**Used by.**

- RT.2/cyclotomic-frobenius-thh: the Frobenius of THH is induced by the Tate diagonal on the edgewise subdivision
- RT.2/thh-symmetric-monoidal: uniqueness of the lax monoidal Tate diagonal gives the E_∞ Frobenius

**Acceptance.**

- For X = S, Δ_p : S → S^{tC_p} is the p-completion map (Segal conjecture; NS18 Example II.1.2(ii)).
- For X = HF_p, Δ_p : HF_p → (HF_p^{⊗p})^{tC_p} gives the Frobenius of THH(F_p) used in KTheoryFiniteLocalFields L.5.

**Depends on.** `RT.2/norm-map-tate`, `RT.2/tate-multiplicativity`, `RT.2/tate-vanishing-induced`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Source.** nikolaus-scholze-18, Chapter III, §III.1, Definition III.1.4, Acta p. 286; excerpt from arXiv v2 p. 70 (the Acta text layer garbles the displayed transformation and the composite S → S^{hC_p} → S^{tC_p}); see also Theorem III.1.7 (Acta p. 287) and Remark III.1.6: “Definition III.1.4. The Tate diagonal is the natural transformation ∆p : idSp → Tp : X → (X ⊗ . . . ⊗ X)tCp of endofunctors of Sp which under the equivalence of Proposition III.1.2 corresponds to the map S → Tp (S) = StCp which is the composition S → ShCp → StCp .” — NS18 Definition III.1.4: the Tate diagonal X → (X⊗…⊗X)^{tC_p}.

**Source.** nikolaus-scholze-18, Chapter III, §III.1, Proposition III.1.1 (Acta p. 285; proof pp. 285-286) and Proposition III.1.2 (Acta p. 286), with Corollary III.1.3 (p. 286); excerpt from arXiv v2 p. 68 (Proposition III.1.1) (the Acta text layer scrambles the word order around the displayed functor): “Proposition III.1.1. Let p be a prime. The functor Tp : Sp → Sp taking a spectrum X ∈ Sp to (X ⊗ . . . ⊗ X)tCp is exact, where X ⊗ . . . ⊗ X denotes the p-fold self tensor product with the Cp -action given by cyclic permutation of the factors.” — NS18 Propositions III.1.1–III.1.2: T_p is exact and transformations out of the identity.

**Source.** nikolaus-scholze-18, Chapter III, §III.1, Theorem III.1.10, Acta p. 290 (proof pp. 290-292); excerpt from arXiv v2 p. 72 (the Acta text layer garbles the displayed transformation): “Theorem III.1.10. Every natural transformation C → (C ⊗Z . . . ⊗Z C)tCp of functors D(Z) → D(Z) induces the zero map in homology H∗ (C) → H∗ ((C ⊗Z . . . ⊗Z C)tCp ) = Ĥ −∗ (Cp ; C ⊗Z . . . ⊗Z C).” — NS18 Theorem III.1.10: no Tate diagonal in D(ℤ).

### `RT.2/thh-e1-ring` — Topological Hochschild homology of an E_1-ring ★

*Planet:* Topological Hochschild homology.

*Definition.* For A ∈ Alg_{E_1}(Sp), THH(A) ∈ Sp^{BT} is the geometric realisation, with its circle action (RT.2/cyclic-realisation), of the cyclic bar construction [n] ↦ A^{⊗(n+1)} in Sp (the cyclic object built from the E_1-structure, NS18 Definition III.2.3). It is functorial in E_1-maps, THH(S) ≃ S with trivial action, and for a discrete ring R, THH(R) := THH(HR). The relative version over an E_∞-ring k is RT.2/relative-thh.

**Hypotheses.**

- A an E_1-algebra in spectra (Alg_{E_1}(Sp) from EnhancedDerivedSheaves E5:abstract applied to Sp).

**Construction and proof.**

1. Construct the cyclic bar construction as a functor Λ^op → Sp using the operadic description of Ass^⊗_act and the cyclic category over it (NS18 Proposition B.1).
2. Realise with the T-action (RT.2/cyclic-realisation).
3. Check THH(S) ≃ S (the cyclic bar construction of S is constant) and compare with HH for HZ-algebras (RT.2/thh-over-thhz).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `THH` | data | THH : Alg_{E_1}(Sp) → Sp^{BT}. |
| `THH.map` | functoriality | E_1-maps induce T-equivariant maps, with map_id and map_comp. |
| `THH.unit` | projection | The T-equivariant unit map A → THH(A) (inclusion of 0-simplices), non-equivariant on A. |
| `THH.ofRing` | constructor | THH(R) := THH(HR) for a discrete ring R. |
| `THH.pi0` | simp | π_0 THH(R) ≅ R/[R,R] for a connective E_1-ring with π_0 = R. |
| `THH.connective` | other | THH(A) is connective if A is. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `THH.sphere` | degenerate | THH(S) ≃ S with trivial T-action. |
| `THH.Fp_pi2` | computation | π_2 THH(𝔽_p) ≅ 𝔽_p (generated by Bökstedt's σ), while HH_2(𝔽_p/𝔽_p) = 0. |
| `THH.not_HH` | non-example | THH(𝔽_p) ≠ HH(𝔽_p/𝔽_p) = 𝔽_p: π_2 differs, so THH of a discrete ring is not its Hochschild homology over itself. |
| `THH.pi0_compat` | compatibility | π_0 THH(R) ≅ HH_0(R/ℤ) = R/[R,R], compatible with RT.1/hochschild-homology. |

**Used by.**

- RT.2/cyclotomic-frobenius-thh: THH(A) is the underlying T-spectrum of a cyclotomic spectrum
- RT.3/cyclotomic-trace: the trace lands in TC(A) = TC(THH(A))
- KTheoryFiniteLocalFields:L.5/thh-of-perfect-field: Bökstedt periodicity for THH(k)
- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH relative to ku of spherical lifts

**Acceptance.**

- THH(S) ≃ S with trivial T-action.
- π_0 THH(R) = R/[R,R] for a discrete ring R (= HH_0).
- THH(𝔽_p) has π_* = 𝔽_p[σ], |σ| = 2 (Bökstedt), imported by KTheoryFiniteLocalFields L.5/thh-of-perfect-field.

**Depends on.** `RT.2/cyclic-realisation`, `RT.2/spectra-with-action`, `RT.1/cyclic-bar-construction`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:abstract/infinity-operad`, `StableHomotopyKTheory:H.5:spectra/ring-spectrum`, `StableHomotopyKTheory:H.5:spectra/smash-product`

**Source.** nikolaus-scholze-18, Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303): “Definition III.2.3. For an E1 -ring spectrum A we let THH(A)∈SpBT be the geometric realization(23 ) of the cyclic spectrum” — NS18 Definition III.2.3: THH of an E_1-ring as the realisation of the cyclic bar construction with its T-action.

### `RT.2/cyclotomic-frobenius-thh` — The cyclotomic Frobenius of THH

*Construction.* For A ∈ Alg_{E_1}(Sp) and each prime p there is a natural T ≅ T/C_p-equivariant map φ_p : THH(A) → THH(A)^{tC_p}, obtained by applying the Tate diagonal A → (A^{⊗p})^{tC_p} levelwise to the p-fold edgewise subdivision of the cyclic bar construction and realising, using that −^{tC_p} commutes with the relevant realisation (NS18 §III.2). This makes THH(A) a cyclotomic spectrum (RT.2/cyclotomic-spectrum), naturally in A.

**Hypotheses.**

- A an E_1-ring; for connective A the realisation commutes with −^{tC_p} (RT.2/edgewise-subdivision).

**Construction and proof.**

1. Edgewise subdivide: sd_p of the cyclic bar construction has C_p acting on A^{⊗p(n+1)} by block permutation (RT.2/edgewise-subdivision).
2. Apply the Tate diagonal of A^{⊗(n+1)} levelwise to get A^{⊗(n+1)} → ((A^{⊗(n+1)})^{⊗p})^{tC_p} (RT.2/tate-diagonal).
3. Realise and identify the target with THH(A)^{tC_p} (for general A use the lax structure maps; NS18 §III.2).
4. Check T ≅ T/C_p-equivariance through the Λ_p-structure.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `THH.frobenius` | data | φ_p : THH(A) → THH(A)^{tC_p}, T ≅ T/C_p-equivariant, natural in A. |
| `THH.toCyclotomic` | constructor | THH(A) with (φ_p)_p as an object of CycSp. |
| `THH.frobenius_sphere` | example | φ_p for A = S is S → S^{tC_p}. |
| `THH.frobenius_multiplicative` | structure | For A an E_∞-ring, φ_p is a map of E_∞-rings (RT.2/thh-symmetric-monoidal). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `THH.frobenius_zero` | degenerate | For A = 0, φ_p is the zero map 0 → 0. |
| `THH.frobenius_sphere_pcomplete` | computation | π_0(φ_p) for A = S is ℤ → ℤ_p, the p-completion. |
| `THH.frobenius_not_equivalence` | non-example | φ_p is not an equivalence in general: for A = HF_p its target THH(𝔽_p)^{tC_p} has nonzero negative homotopy while THH(𝔽_p) is connective. |

**Used by.**

- RT.2/topological-cyclic-homology: TC uses φ_p^{hT} − can
- KTheoryFiniteLocalFields:L.5/fp-cyclotomic-frobenius-on-tc-minus: the Frobenius on TC⁻ of 𝔽_p

**Acceptance.**

- For A = S, φ_p : S → S^{tC_p} is the canonical map (a p-completion by the Segal conjecture).
- For A = HF_p, φ_p identifies THH(𝔽_p) with τ_{≥0}((HZ_p)^{tC_p}) as E_∞-cyclotomic spectra (NS18 Corollary IV.4.16), the form of Bökstedt periodicity used by KTheoryFiniteLocalFields L.5.

**Depends on.** `RT.2/thh-e1-ring`, `RT.2/tate-diagonal`, `RT.2/edgewise-subdivision`, `RT.2/tate-multiplicativity`

**Source.** nikolaus-scholze-18, Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303): “Definition III.2.3. For an E1 -ring spectrum A we let THH(A)∈SpBT be the geometric realization(23 ) of the cyclic spectrum” — NS18 §III.2 constructs the Frobenius φ_p : THH(A) → THH(A)^{tC_p} from the Tate diagonal.

### `RT.2/thh-symmetric-monoidal` — THH is symmetric monoidal; THH of E_∞-rings

*Theorem.* CycSp has a symmetric monoidal structure, with underlying T-spectrum the smash product and Frobenius the composite X⊗Y → X^{tC_p}⊗Y^{tC_p} → (X⊗Y)^{tC_p} (lax structure of −^{tC_p}), such that THH : Alg_{E_1}(Sp) → CycSp is symmetric monoidal. Hence for an E_∞-ring A, THH(A) is an E_∞-algebra in CycSp; its underlying E_∞-ring with T-action is A ⊗ T (the tensor of A with the space T in CAlg(Sp), McClure–Schwänzl–Vogt), and φ_p is the unique T-equivariant E_∞-map A⊗T → (A⊗T)^{tC_p} extending the Tate-valued Frobenius A → A^{tC_p} on A.

**Hypotheses.**

- A an E_1- (resp. E_∞-) ring spectrum.

**Construction and proof.**

1. Construct the symmetric monoidal structure on the lax equalizer (NS18 Construction IV.2.1) from the lax monoidal −^{tC_p} (RT.2/tate-multiplicativity).
2. THH commutes with ⊗ (realisation of cyclic bar constructions commutes with ⊗ since Δ^op is sifted).
3. McClure–Schwänzl–Vogt: for E_∞ A the cyclic bar construction is the simplicial model of A ⊗ T (NS18 Proposition IV.2.2); Frobenius via the Tate-valued Frobenius (NS18 Corollary IV.2.3, Definition IV.1.1).

**Acceptance.**

- THH(A⊗B) ≃ THH(A)⊗THH(B) as cyclotomic spectra.
- For a discrete commutative ring R, π_*THH(R) is a graded-commutative ring and the Dennis trace lands in a ring (RT.3).

**Depends on.** `RT.2/cyclotomic-frobenius-thh`, `RT.2/cyclotomic-spectrum`, `RT.2/tate-multiplicativity`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`

**Source.** nikolaus-scholze-18, Chapter IV, §IV.2, Construction IV.2.1 (Acta pp. 341-342), Proposition IV.2.2 (Acta p. 342), Corollary IV.2.3 (Acta p. 343); excerpt from Construction IV.2.1: “Construction IV.2.1. The ∞-categories Cyc Sp and Cyc Spp of (p-)cyclotomic spectra have a natural symmetric monoidal structure.” — NS18 Construction IV.2.1, Proposition IV.2.2 and Corollary IV.2.3: monoidal structure on CycSp, THH of E_∞-rings as A ⊗ T and their Frobenius.

### `RT.2/relative-thh` — THH relative to an E_∞-ring

*Definition.* For an E_∞-ring k and an E_1-k-algebra A (an E_1-algebra in Mod_k), THH(A/k) ∈ Mod_k^{BT} is the realisation of the cyclic bar construction formed with ⊗_k; equivalently THH(A/k) ≃ THH(A) ⊗_{THH(k)} k, where k is a THH(k)-algebra through the T-equivariant augmentation THH(k) = k⊗T → k. For a commutative ring R and an R-algebra A, THH(HA/HR) ≃ HH(A/R) (the Eilenberg–Mac Lane spectrum of derived Hochschild homology, with its T-action). THH(A/k) carries no cyclotomic Frobenius in general (k ≠ S); relative versions with Frobenius require a Frobenius lift on k (S[z], ku with its ψ-operations: RT.6 and RT.4:q-Hodge).

**Hypotheses.**

- k an E_∞-ring; A an E_1-k-algebra.

**Construction and proof.**

1. Construct the cyclic bar construction in Mod_k (symmetric monoidal) and realise (RT.2/cyclic-realisation).
2. THH(A/k) ≃ THH(A) ⊗_{THH(k)} k by comparing cyclic bar constructions (base change of cyclic objects).
3. For k = HR, identify Mod_{HR} ≃ D(R) (EnhancedDerivedSheaves E5:spectra-comparison) and the cyclic bar construction with the Hochschild complex of a flat resolution (RT.1/hochschild-homology).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `THH.relative` | data | THH(A/k) ∈ Mod_k^{BT}. |
| `THH.relative_baseChange` | equivalence | THH(A/k) ≃ THH(A) ⊗_{THH(k)} k. |
| `THH.relative_HZ` | compatibility | THH(HA/HR) ≃ H(HH(A/R)) T-equivariantly (RT.1/hochschild-homology). |
| `THH.relative_map` | functoriality | Functorial in maps of pairs (k → A). |
| `THH.relative_baseChange_k` | relation | For k → k′ of E_∞-rings, THH(A⊗_kk′/k′) ≃ THH(A/k)⊗_kk′. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `THH.relative_self` | degenerate | THH(k/k) ≃ k. |
| `THH.relative_polynomial` | computation | π_*THH(HZ[x]/HZ) = ℤ[x] ⊕ ℤ[x]dx in degrees 0, 1. |
| `THH.relative_vs_absolute` | non-example | THH(HF_p/HZ) = HH(𝔽_p/ℤ) has π_* a divided power algebra on a degree-2 class, while THH(HF_p) has polynomial π_* = 𝔽_p[σ]: relative and absolute THH differ. |

**Used by.**

- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH(−/ku) of spherical lifts
- RT.2/thh-over-thhz: HH(A/ℤ) as THH relative to HZ
- RT.6: THH relative to 𝕊[z] (BMS2 §11)

**Acceptance.**

- THH(k/k) = k with trivial action.
- THH(HZ[x]/HZ) = HH(ℤ[x]/ℤ) with π_* = ℤ[x] ⊕ ℤ[x]dx.

**Depends on.** `RT.2/thh-e1-ring`, `RT.1/hochschild-homology`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `EnhancedDerivedSheaves:E5:spectra-comparison`

**Source.** bms2-19, Lemma 2.5, p. 15: “Lemma 2.5. For any commutative ring A, there is a natural T-equivariant isomorphism of E∞-ring spectra THH(A) ⊗_{THH(Z)} Z ≃ HH(A). Moreover, this induces an isomorphism of p-complete E∞-ring spectra THH(A; Z_p) ⊗_{THH(Z)} Z ≃ HH(A; Z_p).” — BMS2 Lemma 2.5 identifies THH(A) ⊗_{THH(ℤ)} ℤ with HH(A/ℤ) — the relative THH over HZ.

**Source.** nikolaus-scholze-18, Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303): “Definition III.2.3. For an E1 -ring spectrum A we let THH(A)∈SpBT be the geometric realization(23 ) of the cyclic spectrum” — NS18 §III.2: the cyclic bar construction in a symmetric monoidal ∞-category.

### `RT.2/thh-over-thhz` — THH relative to THH(ℤ) is Hochschild homology

*Theorem.* For every ring A (or HZ-algebra), the T-equivariant map THH(A) → HH(A/ℤ) induces an equivalence THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), and π_iTHH(ℤ) is finite for i > 0 (π_{2k−1}THH(ℤ) ≅ ℤ/k for k ≥ 1, π_{even>0} = 0, Bökstedt). Consequently THH(A) → HH(A/ℤ) is an equivalence rationally and THH(A)/p → HH(A/ℤ)/p is controlled by THH(ℤ)/p.

**Hypotheses.**

- A a ring (or connective HZ-algebra).

**Construction and proof.**

1. Apply RT.2/relative-thh with k = HZ: THH(A/HZ) = THH(A) ⊗_{THH(ℤ)} ℤ (BMS2 Lemma 2.5).
2. Import π_*THH(ℤ) from Bökstedt's computation as recorded in BMS2 (finite in positive degrees).

**Acceptance.**

- THH(A) ⊗ ℚ ≃ HH(A⊗ℚ/ℚ).
- π_1THH(ℤ) = 0 and π_3THH(ℤ) = ℤ/2.

**Depends on.** `RT.2/relative-thh`, `RT.1/hochschild-homology`

**Source.** bms2-19, Lemma 2.5, p. 15: “Lemma 2.5. For any commutative ring A, there is a natural T-equivariant isomorphism of E∞-ring spectra THH(A) ⊗_{THH(Z)} Z ≃ HH(A). Moreover, this induces an isomorphism of p-complete E∞-ring spectra THH(A; Z_p) ⊗_{THH(Z)} Z ≃ HH(A; Z_p).” — BMS2 Lemma 2.5: THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), with π_*THH(ℤ) finite in positive degrees.

### `RT.2/mixed-complexes-are-circle-modules` — Mixed complexes model complexes with circle action

*Comparison.* For a commutative ring k, D(k)^{BT} = Fun(BT, D(k)) is equivalent to the ∞-category of mixed complexes over k localised at quasi-isomorphisms (dg-modules over C_*(T; k) ≃ k[ε]/ε², |ε| = 1). Under this equivalence, for an algebra A the T-action on HH(A/k) (RT.2/relative-thh, RT.1/hochschild-homology) corresponds to the mixed complex (C(A/k), b, B), and HH(A/k)^{hT} ≃ CC⁻(A/k), HH(A/k)^{tT} ≃ CP(A/k), HH(A/k)_{hT} ≃ CC(A/k) (with the shift conventions of RT.1/cyclic-homology), so that the norm sequence Σ HH_{hT} → HH^{hT} → HH^{tT} is ΣHC → HC⁻ → HP.

**Hypotheses.**

- k commutative ring; product totalisations for −^{hT} and −^{tT}.

**Construction and proof.**

1. C_*(T; k) is formal, equal to k[ε]/ε² with |ε| = 1 (T is an H-space with H_* = Λ[ε]); modules over it in D(k) are Fun(BT, D(k)) (Koszul/Schwede–Shipley; Hoyois).
2. Identify homotopy fixed points with RHom_{k[ε]}(k, −), computed by the Koszul resolution: M[[u]] with b + uB (product totalisation).
3. Identify the T-action on |C_•(A)| (RT.2/cyclic-realisation) with B on the normalised complex (Hoyois's theorem).

**Acceptance.**

- k with trivial action ↦ (k, 0, 0); k^{hT} = k[u] = k[[u]] as graded ring (degreewise finite).
- HH(A/k)^{tT} for A smooth over a ℚ-algebra is 2-periodic de Rham cohomology (RT.1/hkr-cyclic-char0).

**Depends on.** `RT.1/mixed-complex`, `RT.1/cyclic-homology`, `RT.2/spectra-with-action`, `RT.2/circle-tate`, `RT.2/cyclic-realisation`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`

**Source.** hoyois-15, Theorem 2.1, p. 4: “Theorem 2.1. Let k be a discrete commutative ring and M ∈ PSh(Λ, Mod_k) a cyclic k-module. Then there are natural equivalences |M|_{hT} ≃ CC(M), |M|^{hT} ≃ CN(M), and |M|^{tT} ≃ CP(M). In particular, if C is a k-linear ∞-category, then HC(C) ≃ CC(C♮), HN(C) ≃ CN(C♮),” — Hoyois / BMS2 §2: mixed complexes are complexes with circle action, and HH^{hT}, HH^{tT}, HH_{hT} are HC⁻, HP, HC.

### `RT.2/norm-sequence-hc` — The norm sequence for cyclic homology

*Theorem.* For every algebra A over a commutative ring k there is a natural fibre sequence ΣHC(A/k) → HC⁻(A/k) → HP(A/k) in D(k), the circle norm sequence of HH(A/k) ∈ D(k)^{BT}; on homotopy … → HC_{n−1} → HC⁻_n → HP_n → HC_{n−2} → …. The map HC⁻ → HP is the canonical map can : (−)^{hT} → (−)^{tT}.

**Hypotheses.**

- k commutative; derived HH.

**Construction and proof.**

1. Apply RT.2/circle-tate to X = HH(A/k) and translate by RT.2/mixed-complexes-are-circle-modules.
2. Check the shift: Σ(X_{hT}) with X_{hT} ≃ CC (direct-sum totalisation) by the convention u^{−1} of degree 2.

**Acceptance.**

- For A = k: π_*ΣHC(k/k) is k in each odd degree ≥ 1, HC⁻_*(k/k) = k[u] and HP_*(k/k) = k[u^{±1}]; for i > 0, HP_{2i} ≅ π_{2i−1}ΣHC = HC_{2i−2}.
- This is the bottom row's source of the shift dictionary used by RT.3b/beilinson-fibre-sequence.

**Depends on.** `RT.2/circle-tate`, `RT.2/mixed-complexes-are-circle-modules`, `RT.1/cyclic-homology`

**Source.** hoyois-15, §2, p. 4: “There is a cofiber sequence CC[1] →(B) CN → CP, where the map “B” is induced by the degree (0, 1) map of bicomplexes BC(M) → BN(M) whose nonzero components are B: C_{i−1}(M) → C_i(M).” — The fibre sequence ΣHC → HC⁻ → HP (BMS2 §2 / AMMN §2).

### `RT.2/thh-spherical-group-rings` — THH and TC of spherical group rings and loop spaces

*Theorem.* For an E_1-monoid M in spaces, THH(S[M]) = Σ^∞_+B^{cyc}M with its T-action, and the cyclotomic Frobenius φ_p is Σ^∞_+ψ_p followed by Σ^∞_+((B^{cyc}M)^{hC_p}) → (Σ^∞_+B^{cyc}M)^{hC_p} → (Σ^∞_+B^{cyc}M)^{tC_p}, where ψ_p : B^{cyc}M → (B^{cyc}M)^{hC_p} comes from the diagonal (NS18 Lemma IV.3.1). For M = ΩY with Y connected, B^{cyc}M ≃ LY = Map(S¹, Y) T-equivariantly and ψ_p is induced by the p-fold cover S¹ → S¹, so THH(S[ΩY]) ≃ Σ^∞_+LY (Proposition IV.3.2, Corollary IV.3.3). For a bounded-below p-complete p-cyclotomic X with a Frobenius lift φ̃_p : X → X^{hC_p}, TC(X) is the pullback of tr : ΣX_{hT} → X and id − φ̃_p (Proposition IV.3.4); hence after p-completion TC(S[ΩY]) is the Bökstedt–Hsiang–Madsen pullback of Σ(Σ^∞_+LY)_{hT} → Σ^∞_+LY and id − Σ^∞_+ψ_p (Theorem IV.3.6).

**Hypotheses.**

- X a connected pointed space (Kan complex); p-completion for the TC statement.

**Construction and proof.**

1. Cyclic bar constructions of E_1-groups in spaces realise to free loop spaces (NS18 Lemma IV.3.1, Proposition IV.3.2).
2. Frobenius from the unstable p-th power map and the Segal conjecture (NS18 Proposition IV.3.4).
3. TC via the fibre sequence (RT.2/tc-fibre-sequence) and the norm sequence for Σ^∞_+LX (NS18 Theorem IV.3.6).

**Acceptance.**

- X = ∗: THH(S) = S.
- X = BG for a discrete group G: THH(S[G]) ≃ Σ^∞_+ L BG = ⊕_{conj classes [g]} Σ^∞_+ BC_G(g).

**Depends on.** `RT.2/thh-e1-ring`, `RT.2/cyclotomic-frobenius-thh`, `RT.2/tc-fibre-sequence`, `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`

**Source.** nikolaus-scholze-18, Chapter IV, §IV.3, Lemma IV.3.1 (Acta pp. 345-346), Proposition IV.3.2 (Acta p. 347), Corollary IV.3.3 (p. 351), Proposition IV.3.4 (Acta p. 352), Theorem IV.3.6 (Acta p. 354); excerpt from Proposition IV.3.2: “Proposition IV.3.2. Assume that M =ΩY is the loop space of a connected base space Y . (i) There is a natural T-equivariant equivalence Bcyc M ≃ LY = Map(S 1 , Y ), where T acts on LY through its action on S 1 .” — NS18 Lemma IV.3.1, Propositions IV.3.2, IV.3.4 and Theorem IV.3.6: cyclic bar constructions of loop spaces and TC of spherical group rings.

### `RT.2/thh-spectral-categories` — THH of spectral and stable ∞-categories

*Definition.* For a small spectral category (or small stable ∞-category) C, THH(C) ∈ Sp^{BT} is the realisation of the cyclic nerve [n] ↦ ⊕_{c_0,…,c_n} C(c_0,c_1)⊗C(c_1,c_2)⊗…⊗C(c_n,c_0) with its T-action, and it carries a cyclotomic structure. THH is Morita invariant: a functor inducing an equivalence of idempotent-completed module categories (Morita equivalence; in particular DK-equivalences and C → Idem(C)) induces an equivalence on THH; THH(Perf(A)) ≃ THH(A) for an E_1-ring A; THH sends exact sequences of small stable ∞-categories to fibre sequences (THH is a localizing invariant).

**Hypotheses.**

- C small (a set of objects for the cyclic nerve); for stable ∞-categories, THH is defined via a spectral category model or directly (Blumberg–Gepner–Tabuada).

**Construction and proof.**

1. Define the cyclic nerve as a cyclic spectrum and realise (RT.2/cyclic-realisation) (Blumberg–Mandell §3).
2. Morita invariance: reduce to DK-equivalences and to the inclusion of a full subcategory generating under retracts and finite colimits (Blumberg–Mandell's 'dennis-trace / agreement' argument).
3. THH(Perf(A)) ≃ THH(A): A is a one-object full subcategory generating Perf(A).
4. Localisation sequences (Blumberg–Mandell's localisation theorem) and cyclotomic structure (genuine model: Blumberg–Mandell; Borel model: by the Tate diagonal as for E_1-rings).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `THH.ofCat` | data | THH(C) ∈ CycSp for a small stable ∞-category C. |
| `THH.ofCat_perf` | compatibility | THH(Perf(A)) ≃ THH(A) as cyclotomic spectra. |
| `THH.ofCat_morita` | characterisation | Morita equivalences induce equivalences on THH. |
| `THH.ofCat_localizing` | structure | THH sends Verdier sequences A → B → B/A of small stable ∞-categories to fibre sequences. |
| `THH.ofCat_map` | functoriality | Exact functors induce cyclotomic maps, with map_id and map_comp. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `THH.ofCat_zero` | degenerate | THH of the zero category is 0. |
| `THH.ofCat_matrix` | computation | THH(Perf(M_n(R))) ≃ THH(R) via the Morita equivalence. |
| `THH.ofCat_not_K` | non-example | THH is not K-theory: THH(Perf(𝔽_p)) has π_2 = 𝔽_p while K_2(𝔽_p) = 0. |

**Used by.**

- RT.3/cyclotomic-trace: the trace K(C) → TC(C) is a natural transformation of localizing invariants of small stable ∞-categories
- KTheoryFiniteLocalFields:L.4/thh-of-linear-waldhausen-category: THH of linear Waldhausen categories via HZ-enriched Hom spectra
- trace:localizing-invariant: THH is a localizing invariant

**Acceptance.**

- THH(Perf(R)) ≃ THH(R) for a discrete ring R; THH(M_n(R)) ≃ THH(R).
- For the category of Z-linear categories via HZ-enriched Hom-groups, this is the THH of a linear category used by KTheoryFiniteLocalFields L.4.

**Depends on.** `RT.2/thh-e1-ring`, `RT.2/cyclic-realisation`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`

**Source.** blumberg-mandell-12, §3, Definition 3.1, pp. 9-10: “Definition 3.1. For a small spectral category C and (C, C)-bimodule M, let N^cy_q(C; M) = ⋁ C(cq−1, cq) ∧ · · · ∧ C(c0, c1) ∧ M(cq, c0), where the sum is over the (q + 1)-tuples (c0, . . . , cq) of objects of C.” — Blumberg–Mandell define THH of spectral categories by the cyclic nerve and prove Morita invariance and localisation sequences.

### `RT.2/lax-equalizer` — Lax equalizers of ∞-categories

*Definition.* For functors F, G : C → D of ∞-categories, the lax equalizer LEq(F, G) is the pullback C ×_{D×D} D^{Δ¹} along (F, G) and (ev_0, ev_1); objects are pairs (c, f : F(c) → G(c)). Mapping spaces are equalizers Map((c_X,f_X),(c_Y,f_Y)) ≃ Eq(Map_C(c_X,c_Y) ⇉ Map_D(Fc_X, Gc_Y)); if C, D are stable and F, G exact then LEq is stable and LEq → C is exact; if C is presentable, D accessible, F colimit-preserving and G accessible, LEq is presentable and LEq → C preserves colimits; limits in C preserved by G lift.

**Hypotheses.**

- F, G : C → D functors of ∞-categories.

**Construction and proof.**

1. Form the pullback in Cat_∞ (homotopy cartesian since ev is a categorical fibration).
2. Compute mapping spaces from the pullback; stability and presentability by closure properties (NS18 Proposition II.1.5).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `LaxEqualizer` | data | LEq(F, G) with its projection to C. |
| `LaxEqualizer.mapping` | characterisation | Mapping spaces are equalizers of the two induced maps. |
| `LaxEqualizer.instStable` | instance | Stable when C, D are stable and F, G exact. |
| `LaxEqualizer.instPresentable` | instance | Presentable under the accessibility hypotheses, with colimit-preserving projection. |
| `LaxEqualizer.conservative` | other | The projection LEq(F,G) → C is conservative. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `LaxEqualizer.identity` | degenerate | LEq(id_C, id_C) has objects (c, f : c → c). |
| `LaxEqualizer.mapping_point` | computation | For C = D = Spaces and F = G = id, maps (∗, id) → (∗, id) form a contractible space. |
| `LaxEqualizer.not_equalizer` | non-example | LEq(F, G) is not the equalizer {c : F c ≃ G c}: objects carry a map, not an equivalence; genuine cyclotomic spectra (equivalences Φ^{C_p}X ≃ X) form an equalizer instead. |

**Used by.**

- RT.2/cyclotomic-spectrum: CycSp is a lax equalizer
- RT.4:q-Hodge/cyclonic-spectrum: cyclonic spectra use a variant with genuine finite fixed points

**Acceptance.**

- If F = G = id_C, LEq(id, id) is the ∞-category of endomorphisms (c, f : c → c).
- CycSp_p = LEq(id, −^{tC_p}) on Sp^{BC_{p^∞}}.

**Depends on.** `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Definition II.1.4 (Acta p. 241) and Proposition II.1.5 (Acta pp. 241-242; proof pp. 242-244); excerpt from Definition II.1.4 (text layer drops the arrow in 'f : F (c) → G(c)'): “In particular, objects of LEq(F, G) are given by pairs (c, f ) of an object c∈C and a map f : F (c) G(c) in D.” — NS18 Definition II.1.4 and Proposition II.1.5: lax equalizers and their properties.

### `RT.2/cyclotomic-spectrum` — Cyclotomic spectra ★

*Planet:* Cyclotomic spectra.

*Definition.* A cyclotomic spectrum is a spectrum X with T-action together with T ≅ T/C_p-equivariant maps φ_p : X → X^{tC_p} for every prime p (no compatibility between different primes). The ∞-category is CycSp := LEq(Sp^{BT} ⇉ ∏_p Sp^{BT}) for id and (−^{tC_p})_p, using Sp^{B(T/C_p)} ≃ Sp^{BT}. A p-cyclotomic spectrum is a spectrum with C_{p^∞}-action and a C_{p^∞} ≅ C_{p^∞}/C_p-equivariant φ_p : X → X^{tC_p}; CycSp_p := LEq(Sp^{BC_{p^∞}} ⇉ Sp^{BC_{p^∞}}). Both are presentable stable, and the forgetful functors to Sp are exact, conservative and preserve small colimits. The sphere S with trivial action and φ_p : S → S^{hC_p} → S^{tC_p} is the unit, equivalent to THH(S).

**Hypotheses.**

- Primes p range over all primes; T/C_p identified with T by the p-th power map.

**Construction and proof.**

1. Define as a lax equalizer (RT.2/lax-equalizer) using RT.2/tate-multiplicativity for −^{tC_p}.
2. Presentability/stability: Sp^{BT} presentable stable, −^{tC_p} exact and accessible (NS18 Corollary II.1.7).
3. The cyclotomic sphere: trivial action plus canonical maps (NS18 Example II.1.2).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CyclotomicSpectrum` | structure | A T-spectrum X with maps φ_p : X → X^{tC_p}; CycSp = LEq(id, (−^{tC_p})_p). |
| `CyclotomicSpectrum.pTypical` | data | p-cyclotomic spectra CycSp_p with C_{p^∞}-action. |
| `CyclotomicSpectrum.forget` | projection | CycSp → Sp^{BT} → Sp, exact, conservative, colimit-preserving. |
| `CyclotomicSpectrum.unit` | example | The cyclotomic sphere S. |
| `CyclotomicSpectrum.instStable` | instance | CycSp is presentable stable. |
| `CyclotomicSpectrum.toPTypical` | functoriality | Restriction CycSp → CycSp_p along C_{p^∞} ⊂ T. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CyclotomicSpectrum.zero` | degenerate | 0 with zero Frobenii is the zero object. |
| `CyclotomicSpectrum.sphere_frobenius` | computation | For the cyclotomic sphere, π_0 φ_p : ℤ → π_0S^{tC_p} = ℤ_p is the completion map. |
| `CyclotomicSpectrum.trivial_HFp` | non-example | HF_p with trivial T-action and φ_p = 0 is a cyclotomic spectrum but is not THH(𝔽_p) (whose φ_p is nonzero and π_2 ≠ 0): a cyclotomic structure is extra data. |

**Used by.**

- RT.2/topological-cyclic-homology: TC(X) = map_{CycSp}(S, X)
- KTheoryFiniteLocalFields:L.5/fp-cyclotomic-shift-model: prime-field THH as a cyclotomic shift of trivial HZ_p
- RT.2/bounded-below-cyclotomic-equivalence: comparison with genuine cyclotomic spectra

**Acceptance.**

- THH(A) is cyclotomic for every E_1-ring A (RT.2/cyclotomic-frobenius-thh).
- The cyclotomic sphere has φ_p the p-completion map S → S^{tC_p}.

**Depends on.** `RT.2/lax-equalizer`, `RT.2/norm-map-tate`, `RT.2/spectra-with-action`, `RT.2/tate-multiplicativity`

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Definition II.1.1, Acta p. 240 (text layer drops the arrows in 'ϕp : X → X tCp'); cf. Definition 1.3 in the Introduction, p. 208: “Definition II.1.1. (i) A cyclotomic spectrum is a spectrum X with T-action together with T-equivariant maps ϕp : X X tCp for every prime p. (ii) For a fixed prime p, a p-cyclotomic spectrum is a spectrum X with Cp∞ -action and a Cp∞ -equivariant map ϕp : X X tCp .” — NS18 Definition II.1.1: cyclotomic and p-cyclotomic spectra.

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Definition II.1.6, Acta p. 244; excerpt from arXiv v2 p. 35, beginning inside the displayed formula of part (i) (in both text layers the display LEq(Sp^{BT} ⇉ ∏_{p∈P} Sp^{BT}) is scrambled; the Acta layer also drops the arrows and displaces the word 'and'): “CycSp := LEq SpBT p∈P where the two functors have p-th components given by the functors id : SpBT → SpBT and −tCp : SpBT → SpB(T/Cp ) ≃ SpBT .” — NS18 Definition II.1.6: CycSp and CycSp_p as lax equalizers.

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Corollary II.1.7, Acta p. 244; proof p. 245 (text layer drops the arrows 'Cyc Sp → Sp', 'Cyc Spp → Sp'): “Corollary II.1.7. The ∞-categories Cyc Sp and Cyc Spp are presentable stable ∞-categories. The forgetful functors Cyc Sp Sp and Cyc Spp Sp reflect equivalences, are exact, and preserve all small colimits.” — NS18 Corollary II.1.7: presentable stable, forgetful functor exact and conservative.

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Example II.1.2 (ii), Acta p. 240 (text layer drops the arrows in 'S → StCp' and 'S → ShCp → StCp'): “(ii) Consider the sphere spectrum S equipped with the trivial T-action. There are canonical maps ϕp : S StCp given as the composition S ShCp StCp .” — NS18 Example II.1.2: the cyclotomic sphere.

### `RT.2/tc-minus-and-tp` — Negative topological cyclic and periodic topological cyclic homology

*Definition.* For X ∈ Sp^{BT}: TC⁻(X) := X^{hT} and TP(X) := X^{tT}, with can : TC⁻(X) → TP(X) the canonical map and, for X cyclotomic and bounded below, φ := ∏_p φ_p^{hT} : TC⁻(X) → ∏_p (X^{tC_p})^{hT} ≃ TP(X)^∧ (profinite completion, RT.2/tate-cpn-via-cp). For an E_1-ring A, TC⁻(A) := THH(A)^{hT}, TP(A) := THH(A)^{tT}; for k-algebras HC⁻(A/k) = HH(A/k)^{hT} and HP(A/k) = HH(A/k)^{tT} (RT.2/mixed-complexes-are-circle-modules). Both are lax symmetric monoidal in X.

**Hypotheses.**

- X ∈ Sp^{BT}; for φ, X cyclotomic and bounded below.

**Construction and proof.**

1. Define by RT.2/homotopy-orbits-fixed-points and RT.2/circle-tate.
2. Identify the target of φ_p^{hT} with TP^∧_p via RT.2/tate-cpn-via-cp (ii).
3. Linearisation THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ), TP(A) → HP(A/ℤ).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TCminus` | data | TC⁻(X) = X^{hT}. |
| `TP` | data | TP(X) = X^{tT}. |
| `TCminus.can` | projection | can : TC⁻ → TP. |
| `TCminus.frobenius` | projection | φ : TC⁻(X) → TP(X)^∧ for bounded below cyclotomic X. |
| `TCminus.laxMonoidal` | structure | TC⁻ and TP are lax symmetric monoidal; TC⁻(A), TP(A) are E_∞-rings for E_∞ A. |
| `TCminus.toHC` | compatibility | THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ) and TP(A) → HP(A/ℤ), rational equivalences. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TCminus.zero` | degenerate | TC⁻(0) = TP(0) = 0. |
| `TP.HZ_trivial` | computation | For HZ with trivial T-action, π_*TP = ℤ[t^{±1}]. |
| `TP.not_HP` | non-example | TP(𝔽_p) ≠ HP(𝔽_p/𝔽_p): π_0TP(𝔽_p) = ℤ_p while HP_0(𝔽_p/𝔽_p) = 𝔽_p. |

**Used by.**

- RT.3b/beilinson-square-spectral: TC⁻ and TP rationalised are compared with HC⁻ and HP
- KTheoryFiniteLocalFields:L.5/fp-negative-topological-cyclic-homology: TC⁻ of 𝔽_p
- RT.4:q-Hodge/tc-minus-m: TC^{−(m)} refines TC⁻ with genuine C_m fixed points

**Acceptance.**

- TC⁻(𝔽_p) and TP(𝔽_p): π_*TP(𝔽_p) = ℤ_p[σ^{±1}] (imported calculation in KTheoryFiniteLocalFields L.5).
- TC⁻(S) = S^{hT}, TP(S) = S^{tT}.

**Depends on.** `RT.2/circle-tate`, `RT.2/tate-cpn-via-cp`, `RT.2/cyclotomic-spectrum`, `RT.2/thh-e1-ring`

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Corollary 1.5 and Remark 1.6, Introduction, Acta p. 209 (displayed fibre sequences are garbled in the text layer): “Proposition II.1.9. (i) Let (X, (ϕp )p∈P ) be a cyclotomic spectrum. There is a functorial fiber sequence” — NS18 Proposition II.1.9 and Corollary 1.5 use X^{hT}, X^{tT} with can and φ_p^{hT}.

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Lemma II.4.2 and Remark II.4.3, Acta p. 262 (text layer drops the arrow 'X tT → (X tCp )hT'): “Lemma II.4.2. If X is a spectrum bounded below with T-action, then (X tCp )hT is p-complete and the canonical morphism X tT (X tCp )hT exhibits it as the p-completion of X tT .” — NS18 Lemma II.4.2: (X^{tC_p})^{hT} is the p-completion of X^{tT}.

### `RT.2/topological-cyclic-homology` — Topological cyclic homology ★

*Planet:* Topological cyclic homology.

*Definition.* For a cyclotomic spectrum X, TC(X) := map_{CycSp}(S, X) (mapping spectrum from the cyclotomic sphere); for a p-cyclotomic X, TC(X, p) := map_{CycSp_p}(S, X); for an E_1-ring A, TC(A) := TC(THH(A)) and TC(A, p) := TC(THH(A), p). TC is exact, lax symmetric monoidal, and TC(A) is an E_∞-ring for E_∞ A.

**Hypotheses.**

- X ∈ CycSp (resp. CycSp_p).

**Construction and proof.**

1. Mapping spectra exist since CycSp is stable (RT.2/cyclotomic-spectrum).
2. Compute by the equalizer formula of RT.2/lax-equalizer, giving RT.2/tc-fibre-sequence.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TC` | data | TC(X) = map_{CycSp}(S, X); TC(A) = TC(THH(A)). |
| `TC.pTypical` | data | TC(X, p) = map_{CycSp_p}(S, X). |
| `TC.exact` | structure | TC : CycSp → Sp is exact and preserves filtered colimits of uniformly bounded below objects. |
| `TC.laxMonoidal` | structure | TC is lax symmetric monoidal. |
| `TC.toTCminus` | projection | TC(X) → TC⁻(X) = X^{hT}. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TC.zero` | degenerate | TC(0) = 0. |
| `TC.Fp` | computation | π_*TC(𝔽_p)^∧_p = ℤ_p in degrees 0 and −1 (imported from L.5 as an acceptance value). |
| `TC.not_TCminus` | non-example | TC(𝔽_p) ≠ TC⁻(𝔽_p): π_{−2}TC⁻(𝔽_p) ≠ 0 while π_{−2}TC(𝔽_p) = 0. |

**Used by.**

- RT.3/cyclotomic-trace: the trace K → TC
- RT.3/dgm-theorem: relative K agrees with relative TC on nilpotent extensions
- KTheoryFiniteLocalFields:L.4/p-typical-tc: Hesselholt–Madsen's TC(C;p) is compared with this TC

**Acceptance.**

- TC(S) ≃ S ⊕ ΣCP^∞_{−1}-type answer after p-completion (Bökstedt–Hsiang–Madsen), not computed here.
- TC(𝔽_p)^∧_p ≃ HZ_p ⊕ Σ^{−1}HZ_p (KTheoryFiniteLocalFields L.5/tc-of-perfect-field).

**Depends on.** `RT.2/cyclotomic-spectrum`, `RT.2/lax-equalizer`, `RT.2/thh-e1-ring`, `RT.2/cyclotomic-frobenius-thh`

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Definition II.1.8, Acta p. 245: “Definition II.1.8. (i) Let X, (ϕp )p∈P be a cyclotomic spectrum. The integral topological cyclic homology TC(X) of X is the mapping spectrum mapCyc Sp (S, X)∈Sp. (ii) Let (X, ϕp ) be a p-cyclotomic spectrum.” — NS18 Definition II.1.8: TC(X) = map_{CycSp}(S, X) and TC of an E_1-ring.

### `RT.2/tc-fibre-sequence` — The Nikolaus–Scholze formula for TC ★

*Planet:* Nikolaus–Scholze formula for TC.

*Theorem.* (i) For a cyclotomic spectrum X there is a functorial fibre sequence TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT}, the second map having p-th component φ_p^{hT} − can, where can : X^{hT} ≃ (X^{hC_p})^{h(T/C_p)} → (X^{tC_p})^{h(T/C_p)}. (ii) For a p-cyclotomic X: TC(X, p) → X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}. (iii) For X bounded below, ∏_p(X^{tC_p})^{hT} ≃ TP(X)^∧ and TC(X) ≃ fib(φ − can : TC⁻(X) → TP(X)^∧); for a connective E_1-ring A, TC(A) is the genuine (Bökstedt–Hsiang–Madsen–Goodwillie) TC (via RT.2/genuine-tc-agrees).

**Hypotheses.**

- X cyclotomic; (iii) X bounded below.

**Construction and proof.**

1. Mapping spectra in a lax equalizer are equalizers (RT.2/lax-equalizer): map(S, X) = Eq(map_{Sp^{BT}}(S, X) ⇉ ∏_p map(S, X^{tC_p})) = fib(X^{hT} → ∏_p (X^{tC_p})^{hT}).
2. Identify the two maps with can and φ_p^{hT} (NS18 Proposition II.1.9).
3. For bounded below X apply RT.2/tate-cpn-via-cp (NS18 Corollary 1.5).

**Acceptance.**

- For X = THH(𝔽_p): TC(𝔽_p) = fib(φ − can : TC⁻(𝔽_p) → TP(𝔽_p)) with π_* = ℤ_p in degrees 0, −1 (p-complete).
- Fails for unbounded X: for X = KU-type periodic inputs the profinite-completion identification (iii) is not available.

**Depends on.** `RT.2/topological-cyclic-homology`, `RT.2/tc-minus-and-tp`, `RT.2/tate-cpn-via-cp`, `RT.2/lax-equalizer`

**Source.** nikolaus-scholze-18, Chapter II, §II.1, Proposition II.1.9, Acta p. 245 (proof p. 246); Corollary 1.5 and Remark 1.6, Introduction, Acta p. 209 (displayed fibre sequences are garbled in the text layer): “Proposition II.1.9. (i) Let (X, (ϕp )p∈P ) be a cyclotomic spectrum. There is a functorial fiber sequence” — NS18 Proposition II.1.9 and Corollary 1.5: TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT} with φ_p^{hT} − can.

### `RT.2/tc-p-completion` — p-completion of TC

*Theorem.* For a bounded below cyclotomic spectrum X: TC(X)^∧_p ≃ TC(X|_{CycSp_p}, p)^∧_p, and TC(X) is the pullback of X^{hT} → ∏_p (X^∧_p)^{hT} ← ∏_p TC(X,p)^∧_p (in particular TC(X) ⊗ ℚ is the pullback of TC⁻(X)⊗ℚ and (∏_p TC(X,p)^∧_p)⊗ℚ over (∏_p TC⁻(X)^∧_p)⊗ℚ).

**Hypotheses.**

- X bounded below.

**Construction and proof.**

1. Compare the fibre sequences of RT.2/tc-fibre-sequence (i) and (ii) after p-completion: (X^{tC_p})^{hT} ≃ (X^{tC_p})^{hC_{p^∞}}-type identifications for bounded below X (NS18 §II.4, after diagram (1), and §IV.3).
2. Arithmetic fracture square (StableHomotopyKTheory H.6/arithmetic-fracture-square).

**Acceptance.**

- For X = THH(A) with A connective, TC(A)^∧_p = TC(A, p)^∧_p, the object used by KTheoryFiniteLocalFields L.4/integral-and-p-typical-tc-agree-after-completion.

**Depends on.** `RT.2/tc-fibre-sequence`, `RT.2/tate-cpn-via-cp`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/arithmetic-fracture-square`

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266); excerpt is the sentence introducing (1): “Recall from [32, Lemma 6.4.3.2] Goodwillie’s definition of the integral topological cyclic homology for a genuine cyclotomic spectrum X in the sense of Definition II.3.3. It is defined(22 ) by the pullback square” — NS18 §II.4: integral TC^gen is the pullback (1) over primes and its p-completion is TC^gen(X, p)^∧_p.

### `RT.2/trivial-cyclotomic-adjunction` — TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers

*Theorem.* (i) The functor Sp → CycSp sending a spectrum Y to Y^{triv} (trivial T-action, Frobenius Y → Y^{hC_p} → Y^{tC_p}) is left adjoint to TC : CycSp → Sp (NS18 Proposition IV.4.14). (ii) For a connective cyclotomic X, sh_pX has underlying T-spectrum τ_{≥0}(X^{tC_p}) with residual action, φ_ℓ = 0 for ℓ ≠ p and φ_p = τ_{≥0}(φ_p^{tC_p}), with a natural map X → sh_pX (Construction IV.4.15); HZ_p^{triv} → THH(𝔽_p) induces THH(𝔽_p) ≃ sh_p(HZ_p^{triv}) as E_∞-cyclotomic spectra (Corollary IV.4.16). (iii) For an E_2-ring A with p = 0 in π_0A, THH(A) is a THH(𝔽_p)-module compatibly with the cyclotomic structure and TC(A) → THH(A)^{hT} → THH(A)^{tT} (can − φ_p^{hT}) is a fibre sequence even if A is not bounded below (final paragraph of NS18 §IV.4, where the target is to be read p-completed).

**Hypotheses.**

- (i) all spectra; (ii) bounded below / connective p-cyclotomic spectra as in NS18 §IV.4.

**Construction and proof.**

1. (i) Map_{CycSp}(triv Y, X) = Eq(Map(Y, X^{hT}) ⇉ ∏ Map(Y, (X^{tC_p})^{hT})) = Map(Y, TC(X)) by RT.2/tc-fibre-sequence.
2. (ii) connective-cover and characteristic-p statements: NS18 §IV.4, using RT.2/tate-orbit-lemma and RT.2/hz-module-circle-tate.

**Acceptance.**

- TC(triv Y) for Y = S is TC(S); the counit triv TC(X) → X is the universal map.

**Depends on.** `RT.2/tc-fibre-sequence`, `RT.2/cyclotomic-spectrum`, `RT.2/tate-orbit-lemma`, `RT.2/hz-module-circle-tate`

**Source.** nikolaus-scholze-18, Chapter IV, §IV.4, Proposition IV.4.14 and Construction IV.4.15 (Acta p. 363), Corollary IV.4.16 (Acta p. 364), and the final unnumbered paragraph of §IV.4 (Acta pp. 364-365); excerpt from Construction IV.4.15: “Construction IV.4.15. Let X be a connective cyclotomic spectrum. We construct a new connective cyclotomic spectrum shp X as follows: The underlying spectrum of shp X with T-action is τ⩾0 (X tCp ) (where as usual this carries the residual action).” — NS18 Proposition IV.4.14 and the statements following it on connective covers and characteristic-p cyclotomic spectra.

### `RT.2/hz-module-circle-tate` — Circle and finite Tate constructions for HZ-module spectra

*Theorem.* For X ∈ D(ℤ)^{BT} (T-equivariant HZ-modules, equivalently mixed complexes over ℤ by RT.2/mixed-complexes-are-circle-modules), the natural maps X^{hT} ⊗_{ℤ^{hT}} ℤ → X, X^{hT} ⊗_{ℤ^{hT}} ℤ^{tT} → X^{tT} and X^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_n} → X^{tC_n} (n ≥ 1), induced by the lax symmetric monoidal structures, are equivalences (NS18 Lemma IV.4.12). With π_*ℤ^{tT} = ℤ[t^{±1}] and π_*ℤ^{tC_n} = ℤ/n[t^{±1}] this computes finite Tate constructions from the circle one.

**Hypotheses.**

- X ∈ Mod_{HZ}^{BT}; the base-change formula needs the bounded-below / finiteness hypotheses of NS18 Lemma IV.4.12.

**Construction and proof.**

1. All three functors are exact and the maps are equivalences on the generator ℤ[T] ≃ ℤ ⊗ Σ^∞_+T (free T-module) and on ℤ with trivial action; D(ℤ)^{BT} is generated by these under colimits and the relevant functors commute with them after the module structures are taken into account (NS18 Lemma IV.4.12).
2. Consistency: for X = ℤ with trivial action the third map gives π_*ℤ^{tC_p} = ℤ[t^{±1}]/p = 𝔽_p[t^{±1}], as in RT.2/circle-tate.

**Acceptance.**

- For X = ℤ with trivial action: ℤ^{tC_p} ≃ ℤ^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_p} with π_* = 𝔽_p[t^{±1}].

**Depends on.** `RT.2/circle-tate`, `RT.2/mixed-complexes-are-circle-modules`, `RT.2/tate-of-eilenberg-maclane`

**Source.** nikolaus-scholze-18, Chapter IV, §IV.4, Lemma IV.4.12, Acta p. 362 (the three displayed maps are garbled in the text layer; checked on the rendered page): “Lemma IV.4.12. The following natural transformations of functors D(Z)BT induced by the respective lax symmetric monoidal structures, are equivalences:” — NS18 Lemma IV.4.12: T-equivariant chain complexes and their Tate constructions.

### `RT.2/orthogonal-spectra` — Orthogonal spectra

*Definition.* An orthogonal spectrum X is a sequence of pointed spaces X_n with continuous based O(n)-actions and structure maps σ_n : X_n ∧ S¹ → X_{n+1} whose iterates X_n ∧ S^m → X_{n+m} are O(n) × O(m)-equivariant; π_iX := colim_n π_{i+n}X_n; a map is a stable equivalence if it induces isomorphisms on all π_i. Orthogonal spectra form a closed symmetric monoidal category (smash product), and inverting stable equivalences gives the ∞-category Sp, compatibly with symmetric spectra (StableHomotopyKTheory H.5:spectra) via the forgetful functor (Mandell–May–Schwede–Shipley).

**Hypotheses.**

- Spaces are compactly generated weak Hausdorff; O(n) acts continuously.

**Construction and proof.**

1. Define as diagram spectra over the topological category of real inner product spaces (Mandell–May–Schwede–Shipley).
2. Stable model structure and comparison with symmetric spectra: the forgetful functor from orthogonal to symmetric spectra (of spaces) is a right Quillen equivalence; compose with the symmetric-spectra model of StableHomotopyKTheory H.5:spectra and EnhancedDerivedSheaves E5:spectra-comparison.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `OrthogonalSpectrum` | structure | Sequences (X_n, O(n)-action, σ_n) with equivariant iterated structure maps. |
| `OrthogonalSpectrum.homotopyGroup` | projection | π_iX = colim_n π_{i+n}X_n. |
| `OrthogonalSpectrum.smash` | structure | Closed symmetric monoidal smash product with unit S. |
| `OrthogonalSpectrum.toSymmetric` | compatibility | The forgetful functor to symmetric spectra is a right Quillen equivalence; both present Sp. |
| `OrthogonalSpectrum.StableEquiv` | characterisation | Stable equivalences are the π_*-isomorphisms. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `OrthogonalSpectrum.sphere_pi0` | computation | π_0 of the orthogonal sphere spectrum is ℤ. |
| `OrthogonalSpectrum.zero` | degenerate | The constant point spectrum is a zero object. |
| `OrthogonalSpectrum.not_sequential` | non-example | A sequential spectrum without O(n)-actions does not have a symmetric monoidal smash product on the point-set level; the O(n)-actions are needed. |

**Used by.**

- RT.2/genuine-g-spectra: orthogonal G-spectra model genuine G-spectra
- RT.2/bokstedt-construction: classical THH is an orthogonal spectrum

**Acceptance.**

- The orthogonal sphere spectrum has X_n = S^n with the standard O(n)-action; π_0 = ℤ.
- π_i of an orthogonal spectrum agrees with π_i of its underlying symmetric spectrum (naive homotopy groups).

**Depends on.** `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`, `StableHomotopyKTheory:H.5:spectra/naive-homotopy-groups`, `StableHomotopyKTheory:H.5:spectra/stable-model-structure`, `EnhancedDerivedSheaves:E5:spectra-comparison`

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Definition II.2.1 (citing Schwede [85, Definition 1.1, §1]), Acta pp. 246-247: “Definition II.2.1. ([85, Definition 1.1, §1]) (1) An orthogonal spectrum X is the collection of (i) a pointed space Xn for all n⩾0, (ii) a continuous action of the orthogonal group O(n) on Xn , preserving the base point, and” — NS18 Definition II.2.1: orthogonal spectra, their homotopy groups and stable equivalences.

### `RT.2/genuine-g-spectra` — Genuine G-spectra, genuine and geometric fixed points

*Definition.* For a finite group G, orthogonal G-spectra are Fun(BG, Sp^O) with smash product and diagonal action, extended to representations by X(V) = L(ℝ^n, V)_+ ∧_{O(n)} X_n for dim V = n. A map is an equivalence if Φ^H f is a stable equivalence for every subgroup H ⊆ G, where the geometric fixed points Φ^GX have n-th space X(ℝ^n ⊗ ρ_G)^G (ρ_G the regular representation). The ∞-category GSp of genuine G-spectra is N(GSp^O)[equivalences^{−1}], symmetric monoidal via the cofibrant smash; Φ^H : GSp → Sp is symmetric monoidal; the genuine fixed points −^H : GSp → Sp come from set-theoretic fixed points of orthogonal G-Ω-spectra, with a lax symmetric monoidal transformation −^H → −^{hH} through the forgetful functor GSp → Sp^{BG}.

**Hypotheses.**

- G a finite group; spaces compactly generated.

**Construction and proof.**

1. Define orthogonal G-spectra and Φ^G (NS18 Definitions II.2.2–II.2.3); Φ^G is lax monoidal and strong on cofibrant objects (NS18 Proposition II.2.4).
2. Localise at the Φ^H-equivalences to get GSp (NS18 Definition II.2.5); construct −^H via fibrant replacement (G-Ω-spectra).
3. Construct the comparison −^H → −^{hH} from GSp → Sp^{BG}.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GenuineSpectrum` | data | GSp for a finite group G. |
| `GenuineSpectrum.fixedPoints` | projection | −^H : GSp → Sp, lax symmetric monoidal. |
| `GenuineSpectrum.geometricFixedPoints` | projection | Φ^H : GSp → Sp, symmetric monoidal. |
| `GenuineSpectrum.toBorel` | projection | The forgetful functor GSp → Sp^{BG} and the transformation −^H → −^{hH}. |
| `GenuineSpectrum.equiv_iff` | characterisation | A map is an equivalence iff all Φ^H are equivalences (H ⊆ G). |
| `GenuineSpectrum.burnside` | example | π_0((S_G)^G) ≅ A(G), the Burnside ring. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `GenuineSpectrum.trivialGroup` | degenerate | For G = 1, GSp ≃ Sp. |
| `GenuineSpectrum.burnside_C2` | computation | π_0(S_{C_2})^{C_2} ≅ ℤ², the Burnside ring of C_2. |
| `GenuineSpectrum.not_borel` | non-example | GSp → Sp^{BG} is not an equivalence: the C_2-sphere and its Borel completion have different genuine fixed points (A(C_2) versus ℤ ⊕ ℤ_2^∧). |

**Used by.**

- RT.2/genuine-cyclotomic-spectrum: genuine cyclotomic spectra are genuine C_{p^∞}- or T-spectra with Φ^{C_p}X ≃ X
- KTheoryFiniteLocalFields:L.4/tr-pro-spectrum: Hesselholt–Madsen's TR^n = T(C)^{C_{p^{n−1}}} uses genuine fixed points
- RT.4:q-Hodge/cyclonic-spectrum: cyclonic spectra use genuine C_m fixed points

**Acceptance.**

- For G trivial, GSp = Sp and −^G = Φ^G = id.
- π_0 of the genuine fixed points of the G-sphere is the Burnside ring A(G) (tom Dieck), not ℤ.

**Depends on.** `RT.2/orthogonal-spectra`, `RT.2/spectra-with-action`, `RT.2/homotopy-orbits-fixed-points`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Definition II.2.2 (Acta p. 247), Definition II.2.3 and Proposition II.2.4 (Acta p. 248); excerpt from Definition II.2.2: “Definition II.2.2. ([85, Definition 2.1]) An orthogonal G-spectrum is an orthogonal spectrum X with an action of G, i.e. the category GSpO of orthogonal G-spectra is given by Fun(BG, SpO ).” — NS18 Definitions II.2.2–II.2.3, Proposition II.2.4: orthogonal G-spectra and geometric fixed points.

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Definition II.2.5, Acta pp. 248-249: “Definition II.2.5. Let G be a finite group. (i) The ∞-category of genuine G-equivariant spectra is the ∞-category GSp obtained from N (GSpO ) by inverting equivalences of orthogonal G-spectra.” — NS18 Definition II.2.5: the ∞-category of genuine G-spectra with −^H and Φ^H.

### `RT.2/geometric-fixed-points` — Geometric fixed points via complete universes

*Construction.* For a finite group G with complete universe U (a countable sum of all irreducible representations) and H ⊆ G normal, Φ^H_U : GSp^O → (G/H)Sp^O has n-th space hocolim_{V ⊂ U, V^H = 0} X(ℝ^n ⊕ V)^H (Bousfield–Kan homotopy colimit), naturally zig-zag equivalent to Φ^G on G-spectra; for normal H ⊆ H′ ⊆ G, Φ^{H′/H}_{U^H} Φ^H_U X ≃ Φ^{H′}_U X (geometric fixed points compose).

**Hypotheses.**

- G finite; H ⊆ H′ normal subgroups; U a complete G-universe.

**Construction and proof.**

1. Define via the homotopy colimit over representations with V^H = 0 (NS18 Definitions II.2.9–II.2.10).
2. Zig-zag with Φ^G (NS18 Lemma II.2.11, with the correction V^G = 0 recorded in the extraction's sourceIssues E6).
3. Composition (NS18 Proposition II.2.12).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `geometricFixedPoints.universe` | data | Φ^H_U : GSp^O → (G/H)Sp^O. |
| `geometricFixedPoints.zigzag` | equivalence | Φ^G X ≃ Φ^G_U X naturally. |
| `geometricFixedPoints.comp` | relation | Φ^{H′/H}Φ^H ≃ Φ^{H′} for normal H ⊆ H′. |
| `geometricFixedPoints.suspension` | simp | Φ^G Σ^∞_G Y ≃ Σ^∞ Y^G. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `geometricFixedPoints.trivial` | degenerate | Φ^{1} = id. |
| `geometricFixedPoints.sphere` | computation | Φ^{C_p} S_{C_p} = S (fixed points of spheres of representations with V^{C_p} = 0 are S^0). |
| `geometricFixedPoints.not_fixed` | non-example | Φ^{C_p} ≠ −^{C_p}: for the C_p-sphere, π_0Φ^{C_p} = ℤ but π_0(S)^{C_p} = A(C_p) = ℤ². |

**Used by.**

- RT.2/genuine-cyclotomic-spectrum: the cyclotomic structure maps are Φ^{C_p}X ≃ X
- RT.2/isotropy-separation: the cofibre term of isotropy separation is (Φ^{C_p}X)^{G/C_p}

**Acceptance.**

- Φ^G of a suspension spectrum Σ^∞_G Y is Σ^∞ Y^G.
- For H′ = H the composition statement is the identity.

**Depends on.** `RT.2/genuine-g-spectra`

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Definition II.2.9 (Acta p. 251), Definition II.2.10 and Lemma II.2.11 (Acta p. 252), Proposition II.2.12 (Acta p. 253); excerpt is Definition II.2.9: “Definition II.2.9. A complete G-universe is a representation U of G on a countably dimensional inner product R-vector space that is a direct sum of countably many copies of each irreducible representation of G.” — NS18 Definitions II.2.9–II.2.10, Lemma II.2.11 and Proposition II.2.12: point-set geometric fixed points and their composition.

### `RT.2/borel-completion` — Borel-complete genuine spectra

*Theorem.* For a finite group G, the forgetful functor GSp → Sp^{BG} has a fully faithful right adjoint B_G whose essential image consists of the X with X^H → X^{hH} an equivalence for every H ⊆ G (Borel-complete genuine spectra); B_G is lax symmetric monoidal and id → B_G is a lax symmetric monoidal transformation.

**Hypotheses.**

- G finite.

**Construction and proof.**

1. Construct B_G by the adjoint functor theorem and compute (B_G Y)^H ≃ Y^{hH} using free G-cell objects (NS18 Theorem II.2.7, Corollary II.2.8).

**Acceptance.**

- (B_G Y)^G ≃ Y^{hG}.
- For Y = S with trivial action, B_G S has genuine fixed points S^{hG}.

**Depends on.** `RT.2/genuine-g-spectra`, `RT.2/homotopy-orbits-fixed-points`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Theorem II.2.7 (Acta p. 250; proof pp. 250-251) and Corollary II.2.8 (Acta p. 251) (text layer drops arrows): “Theorem II.2.7. The functor GSp SpBG admits a fully faithful right adjoint BG : SpBG GSp. The essential image of BG is the full subcategory of all X ∈GSp for which the natural map X H X hH is an equivalence for all subgroups H ⊆G;” — NS18 Theorem II.2.7: the fully faithful right adjoint to GSp → Sp^{BG}.

### `RT.2/isotropy-separation` — Isotropy separation for cyclic p-groups

*Theorem.* For G cyclic of p-power order and X ∈ GSp there is a natural fibre sequence X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p}; applied to X → B_G X it maps to the norm sequence X_{hG} → X^{hG} → X^{tG}, the right-hand square is lax symmetric monoidal, and this gives a lax symmetric monoidal structure on −^{tG} with −^{hG} → −^{tG} lax symmetric monoidal (agreeing with RT.2/tate-multiplicativity).

**Hypotheses.**

- G = C_{p^n}.

**Construction and proof.**

1. Isotropy separation cofibre sequence EG_+ ∧ X → X → ẼG ∧ X and identification of the fixed points of the terms (NS18 Proposition II.2.13).

**Acceptance.**

- For n = 1: X_{hC_p} → X^{C_p} → Φ^{C_p}X, the fundamental sequence used for TR.

**Depends on.** `RT.2/geometric-fixed-points`, `RT.2/borel-completion`, `RT.2/norm-map-tate`

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Proposition II.2.13 (attributed to Hesselholt–Madsen [47, Prop. 2.1]), Acta p. 254, with the following discussion pp. 254-255: “Proposition II.2.13. Let G be a cyclic group of p-power order, and H =Cp ⊆G be the subgroup of order p. For X ∈GSp there is a natural fiber sequence” — NS18 Proposition II.2.13: X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p} for cyclic p-groups.

### `RT.2/geometric-fixed-points-localisation` — Geometric fixed points as a localisation

*Theorem.* For H ⊆ G normal, Φ^H : GSp → (G/H)Sp has a fully faithful right adjoint R_H whose essential image is GSp_{≥H}, the X with Φ^N X ≃ 0 (equivalently X^N ≃ 0) for every N not containing H; on GSp_{≥H} the map −^H → Φ^H is an equivalence. For the right adjoint R_{C_p} on genuine C_{p^∞}- or F-genuine T-spectra, (R_{C_p}X)^H ≃ X^{H/C_p} if C_p ⊆ H and 0 otherwise.

**Hypotheses.**

- G finite (or C_{p^∞}, T with finite H as in RT.2/genuine-cyclic-and-circle-spectra).

**Construction and proof.**

1. Smashing localisation at ẼF[H] (NS18 Proposition II.2.14).
2. Fixed points of R_{C_p} (NS18 Corollary II.2.16).

**Acceptance.**

- For G = C_p, H = C_p: GSp_{≥C_p} ≃ Sp via Φ^{C_p}.

**Depends on.** `RT.2/geometric-fixed-points`, `RT.2/genuine-g-spectra`

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Proposition II.2.14 (Acta p. 255; proof pp. 255-256) and Corollary II.2.16 (Acta pp. 256-257) (text layer drops arrows): “Proposition II.2.14. Let G be a finite group, and H ⊆G be a normal subgroup. The functor ΦH : GSp (G/H)Sp has a fully faithful right adjoint RH : (G/H)Sp GSp.” — NS18 Proposition II.2.14 and Corollary II.2.16: Φ^H as a smashing localisation, fixed points of R_{C_p}.

### `RT.2/genuine-cyclic-and-circle-spectra` — Genuine C_{p^∞}-spectra and F-genuine T-spectra

*Definition.* C_{p^∞}Sp := lim_n C_{p^n}Sp along the forgetful (restriction) functors; TSp^O is orthogonal spectra with continuous T-action, an F-equivalence is a map inducing equivalences of orthogonal C_n-spectra for every finite C_n ⊂ T, and TSp_F is the localisation at F-equivalences. Genuine fixed points −^H and geometric fixed points Φ^H exist for finite H and satisfy RT.2/borel-completion and RT.2/geometric-fixed-points-localisation.

**Hypotheses.**

- Only finite subgroups of T are used (F-genuine, not fully genuine).

**Construction and proof.**

1. Form the limit of ∞-categories and the localisation (NS18 Definition II.2.15).
2. Transfer −^H, Φ^H and the two theorems levelwise.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GenuineCircleSpectrum` | data | TSp_F, the F-genuine T-spectra. |
| `GenuinePInftySpectrum` | data | C_{p^∞}Sp = lim_n C_{p^n}Sp. |
| `GenuineCircleSpectrum.fixedPoints` | projection | −^{C_n} : TSp_F → Sp^{B(T/C_n)} for finite C_n ⊂ T. |
| `GenuineCircleSpectrum.geometricFixedPoints` | projection | Φ^{C_n} : TSp_F → TSp_F via T/C_n ≅ T. |
| `GenuineCircleSpectrum.toBorel` | projection | Forget to Sp^{BT}. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `GenuineCircleSpectrum.zero` | degenerate | The zero object has all fixed points 0. |
| `GenuineCircleSpectrum.fixed_trivial` | computation | −^{C_1} is the underlying spectrum. |
| `GenuineCircleSpectrum.not_fully_genuine` | non-example | TSp_F does not see fixed points for T itself: X^T is not part of the structure (F-genuine only), unlike fully genuine T-spectra. |

**Used by.**

- RT.2/genuine-cyclotomic-spectrum: genuine cyclotomic spectra live in TSp_F (resp. C_{p^∞}Sp)
- RT.4:q-Hodge/cyclonic-spectrum: cyclonic spectra use genuine finite C_m fixed points of T-spectra

**Acceptance.**

- Restriction TSp_F → C_{p^∞}Sp → C_{p^n}Sp is compatible with −^{C_{p^k}}, k ≤ n.

**Depends on.** `RT.2/genuine-g-spectra`, `RT.2/borel-completion`, `RT.2/geometric-fixed-points-localisation`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`

**Source.** nikolaus-scholze-18, Chapter II, §II.2, Definition II.2.15, Acta p. 256 (text layer drops the arrow 'Cpn Sp → Cpn−1 Sp'): “Definition II.2.15. (i) The ∞-category Cp∞ Sp of genuine Cp∞ -equivariant spectra is the limit of the ∞-categories Cpn Sp, for Cpn ⊆Cp∞ varying along the forgetful functors Cpn Sp Cpn−1 Sp.(20 )” — NS18 Definition II.2.15: genuine C_{p^∞}-spectra and F-genuine T-spectra.

### `RT.2/genuine-cyclotomic-spectrum` — Genuine cyclotomic spectra

*Definition.* A genuine p-cyclotomic spectrum is X ∈ C_{p^∞}Sp with an equivalence Φ_p : Φ^{C_p}X ≃ X (via C_{p^∞}/C_p ≅ C_{p^∞}); CycSp_p^{gen} := Eq(C_{p^∞}Sp ⇉ C_{p^∞}Sp) of id and Φ^{C_p}. A genuine cyclotomic spectrum is X ∈ TSp_F with coherently commuting equivalences Φ_n : X ≃ Φ^{C_n}X, n ≥ 1: CycSp^{gen} := (TSp_F)^{hℕ_{>0}}. Composing Φ_p^{−1} with Φ^{C_p}X → Φ^{C_p}B(X) ≃ X^{tC_p} gives forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp (the latter constructed through coalgebras, NS18 §II.5–II.6; NS18 Proposition II.3.4's further identification of CycSp as a fibre product is false in general and is not used).

**Hypotheses.**

- Finite subgroups only (F-genuine).

**Construction and proof.**

1. Define as equalizers/homotopy fixed points of ∞-categories (NS18 Definitions II.3.1, II.3.3).
2. Construct the forgetful functors via the Borel completion map Φ^{C_p}X → Φ^{C_p}B_{C_p}X = X^{tC_p} (RT.2/borel-completion; NS18 Proposition II.3.2 and §II.6).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GenuineCyclotomicSpectrum` | structure | X ∈ TSp_F with coherent equivalences Φ_n : X ≃ Φ^{C_n}X. |
| `GenuineCyclotomicSpectrum.pTypical` | data | CycSp_p^{gen} = Eq(id, Φ^{C_p}). |
| `GenuineCyclotomicSpectrum.forget` | projection | CycSp^{gen} → CycSp, CycSp_p^{gen} → CycSp_p. |
| `GenuineCyclotomicSpectrum.restriction` | data | The restriction maps R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}}. |
| `GenuineCyclotomicSpectrum.instStable` | instance | CycSp^{gen} is stable. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `GenuineCyclotomicSpectrum.sphere` | computation | The genuine cyclotomic sphere has R : S^{C_p} → S equal to the projection A(C_p) → ℤ on π_0 onto the geometric part. |
| `GenuineCyclotomicSpectrum.zero` | degenerate | 0 is genuine cyclotomic. |
| `GenuineCyclotomicSpectrum.fibre_product_nonexample` | non-example | CycSp is not Sp^{BT} ×_{∏_p Sp^{BC_{p^∞}}} ∏_p CycSp_p in general (the second claim of NS18 Proposition II.3.4 as printed); the forgetful functor is constructed without it. |

**Used by.**

- RT.2/tr-and-genuine-tc: TR and TC^gen are defined on genuine cyclotomic spectra
- KTheoryFiniteLocalFields:L.4/hm-conventions-agree-with-nikolaus-scholze: Hesselholt–Madsen's T(C) is a genuine cyclotomic spectrum

**Acceptance.**

- THH(A) in the Bökstedt model is a genuine cyclotomic spectrum (RT.2/classical-thh).
- The genuine cyclotomic sphere has Φ^{C_n}S = S.

**Depends on.** `RT.2/genuine-cyclic-and-circle-spectra`, `RT.2/geometric-fixed-points`, `RT.2/borel-completion`, `RT.2/cyclotomic-spectrum`

**Source.** nikolaus-scholze-18, Chapter II, §II.3, Definition II.3.1 and Proposition II.3.2, Acta p. 257 (proof pp. 257-258) (in the text layer the '≃' over the arrow Φ_p is displaced): “Definition II.3.1. A genuine p-cyclotomic spectrum is a genuine Cp∞ -spectrum X ≃ together with an equivalence Φp : ΦCp X − X in Cp∞ Sp, where” — NS18 Definition II.3.1: genuine p-cyclotomic spectra.

**Source.** nikolaus-scholze-18, Chapter II, §II.3, Definition II.3.3 and Proposition II.3.4, Acta p. 259 (the universe U = ⊕_{k∈Z, i≥1} C_{k,i} and the N_{>0}-action are set up on p. 258): “Definition II.3.3. The ∞-category of genuine cyclotomic spectra is given by the homotopy fixed points of N>0 on the ∞-category of F-genuine T-equivariant spectra, Cyc Spgen = (TSpF )hN>0 .” — NS18 Definition II.3.3 and Proposition II.3.4: genuine cyclotomic spectra and the forgetful functor.

### `RT.2/orthogonal-cyclotomic-spectra` — Orthogonal cyclotomic spectra model genuine ones

*Theorem.* An orthogonal cyclotomic spectrum is X ∈ TSp^O with F-equivalences Φ_n : Φ^{C_n}_U X → X for all n ≥ 1 satisfying Φ_{mn} ∘ (Φ^{C_m}_U Φ^{C_n}_U X ≃ Φ^{C_{mn}}_U X) = Φ_n ∘ Φ^{C_n}_U(Φ_m); the functor N(CycSp^O) → CycSp^{gen} is the universal functor inverting the F-equivalences of orthogonal cyclotomic spectra (Barwick–Glasman).

**Hypotheses.**

- Point-set model with a complete T-universe U.

**Construction and proof.**

1. Define CycSp^O (NS18 Definition II.3.6).
2. Import the Barwick–Glasman comparison as stated in NS18 Theorem II.3.7 (cited theorem; its proof is outside NS18).

**Acceptance.**

- Bökstedt's THH of an orthogonal ring spectrum is an orthogonal cyclotomic spectrum (RT.2/classical-thh).

**Depends on.** `RT.2/genuine-cyclotomic-spectrum`, `RT.2/geometric-fixed-points`, `RT.2/orthogonal-spectra`

**Source.** nikolaus-scholze-18, Chapter II, §II.3, Definition II.3.6 (Acta p. 259) and Theorem II.3.7 (Acta p. 260); excerpt is Theorem II.3.7 (text layer drops the arrow 'N (Cyc SpO ) → Cyc Spgen'): “Theorem II.3.7. The morphism N (Cyc SpO ) Cyc Spgen is the universal functor of ∞-categories inverting the equivalences of orthogonal cyclotomic spectra.” — NS18 Definition II.3.6 and Theorem II.3.7: orthogonal cyclotomic spectra and the Barwick–Glasman comparison.

### `RT.2/tr-and-genuine-tc` — TR and genuine TC ★

*Planet:* TR and genuine TC.

*Definition.* For a genuine p-cyclotomic spectrum X with restriction R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}} and inclusion of fixed points F : X^{C_{p^n}} → X^{C_{p^{n−1}}}: TR^{n+1}(X; p) := X^{C_{p^n}}, TR(X, p) := lim_R X^{C_{p^n}}, and TC^{gen}(X, p) := Eq(TR(X, p) ⇉ TR(X, p)) for (id, F) ≃ lim_n Eq(X^{C_{p^n}} ⇉ X^{C_{p^{n−1}}}) for (R, F). For a genuine cyclotomic X, TC^{gen}(X) is the pullback X^{hT} ×_{∏_p (X^∧_p)^{hT}} ∏_p TC^{gen}(X, p)^∧_p (NS18 diagram (1), Goodwillie's corrected definition). The Verschiebung V : X^{C_{p^{n−1}}} → X^{C_{p^n}} is the transfer; R, F, V satisfy FV = p (multiplication by the Euler class/index on π_*), RF = FR, RV = VR, and for X = THH(A) of a commutative ring, π_0TR^{n}(A; p) ≅ W_n(A) with F, V, R the Witt vector Frobenius, Verschiebung and restriction (Hesselholt–Madsen; Mathlib WittVector).

**Hypotheses.**

- X a genuine (p-)cyclotomic spectrum.

**Construction and proof.**

1. Define TR and TC^gen as limits/equalizers in Sp (NS18 Definition II.4.4).
2. Integral TC^gen by the pullback (1) (NS18 p. 266 and footnote 22).
3. Define V as the transfer for C_{p^{n−1}} ⊂ C_{p^n} and record the relations (Hesselholt–Nikolaus survey §).
4. π_0 identification with Witt vectors is Hesselholt–Madsen's theorem, applied by KTheoryFiniteLocalFields L.4/pi0-tr-is-witt-vectors; here it is recorded as the convention check.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TR` | data | TR^{n+1}(X; p) = X^{C_{p^n}} and TR(X, p) = lim_R TR^n. |
| `TR.restriction` | projection | R : TR^{n+1} → TR^n. |
| `TR.frobenius` | projection | F : TR^{n+1} → TR^n (inclusion of fixed points). |
| `TR.verschiebung` | projection | V : TR^n → TR^{n+1} (transfer). |
| `TR.relations` | relation | RF = FR, RV = VR, FV = p on π_* (as a map of spectra: FV = multiplication by the index-p transfer class). |
| `TCgen` | constructor | TC^gen(X, p) = Eq(id, F on TR(X, p)) and integral TC^gen by the pullback (1). |
| `TR.pi0_witt` | compatibility | For THH(A), A commutative: π_0TR^n(A; p) ≅ W_n(A), with F, V, R matching Mathlib's WittVector.frobenius, WittVector.verschiebung and truncation. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TR.level_one` | degenerate | TR^1(X; p) = X. |
| `TR.Fp_pi0` | computation | π_0TR^n(𝔽_p; p) = ℤ/p^n. |
| `TR.not_TC` | non-example | TR(𝔽_p; p) ≠ TC(𝔽_p; p): π_0TR(𝔽_p; p) = ℤ_p but π_{−1}TR = 0 while π_{−1}TC(𝔽_p) = ℤ_p (TC needs the equalizer with F). |

**Used by.**

- KTheoryFiniteLocalFields:L.4/tr-pro-spectrum: the pro-spectrum TR^•(C;p) with R, F, V uses these conventions
- KTheoryFiniteLocalFields:L.4/p-typical-tc: TC = hofib(R − F) is the Hesselholt–Madsen convention, equal to TC^gen
- RT.2/genuine-tc-agrees: TC^gen ≃ TC for bounded below inputs

**Acceptance.**

- TR^1(X; p) = X (underlying spectrum).
- π_0TR^n(𝔽_p; p) = W_n(𝔽_p) = ℤ/p^n.

**Depends on.** `RT.2/genuine-cyclotomic-spectrum`, `RT.2/isotropy-separation`, `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266); excerpt is the sentence introducing (1): “Recall from [32, Lemma 6.4.3.2] Goodwillie’s definition of the integral topological cyclic homology for a genuine cyclotomic spectrum X in the sense of Definition II.3.3. It is defined(22 ) by the pullback square” — NS18 Definition II.4.4 and diagram (1): TR, TC^gen(X, p) and integral TC^gen.

### `RT.2/restriction-pullback` — The restriction pullback for genuine fixed points

*Theorem.* For a genuine C_{p^n}-spectrum X (n ≥ 1) there is a natural pullback square with top row X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} and bottom row X^{hC_{p^n}} → X^{tC_{p^n}}; if X is bounded below the bottom right can be replaced by (X^{tC_p})^{hC_{p^{n−1}}}, and iterating gives X^{C_{p^n}} as an iterated pullback of X^{hC_{p^k}}'s over Tate terms.

**Hypotheses.**

- X genuine C_{p^n}-spectrum; bounded below for the second statement.

**Construction and proof.**

1. Isotropy separation (RT.2/isotropy-separation) mapped to the norm sequence (NS18 Lemma II.4.5).
2. Replace X^{tC_{p^n}} by (X^{tC_p})^{hC_{p^{n−1}}} (RT.2/tate-cpn-via-cp; NS18 Proposition II.4.6), iterate (Corollary II.4.7).
3. Consequence used for the Segal-conjecture-type reductions (NS18 Corollary II.4.9): if X and its iterated geometric fixed points are bounded below and (Y^{C_p})^∧_p → (Y^{hC_p})^∧_p is an isomorphism on π_i for i ≥ k for each of them, then (X^{C_{p^n}})^∧_p → (X^{hC_{p^n}})^∧_p is an isomorphism on π_i for i ≥ k.

**Acceptance.**

- For n = 1: X^{C_p} = X^{hC_p} ×_{X^{tC_p}} Φ^{C_p}X.

**Depends on.** `RT.2/isotropy-separation`, `RT.2/tate-cpn-via-cp`, `RT.2/borel-completion`

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Lemma II.4.5, Proposition II.4.6 (Acta p. 263) and Corollary II.4.7 (Acta pp. 263-264); excerpt from Proposition II.4.6: “Proposition II.4.6. Let X be a genuine Cpn -equivariant spectrum. Assume that the underlying spectrum is bounded below. Then, for every n⩾1, there exists a canonical pullback square” — NS18 Lemma II.4.5, Proposition II.4.6 and Corollary II.4.7.

### `RT.2/genuine-tc-agrees` — Genuine and Nikolaus–Scholze TC agree on bounded below spectra ★

*Planet:* Genuine and modern TC agree.

*Theorem.* (i) For a genuine p-cyclotomic X with bounded below underlying spectrum, TC^{gen}(X, p) ≃ TC(X, p), naturally. (ii) For a genuine cyclotomic X with bounded below underlying spectrum, TC^{gen}(X) ≃ TC(X). In particular for every connective E_1-ring A, the classical (Bökstedt–Hsiang–Madsen–Goodwillie) TC(A) agrees with TC(THH(A)) of RT.2/topological-cyclic-homology.

**Hypotheses.**

- Bounded below underlying spectrum (connective A).

**Construction and proof.**

1. Use RT.2/restriction-pullback to rewrite TR(X, p) as a limit of homotopy fixed points and Tate terms; the equalizer with F becomes the fibre of φ^{hT} − can (NS18 Theorem II.4.10).
2. Integral version: the pullback (1) and RT.2/tc-p-completion (NS18 Theorem II.4.11).
3. For THH of a connective E_1-ring compare the two THH (RT.2/thh-models-agree).

**Acceptance.**

- For A = 𝔽_p both sides give π_* = ℤ_p in degrees 0 and −1 (p-adically).
- The bounded below hypothesis is needed: for unbounded X the two TC can differ (genuine TC of a periodic object is not computed by the formula).

**Depends on.** `RT.2/tr-and-genuine-tc`, `RT.2/restriction-pullback`, `RT.2/tc-fibre-sequence`, `RT.2/tc-p-completion`, `RT.2/thh-models-agree`

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Theorem II.4.10, Acta p. 265 (proof pp. 265-266; the displayed fibre sequence is garbled in the text layer): “Theorem II.4.10. Let X be a genuine p-cyclotomic spectrum such that the underlying spectrum is bounded below. Then, there is a canonical fiber sequence” — NS18 Theorem II.4.10: TC^gen(X, p) ≃ TC(X, p) for bounded below X.

**Source.** nikolaus-scholze-18, Chapter II, §II.4, Theorem II.4.11, Acta p. 267 (the displayed fibre sequence is garbled in the text layer): “Theorem II.4.11. Let X be a genuine cyclotomic spectrum such that the underlying spectrum is bounded below. Then, there is a canonical fiber sequence” — NS18 Theorem II.4.11: TC^gen(X) ≃ TC(X) for bounded below X.

**Source.** nikolaus-scholze-18, Chapter II, §II.3, Theorem II.3.8, Acta pp. 260-261; Theorem 1.4, Introduction, Acta p. 209 (proved in Theorems II.4.10, II.4.11, II.6.3, II.6.9): “Theorem II.3.8. (i) Let X ∈Cyc Spgen be a genuine cyclotomic spectrum whose underlying spectrum is bounded below. Then, there is an equivalence of spectra TCgen (X) ≃ TC(X).” — NS18 Theorem II.3.8 (and Theorem 1.4): the comparison of genuine and naive TC.

### `RT.2/endofunctor-coalgebras` — Coalgebras and fixed points of endofunctors

*Definition.* For an endofunctor F of an ∞-category C, CoAlg_F(C) := LEq(id_C, F) (objects c → F(c)) and Fix_F(C) := Eq(id_C, F) ⊆ CoAlg_F(C) (objects c ≃ F(c)). If C is presentable and F accessible, the inclusion Fix_F(C) → CoAlg_F(C) has a right adjoint (coreflection) R_F̄, computed by the formula of NS18 Lemma II.5.4 as a limit of iterates; there are versions for families of commuting endofunctors (one prime at a time).

**Hypotheses.**

- C presentable, F accessible (for the coreflection).

**Construction and proof.**

1. Define via lax equalizers and equalizers (NS18 Definition II.5.1); construct the shifted coalgebra and its right adjoint (Construction II.5.2).
2. Prove the coreflection (Proposition II.5.3) and the formula (Lemma II.5.4).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `Endofunctor.CoAlg` | data | CoAlg_F(C) = LEq(id, F). |
| `Endofunctor.Fix` | data | Fix_F(C) = Eq(id, F) ⊆ CoAlg_F(C). |
| `Endofunctor.coreflection` | universal-property | The right adjoint R_F̄ to Fix_F → CoAlg_F for C presentable and F accessible. |
| `Endofunctor.coreflection_formula` | characterisation | If F has a fully faithful right adjoint R_F and preserves pullbacks, R_F̄(X → FX) has underlying object R_FX ×_{R_FFX} X (NS18 Lemma II.5.4), and ιR_ι ≃ lim(⋯ → R_F̄² → R_F̄ → id) (Proposition II.5.3). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `Endofunctor.Fix_id` | degenerate | For F = id_C, CoAlg_F(C) has objects (c, f : c → c) and Fix_F(C) those with f an equivalence, i.e. Fun(Bℤ, C). |
| `Endofunctor.CoAlg_zero` | computation | For F = 0 (constant at the zero object), CoAlg_F(C) ≃ C and Fix_F(C) = {0}. |
| `Endofunctor.fix_not_coalg` | non-example | A coalgebra c → Fc that is not an equivalence (e.g. 0 → F0 ≠ 0 when F(0) ≠ 0) is not in Fix_F. |

**Used by.**

- RT.2/genuine-cyclotomic-coreflection: genuine cyclotomic spectra coreflect into coalgebras
- RT.2/bounded-below-cyclotomic-equivalence: the comparison CycSp^{gen} → CycSp is built through coalgebras

**Acceptance.**

- For F = Φ^{C_p} on C_{p^∞}Sp, Fix_F = CycSp_p^{gen}.

**Depends on.** `RT.2/lax-equalizer`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`

**Source.** nikolaus-scholze-18, Chapter II, §II.5, Definition II.5.1 (Acta pp. 267-268), Construction II.5.2 (Acta pp. 268-269), Proposition II.5.3 (Acta p. 269), Lemma II.5.4 (Acta p. 270); excerpt from Definition II.5.1 (text layer drops arrows): “Definition II.5.1. Let C be an ∞-category and F : C C be an endofunctor. Then an F -coalgebra is given by an object X ∈C together with a morphism X F X.” — NS18 Definition II.5.1, Construction II.5.2, Proposition II.5.3 and Lemma II.5.4.

### `RT.2/genuine-cyclotomic-coreflection` — Genuine cyclotomic spectra coreflect

*Theorem.* The inclusion of genuine p-cyclotomic spectra into coalgebras for Φ^{C_p} on C_{p^∞}Sp has a right adjoint (NS18 Theorem II.5.6), and likewise genuine cyclotomic spectra into coalgebras for the commuting family (Φ^{C_p})_p on TSp_F (NS18 Theorem II.5.13), using the lemmas on endofunctors with terminal composites, commuting endofunctors, one prime at a time, and the commutation of geometric fixed points with R_{C_q} (Lemmas II.5.8–II.5.12).

**Hypotheses.**

- Presentability; the endofunctors are accessible.

**Construction and proof.**

1. Apply RT.2/endofunctor-coalgebras to Φ^{C_p} (NS18 Theorem II.5.6).
2. Handle all primes via commuting endofunctors and R_{C_q} (NS18 Lemmas II.5.8–II.5.12, Theorem II.5.13).

**Acceptance.**

- The coreflection of a genuine cyclotomic spectrum is itself.

**Depends on.** `RT.2/endofunctor-coalgebras`, `RT.2/genuine-cyclotomic-spectrum`, `RT.2/geometric-fixed-points-localisation`

**Source.** nikolaus-scholze-18, Chapter II, §II.5, Theorem II.5.6 (Acta p. 271; proof p. 272) and Theorem II.5.13 (Acta p. 277; proof pp. 277-278) (text layer drops the arrow 'ιRι → id'): “Theorem II.5.6. The inclusion ι: Cyc Spgen p ⊆CoAlgΦCp (Cp∞ Sp) admits a right adjoint Rι such that the counit ιRι id of the adjunction induces an equivalence of underlying non-equivariant spectra.” — NS18 Theorems II.5.6 and II.5.13: genuine (p-)cyclotomic spectra coreflect.

### `RT.2/bounded-below-cyclotomic-equivalence` — Genuine and naive cyclotomic spectra agree on bounded below objects

*Theorem.* The forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp restrict to equivalences between the full subcategories of objects with bounded below underlying spectrum (NS18 Theorems II.6.3 and II.6.9).

**Hypotheses.**

- Bounded below underlying spectra.

**Construction and proof.**

1. Φ^{C_p} preserves Borel-completeness on bounded below objects (NS18 Lemma II.6.1, via the Tate orbit lemma) — RT.2/tate-orbit-lemma.
2. Construct the right adjoint on bounded below p-cyclotomic spectra and show unit and counit are equivalences (Lemma II.6.2, Theorem II.6.3).
3. Integral version for F-genuine T-spectra (Lemmas II.6.6, II.6.8, Theorem II.6.9).

**Acceptance.**

- THH of a connective E_1-ring in the Bökstedt model and in the NS model correspond under the equivalence (RT.2/thh-models-agree).

**Depends on.** `RT.2/genuine-cyclotomic-coreflection`, `RT.2/tate-orbit-lemma`, `RT.2/borel-completion`, `RT.2/cyclotomic-spectrum`

**Source.** nikolaus-scholze-18, Chapter II, §II.6, Theorem II.6.3, Acta p. 280 (key inputs Lemmas II.6.1-II.6.2, p. 279); excerpt from arXiv v2 p. 64 (in the Acta text layer the phrase '→ Cyc Spp induces an equivalence' is displaced before the theorem label): “Theorem II.6.3. The forgetful functor CycSpgen p → CycSpp induces an equivalence between the subcategories of those objects whose underlying non-equivariant spectra are bounded below.” — NS18 Theorem II.6.3: bounded below genuine and naive p-cyclotomic spectra agree.

**Source.** nikolaus-scholze-18, Chapter II, §II.6, Theorem II.6.9, Acta p. 283 (proof p. 284) (text layer drops the arrow 'Cyc Spgen → Cyc Sp'); = Theorem 1.4 of the Introduction (p. 209): “Theorem II.6.9. The forgetful functor Cyc Spgen Cyc Sp induces an equivalence between the subcategories of those objects whose underlying non-equivariant spectra are bounded below.” — NS18 Theorem II.6.9: bounded below genuine and naive cyclotomic spectra agree.

### `RT.2/bokstedt-construction` — The Bökstedt construction and classical THH

*Definition.* Bökstedt's category I has objects the finite sets n = {1,…,n} (including ∅) and injections; for an orthogonal ring spectrum A, the Bökstedt construction is the cyclic orthogonal spectrum [k] ↦ hocolim_{(i_0,…,i_k) ∈ I^{k+1}} Map(S^{i_0} ∧ … ∧ S^{i_k}, A_{i_0} ∧ … ∧ A_{i_k} ∧ −) (with the approximation lemma for hocolims over I, NS18 Lemma III.4.2 and Definition III.4.3); it preserves stable equivalences of (suitably cofibrant/convergent) inputs (Shipley), models the smash product (NS18 Theorem III.4.5) and has geometric fixed points computed by NS18 Theorem III.4.7. Classical THH(A) is its realisation, an orthogonal cyclotomic spectrum (NS18 Definition III.5.1, Proposition III.5.4).

**Hypotheses.**

- A an orthogonal ring spectrum (cofibrancy/convergence as in NS18 §III.4).

**Construction and proof.**

1. Define I and prove the approximation lemma (NS18 Lemma III.4.2).
2. Define B(X) and import Shipley's invariance (NS18 Theorem III.4.4); prove it models ⊗ (Theorem III.4.5) and compute Φ^{C_p} (Theorem III.4.7).
3. Assemble the cyclic structure and the cyclotomic structure maps for classical THH (Definition III.5.1, Proposition III.5.4).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `BokstedtCategory` | data | Bökstedt's I: finite sets and injections. |
| `Bokstedt.construction` | constructor | B(X) for an orthogonal spectrum-valued I^{k+1}-diagram. |
| `Bokstedt.preserves_equiv` | characterisation | B preserves stable equivalences (Shipley). |
| `Bokstedt.classicalTHH` | data | Classical THH(A) as an orthogonal cyclotomic spectrum. |
| `Bokstedt.geometricFixedPoints` | compatibility | Φ^{C_p} of the p-fold subdivided Bökstedt construction is the Bökstedt construction of the edgewise piece (NS18 Theorem III.4.7). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `Bokstedt.sphere` | degenerate | Classical THH(S) ≃ S. |
| `Bokstedt.pi0` | computation | π_0 classical THH(HR) = R/[R,R] for a discrete ring R. |
| `Bokstedt.naive_nonexample` | non-example | The naive cyclic bar construction A^{∧(k+1)} of orthogonal spectra (without Bökstedt's hocolim) does not have the correct geometric fixed points: Φ^{C_p} of its subdivision is not the Bökstedt term, which is why the Bökstedt construction is used. |

**Used by.**

- RT.2/thh-models-agree: compared with NS18's THH
- KTheoryFiniteLocalFields:L.4/thh-of-linear-waldhausen-category: Hesselholt–Madsen use Bökstedt's model T(C)

**Acceptance.**

- For A = S (orthogonal sphere), classical THH(S) ≃ S as orthogonal cyclotomic spectra.

**Depends on.** `RT.2/orthogonal-spectra`, `RT.2/orthogonal-cyclotomic-spectra`, `RT.2/geometric-fixed-points`, `RT.2/cyclic-realisation`

**Source.** nikolaus-scholze-18, Chapter III, §III.4: Lemma III.4.2 (Acta p. 303), Definition III.4.3 (Acta p. 304), Theorem III.4.4 (Acta p. 305), Theorem III.4.5 (Acta p. 306), Construction III.4.6 (p. 307), Theorem III.4.7 (Acta p. 308); excerpt is the sentence following the proof of Theorem III.4.5 (p. 306): “In other words, we have verified that the Bökstedt construction is a model for the ∞-categorical tensor product of spectra.” — NS18 Lemma III.4.2, Definition III.4.3, Theorems III.4.4, III.4.5, III.4.7: the Bökstedt construction.

**Source.** nikolaus-scholze-18, Chapter III, §III.5, Definition III.5.1 (Acta p. 311), Lemma III.5.2 (p. 312), Proposition III.5.4 (Acta p. 314), with the construction of Φ_p on pp. 315-316: “Definition III.5.1. Let R be an orthogonal ring spectrum. (i) For any pointed space X, define a pointed space with T-action THH(R; X) as the geometric realization of the cyclic space(27 ) sending [k]Λ ∈Λop , k⩾1, to” — NS18 Definition III.5.1 and Proposition III.5.4: classical THH as an orthogonal cyclotomic spectrum.

### `RT.2/thh-models-agree` — The two THH agree as cyclotomic spectra

*Theorem.* For a connective E_1-ring A (modelled by an orthogonal ring spectrum), the underlying T-spectrum of classical (Bökstedt) THH(A) is equivalent to THH(A) of RT.2/thh-e1-ring (NS18 Theorem III.6.1), and the Frobenius maps agree: under the equivalence of RT.2/bounded-below-cyclotomic-equivalence, classical THH(A) ∈ CycSp^{gen} maps to THH(A) ∈ CycSp (NS18 Theorem III.6.7, Corollary III.6.8).

**Hypotheses.**

- A connective (bounded below for the cyclotomic comparison).

**Construction and proof.**

1. Compare cyclic objects via RT.2/bokstedt-construction (models ⊗) (NS18 Theorem III.6.1).
2. Models of geometric fixed points (NS18 Proposition III.6.6) and uniqueness of the comparison of Frobenii via the uniqueness of the Tate diagonal (NS18 Theorem III.6.7, RT.2/tate-diagonal).
3. Point-set inputs from NS18 Appendix C: the reduced homotopy colimit of orthogonal spectra is homotopical and models the ∞-categorical colimit (Proposition C.11), and genuine fixed points of orthogonal G-spectra commute with geometric realisations and homotopy colimits (Lemmas C.12–C.13, Proposition C.14).

**Acceptance.**

- Applied to HF_p: Bökstedt's π_*THH(𝔽_p) = 𝔽_p[σ] is π_* of NS18's THH(𝔽_p).

**Depends on.** `RT.2/bokstedt-construction`, `RT.2/thh-e1-ring`, `RT.2/cyclotomic-frobenius-thh`, `RT.2/tate-diagonal`, `RT.2/bounded-below-cyclotomic-equivalence`

**Source.** nikolaus-scholze-18, Chapter III, §III.6, Theorem III.6.1 (Acta pp. 316-317), Theorem III.6.7 (Acta p. 322), Corollary III.6.8 (Acta p. 324); excerpt from Corollary III.6.8 (text layer drops the arrows 'S 0 → R0' and 'THH(A) → THH(A)tCp'): “Corollary III.6.8. Let R be an orthogonal ring spectrum which is levelwise wellpointed and such that the unit S 0 R0 is an h-cofibration. Then, under the equivalence of Theorem III.6.1 the two constructions of cyclotomic structure maps THH(A) THH(A)tCp ,” — NS18 Theorem III.6.1, Theorem III.6.7, Corollary III.6.8: comparison of the two THH as cyclotomic spectra.

## RT.3. The trace and relative comparison

The cyclotomic trace K → TC is the natural transformation of localizing invariants induced by THH
through noncommutative motives; it lifts the Dennis trace and is the unique multiplicative such map.
The Dundas–Goodwillie–McCarthy theorem says relative K-theory equals relative TC for nilpotent
extensions of connective ring spectra. Its proof is planned through its named inputs: Goodwillie
derivatives, stable K-theory = THH (Dundas–McCarthy), stable TC = THH compatibly with the trace, and
a convergence step reducing nilpotent extensions to split square-zero ones. Goodwillie's rational
theorem and the truncation of K^inv follow, and with Land–Tamme's excision for truncating invariants
the obstruction to excision for K is that for TC (rationally, for HC).

**Planets.** Cyclotomic trace, Dundas–Goodwillie–McCarthy theorem, Goodwillie's rational theorem.

**Within this roadmap it uses** RT.1, RT.2.

**From other roadmaps and the libraries it uses** `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus`, `GeneralAlgebraicKTheory:K.4`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `K2SymbolsBrauer:T.6/dennis-stein-symbol`, `K2SymbolsBrauer:T.6/relative-square-zero`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/rationalisation`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`.

**Acceptance tests of the layer.** Each node below lists its acceptance properties; the layer is accepted when every node's acceptance list and every unit test holds.

### `RT.3/localizing-invariants` — Localizing and truncating invariants

*Definition.* A sequence A → B → C of small idempotent-complete stable ∞-categories is exact if the composite is zero, A → B is fully faithful and Idem(B/A) → C is an equivalence. A localizing invariant with values in a stable ∞-category T is a functor E : Cat^{perf}_∞ → T sending exact sequences to fibre sequences (no filtered-colimit condition, following Land–Tamme; Blumberg–Gepner–Tabuada additionally require filtered colimits, and additive invariants only see split-exact sequences). E is truncating if E(A) → E(τ_{≤0}A) = E(π_0A) is an equivalence for every connective E_1-ring A (E evaluated on Perf). Nonconnective K-theory IK, THH, TC and the TC^n are localizing; connective K is additive but not localizing.

**Hypotheses.**

- Small stable ∞-categories (EnhancedDerivedSheaves E5:abstract); for rings, E(A) := E(Perf(A)).

**Construction and proof.**

1. Define exact (Verdier) sequences and localizing invariants as above (Land–Tamme Definition 1.2; BGT Definition 8.1).
2. Record the examples: IK (GeneralAlgebraicKTheory K.6 nonconnective spectrum, extended to small stable ∞-categories), THH (RT.2/thh-spectral-categories), TC (exact functor of THH).
3. Define truncating invariants (Land–Tamme Definition 3.1).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `LocalizingInvariant` | structure | A functor Cat^{perf}_∞ → T sending exact sequences to fibre sequences. |
| `LocalizingInvariant.morita` | characterisation | Localizing invariants invert Morita equivalences (A → B with Idem(A) ≃ Idem(B)). |
| `LocalizingInvariant.ofRing` | constructor | E(A) := E(Perf(A)) for an E_1-ring A. |
| `TruncatingInvariant` | structure | A localizing invariant with E(A) ≃ E(π_0A) for connective A. |
| `LocalizingInvariant.fib` | other | Fibres of natural transformations of localizing invariants are localizing. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `LocalizingInvariant.zero` | degenerate | E(0) ≃ 0 for every localizing invariant. |
| `LocalizingInvariant.THH_example` | computation | THH is localizing: THH(Perf(A)) ≃ THH(A). |
| `LocalizingInvariant.connective_K_nonexample` | non-example | Connective K is not localizing: some exact sequence A → B → C of small stable ∞-categories is not sent to a fibre sequence, because K_0(B) → K_0(C) need not be surjective (its cokernel is measured by K_{−1}(A), Thomason–Trobaugh); nonconnective K repairs this (BGT: connective K is additive but not localizing). For regular rings such as Perf(ℤ)_{p-tors} → Perf(ℤ) → Perf(ℤ[1/p]) the sequence happens to be a fibre sequence, so a witness needs negative K-theory. |

**Used by.**

- RT.3/cyclotomic-trace: the trace is a natural transformation of localizing invariants
- RT.3/truncating-excision: truncating invariants satisfy excision and nil-invariance
- RT.5: localizing motives corepresent localizing invariants

**Acceptance.**

- IK, THH, TC are localizing; K^{inv} = fib(IK → TC) is localizing (RT.3/kinv).
- HP(−⊗ℚ/ℚ) is truncating (Goodwillie; RT.3/goodwillie-rational).

**Depends on.** `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `RT.2/thh-spectral-categories`, `RT.2/topological-cyclic-homology`

**Source.** bgt-13, §8.3, Definition 8.1, p. 52: “A functor E : Catex∞ −→ D is called a localizing invariant of small stable ∞-categories if it inverts Morita equivalences (see definition 2.14), preserves filtered colimits, and satisfies localization, i.e., sends exact sequences A −→ B −→ C of small stable ∞-categories” — Land–Tamme Definition 1.2 / BGT Definition 8.1: localizing invariants send exact sequences of small stable ∞-categories to fibre sequences.

**Source.** land-tamme-19, §3, Definition 3.1, p. 28: “Definition 3.1. Let E : Catperf∞ → T be a localizing invariant. Then E is said to be truncating if for every connective E1-ring spectrum A, the canonical map E(A) → E(π0(A)) is an equivalence.” — Land–Tamme: truncating invariants.

### `RT.3/dennis-trace` — The Dennis trace

*Construction.* The topological Dennis trace is the natural transformation of additive invariants K → THH on small stable ∞-categories corresponding to 1 ∈ π_0Nat(K, THH) ≅ π_0THH(S) = ℤ; on objects it sends x to id_x ∈ C(x,x), a 0-simplex of the cyclic nerve. Composed with linearisation THH(A) → HH(A/ℤ) it gives the classical Dennis trace K_n(A) → HH_n(A/ℤ); in degree 0 it is the Hattori–Stallings trace K_0(A) → A/[A,A], [P] ↦ trace of an idempotent representing P; in degree 1 the class of a unit u ∈ A^× ⊂ K_1(A) maps to the class of u^{−1} ⊗ u ∈ HH_1(A) up to the sign convention of the source (for commutative A, d log u ∈ Ω¹_A).

**Hypotheses.**

- K connective K-theory of small stable ∞-categories (GeneralAlgebraicKTheory K.4, K.2:plus for rings).

**Construction and proof.**

1. Nat(K, THH) ≃ THH(S) ≃ S (BGT Corollary 10.4, Yoneda for the corepresenting additive motive); take the class 1 (BGT Theorem 10.6).
2. Describe it on S_•-constructions: an object goes to its identity endomorphism (BGT §10.3).
3. Linearise via RT.2/thh-over-thhz and compute degrees 0 and 1.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `dennisTrace` | data | K → THH as a natural transformation of additive invariants. |
| `dennisTrace.toHH` | projection | K_n(A) → HH_n(A/ℤ) after linearisation. |
| `dennisTrace.degree_zero` | simp | On K_0: the Hattori–Stallings trace [P] ↦ tr(e). |
| `dennisTrace.degree_one` | simp | On a unit u ∈ K_1(A): u ↦ [u^{−1}⊗u] ∈ HH_1(A). |
| `dennisTrace.natural` | functoriality | Natural in exact functors of small stable ∞-categories. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `dennisTrace.free_module` | computation | [A^n] ↦ n ∈ A/[A,A]. |
| `dennisTrace.zero_category` | degenerate | On the zero category the trace is 0 → 0. |
| `dennisTrace.not_iso` | non-example | The Dennis trace K_1(ℤ) = ℤ/2 → HH_1(ℤ) = 0 is not injective: it is not an isomorphism in general. |

**Used by.**

- RT.3/cyclotomic-trace: the cyclotomic trace lifts the Dennis trace through TC
- RT.3/low-degree-tests: degree-0 and degree-1 formulas test the trace

**Acceptance.**

- Degree 0: K_0(A) → HH_0(A) = A/[A,A] sends [A^n] ↦ n.
- Degree 1, A = ℤ[t^{±1}]: [t] ↦ t^{−1}dt (d log t).
- In degree 0 the Dennis trace of a perfect module agrees with the Chern character of DGAInfinity layer 9 in HH_0 (both are the Hattori–Stallings trace of an idempotent), the comparison asked for by RT-AREA-ktheory-2/44.

**Depends on.** `GeneralAlgebraicKTheory:K.4`, `GeneralAlgebraicKTheory:K.2:plus`, `RT.2/thh-spectral-categories`, `RT.2/thh-over-thhz`, `RT.3/localizing-invariants`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions`

**Source.** bgt-13, §1.4, Corollary 1.13, p. 7 (proved in §10, Corollary 10.4 and Theorem 10.6): “the topological Dennis trace is characterized up to homotopy as the natural transformation K → THH corresponding to the unit 1 ∈ Z. That is, up to scaling, the trace is the only natural transformation of additive invariants between connective algebraic K-theory and THH.” — BGT Corollary 1.13 and Theorem 10.6: the Dennis trace is the generator of natural transformations K → THH.

**Source.** blumberg-mandell-12, §9 (cyclotomic trace from non-connective K), paragraph before the proof of Theorem 9.1, p. 41: “Since the Dennis trace map takes the element t in K1(Z[t, t−1]) to the element tσt−1 = −t−1σt in HH1(Z[t, t−1]), multiplication by the image of t under the trace to THH also provides an isomorphism from π∗−1THH(R) to the cokernel for π∗THH.” — Blumberg–Mandell §9: the Dennis trace on the unit t ∈ K_1(ℤ[t^{±1}]).

### `RT.3/cyclotomic-trace` — The cyclotomic trace ★

*Planet:* Cyclotomic trace.

*Construction.* There is a natural transformation tr : IK → TC of localizing invariants of small stable ∞-categories, the cyclotomic trace, lifting the Dennis trace along TC → THH. Construction (Hesselholt–Nikolaus, following Blumberg–Gepner–Tabuada): THH : Cat^{perf}_∞ → CycSp is a localizing, Morita invariant functor to a stable ∞-category, so it factors as tr ∘ z through the universal localizing invariant z : Cat^{perf}_∞ → NMot; then IK(C) ≃ map_{NMot}(z(Perf(S)), z(C)) (corepresentability) maps to map_{CycSp}(S^{triv}, THH(C)) = TC(C). For an E_1-ring A, tr : K(A) → TC(A) on connective K-theory is the composite with K → IK; it is natural in exact functors.

**Hypotheses.**

- Small stable ∞-categories; TC of RT.2/topological-cyclic-homology.

**Construction and proof.**

1. THH is localizing and Morita invariant with values in CycSp (RT.2/thh-spectral-categories, RT.2/cyclotomic-spectrum).
2. Universal property of noncommutative motives NMot and corepresentability of IK (BGT Theorem 1.3/9.8; the version without filtered colimits is used by Hesselholt–Nikolaus and is recorded as an import from RT.5's localizing motives when it lands; here we use BGT's filtered-colimit version, which suffices since IK and THH preserve filtered colimits).
3. Define tr on mapping spectra; check that TC → THH ∘ tr is the Dennis trace (compare classes in π_0Nat(K, THH) = ℤ).
4. Infinite-loop-space description via the S_•-construction (Hesselholt–Nikolaus §1.1.2).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `cyclotomicTrace` | data | tr : IK → TC, natural transformation of localizing invariants. |
| `cyclotomicTrace.ofRing` | constructor | tr : K(A) → TC(A) for an E_1-ring A. |
| `cyclotomicTrace.lifts_dennis` | compatibility | TC → THH composed with tr is the Dennis trace. |
| `cyclotomicTrace.natural` | functoriality | Natural in exact functors, with identities and composition. |
| `cyclotomicTrace.relative` | other | Induces K(f) → TC(f) on fibres for every map f (RT.3/relative-trace). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `cyclotomicTrace.sphere_unit` | computation | On π_0 for A = S: ℤ → π_0TC(S) = ℤ, 1 ↦ 1. |
| `cyclotomicTrace.zero` | degenerate | On the zero ring both sides vanish. |
| `cyclotomicTrace.not_equivalence` | non-example | tr : K(𝔽_p) → TC(𝔽_p) is not an equivalence: π_{−1}TC(𝔽_p) ≅ ℤ_p (NS18 §IV.4) while K_{−1}(𝔽_p) = 0. |

**Used by.**

- RT.3/dgm-theorem: relative K and TC agree via tr on nilpotent extensions
- KTheoryFiniteLocalFields:L.4/k-tc-localization-square: the trace from K-theory localisation to TC localisation
- KTheoryFiniteLocalFields:L.5/trace-equivalence-finite-witt-algebras: Hesselholt–Madsen Theorem D: K(A)^∧_p ≃ τ_{≥0}TC(A;p)^∧_p via tr

**Acceptance.**

- The composite S → K(S) → TC(S) → THH(S) = S is the identity.
- For A = 𝔽_p, tr : K(𝔽_p) → TC(𝔽_p) is an isomorphism on π_0 (ℤ → ℤ_p after completion).

**Depends on.** `RT.3/dennis-trace`, `RT.3/localizing-invariants`, `RT.2/topological-cyclic-homology`, `RT.2/thh-spectral-categories`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`

**Source.** hesselholt-nikolaus-19, §1.1.2 'Topological cyclic homology and the trace', p. 10: “Accordingly, the functor THH admits a unique factorization Catstab∞ →z NMot →tr CycSp with tr exact. In particular, for every stable ∞-category C, we have an induced map of mapping spectra mapNMot(z(PerfS), z(C)) →tr mapCycSp(Striv, THH(C)).” — Hesselholt–Nikolaus §1.1.2: the cyclotomic trace K(C) → TC(C) via noncommutative motives.

**Source.** bgt-13, §10.3, Theorem 10.11, p. 77 (with Lemmas 10.9-10.10): “Theorem 10.11. After p-completion, the set of homotopy classes of compatible localizing invariants {K → TCn} is isomorphic to Zp. The cyclotomic trace is represented by 1 ∈ Zp.” — BGT Theorem 10.11: the cyclotomic trace as the generator of natural transformations K → TC.

### `RT.3/trace-uniqueness-multiplicative` — Uniqueness and multiplicativity of the trace

*Theorem.* In the presentably symmetric monoidal ∞-category of additive invariants (Day convolution, unit connective K), THH is an E_∞-algebra and the space of E_∞-algebra maps K → THH is contractible; its unique point is the Dennis trace. Likewise for each TC^n (Bökstedt–Hsiang–Madsen at a prime p), and the multiplicative cyclotomic trace is the unique homotopy class of E_∞-maps K → TC restricting to E_∞-maps K → TC^n; the same holds for IK among localizing invariants. Consequently tr is lax symmetric monoidal: for commutative A, tr : K(A) → TC(A) is a map of E_∞-rings, compatible with the products of GeneralAlgebraicKTheory K.7.

**Hypotheses.**

- Additive (resp. localizing) invariants of small idempotent-complete stable ∞-categories.

**Construction and proof.**

1. K (resp. IK) is the tensor unit of additive (resp. localizing) invariants, hence initial among E_∞-algebras (BGT 2014, Theorem 1.5, Corollary 1.6).
2. THH and TC^n are E_∞-algebras there (Theorem 1.10, Corollaries 6.9, 6.15).
3. Conclude contractibility (Theorems 1.11, 1.12) and identify the point with the Dennis trace via π_0Nat(K, THH) = ℤ.

**Acceptance.**

- For commutative A, the trace K_*(A) → TC_*(A) is a ring homomorphism (products of K.7 on the source).

**Depends on.** `RT.3/cyclotomic-trace`, `RT.3/dennis-trace`, `RT.2/thh-symmetric-monoidal`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`

**Source.** bgt-14, §1, Theorem 1.11 (= Theorem 7.3), p. 5: “Theorem 1.11. (see Theorem 7.3) The space of maps of E∞ algebras from K to THH in Funadd(Catperf∞, S∞)⊗ is contractible. Equivalently, the space of natural transformations of lax symmetric monoidal functors from K → THH in Funlax add(Catperf∞, S∞) is contractible.” — BGT 2014 Theorems 1.11–1.12: contractible space of E_∞-maps K → THH, and the multiplicative cyclotomic trace.

### `RT.3/relative-trace` — Relative K-theory, relative TC and K^inv

*Construction.* For a map f : A → B of E_1-rings (in particular a ring and a two-sided ideal, A → A/I), relative K-theory K(f) := fib(K(A) → K(B)) (GeneralAlgebraicKTheory K.5/relative-K-theory) and relative TC(f) := fib(TC(A) → TC(B)), and tr induces K(f) → TC(f). The invariant K^{inv} := fib(IK → TC) (and its connective version fib(K → TC)) is a localizing invariant; K(f) → TC(f) is an equivalence iff K^{inv}(A) → K^{inv}(B) is.

**Hypotheses.**

- f a map of E_1-rings; K connective or nonconnective as stated.

**Construction and proof.**

1. Take fibres of the natural transformation tr (RT.3/cyclotomic-trace).
2. The 3×3 lemma identifies fib(K^{inv}(A) → K^{inv}(B)) with fib(K(f) → TC(f)).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `relativeK` | data | K(f) = fib(K(A) → K(B)). |
| `relativeTC` | data | TC(f) = fib(TC(A) → TC(B)). |
| `relativeTrace` | projection | K(f) → TC(f) induced by tr. |
| `Kinv` | constructor | K^{inv} = fib(IK → TC), a localizing invariant. |
| `Kinv.relative_iff` | characterisation | K(f) → TC(f) is an equivalence iff K^{inv}(f) is. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `relativeK.identity` | degenerate | For f = id, K(f) = TC(f) = 0. |
| `relativeTrace.dual_numbers_pi1` | computation | For f : k[ε] → k (char k = 0), π_1K(f) = (1 + εk)^× ≅ k, and π_1TC(f) ≅ k compatibly (via RT.3/dgm-theorem). |
| `relativeK.not_support` | non-example | Relative K-theory of A → A[1/s] is not K-theory with supports (GeneralAlgebraicKTheory K.5/relative-versus-support): K(A) → K(A[1/s]) has fibre K(A on s) only after the localisation theorem, and the relative theory of a localisation is not of the nilpotent kind. |

**Used by.**

- RT.3/dgm-theorem: the theorem is the statement K(f) ≃ TC(f)
- RT.3/truncating-excision: K^{inv} is truncating, hence satisfies excision
- KTheoryFiniteLocalFields:L.5/relative-k-of-truncated-polynomial-over-perfect-field: relative K of k[x]/(x^e) computed by relative TC

**Acceptance.**

- For A → A/I with I nilpotent, K(f) ≃ TC(f) (RT.3/dgm-theorem).
- K^{inv}(𝔽_p) = fib(K(𝔽_p) → TC(𝔽_p)) has π_{−1} ≅ ℤ_p/ℤ and π_{−2} ≅ ℤ_p (from K_0 = ℤ, K_{<0} = 0, TC_0 = TC_{−1} = ℤ_p).

**Depends on.** `RT.3/cyclotomic-trace`, `RT.3/localizing-invariants`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`

**Source.** cmm-21, §1.1, Theorem 1.2 and footnote 1, p. 2: “Theorem 1.2 (Dundas–Goodwillie–McCarthy [22]). Let R → R′ be a map of rings which is a surjection with nilpotent kernel.1 Then the map K inv(R) → K inv(R′) is an equivalence.” — Clausen–Mathew–Morrow Definition 1.1 and Theorem 1.2: K^{inv} = fib(K → TC) and relative K = relative TC for nilpotent ideals.

### `RT.3/goodwillie-calculus` — Goodwillie derivatives

*Definition.* For a functor ψ from an ∞-category with finite colimits (connective bimodules, or compactly generated stable ∞-categories with endofunctors) to spectra, its reduction ψ_red := fib(ψ → ψ(0)) and its Goodwillie derivative (linearisation) ∂ψ := colim_n Ω^n ψ_red Σ^n, the initial colimit-preserving (excisive, reduced) functor under ψ_red. A functor is n-excisive if it takes strongly cocartesian (n+1)-cubes to cartesian cubes; 1-excisive reduced functors to spectra are exactly the exact (linear) ones; ψ is ρ-analytic in the sense of Goodwillie when its Taylor tower converges on ρ-connected inputs.

**Hypotheses.**

- Functors from pointed ∞-categories with finite colimits to spectra.

**Construction and proof.**

1. Define ∂ψ by the sequential colimit (Raskin §2.12; Goodwillie Calculus II).
2. Prove the universal property: maps from ψ_red to colimit-preserving functors factor through ∂ψ.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `GoodwillieDerivative` | data | ∂ψ = colim_n Ω^nψ_redΣ^n. |
| `GoodwillieDerivative.universal` | universal-property | ∂ψ is initial among colimit-preserving functors under ψ_red. |
| `Excisive` | characterisation | n-excisive functors: strongly cocartesian (n+1)-cubes go to cartesian cubes. |
| `GoodwillieDerivative.exact` | simp | If ψ is exact and reduced, ∂ψ ≃ ψ. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `GoodwillieDerivative.const` | degenerate | The derivative of a constant functor is 0. |
| `GoodwillieDerivative.linear` | computation | For ψ = Σ^∞Ω^∞ restricted to connective spectra, ∂ψ = id. |
| `GoodwillieDerivative.quadratic` | non-example | The quadratic functor M ↦ (M⊗M)_{hC_2} has zero derivative although it is not zero: derivatives see only the linear part. |

**Used by.**

- RT.3/stable-k-theory-thh: the derivative of M ↦ K(A ⊕ M) is ΣTHH(A, M)
- RT.3/dgm-theorem: agreement of derivatives plus convergence gives DGM

**Acceptance.**

- For ψ(M) = Σ^∞M (spaces), ∂ψ = ψ.
- For ψ(M) = M ⊗ M (quadratic), ∂ψ = 0.

**Depends on.** `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`

**Source.** raskin-18, §2.12, Theorem 2.12.1(2), p. 11 (proved in §3 via Theorem 3.10.1): “(2) For A ∈ Alg^conn, the Goodwillie derivative of the functor: A–bimod^≤0 → Sp, M ↦ K(A ⊕ M) is canonically isomorphic to the functor M ↦ THH(A, M)[1].” — Raskin Theorem 2.12.1 and §2: the Goodwillie derivative of a functor on bimodules, used for M ↦ K(A ⊕ M).

### `RT.3/stable-k-theory-thh` — Stable K-theory is THH (Dundas–McCarthy)

*Theorem.* For a connective E_1-ring A and the functor M ↦ K(A ⊕ M) on connective A-bimodules (A ⊕ M the split square-zero extension), the Goodwillie derivative is M ↦ Σ THH(A, M); i.e. stable K-theory K^s(A, M) := colim_n Ω^n fib(K(A ⊕ Σ^nM) → K(A)) ≃ Σ THH(A, M) (with THH(A, M) the topological Hochschild homology with coefficients). In particular for A = S, stable K-theory of S with coefficients in M is a shift of M.

**Hypotheses.**

- A connective E_1-ring; M connective A-bimodule; connective K-theory.

**Construction and proof.**

1. Categorical form: the derivative of T ↦ K(compact pairs (F, F → T F)) is the categorical trace tr_C(T) (Raskin Theorem 3.10.1), via a universal property among additive colimit-preserving functors.
2. Specialise to C = Mod_A and T = M[1] ⊗_A − to get ΣTHH(A, M) (Raskin Theorem 2.12.1(2)); historically Dundas–McCarthy for simplicial rings and Dundas for ring spectra.

**Acceptance.**

- For A = ℤ discrete and M = ℤ: K^s(ℤ, ℤ) ≃ ΣTHH(ℤ, ℤ), whose π_1 = ℤ = HH_0(ℤ).
- LMMT Remark 3.11's shift convention: the derivative is ΣM for A = S (their printed ΩM is a shift misprint, sourceIssues).

**Depends on.** `RT.3/goodwillie-calculus`, `RT.2/thh-e1-ring`, `RT.3/dennis-trace`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Source.** raskin-18, §2.12, Theorem 2.12.1(2), p. 11 (proved in §3 via Theorem 3.10.1): “(2) For A ∈ Alg^conn, the Goodwillie derivative of the functor: A–bimod^≤0 → Sp, M ↦ K(A ⊕ M) is canonically isomorphic to the functor M ↦ THH(A, M)[1].” — Raskin Theorem 2.12.1(2): the derivative of M ↦ K(A ⊕ M) is M ↦ ΣTHH(A, M).

**Source.** dundas-97, §0 Introduction, Theorem (unnumbered), journal p. 225 (PDF p. 3): “THEOREM. Let A be an FSP and P an A-bimodule. Then K^S(A, P) ≃ THH(A, P). The proof is purely homotopy theoretic, and depends only on the corresponding theorem for simplicial rings, [DM], and not on knowledge of TC,” — Dundas 1997: stable K-theory equals THH for ring spectra.

**Source.** lmmt-24, §3, Remark 3.11, p. 16: “It follows that the colimit colimr Ωr fib(K(S ⊕ Σr M) → K(S)) is T(n)-acyclic. But by the equivalence of stable K-theory with topological Hochschild homology [DGM13, Theorem 5.3.5.1], it follows that this colimit is ΩM, yielding a contradiction.” — LMMT Remark 3.11: by the equivalence of stable K-theory with THH, the colimit is a shift of M.

### `RT.3/stable-tc-thh` — Stable TC is THH, compatibly with the trace

*Theorem.* For a connective E_1-ring A, the functor M ↦ TC(A ⊕ M) on connective A-bimodules has Goodwillie derivative M ↦ ΣTHH(A, M), and the cyclotomic trace K → TC induces on derivatives the identification of RT.3/stable-k-theory-thh; so tr is an equivalence on derivatives.

**Hypotheses.**

- A connective E_1-ring; connective bimodules.

**Construction and proof.**

1. Compute TC(A ⊕ M) via the cyclotomic structure of THH(A ⊕ M), whose reduced part decomposes by weight (cyclic tensor powers M^{⊗n} with induced C_n-actions); weights n ≥ 2 contribute nonlinear terms, weight 1 gives ΣTHH(A, M) after the norm/Tate analysis (Raskin Theorem 2.12.2(3), credited to Hesselholt and Lindenstrauss–McCarthy).
2. Compatibility with the trace: the Dennis trace sends (F, η) to tr(id) (Raskin §4.11).

**Acceptance.**

- For M = 0 both derivatives vanish.

**Depends on.** `RT.3/goodwillie-calculus`, `RT.3/stable-k-theory-thh`, `RT.3/cyclotomic-trace`, `RT.2/tc-fibre-sequence`, `RT.2/tate-orbit-lemma`

**Source.** raskin-18, §2.12, Theorem 2.12.2(3), p. 11 (proved in §4.11): “(3) The Goodwillie derivative of the above functor is canonically isomorphic to THH(A, −)[1]. Moreover, this isomorphism is compatible with the cyclotomic trace and the isomorphism of Theorem 2.12.1.” — Raskin Theorem 2.12.2(3): stable TC is ΣTHH and the trace is an equivalence on derivatives.

### `RT.3/dgm-convergence` — Convergence: from derivatives to nilpotent extensions

*Theorem.* Let F → G be a natural transformation of functors from connective E_1-rings to spectra that both commute with sifted colimits (after the relevant completions) and are 'nil-convergent' in the sense of Raskin (their values on a square-zero extension are determined by the Taylor tower along the extension). If F → G induces an equivalence on Goodwillie derivatives at every split square-zero extension A ⊕ M, then for every map B → A of connective E_1-rings with π_0B → π_0A surjective with nilpotent kernel, fib(F(B) → F(A)) ≃ fib(G(B) → G(A)). The proof factors B → A into a tower of square-zero extensions (Postnikov tower and the nilpotence filtration on π_0), reduces each square-zero extension to split ones by the 'deformation to the normal cone' / pullback argument, and uses that K and TC commute with the relevant limits.

**Hypotheses.**

- Connective E_1-rings; π_0-surjective maps with nilpotent kernel; K connective, TC as in RT.2.

**Construction and proof.**

1. Factor a nilpotent extension through finitely many square-zero extensions on π_0 and the Postnikov tower in higher degrees; K and TC commute with the limit of the Postnikov tower (convergence in each degree by connectivity).
2. Reduce a square-zero extension B → A (classified by a derivation) to split square-zero extensions A ⊕ M via the pullback square B = A ×_{A⊕ΣM} A (Raskin; Lurie's description of square-zero extensions).
3. For split extensions, compare Taylor towers; analyticity (convergence on 1-connected inputs) of K and TC and agreement of derivatives (RT.3/stable-tc-thh) give agreement of the relative terms (Raskin's 'pro-nilpotent' / convergence argument).

**Acceptance.**

- Applied with F = K, G = TC and the trace gives RT.3/dgm-theorem.

**Depends on.** `RT.3/goodwillie-calculus`, `RT.3/stable-tc-thh`, `RT.3/stable-k-theory-thh`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`

**Source.** raskin-18, §1.6 'Structure of these notes', p. 3: “In §2-4, we treat the split square-zero case of Theorem 1.1.1. In §2, we explain how to reduce the theorem in this case to the comparison of derivatives and structural properties of these functors. In §3 and 4, we prove the corresponding facts about K-theory and TC.” — Raskin's proof structure: reduction to split square-zero extensions, derivative identification and convergence.

### `RT.3/dgm-theorem` — The Dundas–Goodwillie–McCarthy theorem ★

*Planet:* Dundas–Goodwillie–McCarthy theorem.

*Theorem.* Let f : A → B be a map of connective E_1-ring spectra such that π_0A → π_0B is surjective with nilpotent kernel. Then the square K(A) → TC(A) over K(B) → TC(B) (cyclotomic trace, connective K, integral TC) is cartesian: K(f) ≃ TC(f). In particular (McCarthy) for a surjection of discrete rings with nilpotent kernel the relative trace K(f) → TC(f; p) is an equivalence after p-completion for every prime p, and (Dundas) the same for ring spectra after p-completion. Equivalently K^{inv}(A) ≃ K^{inv}(B).

**Hypotheses.**

- A, B connective E_1-rings; π_0A → π_0B surjective with nilpotent kernel. No p-completion or rationalisation is needed integrally.

**Construction and proof.**

1. Apply RT.3/dgm-convergence to tr : K → TC, whose derivatives agree by RT.3/stable-tc-thh.
2. Nonconnective variant: relative K_{≤0} vanishes for nilpotent extensions, so IK and K give the same relative term (Hesselholt–Nikolaus note).
3. Deduce McCarthy's p-adic statement by p-completing and RT.2/tc-p-completion.

**Acceptance.**

- For k[ε] → k (k a field of characteristic 0), relative K is relative TC; rationally this is Goodwillie's theorem (RT.3/goodwillie-rational).
- Fails without nilpotence: ℤ → ℤ/p is not nilpotent (kernel pℤ), and K(ℤ) → K(𝔽_p) relative is not TC-relative (the henselian version needs p-completion and Clausen–Mathew–Morrow).

**Depends on.** `RT.3/dgm-convergence`, `RT.3/cyclotomic-trace`, `RT.3/relative-trace`, `RT.2/tc-p-completion`, `StableHomotopyKTheory:H.6/p-completion`

**Source.** raskin-18, §1.1, Theorem 1.1.1, p. 1: “Theorem 1.1.1 ([DGM] Theorem 7.2.2.1). For B → A a morphism of connective E1-ring spectra such that π0(B) → π0(A) is surjective with kernel a nilpotent ideal, the cyclotomic trace map K → TC induces an equivalence of spectra: Ker(K(B) → K(A)) → Ker(TC(B) → TC(A)).” — Raskin Theorem 1.1.1: the DGM theorem for connective E_1-rings.

**Source.** hesselholt-nikolaus-19, Introduction, p. 2: “There are two theorems that concern the behavior of this map applied to cubical diagrams of connective E1-algebras in spectra. If A is such an n-cube, then the theorems give conditions for the (n + 1)-cube K(A) → TC(A) to be cartesian.” — Hesselholt–Nikolaus introduction: the DGM theorem with integral TC.

**Source.** mccarthy-97, Introduction, Main Theorem, journal p. 198 (PDF p. 2): “MAIN THEOREM. If f: R → S is a surjective ring map with nilpotent kernel then the relative trace map K(f) →trc TC(f) is an equivalence after p-completion for all primes p.” — McCarthy's Main Theorem: the p-adic version for discrete rings.

**Source.** dundas-97, §0, Main Theorem, journal p. 224 (PDF p. 2): “MAIN THEOREM. Let f: A → B be a map of FSP's inducing an epimorphism with nilpotent kernel π0(A) → π0(B), and let p be a prime. Then [the square K(A)p → TC(A)p, K(B)p → TC(B)p] is homotopy Cartesian.” — Dundas 1997: the p-complete version for ring spectra.

### `RT.3/goodwillie-rational` — Goodwillie's rational theorem ★

*Planet:* Goodwillie's rational theorem.

*Theorem.* For a ring R and a nilpotent two-sided ideal I ⊂ R, there are natural isomorphisms K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R ⊗ ℚ, I ⊗ ℚ) for all n (relative cyclic homology over ℚ, HC_*(A⊗ℚ) = HC_*(A) ⊗ ℚ), induced by the Goodwillie–Jones Chern character K(R, I) ⊗ ℚ → HC⁻(R⊗ℚ, I⊗ℚ), which is an isomorphism, together with HP(R⊗ℚ, I⊗ℚ) = 0 and the norm sequence. In Land–Tamme's form, KQinf := fib(K_ℚ → HN_ℚ) is truncating; the same holds for maps of simplicial rings (connective E_1-rings via −⊗HZ) that are π_0-surjective with nilpotent kernel.

**Hypotheses.**

- I nilpotent (not merely locally nilpotent); rational coefficients.

**Construction and proof.**

1. Rationalise RT.3/dgm-theorem: TC(A)⊗ℚ for rational inputs is TC⁻ ⊗ ℚ = HC⁻ (TP(A_ℚ) relative vanishes) (Raskin Theorem 5.15.1).
2. HP of a nilpotent extension of ℚ-algebras is trivial relative (Goodwillie's homotopy invariance of HP).
3. Norm sequence (RT.2/norm-sequence-hc): HC⁻_n(R, I) ≅ HC_{n−1}(R, I) rationally.
4. Goodwillie's original proof (Annals 1986) is the historical source; here the theorem follows from DGM.

**Acceptance.**

- K_1(ℚ[ε], (ε)) = 1 + εℚ ≅ ℚ = HC_0(ℚ[ε], (ε)).
- K_2(ℚ[ε], (ε)) ≅ HC_1(ℚ[ε], (ε)) = 0 (consistent with van der Kallen: K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ}, which vanishes for k = ℚ) and K_3(ℚ[ε], (ε)) ⊗ ℚ ≅ HC_2(ℚ[ε], (ε)) ≅ ℚ.

**Depends on.** `RT.3/dgm-theorem`, `RT.2/norm-sequence-hc`, `RT.1/cyclic-homology`, `RT.2/tc-minus-and-tp`, `StableHomotopyKTheory:H.6/rationalisation`

**Source.** cortinas-06, §0 Introduction, display (5), pp. 2-3: “theorem of Goodwillie’s ([17, Main Thm.] see also [21, §11.3]), which says that if I ⊳ R is a nilpotent ideal of a ring R, then there is a natural isomorphism (5) K^Q_∗(R : I) ≅ HC^Q_∗−1(R : I).” — Cortiñas, display (5)–(6): Goodwillie's theorem K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R, I) ⊗ ℚ for nilpotent I.

**Source.** land-tamme-19, §3, p. 30 (definition of KQinf) and proof of Corollary 3.9, p. 31: “By Goodwillie’s theorem [Goo86, Main Theorem], the map KQinf(R) → KQinf(π0(R)) is an equivalence for every connective E1-ring R (see Remark 3.10 below). That is, KQinf is truncating.” — Land–Tamme: KQinf is truncating (Goodwillie's theorem in truncating form).

### `RT.3/kinv-truncating` — K^inv is truncating

*Theorem.* K^{inv} = fib(IK → TC) is a truncating localizing invariant: for every connective E_1-ring A, K^{inv}(A) → K^{inv}(π_0A) is an equivalence. Equivalently (by RT.3/dgm-theorem applied to A → π_0A, whose π_0-map is the identity) the DGM theorem implies truncation.

**Hypotheses.**

- Connective E_1-rings.

**Construction and proof.**

1. A → π_0A = τ_{≤0}A is π_0-surjective with zero kernel; apply RT.3/dgm-theorem (Clausen–Mathew–Morrow §5.2 Variant; Land–Tamme Corollary 3.6).

**Acceptance.**

- K^{inv}(ℤ[x]/x² ⊗ S-type ring spectra) agrees with K^{inv} of their π_0.

**Depends on.** `RT.3/dgm-theorem`, `RT.3/localizing-invariants`, `RT.3/relative-trace`

**Source.** land-tamme-19, §3, proof of Corollary 3.6, p. 29: “Thus K inv is localizing. The main result of Dundas–Goodwillie–McCarthy [DGM13, Theorem 7.0.0.2] implies that K inv is truncating.” — Land–Tamme, proof of Corollary 3.6: DGM implies K^{inv} is truncating.

**Source.** cmm-21, §5.2, 'Variant', p. 42: “Part of the theorem of Dundas–Goodwillie–McCarthy [22] states that if R is a connective E1 algebra, then the map K inv(R) → K inv(π0 R) is an equivalence. In this sense, there is no extra generality afforded by the above variant.” — Clausen–Mathew–Morrow §5.2: K^{inv}(R) → K^{inv}(π_0R) is an equivalence for connective R.

### `RT.3/truncating-excision` — Truncating invariants: nil-invariance and excision

*Theorem.* Every truncating invariant E is nil-invariant (E(A) ≃ E(A/I) for a nilpotent ideal I of a discrete ring) and satisfies excision: for a Milnor square of rings (a pullback A → B, A/I → B/I with A → B mapping I isomorphically onto an ideal of B), E sends it to a pullback square; more generally Land–Tamme's ⊙-ring formula holds. Applied to K^{inv}: K^{inv} satisfies excision (Cortiñas; Geisser–Hesselholt; Dundas–Kittang; Land–Tamme), so the obstruction to excision for K equals that for TC; rationally (Cortiñas, KABI conjecture) the obstruction to excision in K⊗ℚ equals that in HC⊗ℚ (shifted by one).

**Hypotheses.**

- E truncating; Milnor squares of discrete rings (Land–Tamme allow general pullbacks with the ⊙-ring correction).

**Construction and proof.**

1. Land–Tamme: for a pullback square of rings, E(A) → E(B) ×_{E(B/I)} E(A/I) is an equivalence after replacing A/I by the ⊙-ring A/I ⊙ B, which agrees with A/I on π_0; truncating E cannot tell them apart (Land–Tamme main theorem).
2. Nil-invariance from truncation: A → A/I for I nilpotent factors through ring spectra with the same π_0 after the ⊙ argument.
3. Excision for K^{inv} by RT.3/kinv-truncating (Clausen–Mathew–Morrow Theorem 4.33); Cortiñas's rational form via RT.3/goodwillie-rational.

**Acceptance.**

- GeneralAlgebraicKTheory K.5 records that K itself fails excision: the failure is detected by TC (and rationally by HC).
- For the Milnor square of k[x,y]/(xy) → k[x] × k[y] over k, the excision failure of K equals that of TC.

**Depends on.** `RT.3/kinv-truncating`, `RT.3/localizing-invariants`, `RT.3/goodwillie-rational`, `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`

**Source.** land-tamme-19, Introduction, Theorem B, p. 3 (= Theorem 3.3 + Corollary 3.5): “Theorem B. Any truncating invariant satisfies excision and nilinvariance. More precisely, assume that () is a pullback square of E1-ring spectra all of which are connective and that the induced map π0(A′ ⊗A B) → π0(B′) is an isomorphism.” — Land–Tamme: truncating invariants satisfy excision and nil-invariance.

**Source.** cmm-21, §4.5, Theorem 4.33, p. 35: “Theorem 4.33 (Cortiñas; Geisser–Hesselholt; Dundas–Kittang; Land–Tamme). Suppose R is a unital associative ring, I ⊂ R a two-sided ideal, and f : R → S a homomorphism such that f restricts to an isomorphism from I to a two-sided ideal J of S” — Clausen–Mathew–Morrow Theorem 4.33: excision for K^{inv}.

**Source.** cortinas-06, §0, Main theorem 0.1, p. 1: “Main theorem 0.1. Let f : A → B be a homomorphism of not necessarily unital rings and I ⊳ A an ideal which is carried by f isomorphically onto an ideal of B. Then (1) induces an isomorphism ch∗ : K^Q_∗(A, B : I) ≅ HN^Q_∗(A, B : I).” — Cortiñas: the obstruction to excision in rational K-theory equals that in rational cyclic homology.

### `RT.3/tower-square` — The trace square for filtered towers

*Theorem.* Let R be a ring with a two-sided ideal I such that R ≅ lim_n R/I^n. The DGM squares for R/I^n → R/I assemble into a map of towers, and on limits K(R/I^∞) := lim_n K(R/I^n) and TC(R/I^∞) := lim_n TC(R/I^n) the square lim_n K(R/I^n) → lim_n TC(R/I^n) over K(R/I) → TC(R/I) is cartesian; on homotopy groups each limit sits in a Milnor sequence 0 → lim¹_n π_{i+1} → π_i lim → lim_n π_i → 0. Comparing K(R) itself with lim_n K(R/I^n) (continuity) is a separate input: TC is continuous for I-adically complete noetherian R after p-completion (Clausen–Mathew–Morrow), whereas K is continuous only in the henselian/pro sense owned by the Part II on henselian pairs; this node exports only the limit square.

**Hypotheses.**

- R I-adically complete; each R/I^n → R/I is a nilpotent extension.

**Construction and proof.**

1. Apply RT.3/dgm-theorem to each R/I^n → R/I, naturally in n.
2. Limits commute with pullbacks; Milnor sequences from StableHomotopyKTheory H.6/milnor-sequence.
3. Record the continuity input with its source and owner.

**Acceptance.**

- For R = k[[t]], I = (t): the limit square for k[t]/(t^n) is the input to the calculation of K(k[[t]]) by TC.

**Depends on.** `RT.3/dgm-theorem`, `StableHomotopyKTheory:H.6/homotopy-limit-of-tower`, `StableHomotopyKTheory:H.6/milnor-sequence`

**Source.** cmm-21, §2.1, Remark 2.8, p. 9: “Suppose we have a tower · · · → X3 → X2 → X1 in CycSp≥0. Then the inverse limit of the tower {Xi} exists in CycSp (in fact, in CycSp≥−1) and is preserved by the forgetful functor CycSp → Sp.” — Clausen–Mathew–Morrow Remark 2.8: inverse limits of towers of connective cyclotomic spectra exist and are preserved.

**Source.** cmm-21, §1.2, Theorem F, p. 4 (= Theorem 5.5, p. 39): “Theorem F (Continuity criterion for K-theory). Let R be a noetherian ring and I ⊂ R an ideal. Suppose R is I-adically complete and R/p is F-finite. Then the map K(R) → lim K(R/I^n) is a p-adic equivalence.” — Clausen–Mathew–Morrow Theorem F: the continuity input K(R) → lim K(R/I^n), owned by the henselian Part II.

### `RT.3/hesselholt-nikolaus-assembly` — The TC assembly map for C_p

*Theorem.* For a ring spectrum R (in the generality of Land–Mathew–Meier–Tamme Remark 3.9), the cofibre of the TC assembly map TC(R) ⊗ Σ^∞_+BC_p → TC(R[C_p]) lies in the localizing subcategory generated by the coefficient ring (Hesselholt–Nikolaus), the input LMMT use to show TC(R[C_p]) has the same chromatic behaviour as TC(R).

**Hypotheses.**

- As in Land–Mathew–Meier–Tamme Remark 3.9 (the theorem is cited there).

**Construction and proof.**

1. THH(R[C_p]) ≃ THH(R) ⊗ Σ^∞_+LBC_p as cyclotomic spectra (RT.2/thh-spectral-categories, RT.2/thh-spherical-group-rings), with LBC_p = ⊔_{g ∈ C_p} BC_p.
2. Compute TC via RT.2/tc-fibre-sequence; the non-identity components and the Tate terms are modules over THH(R)^{tC_p}-type objects, identified using RT.2/tate-vanishing-induced.

**Acceptance.**

- For R = S, TC(S[C_p]) contains TC(S) ⊗ Σ^∞_+BC_p as the assembly image.

**Depends on.** `RT.2/thh-spherical-group-rings`, `RT.2/tc-fibre-sequence`, `RT.2/tate-vanishing-induced`

**Source.** hesselholt-nikolaus-19, §1.4 'Group rings', Theorem 1.4.1, p. 34: “Theorem 1.4.1. For a connective E1-algebra R in spectra, there is a natural cofiber sequence of spectra TC(R, Zp) ⊗ BCp+ → TC(R[Cp], Zp) → THH(R, Zp)hTp[1] ⊗ Cp, where Cp is considered as a pointed set with basepoint 1.” — Hesselholt–Nikolaus Theorem 1.4.1: the cofibre sequence TC(R, ℤ_p) ⊗ BC_{p+} → TC(R[C_p], ℤ_p) → … for connective R.

**Source.** lmmt-24, §3, Remark 3.9, p. 16 (uses Corollary 4.30, p. 24): “Now, by [HN19, Theorem 1.4.1], the cofibre of the lower horizontal map belongs to the localizing subcategory of spectra generated by τ≥0(L^p,f_n S), and hence vanishes T(n+1)-locally as well.” — LMMT Remark 3.9 uses [HN19, Theorem 1.4.1] for the cofibre of the assembly map.

### `RT.3/low-degree-tests` — Low-degree tests: dual numbers and truncated polynomials

*Application.* For a commutative ring k and the square-zero extension k[ε] → k: π_1K(k[ε], (ε)) ≅ (1 + εk)^× ≅ k, and the Dennis–Stein symbols ⟨aε, b⟩ generate K_2(k[ε], (ε)) (K2SymbolsBrauer T.6); for 1/2 ∈ k van der Kallen's isomorphism K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ} sends ⟨aε, b⟩ to a·db up to sign, and for ℚ ⊆ k this is compatible with K_2(k[ε], (ε)) ≅ HC_1(k[ε], (ε)) of RT.3/goodwillie-rational and with the Dennis trace to relative HH_2. For k[t]/(t^n) the relative K_1 is (1 + tk[t]/t^n)^×, whose image under the Dennis trace is d log. The boundary maps of the relative K-theory long exact sequence are compared with those of K2SymbolsBrauer's relative Steinberg presentation.

**Hypotheses.**

- k commutative; 1/2 ∈ k for van der Kallen's description.

**Construction and proof.**

1. Compute relative K_1 directly (units).
2. Relative K_2 via Dennis–Stein symbols (K2SymbolsBrauer T.6/relative-square-zero).
3. Apply the Dennis trace formulas (RT.3/dennis-trace) and RT.3/goodwillie-rational over ℚ.

**Acceptance.**

- K_1(ℚ[ε], (ε)) ≅ ℚ ≅ HC_0(ℚ[ε], (ε)).
- The full calculations of K_*(k[t]/t^n, (t)) are owned by KTheoryFiniteLocalFields L.5 and are not repeated.

**Depends on.** `RT.3/dennis-trace`, `RT.3/goodwillie-rational`, `K2SymbolsBrauer:T.6/dennis-stein-symbol`, `K2SymbolsBrauer:T.6/relative-square-zero`

**Source.** land-tamme-19, §3, Example 3.8, p. 30: “First we recall from [HM97, Theorem A] that K2(k[x]/(x^p^n), k) = 0 for all n, hence K2(A, k) = 0. We will argue that π2(K(A, k)∧p) ≠ 0 which shows that K(A, k) is not p-complete.” — Land–Tamme Example 3.8 records K_2(k[x]/(x^{p^n}), (x)) = 0 (Hesselholt–Madsen Theorem A), a test value for truncated polynomial algebras.

## RT.3b. The Beilinson square and the prismatic F-crystal proof bridge

AMMN's square TC(R; ℚ_p) → TC(R/p; ℚ_p) over HC⁻(R; ℚ_p) → HP(R; ℚ_p) is cartesian for every ring R.
It is proved first with the spectral reduction R ⊗_S 𝔽_p (Theorem 2.12), using that THH(𝔽_p) and ℤ
with trivial cyclotomic structure have the same TP after p-completion, and then transported to the
ordinary ring R/p by a quasi-isogeny (Theorem 3.4, Proposition 2.22). The fibre of the top row is
ΣHC(R; ℚ_p). On graded pieces of the motivic filtration (from RT.6) it becomes the square of Theorem
6.17 relating ℚ_p(n) to derived de Rham cohomology, which PrismaticCohomology PR.7 uses.

**Planets.** Beilinson fibre square, Graded Beilinson fibre square.

**Within this roadmap it uses** RT.1, RT.2, RT.3, RT.6.

**From other roadmaps and the libraries it uses** `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `PrismaticCohomology:PR.2/quasisyntomic-descent`, `PrismaticCohomology:PR.4/syntomic-complex`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/rationalisation`.

**Acceptance tests of the layer.** Each node below lists its acceptance properties; the layer is accepted when every node's acceptance list and every unit test holds.

### `RT.3b/qp-coefficients` — ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p

*Definition.* For a functor F to spectra and a prime p: F(R; ℤ_p) := F(R)^∧_p (p-completion, StableHomotopyKTheory H.6) and F(R; ℚ_p) := F(R; ℤ_p)[1/p] = F(R)^∧_p ⊗ ℚ. This is not F(R) ⊗ ℚ_p and not (F(R) ⊗ ℚ)^∧_p (the latter is 0). A map f is an isogeny if there are g and N > 0 with gf = N·id and fg = N·id; a map of bounded-below objects is a quasi-isogeny if each τ_{≤n}f is an isogeny (N may depend on n); quasi-isogenies become equivalences after −⊗ℚ, hence on (−; ℚ_p) of bounded-below p-complete objects degreewise.

**Hypotheses.**

- Spectra; bounded below for quasi-isogenies (left-complete t-structure).

**Construction and proof.**

1. Define via p-completion and rationalisation (StableHomotopyKTheory H.6/p-completion, H.6/rationalisation).
2. Define isogeny/quasi-isogeny (AMMN Definition 2.18) and record that quasi-isogenies are rational equivalences.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `pAdicCoeff` | data | F(R; ℤ_p) := F(R)^∧_p. |
| `rationalPAdicCoeff` | data | F(R; ℚ_p) := F(R)^∧_p[1/p]. |
| `Isogeny` | characterisation | f with g, N such that gf = N and fg = N. |
| `QuasiIsogeny` | characterisation | Each τ_{≤n}f is an isogeny; quasi-isogenies are rational equivalences. |
| `rationalPAdicCoeff.exact` | structure | F ↦ F(−; ℚ_p) is exact. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `rationalPAdicCoeff.HZ` | computation | π_0 HZ(−; ℚ_p) = ℚ_p. |
| `rationalPAdicCoeff.HQ` | degenerate | HQ(−; ℚ_p) = 0. |
| `rationalPAdicCoeff.not_rationalise_first` | non-example | (HZ ⊗ ℚ)^∧_p = 0 ≠ HQ_p = HZ(−; ℚ_p): the order of completion and rationalisation matters. |

**Used by.**

- RT.3b/beilinson-square-ordinary: all four corners carry ℚ_p-coefficients in this sense
- PrismaticCohomology:PR.7/tate-twist-analytic-continuation: ℚ_p(n)(−) = ℤ_p(n)(−)[1/p] in the graded Beilinson square

**Acceptance.**

- HZ(−; ℚ_p) = HQ_p; HQ(−; ℚ_p) = 0.
- For F = HH(−/ℤ) and R = 𝔽_p: HH(𝔽_p; ℚ_p) = 0 although HH(𝔽_p) ≠ 0.

**Depends on.** `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/rationalisation`

**Source.** ammn-20, Introduction, p. 3 (paragraph before Theorem A): “We use the convention that the modifier “Z_p” refers to p-adic completion of an object, and “Q_p” to the rationalization of the p-completion; for example K(R; Z_p) denotes the p-complete K-theory of R, and K(R; Q_p) denotes the rationalization of K(R; Z_p).” — AMMN introduction: F(R; ℚ_p) means p-complete first, then invert p.

**Source.** ammn-20, Definition 2.18, §2.3, p. 12: “Let C be a stable ∞-category equipped with a t-structure which is left-complete. We say that a map f : X → Y of bounded below objects is a quasi-isogeny if the following equivalent conditions are satisfied: (1) for each n, the map τ_{≤n}f : τ_{≤n}X → τ_{≤n}Y is an isogeny in C;” — AMMN Definition 2.18: isogenies and quasi-isogenies.

### `RT.3b/trivial-vs-thh-fp` — THH(𝔽_p) versus ℤ with trivial cyclotomic structure

*Theorem.* There is a cofibre sequence of cyclotomic spectra ℤ_{hC_p} → ℤ^{triv} → THH(𝔽_p) (from Bökstedt's theorem THH(𝔽_p) ≃ τ_{≥0}(ℤ^{tC_p})); consequently, for every bounded-below cyclotomic X, X ⊗ ℤ^{triv} → X ⊗ THH(𝔽_p) is a p-adic TP-equivalence, and the square TC(X ⊗ ℤ^{triv}; ℤ_p) → TC(X ⊗ THH(𝔽_p); ℤ_p) over the corresponding TC⁻ terms is cartesian with fibre (Σ(X ⊗ ℤ_{hC_p})_{hT})^∧_p. For X = THH(R), THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p).

**Hypotheses.**

- X bounded below cyclotomic; p fixed.

**Construction and proof.**

1. Bökstedt periodicity in the form THH(𝔽_p) ≃ τ_{≥0}ℤ^{tC_p} (NS18 §IV.4; AMMN Construction 2.6).
2. ℤ_{hC_p} is a ℤ^{hC_p}-module and (ℤ^{hC_p})^{tT} vanishes p-adically by the Tate fixpoint lemma (RT.2/tate-fixpoint-lemma), giving the TP-equivalence (AMMN Lemma 2.7).
3. Cyclotomic X with TP(X; ℤ_p) = 0 has TC = TC⁻ (AMMN Proposition 2.5); apply to the fibre (AMMN Proposition 2.8, Corollary 2.9).

**Acceptance.**

- For X = S: TC(ℤ^{triv}; ℤ_p) → TC(THH(𝔽_p); ℤ_p) = TC(𝔽_p; ℤ_p) has fibre (Σℤ_{hC_p,hT})^∧_p.

**Depends on.** `RT.2/tate-fixpoint-lemma`, `RT.2/tc-fibre-sequence`, `RT.2/thh-symmetric-monoidal`, `RT.2/trivial-cyclotomic-adjunction`, `RT.2/tc-minus-and-tp`

**Source.** ammn-20, Proposition 2.5, p. 8: “Proposition 2.5. If X ∈ CycSp is bounded below and TP(X; Z_p) = 0, then we have natural equivalences TC(X; Z_p) ≃ (ΣX_{hS^1})^∧_p ≃ TC^−(X; Z_p).” — AMMN Construction 2.6, Lemma 2.7, Propositions 2.5, 2.8 and Corollary 2.9.

### `RT.3b/crystalline-trace-map` — The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)

*Construction.* For an associative ring R, the right vertical map of the Beilinson square is β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p)[1/p] (and, after the quasi-isogeny of RT.3b/reduction-quasi-isogeny, TC(R/p; ℚ_p) → HP(R; ℚ_p)), built from ℤ^{triv} → THH(𝔽_p): TC(R⊗_S𝔽_p) = TC(THH(R) ⊗ THH(𝔽_p)) → TP(THH(R) ⊗ THH(𝔽_p)) ≃_{ℤ_p} TP(THH(R) ⊗ ℤ^{triv}) = TP(R ⊗ ℤ) → HP(R; ℤ_p) (inverse of the p-adic TP-equivalence of RT.3b/trivial-vs-thh-fp, which exists after inverting p on the relevant range). Composed with the cyclotomic trace it is AMMN's crystalline trace tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p) (AMMN Definition 2.14 prints tr ∘ β; the composite is β ∘ tr).

**Hypotheses.**

- R associative ring; ℚ_p-coefficients as in RT.3b/qp-coefficients.

**Construction and proof.**

1. Use the TP-equivalence X ⊗ ℤ^{triv} ≃_p X ⊗ THH(𝔽_p) (RT.3b/trivial-vs-thh-fp).
2. Compose TC → TP with its inverse and with linearisation TP(R ⊗ ℤ) → HP(R/ℤ; ℤ_p) (THH(R) ⊗_S ℤ → HH(R) is a rational equivalence, RT.2/thh-over-thhz).
3. Define tr_crys := β ∘ tr.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `beilinsonBeta` | data | β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℚ_p) and its ℚ_p-version on TC(R/p; ℚ_p). |
| `crystallineTrace` | constructor | tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p). |
| `beilinsonBeta.natural` | functoriality | Natural in ring maps R → R′. |
| `beilinsonBeta.commutes` | relation | β ∘ (TC(R) → TC(R ⊗_S 𝔽_p)) = can ∘ (TC(R) → HC⁻(R)) on ℤ_p-coefficients (the square of RT.3b/beilinson-square-spectral commutes). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `beilinsonBeta.zero` | degenerate | For R = 0 both sides vanish. |
| `beilinsonBeta.Zp_pi0` | computation | For R = ℤ_p, π_0β : π_0TC(𝔽_p; ℚ_p) = ℚ_p → HP_0(ℤ_p; ℚ_p) = ℚ_p is an isomorphism. |
| `crystallineTrace.order` | non-example | tr ∘ β is not defined (β lands in HP, tr starts in K): the composite is β ∘ tr, correcting AMMN Definition 2.14's printed order. |

**Used by.**

- RT.3b/beilinson-square-ordinary: the right vertical map
- PrismaticCohomology:PR.7/tate-twist-analytic-continuation: χ_n on graded pieces

**Acceptance.**

- For R = ℤ_p (quasisyntomic), β on π_0 is the map ℤ_p → ℚ_p.
- For R with R/p perfect, β recovers the crystalline comparison A_crys(R/p) → (LΩ_R)[1/p]-type identification (RT.3b/graded-beilinson-square).

**Depends on.** `RT.3b/trivial-vs-thh-fp`, `RT.3b/qp-coefficients`, `RT.2/thh-over-thhz`, `RT.2/tc-minus-and-tp`, `RT.3/cyclotomic-trace`

**Source.** ammn-20, Theorem 2.12, §2.2, p. 10, square (15): “Theorem 2.12. Let R be a ring (or more generally, a connective associative HZ-algebra spectrum). Then there is a natural commutative square of spectra TC(R; Z_p) → TC(R ⊗_S F_p) ↓ ↓ HC^−(R; Z_p) → HP(R; Z_p), (15) which becomes cartesian after inverting p.” — AMMN Theorem 2.12: the right vertical map is built from ℤ^{triv} → THH(𝔽_p).

**Source.** ammn-20, Theorem A, Introduction, p. 3, eqs. (1)-(2): “which fits into a natural commutative square K(R; Q_p) → K(R/p; Q_p) ↓tr_GJ ↓tr_crys HC^−(R; Q_p) → HP(R; Q_p). (2) If R is commutative and henselian along (p) then this square is cartesian, thereby giving an equivalence K(R, (p); Q_p) ≃ ΣHC(R; Q_p).” — AMMN Theorem A and Definition 2.14: tr_crys, with the composition order misprinted.

### `RT.3b/beilinson-square-spectral` — The Beilinson square with the spectral reduction (AMMN Theorem 2.12)

*Theorem.* For an associative ring R (or a connective ℤ-linear E_1-algebra), there is a natural commutative square with top row TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) and bottom row HC⁻(R; ℤ_p) → HP(R; ℤ_p), left vertical map the canonical one and right vertical map β, which is cartesian after inverting p. Here R ⊗_S 𝔽_p is the E_1-ring spectrum (with π_0 = R/p and higher homotopy Tor^S-terms), not the ring R/p. τ_{≤2i} of the total cofibre is killed by p^i for i ≤ p − 1.

**Hypotheses.**

- R associative (no commutativity, henselian or completeness assumption).

**Construction and proof.**

1. Apply RT.3b/trivial-vs-thh-fp to X = THH(R; ℤ_p) and compose with can : (−)^{hT} → (−)^{tT} (AMMN Corollary 2.10).
2. (X ⊗ THH(𝔽_p))^{hT} → (X ⊗ THH(𝔽_p))^{tT} is a rational equivalence, its fibre Σ(X ⊗ THH(𝔽_p))_{hT} being p-power torsion in each range.
3. Replace THH(R; ℤ_p) ⊗_S ℤ by HH(R; ℤ_p) (rational equivalence, RT.2/thh-over-thhz) to get HC⁻ and HP.

**Acceptance.**

- For R = 𝔽_p-algebra, R ⊗_S 𝔽_p ≠ R/p = R: π_*(𝔽_p ⊗_S 𝔽_p) is the dual Steenrod algebra.

**Depends on.** `RT.3b/trivial-vs-thh-fp`, `RT.3b/crystalline-trace-map`, `RT.2/thh-over-thhz`, `RT.2/mixed-complexes-are-circle-modules`, `RT.1/cyclic-homology`

**Source.** ammn-20, Theorem 2.12, §2.2, p. 10, square (15): “Theorem 2.12. Let R be a ring (or more generally, a connective associative HZ-algebra spectrum). Then there is a natural commutative square of spectra TC(R; Z_p) → TC(R ⊗_S F_p) ↓ ↓ HC^−(R; Z_p) → HP(R; Z_p), (15) which becomes cartesian after inverting p.” — AMMN Theorem 2.12: the square TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) over HC⁻(R; ℤ_p) → HP(R; ℤ_p), cartesian after inverting p.

**Source.** ammn-20, Proposition 2.5, p. 8: “Proposition 2.5. If X ∈ CycSp is bounded below and TP(X; Z_p) = 0, then we have natural equivalences TC(X; Z_p) ≃ (ΣX_{hS^1})^∧_p ≃ TC^−(X; Z_p).” — AMMN Corollary 2.10 and the proof of Theorem 2.12.

### `RT.3b/reduction-quasi-isogeny` — From R ⊗_S 𝔽_p to R/p: a quasi-isogeny

*Theorem.* If f : A → A′ is a map of connective E_1-rings that is a quasi-isogeny of spectra and π_0-surjective with nilpotent kernel, then THH(f) is a quasi-isogeny of cyclotomic spectra and TC(f; ℤ_p) is a quasi-isogeny (AMMN Theorem 3.4 = Theorem C). Applied to the Postnikov truncation R ⊗_S 𝔽_p → π_0 = R/p (a quasi-isogeny of ring spectra, with (2p−2)-connective fibre when R is p-torsion-free): TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny, hence TC(R ⊗_S 𝔽_p; ℚ_p) ≃ TC(R/p; ℚ_p).

**Hypotheses.**

- A, A′ connective E_1-rings; for the application, R any associative ring.

**Construction and proof.**

1. R ⊗_S 𝔽_p has π_i killed by a bounded power of p in each degree (π_*(S) ⊗ 𝔽_p-type terms are p-torsion of bounded exponent in each degree).
2. THH and TC preserve quasi-isogenies under the nilpotence hypothesis (AMMN Theorem 3.4; alternatively DGM, RT.3/dgm-theorem, as in AMMN Proposition 2.22).

**Acceptance.**

- Rationally the spectral and ordinary reductions agree; integrally they do not (TC(𝔽_p ⊗_S 𝔽_p) ≠ TC(𝔽_p)).

**Depends on.** `RT.3b/qp-coefficients`, `RT.3/dgm-theorem`, `RT.2/thh-e1-ring`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`

**Source.** ammn-20, Definition 2.18, §2.3, p. 12: “Let C be a stable ∞-category equipped with a t-structure which is left-complete. We say that a map f : X → Y of bounded below objects is a quasi-isogeny if the following equivalent conditions are satisfied: (1) for each n, the map τ_{≤n}f : τ_{≤n}X → τ_{≤n}Y is an isogeny in C;” — AMMN Theorem 3.4 and Proposition 2.22: TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny.

### `RT.3b/beilinson-square-ordinary` — The Beilinson fibre square (AMMN Corollary 3.9) ★

*Planet:* Beilinson fibre square.

*Theorem.* For every associative unital ring R there is a natural cartesian square of spectra with top row TC(R; ℚ_p) → TC(R/p; ℚ_p), bottom row HC⁻(R; ℚ_p) → HP(R; ℚ_p), left vertical map the canonical map TC → TC⁻ → HC⁻ and right vertical map β (RT.3b/crystalline-trace-map). Here (−; ℚ_p) is p-completion followed by inverting p (RT.3b/qp-coefficients) and HC⁻, HP are those of derived HH over ℤ. No henselian, commutativity or completeness hypothesis enters; the K-theoretic square K(R; ℚ_p) → K(R/p; ℚ_p) over HC⁻ → HP is cartesian when R is commutative and henselian along (p) (AMMN Theorem A), via Clausen–Mathew–Morrow's rigidity, which is owned by the henselian Part II and is not part of this stage.

**Hypotheses.**

- R associative unital; p a prime.

**Construction and proof.**

1. Invert p in RT.3b/beilinson-square-spectral.
2. Replace TC(R ⊗_S 𝔽_p; ℚ_p) by TC(R/p; ℚ_p) using RT.3b/reduction-quasi-isogeny.
3. Check that the replaced right vertical map is β and the square still commutes (naturality of β).

**Acceptance.**

- For R = ℤ_p: TC(ℤ_p; ℚ_p) → TC(𝔽_p; ℚ_p) over HC⁻(ℤ_p; ℚ_p) → HP(ℤ_p; ℚ_p) is cartesian; on π_{−1}: TC_{−1}(𝔽_p; ℚ_p) = ℚ_p and HP_{−1}(ℤ_p; ℚ_p) = 0.
- Henselian hypotheses are absent here: the square holds for R = ℤ (not henselian along p).

**Depends on.** `RT.3b/beilinson-square-spectral`, `RT.3b/reduction-quasi-isogeny`, `RT.3b/crystalline-trace-map`, `RT.3b/qp-coefficients`

**Source.** ammn-20, Introduction, p. 3 (paragraph before Theorem A): “We use the convention that the modifier “Z_p” refers to p-adic completion of an object, and “Q_p” to the rationalization of the p-completion; for example K(R; Z_p) denotes the p-complete K-theory of R, and K(R; Q_p) denotes the rationalization of K(R; Z_p).” — AMMN Corollary 3.9: for every ring R the square TC(R; ℚ_p) → TC(R/p; ℚ_p) over HC⁻(R; ℚ_p) → HP(R; ℚ_p) is cartesian.

### `RT.3b/beilinson-fibre-sequence` — The Beilinson fibre sequence and its shift dictionary

*Theorem.* For every associative ring R: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), and cofib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ Σ²HC(R; ℚ_p), with HC = HH_{hT} (direct-sum convention of RT.1/cyclic-homology) and Σ the homological shift; integrally, TC(R, (p); ℤ_p) := fib(TC(R; ℤ_p) → TC(R/p; ℤ_p)), ΣHC(R, (p); ℤ_p) and ΣHC(R; ℤ_p) are naturally quasi-isogenous, and for p-torsion-free R the first two agree after τ_{≤2p−5}. Dictionary: a source writing the Beilinson sequence as K(R, (p); ℚ_p) → HC(R; ℚ_p)[1]-type with cohomological shifts must be converted by [1] = Σ (homological) before use.

**Hypotheses.**

- R associative; HC derived over ℤ and p-completed.

**Construction and proof.**

1. Fibres of the vertical maps in a cartesian square agree: fib(TC(R) → TC(R/p)) ≃ fib(HC⁻ → HP) (RT.3b/beilinson-square-ordinary).
2. fib(HC⁻ → HP) = ΣHC by the norm sequence ΣHC → HC⁻ → HP (RT.2/norm-sequence-hc).
3. Integral version: AMMN Theorem 2.20 with Lemma 2.23.

**Acceptance.**

- For R = ℤ_p: π_1 fib = HC_0(ℤ_p; ℚ_p) = ℚ_p, matching K_1(ℤ_p, (p); ℚ_p) = (1 + pℤ_p) ⊗ ℚ ≅ ℚ_p via log.

**Depends on.** `RT.3b/beilinson-square-ordinary`, `RT.2/norm-sequence-hc`, `RT.1/cyclic-homology`

**Source.** ammn-20, Theorem 2.20, §2.3, p. 12: “Theorem 2.20. For any associative ring R the following spectra are naturally quasi-isogenous to each other (i.e., related via a natural zig-zag of quasi-isogenies) TC(R, (p); Z_p) ΣHC(R, (p); Z_p) ΣHC(R; Z_p).” — AMMN Theorem 2.20 and the proof of Theorem 4.14: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), cofibre Σ²HC.

### `RT.3b/graded-beilinson-square` — The Beilinson fibre square on graded pieces (AMMN Theorem 6.17) ★

*Planet:* Graded Beilinson fibre square.

*Theorem.* Let R be a p-torsion-free quasisyntomic ring (p-complete, bounded p-power torsion, L_{R/ℤ_p} of p-complete Tor-amplitude in [−1, 0]; DerivedDeRhamCohomology DD.0/quasisyntomic-condition). For each n ≥ 0 there is a natural cartesian square in D(ℚ_p): ℚ_p(n)(R) → ℚ_p(n)(R/p) over (LΩ^{≥n}_R)_{ℚ_p} → (LΩ_R)_{ℚ_p}, where ℚ_p(n) = ℤ_p(n)[1/p] is the weight-n syntomic complex (the BMS2 graded piece of TC, PrismaticCohomology PR.4/syntomic-complex via RefinedTraceMethods RT.6), LΩ_R is p-completed derived de Rham cohomology with its derived (not Hodge-completed) Hodge filtration (DerivedDeRhamCohomology DD.2), and the right vertical map χ_n comes from a natural ℤ_p(n)(R/p) → p^{−N}LΩ_R with N depending only on n. Equivalently fib(ℚ_p(n)(R) → ℚ_p(n)(R/p)) ≃ (LΩ_R/LΩ^{≥n}_R)_{ℚ_p}[−1] (cohomological shift). Integrally cofib(ℤ_p(n)(R) → ℤ_p(n)(R/p)) is naturally isogenous to LΩ_R/LΩ^{≥n}_R, with an exact equivalence for n ≤ p − 2. For R quasiregular semiperfectoid and n > 0, χ_n identifies ℚ_p(n)(R/p) with A_crys(R/p)^{φ = p^n}_{ℚ_p} (AMMN Proposition 6.18), and χ_n is unique up to a scalar λ^n (Proposition 6.21). This is the p-torsion-free p-complete filtered refinement exported to PrismaticCohomology PR.7.

**Hypotheses.**

- R p-torsion-free quasisyntomic; n ≥ 0; ℚ_p-coefficients as in RT.3b/qp-coefficients.

**Construction and proof.**

1. On quasiregular semiperfectoid R, take τ_{[2n−1, 2n]} of RT.3b/beilinson-square-ordinary: TC, HC⁻, HP are even there and their graded pieces are ℤ_p(n)[2n], LΩ^{≥n}[2n], LΩ[2n] (BMS2 motivic filtrations, owned by RT.6, and BMS2 Theorem 1.17).
2. Unfold along quasisyntomic descent (PrismaticCohomology PR.2/quasisyntomic-descent).
3. Integral isogeny via AMMN Theorem 2.20(b) on w-strictly local R; identify χ_n on qrsp rings with the crystalline comparison (AMMN Proposition 6.18, Lemma 6.19, Corollary 6.20) and its uniqueness (Proposition 6.21).

**Acceptance.**

- n = 0: ℚ_p(0)(R) → ℚ_p(0)(R/p) is an equivalence and LΩ/LΩ^{≥0} = 0, consistent.
- n = 1 and R = ℤ_p: fib(ℚ_p(1)(ℤ_p) → ℚ_p(1)(𝔽_p)) ≃ (LΩ_{ℤ_p}/LΩ^{≥1})_{ℚ_p}[−1] = ℚ_p[−1], matching H^1(ℚ_p(1)(ℤ_p)) = (ℤ_p^×)^∧_p ⊗ ℚ ≅ ℚ_p while ℚ_p(1)(𝔽_p) = 0.

**Depends on.** `RT.3b/beilinson-square-ordinary`, `RT.3b/beilinson-fibre-sequence`, `RT.6`, `PrismaticCohomology:PR.4/syntomic-complex`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`, `PrismaticCohomology:PR.2/quasisyntomic-descent`

**Source.** ammn-20, Theorem 6.17 (The Beilinson fiber square on graded terms), §6.3, p. 44, square (55): “Theorem 6.17. Let R ∈ qSyn_{Z_p}. Then, for each i ≥ 0, there exists a natural map χ_i : Q_p(i)(R/p) → (LΩ_R)_{Q_p} and a functorial pullback square Q_p(i)(R) → Q_p(i)(R/p) ↓ ↓χ_i (LΩ^{≥i}_R)_{Q_p} → (LΩ_R)_{Q_p} (55) in the derived ∞-category D(Q_p).” — AMMN Theorem 6.17 with Propositions 6.18–6.21: the Beilinson fibre square on graded pieces for p-torsion-free quasisyntomic rings.

## RT.4. Complex K-theory, ku and KU

RT.4 is the union of its three sub-layers, documented below in the order topological, q-Hodge,
Habiro comparison.

## RT.4:topological. Complex topological K-theory, ku and KU

Topological complex K-theory of compact spaces is the Grothendieck group of complex vector bundles
(Mathlib's vector bundles and Grothendieck groups). Bott periodicity makes it 2-periodic and
representable by ℤ × BU, which assembles into the E_∞-ring KU (Snaith's theorem identifies it with
Σ^∞_+ℂP^∞[β^{−1}]); ku is its connective cover, π_*ku = ℤ[β] and KU = ku[β^{−1}]. Exterior powers make
K(X) a special λ-ring (KTheoryLowDegrees Z.3), whose Adams operations ψ^k are realised on ℤ × BU and,
after inverting k, on KU. Chern classes give H*(BU) = ℤ[c_1, c_2, …] and the Chern character. The
circle-equivariant behaviour of ku (q = 1 + βt, q-integers) is what connects ku to q-de Rham
cohomology.

**Planets.** Complex topological K-theory, Bott periodicity, Periodic complex K-theory KU, Homotopy of ku and KU, Adams operations.

**Within this roadmap it uses** RT.2.

**From other roadmaps and the libraries it uses** `KTheoryLowDegrees:Z.3/adams-composition`, `KTheoryLowDegrees:Z.3/adams-operations`, `KTheoryLowDegrees:Z.3/adams-ring-endomorphism`, `KTheoryLowDegrees:Z.3/lambda-identity-principle`, `KTheoryLowDegrees:Z.3/pre-lambda-ring`, `KTheoryLowDegrees:Z.3/special-lambda-ring`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`, `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, `StableHomotopyKTheory:H.6/atiyah-hirzebruch-spectral-sequence`, `StableHomotopyKTheory:H.6/rationalisation`, `mathlib:Algebra.GrothendieckGroup`, `mathlib:VectorBundle`.

**Acceptance tests of the layer.** Each node below lists its acceptance properties; the layer is accepted when every node's acceptance list and every unit test holds.

### `RT.4:topological/complex-k-theory` — Complex topological K-theory of a compact space ★

*Planet:* Complex topological K-theory.

*Definition.* For a compact Hausdorff space X, Vect_ℂ(X) is the commutative semiring of isomorphism classes of complex vector bundles of finite rank over X (Mathlib VectorBundle ℂ, of locally constant rank) under ⊕ and ⊗, and KU⁰(X) := K(X) is its Grothendieck group (Mathlib Algebra.GrothendieckGroup of (Vect_ℂ(X), ⊕)), a commutative ring with unit the trivial line bundle. A continuous map f : Y → X induces the ring homomorphism f* : K(X) → K(Y) by pullback of bundles, so K is a contravariant functor from compact Hausdorff spaces to commutative rings. These are topological K-groups of spaces; they are not the algebraic K-groups K_*(ℂ) of the field ℂ.

**Hypotheses.**

- X compact Hausdorff (for the Grothendieck-group definition; representability needs X compact or a finite CW complex).

**Construction and proof.**

1. Construct direct sums, tensor products and pullbacks of complex vector bundles from Mathlib's vector bundle API (fibrewise ⊕, ⊗, pullback bundles), and show they respect isomorphism.
2. Form the commutative semiring Vect_ℂ(X) (rank may vary over components) and its Grothendieck group; the tensor product extends bilinearly (Hatcher §2.1).
3. Every bundle over compact X has a complement E ⊕ E′ ≅ ε^N, so every element of K(X) is [E] − [ε^N] (Hatcher Proposition 1.4).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TopK` | data | K(X) for compact Hausdorff X, a commutative ring. |
| `TopK.ofBundle` | constructor | [E] ∈ K(X) for a complex vector bundle E; [E ⊕ F] = [E] + [F], [E ⊗ F] = [E][F]. |
| `TopK.pullback` | functoriality | f* : K(X) → K(Y) for f : Y → X, a ring homomorphism with id* = id and (fg)* = g*f*. |
| `TopK.homotopy_invariant` | other | Homotopic maps induce the same map on K. |
| `TopK.rank` | projection | rank : K(X) → H⁰(X; ℤ) (locally constant functions), a ring homomorphism. |
| `TopK.exists_complement` | characterisation | Every element of K(X) is [E] − [ε^N]; [E] = [F] iff E ⊕ ε^n ≅ F ⊕ ε^n for some n. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TopK.point` | computation | K(pt) ≅ ℤ via rank. |
| `TopK.empty` | degenerate | K(∅) = 0. |
| `TopK.sphere_two` | computation | K(S²) ≅ ℤ[H]/(H − 1)², with H the tautological line bundle on ℂP¹. |
| `TopK.not_algebraic` | non-example | K(pt) = ℤ is K_0 of ℂ, but K^{−1}(pt) = K̃(S¹) = 0 while K_1(ℂ) = ℂ^× ≠ 0: topological K-theory is not algebraic K-theory of ℂ. |

**Used by.**

- RT.4:topological/bott-periodicity: the external product K(X) ⊗ K(S²) → K(X × S²)
- RT.4:topological/adams-operations: ψ^k act on K(X)
- KTheoryFiniteLocalFields:L.1/fpsi: K̃U⁰ of classifying spaces and Adams operations
- BorelRegulators:R.4/universal-borel-class: universal complex topological K-theory and Bott generators

**Acceptance.**

- K(point) = ℤ via rank.
- K(S²) ≅ ℤ[H]/(H − 1)² with H the canonical line bundle (Hatcher Corollary 2.3).
- Homotopic maps induce equal maps K(X) → K(Y).

**Depends on.** `mathlib:VectorBundle`, `mathlib:Algebra.GrothendieckGroup`

**Source.** hatcher-vbkt, Ch. 2, §2.1 'The Functor K(X)', p. 39 (paragraph after Proposition 2.1) continuing to p. 40: “so we can form for compact X an abelian group K(X) consisting of formal differences E − E′ of vector bundles E and E′ over X, with the equivalence relation E_1 − E_1′ = E_2 − E_2′ iff E_1 ⊕ E_2′ ≈_s E_2 ⊕ E_1′.” — Hatcher §2.1 defines K(X) as the Grothendieck group of vector bundles over compact Hausdorff X with ⊗ as product.

### `RT.4:topological/reduced-and-graded-k` — Reduced, relative and negative topological K-groups

*Construction.* For a pointed compact X, K̃(X) := ker(K(X) → K(pt)); for a compact pair (X, A), K(X, A) := K̃(X/A); and K^{−n}(X) := K̃(Σ^n(X_+)) = K̃(S^n ∧ X_+), K^{−n}(X, A) := K̃(Σ^n(X/A)) for n ≥ 0. There are natural long exact sequences … → K^{−1}(A) → K(X, A) → K(X) → K(A) for compact pairs, and the external product K^{−i}(X) ⊗ K^{−j}(Y) → K^{−i−j}(X × Y).

**Hypotheses.**

- X compact Hausdorff, A ⊆ X closed.

**Construction and proof.**

1. K̃ is exact on cofibre sequences A → X → X/A (Hatcher §2.4); extend to the left with suspensions (Puppe sequence).
2. External products from ⊗ of pulled-back bundles; reduced version via smash products.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TopK.reduced` | data | K̃(X) for pointed X. |
| `TopK.relative` | data | K(X, A) := K̃(X/A). |
| `TopK.negative` | data | K^{−n}(X) := K̃(S^n ∧ X_+). |
| `TopK.les` | relation | The long exact sequence of a compact pair. |
| `TopK.externalProduct` | structure | K^{−i}(X) ⊗ K^{−j}(Y) → K^{−i−j}(X × Y), associative and unital. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TopK.reduced_point` | degenerate | K̃(S⁰) = ℤ and K̃(pt) = 0. |
| `TopK.reduced_S1` | computation | K̃(S¹) = 0. |
| `TopK.relative_not_quotient_naive` | non-example | K(X, A) is not ker(K(X) → K(A)) in general: for (D², S¹), K(D², S¹) = K̃(S²) = ℤ while ker(K(D²) → K(S¹)) = 0. |

**Used by.**

- RT.4:topological/bott-periodicity: periodicity is stated for K^{−n}
- RT.4:topological/ku-spectrum: the groups K^{−n}(X) are represented by KU

**Acceptance.**

- K̃(S¹) = 0 (every bundle on S¹ is trivial up to stabilisation).
- K^{−1}(pt) = 0, K^{−2}(pt) = K̃(S²) = ℤ.

**Depends on.** `RT.4:topological/complex-k-theory`

**Source.** hatcher-vbkt, Ch. 2, §2.1, Proposition 2.1 and the sentence following it, p. 39 (splitting K(X) ≈ K̃(X) ⊕ Z on p. 40): “Proposition 2.1. If X is compact Hausdorff, then the set of ∼–equivalence classes of vector bundles over X forms an abelian group with respect to ⊕. This group is called K̃(X).” — Hatcher §2.1/§2.4: reduced K-theory, relative groups, K^{−n} and the long exact sequence.

### `RT.4:topological/bott-periodicity` — Bott periodicity ★

*Planet:* Bott periodicity.

*Theorem.* For every compact Hausdorff space X the external product μ : K(X) ⊗ K(S²) → K(X × S²) is an isomorphism of rings; equivalently, multiplication by the Bott class β = [H] − 1 ∈ K̃(S²) gives isomorphisms K̃(X) ≅ K̃(Σ²X) for pointed compact X and K^{−n}(X) ≅ K^{−n−2}(X). Consequently K̃(S^{2n}) ≅ ℤ generated by β^n and K̃(S^{2n+1}) = 0.

**Hypotheses.**

- X compact Hausdorff.

**Construction and proof.**

1. Describe bundles on X × S² by clutching functions X × S¹ → GL_n(ℂ) (Hatcher §1.2, Proposition 1.11).
2. Approximate clutching functions by Laurent polynomials, then linear ones, and decompose (Atiyah–Bott; Hatcher proof of Theorem 2.2).
3. Construct the inverse of μ and check both composites.

**Acceptance.**

- K̃(S²) = ℤβ, K̃(S⁴) = ℤβ², K̃(S³) = 0.
- β² = 0 in K(S²): (H − 1)² = 0.

**Depends on.** `RT.4:topological/complex-k-theory`, `RT.4:topological/reduced-and-graded-k`

**Source.** hatcher-vbkt, Ch. 2, §2.1, subsection 'The Fundamental Product Theorem', Theorem 2.2 (with Corollary 2.3), p. 41: “Theorem 2.2. The homomorphism µ : K(X) ⊗ Z[H]/(H − 1)^2 → K(X × S^2) is an isomorphism of rings for all compact Hausdorff spaces X.” — Hatcher Theorem 2.2 (fundamental product theorem) and the periodicity K̃(X) ≅ K̃(Σ²X).

**Source.** hatcher-vbkt, Ch. 1, §1.2 'Classifying Vector Bundles', subsection 'Clutching Functions', p. 22: “Given a map f : S^{k−1}→GL_n(R), let E_f be the quotient of the disjoint union D^k_+ × R^n ∐ D^k_− × R^n obtained by identifying (x, v) ∈ ∂D^k_− × R^n with (x, f(x)(v)) ∈ ∂D^k_+ × R^n.” — Hatcher §1.2: clutching functions describe bundles over suspensions.

### `RT.4:topological/bu-representability` — Representability by ℤ × BU and the space-level Bott equivalence

*Theorem.* For paracompact X, isomorphism classes of rank-n complex vector bundles are [X, G_n(ℂ^∞)] (homotopy classes into the infinite Grassmannian, via the tautological bundle); with BU := colim_n G_n(ℂ^∞) and X compact, K̃(X) ≅ [X, BU]_* and K(X) ≅ [X, ℤ × BU]. Bott periodicity in space form gives a homotopy equivalence ℤ × BU ≃ Ω²(ℤ × BU) (equivalently ΩU ≃ ℤ × BU), compatible with β.

**Hypotheses.**

- X paracompact for the rank-n statement; compact (or finite CW) for the K-theory statement.

**Construction and proof.**

1. Classify rank-n bundles by pullback of the tautological bundle (Hatcher Theorem 1.16).
2. Pass to the colimit over n and to stable classes; compactness makes every map to BU factor through a finite G_n(ℂ^N).
3. Deduce Ω²(ℤ × BU) ≃ ℤ × BU from RT.4:topological/bott-periodicity applied to X ∧ S² for all finite CW X (Yoneda in the homotopy category of spaces).

**Acceptance.**

- π_{2n}(BU) ≅ ℤ and π_{2n+1}(BU) = 0 for n ≥ 1 (consumed by KTheoryFiniteLocalFields L.1).
- [S², BU]_* = K̃(S²) = ℤ.

**Depends on.** `RT.4:topological/bott-periodicity`, `mathlib:VectorBundle`, `StableHomotopyKTheory:H.1`

**Source.** hatcher-vbkt, Ch. 1, §1.2, subsection 'The Universal Bundle', Theorem 1.16, p. 29: “Theorem 1.16. For paracompact X, the map [X, G_n]→Vect^n(X), [f] ↦ f*(E_n), is a bijection.” — Hatcher: Vect^n(X) ≅ [X, G_n] and K̃(X) ≅ [X, BU] for compact X.

**Source.** may-concise, Ch. 24 §1, Corollary at the bottom of p. 204 continuing to the top of p. 205: “Corollary. Give Z the discrete topology. For compact spaces X, there is a natural isomorphism K(X) ≅ [X_+, BU × Z]. For nondegenerately based compact spaces X, there is a natural isomorphism K̃(X) ≅ [X, BU × Z].” — May, Concise Course, Ch. 24 §1: K(X) ≅ [X_+, BU × ℤ] for compact X.

**Source.** may-concise, Ch. 24 §2, paragraph after the reduced 'Theorem (Bott periodicity)', p. 207: “Write b = 1 − [H] ∈ K̃(S^2). Since K̃(S^2) ≅ Z with generator b, the theorem implies that multiplication by the “Bott element” b specifies an isomorphism [X, BU × Z] ≅ K̃(X) −→ K̃(Σ^2X) ≅ [X, Ω^2(BU × Z)] for nondegenerately based compact spaces X.” — May, Ch. 24 §2: Bott periodicity in space form via the Grassmannian model.

### `RT.4:topological/ku-spectrum` — The periodic complex K-theory spectrum KU ★

*Planet:* Periodic complex K-theory KU.

*Construction.* KU is the Ω-spectrum with KU_{2n} = ℤ × BU and KU_{2n+1} = U, structure maps given by the Bott equivalences ℤ × BU ≃ ΩU and U ≃ Ω(ℤ × BU) (RT.4:topological/bu-representability); it represents K-theory: KU^{−n}(X) ≅ K^{−n}(X) for finite CW X. KU is an E_∞-ring spectrum whose multiplication induces the tensor product on KU⁰(X), and it is equivalent as an E_∞-ring to Snaith's Σ^∞_+ℂP^∞[β^{−1}], β ∈ π_2Σ^∞_+ℂP^∞ the class of the Bott element; the unit S → KU is the unit of Σ^∞_+ℂP^∞.

**Hypotheses.**

- Spectra from StableHomotopyKTheory H.5:spectra; E_∞-ring structures in the operadic model there.

**Construction and proof.**

1. Assemble the Ω-spectrum from the Bott equivalences (StableHomotopyKTheory H.5:spectra/omega-spectra-and-eilenberg-maclane).
2. Construct the E_∞-structure: ℂP^∞ = BU(1) is an E_∞-space (tensor product of line bundles), so Σ^∞_+ℂP^∞ is an E_∞-ring; invert β (a localisation of E_∞-rings at an element of π_2) and identify with KU by Snaith's theorem (Gepner–Snaith).
3. Check that the induced product on KU⁰(X) = [X, ℤ × BU] is ⊗ (compare on line bundles, use the splitting principle RT.4:topological/splitting-principle).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `KU` | data | The E_∞-ring spectrum KU. |
| `KU.represents` | characterisation | KU^{−n}(X) ≅ K^{−n}(X) for finite CW X, naturally, compatible with products. |
| `KU.bott` | data | β ∈ π_2KU, the image of [H] − 1 ∈ K̃(S²). |
| `KU.snaith` | equivalence | Σ^∞_+ℂP^∞[β^{−1}] ≃ KU as E_∞-rings. |
| `KU.unit` | projection | The unit map S → KU, inducing ℤ = π_0S → π_0KU = ℤ the identity. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `KU.pi0` | computation | π_0KU = ℤ. |
| `KU.pi_odd` | computation | π_1KU = 0. |
| `KU.point_K` | degenerate | KU⁰(pt) = K(pt) = ℤ. |
| `KU.not_HZ` | non-example | KU is not a generalised Eilenberg–Mac Lane spectrum although π_*KU = π_*(∏_n Σ^{2n}HZ): the first k-invariant of ku (from π_0 to π_2, the integral Bockstein of Sq²) is nonzero. |

**Used by.**

- RT.4:topological/connective-ku: ku := τ_{≥0}KU
- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH relative to ku and KU
- RT.4:Habiro-comparison/habiro-comparison-theorem: TC^{−(m)}(KU⊗S_R/KU)
- KTheoryFiniteLocalFields:L.1/fpsi: the fibre of ψ^q − 1 on (connective) K-theory

**Acceptance.**

- π_0 KU = ℤ, π_2 KU = ℤβ, π_1 KU = 0.
- KU⁰(S²) = K(S²).

**Depends on.** `RT.4:topological/bu-representability`, `RT.4:topological/reduced-and-graded-k`, `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, `RT.4:topological/splitting-principle`

**Source.** may-concise, Ch. 24 §2 'The Bott periodicity theorem', Definition, p. 208: “Definition. The K-theory Ω-prespectrum KU has spaces KU_{2i} = BU×Z and KU_{2i+1} = U for all i ≥ 0. The structure maps are given by the canonical homotopy equivalence U ≃ ΩBU = Ω(BU × Z) and the Bott equivalence BU × Z ≃ ΩU.” — May, Concise Course, Ch. 24 §2: the K-theory Ω-prespectrum KU with KU_{2i} = BU × ℤ and KU_{2i+1} = U.

**Source.** lurie-ec2, §6.5 'Application: Snaith's Theorem', Theorem 6.5.1, p. 274 (proof p. 275): “Theorem 6.5.1 (Snaith). The map Σ^∞_+(CP^∞)[β^{−1}] → KU is an equivalence of E∞-rings.” — Lurie, Elliptic Cohomology II, Theorem 6.5.1 (Snaith): Σ^∞_+(ℂP^∞)[β^{−1}] → KU is an equivalence of E_∞-rings.

**Source.** lurie-ec2, §0 (Introduction), Example 0.0.5, p. 4: “However, in the case R = Z and Ĝ = Ĝ_m, we can do better: KU is an E∞-ring spectrum. In other words, the multiplication on KU is commutative and associative not only up to homotopy, but up to coherent homotopy.” — Lurie, Elliptic Cohomology II, Example 0.0.5: KU is an E_∞-ring spectrum.

### `RT.4:topological/connective-ku` — Connective complex K-theory ku

*Definition.* ku := τ_{≥0}KU, the connective cover of KU (StableHomotopyKTheory H.5:spectra/postnikov-sections), with its E_∞-ring structure (the connective cover of an E_∞-ring is an E_∞-ring and τ_{≥0}KU → KU is an E_∞-map). β ∈ π_2 ku is the Bott class. The space-level description: Ω^∞ku = ℤ × BU.

**Hypotheses.**

- KU as in RT.4:topological/ku-spectrum.

**Construction and proof.**

1. Take the connective cover; τ_{≥0} is lax symmetric monoidal on spectra, so preserves E_∞-rings.
2. Lift β to π_2ku.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ku` | data | ku = τ_{≥0}KU as an E_∞-ring. |
| `ku.toKU` | projection | The E_∞-map ku → KU, an isomorphism on π_n for n ≥ 0. |
| `ku.bott` | data | β ∈ π_2 ku mapping to β ∈ π_2 KU. |
| `ku.infiniteLoopSpace` | compatibility | Ω^∞ku ≃ ℤ × BU. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `ku.pi_neg` | degenerate | π_{−2}ku = 0. |
| `ku.pi2` | computation | π_2 ku = ℤβ. |
| `ku.not_KU` | non-example | ku → KU is not an equivalence: π_{−2}KU = ℤ ≠ 0 = π_{−2}ku. |

**Used by.**

- RT.4:q-Hodge/ku-circle-actions: ku with trivial T-action and its Tate constructions
- RT.4:q-Hodge/thh-over-ku-q-de-rham: THH(−/ku)
- RT.4:q-Hodge/devalapurkar-comparison: Frobenius twist of ku_p

**Acceptance.**

- π_*ku = ℤ[β] (RT.4:topological/homotopy-of-ku).

**Depends on.** `RT.4:topological/ku-spectrum`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`

**Source.** lurie-ec2, §6.5 'Application: Snaith's Theorem', second paragraph, p. 273: “The group completion of N(Vect^≃_C) (with respect to the additive E∞-structure) is the 0th space of a connective spectrum, which we denote by ku and refer to as the connective complex K-theory spectrum.” — Lurie, Elliptic Cohomology II §6.5: ku is the connective spectrum whose 0th space is the group completion of N(Vect^≃_ℂ).

**Source.** lurie-ec2, §6.5, top of p. 274: “It follows that the connective complex K-theory spectrum ku inherits the structure of an E∞-ring. Moreover, the tautological map ξ : N(Vect^≃_C) → Ω^∞ ku can be regarded as a map of E∞-spaces, where we endow both sides with the multiplicative E∞-structure.” — Lurie §6.5: ku inherits an E_∞-ring structure.

### `RT.4:topological/homotopy-of-ku` — Homotopy rings of ku and KU ★

*Planet:* Homotopy of ku and KU.

*Theorem.* π_*ku ≅ ℤ[β] and π_*KU ≅ ℤ[β, β^{−1}] as graded rings, with |β| = 2.

**Hypotheses.**

- Products from the E_∞-structures of RT.4:topological/ku-spectrum.

**Construction and proof.**

1. π_nKU = K̃(S^n) by representability; compute with RT.4:topological/bott-periodicity: ℤβ^{n/2} for n even, 0 for n odd.
2. Multiplicativity: the external product of Bott classes is the Bott class of S⁴ (β·β = β² generates K̃(S⁴)).

**Acceptance.**

- π_4ku = ℤβ².
- π_{−2}KU = ℤβ^{−1}.

**Depends on.** `RT.4:topological/ku-spectrum`, `RT.4:topological/connective-ku`, `RT.4:topological/bott-periodicity`

**Source.** lurie-ec2, §6.5, Proof of Theorem 6.5.1, p. 275: “It follows from Bott periodicity that the element β induces an isomorphism of graded rings Z[β] → π_*(ku), hence an isomorphism of localizations Z[β^{±1}] → π_*(ku[β^{−1}]) = π_*(KU).” — Lurie, proof of Theorem 6.5.1: by Bott periodicity ℤ[β] → π_*(ku) is an isomorphism, hence ℤ[β^{±1}] ≅ π_*(ku[β^{−1}]).

**Source.** lurie-ec2, §6.5, Corollary 6.5.3, p. 275: “Corollary 6.5.3. The Bott element β ∈ π_2(Σ^∞_+(CP^∞)) induces an isomorphism of graded rings Z[β^{±1}] → π_*(Σ^∞_+(CP^∞)[β^{−1}]).” — Lurie, Corollary 6.5.3: ℤ[β^{±1}] ≅ π_*(Σ^∞_+(ℂP^∞)[β^{−1}]).

### `RT.4:topological/bott-localisation` — KU is the Bott localisation of ku

*Theorem.* The E_∞-map ku → KU exhibits KU as ku[β^{−1}] = colim(ku →^{β} Σ^{−2}ku →^{β} Σ^{−4}ku → …), the localisation of ku at β, as E_∞-ku-algebras; for every ku-module M, M ⊗_{ku} KU ≃ M[β^{−1}].

**Hypotheses.**

- Sequential homotopy colimits of spectra (StableHomotopyKTheory H.5:spectra).

**Construction and proof.**

1. Both sides have π_* = ℤ[β^{±1}] and the map is multiplication-compatible (RT.4:topological/homotopy-of-ku).
2. Localisation of E_∞-rings at a homotopy element (telescope) is an E_∞-ring with the universal property; check the comparison on π_*.

**Acceptance.**

- π_*(ku[β^{−1}]) = ℤ[β^{±1}].
- ku/β ≃ HZ while KU/β ≃ 0.

**Depends on.** `RT.4:topological/homotopy-of-ku`, `StableHomotopyKTheory:H.5:spectra/sequential-homotopy-colimit`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`

**Source.** lurie-ec2, §6.5, p. 274 (paragraph before Theorem 6.5.1): “Inverting β on both sides (see Proposition 4.3.17), we obtain a morphism of E∞-rings Σ^∞_+(CP^∞)[β^{−1}] → ku[β^{−1}]. We denote the localization ku[β^{−1}] by KU and refer to it as the periodic complex K-theory spectrum.” — Lurie §6.5: the localisation ku[β^{−1}] is KU, periodic complex K-theory.

### `RT.4:topological/splitting-principle` — The splitting principle

*Theorem.* For a complex vector bundle E → X over compact Hausdorff X, there is a compact space F(E) (the flag bundle) and a map p : F(E) → X such that p*E is a direct sum of line bundles and p* : K(X) → K(F(E)) is injective (and p* : H^*(X; ℤ) → H^*(F(E); ℤ) is injective).

**Hypotheses.**

- X compact Hausdorff.

**Construction and proof.**

1. Iterate the projective bundle P(E): K(P(E)) is free over K(X) on 1, L, …, L^{n−1} (Leray–Hirsch for K-theory, Hatcher Theorem 2.16) and p*E splits off the tautological line L.
2. Induct on rank.

**Acceptance.**

- For E a sum of line bundles, F(E) can be taken to be X itself.

**Depends on.** `RT.4:topological/complex-k-theory`, `RT.4:topological/bott-periodicity`

**Source.** hatcher-vbkt, Ch. 2, §2.3 'Division Algebras and Parallelizable Spheres', subsection 'Adams Operations', unnumbered boxed statement 'The Splitting Principle', p. 63: “The Splitting Principle. Given a vector bundle E→X with X compact Hausdorff, there is a compact Hausdorff space F(E) and a map p:F(E)→X such that the induced map p*:K*(X)→K*(F(E)) is injective and p*(E) splits as a sum of line bundles.” — Hatcher: the splitting principle via flag bundles, with injectivity on K-theory.

### `RT.4:topological/lambda-ring-k` — Exterior powers make K(X) a special λ-ring

*Construction.* For compact Hausdorff X, λ^i[E] := [Λ^iE] (fibrewise exterior power) extends, via λ_t(E ⊕ F) = λ_t(E)λ_t(F), to operations λ^i : K(X) → K(X) making K(X) a pre-λ-ring in the sense of KTheoryLowDegrees Z.3/pre-lambda-ring, and in fact a special λ-ring (Z.3/special-lambda-ring), augmented by rank; f* is a λ-ring homomorphism.

**Hypotheses.**

- X compact Hausdorff.

**Construction and proof.**

1. Exterior powers of bundles and Λ^n(E⊕F) ≅ ⊕_{i+j=n} Λ^iE ⊗ Λ^jF (Hatcher §2.3).
2. λ_t is a homomorphism from (Vect, ⊕) to 1 + tK(X)[[t]]; extend to K(X) by the Grothendieck group universal property.
3. Specialness: by the splitting principle (RT.4:topological/splitting-principle) and the identity principle of KTheoryLowDegrees Z.3/lambda-identity-principle, it suffices to check the universal polynomial identities on sums of line bundles, where they are the defining identities.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TopK.lambda` | data | λ^i : K(X) → K(X) with λ^i[E] = [Λ^iE]. |
| `TopK.instPreLambdaRing` | instance | K(X) is a pre-λ-ring (KTheoryLowDegrees Z.3/pre-lambda-ring). |
| `TopK.instSpecialLambdaRing` | instance | K(X) is a special λ-ring. |
| `TopK.lambda_pullback` | functoriality | f* commutes with every λ^i. |
| `TopK.lambda_line` | simp | λ_t[L] = 1 + [L]t for a line bundle L. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TopK.lambda_point` | computation | On K(pt) = ℤ, λ^i(n) = binomial(n, i). |
| `TopK.lambda_zero` | degenerate | λ^0 = 1 and λ^1 = id. |
| `TopK.lambda_not_additive` | non-example | λ² is not additive: λ²(2·1) = 1 ≠ 2λ²(1) = 0 in K(pt). |

**Used by.**

- RT.4:topological/adams-operations: ψ^k is defined from λ^i by the Newton formula
- KTheoryFiniteLocalFields:L.1/brauer-lift-lambda-ring: the λ-ring structure on [X, BU] and representation rings

**Acceptance.**

- λ^i[L] = 0 for i ≥ 2 and a line bundle L.
- λ^n[ℂ^n] = 1 and λ^{n+1}[ℂ^n] = 0 on the trivial bundle.

**Depends on.** `RT.4:topological/complex-k-theory`, `RT.4:topological/splitting-principle`, `KTheoryLowDegrees:Z.3/pre-lambda-ring`, `KTheoryLowDegrees:Z.3/special-lambda-ring`, `KTheoryLowDegrees:Z.3/lambda-identity-principle`

**Source.** hatcher-vbkt, Ch. 2, §2.3, subsection 'Adams Operations', properties (i)–(iv) listed after Theorem 2.20, p. 62: “(i) λ^k(E_1 ⊕ E_2) ≈ ⊕_i (λ^i(E_1) ⊗ λ^{k−i}(E_2)). (ii) λ^0(E) = 1, the trivial line bundle. (iii) λ^1(E) = E. (iv) λ^k(E) = 0 for k greater than the maximum dimension of the fibers of E.” — Hatcher §2.3: λ^i via exterior powers with λ_t(E ⊕ F) = λ_t(E)λ_t(F).

### `RT.4:topological/adams-operations` — Adams operations on topological K-theory ★

*Planet:* Adams operations.

*Construction.* For k ≥ 1 the Adams operation ψ^k : K(X) → K(X) is the operation of KTheoryLowDegrees Z.3/adams-operations on the special λ-ring K(X). It is a natural ring homomorphism with ψ^k[L] = [L]^k for line bundles L, ψ^kψ^l = ψ^{kl}, ψ^p(x) ≡ x^p mod p for p prime, and ψ^k acts on K̃(S^{2n}) ≅ ℤ by multiplication by k^n (so ψ^k(β) = kβ on K̃(S²)). ψ^{−1} is complex conjugation of bundles.

**Hypotheses.**

- X compact Hausdorff; k ≥ 1 (and k = −1 via conjugation).

**Construction and proof.**

1. Import the definition and the ring-endomorphism and composition theorems for special λ-rings (KTheoryLowDegrees Z.3/adams-operations, /adams-ring-endomorphism, /adams-composition).
2. Compute on line bundles: ψ^k(L) = L^k.
3. On K̃(S^{2n}): β^n is a product of n Bott classes pulled back from S² factors (external product), and ψ^k(β) = (H^k − 1) = k(H − 1) = kβ in K(S²) since (H − 1)² = 0 (Hatcher Theorem 2.20).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TopK.adams` | data | ψ^k : K(X) → K(X). |
| `TopK.adams_ringHom` | structure | ψ^k is a ring homomorphism natural in X. |
| `TopK.adams_line` | simp | ψ^k[L] = [L]^k for a line bundle L. |
| `TopK.adams_comp` | relation | ψ^k ∘ ψ^l = ψ^{kl}. |
| `TopK.adams_frobenius` | relation | ψ^p(x) ≡ x^p mod pK(X). |
| `TopK.adams_sphere` | example | ψ^k = k^n on K̃(S^{2n}). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TopK.adams_one` | degenerate | ψ^1 = id. |
| `TopK.adams_bott` | computation | ψ²(β) = 2β in K̃(S²). |
| `TopK.adams_not_power` | non-example | ψ^k(x) ≠ x^k in general: on K̃(S²), β² = 0 but ψ²(β) = 2β ≠ 0. |

**Used by.**

- KTheoryFiniteLocalFields:L.1/fpsi: Quillen's FΨ^q is the homotopy fibre of ψ^q − 1 on ℤ × BU
- KTheoryFiniteLocalFields:L.1/frobenius-is-adams: comparison of Frobenius with ψ^q
- BorelRegulators:R.4/regulator-adams-products: ψ^a(ch_j) = a^j ch_j

**Acceptance.**

- ψ^k acts on K̃(S^{2n}) by k^n; ψ²(β) = 2β.
- ψ^k = id on K(pt).

**Depends on.** `RT.4:topological/lambda-ring-k`, `RT.4:topological/bott-periodicity`, `KTheoryLowDegrees:Z.3/adams-operations`, `KTheoryLowDegrees:Z.3/adams-ring-endomorphism`, `KTheoryLowDegrees:Z.3/adams-composition`

**Source.** hatcher-vbkt, Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64): “There exist ring homomorphisms ψ^k:K(X)→K(X), defined for all compact Hausdorff spaces X and all integers k ≥ 0, and satisfying: (1) ψ^k f* = f*ψ^k for all maps f:X→Y. (Naturality) (2) ψ^k(L) = L^k if L is a line bundle. (3) ψ^k ∘ ψ^ℓ = ψ^{kℓ}. (4) ψ^p(α) ≡ α^p mod p for p prime.” — Hatcher Theorem 2.20: Adams operations ψ^k with ψ^k(L) = L^k, multiplicativity, ψ^kψ^l = ψ^{kl}, ψ^p(x) ≡ x^p mod p and ψ^k = k^n on K̃(S^{2n}).

### `RT.4:topological/adams-operations-spectra` — Adams operations on ℤ × BU and on KU[1/k]

*Construction.* The Adams operations of RT.4:topological/adams-operations are represented by H-maps ψ^k : ℤ × BU → ℤ × BU (unique up to homotopy since K^1 of finite skeleta of BU vanishes and lim¹ vanishes on the Grassmannian tower), with ψ^jψ^k ≃ ψ^{jk}, ψ^jψ^k ≃ ψ^kψ^j and ψ^k = k^i on π_{2i}(BU) ≅ K̃(S^{2i}). After inverting k they assemble to a map of E_∞-rings ψ^k : KU[1/k] → KU[1/k] with ψ^k(β) = kβ, and to an E_∞-map on ku[1/k] (stable Adams operations).

**Hypotheses.**

- k ≥ 1; for the stable maps k is inverted.

**Construction and proof.**

1. Representability: K(X) = [X, ℤ × BU] for finite X (RT.4:topological/bu-representability); natural transformations of K(−) on finite CW complexes come from maps of ℤ × BU when the relevant lim¹ vanishes (K^1 of even Grassmannian skeleta is zero).
2. Stable version: ψ^k commutes with the Bott map up to the factor k (ψ^k(β) = kβ), so after inverting k the maps on ℤ × BU commute with the structure maps of KU and define a spectrum map; E_∞-structure via Snaith's description (ψ^k on Σ^∞_+ℂP^∞ is induced by the k-th power map of ℂP^∞, which inverts β up to k).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `BU.adams` | data | ψ^k : ℤ × BU → ℤ × BU, an H-map. |
| `BU.adams_homotopy` | simp | π_{2i}(ψ^k) = k^i. |
| `BU.adams_comm` | relation | ψ^jψ^k ≃ ψ^{jk} ≃ ψ^kψ^j. |
| `KU.adams` | data | ψ^k : KU[1/k] → KU[1/k] as E_∞-maps with ψ^k(β) = kβ. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `BU.adams_one` | degenerate | ψ^1 ≃ id. |
| `KU.adams_bott` | computation | ψ^2(β) = 2β in π_2KU[1/2]. |
| `KU.adams_not_integral` | non-example | ψ² does not extend to an E_∞-self-map of KU itself compatible with ψ²(β) = 2β and an inverse of β: on π_{−2}KU it would have to be multiplication by 1/2. |

**Used by.**

- KTheoryFiniteLocalFields:L.1/fpsi: FΨ^q = hofib(ψ^q − 1 : ℤ × BU → BU)
- RT.4:q-Hodge/ku-circle-actions: the ℤ_p^× action on ku_p by Adams operations in Devalapurkar's comparison

**Acceptance.**

- π_{2i}ψ^k = k^i on π_{2i}KU[1/k].
- ψ^1 = id.

**Depends on.** `RT.4:topological/adams-operations`, `RT.4:topological/bu-representability`, `RT.4:topological/ku-spectrum`, `RT.4:topological/connective-ku`

**Source.** hatcher-vbkt, Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64): “There exist ring homomorphisms ψ^k:K(X)→K(X), defined for all compact Hausdorff spaces X and all integers k ≥ 0, and satisfying: (1) ψ^k f* = f*ψ^k for all maps f:X→Y. (Naturality) (2) ψ^k(L) = L^k if L is a line bundle. (3) ψ^k ∘ ψ^ℓ = ψ^{kℓ}. (4) ψ^p(α) ≡ α^p mod p for p prime.” — Hatcher Theorem 2.20 (ψ^k = k^n on K̃(S^{2n})), the input for the action on π_{2i}(BU).

**Source.** gepner-snaith-09, §1 'Introduction', §1.1 'Background and motivation', second paragraph, p. 1: “the ring spectra Σ^∞_+BU[1/β] and Σ^∞_+CP^∞[1/β], obtained as above by taking X to be BU_+ or P^∞_+ and β a generator of π_2X (a copy of Z in both cases), represent periodic complex cobordism and topological K-theory, respectively.” — Snaith's description of KU used to make ψ^k a map of E_∞-rings after inverting k.

### `RT.4:topological/chern-classes` — Chern classes and the cohomology of BU

*Definition.* Each complex vector bundle E over a paracompact X has Chern classes c_i(E) ∈ H^{2i}(X; ℤ) (singular cohomology, represented by Eilenberg–Mac Lane spectra, StableHomotopyKTheory H.5:spectra/eilenberg-maclane-cohomology), characterised by naturality, the Whitney formula c(E ⊕ F) = c(E)c(F), c_i(E) = 0 for i > rank E, and c_1 of the tautological line bundle on ℂP^∞ the standard generator. H^*(BU(n); ℤ) = ℤ[c_1, …, c_n] and H^*(BU; ℤ) = ℤ[c_1, c_2, …]; the Adams operation ψ^q acts on H^{2i}(BU; 𝔽_ℓ) so that ψ^{q*}c_i ≡ q^i c_i on primitive generators (the form used by KTheoryFiniteLocalFields L.1).

**Hypotheses.**

- X paracompact; ordinary cohomology with integer or 𝔽_ℓ coefficients.

**Construction and proof.**

1. Construct c via the Leray–Hirsch theorem for the projective bundle P(E) (Grothendieck's definition) or via H^*(G_n) (Hatcher Chapter 3).
2. Compute H^*(BU(n)) by induction with the Gysin sequence of BU(n−1) → BU(n) (or by the splitting principle).
3. ψ^q on cohomology: compute on the maximal torus (sums of line bundles), where ψ^q is the q-th power and c_1 ↦ qc_1.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `chernClass` | data | c_i(E) ∈ H^{2i}(X; ℤ). |
| `chernClass.natural` | functoriality | c_i(f*E) = f*c_i(E). |
| `chernClass.whitney` | relation | c(E ⊕ F) = c(E) ∪ c(F). |
| `chernClass.line` | simp | c(L) = 1 + c_1(L); c_1(L⊗L′) = c_1(L) + c_1(L′). |
| `cohomology_BU` | characterisation | H^*(BU; ℤ) = ℤ[c_1, c_2, …]. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `chernClass.trivial` | degenerate | c(ε^n) = 1. |
| `chernClass.CP1` | computation | c_1(H) generates H²(ℂP¹; ℤ) = ℤ. |
| `chernClass.not_K` | non-example | The total Chern class is not additive: on ℂP^∞ × ℂP^∞, c(L ⊕ L′) = (1 + x)(1 + y) ≠ 1 + x + y, so c is a homomorphism from (K(X), +) to the multiplicative group of units of H^{ev}(X; ℤ), not to the additive group. |

**Used by.**

- KTheoryFiniteLocalFields:L.1/fpsi-cohomology: the cohomology of FΨ^q uses H^*(BU; 𝔽_ℓ) and ψ^q on c_i
- RT.4:topological/chern-character: ch is built from Chern classes via Newton polynomials

**Acceptance.**

- c(H) = 1 + x for the tautological bundle on ℂP^n, H^*(ℂP^n) = ℤ[x]/x^{n+1}.
- c_1 is additive on line bundles: c_1(L ⊗ L′) = c_1(L) + c_1(L′).

**Depends on.** `RT.4:topological/splitting-principle`, `RT.4:topological/bu-representability`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-cohomology`

**Source.** hatcher-vbkt, Ch. 3, §3.1 'Stiefel-Whitney and Chern Classes', subsection 'Axioms and Construction', Theorem 3.2 axioms (a)–(d), p. 78: “(a) c_i(f*(E)) = f*(c_i(E)) for a pullback f*(E). (b) c(E_1 ⊕ E_2) = c(E_1) ⌣ c(E_2) for c = 1 + c_1 + c_2 + ··· ∈ H*(B;Z). (c) c_i(E) = 0 if i > dim E. (d) For the canonical line bundle E→CP^∞, c_1(E) is a generator of H^2(CP^∞;Z) specified in advance.” — Hatcher §3.1: the axioms for Chern classes.

**Source.** hatcher-vbkt, Ch. 3, §3.1, subsection 'Cohomology of Grassmannians', Theorem 3.9 (second sentence), p. 84: “Similarly, in the complex case H*(G_n(C^∞);Z) ≈ Z[c_1, ··· , c_n] where c_i = c_i(E_n(C^∞)) for the universal bundle E_n(C^∞)→G_n(C^∞).” — Hatcher Theorem 3.9: H^*(G_n(ℂ^∞); ℤ) ≅ ℤ[c_1, …, c_n].

**Source.** may-concise, Ch. 24 §2, last lines of p. 207 (H*(BU(n); Z) = Z[c_1, ..., c_n] is the Theorem in Ch. 23 §7, p. 199): “Since H^*(BU(n)) = Z[c_1, . . ., c_n], H^*(BU) ≅ Z[c_i|i ≥ 1].” — May, Ch. 24 §2: H^*(BU) ≅ ℤ[c_i | i ≥ 1].

### `RT.4:topological/chern-character` — The Chern character

*Construction.* The Chern character ch : K(X) → H^{ev}(X; ℚ) = ⊕_i H^{2i}(X; ℚ) is the unique natural ring homomorphism with ch(L) = e^{c_1(L)} for line bundles L (defined on general bundles through Newton polynomials in Chern classes, by the splitting principle); ch_j(ψ^k x) = k^j ch_j(x); and for a finite CW complex X, ch ⊗ ℚ : K^*(X) ⊗ ℚ ≅ H^{*}(X; ℚ) (even/odd periodised).

**Hypotheses.**

- X compact Hausdorff (finite CW for the rational isomorphism).

**Construction and proof.**

1. Define ch(E) = rank E + Σ_{j≥1} s_j(c(E))/j! with s_j the Newton polynomials; multiplicativity and additivity by the splitting principle.
2. ψ^k scales degree-2j part by k^j: check on line bundles.
3. Rational isomorphism for spheres (ch(β) = generator of H²) and Mayer–Vietoris / Atiyah–Hirzebruch induction on cells (StableHomotopyKTheory H.6/atiyah-hirzebruch-spectral-sequence).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `chernCharacter` | data | ch : K(X) → H^{ev}(X; ℚ), a ring homomorphism. |
| `chernCharacter.line` | simp | ch(L) = exp(c_1(L)). |
| `chernCharacter.adams` | relation | ch_j ∘ ψ^k = k^j ch_j. |
| `chernCharacter.rational_iso` | characterisation | For finite CW X, ch ⊗ ℚ is an isomorphism of ℤ/2-graded rings. |
| `chernCharacter.natural` | functoriality | ch commutes with pullback. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `chernCharacter.trivial` | degenerate | ch(ε^n) = n. |
| `chernCharacter.sphere` | computation | ch(β) is the generator of H²(S²; ℤ) ⊂ H²(S²; ℚ). |
| `chernCharacter.not_integral` | non-example | ch is not integral in general: for ℂP², ch(H) = 1 + x + x²/2 has a non-integral coefficient. |

**Used by.**

- BorelRegulators:R.4/universal-borel-class: universal Chern character and the (j−1)! normalisation
- BorelRegulators:R.4/regulator-adams-products: ψ^a(ch_j) = a^j ch_j

**Acceptance.**

- ch(β) = x ∈ H²(S²; ℚ), integral.
- ch is an isomorphism K(S^{2n}) ⊗ ℚ ≅ H^{ev}(S^{2n}; ℚ).

**Depends on.** `RT.4:topological/chern-classes`, `RT.4:topological/adams-operations`, `RT.4:topological/splitting-principle`, `StableHomotopyKTheory:H.6/atiyah-hirzebruch-spectral-sequence`, `StableHomotopyKTheory:H.6/rationalisation`

**Source.** hatcher-vbkt, Ch. 4 'The J-Homomorphism', §4.1 'Lower Bounds on Im J', subsection 'The Chern Character', p. 109: “ch(E) = dim E + Σ_{k>0} s_k(c_1(E), ··· , c_k(E))/k! The right side of this equation is defined for arbitrary vector bundles E, so we take this as our general definition of ch(E).” — Hatcher: the Chern character as a ring homomorphism K(X) → H^{ev}(X; ℚ), rational isomorphism for finite CW complexes.

### `RT.4:topological/relative-thh-ku` — THH relative to ku and KU

*Theorem.* For an E_1-ring S_R (for instance a spherical lift, RT.4:q-Hodge/spherical-lift) the base-change equivalences of RT.2/relative-thh give THH(ku ⊗ S_R/ku) ≃ ku ⊗ THH(S_R) and THH(KU ⊗ S_R/KU) ≃ KU ⊗ THH(S_R), T-equivariantly with T acting trivially on ku and KU; in particular THH(ku/ku) ≃ ku and THH(KU/KU) ≃ KU with trivial action, so TC⁻(ku/ku) = ku^{hT} with π_* = ℤ[β][[t]] (RT.4:topological/ku-circle-actions). Absolute THH(ku) differs: it is not ku ⊗ THH(S) = ku, since rationally THH(ku) ⊗ ℚ ≃ HH(ℚ[β]/ℚ) has the class dβ in degree 3, so π_3THH(ku) ⊗ ℚ ≠ 0. Relative THH over ku carries no cyclotomic Frobenius unless the ku-structure is twisted (Wagner's cyclonic structure, RT.4:q-Hodge/cyclonic-ku).

**Hypotheses.**

- S_R an E_1-ring; ku and KU with the E_∞-structures of RT.4:topological/ku-spectrum and /connective-ku.

**Construction and proof.**

1. Apply THH(A ⊗ k/k) ≃ THH(A) ⊗ k for an E_∞-ring k and an E_1-ring A (RT.2/relative-thh, base change of cyclic bar constructions) with k = ku, KU (Wagner 1.12).
2. THH(S) ≃ S gives THH(ku/ku) ≃ ku; the circle acts trivially on the base change factor.
3. For the absolute comparison, rationalise: THH(ku) ⊗ ℚ ≃ HH(ℚ[β]/ℚ) ≃ ℚ[β] ⊗ Λ(dβ) by RT.2/thh-over-thhz and RT.1/hkr-theorem, which has π_3 ≠ 0.

**Acceptance.**

- THH(ku ⊗ S[x]/ku) ≃ ku ⊗ Σ^∞_+B^{cyc}ℕ-type decomposition by weight (Raksit's example, RT.4:q-Hodge/raksit-polynomial-example).
- THH(ku/ku) ≃ ku with trivial T-action.

**Depends on.** `RT.2/relative-thh`, `RT.2/thh-e1-ring`, `RT.4:topological/ku-spectrum`, `RT.4:topological/connective-ku`

**Source.** wagner-ku-25, §3.1 'Solid THH', p. 25: “For any E∞-algebra k in Sp_■, the module ∞-category Mod_k(Sp_■) is symmetric monoidal for the solid tensor product − ⊗^■_k −. We can then consider topological Hochschild homology inside Mod_k(Sp_■). This yields a functor THH_■(−/k): Alg_{E_1}(Mod_k(Sp_■)) → Mod_k(Sp_■)^{BS^1}.” — Wagner §3.1 and 1.12: THH(ku ⊗ S_R/ku) ≃ THH(S_R) ⊗ ku and THH formed in ku-modules.

### `RT.4:topological/ku-circle-actions` — ku and KU with circle and cyclic-group actions

*Theorem.* For ku with trivial T-action: π_*(ku^{hT}) ≅ ℤ[β][[t]] with |β| = 2, |t| = −2, where q ∈ π_0(ku^{hT}) ≅ ku^0(BT) is the class of the standard representation and t is the complex orientation with q − 1 = βt (q is strict: it comes from an E_∞-map S[q] → ku^{hT}); the formal group law of ku is x + y + βxy. Then π_*(ku^{tT}) ≅ ℤ[β]((t)), and p-adically π_*(ku^{tC_p}) ≅ π_*(ku^{tT})/[p]_q with [p]_q = (q^p − 1)/(q − 1), so π_0(ku_p^{tC_p}) ≅ ℤ_p[ζ_p] with q ↦ ζ_p; the Tate-valued Frobenius of ku_p with trivial cyclotomic structure sends β to (ζ_p − 1)u with u = t^{−1}. After inverting β, π_0(KU^{hT}) ≅ ℤ[[q − 1]]. The genuine C_m-fixed points of ku used for cyclonic spectra are in RT.4:q-Hodge/cyclonic-ku.

**Hypotheses.**

- Trivial T-action on ku, KU; complex orientation of ku from RT.4:topological/ku-spectrum (Snaith).

**Construction and proof.**

1. Homotopy fixed point spectral sequence H^*(BT; π_*ku) ⇒ π_*ku^{hT} degenerates (even); t is the Euler class of the tautological line bundle, and the ku-Euler class of the C_m-representation is [m]_{1+βt}·t.
2. Tate constructions: invert t (T) or kill the Euler class (C_m) (RT.2/circle-tate, RT.2/norm-map-tate).

**Acceptance.**

- Setting β = 0 recovers π_*(HZ^{hT}) = ℤ[t] (ku → HZ).
- For m = 1, [1]_q = 1.

**Depends on.** `RT.4:topological/homotopy-of-ku`, `RT.4:topological/connective-ku`, `RT.2/homotopy-orbits-fixed-points`, `RT.2/circle-tate`, `RT.2/norm-map-tate`

**Source.** wagner-ku-25, §1.3, Notation and conventions 1.16(e) 'Homotopy classes of ku^{hS^1}', p. 9: “We denote by β ∈ π_2(ku) the Bott element and by q ∈ π_0(ku^{hS^1}) the class corresponding to the standard representation of S^1 on C. There's a unique complex orientation t ∈ π_{−2}(ku^{hS^1}) satisfying q − 1 = βt; then π_∗(ku^{hS^1}) ≅ Z[β]⟦t⟧.” — Wagner 1.16(e): π_*(ku^{hS¹}) ≅ ℤ[β][[t]] with q − 1 = βt.

**Source.** wagner-ku-25, §4.2, proof of Theorem 4.16, pp. 43-44: “Since [p]_q = 0 holds in π_∗(ku^{tC_p}) ≅ π_∗(ku^{tS^1})/[p]_q and any nullhomotopy witnessing this must be unique by evenness, we get our desired E_2-S_p⟦q−1⟧-algebra map Z_p[ζ_p] → ku^{tC_p}.” — Wagner, proof of Theorem 4.16: π_*(ku^{tC_p}) ≅ π_*(ku^{tS¹})/[p]_q, π_0 = ℤ_p[ζ_p] p-adically.

**Source.** devalapurkar-raksit-25, §1.2, Proposition 1.2.5 (second part), p. 10: “Moreover, the map π_∗(ϕ_{ku_p^{triv}}): π_∗(ku_p) → π_∗(ku_p^{tC_p}) sends β ↦ (ζ_p − 1)u.” — Devalapurkar–Raksit Proposition 1.2.5: the Tate-valued Frobenius of ku_p sends the Bott class to (ζ_p − 1)u.

## RT.4:q-Hodge. q-Hodge filtrations from THH over ku

Wagner constructs q-Hodge filtrations on derived q-de Rham complexes from THH relative to ku of a
spherical lift S_R: the completed q-Hodge filtration is the double-speed graded piece of the circle
even filtration on TC⁻(ku ⊗ S_R/ku). The proof needs light condensed solid spectra and nuclear
objects, the even filtration in the forms of Hahn–Raksit–Wilson, Pstrągowski and Wagner's solid
version, Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with τ_{≥0}(ku_p^{tC_p}) at odd primes (with
Nikolaus's E₁ version at all primes), and a profinite–rational gluing. The prime 2 is treated
separately under the E₁ hypothesis. Cyclonic spectra (genuine for finite cyclic subgroups) and
TC^{−(m)} provide the m-twisted versions, built for ku by the bounded-below formula and for KU by
Bott localisation.

**Planets.** Devalapurkar's comparison, q-Hodge filtration from THH over ku, Cyclonic spectra.

**Within this roadmap it uses** RT.1, RT.2, RT.4:topological.

**From other roadmaps and the libraries it uses** `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`, `DerivedDeRhamCohomology:DD.1/filtered-modules`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `HabiroCohomologyFoundations:HQ.3`, `HabiroRings:HR.1/perfectly-covered`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.6/arithmetic-fracture-square`, `StableHomotopyKTheory:H.6/p-completion`, `VStackSheavesAndLisseCategories:VS2/solid-abelian-groups`.

**Acceptance tests of the layer.** Each node below lists its acceptance properties; the layer is accepted when every node's acceptance list and every unit test holds.

### `RT.4:q-Hodge/spherical-lift` — Spherical lifts and the base hypotheses

*Definition.* Fix a prime p. (Base, Wagner 3.1) A is a p-complete, p-completely perfectly covered δ-ring with a p-complete connective E_∞-ring S_A, S_A ⊗_{S_p} ℤ_p ≃ A, whose Tate-valued Frobenius lifts φ on π_0 and carries an S¹-equivariant E_∞-structure (trivial action on S_A, residual S¹/C_p-action on S_A^{tC_p}), making S_A a p-cyclotomic base; ku_A := (ku ⊗ S_A)^∧_p. (Ring, Wagner 3.2) R is a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A (L_{R/A} of p-complete Tor-amplitude in homological degrees [0,1]), satisfying either (E_2): a p-complete connective E_2-algebra S_R in S_A-modules with S_R ⊗_{S_A} A ≃ R, or (E_1): R p-torsion free with a p-quasi-syntomic cover R → R_∞, R_∞/p relatively semiperfect over A, and an E_1-lift S_R → S_{R_∞}^• of the Čech nerve; ku_R := (ku ⊗ S_R)^∧_p. (Global, Wagner 4.18) A a perfectly covered Λ-ring with these lifts at every prime, R quasi-lci over A with bounded p^∞-torsion for all p, a per-prime choice of (E_2)/(E_1), and the addendum (R_2): R̂_2 satisfies (E_1) (automatic when 2 ∈ R^×); the lifts glue to S_A (E_∞) and S_R (E_1, or E_2 if (E_2) is chosen at every p) with S_R ⊗ ℤ ≃ R. For A = ℤ, Theorem 1.2's hypothesis is: R quasi-syntomic with 2 ∈ R^× and a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R. A lift merely to an E_1- or E_2-ku-algebra is not a spherical lift.

**Hypotheses.**

- p fixed for the p-complete conditions; the global condition quantifies over all primes.

**Construction and proof.**

1. Record the conditions as data: S_A ∈ CAlg(Sp^∧_p) with the stated Frobenius structure, S_R ∈ Alg_{E_2}(Mod_{S_A}) or the E_1-Čech-nerve datum.
2. Glue the per-prime lifts with the rational lift by the arithmetic fracture square (Wagner 4.18; the gluing is asserted there without proof and is recorded as a step here).
3. Examples: étale-framed smooth algebras have canonical E_∞-lifts (Wagner Example 6.7, via Lurie HA 7.5); Burklund's quotients S_{S,□}/(y_i^{α_i}) give E_2-lifts of S/(y^α) (Example 6.8).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `SphericalLift` | structure | S_R with an equivalence S_R ⊗ ℤ ≃ R (E_1 or E_2 recorded as a parameter). |
| `CyclotomicBase` | structure | (A, S_A) satisfying Wagner 3.1(tC_p). |
| `SphericalLift.kuLift` | constructor | ku_R := ku ⊗ S_R, ku_A := ku ⊗ S_A (p-completed in the local case). |
| `SphericalLift.ofEtale` | example | Étale (and étale-framed smooth) A-algebras have canonical E_∞-lifts. |
| `SphericalLift.glue` | other | Per-prime lifts and the rational lift glue to a global S_R (E_1, or E_2 if (E_2) at every p). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `SphericalLift.polynomial` | computation | S[x] is an E_∞-lift of ℤ[x]. |
| `SphericalLift.base` | degenerate | S itself lifts ℤ (A = R = ℤ). |
| `SphericalLift.ku_not_enough` | non-example | R = ℤ_p{x}_∞/x has an E_1-ku-algebra lift but the resulting filtration is not a q-deformation of the Hodge filtration (Wagner 1.11): a lift to ku is not a spherical lift. |

**Used by.**

- RT.4:q-Hodge/q-hodge-global: the hypotheses of Theorem 4.27
- HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations: HQ.5-trace imports the theorem with these hypotheses
- RT.4:Habiro-comparison/number-field-habiro: R = O_F[1/Δ] with its étale E_∞-lift

**Acceptance.**

- R = ℤ[x] with S_R = S[x] satisfies (E_2) at every prime.
- R = 𝔽_p does not satisfy 3.2(E_1): it is not p-torsion free.

**Depends on.** `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `DerivedDeRhamCohomology:DD.0/quasisyntomic-condition`, `HabiroRings:HR.1/perfectly-covered`, `StableHomotopyKTheory:H.6/arithmetic-fracture-square`, `StableHomotopyKTheory:H.6/p-completion`

**Source.** wagner-ku-25, §3 preamble, 3.1 'Assumptions on A', condition (tCp), p. 24: “(tCp) A has a lift to a p-complete connective E∞-ring spectrum S_A such that S_A ⊗_{S_p} Z_p ≃ A and such that the Tate-valued Frobenius ϕ_{tC_p}: S_A → S_A^{tC_p} agrees with the δ-ring Frobenius ϕ: A → A on π_0.” — Wagner §3, 3.1 (tC_p) and 3.2 (E_2)/(E_1): the assumptions on A and R.

**Source.** wagner-ku-25, §4.4, 4.18 (after (A),(R)), p. 46: “We note that the p-complete lifts S_{Â_p} and S_{R̂_p} for all primes p can be glued with A ⊗ Q and R ⊗ Q to a connective E∞-ring spectrum S_A and a connective E_1-algebra S_R ∈ Alg_{E_1}(Mod_{S_A}(Sp)) satisfying S_A ⊗ Z ≃ A and S_R ⊗ Z ≃ R.” — Wagner 4.18: the glued global lifts S_A, S_R, and the usages of spherical lifts.

**Source.** wagner-ku-25, §1.1, Theorem 1.2 (see Theorem 4.27), p. 3: “Let R be a quasi-syntomic ring such that 2 ∈ R^×. Assume that R admits a lift to a connective E_2-ring spectrum S_R such that S_R ⊗ Z ≃ R. Then the derived q-de Rham complex q-dR_{R/Z} can be equipped with a q-deformation of the Hodge filtration fil^⋆_{q-Hdg} q-dR_{R/Z},” — Wagner Theorem 1.2: a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R and 2 ∈ R^×.

### `RT.4:q-Hodge/solid-spectra` — Light condensed and solid spectra

*Definition.* Light condensed spectra Cond(Sp) are sheaves of spectra on light profinite sets; the discrete embedding X ↦ X̲ is fully faithful and symmetric monoidal. With Null := cofib(S[{∞}] → S[ℕ ∪ {∞}]) and σ its shift, solid spectra Sp_■ ⊆ Cond(Sp) are the objects M for which 1 − σ* induces an equivalence on Hom(Null, M); Sp_■ is closed under limits and colimits, the inclusion has a left adjoint (−)^■, the solid tensor product is M ⊗^■ N := (M ⊗ N)^■, and Null^■ ≃ ∏_ℕ S is a compact generator. p-completion (−)^∧_p : Sp^∧_p → Sp_■ is fully faithful and symmetric monoidal on bounded-below objects. This extends VStackSheavesAndLisseCategories VS2's solid abelian groups (Clausen–Scholze) from modules to spectra in the light setting used by Wagner.

**Hypotheses.**

- Light (ℵ_1-small) profinite sets; Clausen–Scholze's light solid formalism (recordings/notes; no published reference, as Wagner notes).

**Construction and proof.**

1. Define Cond(Sp) as hypercomplete sheaves on light profinite sets with values in Sp; import solid abelian groups from VS2 and define Sp_■ by the Null-sequence condition.
2. Construct the solidification left adjoint and solid tensor product; show Null^■ ≃ ∏_ℕ S generates.
3. Prove the p-complete bounded-below comparison (Wagner 2.2).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `SolidSpectrum` | data | Sp_■ ⊆ Cond(Sp). |
| `SolidSpectrum.solidify` | universal-property | (−)^■ : Cond(Sp) → Sp_■ left adjoint to the inclusion. |
| `SolidSpectrum.tensor` | structure | M ⊗^■ N := (M ⊗ N)^■, symmetric monoidal. |
| `SolidSpectrum.generator` | characterisation | Null^■ ≃ ∏_ℕ S is a compact generator. |
| `SolidSpectrum.ofPComplete` | coercion | p-complete bounded-below spectra embed fully faithfully and monoidally. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `SolidSpectrum.discrete` | degenerate | Discrete spectra are solid. |
| `SolidSpectrum.product` | computation | Null^■ ≃ ∏_ℕ S. |
| `SolidSpectrum.not_all_condensed` | non-example | The condensed spectrum S[ℕ ∪ {∞}] is not solid (its solidification is S ⊕ ∏_ℕ S-type, not itself). |

**Used by.**

- RT.4:q-Hodge/solid-even-filtration: the solid even filtration lives in Sp_■
- RT.4:q-Hodge/solid-thh-even-filtration: THH_■ is formed in solid ku-modules

**Acceptance.**

- For discrete X, X̲ is solid.
- ∏_ℕ S is solid; ⊕_ℕ S is solid but Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even.

**Depends on.** `VStackSheavesAndLisseCategories:VS2/solid-abelian-groups`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `StableHomotopyKTheory:H.6/p-completion`

**Source.** wagner-ku-25, §2 preamble, paragraph 2.1 'Solid condensed recollections', p. 11: “Let Cond(Sp) denote the ∞-category of (light) condensed spectra, that is, hypersheaves of spectra on the site of light profinite sets as defined by Clausen and Scholze [CS24].” — Wagner 2.1: light condensed recollections and the discrete embedding.

**Source.** wagner-ku-25, §2, paragraph 2.1, p. 11: “Recall that a condensed spectrum M is called solid if 1 − σ^∗: Hom_S(Null, M) → Hom_S(Null, M) is an equivalence, where Hom_S denotes the internal Hom in Cond(Sp).” — Wagner 2.1: Null, solid spectra, solidification and the solid tensor product.

**Source.** wagner-ku-25, §2, paragraph 2.2 'Solid condensed spectra and p-completions', p. 11: “The solid tensor product has the magical property that if M and N are p-complete and bounded below solid condensed spectra, then M ⊗^■ N is again p-complete; see [CS24, Lecture 6] or [Bos23, Proposition A.3].” — Wagner 2.2: p-complete bounded-below spectra embed fully faithfully and symmetric monoidally.

### `RT.4:q-Hodge/nuclear-objects` — Trace-class maps and nuclear modules

*Definition.* In a stable compactly generated symmetric monoidal ∞-category C with compact unit (in particular LMod_R(Sp_■)), a map φ : M → N is trace-class if it factors as M ≃ M ⊗ 1 → M ⊗ Hom_R(M, R) ⊗_R N → N for a classifier η : 1 → Hom_R(M, R) ⊗_R N; M is basic nuclear if M ≃ colim(M_0 → M_1 → …) with trace-class transition maps, and nuclear if it is in the subcategory generated by basic nuclear objects under colimits. Nuclear modules are closed under shifts and colimits, ω_1-compactly generated by basic nuclear objects, preserved by base change, and satisfy Hom_R(P, R) ⊗_R M ≃ Hom_R(P, M) for compact P (Wagner Theorem 2.11).

**Hypotheses.**

- R a solid E_1-ring satisfying Wagner's Assumption 2.13(R) where needed (discrete R or its p-completion).

**Construction and proof.**

1. Define trace-class maps and (basic) nuclear objects (Wagner 2.8, 2.10).
2. Prove Wagner Theorem 2.11 by the standard Clausen–Scholze arguments.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TraceClass` | characterisation | φ factors through a classifier 1 → Hom(M, R) ⊗ N. |
| `BasicNuclear` | data | Sequential colimits of trace-class maps. |
| `Nuclear` | data | The subcategory generated under colimits by basic nuclear modules. |
| `Nuclear.baseChange` | functoriality | S ⊗_R − preserves nuclear modules. |
| `Nuclear.homCompact` | relation | Hom_R(P, R) ⊗_R M ≃ Hom_R(P, M) for compact P and nuclear M. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `Nuclear.dualizable` | degenerate | Dualizable objects, in particular the unit R, are nuclear: the identity of a dualizable object is trace-class. |
| `TraceClass.dualizable_id` | computation | The identity of a dualizable object is trace-class. |
| `Nuclear.not_all` | non-example | Compactness does not make an identity trace-class: for discrete R the compact generator Null_R ≃ ∏_ℕ R is not dualizable (its dual Hom_R(Null_R, R) ≃ ⊕_ℕ R, Wagner 2.3), so 𝟙_{Null_R} is not trace-class. |

**Used by.**

- RT.4:q-Hodge/solid-even-filtration: solid faithfully flat descent is proved for nuclear inputs (Wagner Theorems 2.19–2.20)

**Acceptance.**

- Every dualizable object is nuclear, its identity being trace-class; compact objects need not be (RT.4:q-Hodge/nuclear-objects test Nuclear.not_all).

**Depends on.** `RT.4:q-Hodge/solid-spectra`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`

**Source.** wagner-ku-25, §2.2, paragraph 2.10 'Nuclear objects', p. 16: “A left R-module M is called nuclear if every morphism P → M from a compact left R-module P is trace-class.” — Wagner 2.8–2.11: trace-class maps, nuclear objects and their properties.

### `RT.4:q-Hodge/perfect-even-filtration` — Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)

*Definition.* (HRW) For an E_∞-ring E, fil^⋆_{ev}E := lim_{E → B, B even} τ_{≥2⋆}B, the right Kan extension of the double-speed Postnikov filtration from even E_∞-rings (π_* concentrated in even degrees). (Pstrągowski) For an E_1-ring R and a left R-module M, the perfect even filtration fil^⋆_{P-ev/R}M is obtained from the sheaf Hom_R(−, M) on perfect even R-modules (generated by shifts Σ^{2n}R and cofibres with even fibres) with the even topology, by taking double-speed sheaf truncations and evaluating at R; it is exhaustive, satisfies even faithfully flat descent, and for E_∞ inputs agrees with HRW's filtration after completion. For E with π_*E even, both are τ_{≥2⋆}E. For quasisyntomic rings, HRW recovers the BMS2 motivic filtration on THH, TC⁻, TP and TC.

**Hypotheses.**

- R an E_1-ring (Pstrągowski); E an E_∞-ring (HRW).

**Construction and proof.**

1. Define both filtrations (HRW Definition; Pstrągowski).
2. Prove flat descent and the comparison (Pstrągowski).
3. Record the comparison with BMS2 for quasisyntomic rings (HRW).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `evenFiltration` | data | fil^⋆_ev E for E_∞-rings (HRW). |
| `perfectEvenFiltration` | data | fil^⋆_{P-ev/R}M for an E_1-ring R and left R-module M. |
| `perfectEvenFiltration.even` | simp | If π_*M is even and M is even flat-type, fil = τ_{≥2⋆}M. |
| `perfectEvenFiltration.descent` | characterisation | Even faithfully flat descent: fil(M) ≃ lim_Δ fil(M ⊗_R S^•). |
| `perfectEvenFiltration.compare_HRW` | compatibility | For E_∞ inputs, agrees with HRW's even filtration after completion. |
| `perfectEvenFiltration.exhaustive` | other | Pstrągowski's filtration is always exhaustive. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `evenFiltration.even_ring` | computation | fil^⋆_ev ku = τ_{≥2⋆}ku, gr^n = Σ^{2n}H(π_{2n}ku). |
| `evenFiltration.zero` | degenerate | The even filtration of 0 is 0. |
| `evenFiltration.not_postnikov` | non-example | For E = S the even filtration is not the double-speed Postnikov filtration: by MU-descent fil^⋆_ev S is the (décalé) Adams–Novikov filtration, whose associated graded is the Adams–Novikov E_2-page, not π_*S. |

**Used by.**

- RT.4:q-Hodge/solid-even-filtration: the solid version agrees with Pstrągowski's on discrete inputs
- RT.4:q-Hodge/cyclonic-even-filtrations: genuine equivariant filtrations are built from Pstrągowski filtrations on geometric fixed points
- RT.6: the BMS2 motivic filtration is HRW's even filtration on quasisyntomic inputs

**Acceptance.**

- For E = ku (even), fil^⋆_{ev}ku = τ_{≥2⋆}ku.
- For E = HZ^{hT}, fil_ev recovers the t-adic filtration.

**Depends on.** `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `RT.2/thh-e1-ring`

**Source.** pstragowski-23, §2.3, Definition 2.21, p. 12: “Let R be an E_1-ring and M be an R-module. The even filtration of M is given by the filtered spectrum fil^q_ev(M) := Γ_{Perf_ev(R)}(R, τ_{≥2q} Y_R(M)), where the connective covers τ_{≥2q} Y_R(M) are calculated in the sheaf ∞-category.” — Pstrągowski: the perfect even filtration, its descent and comparison with HRW.

**Source.** hrw-22, §1.1, Definition 1.1.1, p. 2 (precise version: Construction 2.1.3, pp. 11-12): “An E∞-ring B is even if its homotopy groups π_∗B are concentrated in even degrees. For any E∞-ring A, we define fil^n_ev A to be the limit, over all maps of E∞-rings A → B with B even, of τ_{≥2n}B. Together, the spectra fil^n_ev A assemble to define a filtered E∞-ring fil^⋆_ev A.” — Hahn–Raksit–Wilson: the even filtration of E_∞-rings and the comparison with BMS2.

**Source.** wagner-ku-25, §1.1, paragraph 1.7 'Even filtrations', p. 4: “Since S_R is only assumed to be E_2, we cannot use the even filtration from [HRW22] on TC^−(ku ⊗ S_R/ku). Instead we'll work with Pstrągowski's perfect even filtration [Pst23], which is already defined for E_1-ring spectra.” — Wagner 1.7: the even filtration used is Pstrągowski's perfect even filtration.

### `RT.4:q-Hodge/solid-even-filtration` — The solid even filtration

*Definition.* For an E_1-algebra R in solid spectra Sp_■ and a left R-module M, the solid even filtration fil^⋆_{ev/R}M is the value at R of the double-speed sheaf truncations of the Sp_■-valued sheaf Hom_R(−, M) on solid perfect even R-modules Perf_ev(R_■) (generated by Σ^{2n}Null_R, Null_R := R ⊗^■ Null^■), with covers the maps with solid perfect even fibre. It is lax monoidal (Wagner 2.5); if π_*E is even then fil^⋆_{ev/R}E ≃ τ_{≥2⋆}E; for discrete homologically even inputs it agrees with Pstrągowski's filtration (Wagner Corollary 2.17); and it satisfies solid faithfully even flat descent for nuclear S over R up to completion (Theorems 2.19, 2.20).

**Hypotheses.**

- R a solid E_1-ring; descent under Assumption 2.13(R) and nuclearity.

**Construction and proof.**

1. Define the site and sheaf (Wagner 2.3–2.4) and the monoidal structure (2.5).
2. Compare with Pstrągowski (Corollary 2.17).
3. Prove descent (Theorems 2.19–2.20) using RT.4:q-Hodge/nuclear-objects.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `solidEvenFiltration` | data | fil^⋆_{ev/R}M in filtered solid spectra. |
| `solidEvenFiltration.laxMonoidal` | structure | Lax monoidal in (R, M). |
| `solidEvenFiltration.even` | simp | π_* even ⇒ fil = τ_{≥2⋆}. |
| `solidEvenFiltration.compare_pstragowski` | compatibility | Agrees with Pstrągowski's filtration on discrete homologically even modules. |
| `solidEvenFiltration.descent` | characterisation | Solid faithfully even flat nuclear descent up to completion. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `solidEvenFiltration.even_ring` | computation | fil^⋆_{ev}(ku^∧_p) = τ_{≥2⋆}ku^∧_p. |
| `solidEvenFiltration.zero` | degenerate | fil_ev(0) = 0. |
| `solidEvenFiltration.not_perfect_dual` | non-example | Perf_ev(R_■) is not closed under duals: Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even (Wagner 2.3). |

**Used by.**

- RT.4:q-Hodge/solid-thh-even-filtration: even filtration on solid THH
- RT.4:q-Hodge/global-even-filtration: the profinite pieces of the global filtration

**Acceptance.**

- For R = ku^∧_p (even, p-complete), fil^⋆_{ev/R}R = τ_{≥2⋆}R.

**Depends on.** `RT.4:q-Hodge/solid-spectra`, `RT.4:q-Hodge/nuclear-objects`, `RT.4:q-Hodge/perfect-even-filtration`

**Source.** wagner-ku-25, §2.1, paragraph 2.4 'The solid even filtration', p. 12: “We can form its truncations τ_{⩾2n} Hom_R(−, M) in the sheaf ∞-category Sh(Perf_ev(R_■), Sp_■) and then define the solid even filtration of M as the sections fil^⋆_{ev/R} M := Γ_{Perf_ev(R_■)}(R, τ_{⩾2⋆} Hom_R(−, M)).” — Wagner 2.4: the solid even filtration.

**Source.** wagner-ku-25, §2.3, Corollary 2.17, p. 21: “(b) The comparison map from Pstrągowski's perfect even filtration to the solid even filtration (see 2.7) is an equivalence fil^⋆_{P-ev} M° ≃ fil^⋆_ev M°. In particular, this applies in the case M° = R°.” — Wagner Corollary 2.17: agreement with Pstrągowski on discrete inputs.

**Source.** wagner-ku-25, §2.4, Theorem 2.19, p. 22: “Then for every nuclear solid homologically even left R-module M, the canonical map fil^⋆_{ev/R} M → lim_Δ fil^⋆_{ev/R}(S^• ⊗^■_R M) is an equivalence up to completing the filtrations on either side.” — Wagner Theorems 2.19–2.20: solid faithfully even flat descent.

### `RT.4:q-Hodge/even-circle-fixed-points` — Even-filtered circle fixed points and Tate

*Construction.* With S_ev := fil^⋆_ev S and T_ev := fil^⋆_ev S[S¹] (even filtrations of the sphere and the spherical group ring of the circle), for an even-filtered T_ev-module X the filtered homotopy fixed points X^{hT_ev} := Hom^⋆_{T_ev}(S_ev, X) and Tate X^{tT_ev} (Antieau–Riggenbach §2.3, due to Raksit); define fil^⋆_{ev,hS¹}TC⁻ := (fil^⋆_ev THH)^{hT_ev} and fil^⋆_{ev,tS¹}TP := (fil^⋆_ev THH)^{tT_ev}. It does not matter whether HRW, Pstrągowski or solid even filtrations are used for S_ev and T_ev (all exhaustive and agreeing after completion; exhaustiveness of HRW for connective E_∞-rings is an unpublished result of Burklund–Krause and is not used).

**Hypotheses.**

- Even filtrations as in RT.4:q-Hodge/perfect-even-filtration.

**Construction and proof.**

1. Construct T_ev as an E_∞-algebra in filtered spectra and S_ev as a T_ev-module (augmentation).
2. Define Hom over T_ev and the norm/Tate construction in filtered spectra.
3. Compare with ordinary (−)^{hT} on underlying objects.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `evenCircleFixedPoints` | data | X ↦ X^{hT_ev} on even-filtered T_ev-modules. |
| `evenCircleTate` | data | X ↦ X^{tT_ev}. |
| `evenCircleFixedPoints.underlying` | compatibility | Underlying object of X^{hT_ev} is (underlying X)^{hT} after completion. |
| `evenCircleFixedPoints.graded` | simp | Σ^{−2∗}gr^∗ of ku_ev^{hT_ev} is ℤ[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ[[q−1]]. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `evenCircleFixedPoints.ku` | computation | π_* of the underlying object for ku with trivial action is ℤ[β][[t]]. |
| `evenCircleFixedPoints.zero` | degenerate | 0^{hT_ev} = 0. |
| `evenCircleFixedPoints.not_naive` | non-example | (fil_ev X)^{hT} formed degreewise in Fun(ℤ^op, Sp) without T_ev is not the same: the circle action shifts filtration (σ in degree 1 of weight 1), so the naive construction gives the wrong graded pieces. |

**Used by.**

- RT.4:q-Hodge/q-hodge-comparison-map: ψ^0_R lands in gr^0_{ev,hS¹}TC⁻
- RT.4:q-Hodge/q-hodge-global: the theorem identifies Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻

**Acceptance.**

- For THH(ku/ku) = ku with trivial action: fil_{ev,hS¹}TC⁻ = τ_{≥2⋆}(ku^{hS¹}) with π_* = ℤ[β][[t]] (Wagner 1.16(e)).

**Depends on.** `RT.4:q-Hodge/perfect-even-filtration`, `RT.2/homotopy-orbits-fixed-points`, `RT.2/circle-tate`, `DerivedDeRhamCohomology:DD.1/filtered-modules`

**Source.** wagner-ku-25, §1.1, paragraph 1.7 'Even filtrations', p. 4: “Since S_R is only assumed to be E_2, we cannot use the even filtration from [HRW22] on TC^−(ku ⊗ S_R/ku). Instead we'll work with Pstrągowski's perfect even filtration [Pst23], which is already defined for E_1-ring spectra.” — Wagner 1.7: S_ev, T_ev and (−)^{hT_ev} := Hom_{T_ev}(S_ev, −).

**Source.** wagner-ku-25, §3.2, paragraph 3.8 'Even filtrations', p. 26: “Let S_ev := fil^⋆_ev S and T_ev := fil^⋆_ev S[S^1] denote the even filtrations of S and S[S^1], respectively. Following [AR24, Definition 2.11], we define the ∞-category of synthetic solid condensed spectra to be SynSp_■ := Mod_{S_ev}(Fil Sp_■).” — Wagner 3.8: fil_{ev,hS¹}TC⁻ and fil_{ev,tS¹}TP.

### `RT.4:q-Hodge/solid-thh-even-filtration` — Even filtrations on solid relative THH

*Theorem.* Let k be a connective even E_∞-ring with π_{2∗}k p-torsion free (k = ku, ℤ, ku ⊗ ℚ, …), A and R as in RT.4:q-Hodge/spherical-lift, k_A := k ⊗^■ S_A, k_R := k ⊗^■ S_R. Then (i) solid THH_■(k_R/k_A) is the p-completed relative THH (Wagner Lemma 3.7); (ii) fil^⋆_ev THH_■(k_R/k_A) (solid even filtration in case (E_2), lim_Δ τ_{≥2⋆} over the even resolution in case (E_1)) is given by a cosimplicial formula from a polynomial resolution (Proposition 3.11), is exhaustive and complete (Corollary 3.14), and carries a bifiltration with gr^s ≃ fil^{⋆−s}_{HKR}HH_■(R/A) ⊗ Σ^{2s+1}π_{2s}(k)-type graded pieces (Corollary 3.15); (iii) it satisfies base change along k → l (Corollaries 3.17–3.19); (iv) for k = ℤ it agrees with HRW's filtration (hence HKR/BMS2) on HH, HC⁻, HP (Corollary 3.21), and in case (E_2) it is the p-completion of Pstrągowski's perfect even filtration (Corollary 3.24).

**Hypotheses.**

- k connective even E_∞ with π_{2∗}k p-torsion free; A, R as in Wagner 3.1/3.2.

**Construction and proof.**

1. Lemma 3.7 via Burklund's E_2-structure on k/p^5.
2. Resolve R by P = ℤ[x_i] ↠ R with S_P = S[x_i] (E_2 even cells, Lemma B.1); the Čech resolution is termwise even (Proposition 3.11).
3. Deduce exhaustiveness/completeness and the bifiltration (Corollaries 3.14–3.15).
4. Base change (Corollaries 3.17–3.19) and comparisons (Corollaries 3.21, 3.24).

**Acceptance.**

- For k = ℤ: fil_{ev,hS¹}HC⁻_■(R/A) recovers the BMS2/Antieau filtration, gr^i = Σ^{2i}(Hodge-filtered derived de Rham)^∧_p.

**Depends on.** `RT.4:q-Hodge/solid-even-filtration`, `RT.4:q-Hodge/spherical-lift`, `RT.4:q-Hodge/even-circle-fixed-points`, `RT.2/relative-thh`, `RT.1/hkr-filtration`

**Source.** wagner-ku-25, §3.1, Lemma 3.7, p. 25: “Let k° be a discrete connective E∞-ring spectrum and let T° be a discrete connective E_1-algebra in k°-modules. Let k := (k°)^∧_p and T := (T°)^∧_p. Then solid condensed spectrum THH_■(T/k) is the p-completion of the discrete spectrum THH(T°/k°).” — Wagner Lemma 3.7: solid THH is p-completed THH.

**Source.** wagner-ku-25, §3.2, Proposition 3.11, p. 27: “Assume we are in situation 3.2(E_2). Then the cosimplicial resolution from 3.9 induces a canonical equivalence fil^⋆_ev THH_■(k_R/k_A) ≃ lim_Δ τ_{⩾2⋆} THH_■(k_R/k_A ⊗^■ S_{P̂_p^•}).” — Wagner Proposition 3.11 and Corollaries 3.14–3.15.

**Source.** wagner-ku-25, §3.3 'Base change', Corollary 3.17, p. 31: “Then the canonical base change morphism is an equivalence fil^⋆_ev THH_■(k_R/k_A) ⊗^■_{k_ev} l_ev ≃ fil^⋆_ev THH_■(l_R/l_A).” — Wagner Corollaries 3.17–3.19: base change.

**Source.** wagner-ku-25, §3.4, Corollary 3.21, p. 33: “the filtrations fil^⋆_ev HH_■(R/A), fil^⋆_{ev,hS^1} HC^−_■(R/A), and fil^⋆_{ev,tS^1} HP_■(R/A), agree with the Hahn–Raksit–Wilson/HKR even filtrations fil_{HRW-ev} HH(R/A)^∧_p, fil_{HRW-ev,hS^1} HC^−(R/A)^∧_p, and fil_{HRW-ev,tS^1} HP(R/A)^∧_p.” — Wagner Corollary 3.21: agreement with HRW for k = ℤ.

### `RT.4:q-Hodge/image-of-j` — The connective image-of-J spectrum j

*Definition.* At a prime p, j := τ_{≥0}(S_{K(1)}), the connective cover of the K(1)-local sphere, an E_∞-ring; at odd p it is the fibre of ψ^g − 1 : ku_p → Σ²ku_p-type construction (g a topological generator of ℤ_p^×) restricted to the Adams summand. Devalapurkar's thesis uses a variant j_{p,0} (thesis Notation 6.2.8) in the comparison of THH(ℤ_p[ζ_p]) with ku. These are the inputs of the Devalapurkar–Raksit computation THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}) (p odd).

**Hypotheses.**

- p a prime; K(1)-localisation at p (StableHomotopyKTheory H.6 p-completion and localisation).

**Construction and proof.**

1. Define S_{K(1)} as the K(1)-localisation of S (Bousfield localisation at p-adic K-theory, here via the fibre of ψ^g − 1 on KU_p for p odd) and take its connective cover.
2. Record the variant j_{p,0} following Devalapurkar's thesis.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `imageOfJ` | data | j = τ_{≥0}S_{K(1)} at p, an E_∞-ring. |
| `imageOfJ.toKu` | projection | j → ku_p (unit of the Adams summand), an E_∞-map. |
| `imageOfJ.pi0` | simp | π_0 j = ℤ_p. |
| `imageOfJ.variant` | data | Devalapurkar's j_{p,0}. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `imageOfJ.pi0_test` | computation | π_0 j = ℤ_p. |
| `imageOfJ.connective` | degenerate | π_n j = 0 for n < 0. |
| `imageOfJ.not_sphere` | non-example | j ≠ S^∧_p for p odd: the element β_1 ∈ π_{2p²−2p−2}S^∧_p of the cokernel of J maps to zero in π_*j. |

**Used by.**

- RT.4:q-Hodge/devalapurkar-raksit-thh: THH(ℤ_p) ≃ τ_{≥0}(j^{tC_p})
- RT.4:q-Hodge/devalapurkar-comparison: the input j_{p,0} of thesis Theorem 6.4.1

**Acceptance.**

- π_0 j = ℤ_p; π_{2(p−1)k−1} j ≅ ℤ/p^{v_p(k)+1} for p odd (image of J in the stable stems).

**Depends on.** `RT.4:topological/adams-operations-spectra`, `RT.4:topological/connective-ku`, `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, `StableHomotopyKTheory:H.6/p-completion`

**Source.** wagner-ku-25, §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40: “(b) The horizontal maps j → THH(Z_p)^∧_p and Z_p → THH(F_p) are S^1-nilpotent, that is, for any spectrum X with S^1-action the maps X ⊗ j → X ⊗ THH(Z_p)^∧_p and X ⊗ Z_p → X ⊗ THH(F_p) become equivalences upon (−)^{tS^1}.” — Wagner Theorem 4.12 (Devalapurkar–Raksit): j := τ_{≥0}(S_{K(1)}) and THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}).

**Source.** devalapurkar-thesis, §6.2, Notation 6.2.8, printed p. 225 (PDF p. 234): “We define an E∞-ring j_{p,0} := τ_{≥0}(KU_p^{hΓ_0}). Noting that the canonical map π_2(j_{p,0}/p) → π_2(KU_p/p) is an isomorphism, we abusively write β ∈ π_2(j_{p,0}/p) to denote the unique preimage under this map of the reduction of the Bott class β.” — Devalapurkar's thesis Notation 6.2.8: j_{p,0}.

### `RT.4:q-Hodge/devalapurkar-raksit-thh` — THH(ℤ_p) and the image of J (Devalapurkar–Raksit)

*Theorem.* For p odd: THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}) as S¹-equivariant (cyclotomic) E_∞-rings, compatible with j → THH(ℤ_p)^∧_p and ℤ_p → THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}); the analogous statement is false at p = 2 (Nygaard versus divided-power completion). In Wagner it is used to show TP_■(R/S_A) ≃ HP_■(R/A) without a spherical lift and to identify ψ^{hS¹}_R (p > 2).

**Hypotheses.**

- p odd.

**Construction and proof.**

1. Import Devalapurkar–Raksit's theorem (arXiv 2505.02218) as stated in Wagner Theorem 4.12; its proof (via K(1)-local and Tate-orbit arguments) follows their paper.
2. Record the failure at p = 2 (Wagner §4.2).

**Acceptance.**

- π_*THH(ℤ_p)^∧_p in low degrees: π_0 = ℤ_p, π_{2p−1} = ℤ/p (first nonzero positive group), matching τ_{≥0}(j^{tC_p}).

**Depends on.** `RT.4:q-Hodge/image-of-j`, `RT.2/thh-e1-ring`, `RT.2/cyclotomic-frobenius-thh`, `RT.2/norm-map-tate`

**Source.** devalapurkar-raksit-25, §0.1, Remark 0.1.5, p. 2: “In [23, Theorem 6.4.1], the first author uses Theorem 0.1.4 to provide a similar calculation of the relative topological Hochschild homology THH(Z_p[ζ_p]/S⟦q − 1⟧)^∧_p as sh(ku_p^{triv}), following an argument suggested by Lurie.” — Devalapurkar–Raksit: THH(ℤ_p) (and THH(ℤ_p[ζ_p])) via the image of J.

**Source.** wagner-ku-25, §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40: “(b) The horizontal maps j → THH(Z_p)^∧_p and Z_p → THH(F_p) are S^1-nilpotent, that is, for any spectrum X with S^1-action the maps X ⊗ j → X ⊗ THH(Z_p)^∧_p and X ⊗ Z_p → X ⊗ THH(F_p) become equivalences upon (−)^{tS^1}.” — Wagner Theorem 4.12 states the Devalapurkar–Raksit identification.

### `RT.4:q-Hodge/devalapurkar-comparison` — Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku ★

*Planet:* Devalapurkar's comparison.

*Theorem.* For p > 2 there is an equivalence THH(ℤ_p[ζ_p]/S_p[[q − 1]]) ≃ τ_{≥0}(ku_p^{tC_p}) of S¹ × ℤ_p^×-equivariant E_∞-S_p[[q − 1]]-algebras (ℤ_p[ζ_p] an S_p[[q−1]]-algebra via q ↦ ζ_p; S¹ acting on ku^{tC_p} through S¹ ≃ S¹/C_p; ℤ_p^× acting by Adams operations on ku_p), sending q ↦ q, compatibly with THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}) (Wagner Theorem 4.1 = Devalapurkar's thesis Theorem 6.4.1, whose normalisation uses S[[q^{1/p} − 1]] with q^{1/p} ↦ ζ_p and states the identification with ku_p^{(−1)} = τ_{≥0}(ku_p^{tℤ/p})). Its inputs are the Devalapurkar–Raksit identification of THH(ℤ_p[ζ_p]) (thesis Theorem 6.1.4) and the E_∞-ring j_{p,0}. At p = 2 only Nikolaus's S¹-equivariant E_1-equivalence is available (RT.4:q-Hodge/nikolaus-e1-equivalence); the E_∞ statement is not known there.

**Hypotheses.**

- p > 2.

**Construction and proof.**

1. Identify THH(ℤ_p[ζ_p]) via Devalapurkar–Raksit (thesis Theorem 6.1.4) and the base S_p[[q−1]].
2. Compare with ku_p^{tC_p}: π_0(ku_p^{tC_p}) = ℤ_p[ζ_p] (q ↦ ζ_p) and the Bott class maps to (ζ_p − 1)u (RT.4:topological/ku-circle-actions).
3. Promote to S¹ × ℤ_p^×-equivariant E_∞-equivalence (thesis §6.4); record the q ↦ q normalisation used by Wagner (Remark 4.3).

**Acceptance.**

- On π_0: ℤ_p[ζ_p] ≅ π_0(τ_{≥0}ku_p^{tC_p}).
- The equivalence is false as an E_∞ statement at p = 2 (not known), which is why Wagner's Theorem 1.2 assumes 2 ∈ R^×.

**Depends on.** `RT.4:q-Hodge/devalapurkar-raksit-thh`, `RT.4:q-Hodge/image-of-j`, `RT.4:topological/ku-circle-actions`, `RT.4:topological/adams-operations-spectra`, `RT.2/relative-thh`

**Source.** wagner-ku-25, §1.1, Theorem 1.6 (Devalapurkar [Dev25, Theorem 6.4.1]), p. 4; restated as Theorem 4.1, p. 36: “For primes p > 2, there exists an S^1 × Z_p^×-equivariant equivalence of E∞-ring spectra THH(Z_p[ζ_p]/S_p⟦q − 1⟧)^∧_p ≃ τ_{⩾0} ku^{tC_p}.” — Wagner Theorem 1.6 / 4.1 (Devalapurkar [Dev25, Theorem 6.4.1]), used only for p > 2.

**Source.** devalapurkar-thesis, Ch. 6, §6.4 'Application to q-de Rham cohomology', Theorem 6.4.1, printed p. 232 (PDF p. 241); also stated as Theorem 1.2.2, printed p. 15 (PDF p. 24): “Let p > 2, and view Z_p[ζ_p] as an S[[q^{1/p} − 1]]-algebra via the map q^{1/p} ↦ ζ_p. a. There is a Z_p^×-equivariant equivalence of cyclotomic E∞-S[[q − 1]]-algebras ku_p ⊗_{j_{p,0}} THH(Z_p[ζ_p]) ≃ THH(Z_p[ζ_p]/S[[q^{1/p} − 1]]).” — Devalapurkar's thesis Theorem 6.4.1.

**Source.** devalapurkar-thesis, Ch. 6, §6.1, Theorem 6.1.4 (Joint with A. Raksit), printed p. 220 (PDF p. 229): “Let p > 2, and write j_p to denote the cyclotomic E∞-ring j_p^{triv}. a. There is a canonical equivalence THH(Z_p) ≃ j_p^{(−1)}, as well as a commutative diagram of cyclotomic E∞-rings” — Devalapurkar's thesis Theorem 6.1.4: THH(ℤ_p[ζ_p]).

### `RT.4:q-Hodge/nikolaus-e1-equivalence` — Nikolaus's E_1 comparison at all primes

*Theorem.* For every prime p, including p = 2, there is an S¹-equivariant equivalence of E_1-rings THH(ℤ_p[ζ_p]/S_p[[q−1]]) ≃ τ_{≥0}(ku_p^{tC_p}) (not E_∞), proved from the fact that ℤ_p[ζ_p] is the free (q−1)-complete E_2-S_p[[q−1]]-algebra with [p]_q = 0 (Wagner Theorem 4.16, attributed to unpublished work of Nikolaus, with the argument explained by Devalapurkar).

**Hypotheses.**

- Any prime p; only E_1-structures.

**Construction and proof.**

1. Presentation of ℤ_p[ζ_p] as a free (q−1)-complete E_2-algebra with [p]_q = 0.
2. Compute THH of such a free quotient and compare with ku_p^{tC_p} using π_*(ku_p^{tC_p}) = π_*(ku_p^{tS¹})/[p]_q (Wagner proof of Theorem 4.16).

**Acceptance.**

- At p = 2 this replaces RT.4:q-Hodge/devalapurkar-comparison in case (E_1).

**Depends on.** `RT.4:topological/ku-circle-actions`, `RT.2/relative-thh`, `RT.4:q-Hodge/spherical-lift`

**Source.** wagner-ku-25, §4.2, Theorem 4.16 (Nikolaus, unpublished), p. 43: “For all primes p there exists an S^1-equivariant equivalence of E_1-ring spectra THH(Z_p[ζ_p]/S_p⟦q − 1⟧)^∧_p ≃ τ_{⩾0} ku^{tC_p}, compatible with THH(F_p) ≃ τ_{⩾0}(Z_p^{tC_p}). For p > 2, this equivalence agrees with the underlying S^1-equivariant E_1-equivalence of Theorem 4.1.” — Wagner Theorem 4.16 (Nikolaus): S¹-equivariant E_1 equivalence at all primes.

### `RT.4:q-Hodge/q-hodge-comparison-map` — The comparison map ψ^0_R and the q-Hodge filtration

*Construction.* For p, A, R as in RT.4:q-Hodge/spherical-lift (local case), the cyclotomic Frobenius of THH(S_R/S_A) and Devalapurkar's comparison (p > 2; Nikolaus's for p = 2 in case (E_1)) give an S¹-map ψ_R : THH(R^{(p)}[ζ_p]/S_A[[q−1]])[1/u] → THH(ku_R/ku_A)^{tC_p} and hence ψ^0_R : q-dR_{R/A} → gr^0_{ev,tS¹}TP_■ ≃ gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A), where q-dR_{R/A} is the (p-completed) derived q-de Rham complex (HabiroCohomologyFoundations HQ). The q-Hodge filtration is defined as the pullback fil^⋆_{q-Hdg}q-dR_{R/A} := q-dR_{R/A} ×_{gr^0} Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) along ψ^0_R, using Σ^{−2∗}gr^∗(ku_ev^{hT_ev}) ≅ ℤ_p[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ_p[[q−1]] (q − 1 = βt).

**Hypotheses.**

- Local case at a prime p; Devalapurkar's comparison for p > 2, Nikolaus's in case (E_1) for p = 2.

**Construction and proof.**

1. Construct ψ_R (Wagner 4.4) from the cyclotomic Frobenius and RT.4:q-Hodge/devalapurkar-comparison.
2. Pass to gr^0 of the even filtrations (Wagner 4.6–4.7) and define the pullback filtration (4.7).
3. Identify the coefficient ring with the (q−1)-adic filtration (Remark 4.3).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `qHodgeComparison` | data | ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A). |
| `qHodgeFiltration` | constructor | fil^⋆_{q-Hdg}q-dR_{R/A} as the pullback along ψ^0_R. |
| `qHodgeComparison.mod_beta` | compatibility | Modulo β it is the de Rham comparison for HC⁻ (Hodge filtration). |
| `qHodgeComparison.coefficients` | simp | Σ^{−2∗}gr^∗(ku^{hT}) ≅ ℤ_p[β][[t]] with q − 1 = βt. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `qHodgeFiltration.zero_degree` | degenerate | fil^0_{q-Hdg} = q-dR_{R/A}. |
| `qHodgeFiltration.polynomial` | computation | For R = ℤ_p[x], fil^i = ((q−1)^iℤ_p[x][[q−1]] → (q−1)^{i−1}ℤ_p[x][[q−1]]dx) (Raksit's example, RT.4:q-Hodge/raksit-polynomial-example). |
| `qHodgeFiltration.not_qadic` | non-example | fil^⋆_{q-Hdg} is not the (q−1)-adic filtration (q−1)^⋆q-dR: on ℤ_p[x] the degree-1 term contains dx in filtration i−1, not i. |

**Used by.**

- RT.4:q-Hodge/p-complete-comparison-odd: Theorem 4.8 identifies this filtration
- RT.4:q-Hodge/global-comparison-map: glued globally in 4.25

**Acceptance.**

- Modulo β, ψ^0_R becomes the comparison dR_{R/A} → gr^0 HC⁻ of Antieau/HRW.

**Depends on.** `RT.4:q-Hodge/devalapurkar-comparison`, `RT.4:q-Hodge/nikolaus-e1-equivalence`, `RT.4:q-Hodge/solid-thh-even-filtration`, `RT.4:q-Hodge/even-circle-fixed-points`, `RT.2/cyclotomic-frobenius-thh`, `HabiroCohomologyFoundations:HQ.3`

**Source.** wagner-ku-25, §4.1, paragraph 4.7 'The q-Hodge filtration', p. 38: “We can regard t as a filtration parameter, so that the graded Z_p[β]⟦t⟧-module Σ^{−2∗} gr^∗_{ev,hS^1} TC^−_■(ku_R/ku_A) defines a filtration on gr^0_{ev,hS^1} TC^−_■(ku_R/ku_A). We define the q-Hodge filtration as the pullback” — Wagner 4.7: the q-Hodge filtration as a pullback along ψ^0_R.

**Source.** wagner-ku-25, §4.1, Remark 4.3, p. 36: “In the following, we'll frequently use π_∗(ku^{hS^1}) ≅ Z[β]⟦t⟧, and we'll identify this graded Z[t]-algebra with the filtered ring (q − 1)^⋆Z⟦q − 1⟧, where (q − 1) in degree 1 corresponds to β.” — Wagner Remark 4.3: the coefficient ring and q ↦ q.

### `RT.4:q-Hodge/p-complete-comparison-odd` — The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)

*Theorem.* Let p > 2, A a p-complete p-completely perfectly covered δ-ring with a 3.1(tC_p)-lift S_A, and R a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A, satisfying 3.2(E_2) or 3.2(E_1). Then ψ^0_R identifies the completion of fil^⋆_{q-Hdg}q-dR_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) as graded ℤ_p[β][[t]]-modules; modulo β this is the Hodge filtration fil_{Hdg}dR_{R/A}, and after rationalisation the combined (Hodge, q−1)-filtration on dR_{R/A}[1/p][[q−1]]. With an E_n-lift the equivalences are E_{n−1}-monoidal (Remark 4.9).

**Hypotheses.**

- p > 2; A, R as stated; all (q-)de Rham complexes relative to A are p-completed.

**Construction and proof.**

1. Reduce to quasiregular semiperfectoid-type covers where everything is even (Lemma 4.10, quasi-syntomic descent Theorem 4.12 for p > 2).
2. Check the identification modulo β (Antieau/HRW: Hodge filtration via HC⁻) and the ℤ_p^×-equivariance (Lemma 4.13).
3. Conclude by completeness of both filtrations (RT.4:q-Hodge/solid-thh-even-filtration).

**Acceptance.**

- For A = R = ℤ_p: TC⁻(ku_p/ku_p) = ku_p^{hT} and q-dR = ℤ_p[[q−1]] with fil^i = (q−1)^i.

**Depends on.** `RT.4:q-Hodge/q-hodge-comparison-map`, `RT.4:q-Hodge/solid-thh-even-filtration`, `RT.4:q-Hodge/devalapurkar-raksit-thh`, `HabiroCohomologyFoundations:HQ.3`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`

**Source.** wagner-ku-25, §4.1 'The p-complete comparison (case p > 2)', Theorem 4.8, p. 39: “Let p > 2 be a prime and let A and R satisfy the assumptions from 3.1 and 3.2. Then the map ψ^0_R from 4.6 induces an equivalence of graded Z_p[β]⟦t⟧-modules fil^⋆_{q-Hdg} q-dR^_{R/A} ≃ Σ^{−2∗} gr^∗_{ev,hS^1} TC^−_■(ku_R/ku_A),” — Wagner Theorem 4.8: the p-complete comparison for p > 2.

**Source.** wagner-ku-25, §4.1, Remark 4.9, p. 39: “In case 3.2(E_2), all equivalences in Theorem 4.8 are canonically E_1-monoidal. In fact, if S_R can be equipped with an E_n-algebra structure in S_A-modules for any 2 ⩽ n ⩽ ∞, then all equivalences will be canonically E_{n−1}-monoidal.” — Wagner Remark 4.9: monoidality.

### `RT.4:q-Hodge/p-complete-comparison-two` — The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)

*Theorem.* For p = 2, A as in 3.1 and R a 2-complete, 2-torsion free A-algebra with bounded 2^∞-torsion, 2-quasi-lci over A, with a 2-quasi-syntomic cover R → R_∞ (R_∞/2 relatively semiperfect over A) and an E_1-lift S_R → S_{R_∞}^• of its Čech nerve (case 3.2(E_1)), the conclusions of Theorem 4.8 hold for the ad hoc filtration lim_Δ τ_{≥2⋆}TC⁻_■(ku_{R_∞^•}/ku_A). Case 3.2(E_2) at p = 2 remains open (it depends on an E_∞ form of Devalapurkar's theorem at p = 2 and on Theorem 4.12, false at p = 2). The resulting fil_{q-Hdg} is a priori a graded E_0-algebra, E_∞ a posteriori by RT.4:q-Hodge/quasi-regular-quotients.

**Hypotheses.**

- p = 2; case (E_1) only.

**Construction and proof.**

1. Replace Devalapurkar's comparison by Nikolaus's E_1 equivalence (RT.4:q-Hodge/nikolaus-e1-equivalence) to construct ψ^0_R.
2. Lemma 4.10 needs no quasi-syntomic descent here since R_∞^• is relatively semiperfect; the ℤ_p^×-equivariance argument is replaced by a check via A_crys^• after base change to perfect A (Wagner §4.2, a proof sketch).

**Acceptance.**

- This is the separate p = 2 target the roadmap keeps; it is not Theorem 4.8 with hypotheses removed.

**Depends on.** `RT.4:q-Hodge/nikolaus-e1-equivalence`, `RT.4:q-Hodge/q-hodge-comparison-map`, `RT.4:q-Hodge/solid-thh-even-filtration`

**Source.** wagner-ku-25, §4.2 'The p-complete comparison (case p = 2)', Theorem 4.14, p. 43: “If R satisfies the assumptions from 3.2(E_1), then the conclusions of Theorem 4.8 are true in the case p = 2 as well.” — Wagner Theorem 4.14: the case p = 2 under 3.2(E_1).

**Source.** wagner-ku-25, §4.2, opening paragraph, p. 43: “( ! ) The S^1-equivariant E∞-equivalence THH(Z_p[ζ_p]/S_p⟦q − 1⟧) ≃ τ_{⩾0}(ku^{tC_p}) from Theorem 4.1 is still conjectural for p = 2. ( !! ) Theorem 4.12 is provably false for p = 2.” — Wagner §4.2: the obstructions at p = 2.

### `RT.4:q-Hodge/quasi-regular-quotients` — q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)

*Theorem.* Fix a prime p (p = 2 allowed), A as in 3.1, and R satisfying 3.2(E_1) for the identity cover: R p-complete, p-torsion free, bounded p^∞-torsion, p-quasi-lci over A, R/p relatively semiperfect over A, with a p-complete connective E_1-S_A-algebra lift S_R. Then q-dR_{R/A} and dR_{R/A} are static and fil^⋆_{q-Hdg}q-dR_{R/A} = q-dR_{R/A} ×_{dR_{R/A}[1/p][[q−1]]} fil^⋆_{(Hdg,q−1)}dR_{R/A}[1/p][[q−1]] (pullback of filtered (q−1)^⋆A[[q−1]]-modules in the 1-category); hence it is independent of the lift S_R and canonically a filtered E_∞-algebra.

**Hypotheses.**

- As stated; p-torsion-freeness of R is required (the §4.3 preamble's reformulation omits it).

**Construction and proof.**

1. Staticness of q-dR and dR for such R.
2. Apply Theorems 4.8/4.14 and identify the pullback using the rational comparison and p-torsion-freeness of Σ^{−n}∧^nL_{R/A}.

**Acceptance.**

- Lift independence: two E_1-lifts of the same R give the same filtration.

**Depends on.** `RT.4:q-Hodge/p-complete-comparison-odd`, `RT.4:q-Hodge/p-complete-comparison-two`, `DerivedDeRhamCohomology:DD.2/p-completed-derham`

**Source.** wagner-ku-25, §4.3 'The case of quasi-regular quotients', Theorem 4.17, p. 45: “Under the assumptions above, the q-Hodge filtration fil^⋆_{q-Hdg} q-dR_{R/A} is the descending filtration by ideals given by the (1-categorical) preimage of the combined Hodge- and (q − 1)-adic filtration under the rationalisation map q-dR_{R/A} → dR_{R/A}[1/p]⟦q − 1⟧.” — Wagner Theorem 4.17: the q-Hodge filtration of a quasi-regular quotient as a 1-categorical pullback, independent of the lift.

### `RT.4:q-Hodge/global-even-filtration` — Global even filtrations by profinite and rational gluing

*Construction.* For A, R global (Wagner 4.18), fil^⋆_ev THH(ku_R/ku_A) is defined as the pullback of the profinite filtration fil^⋆_ev THH_■(ku_{R̂}/ku_{Â}) (product over primes, with (E_1)- and (E_2)-primes treated separately, 4.21) and the rational filtration fil^⋆_ev THH(ku_R ⊗ ℚ/ku_A ⊗ ℚ) ≃ fil^⋆_ev HH(R/A) ⊗ ℚ[β]_ev over fil^⋆_ev THH_■(ku_{R̂} ⊗^■ ℚ/ku_{Â} ⊗^■ ℚ) (4.23); then fil_{ev,hS¹}TC⁻ := (fil_ev THH)^{hT_ev}. The derived q-de Rham complex is glued likewise (4.25), and ψ^0_R is glued from the local comparisons, the rational Hodge-completion map and their compatibility (Lemma 4.29, a Ẑ^×-Adams-equivariance argument which uses (R_2)).

**Hypotheses.**

- Global hypotheses of RT.4:q-Hodge/spherical-lift.

**Construction and proof.**

1. Profinite completion and solid tensor products of bounded-below profinite complete spectra (4.20).
2. Profinite even filtrations (4.21, Lemma 4.22).
3. Glue (4.23) and glue q-dR and ψ^0_R (4.25, Lemma 4.29).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `globalEvenFiltration` | data | fil^⋆_ev THH(ku_R/ku_A) glued from profinite and rational pieces. |
| `globalEvenFiltration.profinite` | projection | Restriction to the profinite filtration. |
| `globalEvenFiltration.rational` | projection | Restriction to fil_ev HH(R/A) ⊗ ℚ[β]_ev. |
| `globalComparison` | data | The glued ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻(ku_R/ku_A). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `globalEvenFiltration.integers` | computation | For A = R = ℤ: fil_{ev,hS¹}TC⁻(ku/ku) = τ_{≥2⋆}ku^{hS¹}. |
| `globalEvenFiltration.rational_part` | degenerate | After −⊗ℚ the filtration is fil_{HKR}HH(R/A) ⊗ ℚ[β]_ev. |
| `globalEvenFiltration.not_intrinsic` | non-example | In case (E_1) at some prime, the glued filtration is not the even filtration of an E_1-ring (THH is then only E_0); it is defined by the resolution. |

**Used by.**

- RT.4:q-Hodge/q-hodge-global: the global theorem is stated for this filtration

**Acceptance.**

- If (E_2) holds at every prime, the glued filtration is intrinsic (a solid even filtration); otherwise it is the ad hoc gluing.

**Depends on.** `RT.4:q-Hodge/solid-thh-even-filtration`, `RT.4:q-Hodge/q-hodge-comparison-map`, `RT.4:q-Hodge/spherical-lift`, `StableHomotopyKTheory:H.6/arithmetic-fracture-square`

**Source.** wagner-ku-25, §4.4, paragraph 4.23 'Global even filtrations', p. 48: “Since ku_A and ku_R are discrete, THH_■ agrees with the usual THH. We can thus equip THH(ku_R ⊗ Q/ku_A ⊗ Q) with the solid even filtration, which agrees with Pstrągowski's perfect even filtration by Corollary 2.17,” — Wagner 4.23: global even filtrations by gluing.

**Source.** wagner-ku-25, §4.4, paragraph 4.21 'Profinite even filtrations' and Lemma 4.22, pp. 47-48: “For k = ku, we have canonical equivalences fil^⋆_ev THH_■(ku_{R̂}/ku_{Â}) ≃ ∏_p fil^⋆_ev THH_■(ku_{R̂_p}/ku_{Â_p}),” — Wagner 4.21 and Lemma 4.22: profinite even filtrations.

**Source.** wagner-ku-25, §4.4, paragraph 4.25 'The global comparison map', p. 49: “Let us denote q-dR_{R̂/Â} := ∏_p q-dR_{R̂_p/Â_p} and dR_{R̂/Â} := ∏_p dR_{R̂_p/Â_p} for short. Then the global q-de Rham complex sits inside a pullback” — Wagner 4.25: the global comparison map and Lemma 4.29.

### `RT.4:q-Hodge/q-hodge-global` — q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27) ★

*Planet:* q-Hodge filtration from THH over ku.

*Theorem.* Let A be a perfectly covered Λ-ring whose p-completions satisfy 3.1(tC_p) with lifts S_{Â_p}, and R a quasi-lci A-algebra with bounded p^∞-torsion for all p, each R̂_p satisfying 3.2(E_2) or 3.2(E_1), with the addendum (R_2) (true if 2 ∈ R^×); let S_A, S_R be the glued lifts and ku_A = ku ⊗ S_A, ku_R = ku ⊗ S_R. With the glued even filtration (RT.4:q-Hodge/global-even-filtration) and fil_{q-Hdg} defined as the pullback along ψ^0_R, ψ^0_R identifies the completed q-Hodge filtration fil^⋆_{q-Hdg}q-dR^∧_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A) as graded ℤ[β][[t]]-modules. Modulo β the uncompleted filtration becomes the Hodge filtration on dR_{R/A}; after rationalisation and (q−1)-completion it becomes the combined Hodge and (q−1)-adic filtration on (dR_{R/A} ⊗ ℚ)[[q−1]]; so (R, fil_{q-Hdg}q-dR_{R/A}) is an object of AniAlg^{q-Hdg}_A (HabiroCohomologyFoundations HQ.3). Theorem 1.2 is the case A = ℤ, R quasi-syntomic with 2 ∈ R^× and a connective E_2-lift S_R.

**Hypotheses.**

- As stated; only the completion of fil_{q-Hdg} is identified (fil_{q-Hdg} itself is a pullback and need not be complete).

**Construction and proof.**

1. Combine the local theorems (RT.4:q-Hodge/p-complete-comparison-odd, /p-complete-comparison-two) at each prime with the rational comparison TC⁻(ku_R⊗ℚ/ku_A⊗ℚ) ≃ HC⁻(R⊗ℚ[β]/A⊗ℚ[β]).
2. Glue (RT.4:q-Hodge/global-even-filtration) and check the identification on the pullback (Lemma 4.29).
3. Mod-β and rational statements from the local ones; HQ.3's definition of q-Hodge-filtered animated rings.

**Acceptance.**

- For R = ℤ[x] with S_R = S[x], the filtration is Raksit's coordinate q-Hodge filtration (RT.4:q-Hodge/raksit-polynomial-example).
- β ↦ 0 recovers Antieau/HRW: fil_{Hdg}dR^∧_{R/ℤ} ≃ Σ^{−2∗}gr^∗_{ev,hS¹}HC⁻(R/ℤ).

**Depends on.** `RT.4:q-Hodge/global-even-filtration`, `RT.4:q-Hodge/p-complete-comparison-odd`, `RT.4:q-Hodge/p-complete-comparison-two`, `RT.4:q-Hodge/quasi-regular-quotients`, `HabiroCohomologyFoundations:HQ.3`

**Source.** wagner-ku-25, §4.4 'The global case', Theorem 4.27, p. 50: “Suppose A and R satisfy the assumptions from 4.18 along with the addendum (R_2). Then the map ψ^0_R from 4.25 induces an equivalence of graded Z[β]⟦t⟧-modules fil^⋆_{q-Hdg} q-dR^_{R/A} ≃ Σ^{−2∗} gr^∗_{ev,hS^1} TC^−(ku_R/ku_A),” — Wagner Theorem 4.27: the global q-Hodge comparison.

**Source.** wagner-ku-25, §1.1, Theorem 1.2 (see Theorem 4.27), p. 3: “Let R be a quasi-syntomic ring such that 2 ∈ R^×. Assume that R admits a lift to a connective E_2-ring spectrum S_R such that S_R ⊗ Z ≃ R. Then the derived q-de Rham complex q-dR_{R/Z} can be equipped with a q-deformation of the Hodge filtration fil^⋆_{q-Hdg} q-dR_{R/Z},” — Wagner Theorem 1.2: the case A = ℤ with 2 ∈ R^× and an E_2-lift.

**Source.** wagner-ku-25, §4.4, Theorem 4.27 (second half), p. 50: “Moreover, modulo β and after rationalisation, we get equivalences fil^⋆_{q-Hdg} q-dR_{R/A} ⊗^L_{Z[β]⟦t⟧} Z⟦t⟧ ≃ fil^⋆_Hdg dR_{R/A}, fil^⋆_{q-Hdg}(q-dR_{R/A} ⊗^L_Z Q)^∧_{(q−1)} ≃ fil^⋆_{(Hdg,q−1)}(dR_{R/A} ⊗^L_Z Q)⟦q − 1⟧” — Wagner Theorem 4.27, second half: mod β and rational specialisations.

### `RT.4:q-Hodge/q-hodge-multiplicativity` — Completeness, multiplicativity and the graded comparison

*Theorem.* In the situation of RT.4:q-Hodge/q-hodge-global: (i) fil^⋆_ev THH(ku_R/ku_A) and fil^⋆_{ev,hS¹}TC⁻ are exhaustive and complete (Wagner Corollary 3.14 and its global form); (ii) if the lifts are E_n at every prime (n ≥ 2), the comparison equivalences are E_{n−1}-monoidal and (R, fil_{q-Hdg}) is an E_{n−1}-algebra in AniAlg^{q-Hdg}_A (Remark 4.28; with only an E_2-lift, E_1-monoidal); at primes with 3.2(E_1) the E_∞-structure comes a posteriori from Theorem 4.17; (iii) the graded comparison: Σ^{−2i}gr^i_{ev,hS¹}TC⁻ ≃ fil^i_{q-Hdg}q-dR^∧ for every i, compatibly with the derived q-de Rham complex and with HQ.3's q-Hodge complex q-Hdg_{R/A} := (colim(fil^0 →^{(q−1)} fil^1 → …))^∧_{(q−1)}, which is gr^0 of the S¹-even filtration on TC⁻(KU_R/KU_A) (the β-localisation).

**Hypotheses.**

- As in RT.4:q-Hodge/q-hodge-global.

**Construction and proof.**

1. Completeness: Corollary 3.14 locally and gluing.
2. Monoidality: Remarks 4.9 and 4.28 (E_n-lifts give E_{n−1}-monoidal comparisons).
3. q-Hodge complex: invert β (RT.4:topological/bott-localisation) and compare with HQ.3's colimit (Wagner §5 introduction; the identification there is stated without proof and is recorded as a step).

**Acceptance.**

- For S_R = S[x] (E_∞-lift), fil_{q-Hdg} is a filtered E_∞-algebra.

**Depends on.** `RT.4:q-Hodge/q-hodge-global`, `RT.4:q-Hodge/quasi-regular-quotients`, `RT.4:topological/bott-localisation`, `HabiroCohomologyFoundations:HQ.3`

**Source.** wagner-ku-25, §4.4, Remark 4.28, p. 50: “Fix 2 ⩽ n ⩽ ∞. If for every prime p either 3.2(E_1) was chosen or S_{R̂_p} admits an E_n-algebra structure in S_{Â_p}-modules, then all equivalences in Theorem 4.27 are canonically E_{n−1}-monoidal.” — Wagner Remark 4.28: monoidality of the global comparison.

**Source.** wagner-ku-25, §5 introduction (unnumbered), p. 53; cf. §1.2, p. 6: “As a straightforward corollary of Theorem 4.27, one checks that the q-Hodge complex associated to fil^⋆_{q-Hdg} q-dR_{R/A} agrees with q-Hdg_{R/A} ≃ gr^0_{ev,hS^1} TC^−(KU_R/KU_A), where we put KU_A := KU ⊗ S_A and KU_R := KU ⊗ S_R.” — Wagner §5 introduction: the q-Hodge complex as gr^0 of the KU filtration.

### `RT.4:q-Hodge/raksit-polynomial-example` — The coordinate q-de Rham complex from THH(ku[x]/ku)

*Application.* For S_R = S[x] (flat spherical polynomial ring) the S¹-even filtration on TC⁻(ku[x]/ku) computes the coordinate q-de Rham complex of ℤ[x] with q-Hodge filtration fil^0 = everything and fil^i = ((q−1)^iℤ[x][[q−1]] → (q−1)^{i−1}ℤ[x][[q−1]]dx) for i ≥ 1 (Raksit, Wagner Theorem 1.4; generalised to framed smooth algebras in Theorem 6.10).

**Hypotheses.**

- S_R = S[x]; framed smooth generalisation as in Wagner §6.

**Construction and proof.**

1. THH(ku[x]/ku) = ku ⊗ THH(S[x]) with THH(S[x]) ≃ S[x] ⊗ Σ^∞_+(cyclic bar construction of ℕ), computed via RT.2/thh-spherical-group-rings-type decompositions.
2. Compute the S¹-even filtration weightwise and compare with the q-derivative ∇_q(x^n) = [n]_q x^{n−1}dx.

**Acceptance.**

- In weight n the differential is multiplication by [n]_q, recovering ∇_q.

**Depends on.** `RT.4:q-Hodge/q-hodge-global`, `RT.2/thh-spherical-group-rings`

**Source.** wagner-ku-25, §1.1, Theorem 1.4 (Raksit, unpublished; see Theorem 6.10), p. 3: “fil^i_{q-Hdg,□} q-Ω^∗_{Z[x]/Z,□} := ((q − 1)^i Z[x]⟦q − 1⟧ →^{q-∇} (q − 1)^{i−1} Z[x]⟦q − 1⟧ dx) for all i ⩾ 1. Then fil^i_{q-Hdg,□} q-Ω^∗_{Z[x]/Z,□} ≃ Σ^{−2i} gr^i_{ev,hS^1} TC^−(ku[x]/ku).” — Wagner Theorem 1.4 (Raksit): the coordinate q-de Rham complex of ℤ[x] from THH(ku[x]/ku).

### `RT.4:q-Hodge/cyclonic-spectrum` — Cyclonic spectra ★

*Planet:* Cyclonic spectra.

*Definition.* Cyclonic spectra (Barwick–Glasman) are spectra with an S¹-action that is genuine for every finite cyclic subgroup C_m ⊆ S¹: the localising subcategory of genuine S¹-spectra generated by the cells S¹/C_m. The families {(−)^{C_m}} and {(−)^{ΦC_m}} are jointly conservative; the inclusion into genuine S¹-spectra has a colimit-preserving right adjoint inducing a symmetric monoidal structure. Bounded-below cyclonic spectra (all X^{C_m}, equivalently all X^{ΦC_m}, bounded below) are equivalent to naive cyclonic spectra (families (Y_m)_m with S¹/C_m-actions and Frobenius-type maps), and the genuine fixed points are X^{C_m} ≃ eq(∏_{d|m}(X^{ΦC_d})^{hC_{m/d}} ⇉ ∏_p ∏_{pd|m}((X^{ΦC_d})^{tC_p})^{hC_{m/pd}}) (can and φ). Unlike genuine cyclotomic spectra (RT.2/genuine-cyclotomic-spectrum), cyclonic spectra carry no identifications Φ^{C_p}X ≃ X and hence no restriction maps.

**Hypotheses.**

- Finite cyclic subgroups only (F-genuine S¹-spectra, RT.2/genuine-cyclic-and-circle-spectra).

**Construction and proof.**

1. Define as the localising subcategory generated by S¹/C_m-cells (Wagner 5.20).
2. Joint conservativity and the monoidal structure (5.21–5.22).
3. Bounded-below comparison with naive cyclonic spectra (Proposition 5.26, the cyclonic analogue of NS18 Theorem II.6.9) and the fixed-point formula (Lemma 5.28, generalising NS18 Corollary II.4.7).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CyclonicSpectrum` | data | The ∞-category of cyclonic spectra. |
| `CyclonicSpectrum.fixedPoints` | projection | X ↦ X^{C_m} with residual S¹/C_m-action. |
| `CyclonicSpectrum.geometricFixedPoints` | projection | X ↦ X^{ΦC_m}. |
| `CyclonicSpectrum.conservative` | characterisation | {(−)^{C_m}} (equivalently {(−)^{ΦC_m}}) are jointly conservative. |
| `CyclonicSpectrum.boundedBelow_naive` | equivalence | Bounded-below cyclonic spectra ≃ bounded-below naive cyclonic spectra. |
| `CyclonicSpectrum.fixedPoints_formula` | relation | X^{C_m} as the equalizer of can and φ over divisors of m. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CyclonicSpectrum.trivial` | degenerate | For m = 1, X^{C_1} is the underlying spectrum. |
| `CyclonicSpectrum.ku_fixed` | computation | π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1). |
| `CyclonicSpectrum.no_restriction` | non-example | A cyclonic spectrum need not have TR-type restriction maps R : X^{C_{pm}} → X^{C_m}, which would come from an identification Φ^{C_p}X ≃ X: for cyclonic ku, Φ^{C_p}ku ≄ ku (q ∈ π_0(ku^{ΦC_p}) satisfies Φ_p(q) = 0). The inclusion-of-fixed-points maps F (restriction of representations, q ↦ q) and the inflations do exist. |

**Used by.**

- RT.4:q-Hodge/tc-minus-m: TC^{−(m)} uses the genuine C_m-fixed points of a cyclonic spectrum
- RT.4:Habiro-comparison/habiro-comparison-theorem: lim_m TC^{−(m)}

**Acceptance.**

- THH(S_R) with its genuine cyclotomic structure restricts to a cyclonic spectrum.
- ku_{S¹} (genuine S¹-equivariant ku) restricts to cyclonic ku (RT.4:q-Hodge/cyclonic-ku).

**Depends on.** `RT.2/genuine-cyclic-and-circle-spectra`, `RT.2/geometric-fixed-points-localisation`, `RT.2/isotropy-separation`, `RT.2/restriction-pullback`, `RT.2/bounded-below-cyclotomic-equivalence`

**Source.** wagner-ku-25, §5.2, paragraph 5.20 'Cyclonic spectra', p. 60: “we'll follow [AMR17, Notation 2.3(3)] and construct ∞-category of cyclonic spectra as the full stable sub-∞-category CycnSp ⊆ Sp^{S^1} generated under colimits by Σ^{−n} S_{S^1}[S^1/C_m] for all finite cyclic subgroups C_m ⊆ S^1 and all n ⩾ 0.” — Wagner 5.20–5.22 and Proposition 5.26: cyclonic spectra (Barwick–Glasman), their monoidal structure and the bounded-below comparison.

**Source.** wagner-ku-25, §5.2, Lemma 5.28, p. 63: “Let X be a cyclonic spectrum and let m ∈ N. If the geometric fixed points X^{ΦC_d} are bounded below for all divisors d | m, then the following canonical (S^1/C_m)-equivariant map is an equivalence:” — Wagner Lemma 5.28: the formula for genuine C_m-fixed points.

### `RT.4:q-Hodge/cyclonic-ku` — Cyclonic ku and KU

*Construction.* Genuine S¹-equivariant connective K-theory ku_{S¹} restricts to a cyclonic E_∞-ring; KU_{S¹} := ku_{S¹}[β^{−1}] with the genuine Bott element (equivariant Snaith theorem). Its fixed points: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1), π_*(KU^{C_m}) ≅ ℤ[β^{±1}, q]/(q^m − 1), ku^{C_m} ≃ τ_{≥0}(KU^{C_m}) (π_0 = RU(C_m)); geometric fixed points π_*(ku^{ΦC_m}) = the non-negative part of ℤ[β, t]/[m]_{ku}(t) with [d]_{ku}(t), d | m proper, inverted; inflations along z ↦ z^n give ku^{C_m} ⊗_{S[q], ψ^n} S[q] ≃ ku^{C_{mn}} with q ↦ q^n, β ↦ β; residual homotopy fixed points π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}. Each ku^{ΦC_m} is bounded below, so the cyclonic fixed-point formula applies to ku and THH(ku_R/ku_A), but not to the KU versions, which are obtained by β-localisation.

**Hypotheses.**

- Genuine equivariant K-theory of the circle (equivariant Bott periodicity, Segal's RU(C_m)).

**Construction and proof.**

1. Construct ku_{S¹} (Wagner 5.32 and Appendix C, equivariant Snaith Lemma C.4).
2. Compute fixed and geometric fixed points (5.33, Proposition 5.42; RU(C_m) = ℤ[q]/(q^m − 1)).
3. Inflation maps (Corollary 5.35) and bounded-belowness (5.37).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `cyclonicKu` | data | ku_{S¹} as a cyclonic E_∞-ring. |
| `cyclonicKU` | data | KU_{S¹} = ku_{S¹}[β^{−1}]. |
| `cyclonicKu.fixedPoints` | simp | π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1). |
| `cyclonicKu.inflation` | functoriality | ku^{C_m} → ku^{C_{mn}}, q ↦ q^n, β ↦ β. |
| `cyclonicKu.geometric_boundedBelow` | other | Each ku^{ΦC_m} is bounded below. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `cyclonicKu.m_one` | degenerate | ku^{C_1} = ku. |
| `cyclonicKu.pi0_C2` | computation | π_0(ku^{C_2}) = ℤ[q]/(q² − 1) = RU(C_2). |
| `cyclonicKU.not_bounded_below` | non-example | KU^{ΦC_m} is not bounded below, so the bounded-below cyclonic machinery does not apply to KU directly; KU-filtrations are defined by β-localisation. |

**Used by.**

- RT.4:q-Hodge/tc-minus-m: TC^{−(m)}(ku_R/ku_A) uses cyclonic ku
- RT.4:Habiro-comparison/habiro-comparison-theorem: KU-versions by β-localisation

**Acceptance.**

- m = 1: ku^{C_1} = ku, π_* = ℤ[β].

**Depends on.** `RT.4:q-Hodge/cyclonic-spectrum`, `RT.4:topological/ku-spectrum`, `RT.4:topological/connective-ku`, `RT.4:topological/ku-circle-actions`, `RT.2/genuine-g-spectra`

**Source.** wagner-ku-25, §5.3, paragraph 5.32 'Cyclonic ku', p. 66: “Recall that Schwede [Sch18, Construction 6.3.9] constructs a model ku_gl of ku as an ultracommutative global ring spectrum. Throwing away most of the structure, this yields an E∞-algebra ku_{S^1} ∈ CAlg(Sp^{S^1}) with underlying non-equivariant E∞-algebra ku.” — Wagner 5.32: cyclonic ku and KU_{S¹} = ku_{S¹}[β^{−1}].

**Source.** wagner-ku-25, §5.3, paragraph 5.33 'Genuine fixed points of ku', p. 66: “π_∗(ku^{C_m})^{h(S^1/C_m)} ≅ Z[β, q]⟦t_m⟧/(βt_m − (q^m − 1)), where |t_m| = −2. The canonical map (ku^{C_m})^{h(S^1/C_m)} → ku^{hS^1} sends t_m ↦ [m]_q t. In particular, on π_0 this map recovers the (q − 1)-completion Z[q]^∧_{(q^m−1)} → Z⟦q − 1⟧,” — Wagner 5.33: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).

**Source.** wagner-ku-25, §5.3, Proposition 5.42, p. 69: “For all divisors d | m let [d]_ku(t) = β^{−1}(q^d − 1) denote the d-series of the formal group law of ku. Then π_∗(ku^{ΦC_m}) ≅ Z[β, t]/[m]_ku(t) [[d]_ku(t)^{−1} | d | m, d ≠ m]^{⩾0},” — Wagner Proposition 5.42: geometric fixed points of ku.

### `RT.4:q-Hodge/tc-minus-m` — The invariants TC^{−(m)}

*Definition.* For a cyclonic spectrum X and m ≥ 1, TC^{−(m)}(X) := (X^{C_m})^{h(S¹/C_m)}, genuine C_m-fixed points followed by homotopy fixed points of the residual circle S¹/C_m ≅ S¹. For A, R as in RT.4:q-Hodge/spherical-lift with the additional assumption (A_2) (compatible E_∞-lifts ψ^m of the Adams operations, Wagner 5.43), TC^{−(m)}(ku_R/ku_A) and TC^{−(m)}(KU_R/KU_A) are defined using the modified cyclonic structure THH(S_R/S_A)^{cyct} ⊗_{S_A^{cyct}} S_A^{triv} tensored with cyclonic ku (resp. KU) (Definition 5.45). The TC^{−(m)} for different m are related by maps for n | m (Remark 5.62) but there are no restriction maps as for TR.

**Hypotheses.**

- X cyclonic; for THH(ku_R/ku_A): the hypotheses of RT.4:q-Hodge/spherical-lift and (A_2).

**Construction and proof.**

1. Define via RT.4:q-Hodge/cyclonic-spectrum and RT.2/homotopy-orbits-fixed-points.
2. Construct the modified cyclonic structure (Wagner 5.43, Lemma 5.44).
3. Maps for n | m (Remark 5.62).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TCminusM` | data | TC^{−(m)}(X) = (X^{C_m})^{h(S¹/C_m)}. |
| `TCminusM.one` | simp | TC^{−(1)} = TC⁻. |
| `TCminusM.divisor` | functoriality | Maps TC^{−(m)} → TC^{−(n)}-type relations for n \| m (Remark 5.62). |
| `TCminusM.ku` | example | π_{2∗}TC^{−(m)}(ku/ku) ≅ (q^m − 1)^⋆ℤ[q]^∧_{(q^m−1)}. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TCminusM.m_one` | degenerate | TC^{−(1)}(X) = X^{hS¹}. |
| `TCminusM.ku_pi0` | computation | π_0TC^{−(m)}(ku/ku) = ℤ[q]^∧_{(q^m−1)}. |
| `TCminusM.not_TR` | non-example | There are no TR-type restriction maps TC^{−(pm)} → TC^{−(m)}: they would need (ku^{ΦC_p})^{hS¹} ≃ TC^{−(1)}(ku), which fails; the limit in RT.4:Habiro-comparison is along the maps of Wagner Remark 5.62. |

**Used by.**

- RT.4:Habiro-comparison/habiro-comparison-theorem: lim_m TC^{−(m)}(KU⊗S_R/KU)
- RT.4:Habiro-comparison/twisted-q-hodge-comparison: each TC^{−(m)}(ku_R/ku_A) computes a twisted q-Hodge filtration

**Acceptance.**

- TC^{−(1)}(X) = X^{hS¹} = TC⁻(X).
- For cyclonic ku: π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)} (Wagner 5.33, 5.50).

**Depends on.** `RT.4:q-Hodge/cyclonic-spectrum`, `RT.4:q-Hodge/cyclonic-ku`, `RT.4:q-Hodge/spherical-lift`, `RT.2/tc-minus-and-tp`, `RT.2/relative-thh`

**Source.** wagner-ku-25, §5.4, Definition 5.45, p. 71: “For all m ∈ N, the mth topological cyclonic homology of ku_R over ku_A is the spectrum TC^{−(m)}(ku_R/ku_A) := (THH(ku_R/ku_A)^{C_m})^{h(S^1/C_m)}.” — Wagner Definition 5.45: TC^{−(m)} via genuine C_m-fixed points and residual homotopy fixed points.

### `RT.4:q-Hodge/cyclonic-even-filtrations` — Cyclonic even filtrations and the KU construction

*Construction.* For a cyclonic E_1-algebra T and a cyclonic left T-module M: fil^⋆_ev M^{ΦC_m} := fil^⋆_{P-ev/T^{ΦC_m}}M^{ΦC_m} (Pstrągowski) and fil^⋆_{ev/T,C_m}M^{C_m} := eq(∏_{d|m}(fil^⋆_ev M^{ΦC_d})^{hC_{m/d},ev} ⇉ ∏_p∏_{pd|m}((fil^⋆_ev M^{ΦC_d})^{tC_p,ev})^{hC_{m/pd},ev}), requiring (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p} (5.46). For THH(ku_R/ku_A) the geometric fixed point filtration is defined by base change along inflation (5.47). For KU: fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m} := fil^⋆_{ev,C_m}THH(ku_R/ku_A)^{C_m} ⊗_{ku_ev^{C_m}} KU_ev^{C_m} (localisation at β in homotopical degree 2 and filtration degree 1), and fil^⋆_{ev,S¹}TC^{−(m)}(KU_R/KU_A) := (fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m})^{h(T/C_m)_ev}; these are complete and exhaustive (Lemma 5.61). This is the bounded-below (ku) construction followed by Bott localisation; a connective fixed-point formula is never applied to the unbounded KU-objects directly.

**Hypotheses.**

- Bounded-below cyclonic inputs for the ku-construction; (A_2) for THH(ku_R/ku_A).

**Construction and proof.**

1. Define the ku filtrations (5.46–5.47) using RT.4:q-Hodge/perfect-even-filtration and filtered (−)^{hC, ev}, (−)^{tC_p, ev}.
2. β-localise to get the KU filtrations (5.59).
3. Completeness/exhaustiveness (Lemma 5.61).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `cyclonicEvenFiltration` | data | fil^⋆_{ev,C_m}M^{C_m} for cyclonic modules. |
| `cyclonicEvenFiltration.KU` | constructor | The KU version by β-localisation. |
| `cyclonicEvenFiltration.complete` | other | Complete and exhaustive (Lemma 5.61). |
| `cyclonicEvenFiltration.m_one` | compatibility | For m = 1 it is fil_{ev,hS¹}TC⁻. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `cyclonicEvenFiltration.ku` | computation | fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}). |
| `cyclonicEvenFiltration.zero` | degenerate | The filtration of 0 is 0. |
| `cyclonicEvenFiltration.no_direct_KU` | non-example | Applying the bounded-below formula directly to THH(KU_R/KU_A) (not bounded below) is not justified; the β-localisation of the ku filtration is used instead. |

**Used by.**

- RT.4:Habiro-comparison/habiro-comparison-theorem: Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(KU_R/KU_A)

**Acceptance.**

- For m = 1 this is the filtration of RT.4:q-Hodge/even-circle-fixed-points.
- The KU filtrations are 2-periodic (β^{±1} shifts weight by ±1).

**Depends on.** `RT.4:q-Hodge/tc-minus-m`, `RT.4:q-Hodge/perfect-even-filtration`, `RT.4:q-Hodge/even-circle-fixed-points`, `RT.4:q-Hodge/cyclonic-ku`, `RT.4:topological/bott-localisation`

**Source.** wagner-ku-25, §5.4, paragraph 5.46 'Cyclonic even filtrations in general', p. 71: “Suppose that T and M are bounded below and that for all m ∈ N the geometric fixed points T^{ΦC_m} are complex orientable (but we don't require any genuine equivariant or cyclonic complex orientation).” — Wagner 5.46: cyclonic even filtrations in general.

**Source.** wagner-ku-25, §1.2, paragraph 1.13 'Genuine equivariant even filtrations', p. 7: “The same construction cannot be used for fil^⋆_{ev,C_m} THH(KU ⊗ S_R/KU)^{C_m}, as THH(KU ⊗ S_R/KU) is not bounded below, but instead we can simply use the filtered localisation of fil^⋆_{ev,C_m} THH(ku ⊗ S_R/ku)^{C_m} at the Bott element β.” — Wagner 5.59 and Lemma 5.61: the KU filtrations by β-localisation, complete and exhaustive.

**Source.** wagner-ku-25, §5.2, Proposition 5.26, p. 62: “When restricted to the respective full sub-∞-categories of bounded below objects, the functor (−)^{ΦC} becomes a symmetric monoidal equivalence (−)^{ΦC}: CycnSp_+ ≃ CycnSp^{naiv}_+.” — Wagner Proposition 5.26 / 5.37: bounded-belowness of ku but not KU.

## RT.4:Habiro-comparison. The Habiro comparison

For each m, TC^{−(m)} over ku computes the m-twisted q-Hodge filtration (Theorem 5.51); passing to
KU and to the limit over m recovers the Habiro–Hodge complex (Theorem 5.63). For R = O_F[1/Δ] with
6·disc(F) | Δ and its unique étale E_∞-lift, π_0 of lim_m TC^{−(m)}(KU ⊗ S_R/KU) is the Habiro ring
of the number field, through HabiroRings HR.6's degree-zero identification and HR.5's comparison
with the Garoufalidis–Scholze–Wheeler–Zagier ring (Corollary 6.15).

**Planets.** Habiro–Hodge complex from TC over KU, Habiro ring of a number field from KU.

**Within this roadmap it uses** RT.4:q-Hodge.

**From other roadmaps and the libraries it uses** `HabiroCohomologyFoundations:HQ.3`, `HabiroCohomologyFoundations:HQ.3/finite-projective-habiro-hodge-base-change`, `HabiroRings:HR.5-number-field-comparison`, `HabiroRings:HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`, `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`, `HabiroRings:HR.5/the-relative-habiro-ring`, `HabiroRings:HR.6/the-degree-zero-identification`, `StableHomotopyKTheory:H.5:spectra/operadic-algebras`.

**Acceptance tests of the layer.** Each node below lists its acceptance properties; the layer is accepted when every node's acceptance list and every unit test holds.

### `RT.4:Habiro-comparison/twisted-q-hodge-comparison` — TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)

*Theorem.* Under the hypotheses of RT.4:q-Hodge/q-hodge-global plus 2 ∈ R^× and (A_2), for each m ≥ 1 the completed m-twisted q-Hodge filtration (Wagner 5.50, constructed from fil_{q-Hdg} of Theorem 4.27) is identified with Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(ku_R/ku_A), as modules over π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ ℤ[β, q][[t_m]]/(βt_m − (q^m − 1)) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}; and Σ^{−2∗}gr^∗_{ev,C_m}THH(ku_R/ku_A)^{C_m} ≃ q-W_m dR^∗_{R/A} (derived q-de Rham–Witt complexes, Corollary 5.58).

**Hypotheses.**

- As in RT.4:q-Hodge/q-hodge-global, with 2 ∈ R^× and (A_2).

**Construction and proof.**

1. Compute fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}) (stated in Wagner as not completely trivial; only sketched there).
2. Use the fixed-point formula over divisors d | m and Theorem 4.27 applied to the Frobenius-twisted R^{(d)} (Wagner §5.4).
3. Identify the geometric fixed point pieces with q-de Rham–Witt (Corollary 5.58), compatible with HabiroCohomologyFoundations HQ.3's m-truncated q-de Rham–Witt objects.

**Acceptance.**

- m = 1 is RT.4:q-Hodge/q-hodge-global.

**Depends on.** `RT.4:q-Hodge/q-hodge-global`, `RT.4:q-Hodge/cyclonic-even-filtrations`, `RT.4:q-Hodge/tc-minus-m`, `HabiroCohomologyFoundations:HQ.3`

**Source.** wagner-ku-25, §5.4, Theorem 5.51, p. 73: “Let m ∈ N. Suppose A and R satisfy the assumptions from 4.18 along with the addenda 2 ∈ R^× and 5.43(A_2). Then there exists a canonical equivalence of filtered Z[β, q]⟦t_m⟧/(βt_m − (q^m − 1))-modules fil^⋆_{q-Hdg_m} q-dR^{(m)}_{R/A} ≃ Σ^{−2∗} gr^∗_{ev,S^1} TC^{−(m)}(ku_R/ku_A),” — Wagner Theorem 5.51 and Corollary 5.58.

### `RT.4:Habiro-comparison/habiro-comparison-theorem` — The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63) ★

*Planet:* Habiro–Hodge complex from TC over KU.

*Theorem.* Let A be a perfectly covered Λ-ring with p-adic (tC_p)-lifts, R a quasi-lci A-algebra with bounded p^∞-torsion and per-prime 3.2(E_2)/(E_1) choices, with 2 ∈ R^× and (A_2) (compatible E_∞-lifts ψ^m of the Adams operations on S_A); KU_A := KU ⊗ S_A, KU_R := KU ⊗ S_R with their cyclonic structures. Then the 2-periodified Habiro–Hodge complex q-ℋdg_{R/A}[β^{±1}] (Habiro descent of the q-Hodge complex of RT.4:q-Hodge/q-hodge-global, HabiroCohomologyFoundations HQ.3 / HabiroRings HR.2–HR.5, Wagner [Wag25, Theorem 3.11]) is equivalent to lim_m Σ^{−2∗}gr^∗_{ev,S¹}TC^{−(m)}(KU_R/KU_A), the limit over m along the divisibility maps; the even grading enters through Σ^{−2i} on gr^i and the Bott inversion through KU = ku[β^{−1}]. The connective (ku) even-filtration comparison (RT.4:Habiro-comparison/twisted-q-hodge-comparison) is performed before Bott inversion.

**Hypotheses.**

- As stated; 2 ∈ R^× is needed here (stronger than (R_2)), and (A_2).

**Construction and proof.**

1. Apply RT.4:Habiro-comparison/twisted-q-hodge-comparison for each m.
2. β-localise (RT.4:q-Hodge/cyclonic-even-filtrations, KU version) and pass to the limit over m.
3. Identify lim_m of the twisted (q^m − 1)-completed pieces with the Habiro–Hodge complex via Habiro descent (HabiroCohomologyFoundations HQ.3's construction; its Theorem 3.11 in [Wag25]).

**Acceptance.**

- For R = A = ℤ: π_0 lim_m TC^{−(m)}(KU/KU) is Habiro's ring H_ℤ = lim_m ℤ[q]^∧_{(q^m−1)} (HabiroRings HR.5-number-field-comparison/the-classical-ring).

**Depends on.** `RT.4:Habiro-comparison/twisted-q-hodge-comparison`, `RT.4:q-Hodge/cyclonic-even-filtrations`, `RT.4:q-Hodge/q-hodge-multiplicativity`, `HabiroCohomologyFoundations:HQ.3`, `HabiroCohomologyFoundations:HQ.3/finite-projective-habiro-hodge-base-change`, `HabiroRings:HR.5/the-relative-habiro-ring`

**Source.** wagner-ku-25, §5.4, Theorem 5.63, p. 79 (intro version: Theorem 1.14, p. 7): “Let m ∈ N. Suppose A and R satisfy the assumptions from 4.18 along with the addenda 2 ∈ R^× and 5.43(A_2). Then there exists a canonical Z[β^{±1}]-linear equivalence q-𝓗dg_{R/A}[β^{±1}] ≃ Σ^{−2∗} gr^∗(lim_{m∈N} fil^⋆_{ev,S^1} TC^{−(m)}(KU_R/KU_A)).” — Wagner Theorem 5.63: the Habiro–Hodge complex as lim_m of TC^{−(m)} over KU.

### `RT.4:Habiro-comparison/etale-einfty-lift` — Étale algebras lift uniquely to étale E_∞-algebras

*Theorem.* For a connective E_∞-ring A, the functor B ↦ π_0B from étale E_∞-A-algebras to étale π_0A-algebras is an equivalence of ∞-categories (Lurie, Higher Algebra Theorem 7.5.0.6). In particular every étale ℤ-algebra R has a unique (up to contractible choice) étale E_∞-S-algebra S_R with π_0S_R = R, S_R ⊗ ℤ ≃ R; for R = O_F[1/Δ] with disc(F) | Δ (étale over ℤ[1/Δ], HabiroRings HR.5-number-field-comparison) this is the spherical lift used in Corollary 6.15.

**Hypotheses.**

- A connective E_∞-ring; étale maps in Lurie's sense (flat with étale π_0-map).

**Construction and proof.**

1. Import HA Theorem 7.5.0.6 (deformation theory of étale maps: the cotangent complex of an étale map vanishes, so lifts are unique and exist by obstruction theory).
2. Apply to S → S[1/Δ] and the étale ℤ[1/Δ]-algebra O_F[1/Δ].

**Acceptance.**

- S_{ℤ[1/Δ]} = S[1/Δ].
- O_F[1/Δ] lifts uniquely; this lift is E_∞, hence satisfies (E_2) at every prime.

**Depends on.** `StableHomotopyKTheory:H.5:spectra/operadic-algebras`, `HabiroRings:HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`

**Source.** lurie-ha, §7.5 'Étale Morphisms' (introduction), Theorem 7.5.0.6, p. 1374: “Let 2 ≤ k ≤ ∞, let R be an E_{k+1}-ring, and let A be an E_k-algebra over R. Let (Alg^{(k)}_R)^{ét}_{A/} denote the full subcategory of (Alg^{(k)}_R)_{A/} spanned by the étale morphisms. Then the construction B ↦ π_0B induces an equivalence” — Lurie, Higher Algebra Theorem 7.5.0.6: étale E_∞-algebras correspond to étale π_0-algebras.

**Source.** wagner-ku-25, §6.1, Example 6.7, p. 82: “Suppose that S is a smooth A-algebra equipped with an étale map □: A[x_1, ..., x_n] → S. By [L-HA, Theorem 7.5.4.3], □ lifts uniquely to an étale map S_A[x_1, ..., x_n] → S_{S,□} of E∞-ring spectra. Then R = S satisfies the assumptions of 4.18(R),” — Wagner Example 6.7: étale-framed algebras have canonical E_∞-lifts.

### `RT.4:Habiro-comparison/number-field-habiro` — The Habiro ring of a number field from KU (Wagner Corollary 6.15) ★

*Planet:* Habiro ring of a number field from KU.

*Theorem.* Let F be a number field, Δ an integer divisible by 6 and by disc(F), R = O_F[1/Δ] (étale over ℤ[1/Δ], 2 ∈ R^×), and S_R the unique étale E_∞-S-algebra lifting R (RT.4:Habiro-comparison/etale-einfty-lift). Then the Habiro ring of the number field H_{O_F[1/Δ]} of Garoufalidis–Scholze–Wheeler–Zagier is isomorphic to π_0 lim_m TC^{−(m)}(KU ⊗ S_R/KU) = π_0 lim_m (THH(KU ⊗ S_R/KU)^{C_m})^{h(S¹/C_m)}. The comparison of π_0 is with the relative Habiro ring H_{R/ℤ} as constructed by HabiroRings HR.5 and its identification with the GSWZ ring (HR.5-number-field-comparison/the-number-field-ring), through HabiroRings HR.6's degree-zero identification of the Habiro–Hodge complex of an étale algebra with H_{R/ℤ} (Wagner [Wag25] Corollary 3.13, cited as 3.12 in Wagner's proof); no new definition of the ring is made here. The discriminant-only ring construction of HR.5 is not replaced: the stronger hypothesis 6 | Δ enters only through 2 ∈ R^× (Theorem 5.63) and the source's choice.

**Hypotheses.**

- F a number field; 6·disc(F) | Δ; S_R the étale lift.

**Construction and proof.**

1. The Habiro–Hodge complex of the étale ℤ-algebra R is static and equal to H_{R/ℤ} (HabiroRings HR.6/the-degree-zero-identification).
2. Apply RT.4:Habiro-comparison/habiro-comparison-theorem with A = ℤ (where (A_2) holds trivially): the limit filtration is the double-speed Whitehead filtration since the graded pieces are static, so π_0 of the limit is H_{R/ℤ}.
3. Identify H_{R/ℤ} with GSWZ's ring (HabiroRings HR.5-number-field-comparison/the-number-field-ring).

**Acceptance.**

- F = ℚ, Δ = 6: π_0 lim_m TC^{−(m)}(KU ⊗ S[1/6]/KU) ≅ H_{ℤ[1/6]}.
- Why 3 | Δ is required is not explained in the source; the hypothesis is kept as stated.

**Depends on.** `RT.4:Habiro-comparison/habiro-comparison-theorem`, `RT.4:Habiro-comparison/etale-einfty-lift`, `HabiroRings:HR.6/the-degree-zero-identification`, `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`, `HabiroRings:HR.5-number-field-comparison`

**Source.** wagner-ku-25, §6.3 'The Habiro ring of a number field, homotopically', Corollary 6.15, p. 86 (intro version: Corollary 1.15, p. 8): “Let F be a number field and let ∆ be divisible by 6 and by the discriminant of F. Let S_{O_F[1/∆]} denote the unique lift of O_F[1/∆] to an étale extension of S. Then H_{O_F[1/∆]} ≅ π_0(lim_{m∈N}(THH(KU ⊗ S_{O_F[1/∆]}/KU)^{C_m})^{h(S^1/C_m)}).” — Wagner Corollary 6.15: the Habiro ring of a number field as π_0 of lim_m TC^{−(m)}(KU ⊗ S_R/KU).

**Source.** wagner-ku-25, §6.3, proof of Corollary 6.15, p. 86: “By [Wag25, Corollary 3.12], q-𝓗dg_{O_F[1/∆]/Z} ≃ H_{O_F[1/∆]}. In particular, the Habiro–Hodge complex must be static. By Theorem 5.63, lim_{m∈N} fil^⋆_{ev,S^1} TC^{−(m)}(KU ⊗ S_{O_F[1/∆]}/KU) must be the double-speed Whitehead filtration τ_{⩾2⋆}” — Wagner's proof of Corollary 6.15 via the Habiro–Hodge complex of an étale algebra.

**Source.** wagner-habiro-25, §3.2 'The main result', Corollary 3.13, p. 27: “If R is étale over A, then q-𝓗dg_{R/A} is the relative Habiro ring H_{R/A} constructed in 2.7.” — Wagner, q-Hodge complexes over the Habiro ring, Corollary 3.13: the degree-zero identification for étale algebras.

## Requests to other roadmaps

- **StableHomotopyKTheory:H.5:spectra** — The presentably symmetric monoidal stable ∞-category Sp (the underlying ∞-category of symmetric spectra with the smash product, per the accepted RS-33 narrowing of H.5:spectra), with functor categories Sp^{BG} = Fun(BG, Sp), E_1- and E_∞-algebras in Sp with their module ∞-categories, Postnikov truncations and connective covers, and naive homotopy groups; THH, cyclotomic spectra and KU are built on these (RT-AREA-ktheory-2/32). (needed by `RT.2/spectra-with-action`, `RT.2/orthogonal-spectra`)
- **EnhancedDerivedSheaves:E5:spectra-comparison** — The comparison of concrete spectra (StableHomotopyKTheory H.5) with the abstract stable symmetric monoidal ∞-categories of E5:abstract: Sp as a presentably symmetric monoidal stable ∞-category, and Mod_{HR}(Sp) ≃ D(R) symmetric monoidally for a commutative ring R (used to identify THH(HA/HR) with HH(A/R)). (needed by `RT.2/spectra-with-action`, `RT.2/relative-thh`, `RT.2/orthogonal-spectra`)
- **tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality** — Hochschild chains of DG (in particular ungraded) algebras over a commutative base, their normalised version, invariance under quasi-equivalence (flat resolutions) and derived Morita equivalence; RT.1 imports these and adds the cyclic operator, Connes' B and the cyclic theories (RT-AREA-ktheory-2/44). (needed by `RT.1/cyclic-bar-construction`, `RT.1/hochschild-homology`, `RT.1/morita-invariance`)
- **tauceti:TauCetiRoadmap/DGAInfinity#layer-9-smoothness-properness-serre-and-calabi--yau-structures-and-completions** — Hochschild homology of DG categories and its Morita invariance (via a compact generator), compared with RT.1's Hochschild homology of algebras; the Chern character of layer 9 is to be compared with RT.3's degree-zero Dennis trace. (needed by `RT.1/morita-invariance`, `RT.3/dennis-trace`)
- **GeneralAlgebraicKTheory:K.2:plus** — Functorial connective K-theory K(A) of unital rings (and its agreement with K(Perf(A)) / Waldhausen K-theory), the source of the Dennis and cyclotomic traces (RT-AREA-ktheory-2/46). (needed by `RT.3/dennis-trace`)
- **GeneralAlgebraicKTheory:K.4** — Waldhausen K-theory via the S_•-construction for small stable ∞-categories (and Waldhausen categories), with additivity, natural in exact functors; the trace is defined levelwise on S_•C. (needed by `RT.3/dennis-trace`)
- **StableHomotopyKTheory:H.1** — Classifying spaces and the homotopy theory of spaces used for BU = colim G_n(ℂ^∞) and for maps into ℤ × BU. (needed by `RT.4:topological/bu-representability`)
- **HabiroCohomologyFoundations:HQ.3** — The derived q-de Rham complex q-dR_{R/A} (p-completed and global, glued as in Wagner's Construction A.14), the category AniAlg^{q-Hdg}_A of q-Hodge-filtered animated algebras (Wagner [Wag25] Definition 3.2), the q-Hodge complex q-Hdg := (colim(fil^0 → (q−1)fil^1 → …))^∧_{(q−1)} and the m-truncated derived q-de Rham–Witt objects, as the targets of RT.4:q-Hodge's comparisons. (needed by `RT.4:q-Hodge/q-hodge-comparison-map`, `RT.4:q-Hodge/p-complete-comparison-odd`, `RT.4:q-Hodge/q-hodge-global`, `RT.4:q-Hodge/q-hodge-multiplicativity`, `RT.4:Habiro-comparison/twisted-q-hodge-comparison`, `RT.4:Habiro-comparison/habiro-comparison-theorem`)
- **HabiroRings:HR.5-number-field-comparison** — H_{R/ℤ} for R = O_F[1/Δ] and its identification with the GSWZ Habiro ring of the number field (node the-number-field-ring), with Δ divisible by disc(F). (needed by `RT.4:Habiro-comparison/number-field-habiro`)
- **VStackSheavesAndLisseCategories:VS2** — Clausen–Scholze solid abelian groups and the solid tensor product (node VS2/solid-abelian-groups), which RT.4:q-Hodge extends to light condensed and solid spectra, nuclear objects and trace-class maps (RT-AREA-ktheory-2/30); the light (ℵ_1) variant used by Wagner is required. (needed by `RT.4:q-Hodge/solid-spectra`)

## Gaps

- **Barwick–Glasman comparison of orthogonal and genuine cyclotomic spectra.** NS18 Theorem II.3.7 cites Barwick–Glasman for N(CycSp^O)[F-equivalences^{−1}] ≃ CycSp^gen; the proof was not read. The modern comparison TC^gen = TC (RT.2/genuine-tc-agrees) for THH of connective rings uses it only through the classical Bökstedt model. (needed by `RT.2/orthogonal-cyclotomic-spectra`, `RT.2/thh-models-agree`)
- **Light condensed and solid spectra have no published reference.** Wagner §2.1 says there are no properly published sources for light condensed mathematics (Clausen–Scholze lectures and notes). VS2 plans the κ-condensed solid formalism of Fargues–Scholze VII; the light variant and its spectral extension rest on unpublished lectures. Next action: cite Clausen–Scholze's analytic stacks notes once available, or verify the needed statements from the lectures. (needed by `RT.4:q-Hodge/solid-spectra`, `RT.4:q-Hodge/nuclear-objects`)
- **Convergence step of the DGM theorem not decomposed from a fully read proof.** Raskin's proof (arXiv 1807.06709) was read at the level of its structure (reduction to split square-zero extensions, derivatives, convergence); the Dundas–Goodwillie–McCarthy book was not consulted (theorem numbering 7.0.0.2 vs 7.2.2.1 unverified). (needed by `RT.3/dgm-convergence`, `RT.3/dgm-theorem`)
- **Unproved or sketched steps in Wagner's ku paper.** Wagner arXiv 2510.06057v1: the gluing of per-prime lifts in 4.18 is asserted without proof; Lemma 4.29 and Theorem 4.14 have sketched proofs; the identification of the q-Hodge complex with gr^0 of the KU filtration (§5 introduction) has no proof; fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}(…) in Theorem 5.51 is sketched. These are recorded at the nodes; no step is claimed beyond the source. (needed by `RT.4:q-Hodge/spherical-lift`, `RT.4:q-Hodge/global-even-filtration`, `RT.4:q-Hodge/p-complete-comparison-two`, `RT.4:q-Hodge/q-hodge-multiplicativity`, `RT.4:Habiro-comparison/twisted-q-hodge-comparison`)
- **E_∞-structure of stable Adams operations on KU[1/k].** No source read in this job states that ψ^k : KU[1/k] → KU[1/k] is an E_∞-map; Hatcher gives ψ^k on K(X), Lurie's Elliptic Cohomology II gives KU = ku[β^{−1}] and Snaith's theorem. The H-map statement on ℤ × BU is classical (Adams); the E_∞ refinement needs a cited construction (e.g. via Snaith's theorem and the k-th power map of ℂP^∞). (needed by `RT.4:topological/adams-operations-spectra`)
- **Devalapurkar's thesis comparison is imported, not decomposed.** Thesis Theorem 6.4.1 (and Theorem 6.1.4, Notation 6.2.8) were located and their statements read; the proofs (thesis Chapter 6) were not decomposed into nodes. (needed by `RT.4:q-Hodge/devalapurkar-comparison`)

## Structure proposals

- **split** (RefinedTraceMethods). Several consumers ask RT.4:topological for topological K-theory beyond complex ku/KU: KTheoryFiniteLocalFields (λ-ring maps R_ℂ(G) → [BG, ℤ × BU], Atiyah–Segal completion and K̃U¹(BG) = 0, p-adic Adams operations Ψ^k with k ∈ ℤ_p^×, real/symplectic fixed-point comparisons), ArithmeticKTheory N.5 and MotivicEtaleKTheory M.5d (real K-theory KO, BO, real Bott periodicity, π_{8k+2}(BO; ℤ/2) = ℤ/4, the realification/complexification maps), BorelRegulators (universal Chern characters, primitive suspension to U_N, the (j−1)! Hurewicz normalisation). None is stated by RT.4:topological, and no layer of the atlas plans them. *Proposal:* Create 'Hochschild, cyclotomic and refined trace methods, Part II: real and equivariant topological K-theory' with first prerequisite RefinedTraceMethods:RT.4:topological, owning: KO and ko with real Bott periodicity and π_*KO; complexification/realification; the Atiyah map R(G) → K(BG) as λ-rings and the Atiyah–Segal completion theorem (free source: Atiyah–Segal, J. Differential Geom. 3 (1969), Theorem 2.1); p-adic Adams operations on (ℤ × BU)^∧_p; the universal Chern character and its Hurewicz normalisation. RT.4:topological keeps Adams operations ψ^k (integral), λ-operations, H*(BU) with Chern classes and the Chern character (RT-AREA-ktheory-2/43).
- **rescope** (RefinedTraceMethods, RefinedTraceMethodsPartIIHenselianPairs). RT.3's stage text exports 'the map-level square for … a henselian pair in the proven range', the Clausen–Mathew–Morrow rigidity theorem, which none of RT.3's named inputs prove; the Clausen–Mathew–Morrow extraction proposes a Part II on henselian pairs that imports RT.3 (RT-AREA-ktheory-2/35). *Proposal:* Remove the henselian-pair square from RT.3's exports; RT.3 exports the nilpotent-extension square (RT.3/dgm-theorem), the rational square (RT.3/goodwillie-rational) and the filtered-tower square (RT.3/tower-square). The henselian-pair square (CMM Theorem A/4.36, commutative henselian pairs, finite coefficients) is owned by the Part II on henselian pairs once created; consumers import it from there, so no RT.3 ↔ Part II cycle arises. AMMN's K-theoretic Beilinson square (Theorem A) also lives there; RT.3b keeps the TC square.
- **rescope** (MotivicEtaleKTheory, RefinedTraceMethods). MotivicEtaleKTheory's M.5d packet cites the aggregate stage RefinedTraceMethods:RT.4 (nodes M.7/suslin-real-comparison, M.7/real-mod-two-sequence) for real topological K-theory. RT.4 aggregates RT.4:Habiro-comparison, which consumes HabiroRings HR.6 (RT-AREA-ktheory-2/31), and HR.6 is downstream of M.7 among the packets (for instance M.7 → K3BlochGroups V.6 → PadicHodgeRegulators D.3 → HabiroNumberFields HB.7 → HR.6, and M.7 → HabiroNumberFields HB.1 → HB.2 → HB.7 → HR.6). Among packets this closes a cycle RT.4 → M.7 → … → HR.6 → RT.4:Habiro-comparison → RT.4; the promoted atlas has no RT.4 → M.7 edge. *Proposal:* Point those prerequisites at RefinedTraceMethods:RT.4:topological, or at the proposed Part II on real topological K-theory where KO and BO are planned; consumers of complex topological K-theory cite RT.4:topological rather than the aggregate RT.4.
- **split** (RefinedTraceMethods). RT.2 carries about fifty nodes and four distinct developments; one star does not read well. *Proposal:* Sub-layers of RT.2 for the atlas: RT.2:tate (spectra-with-action, homotopy-orbits-fixed-points, norm-map-tate, tate-of-eilenberg-maclane, tate-vanishing-induced, tate-multiplicativity, tate-p-local-properties, tate-orbit-lemma, tate-fixpoint-lemma, parametrised-tate, circle-tate, tate-cpn-via-cp); RT.2:thh (cyclic-realisation, edgewise-subdivision, tate-diagonal, thh-e1-ring, cyclotomic-frobenius-thh, thh-symmetric-monoidal, relative-thh, thh-over-thhz, mixed-complexes-are-circle-modules, norm-sequence-hc, thh-spherical-group-rings, thh-spectral-categories); RT.2:cyclotomic (lax-equalizer, cyclotomic-spectrum, tc-minus-and-tp, topological-cyclic-homology, tc-fibre-sequence, tc-p-completion, trivial-cyclotomic-adjunction, hz-module-circle-tate); RT.2:genuine (orthogonal-spectra, genuine-g-spectra, geometric-fixed-points, borel-completion, isotropy-separation, geometric-fixed-points-localisation, genuine-cyclic-and-circle-spectra, genuine-cyclotomic-spectrum, orthogonal-cyclotomic-spectra, tr-and-genuine-tc, restriction-pullback, genuine-tc-agrees, endofunctor-coalgebras, genuine-cyclotomic-coreflection, bounded-below-cyclotomic-equivalence, bokstedt-construction, thh-models-agree), in this order.

## Mistakes found in the sources

- **RefinedTraceMethods/E1** (misprint, nikolaus-scholze-18, Proposition B.19(i), Appendix B, printed p. 394 (Acta Math. 221; also arXiv v2)): printed “both targets of the equivalences in (i) are written C^{BZ}”; correction: C^{BT}: the realisation of a cyclic object (via Proposition B.5 and Lemma B.18) carries a T-action, so the targets are C^{BT}; in (ii) 'paracyclic' should be 'cyclic'. Proposition B.5 constructs the T-action on realisations of cyclic objects; BZ-actions arise for paracyclic objects, and the proof of B.19 passes through Lemma B.18 to T.
- **RefinedTraceMethods/E2** (misprint, nikolaus-scholze-18, Proof of Lemma IV.4.12, printed p. 362 (Acta Math. 221; also arXiv v2)): printed “HZ^{hZ}”; correction: HZ^{hT}, with the source and target of the displayed map exchanged. The lemma concerns T-equivariant HZ-modules; the homotopy fixed points in the argument are for the circle T.
- **RefinedTraceMethods/E3** (misprint, nikolaus-scholze-18, Proof of Proposition II.2.12, printed p. 253 (Acta Math. 221; also arXiv v2)): printed “exponent H/H′ and the term L(R^{d_V}) without its argument”; correction: H′/H, and L(R^{d_V}, V). The proposition composes Φ^{H′/H} with Φ^H for H ⊆ H′; the linear-isometry space needs its target representation V.
- **RefinedTraceMethods/E4** (misprint, ammn-20, Definition 2.14, p. 11 (arXiv 2003.12541v2)): printed “tr_crys = tr ∘ β : K(R/p; Q_p) → HP(R; Q_p)”; correction: tr_crys = β ∘ tr. tr : K → TC is applied first and β : TC(R/p; Q_p) → HP(R; Q_p) second; the text itself says β is 'precomposed with the trace'.
- **RefinedTraceMethods/E5** (error, ammn-20, Theorem F, p. 6, against Theorem 6.22, p. 46 (arXiv 2003.12541v2)): printed “Theorem F is stated for 'a quasisyntomic ring'”; correction: Theorem F should assume R ∈ qSyn_{Z_p} p-torsion-free (as Theorem 6.22, which proves it, does). Theorem 6.22 is stated and proved only for p-torsion-free quasisyntomic rings; the Frobenius on LΩ_R is constructed via (48) for p-torsion-free R.
- **RefinedTraceMethods/E6** (misprint, ammn-20, Theorem E and the preceding paragraph, p. 5 (arXiv 2003.12541v2)): printed “Given a class x ∈ K_j(X_1; Q) ... The class x lifts to K^cts_i(X; Q)”; correction: K^cts_j(X; Q). The degree of the class does not change under lifting; Theorem 4.14, which proves it, uses one index consistently.
- **RefinedTraceMethods/E7** (misprint, bms2-19, Remark 4.14, p. 21 (arXiv 1802.03261v2)): printed “gr^i_HKR HH(B/A; Z_p) ≃ (∧^i L_{−/A}[i])^∧_p”; correction: (∧^i L_{B/A}[i])^∧_p. The graded pieces of the HKR filtration of HH(B/A) are exterior powers of L_{B/A}.
- **RefinedTraceMethods/E8** (misprint, lmmt-24, Remark 3.11, p. 16 (arXiv 2001.10425v5)): printed “this colimit is ΩM”; correction: ΣM (the stable K-theory of S with coefficients in M is ΣTHH(S; M) ≃ ΣM). The Goodwillie derivative of M ↦ K(A ⊕ M) is ΣTHH(A, M) (Raskin Theorem 2.12.1(2)); in degree one K_1(A ⊕ M, M) contains 1 + M, matching THH_0. The shift does not affect the T(n)-acyclicity argument.
- **RefinedTraceMethods/E9** (misprint, cmm-21, Theorem 4.33, p. 35 (arXiv 1803.10897v2)): printed “the rational case is credited to [19] (Cortiñas, 'Infinitesimal K-theory', J. reine angew. Math. 1998)”; correction: Cortiñas, 'The obstruction to excision in K-theory and in cyclic homology', Invent. Math. 164 (2006). The KABI theorem (rational excision obstruction equals that of HC) is the 2006 paper; [19] proves a different result.
- **RefinedTraceMethods/E10** (misprint, bgt-14, Introduction, p. 2 (arXiv 1103.3923v3)): printed “the multiplicative cyclotomic trace is the unique lifting to TC (see Theorem 1.15)”; correction: see Theorem 1.12 (Corollary 1.15 concerns K(Perf(C))). Theorem 1.12 is the uniqueness statement for E_∞-maps K → TC^n.
- **RefinedTraceMethods/E11** (misprint, bgt-13, Lemma 10.5, p. 74 (arXiv 1001.2282v4)): printed “the Dennis trace induces a natural transformation of localizing invariants K → THH”; correction: of additive invariants (K here is connective K-theory, additive but not localizing, as BGT state on p. 4). BGT p. 4: connective K-theory is additive but not localizing.
- **RefinedTraceMethods/E12** (misprint, wagner-ku-25, Proof of Corollary 6.15, p. 86 (arXiv 2510.06057v1)): printed “[Wag25, Corollary 3.12]”; correction: [Wag25, Corollary 3.13] (arXiv 2510.04782, both v1 and v2; 3.12 is an Example). Checked in both versions of the cited paper.
- **RefinedTraceMethods/E13** (misprint, wagner-ku-25, Theorem 4.8, p. 39 (arXiv 2510.06057v1); same slip in Lemmas 4.10, 4.13 and 4.25(a)): printed “ψ^0_R from 4.6”; correction: ψ^0_R from 4.7 (4.6 is 'The comparison map II'). ψ^0_R is introduced in paragraph 4.7.
- **RefinedTraceMethods/E14** (gap, wagner-ku-25, Theorem 2.20, p. 22 (arXiv 2510.06057v1)): printed “for every solid homologically flat R_0-module M_0”; correction: 'solid even flat' (the notion of 2.6), which is what the proof uses. 'homologically flat' is not defined in the paper; the proof uses solid even flatness.
- **RefinedTraceMethods/E15** (misprint, hatcher-vbkt, Proof of Proposition 4.2, p. 110 (Version 2.2, November 2017)): printed “the splitting principle for ordinary cohomology in Proposition 2.3”; correction: Proposition 3.3 (p. 80). There is no Proposition 2.3 in version 2.2 (2.3 is Corollary 2.3 on K(S²)); the cohomological splitting principle is Proposition 3.3.
