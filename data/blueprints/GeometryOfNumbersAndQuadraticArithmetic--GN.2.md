# Geometry of numbers, quadratic forms and homogeneous arithmetic — Layer GN.2, continued: local-global arithmetic of lattices, orders and hermitian forms

This document continues Layer GN.2 (quadratic and hermitian local-global theory) of the roadmap *Geometry of numbers, quadratic forms and homogeneous arithmetic*. The first part of the layer, in the roadmap’s main document (§§2.1–2.9), sets up integral quadratic lattices over a Dedekind domain with localization and completion descent, the integral genus and the proper spinor genus over a number field, invariant factors over a DVR, Voight’s atomic forms, integral hermitian lattices with their dual and invariants, quaternionic hermitian lattices over a quaternion order, and signed hermitian forms over a local field of odd residue characteristic. Everything here builds on those targets and cites them by their identifiers; nothing there is restated.

What this part adds (§§2.10–2.19):

- **Lattices over a Dedekind domain: pseudobases, completion and the local-global dictionary** (§2.10).
- **Quaternion orders and reduced norms** (§2.11).
- **Quadratic forms over finite fields** (§2.12).
- **Binary forms: genus characters and compatibility with imported local normal forms** (§2.13).
- **Local integral classification and spinor norms** (§2.14).
- **Hermitian forms and lattices over quadratic extensions** (§2.15).
- **Stable lattices of a semisimple endomorphism** (§2.16).
- **Signed hermitian forms: unitary groups and transfer** (§2.17).
- **Lattices with Frobenius and Zarhin’s trick** (§2.18).
- **Trace-unimodular lattices, Witt groups of Dedekind rings and ternary forms** (§2.19).

## Scope and boundaries

This part owns the targets listed below. It does not own: the field theory of quadratic forms (QuadraticFormInvariants: Witt cancellation, quaternion algebras, discriminants and Hasse invariants, local classification, the Scharlau transfer), isotropy, representation and isometry over number fields (GlobalQuadraticForms), integral lattices over ℤ and ℤ_p with their duals, discriminant forms, Jordan splittings, genus symbols, spinor genera over ℚ, binary forms and Nikulin’s embedding theory (Tau Ceti’s integral lattices and TauCetiRoadmap IntegralLattices, milestones 0F, 3A–3I, 4A–4C, 5A–5J and B1–B8), the spinor norm over a field and its tables over ℚ_p (OrthogonalSpinGroups), finite adelic points (AdelicAlgebraicGroups AA.1), and the genus theory of quadratic fields (Tau Ceti’s `Multiquadratic` library). Representation densities, masses and orbit counts are Layer 3, lattice-point estimates Layer 4, and Grothendieck–Witt and L-theoretic statements Layer 6. The general notion of an order in a finite-dimensional algebra is planned here (§2.11) and imported by ClassicalArithmeticCompletion.

## Conventions

**Lattices.** Over a Dedekind domain `R` with fraction field `F`, a lattice in a finite-dimensional `F`-space `V` is a finitely generated `R`-submodule spanning `V` (Mathlib’s `Submodule.IsLattice F`); no basis is stored, and lattices may be nonfree. Localization `L_(𝔭)` stays inside `V`; completion `L_v` is the `R_v = adicCompletionIntegers F v`-span in `V_v = F_v ⊗_F V`, with `F_v = adicCompletion F v`. The span over `F_v` would erase the lattice.

**Quadratic and bilinear forms.** A quadratic lattice carries `q : V → F` with polar form `b(x,y) = q(x+y) − q(x) − q(y)`, never divided by two; the dual is `L^♯ = {y : b(y,L) ⊆ R}`. Where a source uses a bilinear form with `Q(x) = (x,x)/2` (Li, Charles, Tau Ceti’s integral lattices), the node says so. Discriminant ideals are Gram determinants of the polar form.

**Hermitian forms.** Sesquilinear forms are conjugate-linear in the first variable and linear in the second (Mathlib, Kurinczuk–Skodlerack–Stevens); `h(w,v) = ε·h(v,w)‾`. Lipnowski–Tsimerman and Zhang use forms linear in the first variable; `h′(v,w) = h(w,v)` translates, and the trace form is the same.

**Local fields.** `q` is the residue cardinality of the base field. “Unimodular” means `L^∨ = L` for the form in question. The field spinor norm sends a reflection to `[q(v)]`. Its restriction to SO is Tau Ceti’s `CliffordAlgebra.spinorNorm`.

**Binary forms.** `Q = [a,b,c]` means `ax² + bxy + cy²` with discriminant `b² − 4ac`; χ_d uses the Kronecker character of a fundamental discriminant `d`, factored into distinct prime discriminants with at most one even factor (Tau Ceti `Multiquadratic.genusCharFun`). A general binary discriminant need not be fundamental; the residual discriminant and the dyadic support conditions below are essential.

The accepted base packet supplies the general integral-lattice and signed-hermitian carriers. This follow-up extends their API. Current TauCetiRoadmap main also supplies binary forms, local binary normal forms, primitive-embedding criteria and the ℚ_p spinor-image cases. Their precise contracts are recorded below, including three sections absent from the atlas snapshot. The existing Tau Ceti genus-field construction and degree formula are direct pinned inputs.

This is a complete target-level planning pass: 58 nodes, 124 API items and 72 definition tests. GN.2 is **planned**, with four precise proof gaps; it is not closed. Every implementation status remains unchecked. The reader carries the complete target, API and test specifications. The suggested Lean file contains only statements and light definitions over existing carriers; its `sorry` proofs do not claim formalisation.

## Sources

- **John Voight**, *Quaternion algebras* (`Voight2026`). Author post-publication v1.0.7u, 5 August 2026, 883 physical pages; printed = physical − 20 throughout the Chapter 9–15 passages used here. [Source](https://jvoight.github.io/quat-book.pdf). Read locators: §9.3 Theorems 9.3.6, 9.3.9 and 9.3.10, printed pp.138–139; §9.4 Lemma 9.4.6 to Theorem 9.4.9 with proof, pp.140–142; §9.5 Lemma 9.5.3 with proof, pp.142–143; §9.6 Definition 9.6.1 to Lemma 9.6.9, pp.143–144; §10.2–10.4 (orders, integrality, maximal orders), pp.152–156; §13.3 Proposition 13.3.4 and Theorem 13.3.11, pp.199–200; Lemma 13.4.9, p.204; §14.7 to the proof of Main Theorem 14.7.4, pp.225–227; §15.2 Definition 15.2.2 to Lemma 15.2.15, pp.234–237; §15.3 Lemma 15.3.8, p.238; §15.4 to Lemma 15.4.7, pp.238–239; §15.5 Lemma 15.5.1 to Example 15.5.7, pp.240–241.
- **Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang**, *CM values of higher automorphic Green functions for orthogonal groups* (`BEY2021`). Published Invent. Math. 225 (2021), 693–785, 93 physical pages; printed = physical + 692. Independently collated with arXiv:1912.12084v2 at §7.1 and Corollary 7.18. [Source](https://link.springer.com/content/pdf/10.1007/s00222-021-01038-0.pdf). Read locators: §7.1, Definition 7.1 and Lemmas 7.2–7.3 including proof, printed pp.752–754 (physical pp.60–62); Corollary 7.18 and proof, printed pp.767–768 (physical pp.75–76); The previously cited v2 passages at pp.44–45 and 56–57 were also read; the unramified-prime clause changes in the published definition.
- **Ilya Khayutin**, *Joint equidistribution of CM points* (`Khayutin2019`). arXiv:1710.04557v3, 118 pages; Appendix B.2 uses the labels Lemma B.1 and Remark B.2. [Source](https://arxiv.org/pdf/1710.04557v3). Read locators: Appendix B.2, Lemma B.1 and Remark B.2, p.109 (physical p.109), read in full.
- **Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens**, *Endo-parameters for p-adic classical groups* (`KSS2021`). arXiv:1611.02667v3, 81 pages (printed = physical). [Source](https://arxiv.org/pdf/1611.02667v3). Read locators: §3.1 Lemma 3.1 with proof, p.10; §§3.2–3.5, Remarks 3.7–3.11, Proposition 3.12, Propositions 3.13–3.15 with proofs, Remark 3.16, pp.12–16.
- **Daniel Skodlerack, Shaun Stevens**, *Intertwining semisimple characters for p-adic classical groups* (`SkodlerackStevens2020`). arXiv:1503.08882v3, 41 pages; published Nagoya Math. J. 238 (2020) 137–205 not collated. [Source](https://arxiv.org/pdf/1503.08882v3). Read locators: §4 (Witt groups): Theorem 4.1, Definitions 4.2 and 4.5, Example 4.3, Theorem 4.4, Proposition 4.6, Lemma 4.7, the proof of Theorem 4.4, pp.8–11.
- **Michael Lipnowski, Jacob Tsimerman**, *How large is A_g(F_q)?* (`LipnowskiTsimerman2018`). arXiv:1511.02212v1, 38 pages. [Source](https://arxiv.org/pdf/1511.02212v1). Read locators: §3.1–3.2.1, pp.7–13 (including Lemma 3.1); §5.1–5.3, Definition 5.1 to Remark 5.7, pp.24–27.
- **Wei Zhang**, *Weil representation and arithmetic fundamental lemma* (`Zhang2021`). arXiv:1909.02697, 79 pages; published Annals of Math. 193 (2021). Locators below refer to the arXiv text; no published-page collation is claimed. [Source](https://arxiv.org/pdf/1909.02697). Read locators: §1.2, displays (1.2)–(1.4), arXiv physical pp.4–5; the definitions themselves are on p.5. No collation with Annals pagination is claimed.
- **Spencer Leslie**, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods* (`Leslie2019`). arXiv:1911.07907v3, 12 March 2025, maintainer-cleared author copy; the source id retains the initial submission year. [Source](https://arxiv.org/pdf/1911.07907v3). Read locators: §3.2, displays (3.5)–(3.7), physical/printed pp.25–26, read in the cleared original.
- **Chao Li, Wei Zhang**, *Kudla–Rapoport cycles and derivatives of local densities* (`LiZhangDensity`). arXiv:1908.01701v3, 92 pages. [Source](https://arxiv.org/pdf/1908.01701v3). Read locators: §1.7, physical pp.8–9.
- **Richard Elman, Nikita Karpenko, Alexander Merkurjev**, *The algebraic and geometric theory of quadratic forms* (`EKM2008`). AMS Colloquium Publications 56 (2008), authors’ free copy, 443 physical pages; printed = physical − 8 in Chapter II. [Source](https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf). Read locators: §§12–13, Propositions 12.1 and 13.2 and Examples 13.5, printed pp.60–62 (physical pp.68–70); §36 opening, finite-field u-invariant via Chevalley–Warning, printed p.161 (physical p.169).
- **Jonas Bergström, Carel Faber, Sam Payne**, *Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves* (`BFP2024`). arXiv:2206.07759v2, 31 pages. [Source](https://arxiv.org/pdf/2206.07759v2). Read locators: §6, quadric surfaces and display (6), pp.9–10.
- **Gaëtan Chenevier, Olivier Taïbi**, *Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms* (`ChenevierTaibi2020`). arXiv:1907.08783, 62 pages (printed = physical); Publ. Math. IHÉS 131 (2020) not collated. [Source](https://arxiv.org/pdf/1907.08783). Read locators: Section 3.2: regular forms over rings, GSpin and Spin, (3.2.1), Theorem 3.5 with proof, Corollary 3.6, Proposition 3.7 with proof, pp.28–30.
- **François Charles**, *Birational boundedness for holomorphic symplectic varieties, Zarhin’s trick for K3 surfaces, and the Tate conjecture* (`Charles2016`). Annals of Math. 184 (2016) 487–526, published PDF from the Annals site (printed = physical + 486). [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf). Read locators: §2.2 and Proposition 2.9 with proof, pp.500–502; Theorem 2.10, pp.502–503; Proposition 4.3 proof, p.520; Lemmas 4.5–4.6, pp.520–521; proof of Theorem 1.3, p.523.
- **Max Lieblich, Davesh Maulik, Andrew Snowden**, *Finiteness of K3 surfaces and the Tate conjecture* (`LMS2018`). arXiv:1107.1221, 20 pages (printed = physical); Ann. Sci. ÉNS 47 (2014) not collated. [Source](https://arxiv.org/pdf/1107.1221). Read locators: §2.1, Lemma 2.1.1 and Proposition 2.1.2 including proof, pp.3–4; §3.5, Lemmas 3.5.1–3.5.2 including proofs and Definition 3.5.3, pp.15–16.
- **Yingkun Li**, *Algebraicity of higher Green functions at a CM point* (`Li2023`). arXiv:2106.13653v2, 42 pages (printed = physical); Invent. Math. 234 (2023) not collated. [Source](https://arxiv.org/pdf/2106.13653v2). Read locators: §2.4, (2.4.1)–(2.4.6) and Proposition 2.6 with proof, pp.16–17.
- **Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle**, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings* (`Calmes2026`). arXiv:2009.07225v4, 63 pages. [Source](https://arxiv.org/pdf/2009.07225v4). Read locators: §3.1, Theorem 3.1.7 to Remark 3.1.9, pp.52–53.
- **Rainer Schulze-Pillot**, *Lecture notes on quadratic forms and their arithmetic* (`SchulzePillot2020`). arXiv:2008.12847v2. [Source](https://arxiv.org/pdf/2008.12847v2). Read locators: §9.2, Lemma 9.19, Definition/Lemma 9.20, printed pp.126–127.
- **Brian Conrad**, *Reductive group schemes* (`ConradRGS`). Autour des schémas en groupes I, Panoramas et Synthèses 42–43 (2014); author’s free copy (maintainer-cleared, printed = physical). [Source](http://math.stanford.edu/~conrad/papers/luminysga3.pdf). Read locators: Lemma C.2.8, pp.316–317 (GSpin/Gₘ and the orthogonal group); Clifford norm (C.4.2), p.337; Proposition C.4.6, p.340; (C.4.4), p.343; Corollary C.4.10, p.344; beginning of C.5, p.346. Read in the cleared original; no claim to reading the entire appendix.
- **Benedict Gross, Winfried Kohnen, Don Zagier**, *Heegner points and derivatives of L-series II* (`GKZ1987`). Published Math. Ann. 278 (1987), 497–562; author-hosted PDF, 66 physical pages; printed = physical + 496. [Source](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01458081/fulltext.pdf). Read locators: Chapter I §2, Proposition 1 and its proof, printed pp.508–510 (physical pp.12–14), including the dyadic discriminant condition.

Page locators refer to the editions just identified. The packet records content hashes, access dates and source-version provenance. Source matches and proofs below are paraphrases, not transcriptions. The source-issue register at the end distinguishes corrected mathematical targets from defects in their sources.

## How the targets fit together

§2.10 supplies the projective-lattice, completion, local-global and discriminant API used by §§2.11, 2.15 and 2.19. Its local invariant-ideal arguments do not require the open global simultaneous-pseudobasis proof. §2.11 combines the order theory with number-field quadratic representation. §2.12 supplies finite-field classification and the residue-field arguments in §2.14. §2.13 imports IntegralLattices binary forms and local normal forms, then adds character evaluation; the exponent-two conclusion uses the existing genus field. §2.14 combines these residue arguments with the field spinor norm and the regular-ring GSpin input. §2.15 uses the trace form for hermitian classification and §2.10 for genera. §2.16 supplies stable-lattice local algebra. §2.17 extends the base plan’s signed hermitian theory with transfer. §§2.18–2.19 use these inputs for integral Frobenius, trace-dual and signature consequences.

## Targets

### 2.10 Lattices over a Dedekind domain: pseudobases, completion and the local-global dictionary

<a id="lattice-pseudobasis"></a>
#### Pseudobases and invariant factors of lattices over a Dedekind domain

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-pseudobasis` · theorem

Let R be a Dedekind domain with fraction field F, V an n-dimensional F-vector space and M ⊆ V an R-lattice (a finitely generated R-submodule spanning V; Mathlib's Submodule.IsLattice F M). (a) For every F-basis y_1,…,y_n of V there are x_1,…,x_n ∈ M and nonzero fractional ideals 𝔞_1,…,𝔞_n of R with M = 𝔞_1x_1 ⊕ ⋯ ⊕ 𝔞_nx_n and x_j ∈ Fy_1 + ⋯ + Fy_j for every j (a pseudobasis with coefficient ideals 𝔞_j). (b) For n ≥ 1, dropping the triangularity condition, one may take 𝔞_1 = ⋯ = 𝔞_{n−1} = R, so M ≅ R^{n−1} ⊕ 𝔞 as R-modules. (c) For two R-lattices M, N ⊆ V there is a common pseudobasis x_1,…,x_n with M = ⊕𝔞_ix_i and N = ⊕𝔟_ix_i such that the ideals 𝔡_i = 𝔟_i𝔞_i^{−1} satisfy 𝔡_1 | 𝔡_2 | ⋯ | 𝔡_n; these invariant factors of N relative to M are unique. In particular every R-lattice is a finitely generated projective R-module, free exactly when it has a pseudobasis with all coefficient ideals principal.

*Hypotheses.*

- R a Dedekind domain (not a field), F = Frac R, V finite-dimensional over F; n = 0 allowed (empty pseudobasis).
- Fractional ideals are nonzero R-submodules of F; Mathlib's FractionalIdeal R⁰ F.

*Proof sketch.*

1. (a) Induct on n, with the zero-dimensional case empty. Intersect M with the first n−1 coordinate spaces. The last-coordinate image is a nonzero fractional ideal, hence an invertible projective module; the coordinate map splits. Its section extends over F to multiplication by a vector x_n. Rescale x_n and its coefficient ideal inversely to arrange x_n ∈ M. Induct on the kernel.
2. (b) For n ≥ 1 use the coprime-ideal form of Steinitz’s lemma: replace a fractional ideal by an equivalent ideal coprime to the other, using ideal approximation/two-generation, and split 𝔞 ⊕ 𝔟 as R ⊕ 𝔞𝔟. Iterate n−1 times.
3. (c) Local Smith normal form determines ordered exponents at each height-one prime; all but finitely many vanish, so unique ideal factorization reconstructs the invariant ideals and proves uniqueness. Existence of a single global pseudobasis simultaneously realizing them is a separate assertion of Voight Theorem 9.3.9: local bases cannot simply be glued. Its global elementary-divisor proof is the recorded common-pseudobasis gap; subsequent index computations use only the proved local exponents.

*Checks.*

- R = ℤ: every lattice is free and (a) is the Hermite normal form of a basis.
- R = ℤ[√−5], M = 𝔭 = (2, 1+√−5) ⊂ ℚ(√−5): n = 1, the only coefficient ideal is 𝔭 itself (up to principal ideals) and M is not free.
- Invariant factors of 2ℤ ⊕ 6ℤ relative to ℤ²: (2), (6).

*Prerequisites.*

- `mathlib:Submodule.IsLattice`
- `mathlib:FractionalIdeal`
- `mathlib:FractionalIdeal.mul_inv_cancel_iff`
- `mathlib:IsDedekindDomain.exists_sup_span_eq`
- `mathlib:Submodule.exists_smith_normal_form_of_le`
- `mathlib:Module.Projective`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), Theorem 9.3.6 with proof, printed p.138; Theorem 9.3.9, p.139; 9.3.10, p.139 (post-publication v1.0.7u). Theorem 9.3.6 decomposes every lattice over a Dedekind domain as a direct sum of fractional-ideal multiples of vectors triangular in a given basis; 9.3.10 records the variant with all but one coefficient ideal trivial; Theorem 9.3.9 is the common pseudobasis with dividing invariant factors.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `Submodule.IsLattice.exists_pseudobasis`. Implementation: unchecked.

<a id="lattice-steinitz-class"></a>
#### The Steinitz class of a lattice

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-steinitz-class` · definition

For an R-lattice M in an n-dimensional F-space V over a Dedekind domain R with pseudobasis M = 𝔞_1x_1 ⊕ ⋯ ⊕ 𝔞_nx_n (lattice-pseudobasis), the Steinitz class of M is st(M) = [𝔞_1⋯𝔞_n] ∈ Cl(R) (Mathlib's ClassGroup R; st(M) = 1 for n = 0). It does not depend on the pseudobasis, depends only on the isomorphism class of M as an R-module, and together with n classifies finitely generated torsion-free R-modules: M ≅ R^{n−1} ⊕ 𝔞 with [𝔞] = st(M) for n ≥ 1.

*Hypotheses.*

- R Dedekind, F = Frac R, M ⊆ V an R-lattice; the class group is that of R, not a narrow or ray class group.

*Uses.*

- Lipnowski–Tsimerman, Definition 5.3 and Remark 5.7 (arXiv:1511.02212v1, §5.2–5.3): free unimodular hermitian O_L-lattices are the projective ones of trivial Steinitz class; free-projective-comparison
- lattice-local-global-dictionary (this packet): a lattice is locally free at every prime, whatever its Steinitz class
- trace-unimodular-lattice (this packet): the existence theorem produces projective O_F-lattices whose Steinitz class is not controlled

*API.*

- `TauCeti.GeometryOfNumbersPlan.Submodule.IsLattice.steinitzClass` (data): st(M) ∈ ClassGroup R, defined from any pseudobasis.
- `TauCeti.GeometryOfNumbersPlan.Submodule.IsLattice.steinitzClass_eq_of_pseudobasis` (characterisation): For every pseudobasis with coefficient ideals 𝔞_i, st(M) is the class of ∏𝔞_i.
- `TauCeti.GeometryOfNumbersPlan.Submodule.IsLattice.steinitzClass_eq_of_linearEquiv` (other): R-linearly isomorphic lattices (in possibly different spaces) have equal Steinitz classes.
- `TauCeti.GeometryOfNumbersPlan.Submodule.IsLattice.free_iff_steinitzClass_eq_one` (characterisation): For n ≥ 1, M is a free R-module iff st(M) = 1.
- `TauCeti.GeometryOfNumbersPlan.Submodule.IsLattice.steinitzClass_prod` (relation): st(M ⊕ N) = st(M)·st(N) for lattices in V ⊕ W.
- `TauCeti.GeometryOfNumbersPlan.Submodule.IsLattice.steinitzClass_fractionalIdeal` (example): For a nonzero fractional ideal 𝔞 ⊆ F (n = 1), st(𝔞) = [𝔞].
- `TauCeti.GeometryOfNumbersPlan.Submodule.IsLattice.steinitzClass_smul` (simp): st(cM) = st(M) for c ∈ F×; more generally st(𝔟M) = [𝔟]^n st(M).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.steinitzClass_int` (degenerate): For R = ℤ every lattice M ⊆ ℚ^n has steinitzClass M = 1, and M is free.
- `TauCeti.GeometryOfNumbersPlan.steinitzClass_sqrt_neg_five` (computation): For R = ℤ[√−5] and 𝔭 = (2, 1+√−5) viewed in F = ℚ(√−5), steinitzClass 𝔭 ≠ 1, so 𝔭 is not a free R-module.
- `TauCeti.GeometryOfNumbersPlan.steinitzClass_sqrt_neg_five_sq` (computation): For the same 𝔭, the lattice 𝔭 ⊕ 𝔭 ⊆ F² has steinitzClass 1 (Cl(R) has order 2), hence is free of rank 2.
- `TauCeti.GeometryOfNumbersPlan.steinitzClass_not_rank` (non-example): The Steinitz class is not determined by local data: 𝔭 and R are isomorphic after localization at every prime, yet steinitzClass 𝔭 ≠ steinitzClass R.

*Proof sketch.*

1. Independence: two pseudobases differ by a matrix g ∈ GL_n(F) with g·(⊕𝔞_i) = ⊕𝔟_i; comparing the top exterior powers gives 𝔟_1⋯𝔟_n = det(g)·𝔞_1⋯𝔞_n, so the classes agree.
2. Classification: lattice-pseudobasis (b) gives M ≅ R^{n−1} ⊕ 𝔞; R^{n−1} ⊕ 𝔞 ≅ R^{n−1} ⊕ 𝔟 forces [𝔞] = [𝔟] by the top exterior power.

*Checks.*

- Over a PID every lattice has trivial Steinitz class.
- 𝔭 = (2, 1+√−5) in ℤ[√−5] has nontrivial class and 𝔭 ⊕ 𝔭 has trivial class, so 𝔭 ⊕ 𝔭 ≅ R² although 𝔭 is not free.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-pseudobasis`
- `mathlib:ClassGroup`
- `mathlib:ClassGroup.mk0`
- `mathlib:ClassGroup.mk0_eq_one_iff`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), 9.3.10, printed p.139; Exercise 9.7. Defines the Steinitz class of a lattice from a pseudobasis, records its well-definedness (left as Exercise 9.7) and the decomposition with all coefficient ideals but one equal to R.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="lattice-completion"></a>
#### Completion of a lattice at a finite place

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-completion` · construction

Let R be a Dedekind domain with fraction field F, v a height-one prime of R (Mathlib's IsDedekindDomain.HeightOneSpectrum R), F_v = adicCompletion F v and R_v = adicCompletionIntegers F v, and V_v = F_v ⊗_F V. For an R-lattice L ⊆ V its completion L_v ⊆ V_v is the R_v-span of the image of L. It is a full R_v-lattice; the natural map R_v ⊗_R L → V_v is injective with image L_v; L_v depends only on the localization L_(v); and if q : V → F is a quadratic map with q(L) ⊆ R, then the base-changed form q_v (Tau Ceti QuadraticForm.atFinitePlace when F is a number field) satisfies q_v(L_v) ⊆ R_v. Completion is monotone, commutes with finite sums and intersections of lattices, and sends cL to cL_v.

*Hypotheses.*

- R Dedekind, not a field; V finite-dimensional over F; v ranges over the height-one primes (the finite places).
- No freeness of L is assumed; L_v is free because R_v is a DVR.

*Uses.*

- integral-genus (base packet): the genus relation compares the completed lattices at every finite place
- lattice-local-global-dictionary (this packet): the completed form of the dictionary
- integral-genus (base packet) and trace-unimodular-lattice (this packet): local integral stabilizers are compact open subgroups for the adelic genus dictionary
- Li, Algebraicity of higher Green functions, §2.4 (2.28): L_h = V(F) ∩ h⁻¹L̂ is defined through the completed lattices

*API.*

- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion` (constructor): The R_v-lattice L_v ⊆ V_v, with the restricted integral quadratic form q_v.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_eq_range_tensor` (characterisation): L_v is the image of the injective map R_v ⊗_R L → V_v.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_isLattice` (instance): L_v is a full R_v-lattice in V_v (Submodule.IsLattice F_v).
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_inf_eq_localize` (characterisation): L_v ∩ V = L_(v), the localization at v (base packet lattice-localization).
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_localize` (simp): The completion of L_(v) equals L_v.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_mono` (functoriality): L ⊆ M implies L_v ⊆ M_v; an integral isometry g with gL = M gives g_vL_v = M_v.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_sup` (simp): (L + M)_v = L_v + M_v and (L ∩ M)_v = L_v ∩ M_v.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_smul` (simp): (cL)_v = c·L_v for c ∈ F×.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.completion_integral` (compatibility): q_v(L_v) ⊆ R_v, where q_v is the base change of q to F_v (QuadraticForm.atFinitePlace for number fields).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.completion_int_two` (computation): For R = ℤ, L = ℤ ⊆ ℚ and v = (2), the completion is ℤ_2 ⊆ ℚ_2 (as a subset of adicCompletion ℚ v ≅ ℚ_2).
- `TauCeti.GeometryOfNumbersPlan.completion_two_int_at_three` (computation): For L = 2ℤ, completion at (3) is ℤ₃ and at (2) is 2ℤ₂. In particular the completions of ℤ and 2ℤ at 2 are unequal; using the ℚ₂-span would wrongly make both equal to ℚ₂.
- `TauCeti.GeometryOfNumbersPlan.completion_ne_of_ne_at` (non-example): ℤ and (1/2)ℤ have equal completions at every odd prime but different completions at 2; completion at one place does not determine the lattice.
- `TauCeti.GeometryOfNumbersPlan.completion_zero_dim` (degenerate): In V = 0 the only lattice is 0 and its completion is 0.

*Proof sketch.*

1. A torsion-free module over a Dedekind domain is flat, so R_v is flat over R. Tensor the injection L → V with R_v. Since every nonzero element of R becomes invertible in F_v and Frac(R_v)=F_v, R_v ⊗_R V identifies with F_v ⊗_F V; the injection has image the R_v-span of L.
2. The image is finitely generated over R_v and spans V_v, so it is a full lattice; it is the R_v-span of L by construction.
3. Since L_(v) = R_(v)L and R_(v) → R_v, the completion of L equals that of L_(v); combine with completed-lattice-descent (R_(v) a DVR) to get L_v ∩ V = L_(v).
4. Integrality: q_v(Σ a_ix_i) = Σ a_i²q(x_i) + Σ_{i<j} a_ia_j polar(x_i,x_j) with a_i ∈ R_v and q(x_i), polar(x_i,x_j) ∈ R.

*Checks.*

- R = ℤ, L = ℤ ⊂ ℚ, v = (2): L_v = ℤ_2.
- L = 2ℤ: L_2 = 2ℤ_2 while L_3 = ℤ_3.
- For the nonfree 𝔭 = (2, 1+√−5) ⊂ ℚ(√−5), the completion at 𝔭 is the principal ideal π R_𝔭 of the local ring.

*Prerequisites.*

- `mathlib:IsDedekindDomain.HeightOneSpectrum`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`
- `mathlib:Submodule.IsLattice`
- `tauceti:QuadraticForm.atFinitePlace`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), §9.5, (9.5.1)–(9.5.2) and Lemma 9.5.3 with proof, printed pp.142–143. Defines the completion of a DVR, shows R = F ∩ R_𝔭 and the residue isomorphisms R/𝔭^e ≅ R_𝔭/𝔭^eR_𝔭, and proves that M ↦ M ⊗ R_𝔭 and N ↦ N ∩ V are inverse bijections between lattices; this construction composes that with localization.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="lattice-local-global-dictionary"></a>
#### Local-global dictionary for lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-local-global-dictionary` · theorem

Let R be a Dedekind domain with fraction field F, V a finite-dimensional F-space and M ⊆ V an R-lattice. (a) The map N ↦ (N_(𝔭))_𝔭 is a bijection from R-lattices N ⊆ V to families (N^𝔭)_𝔭 of R_(𝔭)-lattices in V, indexed by the maximal ideals, with N^𝔭 = M_(𝔭) for all but finitely many 𝔭; the inverse is (N^𝔭) ↦ ⋂_𝔭 N^𝔭. (b) The same holds with the completions N_v ⊆ V_v (lattice-completion) in place of the localizations: N ↦ (N_v)_v is a bijection onto the families of full R_v-lattices that agree with M_v for all but finitely many v, with inverse (N^v) ↦ V ∩ ⋂_v N^v. (c) Inclusion, sum, intersection and the R-index are computed place by place.

*Hypotheses.*

- R Dedekind; M is only a reference lattice, and any two lattices agree at all but finitely many places.
- This is a statement about embedded lattices, not about isometry classes.

*Proof sketch.*

1. Every lattice N satisfies rM ⊆ N ⊆ r^{−1}M for some nonzero r ∈ R (Voight Lemma 9.3.5), and r lies in only finitely many primes, so N_(𝔭) = M_(𝔭) for almost all 𝔭.
2. Injectivity is lattice-intersection-localizations. For surjectivity let N = ⋂_𝔭 N^𝔭; choose r with rM_(𝔭) ⊆ N^𝔭 ⊆ r^{−1}M_(𝔭) at the finitely many exceptional primes, so rM ⊆ N ⊆ r^{−1}M and N is a lattice; compute N_(𝔮) = N^𝔮 at each 𝔮 by choosing an element of the ideal of denominators outside 𝔮 (Voight's argument with unique factorization).
3. (b) follows from (a) and completed-lattice-descent at each prime, through lattice-completion.
4. (c): lattice-inclusion-localizations, and lattice-index-ideal for the index.

*Checks.*

- The family (2ℤ_(2), ℤ_(p) for p odd) comes from 2ℤ.
- A family differing from ℤ_(p) at infinitely many p (for example p^{-1}ℤ_(p) at every p) comes from no lattice: the intersection is not finitely generated over ℤ.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-intersection-localizations`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-inclusion-localizations`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-completion`
- `mathlib:Submodule.IsLattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-index-ideal`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), Theorem 9.4.9 with proof, printed pp.141–142; Lemma 9.5.3 and the remark after it, p.143. Theorem 9.4.9 is the bijection between lattices and almost-everywhere-standard families of local lattices with its proof by intersection; the paragraph after Lemma 9.5.3 extends the dictionary to completions.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `IntegralQuadraticLattice.localGlobalEquiv`. Implementation: unchecked.

<a id="lattice-index-ideal"></a>
#### The R-index of two lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-index-ideal` · definition

For R-lattices M, N in an n-dimensional F-space V over a noetherian domain R, the R-index [M : N]_R is the R-submodule of F generated by det δ for all δ ∈ End_F(V) with δ(M) ⊆ N. It is a nonzero R-submodule; [αM : N] = det(α)^{−1}[M : N] for α ∈ Aut_F(V); for free M and N it is generated by the determinant of a change of basis; it commutes with localization; for projective M, N it is an invertible fractional ideal, and when N ⊆ M one has [M : N]_R = R iff M = N. Over a Dedekind domain with N ⊆ M it is the product of the invariant factors of the torsion module M/N, and over ℤ it is generated by #(M/N).

*Hypotheses.*

- R noetherian domain for the definition; Dedekind for the invariant-factor and multiplicativity statements.
- N ⊆ M is not required for the definition; [M : N]_R may be a non-integral fractional ideal.

*Uses.*

- lattice-discriminant-ideal (this packet): disc(N) = [M : N]² disc(M)
- finite-dvr-determinant-index (this packet): for F(T) ⊆ T over a DVR the index is (det F), and its cardinality is q^{v(det F)}
- Voight, Quaternion algebras, Lemma 15.2.15 (printed p.237) and 15.4.6: disc(I) = [J : I]²disc(J) for full lattices; the reduced-discriminant relation discrd(I) = [J : I]discrd(J) is restricted to orders (source issue E201)

*API.*

- `TauCeti.GeometryOfNumbersPlan.latticeIndex` (constructor): [M : N]_R as a Submodule R F generated by the determinants det δ with δ(M) ⊆ N.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_ne_bot` (other): [M : N]_R ≠ 0.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_map` (simp): [αM : N]_R = (det α)^{−1}·[M : N]_R for α ∈ Aut_F(V).
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_of_basis` (characterisation): For bases b of M and c of N, [M : N]_R = R·det(b.toMatrix c).
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_localize` (compatibility): ([M : N]_R)_(𝔭) = [M_(𝔭) : N_(𝔭)]_{R_(𝔭)}.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_eq_top_iff` (characterisation): For projective full lattices M and N with N ⊆ M, [M:N]_R = R iff M = N.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_trans` (relation): Over a Dedekind domain, [M : P]_R = [M : N]_R·[N : P]_R.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_int` (compatibility): For full ℤ-lattices N ⊆ M in a finite-dimensional ℚ-space, [M:N]_ℤ = ℤ·#(M/N); the quotient is finite.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.latticeIndex_smul` (computation): For a projective full R-lattice M and nonzero r ∈ R, [M:rM]_R = r^nR; in particular this holds over a Dedekind domain.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_int_example` (computation): [ℤ² : ℤ ⊕ 2ℤ]_ℤ = 2ℤ, and [ℤ ⊕ 2ℤ : ℤ²]_ℤ = (1/2)ℤ.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_self` (degenerate): For a projective full R-lattice M, [M:M]_R = R; in dimension zero every index is R. For a general lattice over a nonnormal domain this equality is not asserted.
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_not_card` (non-example): The index is a determinant ideal, not a module length: for R = ℤ[i] and M = R, N = (1+i)R, [M : N] = (1+i), whose norm 2 is #(M/N); the ideal itself is not (2).
- `TauCeti.GeometryOfNumbersPlan.latticeIndex_nonnormal` (non-example): For R = k[t²,t³] ⊂ F = k(t) and M = k[t], a finite full R-lattice of rank one, [M:M]_R = k[t] ≠ R; taking M = R would give R. The definition must preserve this distinction.

*Proof sketch.*

1. Nonzero: some nonzero r ∈ R has rM ⊆ N, so r^n ∈ [M : N].
2. Free case: every δ with δ(M) ⊆ N factors as δ = δ₀∘(δ₀^{−1}δ) with δ₀ the change of basis and δ₀^{−1}δ an R-endomorphism of M, whose determinant lies in R.
3. Localization: clear denominators of finitely many generators of M (Voight Lemma 9.6.7).
4. Dedekind case: compute locally with Smith normal form and reassemble by unique factorization; multiplicativity [M : P] = [M : N][N : P] holds locally because determinants multiply.

*Checks.*

- [M : rM]_R = r^nR (Voight Example 9.6.5).
- [ℤ² : ℤ ⊕ 2ℤ]_ℤ = 2ℤ.

*Prerequisites.*

- `mathlib:LinearMap.det`
- `mathlib:Submodule.IsLattice`
- `mathlib:Submodule.exists_smith_normal_form_of_le`
- `mathlib:Module.torsion_by_prime_power_decomposition`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-pseudobasis`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 9.6.1, Lemmas 9.6.3–9.6.4, Examples 9.6.5–9.6.6, Lemma 9.6.7, Proposition 9.6.8, Lemma 9.6.9, printed pp.143–144. Defines the R-index by determinants of maps carrying one lattice into the other, shows its behaviour under automorphisms, its principal generator for free lattices, its compatibility with localization, its invertibility for projective lattices and its description by invariant factors over a Dedekind domain.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="lattice-discriminant-ideal"></a>
#### Discriminant ideal and unimodularity of a quadratic lattice

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-discriminant-ideal` · definition

Let R be a Dedekind domain, F = Frac R, (V, q) a nondegenerate quadratic space of dimension n over F with polar form b(x,y) = q(x+y) − q(x) − q(y), and L ⊆ V an R-lattice. The discriminant ideal 𝔡(L) is the R-submodule of F generated by det(b(x_i,x_j))_{i,j} for all x_1,…,x_n ∈ L, and L^♯ = {y ∈ V : b(y, L) ⊆ R} is its dual lattice (the base packet's hermitian-dual-lattice with trivial involution). Then 𝔡(L) = [L^♯ : L]_R whenever L ⊆ L^♯ (that is, b is R-valued on L), 𝔡(N) = [L : N]_R²·𝔡(L) for any two lattices N, L, and for a pseudobasis L = ⊕𝔞_ix_i one has 𝔡(L) = det(b(x_i,x_j))·(𝔞_1⋯𝔞_n)². L is unimodular when L^♯ = L, equivalently (for L ⊆ L^♯) 𝔡(L) = R. For a different R-valued pairing Tr∘b the same construction gives the trace dual used for trace-unimodular lattices.

*Hypotheses.*

- R Dedekind; q nondegenerate on V; the polar form b is not divided by 2, so the standard lattice ℤ ⊆ (ℚ, x²) has 𝔡 = 2ℤ.
- Comparison with Tau Ceti: for R = ℤ, 𝔡(L) is generated by the Gram determinant of the polar form, and #(L^♯/L) = |det| (IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet).

*Uses.*

- Li, Algebraicity of higher Green functions, §2.4 (2.25)–(2.30): trace-even O_F-lattices with L′ = L are the unimodular lattices for the trace pairing
- Lipnowski–Tsimerman, Definition 5.3: unimodular hermitian lattices M = M^∨
- quaternion-order-discriminant (this packet): the reduced-trace pairing on an order

*API.*

- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.discrIdeal` (constructor): 𝔡(L), the R-submodule of F spanned by Gram determinants of n-tuples in L.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.dual` (constructor): L^♯ = {y : b(y,L) ⊆ R}, the base packet hermitian dual with trivial involution.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.discrIdeal_of_pseudobasis` (characterisation): 𝔡(L) = det(b(x_i,x_j))·(𝔞_1⋯𝔞_n)² for a pseudobasis.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.discrIdeal_index` (relation): 𝔡(N) = [L : N]_R²·𝔡(L).
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.IsUnimodular` (data): The predicate L^♯ = L.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.isUnimodular_iff_discrIdeal` (characterisation): For L ⊆ L^♯: L is unimodular iff 𝔡(L) = R.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.discrIdeal_localize` (compatibility): 𝔡(L_(𝔭)) = 𝔡(L)_(𝔭) and 𝔡(L_v) = 𝔡(L)R_v.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.discrIdeal_int` (compatibility): For R = ℤ, 𝔡(L) = ℤ·det(Gram of the polar form) and its generator agrees with Tau Ceti’s gram determinant of the bilinear lattice (polar form).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.discrIdeal_sq_int` (computation): For R = ℤ, L = ℤ ⊆ ℚ with q(x) = x², discrIdeal L = 2ℤ and L is not unimodular.
- `TauCeti.GeometryOfNumbersPlan.discrIdeal_hyperbolic` (computation): The hyperbolic plane ℤe ⊕ ℤf with q(xe+yf) = xy has discrIdeal = ℤ and is unimodular.
- `TauCeti.GeometryOfNumbersPlan.discrIdeal_scale` (characterisation): discrIdeal (2L) = 2^{2n}·discrIdeal L for a lattice of rank n.
- `TauCeti.GeometryOfNumbersPlan.discrIdeal_zero_dim` (degenerate): In dimension 0 the discriminant ideal is R and the zero lattice is unimodular.

*Proof sketch.*

1. The generators are determinants of Gram matrices of families in L; for a pseudobasis every family in L is Σ a_{ij}x_j with a_{ij} ∈ 𝔞_j, and the determinant expands into det(b(x_i,x_j))·(det a)² with det a ∈ 𝔞_1⋯𝔞_n.
2. 𝔡(N) = [L : N]²𝔡(L): both sides are computed locally, where they are the transformation law of Gram determinants.
3. L^♯ is a lattice (base packet hermitian-dual-lattice); with the pseudobasis of L the dual pseudobasis gives L^♯ = ⊕ 𝔞_i^{−1}x_i^♯ and [L^♯ : L] = 𝔡(L).

*Checks.*

- ℤ ⊆ (ℚ, x²): 𝔡 = 2ℤ and ℤ^♯ = (1/2)ℤ.
- The hyperbolic plane ℤe ⊕ ℤf with q(xe + yf) = xy: 𝔡 = ℤ (det = −1), unimodular.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-pseudobasis`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-index-ideal`
- `mathlib:QuadraticMap.polarBilin`
- `mathlib:Matrix.det`
- `tauceti:TauCeti.IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 15.2.2, Lemma 15.2.5, 15.2.8 and Lemma 15.2.15, printed pp.234–237; §15.3, Lemma 15.3.8, p.238. Defines the discriminant of a lattice as the module generated by Gram determinants of its n-tuples (for the reduced-trace pairing), gives the transformation law under a change of family, the pseudobasis formula with the squared product of coefficient ideals, and disc(I) = [J : I]²disc(J); §15.3 applies the same definition to quadratic modules and shows that nonsingularity is equivalent to the discriminant being the unit ideal. The construction here is the same for an arbitrary nondegenerate symmetric pairing.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

### 2.11 Quaternion orders and reduced norms

<a id="quaternion-order"></a>
#### Orders in finite-dimensional algebras and quaternion orders

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternion-order` · definition

Let R be a noetherian domain with fraction field F and B a finite-dimensional F-algebra. An R-order in B is an R-lattice O ⊆ B (finitely generated, spanning B over F) that is a subring, so 1 ∈ O and R ⊆ O; it is maximal if it is not properly contained in another R-order. Every element of an order is integral over R. A quaternion order is an order in a quaternion algebra B = (a, b | F); it is stable under the standard involution x ↦ x̄ (as x̄ = trd(x) − x with trd(x) ∈ R), and the reduced norm and trace restrict to R-valued maps on it.

*Hypotheses.*

- R noetherian domain; for quaternion orders R is a Dedekind domain with F of characteristic ≠ 2 where the standard involution is used.
- This is the general notion that ClassicalArithmeticCompletion CA.7 (orders in finite-dimensional algebras, maximal orders) also uses; it is planned here and CA.7 imports it.

*Uses.*

- quaternionic-integral-hermitian-data (base packet): the coefficient ring of a quaternionic hermitian lattice is a star-stable quaternion order
- ComplexMultiplicationAndExplicitReciprocity CM.5 (Deuring classification): endomorphism rings of supersingular curves are maximal orders in B_{p,∞}
- ClassicalArithmeticCompletion CA.7: orders, left orders and maximal orders in group algebras and Galois module structure
- model-ring-positive-involution (this packet): M_m(O_D) for a maximal order O_D of a definite quaternion algebra

*API.*

- `TauCeti.GeometryOfNumbersPlan.AlgebraOrder` (structure): An R-subalgebra of B whose underlying R-submodule is a lattice (Submodule.IsLattice F).
- `TauCeti.GeometryOfNumbersPlan.AlgebraOrder.IsMaximal` (data): Maximality among R-orders in B.
- `TauCeti.GeometryOfNumbersPlan.AlgebraOrder.isIntegral` (other): Every element of an order is integral over R.
- `TauCeti.GeometryOfNumbersPlan.AlgebraOrder.localize` (functoriality): O_(𝔭) = R_(𝔭)O is an R_(𝔭)-order; maximality is local for R Dedekind (Voight Lemma 10.4.3).
- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.star_mem` (characterisation): For a quaternion order, x ∈ O implies x̄ ∈ O.
- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.trd_mem` (simp): trd(x), nrd(x) ∈ R for x ∈ O.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.algebraOrder_matrix` (computation): M₂(ℤ) is a maximal ℤ-order in M₂(ℚ).
- `TauCeti.GeometryOfNumbersPlan.algebraOrder_lipschitz_not_maximal` (non-example): The Lipschitz order ℤ⟨i, j⟩ ⊆ (−1, −1 | ℚ) is an order but not maximal: it is strictly contained in the Hurwitz order ℤ⟨i, j, (1+i+j+ij)/2⟩.
- `TauCeti.GeometryOfNumbersPlan.algebraOrder_field` (compatibility): For a Dedekind domain R and its fraction field F, the only R-order in F is R, because R is integrally closed. For a number field B over ℚ, its maximal ℤ-order is the ring of integers. This does not assert that a nonnormal R is its own maximal order.
- `TauCeti.GeometryOfNumbersPlan.algebraOrder_not_lattice` (non-example): ℤ[1/2] ⊆ ℚ is a subring but not a ℤ-order (not finitely generated).

*Proof sketch.*

1. Integrality: an element of an order generates a finitely generated R-submodule, hence is integral (Voight Lemma 10.3.2).
2. Standard-involution stability: x ∈ O is integral, so its reduced characteristic polynomial x² − trd(x)x + nrd(x) has coefficients in R (R integrally closed), and x̄ = trd(x) − x ∈ O.

*Checks.*

- M₂(ℤ) ⊆ M₂(ℚ) is a maximal order.
- The Lipschitz order ℤ⟨i, j⟩ in (−1, −1 | ℚ) is an order, not maximal (contained in the Hurwitz order).

*Prerequisites.*

- `mathlib:Submodule.IsLattice`
- `mathlib:QuaternionAlgebra`
- `tauceti:QuaternionAlgebra.normForm`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 10.2.1, printed p.152; Lemma 10.3.2 and 10.4 (maximal orders), pp.154–155. Defines an R-order as a lattice that is a subring, shows its elements are integral, and introduces maximal orders and their local nature.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="quaternion-order-discriminant"></a>
#### Discriminant and reduced discriminant of a quaternion order

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternion-order-discriminant` · construction

For an R-lattice I in a quaternion algebra B over F (R Dedekind), disc(I) is the R-submodule of F generated by d(α_1, …, α_4) = det(trd(α_iα_j)), and the reduced discriminant discrd(I) is generated by the values of the alternating trilinear form m(α_1, α_2, α_3) = trd((α_1α_2 − α_2α_1)α_3) on I. disc(I) = [J : I]²disc(J) for projective lattices; for R-orders O ⊆ O′, disc(O) = discrd(O)² and discrd(O) = [O′ : O]·discrd(O′) (both fail for lattices that are not orders: see source issue E201); for an order with a free basis disc(O) = d(basis)R. Discriminants localize and complete, and O ⊆ O′ with equal discriminants forces O = O′.

*Hypotheses.*

- R Dedekind with fraction field F; B a quaternion algebra over F; lattices projective.

*Uses.*

- maximal-quaternion-order-criterion (this packet): maximality is detected by discrd(O) = disc(B)
- ComplexMultiplicationAndExplicitReciprocity CM.5: maximal orders of B_{p,∞} have reduced discriminant p

*API.*

- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.disc` (constructor): disc(I) ⊆ F, generated by det(trd(α_iα_j)).
- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.discrd` (constructor): discrd(I), generated by trd((α_1α_2 − α_2α_1)α_3).
- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.disc_eq_discrd_sq` (relation): disc(O) = discrd(O)² for an R-order O.
- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.discrd_index` (relation): discrd(O) = [O′ : O]_R·discrd(O′) for orders O ⊆ O′.
- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.eq_of_le_of_disc_eq` (characterisation): O ⊆ O′ and disc O = disc O′ imply O = O′.
- `TauCeti.GeometryOfNumbersPlan.QuaternionOrder.discrd_localize` (compatibility): discrd(O_(𝔭)) = discrd(O)_(𝔭).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.discrd_matrix` (computation): discrd(M₂(ℤ)) = ℤ and disc(M₂(ℤ)) = ℤ.
- `TauCeti.GeometryOfNumbersPlan.discrd_hurwitz` (computation): The Hurwitz order in (−1, −1 | ℚ) has discrd = 2ℤ; the Lipschitz order has discrd = 4ℤ.
- `TauCeti.GeometryOfNumbersPlan.discrd_lattice_not_order` (non-example): For the lattice I = 2M₂(ℤ), which is not an order, disc(I) = 2⁸ℤ but discrd(I) = 2³ℤ, so disc(I) ≠ discrd(I)²: the square-root relation is a statement about orders.
- `TauCeti.GeometryOfNumbersPlan.discrd_not_disc` (non-example): disc and discrd differ: disc(Hurwitz) = 4ℤ while discrd(Hurwitz) = 2ℤ.

*Proof sketch.*

1. disc is the discriminant ideal of the reduced-trace pairing (lattice-discriminant-ideal) and inherits its index law (Voight Lemma 15.2.15).
2. m is alternating and well defined on B/F (Voight Lemma 15.4.3); m(α_1, α_2, α_3)² = −d(1, α_1, α_2, α_3), and for an order the values d(1, α_1, α_2, α_3) generate disc(O), giving disc = discrd² (Lemma 15.4.7, valid for orders: an order contains R·1 as a saturated summand, so its index in another order is the index of the images in B/F).

*Checks.*

- discrd(M₂(ℤ)) = ℤ.
- Hurwitz order: discrd = 2ℤ; Lipschitz order ℤ⟨i, j⟩: discrd = 4ℤ = [Hurwitz : Lipschitz]·2ℤ.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternion-order`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-discriminant-ideal`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-index-ideal`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 15.2.2, Lemma 15.2.5, Corollary 15.2.7, 15.2.8, Lemma 15.2.15, printed pp.234–237; §15.4, Lemma 15.4.3, the reduced discriminant and Lemma 15.4.7, pp.238–239. Defines the discriminant of a lattice in a quaternion algebra by Gram determinants of the reduced trace, proves its transformation and index laws, defines the reduced discriminant through the alternating trilinear form m and proves disc = discrd².

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="maximal-quaternion-order-criterion"></a>
#### Maximal quaternion orders and the reduced discriminant

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/maximal-quaternion-order-criterion` · theorem

Let R be a Dedekind domain whose fraction field F is a global field (a global ring), B a quaternion algebra over F and disc_R(B) the product of the primes of R at which B ramifies. Every R-order is contained in a maximal one, and an order O is maximal iff discrd(O) = disc_R(B). Locally: over a DVR, an order in M₂(F) is maximal iff its discriminant is R, and then it is conjugate to M₂(R); in a division quaternion algebra over a nonarchimedean local field the valuation ring is the unique maximal order, with discrd = 𝔭.

*Hypotheses.*

- R Dedekind with global fraction field; B quaternion over F.

*Proof sketch.*

1. Existence: an ascending chain of orders has strictly increasing discriminants (quaternion-order-discriminant), which stabilizes since R is noetherian.
2. Local split case: maximal orders of M₂(F) over a DVR are conjugate to M₂(R) (Voight Corollary 10.5.5), whose discriminant is R; conversely an order of discriminant R is maximal by the index law.
3. Local division case: the valuation ring is the set of integral elements, hence the unique maximal order (Voight Proposition 13.3.4), with discrd 𝔭.
4. Global: maximality is local and discrd localizes; compare prime by prime.

*Checks.*

- (−1, −1 | ℚ): Hurwitz order, discrd = 2 = disc B, maximal.
- The Lipschitz order has discrd 4 ≠ 2, not maximal.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternion-order`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternion-order-discriminant`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-local-global-dictionary`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), Proposition 13.3.4, printed p.199; Theorem 13.3.11, p.200; Lemma 15.5.1, Proposition 15.5.2, Lemma 15.5.3, Example 15.5.4, p.240; Theorem 15.5.5 and Example 15.5.7, p.241. Proves the valuation ring of a local division algebra is the unique maximal order, the existence of maximal orders through discriminants, the local split criterion disc = R, and the global criterion discrd(O) = disc(B) with explicit maximal orders of prime discriminant.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `QuaternionOrder.isMaximal_iff_discrd`. Implementation: unchecked.

<a id="hasse-schilling-norm-theorem"></a>
#### Reduced norms from a quaternion algebra (Hasse–Schilling, Eichler)

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/hasse-schilling-norm-theorem` · theorem

Let F be a number field, B a quaternion algebra over F and Ω the set of real places at which B ramifies. Then nrd(B^×) = F^×_{>_Ω 0} = {x ∈ F^× : x_v > 0 for all v ∈ Ω}. Locally, nrd(B_v^×) = ℝ_{>0} if B_v ≅ ℍ and F_v^× otherwise, and nrd(O_v^×) = R_v^× for a maximal order O_v at a finite place.

*Hypotheses.*

- F a number field; the statement at real places uses the sign at the ramified ones only.

*Uses.*

- Ichino–Prasanna, Hodge classes and the Jacquet–Langlands correspondence, §9.3 (routed item PAPER-ICHINO-PRASANNA-23/017): ν(H(F)^+) = F^× ∩ (𝔸^×)^+ = ν(G(F)^+)
- AbelianSchemesAndArithmeticModuliPartII F4, reduced-norm-class-comparison: the reduced-norm image controls the class-set comparison

*Proof sketch.*

1. nrd is the norm form of B (Tau Ceti QuaternionAlgebra.normForm), a 4-dimensional quadratic form; x ∈ B^× has nrd(x) = c iff the norm form represents c.
2. Local: if B_v is split the norm form is hyperbolic, hence universal; if B_v is a division algebra over a nonarchimedean field, ⟨−c⟩ ⊥ nrd is 5-dimensional and therefore isotropic, so nrd represents c; at a real ramified place nrd is positive definite (Voight Lemma 13.4.9).
3. Global: by the Hasse principle for representations of scalars (GlobalQuadraticForms Layer 6), c is represented globally iff it is represented at every place.
4. Units of a maximal order: nrd(O_v^×) = R_v^× from the explicit maximal orders (Voight Lemma 13.4.9).
5. If B is split, det diag(c,1)=c gives the norm directly. In the division case, isotropy of nrd(x)−cz² forces z≠0, so nrd(x/z)=c. This is the point at which division, rather than just regularity, is used.

*Checks.*

- B = (−1, −1 | ℚ) (ramified at 2 and ∞): nrd(B^×) = ℚ_{>0}, and 3 = nrd(1 + i + j).
- B = M₂(F): nrd = det is onto F^×.

*Prerequisites.*

- `tauceti:QuaternionAlgebra.normForm`
- `tauceti:QuadraticForm.LocallyRepresentsScalar`
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/maximal-quaternion-order-criterion`

*Source:* [John Voight, Voight2026](https://jvoight.github.io/quat-book.pdf), 14.7.1–14.7.2 and Main Theorem 14.7.4 with Lemmas 14.7.5–14.7.6 and its proof, printed pp.225–227; Lemma 13.4.9, p.204. States the local norm groups and that the reduced norm of B^× is the group of elements positive at the real ramified places; Voight proves it by embedding a suitable quadratic field, while this node proves it through the Hasse principle for the norm form.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `QuaternionAlgebra.range_nrd_eq`. Implementation: unchecked.

### 2.12 Quadratic forms over finite fields

<a id="finite-field-quadratic-classification"></a>
#### Quadratic forms over a finite field

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-field-quadratic-classification` · theorem

Let F = 𝔽_q. (a) Every quadratic form of dimension ≥ 3 is isotropic, and every nondegenerate form of dimension ≥ 2 represents every element of F^×. (b) For q odd, nondegenerate quadratic forms are classified by dimension and discriminant in F^×/F^{×2} (two classes in each positive dimension). (c) For q even, nondegenerate (nonsingular) forms of even dimension 2m are classified by dimension and Arf invariant (arf-invariant): the hyperbolic form mH and the form (m−1)H ⊥ [1, c] with c ∉ ℘(F); in each odd dimension there is one regular odd-dimensional form up to isometry.

*Hypotheses.*

- Nondegenerate in characteristic 2 means the polar form has radical of dimension ≤ 1 and q is anisotropic on it (EKM's convention).

*Uses.*

- Bergström–Faber–Payne §6 (routed item PAPER-BERGSTROM-FABER-PAYNE-24/quadric-classification): the orbits of quadric surfaces over 𝔽_q
- Charles, Lemma 4.5 proof via Lieblich–Maulik–Snowden Lemma 3.5.2 (routed item PAPER-CHARLES-16/115): a nondegenerate form of dimension ≥ 2 over 𝔽_ℓ represents every nonzero element
- odd-unimodular-unit-representation (this packet): the residue-field step of the Hensel lift

*Proof sketch.*

1. (a) Chevalley–Warning (Mathlib char_dvd_card_solutions_of_sum_lt) gives a nontrivial zero in dimension ≥ 3; a nondegenerate binary form ⊥ ⟨−c⟩ (or [·,·] ⊥ ⟨c⟩) is isotropic, so the binary form represents c.
2. (b) Split off hyperbolic planes (Witt decomposition, QuadraticFormInvariants Layer 1) down to an anisotropic part of dimension ≤ 2; binary forms are classified by the discriminant (EKM Proposition 13.2), and F^×/F^{×2} has order 2.
3. (c) For a perfect field of characteristic two, a regular odd-dimensional form has a one-dimensional polar radical on which q is nonzero. Normalize that radical line to ⟨1⟩ since every element is a square. In rank at least three, Chevalley–Warning supplies a nonzero isotropic vector; it cannot lie in the radical. Pair it with a vector having polar pairing 1, then add a multiple of the isotropic vector to make that partner isotropic. Split off a hyperbolic plane and induct to get H^m⊥⟨1⟩. Even-dimensional forms instead have perfect alternating polarization; split hyperbolic planes to the binary remainder, classified by F/℘(F) and the Arf invariant.
4. For regularity in characteristic two, a radical line with q zero is excluded. The perfect-polar Witt decomposition imported from QuadraticFormInvariants is used only in characteristic ≠2; the characteristic-two splitting argument is supplied here.

*Checks.*

- q odd, n = 2: x² + y² is hyperbolic iff −1 is a square iff q ≡ 1 mod 4.
- q = 2, n = 2: xy (Arf 0) and x² + xy + y² (Arf 1) are the two nonsingular binary forms.

*Prerequisites.*

- `mathlib:char_dvd_card_solutions_of_sum_lt`
- `mathlib:FiniteField.isSquare_iff`
- `mathlib:FiniteField.exists_root_sum_quadratic`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/arf-invariant`

*Source:* [Richard Elman, Nikita Karpenko, Alexander Merkurjev, EKM2008](https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf), §13, Proposition 13.2 and Example 13.5, printed pp.61–62; §36 (p.161), consequence of Chevalley–Warning. Defines the discriminant of an even-dimensional nondegenerate form as the class of the centre of its even Clifford algebra (the Arf invariant in characteristic 2), shows binary forms are similar iff their discriminants agree, and records that three-dimensional forms over finite fields are isotropic.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `QuadraticForm.finiteField_classification`. Implementation: unchecked.

<a id="arf-invariant"></a>
#### The Arf invariant

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/arf-invariant` · definition

Let F be a field of characteristic 2 and q a nonsingular quadratic form of dimension 2m on V, with a symplectic basis e_1, f_1, …, e_m, f_m of its (alternating, nondegenerate) polar form b. The Arf invariant is Arf(q) = Σ_i q(e_i)q(f_i) mod ℘(F), where ℘(x) = x² + x; it is independent of the symplectic basis, additive on orthogonal sums, zero on hyperbolic forms, and is the class of the discriminant algebra (the centre of the even Clifford algebra) in Ét₂(F) ≅ F/℘(F). Over 𝔽_{2^k}, F/℘(F) ≅ ℤ/2.

*Hypotheses.*

- char F = 2; q nonsingular of even dimension (polar form nondegenerate).

*Uses.*

- finite-field-quadratic-classification (this packet): classifies nonsingular forms over 𝔽_{2^k}
- Bergström–Faber–Payne §6: distinguishes the split and nonsplit quadric surfaces in characteristic 2

*API.*

- `TauCeti.GeometryOfNumbersPlan.QuadraticForm.arf` (constructor): Arf(q) ∈ F/℘(F) for a nonsingular even-dimensional form in characteristic 2.
- `TauCeti.GeometryOfNumbersPlan.QuadraticForm.arf_eq_of_symplecticBasis` (characterisation): Arf(q) = Σ q(e_i)q(f_i) for every symplectic basis.
- `TauCeti.GeometryOfNumbersPlan.QuadraticForm.arf_orthogonalSum` (simp): Arf(q ⊥ q′) = Arf(q) + Arf(q′).
- `TauCeti.GeometryOfNumbersPlan.QuadraticForm.arf_hyperbolic` (simp): Arf(mH) = 0.
- `TauCeti.GeometryOfNumbersPlan.QuadraticForm.arf_isometry` (functoriality): Isometric forms have equal Arf invariants.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.arf_xy` (degenerate): Arf(xy) = 0 over any field of characteristic 2.
- `TauCeti.GeometryOfNumbersPlan.arf_F2_anisotropic` (computation): Over 𝔽_2, Arf(x² + xy + y²) = 1 ≠ 0.
- `TauCeti.GeometryOfNumbersPlan.arf_F4_split` (non-example): The class depends on the field: over 𝔽_4 = {0, 1, ω, ω²}, ℘(𝔽_4) = {0, 1}, so x² + xy + y² has Arf class 0 and is hyperbolic over 𝔽_4 (though anisotropic over 𝔽_2), while x² + xy + ωy² has Arf class ω ≠ 0 and is anisotropic.

*Proof sketch.*

1. Independence: the centre of C₀(q) is the étale algebra F[x]/(x² + x + Arf(q)), an invariant of q (EKM §13); so Arf is well defined.
2. Additivity follows from C₀ of an orthogonal sum; Arf(H) = 0 since q(e)q(f) = 0.

*Checks.*

- Arf(xy) = 0.
- Over 𝔽_2, Arf(x² + xy + y²) = 1.

*Prerequisites.*

- `mathlib:CliffordAlgebra.even`
- `mathlib:QuadraticMap.polarBilin`
- `mathlib:FiniteField.card`

*Source:* [Richard Elman, Nikita Karpenko, Alexander Merkurjev, EKM2008](https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf), §13, definition of the discriminant and Example 13.5(2), printed pp.61–62. Defines the discriminant as the class of the centre of the even Clifford algebra in Ét₂(F) and computes it in characteristic 2 as Σ a_ib_i modulo ℘(F) for [a_1, b_1] ⊥ ⋯ ⊥ [a_m, b_m], calling it the Arf invariant.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="quadric-surface-classification"></a>
#### Quadric surfaces over a finite field

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/quadric-surface-classification` · theorem

Over 𝔽_q there are exactly three PGL₄(𝔽_q)-orbits of geometrically irreducible quadric surfaces in ℙ³: the cone Q^con ≅ ℙ(1, 1, 2) (rank 3), the nonsplit smooth quadric Q^nsp (rank 4, isomorphic to ℙ¹ × ℙ¹ over 𝔽_{q²} with Frobenius swapping the rulings, Picard rank 1) and the split quadric Q^spl ≅ ℙ¹ × ℙ¹. Their automorphism groups have orders #Aut(Q^con) = q⁷ − q⁶ − q⁵ + q⁴ = #GL₂(𝔽_q)·q³, #Aut(Q^nsp) = 2(q⁶ − q²) = 2#PGL₂(𝔽_{q²}) and #Aut(Q^spl) = 2(q³ − q)² = 2#PGL₂(𝔽_q)².

*Hypotheses.*

- The quadric is geometrically irreducible and reduced: geometric quadratic rank 3 or 4. A nonsplit rank-two binary norm equation is irreducible over 𝔽_q but splits into conjugate planes over 𝔽_{q²}; it is excluded. In characteristic two, quadratic rank here is not the rank of the polar bilinear form.

*Proof sketch.*

1. Finite-field classification, including the regular odd-rank characteristic-two argument, gives the cone q=xz+y² and the two smooth rank-four classes up to scaling. The split class is ℙ¹×ℙ¹; the nonsplit class is its twist with exchanged rulings.
2. For smooth quadrics, the complete hyperplane series identifies geometric automorphisms with (PGL₂×PGL₂)⋊C₂; Frobenius-fixed points give the stated split and nonsplit orders. For the cone, use its weighted model ℙ(1,1,2). The map to PGL₂ on the ruling has kernel z↦αz+f₂(x,y), of order (q−1)q³; multiplying by #PGL₂(𝔽_q)=q(q²−1) yields q⁷−q⁶−q⁵+q⁴. Only this order and exact kernel description are asserted; an isomorphism GL₂⋉𝔽_q³ is not needed.

*Checks.*

- q = 2: #Aut(Q^spl) = 2·36 = 72, #Aut(Q^nsp) = 2·60 = 120, #Aut(Q^con) = 128 − 64 − 32 + 16 = 48 = 6·8.
- For a nonsquare d over odd 𝔽_q, x²−dy² in ℙ³ is irreducible over 𝔽_q but geometrically reducible of rank two, and is not one of the three surfaces. This separates irreducibility from geometric irreducibility.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-field-quadratic-classification`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/arf-invariant`

*Source:* [Jonas Bergström, Carel Faber, Sam Payne, BFP2024](https://arxiv.org/pdf/2206.07759v2), §6, the classification of quadric surfaces and display (6), pp.9–10 (arXiv:2206.07759v2). The source gives the three geometric types and their automorphism orders. Its irreducibility wording needs the geometric restriction recorded in E203; the cone order is retained without asserting an unsupported semidirect-product isomorphism.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `quadricSurface_orbits`. Implementation: unchecked.

### 2.13 Binary forms: genus characters and imported local normal forms

<a id="binary-form-genus-character"></a>
#### The genus character of a binary quadratic form

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character` · definition

Let d be a fundamental discriminant, d′ a discriminant (d′ ≡ 0, 1 mod 4, possibly a square) and D = dd′. For an integral binary quadratic form Q = [a, b, c] (Q(x, y) = ax² + bxy + cy²) of discriminant b² − 4ac = D, possibly imprimitive; both definite signs are allowed when D < 0, put χ_d(Q) = 0 if gcd(a, b, c, d) > 1, and otherwise χ_d(Q) = χ_d(m) := (d/m), the Kronecker symbol, for any integer m ≠ 0 represented by Q with gcd(m, d) = 1. Here χ_d(m) is Tau Ceti's genus character TauCeti.Multiquadratic.genusCharFun s m for the factorization s of d into distinct prime discriminants, with at most one even factor. The value lies in {0, ±1}.

*Hypotheses.*

- d fundamental (d = 1 allowed, giving the trivial character); Q integral with discriminant dd′.
- The form carrier and proper equivalence are those of IntegralLattices Layer B (milestones B1–B2) for the binary lattice with polar Gram [[2a, b], [b, 2c]]; no second carrier is introduced.
- D ≠ 0 and d′ = D/d is 0 or 1 modulo 4. Negative definite forms are admitted so that negation is an operation on the domain.

*Uses.*

- Duke–Imamoḡlu–Tóth, Geometric invariants for real quadratic fields, §9, pp.977–978 (routed items PAPER-DUKE-IMAMOGLU-TOTH-16/101–102): the twisted traces and cycle integrals are weighted by χ_d(Q) for forms of discriminant dd′, possibly imprimitive or of square discriminant
- MultiquadraticPartII RQ.3, formCharacter-eq-idealCharacter: compares χ_δ on forms with the narrow ideal-class genus character for fundamental D
- MetaplecticAutomorphicForms MP.7 (quadratic-root Weyl sums, cycle unfolding): the Kohnen–Zagier twisted traces sum χ_d(Q) over Γ-classes
- Bruinier–Ehlen–Yang, §7.1: the twisted special divisors Z_Δ(m) are weighted by χ_Δ

*API.*

- `TauCeti.GeometryOfNumbersPlan.BinaryForm.genusChar` (constructor): χ_d(Q) ∈ ℤ for d fundamental (including 1), disc Q = dd′ ≠ 0 and d′ ≡ 0 or 1 mod 4, with either definite sign admitted.
- `TauCeti.GeometryOfNumbersPlan.BinaryForm.genusChar_eq_zero_iff` (characterisation): χ_d(Q) = 0 iff gcd(a, b, c, d) > 1.
- `TauCeti.GeometryOfNumbersPlan.BinaryForm.genusChar_of_represents` (characterisation): If Q represents m with gcd(m, d) = 1 then χ_d(Q) = genusCharFun s m = (d/m).
- `TauCeti.GeometryOfNumbersPlan.BinaryForm.genusChar_mem` (other): χ_d(Q) ∈ {−1, 0, 1}.
- `TauCeti.GeometryOfNumbersPlan.BinaryForm.genusChar_one` (simp): For d = 1, χ_1(Q) = 1 for every Q.
- `TauCeti.GeometryOfNumbersPlan.BinaryForm.genusChar_smul` (simp): χ_d(nQ) = χ_d(n)·χ_d(Q) for every integer n ≠ 0 (both sides vanish if gcd(n, d) > 1).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.genusChar_sum_two_squares` (computation): genusChar (−4) [1, 0, 1] = 1.
- `TauCeti.GeometryOfNumbersPlan.genusChar_imprimitive_zero` (degenerate): For d = −3 and the imprimitive form Q = [3, 3, 3] of discriminant −27 = (−3)·9, genusChar (−3) Q = 0 because gcd(3, 3, 3, −3) = 3, while the primitive form [1, 1, 7] of the same discriminant has genusChar (−3) = 1.
- `TauCeti.GeometryOfNumbersPlan.genusChar_nonprincipal` (computation): genusChar 5 [2, 1, 2] = −1 and genusChar 5 [1, 1, 4] = 1 (D = −15), so χ_5 separates the two genera of discriminant −15.
- `TauCeti.GeometryOfNumbersPlan.genusChar_not_legendre_of_coeff` (non-example): The value is not (d/a) for the leading coefficient when a is not coprime to d: for Q = [5, 5, 2] of discriminant −15, (5/5) = 0 but Q represents 2 and χ_5(Q) = −1.

*Proof sketch.*

1. For each prime p dividing d choose one of (1,0), (0,1), (1,1) with Q-value nonzero modulo p; otherwise a,c,a+b+c would all vanish modulo p. Choose a single pair (x,y) meeting these choices by CRT. Its value is coprime to d. Perturb the pair by multiples of the product of those primes if necessary to make the value nonzero; a nonzero binary polynomial cannot vanish on the entire resulting integer grid.
2. Use binary-form-genus-character-invariance, with GKZ’s quotient-discriminant condition, to prove independence of the represented value.

*Checks.*

- d = −4, Q = x² + y² (D = −4): χ_{−4}(Q) = χ_{−4}(1) = 1.
- d = −4, d′ = 4 (a square), Q = 2x² + 2y² (D = −16): gcd(2, 0, 2, −4) = 2 > 1, so χ_{−4}(Q) = 0, while x² + 4y² (also D = −16) has χ_{−4} = 1.
- d = 5, d′ = −3, D = −15, Q = 2x² + xy + 2y²: Q represents 2, and (5/2) = −1, so χ_5(Q) = −1, while the principal form x² + xy + 4y² has χ_5 = 1.

*Prerequisites.*

- `tauceti:TauCeti.Multiquadratic.genusCharFun`
- `tauceti:QuadraticMap.Represents`
- `mathlib:jacobiSym`
- `tauceti:TauCeti.Multiquadratic.genusCharFun_eq_zero_iff`
- `tauceti:TauCeti.Multiquadratic.genusCharFun_eq_one_or_eq_neg_one`
- `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`

*Current upstream contracts.*

- B1–B2 supply integral binary forms, proper substitutions and the primitive proper-form/ideal-class correspondence for nonsquare discriminants. GN.2 adds genus-character evaluation on this existing carrier. [Upstream](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md).

*Source:* [Benedict Gross, Winfried Kohnen, Don Zagier, GKZ1987](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01458081/fulltext.pdf), Chapter I §2, Proposition 1 and proof, printed pp.508–510; specialize level N = 1.. Defines the generalized genus character, including d′ ≡ 0 or 1 mod 4, and proves independence from the represented integer; imprimitive forms and scaling are included. BEY Definition 7.1, published pp.752–753, gives its trace-zero-matrix application.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="binary-form-genus-character-invariance"></a>
#### Well-definedness and invariance of the binary genus character

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character-invariance` · theorem

In the setting of binary-form-genus-character: (a) χ_d(Q) does not depend on the represented integer m coprime to d; (b) χ_d(Q ∘ g) = χ_d(Q) for every g ∈ GL₂(ℤ), in particular for proper (SL₂(ℤ)) equivalence; (c) χ_d(−Q) = sgn(d)·χ_d(Q); (d) if D = dd′ with d′ also fundamental then χ_d(Q) = χ_{d′}(Q) whenever both are nonzero and Q is primitive; (e) for p | d and Q with gcd(a, b, c, d) = 1, the p-part of χ_d(Q) is (a, d)_p if p ∤ a and (c, d)_p if p ∤ c (Hilbert symbols), so χ_d(Q) = ∏_p χ_{d,p}(Q) with the local characters of local-genus-character.

*Hypotheses.*

- d fundamental (1 allowed), disc Q = dd′ ≠ 0, d′ ≡ 0 or 1 mod 4; both signs of a definite form are in the domain. In (d), both factors d,d′ are fundamental.

*Proof sketch.*

1. (a) Use GKZ I.2 Proposition 1 at level one. At an odd prime-discriminant factor of d, choose a represented unit leading coefficient after an integral change of coordinates, then complete the square; all represented units have the same quadratic-residue character. At 2, the quotient d′ being 0 or 1 modulo 4 is needed: GKZ’s residue calculation for the even prime-discriminant factors −4, 8, −8 gives the same character for every represented odd value. Multiply the prime-discriminant characters. The pinned norm-identity lemma only covers fundamental D and cannot replace this dyadic calculation for arbitrary dd′.
2. (b) A unimodular integral substitution Q ∘ g preserves the represented set and coefficient content. This is the congruence action on binary forms, rather than the determinant-twisted conjugation action on trace-zero matrices.
3. (c) Negation replaces each represented value m by −m; the Kronecker character at −1 is sgn(d).
4. (d) Use CRT to choose a represented m coprime to D. For fundamental D and primitive Q, the represented-value norm identity makes χ_D(m)=1, and multiplicativity gives χ_d(m)χ_d′(m)=1.
5. (e) The local computations in (a), with the Hilbert-symbol formulas for the Kronecker factors, give χ_{d,p}(Q). At p|d, one of a,c is a unit: for odd p, divisibility of D forces b divisible if a,c are; for p=2 the discriminant condition forces b even.

*Checks.*

- Over D = −15 the two genera {[1,1,4]} and {[2,1,2]} have χ_{−3} = 1, −1 and χ_5 = 1, −1, with χ_{−3}χ_5 = χ_{−15} = 1 on both.
- For d = 5, d′ = 1, Q = x² + xy − y² (D = 5): χ_5(Q) = 1 = χ_5(−Q).

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character`
- `tauceti:TauCeti.Multiquadratic.genusCharFun_mul_right`
- `mathlib:jacobiSym.quadratic_reciprocity`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-genus-character`

*Source:* [Benedict Gross, Winfried Kohnen, Don Zagier, GKZ1987](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01458081/fulltext.pdf), Chapter I §2, Proposition 1 and proof, pp.508–510 (level N = 1); compare BEY Lemma 7.2, published p.753.. Supports represented-value independence, proper invariance, scaling and the odd/dyadic character calculations. The GL₂(ℤ) invariance follows from equality of represented sets. The BEY local application requires the added dyadic support condition in local-genus-character.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `BinaryForm.genusChar_comp`. Implementation: unchecked.

<a id="local-genus-character"></a>
#### Local genus characters on trace-zero matrices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-genus-character` · definition

Let Δ be a fundamental discriminant (1 allowed), p a prime, and V the trace-zero matrices with Q(λ)=det λ. Write λ=[[b/2,−a],[c,−b/2]], with a,b,c ∈ ℤ_p exactly when λ ∈ L′_p, and D=b²−4ac. If p∤Δ define χ_{Δ,p} as the characteristic function of L′_p, including zero and imprimitive matrices. If p|Δ it is zero unless λ∈L′_p, D∈Δℤ_p, gcd(a,b,c,Δ) is a unit, and, when p=2, D/Δ belongs to 4ℤ₂ ∪ (1+4ℤ₂). On that support define it by (n,Δ)_p for any represented unit n of [a,b,c]. It is well defined, takes values 0,±1, and at p|Δ equals (a,Δ)_p when a is a unit or (c,Δ)_p when c is a unit. For h∈GL₂(ℤ_p), χ_{Δ,p}(hλh⁻¹)=(det h,Δ)_pχ_{Δ,p}(λ). The product on V(𝔸_f) is defined since almost all factors are 1; on a global form with disc=Δd′≠0, d′≡0,1 mod4, it equals the binary genus character.

*Hypotheses.*

- Δ fundamental; V = trace-zero 2×2 rational matrices with Q = det, of signature (1,2); L′ the dual of the integral trace-zero matrices.

*Uses.*

- Bruinier–Ehlen–Yang, §7.1–7.2: χ_Δ is K_Δ-invariant on V(𝔸_f) and twists the special divisors and the theta function
- Khayutin, Appendix B, Remark B.2: χ_p(q) = (u/p) for the local normal form ux² + Ay² at odd p | D

*API.*

- `TauCeti.GeometryOfNumbersPlan.localGenusChar` (constructor): χ_{Δ,p} : V(ℚ_p) → {0, ±1} as defined, using Tau Ceti/QFI Hilbert symbols.
- `TauCeti.GeometryOfNumbersPlan.localGenusChar_of_not_dvd` (simp): For p∤Δ, χ_{Δ,p}=1_{L′_p}, with no discriminant or primitivity test; in particular χ_{Δ,p}(0)=1.
- `TauCeti.GeometryOfNumbersPlan.localGenusChar_of_dvd` (characterisation): For p|Δ, on the stated support including the dyadic quotient-discriminant condition, use (a,Δ)_p or (c,Δ)_p for a unit coefficient; off that support the value is zero.
- `TauCeti.GeometryOfNumbersPlan.localGenusChar_conj` (functoriality): χ_{Δ,p}(hλh^{−1}) = (det h, Δ)_p·χ_{Δ,p}(λ) for h ∈ GL₂(ℤ_p).
- `TauCeti.GeometryOfNumbersPlan.genusChar_eq_prod_localGenusChar` (compatibility): For a global Q with disc=Δd′≠0 and d′≡0,1 mod4, the product of local characters equals χ_Δ(Q).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.localGenusChar_minus_three` (computation): For Δ = −3, p = 3: the matrix of [1, 1, 1] has χ_{−3,3} = 1 and that of [−1, −1, −1] has χ_{−3,3} = (−1, −3)_3 = −1.
- `TauCeti.GeometryOfNumbersPlan.localGenusChar_unit_prime` (degenerate): For Δ=1 the value is 1 for every λ∈L′_p, including 0 and matrices all of whose coefficients are divisible by p; outside L′_p it is 0.
- `TauCeti.GeometryOfNumbersPlan.localGenusChar_det_sign` (characterisation): For h = diag(1, −1) ∈ GL₂(ℤ_p) and p | Δ, χ_{Δ,p}(hλh^{−1}) = (−1, Δ)_p·χ_{Δ,p}(λ).
- `TauCeti.GeometryOfNumbersPlan.localGenusChar_not_on_nonintegral` (non-example): For λ ∉ L′_p (for example a/p, b/p, c/p with p ∤ a) the value is 0, not (a, Δ)_p.
- `TauCeti.GeometryOfNumbersPlan.localGenusChar_dyadic_support` (non-example): For Δ=−4 and p=2, [1,0,2] has D/Δ=2, so the corrected character is zero. Omitting that condition gives inconsistent values: the represented units 1 and 3 have (1,−4)₂=1 and (3,−4)₂=−1.

*Proof sketch.*

1. At p|Δ, apply the local residue calculation of GKZ I.2 Proposition 1. For p=2 it uses precisely the local quotient-discriminant condition D/Δ∈4ℤ₂∪(1+4ℤ₂). Existence of a represented unit follows from the three values a,c,a+b+c; D∈Δℤ_p then guarantees a or c is a unit.
2. At p∤Δ the published definition is the characteristic function of L′_p, with no primitivity requirement. This also covers λ=0. For an adele, λ_p∈L′_p at almost all p, and only finitely many p divide Δ, so the product is finite.
3. For S=[[0,1],[−1,0]], one has (hλh⁻¹)S=(det h)⁻¹h(λS)hᵀ. The congruence preserves represented values and multiplies the resulting binary form by (det h)⁻¹; its Hilbert character equals that of det h. Unit-square multiplication preserves the added dyadic support.

*Checks.*

- Δ = −4, p = 2, λ for [1, 0, 1]: χ_{−4,2} = (1, −4)_2 = 1.
- Δ = −3, p = 3, λ for [1, 1, 1]: χ_{−3,3} = (1, −3)_3 = 1; for [−1, −1, −1], (−1, −3)_3 = −1.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`
- `mathlib:PadicInt`

*Source:* [Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang, BEY2021](https://link.springer.com/content/pdf/10.1007/s00222-021-01038-0.pdf), Published Definition 7.1 and Lemmas 7.2–7.3, pp.752–754; collated with v2 pp.44–45. The dyadic correction uses GKZ I.2 Proposition 1, pp.508–510.. The published definition uses 1_{L′_p} at p∤Δ, correcting the v2 clause. At ramified p the asserted well-definedness needs the extra quotient-discriminant condition at 2; source issue E202 records the counterexample. The conjugation identity is verified directly.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="binary-local-normal-form"></a>
#### Genus characters evaluated through imported binary local normal forms

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-local-normal-form` · theorem

Let Q be a primitive integral positive definite binary form of fundamental discriminant D<0. Import the ℤ_p normal-form classification from IntegralLattices 3C and 3D (and the base packet’s dyadic atomic form), rather than constructing it here. At an odd p|D, write its imported diagonal form as ux²+(D/u)vy² with u,v∈ℤ_p^×; then the p-part of its genus character is χ_{p*}(Q)=(u/p), where p*=(-1)^((p−1)/2)p. This value is independent of the chosen normal-form isometry. At 2 use local-genus-character with its corrected support and the imported even binary constituents.

*Hypotheses.*

- Q primitive, D<0 fundamental; Khayutin Lemma B.1 is used only in this definite setting. IntegralLattices owns the full odd and dyadic normal-form theorems.

*Proof sketch.*

1. Import the normal-form existence and classification from IntegralLattices 3C/3D. Khayutin Lemma B.1 and Remark B.2 identify the same odd-prime coordinates.
2. The diagonal coefficient u is a represented unit, so local-genus-character gives (u,p*)_p=(u/p). Two normal-form choices give the same value by represented-value independence. The dyadic factors are evaluated by local-genus-character, without re-planning the upstream classification.

*Checks.*

- For D=−15, Q=[2,1,2], p=5, the represented unit u=2 gives χ₅(Q)=−1.
- For D=−15, Q=[1,1,4], p=5, u=1 gives χ₅(Q)=1.
- For D=−4, Q=[1,0,1], the dyadic local character equals 1, whereas [1,0,2] is excluded by the support test.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-atomic-form`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-normalized-form`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-genus-character`
- `mathlib:PadicInt`
- `mathlib:legendreSym`
- `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`

*Current upstream contracts.*

- Milestones 3C and 3D: classification and normal forms of odd and dyadic ℤ_p-lattices. GN.2 imports these for binary character evaluation; it does not own another normal-form theory. [Upstream](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md).

*Source:* [Ilya Khayutin, Khayutin2019](https://arxiv.org/pdf/1710.04557v3), arXiv:1710.04557v3, Appendix B.2, Lemma B.1 and Remark B.2, p.109.. Lemma B.1 treats primitive positive definite fundamental-discriminant forms and Remark B.2 evaluates the odd ramified genus factor from a unit coefficient. The normal forms themselves are imported from the current IntegralLattices roadmap.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `binaryGenusChar_of_localNormalForm`. Implementation: unchecked.

<a id="exponent-two-genus-theory"></a>
#### Genus theory when the class group has exponent two

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/exponent-two-genus-theory` · theorem

Let D′ < 0 be a fundamental discriminant with s distinct prime divisors, K = ℚ(√D′) and Cl(O_{D′}) its class group (equal to the narrow class group). The genus characters χ_Δ, for the factorizations D′ = ΔΔ̃ into fundamental discriminants, are exactly the characters of Cl/Cl², and #(Cl/Cl²) = 2^{s−1}. Consequently, if Cl has exponent at most 2 then h(D′) = 2^{s−1}, every character of Cl is a genus character, and the Hilbert class field of K is K(√Δ_1, …, √Δ_{s−1}) for the prime discriminants Δ_i dividing D′ (all but one of them).

*Hypotheses.*

- D′ < 0 fundamental. The binary-form side is binary-form-genus-character through IntegralLattices B2 (forms ↔ classes).

*Proof sketch.*

1. Import Tau Ceti’s principal genus theorem and twoRank_eq_ncard_ramifiedPrimes_sub_one to identify the genus quotient and its order 2^{s−1}. Use IntegralLattices B2 only to translate ideal classes to primitive proper form classes.
2. Exponent at most two means Cl²=1, hence h=2^{s−1} and every class-group character is a genus character. There are 2^{s−1} sign-selected factorizations, not s (BEY’s proof typo is also recorded as PAPER-BRUINIER-EHLEN-YANG-21/E4).
3. Import isGenusField_candidateGenusField and finrank_candidateGenusField_over_candidateGenusFieldBase_eq_two_pow_ncard_ramifiedPrimes at the packet pin. They already supply the multiquadratic genus field, its everywhere-unramified property and degree 2^{s−1}. ClassFieldTheory 13 supplies the Hilbert class field and class-group degree; the genus field is contained in it and equal degrees force equality. No genus-field construction is planned here.

*Checks.*

- D′ = −84 = (−3)(−4)(−7) (s = 3): Cl ≅ (ℤ/2)², h = 4 = 2², and the Hilbert class field of K = ℚ(√−21) is K(√−3, √−7), of degree 4 over K.
- D′ = −23: s = 1, Cl ≅ ℤ/3 has exponent 3 and the conclusion h = 2^0 fails, as it must.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character`
- `tauceti:TauCeti.Multiquadratic.isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one`
- `tauceti:TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one`
- `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`
- `tauceti:TauCeti.Multiquadratic.isGenusField_candidateGenusField`
- `tauceti:TauCeti.Multiquadratic.finrank_candidateGenusField_over_candidateGenusFieldBase_eq_two_pow_ncard_ramifiedPrimes`
- `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`

*Current upstream contracts.*

- B1–B2 supply integral binary forms, proper substitutions and the primitive proper-form/ideal-class correspondence for nonsquare discriminants. GN.2 adds genus-character evaluation on this existing carrier. [Upstream](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md).

*Source:* [Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang, BEY2021](https://link.springer.com/content/pdf/10.1007/s00222-021-01038-0.pdf), Corollary 7.18 and proof, published pp.767–768; arXiv v2 pp.56–57.. Uses that the genus characters are the characters of Cl/Cl², so that a class group of exponent at most 2 has order 2^{s−1}, all its characters are genus characters, and the Hilbert class field is generated by the square roots of the prime discriminants.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `exponentTwo_genusTheory`. Implementation: unchecked.

### 2.14 Local integral classification and spinor norms

<a id="odd-unimodular-unit-representation"></a>
#### Odd unimodular lattices represent units primitively

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/odd-unimodular-unit-representation` · theorem

Let R be a henselian DVR (in particular, a complete DVR) with finite residue field k of odd characteristic and let M be a regular unimodular quadratic R-lattice of rank at least two. Every t∈R^× is represented by a primitive v∈M. In rank one, with generator e of norm u∈R^×, a unit t is represented primitively exactly when t/u is a square in R^×, equivalently a square in k^×. The ℤ_p specialization is imported from IntegralLattices 3C; this node supplies the general henselian-DVR version.

*Hypotheses.*

- R a henselian DVR (complete DVRs are included) with finite residue field of odd characteristic, L a regular unimodular quadratic R-lattice. The ℤ_p specialization is imported from IntegralLattices 3C, rather than owned again.

*Proof sketch.*

1. The reduction M/𝔪M is a nondegenerate quadratic space over the residue field of dimension ≥ 2, so it represents t̄ by a nonzero vector (finite-field-quadratic-classification (a)).
2. A nonzero representing vector has a nonzero partial derivative (the polar form is nondegenerate), so Hensel's lemma lifts the representation to a primitive v ∈ M (Mathlib hensels_lemma for ℤ_ℓ; HenselianLocalRing in general).
3. Rank 1: Q(ae) = a²u.

*Checks.*

- M = ℤ_3² with x² + y²: represents 2 = 1 + 1 and the nonsquare unit 2 primitively.
- Rank 1: ⟨1⟩ over ℤ_3 does not represent 2.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-field-quadratic-classification`
- `mathlib:hensels_lemma`
- `mathlib:HenselianLocalRing`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-discriminant-ideal`

*Source:* [Max Lieblich, Davesh Maulik, Andrew Snowden, LMS2018](https://arxiv.org/pdf/1107.1221), §3.5, proof of Lemma 3.5.2, pp.15–16 (arXiv:1107.1221); the henselian-DVR statement is derived by the same residue-field/Hensel proof.. Proves that a unimodular quadratic lattice over ℤ_ℓ of rank at least two whose reduction represents a unit admits a vector of that norm, by Hensel.

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Lemma 4.5, pp.520–521 (Annals 184). Applies the Lieblich–Maulik–Snowden lemma to find vectors of prescribed unit norm in unimodular ℓ-adic lattices.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `unimodular_represents_unit`. Implementation: unchecked.

<a id="isometry-eigenspace-decomposition"></a>
#### Eigenspaces of an isometry and the Cayley discriminant

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/isometry-eigenspace-decomposition` · theorem

Let (V, b) be a nondegenerate symmetric bilinear space over a field k of characteristic ≠ 2 and φ ∈ O(V) with characteristic polynomial g. (a) For eigenvalues λ, μ of φ with λμ ≠ 1 the (generalized) eigenspaces are orthogonal; V_λ and V_{λ^{−1}} pair perfectly, so for λ ≠ ±1 the sum V_λ ⊕ V_{λ^{−1}} is hyperbolic with discriminant (−1)^r, r = dim V_λ. (b) V = V_{+} ⊥ V_{−} ⊥ V′ orthogonally, where V_± = ker(φ ∓ 1)^N and V′ is the part where φ has no eigenvalue ±1. (c) (Cayley discriminant) If g(1)g(−1) ≠ 0, then dim V is even and det b ≡ g(1)g(−1) mod k^{×2}. (d) If φ is diagonalizable over k, then W = ker(φ² − 1) is nondegenerate, n = dim V − dim W is even and disc W = (−1)^{n/2}disc V.

*Hypotheses.*

- char k ≠ 2; in (a) and (d) eigenvalues in k; (c) needs no splitting.

*Proof sketch.*

1. b(φx, φy) = b(x, y) gives b(V_λ, V_μ) = 0 unless λμ = 1, by applying (φ − λ)^N adjointness.
2. (c) Since 1 + φ is invertible, the Cayley transform ψ = (1 − φ)(1 + φ)^{−1} is skew-adjoint for b, so (x, y) ↦ b(x, ψy) is alternating and nondegenerate, with Gram determinant det(b)·det(ψ) a square (Pfaffian); this gives dim V even and det b ≡ det(1 − φ)det(1 + φ) = g(1)g(−1) modulo squares (Chenevier–Taïbi Corollary 3.6, after Gross–McMullen Proposition A.3).
3. (d) from (a): the reciprocal pairs outside W are hyperbolic.

*Checks.*

- φ = diag(2, 1/2) on the hyperbolic plane: g(1)g(−1) = (−1/2)(9/2) = −9/4 ≡ −1, the determinant of the polar Gram matrix [[0, 1], [1, 0]] modulo squares.
- φ = −1 on ⟨1⟩: excluded from (c) since g(−1) = 0.

*Prerequisites.*

- `mathlib:LinearMap.IsAdjointPair`
- `mathlib:Matrix.charpoly`
- `tauceti:TauCeti.QuadraticMap.orthogonalGroup`

*Source:* [Gaëtan Chenevier, Olivier Taïbi, ChenevierTaibi2020](https://arxiv.org/pdf/1907.08783), Corollary 3.6, p.30 (arXiv:1907.08783). States that for γ ∈ SO(V, q) without eigenvalues ±1 the discriminant of q is Q(1)Q(−1) modulo squares, also attributed to Gross–McMullen Proposition A.3.

*Source:* [Max Lieblich, Davesh Maulik, Andrew Snowden, LMS2018](https://arxiv.org/pdf/1107.1221), §3.5, p.15 (arXiv:1107.1221). Decomposes the space of a semisimple isometry into the ±1 part and reciprocal eigenspace pairs and computes the discriminant of the fixed part.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `discr_eq_charpoly_one_mul_neg_one`. Implementation: unchecked.

<a id="zassenhaus-spinor-norm"></a>
#### Zassenhaus’s formula for the spinor norm

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/zassenhaus-spinor-norm` · theorem

Let k be a field of characteristic ≠ 2, (V, q) nondegenerate and γ ∈ SO(V, q)(k) with characteristic polynomial (X − 1)^a(X + 1)^{2b}Q(X), Q(1)Q(−1) ≠ 0. Then the spinor norm of γ is sn(γ) = disc(q|_{ker(γ+1)^{2b}})·Q(−1) in k^×/k^{×2}.

*Hypotheses.*

- Spinor norm of Tau Ceti/OrthogonalSpinGroups 1D (CliffordAlgebra.spinorNorm), with the reflection normalization θ(τ_v) = [q(v)].

*Proof sketch.*

1. Use the orthogonal primary decomposition V=V_+⊥V_-⊥V′. On V_+, γ is unipotent and a square in SO: in positive odd characteristic its finite odd-order unipotent group gives a square root, and in characteristic zero the finite binomial polynomial gives one. A square has trivial spinor norm. On V_-, write γ=(-1)u with u unipotent; its norm is therefore that of −1, the determinant class of q|V_- because this dimension is even.
2. On the summand V′ with 1+γ invertible, the Cayley/Clifford identity gives θ(γ)=det((1+γ)/2) modulo squares (Chenevier–Taïbi Theorem 3.5). Its dimension is even, so 2^dim V′ is a square and det(1+γ)=Q(−1). Multiplicativity yields the stated formula. This does not assume the eigenvalues split over k.

*Checks.*

- γ = −1 on a 2-dimensional space: sn = disc(q).
- γ = diag(2, 1/2) on the hyperbolic plane (a = b = 0, Q = (X − 2)(X − 1/2)): sn = Q(−1) = (−3)(−3/2) = 9/2 ≡ 2, matching θ(τ_{(1,1)}τ_{(1,2)}) = [2] of the base packet's spinor-reflection-product.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/isometry-eigenspace-decomposition`
- `tauceti:CliffordAlgebra.spinorNorm`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/spinor-reflection-product`

*Source:* [Gaëtan Chenevier, Olivier Taïbi, ChenevierTaibi2020](https://arxiv.org/pdf/1907.08783), Section 3.2, Theorem 3.5 (Zassenhaus) and its proof, pp.29–30 (arXiv:1907.08783). States Zassenhaus’s formula for the spinor norm of a special orthogonal element in terms of the discriminant of its (−1)-part and Q(−1), and proves it by orthogonal decomposition and a Clifford-algebra computation.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `spinorNorm_eq_zassenhaus`. Implementation: unchecked.

<a id="regular-quadratic-module-spinor-norm"></a>
#### Integral spinor norms of regular quadratic modules

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/regular-quadratic-module-spinor-norm` · theorem

Let R be a local ring (or any ring with Pic R = 1) with 2 not necessarily invertible, and (V, q) a regular quadratic R-module of rank n ≥ 3: q nondegenerate (perfect polar pairing), or n odd with invertible half-discriminant. Then GSpin(V, q) → SO(V, q) is surjective on R-points with kernel R^×, the Clifford norm ν of a lift defines the spinor norm sn : SO(V, q)(R) → R^×/R^{×2}, and over a DVR R with fraction field K of characteristic ≠ 2 this is the restriction of the field spinor norm: θ(SO(V)(R)) ⊆ R^×K^{×2}/K^{×2}. In particular for a unimodular lattice L_v over the integers of a local field, also at dyadic places, the spinor norms of proper integral isometries are units modulo squares.

*Hypotheses.*

- R local (Zariski-local triviality of G_m-torsors gives the lift); regularity as in Knus IV §3 ('semi-regular' in odd rank).
- Rank n≥3 for the GSpin/SO statement in this node. The fraction-field comparison assumes char K≠2; residue characteristic two remains allowed. Regular odd rank means invertible half-discriminant, rather than perfect polarization.

*Proof sketch.*

1. The sequence 1 → G_m → GSpin → SO → 1 is exact as Zariski sheaves for regular (V, q) (Conrad, Reductive group schemes, Appendix C); H¹_Zar(R, G_m) = Pic R = 1 gives surjectivity on R-points.
2. ν(γ̃) ∈ R^× is well defined modulo squares since the kernel R^× has ν(t) = t².
3. Compatibility with the field spinor norm: a lift over R is a lift over K, and the field spinor norm is the Clifford norm of an even Lipschitz lift (OrthogonalSpinGroups 1D, spinorNorm_vectorRepresentation).

*Checks.*

- R = ℤ_2, V = hyperbolic plane: diag(u, u^{−1}) for u ∈ ℤ_2^× has spinor norm [u], a unit class.
- R = ℤ_2: the rational isometry diag(2, 1/2) of the hyperbolic plane does not preserve ℤ_2e ⊕ ℤ_2f, consistently with its spinor norm [2] not being a unit class.

*Prerequisites.*

- `tauceti:CliffordAlgebra.spinorNorm`
- `mathlib:CliffordAlgebra.even`
- `mathlib:IsLocalRing`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/zassenhaus-spinor-norm`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-discriminant-ideal`

*Source:* [Gaëtan Chenevier, Olivier Taïbi, ChenevierTaibi2020](https://arxiv.org/pdf/1907.08783), Section 3.2, the definitions of non-degenerate and regular quadratic forms over rings, GSpin, Spin and the exact sequences (3.2.1), and the spinor norm over rings, pp.28–29 (arXiv:1907.08783). Introduces regular quadratic modules over a ring, GSpin with its Clifford norm and the spinor norm SO(V, q)(R) → R^×/R^{×2} when Pic R = 1, citing Conrad Appendix C and Knus.

*Source:* [Brian Conrad, ConradRGS](http://math.stanford.edu/~conrad/papers/luminysga3.pdf), Lemma C.2.8, pp.316–317; Clifford norm (C.4.2), p.337; Proposition C.4.6, p.340; (C.4.4), p.343; Corollary C.4.10, p.344.. GSpin→SO is a smooth Zariski-locally split Gₘ quotient for regular quadratic modules; the Clifford norm on central scalars is their square. The Spin→SO kernel is μ₂ and its exactness is interpreted in the fppf topology. Pic R=0 turns the Gₘ torsor into a lift on R-points.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `spinorNorm_integral_mem_units`. Implementation: unchecked.

<a id="integral-isometry-charpoly-constraint"></a>
#### Characteristic polynomials of everywhere-integral isometries

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-isometry-charpoly-constraint` · theorem

Let V be a free ℤ-module of rank n with a regular quadratic form q, G = SO(V, q), and P(X) = (X − 1)^a(X + 1)^{2b}Q(X) monic of degree n in ℚ[X] with Q(1)Q(−1) ≠ 0. If for every prime p there is γ_p ∈ G(ℤ_p) with characteristic polynomial P, then |Q(−1)| is a square when b = 0, and |Q(1)| is a square when a = 0.

*Hypotheses.*

- q regular over ℤ (unimodular in even rank, half-discriminant ±1 in odd rank).

*Proof sketch.*

1. For b = 0, Zassenhaus gives sn(γ_p) = Q(−1) mod squares, and regular-quadratic-module-spinor-norm makes it a p-adic unit times a square at every p; so Q(−1) ∈ ℚ^× has even valuation at every prime, i.e. |Q(−1)| is a square.
2. For a = 0 apply the same to −γ_p (which lies in SO when n is even) with the roles of ±1 exchanged.

*Checks.*

- n = 2, V the hyperbolic plane, P = X² − 3X + 1: Q(−1) = 5 is not a square, so P cannot occur at every p; indeed SO(V)(ℤ_p) = {diag(u, u^{−1})} and P has no root in ℤ_p for p inert in ℚ(√5).
- Chenevier–Taïbi remark: for p ≡ 1 mod 4 there is no element of order p in SO_{p−1}(ℚ) since Φ_p(1)Φ_p(−1) = p is not a square.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/zassenhaus-spinor-norm`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/regular-quadratic-module-spinor-norm`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/isometry-eigenspace-decomposition`

*Source:* [Gaëtan Chenevier, Olivier Taïbi, ChenevierTaibi2020](https://arxiv.org/pdf/1907.08783), Proposition 3.7 and its proof, p.30 (arXiv:1907.08783). Proves that if a regular form over ℤ admits local integral special orthogonal elements with characteristic polynomial (X − 1)^a(X + 1)^{2b}Q at every p, then |Q(−1)| (b = 0) or |Q(1)| (a = 0) is a square, by lifting to GSpin and Zassenhaus’s formula.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `abs_eval_neg_one_isSquare_of_forall_integral`. Implementation: unchecked.

<a id="dyadic-unimodular-spinor-image"></a>
#### Local spinor images of unimodular stabilizers at all places

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-unimodular-spinor-image` · theorem

Let K be a nonarchimedean local field with ring of integers R and L a unimodular quadratic R-lattice (regular in the sense of regular-quadratic-module-spinor-norm) of rank n ≥ 3 in V = KL. Then θ(SO(L)) ⊆ R^×K^{×2}/K^{×2}; if moreover K is nondyadic, or L contains a hyperbolic plane over R, equality holds. In particular the adelic spinor norm of an adelic proper isometry is a unit at almost all places (the base packet's spinor-adelic-norm) and the reference groups θ_v(SO(L_v)) are R_v^×K_v^{×2} at every place where L_v is regular of rank ≥ 3 and contains a hyperbolic plane.

*Hypotheses.*

- The general dyadic image for non-split unimodular or non-unimodular lattices is not claimed (Beli's theory of integral spinor norms over dyadic fields); see the gap recorded for it.
- K has characteristic ≠2. This node extends the reference-stabilizer result to finite extensions of ℚ_p; the ℚ_p/ℤ_p specialization and its proper spinor-genus machinery remain IntegralLattices 4C and OrthogonalSpinGroups 3C. Rank-two torus and rank-one adelic quotients are not asserted.

*Proof sketch.*

1. Inclusion for n≥3 follows from regular-quadratic-module-spinor-norm, including dyadic residue characteristic.
2. At odd residue characteristic, the complete-DVR unit-representation theorem gives vectors with arbitrary prescribed unit norms. Reflections in unit-norm vectors are integral; products of two reflections are proper and attain every unit square class. This extends the imported ℤ_p result without duplicating its ownership.
3. If L contains H=Re+Rf with q(xe+yf)=xy, reflections in e+f and e+uf are integral even when 2 is not a unit, because their norms are units. Their product is proper with spinor norm [u], proving equality in the dyadic split case.

*Checks.*

- K = ℚ_2, L = H ⊥ H: θ(SO(L)) = ℤ_2^×ℚ_2^{×2}.
- Rank 1 is excluded: SO(L) is trivial and θ = 1 ≠ R^×K^{×2}/K^{×2}.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/regular-quadratic-module-spinor-norm`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/spinor-unimodular-stabilizer`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/spinor-reflection-product`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/spinor-adelic-norm`

*Source:* [Rainer Schulze-Pillot, SchulzePillot2020](https://arxiv.org/pdf/2008.12847v2), §9.2, Lemma 9.19 and Definition/Lemma 9.20, printed pp.126–127 (arXiv:2008.12847v2). Computes the spinor norm image of the proper stabilizer of a nondyadic unimodular lattice of rank at least two and assembles the adelic spinor norm with unit components at almost all places.

*Source:* [Gaëtan Chenevier, Olivier Taïbi, ChenevierTaibi2020](https://arxiv.org/pdf/1907.08783), Section 3.2, p.29 (arXiv:1907.08783). The spinor norm of an integral element of SO over a local ring is a unit class, through GSpin.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `spinorNorm_range_unimodular`. Implementation: unchecked.

### 2.15 Hermitian forms and lattices over quadratic extensions

<a id="hermitian-trace-form"></a>
#### The trace quadratic form of a hermitian space

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-trace-form` · construction

Let E/F be a quadratic extension of fields of characteristic ≠ 2 with conjugation x ↦ x̄, and (V, h) a hermitian space over E (conjugate-linear in the first variable, h(w, v) = h(v, w)‾). Its trace form is the F-quadratic space (V_F, q_h) with q_h(v) = h(v, v) ∈ F and polar form Tr_{E/F}h(v, w) = h(v, w) + h(w, v), whose diagonal is 2q_h. If h ≅ ⟨a_1, …, a_n⟩ (a_i ∈ F^×) and E = F(√δ), then q_h ≅ ⟨a_1, …, a_n⟩ ⊗ ⟨1, −δ⟩. Jacobson's theorem: two hermitian spaces over E are isometric iff their trace forms are isometric over F. Zhang's convention, linear in the first variable, is h′(v, w) = h(w, v); it has the same trace form.

*Hypotheses.*

- char F ≠ 2; E/F a separable quadratic field extension (the split algebra E = F × F is excluded here).

*Uses.*

- hermitian-space-classification (this packet): reduces local classification and the hermitian Hasse principle to quadratic forms
- Zhang, Weil representation and the arithmetic fundamental lemma, §1.2–§2: the orbits and norm fibres are read on q_h
- Li–Zhang, Kudla–Rapoport cycles, §1.7 and §3: hermitian lattices and their densities are compared with quadratic lattices

*API.*

- `TauCeti.GeometryOfNumbersPlan.HermitianSpace.traceForm` (constructor): q_h : QuadraticForm F V, q_h v = h v v (as an element of F).
- `TauCeti.GeometryOfNumbersPlan.HermitianSpace.traceForm_polar` (simp): polar q_h v w = Tr_{E/F}(h v w).
- `TauCeti.GeometryOfNumbersPlan.HermitianSpace.traceForm_diag` (example): q_{⟨a⟩} = a·N_{E/F}, and q_{h ⊥ h′} = q_h ⊥ q_{h′}.
- `TauCeti.GeometryOfNumbersPlan.HermitianSpace.isometry_iff_traceForm` (characterisation): h ≅ h′ iff q_h ≅ q_{h′} (Jacobson).
- `TauCeti.GeometryOfNumbersPlan.HermitianSpace.traceForm_linearFirst` (compatibility): The form linear in the first variable, h′(v, w) = h(w, v), has the same trace form.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.traceForm_complex_line` (computation): For E = ℂ, F = ℝ, h(x, y) = x̄y on ℂ, the trace form is x² + y² on ℝ².
- `TauCeti.GeometryOfNumbersPlan.traceForm_zero` (degenerate): The zero hermitian space has the zero quadratic space as trace form.
- `TauCeti.GeometryOfNumbersPlan.traceForm_scale_nonnorm` (non-example): For F=ℚ₃, E=ℚ₃(√5) unramified, 3 is not a norm (its valuation is odd). The lines ⟨1⟩ and ⟨3⟩ have trace forms ⟨1,−5⟩ and ⟨3,−15⟩ with the same determinant square class, but Hasse invariants +1 and −1. They are not isometric. The trace form itself, rather than its determinant alone, detects the distinction.

*Proof sketch.*

1. q_h is quadratic: q_h(cv) = N(c)q_h(v) and its polar form is Tr∘h, F-bilinear and symmetric.
2. A hermitian space has an orthogonal basis (char ≠ 2), and q_{⟨a⟩}(x) = a·N_{E/F}(x) = a(x_1² − δx_2²).
3. Jacobson: choose a nonzero-norm vector e in h′ (an orthogonal basis exists). A trace-form isometry shows that q_h represents c=h′(e,e), so split the hermitian line ⟨c⟩ from h and h′. Their trace forms split the common regular binary norm form cN_{E/F}; quadratic Witt cancellation gives isometric trace forms of the complements. Induct on the E-dimension; dimension zero is immediate. Conversely a hermitian isometry preserves the trace form.

*Checks.*

- E = ℂ, F = ℝ, h = ⟨1⟩: q_h = x² + y², positive definite of rank 2.
- h = ⟨1⟩ ⊕ ⟨−1⟩ (hyperbolic) has hyperbolic trace form of rank 4.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`
- `mathlib:QuadraticMap.polarBilin`
- `mathlib:Algebra.trace`
- `tauceti:QuadraticMap.Represents`

*Source:* [Wei Zhang, Zhang2021](https://arxiv.org/pdf/1909.02697), arXiv:1909.02697, §1.2, displays (1.2)–(1.4), physical p.5 (context p.4); no Annals-page collation claimed.. Fixes hermitian forms linear in the first variable over a quadratic extension of local fields of characteristic zero, the quadratic form q(u) = h(u, u) on the underlying F_0-space with bilinear form the trace of h, and the norm fibres V_ξ.

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §5.2, proof of Proposition 5.4, pp.25–26 (arXiv:1511.02212v1). Uses the classification of hermitian spaces over local fields and the Hasse principle for hermitian forms (cited from Jacobowitz and Scharlau §10), which this node reduces to quadratic forms through the trace form.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="hermitian-space-classification"></a>
#### Classification of hermitian spaces over local and global fields

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-space-classification` · theorem

Let E/F be a quadratic extension. (a) If F is a nonarchimedean local field of characteristic 0, hermitian spaces over E are classified by dimension and determinant in F^×/N_{E/F}(E^×); each class (n, d) occurs for n ≥ 1. (b) If F is a number field, hermitian spaces over E are classified by dimension, determinant in F^×/N(E^×) and the signatures at the real places of F that do not split in E; equivalently, two hermitian spaces are isometric iff they are isometric at every place (Landherr's Hasse principle).

*Hypotheses.*

- Characteristic 0; E a field.

*Proof sketch.*

1. (a) By hermitian-trace-form, h ↦ q_h is injective on isometry classes; q_{⟨a_1,…,a_n⟩} = ⟨a_i⟩ ⊗ N_{E/F} has dimension 2n, discriminant δ^n and Hasse invariant determined by ∏a_i mod norms (the Hilbert symbol (∏a_i, δ)); apply the local classification (QuadraticFormInvariants 6D).
2. (b) Local isometry everywhere gives local isometry of the trace forms everywhere, hence a global isometry of q_h (GlobalQuadraticForms Layer 6), hence of h; the invariants (dim, det, signatures) determine all local classes by (a) and by Sylvester at real places.

*Checks.*

- Over ℚ_p with E unramified: ⟨1⟩ and ⟨p⟩ are the two hermitian lines.
- For ℂ/ℝ, ⟨1,1⟩ and ⟨−1,−1⟩ have determinant 1 modulo norms but signatures (2,0) and (0,2), hence are not isometric. N(i)=1, so i cannot turn a positive line into a negative line.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-trace-form`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`

*Source:* [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, KSS2021](https://arxiv.org/pdf/1611.02667v3), Remark 3.10, p.13 (arXiv:1611.02667v3). States that over a quadratic extension of local fields an ε-hermitian space is determined by its dimension and determinant modulo norms.

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), Proof of Proposition 5.4, pp.25–26 (arXiv:1511.02212v1). Applies the local classification by determinant and the Hasse principle for hermitian forms to identify the hermitian space of a positive definite Gram matrix.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `HermitianSpace.isometric_iff_locallyIsometric`. Implementation: unchecked.

<a id="unramified-hermitian-lattice-diagonalization"></a>
#### Hermitian lattices over an unramified extension have orthogonal bases

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/unramified-hermitian-lattice-diagonalization` · theorem

Let E/F be an unramified quadratic extension of nonarchimedean local fields (any residue characteristic) with uniformizer ϖ ∈ F, and L a nondegenerate hermitian O_E-lattice of rank n. Then L has an orthogonal O_E-basis with Gram matrix diag(ϖ^{λ_1}, …, ϖ^{λ_n}), λ_1 ≥ ⋯ ≥ λ_n, and the tuple λ is unique: it is the tuple of base packet hermitian-lattice-invariants (after reordering and shifting by the scale). Equivalently, the space X_n of nondegenerate hermitian matrices in GL_n(E) decomposes as ⊔_{λ ∈ P_n} GL_n(O_E)·ϖ^λ under X ↦ gXḡᵀ, with P_n the nonincreasing integer tuples; the subset whose entries lie in O_E corresponds to λ_n ≥ 0. This integral-entry subset is not the scheme-theoretic GL_n(O_E) condition, which would require unit determinant.

*Hypotheses.*

- E/F unramified, so Tr_{E/F} : O_E → O_F and N_{E/F} : O_E^× → O_F^× are surjective (also when the residue characteristic is 2).

*Proof sketch.*

1. Unramifiedness makes the residue extension separable quadratic; its trace is onto the residue field. Reduction of the integral trace and Nakayama show Tr(O_E)=O_F, and one can choose a unit with unit trace. If a diagonal pairing already realizes the minimal scale valuation m, split it. Otherwise choose x,y with h(x,y)=ϖ^m u and both diagonal entries of strictly larger valuation. Choose a unit t with Tr(overline(t)u) a unit; the cross term makes h(x+ty,x+ty) have valuation m, including residue characteristic two. The resulting Gram entry divides all pairings, so this rank-one summand splits integrally.
2. Normalize the diagonal unit to 1 using surjectivity of the norm on units; induct on the rank.
3. Uniqueness: L^∨/L ≅ ⊕ O_E/ϖ^{λ_i} after scaling, so λ is determined by the invariant factors (base packet dvr-ordered-exponent-uniqueness).

*Checks.*

- n = 1: the lattice O_E e with h(e, e) = ϖ³u is equivalent to ϖ³ (λ = (3)).
- The hermitian matrix [[0, 1], [1, 0]] is GL₂(O_E)-equivalent to diag(1, −1) ~ diag(1, 1): λ = (0, 0).

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/dvr-ordered-exponent-uniqueness`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`

*Source:* [Spencer Leslie, Leslie2019](https://arxiv.org/pdf/1911.07907v3), §3.2, display (3.7), p.26 (arXiv:1911.07907v3). States the decomposition of the hermitian matrices X_n into GL_n(O_E)-orbits of diagonal matrices ϖ^λ, λ nonincreasing, for E/F unramified, citing Jacobowitz.

*Source:* [Chao Li, Wei Zhang, LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, physical pp.8–9 (arXiv:1908.01701v3). Defines the invariants of a hermitian lattice over an unramified extension through L^∨/L and uses the diagonal form.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `HermitianLattice.exists_orthogonal_basis_unramified`. Implementation: unchecked.

<a id="hermitian-norm-ideal"></a>
#### Scale and norm ideals of a local hermitian lattice

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-norm-ideal` · definition

For a hermitian O_E-lattice L in a hermitian space over a quadratic extension E/F of local fields, the scale 𝔰(L) ⊆ E is the O_E-submodule generated by the values h(x, y), x, y ∈ L, and the norm ideal 𝔫(L) ⊆ F is the O_F-submodule generated by the values h(x, x), x ∈ L. Both are isometry invariants with Tr(𝔰(L)) ⊆ 𝔫(L) ⊆ 𝔰(L) ∩ F, and for E/F unramified or of odd residue characteristic 𝔫(L) = 𝔰(L) ∩ F.

*Hypotheses.*

- E/F quadratic, local; L full O_E-lattice; F-valued norm ideal (Lipnowski–Tsimerman write it as an O_{L_v}-ideal; here the O_F-module is primary and O_E·𝔫(L) is its extension).

*Uses.*

- Lipnowski–Tsimerman, Proposition 5.6 and (36), p.26: unimodular lattices with equal determinant and norm ideal are locally equivalent; the norm ideal refines the decomposition of free unimodular lattices
- local-unimodular-hermitian-classification (this packet): the hypothesis in the dyadic ramified case

*API.*

- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.scale` (constructor): 𝔰(L), the O_E-span of h(L, L).
- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.normIdeal` (constructor): 𝔫(L), the O_F-span of {h(x, x) : x ∈ L}.
- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.normIdeal_le_scale` (other): 𝔫(L) ⊆ 𝔰(L) ∩ F and Tr(𝔰(L)) ⊆ 𝔫(L).
- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.normIdeal_eq_of_trace_surjective` (characterisation): If Tr(O_E) = O_F then 𝔫(L) = 𝔰(L) ∩ F.
- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.normIdeal_map` (functoriality): Isometric lattices have equal scale and norm ideals.
- `TauCeti.GeometryOfNumbersPlan.LocalHermitianLattice.normIdeal_extend` (compatibility): The O_E-ideal generated by h(x,x) is normIdeal(L)·O_E, agreeing with Lipnowski–Tsimerman Definition 5.5.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.normIdeal_unit` (computation): For L = O_E with h = ⟨1⟩, normIdeal L = O_F and scale L = O_E.
- `TauCeti.GeometryOfNumbersPlan.normIdeal_dyadic_hyperbolic` (non-example): For E = ℚ_2(i) and the hyperbolic plane O_E e ⊕ O_E f (h(e, f) = 1), normIdeal = 2ℤ_2 although scale ∩ F = ℤ_2.
- `TauCeti.GeometryOfNumbersPlan.normIdeal_zero` (degenerate): The zero lattice has scale 0 and norm ideal 0.

*Proof sketch.*

1. Invariance under isometry is immediate from the definitions.
2. Tr(h(x, y)) = h(x + y, x + y) − h(x, x) − h(y, y) gives Tr(𝔰) ⊆ 𝔫; if the trace O_E → O_F is surjective (unramified or odd), Tr(𝔰) = 𝔰 ∩ F.
3. Lipnowski–Tsimerman generate their norm ideal over O_E. Its relation to this O_F-valued convention is extension of ideals: 𝔫_LT(L)=𝔫(L)O_E. State this adapter explicitly before using determinant/norm-ideal labels from that paper.

*Checks.*

- L = O_E with h = ⟨1⟩: 𝔰 = O_E, 𝔫 = O_F.
- Ramified dyadic E = ℚ_2(i): the lattice O_E² with the hyperbolic Gram [[0, 1], [1, 0]] has 𝔫 = Tr(O_E) = 2ℤ_2 ≠ 𝔰 ∩ F = ℤ_2.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`
- `mathlib:Algebra.trace`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), Definition 5.5, p.26 (arXiv:1511.02212v1). Defines the norm ideal of a local hermitian lattice as generated by the values ⟨m, m⟩.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="local-unimodular-hermitian-classification"></a>
#### Local classification of unimodular hermitian lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-unimodular-hermitian-classification` · theorem

Let E/F be a quadratic extension of nonarchimedean local fields and V a nondegenerate hermitian space over E. If E/F is unramified, or ramified with odd residue characteristic, then any two unimodular hermitian O_E-lattices in V are isometric under U(V). In the ramified dyadic case the same holds for unimodular lattices with equal norm ideals.

*Hypotheses.*

- Unimodular means L^∨ = L for h (base packet hermitian-dual-lattice).

*Proof sketch.*

1. Unramified: unramified-hermitian-lattice-diagonalization with λ = 0 gives an orthonormal basis, so all unimodular lattices are isometric to O_E^n with the standard form.
2. Ramified, odd residue characteristic: Tr(O_E) = O_F since 2 is a unit, so the splitting argument above gives an orthogonal basis with unit diagonal u_i ∈ O_F^×; binary ⟨u, u′⟩ ≅ ⟨1, uu′⟩ by the norm/trace argument, so the lattice is ⟨1, …, 1, det⟩; det mod N(O_E^×) = (O_F^×)² (quadratic-norm-squares (iii)) is determined by det V because N(E^×) ∩ O_F^× = N(O_E^×). Both lattices are thus isometric, and an isometry of lattices extends to an element of U(V).
3. Ramified dyadic: the input is Jacobowitz, Proposition 10.4; recorded as a gap.

*Checks.*

- E/F unramified: O_E^n is the unique unimodular lattice up to isometry in its space.
- Ramified odd: the lattices ⟨1, 1⟩ and ⟨1, u⟩ (u a nonsquare unit) live in spaces of different determinant.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/unramified-hermitian-lattice-diagonalization`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quadratic-norm-squares`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-norm-ideal`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), Definition 5.5, Proposition 5.6 and the paragraph after it, p.26 (arXiv:1511.02212v1). States that unimodular lattices of the same determinant and norm ideal in a local hermitian space are equivalent (from Jacobowitz Proposition 10.4), and that the norm-ideal condition is automatic for unramified extensions and for ramified ones away from 2 (Jacobowitz Theorems 7.1 and 8.2).

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `HermitianLattice.unimodular_isometric`. Implementation: unchecked.

<a id="hermitian-genus"></a>
#### Genus and class set of hermitian lattices over a number field

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-genus` · definition

Let L/K be a quadratic extension of number fields (for Lipnowski–Tsimerman a CM field over its totally real subfield) and (V, h) a hermitian space. Two O_L-lattices M, M′ ⊆ V are in the same genus if M_v ≅ M′_v under U(V)(K_v) at every finite place v of K; the classes in the genus of M are the U(V)(K)-orbits of lattices in it. The class set is in bijection with U(V)(K)\U(V)(𝔸_K^f)/Stab(M̂), by the lattice local-global dictionary.

*Hypotheses.*

- Lattices are projective O_L-modules of full rank (not necessarily free); U(V) is the unitary group of signed-hermitian-space over K.

*Uses.*

- Lipnowski–Tsimerman, (37) and the mass formula (38), pp.26–27: the class set is a double coset space of the finite adelic unitary group; its mass is counted by Siegel’s formula
- GeometryOfNumbersAndQuadraticArithmetic GN.3 (mass and local densities): masses of hermitian genera

*API.*

- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.genus` (constructor): The set of lattices in V locally isometric to M at every finite place.
- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.classSet` (data): The U(V)(K)-orbits of lattices in the genus.
- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.classSetEquivDoubleCoset` (equivalence): classSet M ≃ U(V)(K)\U(V)(𝔸_f)/Stab(M̂), g ↦ the lattice V ∩ g M̂.
- `TauCeti.GeometryOfNumbersPlan.HermitianLattice.genus_eq_of_unimodular` (other): Under the hypotheses of local-unimodular-hermitian-classification at every place, all unimodular lattices of the space form one genus.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.hermitianGenus_self` (degenerate): M lies in its own genus and its class is the identity double coset.
- `TauCeti.GeometryOfNumbersPlan.hermitianGenus_gaussian` (computation): For ℚ(i)/ℚ and V = ℚ(i)² standard, O² and O·(1, 1)/(1+i) ⊕ O·(1, −1)/(1+i) are distinct lattices in one genus and one class.
- `TauCeti.GeometryOfNumbersPlan.hermitianGenus_normIdeal_separates` (non-example): For E=ℚ(i), h=diag(1,−1), let M=O_E² and M′=O_E(1,1)+O_E(1/2,−1/2). Both are integral unimodular lattices in the same rational space. At 2 their Gram matrices are diag(1,−1) and [[0,1],[1,0]]; their norm ideals are ℤ₂ and 2ℤ₂. They are not in the same genus: ambient space and unimodularity alone do not determine genus.

*Proof sketch.*

1. The adelic group acts on lattices through completions (lattice-completion) and the local-global dictionary (lattice-local-global-dictionary); the orbit of M is its genus and the stabilizer is the product of the local stabilizers.

*Checks.*

- For L = ℚ(i), K = ℚ, V = L² with the standard form: M = O·(1, 1)/(1+i) ⊕ O·(1, −1)/(1+i) is unimodular with an orthonormal basis, differs from O², and lies in the genus (indeed the class) of O².

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-local-global-dictionary`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-completion`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`
- `AdelicAlgebraicGroups:AA.1`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §5.3, the bijection (37), pp.26–27 (arXiv:1511.02212v1). Identifies the projective unimodular lattices of a given determinant and norm ideal, up to U_σ, with the double coset space of the finite adelic unitary group by the stabilizer.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="unit-norm-label"></a>
#### Unit-norm labels and the hermitian forms ⟨·,·⟩_σ

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/unit-norm-label` · definition

Let L be a CM field with totally real subfield K, Σ = O_K^{×,+}/N_{L/K}(O_L^×) the finite group of totally positive units modulo norms of units, and ε_σ a chosen representative of σ ∈ Σ (ε_1 = 1). For n≥1, on L^n put ⟨z, w⟩_σ = ε_σ z_1 w̄_1 + Σ_{i≥2} z_i w̄_i (Lipnowski–Tsimerman's convention, linear in the first variable). It is a totally positive definite hermitian form with determinant ε_σ, and the free unimodular O_L-lattices of determinant class σ lie in the space of ⟨·,·⟩_σ.

*Hypotheses.*

- L CM over K; Σ is finite because N(O_L^×) ⊇ (O_K^×)² (Dirichlet's unit theorem gives [O_K^{×}: (O_K^×)²] finite).
- The labelled n-dimensional form requires n≥1; the zero-dimensional form has no nontrivial determinant label.

*Uses.*

- Lipnowski–Tsimerman, Proposition 5.4, p.25: free unimodular lattices are sorted by the label σ of their determinant
- model-ring-positive-involution (this packet): orbit counts n_{L,n} are sums over labels

*API.*

- `TauCeti.GeometryOfNumbersPlan.unitNormLabel` (constructor): Σ = (O_K^{×,+})/(N_{L/K} O_L^×) as a finite group.
- `TauCeti.GeometryOfNumbersPlan.unitNormLabel.form` (data): For n≥1 and a chosen representative ε_σ, the diagonal form ⟨ε_σ,1,…,1⟩ on L^n.
- `TauCeti.GeometryOfNumbersPlan.unitNormLabel.form_det` (characterisation): det⟨·,·⟩_σ = ε_σ, so the determinant class of the space modulo N(L^×) is the image of σ.
- `TauCeti.GeometryOfNumbersPlan.unitNormLabel.form_posDef` (other): ⟨·,·⟩_σ is positive definite at every real place of K.
- `TauCeti.GeometryOfNumbersPlan.unitNormLabel.form_rep_indep` (characterisation): Changing ε_σ by a norm of a unit gives an isometric space.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.unitNormLabel_gaussian` (computation): For L = ℚ(i), Σ is trivial.
- `TauCeti.GeometryOfNumbersPlan.unitNormLabel_one` (degenerate): The identity label uses ε = 1 and ⟨·,·⟩_1 is the standard form.
- `TauCeti.GeometryOfNumbersPlan.unitNormLabel_not_space_det` (non-example): Σ is units modulo norms of units, not the group K^{×,+}/N(L^×) of space determinants: Σ is finite, while K^{×,+}/N(L^×) is infinite (every prime of K inert in L gives a new class).

*Proof sketch.*

1. Σ is a quotient of O_K^{×,+}/(O_K^×)², which is a finite elementary abelian 2-group.
2. ⟨·,·⟩_σ is positive definite at every real place since ε_σ is totally positive; its Gram matrix diag(ε_σ, 1, …, 1) has determinant ε_σ.

*Checks.*

- L = ℚ(i): K = ℚ, O_K^{×,+} = {1}, Σ trivial.
- L = ℚ(√2, i): O_K^{×,+} is generated by (1+√2)² up to sign, and that is N(1+√2), so Σ is trivial too.

*Prerequisites.*

- `mathlib:NumberField.RingOfIntegers`
- `mathlib:Algebra.norm`
- `mathlib:NumberField.InfinitePlace`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-trace-form`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §5.2, first paragraph, p.25 (arXiv:1511.02212v1). Defines Σ as totally positive units modulo norms of units, the representatives ε_σ, the forms ⟨·,·⟩_σ and the unitary groups U_σ.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="free-unimodular-gram-orbits"></a>
#### Positive hermitian unimodular matrices and free unimodular lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/free-unimodular-gram-orbits` · theorem

Let L be a CM field with totally real subfield K and GL_n(O_L)^+ the totally positive definite hermitian matrices in GL_n(O_L). The orbits of GL_n(O_L) on GL_n(O_L)^+ under A ↦ g*Ag correspond bijectively to ⊔_{σ ∈ Σ} {free unimodular O_L-lattices in (L^n, ⟨·,·⟩_σ) of determinant class σ}/U_σ(K), a lattice going to its Gram matrix in any basis. Every class of free unimodular lattices of a given (σ, norm ideal) lies in one genus.

*Hypotheses.*

- Positive definiteness at every real place; free lattices only (projective ones are counted by free-projective-hermitian-comparison).

*Proof sketch.*

1. Given A, the form ⟨Az, w⟩ has determinant det A ∈ O_K^{×,+}, whose class σ_A ∈ Σ is constant on orbits; by hermitian-space-classification it is isometric to ⟨·,·⟩_{σ_A} (same determinant modulo norms, same signatures), and an isometry φ_A carries O_L^n to a free unimodular lattice; independence of φ_A modulo U_σ.
2. Inverse: Gram matrix of a basis of a free unimodular lattice; a change of basis acts by *-conjugation.

*Checks.*

- n = 1: orbits of O_L^× on O_K^{×,+} by u ↦ N(g)u are exactly Σ.
- L = ℚ(i), n = 2: [[2, 1], [1, 1]] = ḡᵀg for g = [[1, 0], [1, 1]], so it lies in the orbit of I_2.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/unit-norm-label`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-space-classification`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-steinitz-class`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-genus`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-unimodular-hermitian-classification`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), Proposition 5.4 with proof, pp.25–26; Proposition 5.6 and (36)–(37), p.26 (arXiv:1511.02212v1). Proves the bijection between *-conjugation orbits of positive unimodular hermitian matrices and free unimodular lattices of each determinant label, through the local classification and the hermitian Hasse principle, and refines it by norm ideals into single genera.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `freeUnimodular_gramOrbitEquiv`. Implementation: unchecked.

<a id="free-projective-hermitian-comparison"></a>
#### Free versus projective unimodular hermitian lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/free-projective-hermitian-comparison` · theorem

Fix a labelled positive hermitian space V_σ and a local norm-ideal profile as in free-unimodular-gram-orbits. The classes of free unimodular O_L-lattices in this fixed space and profile form a subset of the classes of projective unimodular lattices there. A projective lattice is free exactly when its Steinitz class is trivial; consequently the subsets agree when Cl(O_L)=1. For a general projective lattice, there is no chosen global basis or canonical unit Gram determinant: one first fixes the rational hermitian space and then uses its determinant class and local norm ideals.

*Hypotheses.*

- The rank n is positive; the hermitian space and norm-ideal profile are fixed before making the comparison. Class number one is sufficient, not necessary.

*Proof sketch.*

1. Free lattices are projective. A projective lattice is free iff its Steinitz class is trivial (lattice-steinitz-class), which is automatic when Cl(O_L) = 1.

*Checks.*

- L = ℚ(i): Cl = 1, so every unimodular O_L-lattice is free.
- L = ℚ(√−5): the rank-one lattice 𝔭 = (2, 1+√−5) with h = ⟨1/2⟩·N is projective, unimodular for a suitable scaling, and not free.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-steinitz-class`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/free-unimodular-gram-orbits`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-genus`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), Remark 5.7, p.27 (arXiv:1511.02212v1). Notes that the mass-formula side counts projective hermitian lattices, not only free ones, so the free count is bounded by it.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `freeUnimodular_subset_projective`. Implementation: unchecked.

<a id="model-ring-positive-involution"></a>
#### Model rings with positive involution

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/model-ring-positive-involution` · definition

A model ring with positive involution is R_{L,n} = ∏_{i=1}^k M_{n_i}(O_{L_i}) with (M_1, …, M_k)* = (M̄_1ᵀ, …, M̄_kᵀ), for a finite indexed family of CM fields L_i (repetitions allowed) with totally real subfields K_i and positive integers n_i with Σ_i n_i[L_i : ℚ] = 2g. Its quaternionic analogue is M_m(O_D) for a maximal order O_D of a totally definite quaternion algebra D over a totally real field, with (M)* = M̄ᵀ for the canonical involution. The positive symmetric units are R^{×,+} = {a ∈ R^× : a* = a, a totally positive definite}, on which R^× acts by g·a = g*ag; the orbit count n_{L,n} is the number of orbits.

*Hypotheses.*

- Indexed by the simple factors: two factors with isomorphic L_i keep separate central idempotents.

*Uses.*

- ArithmeticStatistics ST.5, model-ring-orbit-count-concentration: large orbit counts force a large imaginary-quadratic block
- Lipnowski–Tsimerman, Conjecture 5.2 and Proposition 5.10: principal polarization counts compared with n_{L,n}

*API.*

- `TauCeti.GeometryOfNumbersPlan.ModelRing` (structure): The data (L_i, n_i) with Σ n_i[L_i:ℚ] = 2g and the ring ∏ M_{n_i}(O_{L_i}) with conjugate-transpose involution.
- `TauCeti.GeometryOfNumbersPlan.ModelRing.posUnits` (data): R^{×,+}, the totally positive definite *-symmetric units.
- `TauCeti.GeometryOfNumbersPlan.ModelRing.orbitCount` (data): n_{L,n} = #(R^×\R^{×,+}).
- `TauCeti.GeometryOfNumbersPlan.ModelRing.orbitCount_prod` (relation): n_{L,n} = ∏_i n_{(L_i),(n_i)}.
- `TauCeti.GeometryOfNumbersPlan.ModelRing.orbit_equiv_lattices` (equivalence): Orbits ≃ ∏_i (free unimodular lattices over O_{L_i} of rank n_i, by label)/unitary groups (free-unimodular-gram-orbits).
- `TauCeti.GeometryOfNumbersPlan.ModelRing.quaternionic` (constructor): M_m(O_D) with M ↦ M̄ᵀ, for O_D a maximal order of a totally definite quaternion algebra.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.modelRing_gaussian_one` (computation): For L = ℚ(i), n = 1, orbitCount = 1.
- `TauCeti.GeometryOfNumbersPlan.modelRing_repeated` (characterisation): For two copies of ℚ(i) with n = (1, 1), orbitCount = 1·1 and the ring has two central idempotents.
- `TauCeti.GeometryOfNumbersPlan.modelRing_not_hermitian_only` (non-example): The involution is conjugate transpose, not transpose: for L = ℚ(i), the unit i is symmetric for transpose but not for conjugation (ī = −i), and is not in posUnits.

*Proof sketch.*

1. The orbit set factors as the product over i of the orbit sets of GL_{n_i}(O_{L_i}) on GL_{n_i}(O_{L_i})^+, each described by free-unimodular-gram-orbits.

*Checks.*

- k = 1, L = ℚ(i), n = 1: R = ℤ[i] with complex conjugation; R^{×,+} = {1}, one orbit.
- Repetition: two factors ℚ(i) give R = ℤ[i] × ℤ[i], with orbit set the product.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/free-unimodular-gram-orbits`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternion-order`
- `mathlib:Matrix.det`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), Definition 5.1 and the paragraph after it, p.24 (arXiv:1511.02212v1). Defines model rings with positive involution as products of matrix rings over rings of integers of CM fields with conjugate-transpose involution, and relates principal polarizations to orbits on positive symmetric units.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

### 2.16 Stable lattices of a semisimple endomorphism

<a id="local-monogenic-order"></a>
#### Local monogenic orders and their lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-monogenic-order` · definition

Let f ∈ ℤ_ℓ[x] be monic irreducible with separable root field F = ℚ_ℓ[x]/(f), R = ℤ_ℓ[x]/(f) ⊆ O_F the monogenic order and δ = v_ℓ(disc f). An R-lattice of rank n is a full ℤ_ℓ-lattice in F^n stable under R. Its O_F-saturation is O_F·M. By Euler's lemma the trace dual of R is f′(θ)^{−1}R, so R ⊆ O_F ⊆ R^∨ = f′(θ)^{−1}R and [R^∨ : R] = ℓ^δ; the conductor 𝔣 = {x : xO_F ⊆ R} satisfies 𝔣·𝔡_{O_F} = f′(θ)O_F.

*Hypotheses.*

- ℓ prime; F a field (f irreducible); R need not be Dedekind and R-lattices need not be free.
- For the different/conductor identity, O_F is the integral closure of ℤ_ℓ in F and F/ℚ_ℓ is finite separable; f is the monic minimal polynomial of the integral generator θ.

*Uses.*

- Lipnowski–Tsimerman §3.1.2–3.2.1, pp.7–13: isotypic γ-stable lattices are R-lattices for R = ℤ_ℓ[γ]; their orbits and stabilizers are bounded through δ
- AbelianSchemesAndArithmeticModuliPartII F4, adelic-stabilizers: local stabilizer and orbit bounds in an isogeny class

*API.*

- `TauCeti.GeometryOfNumbersPlan.MonogenicOrder` (constructor): R = ℤ_ℓ[x]/(f) inside O_F for monic irreducible f.
- `TauCeti.GeometryOfNumbersPlan.MonogenicOrder.saturation` (data): M ↦ O_F·M on R-lattices in F^n.
- `TauCeti.GeometryOfNumbersPlan.MonogenicOrder.traceDual_eq` (characterisation): R^∨ = f′(θ)^{−1}R (Mathlib traceForm_dualSubmodule_adjoin).
- `TauCeti.GeometryOfNumbersPlan.MonogenicOrder.index_traceDual` (example): #(R^∨/R) = ℓ^{v_ℓ(disc f)}.
- `TauCeti.GeometryOfNumbersPlan.MonogenicOrder.conductor_mul_different` (compatibility): 𝔣·𝔡 = f′(θ)O_F (Mathlib conductor_mul_differentIdeal).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.monogenic_maximal` (degenerate): For f = x² + 1 over ℤ_3, R = O_F, the conductor is O_F and every R-lattice is O_F-free.
- `TauCeti.GeometryOfNumbersPlan.monogenic_index_two` (computation): For f = x² + 4 over ℤ_2 (θ = 2i), [O_F : R] = 2 and v_2(disc f) = 4 = 2·v_2([O_F : R]) + v_2(disc O_F) = 2 + 2.
- `TauCeti.GeometryOfNumbersPlan.monogenic_nonfree` (non-example): For R = ℤ_2[2i] the R-lattice O_F = ℤ_2[i] is not free over R (it needs two generators over the local ring R).

*Proof sketch.*

1. Euler's lemma is Mathlib's traceForm_dualSubmodule_adjoin; the conductor-different identity is conductor_mul_differentIdeal; disc f = ±N(f′(θ)).

*Checks.*

- f = x² + 1 over ℤ_3: R = O_F, δ = 0.
- f = x² + 4 over ℤ_2: R = ℤ_2[2i] has index 2 in O_F = ℤ_2[i], and δ = v_2(−16) = 4.

*Prerequisites.*

- `mathlib:traceForm_dualSubmodule_adjoin`
- `mathlib:conductor_mul_differentIdeal`
- `mathlib:Submodule.IsLattice`
- `mathlib:PadicInt`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §3.1.2, p.7 and §3.2.1, pp.11–12 (arXiv:1511.02212v1). Works with R = ℤ_ℓ[x]/(f), its fraction field F, R-lattices in F^n, the saturation M ↦ MO_F, and R^∨/R ≅ R/f′R of size governed by δ = v_ℓ(disc R).

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="normalized-lattice-sandwich"></a>
#### Normalized orbit representatives of R-lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/normalized-lattice-sandwich` · theorem

In the setting of local-monogenic-order, every R-lattice M ⊆ F^n is GL_n(F)-equivalent to a lattice M′ with R^n ⊆ M′ ⊆ O_F^n; then #(M′/R^n) ≤ #(O_F/R)^n ≤ ℓ^{δn}. If moreover γ-stable lattices for a semisimple γ with characteristic polynomial f^n are identified with R-lattices, the GL_n(F)-orbits of γ-stable lattices are represented by sublattices of colength at most δn in O_F^n.

*Hypotheses.*

- F a field; GL_n(F) acts on F^n; O_F^n is the unique saturated lattice up to GL_n(F).

*Proof sketch.*

1. GL_n(F) acts transitively on O_F-lattices, so move O_F·M to O_F^n. Choose m_i ∈ M forming an O_F-basis of O_F^n (Nakayama on M → O_F^n/𝔪O_F^n), write m_i = Ae_i with A ∈ GL_n(O_F) and replace M by A^{−1}M ⊇ R^n.
2. O_F^n/R^n injects into (R^∨/R)^n, of size ℓ^{δn}.

*Checks.*

- n = 1: every R-lattice M ⊆ F is F^×-equivalent to an R-module M′ with R ⊆ M′ ⊆ O_F, for example R or O_F itself.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-monogenic-order`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-index-ideal`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §3.1.2, p.7 (arXiv:1511.02212v1). Moves any R-lattice by GL_n(F) into the sandwich R^n ⊆ M′ ⊆ O_F^n and bounds the colength by the discriminant valuation.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `MonogenicOrder.exists_sandwich`. Implementation: unchecked.

<a id="stable-lattice-flag-fiber"></a>
#### Stable lattices with prescribed flag quotients

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/stable-lattice-flag-fiber` · theorem

Let γ be a semisimple endomorphism of a finite-dimensional ℚ_ℓ-space V with a γ-stable subspace V_1, π : V → V/V_1, and fix γ-stable lattices U_1 ⊆ V_1 and U_2 ⊆ V/V_1. For a γ-equivariant projection p : V → V_1, the assignment L ↦ φ_L (u ↦ p(any lift of u to L) mod U_1) is a well-defined map from γ-stable lattices L with L ∩ V_1 = U_1 and π(L) = U_2 to Hom_{ℤ_ℓ[γ]}(U_2, V_1/U_1)/Hom_{ℤ_ℓ[γ]}(U_2, V_1), independent of p; its fibres lie in single orbits of the subgroup of the centralizer of γ acting identically on V₁ and V/V₁.

*Hypotheses.*

- γ semisimple, so γ-equivariant projections onto V_1 exist.

*Proof sketch.*

1. Two lifts of u differ by an element of L ∩ V_1 = U_1; two projections differ by a ℤ_ℓ[γ]-map U_2 → V_1, which is quotiented out.
2. If φ_{L_1} = φ_{L_2}, write V = V_1 ⊕ ker p_2 = V_1 ⊕ ker p_1; the map that is the identity on V_1 and sends b ∈ ker p_2 to T(πb) + (π|ker p_1)^{−1}(πb) commutes with γ, is unipotent, and carries L_2 to L_1 (Lipnowski–Tsimerman Lemma 3.1).

*Checks.*

- V_1 = V: the fibre is a single lattice.
- γ = identity on ℚ_ℓ², V_1 = ℚ_ℓe_1, U_i = ℤ_ℓ: the lattices are ℤ_ℓ(e_2 + te_1) + ℤ_ℓe_1 with t ∈ ℚ_ℓ/ℤ_ℓ, all in one unipotent orbit.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-monogenic-order`
- `mathlib:Submodule.IsLattice`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §3.1.3 and Lemma 3.1 with proof, pp.7–8 (arXiv:1511.02212v1). Defines φ_L from a γ-equivariant projection, shows it is well defined modulo maps into V_1, and proves that its fibres differ by a unipotent element of the centralizer.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `stableLattice_flagFiber_orbit`. Implementation: unchecked.

<a id="finite-dvr-determinant-index"></a>
#### Index of a lattice under a stable endomorphism

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-dvr-determinant-index` · theorem

Let O be a DVR with finite residue field of size q, valuation v, fraction field K, and T a free O-lattice spanning a finite-dimensional K-space W. If F ∈ GL_K(W) and F(T) ⊆ T, then T/F(T) and F^{−1}(T)/T are finite of cardinality q^{v(det F)}, and F induces an O-linear isomorphism F^{−1}(T)/T ≅ T/F(T). This includes rank 0 and v(det F) = 0.

*Hypotheses.*

- Finite residue field; F invertible on W.

*Proof sketch.*

1. The index ideal [T : F(T)]_O is (det F) (lattice-index-ideal, free case); over a DVR its cardinality is q^{v(det F)} (Smith normal form).
2. F restricts to an isomorphism F^{−1}(T) → T carrying T onto F(T).

*Checks.*

- W = K, F = multiplication by π^k: #(T/FT) = q^k.
- F = id: both quotients are 0.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-index-ideal`
- `mathlib:Submodule.exists_smith_normal_form_of_le`
- `mathlib:LinearMap.det`
- `mathlib:IsDiscreteValuationRing`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §3.1.4–3.1.5, pp.9–10 (arXiv:1511.02212v1). Bounds cokernels of the maps F_i = γ*⊗1 − 1⊗γ by determinant valuations, which is this determinant-index statement for an endomorphism preserving a lattice.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `card_quotient_map_eq_pow_det`. Implementation: unchecked.

<a id="isotypic-stabilizer-congruence-bound"></a>
#### Isotypic stabilizers contain a congruence kernel

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/isotypic-stabilizer-congruence-bound` · theorem

In the setting of local-monogenic-order with S = O_F and β = f′(θ): if R^n ⊆ M ⊆ S^n then ker(GL_n(S) → GL_n(S/βS)) ⊆ Stab(M), hence [GL_n(S) : Stab_{GL_n(S)}(M)] ≤ #M_n(S/βS) = ℓ^{n²δ_S} with ℓ^{δ_S} = #(S/βS), and this includes δ_S = 0 where the stabilizer is GL_n(S).

*Hypotheses.*

- This is the isotypic case only; the nonisotypic global exponent of Lipnowski–Tsimerman (20) is a separate (Layer 3) target.

*Proof sketch.*

1. βS ⊆ R by conductor_mul_differentIdeal (β ∈ 𝔣·𝔡 ⊆ 𝔣), so βS^n ⊆ R^n ⊆ M. For g ≡ 1 mod β: (g − 1)M ⊆ βS^n ⊆ M, so gM ⊆ M; apply to g^{−1}.
2. The index of a subgroup containing the kernel is at most the size of the image in GL_n(S/βS) ⊆ M_n(S/βS).

*Checks.*

- δ_S = 0 (R = S, β a unit): Stab(M) = GL_n(S) and the bound is 1.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-monogenic-order`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/normalized-lattice-sandwich`
- `mathlib:conductor_mul_differentIdeal`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §3.2.1, pp.11–13 (arXiv:1511.02212v1). Bounds the depth of the stabilizer of M with R^n ⊆ M ⊆ O_F^n through maps into R^∨/R ≅ R/f′R; the congruence-kernel inclusion is the isotypic step of that bound.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `congruenceKernel_le_stabilizer`. Implementation: unchecked.

<a id="good-prime-lattice-orbit"></a>
#### Unique local orbit of stable lattices at good primes

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/good-prime-lattice-orbit` · theorem

Let γ be semisimple on a finite-dimensional ℚ_ℓ-space V with monic squarefree minimal polynomial f ∈ ℤ_ℓ[T] of unit discriminant. Then R = ℤ_ℓ[γ] is finite étale over ℤ_ℓ and equal to its maximal order S = ∏O_i (O_i the rings of integers of the factors K_i of ℚ_ℓ[T]/(f)); with V = ⊕K_i^{n_i}, every full γ-stable ℤ_ℓ-lattice is ⊕(free O_i-lattices of rank n_i), the centralizer ∏GL_{n_i}(K_i) acts transitively on them, and the stabilizer of one is conjugate to ∏GL_{n_i}(O_i).

*Hypotheses.*

- The discriminant is that of the squarefree minimal polynomial, not of the characteristic polynomial.

*Proof sketch.*

1. Unit discriminant: R is étale, hence normal, hence the maximal order ∏O_i (monogenic-order index ℓ^δ with δ = 0).
2. A γ-stable lattice is an R-module, hence decomposes along the idempotents of R, and each component is a finitely generated torsion-free module over the DVR O_i, hence free.

*Checks.*

- γ = diag(1, 2) on ℚ_3²: f = (T − 1)(T − 2), disc = 1, the stable lattices are ℤ_3a ⊕ ℤ_3b, one orbit under the diagonal torus.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-monogenic-order`
- `mathlib:IsDiscreteValuationRing`
- `mathlib:Module.free_of_finite_type_torsion_free'`

*Source:* [Michael Lipnowski, Jacob Tsimerman, LipnowskiTsimerman2018](https://arxiv.org/pdf/1511.02212v1), §3.1, opening of §3.1 and §3.1.2, p.7 (arXiv:1511.02212v1). Decomposes V_ℓ by the irreducible factors of the minimal polynomial and reduces orbit counting to the isotypic R-lattices; at primes where the discriminant is a unit the colength bound δ is 0, giving a single orbit.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `goodPrime_lattice_unique_orbit`. Implementation: unchecked.

### 2.17 Signed hermitian forms: unitary groups and transfer

<a id="signed-hermitian-space"></a>
#### Signed hermitian spaces, their determinant and unitary group

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space` · definition

An ε-hermitian space over F/F_o is a finite-dimensional F-vector space V with a nondegenerate sesquilinear form h, conjugate-linear in the first variable, with h(w, v) = ε·h(v, w)‾. Its Gram matrix J in a basis satisfies J̄ᵀ = εJ and changes to B̄ᵀJB; det(V) is the class of det J in F^×/N_F, where N_F = N_{F/F_o}(F^×) if F/F_o is quadratic and (F^×)² if F = F_o. The adjoint anti-involution a ↦ ā of End_F(V) is defined by h(av, w) = h(v, āw), and U(V, h) = {a ∈ Aut_F(V) : āa = 1} is the isometry group: a unitary group if F ≠ F_o, a symplectic group if F = F_o and ε = −1, a full orthogonal group if F = F_o and ε = 1. An isometry (V, h) ≅ (V′, h′) induces U(V, h) ≅ U(V′, h′), but not conversely: over a nonarchimedean local quadratic extension of odd residue characteristic, odd-dimensional hermitian spaces have two isometry classes with isomorphic unitary groups.

*Hypotheses.*

- For the definitions, a field of characteristic ≠2 with an involution of order at most two, finite-dimensional V, ε=±1 and a nondegenerate ε-hermitian form, conjugate-linear first.
- The carrier and determinant are imported from the base packet’s signed-hermitian-witt-comparison and signed-hermitian-determinant-comparison. This node supplies the adjoint and unitary-group API. The assertion of exactly two odd-rank unitary isometry classes requires a nonarchimedean local quadratic extension of odd residue characteristic.

*Uses.*

- Kurinczuk–Skodlerack–Stevens §§3.4–3.6: Witt groups, twisting, transfer and self-dual embeddings are all built on these spaces
- signed-hermitian-twist, signed-hermitian-transfer (base packet): the twist a^*(h) and the transfer λ∘h are signed hermitian spaces
- Lipnowski–Tsimerman §5.2 (unitary-group-definite): the unitary group U_σ of a definite hermitian space is U(V, h) over a number field

*API.*

- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace` (structure): Use the base packet’s signed-hermitian space carrier; add the adjoint and unitary-group API here, with no second structure.
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.adjoint` (data): ā, characterized by h(av, w) = h(v, āw).
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.adjoint_unique` (characterisation): Any b with h(av, w) = h(v, bw) for all v, w equals ā.
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.adjoint_comp` (simp): (ab)‾ = b̄ā, 1̄ = 1 and the adjoint is involutive.
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.det` (data): det(V) ∈ F^×/N_F, the class of any Gram determinant.
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.det_orthogonalSum` (simp): det(V ⊕ V′) = det(V)·det(V′).
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.unitaryGroup` (constructor): U(V, h) = {a : āa = 1} as a subgroup of Aut_F(V); equal to the isometries of (V, h).
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.unitaryGroupCongr` (functoriality): An isometry f : (V, h) ≅ (V′, h′) gives U(V, h) ≃* U(V′, h′), a ↦ faf^{−1}, compatible with composition.
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.unitaryGroup_smul` (simp): U(V, αh) = U(V, h) for α ∈ F_o^× (so αh is again ε-hermitian).
- `TauCeti.GeometryOfNumbersPlan.SignedHermitianSpace.unitaryGroup_trivialExt` (compatibility): For F = F_o and ε = 1 the unitary group is Tau Ceti’s QuadraticMap.orthogonalGroup of x ↦ h(x, x)/2 (2 invertible).

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.signedHermitian_hyperbolic_det` (computation): The hyperbolic plane has det = −ε modulo N_F.
- `TauCeti.GeometryOfNumbersPlan.signedHermitian_zero_dim` (degenerate): The zero space is ε-hermitian for both signs, has det = 1 and trivial unitary group.
- `TauCeti.GeometryOfNumbersPlan.unitaryGroup_iso_not_isometric` (non-example): For F/F_o quadratic and α ∈ F_o^× ∖ N_F, the one-dimensional spaces ⟨1⟩ and ⟨α⟩ are not isometric (determinants differ) but U(⟨1⟩) = U(⟨α⟩) = the norm-one group.
- `TauCeti.GeometryOfNumbersPlan.unitaryGroup_symplectic` (compatibility): For F = F_o, ε = −1 and the Gram matrix [[0, 1], [−1, 0]], U(V, h) = SL₂(F) = Sp₂(F).

*Proof sketch.*

1. The adjoint exists and is unique by finite-dimensional duality: v ↦ h(v, ·) is a bijective semilinear map V → V^*.
2. Determinant: det(B̄ᵀJB) = N(det B)·det J, so the class modulo N_F is well defined; it is multiplicative for orthogonal sums.
3. Remark 3.11: scaling h by a non-norm α ∈ F_o^× multiplies det by α^n, which for odd n changes the class, while U(V, αh) = U(V, h).

*Checks.*

- The hyperbolic plane has Gram matrix [[0, 1], [ε, 0]] and determinant class −ε.
- F = ℂ, F_o = ℝ (the convention also applies archimedeanly): h(x, y) = x̄y on ℂ is hermitian with h(i, i) = 1.

*Prerequisites.*

- `mathlib:LinearMap.IsAdjointPair`
- `mathlib:LinearMap.IsSymm`
- `mathlib:Matrix.det`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-determinant-comparison`

*Source:* [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, KSS2021](https://arxiv.org/pdf/1611.02667v3), §3.2, p.12; §3.3 and Remark 3.11, pp.13–14 (arXiv:1611.02667v3). §3.2 fixes ε-hermitian spaces with forms linear in the second variable, Gram matrices, the determinant modulo the norm group and the hyperbolic plane; §3.3 defines the adjoint anti-involution and U(V, h) with its three cases; Remark 3.11 records that isometric spaces have isomorphic unitary groups and that the converse fails for odd-dimensional hermitian spaces.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="quadratic-norm-squares"></a>
#### Norms from a quadratic local extension versus squares

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/quadratic-norm-squares` · lemma

Let F/F_o be a quadratic extension of nonarchimedean local fields of odd residue characteristic. (i) −1 ∈ (F^×)² iff −1 ∈ N_{F/F_o}(F^×). (ii) If −1 ∈ (F^×)² then N_{F/F_o}(F^×) = (F^×)² ∩ F_o^×. (iii) N_{F/F_o}(O_F^×) = (O_F^×)² ∩ F_o^×.

*Hypotheses.*

- Odd residue characteristic is used for Hensel's lemma (1 + 𝔭_{F_o} ⊆ (O_{F_o}^×)²) and for the residue-field computation.

*Proof sketch.*

1. (iii) Reduce modulo 1 + 𝔭_{F_o}, which consists of squares, to the residue fields: if F/F_o is unramified both sides are k_{F_o}^× (the norm of finite fields is surjective), and if ramified both sides are (k_{F_o}^×)².
2. (i), (ii) follow from the base packet's odd-local-quadratic-norms, N(F^×) = ((F^×)² ∩ F_o^even) ∪ (−(F^×)² ∩ F_o^odd): if −1 is a square the second set lies in (F^×)², and conversely if −1 is a norm it lies in one of the two sets, the first since val(−1) = 0.

*Checks.*

- F_o = ℚ_3, F = ℚ_3(√−1): −1 is a square in F, and the norms are (F^×)² ∩ ℚ_3^× = {x : val(x) even}.
- F_o = ℚ_3, F = ℚ_3(√3): −1 is not a square in F (F's residue field is 𝔽_3) and −1 is not a norm.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/odd-local-quadratic-norms`
- `mathlib:hensels_lemma`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`

*Source:* [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, KSS2021](https://arxiv.org/pdf/1611.02667v3), Lemma 3.1 (i)–(ii) and equation (3.3) with its proof, p.10 (arXiv:1611.02667v3). States the description of the norm group, derives (i)–(iii) from it, and proves the unit statement (3.3) by Hensel and the residue fields.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `normGroup_eq_sq_inf_of_neg_one_sq`. Implementation: unchecked.

<a id="equivariant-linear-form"></a>
#### Galois-equivariant linear forms on a self-dual extension

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/equivariant-linear-form` · construction

Let (E, β) be a self-dual extension of F/F_o: E = F[β] a field to which the involution of F extends with β̄ = −β, fixed field E_o, n = [E : F]. An F-linear form λ : E → F is Galois-equivariant if λ(x̄) = λ(x)‾. The standard form λ_β is given by λ_β(1) = 1 and λ_β(β^i) = 0 for 1 ≤ i ≤ n − 1; it is Galois-equivariant. Every nonzero F-linear form on E is x ↦ λ_β(γx) for a unique γ ∈ E^×, and it is Galois-equivariant iff γ ∈ E_o^×.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).
- E/F finite with an extending involution; for β = 0 the extension is E = F and λ_β = id.

*Uses.*

- signed-hermitian-transfer (base packet): the transfer is defined for a Galois-equivariant λ
- signed-transfer-image-independent (base packet): λ = λ′(γ·) with γ ∈ E_o^× gives λ_* = λ′_* ∘ γ^*
- standard-transfer-values (this packet): the explicit values are computed for λ_β

*API.*

- `TauCeti.GeometryOfNumbersPlan.SelfDualExtension` (structure): A pair (E, β) with E = F[β] and an involution extending that of F with β̄ = −β.
- `TauCeti.GeometryOfNumbersPlan.SelfDualExtension.stdForm` (constructor): λ_β : E →ₗ[F] F with λ_β(1) = 1, λ_β(β^i) = 0 for 0 < i < n.
- `TauCeti.GeometryOfNumbersPlan.SelfDualExtension.stdForm_equivariant` (characterisation): λ_β(x̄) = λ_β(x)‾.
- `TauCeti.GeometryOfNumbersPlan.SelfDualExtension.exists_unique_eq_stdForm_mul` (universal-property): Every nonzero λ ∈ Hom_F(E, F) is x ↦ λ_β(γx) for a unique γ ∈ E^×.
- `TauCeti.GeometryOfNumbersPlan.SelfDualExtension.equivariant_iff` (characterisation): λ_β(γ·) is Galois-equivariant iff γ̄ = γ, i.e. γ ∈ E_o^×.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.stdForm_trivial` (degenerate): For β = 0 (E = F), stdForm = id and the equivariant forms are the multiplications by γ ∈ F_o^×.
- `TauCeti.GeometryOfNumbersPlan.stdForm_quadratic` (computation): For E = F(β), β² = b ∈ F_o^×, stdForm (x + yβ) = x and the trace Tr_{E/F} = 2·stdForm.
- `TauCeti.GeometryOfNumbersPlan.stdForm_mul_beta_not_equivariant` (non-example): For β≠0 with overline(β)=−β and characteristic ≠2, x↦λ_β(βx) is a nonzero functional which is not equivariant. The test excludes the β=0 identity extension.

*Proof sketch.*

1. The standard functional is nonzero because λ_β(1)=1. For x≠0 choose z with λ_β(z)≠0 and put y=x⁻¹z; then λ_β(xy)≠0. Thus x↦λ_β(x·) is injective and, by equal finite dimensions, an isomorphism E→Hom_F(E,F). This argument does not require a triangular Gram matrix.
2. Equivariance of λ_β follows on the power basis: conjugation sends β^i to (−β)^i, and the coefficients are conjugated.
3. For f_γ(x)=λ_β(γx), one has overline(f_γ(x))=λ_β(overline(γ) overline(x)), whereas f_γ(overline(x))=λ_β(γ overline(x)). Equality for all x is equivalent to λ_β((γ−overline(γ))y)=0 for all y, hence to γ=overline(γ) by nondegeneracy.

*Checks.*

- E = F, β = 0: λ_β = id, γ ∈ F_o^×.
- E = F(β) with β² = b ∈ F_o, β̄ = −β, n = 2: λ_β(x + yβ) = x.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-transfer`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`

*Source:* [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, KSS2021](https://arxiv.org/pdf/1611.02667v3), §3.1, definition of a self-dual extension, p.10; §3.5, first paragraph, p.15 (arXiv:1611.02667v3). Defines self-dual extensions; introduces Galois-equivariant F-linear forms, the standard form λ_β, and the parametrization of all such forms as λ_β(γ·) with γ ∈ E_o^×.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="signed-witt-parity"></a>
#### Even and odd parts of a signed hermitian Witt group

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-witt-parity` · definition

For a finite extension E/E_o of the type above (E = E_o or quadratic) and ε = ±1, W^ε_even(E/E_o) ⊆ W^ε(E/E_o) is the subgroup of Witt classes of even anisotropic dimension; dim_an mod 2 : W^ε(E/E_o) → ℤ/2 is a homomorphism, and if W^ε(E/E_o) is nontrivial its kernel W^ε_even has index 2 and W^ε_odd is the nonidentity coset. The maximal element (the class of maximal anisotropic dimension) is the unique class fixed by all symmetric twists besides 0.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).

*Uses.*

- Kurinczuk–Skodlerack–Stevens, Proposition 3.14, p.15: the transfer is injective on W_even and on W_odd separately
- Skodlerack–Stevens, proof of Theorem 4.4, p.10: the maximal element is the only nonzero class fixed by all symmetric twists

*API.*

- `TauCeti.GeometryOfNumbersPlan.SignedWitt.anisotropicDimParity` (constructor): dim_an mod 2 : W^ε(E/E_o) →+ ZMod 2.
- `TauCeti.GeometryOfNumbersPlan.SignedWitt.even` (data): W^ε_even, the kernel of anisotropicDimParity.
- `TauCeti.GeometryOfNumbersPlan.SignedWitt.odd` (data): W^ε_odd, the preimage of 1.
- `TauCeti.GeometryOfNumbersPlan.SignedWitt.index_even` (characterisation): If W^ε ≠ 0 then [W^ε : W^ε_even] = 2.
- `TauCeti.GeometryOfNumbersPlan.SignedWitt.maximal` (data): The maximal element, the class of maximal anisotropic dimension.
- `TauCeti.GeometryOfNumbersPlan.SignedWitt.maximal_mem_even` (other): The maximal element has even anisotropic dimension: 2 in the unitary case, 4 in the orthogonal case, and 0 in the symplectic case.
- `TauCeti.GeometryOfNumbersPlan.SignedWitt.twist_fixed_iff` (characterisation): A class is fixed by every symmetric twist iff it is 0 or the maximal element.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.signedWitt_unitary_card_even` (computation): In the unitary case #W^ε_even = 2 and #W^ε_odd = 2.
- `TauCeti.GeometryOfNumbersPlan.signedWitt_symplectic` (degenerate): For F = F_o, ε = −1, W^ε = 0, so W_even = W and W_odd is empty.
- `TauCeti.GeometryOfNumbersPlan.signedWitt_hyperbolic_even` (characterisation): The class of n hyperbolic planes is 0 ∈ W_even, whatever n.
- `TauCeti.GeometryOfNumbersPlan.signedWitt_parity_not_integer_dimension` (non-example): Parity is not the integer dimension: the zero space and a hyperbolic plane have dimensions 0 and 2 but the same zero Witt class and parity 0. For every representative V, dim_an(V) ≡ dim(V) mod2. A unitary maximal anisotropic plane is nonzero in W_even, so parity does not detect the zero class.

*Proof sketch.*

1. Anisotropic dimensions add modulo 2 under orthogonal sum because hyperbolic planes are even-dimensional, so dim_an mod 2 is a homomorphism on W^ε.
2. It is surjective whenever a one-dimensional anisotropic space exists, i.e. outside the symplectic case F = F_o, ε = −1 (where W^ε = 0).
3. Maximal element: Kurinczuk–Skodlerack–Stevens Remark 3.9 lists it; Skodlerack–Stevens observe that symmetric twists act transitively on classes of fixed odd anisotropic dimension.

*Checks.*

- Unitary case: W^ε has order 4, W^ε_even = {0, maximal element}, W^ε_odd the two one-dimensional classes.
- Orthogonal case F = F_o: order 16, W_even of order 8.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-witt-comparison`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`

*Source:* [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, KSS2021](https://arxiv.org/pdf/1611.02667v3), §3.4, Remark 3.9 and Proposition 3.12, pp.13–14; §3.5, the paragraph before Proposition 3.14, p.15 (arXiv:1611.02667v3). Describes the maximal anisotropic space, the structure of W^ε, and defines W^ε_even and W^ε_odd as the even subgroup and its nonidentity coset.

*Source:* [Daniel Skodlerack, Shaun Stevens, SkodlerackStevens2020](https://arxiv.org/pdf/1503.08882v3), §4, the paragraph after Definition 4.5, p.9 (arXiv:1503.08882v3). Notes that the only classes fixed by every symmetric twist are 0 and the maximal element, the twists acting transitively on each odd anisotropic dimension.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="skodlerack-stevens-maximal-transfer"></a>
#### Transfer preserves the maximal Witt element (Skodlerack–Stevens)

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/skodlerack-stevens-maximal-transfer` · theorem

Let E/F be a finite extension of nonarchimedean local fields of odd residue characteristic, ρ an involution of F with fixed field F_o (possibly trivial), ρ′ an involution of E extending it, ε = ±1, and λ : E → F a nonzero ρ′-ρ-equivariant F-linear map. Then the transfer Tr_λ : W^ε(E/E_o) → W^ε(F/F_o), ⟨h̃⟩ ↦ ⟨λ ∘ h̃⟩, sends the maximal element X_{ρ′,ε,E} to the maximal element X_{ρ,ε,F}. In addition Tr_λ is bijective when [E : F] is odd, and for ε = +1 and [E : F] = 2 with F = F_o its image has at least four elements, it is injective when E ≠ E_o, and its kernel has exactly four elements, all of anisotropic dimension at most 2, when E = E_o.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).
- This is the input cited as [39, Theorem 4.4] in Kurinczuk–Skodlerack–Stevens Proposition 3.13(ii).

*Proof sketch.*

1. First handle the symplectic case of trivial involutions and ε=−1: both Witt groups are zero and the maximal element is zero. When the involution is nontrivial, a skew scalar identifies the two signs and commutes with transfer. Change of an equivariant functional is a symmetric twist (equivariant-linear-form).
2. The image of the maximal element is fixed by all symmetric twists by elements of F_o^× (they commute with Tr_λ), hence is 0 or the maximal element (signed-witt-parity); it suffices to show it is nonzero.
3. Odd degree: Tr_λ⟨1⟩ has odd anisotropic dimension and its twists generate, so Tr_λ is surjective, hence bijective by counting (Proposition 4.6).
4. Transitivity in towers reduces to quadratic E/F; with λ = Tr_{E/F} compute Gram matrices in the basis 1, α (α a skew-symmetric uniformizer) and choose δ with −det not a square to get a nonzero image (Lemma 4.7); conclude in the remaining quadratic cases.

*Checks.*

- Skodlerack–Stevens Example 4.3: E = ℚ_3(√3, √5), F = ℚ_3(√5), ρ′(√5) = −√5: the transfer kills ⟨√3⟩ but sends ⟨√3⟩ ⊕ ⟨1⟩ (maximal) to the maximal class.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-transfer`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-witt-parity`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-witt-scalar-twist`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-witt-comparison`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/equivariant-linear-form`

*Source:* [Daniel Skodlerack, Shaun Stevens, SkodlerackStevens2020](https://arxiv.org/pdf/1503.08882v3), §4: Theorem 4.1, Definitions 4.2 and 4.5, Example 4.3, Theorem 4.4, Proposition 4.6, Lemma 4.7 and the proof of Theorem 4.4, pp.8–11 (arXiv:1503.08882v3). Theorem 4.4 states that the transfer of the maximal anisotropic class of E is the maximal anisotropic class of F; Proposition 4.6 proves bijectivity in odd degree and Lemma 4.7 the quadratic case with the kernel description; the proof combines them through symmetric twists and transitivity in towers.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `SignedWitt.transfer_maximal`. Implementation: unchecked.

<a id="signed-transfer-determinant"></a>
#### Determinant of a transferred signed hermitian space

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-transfer-determinant` · theorem

Let (E, β) be a self-dual extension of F/F_o, n = [E : F], and λ a nonzero Galois-equivariant F-linear form on E. For every ε-hermitian space (V, h) over E/E_o, det(λ_*V) = det(λ_*⟨1⟩_{+})^{dim_E V}·N_{E/F}(det V) in F^×/N_F. The auxiliary line ⟨1⟩_{+} always has sign +1, regardless of the sign of V. For F = F_o and ε = 1 (quadratic forms, trivial involution) this is Scharlau's determinant formula for the transfer s_*(q).

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).

*Proof sketch.*

1. Choose an F-basis of E and an E-basis of V. Let C be the Gram matrix of (x,y)↦λ(overline(x)y), namely the transferred +1 line. The matrix of the transferred form is a block matrix with baseline determinant (det C)^m and an E-linear Gram change of determinant det_E J. Its F-determinant is N_{E/F}(det_E J), yielding (det C)^mN(det J). This uses restriction-of-scalars determinants and works for alternating forms too.
2. A change of E-basis multiplies det J by a norm, and the corresponding F-basis change multiplies the transferred determinant by a square/norm. Thus the identity descends to F^×/N_F. No one-dimensional alternating line is introduced.

*Checks.*

- n = 1 (E = F, λ = id): det(V) = det(V).
- V hyperbolic over E: λ_*V = nH has det (−ε)^n, and det(λ_*⟨1⟩)²·N(−ε) gives the same class.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/equivariant-linear-form`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-transfer`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-determinant-comparison`

*Source:* [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, KSS2021](https://arxiv.org/pdf/1611.02667v3), Proposition 3.15(i) and the first sentence of its proof, pp.15–16 (arXiv:1611.02667v3). States the determinant of the transfer as det(λ_*⟨1⟩)^{dim V} times the norm of det V and refers to Scharlau, Lemma 5.8, for the quadratic-form analogue, the hermitian case following with extra signs.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `signedHermitianTransfer_det`. Implementation: unchecked.

<a id="standard-transfer-values"></a>
#### The standard transfer of ⟨1⟩ and ⟨β⟩

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/standard-transfer-values` · theorem

Let (E, β) be a self-dual extension of F/F_o with n = [E : F] and λ_β the standard form. In W^1(F/F_o): λ_{β*}⟨1⟩ ≅ ((n−1)/2)H ⊕ ⟨1⟩ if n is odd and ≅ ((n−2)/2)H ⊕ ⟨1⟩ ⊕ ⟨(−1)^{n/2+1}N_{E/F}(β)⟩ if n is even. In W^{−1}(F/F_o): λ_{β*}⟨β⟩ = ⟨(−1)^{(n−1)/2}N_{E/F}(β)⟩ if n is odd and 0 if n is even. Consequently, when F/F_o is quadratic, λ_{β*} is determined on all of W^ε(E/E_o) by these values, signed-transfer-determinant and the classification by dimension and determinant.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).
- The ⟨β⟩ statement requires β≠0. For β=0 one has E=F and only the +1 line ⟨1⟩ and identity transfer are asserted.

*Proof sketch.*

1. Let X^n + b_{n−1}X^{n−1} + ⋯ + b_0 be the minimal polynomial of β. In the basis 1, β, …, β^{n−1} the Gram matrix of λ_{β*}⟨1⟩ has entries (−1)^i λ_β(β^{i+j}), which vanish for 1 ≤ i + j ≤ n − 1; its first row and column are (1, 0, …, 0), and the anti-diagonal below is ±b_0.
2. For n odd, the span of β, …, β^{n−1} has the totally isotropic subspace spanned by β, …, β^{(n−1)/2} of half its dimension, so it is hyperbolic.
3. For n even, split off ⟨1⟩ and a hyperbolic part of dimension n − 2, and read the remaining one-dimensional class from the determinant (signed-transfer-determinant), N_{E/F}(β) = (−1)^n b_0.
4. The ⟨β⟩ case is the same computation for the skew-hermitian form, or follows from (i) and a twist by β.
5. Unitary case: an ε-hermitian space over a quadratic F/F_o is determined by dimension and determinant (Kurinczuk–Skodlerack–Stevens Remark 3.10).

*Checks.*

- n = 1: λ_{β*}⟨1⟩ = ⟨1⟩.
- n = 2, β² = b: λ_{β*}⟨1⟩ = ⟨1⟩ ⊕ ⟨N_{E/F}(β)⟩ = ⟨1⟩ ⊕ ⟨−b⟩, matching the Gram matrix diag(1, −b) of x + yβ ↦ λ_β((x+yβ)‾(x+yβ)).

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-transfer-determinant`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/equivariant-linear-form`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-transfer`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space`

*Source:* [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, KSS2021](https://arxiv.org/pdf/1611.02667v3), Proposition 3.15(ii) with the sketched proof, p.16, and Remark 3.16, p.16 (arXiv:1611.02667v3). Gives the transfer of ⟨1⟩ and ⟨β⟩ under λ_β in both parities, with the Gram matrix in the power basis and the hyperbolic splitting, and remarks that in the unitary case these values determine the standard transfer completely.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `stdTransfer_one`. Implementation: unchecked.

### 2.18 Lattices with Frobenius and Zarhin’s trick

<a id="lambda-2d-lattice"></a>
#### The lattices Λ_{2d} = ⟨2d⟩ ⊕ U

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lambda-2d-lattice` · definition

For an integer d > 0, Λ_{2d} = ℤh ⊕ U with h² = 2d and U the even unimodular hyperbolic plane (basis e, f, e² = f² = 0, e·f = 1); it is an even lattice of signature (2, 1) and rank 3 whose discriminant group is ℤ/2d, generated by h/2d with discriminant quadratic form q(h/2d) = 1/(2d) mod 2ℤ. Its genus contains one class (IntegralLattices 5D, U ⊕ T unique in its genus).

*Hypotheses.*

- Bilinear convention of Tau Ceti IntegralLattice: an integer symmetric bilinear form with x·x ∈ 2ℤ for even lattices.

*Uses.*

- Charles, Proposition 2.9 and Theorem 2.10, pp.500–503: primitive embeddings of rank-two lattices into Λ_{2d} and Λ_{2md} realise the Zarhin trick
- primitive-embedding-congruence-transport (this packet): the target lattices of the transport

*API.*

- `TauCeti.GeometryOfNumbersPlan.lambda2d` (constructor): Λ_{2d} as IntegralLattice.ofGramMatrix of diag(2d) ⊕ [[0, 1], [1, 0]].
- `TauCeti.GeometryOfNumbersPlan.lambda2d_rank` (simp): rank Λ_{2d} = 3 and signature (2, 1).
- `TauCeti.GeometryOfNumbersPlan.lambda2d_discriminantGroup` (characterisation): The discriminant group is cyclic of order 2d, generated by h/2d with q = 1/(2d) mod 2.
- `TauCeti.GeometryOfNumbersPlan.lambda2d_even` (other): Λ_{2d} is even.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.lambda2d_card_disc` (computation): #A(Λ_{2d}) = 2d; for d = 3, #A = 6.
- `TauCeti.GeometryOfNumbersPlan.lambda2_disc` (degenerate): For d = 1 the discriminant group is ℤ/2 with q = 1/2.
- `TauCeti.GeometryOfNumbersPlan.lambda2d_not_unimodular` (non-example): Λ_{2d} is never unimodular for d ≥ 1 (|det| = 2d ≥ 2), unlike U.

*Proof sketch.*

1. Discriminant group: L^⋆ = (1/2d)ℤh ⊕ U, so A = ℤ/2d (Tau Ceti discriminantGroup, natCard_discriminantGroup_eq_natAbs_gramDet: |det| = 2d).

*Checks.*

- d = 1: Λ_2 has discriminant group ℤ/2.

*Prerequisites.*

- `tauceti:TauCeti.IntegralLattice.ofGramMatrix`
- `tauceti:TauCeti.IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet`
- `tauceti:Completed/IntegralLattices#layer-2-duality-and-the-finite-discriminant-group`

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §2.2, the lattices Λ_{2d}, pp.500–501 (Annals 184). Charles defines the rank-three auxiliary lattice ⟨2d⟩⊕U used in the embedding argument. It is not the full primitive cohomology lattice of a degree-2d polarized K3 surface.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="primitive-embedding-congruence-transport"></a>
#### Transport of primitive embeddings into Λ_{2md} (Charles)

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/primitive-embedding-congruence-transport` · theorem

Let d > 0 and S an even positive definite lattice of rank 2 with a primitive embedding S ↪ Λ_{2d}. There are N > 0 and nonzero integers a, b such that for every m > 0 with m ≡ 1 mod N, gcd(m, ab) = 1 and a, b squares modulo m, S admits a primitive embedding into Λ_{2md}. Primitivity of the initial embedding is necessary: in Λ_2 the sublattice spanned by 2h and 2(e + f) is isometric to diag(8, 8) but the abstract lattice diag(8, 8) has no primitive embedding into Λ_2, so the statement for arbitrary rank-2 sublattices fails already at m = 1.

*Hypotheses.*

- d>0; S even, positive definite of rank two, with a primitive initial embedding. The source correction is PAPER-CHARLES-16/E2, also tracked here as E204.

*Proof sketch.*

1. Nikulin's criterion (IntegralLattices 5I, Proposition 1.15.1): a primitive embedding S ↪ Λ exists iff there are subgroups H_S ⊆ A_S, H ⊆ A_Λ, an isometry γ of the restricted forms and a negative definite rank-one even lattice K = ⟨−2t⟩ with q_K ≅ −δ, δ = (q_S ⊕ −q_Λ)|Γ_γ^⊥/Γ_γ.
2. Transport the gluing data along id ⊕ m: A_{Λ_{2d}} → A_{Λ_{2md}}; under m ≡ 1 mod 4dt and the coprimality exclusions, the new quotient is cyclic of order 2tm with generator of norm 1/(2t) + y_0²(m − 1)/(2md).
3. Rescale the generator by λ with λ ≡ 1 mod 4dt and λ²ty_0² + d ≡ 0 mod m, solvable by CRT when −d and t are squares mod m (prime-power-square-lift), giving the cyclic form of ⟨−2tm⟩ and the embedding by 5I.
4. Counterexample: a primitive embedding of S = diag(8, 8) into Λ_2 has complement K = ⟨−2t⟩ and glue group H, which embeds into both A_S ≅ (ℤ/8)² and A_K ≅ ℤ/2t, so H is cyclic of order at most 8; but |H|² = |A_S||A_K|/|A_{Λ_2}| = 64t forces |H| = 8 and t = 1, contradicting H ⊆ ℤ/2.

*Checks.*

- S with Gram [[2, 1], [1, 2dk²]] is primitively embedded in Λ_{2d} (zarhin-explicit-plane), so the theorem applies to it.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lambda-2d-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/prime-power-square-lift`
- `tauceti:Completed/IntegralLattices#layer-4-overlattices-and-isotropic-subgroups`

*Current upstream contracts.*

- Milestone 5I, Nikulin Proposition 1.15.1: primitive embeddings into an arbitrary even target lattice via the graph quotient δ and a complement with discriminant form −δ. Layer 4 overlattice gluing alone does not supply this converse. [Upstream](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md).

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proposition 2.9 and its proof, pp.500–502 (Annals 184). States and proves the congruence transport of embeddings of a rank-two positive lattice into Λ_{2d} through Nikulin’s criterion, the cyclic gluing quotient and a CRT rescaling; the printed statement asks for arbitrary embeddings.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `primitiveEmbedding_lambda_transport`. Implementation: unchecked.

<a id="zarhin-explicit-plane"></a>
#### An explicit primitive positive plane in Λ_{2d}

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/zarhin-explicit-plane` · theorem

For d, k > 0, the vectors v = (0, 1, 1) and w = (k, 1, 0) in the coordinates (h, e, f) of Λ_{2d} span a primitive rank-2 sublattice with Gram matrix [[2, 1], [1, 2dk²]] (determinant 4dk² − 1 > 0, positive definite); l = 2w − v = (2k, 1, −1) is orthogonal to v with l² = 2(4dk² − 1), and the orthogonal complement of ℤv + ℤw is generated by u = (1, 2dk, −2dk) with u² = −2d(4dk² − 1). For odd n and k divisible by |n|, l² ≡ −2 mod n, so gcd(l², n) = 1.

*Hypotheses.*

- Coordinates: x = ah + be + cf has x² = 2da² + 2bc.

*Proof sketch.*

1. Direct computation of the Gram entries with x² = 2da² + 2bc.
2. Primitivity: the ℤ-linear retraction P(x, y, z) = (z, y − z) of Λ_{2d} onto ℤ² satisfies P(av + bw) = (a, b), so ℤv + ℤw is a direct summand.

*Checks.*

- d = k = 1: Gram [[2, 1], [1, 2]] = A₂, l² = 6, u² = −6.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lambda-2d-lattice`

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Theorem 2.10 and its proof, pp.502–503 (Annals 184). Chooses an initial rank-two positive lattice in Λ_{2d} with a norm-two vector and prime-to-n complement to start the Zarhin trick; the coordinates here make that choice explicit.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `lambda2d_explicitPlane`. Implementation: unchecked.

<a id="isotropic-quotient-discriminant"></a>
#### Discriminant of the quotient by a primitive isotropic vector

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/isotropic-quotient-discriminant` · theorem

Let L be a nondegenerate integral ℤ-lattice, v ∈ L primitive and isotropic, and n_v > 0 the generator of (v, L) ⊆ ℤ. Then K = v^⊥/ℤv is a nondegenerate lattice and |disc L| = n_v²·|disc K|.

*Hypotheses.*

- Integral symmetric bilinear lattice (Tau Ceti IntegralLattice).

*Proof sketch.*

1. Choose w ∈ L with (v, w) = n_v and a basis (w, v, e_1, …, e_r) adapted to v^⊥ = ℤv ⊕ span(e_i) (primitive v); in this basis the Gram matrix has the block form with (w, v) = n_v and (v, v) = (v, e_i) = 0, so det = −n_v²·det(e_i·e_j).

*Checks.*

- L = U, v = e: n_v = 1, K = 0, |disc| = 1 = 1·1.
- L = U(2) (Gram [[0, 2], [2, 0]]), v = e: n_v = 2, K = 0, |disc| = 4 = 2².

*Prerequisites.*

- `tauceti:TauCeti.IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet`
- `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Proposition 4.3, p.520 (Annals 184). Relates the discriminant of a lattice and of the quotient of the orthogonal of a primitive isotropic vector by the divisibility n_v, via a basis containing v and w with (v, w) = n_v.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `disc_eq_sq_mul_disc_isotropicQuotient`. Implementation: unchecked.

<a id="prime-power-square-lift"></a>
#### Squares modulo ℓ lift; simultaneous quadratic-residue primes

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/prime-power-square-lift` · lemma

(a) If ℓ is an odd prime, a ∈ ℤ is prime to ℓ and a square mod ℓ, then a is a square mod ℓ^m for every m ≥ 1. (b) If ℓ is prime to N ≥ 1 then ℓ^{2n} ≡ 1 mod N for infinitely many n (all multiples of the order of ℓ²). (c) For finitely many nonzero integers x_1, …, x_s there are infinitely many primes ℓ such that every x_i is a nonzero square mod ℓ.

*Hypotheses.*

- ℓ odd in (a); in (c) the excluded finite set of primes dividing some x_i is removed.

*Proof sketch.*

1. (a) Hensel's lemma for X² − a (derivative 2X is a unit at a nonzero root since ℓ is odd).
2. (b) ℓ ∈ (ℤ/N)^× has finite order (orderOf).
3. (c) Take ℓ ≡ 1 mod 8 and ℓ ≡ 1 mod every odd prime dividing some x_i; by quadratic reciprocity each such prime and −1, 2 are squares mod ℓ, and Dirichlet's theorem (Nat.infinite_setOfPred_prime_and_eq_mod) gives infinitely many such ℓ.

*Checks.*

- a = 2, ℓ = 7: 2 ≡ 3² mod 7, and 2 is a square mod 49 (10² = 100 ≡ 2).
- x = (2, 3, 5): ℓ = 241 ≡ 1 mod 120 makes all three squares.

*Prerequisites.*

- `mathlib:hensels_lemma`
- `mathlib:orderOf`
- `mathlib:legendreSym.quadratic_reciprocity`
- `mathlib:Nat.infinite_setOfPred_prime_and_eq_mod`
- `mathlib:ZMod.exists_sq_eq_neg_one_iff`

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Lemma 4.6, p.521, and the proof of Theorem 1.3, p.523 (Annals 184). Proves that finitely many integers are simultaneously squares modulo infinitely many primes by reciprocity and Dirichlet, and uses that ℓ^{2n} ≡ 1 mod N along a subsequence with squares lifting to prime powers.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `isSquare_mod_pow_of_isSquare_mod`. Implementation: unchecked.

<a id="compatible-system-norm-selection"></a>
#### Selecting a vector of prescribed norm in compatible ℓ-adic systems

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/compatible-system-norm-selection` · theorem

For every sufficiently large odd prime ℓ, let M_ℓ be a unimodular ℤ_ℓ-lattice with semisimple isometry φ_ℓ and common characteristic polynomial P∈ℚ[T]; let the determinant of M_ℓ⊗ℚ_ℓ have fixed rational square class δ. Put N_ℓ=M_ℓ∩ker(φ_ℓ²−1), assumed unimodular, and let a fixed nondegenerate integral lattice A embed isometrically as A_ℓ⊆N_ℓ. Suppose T_ℓ=A_ℓ^⊥∩N_ℓ has positive rank. Write P=(T−1)^a(T+1)^bP_* with P_*(±1)≠0. Fix t∈ℚ^×. For infinitely many odd primes ℓ, all of −1, δ, disc A, t and P_*(1)P_*(−1) are nonzero squares in ℚ_ℓ and all relevant coefficients are integral units. At every such sufficiently large prime, T_ℓ contains a vector γ of norm t. It is primitive in A_ℓ^⊥, and γ/ℓ^n has exact order ℓ^n in the torsion group (M_ℓ/A_ℓ)⊗ℚ_ℓ/ℤ_ℓ. No splitting of the full polynomial P over ℚ_ℓ is required.

*Hypotheses.*

- The finitely many primes dividing the numerators or denominators of the stated rational constants, the denominators of P, or disc A are excluded. Convert each rational square class to a nonzero integer representative for prime-power-square-lift(c).

*Proof sketch.*

1. The orthogonal complement of N_ℓ has no eigenvalues ±1, so the nonsplit Cayley determinant identity makes its determinant square class P_*(1)P_*(−1). Hence disc N_ℓ=δ/(P_*(1)P_*(−1)) modulo squares. A_ℓ is unimodular at these primes and splits integrally, so disc T_ℓ=disc N_ℓ/disc A is a square.
2. Use prime-power-square-lift(c) and Hensel for the finite list of rational square classes; this gives infinitely many allowed ℓ. If rank T_ℓ≥2, apply odd-unimodular-unit-representation. If its rank is one, its Gram coefficient and t are units with the same square class, so it represents t.
3. A vector of unit norm cannot lie in ℓ times its lattice. Integral orthogonal splitting makes A_ℓ^⊥ a direct summand of M_ℓ, so its primitivity remains true in M_ℓ/A_ℓ; division by ℓ^n has exact order ℓ^n.

*Checks.*

- P = (T − 1)^r: N_ℓ = M_ℓ and the statement is odd-unimodular-unit-representation for A^⊥.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/odd-unimodular-unit-representation`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/isometry-eigenspace-decomposition`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/prime-power-square-lift`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-discriminant-ideal`

*Source:* [Max Lieblich, Davesh Maulik, Andrew Snowden, LMS2018](https://arxiv.org/pdf/1107.1221), §3.5, Lemma 3.5.2 and proof, pp.15–16 (arXiv:1107.1221); 3.5.3 is a definition.. Supplies the compatible-lattice norm-selection argument. The present version replaces complete splitting by the Cayley determinant identity and finitely many square-class conditions, so the prime supplier really proves what is requested.

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §4.2, Lemma 4.5 and its proof, pp.520–521 (Annals 184). Applies this selection to construct twisted partners of K3 surfaces with prescribed Brauer classes.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `exists_primitive_norm_of_compatibleSystem`. Implementation: unchecked.

<a id="frobenius-eigenlattice-discriminant-bound"></a>
#### Discriminants of Frobenius eigenlattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/frobenius-eigenlattice-discriminant-bound` · theorem

Fix r > 0, an even w ≥ 0 and a positive prime power q. Let O be the ring of integers of a finite unramified extension of ℚ_ℓ and M a nondegenerate O-lattice of rank r with an endomorphism φ such that (φx, φy) = q^w(x, y), whose characteristic polynomial lies in ℤ[T] with all roots Weil q-integers of weight w and for which q^{w/2} is a semisimple eigenvalue. Let M_0 = M ∩ ker(φ − q^{w/2}). Then v_ℓ(disc M_0) ≤ v_ℓ(disc M) for ℓ > C(r, w, q), and v_ℓ(disc M_0) ≤ C′(r, w, q) + v_ℓ(disc M) for all ℓ.

*Hypotheses.*

- The similitude relation (φx, φy) = q^w(x, y) is a hypothesis; the conclusion bounds valuations only, not a rational square class.
- The common characteristic polynomial has coefficients in ℤ, not merely in the varying coefficient ring O. All Weil roots have complex absolute value q^{w/2}. The eigenvalue q^{w/2} is semisimple; full semisimplicity is not required.

*Proof sketch.*

1. The fixed degree, integer coefficients and Weil absolute values bound every coefficient by a binomial expression, giving a finite set of polynomials. Factor each as g_i=(T−q^{w/2})^{a_i} and h_i with h_i(q^{w/2})≠0. Clear denominators in Bézout identities a_i g_i+b_i h_i=1 using a single positive integer Q. Take C at least the largest prime factor of Q and C′=2r·max_ℓ v_ℓ(Q), an integer independent of ℓ.
2. The similitude relation makes the q^{w/2}-eigenspace orthogonal to the other primary summands: their eigenvalues cannot pair to q^w with q^{w/2}. Semisimplicity of this eigenvalue ensures h_i(φ)M⊆M_0. For ℓ∤Q the Bézout projector is integral and gives M=M_0⊥M_2, so the integral complementary determinant has nonnegative valuation. In general ℓ^{v_ℓ(Q)}M⊆h_i(φ)M⊕g_i(φ)M; its index has length ≤r v_ℓ(Q). The index-square discriminant formula then bounds v_ℓ(disc M_0) by v_ℓ(disc M)+2r v_ℓ(Q).

*Checks.*

- φ = q^{w/2}·id: M_0 = M and the bound is equality.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-discriminant-ideal`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-index-ideal`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/isometry-eigenspace-decomposition`

*Source:* [Max Lieblich, Davesh Maulik, Andrew Snowden, LMS2018](https://arxiv.org/pdf/1107.1221), Proposition 2.1.2 and its proof, pp.3–4 (arXiv:1107.1221). Bounds the discriminant valuation of the q^{w/2}-eigenlattice of a lattice with a Frobenius-type similitude in terms of that of the ambient lattice, uniformly for large ℓ.

*Source:* [François Charles, Charles2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), Proof of Lemma 4.5, p.520 (Annals 184). Uses the Lieblich–Maulik–Snowden bound to control the discriminant of Néron–Severi-type eigenlattices.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `disc_eigenlattice_le`. Implementation: unchecked.

### 2.19 Trace-unimodular lattices, Witt groups and ternary forms

<a id="trace-unimodular-lattice"></a>
#### Trace-even and trace-unimodular lattices over a totally real field

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/trace-unimodular-lattice` · definition

Let F be a totally real number field with different 𝔡_F, (V, Q) a nondegenerate quadratic space over F with bilinear form (x, y), Q(x) = (x, x)/2, and L ⊆ V an O_F-lattice. L is even if Q(L) ⊆ 𝔡_F^{−1}, its trace dual is L′ = {y ∈ V : (y, L) ⊆ 𝔡_F^{−1}} (the ℤ-dual of L for Q_ℤ = Tr_{F/ℚ}∘Q), and L is ℤ-unimodular if L′ = L. U_F is the commutative monoid of even ℤ-unimodular lattices under ⊥ and U_F^+ its subsemigroup of nonzero totally positive definite ones. For even L, L′/L is finite with the quadratic form Q mod 𝔡_F^{−1}; for h in the adelic orthogonal (or GSpin) group, L_h = V ∩ h^{−1}L̂ is in the genus of L and the map h^{−1} on finite completed quotients identifies L′/L with L_h′/L_h (after the canonical completion identifications).

*Hypotheses.*

- F totally real; 𝔡_F^{−1} the inverse different, so Tr_{F/ℚ}(𝔡_F^{−1}) ⊆ ℤ (Mathlib differentIdeal).

*Uses.*

- Li, Algebraicity of higher Green functions, §2.4–2.5: theta functions and special cycles are attached to even ℤ-unimodular O_F-lattices and their adelic translates L_h
- trace-unimodular-existence (this packet): U_F^+ is nonempty

*API.*

- `TauCeti.GeometryOfNumbersPlan.TraceLattice.IsEven` (data): Q(L) ⊆ 𝔡_F^{−1}.
- `TauCeti.GeometryOfNumbersPlan.TraceLattice.traceDual` (constructor): L′ = {y : (y, L) ⊆ 𝔡_F^{−1}}.
- `TauCeti.GeometryOfNumbersPlan.TraceLattice.traceDual_eq` (characterisation): L′ = 𝔡_F^{−1}L^♯, and L′ is the ℤ-dual of L for Tr∘Q.
- `TauCeti.GeometryOfNumbersPlan.TraceLattice.IsZUnimodular` (data): L′ = L.
- `TauCeti.GeometryOfNumbersPlan.TraceLattice.discriminantModule` (constructor): L′/L with Q mod 𝔡_F^{−1}, finite for even L.
- `TauCeti.GeometryOfNumbersPlan.TraceLattice.adelicTranslate` (functoriality): L_h=V∩h⁻¹L̂. Identify L′/L with the finite completed quotient L̂′/L̂, apply h⁻¹ there, and descend to L_h′/L_h. The rational map h⁻¹ on V is not asserted; for successive right actions L_{hh′}=(L_h)_{h′}.
- `TauCeti.GeometryOfNumbersPlan.TraceLattice.zunimodular_int` (compatibility): For F = ℚ, IsEven ∧ IsZUnimodular is Tau Ceti’s even unimodular IntegralLattice.

*Unit tests.*

- `TauCeti.GeometryOfNumbersPlan.traceLattice_E8` (computation): For F = ℚ, E₈ is even and ℤ-unimodular, so U_ℚ^+ ≠ ∅.
- `TauCeti.GeometryOfNumbersPlan.traceLattice_zero` (degenerate): The zero lattice in V = 0 is even and ℤ-unimodular; U_F^+ excludes it.
- `TauCeti.GeometryOfNumbersPlan.traceLattice_not_OF_unimodular` (non-example): For F=ℚ(√5), 𝔡_F=(√5), take L=O_F e⊕O_F f with Q(xe+yf)=xy. Its polar dual is L^♯=L, so it is O_F-unimodular, while its trace dual is 𝔡_F⁻¹L≠L. This is an actual example where the two unimodularity conditions differ.

*Proof sketch.*

1. L′ = 𝔡_F^{−1}·L^♯ with L^♯ the O_F-dual (lattice-discriminant-ideal), so L′ is a lattice and L′ = L can be checked place by place.
2. Q_ℤ(L) ⊆ Tr(𝔡_F^{−1}) ⊆ ℤ for even L; L′ is the ℤ-dual of L for the trace form by nondegeneracy of the trace pairing.
3. L_h is defined through lattice-local-global-dictionary from the completions h^{−1}L̂_v.
4. Because the discriminant quotients are finite, completion identifies L′/L with the direct sum of its local quotients. Apply h⁻¹ to these completed quotients and use local-global descent for L_h. This does not apply h⁻¹ to a rational vector in V.

*Checks.*

- F = ℚ: even ℤ-unimodular means even unimodular in the usual sense (E₈ ∈ U_ℚ^+).
- The hyperbolic plane O_Fe ⊕ 𝔡_F^{−1}f with Q(xe + yf) = xy is in U_F (indefinite).

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-discriminant-ideal`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-local-global-dictionary`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-completion`
- `mathlib:differentIdeal`
- `mathlib:Algebra.trace`

*Source:* [Yingkun Li, Li2023](https://arxiv.org/pdf/2106.13653v2), §2.4, (2.4.1)–(2.4.6), pp.16–17 (arXiv:2106.13653v2). Defines even and integral O-lattices, the dual L′ for the trace form, the lattices L_h = V ∩ h^{−1}L̂ in the genus of L with the identification of discriminant modules, and the monoid U_F with its totally positive part U_F^+.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `API names above`. Implementation: unchecked.

<a id="trace-unimodular-existence"></a>
#### Existence of definite even ℤ-unimodular lattices over a totally real field

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/trace-unimodular-existence` · theorem

For every totally real field F and every choice of signs at the real places there is a nonzero even ℤ-unimodular O_F-lattice of rank 8 that is definite with those signs; in particular U_F^+ ≠ ∅.

*Hypotheses.*

- The rank 8 suffices; ranks divisible by 8 then follow by orthogonal sums.

*Proof sketch.*

1. Choose α ∈ F^× with the prescribed signs (weak approximation) and V = F^8 with Q = α(x_1² + ⋯ + x_8²). At every finite place V_v has dimension 8, square discriminant and trivial Hasse invariant, hence V_v ≅ 4H (QuadraticFormInvariants 6D).
2. Local lattices: at v ∤ 2𝔡_F with α a v-unit, the standard lattice O_v^8 is even and self-dual for the trace pairing (its polar Gram matrix 2α·I is a unit); at the finitely many other v take ⊕_{i=1}^4 (O_ve_i ⊕ 𝔡_v^{−1}f_i) in 4H, which is even with L_v′ = L_v.
3. Glue with lattice-local-global-dictionary (the standard lattice at almost all v); evenness and L′ = L are local (trace-unimodular-lattice).
4. This proof replaces Li's appeal to Chang's existence criterion and to Hecke's theorem that the class of the different is a square; neither is needed.

*Checks.*

- F = ℚ: E₈ (positive signs).
- F = ℚ(√2), signs (+, −): a lattice of signature (8, 0) at one real place and (0, 8) at the other.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/trace-unimodular-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-local-global-dictionary`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`

*Source:* [Yingkun Li, Li2023](https://arxiv.org/pdf/2106.13653v2), Proposition 2.6 and its proof, p.17 (arXiv:2106.13653v2). Proves U_F^+ is nonempty from the existence of definite unimodular O-lattices with prescribed signature (Chang, Satz 1) and Hecke’s theorem that the different is a square in the class group.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `TraceLattice.exists_zunimodular_definite`. Implementation: unchecked.

<a id="witt-group-signature-splitting"></a>
#### Signatures split off the Witt group of a Dedekind ring

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/witt-group-signature-splitting` · theorem

Let R be a Dedekind domain with global fraction field K of characteristic ≠2. Use symmetric bilinear Witt groups and an invertible coefficient module M with +1 involution. If K is nonreal, W(K) is 2-primary torsion of bounded exponent (indeed killed by 8). If K has a real embedding σ, the untwisted signature W(R)→W(ℝ)≅ℤ is onto and splits by ⟨1⟩. For line-valued coefficients, choose a trivialization M⊗K≅K. The comparison W(R;M)[1/2]→W(K)[1/2] is an isomorphism; hence the signature composite is nonzero, with image dℤ for some d>0. Choosing a preimage of d splits the surjection onto dℤ≅ℤ, so ℤ is a direct summand of W(R;M). In particular it is not 2-adically complete. Surjectivity onto the chosen signature ℤ is not asserted for arbitrary M, and alternating (−1) coefficients are excluded.

*Hypotheses.*

- The Witt group is the classical group of nondegenerate symmetric bilinear forms on finite projective modules, with values in M. The line coefficient has +1 involution. The L-theory consequences belong to Layer 6.
- The line-valued comparison after inverting 2 is a named source input, with its localization proof recorded as a gap rather than inferred from a generator at one real place.

*Proof sketch.*

1. For nonreal K, the global-to-local Witt map is injective and each nonarchimedean or complex local Witt group is killed by 8; therefore so is W(K).
2. For real σ and M=R, the class ⟨1⟩ maps to signature 1 and gives an explicit section. For general M, use the localization comparison after inverting 2 stated in Calmès et al. Remark 3.1.9; signature on W(K)[1/2] is onto ℤ[1/2], so the composite cannot be zero. Its nonzero subgroup of ℤ is dℤ. Lift d and extend by integer multiples to split onto this image, which is abstractly ℤ.
3. A direct summand ℤ prevents 2-adic completeness, since its completion is ℤ₂ and the natural map ℤ→ℤ₂ is not onto. The exact line-valued localization theorem required for the second step is listed in gaps.

*Checks.*

- K = ℚ(i): ⟨1⟩ ⊥ ⟨1⟩ is hyperbolic since −1 is a square, so ⟨1⟩ has order 2 in W(K).
- R = ℤ: W(ℤ) ≅ ℤ by the signature, and E₈ has signature 8.

*Prerequisites.*

- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`

*Source:* [Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle, Calmes2026](https://arxiv.org/pdf/2009.07225v4), Remark 3.1.9, p.52 (arXiv:2009.07225v4). Notes that for nonreal global K the Witt group is 2-primary torsion of bounded exponent, making L^s(R) 2-complete, while a real embedding makes ℤ a direct summand of W^s(R; M), so the comparison of Theorem 3.1.7 is not an integral equivalence.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `wittGroup_signature_split`. Implementation: unchecked.

<a id="ternary-unit-half-discriminant-classification"></a>
#### Integral ternary forms with half-discriminant ±1

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/ternary-unit-half-discriminant-classification` · theorem

Every integral ternary quadratic form f(x, y, z) = Σ a_{ij}x_ix_j over ℤ (cross terms with arbitrary integer coefficients) whose half-discriminant 4·det(A_f) is −1, with A_f the half-integral Gram matrix (A_f)_{ii} = a_{ii}, (A_f)_{ij} = a_{ij}/2, is GL₃(ℤ)-equivalent to y² − xz; those with 4det A_f = +1 are equivalent to xz − y². In particular such forms are indefinite, isotropic over ℚ and form a single class (up to sign).

*Hypotheses.*

- Integral means integer coefficients a_{ij}; the half-discriminant convention 4det(A_f) is the one of Bhargava and Wood for ternary forms.

*Uses.*

- ArithmeticStatistics ST.1, refinement-wood-ring-interpretation: binary quartic forms correspond to pairs (A, B) of ternary forms with A ∼ the split form of half-discriminant −1 (Wood)

*Proof sketch.*

1. For odd p, the polar Gram determinant is 8det A_f=±2, hence a unit; finite-field classification gives a nonzero isotropic vector and perfect polarization makes it smooth. At p=2 the reduction is a regular ternary form with a one-dimensional polar radical, and q is nonzero on that line. The characteristic-two result of finite-field-quadratic-classification gives a nonzero isotropic vector outside the radical, hence a smooth zero. Hensel lifts these vectors to ℚ_p-isotropy.
2. If f or −f were positive definite, its integer minimum would be at least 1. IntegralLattices 2E gives min f≤(4/3)(det A_f)^{1/3}=(4/3)(1/4)^{1/3}<1, a contradiction. Thus f is indefinite and isotropic over ℝ; Hasse–Minkowski gives a rational isotropic vector. Clear denominators and divide by the coordinate gcd to obtain a primitive v∈ℤ³.
3. The ideal b(v,L) is ℤ. At odd p, unimodularity and v primitive imply it has a unit value. At 2, v mod2 is a nonzero isotropic vector and cannot be in the radical, so again a unit value occurs. Choose w with b(v,w)=1 and replace w by w−q(w)v, making q(w)=0. The span of v,w is an integral hyperbolic plane and splits because its polar determinant is −1.
4. The orthogonal rank-one complement has q(z)=az² for a∈ℤ. Its polar determinant is 2a, so 8det A_f=−2a forces a=−1 when 4det A_f=+1 and a=1 when 4det A_f=−1. Therefore f is equivalent to xy−z² or xy+z², and a permutation/sign change gives exactly the two stated models.

*Checks.*

- y² − xz: A_f = [[0, 0, −1/2], [0, 1, 0], [−1/2, 0, 0]], 4det = −1.
- For f=xy+yz+zx, 4det A_f=+1. The unimodular change X=x+y, Y=y, Z=y+z has f=XZ−Y², exhibiting the required model and determinant-one change directly.

*Prerequisites.*

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-field-quadratic-classification`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/odd-unimodular-unit-representation`
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/regular-quadratic-module-spinor-norm`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`
- `tauceti:Completed/IntegralLattices#layer-2-duality-and-the-finite-discriminant-group`

*Source:* [Gaëtan Chenevier, Olivier Taïbi, ChenevierTaibi2020](https://arxiv.org/pdf/1907.08783), Section 3.2, the definition of regular quadratic forms in odd rank through the half-discriminant, p.28 (arXiv:1907.08783). Defines regularity of an odd-rank quadratic form over a ring by the invertibility of its half-discriminant, the condition 4det = ±1 here.

*Suggested placement:* `TauCeti/GeometryOfNumbers/GN2`, namespace `TauCeti.GeometryOfNumbersPlan`, target name `ternary_halfDisc_unit_equiv_split`. Implementation: unchecked.

## Library baseline and ownership

The declaration statements and their hypotheses were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every one of the following 63 entries was read at its recorded module; a name match alone was not treated as support. The current library and current upstream roadmaps were also inspected to avoid repeating later targets.

- `mathlib:Algebra.norm` in `Mathlib/RingTheory/Norm/Defs.lean`: The norm of a finite free algebra as a monoid hom S →* R.
- `mathlib:Algebra.trace` in `Mathlib/RingTheory/Trace/Defs.lean`: The trace of a finite free algebra as an R-linear map S →ₗ[R] R.
- `mathlib:ClassGroup` in `Mathlib/RingTheory/ClassGroup/Basic.lean`: The ideal class group of a domain.
- `mathlib:ClassGroup.mk0` in `Mathlib/RingTheory/ClassGroup/Basic.lean`: The class of a nonzero ideal of a Dedekind domain, a monoid hom (Ideal R)⁰ →* ClassGroup R.
- `mathlib:ClassGroup.mk0_eq_one_iff` in `Mathlib/RingTheory/ClassGroup/Basic.lean`: A nonzero ideal has trivial class iff it is principal.
- `mathlib:CliffordAlgebra.even` in `Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean`: The even subalgebra of a Clifford algebra.
- `mathlib:FiniteField.card` in `Mathlib/FieldTheory/Finite/Basic.lean`: A finite field of characteristic p has p^n elements.
- `mathlib:FiniteField.exists_root_sum_quadratic` in `Mathlib/FieldTheory/Finite/Basic.lean`: Over a finite field of odd characteristic, two quadratic polynomials f, g have a with f(a) + g(b) = 0 for some b (sums of squares statements).
- `mathlib:FiniteField.isSquare_iff` in `Mathlib/FieldTheory/Finite/Basic.lean`: In a finite field of odd characteristic, a nonzero a is a square iff a^{(q−1)/2} = 1.
- `mathlib:FractionalIdeal` in `Mathlib/RingTheory/FractionalIdeal/Basic.lean`: Fractional ideals of a domain in a localization.
- `mathlib:FractionalIdeal.mul_inv_cancel_iff` in `Mathlib/RingTheory/FractionalIdeal/Inverse.lean`: A fractional ideal I satisfies I·I⁻¹ = 1 iff it is invertible.
- `mathlib:HenselianLocalRing` in `Mathlib/RingTheory/Henselian.lean`: Henselian local rings: simple roots of monic polynomials modulo the maximal ideal lift.
- `mathlib:IsDedekindDomain.HeightOneSpectrum` in `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean`: The height-one primes (finite places) of a Dedekind domain.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion` in `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`: The completion of the fraction field at a height-one prime.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers` in `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`: The valuation ring of the completion at a height-one prime.
- `mathlib:IsDedekindDomain.exists_sup_span_eq` in `Mathlib/RingTheory/DedekindDomain/Factorization.lean`: For nonzero I ≤ J in a Dedekind domain there is x with I ⊔ span{x} = J (two-generation of ideals).
- `mathlib:IsDiscreteValuationRing` in `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`: Discrete valuation rings.
- `mathlib:IsLocalRing` in `Mathlib/RingTheory/LocalRing/Defs.lean`: Local rings.
- `mathlib:LinearMap.IsAdjointPair` in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`: Adjoint pairs of maps for two sesquilinear forms.
- `mathlib:LinearMap.IsSymm` in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`: Symmetry (hermitian symmetry for a ring involution) of a sesquilinear form.
- `mathlib:LinearMap.det` in `Mathlib/LinearAlgebra/Determinant.lean`: The determinant of an endomorphism of a module.
- `mathlib:Matrix.charpoly` in `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: The characteristic polynomial of a square matrix.
- `mathlib:Matrix.det` in `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: The determinant of a square matrix.
- `mathlib:Module.Projective` in `Mathlib/Algebra/Module/Projective.lean`: Projective modules.
- `mathlib:Module.free_of_finite_type_torsion_free'` in `Mathlib/LinearAlgebra/FreeModule/PID.lean`: A finitely generated torsion-free module over a PID is free.
- `mathlib:Module.torsion_by_prime_power_decomposition` in `Mathlib/Algebra/Module/PID.lean`: A finitely generated module over a PID killed by a power of a prime is a direct sum of cyclic modules R/p^{e_i}.
- `mathlib:Nat.infinite_setOfPred_prime_and_eq_mod` in `Mathlib/NumberTheory/LSeries/PrimesInAP.lean`: Dirichlet: for a unit a mod q there are infinitely many primes p ≡ a mod q.
- `mathlib:NumberField.InfinitePlace` in `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`: Infinite places of a number field.
- `mathlib:NumberField.RingOfIntegers` in `Mathlib/NumberTheory/NumberField/Basic.lean`: The ring of integers of a number field.
- `mathlib:PadicInt` in `Mathlib/NumberTheory/Padics/PadicIntegers.lean`: The p-adic integers ℤ_p.
- `mathlib:QuadraticMap.polarBilin` in `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`: The polar bilinear map of a quadratic map, b(x, y) = Q(x+y) − Q(x) − Q(y).
- `mathlib:QuaternionAlgebra` in `Mathlib/Algebra/Quaternion.lean`: Quaternion algebras ℍ[R, c₁, c₂, c₃] over a commutative ring.
- `mathlib:Submodule.IsLattice` in `Mathlib/Algebra/Module/Lattice.lean`: An R-submodule of an A-module that is finitely generated and spans over A (a full lattice).
- `mathlib:Submodule.exists_smith_normal_form_of_le` in `Mathlib/LinearAlgebra/FreeModule/PID.lean`: Smith normal form of a pair of nested submodules of a free module over a PID.
- `mathlib:ZMod.exists_sq_eq_neg_one_iff` in `Mathlib/NumberTheory/LegendreSymbol/Basic.lean`: −1 is a square mod an odd prime p iff p ≢ 3 mod 4.
- `mathlib:char_dvd_card_solutions_of_sum_lt` in `Mathlib/FieldTheory/ChevalleyWarning.lean`: Chevalley–Warning: if the total degree is less than the number of variables, the characteristic divides the number of common zeros.
- `mathlib:conductor_mul_differentIdeal` in `Mathlib/RingTheory/DedekindDomain/Different.lean`: For B = A[x] generically, conductor(A[x])·𝔡_{B/A} = (f′(x)), f the minimal polynomial of x.
- `mathlib:differentIdeal` in `Mathlib/RingTheory/DedekindDomain/Different.lean`: The different ideal of an extension of Dedekind domains.
- `mathlib:hensels_lemma` in `Mathlib/NumberTheory/Padics/Hensel.lean`: Hensel’s lemma over ℤ_p: an approximate root a with ‖F(a)‖ < ‖F′(a)‖² lifts to a unique nearby root.
- `mathlib:jacobiSym` in `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean`: The Jacobi symbol (a/b) for odd b (Kronecker symbols are built from it and the symbols at 2).
- `mathlib:jacobiSym.quadratic_reciprocity` in `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean`: Quadratic reciprocity for Jacobi symbols of odd positive integers.
- `mathlib:legendreSym` in `Mathlib/NumberTheory/LegendreSymbol/Basic.lean`: The Legendre symbol (a/p).
- `mathlib:legendreSym.quadratic_reciprocity` in `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean`: Quadratic reciprocity for distinct odd primes.
- `mathlib:orderOf` in `Mathlib/GroupTheory/OrderOfElement.lean`: The order of an element of a monoid.
- `mathlib:traceForm_dualSubmodule_adjoin` in `Mathlib/RingTheory/DedekindDomain/Different.lean`: Euler’s lemma: the trace dual of A[x] is f′(x)^{−1}A[x] for a generator x with minimal polynomial f.
- `tauceti:CliffordAlgebra.spinorNorm` in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`: The spinor norm on the special orthogonal group SO(Q), valued in Multiplicative (SquareClassGroup K). The orthogonal-group extension is orthogonalSpinorNorm.
- `tauceti:QuadraticForm.LocallyRepresentsScalar` in `TauCeti/NumberTheory/QuadraticForm/Global/Predicates.lean`: A quadratic form over a number field represents a scalar at every finite and every real place.
- `tauceti:QuadraticForm.atFinitePlace` in `TauCeti/NumberTheory/QuadraticForm/Global/Localization.lean`: Base change of a quadratic form over a number field to the completion at a finite place.
- `tauceti:QuadraticMap.Represents` in `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean`: Q represents a: there is v with Q v = a.
- `tauceti:QuaternionAlgebra.normForm` in `TauCeti/Algebra/Quaternion/NormForm.lean`: The reduced norm of a quaternion algebra as a quadratic form, x ↦ x·x̄.
- `tauceti:TauCeti.IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet` in `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Cardinality.lean`: For a nondegenerate integral ℤ-lattice, the order of the discriminant group is |det of the Gram matrix|.
- `tauceti:TauCeti.IntegralLattice.ofGramMatrix` in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`: The integral ℤ-lattice with a given symmetric integer Gram matrix in a basis of a rational space.
- `tauceti:TauCeti.Multiquadratic.genusCharFun` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean`: The genus character attached to a finite set s of prime discriminants: n ↦ ∏_{P ∈ s} χ_P(n), the Kronecker character of ∏P.
- `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/NarrowClassGroup.lean`: The genus character of a sub-factorization as a homomorphism on the narrow class group of a quadratic field.
- `tauceti:TauCeti.Multiquadratic.genusCharFun_eq_one_of_four_mul_eq_sq_sub_mul_sq` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean`: The represented-value norm identity for a product of distinct prime discriminants with at most one even prime discriminant, and a subset of its factors. This is a fundamental-discriminant theorem, not well-definedness for arbitrary nonfundamental dd′.
- `tauceti:TauCeti.Multiquadratic.genusCharFun_eq_one_or_eq_neg_one` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean`: Genus characters take values ±1 at integers coprime to the discriminant.
- `tauceti:TauCeti.Multiquadratic.genusCharFun_eq_zero_iff` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean`: A genus character vanishes at n iff n is not coprime to the product of its prime discriminants.
- `tauceti:TauCeti.Multiquadratic.genusCharFun_mul_right` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean`: Genus characters are completely multiplicative in the integer argument.
- `tauceti:TauCeti.Multiquadratic.isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/PrincipalGenus.lean`: Principal genus theorem: a narrow ideal class of a quadratic field is a square iff every genus character is trivial on it.
- `tauceti:TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one` in `TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.lean`: For an imaginary quadratic field the 2-rank of the class group is (number of ramified primes) − 1.
- `tauceti:TauCeti.QuadraticMap.orthogonalGroup` in `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup.lean`: The orthogonal group of a quadratic map, as a subgroup of the linear automorphisms.
- `tauceti:TauCeti.Multiquadratic.isGenusField_candidateGenusField` in `TauCeti/NumberTheory/Multiquadratic/GenusField.lean`: For squarefree d < 0, the candidate multiquadratic field is the genus field of the quadratic field: abelian over ℚ, unramified over its embedded quadratic subfield at all places, with root-preserving maximality.
- `tauceti:TauCeti.Multiquadratic.finrank_candidateGenusField_over_candidateGenusFieldBase_eq_two_pow_ncard_ramifiedPrimes` in `TauCeti/NumberTheory/Multiquadratic/CandidateGenusField/RamifiedPrimes.lean`: For a squarefree quadratic radicand d, a generator θ with minpoly ℤ θ = X² − C d and ℚ[θ] = K, the candidate genus field has relative degree 2^(ncard (ramifiedPrimes K) − 1).

### Requested supplier contracts

- `AdelicAlgebraicGroups:AA.1`: Finite adelic points of the unitary group of a hermitian space over a number field, with the restricted-product topology, acting on lattices through completions. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-genus`.
- `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`: The integral ℤ-lattice carrier and rational form, including the imported binary carrier. Current-main binary normal forms (3C/3D), forms/classes (B1/B2) and Nikulin (5I) have separate exact contracts in upstreamRequests, since their present sections are absent from the atlas snapshot. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/isotropic-quotient-discriminant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-local-normal-form`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/exponent-two-genus-theory`.
- `tauceti:Completed/IntegralLattices#layer-2-duality-and-the-finite-discriminant-group`: Layer 2 supplies the discriminant group and its cardinality for Λ_{2d}; milestone 2E also supplies min L≤(4/3)^((n−1)/2)(det L)^(1/n) for a positive definite rank-n lattice, used with n=3 to rule out a definite ternary form of determinant 1/4. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lambda-2d-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/ternary-unit-half-discriminant-classification`.
- `tauceti:Completed/IntegralLattices#layer-4-overlattices-and-isotropic-subgroups`: The discriminant-group graph gluing calculation for a sublattice and complement. The converse primitive-embedding criterion is imported specifically from current-main IntegralLattices 5I, recorded separately in upstreamRequests; Layer 4 is not claimed to prove that converse. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/primitive-embedding-congruence-transport`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`: The Hilbert class field of an imaginary quadratic field with Galois group the class group. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/exponent-two-genus-theory`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`: Weak approximation: an element of F^× with prescribed signs at the real places. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/trace-unimodular-existence`.
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`: Hasse–Minkowski isotropy for a regular ternary form over ℚ. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/ternary-unit-half-discriminant-classification`.
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`: Local-global isometry of regular quadratic forms and the Hasse principle for representing a scalar (QuadraticForm.LocallyRepresentsScalar). Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hasse-schilling-norm-theorem`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-space-classification`.
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-8-global-classification-and-witt-consequences`: Injectivity of the global-to-local Witt map. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/witt-group-signature-splitting`.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`: The unit filtration of a local field and 1 + 𝔭 ⊆ squares in odd residue characteristic. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quadratic-norm-squares`.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`: Surjectivity of N:O_E^×→O_F^× for an unramified quadratic extension (map_norm_unitFiltration_zero). Integral trace surjectivity is derived in GN.2 from residue-field trace and Nakayama; trace is not claimed to map units onto all units. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/unramified-hermitian-lattice-diagonalization`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`: The p-adic Hilbert symbol and its invariance under norms. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-genus-character`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6d-the-classification-and-its-corollaries`: Classification of quadratic forms over a nonarchimedean local field by dimension, discriminant and Hasse invariant. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-space-classification`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/trace-unimodular-existence`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`: Witt decomposition and cancellation over fields of characteristic ≠ 2. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-field-quadratic-classification`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-trace-form`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`: Quaternion algebras, their standard involution, reduced trace and norm. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternion-order`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`: The Witt ring of a field and the exponents of local Witt groups. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/witt-group-signature-splitting`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`: Isotropy of forms of dimension ≥ 5 over a nonarchimedean local field. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hasse-schilling-norm-theorem`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`: The Scharlau transfer along a nonzero linear functional and its change-of-functional theorem. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/equivariant-linear-form`.

The following three contracts exist on current upstream main but have no valid stage identifiers in the atlas snapshot. Their absence does not authorize duplicating them or inventing a baseline declaration. Packaging must import these named upstream sections.

- [IntegralLattices](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md): Milestones 3C and 3D: classification and normal forms of odd and dyadic ℤ_p-lattices. GN.2 imports these for binary character evaluation; it does not own another normal-form theory. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-local-normal-form`.
- [IntegralLattices](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md): B1–B2 supply integral binary forms, proper substitutions and the primitive proper-form/ideal-class correspondence for nonsquare discriminants. GN.2 adds genus-character evaluation on this existing carrier. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/exponent-two-genus-theory`.
- [IntegralLattices](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md): Milestone 5I, Nikulin Proposition 1.15.1: primitive embeddings into an arbitrary even target lattice via the graph quotient δ and a complement with discriminant form −δ. Layer 4 overlattice gluing alone does not supply this converse. Needed by: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/primitive-embedding-congruence-transport`.

### Open proof gaps

- **Dyadic ramified unimodular hermitian lattices.** For a ramified quadratic extension of dyadic local fields, unimodular hermitian lattices with equal determinant and norm ideal are isometric (Jacobowitz, Hermitian forms over local fields, Amer. J. Math. 84 (1962), Proposition 10.4, cited by Lipnowski–Tsimerman Proposition 5.6). Jacobowitz is not freely available and was not read; the unramified and odd ramified cases are proved in the node. Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-unimodular-hermitian-classification`.
- **Integral spinor images of non-split dyadic lattices.** The node proves θ(SO(L)) ⊆ R^×K^{×2} for every regular unimodular lattice and equality when L is nondyadic or contains a hyperbolic plane. The full computation of θ(SO(L_v)) for arbitrary dyadic lattices (Beli, Integral spinor norm groups over dyadic local fields, J. Number Theory 2003, and Earnest–Hsia) was not acquired; no target of the atlas uses it beyond these cases, but the proper spinor genus count of a general lattice over a number field with dyadic places of non-split type needs it. Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-unimodular-spinor-image`.
- **Global simultaneous pseudobasis over a Dedekind domain.** Voight Theorem 9.3.9, printed p.139, states the common-pseudobasis theorem but omits its proof. Supply the global elementary-divisor argument for two projective full lattices, including the passage from local Smith exponents to vectors and coefficient ideals. Local Smith normal form and unique ideal factorization prove existence/uniqueness of invariant ideals, but do not alone construct a global simultaneous pseudobasis. Steinitz classification and the index/discriminant nodes do not use this missing step. Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-pseudobasis`.
- **Line-valued symmetric Witt localization away from 2.** Supply the isomorphism W^s(R;M)[1/2]→W^s(K)[1/2] after trivializing M over K, for a Dedekind domain with global fraction field and symmetric +1 line coefficient M. Calmès et al. Remark 3.1.9, p.52, explicitly states this input and uses it to prove the signature composite nonzero. The proof requires the line-valued localization/residue theory; it does not follow from quadratic-field Witt cancellation or from choosing a generator at a single real embedding. The untwisted splitting is closed independently by ⟨1⟩. Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/witt-group-signature-splitting`.

### Source corrections

- **`GeometryOfNumbersAndQuadraticArithmetic/E201`**, `Voight2026`, 15.4.5 and Lemma 15.4.7, printed p.239 (physical p.259), post-publication v1.0.7u, 5 August 2026; no collation with the 2021 edition claimed. Both hold for R-orders (more generally for lattices containing R·1 as a saturated direct summand, so that the index can be computed in B/F); for general lattices discrd(I)² = disc(I) fails. The packet states them for orders. Witness or reason: For I = 2M₂(ℤ) ⊆ J = M₂(ℤ): m is trilinear, so discrd(I) = 2³discrd(J) = 8ℤ, while [J : I] = 2⁴ and disc(I) = 2⁸disc(J) = 256ℤ ≠ 64ℤ = discrd(I)². The proof of 15.4.7 uses m(α_1, α_2, α_3)² = −d(1, α_1, α_2, α_3), and the values d(1, α_1, α_2, α_3) generate disc(I) only when 1 ∈ I behaves as for an order. Status: independently confirmed. Prior record/search: new
- **`GeometryOfNumbersAndQuadraticArithmetic/E202`**, `BEY2021`, Published Definition 7.1 and Lemma 7.2, pp.752–753; also arXiv v2 pp.44–45. At p=2 dividing Δ additionally require D/Δ∈4ℤ₂∪(1+4ℤ₂), and set the character to zero off this support. At p∤Δ use the published characteristic function of L′_p. Witness or reason: For Δ=−4, p=2 and Q=[1,0,2], D=−8 satisfies the printed support conditions, but Q represents 1 and 3, with Hilbert symbols (1,−4)₂=1 and (3,−4)₂=−1. The quotient D/Δ=2 fails the missing condition. GKZ I.2 Proposition 1 explicitly includes the quotient-discriminant restriction. Status: independently confirmed. Prior record/search: new; no correction found in the bounded search recorded below
- **`GeometryOfNumbersAndQuadraticArithmetic/E203`**, `BFP2024`, arXiv:2206.07759v2, §6, pp.9–10, the three-orbit quadric-surface classification. Require geometric irreducibility. A nonsplit binary norm equation gives another irreducible-over-𝔽_q surface of geometric rank two. Witness or reason: For odd q and nonsquare d, x²−dy² is irreducible in 𝔽_q[x,y,z,w], so it defines a reduced irreducible surface in ℙ³ over 𝔽_q. Over 𝔽_{q²} it is the union of two conjugate planes and is none of the three listed geometric types. The correction preserves the rank-three/four application. Status: independently confirmed. Prior record/search: new; no correction found in the bounded search recorded below
- **`GeometryOfNumbersAndQuadraticArithmetic/E204`**, `Charles2016`, Published Proposition 2.9, p.500, and proof pp.500–502. Assume the initial embedding is primitive, as already recorded in PAPER-CHARLES-16/E2. Witness or reason: The sublattice diag(8,8) generated by 2h and 2(e+f) in Λ₂ has no primitive embedding into Λ₂. Modulo 2 a primitive embedding would give a two-dimensional zero subspace for q=x²+yz on 𝔽₂³. Its three nonzero zeros are (0,0,1),(0,1,0),(1,1,1), and the sum of any two is not a zero. Taking m=1 disproves the unrestricted target. Status: independently confirmed. Prior record/search: Already recorded and independently confirmed as PAPER-CHARLES-16/E2; this entry links the GN.2 dependency to that existing finding.
- **`GeometryOfNumbersAndQuadraticArithmetic/E205`**, `Voight2026`, Example 9.6.5, printed p.144 (physical p.164), under the noetherian-domain hypotheses at the start of §9.6, p.143; v1.0.7u. Require M projective (in particular R Dedekind), or retain [M:rM]_R=r^n[M:M]_R rather than identifying the self-index with R. Witness or reason: Take R=k[t²,t³], F=k(t), M=k[t] and r=1. M is generated over R by 1,t and spans F. Rank-one endomorphisms preserving M are multiplication by exactly k[t], so [M:M]_R=k[t]≠R. Status: independently confirmed. Prior record/search: new; no correction found in the bounded search recorded below
- **`GeometryOfNumbersAndQuadraticArithmetic/E206`**, `BEY2021`, Published proof of Corollary 7.18, p.768; arXiv v2 pp.56–57. The count and indexing bound are 2^{s−1}, equal to the genus quotient order and, under exponent two, the class number. Witness or reason: For D=−84, s=3 but the four genus characters correspond to the four sign-selected splittings. The proof’s own class-number formula gives 2^{s−1}; the count s is inconsistent. Status: independently confirmed. Prior record/search: Already recorded and confirmed as PAPER-BRUINIER-EHLEN-YANG-21/E4.
- **`GeometryOfNumbersAndQuadraticArithmetic/E207`**, `LMS2018`, arXiv:1107.1221, Proposition 2.1.2 and proof, pp.3–4. Add (φx,φy)=q^w(x,y). Also interpret integral characteristic polynomial as one in ℤ[T] for the uniform finite-polynomial argument. Witness or reason: For any odd ℓ, let M=ℤ_ℓ² with pairing diag(1,−1), v=(1,1+ℓ), w=(0,1), and let φ act as +1 on v and −1 on w. This is an integral endomorphism since v,w form a basis; its characteristic polynomial X²−1 has Weil weight zero and semisimple eigenvalue 1. The ambient discriminant is a unit while the fixed-line discriminant is −ℓ(2+ℓ), of valuation 1. This violates the large-ℓ bound for arbitrarily large ℓ. It is not an isometry, exactly the missing condition. Status: independently confirmed. Prior record/search: new; no correction found in the bounded search recorded below

### Atlas relations and tier moves

- Layer GN.2 has five planets in the base packet and this follow-up adds six key results; one star cannot show eleven. Divide GN.2 for the atlas into GN.2a “Integral quadratic and hermitian lattices” (the base packet’s GN.2 nodes and planets), GN.2b “Local-global arithmetic of lattices and orders” (lattice-pseudobasis, lattice-steinitz-class, lattice-completion, lattice-local-global-dictionary, lattice-index-ideal, lattice-discriminant-ideal, quaternion-order, quaternion-order-discriminant, maximal-quaternion-order-criterion, hasse-schilling-norm-theorem, binary-form-genus-character, local-genus-character, exponent-two-genus-theory, trace-unimodular-lattice, trace-unimodular-existence, witt-group-signature-splitting) and GN.2c “Local classification: finite fields, local lattices and hermitian forms” (all other nodes of this packet).
- ClassicalArithmeticCompletion CA.7 plans orders in finite-dimensional algebras and maximal orders, and lies in a higher tier than this roadmap (tier 3), which needs the same notion for quaternion orders. The general notion of an R-order and of a maximal order moves down to GN.2 (node quaternion-order, stated for any finite-dimensional algebra); CA.7/order-in-finite-dimensional-algebra and CA.7/maximal-order import it.
- Red-team finding RT-AREA-algebraicnt-1/1: the roadmap names QuadraticFormInvariants, GlobalQuadraticForms and AdelicAlgebraicGroups in its summary, and its paper routes import Tau Ceti’s integral lattices, but none of these relations is recorded in its prerequisites or in the suppliers’ consumers. Add tauceti:TauCetiRoadmap/QuadraticFormInvariants, tauceti:TauCetiRoadmap/GlobalQuadraticForms, AdelicAlgebraicGroups and tauceti:Completed/IntegralLattices (with tauceti:TauCetiRoadmap/IntegralLattices) to the roadmap’s prerequisites, and the roadmap to each of their consumers. At stage level the edges are QuadraticFormInvariants Layers 1, 2, 4, 6 and 9 → GN.2, GlobalQuadraticForms Layers 5, 6 and 8 → GN.2, Completed IntegralLattices Layers 1, 2 and 4 → GN.2 and AdelicAlgebraicGroups AA.1 → GN.2, exactly the requests of this packet and the base packet.
- `ClassicalArithmeticCompletion:CA.7/order-in-finite-dimensional-algebra` moves to `GeometryOfNumbersAndQuadraticArithmetic`; `ClassicalArithmeticCompletion` imports it. Contract: R-orders and maximal orders in a finite-dimensional algebra over the fraction field of a noetherian domain, with integrality of elements and localization; planned in GN.2/quaternion-order.
- `ClassicalArithmeticCompletion:CA.7/maximal-order` moves to `GeometryOfNumbersAndQuadraticArithmetic`; `ClassicalArithmeticCompletion` imports it. Contract: Maximality of an order; planned in GN.2/quaternion-order (AlgebraOrder.IsMaximal).
- Current main inspected read-only on 2026-10-13. IntegralLattices 3C/3D owns ℤ_p classification and binary normal forms; 4C owns the ℚ/ℤ_p proper-stabilizer and spinor-genus machinery. OrthogonalSpinGroups owns field spinor norms and its cofinite reference images. GN.2 imports these and supplies complete-DVR/number-field-local extensions and the Pic-trivial regular-ring GSpin input only. The arbitrary-compatible-family statement is openness, not automatic equality with unit classes. Rank-two torus corrections remain upstream’s own scope.

These are precise metadata proposals for the maintainer. This job edits the GN.2 deliverables, not roadmap-level atlas relations. The reciprocal prerequisite/consumer proposal implements the requested response to `RT-AREA-algebraicnt-1/1`.

### Source routing

- paperItem: PAPER-BERGSTROM-FABER-PAYNE-24/quadric-classification; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/quadric-surface-classification, GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-field-quadratic-classification, GeometryOfNumbersAndQuadraticArithmetic:GN.2/arf-invariant; status: planned
- paperItem: PAPER-BRUINIER-EHLEN-YANG-21/11; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-genus-character, GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character, GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character-invariance; status: planned; one owner for the character on binary forms, shared with DIT items 101–102
- paperItem: PAPER-BRUINIER-EHLEN-YANG-21/12; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/exponent-two-genus-theory; status: planned on Tau Ceti’s principal genus theorem and two-rank formula
- paperItem: PAPER-DUKE-IMAMOGLU-TOTH-16/101; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character; status: planned
- paperItem: PAPER-DUKE-IMAMOGLU-TOTH-16/102; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-form-genus-character-invariance; status: planned
- paperItem: PAPER-DUKE-IMAMOGLU-TOTH-16 (all other items); nodes: ; status: not GN.2: binary forms, the ideal–form dictionary, Pell automorphs and narrow classes are TauCetiRoadmap IntegralLattices Layer B (B1–B5); cycles, geodesics, CM points and equidistribution are the GN.3–GN.4 follow-ups (#9327, #9328)
- paperItem: PAPER-CALMES-ETAL-26/408; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/witt-group-signature-splitting; status: planned (the classical Witt-group input)
- paperItem: PAPER-CALMES-ETAL-26 (all other GN.2-routed items); nodes: ; status: not GN.2: Grothendieck–Witt and L-theoretic statements are Layer 6 (GN.6 follow-up #9330)
- paperItem: PAPER-CHARLES-16/36; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/lambda-2d-lattice; status: planned
- paperItem: PAPER-CHARLES-16/37, nikulin-embedding-data, hyperbolic-genus-uniqueness, negative-rank-one-complement; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/primitive-embedding-congruence-transport; status: Nikulin’s Proposition 1.15.1 and Corollary 1.13.4 are TauCetiRoadmap IntegralLattices milestones 5I and 5D, cited in the proof; the rank-one complement is a step of the proof
- paperItem: PAPER-CHARLES-16/38, 39, 40, nonprimitive-obstruction; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/primitive-embedding-congruence-transport; status: planned with the corrected primitivity hypothesis (PAPER-CHARLES-16/E2)
- paperItem: PAPER-CHARLES-16/explicit-primitive-splitting, explicit-positive-plane, explicit-orthogonal-class, explicit-prime-to-n; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/zarhin-explicit-plane; status: planned
- paperItem: PAPER-CHARLES-16/87; nodes: ; status: not GN.2: finiteness of integral lattices of bounded rank and determinant is reduction theory (GN.3 follow-up #9327; definite case IntegralLattices 2G)
- paperItem: PAPER-CHARLES-16/107; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/isotropic-quotient-discriminant; status: planned
- paperItem: PAPER-CHARLES-16/110; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/frobenius-eigenlattice-discriminant-bound; status: planned with the similitude hypothesis explicit
- paperItem: PAPER-CHARLES-16/115, 142, unit-representation-lift, rank-one-norm; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/odd-unimodular-unit-representation, GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-field-quadratic-classification; status: planned
- paperItem: PAPER-CHARLES-16/118, 131, prime-power-residues; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/prime-power-square-lift; status: planned
- paperItem: PAPER-CHARLES-16/reciprocal-pair, reciprocal-discriminant, cayley-discriminant; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/isometry-eigenspace-decomposition; status: planned
- paperItem: PAPER-CHARLES-16/integral-orthogonal-split; nodes: ; status: TauCetiRoadmap IntegralLattices milestones 0F and 3A (unimodular splitting over ℤ and ℤ_p); cited in compatible-system-norm-selection
- paperItem: PAPER-CHARLES-16/compatible-system-norm, unit-norm-primitive; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/compatible-system-norm-selection; status: planned
- paperItem: PAPER-CHENEVIER-TAIBI-20/regular-quadratic-forms, gspin-spin-sequences; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/regular-quadratic-module-spinor-norm; status: planned
- paperItem: PAPER-CHENEVIER-TAIBI-20/zassenhaus; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/zassenhaus-spinor-norm; status: planned
- paperItem: PAPER-CHENEVIER-TAIBI-20/corollary-3-6; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/isometry-eigenspace-decomposition; status: planned
- paperItem: PAPER-CHENEVIER-TAIBI-20/prop-3-7; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-isometry-charpoly-constraint; status: planned
- paperItem: PAPER-ICHINO-PRASANNA-23/017; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/hasse-schilling-norm-theorem; status: planned
- paperItem: PAPER-KHAYUTIN-19/108; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/binary-local-normal-form; status: planned
- paperItem: PAPER-KHAYUTIN-19/95; nodes: ; status: not GN.2: admissible lattice-point exponents for ellipses are GN.4 (#9328)
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/13, 14, 16; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/quadratic-norm-squares; status: planned
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/30, 31; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space; status: planned
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/32, 38, 40, 41, 45; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-twist, GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-witt-scalar-twist, GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-transfer, GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-transfer-image-independent, GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-transfer-parity-injectivity; status: base packet nodes
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/39; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/equivariant-linear-form; status: planned
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/42, 43; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/skodlerack-stevens-maximal-transfer, GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-transfer-maximal-element; status: planned; the external input [39, Theorem 4.4] is now read (Skodlerack–Stevens arXiv:1503.08882v3 §4) and is its own node
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/44; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-witt-parity; status: planned
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/46, 48; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-transfer-determinant; status: planned
- paperItem: PAPER-KURINCZUK-SKODLERACK-STEVENS-21/47, 49; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/standard-transfer-values; status: planned
- paperItem: PAPER-LESLIE-25/30; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/unramified-hermitian-lattice-diagonalization; status: planned
- paperItem: PAPER-LESLIE-25/36; nodes: ; status: not GN.2: the identification m_0 = Den(L) is a local density statement (GN.3 follow-up #9327)
- paperItem: PAPER-LI-23/10, 11; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/trace-unimodular-existence; status: planned with a self-contained proof (local split lattices glued by the local-global dictionary)
- paperItem: PAPER-LI-23/43; nodes: ; status: not needed: Hecke’s theorem that the class of the different is a square is used by Li only for Proposition 2.6, which trace-unimodular-existence proves without it; no other GN target uses it
- paperItem: PAPER-LI-23/67, 68, 69; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/trace-unimodular-lattice; status: planned (the Weil-representation part of 69 is MetaplecticAutomorphicForms’)
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/local-order, saturation-normalization, flag-fiber; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-monogenic-order, GeometryOfNumbersAndQuadraticArithmetic:GN.2/normalized-lattice-sandwich, GeometryOfNumbersAndQuadraticArithmetic:GN.2/stable-lattice-flag-fiber; status: planned
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/model-ring; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/model-ring-positive-involution; status: planned, with the quaternionic analogue requested by ArithmeticStatistics ST.5
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/unit-norm-label, unitary-group; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/unit-norm-label, GeometryOfNumbersAndQuadraticArithmetic:GN.2/signed-hermitian-space; status: planned
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/hermitian-lattice, hermitian-dual; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice, GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice; status: base packet nodes
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/gram-orbit-bijection; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/free-unimodular-gram-orbits, GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-space-classification, GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-trace-form; status: planned
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/norm-ideal, local-hermitian-classification; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-norm-ideal, GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-unimodular-hermitian-classification; status: planned; dyadic ramified case recorded as a gap
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/hermitian-genus, free-projective-comparison; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-genus, GeometryOfNumbersAndQuadraticArithmetic:GN.2/free-projective-hermitian-comparison; status: planned
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/monogenic-conductor-bound, coefficient-dvr-model; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/local-monogenic-order; status: planned through Mathlib’s Euler lemma and conductor–different identity; the coefficient-DVR presentation O₀[[T]] → R is a counting device of Yun used only by the GN.3 orbit counts
- paperItem: PAPER-LIPNOWSKI-TSIMERMAN-18/isotypic-stabilizer-congruence-bound, finite-dvr-determinant-index, good-prime-lattice-orbit; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/isotypic-stabilizer-congruence-bound, GeometryOfNumbersAndQuadraticArithmetic:GN.2/finite-dvr-determinant-index, GeometryOfNumbersAndQuadraticArithmetic:GN.2/good-prime-lattice-orbit; status: planned
- paperItem: PAPER-ZHANG-21/1; nodes: GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-trace-form; status: planned
