# Kato classes and explicit reciprocity for modular forms

This roadmap builds the modular classes used by Euler-system arguments. It begins with a norm-normalized theta unit on an elliptic curve, pulls it back to torsion sections of modular curves, forms the ordered pair of unit classes in scheme K₂, and applies the étale Chern moment map. The resulting conductor families belong to the Euler-system carrier owned by EulerSystemsAndKolyvaginSystems. Their local dual exponentials are computed by Kato’s explicit reciprocity law. Modular-symbol periods then turn these computations into critical L-values. Analytic nonvanishing and the generic Euler-system bounds yield the cohomological and ordinary Selmer upper bounds.

The construction has several distinct outputs. The integral geometric classes retain both auxiliary integers. The rational Kato morphism is obtained only after its rational-membership and Iwasawa-module arguments. Nakamura’s full-level Hecke-linear classes retain the entire modular cohomology before an eigenform quotient. His twist-one morphism uses the dual form and two genuine representation twists. The scalar regulator also requires a refinement and a normalized differential. A useful library provides these objects and their comparison maps separately: knowing an abstract norm-compatible family, a one-dimensional period line, or a generic local regulator does not construct any of them.

The five layers below form a complete pass at the level of their targets. Every declaration has a statement, hypotheses, proof outline and direct suppliers. Constructions have an API derived from their uses and at least three discriminating tests. All five layers have status **planned**; none is **closed**. Twelve proof-closure gaps and twenty-nine requested exports are recorded at the end. Every implementation status is unchecked. This is a mathematical library plan, and no existence or formalization claim follows from the suggested signatures.

The core source is Kato’s published Astérisque paper. The additional scope includes the exact all-prime rational inputs used by Burungale–Tian, Nakamura’s §3 and Appendix A normalization and characterization, and the elliptic-curve applications in Rubin’s public AWS draft, Chapter III §5. Universal deformation theory is supplied by AutomorphicCongruences, reverse CM divisibility by the separate CM direction, and generic Euler-system descent and Selmer machinery by their owners. The all-prime CM module-structure input must precede the rational Kato map; it cannot be proved using an equality that already contains that map.

The [packet](../packets/KatoEulerSystems.json) contains the dependency graph, and the [suggested file](../suggested/KatoEulerSystems.lean) proposes names and types. The document is definitive. The prototypes use the existing units, linear maps, polynomials, submodules and module carriers. Where geometry, continuous cohomology, periods or analytic conditions cannot be expressed at the baseline, those conditions are explicitly omitted and the signatures show only the expressible part. The rational map’s generator-realization input and the numerical length bounds are conditional algebraic prototypes. The Iwasawa structure signature separately concludes rank-one freeness without assuming a basis. Arithmetic existence and the omitted geometric hypotheses remain targets of the document.

## Scope and conventions

Fix a prime p, a normalized newform f of weight k≥2 and level N, its coefficient field F, and a place λ above p. Write O_λ for its integer ring and E=F_λ for the coefficient field. In the formulas that involve f*, the star means coefficient conjugation: if f=∑a_nq^n, then f*=∑ā_nq^n. It cannot be dropped from the period equation.

The integral Iwasawa algebra is Λ=O_λ[[G_∞]], G_∞=Gal(Q(ζ_{p∞})/Q); Λ_Q=Λ[1/p]. A statement about the cyclotomic Z_p-extension uses its Γ component instead. Torsion, rank one and height-zero support are interpreted componentwise where the finite tame part gives several components. In particular p=2 remains in the rational input; it is not silently removed when an integral result requires an odd prime.

The following choices determine all comparisons.

- **Level and constants.** Y(N) is the full-level fine moduli scheme over Z[1/N], N≥3, with its universal elliptic curve. The selected geometric component uses the Weil pairing ζ_N=e^(2πi/N). Its generic constant field is Q(ζ_N). The total moduli scheme retains the determinant action on this field. Y(M,N) uses Kato’s two-index torsion data; a Γ₁ correspondence alone does not supply its transfers.
- **Units and divisors.** The normalization is div(cθ_E)=c²[0]−E[c], with c≥2 prime to 6. Norms correspond to divisor pushforward. Multiplication pullback introduces additional torsion support. The inverse divisor printed in Nakamura §3.1.3 defines the inverse individual unit; both inversions cancel in the two-entry K₂ symbol.
- **Ordered symbol and regulator.** The Beilinson element is {c-g_(1/M,0),d-g_(0,1/N)} in that order. Kato’s regulator is the Kummer cup. Under the imported higher-Chern convention it is −c_(2,2), or ch_(2,2), on these symbols. The weight-two integral formula has no factorial denominator. Rational symmetric projectors in a Kuga–Sato comparison retain their denominators.
- **Moment twist.** If H_p is geometric H¹ and T_pE=H_p(1), then Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2). The Chern twist 2, root exponent −r and moment twist k−2 add to k−r. The reverse-oriented source equality has 2−k on the Tate-module side.
- **Euler factors.** T′ keeps the normalization in Kato Lemma 8.8. The away-from-p linear coefficient contains ell^(−r), including at ell dividing N; the quadratic coefficient is ell^(k−1−2r). Kato 13.1 defines P_ell(t)=det(1−Fr_ell t:T) using arithmetic Frobenius without an inverse, and evaluates it at ell^(−1)σ_ell^(−1). Representation duality and variable substitution belong to the imported ES.2 adapter.
- **Local reciprocity.** The p-factor is 1 if p divides M; it is 1−p^(−r)A if p does not divide M but divides N; and 1−p^(−r)A+p^(k−1−2r)B if p divides neither M nor N. None of these cases changes the definition of T′.
- **Filtration.** F^iD_dR(V) is the whole space for i≤0, the modular-form step for 1≤i≤k−1, and zero for i≥k. Exp* lands in a filtration step. At interior critical degrees consecutive steps agree and their associated graded quotient is zero.
- **Iwasawa twists.** Twist the class by k−r before specializing to a finite level, localizing and applying exp*. With κ the cyclotomic character, twist_j(σx)=κ(σ)^(−j)σ twist_j(x) when the source and twisted target actions are distinguished. A root at one finite level does not make this representation twist.
- **Signs and periods.** For the critical value r, use the projection with sign (−1)^(k−r−1)χ(−1) and the factor (2πi)^(k−r−1). Kato’s untwisted morphism satisfies z(ιγ)=−σ_(−1)z(γ). Nakamura’s source twist 1−k and output twist k give output twist one and positive conjugation equivariance.
- **Refinement.** The scalar regulator requires nonzero α, an eigenvector η with φη=αη, and ⟨ω,η⟩=1. The noncritical comparison has slope v_p(α)<k−1. Its periods, Gauss sums, roots and character inversions must agree with the analytic distribution. General de Rham and integral ordinary extensions are exact requested exports.
- **Divisibility.** Upper bounds on localized module lengths give containment of the characteristic ideal of the zeta quotient, with its local correction, in that of H². They do not give equality. At primes above p a rational theorem does not imply an exact integral theorem. Split multiplicative reduction retains the augmentation factor.
- **Elliptic local hypotheses.** Use the minimal Néron differential and the real period, with an integral parametrization factor r_E independent of p. The printed singular-lattice formula and the exact rank-zero p-part upper bound are used at odd p. Rational non-CM image hypotheses remain usable at p=2 with the actual local logarithm lattice.

## Baseline and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit records that the modular scheme classes, continuous conductor cohomology, reciprocity and divisibility targets are missing. The primitive declaration statements were read at the Mathlib pin; they supply carriers and algebraic vocabulary, rather than the arithmetic theorems.

| Declaration | What is reused | Source at the pin |
| --- | --- | --- |
| `mathlib:PowerSeries` | Formal power series as one-variable multivariate power series. Fractional q powers and convergence are separate analytic inputs. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean) |
| `mathlib:UpperHalfPlane` | The upper half plane, on which the analytic theta and Siegel functions are defined before they are algebraised. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean) |
| `mathlib:ModularForm` | Modular forms of a given weight and level, the target of the dual exponential map of the third layer. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) |
| `mathlib:CuspForm` | Cusp forms, the eigenforms the whole construction is projected to. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean) |
| `mathlib:Units` | Units of a ring. A Siegel unit is a unit of the coordinate ring of an open modular curve, and the Beilinson element is a symbol of two of them. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Units/Defs.lean) |
| `mathlib:AlgebraicGeometry.Scheme` | Schemes, over which the modular curves Y(M, N) and their degeneracy maps live. The audit records that neither library has the modular curves as schemes with these maps. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean) |
| `mathlib:PadicInt` | The p-adic integers, the coefficients of the modular local system and of the integral zeta elements. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) |
| `mathlib:DirichletCharacter` | Dirichlet characters, the twists the interpolation formula runs over. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean) |
| `mathlib:LSeries` | The total tsum of the Dirichlet-series terms. Analytic continuation and modular nonvanishing are not supplied by this definition. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Basic.lean) |
| `mathlib:LinearMap` | Bundled semilinear maps; ordinary linear maps specialize the coefficient ring homomorphism to the identity. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/Defs.lean) |
| `mathlib:Submodule` | Additive submonoids stable under scalars, used for filtration steps, images and zeta spans. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean) |
| `mathlib:Submodule.span` | The smallest submodule containing a set; used for the submodule generated by actual zeta classes. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean) |
| `mathlib:Module.Dual` | The literal linear dual M→ₗ[R]R, valid over integral coefficient rings; it does not identify symmetric and divided-power lattices. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean) |
| `mathlib:Module.IsTorsion` | Every element is annihilated by some non-zero-divisor; appropriate to the complete semilocal cyclotomic algebra. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Torsion/Basic.lean) |
| `mathlib:Module.IsTorsionFree` | Scalar multiplication by a regular ring element is injective; no domain hypothesis is silently imposed. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Torsion/Free.lean) |
| `mathlib:Module.Finite` | The top submodule is generated by a finite set; over Z this expresses finite generation of an abelian group. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean) |
| `mathlib:Matrix.GeneralLinearGroup` | Units of the matrix ring, with matrix coefficients and a determinant homomorphism; used for the actual torsion-index action. | [Declaration source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) |

The scheme-level modular moduli, Cartier divisors, multiplication and Weil pairing belong to the upstream ModularCurves roadmap. ModularCurvesPartII supplies analytic/algebraic comparison, compactification, cusp charts and the additional correspondence generality. SchemeKTheoryOperations and K2SymbolsBrauer supply the unit-loop product, symbol, transfers and projection formula. MotivicEtaleKTheory supplies Chern/Kummer comparison and the requested archimedean regulator. These objects are imported, and this roadmap constructs their particular modular classes.

SelmerIwasawaCohomology supplies continuous cohomology, local conditions, Poitou–Tate and control. PadicMeasuresIwasawaAlgebras supplies completed group rings, torsion structure and characteristic ideals. PadicHodgeRegulators supplies dual exponentials, Iwasawa twists, vector regulators and Coleman maps. ModularSymbolsPadicLFunctions supplies modular-symbol realizations, period lines, rational Drinfeld–Manin splitting and analytic distributions. AutomorphicGaloisRepresentations supplies the eigenform representations and their local realizations. The ES.2 carrier, ES.4 finite-level bound and ES.8 Iwasawa bound enter directly; they are not routed through a cyclotomic-unit main-conjecture application.

## Public sources and access record

The locators below identify material read and the limits of verification. Mathematical results are stated in our own words in the node entries. Historical reading records remain distinct from this revision’s rechecks.

### p-adic Hodge theory and values of zeta functions of modular forms

Kazuya Kato. Asterisque 295 (2004), pp. 117-290; Numdam digitisation AST_2004__295__117_0 (inspected 2026-09-15). [Public text](https://www.numdam.org/item/AST_2004__295__117_0.pdf), accessed 2026-10-08.

SHA-256: `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.

- Introduction, pp. 118-119 (statement of the main theorems)
- Chapter I, Sec. 1 'Siegel units', pp. 121-124 (1.1-1.10 in full, including the proof of Prop. 1.3 in 1.10)
- Chapter I, Sec. 2 'Euler systems in K2 of modular curves', pp. 125-133 (2.1-2.8 and the proofs 2.11-2.13; 2.9-2.10 skimmed for the definition of T'(n) and of the regulator)
- Chapter II, Sec. 8 'Definitions of p-adic Euler systems', pp. 180-185 (8.1-8.9, including the proof of Lemma 8.5)
- Chapter II, Sec. 9 'Relation with Euler systems in the spaces of modular forms', pp. 186-189 (9.1-9.7)
- Chapter II, Sec. 10, p. 189 (opening paragraph only: the attribution of Thm. 9.5 to the generalized explicit reciprocity law of [KK3])
- Chapter III, Sec. 12 'The main conjecture, I', pp. 219-224 (12.1-12.10)
- Chapter III, Sec. 13 'The method of Euler systems', pp. 224-227 (13.1-13.7)
- Chapter IV, Sec. 17 'The main conjecture, II', pp. 272-274 (17.1-17.5)
- Page-image verification: printed pp. 124, 163, 184, 187, 221, 224–225 and 269. The text layer is not the authority for the displays.
- Sections 6.3–6.6: Hecke quotient, period map and dual form; Sections 13.5–13.8: analytic nonvanishing and the non-CM use of 12.8.2; Sections 16.1–16.6: scalar regulator and small-slope interpolation. Sections 7, 10–11 read at their reduction statements and key compatibility passages, not a full verification of all underlying proofs.
- §§15.12–15.17: the CM induction, elliptic-unit specialization, contained-cyclotomic variant, and separate derivations of 12.4 and 12.5(3). The early elliptic-unit theorem and exact all-prime exceptional branch remain a supplier gap.
- Additional page-image verification: pp.142–143, the explicit Eisenstein-product definition, weight-two regularization and piecewise smoothing exponents of 4.2.4; compared again with 6.6 on p.163.
- Independent review: all forty node locators and mathematical statements collated, including §§13.9–13.14 and 17.11–17.13. Further page-image checks: pp.126, 131–132, 141, 222, 227, 234, 273–274. Full [KK3] and the unstaged all-prime CM supplier proofs remain unverified.
- Revision 2, 8 October 2026: rechecked §§1.3/1.7/1.9, 2.3/2.4/2.6/2.12, 8.5, 9.5, 12.4/12.6, 13.8–13.12 and 15.13–15.16 for the repaired signatures. Page images pp.124,222,273 rechecked. These are statement and proof-interface checks, not complete proof closure of [KK3] or the CM supplier.

### Euler systems (author's course draft of the Annals of Mathematics Studies 147 monograph)

Karl Rubin. Public author draft distributed with the 1999 Arizona Winter School notes; inspected independently 6 October 2026. No line-by-line collation with the published AMS 147 book is claimed.. [Public text](https://swc-math.github.io/notes/files/99RubinES.pdf), accessed 2026-10-08.

SHA-256: `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.

- Table of contents, pp. iii-iv
- Chapter II, Sec. 2 'Results over K', pp. 23-26 (Hyp(K,T)/Hyp(K,V), Def. 2.1, Thms. 2.2, 2.3, 2.10 with its proof, Remarks 2.4-2.13)
- Chapter II, Sec. 3 'Results over K_infinity', pp. 26-29 (Hyp(K_infinity/K), Hyp(K_infinity,T), Hyp(K_infinity,V), Def. 3.1, Thms. 3.2, 3.3, 3.4, Prop. 3.7)
- Chapter III §5, pp. 47–54: the elliptic-curve application, including Props. 5.1, 5.8, 5.14(b), Cors. 5.6, 5.17, 5.18, and their proofs. The public draft is the source read, not the unavailable Festschrift article.
- Revision 2, 8 October 2026: rechecked III.5.1–5.6 and III.5.14–5.18 for the local lattice, period, uniform descent, Coleman and no-finite-submodule interfaces; reproduced the GL₂(Z/4) countercheck for the III.5.8 dyadic vanishing claim.

### Zeta morphisms for rank two universal deformations

Kentaro Nakamura. Inventiones Mathematicae 234 (2023), 171–290; published PDF, DOI 10.1007/s00222-023-01203-7. [Public text](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf), accessed 2026-10-08.

SHA-256: `47682f856244439d8cc3d3e6e0a4e1f804e6a710ec1a2dde8fad76f94aea20e4`.

- §3.1–3.2, especially Lemma 3.1, Theorem 3.2, Lemma 3.4 and Corollary 3.6, pp. 204–222; Appendix A, pp. 265–269. Universal deformation constructions in §4 are outside this packet.
- Independent review: §2.3 Lemma 2.10 (completed Borel–Moore to classical coefficients), §3.1.2 pp.205–206 (literal dual lattice), §3.1.3–3.2 and Appendix A displays checked against page images.
- §5.1, Theorem 5.2 pp.253–254 checked separately: odd p, residual absolute irreducibility and free rank-one τ quotient. Its two erroneous cross-reference indices are recorded in E10.
- Revision 2, 8 October 2026: rechecked §3.1.2–3.1.3 and Appendix A, pp.205–207 and 265–268, for literal duals, rational central operators, smoothing and Γ₁ Poincaré transport; rechecked the p.254 image for the cross-reference corrections.

### A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin

Ashay A. Burungale and Ye Tian. arXiv:2506.03465v2, 11 October 2025 (7 pages), author version of Annals of Mathematics 203 (2026), 1–14. [Public text](https://arxiv.org/pdf/2506.03465v2), accessed 2026-10-08.

SHA-256: `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.

- §2.2, Theorems 2.3–2.4 and Remark 2.5; §3.1 sign specialization. Annals publication metadata checked; no claim of line-by-line collation with the publisher PDF. The CM equality is a supplier result, not an L4 endpoint.
- Revision 2, 8 October 2026: rechecked Theorems 2.3–2.4 and the §3.1 specialization argument in arXiv v2; rational input includes p=2. No publisher collation is claimed.

## Layer coverage

| Stage | Nodes | Planets | Status |
| --- | ---: | ---: | --- |
| `KatoEulerSystems:L0` | 5 | 2 | planned |
| `KatoEulerSystems:L1` | 6 | 4 | planned |
| `KatoEulerSystems:L2` | 8 | 6 | planned |
| `KatoEulerSystems:L3` | 10 | 6 | planned |
| `KatoEulerSystems:L4` | 11 | 5 | planned |

Layer numbers do not impose a proof order. The internal node dependencies are acyclic: the rational map uses the rational Iwasawa structure input before the divisibility applications. The CM structure supplier must precede that map and must not derive it from a main-conjecture equality involving the same map.

## L0: Siegel units

The normalization of the theta unit supplies an actual integral unit before rationalization. Its uniqueness uses multipliers 2 and 3, so the coprimality with 6 is part of the definition. The existence argument fixes the divisor by pushforward, identifies its degree-zero Picard class with an elliptic point, and normalizes a local rational function by the commuting norms. Torsion pullback gives the Siegel units. Distribution follows from isogeny norms, while degeneracy products require the two-index level comparison and transfers.

The analytic q-product is a comparison with this algebraic construction. Fractional powers use the branch fixed by τ, and orders at a cusp are measured in its width parameter. The exponent B₂(a/N)/2 distinguishes the corrected product from the published missing square. Auxiliary-independent rational units are not the same objects as the c-normalized integral units.

### The c-normalised theta function of an elliptic curve

Node `KatoEulerSystems:L0/theta-function-c-normalised`; construction; proposed declaration `cTheta`. Implementation status: **unchecked**.

Atlas planet: **The c-normalised theta function**.

For an elliptic curve E over a scheme S and an integer c prime to 6 there is a unique unit c-theta_E in O(E \ E[c])^x such that (i) its divisor is c^2*(0) - E[c], where (0) is the zero section and E[c] = Ker(c: E -> E), both taken as Cartier divisors on E, and (ii) N_a(c-theta_E) = c-theta_E for every integer a prime to c, N_a being the norm along multiplication by a. It satisfies the c,d-compatibility of Prop. 1.3(2), the analytic q-product formula of Prop. 1.3(3), and is preserved by the norm along any isogeny of degree prime to c (Prop. 1.3(4)). Here c≥2; the open complement and finite locally free norm are understood scheme-theoretically.

Hypotheses and domain:

- E is an elliptic curve over an arbitrary base scheme S (no smoothness or affineness assumption beyond that of an elliptic curve)
- c is an integer prime to 6; the exclusion of 2 and 3 is used twice in the proof (a = 2 and a = 3 are the auxiliary multipliers)
- E[c] and c^2*(0) are taken as Cartier divisors, so the divisor condition is an equality of Cartier divisors, not merely of cycle classes
- the norm maps N_a are those of the finite locally free map a: E \ E[ac] -> E \ E[c]

Construction or proof outline:

1. Uniqueness. If f, g both satisfy (i) and (ii) then g = u f with u in O(S)^x an invertible constant, because they have the same divisor. For a prime to c, N_a(u f) = u^{a^2} f since a: E -> E has degree a^2; hence u^{a^2 - 1} = 1. Taking a = 2 and a = 3 gives u^3 = 1 and u^8 = 1, hence u = 1.
2. Existence locally on S. D=c²[0]−E[c] has degree zero. Multiplication by a prime to c fixes its divisor PUSHFORWARD a_*D=D: it fixes the zero section and permutes E[c]. Under Pic⁰(E/S)≅E, a_* acts as [a], so [a]x=x; a=2 gives x=0. Abel/Picard duality makes D principal. The norm identity div(N_a f)=a_*div(f) gives N_a f=u_a f. Pullback is not used here.
3. Normalisation of the local solution. A local f with divisor c^2*(0) - E[c] satisfies N_a(f) = u_a f for constants u_a, since N_a(f) has the same divisor. Commutativity N_a N_b = N_b N_a gives u_b^{a^2-1} = u_a^{b^2-1}. Rescaling f by the explicit monomial in u_2, u_3 exhibited in 1.10 produces g with N_a(g) = g for all a prime to c, i.e. (i) and (ii).
4. Globalisation. Uniqueness makes the local solutions glue, giving c-theta_E over S.
5. Part (2) (the c,d-compatibility) and part (4) are proved by the same 'same divisor + invariance under N_2 and N_3 forces the ratio to be 1' argument: the ratio u of the two sides satisfies u^4 = u and u^9 = u, hence u = 1.

Direct prerequisites: `mathlib:Units`, `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`, `tauceti:TauCetiRoadmap/ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree`, `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`.

Uses determining the API:

- `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`: Pull back the theta unit along nonzero torsion sections.
- `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`: The isogeny norm proves distribution.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `cTheta` | constructor | The unique unit with divisor c²[0]−E[c] and all prime-to-c multiplication norms fixed. |
| `cTheta_divisor` | characterisation | div(cTheta c)=c²[0]−E[c]. |
| `cTheta_norm` | compatibility | N_a(cTheta c)=cTheta c for (a,c)=1. |
| `cTheta_unique` | extensionality | A unit with the same divisor and norm invariance is cTheta c. |
| `cTheta_isogeny` | functoriality | For an isogeny E→E′ of degree prime to c, its norm sends cTheta_E c to cTheta_E′ c. |
| `cTheta_auxiliary` | relation | On E\E[cd], cTheta_c^(d²)/[d]*cTheta_c = cTheta_d^(c²)/[c]*cTheta_d (Kato 1.3(2)); common divisor and norm conditions characterize the two expressions. |
| `cTheta_baseChange` | functoriality | Base change of the elliptic curve pulls back the normalized theta unit, by the divisor and multiplication-norm characterization. |

Unit tests (suggested `example` signatures with admitted proofs):

- `theta_divisor` (characterisation): For c=5 its divisor is 25[0]−E[5].
- `theta_norm_two` (compatibility): N₂(cTheta 5)=cTheta 5.
- `theta_pushforward_not_pullback` (non-example): For c=5,a=2 the pulled-back divisor is 25 E[2]−E[10], not 25[0]−E[5].

Acceptance checks:

- For c=5,a=2, a_*D=D while a^*D=25 E[2]−E[10], with extra 10-torsion support.
- The ratio of two solutions satisfies u³=u⁸=1 and hence u=1; coprimality with 6 permits both multipliers.
- The local normalization is u₂^(−3)u₃ f, as in the displayed proof of 1.10.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, Prop. 1.3(1), printed p. 121: The unique unit is characterized by its Cartier divisor c²[0]−E[c] and invariance under every prime-to-c multiplication norm.
- `kato-2004-asterisque-295`, Chapter I, 1.10 (proof of Prop. 1.3(1)), printed p. 124: The norm of a constant scales by the degree a², so the ratio of normalized solutions has both cube and eighth power equal to one. This supports uniqueness and the coprimality with 6.
- `kato-2004-asterisque-295`, Chapter I, 1.10 (existence), printed p. 124: Confirms that the existence proof runs through Abel's theorem and the degree-0 class, as recorded in the second proofStep.

### Siegel units on Y(N) and their c-independent rationalisation

Node `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`; construction; proposed declaration `siegelUnit`. Implementation status: **unchecked**.

Atlas planet: **Siegel units**.

Let N >= 3 and let E be the universal elliptic curve on the modular curve Y(N) over Z[1/N], with generic fiber over Q (the fine moduli of (E,e_1,e_2) with (e_1,e_2) a Z/N-basis of E[N]). For (alpha,beta) in (Q/Z)^2 \ {(0,0)} with N*alpha = N*beta = 0, write (alpha,beta) = (a/N,b/N) and let iota_{alpha,beta} = a*e_1 + b*e_2 : Y(N) -> E \ E[c]. The Siegel unit is c-g_{alpha,beta} = iota_{alpha,beta}^*(c-theta_E) in O(Y(N))^x, defined whenever c is prime to 6 and to the orders of alpha and beta. Choosing c with (c,6)=1 and c = 1 mod N, the element g_{alpha,beta} = (c-g_{alpha,beta})^{1/(c^2-1)} in O(Y(N))^x tensor Q is independent of that choice, and for every c with (c,6N)=1 one has c-g_{alpha,beta} = (g_{alpha,beta})^{c^2} * (g_{c*alpha,c*beta})^{-1} in O(Y(N))^x tensor Q. The two families are compatible with the inclusions O(Y(N)) into O(Y(N')) for N | N', so they define elements of the direct limits.

Hypotheses and domain:

- N≥3, so the integral full-level fine moduli scheme over Z[1/N] has its universal curve. Its connected generic component with chosen Weil pairing has constant field Q(ζ_N); the total full-level moduli must keep the determinant Galois action. No geometrically connected Q-component is silently substituted.
- (alpha,beta) is not (0,0), and c is prime to 6 and to the orders of alpha and beta; this is exactly what makes the image of a*e_1 + b*e_2 disjoint from E[c], so that the pullback is defined
- the rationalisation inverts c^2 - 1, so it lives in O(Y(N))^x tensor Q and not in O(Y(N))^x; only c-g_{alpha,beta} is an honest unit

Construction or proof outline:

1. Pull back c-theta_E along the section iota_{alpha,beta}; the section misses E[c] by the coprimality hypothesis on c, so the pullback of a unit on E \ E[c] is a unit on Y(N).
2. Prop. 1.3(2) (the c,d-compatibility of the theta functions) gives the displayed relation between c-g and g, and hence that (c-g_{alpha,beta})^{1/(c^2-1)} does not depend on the choice of c with c = 1 mod N.
3. Independence of N: the elements are compatible under the finite etale transition maps Y(N') -> Y(N), which on moduli send (E,e_1,e_2) to (E,(N'/N)e_1,(N'/N)e_2).

Direct prerequisites: `KatoEulerSystems:L0/theta-function-c-normalised`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.6`.

Uses determining the API:

- `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`: These two actual units are the entries of the K₂ symbol.
- `EllipticRegulators:ER.7`: Supplies Siegel units; the common symbol/regulator machinery remains imported.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `siegelUnit` | constructor | c-g_{α,β} is the torsion-section pullback of cTheta, on the integral fine curve after inverting the torsion order. |
| `siegelUnit_pullback` | characterisation | Its pullback formula is ι_{α,β}^*(cTheta c). |
| `siegelUnit_smoothing` | relation | In rationalized units, [c-g_{α,β}]=c²[g_{α,β}]−[g_{cα,cβ}]. |
| `siegelUnit_auxiliary` | compatibility | If c≡1 mod the order, [c-g]=(c²−1)[g]; changing c gives the same rational g. |
| `siegelUnit_level` | functoriality | Pullback along Y(N′)→Y(N), N\|N′, preserves the indexed unit. |

Unit tests (suggested `example` signatures with admitted proofs):

- `siegel_smoothing_five` (computation): If the torsion index is fixed by 5, [5-g]=24[g].
- `siegel_auxiliary_seven` (compatibility): If the index is fixed by both 5 and 7, 48[5-g]=24[7-g].
- `siegel_integral_not_equal` (non-example): For the nonzero rationalized value g=1 in Q, rationalSmoothing 5 g g differs from rationalSmoothing 7 g g; testing just the two coefficients would not exercise the smoothing construction.
- `siegel_identity_pullback` (compatibility): Pullback along the identity ring map sends the actual unit θ to θ, so a constant unit construction fails on θ≠1.

Acceptance checks:

- Verify that Q(zeta_N) sits in the constant field of Y(N) and that the complex embedding used in the cohomology construction is the one determined by the points nu(tau) for tau in the upper half plane, with zeta_N = exp(2*pi*i/N) (Kato 1.8).
- Use the q-product of 1.9 with the corrected leading exponent w=B₂(a/N)/2=1/12−a/(2N)+a²/(2N²). E1 is a confirmed missing-square misprint, repeated after 3.10 on p.141; at a=2,N=5 the exponent is −11/300 rather than −23/300. The nonconstant products also distinguish the rational Siegel unit from a root of unity.
- Verify that the descent to the algebraic curve is the pullback of c-theta_E and not an analytically defined function: the algebraic definition comes first, and 1.9 identifies the analytic pullback.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, 1.4, printed p. 122: Gives the definition of the Siegel unit as the pullback of c-theta_E along a*e_1 + b*e_2 and the exact reason the pullback is defined, as recorded in the hypotheses and the first proofStep.
- `kato-2004-asterisque-295`, Chapter I, 1.4, printed p. 122: Confirms the rationalisation, the exact congruence condition c = 1 mod N, and that independence is deduced from Prop. 1.3(2).
- `kato-2004-asterisque-295`, Chapter I, 1.1, printed p. 121: Supports the hypothesis that the base is a smooth affine curve over Q whose constant field is Q(zeta_N); this matters for the Hochschild-Serre step used in the cohomology construction in Sec. 8.4.
- `kato-2004-asterisque-295`, Chapter I, 1.9, printed p. 124 (read from a page rendering): The published leading exponent lacks the square in its last numerator. The theta-product and Bernoulli calculation determine the corrected exponent recorded in E1.

### GL_2(Z/N)-equivariance and the distribution relation for Siegel units

Node `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`; lemma; proposed declaration `siegelGaloisDistribution`. Implementation status: **unchecked**.

(1) For sigma in GL_2(Z/N) acting on Y(N) on the left by (E,e_1,e_2) -> (E, a*e_1 + c*e_2, b*e_1 + d*e_2), one has sigma^*(c-g_{alpha,beta}) = c-g_{alpha',beta'} and sigma^*(g_{alpha,beta}) = g_{alpha',beta'}, where (alpha',beta') = (alpha,beta)*sigma. The induced action on the total constant field sends a primitive N-th root of 1 to its det(sigma)-th power. (2) (Distribution property.) For (alpha,beta) in (Q/Z)^2 \ {(0,0)} and a nonzero integer a, c-g_{alpha,beta} = product over (alpha',beta') of c-g_{alpha',beta'}, the product being over all alpha' with a*alpha' = alpha and all beta' with a*beta' = beta, where c is an integer ≥2 prime to 6a and to the orders of alpha and beta; the same holds for g after tensoring with Q.

Hypotheses and domain:

- sigma acts on the left on Y(N) through its moduli description; the resulting action on the constant field Q(zeta_N) is by det, so equivariance statements must track the twisted Galois action on the constant field
- in (2) the auxiliary c must be prime to a as well as to 6 and to the orders of alpha and beta; this is stronger than the condition needed to define c-g_{alpha,beta} alone
- the product in (2) has a^2 factors (a choices of alpha' and a of beta') and is an identity in the direct limit over N of O(Y(N))^x

Construction or proof outline:

1. (1) is the pullback of the definition of c-g along the moduli action; Kato records it as proved easily.
2. (2) is deduced from the norm-invariance N_a(c-theta_E) = c-theta_E of Prop. 1.3(1)(ii): the fibre of multiplication by a over the section iota_{alpha,beta} is exactly the set of sections iota_{alpha',beta'} with a*alpha' = alpha, a*beta' = beta, so the norm computes the product.
3. The rationalised form follows by raising to the power 1/(c^2-1) inside O(Y(N))^x tensor Q.

Direct prerequisites: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `ModularCurvesPartII:R12.6`.

Acceptance checks:

- Check the determinant twist on constants: sigma^*(zeta_N) = zeta_N^{det(sigma)} is needed for the identification of Galois descent data on Y(M,N).
- Check that (2) degenerates correctly when a is prime to N, in which case the product has a^2 terms indexed by the a-torsion translates.
- Check that (2) is a distribution relation for the pair (alpha,beta) jointly and not separately in each coordinate.
- The suggested signature must retain an actual GL₂(Z/N) matrix, its row action on a pair of rational torsion indices, the determinant action on a root, and the joint multiplication fiber product; applying a linear map to an assumed sum is insufficient.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, Lemma 1.7(1)(2), printed p. 123: Gives the exact index set of the distribution product and the exact coprimality hypothesis on c, both recorded in the statement and hypotheses.
- `kato-2004-asterisque-295`, Chapter I, after Lemma 1.7, printed p. 123: States the proof route: (2) comes from the norm-invariance property (ii) of c-theta_E, as recorded in the second proofStep.
- `kato-2004-asterisque-295`, Chapter I, 1.6, printed p. 123: Confirms the determinant twist on the constant field recorded in the statement.

### Degeneracy-map product formula for Siegel units (Kato Lemma 2.12)

Node `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula`; lemma; proposed declaration `siegelDegeneracyProduct`. Implementation status: **unchecked**.

Let (alpha,beta) in (Q/Z)^2 \ {(0,0)}, let A >= 1 and let c be prime to 6A and to the orders of alpha and beta. Then phi_A^*(c-g_{alpha,beta}) = product over beta' with A*beta' = beta of c-g_{alpha,beta'}; equivalently, as functions on the upper half plane, c-g_{alpha,beta}(A*tau) = product over those beta' of c-g_{alpha,beta'}(tau). This is the one-sided (second-coordinate only) degeneracy relation, distinct from the two-sided distribution relation of Lemma 1.7(2).

Hypotheses and domain:

- A >= 1 arbitrary (not necessarily prime, and not necessarily prime to the level)
- c prime to 6A and to the orders of alpha and beta; the extra divisibility condition (c,A)=1 is what makes both sides defined
- phi_A is the degeneracy map induced by tau -> A*tau on the analytic model; the identity is asserted as an identity of functions on the upper half plane

Construction or proof outline:

1. Kato proves the lemma from the analytic presentation of Prop. 1.3(3): substituting q -> q^A in the q-product for c-theta and regrouping the factors gives the product over the A-division points of beta in the second coordinate only.
2. The first coordinate alpha is unchanged because the degeneracy map multiplies only the lattice parameter tau, not the point alpha*tau + beta in its first coordinate.

Direct prerequisites: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R14.1`.

Acceptance checks:

- Check that the product has exactly A factors, in contrast with the a^2 factors of Lemma 1.7(2).
- Check the identity on leading q-exponents: the exponent i_0 of 1.9 must add up correctly over the A choices of beta'.
- Check that the lemma really is used for both the ell-divides-N and ell-does-not-divide-N branches of Prop. 2.4 (Kato's 2.13, Steps 1 and 2).
- The suggested signature must assert pullback of the indexed unit equals the product over A-division points of beta, with alpha fixed.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, Lemma 2.12, printed p. 131: Gives the exact hypotheses (c prime to 6A and to the orders) and the exact one-sided index set, as recorded in the statement.
- `kato-2004-asterisque-295`, Chapter I, after Lemma 2.12, printed p. 131: Records that the proof route is the q-product of Prop. 1.3(3), as in the first proofStep.

### The product, cusp orders and arithmetic descent

Node `KatoEulerSystems:L0/analytic-product-cusp-divisor-and-integrality`; lemma; proposed declaration `siegelAnalyticProduct`. Implementation status: **unchecked**.

Write q=e^(2πiτ), ζ_N=e^(2πi/N), 0≤a<N, and (a,b)≠(0,0) mod N. The analytic representative of rational g_{a/N,b/N} is q^(B₂(a/N)/2) ∏_{n≥0}(1−q^(n+a/N)ζ_N^b) ∏_{n>0}(1−q^(n−a/N)ζ_N^(−b)), with B₂(x)=x²−x+1/6. The c-normalized unit is its smoothing g_{α,β}^{c²}/g_{cα,cβ}. Its transformation is the torsion-index action, with the determinant acting on ζ_N. At a cusp represented by γ its order in the width-N parameter q^(1/N) is N/2 times the corresponding smoothed B₂ value. The unsmoothed g lies in units tensor Q, whereas c-g is an actual unit on Y(N) over Z[1/N] for (c,6N)=1; its algebraic pullback and q-product agree on the chosen complex component.

Hypotheses and domain:

- N≥3; c prime to 6N; the selected full-level component has the specified Weil pairing ζ_N.
- The Bernoulli exponent corrects the missing square in 1.9 (source issue E1). Fractional q powers are analytic functions with the branch fixed by τ, not elements of ordinary PowerSeries without a changed parameter.

Construction or proof outline:

1. Use Prop. 1.3(3) to compute the theta product; substitute the torsion point ατ+β in 1.9.
2. Apply Lemma 1.7 for transformed indices and choose the cusp parameter supplied by the modular-curve comparison. Orders are the leading exponents after multiplying by the width.
3. The scheme-theoretic construction of cTheta and its torsion pullback give integrality and algebraic descent, rather than inferring integrality from a complex product.

Direct prerequisites: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`, `mathlib:UpperHalfPlane`, `mathlib:PowerSeries`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R12.3`.

Acceptance checks:

- At a/N=0, w=1/12; at a/N=1/2, w=−1/24.
- For a=2,N=5 the correct w=−11/300 differs from the printed −23/300.
- Cusp orders use the cusp width, and the zero torsion section is excluded.
- The suggested signature must retain the exponential branch, two infinite products, smoothing of an actual algebraic unit and cusp-width order, as well as the corrected Bernoulli exponent. The product is not encoded as an ordinary power series in q.

Source correspondence:

- `kato-2004-asterisque-295`, 1.3(3), 1.4, 1.8–1.9, pp.121–124: The product, branch and algebraic unit construction supply the analytic and arithmetic targets; E1 corrects w.

## L1: Symbols and regulators

The unit-loop product defines the element in scheme K₂ on Y(M,N). Its transfer formulas are instances of the imported projection formula, and its auxiliary-prime factor is produced by the Siegel degeneracy product. Keeping the order of the two units fixes the sign of the Kummer cup. The Chern convention is compared explicitly, and smoothing remains visible until rationalization.

The moment map multiplies by the integral tensor monomial, traces through the finite cyclotomic curve and uses the Hochschild–Serre edge map. Its coefficient, trace and Hecke compatibility follow from the imported operations, with the resulting target twist checked in weights two and four. A rational Kuga–Sato projector is a comparison tool with denominators, not an integral substitute for this monomial.

### The Beilinson zeta element in K_2(Y(M,N))

Node `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`; construction; proposed declaration `beilinsonElement`. Implementation status: **unchecked**.

Atlas planet: **Beilinson zeta element in K_2**.

For M, N >= 2 with M + N >= 5, let Y(M,N) be the quotient of Y(L), for any L >= 3 with M | L and N | L, by the subgroup G of GL_2(Z/L) of matrices (a b; c d) with a = 1 mod M, b = 0 mod M, c = 0 mod N and d = 1 mod N (the definition is independent of L, Y(N,N) = Y(N) for N >= 3, and X(M,N) denotes the smooth compactification); for M + N >= 5 it represents triples (E,e_1,e_2) with M*e_1 = N*e_2 = 0 and Z/M x Z/N -> E, (a,b) -> a*e_1 + b*e_2, injective. For integers c, d with (c,6M) = 1 and (d,6N) = 1, the Beilinson (zeta) element is the Steinberg symbol c,d-z_{M,N} = {c-g_{1/M,0}, d-g_{0,1/N}} in K_2(Y(M,N)). Its rationalised form is z_{M,N} = {g_{1/M,0}, g_{0,1/N}} in K_2(Y(M,N)) tensor Q, and c,d-z_{M,N} = (c^2 - <c,1>^*)(d^2 - <1,d>^*) z_{M,N} in K_2(Y(M,N)) tensor Q, where <a,b>^* is the pullback by the diamond action (E,e_1,e_2) -> (E,a*e_1,b*e_2).

Hypotheses and domain:

- M, N >= 2 and M + N >= 5 (assumed throughout Sec. 2 except in 2.8); the moduli interpretation fails below this bound
- (c,6M) = 1 and (d,6N) = 1: two separate auxiliary integers, one for each factor of the symbol, with coprimality to the respective level
- c-g_{1/M,0} lies in O(Y(M,1))^x and d-g_{0,1/N} in O(Y(1,N))^x by Lemma 1.7(1); the symbol is formed after pulling both back to Y(M,N)
- the rationalised z_{M,N} lies only in K_2 tensor Q, because both Siegel units were rationalised

Construction or proof outline:

1. Pull back c-g_{1/M,0} from Y(M,1) and d-g_{0,1/N} from Y(1,N) to Y(M,N); Lemma 1.7(1) is what identifies the level at which each unit is already defined.
2. Form the Steinberg symbol of the two units in K_2 of the affine curve Y(M,N).
3. The comparison with the rationalised element follows from the c-dependence relation of 1.4 applied in each slot separately, producing the two commuting Euler-type operators (c^2 - <c,1>^*) and (d^2 - <1,d>^*).

Direct prerequisites: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `K2SymbolsBrauer:T.2/steinberg-symbol`, `SchemeKTheoryOperations:S.2/tensor-product-pairings`, `SchemeKTheoryOperations:S.3/unit-loop-class`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `ModularCurvesPartII:R12.2`, `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`.

Uses determining the API:

- `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`: The regulator acts on this actual symbol.
- `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`: The tower consists of these symbols.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `beilinsonElement` | constructor | The product of the two K₁ unit classes, with first entry c-g_{1/M,0} and second entry d-g_{0,1/N}. |
| `beilinsonElement_symbol` | characterisation | c,d-z={c-g_{1/M,0},d-g_{0,1/N}} in scheme K₂. |
| `beilinsonElement_smoothing` | relation | Rationally c,d-z=(c²−⟨c,1⟩*)(d²−⟨1,d⟩*)z. |
| `beilinsonElement_pullback` | functoriality | Pullback takes this symbol to the symbol of the pulled-back indexed units. |
| `beilinsonElement_bilinear` | structure | The Beilinson symbol is additive in both unit slots under multiplicative products; expand {uu′,vv′} into its four symbols. |

Unit tests (suggested `example` signatures with admitted proofs):

- `beilinson_order` (characterisation): The Chern image is Kummer(c-g_{1/M,0}) cup Kummer(d-g_{0,1/N}), in that order.
- `beilinson_identity_entry` (degenerate): If either unit entry is 1, the symbol is zero.
- `beilinson_bilinearity` (compatibility): Replacing the first unit by u*u′ gives the sum of the two symbols.

Acceptance checks:

- Check that the element is genuinely a symbol of two units on the same affine curve, so that no localisation or relative K-theory is needed at this stage.
- Check that the two auxiliary smoothing operators commute and that each is invertible after inverting a single explicitly named integer, so that the passage between c,d-z and z is a controlled denominator and not an unrecorded rationalisation.
- Check the M + N >= 5 boundary: for (M,N) = (1,N) or (M,1) the moduli description of 2.1 is not asserted, and Kato treats those levels through 2.8 only.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, 2.2, printed p. 126: Gives the definition of the Beilinson element as a Steinberg symbol, the exact coprimality hypotheses on c and d, and the observation (via Lemma 1.7(1)) that each factor is already defined at a smaller level.
- `kato-2004-asterisque-295`, Chapter I, 2.1, printed pp. 125-126: Fixes the moduli interpretation and the exact M + N >= 5 hypothesis recorded in the statement and hypotheses.
- `kato-2004-asterisque-295`, Chapter I, 2.1, printed p. 126: Confirms that the standing hypotheses of Sec. 2 are M,N >= 2 and M+N >= 5.
- `kato-2004-asterisque-295`, Chapter I, 2.1, printed p. 125 (read from a page rendering): Gives the explicit congruence subgroup defining Y(M,N), which the node had paraphrased loosely.

### Projection formula for K_2-norms and the level-change norm relation

Node `KatoEulerSystems:L1/K2-norm-projection-formula-and-level-norm-relation`; theorem; proposed declaration `k2NormProjection`. Implementation status: **unchecked**.

Atlas planet: **Level-change norm relation**.

Under M,N≥2 and M+N≥5, let M | M', N | N' with M', N' >= 2, and assume prime(M) = prime(M') and prime(N) = prime(N'). Then the norm homomorphism K_2(Y(M',N')) -> K_2(Y(M,N)) sends c,d-z_{M',N'} to c,d-z_{M,N} for all c, d with (c,6M) = 1 and (d,6N) = 1 -- the coprimality is imposed at the LOWER level as printed, which under prime(M) = prime(M') and prime(N) = prime(N') is the same condition as at the higher level; after tensoring with Q it sends z_{M',N'} to z_{M,N}. The proof rests on the projection formula for the K_2-norm along a finite locally free morphism f: U -> V, namely f_*({u, f^*v}) = {f_*u, v} for u in O(U)^x and v in O(V)^x.

Hypotheses and domain:

- Standing §2 hypotheses: M,N≥2 and M+N≥5 (hence also M′,N′≥2 and M′+N′≥5). Proposition 2.3 does not remove the lower-level fine-moduli condition.
- prime(M) = prime(M') and prime(N) = prime(N') -- equality of the sets of prime divisors, not merely divisibility; this is used to choose coset representatives of the shape (1 + M*u, M*v; 0, 1)
- M', N' >= 2; the coprimality hypotheses are printed as (c,6M) = 1 and (d,6N) = 1, at the lower level, and are equivalent to the same conditions at M', N' precisely because the prime sets agree
- the norm is the K_2 transfer along the finite locally free covering Y(M',N') -> Y(M,N)

Construction or proof outline:

1. By the projection formula for the K_2-norm, the general case reduces to the two separate cases M' = M and N' = N, which are symmetric; Kato treats N = N'.
2. For N = N', the task becomes the O^x-norm computation: show that N: O(Y(M',N))^x -> O(Y(M,N))^x sends c-g_{1/M',0} to c-g_{1/M,0}.
3. Choose L >= 3 with M' | L and N | L, set a = M'/M, and pick for each (x,y) in (Z/a)^2 an element s_{x,y} of GL_2(Z/L) of the shape (1 + M*u, M*v; 0, 1) with u = x and v = y mod a. Kato notes that this is possible exactly because prime(M') = prime(M).
4. These s_{x,y} form a system of representatives for H \ G, where G and H are the subgroups of GL_2(Z/L) cutting out Y(M,N) and Y(M',N). Hence the norm is the product of the s_{x,y}^*-translates.
5. Lemma 1.7(1) identifies each translate as c-g_{(1/M') + (x/a), y/a}, and Lemma 1.7(2) (distribution for the integer a) collapses the product to c-g_{1/M,0}.

Direct prerequisites: `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`, `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`, `SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer`, `SchemeKTheoryOperations:S.2/projection-formula`.

Acceptance checks:

- Check that dropping prime(M) = prime(M') to mere divisibility breaks the argument at the coset-representative step, so the hypothesis is not cosmetic.
- Check that the projection formula is applied with one unit pulled back from the base -- i.e. that the reduction to the two one-sided cases is legitimate.
- Check compatibility of the two reductions (M' = M then N' = N) with the diamond operators, so that no residual <a,b>^* appears.
- The suggested signature must conclude transfer(z at M′,N′)=z at M,N under divisibility and equal prime sets, in addition to the imported symbol projection formula.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, Prop. 2.3, printed p. 126: Gives the exact hypothesis prime(M) = prime(M') and the exact conclusion, as recorded in the statement.
- `kato-2004-asterisque-295`, Chapter I, 2.11, printed p. 131: Confirms the projection formula and the reduction to the two one-sided cases, as in the first proofStep.
- `kato-2004-asterisque-295`, Chapter I, 2.11, printed p. 131: This is the exact point at which the hypothesis prime(M') = prime(M) is used, as recorded in the third proofStep.

### Auxiliary-prime norm relation with the dual-Hecke Euler factor

Node `KatoEulerSystems:L1/euler-factor-norm-relation-at-auxiliary-primes`; theorem; proposed declaration `k2AuxiliaryEulerFactor`. Implementation status: **unchecked**.

Atlas planet: **Euler-factor norm relation**.

Let ell be a prime not dividing M, and let c, d be integers with (c,6*M*ell) = 1 and (d,6*N*ell) = 1. Then the norm homomorphism K_2(Y(M*ell,N*ell)) -> K_2(Y(M,N)) sends c,d-z_{M*ell,N*ell} to the value on c,d-z_{M,N} of the ell-Euler factor of the operator-valued zeta function Z_{M,N}(s) of 2.5: the three-term operator (1 - T'(ell)<1/ell,1>^* + <1/ell,1/ell>^* . ell) when ell does not divide N, and the two-term operator (1 - T'(ell)<1/ell,1>^*) when ell divides N. The factor multiplying the quadratic term is exactly ell (read from a rendering of printed p. 126, the text layer having dropped it); it is the value at s = 0 of the term ell^{1-2s} in the Euler factor of Z_{M,N}(s) recorded in 2.5. The same holds for z_{M,N} after tensoring with Q. Here T'(ell) is the dual Hecke operator of 2.9 and <a,b>^* the diamond pullback.

Hypotheses and domain:

- ell is a prime not dividing M; ell is allowed to divide N, and the two cases give genuinely different Euler factors (three-term versus two-term)
- (c, 6*M*ell) = 1 and (d, 6*N*ell) = 1: the auxiliary integers must be coprime to ell as well
- the operator is written in terms of the dual Hecke operator T'(ell) and the diamond pullbacks, acting on K_2 of the lower-level curve; this is the Tate-dual normalisation, not the naive Hecke normalisation

Construction or proof outline:

1. Factor the covering Y(M*ell,N*ell) -> Y(M,N) into Y(M*ell,N*ell) -> Y(M,N*ell) -> Y(M,N(ell)) -> Y(M,N), and let G_0 in G_1 in G_2 in G_3 be the corresponding subgroups of GL_2(Z/(L*ell)).
2. Step 1: for G_0 \ G_1, choose representatives s_{x,y} = (u, v; 0, 1) with u = 1, v = 0 mod M and u = M*x, v = M*y mod ell, indexed by (x,y) in (Z/ell)^x x Z/ell. The norm of c-g_{1/(M*ell),0} is the product of the translates, which by Lemma 1.7(2) and Lemma 2.12 equals c-g_{1/M,0} times phi_ell^*(c-g_{alpha,0})^{-1}, where alpha is the unique element of (1/M)Z/Z with ell*alpha = 1/M.
3. Step 2: for G_1 \ G_2, choose representatives s_x = (u, ?; ?, ?) with u = 1 + N*x mod N*ell (when ell | N), resp. u = 1 mod N and u = N*x mod ell (when ell does not divide N), indexed by x in Z/ell resp. (Z/ell)^x. Lemma 2.12 again collapses the product of translates of d-g_{0,1/(N*ell)}.
4. Step 3: the remaining map K_2(Y(M,N(ell))) -> K_2(Y(M,N)) is handled by the two pushforward identities (2.13.1) and (2.13.2), whose proofs Kato gives in Step 4; these produce exactly the dual Hecke operator T'(ell) and the diamond terms.
5. Assembling the three steps gives the stated Euler-factor operator, matching the ell-factor of Z_{M,N}(s) recorded in 2.5.

Direct prerequisites: `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`, `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula`, `SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer`, `SchemeKTheoryOperations:S.2/projection-formula`, `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`, `ModularCurvesPartII:R14.1`.

Acceptance checks:

- Check that the ell-divides-N branch really loses the quadratic term, and that the resulting two-term factor is the one appearing in Z_{M,N}(s) for ell | N.
- Check the power of ell in the quadratic term: it is ell^1 here, ell^{1-2s} in Z_{M,N}(s) at 2.5, and p^{k-1-2r} in the p-adic analogue of Thm. 9.5 and Prop. 8.7(2). The three are consistent only after the moment map's twist (Lemma 8.8) is applied, which is the content of the link from the equivariance node.
- Check that T'(ell) is the dual Hecke operator of 2.9 and not T(ell): the norm relation is stated with the dual operator throughout, and the Euler system convention in Chapter III depends on this choice.
- Verify the three-step factorisation is a factorisation of the covering map and not of the moduli functor only.
- The suggested signature must conclude the two-index high-to-low transfer relation, retaining T′ composed with the first diamond and the quadratic diamond term exactly when ell does not divide N.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, Prop. 2.4, printed p. 126 (page image checked): Gives the two branches with their exact operators, including the factor ell in the quadratic term that the text layer drops, and the exact coprimality hypotheses. Transcribed in review from a rendering of p. 126.
- `kato-2004-asterisque-295`, Chapter I, 2.5, printed p. 127: Gives the three-case Euler factor of the operator-valued zeta function; the node identifies the norm relation of 2.4 with this Euler factor, and the three cases match 2.4's two branches plus the trivial case ell | M.
- `kato-2004-asterisque-295`, Chapter I, 2.13, printed pp. 131-132: Confirms the three-step factorisation recorded in the proofSteps.

### The etale Chern-character moment map Ch_{M,N}(k,r,r')

Node `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`; construction; proposed declaration `chernMoment`. Implementation status: **unchecked**.

Atlas planet: **Étale Chern moment map**.

Fix k >= 2 and integers r, r' with 1 <= r' <= k-1. Let H_p = R^1 lambda_*(Z_p) on Y(M,N)_et for the universal curve lambda, and let V_{k,Z_p}(Y(M,N)) = H^1(Y(M,N) tensor Qbar, Sym^{k-2}(H_p)), a Z_p-sheaf cohomology carrying a Gal(Qbar/Q)-action unramified outside p*M*N. There is a canonical homomorphism Ch_{M,N}(k,r,r') : lim_n K_2(Y(M*p^n, N*p^n)) -> H^1(Z[1/p], V_{k,Z_p}(Y(M,N))(k-r)), the inverse limit being along the norm maps, built as the composite of: (i) the etale Chern character K_2(X) -> H^2(X,(Z/p^n)(2)), which on symbols is {f,g} -> h(f) cup h(g) for h the Kummer connecting map; (ii) multiplication by e_{1,n}^{(r'-1)} tensor e_{2,n}^{(k-r'-1)} tensor (zeta_{p^n})^{(-r)} for the basis (e_{1,n},e_{2,n}) of T_pE/p^n over Y(M*p^n,N*p^n); (iii) the isomorphism Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(k-2) induced by the Poincare duality isomorphism T_pE = H_p(1); (iv) the trace map down to Y(M,N); (v) the edge map of the Hochschild-Serre spectral sequence E_2^{a,b} = H^a(Q, H^b(Y(M,N) tensor Qbar, -)).

Hypotheses and domain:

- p is invertible on the schemes involved; the Chern character is taken with (Z/p^n)(2)-coefficients and only afterwards passed to the limit
- 1 <= r' <= k-1 is required for the moment exponents r'-1 and k-r'-1 to be non-negative
- The equality T_pE=H_p(1) implies Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2). Together with Chern twist 2 and root exponent −r it gives k−r.
- the vanishing H^b(Y(M,N) tensor Qbar, -) = 0 for b >= 2 needed for the Hochschild-Serre edge map holds because Y(M,N) tensor Qbar is an affine curve over an algebraically closed field
- the landing in H^1(Z[1/p],-) rather than H^1(Q,-) requires the separate integrality input recorded in the sibling node

Construction or proof outline:

1. Apply the etale Chern character to the symbol c,d-z at level M*p^n, N*p^n, obtaining a class in H^2 with (Z/p^n)(2)-coefficients.
2. Multiply by the chosen moment monomial in the p^n-torsion basis and the p^n-th root of unity; this is the geometric moment map that converts a K_2 symbol into a Sym^{k-2}-valued class and simultaneously fixes the Tate twist.
3. Transport along Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(k-2) and push down by the trace along Y(M*p^n,N*p^n) -> Y(M,N).
4. Take the Hochschild-Serre edge map, legitimate because the geometric cohomology vanishes in degrees >= 2 for an affine curve; this converts an H^2 of the scheme into an H^1 of the Galois group with coefficients in the geometric H^1.
5. The source identity Sym^(k−2)(H_p)=Sym^(k−2)(T_pE)(2−k) is equivalently Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2). Adding the source Chern twist 2 and the root exponent −r gives 2−r+(k−2)=k−r.
6. Use the Hochschild–Serre edge map on the geometric H¹ summand, then Lemma 8.5 for the S-integral image; functoriality supplies coefficient change and moment compatibility.

Direct prerequisites: `KatoEulerSystems:L1/chern-symbol-normalization-and-denominators`, `KatoEulerSystems:L1/K2-norm-projection-formula-and-level-norm-relation`, `SelmerIwasawaCohomology:L0`, `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`, `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology`, `ModularCurvesPartII:R14.3`.

Uses determining the API:

- `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`: Apply Ch to the norm-compatible K₂ symbols.
- `Kato 8.8`: The explicit monomial supplies the Hecke/diamond scalars.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `chernMoment` | constructor | Trace and Hochschild–Serre applied to the Chern map multiplied by the moment monomial. |
| `chernMoment_factorization` | characterisation | Ch=edge ∘ trace ∘ moment ∘ chern on the norm-compatible tower. |
| `chernMoment_twist` | compatibility | The target twist is 2−r+(k−2)=k−r. |
| `chernMoment_coefficients` | functoriality | Reduction/extension of coefficients commutes with each map in the composite. |
| `chernMoment_ext` | extensionality | Two proposed moment maps agreeing on every source class are equal as linear maps; use the factorization to compare coefficient/trace constructions. |

Unit tests (suggested `example` signatures with admitted proofs):

- `moment_weight_two` (computation): At k=2,r=1 the target twist is 1.
- `moment_weight_four` (computation): At k=4,r=1 the target twist is 3, not −1.
- `moment_monomial_degree` (characterisation): For 1≤r′≤k−1, (r′−1)+(k−r′−1)=k−2.
- `moment_identity_maps` (computation): With all four supplied linear maps equal to id on Q, chernMoment sends 1 to 1, excluding a zero composite.

Acceptance checks:

- k=2,r=1 gives twist 1; k=4,r=1 gives twist 3.
- The exponents r′−1 and k−r′−1 sum to k−2; r′ lies between 1 and k−1.
- The moment maps commute with reduction modulo pⁿ, trace and the coefficient-ring maps; weight compatibility means moments of the same tower, not an identification of different representations.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter II, 8.4, printed pp. 182-183: Gives the five-step construction, the explicit moment monomial, and the Kummer/cup-product description of the Chern character, as recorded in the statement and proofSteps.
- `kato-2004-asterisque-295`, Chapter II, 8.4, printed p. 183: Confirms the Hochschild-Serre step and the exact reason for the degree vanishing, recorded as a hypothesis.
- `kato-2004-asterisque-295`, Chapter II, 8.4, printed p. 182: The Tate module equals geometric H¹ twisted by one. Taking the symmetric power contributes k−2 twists, so the moment target has twist 2−r+(k−2)=k−r.

### Hecke and diamond equivariance of Ch_{M,N}(k,r,r') (Kato Lemma 8.8)

Node `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`; lemma; proposed declaration `chernHeckeDiamond`. Implementation status: **unchecked**.

The homomorphism Ch_{M,N}(k,r,r') satisfies (1) T'(n) o Ch_{M,N}(k,r,r') = n^{r-1} * Ch_{M,N}(k,r,r') o T'(n) for every integer n prime to M*p, and (2) <a,b>^* o Ch_{M,N}(k,r,r') = a^{r'-1} * b^{k-r'-1} * (a*b)^{-r} * Ch_{M,N}(k,r,r') o <a,b>^* for all integers a, b with (a,M*p) = 1 and (b,N*p) = 1. These scalars are exactly the ones produced by the moment monomial and the Tate twist in the construction.

Hypotheses and domain:

- n prime to M*p in (1); a prime to M*p and b prime to N*p in (2)
- the operators on the two sides are the dual Hecke and diamond operators acting on K_2 (source) and on the Galois cohomology of the modular local system (target); the lemma is an intertwining relation with explicit scalars, not a commutation

Construction or proof outline:

1. The scalars arise from the transformation of the moment monomial e_1^{(r'-1)} tensor e_2^{(k-r'-1)} tensor zeta^{(-r)} under the diamond action on the p^n-torsion basis and under the twisting of the root of unity: e_1 -> a*e_1, e_2 -> b*e_2, zeta -> zeta^{a*b}.
2. Kato records the lemma as proved easily from the definition of Ch in 8.4.

Direct prerequisites: `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `ModularCurvesPartII:R14.1/diamond-operators`, `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`, `ModularCurvesPartII:R14.1`.

Acceptance checks:

- Check the exponent bookkeeping: setting a = b = n in (2) should be consistent with (1) via the relation between T'(n) and the diamond operators.
- Check that the scalars vanish no information when r' = k-1 (the case used in the reciprocity theorems 9.5-9.7).
- Check that this lemma, together with Props. 2.3 and 2.4, is exactly what yields the p-adic norm relations of Prop. 8.7, so that no additional geometric input enters at that point.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter II, Lemma 8.8, printed p. 185: Gives both intertwining relations with their exact scalars and coprimality hypotheses, and records that Kato treats the proof as immediate from the construction.

### The symbol-to-Kummer normalization

Node `KatoEulerSystems:L1/chern-symbol-normalization-and-denominators`; comparison; proposed declaration `chernSymbolNormalization`. Implementation status: **unchecked**.

Kato’s regulator on a degree-two symbol is {u,v}↦δ(u) cup δ(v) in H²_et(X,Z/pⁿ(2)). In the universal higher-Chern convention of MotivicEtaleKTheory:M.8/finite-etale-chern, c_(2,2)({u,v})=−δ(u) cup δ(v); thus the Kato map is −c_(2,2), or the weight-two Chern character ch_(2,2). No division by a factorial is needed at weight two. The passage to divided moments at higher weight uses integral symmetric tensors at finite coefficient level; any comparison with Scholl’s rational symmetric projector explicitly inverts its finite group order and is rational. Smoothing factors are retained before rationalizing.

Hypotheses and domain:

- X is the regular modular curve with p inverted for the finite étale regulator; n≥1.
- The order of the two entries and the cup-product sign are fixed.

Construction or proof outline:

1. Compare the diagonal formula in M.8 with Kato 8.4, whose h(u) cup h(v) fixes the sign.
2. Use imported product and transfer functoriality to commute Chern/Kummer with pullback and trace.
3. Separate the integral finite-level moment monomial from the rational Kuga–Sato projector; the latter is not an integral idempotent at arbitrary p.

Direct prerequisites: `MotivicEtaleKTheory:M.8/finite-etale-chern`, `MotivicEtaleKTheory:M.8/motivic-chern-character`, `MotivicEtaleKTheory:M.8/chern-functoriality`, `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`.

Acceptance checks:

- The degree-two sign is minus the supplier c_(2,2).
- Swapping u,v negates the cup in degree one.
- No claim of an integral Scholl projector at primes dividing its denominator.
- The suggested signature must state c_(2,2)(symbol)=−cup and ch_(2,2)(symbol)=cup on the ordered pair, with no weight-two factorial denominator.

Source correspondence:

- `kato-2004-asterisque-295`, 8.4, pp.182–183: The displayed map on symbols is the Kummer cup; it must be reconciled with the supplier Chern convention.

## L2: Global zeta classes

Apply the moment to the actual compatible K₂ tower. The integrality lemma passes through a Pontryagin-dual residue cohomology group: corestriction in the original inverse limit becomes restriction in a direct limit on the dual side. The p-cohomological dimension argument kills that direct limit, giving the S-integral image. Projecting to an eigenform then supplies a member of the existing ES.2 carrier.

The full-level construction remains linear in the moment variable and Hecke equivariant before a newform quotient. Its dual coefficient sheaf and central Hecke operators require the separate dictionary. The rational map uses the geometric values on Ash–Stevens generators, smoothing division and rational membership. Its existence depends on the L4 rational structure theorem, which is proved from geometric classes before that map. For CM forms the required early elliptic-unit supplier is an explicit gap. Nakamura’s tame-conductor map then transports f* by the source twist 1−k and the output twist k. Its integral lattice statement has the additional odd-prime and residual absolute irreducibility hypotheses.

### Perrin-Riou/Rubin integrality lemma placing the limit in H^1(Z[1/p],-)

Node `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology`; lemma; proposed declaration `cyclotomicLimitIntegral`. Implementation status: **unchecked**.

Let K be a finite extension of Q with ring of integers O_K, and let T be a finite Z_p-module with a continuous Gal(Kbar/K)-action. Then (1) for any set S of finite places of K containing all places above p, the canonical map H^1(O_K[S^{-1}],T) -> H^1(K,T) is injective; and (2) the image of lim_n H^1(K(zeta_{p^n}),T) -> H^1(K,T) is contained in the image of H^1(O_K[1/p],T) -> H^1(K,T). Consequently the image of Ch_{M,N}(k,r,r') lies in the image of the canonical injection H^1(Z[1/p], V_{k,Z_p}(Y(M,N))(k-r)) -> H^1(Q, ...), so the p-adic zeta elements are S-integral classes.

Hypotheses and domain:

- T finite over Z_p with continuous Galois action (the statement is applied to T/p^n and then passed to the limit)
- S contains all places over p; the conclusion of (2) is specifically about the cyclotomic tower K(zeta_{p^n})
- no ordinariness, crystallinity or good-reduction hypothesis is required

Construction or proof outline:

1. Hochschild–Serre at the unramified local extension injects H¹_ur(K_v,T) into H¹(K_v,T), with cokernel H⁰(Gal(K_v^ur/K_v),H¹(K_v^ur,T)).
2. Local duality identifies that cokernel with the Pontryagin dual of H¹(F_v,H⁰(K_v^ur,T^∨(1))). This is an identification of inertia invariants with a DUAL, not with undualized residue H¹.
3. Under this identification corestriction in the inverse system of local quotients corresponds to restriction in the direct system of residue H¹. The inverse limit therefore factors through the dual of colim_restr H¹(F_v(ζ_{pⁿ}),H⁰(K_v^ur,T^∨(1))).
4. For v∤p the residue-field union has p-cohomological dimension zero, so the DIRECT limit vanishes. Pass from finite p-primary coefficients to finitely generated Z_p coefficients by the coefficient limit. This yields the stated unramified image, and injectivity lets it factor through S-integral cohomology.

Direct prerequisites: `ArithmeticGaloisDuality:D7`, `SelmerIwasawaCohomology:L0`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

Acceptance checks:

- Corestriction belongs to the original inverse limit; restriction belongs to the dual residue direct limit.
- The proof applies at v∤p; it does not assert unramifiedness at p.
- Keep the Pontryagin dual through the residue-field cohomological-dimension step.
- The suggested signature must conclude injectivity of the S-integral map and a lift of the zero-level value of every corestriction-coherent tower. Its local algebra companion pairs inverse corestriction with direct restriction into Q/Z, using eventual vanishing of the direct system.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter II, Lemma 8.5, printed p. 183: The two conclusions are injectivity and S-integral lifting of coherent cyclotomic classes. Kato attributes the ingredients to [PeO, 2.2.4] and [Ru4, B3.3].
- `kato-2004-asterisque-295`, Chapter II, proof of Lemma 8.5, printed p. 184: Confirms the final step of the proof recorded in the fourth proofStep, and shows the proof is unconditional in p.
- `kato-2004-asterisque-295`, Chapter II, 8.6, printed p. 184: Confirms that the relevant tower is the cyclotomic one, so that part (2) of the lemma applies.

### The p-adic zeta elements c,d-z^{(p)}_{M,N}(k,r,r') and their two norm relations

Node `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`; construction; proposed declaration `padicZeta`. Implementation status: **unchecked**.

Atlas planet: **p-adic zeta elements**.

For M, N >= 1 with M + N >= 5, k >= 2, 1 <= r' <= k-1, (c,6pM) = 1 and (d,6pN) = 1, define c,d-z^{(p)}_{M,N}(k,r,r') = Ch_{M,N}(k,r,r')((c,d-z_{M*p^n,N*p^n})_n) in H^1(Z[1/p], V_{k,Z_p}(Y(M,N))(k-r)), the inverse limit being formed by Prop. 2.3. These elements satisfy: (1) (level norm relation) if M | M', N | N', (c,M') = (d,N') = 1 and prime(M*p) = prime(M'*p), prime(N*p) = prime(N'*p), the norm map sends c,d-z^{(p)}_{M',N'}(k,r,r') to c,d-z^{(p)}_{M,N}(k,r,r'); (2) (Euler relation) for a prime ell prime to M*p*c*d, the norm map K_2-side relation of Prop. 2.4 transports to the three-term operator 1 - T'(ell)<1/ell,1>^* ell^(−r) + <1/ell,1/ell>^* ell^{k-1-2r} when ell does not divide N, and the two-term operator 1 - T'(ell)<1/ell,1>^* ell^(−r) when ell divides N.

Hypotheses and domain:

- the constraints M+N >= 5, 1 <= r' <= k-1, (c,6pM) = 1, (d,6pN) = 1 are exactly the standing hypotheses of (8.1.1)
- in (1) the prime-set condition is imposed on M*p and M'*p (and on N*p, N'*p), i.e. after adjoining p, which is weaker than the condition prime(M) = prime(M') of Prop. 2.3 and is what allows the p-power tower to be built
- in (2) ell must be prime to M, p, c and d; ell may divide N
- the exponent k-1-2r in the quadratic term is the p-adic shadow of the archimedean Euler factor of 2.5 and is forced by the twist (k-r) and the equivariance scalars of Lemma 8.8

Construction or proof outline:

1. Apply Ch to the actual compatible c,d-z_{Mpⁿ,Npⁿ}; this constructs the class rather than assuming an Euler-system family exists.
2. Transport Props. 2.3–2.4 using Lemma 8.8, keeping T′ fixed. The degree/twist scalars yield the linear ell^(−r) and quadratic ell^(k−1−2r) terms.
3. The p-direction has the same prime support after adjoining p, and hence plain corestriction compatibility. For a new prime dividing N the quadratic term is absent. For ell|M the cited auxiliary-prime relation has no assertion.

Direct prerequisites: `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`, `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology`, `KatoEulerSystems:L1/euler-factor-norm-relation-at-auxiliary-primes`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

Uses determining the API:

- `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice`: Project these classes to the f-quotient.
- `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`: Computes the local dual exponential of the constructed class.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `padicZeta` | constructor | Ch of the actual norm-compatible pair of Siegel units. |
| `padicZeta_def` | characterisation | padicZeta equals the Chern-moment map applied to the Beilinson tower. |
| `padicZeta_norm` | compatibility | At a new prime ell∤Mpcd, cor(z_high)=E_ell z_low, with E_ell=1−ell^(−r)A+ell^(k−1−2r)B if ell∤N and 1−ell^(−r)A if ell\|N. |
| `padicZeta_pDirection` | compatibility | In the p-direction, cor(z_{n+1})=z_n. |
| `padicZeta_coefficients` | functoriality | Hecke/coefficient specialization commutes with the constructed class. |

Unit tests (suggested `example` signatures with admitted proofs):

- `zeta_unramified_r_one` (computation): At k=2,r=1 the operator is 1−A/ell+B/ell.
- `zeta_bad_prime_r_one` (computation): At ell|N,r=1 the operator is 1−A/ell.
- `zeta_p_direction` (compatibility): For compatible high/low moment maps and a transfer carrying high symbols to low symbols, corestriction of the constructed high padicZeta equals the constructed low class with no new Euler factor.
- `zeta_identity_moment` (computation): With Ch=id on Q-valued sequences and symbols the constant-one sequence, the resulting class has value 1 at index zero.

Acceptance checks:

- At k=2,r=1 the unramified Euler operator is 1−ell^(−1)A+ell^(−1)B.
- For ell|N the same linear ell^(−r) remains and the quadratic term vanishes.
- For p-direction norm compatibility the class at the next p-level corestricts to the previous class.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter II, (8.1.1), printed p. 180: Gives the target group, the twist (k-r), and the full list of numerical hypotheses recorded in the node.
- `kato-2004-asterisque-295`, Chapter II, Prop. 8.7(1), printed p. 184: Gives relation (1) with the prime-set condition stated after adjoining p, exactly as recorded in the hypotheses.
- `kato-2004-asterisque-295`, Chapter II, Prop. 8.7(2), printed p. 184: Gives relation (2), including the explicit exponent k-1-2r in the quadratic term.
- `kato-2004-asterisque-295`, Chapter II, before Prop. 8.7, printed p. 184: States the proof route of Prop. 8.7 used in the third and fourth proofSteps.

### The modular Euler-system application adapter

Node `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice`; construction; proposed declaration `katoEulerAdapter`. Implementation status: **unchecked**.

Atlas planet: **The modular Euler-system datum**.

Fix a normalised newform f of weight k and level N, a place lambda of F = Q(a_n : n >= 1) over p, an integer r, and set T = V_{O_lambda}(f)(k-r). Fix 1 <= j <= k-1, nonzero integers c, d and a symbol xi that is either a(A) (with (c,6pA) = 1, (d,6pN) = 1) or an element of SL_2(Z) (with (c*d,6pN) = 1). Put Sigma = prime(c*d*p*A*N) resp. prime(c*d*p*N), and S = {m >= 1 : prime(m) intersect Sigma = {p}}. For m in S, let z_m = c,d-z^{(p)}_m(f,r,j,xi,prime(m*A)) resp. c,d-z^{(p)}_m(f,r,j,xi,prime(m*N)) in H^1(Z[zeta_m,1/p],T). Then (z_m)_{m in S} is an Euler system for (T,F_lambda,Sigma) in the sense of 13.1: for m | m' in S the corestriction from Q(zeta_{m'}) to Q(zeta_m) sends z_{m'} to the product over primes ell dividing m' but not m of P_ell(ell^{-1} sigma_ell^{-1}) applied to z_m, where sigma_ell is the arithmetic Frobenius in Gal(Q(zeta_m)/Q) and P_ell is the Euler polynomial of the datum. In Kato 13.1 the polynomial is P_ell(t)=det(1−Fr_ell t|T), with arithmetic Frobenius, as verified on printed p.224. For T=V(f)(k−r), P_ell(t)=1−ā_ell ell^(1−r)t+ε̄(ell)ell^(k+1−2r)t²; evaluation at ell^(−1)σ_ell^(−1) gives 1−ā_ell ell^(−r)σ_ell^(−1)+ε̄(ell)ell^(k−1−2r)σ_ell^(−2). Import ES.2’s carrier and use its Euler-factor-change convention adapter to compare this presentation with the dual-representation polynomial of the ES interface. The old claimed discrepancy between 13.1 and 13.3 is a transcription error: 13.1 has no inverse on Fr_ell.

Hypotheses and domain:

- for ell not dividing N*p, det(1 - Fr_ell^{-1} t : V_{F_lambda}(f)) = 1 - a_ell t + epsilon(ell) ell^{k-1} t^2, and P_ell for the twisted lattice T = V_{O_lambda}(f)(k-r) is the corresponding twisted polynomial
- the norm relation is a corestriction relation, and the Euler factor is evaluated at ell^{-1} sigma_ell^{-1} with sigma_ell the ARITHMETIC Frobenius -- this is the Tate-dual convention and must not be replaced by the geometric Frobenius
- the index set (Kato writes Xi, this node writes S) is {m >= 1 : prime(m) intersect Sigma = {p}}; since the intersection must EQUAL {p}, every m in it is divisible by p, and apart from p its prime divisors avoid Sigma. Kato makes this explicit in Example 13.2, where Sigma = {p} and he glosses 'for m in Xi (that is, for any m >= 1 such that p | m)'
- the datum depends on the auxiliary data (c,d,j,xi), which are fixed once and for all; different choices give different Euler systems
- The ES convention conversion must use the actual dual/variable normalization, not an arbitrary equality between dimension-two representations.

Construction or proof outline:

1. Use Kato 8.11–8.12 to push down to Y₁(N) over Q(ζ_m), and project to the Hecke eigenquotient V(f)(k−r). Keep the original integral lattice and smoothing factors.
2. The arithmetic Frobenius polynomial on the cohomological V(f) is the one computed in Example 13.3. Substitute ell^(−1)σ_ell^(−1); this recovers the moment norm formula including its linear scalar.
3. Apply the imported ES.2 conductor presentation and Euler-factor-change map. The carrier remains owned by ES.2; this node supplies its concrete modular member. No cyclotomic-unit theorem is used.

Direct prerequisites: `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`.

Uses determining the API:

- `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`: Supplies a concrete Euler system to the generic bound.
- `EulerSystemsAndKolyvaginSystems:ES.8`: The application handoff imports the carrier directly.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `katoEulerAdapter` | constructor | A member of the imported ES.2 carrier obtained from the modular conductor family and its convention conversion. |
| `katoEulerAdapter_component` | projection | Its p-power conductor component is the modular zeta class; the conversion preserves classes unramified outside the excluded set. |
| `katoEulerPolynomial` | data | The evaluated unramified polynomial is 1−ā_ell ell^(−r)X+ε̄(ell)ell^(k−1−2r)X². |
| `katoEulerAdapter_norm` | compatibility | The component family obeys the imported corestriction equation with that evaluated polynomial. |
| `katoEulerAdapter_ext` | extensionality | The imported Euler-system extensionality theorem identifies any ES.2 datum with these conductor components with katoEulerAdapter. |

Unit tests (suggested `example` signatures with admitted proofs):

- `euler_weight_two` (computation): At k=2,r=1 the coefficients are −ā_ell/ell and ε̄(ell)/ell.
- `euler_repeated_prime` (compatibility): On the actual katoEulerAdapter components, the repeated-prime relation is corestriction to the lower component with the identity factor.
- `euler_polynomial_constant` (degenerate): At X=0 the evaluated polynomial is 1.

Acceptance checks:

- Read 13.1 on p.224: P uses Fr, without inverse.
- Do not identify V(f) with Deligne’s positive-weight realization without the dual/twist dictionary.
- The p-power classes are preserved by the convention adapter, as in ES.2/euler-factor-change.

Source correspondence:

- `kato-2004-asterisque-295`, 13.1 and Example 13.3, pp.224–225: P_ell(t)=det(1−Fr_ell t:T) is evaluated at ell^(−1)σ_ell^(−1), giving the explicitly displayed moment polynomial.
- `rubin-euler-systems-draft`, Definition II.1.1; Lemma IX.1.1: The imported ES.2 convention adapter is used, not a redefinition of the carrier.

### The integral zeta submodule Z and its finite index in Z(f,T)

Node `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index`; theorem; proposed declaration `integralZetaFiniteIndex`. Implementation status: **unchecked**.

Atlas planet: **The integral zeta submodule**.

Let T = V_{O_lambda}(f) and let Z be the Lambda-submodule of H^1(V_{O_lambda}(f)) generated by the two explicitly listed families of p-adic zeta elements: (1) (c,d-z^{(p)}_{p^n}(f,k,j,a(A),prime(p*A)))_{n >= 1} for 1 <= j <= k-1, a, A in Z with A >= 1, and c, d with (c,6pA) = (d,6pN) = 1; and (2) (c,d-z^{(p)}_{p^n}(f,k,j,alpha,prime(p*N)))_{n >= 1} for 1 <= j <= k-1, alpha in SL_2(Z), and c, d with (c*d,6pN) = 1 and c = d = 1 mod N. Then Z is contained in Z(f,T), the Lambda-submodule generated by the classes z_gamma^{(p)} for gamma in T, and the quotient Z(f,T)/Z is a finite group.

Hypotheses and domain:

- Lambda = O_lambda[[G_infinity]] with G_infinity = Gal(Q(zeta_{p^infinity})/Q); this is a two-dimensional complete semi-local ring, not a regular local ring, and its height-one primes containing p need separate treatment
- family (2) imposes the extra congruence c = d = 1 mod N, which family (1) does not
- the conclusion is finiteness of the quotient, not equality: the integrally defined submodule Z is in general strictly smaller than Z(f,T)

Construction or proof outline:

1. Construct canonical z_γ first in the total fraction module as in 13.9. Lemma 13.10 expresses EACH GEOMETRIC smoothed generator as a Λ-linear combination of canonical z_γ; this gives Z⊂Z(f,T). The reverse expression with denominators alone would not prove this inclusion.
2. Ash–Stevens 13.6 and 13.10(2) produce a non-zero-divisor μ with μZ(f,T)⊂Z and Λ/μΛ p-torsion-free. Consequently μ is a unit at height-one primes over p, so the two modules agree there.
3. At each height-one prime away from p, use 13.11(1)–(2), analytic nonvanishing and suitable auxiliary c,d after finite coefficient extension to obtain Z(f,T)_q=Z_q. This is the substantive argument of 13.12, not just the generator theorem.
4. The finitely generated quotient is killed by μ and has support in codimension at least two. Apply the full cyclotomic semilocal finite-support theorem to deduce that it is a finite group. This also proves rational membership Z(f,T)⊂H¹(T)⊗Q. The canonical-map construction and this membership argument are joint parts of 13.9–13.12, not a dependence on its later cohomological divisibility.

Direct prerequisites: `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `ModularSymbolsPadicLFunctions:L0`, `PadicMeasuresIwasawaAlgebras:L4`.

Acceptance checks:

- Check that the two families are genuinely different data: family (1) carries the auxiliary parameter A and the bad-Euler-factor information, family (2) carries the delicate integrality but cannot see bad Euler factors (Kato's remark in 8.1).
- Check that finiteness of Z(f,T)/Z is what converts a rational divisibility into an integral one up to a bounded power of p, and that Kato does not claim the index is 1.
- Check that no residual-irreducibility hypothesis is used in this statement, in contrast with Thm. 12.4(3) and Thm. 12.5(4).
- The suggested signature must conclude both Z≤Z(f,T) and finiteness of Z(f,T)/Z. Neither conclusion is assumed; the quotient uses the preimage of Z under the subtype inclusion of Z(f,T).

Source correspondence:

- `kato-2004-asterisque-295`, Chapter III, Thm. 12.6, printed p. 222: Gives the conclusion with the stated hypotheses, including that the index is finite rather than trivial.
- `kato-2004-asterisque-295`, Chapter III, Thm. 12.6(1)(2), printed p. 222: Gives both generating families with their exact parameter ranges and the extra congruence condition in family (2).
- `kato-2004-asterisque-295`, Chapter II, 8.1, printed p. 180: Explains the distinct roles of the two families, recorded in the first acceptance item.
- `kato-2004-asterisque-295`, 13.10–13.12, pp.230–232: The rest of 13.12 treats primes over p with μ and every height-one prime away from p using 13.11. Spanning alone proves neither inclusion in this direction nor finite index.

### Full-level Hecke-linear zeta classes

Node `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`; construction; proposed declaration `fullLevelZeta`. Implementation status: **unchecked**.

Atlas planet: **Full-level zeta classes**.

For N≥3,k≥2, n≥1, prime(Np)=Σ, (n,Np)=1 and c≥2 prime to 6Nnp, construct c-z^Iw_{N,n}(k,−):Sym^(k−2)(Z_p²)^*→H¹_Iw(Z[1/Σ_n,ζ_n],H¹(Y(N),V_k^*)(2)) from c,c-z_N. The finite levels use the torsion scheme μ⁰_{np^m} and Shapiro, then the p-direction corestriction limit. It is Z_p-linear in the moment v and commutes with coefficient extension and the full-level Hecke actions before any newform quotient. For ell∉Σ, Cor∘c-z^Iw_{N,nell}=c-z^Iw_{N,n} if ell|n and (1−T′_ell σ_ell^(−1)+ell S′_ell σ_ell^(−2))c-z^Iw_{N,n} otherwise. This is the modular/Hecke-level input of Nakamura’s universal deformation map, whose construction is owned by AutomorphicCongruences:L3.

Hypotheses and domain:

- V_k=Sym^(k−2)(R¹λ_*Z_p), and V_k^*=Hom_Zp(V_k,Z_p) is its LITERAL integral dual. Via T_pE=H_p(1), this is the divided-power lattice Γ^(k−2)(T_pE), not in general Sym^(k−2)(T_pE). The symmetric-power identification is used only after inverting (k−2)!, in particular rationally (E7).
- n is prime to Np; c must be prime to 6Nnp at each conductor used.

Construction or proof outline:

1. Use the equal-auxiliary K₂ symbol and its étale Chern class. Nakamura §3.1.4 uses the completed Borel–Moore coefficient map of Lemma 2.10 to pair a literal dual moment with the torsion-scheme class. Request this map with its Hecke, coefficient-change and conductor compatibilities; the ordinary Kato Tate-monomial construction is not an integral replacement.
2. Shapiro identifies torsion-scheme cohomology with arithmetic cohomology over Q(ζ_np^m); the p-norm equations define the Iwasawa class.
3. The integral norm equation uses the original T′,S′ actions on the literal dual sheaf as in equations (13)–(16). Lemma 3.1 identifies its polynomial with the cohomological normalization only on the rational coefficient domain of the dictionary node. No integral symmetric-power self-duality is invoked.

Direct prerequisites: `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L0`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.2`.

Uses determining the API:

- `AutomorphicCongruences:L3`: The universal deformation map specializes to these classes; no deformation theory is rebuilt here.
- `KatoEulerSystems:L3/parabolic-full-level-characterisation`: Its Drinfeld–Manin image has a unique period characterization.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `fullLevelZeta` | constructor | The Z_p-linear moment map to the full-level Iwasawa module. |
| `fullLevelZeta_moment` | characterisation | The value at v is the Chern-moment image of c,c-z_N at all p-levels. |
| `fullLevelZeta_hecke` | compatibility | For an admitted Hecke action on moments and cohomology, applying that action commutes with the zeta map. |
| `fullLevelZeta_corestriction` | functoriality | Conductor corestriction is identity at a repeated prime and the stated quadratic operator at a new prime. |
| `fullLevelZeta_ext` | extensionality | Two full-level moment morphisms with the same values on every dual moment agree as linear maps. |

Unit tests (suggested `example` signatures with admitted proofs):

- `fullLevel_zero` (degenerate): At v=0 the class is zero.
- `fullLevel_add` (compatibility): The moment of v+w is the sum of the two moments.
- `fullLevel_new_prime` (characterisation): When the constructed high and low fullLevelZeta maps satisfy the transfer equation, their values obey 1−T′u+ell S′u²; the test uses the constructed maps, not just an unrelated operator expansion.
- `fullLevel_identity_moment` (computation): With Ch=id on Q and moment evaluation at 1 on the literal dual of Q, fullLevelZeta sends the identity functional to 1; this rules out a constant-zero construction.

Acceptance checks:

- Use the two-term identity for a repeated conductor prime, and the quadratic polynomial for a new unramified prime.
- The class precedes the eigenform projection; its target retains the full Hecke module.
- Reversing BOTH Siegel-unit entries preserves their K₂ product, resolving Nakamura’s theta sign slip without changing c,c-z_N.
- At k=4,p=2 keep the literal dual lattice; no GL₂(Z₂)-equivariant isomorphism Sym²(Z₂²)≅Sym²(Z₂²)^*⊗det² exists (E7).

Source correspondence:

- `nakamura-2023-published`, §3.1.3–3.1.4, equations (9)–(16), pp.207–212: The equal-auxiliary K₂ symbol feeds the full-level moment and conductor class; the ES equations occur in (11)–(16).

### Kato and Nakamura Hecke conventions

Node `KatoEulerSystems:L2/hecke-dual-twist-dictionary`; comparison; proposed declaration `heckeDualTwistDictionary`. Implementation status: **unchecked**.

With rational coefficients (or with (k−2)! inverted), on the full-level V_k cohomology, T_ell=T(ell)diag(ell,1)^*=T*(ell)diag(1,ell)^*, S_ell=ell^(k−2)diag(ell,ell)^*. The dual-sheaf transport V_k≅V_k^*(2−k) gives T′_ell=T*(ell)diag(ell^(−1),1)^*=ell^(k−2)T_ell S_ell^(−1), S′_ell=ell^(k−2)diag(ell^(−1),ell^(−1))^*=ell^(2(k−2))S_ell^(−1). Thus Nakamura’s full-level polynomial is 1−T′_ell u+ell S′_ell u². On the Γ₁ eigenquotient V′₁(f)=V₁(f)^*, T′_ell and S′_ell have eigenvalues a_ell and ell^(k−2)ε_f(ell). Poincaré duality gives V′₁(f)(1−k)≅V₁(f*).

Hypotheses and domain:

- ell∤Np for the invertible central/full-level Hecke dictionary.
- V_k is the cohomological sheaf, whereas V_k^* is its dual; the displayed 2−k is on the dual-sheaf side.
- The symmetric-power self-duality used in equations (7)–(8) requires (k−2)! invertible in the coefficient algebra, for example Q_p or F_λ. This packet asserts the displayed transport rationally at every prime; it does not assert it on arbitrary Z_p lattices (E7).

Construction or proof outline:

1. Use definitions (5)–(8) and the central action in Lemma 3.1 after making (k−2)! invertible. The integral dual is kept literal; the published assertion for arbitrary Z_p-algebras in (7) has counterexample E7.
2. The two central inverse operators introduce different powers of ell; retain both.
3. Use the Γ₁ Poincaré pairing of Appendix A, Lemma A.3. Correct the printed full-level Y(N_f) to Y₁(N_f); a full-level isotypic piece need not be rank two.

Direct prerequisites: `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `ModularCurvesPartII:R14.1/diamond-operators`.

Acceptance checks:

- At k=2 the central powers in T′ and S′ are both 1.
- At k=4 the factors are ell² and ell⁴, respectively.
- V′₁(f)(1−k) is V₁(f*), not V₁(f).
- The suggested signature must transport literal-dual endomorphisms to the rational cohomological realization, retain the distinct ell^(k−2) and ell^(2(k−2)) central factors, and state both eigenquotient eigenvalues and the underlying Poincaré equivalence with the dual form. Galois twists remain explicitly omitted from these abstract linear carriers.

Source correspondence:

- `nakamura-2023-published`, Lemma 3.1, pp.205–206; Lemma A.3, p.268: The central-operator formulas and duality identify the representation conventions rather than merely their dimensions.

### The rational Kato zeta morphism

Node `KatoEulerSystems:L2/rational-kato-zeta-morphism`; construction; proposed declaration `katoZetaMap`. Implementation status: **unchecked**.

Atlas planet: **Kato zeta morphism**.

For a normalized newform f of weight k≥2, any prime p and λ|p, let F be the Hecke field, E=F_λ, Λ_Q=O_λ[[G_∞]][1/p], and V=V_E(f). Assuming the H²-torsion/H¹-freeness input of 12.4(2), construct the unique E-linear map z^Ka:V→H¹_Iw(V) whose critical dual-exponential images are the ones in 12.5(1). It is constructed from the geometric zeta families: Ash–Stevens generators δ(f,j,ξ) map to the corresponding smoothed classes divided by the explicit smoothing factors in the total fraction ring. Kato 13.9–13.12 show this is well-defined, lies in H¹_Iw(V), and is independent of auxiliary c,d. Its conjugation relation is z^Ka(ιγ)=−σ_(−1)z^Ka(γ). Define Z(f) as the Λ_Q-span of all its values; Z(f,T) is the Λ-span of the values on a chosen stable lattice T, initially inside total-fraction cohomology.

Hypotheses and domain:

- The rational input 12.4(2) is available for non-CM forms from L4; for CM forms it is an explicit supplier gap until the all-prime elliptic-unit layer exports it.
- Compatible primitive p-power roots and the embeddings F→C and F→F_λ are fixed.
- No ordinary, good-reduction or residual-image assumption is inserted into the rational map.

Construction or proof outline:

1. Use the actual geometric zeta elements and their smoothing relations to define values on the modular-symbol generators in the fraction module.
2. Kato Lemmas 13.10–13.11 identify the relations and signs using complex periods and infinitely many nonzero twists.
3. Prove rational membership within the construction, as in 13.12: 13.6 and 13.10 give μ times the fractional generator span inside the geometric integral span with Λ/μ p-torsion-free; 13.11 and nonvanishing give equality at the other height-one primes. The finite-support theorem then makes the quotient finite and places the fractional map in H¹(T)⊗Q. The separate finite-index node records this joint argument as a consequence; no already-integral canonical map is assumed to prove its own membership. CM remains conditional on the early 12.4(2) supplier.

Direct prerequisites: `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `mathlib:LinearMap`, `mathlib:Submodule.span`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `ModularSymbolsPadicLFunctions:L0`, `PadicMeasuresIwasawaAlgebras:L4`.

Uses determining the API:

- `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`: Interpolate the map after the genuine Iwasawa twist.
- `CMAllPrimeMainConjectures (paper route 7)`: Imports this construction conditional on 12.4(2), avoiding a cycle with its CM H² proof.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `katoZetaMap` | constructor | The E-linear map constructed from the geometric classes on the modular-symbol generators. |
| `katoZetaMap_generator` | characterisation | On each admitted generator the map is the corresponding smoothed geometric class divided by its explicitly named factor. |
| `katoZetaMap_conjugation` | compatibility | z(ιγ)=−σ_(−1)z(γ). |
| `katoZetaSubmodule` | data | The Λ_Q-submodule spanned by all values of the map. |
| `katoZetaSubmodule_mem` | projection | Every z(γ) belongs to Z(f). |
| `katoZetaMap_unique` | universal-property | Any F_λ-linear map with the specified generator values equals the canonical map. |
| `katoZetaSubmodule_eq_span` | characterisation | The generated Λ-submodule is Submodule.span Λ of the image of the canonical map. |

Unit tests (suggested `example` signatures with admitted proofs):

- `katoMap_zero` (degenerate): The zero Betti vector maps to zero.
- `katoMap_add` (compatibility): z(γ+δ)=z(γ)+z(δ).
- `katoMap_sign` (non-example): On a nonzero canonical-map value over Q, the untwisted minus-conjugation relation differs from the positive relation: z(ιv)=−z(v) implies z(ιv)≠z(v). The test uses the actual constructed morphism.
- `katoMap_generator_one` (characterisation): On Q with the single specified generator 1 and specified value 1, the canonical map sends 1 to 1.

Acceptance checks:

- The map is E-linear, and z^Ka(0)=0.
- The untwisted map has a minus sign under ι.
- Z(f,T) is not declared contained integrally in H¹(T) without a lattice hypothesis.

Source correspondence:

- `kato-2004-asterisque-295`, 12.5(1), 13.9–13.12, pp.221, 228–233: The existence theorem is implemented through the smoothed geometric classes and the localized construction.
- `burungale-tian-2025-v2`, Theorem 2.4, Remark 2.5, pp.4–5: The all-prime rational formulation and its critical characterization retain Kato’s map, not a hypothetical Euler system.

### Nakamura’s twist-one zeta morphism

Node `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`; construction; proposed declaration `twistedKatoZeta`. Implementation status: **unchecked**.

Atlas planet: **Twisted zeta morphism**.

For n≥1 prime to Σ_f=prime(N_fp), construct the tame-conductor extension z^Ka_n(f) of the rational Kato map. Put V′₁(f)=V₁(f)^* using the Γ₁ quotient, with V′₁(f)(1−k)≅V₁(f*). Define z_n(f)=twist_k ∘ z^Ka_n(f*) ∘ twist_(1−k):V′₁(f)_E→H¹_Iw(Z[1/Σ_(f,n),ζ_n],V′₁(f)_E(1)). It obeys z_n(f)(ιv)=σ_(−1)z_n(f)(v), and for ell∉Σ_f, Cor∘z_(nell)=z_n if ell|n, otherwise P_ell(σ_ell^(−1))z_n, P_ell(X)=1−a_ell X+ell^(k−1)ε_f(ell)X². Applying twist_(−k) and exp*_(m,1) to z_n(f)(γ) gives a rational differential whose χ-period is L_{{p},n}(f,χ,k−1)((2πi)^(1−k)γ)^±, ±=χ(−1). For p odd and residual absolute irreducibility the maps preserve the stable lattice, as in Remark A.2.

Hypotheses and domain:

- γ∈V′₁(f)_F for the complex period formula; compatible p-power roots are fixed.
- The Iwasawa algebra at conductor n contains the tame Galois action; invert p for the rational map.
- The general-conductor smoothing μ_n uses d², correcting the published Appendix A slip.

Construction or proof outline:

1. Extend the L2 construction to n using the full-level conductor class and the Hecke quotient; Appendix A.1 gives its unique characterization.
2. Twist the source by 1−k into V₁(f*) and the Iwasawa output by k; the total output is V′₁(f)(1).
3. Use Appendix A.5 and Remark A.6 for periods, norm and conjugation. The extra twist changes Kato’s minus sign to the positive equivariance displayed here.
4. Keep the separate lattice assertion of Remark A.2 and its stronger p-odd/residual-absolute-irreducibility hypotheses.

Direct prerequisites: `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`, `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, `SelmerIwasawaCohomology:L3/iwasawa-twist`, `SelmerIwasawaCohomology:L3`.

Uses determining the API:

- `AutomorphicCongruences:L3`: The universal deformation zeta morphism specializes to this map.
- `KatoEulerSystems:L4/cohomological-divisibility-one-direction`: Nakamura 5.2 restates the integral bound in the twist-one convention.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `twistedKatoZeta` | constructor | twist_k ∘ z^Ka_n(f*) ∘ twist_(1−k). |
| `twistedKatoZeta_def` | characterisation | Evaluation is outputTwist(z^Ka_n(f*)(sourceTwist γ)). |
| `twistedKatoZeta_conjugation` | compatibility | z_n(ιγ)=σ_(−1)z_n(γ). |
| `twistedKatoZeta_norm` | functoriality | Conductor corestriction is identity for a repeated prime and P_ell(σ_ell^(−1)) for a new prime. |
| `twistedKatoZeta_ext` | extensionality | Equality on every input of the twisted morphism is equality of the linear maps. |

Unit tests (suggested `example` signatures with admitted proofs):

- `twisted_total_degree` (computation): At any k, source exponent 1−k plus output exponent k is 1.
- `twisted_zero` (degenerate): The zero vector maps to zero.
- `twisted_positive_sign` (non-example): Composing an arbitrary linear z with −id on the input and −id on the output gives twistedKatoZeta(−id,z,−id)(x)=z(x), exercising both sign changes in the construction.
- `twisted_identity_maps` (computation): With all three maps id on Q, twistedKatoZeta sends 1 to 1.

Acceptance checks:

- The total output twist is (1−k)+k=1.
- The conjugation sign is positive here and negative for the untwisted Kato map.
- At k=2 the period factor is (2πi)^(−1).

Source correspondence:

- `nakamura-2023-published`, Theorem A.1, Remark A.2, Definition A.4, Corollary A.5, Remark A.6, pp.265–269: The source twist, output twist and inverse-twist characterization define the actual twist-one map.

## L3: Explicit reciprocity

The generic dual exponential is imported; the work here identifies its modular filtration step and calculates its value on the constructed classes. Kato §10 reduces the calculation to the big-local-field reciprocity statement and the compatibility square with §11. A finite-residue-field syntomic exponential does not close that input. The p-factor calculation has three distinct divisibility cases.

The period quotient and F-rational modular-symbol vectors fix the complex comparison. The critical formula uses f*, while the weight-two archimedean regulator at zero uses a derivative and a different sign. Parabolic full-level characterization uses the rational Drinfeld–Manin splitting and the actual inverse-limit injectivity theorem, which is not claimed for open-curve cohomology.

The refined scalar regulator pairs the vector regulator with a normalized crystalline eigenvector. Small slope gives a nonzero pairing and the noncritical equality with the analytic distribution once the exact normalization dictionary is supplied. Critical equality requires a compatible arithmetic family; general de Rham and integral ordinary assertions retain their own domains. The elliptic specialization supplies the singular local lattice and the integral period factor needed by the applications in L4.

### The modular de Rham filtration and dual exponential

Node `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`; construction; proposed declaration `modularFiltration`. Implementation status: **unchecked**.

Atlas planet: **Modular dual exponential**.

For Y=G\Y(N), N≥3, k≥2, V=H¹(Y_Qbar,Sym^(k−2)H_p)⊗Q_p is de Rham. Let D=D_dR(V). Its decreasing filtration is F^iD=D for i≤0, F^iD=M_k(X)⊗Q_p for 1≤i≤k−1, and F^iD=0 for i≥k. For 1≤i≤k−1 the twist-shift identification gives F⁰D_dR(V(i))≅F^iD_dR(V)≅M_k(X)⊗Q_p. Composing the imported PadicHodgeRegulators:L1 dual exponential with this identification gives the modular exp*:H¹(Q_p,V(i))→M_k(X)⊗Q_p. These are filtration STEPS: for 1≤i<k−1, gr^iD=F^i/F^(i+1)=0. At the f-quotient its target is S(f)⊗_F F_λ.

Hypotheses and domain:

- The open modular curve is obtained from the full-level fine curve and its quotient; X is the smooth compactification.
- Use Kato’s cohomological representation and cyclotomic twist convention.
- The generic construction, local duality normalization and trace compatibility of exp* are imported.

Construction or proof outline:

1. Use Kato 9.2 and the geometric comparison of §11 to identify the filtered de Rham realization.
2. Import the generic dual exponential, whose normalization is the local Tate-duality adjoint of the exponential, and its twist/change-of-field compatibility.
3. Apply the filtration-shift isomorphism and the modular-form identification of F^i; project to the Hecke quotient for exp*_f.

Direct prerequisites: `PadicHodgeRegulators:L1/dual-exponential`, `PadicHodgeRegulators:L1/twist-and-change-of-field`, `ModularCurvesPartII:R12.3`, `mathlib:Submodule`, `mathlib:ModularForm`, `ModularCurvesPartII:R14.3`.

Uses determining the API:

- `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`: Provides the target of the de Rham regulator calculation.
- `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`: The twist k−r lies in the critical filtration range.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `modularFiltration` | data | The filtration with D in nonpositive degrees, the modular-form submodule in degrees 1 through k−1, and zero from k. |
| `modularFiltration_nonpositive` | simp | F^i=D for i≤0. |
| `modularFiltration_critical` | characterisation | F^i=M_k(X)⊗Q_p for 1≤i<k. |
| `modularFiltration_endpoint` | simp | F^i=0 for i≥k. |
| `modularDualExp` | projection | The imported exp* followed by the filtration-step/modular-form equivalence. |
| `modularDualExp_coe` | compatibility | For the subtype-valued modular dual exponential, coercion to D gives the imported exp* value. |

Unit tests (suggested `example` signatures with admitted proofs):

- `filtration_interior` (non-example): At k=4, F¹=F² is the modular-form step; its quotient gr¹ is zero.
- `filtration_endpoint` (degenerate): At k=4,i=4 the filtration is zero.
- `filtration_weight_two` (computation): At k=2,i=1 the filtration is the modular-form step.
- `dualExp_coercion` (compatibility): The value of modularDualExp as an element of D equals the supplied exp* value, excluding a zero subtype map when exp* is nonzero.

Acceptance checks:

- For k=4, F¹=F²=F³=M₄ while gr¹=gr²=0.
- For i=k the filtration vanishes, including the endpoint.
- At k=2,i=1 the target is M₂ and the next step is zero.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter II, 9.3, printed pp. 187-188: Gives the construction of exp^* and its normalisation by log(chi_cyclo), recorded in the statement and hypotheses.
- `kato-2004-asterisque-295`, Chapter II, (9.2.2), printed p. 187: Gives the de Rham property and the exact Hodge filtration of the modular local system, including the range 1 <= i <= k-1.
- `kato-2004-asterisque-295`, Chapter II, 9.4, printed p. 188: Confirms the target of (9.4.1) and the role of the Tate twist, recorded in the third proofStep.

### Kato's generalised explicit reciprocity law (Thm. 9.5) in its three p-Euler-factor cases

Node `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`; theorem; proposed declaration `generalizedExplicitReciprocity`. Implementation status: **unchecked**.

Atlas planet: **The explicit reciprocity law**.

Let the notation be as in (8.1.1). Assume 1 <= r <= k-1, that at least one of r, r' equals k-1, and that prime(M) is contained in prime(N); assume further M >= 2 in the case (r,r') = (k-2,k-1). Then the dual exponential map (9.4.1) with Y = Y(M,N) and i = k-r sends the image of c,d-z^{(p)}_{M,N}(k,r,r') in H^1(Q_p, V_{k,Q_p}(Y(M,N))(k-r)) to the following element of M_k(X(M,N)) tensor Q_p: c,d-z_{M,N}(k,r,r') if p divides M; (1 - T'(p)<1/p,1>^* p^(−r)) c,d-z_{M,N}(k,r,r') if (p,M) = 1 and p divides N; and (1 - T'(p)<1/p,1>^* p^(−r) + <1/p,1/p>^* p^{k-1-2r}) c,d-z_{M,N}(k,r,r') if (p,M*N) = 1. Correspondingly, Thm. 9.6 gives the statement for the elements (8.1.2) over Q(zeta_m) tensor Q_p, and Thm. 9.7 the statement for the eigenform elements (8.1.3) with exp^*_f landing in S(f) tensor_F F_lambda tensor Q(zeta_m).

Hypotheses and domain:

- 1 <= r <= k-1 and at least one of r, r' equal to k-1; the theorem is NOT asserted for general pairs (r,r')
- prime(M) contained in prime(N) -- an inclusion of prime sets, the same hypothesis as in the archimedean regulator theorem 2.6
- the extra hypothesis M >= 2 in the single exceptional case (r,r') = (k-2,k-1)
- the three cases are distinguished by the p-divisibility of M and of N, and give the three Euler factors of 2.5 at ell = p; the exponent k-1-2r is the same one occurring in Prop. 8.7(2)
- the target element c,d-z_{M,N}(k,r,r') is the zeta element in the space of modular forms constructed in Sec. 4, not the K_2 element of Sec. 2

Construction or proof outline:

1. Kato §10 reduces the calculation to the generalized explicit reciprocity law over the big local field and to the compatibility square (10.9.5). This deep input is recorded as a precise proof-closure gap, not replaced by an assumed ordinary regulator identity.
2. The Kuga–Sato realization and §11 syntomic comparison identify the geometric dual exponential with the modular filtered exp*.
3. Trace in the p-direction yields factor 1 for p|M, the linear factor for p∤M,p|N, and the quadratic factor for p∤MN. Keep Lemma 8.8’s Hecke normalization and linear p^(−r).
4. Apply §§9.6–9.7 for the conductor descent and the f-quotient, retaining all admissibility hypotheses.

Direct prerequisites: `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`, `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`, `PadicHodgeRegulators:D.2/syntomic-exponential`.

Acceptance checks:

- At r=1 the p∤M linear term contains p^(−1) in both nontrivial cases.
- At p|M the factor is exactly 1.
- The target is F^(k−r)D, not gr^(k−r)D; at k=4,r=2 the latter would be zero.
- The suggested signature must apply exp* to localization of the p-adic class and equate it to the Eisenstein-product class with the three p-divisibility branches, including p^(−r) and p^(k−1−2r).

Source correspondence:

- `kato-2004-asterisque-295`, Chapter II, Thm. 9.5, printed p. 188: Gives all hypotheses (including the exceptional M >= 2 case) and all three Euler-factor cases with the exponent k-1-2r, exactly as recorded.
- `kato-2004-asterisque-295`, Chapter II, Sec. 10 opening, printed p. 189: States explicitly that Thm. 9.5 is deduced from an external result [KK3] plus the internal compatibility (10.9.5); this is the import boundary recorded in the packet gaps.
- `kato-2004-asterisque-295`, Chapter II, 10.1, printed p. 189: Confirms that the reciprocity law is applied over a non-perfect residue field, as recorded in the proofSteps.
- `kato-2004-asterisque-295`, Chapter II, Thm. 9.7, printed p. 189: Gives the eigenform form of the reciprocity law and records that it is deduced from Thm. 9.6.

### The canonical zeta class and its critical interpolation for the dual form

Node `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`; theorem; proposed declaration `zetaCriticalInterpolation`. Implementation status: **unchecked**.

Atlas planet: **Interpolation of complex L-values**.

The rational map z^Ka of L2 is characterized as follows. For γ∈V_F(f), 1≤r≤k−1 and n≥0, FIRST twist the Iwasawa class by the compatible roots with exponent k−r to H¹_Iw(V(f)(k−r)); THEN specialize at Q(ζ_pⁿ), localize at p and apply exp*. Its image ω_{γ,r,n} lies in S(f)⊗Q(ζ_pⁿ). For any χ:G_n→C^×, the map x⊗y↦∑_σ χ(σ)σ(y)per_f(x)^± sends ω to (2πi)^(k−r−1)L_{ {p} }(f*,χ,r)γ^±, with ±=(−1)^(k−r−1)χ(−1). The twist isomorphism sends the Iwasawa action of σ to κ(σ)^(k−r) times its action on the twisted target; hence twist_j(σx)=κ(σ)^(−j)σ twist_j(x). A root of unity at one finite level is not a substitute for this representation twist. The map is unique under these critical characterization properties, using Kato’s rational H¹ input.

Hypotheses and domain:

- f normalized, k≥2; p any prime and λ|p; γ is F-rational for the complex comparison.
- The CM construction is conditional on its H²/H¹ supplier; the interpolation itself introduces no extra prime restriction.
- Twist source/target actions are distinguished, and χ is interpreted via κ on G_n.

Construction or proof outline:

1. Twist by k−r before specialization, using the compatible system of primitive roots and the induced completed group-ring automorphism.
2. Apply the modular exp* computation and the archimedean critical formula to the smoothed generators.
3. Cancel smoothing in the localized class and use the finite-index/rational-membership argument of 13.12; uniqueness uses the separated family of specializations.

Direct prerequisites: `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `SelmerIwasawaCohomology:L3/iwasawa-twist`, `SelmerIwasawaCohomology:L3`.

Acceptance checks:

- k=2,r=1 has target V(f)(1).
- k=4,r=1 has target V(f)(3).
- γ is F-rational and the L-value uses f*, with only p omitted; the sign is fixed by k−r−1.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter III, Thm. 12.5(1), printed p. 221 (page image checked): The critical period formula uses the dual form f* and the factor (2πi)^(k−r−1), with the character-dependent sign.
- `kato-2004-asterisque-295`, Chapter III, Thm. 12.5(2), printed p. 221: Gives the torsion statement over Lambda tensor Q recorded in the statement.
- `kato-2004-asterisque-295`, Chapter III, Thm. 12.4(2), printed p. 221: Supplies the freeness input used in the third proofStep.

### Beilinson's regulator formula for the K_2 zeta element (Kato Thm. 2.6)

Node `KatoEulerSystems:L3/beilinson-regulator-and-the-archimedean-zeta-value`; comparison; proposed declaration `beilinsonArchimedeanRegulator`. Implementation status: **unchecked**.

Assume M,N≥2,M+N≥5 and prime(M)⊂prime(N). Let Z_{M,N}(s)=∑_(n,M)=1 T′(n)⟨1/n,1⟩*n^(−s), and let δ_{M,N} be the Poincaré-dual class of the path y↦ν(iy) from 0 to ∞ in relative cusp homology. The regulator of z_{M,N}={g_{1/M,0},g_{0,1/N}} is Z′_{M,N}(0)δ_{M,N}; here Z(0)=0, so the derivative is essential. Its f-quotient is Kato 6.6(2): for k=2 and sign −χ(−1), the χ-weighted regulator equals 2πi lim_(s→0) s^(−1)L_S(f*,χ,s)δ(f,1,ξ)^±. This is the archimedean weight-two input, distinct from the critical dual-exponential identity at r=1.

Hypotheses and domain:

- prime(M) contained in prime(N) -- the same inclusion hypothesis as in Thm. 9.5
- Z_{M,N}(s) converges for Re(s) > 2 and continues meromorphically; the formula is stated at a specific point and involves the derivative/limit there, since Z_{M,N}(0) = 0
- delta_{M,N} is defined by Poincare duality on the OPEN curve Y(M,N)(C), via H^1(Y(M,N)(C),Z) = H_1(X(M,N)(C),{cusps},Z), so the modular-symbol class is a relative homology class and its cusp endpoints matter
- the regulator target is H^1 with R(2)-coefficients; the plus/minus projection (delta pm iota^* delta)/2 by complex conjugation is used to split the statement

Construction or proof outline:

1. Use the imported Deligne/Beilinson regulator on K₂ with its real Tate-twist normalization.
2. Kato §§7.7 and 7.12 compare the Eisenstein pairing of the regulator with Z′(0) times the cusp path class; §§7.18–7.20 descend to Y(M,N).
3. Project to the f-quotient and character component. The simple vanishing at zero produces the derivative or s^(−1) limit, not Z(0) itself.

Direct prerequisites: `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`, `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `MotivicEtaleKTheory:M.8`.

Acceptance checks:

- Replacing Z′(0) by Z(0)=0 would falsely kill the regulator.
- The weight-two sign here is −χ(−1), unlike the r=1 critical sign χ(−1).
- The suggested signature must conclude regulator(z_K₂)=Z′(0)δ and the sign-projected character identity with 2πi times the leading dual L-value at zero; comparing two unequal scalars does not state this regulator theorem.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter I, Thm. 2.6, printed p. 127: Gives the hypothesis prime(M) in prime(N), the attribution to Beilinson, and the location of Kato's own proof (Sec. 7, read at its key comparison passages).
- `kato-2004-asterisque-295`, Chapter I, 2.7, printed pp. 127-128: Gives the exact definition of delta_{M,N} as the Poincare dual of a relative homology class of a path between cusps.
- `kato-2004-asterisque-295`, Chapter I, 2.5, printed p. 127: Gives the analytic properties of the operator-valued zeta function recorded in the hypotheses.

### Betti periods and critical zeta values

Node `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`; comparison; proposed declaration `archimedeanCriticalValues`. Implementation status: **unchecked**.

For normalized f=∑a_nq^n, F=Q(a_n), define f*=∑ā_nq^n. Kato’s S(f) is the one-dimensional Hecke quotient of M_k(X₁(N)), V_F(f) the two-dimensional quotient of H¹(Y₁(N),Sym^(k−2)H); each ι-eigenspace has dimension one. The period map per_f:S(f)→V_C(f) is induced by integration/Poincaré duality, not an arbitrary isomorphism. If ξ∈SL₂(Z), 1≤r,r′≤k−1, at least one equals k−1, and χ is a character of (Z/m)^× with prime(m)⊂S and prime(N)⊂S, then ∑_b χ(b) per_f(σ_b z_m(f,r,r′,ξ,S))^±=(2πi)^(k−r−1)L_S(f*,χ,r)δ(f,r′,ξ)^±, with ±=(−1)^(k−r−1)χ(−1). For c,d-normalized classes, replace δ by the explicit smoothed vector of 6.6; in the SL₂ case it is (c²−c^u χ̄(c))(d²−d^v χ̄(d))δ, with u=r+2−k, v=r if r′=k−1, and u=k−r′, v=r′ if r=k−1 and c=d=1 mod N. The modular-form zeta input of 4.2 is the explicit Eisenstein product: z_(M,N)(k,r,r′)=(−1)^r (r−1)!^(−1) M^(k−r−2) N^(−r) F^(k−r)_(1/M,0) E^r_(0,1/N) if r′=k−1, and (−1)^r′ (k−2)!^(−1) M^(r′−k) N^(−r′) E^(k−r′)_(1/M,0) F^r′_(0,1/N) if r=k−1. Here the normalized E,F series are imported from ModularForms Layer 0 with the exact additive-index comparison. Insert their c,d smoothings to define c,d-z; then trace/pull back as in 5.2 and project to f. At r=r′=k−1 the definitions agree because E¹=F¹. For h=2 the E smoothing uses its regularized version; no unsmoothed holomorphic E² is asserted.

Hypotheses and domain:

- m≥1, ξ∈SL₂(Z); prime(mN)⊂S; the displayed unsmoothed formula is the source’s 5.2.3 case.
- For normalized versions (c,6mp)=(d,6Nmp)=1 where p is used in the arithmetic comparison, c=d=1 mod N and all source 5.2.1–5.2.2 range restrictions hold.
- Complex conjugation on coefficients defines f*; it is not merely a change of notation for f.
- The unsmoothed formula requires (r,r′)≠(2,k−1),(k−1,2),(k−1,k−2). The c,d-normalized formula uses 5.2.1–5.2.2 and has no such unsmoothed exclusion.

Construction or proof outline:

1. Use the imported modular-symbol period pairing to form the Hecke quotients and period map, as in 6.3.
2. Kato §§4–5 construct Eisenstein zeta elements and modular-symbol δ classes; §§7.12–7.20 prove their value formula by the Eisenstein/Poincaré pairing and reduction from Y(M,N).
3. Project the operator-valued formula to f and its dual form, obtaining 6.6. Keep the smoothing scalar exponents from 4.2.4. The period pairing and archimedean regulator are the exact supplier exports requested below.

Direct prerequisites: `ModularSymbolsPadicLFunctions:L0`, `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `mathlib:CuspForm`, `mathlib:LSeries`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

Acceptance checks:

- At k=2,r=1 the 2πi power is zero and the sign is χ(−1).
- At k=4,r=2 the sign is −χ(−1).
- The F-rational source vector δ determines the periods; replacing it rescales the formula.
- At k=4,r=r′=3 both products have coefficient −M^(−1)N^(−3)/2 because E¹=F¹. The smoothing exponents are (u,v)=(1,3).

Source correspondence:

- `kato-2004-asterisque-295`, 6.3–6.6, pp.161–163; 4.2.4 and 7.12–7.20: The image-quotient period and the displayed critical formula fix f*, the period power and the sign.
- `kato-2004-asterisque-295`, 4.2–4.2.4, pp.142–143: The page images give the product scalars, regularized weight-two smoothing and the two cases of (u,v); 6.6 refers to these exponents.

### Parabolic full-level uniqueness

Node `KatoEulerSystems:L3/parabolic-full-level-characterisation`; theorem; proposed declaration `parabolicFullLevelCharacterisation`. Implementation status: **unchecked**.

Atlas planet: **Parabolic zeta characterization**.

Let N≥3,k≥2,prime(Np)=Σ,n≥1,(n,Np)=1,c≥2,(c,6Nnp)=1. On parabolic cohomology H¹(X(N),j_*V_k), H¹_Iw(Z[1/Σ_n,ζ_n],−(i)) is Λ_n-torsion-free for every integer i, and the inverse-limit exp* at twist 1 into lim_m S_k(N)⊗Q(ζ_np^m)⊗Q_p is injective. Import the rational Drinfeld–Manin splitting s_N from R10. Then s_N(c-z^Iw_{N,n}(k,v)) is the unique rational parabolic class whose images after twist 1−k, specialization, loc_p and exp* lie in S_k(N)_Q⊗Q(ζ_np^m) and satisfy per(ω_m)=(2πi)^(1−k)Z_{Σ,np^m}(k−1)s_N(c-δ_{N,np^m}(k,v)) in H¹(X(N)(C),j_*V_k)⊗_(C[±1]) C[Gal(Q(ζ_np^m)/Q)]. These torsion-freeness and injectivity assertions are not asserted on the open curve Y(N).

Hypotheses and domain:

- v∈Sym^(k−2)(Z²)^* for the rational period characterization.
- The splitting is rational and Hecke/Galois equivariant; integral splitting is not claimed.

Construction or proof outline:

1. Import the actual rational splitting and its full-level comparison.
2. Use Nakamura Lemma 3.4 (attributed to [20], Proposition 3.1.3 and Lemma 3.1.4); this parabolic injectivity input is not inferred from generic local exp*.
3. Apply Theorem 3.2 to the L2 class and its split image. Injectivity proves Corollary 3.6’s uniqueness.

Direct prerequisites: `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`, `ModularSymbolsPadicLFunctions:L0/drinfeld-manin-splitting`, `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

Acceptance checks:

- Test N=3,k=2: the coefficient polynomial degree is zero but the parabolic target remains required.
- The proof must not replace X(N),j_*V_k by Y(N),V_k.
- The complex period equation lives in the ±1 tensor quotient.

Source correspondence:

- `nakamura-2023-published`, Lemma 3.4, Remark 3.5, Corollary 3.6, pp.221–222: The parabolic target, inverse limit and rational splitting are necessary for the characterization.

### The refined scalar regulator of the Kato class

Node `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`; construction; proposed declaration `katoScalarRegulator`. Implementation status: **unchecked**.

Atlas planet: **Refined scalar regulator**.

Fix the roots/embeddings above, a nonzero ω∈S(f*), γ∈V_F(f*) with γ⁺,γ⁻≠0, and a nonzero refinement α, a root of X²−a_pX+ε(p)p^(k−1) (ε(p)=0 at bad level), with v_p(α)<k−1 for the small-slope endpoint. Set per(ω)=Ω_+γ⁺+Ω_-γ⁻. Apply twist_k to z^Ka_γ(f*), then loc_p to V(f*)(k). Under V(f*)(k)^*(1)≅V(f), choose η in the φ=α eigenline of D_crys(V(f)) with ⟨ω,η⟩=1. The scalar arithmetic distribution is L_η(loc_p twist_k z^Ka_γ(f*)), using R09’s vector regulator followed by the pairing with η. On the de Rham domain of Kato 16.4, require D_crys(V^*(1))⊂F⁰D_dR(V^*(1)), retain singular Euler operators on their stated domain, and use its scalar de Rham extension; a general infinite-slope form has no nonzero crystalline refinement and hence no α-projection.

Hypotheses and domain:

- The noncritical slope hypothesis proves ⟨ω,η⟩≠0 by weak admissibility; normalize η by this pairing.
- For crystalline V use the vector regulator supplier. For merely de Rham V the extension of Kato 16.4 is an explicit supplier request/gap.
- Periods and Gauss sums use the same roots and embeddings as the analytic distribution.

Construction or proof outline:

1. Use the L2 twist and the representation dictionary to feed the correct local Iwasawa representation into the regulator.
2. Apply Kato 16.6(1): a φ=α eigenvector cannot lie in F^(k−1) if its slope is below k−1, giving the nonzero pairing.
3. Define the scalar map by the normalized η-pairing. This is additional data, not a scalar regulator canonically determined by V alone.

Direct prerequisites: `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, `PadicHodgeRegulators:L3/scalar-projection`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/growth`, `AutomorphicGaloisRepresentations:R19.5`, `PadicHodgeRegulators:L3`.

Uses determining the API:

- `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`: Identify with the analytic distribution by interpolation and growth.
- `KatoEulerSystems:L4/ordinary-selmer-divisibility`: Its local image ideal enters the Selmer bound.

| Proposed API name | Role | Mathematical statement |
| --- | --- | --- |
| `katoScalarRegulator` | constructor | The η-projection of the imported vector regulator on loc_p twist_k z_γ(f*). |
| `katoScalarRegulator_def` | characterisation | The result is projection_eta(regulator(localized_twisted_class)). |
| `katoScalarRegulator_linear` | structure | It is linear in the local cohomology class and in the projection η. |
| `katoScalarRegulator_scale` | compatibility | Replacing ω by aω and γ by bγ multiplies the result by a^(−1)b. |
| `katoScalarRegulator_projection_add` | structure | The scalar regulator is additive in the projection η as well as linear in the cohomology class. |

Unit tests (suggested `example` signatures with admitted proofs):

- `scalar_zero` (degenerate): The zero local class gives the zero distribution.
- `scalar_add` (compatibility): The regulator of x+y is the sum of the regulators.
- `scalar_period_scale` (characterisation): Scaling the normalized η-projection by a^(−1) and the class by b scales the output by a^(−1)b.
- `scalar_identity_maps` (computation): With regulator and projection id on Q, katoScalarRegulator sends 1 to 1.

Acceptance checks:

- Scaling ω by a and γ by b scales the result by a^(−1)b.
- At k=2 the input local representation is V(f*)(2), identified on the regulator dual side with V(f).
- At split multiplicative weight two the augmentation factor vanishes at the trivial character; it is not inverted.

Source correspondence:

- `kato-2004-asterisque-295`, 16.4–16.6, pp.270–271: The normalized crystalline line and correctly twisted local class define the scalar arithmetic distribution.

### The noncritical analytic–arithmetic equality

Node `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`; theorem; proposed declaration `noncriticalAnalyticArithmeticComparison`. Implementation status: **unchecked**.

Atlas planet: **Analytic–arithmetic equality**.

Under the scalar node’s small-slope hypotheses, the arithmetic distribution equals the R10 analytic p-adic L-function normalized by Ω_±. For χ of exact p^n conductor, n≥1, 1≤r≤k−1, its value at κ^rχ^(−1) is (r−1)!p^(nr)α^(−n)G(χ,ζ_pⁿ)^(−1)(2πi)^(k−r−1)L_{{p}}(f,χ,r)/Ω_±, with ±=(−1)^(k−r−1)χ(−1). At κ^r its value is (r−1)!(2πi)^(k−r−1)(1−p^(r−1)α^(−1))(1−ε(p)p^(k−r−1)α^(−1))L(f,r)/Ω_±, ±=(−1)^(k−r−1). The arithmetic and analytic growth bounds lie in the same admissible distribution space; Kato 16.3/R10’s small-slope uniqueness then prove equality.

Hypotheses and domain:

- α≠0 and v_p(α)<k−1; periods and Gauss sum G=∑χ(b)ζ_pⁿ^b use the stated convention.
- The χ-period Kato formula used f*, but the scalar construction starts from f* and hence produces L(f,χ,r).

Construction or proof outline:

1. Apply the imported regulator’s ramified/unramified interpolation formulas to the L2 class and use L3 critical reciprocity.
2. Compare each factorial, 2πi power, inverse Gauss sum, α power, χ inverse, and the two trivial-character Euler factors against the R10 period dictionary.
3. Use the regulator growth bound and analytic admissibility. The k−1 critical weights separate this noncritical space; critical slope cannot reuse this argument.

Direct prerequisites: `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `ModularSymbolsPadicLFunctions:L2/p-adic-l-function`, `ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness`, `ModularSymbolsPadicLFunctions:L1/period-lines`, `PadicHodgeRegulators:L3/ramified-interpolation`, `PadicHodgeRegulators:L3/unramified-interpolation`, `ModularSymbolsPadicLFunctions:L1`, `PadicHodgeRegulators:L3`.

Acceptance checks:

- At r=1 the factorial is 1 and p^(nr) is p^n.
- At k=2,r=1 the trivial-character factors are (1−α^(−1))(1−ε(p)α^(−1)).
- Ordinary slope zero lies in the noncritical domain.

Source correspondence:

- `kato-2004-asterisque-295`, Theorem 16.2, Remark 16.3, Theorem 16.6(2), pp.269–271: The exact interpolation and growth uniqueness identify the scalar image with the analytic construction.

### Critical and bad-reduction comparison domains

Node `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`; comparison; proposed declaration `criticalBadReductionComparison`. Implementation status: **unchecked**.

For a critical refinement, equality of the scalar arithmetic object and the R10 critical analytic distribution is a comparison on the eigensymbol/family domain supplied by ModularSymbolsPadicLFunctions:L3/family-comparison-principle. It requires an analytic family carrying the chosen refinement, a compatible arithmetic zeta section, fixed period normalization on a common dense noncritical locus, and specialization compatibility of both regulators and eigensymbols. Those hypotheses imply equality on the family and at the chosen fiber by the supplier’s separatedness theorem. Interpolation of a single critical fiber is not a uniqueness hypothesis. For bad reduction the scalar object is defined only on the domain of Kato 16.4’s de Rham regulator extension; if α=0 or no crystalline line exists, retain the vector/de Rham regulator comparison and do not state a scalar α-equality.

Hypotheses and domain:

- Critical arithmetic section and its specialization are a precise unresolved input, not inferred from Kato 16.6.
- The generic analytic critical distribution and comparison principle remain R10-owned.
- The de Rham containment in 16.4.1 and every kernel/cokernel correction at a singular Euler operator remain visible.
- For the inspected R10 family principle, the chosen critical refinement is a DECENT point with the supplied affinoid neighborhood, a Zariski-dense noncritical locus and compatible periods whose normalization factors do not vanish there. The arithmetic section must exist on that same neighborhood. Mere existence of an unspecified family is weaker than the supplier hypothesis.

Construction or proof outline:

1. Import the R10 critical family principle and its exact hypotheses.
2. Record the absent family zeta specialization input and de Rham regulator extension as gaps; neither is supplied by a formal dimension argument.
3. On a supplied compatible family use dense noncritical equality and specialization. On a bad-reduction domain use the stated de Rham regulator theorem without replacing it by a crystalline theorem.

Direct prerequisites: `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `ModularSymbolsPadicLFunctions:L3/family-comparison-principle`, `ModularSymbolsPadicLFunctions:L3/critical-slope-non-uniqueness`, `PadicHodgeRegulators:L3`.

Acceptance checks:

- Do not infer a critical equality from the finite set of interpolated values.
- The α=0 infinite-slope case has no α^(−n) scalar formula.
- No dependency from the construction of geometric Kato classes to the family theorem is introduced.

Source correspondence:

- `kato-2004-asterisque-295`, 16.4, Remark 16.5(2), Theorem 16.6 proof, pp.270–271: The de Rham extension is stated separately; the nonzero pairing in 16.6 uses the strict slope inequality.

### The elliptic local lattice and Kato period

Node `KatoEulerSystems:L3/elliptic-dual-exponential-and-kato-period`; comparison; proposed declaration `ellipticLocalLattice`. Implementation status: **unchecked**.

Let E/Q be modular of conductor N, T=T_pE, ω_E a minimal Néron differential, Ω_E its real period, and E₁(Q_p) the kernel of reduction. For p odd, exp*_{ω_E}(H¹_s(Q_p,T))=[E(Q_p):E₁(Q_p)+E(Q_p)_tors]p^(−1)Z_p. Kato’s constructed Euler system, after the weight-two representation dictionary and the integral modular parametrization denominator, has a positive integer r_E independent of p such that exp*_{ω_E}(loc^s_p c_Q)=r_E L_{Np}(E,1)/Ω_E, and ∑_γ χ(γ)exp*_{ω_E}(loc^s_p c^γ_{Q_n})=r_E L_{Np}(E,χ,1)/Ω_E. The character formula uses the cyclotomic Z_p-extension Q_n and the same ω_E and roots. At p=2 use the corrected local logarithm lattice, not the printed odd-prime formula.

Hypotheses and domain:

- The scalar exp* is the Tate-pairing adjoint of the formal-group logarithm, imported from R09 L1.
- The index in the lattice formula is a finite local index; it is not |E(F_p)| at bad reduction.
- The Euler system is the actual L2 member transported to T_pE, not an assumed family.

Construction or proof outline:

1. Use the elliptic Weil pairing and the imported exp* to identify H¹_s with Hom(E(Q_p),Q_p). The pairing is x↦Tr(λ_E(x)exp*_{ω_E}(z)).
2. For odd p the formal logarithm maps E₁(Q_p) to pZ_p. Comparing λ_E(E(Q_p)) with this lattice proves Proposition 5.1.
3. Project the L2 modular classes in weight two; choose the integral period/modular parametrization factor r_E and use L3 reciprocity for Theorem 5.3. Preserve the removed Euler factors at Np.

Direct prerequisites: `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice`, `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `PadicHodgeRegulators:L1/dual-exponential`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`.

Acceptance checks:

- At good reduction the local index divides |Ẽ(F_p)|.
- The r_E is fixed independently of p; changing the differential changes the period normalization.
- Do not assert λ_E(E₁(Q₂))=2Z₂.
- The suggested signature must identify the exp* image lattice at odd p, retain the actual total logarithm lattice through Tate adjointness at p=2, and state the actual Kato period and character sum with removed Euler factors and the fixed positive r_E.

Source correspondence:

- `rubin-euler-systems-draft`, III.5.1–5.3, pp.47–49: The local lattice and actual Euler-system period are distinct inputs to the Selmer application; E2 adds the necessary odd-prime condition.

## L4: Nonvanishing and divisibility

The non-CM open-image theorem verifies the rational unipotent and irreducibility hypotheses at every p, while exact integral hypotheses are stronger. Analytic twist nonvanishing detects geometric zeta classes independently of the rational map. The ES weak-Leopoldt and Euler-characteristic inputs give the non-CM rational module structure; the CM proof belongs to an early all-prime elliptic-unit supplier. This ordering prevents a construction/nonvanishing cycle.

The resulting map has nonzero span in every height-zero component and a torsion quotient. The imported generic bound is then compared with strict H² and local corrections to obtain the cohomological upper bound. Ordinary local conditions and the normalized regulator identify the Selmer quotient with the analytic p-adic L-value under their lattice hypotheses. There is no reverse divisibility in this layer.

Rubin’s elliptic application adds real arithmetic statements to those generic bounds: finite generation over the cyclotomic tower, ordinary and multiplicative Coleman images, Greenberg’s absence of finite submodules, and the rank-zero p-part upper bound. Split multiplicative reduction keeps the augmentation ideal, and the rank-zero finite-level inequality uses an exact control correction. Characteristic ideals alone cannot see a finite submodule or prove its absence.

### The generic bound applied to the modular Euler system

Node `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`; theorem; proposed declaration `modularEulerSystemBound`. Implementation status: **unchecked**.

For non-CM f and the concrete L2 conductor Euler system, apply ES.8/rubin-rational-iwasawa-divisibility with the verified Hyp(Q_∞,V) and Hyp(Q_∞/Q). If its Iwasawa component is non-torsion, the restricted dual Selmer module X_strict is torsion and char_Λ(X_strict) divides p^t ind_Λ(c) for some t≥0. After inverting p this is an exact divisibility. With p odd and the full integral package Hyp(Q_∞,T), apply ES.8/rubin-iwasawa-divisibility to remove p^t. The modular purity hypothesis of Kato 13.4(iii) is imported from strict compatibility. R07 Poitou–Tate identifies X_strict with the global-to-local H² kernel at the height-one localization used; the evaluation ideal equals the index of the generated zeta submodule in rank-one free H¹. These are modular instantiations of existing machines, not a second definition or proof of an abstract Euler-system bound.

Hypotheses and domain:

- T a stable O_λ-lattice, Λ on a cyclotomic character component; no ordinary assumption for the cohomological bound.
- Non-torsion is proved by the analytic node and L3; it is not inferred from an unspecified ES member.
- The integral package includes residual irreducibility and the FREE rank-one τ quotient; x≠0 alone does not give it.
- The Poitou–Tate and evaluation-index comparison is localized as stated, retaining the local H² correction.
- Kato 13.4(ii) is dim(V⁺)=dim(V⁻)=1 (oddness); purity is (iii), irreducibility (iv), and the rational rank-one τ quotient (v). Use the R19.1 newform realization for parity, not purity in its place.

Construction or proof outline:

1. Apply the existing ES.8 theorem to the L2 adapter and the rational or integral hypothesis package verified by the unipotent node. Work on Q_∞ components and transport finite tame-character components with the supplier’s twisting/descent API.
2. Identify the strict dual Selmer module with ker(H²_global→H²_local) by the imported R07 duality sequences and the non-p local unramified conditions.
3. On rank-one free H¹, the evaluation ideal ind(c) is the principal index ideal of Λc. Pass to the generated geometric zeta submodule using its smoothed generator comparison.
4. Rational localization kills the bounded p-power error. Integrally remove it only under the complete integral hypotheses, not a rational open-image statement.

Direct prerequisites: `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice`, `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`, `EulerSystemsAndKolyvaginSystems:ES.8/rubin-rational-iwasawa-divisibility`, `EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility`, `EulerSystemsAndKolyvaginSystems:ES.8/lambda-index`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L2/selmer-poitou-tate-limit`, `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`.

Acceptance checks:

- No edge to EulerSystemsCyclotomicMainConjecture is used.
- The output is an ideal inclusion ind(c)⊂char(X_strict), equivalently char(X_strict) divides ind(c).
- The local H² contribution is added in the cohomological theorem, not discarded here.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter III, Thm. 13.4, printed p. 226: The bound requires the five arithmetic hypotheses and the specified zeta span, index ideal and strict H² kernel; each is retained in this node.
- `kato-2004-asterisque-295`, Chapter III, Thm. 13.4(2)(3), printed p. 226: Gives the two bounds and the extra integral hypotheses of (3), including p not equal to 2.
- `kato-2004-asterisque-295`, Chapter III, 13.1 and after Thm. 13.4, printed pp. 224, 226: Records both that Thm. 13.4 is imported and which of its hypotheses Kato verifies in the modular case, including the explicit failure of (v) for CM forms.
- `rubin-euler-systems-draft`, Chapter II, Thm. 3.3, printed p. 28: This is the form in which the imported bound appears in Rubin's monograph; the node's proofSteps record that Kato's hypothesis package (i)-(v) is not literally Rubin's Hyp(K_infinity,T) plus Hyp(K_infinity/K).
- `rubin-euler-systems-draft`, Chapter II, Hyp(K_infinity,T), printed p. 27: Rubin requires irreducibility over G_{K_infinity}; Kato's hypothesis (iv) instead names Gal(Qbar/Q). The comparison must justify this change of group.
- `rubin-euler-systems-draft`, Chapter II, Hyp(K_infinity/K) and Def. 3.1, printed p. 27: Shows that Rubin's second hypothesis is automatic over Q, and gives the definitions of X_infinity and ind_Lambda(c) that the comparison with Kato's H^2(T)_0 and J must go through.

### Nonvanishing of Z at every height-zero prime (Kato Prop. 13.7)

Node `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`; theorem; proposed declaration `zetaSubmoduleNonvanishing`. Implementation status: **unchecked**.

Atlas planet: **Nonvanishing at height zero**.

For every f,k,p,λ in the rational map node, the Λ_Q-submodule Z(f) generated by z^Ka(V_Fλ(f)) is nonzero at every height-zero prime, and H¹(V)/Z(f) is Λ_Q-torsion. Equivalently, the rank-one H¹ module is generated up to torsion by the values of the actual Kato map. At every height-zero component choose a modular-symbol generator with a nonzero relevant sign; infinitely many finite cyclotomic characters avoid both the analytic exceptional set and the smoothing zeros. L3 then detects its zeta value. This is the nonzero-map/torsion-quotient input used in Burungale–Tian Theorem 2.4 at arbitrary p, not a main-conjecture equality.

Hypotheses and domain:

- The CM rational map and module structure remain conditional on their earlier supplier gap.
- A nonzero map is asserted; an arbitrary γ with both components zero is not declared to have a nonzero image.

Construction or proof outline:

1. Apply the analytic geometric-class detection before division by the smoothing operators.
2. Use the L2 map’s generator characterization and rational membership to transfer detection to Z(f).
3. At each component use the rank-one freeness from 12.4; a nonzero span has torsion quotient.

Direct prerequisites: `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`.

Acceptance checks:

- A γ=0 produces zero: the theorem states nonzero map/nonzero span.
- CM and p=2 are retained at the rational level.
- The statement gives torsion quotient, not a characteristic-ideal equality.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter III, Prop. 13.7, printed p. 227: Gives the statement and the opening of the proof, including the sign convention and the exact conditions on c and d recorded in the second proofStep.
- `kato-2004-asterisque-295`, Chapter III, Thm. 13.5, printed pp. 226-227: Gives the two analytic inputs with their hypotheses, in particular the weight-parity condition in (2) recorded as a hypothesis.
- `kato-2004-asterisque-295`, Chapter III, Thm. 13.6, printed p. 227: The full-level generating vector has both level indices equal to L. This distinction is needed before projection to the eigenform.
- `kato-2004-asterisque-295`, Chapter III, proof of Prop. 13.7, printed p. 227: Gives the final step of the argument recorded in the fourth proofStep.
- `burungale-tian-2025-v2`, Theorem 2.4 and Remark 2.5, pp.4–5: The map and its torsion quotient are exactly the two rational inputs of the application.

### One divisibility in the cohomological main conjecture for modular forms

Node `KatoEulerSystems:L4/cohomological-divisibility-one-direction`; theorem; proposed declaration `cohomologicalDivisibility`. Implementation status: **unchecked**.

Atlas planet: **One divisibility, cohomological**.

With Lambda = O_lambda[[G_infinity]] and H^q(T) = lim_n H^q(Z[zeta_{p^n},1/p],T): (a) for every height-one prime p of Lambda not containing p, length_{Lambda_p}(H^2(V_{F_lambda}(f))_p) <= length_{Lambda_p}(H^1(V_{F_lambda}(f))_p / Z(f)_p) + length_{Lambda_p}(H^2_loc(V_{F_lambda}(f))_p), and the local term is nonzero only in the exceptional configuration (12.5.1): k = 2, f not potentially of good reduction at p, p the kernel of the ring map Lambda -> F_lambda induced by kappa^{-2} chi for a finite-order character chi, in which case that local length equals 1. (b) If p is not 2 and T admits a basis for which the image of Gal(Qbar/Q(zeta_{p^infinity})) -> GL_2(O_lambda) contains SL_2(Z_p) (condition (12.5.2)), then Z(f,T) is contained in H^1(T) and length_{Lambda_p}(H^2(T)_p) <= length_{Lambda_p}(H^1(T)_p / Z(f,T)_p) for every height-one prime p except in the configuration (12.5.1). This is one inequality of Conjecture 12.10 (the main conjecture for modular forms), whose statement asserts equality; the reverse inequality is not proved here.

Hypotheses and domain:

- (a) excludes height-one primes containing p; (b) removes that exclusion only under (12.5.2) and p not 2
- (12.5.2) is a large-image condition on the restriction to Gal(Qbar/Q(zeta_{p^infinity})); by Ribet's theorem it holds for almost all lambda when f has no CM, and Kato notes that if it holds for one stable lattice it holds for all
- the exceptional configuration (12.5.1) is genuinely present and contributes a local length 1; it occurs only in weight 2 with f not potentially of good reduction at p
- the conclusion is an inequality of lengths at each height-one prime, equivalent to a divisibility of characteristic ideals; Conjecture 12.10 asserts the corresponding equality and remains a conjecture in Kato's text
- The non-CM Euler-system proof is supplied here. For CM, part (a) additionally requires the elliptic-unit local-length comparison of Kato 15.13–15.17, beyond H² torsion and H¹ freeness; this is part of the unstaged supplier gap. No reverse divisibility is concluded.
- For Nakamura’s twist-one lattice formulation (Theorem 5.2), retain p odd, residual ABSOLUTE irreducibility and a τ with free rank-one quotient; the bound is for the global-to-local H² kernel.

Construction or proof outline:

1. For non-CM f apply the modular ES.8 bound after verifying the rational or integral image conditions. For CM the separate elliptic-unit comparison of 15.13–15.17 is a supplier gap; module structure alone does not imply this bound.
2. Compare the geometric zeta span and the Kato map’s span using 12.6 and its finite-index smoothing theorem.
3. The localized exact sequence 0→H²_0→H²→H²_loc adds the local length. Kato 12.2/13.13 identifies the exceptional local rank-one term in configuration 12.5.1.
4. Use characteristic-ideal multiplicativity to translate lengths: length H²≤length(H¹/Z)+length H²_loc. Under full integral conditions obtain the exact inequality off the exceptional prime; otherwise retain the p-power error at primes over p.
5. Transport the argument by Appendix A’s twists for Nakamura 5.2; do not enlarge its residual-absolute-irreducibility hypothesis.

Direct prerequisites: `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`, `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

Acceptance checks:

- Check that the divisibility obtained is stated at each height-one prime separately and is not upgraded to an equality anywhere in Sec. 12-13.
- Check the exceptional configuration (12.5.1) explicitly in a weight-2 multiplicative-reduction example; a statement without the local term is not the source statement.
- Check that (12.5.2) is a hypothesis on the image of the restricted Galois representation, and that the conclusion Z(f,T) contained in H^1(T) is part of (b), not an input.
- Inclusion direction is char(H¹/Z)·char(H²_loc)⊂char(H²); equality is not an output.
- At an exceptional multiplicative weight-two prime the local length is 1.
- At primes above p the rational theorem gives no exact integral bound.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter III, Thm. 12.5(3), printed pp. 221-222: Gives inequality (a), the exclusion of primes containing p, and the exact exceptional configuration with its local length 1.
- `kato-2004-asterisque-295`, Chapter III, Thm. 12.5(4) and (12.5.2), printed p. 222: The displayed inequality uses rational coefficients. Proof 13.14 instead applies the integral bound 13.4(3); E8 records the intended lattice formulation.
- `kato-2004-asterisque-295`, Chapter III, Conjecture 12.10, printed pp. 223-224: Confirms that equality is the conjecture and that Kato proves only the inequality; this is the basis for the node's final sentence.
- `nakamura-2023-published`, Theorem 5.2, pp.253–254: The twist-one integral restatement bounds the H² kernel with the additional residual and τ hypotheses.
- `kato-2004-asterisque-295`, 13.14, p.234: The printed display uses rational V, while the proof uses H¹(T), Z(f,T) and the integral bound 13.4(3). The node follows the lattice statement justified by that proof, as recorded in E8.

### The good-ordinary Selmer divisibility against the p-adic zeta function

Node `KatoEulerSystems:L4/ordinary-selmer-divisibility`; theorem; proposed declaration `ordinarySelmerDivisibility`. Implementation status: **unchecked**.

Atlas planet: **Ordinary Selmer divisibility**.

Suppose f has good ordinary reduction at lambda, i.e. (Prop. 17.1) p does not divide N and a_p is a unit in O_lambda; equivalently V_{F_lambda}(f) is crystalline at p and contains a unique one-dimensional Gal(Qbar_p/Q_p)-stable subspace V'_{F_lambda}(f) which is unramified. Let T be a Gal(Qbar/Q)-stable O_lambda-lattice, T' = T intersect V'_{F_lambda}(f), T'' = T/T', and define Sel_infinity(T) = lim_n Sel(Q(zeta_{p^n}), T(r))(-r) (independent of r for 1 <= r <= k-1 by Prop. 17.2) and X(T) = Hom_{O_lambda}(Sel_infinity(T), F_lambda/O_lambda), a finitely generated Lambda-module. Then (Thm. 17.4): (1) X(T) is a torsion Lambda-module; (2) for alpha as in 17.1, omega a nonzero element of S(f^*) and gamma in V_F(f^*) with the two sign components nonzero, L_{p-adic,alpha,omega,gamma}(f) lies in Lambda tensor Q and length_{Lambda_p}(X(T)_p) <= ord_p(L_{p-adic,alpha,omega,gamma}(f)) for every height-one prime p not containing p; (3) if in addition omega and gamma are good for the stable dual lattice U≅T^*(1−k) in V_Fλ(f*) in the sense of 17.5 (correcting E9), p is not 2, and condition (12.5.2) holds, then L_{p-adic,alpha,omega,gamma}(f) lies in Lambda and the same length inequality holds for every height-one prime p.

Hypotheses and domain:

- good ordinary reduction at lambda in the precise sense of Prop. 17.1: p does not divide N AND a_p is a lambda-adic unit; the two conditions together are equivalent to the crystalline-plus-unramified-line condition (iii)
- Prop. 17.2's independence of r holds for 1 <= r <= k-1 and is what makes Sel_infinity(T) well defined; it is proved by identifying the Selmer group with an explicit kernel
- in (2) the p-adic L-function depends on the choices of alpha (the unit root), omega in S(f^*) and gamma in V_F(f^*), and lies a priori only in Lambda tensor Q
- For (3), put U≅T^*(1−k)⊂V_Fλ(f*). Apply 17.5 to f*,U: ω∈S(f*) maps to an O_λ-basis of H⁰(Q_p,Z_p^{ur-hat}⊗U″(k−1)), and γ⁺,γ⁻ are bases of U⁺,U⁻. The integral Selmer module in the conclusion is X(T). The printed V(f) in 17.4(3) is the f/f* misprint E9; 17.6 and 17.13 fix the dual-lattice relation.
- condition (12.5.2) is again the large-image hypothesis, and p not equal to 2 is required

Construction or proof outline:

1. Use 17.1–17.2 to identify the ordinary local condition as the T′ kernel, with the representation convention already fixed in L3.
2. Apply the R07 Poitou–Tate exact sequences to compare the strict cohomological bound with the ordinary dual Selmer module.
3. The normalized scalar regulator identifies the local quotient index with the analytic distribution by 16.6; for the exact integral result use the integral local-image theorem with the GOOD periods/lattice condition of 17.5.
4. Use characteristic-ideal multiplicativity and the cohomological inequality. Keep the rational restriction off p and the stronger integral assumptions distinct.

Direct prerequisites: `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L2/selmer-poitou-tate-limit`, `PadicHodgeRegulators:L3/scalar-projection`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`, `PadicHodgeRegulators:L3`.

Acceptance checks:

- Check that the ordinary hypothesis is used twice: once to define the Selmer local condition at p through the unramified line, and once to construct the p-adic L-function with the unit-root refinement alpha.
- Check the goodness condition 17.5 on omega in a weight-2 example: omega must be a Neron differential, and using a non-Neron differential changes the p-adic L-function by a power of p.
- Check that (1) is a torsion statement for X(T), not for a Selmer group without local conditions; it is the ordinary analogue of the weak Leopoldt statement in Thm. 12.4(1).
- Check that the theorem is one divisibility only; Kato does not assert the reverse divisibility anywhere in Sec. 17.
- The exact integral local-image result is requested from R09; the generic scalar projection alone does not give it.
- If periods are rescaled by a nonunit, the integral conclusion changes by its valuation.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter IV, Prop. 17.1, printed p. 272: Gives the three equivalent formulations of good ordinary reduction, including the unit-root condition and the unramified line, as recorded in the hypotheses.
- `kato-2004-asterisque-295`, Chapter IV, 17.3 and Thm. 17.4, printed p. 273: Gives the definition of X(T), the independence of r, and statements (1) and (2) with the exclusion of primes containing p.
- `kato-2004-asterisque-295`, Chapter IV, Thm. 17.4(3) and 17.5, printed pp. 273-274: Gives statement (3) with the goodness hypothesis and its concrete weight-2 interpretation as the Neron differential, recorded in the hypotheses and acceptance.
- `kato-2004-asterisque-295`, Chapter IV, Prop. 17.2, printed pp. 272-273: Gives the ordinary filtration and the independence-of-r statement recorded in the second proofStep.
- `kato-2004-asterisque-295`, 17.6 p.274; proof 17.13 pp.279–280: The proof chooses a lattice U in V(f*) and bounds X(U*(1−k)). Its goodness condition belongs to the chosen differential in S(f*).

### Non-CM large image and the CM boundary

Node `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`; lemma; proposed declaration `nonCmLargeImage`. Implementation status: **unchecked**.

For non-CM f, Kato 12.8.2 supplies, for every λ|p, a stable lattice whose image contains an open subgroup of SL₂(Z_p). In the cyclotomic kernel choose a nontrivial unipotent τ=[[1,x],[0,1]], x≠0, in that subgroup: det τ=1, the cyclotomic character is trivial, and dim_E V/(τ−1)V=1. Rational irreducibility over the cyclotomic tower follows from this open SL₂ subgroup. Thus the rank-one and irreducibility clauses of Hyp(Q_∞,V) hold at every p. If the image contains all SL₂(Z_p), take x=1; then T/(τ−1)T is free of rank one and the residual representation is irreducible. The stronger condition is guaranteed only at almost all λ by 12.8.1. For a CM representation, the torus/normalizer image has no such nontrivial unipotent; this Euler-system bound does not supply its rational H² input. That input must come first from the all-prime elliptic-unit layer, including p=2 and Q(i), before importing the Kato map; the reverse CM divisibility remains outside this packet.

Hypotheses and domain:

- Weight k≥2; the image statement concerns the cohomological representation and its cyclotomic restriction.
- The rational x may be divisible by p: an open subgroup does not imply x=1 integrally.
- For K=Q the extra unit and Hilbert-class-field restrictions in Rubin’s τ condition are automatic after working in the cyclotomic kernel.

Construction or proof outline:

1. Import the representation and determinant dictionary from R19.1; use the precise two statements quoted in Kato 12.8.
2. An open SL₂ subgroup contains upper and lower unipotents with parameter p^a; their common invariant lines show irreducibility after extension to E. Pick the upper unipotent for the rank-one quotient.
3. Full SL₂ gives parameter 1 and the standard residual irreducibility; only then invoke the integral generic hypothesis package.
4. Compare Rubin III.5.8 and Remark 5.10. At p=2 do not use the false integral H¹(GL₂(Z₂),W)=0 claim in the public draft.

Direct prerequisites: `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`.

Acceptance checks:

- With x=p²≠0 the rational rank-one quotient exists but the integral quotient has torsion.
- With x=1 the integral quotient is free of rank one.
- The CM elliptic-unit supplier cannot depend on the Kato map whose construction uses its H² result.
- The suggested signature must exhibit a nontrivial unipotent in the cyclotomic representation image, a rational rank-one cokernel and irreducibility. The separate integral companion requires full SL₂ image and has the primitive x=1 conclusion; the open-image result cannot supply that integral hypothesis.

Source correspondence:

- `kato-2004-asterisque-295`, Chapter III, after Thm. 13.4, printed p. 226: The generic large-image argument excludes CM forms; the separate elliptic-unit treatment is in §15.
- `kato-2004-asterisque-295`, Chapter III, Remark 12.8 and (12.8.1), (12.8.2), printed pp. 222-223: Gives the definition of CM and the two distinct large-image statements, with 'almost all lambda' in the first and 'open subgroup' in the second, as recorded in the hypotheses.
- `rubin-euler-systems-draft`, III.5.8–5.10, p.50: The concrete unipotent verifies the distinct rational and integral packages; the draft cohomology assertion needs E3.

### Analytic twists detect the modular zeta classes

Node `KatoEulerSystems:L4/analytic-twist-nonvanishing`; theorem; proposed declaration `analyticTwistNonvanishing`. Implementation status: **unchecked**.

For normalized f of weight k≥2 and ξ∈SL₂(Z), Ash–Stevens says the vectors δ(f,j,ξ), 1≤j≤k−1, span V_F(f). Jacquet–Shalika gives L(f*,k−1)≠0 for k≥3; Rohrlich gives nonvanishing of the weight-two L(f*,χ,1) for all but finitely many p-power conductor characters χ. For other critical integers, Kato 13.5(1) and the functional equation give nonvanishing off the center. Theorem 13.5(2) concerns only even weight and the central value k/2, with a finite exceptional set among characters whose conductor primes lie in a fixed finite S. After fixing a sign component and auxiliary c,d, infinitely many finite χ avoid both that exceptional set and the finitely many zeros of the smoothing operators. The L3 period equation then detects a nonzero localized/global zeta class in each height-zero component.

Hypotheses and domain:

- Use the entire modular L-function and its functional equation from the upstream ModularForms roadmap; LSeries by itself is a total sum, not analytic continuation.
- The normalization of f*, δ and the sign is the one in L3.
- At central weight-two critical value the statement uses sufficiently ramified twists, not nonvanishing of L(f,1) itself.

Construction or proof outline:

1. Use Kato 13.6 for the spanning statement and 13.5 for the analytic nonvanishing inputs.
2. For k≥3 the edge critical value k−1 is nonzero; for k=2 use Rohrlich’s cyclotomic-family theorem, keeping the finite exception set.
3. Evaluate smoothing at characters and exclude its finitely many zeros. Apply the regulator-period equality to a generator with the chosen nonzero sign.

Direct prerequisites: `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `ModularSymbolsPadicLFunctions:L0`, `mathlib:CuspForm`, `mathlib:LSeries`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

Acceptance checks:

- A form with L(f,1)=0 in weight two still has nonzero sufficiently ramified twists.
- The smoothing factor must be checked at the character used.
- Each sign/height-zero component must be detected separately.

Source correspondence:

- `kato-2004-asterisque-295`, 13.5–13.7, pp.226–228: The analytic nonvanishing and Ash–Stevens generators are the separate inputs to detecting the zeta module.
- `rubin-euler-systems-draft`, III.5.6, p.49: The elliptic-curve cyclotomic application uses Rohrlich, not nonvanishing at the trivial character.

### All-prime rational Iwasawa module structure

Node `KatoEulerSystems:L4/rational-iwasawa-module-structure`; theorem; proposed declaration `rationalIwasawaStructure`. Implementation status: **unchecked**.

Atlas planet: **Rational Iwasawa freeness**.

For every normalized newform f of weight k≥2, every prime p and λ|p, H²(V_Fλ(f)) is Λ_Q-torsion and H¹(V_Fλ(f)) is Λ_Q-free of rank one, with Λ_Q=O_λ[[G_∞]][1/p]. Kato 12.4 also states H²(T) is Λ-torsion and H¹(T) is Λ-torsion-free for every stable lattice T. If p≠2 and the residual lattice representation is irreducible, H¹(T) is Λ-free of rank one. The rational statement has neither a CM nor an ordinary restriction. The non-CM proof uses geometric smoothed classes, analytic nonvanishing, the verified rational image conditions and ES.8 weak Leopoldt before constructing the unique map of 12.5. The CM proof is an early elliptic-unit supplier result and an explicit gap in this packet: it must not be inferred from the rational map or from CM equality involving that map.

Hypotheses and domain:

- For CM the graph is conditional on the missing all-prime supplier; this is explicit proof-closure information, not a p≠2 alteration of the theorem.
- The geometric smoothed classes exist before the rational zeta morphism.

Construction or proof outline:

1. Use the geometric L2 conductor family and archimedean nonvanishing to prove its inverse-limit component is non-torsion; this step does not require the already-constructed canonical map.
2. For non-CM apply ES.8/weak-leopoldt-from-an-euler-system and the rational bound. R07’s Euler characteristic and integral Iwasawa-complex structure give H¹ rank one and the lattice torsion-freeness; localize to Λ_Q.
3. For CM import the early elliptic-unit torsion/rank statement once staged, including the p=2 and Q(i) branch of Kato 15.14. Then use the same rational/integral module structure passage.
4. Use residual irreducibility and p odd only for the additional integral freeness assertion of 12.4(3).

Direct prerequisites: `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`, `EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`.

Acceptance checks:

- At p=2 keep the rational rank-one and H² torsion assertions.
- Do not infer integral rank-one freeness solely by inverting p.
- The CM supplier is upstream of z^Ka.
- The suggested signature must conclude integral H² torsion and H¹ torsion-freeness, rational H² torsion and H¹ rank-one freeness, and the additional odd-prime residual-irreducible integral freeness. A supplied rank-one basis is not a substitute for these conclusions.

Source correspondence:

- `kato-2004-asterisque-295`, Theorem 12.4, p.221; §§13.7–13.8 and 15.14: The lattice statements precede 12.5; the CM proof has a separate exceptional all-prime branch.
- `burungale-tian-2025-v2`, Theorem 2.3, p.4: The public v2 states the rational torsion/freeness input at arbitrary p without a residual-image hypothesis.

### Finite generation over the cyclotomic tower

Node `KatoEulerSystems:L4/elliptic-cyclotomic-mordell-weil-finiteness`; theorem; proposed declaration `ellipticCyclotomicFiniteGeneration`. Implementation status: **unchecked**.

For modular non-CM E/Q, E(Q_∞) is finitely generated. The proof first applies ES.4’s rational finite-level bound to the concrete Kato system and nonzero twisted L-value to deduce E(Q_n)^χ and Sha(E/Q_n)^χ are finite on the nonvanishing χ-components. Rohrlich’s finite exceptional set implies the free rank stabilizes at some finite layer. Serre’s open-image theorem implies E(Q_∞)_tors is finite. With the finite-level Mordell–Weil theorem, this yields finite generation over the whole tower. In particular L(E,1)≠0 implies E(Q) and the p-primary Sha group are finite at each p; the global Sha finiteness passage uses almost-all-prime vanishing from the final p-part upper-bound node.

Hypotheses and domain:

- E is modular and has no CM; the CM elliptic-unit argument belongs to the separate supplier.
- The twisted finite-level bound uses the actual twisted conductor system and the nonzero local reciprocity value.

Construction or proof outline:

1. Verify Hyp(Q,V) and rational irreducibility by the explicit open-image unipotent, as in III.5.8.
2. Apply the imported finite-level rational bound to each χ after the actual twist of the conductor family; use the elliptic period formula to show the singular localization is nonzero.
3. Rohrlich bounds the rank, and Serre gives finite torsion T₀. Choose a finite layer spanning E(Q∞)⊗Q and containing T₀. For σ in its procyclic Galois group and any P, σP−P belongs to T₀ and is a continuous homomorphism in σ because T₀ is fixed. If e annihilates T₀, every such homomorphism kills eΓ. Thus all points are fixed in one uniformly enlarged finite layer, where the imported Mordell–Weil theorem gives finite generation. Bounded rank and finite torsion alone, without this uniform descent, would not suffice.

Direct prerequisites: `KatoEulerSystems:L3/elliptic-dual-exponential-and-kato-period`, `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`.

Acceptance checks:

- Finite generation of E(Q_∞) is stronger than bounded corank of a Selmer module.
- Do not infer rank-zero at every twist; retain the finite exceptional set.
- The rational finite-level finiteness argument is valid at p=2 with its actual local lattice.
- The suggested signature must conclude uniform finite-layer descent and finite generation over Z, from finite fixed torsion, stabilized action modulo torsion, pointwise p-power invariance and finite-layer Mordell–Weil. Bounded rank and finite torsion alone do not suffice.

Source correspondence:

- `rubin-euler-systems-draft`, III.5.4–5.6, p.49; 5.8–5.11, pp.50–51: The application combines finite-level twisted bounds, Rohrlich and Serre; it is not a generic ES theorem.

### The elliptic ordinary and multiplicative upper bound

Node `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`; theorem; proposed declaration `ellipticOrdinaryMultiplicativeDivisibility`. Implementation status: **unchecked**.

Let E/Q be modular non-CM of conductor N, with good ordinary or multiplicative reduction at p, T=T_pE, Λ=Z_p[[Gal(Q_∞/Q)]], Z_∞=Sel(E/Q_∞)^∨. Use the imported R09 Coleman map on H¹_{∞,s}(Q_p,T). Its value on the actual Kato system is r_E L_{E,N}. If E is good ordinary or nonsplit multiplicative, Z_∞ is finitely generated torsion and char(Z_∞) divides p^t L_{E,N}Λ for some integer t. Under the full integral ES.8 hypotheses and p∤r_E∏_{q|N,q≠p}ell_q(q^(−1)), the bound is char(Z_∞)|L_EΛ. A sufficient usable integral image hypothesis is p odd and ρ_{E,p} surjective. In split multiplicative reduction, the Coleman image lies in the augmentation ideal J and the corresponding bound is J·char(Z_∞)|p^t L_{E,N}Λ (or |L_EΛ under the stronger conditions). The trivial-character zero is retained; α=1 is never inverted in 1−α^(−1).

Hypotheses and domain:

- α is the unit root at good ordinary p, 1 at split multiplicative p and −1 at nonsplit multiplicative p; β=p/α.
- Use the cyclotomic Γ-component and the minimal differential/real period of the elliptic local node.
- The public draft Theorem 5.16 is stated without excluding p=2 in its stronger clause; this packet uses the supplier’s complete integral package and makes no unsupported p=2 integral claim.

Construction or proof outline:

1. Import the actual Coleman map, including its split-multiplicative augmentation-image theorem, instead of redefining a generic local regulator.
2. Its ramified evaluation is α^(−a)τ(χ)∑_γ χ^(−1)(γ)exp*_{ω_E}(z_n^γ); its trivial evaluation is (1−α^(−1))(1−β^(−1))^(−1)exp*(z_0). The elliptic period formula proves Col(c)=r_E L_{E,N}.
3. Apply ES.8’s true-Selmer/singular-quotient bound, with the unipotent/rational or integral hypothesis check.
4. Remove the bad Euler factors only when their p-adic valuations and that of r_E are zero. In the split case keep the augmentation ideal in the divisibility.

Direct prerequisites: `KatoEulerSystems:L3/elliptic-dual-exponential-and-kato-period`, `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, `PadicHodgeRegulators:L3/rubin-coleman-map`, `ModularSymbolsPadicLFunctions:L2/p-adic-l-function`, `EulerSystemsAndKolyvaginSystems:ES.8/true-iwasawa-selmer-and-singular-quotient`, `EulerSystemsAndKolyvaginSystems:ES.8/true-selmer-iwasawa-divisibility`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicHodgeRegulators:L3`.

Acceptance checks:

- At split multiplicative p, the trivial character kills J and the Coleman value.
- For α=−1 the factor 1−α^(−1)=2 must be retained at p=2.
- Rational non-CM open image does not imply exact integral divisibility.
- The suggested signature must state Col(c)=r_E L_(E,N), finite generation and torsion of the Selmer dual, an integral divisibility up to an integer power of p for the fractional L-value, and the stronger bound under the complete integral image package and unit factors. Retain the augmentation generator in the split case.

Source correspondence:

- `rubin-euler-systems-draft`, III.5.14–5.16, pp.52–53: The concrete Coleman image and its Kato value yield the three reduction-type bounds.

### The elliptic dual has no finite submodule

Node `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`; theorem; proposed declaration `ellipticNoFiniteSubmodule`. Implementation status: **unchecked**.

Let E be modular non-CM with good ordinary reduction at p, and assume p∤∏_{q|N}|E(Q_q)_tors|. Then Z_∞=Sel(E/Q_∞)^∨ has no nonzero finite Λ-submodule. This is Rubin III.5.17’s elliptic application of Greenberg’s theorem: the bad local terms vanish, the dual Poitou–Tate sequence has a rank-one free local formal-group norm module, and the global dual has no nonzero finite submodule under weak Leopoldt. The generic no-finite-submodule criterion and formal-group norm-freeness are explicit supplier requests, not re-proved abstractly here.

Hypotheses and domain:

- Good ordinary reduction, not arbitrary semistable reduction, for this statement.
- Every bad prime q|N occurs in the torsion hypothesis; E(Q_q)_tors is local torsion, not global torsion.

Construction or proof outline:

1. Use the imported elliptic Selmer data and the localized finite/unramified comparison to remove the bad-place terms when there is no local p-torsion.
2. Dualize the exact Selmer sequence from R07. Total ramification at p identifies the local norm limit with lim Ê(p_n), free of rank one by the formal-group norm theorem.
3. Use weak Leopoldt from the actual Kato class and the supplier’s Greenberg criterion to descend absence of finite submodules to the torsion quotient Z_∞.

Direct prerequisites: `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`, `SelmerIwasawaCohomology:L2/finite-unramified-comparison`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

Acceptance checks:

- An arbitrary torsion Λ-module can have a finite submodule; torsion alone does not prove this.
- Do not use the criterion at split multiplicative reduction.
- The local p-torsion exclusions must be checked at all q|N.
- The suggested signature must conclude N=0 for every finite Selmer-dual submodule from the arithmetic supplier theorem, local p-torsion exclusions, rank-one formal-group norm freeness and weak Leopoldt. The desired no-finite-submodule criterion is not a hypothesis.

Source correspondence:

- `rubin-euler-systems-draft`, III.5.17 and proof, p.53: The local torsion exclusions and formal-group norm limit are the additional arithmetic hypotheses.

### The rank-zero p-part upper bound

Node `KatoEulerSystems:L4/elliptic-rank-zero-p-part-upper-bound`; theorem; proposed declaration `ellipticRankZeroPPartUpperBound`. Implementation status: **unchecked**.

Atlas planet: **Elliptic p-part upper bound**.

Let E/Q be modular non-CM, L(E,1)≠0, and let p be an odd prime of good reduction with ρ_{E,p} surjective and p∤2r_E∏_{q|N}(ell_q(q^(−1))·|E(Q_q)_tors|). Then Sha(E/Q)[p^∞] is finite and ord_p|Sha(E/Q)[p^∞]|≤ord_p(L(E,1)/Ω_E). In the ordinary case combine the exact Iwasawa upper bound, absence of finite submodules and the R07 control formula: the trivial-character value contains (1−α^(−1))², and the control cokernel has order divisible by the same factor, so it cancels in the inequality. In the supersingular case, p∤|Ẽ(F_p)| at odd p and III.5.11 gives the bound using the local exp* lattice. For almost all p the image/local hypotheses hold, so all but finitely many p-primary Sha groups vanish; combined with each-prime finiteness this gives finite Sha. This is an upper bound only, not the BSD p-part equality.

Hypotheses and domain:

- The nonzero L-value is added explicitly to ensure a finite cardinality conclusion; a divisibility by zero gives no such conclusion.
- At supersingular p the local cardinality assertion is for odd p; the hypotheses exclude 2.
- The ordinary control theorem and exact local correction factors are requested from R07 L3.

Construction or proof outline:

1. Use the finite-level rational bound and the nonzero elliptic period for finiteness of the p-primary Selmer group; Kummer gives finite Mordell–Weil and identifies it with Sha[p∞].
2. At supersingular good p use Proposition 5.1 and Theorem 5.11(ii); the source’s assumption excluding p from r_E|Ẽ(F_p)| is met by the stated conditions.
3. At ordinary p specialize the characteristic-ideal bound using absence of finite submodules, then compare the restriction cokernel and cancel the two ordinary Euler factors exactly as in Corollary 5.18.
4. Use Serre’s almost-all-prime surjectivity and the finite bad-prime/denominator list to deduce global Sha finiteness. No lower bound or equality is deduced.

Direct prerequisites: `KatoEulerSystems:L3/elliptic-dual-exponential-and-kato-period`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`, `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`, `KatoEulerSystems:L4/elliptic-cyclotomic-mordell-weil-finiteness`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `SelmerIwasawaCohomology:L3`, `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

Acceptance checks:

- The conclusion has ≤, not =.
- The right side uses L(E,1), with bad Euler factors removed from the upper bound only by the unit hypotheses.
- A finite Λ-submodule would invalidate the naive characteristic-ideal specialization argument.

Source correspondence:

- `rubin-euler-systems-draft`, III.5.11(ii), p.51; Corollary 5.18, pp.53–54: The final good-reduction upper bound removes the ordinary local factors via control; no BSD equality is supplied.

## Exact supplier exports

These requests identify precise exports needed from their owners; they do not re-plan those owners’ mathematics.

### Export 1: tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus

Export the exact comparison of the existing additive-congruence Eisenstein series with Kato E^h_(α,β), F^h_(α,β) in §3: weights h≥1, rational q-expansions, determinant/index action, E¹=F¹, dlog(g_(α,β))=−F²_(α,β), the regularized weight-two E series, and smoothing cF^h=c²F^h−c^(2−h)F^h_(cα,cβ), cE^h=c²E^h−c^hE^h_(cα,cβ) (using the regularized E at h=2). These are normalized instances of the upstream theory, not a new generic Eisenstein construction.

Consumers: `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`.

### Export 2: tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions

Export the analytically continued newform L-function, its Euler factors and functional equation, and the operator-valued/Hecke quotient normalization needed for Kato 4.5 and 6.6. In particular critical and central values must use analytic continuation, not the total LSeries sum at a point outside its absolute-convergence domain.

Consumers: `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`.

### Export 3: PadicHodgeRegulators:L3

Export Kato 16.4’s de Rham scalar regulator on its stated domain D_crys(V*(1))⊂F⁰D_dR(V*(1)), with singular Euler operators and trace normalization; L3/crystalline-regulator is not this general theorem. Export the integral ordinary image theorem used in Kato 17.8–17.10 with the good lattice/differential of 17.5, including kernel and cokernel corrections.

Consumers: `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`.

### Export 4: PadicHodgeRegulators:D.2

Export the big-local-field explicit reciprocity input of Kato §10 ([KK3] §4.2) and compatibility square (10.9.5) proved in §11: the symbol/Kummer-cup regulator, trace, modular differential and the same dual-exponential normalization. The existing syntomic/Fontaine–Messing nodes cover the ordinary finite-field part but not this non-perfect-residue-field statement.

Consumers: `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`.

### Export 5: SelmerIwasawaCohomology:L3

Supply the modular étale/Galois Iwasawa-complex comparison, cyclotomic character components (including p=2), and the exact Poitou–Tate identification of the restricted dual Selmer module with ker(H²_global→H²_local) used by Kato 13.4. Also supply the Euler-characteristic/torsion-freeness/free-rank-one passage of 12.4; the constructor iwasawa-cohomology alone proves none of these.

Consumers: `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`.

### Export 6: SelmerIwasawaCohomology:L3

Supply Greenberg’s no-finite-submodule criterion in the exact sequence of Rubin III.5.17 and the integral ordinary control/specialization computation of III.5.18, with bad local p-torsion exclusions and the (1−α^(−1))² restriction-cokernel factor. Keep local hypotheses and finite kernels visible.

Consumers: `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`, `KatoEulerSystems:L4/elliptic-rank-zero-p-part-upper-bound`.

### Export 7: ModularSymbolsPadicLFunctions:L1

Compare Kato’s S(f), per_f and F-rational γ sign bases with L1/period-lines and integral-period-lattices; export the exact differential, Gauss-sum, character inversion and U_p dictionary giving the 16.2 normalization, rather than identifying two differently normalized period scalars by name.

Consumers: `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`.

### Export 8: ModularSymbolsPadicLFunctions:L0

Export the modular-symbol pairing/spanning and the period quotient with the rational eigenform realization, including the Ash–Stevens generator conventions δ(f,j,ξ) used in Kato 13.6; the full-level Drinfeld–Manin splitting is already imported by its exact node.

Consumers: `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`.

### Export 9: MotivicEtaleKTheory:M.8

Export the real Deligne/Beilinson regulator on scheme K₂, its transfer compatibility and R(2) normalization for a smooth complex open curve. The finite-etale-chern node and motivic-chern-character alone do not provide this archimedean comparison.

Consumers: `KatoEulerSystems:L3/beilinson-regulator-and-the-archimedean-zeta-value`.

### Export 10: ModularCurvesPartII:R14.1

Supply the algebraic level maps, finite locally free transfers, diamond and dual-Hecke double-coset action on K₂ and coefficient cohomology of Y(M,N), for the two-index level and the primes allowed in Kato 2.4/2.12 and 8.8. The present named Γ₁ correspondence nodes are used for their comparison only, not assumed to imply this full-level/two-index generality.

Consumers: `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula`, `KatoEulerSystems:L1/euler-factor-norm-relation-at-auxiliary-primes`, `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`.

### Export 11: tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing

Fine moduli over Z[1/N] of full ordered torsion bases, with a chosen Weil pairing component, universal curve, and torsion sections.

Consumers: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`, `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`.

### Export 12: tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals

Abel/Pic⁰ duality for elliptic curves over a scheme, and compatibility of divisor pushforward with multiplication under Pic⁰≅E.

Consumers: `KatoEulerSystems:L0/theta-function-c-normalised`.

### Export 13: tauceti:TauCetiRoadmap/ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree

Finite locally free multiplication/isogeny norms, degrees and torsion divisors over the base scheme.

Consumers: `KatoEulerSystems:L0/theta-function-c-normalised`.

### Export 14: tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors

Relative Cartier divisors and div(N_a f)=a_*div(f) for finite locally free maps.

Consumers: `KatoEulerSystems:L0/theta-function-c-normalised`.

### Export 15: tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing

The integral perfect Weil/Poincaré pairing identifying T_pE with H_p(1), including finite coefficients.

Consumers: `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`.

### Export 16: ModularCurvesPartII:R12.2

Identification of analytic and algebraic Y(N), Y(M,N) and their finite-level quotients.

Consumers: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula`, `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`.

### Export 17: ModularCurvesPartII:R12.3

Smooth compactification, cusp widths and relative cusp homology for the precise level.

Consumers: `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`, `KatoEulerSystems:L0/analytic-product-cusp-divisor-and-integrality`.

### Export 18: ModularCurvesPartII:R12.6

Arithmetic full-level descent and determinant action on Q(ζ_N), compatible with pullback of the universal torsion sections.

Consumers: `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`.

### Export 19: ModularCurvesPartII:R13.3

The integral Tate-curve chart and q^(1/N) parameter at a full-level cusp; orders computed in that parameter.

Consumers: `KatoEulerSystems:L0/analytic-product-cusp-divisor-and-integrality`.

### Export 20: SelmerIwasawaCohomology:L0

Continuous finite-coefficient cohomology, traces, Hochschild–Serre edge maps, Shapiro and coefficient limits in this tower.

Consumers: `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology`, `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`.

### Export 21: ArithmeticGaloisDuality:D7

Local Tate/Pontryagin duality, with the invariant-inertia cokernel identified with dual residue H¹; corestriction corresponds to restriction. The p-cohomological dimension zero of the cyclotomic residue-field union is needed for Lemma 8.5.

Consumers: `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology`.

### Export 22: AutomorphicGaloisRepresentations:R19.5

The coefficient-prime de Rham/crystalline realization and its Frobenius eigenline/weak-admissibility comparison for the chosen refinement.

Consumers: `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`.

### Export 23: tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Elliptic reduction, minimal differential, formal logarithm at odd p and good-ordinary formal-group norm-freeness lim Ê(p_n)≅Λ used in Rubin III.5.17.

Consumers: `KatoEulerSystems:L3/elliptic-dual-exponential-and-kato-period`, `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`.

### Export 24: tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii

Finite generation of E(F) for finite number fields and the descent to a fixed finite layer in the cyclotomic application.

Consumers: `KatoEulerSystems:L4/elliptic-cyclotomic-mordell-weil-finiteness`.

### Export 25: ModularCurvesPartII:R14.3

Export finite-coefficient étale H¹ and affine-curve higher-degree vanishing for OPEN Y(M,N), trace and quotient descent, and the log de Rham/étale comparison for its smooth compactification with cusp boundary and Sym^(k−2)H coefficients. Identify F^i with M_k(X), including Eisenstein forms, for 1≤i<k. R19.1/parabolic-realisation-premotive supplies only parabolic cohomology and cannot supply this open-curve comparison.

Consumers: `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`.

### Export 26: CompletedCohomologyAndLocalGlobalCompatibility:R31.2

Export Nakamura Lemma 2.10 and §3.1.4: the Z_p-linear map Sym^(k−2)(Z_p²)^* ⊗_{Z_p[[K_m]]} H₁^BM(K^p(N₀))(1) → H¹(Y(N),V^*_{k/Z_p})(2), with literal dual coefficients, compatible Hecke action, coefficient change and the torsion-scheme/conductor maps. Build on CompletedCohomologyPartII:CC.6 classical evaluation and CC.7 boundary/duality. No integral isomorphism or integral symmetric-power self-duality is required.

Consumers: `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`.

### Export 27: PadicHodgeRegulators:L3

The inspected L3 crystalline, growth, interpolation and Rubin Coleman exports assume odd p. Export the corresponding p=2 regulator on its precise weight/domain hypotheses, interpolation and growth, and the integral ordinary/multiplicative image when asserted. If that cannot be supplied, restrict the affected comparison conclusions to odd p in a revision; do not infer all-prime Kato 16.2/17.4 or Rubin rational divisibility from an odd-prime export. The scalar comparison also needs the separate de Rham extension already requested.

Consumers: `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`, `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`.

### Export 28: SelmerIwasawaCohomology:L3

Export compatibility of the all-prime semilinear Iwasawa twist tw_κ^(−j) with finite-level specialization and loc_p: global twist, then specialization, then localization agrees with local twisting using the same compatible roots. The R07 iwasawa-twist node states the global κ convention; the odd-prime R09 local node is not an all-prime substitute.

Consumers: `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`.

### Export 29: PadicMeasuresIwasawaAlgebras:L4

For Λ=O_λ[[Gal(Q(ζ_p∞)/Q)]], including its semilocal full tame part at p=2, export: a finitely generated module killed by a non-zero-divisor μ with Λ/μΛ p-torsion-free and vanishing at every height-one prime is finite as an abelian group. This is the support argument used in Kato 13.12; a characteristic ideal equal to one alone must not be confused with an equality of lattices.

Consumers: `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`.

## Proof-closure gaps

These twelve gaps prevent a closed status. Their consumers remain planned because the missing inputs and their owners or unstaged supplier are specified.

### Big-local-field reciprocity proof closure

The exact [KK3] generalized explicit reciprocity statement over the non-perfect-residue-field local field and its complete proof were not obtained. Kato §10 reduces 9.5 to it and the commutative comparison square 10.9.5, while §11 supplies the syntomic/Kuga–Sato comparison. Request the precise supplier above; a finite-field syntomic exponential is insufficient.

Affected nodes: `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`.

### All-prime CM module-structure supplier is not staged

PAPER-BURUNGALE-TIAN-26 route 7 proposes CMAllPrimeMainConjectures, but no usable owner stage is present in the current atlas/reserved ids. Its EARLY elliptic-unit layer must export H²(V) torsion and H¹(V) free rank one at every p, including K=Q(i),p=2 and the contained-cyclotomic branch in Kato 15.14. It cannot use the Kato map or a main-conjecture equality involving that map. For the rational CM cohomological upper bound also export the elliptic-unit specialization/local-length comparison of Kato 15.13–15.17 and the required one-direction input of 15.2. H² torsion alone gives no length inequality. This packet states the all-prime theorem and makes its CM proof conditional; it does not install an unresolved stage id.

Affected nodes: `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`.

### Critical arithmetic family compatibility

R10/L3 supplies a critical family comparison principle, but the compatible arithmetic family section, refinement normalization and specialization of Kato’s class are not furnished by Kato 16.6. Record them as a condition and gap on the comparison node. PadicFamilies:L4 consumes Kato L3/L4, so making it a prerequisite would introduce a stage cycle.

Affected nodes: `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`.

### General de Rham scalar and integral ordinary image exports

The inspected R09 crystalline/vector regulator node does not give the de Rham extension of 16.4 with F⁰ containment, nor the exact integral local image used in 17.8–17.10. Their requested exports, singular Euler domains and good-period hypotheses remain proof-closure inputs.

Affected nodes: `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`.

### Modular strict-Selmer/H² and rank-one comparison

Generic R07 duality sequences are present, but a complete public derivation of the modular étale-to-Galois comparison, tame character decomposition at p=2, the strict H² kernel identification and the lattice-freeness passage has not been verified. This is the exact adapter requested by the ES.8 packet, not an additional generic Euler-system theorem.

Affected nodes: `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`.

### Integral elliptic control and no-finite-submodule criterion

Rubin’s III.5.17 proof cites Greenberg and a formal-group norm-freeness result, and III.5.18 sketches cancellation through ordinary control. R07 L3 and the upstream elliptic formal-group layer must export those precise statements with the local p-torsion exclusions. No direct finite-level cardinality bound is inferred from a characteristic ideal alone.

Affected nodes: `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`, `KatoEulerSystems:L4/elliptic-rank-zero-p-part-upper-bound`.

### Complete period normalization comparison

The Kato 16.2 formulas were checked in the PDF; R10’s differently indexed weight, Mellin character and period bases must be compared by the exact L1 request. Equality is conditional on that dictionary, not on the two spaces both being one-dimensional.

Affected nodes: `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`.

### Open modular-curve coefficient comparison

Export finite-coefficient étale H¹ and affine-curve higher-degree vanishing for OPEN Y(M,N), trace and quotient descent, and the log de Rham/étale comparison for its smooth compactification with cusp boundary and Sym^(k−2)H coefficients. Identify F^i with M_k(X), including Eisenstein forms, for 1≤i<k. R19.1/parabolic-realisation-premotive supplies only parabolic cohomology and cannot supply this open-curve comparison.

Affected nodes: `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`.

### Completed Borel–Moore classical moment export

Export Nakamura Lemma 2.10 and §3.1.4: the Z_p-linear map Sym^(k−2)(Z_p²)^* ⊗_{Z_p[[K_m]]} H₁^BM(K^p(N₀))(1) → H¹(Y(N),V^*_{k/Z_p})(2), with literal dual coefficients, compatible Hecke action, coefficient change and the torsion-scheme/conductor maps. Build on CompletedCohomologyPartII:CC.6 classical evaluation and CC.7 boundary/duality. No integral isomorphism or integral symmetric-power self-duality is required.

Affected nodes: `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`.

### Dyadic regulator and Coleman domain

The inspected L3 crystalline, growth, interpolation and Rubin Coleman exports assume odd p. Export the corresponding p=2 regulator on its precise weight/domain hypotheses, interpolation and growth, and the integral ordinary/multiplicative image when asserted. If that cannot be supplied, restrict the affected comparison conclusions to odd p in a revision; do not infer all-prime Kato 16.2/17.4 or Rubin rational divisibility from an odd-prime export. The scalar comparison also needs the separate de Rham extension already requested.

Affected nodes: `KatoEulerSystems:L3/refined-scalar-regulator-of-the-kato-class`, `KatoEulerSystems:L3/noncritical-analytic-arithmetic-comparison`, `KatoEulerSystems:L3/critical-and-bad-reduction-comparison-domain`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`.

### Global-to-local twist compatibility

Export compatibility of the all-prime semilinear Iwasawa twist tw_κ^(−j) with finite-level specialization and loc_p: global twist, then specialization, then localization agrees with local twisting using the same compatible roots. The R07 iwasawa-twist node states the global κ convention; the odd-prime R09 local node is not an all-prime substitute.

Affected nodes: `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`.

### Finite-support theorem for the full cyclotomic algebra

For Λ=O_λ[[Gal(Q(ζ_p∞)/Q)]], including its semilocal full tame part at p=2, export: a finitely generated module killed by a non-zero-divisor μ with Λ/μΛ p-torsion-free and vanishing at every height-one prime is finite as an abelian group. This is the support argument used in Kato 13.12; a characteristic ideal equal to one alone must not be confused with an equality of lattices.

Affected nodes: `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`.

## Source findings and version limits

All ten findings carry the existing independent confirmation. They apply only to the source versions actually inspected; in particular the Rubin findings concern the AWS author draft, without a collation against the published AMS book. Their bounded correction searches do not establish exhaustive novelty. The source observations below are paraphrases, and formulas describe the proposed corrected mathematics.

### KatoEulerSystems/E1 — misprint

Source `kato-2004-asterisque-295`, Published Astérisque 295 (2004), 1.9 p.124 and repeated in 3.10.

Published/draft observation: The exponent in 1.9 uses a linear numerator a in its final a/(2N²) term; the same defect recurs in 3.10.

Correction: w = 1/12 − a/(2N) + a²/(2N²) = B₂(a/N)/2.

Reason: The theta product of 1.3(3) and the Bernoulli explanation in 3.10 force the square. At a=2,N=5 the corrected exponent is −11/300, whereas the printed exponent is −23/300. The page image was checked.

Scope affected: nothing. Search classification: new.

Correction search:

- Numdam published PDF, printed pp.124 and the Bernoulli explanation in §3.10, read 6 October 2026.
- Bounded web search for Kato 2004 Siegel-unit/1.9 errata on 6 October 2026 found no correction; no claim of exhaustive novelty.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Independently checked the page images at 1.9 p.124 and after 3.10 p.141; the theta product requires B₂/2. The rational computation gives −11/300 versus −23/300 at 2/5.

### KatoEulerSystems/E2 — error

Source `rubin-euler-systems-draft`, 1999 AWS public author draft, III.5.1 p.48.

Published/draft observation: The singular integral exp* image is asserted to be the local index times p^(−1)Z_p, with no odd-prime qualification.

Correction: Add p>2 for the displayed formal-logarithm lattice; at p=2 retain the actual λ_E(E₁(Q₂)) lattice.

Reason: The proof uses λ_E(E₁(Q_p))=pZ_p, an odd-prime formal-group logarithm assertion which is not valid for arbitrary elliptic curves at p=2. For E:y²+xy=x³+1, Δ=−433 is a 2-adic unit and a₁=1. In the integral formal parameter, log_E(t)=t+(a₁/2)t²+∑_(n≥3)b_n t^n/n with integral b_n. For t=2u its first two terms vanish modulo 4 and every n≥3 term lies in 4Z₂, since n−v₂(n)≥2. Thus log_E(E₁(Q₂))⊂4Z₂, and log_E(E₂(Q₂))=4Z₂ shows equality, contradicting 2Z₂. The corrected local node and exact p-part bound use odd p.

Scope affected: a stated result. Search classification: new.

Correction search:

- Public AWS 1999 draft, III.5.1 proof, read 6 October 2026.
- Bounded web search for Rubin Euler Systems Proposition 5.1 and p=2 errata, 6 October 2026; no standalone erratum found.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Independently checked the AWS p.48 display and formal-logarithm proof. For y²+xy=x³+1, Δ=−433 and log(2u)∈4Z₂, while log(E₂)=4Z₂, so E₁ has image 4Z₂. This finding is restricted to the downloaded public draft.

### KatoEulerSystems/E3 — error

Source `rubin-euler-systems-draft`, 1999 AWS public author draft, III.5.8(ii) and proof p.50.

Published/draft observation: The surjective-image clause asserts vanishing of the first cohomology of the full p-power division field with p-primary torsion coefficients.

Correction: For the vanishing add p>2; at p=2 keep finite cohomology. The Hyp(Q_∞,T) assertion is unchanged.

Reason: At p=2 the scalar −1 does not supply a unit annihilator. A finite check of GL₂(Z/4) on (F₂)² gives cocycle dimension 3 and coboundary dimension 2, hence a nonzero H¹ class; inflation to GL₂(Z₂) is injective. Since (Q₂/Z₂)² has no GL₂(Z₂)-invariants, the multiplication-by-2 exact sequence injects this H¹ into H¹(GL₂(Z₂),(Q₂/Z₂)²)[2]. Thus the displayed zero is false at 2.

Scope affected: a stated result. Search classification: new.

Correction search:

- Public AWS 1999 draft, III.5.8 proof, read 6 October 2026.
- Bounded web search for Rubin Proposition 5.8 dyadic cohomology correction, 6 October 2026; no standalone erratum found.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Independently read AWS p.50 and reproduced the finite GL₂(Z/4) cocycle calculation: group order 96, Z¹ dimension 3, B¹ dimension 2. Inflation and the multiplication-by-two sequence give a nonzero class in H¹(GL₂(Z₂),(Q₂/Z₂)²). Only the asserted integral vanishing at two is rejected.

### KatoEulerSystems/E4 — misprint

Source `nakamura-2023-published`, Published Invent. Math. 234 (2023), §3.1.3 p.207.

Published/draft observation: The divisor assigned to the cited Kato theta unit has E[c] positive and c²[0] negative.

Correction: For the Kato unit cited here use c²[0]−E[c]; the displayed divisor characterizes its inverse.

Reason: Kato Proposition 1.3(1) gives the opposite divisor. Both unit entries would be inverted by the printed convention, so {u^(−1),v^(−1)}={u,v} in K₂ and the equal-auxiliary Beilinson symbol is unchanged. Fix the individual-unit convention and use Kato’s definition throughout.

Scope affected: nothing. Search classification: new.

Correction search:

- Kato published Proposition 1.3 p.121 compared with Nakamura published §3.1.3 p.207 on 6 October 2026.
- Bounded web search Nakamura zeta morphisms erratum theta divisor, 6 October 2026; no correction notice found.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Independently compared published Nakamura p.207 with Kato 1.3: the divisor is reversed. Bilinearity gives {u⁻¹,v⁻¹}={u,v}, so the equal-auxiliary symbol is unaffected.

### KatoEulerSystems/E5 — misprint

Source `nakamura-2023-published`, Appendix A, proof of Theorem A.1, p. 267.

Published/draft observation: The conductor-n smoothing operator has d instead of d² as the scalar term in its second factor.

Correction: (c² − c^{k+1−j}σ_c)(d² − d^{j+1}σ_d)∏ …

Reason: The conductor-one operator immediately above has d²; the conductor-n construction changes the coefficient Iwasawa algebra, not the smoothing exponent. The missing square is incompatible with that construction.

Scope affected: nothing. Search classification: PAPER-NAKAMURA-23/E13, independently confirmed in its extraction review; no publisher erratum found in that search..

Correction search:

- Crossref record of doi:10.1007/s00222-023-01203-7: no update-to, updated-by or relation entries, and no work declaring an update of it (23 September 2026)
- arXiv 2006.13647: v1 (24 June 2020) and v2 (2 July 2020) only, both earlier than the published version and sharing the recorded passages
- The article page on Springer Link, 23 September 2026: no correction or erratum notice

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Independently inspected the published p.267 image: μ₁ has d² and μ_n loses that square although only the conductor algebra changes. Confirmed without relying on the prior extraction verdict.

### KatoEulerSystems/E6 — misprint

Source `nakamura-2023-published`, Appendix A, before Lemma A.3 and in its statement, p. 268.

Published/draft observation: The purported two-dimensional dual eigenquotient and its Poincaré comparison are formed on the full-level curve Y(N_f).

Correction: H¹(Y_1(N_f), 𝒱^*_{k/A})(1) (and Y_1(N_f) in Lemma A.3)

Reason: V_1(f)_E is Kato's quotient of H¹(Y_1(N_f), 𝒱_{k/E}) (p. 265), and §3.3 describes V′_1(f)_A as a quotient of H¹(Y_1(N), 𝒱^*_{k/A}). For the full-level curve Y(N_f) the f-eigenquotient is ρ_f^* ⊗ π̃(f)^{K(N_f)} (39), of dimension 2·dim π(f)^{K(N_f)}, not the two-dimensional V′_1(f) ≅ ρ_f^*.

Scope affected: nothing. Search classification: PAPER-NAKAMURA-23/E14, independently confirmed in its extraction review; no publisher erratum found in that search..

Correction search:

- Crossref record of doi:10.1007/s00222-023-01203-7: no update-to, updated-by or relation entries, and no work declaring an update of it (23 September 2026)
- arXiv 2006.13647: v1 (24 June 2020) and v2 (2 July 2020) only, both earlier than the published version and sharing the recorded passages
- The article page on Springer Link, 23 September 2026: no correction or erratum notice

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Independently checked published p.268, Appendix A setup and §3.3: the two-dimensional Γ₁ quotient requires Y₁(N_f). The full-level eigenspace includes the finite-level automorphic multiplicity.

### KatoEulerSystems/E7 — error

Source `nakamura-2023-published`, Published Invent. Math. 234 (2023), §3.1.2 pp.205–206, equation (7) and preceding symmetric-power pairing.

Published/draft observation: The ordinary symmetric power of A² is claimed to be its literal dual tensored with det^(k−2), without inverting a factorial in A.

Correction: Require (k−2)! invertible for this symmetric-power self-duality, in particular use rational coefficients. Integrally retain the literal dual, which corresponds to a divided-power lattice; do not replace it by the symmetric-power Tate lattice.

Reason: Take p=2,k=4,A=Z₂ and the ordinary quotient Sym² with basis x²,xy,y². Equivariance under diag(3,1) forces B to have antidiagonal entries a,b,c. The unipotent matrix U=[[1,1,1],[0,1,2],[0,0,1]] forces UᵗBU=B, hence a=c=−2b. Its determinant is −4b³, never a unit of Z₂. Thus no such perfect equivariant pairing exists. This invalidates the arbitrary integral identification used in the proof, but not the rational dictionary or a theorem restated using literal duals.

Scope affected: the proof. Search classification: new.

Correction search:

- Published pp.205–206 and the coefficient conventions in §3.1.1 checked on 6 October 2026.
- Bounded searches on Springer Link for the exact DOI with correction/erratum and arXiv for Nakamura symmetric dual zeta morphisms, 6 October 2026, found no applicable correction; no exhaustive novelty claim.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Take p=2,k=4,A=Z₂ and the ordinary quotient Sym² with basis x²,xy,y². Equivariance under diag(3,1) forces B to have antidiagonal entries a,b,c. The unipotent matrix U=[[1,1,1],[0,1,2],[0,0,1]] forces UᵗBU=B, hence a=c=−2b. Its determinant is −4b³, never a unit of Z₂. Thus no such perfect equivariant pairing exists. This invalidates the arbitrary integral identification used in the proof, but not the rational dictionary or a theorem restated using literal duals.

### KatoEulerSystems/E8 — misprint

Source `kato-2004-asterisque-295`, Published Astérisque 295 (2004), Theorem 12.5(4), p.222; proof 13.14, p.234.

Published/draft observation: The all-height-one integral clause displays rational H²(V) and rational H¹(V)/Z(f), after first asserting lattice membership for Z(f,T).

Correction: Use H²(T) and H¹(T)/Z(f,T) in the stronger integral clause. The weaker rational formula is described separately from this contextual correction.

Reason: The clause first establishes Z(f,T)⊂H¹(T) and quantifies every height-one prime, including those over p. Rational modules make the latter inequality vacuous over p. Proof 13.14 reduces T to a scalar multiple of V_Oλ(f), proves integral membership using finite index and integral freeness, and invokes integral Theorem 13.4(3). This fixes the intended lattice statement without claiming that the weaker printed rational inequality itself is false.

Scope affected: nothing. Search classification: new.

Correction search:

- Numdam published pp.222 and 234 inspected independently, 6 October 2026.
- Bounded Numdam/Kato searches for 12.5 and errata on 6 October 2026 found no applicable correction; no exhaustive novelty claim.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. The clause first establishes Z(f,T)⊂H¹(T) and quantifies every height-one prime, including those over p. Rational modules make the latter inequality vacuous over p. Proof 13.14 reduces T to a scalar multiple of V_Oλ(f), proves integral membership using finite index and integral freeness, and invokes integral Theorem 13.4(3). This fixes the intended lattice statement without claiming that the weaker printed rational inequality itself is false.

### KatoEulerSystems/E9 — misprint

Source `kato-2004-asterisque-295`, Published Astérisque 295 (2004), Theorem 17.4(3), p.273; compared with 17.6 p.274 and proof 17.13 pp.279–280.

Published/draft observation: The good-period condition in the stronger ordinary bound places its stable lattice in the realization of f, although the period vectors belong to f*.

Correction: The periods belong to f*: goodness is for U⊂V_Fλ(f*) with U≅T*(1−k), so the bound is on X(T).

Reason: In 17.4(2), ω∈S(f*) and γ∈V_F(f*). Definition 17.5 for f cannot apply to those vectors. Conjecture 17.6 explicitly puts goodness in V(f*) and identifies its lattice with T*(1−k); proof 17.13 starts with a lattice U in V(f*) and concludes for X(U*(1−k)). Thus the f in the goodness condition is a dual-form/lattice misprint.

Scope affected: nothing. Search classification: new.

Correction search:

- Numdam published pp.273–274 and 279–280 inspected, 6 October 2026.
- Bounded Numdam/Kato searches for 17.4 good lattice errata, 6 October 2026, found no applicable correction; no exhaustive novelty claim.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. In 17.4(2), ω∈S(f*) and γ∈V_F(f*). Definition 17.5 for f cannot apply to those vectors. Conjecture 17.6 explicitly puts goodness in V(f*) and identifies its lattice with T*(1−k); proof 17.13 starts with a lattice U in V(f*) and concludes for X(U*(1−k)). Thus the f in the goodness condition is a dual-form/lattice misprint.

### KatoEulerSystems/E10 — misprint

Source `nakamura-2023-published`, Published Invent. Math. 234 (2023), §5.1 p.254, proof of Theorem 5.2 and paragraph before Conjecture 5.3.

Published/draft observation: The integral large-image bound is referred to as Kato 12.4(4), and the equality being decomposed into character components is referred to as Conjecture 5.2.

Correction: Theorem 12.5(4) of Kato; Conjecture 5.1 is decomposed into its η-components.

Reason: Theorem 12.4 has clauses (1)–(3), while the large-image integral inequality is 12.5(4), and §5.1 labels the global characteristic-ideal equality Conjecture 5.1. Theorem 5.2 is the one-direction bound, not a conjecture. These are cross-reference slips with uniquely identifiable intended statements.

Scope affected: nothing. Search classification: new.

Correction search:

- Published p.254 compared with Kato pp.221–222 and Nakamura p.253, 6 October 2026.
- Bounded Springer/arXiv correction searches for the article on 6 October 2026 found no applicable correction notice; no exhaustive novelty claim.

Recorded independent verdict: **confirmed**, `REV-KatoEulerSystems`. Theorem 12.4 has clauses (1)–(3), while the large-image integral inequality is 12.5(4), and §5.1 labels the global characteristic-ideal equality Conjecture 5.1. Theorem 5.2 is the one-direction bound, not a conjecture. These are cross-reference slips with uniquely identifiable intended statements.

## Atlas handoffs and continuation

### Replace the two inherited cyclotomic-unit stage routes

RT-AREA-iwasawa-1/36: atlas edges EulerSystemsCyclotomicMainConjecture:L0→KatoEulerSystems:L2 and :L2→KatoEulerSystems:L4 route generic ES mathematics through a cyclotomic application. The packet instead imports ES.2 at L2 and ES.4/ES.8 at L4. Also RT-AREA-iwasawa-1/1 requests ES.2→EulerSystemsCyclotomicMainConjecture:L0, outside this issue’s deliverables. The maintainer must change those atlas/other-roadmap edges; this job edits none of them.

### CM early supplier and critical-family cycle boundary

PAPER-BURUNGALE-TIAN-26 route 7 needs an early all-prime elliptic-unit stage before Kato 12.5. No such owner stage is presently resolvable, so the CM proof gap is named without inventing a stage id. PadicFamilies:L4 consumes Kato L3/L4 and cannot be a prerequisite for constructing its geometric classes; the compatible critical arithmetic section remains an explicit comparison input.

### Revision synchronization and supplier ownership

BP-KatoEulerSystems~2 synchronizes all forty node statements, sixty API items, forty-one construction tests, twelve gaps, twenty-nine requests and ten source findings into the reader. The independent review object remains historical and unchanged. Generic open/log comparison, completed Borel–Moore evaluation, dyadic regulators and full-cyclotomic finite-support algebra remain with their named owners.

The packet is a complete target-level planning pass. The five stages remain planned, and all implementations remain unchecked. Source proof closure and supplier export work resumes at the explicit gaps above.
