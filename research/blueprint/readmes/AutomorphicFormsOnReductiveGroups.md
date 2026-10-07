# Automorphic forms on reductive groups

This document is the blueprint of the roadmap `AutomorphicFormsOnReductiveGroups` for its seven layers AF.0, AF.1, AF.1a, AF.2, AF.3, AF.4 and AF.5. It agrees with the blueprint packet `research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`, which records every node with its statement, proof outline, prerequisites, API and unit tests, and with the suggested Lean file `research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`. The plan starts from Mathlib (commit 082e2d3) and Tau Ceti (commit f790474) and is written at target level: one node for each target a layer states and for each definition or key theorem a target needs on the way. Nothing here is formalised.

## Purpose and scope

The roadmap builds the general language of automorphic forms for a connected reductive group G over a number field F, including nonsplit groups and inner forms: the function spaces and growth conditions on G(F)\G(𝔸) (AF.0), the representation theory of real reductive groups that the archimedean places need (AF.1) and its cohomological counterpart (AF.1a), automorphic forms and automorphic representations with Harish-Chandra's finiteness and Flath's factorization (AF.2), constant terms and cusp forms (AF.3), algebraic weights, cohomological representations and rationality (AF.4), and the comparisons with Hecke characters, classical modular forms and algebraic modular forms (AF.5). Generality is that of the theorems that hold for arbitrary reductive groups: multiplicity one, global Whittaker models or a Shimura-variety interpretation are never imposed on all representations.

What the roadmap does not build, and where it comes from:

- adelic points, restricted products of Haar measures, quotient measures, heights, Siegel sets, reduction theory, class numbers, strong approximation and Hecke correspondences: AdelicAlgebraicGroups AA.0-AA.5;
- Cartan involutions, maximal compact subgroups and symmetric spaces of G(F_∞): ArithmeticLocallySymmetricSpaces ALS.0; Betti cohomology of locally symmetric spaces and its Hecke action: ALS.1, ALS.3; the comparison of Betti, de Rham and relative Lie algebra cohomology: ALS.5;
- smooth representations of p-adic groups, their Hecke algebras, admissibility and the Satake isomorphism: SmoothRepresentationsOfLocalGroups SR.0-SR.4;
- Eisenstein series, truncation, the complete spectral decomposition, square-integrable automorphic forms and the weighted comparison: AutomorphicSpectralTheory AS.1-AS.6;
- local and global L- and ε-factors, including those of W_ℝ-representations and the Godement–Jacquet and Rankin–Selberg theories, and the global Whittaker expansion of GL_n cusp forms: AutomorphicLFunctionsAndLocalFactors AL.0-AL.3;
- Lie groups, the exponential map, the closed-subgroup theorem, the Cartan and Iwasawa decompositions, compact groups and Peter–Weyl, highest weight theory and the Harish-Chandra isomorphism, root systems and chambers, reductive groups and their structure theory, adeles, Hecke characters and infinity types, classical modular forms and their Hecke operators: the Tau Ceti roadmaps RepresentationTheory (LieGroups, CompactGroups, LieHighestWeight, RootSystems), ReductiveGroups, GlobalNumberFields and ModularForms, which are existing work and are cited, never re-planned;
- Shimura data, Hodge decompositions of 𝔤_ℂ, Kostant representatives and the GSp_{2g} root data: ShimuraData D2, D3, D5;
- transfer between inner forms and endoscopic transfer: GL2AutomorphicRepresentationsAndTransfer R17.3 and EndoscopicTransferAndUnitaryTraceComparison.

## Conventions

- G is a connected reductive group over a number field F; G(𝔸) = G(F_∞) × G(𝔸_f) with F_∞ = F ⊗_ℚ ℝ. Right translation is R(g)f(x) = f(xg); the Lie algebra 𝔤 = Lie(G(F_∞)) acts by the derived right regular action, extended to U(𝔤_ℂ); Z(𝔤) is the centre of U(𝔤_ℂ).
- K_∞ is a maximal compact subgroup of G(F_∞), the fixed points of a Cartan involution θ, possibly disconnected; its component group K_∞/K_∞° ≅ G(F_∞)/G(F_∞)° is kept in every statement (relative cohomology for K versus K°).
- Infinitesimal characters are normalised by the Harish-Chandra isomorphism so that the irreducible finite-dimensional representation of highest weight μ has infinitesimal character χ_{μ+ρ}; χ_λ = χ_{wλ} for the linear Weyl action on λ.
- Heights ‖·‖ on G(𝔸) are those of AdelicAlgebraicGroups AA.3: ‖xy‖ ≤ ‖x‖‖y‖, ‖x⁻¹‖ ≤ C‖x‖^N, and two heights are polynomially comparable. Moderate growth means |φ(g)| ≤ C‖g‖^N.
- Automorphic forms are K_∞-finite (Borel–Jacquet); smooth automorphic forms are their Casselman–Wallach globalisations (BPCZ §2.7). An automorphic representation is an irreducible admissible (𝔤, K_∞) × G(𝔸_f)-module that is a subquotient of A(G); a cuspidal automorphic representation is an irreducible subrepresentation of the cuspidal L² space (subrepresentation, not subquotient).
- Constant terms are taken with the probability measure on N_P(F)\N_P(𝔸). Cuspidality is vanishing of all constant terms along proper rational parabolics; it suffices to test the maximal standard ones.
- For GL_2/ℚ, the adelization of a modular form uses φ_f(γg_∞k) = λ_χ(k)⁻¹ det(g_∞)^{k/2} j(g_∞, i)^{−k} f(g_∞i) with j(g, z) = cz + d; Mathlib's slash action uses det^{k−1} j^{−k}, and the comparison is an API item. The Casimir is Δ = ¼(H² + 2XY + 2YX) and acts on holomorphic weight-k forms by k(k−2)/4.
- Algebraic modular forms on groups compact at infinity are written in Gross's convention f(γg) = γ·f(g); the p-adic convention f(gu) = u_p⁻¹·f(g) of Boxer–Calegari–Gee–Pilloni and Ding is compared with it by g ↦ g_p⁻¹f(g).
- For GSp_4 the coordinates are those of Calegari–Geraghty, X^*(T) = {(a, b; c) : c ≡ a + b mod 2}, with ρ = (2, 1; 0) for the compact Cartan; Pilloni's lower-triangular system with ρ = (−2, −1; 0) is conjugate to it.

## Sources

- `getz-hahn`: Jayce R. Getz, *An introduction to automorphic representations (course notes)*, Lecture notes, version of 13 March 2015 (89 pp.), author-hosted PDF. <https://sites.math.duke.edu/~jgetz/aut_reps.pdf> (SHA-256 `e52f7da0685c7e33…`, read 2026-10-06). Read: §3 Hecke algebras and Definition 3.10, pp. 16-19; §5 smooth vectors, K-finite vectors and (g,K)-modules, pp. 21-27; §6 automorphic forms, Definitions 6.7-6.15, Theorem 6.10, §6.4 Lemma 6.19, pp. 29-33; §7 restricted tensor products and Flath's theorem, pp. 34-38; §8 Gelfand pairs and Proposition 8.6, pp. 38-40; §10.1 Weil groups, pp. 44-46.
- `arthur-trace`: James Arthur, *An introduction to the trace formula*, Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 1-263; Clay PDF. <https://www.claymath.org/library/cw/arthur/pdf/62.pdf> (SHA-256 `2b6623010ce5d854…`, read 2026-10-06). Read: §1 adelic groups and Haar measure, pp. 7-13; §12 cuspidal functions and Theorem 12.1, pp. 63-66; §13 height functions (13.2)-(13.4), rapidly decreasing and uniformly tempered functions, pp. 69-71.
- `bernstein-kroetz`: Joseph Bernstein, Bernhard Krötz, *Smooth Fréchet globalizations of Harish-Chandra modules*, arXiv:0812.1684v3 (16 April 2013); Israel J. Math. 199 (2014) 45-111. <https://arxiv.org/abs/0812.1684v3> (SHA-256 `f5f2e79d87532c9a…`, read 2026-10-06). Read: §1 Introduction and Theorem 1.1, pp. 2-4; §2 G-continuous norms, Sobolev norms and Remark 2.19 (Dixmier-Malliavin), pp. 5-13; §4 Harish-Chandra modules, Theorem 4.2, p. 21; §§5, 7, 8 statements (Theorems 5.5, 7.1, 8.1).
- `langlands-notion`: Robert P. Langlands, *On the notion of an automorphic representation*, Automorphic Forms, Representations and L-functions, Proc. Sympos. Pure Math. 33, Part 1 (1979), 203-207; IAS archive PDF. <https://publications.ias.edu/sites/default/files/notion-ps.pdf> (SHA-256 `c998090bcbbd0fde…`, read 2026-10-06). Read: Whole note, pp. 1-7: constituents of induced representations, Proposition 2.
- `wockel-vanest`: Christoph Wockel, *Topological group cohomology of Lie groups and Chern-Weil theory for compact symmetric spaces*, arXiv:1401.1037v1 (6 January 2014). <https://arxiv.org/abs/1401.1037v1> (SHA-256 `e2b911da78c856e1…`, read 2026-10-06). Read: §1 recap of topological group cohomology, pp. 3-7; §2 Propositions 2.7-2.10, pp. 8-11; §3 relative Lie algebra cohomology, Remark 3.1, Lemma 3.2 and Theorem 3.3 (van Est), pp. 11-13.
- `vogan-zuckerman`: David A. Vogan Jr., Gregg J. Zuckerman, *Unitary representations with non-zero cohomology*, Compositio Math. 53 (1984), 51-90; Numdam scan. <http://archive.numdam.org/article/CM_1984__53_1_51_0.pdf> (SHA-256 `ccaaf5ad243ccb85…`, read 2026-10-06). Read: §§2, 5-6: theta-stable parabolics, the modules A_q(lambda), Theorem 5.6 and Proposition 6.19 (as quoted in Ichino-Prasanna §7.1).
- `franke98`: Jens Franke, *Harmonic analysis in weighted L2-spaces*, Ann. Sci. École Norm. Sup. (4) 31 (1998), 181-279; Numdam. <http://archive.numdam.org/article/ASENS_1998_4_31_2_181_0.pdf> (SHA-256 `3c0465f6413bf156…`, read 2026-10-06). Read: §§1-2 spaces of functions of uniform moderate growth (scanned text, read for orientation only).
- `zhang21`: Wei Zhang, *Weil representation and arithmetic fundamental lemma*, Ann. of Math. 193 (2021), no. 3; arXiv:1909.02697. <https://arxiv.org/abs/1909.02697> (SHA-256 `f58b275c97b26751…`, read 2026-10-06). Read: §1.2 notation on automorphic forms (1.5)-(1.13); §13.3 Lemma 13.6 and its proof.
- `jiang-zhang20`: Dihua Jiang, Lei Zhang, *Arthur parameters and cuspidal automorphic modules of classical groups*, Ann. of Math. 191 (2020), no. 3; arXiv:1508.03205v4. <https://arxiv.org/abs/1508.03205v4> (SHA-256 `d97bf3048aa10de5…`, read 2026-10-06). Read: Appendix A, proof of Proposition A.1 (Dixmier-Malliavin), arXiv p. 84; Appendix B, proof of Theorem B.2 (Vogan's generic unitary dual), arXiv p. 86.
- `gan-ichino18`: Wee Teck Gan, Atsushi Ichino, *The Shimura-Waldspurger correspondence for Mp_2n*, Ann. of Math. 188 (2018), no. 3; arXiv:1705.10106v3. <https://arxiv.org/abs/1705.10106v3> (SHA-256 `5d1408c5f8bc15a5…`, read 2026-10-06). Read: §1.1, §5.1, §6.1-6.2 (archimedean parameters), arXiv pp. 2-24.
- `dit16`: W. Duke, Ö. Imamoḡlu, Á. Tóth, *Geometric invariants for real quadratic fields*, Ann. of Math. 184 (2016), no. 3, 949-990; publisher PDF. <https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf> (SHA-256 `a67de7157f76ee70…`, read 2026-10-06). Read: §5, (5.6)-(5.11), pp. 961-963.
- `kaletha16`: Tasho Kaletha, *Rigid inner forms of real and p-adic groups*, Ann. of Math. 184 (2016), no. 2; arXiv:1304.3292v5. <https://arxiv.org/abs/1304.3292v5> (SHA-256 `8f88e61e4a86c69e…`, read 2026-10-06). Read: §5.1 and §5.6 (real groups, infinitesimal equivalence).
- `boxer-pilloni`: George Boxer, Vincent Pilloni, *Higher Hida theory for Siegel modular forms*, Invent. Math. 244 (2026); authors' preprint PDF. <https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf> (SHA-256 `af70d084612b1b75…`, read 2026-10-06). Read: §1.3, Theorem 1.3.8 and the definition of C(kappa); §4.3, paragraph after Remark 4.3.10.
- `cg18`: Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor-Wiles method*, Invent. Math. 211 (2018); arXiv:1207.4224. <https://arxiv.org/abs/1207.4224> (SHA-256 `67896c8532588019…`, read 2026-10-06). Read: §1 (the invariant l0); §5.5 Remark 5.14; §8.4 (l0 and q0 for Res PGL(n)).
- `cg20`: Frank Calegari, David Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, Duke Math. J. 169 (2020); arXiv:1907.08691v1 (main text) and arXiv:1907.08694v1 (appendix). <https://arxiv.org/abs/1907.08691v1> (SHA-256 `39aa93a83c77ce93…`, read 2026-10-06). Read: §2.1-2.2 (roots of GSp4, positive system); §5.3 (relative Lie algebra cohomology, Theorems 5.5-5.6, Definition 5.7); §7.2 proof of Theorem 7.11.
- `cg20-appendix`: Frank Calegari, David Geraghty, *Appendix to: Minimal modularity lifting for nonregular symplectic representations*, arXiv:1907.08694v1. <https://arxiv.org/abs/1907.08694v1> (SHA-256 `8389edfec6576b92…`, read 2026-10-06). Read: §A.3.1 (l0, q0 over an imaginary CM field; proof of Lemma A.3).
- `pilloni20`: Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Duke Math. J. 169 (2020), no. 9; author's PDF. <https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf> (SHA-256 `4c05724efeab1dbb…`, read 2026-10-06). Read: §5.1-5.3 (GSp4 roots, (limits of) discrete series, cohomological weights); §15.2 (limits of discrete series and Theorem 15.2.2.1).
- `ichino-prasanna23`: Atsushi Ichino, Kartik Prasanna, *Hodge classes and the Jacquet-Langlands correspondence*, Forum Math. Pi 11 (2023); arXiv:1806.10563. <https://arxiv.org/abs/1806.10563> (SHA-256 `058fda94ad08d245…`, read 2026-10-06). Read: §7.1 (Vogan-Zuckerman modules and their cohomology).
- `bcg25`: George Boxer, Frank Calegari, Toby Gee, *Cuspidal cohomology classes for GL_n(Z)*, J. Amer. Math. Soc. (2025); arXiv:2309.15944. <https://arxiv.org/abs/2309.15944> (SHA-256 `abfa9eac9984aa5d…`, read 2026-10-06). Read: §1, Remark 1.2.
- `ding25`: Yiwen Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publ. Math. IHÉS 142 (2025); arXiv:2407.21237. <https://arxiv.org/abs/2407.21237> (SHA-256 `a78c956df48fcc07…`, read 2026-10-06). Read: §4.2.2 (definite unitary groups and spaces of p-adic automorphic forms).
- `bpcz22`: Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, *The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case*, Publ. Math. IHÉS 135 (2022); arXiv:2007.05601. <https://arxiv.org/abs/2007.05601> (SHA-256 `5c23180ed16b06a5…`, read 2026-10-06). Read: §2.5 (F- and SLF-representations, Dixmier-Malliavin (2.5.3.2)).
- `chenevier-taibi20`: Gaëtan Chenevier, Olivier Taïbi, *Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms*, Publ. Math. IHÉS 131 (2020); arXiv:1907.08783v1. <https://arxiv.org/abs/1907.08783v1> (SHA-256 `81b7fe2c31d0ab4a…`, read 2026-10-06). Read: §1.4 (split classical groups with discrete series); §2.1 (the Langlands correspondence for GL_n(R), W_R).
- `bcgp21`: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*, Publ. Math. IHÉS 134 (2021); arXiv:1812.09269v3. <https://arxiv.org/abs/1812.09269v3> (SHA-256 `7c8d74b0628d8b9c…`, read 2026-10-06). Read: §3.10, proof of Theorem 3.10.1 (archimedean inputs).
- `bcgp25`: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1. <https://arxiv.org/abs/2502.20645v1> (SHA-256 `51d7eacca6eae394…`, read 2026-10-06). Read: §1.8 (conventions); §5.7 (definite unitary groups and algebraic automorphic forms, 5.7.2).
- `scholze15`: Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*, Ann. of Math. 182 (2015), 945-1066; arXiv:1306.2070. <https://arxiv.org/abs/1306.2070> (SHA-256 `e15abf4e7ab3e400…`, read 2026-10-06). Read: §5.1, Proposition 5.1.1.

Sources that the plan relies on but that are not freely available were not read; each such reliance is a recorded gap (see the end of the document): Borel–Jacquet (Corvallis I), Harish-Chandra's *Automorphic forms on semisimple Lie groups*, Borel–Wallach, Langlands' classification, Vogan's unitary dual of GL_n, Dixmier–Malliavin, Blasius–Harris–Ramakrishnan, Harris (1990), Clozel (1990) and Pitale–Schmidt.

## Layer overview

| Layer | Title | Nodes | Planets |
|---|---|---|---|
| AF.0 | Test functions and growth | 8 | Adelic test functions, Moderate growth, Functions of uniform moderate growth |
| AF.1a | Continuous cohomology, van Est and invariant forms | 9 | (𝔤, K)-module, Relative Lie algebra cohomology, van Est isomorphism |
| AF.1 | Real reductive representation foundations | 20 | Harish-Chandra module, Infinitesimal character, Harish-Chandra admissibility theorem, Casselman–Wallach globalization, Discrete series, Archimedean local Langlands for GL_n |
| AF.2 | Automorphic spaces and representations | 12 | Automorphic form, Harish-Chandra finiteness theorem, Automorphic representation, Flath's tensor product theorem |
| AF.3 | Constant terms and cusp forms | 12 | Constant term, Cusp form, Rapid decay of cusp forms, Discreteness of the cuspidal spectrum |
| AF.4 | Algebraic weights and rational structures | 22 | Algebraic highest weight, C-algebraic and L-algebraic, Cohomological representation, Borel–Wallach tempered range, Coherent cohomology of discrete series, Clozel's rationality theorem |
| AF.5 | Comparison examples and transport | 7 | GL₁ automorphic dictionary, Adelization of modular forms, GL₂/ℚ modular–automorphic dictionary, Algebraic modular forms |

The order of presentation is AF.0, AF.1a, AF.1, AF.2, AF.3, AF.4, AF.5: AF.1a comes before AF.1 because AF.1 imports the (𝔮, K)-modules and relative cochains from it (RT-AREA-automorphic-1/29).

## AF.0. Test functions and growth

This layer fixes the function spaces on which every subsequent layer works. It builds the smooth functions on G(𝔸) = G(F_∞) × G(𝔸_f) (smooth in the archimedean variable, invariant under a compact open subgroup at the finite places), the test-function algebra C_c^∞(G(𝔸)) with its restricted-tensor description, the Schwartz algebra S(G(𝔸)), moderate growth with respect to the heights of AdelicAlgebraicGroups AA.3, and the LF space T([G]) of functions of uniform moderate growth (Arthur's "uniformly tempered" functions, BPCZ's T([G])). It proves stability of these spaces under right translation, differentiation, convolution by test and Schwartz functions, and the finite Hecke action. Following the accepted restructuring RS-04, the general height comparison, reduction theory and Siegel sets are imported from AdelicAlgebraicGroups AA.3 and are not rebuilt here.

**Dependencies.** Inside the roadmap: AF.1. Other roadmaps and the libraries: `AdelicAlgebraicGroups:AA.0/restricted-haar-split`; `AdelicAlgebraicGroups:AA.1/adelic-points-split`; `AdelicAlgebraicGroups:AA.1/restricted-product-comparison`; `AdelicAlgebraicGroups:AA.1/unimodular-reductive`; `AdelicAlgebraicGroups:AA.3/adelic-height`; `AdelicAlgebraicGroups:AA.3/height-representation-comparison`; `SmoothRepresentationsOfLocalGroups:SR.1`; `mathlib:ContMDiff`; `mathlib:GroupLieAlgebra`; `mathlib:HasCompactMulSupport`.

### Definition: Smooth functions on G(𝔸)

Node `AF.0/smooth-adelic-function`, declaration `TauCeti.Automorphic.SmoothAdelicFunction` in `TauCeti/Automorphic/Growth`.

Let G be a connected reductive group over a number field F, G(𝔸) = G(F_∞) × G(𝔸_f) with F_∞ = F ⊗_ℚ ℝ, and let G(F_∞) carry its real Lie group structure. A function f : G(𝔸) → ℂ is smooth if there is a compact open subgroup J ⊆ G(𝔸_f) with f(g j) = f(g) for all j ∈ J, and for every g_f ∈ G(𝔸_f) the function g_∞ ↦ f(g_∞ g_f) on G(F_∞) is C^∞. The smooth functions form a ℂ-algebra C^∞(G(𝔸)) = ⋃_J C^∞(G(𝔸))^J stable under right translation by G(𝔸); U(𝔤_∞,ℂ) acts on it by the derived right regular action R(X)f(g) = d/dt f(g exp(tX))|_{t=0}.

*Hypotheses.* G connected reductive over a number field F; G(F_∞) is given the Lie group structure of AF.1/real-points-lie-group; G(𝔸_f) the restricted-product topology of AdelicAlgebraicGroups AA.1.

*Proof outline.*

1. Write G(𝔸) = G(F_∞) × G(𝔸_f) using AdelicAlgebraicGroups:AA.1/adelic-points-split.
2. Smoothness at the finite places is right invariance under some compact open J; at infinity it is ContMDiff ∞ of each restriction g_∞ ↦ f(g_∞ g_f).
3. Closure under sums, products and right translation: J ∩ yJy⁻¹ is compact open and g_∞ ↦ f(g_∞ y_∞ g_f y_f) is a composite of a smooth map with a diffeomorphism.
4. The derived action is defined on each C^∞(G(𝔸))^J and is a Lie algebra action because left-invariant vector fields on G(F_∞) form the Lie algebra (Mathlib GroupLieAlgebra).

*Uses.* AF.0/uniform-moderate-growth-space: the carrier on which growth conditions are imposed. AF.2/automorphic-form: automorphic forms are smooth functions in this sense. AF.3/constant-term: constant terms of smooth functions are smooth.

*API.*

- `Automorphic.SmoothAdelicFunction` (data): The subalgebra of functions G(𝔸) → ℂ that are smooth.
- `Automorphic.SmoothAdelicFunction.exists_level` (projection): Every smooth f is right invariant under some compact open J ⊆ G(𝔸_f).
- `Automorphic.SmoothAdelicFunction.rightTranslate` (functoriality): R(y)f(g) = f(gy) is smooth for y ∈ G(𝔸), with R(yz) = R(y)R(z).
- `Automorphic.SmoothAdelicFunction.derivAction` (structure): X ↦ R(X) is a Lie algebra action of 𝔤_∞ on C^∞(G(𝔸)) commuting with R(y_f) for y_f ∈ G(𝔸_f).
- `Automorphic.SmoothAdelicFunction.derivAction_conj` (relation): R(y_∞) R(X) R(y_∞)⁻¹ = R(Ad(y_∞)X).
- `Automorphic.SmoothAdelicFunction.iUnion_level` (characterisation): C^∞(G(𝔸)) is the directed union of the J-invariant subspaces over compact open J.

*Unit tests.*

- `smoothAdelicFunction_const` (degenerate): Constant functions are smooth with J = G(𝔸_f) ∩ any compact open; R(X)1 = 0.
- `smoothAdelicFunction_gl1_example` (computation): For G = GL_1/ℚ the function x ↦ |x_∞|^s ∏_p 1_{ℤ_p^×}(x_p) is smooth with J = \hat ℤ^×.
- `smoothAdelicFunction_not_of_continuous` (non-example): A continuous function on GL_1(𝔸_ℚ) that is not invariant under any open subgroup of \hat ℤ^× (for example x ↦ |x_p − 1|_p truncated) is not smooth: continuity at the finite places is weaker than local constancy.

*Acceptance.* For G = GL_1 over ℚ a function on 𝔸^× that is C^∞ in the archimedean variable and invariant under 1 + N\hat ℤ is smooth. A function on G(𝔸) which is C^∞ at infinity but not invariant under any compact open subgroup of G(𝔸_f) is not smooth (the characteristic function of a non-open closed subgroup of ℤ_p^× pulled back to GL_1(𝔸)).

*Prerequisites.* `AdelicAlgebraicGroups:AA.1/adelic-points-split`, `AF.1/real-points-lie-group`, `mathlib:ContMDiff`, `mathlib:GroupLieAlgebra`.

*Sources.* bpcz22 (§2.5.1, arXiv p. 17): “We say of a function f : G(A) → C that it is smooth if it is right invariant by a compact-open subgroup J of G(Af ) and for every gf ∈ G(Af ) the function g∞ ∈ G(F∞ ) 7→ f (gf g∞ ) is C∞.” — Definition taken verbatim; we write the archimedean variable on the left, which is equivalent since G(F_∞) and G(𝔸_f) commute.

### Construction: Adelic test functions C_c^∞(G(𝔸)) (planet: Adelic test functions)

Node `AF.0/adelic-test-functions`, declaration `TauCeti.Automorphic.TestFunction` in `TauCeti/Automorphic/Growth`.

C_c^∞(G(𝔸)) is the space of smooth compactly supported functions on G(𝔸). It equals the algebraic tensor product C_c^∞(G(F_∞)) ⊗ C_c^∞(G(𝔸_f)), and C_c^∞(G(𝔸_f)) = lim_→S C_c^∞(G(F_S)) ⊗ ⊗_{v ∉ S} 1_{G(O_v)} over finite sets S of finite places containing the places where the chosen integral model is not reductive. It carries the inductive-limit topology of the Fréchet spaces C^∞_C(G(F_∞))^{J} ⊗ (J-biinvariant functions supported in a compact C), and is an associative algebra under convolution f*h(g) = ∫_{G(𝔸)} f(x) h(x⁻¹g) dx for a fixed Haar measure dx.

*Hypotheses.* Haar measure dx on G(𝔸) fixed as a restricted product of local Haar measures (AdelicAlgebraicGroups AA.0); integral model of G over O_{F,S} fixed (AdelicAlgebraicGroups AA.1).

*Proof outline.*

1. Archimedean factor: smooth compactly supported functions on the Lie group G(F_∞) with the LF topology (union over compacts of the Fréchet spaces of C^∞ functions supported in the compact).
2. Finite factor: import the locally constant compactly supported carrier and its convolution from SmoothRepresentationsOfLocalGroups SR.1 at each finite place; the restricted tensor product over places is the directed limit (3.2.2) of Getz's notes using AdelicAlgebraicGroups:AA.1/restricted-product-comparison.
3. Identify the tensor product with functions on G(𝔸): a smooth compactly supported function is a finite sum of products f_∞ ⊗ f_f because its support is in G(F_∞) × C with C compact open-covered by finitely many J-cosets.
4. Convolution is well defined and associative by Fubini (AdelicAlgebraicGroups:AA.0/restricted-haar-split) and unimodularity (AdelicAlgebraicGroups:AA.1/unimodular-reductive).

*Uses.* AF.0/convolution-to-uniform-growth: right convolution R(f) by a test function smooths moderate-growth functions. AF.2/automorphic-forms-module: the Hecke algebra C_c^∞(G(𝔸_f)) acts on automorphic forms. AutomorphicSpectralTheory:AS.6: test functions of the trace formula. GL2AutomorphicRepresentationsAndTransfer:R16.1: specialised to GL₂ over number fields.

*API.*

- `Automorphic.TestFunction` (data): The space C_c^∞(G(𝔸)) with its LF topology.
- `Automorphic.TestFunction.convolution` (structure): Convolution makes C_c^∞(G(𝔸)) an associative ℂ-algebra; continuity of convolution.
- `Automorphic.TestFunction.tmulEquiv` (equivalence): C_c^∞(G(F_∞)) ⊗_ℂ C_c^∞(G(𝔸_f)) ≃ C_c^∞(G(𝔸)), f_∞ ⊗ f_f ↦ (g ↦ f_∞(g_∞) f_f(g_f)).
- `Automorphic.TestFunction.restrictedTensor` (characterisation): C_c^∞(G(𝔸_f)) is the directed union over S of C_c^∞(G(F_S)) ⊗ ⊗_{v∉S} 1_{G(O_v)}.
- `Automorphic.TestFunction.unitIdempotent` (simp): e_J * e_J = e_J and e_J * f = f for f left J-invariant, with e_J = vol(J)⁻¹ 1_J.
- `Automorphic.TestFunction.ofLocal` (compatibility): At a finite place the factor agrees with SR.1's locally constant compactly supported functions and their convolution.

*Unit tests.*

- `testFunction_idempotent` (computation): For J = ∏_p ℤ_p^× ⊆ GL_1(𝔸_{ℚ,f}) with vol(J) = 1, 1_J * 1_J = 1_J.
- `testFunction_zero` (degenerate): The zero function is the only test function supported on the empty set; convolution with 0 is 0.
- `testFunction_no_unit` (non-example): There is no f with f*h = h for all test functions h: evaluate on h = e_J for shrinking J.
- `testFunction_local_compat` (compatibility): At a single finite place v, restricting to functions of the form f_v ⊗ ⊗_{w≠v}1_{G(O_w)} recovers SR.1's Hecke algebra of G(F_v) up to the factor ∏_{w≠v} vol(G(O_w)).

*Acceptance.* For G = GL_1/ℚ, 1_{[1,2]}-smoothed bump at infinity times 1_{\hat ℤ^×} is a test function and its convolution square is computed by the product of the archimedean convolution and vol(\hat ℤ^×)·1_{\hat ℤ^×}. C_c^∞(G(𝔸)) has no unit for the convolution product, but e_J = vol(J)⁻¹ 1_J acts as a unit on J-biinvariant functions of the finite factor.

*Prerequisites.* `AF.0/smooth-adelic-function`, `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.1/restricted-product-comparison`, `AdelicAlgebraicGroups:AA.0/restricted-haar-split`, `AdelicAlgebraicGroups:AA.1/unimodular-reductive`, `mathlib:HasCompactMulSupport`.

*Sources.* getz-hahn (§3.2, (3.2.1)-(3.2.2), p. 17): “In the number field case, H is known as the non-archimedian Hecke algebra or the Hecke algebra away from infinity.” — The finite factor C_c^∞(G(𝔸_f)) and its description as a direct limit over finite sets of places. bpcz22 (§2.5.2, arXiv p. 17): “The Schwartz space is an algebra for the convolution product denoted by ∗. It contains the dense subspace Cc∞ (G(A)) of smooth and compactly supported functions.” — The test-function space as a dense subalgebra of the Schwartz algebra.

### Construction: The Schwartz algebra S(G(𝔸))

Node `AF.0/adelic-schwartz-space`, declaration `TauCeti.Automorphic.SchwartzFunction` in `TauCeti/Automorphic/Growth`.

For C ⊆ G(𝔸_f) compact and J ⊆ G(𝔸_f) compact open, S(G(𝔸), C, J) is the Fréchet space of smooth J-biinvariant functions supported in G(F_∞) × C with finite seminorms ‖f‖_{r,X,Y} = sup_g ‖g‖^r |(R(X)L(Y)f)(g)| for r ≥ 1, X, Y ∈ U(𝔤_∞,ℂ), where ‖·‖ is a height on G(𝔸). S(G(𝔸)) is the inductive limit over (C, J); it is an algebra under convolution containing C_c^∞(G(𝔸)) as a dense subalgebra.

*Hypotheses.* Height ‖·‖ on G(𝔸) from AdelicAlgebraicGroups:AA.3/adelic-height.

*Proof outline.*

1. Define the seminorms and check that they are finite on test functions.
2. Completeness of each S(G(𝔸),C,J) follows from uniform convergence of all derivatives on G(F_∞) × C.
3. Convolution: ‖xy‖ ≤ ‖x‖‖y‖ and ‖x⁻¹‖ ≤ C‖x‖^{N₀} (AdelicAlgebraicGroups:AA.3/height-representation-comparison), together with polynomial volume growth of height balls in G(F_∞), give ∫ ‖x‖^{−N} dx < ∞ on each J-level for N large and bound the seminorms of f*h.
4. Density of C_c^∞ by multiplying with smooth cut-offs whose derivatives are bounded uniformly.

*Uses.* AF.1/casselman-wallach-globalization: V^∞ = π(S(G))V for the archimedean Schwartz algebra (Bernstein–Krötz §1). AF.1/dixmier-malliavin: the adelic form V^∞ = S(G(𝔸))·V for F- and SLF-representations of G(𝔸) (BPCZ (2.5.3.2)). AF.0/convolution-to-uniform-growth: S(G(𝔸)) acts by right convolution on functions of uniform moderate growth.

*API.*

- `Automorphic.SchwartzFunction` (data): The LF space S(G(𝔸)).
- `Automorphic.SchwartzFunction.seminorm` (projection): The seminorms ‖f‖_{r,X,Y}; each is continuous.
- `Automorphic.SchwartzFunction.convolution` (structure): S(G(𝔸)) is a topological algebra under convolution.
- `Automorphic.SchwartzFunction.ofTestFunction` (coercion): The continuous inclusion C_c^∞(G(𝔸)) → S(G(𝔸)), with dense image.

*Unit tests.*

- `schwartzFunction_gaussian_gl1` (computation): For GL_1/ℚ, x ↦ e^{-π x_∞²}1_{\hat ℤ^×}(x_f) is Schwartz and has seminorm ‖·‖_{0,1,1} = 1.
- `schwartzFunction_const_not` (non-example): The constant 1 on GL_1(𝔸_ℚ) is not Schwartz: ‖x‖^r·1 is unbounded.
- `schwartzFunction_compact_group` (degenerate): If G(F_∞) is compact then S(G(𝔸)) = C_c^∞(G(𝔸)) as topological algebras.

*Acceptance.* For G = GL_1/ℚ, x ↦ e^{-π x_∞²}·1_{\hat ℤ^×}(x_f) lies in S(G(𝔸)) but not in C_c^∞(G(𝔸)). The constant function 1 is not in S(G(𝔸)) for any G with G(𝔸) noncompact.

*Prerequisites.* `AF.0/adelic-test-functions`, `AdelicAlgebraicGroups:AA.3/adelic-height`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`.

*Sources.* bpcz22 (§2.5.2, arXiv p. 17): “This family of semi-norms define a topology on S(G(A), C, K0 ) making it into a Fréchet space. The global Schwartz space S(G(A)) is the topological direct limit over all pairs (C, J) of the spaces S(G(A), C, J).” — Definition of the global Schwartz space and its topology.

### Definition: Moderate growth (planet: Moderate growth)

Node `AF.0/moderate-growth`, declaration `TauCeti.Automorphic.HasModerateGrowth` in `TauCeti/Automorphic/Growth`.

Let ‖·‖ be a height on G(𝔸) (AdelicAlgebraicGroups:AA.3/adelic-height). A function φ : G(𝔸) → ℂ has moderate growth if there are C, N > 0 with |φ(g)| ≤ C‖g‖^N for all g ∈ G(𝔸). On G(F_∞), φ is slowly increasing if |φ(x)| ≤ C‖x‖^r for a norm ‖g‖ = tr(σ(g)*σ(g))^{1/2} attached to a finite-dimensional representation σ with finite kernel that is unitary on K_∞. The notion is independent of the height (respectively of the norm).

*Hypotheses.* Heights as in AdelicAlgebraicGroups AA.3, satisfying ‖xy‖ ≤ ‖x‖‖y‖ and ‖x⁻¹‖ ≤ C₀‖x‖^{N₀}.

*Proof outline.*

1. Define the predicate with the fixed height and the archimedean norm.
2. Independence: two heights satisfy ‖g‖' ≤ C‖g‖^M (AdelicAlgebraicGroups:AA.3/height-representation-comparison), so moderate growth for one is moderate growth for the other with a changed exponent.
3. Moderate growth is preserved by sums, products and by left translation by G(F) and right translation by G(𝔸), by submultiplicativity of the height.

*Uses.* AF.2/automorphic-form: condition (moderate growth) in the definition of an automorphic form. AF.3/cusp-form-rapid-decay: the bound improved to rapid decay for cusp forms. MetaplecticAutomorphicForms:MP.5: moderate growth of theta series. AutomorphicSpectralTheory:AS.1: Eisenstein series in the convergence region are of moderate growth.

*API.*

- `Automorphic.HasModerateGrowth` (data): The predicate ∃ C N, ∀ g, |φ g| ≤ C‖g‖^N.
- `Automorphic.HasModerateGrowth.of_height` (characterisation): Independence of the height: moderate growth for ‖·‖ iff for ‖·‖'.
- `Automorphic.HasModerateGrowth.add` (structure): Moderate-growth functions form a subalgebra of functions G(𝔸) → ℂ.
- `Automorphic.HasModerateGrowth.comp_mul_right` (functoriality): If φ has moderate growth then so does g ↦ φ(gy), with the same exponent.
- `Automorphic.HasModerateGrowth.of_bounded` (simp): Bounded functions have moderate growth with N = 0.

*Unit tests.*

- `hasModerateGrowth_const` (degenerate): A constant function has moderate growth with N = 0.
- `hasModerateGrowth_abs_det` (computation): On GL_1(𝔸_ℚ), g ↦ |g|^s has moderate growth with N = |Re s| for every height (on GL_1(𝔸) heights are comparable to ∏_v max(|g_v|_v, |g_v|_v⁻¹)).
- `hasModerateGrowth_exp_not` (non-example): g ↦ exp(|g_∞|) on GL_1(𝔸_ℚ) fails moderate growth.
- `hasModerateGrowth_classical_compat` (compatibility): For φ_f attached to a holomorphic modular form f of weight k (AF.5/gl2-classical-to-adelic), φ_f has moderate growth iff f is holomorphic at the cusps (Mathlib ModularForm.bdd_at_cusps').

*Acceptance.* Every bounded function has moderate growth; |det|^s on GL_n(𝔸) has moderate growth for every s ∈ ℂ. g ↦ exp(‖g_∞‖) does not have moderate growth on GL_1(𝔸_ℚ).

*Prerequisites.* `AdelicAlgebraicGroups:AA.3/adelic-height`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`, `AF.0/smooth-adelic-function`.

*Sources.* getz-hahn (§6.2, Definitions 6.7-6.8, pp. 30-31): “A function φ : G(F∞ ) → C is said to be slowly increasing if there exists a norm k·k, a constant C and a positive integer r such that |f (x)| ≤ Ckxkr for all x ∈ G(F∞ ).” — The archimedean predicate; the notes add that the definition is independent of the choice of norm. arthur-trace (§13, (13.2)-(13.4), p. 70): “The chosen height function k · k on G(A) then satisfies (13.2) kxyk ≤ kxkkyk, x, y ∈ G(A),” — The adelic height and its submultiplicativity.

### Construction: Functions of uniform moderate growth T([G]) (planet: Functions of uniform moderate growth)

Node `AF.0/uniform-moderate-growth-space`, declaration `TauCeti.Automorphic.UniformModerateGrowth` in `TauCeti/Automorphic/Growth`.

Let [G] = G(F)\G(𝔸). T_N([G]) is the space of smooth left G(F)-invariant φ with |(R(X)φ)(g)| ≪_X ‖g‖_{[G]}^N for every X ∈ U(𝔤_∞,ℂ), where ‖g‖_{[G]} = inf_{γ ∈ G(F)} ‖γg‖. For fixed J, T_N([G])^J is a Fréchet space with the seminorms sup ‖g‖^{-N}|R(X)φ(g)|; T_N([G]) is the strict LF limit over J and T([G]) = ⋃_N T_N([G]) a (non-strict) LF space. The same definitions apply to [G]_P = M_P(F)N_P(𝔸)\G(𝔸) for a parabolic P.

*Hypotheses.* Heights from AdelicAlgebraicGroups AA.3.

*Proof outline.*

1. Define the seminorms and the Fréchet topology on each T_N([G])^J; completeness from uniform convergence of derivatives on compacta and the weight ‖g‖^{-N}.
2. Take the strict inductive limit over J and the union over N.
3. Show T_N ⊆ T_{N'} continuously for N ≤ N', and record that a function of uniform moderate growth has moderate growth (X = 1).

*Uses.* AF.2/smooth-automorphic-forms: automorphic forms are the Z(𝔤)-finite vectors of T([G]) (BPCZ 2.7.1). AF.3/constant-term: constant terms map T([G]) to T([G]_P). AutomorphicSpectralTheory:AS.3: truncation transforms uniformly tempered functions into rapidly decreasing ones (Arthur §13). AutomorphicSpectralTheory:AS.5: functions of uniform moderate growth are the coefficients of the weighted comparison.

*API.*

- `Automorphic.UniformModerateGrowth` (data): The LF space T([G]) and its pieces T_N([G])^J.
- `Automorphic.UniformModerateGrowth.seminorm` (projection): The continuous seminorms p_{N,X}(φ) = sup_g ‖g‖^{-N}|R(X)φ(g)|.
- `Automorphic.UniformModerateGrowth.mono` (structure): T_N ⊆ T_{N'} continuously for N ≤ N'.
- `Automorphic.UniformModerateGrowth.hasModerateGrowth` (compatibility): Every φ ∈ T([G]) has moderate growth.
- `Automorphic.UniformModerateGrowth.ofParabolic` (functoriality): The same construction for [G]_P, with the inclusion of left G(F)-invariant functions into left M_P(F)N_P(𝔸)-invariant ones after constant terms.

*Unit tests.*

- `uniformModerateGrowth_const` (degenerate): 1 ∈ T_0([G]) and every seminorm of 1 with X of positive degree vanishes.
- `uniformModerateGrowth_gl1_character` (computation): For a Hecke character χ of GL_1/ℚ, χ ∈ T_N([GL_1]) for N ≥ |Re(shift χ)|, and R(X)χ = ds·χ for X the generator of Lie(ℝ_{>0}).
- `uniformModerateGrowth_not_of_moderate` (non-example): On GL_1(ℚ)\GL_1(𝔸_ℚ) ≅ ℝ_{>0} × \hat ℤ^×, φ(t) = sin(e^{t²}) at infinity is bounded (moderate growth) but its derivative is not polynomially bounded.
- `uniformModerateGrowth_arthur_compat` (compatibility): On G(ℚ)\G(𝔸)^1, membership in T([G]) is Arthur's 'uniformly tempered'.

*Acceptance.* Constant functions lie in T_0([G]); a cusp form lies in every T_N with N ∈ ℝ, in particular negative N (AF.3/cusp-form-rapid-decay). A function of moderate growth whose derivatives are unbounded polynomially (built from a rapidly oscillating bounded function at infinity) is not of uniform moderate growth.

*Prerequisites.* `AF.0/smooth-adelic-function`, `AF.0/moderate-growth`, `AdelicAlgebraicGroups:AA.3/adelic-height`.

*Sources.* bpcz22 (§2.5.7, arXiv p. 18): “The space of functions of uniform moderate growth T ([G]P ) of [G]P is defined as the space of smooth functions ϕ : [G]P → C for which there exists N > 0 such that for every X ∈ U(g∞ ) we have |(R(X)ϕ)(g)| ≪ kgkN[G]P” — Definition and LF topology. arthur-trace (§13, p. 70): “Let us say that a function φ ∈ C ∞ G(Q)\G(A)1 is uniformly tempered if there is an N0 ≥ 0 with the property that for every left invariant differentiable operator X on G(R)1 , there is a constant cX such that |(Xφ)(x)| ≤ cX kxkN0 ,” — The same condition under the name uniformly tempered, on G(ℚ)\G(𝔸)^1.

### Theorem: Stability of growth spaces under translation and differentiation

Node `AF.0/growth-translation-differentiation`, declaration `TauCeti.Automorphic.UniformModerateGrowth.rightTranslate_mem` in `TauCeti/Automorphic/Growth`.

For N ≥ 0, y ∈ G(𝔸) and X ∈ U(𝔤_∞,ℂ): (i) R(y) maps T_N([G]) to itself, with p_{N,Z}(R(y)φ) ≤ ‖y‖^N p_{N,Ad(y_∞)^{-1}Z}(φ); (ii) R(X) maps T_N([G]) continuously to itself; (iii) the map (y, φ) ↦ R(y)φ is continuous G(𝔸) × T_N([G])^J → T_N([G]) on each level, so T_N([G])^J is a smooth Fréchet representation of G(F_∞) of moderate growth; (iv) left translation by G(F) is trivial. The same holds for moderate-growth functions without derivatives.

*Hypotheses.* Heights with ‖xy‖ ≤ ‖x‖‖y‖ (AdelicAlgebraicGroups AA.3).

*Proof outline.*

1. (i) ‖gy‖ ≤ ‖g‖‖y‖ gives the bound for X = 1; for general Z use R(y)R(Z) = R(Ad(y_∞)Z)R(y) and finite-dimensionality of U_{≤k}(𝔤) under Ad.
2. (ii) is immediate from the definition of the seminorms.
3. (iii) Continuity in y at the identity follows from the mean value theorem along one-parameter subgroups at infinity and J-invariance at the finite places; moderate growth of the representation is (i).
4. (iv) by left G(F)-invariance of elements of T([G]).

*Acceptance.* For G = GL_1/ℚ and φ = |·|^s, R(y)φ = |y|^s φ exhibits the factor ‖y‖^N with N = |Re s| sharp. The statement fails for left translation by elements of G(𝔸) \ G(F): left translates are not G(F)-invariant.

*Prerequisites.* `AF.0/uniform-moderate-growth-space`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`.

*Sources.* bpcz22 (§2.5.8, arXiv p. 18): “The spaces S([G]P ), C([G]P ) and T ([G]P ) are all topological representations of G(A) for the action by right translation R.” — Right translation acts continuously; the levels T_N([G])^J are SF representations of G(F_∞) in the sense of Bernstein–Krötz. arthur-trace (§13, (13.2), p. 70): “kxyk ≤ kxkkyk, x, y ∈ G(A),” — The estimate behind (i).

### Theorem: Convolution produces uniform moderate growth

Node `AF.0/convolution-to-uniform-growth`, declaration `TauCeti.Automorphic.UniformModerateGrowth.convolution_mem` in `TauCeti/Automorphic/Growth`.

If φ : G(F)\G(𝔸) → ℂ is continuous with |φ(g)| ≤ C‖g‖^N and f ∈ S(G(𝔸)) (in particular f ∈ C_c^∞(G(𝔸))), then R(f)φ(g) = ∫_{G(𝔸)} f(y) φ(gy) dy converges absolutely, lies in T_N([G]), and R(X)(R(f)φ) = R(X * f)φ, where X * f is the derivative of f in the direction X (a Schwartz function). The action f ↦ R(f) makes T([G]) a module over the convolution algebra S(G(𝔸)), and R(f*h) = R(f)R(h).

*Hypotheses.* φ continuous of moderate growth; f Schwartz.

*Proof outline.*

1. Absolute convergence: |f(y)| ≤ C_r‖y‖^{-r} and |φ(gy)| ≤ C‖g‖^N‖y‖^N; choose r with ∫ ‖y‖^{N-r}dy < ∞ on the support level.
2. Differentiate under the integral by moving derivatives onto f: R(X)(R(f)φ) = R(X*f)φ, where X*f is a left-invariant derivative of f, still Schwartz.
3. Bound each derivative by the same N: this is the uniform estimate.
4. Associativity R(f*h) = R(f)R(h) by Fubini.

*Acceptance.* For G = GL_1/ℚ, with GL_1(ℚ)\GL_1(𝔸_ℚ) ≅ ℝ_{>0} × \hat ℤ^×, and φ the (discontinuous, bounded) indicator function of {t ≤ 1} in the ℝ_{>0} coordinate, R(f)φ is smooth and bounded with all derivatives. Without moderate growth of φ the integral can diverge: φ(g) = exp(|g_∞|) and f ≥ 0 nonzero at infinity.

*Prerequisites.* `AF.0/adelic-schwartz-space`, `AF.0/uniform-moderate-growth-space`, `AF.0/growth-translation-differentiation`, `AdelicAlgebraicGroups:AA.0/restricted-haar-split`.

*Sources.* bpcz22 (§2.5.8, (2.5.8.6), arXiv p. 18): “For every distribution D ∈ S([G]P )′ and f ∈ S(G(A)), the distribution R(f )D is representable by a function in T ([G]P ).” — The stronger statement for distributions; for a moderate-growth function the representing function is R(f)φ. bpcz22 (§2.5.8, arXiv p. 18): “It follows that the action of G(A) on S([G]P ), C([G]P ) and T ([G]P ) integrates to an action of the algebra (S(G(A)), ∗) (by right convolution).” — The module structure.

### Theorem: Hecke action of C_c^∞(G(𝔸_f)) on growth spaces

Node `AF.0/finite-hecke-action`, declaration `TauCeti.Automorphic.heckeAction` in `TauCeti/Automorphic/Growth`.

For a compact open J ⊆ G(𝔸_f), the Hecke algebra H(G(𝔸_f)//J) of J-biinvariant compactly supported functions acts on the J-invariants of the space of smooth left G(F)-invariant functions of moderate growth, and of T_N([G]), by R(f)φ(g) = ∫_{G(𝔸_f)} f(y)φ(gy)dy = Σ_{i} f(y_i) vol(J) φ(g y_i) for JyJ = ⊔ y_i J. This action commutes with R(X), X ∈ U(𝔤_∞), with R(g_∞) for g_∞ ∈ G(F_∞), preserves the exponent N, and satisfies R(f*h) = R(f)R(h); for J' ⊆ J it is compatible with the inclusion of J-invariants into J'-invariants via e_J.

*Hypotheses.* J compact open; Haar measure on G(𝔸_f) as fixed in AF.0/adelic-test-functions.

*Proof outline.*

1. Write a J-biinvariant f as a finite combination of 1_{JyJ} and JyJ as a finite union of right cosets y_iJ (compactness of JyJ and openness of J).
2. The finite sum formula is the integral; G(F)-invariance and smoothness are preserved termwise.
3. Growth: ‖g y_i‖ ≤ ‖g‖‖y_i‖ with finitely many y_i keeps the exponent N.
4. Commutation with the archimedean action because the finite and archimedean factors of G(𝔸) commute; associativity from convolution.

*Acceptance.* For GL_2/ℚ, J = GL_2(\hat ℤ) and f = 1_{J diag(p,1) J}, R(f) acts on the J-invariant functions as the sum over the p+1 right cosets, matching the classical Hecke operator T_p up to the normalisation of AF.5/gl2-hecke-normalisation. The action of 1_J is vol(J)·id on J-invariants.

*Prerequisites.* `AF.0/adelic-test-functions`, `AF.0/growth-translation-differentiation`, `SmoothRepresentationsOfLocalGroups:SR.1`.

*Sources.* getz-hahn (§3.4, p. 18): “The space L2 (G(F )AG \G(AF )) carries a natural action R of H by convolution:” — The convolution action of the global Hecke algebra; here restricted to the finite factor on smooth growth spaces. arthur-trace (§24, p. 158): “Let Rdisc (πR , h) be the operator on L2disc (πR , K0 ) obtained by right convolution of h.” — Right convolution by the nonarchimedean Hecke algebra H(G(𝔸_fin), K₀).

**Coverage of AF.0.** Status: planned. Refinements for the next pass:

- Lemma-level refinement: LF-topology lemmas for C_c^∞(G(F_∞)) on a Lie group (charts versus Mathlib's TestFunction on open subsets of normed spaces).
- Prove the convergence bound ∫_{G(𝔸)} ‖y‖^{−r}dy < ∞ for large r from AdelicAlgebraicGroups AA.3's height estimates (counting function (13.4) of Arthur).

## AF.1a. Continuous cohomology, van Est and invariant forms

This layer is the single owner of relative Lie algebra cohomology (red-team finding RT-AREA-automorphic-1/29): pairs (𝔮, K), (𝔮, K)-modules, the relative cochain complex Hom_K(∧^q(𝔮/𝔨_ℂ), V) with its Chevalley–Eilenberg differential, functoriality, long exact sequences and cup products. Pairs are defined for any complex Lie algebra 𝔮 containing 𝔨_ℂ, so that the same construction gives (𝔤, K)-cohomology and Harris's (𝔭_h, K)-cohomology for a θ-stable parabolic. On the group side it builds continuous and smooth cochains, invariant forms on G/K and proves the van Est isomorphism H^q_c(G; V) ≅ H^q(𝔤, K; V) for Lie groups with finitely many components (Wockel, Theorem 3.3; Borel–Wallach IX.5.6(ii)), with the acceptance computations the roadmap lists. It depends on no other layer of this roadmap; AF.1 imports it.

**Dependencies.** Other roadmaps and the libraries: `ArithmeticLocallySymmetricSpaces:ALS.0`; `mathlib:ContMDiff`; `mathlib:ExteriorAlgebra`; `mathlib:GroupLieAlgebra`; `mathlib:LieGroup`; `mathlib:LieModule`; `mathlib:LieSubalgebra`; `mathlib:Representation`; `mathlib:TopRep.homogeneousCochains`; `mathlib:continuousCohomology`; `tauceti:TauCeti.haarAverage`; Tau Ceti RepresentationTheory/CompactGroups (layer 0 normalized haar measure and averaging); Tau Ceti RepresentationTheory/CompactGroups (layer 2 complete reducibility); Tau Ceti RepresentationTheory/LieGroups (layer 2 the closed subgroup cartan theorem); Tau Ceti RepresentationTheory/LieGroups (layer 7 complexification and real forms); Tau Ceti RepresentationTheory/LieGroups (layer 9 the cartan iwasawa and kak decompositions); `tauceti:lieMap`.

### Definition: Pairs (𝔮, K)

Node `AF.1a/gk-pair`, declaration `TauCeti.RelativeLieCohomology.Pair` in `TauCeti/RepresentationTheory/LieCohomology/Relative`.

A pair (𝔮, K) consists of a compact Lie group K (not necessarily connected), a finite-dimensional complex Lie algebra 𝔮, a continuous action Ad : K → Aut(𝔮) by Lie algebra automorphisms and a K-equivariant injective Lie algebra map ι : 𝔨_ℂ → 𝔮 from the complexified Lie algebra of K, such that the differential of Ad is ad ∘ ι. The main examples are (𝔤_ℂ, K) for a real Lie group G with compact subgroup K, and (𝔮, K) for a θ-stable parabolic subalgebra 𝔮 ⊇ 𝔨_ℂ of 𝔤_ℂ (Harris's (𝔭, K∞) for the Hodge parabolic). A morphism (𝔮, K) → (𝔮', K') is a Lie algebra map and a continuous homomorphism intertwining Ad and ι.

*Hypotheses.* K a compact Lie group with Lie algebra 𝔨 (Mathlib GroupLieAlgebra); 𝔮 finite-dimensional over ℂ.

*Proof outline.*

1. Bundle the data; the compatibility d(Ad)(Y) = [ι(Y), ·] is a hypothesis.
2. Build the pair (𝔤_ℂ, K) of a real Lie group G ⊇ K from the adjoint action (Tau Ceti Lie adjoint representation) and complexification.
3. Build the pair (𝔮, K) for a K-stable subalgebra 𝔮 ⊇ 𝔨_ℂ by restriction.

*Uses.* AF.1a/relative-lie-cochain-complex: the complex Hom_K(∧^q(𝔮/𝔨_ℂ), V) is attached to a pair. AF.4/coherent-relative-cohomology: Harris's (𝔭_h, K∞)-cohomology is the relative cohomology of a parabolic pair. BorelRegulators:R.2: pairs (𝔤𝔩_n(ℂ), U(n)) and their block inclusions.

*API.*

- `RelativeLieCohomology.Pair` (data): The structure (𝔮, K, Ad, ι) with the derivative compatibility.
- `RelativeLieCohomology.Pair.ofLieGroup` (constructor): The pair (𝔤_ℂ, K) of a real Lie group G and compact subgroup K.
- `RelativeLieCohomology.Pair.ofSubalgebra` (constructor): The pair (𝔮, K) of a K-stable subalgebra 𝔮 ⊇ ι(𝔨_ℂ).
- `RelativeLieCohomology.Pair.Hom` (functoriality): Morphisms of pairs, with identity and composition.
- `RelativeLieCohomology.Pair.identityComponent` (projection): The pair (𝔮, K°) and the morphism (𝔮, K°) → (𝔮, K).

*Unit tests.*

- `pair_compact` (degenerate): For G = K compact, the pair (𝔨_ℂ, K) has 𝔮/𝔨_ℂ = 0.
- `pair_gl2_O2` (computation): (𝔤𝔩_2(ℂ), O(2)): dim 𝔮/𝔨_ℂ = 3 and the nontrivial component of O(2) acts on 𝔮/𝔨_ℂ with eigenvalues (1, 1, −1).
- `pair_not_without_k` (non-example): (𝔭^-, K^h) for GSp_4(ℝ) is not a pair: 𝔭^- does not contain 𝔨_ℂ.
- `pair_ofLieGroup_compat` (compatibility): Pair.ofLieGroup G K has Lie algebra map ι equal to the complexified Tau Ceti lieMap of the inclusion K → G.

*Acceptance.* (𝔤𝔩_n(ℂ), O(n)) and (𝔤𝔩_n(ℂ), SO(n)) are pairs with a morphism given by the identity and the inclusion SO(n) ⊆ O(n). For GSp_4(ℝ) with K = K^h, the subalgebra 𝔨_ℂ ⊕ 𝔭^- is a pair; 𝔭^- alone (not containing 𝔨_ℂ) is not.

*Prerequisites.* `mathlib:GroupLieAlgebra`, `mathlib:LieSubalgebra`, `tauceti:lieMap`, Tau Ceti RepresentationTheory/LieGroups (layer 7 complexification and real forms).

*Sources.* wockel-vanest (§3, p. 11): “In case that h = k and K is not connected there is a subcomplex CCE ((g, K), a) := Hom(Λn g/k, a)K” — The pair (𝔤, K) with K possibly disconnected. cg20 (§2.2, arXiv v1 p. 8 (Duke p. 810)): “Then we have Q− = KC h − P and Lie Q− = khC ⊕ p− .” — The pair (Lie Q⁻, K^h) for the θ-stable parabolic (K^h_ℂ rendered 'KC h' in the PDF text).

### Definition: (𝔮, K)-modules (planet: (𝔤, K)-module)

Node `AF.1a/gk-module`, declaration `TauCeti.RelativeLieCohomology.GKModule` in `TauCeti/RepresentationTheory/LieCohomology/Relative`.

A (𝔮, K)-module is a complex vector space V with a Lie algebra representation of 𝔮 and a representation of K such that (1) V is a union of finite-dimensional K-stable subspaces on which K acts continuously; (2) for Y ∈ 𝔨 and v ∈ V, d/dt(exp(tY)v)|_{t=0} = ι(Y)v; (3) k·(X·(k⁻¹·v)) = (Ad(k)X)·v for k ∈ K, X ∈ 𝔮. Morphisms are linear maps commuting with 𝔮 and K. They form an abelian category (𝔮, K)-Mod with kernels, cokernels, direct sums and tensor products with finite-dimensional (𝔮, K)-modules. For a real Lie group G with compact K ⊆ G this is the category of (𝔤, K)-modules.

*Hypotheses.* (𝔮, K) a pair (AF.1a/gk-pair).

*Proof outline.*

1. Encode the 𝔮-action as a Mathlib LieModule and the K-action as a Representation; state (1)-(3).
2. Kernels and cokernels: subquotients inherit (1)-(3) because finite-dimensional K-stable subspaces map to such.
3. Tensor product with a finite-dimensional (𝔮,K)-module F: the diagonal actions satisfy (1)-(3).
4. For a pair (𝔤_ℂ, K) of a real group this is the definition of a (𝔤, K)-module of Getz–Hahn Definition 5.14 (countable direct-sum condition is replaced by local finiteness, which is equivalent by complete reducibility of K).

*Uses.* AF.1/admissible-gk-module: admissibility, K-types and infinitesimal characters are properties of (𝔤, K)-modules. AF.1a/relative-lie-cochain-complex: coefficients of relative Lie algebra cohomology. AF.2/automorphic-forms-module: the space of automorphic forms is a (𝔤, K_∞) × G(𝔸_f)-module. AutomorphicLFunctionsAndLocalFactors:AL.2: local zeta integrals at the archimedean places use (𝔤,K)-modules of GL_n(ℝ), GL_n(ℂ). MetaplecticAutomorphicForms:MP.5: genuine (𝔤, K̃)-modules on the metaplectic cover.

*API.*

- `RelativeLieCohomology.GKModule` (data): The category of (𝔮, K)-modules.
- `RelativeLieCohomology.GKModule.abelian` (instance): (𝔮, K)-Mod is abelian, with exact forgetful functor to vector spaces.
- `RelativeLieCohomology.GKModule.tensorFinite` (structure): Tensor product with a finite-dimensional (𝔮, K)-module F and its exactness.
- `RelativeLieCohomology.GKModule.restrict` (functoriality): Restriction along a morphism of pairs, with id and comp laws.
- `RelativeLieCohomology.GKModule.ofContRepresentation` (constructor): From a finite-dimensional continuous representation of a real Lie group G ⊇ K, by differentiation.
- `RelativeLieCohomology.GKModule.deriv_eq` (compatibility): For Y ∈ 𝔨, the 𝔮-action of ι(Y) is the derivative of the K-action (condition (2)).

*Unit tests.*

- `gkModule_trivial` (degenerate): ℂ with zero 𝔮-action and trivial K-action is a (𝔮, K)-module (the trivial module).
- `gkModule_sl2_weight` (computation): For (𝔰𝔩_2(ℂ), SO(2)), the module ⊕_{ℓ ≥ k, ℓ ≡ k (2)} ℂv_ℓ with H v_ℓ = ℓ v_ℓ (H the generator of 𝔨_ℂ) and raising/lowering as in Getz–Hahn §6.5 satisfies (2): exp(θ·iH)·v_ℓ = e^{iℓθ}v_ℓ.
- `gkModule_not_locally_finite` (non-example): L²(SO(2)) with the regular action is not a (𝔰𝔬_2, SO(2))-module: it is not a union of finite-dimensional K-stable subspaces (only its K-finite vectors are).
- `gkModule_fd_compat` (compatibility): For G connected and V a finite-dimensional continuous representation, ofContRepresentation V restricted to 𝔤 is the Tau Ceti lieMap of the representation.

*Acceptance.* Every finite-dimensional continuous representation of a connected real Lie group G gives a (𝔤, K)-module by differentiation. The (𝔤𝔩_2, O(2))-modules π_k of Getz–Hahn §6.5 satisfy (1)-(3).

*Prerequisites.* `AF.1a/gk-pair`, `mathlib:LieModule`, `mathlib:Representation`, Tau Ceti RepresentationTheory/CompactGroups (layer 2 complete reducibility).

*Sources.* getz-hahn (§5.3, Definition 5.14, p. 26): “A (g, K)-module is a vector space V with a representation of π of g and K which satisfy the following:” — Conditions (1)-(3) as stated; we phrase (1) as local finiteness. bernstein-kroetz (§4, Remark 4.1, p. 21): “in other words E K−fin is a weakly admissible (g, K)-module.” — K-finite vectors of a Banach representation form a (g,K)-module.

### Construction: Relative Lie algebra cochain complex C^•(𝔮, K; V) (planet: Relative Lie algebra cohomology)

Node `AF.1a/relative-lie-cochain-complex`, declaration `TauCeti.RelativeLieCohomology.cochains` in `TauCeti/RepresentationTheory/LieCohomology/Relative`.

For a pair (𝔮, K) and a (𝔮, K)-module V, C^q(𝔮, K; V) = Hom_K(∧^q(𝔮/𝔨_ℂ), V), identified with the alternating maps ω : ∧^q 𝔮 → V with i_Y ω = 0 for Y ∈ 𝔨_ℂ and k·ω(Ad(k)⁻¹ ·) = ω for k ∈ K. The differential is the Chevalley–Eilenberg differential d ω(x_0,…,x_q) = Σ_i (−1)^i x_i·ω(…, x̂_i, …) + Σ_{i<j} (−1)^{i+j} ω([x_i, x_j], …, x̂_i, …, x̂_j, …), which preserves the relative cochains and satisfies d² = 0. H^q(𝔮, K; V) is its cohomology. When K is disconnected, C^•(𝔮, K; V) = C^•(𝔮, K°; V)^{K/K°}.

*Hypotheses.* (𝔮, K) a pair, V a (𝔮, K)-module.

*Proof outline.*

1. Absolute Chevalley–Eilenberg complex Hom(∧^q 𝔮, V) with the displayed differential, d² = 0 by the Jacobi identity and the module axiom (Mathlib supplies only degrees ≤ 2; the general complex is built here).
2. The relative subcomplex: invariance and basicness (i_Y ω = 0, θ_Y ω = 0 for Y ∈ 𝔨_ℂ) are preserved by d (Cartan's formulas θ_Y = d i_Y + i_Y d).
3. K-invariance: the K-action on the absolute complex commutes with d; take K-invariants, which for connected K are the 𝔨-invariants by condition (2).
4. Identify Hom_K(∧^q(𝔮/𝔨_ℂ), V) with the basic K-invariant cochains.

*Uses.* AF.1a/van-est-isomorphism: van Est identifies continuous cohomology with H^•(𝔤, K; V). AF.4/cohomological-representation: cohomological representations have H^•(𝔤, K; π ⊗ V) ≠ 0. ArithmeticLocallySymmetricSpaces:ALS.5: comparison of Betti, de Rham and relative Lie algebra cohomology. AutomorphicSpectralTheory:AS.5: relative Lie algebra cohomology of spaces of automorphic forms. BorelRegulators:R.2: imported relative cochains for (𝔤𝔩_n(ℂ), U(n)).

*API.*

- `RelativeLieCohomology.cochains` (data): C^q(𝔮, K; V) as a submodule of the alternating q-forms 𝔮 [⋀^Fin q]→ₗ[ℂ] V, with the Chevalley–Eilenberg differential d; packaged as a CochainComplex (ModuleCat ℂ) ℕ in the implementation.
- `RelativeLieCohomology.cochains_eq_hom` (characterisation): C^q(𝔮, K; V) ≃ Hom_K(∧^q(𝔮/𝔨_ℂ), V).
- `RelativeLieCohomology.d_comp_d` (simp): d ∘ d = 0.
- `RelativeLieCohomology.cohomology` (data): H^q(𝔮, K; V) as the homology of the complex.
- `RelativeLieCohomology.H0_eq_invariants` (characterisation): H^0(𝔮, K; V) = V^{𝔮, K} = {v : 𝔮v = 0, Kv = v}.
- `RelativeLieCohomology.disconnected` (relation): C^•(𝔮, K; V) = C^•(𝔮, K°; V)^{K/K°} and H^q(𝔮, K; V) = H^q(𝔮, K°; V)^{K/K°}.
- `RelativeLieCohomology.d_lowDegree_compat` (compatibility): In degrees 0, 1, 2 with K trivial, d agrees with Mathlib's Lie algebra cochain maps d₀₁, d₁₂, d₂₃.

*Unit tests.*

- `relativeCochains_compact` (degenerate): For 𝔮 = 𝔨_ℂ, H^q(𝔮, K; V) = 0 for q > 0 and H^0 = V^K.
- `relativeCochains_vector_group` (computation): For (ℂ^n, 1) and trivial V = ℂ, H^q = ∧^q(ℂ^n)^* (dimension binom(n, q)).
- `relativeCochains_sl2_trivial` (computation): H^q(𝔰𝔩_2(ℂ), SO(2); ℂ) is ℂ for q = 0, 2 and 0 for q = 1.
- `relativeCochains_O2_component` (non-example): H^2(𝔰𝔩_2(ℂ), O(2); ℂ) = 0 although H^2(𝔰𝔩_2(ℂ), SO(2); ℂ) = ℂ: the reflection acts by −1 on ∧²(𝔤/𝔨). A definition ignoring K/K° gets this wrong.

*Acceptance.* For K compact and 𝔮 = 𝔨_ℂ: C^q = 0 for q > 0 and H^0 = V^K. For G = ℝ^n, K = 1 and trivial coefficients: C^q = ∧^q(ℝ^n)^* ⊗ ℂ with zero differential, so H^q = ∧^q(ℂ^n)^*.

*Prerequisites.* `AF.1a/gk-module`, `mathlib:ExteriorAlgebra`, `mathlib:LieModule`.

*Sources.* wockel-vanest (§3, p. 11): “The relative Lie algebra cohomology HLie ((g, h); a) is the cohomology of the based and invariant cochains in the Chevalley-Eilenberg complex CCE (g, a) := HomR (Λn g, a),” — Definition of the relative complex and its differential (with the displayed formulas for i_y, θ_y and d_CE). pilloni20 (§15.2.2, p. 108): “Let W be a (g, K∞ )-module. Then one can define the (p, K∞ )-cohomology of W , denoted by H• (p, K∞ ; W ) (see [30], sect. 4.1.1).” — The same construction for the parabolic pair (𝔭, K∞); see AF.4/coherent-relative-cohomology.

### Theorem: Functoriality and long exact sequences of relative Lie algebra cohomology

Node `AF.1a/relative-cohomology-functoriality`, declaration `TauCeti.RelativeLieCohomology.longExact` in `TauCeti/RepresentationTheory/LieCohomology/Relative`.

(i) H^q(𝔮, K; −) is an additive functor on (𝔮, K)-modules and a short exact sequence 0 → V' → V → V'' → 0 of (𝔮, K)-modules gives a long exact sequence … → H^q(𝔮, K; V') → H^q(𝔮, K; V) → H^q(𝔮, K; V'') → H^{q+1}(𝔮, K; V') → …; (ii) a morphism of pairs (𝔮', K') → (𝔮, K) induces restriction maps C^•(𝔮, K; V) → C^•(𝔮', K'; V|), functorial in both variables; (iii) cup product C^p(𝔮, K; V) ⊗ C^q(𝔮, K; W) → C^{p+q}(𝔮, K; V ⊗ W) induces a graded-commutative product compatible with (ii); (iv) H^•(𝔮, K; V) = Ext^•_{(𝔮,K)}(ℂ, V) in the category of (𝔮, K)-modules.

*Hypotheses.* (𝔮, K) a pair; modules as in AF.1a/gk-module.

*Proof outline.*

1. (i) Hom_K(∧^q(𝔮/𝔨_ℂ), −) is exact on (𝔮, K)-modules because K-modules that are unions of finite-dimensional continuous representations are semisimple (complete reducibility, Tau Ceti CompactGroups Layer 2); apply the snake lemma.
2. (ii) pull back alternating forms along 𝔮'/𝔨'_ℂ → 𝔮/𝔨_ℂ; K'-invariance from equivariance.
3. (iii) The shuffle product of alternating forms commutes with d up to the Leibniz sign.
4. (iv) The standard relative Koszul resolution U(𝔮) ⊗_{U(𝔨_ℂ)} ∧^•(𝔮/𝔨_ℂ) is a projective resolution of ℂ in (𝔮, K)-Mod.

*Acceptance.* For the extension 0 → ℂ → V → ℂ → 0 of (ℝ, 1)-modules given by a nilpotent Jordan block, the connecting map H^0(ℂ) → H^1(ℂ) is an isomorphism. Cup product on H^•(𝔤𝔩_n(ℂ), U(n); ℂ) is the exterior algebra product on primitive generators in degrees 1, 3, …, 2n−1.

*Prerequisites.* `AF.1a/relative-lie-cochain-complex`, Tau Ceti RepresentationTheory/CompactGroups (layer 2 complete reducibility).

*Sources.* wockel-vanest (§3, (10), p. 11): “This gives rise to a sequence in cohomology” — Restriction maps induced by inclusions of pairs. ichino-prasanna23 (§7.1): “relative Lie algebra cohomology” — Used with tensor products F^* ⊗ A_q(λ) and Künneth-type decompositions.

### Construction: Continuous and differentiable cochain complexes of a Lie group

Node `AF.1a/differentiable-cochains`, declaration `TauCeti.VanEst.smoothCochains` in `TauCeti/RepresentationTheory/LieCohomology/VanEst`.

Let G be a real Lie group with finitely many components and V a finite-dimensional continuous real or complex representation (more generally a smooth quasi-complete locally convex G-module). C^q_c(G; V) = C(G^{q+1}, V)^G (homogeneous continuous cochains) and C^q_∞(G; V) = C^∞(G^{q+1}, V)^G (smooth cochains), with the homogeneous differential. The Mathlib continuous cochains TopRep.homogeneousCochains (iterated maps C(G, C(G, …, V))) are identified with C(G^{q+1}, V)^G for locally compact G. The inclusion C^•_∞ ⊆ C^•_c is a quasi-isomorphism (smoothing comparison).

*Hypotheses.* G a Lie group with finitely many components; V finite-dimensional, or smooth quasi-complete with the continuity assumptions of Borel–Wallach IX.1-5.

*Proof outline.*

1. Exponential law: for locally compact Hausdorff G, C(G, C(G^q, V)) ≅ C(G^{q+1}, V) (compact-open topology), giving the identification with Mathlib's model (the Mathlib TODO in ContCohomology/Basic).
2. Smooth cochains form a subcomplex since the homogeneous differential is a signed sum of face restrictions.
3. Smoothing: convolution with an approximate identity in C_c^∞(G) gives a chain homotopy inverse on the relatively injective resolutions C(G^{•+1}, V) and C^∞(G^{•+1}, V) (Hochschild–Mostow); both compute the relative derived functors of invariants, hence the comparison is a quasi-isomorphism.

*Uses.* AF.1a/van-est-isomorphism: the smooth cochains are differentiated to relative Lie cochains. BorelRegulators:R.2: continuous cohomology of GL_n(ℂ) and its restriction to arithmetic groups. Polylogarithms:P.2: degree-three continuous and differentiable cochains for GL_2(ℂ).

*API.*

- `VanEst.continuousCochains` (data): The complex C(G^{•+1}, V)^G.
- `VanEst.smoothCochains` (data): The complex C^∞(G^{•+1}, V)^G.
- `VanEst.continuousCochainsEquivMathlib` (equivalence): Isomorphism with Mathlib's TopRep.homogeneousCochains for locally compact G.
- `VanEst.smoothing_quasiIso` (characterisation): The inclusion of smooth cochains is a quasi-isomorphism.
- `VanEst.cochains_map` (functoriality): Naturality in continuous (smooth) homomorphisms G' → G and equivariant maps of coefficients.

*Unit tests.*

- `continuousCochains_compact` (degenerate): For G compact, H^q = 0 for q > 0.
- `continuousCochains_R` (computation): H^1_c(ℝ; ℝ) = ℝ and H^q_c(ℝ; ℝ) = 0 for q ≥ 2.
- `continuousCochains_discrete_not` (non-example): For G = ℤ (discrete) continuous cochains are all cochains and H^1(ℤ; ℝ) = ℝ but ℤ has infinitely many components: van Est does not apply to it.
- `continuousCochains_mathlib_compat` (compatibility): In degree 0 the identification with Mathlib's continuousCohomology is the identity on invariants V^G.

*Acceptance.* For G compact, both complexes are acyclic in positive degrees (averaging) and H^0 = V^G. For G = ℝ and V = ℝ trivial, H^1 is ℝ, spanned by the homomorphism t ↦ t, in both models.

*Prerequisites.* `mathlib:TopRep.homogeneousCochains`, `mathlib:continuousCohomology`, `mathlib:LieGroup`, `mathlib:ContMDiff`.

*Sources.* wockel-vanest (§3, Remark 3.1 and proof of Theorem 3.3, pp. 12-13): “the morphisms in the top row are quasi-isomorphisms by Proposition 2.7 and [Fuc11, Section 7].” — Comparison of the locally smooth, smooth and continuous cochain models. wockel-vanest (Introduction, p. 2): “We call this the van Est cohomology HvE (G; A) of G,” — The continuous-cochain (van Est) cohomology for topological vector space coefficients.

### Construction: Invariant differential forms on G/K

Node `AF.1a/invariant-forms-complex`, declaration `TauCeti.VanEst.invariantForms` in `TauCeti/RepresentationTheory/LieCohomology/VanEst`.

For G a real Lie group with compact subgroup K and V a smooth G-module, Ω^q(G/K; V)^G is the space of G-invariant V-valued smooth q-forms on the homogeneous manifold G/K with the exterior derivative. Evaluation at the base point eK identifies Ω^q(G/K; V)^G with Hom_K(∧^q(𝔤/𝔨), V), and under this identification the exterior derivative becomes the relative Chevalley–Eilenberg differential, including when K is disconnected (K/K° acts on both sides) and with the sign conventions of AF.1a/relative-lie-cochain-complex.

*Hypotheses.* G real Lie group, K ⊆ G compact, V finite-dimensional continuous (or smooth) G-module.

*Proof outline.*

1. G/K is a smooth manifold (closed-subgroup theorem, Tau Ceti LieGroups Layer 2) with T_{eK}(G/K) = 𝔤/𝔨.
2. A G-invariant form is determined by its value at eK, which must be K-invariant under the isotropy representation; conversely every such value extends by translation.
3. Compute d of an invariant form with the Maurer–Cartan equation on G: it is the Chevalley–Eilenberg differential on basic K-invariant cochains.
4. This step needs smooth differential forms of all degrees with exterior derivative on manifolds, recorded as a gap.

*Uses.* AF.1a/van-est-isomorphism: the de Rham side of the van Est comparison. BorelRegulators:R.2: invariant forms on GL_n(ℂ)/U(n) represent the Borel classes. ArithmeticLocallySymmetricSpaces:ALS.5: invariant forms descend to forms on Γ\G/K; that comparison is ALS.5's.

*API.*

- `VanEst.invariantForms` (data): The complex Ω^•(G/K; V)^G.
- `VanEst.invariantFormsEquivRelative` (equivalence): The isomorphism of complexes Ω^•(G/K; V)^G ≅ C^•(𝔤_ℂ, K; V ⊗ ℂ) (complex coefficients) by evaluation at eK.
- `VanEst.invariantForms_d` (characterisation): Under the isomorphism, d corresponds to the relative Chevalley–Eilenberg differential.
- `VanEst.invariantForms_componentAction` (relation): The action of K/K° on invariant forms for (G, K°) corresponds to its action on relative cochains.

*Unit tests.*

- `invariantForms_vector_group` (computation): For G = ℝ^n, K = 1, Ω^q(ℝ^n)^{ℝ^n} = ∧^q(ℝ^n)^* with zero differential.
- `invariantForms_compact` (degenerate): For K = G compact, G/K is a point and the complex is V^G in degree 0.
- `invariantForms_not_all_forms` (non-example): Ω^•(Γ\G/K) for a lattice Γ is not the invariant-form complex: for Γ = Γ(3) the de Rham cohomology of Γ(3)\𝔥 in degree 1 is nonzero while H^1(𝔰𝔩_2, SO(2); ℂ) = 0.

*Acceptance.* For G = ℝ^n, K = 1 and trivial coefficients, invariant forms are the constant-coefficient forms and d = 0. For G = SL_2(ℝ), K = SO(2), the invariant 2-form on the upper half-plane is the hyperbolic area form y⁻²dx∧dy, and it is closed and not exact among invariant forms.

*Prerequisites.* `AF.1a/relative-lie-cochain-complex`, Tau Ceti RepresentationTheory/LieGroups (layer 2 the closed subgroup cartan theorem), `mathlib:GroupLieAlgebra`.

*Sources.* wockel-vanest (§3, Lemma 3.2, p. 12): “Noting that we have a K-equivariant diffeomorphism G ∼ = G/K × K” — Cochains on G/K versus K-relative cochains on G; the evaluation at the identity coset.

### Theorem: The van Est isomorphism (planet: van Est isomorphism)

Node `AF.1a/van-est-isomorphism`, declaration `TauCeti.VanEst.vanEstIso` in `TauCeti/RepresentationTheory/LieCohomology/VanEst`.

Let G be a real Lie group with finitely many components, K ⊆ G a maximal compact subgroup and V a finite-dimensional continuous real or complex G-module (or a smooth quasi-complete locally convex G-module satisfying the hypotheses of Borel–Wallach IX.5). Then differentiation of smooth cochains at the identity defines a natural isomorphism H^q_c(G; V) ≅ H^q(𝔤, K; V) for all q ≥ 0, compatible with cup products, with the restriction maps along morphisms (G', K') → (G, K) with K' ⊆ K, and with change of coefficients. Equivalently, H^q_c(G; V) ≅ H^q(Ω^•(G/K; V)^G).

*Hypotheses.* G has finitely many components; K maximal compact, so G/K is diffeomorphic to a Euclidean space (Cartan–Iwasawa–Malcev); V finite-dimensional continuous, or smooth quasi-complete as in Borel–Wallach IX.5.

*Proof outline.*

1. The complexes C^∞(G^{•+1}, V) and C^∞((G/K)^{•+1}, V) are relatively injective resolutions of V; since K is compact, G-cohomology may be computed with the K-relative resolution (Wockel Proposition 2.8 for continuous cochains).
2. Use the double complex of G-invariant forms on (G/K)^{p+1}; G/K is diffeomorphic to ℝ^d, so the Poincaré lemma (contracting homotopy along geodesic rays of the Cartan decomposition) makes each row a resolution.
3. Taking G-invariants, the two edge maps identify H_c(G; V) with the cohomology of invariant forms Ω^•(G/K; V)^G, which is H^•(𝔤, K; V) by AF.1a/invariant-forms-complex.
4. The composite is Wockel's differentiation map D_n (Theorem 3.3); naturality and cup products follow from the explicit formula for D_n.

*Acceptance.* Compact G: both sides vanish in positive degrees and equal V^G in degree 0. G = ℝ^n with trivial coefficients: H^q_c(ℝ^n; ℝ) ≅ ∧^q(ℝ^n)^*. G = GL_n(ℂ), K = U(n), V = ℝ: H^•_c(GL_n(ℂ); ℝ) ≅ H^•(𝔤𝔩_n(ℂ), 𝔲(n); ℝ) ≅ H^•(U(n); ℝ), an exterior algebra on generators in degrees 1, 3, …, 2n−1, whose degree 2m−1 generators carry the Borel regulator classes. Disconnected example: for G = GL_2(ℝ), K = O(2), H^2_c(GL_2(ℝ); ℝ) = 0 while H^2_c(GL_2(ℝ)°; ℝ) ≠ 0.

*Prerequisites.* `AF.1a/differentiable-cochains`, `AF.1a/invariant-forms-complex`, `AF.1a/relative-cohomology-functoriality`, `AF.1a/cartan-iwasawa-malcev`.

*Sources.* wockel-vanest (§3, Theorem 3.3, p. 13): “The following isomorphism is sometimes also called the van Est isomorphism.” — Theorem 3.3: D_n : H^n_{loc,s}((G,K);A) → H^n_Lie((g,K);a) is an isomorphism, under the standing hypotheses of §3 (finitely many components, K maximal compact, quasi-complete smooth coefficients). wockel-vanest (§3, p. 11): “Unless mentioned otherwise, G will throughout this section be a finite-dimensional Lie group with finitely many components and K will be a maximal compact subgroup.” — Standing hypotheses of the theorem.

### Theorem: G/K is a Euclidean space

Node `AF.1a/cartan-iwasawa-malcev`, declaration `TauCeti.VanEst.quotient_maximalCompact_euclidean` in `TauCeti/RepresentationTheory/LieCohomology/VanEst`.

Let G be a real Lie group with finitely many components. Then G has maximal compact subgroups, any two are conjugate, every compact subgroup lies in one, and for K maximal compact the manifold G/K is diffeomorphic to ℝ^d. For G = G(ℝ) the real points of a connected reductive group over ℝ with Cartan involution θ and K = G^θ, the diffeomorphism is K × 𝔭 → G, (k, X) ↦ k exp X, so G/K ≅ 𝔭.

*Hypotheses.* G has finitely many connected components.

*Proof outline.*

1. Reductive case: import the Cartan decomposition (Tau Ceti LieGroups Layer 9) and the existence of a Cartan involution for real reductive groups (ArithmeticLocallySymmetricSpaces ALS.0 constructs Cartan involutions and maximal compact subgroups for G(F_∞)).
2. General case (Cartan–Iwasawa–Malcev–Mostow): reduce to the connected component, split off the solvable radical, and use the reductive case on the Levi quotient; this is the classical structure theorem, for which this packet records the proof route only (source gap).
3. Conjugacy of maximal compacts: every compact subgroup fixes a point of the contractible nonpositively curved space G/K (Cartan fixed-point theorem) in the reductive case.

*Acceptance.* GL_n(ℝ)/O(n) is the space of positive definite symmetric matrices, an open cone of dimension n(n+1)/2. For G = ℝ^× (two components) K = {±1} and G/K ≅ ℝ_{>0} ≅ ℝ.

*Prerequisites.* Tau Ceti RepresentationTheory/LieGroups (layer 9 the cartan iwasawa and kak decompositions), `ArithmeticLocallySymmetricSpaces:ALS.0`.

*Sources.* wockel-vanest (§2, Proposition 2.8, p. 9): “Suppose that G is a finite-dimensional Lie group with finitely many components, that K ≤ G is a maximal compact subgroup” — The hypotheses under which maximal compact subgroups are used for the relative comparison.

### Theorem: van Est acceptance computations

Node `AF.1a/van-est-acceptance`, declaration `TauCeti.VanEst.acceptance` in `TauCeti/RepresentationTheory/LieCohomology/VanEst`.

(i) For K compact, H^q_c(K; V) = 0 for q > 0 (averaging over Haar measure). (ii) For the vector group ℝ^n and trivial coefficients, H^q_c(ℝ^n; ℝ) = ∧^q(ℝ^n)^*. (iii) For GL_n(ℂ) with K = U(n), H^•_c(GL_n(ℂ); ℝ) ≅ H^•(𝔤𝔩_n(ℂ), 𝔲(n); ℝ) ≅ H^•(U(n); ℝ) (compact dual), so in the stable range the continuous cohomology is an exterior algebra on primitive classes in degrees 1, 3, 5, …. (iv) For GL_2(ℝ) with K = O(2), the component group O(2)/SO(2) acts on H^2(𝔤𝔩_2, SO(2); ℝ) = ℝ by −1, so H^2_c(GL_2(ℝ); ℝ) = 0 ≠ H^2_c(GL_2(ℝ)°; ℝ).

*Hypotheses.* Hypotheses of AF.1a/van-est-isomorphism.

*Proof outline.*

1. (i) Haar averaging (Tau Ceti haarAverage) gives a contracting homotopy of the continuous cochains.
2. (ii) Relative cochains of (ℝ^n, 1) with trivial coefficients have zero differential.
3. (iii) The compact dual: 𝔤𝔩_n(ℂ) = 𝔲(n) ⊕ i𝔲(n) and H^•(𝔤, 𝔨; ℝ) = H^•(𝔲(n) ⊕ 𝔲(n), 𝔲(n)_diag; ℝ) ≅ H^•(U(n); ℝ) by Cartan's theorem on compact Lie algebra cohomology (invariant forms on the compact group).
4. (iv) compute the action of the reflection diag(1, −1) on ∧²(𝔤/𝔨).

*Acceptance.* Each of (i)-(iv) is a stated acceptance case of the layer.

*Prerequisites.* `AF.1a/van-est-isomorphism`, `tauceti:TauCeti.haarAverage`, Tau Ceti RepresentationTheory/CompactGroups (layer 0 normalized haar measure and averaging).

*Sources.* wockel-vanest (Introduction, p. 2): “since there it can be read off the associated compact dual Gu /K of the non-compact symmetric space G/K naturally associated to G” — The compact dual computes the relative Lie algebra cohomology of semisimple G (Section 5).

**Coverage of AF.1a.** Status: planned. Refinements for the next pass:

- Smooth de Rham complex of manifolds (gap): the invariant-form complex needs it; either a supplier roadmap or a local construction on G/K.
- Quasi-complete coefficient extension of van Est with the precise Borel–Wallach IX.5 hypotheses (Wockel §3 covers quasi-complete smooth coefficients; Borel–Wallach itself not read).

## AF.1. Real reductive representation foundations

This layer builds the representation theory of real reductive groups that the automorphic layers need. Its first half is foundational: the Lie group G(ℝ) of a linear algebraic group, real reductive data (G, K, θ) with K and θ imported from ArithmeticLocallySymmetricSpaces ALS.0, K-types and K-finite vectors, admissible and Harish-Chandra modules, infinitesimal characters through the Harish-Chandra isomorphism, Harish-Chandra's admissibility theorem, the minimal principal series and Casselman's embedding, smooth Fréchet representations of moderate growth, G-continuous norms, the Casselman–Wallach globalization in the form proved by Bernstein and Krötz, and the Dixmier–Malliavin factorization. Its second half, grouped under the parent node `AF.1/real-reductive-representation-theory` and proposed as the sub-layer AF.1b, is the classification: tempered and square-integrable representations, Harish-Chandra's discrete series with their parameters and limits, the Langlands classification, the Weil groups W_ℝ and W_ℂ, Langlands' correspondence for GL_n(ℝ) and GL_n(ℂ) (red-team finding RT-AREA-automorphic-1/2), the (𝔤𝔩_2, O(2))-modules D_k and Vogan's generic unitary dual of GL_n.

**Dependencies.** Inside the roadmap: AF.0, AF.1a. Other roadmaps and the libraries: `AdelicAlgebraicGroups:AA.1/adelic-points`; `AdelicAlgebraicGroups:AA.3/height-representation-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.0`; `mathlib:ContRepresentation`; `mathlib:LieGroup`; `mathlib:Matrix.GeneralLinearGroup`; `mathlib:Representation`; `mathlib:Subalgebra.center`; `mathlib:UniversalEnvelopingAlgebra`; `tauceti:TauCeti.Lie.lieSubalgebraOfSubgroup`; `tauceti:TauCeti.peterWeylBasis`; `tauceti:TauCeti.vermaCentralCharacter`; Tau Ceti GlobalNumberFields (layer 10 archimedean characters infinity types and cyclotomic arithmetic); Tau Ceti ReductiveGroups (layer 2 lie algebra and the adjoint representation); Tau Ceti ReductiveGroups (layer 6 reductive and semisimple groups); Tau Ceti RepresentationTheory/CompactGroups (layer 2 complete reducibility); Tau Ceti RepresentationTheory/CompactGroups (layer 5 the peter weyl theorem); Tau Ceti RepresentationTheory/LieGroups (layer 2 the closed subgroup cartan theorem); Tau Ceti RepresentationTheory/LieGroups (layer 9 the cartan iwasawa and kak decompositions); Tau Ceti RepresentationTheory/LieHighestWeight (layer 7 the center of ul harish chandra freudenthal and serres relations); Tau Ceti RepresentationTheory/LieHighestWeight (layer 9 reductive lie algebras and gl_n); Tau Ceti RepresentationTheory/RootSystems (layer 4 chambers the fundamental domain and the longest element); `tauceti:lieMap`.

### Construction: The real Lie group G(ℝ) of a linear algebraic group

Node `AF.1/real-points-lie-group`, declaration `TauCeti.RealReductive.realPoints` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

Let G be a linear algebraic group over ℝ (for a number field F, apply this to Res_{F/ℚ}G, so G(F_∞) = ∏_{v|∞} G(F_v)). Choosing a closed embedding ι : G → GL_n over ℝ, G(ℝ) is a closed subgroup of GL_n(ℝ) and hence an embedded real Lie group; the resulting Lie group structure does not depend on ι, its Lie algebra is Lie(G)(ℝ) = Lie(G) ⊗ ℝ with bracket from the algebraic Lie algebra, algebraic homomorphisms G → H induce smooth homomorphisms G(ℝ) → H(ℝ) with differential the algebraic differential, the adjoint action is the algebraic adjoint representation, orbit maps G(ℝ) → X(ℝ), g ↦ g·x, are smooth, and for a closed algebraic subgroup H the quotient G(ℝ)/H(ℝ) is a smooth manifold with tangent space 𝔤/𝔥 at the base point. G(ℝ) has finitely many connected components.

*Hypotheses.* G affine of finite type over ℝ (smooth, since char 0).

*Proof outline.*

1. G(ℝ) = ι⁻¹(GL_n(ℝ)) ∩ zero set of the defining polynomials is closed in GL_n(ℝ) (AdelicAlgebraicGroups AA.1 / ReductiveGroupsPartII topology on points).
2. Closed-subgroup theorem (Tau Ceti LieGroups Layer 2) makes G(ℝ) an embedded Lie subgroup with Lie algebra lieSubalgebraOfSubgroup.
3. Identify lieSubalgebraOfSubgroup with Lie(G)(ℝ) ⊆ 𝔤𝔩_n(ℝ): X ∈ Lie(G)(ℝ) iff exp(tX) satisfies the defining equations for all t (Tau Ceti ReductiveGroups Layer 2 differential criterion).
4. Independence of ι: two embeddings differ by an algebraic, hence smooth, isomorphism of closed subgroups; uniqueness of the smooth structure on a closed subgroup.
5. Finitely many components: Whitney's theorem on real algebraic sets (G(ℝ) is a real algebraic variety).

*Uses.* ShimuraData:D0: real analytic group charts for G(ℝ), the Deligne torus and Hilbert groups. ShimuraData:D2: tangent spaces of orbits G(ℝ)·h and separation of the orbit. AF.0/smooth-adelic-function: smoothness at infinity is smoothness on this Lie group. AF.1/real-reductive-group: the ambient Lie group of a real reductive group.

*API.*

- `RealReductive.realPoints` (constructor): The Lie group structure on G(ℝ), with LieGroup instance.
- `RealReductive.realPoints_lieAlgebra` (equivalence): Lie(G(ℝ)) ≃ Lie(G)(ℝ) as real Lie algebras.
- `RealReductive.realPoints_map` (functoriality): An algebraic homomorphism f : G → H gives a smooth homomorphism f(ℝ) with lieMap f(ℝ) = df; map_id and map_comp.
- `RealReductive.realPoints_Ad` (compatibility): The Lie-group adjoint action of G(ℝ) is the algebraic adjoint representation.
- `RealReductive.realPoints_orbitMap` (other): Orbit maps of algebraic actions are smooth; G(ℝ)/H(ℝ) is a manifold with T_{eH} = 𝔤/𝔥.
- `RealReductive.realPoints_finite_components` (structure): G(ℝ)/G(ℝ)° is finite.
- `RealReductive.realPoints_GL_compat` (compatibility): For G = GL_n the structure agrees with Mathlib's Lie group structure on Matrix.GeneralLinearGroup.

*Unit tests.*

- `realPoints_gl1` (computation): For G = G_m, G(ℝ) = ℝ^× has two components and Lie algebra ℝ with exp = Real.exp onto the identity component.
- `realPoints_trivial` (degenerate): For the trivial group, G(ℝ) is a point and its Lie algebra is 0.
- `realPoints_SO2_not_dense` (non-example): The Lie algebra of SO(2) ⊆ GL_2(ℝ) is 1-dimensional; the subgroup of rational rotations is not closed and is not the real points of an algebraic subgroup, so the construction does not apply to it.
- `realPoints_deligne_torus` (compatibility): For S = Res_{ℂ/ℝ}G_m, S(ℝ) ≅ ℂ^× as Lie groups and Lie(S)(ℝ) ≅ ℂ.

*Acceptance.* GL_n(ℝ) as the units of M_n(ℝ) recovers Mathlib's Lie group structure on units of a normed algebra; Lie algebra 𝔤𝔩_n(ℝ). SL_2(ℝ): Lie algebra the trace-zero matrices; G(ℝ) connected. O(2): two components. The Deligne torus S = Res_{ℂ/ℝ}G_m has S(ℝ) = ℂ^× with Lie algebra ℂ (ShimuraData D0 consumer).

*Prerequisites.* Tau Ceti RepresentationTheory/LieGroups (layer 2 the closed subgroup cartan theorem), Tau Ceti ReductiveGroups (layer 2 lie algebra and the adjoint representation), `AdelicAlgebraicGroups:AA.1/adelic-points`, `mathlib:LieGroup`, `mathlib:Matrix.GeneralLinearGroup`, `tauceti:TauCeti.Lie.lieSubalgebraOfSubgroup`, `tauceti:lieMap`.

*Sources.* getz-hahn (§3.3, p. 17): “Then G(R ⊗Q F ) is a real reductive Lie group (in other words, the real points of a reductive group over R).” — G(F_∞) as a real Lie group. getz-hahn (§5.1, p. 22): “For GLn , the Lie algebra gln is the collection of n × n matrices. The exponential is simply the matrix exponential in this case.” — The GL_n case of the Lie algebra and exponential.

### Definition: Real reductive groups with maximal compact subgroup

Node `AF.1/real-reductive-group`, declaration `TauCeti.RealReductive.Datum` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

A real reductive group in the sense used here is the datum (G, K, θ) where G = 𝐆(ℝ) for a connected reductive group 𝐆 over ℝ (or 𝐆(F_∞) for 𝐆 over a number field), θ is a Cartan involution of G and K = G^θ is the corresponding maximal compact subgroup; 𝔤 = 𝔨 ⊕ 𝔭 is the Cartan decomposition. K meets every component of G and K/K° ≅ G/G° is finite. The invariants rank G (absolute rank of 𝔤_ℂ), rank K, the split rank of the centre and dim G/K are attached to the datum. Cartan involutions and maximal compact subgroups are imported from ArithmeticLocallySymmetricSpaces ALS.0.

*Hypotheses.* 𝐆 connected reductive over ℝ.

*Proof outline.*

1. Import a Cartan involution θ and K = G^θ from ALS.0 (Cartan involutions, maximal compact subgroups and symmetric space for G(F_∞)).
2. Cartan decomposition 𝔤 = 𝔨 ⊕ 𝔭 and G = K exp 𝔭 from Tau Ceti LieGroups Layer 9; hence K meets every component and K/K° ≅ G/G°.
3. Uniqueness of K up to G°-conjugacy (all maximal compacts conjugate) from ALS.0.

*Uses.* AF.1/admissible-gk-module: (𝔤, K)-modules for this K. AF.2/automorphic-form: K_∞-finiteness of automorphic forms. AF.4/l0-q0-invariants: the invariants rank G − rank K and dim G/K. EndoscopicTransferAndUnitaryTraceComparison:ET.1: pseudocoefficients of discrete series of real groups.

*API.*

- `RealReductive.Datum` (data): The structure (G, K, θ) with θ a Cartan involution and K = G^θ.
- `RealReductive.Datum.cartanDecomp` (projection): 𝔤 = 𝔨 ⊕ 𝔭 as ±1-eigenspaces of dθ.
- `RealReductive.Datum.componentGroup` (structure): K/K° ≃ G/G°, a finite group.
- `RealReductive.Datum.ofAlgebraic` (constructor): The datum attached to 𝐆(ℝ) via ALS.0.
- `RealReductive.Datum.conj` (relation): Any two data for the same 𝐆 are conjugate by G°.

*Unit tests.*

- `datum_GLn` (computation): For GL_n(ℝ): K = O(n), dim 𝔭 = n(n+1)/2, K/K° ≅ ℤ/2.
- `datum_compact` (degenerate): If 𝐆(ℝ) is compact (e.g. a definite unitary group) then K = G and 𝔭 = 0.
- `datum_not_any_compact` (non-example): SO(2) ⊆ GL_2(ℝ) is compact but not maximal: it misses a component of GL_2(ℝ), so (GL_2(ℝ), SO(2)) is not a datum.
- `datum_lie_compat` (compatibility): For 𝐆 = GL_n the Cartan decomposition is the polar decomposition of Tau Ceti LieGroups Layer 9.

*Acceptance.* GL_n(ℝ) with θ(g) = (g^t)⁻¹, K = O(n), 𝔭 = symmetric matrices. GL_n(ℂ) as a real group with K = U(n); GSp_4(ℝ) with K = the stabiliser of i·1_2 in the Siegel space, extended by the similitude centre.

*Prerequisites.* `AF.1/real-points-lie-group`, `ArithmeticLocallySymmetricSpaces:ALS.0`, Tau Ceti RepresentationTheory/LieGroups (layer 9 the cartan iwasawa and kak decompositions), Tau Ceti ReductiveGroups (layer 6 reductive and semisimple groups).

*Sources.* getz-hahn (§3.3, p. 17): “We let K∞ ≤ G(R ⊗Q F ) be a maximal compact subgroup.” — The maximal compact subgroup K_∞ fixed throughout. bernstein-kroetz (§1, p. 2): “Let G be a linear reductive real Lie group G with Lie algebra g1. Let us fix a maximal compact subgroup K of G.” — The datum (G, K) of the globalization theory.

### Construction: K-types and K-finite vectors

Node `AF.1/k-finite-vectors`, declaration `TauCeti.RealReductive.kFinite` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

Let K be a compact Lie group and V a representation of K that is a union of finite-dimensional continuous subrepresentations, or a continuous representation on a complete locally convex space. For an irreducible representation σ ∈ K̂, the σ-isotypic subspace V(σ) is the image of the projector E_σ = d(σ)∫_K conj(χ_σ(k)) π(k) dk; the K-finite vectors V_K = ⊕_σ V(σ) (algebraic direct sum) are those whose K-orbit spans a finite-dimensional space. For a smooth vector of a representation of G ⊇ K, K-finiteness can be detected by 𝔨: the span of 𝔨-iterates is finite-dimensional.

*Hypotheses.* K compact Lie group; V complete locally convex with continuous K-action.

*Proof outline.*

1. Peter–Weyl and complete reducibility for compact groups (Tau Ceti CompactGroups Layers 2, 5, 6) give the projectors E_σ and E_σE_τ = δ_{στ}E_σ.
2. V_K = ⊕ V(σ) and V_K is dense when V is complete (approximate identity on K).
3. The 𝔨-criterion for smooth vectors (Getz–Hahn Proposition 5.12) using the exponential.

*Uses.* AF.1/admissible-gk-module: admissibility is finiteness of the dimensions of V(σ). AF.2/automorphic-form: automorphic forms are K_∞-finite. AF.1/smooth-vectors: the K-finite vectors of a Banach representation form a (𝔤,K)-module.

*API.*

- `RealReductive.isotypic` (data): V(σ) for σ ∈ K̂ as the range of the projector E_σ.
- `RealReductive.kFinite` (data): The submodule V_K of K-finite vectors.
- `RealReductive.kFinite_eq_iSup_isotypic` (characterisation): V_K = ⊕_σ V(σ) as an internal direct sum.
- `RealReductive.kFinite_dense` (other): V_K is dense in V when V is complete.
- `RealReductive.kFinite_iff_lie` (characterisation): For smooth v, v ∈ V_K iff span{X·v : X ∈ U(𝔨)} is finite-dimensional.
- `RealReductive.isotypic_map` (functoriality): K-equivariant maps send V(σ) to W(σ).

*Unit tests.*

- `kFinite_SO2_L2` (computation): For L²(SO(2)), V(e^{inθ}) is one-dimensional for each n ∈ ℤ.
- `kFinite_trivial` (degenerate): For the trivial group K = 1, V_K = V.
- `kFinite_not_all` (non-example): The function θ ↦ |θ| on SO(2) (a continuous non-trigonometric-polynomial function) lies in L²(SO(2)) but not in V_K.
- `kFinite_peterWeyl_compat` (compatibility): For V = L²(K), V_K is the span of the Peter–Weyl matrix coefficients (Tau Ceti peterWeylBasis).

*Acceptance.* For K = SO(2) and V = L²(SO(2)), V(σ_n) = ℂe^{inθ} and V_K is the space of trigonometric polynomials. For K = O(2) and V = L²(O(2)), the isotypic component of the 2-dimensional representation σ_n (n ≥ 1) has dimension (dim σ_n)² = 4 (Peter–Weyl).

*Prerequisites.* `AF.1a/gk-module`, Tau Ceti RepresentationTheory/CompactGroups (layer 2 complete reducibility), Tau Ceti RepresentationTheory/CompactGroups (layer 5 the peter weyl theorem), `tauceti:TauCeti.peterWeylBasis`, `mathlib:ContRepresentation`.

*Sources.* getz-hahn (§5.2, Definition 5.10, p. 25): “is the space of K-finite vectors in V .” — V_fin = ⊕_{σ ∈ K̂} V(σ). getz-hahn (§5.2, Proposition 5.12, p. 26): “Thus K-finiteness can be detected using the Lie algebra of K.” — The 𝔨-criterion for smooth vectors.

### Definition: Admissible (𝔤, K)-modules and Harish-Chandra modules (planet: Harish-Chandra module)

Node `AF.1/admissible-gk-module`, declaration `TauCeti.RealReductive.HCModule` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

Let (G, K) be a real reductive group. A (𝔤, K)-module V is admissible (weakly admissible) if dim Hom_K(σ, V) < ∞ for every σ ∈ K̂. It is Z(𝔤)-finite if an ideal of finite codimension in the centre Z(𝔤) of U(𝔤_ℂ) annihilates it. A Harish-Chandra module is a finitely generated admissible (𝔤, K)-module; equivalently a Z(𝔤)-finite admissible (𝔤, K)-module. Harish-Chandra modules form an abelian category HC closed under subquotients, finite direct sums, tensor products with finite-dimensional (𝔤, K)-modules and the duality V ↦ Ṽ (K-finite vectors of the algebraic dual), with Ṽ̃ = V.

*Hypotheses.* (G, K) a real reductive group (AF.1/real-reductive-group).

*Proof outline.*

1. Define the predicates using K-isotypic components (AF.1/k-finite-vectors) and the centre of U(𝔤_ℂ) (Mathlib Subalgebra.center of UniversalEnvelopingAlgebra).
2. Equivalence of the two descriptions: Bernstein–Krötz Theorem 4.3, using Harish-Chandra's theorem (AF.1/harish-chandra-admissibility) and Osborne's U(𝔤) = U(𝔫)F Z(𝔤)U(𝔨).
3. Closure properties and duality: Ṽ is weakly admissible and Z(𝔤)-finite, hence Harish-Chandra; Ṽ̃ = V since each V(σ) is finite-dimensional.

*Uses.* AF.1/casselman-wallach-globalization: the source category of the globalization functor. AF.2/harish-chandra-finiteness: spaces of automorphic forms with fixed K-types and ideal are admissible. AF.4/cohomological-representation: cohomology of admissible modules twisted by finite-dimensional V. AutomorphicLFunctionsAndLocalFactors:AL.3: finite-length admissible real (𝔤,K)-modules carry the archimedean Rankin–Selberg integrals. EndoscopicTransferAndUnitaryTraceComparison:ET.1: Harish-Chandra characters of admissible representations.

*API.*

- `RealReductive.IsAdmissible` (data): The predicate ∀ σ, finrank Hom_K(σ, V) < ∞.
- `RealReductive.IsZFinite` (data): Annihilated by an ideal of finite codimension of Z(𝔤).
- `RealReductive.HCModule` (data): The full subcategory of Harish-Chandra modules.
- `RealReductive.HCModule.abelian` (instance): HC is abelian and closed under subquotients.
- `RealReductive.HCModule.dual` (constructor): The dual Ṽ and the natural isomorphism Ṽ̃ ≅ V.
- `RealReductive.HCModule.tensorFinite` (structure): V ⊗ F is Harish-Chandra for F finite-dimensional.
- `RealReductive.HCModule.iff_zFinite` (characterisation): An admissible (𝔤,K)-module is finitely generated iff it is Z(𝔤)-finite.

*Unit tests.*

- `hcModule_trivial` (degenerate): The trivial (𝔤, K)-module ℂ is Harish-Chandra with infinitesimal character that of the trivial representation.
- `hcModule_discrete_series_SL2` (computation): For SL_2(ℝ), the holomorphic discrete series D_k has K-types e^{ilθ}, l ≥ k, l ≡ k mod 2, each with multiplicity one.
- `hcModule_tensor_not_fg` (non-example): D_k ⊗ D_l for SL_2(ℝ) is admissible but not finitely generated (Bernstein–Krötz Remark 4.1(b)).
- `hcModule_finiteDim_compat` (compatibility): A finite-dimensional algebraic representation of 𝐆 restricted to (𝔤, K) is a Harish-Chandra module with infinitesimal character χ_{λ+ρ} (Tau Ceti vermaCentralCharacter).

*Acceptance.* Every finite-dimensional (𝔤, K)-module is a Harish-Chandra module. The tensor product of two holomorphic discrete series of SL_2(ℝ) is admissible but not finitely generated, hence not Harish-Chandra (Bernstein–Krötz Remark 4.1(b)).

*Prerequisites.* `AF.1a/gk-module`, `AF.1/k-finite-vectors`, `AF.1/real-reductive-group`, `mathlib:UniversalEnvelopingAlgebra`, `mathlib:Subalgebra.center`.

*Sources.* bernstein-kroetz (§4, p. 22): “A (g, K)-module V will be called Harish-Chandra module or admis- sible (g, K)-module if the conditions in the theorem above are satisfied.” — Definition via the equivalent conditions of Theorem 4.3. getz-hahn (§5.3, p. 26): “We say that the (g, K)-module is admissible if we can choose the Vi to have have distinct K-types.” — Admissibility as finite K-multiplicities.

### Definition: Infinitesimal characters and generalized infinitesimal-character subspaces (planet: Infinitesimal character)

Node `AF.1/infinitesimal-character`, declaration `TauCeti.RealReductive.InfChar` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

Let Z(𝔤) be the centre of U(𝔤_ℂ). An infinitesimal character is a ℂ-algebra homomorphism χ : Z(𝔤) → ℂ. Via the Harish-Chandra isomorphism γ : Z(𝔤) ≅ S(𝔥_ℂ)^W for a Cartan subalgebra 𝔥_ℂ ⊆ 𝔤_ℂ, infinitesimal characters correspond to W-orbits of λ ∈ 𝔥_ℂ^*: χ_λ(z) = γ(z)(λ), with χ_λ = χ_μ iff μ ∈ Wλ. A (𝔤,K)-module V has infinitesimal character χ if z·v = χ(z)v; its generalized χ-eigenspace is V_χ = {v : (z − χ(z))^n v = 0 ∀ z, some n}. Normalisation: the finite-dimensional irreducible representation of highest weight μ has infinitesimal character χ_{μ+ρ}.

*Hypotheses.* 𝔤_ℂ reductive; Cartan subalgebra 𝔥_ℂ and positive system fixed for the normalisation of γ.

*Proof outline.*

1. Harish-Chandra isomorphism for reductive 𝔤_ℂ: import from Tau Ceti LieHighestWeight Layers 7 and 9 (centre of U(L), Harish-Chandra projection, dot-invariants), extended to the reductive case through 𝔤_ℂ = 𝔷 ⊕ [𝔤,𝔤].
2. χ_λ = χ_μ iff μ ∈ Wλ (Harish-Chandra), and the highest-weight normalisation from Tau Ceti vermaCentralCharacter: the centre acts on a highest weight vector of weight μ by χ_{μ+ρ}.
3. Generalized eigenspaces are (𝔤, K)-submodules because Z(𝔤) is central and K-invariant (K acts on Z(𝔤) through Ad, trivially on Z(𝔤) for connected G and through outer automorphisms otherwise; for disconnected K the eigenspaces are permuted by K/K°, so we take the Z(𝔤)^K-generalized eigenspaces).

*Uses.* AF.2/automorphic-form: Z(𝔤)-finiteness in the definition of automorphic forms. AF.4/infinitesimal-character-of-weight: cohomological representations have the infinitesimal character of V_λ^∨. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic π has the infinitesimal character of an algebraic representation; uniqueness of the weight. AF.1/harish-chandra-admissibility: finitely many irreducibles with a given infinitesimal character.

*API.*

- `RealReductive.InfChar` (data): Algebra homomorphisms Z(𝔤) →ₐ[ℂ] ℂ.
- `RealReductive.infCharOf` (constructor): χ_λ for λ ∈ 𝔥_ℂ^*, through the Harish-Chandra isomorphism.
- `RealReductive.infCharOf_eq_iff` (characterisation): χ_λ = χ_μ ↔ ∃ w ∈ W, μ = w λ.
- `RealReductive.HasInfChar` (data): V has infinitesimal character χ.
- `RealReductive.genEigenspace` (constructor): The generalized eigenspace V_χ as a sub-(𝔤, K°)-module.
- `RealReductive.infChar_highestWeight` (compatibility): The irreducible finite-dimensional module of highest weight μ has infinitesimal character χ_{μ+ρ} (agrees with Tau Ceti vermaCentralCharacter μ).
- `RealReductive.infChar_casimir` (simp): χ_λ(Ω) = ⟨λ, λ⟩ − ⟨ρ, ρ⟩ for the Casimir Ω of an invariant form.

*Unit tests.*

- `infChar_trivial_gl2` (computation): The trivial representation of GL_2(ℝ) has infinitesimal character χ_ρ with ρ = (1/2, −1/2) and Casimir value 0.
- `infChar_weyl_invariant` (characterisation): χ_{(a,b)} = χ_{(b,a)} for 𝔤𝔩_2.
- `infChar_k_weight` (computation): The weight-k discrete series of GL_2(ℝ) has infinitesimal character χ_{((k−1)/2, −(k−1)/2)}, the same as Sym^{k−2} ⊗ det^{(2−k)/2}-normalised.
- `infChar_not_linear_action` (non-example): χ_λ is invariant under the linear Weyl action on λ (after the ρ-shift built into γ), not under the dot action on the highest weight μ = λ − ρ: χ_{μ+ρ} = χ_{w(μ+ρ)} ≠ χ_{wμ+ρ} in general.

*Acceptance.* For 𝔤 = 𝔤𝔩_2 with Casimir Δ = (1/4)(H² + 2XY + 2YX), the discrete series of weight k has Δ = k(k−2)/4, the value on the (k−1)-dimensional representation Sym^{k−2}. The trivial representation of GL_n(ℝ) has infinitesimal character ρ = ((n−1)/2, (n−3)/2, …, (1−n)/2).

*Prerequisites.* `AF.1/admissible-gk-module`, Tau Ceti RepresentationTheory/LieHighestWeight (layer 7 the center of ul harish chandra freudenthal and serres relations), Tau Ceti RepresentationTheory/LieHighestWeight (layer 9 reductive lie algebras and gl_n), `tauceti:TauCeti.vermaCentralCharacter`, `mathlib:Subalgebra.center`, `mathlib:UniversalEnvelopingAlgebra`.

*Sources.* bernstein-kroetz (§4, p. 21): “Dixmier’s version of Schur’s Lemma is applicable (see [17], 0.5.1 and 0.5.2) and associates to V an infinitesimal character χV ∈ spec(Z(g)).” — Irreducible (𝔤,K)-modules have an infinitesimal character. bernstein-kroetz (§4, p. 21): “A U(g)-module V will be called Z(g)-finite provided there exists an ideal I ⊳ Z(g) of finite codimension which annihilates V” — Z(𝔤)-finiteness and its description by finitely many characters. getz-hahn (§6.5, p. 34): “Then πk is an irreducible admissible (g, K∞ )-module.” — The modules π_k with Δv_ℓ = k(k−2)/4 v_ℓ.

### Theorem: Harish-Chandra's admissibility and finiteness theorem (planet: Harish-Chandra admissibility theorem)

Node `AF.1/harish-chandra-admissibility`, declaration `TauCeti.RealReductive.admissible_of_irreducible` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

Let (G, K) be a real reductive group. (i) Every irreducible (𝔤, K)-module is admissible; (ii) for each infinitesimal character χ there are only finitely many irreducible (𝔤, K)-modules with infinitesimal character χ; (iii) a (𝔤, K)-module that is admissible and Z(𝔤)-finite is finitely generated and of finite length, with finite K-multiplicities bounded uniformly in terms of dim σ on irreducibles; (iv) for every irreducible unitary representation of G on a Hilbert space, the K-finite vectors form an irreducible Harish-Chandra module (unitary representations are admissible).

*Hypotheses.* (G, K) real reductive with K maximal compact.

*Proof outline.*

1. (i)-(ii): Harish-Chandra's theorem via the Casselman embedding into principal series (AF.1/casselman-embedding) and the finite K-multiplicities of principal series (Frobenius reciprocity for K: Hom_K(σ, I(W)) = Hom_{M∩K}(σ, W)).
2. (iii): Z(𝔤)-finite admissible modules embed into finite sums of principal series with finitely many parameters; finite length from (ii).
3. (iv): for unitary irreducible π, π(E_σ) projections and Harish-Chandra's bound dim Hom_K(σ, π) ≤ dim σ.
4. Record Bernstein–Krötz Theorem 4.3 as the characterisation used in AF.1/admissible-gk-module.

*Acceptance.* For SL_2(ℝ) and χ = χ_ρ (trivial infinitesimal character) the irreducibles are: the trivial representation, D_2^+, D_2^−, and no others. The space of K-finite automorphic forms with fixed K-type and ideal J is finite-dimensional (AF.2/harish-chandra-finiteness) — the global consequence.

*Prerequisites.* `AF.1/admissible-gk-module`, `AF.1/infinitesimal-character`, `AF.1/principal-series`.

*Sources.* bernstein-kroetz (§4, Theorem 4.2, p. 21): “Every V ∈ Irr(g, K) is weakly admissible.” — Theorem 4.2 (i); (ii) is finiteness of the fibres of V ↦ χ_V. bernstein-kroetz (§4, Theorem 4.3, p. 21): “For a weakly admissible (g, K)-module V the following assertions are equivalent:” — Finite generation ⇔ Z(𝔤)-finiteness ⇔ finite generation over 𝔫.

### Construction: Minimal principal series I^∞(W)

Node `AF.1/principal-series`, declaration `TauCeti.RealReductive.principalSeries` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

Fix an Iwasawa decomposition G = NAK and the minimal parabolic P_min = MAN with M = Z_K(A). For a finite-dimensional smooth representation W of P_min (in particular σ ⊗ e^{ν+ρ} ⊗ 1 with σ ∈ M̂, ν ∈ 𝔞_ℂ^*), I^∞(W) is the space of smooth f : G → W with f(pg) = p·f(g), with the Fréchet topology of compact convergence of all derivatives and G acting by right translation R(g)f(x) = f(xg). It is an admissible smooth Fréchet representation of moderate growth; its K-finite vectors I(W) form a Harish-Chandra module, and restriction to K gives I(W) ≅ Ind_{M∩K}^K(W|) as K-modules (Frobenius reciprocity for K-types).

*Hypotheses.* (G, K) real reductive; Iwasawa decomposition from Tau Ceti LieGroups Layer 9.

*Proof outline.*

1. Iwasawa decomposition G = NAK (Tau Ceti LieGroups Layer 9) identifies I^∞(W) with smooth functions on K with M∩K-equivariance.
2. Fréchet topology and continuity of R; moderate growth from the Iwasawa projection estimates.
3. K-types: Frobenius reciprocity for the compact group K (Tau Ceti InductionRestriction for finite groups is the model; for compact K use Peter–Weyl).
4. Admissibility: each K-type σ occurs with multiplicity dim Hom_{M∩K}(σ, W) ≤ dim σ · dim W.

*Uses.* AF.1/casselman-embedding: target of the Casselman embedding. AF.1/casselman-wallach-globalization: the principal-series case of the globalization theorem (Bernstein–Krötz §§8, 12). AF.1/langlands-classification: Langlands quotients are quotients of induced representations. AutomorphicSpectralTheory:AS.1: archimedean components of induced representations in Eisenstein series.

*API.*

- `RealReductive.principalSeries` (constructor): I^∞(W) as an SF representation of G.
- `RealReductive.principalSeries_kFinite` (projection): I(W) = K-finite vectors, a Harish-Chandra module.
- `RealReductive.principalSeries_restrictK` (characterisation): I(W)|_K ≅ Ind_{M∩K}^K(W|_{M∩K})_K.
- `RealReductive.principalSeries_map` (functoriality): P_min-maps W → W' induce G-maps I^∞(W) → I^∞(W'); exactness in W.
- `RealReductive.principalSeries_dual` (relation): The dual of I(σ ⊗ e^{ν+ρ}) is I(σ^∨ ⊗ e^{−ν+ρ}) via ∫_K pairing.

*Unit tests.*

- `principalSeries_GL1` (degenerate): For G = ℝ^× (P_min = G), I^∞(χ) = ℂ with G acting by χ.
- `principalSeries_SL2_ktypes` (computation): For SL_2(ℝ), σ = triv on M = {±1}, I(e^{ν+ρ}) has K-types {e^{2inθ}} each with multiplicity one.
- `principalSeries_not_irreducible` (non-example): For SL_2(ℝ) and ν = ρ (W = e^{2ρ}) I(W) is reducible: it contains the trivial representation as a quotient and D_2^± as subrepresentations; irreducibility is not automatic.
- `principalSeries_hc_compat` (compatibility): I(W) satisfies the Harish-Chandra module conditions of AF.1/admissible-gk-module.

*Acceptance.* For SL_2(ℝ) and W = e^{s}: I(W) has K-types e^{i2nθ} (or odd) each with multiplicity one; it is reducible exactly at the integral points s ∈ ℤ + parity. For GL_1(ℝ) = ℝ^×, P_min = G and I^∞(χ) = χ is one-dimensional.

*Prerequisites.* `AF.1/real-reductive-group`, `AF.1/admissible-gk-module`, Tau Ceti RepresentationTheory/LieGroups (layer 9 the cartan iwasawa and kak decompositions), Tau Ceti RepresentationTheory/CompactGroups (layer 5 the peter weyl theorem).

*Sources.* bernstein-kroetz (§4, p. 22): “the smooth sections of the G-equivariant vector-bundle W ×Pmin G → Pmin\G, that is the smooth functions f : G → W which satisfy f (pg) = p · f (g) for all p ∈ Pmin and g ∈ G.” — Definition of I^∞(W) and its Fréchet topology.

### Theorem: Casselman's subrepresentation theorem

Node `AF.1/casselman-embedding`, declaration `TauCeti.RealReductive.casselman_embedding` in `TauCeti/RepresentationTheory/RealReductive/Basic`.

Every Harish-Chandra module V ≠ 0 of a real reductive group (G, K) embeds into the K-finite vectors I(W) of a minimal principal series representation, with W a finite-dimensional P_min-module; for V irreducible one may take W = σ ⊗ e^{ν+ρ} irreducible. Equivalently the 𝔫-coinvariants (or 𝔫-homology H_0(𝔫, V)) are nonzero and finite-dimensional.

*Hypotheses.* V a Harish-Chandra module.

*Proof outline.*

1. V/𝔫V ≠ 0 and finite-dimensional (Casselman, via Osborne's U(𝔤) = U(𝔫)F Z(𝔤)U(𝔨) and Z(𝔤)-finiteness).
2. A (𝔪𝔞, M)-equivariant quotient V/𝔫V → W gives by Frobenius reciprocity a nonzero map V → I(W); restricting W to a quotient and V irreducible gives injectivity.

*Acceptance.* For the trivial representation of SL_2(ℝ): ℂ ↪ I(e^{0}) as the constant functions (ν = −ρ), the generalised principal series containing the trivial representation as a subrepresentation. Each SL_2(ℝ) discrete series D_k^± embeds into I(sgn^k ⊗ e^{(k−1)α/2+ρ}).

*Prerequisites.* `AF.1/principal-series`, `AF.1/admissible-gk-module`.

*Sources.* bernstein-kroetz (§4, p. 22): “Another basic feature of Harish-Chandra modules is the Casselman embedding theorem which asserts that every Harish-Chandra module can be embedded into the K-finite vectors of some minimal principal series representation ([5]).” — Statement as used for G-continuous norms.

### Definition: Smooth Fréchet representations of moderate growth

Node `AF.1/sf-representation`, declaration `TauCeti.RealReductive.SFRep` in `TauCeti/RepresentationTheory/RealReductive/Globalization`.

A Fréchet representation (π, E) of a real reductive group G is a continuous representation on a Fréchet space. It is an F-representation of moderate growth if for each continuous seminorm p there are a continuous seminorm q and N with p(π(g)v) ≤ ‖g‖^N q(v); it is smooth (an SF-representation) if every vector is smooth, E = E^∞, and the Fréchet topology is the one defined by the seminorms v ↦ p(Xv), X ∈ U(𝔤). It is admissible (an SAF-representation) if its K-finite vectors form a Harish-Chandra module. SAF is the category with continuous G-maps; E ↦ E_K is a functor SAF → HC.

*Hypotheses.* Norm ‖g‖ on G from a faithful representation (AdelicAlgebraicGroups AA.3 heights at the archimedean place).

*Proof outline.*

1. Define moderate growth through the norm; independence of the norm by the comparison of heights.
2. Smooth vectors E^∞ of a Banach representation with its Sobolev seminorms (Getz–Hahn Definition 5.2, Lemma 5.3, Proposition 5.5 for density).
3. The functor E ↦ E_K: K-finite vectors of an SF-representation are smooth and stable under 𝔤 (Bernstein–Krötz Remark 4.1(a)).

*Uses.* AF.1/casselman-wallach-globalization: the target category of globalization. AF.0/growth-translation-differentiation: levels T_N([G])^J of the growth space are SF-representations of G(F_∞). AutomorphicLFunctionsAndLocalFactors:AL.2: Godement–Jacquet integrals on smooth Fréchet globalizations. MetaplecticAutomorphicForms:MP.0: smooth oscillator representation as an SF-representation of the metaplectic group.

*API.*

- `RealReductive.SFRep` (data): Smooth moderate-growth Fréchet representations with continuous G-maps.
- `RealReductive.SFRep.kFinite` (functoriality): The functor E ↦ E_K to (𝔤, K)-modules.
- `RealReductive.SFRep.smoothVectors` (constructor): The SF-representation E^∞ of smooth vectors of a Banach representation of moderate growth.
- `RealReductive.SFRep.derivAction` (structure): The Lie algebra action on E, continuous for the Fréchet topology.
- `RealReductive.SFRep.SAF` (data): The full subcategory of admissible SF-representations.

*Unit tests.*

- `sfRep_trivial` (degenerate): ℂ with trivial action is an SAF-representation.
- `sfRep_principalSeries` (computation): I^∞(e^{ν}) for SL_2(ℝ) is SAF with K-finite vectors the trigonometric polynomials in the K-picture.
- `sfRep_L2_not_smooth` (non-example): The Hilbert space of a unitary principal series of SL_2(ℝ) is a Banach representation of moderate growth but not an SF-representation: not every vector is smooth; its smooth vectors form the SF-representation.
- `sfRep_kFinite_compat` (compatibility): For E ∈ SAF, E_K is a Harish-Chandra module (AF.1/admissible-gk-module).

*Acceptance.* The principal series I^∞(W) is SAF. A Hilbert representation of G is not in general an SF-representation: its smooth vectors form one.

*Prerequisites.* `AF.1/k-finite-vectors`, `AF.1/admissible-gk-module`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`, `mathlib:ContRepresentation`.

*Sources.* bernstein-kroetz (§1, p. 2): “Let us denote by SAF the category whose objects are smooth ad- missible moderate growth Fréchet representations of G with continuous linear G-maps as morphisms.” — The category SAF and the functor E ↦ E^{K-fin}. getz-hahn (§5.1, Definition 5.2, p. 22): “A vector φ ∈ V is said to be smooth if φ is C ∞ . The subspace of smooth vectors is denoted by V ∞ ≤ V .” — Smooth vectors.

### Definition: G-continuous norms and the Sobolev order

Node `AF.1/g-continuous-norms`, declaration `TauCeti.RealReductive.GContinuousNorm` in `TauCeti/RepresentationTheory/RealReductive/Globalization`.

A norm p on a Harish-Chandra module V is G-continuous if the completion V_p is a Banach representation of G whose K-finite vectors are V. For k ∈ ℕ_0 the k-th Sobolev norm p_k(v) = (Σ_{|α| ≤ k} p(X^α v)²)^{1/2} uses a basis of 𝔤. The Sobolev order p ≺ q holds if p ≤ C q_k for some C, k; p and q are Sobolev-equivalent if p ≺ q and q ≺ p. Every Harish-Chandra module admits a G-continuous norm, and for a G-continuous norm p the smooth vectors V_p^∞ form a nuclear Fréchet space because K-multiplicities are polynomially bounded; every G-continuous norm is Sobolev-equivalent to a K-invariant Hermitian norm.

*Hypotheses.* V a Harish-Chandra module of a real reductive group.

*Proof outline.*

1. Existence: Casselman's embedding V ↪ I(W) and the L²(K) norm on I(W).
2. Polynomial bound on K-multiplicities dim Hom_K(σ, V) ≤ C(1 + |σ|)^d (Bernstein–Krötz §5), hence nuclearity of V_p^∞.
3. K-invariant Hermitian representative of each Sobolev class (Bernstein–Krötz Theorem 5.5).

*Uses.* AF.1/casselman-wallach-globalization: the globalization theorem is the statement that all G-continuous norms are Sobolev-equivalent. AutomorphicLFunctionsAndLocalFactors:AL.3: continuity estimates for archimedean Rankin–Selberg integrals in Sobolev norms.

*API.*

- `RealReductive.GContinuousNorm` (data): Norms p on V with V_p a Banach representation.
- `RealReductive.sobolevNorm` (constructor): The k-th Sobolev norm p_k.
- `RealReductive.SobolevLE` (relation): The preorder p ≺ q and the equivalence relation.
- `RealReductive.exists_gContinuousNorm` (other): Every Harish-Chandra module has a G-continuous norm.
- `RealReductive.smoothCompletion_nuclear` (structure): V_p^∞ is a nuclear Fréchet space.

*Unit tests.*

- `gContinuous_finiteDim` (degenerate): On a finite-dimensional module every norm is G-continuous and all are Sobolev-equivalent.
- `gContinuous_principalSeries` (computation): On I(e^ν) for SL_2(ℝ), ‖f‖ = ‖f|_K‖_{L²(K)} is G-continuous.
- `gContinuous_not_arbitrary` (non-example): Not every norm is G-continuous: on the K-finite vectors of I(e^ν) for SL_2(ℝ), written in the basis e^{2inθ}, the norm Σ_n n!·|a_n| does not extend to a Banach representation, since right translation by a noncompact element of SL_2(ℝ) is unbounded for it.

*Acceptance.* On I(W) the L²(K)-norm is G-continuous. The supremum norm on the K-finite vectors of I(W) and the L²(K) norm are Sobolev-equivalent.

*Prerequisites.* `AF.1/sf-representation`, `AF.1/casselman-embedding`.

*Sources.* bernstein-kroetz (§1, p. 2): “A norm p on a Harish-Chandra module V will be called G-continuous provided the completion Vp of the normed space (V, p) gives rise to a Banach-representation of G.” — Definition and Sobolev order. bernstein-kroetz (§1, p. 3): “implies that the smooth vectors Vp∞ form a nuclear Fréchet space.” — Nuclearity from polynomially bounded K-multiplicities.

### Theorem: Casselman–Wallach globalization theorem (planet: Casselman–Wallach globalization)

Node `AF.1/casselman-wallach-globalization`, declaration `TauCeti.RealReductive.casselmanWallach` in `TauCeti/RepresentationTheory/RealReductive/Globalization`.

For a real reductive group G with maximal compact K: (i) any two G-continuous norms on a Harish-Chandra module V are Sobolev-equivalent; (ii) consequently V has a unique SAF-globalization V^∞ (the smooth vectors of V_p for any G-continuous p), and V^∞ = π(S(G))V; (iii) the functor SAF → HC, E ↦ E_K, is an equivalence of categories, with quasi-inverse V ↦ V^∞; (iv) every (𝔤, K)-morphism V → W extends uniquely to a continuous G-map V^∞ → W^∞ with closed range, and V ↦ V^∞ is exact; (v) V is irreducible iff V^∞ is algebraically simple as an S(G)-module.

*Hypotheses.* G linear real reductive, K maximal compact; V a Harish-Chandra module.

*Proof outline.*

1. Bernstein–Krötz §7: V is 'good' iff its K-finite matrix coefficients satisfy lower bounds uniform in K-types (Theorem 7.1).
2. Minimal principal series are good: Dirac-type sequences and lower bounds for matrix coefficients (Theorem 12.3), with an explicit section S(G) → V^∞ depending holomorphically on the parameter (Theorems 8.1, 12.8).
3. Use the single real-owner Langlands and discrete-series reduction, then goodness under the required extensions, induction and finite-dimensional tensor operations (§9). Casselman embedding and its dual quotient are inputs, not by themselves a substitute for that reduction. The original classification proof interiors remain recorded gaps.
4. (iii)-(v) follow formally from uniqueness of globalizations and exactness (closed range by the open mapping theorem).

*Acceptance.* For SL_2(ℝ), the smooth vectors of the Hilbert space of the discrete series D_k equal the closure of D_k in I^∞(W) for its Casselman embedding. Exactness: the SL_2(ℝ) sequence 0 → D_2^+ ⊕ D_2^- → I(e^{2ρ}) → ℂ → 0 globalizes to an exact sequence of SAF-representations.

*Prerequisites.* `AutomorphicFormsOnReductiveGroups:AF.1/g-continuous-norms`; `AutomorphicFormsOnReductiveGroups:AF.1/principal-series`; `AutomorphicFormsOnReductiveGroups:AF.1/casselman-embedding`; `AutomorphicFormsOnReductiveGroups:AF.1/sf-representation`; `AutomorphicFormsOnReductiveGroups:AF.0/adelic-schwartz-space`; `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`; `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`.

*Sources.* bernstein-kroetz (§1, Theorem 1.1, p. 3): “Theorem 1.1. Any two G-continuous norms on a Harish-Chandra module V are Sobolev-equivalent.” — The globalization theorem in the form proved. bernstein-kroetz (§1, p. 2): “The Casselman-Wallach globalization theorem ([5], [16] and [18], Sect. 11) essentially asserts that F is an equivalence of categories.” — Equivalence SAF ≃ HC and V^∞ = π(S(G))V.

### Theorem: Dixmier–Malliavin factorization

Node `AF.1/dixmier-malliavin`, declaration `TauCeti.RealReductive.dixmierMalliavin` in `TauCeti/RepresentationTheory/RealReductive/Globalization`.

(i) Every smooth vector of a smooth Fréchet representation (π, E) of a real Lie group G is a finite sum Σ π(f_i)v_i with f_i ∈ C_c^∞(G), v_i ∈ E; in particular C_c^∞(G) = C_c^∞(G) * C_c^∞(G). (ii) Adelic form: for an SF- or SLF-representation E of G(𝔸) (strict inductive limit over compact open J ⊆ G(𝔸_f) of SF-representations of G(F_∞)), E^∞ = S(G(𝔸))·E and S(G(𝔸)) = S(G(𝔸)) * C_c^∞(G(𝔸)).

*Hypotheses.* G a real Lie group (for (ii), G(𝔸) for G reductive over a number field).

*Proof outline.*

1. (i) Dixmier–Malliavin 1978: write the Dirac distribution at 1 as Σ f_i * D_i with D_i in a suitable finite-order distribution algebra, using a factorization of rapidly decreasing sequences; this packet records the statement with the original proof route (Bull. Sci. Math. 102, 1978), which was not read: see the gap.
2. (ii) apply (i) at each level J and to the finite part, where e_J acts as an identity on J-invariants.

*Acceptance.* For G = ℝ acting on S(ℝ) by translation, every Schwartz function is a finite sum of convolutions f * g with f ∈ C_c^∞(ℝ). For a K-finite vector in an SAF representation one can take a single term π(f)v (from AF.1/casselman-wallach-globalization (ii)).

*Prerequisites.* `AF.1/sf-representation`, `AF.0/adelic-schwartz-space`, `AF.0/adelic-test-functions`.

*Sources.* bernstein-kroetz (§2, Remark 2.19, p. 12): “If (π, E) is a smooth Fréchet-representation, then Π(Cc∞ (G))E = E by Dixmier-Malliavin [6].” — Statement (i). bpcz22 (§2.5.3, arXiv p. 17): “A vector v ∈ H is smooth if it is invariant by a compact-open subgroup of G(Af ) and the function g∞ ∈ G(F∞ ) 7→ g∞ v ∈ H is C ∞ .” — Smooth vectors of G(𝔸)-representations for the adelic form (2.5.3.2). jiang-zhang20 (Appendix A, proof of Proposition A.1, arXiv p. 84): “Applying the same inductive argument in Sections 6 and 7 of [74] and the Dixmier-Marlliavin Lemma ([12])” — The lemma as used for local zeta integrals.

### Definition: Real reductive representation theory (proposed sub-layer AF.1b)

Node `AF.1/real-reductive-representation-theory`, declaration `TauCeti.RealReductive.IrrAdmissible` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

Parent node grouping the classification material of AF.1: tempered and (essentially) square-integrable representations, discrete series and their limits with Harish-Chandra parameters, the Langlands classification, the Weil groups W_ℝ and W_ℂ and Langlands' correspondence for GL_n(ℝ) and GL_n(ℂ), and Vogan's classification of the generic unitary dual of GL_n over ℝ and ℂ. It is proposed in `restructure` as the sub-layer AF.1b.

*Hypotheses.* (G, K) real reductive (AF.1/real-reductive-group).

*Proof outline.*

1. Group the nodes whose parent is this node; each is planned below with its own sources.

*Uses.* AutomorphicLFunctionsAndLocalFactors:AL.2: archimedean standard L-factors are defined through Langlands' correspondence for GL_n(ℝ), GL_n(ℂ). AutomorphicLFunctionsAndLocalFactors:AL.3: archimedean Rankin–Selberg factors. GL2AutomorphicRepresentationsAndTransfer:R16.2: explicit GL₂(ℝ), GL₂(ℂ) cases. EndoscopicTransferAndUnitaryTraceComparison:ET.1: discrete series and their parameters for pseudocoefficients.

*API.*

- `RealReductive.IrrAdmissible` (data): The set of isomorphism classes of irreducible Harish-Chandra modules of (G, K).
- `RealReductive.IrrAdmissible.infChar` (projection): The infinitesimal character map, with finite fibres (AF.1/harish-chandra-admissibility).
- `RealReductive.IrrAdmissible.dual` (structure): Contragredient as an involution of IrrAdmissible.
- `RealReductive.IrrAdmissible.twist` (functoriality): Twisting by characters of G/[G,G]: (π ⊗ χ).

*Unit tests.*

- `irr_compact` (degenerate): For G compact, IrrAdmissible = Ĝ, the finite-dimensional irreducibles.
- `irr_GL1R` (computation): For G = ℝ^×, IrrAdmissible = {|x|^s sgn(x)^ε : s ∈ ℂ, ε ∈ {0,1}} (Tau Ceti GlobalNumberFields Layer 10 classification of characters of ℝ^×).
- `irr_dual_not_conj` (non-example): For GL_n(ℝ), the contragredient of π is not its complex conjugate in general: |x|^s has dual |x|^{−s} and conjugate |x|^{s̄}.

*Acceptance.* Every node of the sub-layer has this node as parent and AF.1 as the realised stage.

*Prerequisites.* `AF.1/admissible-gk-module`, `AF.1/infinitesimal-character`.

*Sources.* langlands-notion (p. 1): “The irreducible representations of a reductive group over a local field can be obtained from the square-integrable representations of Levi factors of parabolic subgroups by induction and formation of subquotients [2], [4].” — The organising principle of the sub-layer.

### Definition: Tempered, square-integrable and essentially square-integrable representations

Node `AF.1/tempered-square-integrable`, declaration `TauCeti.RealReductive.IsTempered` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

A supplied irreducible admissible continuous representation π of a real reductive G (with split centre A_G) is square-integrable modulo the centre (discrete series) if it has a unitary central character and its K-finite matrix coefficients are in L²(G/A_G); essentially square-integrable if some twist by a character of G/[G,G] is; tempered if its matrix coefficients lie in L^{2+ε}(G/A_G) for all ε > 0; essentially tempered if a twist is tempered.

*Hypotheses.* (G, K) real reductive; Haar measure on G/A_G.

*Proof outline.*

1. Start with the supplied continuous representation and its continuous-dual matrix coefficients; the SF representation interface is independent of the Casselman–Wallach theorem. For the unitary classification use the given Hilbert realization and its smooth/K-finite vectors.
2. Define the integrability predicates on G/A_G with the unitary central-character convention.
3. The classification by unitary induction from discrete series and their nondegenerate limits, and the compatibility with the later canonical SAF realization, are separate proof/comparison obligations in the named gap. The definition alone proves neither.

*Uses.* AF.4/borel-wallach-tempered-range: the cohomology range applies to tempered cohomological representations. AF.1/archimedean-llc-gln: temperedness corresponds to bounded parameters. AF.4/mirkovic-tempered-coherent: tempered representations with nonzero coherent cohomology.

*API.*

- `RealReductive.IsSquareIntegrable` (data): Matrix coefficients in L²(G/A_G) with unitary central character.
- `RealReductive.IsTempered` (data): Matrix coefficients in L^{2+ε}(G/A_G) for every ε > 0.
- `RealReductive.IsEssentiallyTempered` (data): Some twist by a character of G/[G,G] is tempered.
- `RealReductive.IsSquareIntegrable.isTempered` (relation): Square-integrable implies tempered.
- `RealReductive.IsTempered.twist_unitary` (functoriality): Twisting by a unitary character preserves temperedness.

*Unit tests.*

- `tempered_SL2_ds` (computation): D_k (k ≥ 2) of SL_2(ℝ) is square-integrable.
- `tempered_trivial_not` (non-example): The trivial representation of SL_2(ℝ) is not tempered: its matrix coefficient 1 is not in L^{2+ε}.
- `tempered_compact` (degenerate): For G compact every irreducible representation is square-integrable.
- `tempered_GL1` (compatibility): For G = ℝ^×, a character is tempered iff it is unitary (|x|^{it} sgn^ε), essentially tempered always.

*Acceptance.* Discrete series of SL_2(ℝ) are square-integrable; unitary principal series are tempered but not square-integrable. The trivial representation of SL_2(ℝ) is not tempered.

*Prerequisites.* `AutomorphicFormsOnReductiveGroups:AF.1/real-reductive-representation-theory`; `AutomorphicFormsOnReductiveGroups:AF.1/sf-representation`.

*Sources.* kaletha16 (§5.1, arXiv p. 31): “The subsets rig rig rig Πunit (G), Πtemp (G) and Π2 (G) will then be those consisting of unitary, tem- pered, and essentially square-integrable representations.” — The three classes of irreducible admissible representations of real groups. gan-ichino18 (§1, arXiv p. 4): “θψ preserves the square-integrability and the temperedness of representations;” — Square-integrability and temperedness as properties of local representations.

**Supplied-realization convention.** Matrix coefficients are formed on the supplied smooth Fréchet moderate-growth realization, or the supplied unitary Hilbert realization used in the tempered/discrete-series classification. No existence of a globalization for an arbitrary Harish-Chandra module is presumed at this definition; comparison with its eventual canonical realization is a later globalization consequence.


### Theorem: Harish-Chandra's discrete series: existence criterion and parametrization (planet: Discrete series)

Node `AF.1/discrete-series`, declaration `TauCeti.RealReductive.discreteSeries` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

Let (G, K) be real reductive with G connected modulo its centre for simplicity of statement (the component group acting on parameters in general). (i) G has square-integrable (modulo centre) representations iff rank G = rank K, i.e. G has a compact Cartan subgroup T ⊆ K. (ii) Then, for each λ ∈ i𝔱^* regular with λ − ρ_G integral (λ ∈ X^*(T) + ρ), there is a discrete series π(λ, C) attached to the Weyl chamber C containing λ, with infinitesimal character χ_λ; π(λ, C) ≅ π(λ', C') iff (λ', C') = w(λ, C) for w ∈ W_K = N_K(T)/T, the Weyl group of K; the lowest K-type has highest weight λ + ρ_n − ρ_c (Blattner). (iii) For λ singular but C-dominant (non-degenerate: no simple compact root of C is orthogonal to λ), π(λ, C) is a non-degenerate limit of discrete series, tempered and nonzero. Example: the split classical groups over ℤ with discrete series are SO_{2n+1}, Sp_{2n} and SO_{4n} (and SO_{2n} with n odd has none).

*Hypotheses.* (G, K) real reductive; T ⊆ K a maximal torus of K which is a Cartan subgroup of G (case (ii)-(iii)).

*Proof outline.*

1. (i) Harish-Chandra's criterion; necessity via the character theory of discrete series, sufficiency via the construction in (ii); the Chenevier–Taïbi example is the computation of rank G(ℝ) vs rank K for split classical groups.
2. (ii) Parametrization by Harish-Chandra parameters; Blattner's formula for the lowest K-type; uniqueness modulo W_K.
3. (iii) Limits via Zuckerman's translation functors from the discrete series; non-degeneracy criterion of Knapp–Zuckerman.
4. The proofs are Harish-Chandra's (Acta Math. 1965-66) and Knapp–Zuckerman; this packet records the statements with their sources as cited by the papers below.

*Acceptance.* SL_2(ℝ): λ = (k−1)/2·α with k ≥ 2 gives D_k^± (two chambers); λ = 0 gives the two limits of discrete series D_1^±. SO_{2n}(ℝ)-split with n odd (e.g. SO(3,3)) has rank G = n > rank K = n−1, hence no discrete series.

*Prerequisites.* `AF.1/tempered-square-integrable`, `AF.1/infinitesimal-character`, `AF.1/real-reductive-group`, Tau Ceti RepresentationTheory/RootSystems (layer 4 chambers the fundamental domain and the longest element).

*Sources.* chenevier-taibi20 (§1.4, arXiv p. 8): “Assume that G(R) has discrete series, i.e. that G is not isomorphic to SO2n with n odd,” — The existence criterion specialised to split classical groups. cg20 (§5.3, proof of Theorem 5.5 (arXiv v1 p. 22; Duke p. 828)): “Hence, using the Harish-Chandra parameterization, we may write π∞ = π(λ, C)∗ = π(−w0 (λ), −w0 (C))” — Harish-Chandra's parametrization π(λ, C) used for GSp_4(ℝ); see AF.4/gsp4-discrete-series. pilloni20 (§5.1.6, p. 22): “and a Weyl chamber C positive for λ we have a (limit of) discrete series π(λ, C) (see [28], 3.3).” — (Limits of) discrete series π(λ, C) with λ possibly on a wall of C.

### Theorem: Langlands classification

Node `AF.1/langlands-classification`, declaration `TauCeti.RealReductive.langlandsClassification` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

Let (G, K) be real reductive. Every irreducible admissible (𝔤, K)-module is the unique irreducible quotient J(P, σ, ν) (Langlands quotient) of a standard module Ind_P^G(σ ⊗ e^{ν}) with P = MAN a cuspidal parabolic, σ an irreducible tempered representation of M and ν ∈ 𝔞^* in the open positive chamber for P; the triple (P, σ, ν) is unique up to K-conjugacy. Tempered representations are the constituents of Ind_P^G(σ) with σ (limits of) discrete series of M and ν unitary.

*Hypotheses.* (G, K) real reductive.

*Proof outline.*

1. Langlands' 1973 classification: existence of Langlands data through the leading exponents of matrix coefficients (Casselman's asymptotics, AF.1/casselman-embedding), uniqueness through the standard intertwining operator whose image is the Langlands quotient.
2. Tempered representations: Knapp–Zuckerman classification by (limits of) discrete series of Levi subgroups (AF.1/discrete-series).
3. The statement is recorded from its sources; the proof (Langlands, On the classification of irreducible representations of real algebraic groups, Math. Surveys Monogr. 31) was not read.

*Acceptance.* SL_2(ℝ): the trivial representation is the Langlands quotient J(P_min, triv, ρ). GL_2(ℝ): the finite-dimensional representation Sym^{k−2} ⊗ det^s is the Langlands quotient of the principal series whose subrepresentation is D_k ⊗ det^{s'}.

*Prerequisites.* `AF.1/principal-series`, `AF.1/tempered-square-integrable`, `AF.1/discrete-series`, `AF.1/casselman-embedding`.

*Sources.* langlands-notion (p. 1): “The irreducible representations of a reductive group over a local field can be obtained from the square-integrable representations of Levi factors of parabolic subgroups by induction and formation of subquotients [2], [4].” — The classification principle, with [4] Langlands' classification for real groups. gan-ichino18 (§1, arXiv p. 4): “θψ is compatible with the Langlands classification (modulo tempered representations);” — Use of the Langlands classification for real groups.

### Definition: The Weil groups W_ℝ and W_ℂ and their representations

Node `AF.1/weil-group-real`, declaration `TauCeti.RealReductive.WeilGroupReal` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

W_ℂ = ℂ^× and W_ℝ = ℂ^× ⊔ jℂ^× with j² = −1 ∈ ℂ^× and jzj⁻¹ = z̄, a non-split extension 1 → ℂ^× → W_ℝ → Gal(ℂ/ℝ) → 1; the norm map W_ℝ → ℝ^× (z ↦ |z|², j ↦ −1) is the abelianization. Every continuous semisimple finite-dimensional representation of W_ℂ is a sum of characters z ↦ z^p z̄^q (p, q ∈ ℂ, p − q ∈ ℤ); every irreducible representation of W_ℝ is either a character of ℝ^× pulled back by the norm (1-dimensional) or the 2-dimensional induced representation Ind_{W_ℂ}^{W_ℝ}(z^p z̄^q) with p − q ∈ ℤ ∖ {0} (and Ind(z^p z̄^q) ≅ Ind(z^q z̄^p)). A representation is tempered (bounded) if its image is relatively compact.

*Proof outline.*

1. Construct W_ℝ as the subgroup ℂ^× ∪ jℂ^× of ℍ^× (Hamilton quaternions); continuity and topology from ℍ.
2. Characters of ℂ^× from Tau Ceti GlobalNumberFields Layer 10 classification ((z/|z|)^k|z|^s).
3. Irreducibles of W_ℝ: Clifford theory for the index-2 subgroup ℂ^×: a character χ of ℂ^× either extends (χ = χ∘conj, giving two extensions) or induces irreducibly.
4. Abelianization: [W_ℝ, W_ℝ] = S¹ ⊆ ℂ^×, giving W_ℝ^{ab} ≅ ℝ^×.

*Uses.* AF.1/archimedean-llc-gln: the parameter side of Langlands' correspondence. AutomorphicLFunctionsAndLocalFactors:AL.1: archimedean L- and ε-factors of W_ℝ-representations (Tate's normalisation, Chenevier–Taïbi route) are AL.1's. AF.4/c-l-algebraic: algebraicity conditions are read off the restriction of parameters to ℂ^×.

*API.*

- `RealReductive.WeilGroupReal` (data): W_ℝ as a topological group with the inclusion ℂ^× → W_ℝ and j.
- `RealReductive.WeilGroupReal.norm` (projection): The abelianization W_ℝ → ℝ^×, z ↦ z z̄, j ↦ −1.
- `RealReductive.WeilGroupReal.irreducible_classification` (characterisation): Irreducible continuous representations are 1-dimensional characters of ℝ^× via the norm, or Ind(z^p z̄^q) with p − q ∈ ℤ \ {0}.
- `RealReductive.WeilGroupReal.restrict_complex` (functoriality): Restriction to W_ℂ = ℂ^× of a representation; semisimplicity.
- `RealReductive.WeilGroupReal.IsTempered` (data): Bounded image.

*Unit tests.*

- `weilReal_j_sq` (computation): j² = −1 ∈ ℂ^× ⊆ W_ℝ and j z j⁻¹ = z̄.
- `weilReal_ab` (characterisation): The abelianization of W_ℝ is ℝ^× via the norm map.
- `weilComplex_irreducible_dim_one` (degenerate): Every irreducible continuous representation of W_ℂ is 1-dimensional.
- `weilReal_not_split` (non-example): W_ℝ is not the semidirect product ℂ^× ⋊ ℤ/2: j has order 4.
- `weilReal_character_compat` (compatibility): Characters of W_ℝ correspond to the continuous characters |x|^s sgn^ε of ℝ^× of Tau Ceti GlobalNumberFields Layer 10.

*Acceptance.* The induced representation Ind(z^{k−1}·|z|^{1−k}) is the 2-dimensional parameter of the weight-k discrete series of GL_2(ℝ). Every irreducible representation of W_ℂ = ℂ^× is one-dimensional; every irreducible symplectic representation of W_ℝ is two-dimensional (Gan–Ichino §6.2).

*Prerequisites.* `AF.1/real-reductive-representation-theory`, Tau Ceti GlobalNumberFields (layer 10 archimedean characters infinity types and cyclotomic arithmetic), `mathlib:Representation`.

*Sources.* chenevier-taibi20 (§2.1, arXiv p. 13): “WR = C× jC× , where j 2 × −1 × is the element −1 of C and with jzj = z for all z ∈ C .” — Definition of W_ℝ (the PDF text drops the ⊔ and the overline on z). gan-ichino18 (§6.1, arXiv p. 22): “since any irreducible representation of LC is 1-dimensional and hence non-symplectic.” — Irreducible representations of W_ℂ = L_ℂ are 1-dimensional.

### Theorem: Langlands' correspondence for GL_n(ℝ) and GL_n(ℂ) (planet: Archimedean local Langlands for GL_n)

Node `AF.1/archimedean-llc-gln`, declaration `TauCeti.RealReductive.recGL` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

For F = ℝ or ℂ there is a natural bijection rec_F : π ↦ L(π) between isomorphism classes of irreducible admissible Harish-Chandra modules of GL_n(F) and n-dimensional continuous semisimple representations of W_F, such that: (i) n = 1 is the classification of characters of F^× (via W_F^{ab} ≅ F^×); (ii) det ∘ L(π) corresponds to the central character; (iii) L(π ⊗ χ∘det) = L(π) ⊗ L(χ), L(π^∨) = L(π)^∨; (iv) π is essentially square-integrable iff L(π) is irreducible (so only n ≤ 2 for ℝ and n = 1 for ℂ), π is tempered iff L(π) has bounded image; (v) the infinitesimal character of π is read off from the restriction of L(π) to ℂ^×: if L(π)|_{ℂ^×} = ⊕_{i=1}^n z^{p_i} z̄^{q_i}, then for F = ℝ the infinitesimal character of π is χ_{(p_1, …, p_n)} (the q_i are a permutation of the p_i), and for F = ℂ, on 𝔤_ℂ = 𝔤𝔩_n(ℂ) × 𝔤𝔩_n(ℂ), it is (χ_{(p_i)}, χ_{(q_i)}); (vi) the weight-k discrete series D_k ⊗ |det|^s of GL_2(ℝ) (k ≥ 2) corresponds to Ind_{W_ℂ}^{W_ℝ}((z/|z|)^{k−1}|z|^{2s}). The compatibility with Godement–Jacquet L- and ε-factors is AutomorphicLFunctionsAndLocalFactors AL.2's statement.

*Hypotheses.* F ∈ {ℝ, ℂ}.

*Proof outline.*

1. Langlands classification for GL_n(F) (AF.1/langlands-classification): every irreducible is a Langlands quotient of an induced representation from GL_1's and (for ℝ) GL_2 discrete series.
2. Map the Langlands data to the direct sum of the parameters of the inducing data (characters of F^× and, for ℝ, Ind(z^p z̄^q) for D_k ⊗ |det|^s).
3. Bijectivity: uniqueness of Langlands data and of the decomposition of semisimple W_F-representations into irreducibles.
4. Properties (ii)-(v) are checked on inducing data; (vi) is the n = 2 discrete-series case.
5. Knapp, Local Langlands correspondence: the archimedean case, §§3–4, Theorems 2 and 5 (pp.403,406), gives the explicit real and complex parameter constructions and bijections. These passages have been read; the original Langlands classification and discrete-series proof interiors remain recorded gaps.

*Acceptance.* n = 1: rec_ℝ(|x|^s sgn(x)^ε) is the character of W_ℝ through the norm. The trivial representation of GL_2(ℝ) corresponds to |·|^{1/2} ⊕ |·|^{−1/2} (via the norm), not to an irreducible parameter. GL_n(ℂ): every parameter is a sum of characters, so the only essentially square-integrable representations are the characters of GL_1(ℂ).

*Prerequisites.* `AF.1/langlands-classification`, `AF.1/weil-group-real`, `AF.1/discrete-series`, `AF.1/gl2-real-discrete-series`, Tau Ceti GlobalNumberFields (layer 10 archimedean characters infinity types and cyclotomic arithmetic).

*Sources.* chenevier-taibi20 (§2.1, arXiv p. 13): “The Langlands correspondence for GLn (R) is a natural bijection V 7→ L(V ) between the set of isomorphism classes of irreducible admissible Harish-Chandra modules for GLn (R), and the set of isomorphism classes of n-dimensional (complex, continuous and semi- simple) representations of WR [Kna94].” — The bijection as stated. gan-ichino18 (§6.1, arXiv p. 22): “since any irreducible representation of LC is 1-dimensional and hence non-symplectic.” — The case F = ℂ: essentially square-integrable representations of GL_n(ℂ) exist only for n = 1.

### Construction: The (𝔤𝔩_2, O(2))-modules D_k of GL_2(ℝ)

Node `AF.1/gl2-real-discrete-series`, declaration `TauCeti.RealReductive.GL2.discreteSeries` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

For k ≥ 1 and μ ∈ ℂ, D_k(μ) is the (𝔤𝔩_2, O(2))-module with basis v_ℓ (|ℓ| ≥ k, ℓ ≡ k mod 2), rotation r_θ acting by e^{iℓθ}, diag(1,−1) exchanging v_ℓ and v_{−ℓ}, X v_ℓ = ½(k+ℓ)v_{ℓ+2}, Y v_ℓ = ½(k−ℓ)v_{ℓ−2} (so Y v_k = 0 and X v_{−k} = 0), the centre element Z = 1_2 acting by μ and the Casimir Δ = ¼(H² + 2XY + 2YX) acting by k(k−2)/4. D_k(μ) is irreducible admissible; for k ≥ 2 it is the discrete series of weight k (essentially square-integrable), for k = 1 the limit of discrete series. Every irreducible admissible (𝔤𝔩_2, O(2))-module is finite-dimensional, a principal series, or some D_k(μ).

*Hypotheses.* k ≥ 1, μ ∈ ℂ.

*Proof outline.*

1. Check the relations [H, X] = 2X, [H, Y] = −2Y, [X, Y] = H on the basis, and compatibility of the O(2)-action (condition (2) of AF.1a/gk-module).
2. Irreducibility: any nonzero submodule contains some v_ℓ and the raising/lowering coefficients ½(k ± ℓ) are nonzero for |ℓ| > k.
3. Casimir value from Y v_k = 0: Δ v_k = ¼(k² − 2k)v_k = k(k−2)/4 v_k.
4. Classification of irreducibles of (𝔤𝔩_2, O(2)) by K-types and the Casimir eigenvalue (Getz–Hahn §6.5).

*Uses.* AF.5/gl2-dictionary: holomorphic cusp forms of weight k generate D_k at infinity. AF.1/archimedean-llc-gln: parameter (vi) of the correspondence. GL2AutomorphicRepresentationsAndTransfer:R16.6: 'holomorphic representations' of weight k are those with π_∞ ≅ D_k. AutomorphicLFunctionsAndLocalFactors:AL.2: L(s, D_k) = Γ_ℂ(s + (k−1)/2) (with the unitary normalisation).

*API.*

- `RealReductive.GL2.discreteSeries` (constructor): D_k(μ) as a (𝔤𝔩_2, O(2))-module.
- `RealReductive.GL2.discreteSeries_casimir` (simp): Δ acts on D_k(μ) by k(k−2)/4.
- `RealReductive.GL2.discreteSeries_ktypes` (characterisation): The SO(2)-types of D_k(μ) are e^{iℓθ}, |ℓ| ≥ k, ℓ ≡ k mod 2, each with multiplicity one.
- `RealReductive.GL2.discreteSeries_irreducible` (structure): D_k(μ) is irreducible and admissible.
- `RealReductive.GL2.classification` (characterisation): Every irreducible admissible (𝔤𝔩_2, O(2))-module is finite-dimensional, an irreducible principal series, or D_k(μ).

*Unit tests.*

- `gl2DS_casimir_k2` (computation): On D_2(μ), Δ = 0.
- `gl2DS_casimir_k12` (computation): On D_12(μ) (Ramanujan Δ's archimedean type), Δ = 12·10/4 = 30.
- `gl2DS_lowest` (degenerate): Y v_k = 0 and X v_{−k} = 0: v_{±k} span the minimal K-type.
- `gl2DS_not_k2_minus_1` (non-example): The value (k² − 1)/4 is not the Casimir eigenvalue on D_k (for k = 2 it would be 3/4 ≠ 0); see sourceIssues E1.

*Acceptance.* D_2(0) has the infinitesimal character of the trivial representation: Δ = 0. D_k(μ) with k ≥ 2 embeds in the principal series whose Langlands quotient is Sym^{k−2} twisted.

*Prerequisites.* `AF.1/real-reductive-representation-theory`, `AF.1a/gk-module`, `AF.1/infinitesimal-character`.

*Sources.* getz-hahn (§6.5, p. 34): “If k ≥ 2 then these modules are known as the discrete series of weight k and when k = 1 they are known as the limit of discrete series.” — Definition of π_k with the displayed action (1)-(6), including Δv_ℓ = k(k−2)/4 v_ℓ.

### Theorem: Vogan's generic unitary dual of GL_n(ℝ) and GL_n(ℂ)

Node `AF.1/vogan-generic-unitary-dual`, declaration `TauCeti.RealReductive.voganGenericUnitary` in `TauCeti/RepresentationTheory/RealReductive/Langlands`.

For F = ℝ or ℂ, every irreducible generic unitary representation of GL_m(F) is isomorphic to an irreducible unitarily induced representation Ind_P^{GL_m}(τ_1|det|^{β_1} ⊗ … ⊗ τ_t|det|^{β_t} ⊗ σ_0 ⊗ τ_t|det|^{−β_t} ⊗ … ⊗ τ_1|det|^{−β_1}) with 1/2 > β_1 > … > β_t > 0 and τ_i, σ_0 irreducible unitary generic tempered; conversely such inductions are irreducible, generic and unitary.

*Hypotheses.* F ∈ {ℝ, ℂ}.

*Proof outline.*

1. Vogan, The unitary dual of GL(n) over an archimedean field (Invent. Math. 83, 1986), specialised to generic representations; statement as used by Jiang–Zhang Appendix B.
2. Genericity and irreducibility of the inductions via the Langlands classification and the archimedean correspondence.

*Acceptance.* n = 1: generic unitary = unitary characters. GL_2(ℝ): the complementary series Ind(|·|^β ⊗ |·|^{−β}) with 0 < β < 1/2 are generic unitary; β = 1/2 gives the reducible induction containing the trivial representation.

*Prerequisites.* `AF.1/archimedean-llc-gln`, `AF.1/tempered-square-integrable`, `AF.1/langlands-classification`.

*Sources.* jiang-zhang20 (Appendix B, proof of Theorem B.2, arXiv p. 86): “given by Vogan in [80] for the archimedean case and by Tadic in [79] for the non-archimedean case” — The generic unitary dual (B.5) with 1/2 > β_1 > … > β_t > 0.

**Coverage of AF.1.** Status: planned. Refinements for the next pass:

- The classification sub-layer (proposed AF.1b) rests on unread proof sources: Langlands classification, Harish-Chandra's discrete series, Knapp's archimedean correspondence, Vogan's unitary dual, Dixmier–Malliavin (gaps). Decompose them at lemma level once read.
- Bernstein–Krötz §§5-12 at lemma level: polynomial K-type bounds, Theorem 5.5, Theorem 7.1 (goodness criterion), Theorems 8.1/12.3/12.8 for minimal principal series, §9 stability of goodness.

## AF.2. Automorphic spaces and representations

This layer defines automorphic forms in the sense of Borel and Jacquet (left G(F)-invariant, smooth, right K_∞-finite, Z(𝔤)-finite, of moderate growth), their smooth Fréchet version (Z(𝔤)-finite functions of uniform moderate growth), the (𝔤, K_∞) × G(𝔸_f)-module A(G), Harish-Chandra's finiteness theorem, the bijection with classical automorphic forms on finitely many arithmetic quotients, automorphic representations with finite (not necessarily one) multiplicities, restricted tensor products and Flath's factorization theorem. The almost-everywhere one-dimensionality of spherical vectors rests on the commutativity of spherical Hecke algebras from SmoothRepresentationsOfLocalGroups SR.4 (red-team finding RT-AREA-automorphic-1/26). It also records that automorphic representations need not be cuspidal or generic, and Wei Zhang's coefficient-valued holomorphic SL_2 forms.

**Dependencies.** Inside the roadmap: AF.0, AF.1, AF.1a. Other roadmaps and the libraries: `AdelicAlgebraicGroups:AA.1/integral-model-exists`; `AdelicAlgebraicGroups:AA.2/split-centre`; `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`; `AdelicAlgebraicGroups:AA.3/component-decomposition`; `AdelicAlgebraicGroups:AA.3/height-representation-comparison`; `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.1`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.4`; `mathlib:RestrictedProduct`; Tau Ceti GlobalNumberFields (layer 5 full adeles and the additive quotient).

### Definition: Automorphic forms (planet: Automorphic form)

Node `AF.2/automorphic-form`, declaration `TauCeti.Automorphic.AutomorphicForm` in `TauCeti/Automorphic/AutomorphicForm`.

Let G be connected reductive over a number field F, K_∞ ⊆ G(F_∞) a maximal compact subgroup (AF.1/real-reductive-group) and Z(𝔤) the centre of U(𝔤_∞,ℂ). An automorphic form on G is a function φ : G(𝔸) → ℂ such that (1) φ(γg) = φ(g) for γ ∈ G(F); (2) φ is smooth (AF.0/smooth-adelic-function), in particular right invariant under a compact open subgroup of G(𝔸_f); (3) φ is right K_∞-finite; (4) φ is Z(𝔤)-finite: annihilated by an ideal J ⊆ Z(𝔤) of finite codimension; (5) φ has moderate growth (AF.0/moderate-growth). A(G) denotes the space of automorphic forms; for a character ω of A_G (split component of the centre) or a unitary character χ of Z_G(F)\Z_G(𝔸), A(G)_χ is the subspace with φ(zg) = χ(z)φ(g). A(G, J_f, ξ, J) is the subspace fixed by J_f ⊆ G(𝔸_f), of K_∞-type set ξ and killed by J. Automorphic forms are not assumed square-integrable, cuspidal, generic or of multiplicity one.

*Hypotheses.* G connected reductive over a number field F; K_∞ maximal compact in G(F_∞).

*Proof outline.*

1. Intersect the five conditions as subspaces of functions on G(F)\G(𝔸).
2. Stability under right translation by G(𝔸_f), under U(𝔤) and K_∞ (AF.0/growth-translation-differentiation; Z(𝔤) is central and commutes with R(g_∞) for g_∞ ∈ G(F_∞)°; finitely many K_∞-translates of J are needed for disconnected G(F_∞)).
3. Record the variants with central character and the fixed-type subspaces.

*Uses.* AF.3/cusp-form: cusp forms are automorphic forms with vanishing constant terms. AF.4/cohomological-representation: cohomological automorphic representations are generated by automorphic forms. AutomorphicSpectralTheory:AS.1: Eisenstein series are automorphic forms. GL2AutomorphicRepresentationsAndTransfer:R16.1: the GL₂ specialisation of the space of automorphic forms. MetaplecticAutomorphicForms:MP.5: genuine automorphic forms on covers follow the same definition.

*API.*

- `Automorphic.AutomorphicForm` (data): The ℂ-subspace A(G) of functions G(𝔸) → ℂ satisfying (1)-(5).
- `Automorphic.AutomorphicForm.leftInvariant` (projection): φ(γg) = φ(g) for γ ∈ G(F).
- `Automorphic.AutomorphicForm.exists_level` (projection): Each φ is right invariant under some compact open J_f.
- `Automorphic.AutomorphicForm.exists_ideal` (projection): Each φ is killed by an ideal of finite codimension of Z(𝔤).
- `Automorphic.AutomorphicForm.withCentralChar` (constructor): The subspace A(G)_χ for a character χ of Z_G(F)\Z_G(𝔸).
- `Automorphic.AutomorphicForm.fixedType` (constructor): The subspace A(G, J_f, ξ, J).
- `Automorphic.AutomorphicForm.toUniformModerateGrowth` (compatibility): A(G) ⊆ T([G]) (AF.2/automorphic-forms-uniform-growth).

*Unit tests.*

- `automorphicForm_const` (degenerate): The constant function 1 is an automorphic form, killed by the augmentation ideal of Z(𝔤).
- `automorphicForm_gl1_character` (computation): For a Hecke character χ of GL_1/ℚ, χ ∈ A(GL_1) and the Casimir-free ideal is generated by (d/dt − s) where χ = |·|^s on ℝ_{>0}.
- `automorphicForm_log_not_eigen` (characterisation): For GL_1/ℚ, g ↦ log|g| is an automorphic form (killed by (d/dt)²) but is not an eigenfunction: Z(𝔤)-finiteness is weaker than having an infinitesimal character.
- `automorphicForm_not_K_finite` (non-example): For φ_Δ (weight 12) and the right translate R(g_∞)φ_Δ by a noncompact g_∞ ∈ GL_2(ℝ)^+, the translate is a smooth automorphic form whose SO(2)-types are infinite in number: it is not K_∞-finite, hence not an automorphic form in the Borel–Jacquet sense.
- `automorphicForm_classical_compat` (compatibility): For G = SL_2/ℚ, φ ∈ A(G)^{SL_2(\hat ℤ)} of K-type e^{ikθ} with J = (Δ − k(k−2)/4) and holomorphy correspond to M_k(SL_2(ℤ)) via AF.5/gl2-dictionary.

*Acceptance.* Constant functions are automorphic forms that are not cuspidal (for G with a proper rational parabolic). For GL_1/ℚ, the automorphic forms are the finite linear combinations of Hecke characters times polynomials in log|g| (Z(𝔤)-finiteness allows generalized eigenfunctions). The function φ_f attached to a weight-k cusp form f (AF.5/gl2-dictionary) is an automorphic form for GL_2/ℚ.

*Prerequisites.* `AF.0/smooth-adelic-function`, `AF.0/moderate-growth`, `AF.1/k-finite-vectors`, `AF.1/infinitesimal-character`, `AF.1/real-reductive-group`, `AdelicAlgebraicGroups:AA.2/split-centre`.

*Sources.* getz-hahn (§6.3, Definition 6.12, p. 31): “An automorphic form on G(AF ) is a function φ : G(AF ) → C such that” — Conditions (1)-(5) of the definition (Getz–Hahn also imposes A_G-invariance; we keep A_G-invariance as the variant with central character). bpcz22 (§2.7.1, arXiv p. 23): “The space AP (G) of automorphic forms on [G]P is defined as the subspace of Z(g∞ )-finite functions in T ([G]P ).” — The smooth (Fréchet) variant without K_∞-finiteness; see AF.2/smooth-automorphic-forms.

### Theorem: Automorphic forms have uniform moderate growth

Node `AF.2/automorphic-forms-uniform-growth`, declaration `TauCeti.Automorphic.AutomorphicForm.mem_uniformModerateGrowth` in `TauCeti/Automorphic/AutomorphicForm`.

Every automorphic form φ ∈ A(G) lies in T([G]): there is N with |R(X)φ(g)| ≪_X ‖g‖^N for all X ∈ U(𝔤_∞). More precisely (Harish-Chandra), there is α ∈ C_c^∞(G(F_∞)), which may be taken K_∞-conjugation invariant and supported in any neighbourhood of 1, with φ = R(α)φ = φ * α̌; then AF.0/convolution-to-uniform-growth gives the uniform bound with the moderate-growth exponent of φ.

*Hypotheses.* φ an automorphic form.

*Proof outline.*

1. The (𝔤, K_∞)-module generated by φ is finitely generated and Z(𝔤)-finite, hence admissible (AF.1/harish-chandra-admissibility).
2. Harish-Chandra's lemma: for a K_∞-finite, Z(𝔤)-finite smooth function on G(F_∞), there is α ∈ C_c^∞(G(F_∞)) with φ * α = φ (the convolution operator by a suitable approximate identity is invertible on the finite-dimensional space of K-types and generalized Z(𝔤)-eigencomponents involved).
3. Apply AF.0/convolution-to-uniform-growth to φ = R(α)φ.

*Acceptance.* For the constant function 1 one may take α ≥ 0 with ∫α = 1. The statement fails for smooth K-finite functions that are not Z(𝔤)-finite: a moderate-growth function on GL_1(ℚ)\GL_1(𝔸) with rapidly oscillating archimedean part has unbounded derivatives.

*Prerequisites.* `AF.2/automorphic-form`, `AF.0/convolution-to-uniform-growth`, `AF.1/harish-chandra-admissibility`.

*Sources.* bpcz22 (§2.7.1, arXiv p. 23): “The space AP (G) of automorphic forms on [G]P is defined as the subspace of Z(g∞ )-finite functions in T ([G]P ).” — The modern definition presupposes uniform moderate growth; the theorem identifies its K_∞-finite vectors with A(G). getz-hahn (§6.2, Theorem 6.10, p. 31): “The space A(Γ, J) is an admissible (g, K∞ )-module and hence A(Γ, ξ, J) is finite dimensional for each ξ” — Admissibility input [HC68].

### Construction: Smooth automorphic forms and their K_∞-finite vectors

Node `AF.2/smooth-automorphic-forms`, declaration `TauCeti.Automorphic.SmoothAutomorphicForm` in `TauCeti/Automorphic/AutomorphicForm`.

A^∞(G) is the subspace of Z(𝔤)-finite functions in T([G]) (smooth automorphic forms), with the LF topology induced from T([G]); it is a smooth representation of G(𝔸) (an SLF-representation level by level). Its K_∞-finite vectors are exactly A(G): A^∞(G)_{K_∞} = A(G). For fixed J_f and ideal J, A^∞(G)^{J_f}_J is an SAF-representation of G(F_∞) of finite length whose Harish-Chandra module is A(G, J_f, ·, J), so the two categories are linked by the Casselman–Wallach globalization.

*Hypotheses.* G connected reductive over F.

*Proof outline.*

1. A^∞(G) is closed in each T_N([G])^{J_f} after fixing J (kernel of continuous operators R(z), z ∈ J).
2. K_∞-finite vectors of A^∞(G) satisfy (1)-(5) of AF.2/automorphic-form; conversely A(G) ⊆ T([G]) by AF.2/automorphic-forms-uniform-growth.
3. A^∞(G)^{J_f}_J is admissible with Harish-Chandra module A(G, J_f, ·, J) (AF.2/harish-chandra-finiteness); identify it with the globalization (AF.1/casselman-wallach-globalization).

*Uses.* AF.2/automorphic-representation: smooth automorphic representations are irreducible subquotients of A^∞(G). AutomorphicLFunctionsAndLocalFactors:AL.3: global Rankin–Selberg integrals of smooth cusp forms. AutomorphicSpectralTheory:AS.5: relative Lie algebra cohomology of A(G) versus all smooth functions of uniform moderate growth.

*API.*

- `Automorphic.SmoothAutomorphicForm` (data): A^∞(G) ⊆ T([G]) with its topology.
- `Automorphic.SmoothAutomorphicForm.kFinite_eq` (characterisation): A^∞(G)_{K_∞} = A(G).
- `Automorphic.SmoothAutomorphicForm.globalization` (equivalence): A^∞(G)^{J_f}_J is the Casselman–Wallach globalization of A(G, J_f, ·, J).
- `Automorphic.SmoothAutomorphicForm.rightTranslate` (functoriality): Right translation by G(𝔸) acts continuously.

*Unit tests.*

- `smoothAutomorphic_const` (degenerate): 1 ∈ A^∞(G) and is K_∞-finite.
- `smoothAutomorphic_kfinite_compat` (compatibility): The K_∞-finite vectors of A^∞(GL_1) are the finite sums of Hecke characters times polynomials in log|·|.
- `smoothAutomorphic_not_kfinite` (non-example): A^∞(GL_2) contains non-K_∞-finite vectors (convergent sums over K-types), which are not in A(GL_2).

*Acceptance.* For G compact at infinity, A^∞(G) = A(G). For GL_2/ℚ, the smooth vectors of the representation generated by a cusp form of weight k are the Casselman–Wallach globalization of D_k ⊗ (finite part).

*Prerequisites.* `AF.2/automorphic-form`, `AF.2/automorphic-forms-uniform-growth`, `AF.0/uniform-moderate-growth-space`, `AF.1/casselman-wallach-globalization`.

*Sources.* bpcz22 (§2.7.1, arXiv p. 23): “The space AP (G) of automorphic forms on [G]P is defined as the subspace of Z(g∞ )-finite functions in T ([G]P ).” — Definition of smooth automorphic forms (BPCZ's A_P(G)).

### Theorem: Harish-Chandra's finiteness theorem for automorphic forms (planet: Harish-Chandra finiteness theorem)

Node `AF.2/harish-chandra-finiteness`, declaration `TauCeti.Automorphic.AutomorphicForm.finiteDimensional_fixedType` in `TauCeti/Automorphic/AutomorphicForm`.

For a compact open J_f ⊆ G(𝔸_f), a finite set ξ of K_∞-types and an ideal J ⊆ Z(𝔤) of finite codimension, the space A(G, J_f, ξ, J) of automorphic forms that are J_f-invariant, of K_∞-types in ξ and killed by J is finite-dimensional. Equivalently, A(G)^{J_f}_J is an admissible (𝔤, K_∞)-module; for G with A_G-invariance or a fixed central character the same holds without the hypothesis that J contains the centre's directions.

*Hypotheses.* J ⊆ Z(𝔤) of finite codimension; J_f compact open; ξ finite.

*Proof outline.*

1. Reduce to finitely many arithmetic quotients: G(𝔸) = ⊔_i G(F)t_iG(F_∞)J_f (AdelicAlgebraicGroups:AA.3/component-decomposition) and the bijection (6.3.1) A(ξ_∞ ⊗ ξ_{J_f}, J) ≅ ⊕_i A(Γ_i, ξ_∞, J) (AF.2/adelic-classical-bijection).
2. Harish-Chandra's theorem for Γ\G(F_∞): A(Γ, ξ, J) is finite-dimensional, via the representation φ = φ * α (AF.2/automorphic-forms-uniform-growth), reduction theory on Siegel sets (AdelicAlgebraicGroups AA.3) and the decay of φ − φ_P on Siegel sets.
3. Source pins: Getz–Hahn Theorem 6.10 citing [HC68]; Harish-Chandra's proof is recorded with the gap on HC68.

*Acceptance.* For GL_2/ℚ, J_f = K_0(N), ξ = {weight k} and J = ⟨Δ − k(k−2)/4, Z⟩, the space contains the image of S_k(Γ_0(N)) (finite-dimensional, Mathlib/Tau Ceti dimension results) and of the weight-k holomorphic Eisenstein series. Without fixing J the space is infinite-dimensional (Maass forms for all Laplace eigenvalues).

*Prerequisites.* `AF.2/automorphic-form`, `AF.2/adelic-classical-bijection`, `AF.2/automorphic-forms-uniform-growth`, `AdelicAlgebraicGroups:AA.3/component-decomposition`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, `AF.1/harish-chandra-admissibility`.

*Sources.* getz-hahn (§6.2, Theorem 6.10, p. 31): “The space A(Γ, J) is an admissible (g, K∞ )-module and hence A(Γ, ξ, J) is finite dimensional for each ξ” — Theorem 6.10, citing Harish-Chandra [HC68].

### Theorem: Adelic and classical automorphic forms

Node `AF.2/adelic-classical-bijection`, declaration `TauCeti.Automorphic.AutomorphicForm.classicalEquiv` in `TauCeti/Automorphic/AutomorphicForm`.

Let J_f ⊆ G(𝔸_f) be compact open and G(𝔸) = ⊔_{i=1}^h G(F) t_i G(F_∞) J_f with t_i ∈ G(𝔸_f) and Γ_i = G(F) ∩ t_i J_f t_i⁻¹ G(F_∞) (arithmetic subgroups of G(F_∞)). Then φ ↦ (x ↦ φ(x t_i))_i is a (𝔤, K_∞)-equivariant bijection between the J_f-invariant automorphic forms on G(𝔸) of type (ξ, J) and ⊕_i A(Γ_i, ξ, J), the classical automorphic forms on Γ_i\G(F_∞) (smooth, slowly increasing, K_∞-finite, Z(𝔤)-finite).

*Hypotheses.* Finiteness of the class set G(F)\G(𝔸_f)/J_f modulo the image of G(F_∞).

*Proof outline.*

1. Component decomposition from AdelicAlgebraicGroups:AA.3/component-decomposition.
2. Restriction to G(F_∞)t_i identifies J_f-invariant left G(F)-invariant functions with Γ_i-invariant functions on G(F_∞).
3. Moderate growth corresponds to slowly increasing (heights restricted to G(F_∞)t_i, AdelicAlgebraicGroups:AA.3/height-representation-comparison).

*Acceptance.* For GL_2/ℚ and J_f = K_0(N), h = 1 and Γ_1 = {γ ∈ GL_2(ℤ) : N | c} (strong approximation for SL_2 and det(K_0(N)) = \hat ℤ^×). For GL_1 over a number field with class number h_F > 1 and J_f = \hat O_F^×, there are h_F components.

*Prerequisites.* `AF.2/automorphic-form`, `AdelicAlgebraicGroups:AA.3/component-decomposition`, `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`, `AdelicAlgebraicGroups:AA.3/height-representation-comparison`.

*Sources.* getz-hahn (§6.3, (6.3.1), p. 31): “with notation as in (6.1.1).” — The bijection A(ξ_∞ ⊗ ξ_{K^∞}, J) ≅ ⊕_i A(Γ_i(K^∞), ξ_∞, J), φ ↦ (x_i ↦ φ(x_i t_i)).

### Construction: A(G) as a (𝔤, K_∞) × G(𝔸_f)-module

Node `AF.2/automorphic-forms-module`, declaration `TauCeti.Automorphic.AutomorphicForm.gkModule` in `TauCeti/Automorphic/AutomorphicForm`.

A(G) is a (𝔤, K_∞)-module under the derived right action of U(𝔤) and right translation by K_∞, and a smooth representation of G(𝔸_f) by right translation; the two actions commute. Equivalently A(G) is a nondegenerate module over the global Hecke algebra H = H_∞ ⊗ C_c^∞(G(𝔸_f)), H_∞ the algebra of K_∞-finite distributions on G(F_∞) supported on K_∞. Admissible (𝔤, K_∞) × G(𝔸_f)-modules are those whose (K_∞-type, J_f)-isotypic parts are finite-dimensional. The category of automorphic subquotients has as objects subquotients of A(G) (or of A(G)_χ) and (𝔤, K_∞) × G(𝔸_f)-maps.

*Hypotheses.* G connected reductive over F.

*Proof outline.*

1. Stability of A(G) under the actions (AF.2/automorphic-form steps).
2. The archimedean Hecke algebra H(G(F_∞), K_∞): K_∞-finite distributions supported on K_∞ act through the (𝔤, K_∞)-structure; the fundamental idempotents 1_σ = d(σ)/vol(K_∞)·conj(χ_σ)dk project to K-types (Getz–Hahn Definition 3.6).
3. Nondegeneracy: every φ is fixed by some e_{J_f} ⊗ 1_ξ.

*Uses.* AF.2/automorphic-representation: automorphic representations are irreducible subquotients of this module. AF.4/rationality-field: Aut(ℂ)-twists of admissible (𝔤, K_∞) × G(𝔸_f)-modules. AutomorphicSpectralTheory:AS.4: Hecke and central character compatibility of the spectral decomposition.

*API.*

- `Automorphic.AutomorphicForm.gkModule` (instance): The (𝔤, K_∞)-module structure on A(G).
- `Automorphic.AutomorphicForm.finiteAction` (instance): The smooth G(𝔸_f)-action, commuting with the (𝔤, K_∞)-action.
- `Automorphic.GlobalHeckeModule` (data): Nondegenerate modules over H = H_∞ ⊗ C_c^∞(G(𝔸_f)); admissibility.
- `Automorphic.AutomorphicSubquotient` (data): The category of subquotients of A(G) with (𝔤, K_∞) × G(𝔸_f)-maps.
- `Automorphic.AutomorphicForm.heckeAction_compat` (compatibility): The C_c^∞(G(𝔸_f))-action is the restriction of AF.0/finite-hecke-action to A(G).

*Unit tests.*

- `automorphicModule_trivial` (degenerate): ℂ·1 ⊆ A(G) is a submodule on which 𝔤 acts by 0 and G(𝔸_f) trivially.
- `automorphicModule_gl1` (computation): For GL_1/ℚ and a Hecke character χ, ℂχ is a one-dimensional submodule on which 𝔸_f^× acts by χ_f.
- `automorphicModule_not_G_infty` (non-example): A(G) is not stable under right translation by G(F_∞) when G(F_∞) is noncompact: translates of K_∞-finite vectors are not K_∞-finite in general (only A^∞(G) carries the G(F_∞)-action).

*Acceptance.* For G = GL_1/ℚ, A(G) = ⊕ over Hecke characters χ of the generalized eigenspaces, each a direct sum of (𝔤𝔩_1, O(1)) × 𝔸_f^×-modules. The finite Hecke operators of AF.0/finite-hecke-action preserve A(G)^{J_f}.

*Prerequisites.* `AF.2/automorphic-form`, `AF.0/finite-hecke-action`, `AF.1a/gk-module`, `AF.1/k-finite-vectors`.

*Sources.* getz-hahn (§3.4, p. 18): “In the number field case, the global Hecke algebra is H := H∞ ⊗ H∞ .” — The global Hecke algebra acting on automorphic forms. getz-hahn (§5.5, Definition 5.18, p. 27): “An automorphic representation of G(AF ) is an admissible (g, K∞ ) × G(A∞ F )module isomorphic to a subquotient of L2 (G(F )AG \G(AF )).” — The (𝔤, K_∞) × G(𝔸_f)-module structure.

### Definition: Automorphic representations (planet: Automorphic representation)

Node `AF.2/automorphic-representation`, declaration `TauCeti.Automorphic.AutomorphicRepresentation` in `TauCeti/Automorphic/AutomorphicForm`.

An automorphic representation of G(𝔸) is an irreducible admissible (𝔤, K_∞) × G(𝔸_f)-module isomorphic to a subquotient of A(G) (Borel–Jacquet). A smooth automorphic representation is a topologically irreducible subquotient of A^∞(G); its K_∞-finite vectors form an automorphic representation and, conversely, an automorphic representation determines its smooth version by Casselman–Wallach globalization at infinity. By Langlands' Proposition 2, π is automorphic iff it is a constituent of Ind_{P(𝔸)}^{G(𝔸)}σ for a parabolic P = MN and a cuspidal automorphic representation σ of M(𝔸). The multiplicity of an irreducible admissible π in A(G), m(π) = dim Hom(π, A(G)), is finite; it is not required to be 0 or 1.

*Hypotheses.* G connected reductive over F.

*Proof outline.*

1. Definition as irreducible subquotients; admissibility is automatic for subquotients of A(G) by AF.2/harish-chandra-finiteness.
2. Finite multiplicity: an embedding π → A(G) is determined by the image of the finite-dimensional space π^{J_f}(ξ), which lands in the finite-dimensional A(G, J_f, ξ, J_π).
3. Comparison with Getz–Hahn Definition 5.18 (subquotients of L²): for subrepresentations of the discrete spectrum the K-finite smooth vectors are automorphic forms (AF.3/cuspidal-spectrum-discrete in the cuspidal case; AutomorphicSpectralTheory AS.4 for the residual case).
4. Langlands' Proposition 2 (constituents of parabolic induction from cuspidal data) is recorded as a characterisation; its proof uses Eisenstein series and is AutomorphicSpectralTheory's (AS.1-AS.2).

*Uses.* AF.2/flath-factorization: automorphic representations factor as restricted tensor products. AF.3/cuspidal-automorphic-representation: the cuspidal ones. AF.4/cohomological-representation: cohomological automorphic representations. GL2AutomorphicRepresentationsAndTransfer:R16.4: multiplicity one for GL₂ is a theorem about this notion. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic automorphic representations of GL_n.

*API.*

- `Automorphic.AutomorphicRepresentation` (data): Isomorphism classes of irreducible admissible (𝔤, K_∞) × G(𝔸_f)-modules occurring as subquotients of A(G).
- `Automorphic.AutomorphicRepresentation.multiplicity` (projection): m(π) = dim Hom(π, A(G)) ∈ ℕ.
- `Automorphic.AutomorphicRepresentation.multiplicity_finite` (other): m(π) < ∞.
- `Automorphic.AutomorphicRepresentation.centralCharacter` (projection): The central character ω_π of Z_G(F)\Z_G(𝔸) (continuous, determined by Schur's lemma).
- `Automorphic.AutomorphicRepresentation.smooth` (equivalence): Bijection with smooth automorphic representations via K_∞-finite vectors and globalization.
- `Automorphic.AutomorphicRepresentation.twist` (functoriality): Twisting by a character of G(F)\G(𝔸) that factors through G/[G,G] preserves automorphy.

*Unit tests.*

- `autRep_trivial` (degenerate): The trivial representation is automorphic with multiplicity 1 (constants).
- `autRep_gl1` (computation): For GL_1/ℚ, automorphic representations ↔ Hecke characters (Tau Ceti GlobalNumberFields Layer 9 HeckeCharacter).
- `autRep_mult_not_one` (non-example): Multiplicity one is not part of the definition: for SL_n (n ≥ 3) or for inner forms, automorphic multiplicities greater than one occur (Blasius); the API returns a natural number, not a Prop.

*Acceptance.* The trivial representation of G(𝔸) is automorphic (spanned by the constant function). For GL_1, automorphic representations are exactly the Hecke characters. The trivial representation of SL_2(𝔸) is automorphic but not generic (AF.2/nongeneric-automorphic).

*Prerequisites.* `AF.2/automorphic-forms-module`, `AF.2/harish-chandra-finiteness`, `AF.2/smooth-automorphic-forms`.

*Sources.* getz-hahn (§5.5, Definition 5.18, p. 27): “An automorphic representation of G(AF ) is an admissible (g, K∞ ) × G(A∞ F )module isomorphic to a subquotient of L2 (G(F )AG \G(AF )).” — The L² formulation; the Borel–Jacquet formulation uses subquotients of A(G). langlands-notion (Proposition 2, p. 2): “A representation π of G(A) is an automorphic representation if and only if π is a constituent of Ind σ for some P and some σ.” — Langlands' characterisation.

### Construction: Restricted tensor products

Node `AF.2/restricted-tensor-product`, declaration `TauCeti.Automorphic.RestrictedTensor` in `TauCeti/Automorphic/AutomorphicForm`.

Given vector spaces W_v (v in a countable index set Ξ) and nonzero vectors φ_v^0 ∈ W_v for v ∉ Ξ_0 (Ξ_0 finite), the restricted tensor product ⊗'_v W_v = lim_→S ⊗_{v∈S} W_v (S ⊇ Ξ_0 finite) with transition maps ⊗_{v∈S} w_v ↦ ⊗_{v∈S} w_v ⊗ ⊗_{v∈S'−S} φ_v^0. Similarly for algebras A_v with idempotents a_v^0 (the restricted tensor product algebra), and for modules W_v over A_v with a_v^0φ_v^0 = φ_v^0 for almost all v. The isomorphism class depends on (φ_v^0) only up to scalars at each place.

*Hypotheses.* Ξ countable, Ξ_0 finite; φ_v^0 ≠ 0.

*Proof outline.*

1. Directed colimit of vector spaces over finite subsets S ⊇ Ξ_0.
2. Functoriality: families B_v with B_vφ_v^0 = φ_v^0 for almost all v induce ⊗B_v.
3. Restricted tensor product of algebras and of modules; rescaling φ_v^0 gives isomorphic modules.

*Uses.* AF.2/flath-factorization: the target of Flath's theorem. AF.0/adelic-test-functions: C_c^∞(G(𝔸_f)) as a restricted tensor product. GL2AutomorphicRepresentationsAndTransfer:R16.4: concrete restricted-tensor factorization comparisons for GL₂.

*API.*

- `Automorphic.RestrictedTensor` (constructor): ⊗'_v (W_v, φ_v^0) as a directed colimit.
- `Automorphic.RestrictedTensor.of` (constructor): The map ⊗_{v∈S} W_v → ⊗'_v W_v.
- `Automorphic.RestrictedTensor.map` (functoriality): ⊗B_v for families fixing φ_v^0 almost everywhere; map_id, map_comp.
- `Automorphic.RestrictedTensor.algebra` (structure): Algebra structure for algebras with idempotents a_v^0, and module structure on ⊗'W_v.
- `Automorphic.RestrictedTensor.rescale` (equivalence): Rescaling the φ_v^0 gives an isomorphic module.

*Unit tests.*

- `restrictedTensor_finite` (degenerate): If Ξ = Ξ_0 is finite, ⊗'_v W_v = ⊗_v W_v.
- `restrictedTensor_polynomial` (computation): ⊗'_{i≥1}(ℂ[X_i], 1) ≅ ℂ[X_1, X_2, …].
- `restrictedTensor_not_full` (non-example): ⊗'_v W_v is not the full infinite tensor product: the vector ⊗_v w_v with w_v ∉ ℂφ_v^0 for infinitely many v is not defined.

*Acceptance.* C_c^∞(G(𝔸_f)) ≅ ⊗'_v C_c^∞(G(F_v)) with respect to e_{K_v} = vol(K_v)⁻¹1_{K_v} (Getz–Hahn Example 7.3). ℂ[X_1, X_2, …] = ⊗'_i ℂ[X_i] with respect to the units.

*Prerequisites.* `mathlib:RestrictedProduct`.

*Sources.* getz-hahn (§7.1, p. 35): “This is the restricted tensor product of the Av with respect to the a0v .” — Restricted tensor products of algebras and modules, (7.1.2), Remark 7.1 and Examples 7.2-7.3.

### Theorem: Spherical vectors have dimension at most one

Node `AF.2/spherical-dimension-one`, declaration `TauCeti.Automorphic.finrank_spherical_le_one` in `TauCeti/Automorphic/AutomorphicForm`.

Let v be a finite place at which G has a reductive model over O_v and K_v = G(O_v) is hyperspecial. Then the spherical Hecke algebra C_c^∞(G(F_v)//K_v) is commutative (via the Satake isomorphism, SmoothRepresentationsOfLocalGroups SR.4), (G(F_v), K_v) is a Gelfand pair, and dim π_v^{K_v} ≤ 1 for every irreducible admissible representation π_v of G(F_v). This holds for all but finitely many places v (AdelicAlgebraicGroups AA.1 integral model).

*Hypotheses.* K_v hyperspecial (G_{O_v} reductive).

*Proof outline.*

1. Import commutativity of C_c^∞(G(F_v)//K_v) from SR.4's Satake isomorphism (RT-AREA-automorphic-1/26).
2. If C_c^∞(G//K) is commutative then every irreducible module over it is one-dimensional; V^K is an irreducible (or zero) module for irreducible V (Getz–Hahn Proposition 7.9), so dim V^K ≤ 1 (Proposition 8.6).
3. Hyperspecial at almost all places from the integral model (AdelicAlgebraicGroups:AA.1/integral-model-exists).

*Acceptance.* GL_2(ℚ_p), K = GL_2(ℤ_p): unramified principal series have one-dimensional K-fixed lines; Steinberg has none. For the non-hyperspecial Iwahori subgroup I the algebra C_c^∞(G//I) is noncommutative and dim(St^I) = 1 but dim(π^I) = 2 for unramified principal series of GL_2.

*Prerequisites.* `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.1/integral-model-exists`.

*Sources.* getz-hahn (§8, Proposition 8.6, p. 39): “If K ⊂ G is compact and open then (G, K) is a Gelfand pair if and only if Cc∞ (G//K) is commutative.” — Gelfand-pair criterion; the proof's 'dim(V^K) = 1' should read ≤ 1 (sourceIssues E2).

### Theorem: Flath's tensor product theorem (planet: Flath's tensor product theorem)

Node `AF.2/flath-factorization`, declaration `TauCeti.Automorphic.flath` in `TauCeti/Automorphic/AutomorphicForm`.

Let π be an irreducible admissible (𝔤, K_∞) × G(𝔸_f)-module (for example an automorphic representation). Then there are irreducible admissible (𝔤_v, K_v)-modules π_v at the archimedean places and irreducible admissible smooth representations π_v of G(F_v) at the finite places, with π_v unramified (π_v^{K_v} ≠ 0, hence one-dimensional) for almost all v, such that π ≅ ⊗'_v π_v, the restricted tensor product with respect to spherical vectors φ_v^0 ∈ π_v^{K_v}. The factors π_v are unique up to isomorphism, and the spherical vectors φ_v^0 are unique up to scalars.

*Hypotheses.* π irreducible admissible; K_v hyperspecial for v outside a finite set Ξ_0.

*Proof outline.*

1. Archimedean/finite splitting: an irreducible admissible module over H_∞ ⊗ H^∞ is an exterior tensor product of irreducibles (Getz–Hahn Theorem 7.11 for products of two groups, using finite-dimensionality of isotypic parts).
2. Finite part: write π^{J} for J = ∏_v J_v; for v ∉ S the module π^{J} is a module over ⊗_v C_c^∞(G(F_v)//K_v), commutative by AF.2/spherical-dimension-one, hence dim π_v^{K_v} = 1.
3. Pass to the limit over S: π^∞ ≅ ⊗'_v π_v with respect to φ_v^0 (Getz–Hahn §7.3).
4. Uniqueness: π_v is recovered as the isotypic factor for C_c^∞(G(F_v)) acting with all other places fixed.

*Acceptance.* For a Hecke character χ = ⊗χ_v, the factors are the local characters χ_v, unramified (trivial on O_v^×) for almost all v. For π attached to a newform f of level N, π_p is unramified exactly for p ∤ N (AF.5/gl2-dictionary).

*Prerequisites.* `AF.2/restricted-tensor-product`, `AF.2/spherical-dimension-one`, `AF.2/automorphic-forms-module`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

*Sources.* getz-hahn (§7.2, Theorem 7.5, p. 36): “Theorem 7.5 (Flath). Every admissible irreducible representation W of Cc∞ (G(A∞ F )) is factorizable.” — Flath's theorem for the finite part; the archimedean factor is split off by Theorem 7.11. getz-hahn (§7.2, p. 36): “The most interesting part is proving that dim(WvKv ) = 1 for almost all v; this is accomplished via Gelfand’s lemma.” — Role of the spherical dimension statement.

### Theorem: Automorphic representations need not be generic or cuspidal

Node `AF.2/nongeneric-automorphic`, declaration `TauCeti.Automorphic.trivial_not_generic` in `TauCeti/Automorphic/AutomorphicForm`.

(i) The trivial representation 1 of SL_2(𝔸_ℚ) (more generally of G(𝔸) for G with a nontrivial unipotent radical of a proper parabolic over F) is an automorphic representation, realised on the constant functions, which is not generic: for every nontrivial character ψ of N(F)\N(𝔸) of the upper triangular unipotent N, the Whittaker functional φ ↦ ∫_{N(F)\N(𝔸)} φ(n)ψ⁻¹(n)dn vanishes on it. (ii) The constant functions are not cuspidal: their constant term along the Borel subgroup is the constant function itself (with N(F)\N(𝔸) of volume one).

*Hypotheses.* G = SL_2 over ℚ (for definiteness).

*Proof outline.*

1. Constants are automorphic forms (AF.2/automorphic-form test automorphicForm_const).
2. ∫_{ℚ\𝔸} ψ⁻¹(x)dx = 0 for ψ ≠ 1 (character orthogonality on the compact group ℚ\𝔸, Tau Ceti GlobalNumberFields Layer 5).
3. Constant term along B: ∫_{N(ℚ)\N(𝔸)} 1 dn = 1 ≠ 0.

*Acceptance.* Both (i) and (ii) are the acceptance requirements of the roadmap ('a general reductive automorphic representation need not be generic'; a noncuspidal automorphic form of moderate growth). Holomorphic Eisenstein series of weight k ≥ 4 for SL_2(ℤ) give noncuspidal automorphic forms of moderate growth that are generic (Fourier coefficients σ_{k−1}(n)); their construction for general groups is AutomorphicSpectralTheory AS.1's.

*Prerequisites.* `AF.2/automorphic-representation`, Tau Ceti GlobalNumberFields (layer 5 full adeles and the additive quotient).

*Sources.* getz-hahn (§6.3, Definition 6.13, p. 31): “An automorphic form φ is said to be cuspidal if” — Cuspidality, which constants fail.

### Definition: Coefficient-valued holomorphic forms on SL_2 over a totally real field

Node `AF.2/holomorphic-sl2-forms`, declaration `TauCeti.Automorphic.SL2.HolomorphicForm` in `TauCeti/Automorphic/AutomorphicForm`.

Let F_0 be totally real, H = SL_2 and K ⊆ H(𝔸_{0,f}) compact open. A_hol(H(𝔸_0), K, k) is the space of smooth, left H(F_0)-invariant, right K-invariant functions of moderate growth on H(𝔸_0) of parallel weight k under SO(2)^{[F_0:ℚ]} and killed by the lowering operator ½(i 1; 1 −i) at every real place. It is finite-dimensional with a ℚ-structure given by q-expansions at i∞. For a ℚ-vector space W, A_hol(·)_L ⊗_L W is the space of formal q^{1/N}-series with W-coefficients that are finite L-combinations of q-expansions. For φ of weight k and h_f ∈ H(𝔸_{0,f}), φ^♭_{h_f}(τ) = |a_∞|^{−k/2}φ(h_∞, h_f) defines a classical holomorphic form for h_fKh_f⁻¹ ∩ H(F_0).

*Hypotheses.* F_0 totally real; k ∈ ℤ; K compact open.

*Proof outline.*

1. Specialise AF.2/automorphic-form to SL_2/F_0 with the K_∞-type of parallel weight k and the holomorphy condition (which implies Z(𝔤)-finiteness).
2. Finite-dimensionality from AF.2/harish-chandra-finiteness.
3. q-expansion and ℚ-structure: transport through φ ↦ φ^♭ to classical Hilbert modular forms and use the rationality of their q-expansion spaces (for F_0 = ℚ, Mathlib/Tau Ceti modular forms; in general imported from the Hilbert modular forms roadmap through AF.5/gl2-dictionary).
4. Coefficient extension: A_hol(·)_ℚ ⊗_ℚ W ⊆ W[[q^{1/N}]].

*Uses.* AF.3/sl2-fourier-vanishing: the vanishing criterion is applied to holomorphic coefficient-valued forms. GrossZagierAndArithmeticHeights:GZ.5: generating series of special cycles are coefficient-valued holomorphic forms (Zhang's AFL approach).

*API.*

- `Automorphic.SL2.HolomorphicForm` (data): A_hol(H(𝔸_0), K, k) as a finite-dimensional ℂ-vector space.
- `Automorphic.SL2.HolomorphicForm.qExpansion` (projection): The q-expansion at i∞ and its injectivity.
- `Automorphic.SL2.HolomorphicForm.rationalStructure` (structure): The ℚ-subspace of forms with rational q-expansion and A_hol ≅ A_hol,ℚ ⊗ ℂ.
- `Automorphic.SL2.HolomorphicForm.flat` (compatibility): φ ↦ φ^♭_{h_f}, landing in classical holomorphic forms for h_fKh_f⁻¹ ∩ H(F_0).
- `Automorphic.SL2.HolomorphicForm.coefficient` (constructor): W-valued forms A_hol(·)_L ⊗_L W.

*Unit tests.*

- `sl2Hol_weight12` (computation): For F_0 = ℚ, K = SL_2(\hat ℤ), k = 12: dim = 2.
- `sl2Hol_negative` (degenerate): For k < 0 the space is 0.
- `sl2Hol_flat_compat` (compatibility): For F_0 = ℚ, φ^♭ of the adelization of f ∈ M_k(SL_2(ℤ)) is f (Mathlib ModularForm).
- `sl2Hol_not_exp_growth` (non-example): Functions of exponential growth e^{Ca} (Zhang's A_exp for F_0 = ℚ) are not in A_hol: moderate growth fails.

*Acceptance.* For F_0 = ℚ, K = SL_2(\hat ℤ), k = 12: dimension 2, spanned by E_12 and Δ, with q-expansions in ℚ[[q]]. k < 0 gives 0.

*Prerequisites.* `AF.2/automorphic-form`, `AF.2/harish-chandra-finiteness`, `AF.2/adelic-classical-bijection`.

*Sources.* zhang21 (§1.2, (1.12)-(1.13), arXiv p. 7): “Then there is a Fourier expansion (by an absolute convergent sum): for h ∈ H(A0 ),” — Notation of §1.2: A_hol(H(𝔸_0), K, k), the Whittaker coefficients W_{φ,ξ} and the expansion (1.13).

**Coverage of AF.2.** Status: planned. Refinements for the next pass:

- Harish-Chandra's convolution lemma and finiteness theorem: proof sources (HC68, Borel–Jacquet) not read (gap).
- Comparison of the Borel–Jacquet (subquotients of A(G)) and Langlands (L² subquotients) definitions for the residual spectrum depends on AutomorphicSpectralTheory AS.4.

## AF.3. Constant terms and cusp forms

This layer constructs constant terms φ_P(g) = ∫_{N_P(F)\N_P(𝔸)} φ(ng) dn along rational parabolics, proves their equivariance, transitivity and behaviour under conjugation, defines cusp forms and the cuspidal L² space, and proves that cusp forms decay rapidly on Siegel sets, are square integrable and that the cuspidal spectrum is discrete with finite multiplicities (Gelfand–Graev–Piatetski-Shapiro). Groups anisotropic modulo the centre have no proper rational parabolics, so all their automorphic forms are cuspidal. It also plans Wei Zhang's Fourier vanishing criterion for SL_2 with the generation lemma it uses, and the level-one Hecke–Maass cusp forms used by Duke–Imamoḡlu–Tóth. Under RS-04, AF.3 is the owner of cuspidal constant terms, rapid decay, square integrability and finite multiplicity; AutomorphicSpectralTheory imports them.

**Dependencies.** Inside the roadmap: AF.0, AF.1, AF.2. Other roadmaps and the libraries: `AdelicAlgebraicGroups:AA.2/central-character-l2`; `AdelicAlgebraicGroups:AA.2/quotient-measure`; `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`; `AdelicAlgebraicGroups:AA.3/adelic-siegel-set`; `AdelicAlgebraicGroups:AA.3/compactness-anisotropic`; `AdelicAlgebraicGroups:AA.3/finite-volume`; `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`; `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`; `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`; `AdelicAlgebraicGroups:AA.3/siegel-finiteness-adelic`; `AdelicAlgebraicGroups:AA.3/unipotent-class-number-one`; `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`; `AutomorphicLFunctionsAndLocalFactors:AL.0`; `ReductiveGroupsPartII:RG2.4`; `mathlib:IsCompactOperator`; `mathlib:Matrix.SpecialLinearGroup`; Tau Ceti GlobalNumberFields (layer 5 full adeles and the additive quotient); Tau Ceti ReductiveGroups (layer 5 solvable and unipotent groups the unipotent radical); Tau Ceti ReductiveGroups (layer 7 structure theory).

### Theorem: Compactness of N(F)\N(𝔸) and its normalised measure

Node `AF.3/unipotent-quotient-compact`, declaration `TauCeti.Automorphic.isCompact_unipotentQuotient` in `TauCeti/Automorphic/ConstantTerm`.

Let N be a unipotent group over a number field F (for example the unipotent radical N_P of a rational parabolic P). Then N(F) is discrete and cocompact in N(𝔸); N(F)\N(𝔸) carries a unique right N(𝔸)-invariant probability measure dn, and for a normal series N = N_0 ⊇ N_1 ⊇ … ⊇ N_r = 1 with N_i/N_{i+1} ≅ G_a^{d_i} defined over F, integration over N(F)\N(𝔸) is the iterated integral over the (F\𝔸)^{d_i}.

*Hypotheses.* N unipotent over F, in particular F-split (char 0).

*Proof outline.*

1. A unipotent group in characteristic zero has a composition series over F with vector-group quotients (Tau Ceti ReductiveGroups Layer 5).
2. Base case G_a: F discrete and F\𝔸 compact (Tau Ceti GlobalNumberFields Layer 5).
3. Induction: N_{i+1}(𝔸)N(F)/N(F) closed, fibration of compact spaces; strong approximation for unipotent groups (AdelicAlgebraicGroups:AA.4/ga-strong-approximation, AA.3/unipotent-class-number-one).
4. Measure: quotient measure (AdelicAlgebraicGroups:AA.2/quotient-measure) normalised to total mass 1; Fubini in stages (AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity).

*Acceptance.* N = G_a over ℚ: ℚ\𝔸_ℚ ≅ \hat ℤ × [0,1) with total mass 1. The upper unipotent N ⊆ GL_3 has N(F)\N(𝔸) a compact Heisenberg nilmanifold, fibred over (F\𝔸)² with fibre F\𝔸.

*Prerequisites.* Tau Ceti GlobalNumberFields (layer 5 full adeles and the additive quotient), Tau Ceti ReductiveGroups (layer 5 solvable and unipotent groups the unipotent radical), `AdelicAlgebraicGroups:AA.2/quotient-measure`, `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`, `AdelicAlgebraicGroups:AA.3/unipotent-class-number-one`.

*Sources.* arthur-trace (§12, (12.1), p. 64): “This condition is a general analogue of the vanishing of the constant term of a classical modular form, which character- izes space of cusp forms.” — Integration over N_P(ℚ)\N_P(𝔸) in the cuspidality condition.

### Construction: Constant term along a parabolic (planet: Constant term)

Node `AF.3/constant-term`, declaration `TauCeti.Automorphic.constantTerm` in `TauCeti/Automorphic/ConstantTerm`.

For a rational parabolic P = M_P N_P of G and a locally integrable (for example continuous) left G(F)-invariant function φ on G(𝔸), the constant term is φ_P(g) = ∫_{N_P(F)\N_P(𝔸)} φ(ng) dn with the probability measure of AF.3/unipotent-quotient-compact. The integral converges absolutely; φ_P is left M_P(F)N_P(𝔸)-invariant; φ ↦ φ_P commutes with right translation by G(𝔸), with R(X) for X ∈ U(𝔤_∞), with K_∞ and with the Hecke action of C_c^∞(G(𝔸_f)); it maps smooth functions to smooth functions, T_N([G]) to T_N([G]_P), and automorphic forms on G to automorphic forms on [G]_P (Z(𝔤)-finite K_∞-finite functions of uniform moderate growth on M_P(F)N_P(𝔸)\G(𝔸)).

*Hypotheses.* P a proper rational parabolic subgroup with Levi decomposition P = M_P N_P over F.

*Proof outline.*

1. Convergence: continuity on the compact N_P(F)\N_P(𝔸).
2. Invariance: for m ∈ M_P(F), φ_P(mg) = ∫ φ(n m g) dn = ∫ φ(m (m⁻¹nm) g) dn and m normalises N_P preserving dn.
3. Equivariance: right translations commute with left integration; differentiation under the integral sign; Hecke operators are right convolutions.
4. Growth: ‖ng‖ ≤ ‖n‖‖g‖ with n in a compact fundamental domain of N_P(F)\N_P(𝔸) (AF.0/growth-translation-differentiation).

*Uses.* AF.3/cusp-form: cuspidality is vanishing of all constant terms. AutomorphicSpectralTheory:AS.1: constant terms of Eisenstein series as Weyl sums of intertwining operators. AutomorphicSpectralTheory:AS.3: Arthur's truncation is built from constant terms and their transitivity. AutomorphicLFunctionsAndLocalFactors:AL.3: the global unfolding for cuspidal data uses vanishing constant terms. MetaplecticAutomorphicForms:MP.5: constant terms of genuine forms on covers.

*API.*

- `Automorphic.constantTerm` (data): φ ↦ φ_P on continuous left G(F)-invariant functions.
- `Automorphic.constantTerm_leftInvariant` (characterisation): φ_P(m n g) = φ_P(g) for m ∈ M_P(F), n ∈ N_P(𝔸).
- `Automorphic.constantTerm_rightTranslate` (functoriality): (R(y)φ)_P = R(y)(φ_P), and likewise for R(X), K_∞ and Hecke operators.
- `Automorphic.constantTerm_automorphic` (structure): φ ∈ A(G) ⇒ φ_P ∈ A_P(G), and T_N([G]) → T_N([G]_P) is continuous.
- `Automorphic.constantTerm_top` (simp): For P = G, φ_G = φ.
- `Automorphic.constantTerm_const` (simp): The constant term of the constant function c is c.

*Unit tests.*

- `constantTerm_const` (degenerate): For φ ≡ c, φ_P ≡ c for every P.
- `constantTerm_gl2_eisenstein` (computation): For the weight-k level-one holomorphic Eisenstein series E_k = 1 − (2k/B_k)Σσ_{k−1}(n)q^n, the constant term of its adelization along B at diag(y^{1/2}, y^{−1/2}) is y^{k/2}.
- `constantTerm_cusp_compat` (compatibility): For f ∈ M_k(SL_2(ℤ)), φ_{f,B} = 0 iff f ∈ S_k(SL_2(ℤ)) (vanishing of a_0, Mathlib CuspForm).
- `constantTerm_not_full_N` (non-example): Integrating over N(𝔸) instead of N(F)\N(𝔸) diverges for nonzero automorphic forms; the quotient is essential.

*Acceptance.* For GL_2/ℚ and φ_f attached to f ∈ M_k(SL_2(ℤ)) with Fourier expansion Σ a_n q^n, φ_{f,B}(diag(y^{1/2}, y^{−1/2})) = a_0 y^{k/2}. For G = GL_1 there is no proper parabolic: the constant term map is not defined (the set of proper parabolics is empty).

*Prerequisites.* `AF.3/unipotent-quotient-compact`, `AF.0/uniform-moderate-growth-space`, `AF.2/automorphic-form`, `AF.0/finite-hecke-action`, Tau Ceti ReductiveGroups (layer 7 structure theory).

*Sources.* getz-hahn (§6.3, Definition 6.13, p. 31): “for all parabolic subgroups P ⊆ G with Levi decomposition P = M N , and for all g ∈ G(AF ).” — The integral ∫_{N(𝔸)} φ(ng)dn in the definition of cuspidality (over N(F)\N(𝔸)). bpcz22 (§2.7.1, arXiv p. 23): “The subspace AP,cusp (G) of cuspidal automorphic forms consists of the ϕ ∈ AP (G) such that for every proper standard parabolic subgroup Q ⊆ P we have ϕQ = 0.” — Constant terms φ_Q as maps between spaces of automorphic forms on [G]_P.

### Theorem: Transitivity and conjugation of constant terms

Node `AF.3/constant-term-transitivity`, declaration `TauCeti.Automorphic.constantTerm_constantTerm` in `TauCeti/Automorphic/ConstantTerm`.

(i) For rational parabolics Q ⊆ P, (φ_P)_Q = φ_Q, where the outer constant term is along the parabolic Q ∩ M_P of M_P (equivalently along N_Q, using N_Q = N_P ⋊ (N_Q ∩ M_P)). (ii) For γ ∈ G(F), φ_{γPγ⁻¹}(g) = φ_P(γ⁻¹g). Hence φ_P = 0 for all proper rational P iff φ_P = 0 for all proper standard parabolics (containing a fixed minimal P_0), iff φ_P = 0 for the maximal standard parabolics.

*Hypotheses.* Q ⊆ P rational parabolics; P_0 a minimal rational parabolic (AdelicAlgebraicGroups:AA.3/minimal-parabolic-data).

*Proof outline.*

1. (i) Fubini on N_Q(F)\N_Q(𝔸) fibred over N_P(F)\N_P(𝔸) with fibre (N_Q ∩ M_P)(F)\(N_Q ∩ M_P)(𝔸).
2. (ii) Change of variables n ↦ γnγ⁻¹ and left G(F)-invariance of φ.
3. Every rational parabolic is G(F)-conjugate to a standard one (AdelicAlgebraicGroups:AA.3/minimal-parabolic-data); every proper standard parabolic is contained in a maximal one; apply (i)-(ii).

*Acceptance.* GL_3: φ_{B} = (φ_{P_{2,1}})_{B∩M} for the Borel B ⊆ P_{2,1}. GL_2: there is one standard proper parabolic (B), so cuspidality is the single condition φ_B = 0.

*Prerequisites.* `AF.3/constant-term`, `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`, `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`.

*Sources.* bpcz22 (§2.7.1, arXiv p. 23): “for every proper standard parabolic subgroup Q ⊆ P we have ϕQ = 0.” — Cuspidality tested on proper standard parabolics only.

### Definition: Cusp forms (planet: Cusp form)

Node `AF.3/cusp-form`, declaration `TauCeti.Automorphic.CuspForm` in `TauCeti/Automorphic/ConstantTerm`.

An automorphic form φ ∈ A(G) is cuspidal (a cusp form) if φ_P = 0 for every proper rational parabolic subgroup P of G. A_0(G) ⊆ A(G) is the subspace of cusp forms, stable under the (𝔤, K_∞) × G(𝔸_f)-action. More generally a locally integrable left G(F)-invariant function is cuspidal if its constant terms along proper parabolics vanish almost everywhere; L²_cusp is the closed subspace of L²(G(F)A_G\G(𝔸)) (or L²(G(F)Z(𝔸)\G(𝔸), χ)) of cuspidal functions.

*Hypotheses.* G connected reductive over F.

*Proof outline.*

1. Kernel of the constant term maps (AF.3/constant-term), intersected over proper parabolics; by AF.3/constant-term-transitivity it suffices to use maximal standard ones, a finite set.
2. Stability under the actions by the equivariance of constant terms.
3. L²-version: constant terms of L² functions are defined almost everywhere by Fubini; the cuspidal subspace is closed and G(𝔸)-invariant.

*Uses.* AF.3/cusp-form-rapid-decay: cusp forms decay rapidly on Siegel sets. AF.3/cuspidal-spectrum-discrete: the cuspidal spectrum is discrete with finite multiplicities. AutomorphicSpectralTheory:AS.4: the cuspidal part of the spectral decomposition. AutomorphicLFunctionsAndLocalFactors:AL.3: the cusp-form carrier of Rankin–Selberg integrals. GL2AutomorphicRepresentationsAndTransfer:R16.4: cuspidal multiplicity for GL₂. RankZeroOneBSD:BSD.2: cuspidal inputs for Waldspurger/Gross–Zagier.

*API.*

- `Automorphic.CuspForm` (data): The subspace A_0(G) of cuspidal automorphic forms.
- `Automorphic.CuspForm.constantTerm_eq_zero` (characterisation): φ ∈ A_0(G) ↔ ∀ P proper, φ_P = 0.
- `Automorphic.CuspForm.iff_maximal_standard` (characterisation): It suffices to test the maximal standard parabolics.
- `Automorphic.CuspForm.submodule` (structure): A_0(G) is a (𝔤, K_∞) × G(𝔸_f)-submodule of A(G).
- `Automorphic.L2Cusp` (data): The closed G(𝔸)-invariant subspace L²_cusp of L²(G(F)A_G\G(𝔸)) (and with central character).
- `Automorphic.CuspForm.classical_compat` (compatibility): For GL_2/ℚ, adelizations of Mathlib CuspForms are cusp forms (AF.5/gl2-dictionary).

*Unit tests.*

- `cuspForm_anisotropic` (degenerate): For G anisotropic mod centre, A_0(G) = A(G).
- `cuspForm_delta` (computation): The adelization of Ramanujan's Δ ∈ S_12(SL_2(ℤ)) is a cusp form on GL_2/ℚ.
- `cuspForm_const_not` (non-example): The constant function 1 on SL_2(ℚ)\SL_2(𝔸) is not a cusp form (constant term 1).
- `cuspForm_eisenstein_not` (non-example): The adelization of E_4 is not a cusp form: its constant term along B is nonzero.

*Acceptance.* For GL_2/ℚ, φ_f is a cusp form iff f is a cusp form at every cusp (AF.5/gl2-dictionary). For G anisotropic modulo its centre every automorphic form is cuspidal (AF.3/anisotropic-cuspidal). Constant functions are not cusp forms when G has a proper rational parabolic (AF.2/nongeneric-automorphic).

*Prerequisites.* `AF.3/constant-term`, `AF.3/constant-term-transitivity`, `AF.2/automorphic-forms-module`, `AdelicAlgebraicGroups:AA.2/central-character-l2`.

*Sources.* getz-hahn (§6.3, Definition 6.13, p. 31): “An automorphic form φ is said to be cuspidal if” — Definition: vanishing of ∫φ(ng)dn for all parabolic P = MN and all g. arthur-trace (§12, p. 64): “The subspace L2cusp G(Q)\G(A)1 of cuspidal functions in L2 G(Q)\G(A)1 is closed and invariant under right translation by G(A)1 .” — The L² cuspidal subspace.

### Theorem: Groups anisotropic modulo the centre have no proper rational parabolics

Node `AF.3/anisotropic-cuspidal`, declaration `TauCeti.Automorphic.cuspForm_eq_top_of_anisotropic` in `TauCeti/Automorphic/ConstantTerm`.

If G is anisotropic modulo its centre over F (the derived group contains no F-split torus G_m), then G has no proper rational parabolic subgroup; consequently every automorphic form on G is cuspidal, A_0(G) = A(G), and G(F)Z_G(𝔸)\G(𝔸) is compact.

*Hypotheses.* The derived group G^der has F-rank 0.

*Proof outline.*

1. A proper rational parabolic P is P(λ) for a non-central F-cocharacter λ of G (dynamic description, Tau Ceti ReductiveGroups Layer 7; Tau Ceti defines P(λ)); λ composed with G → G/Z_G gives a nontrivial split torus in G^ad, contradicting anisotropy.
2. Hence the set of proper parabolics is empty and the cuspidality condition is vacuous.
3. Compactness: AdelicAlgebraicGroups:AA.3/compactness-anisotropic (Borel–Harish-Chandra).

*Acceptance.* The multiplicative group D^× of a quaternion division algebra over ℚ: anisotropic modulo the centre, all automorphic forms cuspidal. GL_2 over ℚ is not anisotropic modulo centre (the diagonal torus modulo centre is split).

*Prerequisites.* `AF.3/cusp-form`, Tau Ceti ReductiveGroups (layer 7 structure theory), `AdelicAlgebraicGroups:AA.3/compactness-anisotropic`.

*Sources.* arthur-trace (§12, p. 64): “For if G(Q)\G(A)1 is compact, there are no proper parabolic subgroups, by the criterion of Borel and Harish-Chandra, and L2cusp G(Q)\G(A)1 equals L2 G(Q)\G(A)1 .” — The compact-quotient case.

### Theorem: Cusp forms are rapidly decreasing (planet: Rapid decay of cusp forms)

Node `AF.3/cusp-form-rapid-decay`, declaration `TauCeti.Automorphic.CuspForm.rapidDecay` in `TauCeti/Automorphic/ConstantTerm`.

Let φ ∈ A_0(G) be a cusp form (with a central character, or A_G-invariant). Then φ is rapidly decreasing on Siegel sets: for every Siegel set 𝔖 ⊆ G(𝔸)^1 (AdelicAlgebraicGroups:AA.3/adelic-siegel-set) and every N > 0 there is C with |φ(g)| ≤ C‖g‖^{−N} for g ∈ 𝔖; the same holds for all derivatives R(X)φ. In particular φ is bounded on G(F)A_G\G(𝔸), and φ ∈ S([G]) (Schwartz space of [G] modulo A_G).

*Hypotheses.* φ cuspidal automorphic form, normalised by a unitary central character or A_G-invariance.

*Proof outline.*

1. On a Siegel set for a minimal parabolic P_0 use the estimate that, for a smooth function of uniform moderate growth, φ(g) − φ_P(g) is rapidly decreasing in the directions where the roots of P grow (Fourier expansion along the abelian quotients of N_P and integration by parts with Lie derivatives).
2. For a cusp form all φ_P vanish, so φ itself decays in every direction of the positive chamber of A_0.
3. Siegel sets cover G(F)\G(𝔸)^1 (AdelicAlgebraicGroups:AA.3/siegel-covering-adelic) and heights on them are controlled by AdelicAlgebraicGroups:AA.3/height-siegel-estimate.
4. Source: Harish-Chandra (LNM 62, Lemma 10) and Moeglin–Waldspurger I.2.18, not freely available; the statement as used is recorded from Arthur and Franke (proof-source gap).

*Acceptance.* For f ∈ S_k(SL_2(ℤ)), y^{k/2}|f(x+iy)| → 0 exponentially as y → ∞ (Mathlib exponential decay of cusp forms), which is the SL_2(ℤ) Siegel-set case. Fails for noncuspidal forms: the constant function 1 is not rapidly decreasing on a Siegel set of SL_2.

*Prerequisites.* `AF.3/cusp-form`, `AF.2/automorphic-forms-uniform-growth`, `AdelicAlgebraicGroups:AA.3/adelic-siegel-set`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`.

*Sources.* arthur-trace (§13, p. 70): “We shall say that a function φ on G(Q)\G(A)1 is rapidly decreasing if for any positive integer N and any Siegel set S = S G (T1 ) for G(A), there is a positive constant C such that” — Definition of rapid decrease on Siegel sets, used for cusp forms. franke98 (§2, p. 22 of the scan (printed p. 202)): “is the space of rapidly decreasing (or moderately increasing) cuspidal functions” — Cuspidal functions of moderate growth are rapidly decreasing (Franke's Theorem 5 context).

### Theorem: Square integrability of cusp forms

Node `AF.3/cusp-forms-square-integrable`, declaration `TauCeti.Automorphic.CuspForm.memL2` in `TauCeti/Automorphic/ConstantTerm`.

If φ is a cusp form with unitary central character χ (or A_G-invariant), then φ ∈ L²(G(F)Z_G(𝔸)\G(𝔸), χ) (resp. L²(G(F)A_G\G(𝔸))), and in fact φ is bounded. The K_∞-finite Z(𝔤)-finite vectors of L²_cusp are cusp forms, A_0(G)_χ ⊆ L²_cusp,χ, and A_0(G)_χ is dense in L²_cusp,χ.

*Hypotheses.* unitary central character χ.

*Proof outline.*

1. Boundedness from rapid decay on finitely many Siegel sets (AF.3/cusp-form-rapid-decay) and finite volume of G(F)Z_G(𝔸)\G(𝔸) (AdelicAlgebraicGroups:AA.3/finite-volume).
2. Conversely, a K_∞-finite Z(𝔤)-finite L² cuspidal function has moderate growth (Sobolev estimate on smooth vectors of the right regular representation, BPCZ (2.5.4.1)) and is therefore a cusp form.
3. Density: smooth K-finite vectors are dense in any unitary representation (AF.1/k-finite-vectors), and by AF.3/cuspidal-spectrum-discrete each irreducible constituent is admissible with Z(𝔤)-finite K-finite vectors.

*Acceptance.* Petersson norms of cusp forms on Γ_0(N) are finite (Tau Ceti ModularForms Layer 3), the GL_2/ℚ case. Eisenstein series are not square-integrable: the theorem needs cuspidality.

*Prerequisites.* `AF.3/cusp-form-rapid-decay`, `AdelicAlgebraicGroups:AA.3/finite-volume`, `AdelicAlgebraicGroups:AA.2/central-character-l2`, `AF.1/k-finite-vectors`.

*Sources.* getz-hahn (§6.3, p. 32): “and this subspace is dense.” — ∪_{ξ,J} A_0(ξ, J) ⊆ L²_0(G(F)A_G\G(𝔸)) and density. arthur-trace (§12, Theorem 12.1, p. 64): “The space L2cusp G(Q)\G(A)1 decomposes under the action of G(A)1 into a discrete sum of irreducible represen- tations with finite multiplicities.” — Used for the density statement.

### Theorem: Discreteness of the cuspidal spectrum (Gelfand–Graev–Piatetski-Shapiro) (planet: Discreteness of the cuspidal spectrum)

Node `AF.3/cuspidal-spectrum-discrete`, declaration `TauCeti.Automorphic.L2Cusp.discrete` in `TauCeti/Automorphic/ConstantTerm`.

For every f ∈ C_c^∞(G(𝔸)) the operator R(f) restricted to L²_cusp(G(F)A_G\G(𝔸)) (or L²_cusp with unitary central character) is compact (Hilbert–Schmidt for suitable f). Consequently L²_cusp decomposes as a Hilbert direct sum ⊕̂_π m_cusp(π)·π of irreducible unitary representations of G(𝔸) with finite multiplicities m_cusp(π) < ∞, and only finitely many π with a given K_∞-type, level J_f and infinitesimal character occur.

*Hypotheses.* G connected reductive over F; unitary central character or A_G-quotient.

*Proof outline.*

1. Kernel estimate: on cuspidal functions R(f) has kernel Σ_γ f(x⁻¹γy) minus its constant-term corrections; for cuspidal φ the corrections integrate to 0, and the corrected kernel is bounded on Siegel sets × Siegel sets (rapid decay estimate, AF.3/cusp-form-rapid-decay).
2. A bounded kernel on a finite-measure space gives a Hilbert–Schmidt operator, hence compact.
3. Spectral theorem for compact self-adjoint operators R(f * f^*) and an approximate identity give the discrete decomposition with finite multiplicities.
4. Finiteness for fixed (K_∞-type, J_f, χ): each such π contributes to the finite-dimensional space of AF.2/harish-chandra-finiteness.

*Acceptance.* Compact quotient (anisotropic G): the whole L² is discrete (Arthur §1 argument). For GL_2/ℚ with trivial central character at level one, the cuspidal spectrum consists of the representations generated by level-one holomorphic and Maass eigenforms, each with multiplicity one (the multiplicity-one statement itself is GL2AutomorphicRepresentationsAndTransfer R16.4's).

*Prerequisites.* `AF.3/cusp-forms-square-integrable`, `AF.3/cusp-form-rapid-decay`, `AF.0/adelic-test-functions`, `AF.2/harish-chandra-finiteness`, `mathlib:IsCompactOperator`, `AdelicAlgebraicGroups:AA.3/siegel-finiteness-adelic`.

*Sources.* arthur-trace (§12, Theorem 12.1, p. 64): “Theorem 12.1 (Gelfand, Piatetski-Shapiro). The space L2cusp G(Q)\G(A)1 decomposes under the action of G(A)1 into a discrete sum of irreducible represen- tations with finite multiplicities.” — The theorem; Arthur indicates the proof via the compact-quotient argument combined with the vanishing of constant terms.

### Definition: Cuspidal automorphic representations

Node `AF.3/cuspidal-automorphic-representation`, declaration `TauCeti.Automorphic.CuspidalRepresentation` in `TauCeti/Automorphic/ConstantTerm`.

A cuspidal automorphic representation of G(𝔸) (with unitary central character χ) is an irreducible closed G(𝔸)-subrepresentation of L²_cusp,χ, or equivalently (passing to K_∞-finite vectors) an irreducible (𝔤, K_∞) × G(𝔸_f)-submodule of A_0(G)_χ. Its cuspidal multiplicity m_cusp(π) is finite (AF.3/cuspidal-spectrum-discrete). Every cuspidal automorphic representation is an automorphic representation (AF.2/automorphic-representation); subrepresentation, not subquotient, is required.

*Hypotheses.* unitary central character χ.

*Proof outline.*

1. Definition via L²_cusp; the K-finite vectors of an irreducible closed subspace lie in A_0(G) by AF.3/cusp-forms-square-integrable.
2. Equivalence of the L² and (𝔤, K_∞) × G(𝔸_f) formulations by Casselman–Wallach at infinity (AF.1/casselman-wallach-globalization) and admissibility.
3. Non-unitary twists: π ⊗ |·|^s of a cuspidal π is 'cuspidal' in the sense of A_0(G) but not unitary; record the convention that cuspidal automorphic representations are unitary up to such twists where the consumer needs it.

*Uses.* AF.4/cohomological-representation: cuspidal cohomological representations and their rationality. AutomorphicLFunctionsAndLocalFactors:AL.3: Rankin–Selberg L-functions of cuspidal representations. GL2AutomorphicRepresentationsAndTransfer:R16.4: strong multiplicity one for cuspidal GL₂ representations. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic cuspidal representations of GL_n.

*API.*

- `Automorphic.CuspidalRepresentation` (data): Irreducible closed subrepresentations of L²_cusp,χ (with their K-finite models).
- `Automorphic.CuspidalRepresentation.multiplicity` (projection): m_cusp(π) ∈ ℕ.
- `Automorphic.CuspidalRepresentation.toAutomorphic` (coercion): Every cuspidal representation is automorphic.
- `Automorphic.CuspidalRepresentation.kFinite` (equivalence): Bijection with irreducible submodules of A_0(G)_χ up to isomorphism.

*Unit tests.*

- `cuspidalRep_gl1` (degenerate): For GL_1 every unitary Hecke character is a cuspidal automorphic representation.
- `cuspidalRep_delta` (computation): The representation generated by Δ has π_∞ ≅ D_12(0) and π_p unramified for all p.
- `cuspidalRep_trivial_not` (non-example): The trivial representation of SL_2(𝔸) is automorphic but not cuspidal.
- `cuspidalRep_subquotient_not` (non-example): An irreducible subquotient of A_0(G) that is not a submodule is not a cuspidal automorphic representation in this definition (for unitary χ, A_0(G)_χ is semisimple, so the distinction only matters for non-unitary χ).

*Acceptance.* For GL_1, every Hecke character is cuspidal (no proper parabolics). For GL_2/ℚ, the representation generated by the adelization of Δ is cuspidal with π_∞ ≅ D_12.

*Prerequisites.* `AF.3/cuspidal-spectrum-discrete`, `AF.3/cusp-forms-square-integrable`, `AF.2/automorphic-representation`.

*Sources.* getz-hahn (§6.3, Definition 6.15, p. 32): “A cuspidal automorphic representation is an automorphic representation equivalent to a subrepresentation of L20 (G(F )AG \G(AF )).” — Definition, with the remark that subrepresentation (not subquotient) is meant.

### Theorem: Generation of SL_2 by unipotent subgroups

Node `AF.3/sl2-generation`, declaration `TauCeti.Automorphic.SL2.closure_unipotent_eq_top` in `TauCeti/Automorphic/ConstantTerm`.

(i) For any field k, SL_2(k) is generated by the upper unipotent subgroup N(k) and any single element of SL_2(k) \ B(k). (ii) For a nonarchimedean local field with ring of integers O and uniformizer ϖ, SL_2 of the field is generated by N(ϖ^{−c−1}O) and N^-(ϖ^cO) for every integer c.

*Hypotheses.* k a field; for (ii) a nonarchimedean local field.

*Proof outline.*

1. (i) Bruhat decomposition SL_2(k) = B ⊔ BwB and w ∈ N·g·N for any g ∉ B; B = N·T with T generated by products of unipotents.
2. (ii) diag(t, t⁻¹) and the Weyl element are products of elements of N(ϖ^{−c−1}O) and N^-(ϖ^cO) by explicit 2×2 identities; then use the Iwasawa/Cartan decompositions of SL_2 (ReductiveGroupsPartII RG2.4).

*Acceptance.* Over 𝔽_2, SL_2(𝔽_2) = GL_2(𝔽_2) ≅ S_3 is generated by (1 1; 0 1) and the non-upper-triangular element (0 1; 1 0). Over ℚ_p with c = 0: N(p^{−1}ℤ_p) and N^-(ℤ_p) generate SL_2(ℚ_p), while N(ℤ_p) and N^-(ℤ_p) generate only SL_2(ℤ_p).

*Prerequisites.* `ReductiveGroupsPartII:RG2.4`, `mathlib:Matrix.SpecialLinearGroup`.

*Sources.* zhang21 (§13.3, proof of Lemma 13.6, arXiv p. 64): “Now note that, for every v, H(F0,v ) is generated by N (F0,v ) and any single element in H(F0,v ) \ B(F0,v ).” — Statement (i); (ii) is the local generation input [27, Prop. 8.1.2].

### Theorem: Unit-index Fourier vanishing criterion for SL_2

Node `AF.3/sl2-fourier-vanishing`, declaration `TauCeti.Automorphic.SL2.eq_const_of_fourierCoeff_eq_zero` in `TauCeti/Automorphic/ConstantTerm`.

Let F_0 be totally real, ψ = ⊗ψ_v the standard additive character of F_0\𝔸_0, c_v the level of ψ_v, and B a finite set of finite places. Let φ be continuous on H(𝔸_0) = SL_2(𝔸_0), left H(F_0)-invariant and right invariant under K = ∏_{v∤∞}K_v with K_v = m(ϖ_v^{c_v})⁻¹ SL_2(O_v) m(ϖ_v^{c_v}) for v ∈ B (m(a) = diag(a, 1)). With W_{φ,ξ}(h) = ∫_{F_0\𝔸_0} φ(n(b)h)ψ(−ξb)db (db of total mass 1), suppose W_{φ,ξ}(h_∞) = 0 for all h_∞ ∈ H(F_{0,∞}) and all ξ ∈ F_0^× with v(ξ) = 0 for every v ∈ B. Then φ is constant; in particular φ = 0 if φ has parallel weight n ≠ 0.

*Hypotheses.* φ continuous, left H(F_0)-invariant, right K-invariant as stated.

*Proof outline.*

1. Fourier uniqueness on the compact group F_0\𝔸_0 (Tau Ceti GlobalNumberFields Layer 5 and Pontryagin duality via ψ): a continuous function with all Fourier coefficients zero vanishes.
2. Induction on B (Zhang pp. 956-957): for v_0 ∈ B, average over N(ϖ^{−c−1}O_{v_0}) using K_{v_0}-invariance and ψ_{v_0}(ξb) = 1 when v_0(ξ) ≥ 1, to remove the condition at v_0.
3. Base case: all W_{φ,ξ} vanish for ξ ≠ 0, so φ(h) = W_{φ,0}(h) is left N(𝔸_0)-invariant; together with H(F_0)-invariance and AF.3/sl2-generation (ii) and strong approximation for SL_2 (AdelicAlgebraicGroups:AA.4/strong-approximation-theorem), φ is invariant under a dense subgroup, hence constant.
4. Parallel weight n ≠ 0: a constant function has weight 0.

*Acceptance.* With B = ∅ the criterion says: a continuous automorphic function on SL_2(𝔸_0) all of whose nonconstant Fourier coefficients vanish identically at infinity is constant. The hypothesis on K_v at v ∈ B cannot be dropped: for K_v smaller, coefficients with v(ξ) ≠ 0 can carry a nonzero form.

*Prerequisites.* `AF.3/sl2-generation`, `AF.2/holomorphic-sl2-forms`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, Tau Ceti GlobalNumberFields (layer 5 full adeles and the additive quotient).

*Sources.* zhang21 (§13.3, Lemma 13.6, arXiv p. 64): “Suppose that Wφ,ξ (h∞ ) vanishes identically (as a function in h∞ ∈ H(F0,∞ )) for all ξ ∈ F0× such that (ξ, B) = 1” — Lemma 13.6 as stated, with K_v from (13.3).

### Definition: Level-one Hecke–Maass cusp forms and their Hecke operators

Node `AF.3/maass-cusp-forms`, declaration `TauCeti.Automorphic.MaassCuspForm` in `TauCeti/Automorphic/ConstantTerm`.

A level-one Maass cusp form is a smooth SL_2(ℤ)-invariant function φ on the upper half-plane with ‖φ‖² = ⟨φ, φ⟩ < ∞, Δφ = λφ for the hyperbolic Laplacian with λ = 1/4 + r² (r ≥ 0 or r ∈ i(0, 1/2]), and zero constant term at i∞. The weight-zero Hecke operators T_m f(z) = m^{−1/2} Σ_{ad=m, a,d>0} Σ_{b mod d} f((az+b)/d) preserve this space, are self-adjoint and commute, satisfy T_mT_n = Σ_{d | (m,n)} T_{mn/d²}, and a Hecke–Maass cusp form is a simultaneous eigenfunction, normalised so that φ(z) = 2√y Σ_{n≠0} a(n)K_{ir}(2π|n|y)e(nx) with a(1) = 1. Then a(−n) = a(−1)a(n), a(−1) = ±1 (even/odd), a(n) ∈ ℝ, φ(−z̄) = a(−1)φ(z), and T_nφ = a(n)φ. Adelically these are the cusp forms on PGL_2/ℚ of level one with K_∞-type trivial on SO(2), with ‖φ‖ kept distinct from 1 (the normalisation a(1) = 1 is not the L²-normalisation).

*Hypotheses.* level one; weight zero.

*Proof outline.*

1. Adelize via AF.5/gl2-classical-to-adelic (weight 0 version) and identify with A_0(PGL_2)^{PGL_2(\hat ℤ)} of SO(2)-type 0 and Casimir eigenvalue −λ.
2. Fourier expansion in K-Bessel functions: separation of variables for Δ on y > 0 and moderate growth exclude the I-Bessel solutions (K-Bessel integral representation from AutomorphicLFunctionsAndLocalFactors AL.0, per PAPER-ZHANG-21/98's route).
3. Hecke operators as the classical form of AF.0/finite-hecke-action at T_p = [GL_2(ℤ_p) diag(p,1) GL_2(ℤ_p)], normalised by p^{−1/2}; self-adjointness from the Petersson inner product; multiplicativity.
4. Parity: the reflection z ↦ −z̄ commutes with Δ and the T_n, so eigenforms are even or odd, giving a(−n) = a(−1)a(n).

*Uses.* AutomorphicSpectralTheory:AS.4: the level-one spectral expansion uses the Hecke–Maass basis (DIT (5.1)). AF.3/cuspidal-spectrum-discrete: the level-one cuspidal spectrum of PGL_2/ℚ with SO(2)-type 0.

*API.*

- `Automorphic.MaassCuspForm` (data): Level-one weight-zero Maass cusp forms with eigenvalue λ.
- `Automorphic.MaassCuspForm.heckeOperator` (constructor): T_m with the normalisation m^{−1/2} Σ_{ad=m} Σ_{b mod d}.
- `Automorphic.MaassCuspForm.hecke_mul` (relation): T_mT_n = Σ_{d|(m,n)} T_{mn/d²}.
- `Automorphic.MaassCuspForm.hecke_selfAdjoint` (structure): T_m is self-adjoint for the Petersson inner product.
- `Automorphic.MaassCuspForm.fourierCoeff_neg` (relation): a(−n) = a(−1)a(n) with a(−1) = ±1 for a normalised Hecke eigenform.
- `Automorphic.MaassCuspForm.toAdelic` (compatibility): The adelization is a cusp form on PGL_2/ℚ of level one with T_p acting by p^{1/2}·(adelic Hecke operator) normalisation.

*Unit tests.*

- `maass_hecke_mul_prime` (computation): T_pT_p = T_{p²} + T_1 for p prime.
- `maass_eigenvalue_third` (computation): The third eigenvalue 190.13154… = 1/4 + 13.7797513519…² belongs to an even form.
- `maass_constant_not` (non-example): The constant function is a Laplace eigenfunction (λ = 0) of finite norm but is not a cusp form: its constant term is nonzero.
- `maass_norm_not_one` (non-example): The normalisation a(1) = 1 does not give ‖φ‖ = 1; keeping the two distinct is required when spectral bounds are applied (DIT route).

*Acceptance.* The first five Laplace eigenvalues of level-one Hecke–Maass cusp forms are 91.14134…, 148.43213…, 190.13154…, 206.41679…, 260.68740… (cited numerical values; the third belongs to an even form, the others to odd forms). There are no level-one Maass cusp forms with λ ≤ 1/4 (Selberg's bound and Roelcke): r is real.

*Prerequisites.* `AF.3/cusp-form`, `AF.3/cusp-forms-square-integrable`, `AF.0/finite-hecke-action`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

*Sources.* dit16 (§5, (5.6)-(5.7), p. 962): “We can and always will normalize such a Hecke-Maass cusp form ' so that this Fourier expansion has the form3” — Normalisation (5.7) with a(1) = 1 and the parity a(−n) = a(−1)a(n) = ±a(n). dit16 (§5, p. 962): “Being a Hecke-Maass cusp form means that, in addition, ' is an eigenfunction of all the Hecke operators, that k'k2 = h', 'i < 1 and that the constant term in its Fourier expansion at i1 is zero.” — Definition ('< ∞' and 'i∞' are garbled in the PDF text).

**Coverage of AF.3.** Status: planned. Refinements for the next pass:

- Rapid decay of cusp forms: proof source not read (gap); refine the 'φ − φ_P decays on Siegel sets' estimate at lemma level.
- Hilbert–Schmidt kernel estimate for R(f) on L²_cusp at lemma level.

## AF.4. Algebraic weights and rational structures

This layer fixes the algebraic side of automorphic representations: algebraic weights and the representations V_λ, their infinitesimal characters, the C-algebraic and L-algebraic normalisations with the half-root twist, cohomological representations and Wigner's lemma, the invariants ℓ₀ and q₀ and the Borel–Wallach range of tempered cohomology, the Vogan–Zuckerman classification, Clozel's description of tempered cohomological representations of GL_n(ℝ) and his purity lemma, and the coherent (𝔭_h, K)-cohomology of Hermitian groups with the GSp_4 and GSp_{2g} limits of discrete series of Calegari–Geraghty, Pilloni, Boxer–Pilloni, Boxer–Calegari–Gee–Pilloni and Scholze (red-team finding RT-AREA-automorphic-1/25). It ends with integral coefficient lattices, fields of rationality and definition, Clozel's rationality theorem and torsion Hecke eigenclasses; the last two use the Betti cohomology of locally symmetric spaces and its comparison with automorphic forms (ArithmeticLocallySymmetricSpaces ALS.1, ALS.3, ALS.5 and AutomorphicSpectralTheory AS.5, red-team finding RT-AREA-automorphic-1/30).

**Dependencies.** Inside the roadmap: AF.1, AF.1a, AF.2, AF.3. Other roadmaps and the libraries: `AdelicAlgebraicGroups:AA.1/integral-model`; `AdelicAlgebraicGroups:AA.1/integral-points-level`; `ArithmeticLocallySymmetricSpaces:ALS.1`; `ArithmeticLocallySymmetricSpaces:ALS.3`; `ArithmeticLocallySymmetricSpaces:ALS.5`; `AutomorphicLFunctionsAndLocalFactors:AL.3`; `AutomorphicSpectralTheory:AS.4`; `AutomorphicSpectralTheory:AS.5`; `ShimuraData:D3`; `ShimuraData:D5`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `mathlib:LieAlgebra.rank`; `mathlib:NumberField.InfinitePlace`; `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`; `mathlib:RootPairing`; `tauceti:TauCeti.dominantChamber`; `tauceti:TauCeti.exists_mem_dominantChamber`; Tau Ceti ReductiveGroups (layer 1 representations  comodules); Tau Ceti ReductiveGroups (layer 7 structure theory); Tau Ceti RepresentationTheory/LieHighestWeight (layer 1 cartan subalgebras and the root space decomposition); Tau Ceti RepresentationTheory/LieHighestWeight (layer 4 the classification of finite dimensional irreducibles); Tau Ceti RepresentationTheory/RootSystems (layer 4 chambers the fundamental domain and the longest element).

### Definition: Algebraic weights and the representations V_λ (planet: Algebraic highest weight)

Node `AF.4/algebraic-weight`, declaration `TauCeti.Automorphic.AlgebraicWeight` in `TauCeti/Automorphic/AlgebraicWeight`.

Let G be connected reductive over a number field F, E ⊆ ℂ a number field splitting G, and G_ℂ = (Res_{F/ℚ}G)_ℂ = ∏_{σ: F → ℂ} G ×_{F,σ} ℂ with maximal torus T = ∏_σ T_σ and Borel B. An algebraic weight is λ = (λ_σ)_σ ∈ X^*(T) = ⊕_σ X^*(T_σ); it is dominant for B if each λ_σ is. For λ dominant, V_λ = ⊗_σ V_{λ_σ} is the irreducible algebraic representation of Res_{F/ℚ}G over ℂ (defined over E) with highest weight λ. For GL_n, dominant weights are λ_σ = (λ_{σ,1} ≥ … ≥ λ_{σ,n}) ∈ ℤ^n; V_λ^∨ = V_{−w_0λ}. A weight is parallel if λ_σ is independent of σ, and regular if each λ_σ + ρ is regular.

*Hypotheses.* G split over E; fixed Borel pair (B, T) over E.

*Proof outline.*

1. Highest-weight classification of irreducible algebraic representations of split reductive groups (Tau Ceti ReductiveGroups Layer 1, ClassicalGroups for GL_n; LieHighestWeight Layer 4 for the Lie algebra).
2. Tensor products over the embeddings σ give the representations of Res_{F/ℚ}G_ℂ.
3. Duality V_λ^∨ ≅ V_{−w_0λ} from the longest Weyl element (Tau Ceti RootSystems Layer 4).

*Uses.* AF.4/cohomological-representation: coefficient systems V_λ for (𝔤, K)-cohomology. AF.4/coefficient-lattices: integral structures on V_λ. AutomorphicGaloisRepresentationsPartII:AG2.0: dominant weights (ℤ^n)^{Hom(F,Ω),+} and the representations Ξ_a. ArithmeticLocallySymmetricSpaces:ALS.1: local systems from algebraic representations with stable lattices.

*API.*

- `Automorphic.AlgebraicWeight` (data): X^*(T) for the split torus of Res_{F/ℚ}G_ℂ, indexed by embeddings σ.
- `Automorphic.AlgebraicWeight.IsDominant` (data): Dominance for the fixed Borel.
- `Automorphic.AlgebraicWeight.rep` (constructor): V_λ as an algebraic representation over E.
- `Automorphic.AlgebraicWeight.rep_dual` (relation): V_λ^∨ ≅ V_{−w_0λ}.
- `Automorphic.AlgebraicWeight.IsRegular` (data): λ_σ + ρ regular for all σ.
- `Automorphic.AlgebraicWeight.rep_highestWeight` (characterisation): V_λ is irreducible with highest weight λ and every irreducible algebraic representation is some V_λ.

*Unit tests.*

- `algWeight_gl2_dim` (computation): For GL_2/ℚ and λ = (k−2, 0), dim V_λ = k − 1.
- `algWeight_zero` (degenerate): λ = 0 gives the trivial representation.
- `algWeight_dual_gl3` (computation): For GL_3, the dual of V_{(2,1,0)} is V_{(0,−1,−2)}.
- `algWeight_not_nondominant` (non-example): λ = (0, 1) for GL_2 is not dominant; there is no irreducible representation with highest weight (0,1) for the upper-triangular Borel.

*Acceptance.* GL_2 over ℚ: λ = (k−2, 0) gives V_λ = Sym^{k−2}(std), of dimension k−1. GL_1 over a number field F: λ = (n_σ)_σ ∈ ℤ^{Hom(F,ℂ)} with V_λ the character x ↦ ∏_σ σ(x)^{n_σ}.

*Prerequisites.* Tau Ceti ReductiveGroups (layer 1 representations  comodules), Tau Ceti ReductiveGroups (layer 7 structure theory), Tau Ceti RepresentationTheory/LieHighestWeight (layer 4 the classification of finite dimensional irreducibles), Tau Ceti RepresentationTheory/RootSystems (layer 4 chambers the fundamental domain and the longest element), `mathlib:RootPairing`.

*Sources.* boxer-pilloni (§1.3.7, p. 4): “We let Vκ be the highest weight κ representation of K∞ .” — Highest-weight representations attached to algebraic weights (here of K_∞ = M_μ(ℝ)). chenevier-taibi20 (§1.4, arXiv p. 11): “Assume we have found a finite set Λ of dominant weights of G(C)” — Dominant weights of G(ℂ) indexing the coefficient representations V_λ.

### Theorem: Infinitesimal characters of algebraic weights and uniqueness of the weight

Node `AF.4/infinitesimal-character-of-weight`, declaration `TauCeti.Automorphic.AlgebraicWeight.infChar_rep` in `TauCeti/Automorphic/AlgebraicWeight`.

For λ dominant, V_λ has infinitesimal character χ_{λ+ρ} (AF.1/infinitesimal-character), and V_λ^∨ has χ_{−w_0(λ)+ρ} = χ_{−(λ+ρ)}. If an admissible (𝔤_∞, K_∞)-module π_∞ has the infinitesimal character of V_λ^∨ for some dominant λ, then λ is unique. For GL_n(F ⊗ ℝ), π_∞ has the infinitesimal character of V_λ^∨ iff the infinitesimal character at σ is the W-orbit of −(λ_σ + ρ), the multiset {−λ_{σ,i} + i − (n+1)/2 : 1 ≤ i ≤ n}.

*Hypotheses.* λ dominant.

*Proof outline.*

1. Highest-weight normalisation of AF.1/infinitesimal-character (Tau Ceti vermaCentralCharacter).
2. Uniqueness: two dominant weights λ, μ with χ_{λ+ρ} = χ_{μ+ρ} have μ + ρ ∈ W(λ + ρ); both are strictly dominant, so they are equal (Tau Ceti dominantChamber is a strict fundamental domain on the open chamber).
3. Duality: χ_{−w_0(λ)+ρ} = χ_{−w_0(λ+ρ)} = χ_{−(λ+ρ)}.

*Acceptance.* GL_2: V_{(k−2,0)} = Sym^{k−2} has infinitesimal character χ_{(k−3/2, −1/2)}, the W-orbit {(k−3/2, −1/2), (−1/2, k−3/2)}. Two non-isomorphic algebraic representations have different infinitesimal characters.

*Prerequisites.* `AF.4/algebraic-weight`, `AF.1/infinitesimal-character`, `tauceti:TauCeti.dominantChamber`, `tauceti:TauCeti.exists_mem_dominantChamber`, Tau Ceti RepresentationTheory/RootSystems (layer 4 chambers the fundamental domain and the longest element).

*Sources.* bcg25 (§1, arXiv p. 1): “weight zero means that π∞ has the same infinitesimal character as the trivial representation.” — Weights of automorphic representations defined through the infinitesimal character of an algebraic representation. boxer-pilloni (§1.3.3, p. 3): “This is the dominant representative of the infinitesimal character of automorphic forms contributing to the coherent cohomology in weight κ.” — Dominant representatives of infinitesimal characters.

### Definition: C-algebraic and L-algebraic representations (planet: C-algebraic and L-algebraic)

Node `AF.4/c-l-algebraic`, declaration `TauCeti.Automorphic.IsCAlgebraic` in `TauCeti/Automorphic/AlgebraicWeight`.

Let π be an irreducible admissible (𝔤_∞, K_∞)-module (or an automorphic representation) of G over a number field F, with infinitesimal character at each embedding σ represented by μ_σ ∈ X^*(T)⊗ℂ. π is L-algebraic if μ_σ ∈ X^*(T) for all σ, and C-algebraic if μ_σ − ρ ∈ X^*(T) for all σ. When ρ ∈ X^*(T) the two notions agree; when ρ ∉ X^*(T) but G has a twisting element (a character θ with θ − ρ ∈ X^*(T)^W-translate, for GL_n the character |det|^{(n−1)/2}), π is C-algebraic iff π ⊗ |det|^{(n−1)/2} (more generally π ⊗ θ) is L-algebraic: the half-root twist. For GL_n(ℝ), a Harish-Chandra module V is algebraic in the sense of Chenevier–Taïbi if the centre ℝ^× ⊆ W_ℝ acts by ±1 homotheties in L(V); a cuspidal π of PGL_m over ℚ is algebraic if the eigenvalues of its infinitesimal character lie in ½ℤ with integral differences.

*Hypotheses.* G connected reductive over F; Borel pair over a splitting field.

*Proof outline.*

1. State the two integrality conditions on the infinitesimal character parameter.
2. Twisting element for GL_n: |det|^{(n−1)/2} shifts the parameter by ((n−1)/2, …, (n−1)/2), turning ρ-integrality into integrality.
3. Comparison with Chenevier–Taïbi's definition via the archimedean correspondence (AF.1/archimedean-llc-gln, property (v)).

*Uses.* AutomorphicGaloisRepresentationsPartII:AG2.0: C-algebraic/L-algebraic distinction and the half-root twist in the normalisation of r_{π,ι}. AF.4/clozel-purity: purity of algebraic cuspidal representations. GL2AutomorphicRepresentationsAndTransfer:R16.6: the ε·cyclotomic^{k−1} determinant normalisation bridge.

*API.*

- `Automorphic.IsLAlgebraic` (data): Infinitesimal character parameters in X^*(T).
- `Automorphic.IsCAlgebraic` (data): Infinitesimal character parameters in ρ + X^*(T).
- `Automorphic.isCAlgebraic_iff_isLAlgebraic_twist` (relation): For GL_n: C-algebraic π ↔ L-algebraic π ⊗ |det|^{(n−1)/2}.
- `Automorphic.isLAlgebraic_iff_of_rho_integral` (characterisation): If ρ ∈ X^*(T) the two notions coincide.
- `Automorphic.IsAlgebraicCT_compat` (compatibility): For GL_n(ℝ), L-algebraic ↔ Chenevier–Taïbi algebraic up to the twist by |det|^{w/2}.

*Unit tests.*

- `algebraic_gl1` (compatibility): For GL_1, C-algebraic = L-algebraic = type A_0 (Tau Ceti HeckeCharacter.IsAlgebraic).
- `algebraic_trivial_gl2` (computation): The trivial representation of GL_2(𝔸_ℚ) has infinitesimal character (1/2, −1/2): C-algebraic, not L-algebraic; |det|^{1/2} is L-algebraic.
- `algebraic_sl2_rho_integral` (degenerate): For SL_2, X^*(T) = ℤ·(α/2) contains ρ = α/2, so C- and L-algebraic agree; for PGL_2, X^*(T) = ℤα does not contain ρ and they differ.
- `algebraic_maass_not` (non-example): A Maass cusp form with Laplace eigenvalue 1/4 + r², r > 0 real, has infinitesimal character (ir, −ir) and is neither C- nor L-algebraic.

*Acceptance.* GL_2/ℚ: for a weight-k newform with the unitary normalisation, π_∞ = D_k has infinitesimal character ((k−1)/2, −(k−1)/2); for k even π is C-algebraic and not L-algebraic, and π ⊗ |det|^{1/2} is L-algebraic. GL_1: a Hecke character is C-algebraic iff L-algebraic iff of Weil type A_0 (Tau Ceti GlobalNumberFields Layer 10 HeckeCharacter.IsAlgebraic).

*Prerequisites.* `AF.4/infinitesimal-character-of-weight`, `AF.1/archimedean-llc-gln`, `AF.1/weil-group-real`.

*Sources.* chenevier-taibi20 (§2.1, arXiv p. 13): “We say that the Harish-Chandra module V is algebraic if every element in the center R× of WR acts as a homothety with factor ±1 in L(V ).” — Algebraicity at infinity for GL_n(ℝ). chenevier-taibi20 (§1.2, arXiv p. 5): “We say that π is algebraic if the infinitesimal character of π∞ , that we may view following Harish-Chandra and Langlands as a semi-simple conjugacy class in Mm (C), has its eigenvalues in 21 Z, say w1 ≥ w2 ≥ · · · ≥ wm , and with wi − wj ∈ Z.” — Algebraicity of cuspidal π of PGL_m (the PDF renders ½ℤ as '21 Z').

### Definition: Cohomological representations (planet: Cohomological representation)

Node `AF.4/cohomological-representation`, declaration `TauCeti.Automorphic.IsCohomological` in `TauCeti/Automorphic/Cohomological`.

An irreducible admissible (𝔤_∞, K_∞)-module π_∞ is cohomological if there is an irreducible finite-dimensional algebraic representation V of Res_{F/ℚ}G_ℂ with H^•(𝔤_∞, K_∞; π_∞ ⊗ V) ≠ 0 (relative Lie algebra cohomology, AF.1a). An automorphic representation π is cohomological if π_∞ is. By Wigner's lemma (AF.4/wigner-lemma), V is then determined up to the K_∞-component action: π_∞ has the infinitesimal character of V^∨.

*Hypotheses.* G connected reductive over F, K_∞ maximal compact.

*Proof outline.*

1. Predicate defined via AF.1a/relative-lie-cochain-complex with coefficients π_∞ ⊗ V (tensor product of a (𝔤, K)-module with a finite-dimensional one).
2. For disconnected K_∞ record both H^•(𝔤, K_∞) and H^•(𝔤, K_∞°) (the component group acts on the latter).

*Uses.* AF.4/borel-wallach-tempered-range: degrees of cohomology of tempered cohomological representations. AF.4/clozel-rationality: rationality of cohomological cuspidal representations. AutomorphicGaloisRepresentationsPartII:AG2.0: regular algebraic = cohomological for GL_n. ArithmeticLocallySymmetricSpaces:ALS.5: cuspidal cohomology of X_K decomposes over cohomological π.

*API.*

- `Automorphic.IsCohomological` (data): ∃ V irreducible algebraic, H^•(𝔤, K; π ⊗ V) ≠ 0.
- `Automorphic.IsCohomological.coefficient` (projection): The coefficient V (unique up to the K_∞/K_∞° ambiguity) as a function of π.
- `Automorphic.IsCohomological.infChar` (characterisation): π cohomological for V ⇒ π has the infinitesimal character of V^∨.
- `Automorphic.IsCohomological.twist` (functoriality): Twisting π by an algebraic character χ changes V to V ⊗ χ^{-1}.

*Unit tests.*

- `cohomological_trivial` (degenerate): The trivial representation is cohomological for V = ℂ (H^0 = ℂ).
- `cohomological_D_k` (computation): D_k of GL_2(ℝ) is cohomological exactly for V = Sym^{k−2} ⊗ det^m (k ≥ 2).
- `cohomological_D1_not` (non-example): The limit of discrete series D_1 of GL_2(ℝ) is not cohomological: its infinitesimal character (0, 0) is not that of any V^∨ (which would need (a + 1/2, b − 1/2) with a ≥ b).
- `cohomological_ip_compat` (compatibility): For unitary π the definition agrees with Ichino–Prasanna §7.1 (Vogan–Zuckerman's class).

*Acceptance.* Finite-dimensional V^∨ itself is cohomological for V (H^0 ≠ 0). The discrete series D_k of GL_2(ℝ) is cohomological for V = Sym^{k−2}, with H^1(𝔤𝔩_2, SO(2)·ℝ_{>0}; D_k ⊗ Sym^{k−2}) of dimension 2 (and of dimension 1 after taking O(2)-invariants).

*Prerequisites.* `AF.1a/relative-lie-cochain-complex`, `AF.4/algebraic-weight`, `AF.1/admissible-gk-module`.

*Sources.* ichino-prasanna23 (§7.1, arXiv p. 40): “We consider an irreducible unitary (g, K)-module π such that the relative Lie algebra cohomology H ∗ (g, K; π ⊗ F ) is non-zero for some irreducible finite-dimensional representation F of G. Such (g, K)-modules are called cohomological” — Definition (for unitary π, the case classified by Vogan–Zuckerman).

### Theorem: Wigner's lemma

Node `AF.4/wigner-lemma`, declaration `TauCeti.Automorphic.infChar_eq_of_relativeCohomology_ne_zero` in `TauCeti/Automorphic/Cohomological`.

Let V be an admissible (𝔤, K)-module with infinitesimal character χ and F a finite-dimensional (𝔤, K)-module with infinitesimal character χ_F. If H^•(𝔤, K; V ⊗ F^∨) ≠ 0 (equivalently Ext^•_{(𝔤,K)}(F, V) ≠ 0), then χ = χ_F. More generally Z(𝔤) acts on H^•(𝔤, K; V ⊗ F^∨) through both χ and χ_F, so the cohomology vanishes unless they agree.

*Hypotheses.* V, F as stated.

*Proof outline.*

1. H^•(𝔤, K; V ⊗ F^∨) = Ext^•_{(𝔤,K)}(F, V) (AF.1a/relative-cohomology-functoriality (iv)).
2. Z(𝔤) acts on Ext^•(F, V) through its action on either argument (Yoneda: centre acts on the category by natural endomorphisms).
3. If χ ≠ χ_F pick z with χ(z) ≠ χ_F(z); z − χ(z) acts by 0 and by χ_F(z) − χ(z) ≠ 0, so Ext vanishes.

*Acceptance.* H^•(𝔰𝔩_2, SO(2); D_k ⊗ Sym^{m}) = 0 unless m = k − 2. For G compact, H^0(𝔤, K; V ⊗ F^∨) = Hom_G(F, V) and the lemma is Schur's lemma for infinitesimal characters.

*Prerequisites.* `AF.1a/relative-cohomology-functoriality`, `AF.1/infinitesimal-character`.

*Sources.* ichino-prasanna23 (§7.1, arXiv p. 40): “We consider an irreducible unitary (g, K)-module π such that the relative Lie algebra cohomology H ∗ (g, K; π ⊗ F ) is non-zero for some irreducible finite-dimensional representation F of G.” — Context: nonvanishing forces the infinitesimal character of F^∨ (Borel–Wallach I.4.1, as used).

### Definition: The invariants ℓ₀ and q₀

Node `AF.4/l0-q0-invariants`, declaration `TauCeti.Automorphic.ell0` in `TauCeti/Automorphic/Cohomological`.

For a real reductive group (G_∞, K_∞) with A_∞ the identity component of the real points of the maximal ℚ-split torus in the centre of Res_{F/ℚ}G: ℓ₀ = rank G_∞ − rank K_∞ − rank A_∞ (absolute ranks of real Lie groups: dimensions of Cartan subalgebras), and q₀ is defined by 2q₀ + ℓ₀ = dim G_∞/K_∞A_∞, the dimension of the symmetric space. For Res_{F/ℚ}PGL_n with F of signature (r_1, r_2): ℓ₀ = r_1·⌊(n−1)/2⌋ + r_2(n−1) (that is r_1(n−1)/2 for n odd, r_1(n−2)/2 for n even, plus r_2(n−1)) and 2q₀ + ℓ₀ = r_1(n² − 1 − n(n−1)/2) + r_2(n² − 1). For F imaginary CM of degree 2d: ℓ₀ = d(n − 1), 2q₀ + ℓ₀ = d(n² − 1), q₀ = d(n² − n)/2. For PGL_2 over a number field H, ℓ₀ = r_2(H), the number of complex places.

*Hypotheses.* G_∞ real reductive with maximal compact K_∞.

*Proof outline.*

1. Absolute ranks via Mathlib LieAlgebra.rank of the complexified Lie algebras (rank SL_n(ℝ) = n − 1, rank SO_n(ℝ) = ⌊n/2⌋, rank SL_n(ℂ) = 2(n−1) as a real group, rank SU_n = n − 1).
2. Dimensions: dim SL_n(ℝ) − dim SO_n(ℝ) = n² − 1 − n(n−1)/2; dim SL_n(ℂ) − dim SU_n = n² − 1.
3. Signature bookkeeping from Mathlib NumberField.InfinitePlace (nrRealPlaces + 2·nrComplexPlaces = [F:ℚ]); for H ⊋ F with F imaginary quadratic, r_2(H) = [H:ℚ]/2 ≥ 2.

*Uses.* AF.4/borel-wallach-tempered-range: the degree range [q₀, q₀ + ℓ₀]. GL2ModularityLifting:R32.3: ℓ₀ > 0 patching (Calegari–Geraghty) for PGL_2 over imaginary quadratic fields. ArithmeticLocallySymmetricSpaces:ALS.0: dim X_K = 2q₀ + ℓ₀.

*API.*

- `Automorphic.ell0` (data): ℓ₀ = rank G_∞ − rank K_∞ − rank A_∞.
- `Automorphic.q0` (data): q₀ with 2q₀ + ℓ₀ = dim G_∞/K_∞A_∞.
- `Automorphic.ell0_resPGL` (example): The closed formula for Res_{F/ℚ}PGL_n in terms of (r_1, r_2) and n.
- `Automorphic.ell0_PGL2` (example): ℓ₀(Res_{H/ℚ}PGL_2) = r_2(H).
- `Automorphic.two_q0_add_ell0` (characterisation): 2q₀ + ℓ₀ is the dimension of the symmetric space, so q₀ is an integer.

*Unit tests.*

- `ell0_PGL2_Q` (computation): ℓ₀(PGL_2/ℚ) = 0 and q₀ = 1.
- `ell0_imag_quad` (computation): ℓ₀(Res_{F/ℚ}PGL_2) = 1, q₀ = 1 for F imaginary quadratic.
- `ell0_compact` (degenerate): For G_∞ compact modulo centre, ℓ₀ = 0 = q₀.
- `ell0_not_split_rank` (non-example): Reading 'rank' as ℝ-split rank gives the wrong value: for SL_2(ℂ), split rank 1 and rank SU_2 = 1 would give ℓ₀ = 0, but the absolute rank of SL_2(ℂ) as a real group is 2, giving ℓ₀ = 1.

*Acceptance.* PGL_2/ℚ: ℓ₀ = 0, q₀ = 1 (the upper half-plane). PGL_2 over an imaginary quadratic field: ℓ₀ = 1, q₀ = 1 (hyperbolic 3-space, cohomology in degrees 1 and 2). PGL_3/ℚ: ℓ₀ = 1, 2q₀ + ℓ₀ = 5, q₀ = 2.

*Prerequisites.* `AF.1/real-reductive-group`, `mathlib:LieAlgebra.rank`, `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`.

*Sources.* cg18 (§8.4, arXiv p. 80): “2q0 + l0 is the (real) dimension of the lo- cally symmetric space associated to G := ResF/Q (PGL(n)),” — Definition and meaning of ℓ₀ and q₀ for Res_{F/ℚ}PGL(n). cg18 (§1, arXiv p. 3): “l0 = rank(G) − rank(K) − rank(A) is arbitrary,” — The general invariant (printed with rank(G); read as ranks of real Lie groups, PAPER-CALEGARI-GERAGHTY-18 E2). cg20-appendix (§A.3.1, arXiv p. 4): “Let l0 := d (rank(SLn (C)) − rank(SUn (C))) = d(n − 1),” — The imaginary CM case.

### Theorem: Cohomology of tempered cohomological representations (Borel–Wallach) (planet: Borel–Wallach tempered range)

Node `AF.4/borel-wallach-tempered-range`, declaration `TauCeti.Automorphic.relativeCohomology_tempered_range` in `TauCeti/Automorphic/Cohomological`.

Let π_∞ be an irreducible tempered (𝔤, K_∞)-module that is cohomological for V (AF.4/cohomological-representation). Then H^q(𝔤, K_∞°; π_∞ ⊗ V) ≠ 0 exactly for q ∈ [q₀, q₀ + ℓ₀], where dim H^{q₀+i} = binom(ℓ₀, i)·dim H^{q₀} (Delorme's lemma and Borel–Wallach III.5.1, VII.6.7). Consequently a cuspidal automorphic π tempered at ∞ contributes to cuspidal cohomology only in degrees [q₀, q₀ + ℓ₀]; if π contributes in a degree outside this range then π_∞ is not tempered.

*Hypotheses.* π_∞ tempered and cohomological.

*Proof outline.*

1. Tempered cohomological representations are fundamental series: π_∞ = Ind_P^G(δ ⊗ ν) with δ a discrete series (or limit) of the Levi of the fundamental parabolic and ν unitary (AF.1/langlands-classification, AF.1/discrete-series).
2. Delorme's lemma (Shapiro for (𝔤,K)-cohomology of induced modules) reduces to the discrete series of the Levi, which has cohomology in the middle degree only, tensored with ∧^•(𝔞^*) of the split part, giving binom(ℓ₀, i).
3. Proof sources Borel–Wallach III.5.1 and VII.6.7 are not freely available: recorded with the proof route (gap).

*Acceptance.* PGL_2 over an imaginary quadratic field: tempered cohomological π_∞ contribute in degrees 1 and 2 (ℓ₀ = 1, q₀ = 1). PGL_2/ℚ: D_k contributes in degree 1 only (ℓ₀ = 0, q₀ = 1). The trivial representation of PGL_2/ℚ (non-tempered) contributes in degrees 0 and 2, outside [1, 1].

*Prerequisites.* `AF.4/cohomological-representation`, `AF.4/l0-q0-invariants`, `AF.1/tempered-square-integrable`, `AF.1/langlands-classification`, `AF.4/wigner-lemma`.

*Sources.* cg18 (§8.4, arXiv p. 80): “and [q0 , . . . , q0 + l0 ] is the range such that cuspidal automorphic π for G which are tempered at ∞ contribute to” — The tempered range, citing Borel–Wallach [9] Theorem VII.6.7. cg20-appendix (§A.3.1, proof of Lemma A.3, arXiv p. 5): “Because of the degree where [c] occurs, we deduce (from [BW80, Ch.II, Prop 3.1] and [Clo90, Lemma 3.14]) that Π is not tempered.” — Cohomology outside [q₀, q₀ + ℓ₀] comes from non-tempered Π.

### Theorem: Vogan–Zuckerman classification of unitary cohomological representations

Node `AF.4/vogan-zuckerman`, declaration `TauCeti.Automorphic.voganZuckerman` in `TauCeti/Automorphic/Cohomological`.

Let G be connected real reductive with maximal compact K, 𝔤 = 𝔨 ⊕ 𝔭, and 𝔱 ⊆ 𝔨 a Cartan subalgebra. For a θ-stable parabolic 𝔮 = 𝔩 ⊕ 𝔲 (non-negative eigenspaces of ad x, x ∈ i𝔱_0) and λ ∈ 𝔩^* the differential of a unitary character of L with ⟨α, λ|_𝔱⟩ ≥ 0 for α ∈ Δ(𝔲), there is a unique irreducible unitary (𝔤, K)-module A_𝔮(λ) with infinitesimal character λ|_𝔱 + ρ containing the K-type of highest weight λ|_𝔱 + 2ρ(𝔲 ∩ 𝔭), all of whose K-types have highest weights λ|_𝔱 + 2ρ(𝔲∩𝔭) + Σ_{α ∈ Δ(𝔲∩𝔭)} n_α α (n_α ≥ 0). Every irreducible unitary (𝔤, K)-module π with H^•(𝔤, K; π ⊗ F^∗) ≠ 0 for an irreducible finite-dimensional F of highest weight γ is some A_𝔮(λ) with λ|_𝔱 = γ, and H^i(𝔤, K; A_𝔮(λ) ⊗ F^∗) ≅ Hom_{L∩K}(∧^{i−R}(𝔩 ∩ 𝔭), ℂ) with R = dim(𝔲 ∩ 𝔭). When G/K is Hermitian, 𝔭 = 𝔭^+ ⊕ 𝔭^−, and with R^± = dim(𝔲 ∩ 𝔭^±), H^{p,q}(𝔤, K; A_𝔮(λ) ⊗ F^∗) ≅ Hom_{L∩K}(∧^{2i}(𝔩 ∩ 𝔭), ℂ) for (p,q) = (i + R^+, i + R^−), and H^{p,q} = 0 if p − q ≠ R^+ − R^−.

*Hypotheses.* G connected; π unitary irreducible.

*Proof outline.*

1. Construction of A_𝔮(λ) by cohomological induction (Zuckerman functors) and unitarity (Vogan).
2. Classification: Vogan–Zuckerman 1984, Theorem 5.6 (and Theorem 5.3 for the K-types); cohomology computation Theorem 3.3/Proposition 6.19 for the Hodge decomposition.
3. Statements recorded from Ichino–Prasanna §7.1, who quote Vogan–Zuckerman; the scanned original was consulted for orientation (gap for a full proof decomposition).

*Acceptance.* SL_2(ℝ): 𝔮 = 𝔤 gives the trivial representation (A_𝔤(0) = ℂ); 𝔮 = Borel θ-stable gives D_2^± with H^1 one-dimensional of Hodge type (1,0) resp. (0,1). For U(p, q) the A_𝔮(λ) with 𝔩 = 𝔲(p_1, q_1) ⊕ 𝔲(p_2, q_2) contribute to the Hodge types predicted by (R^+, R^−).

*Prerequisites.* `AF.4/cohomological-representation`, `AF.4/wigner-lemma`, `AF.1/real-reductive-group`, `AF.1/infinitesimal-character`.

*Sources.* ichino-prasanna23 (§7.1, arXiv p. 40): “Such (g, K)-modules are called cohomological and classified by Vogan-Zuckerman [65].” — The classification, with the modules A_𝔮(λ) and their cohomology stated in §7.1. vogan-zuckerman (Theorem 5.6 and Proposition 6.19 (Numdam scan)): “Unitary representations with non-zero cohomology” — Title of the source of the classification and Hodge computation.

### Theorem: Tempered cohomological representations of GL_n(ℝ) (Clozel)

Node `AF.4/gln-tempered-cohomological`, declaration `TauCeti.Automorphic.GLn.temperedCohomological` in `TauCeti/Automorphic/Cohomological`.

Let π_∞ be a tempered irreducible representation of GL_n(ℝ) with the infinitesimal character of the trivial representation and nonzero (𝔤𝔩_n, SO(n))-cohomology. If n is even, π_∞ is unique up to isomorphism, its restriction to GL_n(ℝ)° is a sum of two irreducibles, and its (𝔤𝔩_n, SO(n))-cohomology is a free ℂ[O(n)/SO(n)] ≅ ℂ[ℤ/2]-module. If n is odd, there are exactly two such π_∞, differing by the sign character, and O(n)/SO(n) acts on the cohomology of one trivially and of the other by −1. If π is a cuspidal automorphic representation of GL_n/ℚ of weight zero (π_∞ with trivial infinitesimal character), then π_∞ is one of these, in particular H^•(𝔰𝔩_n, SO(n); π_∞) ≠ 0.

*Hypotheses.* π_∞ tempered; infinitesimal character ρ.

*Proof outline.*

1. Tempered representations of GL_n(ℝ) with regular integral infinitesimal character: by AF.1/archimedean-llc-gln, the parameter is ⊕ of Ind(z^{p}z̄^{−p}) with distinct p ∈ ½ℤ_{>0} plus, for n odd, a character sgn^ε; determined by the infinitesimal character except for ε.
2. Cohomology: fundamental series (AF.4/borel-wallach-tempered-range) and the O(n)/SO(n) action through the central character at −1 (n odd) or the two components (n even); Clozel Lemme 3.14.
3. Cuspidal case: π_∞ is generic and unitary, hence by Vogan's classification (AF.1/vogan-generic-unitary-dual) and Clozel's purity (AF.4/clozel-purity) tempered.

*Acceptance.* n = 2: π_∞ = D_2, and H^1(𝔤𝔩_2, SO(2); D_2) ≅ ℂ[ℤ/2] (holomorphic and antiholomorphic classes exchanged by the reflection). n = 1: π_∞ ∈ {1, sgn}, cohomology in degree 0, O(1)/SO(1) = {±1} acting by π_∞(−1).

*Prerequisites.* `AF.4/borel-wallach-tempered-range`, `AF.1/archimedean-llc-gln`, `AF.1/vogan-generic-unitary-dual`, `AF.4/clozel-purity`.

*Sources.* bcg25 (§1, Remark 1.2, arXiv p. 4): “If n is even, there is a unique tempered cohomological π∞ , and the (gln , SO(n))- cohomology is free as a C[O(n)/ SO(n)] ≃ C[Z/2Z]-module.” — Even case. bcg25 (§1, Remark 1.2, arXiv p. 4): “There are now two tempered cohomological π∞ which differ by a twist by the sign character of GLn (R), and the action of O(n)/ SO(n) on (gln , SO(n))-cohomology is either trivial or by −1.” — Odd case.

### Theorem: Clozel's purity lemma

Node `AF.4/clozel-purity`, declaration `TauCeti.Automorphic.clozelPurity` in `TauCeti/Automorphic/Cohomological`.

Let Π be a cuspidal automorphic representation of GL_n(𝔸_F) which is algebraic in Clozel's sense (its archimedean infinitesimal characters satisfy the integrality of AF.4/c-l-algebraic). Then Π_∞ is essentially tempered and pure: at each archimedean place the restriction of its L-parameter to ℂ^× is ⊕_i z^{p_i} z̄^{q_i} with p_i + q_i = w independent of i (and of the place).

*Hypotheses.* Π cuspidal, algebraic.

*Proof outline.*

1. Π_∞ is unitary generic (cuspidal: Whittaker models exist for GL_n by Shalika–Piatetski-Shapiro; the global Whittaker expansion is AutomorphicLFunctionsAndLocalFactors AL.3's), hence of Vogan's form (AF.1/vogan-generic-unitary-dual) with complementary exponents 0 < β < 1/2.
2. Algebraicity forces the infinitesimal character exponents to lie in ½ℤ with integral differences, which excludes 0 < β < 1/2 shifts; hence all β = 0 and Π_∞ is essentially tempered; purity follows.
3. Proof source Clozel, Motifs et formes automorphes, Lemme 4.9 (Ann Arbor 1988) not freely available (gap).

*Acceptance.* GL_2/ℚ, π from a holomorphic newform of weight k: π_∞ = D_k ⊗ |det|^{s} is tempered after the unitary twist, weight w = k − 1. Non-algebraic Maass forms are not covered: the lemma says nothing about Selberg's eigenvalue conjecture.

*Prerequisites.* `AF.4/c-l-algebraic`, `AF.1/vogan-generic-unitary-dual`, `AF.1/archimedean-llc-gln`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

*Sources.* cg20 (§7.2, proof of Theorem 7.11, arXiv p. 40): “By Clozel’s Purity Lemma [Clo90, Lemme 4.9], π e∞ is essentially tempered.” — Statement as used. chenevier-taibi20 (§2.1, arXiv p. 13): “Clozel’s purity lemma (or the Archimedean Jacquet-Shalika estimates) shows that the Harish- Chandra module π∞ is algebraic in the sense above if, and only if, π is algebraic in the sense of §1.2” — Purity and the two notions of algebraicity.

### Definition: Compact and noncompact roots for Hermitian real groups

Node `AF.4/hermitian-positive-system`, declaration `TauCeti.Automorphic.Hermitian.IsHCPositive` in `TauCeti/Automorphic/CoherentCohomological`.

Let G be real reductive with rank G = rank K and G/K Hermitian, H ⊆ K a compact Cartan subgroup, and 𝔤_ℂ = 𝔨_ℂ ⊕ 𝔭^+ ⊕ 𝔭^− the Harish-Chandra decomposition. The roots Φ of H_ℂ on 𝔤_ℂ split into compact roots Φ_c (occurring in 𝔨_ℂ) and noncompact roots Φ_n (in 𝔭^+ ⊕ 𝔭^−). A Harish-Chandra positive system is a positive system Φ^+ with Φ_n^+ = Φ^+ ∩ Φ_n equal to the set of roots of 𝔭^+; Φ_n^+ is forced, while the compact part Φ_c^+ is an additional choice. For GSp_4(ℝ) in the coordinates of Calegari–Geraghty: Φ = {±(2,0;0), ±(0,2;0), ±(1,1;0), ±(1,−1;0)}, Φ_c = {±(1,−1;0)}, Φ_n^+ = {(0,2;0), (1,1;0), (2,0;0)}, and either compact root may be declared positive (Calegari–Geraghty choose (1,−1;0)). The Hodge parabolic 𝔭_h = 𝔨_ℂ ⊕ 𝔭^− (resp. ⊕ 𝔭^+) is θ-stable and (𝔭_h, K) is a pair.

*Hypotheses.* rank G = rank K; G/K Hermitian symmetric.

*Proof outline.*

1. Harish-Chandra decomposition of 𝔭_ℂ under the centre of 𝔨 (from ShimuraData D2/D3 Hodge decomposition of 𝔤_ℂ under ad h).
2. Root decomposition relative to the compact Cartan H (Tau Ceti LieHighestWeight Layer 1 root spaces over ℂ).
3. Explicit GSp_4 computation: C⁻¹h(t_1, t_2; 0)C = diag(−it_1, −it_2, it_2, it_1).

*Uses.* AF.4/gsp4-discrete-series: parameters π(λ, C) are relative to Weyl chambers of this root system. AF.4/bhr-coherent-cohomology: the degree i = #(Φ(C)^+ ∩ Φ_n^+). CoherentCohomologyOfShimuraVarieties: Harris's automorphic description of coherent cohomology.

*API.*

- `Automorphic.Hermitian.compactRoots` (data): Φ_c ⊆ Φ.
- `Automorphic.Hermitian.noncompactRoots` (data): Φ_n = Φ \ Φ_c.
- `Automorphic.Hermitian.IsHCPositive` (data): Positive systems with Φ_n^+ = roots of 𝔭^+.
- `Automorphic.Hermitian.hodgeParabolic` (constructor): The pair (𝔨_ℂ ⊕ 𝔭^−, K).
- `Automorphic.Hermitian.gsp4_roots` (example): The explicit GSp_4(ℝ) roots in Calegari–Geraghty coordinates.

*Unit tests.*

- `hermitian_sl2` (degenerate): For SL_2(ℝ), Φ_c = ∅.
- `hermitian_gsp4_count` (computation): For GSp_4(ℝ), |Φ_c| = 2 and |Φ_n^+| = 3.
- `hermitian_choice_not_forced` (non-example): The compact positive root is not determined by 𝔭^+: both (1,−1;0) and (−1,1;0) give Harish-Chandra positive systems.
- `hermitian_pilloni_compat` (compatibility): Pilloni's lower-triangular system {e_2 − e_1, −2e_1 + e_3, −e_1 − e_2 + e_3, −2e_2 + e_3} with ρ = (−2, −1; 0) is conjugate to Calegari–Geraghty's.

*Acceptance.* SL_2(ℝ): Φ_c = ∅, Φ_n^+ = {α} with 𝔭^+ the holomorphic tangent direction. GSp_4(ℝ): both choices Φ_c^+ = {(1,−1;0)} and {(−1,1;0)} are Harish-Chandra positive systems with the same Φ_n^+ (Calegari–Geraghty write 'forced'; sourceIssues E3).

*Prerequisites.* `AF.1/real-reductive-group`, `AF.1a/gk-pair`, `ShimuraData:D3`, Tau Ceti RepresentationTheory/LieHighestWeight (layer 1 cartan subalgebras and the root space decomposition).

*Sources.* cg20 (§2.2, arXiv p. 8 (Duke p. 810)): “The compact roots Φc are those appearing in khC , while the non-compact roots Φn are those appearing in p+ ⊕ p− .” — Definition of compact and noncompact roots and the positive system. cg20 (§2.2, arXiv p. 8): “We are then forced to take Φ+ to be the set of roots appearing in C(Lie B)C −1” — Their choice; only Φ_n^+ is forced.

### Construction: (𝔭_h, K)-cohomology and the L²/cuspidal coherent cohomology spaces

Node `AF.4/coherent-relative-cohomology`, declaration `TauCeti.Automorphic.coherentCohomology` in `TauCeti/Automorphic/CoherentCohomological`.

For a Hermitian G with Hodge parabolic 𝔭_h = 𝔨_ℂ ⊕ 𝔭^− (Lie Q^− = 𝔨^h_ℂ ⊕ 𝔭^−), a (𝔤, K)-module W and a finite-dimensional K-representation V_σ, H^•(𝔭_h, K; W ⊗ V_σ) is the relative Lie algebra cohomology of the pair (𝔭_h, K) (AF.1a) with W restricted to 𝔭_h, computed by Hom_K(∧^•(𝔭_h/𝔨_ℂ), W ⊗ V_σ) = Hom_K(∧^•𝔭^−, W ⊗ V_σ) (Harris's ∂̄-cohomology). Globally, H^i_{(2),σ} = H^i(𝔭_h, K; A_{(2)}(G) ⊗ V_σ) and H^i_{cusp,σ} = H^i(𝔭_h, K; A_0(G) ⊗ V_σ), with A_{(2)}(G) the square-integrable automorphic forms (AutomorphicSpectralTheory AS.4) and A_0(G) the cusp forms (AF.3).

*Hypotheses.* G Hermitian, K = K^h.

*Proof outline.*

1. Apply AF.1a/relative-lie-cochain-complex to the pair (𝔭_h, K) of AF.4/hermitian-positive-system.
2. Global spaces by applying the functor to A_{(2)}(G) and A_0(G); functoriality in G(𝔸_f) gives Hecke modules.

*Uses.* AF.4/bhr-coherent-cohomology: computation for (limits of) discrete series. IntegralCoherentHeckeComplexes: Harris's automorphic description of coherent cohomology (Theorem 3.10.1 of BCGP21). HigherHidaAndColemanTheory: classical coherent cohomology in higher Hida theory.

*API.*

- `Automorphic.coherentCohomology` (constructor): H^•(𝔭_h, K; W ⊗ V_σ) as relative Lie algebra cohomology of (𝔭_h, K).
- `Automorphic.coherentCohomology_eq` (characterisation): Hom_K(∧^•𝔭^−, W ⊗ V_σ) computes it.
- `Automorphic.coherentCohomology_L2` (constructor): H^i_{(2),σ} and H^i_{cusp,σ} with their G(𝔸_f)-actions.
- `Automorphic.coherentCohomology_cusp_to_L2` (functoriality): The map H^i_{cusp,σ} → H^i_{(2),σ} induced by A_0 ⊆ A_{(2)}.

*Unit tests.*

- `coherent_sl2_H0` (computation): H^0(𝔭_h, SO(2); D_k ⊗ χ_{−k}) = ℂ for the holomorphic discrete series.
- `coherent_trivial_module` (degenerate): For W = ℂ trivial and V_σ trivial, H^i(𝔭_h, K; ℂ) = (∧^i 𝔭^{−,*})^K.
- `coherent_not_gK` (non-example): (𝔭_h, K)-cohomology differs from (𝔤, K)-cohomology: for SL_2(ℝ), H^0(𝔭_h, K; D_k ⊗ χ_{−k}) = ℂ while H^0(𝔤, K; D_k ⊗ V) = 0 for every finite-dimensional V.

*Acceptance.* SL_2(ℝ)/GL_2: H^0(𝔭_h, K; D_k ⊗ V_σ) for σ = weight −k recovers holomorphic weight-k forms (H^0) and H^1 the antiholomorphic ones. For GSp_4, the spaces H^i_{cusp,σ} with i ∈ {0,1,2,3}.

*Prerequisites.* `AF.1a/relative-lie-cochain-complex`, `AF.4/hermitian-positive-system`, `AF.3/cusp-form`, `AutomorphicSpectralTheory:AS.4`.

*Sources.* cg20 (§5.3, arXiv p. 19 (Duke p. 825)): “H i (Lie Q− , K h ; A(2) (G) ⊗ Vσ )” — Definition of H^i_{(2),σ} and H^i_{cusp,σ}. pilloni20 (§15.2.2, p. 108): “Let W be a (g, K∞ )-module. Then one can define the (p, K∞ )-cohomology of W , denoted by H• (p, K∞ ; W ) (see [30], sect. 4.1.1).” — (𝔭, K_∞)-cohomology after Harris [30].

### Construction: (Limits of) discrete series of GSp_4(ℝ) and their parameters

Node `AF.4/gsp4-discrete-series`, declaration `TauCeti.Automorphic.GSp4.dsRep` in `TauCeti/Automorphic/CoherentCohomological`.

In the coordinates (a, b; c) of X^*(T) ⊗ ℝ ≅ ℝ³ with X^*(T) = {(a_1, a_2; c) : c ≡ a_1 + a_2 mod 2}: the closed chambers C_0 = {a ≥ b ≥ 0}, C_1 = {a ≥ −b ≥ 0}, C_2 = {−b ≥ a ≥ 0}, C_3 = {−b ≥ −a ≥ 0} (no condition on c; C_{3−i} = −w_0(C_i) with w_0(a,b;c) = (b,a;c)). For λ ∈ C ∩ (X^*(H_ℂ) + ρ), ρ = (2,1;0) (Calegari–Geraghty), Harish-Chandra's π(λ, C) is a discrete series if λ is in the interior of C and a limit of discrete series if λ lies on exactly one wall of C not a compact wall; π(λ, C)^* = π(−w_0λ, −w_0C). For λ = (λ_1, 0; c) with λ_1 < 0 (Pilloni's coordinates, ρ = (−2,−1;0)), the two limits π(λ)^h (holomorphic: the chamber of the fixed positive system) and π(λ)^g (generic: the other chamber) have the infinitesimal character of λ. Weights: μ = (a, b; c) ∈ X^*(T)^+_M is a discrete series (regular) weight if (a−1, b−2; c) is in the interior of a unique C_i, a limit of discrete series weight if μ − w_0(ρ) lies on exactly two chambers; these come in the three families (a, 2; c), a ≥ 2; (a, 3−a; c), a ≥ 2; (1, b; c), b ≤ 1. Pilloni's weight (k, r) is cohomological iff r ≠ 2, k + r ≠ 1 and k + 2r ≠ 3.

*Hypotheses.* G = GSp_4 over ℝ.

*Proof outline.*

1. Chambers from the root data of AF.4/hermitian-positive-system and the longest element of W_M.
2. Harish-Chandra's parametrisation (AF.1/discrete-series) specialised to GSp_4(ℝ); the contragredient formula from π(λ, C)^* having parameter −w_0(λ, C).
3. Weight families: solve the chamber inequalities for (a−1, b−2) on two chambers.
4. Translate between Calegari–Geraghty and Pilloni coordinates; apply the recorded corrections (sourceIssues E3-E5).

*Uses.* AF.4/bhr-coherent-cohomology: the representations whose coherent cohomology is computed. GSp4NonregularModularityLifting: non-regular (limit of discrete series) weights in Calegari–Geraghty's Theorem 7.11. HigherHidaAndColemanTheory: Pilloni's π(λ)^h and π(λ)^g in singular weight.

*API.*

- `Automorphic.GSp4.chamber` (data): The four chambers C_0, …, C_3.
- `Automorphic.GSp4.dsRep` (constructor): π(λ, C) for λ ∈ C ∩ (X^*(H_ℂ) + ρ), discrete series or limit.
- `Automorphic.GSp4.dsRep_dual` (relation): π(λ, C)^* ≅ π(−w_0λ, −w_0C).
- `Automorphic.GSp4.IsRegularWeight` (data): Definition 5.7, regular weights.
- `Automorphic.GSp4.IsLimitWeight` (data): Definition 5.7, limit of discrete series weights.
- `Automorphic.GSp4.limitWeight_families` (characterisation): The three families of limit weights.
- `Automorphic.GSp4.holomorphicLimit` (constructor): π(λ)^h and π(λ)^g for λ = (λ_1, 0; c), λ_1 < 0.

*Unit tests.*

- `gsp4_chambers_union` (characterisation): C_0 ∪ C_1 ∪ C_2 ∪ C_3 = {a ≥ b} (in the (a,b) coordinates).
- `gsp4_limit_family` (computation): (a, 2; c) with a ≥ 2 has (a−1, 0) ∈ C_0 ∩ C_1.
- `gsp4_cohomological_weight` (computation): (k, r) = (0, 2) is not cohomological; (3, 3) is.
- `gsp4_compact_wall_not` (non-example): λ on the compact wall λ_2 = λ_1 gives no (limit of) discrete series: the region must be −λ_1 ≥ λ_2 > λ_1 (sourceIssues E5).

*Acceptance.* μ = (3, 2; c): (a−1, b−2) = (2, 0) lies on the wall b = 0 shared by C_0 and C_1, so μ is a limit weight (family 1, a = 3); μ = (4, 3; c) gives (3, 1) in the interior of C_0 only, a regular weight. The weight (k, r) = (3, 3) is cohomological; (k, r) = (0, 2) is not (r = 2).

*Prerequisites.* `AF.4/hermitian-positive-system`, `AF.1/discrete-series`, `ShimuraData:D5`, Tau Ceti RepresentationTheory/RootSystems (layer 4 chambers the fundamental domain and the longest element).

*Sources.* cg20 (§5.3, Definition 5.7, arXiv p. 23 (Duke p. 830)): “If µ − w0 (ρ) lies in the intersection of exactly two of Weyl chambers Ci , we say it is a limit of discrete series weight or a non-regular weight.” — Definition 5.7 and the three families. cg20 (§5.3, arXiv p. 21 (Duke p. 828)): “C0 = {(a, b; c) ∈ R3 : a ≥ b ≥ 0} C1 = {(a, b; c) ∈ R3 : a ≥ −b ≥ 0} C2 = {(a, b; c) ∈ R3 : −b ≥ a ≥ 0} C3 = {(a, b; c) ∈ R3 : −b ≥ −a ≥ 0}.” — The chambers (the page prints C_0, …, C_4 for four chambers; sourceIssues E4). cg20 (§5.3, proof of Theorem 5.5, arXiv p. 22): “we may write π∞ = π(λ, C)∗ = π(−w0 (λ), −w0 (C))” — Harish-Chandra parametrisation and contragredient.

### Theorem: Coherent cohomology of (limits of) discrete series (Blasius–Harris–Ramakrishnan, Harris) (planet: Coherent cohomology of discrete series)

Node `AF.4/bhr-coherent-cohomology`, declaration `TauCeti.Automorphic.coherentCohomology_discreteSeries` in `TauCeti/Automorphic/CoherentCohomological`.

Let G be Hermitian with Harish-Chandra positive system, σ a dominant K-weight and π_∞ = π(λ, C)^* a (non-degenerate limit of) discrete series. If H^i(𝔭_h, K; π_∞ ⊗ V_σ) ≠ 0 then λ = (σ + ρ) restricted appropriately and i = #(Φ(C)^+ ∩ Φ_n^+), and the cohomology is one-dimensional in that degree; any π_∞ with nonzero (𝔭_h, K)-cohomology has the infinitesimal character of V_σ shifted by ρ. For GSp_4(ℝ) and λ = (λ_1, 0; c), λ_1 < 0, V = V_{(−λ_1+1, 2; −c)}: H^i(𝔭, K_∞; π(λ)^h ⊗ V) = ℂ for i = 0 and 0 otherwise, and H^i(𝔭, K_∞; π(λ)^g ⊗ V) = ℂ for i = 1 and 0 otherwise; for λ = (a−1, 0; 4−a), σ = (−2, −a; 4−a) and j = 0, 1, H^j(𝔭_h, K; π(λ, C_j) ⊗ V_σ) is one-dimensional.

*Hypotheses.* G Hermitian; π_∞ discrete series or non-degenerate limit.

*Proof outline.*

1. Blasius–Harris–Ramakrishnan 1994, Theorem 3.2.1, via Schmid's realisation of discrete series in L²-∂̄-cohomology and Zuckerman translation to limits.
2. Degree: the number of noncompact positive roots of C that are positive for the Harish-Chandra system.
3. GSp_4 specialisations: Pilloni Theorem 15.2.2.1(1) and Calegari–Geraghty §7.2 (Harris Theorem 3.4).
4. Proof sources (BHR 1994, Harris 1990) not freely available; recorded as gap.

*Acceptance.* SL_2(ℝ): D_k^+ has (𝔭_h, K)-cohomology in degree 0 for σ = −k, D_k^- in degree 1. GSp_4: π(λ, C_0) (holomorphic) in degree 0, π(λ, C_3) (antiholomorphic) in degree 3.

*Prerequisites.* `AF.4/coherent-relative-cohomology`, `AF.4/gsp4-discrete-series`, `AF.4/hermitian-positive-system`, `AF.1/discrete-series`.

*Sources.* pilloni20 (§15.2.2, Theorem 15.2.2.1(1), p. 108): “Hi (p, K∞ ; π(λ)h ⊗ V(−λ1 +1,2;−c) ) = C if i = 0 and Hi (p, K∞ ; π(λ)h ⊗ V(−λ1 +1,2;−c) ) = 0 otherwise,” — Part (1). cg20 (§5.3, proof of Theorem 5.5, arXiv p. 22): “By [BHR94, Theorem 3.2.1], it follows that:” — λ and i = #(Φ(C)^+ ∩ Φ_n^+).

### Theorem: Tempered representations with coherent cohomology are (limits of) discrete series (Mirković)

Node `AF.4/mirkovic-tempered-coherent`, declaration `TauCeti.Automorphic.isDiscreteSeries_of_coherentCohomology_ne_zero` in `TauCeti/Automorphic/CoherentCohomological`.

Let G be Hermitian and π_∞ an irreducible essentially tempered (𝔤, K)-module with H^i(𝔭_h, K; π_∞ ⊗ V_σ) ≠ 0 for some i. Then π_∞ is a discrete series or a non-degenerate limit of discrete series. For π ∈ A_{(2)}(G) with π_∞ essentially tempered this applies at every archimedean place.

*Hypotheses.* π_∞ essentially tempered.

*Proof outline.*

1. Mirković's theorem as quoted by Harris (1990, Theorem 3.5): tempered modules are fundamental series; the (𝔭_h, K)-cohomology of a properly induced tempered module vanishes by a Shapiro-type argument unless the inducing parabolic is cuspidal of compact type.
2. Source (Harris 1990) not freely available; recorded with its route.

*Acceptance.* SL_2(ℝ): the tempered principal series has no (𝔭_h, K)-cohomology with any σ. Non-tempered: the trivial representation of SL_2(ℝ) has (𝔭_h, K)-cohomology in degree 0 and is not a (limit of) discrete series, so temperedness is necessary.

*Prerequisites.* `AF.4/coherent-relative-cohomology`, `AF.1/tempered-square-integrable`, `AF.1/langlands-classification`, `AF.1/discrete-series`.

*Sources.* cg20 (§5.3, Theorem 5.6, arXiv p. 23): “The last part is 4 due to Mirković and was established in the proof of Theorem 5.5.” — Use of Mirković's theorem via Harris [37, Theorem 3.5]. bcgp21 (§3.10, proof of Theorem 3.10.1, arXiv v3 p. 73): “by [Har90a, Thm. 3.5] (a theorem of Mirković) and [BHR94, Thm. 3.2.1], for each v|∞ we have that” — The same input at each real place.

### Theorem: Large-weight classification and temperedness for coherent cohomology of GSp_4

Node `AF.4/bhr-large-weight`, declaration `TauCeti.Automorphic.GSp4.coherent_classification_largeWeight` in `TauCeti/Automorphic/CoherentCohomological`.

(i) (Blasius–Harris–Ramakrishnan, Proposition 2.4.5 and proof of Theorem 4.2.3) If π ∈ A_{(2)}(G) has nonzero (𝔭_h, K)-cohomology with coefficients V_κ and the infinitesimal character of π_∞ is far enough from the root hyperplanes it does not lie on, then π_∞ is essentially tempered. (ii) (Pilloni, Theorem 15.2.2.1(2)) There is R such that if λ = (λ_1, 0; c) with λ_1 < 0 and −λ_1 ≥ R (printed λ_1 ≥ R; sourceIssues E6), V = V_{(−λ_1+1,2;−c)} and π_∞ is an irreducible essentially unitary representation of GSp_4(ℝ), then H^0(𝔭, K_∞; π_∞ ⊗ V) ≠ 0 implies π_∞ ≅ π(λ)^h, and H^1(𝔭, K_∞; π_∞ ⊗ V) ≠ 0 implies π_∞ ≅ π(λ)^g. (iii) (Pitale–Schmidt lowest-weight theory) If H^0(𝔭_h, K; π_v ⊗ V_{κ_v}) ≠ 0 then π_v is the holomorphic discrete series or holomorphic limit of discrete series of weight (k_v, l_v); for l_v > 2 only the holomorphic discrete series contributes, in degree 0, and for l_v = 2 the holomorphic (degree 0) and generic (degree 1) limits, each one-dimensional.

*Hypotheses.* G = GSp_4 (over each real place of a totally real field).

*Proof outline.*

1. (i) Casselman–Osborne: the infinitesimal character is determined by κ; unitary non-tempered representations have parameters close to walls (Vogan's classification bounds), so large regular parameters force temperedness.
2. (ii) Combine (i) with AF.4/mirkovic-tempered-coherent and AF.4/bhr-coherent-cohomology.
3. (iii) Lowest K-type analysis for GSp_4(ℝ) (Pitale–Schmidt §2.3).
4. Sources BHR 1994 and Pitale–Schmidt 2009 not read (gap); statements recorded from Pilloni and BCGP21.

*Acceptance.* Parallel weight κ = (k, k) with k ≥ 3 at every real place: H^0 sees exactly the holomorphic discrete series. The constant R cannot be removed: for small weights non-tempered unitary representations (Saito–Kurokawa type) have nonzero H^0 or H^1.

*Prerequisites.* `AF.4/bhr-coherent-cohomology`, `AF.4/mirkovic-tempered-coherent`, `AF.4/gsp4-discrete-series`, `AF.1/tempered-square-integrable`.

*Sources.* pilloni20 (§15.2.2, Theorem 15.2.2.1(2), p. 108): “There is a constant R such that if λ1 ≥ R and” — Part (2), with the printed λ_1 ≥ R to be read −λ_1 ≥ R. bcgp21 (§3.10, proof of Theorem 3.10.1, arXiv v3 p. 73): “In view of the relation between the inﬁnitesimal character of π∞ and κ arising from the Casselman–Osborne theorem (see [BHR94, Prop. 2.4.5]),” — Temperedness under regularity; the three nonvanishing cases at each real place follow.

### Theorem: Limits of discrete series indexed by C(κ) for GSp_{2g} (Harris)

Node `AF.4/harris-limits-gsp2g`, declaration `TauCeti.Automorphic.GSp2g.limitDiscreteSeries` in `TauCeti/Automorphic/CoherentCohomological`.

Let (G, X) be the Siegel Shimura datum for GSp_{2g}, μ its cocharacter with parabolic P_μ and Levi M_μ, K_∞ ⊆ G(ℝ) the stabiliser of h (a real form of M_μ), V_κ the representation of K_∞ of highest weight κ ∈ X^*(T)^{M_μ,+} and 𝔭_μ = Lie P_μ. Define C(κ) = {w ∈ ^MW : w⁻¹w_{0,M}(κ + ρ) ∈ X^*(T)^−_ℚ}, read in X^*(T)_ℚ (sourceIssues E7), where ^MW are the Kostant representatives and X^*(T)^−_ℚ = −X^*(T)^+_ℚ the antidominant cone. C(κ) is nonempty and w⁻¹w_{0,M}(κ + ρ) is independent of w ∈ C(κ); if ν + ρ := −w⁻¹w_{0,M}(κ+ρ) is regular, C(κ) has exactly one element. For w ∈ C(κ) there exists a non-degenerate limit of discrete series π_∞(κ, w) of G(ℝ), determined by (κ, w), such that π_∞(κ, w) ⊗ V_κ has (𝔭_μ, K_∞)-cohomology in degree ℓ(w). The degree ℓ(w) alone does not determine π_∞(κ, w) (the uniqueness clause of the printed theorem is dropped: sourceIssues E8).

*Hypotheses.* G = GSp_{2g}; κ ∈ X^*(T)^{M_μ,+}.

*Proof outline.*

1. Nonemptiness and independence: X^*(T)^−_ℚ is a fundamental domain for W on X^*(T)_ℚ (Tau Ceti exists_mem_dominantChamber and RootSystems Layer 4 uniqueness), and ^MW × W_M → W is a bijection.
2. Existence of π_∞(κ, w) and the cohomology degree: Harris 1990, Theorem 3.4, via AF.4/bhr-coherent-cohomology for the chamber w·C.
3. Import ^MW, w_{0,M} from ShimuraData D3 and ρ and the GSp_{2g} cones from ShimuraData D5 (request).

*Acceptance.* g = 1: C(κ) for κ = k gives the holomorphic (w = Id, degree 0) or antiholomorphic (degree 1) discrete series of GL_2(ℝ), and the limit of discrete series at k = 1 where C(κ) has two elements. g = 2 recovers the GSp_4 chambers C_0, …, C_3 of AF.4/gsp4-discrete-series.

*Prerequisites.* `AF.4/bhr-coherent-cohomology`, `AF.4/hermitian-positive-system`, `ShimuraData:D3`, `ShimuraData:D5`, `tauceti:TauCeti.exists_mem_dominantChamber`, Tau Ceti RepresentationTheory/RootSystems (layer 4 chambers the fundamental domain and the longest element).

*Sources.* boxer-pilloni (§1.3.7, Theorem 1.3.8, p. 4): “There exists a unique non degenerate limit of discrete series representation π∞ (κ, w) of G(R), with the property that π∞ (κ, w) ⊗ Vκ has (pµ , K∞ )-cohomology in degree ℓ(w).” — Theorem 1.3.8 ([Har90], Thm. 3.4); existence used, the uniqueness clause corrected. boxer-pilloni (§1.3.3, p. 3): “If ν + ρ is regular, then the set C(κ) contains a unique element.” — C(κ) (defined on p. 3 with X^*(T)^+, to be read in X^*(T)_ℚ as on p. 48).

### Theorem: Holomorphic discrete series of Sp_{2n}(ℝ) and U(n,n) with scalar minimal K-type

Node `AF.4/holomorphic-ds-sp2n-unn`, declaration `TauCeti.Automorphic.holomorphicDiscreteSeries_minimalKType` in `TauCeti/Automorphic/CoherentCohomological`.

Let 𝒢 = Sp_{2n}/ℝ (resp. U(n,n)/ℝ) with maximal compact K ≅ U(n) (resp. U(n) × U(n)) and χ : K → ℂ^×, g_0 ↦ det(g_0) (resp. (g_1, g_2) ↦ det(g_1)det(g_2)⁻¹). For k > n (resp. k ≥ n) there is a unique discrete series representation π_k of 𝒢(ℝ) with minimal K-type χ^{⊗k}; its infinitesimal character is (k−1, k−2, …, k−n) ∈ ℝ^n (resp. (k − ½, k − 3/2, …, k − n + ½, n − ½ − k, …, 3/2 − k, ½ − k) ∈ ℝ^{2n}).

*Hypotheses.* k > n for Sp_{2n}, k ≥ n for U(n,n).

*Proof outline.*

1. Harish-Chandra parameter λ = Λ_k + δ_c − δ_nc from the lowest K-type Λ_k = restriction of χ^{⊗k} (Blattner), with 2δ_nc = (n+1, …, n+1) and 2δ_c = (n−1, n−3, …) (Scholze's proof).
2. λ regular and dominant for the holomorphic chamber exactly when k > n (resp. k ≥ n).
3. Uniqueness from AF.1/discrete-series (ii).

*Acceptance.* n = 1, Sp_2 = SL_2: π_k = D_k^+ for k > 1 with infinitesimal character k − 1. For k = n with Sp_{2n} the parameter is singular (a limit), consistent with the strict inequality.

*Prerequisites.* `AF.1/discrete-series`, `AF.4/hermitian-positive-system`.

*Sources.* scholze15 (§5.1, Proposition 5.1.1, arXiv p. 79): “For k > n, resp. k ≥ n, there is a unique discrete series representation πk of G with minimal K-type χ⊗k , and it has infinitesimal character (k − 1, k − 2, . . . , k − n) ∈ X ∗ (TC )R = Rn ,” — Proposition 5.1.1.

### Construction: Integral coefficient systems from algebraic representations

Node `AF.4/coefficient-lattices`, declaration `TauCeti.Automorphic.StableLattice` in `TauCeti/Automorphic/AlgebraicWeight`.

Let V be an algebraic representation of G over a number field E (for example V_λ), O_E its integers, and J_f ⊆ G(𝔸_f) compact open. A J_f-stable lattice is an O_E ⊗ \hat ℤ-lattice L ⊆ V ⊗_ℚ 𝔸_f (equivalently a family of O_{E,ℓ}-lattices L_ℓ ⊆ V ⊗ ℚ_ℓ, equal to a fixed L_0 ⊗ ℤ_ℓ for almost all ℓ) stable under J_f acting through its ℓ-components. Such lattices exist; for two J_f-stable lattices L, L' there is N ≥ 1 with L[1/N] = L'[1/N], so the coefficient modules agree after inverting the primes dividing N. The coefficient module M(L) with G(F)-action (on L ∩ V(E)) and J_f-action is the input for local systems on X_{J_f} (ArithmeticLocallySymmetricSpaces ALS.1) and for algebraic modular forms (AF.5).

*Hypotheses.* V algebraic over E; J_f compact open.

*Proof outline.*

1. Existence: J_f is compact, so it stabilises the lattice Σ_{k ∈ J_f/J'} k·L_0 for an open J' ⊆ J_f fixing a chosen L_0 (finite index; Tau Ceti Chevalley/Kostant lattices give a canonical L_0 for split G).
2. At almost all ℓ, J_ℓ = G(ℤ_ℓ) for the integral model and V comes from a representation of the model, so L_0 ⊗ ℤ_ℓ is stable.
3. Comparison: two lattices agree at almost all ℓ and are commensurable at the rest.

*Uses.* ArithmeticLocallySymmetricSpaces:ALS.1: local systems on X_K from algebraic representations with stable lattices. AF.5/algebraic-modular-forms: integral algebraic modular forms valued in L. AF.4/torsion-hecke-eigenclasses: integral cohomology with coefficients L.

*API.*

- `Automorphic.StableLattice` (data): J_f-stable O_E ⊗ \hat ℤ-lattices in V ⊗ 𝔸_f.
- `Automorphic.StableLattice.exists` (other): Existence for every compact open J_f.
- `Automorphic.StableLattice.eq_localization` (characterisation): Two stable lattices agree after inverting finitely many primes.
- `Automorphic.StableLattice.map` (functoriality): Restriction to smaller J_f and conjugation by g ∈ G(𝔸_f): gL is gJ_fg⁻¹-stable.
- `Automorphic.StableLattice.reduction` (projection): L/ϖL as a k_E[J_f]-module.

*Unit tests.*

- `lattice_trivial` (degenerate): For V trivial, the only stable lattices are the O_E ⊗ \hat ℤ-multiples c·(O_E ⊗ \hat ℤ).
- `lattice_sym2` (computation): For Sym²(ℚ²) under GL_2(\hat ℤ), Sym² and the divided-power lattice differ only at 2 (index 2).
- `lattice_not_unique` (non-example): Stable lattices are not unique: ℓ·L is another one, and at ℓ = 2 Sym²(ℤ_2²) and Γ²(ℤ_2²) are non-homothetic.
- `lattice_chevalley_compat` (compatibility): For split G and dominant λ, the Chevalley/Kostant lattice of V_λ (Tau Ceti) is G(\hat ℤ)-stable.

*Acceptance.* GL_2/ℚ, V = Sym^{k−2}(ℚ²): L = Sym^{k−2}(\hat ℤ²) is GL_2(\hat ℤ)-stable; the divided-power lattice Γ^{k−2} differs from it only at primes ≤ k − 2. For k − 2 < p the two lattices agree at p, which is the source of the condition p > k − 2 in integral Eichler–Shimura statements.

*Prerequisites.* `AF.4/algebraic-weight`, `AdelicAlgebraicGroups:AA.1/integral-points-level`, `AdelicAlgebraicGroups:AA.1/integral-model`.

*Sources.* ding25 (§4.2.2, arXiv p. 72): “Let Wξ,τ be a GLn (OFv+ )-invariant OE -lattice of the locally algebraic representation” — Lattices W_{ξ,τ} in locally algebraic representations stable under the level at p (the lattice must be in the tensor product over v ∈ S_p∖{℘}: sourceIssues E9). ichino-prasanna23 (§2, arXiv p. 13): “Let (ρ, V ) be a finite-dimensional representation of G defined over a number field L ⊂ C.” — Algebraic representations over number fields giving local systems.

### Definition: Field of rationality and fields of definition

Node `AF.4/rationality-field`, declaration `TauCeti.Automorphic.rationalityField` in `TauCeti/Automorphic/AlgebraicWeight`.

Aut(ℂ) acts on isomorphism classes of admissible (𝔤, K_∞) × G(𝔸_f)-modules through the finite part: (π^∞)^τ = π^∞ ⊗_{ℂ,τ} ℂ. The field of rationality ℚ(π^∞) is the fixed field of {τ ∈ Aut(ℂ) : (π^∞)^τ ≅ π^∞}. A field of definition is a subfield E ⊆ ℂ with an E-structure π^∞_E (a smooth G(𝔸_f)-representation over E with π^∞_E ⊗_E ℂ ≅ π^∞). Every field of definition contains ℚ(π^∞), but ℚ(π^∞) need not be one; existence of a model over a finite extension of ℚ(π^∞) is a separate theorem.

*Hypotheses.* π^∞ admissible irreducible.

*Proof outline.*

1. Aut(ℂ)-twist on smooth representations of G(𝔸_f) (no topology on ℂ needed: smooth = all stabilisers open).
2. Fixed field via Galois correspondence for Aut(ℂ/ℚ) (closed subgroups).

*Uses.* AF.4/clozel-rationality: the theorem bounds ℚ(π^∞) and produces a model. AutomorphicGaloisRepresentationsPartII:AG2.0: field of rationality M_π versus fields of realisation of r_{π,ι}. GL2AutomorphicRepresentationsAndTransfer:R16.4: rational structures for the actual cohomological GL₂ representations.

*API.*

- `Automorphic.galoisTwist` (functoriality): π ↦ π^τ, compatible with composition in Aut(ℂ).
- `Automorphic.rationalityField` (data): ℚ(π^∞) as an IntermediateField ℚ ℂ.
- `Automorphic.IsFieldOfDefinition` (data): E admits an E-structure on π^∞.
- `Automorphic.rationalityField_le` (relation): Every field of definition contains ℚ(π^∞).

*Unit tests.*

- `rationality_trivial` (degenerate): The trivial representation has ℚ(π^∞) = ℚ and is defined over ℚ.
- `rationality_gl1_finite_order` (computation): A Dirichlet character χ of order m has ℚ(χ) = ℚ(ζ_m) when primitive with values generating it.
- `rationality_not_definition` (non-example): ℚ(π) is not always a field of definition: the descent obstruction is a class in a Brauer group (example: a representation of a quaternion group realised over ℚ(i) with rational character but no ℚ-model), so 'stabiliser field = field of definition' is false in general.
- `rationality_modularForms_compat` (compatibility): For GL_2/ℚ newforms, agreement with Tau Ceti ModularForms Layer 8G's character field.

*Acceptance.* GL_1: ℚ(χ_f) for a Hecke character of finite order is the field generated by its values. GL_2/ℚ newform f: ℚ(π_f^∞) = ℚ(a_n(f)) (Tau Ceti ModularForms Layer 8G coefficient field).

*Prerequisites.* `AF.2/automorphic-forms-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

*Sources.* bcg25 (§1, arXiv p. 1): “Higher rank analogues of the Eichler–Shimura isomorphism (see Remark 1.2) imply that Problem A is equivalent to the existence of cuspidal automorphic rep- resentations π for GLn /Q which have level one and weight zero.” — The cohomological realisation through which rationality is proved.

### Theorem: Rationality of cohomological cuspidal representations (Clozel) (planet: Clozel's rationality theorem)

Node `AF.4/clozel-rationality`, declaration `TauCeti.Automorphic.clozelRationality` in `TauCeti/Automorphic/AlgebraicWeight`.

Let π be a cuspidal automorphic representation of GL_n(𝔸_F), F a number field, which is regular algebraic (cohomological: π_∞ ⊗ V_λ has nonzero (𝔤, K)-cohomology for some dominant λ). Then ℚ(π^∞) is a number field and π^∞ has a model over ℚ(π^∞) (Clozel, Théorème 3.13). More generally, for G reductive over F and π cuspidal cohomological with coefficients V_λ defined over E, contributing to cuspidal cohomology H^•_cusp(X_K, V_λ), the field ℚ(π^∞) is a number field, and π^∞ is defined over a finite extension of ℚ(π^∞), provided the cuspidal cohomology is a Hecke-stable direct summand of H^•(X_K, V_λ) defined over E (true for GL_n by Clozel/Franke).

*Hypotheses.* π cuspidal and cohomological; for general G, cuspidal cohomology is an E-rational Hecke summand.

*Proof outline.*

1. Cuspidal cohomology H^•_cusp(X_K, V_λ ⊗ ℂ) = ⊕_π m(π) H^•(𝔤, K; π_∞ ⊗ V_λ) ⊗ (π^∞)^K (Borel–Wallach / AutomorphicSpectralTheory AS.5 and ArithmeticLocallySymmetricSpaces ALS.5 comparison).
2. Betti cohomology H^•(X_K, V_λ) has an E-structure stable under Hecke operators (ALS.1, ALS.3); for GL_n cuspidal cohomology is an E-rational summand (Clozel, using Franke's theorem and the strong multiplicity one / regularity).
3. Aut(ℂ/E) permutes the π^K-isotypic pieces; finiteness of the set of π with given K and λ gives a number field ℚ(π^∞); a model over ℚ(π^∞) for GL_n from Whittaker newforms (unique up to scalars); in general a model over a finite extension.
4. Proof source (Clozel 1990, Théorème 3.13) not freely available; recorded as gap.

*Acceptance.* GL_2/ℚ: for a newform f of weight k ≥ 2, ℚ(π_f^∞) = ℚ(a_n(f)) is a number field (Tau Ceti ModularForms Layer 8). Maass forms (non-cohomological) are excluded: their Hecke eigenvalues are not known to be algebraic.

*Prerequisites.* `AF.4/rationality-field`, `AF.4/cohomological-representation`, `AF.3/cuspidal-automorphic-representation`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `AutomorphicSpectralTheory:AS.5`.

*Sources.* bcg25 (§1, arXiv p. 1): “Higher rank analogues of the Eichler–Shimura isomorphism (see Remark 1.2) imply that Problem A is equivalent to the existence of cuspidal automorphic rep- resentations π for GLn /Q which have level one and weight zero.” — Cuspidal cohomology of GL_n(ℤ) realises cohomological cuspidal π (the input of the rationality proof). chenevier-taibi20 (§1.2, arXiv p. 5): “The algebraic cuspidal π are especially interesting to number theorists, as for such a π standard conjectures (by Clozel, Langlands) predict the existence of a compatible system” — Context: algebraic cuspidal π of GL_m.

### Definition: Torsion Hecke eigenclasses

Node `AF.4/torsion-hecke-eigenclasses`, declaration `TauCeti.Automorphic.TorsionEigenSystem` in `TauCeti/Automorphic/AlgebraicWeight`.

Let L be a J_f-stable O_E-lattice in V_λ (AF.4/coefficient-lattices), λ_E a prime of E with residue field k, and T the abstract Hecke algebra of G(𝔸_f^S)//J_f^S (away from a finite set S). A torsion Hecke eigenclass is a nonzero class c ∈ H^i(X_{J_f}, L ⊗ O_E/λ^m) (or in the torsion of H^i(X_{J_f}, L)) that is an eigenvector of T; its system of eigenvalues is the ring homomorphism T → O_E/λ^m, and its kernel (for m = 1) is a maximal ideal 𝔪 of T in the support of H^•(X_{J_f}, L ⊗ k). Such systems are defined through integral Betti cohomology (ArithmeticLocallySymmetricSpaces ALS.1, ALS.3) and are not assumed to be reductions of characteristic-zero cusp forms.

*Hypotheses.* X_{J_f} the locally symmetric space of level J_f; L a stable lattice.

*Proof outline.*

1. Integral cohomology and Hecke action from ALS.1 (local systems from stable lattices) and ALS.3 (Hecke correspondences on complexes).
2. Eigen-systems as ring homomorphisms out of the image of T in End(H^i(X_{J_f}, L/λ^m)); support of the finite T-module.

*Uses.* GL2ModularityLifting:R32.3: non-Eisenstein maximal ideals of torsion cohomology in ℓ₀ > 0 patching. AutomorphicGaloisRepresentationsPartII:AG2.0: torsion eigen-systems as inputs to Galois representations. CompletedCohomologyPartII:CC.2: completed cohomology localised at 𝔪.

*API.*

- `Automorphic.TorsionEigenSystem` (data): Ring homomorphisms T → O_E/λ^m arising from eigenclasses in H^•(X_{J_f}, L/λ^m).
- `Automorphic.TorsionEigenSystem.maximalIdeal` (projection): The maximal ideal 𝔪 ⊆ T of the mod-λ system.
- `Automorphic.TorsionEigenSystem.of_char_zero` (relation): Reduction of a characteristic-zero eigen-system with λ-integral eigenvalues gives a torsion one (one direction only).
- `Automorphic.TorsionEigenSystem.lattice_indep` (compatibility): Independence of the lattice for λ not dividing the comparison index of AF.4/coefficient-lattices.

*Unit tests.*

- `torsion_trivial_coeff` (degenerate): For L = O_E and i = 0, H^0(X_{J_f}, k) gives the Eisenstein system (for GL_2, T_ℓ ↦ 1 + ℓ, the degree of the Hecke correspondence).
- `torsion_reduction` (compatibility): The reduction mod λ of the eigen-system of a weight-2 newform with integral coefficients is a torsion eigen-system on H^1(Γ_0(N), k).
- `torsion_not_lift` (non-example): Torsion eigen-systems need not lift: for Bianchi groups there are 𝔪 with H^1(Γ, ℤ)_𝔪 finite and nonzero; a definition via reductions of cusp forms would miss them.

*Acceptance.* GL_2 over an imaginary quadratic field: torsion classes in H^1(Γ_0(𝔫), ℤ) occur that do not lift to characteristic zero (Scholze's torsion setting). GL_2/ℚ, weight 2: every eigen-system mod p in H^1(Γ_0(N), 𝔽_p) lifts to characteristic zero (Deligne–Serre) — a theorem of the GL_2/ℚ case, not part of the definition.

*Prerequisites.* `AF.4/coefficient-lattices`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.3`.

*Sources.* scholze15 (§5.1, arXiv p. 82): “Now T acts on the C-vector spaces of cusp forms” — Hecke algebras acting on (torsion) cohomology of locally symmetric spaces in Scholze's setting.

**Coverage of AF.4.** Status: planned. Refinements for the next pass:

- Borel–Wallach, BHR, Harris, Clozel and Pitale–Schmidt proofs not read (gap); the nodes carry the statements with the corrections recorded in sourceIssues.
- Clozel's rationality for general G needs the E-rationality of cuspidal cohomology as a Hecke summand, supplied through requests to ALS.1/ALS.3/ALS.5 and AS.5.

## AF.5. Comparison examples and transport

This layer checks the general theory against the classical cases and transports it. It proves the GL_1 dictionary between automorphic representations and Hecke characters (importing the carriers of Tau Ceti GlobalNumberFields Layers 9 and 10), the GL_2/ℚ dictionary between modular forms and automorphic forms with the slash, Casimir, cuspidality and Hecke normalisations, and defines algebraic modular forms on groups compact at infinity with integral coefficients, Hecke operators and change of level (the owner of this construction under RS-23; HilbertModularVarietiesAndShimuraCurves R18.3 specialises it to definite quaternion algebras). It closes with restriction of scalars, products and central characters; transfer between inner forms is owned by the transfer roadmaps.

**Dependencies.** Inside the roadmap: AF.0, AF.1, AF.2, AF.3, AF.4. Other roadmaps and the libraries: `AdelicAlgebraicGroups:AA.1/base-change-adelic`; `AdelicAlgebraicGroups:AA.1/product-adelic`; `AdelicAlgebraicGroups:AA.2/split-centre-decomposition`; `AdelicAlgebraicGroups:AA.3/class-number-finite`; `AdelicAlgebraicGroups:AA.4/double-coset-level-map`; `AdelicAlgebraicGroups:AA.4/hecke-correspondence`; `AdelicAlgebraicGroups:AA.4/neat-level-exists`; `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`; `AdelicAlgebraicGroups:AA.5/gl1-adelic-quotient`; `AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component`; `AdelicAlgebraicGroups:AA.5/upper-half-plane-action-conventions`; `ReductiveGroupsPartII:RG2.0a`; `mathlib:CuspForm`; `mathlib:ModularForm`; `mathlib:NumberField.IdeleClassGroup`; `mathlib:SlashAction`; `tauceti:HeckeRing.GL2.heckeSlashModularFormEnd`; `tauceti:HeckeRing.GL2.twistedHeckeSlashModularFormCharEnd`; Tau Ceti GlobalNumberFields (layer 10 archimedean characters infinity types and cyclotomic arithmetic); Tau Ceti GlobalNumberFields (layer 9 hecke and ray class characters); Tau Ceti ModularForms (layer 0 diamond operators and modular forms with character nebentypus); Tau Ceti ModularForms (layer 2 hecke operators and the hecke algebra); Tau Ceti ModularForms (layer 4 eigenforms newforms primitive forms the conductor).

### Theorem: The GL_1 dictionary: automorphic representations of GL_1 are Hecke characters (planet: GL₁ automorphic dictionary)

Node `AF.5/gl1-dictionary`, declaration `TauCeti.Automorphic.GL1.automorphicRepresentationEquiv` in `TauCeti/Automorphic/GL1`.

Let F be a number field. (i) The automorphic representations of GL_1(𝔸_F) are exactly the Hecke characters χ ∈ HeckeCharacter F = ContinuousMonoidHom(IdeleClassGroup F, ℂ^×) (Tau Ceti GlobalNumberFields Layer 9), viewed as (𝔤𝔩_1, K_∞) × 𝔸_f^×-modules ℂχ; each occurs with multiplicity one and is cuspidal. (ii) A(GL_1) = ⊕_χ A(GL_1)_{(χ)}, where A(GL_1)_{(χ)} = χ·ℂ[log|·|] (generalized eigenspaces). (iii) The infinity type of χ (ContinuousInfinityType: (s_w, ε_w) at real w, (s_w, k_w) at complex w, GlobalNumberFields Layer 10) is the archimedean component π_∞ under the identification of irreducible (𝔤𝔩_1, K_∞)-modules with characters of F_∞^×; the finite conductor of χ is the conductor of π^∞ (the largest open subgroup of \hat O_F^× fixing it); the unitary twist χ|·|^{−shift χ} corresponds to the unitary normalisation of π. (iv) π is C-algebraic (= L-algebraic, ρ = 0) iff χ is algebraic of type A_0.

*Hypotheses.* F a number field.

*Proof outline.*

1. GL_1(F)\GL_1(𝔸_F) is the idele class group (AdelicAlgebraicGroups:AA.5/gl1-adelic-quotient).
2. Automorphic forms on an abelian group: Z(𝔤) = U(𝔤) acts through derivatives; K_∞-finiteness and Z-finiteness give finite sums of characters times polynomials in log|·| (Pontryagin duality on the compact norm-one quotient, AdelicAlgebraicGroups:AA.2/split-centre-decomposition).
3. Irreducible subquotients are one-dimensional: Hecke characters; multiplicity one since a character is determined by its values.
4. Infinity types and conductors are read off from the local components (Tau Ceti GlobalNumberFields Layers 9, 10); A_0 ↔ C-algebraic since ρ = 0.

*Acceptance.* F = ℚ: Hecke characters of finite order ↔ primitive Dirichlet characters (GlobalNumberFields Layer 9 dictionary), with parity = π_∞(−1). The norm character |·|_𝔸 is automorphic with infinity type s = 1 and conductor 1; it is algebraic (type A_0 with n_σ = 1).

*Prerequisites.* `AdelicAlgebraicGroups:AA.5/gl1-adelic-quotient`, `AdelicAlgebraicGroups:AA.2/split-centre-decomposition`, Tau Ceti GlobalNumberFields (layer 9 hecke and ray class characters), Tau Ceti GlobalNumberFields (layer 10 archimedean characters infinity types and cyclotomic arithmetic), `AF.2/automorphic-representation`, `AF.4/c-l-algebraic`, `mathlib:NumberField.IdeleClassGroup`.

*Sources.* getz-hahn (§10.1, Theorem 10.8, p. 47): “An irreducible automorphic representation of GL1 (AF ) can be identified with a character of F × \A× F ,” — Automorphic representations of GL_1 are idele class characters.

### Construction: Adelization of classical modular forms for GL_2/ℚ (planet: Adelization of modular forms)

Node `AF.5/gl2-classical-to-adelic`, declaration `TauCeti.Automorphic.GL2.adelize` in `TauCeti/Automorphic/GL2Dictionary`.

Let N ≥ 1, χ a Dirichlet character mod N, k ≥ 1 and f : ℍ → ℂ satisfying f|_kγ = χ(d)f for γ = (a b; c d) ∈ Γ_0(N). With K_0(N) = {(a b; c d) ∈ GL_2(\hat ℤ) : c ≡ 0 mod N} and the character λ_χ(k) = χ_N(d_N) of K_0(N) (χ viewed on (ℤ/N)^×), strong approximation GL_2(𝔸_ℚ) = GL_2(ℚ)GL_2(ℝ)^+K_0(N) gives a well-defined function φ_f(γ g_∞ k) = λ_χ(k)⁻¹·(f|_k g_∞)(i) for γ ∈ GL_2(ℚ), g_∞ ∈ GL_2(ℝ)^+, k ∈ K_0(N), where (f|_k g)(z) = det(g)^{k/2} j(g, z)^{−k} f(gz) and j(g, z) = cz + d (so φ_f(g_∞) = det(g_∞)^{k/2} j(g_∞, i)^{−k} f(g_∞i)). φ_f is left GL_2(ℚ)-invariant, satisfies φ_f(g r_θ) = e^{ikθ}φ_f(g), φ_f(zg) = ω_χ(z)φ_f(g) for z in the centre, where ω_χ is the Hecke character with ω_χ|_{ℝ_{>0}} = 1, ω_χ(−1_∞) = (−1)^k and finite part χ⁻¹ on \hat ℤ^× (with the convention λ_χ), and φ_f is right invariant under K_1(N).

*Hypotheses.* χ(−1) = (−1)^k (otherwise f = 0); slash action with the det^{k/2} normalisation (Mathlib's SlashAction on GL(2,ℝ)^+ uses det^{k−1}; the comparison is part of the API).

*Proof outline.*

1. Strong approximation for SL_2 and det(K_0(N)) = \hat ℤ^× give GL_2(𝔸) = GL_2(ℚ)GL_2(ℝ)^+K_0(N) (AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component, AA.4/strong-approximation-theorem).
2. Well-definedness: GL_2(ℚ) ∩ GL_2(ℝ)^+K_0(N) = Γ_0(N) and the transformation law of f with χ(d).
3. Weight: (f|_k(g r_θ))(i) = e^{ikθ}(f|_k g)(i) since r_θ fixes i and j(r_θ, i) = e^{−iθ}.
4. Central character from the action of scalars z·1 ∈ ℚ^× ℝ_{>0} \hat ℤ^× and f|_k(−1) = (−1)^k f.

*Uses.* AF.5/gl2-dictionary: the dictionary theorem. GL2AutomorphicRepresentationsAndTransfer:R16.6: comparison of primitive classical forms with holomorphic GL₂ representations. AutomorphicGaloisRepresentations:R19.1: basic GL₂/ℚ classical-to-adelic realisation (RS-21 owner AF.5). MetaplecticAutomorphicForms:MP.8: automorphic realisation of the normalised elliptic newform.

*API.*

- `Automorphic.GL2.adelize` (constructor): f ↦ φ_f from Mathlib ModularForm (Γ_1(N) with character χ) to functions on GL_2(𝔸_ℚ).
- `Automorphic.GL2.adelize_left` (characterisation): φ_f(γg) = φ_f(g) for γ ∈ GL_2(ℚ).
- `Automorphic.GL2.adelize_weight` (simp): φ_f(g r_θ) = e^{ikθ}φ_f(g).
- `Automorphic.GL2.adelize_level` (simp): φ_f(gk) = λ_χ(k)⁻¹φ_f(g) for k ∈ K_0(N).
- `Automorphic.GL2.adelize_central` (projection): φ_f(zg) = ω_χ(z)φ_f(g) with ω_χ the Hecke character attached to χ (GlobalNumberFields Layer 9 dictionary).
- `Automorphic.GL2.adelize_slash_compat` (compatibility): Comparison with Mathlib's SlashAction normalisation det^{k−1}j^{−k}: (f ∣[k] g) = det(g)^{k/2−1}(f|_k g).
- `Automorphic.GL2.adelize_injective` (other): f ↦ φ_f is injective and linear.

*Unit tests.*

- `adelize_Delta_level` (computation): φ_Δ is right GL_2(\hat ℤ)-invariant and φ_Δ(diag(y, 1)_∞) = y^6 Δ(iy).
- `adelize_zero` (degenerate): φ_0 = 0, and for χ(−1) ≠ (−1)^k the source space is 0.
- `adelize_weight_sign` (non-example): With j(g, z)^{+k} instead of j(g, z)^{−k} the resulting function is not left GL_2(ℚ)-invariant: for f = Δ and γ = (0 −1; 1 0) the two sides differ by the factor j(γ, z)^{2k}.
- `adelize_slash_mathlib` (compatibility): For g ∈ GL_2(ℝ)^+, Mathlib's (f ∣[k] g)(i) equals det(g)^{k/2−1}·(f|_k g)(i).

*Acceptance.* For f = Δ (N = 1, χ = 1, k = 12) φ_Δ is right GL_2(\hat ℤ)-invariant with trivial central character. The central character of φ_f for χ of conductor N is the Hecke character whose finite part on \hat ℤ^× is χ⁻¹ (with the convention λ_χ above); the opposite convention changes χ to χ⁻¹ and must be fixed once.

*Prerequisites.* `AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component`, `AdelicAlgebraicGroups:AA.5/upper-half-plane-action-conventions`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `mathlib:SlashAction`, `mathlib:ModularForm`, Tau Ceti ModularForms (layer 0 diamond operators and modular forms with character nebentypus).

*Sources.* getz-hahn (§6.4, p. 32): “Set φf (g) = j(g, i)−k f (gi) : GL2 (R)+ −→ C where g acts on i by fractional linear transformations.” — The archimedean part of the adelization (Getz–Hahn use j(g, z) = det(g)^{−1/2}(cz + d), which equals our det^{k/2}j^{−k} normalisation). getz-hahn (§6.4, Remark 6.20, p. 33): “Composing the isomorphism of Lemma 6.19 with (6.3.1) we obtain an isomorphism” — Passage to adelic forms on GL_2(𝔸) at level K_0(N).

### Theorem: The GL_2/ℚ dictionary between modular forms and automorphic forms (planet: GL₂/ℚ modular–automorphic dictionary)

Node `AF.5/gl2-dictionary`, declaration `TauCeti.Automorphic.GL2.modularFormEquiv` in `TauCeti/Automorphic/GL2Dictionary`.

With φ_f as in AF.5/gl2-classical-to-adelic: (i) f ↦ φ_f is an isomorphism from M_k(Γ_0(N), χ) onto the space of automorphic forms φ on GL_2(𝔸_ℚ) with φ(gk) = λ_χ(k)⁻¹φ(g) (k ∈ K_0(N)), central character ω_χ, right SO(2)-type e^{ikθ}, killed by the lowering operator L = ½(H − i(X + Y)) ∈ 𝔰𝔩_2(ℂ) (H = diag(1, −1), X = E_{12}, Y = E_{21}; L lowers the SO(2)-weight by 2; it is Zhang's ½(i 1; 1 −i) up to the choice of sign) (equivalently, R(L)φ_f = 0 iff f is holomorphic), and with Casimir eigenvalue Δφ = (k(k−2)/4)φ for Δ = ¼(H² + 2XY + 2YX); (ii) f is a cusp form iff φ_f is cuspidal (φ_{f,B} = 0, which unwinds to vanishing of the constant term at every cusp); (iii) moderate growth of φ_f is equivalent to holomorphy of f at the cusps (bounded at cusps); (iv) translation and the Lie action agree: the raising operator ½(H + i(X + Y)) maps φ_f to a constant multiple of φ_{δ_k f}, where δ_k f = ∂_z f + (k/(2iy)) f is the Maass–Shimura operator of weight k to k + 2 (the constant is fixed with the normalisations); (v) for k ≥ 2 a cusp form f that is a newform generates an irreducible cuspidal automorphic representation π_f with π_{f,∞} ≅ D_k(0) (AF.1/gl2-real-discrete-series) and π_{f,p} unramified for p ∤ N.

*Hypotheses.* k ≥ 1; χ(−1) = (−1)^k.

*Proof outline.*

1. (i) Surjectivity: given φ of the stated type, f(z) = φ(g_z) j(g_z, i)^k det(g_z)^{−k/2} with g_z = (y^{1/2} xy^{−1/2}; 0 y^{−1/2}) recovers f; holomorphy ⇔ R(L)φ = 0 (Cauchy–Riemann in the coordinates of g_z).
2. Casimir: write Δ = ¼(H² + 2H + 4YX) (using XY − YX = H) in the weight basis and evaluate on φ_f, of SO(2)-weight k and killed by L, to get k(k−2)/4; Getz–Hahn's Lemma 6.19 prints ¼(k² − 1), contradicted by their §6.5 (sourceIssues E1).
3. (ii) Constant term along B at g = n(x)a(y)k equals the 0-th Fourier coefficient of f|_kγ at the cusp γ∞ (AF.3/constant-term), via the double coset decomposition GL_2(ℚ)\GL_2(𝔸)/B(𝔸)… over cusps of Γ_0(N).
4. (iii) Moderate growth on Siegel sets ⇔ polynomial growth of f at each cusp ⇔ boundedness of y^{k/2}|f| (Mathlib bdd_at_cusps').
5. (iv) Lie action: compute R(X), R(Y), R(H) on φ_f in coordinates; translation by G(ℝ)^+ is the slash action.
6. (v) Irreducibility and local components: π_{f,∞} has lowest weight k, Casimir k(k−2)/4, hence ≅ D_k(0) by the classification; unramified at p ∤ N by K_0(N)-invariance.

*Acceptance.* k = 12, N = 1: S_12(SL_2(ℤ)) = ℂΔ ≅ the space of cusp forms of weight 12, level GL_2(\hat ℤ), Casimir 30, trivial central character. k = 2: Casimir eigenvalue 0 (the infinitesimal character of the trivial representation), consistent with Eichler–Shimura in weight 2. M_k(Γ_0(N), χ) for χ(−1) ≠ (−1)^k is 0 on both sides.

*Prerequisites.* `AF.5/gl2-classical-to-adelic`, `AF.2/automorphic-form`, `AF.3/cusp-form`, `AF.3/constant-term`, `AF.1/gl2-real-discrete-series`, `AF.2/adelic-classical-bijection`, `mathlib:CuspForm`, Tau Ceti ModularForms (layer 0 diamond operators and modular forms with character nebentypus), Tau Ceti ModularForms (layer 4 eigenforms newforms primitive forms the conductor).

*Sources.* getz-hahn (§6.4, Lemma 6.19, p. 33): “For each integer k ≥ 1 the C-linear map f 7→ ϕf induces an isomorphism” — The dictionary for cusp forms, with the Casimir ideal corrected to ⟨Δ − k(k−2)/4, Z⟩ (sourceIssues E1). getz-hahn (§6.5, p. 34): “Any irreducible sub-(g, K∞ )-module of A0 (Γ, ξk , h∆ − 14 (k 2 − 1)i) is equivalent to Dk (0).” — Archimedean component D_k(0) (same Casimir misprint).

### Theorem: Hecke operators and diamond operators in the GL_2/ℚ dictionary

Node `AF.5/gl2-hecke-normalisation`, declaration `TauCeti.Automorphic.GL2.hecke_adelize` in `TauCeti/Automorphic/GL2Dictionary`.

For p ∤ N and f ∈ M_k(Γ_0(N), χ): with K_p = GL_2(ℤ_p) and Haar measure giving K_p volume 1, the local Hecke operator R(1_{K_p diag(p,1) K_p}) acts on φ_f by p^{1−k/2}·φ_{T_p f}, where T_p is the classical Hecke operator (Tau Ceti heckeSlashModularFormEnd / twistedHeckeSlashModularFormCharEnd with nebentypus), i.e. φ_{T_pf} = p^{k/2−1}R(1_{K_p diag(p,1) K_p})φ_f; on the unitarily normalised form φ_f ⊗ |det|^{(k−1)/2}, the operator p^{1/2}R(1_{K_p diag(p,1) K_p}) has eigenvalue a_p/p^{(k−1)/2} for a newform, matching the unramified principal series parameter of π_{f,p}. Diamond operators ⟨d⟩ correspond to right translation by elements of K_0(N) whose lower-right entry is d mod N, through K_0(N)/K_1(N) ≅ (ℤ/N)^×, and on M_k(Γ_0(N), χ) act by χ(d).

*Hypotheses.* p ∤ N.

*Proof outline.*

1. Coset decomposition K_p diag(p,1) K_p = ⊔_{b mod p} (p b; 0 1)K_p ⊔ (1 0; 0 p)K_p.
2. Transport each coset through the strong-approximation identification and compare with the classical sum f|_k(1 b; 0 p) + χ(p) f|_k(p 0; 0 1), keeping the det^{k/2} versus Mathlib det^{k−1} normalisation explicit (AF.5/gl2-classical-to-adelic API).
3. Diamond operators from K_0(N)/K_1(N) ≅ (ℤ/N)^×.

*Acceptance.* Δ: τ(p) = p^{5}·(eigenvalue of R(1_{K diag(p,1) K}) on φ_Δ), e.g. τ(2) = −24. The normalised eigenvalue a_p/p^{(k−1)/2} of a newform is bounded by 2 (Deligne), the temperedness of π_{f,p}; this bound is not used here.

*Prerequisites.* `AF.5/gl2-dictionary`, `AF.0/finite-hecke-action`, `tauceti:HeckeRing.GL2.heckeSlashModularFormEnd`, `tauceti:HeckeRing.GL2.twistedHeckeSlashModularFormCharEnd`, Tau Ceti ModularForms (layer 2 hecke operators and the hecke algebra).

*Sources.* getz-hahn (§6.4, Remark 6.20, p. 33): “Composing the isomorphism of Lemma 6.19 with (6.3.1) we obtain an isomorphism” — Level K_0(N) adelic forms, on which the local Hecke algebras act.

### Definition: Algebraic automorphic forms on groups compact at infinity (planet: Algebraic modular forms)

Node `AF.5/algebraic-modular-forms`, declaration `TauCeti.Automorphic.AlgebraicModularForm` in `TauCeti/Automorphic/AlgebraicModularForm`.

Let G be connected reductive over a number field F with G(F ⊗ ℝ) compact modulo the centre (more precisely: G(F_∞)/A_∞ compact and Z_G(F) discrete in Z_G(𝔸_f)), E a number field, O_E its integers, A an O_E-algebra, M a finite A-module with a continuous action of a compact open J_f ⊆ G(𝔸_f) through finitely many places (for example a J_f-stable lattice in an algebraic representation V_λ restricted through J_p, possibly twisted by an inertial type, AF.4/coefficient-lattices). The space of algebraic modular forms is S(J_f, M) = {f : G(F)\G(𝔸_f) → M : f(gu) = u⁻¹·f(g) for u ∈ J_f}. Equivalently (rational form, Gross) for V an algebraic representation over E: {f : G(𝔸_f)/J_f → V(E) : f(γg) = γ·f(g)}, the two related by f ↦ (g ↦ g_p⁻¹ f(g)) after extending scalars to E_p. Hecke operators [J_f g J_f] act by Σ_i g_i·f(x g_i) over J_f g J_f = ⊔ g_iJ_f; change of level J'_f ⊆ J_f gives restriction S(J_f, M) → S(J'_f, M) and trace S(J'_f, M) → S(J_f, M). J_f is sufficiently small if for some finite place v its projection to G(F_v) has no nontrivial element of finite order.

*Hypotheses.* G(F_∞) compact modulo centre; M finite over A with J_f-action through a finite set of places.

*Proof outline.*

1. Definition as a submodule of functions on the finite set G(F)\G(𝔸_f)/J'_f for J'_f ⊆ J_f acting trivially on M.
2. Hecke operators and level change as finite sums (AdelicAlgebraicGroups:AA.4/hecke-correspondence, AA.4/double-coset-level-map).
3. Equivalence of the rational and p-adic conventions by the twisting map g ↦ g_p⁻¹.

*Uses.* HilbertModularVarietiesAndShimuraCurves:R18.3: definite quaternionic instance with integral coefficients, Hecke operators and level change (RS-23 owner AF.5). GL2ModularityLifting:R32.3: patching with algebraic modular forms on definite groups. CompletedCohomologyPartII:CC.2: p-adic completions Ŝ_{ξ,τ}(U^℘, E) of these spaces (Ding §4.2.2).

*API.*

- `Automorphic.AlgebraicModularForm` (data): S(J_f, M) as an A-module.
- `Automorphic.AlgebraicModularForm.hecke` (constructor): The operator [J_f g J_f].
- `Automorphic.AlgebraicModularForm.res` (functoriality): Restriction to smaller level, with res ∘ res = res.
- `Automorphic.AlgebraicModularForm.trace` (functoriality): Trace to larger level; trace ∘ res = [J_f : J'_f]·id on sufficiently small levels.
- `Automorphic.AlgebraicModularForm.rationalEquiv` (equivalence): Comparison of the rational (Gross) and p-adic conventions.
- `Automorphic.IsSufficientlySmall` (data): BCGP25 Definition 5.7.2.
- `Automorphic.AlgebraicModularForm.baseChange` (compatibility): S(J_f, M) ⊗_A B ≅ S(J_f, M ⊗_A B) when J_f is sufficiently small (freeness).

*Unit tests.*

- `amf_trivial_coeff` (computation): For M = A trivial, S(J_f, A) = A^{G(F)\G(𝔸_f)/J_f}.
- `amf_zero` (degenerate): S(J_f, 0) = 0.
- `amf_definite_quaternion` (computation): For D = the definite quaternion algebra over ℚ ramified at {2, ∞} and a maximal order, h = 1 and S(\hat O^×, ℤ) = ℤ.
- `amf_not_small_basechange` (non-example): Without sufficient smallness base change can fail: with nontrivial finite stabilisers Γ_i, S(J_f, M) = ⊕ M^{Γ_i} and (M^{Γ_i}) ⊗ 𝔽_p ≠ (M ⊗ 𝔽_p)^{Γ_i} when p divides |Γ_i|.

*Acceptance.* A definite quaternion algebra D over ℚ, J_f = \hat O^× for a maximal order, M = ℤ: S(J_f, ℤ) = ℤ^{h} with h the class number (type number for D); this is the specialisation planned in HilbertModularVarietiesAndShimuraCurves R18.3. Definite unitary group G/F^+ (BCGP25 §5.7, Ding §4.2.2) with M = W_{ξ,τ} a lattice in σ(τ) ⊗ L(ξ): the spaces S_{ξ,τ}(U^℘U_℘, O_E/ϖ^k) whose limit Ŝ_{ξ,τ} is the completed cohomology of CompletedCohomologyPartII.

*Prerequisites.* `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.4/hecke-correspondence`, `AdelicAlgebraicGroups:AA.4/double-coset-level-map`, `AF.4/coefficient-lattices`, `AF.4/algebraic-weight`.

*Sources.* bcgp25 (§5.7.2, arXiv p. 131): “We say that U is suﬃciently small if for some ﬁnite place v of F + , the projection of U to G(Fv+ ) contains no element of ﬁnite order other than the identity.” — Definition 5.7.2; the spaces S_λ(U, A) of §5.7 are functions with f(gu) = u⁻¹f(g). ding25 (§4.2.2, arXiv p. 72): “Let Wξ,τ be a GLn (OFv+ )-invariant OE -lattice of the locally algebraic representation σ(τvQ) ⊗E L(ξv )” — Coefficient lattices with inertial types (the lattice should be in the tensor product over v ∈ S_p∖{℘}: sourceIssues E9).

### Theorem: Finiteness and the automorphic comparison for algebraic modular forms

Node `AF.5/algebraic-modular-forms-structure`, declaration `TauCeti.Automorphic.AlgebraicModularForm.equivSum` in `TauCeti/Automorphic/AlgebraicModularForm`.

With G compact at infinity as in AF.5/algebraic-modular-forms: (i) G(F)\G(𝔸_f)/J_f = {t_1, …, t_h} is finite and S(J_f, M) ≅ ⊕_i M^{Γ_i} with Γ_i = G(F) ∩ t_iJ_ft_i⁻¹ finite (modulo the centre); (ii) if J_f is sufficiently small, all Γ_i (modulo Z_G(F) ∩ J_f) are trivial and S(J_f, M) ≅ M^h is finite free when M is; (iii) for M = V_λ ⊗ ℂ, S(J_f, V_λ) ≅ Hom_{G(F_∞)}(V_λ^∨, A(G)^{J_f}) (algebraic modular forms of weight λ are automorphic forms whose archimedean component is the finite-dimensional V_λ^∨), compatibly with Hecke operators; so the irreducible G(𝔸_f)-constituents of lim_J S(J, V_λ ⊗ ℂ) are the finite parts of automorphic representations π with π_∞ ≅ V_λ^∨, each appearing with multiplicity m(π).

*Hypotheses.* G(F_∞) compact modulo centre; for (ii) J_f sufficiently small.

*Proof outline.*

1. (i) Finiteness of class numbers (AdelicAlgebraicGroups:AA.3/class-number-finite) and discreteness of G(F) in G(𝔸_f) (compactness at infinity), so Γ_i is discrete in the compact t_iJ_ft_i⁻¹, hence finite.
2. (ii) A sufficiently small J_f has torsion-free projection at some v, and Γ_i embeds in it.
3. (iii) For φ ∈ A(G) with G(F_∞) compact, K_∞ = G(F_∞) and automorphic forms are G(F_∞)-finite; the V_λ^∨-isotypic part is V_λ^∨ ⊗ Hom(V_λ^∨, A(G)); evaluate at g_∞ = 1 to get V_λ-valued functions on G(𝔸_f) (Gross, Proposition 8.3).

*Acceptance.* Definite quaternion algebra, λ = 0: S(J_f, ℂ) = constants ⊕ cusp part, the constants being the trivial representation (Eisenstein part). GL_1 over a number field is not compact at infinity (ℝ^× and ℂ^× are not compact modulo A_∞ when r_1 + r_2 ≥ 2), so the hypothesis excludes it; the norm-one torus of an imaginary quadratic field, with T(ℝ) = S¹ compact, satisfies it.

*Prerequisites.* `AF.5/algebraic-modular-forms`, `AF.2/automorphic-form`, `AF.2/automorphic-representation`, `AdelicAlgebraicGroups:AA.3/class-number-finite`, `AdelicAlgebraicGroups:AA.4/neat-level-exists`.

*Sources.* bcgp25 (§5.7, arXiv p. 133): “This is a semi-simple admissible Q2 [G(A∞ F + )]-module, and by [Lab11, Cor. 5.3, Thm. 5.9] the irreducible submodules of ıAλ are the ﬁnite parts of automorphic rep- resentations of G/F + which arise as the descents” — A_λ = lim_U S_λ(U, ℚ̄_2) and its irreducible constituents as finite parts of automorphic representations.

### Theorem: Restriction of scalars, products and central characters

Node `AF.5/transport-compatibilities`, declaration `TauCeti.Automorphic.automorphicForm_resScalarsEquiv` in `TauCeti/Automorphic/AlgebraicModularForm`.

(i) For a finite extension E/F and G over E, Res_{E/F}G(𝔸_F) = G(𝔸_E) and Res_{E/F}G(F) = G(E) as topological groups (AdelicAlgebraicGroups:AA.1/base-change-adelic); this identifies A(Res_{E/F}G) with A(G) (with 𝔤_∞ and K_∞ matched) and automorphic, cuspidal and cohomological representations on both sides (Res_{E/F}V_λ ↔ V_λ, and ℓ₀, q₀ are preserved). (ii) For G = G_1 × G_2, A(G) ⊇ A(G_1) ⊗ A(G_2) with dense image in the relevant topologies; irreducible automorphic representations of G are exactly π_1 ⊠ π_2 with π_i automorphic, and cuspidal ones are products of cuspidal ones. (iii) Central characters: A(G) = ⊕_ω A(G)_{(ω)} over characters ω of Z_G(F)\Z_G(𝔸) (generalized eigenspaces), the decomposition being compatible with (i)-(ii). Inner forms: no identification of automorphic forms on G and an inner form G' is asserted; transfer (Jacquet–Langlands and endoscopic) is owned by the transfer roadmaps (GL2AutomorphicRepresentationsAndTransfer R17.3, EndoscopicTransferAndUnitaryTraceComparison).

*Hypotheses.* E/F finite separable; G_1, G_2 reductive over F.

*Proof outline.*

1. (i) Points of Weil restrictions (ReductiveGroupsPartII RG2.0a; AdelicAlgebraicGroups AA.1 base change of adelic points) and Lie algebras Lie(Res G)(ℝ) = Lie(G)(E ⊗ ℝ).
2. (ii) Products: Z(𝔤_1 × 𝔤_2) = Z(𝔤_1) ⊗ Z(𝔤_2), K = K_1 × K_2; irreducible admissible modules of a product are exterior tensor products (Getz–Hahn Theorem 7.11); automorphy of each factor by restricting to G_i(𝔸) × {1}.
3. (iii) Z_G(𝔸)-finiteness of automorphic forms (from K_∞-finiteness, J_f-invariance and Z(𝔤)-finiteness), then simultaneous generalized eigenspace decomposition for the commutative group Z_G(F)\Z_G(𝔸)/(Z ∩ J_f).

*Acceptance.* Res_{K/ℚ}GL_2 for K real quadratic: automorphic forms on it are Hilbert automorphic forms on GL_2/K. GL_2 is the quotient of G_m × SL_2 by μ_2, not a direct product, so (ii) does not apply to it; it applies only to direct products.

*Prerequisites.* `AdelicAlgebraicGroups:AA.1/base-change-adelic`, `AdelicAlgebraicGroups:AA.1/product-adelic`, `ReductiveGroupsPartII:RG2.0a`, `AF.2/automorphic-representation`, `AF.3/cuspidal-automorphic-representation`, `AF.4/cohomological-representation`.

*Sources.* getz-hahn (§7.3, Theorem 7.11, p. 37): “Let G1 , G2 be locally compact totally disconnected groups and let G = G1 × G2 .” — Irreducible admissible representations of products (the finite-place input of (ii)).

**Coverage of AF.5.** Status: planned. Refinements for the next pass:

- Hilbert modular (totally real F) form of the GL_2 dictionary: AF.2/holomorphic-sl2-forms covers SL_2 over totally real fields; GL_2 over totally real fields with parallel and non-parallel weights is GL2AutomorphicRepresentationsAndTransfer R16.6's instantiation.
- Inner forms: no transport is planned here; transfer theorems are owned by GL2AutomorphicRepresentationsAndTransfer R17.3 and EndoscopicTransferAndUnitaryTraceComparison.

## Requests to other roadmaps

- **ShimuraData:D3** — Kostant representatives ^MW of W_M\W, the longest element w_{0,M} of the Levi M_μ of the Siegel parabolic, and the coordinates of X^*(T) for GSp_{2g} used by Boxer–Pilloni §1.3, as data that AF.4 can quote. Needed by: `AF.4/harris-limits-gsp2g`, `AF.4/hermitian-positive-system`.
- **ShimuraData:D5** — ρ, the dominant and antidominant cones X^*(T)^±_ℚ and the explicit GSp_4 root datum in the coordinates (a, b; c) with X^*(T) = {c ≡ a+b mod 2}, as data for the chambers C_0-C_3. Needed by: `AF.4/harris-limits-gsp2g`, `AF.4/gsp4-discrete-series`.
- **ArithmeticLocallySymmetricSpaces:ALS.1** — Betti cohomology H^•(X_K, L) with coefficients in local systems attached to J_f-stable lattices L of algebraic representations (AF.4/coefficient-lattices supplies the lattices), with its E-rational structure. Needed by: `AF.4/torsion-hecke-eigenclasses`, `AF.4/clozel-rationality`.
- **ArithmeticLocallySymmetricSpaces:ALS.3** — Hecke action of the abstract Hecke algebra on H^•(X_K, L) and on its reductions, compatible with change of lattice. Needed by: `AF.4/torsion-hecke-eigenclasses`, `AF.4/clozel-rationality`.
- **ArithmeticLocallySymmetricSpaces:ALS.5** — The comparison of Betti cohomology with relative Lie algebra cohomology of automorphic forms in characteristic zero, Hecke equivariant, as needed to realise cuspidal cohomological π in H^•(X_K, V_λ). Needed by: `AF.4/clozel-rationality`.
- **AutomorphicSpectralTheory:AS.5** — The identification of cuspidal cohomology H^•_cusp(X_K, V_λ ⊗ ℂ) with ⊕_π m(π)H^•(𝔤, K; π_∞ ⊗ V_λ) ⊗ (π^∞)^K and its Hecke stability. Needed by: `AF.4/clozel-rationality`.
- **AutomorphicSpectralTheory:AS.4** — The space A_{(2)}(G) of square-integrable automorphic forms (discrete spectrum) as a (𝔤, K) × G(𝔸_f)-module, for the coherent L²-cohomology H^i_{(2),σ}. Needed by: `AF.4/coherent-relative-cohomology`.
- **AutomorphicLFunctionsAndLocalFactors:AL.3** — Genericity (existence of a global Whittaker model) of cuspidal automorphic representations of GL_n, used in Clozel's purity lemma to apply Vogan's generic unitary dual at infinity. Needed by: `AF.4/clozel-purity`.
- **ArithmeticLocallySymmetricSpaces:ALS.0** — A Cartan involution θ of G(F_∞) for connected reductive G over a number field, the maximal compact subgroup K_∞ = G(F_∞)^θ, G°-conjugacy of maximal compact subgroups, and the diffeomorphism K_∞ × 𝔭 → G(F_∞), so that G(F_∞)/K_∞ ≅ 𝔭. AF.1 builds (𝔤, K_∞)-modules for this K_∞ and AF.1a uses G/K ≅ 𝔭 for van Est. Needed by: `AF.1/real-reductive-group`, `AF.1a/cartan-iwasawa-malcev`.
- **AutomorphicLFunctionsAndLocalFactors:AL.0** — The integral representation K_ν(y) = ½∫_ℝ e^{−y cosh t − νt}dt of the K-Bessel function with K_{−ν} = K_ν, and the fact that the solutions of the Fourier-coefficient ODE of a Laplace eigenfunction of moderate growth on y > 0 are multiples of √y K_{ir}(2π|n|y) (PAPER-ZHANG-21/98 route to AL.0). Needed by: `AF.3/maass-cusp-forms`.
- **ReductiveGroupsPartII:RG2.0a** — Weil restriction Res_{E/F} of affine group schemes with (Res_{E/F}G)(R) = G(R ⊗_F E) functorially, used to identify Res_{E/F}G(𝔸_F) with G(𝔸_E). Needed by: `AF.5/transport-compatibilities`.
- **ReductiveGroupsPartII:RG2.4** — The Iwasawa and Cartan decompositions of SL_2 over a nonarchimedean local field (SL_2 = N·T·SL_2(O) and SL_2(O)·diag(ϖ^n, ϖ^{−n})·SL_2(O)), used to show that N(ϖ^{−c−1}O) and N^-(ϖ^cO) generate SL_2. Needed by: `AF.3/sl2-generation`.
- **SmoothRepresentationsOfLocalGroups:SR.0:abelian-category** — The abelian category of smooth complex representations of G(F_v), compact-open invariants V^K and admissibility, and the Aut(ℂ)-twist of smooth representations; used for Flath's theorem and fields of rationality. Needed by: `AF.2/flath-factorization`, `AF.4/rationality-field`.
- **SmoothRepresentationsOfLocalGroups:SR.1** — The Hecke algebra C_c^∞(G(F_v)) of locally constant compactly supported functions with convolution and the idempotents e_K = vol(K)⁻¹1_K, and H(G//K) = e_K C_c^∞ e_K, for the finite factors of adelic test functions. Needed by: `AF.0/adelic-test-functions`, `AF.0/finite-hecke-action`, `AF.2/spherical-dimension-one`.
- **SmoothRepresentationsOfLocalGroups:SR.3** — Admissibility of irreducible smooth complex representations of G(F_v) (dim π^K < ∞) and Schur's lemma for them, as inputs to Flath's factorization. Needed by: `AF.2/flath-factorization`.
- **SmoothRepresentationsOfLocalGroups:SR.4** — Commutativity of the spherical Hecke algebra C_c^∞(G(F_v)//K_v) for K_v hyperspecial (through the Satake isomorphism), so that dim π_v^{K_v} ≤ 1 (RT-AREA-automorphic-1/26). Needed by: `AF.2/spherical-dimension-one`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic** — Import: classification of continuous characters of ℝ^× and ℂ^×, ContinuousInfinityType and AlgebraicInfinityType, HeckeCharacter.IsAlgebraic (type A_0). Needed by: `AF.1/archimedean-llc-gln`, `AF.1/weil-group-real`, `AF.5/gl1-dictionary`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient** — Import: K discrete in 𝔸_K and 𝔸_K/K compact, with the Haar probability measure on 𝔸_K/K and Fourier analysis (character orthogonality) on it. Needed by: `AF.2/nongeneric-automorphic`, `AF.3/sl2-fourier-vanishing`, `AF.3/unipotent-quotient-compact`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters** — Import: the carrier HeckeCharacter K = ContinuousMonoidHom(IdeleClassGroup K, ℂˣ), local components, finite conductor, shift and unitary part. Needed by: `AF.5/gl1-dictionary`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus** — Import: modular forms with character (nebentypus) for Γ_0(N), Γ_1(N) and diamond operators. Needed by: `AF.5/gl2-classical-to-adelic`, `AF.5/gl2-dictionary`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra** — Import: Hecke operators T_p on modular forms with character and their coset description. Needed by: `AF.5/gl2-hecke-normalisation`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor** — Import: newforms, the conductor and multiplicity one for classical newforms. Needed by: `AF.5/gl2-dictionary`.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules** — Import: representations of reductive groups as comodules and the highest-weight description of irreducible representations over a splitting field. Needed by: `AF.4/algebraic-weight`.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation** — Import: Lie(G), the differential of homomorphisms and the Lie algebra of a closed subgroup, for comparison with the real Lie algebra of G(ℝ). Needed by: `AF.1/real-points-lie-group`.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical** — Import: the structure of unipotent groups in characteristic zero (composition series with vector-group quotients). Needed by: `AF.3/unipotent-quotient-compact`.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups** — Import: reductive and semisimple groups and their centres. Needed by: `AF.1/real-reductive-group`.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory** — Import: Borel subgroups, maximal tori, parabolic subgroups and Levi decompositions, root data with Weyl group; the dynamic description P(λ) of parabolics. Needed by: `AF.3/anisotropic-cuspidal`, `AF.3/constant-term`, `AF.4/algebraic-weight`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-0-normalized-haar-measure-and-averaging** — Import: normalised Haar measure and averaging on compact groups. Needed by: `AF.1a/van-est-acceptance`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-2-complete-reducibility** — Import: complete reducibility of continuous finite-dimensional representations of compact groups. Needed by: `AF.1/k-finite-vectors`, `AF.1a/gk-module`, `AF.1a/relative-cohomology-functoriality`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem** — Import: the Peter–Weyl theorem (density of matrix coefficients and the L² Hilbert basis). Needed by: `AF.1/k-finite-vectors`, `AF.1/principal-series`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem** — Import: the closed-subgroup theorem (closed subgroups of finite-dimensional real Lie groups are embedded Lie subgroups with Lie algebra lieSubalgebraOfSubgroup). Needed by: `AF.1/real-points-lie-group`, `AF.1a/invariant-forms-complex`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms** — Import: complexification of Lie algebras of real Lie groups and real forms. Needed by: `AF.1a/gk-pair`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions** — Import: the Cartan decomposition K × 𝔭 → G and the Iwasawa decomposition G = KAN for real reductive groups. Needed by: `AF.1/principal-series`, `AF.1/real-reductive-group`, `AF.1a/cartan-iwasawa-malcev`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition** — Import: root space decompositions of complex reductive Lie algebras with respect to a Cartan subalgebra. Needed by: `AF.4/hermitian-positive-system`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles** — Import: the highest-weight classification of finite-dimensional irreducible representations. Needed by: `AF.4/algebraic-weight`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations** — Import: the centre Z(U(L)), central characters χ_λ and the Harish-Chandra isomorphism with the dot action. Needed by: `AF.1/infinitesimal-character`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n** — Import: reductive Lie algebras (𝔤 = 𝔷 ⊕ [𝔤,𝔤]) and their irreducible representations, for the Harish-Chandra isomorphism of reductive 𝔤_ℂ. Needed by: `AF.1/infinitesimal-character`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element** — Import: chambers, the strict fundamental domain property of the closed dominant chamber and the longest element w_0. Needed by: `AF.1/discrete-series`, `AF.4/algebraic-weight`, `AF.4/gsp4-discrete-series`, `AF.4/harris-limits-gsp2g`, `AF.4/infinitesimal-character-of-weight`.

## Gaps

- **Smooth differential forms on manifolds.** The invariant-form complex Ω^•(G/K; V)^G needs smooth V-valued differential forms of every degree on a manifold with the exterior derivative and the Poincaré lemma. Mathlib has forms only on normed spaces (Analysis/Calculus/DifferentialForm) and Tau Ceti only smooth two-forms; no roadmap of the atlas plans the smooth de Rham complex of a manifold. The van Est proof can bypass forms through the smooth cochain complex (Wockel §3) for the cohomological statement, but the layer's invariant-form target needs the de Rham complex. Affects: `AF.1a/invariant-forms-complex`, `AF.1a/van-est-isomorphism`.
- **Cartan–Iwasawa–Malcev for non-reductive Lie groups.** For general Lie groups with finitely many components the existence and conjugacy of maximal compact subgroups and G/K ≅ ℝ^d (Cartan–Iwasawa–Malcev–Mostow) are stated with their proof route only; no freely readable proof source was read. All consumers in the atlas (BorelRegulators, Polylogarithms, ALS.5) use reductive G(ℝ), which is covered through ALS.0 and Tau Ceti LieGroups Layer 9. Affects: `AF.1a/cartan-iwasawa-malcev`.
- **Dixmier–Malliavin proof source not read.** The original proof (J. Dixmier, P. Malliavin, Factorisations de fonctions et de vecteurs indéfiniment différentiables, Bull. Sci. Math. (2) 102 (1978) 305-330) is not freely available and was not read; the node states the theorem as quoted by Bernstein–Krötz Remark 2.19, BPCZ (2.5.3.2) and Jiang–Zhang Appendix A, with the proof route only. A follow-up must read the proof and decompose the factorization of rapidly decreasing sequences. Affects: `AF.1/dixmier-malliavin`.
- **Langlands classification and discrete series proofs not read.** The proofs of the Langlands classification (Langlands, Math. Surveys Monogr. 31, 1989) and of Harish-Chandra's discrete series theorems (Acta Math. 113 (1965), 116 (1966)) are not freely available and were not read. The nodes state the theorems as the cited papers use them. A follow-up must read a proof source (for example Knapp, Representation theory of semisimple groups, Chapters IX-XIV) and refine the two nodes, at lemma level, into Casselman's asymptotics, the standard intertwining operators and Harish-Chandra's character theory. Affects: `AF.1/langlands-classification`, `AF.1/discrete-series`.
- **Proof source for the archimedean local Langlands correspondence.** Knapp’s [public author-hosted survey](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf) has been read in §§2–4, pp.399–406, including the explicit GL_n correspondence. Its construction and theorem statements are available; a complete classification/proof-closure audit and the local factor bridge to AL.2 remain required. The local factor comparison retains its gamma and additive-character conventions. Affects: `AF.1/archimedean-llc-gln`.
- **Vogan's unitary dual not read.** Vogan, The unitary dual of GL(n) over an archimedean field, Invent. Math. 83 (1986) 449-505, is not freely available and was not read; the node records the statement as Jiang–Zhang (B.5) use it. Affects: `AF.1/vogan-generic-unitary-dual`.
- **Harish-Chandra's convolution lemma: proof source not read.** The lemma 'a K-finite Z(𝔤)-finite smooth function satisfies φ = φ * α for some α ∈ C_c^∞' (Harish-Chandra, Automorphic forms on semisimple Lie groups, LNM 62, 1968, Theorem 1; Borel–Jacquet §1.? in Corvallis I) is used with its proof route only: neither source is freely available and neither was read. Affects: `AF.2/automorphic-forms-uniform-growth`.
- **Proof source for rapid decay of cusp forms.** The proof of rapid decay (Harish-Chandra, LNM 62 (1968), Lemma 10; Moeglin–Waldspurger, Spectral decomposition and Eisenstein series, I.2.18; Borel–Jacquet §4 in Corvallis I) is not freely available and was not read; the node records the statement and the proof route through the estimate φ − φ_P on Siegel sets. Affects: `AF.3/cusp-form-rapid-decay`.
- **Proof sources for Borel–Wallach, Blasius–Harris–Ramakrishnan, Harris, Clozel not read.** Borel–Wallach (Continuous cohomology…, 2nd ed., 2000), Blasius–Harris–Ramakrishnan (Duke 73, 1994), Harris (Perspect. Math. 11, 1990; J. Differential Geom. 32, 1990), Clozel (Motifs et formes automorphes, 1990), Pitale–Schmidt (IMRN 2009) and the full Vogan–Zuckerman proofs were not read; the nodes record statements from the papers that use them, at their locators. A follow-up reads these sources and refines the proofs. Affects: `AF.4/borel-wallach-tempered-range`, `AF.4/bhr-coherent-cohomology`, `AF.4/mirkovic-tempered-coherent`, `AF.4/bhr-large-weight`, `AF.4/harris-limits-gsp2g`, `AF.4/clozel-purity`, `AF.4/clozel-rationality`, `AF.4/gln-tempered-cohomological`, `AF.4/vogan-zuckerman`.

## Corrections to the sources

Each correction is recorded in the packet's `sourceIssues`; the nodes use the corrected statements.

- `AutomorphicFormsOnReductiveGroups/E1` (error, getz-hahn, §6.4, Lemma 6.19 and Remark 6.20 (p. 33), repeated in §6.5 (p. 34); notes version of 13 March 2015). Printed: “Sk (Γ) −→ A0 (Γ, ξk , h∆ − (k 2 − 1), Zi) ... One also computes that ∆φ = (1/4)(k 2 − 1)φ”. Correction: With ∆ = (1/4)(H² + 2XY + 2YX), a weight-k form φ_f killed by the lowering operator satisfies ∆φ_f = (k(k−2)/4)φ_f; the ideal is ⟨∆ − k(k−2)/4, Z⟩. Reason: The notes' own §6.5 gives ∆v_ℓ = (k(k−2)/4)v_ℓ on the discrete series π_k generated by such forms. Check at k = 2: weight-2 holomorphic forms have the infinitesimal character of the trivial representation, on which ∆ acts by 0, whereas (k²−1)/4 = 3/4. With the printed ideal the target space of Lemma 6.19 is 0 for k ≥ 2, so the stated isomorphism is false as printed. Known: new.
- `AutomorphicFormsOnReductiveGroups/E2` (misprint, getz-hahn, §8, proof of Proposition 8.6, p. 40). Printed: “If Cc∞ (G//K) is commutative then dim(V K ) = 1 for all irreducible admissible representations V”. Correction: dim(V^K) ≤ 1 for all irreducible admissible V (V^K may be 0). Reason: A supercuspidal representation of GL_2(ℚ_p) has no GL_2(ℤ_p)-fixed vectors, so dim V^K = 0; the Gelfand-pair criterion only needs ≤ 1. Known: new.
- `AutomorphicFormsOnReductiveGroups/E3` (misprint, cg20, §2.2, p. 810 (arXiv:1907.08691v1 p. 8)). Printed: “We are then forced to take Φ+ to be the set of roots appearing in C(Lie B)C −1”. Correction: Only the noncompact part Φ_n^+ is forced by the condition Φ_n^+ = roots of 𝔭^+; the compact positive root ±(1,−1;0) is a further choice. Reason: Both {(1,−1;0)} ∪ Φ_n^+ and {(−1,1;0)} ∪ Φ_n^+ are positive systems (each is the positive system of a regular element of the corresponding chamber) with the same noncompact part. Known: PAPER-CALEGARI-GERAGHTY-20 sourceIssues E16 (recorded by its extraction).
- `AutomorphicFormsOnReductiveGroups/E4` (misprint, cg20, §5.3, p. 828 (arXiv:1907.08691v1 p. 21)). Printed: “Weyl chambers C0 , . . . , C4 ⊂ X ∗ (T ) ⊗Z R ∼ = R3 are defined in Section 2.0.1.”. Correction: There are four chambers C_0, …, C_3 (as listed immediately after), defined in §2.1. Reason: The list that follows contains exactly C_0, C_1, C_2, C_3; |W_G/W_M| = 4 for GSp_4. Known: PAPER-CALEGARI-GERAGHTY-20 sourceIssues E40.
- `AutomorphicFormsOnReductiveGroups/E5` (error, pilloni20, §5.1.6, p. 22, and §15.2.1, p. 107 (author's PDF)). Printed: “−λ1 ≥ λ2 ≥ λ1 (p. 22); −λ1 ≥ λ2 > −λ1 (p. 107)”. Correction: −λ_1 ≥ λ_2 > λ_1 in both places. Reason: λ_2 = λ_1 is a compact wall, which carries no (limit of) discrete series; the region −λ_1 ≥ λ_2 > −λ_1 printed on p. 107 is empty. Known: PAPER-PILLONI-20 sourceIssues E23 and E151.
- `AutomorphicFormsOnReductiveGroups/E6` (misprint, pilloni20, §15.2.2, Theorem 15.2.2.1(2), p. 108 (author's PDF)). Printed: “There is a constant R such that if λ1 ≥ R and”. Correction: −λ_1 ≥ R. Reason: The theorem concerns λ = (λ_1, 0; c) with λ_1 < 0, so λ_1 ≥ R > 0 is impossible; large weight means −λ_1 large. Known: PAPER-PILLONI-20 sourceIssues E159.
- `AutomorphicFormsOnReductiveGroups/E7` (misprint, boxer-pilloni, §1.3.3, p. 3 (authors' preprint)). Printed: “We define C(κ) = {w ∈ M W, −w−1 w0,M (κ + ρ) ∈ X ⋆ (T )+ }.”. Correction: The condition must be read in X^*(T)_ℚ (κ + ρ need not be integral), as in the definition on p. 48: w⁻¹w_{0,M}(κ + ρ) ∈ X^*(T)^−_ℚ. Reason: ρ is half-integral for GSp_{2g}, so −w⁻¹w_{0,M}(κ+ρ) is not in X^*(T) in general and the set as printed can be empty. Known: PAPER-BOXER-PILLONI-26 sourceIssues E3.
- `AutomorphicFormsOnReductiveGroups/E8` (error, boxer-pilloni, §1.3.7, Theorem 1.3.8, p. 4 (authors' preprint)). Printed: “There exists a unique non degenerate limit of discrete series representation π∞ (κ, w) of G(R), with the property that π∞ (κ, w) ⊗ Vκ has (pµ , K∞ )-cohomology in degree ℓ(w).”. Correction: Existence holds with π_∞(κ, w) determined by (κ, w); the degree ℓ(w) does not determine it, so the uniqueness clause as phrased (by the cohomology property) is dropped. Reason: Distinct w, w' ∈ C(κ) of the same length give non-isomorphic limits of discrete series with cohomology in the same degree (already for GSp_4 with singular ν + ρ, where C(κ) has two elements of length 1 in suitable weights). Known: PAPER-BOXER-PILLONI-26 sourceIssues E5.
- `AutomorphicFormsOnReductiveGroups/E9` (misprint, ding25, §4.2.2, arXiv:2407.21237 p. 72). Printed: “Let Wξ,τ be a GLn (OFv+ )-invariant OE -lattice of the locally algebraic representation σ(τv) ⊗E L(ξv)”. Correction: W_{ξ,τ} should be a ∏_{v ∈ S_p∖{℘}} GL_n(O_{F_v^+})-invariant lattice in ⊗_{v ∈ S_p∖{℘}} σ(τ_v) ⊗ L(ξ_v). Reason: It is acted on by ∏_{v∈S_p∖{℘}} U_v in the definition of S_{ξ,τ} that follows. Known: noted in PAPER-DING-25/4.2-unitary-setup.

## Proposed restructuring

- **split** (AutomorphicFormsOnReductiveGroups). AF.1 combines the algebraic and analytic foundations ((𝔤, K)-modules, Harish-Chandra modules, infinitesimal characters, Casselman–Wallach globalization, Dixmier–Malliavin) with the classification of irreducible representations (tempered and discrete series, Harish-Chandra parameters, Langlands classification, W_ℝ and Langlands' correspondence for GL_n(ℝ), GL_n(ℂ), Vogan's generic unitary dual). RT-AREA-automorphic-1/2 asks for the classification to be planned (archimedean local Langlands) and proposes AF.1b as one option. Proposal: Create AutomorphicFormsOnReductiveGroups:AF.1b ‘Real reductive representation theory’ containing casselman-embedding, tempered-square-integrable, discrete-series, langlands-classification, weil-group-real, archimedean-llc-gln, gl2-real-discrete-series, vogan-generic-unitary-dual and casselman-wallach-globalization. Preserve current node ids pending maintainer integration. AF.1 keeps the real group and algebraic Harish-Chandra interfaces, infinitesimal characters, principal-series and norm/Schwartz prerequisites; AF.1a supplies compatible pairs, modules and cochains. Casselman embedding precedes classification; globalization consumes embedding and the classification/discrete-series reduction. AF.1b imports these independent AF.1/AF.1a prefixes and supplies AF.2, AF.4, AL.2/AL.3, R16.2/R16.6 and ET.1. AL.1 retains Tate’s rank-one factors; the higher Weil-representation factor dictionary is AL.2 using the single AF classification owner. Do not introduce a second AL.1a classification. The current stages are unsplit, so this proposal is not a claim of full stage-graph closure. Discrete series are modulo centre with compact-Cartan rank and central-character conventions, not equality of real split ranks. Define matrix-coefficient integrability on a supplied continuous/unitary realization before general globalization; compare with the canonical SAF realization afterwards. Keep the original existence/classification proofs and this comparison as explicit gaps.
- **rescope** (AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, BorelRegulators). RT-AREA-automorphic-1/29: the relative Lie algebra cochain complex was planned in both AF.1 and AF.1a, and RS-04 names AF.1 its owner. AF.1a must not depend on AF.1's analysis. Proposal: AF.1a owns pairs (𝔮, K), (𝔮, K)-modules and the relative Lie algebra cochain complex with functoriality, long exact sequences and cup products (nodes AF.1a/gk-pair, gk-module, relative-lie-cochain-complex, relative-cohomology-functoriality; the last three also realise AF.1). Add the stage edge AF.1a → AF.1. Redirect RS-04's owner entry 'Relative Lie algebra cochain complex' and its link AF.1 → AS.5 to AF.1a → AS.5; BorelRegulators R.2 keeps importing from AF.1a. AF.1's description should say that it imports the (𝔤, K)-module category and relative cochains from AF.1a.
- **rescope** (AutomorphicFormsOnReductiveGroups, AdelicAlgebraicGroups). RS-04 links AdelicAlgebraicGroups AA.3 → AF.1 (heights feed the real representation theory), while the AdelicAlgebraicGroups packet's node AA.3/height-representation-comparison requests the archimedean norm comparison from AF.1, which would make AF.1 and AA.3 depend on each other. Proposal: Keep RS-04's direction AA.3 → AF.1: AA.3 proves the comparison ‖g‖_ι' ≤ C‖g‖_ι^N for real points as well (it is polynomial algebra on matrix entries and needs no representation theory), and AF.1 imports it (AF.1/sf-representation uses AA.3/height-representation-comparison). The AdelicAlgebraicGroups request to AF.1 should be withdrawn in its revision. In addition add the stage edges ALS.0 → AF.1 (Cartan involutions), AF.1 → AF.0 (Lie group structure of G(F_∞)), SR.4 → AF.2 (RT-AREA-automorphic-1/26), ALS.1, ALS.3, ALS.5, AS.5 → AF.4 (RT-AREA-automorphic-1/30), AS.4 → AF.4 (A_(2)(G) for coherent L²-cohomology), ShimuraData D3, D5 → AF.4, AutomorphicLFunctionsAndLocalFactors AL.0 → AF.3 (K-Bessel functions) and AL.3 → AF.4 (genericity of cuspidal GL_n representations). Use the exact earlier supplier prefixes: the combined packet graph still has stage-boundary cycles, including ALS.5 → AF.4 → ALS.5. The separate AF.4 local-prefix and ALS.5 comparison/application splits below are required before claiming acyclicity of these exports.

## Acceptance for the roadmap

The roadmap is complete when: every function space of AF.0 has its subspace, morphism, scalar-extension and finite-level API; the van Est isomorphism is proved for the four acceptance cases of AF.1a (a compact group by averaging, a real vector group with trivial coefficients, GL_n(ℂ)/U(n) in the regulator range, and GL_2(ℝ) with its component action); Casselman–Wallach globalization holds for every Harish-Chandra module of a real reductive group; a noncuspidal automorphic form of moderate growth (the constant function, and the holomorphic Eisenstein series of AutomorphicSpectralTheory AS.1) lies in the correct growth space, and the trivial representation is automorphic but not generic; the GL_1 and GL_2/ℚ dictionaries hold with every normalisation fixed (central character, slash action, Casimir eigenvalue k(k−2)/4, Hecke operators), translation and the Lie action agree in the GL_2 dictionary, and arithmetic cohomology comparisons respect the Hecke normalisations.

## Suggested Lean file

`research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean` gives the signatures of the definitions and constructions, their API items and unit tests (as examples) and the named theorems, with every proof left as a placeholder, against Mathlib only (the shared build does not contain the pinned Tau Ceti). Objects owned by other roadmaps appear as named stand-ins (`AdelicData`, `DerivedAction`, `ParabolicData`). Items whose statement needs structures that neither Mathlib nor this prototype provides (smooth differential forms on manifolds, the explicit pairs (𝔤𝔩_n, O(n)), Hermitian discrete series as (𝔤, K)-modules, L² spaces of automorphic quotients, GL_2 over the adeles) are listed in comments by their packet names with the reason. The file elaborates in the shared build at Mathlib 082e2d3 with no errors; its only warnings are the placeholder proofs.

## Round-3 ownership boundaries

RT-AREA-automorphic-1/30: local cohomological weights must precede Betti comparison; rationality and torsion eigenclasses consume it.

Export an early AF.4:local-weights prefix with algebraic-weight, coefficient-lattices, cohomological-representation, wigner-lemma and vogan-zuckerman. Its current fine-node inputs are AF.1/AF.1a, AA.1 integral models and the existing highest-weight/root suppliers; it imports no ALS or AS.5 result. Keep torsion-hecke-eigenclasses after ALS.1/ALS.3, and clozel-rationality after the actual ALS.5 comparison and AS.5 inputs, retaining its GL_n and explicitly conditional general-group scopes. ALS.5 and AS.5 comparison proofs may use the local prefix, never this rationality suffix. Coordinate with the existing ALS.5 comparison versus automorphic-applications split; preserve node ids until maintainer integration.

### Consumer contracts for the AF real and cochain prefixes

The real-representation and local-weight splits are proposals, not integrated stages. Globalization must consume the Casselman/classification/discrete-series reduction in the single real owner. ALS.4 requests the AF.1a absolute algebraic cochain complex over a characteristic-zero E, compatible Levi action and parabolic Kostant theorem: the existing relative complex over C is not that exact supplier. Extend the sole AF.1a owner rather than construct cochains in ALS.4. Mathlib already has low-degree absolute Lie cochains; the requested output is the full compatible complex and Kostant result, not a second low-degree theory. Original proof sources and native signatures remain governed by the existing gaps/revision, with no integral or mod-p Kostant claim.

Needed by: `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`; `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`; `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`.

### Initial real matrix coefficients and later globalization comparison

The tempered/square-integrable definition now uses a supplied continuous SF or unitary Hilbert realization, before the general Casselman–Wallach theorem. Decompose the independent unitary discrete-series construction, unitary induction and nondegenerate-limit classification used by the real classification/globalization proof, and prove that the coefficient predicates agree with the eventual canonical SAF realization. These original Harish-Chandra/Knapp–Zuckerman proof interiors are unread as recorded by the existing source gaps. This removes the circular definition CW → classification → temperedness → CW; it does not assert existence or classification from the supplied-realization definition. Algebraic Harish-Chandra inputs and supplied global realizations remain distinct until the comparison is proved.

Needed by: `AutomorphicFormsOnReductiveGroups:AF.1/tempered-square-integrable`; `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`; `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`.
