# Geometry of numbers, quadratic forms and homogeneous arithmetic — Layer GN.2, continued: local-global arithmetic of lattices, orders and hermitian forms

This document continues Layer GN.2 (quadratic and hermitian local-global theory) of the roadmap *Geometry of numbers, quadratic forms and homogeneous arithmetic*. The first part of the layer, in the roadmap’s main document (§§2.1–2.9), sets up integral quadratic lattices over a Dedekind domain with localization and completion descent, the integral genus and the proper spinor genus over a number field, invariant factors over a DVR, Voight’s atomic forms, integral hermitian lattices with their dual and invariants, quaternionic hermitian lattices over a quaternion order, and signed hermitian forms over a local field of odd residue characteristic. Everything here builds on those targets and cites them by their identifiers; nothing there is restated.

What this part adds (§§2.10–2.19):

- **Lattices over a Dedekind domain: pseudobases, completion and the local-global dictionary** (§2.10).
- **Quaternion orders and reduced norms** (§2.11).
- **Quadratic forms over finite fields** (§2.12).
- **Binary forms: genus characters and local normal forms** (§2.13).
- **Local integral classification and spinor norms** (§2.14).
- **Hermitian forms and lattices over quadratic extensions** (§2.15).
- **Stable lattices of a semisimple endomorphism** (§2.16).
- **Signed hermitian forms: unitary groups and transfer** (§2.17).
- **Lattices with Frobenius and Zarhin’s trick** (§2.18).
- **Trace-unimodular lattices, Witt groups of Dedekind rings and ternary forms** (§2.19).

## Scope and boundaries

This part owns the targets listed below. It does not own: the field theory of quadratic forms (QuadraticFormInvariants: Witt cancellation, quaternion algebras, discriminants and Hasse invariants, local classification, the Scharlau transfer), isotropy, representation and isometry over number fields (GlobalQuadraticForms), integral lattices over ℤ and ℤ_p with their duals, discriminant forms, Jordan splittings, genus symbols, spinor genera over ℚ, binary forms and Nikulin’s embedding theory (Tau Ceti’s integral lattices and TauCetiRoadmap IntegralLattices, milestones 0F, 3A–3I, 4A–4C, 5A–5J and B1–B8), the spinor norm over a field and its tables over ℚ_p (OrthogonalSpinGroups), finite adelic points (AdelicAlgebraicGroups AA.1), and the genus theory of quadratic fields (Tau Ceti’s `Multiquadratic` library). Representation densities, masses and orbit counts are Layer 3, lattice-point estimates Layer 4, and Grothendieck–Witt and L-theoretic statements Layer 6. The general notion of an order in a finite-dimensional algebra is planned here (§2.11) and imported by ClassicalArithmeticCompletion.

## Conventions

**Lattices.** Over a Dedekind domain `R` with fraction field `F`, a lattice in a finite-dimensional `F`-space `V` is a finitely generated `R`-submodule spanning `V` (Mathlib’s `Submodule.IsLattice F`); no basis is stored, and lattices may be nonfree. Localization `L_(𝔭)` stays inside `V`; completion `L_v` lives in `V_v = F_v ⊗_F V` with `F_v = adicCompletion F v`.

**Quadratic and bilinear forms.** A quadratic lattice carries `q : V → F` with polar form `b(x,y) = q(x+y) − q(x) − q(y)`, never divided by two; the dual is `L^♯ = {y : b(y,L) ⊆ R}`. Where a source uses a bilinear form with `Q(x) = (x,x)/2` (Li, Charles, Tau Ceti’s integral lattices), the node says so. Discriminant ideals are Gram determinants of the polar form.

**Hermitian forms.** Sesquilinear forms are conjugate-linear in the first variable and linear in the second (Mathlib, Kurinczuk–Skodlerack–Stevens); `h(w,v) = ε·h(v,w)‾`. Lipnowski–Tsimerman and Zhang use forms linear in the first variable; `h′(v,w) = h(w,v)` translates, and the trace form is the same.

**Local fields.** `q` is the residue cardinality of the base field. “Unimodular” means `L^∨ = L` for the form in question. Spinor norms follow Tau Ceti’s `CliffordAlgebra.spinorNorm`: `θ(τ_v) = [q(v)]`.

**Binary forms.** `Q = [a,b,c]` means `ax² + bxy + cy²` with discriminant `b² − 4ac`; χ_d is the Kronecker character of a fundamental discriminant `d` (Tau Ceti `Multiquadratic.genusCharFun`).

## Sources

- John Voight, *Quaternion algebras* (Author post-publication v1.0.7u, 5 August 2026, 883 physical pages; printed = physical − 20 in Chapters 9–13 and physical − 28 in Chapters 14–15), https://jvoight.github.io/quat-book.pdf: §9.3 Theorems 9.3.6, 9.3.9 and 9.3.10, printed pp.138–139; §9.4 Lemma 9.4.6 to Theorem 9.4.9 with proof, pp.140–142; §9.5 Lemma 9.5.3 with proof, pp.142–143; §9.6 Definition 9.6.1 to Lemma 9.6.9, pp.143–144; §10.2–10.4 (orders, integrality, maximal orders), pp.152–156; §13.3 Proposition 13.3.4 and Theorem 13.3.11, pp.199–200; Lemma 13.4.9, p.204; §14.7 to the proof of Main Theorem 14.7.4, pp.225–227; §15.2 Definition 15.2.2 to Lemma 15.2.15, pp.234–237; §15.3 Lemma 15.3.8, p.238; §15.4 to Lemma 15.4.7, pp.238–239; §15.5 Lemma 15.5.1 to Example 15.5.7, pp.240–241.
- Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang, *CM values of higher automorphic Green functions for orthogonal groups* (arXiv:1912.12084v2, 71 pages (printed = physical); published Invent. Math. 225 (2021) not collated), https://arxiv.org/pdf/1912.12084v2: §7.1, Definition 7.1, Lemmas 7.2–7.3 with the proof of 7.3, pp.44–45; Corollary 7.18 and its proof, pp.56–57; §6.2 (the lattice of trace-zero matrices), pp.28–29.
- Ilya Khayutin, *Joint equidistribution of CM points* (arXiv:1710.04557v3, 118 pages; Annals of Math. 189 (2019), Appendix B.2 (Lemma B.1 = arXiv Lemma 168)), https://arxiv.org/pdf/1710.04557v3: Appendix B.2, Lemma 168 (B.1) and Remark 169 (B.2).
- Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, *Endo-parameters for p-adic classical groups* (arXiv:1611.02667v3, 81 pages (printed = physical)), https://arxiv.org/pdf/1611.02667v3: §3.1 Lemma 3.1 with proof, p.10; §§3.2–3.5, Remarks 3.7–3.11, Proposition 3.12, Propositions 3.13–3.15 with proofs, Remark 3.16, pp.12–16.
- Daniel Skodlerack, Shaun Stevens, *Intertwining semisimple characters for p-adic classical groups* (arXiv:1503.08882v3, 41 pages; published Nagoya Math. J. 238 (2020) 137–205 not collated), https://arxiv.org/pdf/1503.08882v3: §4 (Witt groups): Theorem 4.1, Definitions 4.2 and 4.5, Example 4.3, Theorem 4.4, Proposition 4.6, Lemma 4.7, the proof of Theorem 4.4, pp.8–11.
- Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?* (arXiv:1511.02212v1, 38 pages), https://arxiv.org/pdf/1511.02212v1: §3.1–3.2.1, pp.7–13 (including Lemma 3.1); §5.1–5.3, Definition 5.1 to Remark 5.7, pp.24–27.
- Wei Zhang, *Weil representation and arithmetic fundamental lemma* (arXiv:1909.02697, 79 pages; Annals of Math. 193 (2021), §1.2 pp.869–870 cited through the arXiv text), https://arxiv.org/pdf/1909.02697: §1.2, (1.2)–(1.4).
- Spencer Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods* (arXiv:1911.07907v3 (maintainer-cleared copy, free on arXiv)), https://arxiv.org/pdf/1911.07907v3: §3.2, (3.5)–(3.7), pp.25–26; §3.3, Remark 3.9, p.29.
- Chao Li, Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities* (arXiv:1908.01701v3, 92 pages), https://arxiv.org/pdf/1908.01701v3: §1.7, physical pp.8–9.
- Richard Elman, Nikita Karpenko, Alexander Merkurjev, *The algebraic and geometric theory of quadratic forms* (AMS Colloquium Publications 56 (2008), authors’ free copy, 443 physical pages; printed = physical − 8 in Chapter II), https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf: §12–§13 (quadratic algebras, the discriminant and the Arf invariant), printed pp.60–62; §35 opening (u-invariant; finite fields via Chevalley–Warning), printed p.161.
- Jonas Bergström, Carel Faber, Sam Payne, *Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves* (arXiv:2206.07759v2, 31 pages), https://arxiv.org/pdf/2206.07759v2: §6, quadric surfaces and display (6), pp.9–10.
- Gaëtan Chenevier, Olivier Taïbi, *Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms* (arXiv:1907.08783, 62 pages (printed = physical); Publ. Math. IHÉS 131 (2020) not collated), https://arxiv.org/pdf/1907.08783: Section 3.2: regular forms over rings, GSpin and Spin, (3.2.1), Theorem 3.5 with proof, Corollary 3.6, Proposition 3.7 with proof, pp.28–30.
- François Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin’s trick for K3 surfaces, and the Tate conjecture* (Annals of Math. 184 (2016) 487–526, published PDF from the Annals site (printed = physical + 486)), https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf: §2.2 and Proposition 2.9 with proof, pp.500–502; Theorem 2.10, pp.502–503; Proposition 4.3 proof, p.520; Lemmas 4.5–4.6, pp.520–521; proof of Theorem 1.3, p.523.
- Max Lieblich, Davesh Maulik, Andrew Snowden, *Finiteness of K3 surfaces and the Tate conjecture* (arXiv:1107.1221, 20 pages (printed = physical); Ann. Sci. ÉNS 47 (2014) not collated), https://arxiv.org/pdf/1107.1221: §2.1, Lemma 2.1.1 and Proposition 2.1.2 with proof, p.3; §3.5, Lemmas 3.5.1–3.5.2 and Proposition 3.5.3, pp.15–16.
- Yingkun Li, *Algebraicity of higher Green functions at a CM point* (arXiv:2106.13653v2, 42 pages (printed = physical); Invent. Math. 234 (2023) not collated), https://arxiv.org/pdf/2106.13653v2: §2.4, (2.4.1)–(2.4.6) and Proposition 2.6 with proof, pp.16–17.
- Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings* (arXiv:2009.07225v4, 63 pages), https://arxiv.org/pdf/2009.07225v4: §3.1, Theorem 3.1.7 to Remark 3.1.9, pp.52–53.
- Rainer Schulze-Pillot, *Lecture notes on quadratic forms and their arithmetic* (arXiv:2008.12847v2), https://arxiv.org/pdf/2008.12847v2: §9.2, Lemma 9.19, Definition/Lemma 9.20, printed pp.126–127.
- Brian Conrad, *Reductive group schemes* (Autour des schémas en groupes I, Panoramas et Synthèses 42–43 (2014); author’s free copy (maintainer-cleared, printed = physical)), http://math.stanford.edu/~conrad/papers/luminysga3.pdf: Appendix C: C.1–C.2 (pp.302–318) and C.4–C.5 (spin groups, Clifford norm, Pin groups and spinor norm, pp.336–356), read for statements.

## How the targets fit together

§2.10 is used by §§2.11, 2.15 and 2.19 (local-global arguments, completions, discriminant ideals). §2.11 uses §2.10 and GlobalQuadraticForms Layer 6 for the norm theorem. §2.12 feeds §2.14 (residue fields) and the quadric surfaces. §2.13 uses Tau Ceti’s genus theory and the base plan’s atomic forms. §2.14 uses §2.12 for Hensel lifts and the Tau Ceti spinor norm; its integral spinor image refines the base plan’s spinor nodes (2.4). §2.15 uses the trace form to import the quadratic classification and §2.10 for genera; §2.16 is self-contained local algebra; §2.17 completes the base plan’s §2.9; §2.18 uses §§2.12 and 2.14; §2.19 uses §2.10 and QuadraticFormInvariants Layer 6.

## Targets

### 2.10 Lattices over a Dedekind domain: pseudobases, completion and the local-global dictionary

The base plan defines integral quadratic lattices over a Dedekind domain, their localizations and the descent from a DVR completion. The targets below supply what every local-global argument about such lattices uses: the structure of a lattice as a sum of fractional-ideal multiples of vectors with its Steinitz class, completion at a finite place in the ambient completed space, the bijection between lattices and almost-everywhere-standard families of local lattices, and the index and discriminant ideals.

<a id="lattice-pseudobasis"></a>
#### Pseudobases and invariant factors of lattices over a Dedekind domain

`GN.2/lattice-pseudobasis` · theorem · `Submodule.IsLattice.exists_pseudobasis`

Let R be a Dedekind domain with fraction field F, V an n-dimensional F-vector space and M ⊆ V an R-lattice (a finitely generated R-submodule spanning V; Mathlib's Submodule.IsLattice F M). (a) For every F-basis y_1,…,y_n of V there are x_1,…,x_n ∈ M and nonzero fractional ideals 𝔞_1,…,𝔞_n of R with M = 𝔞_1x_1 ⊕ ⋯ ⊕ 𝔞_nx_n and x_j ∈ Fy_1 + ⋯ + Fy_j for every j (a pseudobasis with coefficient ideals 𝔞_j). (b) Dropping the triangularity condition, one may take 𝔞_1 = ⋯ = 𝔞_{n−1} = R, so M ≅ R^{n−1} ⊕ 𝔞 as R-modules. (c) For two R-lattices M, N ⊆ V there is a common pseudobasis x_1,…,x_n with M = ⊕𝔞_ix_i and N = ⊕𝔟_ix_i such that the ideals 𝔡_i = 𝔟_i𝔞_i^{−1} satisfy 𝔡_1 | 𝔡_2 | ⋯ | 𝔡_n; these invariant factors of N relative to M are unique. In particular every R-lattice is a finitely generated projective R-module, free exactly when it has a pseudobasis with all coefficient ideals principal.

*Hypotheses.*

- R a Dedekind domain (not a field), F = Frac R, V finite-dimensional over F; n = 0 allowed (empty pseudobasis).
- Fractional ideals are nonzero R-submodules of F; Mathlib's FractionalIdeal R⁰ F.

*Proof sketch.*

1. (a) Induction on n. Put W = Fy_1 + ⋯ + Fy_{n−1} and N = M ∩ W, an R-lattice in W. The coordinate of y_n maps M onto a nonzero finitely generated R-submodule 𝔞_n of F, a fractional ideal, which is invertible because R is Dedekind (FractionalIdeal.mul_inv_cancel_iff); an invertible ideal is projective, so M → 𝔞_n splits and M = N ⊕ 𝔞_nx_n for a lift x_n. Apply induction to N.
2. (b) Steinitz's lemma 𝔞 ⊕ 𝔟 ≅ R ⊕ 𝔞𝔟 for nonzero fractional ideals (choose 𝔞' in the class of 𝔞 coprime to 𝔟 by IsDedekindDomain.exists_sup_span_eq and use 𝔞' + 𝔟 = R), applied n − 1 times.
3. (c) Apply (a) to M with a basis adapted to N and run the elementary-divisor argument prime by prime: at every localization R_(𝔭), a PID, Smith normal form (Submodule.exists_smith_normal_form_of_le) gives the local exponents, and the global 𝔡_i are reassembled by unique factorization; uniqueness is the uniqueness of the local exponents.

*Checks.*

- R = ℤ: every lattice is free and (a) is the Hermite normal form of a basis.
- R = ℤ[√−5], M = 𝔭 = (2, 1+√−5) ⊂ ℚ(√−5): n = 1, the only coefficient ideal is 𝔭 itself (up to principal ideals) and M is not free.
- Invariant factors of 2ℤ ⊕ 6ℤ relative to ℤ²: (2), (6).

*Needs:* Mathlib `Submodule.IsLattice`; Mathlib `FractionalIdeal`; Mathlib `FractionalIdeal.mul_inv_cancel_iff`; Mathlib `IsDedekindDomain.exists_sup_span_eq`; Mathlib `Submodule.exists_smith_normal_form_of_le`; Mathlib `Module.Projective`; `GN.2/lattice-localization` (base plan).

*Source:* John Voight (Voight2026), Theorem 9.3.6 with proof, printed p.138; Theorem 9.3.9, p.139; 9.3.10, p.139 (post-publication v1.0.7u): Theorem 9.3.6 decomposes every lattice over a Dedekind domain as a direct sum of fractional-ideal multiples of vectors triangular in a given basis; 9.3.10 records the variant with all but one coefficient ideal trivial; Theorem 9.3.9 is the common pseudobasis with dividing invariant factors.

<a id="lattice-steinitz-class"></a>
#### The Steinitz class of a lattice

`GN.2/lattice-steinitz-class` · definition

For an R-lattice M in an n-dimensional F-space V over a Dedekind domain R with pseudobasis M = 𝔞_1x_1 ⊕ ⋯ ⊕ 𝔞_nx_n (lattice-pseudobasis), the Steinitz class of M is st(M) = [𝔞_1⋯𝔞_n] ∈ Cl(R) (Mathlib's ClassGroup R; st(M) = 1 for n = 0). It does not depend on the pseudobasis, depends only on the isomorphism class of M as an R-module, and together with n classifies finitely generated torsion-free R-modules: M ≅ R^{n−1} ⊕ 𝔞 with [𝔞] = st(M) for n ≥ 1.

*Hypotheses.*

- R Dedekind, F = Frac R, M ⊆ V an R-lattice; the class group is that of R, not a narrow or ray class group.

*Uses.*

- Lipnowski–Tsimerman, Definition 5.3 and Remark 5.7 (arXiv:1511.02212v1, §5.2–5.3): free unimodular hermitian O_L-lattices are the projective ones of trivial Steinitz class; free-projective-comparison.
- lattice-local-global-dictionary (this packet): a lattice is locally free at every prime, whatever its Steinitz class.
- trace-unimodular-lattice (this packet): the existence theorem produces projective O_F-lattices whose Steinitz class is not controlled.

*API.*

- `Submodule.IsLattice.steinitzClass` (data): st(M) ∈ ClassGroup R, defined from any pseudobasis.
- `Submodule.IsLattice.steinitzClass_eq_of_pseudobasis` (characterisation): For every pseudobasis with coefficient ideals 𝔞_i, st(M) is the class of ∏𝔞_i.
- `Submodule.IsLattice.steinitzClass_eq_of_linearEquiv` (other): R-linearly isomorphic lattices (in possibly different spaces) have equal Steinitz classes.
- `Submodule.IsLattice.free_iff_steinitzClass_eq_one` (characterisation): For n ≥ 1, M is a free R-module iff st(M) = 1.
- `Submodule.IsLattice.steinitzClass_prod` (relation): st(M ⊕ N) = st(M)·st(N) for lattices in V ⊕ W.
- `Submodule.IsLattice.steinitzClass_fractionalIdeal` (example): For a nonzero fractional ideal 𝔞 ⊆ F (n = 1), st(𝔞) = [𝔞].
- `Submodule.IsLattice.steinitzClass_smul` (simp): st(cM) = st(M) for c ∈ F×; more generally st(𝔟M) = [𝔟]^n st(M).

*Unit tests.*

- `steinitzClass_int` (degenerate): For R = ℤ every lattice M ⊆ ℚ^n has steinitzClass M = 1, and M is free.
- `steinitzClass_sqrt_neg_five` (computation): For R = ℤ[√−5] and 𝔭 = (2, 1+√−5) viewed in F = ℚ(√−5), steinitzClass 𝔭 ≠ 1, so 𝔭 is not a free R-module.
- `steinitzClass_sqrt_neg_five_sq` (computation): For the same 𝔭, the lattice 𝔭 ⊕ 𝔭 ⊆ F² has steinitzClass 1 (Cl(R) has order 2), hence is free of rank 2.
- `steinitzClass_not_rank` (non-example): The Steinitz class is not determined by local data: 𝔭 and R are isomorphic after localization at every prime, yet steinitzClass 𝔭 ≠ steinitzClass R.

*Proof sketch.*

1. Independence: two pseudobases differ by a matrix g ∈ GL_n(F) with g·(⊕𝔞_i) = ⊕𝔟_i; comparing the top exterior powers gives 𝔟_1⋯𝔟_n = det(g)·𝔞_1⋯𝔞_n, so the classes agree.
2. Classification: lattice-pseudobasis (b) gives M ≅ R^{n−1} ⊕ 𝔞; R^{n−1} ⊕ 𝔞 ≅ R^{n−1} ⊕ 𝔟 forces [𝔞] = [𝔟] by the top exterior power.

*Checks.*

- Over a PID every lattice has trivial Steinitz class.
- 𝔭 = (2, 1+√−5) in ℤ[√−5] has nontrivial class and 𝔭 ⊕ 𝔭 has trivial class, so 𝔭 ⊕ 𝔭 ≅ R² although 𝔭 is not free.

*Needs:* `lattice-pseudobasis`; Mathlib `ClassGroup`; Mathlib `ClassGroup.mk0`; Mathlib `ClassGroup.mk0_eq_one_iff`.

*Source:* John Voight (Voight2026), 9.3.10, printed p.139; Exercise 9.7: Defines the Steinitz class of a lattice from a pseudobasis, records its well-definedness (left as Exercise 9.7) and the decomposition with all coefficient ideals but one equal to R.

<a id="lattice-completion"></a>
#### Completion of a lattice at a finite place

`GN.2/lattice-completion` · construction

Let R be a Dedekind domain with fraction field F, v a height-one prime of R (Mathlib's IsDedekindDomain.HeightOneSpectrum R), F_v = adicCompletion F v and R_v = adicCompletionIntegers F v, and V_v = F_v ⊗_F V. For an R-lattice L ⊆ V its completion L_v ⊆ V_v is the R_v-span of the image of L. It is a full R_v-lattice; the natural map R_v ⊗_R L → V_v is injective with image L_v; L_v depends only on the localization L_(v); and if q : V → F is a quadratic map with q(L) ⊆ R, then the base-changed form q_v (Tau Ceti QuadraticForm.atFinitePlace when F is a number field) satisfies q_v(L_v) ⊆ R_v. Completion is monotone, commutes with finite sums and intersections of lattices, and sends cL to cL_v.

*Hypotheses.*

- R Dedekind, not a field; V finite-dimensional over F; v ranges over the height-one primes (the finite places).
- No freeness of L is assumed; L_v is free because R_v is a DVR.

*Uses.*

- integral-genus (base packet): the genus relation compares the completed lattices at every finite place.
- lattice-local-global-dictionary (this packet): the completed form of the dictionary.
- genus-adelic-double-coset (this packet): the stabilizers of the L_v are the compact open subgroups of the adelic orthogonal group.
- Li, Algebraicity of higher Green functions, §2.4 (2.28): L_h = V(F) ∩ h⁻¹L̂ is defined through the completed lattices.

*API.*

- `IntegralQuadraticLattice.completion` (constructor): The R_v-lattice L_v ⊆ V_v, with the restricted integral quadratic form q_v.
- `IntegralQuadraticLattice.completion_eq_range_tensor` (characterisation): L_v is the image of the injective map R_v ⊗_R L → V_v.
- `IntegralQuadraticLattice.completion_isLattice` (instance): L_v is a full R_v-lattice in V_v (Submodule.IsLattice F_v).
- `IntegralQuadraticLattice.completion_inf_eq_localize` (characterisation): L_v ∩ V = L_(v), the localization at v (base packet lattice-localization).
- `IntegralQuadraticLattice.completion_localize` (simp): The completion of L_(v) equals L_v.
- `IntegralQuadraticLattice.completion_mono` (functoriality): L ⊆ M implies L_v ⊆ M_v; an integral isometry g with gL = M gives g_vL_v = M_v.
- `IntegralQuadraticLattice.completion_sup` (simp): (L + M)_v = L_v + M_v and (L ∩ M)_v = L_v ∩ M_v.
- `IntegralQuadraticLattice.completion_smul` (simp): (cL)_v = c·L_v for c ∈ F×.
- `IntegralQuadraticLattice.completion_integral` (compatibility): q_v(L_v) ⊆ R_v, where q_v is the base change of q to F_v (QuadraticForm.atFinitePlace for number fields).

*Unit tests.*

- `completion_int_two` (computation): For R = ℤ, L = ℤ ⊆ ℚ and v = (2), the completion is ℤ_2 ⊆ ℚ_2 (as a subset of adicCompletion ℚ v ≅ ℚ_2).
- `completion_two_int_at_three` (computation): For L = 2ℤ, the completion at (3) is the full ring ℤ_3 and at (2) it is 2ℤ_2.
- `completion_ne_of_ne_at` (non-example): ℤ and (1/2)ℤ have equal completions at every odd prime but different completions at 2; completion at one place does not determine the lattice.
- `completion_zero_dim` (degenerate): In V = 0 the only lattice is 0 and its completion is 0.

*Proof sketch.*

1. L is flat over R (torsion-free over a Dedekind domain) and R_v is flat over R, so R_v ⊗_R L → R_v ⊗_R V = V_v is injective.
2. The image is finitely generated over R_v and spans V_v, so it is a full lattice; it is the R_v-span of L by construction.
3. Since L_(v) = R_(v)L and R_(v) → R_v, the completion of L equals that of L_(v); combine with completed-lattice-descent (R_(v) a DVR) to get L_v ∩ V = L_(v).
4. Integrality: q_v(Σ a_ix_i) = Σ a_i²q(x_i) + Σ_{i<j} a_ia_j polar(x_i,x_j) with a_i ∈ R_v and q(x_i), polar(x_i,x_j) ∈ R.

*Checks.*

- R = ℤ, L = ℤ ⊂ ℚ, v = (2): L_v = ℤ_2.
- L = 2ℤ: L_2 = 2ℤ_2 while L_3 = ℤ_3.
- For the nonfree 𝔭 = (2, 1+√−5) ⊂ ℚ(√−5), the completion at 𝔭 is the principal ideal π R_𝔭 of the local ring.

*Needs:* Mathlib `IsDedekindDomain.HeightOneSpectrum`; Mathlib `IsDedekindDomain.HeightOneSpectrum.adicCompletion`; Mathlib `IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`; Mathlib `Submodule.IsLattice`; Tau Ceti `QuadraticForm.atFinitePlace`; `GN.2/lattice-localization` (base plan); `GN.2/completed-lattice-descent` (base plan); `GN.2/integral-quadratic-lattice` (base plan).

*Source:* John Voight (Voight2026), §9.5, (9.5.1)–(9.5.2) and Lemma 9.5.3 with proof, printed pp.142–143: Defines the completion of a DVR, shows R = F ∩ R_𝔭 and the residue isomorphisms R/𝔭^e ≅ R_𝔭/𝔭^eR_𝔭, and proves that M ↦ M ⊗ R_𝔭 and N ↦ N ∩ V are inverse bijections between lattices; this construction composes that with localization.

<a id="lattice-local-global-dictionary"></a>
#### Local-global dictionary for lattices

`GN.2/lattice-local-global-dictionary` · theorem · `IntegralQuadraticLattice.localGlobalEquiv`

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

*Needs:* `GN.2/lattice-localization` (base plan); `GN.2/lattice-intersection-localizations` (base plan); `GN.2/lattice-inclusion-localizations` (base plan); `GN.2/completed-lattice-descent` (base plan); `lattice-completion`; Mathlib `Submodule.IsLattice`.

*Source:* John Voight (Voight2026), Theorem 9.4.9 with proof, printed pp.141–142; Lemma 9.5.3 and the remark after it, p.143: Theorem 9.4.9 is the bijection between lattices and almost-everywhere-standard families of local lattices with its proof by intersection; the paragraph after Lemma 9.5.3 extends the dictionary to completions.

<a id="lattice-index-ideal"></a>
#### The R-index of two lattices

`GN.2/lattice-index-ideal` · definition

For R-lattices M, N in an n-dimensional F-space V over a noetherian domain R, the R-index [M : N]_R is the R-submodule of F generated by det δ for all δ ∈ End_F(V) with δ(M) ⊆ N. It is a nonzero R-submodule; [αM : N] = det(α)^{−1}[M : N] for α ∈ Aut_F(V); for free M and N it is generated by the determinant of a change of basis; it commutes with localization; for projective M, N it is an invertible fractional ideal, and when N ⊆ M one has [M : N]_R = R iff M = N. Over a Dedekind domain with N ⊆ M it is the product of the invariant factors of the torsion module M/N, and over ℤ it is generated by #(M/N).

*Hypotheses.*

- R noetherian domain for the definition; Dedekind for the invariant-factor and multiplicativity statements.
- N ⊆ M is not required for the definition; [M : N]_R may be a non-integral fractional ideal.

*Uses.*

- lattice-discriminant-ideal (this packet): disc(N) = [M : N]² disc(M).
- finite-dvr-determinant-index (this packet): for F(T) ⊆ T over a DVR the index is (det F), and its cardinality is q^{v(det F)}.
- Voight, Quaternion algebras, Lemma 15.2.15 (printed p.237) and 15.4.6: disc(I) = [J : I]²disc(J) and discrd(I) = [J : I]discrd(J) compare discriminants of lattices in a quaternion algebra.

*API.*

- `latticeIndex` (constructor): [M : N]_R as a Submodule R F generated by the determinants det δ with δ(M) ⊆ N.
- `latticeIndex_ne_bot` (other): [M : N]_R ≠ 0.
- `latticeIndex_map` (simp): [αM : N]_R = (det α)^{−1}·[M : N]_R for α ∈ Aut_F(V).
- `latticeIndex_of_basis` (characterisation): For bases b of M and c of N, [M : N]_R = R·det(b.toMatrix c).
- `latticeIndex_localize` (compatibility): ([M : N]_R)_(𝔭) = [M_(𝔭) : N_(𝔭)]_{R_(𝔭)}.
- `latticeIndex_eq_top_iff` (characterisation): For projective N ⊆ M: [M : N]_R = R iff M = N.
- `latticeIndex_trans` (relation): Over a Dedekind domain, [M : P]_R = [M : N]_R·[N : P]_R.
- `latticeIndex_int` (compatibility): For R = ℤ and N ⊆ M, [M : N]_ℤ = ℤ·#(M/N), Mathlib’s AddSubgroup.index of N in M.

*Unit tests.*

- `latticeIndex_smul` (computation): For r ∈ R nonzero and V of dimension n, [M : rM]_R = r^n·R.
- `latticeIndex_int_example` (computation): [ℤ² : ℤ ⊕ 2ℤ]_ℤ = 2ℤ, and [ℤ ⊕ 2ℤ : ℤ²]_ℤ = (1/2)ℤ.
- `latticeIndex_self` (degenerate): [M : M]_R = R, and in dimension 0 every index is R.
- `latticeIndex_not_card` (non-example): The index is a determinant ideal, not a module length: for R = ℤ[i] and M = R, N = (1+i)R, [M : N] = (1+i), whose norm 2 is #(M/N); the ideal itself is not (2).

*Proof sketch.*

1. Nonzero: some nonzero r ∈ R has rM ⊆ N, so r^n ∈ [M : N].
2. Free case: every δ with δ(M) ⊆ N factors as δ = δ₀∘(δ₀^{−1}δ) with δ₀ the change of basis and δ₀^{−1}δ an R-endomorphism of M, whose determinant lies in R.
3. Localization: clear denominators of finitely many generators of M (Voight Lemma 9.6.7).
4. Dedekind case: compute locally with Smith normal form and reassemble by unique factorization; multiplicativity [M : P] = [M : N][N : P] holds locally because determinants multiply.

*Checks.*

- [M : rM]_R = r^nR (Voight Example 9.6.5).
- [ℤ² : ℤ ⊕ 2ℤ]_ℤ = 2ℤ.

*Needs:* Mathlib `LinearMap.det`; Mathlib `Submodule.IsLattice`; Mathlib `Submodule.exists_smith_normal_form_of_le`; Mathlib `Module.torsion_by_prime_power_decomposition`; `GN.2/lattice-localization` (base plan); `lattice-pseudobasis`.

*Source:* John Voight (Voight2026), Definition 9.6.1, Lemmas 9.6.3–9.6.4, Examples 9.6.5–9.6.6, Lemma 9.6.7, Proposition 9.6.8, Lemma 9.6.9, printed pp.143–144: Defines the R-index by determinants of maps carrying one lattice into the other, shows its behaviour under automorphisms, its principal generator for free lattices, its compatibility with localization, its invertibility for projective lattices and its description by invariant factors over a Dedekind domain.

<a id="lattice-discriminant-ideal"></a>
#### Discriminant ideal and unimodularity of a quadratic lattice

`GN.2/lattice-discriminant-ideal` · definition

Let R be a Dedekind domain, F = Frac R, (V, q) a nondegenerate quadratic space of dimension n over F with polar form b(x,y) = q(x+y) − q(x) − q(y), and L ⊆ V an R-lattice. The discriminant ideal 𝔡(L) is the R-submodule of F generated by det(b(x_i,x_j))_{i,j} for all x_1,…,x_n ∈ L, and L^♯ = {y ∈ V : b(y, L) ⊆ R} is its dual lattice (the base packet's hermitian-dual-lattice with trivial involution). Then 𝔡(L) = [L^♯ : L]_R whenever L ⊆ L^♯ (that is, b is R-valued on L), 𝔡(N) = [L : N]_R²·𝔡(L) for any two lattices N, L, and for a pseudobasis L = ⊕𝔞_ix_i one has 𝔡(L) = det(b(x_i,x_j))·(𝔞_1⋯𝔞_n)². L is unimodular when L^♯ = L, equivalently (for L ⊆ L^♯) 𝔡(L) = R. For a different R-valued pairing Tr∘b the same construction gives the trace dual used for trace-unimodular lattices.

*Hypotheses.*

- R Dedekind; q nondegenerate on V; the polar form b is not divided by 2, so the standard lattice ℤ ⊆ (ℚ, x²) has 𝔡 = 2ℤ.
- Comparison with Tau Ceti: for R = ℤ, 𝔡(L) is generated by the Gram determinant of the polar form, and #(L^♯/L) = |det| (IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet).

*Uses.*

- Li, Algebraicity of higher Green functions, §2.4 (2.25)–(2.30): trace-even O_F-lattices with L′ = L are the unimodular lattices for the trace pairing.
- Lipnowski–Tsimerman, Definition 5.3: unimodular hermitian lattices M = M^∨.
- quaternion-order-discriminant (this packet): the reduced-trace pairing on an order.

*API.*

- `IntegralQuadraticLattice.discrIdeal` (constructor): 𝔡(L), the R-submodule of F spanned by Gram determinants of n-tuples in L.
- `IntegralQuadraticLattice.dual` (constructor): L^♯ = {y : b(y,L) ⊆ R}, the base packet hermitian dual with trivial involution.
- `IntegralQuadraticLattice.discrIdeal_of_pseudobasis` (characterisation): 𝔡(L) = det(b(x_i,x_j))·(𝔞_1⋯𝔞_n)² for a pseudobasis.
- `IntegralQuadraticLattice.discrIdeal_index` (relation): 𝔡(N) = [L : N]_R²·𝔡(L).
- `IntegralQuadraticLattice.IsUnimodular` (data): The predicate L^♯ = L.
- `IntegralQuadraticLattice.isUnimodular_iff_discrIdeal` (characterisation): For L ⊆ L^♯: L is unimodular iff 𝔡(L) = R.
- `IntegralQuadraticLattice.discrIdeal_localize` (compatibility): 𝔡(L_(𝔭)) = 𝔡(L)_(𝔭) and 𝔡(L_v) = 𝔡(L)R_v.
- `IntegralQuadraticLattice.discrIdeal_int` (compatibility): For R = ℤ, 𝔡(L) = ℤ·det(Gram of the polar form) and its generator agrees with Tau Ceti’s gram determinant of the bilinear lattice (polar form).

*Unit tests.*

- `discrIdeal_sq_int` (computation): For R = ℤ, L = ℤ ⊆ ℚ with q(x) = x², discrIdeal L = 2ℤ and L is not unimodular.
- `discrIdeal_hyperbolic` (computation): The hyperbolic plane ℤe ⊕ ℤf with q(xe+yf) = xy has discrIdeal = ℤ and is unimodular.
- `discrIdeal_scale` (characterisation): discrIdeal (2L) = 2^{2n}·discrIdeal L for a lattice of rank n.
- `discrIdeal_zero_dim` (degenerate): In dimension 0 the discriminant ideal is R and the zero lattice is unimodular.

*Proof sketch.*

1. The generators are determinants of Gram matrices of families in L; for a pseudobasis every family in L is Σ a_{ij}x_j with a_{ij} ∈ 𝔞_j, and the determinant expands into det(b(x_i,x_j))·(det a)² with det a ∈ 𝔞_1⋯𝔞_n.
2. 𝔡(N) = [L : N]²𝔡(L): both sides are computed locally, where they are the transformation law of Gram determinants.
3. L^♯ is a lattice (base packet hermitian-dual-lattice); with the pseudobasis of L the dual pseudobasis gives L^♯ = ⊕ 𝔞_i^{−1}x_i^♯ and [L^♯ : L] = 𝔡(L).

*Checks.*

- ℤ ⊆ (ℚ, x²): 𝔡 = 2ℤ and ℤ^♯ = (1/2)ℤ.
- The hyperbolic plane ℤe ⊕ ℤf with q(xe + yf) = xy: 𝔡 = ℤ (det = −1), unimodular.

*Needs:* `GN.2/integral-quadratic-lattice` (base plan); `GN.2/hermitian-dual-lattice` (base plan); `lattice-pseudobasis`; `lattice-index-ideal`; Mathlib `QuadraticMap.polarBilin`; Mathlib `Matrix.det`; Tau Ceti `TauCeti.IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet`.

*Source:* John Voight (Voight2026), Definition 15.2.2, Lemma 15.2.5, 15.2.8 and Lemma 15.2.15, printed pp.234–237; §15.3, Lemma 15.3.8, p.238: Defines the discriminant of a lattice as the module generated by Gram determinants of its n-tuples (for the reduced-trace pairing), gives the transformation law under a change of family, the pseudobasis formula with the squared product of coefficient ideals, and disc(I) = [J : I]²disc(J); §15.3 applies the same definition to quadratic modules and shows that nonsingularity is equivalent to the discriminant being the unit ideal. The construction here is the same for an arbitrary nondegenerate symmetric pairing.

### 2.11 Quaternion orders and reduced norms

Quaternion orders are the coefficient rings of the quaternionic hermitian lattices of the base plan (2.8) and the endomorphism rings that consumers in the CM and abelian-variety roadmaps need. The general notion of an order and of a maximal order is planned here and imported by ClassicalArithmeticCompletion.

<a id="quaternion-order"></a>
#### Orders in finite-dimensional algebras and quaternion orders

`GN.2/quaternion-order` · definition

Let R be a noetherian domain with fraction field F and B a finite-dimensional F-algebra. An R-order in B is an R-lattice O ⊆ B (finitely generated, spanning B over F) that is a subring, so 1 ∈ O and R ⊆ O; it is maximal if it is not properly contained in another R-order. Every element of an order is integral over R. A quaternion order is an order in a quaternion algebra B = (a, b | F); it is stable under the standard involution x ↦ x̄ (as x̄ = trd(x) − x with trd(x) ∈ R), and the reduced norm and trace restrict to R-valued maps on it.

*Hypotheses.*

- R noetherian domain; for quaternion orders R is a Dedekind domain with F of characteristic ≠ 2 where the standard involution is used.
- This is the general notion that ClassicalArithmeticCompletion CA.7 (orders in finite-dimensional algebras, maximal orders) also uses; it is planned here and CA.7 imports it.

*Uses.*

- quaternionic-integral-hermitian-data (base packet): the coefficient ring of a quaternionic hermitian lattice is a star-stable quaternion order.
- ComplexMultiplicationAndExplicitReciprocity CM.5 (Deuring classification): endomorphism rings of supersingular curves are maximal orders in B_{p,∞}.
- ClassicalArithmeticCompletion CA.7: orders, left orders and maximal orders in group algebras and Galois module structure.
- model-ring-positive-involution (this packet): M_m(O_D) for a maximal order O_D of a definite quaternion algebra.

*API.*

- `AlgebraOrder` (structure): An R-subalgebra of B whose underlying R-submodule is a lattice (Submodule.IsLattice F).
- `AlgebraOrder.IsMaximal` (data): Maximality among R-orders in B.
- `AlgebraOrder.isIntegral` (other): Every element of an order is integral over R.
- `AlgebraOrder.localize` (functoriality): O_(𝔭) = R_(𝔭)O is an R_(𝔭)-order; maximality is local for R Dedekind (Voight Lemma 10.4.3).
- `QuaternionOrder.star_mem` (characterisation): For a quaternion order, x ∈ O implies x̄ ∈ O.
- `QuaternionOrder.trd_mem` (simp): trd(x), nrd(x) ∈ R for x ∈ O.

*Unit tests.*

- `algebraOrder_matrix` (computation): M₂(ℤ) is a maximal ℤ-order in M₂(ℚ).
- `algebraOrder_lipschitz_not_maximal` (non-example): The Lipschitz order ℤ⟨i, j⟩ ⊆ (−1, −1 | ℚ) is an order but not maximal: it is strictly contained in the Hurwitz order ℤ⟨i, j, (1+i+j+ij)/2⟩.
- `algebraOrder_field` (compatibility): For B = F a field extension of degree 1 the only order is R; for B a number field the maximal order is the ring of integers (Mathlib NumberField.RingOfIntegers).
- `algebraOrder_not_lattice` (non-example): ℤ[1/2] ⊆ ℚ is a subring but not a ℤ-order (not finitely generated).

*Proof sketch.*

1. Integrality: an element of an order generates a finitely generated R-submodule, hence is integral (Voight Lemma 10.3.2).
2. Standard-involution stability: x ∈ O is integral, so its reduced characteristic polynomial x² − trd(x)x + nrd(x) has coefficients in R (R integrally closed), and x̄ = trd(x) − x ∈ O.

*Checks.*

- M₂(ℤ) ⊆ M₂(ℚ) is a maximal order.
- The Lipschitz order ℤ⟨i, j⟩ in (−1, −1 | ℚ) is an order, not maximal (contained in the Hurwitz order).

*Needs:* Mathlib `Submodule.IsLattice`; Mathlib `QuaternionAlgebra`; Tau Ceti `QuaternionAlgebra.normForm`; QuadraticFormInvariants, layer 2 quaternion algebras and the four fold splitting criterion.

*Source:* John Voight (Voight2026), Definition 10.2.1, printed p.152; Lemma 10.3.2 and 10.4 (maximal orders), pp.154–155: Defines an R-order as a lattice that is a subring, shows its elements are integral, and introduces maximal orders and their local nature.

<a id="quaternion-order-discriminant"></a>
#### Discriminant and reduced discriminant of a quaternion order

`GN.2/quaternion-order-discriminant` · construction

For an R-lattice I in a quaternion algebra B over F (R Dedekind), disc(I) is the R-submodule of F generated by d(α_1, …, α_4) = det(trd(α_iα_j)), and the reduced discriminant discrd(I) is generated by the values of the alternating trilinear form m(α_1, α_2, α_3) = trd((α_1α_2 − α_2α_1)α_3) on I. disc(I) = [J : I]²disc(J) for projective lattices; for R-orders O ⊆ O′, disc(O) = discrd(O)² and discrd(O) = [O′ : O]·discrd(O′) (both fail for lattices that are not orders: see source issue E201); for an order with a free basis disc(O) = d(basis)R. Discriminants localize and complete, and O ⊆ O′ with equal discriminants forces O = O′.

*Hypotheses.*

- R Dedekind with fraction field F; B a quaternion algebra over F; lattices projective.

*Uses.*

- maximal-quaternion-order-criterion (this packet): maximality is detected by discrd(O) = disc(B).
- ComplexMultiplicationAndExplicitReciprocity CM.5: maximal orders of B_{p,∞} have reduced discriminant p.

*API.*

- `QuaternionOrder.disc` (constructor): disc(I) ⊆ F, generated by det(trd(α_iα_j)).
- `QuaternionOrder.discrd` (constructor): discrd(I), generated by trd((α_1α_2 − α_2α_1)α_3).
- `QuaternionOrder.disc_eq_discrd_sq` (relation): disc(O) = discrd(O)² for an R-order O.
- `QuaternionOrder.discrd_index` (relation): discrd(O) = [O′ : O]_R·discrd(O′) for orders O ⊆ O′.
- `QuaternionOrder.eq_of_le_of_disc_eq` (characterisation): O ⊆ O′ and disc O = disc O′ imply O = O′.
- `QuaternionOrder.discrd_localize` (compatibility): discrd(O_(𝔭)) = discrd(O)_(𝔭).

*Unit tests.*

- `discrd_matrix` (computation): discrd(M₂(ℤ)) = ℤ and disc(M₂(ℤ)) = ℤ.
- `discrd_hurwitz` (computation): The Hurwitz order in (−1, −1 | ℚ) has discrd = 2ℤ; the Lipschitz order has discrd = 4ℤ.
- `discrd_lattice_not_order` (non-example): For the lattice I = 2M₂(ℤ), which is not an order, disc(I) = 2⁸ℤ but discrd(I) = 2³ℤ, so disc(I) ≠ discrd(I)²: the square-root relation is a statement about orders.
- `discrd_not_disc` (non-example): disc and discrd differ: disc(Hurwitz) = 4ℤ while discrd(Hurwitz) = 2ℤ.

*Proof sketch.*

1. disc is the discriminant ideal of the reduced-trace pairing (lattice-discriminant-ideal) and inherits its index law (Voight Lemma 15.2.15).
2. m is alternating and well defined on B/F (Voight Lemma 15.4.3); m(α_1, α_2, α_3)² = −d(1, α_1, α_2, α_3), and for an order the values d(1, α_1, α_2, α_3) generate disc(O), giving disc = discrd² (Lemma 15.4.7, valid for orders: an order contains R·1 as a saturated summand, so its index in another order is the index of the images in B/F).

*Checks.*

- discrd(M₂(ℤ)) = ℤ.
- Hurwitz order: discrd = 2ℤ; Lipschitz order ℤ⟨i, j⟩: discrd = 4ℤ = [Hurwitz : Lipschitz]·2ℤ.

*Needs:* `quaternion-order`; `lattice-discriminant-ideal`; `lattice-index-ideal`.

*Source:* John Voight (Voight2026), Definition 15.2.2, Lemma 15.2.5, Corollary 15.2.7, 15.2.8, Lemma 15.2.15, printed pp.234–237; §15.4, Lemma 15.4.3, the reduced discriminant and Lemma 15.4.7, pp.238–239: Defines the discriminant of a lattice in a quaternion algebra by Gram determinants of the reduced trace, proves its transformation and index laws, defines the reduced discriminant through the alternating trilinear form m and proves disc = discrd².

<a id="maximal-quaternion-order-criterion"></a>
#### Maximal quaternion orders and the reduced discriminant

`GN.2/maximal-quaternion-order-criterion` · theorem · `QuaternionOrder.isMaximal_iff_discrd`

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

*Needs:* `quaternion-order`; `quaternion-order-discriminant`; `lattice-local-global-dictionary`.

*Source:* John Voight (Voight2026), Proposition 13.3.4, printed p.199; Theorem 13.3.11, p.200; Lemma 15.5.1, Proposition 15.5.2, Lemma 15.5.3, Example 15.5.4, p.240; Theorem 15.5.5 and Example 15.5.7, p.241: Proves the valuation ring of a local division algebra is the unique maximal order, the existence of maximal orders through discriminants, the local split criterion disc = R, and the global criterion discrd(O) = disc(B) with explicit maximal orders of prime discriminant.

<a id="hasse-schilling-norm-theorem"></a>
#### Reduced norms from a quaternion algebra (Hasse–Schilling, Eichler)

`GN.2/hasse-schilling-norm-theorem` · theorem · `QuaternionAlgebra.range_nrd_eq`

Let F be a number field, B a quaternion algebra over F and Ω the set of real places at which B ramifies. Then nrd(B^×) = F^×_{>_Ω 0} = {x ∈ F^× : x_v > 0 for all v ∈ Ω}. Locally, nrd(B_v^×) = ℝ_{>0} if B_v ≅ ℍ and F_v^× otherwise, and nrd(O_v^×) = R_v^× for a maximal order O_v at a finite place.

*Hypotheses.*

- F a number field; the statement at real places uses the sign at the ramified ones only.

*Uses.*

- Ichino–Prasanna, Hodge classes and the Jacquet–Langlands correspondence, §9.3 (routed item PAPER-ICHINO-PRASANNA-23/017): ν(H(F)^+) = F^× ∩ (𝔸^×)^+ = ν(G(F)^+).
- AbelianSchemesAndArithmeticModuliPartII F4, reduced-norm-class-comparison: the reduced-norm image controls the class-set comparison.

*Proof sketch.*

1. nrd is the norm form of B (Tau Ceti QuaternionAlgebra.normForm), a 4-dimensional quadratic form; x ∈ B^× has nrd(x) = c iff the norm form represents c.
2. Local: if B_v is split the norm form is hyperbolic, hence universal; if B_v is a division algebra over a nonarchimedean field, ⟨−c⟩ ⊥ nrd is 5-dimensional and therefore isotropic, so nrd represents c; at a real ramified place nrd is positive definite (Voight Lemma 13.4.9).
3. Global: by the Hasse principle for representations of scalars (GlobalQuadraticForms Layer 6), c is represented globally iff it is represented at every place.
4. Units of a maximal order: nrd(O_v^×) = R_v^× from the explicit maximal orders (Voight Lemma 13.4.9).

*Checks.*

- B = (−1, −1 | ℚ) (ramified at 2 and ∞): nrd(B^×) = ℚ_{>0}, and 3 = nrd(1 + i + j).
- B = M₂(F): nrd = det is onto F^×.

*Needs:* Tau Ceti `QuaternionAlgebra.normForm`; Tau Ceti `QuadraticForm.LocallyRepresentsScalar`; GlobalQuadraticForms, layer 6 representation and isometry; QuadraticFormInvariants, layer 6 forms over a nonarchimedean local field; `maximal-quaternion-order-criterion`.

*Source:* John Voight (Voight2026), 14.7.1–14.7.2 and Main Theorem 14.7.4 with Lemmas 14.7.5–14.7.6 and its proof, printed pp.225–227; Lemma 13.4.9, p.204: States the local norm groups and that the reduced norm of B^× is the group of elements positive at the real ramified places; Voight proves it by embedding a suitable quadratic field, while this node proves it through the Hasse principle for the norm form.

### 2.12 Quadratic forms over finite fields

QuadraticFormInvariants excludes characteristic 2 and does not state the finite-field classification. These targets give it in all characteristics, with the Arf invariant, and the three quadric surfaces with their automorphism groups.

<a id="finite-field-quadratic-classification"></a>
#### Quadratic forms over a finite field

`GN.2/finite-field-quadratic-classification` · theorem · `QuadraticForm.finiteField_classification`

Let F = 𝔽_q. (a) Every quadratic form of dimension ≥ 3 is isotropic, and every nondegenerate form of dimension ≥ 2 represents every element of F^×. (b) For q odd, nondegenerate quadratic forms are classified by dimension and discriminant in F^×/F^{×2} (two classes in each positive dimension). (c) For q even, nondegenerate (nonsingular) forms of even dimension 2m are classified by dimension and Arf invariant (arf-invariant): the hyperbolic form mH and the form (m−1)H ⊥ [1, c] with c ∉ ℘(F); in each odd dimension there is one nondegenerate form up to isometry.

*Hypotheses.*

- Nondegenerate in characteristic 2 means the polar form has radical of dimension ≤ 1 and q is anisotropic on it (EKM's convention).

*Uses.*

- Bergström–Faber–Payne §6 (routed item PAPER-BERGSTROM-FABER-PAYNE-24/quadric-classification): the orbits of quadric surfaces over 𝔽_q.
- Charles, Lemma 4.5 proof via Lieblich–Maulik–Snowden Lemma 3.5.2 (routed item PAPER-CHARLES-16/115): a nondegenerate form of dimension ≥ 2 over 𝔽_ℓ represents every nonzero element.
- odd-unimodular-unit-representation (this packet): the residue-field step of the Hensel lift.

*Proof sketch.*

1. (a) Chevalley–Warning (Mathlib char_dvd_card_solutions_of_sum_lt) gives a nontrivial zero in dimension ≥ 3; a nondegenerate binary form ⊥ ⟨−c⟩ (or [·,·] ⊥ ⟨c⟩) is isotropic, so the binary form represents c.
2. (b) Split off hyperbolic planes (Witt decomposition, QuadraticFormInvariants Layer 1) down to an anisotropic part of dimension ≤ 2; binary forms are classified by the discriminant (EKM Proposition 13.2), and F^×/F^{×2} has order 2.
3. (c) The same reduction with the Arf invariant as discriminant: Ét₂(𝔽_q) ≅ F/℘(F) ≅ ℤ/2 (EKM §13, Example 13.5).

*Checks.*

- q odd, n = 2: x² + y² is hyperbolic iff −1 is a square iff q ≡ 1 mod 4.
- q = 2, n = 2: xy (Arf 0) and x² + xy + y² (Arf 1) are the two nonsingular binary forms.

*Needs:* Mathlib `char_dvd_card_solutions_of_sum_lt`; Mathlib `FiniteField.isSquare_iff`; Mathlib `FiniteField.exists_root_sum_quadratic`; QuadraticFormInvariants, layer 1 hyperbolic planes and witt theory; `arf-invariant`.

*Source:* Richard Elman, Nikita Karpenko, Alexander Merkurjev (EKM2008), §13, Proposition 13.2 and Example 13.5, printed pp.61–62; §35 (p.161), consequence of Chevalley–Warning: Defines the discriminant of an even-dimensional nondegenerate form as the class of the centre of its even Clifford algebra (the Arf invariant in characteristic 2), shows binary forms are similar iff their discriminants agree, and records that three-dimensional forms over finite fields are isotropic.

<a id="arf-invariant"></a>
#### The Arf invariant

`GN.2/arf-invariant` · definition

Let F be a field of characteristic 2 and q a nonsingular quadratic form of dimension 2m on V, with a symplectic basis e_1, f_1, …, e_m, f_m of its (alternating, nondegenerate) polar form b. The Arf invariant is Arf(q) = Σ_i q(e_i)q(f_i) mod ℘(F), where ℘(x) = x² + x; it is independent of the symplectic basis, additive on orthogonal sums, zero on hyperbolic forms, and is the class of the discriminant algebra (the centre of the even Clifford algebra) in Ét₂(F) ≅ F/℘(F). Over 𝔽_{2^k}, F/℘(F) ≅ ℤ/2.

*Hypotheses.*

- char F = 2; q nonsingular of even dimension (polar form nondegenerate).

*Uses.*

- finite-field-quadratic-classification (this packet): classifies nonsingular forms over 𝔽_{2^k}.
- Bergström–Faber–Payne §6: distinguishes the split and nonsplit quadric surfaces in characteristic 2.

*API.*

- `QuadraticForm.arf` (constructor): Arf(q) ∈ F/℘(F) for a nonsingular even-dimensional form in characteristic 2.
- `QuadraticForm.arf_eq_of_symplecticBasis` (characterisation): Arf(q) = Σ q(e_i)q(f_i) for every symplectic basis.
- `QuadraticForm.arf_orthogonalSum` (simp): Arf(q ⊥ q′) = Arf(q) + Arf(q′).
- `QuadraticForm.arf_hyperbolic` (simp): Arf(mH) = 0.
- `QuadraticForm.arf_isometry` (functoriality): Isometric forms have equal Arf invariants.

*Unit tests.*

- `arf_xy` (degenerate): Arf(xy) = 0 over any field of characteristic 2.
- `arf_F2_anisotropic` (computation): Over 𝔽_2, Arf(x² + xy + y²) = 1 ≠ 0.
- `arf_F4_split` (non-example): The class depends on the field: over 𝔽_4 = {0, 1, ω, ω²}, ℘(𝔽_4) = {0, 1}, so x² + xy + y² has Arf class 0 and is hyperbolic over 𝔽_4 (though anisotropic over 𝔽_2), while x² + xy + ωy² has Arf class ω ≠ 0 and is anisotropic.

*Proof sketch.*

1. Independence: the centre of C₀(q) is the étale algebra F[x]/(x² + x + Arf(q)), an invariant of q (EKM §13); so Arf is well defined.
2. Additivity follows from C₀ of an orthogonal sum; Arf(H) = 0 since q(e)q(f) = 0.

*Checks.*

- Arf(xy) = 0.
- Over 𝔽_2, Arf(x² + xy + y²) = 1.

*Needs:* Mathlib `CliffordAlgebra.even`; Mathlib `QuadraticMap.polarBilin`; Mathlib `FiniteField.card`.

*Source:* Richard Elman, Nikita Karpenko, Alexander Merkurjev (EKM2008), §13, definition of the discriminant and Example 13.5(2), printed pp.61–62: Defines the discriminant as the class of the centre of the even Clifford algebra in Ét₂(F) and computes it in characteristic 2 as Σ a_ib_i modulo ℘(F) for [a_1, b_1] ⊥ ⋯ ⊥ [a_m, b_m], calling it the Arf invariant.

<a id="quadric-surface-classification"></a>
#### Quadric surfaces over a finite field

`GN.2/quadric-surface-classification` · theorem · `quadricSurface_orbits`

Over 𝔽_q there are exactly three PGL₄(𝔽_q)-orbits of reduced irreducible quadric surfaces in ℙ³: the cone Q^con ≅ ℙ(1, 1, 2) (rank 3), the nonsplit smooth quadric Q^nsp (rank 4, isomorphic to ℙ¹ × ℙ¹ over 𝔽_{q²} with Frobenius swapping the rulings, Picard rank 1) and the split quadric Q^spl ≅ ℙ¹ × ℙ¹. Their automorphism groups have orders #Aut(Q^con) = q⁷ − q⁶ − q⁵ + q⁴ = #GL₂(𝔽_q)·q³, #Aut(Q^nsp) = 2(q⁶ − q²) = 2#PGL₂(𝔽_{q²}) and #Aut(Q^spl) = 2(q³ − q)² = 2#PGL₂(𝔽_q)².

*Hypotheses.*

- Reduced irreducible quadrics are those of rank 3 or 4 (rank ≤ 2 gives pairs of planes or a double plane).

*Proof sketch.*

1. Rank 3 forms are unique up to scaling (finite-field-quadratic-classification), giving the cone; rank 4 forms split into two classes (discriminant or Arf), the hyperbolic one giving ℙ¹ × ℙ¹ and the other its Galois twist.
2. Automorphisms: every automorphism extends to PGL₄ (the hyperplane series is complete); compute Aut(ℙ¹ × ℙ¹) = (PGL₂ × PGL₂) ⋊ ℤ/2, its twist PGL₂(𝔽_{q²}) ⋊ Gal, and the cone's automorphisms GL₂(𝔽_q) ⋉ 𝔽_q³.

*Checks.*

- q = 2: #Aut(Q^spl) = 2·36 = 72, #Aut(Q^nsp) = 2·60 = 120, #Aut(Q^con) = 128 − 64 − 32 + 16 = 48 = 6·8.

*Needs:* `finite-field-quadratic-classification`; `arf-invariant`.

*Source:* Jonas Bergström, Carel Faber, Sam Payne (BFP2024), §6, the classification of quadric surfaces and display (6), pp.9–10 (arXiv:2206.07759v2): Lists the three orbits of reduced irreducible quadric surfaces over 𝔽_q with their geometric descriptions and the orders of their automorphism groups, used in a point count of a moduli space.

### 2.13 Binary forms: genus characters and local normal forms

The binary forms, their proper classes and the dictionary with ideal classes of quadratic orders are TauCetiRoadmap IntegralLattices Layer B. What is planned here is the classical genus character χ_d(Q) on forms of discriminant dd′ (possibly imprimitive or of square discriminant), its local factors, the ℤ_p-normal form of a binary form and the link with Tau Ceti’s genus theory of quadratic fields. This is the single owner of the character requested by MultiquadraticPartII RQ.3 and MetaplecticAutomorphicForms MP.7.

<a id="binary-form-genus-character"></a>
#### The genus character of a binary quadratic form

`GN.2/binary-form-genus-character` · definition

Let d be a fundamental discriminant, d′ a discriminant (d′ ≡ 0, 1 mod 4, possibly a square) and D = dd′. For an integral binary quadratic form Q = [a, b, c] (Q(x, y) = ax² + bxy + cy²) of discriminant b² − 4ac = D, possibly imprimitive and taken positive definite when D < 0, put χ_d(Q) = 0 if gcd(a, b, c, d) > 1, and otherwise χ_d(Q) = χ_d(m) := (d/m), the Kronecker symbol, for any integer m ≠ 0 represented by Q with gcd(m, d) = 1. Here χ_d(m) is Tau Ceti's genus character TauCeti.Multiquadratic.genusCharFun s m for the prime-discriminant factorization s of d. The value lies in {0, ±1}.

*Hypotheses.*

- d fundamental (d = 1 allowed, giving the trivial character); Q integral with discriminant dd′.
- The form carrier and proper equivalence are those of IntegralLattices Layer B (milestones B1–B2) for the binary lattice with polar Gram [[2a, b], [b, 2c]]; no second carrier is introduced.

*Uses.*

- Duke–Imamoḡlu–Tóth, Geometric invariants for real quadratic fields, §9, pp.977–978 (routed items PAPER-DUKE-IMAMOGLU-TOTH-16/101–102): the twisted traces and cycle integrals are weighted by χ_d(Q) for forms of discriminant dd′, possibly imprimitive or of square discriminant.
- MultiquadraticPartII RQ.3, formCharacter-eq-idealCharacter: compares χ_δ on forms with the narrow ideal-class genus character for fundamental D.
- MetaplecticAutomorphicForms MP.7 (quadratic-root Weyl sums, cycle unfolding): the Kohnen–Zagier twisted traces sum χ_d(Q) over Γ-classes.
- Bruinier–Ehlen–Yang, §7.1: the twisted special divisors Z_Δ(m) are weighted by χ_Δ.

*API.*

- `BinaryForm.genusChar` (constructor): χ_d(Q) ∈ ℤ for a fundamental discriminant d and an integral binary form Q with d ∣ disc Q.
- `BinaryForm.genusChar_eq_zero_iff` (characterisation): χ_d(Q) = 0 iff gcd(a, b, c, d) > 1.
- `BinaryForm.genusChar_of_represents` (characterisation): If Q represents m with gcd(m, d) = 1 then χ_d(Q) = genusCharFun s m = (d/m).
- `BinaryForm.genusChar_mem` (other): χ_d(Q) ∈ {−1, 0, 1}.
- `BinaryForm.genusChar_one` (simp): For d = 1, χ_1(Q) = 1 for every Q.
- `BinaryForm.genusChar_smul` (simp): χ_d(nQ) = χ_d(n)·χ_d(Q) for every integer n ≠ 0 (both sides vanish if gcd(n, d) > 1).

*Unit tests.*

- `genusChar_sum_two_squares` (computation): genusChar (−4) [1, 0, 1] = 1.
- `genusChar_imprimitive_zero` (degenerate): For d = −3 and the imprimitive form Q = [3, 3, 3] of discriminant −27 = (−3)·9, genusChar (−3) Q = 0 because gcd(3, 3, 3, −3) = 3, while the primitive form [1, 1, 7] of the same discriminant has genusChar (−3) = 1.
- `genusChar_nonprincipal` (computation): genusChar 5 [2, 1, 2] = −1 and genusChar 5 [1, 1, 4] = 1 (D = −15), so χ_5 separates the two genera of discriminant −15.
- `genusChar_not_legendre_of_coeff` (non-example): The value is not (d/a) for the leading coefficient when a is not coprime to d: for Q = [5, 5, 2] of discriminant −15, (5/5) = 0 but Q represents 2 and χ_5(Q) = −1.

*Proof sketch.*

1. The represented set of a form with gcd(a, b, c, d) = 1 contains integers prime to d: Q represents a, c and a + b + c, and if a prime p | d divided all three it would divide a, b, c.
2. The value is defined through any such m; that it does not depend on m is binary-form-genus-character-invariance.

*Checks.*

- d = −4, Q = x² + y² (D = −4): χ_{−4}(Q) = χ_{−4}(1) = 1.
- d = −4, d′ = 4 (a square), Q = 2x² + 2y² (D = −16): gcd(2, 0, 2, −4) = 2 > 1, so χ_{−4}(Q) = 0, while x² + 4y² (also D = −16) has χ_{−4} = 1.
- d = 5, d′ = −3, D = −15, Q = 2x² + xy + 2y²: Q represents 2, and (5/2) = −1, so χ_5(Q) = −1, while the principal form x² + xy + 4y² has χ_5 = 1.

*Needs:* Tau Ceti `TauCeti.Multiquadratic.genusCharFun`; Tau Ceti `QuadraticMap.Represents`; Mathlib `jacobiSym`; Tau Ceti `TauCeti.Multiquadratic.genusCharFun_eq_zero_iff`; Tau Ceti `TauCeti.Multiquadratic.genusCharFun_eq_one_or_eq_neg_one`.

*Source:* Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang (BEY2021), Definition 7.1 and Lemma 7.2 with the paragraph after it, pp.44–45 (arXiv:1912.12084v2; published Invent. Math. 226, pp.752–753): Defines the local characters χ_{Δ,p} on trace-zero matrices through represented values coprime to Δ and the Hilbert symbol, and observes that on the global lattice the product of the local characters is the generalized genus character of Gross–Kohnen–Zagier: (Δ/n) for n represented and coprime to Δ when gcd(a,b,c,Δ) = 1, and 0 otherwise.

<a id="binary-form-genus-character-invariance"></a>
#### Well-definedness and invariance of the binary genus character

`GN.2/binary-form-genus-character-invariance` · theorem · `BinaryForm.genusChar_comp`

In the setting of binary-form-genus-character: (a) χ_d(Q) does not depend on the represented integer m coprime to d; (b) χ_d(Q ∘ g) = χ_d(Q) for every g ∈ GL₂(ℤ), in particular for proper (SL₂(ℤ)) equivalence; (c) χ_d(−Q) = sgn(d)·χ_d(Q); (d) if D = dd′ with d′ also fundamental then χ_d(Q) = χ_{d′}(Q) whenever both are nonzero and Q is primitive; (e) for p | d and Q with gcd(a, b, c, d) = 1, the p-part of χ_d(Q) is (a, d)_p if p ∤ a and (c, d)_p if p ∤ c (Hilbert symbols), so χ_d(Q) = ∏_p χ_{d,p}(Q) with the local characters of local-genus-character.

*Hypotheses.*

- d fundamental, Q integral of discriminant dd′; for D < 0 forms are positive definite, so −Q is not in the domain when D < 0 and (c) is stated for D > 0.

*Proof sketch.*

1. (a) If Q represents m and m′ prime to d, then mm′ is a norm from ℚ(√D) up to the factor of the content, and for each prime discriminant P | d, χ_P(m) = χ_P(m′) because Q's values prime to P lie in a single class of (ℤ/P)^×/squares (4am = (2ax + by)² − Dy² ≡ square mod P); multiply over P (Tau Ceti genusCharFun_eq_one_of_four_mul_eq_sq_sub_mul_sq).
2. (b) Q ∘ g represents exactly the integers Q represents.
3. (c) −Q represents −m, and χ_d(−1) = sgn(d) for a fundamental discriminant.
4. (d) For primitive Q, χ_d(m)χ_{d′}(m) = χ_D(m) = 1 for m represented and prime to D (m is a norm locally).
5. (e) is Bruinier–Ehlen–Yang Lemma 7.2: at p | d the Hilbert symbol (n, d)_p only depends on n modulo squares and equals (a, d)_p by (a).

*Checks.*

- Over D = −15 the two genera {[1,1,4]} and {[2,1,2]} have χ_{−3} = 1, −1 and χ_5 = 1, −1, with χ_{−3}χ_5 = χ_{−15} = 1 on both.
- For d = 5, d′ = 1, Q = x² + xy − y² (D = 5): χ_5(Q) = 1 = χ_5(−Q).

*Needs:* `binary-form-genus-character`; Tau Ceti `TauCeti.Multiquadratic.genusCharFun_eq_one_of_four_mul_eq_sq_sub_mul_sq`; Tau Ceti `TauCeti.Multiquadratic.genusCharFun_mul_right`; Mathlib `jacobiSym.quadratic_reciprocity`; `local-genus-character`.

*Source:* Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang (BEY2021), Lemma 7.2 and the paragraph after it, p.45 (arXiv v2): States well-definedness of the local characters and the explicit formula (a, Δ)_p or (c, Δ)_p at p | Δ, and deduces the global formula through represented values; the proof is said to follow Gross–Kohnen–Zagier I.2, Proposition 1. Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang (BEY2021), Lemma 7.3 with proof, p.45 (arXiv v2): Shows that the GL₂ action changes the local character by (det h, Δ)_p; over ℤ, det g = ±1 and (−1, Δ) contributes the sign sgn(Δ) of (c).

<a id="local-genus-character"></a>
#### Local genus characters on trace-zero matrices

`GN.2/local-genus-character` · definition

Let Δ be a fundamental discriminant and p a prime. On the lattice L′_p = L′ ⊗ ℤ_p, where L′ is the dual of the lattice of integral trace-zero matrices λ = [[b/2, −a], [c, −b/2]] with Q(λ) = det λ (so 4Q(λ) = 4ac − b² = −disc[a, b, c]), define χ_{Δ,p}(λ) = (n, Δ)_p (p-adic Hilbert symbol) if 4Q(λ) ∈ Δℤ_p, gcd(a, b, c, Δ) is a unit in ℤ_p and [a, b, c] represents some n ∈ ℤ_p with (n, Δ) coprime, and χ_{Δ,p}(λ) = 0 otherwise; extend by 0 off L′_p and set χ_Δ(λ) = ∏_p χ_{Δ,p}(λ_p) on V(𝔸_f). Then χ_{Δ,p} is well defined, equals 1 for p ∤ Δ on the relevant set, equals (a, Δ)_p or (c, Δ)_p for p | Δ, satisfies χ_{Δ,p}(hλh^{−1}) = (det h, Δ)_p χ_{Δ,p}(λ) for h ∈ GL₂(ℤ_p), and on the global lattice χ_Δ is the genus character of binary-form-genus-character.

*Hypotheses.*

- Δ fundamental; V = trace-zero 2×2 rational matrices with Q = det, of signature (1,2); L′ the dual of the integral trace-zero matrices.

*Uses.*

- Bruinier–Ehlen–Yang, §7.1–7.2: χ_Δ is K_Δ-invariant on V(𝔸_f) and twists the special divisors and the theta function.
- Khayutin, Appendix B, Remark B.2: χ_p(q) = (u/p) for the local normal form ux² + Ay² at odd p | D.

*API.*

- `localGenusChar` (constructor): χ_{Δ,p} : V(ℚ_p) → {0, ±1} as defined, using Tau Ceti/QFI Hilbert symbols.
- `localGenusChar_of_not_dvd` (simp): For p ∤ Δ and λ ∈ L′_p with 4Q(λ) ∈ Δℤ_p primitive at p, χ_{Δ,p}(λ) = 1.
- `localGenusChar_of_dvd` (characterisation): For p | Δ: χ_{Δ,p}(λ) = (a, Δ)_p if p ∤ a, (c, Δ)_p if p ∤ c, and 0 if p divides a and c.
- `localGenusChar_conj` (functoriality): χ_{Δ,p}(hλh^{−1}) = (det h, Δ)_p·χ_{Δ,p}(λ) for h ∈ GL₂(ℤ_p).
- `genusChar_eq_prod_localGenusChar` (compatibility): For λ ∈ L′ corresponding to Q, ∏_p χ_{Δ,p}(λ) = χ_Δ(Q) of binary-form-genus-character.

*Unit tests.*

- `localGenusChar_minus_three` (computation): For Δ = −3, p = 3: the matrix of [1, 1, 1] has χ_{−3,3} = 1 and that of [−1, −1, −1] has χ_{−3,3} = (−1, −3)_3 = −1.
- `localGenusChar_unit_prime` (degenerate): For Δ = 1 (trivial character) χ_{1,p} = 1 on every primitive λ ∈ L′_p.
- `localGenusChar_det_sign` (characterisation): For h = diag(1, −1) ∈ GL₂(ℤ_p) and p | Δ, χ_{Δ,p}(hλh^{−1}) = (−1, Δ)_p·χ_{Δ,p}(λ).
- `localGenusChar_not_on_nonintegral` (non-example): For λ ∉ L′_p (for example a/p, b/p, c/p with p ∤ a) the value is 0, not (a, Δ)_p.

*Proof sketch.*

1. Well-definedness is the local form of binary-form-genus-character-invariance (a): two values n, n′ prime to Δ represented by the form differ by a local norm from ℚ_p(√Δ), and (·, Δ)_p is trivial on norms.
2. At p ∤ Δ every unit of ℤ_p has (n, Δ)_p = 1 when Δ is a unit; at p | Δ use n = a or n = c.
3. Equivariance: with S = [[0,1],[−1,0]], λ ↦ λS turns conjugation into the congruence action h·λ̃ = det(h)·(hλ̃h^t), and congruence preserves the represented values (Bruinier–Ehlen–Yang Lemma 7.3).

*Checks.*

- Δ = −4, p = 2, λ for [1, 0, 1]: χ_{−4,2} = (1, −4)_2 = 1.
- Δ = −3, p = 3, λ for [1, 1, 1]: χ_{−3,3} = (1, −3)_3 = 1; for [−1, −1, −1], (−1, −3)_3 = −1.

*Needs:* `binary-form-genus-character`; QuadraticFormInvariants, 6c the hilbert symbol and the local hasse invariant; Mathlib `PadicInt`.

*Source:* Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang (BEY2021), Definition 7.1 and Lemmas 7.2–7.3 with the proof of 7.3, pp.44–45 (arXiv:1912.12084v2): Defines χ_{Δ,p} on V(ℚ_p) through the Hilbert symbol of a represented value, gives the explicit formula at p | Δ, the product χ_Δ over all primes, and the transformation rule under GSpin(L_p) ≅ GL₂(ℤ_p).

<a id="binary-local-normal-form"></a>
#### Local normal form of a binary quadratic form

`GN.2/binary-local-normal-form` · theorem · `BinaryForm.exists_localNormalForm`

Let q = [a, b, c] be a primitive integral binary quadratic form of discriminant D ≠ 0 and p a prime. (a) If p is odd, or p = 2 and D ≡ 0 mod 4, then q is GL₂(ℤ_p)-equivalent to ux² + Ay² with u ∈ ℤ_p^×; writing A = u_A p^l, D = −4uA up to squares of units. (b) If p = 2 and D ≡ 1 mod 4 then q is GL₂(ℤ_2)-equivalent to xy when D ≡ 1 mod 8 and to x² + xy + y² when D ≡ 5 mod 8. (c) For odd p | D with D < 0 and q corresponding to the class [𝔰] of the Picard group of the order of discriminant D, (u/p) = χ_p(Nr[𝔰]) = χ_{p*,p}(q), the local genus character at p, so it depends only on the genus of q.

*Hypotheses.*

- q primitive; ℤ_p-equivalence means GL₂(ℤ_p); the dyadic forms xy and x² + xy + y² are the two unimodular even binary ℤ_2-forms.

*Proof sketch.*

1. (a) Some coefficient of q is a unit or b is: if p is odd one of a, c, a + b + c is a unit; move it to the leading coefficient and complete the square (division by 2a is allowed). If p = 2 and D ≡ 0 mod 4 then b is even and a or c is odd by primitivity; complete the square with b/2a ∈ ℤ_2.
2. (b) If D ≡ 1 mod 4 then b is odd, the polar Gram matrix [[2a, b], [b, 2c]] is even unimodular over ℤ_2, and the unimodular even binary ℤ_2-lattices are the hyperbolic plane and the anisotropic plane, distinguished by the square class of −D (IntegralLattices milestone 3D; the atomic dyadic forms of the base packet's dyadic-atomic-form).
3. (c) u is a value of q prime to p, so (u/p) = χ_{p*}(u) for the prime discriminant p* = ±p, which is the local genus character (local-genus-character).

*Checks.*

- [1, 1, 1], D = −3 ≡ 5 mod 8, is ℤ_2-equivalent to x² + xy + y².
- [1, 1, −2], D = 9 ≡ 1 mod 8, is ℤ_2-equivalent to xy.
- [1, 0, 1] at p = 2 (D = −4): already ux² + Ay² with u = A = 1.

*Needs:* `GN.2/dyadic-atomic-form` (base plan); `GN.2/integral-normalized-form` (base plan); `local-genus-character`; Mathlib `PadicInt`; Mathlib `legendreSym`.

*Source:* Ilya Khayutin (Khayutin2019), Appendix B.2, Lemma B.1 and Remark B.2, p.265 of the Annals version (arXiv:1710.04557v3, Lemma 168 and Remark 169): States the ℤ_p-normal forms of a primitive binary form of negative discriminant, including the two dyadic unimodular forms according to D mod 8, and identifies the Legendre symbol of the unit coefficient with the genus character of the class.

<a id="exponent-two-genus-theory"></a>
#### Genus theory when the class group has exponent two

`GN.2/exponent-two-genus-theory` · theorem · `exponentTwo_genusTheory`

Let D′ < 0 be a fundamental discriminant with s distinct prime divisors, K = ℚ(√D′) and Cl(O_{D′}) its class group (equal to the narrow class group). The genus characters χ_Δ, for the factorizations D′ = ΔΔ̃ into fundamental discriminants, are exactly the characters of Cl/Cl², and #(Cl/Cl²) = 2^{s−1}. Consequently, if Cl has exponent at most 2 then h(D′) = 2^{s−1}, every character of Cl is a genus character, and the Hilbert class field of K is K(√Δ_1, …, √Δ_{s−1}) for the prime discriminants Δ_i dividing D′ (all but one of them).

*Hypotheses.*

- D′ < 0 fundamental. The binary-form side is binary-form-genus-character through IntegralLattices B2 (forms ↔ classes).

*Proof sketch.*

1. Tau Ceti's principal genus theorem (isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one) identifies Cl⁺² with the common kernel of the genus characters, and the two-rank formula (twoRank_eq_ncard_ramifiedPrimes_sub_one) gives 2^{s−1}.
2. If Cl has exponent ≤ 2 then Cl² = 1, so Cl = Cl/Cl² and h = 2^{s−1}.
3. The genus field K(√Δ_1, …, √Δ_{s−1}) is unramified over K (Tau Ceti Multiquadratic.Unramified) of degree 2^{s−1} = h, and is contained in the Hilbert class field, whose Galois group is Cl (ClassFieldTheory Layer 13); degrees force equality.

*Checks.*

- D′ = −84 = (−3)(−4)(−7) (s = 3): Cl ≅ (ℤ/2)², h = 4 = 2², and the Hilbert class field of K = ℚ(√−21) is K(√−3, √−7), of degree 4 over K.
- D′ = −23: s = 1, Cl ≅ ℤ/3 has exponent 3 and the conclusion h = 2^0 fails, as it must.

*Needs:* `binary-form-genus-character`; Tau Ceti `TauCeti.Multiquadratic.isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one`; Tau Ceti `TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one`; Tau Ceti `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`; ClassFieldTheory, layer 13 norm theorems and class fields.

*Source:* Jan Hendrik Bruinier, Stephan Ehlen, Tonghai Yang (BEY2021), Corollary 7.18 and its proof, pp.56–57 (arXiv:1912.12084v2; published pp.767–768): Uses that the genus characters are the characters of Cl/Cl², so that a class group of exponent at most 2 has order 2^{s−1}, all its characters are genus characters, and the Hilbert class field is generated by the square roots of the prime discriminants.

### 2.14 Local integral classification and spinor norms

These targets give the local inputs that consumers of local classification need: representation of units by odd unimodular lattices, the eigenspace structure of an isometry with the Cayley discriminant, Zassenhaus’s formula, the spinor norm of integral isometries of a regular quadratic module over a local ring (through GSpin, valid at dyadic places), the resulting constraint on characteristic polynomials, and the local spinor images of unimodular stabilizers at every place.

<a id="odd-unimodular-unit-representation"></a>
#### Odd unimodular lattices represent units primitively

`GN.2/odd-unimodular-unit-representation` · theorem · `unimodular_represents_unit`

Let O be a complete DVR with finite residue field of odd characteristic (for example ℤ_ℓ, ℓ odd) and M a unimodular quadratic O-lattice of rank ≥ 2. Then every t ∈ O^× is Q(v) for some primitive v ∈ M. In rank 1, with generator e of norm u ∈ O^×, M represents t ∈ O^× primitively iff t/u is a square in O^× (equivalently, for O = ℤ_ℓ, iff t/u is a square mod ℓ).

*Hypotheses.*

- Unimodular for the polar form (2 is a unit, so the half-Gram and the Gram differ by a unit).

*Proof sketch.*

1. The reduction M/𝔪M is a nondegenerate quadratic space over the residue field of dimension ≥ 2, so it represents t̄ by a nonzero vector (finite-field-quadratic-classification (a)).
2. A nonzero representing vector has a nonzero partial derivative (the polar form is nondegenerate), so Hensel's lemma lifts the representation to a primitive v ∈ M (Mathlib hensels_lemma for ℤ_ℓ; HenselianLocalRing in general).
3. Rank 1: Q(ae) = a²u.

*Checks.*

- M = ℤ_3² with x² + y²: represents 2 = 1 + 1 and the nonsquare unit 2 primitively.
- Rank 1: ⟨1⟩ over ℤ_3 does not represent 2.

*Needs:* `finite-field-quadratic-classification`; Mathlib `hensels_lemma`; Mathlib `HenselianLocalRing`; `GN.2/integral-quadratic-lattice` (base plan); `lattice-discriminant-ideal`.

*Source:* Max Lieblich, Davesh Maulik, Andrew Snowden (LMS2018), §3.5, Lemmas 3.5.1–3.5.2, p.15 (arXiv:1107.1221): Proves that a unimodular quadratic lattice over ℤ_ℓ of rank at least two whose reduction represents a unit admits a vector of that norm, by Hensel. François Charles (Charles2016), Proof of Lemma 4.5, pp.520–521 (Annals 184): Applies the Lieblich–Maulik–Snowden lemma to find vectors of prescribed unit norm in unimodular ℓ-adic lattices.

<a id="isometry-eigenspace-decomposition"></a>
#### Eigenspaces of an isometry and the Cayley discriminant

`GN.2/isometry-eigenspace-decomposition` · theorem · `discr_eq_charpoly_one_mul_neg_one`

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

*Needs:* Mathlib `LinearMap.IsAdjointPair`; Mathlib `Matrix.charpoly`; Tau Ceti `TauCeti.QuadraticMap.orthogonalGroup`.

*Source:* Gaëtan Chenevier, Olivier Taïbi (ChenevierTaibi2020), Corollary 3.6, p.30 (arXiv:1907.08783): States that for γ ∈ SO(V, q) without eigenvalues ±1 the discriminant of q is Q(1)Q(−1) modulo squares, also attributed to Gross–McMullen Proposition A.3. Max Lieblich, Davesh Maulik, Andrew Snowden (LMS2018), §3.5, p.15 (arXiv:1107.1221): Decomposes the space of a semisimple isometry into the ±1 part and reciprocal eigenspace pairs and computes the discriminant of the fixed part.

<a id="zassenhaus-spinor-norm"></a>
#### Zassenhaus’s formula for the spinor norm

`GN.2/zassenhaus-spinor-norm` · theorem · `spinorNorm_eq_zassenhaus`

Let k be a field of characteristic ≠ 2, (V, q) nondegenerate and γ ∈ SO(V, q)(k) with characteristic polynomial (X − 1)^a(X + 1)^{2b}Q(X), Q(1)Q(−1) ≠ 0. Then the spinor norm of γ is sn(γ) = disc(q|_{ker(γ+1)^{2b}})·Q(−1) in k^×/k^{×2}.

*Hypotheses.*

- Spinor norm of Tau Ceti/OrthogonalSpinGroups 1D (CliffordAlgebra.spinorNorm), with the reflection normalization θ(τ_v) = [q(v)].

*Proof sketch.*

1. Decompose V = V_+ ⊥ V_− ⊥ V′ (isometry-eigenspace-decomposition) and use multiplicativity of sn on orthogonal sums.
2. sn(γ|V_+) = 1 (unipotent part: a product of an even number of reflections with trivial total norm), sn(−1_W) = 2^{dim W}disc(q|W) = disc(q|W) for W = V_− of even dimension, and on V′ sn = Q(−1)·Q(1)^{…} computed in the graded tensor product of Clifford algebras of hyperbolic planes (Chenevier–Taïbi's proof).

*Checks.*

- γ = −1 on a 2-dimensional space: sn = disc(q).
- γ = diag(2, 1/2) on the hyperbolic plane (a = b = 0, Q = (X − 2)(X − 1/2)): sn = Q(−1) = (−3)(−3/2) = 9/2 ≡ 2, matching θ(τ_{(1,1)}τ_{(1,2)}) = [2] of the base packet's spinor-reflection-product.

*Needs:* `isometry-eigenspace-decomposition`; Tau Ceti `CliffordAlgebra.spinorNorm`; `GN.2/spinor-reflection-product` (base plan).

*Source:* Gaëtan Chenevier, Olivier Taïbi (ChenevierTaibi2020), Section 3.2, Theorem 3.5 (Zassenhaus) and its proof, pp.29–30 (arXiv:1907.08783): States Zassenhaus’s formula for the spinor norm of a special orthogonal element in terms of the discriminant of its (−1)-part and Q(−1), and proves it by orthogonal decomposition and a Clifford-algebra computation.

<a id="regular-quadratic-module-spinor-norm"></a>
#### Integral spinor norms of regular quadratic modules

`GN.2/regular-quadratic-module-spinor-norm` · theorem · `spinorNorm_integral_mem_units`

Let R be a local ring (or any ring with Pic R = 1) with 2 not necessarily invertible, and (V, q) a regular quadratic R-module of rank n ≥ 1: q nondegenerate (perfect polar pairing), or n odd with invertible half-discriminant. Then GSpin(V, q) → SO(V, q) is surjective on R-points with kernel R^×, the Clifford norm ν of a lift defines the spinor norm sn : SO(V, q)(R) → R^×/R^{×2}, and over a DVR R with fraction field K this is the restriction of the field spinor norm: θ(SO(V)(R)) ⊆ R^×K^{×2}/K^{×2}. In particular for a unimodular lattice L_v over the integers of a local field, also at dyadic places, the spinor norms of proper integral isometries are units modulo squares.

*Hypotheses.*

- R local (Zariski-local triviality of G_m-torsors gives the lift); regularity as in Knus IV §3 ('semi-regular' in odd rank).

*Proof sketch.*

1. The sequence 1 → G_m → GSpin → SO → 1 is exact as Zariski sheaves for regular (V, q) (Conrad, Reductive group schemes, Appendix C); H¹_Zar(R, G_m) = Pic R = 1 gives surjectivity on R-points.
2. ν(γ̃) ∈ R^× is well defined modulo squares since the kernel R^× has ν(t) = t².
3. Compatibility with the field spinor norm: a lift over R is a lift over K, and the field spinor norm is the Clifford norm of an even Lipschitz lift (OrthogonalSpinGroups 1D, spinorNorm_vectorRepresentation).

*Checks.*

- R = ℤ_2, V = hyperbolic plane: diag(u, u^{−1}) for u ∈ ℤ_2^× has spinor norm [u], a unit class.
- R = ℤ_2: the rational isometry diag(2, 1/2) of the hyperbolic plane does not preserve ℤ_2e ⊕ ℤ_2f, consistently with its spinor norm [2] not being a unit class.

*Needs:* Tau Ceti `CliffordAlgebra.spinorNorm`; Mathlib `CliffordAlgebra.even`; Mathlib `IsLocalRing`; `zassenhaus-spinor-norm`; `lattice-discriminant-ideal`.

*Source:* Gaëtan Chenevier, Olivier Taïbi (ChenevierTaibi2020), Section 3.2, the definitions of non-degenerate and regular quadratic forms over rings, GSpin, Spin and the exact sequences (3.2.1), and the spinor norm over rings, pp.28–29 (arXiv:1907.08783): Introduces regular quadratic modules over a ring, GSpin with its Clifford norm and the spinor norm SO(V, q)(R) → R^×/R^{×2} when Pic R = 1, citing Conrad Appendix C and Knus. Brian Conrad (ConradRGS), Appendix C (quadratic spaces, Clifford algebras, GSpin and the spinor norm over rings): Constructs Clifford algebras, GSpin and Spin of regular quadratic spaces over arbitrary rings and the exact sequences relating them to SO.

<a id="integral-isometry-charpoly-constraint"></a>
#### Characteristic polynomials of everywhere-integral isometries

`GN.2/integral-isometry-charpoly-constraint` · theorem · `abs_eval_neg_one_isSquare_of_forall_integral`

Let V be a free ℤ-module of rank n with a regular quadratic form q, G = SO(V, q), and P(X) = (X − 1)^a(X + 1)^{2b}Q(X) monic of degree n in ℚ[X] with Q(1)Q(−1) ≠ 0. If for every prime p there is γ_p ∈ G(ℤ_p) with characteristic polynomial P, then |Q(−1)| is a square when b = 0, and |Q(1)| is a square when a = 0.

*Hypotheses.*

- q regular over ℤ (unimodular in even rank, half-discriminant ±1 in odd rank).

*Proof sketch.*

1. For b = 0, Zassenhaus gives sn(γ_p) = Q(−1) mod squares, and regular-quadratic-module-spinor-norm makes it a p-adic unit times a square at every p; so Q(−1) ∈ ℚ^× has even valuation at every prime, i.e. |Q(−1)| is a square.
2. For a = 0 apply the same to −γ_p (which lies in SO when n is even) with the roles of ±1 exchanged.

*Checks.*

- n = 2, V the hyperbolic plane, P = X² − 3X + 1: Q(−1) = 5 is not a square, so P cannot occur at every p; indeed SO(V)(ℤ_p) = {diag(u, u^{−1})} and P has no root in ℤ_p for p inert in ℚ(√5).
- Chenevier–Taïbi remark: for p ≡ 1 mod 4 there is no element of order p in SO_{p−1}(ℚ) since Φ_p(1)Φ_p(−1) = p is not a square.

*Needs:* `zassenhaus-spinor-norm`; `regular-quadratic-module-spinor-norm`; `isometry-eigenspace-decomposition`.

*Source:* Gaëtan Chenevier, Olivier Taïbi (ChenevierTaibi2020), Proposition 3.7 and its proof, p.30 (arXiv:1907.08783): Proves that if a regular form over ℤ admits local integral special orthogonal elements with characteristic polynomial (X − 1)^a(X + 1)^{2b}Q at every p, then |Q(−1)| (b = 0) or |Q(1)| (a = 0) is a square, by lifting to GSpin and Zassenhaus’s formula.

<a id="dyadic-unimodular-spinor-image"></a>
#### Local spinor images of unimodular stabilizers at all places

`GN.2/dyadic-unimodular-spinor-image` · theorem · `spinorNorm_range_unimodular`

Let K be a nonarchimedean local field with ring of integers R and L a unimodular quadratic R-lattice (regular in the sense of regular-quadratic-module-spinor-norm) of rank n ≥ 2 in V = KL. Then θ(SO(L)) ⊆ R^×K^{×2}/K^{×2}; if moreover K is nondyadic, or L contains a hyperbolic plane over R, equality holds. In particular the adelic spinor norm of an adelic proper isometry is a unit at almost all places (the base packet's spinor-adelic-norm) and the reference groups θ_v(SO(L_v)) are R_v^×K_v^{×2} at every place where L_v is regular of rank ≥ 2 and contains a hyperbolic plane.

*Hypotheses.*

- The general dyadic image for non-split unimodular or non-unimodular lattices is not claimed (Beli's theory of integral spinor norms over dyadic fields); see the gap recorded for it.

*Proof sketch.*

1. Inclusion: regular-quadratic-module-spinor-norm.
2. Equality, nondyadic: the base packet's spinor-unimodular-stabilizer.
3. Equality with a hyperbolic plane H = Re + Rf: for u ∈ R^× the integral isometry diag(u, u^{−1}) of H (extended by the identity) has spinor norm [u] (base packet spinor-reflection-product with a = u).

*Checks.*

- K = ℚ_2, L = H ⊥ H: θ(SO(L)) = ℤ_2^×ℚ_2^{×2}.
- Rank 1 is excluded: SO(L) is trivial and θ = 1 ≠ R^×K^{×2}/K^{×2}.

*Needs:* `regular-quadratic-module-spinor-norm`; `GN.2/spinor-unimodular-stabilizer` (base plan); `GN.2/spinor-reflection-product` (base plan); `GN.2/spinor-adelic-norm` (base plan).

*Source:* Rainer Schulze-Pillot (SchulzePillot2020), §9.2, Lemma 9.19 and Definition/Lemma 9.20, printed pp.126–127 (arXiv:2008.12847v2): Computes the spinor norm image of the proper stabilizer of a nondyadic unimodular lattice of rank at least two and assembles the adelic spinor norm with unit components at almost all places. Gaëtan Chenevier, Olivier Taïbi (ChenevierTaibi2020), Section 3.2, p.29 (arXiv:1907.08783): The spinor norm of an integral element of SO over a local ring is a unit class, through GSpin.

### 2.15 Hermitian forms and lattices over quadratic extensions

Hermitian spaces over a quadratic extension are reduced to quadratic forms by the trace form and Jacobson’s theorem, which gives their local and global classification from QuadraticFormInvariants and GlobalQuadraticForms. On the integral side: Jacobowitz’s orthogonal bases over unramified extensions, scale and norm ideals, the classification of unimodular lattices, hermitian genera, and the arithmetic of positive definite unimodular hermitian lattices over CM fields that Lipnowski–Tsimerman count.

<a id="hermitian-trace-form"></a>
#### The trace quadratic form of a hermitian space

`GN.2/hermitian-trace-form` · construction

Let E/F be a quadratic extension of fields of characteristic ≠ 2 with conjugation x ↦ x̄, and (V, h) a hermitian space over E (conjugate-linear in the first variable, h(w, v) = h(v, w)‾). Its trace form is the F-quadratic space (V_F, q_h) with q_h(v) = h(v, v) ∈ F and polar form Tr_{E/F}h(v, w) = h(v, w) + h(w, v), whose diagonal is 2q_h. If h ≅ ⟨a_1, …, a_n⟩ (a_i ∈ F^×) and E = F(√δ), then q_h ≅ ⟨a_1, …, a_n⟩ ⊗ ⟨1, −δ⟩. Jacobson's theorem: two hermitian spaces over E are isometric iff their trace forms are isometric over F. Zhang's convention, linear in the first variable, is h′(v, w) = h(w, v); it has the same trace form.

*Hypotheses.*

- char F ≠ 2; E/F a separable quadratic field extension (the split algebra E = F × F is excluded here).

*Uses.*

- hermitian-space-classification (this packet): reduces local classification and the hermitian Hasse principle to quadratic forms.
- Zhang, Weil representation and the arithmetic fundamental lemma, §1.2–§2: the orbits and norm fibres are read on q_h.
- Li–Zhang, Kudla–Rapoport cycles, §1.7 and §3: hermitian lattices and their densities are compared with quadratic lattices.

*API.*

- `HermitianSpace.traceForm` (constructor): q_h : QuadraticForm F V, q_h v = h v v (as an element of F).
- `HermitianSpace.traceForm_polar` (simp): polar q_h v w = Tr_{E/F}(h v w).
- `HermitianSpace.traceForm_diag` (example): q_{⟨a⟩} = a·N_{E/F}, and q_{h ⊥ h′} = q_h ⊥ q_{h′}.
- `HermitianSpace.isometry_iff_traceForm` (characterisation): h ≅ h′ iff q_h ≅ q_{h′} (Jacobson).
- `HermitianSpace.traceForm_linearFirst` (compatibility): The form linear in the first variable, h′(v, w) = h(w, v), has the same trace form.

*Unit tests.*

- `traceForm_complex_line` (computation): For E = ℂ, F = ℝ, h(x, y) = x̄y on ℂ, the trace form is x² + y² on ℝ².
- `traceForm_zero` (degenerate): The zero hermitian space has the zero quadratic space as trace form.
- `traceForm_scale_nonnorm` (non-example): For a ∈ F^× not a norm from E, ⟨1⟩ and ⟨a⟩ are not isometric hermitian lines although both trace forms have discriminant −δ mod squares; they differ in the Hasse invariant, so the trace form, not its discriminant alone, is the invariant.

*Proof sketch.*

1. q_h is quadratic: q_h(cv) = N(c)q_h(v) and its polar form is Tr∘h, F-bilinear and symmetric.
2. A hermitian space has an orthogonal basis (char ≠ 2), and q_{⟨a⟩}(x) = a·N_{E/F}(x) = a(x_1² − δx_2²).
3. Jacobson: if q_h ≅ q_{h′} then q_h represents c = h′(e, e) for an anisotropic e, so h represents c (q_h(v) = h(v, v)); split h = ⟨c⟩ ⊥ h_1 and h′ = ⟨c⟩ ⊥ h′_1 and cancel ⟨c⟩⊗⟨1, −δ⟩ by Witt cancellation for quadratic forms (QuadraticFormInvariants Layer 1); induct on n.

*Checks.*

- E = ℂ, F = ℝ, h = ⟨1⟩: q_h = x² + y², positive definite of rank 2.
- h = ⟨1⟩ ⊕ ⟨−1⟩ (hyperbolic) has hyperbolic trace form of rank 4.

*Needs:* `GN.2/integral-hermitian-lattice` (base plan); QuadraticFormInvariants, layer 1 hyperbolic planes and witt theory; Mathlib `QuadraticMap.polarBilin`; Mathlib `Algebra.trace`; Tau Ceti `QuadraticMap.Represents`.

*Source:* Wei Zhang (Zhang2021), §1.2, displays (1.2)–(1.4), pp.869–870 of the Annals version (arXiv:1909.02697, §1.2): Fixes hermitian forms linear in the first variable over a quadratic extension of local fields of characteristic zero, the quadratic form q(u) = h(u, u) on the underlying F_0-space with bilinear form the trace of h, and the norm fibres V_ξ. Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §5.2, proof of Proposition 5.4, pp.25–26 (arXiv:1511.02212v1): Uses the classification of hermitian spaces over local fields and the Hasse principle for hermitian forms (cited from Jacobowitz and Scharlau §10), which this node reduces to quadratic forms through the trace form.

<a id="hermitian-space-classification"></a>
#### Classification of hermitian spaces over local and global fields

`GN.2/hermitian-space-classification` · theorem · `HermitianSpace.isometric_iff_locallyIsometric`

Let E/F be a quadratic extension. (a) If F is a nonarchimedean local field of characteristic 0, hermitian spaces over E are classified by dimension and determinant in F^×/N_{E/F}(E^×); each class (n, d) occurs for n ≥ 1. (b) If F is a number field, hermitian spaces over E are classified by dimension, determinant in F^×/N(E^×) and the signatures at the real places of F that do not split in E; equivalently, two hermitian spaces are isometric iff they are isometric at every place (Landherr's Hasse principle).

*Hypotheses.*

- Characteristic 0; E a field.

*Proof sketch.*

1. (a) By hermitian-trace-form, h ↦ q_h is injective on isometry classes; q_{⟨a_1,…,a_n⟩} = ⟨a_i⟩ ⊗ N_{E/F} has dimension 2n, discriminant δ^n and Hasse invariant determined by ∏a_i mod norms (the Hilbert symbol (∏a_i, δ)); apply the local classification (QuadraticFormInvariants 6D).
2. (b) Local isometry everywhere gives local isometry of the trace forms everywhere, hence a global isometry of q_h (GlobalQuadraticForms Layer 6), hence of h; the invariants (dim, det, signatures) determine all local classes by (a) and by Sylvester at real places.

*Checks.*

- Over ℚ_p with E unramified: ⟨1⟩ and ⟨p⟩ are the two hermitian lines.
- Over ℚ(i)/ℚ: ⟨1, 1⟩ and ⟨1, −1⟩ differ in signature at ∞, while their determinants 1 and −1 are both norms (−1 = N(i)).

*Needs:* `hermitian-trace-form`; QuadraticFormInvariants, 6d the classification and its corollaries; GlobalQuadraticForms, layer 6 representation and isometry; `signed-hermitian-space`.

*Source:* Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens (KSS2021), Remark 3.10, p.13 (arXiv:1611.02667v3): States that over a quadratic extension of local fields an ε-hermitian space is determined by its dimension and determinant modulo norms. Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), Proof of Proposition 5.4, pp.25–26 (arXiv:1511.02212v1): Applies the local classification by determinant and the Hasse principle for hermitian forms to identify the hermitian space of a positive definite Gram matrix.

<a id="unramified-hermitian-lattice-diagonalization"></a>
#### Hermitian lattices over an unramified extension have orthogonal bases

`GN.2/unramified-hermitian-lattice-diagonalization` · theorem · `HermitianLattice.exists_orthogonal_basis_unramified`

Let E/F be an unramified quadratic extension of nonarchimedean local fields (any residue characteristic) with uniformizer ϖ ∈ F, and L a nondegenerate hermitian O_E-lattice of rank n. Then L has an orthogonal O_E-basis with Gram matrix diag(ϖ^{λ_1}, …, ϖ^{λ_n}), λ_1 ≥ ⋯ ≥ λ_n, and the tuple λ is unique: it is the tuple of base packet hermitian-lattice-invariants (after reordering and shifting by the scale). Equivalently, the space X_n of nondegenerate hermitian matrices in M_n(E) ∩ GL_n(E) with integral entries decomposes as ⊔_{λ ∈ P_n} GL_n(O_E)·ϖ^λ under X ↦ gXḡᵀ, with P_n the nonincreasing integer tuples; integral X correspond to λ_n ≥ 0.

*Hypotheses.*

- E/F unramified, so Tr_{E/F} : O_E → O_F and N_{E/F} : O_E^× → O_F^× are surjective (also when the residue characteristic is 2).

*Proof sketch.*

1. Let ϖ^m be the scale: the minimum valuation of h(x, y) on L. Choose x, y with h(x, y) = ϖ^m u, u ∈ O_E^×. Since the trace is surjective on units, some unit t makes h(x + ty, x + ty) = h(x, x) + Tr(t̄ϖ^m u) + N(t)h(y, y) have valuation exactly m; this vector splits off orthogonally (its Gram entry divides all pairings).
2. Normalize the diagonal unit to 1 using surjectivity of the norm on units; induct on the rank.
3. Uniqueness: L^∨/L ≅ ⊕ O_E/ϖ^{λ_i} after scaling, so λ is determined by the invariant factors (base packet dvr-ordered-exponent-uniqueness).

*Checks.*

- n = 1: the lattice O_E e with h(e, e) = ϖ³u is equivalent to ϖ³ (λ = (3)).
- The hermitian matrix [[0, 1], [1, 0]] is GL₂(O_E)-equivalent to diag(1, −1) ~ diag(1, 1): λ = (0, 0).

*Needs:* `GN.2/hermitian-lattice-invariants` (base plan); `GN.2/dvr-ordered-exponent-uniqueness` (base plan); `GN.2/integral-hermitian-lattice` (base plan); LocalFieldsRamification, layer 2 unramified extensions and frobenius.

*Source:* Spencer Leslie (Leslie2019), §3.2, display (3.7), p.26 (arXiv:1911.07907v3): States the decomposition of the hermitian matrices X_n into GL_n(O_E)-orbits of diagonal matrices ϖ^λ, λ nonincreasing, for E/F unramified, citing Jacobowitz. Chao Li, Wei Zhang (LiZhangDensity), §1.7, physical pp.8–9 (arXiv:1908.01701v3): Defines the invariants of a hermitian lattice over an unramified extension through L^∨/L and uses the diagonal form.

<a id="hermitian-norm-ideal"></a>
#### Scale and norm ideals of a local hermitian lattice

`GN.2/hermitian-norm-ideal` · definition

For a hermitian O_E-lattice L in a hermitian space over a quadratic extension E/F of local fields, the scale 𝔰(L) ⊆ E is the O_E-submodule generated by the values h(x, y), x, y ∈ L, and the norm ideal 𝔫(L) ⊆ F is the O_F-submodule generated by the values h(x, x), x ∈ L. Both are isometry invariants with Tr(𝔰(L)) ⊆ 𝔫(L) ⊆ 𝔰(L) ∩ F, and for E/F unramified or of odd residue characteristic 𝔫(L) = 𝔰(L) ∩ F.

*Hypotheses.*

- E/F quadratic, local; L full O_E-lattice; F-valued norm ideal (Lipnowski–Tsimerman write it as an O_{L_v}-ideal; here the O_F-module is primary and O_E·𝔫(L) is its extension).

*Uses.*

- Lipnowski–Tsimerman, Proposition 5.6 and (36), p.26: unimodular lattices with equal determinant and norm ideal are locally equivalent; the norm ideal refines the decomposition of free unimodular lattices.
- local-unimodular-hermitian-classification (this packet): the hypothesis in the dyadic ramified case.

*API.*

- `HermitianLattice.scale` (constructor): 𝔰(L), the O_E-span of h(L, L).
- `HermitianLattice.normIdeal` (constructor): 𝔫(L), the O_F-span of {h(x, x) : x ∈ L}.
- `HermitianLattice.normIdeal_le_scale` (other): 𝔫(L) ⊆ 𝔰(L) ∩ F and Tr(𝔰(L)) ⊆ 𝔫(L).
- `HermitianLattice.normIdeal_eq_of_trace_surjective` (characterisation): If Tr(O_E) = O_F then 𝔫(L) = 𝔰(L) ∩ F.
- `HermitianLattice.normIdeal_map` (functoriality): Isometric lattices have equal scale and norm ideals.

*Unit tests.*

- `normIdeal_unit` (computation): For L = O_E with h = ⟨1⟩, normIdeal L = O_F and scale L = O_E.
- `normIdeal_dyadic_hyperbolic` (non-example): For E = ℚ_2(i) and the hyperbolic plane O_E e ⊕ O_E f (h(e, f) = 1), normIdeal = 2ℤ_2 although scale ∩ F = ℤ_2.
- `normIdeal_zero` (degenerate): The zero lattice has scale 0 and norm ideal 0.

*Proof sketch.*

1. Invariance under isometry is immediate from the definitions.
2. Tr(h(x, y)) = h(x + y, x + y) − h(x, x) − h(y, y) gives Tr(𝔰) ⊆ 𝔫; if the trace O_E → O_F is surjective (unramified or odd), Tr(𝔰) = 𝔰 ∩ F.

*Checks.*

- L = O_E with h = ⟨1⟩: 𝔰 = O_E, 𝔫 = O_F.
- Ramified dyadic E = ℚ_2(i): the lattice O_E² with the hyperbolic Gram [[0, 1], [1, 0]] has 𝔫 = Tr(O_E) = 2ℤ_2 ≠ 𝔰 ∩ F = ℤ_2.

*Needs:* `GN.2/integral-hermitian-lattice` (base plan); Mathlib `Algebra.trace`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), Definition 5.5, p.26 (arXiv:1511.02212v1): Defines the norm ideal of a local hermitian lattice as generated by the values ⟨m, m⟩.

<a id="local-unimodular-hermitian-classification"></a>
#### Local classification of unimodular hermitian lattices

`GN.2/local-unimodular-hermitian-classification` · theorem · `HermitianLattice.unimodular_isometric`

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

*Needs:* `unramified-hermitian-lattice-diagonalization`; `quadratic-norm-squares`; `GN.2/hermitian-dual-lattice` (base plan); `hermitian-norm-ideal`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), Definition 5.5, Proposition 5.6 and the paragraph after it, p.26 (arXiv:1511.02212v1): States that unimodular lattices of the same determinant and norm ideal in a local hermitian space are equivalent (from Jacobowitz Proposition 10.4), and that the norm-ideal condition is automatic for unramified extensions and for ramified ones away from 2 (Jacobowitz Theorems 7.1 and 8.2).

<a id="hermitian-genus"></a>
#### Genus and class set of hermitian lattices over a number field

`GN.2/hermitian-genus` · definition

Let L/K be a quadratic extension of number fields (for Lipnowski–Tsimerman a CM field over its totally real subfield) and (V, h) a hermitian space. Two O_L-lattices M, M′ ⊆ V are in the same genus if M_v ≅ M′_v under U(V)(K_v) at every finite place v of K; the classes in the genus of M are the U(V)(K)-orbits of lattices in it. The class set is in bijection with U(V)(K)\U(V)(𝔸_K^f)/Stab(M̂), by the lattice local-global dictionary.

*Hypotheses.*

- Lattices are projective O_L-modules of full rank (not necessarily free); U(V) is the unitary group of signed-hermitian-space over K.

*Uses.*

- Lipnowski–Tsimerman, (37) and the mass formula (38), pp.26–27: the class set is a double coset space of the finite adelic unitary group; its mass is counted by Siegel’s formula.
- GeometryOfNumbersAndQuadraticArithmetic GN.3 (mass and local densities): masses of hermitian genera.

*API.*

- `HermitianLattice.genus` (constructor): The set of lattices in V locally isometric to M at every finite place.
- `HermitianLattice.classSet` (data): The U(V)(K)-orbits of lattices in the genus.
- `HermitianLattice.classSetEquivDoubleCoset` (equivalence): classSet M ≃ U(V)(K)\U(V)(𝔸_f)/Stab(M̂), g ↦ the lattice V ∩ g M̂.
- `HermitianLattice.genus_eq_of_unimodular` (other): Under the hypotheses of local-unimodular-hermitian-classification at every place, all unimodular lattices of the space form one genus.

*Unit tests.*

- `hermitianGenus_self` (degenerate): M lies in its own genus and its class is the identity double coset.
- `hermitianGenus_gaussian` (computation): For ℚ(i)/ℚ and V = ℚ(i)² standard, O² and O·(1, 1)/(1+i) ⊕ O·(1, −1)/(1+i) are distinct lattices in one genus and one class.
- `hermitianGenus_not_class` (non-example): One genus can contain several classes; the genus relation does not give a global isometry (the class set is a double coset space, not a point).

*Proof sketch.*

1. The adelic group acts on lattices through completions (lattice-completion) and the local-global dictionary (lattice-local-global-dictionary); the orbit of M is its genus and the stabilizer is the product of the local stabilizers.

*Checks.*

- For L = ℚ(i), K = ℚ, V = L² with the standard form: M = O·(1, 1)/(1+i) ⊕ O·(1, −1)/(1+i) is unimodular with an orthonormal basis, differs from O², and lies in the genus (indeed the class) of O².

*Needs:* `lattice-local-global-dictionary`; `lattice-completion`; `signed-hermitian-space`; `GN.2/integral-hermitian-lattice` (base plan); AdelicAlgebraicGroups:AA.1.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §5.3, the bijection (37), pp.26–27 (arXiv:1511.02212v1): Identifies the projective unimodular lattices of a given determinant and norm ideal, up to U_σ, with the double coset space of the finite adelic unitary group by the stabilizer.

<a id="unit-norm-label"></a>
#### Unit-norm labels and the hermitian forms ⟨·,·⟩_σ

`GN.2/unit-norm-label` · definition

Let L be a CM field with totally real subfield K, Σ = O_K^{×,+}/N_{L/K}(O_L^×) the finite group of totally positive units modulo norms of units, and ε_σ a chosen representative of σ ∈ Σ (ε_1 = 1). On L^n put ⟨z, w⟩_σ = ε_σ z_1 w̄_1 + Σ_{i≥2} z_i w̄_i (Lipnowski–Tsimerman's convention, linear in the first variable). It is a totally positive definite hermitian form with determinant ε_σ, and the free unimodular O_L-lattices of determinant class σ lie in the space of ⟨·,·⟩_σ.

*Hypotheses.*

- L CM over K; Σ is finite because N(O_L^×) ⊇ (O_K^×)² (Dirichlet's unit theorem gives [O_K^{×}: (O_K^×)²] finite).

*Uses.*

- Lipnowski–Tsimerman, Proposition 5.4, p.25: free unimodular lattices are sorted by the label σ of their determinant.
- model-ring-positive-involution (this packet): orbit counts n_{L,n} are sums over labels.

*API.*

- `unitNormLabel` (constructor): Σ = (O_K^{×,+})/(N_{L/K} O_L^×) as a finite group.
- `unitNormLabel.form` (data): ⟨·,·⟩_σ for a chosen representative ε_σ.
- `unitNormLabel.form_det` (characterisation): det⟨·,·⟩_σ = ε_σ, so the determinant class of the space modulo N(L^×) is the image of σ.
- `unitNormLabel.form_posDef` (other): ⟨·,·⟩_σ is positive definite at every real place of K.
- `unitNormLabel.form_rep_indep` (characterisation): Changing ε_σ by a norm of a unit gives an isometric space.

*Unit tests.*

- `unitNormLabel_gaussian` (computation): For L = ℚ(i), Σ is trivial.
- `unitNormLabel_one` (degenerate): The identity label uses ε = 1 and ⟨·,·⟩_1 is the standard form.
- `unitNormLabel_not_space_det` (non-example): Σ is units modulo norms of units, not the group K^{×,+}/N(L^×) of space determinants: Σ is finite, while K^{×,+}/N(L^×) is infinite (every prime of K inert in L gives a new class).

*Proof sketch.*

1. Σ is a quotient of O_K^{×,+}/(O_K^×)², which is a finite elementary abelian 2-group.
2. ⟨·,·⟩_σ is positive definite at every real place since ε_σ is totally positive; its Gram matrix diag(ε_σ, 1, …, 1) has determinant ε_σ.

*Checks.*

- L = ℚ(i): K = ℚ, O_K^{×,+} = {1}, Σ trivial.
- L = ℚ(√2, i): O_K^{×,+} is generated by (1+√2)² up to sign, and that is N(1+√2), so Σ is trivial too.

*Needs:* Mathlib `NumberField.RingOfIntegers`; Mathlib `Algebra.norm`; Mathlib `NumberField.InfinitePlace`; `hermitian-trace-form`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §5.2, first paragraph, p.25 (arXiv:1511.02212v1): Defines Σ as totally positive units modulo norms of units, the representatives ε_σ, the forms ⟨·,·⟩_σ and the unitary groups U_σ.

<a id="free-unimodular-gram-orbits"></a>
#### Positive hermitian unimodular matrices and free unimodular lattices

`GN.2/free-unimodular-gram-orbits` · theorem · `freeUnimodular_gramOrbitEquiv`

Let L be a CM field with totally real subfield K and GL_n(O_L)^+ the totally positive definite hermitian matrices in GL_n(O_L). The orbits of GL_n(O_L) on GL_n(O_L)^+ under A ↦ g*Ag correspond bijectively to ⊔_{σ ∈ Σ} {free unimodular O_L-lattices in (L^n, ⟨·,·⟩_σ) of determinant class σ}/U_σ(K), a lattice going to its Gram matrix in any basis. Every class of free unimodular lattices of a given (σ, norm ideal) lies in one genus.

*Hypotheses.*

- Positive definiteness at every real place; free lattices only (projective ones are counted by free-projective-hermitian-comparison).

*Proof sketch.*

1. Given A, the form ⟨Az, w⟩ has determinant det A ∈ O_K^{×,+}, whose class σ_A ∈ Σ is constant on orbits; by hermitian-space-classification it is isometric to ⟨·,·⟩_{σ_A} (same determinant modulo norms, same signatures), and an isometry φ_A carries O_L^n to a free unimodular lattice; independence of φ_A modulo U_σ.
2. Inverse: Gram matrix of a basis of a free unimodular lattice; a change of basis acts by *-conjugation.

*Checks.*

- n = 1: orbits of O_L^× on O_K^{×,+} by u ↦ N(g)u are exactly Σ.
- L = ℚ(i), n = 2: [[2, 1], [1, 1]] = ḡᵀg for g = [[1, 0], [1, 1]], so it lies in the orbit of I_2.

*Needs:* `unit-norm-label`; `hermitian-space-classification`; `lattice-steinitz-class`; `GN.2/hermitian-dual-lattice` (base plan); `hermitian-genus`; `local-unimodular-hermitian-classification`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), Proposition 5.4 with proof, pp.25–26; Proposition 5.6 and (36)–(37), p.26 (arXiv:1511.02212v1): Proves the bijection between *-conjugation orbits of positive unimodular hermitian matrices and free unimodular lattices of each determinant label, through the local classification and the hermitian Hasse principle, and refines it by norm ideals into single genera.

<a id="free-projective-hermitian-comparison"></a>
#### Free versus projective unimodular hermitian lattices

`GN.2/free-projective-hermitian-comparison` · theorem · `freeUnimodular_subset_projective`

In the setting of free-unimodular-gram-orbits, the isometry classes of free unimodular lattices form a subset of the classes of projective unimodular lattices of the same rank, determinant label and norm ideal; the subset is everything when the class group Cl(O_L) is trivial, since then every finitely generated projective O_L-module is free. In general a projective unimodular lattice is free iff its Steinitz class is trivial.

*Hypotheses.*

- Class number one is sufficient, not necessary.

*Proof sketch.*

1. Free lattices are projective. A projective lattice is free iff its Steinitz class is trivial (lattice-steinitz-class), which is automatic when Cl(O_L) = 1.

*Checks.*

- L = ℚ(i): Cl = 1, so every unimodular O_L-lattice is free.
- L = ℚ(√−5): the rank-one lattice 𝔭 = (2, 1+√−5) with h = ⟨1/2⟩·N is projective, unimodular for a suitable scaling, and not free.

*Needs:* `lattice-steinitz-class`; `free-unimodular-gram-orbits`; `hermitian-genus`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), Remark 5.7, p.27 (arXiv:1511.02212v1): Notes that the mass-formula side counts projective hermitian lattices, not only free ones, so the free count is bounded by it.

<a id="model-ring-positive-involution"></a>
#### Model rings with positive involution

`GN.2/model-ring-positive-involution` · definition

A model ring with positive involution is R_{L,n} = ∏_{i=1}^k M_{n_i}(O_{L_i}) with (M_1, …, M_k)* = (M̄_1ᵀ, …, M̄_kᵀ), for a finite indexed family of CM fields L_i (repetitions allowed) with totally real subfields K_i and positive integers n_i with Σ_i n_i[L_i : ℚ] = 2g. Its quaternionic analogue is M_m(O_D) for a maximal order O_D of a totally definite quaternion algebra D over a totally real field, with (M)* = M̄ᵀ for the canonical involution. The positive symmetric units are R^{×,+} = {a ∈ R^× : a* = a, a totally positive definite}, on which R^× acts by g·a = g*ag; the orbit count n_{L,n} is the number of orbits.

*Hypotheses.*

- Indexed by the simple factors: two factors with isomorphic L_i keep separate central idempotents.

*Uses.*

- ArithmeticStatistics ST.5, model-ring-orbit-count-concentration: large orbit counts force a large imaginary-quadratic block.
- Lipnowski–Tsimerman, Conjecture 5.2 and Proposition 5.10: principal polarization counts compared with n_{L,n}.

*API.*

- `ModelRing` (structure): The data (L_i, n_i) with Σ n_i[L_i:ℚ] = 2g and the ring ∏ M_{n_i}(O_{L_i}) with conjugate-transpose involution.
- `ModelRing.posUnits` (data): R^{×,+}, the totally positive definite *-symmetric units.
- `ModelRing.orbitCount` (data): n_{L,n} = #(R^×\R^{×,+}).
- `ModelRing.orbitCount_prod` (relation): n_{L,n} = ∏_i n_{(L_i),(n_i)}.
- `ModelRing.orbit_equiv_lattices` (equivalence): Orbits ≃ ∏_i (free unimodular lattices over O_{L_i} of rank n_i, by label)/unitary groups (free-unimodular-gram-orbits).
- `ModelRing.quaternionic` (constructor): M_m(O_D) with M ↦ M̄ᵀ, for O_D a maximal order of a totally definite quaternion algebra.

*Unit tests.*

- `modelRing_gaussian_one` (computation): For L = ℚ(i), n = 1, orbitCount = 1.
- `modelRing_repeated` (characterisation): For two copies of ℚ(i) with n = (1, 1), orbitCount = 1·1 and the ring has two central idempotents.
- `modelRing_not_hermitian_only` (non-example): The involution is conjugate transpose, not transpose: for L = ℚ(i), the unit i is symmetric for transpose but not for conjugation (ī = −i), and is not in posUnits.

*Proof sketch.*

1. The orbit set factors as the product over i of the orbit sets of GL_{n_i}(O_{L_i}) on GL_{n_i}(O_{L_i})^+, each described by free-unimodular-gram-orbits.

*Checks.*

- k = 1, L = ℚ(i), n = 1: R = ℤ[i] with complex conjugation; R^{×,+} = {1}, one orbit.
- Repetition: two factors ℚ(i) give R = ℤ[i] × ℤ[i], with orbit set the product.

*Needs:* `free-unimodular-gram-orbits`; `quaternion-order`; Mathlib `Matrix.det`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), Definition 5.1 and the paragraph after it, p.24 (arXiv:1511.02212v1): Defines model rings with positive involution as products of matrix rings over rings of integers of CM fields with conjugate-transpose involution, and relates principal polarizations to orbits on positive symmetric units.

### 2.16 Stable lattices of a semisimple endomorphism

Lattices stable under a semisimple endomorphism with given characteristic polynomial are lattices over a monogenic order. These local lemmas are the inputs of the orbit and stabilizer counts of Layer 3.

<a id="local-monogenic-order"></a>
#### Local monogenic orders and their lattices

`GN.2/local-monogenic-order` · definition

Let f ∈ ℤ_ℓ[x] be monic irreducible with separable root field F = ℚ_ℓ[x]/(f), R = ℤ_ℓ[x]/(f) ⊆ O_F the monogenic order and δ = v_ℓ(disc f). An R-lattice of rank n is a full ℤ_ℓ-lattice in F^n stable under R. Its O_F-saturation is O_F·M. By Euler's lemma the trace dual of R is f′(θ)^{−1}R, so R ⊆ O_F ⊆ R^∨ = f′(θ)^{−1}R and [R^∨ : R] = ℓ^δ; the conductor 𝔣 = {x : xO_F ⊆ R} satisfies 𝔣·𝔡_{O_F} = f′(θ)O_F.

*Hypotheses.*

- ℓ prime; F a field (f irreducible); R need not be Dedekind and R-lattices need not be free.

*Uses.*

- Lipnowski–Tsimerman §3.1.2–3.2.1, pp.7–13: isotypic γ-stable lattices are R-lattices for R = ℤ_ℓ[γ]; their orbits and stabilizers are bounded through δ.
- AbelianSchemesAndArithmeticModuliPartII F4, adelic-stabilizers: local stabilizer and orbit bounds in an isogeny class.

*API.*

- `MonogenicOrder` (constructor): R = ℤ_ℓ[x]/(f) inside O_F for monic irreducible f.
- `MonogenicOrder.saturation` (data): M ↦ O_F·M on R-lattices in F^n.
- `MonogenicOrder.traceDual_eq` (characterisation): R^∨ = f′(θ)^{−1}R (Mathlib traceForm_dualSubmodule_adjoin).
- `MonogenicOrder.index_traceDual` (example): #(R^∨/R) = ℓ^{v_ℓ(disc f)}.
- `MonogenicOrder.conductor_mul_different` (compatibility): 𝔣·𝔡 = f′(θ)O_F (Mathlib conductor_mul_differentIdeal).

*Unit tests.*

- `monogenic_maximal` (degenerate): For f = x² + 1 over ℤ_3, R = O_F, the conductor is O_F and every R-lattice is O_F-free.
- `monogenic_index_two` (computation): For f = x² + 4 over ℤ_2 (θ = 2i), [O_F : R] = 2 and v_2(disc f) = 4 = 2·v_2([O_F : R]) + v_2(disc O_F) = 2 + 2.
- `monogenic_nonfree` (non-example): For R = ℤ_2[2i] the R-lattice O_F = ℤ_2[i] is not free over R (it needs two generators over the local ring R).

*Proof sketch.*

1. Euler's lemma is Mathlib's traceForm_dualSubmodule_adjoin; the conductor-different identity is conductor_mul_differentIdeal; disc f = ±N(f′(θ)).

*Checks.*

- f = x² + 1 over ℤ_3: R = O_F, δ = 0.
- f = x² + 4 over ℤ_2: R = ℤ_2[2i] has index 2 in O_F = ℤ_2[i], and δ = v_2(−16) = 4.

*Needs:* Mathlib `traceForm_dualSubmodule_adjoin`; Mathlib `conductor_mul_differentIdeal`; Mathlib `Submodule.IsLattice`; Mathlib `PadicInt`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §3.1.2, p.7 and §3.2.1, pp.11–12 (arXiv:1511.02212v1): Works with R = ℤ_ℓ[x]/(f), its fraction field F, R-lattices in F^n, the saturation M ↦ MO_F, and R^∨/R ≅ R/f′R of size governed by δ = v_ℓ(disc R).

<a id="normalized-lattice-sandwich"></a>
#### Normalized orbit representatives of R-lattices

`GN.2/normalized-lattice-sandwich` · theorem · `MonogenicOrder.exists_sandwich`

In the setting of local-monogenic-order, every R-lattice M ⊆ F^n is GL_n(F)-equivalent to a lattice M′ with R^n ⊆ M′ ⊆ O_F^n; then #(M′/R^n) ≤ #(O_F/R)^n ≤ ℓ^{δn}. If moreover γ-stable lattices for a semisimple γ with characteristic polynomial f^n are identified with R-lattices, the GL_n(F)-orbits of γ-stable lattices are represented by sublattices of colength at most δn in O_F^n.

*Hypotheses.*

- F a field; GL_n(F) acts on F^n; O_F^n is the unique saturated lattice up to GL_n(F).

*Proof sketch.*

1. GL_n(F) acts transitively on O_F-lattices, so move O_F·M to O_F^n. Choose m_i ∈ M forming an O_F-basis of O_F^n (Nakayama on M → O_F^n/𝔪O_F^n), write m_i = Ae_i with A ∈ GL_n(O_F) and replace M by A^{−1}M ⊇ R^n.
2. O_F^n/R^n injects into (R^∨/R)^n, of size ℓ^{δn}.

*Checks.*

- n = 1: every R-lattice M ⊆ F is F^×-equivalent to an R-module M′ with R ⊆ M′ ⊆ O_F, for example R or O_F itself.

*Needs:* `local-monogenic-order`; `lattice-index-ideal`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §3.1.2, p.7 (arXiv:1511.02212v1): Moves any R-lattice by GL_n(F) into the sandwich R^n ⊆ M′ ⊆ O_F^n and bounds the colength by the discriminant valuation.

<a id="stable-lattice-flag-fiber"></a>
#### Stable lattices with prescribed flag quotients

`GN.2/stable-lattice-flag-fiber` · theorem · `stableLattice_flagFiber_orbit`

Let γ be a semisimple endomorphism of a finite-dimensional ℚ_ℓ-space V with a γ-stable subspace V_1, π : V → V/V_1, and fix γ-stable lattices U_1 ⊆ V_1 and U_2 ⊆ V/V_1. For a γ-equivariant projection p : V → V_1, the assignment L ↦ φ_L (u ↦ p(any lift of u to L) mod U_1) is a well-defined map from γ-stable lattices L with L ∩ V_1 = U_1 and π(L) = U_2 to Hom_{ℤ_ℓ[γ]}(U_2, V_1/U_1)/Hom_{ℤ_ℓ[γ]}(U_2, V_1), independent of p; its fibres lie in single orbits of the unipotent part of the centralizer of γ.

*Hypotheses.*

- γ semisimple, so γ-equivariant projections onto V_1 exist.

*Proof sketch.*

1. Two lifts of u differ by an element of L ∩ V_1 = U_1; two projections differ by a ℤ_ℓ[γ]-map U_2 → V_1, which is quotiented out.
2. If φ_{L_1} = φ_{L_2}, write V = V_1 ⊕ ker p_2 = V_1 ⊕ ker p_1; the map that is the identity on V_1 and sends b ∈ ker p_2 to T(πb) + (π|ker p_1)^{−1}(πb) commutes with γ, is unipotent, and carries L_2 to L_1 (Lipnowski–Tsimerman Lemma 3.1).

*Checks.*

- V_1 = V: the fibre is a single lattice.
- γ = identity on ℚ_ℓ², V_1 = ℚ_ℓe_1, U_i = ℤ_ℓ: the lattices are ℤ_ℓ(e_2 + te_1) + ℤ_ℓe_1 with t ∈ ℚ_ℓ/ℤ_ℓ, all in one unipotent orbit.

*Needs:* `local-monogenic-order`; Mathlib `Submodule.IsLattice`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §3.1.3 and Lemma 3.1 with proof, pp.7–8 (arXiv:1511.02212v1): Defines φ_L from a γ-equivariant projection, shows it is well defined modulo maps into V_1, and proves that its fibres differ by a unipotent element of the centralizer.

<a id="finite-dvr-determinant-index"></a>
#### Index of a lattice under a stable endomorphism

`GN.2/finite-dvr-determinant-index` · theorem · `card_quotient_map_eq_pow_det`

Let O be a DVR with finite residue field of size q, valuation v, fraction field K, and T a free O-lattice spanning a finite-dimensional K-space W. If F ∈ GL_K(W) and F(T) ⊆ T, then T/F(T) and F^{−1}(T)/T are finite of cardinality q^{v(det F)}, and F induces an O-linear isomorphism F^{−1}(T)/T ≅ T/F(T). This includes rank 0 and v(det F) = 0.

*Hypotheses.*

- Finite residue field; F invertible on W.

*Proof sketch.*

1. The index ideal [T : F(T)]_O is (det F) (lattice-index-ideal, free case); over a DVR its cardinality is q^{v(det F)} (Smith normal form).
2. F restricts to an isomorphism F^{−1}(T) → T carrying T onto F(T).

*Checks.*

- W = K, F = multiplication by π^k: #(T/FT) = q^k.
- F = id: both quotients are 0.

*Needs:* `lattice-index-ideal`; Mathlib `Submodule.exists_smith_normal_form_of_le`; Mathlib `LinearMap.det`; Mathlib `IsDiscreteValuationRing`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §3.1.4–3.1.5, pp.9–10 (arXiv:1511.02212v1): Bounds cokernels of the maps F_i = γ*⊗1 − 1⊗γ by determinant valuations, which is this determinant-index statement for an endomorphism preserving a lattice.

<a id="isotypic-stabilizer-congruence-bound"></a>
#### Isotypic stabilizers contain a congruence kernel

`GN.2/isotypic-stabilizer-congruence-bound` · theorem · `congruenceKernel_le_stabilizer`

In the setting of local-monogenic-order with S = O_F and β = f′(θ): if R^n ⊆ M ⊆ S^n then ker(GL_n(S) → GL_n(S/βS)) ⊆ Stab(M), hence [GL_n(S) : Stab_{GL_n(S)}(M)] ≤ #M_n(S/βS) = ℓ^{n²δ_S} with ℓ^{δ_S} = #(S/βS), and this includes δ_S = 0 where the stabilizer is GL_n(S).

*Hypotheses.*

- This is the isotypic case only; the nonisotypic global exponent of Lipnowski–Tsimerman (20) is a separate (Layer 3) target.

*Proof sketch.*

1. βS ⊆ R by conductor_mul_differentIdeal (β ∈ 𝔣·𝔡 ⊆ 𝔣), so βS^n ⊆ R^n ⊆ M. For g ≡ 1 mod β: (g − 1)M ⊆ βS^n ⊆ M, so gM ⊆ M; apply to g^{−1}.
2. The index of a subgroup containing the kernel is at most the size of the image in GL_n(S/βS) ⊆ M_n(S/βS).

*Checks.*

- δ_S = 0 (R = S, β a unit): Stab(M) = GL_n(S) and the bound is 1.

*Needs:* `local-monogenic-order`; `normalized-lattice-sandwich`; Mathlib `conductor_mul_differentIdeal`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §3.2.1, pp.11–13 (arXiv:1511.02212v1): Bounds the depth of the stabilizer of M with R^n ⊆ M ⊆ O_F^n through maps into R^∨/R ≅ R/f′R; the congruence-kernel inclusion is the isotypic step of that bound.

<a id="good-prime-lattice-orbit"></a>
#### Unique local orbit of stable lattices at good primes

`GN.2/good-prime-lattice-orbit` · theorem · `goodPrime_lattice_unique_orbit`

Let γ be semisimple on a finite-dimensional ℚ_ℓ-space V with monic squarefree minimal polynomial f ∈ ℤ_ℓ[T] of unit discriminant. Then R = ℤ_ℓ[γ] is finite étale over ℤ_ℓ and equal to its maximal order S = ∏O_i (O_i the rings of integers of the factors K_i of ℚ_ℓ[T]/(f)); with V = ⊕K_i^{n_i}, every full γ-stable ℤ_ℓ-lattice is ⊕(free O_i-lattices of rank n_i), the centralizer ∏GL_{n_i}(K_i) acts transitively on them, and the stabilizer of one is conjugate to ∏GL_{n_i}(O_i).

*Hypotheses.*

- The discriminant is that of the squarefree minimal polynomial, not of the characteristic polynomial.

*Proof sketch.*

1. Unit discriminant: R is étale, hence normal, hence the maximal order ∏O_i (monogenic-order index ℓ^δ with δ = 0).
2. A γ-stable lattice is an R-module, hence decomposes along the idempotents of R, and each component is a finitely generated torsion-free module over the DVR O_i, hence free.

*Checks.*

- γ = diag(1, 2) on ℚ_3²: f = (T − 1)(T − 2), disc = 1, the stable lattices are ℤ_3a ⊕ ℤ_3b, one orbit under the diagonal torus.

*Needs:* `local-monogenic-order`; Mathlib `IsDiscreteValuationRing`; Mathlib `Module.free_of_finite_type_torsion_free'`.

*Source:* Michael Lipnowski, Jacob Tsimerman (LipnowskiTsimerman2018), §3.1, opening of §3.1 and §3.1.2, p.7 (arXiv:1511.02212v1): Decomposes V_ℓ by the irreducible factors of the minimal polynomial and reduces orbit counting to the isotypic R-lattices; at primes where the discriminant is a unit the colength bound δ is 0, giving a single orbit.

### 2.17 Signed hermitian forms: unitary groups and transfer

This completes 2.9 of the base plan (Kurinczuk–Skodlerack–Stevens §§3.1–3.5): the unitary group of a signed hermitian space, the norm-group criteria, equivariant linear forms, the parity decomposition of Witt groups, the theorem of Skodlerack and Stevens that transfer preserves the maximal Witt element (the input of 2.9.8), and the determinant and standard values of the transfer.

<a id="signed-hermitian-space"></a>
#### Signed hermitian spaces, their determinant and unitary group

`GN.2/signed-hermitian-space` · definition

An ε-hermitian space over F/F_o is a finite-dimensional F-vector space V with a nondegenerate sesquilinear form h, conjugate-linear in the first variable, with h(w, v) = ε·h(v, w)‾. Its Gram matrix J in a basis satisfies J̄ᵀ = εJ and changes to B̄ᵀJB; det(V) is the class of det J in F^×/N_F, where N_F = N_{F/F_o}(F^×) if F/F_o is quadratic and (F^×)² if F = F_o. The adjoint anti-involution a ↦ ā of End_F(V) is defined by h(av, w) = h(v, āw), and U(V, h) = {a ∈ Aut_F(V) : āa = 1} is the isometry group: a unitary group if F ≠ F_o, a symplectic group if F = F_o and ε = −1, a full orthogonal group if F = F_o and ε = 1. An isometry (V, h) ≅ (V′, h′) induces U(V, h) ≅ U(V′, h′), but not conversely: for F ≠ F_o and odd n there are two isometry classes of n-dimensional hermitian spaces with isomorphic unitary groups.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).
- The base packet's integral-hermitian-lattice carries the same sesquilinear convention; the classification theorems need the local-field hypotheses, the definition does not.

*Uses.*

- Kurinczuk–Skodlerack–Stevens §§3.4–3.6: Witt groups, twisting, transfer and self-dual embeddings are all built on these spaces.
- signed-hermitian-twist, signed-hermitian-transfer (base packet): the twist a^*(h) and the transfer λ∘h are signed hermitian spaces.
- Lipnowski–Tsimerman §5.2 (unitary-group-definite): the unitary group U_σ of a definite hermitian space is U(V, h) over a number field.

*API.*

- `SignedHermitianSpace` (structure): A finite-dimensional F-space with ε and a nondegenerate ε-hermitian sesquilinear form.
- `SignedHermitianSpace.adjoint` (data): ā, characterized by h(av, w) = h(v, āw).
- `SignedHermitianSpace.adjoint_unique` (characterisation): Any b with h(av, w) = h(v, bw) for all v, w equals ā.
- `SignedHermitianSpace.adjoint_comp` (simp): (ab)‾ = b̄ā, 1̄ = 1 and the adjoint is involutive.
- `SignedHermitianSpace.det` (data): det(V) ∈ F^×/N_F, the class of any Gram determinant.
- `SignedHermitianSpace.det_orthogonalSum` (simp): det(V ⊕ V′) = det(V)·det(V′).
- `SignedHermitianSpace.unitaryGroup` (constructor): U(V, h) = {a : āa = 1} as a subgroup of Aut_F(V); equal to the isometries of (V, h).
- `SignedHermitianSpace.unitaryGroupCongr` (functoriality): An isometry f : (V, h) ≅ (V′, h′) gives U(V, h) ≃* U(V′, h′), a ↦ faf^{−1}, compatible with composition.
- `SignedHermitianSpace.unitaryGroup_smul` (simp): U(V, αh) = U(V, h) for α ∈ F_o^× (so αh is again ε-hermitian).
- `SignedHermitianSpace.unitaryGroup_trivialExt` (compatibility): For F = F_o and ε = 1 the unitary group is Tau Ceti’s QuadraticMap.orthogonalGroup of x ↦ h(x, x)/2 (2 invertible).

*Unit tests.*

- `signedHermitian_hyperbolic_det` (computation): The hyperbolic plane has det = −ε modulo N_F.
- `signedHermitian_zero_dim` (degenerate): The zero space is ε-hermitian for both signs, has det = 1 and trivial unitary group.
- `unitaryGroup_iso_not_isometric` (non-example): For F/F_o quadratic and α ∈ F_o^× ∖ N_F, the one-dimensional spaces ⟨1⟩ and ⟨α⟩ are not isometric (determinants differ) but U(⟨1⟩) = U(⟨α⟩) = the norm-one group.
- `unitaryGroup_symplectic` (compatibility): For F = F_o, ε = −1 and the Gram matrix [[0, 1], [−1, 0]], U(V, h) = SL₂(F) = Sp₂(F).

*Proof sketch.*

1. The adjoint exists and is unique by finite-dimensional duality: v ↦ h(v, ·) is a bijective semilinear map V → V^*.
2. Determinant: det(B̄ᵀJB) = N(det B)·det J, so the class modulo N_F is well defined; it is multiplicative for orthogonal sums.
3. Remark 3.11: scaling h by a non-norm α ∈ F_o^× multiplies det by α^n, which for odd n changes the class, while U(V, αh) = U(V, h).

*Checks.*

- The hyperbolic plane has Gram matrix [[0, 1], [ε, 0]] and determinant class −ε.
- F = ℂ, F_o = ℝ (the convention also applies archimedeanly): h(x, y) = x̄y on ℂ is hermitian with h(i, i) = 1.

*Needs:* Mathlib `LinearMap.IsAdjointPair`; Mathlib `LinearMap.IsSymm`; Mathlib `Matrix.det`; `GN.2/integral-hermitian-lattice` (base plan); `GN.2/signed-hermitian-determinant-comparison` (base plan).

*Source:* Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens (KSS2021), §3.2, p.12; §3.3 and Remark 3.11, pp.13–14 (arXiv:1611.02667v3): §3.2 fixes ε-hermitian spaces with forms linear in the second variable, Gram matrices, the determinant modulo the norm group and the hyperbolic plane; §3.3 defines the adjoint anti-involution and U(V, h) with its three cases; Remark 3.11 records that isometric spaces have isomorphic unitary groups and that the converse fails for odd-dimensional hermitian spaces.

<a id="quadratic-norm-squares"></a>
#### Norms from a quadratic local extension versus squares

`GN.2/quadratic-norm-squares` · lemma · `normGroup_eq_sq_inf_of_neg_one_sq`

Let F/F_o be a quadratic extension of nonarchimedean local fields of odd residue characteristic. (i) −1 ∈ (F^×)² iff −1 ∈ N_{F/F_o}(F^×). (ii) If −1 ∈ (F^×)² then N_{F/F_o}(F^×) = (F^×)² ∩ F_o^×. (iii) N_{F/F_o}(O_F^×) = (O_F^×)² ∩ F_o^×.

*Hypotheses.*

- Odd residue characteristic is used for Hensel's lemma (1 + 𝔭_{F_o} ⊆ (O_{F_o}^×)²) and for the residue-field computation.

*Proof sketch.*

1. (iii) Reduce modulo 1 + 𝔭_{F_o}, which consists of squares, to the residue fields: if F/F_o is unramified both sides are k_{F_o}^× (the norm of finite fields is surjective), and if ramified both sides are (k_{F_o}^×)².
2. (i), (ii) follow from the base packet's odd-local-quadratic-norms, N(F^×) = ((F^×)² ∩ F_o^even) ∪ (−(F^×)² ∩ F_o^odd): if −1 is a square the second set lies in (F^×)², and conversely if −1 is a norm it lies in one of the two sets, the first since val(−1) = 0.

*Checks.*

- F_o = ℚ_3, F = ℚ_3(√−1): −1 is a square in F, and the norms are (F^×)² ∩ ℚ_3^× = {x : val(x) even}.
- F_o = ℚ_3, F = ℚ_3(√3): −1 is not a square in F (F's residue field is 𝔽_3) and −1 is not a norm.

*Needs:* `GN.2/odd-local-quadratic-norms` (base plan); Mathlib `hensels_lemma`; LocalFieldsRamification, layer 1 units the filtration and the multiplicative group.

*Source:* Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens (KSS2021), Lemma 3.1 (i)–(ii) and equation (3.3) with its proof, p.10 (arXiv:1611.02667v3): States the description of the norm group, derives (i)–(iii) from it, and proves the unit statement (3.3) by Hensel and the residue fields.

<a id="equivariant-linear-form"></a>
#### Galois-equivariant linear forms on a self-dual extension

`GN.2/equivariant-linear-form` · construction

Let (E, β) be a self-dual extension of F/F_o: E = F[β] a field to which the involution of F extends with β̄ = −β, fixed field E_o, n = [E : F]. An F-linear form λ : E → F is Galois-equivariant if λ(x̄) = λ(x)‾. The standard form λ_β is given by λ_β(1) = 1 and λ_β(β^i) = 0 for 1 ≤ i ≤ n − 1; it is Galois-equivariant. Every nonzero F-linear form on E is x ↦ λ_β(γx) for a unique γ ∈ E^×, and it is Galois-equivariant iff γ ∈ E_o^×.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).
- E/F finite with an extending involution; for β = 0 the extension is E = F and λ_β = id.

*Uses.*

- signed-hermitian-transfer (base packet): the transfer is defined for a Galois-equivariant λ.
- signed-transfer-image-independent (base packet): λ = λ′(γ·) with γ ∈ E_o^× gives λ_* = λ′_* ∘ γ^*.
- standard-transfer-values (this packet): the explicit values are computed for λ_β.

*API.*

- `SelfDualExtension` (structure): A pair (E, β) with E = F[β] and an involution extending that of F with β̄ = −β.
- `SelfDualExtension.stdForm` (constructor): λ_β : E →ₗ[F] F with λ_β(1) = 1, λ_β(β^i) = 0 for 0 < i < n.
- `SelfDualExtension.stdForm_equivariant` (characterisation): λ_β(x̄) = λ_β(x)‾.
- `SelfDualExtension.exists_unique_eq_stdForm_mul` (universal-property): Every nonzero λ ∈ Hom_F(E, F) is x ↦ λ_β(γx) for a unique γ ∈ E^×.
- `SelfDualExtension.equivariant_iff` (characterisation): λ_β(γ·) is Galois-equivariant iff γ̄ = γ, i.e. γ ∈ E_o^×.

*Unit tests.*

- `stdForm_trivial` (degenerate): For β = 0 (E = F), stdForm = id and the equivariant forms are the multiplications by γ ∈ F_o^×.
- `stdForm_quadratic` (computation): For E = F(β), β² = b ∈ F_o^×, stdForm (x + yβ) = x and the trace Tr_{E/F} = 2·stdForm.
- `stdForm_mul_beta_not_equivariant` (non-example): x ↦ λ_β(βx) is a nonzero F-linear form but not Galois-equivariant, since β̄ = −β ≠ β.

*Proof sketch.*

1. Nondegeneracy of the trace-like pairing (x, y) ↦ λ_β(xy): its Gram matrix in the basis 1, β, …, β^{n−1} is triangular with unit anti-diagonal pattern, so x ↦ λ_β(x·) is an isomorphism E ≅ Hom_F(E, F).
2. Equivariance of λ_β: the involution sends β^i to (−β)^i, and λ_β((−β)^i) = 0 = λ_β(β^i)‾ for 1 ≤ i ≤ n − 1.
3. λ_β(γ·) is equivariant iff λ_β(γ̄x̄) = λ_β(γx)‾ = λ_β(γ̄ x̄)·… reduces to γ̄ = γ by nondegeneracy.

*Checks.*

- E = F, β = 0: λ_β = id, γ ∈ F_o^×.
- E = F(β) with β² = b ∈ F_o, β̄ = −β, n = 2: λ_β(x + yβ) = x.

*Needs:* `signed-hermitian-space`; `GN.2/signed-hermitian-transfer` (base plan); QuadraticFormInvariants, layer 9 transfer and the relative stiefel whitney formula.

*Source:* Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens (KSS2021), §3.1, definition of a self-dual extension, p.10; §3.5, first paragraph, p.15 (arXiv:1611.02667v3): Defines self-dual extensions; introduces Galois-equivariant F-linear forms, the standard form λ_β, and the parametrization of all such forms as λ_β(γ·) with γ ∈ E_o^×.

<a id="signed-witt-parity"></a>
#### Even and odd parts of a signed hermitian Witt group

`GN.2/signed-witt-parity` · definition

For a finite extension E/E_o of the type above (E = E_o or quadratic) and ε = ±1, W^ε_even(E/E_o) ⊆ W^ε(E/E_o) is the subgroup of Witt classes of even anisotropic dimension; dim_an mod 2 : W^ε(E/E_o) → ℤ/2 is a homomorphism, and if W^ε(E/E_o) is nontrivial its kernel W^ε_even has index 2 and W^ε_odd is the nonidentity coset. The maximal element (the class of maximal anisotropic dimension) is the unique class fixed by all symmetric twists besides 0.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).

*Uses.*

- Kurinczuk–Skodlerack–Stevens, Proposition 3.14, p.15: the transfer is injective on W_even and on W_odd separately.
- Skodlerack–Stevens, proof of Theorem 4.4, p.10: the maximal element is the only nonzero class fixed by all symmetric twists.

*API.*

- `SignedWitt.anisotropicDimParity` (constructor): dim_an mod 2 : W^ε(E/E_o) →+ ZMod 2.
- `SignedWitt.even` (data): W^ε_even, the kernel of anisotropicDimParity.
- `SignedWitt.odd` (data): W^ε_odd, the preimage of 1.
- `SignedWitt.index_even` (characterisation): If W^ε ≠ 0 then [W^ε : W^ε_even] = 2.
- `SignedWitt.maximal` (data): The maximal element, the class of maximal anisotropic dimension.
- `SignedWitt.maximal_mem_even` (other): The maximal element has even anisotropic dimension (2 in the unitary case, 4 in the orthogonal case).
- `SignedWitt.twist_fixed_iff` (characterisation): A class is fixed by every symmetric twist iff it is 0 or the maximal element.

*Unit tests.*

- `signedWitt_unitary_card_even` (computation): In the unitary case #W^ε_even = 2 and #W^ε_odd = 2.
- `signedWitt_symplectic` (degenerate): For F = F_o, ε = −1, W^ε = 0, so W_even = W and W_odd is empty.
- `signedWitt_hyperbolic_even` (characterisation): The class of n hyperbolic planes is 0 ∈ W_even, whatever n.
- `signedWitt_parity_not_dim` (non-example): Parity is that of the anisotropic dimension, not of dim V: ⟨1⟩ ⊕ H has odd dimension 3 and odd class, but ⟨1⟩ ⊕ ⟨−1⟩ has even dimension and class 0 (for −1 ∈ N_F in the unitary case).

*Proof sketch.*

1. Anisotropic dimensions add modulo 2 under orthogonal sum because hyperbolic planes are even-dimensional, so dim_an mod 2 is a homomorphism on W^ε.
2. It is surjective whenever a one-dimensional anisotropic space exists, i.e. outside the symplectic case F = F_o, ε = −1 (where W^ε = 0).
3. Maximal element: Kurinczuk–Skodlerack–Stevens Remark 3.9 lists it; Skodlerack–Stevens observe that symmetric twists act transitively on classes of fixed odd anisotropic dimension.

*Checks.*

- Unitary case: W^ε has order 4, W^ε_even = {0, maximal element}, W^ε_odd the two one-dimensional classes.
- Orthogonal case F = F_o: order 16, W_even of order 8.

*Needs:* `GN.2/signed-hermitian-witt-comparison` (base plan); `signed-hermitian-space`.

*Source:* Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens (KSS2021), §3.4, Remark 3.9 and Proposition 3.12, pp.13–14; §3.5, the paragraph before Proposition 3.14, p.15 (arXiv:1611.02667v3): Describes the maximal anisotropic space, the structure of W^ε, and defines W^ε_even and W^ε_odd as the even subgroup and its nonidentity coset. Daniel Skodlerack, Shaun Stevens (SkodlerackStevens2020), §4, the paragraph after Definition 4.5, p.9 (arXiv:1503.08882v3): Notes that the only classes fixed by every symmetric twist are 0 and the maximal element, the twists acting transitively on each odd anisotropic dimension.

<a id="skodlerack-stevens-maximal-transfer"></a>
#### Transfer preserves the maximal Witt element (Skodlerack–Stevens)

`GN.2/skodlerack-stevens-maximal-transfer` · theorem · `SignedWitt.transfer_maximal`

Let E/F be a finite extension of nonarchimedean local fields of odd residue characteristic, ρ an involution of F with fixed field F_o (possibly trivial), ρ′ an involution of E extending it, ε = ±1, and λ : E → F a nonzero ρ′-ρ-equivariant F-linear map. Then the transfer Tr_λ : W^ε(E/E_o) → W^ε(F/F_o), ⟨h̃⟩ ↦ ⟨λ ∘ h̃⟩, sends the maximal element X_{ρ′,ε,E} to the maximal element X_{ρ,ε,F}. In addition Tr_λ is bijective when [E : F] is odd, and for [E : F] = 2 with F = F_o its image has at least four elements, it is injective when E ≠ E_o, and its kernel has exactly four elements, all of anisotropic dimension at most 2, when E = E_o.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).
- This is the input cited as [39, Theorem 4.4] in Kurinczuk–Skodlerack–Stevens Proposition 3.13(ii).

*Proof sketch.*

1. Reduce to ε = 1 by a skew-symmetric twist (when F ≠ F_o it commutes with transfer); reduce to one λ, since two equivariant forms differ by a symmetric twist.
2. The image of the maximal element is fixed by all symmetric twists by elements of F_o^× (they commute with Tr_λ), hence is 0 or the maximal element (signed-witt-parity); it suffices to show it is nonzero.
3. Odd degree: Tr_λ⟨1⟩ has odd anisotropic dimension and its twists generate, so Tr_λ is surjective, hence bijective by counting (Proposition 4.6).
4. Transitivity in towers reduces to quadratic E/F; with λ = Tr_{E/F} compute Gram matrices in the basis 1, α (α a skew-symmetric uniformizer) and choose δ with −det not a square to get a nonzero image (Lemma 4.7); conclude in the remaining quadratic cases.

*Checks.*

- Skodlerack–Stevens Example 4.3: E = ℚ_3(√3, √5), F = ℚ_3(√5), ρ′(√5) = −√5: the transfer kills ⟨√3⟩ but sends ⟨√3⟩ ⊕ ⟨1⟩ (maximal) to the maximal class.

*Needs:* `GN.2/signed-hermitian-transfer` (base plan); `signed-witt-parity`; `GN.2/signed-witt-scalar-twist` (base plan); `GN.2/signed-hermitian-witt-comparison` (base plan); `equivariant-linear-form`.

*Source:* Daniel Skodlerack, Shaun Stevens (SkodlerackStevens2020), §4: Theorem 4.1, Definitions 4.2 and 4.5, Example 4.3, Theorem 4.4, Proposition 4.6, Lemma 4.7 and the proof of Theorem 4.4, pp.8–11 (arXiv:1503.08882v3): Theorem 4.4 states that the transfer of the maximal anisotropic class of E is the maximal anisotropic class of F; Proposition 4.6 proves bijectivity in odd degree and Lemma 4.7 the quadratic case with the kernel description; the proof combines them through symmetric twists and transitivity in towers.

<a id="signed-transfer-determinant"></a>
#### Determinant of a transferred signed hermitian space

`GN.2/signed-transfer-determinant` · theorem · `signedHermitianTransfer_det`

Let (E, β) be a self-dual extension of F/F_o, n = [E : F], and λ a nonzero Galois-equivariant F-linear form on E. For every ε-hermitian space (V, h) over E/E_o, det(λ_*V) = det(λ_*⟨1⟩)^{dim_E V}·N_{E/F}(det V) in F^×/N_F. For F = F_o and ε = 1 (quadratic forms, trivial involution) this is Scharlau's determinant formula for the transfer s_*(q).

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).

*Proof sketch.*

1. Diagonalize (V, h) ≅ ⟨α_1⟩ ⊕ ⋯ ⊕ ⟨α_m⟩ (possible outside the symplectic case; the symplectic case reduces by a twist).
2. λ_*⟨α⟩ ≅ λ_*(α·⟨1⟩): in the F-basis {α^{−1}·b_j} of E its Gram matrix is that of λ_*⟨1⟩ twisted by multiplication by α, whose F-determinant is N_{E/F}(α); hence det λ_*⟨α⟩ = det λ_*⟨1⟩·N_{E/F}(α).
3. Multiply over the orthogonal summands, using det_orthogonalSum.

*Checks.*

- n = 1 (E = F, λ = id): det(V) = det(V).
- V hyperbolic over E: λ_*V = nH has det (−ε)^n, and det(λ_*⟨1⟩)²·N(−ε) gives the same class.

*Needs:* `signed-hermitian-space`; `equivariant-linear-form`; `GN.2/signed-hermitian-transfer` (base plan); `GN.2/signed-hermitian-determinant-comparison` (base plan).

*Source:* Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens (KSS2021), Proposition 3.15(i) and the first sentence of its proof, pp.15–16 (arXiv:1611.02667v3): States the determinant of the transfer as det(λ_*⟨1⟩)^{dim V} times the norm of det V and refers to Scharlau, Lemma 5.8, for the quadratic-form analogue, the hermitian case following with extra signs.

<a id="standard-transfer-values"></a>
#### The standard transfer of ⟨1⟩ and ⟨β⟩

`GN.2/standard-transfer-values` · theorem · `stdTransfer_one`

Let (E, β) be a self-dual extension of F/F_o with n = [E : F] and λ_β the standard form. In W^1(F/F_o): λ_{β*}⟨1⟩ ≅ ((n−1)/2)H ⊕ ⟨1⟩ if n is odd and ≅ ((n−2)/2)H ⊕ ⟨1⟩ ⊕ ⟨(−1)^{n/2+1}N_{E/F}(β)⟩ if n is even. In W^{−1}(F/F_o): λ_{β*}⟨β⟩ = ⟨(−1)^{(n−1)/2}N_{E/F}(β)⟩ if n is odd and 0 if n is even. Consequently, when F/F_o is quadratic, λ_{β*} is determined on all of W^ε(E/E_o) by these values, signed-transfer-determinant and the classification by dimension and determinant.

*Hypotheses.*

- Nonarchimedean local fields of odd residue characteristic; F/F_o quadratic or F = F_o, with the Galois involution x ↦ x̄; ε = ±1; h is sesquilinear, conjugate-linear in the first and linear in the second variable, with h(w, v) = ε·h(v, w)‾ (Mathlib's convention and that of Kurinczuk–Skodlerack–Stevens §3.2).

*Proof sketch.*

1. Let X^n + b_{n−1}X^{n−1} + ⋯ + b_0 be the minimal polynomial of β. In the basis 1, β, …, β^{n−1} the Gram matrix of λ_{β*}⟨1⟩ has entries (−1)^i λ_β(β^{i+j}), which vanish for 1 ≤ i + j ≤ n − 1; its first row and column are (1, 0, …, 0), and the anti-diagonal below is ±b_0.
2. For n odd, the span of β, …, β^{n−1} has the totally isotropic subspace spanned by β, …, β^{(n−1)/2} of half its dimension, so it is hyperbolic.
3. For n even, split off ⟨1⟩ and a hyperbolic part of dimension n − 2, and read the remaining one-dimensional class from the determinant (signed-transfer-determinant), N_{E/F}(β) = (−1)^n b_0.
4. The ⟨β⟩ case is the same computation for the skew-hermitian form, or follows from (i) and a twist by β.
5. Unitary case: an ε-hermitian space over a quadratic F/F_o is determined by dimension and determinant (Kurinczuk–Skodlerack–Stevens Remark 3.10).

*Checks.*

- n = 1: λ_{β*}⟨1⟩ = ⟨1⟩.
- n = 2, β² = b: λ_{β*}⟨1⟩ = ⟨1⟩ ⊕ ⟨N_{E/F}(β)⟩ = ⟨1⟩ ⊕ ⟨−b⟩, matching the Gram matrix diag(1, −b) of x + yβ ↦ λ_β((x+yβ)‾(x+yβ)).

*Needs:* `signed-transfer-determinant`; `equivariant-linear-form`; `GN.2/signed-hermitian-transfer` (base plan); `signed-hermitian-space`.

*Source:* Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens (KSS2021), Proposition 3.15(ii) with the sketched proof, p.16, and Remark 3.16, p.16 (arXiv:1611.02667v3): Gives the transfer of ⟨1⟩ and ⟨β⟩ under λ_β in both parities, with the Gram matrix in the power basis and the hyperbolic splitting, and remarks that in the unitary case these values determine the standard transfer completely.

### 2.18 Lattices with Frobenius and Zarhin’s trick

The lattice arithmetic of Charles’s proof of the Tate conjecture for K3 surfaces and of the Lieblich–Maulik–Snowden lemmas it uses. Nikulin’s embedding theory itself is TauCetiRoadmap IntegralLattices Layer 5 and is cited, not planned.

<a id="lambda-2d-lattice"></a>
#### The lattices Λ_{2d} = ⟨2d⟩ ⊕ U

`GN.2/lambda-2d-lattice` · definition

For an integer d > 0, Λ_{2d} = ℤh ⊕ U with h² = 2d and U the even unimodular hyperbolic plane (basis e, f, e² = f² = 0, e·f = 1); it is an even lattice of signature (2, 1) and rank 3 whose discriminant group is ℤ/2d, generated by h/2d with discriminant quadratic form q(h/2d) = 1/(2d) mod 2ℤ. Its genus contains one class (IntegralLattices 5D, U ⊕ T unique in its genus).

*Hypotheses.*

- Bilinear convention of Tau Ceti IntegralLattice: an integer symmetric bilinear form with x·x ∈ 2ℤ for even lattices.

*Uses.*

- Charles, Proposition 2.9 and Theorem 2.10, pp.500–503: primitive embeddings of rank-two lattices into Λ_{2d} and Λ_{2md} realise the Zarhin trick.
- primitive-embedding-congruence-transport (this packet): the target lattices of the transport.

*API.*

- `lambda2d` (constructor): Λ_{2d} as IntegralLattice.ofGramMatrix of diag(2d) ⊕ [[0, 1], [1, 0]].
- `lambda2d_rank` (simp): rank Λ_{2d} = 3 and signature (2, 1).
- `lambda2d_discriminantGroup` (characterisation): The discriminant group is cyclic of order 2d, generated by h/2d with q = 1/(2d) mod 2.
- `lambda2d_even` (other): Λ_{2d} is even.

*Unit tests.*

- `lambda2d_card_disc` (computation): #A(Λ_{2d}) = 2d; for d = 3, #A = 6.
- `lambda2_disc` (degenerate): For d = 1 the discriminant group is ℤ/2 with q = 1/2.
- `lambda2d_not_unimodular` (non-example): Λ_{2d} is never unimodular for d ≥ 1 (|det| = 2d ≥ 2), unlike U.

*Proof sketch.*

1. Discriminant group: L^⋆ = (1/2d)ℤh ⊕ U, so A = ℤ/2d (Tau Ceti discriminantGroup, natCard_discriminantGroup_eq_natAbs_gramDet: |det| = 2d).

*Checks.*

- d = 1: Λ_2 has discriminant group ℤ/2.

*Needs:* Tau Ceti `TauCeti.IntegralLattice.ofGramMatrix`; Tau Ceti `TauCeti.IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet`; IntegralLattices, layer 2 duality and the finite discriminant group.

*Source:* François Charles (Charles2016), §2.2, the lattices Λ_{2d}, pp.500–501 (Annals 184): Introduces ⟨2d⟩ ⊕ U as the primitive cohomology lattice of a polarized K3 surface of degree 2d and uses its discriminant form in Proposition 2.9.

<a id="primitive-embedding-congruence-transport"></a>
#### Transport of primitive embeddings into Λ_{2md} (Charles)

`GN.2/primitive-embedding-congruence-transport` · theorem · `primitiveEmbedding_lambda_transport`

Let d > 0 and S an even positive definite lattice of rank 2 with a primitive embedding S ↪ Λ_{2d}. There are N > 0 and nonzero integers a, b such that for every m > 0 with m ≡ 1 mod N, gcd(m, ab) = 1 and a, b squares modulo m, S admits a primitive embedding into Λ_{2md}. Primitivity of the initial embedding is necessary: in Λ_2 the sublattice spanned by 2h and 2(e + f) is isometric to diag(8, 8) but the abstract lattice diag(8, 8) has no primitive embedding into Λ_2, so the statement for arbitrary rank-2 sublattices fails already at m = 1.

*Hypotheses.*

- The initial embedding is primitive (corrected statement; source issue E201).

*Proof sketch.*

1. Nikulin's criterion (IntegralLattices 5I, Proposition 1.15.1): a primitive embedding S ↪ Λ exists iff there are subgroups H_S ⊆ A_S, H ⊆ A_Λ, an isometry γ of the restricted forms and a negative definite rank-one even lattice K = ⟨−2t⟩ with q_K ≅ −δ, δ = (q_S ⊕ −q_Λ)|Γ_γ^⊥/Γ_γ.
2. Transport the gluing data along id ⊕ m: A_{Λ_{2d}} → A_{Λ_{2md}}; under m ≡ 1 mod 4dt and the coprimality exclusions, the new quotient is cyclic of order 2tm with generator of norm 1/(2t) + y_0²(m − 1)/(2md).
3. Rescale the generator by λ with λ ≡ 1 mod 4dt and λ²ty_0² + d ≡ 0 mod m, solvable by CRT when −d and t are squares mod m (prime-power-square-lift), giving the cyclic form of ⟨−2tm⟩ and the embedding by 5I.
4. Counterexample: a primitive embedding of S = diag(8, 8) into Λ_2 has complement K = ⟨−2t⟩ and glue group H, which embeds into both A_S ≅ (ℤ/8)² and A_K ≅ ℤ/2t, so H is cyclic of order at most 8; but |H|² = |A_S||A_K|/|A_{Λ_2}| = 64t forces |H| = 8 and t = 1, contradicting H ⊆ ℤ/2.

*Checks.*

- S with Gram [[2, 1], [1, 2dk²]] is primitively embedded in Λ_{2d} (zarhin-explicit-plane), so the theorem applies to it.

*Needs:* `lambda-2d-lattice`; `prime-power-square-lift`; IntegralLattices, layer 4 overlattices and isotropic subgroups.

*Source:* François Charles (Charles2016), Proposition 2.9 and its proof, pp.500–502 (Annals 184): States and proves the congruence transport of embeddings of a rank-two positive lattice into Λ_{2d} through Nikulin’s criterion, the cyclic gluing quotient and a CRT rescaling; the printed statement asks for arbitrary embeddings.

<a id="zarhin-explicit-plane"></a>
#### An explicit primitive positive plane in Λ_{2d}

`GN.2/zarhin-explicit-plane` · theorem · `lambda2d_explicitPlane`

For d, k > 0, the vectors v = (0, 1, 1) and w = (k, 1, 0) in the coordinates (h, e, f) of Λ_{2d} span a primitive rank-2 sublattice with Gram matrix [[2, 1], [1, 2dk²]] (determinant 4dk² − 1 > 0, positive definite); l = 2w − v = (2k, 1, −1) is orthogonal to v with l² = 2(4dk² − 1), and the orthogonal complement of ℤv + ℤw is generated by u = (1, 2dk, −2dk) with u² = −2d(4dk² − 1). For odd n and k divisible by |n|, l² ≡ −2 mod n, so gcd(l², n) = 1.

*Hypotheses.*

- Coordinates: x = ah + be + cf has x² = 2da² + 2bc.

*Proof sketch.*

1. Direct computation of the Gram entries with x² = 2da² + 2bc.
2. Primitivity: the ℤ-linear retraction P(x, y, z) = (z, y − z) of Λ_{2d} onto ℤ² satisfies P(av + bw) = (a, b), so ℤv + ℤw is a direct summand.

*Checks.*

- d = k = 1: Gram [[2, 1], [1, 2]] = A₂, l² = 6, u² = −6.

*Needs:* `lambda-2d-lattice`.

*Source:* François Charles (Charles2016), Theorem 2.10 and its proof, pp.502–503 (Annals 184): Chooses an initial rank-two positive lattice in Λ_{2d} with a norm-two vector and prime-to-n complement to start the Zarhin trick; the coordinates here make that choice explicit.

<a id="isotropic-quotient-discriminant"></a>
#### Discriminant of the quotient by a primitive isotropic vector

`GN.2/isotropic-quotient-discriminant` · theorem · `disc_eq_sq_mul_disc_isotropicQuotient`

Let L be a nondegenerate integral ℤ-lattice, v ∈ L primitive and isotropic, and n_v > 0 the generator of (v, L) ⊆ ℤ. Then K = v^⊥/ℤv is a nondegenerate lattice and |disc L| = n_v²·|disc K|.

*Hypotheses.*

- Integral symmetric bilinear lattice (Tau Ceti IntegralLattice).

*Proof sketch.*

1. Choose w ∈ L with (v, w) = n_v and a basis (w, v, e_1, …, e_r) adapted to v^⊥ = ℤv ⊕ span(e_i) (primitive v); in this basis the Gram matrix has the block form with (w, v) = n_v and (v, v) = (v, e_i) = 0, so det = −n_v²·det(e_i·e_j).

*Checks.*

- L = U, v = e: n_v = 1, K = 0, |disc| = 1 = 1·1.
- L = U(2) (Gram [[0, 2], [2, 0]]), v = e: n_v = 2, K = 0, |disc| = 4 = 2².

*Needs:* Tau Ceti `TauCeti.IntegralLattice.natCard_discriminantGroup_eq_natAbs_gramDet`; IntegralLattices, layer 1 lattices with forms.

*Source:* François Charles (Charles2016), Proof of Proposition 4.3, p.520 (Annals 184): Relates the discriminant of a lattice and of the quotient of the orthogonal of a primitive isotropic vector by the divisibility n_v, via a basis containing v and w with (v, w) = n_v.

<a id="prime-power-square-lift"></a>
#### Squares modulo ℓ lift; simultaneous quadratic-residue primes

`GN.2/prime-power-square-lift` · lemma · `isSquare_mod_pow_of_isSquare_mod`

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

*Needs:* Mathlib `hensels_lemma`; Mathlib `orderOf`; Mathlib `legendreSym.quadratic_reciprocity`; Mathlib `Nat.infinite_setOfPred_prime_and_eq_mod`; Mathlib `ZMod.exists_sq_eq_neg_one_iff`.

*Source:* François Charles (Charles2016), Lemma 4.6, p.521, and the proof of Theorem 1.3, p.523 (Annals 184): Proves that finitely many integers are simultaneously squares modulo infinitely many primes by reciprocity and Dirichlet, and uses that ℓ^{2n} ≡ 1 mod N along a subsequence with squares lifting to prime powers.

<a id="compatible-system-norm-selection"></a>
#### Selecting a vector of prescribed norm in compatible ℓ-adic systems

`GN.2/compatible-system-norm-selection` · theorem · `exists_primitive_norm_of_compatibleSystem`

For every sufficiently large odd prime ℓ let M_ℓ be a unimodular ℤ_ℓ-lattice with a semisimple isometry φ_ℓ whose characteristic polynomial is a fixed P ∈ ℚ[T], with disc(M_ℓ ⊗ ℚ_ℓ) a fixed rational square class δ. Put N_ℓ = M_ℓ ∩ ker(φ_ℓ² − 1), assume N_ℓ unimodular, let A_ℓ ⊆ N_ℓ be isometric to A ⊗ ℤ_ℓ for a fixed nondegenerate integral lattice A, and suppose T_ℓ = A_ℓ^⊥ ∩ N_ℓ has positive rank. Fix t ∈ ℚ^×. If ℓ avoids the primes in the numerators and denominators of t, δ and disc A, and the splitting field of P together with √−1, √δ, √disc A and √t embeds into ℚ_ℓ, then T_ℓ contains a primitive vector of norm t. Moreover a vector γ ∈ T_ℓ of unit norm is primitive in A_ℓ^⊥ and its image in (M_ℓ/A_ℓ) ⊗ ℚ_ℓ/ℤ_ℓ divided by ℓ^n has exact order ℓ^n.

*Hypotheses.*

- ℓ in the infinite set given by prime-power-square-lift (c) for the finitely many constants.

*Proof sketch.*

1. disc N_ℓ = (−1)^{n/2}δ (isometry-eigenspace-decomposition (d)) is a unit square class; A_ℓ splits off N_ℓ integrally (IntegralLattices 0F over ℤ_ℓ), so T_ℓ is unimodular with square-class determinant disc N_ℓ/disc A.
2. If rank T_ℓ ≥ 2 apply odd-unimodular-unit-representation; in rank 1 the determinant and t are squares in ℚ_ℓ by the choice of ℓ, so the rank-one case of that node applies.
3. Unit norm forces primitivity; the order statement is the elementary divisor computation in M_ℓ/A_ℓ.

*Checks.*

- P = (T − 1)^r: N_ℓ = M_ℓ and the statement is odd-unimodular-unit-representation for A^⊥.

*Needs:* `odd-unimodular-unit-representation`; `isometry-eigenspace-decomposition`; `prime-power-square-lift`; `lattice-discriminant-ideal`.

*Source:* Max Lieblich, Davesh Maulik, Andrew Snowden (LMS2018), §3.5, Lemmas 3.5.1–3.5.2 and the proof of Proposition 3.5.3, pp.15–16 (arXiv:1107.1221): Selects primes where a Frobenius-stable unimodular lattice has an orthogonal complement representing a prescribed norm, using the discriminant of the fixed part and Hensel. François Charles (Charles2016), §4.2, Lemma 4.5 and its proof, pp.520–521 (Annals 184): Applies this selection to construct twisted partners of K3 surfaces with prescribed Brauer classes.

<a id="frobenius-eigenlattice-discriminant-bound"></a>
#### Discriminants of Frobenius eigenlattices

`GN.2/frobenius-eigenlattice-discriminant-bound` · theorem · `disc_eigenlattice_le`

Fix r > 0, an even w ≥ 0 and q. Let O be the ring of integers of a finite unramified extension of ℚ_ℓ and M a nondegenerate O-lattice of rank r with an endomorphism φ such that (φx, φy) = q^w(x, y), whose characteristic polynomial is integral with all roots Weil q-integers of weight w and for which q^{w/2} is a semisimple eigenvalue. Let M_0 = M ∩ ker(φ − q^{w/2}). Then v_ℓ(disc M_0) ≤ v_ℓ(disc M) for ℓ > C(r, w, q), and v_ℓ(disc M_0) ≤ C′(r, w, q) + v_ℓ(disc M) for all ℓ.

*Hypotheses.*

- The similitude relation (φx, φy) = q^w(x, y) is a hypothesis; the conclusion bounds valuations only, not a rational square class.

*Proof sketch.*

1. The characteristic polynomial lies in a finite set of polynomials f_i = g_ih_i (g_i a power of T − q^{w/2}, h_i(q^{w/2}) ≠ 0) determined by (r, w, q); fix Bézout identities a_ig_i + b_ih_i = 1 with denominators dividing a fixed Q, and let C be the largest prime dividing Q and C′ = 2rs with ℓ^s ∥ Q.
2. M_1 = h(φ)M ⊆ M_0 and M_2 = g(φ)M are orthogonal by the similitude relation; for ℓ > C, M = M_1 ⊕ M_2 and M_1 = M_0 (both saturated), so disc M_0 divides disc M; in general ℓ^sM ⊆ M_1 ⊕ M_2 and the length comparison (lattice-discriminant-ideal) gives the bound C′ + v_ℓ(disc M).

*Checks.*

- φ = q^{w/2}·id: M_0 = M and the bound is equality.

*Needs:* `lattice-discriminant-ideal`; `lattice-index-ideal`; `isometry-eigenspace-decomposition`.

*Source:* Max Lieblich, Davesh Maulik, Andrew Snowden (LMS2018), Proposition 2.1.2 and its proof, pp.3–4 (arXiv:1107.1221): Bounds the discriminant valuation of the q^{w/2}-eigenlattice of a lattice with a Frobenius-type similitude in terms of that of the ambient lattice, uniformly for large ℓ. François Charles (Charles2016), Proof of Lemma 4.5, p.520 (Annals 184): Uses the Lieblich–Maulik–Snowden bound to control the discriminant of Néron–Severi-type eigenlattices.

### 2.19 Trace-unimodular lattices, Witt groups of Dedekind rings and ternary forms

Even ℤ-unimodular lattices over a totally real field, with an existence proof by local construction and the local-global dictionary; the signature splitting of Witt groups of Dedekind rings; and the classification of integral ternary forms of unit half-discriminant.

<a id="trace-unimodular-lattice"></a>
#### Trace-even and trace-unimodular lattices over a totally real field

`GN.2/trace-unimodular-lattice` · definition

Let F be a totally real number field with different 𝔡_F, (V, Q) a nondegenerate quadratic space over F with bilinear form (x, y), Q(x) = (x, x)/2, and L ⊆ V an O_F-lattice. L is even if Q(L) ⊆ 𝔡_F^{−1}, its trace dual is L′ = {y ∈ V : (y, L) ⊆ 𝔡_F^{−1}} (the ℤ-dual of L for Q_ℤ = Tr_{F/ℚ}∘Q), and L is ℤ-unimodular if L′ = L. U_F is the commutative monoid of even ℤ-unimodular lattices under ⊥ and U_F^+ its subsemigroup of nonzero totally positive definite ones. For even L, L′/L is finite with the quadratic form Q mod 𝔡_F^{−1}; for h in the adelic orthogonal (or GSpin) group, L_h = V ∩ h^{−1}L̂ is in the genus of L and h^{−1} identifies L′/L with L_h′/L_h.

*Hypotheses.*

- F totally real; 𝔡_F^{−1} the inverse different, so Tr_{F/ℚ}(𝔡_F^{−1}) ⊆ ℤ (Mathlib differentIdeal).

*Uses.*

- Li, Algebraicity of higher Green functions, §2.4–2.5: theta functions and special cycles are attached to even ℤ-unimodular O_F-lattices and their adelic translates L_h.
- trace-unimodular-existence (this packet): U_F^+ is nonempty.

*API.*

- `TraceLattice.IsEven` (data): Q(L) ⊆ 𝔡_F^{−1}.
- `TraceLattice.traceDual` (constructor): L′ = {y : (y, L) ⊆ 𝔡_F^{−1}}.
- `TraceLattice.traceDual_eq` (characterisation): L′ = 𝔡_F^{−1}L^♯, and L′ is the ℤ-dual of L for Tr∘Q.
- `TraceLattice.IsZUnimodular` (data): L′ = L.
- `TraceLattice.discriminantModule` (constructor): L′/L with Q mod 𝔡_F^{−1}, finite for even L.
- `TraceLattice.adelicTranslate` (functoriality): L_h = V ∩ h^{−1}L̂ with L′/L ≃ L_h′/L_h induced by h^{−1}; L_{hh′} = (L_h)_{h′}.
- `TraceLattice.zunimodular_int` (compatibility): For F = ℚ, IsEven ∧ IsZUnimodular is Tau Ceti’s even unimodular IntegralLattice.

*Unit tests.*

- `traceLattice_E8` (computation): For F = ℚ, E₈ is even and ℤ-unimodular, so U_ℚ^+ ≠ ∅.
- `traceLattice_zero` (degenerate): The zero lattice in V = 0 is even and ℤ-unimodular; U_F^+ excludes it.
- `traceLattice_not_OF_unimodular` (non-example): For F = ℚ(√5) (𝔡_F = (√5)), the O_F-lattice O_F with Q(x) = x² satisfies L^♯ = (1/2)O_F but L′ = (1/(2√5))O_F ≠ L: O_F-unimodularity and ℤ-unimodularity differ.

*Proof sketch.*

1. L′ = 𝔡_F^{−1}·L^♯ with L^♯ the O_F-dual (lattice-discriminant-ideal), so L′ is a lattice and L′ = L can be checked place by place.
2. Q_ℤ(L) ⊆ Tr(𝔡_F^{−1}) ⊆ ℤ for even L; L′ is the ℤ-dual of L for the trace form by nondegeneracy of the trace pairing.
3. L_h is defined through lattice-local-global-dictionary from the completions h^{−1}L̂_v.

*Checks.*

- F = ℚ: even ℤ-unimodular means even unimodular in the usual sense (E₈ ∈ U_ℚ^+).
- The hyperbolic plane O_Fe ⊕ 𝔡_F^{−1}f with Q(xe + yf) = xy is in U_F (indefinite).

*Needs:* `lattice-discriminant-ideal`; `lattice-local-global-dictionary`; `lattice-completion`; Mathlib `differentIdeal`; Mathlib `Algebra.trace`.

*Source:* Yingkun Li (Li2023), §2.4, (2.4.1)–(2.4.6), pp.16–17 (arXiv:2106.13653v2): Defines even and integral O-lattices, the dual L′ for the trace form, the lattices L_h = V ∩ h^{−1}L̂ in the genus of L with the identification of discriminant modules, and the monoid U_F with its totally positive part U_F^+.

<a id="trace-unimodular-existence"></a>
#### Existence of definite even ℤ-unimodular lattices over a totally real field

`GN.2/trace-unimodular-existence` · theorem · `TraceLattice.exists_zunimodular_definite`

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

*Needs:* `trace-unimodular-lattice`; `lattice-local-global-dictionary`; QuadraticFormInvariants, 6d the classification and its corollaries; GlobalNumberFields, layer 1 weak approximation and multiplicative congruences.

*Source:* Yingkun Li (Li2023), Proposition 2.6 and its proof, p.17 (arXiv:2106.13653v2): Proves U_F^+ is nonempty from the existence of definite unimodular O-lattices with prescribed signature (Chang, Satz 1) and Hecke’s theorem that the different is a square in the class group.

<a id="witt-group-signature-splitting"></a>
#### Signatures split off the Witt group of a Dedekind ring

`GN.2/witt-group-signature-splitting` · theorem · `wittGroup_signature_split`

Let R be a Dedekind domain whose fraction field K is a global field of characteristic ≠ 2, and M an invertible R-module with involution ±1. If K is not formally real (−1 is a sum of squares: positive characteristic, or a totally imaginary number field), the symmetric Witt group W(K) is 2-primary torsion of bounded exponent. If K has a real embedding σ, the signature W(R; M) → W(K) → W(ℝ) ≅ ℤ at σ is surjective and splits, so ℤ is a direct summand of W(R; M) and W(R; M) is not 2-adically complete.

*Hypotheses.*

- The classical Witt group of symmetric bilinear forms; the L-theoretic consequences are Layer 6's.

*Proof sketch.*

1. Nonreal K: W(K) → ⊕_v W(K_v) is injective (GlobalQuadraticForms 8.3) and every W(K_v) at a nonarchimedean or complex place has exponent dividing 8 (QuadraticFormInvariants Layer 4), so W(K) is killed by 8.
2. Real σ: the form ⟨1⟩ on R (or on M with a generator at σ) has signature 1, giving a splitting of the signature homomorphism.

*Checks.*

- K = ℚ(i): ⟨1⟩ ⊥ ⟨1⟩ is hyperbolic since −1 is a square, so ⟨1⟩ has order 2 in W(K).
- R = ℤ: W(ℤ) ≅ ℤ by the signature, and E₈ has signature 8.

*Needs:* GlobalQuadraticForms, layer 8 global classification and witt consequences; QuadraticFormInvariants, layer 4 the witt ring and the fundamental ideal.

*Source:* Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle (Calmes2026), Remark 3.1.9, p.52 (arXiv:2009.07225v4): Notes that for nonreal global K the Witt group is 2-primary torsion of bounded exponent, making L^s(R) 2-complete, while a real embedding makes ℤ a direct summand of W^s(R; M), so the comparison of Theorem 3.1.7 is not an integral equivalence.

<a id="ternary-unit-half-discriminant-classification"></a>
#### Integral ternary forms with half-discriminant ±1

`GN.2/ternary-unit-half-discriminant-classification` · theorem · `ternary_halfDisc_unit_equiv_split`

Every integral ternary quadratic form f(x, y, z) = Σ a_{ij}x_ix_j over ℤ (cross terms with arbitrary integer coefficients) whose half-discriminant 4·det(A_f) is −1, with A_f the half-integral Gram matrix (A_f)_{ii} = a_{ii}, (A_f)_{ij} = a_{ij}/2, is GL₃(ℤ)-equivalent to y² − xz; those with 4det A_f = +1 are equivalent to xz − y². In particular such forms are indefinite, isotropic over ℚ and form a single class (up to sign).

*Hypotheses.*

- Integral means integer coefficients a_{ij}; the half-discriminant convention 4det(A_f) is the one of Bhargava and Wood for ternary forms.

*Uses.*

- ArithmeticStatistics ST.1, refinement-wood-ring-interpretation: binary quartic forms correspond to pairs (A, B) of ternary forms with A ∼ the split form of half-discriminant −1 (Wood).

*Proof sketch.*

1. 4det A_f = ±1 means f is regular over ℤ (odd rank, unit half-discriminant), so at every p its reduction is nondegenerate; over ℚ_p it is isotropic (regular ternary forms over ℤ_p are isotropic: the reduction is isotropic by Chevalley–Warning and Hensel lifts a smooth zero).
2. A positive definite integral ternary form has 4det A_f ≥ 2 (Hermite's bound for the minimum), so f is indefinite; hence isotropic over ℝ and, by Hasse–Minkowski (GlobalQuadraticForms Layer 5), over ℚ.
3. Take a primitive isotropic vector, complete it to a basis (f = xL(x, y, z) + g(y, z) form with first coefficient 0) and reduce: the conditions force f ∼ y² − xz by elementary row operations on the binary form g and the linear form.

*Checks.*

- y² − xz: A_f = [[0, 0, −1/2], [0, 1, 0], [−1/2, 0, 0]], 4det = −1.
- xy + yz + zx has 4det = 4·(1/4) = 1·… = +1/…? (det [[0, 1/2, 1/2], [1/2, 0, 1/2], [1/2, 1/2, 0]] = 1/4, so 4det = 1) and is equivalent to xz − y².

*Needs:* `finite-field-quadratic-classification`; `odd-unimodular-unit-representation`; GlobalQuadraticForms, layer 5 hasseminkowski isotropy; `regular-quadratic-module-spinor-norm`; `GN.2/integral-quadratic-lattice` (base plan).

*Source:* Gaëtan Chenevier, Olivier Taïbi (ChenevierTaibi2020), Section 3.2, the definition of regular quadratic forms in odd rank through the half-discriminant, p.28 (arXiv:1907.08783): Defines regularity of an odd-rank quadratic form over a ring by the invertibility of its half-discriminant, the condition 4det = ±1 here.

## Dependencies

**Inside this roadmap.** The base plan’s GN.2 targets: `completed-lattice-descent`, `dvr-ordered-exponent-uniqueness`, `dyadic-atomic-form`, `hermitian-dual-lattice`, `hermitian-lattice-invariants`, `integral-hermitian-lattice`, `integral-normalized-form`, `integral-quadratic-lattice`, `lattice-inclusion-localizations`, `lattice-intersection-localizations`, `lattice-localization`, `odd-local-quadratic-norms`, `signed-hermitian-determinant-comparison`, `signed-hermitian-transfer`, `signed-hermitian-witt-comparison`, `signed-witt-scalar-twist`, `spinor-adelic-norm`, `spinor-reflection-product`, `spinor-unimodular-stabilizer`.

**Other roadmaps.** AdelicAlgebraicGroups:AA.1 — Finite adelic points of the unitary group of a hermitian space over a number field, with the restricted-product topology, acting on lattices through completions.; IntegralLattices, layer 1 lattices with forms — The ℤ-lattice carrier with a rational symmetric form and its Gram determinant, for isotropic-quotient-discriminant.; IntegralLattices, layer 2 duality and the finite discriminant group — The discriminant group of an integral lattice and its cardinality |det|, for Λ_{2d}.; IntegralLattices, layer 4 overlattices and isotropic subgroups — Gluing of a sublattice and its complement through isotropic subgroups of discriminant groups, used in the primitive-embedding transport.; ClassFieldTheory, layer 13 norm theorems and class fields — The Hilbert class field of an imaginary quadratic field with Galois group the class group.; GlobalNumberFields, layer 1 weak approximation and multiplicative congruences — Weak approximation: an element of F^× with prescribed signs at the real places.; GlobalQuadraticForms, layer 5 hasseminkowski isotropy — Hasse–Minkowski isotropy for a regular ternary form over ℚ.; GlobalQuadraticForms, layer 6 representation and isometry — Local-global isometry of regular quadratic forms and the Hasse principle for representing a scalar (QuadraticForm.LocallyRepresentsScalar).; GlobalQuadraticForms, layer 8 global classification and witt consequences — Injectivity of the global-to-local Witt map.; LocalFieldsRamification, layer 1 units the filtration and the multiplicative group — The unit filtration of a local field and 1 + 𝔭 ⊆ squares in odd residue characteristic.; LocalFieldsRamification, layer 2 unramified extensions and frobenius — Surjectivity of norm and trace on units for an unramified quadratic extension.; QuadraticFormInvariants, 6c the hilbert symbol and the local hasse invariant — The p-adic Hilbert symbol and its invariance under norms.; QuadraticFormInvariants, 6d the classification and its corollaries — Classification of quadratic forms over a nonarchimedean local field by dimension, discriminant and Hasse invariant.; QuadraticFormInvariants, layer 1 hyperbolic planes and witt theory — Witt decomposition and cancellation over fields of characteristic ≠ 2.; QuadraticFormInvariants, layer 2 quaternion algebras and the four fold splitting criterion — Quaternion algebras, their standard involution, reduced trace and norm.; QuadraticFormInvariants, layer 4 the witt ring and the fundamental ideal — The Witt ring of a field and the exponents of local Witt groups.; QuadraticFormInvariants, layer 6 forms over a nonarchimedean local field — Isotropy of forms of dimension ≥ 5 over a nonarchimedean local field.; QuadraticFormInvariants, layer 9 transfer and the relative stiefel whitney formula — The Scharlau transfer along a nonzero linear functional and its change-of-functional theorem. TauCetiRoadmap IntegralLattices (milestones 0F, 3A–3D, 4C, 5D, 5I, B1–B3) and OrthogonalSpinGroups (1D, 2F) are cited in the proof sketches where their ℤ, ℤ_p and ℚ cases are the starting point.

**Consumers.** MultiquadraticPartII RQ.3 and MetaplecticAutomorphicForms MP.7 import `binary-form-genus-character`; ArithmeticStatistics ST.5 imports `model-ring-positive-involution`, and ST.1 imports `ternary-unit-half-discriminant-classification`; ComplexMultiplicationAndExplicitReciprocity CM.5 imports `quaternion-order`, `quaternion-order-discriminant` and `maximal-quaternion-order-criterion`; AbelianSchemesAndArithmeticModuliPartII F4 imports the §2.16 lemmas and `hasse-schilling-norm-theorem`; ClassicalArithmeticCompletion CA.7 imports the order notion of `quaternion-order`; Layer 3 of this roadmap imports §§2.10, 2.15 and 2.16.

## Acceptance tests

Every definition above lists its unit tests and every theorem its checks. The decisive ones: the Steinitz class separates `𝔭 = (2, 1+√−5)` from `ℤ[√−5]` although they agree at every prime; `2ℤ` and `ℤ` have equal completions away from 2; the genus character gives `χ_5([2,1,2]) = −1` and `χ_5([1,1,4]) = 1` at discriminant −15 and vanishes on `[3,3,3]` for `d = −3`; the Hurwitz order has reduced discriminant 2 and the Lipschitz order 4; `x² + xy + y²` is anisotropic over 𝔽_2 and hyperbolic over 𝔽_4; the hyperbolic plane’s isometry `diag(2, 1/2)` has spinor norm `[2]` by Zassenhaus’s formula, matching the base plan; the lattice `diag(8,8)` shows that Charles’s transport needs a primitive initial embedding; `2M₂(ℤ)` shows that `disc = discrd²` is a statement about orders.

## Notes on the sources

- Voight’s 15.4.5 and Lemma 15.4.7 state `discrd(I) = [J : I]·discrd(J)` and `disc(I) = discrd(I)²` for projective lattices; both hold for orders, and fail for `I = 2M₂(ℤ)` (`disc = 2⁸`, `discrd = 2³`). The targets here are stated for orders.
- Charles’s Proposition 2.9 is stated for arbitrary rank-two sublattices; it needs a primitive initial embedding, as recorded with the paper’s extraction (its error E2), and §2.18 states it so.
- Lieblich–Maulik–Snowden’s Proposition 2.1.2 uses, in its proof, that the eigen-decomposition is orthogonal, which needs the similitude relation `(φx, φy) = q^w(x, y)`; `frobenius-eigenlattice-discriminant-bound` makes it a hypothesis.
- Li proves the existence of even ℤ-unimodular lattices from Chang’s criterion and Hecke’s theorem on the different; `trace-unimodular-existence` constructs them locally and glues, needing neither.
- The input that Kurinczuk–Skodlerack–Stevens cite as [39, Theorem 4.4] is Skodlerack–Stevens, arXiv:1503.08882v3, Theorem 4.4 (with Proposition 4.6 and Lemma 4.7), read and planned as `skodlerack-stevens-maximal-transfer`.

