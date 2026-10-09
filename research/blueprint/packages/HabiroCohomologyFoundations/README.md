# q-Hodge filtrations and Habiro cohomology

This roadmap constructs global q-de Rham cohomology, q-Hodge filtrations on
specified classes of algebras, and the resulting Habiro–Hodge descent. The
parameter q starts near 1, but a Habiro-complete object records all cyclotomic
neighborhoods. A chosen q-Hodge filtration supplies the compatibility needed to
pass from one neighborhood to all of them. Its reductions connect derived de
Rham forms, q-de Rham–Witt forms and local prismatic cohomology.

The endpoints are a symmetric monoidal Habiro–Hodge functor on algebras with a
chosen q-Hodge filtration, canonical sections on the stated smooth and
quasi-regular classes, and algebraic Habiro cohomology of smooth schemes over
ℤ with the required small primes inverted. Comparison squares explain exactly
which classical theories are reached, after which coefficient changes. The
analytic Habiro comparison and two compatibility equalities with classical
A_inf specializations are additional mathematical problems, with their missing
interfaces stated below.

## Boundaries and prerequisites

The following ownership conventions keep the constructions reusable.

| Supplier | Imported mathematics and use |
| --- | --- |
| HabiroRings HR.1 | Arithmetic Λ-rings, commuting Adams operations and perfect coverage. |
| HabiroRings HR.2 | Derived Habiro completion, cyclotomic conservativity, completed tensor and its bounded-below solid version. |
| HabiroRings HR.4 | Relative q-Witt rings, degree-zero ghosts, Frobenius, Verschiebung and Teichmüller maps. |
| HabiroRings HR.5 | Cyclotomic complete descent, Frobenius-glued relative Habiro rings and Taylor equalizers. |
| QW.5 and QW.6:framings | Shared positive-degree q-Witt calculus and complete framed difference calculus. This roadmap constructs these interfaces in HQ.4 and HQ.1, respectively; QW.5 and QW.6:framings designate their common interface owners. Degree-zero q-Witt theory is imported from HR.4. |
| DerivedDeRhamCohomology DD.1–DD.2 | Enhanced completion, fracture squares, animation, cotangent complexes, derived de Rham and filtered scalar extension. |
| EnhancedDerivedSheaves E0, E1 and E5:abstract | Enhanced categories, affine/étale descent, fully faithful pushouts, and the dual-fibration description of oplax tensor functors. E4 reuses DD.1 completion rather than defining a second completion theory. |
| AInfCohomology AI.1 | Generic Koszul complexes, Berthelot–Ogus décalage and its filtered and completion properties. |
| PrismaticCohomology PR.0, PR.3, PR.6 | δ-rings and prisms; relative Frobenius and Nygaard; local q-crystalline sites, envelopes and framed comparisons. |
| AInfCohomology AI.3–AI.5, CrystallineCohomology CR.2/CR.4 and CohomologyComparisons CP.1 | AΩ, canonical perfectoid specializations, the PD Poincaré lemma, ordinary de Rham–Witt/crystalline comparison and their normalization. |
| RefinedTraceMethods RT.4:q-Hodge, RT.4:Habiro-comparison and RT.6 | Spherical-lift existence from TC and its arithmetic exports. Prismatic filtrations are constructed independently before trace comparisons. |
| AnalyticHabiroStack HS.3 | The analytic coefficient ring and stack needed to state the open comparison. These do not enter the algebraic construction. |

HR.6 and HabiroNumberFields HB.6/HB.7 consume the finite étale exports; their
arithmetic modules do not become prerequisites for this roadmap. No six-functor
formalism, diamond or Langlands construction is needed here. Local
q-crystalline theory is imported from PR.6; the global arithmetic gluing is the
new construction in HQ.1.

The native algebraic starting point is Mathlib at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, with Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`. Reuse `Polynomial`, `PowerSeries`,
`MvPolynomial`, modules, linear maps, monoid algebras, finite projectivity,
ordinary categorical diagrams, Kähler differentials, étale and smooth
algebras, cyclotomic polynomials and degree-zero Witt vectors. In particular:

- `geom_sum_mul`, `geom_sum_succ` and `one_geom_sum` provide the q-integer
  identities. `Polynomial.cyclotomic_prime`,
  `Polynomial.cyclotomic_prime_mul_X_sub_one` and
  `Polynomial.eval_one_cyclotomic_prime` provide the prime cyclotomic formula
  and its specialization. Their prime hypothesis is `Fact p.Prime`.
- `Algebra.Etale` means formally étale and of finite presentation;
  `Algebra.Smooth` means formally smooth and of finite presentation.
  `KaehlerDifferential.D` and `KaehlerDifferential.linearMapEquivDerivation`
  supply the ordinary universal derivation and its universal property.
- `IsAdicComplete` is ordinary completeness and separatedness of modules.
  Its presence does not supply the enhanced derived completion used below.
  Ordinary `DerivedCategory` does not supply the coherent totalizations,
  homotopy fixed points and filtered enhanced categories required here.
- Cyclotomic association and `WittVector.fontaineTheta_teichmuller` support
  the native coefficient calculations in HQ.8. Their presence does not
  construct AΩ, a prismatic site or its comparison maps.

HQ.4 precedes HQ.3 in construction order: its twisted q-Witt and Nygaard
objects are inputs to the chosen-filtration descent, while its framed
constructions do not use that descent.

## Conventions

Write h=q−1, f_m=q^m−1 and [r]_q=Σ_{j=0}^{r−1}q^j. Unless a smaller condition is
stated, HQ.1–HQ.2 assume a Λ-base A torsion-free at every prime; HQ.3 onward
assume A perfectly covered. Only the base carries Adams operations. Smooth
algebras over it need not carry a compatible Λ-structure. A fixed-prime
construction uses the p-completed base Â_p and p-completed input, with all
complexes implicitly p-completed when specified locally.

All categorical limits, colimits, quotients and tensors in the cohomological
constructions are derived and enhanced. A quotient M/f is a cofiber, not its
ordinary degreewise quotient. Completed tensors include the displayed
completion ideal. Rationalizing and then p-completing kills rational objects;
p-completing and then inverting p has a different value. Infinite prime
products cannot be interchanged with rationalization without the stated
uniform denominator estimate.

Filtrations descend: F^{i+1}→F^i. In filtered quotients f_m has filtration
degree one, so (F/f_m)^i=cofib(f_m:F^{i−1}→F^i). Ascending conjugate and q-Witt
filtrations have the opposite direction. We use cohomological degrees for
complexes and homological degrees for cotangent Tor-amplitude. An underived
form module Ω^i in cohomological degree i is written Ω^i[−i]; a derived form and
its already shifted graded piece are distinguished explicitly.

The global smooth object is qΩ, its polynomial animation is qdR, its chosen
filtration modification is qHdg, and its Habiro descent is H(R,F), also called
the Habiro–Hodge object. These names distinguish constructions rather than
claiming that they coincide. Smooth qΩ is the filtration completion of qdR
only when a suitable q-Hodge filtration is chosen. The modification colimit
precedes h-completion; the Habiro limit is taken along coherent factorial
transitions. Ordinary framed q-connections, modified torus connections and
homotopy-coherent derived equivariance are distinct notions.

Every target below includes its prerequisites and a source locator. A source
may supply an input or announce an assertion whose proof still needs
construction; those cases are stated explicitly. API names describe the maps,
relations and universal properties specified in the target and its examples.
They are a proposed naming interface, not a claim that the cohomology theory is
already implemented. The suggested Lean file has ordinary algebraic and
categorical signatures and explicit omissions wherever the required enhanced
condition is unavailable.

## Sources

Page numbers refer to the following fixed public versions and to their printed
pagination. Numbered paragraphs share the statement counter in the Wagner
papers. Stacks Project pages are unpaginated HTML, identified by section,
statement number and stable tag instead of a page number.

- **QH:** Ferdinand Wagner, [q-Hodge complexes over the Habiro ring](https://arxiv.org/pdf/2510.04782v2), v2. The main constructions here use §§3–4 and Appendix A; coefficient infrastructure is in §2 and Appendix B.
- **QW:** Ferdinand Wagner, [q-Witt vectors and q-Hodge complexes](https://arxiv.org/pdf/2410.23078v5), v5, §§3–5.
- **KU:** Ferdinand Wagner, [q-de Rham cohomology and topological Hochschild homology over ku](https://arxiv.org/pdf/2510.06057v1), v1, §§1, 3, 4 and 6.
- **TC:** Samuel Meyer and Ferdinand Wagner, [q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4), v4, §3.2.
- **BS:** Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), v4, §§15–18 and the base-change theorem in §4.
- **BMS1:** Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), v3, §§6 and 14.
- **BMS2:** The same authors, [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2), v2, §5 and Theorem 1.12.
- **Sch:** Peter Scholze, [Canonical q-deformations in arithmetic geometry](https://arxiv.org/pdf/1606.01796v1), v1, §§2–4 and 7.
- **DAG VIII:** Jacob Lurie, [Quasi-Coherent Sheaves and Tannaka Duality Theorems](https://www.math.ias.edu/~lurie/papers/DAG-VIII.pdf), 5 November 2011, §§2.6–2.7, pp.66–76.
- **Stacks:** [Derived completion](https://stacks.math.columbia.edu/tag/091N), §15.93; [étale cohomology of quasi-coherent sheaves](https://stacks.math.columbia.edu/tag/03OY), §59.22; [quasi-coherent sheaves and presentations](https://stacks.math.columbia.edu/tag/06WT), §96.14, Proposition 96.14.3; and [finite projective modules](https://stacks.math.columbia.edu/tag/00NV), §10.78, Lemma 10.78.2. The ordinary results are enhanced by their named suppliers before use here.

## HQ.1 — Global q-de Rham and framed connections

Construct the global object from local q-crystalline and rational de Rham inputs. Then derive its sheaf descent, and distinguish framed connections from lattice-equivariant torus modules.

### Imported local theory and common framed calculus

Import PR.6's local theory. If p is prime, A is a p-torsion-free Λ-ring and S is p-completely smooth over Â_p, qΩ_{S/Â_p} is q-crystalline cohomology for the q-PD pair (Â_p[[h]],(h)), complete for (p,h). Its prismatic realization is Δ_{S^(p)[ζ_p]/Â_p[[h]]} for the prism ideal ([p]_q), with S^(p)=(S⊗_{A,ψ^p}A)^∧_p. These ideals have different quotients. The common complete framed difference calculus serves both local and global constructions; HQ.1 constructs that shared interface, designated QW.6:framings, while PR.6 supplies the local comparison. Mathlib's geometric-sum identities supply q-integers.

Prerequisites: PrismaticCohomology PR.6, HabiroRings HR.1, Mathlib geom_sum_mul, Mathlib Polynomial.eval_geom_sum, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_pow_eq_geom_sum, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.prod_cyclotomic_eq_geom_sum.

Source: QH §A, pp.69–76; Theorem A.1(b), §A, p.69; §A.1, p.70.

### The coordinate-dependent q-de Rham complex of a framed smooth algebra

For an étale framing A[x_1,…,x_d]→S of a smooth A-algebra, construct commuting A[[h]]-automorphisms γ_i of S[[h]] by x_i↦qx_i and x_j↦x_j for j≠i. Uniqueness of complete étale lifting gives γ_i≡id modulo h and modulo x_i. Flatness over the polynomial algebra makes (h,x_i) regular, so D_i=(γ_i−id)/(hx_i) exists uniquely. Form K(S[[h]];D_1,…,D_d), with terms Ω^j_{S/A}[[h]] and differential Σ_i D_i dx_i. Its API includes D_i(x_i^r)=[r]_q x_i^(r−1), D_i(x_j)=0 for j≠i, pairwise commutation and D_i(fg)=D_i(f)γ_i(g)+fD_i(g). The construction uses no Λ-structure on S and works over any A. For I-completely étale framings, I=(h) or (p,h), retain complete flatness, separatedness and the regularity required for division. The p-completed comparison is PR.6's.

Prerequisites: HQ.1, AInfCohomology AI.1, Mathlib Algebra.Etale, Mathlib KaehlerDifferential.

Source: QH Theorem A.1(d), §A, p.69; Paragraph 1.10, §1, p.6; Example 3.12, §3, p.25.

API: `qOmegaFramed` (constructor); `qOmegaFramed.gamma` (data); `qOmegaFramed.qPartial` (data); `qOmegaFramed.qPartial_X_pow` (simp); `qOmegaFramed.qPartial_mul` (relation); `qOmegaFramed.qPartial_comm` (relation); `qOmegaFramed.modQSubOne` (compatibility); `qOmegaFramed.pCompletion` (compatibility); `qOmegaFramed.equivQOmega` (equivalence).

Examples:

- For A = ℤ, S = ℤ[x] and the identity framing, qΩ* is ℤ[x]⟦q−1⟧ → ℤ[x]⟦q−1⟧dx with x^n ↦ [n]_q x^{n−1}dx. For instance x^3 ↦ (1+q+q^2)x^2dx, which is 7x^2dx at q = 2.
- For d = 0 (S étale over A, empty framing) the complex is S⟦q−1⟧ in degree 0.
- Modulo q−1 the differential is the de Rham differential: for S = A[x], x^n ↦ n x^{n−1}dx.
- The ordinary Leibniz rule fails. q∂(x·x) = (1+q)x, while x·q∂(x) + q∂(x)·x = 2x. The twisted rule q∂(x·x) = q∂(x)·γ(x) + x·q∂(x) = qx + x holds.

### The local derived q-de Rham complex at a prime, and its agreement with the underived one on smooth algebras

For a fixed p and a p-torsion-free Λ-base A, animate the p-complete local functor on completed polynomial Â_p-algebras, then p-complete. This defines qdR on p-complete animated Â_p-algebras, valued in (p,h)-complete E∞-algebras. Reduction by h gives p-completed derived de Rham cohomology. On p-completely smooth inputs the map qdR→qΩ is an equivalence, detected modulo (p,h) using smooth derived de Rham in characteristic p. All complexes relative to a p-complete base here are implicitly p-completed. The equality on smooth inputs is local at p.

Prerequisites: HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.3, DerivedDeRhamCohomology DD.4, CrystallineCohomology CR.2.

Source: QH §A.1, p.70; Convention A.3, §A, p.70.

API: `qdRLocal` (constructor); `qdRLocal.equivQOmega` (characterisation); `qdRLocal.modQSubOne` (projection); `qdRLocal.leftKanExtension` (universal-property); `qdRLocal.map` (functoriality).

Examples:

- For R = Â_p the value is Â_p⟦q−1⟧.
- For R = Â_p⟨x⟩, the p-completed polynomial ring in one variable, the value is the completed two-term complex Â_p⟨x⟩⟦q−1⟧ → Â_p⟨x⟩⟦q−1⟧dx, x^n ↦ [n]_q x^{n−1}dx.
- Modulo q−1 the value is the p-completed derived de Rham complex dR_{R/Â_p}; for R smooth, the p-completed de Rham complex.
- For A = ℤ and R = 𝔽_p, the value modulo q−1 is dR_{𝔽_p/ℤ_p} ≃ ℤ_p, crystalline cohomology of 𝔽_p over ℤ_p, not 𝔽_p. The derived complex of a non-smooth quotient is not a q-de Rham complex of the quotient.

### After rationalisation, derived q-de Rham cohomology is a base change of derived de Rham cohomology

For p-torsion-free A and p-complete animated R over Â_p, construct a coordinate-free, natural equivalence (qdR_{R/Â_p}⊗^Lℚ)^∧_h ≃ (dR_{R/Â_p}⊗^Lℚ)[[h]], inducing the identity modulo h. Both input complexes are p-completed before rationalization. Use PD and q-PD envelopes, the denominator estimates below and derived complete conservativity. Rationalization followed by h-completion is essential.

Prerequisites: HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.4, DerivedDeRhamCohomology DD.1.

Source: QH Lemma A.4, §A, p.70; §A.1, p.70.

### Denominator estimates for δ and for the q-divided power in the rationalised q-PD envelope

Choose a surjection P↠S from a p-completely ind-smooth δ-Â_p-algebra, with S p-completely smooth, kernel J, p-completed PD envelope D and q-PD envelope qD. Extend δ with δ(q)=0. In (qD⊗ℚ)^∧_h write γ_q(x)=φ(x)/[p]_q−δ(x). For n,α≥1, δ(h^n qD)⊂h^n qD and δ(p^(−α)h^n qD)⊂p^(−(pα+1))h^n qD. The corresponding γ_q images lie in h^(n+1)qD and p^(−(pα+1))h^(n+1)qD. Flatness of qD over ℤ_p[[h]] supplies p-regularity and the intersection calculation. Here [p]_q is inverted only in the rational h-complete ring.

Prerequisites: HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0.

Source: QH Lemma A.5, §A, p.71; Lemma A.5(b), §A, p.71.

### The iterated divided power expansion in the rationalised q-PD envelope

With the same envelope data, define γ(x)=x^p/p in qD⊗ℚ. For x∈J and n≥1, find y_0,…,y_n∈qD, with y_0 admitting q-divided powers, such that γ^(n)(x)=y_0+Σ_{i=1}^n p^(−2(1+p+⋯+p^(i−1)))h^(p−2+i)y_i. The superscript denotes iteration. This is an identity after rationalization and does not assert integrality of γ^(n)(x). The δ-structure on P is arbitrary over the base; a framing is unnecessary.

Prerequisites: HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.0.

Source: QH Lemma A.6, §A, p.71.

### The reverse expansion: iterated q-divided powers in the rationalised PD envelope

The reverse estimate is an h-adically convergent expansion in D⊗ℚ[[h]]: γ_q^(n)(x)=y_0+Σ_{i≥1}p^(−2(1+p+⋯+p^(i−1)))h^(p−2+i)y_i, where y_i∈D and y_0 admits ordinary divided powers. Consequently, for each animated R and truncation order n, the p-completed map qdR→(dR)^∧_p[1/p][[h]]/h^n lands in p^(−N)(dR)^∧_p[[h]]/h^n for some N depending on p and n. No estimate uniform in p is supplied in this direction. This bound serves the later filtration comparisons.

Prerequisites: HQ.1, CrystallineCohomology CR.0, PrismaticCohomology PR.6.

Source: QH Remark A.7, §A, p.72; Lemma 3.29, §3, p.38; Lemma 4.27, §4, p.65.

### One denominator that works for every prime at once

Set N_n=∏_{ℓ≤n prime}ℓ^(2(1+ℓ+⋯+ℓ^(n−1))), with N_0=N_1=1. In the forward envelope comparison D→(qD/h^n)⊗ℚ, the image lies in N_n^(−1)qD/h^n for every p. For a torsion-free Λ-base and animated R, these bounds give maps from each local dR into N_n^(−1)qdR/h^n and hence an equivalence (∏_p dR_{R̂_p/Â_p}⊗^Lℚ)[[h]] ≃ (∏_p qdR_{R̂_p/Â_p}⊗^Lℚ)^∧_h. The denominator independent of p is what permits rationalization of the product; replacing it by the product of rationalizations changes the statement.

Prerequisites: HQ.1, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.1.

Source: QH Paragraph A.11, §A, p.74.

### Koszul complexes are unchanged by twisting each endomorphism by a suitably commuting automorphism

Import the generic Koszul complex from AI.1. For commuting endomorphisms g_i of an abelian group and commuting automorphisms u_i, assume u_i g_j=g_j u_i for i≠j. Then the u_i g_i commute, and K(M;g_i)≅K(M;u_i g_i), using ∏_{i∈I}u_i on the summand indexed by I. No assumption u_i g_i=g_i u_i is allowed: it fails for the rational framed application.

Prerequisites: AInfCohomology AI.1.

Source: QH Paragraph A.8, §A, p.73.

### The explicit framed comparison after rationalisation

For B=A or B=Â_p and an étale or p-completely étale framing T_i of smooth S, compare rational h-completed framed q-de Rham and ordinary de Rham complexes. The operator factor is D_i=(log(q)/h+Σ_{r≥2}(log(q)^r/(r!h))(∂_i∘T_i)^(r−1))∂_i, where ∂_i∘T_i means multiplication by T_i followed by ∂_i. The parenthesis is an automorphism equal to id modulo h, commuting with ∂_j for j≠i. Apply the Koszul twist lemma. The same comparison holds for framed ind-smooth PD and q-PD envelopes P↠S; there use δ(T_i)=0, extended uniquely through ind-étale maps. Powers are iterates, not divided powers. Logarithms occur only rationally and h-completely.

Prerequisites: HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0.

Source: QH Paragraph A.8, §A, p.73; Lemma A.9, §A, p.73; Theorem A.1, §A, p.69.

### The coordinate-free and the explicit framed comparisons agree

For the framed envelope situation, prove equality of the two routes from rational h-completed q-crystalline cohomology to the ordinary PD de Rham model: the coordinate-free envelope comparison followed by the crystalline PD realization, and PR.6's framed q-crystalline realization followed by the explicit Koszul comparison. The result is a commuting square, with independently constructed horizontal maps. It supplies the compatibility needed for arithmetic gluing.

Prerequisites: HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.2.

Source: QH Lemma A.10, §A, p.74.

### The global q-de Rham complex, as a pullback of p-completions and rational de Rham data

For a Λ-ring A torsion-free at every prime and a smooth A-algebra S, define qΩ_{S/A} in h-complete E∞-A[[h]]-algebras as the pullback of ∏_p qΩ_{Ŝ_p/Â_p} and (Ω^•_{S/A}⊗^Lℚ)[[h]] over (∏_p Ω^•_{Ŝ_p/Â_p}⊗^Lℚ)[[h]]. The map out of the prime product uses the uniform-denominator equivalence, followed in the required direction by rationalization and h-completion. Its local smooth animated/underived identifications are p-complete. This map is not an equivalence. The definition is functorial in S and uses no global q-crystalline site.

Prerequisites: HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.4, EnhancedDerivedSheaves E5.

Source: QH Construction A.12, §A, p.75; §A, pp.69–76.

API: `qOmega` (constructor); `qOmega.isPullback` (characterisation); `qOmega.toPCompletion` (projection); `qOmega.toRational` (projection); `qOmega.map` (functoriality); `qOmega.modQSubOne` (compatibility); `qOmega.baseChange` (compatibility); `qOmega.equivFramed` (equivalence).

Examples:

- For A = ℤ and S = ℤ[x], qΩ_{S/A}/(q−1) is the two-term complex ℤ[x] → ℤ[x]dx of that ring and its module of differentials.
- If A is a ℚ-algebra, every Â_p vanishes, so both right-hand corners vanish and qΩ_{S/A} is Ω*_{S/A}⟦q−1⟧, the trivial q-deformation.
- For A = ℤ and S = ℤ[x] with the identity framing, qΩ_{S/A} is the q-difference complex ℤ[x]⟦q−1⟧ → ℤ[x]⟦q−1⟧dx, x^n ↦ [n]_q x^{n−1}dx.
- For A = S = ℤ, qΩ_{S/A} is ℤ⟦q−1⟧, while the product over all primes of the p-complete complexes is Π_p ℤ_p⟦q−1⟧. A definition that dropped the rational corner would already be wrong here.

### The global complex deforms de Rham, is prismatic at every prime, and is rationally trivial

For this global functor, prove natural equivalences qΩ/h≃Ω^•, (qΩ)^∧_p≃qΩ_{Ŝ_p/Â_p}≃Δ_{S^(p)[ζ_p]/Â_p[[h]]}, and (qΩ⊗^Lℚ)^∧_h≃(Ω^•⊗^Lℚ)[[h]]. In the local equivalence the prism ideal is ([p]_q) and S^(p) is completed Adams base change. The hypotheses are smoothness of S and prime-by-prime torsion-freeness of A; perfect coverage is unnecessary.

Prerequisites: HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1.

Source: QH Theorem A.1(a), §A, p.69; Theorem A.1(b), §A, p.69; Theorem A.1, §A, p.69.

### For a framed smooth algebra, the global complex is the coordinate-dependent complex

For the same A and an étale-framed smooth S, identify the underlying derived A[[h]]-module qΩ_{S/A} with K(S[[h]];D_i). Compare their completed arithmetic fracture squares, using the local q-crystalline realization and the compatible rational framed comparison. This identifies underlying complexes; it does not identify a chosen framing with a canonical E∞-model.

Prerequisites: HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1.

Source: QH Theorem A.1(d), §A, p.69; Theorem A.1, §A, p.69.

### Base change for the global q-de Rham complex, with its (q−1)-completion

If A→A′ is a morphism of Λ-rings, both torsion-free at every prime, and S is smooth over A, prove (qΩ_{S/A}⊗^L_A A′)^∧_h≃qΩ_{S⊗_A A′/A′}. A′ need not be flat. Smoothness makes ordinary and derived base change of S agree, while the complex still uses derived tensor and h-completion. Reduction by h is smooth de Rham base change. Already ℤ[[h]]⊗ℚ≠ℚ[[h]], so completion cannot be deleted.

Prerequisites: HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1.

Source: QH Theorem A.1, §A, p.69.

### Comparison maps between framed models, and the cocycle identity

For three étale framings of the same smooth S, define the comparison from one Koszul model to another through qΩ_{S/A}. The identity framing comparison is id, and c_{3,2}c_{2,1}≃c_{3,1}, with coherence inherited from the common enhanced object. This is a formal consequence of the global framed equivalences on underlying derived modules. It does not assert framing independence of ordinary q-connections.

Prerequisites: HQ.1.

Source: QH Theorem A.1(d), §A, p.69; §A, pp.69–76.

### The de Rham complex of a smooth algebra is the totalisation of the PD envelopes of a Čech nerve

For smooth S over A and a functorial surjection P↠S from an ind-smooth A-algebra, take the Čech nerve P^• of A→P and ordinary PD envelopes of the kernels of P^•↠S. Identify Tot D^• with Ω^•_{S/A} as derived commutative A-algebras. The de Rham structure comes from its cdga structure, while the totalization structure comes from static rings. These envelopes are not p-completed.

Prerequisites: CrystallineCohomology CR.0, CrystallineCohomology CR.2, EnhancedDerivedSheaves E5.

Source: QH Paragraph A.13, §A, p.76.

### The global complex lifts to a derived commutative algebra, by cosimplicial PD realisations

Lift the global functor canonically from E∞-algebras to h-complete derived commutative A[[h]]-algebras. Use the envelope totalizations for all corners and maps of the defining pullback: ordinary PD, p-completed PD and q-PD Čech–Alexander realizations. The completion maps and rational envelope maps lift the two gluing arrows. Import the enhanced fact that the relevant limits and colimits are computed on underlying E∞-objects. This establishes the lift for these constructions, without asserting that an arbitrary E∞-algebra has such a lift.

Prerequisites: HQ.1, EnhancedDerivedSheaves E5, PrismaticCohomology PR.6, CrystallineCohomology CR.2.

Source: QH Paragraph A.13, §A, p.76.

API: `qOmegaDAlg` (constructor); `qOmegaDAlg.forget` (projection); `qOmegaDAlg.isPullback` (characterisation); `qOmegaDAlg.corners` (compatibility); `qOmegaDAlg.map` (functoriality).

Examples:

- Applying the forgetful functor recovers the E∞ q-de Rham complex, with the same three properties (a) to (c).
- Modulo q−1 the lift is Ω*_{S/A} with the derived commutative structure of its commutative differential graded algebra structure.
- For A = S = ℤ and P = ℤ[T] with T ↦ 0, the zeroth envelope D_P(J) is the divided power polynomial ring ℤ⟨T⟩, while Tot D^• is ℤ = Ω*_{ℤ/ℤ}. Taking the zeroth term instead of the totalisation is wrong.
- For S = A the lift is the unit A⟦q−1⟧.

### Étale descent for the global q-de Rham complex

For a smooth finitely presented S over a torsion-free Λ-ring A and a finite jointly surjective family of finitely presented étale S-algebras T_i, prove qΩ_{S/A}≃Tot qΩ_{T^•/A} in derived h-complete E∞-algebras. The Čech terms use products over all multi-indices of tensor-product overlaps. Only A has Adams operations. Reduction by regular h is a finite cofiber operation, hence commutes with the enhanced totalization. In each form degree, ordinary étale descent is the exact Amitsur resolution; the common finite range of forms controls convergence. Derived h-complete conservativity then proves the result. This supplies Zariski descent as well. No tensor product of qΩ over S is used: its differential is only A-linear.

Prerequisites: HQ.1, HabiroRings HR.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2.

Source: QH Theorem A.1(a), §A, p.69 · Stacks Definition 15.93.4, §15.93; Lemma 15.93.20, §15.93; Theorem 59.22.4, §59.22; Lemma 59.22.1, §59.22 (unpaginated HTML).

### Coherent framed Čech comparisons

For that entire étale Čech diagram, choose the global framed equivalence on each term and transport every face, degeneracy and augmentation through it. The resulting equivalence of enhanced diagrams identifies their totalizations and obeys the identities and cocycles of changes of framing. Arbitrary independently chosen termwise maps do not supply this statement. The finite étale-family and smooth finite-presentation hypotheses are those of the preceding descent theorem.

Prerequisites: HQ.1, EnhancedDerivedSheaves E0.

Source: QH Theorem A.1(d), §A, p.69 · Sch Conjecture 7.5, §7, p.16.

### The étale sheaf of global q-de Rham algebras

On a smooth finitely presented A-scheme X, evaluate U=Spec S↦qΩ_{S/A} on affine étale opens. The resulting derived h-complete E∞-A[[h]]-valued sheaf has section object Tot qΩ_{U^•/A} on a finite affine étale cover. Use DD.1's enhanced complete limits and E1's enhanced sheafification; an ordinary triangulated sheaf axiom is insufficient. This constructs a global q-de Rham sheaf and does not yet choose a q-Hodge filtration.

Prerequisites: HQ.1, EnhancedDerivedSheaves E2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2.

Source: QH Theorem A.1(a), §A, p.69 · Stacks Theorem 59.22.4, §59.22 (unpaginated HTML).

API: `qOmegaEtale` (constructor); `qOmegaEtale.affine` (equivalence); `qOmegaEtale.sections` (projection); `qOmegaEtale.cech` (characterisation); `qOmegaEtale.modH` (compatibility); `qOmegaEtale.restrict` (functoriality); `qOmegaEtale.ext` (universal-property).

Examples:

- For X=Spec S and its identity affine cover, sections identify with qΩ_{S/A} and the restriction is identity.
- For X=Spec S₁ ⊔ Spec S₂, sections are qΩ_{S₁/A}×qΩ_{S₂/A}; cross intersections contribute the zero-ring value.
- For Spec Z[x] covered by D(x), D(1−x), the section object modulo h is the ordinary de Rham Čech totalization, equivalent to Ω*_{Z[x]/Z}.

### Modules with framed flat q-connection

Let C=S[[h]] for an étale-framed smooth A-algebra with coordinates x_i and complete operators σ_i,D_i. A flat framed q-connection on a finite projective C-module M consists of commuting A[[h]]-linear ∇_i with ∇_i(fm)=σ_i(f)∇_i(m)+D_i(f)m. Morphisms are C-linear intertwining maps. Projectivity is over C; the completed flat étale prefix supplies the division defining D_i. Over A=ℤ this recovers Scholze's definition. Its independence of framing is a conjecture.

Prerequisites: HQ.1, Mathlib Module.Projective.

Source: Sch Definition 7.3, §7, p.15; Remark 7.4, §7, p.15.

API: `FramedQConnection` (constructor); `FramedQConnection.Hom` (data); `FramedQConnection.unit` (constructor); `FramedQConnection.modH` (compatibility).

Examples:

- On Z[T]⟦h⟧, ∇(T³)=(1+q+q²)T².
- An empty frame gives finite-projective C-modules with no extra operators.
- The equation at q=1 becomes ∇(fm)=f∇(m)+(∂f)m.
- For M=C and ∇=D, D(T)=1 but T·D(1)=0; a C-linear connection field would be wrong.

### Integer coordinate scaling on the torus

For a commutative B, unit q∈B× and C=B[ℤ^d], set σ_a(x^m)=q^⟨a,m⟩x^m for a,m∈ℤ^d, fixing B. Construct this B-algebra automorphism for every a, including negative coordinates, and prove σ_0=id, σ_{a+b}=σ_aσ_b and σ_{−a}=σ_a^(−1). This is the integer coordinate-scaling action, used for a quotient prestack rather than a coarse orbit space.

Prerequisites: Mathlib AddMonoidAlgebra, Mathlib AlgEquiv, HQ.1.

Source: Sch Definition 7.3, §7, p.15.

API: `torusScale` (constructor); `torusScale_single` (simp); `torusScale_zero` (simp); `torusScale_add` (functoriality); `torusScale_neg` (relation); `torusScale_unique` (extensionality).

Examples:

- For d=0 every σ_a is the identity, using the native B[Z^0] carrier.
- For q=1 and any d,a, σ_a is identity. The group of labels still exists.
- For d=1, a=(1), m=(−1), σ_a(single m 1)=single m q⁻¹.
- For d=2, a=(2,−1) and m=(−1,3), σ_a(single m 1)=single m q⁻⁵.

### Modified q-connections on a Habiro torus

A modified connection on C=B[x_1^±1,…,x_d^±1] is a C-module with commuting invertible σ_i-semilinear Γ_i. Define ∇̃_i=x_i^(−1)(Γ_i−id); its rule is ∇̃_i(fm)=σ_i(f)∇̃_i(m)+x_i^(−1)(σ_i(f)−f)m. Tensor products use Γ_i⊗Γ_i. All modules give the descent heart and finite projectives give vector bundles. There is no congruence modulo h and no division by h. Recovering an ordinary q-connection from Γ_i=id+hx_i∇_i requires h-completeness, continuity, regularity and the divisibility congruence as additional assumptions.

Prerequisites: HQ.1, Mathlib LinearEquiv.

Source: Sch Remark 7.4, §7, p.15.

API: `ModifiedQConnection` (constructor); `ModifiedQConnection.partial` (data); `ModifiedQConnection.recoverGamma` (relation); `ModifiedQConnection.tensor` (constructor); `ModifiedQConnection.fromOrdinary` (compatibility).

Examples:

- On M=C with Γ=σ, ∇̃(x^n)=(q^n−1)x^(n−1); no q−1 denominator.
- id+x_i∇̃_i returns Γ_i, including on negative Laurent exponents.
- Γ((fm)⊗n)=σ(f)Γ(m)⊗Γ(n)=Γ(m)⊗σ(f)Γ(n).
- On C=Q[x±1]⟦h⟧ with q=1+h, Γ(f)=2σ(f) is invertible but Γ(1)−1=1 is not divisible by h; it is not from an ordinary q-connection.

### Torus descent for modified q-connections

The ordinary equivariant-module category for the lattice action is the category of modified connections, equivalently modules over C⋊ℤ^d. Its enhanced analogue is QCoh([Spec C/ℤ^d])≃D(C)^{hℤ^d}. Here homotopy fixed points mean coherent descent, not commuting maps in the homotopy category. The action need not be free. The following two targets specify the enhanced import and its heart; this quotient comparison says nothing about analytic Habiro cohomology.

Prerequisites: HQ.1.

Source: Sch Conjecture 7.5, §7, p.16.

### Derived modified q-connections on a torus

Define the derived modified-connection category using the coherent action F_a(M)=C⊗^L_{C,σ_a}M, with coherent unit and composition equivalences. A descent isomorphism θ_a:F_aM≃M yields Γ_a(m)=θ_a(1⊗m), positive σ_a-semilinear. The underlying restriction-of-scalars twist of F_a is σ_a^(−1); reversing θ reverses the convention. Describe mapping spectra by homotopy fixed points of the conjugation action on Map_C(M,N), and supply the symmetric monoidal structure and t-exact action. A collection of commuting homotopy-category isomorphisms omits the higher cocycles.

Prerequisites: HQ.1, EnhancedDerivedSheaves E5:presentability, LanglandsParameterStacks LP1.

Source: DAG VIII Definition 2.7.8, §§2.6–2.7, pp.66–76.

API: `derivedModifiedQConnections` (constructor); `derivedModifiedQConnections.forget` (projection); `derivedModifiedQConnections.unit` (data); `derivedModifiedQConnections.tensor` (structure); `derivedModifiedQConnections.linearization` (projection); `derivedModifiedQConnections.fromStrict` (constructor); `derivedModifiedQConnections.mappingSpectrum` (characterisation); `derivedModifiedQConnections.isLimit` (universal-property).

Examples:

- For d=0 the category is D(B) via the native B[Z^0]≃B identification and the trivial group.
- For the unit, Γ_i(x^m)=q^{m_i}x^m, agreeing with the ordinary modified connection.
- For B=Q, q=1, d=1 and C=Q[x^{±1}], Hom(unit,unit[1])≅C, whereas the mapping group in D(C) is zero. The Z action has not been discarded.
- For B=Q,q=2,d=1,C=Q[x^{±1}], the unit θ_1:F_1(C)→C sends 1⊗x to 2x. Under η_1(c⊗m)=σ_1⁻¹(c)m its inverse C→F_1(C) sends x to x/2. Reversing θ while retaining positive semilinearity fails this test.

### Derived torus quotient comparison

For X=Spec C and the discrete lattice action, realize [X/ℤ^d] as the geometric realization of its action groupoid in prestacks and prove QCoh([X/ℤ^d])≃Tot QCoh(X×(ℤ^d)^•)≃D(C)^{hℤ^d}. QCoh is an enhanced right Kan extension from affines and sends colimits of prestacks to limits; each nerve term is a disjoint union of affines, giving a product indexed by lattice tuples. Do not invoke an affine, quasi-compact acting group theorem for the infinite discrete group. The comparison, its monoidality and its t-structure require E1's enhanced descent interface; ordinary groupoid sheaf descent is only the heart-level input.

Prerequisites: HQ.1, LanglandsParameterStacks LP1, EnhancedDerivedSheaves E5:presentability.

Source: DAG VIII Proposition 2.7.6; Definition 2.7.8; Remark 2.7.10; Proposition 2.7.14; Remark 2.7.15, §§2.6–2.7, pp.66–76.

### The heart, vector bundles and perfect complexes

Show that the descent t-structure has heart the modules with commuting invertible semilinear Γ_i. Under the quotient comparison, vector bundles correspond to finite projective underlying C-modules with this equivariance; perfect complexes correspond to equivariant complexes whose underlying C-complex is perfect, by affine-local perfectness. This condition is not compactness in the equivariant category. The restriction to perfect objects and the symmetric monoidal equivalence require coherent enhanced descent, while the all-module heart is an ordinary algebraic construction.

Prerequisites: HQ.1, LanglandsParameterStacks LP1.

Source: Stacks Proposition 96.14.3, §96.14 (unpaginated HTML) · DAG VIII Definition 2.6.14; Proposition 2.6.15; Definition 2.7.8; Remark 2.7.12; Proposition 2.7.20; Example 2.7.23; Remark 2.7.24; Proposition 2.7.28, §§2.6–2.7, pp.66–76.

## HQ.2 — Animation and filtered conventions

Fix the filtered coefficient conventions before extending qΩ by animation. The local smooth equivalence does not extend to all global smooth inputs.

### Enhanced filtered and completion conventions

Import stable enhanced modules, filtered/graded objects, derived completion and fracture squares from E1 and DD.1. Descending filtrations have F^{i+1}→F^i and gr^i=cofib(F^{i+1}→F^i); ascending ones have gr_i=cofib(F_{i−1}→F_i). Exhaustivity is colim_{i→−∞}F^i≃M and completeness is lim_{i→∞}F^i=0. Completion is lim_n cofib(F^{•+n}→F^•), with recovery by pullback along M→M̂. Day convolution requires tensor products preserving colimits separately. Fil(C)≃Mod_{1_Gr[t]}Gr(C), |t|=−1. Write M/f for a derived cofiber and M^*/f for cofib(M(i)→M) when |f|=i. Derived completion is lim_n M/(f_1^n,…,f_r^n). Ordinary quotients require Koszul regularity. Use the principal fracture square and complete conservativity, including its vanishing consequences.

Prerequisites: EnhancedDerivedSheaves E1, DerivedDeRhamCohomology DD.1.

Source: QH Paragraph 1.22(a), §1, p.10; Paragraph 1.22(c), §1, p.10; Paragraph 1.22(d), §1, p.10.

### The filtered coefficient ring as a graded ring with one generator in each direction

The Rees ring of h^•A[q] is A[β,t], |β|=1, |t|=−1 and q=1+βt. For f_m=q^m−1 it is A[q,β,t]/(βt−f_m), with |q|=0; f_m is regular even if A has zero divisors. For m≥2 q remains a separate generator. Quotient by t gives associated graded, quotient by β gives the filtered f_m quotient, and quotient by (β,t) gives its associated graded. Fix these degree conventions before forming q-Hodge pairs.

Prerequisites: HQ.2.

Source: QH Lemma 3.9, §3, p.23; Theorem 3.11, §3, p.25.

API: `coefficientRing` (constructor); `coefficientRing.equivFiltered` (equivalence); `coefficientRing.mod_t` (projection); `coefficientRing.mod_beta` (projection); `coefficientRing.mod_beta_t` (compatibility); `coefficientRing.q_eq` (relation).

Examples:

- In A[β, t], βt = q − 1 with q = 1 + βt. A presentation with βt = q, or with the degrees of β and t exchanged, fails this.
- A[β, t]/t is A[β], the graded ring ⊕_{n≥0} A·β^n. This is the associated graded ⊕_n (q−1)^nA[q]/(q−1)^{n+1}A[q] of the (q−1)-adic filtration, and q maps to 1 in it.
- A[β, t]/β is A[t], the filtered ring A with the trivial filtration (A in degrees ≤ 0, zero in positive degrees). q maps to 1.
- Modulo β the image of q is 1, not 0. The presentation is of the (q−1)-adic filtration; for the q-adic one the relation would be βt = q, and q would map to 0.

### The quotient of a filtered module by q^m-1 places the element in filtration degree one

For a filtered f_m^•A[q]-module, F/f_m means base change to the trivially filtered A[q]/f_m, placing f_m in filtration degree one. Its i-th piece is cofib(f_m:F^{i−1}→F^i), equivalently quotient by β in the Rees description. The degreewise cofiber of f_m:F^i→F^i is a different construction. Only for m=1 is the target coefficient ring A itself. Use this convention in every twisted-filtration and Nygaard comparison.

Prerequisites: HQ.2.

Source: QH Convention 3.1, §3, p.20.

API: `filQuotient` (constructor); `filQuotient.piece` (characterisation); `filQuotient.eq_mod_beta` (compatibility); `filQuotient.piece_of_nonpos` (projection); `filQuotient.map` (functoriality).

Examples:

- For fil^⋆M = (q−1)^⋆A[q] and m = 1, the quotient is A in filtration degrees ≤ 0 and 0 in degrees ≥ 1. Multiplication by q−1 from (q−1)^{n−1}A[q] to (q−1)^nA[q] is an isomorphism for n ≥ 1, so the result is the unit filtered ring A.
- In filtration degrees ≤ 0, for a filtration constant there, the quotient is the ordinary derived quotient of the underlying object.
- The degreewise quotient of (q−1)^⋆A[q] by q−1 has n-th piece (q−1)^nA[q]/(q−1)^{n+1}A[q] ≅ A for every n ≥ 0, with zero transition maps between positive degrees. It is nonzero in degree 1, where the convention gives 0.
- Under the graded presentation, the quotient is cofib(β: M(1) → M).

### The derived q-de Rham complex, by animation of the global complex on polynomial algebras

Animate the global qΩ functor on finite polynomial A-algebras for a torsion-free Λ-base, taking sifted colimits in h-complete E∞-algebras. Thus qdR_R=(|qΩ_{P_•/A}|)^∧_h for a polynomial simplicial resolution, independently of the resolution. It inherits the derived commutative lift, qdR/h≃dR and (qdR_R)^∧_p≃qdR_{R̂_p/Â_p}. Its arithmetic pullback uses the prime product, rational dR[[h]] and the rationalization of the prime product, with the uniform-denominator gluing map. Its agreement with qΩ is prescribed on polynomial algebras, rather than on every smooth algebra.

Prerequisites: HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, HabiroRings HR.1.

Source: QH Paragraph 1.22(b), §1, p.10; Paragraph A.14, §A, p.76.

API: `qdR` (constructor); `qdR.onPolynomial` (characterisation); `qdR.ofResolution` (characterisation); `qdR.modQSubOne` (projection); `qdR.pCompletion` (compatibility); `qdR.isPullback` (characterisation); `qdR.leftKanExtension` (universal-property); `qdR.toDAlg` (structure); `qdR.map` (functoriality).

Examples:

- For A = ℤ and R = ℤ[x], qdR_{R/A} is qΩ_{ℤ[x]/ℤ}, the two-term complex ℤ[x]⟦q−1⟧ → ℤ[x]⟦q−1⟧dx with x^n ↦ [n]_q x^{n−1}dx.
- qdR_{R/A}/(q−1) ≃ dR_{R/A}; for R a polynomial A-algebra this is Ω*_{R/A}.
- For a filtered colimit of polynomial algebras, the value is the (q−1)-completed colimit of the values. A construction through limits would fail this.
- For A = ℚ and S = ℚ[x, x^{−1}], which is smooth and a localisation of a polynomial algebra, qdR_{S/ℚ} ≃ ℚ⟦q−1⟧, because derived de Rham cohomology of any ℚ-algebra over ℚ is ℚ. But qΩ_{S/ℚ} = Ω*_{S/ℚ}⟦q−1⟧ has H^1 ≅ ℚ⟦q−1⟧, spanned by dx/x.

### Where animation changes the answer, and where it does not

Locally at p, qdR agrees with qΩ on p-completely smooth algebras. Globally animation changes smooth values: for S=ℚ[x^±1], qdR_{S/ℚ}≃ℚ[[h]], whereas qΩ=Ω^•_{S/ℚ}[[h]] has nonzero first cohomology. Ordinary Ω is the Hodge completion of derived dR. For smooth S with a chosen q-Hodge pair, qΩ is the corresponding q-Hodge completion of qdR, as proved in HQ.3.

Prerequisites: HQ.2, HQ.1, DerivedDeRhamCohomology DD.2.

Source: QH Paragraph A.14, §A, p.76; §A.1, p.70.

### Base change for the derived q-de Rham complex, with the completion it requires

For a Λ-map A→A′ between prime-by-prime torsion-free bases and any animated R, prove (qdR_{R/A}⊗^L_A A′)^∧_h≃qdR_{R⊗^L_A A′/A′}. No flatness of A′ is assumed. Both sides preserve the appropriate completed sifted colimits, so extend the polynomial base-change equivalence by animation. Reduction by h is derived de Rham base change. Keep the completed tensor even for R=A.

Prerequisites: HQ.2, HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.2.

Source: QH Theorem A.1, §A, p.69; Paragraph 1.22(b), §1, p.10.

### The combined Hodge and (q−1)-adic filtration

Define the combined Hodge/h-adic filtration by the h-completed Day tensor of fil_Hdg dR with h^•ℚ[q]. Its i-th piece is the h-completion of colim_{a+b≥i}fil_Hdg^a(dR⊗ℚ)⊗h^bℚ[q]. This is not Hodge completion. The p-completed version uses (dR)^∧_p[1/p] and Â_p[1/p]. Both are constant in degrees ≤0 and exist for every animated R. They are the rational targets of the q-Hodge axioms.

Prerequisites: DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.2.

Source: QH Definition 3.2(c), §3, p.20; Proposition 3.47(a), §3, p.48.

API: `combinedFiltration` (constructor); `combinedFiltration.pComplete` (constructor); `combinedFiltration.gr` (characterisation); `combinedFiltration.quotient` (compatibility); `combinedFiltration.of_nonpos` (projection); `combinedFiltration.toPComplete` (functoriality); `combinedFiltration.completion_smooth` (characterisation).

Examples:

- For R = A the Hodge filtration is A in degree 0 and nothing above, and the combined filtration is the (q−1)-adic filtration on (A ⊗ ℚ)⟦q−1⟧.
- For R = A[x], the n-th step is the subcomplex (q−1)^nA_ℚ[x]⟦q−1⟧ → (q−1)^{max(n−1,0)}A_ℚ[x]⟦q−1⟧dx of (Ω*_{A[x]/A} ⊗ ℚ)⟦q−1⟧. In particular fil^1 contains dx and q−1 but not 1.
- It is not the Hodge filtration tensored with the trivial filtration on ℚ⟦q−1⟧. For R = A[x] that would give fil^1 = Ω^{≥1}⟦q−1⟧, which does not contain q−1; the combined fil^1 does.
- Its quotient by q−1 in filtration degree one is fil^⋆_Hdg(dR_{R/A} ⊗ ℚ), as the diagram of Definition 3.2(c) requires.

### The rational comparison for the derived q-de Rham complex

The global derived arithmetic square gives a natural E∞-equivalence (qdR_{R/A}⊗^Lℚ)^∧_h≃(dR_{R/A}⊗^Lℚ)[[h]], equal to the canonical identification modulo h, for every animated R over a torsion-free Λ-base. On smooth underived inputs the corresponding statement is the global qΩ rational comparison.

Prerequisites: HQ.2, HQ.1, DerivedDeRhamCohomology DD.1.

Source: QH Definition 3.2, §3, p.20; Theorem A.1(a), §A, p.69.

### The p-completed rational comparison for the derived q-de Rham complex

For each prime, identify ((qdR_{R/A})^∧_p[1/p])^∧_h with ((dR_{R/A})^∧_p[1/p])[[h]], using the local rational equivalence and p-completed base change. The sequence is p-completion, inversion of p, then h-completion. The final completion matters: Σ_n p^(−n)h^n is absent from ℤ_p[[h]][1/p]. This is a separate operation from the global rational comparison.

Prerequisites: HQ.2, HQ.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2.

Source: QH Remark 1.8, §1, p.5; Lemma A.4, §A, p.70; Definition 3.2, §3, p.20.

### The two rational comparisons are compatible, and the p-completed one is a separate condition on filtrations

The global and p-completed rational comparisons commute with the maps to the rationalized p-completion and reduce by h to the natural de Rham maps. The unfiltered square follows from the construction. For filtrations, its refinement is an additional axiom (c_p), with coherence. The source leaves open whether this axiom follows from (a)–(c); no result here removes it.

Prerequisites: HQ.2, HQ.1.

Source: QH Remark 1.8, §1, p.5; Definition 3.2, §3, p.20.

### The decalage functor is imported; the q-specific applications are owned here

Import Lη_f, its cohomology formula and its natural filtration from AI.1, and relative prismatic Frobenius from PR.3. If α≥1 and qΩ is h-complete, [p^α]_q≡p^α mod h identifies its p-completion with [p^α]_q-completion, so (Lη_{[p^α]_q}qΩ)^∧_p≃Lη_{[p^α]_q}(qΩ)^∧_p. At α=0 the functor is id. For (B,J)=(Â_p[[h]],[p]_q) and T=S^(p)[ζ_p], transport Δ_{T/B}⊗̂_{B,φ_B}B≃Lη_JΔ_{T/B}, where φ_B acts by ψ^p and q↦q^p. The h-décalage application requires a chosen smooth q-Hodge pair. The canonical local décalage filtrations do not automatically glue.

Prerequisites: AInfCohomology AI.1, PrismaticCohomology PR.3, PrismaticCohomology PR.6, HQ.2, HQ.1.

Source: QH Paragraph 3.14, §3, p.28; Remark 3.49, §3, p.49.

## HQ.4 — q-de Rham–Witt and Nygaard

Import degree-zero rings from HR.4 and build the restriction-free differential theory. Construct Nygaard from prismatic Frobenius, then use it in the twisted q-Hodge descent.

### q-V-systems of commutative differential graded algebras, and the torsion-free variant

For a Λ-base A and arbitrary A-algebra R, define a q-V-system as cdgas P_m over A[q], with maps qW_m(R/A)→P_m^0 and transitive graded module maps V_{m/d}:P_d→P_m for d|m. Impose V_n(w dh)=V_n(w)dV_n(h) and V_n(w)dτ_m(r)=V_n(wτ_d(r)^(n−1))dV_n(τ_d(r)), n=m/d. Morphisms are compatible cdga maps. There are no restrictions. In a degreewise ℤ-torsion-free system the Teichmüller condition follows from the other laws; the resulting forgetful embedding is fully faithful. Derive V_n d=n dV_n and the V-divided-power derivation dV_p(x^p)=V_p(x^(p−1))dV_p(x). HR.4 supplies the relative rings and degree-zero operators.

Prerequisites: HabiroRings HR.4, HabiroRings HR.1.

Source: QW Definition 3.1, §3, p.37; Definition 3.9, §3, p.40; Remark 3.10, §3, p.40; Lemma 3.2, §3, p.38; Lemma 3.4, §3, p.38.

API: `QVSystem` (structure); `QVSystem.fromQWitt` (data); `QVSystem.verschiebung` (data); `QVSystem.verschiebung_trans` (relation); `QVSystem.verschiebung_mul_d` (relation); `QVSystem.teichmuller_V` (relation); `QVSystem.verschiebung_comp_d` (relation); `QVSystem.d_verschiebung_pow` (relation); `TorsionFreeQVSystem.toQVSystem` (functoriality).

Examples:

- The family m -> product over d | m of Omega_{R/A} tensored along the d-th Adams operation with A[zeta_d], with the product of the relative q-Witt ghost maps in degree zero and with V_{m/n}(w)_d = (m/n)^{i+1} w_d for d | n and 0 otherwise on a form w of degree i, is a q-V-system over R.
- Replacing the factor (m/n)^{i+1} in the ghost system by (m/n)^i breaks the product rule: for forms of degrees a and b the two sides of V(w dh) = V(w) dV(h) become (m/n)^{a+b+1} and (m/n)^{a+b} times the same form, so a definition with the naive exponent would exclude the ghost system.
- The zero family (every P_m zero) is a q-V-system and is the terminal one; in particular nothing in the definition forces P_1 to be the de Rham complex, which holds only for the initial object.
- Adding to the data A[q]-algebra maps P_m -> P_d commuting with the Verschiebungen would exclude the initial object: for A = R = Z, m = p and d = 1 such a map would give in degree zero a Z[q]-algebra map from Z[q]/Phi_p(q) to Z[q]/(q-1) = Z, which does not exist since it would force p = Phi_p(1) = 0 in Z.
- A family satisfying (a) and (b) whose members are degreewise Z-torsion free satisfies (tau_V), so it is a q-V-system.

### q-FV-systems: the Frobenius operators and the relations they satisfy

A q-FV-system adds transitive graded algebra maps F_n:P_m→P_d, n=m/d, extending the relative q-Witt Frobenius. Require F_n dV_n=d, V_n(wF_n(h))=V_n(w)h, commuting F_n,V_k for coprime n,k, F_nV_n=n, V_nF_n=[n]_{q^d}, and F_n(dτ_m(r))=τ_d(r)^(n−1)dτ_d(r). Derive dF_n=nF_n d. Frobenius is a graded algebra map rather than a chain map; Verschiebung is graded module-linear rather than multiplicative. The F-laws imply the V-product and V-Teichmüller conditions.

Prerequisites: HQ.4.

Source: QW Definition 3.6, §3, p.39; Definition 3.6(c), §3, p.39; Lemma 3.7, §3, p.39.

API: `QFVSystem` (structure); `QFVSystem.frobenius` (data); `QFVSystem.frobenius_d_verschiebung` (relation); `QFVSystem.verschiebung_mul_frobenius` (relation); `QFVSystem.frobenius_verschiebung_comm` (relation); `QFVSystem.frobenius_verschiebung` (relation); `QFVSystem.verschiebung_frobenius` (relation); `QFVSystem.teichmuller_F` (relation); `QFVSystem.d_frobenius` (relation).

Examples:

- For d = m both composites are the identity: F_{m/m} o V_{m/m} = 1 and V_{m/m} o F_{m/m} = [1]_{q^m} = 1.
- In degree zero of the initial q-FV-system for A = R = Z, V_2(F_2(1)) = V_2(1) = 1 + q in qW_2(Z/Z); its ghost component in Z[q]/(q+1) = Z is 0, while that of 2 is 2, so V_2 o F_2 is not multiplication by 2. A definition with the integer m/d in both composites would exclude the initial object.
- The Verschiebung is not multiplicative: in qW_2(Z/Z) = Z[q]/(q^2-1), V_2(1) V_2(1) = (1+q)^2 = 2(1+q), whose ghost components (4 at q = 1, 0 at q = -1) differ from those (2 at q = 1, 0 at q = -1) of V_2(1 . 1) = 1 + q. A definition making V a map of algebras would exclude the initial object.
- In degree zero and for m/d = p, the relation F_p o V_p = p is the analogue of Mathlib's WittVector.frobenius_verschiebung (F(V x) = x * p for p-typical Witt vectors), and the projection formula is the analogue of WittVector.verschiebung_mul_frobenius; the relation V_p o F_p = [p]_{q^d} replaces WittVector.verschiebung_frobenius, which holds only in characteristic p.

### Why there are no restrictions, and the comparison with ordinary de Rham-Witt that survives

Import HR.4's degree-zero obstruction to restriction maps: for prime-power indices over bases not of characteristic p, a compatible restriction would induce the incompatible cyclotomic quotient map. Since P_m^0=qW_m(R/A), the differential systems cannot acquire such restriction operators either. For maps of ℤ_(p)-algebras, import CR.4's precise restriction-free initiality of the ordinary Langer–Zink FV-pro-complex; this supplies the comparison below. No inverse limit along ordinary restrictions defines untruncated q-Witt objects here.

Prerequisites: HabiroRings HR.4, HQ.4, CrystallineCohomology CR.4.

Source: QW Paragraph 2.14, §2, p.13; Paragraph 3.11, §3, p.40.

### The m-truncated q-de Rham-Witt complex, as the initial q-V-system

Construct the initial q-V-system qW_mΩ_{R/A} for every A-algebra R. Starting at qW_1Ω=Ω_{R/A}, quotient Ω_{qW_m(R/A)/A[q]} by the differential ideal generated by proper-divisor V and Teichmüller relations. The canonical map from that de Rham complex is surjective, and qW_mΩ^0=qW_m(R/A). Extend initiality to divisor-closed truncation sets; for divisors of m a Λ_m-structure on A suffices. Prove functoriality and ordinary coefficient base change along Λ-maps. No h-completion or smoothness enters the definition; torsion-freeness is a later smooth theorem.

Prerequisites: HQ.4, HabiroRings HR.4, DerivedDeRhamCohomology DD.2.

Source: QW Proposition 3.12, §3, p.40; Proposition 3.12(a), §3, p.40; Definition 3.13, §3, p.40; Remark 3.14, §3, p.41; Lemma 3.16, §3, p.42.

API: `qWittOmega` (constructor); `qWittOmega.isInitial` (universal-property); `qWittOmega.isInitial_truncated` (universal-property); `qWittOmega.degreeZeroEquiv` (projection); `qWittOmega.oneEquiv` (example); `qWittOmega.surjective_ofKaehler` (projection); `qWittOmega.map` (functoriality); `qWittOmega.baseChangeEquiv` (compatibility); `qWittOmega.torsionFree_of_smooth` (characterisation).

Examples:

- For m = 1 the complex is the de Rham complex of R over A, and in degree zero the m-th member is qW_m(R/A).
- After inverting m, the ghost maps identify qW_m Omega_{R/A} with the product over d | m of Omega_{R/A} tensored along the d-th Adams operation with A[1/m, zeta_d].
- For an etale map R -> R' of A-algebras, qW_m Omega_{R'/A} is the extension of scalars of qW_m Omega_{R/A} along qW_m(R/A) -> qW_m(R'/A); a construction failing this would not be an etale sheaf.
- For A = R = Z, qW_m Omega_{Z/Z} is concentrated in degree zero, where it is qW_m(Z/Z), isomorphic to Z[q]/(q^m - 1) (q-Witt v5 Remark 2.47 and Corollary 2.37 for the perfect Lambda-ring Z); a construction with a non-zero positive-degree part here would contradict the surjection from the de Rham complex of Z[q]/(q^m - 1) over Z[q], which vanishes in positive degrees.

### The q-de Rham-Witt complex carries unique Frobenii and is the initial q-FV-system

The initial q-V-system has unique Frobenius operators satisfying the q-FV-laws, and is initial among q-FV-systems. Construct the operators inductively and prove their uniqueness using the generated differential relations. This upgrades the universal property without adding restriction operators.

Prerequisites: HQ.4, HabiroRings HR.4.

Source: QW Proposition 3.17, §3, p.42; Paragraph 3.19, §3, p.43 · QH Proposition 3.19, §3, p.31.

### The comparison map from ordinary de Rham-Witt complexes, compatible with Frobenius and Verschiebung

For a Λ-base that is also a ℤ_(p)-algebra and arbitrary R, use restriction-free ordinary FV initiality to construct W_{a+1}Ω_{R/A}→qW_{p^a}Ω_{R/A}, a≥0. Require Frobenius and Verschiebung compatibility with the displayed indexing. This is a comparison map, not an isomorphism; ordinary restriction compatibility is absent on the q-side.

Prerequisites: HQ.4, CrystallineCohomology CR.4.

Source: QW Remark 3.18, §3, p.42.

### Ghost maps on the q-de Rham-Witt complex, and the torsion hypotheses their injectivity needs

Construct differential ghost maps gh_{m/d}:qW_mΩ→Ω_{R/A}⊗_{A,ψ^d}A[ζ_d]. On a degree-i form, the V_n component is n^(i+1) on surviving divisor factors and zero otherwise. Initiality supplies the maps. After inverting m they give an isomorphism onto the product over d|m. Integrally, import the absolute degree-zero injectivity under p-torsion-freeness for all p|m; positive-degree injectivity requires the smooth theorem. For m=p^a over perfectly covered A, quotient by im V_p+im dV_p identifies via gh_1 with Ω⊗_{A,ψ^{p^a}}A[ζ_{p^a}], for arbitrary R. Rational ghost splitting is not an integral definition.

Prerequisites: HQ.4, HabiroRings HR.4.

Source: QW Paragraph 3.15, §3, p.41; Corollary 3.34, §3, p.52; Lemma 4.5, §4, p.55; Lemma 2.23, §2, p.20; Corollary 2.22, §2, p.20.

### An etale extension of the degree-zero part of a differential graded algebra extends uniquely

For a nonnegatively graded differential A[q]-algebra P and an étale ring map P^0→S, construct the unique differential on S⊗_{P^0}P extending that of P. It is initial among differential graded P-algebras Q with compatible ring map S→Q^0. Étale uniqueness of lifted derivations supplies the differential and its square-zero relation. This supports the q-Witt étale base-change theorem.

Prerequisites: Mathlib Algebra.Etale, DerivedDeRhamCohomology DD.2.

Source: QW Lemma 3.32, §3, p.51.

### Etale base change for the q-de Rham-Witt complex, and the resulting etale sheaf

For perfectly covered A and an étale map R→R′, identify qW_mΩ_{R′/A} with qW_mΩ_{R/A} base-changed through the degree-zero relative q-Witt map. The differential is the unique étale extension. Deduce the étale sheaf of differential forms, with functoriality and operator compatibility. Apply the degree-zero étale q-Witt theorem from HR.4 rather than reconstructing its rings.

Prerequisites: HQ.4, HabiroRings HR.4.

Source: QW Proposition 3.31, §3, p.50; Corollary 3.33, §3, p.52; Proposition 2.48, §2, p.33.

### p-locally the q-de Rham-Witt complex splits into Adams twists of the prime-power ones

For arbitrary R over a Λ-base A, p prime and m=p^a n with (n,p)=1, identify the p-localization of qW_mΩ with the product over d|n of qW_{p^a}Ω⊗_{A[q],ψ^d;q↦q^d}A_(p)[q]/Φ_d(q^{p^a}). This is an isomorphism of differential graded A_(p)[q]-algebras before p-completion. The d-th Adams operation acts on coefficients as well as sending q to q^d.

Prerequisites: HQ.4, HabiroRings HR.4.

Source: QW Lemma 4.36, §4, p.74.

### The smooth case: torsion-freeness, the framed q-Hodge comparison and the p-completion, proved together

For smooth R over perfectly covered A, prove degreewise ℤ-torsion-freeness and integral injectivity of all ghosts. For an étale framing, the degreewise h-completion of qW_mΩ is H^*(qHdg_framed/(q^m−1)); bounded h-power torsion identifies ordinary and derived degreewise completion. Also prove (qW_{p^a}Ω)^∧_p≃(Ω⊗^L_{A,ψ^{p^a}}A[q]/(q^{p^a}−1))^∧_p. If m=p^a n, (n,p)=1, the general formula is the product over d|n of (Ω⊗^L_{A,ψ^{p^a d}}A[q]/Φ_d(q^{p^a}))^∧_p. These E∞-equivalences are p-complete; they need not agree with rational ghost splitting.

Prerequisites: HQ.4, HQ.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4.

Source: QW Proposition 4.1, §4, p.54; Theorem 4.27, §4, p.66; Proposition 4.2, §4, p.54; Paragraph 4.3, §4, p.54.

### The arithmetic fracture square of the q-de Rham-Witt complex

For smooth R over perfectly covered A, m≥1 and nonzero N divisible by m, construct the qW_mΩ arithmetic pullback. Its upper-right factors, for p|N and d_p|m_p, are p-completed Ω⊗^L_{A,ψ^{p^{v_p(m)}d_p}}A[q]/Φ_{d_p}(q^{p^{v_p(m)}}). Lower-left factors for d|m are Ω⊗^L_{A,ψ^d}A[1/N,q]/Φ_d(q). Lower-right factors for p|N,d|m are the p-completion of Ω⊗^L_{A,ψ^d}A[q]/Φ_d(q), then p-inverted. Left arrows are ghosts and right components are crystalline relative Frobenius iterated v_p(m/d) times. Here m_p,d_p are prime-to-p parts. Construct that Frobenius through crystalline cohomology.

Prerequisites: HQ.4, DerivedDeRhamCohomology DD.4.

Source: QW Corollary 4.37, §4, p.76.

### Under the p-complete identification the rescaled Frobenius is the crystalline Frobenius

In degree i put F̃_n=n^iF_n, making a chain map. Under the smooth p-completed qW comparison, identify F̃_p with the relative crystalline Frobenius, retaining its coefficient twist. This identification supplies the right map of the q-Witt arithmetic square.

Prerequisites: HQ.4, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4.

Source: QW Corollary 4.38, §4, p.77 · QH Proposition 3.19, §3, p.31.

### No functorial q-Hodge complex has the q-de Rham-Witt complexes as functorial cohomology

For perfectly covered A that is not a ℚ-algebra, no functor on all smooth A-algebras to derived h-complete A[[h]]-modules can have functorial isomorphisms H^*(qHdg/^L(q^m−1))≅(qW_mΩ)^∧_h for every m with divisor projections inducing F_{m/d}. Both functorial cohomology identifications and the Frobenius-transition condition are essential hypotheses of the impossibility. A Habiro descent must therefore be a complex with its derived cyclotomic filtration, rather than this family of cohomology groups. This does not contradict descent from chosen pairs.

Prerequisites: HQ.4, HabiroRings HR.4, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.0.

Source: QW Theorem 5.1, §5, p.78 · QH Paragraph 1.10, §1, p.6.

### The twisted q-de Rham complexes, glued from decalage twists by the p-adic Frobenii

For smooth S over perfectly covered A, glue the Φ_d(q)-complete pieces (Lη_{[m/d]_q}qΩ)⊗_{A[q],ψ^d}A[q], for d|m, using the PR.3 relative-Frobenius equivalences on their p-adic overlaps. HR.5 supplies complete descent. The result qΩ^(m) is a (q^m−1)-complete E∞-algebra. Animate on polynomial algebras to get qdR^(m). Construct individual divisor maps (qΩ^(m))^∧_{q^n−1}→qΩ^(n) for n|m. They usually fail to be equivalences; their naive limit is not a Habiro descent, except in the étale case. A Λ-structure on A does not extend globally to every étale S, so local Frobenius rather than global Adams on S supplies the gluing.

Prerequisites: HQ.1, HQ.2, HabiroRings HR.3, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1.

Source: QH Paragraph 3.14, §3, p.28; §3.3, p.13; Paragraph 3.16, §3, p.30; Remark 3.17, §3, p.30.

API: `twistedQOmega` (constructor); `twistedQOmega.cyclotomicCompletion` (projection); `twistedQOmega.fractureSquare` (characterisation); `twistedQOmega.transition` (data); `twistedQOmega.one` (example); `twistedQOmega.pCompletion_primePower` (projection); `twistedQdR` (functoriality).

Examples:

- For m = 1 the construction returns the q-de Rham complex, since the decalage at [1]_q = 1 is the identity and the only divisor is 1.
- The quotient of the m-th twisted complex by q^m-1 is the m-truncated q-de Rham-Witt complex, and the transition map for d | m induces the rescaled Frobenius (the deformation node).
- For S etale over A the limit over m of the twisted complexes is the relative Habiro ring of S over A (Remark 3.17).
- For A = Z and S = Z[x], the transition map from the (q-1)-completion of the p-th twisted complex to the first is, on the only surviving piece, the canonical map from the decalage at [p]_q of the q-de Rham complex to the q-de Rham complex; its image in H^1 lies in [p]_q times H^1, so it misses the class of x^{p-1} dx, which spans a summand Z[[q-1]]/[p]_q. The transition maps are not equivalences, which is why their limit is not a Habiro descent.

### The arithmetic fracture square of the twisted q-de Rham complex

For the same smooth S, m and N, exhibit qΩ^(m) as an arithmetic pullback. Upper-right factors for p|N,d_p|m_p are (p,Φ_{d_p}(q))-completed qΩ base-changed along ψ^{p^{v_p(m)}d_p}. Lower-left factors for d|m are Φ_d-completed qΩ base-changed along ψ^d to A[1/N,q]. Lower-right factors for p|N,d|m are p-completed qΩ base-changed along ψ^d, then p-inverted and Φ_d-completed. The right components are relative Frobenius iterated v_p(m/d) times. The décalage parameters become units in these corners, which must be proved when replacing the original pieces by these simpler ones.

Prerequisites: HQ.4, HabiroRings HR.3, HabiroRings HR.2.

Source: QH Lemma 3.15, §3, p.29.

### Reducing the twisted complex modulo q^m-1 gives the q-de Rham-Witt complex

For smooth S over perfectly covered A, prove the canonical E∞-equivalence qΩ^(m)/(q^m−1)≃qW_mΩ_{S/A}, natural in S. Check locally by the framed and prismatic formulas and glue with the arithmetic square. Animate to extend the deformation statement to qdR^(m)/(q^m−1)≃qW_m dR. This is a derived reduction.

Prerequisites: HQ.4.

Source: QH Proposition 3.19, §3, p.31.

### The derived q-de Rham-Witt complex and the animated stupid filtration

Animate qW_mΩ and its stupid filtration on polynomial A-algebras to define qW_m dR and fil_Hdg_m on animated inputs. Its i-th graded piece is the animated degree-i form in cohomological degree i, written Σ^(−i)qW_m dR^i. Extend the twisted-complex deformation statement by animation. The filtered object has a derived commutative structure inherited at the polynomial level; arbitrary animated forms need not be underived modules.

Prerequisites: HQ.4, EnhancedDerivedSheaves E5:animation, EnhancedDerivedSheaves E5, DerivedDeRhamCohomology DD.2.

Source: QH Theorem 3.11, §3, p.25; §3.5, p.40; §3.8, p.50.

API: `qWittDR` (constructor); `qWittDR.form` (constructor); `qWittDR.hodgeWittFil` (constructor); `qWittDR.gr_hodgeWittFil` (characterisation); `qWittDR.one` (example); `qWittDR.ofPolynomial` (compatibility); `qWittDR.fil_derivedCommutative` (structure).

Examples:

- For m = 1 the filtration is the Hodge filtration on derived de Rham cohomology and its n-th graded piece is the n-th derived exterior power of the cotangent complex, shifted by -n.
- For a polynomial A-algebra P, qW_m dR_{P/A} is qW_m Omega_{P/A} and the filtration is the stupid filtration.
- The zeroth graded piece is qW_m dR^0, which on a polynomial algebra is the relative q-Witt ring qW_m(P/A) in degree zero.
- The animated stupid filtration is not the Nygaard filtration: for S = A and m = p the first stupid term vanishes in degree zero, while the first Nygaard term in degree zero is the image of V_p, which contains V_p(1) = [p]_q, non-zero.

### On smooth algebras the derived q-de Rham-Witt forms are the shifted underived forms

For smooth S, identify the animated degree-i q-Witt form with qW_mΩ^i. Thus the animated stupid filtration is the stupid filtration of the underived qW_mΩ complex, with gr^i=qW_mΩ^i[−i]. Record the form separately from its shifted graded piece to avoid counting the shift twice.

Prerequisites: HQ.4, DerivedDeRhamCohomology DD.2.

Source: QH Corollary 3.31, §3, p.40.

### The Nygaard filtration on q-de Rham-Witt complexes

For p prime, a≥1 and smooth S over perfectly covered A, define N^n qW_{p^a}Ω in degree i<n by p^(n−1−i)V_p(qW_{p^{a−1}}Ω^i), and in degree i≥n by the full qW_{p^a}Ω^i. Verify a subcomplex and descending filtration compatible with products. At n=0 it is the whole complex. At degree zero the first two positive steps are im V_p and p·im V_p.

Prerequisites: HQ.4, EnhancedDerivedSheaves E5:animation.

Source: QH Paragraph 3.21, §3, p.32.

API: `qWittOmega.nygaardFil` (constructor); `qWittOmega.nygaardFil_apply` (simp); `qWittOmega.nygaardFil_zero` (simp); `qWittOmega.stupidFil_le_nygaardFil` (relation); `qWittDR.nygaardFil` (functoriality); `qWittOmega.nygaardFil_comparison` (equivalence).

Examples:

- The zeroth term is the whole complex qW_{p^a} Omega_{S/A}.
- In degree zero the second term is p V_p(qW_{p^{a-1}}(S/A)) and the first is V_p(qW_{p^{a-1}}(S/A)); a definition omitting the powers of p would make the two equal.
- The Nygaard filtration is not the stupid filtration: for S = A and a = 1 the first stupid term vanishes in degree zero, while the first Nygaard term contains V_p(1) = [p]_q, which is non-zero in qW_p(A/A).
- After p-completion, inverting p and completing at Phi_p(q), the ghost map gh_1 identifies the Nygaard filtration on qW_p Omega with the Hodge filtration on Omega_{S/A} tensored along phi with A[zeta_p], p-completed with p inverted, since the images of V_p are (q-1)-torsion and die (proof of Lemma 3.29).

### The stupid filtration is the pullback of the Nygaard filtration along the divided Frobenius

For smooth S, a≥1 and n≥0, prove the pullback square with top row fil_stupid^n qW_{p^a}Ω→N^n qW_{p^a}Ω and bottom row fil_stupid^n qW_{p^{a−1}}Ω→qW_{p^{a−1}}Ω. The right map is p^(−n)F̃_p. The stupid step is brutal truncation in form degrees ≥n. This square identifies the explicit Nygaard filtration by the divided-Frobenius condition in the derived category of A[q].

Prerequisites: HQ.4.

Source: QH Lemma 3.30, §3, p.40.

### The prismatic Nygaard filtration on the p-completed twisted q-de Rham complexes

Define prismatic Nygaard on (qΩ^(p))^∧_p as the preimage of the canonical décalage filtration along relative Frobenius. For a≥2 pull it back along φ^(a−1) to (qΩ^(p^a))^∧_p. Animate and use quasisyntomic descent. The owner of the Frobenius-divisibility construction is PR.3; no trace comparison defines this filtration.

Prerequisites: HQ.4, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1.

Source: QH Paragraph 3.20, §3, p.32.

API: `twistedQOmega.nygaardFil` (constructor); `twistedQOmega.nygaardFil_eq_preimage` (characterisation); `twistedQOmega.nygaardFil_pullback` (characterisation); `twistedQOmega.nygaardFil_module` (structure); `twistedQdR.nygaardFil` (functoriality).

Examples:

- The zeroth term is the whole p-completed twisted complex.
- When the p-completed twisted complex is static (as for large quasi-syntomic R), an element lies in the n-th term exactly when its relative Frobenius is divisible by Phi_p(q)^n (for a = 1); this is how the source computes it on Z_p<x^{1/p^infty}>/x.
- For A = Z and R = Z_p<x^{1/p^infty}>/x, the n-th term of the Nygaard filtration on the p-completed p-th twisted complex is the completed span of Phi_p(q)^{max(n - floor(i), 0)} x^i/[floor(i)]_{q^p}! over i in N[1/p].
- It is not the Phi_p(q)-adic filtration: in the example above x^1/[1]_{q^p}! = x lies in the first term without being divisible by Phi_p(q).

### The divided Frobenius on the Nygaard graded pieces

For a≥1,n≥0, F̃_p on N^n qW_{p^a}Ω is divisible by p^n. Its divided map on gr_N^n targets τ^{≤n}(qW_{p^{a−1}}Ω/p), is surjective in degree n and an isomorphism in every other degree. Smoothness and the degreewise torsion theorem justify the division.

Prerequisites: HQ.4.

Source: QH Lemma 3.23, §3, p.32.

### The kernel of the Frobenius on q-de Rham-Witt forms

For smooth S and a≥1, identify ker(F_p:qW_{p^a}Ω^n→qW_{p^{a−1}}Ω^n) with Ω^n⊗_{A,φ^a}A[ζ_{p^a}]. The same module identifies the kernel of the induced map qW_{p^a}Ω^n/im V_p→qW_{p^{a−1}}Ω^n/p. Preserve the coefficient Frobenius twist and cyclotomic quotient.

Prerequisites: HQ.4.

Source: QH Lemma 3.24, §3, p.33.

### The Nygaard graded pieces sit in a cofibre sequence with the conjugate filtration

For animated R,a≥1,n≥0, the divided Frobenius from gr_N^n(qW_{p^a}dR)^∧_p targets fil_n^conj(dR/p)⊗^L_{A,φ^{a−1}}A[q]/(q^{p^{a−1}}−1). Its fiber is (dR^n⊗^L_{A,φ^a}A[ζ_{p^a}])[−n], with the p-completions implicit in this local statement. The conjugate filtration is the animation of τ^{≤n}(Ω/p). There is no a=0 formula with an index p^(−1).

Prerequisites: HQ.4, DerivedDeRhamCohomology DD.2.

Source: QH Corollary 3.25, §3, p.34.

### The animated Nygaard filtration satisfies quasi-syntomic descent and agrees with the underived one on smooth inputs

The p-completed animated Nygaard filtration on qW_{p^a}dR satisfies quasisyntomic descent and agrees with the p-completed explicit underived filtration on smooth S, a≥1. Prove the latter by descent and the preceding graded fiber sequences, rather than by omitting the animated construction.

Prerequisites: HQ.4, DerivedDeRhamCohomology DD.2, PrismaticCohomology PR.2.

Source: QH Corollary 3.26, §3, p.35.

### The fibre sequence for the prismatic Nygaard filtration modulo q^{p^a}-1

Reduce the prismatic Nygaard filtration on p-completed qdR^(p^a) by q^{p^a}−1 in filtration degree one, a≥1. Its n-th graded divided Frobenius has the same conjugate target as the q-Witt Nygaard sequence and fiber (dR^n⊗^L_{A,φ^a}A[ζ_{p^a}])[−n], p-completed. Supply the specified fiber inclusion and its compatibility with the cyclotomic comparison.

Prerequisites: HQ.4, HQ.2, PrismaticCohomology PR.3, PrismaticCohomology PR.2.

Source: QH Lemma 3.27, §3, p.35.

### The Nygaard filtration of the twisted complex reduces to the Nygaard filtration of the q-de Rham-Witt complex

Prove the unique natural filtered E∞-equivalence (N^•(qΩ^(p^a))^∧_p)/(q^{p^a}−1)≃N^•(qW_{p^a}Ω)^∧_p, recovering the deformation equivalence at degree zero; extend by animation. Hypotheses are perfectly covered A, smooth S in the underived version and a≥1. The filtered quotient uses the shifted source step, rather than degreewise reduction.

Prerequisites: HQ.4, PrismaticCohomology PR.3, PerfectoidQuotients Q3.

Source: QH Proposition 3.22, §3, p.32; Lemma 3.52, §3, p.50.

### After inverting p the Nygaard filtration is the combined Hodge and cyclotomic-adic filtration

For animated R, p-invert and Φ_p-complete the prismatic Nygaard filtration on the p-completed p-th twisted qdR. Identify it uniquely with the combined Hodge/Φ_p-adic filtration of p-completed dR base-changed along φ. This is a filtered E∞-equivalence after the specified operations, and supplies the rational agreement used in twisted q-Hodge gluing.

Prerequisites: HQ.4, HQ.2, HQ.1, PrismaticCohomology PR.3.

Source: QH Lemma 3.29, §3, p.38.

### Multiplicative structure is carried, never created

Track multiplicative structures through the local pieces, lax monoidal décalage, completed Adams base change and enhanced gluing. The twisted smooth qΩ objects are E∞-algebras. The animated stupid filtration has a filtered derived commutative structure. The Nygaard comparisons and rational filtration comparisons have corresponding derived commutative refinements, whose enhanced proof remains to be supplied beyond the source's assertion. Descent carries structures on pairs; it supplies no unconditional E∞-structure on every smooth scheme's Habiro cohomology.

Prerequisites: HQ.4, EnhancedDerivedSheaves E5.

Source: QH §3.8, p.50; Lemma 3.52, §3, p.50; Paragraph 1.17(c), §1, p.8.

### Uncompleted framed Habiro Koszul complex

For perfectly covered A and an étale framing A[x]→S, import HR.5's relative Habiro ring H_{S/A[x]} with toric Adams structure on A[x]. Extend coordinate scaling to the cyclotomic Taylor equalizer factors, then prove it descends to H. For polynomial coordinates show (γ_i−id)H⊂x_iH and x_i-regularity before dividing; for Laurent coordinates x_i is a unit. Define D̃_i=(γ_i−id)/x_i and prove the divided operators commute. Form the uncompleted Koszul complex K(H;D̃_i), with no division by h. On a toric framing rescale to K(H;γ_i−id). The comparison to the cohomological Habiro–Hodge object remains a separate target, requiring the equalizer and lifting interfaces from HR.4/HR.5.

Prerequisites: HabiroRings HR.5, HQ.1.

Source: QH Example 3.12, §3, p.25.

API: `FramedHabiroKoszul` (constructor); `FramedHabiroKoszul.gamma` (data); `FramedHabiroKoszul.partial_spec` (relation); `FramedHabiroKoszul.toricRescale` (equivalence).

Examples:

- The empty-frame complex is H_{S/A} in degree zero.
- For a coordinate x_i, D̃_i(x_i^n)=(q^n−1)x_i^(n−1), with no q−1 denominator.
- In rank one multiplication by x on degree one intertwines D̃ and γ−id; use the corresponding wedge factors in higher rank.
- The carrier remains the full relative Habiro ring; substituting its q−1 completion silently discards other cyclotomic directions.

## HQ.3 — Chosen q-Hodge pairs and Habiro descent

A pair includes the filtration and its coherent comparisons. The twisted q-Witt and Nygaard interfaces used in its construction are supplied by HQ.4; their independent construction precedes this layer. No canonical choice of pair is assumed here.

### q-Hodge filtrations: the four conditions and the coherences between them

For perfectly covered Λ-ring A and animated R, a q-Hodge pair consists of a descending h^•A[q]-module F, constant in degrees ≤0, with (a) F^0≃qdR; (b) F/β≃fil_Hdg dR; (c) (F⊗ℚ)^∧_h≃fil_(Hdg,h)(dR⊗ℚ)[[h]]; and (c_p), for every p, (F^∧_p[1/p])^∧_h≃fil_(Hdg,h)((dR)^∧_p[1/p])[[h]]. Each equivalence agrees in degrees ≤0 with the previously defined unfiltered comparison. Include the square between (b) and (c), the squares linking (c_p) with (b) and (c), and the compatibility between those squares as higher data. Clause (c_p) is retained independently. Define the enhanced category of pairs by iterated pullbacks, with forgetful functor to animated A-algebras.

Prerequisites: HQ.2, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.1.

Source: QH Definition 3.2, §3, p.20; Definition 3.2(b), §3, p.20; Remark 1.8, §1, p.5.

API: `QHodgeFiltration` (structure); `QHodgeFiltration.zerothEquiv` (projection); `QHodgeFiltration.modQSubOneEquiv` (characterisation); `QHodgeFiltration.rationalEquiv` (compatibility); `QHodgeFiltration.pAdicRationalEquiv` (compatibility); `PairsCat` (structure); `PairsCat.forget_filtration` (projection); `QHodgeFiltration.ofUnderived` (constructor); `QHodgeFiltration.ofRational` (example).

Examples:

- For S smooth over Z of relative dimension at most one, any filtered q-deformation of the Hodge filtration on the q-de Rham complex is (q-1)^{n-1} times its first step in every degree n >= 1, since the Hodge filtration vanishes from degree two on (paragraph 1.14).
- For smooth S, the pullback of the Hodge filtration along the map from the q-de Rham complex to the de Rham complex contains (q-1) times the whole complex in every step, so it satisfies clause (c) only in degrees at most one (paragraph 1.14); already for S = Z its second step is (q-1) Z[[q-1]] instead of (q-1)^2 Z[[q-1]], so it is not a q-Hodge filtration.
- In filtration degrees at most zero each of c_{(q-1)}, c_Q and c_{Q_p} is the already-known unfiltered identification; a definition without this requirement admits filtrations whose zeroth step is identified with the q-de Rham complex by an arbitrary automorphism.
- If A is a Q-algebra, the combined Hodge and (q-1)-adic filtration is a q-Hodge filtration (clause (c_p) is vacuous because every p-completion vanishes), so the forgetful functor is essentially surjective; this is the case Lemma 3.3 excludes.

### The forgetful functor is not essentially surjective, so it has no section

When perfectly covered A is not a ℚ-algebra, that forgetful functor is not essentially surjective and has no section, even over all smooth algebras: a smooth section could be animated. Choose p with Â_p≠0 and use the quotient by the generator of the free p-complete perfect δ-ring. The obstruction uses clauses (b) and (c_p), not just (a)–(c).

Prerequisites: HQ.3, EnhancedDerivedSheaves E5:animation.

Source: QH Lemma 3.3, §3, p.22.

### The q-divided power of the witness cannot be corrected into the p-th step

For the exponent-one quotient of the free p-complete perfect δ-ring, the local qdR is its static completed q-PD envelope. No lift of the ordinary divided power x^p/p can lie in the p-th step prescribed rationally by (x,h)^p. The calculation also applies before perfection to ℤ_p{x}/x. Thus clauses (b) and (c_p) cannot both hold for this witness. An exponent at least two changes the calculation and is treated separately in HQ.5.

Prerequisites: HQ.3, HQ.2, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.2.

Source: QH Lemma 3.3, §3, p.22; Example 4.24, §4, p.63.

### The q-Hodge complex, as the completed colimit of the filtration along multiplication by q-1

For a pair (R,F), define qHdg(R,F)=(colim(F^0 —h→ F^1 —h→ F^2→⋯))^∧_h. The colimit is formed before completion. Replacing F by its filtration completion leaves this modification unchanged because elements of F^i acquire division by h^i. For smooth S, a filtration on qΩ satisfying the four underived comparison conditions pulls back along qdR→qΩ to a pair, and computes the same qHdg. This uses Ω as the Hodge completion of dR; it does not identify the two original filtrations.

Prerequisites: HQ.3, HQ.2, DerivedDeRhamCohomology DD.2.

Source: QH Paragraph 3.5, §3, p.22; Remark 3.6, §3, p.22.

API: `qHodge` (constructor); `qHodge.ofCompletion` (characterisation); `qHodge.map` (functoriality); `qHodge.ofUnderived` (compatibility); `qHodge.modQSubOne` (projection); `qHodge.framed` (example).

Examples:

- For a framed smooth algebra with the coordinate filtration (q-1)^{max(n - *, 0)}, the q-Hodge complex is the q-difference complex with every differential multiplied by q-1.
- For S = A[x] with the coordinate filtration, the q-Hodge complex is A[x][[q-1]] -> A[x][[q-1]] dx with x^n -> (q^n - 1) x^{n-1} dx, whereas the q-de Rham complex has x^n -> [n]_q x^{n-1} dx.
- Replacing the filtration by its completion does not change the answer; a construction that omitted the final (q-1)-completion would fail this.
- The q-Hodge complex is not the q-de Rham complex: in the polynomial example the cokernel of the differential in degree one has the summand A[[q-1]]/(q-1) x^0 dx, zero for the q-de Rham complex since [1]_q = 1.

### The category of pairs is symmetric monoidal and the q-Hodge complex functor is monoidal

Equip pairs with completed Day tensor over h^•A[q], underlying derived tensor of algebras over A. Prove that qHdg is symmetric monoidal, with its h-completed target tensor. The construction initially gives lax maps; reduction by h and complete conservativity prove they are equivalences. Coherent rational and p-rational data are carried through the tensor product.

Prerequisites: HQ.3, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2.

Source: QH Proposition 3.7, §3, p.23.

### The conjugate filtration on the q-Hodge complex modulo q-1, and its associated graded

The modification diagram is bifiltered: its colimit direction is ascending and its original filtration direction is descending. Passing to descending associated graded gives an exhaustive ascending conjugate filtration on qHdg/h, whose graded pieces identify with gr_Hdg dR, namely the shifted derived de Rham forms. Do not exchange the two directions or infer qHdg/h≃dR as unfiltered objects.

Prerequisites: HQ.3, HQ.2.

Source: QH Paragraph 3.8, §3, p.23; Lemma 3.9, §3, p.23.

API: `qHodge.conjFil` (constructor); `qHodge.gr_conjFil` (characterisation); `qHodge.conjFil_exhaustive` (characterisation); `qHodge.conjFil_zero` (simp); `qHodge.conjFil_laxMonoidal` (compatibility).

Examples:

- The zeroth step, and zeroth graded piece, is R, the zeroth Hodge graded piece of derived de Rham cohomology.
- For S smooth of relative dimension d, the n-th graded piece is Omega^n_{S/A} in cohomological degree n, which vanishes for n > d and is non-zero for n = d when S is non-zero; so the filtration reaches the whole object exactly at stage d.
- The conjugate filtration is ascending; reading the bifiltration in the other direction yields the (q-1)-adic filtration on the q-Hodge complex instead, whose graded pieces are copies of the reduction modulo q-1, not the shifted de Rham forms.
- Its underlying object is the reduction of the q-Hodge complex modulo q-1, not the de Rham complex: for A = Z and S = Z[x] with the coordinate filtration it has H^1 = Z[x] dx (the differential x^n -> (q^n-1) x^{n-1} dx vanishes modulo q-1), while H^1 of the de Rham complex of Z[x] is the torsion module, the sum over n of Z/n.

### One graded lemma produces both the conjugate filtration and the q-Witt filtration

For any graded A[β,t]-module M with |β|=1 and |t|=−1, give the degree-zero object (M[1/β]/(βt))_0 an exhaustive ascending filtration with associated graded M/(β,t). Filter the β-localization by its successive powers and transport along base change. No connectivity or completeness is assumed. With q in degree zero and βt=q^m−1, the same argument constructs the q-Witt filtration.

Prerequisites: HQ.2.

Source: QH Lemma 3.10, §3, p.24.

### The framed q-Hodge filtration and its explicit Koszul model

For smooth S with étale framing, use the filtration whose i-th step in form degree j is h^max(i−j,0)Ω^j[[h]], pulled back from the framed qΩ model to qdR. Construct all four comparison data to obtain a pair. Its qHdg is the coordinate Koszul complex with differential hD_i. The toric Adams operations are ψ^m(x_i)=x_i^m. The pair has an E_0-structure; stronger commutative structure needs additional input. Comparison with HQ.4's uncompleted framed Habiro Koszul complex is a separate source assertion without a supplied proof, and remains an open target.

Prerequisites: HQ.3, HQ.4, HQ.1, HabiroRings HR.5, HabiroCyclotomicCompletions HC.3.

Source: QH Example 3.12, §3, p.25.

### The p-adic twisted q-Hodge filtration, by recursion on the exponent

For a pair and fixed p, construct the twisted q-Hodge filtration at index p^a recursively. At a=0 use F^∧_p. At a≥1 pull back the Nygaard filtration via relative Frobenius against the previous filtration rescaled by Φ_{p^a}(q) and the cyclotomic-adic filtration. Rescaling sends the graded transition parameter t to Φ_{p^a}(q)t and is only lax monoidal. The result is a (q^{p^a}−1)^•A[q]-module, with filtered reduction the animated stupid filtration on qW_{p^a}dR. Supply the Frobenius-compatible transitions to a−1 and their multiplicative naturality, using quasisyntomic descent to the ideal-valued case.

Prerequisites: HQ.3, HQ.4, HQ.2.

Source: QH Paragraph 3.32, §3, p.41; Remark 3.33, §3, p.41; Paragraph 3.34, §3, p.41; Paragraph 3.35, §3, p.42.

API: `twistedQHodgeFil_pAdic` (constructor); `twistedQHodgeFil_pAdic_zero` (simp); `twistedQHodgeFil_pAdic_succ` (characterisation); `filRescale` (constructor); `twistedQHodgeFil_pAdic_mod` (compatibility); `twistedQHodgeFil_pAdic.transition` (data); `twistedQHodgeFil_pAdic.laxMonoidal` (structure); `twistedQHodgeFil_pAdic_rational` (equivalence).

Examples:

- For a = 0 the filtration is the p-completion of the given q-Hodge filtration.
- Reducing modulo q^{p^a}-1 gives the stupid filtration on the p-completed q-de Rham-Witt complex; a construction producing the Nygaard filtration instead fails this already for S = A and a = 1, where the first Nygaard term is non-zero in degree zero.
- Rescaling by Phi_p(q) is lax but not strong monoidal: it does not preserve the unit, since the rescaled unit filtration (A[q] in every non-negative degree with transition maps multiplication by Phi_p(q)) is not equivalent to the unit filtration (transition maps the identity), Phi_p(q) not being a unit of A[q].
- After inverting p and completing at Phi_{p^a}(q), the filtration is the combined Hodge and Phi_{p^a}(q)-adic filtration on the p-completion of dR_{R/A} base-changed along psi^{p^a}; for a = 0 this is clause (c_p).

### After inverting p the p-adic twisted q-Hodge filtration is the combined Hodge and cyclotomic-adic filtration

For a≥0, after p-inversion and Φ_{p^a}(q)-completion, identify the p-adic twisted q-Hodge filtration with the combined Hodge/cyclotomic-adic filtration of p-completed dR base-changed along ψ^{p^a}. Preserve the rational comparison. At a=0 this is exactly clause (c_p), which starts the induction.

Prerequisites: HQ.3, HQ.4.

Source: QH Lemma 3.36, §3, p.42.

### At lower cyclotomic points the p-adic twisted q-Hodge filtrations of successive indices agree

For a≥1 and 0≤i≤a−1, the transition from index p^a to p^{a−1} becomes a filtered equivalence after p-inversion and completion at Φ_{p^i}(q). There is no integral transition equivalence asserted before those operations.

Prerequisites: HQ.3, HQ.4.

Source: QH Lemma 3.37, §3, p.42.

### The global twisted q-Hodge filtration, glued along a fracture square

For m≥1 choose a nonzero multiple N of m and filter the arithmetic fracture square of the m-th twisted complex. On N-inverted cyclotomic factors and p-completed p-inverted factors use the Adams-base-changed pair filtration. On the (p,Φ_{d_p})-complete factors use the prime-power recursion of index p^{v_p(m)}, then base-change along ψ^{d_p}. The p-rational agreements use clause (c_p) and the two prime-power compatibility lemmas. Prove independence under enlarging N; a cofinal factorial sequence gives a canonical functorial lax monoidal construction. Construct the individual divisor transitions n|m with their Frobenius compatibilities; full coherence over the divisibility poset is unnecessary when the limit uses the factorial chain.

Prerequisites: HQ.3, HQ.4.

Source: QH Paragraph 3.38, §3, p.42; Paragraph 3.41, §3, p.44.

API: `twistedQHodgeFil` (constructor); `twistedQHodgeFil.gluing` (characterisation); `twistedQHodgeFil.indep` (characterisation); `twistedQHodgeFil_mod` (compatibility); `twistedQHodgeFil.transition` (data); `twistedQHodgeFil.laxMonoidal` (structure); `twistedQHodgeFil_one` (example).

Examples:

- For m = 1 the twisted complex is the derived q-de Rham complex and the filtration is the given q-Hodge filtration.
- Its reduction modulo q^m-1 is the animated stupid filtration on qW_m dR, whose n-th graded piece is qW_m dR^n shifted by -n.
- The filtrations built with N and with a multiple N' agree; a construction depending on N would not be canonical.
- On the factor obtained by inverting N and completing at Phi_d(q), d | m, the filtration is the q-Hodge filtration base-changed along psi^d; in particular for R smooth with the coordinate filtration it is (q-1)^{max(n - *, 0)} base-changed along psi^d, that is Phi_d(q)^{max(n - *, 0)} up to units.

### The twisted q-Hodge filtration reduces modulo q^m-1 to the stupid filtration on the derived q-de Rham-Witt complex

For every pair and m≥1, refine qdR^(m)/(q^m−1)≃qW_m dR to an equivalence F_m/β_m≃fil_Hdg_m qW_m dR of filtered A[q]/(q^m−1)-modules. It is natural and lax symmetric monoidal. For an E_n-pair it respects filtered E_n-structures. The quotient places q^m−1 in degree one.

Prerequisites: HQ.3, HQ.4, HQ.2.

Source: QH Proposition 3.39, §3, p.44; Remark 3.40, §3, p.44.

### Adjoining the twisted filtration divided by powers of q^m-1, and its compatibility in m

Define the m-th partial modification T_m as the (q^m−1)-completion of colim_i(F_m^i —(q^m−1)→ F_m^{i+1}). It formally adjoins F_m^i/(q^m−1)^i, and is lax monoidal. At m=1 this is qHdg. Completion follows the colimit; compatibility at divisors is a theorem rather than part of the definition.

Prerequisites: HQ.3.

Source: QH Paragraph 3.42, §3, p.45; Paragraph 3.45, §3, p.47.

API: `partialDescent` (constructor); `partialDescent_one` (example); `partialDescent.laxMonoidal` (structure); `partialDescent.completion` (characterisation); `partialDescent_mod` (characterisation).

Examples:

- For m = 1 the partial descent is the q-Hodge complex, since the twisted complex is the q-de Rham complex and the filtration is the given one.
- For n | m the (q^n-1)-completion of the m-th partial descent is the n-th.
- For a framed smooth S with the coordinate filtration, after inverting N and completing at Phi_d(q) the m-th partial descent is the psi^d-twisted coordinate complex with every differential multiplied by Phi_d(q) up to a unit.
- Each partial descent is (q^m-1)-complete by construction, so the limit over m is Habiro-complete.

### Adjoining the Nygaard filtration divided by Phi_p(q) recovers the q-de Rham complex; divided by q^p-1 it gives zero

For animated R and prime p, modifying the p-completed p-th twisted complex by the Nygaard filtration with denominator Φ_p(q), then (p,h)-completing, recovers p-completed qdR through relative Frobenius. Using denominator q^p−1 instead gives qdR with h inverted followed by (p,h)-completion, hence zero. Keeping these denominators distinct proves the partial-modification transition theorem.

Prerequisites: HQ.4, HQ.3, PrismaticCohomology PR.3.

Source: QH Lemma 3.44, §3, p.46; Proposition 3.43, §3, p.45.

### The partial descents are compatible under completion

For n|m, prove (T_m)^∧_{q^n−1}≃T_n through the specified filtration transition. This is a compatible descent of qHdg from the q=1 neighborhood to the m-th cyclotomic neighborhood. It asserts a completed equivalence, not equality of the original partial objects.

Prerequisites: HQ.3.

Source: QH Proposition 3.43, §3, p.45.

### The Habiro-Hodge complex, and the symmetric monoidality of the descent

Define the Habiro–Hodge object H(R,F)=lim_{k≥1}T_{k!}, with coherent factorial transitions. This computes the divisibility-indexed limit, is Habiro-complete, satisfies H^∧_{q^m−1}≃T_m for every m and H^∧_h≃qHdg. HR.2 supplies Habiro completion and its completed tensor. The construction first carries lax symmetric monoidal maps; these are strengthened below.

Prerequisites: HQ.3, HabiroRings HR.2.

Source: QH Paragraph 3.45, §3, p.47; Paragraph 3.16, §3, p.30.

API: `qHabiroHodge` (constructor); `qHabiroHodge.qSubOneCompletion` (projection); `qHabiroHodge.completion` (characterisation); `qHabiroHodge.limit_factorial` (characterisation); `qHabiroHodge.map` (functoriality); `qHabiroHodge.laxMonoidal` (structure); `qHabiroHodge.tensorEquiv` (compatibility).

Examples:

- For an etale A-algebra with its q-Hodge filtration, the Habiro-Hodge complex is the relative Habiro ring (the etale-case node).
- Its (q-1)-completion is the q-Hodge complex; a construction returning the q-de Rham complex instead fails this already for S = A[x] with the coordinate filtration.
- For smooth S with a q-Hodge filtration, the cohomology of its reduction modulo q^m-1 is qW_m Omega_{S/A}, as graded A[q]/(q^m-1)-modules, and as graded algebras when the pair is at least an E_1-algebra in the category of pairs.
- It descends the q-Hodge complex, not the q-de Rham complex; the latter is recovered only after the decalage at q-1, and only for smooth inputs.

### The Habiro-Hodge complex functor is symmetric monoidal

Prove the lax tensor maps for H are equivalences in the Habiro-complete category. Reduce to every partial completion and then to the corresponding complete modification argument. This gives strict symmetric monoidality with the completed HR.2 tensor product.

Prerequisites: HQ.3, HQ.4, DerivedDeRhamCohomology DD.2, HabiroRings HR.2.

Source: QH Lemma 3.46, §3, p.47.

### The descent theorem: the q-Hodge complex factors symmetric monoidally through Habiro-complete objects

For every perfectly covered Λ-base, the qHdg functor on chosen pairs factors symmetric monoidally through Habiro-complete A[q]-modules by H, followed by h-completion. This is the descent theorem's first clause. The choice of F is essential; the factorization is not a functor selecting filtrations on arbitrary animated algebras.

Prerequisites: HQ.3, HabiroRings HR.2.

Source: QH Theorem 3.11, §3, p.25; Theorem 3.11(a), §3, p.25; Theorem 1.11(a), §1, p.7.

### The descent theorem, clause (b): the q-de Rham-Witt filtration on the reduction modulo q^m-1

For each m≥1, put an exhaustive ascending filtration on H/(q^m−1), natural in the pair, with i-th graded piece the i-th associated graded of the animated stupid filtration on qW_m dR. In the form convention this is Σ^(−i)qW_m dR^i. The identification is lax monoidal and becomes the conjugate filtration at m=1. It is an associated-graded theorem, rather than an unfiltered identification with qW_m dR.

Prerequisites: HQ.3, HQ.4, HQ.2.

Source: QH Theorem 3.11(b), §3, p.25.

### For an etale algebra the Habiro-Hodge complex is the relative Habiro ring

If R is étale over A, clause (b) forces the h-adic filtration, corresponding to the empty framed model. Identify H(R,F) with HR.5's relative Habiro ring H_{R/A}, as E∞-algebras. This supplies the arithmetic degree-zero comparison used later, with no claim about K_3-indexed modules.

Prerequisites: HQ.3, HQ.4, HabiroRings HR.4, HabiroRings HR.5, EnhancedDerivedSheaves E5.

Source: QH Corollary 3.13, §3, p.27.

### For smooth inputs, q-Omega is the q-Hodge completion of the derived complex and the decalage of the q-Hodge complex

For smooth S over perfectly covered A with a chosen pair, show that filtration completion of qdR is qΩ, using the p-rational comparison datum to glue local and rational identifications. Also prove Lη_h qHdg≃qΩ; applying Lη_h to the Habiro–Hodge object supplies a Habiro descent of the smooth qΩ object. These conclusions do not make uncompleted qdR equal to qΩ on all smooth inputs.

Prerequisites: HQ.2, HQ.3, AInfCohomology AI.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1.

Source: QH Proposition 3.47, §3, p.48; Proposition 3.47(a), §3, p.48; Proposition 3.47(b), §3, p.48; Remark 3.6, §3, p.22.

### Operadic and derived commutative upgrades of the descent, and the differential on cohomology

If the pair carries a compatible E_n-structure, 0≤n≤∞, transport it to H, its cyclotomic filtration and the graded identification. The compatibility includes the filtration comparisons and all higher data, not merely the underlying complex's multiplication. A filtered derived commutative lift similarly produces a derived commutative H and a derived differential graded structure on the associated graded. The source supplies the derived commutative upgrade as a sketch; its full enhanced construction is an implementation target.

Prerequisites: HQ.3, HQ.4, HQ.1, EnhancedDerivedSheaves E5.

Source: QH Paragraph 3.50, §3, p.50; Lemma 3.52, §3, p.50.

### For smooth algebras the reduction modulo q^m-1 has cohomology the q-de Rham-Witt complex, with the Bockstein as differential

For smooth S, identify the cyclotomic filtration with the cohomological Postnikov filtration τ^{≤i}. Hence H^*(H/(q^m−1))≅qW_mΩ^* as graded modules; for at least an E_1-pair it is an algebra isomorphism. The qW differential is the Bockstein for q^m−1. Use the underived shifted-forms result of HQ.4, keeping derived reductions and the intrinsic shifts.

Prerequisites: HQ.3, HQ.4.

Source: QH Corollary 3.54, §3, p.51; Corollary 3.54(c), §3, p.51.

### Finite-projective scalar extension of chosen q-Hodge filtrations

For a Λ-map f:A→B between perfectly covered bases with B finite projective over A, define P_B by derived scalar extension of every filtration step of a chosen pair P, including (a),(b),(c),(c_p), both comparison squares and their compatibility. DD.1/DD.2 supply enhanced finite-projective exchange and filtered de Rham base change. The result is functorial with coherent identity and composition, and E_f qHdg_A(P)≃qHdg_B(P_B). Finite projectivity makes B dualizable and permits the limits used here; mere flatness does not. This transports a chosen pair and selects none on a bare algebra.

Prerequisites: Mathlib Module.Finite, Mathlib Module.Projective, HQ.3, HQ.2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, Mathlib CategoryTheory.preservesColimitIso.

Source: QH Definition 3.2, §3, p.20; Theorem A.1, §A, p.69 · Stacks Lemma 10.78.2, §10.78 (unpaginated HTML).

API: `QHodgeBaseChange.pair` (constructor); `QHodgeBaseChange.filtration` (data); `QHodgeBaseChange.underlying` (compatibility); `QHodgeBaseChange.clauseData` (compatibility); `QHodgeBaseChange.identity` (simp); `QHodgeBaseChange.composition` (functoriality); `QHodgeBaseChange.modification` (equivalence).

Examples:

- For f=id_A the extended pair is P, and the map on F^i is the tensor-unit equivalence for every i.
- For the diagonal Λ-map A → A×A with componentwise Adams operations, B is free of rank two; R_B ≃ R×R and every filtration step and each clause datum splits into two copies. After the two projections to A both recovered pairs are P.
- For the base pair R=A with F^i=(q−1)^i A[[q−1]] (constant for i≤0), its degree-one filtered quotient is B in step 0 and zero in positive steps. The degreewise quotient instead has B in every positive step and fails (b). This tests the cofiber F^{i−1} → F^i, not its unshifted substitute.

### Finite-projective base change of the twisted q-Hodge filtrations

Under the same finite-projective hypotheses, target equivalences E_fF_{A,m}≃F_{B,m} for every m, compatible with divisor transitions and lax monoidal structures. This requires finite-projective compatibility of relative Frobenius and Nygaard from PR.3 and filtered décalage from AI.1. Those enhanced interfaces remain prerequisites to be constructed; the equivalences are conditional mathematical targets.

Prerequisites: HQ.3, HQ.4, DerivedDeRhamCohomology DD.1, PrismaticCohomology PR.3, AInfCohomology AI.1.

Source: QH Construction 3.38, §3, p.42.

### Finite-projective base change of the Habiro–Hodge complex

Write H_A(P)=lim_k T_{A,k!}(P). Define β_f:E_fH_A(P)→H_B(P_B) by the limit-exchange map followed by the coherent partial comparisons E_fT_{A,k!}≃T_{B,k!}. Conditional on the preceding twisted-filtration interfaces, β_f is an equivalence for finite projective B, and E_fH_A is already Habiro-complete. Require compatibility with every partial completion, cyclotomic reduction, its ascending filtration and its graded pieces, using their intrinsic cohomological shifts without another shift. Include projection characterization, identity, composition and the Künneth square. This is a constructed extension of the source's descent, not a theorem stated there for arbitrary base change.

Prerequisites: HQ.3, HQ.4, HabiroRings HR.2, DerivedDeRhamCohomology DD.1, Mathlib CategoryTheory.Limits.limit.post, Mathlib CategoryTheory.Limits.limMap, Mathlib CategoryTheory.Limits.limMap_π, Mathlib CategoryTheory.Limits.limit.post_π, Mathlib CategoryTheory.Limits.isIso_limMap, Mathlib CategoryTheory.preservesLimitIso.

Source: QH Construction 3.45, §3, p.47; Theorem 3.11(b), §3, p.25; Lemma 3.46, §3, p.47.

API: `HabiroHodgeBaseChange.map` (constructor); `HabiroHodgeBaseChange.projection` (characterisation); `HabiroHodgeBaseChange.isIso` (equivalence); `HabiroHodgeBaseChange.identity` (simp); `HabiroHodgeBaseChange.composition` (functoriality); `HabiroHodgeBaseChange.partialDescent` (compatibility); `HabiroHodgeBaseChange.qMinusOne` (compatibility); `HabiroHodgeBaseChange.cyclotomicFiltration` (compatibility); `HabiroHodgeBaseChange.kuenneth` (compatibility).

Examples:

- For f=id_A and the identity stagewise comparison, β is id on the limit, with identity projections at all factorial stages.
- For f:A→A×A diagonal, E_f H_A≃H_A×H_A; σ_m is the corresponding two-copy comparison at every m, and β has the two expected component maps. This distinguishes tensoring before the limit from forgetting one component.
- For the coordinate q-Hodge filtration on A[x] and finite-projective A→B, the q−1-completion of β is coefficient extension of the complex with differential D(x^r)=(q^r−1)x^{r−1}dx (r≥1). In particular D(x²)=(q²−1)x dx. The differential has not been replaced by (q−1)r x^{r−1}dx.
- Do not infer the needed limit/completion exchange from flatness: for the Λ-map ℤ→ℚ, ℤ[[t]]⊗ℚ→ℚ[[t]] is not surjective. Its image has a common nonzero integer denominator for all coefficients, whereas the series with coefficients 1/(n+1)! has no such denominator. This lies outside the finite-projective hypothesis and prevents silently upgrading this range to all Λ-maps.

## HQ.5 — Canonical filtrations and algebraic Habiro cohomology

The smooth and quasi-regular sections have different domains, different universal properties and different multiplicative scope. Scheme cohomology uses the smooth section over ℤ.

### Filtrations supported in degrees at most n: the truncation functor, its oplax left adjoint on modules, and the relative truncation

On descending filtrations constant in degrees ≤0, let τ*_n retain degrees through n and set degrees ≥n+1 to zero. It is right adjoint to extension by zero and left adjoint to constant extension above n. The localization identity τ*_n(M⊗τ*_nN)≃τ*_n(M⊗N) gives its symmetric monoidal structure. For a filtered E∞-algebra T, the induced module functor preserves limits and colimits and has an oplax monoidal left adjoint τ^T_{n,!}. Require relative scalar-extension compatibility for T_1→T_2 and compatibility with successive truncations n,n+1. For the filtered unit the left adjoint is fully faithful extension by zero. Do not replace the oplax structure by a lax one.

Prerequisites: HQ.2, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E5:abstract.

Source: QH Lemma 4.2, §4, p.53; Lemma 4.2(a), §4, p.53; Lemma 4.2(b), §4, p.53; Lemma 4.10, §4, p.57; Lemma 4.6, §4, p.55.

API: `TauCeti.QHodge.truncateFil` (constructor); `TauCeti.QHodge.truncateFil_apply` (simp); `TauCeti.QHodge.truncateFil_adjunction` (universal-property); `TauCeti.QHodge.truncateFil_tensor` (characterisation); `TauCeti.QHodge.truncateFilShriek` (constructor); `TauCeti.QHodge.truncateFilShriek_baseChange` (compatibility); `TauCeti.QHodge.truncateFilRel` (constructor); `TauCeti.QHodge.truncateFilShriek_unit_fullyFaithful` (characterisation).

Examples:

- τ*_n Z(j) ≃ Z(min(j, n)) for all j ≥ 0, where Z(j) is Z in filtration degrees at most j and zero above.
- For M vanishing in degrees at least n+1 (for example the Hodge filtration of Ω_{S/A} with dim(S/A) ≤ n), τ^Z_{n,!} τ*_n M ≃ M.
- τ*_n is not the quotient by the (n+1)-st step (the left adjoint of the inclusion): on Z(n+1) the quotient is zero while τ*_n Z(n+1) ≃ Z(n).
- For T = (q−1)^⋆Z⟦q−1⟧ and M = τ*_n T, τ^T_{n,!} M ≃ T; in general τ^T_{n,!} continues a module above degree n by multiplication by powers of q−1, which is the intended (q−1)-adic continuation of Paragraph 4.1.

### The canonical q-Hodge filtration on a smooth algebra with small primes inverted

Let A be perfectly covered, S smooth and n≥1, with all primes ≤n invertible in S; the construction allows any relative dimension. Factor qΩ→Ω through the E∞-map qΩ→Ω[[h]]/h^n, using the local factorization modulo h^(p−1) when p>n and vanishing p-completions when p≤n. Reduce the combined Hodge/h-adic filtration by h^n in filtration degree n, truncate with τ*_n and pull back along that map in truncated modules. Apply τ_{n,!}, then h-complete, to obtain F_n on qΩ; pull it back to qdR. The finite coefficient filtration on Ω[[h]]/h^n is part of the construction. The q-Hodge axioms require the additional dimension bound below.

Prerequisites: HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2, Mathlib Algebra.Smooth.

Source: QH Paragraph 4.1, §4, p.53; Paragraph 4.3, §4, p.54.

API: `TauCeti.QHodge.canonicalSmoothFiltration` (constructor); `TauCeti.QHodge.qOmega_factorisation` (characterisation); `TauCeti.QHodge.canonicalSmoothFiltration_truncate` (characterisation); `TauCeti.QHodge.canonicalSmoothFiltration_lift` (universal-property); `TauCeti.QHodge.canonicalSmoothFiltration_mod_q_sub_one` (projection); `TauCeti.QHodge.canonicalSmoothFiltration_map` (functoriality); `TauCeti.QHodge.canonicalSmoothFiltration_framed` (compatibility).

Examples:

- For S = A and n = 1 we have q-dR_{A/A} ≃ A⟦q−1⟧ and the filtration is the (q−1)-adic filtration (q−1)^i A⟦q−1⟧.
- For S = A[x] and n = 1 (no prime inverted), in the coordinate model the i-th step for i ≥ 1 is the subcomplex (q−1)^i A[x]⟦q−1⟧ → (q−1)^{i−1} A[x]⟦q−1⟧ dx: the pullback of the Hodge filtration in degree one continued (q−1)-adically (Paragraph 1.14).
- If dim(S/A) > n the reduction modulo q−1 is τ^Z_{n,!} τ*_n of the Hodge filtration, which vanishes in degree n+1 while the Hodge filtration does not; so the q-Hodge property genuinely needs dim(S/A) ≤ n.
- Without τ*_n, the pullback of the Hodge filtration along q-Ω_{S/A} → Ω_{S/A} contains (q−1)q-Ω_{S/A} in every step (Paragraph 1.14); for S = A[x] its second step contains q−1 times the unit, which violates the rational clause, since (q−1) ∉ (q−1)^2 A⟦q−1⟧ + (q−1) fil^1_Hdg.

### In relative dimension at most n the canonical filtration is a q-Hodge filtration

If also dim(S/A)≤n, identify F_n/β with fil_Hdg Ω and its global and p-completed rationalizations with the combined Hodge/h-adic filtrations. Construct their agreement data to obtain a q-Hodge pair on qdR, natural in S, whose filtration completion is F_n on qΩ. Smoothness, perfect coverage and invertibility of all primes ≤n remain in force. The dimension bound ensures that the Hodge filtration is supported through n.

Prerequisites: HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2.

Source: QH Lemma 4.6, §4, p.55; Lemma 4.7, §4, p.56.

### The canonical filtration of a framed smooth algebra is the coordinate filtration

For S étale-framed in n coordinates with all primes ≤n invertible, identify F_n with the coordinate filtration h^max(i−j,0)Ω^j[[h]]. The truncated framed filtration satisfies the defining pullback; adjunction supplies the comparison, and reduction by h plus completeness proves it an equivalence. The identification is filtered on the underived complex and then pulls back to the pair.

Prerequisites: HQ.5, HQ.3, HQ.2.

Source: QH Remark 4.4, §4, p.55; Paragraph 1.10, §1, p.6.

### The p-complete description through the p-tilde-de Rham complex

At p, use the μ_{p−1} homotopy fixed points of the ℤ_p×-action on (qΩ)^∧_p induced by q↦q^u on the prism. This is the p-tilde-de Rham object. Pull back its Hodge filtration along the map to p-completed Ω, apply τ_{n,!} and base-change to h^•ℤ_p[[h]]. The source identifies the global canonical filtration with the gluing of these local filtrations and the rational combined filtration. Its omitted gluing argument is a further target; it is not supplied just by having the group action. This description is the input to the action-normalized uniqueness assertion.

Prerequisites: HQ.5, HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:presentability, HQ.2.

Source: QH Remark 4.5, §4, p.55.

### The categories with the bounds n and n+1 form a pushout of ∞-categories

For n≥0, prove the pushout of full smooth-algebra subcategories in enhanced categories: the overlap Sm^{≤n}_{A[(n+1)!^(−1)]} maps to Sm^{≤n+1}_{A[(n+1)!^(−1)]} and to Sm^{≤n}_{A[dim!^(−1)]}, and their pushout is Sm^{≤n+1}_{A[dim!^(−1)]}. These ordinary categories are viewed as ∞-categories; use E0's fully faithful pushout interface and the source's factorization argument. An ordinary set union alone is insufficient.

Prerequisites: EnhancedDerivedSheaves E0, Mathlib Algebra.Smooth.

Source: QH Lemma 4.9, §4, p.56.

### The constructions for the bounds n and n+1 agree, and assemble into one functor

On the overlap of dimension ≤n with all primes ≤n+1 inverted, prove a natural equivalence of the canonical pairs built with bounds n and n+1. The dimension-zero construction is the h-adic filtration. Assemble the bound-dependent functors along the preceding pushouts into a functor on Sm_{A[dim!^(−1)]}, the full class with primes ≤relative dimension invertible. This is a functor on that class only.

Prerequisites: HQ.5, HQ.3.

Source: QH Paragraph 4.8, §4, p.56; Lemma 4.10, §4, p.57.

### Existence away from small primes

For perfectly covered A and smooth S with every prime p≤dim(S/A) invertible in S, obtain the canonical q-Hodge pair and a partial section of the forgetful functor. The condition uses relative dimension over A. The no-section theorem prevents extension to all smooth inputs over non-ℚ bases, but supplies no optimality result for the particular set of primes inverted here.

Prerequisites: HQ.5, HQ.3, Mathlib Algebra.Smooth.

Source: QH Theorem 4.11, §4, p.58; Theorem 1.15, §1, p.8; Lemma 3.3, §3, p.22.

### The partial sub-operad of smooth algebras with the small primes inverted

Define admissible vertices of the smooth tensor nerve as lists of smooth algebras satisfying the dimension-dependent prime condition. An edge over α∈Fin_* is admissible when its endpoints and every tensor product over a fiber of α satisfy that condition. Take the largest simplicial subset containing precisely simplices with admissible vertices and edges. Over non-ℚ bases these edges need not compose, so this is a simplicial set over N(Fin_*), not an ∞-subcategory or an ∞-operad. Define the bounded version and its dual cartesian variant likewise. Over a ℚ-base every edge is admissible. This correction matters for the scope of multiplication claims.

Prerequisites: HQ.5, EnhancedDerivedSheaves E5:abstract, Mathlib Algebra.Smooth.

Source: QH Paragraph 4.12, §4, p.58; Paragraph 4.12(b), §4, p.58; Corollary 4.16, §4, p.60.

API: `TauCeti.QHodge.SmoothDimInv.admissible` (characterisation); `TauCeti.QHodge.SmoothDimInv.operadic` (constructor); `TauCeti.QHodge.SmoothDimInv.fibre_one` (compatibility); `TauCeti.QHodge.SmoothDimInv.mul_admissible` (characterisation); `TauCeti.QHodge.SmoothDimInv.boundedDim` (constructor); `TauCeti.QHodge.SmoothDimInv.etale` (example).

Examples:

- Over A = Z: the edges (Z[x], Z[x]) → (Z, Z) over id_⟨2⟩ and (Z, Z) → Z over ⟨2⟩ → ⟨1⟩ are admissible but their composite is not, since Z[x] ⊗ Z[x] = Z[x, y] needs 2 inverted.
- Z[x] lies in Sm_{Z[dim!^{-1}]}, but its multiplication is not admissible; Z[1/2][x] has an admissible multiplication (an A_2-structure) but its triple product is not admissible, and Z[1/6][x] has an admissible triple product (A_3).
- Over ⟨1⟩ the condition (b) is vacuous, so the fibre is the full subcategory Sm_{A[dim!^{-1}]}.
- The full sub-operad spanned by Sm_{Z[dim!^{-1}]} contains the multiplication of Z[x], which is not admissible; the two notions differ.

### The truncated canonical construction is symmetric monoidal

Fix n. The truncated canonical functor, before applying τ_{n,!}, is symmetric monoidal on all smooth A-algebras with primes ≤n inverted, without a dimension bound. Its target consists of h-complete modules over τ*_n(h^•A[[h]]) with completed tensor. Supply the enhancement of the source's proof sketch, including the truncated pullback's multiplicativity.

Prerequisites: HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract.

Source: QH Lemma 4.13, §4, p.59.

### In bounded dimension the oplax structure preserves cartesian lifts

Encode oplax functors through the dual cartesian fibrations over Fin_*^op, using E5:abstract's span description. Compose the truncated symmetric monoidal construction with τ_{n,!}(−)^∧_h. For a cartesian arrow whose source tensor-product entries have dimension ≤n, prove its image is cartesian. The bound is on the entries at the source in the dual fibration; it is what makes the corresponding tensor comparison an equivalence.

Prerequisites: HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract.

Source: QH Paragraph 4.14, §4, p.59; Lemma 4.15, §4, p.59.

### The multiplicativity is operadic and partial: the category is not closed under tensor products

Extend the canonical section to the admissible simplicial subset, preserving the cocartesian edges present there. For relative dimension d, invert primes ≤2d for a homotopy-unital multiplication and primes ≤rd for A_r-coherence through r factors, r≥3; commutative coherence has analogous bounds. For positive d an A_∞ or E∞ assertion from this construction requires every prime invertible; étale inputs are tensor-closed already. A general object with only primes ≤d inverted has no supplied multiplication. The admissible subset is not an ∞-operad, so no unconditional operadic functor theorem is asserted over ℤ.

Prerequisites: HQ.5, EnhancedDerivedSheaves E5:abstract.

Source: QH Corollary 4.16, §4, p.60; Paragraph 4.12, §4, p.58.

### Algebraic Habiro cohomology of a smooth scheme

For a smooth ℤ-scheme X with all primes ≤dim(X/ℤ) invertible, glue the affine canonical Habiro–Hodge objects to an H-valued enhanced derived sheaf on X. Define algebraic Habiro cohomology as its derived sections. For every m, glue the exhaustive ascending cyclotomic filtration; gr^i is qW_mΩ_X^i[−i]. Prove descent using affine compatibility, the étale q-Witt sheaf and conservativity of cyclotomic reductions. The construction is stated over ℤ; a general perfectly covered-base scheme extension is not included automatically.

Prerequisites: HQ.5, HQ.3, HQ.4, HabiroRings HR.2.

Source: QH Paragraph 1.16, §1, p.8; Theorem 1.11(b), §1, p.7.

API: `TauCeti.QHodge.algebraicHabiroCohomology` (constructor); `TauCeti.QHodge.algebraicHabiroCohomology_affine` (characterisation); `TauCeti.QHodge.algebraicHabiroCohomology_descent` (characterisation); `TauCeti.QHodge.algebraicHabiroCohomology_pullback` (functoriality); `TauCeti.QHodge.algebraicHabiroCohomology_mod` (projection); `TauCeti.QHodge.algebraicHabiroCohomology_complete` (compatibility).

Examples:

- For X = Spec O_F[1/Δ] with F a number field of discriminant Δ, RΓ(X, q-Hdg_{X/Z}) is the ring H_{O_F[1/Δ]/Z}, which is the GSWZ Habiro ring of F (Corollaries 3.13 and 2.13).
- Every prime p ≤ dim(X/Z) is invertible on RΓ(X, q-Hdg_{X/Z}), because it is invertible on X; so the theory contains no information at those primes (Paragraph 1.17(a)).
- For X = A^1_Z = Spec Z[x] (no prime inverted), RΓ is the Habiro–Hodge complex whose (q−1)-completion is Z[x]⟦q−1⟧ → Z[x]⟦q−1⟧ dx, x^m ↦ (q^m − 1) x^{m−1} dx.
- Its (q−1)-completion is the q-Hodge complex, not the q-de Rham complex: for Z[x] the differential sends x^m to (q^m − 1)x^{m−1}dx, not to [m]_q x^{m−1}dx (Paragraph 1.13).

### Smooth proper perfectness target

For smooth proper X/ℤ[1/N] of relative dimension d, where N>0 is divisible by every prime ≤d, target perfectness of RΓ(X,H_X) over the Habiro completion of H[1/N]. That order of localization and completion is part of the coefficient object. The source states this example without a proof; a global enhanced perfectness proof and its coefficient base change remain to be supplied.

Prerequisites: HQ.5, HabiroRings HR.2, HQ.4.

Source: QH Paragraph 1.16, §1, p.8.

### The rings of interest: p-completely perfectly covered bases, quasi-lci algebras and relative semiperfectness

At fixed p, a p-completely perfectly covered δ-base A is p-complete with p-completely faithfully flat map to its perfection A_∞, equivalently p-completely flat Frobenius. A p-quasi-lci R has p-completed cotangent Tor-amplitude [0,1] in homological indexing. Relative semiperfectness is surjectivity of R/p⊗_{A,φ}A→R/p and forces the amplitude to degree 1. A perfect-regular presentation is R=B/J with B relatively perfect and J Koszul-regular. Globally condition (R) requires prime-by-prime torsion-freeness, p-quasi-lci completed inputs and relative semiperfectness modulo p. These imply the introductory staticity/ideal-filtration condition; no converse is asserted. Tor-amplitude 1 alone does not imply relative semiperfectness, and a perfect-regular presentation is sufficient rather than necessary.

Prerequisites: HQ.2, HabiroRings HR.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.0, Mathlib RingTheory.Sequence.IsRegular, Mathlib Algebra.Etale.

Source: QH Paragraph 4.17, §4, p.60; Construction 4.28, §4, p.66; Paragraph 1.18, §1, p.9; Remark 4.20, §4, p.62.

API: `TauCeti.QHodge.PerfectlyCoveredDelta` (structure); `TauCeti.QHodge.IsPQuasiLci` (structure); `TauCeti.QHodge.IsRelSemiperfect` (structure); `TauCeti.QHodge.IsRelSemiperfect.cotangent` (characterisation); `TauCeti.QHodge.PerfectRegularPresentation` (structure); `TauCeti.QHodge.ConditionR` (structure); `TauCeti.QHodge.ConditionR.of_etale_quotient` (example); `TauCeti.QHodge.KoszulRegular.of_isRegular` (compatibility).

Examples:

- For A = Z_p{x}^∧_p (free p-complete δ-ring) and α ≥ 1, R = A/x^α has the perfect-regular presentation with B = A and J = (x^α), and satisfies the p-complete conditions (Example 4.24).
- An étale A-algebra satisfies the p-complete conditions: L_{R/A} = 0 and the relative Frobenius of R/p is an isomorphism.
- Tor-amplitude in degree 1 does not imply relative semiperfectness modulo p (Remark 4.20, p ≥ 3).
- A smooth A-algebra of positive relative dimension is p-quasi-lci but not relatively semiperfect, since Ω^1_{R/A}/p ≠ 0; so the two existence theorems overlap only in relative dimension zero (étale algebras).

### Staticity of de Rham and q-de Rham complexes of quasi-lci inputs

For p-completely perfectly covered A and p-torsion-free R with cotangent Tor-amplitude concentrated in degree 1, prove staticity and p-torsion-freeness of p-completed dR, its Hodge completion, the completed Hodge steps and qdR. The uncompleted Hodge steps are static precisely when R/p is relatively semiperfect. With a perfect-regular presentation, identify dR with the p-completed PD envelope and its Hodge filtration with the PD filtration, and qdR with the q-PD envelope. Do not substitute the larger amplitude interval [0,1] for concentration in degree 1 in this theorem.

Prerequisites: HQ.5, HQ.2, HQ.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.3, PrismaticCohomology PR.3, PrismaticCohomology PR.6.

Source: QH Lemma 4.18(a), §4, p.61; Lemma 4.18(b), §4, p.61; Remark 4.19, §4, p.61.

### The one-categorical preimage filtration, and the injectivity that always holds

For p-torsion-free p-quasi-lci R over the same A, with R/p relatively semiperfect, the complexes are static. Define the naive filtration as the ordinary preimage of the combined Hodge/h-adic ideals of dR[1/p][[h]] under the canonical qdR map. This is an ordinary filtered-module pullback, not a derived preimage. It is a filtration by ideals in a static ring and hence has a filtered E∞-structure, with a unique filtered map to fil_Hdg dR. Surjectivity after filtered reduction by h remains a separate question.

Prerequisites: HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2.

Source: QH Construction 4.21, §4, p.62.

API: `TauCeti.QHodge.naiveFiltration` (constructor); `TauCeti.QHodge.naiveFiltration_mem_iff` (characterisation); `TauCeti.QHodge.naiveFiltration_mul` (structure); `TauCeti.QHodge.naiveFiltration_toHodge` (projection); `TauCeti.QHodge.naiveFiltration_injective_mod` (characterisation); `TauCeti.QHodge.naiveFiltration_baseChange` (functoriality).

Examples:

- For R étale over A, q-dR_{R/A} = R⟦q−1⟧ (p-completed) and the filtration is the (q−1)-adic filtration; its reduction modulo q−1 is the Hodge filtration (R in degree 0).
- For A = Z_p{x}^∧_p and R = A/x, the filtration is not a q-deformation of the Hodge filtration (Example 4.24; exponent-one node).
- For R = A/x^2, the element γ_q(x^2) − (u^{−1} − 1)δ(x^2) + u^{−2}(q−1)^{p−1}δ(x)^2, with [p]_q = pu + (q−1)^{p−1}, lies in fil^p and reduces to x^{2p}/p modulo q−1 (Example 4.24).
- The derived pullback differs: its H^1 in filtration degree 1 contains the class of 1/p ∈ dR_{R/A}[1/p]⟦q−1⟧, which lies neither in the image of q-dR_{R/A} nor in the combined filtration's first step plus that image.

### The naive filtration is always injective modulo q−1

Under the naive-filtration hypotheses, prove injection F/β↪fil_Hdg dR degreewise. Equivalently hF^{n−1}=F^n∩h·qdR for every n. No perfect-regular presentation is needed. This gives injectivity before the additional conditions used to prove it is a q-deformation.

Prerequisites: HQ.5, HQ.2.

Source: QH Lemma 4.26, §4, p.64.

### Higher powers of a Koszul-regular sequence make the naive filtration a q-deformation

If R=B/(x_1^{α_1},…,x_r^{α_r}) has a perfect-regular presentation with every α_i≥2, the naive filtered reduction is fil_Hdg dR. Retain p-torsion-freeness, p-quasi-lci and relative semiperfectness over a p-completely perfectly covered δ-base. The theorem includes p=2 and does not require even exponents. Those extra restrictions arise only in a particular spherical-lift proof below.

Prerequisites: HQ.5, HQ.2, PrismaticCohomology PR.0.

Source: QH Theorem 4.22, §4, p.62; Theorem 4.22(a), §4, p.62 · TC Lemma 3.16, §3, p.38; Paragraph 3.15, §3, p.38.

### For the quotient by x itself the naive filtration is not a q-deformation

For A=ℤ_p{x}^∧_p and R=A/x, compute D_1=A[φ(x)/p]^∧_p and qD_1=A[[h]][φ(x)/[p]_q]^∧_(p,h). The ordinary class x^p/p has no lift in the p-th naive step. Modulo h^p the correcting term involves u^(−2)h^(p−1)δ(x)/p, which is not integral and cannot be removed by hqD_1. Flat passage to the perfection gives the no-section witness. For x^α, α≥2, the expansion of δ(x^α) splits into an x^{p(α−1)}-multiple and a p-multiple, removing this obstruction.

Prerequisites: HQ.5, PrismaticCohomology PR.0.

Source: QH Example 4.24, §4, p.63.

### Flat base change, which reduces the well-behavedness theorem to a perfect base

For a p-completely flat δ-map A→A′ between p-completely perfectly covered bases, and R satisfying the naive-filtration conditions, identify the (p,h)-completed scalar extension of the naive filtration with the naive filtration of R′=(R⊗^L_A A′)^∧_p. This permits reduction to the perfect base. It is a statement about the constructed static preimage filtration, not arbitrary q-Hodge pairs under flat base change.

Prerequisites: HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2.

Source: QH Lemma 4.27, §4, p.65.

### The global filtration for quasi-regular inputs, and the section it defines

For perfectly covered Λ-base A and R satisfying global condition (R), glue the p-complete naive filtrations and the rational combined Hodge/h-adic filtration by an arithmetic pullback in filtered E∞-algebras. The map from the product is a set-level submodule comparison. Restrict to QReg_A^{qHodge}, where each p-complete naive filtration is a q-deformation; obtain a canonical partial section with compatible filtered derived commutative structure. Prime-by-prime torsion-free higher-power perfect-regular quotients give objects. Condition (R) alone is not enough for membership.

Prerequisites: HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2.

Source: QH Construction 4.28, §4, p.66; Theorem 4.29, §4, p.66; Remark 4.31, §4, p.67; Remark 4.30, §4, p.67.

### Tensor products of quasi-regular inputs and the operadic structure of the section

For R_1,R_2 in QReg_A^{qHodge}, if R_1⊗^L_A R_2 is static and torsion-free at every prime, it belongs to that class and its canonical filtration is the completed tensor of the two filtrations. Staticity and torsion-freeness are the tensor-closure conditions. Define the admissible simplicial subset as in the smooth case, keeping its composition limitation. On the full subcategory flat over A the tensor products remain in the class, giving a symmetric monoidal section.

Prerequisites: HQ.5, DerivedDeRhamCohomology DD.0, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract.

Source: QH Paragraph 4.32, §4, p.67; Lemma 4.33, §4, p.67; Corollary 4.34, §4, p.68.

### In what sense each section is unique, and what extra datum the smooth case needs

Target uniqueness of the quasi-regular section by terminality of the canonical filtration among pairs over the same qdR; the q-deformation axiom makes any such map an equivalence. In the smooth dimension-dependent class the canonical filtration is instead initial, only after requiring compatibility with qΩ→Ω[[h]]/h^n or a compatible ℤ_p×-action at every p. The source announces these uniqueness assertions without full body proofs. The smooth extra normalization must remain a hypothesis; the two directions of the universal property must remain distinct.

Prerequisites: HQ.5, HQ.3.

Source: QH Paragraph 1.21, §1, p.10.

### What is exported for finite etale arithmetic inputs, and the comparison that is not claimed

For étale R over perfectly covered A, the canonical H object is the static relative Habiro ring, with H/(q^m−1)≃qW_m(R/A) and H^∧_h≃R[[h]]. The map to the latter is HR.5's Frobenius-glued Taylor map. For R=O_F[1/Δ], with the discriminant inverted, import the GSWZ ring identification. HR.6 and HB.6/HB.7 consume the degree-zero and Taylor interfaces for arithmetic modules. Their K_3(F)-indexed modules and possible loss under Taylor completion are separate constructions; a finite étale ring comparison supplies no higher-dimensional cohomology class identification.

Prerequisites: HQ.5, HQ.3, HabiroRings HR.5, HabiroRings HR.5-number-field-comparison.

Source: QH Corollary 3.13, §3, p.27; Corollary 2.13, §2, p.19; Paragraph 1.4, §1, p.4.

## HQ.5-trace — Trace-theoretic existence and arithmetic exports

The trace theory supplies pairs under its own lift and resolution hypotheses. It is an alternative existence source, with the restrictions stated explicitly.

### q-Hodge filtrations from topological cyclic homology over connective complex K-theory

Import RT.4:q-Hodge's trace existence theorem. Over ℤ, a quasisyntomic R with 2 invertible and a connective spherical E_2-lift S_R, S_R⊗ℤ≃R, obtains a q-Hodge pair whose completed filtration identifies with Σ^(−2•)gr_{ev,hS¹} TC⁻(ku⊗S_R/ku). For the relative body theorem retain the full base condition (tC_p): each Â_p has a p-complete connective E∞-lift with the correct Tate-valued Frobenius on π_0 and its S¹-equivariant E∞-structure. R must be quasi-lci with bounded p^∞-torsion for each p, and at every p satisfy either a connective E_2-lift over that base lift or the E_1-resolution condition below. At p=2 the E_1 condition is additionally required (in particular it is vacuous when 2 is invertible). Consume the resulting pair and all four axioms; the TC construction belongs to RT.4/RT.6.

Prerequisites: HQ.3, HQ.5, HQ.2, RefinedTraceMethods RT.4:q-Hodge, RefinedTraceMethods RT.6.

Source: KU Theorem 1.2, §1, p.3; §4.3, pp.41–44; Theorem 4.27, §4, p.50.

### Why the spherical lift cannot be weakened to a lift over connective complex K-theory

The spherical lift in the ℤ-form cannot presently be replaced by a ku-lift as a theorem. The E_1 ku-version fails for the perfection's exponent-one quotient, which has an E_1 ku-lift but whose naive filtration is not a q-deformation. The source knows no E_2 ku-counterexample. Its possible image-of-J replacement is an expectation obstructed by the required S¹-equivariant diagram, rather than a supplied comparison.

Prerequisites: HQ.5-trace, HQ.5, HQ.3.

Source: KU Paragraph 1.11, §1, p.5.

### The one-disc refinement carries its own resolution hypotheses, and what it buys

The E_1 condition requires p-torsion-free R, a p-quasisyntomic cover R→R_∞ with R_∞/p relatively semiperfect and a lift of the completed Čech nerve to augmented cosimplicial connective E_1-algebras over the spherical base lift. Define the ad hoc even filtration as lim_Δτ_{≥2•}THH of that nerve, followed by residual S¹ homotopy fixed points. The local comparison works also at p=2 with the paper's stated Nikolaus input and argument. For the identity cover, the filtration is the naive preimage and independent of the chosen E_1-lift; for a general cover use the nerve limit and its induced multiplicative structure. This does not remove the E_2 theorem's 2-invertibility hypothesis without the replacement resolution assumptions.

Prerequisites: HQ.5-trace, HQ.5, RefinedTraceMethods RT.4:q-Hodge.

Source: KU Paragraph 1.9, §1, p.5; §4.3, p.45; Theorem 4.17, §4, p.45; Theorem 4.14, §4, p.43; Remark 4.15, §4, p.43; Paragraph 1.10, §1, p.5.

### A spherical E_1-lift of the perfection makes the naive filtration a q-deformation

Under the naive-filtration hypotheses, a p-complete connective spherical E_1-lift of R_∞=(R⊗_A A_∞)^∧_p makes F/β≃fil_Hdg dR. The lift is of the perfected base change, and its existence does not enter the definition of F. A higher-power presentation gives such a lift for p>2; at p=2 the cited quotient construction needs even exponents at least 4. Thus it does not subsume the full higher-powers theorem at 2. The example A=ℤ_p[x]^∧_p, δ(x)=0, R=A/(x−1) has the lift condition without the higher-powers presentation.

Prerequisites: HQ.5, HQ.5-trace, HQ.2, RefinedTraceMethods RT.4:q-Hodge.

Source: QH Theorem 4.22(b), §4, p.62; Theorem 4.22, §4, p.62; Remark 4.23, §4, p.63; Paragraph 1.19, §1, p.9; Example 4.25, §4, p.64.

### The Habiro ring of a number field as a limit of genuine fixed points

Record RT.4:Habiro-comparison's arithmetic application. For a number field F and Δ divisible by 6 and disc(F), the étale spherical lift of O_F[1/Δ] gives H_{O_F[1/Δ]}≅π_0 lim_{m|} THH(KU⊗S_{O_F[1/Δ]}/KU)^{C_m h(S¹/C_m)}. Take genuine C_m-fixed points first, then homotopy fixed points for the residual circle, and the divisibility limit. This is a π_0 comparison with stronger inversion hypotheses than the coefficient ring construction; it is an export, not a prerequisite for constructing H here.

Prerequisites: RefinedTraceMethods RT.4:Habiro-comparison, HQ.5.

Source: KU Corollary 6.15, §6, p.86.

## HQ.6 — The analytic comparison problem

The following targets pose and delimit a comparison problem; they do not supply an analytic equivalence.

### The comparison problem, stated with its domain, its coefficient change and its status

Keep an open comparison problem for smooth ℤ-schemes X with primes ≤dim(X/ℤ) inverted: compare algebraic RΓ(X,H_X) with the cohomology of the analytic Habiro stack after a specified suitably completed localization of H^an, and determine its equivalence range. Ask the analogous question for the arithmetic coefficient rings and regulator line bundles. The analytic-side supplier is HS.3; the map and the exact coefficient localization still need construction. The expected equality loses information on both sides and is not an equivalence of the original theories or a hypothesis for later theorems.

Prerequisites: HQ.5, AnalyticHabiroStack HS.3.

Source: QH Paragraph 1.17, §1, p.8; Paragraph 1.3, §1, p.3; Paragraph 1.4, §1, p.4.

API: `TauCeti.QHodge.analyticComparisonProblem.domain` (characterisation); `TauCeti.QHodge.analyticComparisonProblem.coefficients` (data); `TauCeti.QHodge.analyticComparisonProblem.transformation` (data); `TauCeti.QHodge.analyticComparisonProblem.lossy` (relation); `TauCeti.QHodge.analyticComparisonProblem.unused` (other).

Examples:

- Already for X = Spec O_F[1/Δ] the source says Spf H_{O_F[1/Δ]} does not precisely match (Spec O_F[1/Δ])^Hab; a formulation asserting an equivalence before the completed localisation fails this case.
- For X of relative dimension d without the primes p ≤ d inverted (for example A^2_Z), the algebraic side is not defined and the problem does not arise.
- For X over Z[1/N], the algebraic side has every prime p ≤ dim X inverted while the analytic side does not (N is not invertible everywhere on Z[1/N]^Hab); any comparison therefore has to invert those primes on the analytic side, which is part of the completed localisation.
- Within this construction only the other two HQ.6 nodes and the acceptance suite list the problem among their prerequisites, each to record a boundary.

### Small primes, roots of unity and the absence of a stacky approach

Retain the source's three distinctions in that problem. Algebraic construction discards small primes while the current analytic construction can retain their information. At roots of unity the analytic stack's specialization is the infinitesimal/de Rham-stack theory, not the algebraic q-Witt specialization. Finally, the dimension bounds on diagonals and tensor powers limit the available multiplication coherence on the algebraic side. The first distinction follows from construction; the latter stack behavior and expectation about global commutative structure have the scope of the cited analytic account and do not constitute a non-existence theorem.

Prerequisites: HQ.6, HQ.3, HQ.5, HQ.4.

Source: QH Paragraph 1.17(a), §1, p.8; Paragraph 1.17(b), §1, p.8; Paragraph 1.17(c), §1, p.8; Paragraph 1.17, §1, p.8.

### The discipline: a language for a comparison is not a comparison

Use analytic and condensed theories as suppliers of language and actual objects, without treating their existence as a proof of the open comparison. The direct solid input is HR.2's closure of bounded-below Habiro-complete objects under solid tensor; the trace import uses RT's own solid methods. No six-functor formalism is required for an algebraic result here. An analytic-stack assertion drawn from Scholze's cited lecture course remains an assertion from that source until the necessary HS.3 construction is supplied.

Prerequisites: HQ.6, HabiroRings HR.2.

Source: QH §B, pp.77–81; Lemma B.8, §B, p.79; bibliography, pp.81–82.

## HQ.7 — Worked examples and suggested interfaces

These computations distinguish the definitions and verify the proposed interface. They exercise the established comparison statements and their hypotheses.

### Polynomial, étale, scheme and trace examples

Work through polynomial, finite étale, small-prime-inverted smooth-scheme and spherical trace examples under the two supplied specializations, q=1 and the local q-de Rham prism. For A[x], D_q(x^r)=[r]_q x^(r−1), while the q-Hodge differential is (q^r−1)x^(r−1). For the latter M, H^0(M/^Lh)=ℤ[x] but H^0(M)/h=ℤ, with the difference carried by H^1(M)[h]. The étale arithmetic case gives H and its q-Witt reductions. ℤ[x]⊗ℤ[x]=ℤ[x,y] leaves the canonical smooth class until 2 is inverted; ℤ[1/2][x] has the explicit spherical lift and agrees with the trace filtration. The Laurent ℚ example distinguishes dR from Hodge-completed Ω. None of these examples uses the analytic comparison.

Prerequisites: HQ.1, HQ.3, HQ.5, HQ.5-trace, HQ.2, HQ.6.

Source: QH Remark 1.13, §1, p.7; Paragraph 1.10, §1, p.6; Paragraph 1.17(c), §1, p.8; Remark 3.6, §3, p.22 · KU Theorem 6.10, §6, p.83.

### Native and enhanced signature interfaces

Use genuine native polynomial signatures for q-integers, D_q, its twisted Leibniz rule and hD_q, with specialization at q=1. Reuse geometric sums, cyclotomic polynomials and degree-zero Witt vectors from Mathlib. Enhanced pairs, completion, animation, décalage and the cohomology theories require the earlier named supplier interfaces. Their ordinary categorical diagram signatures represent only ordinary data and laws; they do not establish higher coherence. Where a full mathematical condition cannot be expressed, retain an explicit omission with its hypotheses rather than substitute an unspecified proposition or an axiom.

Prerequisites: HQ.1, HQ.3, HQ.4, Mathlib geom_sum_mul, Mathlib Polynomial.comp, Mathlib Polynomial.derivative_X_pow, Mathlib Polynomial.cyclotomic_prime.

Source: QH Remark 1.13, §1, p.7; Definition 3.2, §3, p.20.

## HQ.8 — Comparison squares and specialization compatibility

Use the previously constructed maps. For every square, retain the coefficient base and the order of derived operations; add no equivalence before its necessary base change.

### Comparison-square data

Define a comparison-square record with four named functorial corners and four actual maps, together with: coefficient base, input class, completion ideal for each corner, inversion and its order, Frobenius linearization, filtrations, and Tate/Breuil–Kisin twists. State whether its conclusion is an equivalence, a base-changed equivalence, a map or a torsion exact sequence. The domains are intersections of the hypotheses of the imported maps. This is mathematical bookkeeping rather than a construction of any corner. Keep distinct the q-PD ideal (h), prism ideal ([p]_q), perfectoid ξ=φ^(−1)([p]_q), and cyclotomic quotient q^m−1. The ordinary Lean record describes these parameters and compositions; its enhanced functor and coherence content requires the suppliers.

Prerequisites: HQ.1, HQ.2, HQ.3.

Source: QH Theorem A.1(b), §A, p.69; Definition 3.2, §3, p.20; Paragraph 1.17, §1, p.8 · BS Notation 16.1, §16, p.106.

API: `AtlasSquare` (structure); `AtlasSquare.Base` (data); `AtlasSquare.InputClass` (data); `AtlasSquare.CompletionIdeal` (data); `AtlasSquare.Inversion` (data); `AtlasSquare.Linearisation` (data); `AtlasSquare.Filtration` (data); `AtlasSquare.Twist` (data); `AtlasSquare.Loss` (characterisation); `AtlasSquare.localPrismatic` (example); `AtlasSquare.qCrystalline` (example); `AtlasSquare.aInf` (example); `AtlasSquare.decalageQSubOne` (example); `AtlasSquare.decalagePrismIdeal` (example); `AtlasSquare.nygaard` (example); `AtlasSquare.crystalline` (example); `AtlasSquare.qEqOne` (example).

Examples:

- The local prismatic square has base the q-de Rham prism at p, completion (p, q−1), linearisation ψ^p and is an equivalence outright.
- The base of the local prismatic square is the prism ([p]_q), not the q-PD pair ((q−1)); a record that confused the two ideals would fail this.
- The A_inf square is not an equivalence outright: its loss is 'after base change'.
- At q = 1 the deformed side carries the conjugate filtration, the classical side the Hodge filtration, and the comparison is a short exact sequence.
- The canonical map ℚ → ℚ_p is not surjective: completing at p and then inverting p is not inverting p, so a record without the order item would conflate clauses (c) and (c_p).
- The p-adic completion of the ℤ-module ℚ is zero, so a base change that begins with p-completion discards all rational information.

### The two bases, imported, and the congruences that identify completion ideals across corners

For a prime p, import the q-de Rham prism over ℤ_p and its base change to p-torsion-free Â_p. Its δ(q)=0, [p]_q≡p mod h and φ(h)=h[p]_q. In its prism quotient, h^(p−1) and p differ by a unit, giving equality of derived (p,[p]_q)- and (p,h)-completion. For a characteristic-zero perfectoid field C containing p-power roots with chosen ε, put A_inf=W(O_C^♭), q=[ε], μ=h and ξ=φ^(−1)([p]_q). Import the bounded-prism and q-PD-pair maps ℤ_p[[h]]→A_inf; their complete flatness upgrades to flatness, and the map is faithfully flat. Fontaine θ(q)=1, ker θ=(ξ); (p,ξ),(p,[p]_q),(p,μ) have the same radical. PR.6's q-PD property includes φ(I)⊂[p]_qD, γ(I)⊂I, bounded prism (D,[p]_q), and the p-torsion-free finite complete Tor-amplitude condition on D/h. None is another chosen divided-power structure.

Prerequisites: HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib geom_sum_mul, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib PreTilt, Mathlib WittVector.teichmuller, Mathlib WittVector.fontaineTheta, Mathlib WittVector.fontaineTheta_teichmuller.

Source: BS Notation 16.1, §16, p.106; Definition 16.2, §16, p.106; Notation 17.1, §17, p.117 · Sch Lemma 4.1, §4, p.8.

### Domains of the comparisons

The comparisons below apply to their displayed input classes after their specified operations. Smooth chosen pairs yield the h-décalage statement; no general animated Habiro descent of qdR is supplied. The perfectoid comparison is after a non-conservative base change selecting p and depends on ε. The analytic comparison remains a separate problem after a completed localization. Define the local objects and filtrations independently before comparing them, so that a comparison does not supply its own prerequisites.

Prerequisites: HQ.8, HQ.3, HQ.6.

Source: QH Paragraph 1.17, §1, p.8; Remark 3.48, §3, p.49 · BS Theorem 17.2, §17, p.117.

### The p-complete square: the global complex against prismatic cohomology over the q-de Rham prism

For smooth S over prime-by-prime torsion-free Λ-base A, compose (qΩ_{S/A})^∧_p≃qΩ_{Ŝ_p/Â_p} with PR.6's q-crystalline/prismatic equivalence to Δ_{S^(p)[ζ_p]/Â_p[[h]]}. Arithmetic gluing commutes with this comparison by its defining corner. Record: q-de Rham prism at p; smooth inputs; (p,h) completion, equivalently (p,[p]_q); no inversion; coefficient ψ^p and q↦q^p; no filtration or Tate twist; an E∞-equivalence at p. The Frobenius-twisted S is indispensable.

Prerequisites: HQ.8, HQ.1, PrismaticCohomology PR.6.

Source: QH Theorem A.1(b), §A, p.69; Construction A.12, §A, p.75; Theorem A.1, §A, p.69 · BS Theorem 16.18, §16, p.113.

### q-crystalline cohomology against the framed q-de Rham complex, and the coordinate-free comparison

For a q-PD pair (D,I) with D flat over ℤ_p[[h]], p-completely smooth R over D/I, and a surjection from a p-completely ind-smooth D-algebra with p-completely ind-étale framing X_s, import PR.6's unique extensions γ_s to the q-PD envelope, congruent to id modulo hX_s. The Koszul complex of (γ_s−id)/(hX_s) computes q-crystalline cohomology. In the special pair (Â_p[[h]],(h)), the coordinate-free and framed rational comparisons form HQ.1's commuting envelope square. Record: that q-PD base and framed presentation; p-completion, then rationalization, then h-completion; no Frobenius linearization, filtration or twist; the resulting equivalences hold after these operations. The framed models remain frame-dependent.

Prerequisites: HQ.8, HQ.1, PrismaticCohomology PR.6.

Source: BS §16.3, p.107; Lemma 16.21, §16, p.115; Theorem 16.22, §16, p.115 · QH Lemma A.10, §A, p.74.

### The A-infinity square, over the perfectoid base

For p, a characteristic-zero perfectoid C with chosen ε and p-completely smooth R/O_C, import PR.6's AΩ_R≃qΩ_{R/A_inf}≃φ_A^*Δ_{R/A_inf}, Frobenius-compatible. Here qΩ is over the pair (A_inf,(ξ)). The initial E_1 comparison upgrades to E∞ by the source's semiperfectoid left Kan extension and quasisyntomic descent. For smooth ℤ-algebra S and R=(S⊗O_C)^∧_p, define β_S:qΩ_{S/ℤ}⊗̂_{ℤ[[h]]}A_inf≃AΩ_R as the composite of the local square, bounded-prism base change, the q-crystalline comparison and this AΩ comparison. Likewise allow torsion-free Λ-base A with a δ-map Â_p→A_inf. Record: chosen perfectoid base; (p,ξ)-completed tensor; no inversion; φ_A-pullback; no filtration or Tate twist; equivalence after this base change. The original global theories are not thereby equivalent.

Prerequisites: HQ.8, HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.1, PrismaticCohomology PR.6, AInfCohomology AI.3.

Source: BS Notation 17.1, §17, p.117; Theorem 17.2, §17, p.117; Remark 17.3, §17, p.117; Theorem 1.8, §1, p.4; Corollary 4.12, §4, p.40 · Sch Conjecture 4.3, §4, p.9.

### The décalage square at q − 1

For a smooth q-Hodge pair over perfectly covered A, the square is Lη_h qHdg≃qΩ, compatible with h-completion and with the Habiro descent. Record: A[[h]] with h; chosen smooth pair; h-complete objects; no inversion or Frobenius; chosen q-Hodge filtration and the unfiltered qΩ target; trivial twist; an equivalence on this class. Import AI.1's formula H^i(η_IK)=(H^iK/H^iK[I])⊗I^⊗i for I-torsion-free models, and its completion commutation for invertible locally rank-one I in a replete topos. The Beilinson connective-cover description requires a Cartier divisor. Lη is not exact; no exactness is used here.

Prerequisites: HQ.8, HQ.2, HQ.3, AInfCohomology AI.1.

Source: QH Proposition 3.47(b), §3, p.48 · BMS1 Lemma 6.4, §6, p.49; Lemma 6.20, §6, p.55 · BMS2 Proposition 5.8, §5, p.32.

### The décalage square at the prism ideal: the relative Frobenius of the p-completed q-de Rham complex

For smooth S over perfectly covered A, let B=Â_p[[h]], J=([p]_q) and T=S^(p)[ζ_p]. Transport PR.3's relative-Frobenius equivalence Δ_{T/B}⊗̂_{B,φ_B}B≃Lη_JΔ_{T/B} through the local square to (qΩ^(p))^∧_p≃Lη_{[p]_q}(qΩ)^∧_p. Record: bounded q-de Rham prism; smooth p-adic formal input T over B/J; (p,h)-completion; no inversion; ψ^p with q↦q^p; Nygaard on the source and décalage filtration on the target; no additional Tate twist; an equivalence at p. This supplies the twisted gluing datum without confusing [p]_q with h.

Prerequisites: HQ.8, HQ.2, HQ.4, PrismaticCohomology PR.3, AInfCohomology AI.1.

Source: QH Paragraph 3.14, §3, p.28; Paragraph 3.20, §3, p.32 · BS Theorem 15.3, §15, p.103.

### Filtration-gluing obstruction

The canonical filtrations of the décalages in the twisted construction fail to agree on its evident gluing square. At m=p the trivial filtration of the identity piece on the Frobenius twist is incompatible with the natural filtration on Lη_{[p]_q}(qΩ)^∧_p. A candidate global Nygaard filtration would need the prescribed p-adic filtration, the combined rational Hodge/[p]_q filtration, and the corresponding agreements at every other prime. A chosen q-Hodge pair supplies the necessary data. This is an obstruction to that particular canonical construction, not a theorem excluding every possible descent without a pair.

Prerequisites: HQ.8, HQ.2, HQ.4, AInfCohomology AI.1.

Source: QH Remark 3.18, §3, p.30; Remark 3.49, §3, p.49.

### The Nygaard filtrations on the two sides, and the staging that keeps the argument non-circular

For smooth S over perfectly covered A and a≥1, compare the prismatic Nygaard filtration on (qΩ^(p^a))^∧_p with the explicit q-Witt Nygaard filtration after the degree-one filtered quotient by q^{p^a}−1. The unique filtered E∞-equivalence extends the twisted deformation at filtration degree zero. Record: q-de Rham prism with iterated Frobenius and cyclotomic reduction; smooth inputs; p-completion; no inversion; a-fold coefficient Frobenius; Nygaard on both sides; trivial extra twist. Construct the prismatic filtration via Frobenius divisibility and quasisyntomic descent before using the comparison. It has no trace-theoretic prerequisite.

Prerequisites: HQ.8, HQ.4, HQ.2, PrismaticCohomology PR.3.

Source: BS Theorem 15.2, §15, p.102; Theorem 15.3, §15, p.103 · QH Proposition 3.22, §3, p.32.

### The cyclotomic specialisation: q-de Rham-Witt against ordinary de Rham-Witt and crystalline cohomology

For smooth S over perfectly covered A, the cyclotomic comparison combines H/(q^m−1)'s ascending q-Witt filtration, the smooth underived graded forms, and qΩ^(m)/(q^m−1)≃qW_mΩ. At p use the explicit Adams-twisted de Rham formula of HQ.4 for m=p^a and its prime-to-p product extension. If A is additionally a ℤ_(p)-algebra, retain W_{a+1}Ω→qW_{p^a}Ω as a Frobenius/Verschiebung-compatible map. Reach classical crystalline cohomology only via CR.4's ordinary de Rham–Witt comparison on the smooth special fiber over a perfect characteristic-p field and the required relative base reduction. Record: A[q]/(q^{p^a}−1); p-completion; no inversion; ψ^{p^a}; ascending q-Witt versus stupid filtrations; no extra Tate twist. The ordinary-to-q-Witt map is neither inverted nor equipped with restrictions on its target.

Prerequisites: HQ.8, HQ.3, HQ.4, CrystallineCohomology CR.4, Mathlib Polynomial.prod_cyclotomic_eq_X_pow_sub_one.

Source: QH Theorem 3.11(b), §3, p.25; Proposition 3.19, §3, p.31 · QW Proposition 4.2, §4, p.54; Remark 3.18, §3, p.42 · BMS1 Theorem 1.10(i), §1, p.6.

### The specialisation at the parameter value one, with its torsion correction

At q=1, smooth qΩ reduces to Ω while animated qdR reduces to dR. For a pair, F/β is the Hodge filtration and qHdg/h carries the ascending conjugate filtration with graded shifted derived forms. On smooth cohomology retain 0→H^i(qΩ)/h→H^i_dR→H^{i+1}(qΩ)[h]→0, from the derived cofiber of multiplication by h. For smooth schemes proper over ℤ[1/N], use completed descent and proper de Rham finiteness to obtain the corresponding finitely generated q-de Rham groups over ℤ[1/N][[h]]. Record: global h-adic coefficient base, not a prism; smooth inputs for Ω and the torsion sequence, chosen animated pairs for the filtered clauses; no inversion or Frobenius; Hodge and conjugate filtrations; trivial twist. The cohomology conclusion is an exact sequence rather than an isomorphism.

Prerequisites: HQ.8, HQ.1, HQ.2, HQ.3, DerivedDeRhamCohomology DD.2.

Source: QH Theorem A.1(a), §A, p.69; Paragraph A.14, §A, p.76; Definition 3.2(b), §3, p.20; Lemma 3.9, §3, p.23 · Sch Remark 3.2, §3, p.7.

### Commutation of the eight squares

Combine the eight commuting comparison squares: local prismatic, rational framed q-crystalline, perfectoid A_inf, h-décalage, prism-ideal décalage, Nygaard, cyclotomic/classical crystalline and q=1. Each uses its stated domain and its already constructed maps. Their conjunction adds no enlarged input class. Compatibility of β_S with the canonical θ and Witt specializations of CP.1 is a further pair of targets below; it is not inferred from the existence of an A_inf equivalence.

Prerequisites: HQ.8.

Source: QH Theorem A.1, §A, p.69; Proposition 3.19, §3, p.31; Proposition 3.22, §3, p.32.

### Information retained by coefficient changes

Track information along the maps. The local prism sees p alone; the rational framed comparison loses integral information. Perfectoid base change first p-completes, killing rational objects and other-prime components, and depends on ε. The h-décalage equivalence needs smooth chosen pairs and its functor is not exact. The prism-ideal and Nygaard comparisons are local at p, the latter also cyclotomically reduced. The ordinary-to-q-Witt map forgets restrictions and is not an equivalence; q=1 retains a torsion correction. CP.1's proper smooth étale comparison is accessible only through the non-conservative perfectoid change and μ-inversion, so no étale equivalence of the original global Habiro objects is asserted. Algebraic scheme construction has already discarded primes ≤dimension.

Prerequisites: HQ.8, HQ.5, HQ.6, CohomologyComparisons CP.1, CohomologyComparisons CP.6.

Source: QH Paragraph 1.17(a), §1, p.8 · BS Notation 17.1, §17, p.117 · Sch Conjecture 4.3, §4, p.9 · BMS1 Remark 6.6, §6, p.50.

### Independent prismatic and trace constructions

Build prismatic Nygaard from PR.3's Frobenius-divisibility descent. RT.6's trace filtration is instead obtained from quasisyntomic descent of double-speed Postnikov data and subsequently compared with prismatic Nygaard. The Nygaard and décalage squares use PR.3, AI.1 and HQ.4, without RT prerequisites. The trace existence theorem consumes HQ.3's pairs, PR.0–PR.3, AI.1, DD.2 and the early RT constructions; it does not depend on this comparison layer. Syntomic comparisons remain in RT.6. These directions prevent defining a filtration by the theorem intended to compare it.

Prerequisites: HQ.8, HQ.5-trace, RefinedTraceMethods RT.6, PrismaticCohomology PR.3.

Source: BS Theorem 15.3, §15, p.103 · QH Paragraph 3.20, §3, p.32 · BMS2 Theorem 1.12, §1, p.6 · KU Theorem 1.2, §1, p.3.

### Examples for the eight squares

Check each square on its smallest informative input. For ℤ[x], use the Frobenius-twisted p-adic affine line, two framed envelope models, the completed A_inf base change and the coordinate h-décalage calculation. For S=A=ℤ, the prism-ideal décalage is ℤ_p[[h]] in degree zero and (qW_pΩ)^∧_p=ℤ_p[q]/(q^p−1). Check the first two degree-zero Nygaard steps, and the derived q=1 torsion sequence. Every example retains its coefficient, input, completion, inversion, Frobenius, filtration and twist record. The θ/Witt compatibility targets have their own map-equality tests and do not follow from these object examples.

Prerequisites: HQ.8.

Source: QH Remark 1.13, §1, p.7; Paragraph 1.10, §1, p.6 · Sch §2, pp.3–4 · BS Theorem 17.2, §17, p.117.

### Comparison signature interfaces

In the comparison prototype use native cyclotomic, geometric-sum, Witt, tilt and Fontaine-θ declarations for coefficient identities. Express the eight records and their ordinary comparison compositions against structures containing actual maps and identifications supplied by their owners. Such ordinary categorical signatures do not prove enhanced descent or higher coherence. Keep the missing θ/Witt natural map equalities, the full-functor uniqueness hypotheses and the global descent in explicit comments until those interfaces exist. There is no unspecified proposition standing for the missing comparison.

Prerequisites: HQ.8, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib WittVector.fontaineTheta_teichmuller.

Source: BS Notation 16.1, §16, p.106 · QH Theorem A.1(b), §A, p.69.

### Canonical θ/de Rham compatibility target

Fix p, a complete algebraically closed nonarchimedean C/ℚ_p with residue field k, and ε. For smooth ℤ-algebra S let R=(S⊗O_C)^∧_p and F_S=qΩ_{S/ℤ}⊗̂A_inf, with β_S exactly the composite defined above. Write D_R=Ω^{•,cont}_{R/O_C}. The target is equality c_{θ,R}∘β_{S,θ}=a_{θ,S}: (F_S⊗^L_{A_inf,θ}O_C)^∧_p→D_R. Here a_{θ,S} uses transitivity of completed base change, θ(q)=1, qΩ/h≃Ω and smooth de Rham base change; c_{θ,R} is AI.4/CP.1's canonical BMS de Rham map. This affine enhanced multiplicative natural equality remains to be proved. θ has kernel ξ; θ̃ is the different Hodge–Tate map. A possible BS uniqueness argument must extend to all p-completely smooth algebras over the perfect-prism quotient and preserve its Hodge–Tate structure map; agreement on ℤ-defined lifts or arbitrary reduced maps is insufficient. Sheaf compatibility and descent are needed for CP.1's proper smooth diagram. Record (p,ξ)-completion before θ, p-completion afterwards, no inversion, retained φ_A-pullback, and no new filtered or Tate-twisted comparison.

Prerequisites: HQ.8, HQ.1, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6.

Source: BMS1 Theorem 14.1(ii), §14, p.118, proof pp.118–119 · BS Notation 18.1, §18, p.122; Theorem 18.2, §18, p.122; Lemma 18.3, §18, p.122, proof pp.122–124.

Examples:

- For S = ℤ the square is the coefficient reduction A_inf → O_C and the identity of O_C in degree zero.
- For S = ℤ[T,T⁻¹], compare both routes on dlog T and on the differential, not just on graded cohomology.
- The equality is natural in S and respects the enhanced multiplicative maps; θ and θ̃ are not conflated.
- No completed proof or filtered strictness is claimed while the compatibility gap remains.

### Canonical Witt/crystalline compatibility target

With the same data and β_S, let w:A_inf→W(k), w(q)=1, S_k=S⊗k, S_W=(S⊗W(k))^∧_p, D_W=Ω^{•,cont}_{S_W/W(k)} and C_k=RΓ_crys(Spec S_k/W(k)). Construct a_{w,S}:(F_S⊗^L_w W(k))^∧_p≃D_W by q=1 and completed smooth de Rham base change. Import ι_S:D_W≃C_k, the inverse of the crystalline-to-de-Rham smooth-lift map, from CR.2's finite-Witt PD Poincaré lemma and derived inverse limit. Import c_{w,R} from AI.4/CR.4/CP.1. The target equality is c_{w,R}∘β_{S,w}=ι_S∘a_{w,S}, with compatibility with the relevant q-crystalline/prismatic base reductions. It remains to be proved, including enhancement, multiplicativity and lift independence. Retain Frobenius on β and the transported Witt Frobenius; ℤ-descent identifies the lift's coefficient twist. Do not invert W_{a+1}Ω→qW_{p^a}Ω. The same full-functor/Hodge–Tate uniqueness and global descent prerequisites as in the θ target apply. Record (p,ξ)-completion before w, p-completion afterwards, no inversion and no additional filtration or Tate twist.

Prerequisites: HQ.8, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CrystallineCohomology CR.2, CrystallineCohomology CR.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6.

Source: BMS1 Theorem 14.1(i), §14, p.118, proof pp.118–119 · BS Notation 18.1, §18, p.122; Theorem 18.2, §18, p.122; Lemma 18.3, §18, p.122, proof pp.122–124.

Examples:

- For S = ℤ the target is the identity comparison of W(k) with crystalline cohomology of Spec k in degree zero.
- For S = ℤ[T,T⁻¹] compare the two composites on dlog T, and record the Frobenius normalization.
- No inverse of W_{α+1}Ω → qW_{p^α}Ω and no qW restriction map enters the construction.
- The equality is an obligation of the plan, not a claimed verified commutative square.
