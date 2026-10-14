# Modular curves, following Katz–Mazur, Part II: Uniformization, integral boundary and Hecke cohomology

The Tau Ceti roadmap [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves) builds the arithmetic theory of elliptic curves over schemes and their level structures in the style of Katz and Mazur. It constructs the affine integral level problems, their coarse moduli schemes, the coarse j-line, the fine curves Y₁(N), Y_full(N), Y(N,ζ) and the twisted curve Y(ρ), and the compactified prime-level diamond quotients over ℤ[1/N]. This roadmap starts where that one stops. It does three things that the arithmetic applications of modular curves (level lowering, modularity lifting, Gross–Zagier, Chabauty, the Eichler–Shimura construction) all need and that the base roadmap does not provide.

1. **Uniformization and the analytic comparison (R12).** It proves that a complex elliptic curve is a complex torus, that the algebraic level curves of ModularCurves are the analytic quotients Γ\ℍ, with their cusps, components and fields of definition, and that weight-two cusp forms are the regular differentials on the compact curve, with the Hecke operators of ModularForms realized by pullback and trace. This discharges the connectedness inputs that ModularCurves leaves as named external contracts (its Layer 5C).
2. **The integral boundary (R13).** It constructs generalized elliptic curves (Deligne–Rapoport, Conrad), the compactified level stacks at every level including Česnavičius's refined Γ₀(N), the generalized Tate curves and formal cusp charts, the integral coarse curves X_H for every open level H ⊂ GL₂(Ẑ) by purely algebraic means, the comparison of their generic fibres with the analytic curves, their bad fibres and regular or semistable models, and the dual graphs and character groups those models export.
3. **Hecke correspondences and cohomology (R14).** It constructs the Hecke, diamond and Atkin–Lehner correspondences on these curves, the induced action on Jacobians and the geometric integral Hecke algebra, the integral étale and Betti realizations with their parabolic cohomology, pairings and higher-weight coefficient systems, the Ihara-type injectivity and saturation statements, the modular abelian varieties A_f of weight-two newforms, and the bad-prime character groups, the special-fibre Eichler–Shimura relation and finite-level Taylor–Wiles freeness.

The end theorems are: the analytic–algebraic comparison of compact modular curves at every level with their cusp fields (R12.3, R13.4b); geometric connectedness of the fixed-pairing and twisted curves (R12.4); weight-two cusp forms as differentials with the pullback–trace Hecke normalization and the perfect first-coefficient pairing (R12.5); the proper flat compactified level stacks over ℤ (R13.2) and the projective normal coarse curves X_H over ℤ with their legal base change (R13.4a); the explicit bad fibres used by level lowering and intersection theory (R13.5); the Hecke correspondences with their composition laws and integral traces (R14.1); the faithful integral Hecke action on modular Jacobians (R14.2); the Eichler–Shimura isomorphism, parabolic Poincaré duality and localized integral freeness (R14.3); the compact and principal-level Ihara theorems (R14.4); Shimura's theorem dim A_f=[K_f:ℚ] (R14.5); and the special-fibre Eichler–Shimura relation T_p=F+⟨p⟩V and Taylor–Wiles freeness (R14.6).

This document is the assembled blueprint of the roadmap: every target with its exact statement, hypotheses, proof plan, prerequisites, source locators, and, for definitions and constructions, its planning API and unit tests. Nothing in it is claimed to be formalised. The [suggested Lean file](../suggested/ModularCurvesPartII.lean) states what the pinned libraries can already express; this document is definitive.

## Scope and boundaries

### The base roadmap

ModularCurves is the first prerequisite. Its layers are imported, never rebuilt:

- **Layers 0–2**: relative effective Cartier divisors, finite locally free group schemes and Cartier duality, finite quotients and torsors, finite étale descent and spreading out (0A–0E); projective Weierstrass models, pole sheaves and the scheme-theoretic group law (1A–1D); isogenies, quotients, the Cartier–Nishi duality and the Weil pairing, endomorphism degree and rigidity (2B, 2E, 2F).
- **Layers 3–9**: the four level structures and their naive variants (3C, 3D, 3N); Tate normal form and Y₁(N) for N≥4, full ordered bases and fixed pairing, the twisted curve Y(ρ) (5A–5C); the integral level problems (Layer 6); local algebra, p-divisible groups, Serre–Tate theory and the three characteristic-p calculations (7B, 7E–7H); generator schemes, cyclicity and Γ₀(N) (8B–8D); the Katz–Mazur quotient problems, coarse moduli schemes, the coarse j-line and Y₀(N) (9A–9E).
- **Layer 10**: the compactified coarse curves X_H over ℤ[1/N] for prime N≥5 and diamond subgroups H of (ℤ/N)ˣ/{±1}, their cusps and widths, the characteristic-2/3 stabilizer table and the Shimura covering. On exactly that range this roadmap proves agreement with its own construction (R13.4a/prime-diamond-agreement) and builds nothing again. Full, fixed-pairing, composite, small and level-dividing compactifications are new work here.

In the node texts, "MC" followed by a layer label (MC5C, MC9B, …) abbreviates a layer of ModularCurves and "MF" (MF10A, MF10C) a layer of ModularForms; "the anchor" is the existing Tau Ceti roadmap the node cites at that point; "native" refers to an existing Mathlib or Tau Ceti declaration.

### What other roadmaps supply

| Owner | What this roadmap imports |
| --- | --- |
| Mathlib | Lattice functions `PeriodPair`, ℘, ℘′, g₂, g₃ and the ℘ differential equation; `WeierstrassCurve` and `IsElliptic`; relative normalization of schemes with its universal property and smooth base change (`Scheme.Hom.normalization`, `normalizationDesc`, `normalization.hom_ext`, `normalizationPullback`); the congruence subgroups Γ(N), Γ₀(N), Γ₁(N); cyclotomic polynomials; group cohomology with Shapiro's lemma and the trivial-action character isomorphism; the untwisted pro-étale ℤ_ℓ carrier; linear-algebra kernels, ranges and coproducts; freeness of finite flat modules over local rings. |
| Tau Ceti library | The scheme Weil pairing and the Tate curve equation; `HeckeRing.GL2` and its coprime multiplicativity and first-coefficient theorem; the strict integer cusp width; connected-plus-domain-stalks implies irreducible; the abelian-variety carrier; abstract local coefficient systems with pullback; symmetric-power representations and their rank; antitonicity of Γ(N) in N; same-level strong multiplicity one. |
| [ModularForms](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms) | The analytic modular curve and its compactification (10A), compact Riemann-surface cohomology (10B), modular forms as section spaces (10C); analytic Hecke operators and the abstract Hecke algebra (Layer 2), the Petersson product and oldforms (Layer 3), newforms, primitive forms, strong multiplicity one and coefficient fields (Layers 4, 5, 8G), and the full integral modular-symbol module with its period quotient (Layer 8). Geometric actions are compared with these; no second analytic theory is built. |
| JacobianChallenge | The Jacobian of a curve over a field and the relative Picard functor (Layer D); the generic Abel–Jacobi map and its universal property (Layer F). |
| StableReduction | Nodes, normalization and dual graphs; coherent curve theory and duality; prestable, semistable and stable curves; blowups and intersection theory on arithmetic surfaces; semistable reduction; canonical contraction and stabilization (Layers 1–4, 7, 8). This roadmap instantiates them on the explicit modular models. |
| AlgebraicCurves, AlgebraicTopology, FuchsianOrbifolds | The function-field/curve dictionary and normalization of curves (AlgebraicCurves Layer 12); relative singular chains, finite covers and transfer, cohomology products and manifold duality (AlgebraicTopology Stages 2, 5, 6); hyperbolic polygons and cofinite groups, used for the finite type, graph retract and free fundamental group of a torsion-free congruence quotient (FuchsianOrbifolds Layer 2). |
| ReductiveGroupsPartII, AdelicAlgebraicGroups | The Bruhat–Tits tree of SL₂ over a nonarchimedean local field and the local amalgam of SL₂(ℚ_p) as SL₂(ℤ_p) and gSL₂(ℤ_p)g⁻¹ amalgamated over their Iwahori intersection (RG2.2); strong approximation for simply connected groups (AA.4). |
| SchemeAndStackFoundations | Normalization finiteness and base-change facts (SF.0); algebraic and Deligne–Mumford stacks, inertia, quotient stacks, coarse moduli spaces and the Keel–Mori theorem, tame stacks and their local structure, fpqc descent of quasi-coherent sheaves (SF.1); the finite and local-coefficient étale–Betti comparison (SF.2); the trace on regular differentials for finite maps of smooth projective curves in characteristic zero, requested from SF.3; Hilbert and Quot schemes, Stein factorization and effective formal algebraization (SF.4); the projection formula and numerical degree for cycles on products of proper curves, requested from SF.5. |
| AlgebraicModuliForArithmeticGeometry | Complex analytic spaces, scheme analytification and proper GAGA (A0-extension, its package §7.10); relative Picard representability, the neutral component and infinitesimal lifting (A0-extension); normalization of Deligne–Mumford stacks, rigidification, finite correspondences and their coarse descent, tame finite flat descent (R09.5); completed atlas presentations (R09.6). |
| ComplexComparisonPartII | GAGA base change and the projective dictionaries (C2); affine-curve connectedness, families and proper-morphism algebraicity (C4); residues on curves (C5). |
| AdicSpacesPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory | Grothendieck existence and algebraization of formal schemes and morphisms (F0); finite flat group schemes (R07.1). |
| AbelianSchemesAndArithmeticModuli | Relative tori and periods (A5); dual abelian schemes, the canonical principal polarization of a relative curve Jacobian and the norm–pullback transpose, requested from A2; the polarized Weil pairing (A3); étale Tate modules (A4); finiteness and freeness of Hom groups of abelian varieties and quotients by abelian subvarieties (A6). |
| NeronModelsAndSemistableAbelianVarieties | Néron models (R11.1, R11.6), the semistable Tate filtration (R11.3), character groups, graph homology and the monodromy pairing (R11.4). |
| LefschetzPencilsAndVanishingCycles | Normalization cohomology, the specialization sequence and the monodromy filtration of a semistable curve (LPV.7). |
| EtaleDualityAndPerverseSheaves | Coefficient and support categories (EDC.0), localization (EDC.1), flat and curve traces and the cup-product trace pairing (EDC.2), the integral comparison with complex H¹ and its compatibility with traces and cup products along finite curve maps, requested from EDC.6. |
| ArithmeticGaloisRepresentations | Good reduction and specialization of Galois representations (R01.6). |
| ComplexMultiplicationAndExplicitReciprocity | The CM and Kronecker congruences for the cyclic modular polynomial; this roadmap constructs Φ_N and its degree, not the congruence. |

Out of scope, with their owners: the Galois representations attached to eigenforms and their eigenspace projectors (AutomorphicGaloisRepresentations R19.1, R19.6), which import the weight-two special-fibre relation from R14.6 and keep the higher-weight Deligne congruence; Serre weights, level lowering and the Mazur principle (SerreWeightAndLevelOptimisation, R20), which consume the bad fibres, graphs and character maps of R13.5–R13.6 and the Ihara statements of R14.4; patching and R=T (GL2ModularityLifting, R22), which consume the finite-level freeness of R14.6; the identification of A_f with a given elliptic curve (EllipticCurveModularity R29.5); algebraic modular forms and Serre weights on these curves (AlgebraicModularFormsAndSerreWeights R15); and the general six-functor formalism, nearby cycles and weights (EtaleDualityAndPerverseSheaves, WeightsInEtaleCohomology).

### Downstream consumers

ShimuraVarieties uses R12.1–R12.6 and R13.4a–R13.4b for its GL₂ comparison; ShimuraCompactifications uses R13.1–R13.4b for its dimension-one degeneration; GrossZagierAndArithmeticHeights uses the integral models, coarse local structure and correspondences of R13.1–R14.6; KatoEulerSystems, HeegnerPointEulerSystems, EllipticRegulators and ModularSymbolsPadicLFunctions use the cusp, Hecke and cohomological interfaces of R12–R14; AutomorphicGaloisRepresentations and GL2AutomorphicRepresentationsAndTransfer use R14.2–R14.6; SerreWeightAndLevelOptimisation and AutomorphyLiftingBeyondTaylorWiles use R13.5–R14.6; EffectiveDiophantineMethods, EllipticCurveModularityWild3Adic and EllipticCurveModularityImaginaryQuadratic use the Cartan, twisted and Atkin–Lehner curves of R13.4a; AnabelianGeometryAndNonabelianChabauty (NC.5) uses the level-13 split-Cartan model of R13.5; CompletedCohomologyPartII, PadicFamilies, PadicHodgeTheory, PeriodsAndSpecialValues and WeightsInEtaleCohomology use the curve and coefficient carriers of R13.3 and R14.3.

## Conventions

These conventions are fixed for the whole roadmap; the node statements below use them, and the few places where a node writes the same object differently are listed at the end of this section.

**Primes and levels.** N is a positive level; p is a residue characteristic or Hecke prime; ℓ is a coefficient prime, invertible wherever étale coefficients are used. An open level subgroup is an open H ⊂ GL₂(Ẑ); for n with Γ(n)=ker(GL₂(Ẑ)→GL₂(ℤ/n)) ⊂ H, H̄ is its image in GL₂(ℤ/n), and ±H is generated by H and −1. Level one is H=GL₂(Ẑ).

**Frames and the row action.** A frame of E[n] is an ordered basis (P,Q). A matrix γ=[[a,b],[c,d]] acts on the right by (P,Q)γ=(aP+cQ, bP+dQ), as in ModularCurves. Then Γ₁(N)={a≡1, c≡0} fixes P, Γ₀(N)={c≡0} fixes the line through P, and Γ₁^μ(N)={c≡0, d≡1} records an embedding μ_N→E[N]. On the upper half-plane ℍ the same action is τ·γ=(dτ+b)/(cτ+a) with fibre map z↦z/(a+cτ); in the usual left-action notation τ↦(ατ+β)/(γτ+δ) the corresponding label matrix is [[δ,β],[γ,α]]. A row action of determinant r sends a pairing value ζ to ζ^r, and the diamond action on Γ₁ is P↦aP.

**Weil pairing.** The pairing is Tau Ceti's e_N(S,T)=τ_S^*g_T/g_T (Silverman III.8). On ℂ/(ℤ+ℤτ) with τ∈ℍ, e_N(τ/N,1/N)=ζ_N=e^{2πi/N} and e_N(1/N,τ/N)=ζ_N⁻¹. The open uniformization of a fixed-pairing curve is Γ(N)\ℍ→Y(N,ζ_N), τ↦(ℂ/Λ_τ,(τ/N,1/N)). Complex conjugation inverts pairing values.

**Moduli problems are not interchangeable.** Strict full ordered level (Xfull(N), Y_full(N)), a fixed Weil-pairing fibre (X(N,ζ), Y(N,ζ)), projective frames modulo scalars, the point-of-exact-order problem (X₁(N), whose objects are pairs (E,P)), the naive cyclic problem X₀(N)^naive and Česnavičius's refined X₀(N), and the mixed problems Γ₁(N;n) and Γ₁(N)∩Γ₀(p) are different moduli problems. Full level carries its cyclotomic determinant algebra and is not geometrically connected; a fixed pairing selects one component over ℤ[ζ_N]. The naive and refined Γ₀ stacks have the same coarse curve but are different stacks for N not squarefree. Γ₀ always has generic inertia {±1}.

**Stacks, coarse curves and models.** X(1)=Ell₁ is the stack of generalized elliptic curves with irreducible geometric fibres and Ell_m that of curves whose degenerate fibres are m-gons. For an open H, 𝒳_H is the level-H stack (the normalization of X(1) in the level-H cover of the elliptic locus, R13.4a); for the standard levels it is R13.2's moduli stack (Xfull(N), X₁(N), refined X₀(N)). X_H is its coarse curve, Y_H the elliptic open (each statement says whether the stack or the coarse space is meant), and X_H^∞ the scheme-theoretic fibre of X_H over j=∞. A stack, its formal framed atlas, its coarse space, a regular model and a semistable model after base extension are different objects; no property passes from one to another without the theorem that transfers it. In particular stack finite flatness does not give coarse finite flatness, and coarse formation commutes with arbitrary base change only in the range of R13.4a/legal-coarse-base-change.

**Degrees.** 𝒳_H has degree [GL₂(Ẑ):H] over X(1) and X_H has degree [GL₂(Ẑ):±H] over ℙ¹_j. The correspondence A_m uses every subgroup of order m and C_m only the cyclic ones; in characteristic zero their degrees are σ₁(m) and ψ(m)=m∏_{p|m}(1+1/p). Hermite normal form data are ad=m, 0≤b&lt;d, with the cyclic filter gcd(a,b,d)=1; for m=4 there are seven branches, six of them cyclic.

**Cusps, widths and the Hodge frame.** The effective cusp width w is computed in PSL₂ (with ±Γ), the strict width h in Γ; h=2w at an irregular cusp. Tau Ceti's `integerCuspWidth` is the strict width at ∞. The Tate coordinate is u=e^{2πiz}, the Tate parameter q=e^{2πiτ}, and the modular Hodge frame is 2πi dz=du/u; a weight-two form f corresponds to the differential 2πi f(τ)dτ=f dq/q. The individual-curve normalization dx/(2y)↔dz of the lattice cubic y²=x³−g₂x/4−g₃/4 is separate from this frame.

**Hecke conventions.** π₁ is the forgetful leg and π₂ the quotient leg of a degeneracy correspondence. On weight-k sections in characteristic zero the Hecke operator is n⁻¹ times raw isogeny pullback and trace (R12.5); on regular differentials the curve pullback and trace are used directly. The integral coherent trace on weight-k forms is pT_p, and division by p is a separate local theorem (R14.1). On Jacobians the Picard (upper) action is π₁∗π₂^∗=Alb(π₁)∘Pic⁰(π₂) and the Albanese (lower) action is π₂∗π₁^∗=Alb(π₂)∘Pic⁰(π₁); the classical cotangent action is the Albanese one, the Picard action is its adjoint, and w_ζ transports one to the other. The modular quotient A_f is formed with the Albanese action. Picard norms and étale traces count lengths and are never divided by the degree. On X₁(N) the Atkin–Lehner map is w_ζ, defined over the cyclotomic field; on X₀(N) exact divisors give rational involutions. A bad-prime U_p never uses a diamond ⟨p⟩ that does not exist.

**Cohomology conventions.** For weight k≥2 put r=k−2 and use Sym^r of the relative first cohomology of the actual universal elliptic curve over a fine level. Integral and adic statements keep their inverse-limit and torsion hypotheses; O is a complete discrete valuation ring finite over ℤ_ℓ. Parabolic cohomology is the image of compactly supported cohomology in ordinary cohomology. For nontrivial coefficients the cusps are truncated to boundary circles with their monodromy, rather than extended across the compact curve. Integral self-duality of Sym^r needs r! invertible or a separately compared divided-power dual lattice. Kummer theory gives T_ℓ Pic⁰ ≅ H¹_et(X,ℤ_ℓ(1)), and comparisons keep the twist and the transpose between the Picard and Albanese actions. Rational rank two over a Hecke factor never means integral rank two.

**Graphs and degenerations.** Dual graphs keep oriented branches, loops, multiple edges, component genera, cusp fields, node thicknesses and Galois actions. The character lattice is H₁ of the graph. Thicknesses weight the monodromy pairing and its component-group cokernel, and a ramified base change multiplies them. A local node uv=ϖⁿ is normal but not regular for n>1; regular resolution subdivides it into unit edges.

**Taylor–Wiles data.** ℓ is odd, Δ_Q is the actual finite abelian ℓ-group of the auxiliary primes, the auxiliary fine level R≥5 is kept at both ends, and ξ=diag(−1,1) acts with the minus eigenspace taken; minus cohomology is free over O[Δ_Q], with no Hecke multiplicity-one claim.

**Spellings across the node texts.** The R12 and R13.1–R13.2 nodes write Z, Q, C and H for ℤ, ℚ, ℂ and ℍ, and Eˢᵐ for the smooth locus E^sm. The targets R13.4a/split-cartan-quotient, R13.5/split-cartan-semistable-model and R13.5/split-cartan-thirteen-good-reduction, and the level-13 checks of R13.6, write X_s(ℓ) for the curve of the normalizer of a split Cartan subgroup, following Balakrishnan–Dogra–Müller–Tuitman–Vonk. The other R13.4a targets (cartan-level-curves, coarse-rational-points, atkin-lehner-quotient-curves) write X_s(ℓ) for the ordered split Cartan curve and X_s⁺(ℓ) for the normalizer curve. The normalizer curve is X₀(ℓ²)/w_{ℓ²} in both. The R14 nodes write J₁(N)=Pic⁰(X₁(N)) for the point-of-exact-order model with N≥5 over ℤ[1/N].

## The construction order

The layers are numbered by topic, and their numbers are not a construction order. At the level of individual targets the plan has no cycle, and the targets must be built in the following order where layers interlock.

- **Algebra before analysis.** The integral coarse curves are built algebraically in R13.4a, from the stacks of R13.2 and the formal cusp charts of R13.3, with no analytic input. R12.3 compares them with Γ\(ℍ∪ℙ¹(ℚ)), R12.6 descends that comparison to the fields of definition, and only then does R13.4b compare components, cusp fields and maps. The order is R13.1 → R13.2 → R13.3 → R13.4a → R12.3 → R12.6 → R13.4b. R12.4 uses only the open comparison of R12.2 and does not wait for R12.3.
- **Polygons before the projective-frame application.** R12.2/projective-prime-level-application uses the polygon automorphism groups of R13.1 to check the inertia at the boundary; the rest of R12.1–R12.2 uses no R13 target.
- **R13.4 is an interface.** It names the combination of R13.4a and R13.4b and owns no mathematics. A consumer cites the R13.4a or R13.4b targets it uses.
- **Correspondences and comparisons interleave.** The algebraic correspondences of R14.1 (degeneracy maps, diamonds, Atkin–Lehner involutions, full and cyclic correspondences, coherent trace) are constructed from R13.2 and R13.4a. R13.4b/compactified-map-comparison and R13.4b/hecke-normalization-comparison then compare them with the analytic maps, and R14.1/analytic-comparison-of-correspondences uses R13.4b/generic-component-comparison. Likewise the Atkin–Lehner quotient curves of R13.4a use R14.1/exact-divisor-atkin-lehner, which is constructed directly on the R13.4a curve. These targets are flagged *(later layer)* where they are cited.
- **The Jacobian prefix.** R14.2 constructs the Jacobian, its norms, both Hecke actions, the polarization and the Tate carrier without any rank statement. R14.3 proves the Eichler–Shimura isomorphism and rational rank two from that prefix; nothing in R14.2 uses R14.3.
- **Bad fibres.** R13.5 computes the local models and R13.6 exports their graphs. R13.6 uses the semistable-curve theory of LefschetzPencilsAndVanishingCycles LPV.7, and R14.6 the Tate and graph interfaces of NeronModelsAndSemistableAbelianVarieties R11.3–R11.4; neither uses WeightsInEtaleCohomology.

## Layer overview

The table counts the targets of each layer and the key objects and theorems drawn as planets in the atlas. Every target carries implementation status unchecked: this is a plan.

| Layer | Title | Targets | Planets |
| --- | --- | ---: | ---: |
| [R12.1](#r12-1) | Uniformisation of elliptic curves | 5 | 5 |
| [R12.2](#r12-2) | Level structures and quotient identification | 5 | 4 |
| [R12.3](#r12-3) | Cusps and compactification comparison | 4 | 4 |
| [R12.4](#r12-4) | Connectedness and twisted curves | 4 | 3 |
| [R12.5](#r12-5) | Differentials and Hecke normalisation | 6 | 6 |
| [R12.6](#r12-6) | Descent and compatibility statements | 5 | 5 |
| [R13.1](#r13-1) | Generalised elliptic curves | 11 | 6 |
| [R13.2](#r13-2) | Compactified level moduli | 8 | 6 |
| [R13.3](#r13-3) | Tate curves and formal neighbourhoods of cusps | 7 | 5 |
| [R13.4](#r13-4) | Integral coarse spaces and comparison with ModularCurves | 0 | 0 |
| [R13.4a](#r13-4a) | Algebraic coarse construction before analytic comparison | 30 | 6 |
| [R13.4b](#r13-4b) | Generic-fibre and correspondence compatibility | 3 | 0 |
| [R13.5](#r13-5) | Bad fibres and regular/semistable models | 8 | 5 |
| [R13.6](#r13-6) | Boundary and degeneration outputs | 4 | 2 |
| [R14.1](#r14-1) | Algebraic Hecke correspondences | 10 | 5 |
| [R14.2](#r14-2) | Jacobians and integral Hecke actions | 7 | 4 |
| [R14.3](#r14-3) | Cohomological realisations and pairings | 14 | 5 |
| [R14.4](#r14-4) | Ihara and level-change statements | 10 | 6 |
| [R14.5](#r14-5) | Modular quotients | 8 | 4 |
| [R14.6](#r14-6) | Bad-prime and patching interfaces | 11 | 5 |

Each target below is presented in the same order: its kind, identifier and planet name; its exact statement; its hypotheses and conventions; its proof plan; for definitions and constructions, its planning API (proposed declaration names relative to `TauCeti.ModularCurves` unless stated) and at least three unit tests, each chosen so that a plausible wrong definition fails one; the uses that justify the API; its prerequisites (Mathlib or Tau Ceti declarations, layers of existing Tau Ceti roadmaps, targets of other roadmaps, and targets of this roadmap, with a flag when the cited target sits in a later-numbered layer); the targets of this roadmap that consume it; acceptance checks; and source locators by theorem, section and page. Where a layer of this roadmap is cited as a whole, the targets actually used are listed. Within a layer, targets are ordered so that each comes after the targets of that layer it uses.

<a id="r12-1"></a>

## R12.1. Uniformisation of elliptic curves

A complex elliptic curve is a complex torus. Starting from Mathlib's lattice functions (`PeriodPair`, ℘, ℘′, g₂, g₃), construct the normalized Weierstrass cubic of a lattice and its uniformization, prove that every smooth projective Weierstrass curve over ℂ arises in this way, match homotheties and lattice inclusions with isomorphisms and isogenies, identify the invariant differential with dz and its periods with the lattice, and evaluate Tau Ceti's scheme Weil pairing on the torsion of a torus. This is the uniformization of one curve; the uniformization of the moduli curves begins in R12.2. The complex-analytic spaces and analytification used here are those of AlgebraicModuliForArithmeticGeometry A0-extension.

<a id="r12-1-lattice-weierstrass-model"></a>

### The normalized lattice Weierstrass model

**Construction** · `ModularCurvesPartII:R12.1/lattice-weierstrass-model` · planet: *Lattice Weierstrass model*

For a native PeriodPair L, define W_L with a₁=a₂=a₃=0, a₄=−L.g₂/4 and a₆=−L.g₃/4. Its discriminant is L.g₂³−27L.g₃² and is nonzero. The projective map z↦[℘_L(z):℘′_L(z)/2:1] off the lattice extends across each lattice point by O=[0:1:0] and descends to a pointed biholomorphism C/L.lattice ≅ W_L^an. It intertwines addition with the algebraic group law.

**Hypotheses and conventions.**

- The lattice has rank two over Z and spans C over R. Its orientation is not part of PeriodPair; choose an oriented basis only when normalizing to H.
- Projective affine coordinates use the native Weierstrass equation y²=x³−g₂x/4−g₃/4. Totalized native ℘ values at a pole are not projective coordinates.

**Proof plan.**

1. Use the native differential equation away from the lattice. Laurent expansions ℘=z⁻²+O(z²), ℘′=−2z⁻³+O(z) give the projective extension at O.
2. Count zeros of the elliptic function ℘−x to obtain a two-sheeted x-map and injectivity once ℘′ is included. Its three nonzero half-periods have distinct x-values; hence the cubic discriminant is nonzero.
3. Periodicity descends the map; compactness and the local charts show it is a biholomorphism. The explicit ℘ addition formula identifies the group laws.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.latticeWeierstrass` | constructor | The five-coefficient W_L over C. |
| `TauCeti.ModularCurves.latticeWeierstrass_discriminant` | characterisation | W_L.Δ=L.g₂³−27L.g₃². |
| `TauCeti.ModularCurves.latticeWeierstrass_isElliptic` | instance | W_L is elliptic for every native PeriodPair. |
| `TauCeti.ModularCurves.latticeUniformization` | equivalence | A pointed analytic group isomorphism C/Λ_L→W_L^an. |
| `TauCeti.ModularCurves.latticeUniformization_zero` | simp | The zero class maps to the projective identity. |

**Unit tests.**

- `TauCeti.ModularCurves.latticeWeierstrass_equation` (compatibility): For z∉Λ_L, (℘′_L(z)/2)²=℘_L(z)³−g₂℘_L(z)/4−g₃/4.
- `TauCeti.ModularCurves.latticeUniformization_pole` (degenerate): The class of any lattice point maps to O, not the affine pair of totalized native function values.
- `TauCeti.ModularCurves.latticeWeierstrass_square` (computation): For Λ=Z+iZ, g₃=0 and j(W_L)=1728.
- `TauCeti.ModularCurves.latticeWeierstrass_collapsed_basis` (non-example): Periods 1 and 2 do not form a PeriodPair, so no elliptic W_L is produced by this construction.

**Uses.**

- [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization) (Pointed elliptic uniformization): Constructs the inverse lattice-to-curve functor.
- [`R12.2/marked-torus-family`](#r12-2-marked-torus-family) (The marked torus family over the upper half-plane): Supplies its fibrewise Weierstrass coordinates.

**Prerequisites.**

- `mathlib:PeriodPair`
- `mathlib:PeriodPair.weierstrassP`
- `mathlib:PeriodPair.derivWeierstrassP`
- `mathlib:PeriodPair.g₂`
- `mathlib:PeriodPair.g₃`
- `mathlib:PeriodPair.derivWeierstrassP_sq`
- `mathlib:WeierstrassCurve`
- `mathlib:WeierstrassCurve.IsElliptic`
- `tauceti:TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models`
- `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`
- `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`

**Consumers in this roadmap.** [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization); [`R12.2/marked-torus-family`](#r12-2-marked-torus-family)

**Acceptance checks.**

- Verify the factors 1/2, 1/4 and Δ=g₂³−27g₃² against the native equation.
- The zero lattice class maps to O; no evaluation of a native junk value is used.

**Sources.**

- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, Propositions 3.11–3.13, pp.46–47. The lattice cubic and the projective uniformization.
- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 2.9, p.4, corrected domain as E106 below. The projective map in a varying lattice.

<a id="r12-1-pointed-elliptic-uniformization"></a>

### Pointed elliptic uniformization

**Theorem** · `ModularCurvesPartII:R12.1/pointed-elliptic-uniformization` · planet: *Elliptic uniformization*

For a smooth projective Weierstrass elliptic curve E/C with identity O, the complex analytification of AlgebraicModuliForArithmeticGeometry A0-extension (its package §7.10.1) is a compact connected one-dimensional complex Lie group. There is a rank-two discrete lattice Λ⊂C and a pointed holomorphic group isomorphism C/Λ→E^an. Conversely every such lattice is realized by the preceding Weierstrass model. Isomorphisms of pointed elliptic curves correspond to nonzero homotheties uΛ=Λ′; general holomorphic group homomorphisms correspond to complex-linear maps z↦uz with uΛ⊂Λ′, including u=0. Algebraic and analytic pointed morphisms agree.

**Hypotheses and conventions.**

- E is smooth, projective, geometrically connected of genus one, with its algebraic group law.
- Use the projective points dictionary, not only the affine solution set.

**Proof plan.**

1. Analytify the smooth projective curve and its group maps. Proper coherent comparison (properSchemeGagaPushforward in AlgebraicModuli package §7.10.3) gives H⁰(E^an,O)=C, hence connectedness, and compact-surface cohomology identifies its analytic genus as one; choose the nonzero algebraic invariant differential ω.
2. Integrate ω around an oriented integral homology basis. The bilinear relation and positivity of iω∧conjugate(ω) make its two periods real-linearly independent. Integration from O defines E^an→C/Λ; it is a local isomorphism since ω never vanishes. Compactness and connectedness make it a covering onto the torus. Its induced homology image is the whole period lattice by definition, hence the covering has degree one. Invariance of ω identifies the group law.
3. Use the explicit lattice Weierstrass map for the inverse construction. Lift pointed group maps to the universal covers; their additive holomorphic lifts are complex-linear. Proper-source morphism comparison algebraizes maps between the proper algebraic curves.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.pointedEllipticUniformization` | characterisation | For a smooth projective Weierstrass elliptic curve E/C with identity O, the complex analytification of AlgebraicModuliForArithmeticGeometry A0-extension (its package §7.10.1) is a compact connected one-dimensional complex Lie group. There is a rank-two discrete lattice Λ⊂C and a pointed holomorphic group isomorphism C/Λ→E^an. Conversely every such lattice is realized by the preceding Weierstrass model. Isomorphisms of pointed elliptic curves correspond to nonzero homotheties uΛ=Λ′; general holomorphic group homomorphisms correspond to complex-linear maps z↦uz with uΛ⊂Λ′, including u=0. Algebraic and analytic pointed morphisms agree. |

**Prerequisites.**

- [`R12.1/lattice-weierstrass-model`](#r12-1-lattice-weierstrass-model) (The normalized lattice Weierstrass model)
- `tauceti:TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models`
- `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`
- `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`
- `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`
- `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`

**Consumers in this roadmap.** [`R12.1/homothety-and-isogeny-compatibility`](#r12-1-homothety-and-isogeny-compatibility); [`R12.1/invariant-differentials-and-periods`](#r12-1-invariant-differentials-and-periods); [`R12.1/analytic-algebraic-weil-pairing`](#r12-1-analytic-algebraic-weil-pairing)

**Acceptance checks.**

- O maps to the zero class, and the map is a group isomorphism.
- A translation by a nonzero point is excluded from pointed group homomorphisms.
- At j=0 and 1728 retain the extra pointed automorphisms.

**Sources.**

- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, pp.41–47, especially Propositions 3.12–3.13. Uniformization and homothety classification.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1, pp.17–18. Pointed elliptic curves as complex tori.

<a id="r12-1-homothety-and-isogeny-compatibility"></a>

### Homotheties and lattice isogenies

**Theorem** · `ModularCurvesPartII:R12.1/homothety-and-isogeny-compatibility` · planet: *Lattice isogenies*

If u≠0 and Λ′=uΛ, then g₂(Λ′)=u⁻⁴g₂(Λ), g₃(Λ′)=u⁻⁶g₃(Λ), and the corresponding cubic isomorphism is (x,y)↦(u⁻²x,u⁻³y). For uΛ⊂Λ′ the induced pointed map has kernel u⁻¹Λ′/Λ and degree [Λ′:uΛ]. Its pullback sends dz on C/Λ′ to u dz on C/Λ. These comparisons commute with composition, dual isogenies and the imported algebraic quotient.

**Hypotheses and conventions.**

- u is a nonzero complex number; the inclusion of full lattices has finite index.
- The coordinate change is for the forward map z↦uz, so its differential multiplier is u.

**Proof plan.**

1. Reindex the absolutely convergent Eisenstein sums and ℘ series under multiplication by u.
2. Pass to the quotients and count the kernel by the lattice index. Algebraize the pointed map using C4 and compare degrees on a finite covering.
3. Composition gives the isogeny and differential compatibilities; identify duals by their composite with multiplication.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.homothetyAndIsogenyCompatibility` | characterisation | If u≠0 and Λ′=uΛ, then g₂(Λ′)=u⁻⁴g₂(Λ), g₃(Λ′)=u⁻⁶g₃(Λ), and the corresponding cubic isomorphism is (x,y)↦(u⁻²x,u⁻³y). For uΛ⊂Λ′ the induced pointed map has kernel u⁻¹Λ′/Λ and degree [Λ′:uΛ]. Its pullback sends dz on C/Λ′ to u dz on C/Λ. These comparisons commute with composition, dual isogenies and the imported algebraic quotient. |

**Prerequisites.**

- [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization) (Pointed elliptic uniformization)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`
- `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`

**Consumers in this roadmap.** [`R12.1/invariant-differentials-and-periods`](#r12-1-invariant-differentials-and-periods); [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison); [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action)

**Acceptance checks.**

- For Λ′=Λ and u=n, multiplication by n has degree n².
- For u=2 with Λ′=2Λ the map is an isomorphism and pulls dz back to 2 dz.

**Sources.**

- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, pp.41–47. Homothety and the lattice cubic.
- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §5, Proposition 5.16, p.13. A map of complex elliptic curves corresponds to a commutative square of lattice quotients; this is the lattice description of homomorphisms used here.

<a id="r12-1-invariant-differentials-and-periods"></a>

### Invariant differentials and periods

**Theorem** · `ModularCurvesPartII:R12.1/invariant-differentials-and-periods` · planet: *Elliptic periods*

Under the normalized lattice uniformization, the algebraic invariant differential dx/(2y) pulls back to dz. For any E/C and nonzero invariant differential ω, its period homomorphism H₁(E^an,Z)→C has image a full lattice Λ_ω, and integration from O gives E^an≅C/Λ_ω with ω corresponding to dz. Changing ω to cω changes the period lattice to cΛ_ω. An oriented integral homology basis gives τ=ω₂/ω₁∈H and the usual positive Riemann bilinear area.

**Hypotheses and conventions.**

- Use the complex orientation on E^an and a positively oriented homology basis.
- The differential line is imported from MC1C. The period map is the concrete integration map, not an arbitrary rank-two subgroup.

**Proof plan.**

1. Compute dx/(2y)=d℘/℘′=dz off the finite half-period locus and extend the equality of holomorphic forms.
2. Pull an invariant differential back along the preceding pointed lattice uniformization; translation invariance makes it a constant nonzero multiple of dz. A lift of a homology loop ends at the corresponding lattice point, so integration identifies H₁ with the period lattice.
3. Positivity of iω∧ω̄ fixes the orientation; rescaling the differential gives the homothety formula.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.invariantDifferentialsAndPeriods` | characterisation | Under the normalized lattice uniformization, the algebraic invariant differential dx/(2y) pulls back to dz. For any E/C and nonzero invariant differential ω, its period homomorphism H₁(E^an,Z)→C has image a full lattice Λ_ω, and integration from O gives E^an≅C/Λ_ω with ω corresponding to dz. Changing ω to cω changes the period lattice to cΛ_ω. An oriented integral homology basis gives τ=ω₂/ω₁∈H and the usual positive Riemann bilinear area. |

**Prerequisites.**

- [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization) (Pointed elliptic uniformization)
- [`R12.1/homothety-and-isogeny-compatibility`](#r12-1-homothety-and-isogeny-compatibility) (Homotheties and lattice isogenies)
- `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`
- `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`

**Consumers in this roadmap.** [`R12.1/analytic-algebraic-weil-pairing`](#r12-1-analytic-algebraic-weil-pairing); [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement); [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy)

**Acceptance checks.**

- The invariant form is dz, whereas the modular/Tate frame used in R12.5 is 2πi dz.
- Rescaling ω changes both periods by the same scalar and leaves τ unchanged.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §1, p.2; §6, Example 6.2, p.14. The periods of a nonzero holomorphic differential on a homology basis are real-linearly independent (p.2), and H₁ of a lattice quotient is the lattice itself (Example 6.2).
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, Proposition 3.12, p.47. The lattice cubic and the map z↦[℘(z):℘′(z):1]; the identity dx/y=dz for y=℘′ follows from it, and this node rescales y to ℘′/2 so that dx/(2y)=dz.

<a id="r12-1-analytic-algebraic-weil-pairing"></a>

### The analytic Weil-pairing comparison

**Theorem** · `ModularCurvesPartII:R12.1/analytic-algebraic-weil-pairing` · planet: *Weil-pairing comparison*

Fix Λ=Zω₁+Zω₂ with Im(ω₂/ω₁)>0 and N≥1. With the Tau Ceti pairing e_N(S,T)=τ_S^\*g_T/g_T of Silverman III.8, where g_T has divisor [N]^\*(T)−[N]^\*(O) and τ_S is translation X↦X+S, e_N((aω₁+bω₂)/N,(cω₁+dω₂)/N)=exp(−2πi(ad−bc)/N). This is the imported algebraic Weil pairing evaluated on the corresponding torsion sections, and is compatible with homotheties, isogenies and their duals, and change of level. In particular on Λ_τ=Z+Zτ the ordered frame (τ/N,1/N) has pairing ζ_N=exp(2πi/N), and the frame (1/N,τ/N) has pairing ζ_N⁻¹.

**Hypotheses and conventions.**

- The displayed coefficients are integers interpreted modulo N.
- The sign is fixed by the Tau Ceti definition e_N(S,T)=τ_S^\*g_T/g_T; exchanging the roles of S and T inverts every value. Conrad’s normalization ⟨τ/N,1/N⟩=ζ_N (proof of Proposition 7.16) is the same as the Tau Ceti one; the caution there concerns Silverman’s Advanced Topics, Exercise 1.15, not the AEC III.8 divisor definition. Milne’s Lemma 8.7 uses the same frame (z/N,1/N).
- The algebraic group-scheme pairing and its comparison with the equation-level pairing are MC2E inputs, not reconstructed here.

**Proof plan.**

1. Identify N-torsion by the quotient (1/N)Λ/Λ.
2. For T=t mod Λ with λ=Nt∈Λ take g_T(z)=σ(Nz−t)σ(Nz)⁻¹exp(η(λ)z), with σ the Weierstrass sigma function and η the quasi-period homomorphism; it is Λ-periodic with divisor [N]^\*(T)−[N]^\*(O). Quasi-periodicity of σ gives e_N(S,T)=g_T(z+s)/g_T(z)=exp((η(λ)μ−η(μ)λ)/N) for μ=Ns.
3. Legendre’s relation η(ω₁)ω₂−η(ω₂)ω₁=2πi for Im(ω₂/ω₁)>0 gives e_N(ω₁/N,ω₂/N)=exp(−2πi/N); bilinearity gives every coefficient. Apply the imported algebraic isogeny and change-of-level laws.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.analyticAlgebraicWeilPairing` | characterisation | Fix Λ=Zω₁+Zω₂ with Im(ω₂/ω₁)>0 and N≥1. With the Tau Ceti pairing e_N(S,T)=τ_S^\*g_T/g_T of Silverman III.8, where g_T has divisor [N]^\*(T)−[N]^\*(O) and τ_S is translation X↦X+S, e_N((aω₁+bω₂)/N,(cω₁+dω₂)/N)=exp(−2πi(ad−bc)/N). This is the imported algebraic Weil pairing evaluated on the corresponding torsion sections, and is compatible with homotheties, isogenies and their duals, and change of level. In particular on Λ_τ=Z+Zτ the ordered frame (τ/N,1/N) has pairing ζ_N=exp(2πi/N), and the frame (1/N,τ/N) has pairing ζ_N⁻¹. |

**Prerequisites.**

- [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization) (Pointed elliptic uniformization)
- [`R12.1/invariant-differentials-and-periods`](#r12-1-invariant-differentials-and-periods) (Invariant differentials and periods)
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`

**Consumers in this roadmap.** [`R12.2/marked-torus-family`](#r12-2-marked-torus-family); [`R12.6/complex-conjugation-comparison`](#r12-6-complex-conjugation-comparison)

**Acceptance checks.**

- For N=3 on Λ_τ, e(τ/3,1/3)=ζ₃ and e(1/3,τ/3)=ζ₃⁻¹.
- A Jacobi-theta evaluation of g_T(z+s)/g_T(z) for N=3 and a sample τ in H returns ζ₃⁻¹ for S=1/3, T=τ/3.
- The determinant of a changed frame is the pairing exponent.
- For N=1 the pairing is 1 and the single trivial level is retained.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 7.16 and its proof, Remark 7.17, p.17; §8, Theorem 8.5 and Remark 8.7, pp.17–19. Conrad normalizes the holomorphically varying pairing by ⟨τ/N,1/N⟩=e^{2πi/N}, which agrees with the Tau Ceti pairing; Remark 8.7 lists the points of the fixed-pairing problem as (C/Λ_τ,(rτ/N,1/N)).

<a id="r12-2"></a>

## R12.2. Level structures and quotient identification

The marked torus family over ℍ, with its frames (1/N,τ/N), realizes every complex elliptic curve with level structure. It turns the algebraic open curves of ModularCurves (Y(N,ζ), Y₁(N), Y₀(N)) into the analytic quotients Γ\ℍ, as isomorphisms of complex analytic curves and not only as bijections of points. The layer fixes the row action, determinant and diamond conventions used throughout, the stabilizers at small level (where the fine curve becomes a coarse quotient), and the projective-frame quotient of Bakker–Tsimerman with its two determinant components.

<a id="r12-2-marked-torus-family"></a>

### The marked torus family over the upper half-plane

**Construction** · `ModularCurvesPartII:R12.2/marked-torus-family` · planet: *Marked torus family*

Over H form T=(C×H)/((z,τ)∼(z+m+nτ,τ)), m,n∈Z. This is a proper smooth analytic group family with identity, and its sections P=1/N and Q=τ/N give an ordered N-torsion basis with Tau Ceti pairing e_N(P,Q)=ζ_N⁻¹, equivalently e_N(Q,P)=ζ_N. For γ=[[a,b],[c,d]]∈SL₂(Z), the algebraic row action (P,Q)γ=(aP+cQ,bP+dQ) matches the analytic right action τ·γ=(dτ+b)/(cτ+a) and the fibre isomorphism z↦z/(a+cτ). In usual left-action notation ητ=(ατ+β)/(γτ+δ), its label matrix is [[δ,β],[γ,α]].

**Hypotheses and conventions.**

- τ∈H and N≥1; the right action is the usual left action of Jγ⁻¹J with J=diag(1,−1).
- The quotient uses a sheaf of holomorphic functions descended along the lattice covering; it is not merely a topological orbit set.
- Base change of the family is analytic; the general relative torus and period machinery is imported from A5.

**Proof plan.**

1. On compact subsets of H, real independence bounds lattice vectors away from zero; lattice translations act freely and locally discretely, giving holomorphic quotient charts.
2. Use a varying fundamental parallelogram to prove properness and smoothness. Joint ℘ functions away from the relative lattice, and their projective extensions, identify the family with varying Weierstrass models.
3. Check the displayed right action by applying z↦z/(a+cτ) to the two transformed sections; then verify composition of the row actions.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.markedTorusFamily` | constructor | The proper analytic elliptic family T→H with identity. |
| `TauCeti.ModularCurves.markedTorusFamily_level` | data | The frame (1/N,τ/N). |
| `TauCeti.ModularCurves.markedTorusFamily_pullback` | functoriality | A holomorphic map S→H pulls back T and its frame. |
| `TauCeti.ModularCurves.markedTorusFamily_changeMarking` | compatibility | The row action γ has base map τ·γ and fibre multiplier (a+cτ)⁻¹. |
| `TauCeti.ModularCurves.markedTorusFamily_weilPairing` | characterisation | e_N(P,Q)=ζ_N⁻¹ and e_N(Q,P)=ζ_N for the Tau Ceti pairing and τ∈H. |

**Unit tests.**

- `TauCeti.ModularCurves.markedTorusFamily_T` (computation): For γ=[[1,1],[0,1]], τ·γ=τ+1 and the changed frame is (P,P+Q).
- `TauCeti.ModularCurves.markedTorusFamily_S` (computation): For γ=[[0,−1],[1,0]], τ·γ=−1/τ and (P,Q)γ=(Q,−P).
- `TauCeti.ModularCurves.markedTorusFamily_zeroLevel` (degenerate): At N=1 both level sections are the identity; the family remains nontrivial.
- `TauCeti.ModularCurves.markedTorusFamily_borelDiamond` (compatibility): When c≡0 modulo N, its row action on the retained Γ₁ generator is P↦aP=d⁻¹P, not dP.

**Uses.**

- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level): Provides holomorphic local moduli maps.
- [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy) (The Hodge line and the automorphy factor): Fixes the fibre differential multiplier.

**Prerequisites.**

- [`R12.1/lattice-weierstrass-model`](#r12-1-lattice-weierstrass-model) (The normalized lattice Weierstrass model)
- [`R12.1/analytic-algebraic-weil-pairing`](#r12-1-analytic-algebraic-weil-pairing) (The analytic Weil-pairing comparison)
- `AbelianSchemesAndArithmeticModuli:A5`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`

**Consumers in this roadmap.** [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization); [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy)

**Acceptance checks.**

- Use the same row action as MC9B.
- The family, section and isomorphism diagrams commute after every holomorphic base change.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Example 2.5, Proposition 2.6, Remark 2.8 and Proposition 2.9, pp.3–4. The relative lattice quotient and its holomorphic charts.
- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §7, p.15; §8, p.18. A matrix γ acts on the Weierstrass family by τ↦γτ on the base and z↦z/(cτ+d) on fibres; the row-action form here is the transpose of that left action.

<a id="r12-2-open-level-uniformization"></a>

### Open modular uniformization with the specified level

**Theorem** · `ModularCurvesPartII:R12.2/open-level-uniformization` · planet: *Open modular uniformization*

The marked torus family induces an isomorphism from the supplied analytic quotient curve to the analytification of the imported algebraic open modular curve: Γ(N)\\H→Y(N,ζ_N)^an for a fixed pairing, through τ↦(C/Λ_τ,(τ/N,1/N)) (the frame (1/N,τ/N) of the marked family has pairing ζ_N⁻¹ and lands in Y(N,ζ_N⁻¹)), Γ₁(N)\\H→Y₁(N)^an, and Γ₀(N)\\H→Y₀(N)^an. Interpret the first as a fine curve for N≥3 and the second for N≥4; at smaller levels and for Γ₀ use the coarse quotient with its stabilizer charts. Strict full ordered level is the disjoint union of φ(N) pairing components over C, with one such quotient for each primitive pairing value. These isomorphisms identify the corresponding local families on rigidified charts.

**Hypotheses and conventions.**

- N≥1 and the base is C. Full ordered level, a fixed pairing and a projective frame are three separate moduli problems.
- The algebraic models and representability are MC5A/5B/9D/9E inputs; Γ₀ uses cyclic subgroups and always has generic [−1] inertia.
- The target statement is an isomorphism of complex analytic curves, including their structure sheaves, not only a bijection of complex points.

**Proof plan.**

1. Classify elliptic curves and their torsion labels by R12.1; changing a marking gives precisely the displayed congruence stabilizer. This supplies the point bijection.
2. For a local analytic family with a marking, A5 gives holomorphic period coordinates. The Weierstrass presentation and analytified étale rigidifier show that the forward map and the local inverse are holomorphic on fine charts.
3. For coarse cases choose an auxiliary prime-to-N full level ≥3, perform the fine comparison there, and descend finite quotient charts using stabilizer-equivariance. Do not infer local isomorphism from point bijectivity.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.openLevelUniformization` | characterisation | The marked torus family induces an isomorphism from the supplied analytic quotient curve to the analytification of the imported algebraic open modular curve: Γ(N)\\H→Y(N,ζ_N)^an for a fixed pairing, through τ↦(C/Λ_τ,(τ/N,1/N)) (the frame (1/N,τ/N) of the marked family has pairing ζ_N⁻¹ and lands in Y(N,ζ_N⁻¹)), Γ₁(N)\\H→Y₁(N)^an, and Γ₀(N)\\H→Y₀(N)^an. Interpret the first as a fine curve for N≥3 and the second for N≥4; at smaller levels and for Γ₀ use the coarse quotient with its stabilizer charts. Strict full ordered level is the disjoint union of φ(N) pairing components over C, with one such quotient for each primitive pairing value. These isomorphisms identify the corresponding local families on rigidified charts. |

**Prerequisites.**

- [`R12.2/marked-torus-family`](#r12-2-marked-torus-family) (The marked torus family over the upper half-plane)
- `tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures`
- `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`
- `AbelianSchemesAndArithmeticModuli:A5`
- `ComplexComparisonPartII:C4/family-morphism-interface`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`

**Consumers in this roadmap.** [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison); [`R12.2/stabilizers-and-small-levels`](#r12-2-stabilizers-and-small-levels); [`R12.2/projective-prime-level-application`](#r12-2-projective-prime-level-application); [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization); [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement); [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness); [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison); [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels)

**Acceptance checks.**

- For N=2 the coarse full-level curve is A¹_C\\{0,1}; its level stack retains [−1].
- For N≥3 the fixed-pairing curve is connected; the unrestricted full curve has φ(N) components.
- Every local inverse preserves the analytic structure sheaf.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §§8–9, pp.17–24; Theorem 17.21, p.42. Fine complex level curves as quotients of the Weierstrass family, and the comparison of algebraic and analytic moduli for fine Y.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemmas 8.5 and 8.7, pp.99–100. The Γ₀ and full-level orbit classifications; Lemma 8.7 uses the frame (z/N,1/N) with Silverman’s pairing, i.e. the frame (Q,P) of the marked family.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–25. The open moduli interpretation.

<a id="r12-2-level-map-and-diamond-comparison"></a>

### Level maps and diamond operators

**Theorem** · `ModularCurvesPartII:R12.2/level-map-and-diamond-comparison` · planet: *Level-map comparison*

The open comparisons commute with division of levels, forgetting Q, retaining the cyclic subgroup generated by P, and every row action by a constant matrix in GL₂(Z/NZ). A row action with determinant r sends pairing ζ to ζ^r. On the Γ₁ quotient the algebraic diamond action is P↦aP; for an upper triangular SL₂ label matrix it is a=d⁻¹ modulo N. The induced map for Γ₀ agrees with the algebraic quotient isogeny E→E/⟨P⟩ and the analytic lattice map. At N=4 and above use the imported fine Y₁ carrier without enlarging its base.

**Hypotheses and conventions.**

- All levels here are invertible over C. An action whose determinant changes the pairing is not an endomorphism of a single fixed-pairing component.
- Use the right action of the previous node; the usual left action has the transformed label matrix stated there.

**Proof plan.**

1. Evaluate each map on the marked torus sections and apply the analytic pairing determinant formula.
2. The row quotient identifications are imported from MC9B; the local family comparison makes the diagrams holomorphic, so their pointwise equality is an equality of morphisms.
3. Identify isogeny quotients with the lattice quotient by R12.1 and the imported algebraic quotient universal property.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.levelMapAndDiamondComparison` | characterisation | The open comparisons commute with division of levels, forgetting Q, retaining the cyclic subgroup generated by P, and every row action by a constant matrix in GL₂(Z/NZ). A row action with determinant r sends pairing ζ to ζ^r. On the Γ₁ quotient the algebraic diamond action is P↦aP; for an upper triangular SL₂ label matrix it is a=d⁻¹ modulo N. The induced map for Γ₀ agrees with the algebraic quotient isogeny E→E/⟨P⟩ and the analytic lattice map. At N=4 and above use the imported fine Y₁ carrier without enlarging its base. |

**Prerequisites.**

- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- [`R12.1/homothety-and-isogeny-compatibility`](#r12-1-homothety-and-isogeny-compatibility) (Homotheties and lattice isogenies)
- `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`

**Consumers in this roadmap.** [`R12.3/cusp-ramification-and-level-maps`](#r12-3-cusp-ramification-and-level-maps); [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels); [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison); [`R12.6/gamma-zero-rational-function-field`](#r12-6-gamma-zero-rational-function-field); [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility)

**Acceptance checks.**

- A matrix with determinant 2 at N=5 moves the ζ₅ component to the ζ₅² component.
- For γ in Γ₁(N), a≡d≡1 and c≡0, so the retained P section is fixed.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §5, Proposition 5.16, p.13; §9, pp.20–24. Homomorphisms of complex elliptic curves as lattice maps, and level quotients.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemma 8.5 and subsequent quotient-isogeny description, p.99. The Γ₀ quotient isogeny.

<a id="r12-2-stabilizers-and-small-levels"></a>

### Small-level stabilizers and coarse quotients

**Theorem** · `ModularCurvesPartII:R12.2/stabilizers-and-small-levels` · planet: *Small-level stabilizers*

Over C, a strict ordered full N-frame has no pointed automorphisms for N≥3; a point of exact order N has no pointed automorphisms for N≥4 on the open curve. At N=1 the elliptic stabilizers are generically μ₂, with μ₄ and μ₆ at the special j-values; at strict full N=2 the labels leave only μ₂. Γ₀ retains [−1] generically at every N and may have larger elliptic stabilizers. A scalar-equivalence class of a full frame retains [−1] when N>2. The analytic coarse local chart at a point is U/Aut(E,level), using a finite local chart U; the global infinite-group projection H→Γ\\H is not a finite map.

**Hypotheses and conventions.**

- The statements concern pointed automorphisms of the elliptic curve, not translations.
- Fine assertions apply only to the stated open moduli; they do not imply the same compactification is fine at its cusps.

**Proof plan.**

1. Use the imported rigidity theorem for strict full or Γ₁ level and compute how −1 acts on the torsion labels.
2. At j=1728 and j=0 check the finite pointed automorphism groups against the labels.
3. Use properly discontinuous local charts and finite stabilizer quotients from MF10A; correct the global finiteness assertion in the classical handout as recorded in E108.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.stabilizersAndSmallLevels` | characterisation | Over C, a strict ordered full N-frame has no pointed automorphisms for N≥3; a point of exact order N has no pointed automorphisms for N≥4 on the open curve. At N=1 the elliptic stabilizers are generically μ₂, with μ₄ and μ₆ at the special j-values; at strict full N=2 the labels leave only μ₂. Γ₀ retains [−1] generically at every N and may have larger elliptic stabilizers. A scalar-equivalence class of a full frame retains [−1] when N>2. The analytic coarse local chart at a point is U/Aut(E,level), using a finite local chart U; the global infinite-group projection H→Γ\\H is not a finite map. |

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures`
- `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`

**Consumers in this roadmap.** [`R12.2/projective-prime-level-application`](#r12-2-projective-prime-level-application)

**Acceptance checks.**

- For N=2, a quadratic twist of a generic Legendre curve over C(t) has the same λ and rational full two-torsion, but need not be isomorphic to it.
- A generic Γ₀(5) object still has the automorphism −1.
- Y₁(4) is fine over C although its compactification has an irregular cusp with inertia.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 16.4 and Theorem 17.1, p.37; §9, pp.20–24. Full-level rigidity and fine moduli.
- [`conrad-classical`](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), Proposition 3.1 and its local-chart proof, pp.3–4. The finite local quotient, with the global finiteness assertion corrected.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), Example 8.9, p.100, corrected. The level-two coarse Legendre parameter.

<a id="r12-2-projective-prime-level-application"></a>

### Projective full level in the Bakker–Tsimerman setting

**Application** · `ModularCurvesPartII:R12.2/projective-prime-level-application`

For a prime p>3, take strict full p-frames modulo simultaneous multiplication by F_p^×. Their determinant values modulo squares give two geometric components. Each coarse component is the compactification of the effective Γ(p) quotient. The projective-frame stack has generic μ₂ inertia; rigidifying that central μ₂ gives the smooth full-level curve for p>3. Its forgetful quotient by the effective deck group is the (2,3,p) orbifold on the rigidified bare-polygon moduli stack: the quotient map has elliptic branch orders 2 and 3 and boundary order p. On a strict full p-component the effective index is (p³−p)/2, the number of cusps is (p²−1)/2 and the genus is (p+2)(p−3)(p−5)/24. These are applications of MF10A/10B, not new dimension-formula targets.

**Hypotheses and conventions.**

- p is an odd prime greater than 3. Keep the full-frame, scalar quotient, μ₂-rigidification and coarse curve as separate objects.
- A bare p-gon has group-scheme automorphisms μ_p×Z/2; its geometric automorphism count in characteristic zero is 2p. The p-fold effective cusp description uses the indicated quotient/rigidification.

**Proof plan.**

1. The scalar action changes a determinant by a square, giving the two classes in F_p^×/(F_p^×)². The stabilizer of a class always includes −1; rigidifying this central μ₂ (AlgebraicModuli R09.5 rigidification) gives the rigidified full-level stack, whose coarse curve is unchanged.
2. Use the open comparison and the imported cusp stabilizer and genus formulas; full Γ(p) is torsion free effectively for p>3.
3. The R13.1 polygon automorphism theorem supplies the boundary inertia check; no false fine universal-family statement is used.

**Prerequisites.**

- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- [`R12.2/stabilizers-and-small-levels`](#r12-2-stabilizers-and-small-levels) (Small-level stabilizers and coarse quotients)
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`
- `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`
- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons) *(later layer R13.1)*
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`

**Acceptance checks.**

- For p=5 a component has 12 cusps and genus 0; for p=7 it has 24 cusps and genus 3.
- Strict full p-level has p−1 pairing components; the scalar quotient has two.
- Retaining −1 prevents treating the scalar quotient as a fine universal elliptic scheme.

**Sources.**

- [`bt`](https://benjamin-bakker.github.io/P.torsion.pdf), published §§2.1–2.2 (not re-read; see sourceVersions). The projective level convention and its effective quotient geometry.
- [`bt-preprint`](https://arxiv.org/pdf/1403.7168v2), §§2.1–2.2, pp.5–6. Y(p) with frames up to scale, its two components by the square class of the pairing, PGL₂(F_p) action and ramification orders p, 2, 3 over X(1); the polygon automorphisms. The index, cusp and genus counts are computed from ModularForms 10A/10B, not read from this source.

<a id="r12-3"></a>

## R12.3. Cusps and compactification comparison

Extend the open comparison to the compact curves. The algebraic compact curve is the coarse curve of R13.4a, built without analysis; the analytic one is the compactification Γ\(ℍ∪ℙ¹(ℚ)) of ModularForms 10A. Match the Tate parameter of R13.3 with the analytic cusp parameter of effective width w, compute the ramification of cusps under level maps, and identify the cusp fields and the determinant labels of the components. On ModularCurves Layer 10's prime-level diamond quotients the algebraic side is that layer's curve, identified with R13.4a's by R13.4a/prime-diamond-agreement.

<a id="r12-3-tate-and-cusp-parameter-agreement"></a>

### Tate and analytic cusp parameters

**Theorem** · `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement` · planet: *Tate parameter comparison*

At a cusp represented by σ∞ let w be the least positive integer with σT^wσ⁻¹∈±Γ, and put q_w=exp(2πi σ⁻¹τ/w). The coarse boundary completed local ring after splitting the cusp is C[[q_w]]. The algebraic Tate chart from R13.3 restricts on a punctured convergent disc to the torus C/(Z+Zτ), with Tate coordinate u=exp(2πiz); the Tate parameter is q=q_w^w. The level labels and the invariant differential du/u=2πi dz agree. Stack or strict-level charts may use a cover of this ring and must be descended by their actual cusp inertia.

**Hypotheses and conventions.**

- w is the effective PSL₂ width. The native strict integer width h is computed using Γ rather than ±Γ; at an irregular cusp h=2w.
- Use the independently constructed algebraic Tate charts and their convergence/differential contract, not an asserted equality between unrelated formal symbols.

**Proof plan.**

1. Use the exponential map C/Z→C^× to identify the torus quotient with C^×/q^Z.
2. Compare its convergent Weierstrass equations and differential with the algebraic Tate equation, including the rescaling between dz and du/u.
3. Apply the cusp stabilizer quotient and its invariant local parameter; descending the completed chart gives C[[q_w]] and its completed algebraic comparison.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.tateAndCuspParameterAgreement` | characterisation | At a cusp represented by σ∞ let w be the least positive integer with σT^wσ⁻¹∈±Γ, and put q_w=exp(2πi σ⁻¹τ/w). The coarse boundary completed local ring after splitting the cusp is C[[q_w]]. The algebraic Tate chart from R13.3 restricts on a punctured convergent disc to the torus C/(Z+Zτ), with Tate coordinate u=exp(2πiz); the Tate parameter is q=q_w^w. The level labels and the invariant differential du/u=2πi dz agree. Stack or strict-level charts may use a cover of this ring and must be descended by their actual cusp inertia. |

**Prerequisites.**

- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- [`R12.1/invariant-differentials-and-periods`](#r12-1-invariant-differentials-and-periods) (Invariant differentials and periods)
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`
- `mathlib:PeriodPair`
- `tauceti:TauCeti.Subgroup.integerCuspWidth`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon) (Generalized Tate n-gons) *(later layer R13.3)*
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps) *(later layer R13.3)*
- [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation) (Boundary carriers and Hodge evaluation) *(later layer R13.3)*

**Consumers in this roadmap.** [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization); [`R12.3/cusp-ramification-and-level-maps`](#r12-3-cusp-ramification-and-level-maps); [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels); [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison)

**Acceptance checks.**

- For Γ(N), N≥3, w=N at infinity and q=q_N^N.
- For Γ₀(N) at infinity w=1 and at 0 w=N.
- An irregular Γ₁(4) cusp has strict width twice its effective width; use the effective parameter for the coarse local ring.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.4, pp.310–311. Tate parameters in the analytic/algebraic comparison.
- [`conrad-classical`](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §3, Proposition 3.1, pp.3–4. Local quotient charts at finite stabilizers, used to descend the cusp chart by its actual inertia.
- [`conrad-qexp`](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.1–3. The Tate differential and q-expansion frame.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §4, p.48. The width h of the cusp i∞ (the generator [[1,h],[0,1]] of the stabilizer in the image of Γ) and the local variable q=exp(2πiz/h).

<a id="r12-3-compact-modular-uniformization"></a>

### Compact analytic–algebraic modular comparison

**Theorem** · `ModularCurvesPartII:R12.3/compact-modular-uniformization` · planet: *Compact modular comparison*

Let X be the actual compact coarse modular curve supplied by R13.4a over a characteristic-zero component field, with open Y from R12.2, and choose an embedding into C. The open comparison extends uniquely to an isomorphism X_C^an≅Γ\\(H∪P¹(Q)), using the analytic compactification of MF10A. It identifies the algebraic boundary with the analytic cusps and respects pairing components. For prime N≥5 diamond quotients over Z[1/N], use the existing MC Layer 10 model on precisely that overlap. Other full, composite or bad-level constructions are R13.2/R13.4a inputs.

**Hypotheses and conventions.**

- The compact algebraic curve is independently constructed, normal, projective and smooth on its characteristic-zero fibre.
- Neither R12.6 nor R13.4b is a prerequisite. Completion alone does not prove the algebraic model exists.

**Proof plan.**

1. Compare the open parts by R12.2 and the characteristic-zero coarse quotient.
2. Use the algebraic boundary charts from R13.3 and the effective analytic cusp charts to show that the open map and inverse extend across every puncture. Properness rules out missing points.
3. The extensions are inverses on a dense open and hence everywhere. Uniqueness gives compatibility with component labels and every level map.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.compactModularUniformization` | characterisation | Let X be the actual compact coarse modular curve supplied by R13.4a over a characteristic-zero component field, with open Y from R12.2, and choose an embedding into C. The open comparison extends uniquely to an isomorphism X_C^an≅Γ\\(H∪P¹(Q)), using the analytic compactification of MF10A. It identifies the algebraic boundary with the analytic cusps and respects pairing components. For prime N≥5 diamond quotients over Z[1/N], use the existing MC Layer 10 model on precisely that overlap. Other full, composite or bad-level constructions are R13.2/R13.4a inputs. |

**Prerequisites.**

- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`
- `ComplexComparisonPartII:C4/repair-affine-curve-completion-interface`
- `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`
- [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement) (Tate and analytic cusp parameters)
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*
- [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons) (Coarse normalization comparisons) *(later layer R13.4a)*
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps) *(later layer R13.3)*

**Consumers in this roadmap.** [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials); [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison)

**Acceptance checks.**

- The map is an isomorphism of analytic spaces; it does not rebuild X via Chow.
- At N=1 it gives X(1)^an≅P¹(C) with j as coordinate and the unique cusp at infinity.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.8, pp.310–313. The analytic Tate curve and its compatibility with the algebraic one (4.2–4.4); the analytic space underlying the level-n compact curve over C is the quotient of the upper half-plane plus finitely many points (4.6).
- [`conrad-classical`](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §3, Proposition 3.1 and proof, pp.3–4. Analytic quotients by discontinuous actions, with local charts U/Γ_y at points of finite stabilizer; cusps are not treated in this handout.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), Theorems 7.2 and 7.5 and the canonical X₀(N) model, pp.94–96. Proper curve and function-field uniqueness.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §2, pp.25–40. The compact Riemann surface Γ\\H\* with its charts at elliptic points and cusps.

<a id="r12-3-cusp-ramification-and-level-maps"></a>

### Cusp ramification under level maps

**Theorem** · `ModularCurvesPartII:R12.3/cusp-ramification-and-level-maps` · planet: *Cusp ramification*

For a finite map of modular curves induced by Γ′⊂Γ, and a chosen source cusp over a target cusp, the characteristic-zero ramification index is w′/w after conjugating the cusp representatives consistently. On completed split coarse local rings the map is q_w↦q_w′^(w′/w), up to a root of unity for a changed representative. For Γ₀(N), a cusp with reduced representative a/c and c|N has width N/gcd(c²,N). These statements commute with the actual algebraic level maps and their splitting fields.

**Hypotheses and conventions.**

- Γ and Γ′ have finite index and use effective widths; identify the appropriate cusp rather than comparing widths of unrelated representatives.
- The width ratio is an integer. The source field can enlarge the cusp residue field, so separate residue degree from ramification index.

**Proof plan.**

1. Compute both parameters from the same conjugated translation variable and their stabilizer periods.
2. Identify their quotient discs and compute the order of vanishing of the pulled-back parameter.
3. Use R12.3 parameter agreement and uniqueness of compact morphism extension to obtain the algebraic equality. For Γ₀ compute the conjugated lower-left entry c²w modulo N.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.cuspRamificationAndLevelMaps` | characterisation | For a finite map of modular curves induced by Γ′⊂Γ, and a chosen source cusp over a target cusp, the characteristic-zero ramification index is w′/w after conjugating the cusp representatives consistently. On completed split coarse local rings the map is q_w↦q_w′^(w′/w), up to a root of unity for a changed representative. For Γ₀(N), a cusp with reduced representative a/c and c\|N has width N/gcd(c²,N). These statements commute with the actual algebraic level maps and their splitting fields. |

**Prerequisites.**

- [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement) (Tate and analytic cusp parameters)
- [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison) (Level maps and diamond operators)
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*

**Consumers in this roadmap.** [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility)

**Acceptance checks.**

- X₀(N)→X(1) has ramification N at 0 and 1 at infinity.
- For full level M divisible by N≥3, the corresponding infinity ramification is M/N.
- A root of unity changes the chosen parameter, not its ramification order.

**Sources.**

- [`conrad-classical`](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §3, Proposition 3.1, pp.3–4. Local quotient charts used to compare the two cusp discs.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26. Cusps of X_Γ as Γ-orbits of P¹(Q) and Fourier expansions at cusps; widths are computed from the stabilizers, not read from this source.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §4, p.48. The cusp width and its local variable q=exp(2πiz/h).

<a id="r12-3-cusp-fields-and-component-labels"></a>

### Cusp fields and pairing components

**Theorem** · `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels` · planet: *Cusp fields*

The compact comparison identifies the boundary labels supplied by R13.3/R13.4a with the rational-cusp orbit set Γ\\P¹(Q), including the determinant label of a full frame. A fixed full N-pairing component is defined over Q(ζ_N), and its geometric cusps split over that field. The unrestricted full curve carries all primitive pairing values and is not a single geometrically connected curve over C. Γ₀(N) has its canonical Q-model with both 0 and infinity rational; each other cusp field is obtained from the Galois action on its cyclotomic Tate-level label, rather than inferred from its complex point alone.

**Hypotheses and conventions.**

- Statements about splitting apply to generic fibres, not arbitrary bad-level base change of coarse moduli.
- The cyclotomic Galois action is the action on actual Tate-level labels; the finite boundary algebra is imported from the algebraic supplier.

**Proof plan.**

1. Read the algebraic boundary labels and residue fields in the independently built Tate charts.
2. Compare the chosen labels with primitive rational directions and their congruence stabilizers under R12.3.
3. Transport the determinant and cyclotomic action along the comparison. For Γ₀, use the quotient-isogeny description to identify the two distinguished rational cusps.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.cuspFieldsAndComponentLabels` | characterisation | The compact comparison identifies the boundary labels supplied by R13.3/R13.4a with the rational-cusp orbit set Γ\\P¹(Q), including the determinant label of a full frame. A fixed full N-pairing component is defined over Q(ζ_N), and its geometric cusps split over that field. The unrestricted full curve carries all primitive pairing values and is not a single geometrically connected curve over C. Γ₀(N) has its canonical Q-model with both 0 and infinity rational; each other cusp field is obtained from the Galois action on its cyclotomic Tate-level label, rather than inferred from its complex point alone. |

**Prerequisites.**

- [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement) (Tate and analytic cusp parameters)
- [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison) (Level maps and diamond operators)
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps) *(later layer R13.3)*
- [`R13.3/gamma-one-integral-boundary`](#r13-3-gamma-one-integral-boundary) (Integral Γ₁ cusp strata) *(later layer R13.3)*
- [`R13.3/gamma-zero-prime-power-cusp-rings`](#r13-3-gamma-zero-prime-power-cusp-rings) (Prime-power Γ₀ cusp rings) *(later layer R13.3)*
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*

**Consumers in this roadmap.** [`R12.6/complex-conjugation-comparison`](#r12-6-complex-conjugation-comparison); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi)

**Acceptance checks.**

- For X₀(11), the cusps 0 and infinity both have residue field Q.
- For full N=5, each fixed-pairing component and all its cusps split over Q(ζ₅); there are four geometric pairing components of unrestricted full level.
- A complex uniformization alone makes no claim about an integral cusp residue field.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.2–4.8, pp.310–313. Level structures of determinant one, Fourier expansions at the cusps through the Tate curve, and their coefficients in Z[ζ_n] (4.7–4.8).
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §7, pp.94–96. The canonical Q-model of X₀(N).
- [`gz`](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I §1, p.226 (PDF p.3). The two rational cusps and the Q-model used in Heegner-point constructions.

<a id="r12-4"></a>

## R12.4. Connectedness and twisted curves

Prove that a fixed-pairing curve Y(N,ζ) and the twisted curve Y(ρ) are geometrically connected and geometrically irreducible. These are the three external statements ModularCurves 5C leaves open, proved as separate lemmas with their own hypotheses: invariance of connectedness under the extension ℚ̄→ℂ (Stacks 0363), the analytic description of the twisted curve over a splitting field, and the connectedness criterion for smooth affine curves of ComplexComparisonPartII C4. Irreducibility then follows from smoothness by the smooth-connected irreducibility implication of ModularCurves 5C, whose domain-stalk input is Tau Ceti's `irreducibleSpace_of_connected_of_isDomain_stalk`. Only the open comparison of R12.2 is used; the compactification is not needed.

<a id="r12-4-geometric-connectedness-field-extension"></a>

### Connectedness under the chosen algebraic closure extension

**Application** · `ModularCurvesPartII:R12.4/geometric-connectedness-field-extension`

For the actual finite-type smooth curve Y(ρ)/Q and the chosen algebraically closed extension Q̄→C, Y(ρ)_Q̄ is connected if and only if Y(ρ)_C is connected. The same holds for the fixed-pairing curve over its algebraic closure. This is the first MC5C comparison contract for these carriers. It is the special case of the invariance of connected components under extension of a separably closed base field (Stacks, Lemma 33.7.6, tag 0363), not a new general base-change theory.

**Hypotheses and conventions.**

- N≥3 and the actual MC5B/5C finite-type schemes are used.
- Both fields are algebraically closed; a comparison of rational-point sets would not imply this statement.
- The invariance of connected components is a scheme fact requested from SchemeAndStackFoundations SF.0; ModularCurves 0E (descent and spreading out) does not state it, and MC5C lists it among its external contracts.

**Proof plan.**

1. For X of finite type over the algebraically closed field Q̄ and any extension K, the projection X_K→X induces a bijection on connected components (Stacks 0363).
2. Apply this to X=Y(ρ)_Q̄ and K=C: the finite set of connected components is unchanged, and nonemptiness is preserved.
3. Use the resulting equivalence as the first named MC5C comparison contract, separately from the analytic isomorphism and the C4 connectedness theorem.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.geometricConnectednessFieldExtension` | compatibility | For the actual finite-type smooth curve Y(ρ)/Q and the chosen algebraically closed extension Q̄→C, Y(ρ)_Q̄ is connected if and only if Y(ρ)_C is connected. The same holds for the fixed-pairing curve over its algebraic closure. This is the first MC5C comparison contract for these carriers, the special case of Stacks Lemma 33.7.6 (tag 0363), not a new general base-change theory. |

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`
- `SchemeAndStackFoundations:SF.0`

**Consumers in this roadmap.** [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness); [`R12.4/twisted-geometric-irreducibility`](#r12-4-twisted-geometric-irreducibility)

**Acceptance checks.**

- The result has an explicit algebraically closed field-extension hypothesis.
- No compactification or R12.3 statement is used.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Theorem 17.21, p.42. The fixed-pairing curve to which the component invariance is applied.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25. The arithmetic twisted curve used in this specialized application.
- [`stacks`](https://stacks.math.columbia.edu/tag/0363), Lemma 33.7.6, tag 0363. For a separably algebraically closed field k and any extension k′, X\_{k′}→X induces a bijection of connected components; in particular X is geometrically connected iff connected.

<a id="r12-4-fixed-pairing-geometric-connectedness"></a>

### Geometric connectedness of a fixed-pairing curve

**Theorem** · `ModularCurvesPartII:R12.4/fixed-pairing-geometric-connectedness` · planet: *Fixed-pairing connectedness*

For N≥3 and a primitive pairing value ζ, the nonempty smooth affine curve Y(N,ζ) over Q(ζ) is geometrically connected and geometrically irreducible. After an embedding Q̄→C its analytification is Γ(N)\\H and is connected. The algebraic connectedness assertion is invariant under the algebraically closed extension Q̄→C. The unrestricted full-level curve over C has exactly φ(N) geometrically irreducible components, indexed by primitive pairing values.

**Hypotheses and conventions.**

- Use the fixed-pairing fibre of MC5B, not all ordered bases.
- Algebraic/analytic connectedness is imported only for finite-type smooth affine C-curves from C4; no nonproper GAGA morphism theorem is asserted.
- Algebraically closed extension invariance for this finite-type curve is the preceding node (Stacks 0363); ModularCurves 0E does not supply it.

**Proof plan.**

1. The upper half-plane is connected, so its continuous surjective quotient by Γ(N) is connected.
2. Apply the C4 smooth-affine connectedness equivalence to the actual fine curve and the R12.2 analytic isomorphism.
3. Use faithful scalar-extension invariance of geometric connectedness to pass from C to Q̄. Apply the anchor’s smooth-connected curve irreducibility theorem, whose locally Noetherian domain-stalk leaf is already in Tau Ceti.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.fixedPairingGeometricConnectedness` | characterisation | For N≥3 and a primitive pairing value ζ, the nonempty smooth affine curve Y(N,ζ) over Q(ζ) is geometrically connected and geometrically irreducible. After an embedding Q̄→C its analytification is Γ(N)\\H and is connected. The algebraic connectedness assertion is invariant under the algebraically closed extension Q̄→C. The unrestricted full-level curve over C has exactly φ(N) geometrically irreducible components, indexed by primitive pairing values. |

**Prerequisites.**

- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `ComplexComparisonPartII:C4/affine-curve-connectedness`
- `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`
- [`R12.4/geometric-connectedness-field-extension`](#r12-4-geometric-connectedness-field-extension) (Connectedness under the chosen algebraic closure extension)

**Consumers in this roadmap.** [`R12.4/twisted-geometric-irreducibility`](#r12-4-twisted-geometric-irreducibility); [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent); [`R13.2/fixed-pairing-integral-components`](#r13-2-fixed-pairing-integral-components)

**Acceptance checks.**

- The C4 input is a scheme–analytic connectedness equivalence for the smooth affine curve.
- At N=3 the unrestricted full curve has two components, each connected.
- Connectedness without local domain stalks would not justify irreducibility.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §9, pp.20–22, and Theorem 17.21, p.42. π₀ of the complex level curve is a torsor under (Z/N)^×/det Γ; for fine Y the analytification of the universal curve is universal.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–25. Connected upper-half-plane quotients and the level curves.

<a id="r12-4-twisted-analytic-comparison"></a>

### The analytic comparison for a symplectic twist

**Theorem** · `ModularCurvesPartII:R12.4/twisted-analytic-comparison` · planet: *Twisted-curve comparison*

Let N≥3 and let V_ρ/Q be the imported rank-two finite étale Z/N-module scheme with perfect alternating Galois-equivariant pairing to μ_N. Let Y(ρ) be the MC5C symplectic-frame quotient, parametrizing pairing-preserving isomorphisms E[N]≅V_ρ. A symplectic frame after extension to a splitting field identifies Y(ρ) there with the corresponding single fixed-pairing curve. After embedding that field in C, this gives an isomorphism (Y(ρ)_C)^an≅Γ(N)\\H. Changing the frame changes the identification by the corresponding SL₂ action and preserves the actual descent cocycle.

**Hypotheses and conventions.**

- The representation comes with its pairing. In a chosen basis its determinant is the cyclotomic character; an arbitrary GL₂ representation without such a pairing does not define this symplectic twist.
- MC5C owns the construction, freeness, smoothness and descent of Y(ρ).

**Proof plan.**

1. Trivialize the paired finite étale module over a finite Galois splitting field and evaluate the imported quotient construction in that frame.
2. The pairing equality selects one determinant fibre, not a union. Compose its algebraic trivialization with R12.2.
3. Compute a frame change and the Galois cocycle on the moduli isomorphisms; the equality is an equality of morphisms on the imported curve.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.twistedAnalyticComparison` | characterisation | Let N≥3 and let V_ρ/Q be the imported rank-two finite étale Z/N-module scheme with perfect alternating Galois-equivariant pairing to μ_N. Let Y(ρ) be the MC5C symplectic-frame quotient, parametrizing pairing-preserving isomorphisms E[N]≅V_ρ. A symplectic frame after extension to a splitting field identifies Y(ρ) there with the corresponding single fixed-pairing curve. After embedding that field in C, this gives an isomorphism (Y(ρ)_C)^an≅Γ(N)\\H. Changing the frame changes the identification by the corresponding SL₂ action and preserves the actual descent cocycle. |

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison) (Level maps and diamond operators)
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`

**Consumers in this roadmap.** [`R12.4/twisted-geometric-irreducibility`](#r12-4-twisted-geometric-irreducibility); [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent); [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent)

**Acceptance checks.**

- A symplectic frame produces exactly one Γ(N) quotient.
- Changing it by determinant r moves the pairing fibre unless the pairing is simultaneously transported.
- No field-points bijection substitutes for the analytic isomorphism.

**Sources.**

- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25. Level structures with prescribed Galois representation and their complex uniformization.
- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §9, pp.20–24 and Theorem 17.21, p.42. Marked complex curves and fixed-pairing analytification.

<a id="r12-4-twisted-geometric-irreducibility"></a>

### Geometric irreducibility of the twisted curve

**Theorem** · `ModularCurvesPartII:R12.4/twisted-geometric-irreducibility` · planet: *Twisted-curve irreducibility*

For the paired representation and Y(ρ) of the previous node, Y(ρ) is geometrically connected and geometrically irreducible over Q. Discharge the anchor’s three external hypotheses separately: invariance of connectedness under Q̄→C for the actual curve; the twisted analytic isomorphism with Γ(N)\\H; and C4’s connectedness equivalence for the smooth affine C-curve. Smoothness and nonemptiness then permit the anchor’s conditional irreducibility result to be applied unconditionally.

**Hypotheses and conventions.**

- N≥3. A small-level coarse twist is not the fine scheme Y(ρ) treated by this theorem.
- The same statement holds over a characteristic-zero field with the same paired finite étale data after choosing an algebraic closure and embedding the field of definition into C.

**Proof plan.**

1. Use the splitting-field trivialization to identify the geometric twist with a fixed-pairing component.
2. Apply its geometric connectedness, or the three contracts individually, with all smoothness and finite-type hypotheses checked.
3. Invoke the imported MC5C smooth-connected irreducibility implication.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.twistedGeometricIrreducibility` | characterisation | For the paired representation and Y(ρ) of the previous node, Y(ρ) is geometrically connected and geometrically irreducible over Q. Discharge the anchor’s three external hypotheses separately: invariance of connectedness under Q̄→C for the actual curve; the twisted analytic isomorphism with Γ(N)\\H; and C4’s connectedness equivalence for the smooth affine C-curve. Smoothness and nonemptiness then permit the anchor’s conditional irreducibility result to be applied unconditionally. |

**Prerequisites.**

- [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison) (The analytic comparison for a symplectic twist)
- [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness) (Geometric connectedness of a fixed-pairing curve)
- `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `ComplexComparisonPartII:C4/affine-curve-connectedness`
- [`R12.4/geometric-connectedness-field-extension`](#r12-4-geometric-connectedness-field-extension) (Connectedness under the chosen algebraic closure extension)

**Acceptance checks.**

- The statement names each of the three MC5C contracts and does not add an unexplained connectedness assumption.
- It holds for a nontrivial twist with no chosen rational symplectic frame.

**Sources.**

- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25. The twisted level curve used in the modularity argument.
- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Theorem 17.21, p.42. Fixed-pairing connected complex curves.

<a id="r12-5"></a>

## R12.5. Differentials and Hecke normalisation

Weight-two cusp forms are the regular differentials on the compact curve. Identify the Hodge line ω with the automorphy factor through the frame 2πi dz=du/u, show that f↦2πi f(τ)dτ is an isomorphism S₂(Γ)≅H⁰(X,Ω¹), define the characteristic-zero pullback–trace action of the isogeny correspondences, prove that it is the analytic Hecke action of ModularForms with the normalization stated in the conventions, and prove that the pairing (T,f)↦a₁(Tf) between the full Hecke algebra and weight-two forms is perfect. The integral correspondences and their traces are R14.1, which consumes this layer.

<a id="r12-5-hodge-line-automorphy"></a>

### The Hodge line and the automorphy factor

**Theorem** · `ModularCurvesPartII:R12.5/hodge-line-automorphy` · planet: *Hodge-line comparison*

On the elliptic level moduli stack let ω=e\*Ω¹_E/Y be the imported invariant-differential line. Pulling it to H along the marked family trivializes it by 2πi dz, the frame agreeing with du/u on the Tate curve. In usual left-action coordinates τ′=(aτ+b)/(cτ+d), z′=z/(cτ+d), the pullback of dz′ is dz/(cτ+d). Thus a section (2πi)^k f(τ)dz^k is equivariant precisely when f(τ′)=(cτ+d)^k f(τ). This identifies ω^k with the imported analytic automorphy bundle, extends in Tate frames to the compact level stack, and respects level pullback.

**Hypotheses and conventions.**

- The line is on the moduli stack or on a fine locus with universal curve. For a coarse curve, descend only when its stabilizers act trivially on the relevant fibre; otherwise use the invariant section-space formulation of MF10C.
- In particular generic −1 acts as −1 on ω. There is no unrestricted weight-one line bundle on the coarse Γ₀ curve.
- The algebraic individual-curve normalization dx/(2y)↔dz remains unchanged; multiplication by 2πi belongs to this modular/Tate frame.

**Proof plan.**

1. Pull back the relative algebraic differential line to the marked family and use R12.1.
2. Compute the multiplier of the fibre coordinate under a marking change; taking kth tensors gives the exact automorphy law.
3. Use Tate parameter agreement for the boundary frame and finite stabilizer invariance for the coarse section-space description.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.hodgeLineAutomorphy` | characterisation | On the elliptic level moduli stack let ω=e\*Ω¹_E/Y be the imported invariant-differential line. Pulling it to H along the marked family trivializes it by 2πi dz, the frame agreeing with du/u on the Tate curve. In usual left-action coordinates τ′=(aτ+b)/(cτ+d), z′=z/(cτ+d), the pullback of dz′ is dz/(cτ+d). Thus a section (2πi)^k f(τ)dz^k is equivariant precisely when f(τ′)=(cτ+d)^k f(τ). This identifies ω^k with the imported analytic automorphy bundle, extends in Tate frames to the compact level stack, and respects level pullback. |

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`
- [`R12.2/marked-torus-family`](#r12-2-marked-torus-family) (The marked torus family over the upper half-plane)
- [`R12.1/invariant-differentials-and-periods`](#r12-1-invariant-differentials-and-periods) (Invariant differentials and periods)
- [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement) (Tate and analytic cusp parameters)
- `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`

**Consumers in this roadmap.** [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials); [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent); [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism)

**Acceptance checks.**

- The Tate frame is du/u and pulls back to 2πi dz.
- For γ=T the multiplier is 1; for γ=S it is τ⁻¹ on the fibre differential.
- Weight one fails to descend across generic −1 inertia, while even powers can pass that obstruction.

**Sources.**

- [`conrad-qexp`](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.1–3. The Hodge line, Tate frame and modular q-expansion.
- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §7, p.15; §11, p.26. The matrix γ acts on fibres by z↦z/(cτ+d), and the induced map on ω sends dz to dz/(cτ+d), giving the automorphy factor on ω^{⊗k}.

<a id="r12-5-weight-two-regular-differentials"></a>

### Weight-two cusp forms and regular differentials

**Theorem** · `ModularCurvesPartII:R12.5/weight-two-regular-differentials` · planet: *Cusp-form differential comparison*

For a congruence subgroup Γ with the actual smooth projective coarse curve X/C from R13.4a, the map f↦ω_f=2πi f(τ)dτ is a C-linear isomorphism S₂(Γ)≅H⁰(X,Ω¹_X/C). At a cusp of effective width w it is ω_f=w f dq_w/q_w; cuspidality is exactly regularity there. At elliptic points the invariant local expression descends regularly through the finite stabilizer chart. At irregular cusps use the effective parameter and the weight-two sign invariance. This comparison respects level pullback and trace on finite characteristic-zero curve maps.

**Hypotheses and conventions.**

- All coefficient spaces and analytic section spaces are the existing MF10C carriers; the algebraic differentials use the independently constructed X.
- No smooth fine universal elliptic curve on the coarse X is assumed.
- The formula contains 2πi and the width w; changing either changes the stated comparison.

**Proof plan.**

1. Use the Hodge-line/automorphy comparison and the imported weight-two canonical-form dictionary on the analytic quotient.
2. At a cusp substitute dq_w/q_w=(2πi/w)dτ. The constant term must vanish exactly when the differential has no pole. At an elliptic chart compute invariants in t with quotient coordinate t^e.
3. Apply proper coherent comparison (AlgebraicModuli package §7.10.3) to identify holomorphic and algebraic regular differentials. Local pullback and finite trace computations give naturality.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.weightTwoRegularDifferentials` | characterisation | For a congruence subgroup Γ with the actual smooth projective coarse curve X/C from R13.4a, the map f↦ω_f=2πi f(τ)dτ is a C-linear isomorphism S₂(Γ)≅H⁰(X,Ω¹_X/C). At a cusp of effective width w it is ω_f=w f dq_w/q_w; cuspidality is exactly regularity there. At elliptic points the invariant local expression descends regularly through the finite stabilizer chart. At irregular cusps use the effective parameter and the weight-two sign invariance. This comparison respects level pullback and trace on finite characteristic-zero curve maps. |

**Prerequisites.**

- [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy) (The Hodge line and the automorphy factor)
- [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization) (Compact analytic–algebraic modular comparison)
- `tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas`
- `tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology`
- `ComplexComparisonPartII:C5/curve-residue-localization`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- `ComplexComparisonPartII:C2/projective-geometric-dictionaries`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*
- [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change) (Base change for coarse modular curves) *(later layer R13.4a)*

**Consumers in this roadmap.** [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action); [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing); [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism); [`R14.3/cup-product-petersson`](#r14-3-cup-product-petersson)

**Acceptance checks.**

- For Γ₀(N) at infinity, ω_f=f dq/q; the q coefficient a₁ is the leading dq coefficient.
- At a width-N cusp the factor is N.
- A weight-two form with nonzero cusp constant gives a logarithmic pole and is excluded from H⁰Ω¹.
- No arbitrary integral base change is claimed: DDT Theorem 1.33 needs its stated flatness or invertibility assumptions.

**Sources.**

- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.12, pp.25–26; Theorem 1.33, pp.38–39. The weight-two differential and its algebraic comparison with explicit base hypotheses.
- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.6–4.7, p.312. Modular forms of weight k and level n are the sections of ω^{⊗k} on the compactified level-n moduli over C, with Fourier expansion read on the Tate curve up to a power of 2πi; the weight-two differential identification is DDT Lemma 1.12.

<a id="r12-5-characteristic-zero-hecke-action"></a>

### Characteristic-zero pullback and trace actions

**Construction** · `ModularCurvesPartII:R12.5/characteristic-zero-hecke-action` · planet: *Characteristic-zero Hecke action*

On the canonical Γ₀(N) coarse curve over Q, define the action on regular differentials of the good degree-n isogeny correspondence, gcd(n,N)=1, by pullback along the target map and finite trace along the source map. Its generic objects are all order-n finite subgroups D⊂E, with the transported cyclic N-subgroup; its degree is σ₁(n). Separately the cyclic-kernel correspondence has degree ψ(n)=n∏\_{p|n}(1+1/p). For p|N define U_p from order-p subgroups disjoint from the marked cyclic N-subgroup; its source degree is p. Compactify the characteristic-zero correspondences by normalization of the appropriate open finite covers, using the supplied generic coarse models. The action on ω^k sections is n⁻¹ times raw isogeny pullback and trace (p⁻¹ for U_p); for regular differentials use the curve differential pullback and trace directly.

**Hypotheses and conventions.**

- N,n≥1; the all-subgroup degree assertion is for gcd(n,N)=1. The U_p construction is stated separately.
- The base has characteristic zero, so division by n is defined. Integral extensions and bad-characteristic divisibility are R14.1 targets, not prerequisites.
- For Γ₀ no universal elliptic scheme is assumed: define the isogeny differential multiplier on a rigidified cover and descend its invariant action.

**Proof plan.**

1. Use the imported elliptic subgroup/isogeny carriers and finite quotients to build the open correspondence; count sublattices via Hermite normal form. Distinguish all subgroups from cyclic ones.
2. Normalize the independently given characteristic-zero compact curve in each finite generic algebra; extend generic curve morphisms by the AlgebraicCurves Layer 12C dictionary and use the requested SF.3 trace on regular differentials.
3. Compute the differential action on each lattice branch. At p|N the disjointness condition removes the multiplication branch, yielding U_p. The finite trace extends regular differentials, including at ramification.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.charZeroHeckeCorrespondence` | constructor | The compact all-subgroup correspondence for gcd(n,N)=1, with its two maps. |
| `TauCeti.ModularCurves.charZeroCyclicCorrespondence` | constructor | The separate cyclic-kernel correspondence. |
| `TauCeti.ModularCurves.charZeroUCorrespondence` | constructor | For p\|N, the degree-p disjoint-kernel correspondence. |
| `TauCeti.ModularCurves.charZeroHecke_onDifferentials` | functoriality | Target pullback followed by source trace on H⁰Ω¹. |
| `TauCeti.ModularCurves.charZeroHecke_onHodgePower` | compatibility | For weight k, divide the raw isogeny differential pullback/trace by n. |
| `TauCeti.ModularCurves.charZeroHecke_degree` | characterisation | Good all-subgroup degree σ₁(n); cyclic degree ψ(n); U_p degree p. |

**Unit tests.**

- `TauCeti.ModularCurves.charZeroHecke_degree_four` (computation): If N is odd, the n=4 all-subgroup degree is 7 and the cyclic degree is 6; the omitted kernel is E[2].
- `TauCeti.ModularCurves.charZeroHecke_identity` (degenerate): At n=1 the correspondence is the diagonal and its differential action is the identity.
- `TauCeti.ModularCurves.charZeroHecke_raw_prime` (compatibility): For weight k and p∤N, raw isogeny trace equals p times the analytic T_p, including both the p^k f(pτ) branch and the p other branches.
- `TauCeti.ModularCurves.charZeroHecke_bad_prime` (non-example): At p|N, U_p has degree p rather than p+1; no σ₁(p) claim is made for that operator.

**Uses.**

- [`R12.5/hecke-normalization-comparison`](#r12-5-hecke-normalization-comparison) (The pullback–trace Hecke normalization): Provides the geometric action to compare.
- ModularCurvesPartII:R14.1: Pins the characteristic-zero normalization which the integral comparison must recover.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`
- [`R12.1/homothety-and-isogeny-compatibility`](#r12-1-homothety-and-isogeny-compatibility) (Homotheties and lattice isogenies)
- [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials) (Weight-two cusp forms and regular differentials)
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`
- `SchemeAndStackFoundations:SF.3`
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*

**Consumers in this roadmap.** [`R12.5/hecke-normalization-comparison`](#r12-5-hecke-normalization-comparison)

**Acceptance checks.**

- Use seven all-subgroup branches versus six cyclic branches at n=4.
- The correspondence acts on regular differentials by target pullback followed by source trace.

**Sources.**

- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §5, Lemma 5.13, Remarks 5.14–5.15 and Proposition 5.16/Corollary 5.17, pp.72–74. The lattice representatives underlying the characteristic-zero calculation.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26 and §1.6, p.39. The Hecke action and q-normalization.
- [`bt`](https://benjamin-bakker.github.io/P.torsion.pdf), published §2.5 (not re-read; see sourceVersions). The cyclic/all-subgroup distinction needed by the routed Hecke item.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, Theorem 4.4.3, pp.42–45. The Hecke correspondences extend uniquely to finite flat maps over the compact moduli; only their characteristic-zero normalization is used here.
- [`bt-preprint`](https://arxiv.org/pdf/1403.7168v2), §2.5, pp.7–8, corrected as E112. T_n defined from cyclic isogenies of degree n with the degree σ₁(n) asserted for both projections; the cyclic/all-subgroup distinction corrects this.

<a id="r12-5-hecke-normalization-comparison"></a>

### The pullback–trace Hecke normalization

**Theorem** · `ModularCurvesPartII:R12.5/hecke-normalization-comparison` · planet: *Hecke normalization*

Under f↦2πi f(τ)dτ, the geometric Γ₀(N) differential action of the preceding node equals the anchor’s analytic T_n for gcd(n,N)=1 and U_p for p|N. For even weight k, raw isogeny trace divided by n is T_n f=n^(k−1)∑\_{ad=n,0≤b&lt;d}d^(−k)f((aτ+b)/d); in weight two each branch has coefficient a/d, exactly d((aτ+b)/d)/dτ. At a good prime T_p f=p^(k−1)f(pτ)+p⁻¹∑\_{b=0}^{p−1}f((τ+b)/p). The bad-prime action is U_p f=p⁻¹∑_b f((τ+b)/p). They recover a₁(T_n f)=a_n(f) for the full composite operator, with the imported good-prime recurrence and bad-prime powers.

**Hypotheses and conventions.**

- The general displayed weight-k formula is for trivial Γ₀ character. Nebentypus and Γ₁ transports use the anchor’s explicitly labelled slash/diamond conventions, not a silent change of this formula.
- The good composite T_n uses all subgroups. The cyclic modular-polynomial correspondence is not substituted at squareful n.

**Proof plan.**

1. On the branch ad=n, τ′=(aτ+b)/d, the isogeny z↦az multiplies the Hodge frame by a, giving a^k/n=a^(k−1)/d.
2. For weight two the curve differential pullback multiplies dτ′ by a/d, giving precisely the normalized Hodge action.
3. Sum branch traces, identify the anchor’s triangular slash sum, and use its q-expansion theorem. Treat the U branch set separately and combine prime powers by the imported Hecke relations.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.heckeNormalizationComparison` | characterisation | Under f↦2πi f(τ)dτ, the geometric Γ₀(N) differential action of the preceding node equals the anchor’s analytic T_n for gcd(n,N)=1 and U_p for p\|N. For even weight k, raw isogeny trace divided by n is T_n f=n^(k−1)∑\_{ad=n,0≤b&lt;d}d^(−k)f((aτ+b)/d); in weight two each branch has coefficient a/d, exactly d((aτ+b)/d)/dτ. At a good prime T_p f=p^(k−1)f(pτ)+p⁻¹∑\_{b=0}^{p−1}f((τ+b)/p). The bad-prime action is U_p f=p⁻¹∑_b f((τ+b)/p). They recover a₁(T_n f)=a_n(f) for the full composite operator, with the imported good-prime recurrence and bad-prime powers. |

**Prerequisites.**

- [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action) (Characteristic-zero pullback and trace actions)
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`
- `tauceti:HeckeRing.GL2.qExpansion_coeff_one_heckeRingHomCharSpace_heckeTCompositeGamma0`

**Consumers in this roadmap.** [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing); [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility)

**Acceptance checks.**

- For k=2, T_p has coefficients p and 1/p in its two branch types.
- For good p, T\_{p²}=T_p²−p·Id on trivial-character weight two, while the cyclic degree differs by the one noncyclic subgroup.
- This theorem supplies a characteristic-zero target for R14.1 and does not presume its integral construction.

**Sources.**

- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26 and §1.6, p.39. The classical normalization and coefficient action.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–45. The isogeny action whose raw differential multiplier is normalized here.
- [`bt`](https://benjamin-bakker.github.io/P.torsion.pdf), published §2.5 (not re-read; see sourceVersions). Avoids confusing cyclic and full Hecke operators.
- [`bt-preprint`](https://arxiv.org/pdf/1403.7168v2), §2.5, pp.7–8. The cyclic-isogeny Hecke correspondence whose stated degree σ₁(n) must be separated from the cyclic degree ψ(n).

<a id="r12-5-first-coefficient-hecke-pairing"></a>

### The full Hecke first-coefficient pairing

**Definition** · `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing` · planet: *Hecke coefficient pairing*

Let V_Q=H⁰(X₀(N)_Q,Ω¹) and use the rational infinity Tate chart to extract a_n from ω=f(q)dq/q. Let T_Q⊂End_Q(V_Q) be the image of the full commutative Hecke algebra generated by every T_n, including the bad-prime U blocks. Define β:T_Q×V_Q→Q by β(T,f)=a₁(Tf), and extend scalars to C through the differential comparison. It is a bilinear form on the full space; it is not restricted to a newspace or an eigenspace.

**Hypotheses and conventions.**

- N≥1; X₀(N)_Q and its rational cusp chart are imported from R13.4a/R13.3.
- Use the image algebra of actual operators, so a zero operator is zero in T_Q; no abstract Hecke-ring kernel is silently discarded.
- At N=1 the cusp-form space is zero and its image algebra is the zero algebra.

**Proof plan.**

1. The algebraic pullback–trace operators are defined over Q, so their image preserves V_Q. The rational q-chart defines Q-linear coefficient functionals.
2. Bilinearity follows from the operator action and coefficient extraction. Proper cohomology base change identifies V_Q⊗C with the analytic full S₂ space.
3. Use the normalized Hecke comparison to establish β(T_n,f)=a_n(f); record the commuting action relation β(ST,f)=β(S,Tf).

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing` | constructor | β(T,f)=a₁(Tf) over Q and its scalar extensions. |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_bilinear` | structure | Q-linearity in both arguments. |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_Tn` | characterisation | β(T_n,f)=a_n(f) for every n≥1. |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_action` | compatibility | β(ST,f)=β(S,Tf). |
| `TauCeti.ModularCurves.firstCoefficientHeckePairing_baseChange` | functoriality | Scalar extension to C agrees with the analytic q-coefficient pairing. |

**Unit tests.**

- `TauCeti.ModularCurves.firstCoefficientHeckePairing_identity` (compatibility): β(Id,f)=a₁(f); it need not equal a₂(f).
- `TauCeti.ModularCurves.firstCoefficientHeckePairing_zeroSpace` (degenerate): At N=1 both spaces are zero and the zero-dimensional pairing is perfect.
- `TauCeti.ModularCurves.firstCoefficientHeckePairing_level11` (computation): For the normalized level-11 weight-two cusp form, β(T₁,f)=1 and the full Hecke image has dimension one.
- `TauCeti.ModularCurves.firstCoefficientHeckePairing_badU` (non-example): If p|N, β(U_p,f)=a_p(f); excluding bad-prime operators would fail to describe the full pairing in GZ V §1.

**Uses.**

- [`R12.5/perfect-hecke-pairing`](#r12-5-perfect-hecke-pairing) (Perfection of the full Hecke pairing): Identifies the two full vector spaces as duals.
- ModularCurvesPartII:R14.2: Provides the cohomological normalization; the Jacobian action is a separate consumer.

**Prerequisites.**

- [`R12.5/hecke-normalization-comparison`](#r12-5-hecke-normalization-comparison) (The pullback–trace Hecke normalization)
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- `ComplexComparisonPartII:C2/gaga-base-change`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*
- [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation) (Boundary carriers and Hodge evaluation) *(later layer R13.3)*

**Consumers in this roadmap.** [`R12.5/perfect-hecke-pairing`](#r12-5-perfect-hecke-pairing); [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing)

**Acceptance checks.**

- The domain is the operator image T_Q and the whole V_Q.
- The comparison identifies the algebraic rational coefficient normalization at infinity with the analytic one.

**Sources.**

- [`gz`](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), V §1, p.306 (PDF p.83). The full rational Hecke pairing.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.34, p.39. Hecke operators paired with the first coefficient.

<a id="r12-5-perfect-hecke-pairing"></a>

### Perfection of the full Hecke pairing

**Theorem** · `ModularCurvesPartII:R12.5/perfect-hecke-pairing` · planet: *Perfect Hecke pairing*

The pairing β:T_Q×V_Q→Q is perfect: T_Q≅V_Q\* and V_Q≅T_Q\*. In particular dim_Q T_Q=dim_Q V_Q. The same holds after scalar extension to C. The result uses q-expansion injectivity, commutativity and the span of all T_n, including bad-prime blocks; it requires no eigenbasis, semisimplicity or newform decomposition. The integral lattice perfectness of DDT is an imported stronger supplier when its hypotheses are met, not claimed by this rational theorem.

**Hypotheses and conventions.**

- The spaces are finite dimensional and T_Q is the image of the full Hecke algebra on V_Q.
- All operators T_n act with a₁(T_n f)=a_n(f), and their Q-span is T_Q by the imported Hecke relations.

**Proof plan.**

1. If β(T_n,f)=0 for all n, every q coefficient of f vanishes, so f=0.
2. If β(T,f)=0 for every f, then a_n(Tf)=a₁(T_nTf)=a₁(TT_nf)=0 by commutativity; hence Tf=0 for every f, and T=0 in the image algebra.
3. Both radicals vanish; finite-dimensional linear algebra gives equal dimensions and perfection over C. The rational coefficient and operator definitions, or faithful scalar extension, give perfection over Q.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.perfectHeckePairing` | characterisation | The pairing β:T_Q×V_Q→Q is perfect: T_Q≅V_Q\* and V_Q≅T_Q\*. In particular dim_Q T_Q=dim_Q V_Q. The same holds after scalar extension to C. The result uses q-expansion injectivity, commutativity and the span of all T_n, including bad-prime blocks; it requires no eigenbasis, semisimplicity or newform decomposition. The integral lattice perfectness of DDT is an imported stronger supplier when its hypotheses are met, not claimed by this rational theorem. |

**Prerequisites.**

- [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing) (The full Hecke first-coefficient pairing)
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`

**Consumers in this roadmap.** [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing)

**Acceptance checks.**

- Both radicals are checked; one-sided nondegeneracy does not prove the claim by itself.
- The proof includes every n and every bad-prime block.
- No Jacobian faithfulness theorem is used to prove this pairing.

**Sources.**

- [`gz`](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), V §1, p.306 (PDF p.83). Perfection on the full rational space.
- [`ddt`](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.34 and proof, p.39. The coefficient argument and its integral version.

<a id="r12-6"></a>

## R12.6. Descent and compatibility statements

Descend the comparisons to their fields of definition: canonical ℚ-models of X₀(N) and X₁(N), the ℚ(ζ_N)-model of a fixed-pairing curve and the ℚ-model of Y(ρ); the function field ℚ(X₀(N))=ℚ(j,j′); the component fields of full level and the Galois action on components; complex conjugation and the inversion of pairing values; and compatibility of every generic-fibre comparison with field extension, level maps, diamonds and the characteristic-zero Hecke actions. R13.4b, R14.1 and R14.2 use these statements.

<a id="r12-6-canonical-generic-fibre-descent"></a>

### Canonical generic models and coefficient descent

**Theorem** · `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent` · planet: *Generic-model descent*

For the independently constructed open and compact modular models, the R12.2/R12.3 comparisons respect their characteristic-zero fields of definition. Γ₀ and Γ₁ have their canonical Q-models; fixed full N-pairing has a Q(ζ_N)-model; the paired twist Y(ρ) has the MC5C Q-model. Effective descent of curve maps and sections applies to these actual models. A section defined over C descends to a characteristic-zero coefficient field K containing the model’s field when its q-expansion at a K-rational split cusp has coefficients in K, with the supplied injective q-expansion map and its field-base-change equality checked.

**Hypotheses and conventions.**

- The cusp is K-rational and its chosen Tate parameter/frame is defined over K; otherwise first enlarge K to split the cusp and use the resulting Galois descent datum.
- Use finite-dimensional section spaces with flat field base change; no arbitrary nonflat integral q-expansion principle is asserted.
- The compact input is R13.4a, and this stage exports to R13.4b.

**Proof plan.**

1. Keep the curve and line bundle from the algebraic suppliers, and compare their complex fibres rather than reconstructing them from the analytic quotient.
2. Apply the imported effective descent framework to semilinear automorphisms and maps. For coefficients, choose a K-basis and use finitely many q coefficients giving an injective finite-dimensional coordinate map.
3. Solve its linear coordinate system over K to show that a section with coefficients in K lies in the K-form; verify the cusp parameter and Hodge normalization.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.canonicalGenericFibreDescent` | characterisation | For the independently constructed open and compact modular models, the R12.2/R12.3 comparisons respect their characteristic-zero fields of definition. Γ₀ and Γ₁ have their canonical Q-models; fixed full N-pairing has a Q(ζ_N)-model; the paired twist Y(ρ) has the MC5C Q-model. Effective descent of curve maps and sections applies to these actual models. A section defined over C descends to a characteristic-zero coefficient field K containing the model’s field when its q-expansion at a K-rational split cusp has coefficients in K, with the supplied injective q-expansion map and its field-base-change equality checked. |

**Prerequisites.**

- [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization) (Compact analytic–algebraic modular comparison)
- [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy) (The Hodge line and the automorphy factor)
- [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison) (The analytic comparison for a symplectic twist)
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- `ComplexComparisonPartII:C2/gaga-base-change`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps) *(later layer R13.3)*
- [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation) (Boundary carriers and Hodge evaluation) *(later layer R13.3)*

**Consumers in this roadmap.** [`R12.6/gamma-zero-rational-function-field`](#r12-6-gamma-zero-rational-function-field); [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent); [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences); [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi)

**Acceptance checks.**

- A nonsplit cusp does not give coefficient descent to K without its parameter descent datum.
- The map retains the factor (2πi)^k from the modular Hodge frame.
- The full Hecke pairing of R12.5 is already over Q and remains compatible under this export.

**Sources.**

- [`conrad-qexp`](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.3–6. The q-expansion descent argument and its base hypotheses.
- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.5–4.8, pp.311–313. Coefficient fields in the analytic/algebraic comparison.

<a id="r12-6-gamma-zero-rational-function-field"></a>

### The rational function field of X₀(N)

**Theorem** · `ModularCurvesPartII:R12.6/gamma-zero-rational-function-field` · planet: *Rational modular function field*

On the actual canonical X₀(N)_Q, j is the source invariant and j′ is the invariant of E/C for the cyclic order-N subgroup C. For N≥1, Q(X₀(N))=Q(j,j′), and after the chosen complex comparison j′(τ)=j(Nτ). The minimal polynomial is the imported cyclic modular polynomial Φ_N, of degree ψ(N) in the second variable, giving [Q(X₀(N)):Q(j)]=ψ(N). Normalization of its plane equation recovers the supplied smooth projective model. The algebraic equality Q(X₀(N))=Q(j,j′), the polynomial Φ_N and the normalization of its plane curve are R13.4a/modular-polynomial; this node adds the complex comparison j′(τ)=j(Nτ) and its compatibility with the canonical Q-model and the chosen embedding.

**Hypotheses and conventions.**

- The symbol C denotes the subgroup in E/C here; it is not the base field.
- For N=1, j′=j and Φ₁(X,Y)=Y−X up to the fixed monic convention.
- Use the cyclic correspondence rather than the all-subgroup Hecke correspondence at squareful N.

**Proof plan.**

1. For the standard Γ₀ label ⟨1/N⟩, the quotient torus normalized by multiplication by N has parameter Nτ, giving j′=j(Nτ).
2. Distinct Γ₀ cosets give distinct generic quotient invariants; the orbit count is ψ(N). Apply the supplier’s irreducible monic modular polynomial.
3. Identify the subfield and its extension degree over Q by coefficient descent; the AlgebraicCurves Layer 12C anti-equivalence between function fields and regular projective curves identifies the two actual models.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.gammaZeroRationalFunctionField` | characterisation | On the actual canonical X₀(N)_Q, j is the source invariant and j′ is the invariant of E/C for the cyclic order-N subgroup C. For N≥1, Q(X₀(N))=Q(j,j′), and after the chosen complex comparison j′(τ)=j(Nτ). The minimal polynomial is the imported cyclic modular polynomial Φ_N, of degree ψ(N) in the second variable, giving [Q(X₀(N)):Q(j)]=ψ(N). Normalization of its plane equation recovers the supplied smooth projective model. The algebraic equality Q(X₀(N))=Q(j,j′), the polynomial Φ_N and the normalization of its plane curve are R13.4a/modular-polynomial; this node adds the complex comparison j′(τ)=j(Nτ) and its compatibility with the canonical Q-model and the chosen embedding. |

**Prerequisites.**

- [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison) (Level maps and diamond operators)
- [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent) (Canonical generic models and coefficient descent)
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`
- [`R13.4a/modular-polynomial`](#r13-4a-modular-polynomial) (The cyclic modular polynomial) *(later layer R13.4a)*

**Acceptance checks.**

- At N=1 the extension degree is one.
- At N=4 the function-field degree is six, not the all-subgroup Hecke degree seven.
- The two source/target invariant maps are defined over Q.

**Sources.**

- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), Theorem 6.1, pp.87–90; §7, pp.94–96. The cyclic modular polynomial and the canonical function field.
- [`gz`](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I §1, p.226 (PDF p.3). Q(j,j′) on the canonical Γ₀ model.

<a id="r12-6-component-fields-and-twisted-descent"></a>

### Component fields and symplectic descent

**Theorem** · `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent` · planet: *Pairing-component descent*

For N≥3, the determinant map on the unrestricted full-level generic curve has fibres Y(N,ζ) which are geometrically connected, and the same pairing labels extend to its compact model. Over a splitting field these are exactly its φ(N) geometric components. Galois sends the ζ fibre to the σ(ζ) fibre, so the fixed fibre is defined over Q(ζ) and cannot be treated as a Q-subcurve without a compatible descent datum. The frame cocycle of the paired representation descends the selected fibre to Y(ρ)/Q and its canonical compact normalization. An unpaired GL₂ twist of all determinant fibres is a different moduli problem.

**Hypotheses and conventions.**

- The compact normalization of Y(ρ) is supplied by the generic algebraic compactification/descent interface; it is not constructed by analytic completion.
- Use the pairing-compatible cocycle of MC5C. Determinant data are part of the descent, not extra component labels added afterwards.

**Proof plan.**

1. Apply geometric connectedness on every primitive determinant fibre. The Galois-equivariant algebraic pairing computes the permutation of fibres.
2. Identify the stabilizer of ζ in Galois and its cyclotomic fixed field.
3. Use the imported symplectic-frame quotient descent and unique proper-curve normalization to obtain the twisted compact model and its level compatibilities.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.componentFieldsAndTwistedDescent` | characterisation | For N≥3, the determinant map on the unrestricted full-level generic curve has fibres Y(N,ζ) which are geometrically connected, and the same pairing labels extend to its compact model. Over a splitting field these are exactly its φ(N) geometric components. Galois sends the ζ fibre to the σ(ζ) fibre, so the fixed fibre is defined over Q(ζ) and cannot be treated as a Q-subcurve without a compatible descent datum. The frame cocycle of the paired representation descends the selected fibre to Y(ρ)/Q and its canonical compact normalization. An unpaired GL₂ twist of all determinant fibres is a different moduli problem. |

**Prerequisites.**

- [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness) (Geometric connectedness of a fixed-pairing curve)
- [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison) (The analytic comparison for a symplectic twist)
- [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent) (Canonical generic models and coefficient descent)
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*

**Consumers in this roadmap.** [`R12.6/complex-conjugation-comparison`](#r12-6-complex-conjugation-comparison); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison)

**Acceptance checks.**

- At N=5, Galois permutes four geometric components through the cyclotomic character.
- A nontrivial paired twist is geometrically one fixed-pairing curve, not four components.

**Sources.**

- [`conrad-course`](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §8, pp.17–19; §9, pp.20–22; Theorem 17.21, p.42. Fixed pairing values and their connected components.
- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.5–4.8, pp.311–313. Cyclotomic coefficient fields in full-level comparison.

<a id="r12-6-complex-conjugation-comparison"></a>

### Complex conjugation and pairing inversion

**Theorem** · `ModularCurvesPartII:R12.6/complex-conjugation-comparison` · planet: *Conjugation comparison*

Complex conjugation on the canonical algebraic models corresponds analytically to τ↦−τ̄ after restoring the positive lattice orientation. On a strict full frame of pairing ζ_N⁻¹, (P,Q)=(1/N,τ/N), the conjugate becomes (P′,−Q′) on Λ\_{−τ̄}; its pairing is e_N(P′,Q′)⁻¹=ζ_N, the complex conjugate of ζ_N⁻¹. It sends the ζ component to the ζ⁻¹ component, acts on cusp labels and residue fields through their actual cyclotomic descent data, and commutes with Γ₀ source/target j maps. An arbitrary automorphism of C acts semilinearly on the algebraic model; it is not claimed to be a holomorphic map on H.

**Hypotheses and conventions.**

- The analytic formula is for the continuous field automorphism of complex conjugation.
- Choose the oriented basis explicitly; taking (1,τ̄) without changing orientation would give a lower-half-plane parameter.

**Proof plan.**

1. Conjugate the lattice and its torsion coordinates, then replace the second period by its negative to return to H.
2. The basis change has determinant −1, so use the Weil pairing determinant formula.
3. Compare algebraic conjugation on the independently constructed models, their j functions and cusp charts; uniqueness extends the open comparison.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.complexConjugationComparison` | characterisation | Complex conjugation on the canonical algebraic models corresponds analytically to τ↦−τ̄ after restoring the positive lattice orientation. On a strict full frame of pairing ζ_N⁻¹, (P,Q)=(1/N,τ/N), the conjugate becomes (P′,−Q′) on Λ\_{−τ̄}; its pairing is e_N(P′,Q′)⁻¹=ζ_N, the complex conjugate of ζ_N⁻¹. It sends the ζ component to the ζ⁻¹ component, acts on cusp labels and residue fields through their actual cyclotomic descent data, and commutes with Γ₀ source/target j maps. An arbitrary automorphism of C acts semilinearly on the algebraic model; it is not claimed to be a holomorphic map on H. |

**Prerequisites.**

- [`R12.1/analytic-algebraic-weil-pairing`](#r12-1-analytic-algebraic-weil-pairing) (The analytic Weil-pairing comparison)
- [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels) (Cusp fields and pairing components)
- [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent) (Component fields and symplectic descent)
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`

**Acceptance checks.**

- At N=3 conjugation exchanges the two pairing components.
- For Γ₀(N) the rational cusps 0 and infinity remain rational.
- Complex conjugation is antiholomorphic; arbitrary σ∈Aut(C) receives no analytic continuity assertion.

**Sources.**

- [`bt`](https://benjamin-bakker.github.io/P.torsion.pdf), published §2.1 (not re-read; see sourceVersions). The antiholomorphic involution on the projective level curves.
- [`milne`](https://www.jmilne.org/math/CourseNotes/MF.pdf), §7, pp.95–96. The algebraic Aut(C) action defined through j and j′.
- [`bt-preprint`](https://arxiv.org/pdf/1403.7168v2), §2.1, p.5. The antiholomorphic involution of Y(1) by negating the complex structure, and the induced involution of Y(p) and X(p).

<a id="r12-6-generic-base-change-and-level-compatibility"></a>

### Generic base change and level compatibility

**Theorem** · `ModularCurvesPartII:R12.6/generic-base-change-and-level-compatibility` · planet: *Generic-fibre compatibility*

All the generic-fibre curve, pairing, cusp, Hodge-line and regular-differential comparisons commute with characteristic-zero field extension, level division, the imported diamond actions and the characteristic-zero Hecke actions with their stated level conditions. The finite boundary algebra and its rational/cyclotomic labels base change as algebraic data. The resulting interface is supplied to R13.4b and the CM-class-function consumers. It makes no assertion that formation of arbitrary integral coarse spaces commutes with every base change.

**Hypotheses and conventions.**

- Field extensions are flat; retain the actual model’s field, cusp splitting field and pairing value.
- A map changing determinant is a map between the indicated components. For U_p and good T_n retain the separate branch conditions.

**Proof plan.**

1. Check the commutative diagrams on the marked torus and Tate charts for every permitted map.
2. Use faithful field extension and the algebraic map/section descent interface to obtain equalities over the coefficient field.
3. Apply uniqueness of extension on normal projective curves and proper coherent base change for differential section spaces.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.genericBaseChangeAndLevelCompatibility` | characterisation | All the generic-fibre curve, pairing, cusp, Hodge-line and regular-differential comparisons commute with characteristic-zero field extension, level division, the imported diamond actions and the characteristic-zero Hecke actions with their stated level conditions. The finite boundary algebra and its rational/cyclotomic labels base change as algebraic data. The resulting interface is supplied to R13.4b and the CM-class-function consumers. It makes no assertion that formation of arbitrary integral coarse spaces commutes with every base change. |

**Prerequisites.**

- [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison) (Level maps and diamond operators)
- [`R12.3/cusp-ramification-and-level-maps`](#r12-3-cusp-ramification-and-level-maps) (Cusp ramification under level maps)
- [`R12.5/hecke-normalization-comparison`](#r12-5-hecke-normalization-comparison) (The pullback–trace Hecke normalization)
- [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent) (Canonical generic models and coefficient descent)
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- `ComplexComparisonPartII:C2/gaga-base-change`
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves) *(later layer R13.4a)*
- [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change) (Base change for coarse modular curves) *(later layer R13.4a)*

**Consumers in this roadmap.** [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences)

**Acceptance checks.**

- The dependency direction is R13.4a→R12.3→R12.6→R13.4b.
- No integral coarse-base-change theorem is smuggled into the field-extension comparison.
- Every Hecke diagram uses the normalization proved in R12.5.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.8, pp.310–313. Compatibility of the algebraic/analytic maps and modular sections.
- [`conrad-qexp`](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.3–6. Coefficient-field base change under its stated hypotheses.

<a id="r13-1"></a>

## R13.1. Generalised elliptic curves

Generalized elliptic curves are semistable genus-one curves whose smooth locus is a commutative group acting on the whole curve; their degenerate geometric fibres are Néron polygons. Construct the split polygons and their automorphism groups μ_m×ℤ/2, the degeneration scheme and its polygon strata, contraction along a positive divisor, quotients by finite locally free subgroups, Drinfeld level structures and cyclicity on the smooth locus, formal algebraization of polygon families, and the stacks Ell_m with their decontraction maps. On the smooth locus these agree with the elliptic curves of ModularCurves; nothing about smooth elliptic curves is rebuilt.

<a id="r13-1-semistable-genus-one-curves-and-neron-polygons"></a>

### Semistable genus-one curves and split polygons

**Definition** · `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`

A semistable genus-one curve C/S is proper, flat and finitely presented, with geometrically connected reduced fibres having only ordinary double points and trivial dualizing sheaf. Its smooth locus is Cˢᵐ. The split m-gon C_m is obtained by gluing infinity on the ith P¹_S to zero on the (i+1)st, indexed by Z/mZ, with C_mˢᵐ=G_m×Z/mZ. For m=1 identify two distinct sections of one P¹; an integral plane model is y²z+xyz=x³, with identity [0:1:0]. Every singular geometric fibre of a semistable genus-one curve is a polygon; the smooth fibres are genus-one curves.

**Hypotheses and conventions.**

- m≥1 and S is arbitrary; m=1 is a self-gluing, not a cycle with two independent components.
- The nodal-curve, normalization, dual-graph and dualizing-sheaf machinery is imported from TauCetiRoadmap StableReduction Layers 1–3. No chosen identity or group law is part of the semistable-curve definition.

**Proof plan.**

1. Use nodal gluing of marked P¹ components, including the two distinct branches in the one-component case.
2. Compute arithmetic genus from the StableReduction normalization exact sequence and dual-graph formula, and identify the dualizing sheaf using differentials with opposite residues at each glued pair.
3. For a singular connected nodal curve with trivial dualizing sheaf, the StableReduction componentwise degree formula forces every rational component to have valency two; its dual graph is a cycle. Smooth genus-one components cannot carry a node under the same formula.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.SemistableGenusOneCurve` | structure | The proper flat finitely presented curve with the stated geometric-fibre conditions. |
| `TauCeti.ModularCurves.neronPolygon` | constructor | C_m/S with its component indexing and gluing data. |
| `TauCeti.ModularCurves.neronPolygon_smoothLocus` | characterisation | C_mˢᵐ≅G_m×Z/mZ. |
| `TauCeti.ModularCurves.neronPolygon_baseChange` | functoriality | The split m-gon commutes with arbitrary base change. |
| `TauCeti.ModularCurves.neronPolygon_one_equation` | compatibility | The one-gon identifies with y²z+xyz=x³. |
| `TauCeti.ModularCurves.splitOneGonEquation` | constructor | The light native Weierstrass equation over Z with a₁=1 and all other coefficients zero, realizing y²z+xyz=x³. It is singular and does not stand in for the generalized-curve carrier. |

**Unit tests.**

- `TauCeti.ModularCurves.neronPolygon_one` (degenerate): For m=1, the normalization is one P¹ and the node has two distinct preimages; x=t(t+1), y=t²(t+1) gives the plane equation.
- `TauCeti.ModularCurves.neronPolygon_characteristicTwo` (computation): The tangent cone at (0,0) is y(y+x), so the two branches remain distinct in characteristic two.
- `TauCeti.ModularCurves.neronPolygon_three` (computation): C₃ has three geometric irreducible components and three nodes.
- `TauCeti.ModularCurves.semistableGenusOne_nonExample` (non-example): The cuspidal cubic y²z=x³ is excluded because its singularity is not an ordinary double point.

**Uses.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves): Adds the smooth-locus group and its action.
- [`R13.1/non-smooth-locus-and-base-change`](#r13-1-non-smooth-locus-and-base-change) (The degeneration scheme and polygon strata): Identifies the degeneration scheme and component strata.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`
- `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`

**Consumers in this roadmap.** [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve); [`R13.1/deligne-rapoport-structure-criterion`](#r13-1-deligne-rapoport-structure-criterion); [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon); [`R13.4a/projective-scalar-coarse-quotient`](#r13-4a-projective-scalar-coarse-quotient)

**Acceptance checks.**

- The split one-gon has two normalization preimages at its node, in every characteristic.
- The structure sheaf and the singular scheme are retained over nonreduced bases.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), II §§1.1–1.5, pp.173–176. The polygon geometry and semistable genus-one fibres.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.2, p.4, and the standard polygons, pp.4–5, corrected as E101. DR semistable genus-one curves and the standard n-gons; the plane model printed for the 1-gon is corrected in E101.

<a id="r13-1-generalized-elliptic-curve"></a>

### Generalized elliptic curves

**Definition** · `ModularCurvesPartII:R13.1/generalized-elliptic-curve` · planet: *Generalized elliptic curves*

A generalized elliptic curve E/S is a semistable genus-one curve with a commutative S-group structure on Eˢᵐ and an action Eˢᵐ×_S E→E extending translation on Eˢᵐ. On each singular geometric fibre translation rotates the components, equivalently it acts trivially on Pic⁰ and transitively on the components. Its identity is a section of Eˢᵐ. A homomorphism is an S-map carrying smooth locus to smooth locus, inducing a group homomorphism there and respecting the action. The standard m-gon has (u,i)(v,j)=(uv,i+j) on its smooth locus; this action extends to the glued curve. Smooth generalized elliptic curves recover the imported elliptic-curve group-scheme carrier.

**Hypotheses and conventions.**

- S is arbitrary; the smooth group is usually not proper. The complete curve is not itself a group scheme in the degenerate case.
- The compatibility with the rotation action is part of the data and does not follow from putting any group structure on Eˢᵐ.

**Proof plan.**

1. Extend multiplication on each G_m component of the split polygon to the corresponding P¹ and check agreement at the glued sections.
2. Descend the group and action along fppf trivializations, using the generic descent supplier.
3. On a smooth fibre the curve equals its smooth locus and the data are precisely a pointed genus-one group scheme.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve` | structure | The curve, smooth group, identity and extending action. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.smoothGroup` | projection | The smooth separated commutative group Eˢᵐ. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.action` | projection | The extending translation action on E. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.baseChange` | functoriality | Pullback of the curve, identity, group and action. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.hom` | relation | Smooth-locus-preserving equivariant group morphisms. |
| `TauCeti.ModularCurves.GeneralizedEllipticCurve.ofEllipticCurve` | coercion | The smooth case agrees with MC1D. |

**Unit tests.**

- `TauCeti.ModularCurves.generalizedEllipticCurve_one` (computation): The one-gon has smooth group G_m, with identity at u=1.
- `TauCeti.ModularCurves.generalizedEllipticCurve_emptyBoundary` (degenerate): If every fibre is smooth, Eˢᵐ=E and this is an ordinary elliptic curve.
- `TauCeti.ModularCurves.generalizedEllipticCurve_baseChange` (compatibility): Pulling back twice identifies with pullback along the composite, including the action.
- `TauCeti.ModularCurves.generalizedEllipticCurve_contraction` (non-example): Contracting a component may send its smooth points to a node, so the curve map need not be a homomorphism.

**Uses.**

- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons): Determines boundary inertia.
- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures): Provides the compactified level object.

**Prerequisites.**

- [`R13.1/semistable-genus-one-curves-and-neron-polygons`](#r13-1-semistable-genus-one-curves-and-neron-polygons) (Semistable genus-one curves and split polygons)
- `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `SchemeAndStackFoundations:SF.1`

**Consumers in this roadmap.** [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms); [`R13.1/non-smooth-locus-and-base-change`](#r13-1-non-smooth-locus-and-base-change); [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor); [`R13.1/finite-subgroup-quotients`](#r13-1-finite-subgroup-quotients); [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity); [`R13.1/formal-polygon-algebraization`](#r13-1-formal-polygon-algebraization); [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions); [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon)

**Acceptance checks.**

- The standard group law extends to every component and both branches at a node.
- A contraction may send smooth points to nodes and is not automatically a homomorphism under this definition.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), II §§1.1–1.12, pp.173–178. The polygons, the group action and component rotation (1.9–1.11), and Définition 1.12 of a generalized elliptic curve.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.4, p.5; §2.2, pp.7–8. Generalized elliptic structures, their morphisms, and the Deligne–Rapoport construction principle.

<a id="r13-1-neron-polygon-automorphisms"></a>

### Automorphisms and torsion of split polygons

**Theorem** · `ModularCurvesPartII:R13.1/neron-polygon-automorphisms`

For m≥1, the group scheme of automorphisms of the generalized m-gon is μ_m×(Z/2Z)_S. A root ζ acts by (u,i)↦(ζ^i u,i), and the other factor acts by (u,i)↦(u⁻¹,−i); the two actions commute. Its rank is 2m and its μ_m factor is not étale at primes dividing m. For N≥1, C_mˢᵐ[N]=μ_N×(Z/mZ)[N], of finite locally free rank N gcd(N,m). It has rank N² exactly when N divides m. These formulas are group-scheme identities compatible with arbitrary base change.

**Hypotheses and conventions.**

- The constant Z/2 factor remains étale in characteristic two; μ_m is the possible infinitesimal factor.
- Do not replace μ_m by its geometric-point set in bad characteristic.

**Proof plan.**

1. An automorphism fixes the identity, permutes components through a group automorphism and preserves their cyclic adjacency. The action condition leaves component permutation i↦i or −i.
2. On each component, equivariance gives u↦c_i u or c_i/u; compatibility forces c_i=ζ^i with ζ^m=1. Check directly that inversion commutes with this scaling.
3. Compute the N-kernel separately on G_m and the constant component group. The latter has gcd(N,m) elements.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.neronPolygonAutomorphisms` | characterisation | For m≥1, the group scheme of automorphisms of the generalized m-gon is μ_m×(Z/2Z)_S. A root ζ acts by (u,i)↦(ζ^i u,i), and the other factor acts by (u,i)↦(u⁻¹,−i); the two actions commute. Its rank is 2m and its μ_m factor is not étale at primes dividing m. For N≥1, C_mˢᵐ[N]=μ_N×(Z/mZ)[N], of finite locally free rank N gcd(N,m). It has rank N² exactly when N divides m. These formulas are group-scheme identities compatible with arbitrary base change. |

**Prerequisites.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`

**Consumers in this roadmap.** [`R12.2/projective-prime-level-application`](#r12-2-projective-prime-level-application); [`R13.1/finite-subgroup-quotients`](#r13-1-finite-subgroup-quotients); [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity); [`R13.1/formal-polygon-algebraization`](#r13-1-formal-polygon-algebraization); [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions); [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures); [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries); [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line)

**Acceptance checks.**

- For m=5 over C there are ten automorphisms and the two factors commute.
- For m=p in characteristic p the automorphism scheme has rank 2p but only two geometric points.
- For N=2 on a one-gon the torsion rank is two, not four.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), II 1.10, pp.177–178; 1.20, p.184. Aut(C,+) of the standard n-gon (written as a semidirect product of the inversion group by μ_n, the action being trivial), and the torsion of the polygon.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), Lemma 2.1.6, p.7; Lemma 2.1.11, p.8. The automorphism functor of the standard m-gon is μ_m×Z/2Z, and the torsion of the smooth locus is computed.
- [`bt`](https://benjamin-bakker.github.io/P.torsion.pdf), published §2.2 (not re-read; see sourceVersions). The direct-product polygon automorphism calculation.
- [`bt-preprint`](https://arxiv.org/pdf/1403.7168v2), §2.2, pp.5–6. The n-gon automorphism group, written as Z/nZ⋉Z/2Z with Z/2Z normal, hence a direct product, with the μ_n factor acting by ζ^m on the m-th component.

<a id="r13-1-non-smooth-locus-and-base-change"></a>

### The degeneration scheme and polygon strata

**Theorem** · `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change`

For a generalized elliptic curve E/S define Eˢⁱⁿᵍ by Fitt₁(Ω¹_E/S) and define S∞ as its schematic image in S. Formation of these closed subschemes commutes with arbitrary base change. The degeneration scheme decomposes into open and closed strata S∞_m on which the geometric fibres are m-gons; Eˢⁱⁿᵍ→S∞_m is finite étale of degree m. Over S∞_m the curve is fppf locally the split m-gon, including when S∞_m is nonreduced. The complement S\\S∞ is the largest open elliptic locus.

**Hypotheses and conventions.**

- The statement is about schematic degeneration, not just its reduced support.
- The locally constant polygon count is on S∞, not necessarily on all of S.

**Proof plan.**

1. Compute Fitt₁ and its image on a split polygon and on an étale node chart xy=a.
2. Use translation to transport a node and its local deformation ideal to all components, making their schematic images agree. The polygon trivialization over that image identifies the finite node cover.
3. Descend these identifications and their base-change equalities; the local chart describes the complement exactly.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.nonSmoothLocusAndBaseChange` | characterisation | For a generalized elliptic curve E/S define Eˢⁱⁿᵍ by Fitt₁(Ω¹_E/S) and define S∞ as its schematic image in S. Formation of these closed subschemes commutes with arbitrary base change. The degeneration scheme decomposes into open and closed strata S∞_m on which the geometric fibres are m-gons; Eˢⁱⁿᵍ→S∞_m is finite étale of degree m. Over S∞_m the curve is fppf locally the split m-gon, including when S∞_m is nonreduced. The complement S\\S∞ is the largest open elliptic locus. |

**Prerequisites.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

**Consumers in this roadmap.** [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions)

**Acceptance checks.**

- The split m-gon over S has S∞=S, not S_red.
- A smooth elliptic family has empty degeneration scheme.
- Node count and the locally split description persist after any base change.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.8, Lemma 2.1.10 and Theorem 2.1.12, p.6. The Fitting-ideal non-smooth locus, its schematic image S∞, the fppf-local standard n-gon over S∞_n, and base-change compatibility of S∞ for generalized elliptic curves (false for general semistable genus-one curves, Example 2.1.11).
- [`ces`](https://arxiv.org/pdf/1511.07475v2), Remark 2.1.8 and Lemma 2.1.10, pp.7–8. E^sing→S∞ is finite étale of degree n over S∞_n, compatibly with base change.

<a id="r13-1-deligne-rapoport-structure-criterion"></a>

### The translation structure criterion

**Theorem** · `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`

Let C/S be semistable genus one with section e in Cˢᵐ. If a commutative flat locally finitely presented S-group G acts on C, acts trivially on the algebraic space Pic⁰\_{C/S} and, on every geometric fibre, transitively on the irreducible components, then C has a unique generalized elliptic structure with identity e for which G acts by translations. An automorphism commuting with G is translation by its value at e PROVIDED it also acts trivially on Pic⁰. Equivalently, an ample finite locally free Cartier divisor D⊂Cˢᵐ with a group law and extending action gives this structure precisely when its action on Pic⁰ is trivial; for such finite locally free D the triviality may be checked on geometric fibres, and the locus where it holds is open and closed in S.

**Hypotheses and conventions.**

- Both the group-action condition and, for the automorphism conclusion, the automorphism’s Pic⁰ condition are required.
- The divisor version requires D to meet every component.

**Proof plan.**

1. On geometric fibres, the transitive component action and Pic⁰ condition reduce the action to translations on the standard polygon or smooth genus-one curve.
2. Use the section e to rigidify the possible structure and descend the fibrewise translation laws and extending action.
3. For the automorphism conclusion subtract the translation by α(e). The remaining identity-fixing automorphism acting trivially on Pic⁰ is the identity; this fails for inversion if the Pic⁰ hypothesis is omitted.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.deligneRapoportStructureCriterion` | characterisation | Let C/S be semistable genus one with section e in Cˢᵐ. If a commutative flat locally finitely presented S-group G acts on C, acts trivially on the algebraic space Pic⁰\_{C/S} and, on every geometric fibre, transitively on the irreducible components, then C has a unique generalized elliptic structure with identity e for which G acts by translations. An automorphism commuting with G is translation by its value at e PROVIDED it also acts trivially on Pic⁰. Equivalently, an ample finite locally free Cartier divisor D⊂Cˢᵐ with a group law and extending action gives this structure precisely when its action on Pic⁰ is trivial; for such finite locally free D the triviality may be checked on geometric fibres, and the locus where it holds is open and closed in S. |

**Prerequisites.**

- [`R13.1/semistable-genus-one-curves-and-neron-polygons`](#r13-1-semistable-genus-one-curves-and-neron-polygons) (Semistable genus-one curves and split polygons)
- `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`

**Consumers in this roadmap.** [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor); [`R13.1/formal-polygon-algebraization`](#r13-1-formal-polygon-algebraization)

**Acceptance checks.**

- For a smooth elliptic curve and G=1, inversion commutes with G but is not translation in characteristic zero.
- An ample subgroup on the standard polygon recovers its standard group/action.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), II Théorème 3.2, pp.193–194. The structure criterion; its automorphism clause requires the automorphism to satisfy (3.1.1), triviality on Pic⁰.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.2.2 and Corollary 2.2.3, pp.7–8, corrected as E102. The translation and divisor criteria.

<a id="r13-1-contraction-away-from-a-divisor"></a>

### Contraction along a positive Cartier divisor

**Construction** · `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor` · planet: *Divisor contraction*

Let D⊂Eˢᵐ be finite locally free over S, a relative effective Cartier divisor of positive degree on every geometric fibre. Define c_D:E→E_D by the relative Proj of ⊕\_{r≥0}f_\*O_E(rD). It contracts exactly the components missed by D, commutes with arbitrary base change and is unique with the stated contraction property. It identifies the preimage of E_Dˢᵐ with E_Dˢᵐ. If D is a subgroup, E_D has a unique generalized elliptic structure making this identification a group isomorphism, and the image of D is ample. If E is smooth or D meets every component, c_D is an isomorphism.

**Hypotheses and conventions.**

- The positivity condition excludes the empty divisor. D need not meet every component before contraction.
- The map c_D need not carry all of Eˢᵐ to E_Dˢᵐ; it is not asserted to be a generalized-curve homomorphism.

**Proof plan.**

1. Apply the StableReduction relative Proj, ampleness and cohomology-and-base-change interfaces (Layers 2–3) to O_E(D). The fibre graph identifies its positive-degree and zero-degree components.
2. Use nodal local computations and cohomology base change to prove the section algebra and contraction commute with arbitrary base change.
3. For a subgroup, translations preserve the retained component set and descend to the target. The structure criterion gives the group/action and its uniqueness.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.contractGenusOne` | constructor | E_D with c_D and its relative Proj description. |
| `TauCeti.ModularCurves.contractGenusOne_retainedSmooth` | equivalence | c_D⁻¹(E_Dˢᵐ)≅E_Dˢᵐ. |
| `TauCeti.ModularCurves.contractGenusOne_baseChange` | functoriality | Arbitrary-base-change identification of contractions. |
| `TauCeti.ModularCurves.contractGenusOne_universal` | universal-property | Uniqueness among curve contractions retaining exactly the D-components. |
| `TauCeti.ModularCurves.contractGenusOne_subgroup` | structure | The unique generalized elliptic structure when D is a subgroup. |

**Unit tests.**

- `TauCeti.ModularCurves.contractGenusOne_smooth` (degenerate): On a smooth elliptic curve a positive finite divisor contracts nothing.
- `TauCeti.ModularCurves.contractGenusOne_three_to_one` (computation): For a split three-gon and D={identity}, only the identity component survives and the target is a one-gon.
- `TauCeti.ModularCurves.contractGenusOne_ample` (compatibility): If D meets every component, c_D is the identity up to the specified unique isomorphism.
- `TauCeti.ModularCurves.contractGenusOne_empty` (non-example): The empty divisor has degree zero and does not satisfy this construction’s hypotheses.

**Uses.**

- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions): Builds the polygon-count contraction tower.
- [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels) (Compactified level maps and their degrees): Defines compactified level reduction.

**Prerequisites.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- [`R13.1/deligne-rapoport-structure-criterion`](#r13-1-deligne-rapoport-structure-criterion) (The translation structure criterion)
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`
- `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`
- `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`

**Consumers in this roadmap.** [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension); [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions); [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels); [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny); [`R14.1/diamond-operators`](#r14-1-diamond-operators); [`R14.1/projective-boundary-hecke-and-degree`](#r14-1-projective-boundary-hecke-and-degree)

**Acceptance checks.**

- Retain the distinction between generic projective-curve contraction and the special generalized-curve structure.
- A smooth point on a discarded component may map to a node.

**Sources.**

- [`dr`](https://publications.ias.edu/sites/default/files/Number22.pdf), IV §§1.1–1.6, pp.205–209. Contraction and the group on the retained smooth locus.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.1, p.7 (end of the section). The contraction away from a relative Cartier divisor in the smooth locus, its uniqueness, base change and induced generalized elliptic structure when D is a subgroup.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), §3.2, 3.2.1 and Theorem 3.2.4, pp.19–21. Contractions through the polygon-count stack.

<a id="r13-1-finite-subgroup-quotients"></a>

### Finite subgroup quotients of generalized curves

**Construction** · `ModularCurvesPartII:R13.1/finite-subgroup-quotients` · planet: *Finite polygon quotients*

For a finite locally free subgroup K⊂Eˢᵐ, construct the quotient E/K as a generalized elliptic curve with a finite surjective universally open homomorphism E→E/K whose smooth-locus restriction is the finite locally free group quotient by K. Its kernel is K and its formation commutes with arbitrary base change. If a geometric fibre of E is an m-gon, the quotient has m/h components, where h is the order of the image of K in its constant component group. On a split m-gon, quotient by μ_d in the identity component sends u↦u^d on every component and retains m components. The TOTAL curve map need not be flat at nodes.

**Hypotheses and conventions.**

- K is contained in the smooth locus and is finite locally free, including nonétale K.
- The target is S-flat; this does not say that the finite quotient morphism between complete curves is flat.

**Proof plan.**

1. Work fppf locally with the split polygon and separate K∩G_m from its component image. Take diagonalizable invariants for the former and the free component quotient for the latter.
2. Check the invariant rings at the nodes and show compatibility with base change. Descend the resulting proper curve and its smooth group/action.
3. Recover the kernel and universal property on the smooth locus; equivariance and density give uniqueness on the complete curve.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.generalizedEllipticQuotient` | constructor | E/K with its quotient homomorphism. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_kernel` | characterisation | The smooth group kernel is K. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_universal` | universal-property | Factorization of homomorphisms killing K. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_baseChange` | functoriality | Formation commutes with arbitrary base change. |
| `TauCeti.ModularCurves.generalizedEllipticQuotient_components` | characterisation | The quotient component count is m/h. |

**Unit tests.**

- `TauCeti.ModularCurves.generalizedEllipticQuotient_trivial` (degenerate): Quotient by the identity subgroup is E.
- `TauCeti.ModularCurves.generalizedEllipticQuotient_multiplicative` (computation): C_m/μ_d retains m components and maps u to u^d.
- `TauCeti.ModularCurves.generalizedEllipticQuotient_components` (computation): Quotient C₆ by the constant subgroup of order three in its component group has two components.
- `TauCeti.ModularCurves.generalizedEllipticQuotient_nodeFlatness` (non-example): For d>1, u↦u^d on a one-gon is not flat at the node; its nodal fibre length differs from the generic degree d.

**Uses.**

- [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels) (Compactified level maps and their degrees): Provides the isogeny quotient needed alongside contraction.
- ModularCurvesPartII:R13.3: Supplies a quotient interface without making a Tate chart a prerequisite.

**Prerequisites.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons)
- `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`

**Acceptance checks.**

- Separate target flatness from flatness of the finite quotient morphism.
- The construction imports the ordinary elliptic quotient rather than replanning it.

**Sources.**

- [`ces`](https://arxiv.org/pdf/1511.07475v2), Theorem 2.2.4, Corollary 2.2.7 and Definition 2.2.8, pp.10–14. General finite subgroup quotients and their base-change interface.

<a id="r13-1-drinfeld-structures-and-cyclicity"></a>

### Drinfeld structures on the smooth locus

**Definition** · `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity` · planet: *Boundary Drinfeld structures*

A Drinfeld A-structure on Eˢᵐ is a homomorphism α:A→Eˢᵐ(S) for which D_α=∑\_{a∈A}[α(a)] is a finite locally free subgroup and a relative effective Cartier divisor of rank #A. It is ample when D_α meets every geometric component. A cyclic subgroup of order N is a finite locally free subgroup locally admitting a Drinfeld Z/N-generator; its generator scheme is finite locally free of rank φ(N). For d|N its standard order-d subgroup and cyclic quotients are generator-independent and compatible with base change. These extend the existing MC3C/8B carriers to Eˢᵐ; they are not new definitions of general Drinfeld full sets.

**Hypotheses and conventions.**

- Repeated sections and nonétale subgroup divisors are allowed. “Basis” is not an assertion of injectivity on geometric points.
- For a full (Z/N)² structure require D_α=Eˢᵐ[N]; the torsion has rank N² only when N divides the polygon count.

**Proof plan.**

1. Apply the imported full-set/divisor definition on the smooth relative curve and use the polygon torsion calculation on degenerate fibres.
2. Use torsion congruences and the extension node below to transfer the generator-scheme and cyclicity results from the ordinary elliptic locus.
3. Check standard subgroup and quotient identities by generator changes; descend using their generator independence.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.GeneralizedDrinfeldStructure` | structure | α together with the subgroup-divisor equality. |
| `TauCeti.ModularCurves.GeneralizedDrinfeldStructure.ample` | relation | The divisor meets every geometric component. |
| `TauCeti.ModularCurves.GeneralizedCyclicSubgroup.generators` | constructor | The Drinfeld-generator scheme G×. |
| `TauCeti.ModularCurves.GeneralizedCyclicSubgroup.standardSubgroup` | constructor | The canonical subgroup of each divisor order. |
| `TauCeti.ModularCurves.GeneralizedCyclicSubgroup.generators_rank` | characterisation | G× has finite locally free rank φ(N). |
| `TauCeti.ModularCurves.GeneralizedDrinfeldStructure.smoothComparison` | compatibility | On elliptic families it is exactly the imported level structure. |

**Unit tests.**

- `TauCeti.ModularCurves.generalizedDrinfeldStructure_mu` (computation): The generator scheme of μ_N is cut out by Φ_N and has rank φ(N).
- `TauCeti.ModularCurves.generalizedDrinfeldStructure_p` (degenerate): In characteristic p, repeated zero sections may be a valid full set for an infinitesimal p-subgroup.
- `TauCeti.ModularCurves.generalizedCyclicSubgroup_two` (non-example): For an elliptic curve in characteristic different from two, E[2] is not cyclic of order four.
- `TauCeti.ModularCurves.generalizedCyclicSubgroup_ordinary` (compatibility): In characteristic p, μ_p×Z/p may be cyclic in the Drinfeld sense; geometric-point injectivity is not the criterion.

**Uses.**

- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures): Defines full, Γ₁ and cyclic boundary levels.
- [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension) (Torsion congruences and level extension): Provides the finite flat lifting and generator results.

**Prerequisites.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons)
- `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`
- `tauceti:TauCetiRoadmap/ModularCurves#8b-generator-schemes-and-the-cyclicity-theorem`
- `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`
- `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`

**Consumers in this roadmap.** [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension); [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures); [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions); [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts); [`R13.4a/modular-polynomial`](#r13-4a-modular-polynomial); [`R13.5/igusa-components`](#r13-5-igusa-components); [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model)

**Acceptance checks.**

- The generator locus is a scheme, including its nonreduced fibres.
- A cyclic subgroup’s standard subgroups are independent of a choice of generator.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.3 and Theorem 2.4.5, pp.10–16, using E114’s replacement proof. Ample Drinfeld structures on generalized curves.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), §4.2, pp.29–36. Torsion congruences and full-set/cyclicity extension.

<a id="r13-1-formal-polygon-algebraization"></a>

### Algebraization of formal polygon families

**Theorem** · `ModularCurvesPartII:R13.1/formal-polygon-algebraization` · planet: *Formal polygon algebraization*

Let A be Noetherian and complete for an ideal I of definition, and let E_r/A/I^(r+1) be a compatible system of generalized elliptic curves whose degenerate geometric fibres all have a fixed number m of components. There is a unique generalized elliptic curve E/A inducing this system, up to the uniquely compatible isomorphism. The construction and the equivalence on objects and isomorphisms use algebraization of proper curves and finite ample torsion data; they do not apply proper GAGA to the nonproper smooth group Eˢᵐ.

**Hypotheses and conventions.**

- m≥1 is fixed. The underlying proper formal curve and the compatible smooth-locus identities/actions are part of the system.
- This target concerns compatible objects and isomorphisms; it does not assert an unrestricted algebraization theorem for every nonproper group morphism.

**Proof plan.**

1. The m-torsion on each m-gon is finite of rank m² and gives an ample divisor. Algebraize the proper curve with this ample marking by Grothendieck’s algebraization theorem (AdicSpacesPartII F0).
2. Algebraize the finite torsion divisor as a closed subscheme and the group law and its action as morphisms with proper source (F0 closed-subscheme algebraization and formal full faithfulness). Apply the translation structure criterion to recover the generalized elliptic structure.
3. Use the uniqueness part of proper formal algebraization and the rigidified action criterion to identify every E_r and all compatible isomorphisms.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.formalPolygonAlgebraization` | characterisation | Let A be Noetherian and complete for an ideal I of definition, and let E_r/A/I^(r+1) be a compatible system of generalized elliptic curves whose degenerate geometric fibres all have a fixed number m of components. There is a unique generalized elliptic curve E/A inducing this system, up to the uniquely compatible isomorphism. The construction and the equivalence on objects and isomorphisms use algebraization of proper curves and finite ample torsion data; they do not apply proper GAGA to the nonproper smooth group Eˢᵐ. |

**Prerequisites.**

- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons)
- [`R13.1/deligne-rapoport-structure-criterion`](#r13-1-deligne-rapoport-structure-criterion) (The translation structure criterion)
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- `AdicSpacesPartII:F0/grothendieck-algebraization`
- `AdicSpacesPartII:F0/grothendieck-existence`
- `AdicSpacesPartII:F0/closed-subscheme-algebraization`
- `AdicSpacesPartII:F0/formal-morphism-full-faithfulness`

**Consumers in this roadmap.** [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension); [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions)

**Acceptance checks.**

- The case m=1 is included.
- The proof algebraizes proper data before defining the smooth group.
- Full Tate charts and Tate uniformization remain R13.3 targets.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Corollary 2.2.4, pp.8–9. Formal algebraization through an ample torsion divisor.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), Lemma 3.4.1, p.25; Theorem 3.4.2 and proof, pp.26–27. The generalized-curve formal algebraization statement.

<a id="r13-1-torsion-congruences-and-level-extension"></a>

### Torsion congruences and level extension

**Theorem** · `ModularCurvesPartII:R13.1/torsion-congruences-and-level-extension`

The ordinary elliptic Drinfeld full-set and cyclicity results extend to generalized elliptic curves with torsion of the required rank. Locally on the base near an m-gon, when N|m the N-torsion agrees to every specified finite infinitesimal order with that of a suitable elliptic deformation; divisor/full-set identities, generator schemes, standard subgroups and their finite-flat ranks therefore extend across degeneration. In particular full Nm-structures reduce to full N-structures with finite locally free lifting rank |GL₂(Z/Nm)|/|GL₂(Z/N)|, full N-structures forget to ample Γ₁(N)-structures with rank Nφ(N), and cyclic order-N subgroups have finite locally free generator schemes of rank φ(N). When polygon counts differ, use the contraction/decontraction interface rather than an unproved smoothing of a prime-to-characteristic polygon.

**Hypotheses and conventions.**

- N,m≥1. Reduction of levels on a family includes the necessary contraction; an uncontracted N-frame need not be ample.
- Rank statements are statements about the relative level functors after the indicated contraction, not merely counts on geometric points.

**Proof plan.**

1. Prove the torsion congruence using the local node deformation and smooth group; it concerns finite torsion and does not need a full Tate uniformization.
2. Apply the ordinary full-set theorems at each finite infinitesimal order, including nilpotent base rings. Use the infinitesimal finite-presentation criterion to descend the closed divisor identities and flatness.
3. Use standard subgroup and quotient identities, then contraction, to pass among polygon counts. Česnavičius’s proof removes the prime-to-characteristic restriction left in the older deformation argument.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.torsionCongruencesAndLevelExtension` | characterisation | The ordinary elliptic Drinfeld full-set and cyclicity results extend to generalized elliptic curves with torsion of the required rank. Locally on the base near an m-gon, when N\|m the N-torsion agrees to every specified finite infinitesimal order with that of a suitable elliptic deformation; divisor/full-set identities, generator schemes, standard subgroups and their finite-flat ranks therefore extend across degeneration. In particular full Nm-structures reduce to full N-structures with finite locally free lifting rank \|GL₂(Z/Nm)\|/\|GL₂(Z/N)\|, full N-structures forget to ample Γ₁(N)-structures with rank Nφ(N), and cyclic order-N subgroups have finite locally free generator schemes of rank φ(N). When polygon counts differ, use the contraction/decontraction interface rather than an unproved smoothing of a prime-to-characteristic polygon. |

**Prerequisites.**

- [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity) (Drinfeld structures on the smooth locus)
- [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor) (Contraction along a positive Cartier divisor)
- [`R13.1/formal-polygon-algebraization`](#r13-1-formal-polygon-algebraization) (Algebraization of formal polygon families)
- `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`
- `tauceti:TauCetiRoadmap/ModularCurves#8b-generator-schemes-and-the-cyclicity-theorem`
- `tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

**Consumers in this roadmap.** [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures); [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin); [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels)

**Acceptance checks.**

- The mixed-characteristic case with p dividing the polygon count is included.
- At N=3, forgetting one vector of a full frame has rank 3φ(3)=6.
- At prime p, full lifting from level one has rank |GL₂(F_p)|=(p²−1)(p²−p).

**Sources.**

- [`ces`](https://arxiv.org/pdf/1511.07475v2), Lemma 4.2.1 and Propositions 4.2.5, 4.2.9, 4.2.11 and 4.2.12, pp.29–35; remark before Proposition 4.2.11, p.33. Torsion congruences with elliptic curves and the extension of the Katz–Mazur full-set and cyclicity results; the remark on p.33 explains why Conrad’s deformation step in his Theorem 2.4.5 needs this replacement.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.4.5, pp.15–16, proof replaced as in E114. The finite flat level-forgetting targets.

<a id="r13-1-polygon-count-stacks-and-decontractions"></a>

### Polygon-count stacks and decontractions

**Construction** · `ModularCurvesPartII:R13.1/polygon-count-stacks-and-decontractions` · planet: *Polygon-count stacks*

For m≥1 define Ell_m over Z to classify generalized elliptic curves whose degenerate fibres are m-gons. This is a proper smooth Artin stack of relative dimension one with finite diagonal. Its boundary is a reduced effective Cartier divisor, with standard-polygon inertia μ_m×Z/2, and its largest Deligne–Mumford open removes the boundary fibres at primes dividing m. For n,m≥1 contraction with respect to Eˢᵐ[n] defines Ell_nm→Ell_n, a proper flat finitely presented surjection with relative boundary inertia μ_m; it need not be representable. For E/S in Ell_n, its m-fold decontraction stack is the 2-fibre product S×_Ell_n Ell_nm, carrying the universal curve and contraction isomorphism. It commutes with arbitrary base change.

**Hypotheses and conventions.**

- On an nm-gon the n-torsion meets n components, so the contraction has n-gon target.
- The elliptic open is shared by all Ell_m. The largest DM open concerns the polygon stack, not the refined level stack.

**Proof plan.**

1. Use an ample finite subgroup marking, the SF.4 Hilbert scheme of the tricanonically embedded curves and the SF.1 algebraic-stack interface. Its frame cover is a GL_r torsor, not a projective-space bundle. The structure criterion cuts out the generalized-curve data.
2. Use the nodal deformation parameter and finite polygon automorphism scheme to prove smoothness, boundary Cartier structure and the valuative properness statement.
3. Construct the contraction tower from the divisor contraction. Compute its kernel μ_m on a split polygon; prove properness/flatness locally and descend. The universal 2-fibre product gives decontractions and all their compatibilities.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.polygonCountStack` | constructor | Ell_m and its universal generalized elliptic curve. |
| `TauCeti.ModularCurves.polygonCountStack_boundary` | projection | The reduced Cartier boundary and standard-gon chart. |
| `TauCeti.ModularCurves.polygonCountStack_contraction` | functoriality | Ell_nm→Ell_n with the displayed properties. |
| `TauCeti.ModularCurves.polygonDecontractionStack` | constructor | The 2-fibre product of a curve with the contraction tower. |
| `TauCeti.ModularCurves.polygonDecontractionStack_universal` | universal-property | Objects are decontractions equipped with the specified contraction isomorphism. |
| `TauCeti.ModularCurves.polygonDecontractionStack_baseChange` | compatibility | Exact 2-fibre-product base-change compatibility. |

**Unit tests.**

- `TauCeti.ModularCurves.polygonCountStack_one` (computation): Ell₁ is DM over Z, with one-gon inertia Z/2.
- `TauCeti.ModularCurves.polygonCountStack_badPrime` (non-example): Ell_p has nonétale μ_p boundary inertia in characteristic p and is not DM there.
- `TauCeti.ModularCurves.polygonDecontractionStack_identity` (degenerate): For m=1 the decontraction is the identity 2-fibre product.
- `TauCeti.ModularCurves.polygonCountStack_relativeInertia` (compatibility): Ell₆→Ell₃ has boundary kernel μ₂, so it is not representable even over C.

**Uses.**

- [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions) (Coherent cyclic data on decontractions): Provides the stack on which cyclic data descend.
- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks): Supplies smooth polygon charts and contractions.

**Prerequisites.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons)
- [`R13.1/non-smooth-locus-and-base-change`](#r13-1-non-smooth-locus-and-base-change) (The degeneration scheme and polygon strata)
- [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor) (Contraction along a positive Cartier divisor)
- [`R13.1/formal-polygon-algebraization`](#r13-1-formal-polygon-algebraization) (Algebraization of formal polygon families)
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.4`
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`
- `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`

**Consumers in this roadmap.** [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin); [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions); [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli); [`R13.4a/level-h-structures`](#r13-4a-level-h-structures); [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack); [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line)

**Acceptance checks.**

- The generic curve-stack construction is imported; this node owns only the polygon-count specialization and tower.
- A proper flat stack morphism is not automatically representable or finite.

**Sources.**

- [`ces`](https://arxiv.org/pdf/1511.07475v2), Theorem 3.1.6 and Remark 3.1.7, p.17; Theorem 3.2.4, p.21. Ell_n is algebraic with finite diagonal, proper and smooth; its largest DM open removes the boundary over Z/nZ; the boundary is a reduced relative effective Cartier divisor; the contraction tower Ell_nm→Ell_n.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §3.1, pp.18–22, corrected atlas wording as E104. The proper stack construction.

<a id="r13-2"></a>

## R13.2. Compactified level moduli

Compactify the level moduli over ℤ. Define full, point, mixed Γ₁(N;n) and naive cyclic level structures on generalized elliptic curves; prove their stacks are proper, flat, regular and Cohen–Macaulay of relative dimension one, with the exact Deligne–Mumford range; construct Česnavičius's refined Γ₀(N) from coherent cyclic data on decontractions; extend the Weil-pairing determinant to the cyclotomic base; record the fine loci and the inertia at bad levels; prove agreement with the Katz–Mazur problems of ModularCurves on the elliptic locus; and extend the level maps with their degrees.

<a id="r13-2-gamma-level-structures"></a>

### Integral full, point and cyclic level structures

**Definition** · `ModularCurvesPartII:R13.2/gamma-level-structures` · planet: *Integral level structures*

On a generalized elliptic curve define: full Γ(N) level as an ample Drinfeld (Z/N)²-structure with divisor Eˢᵐ[N]; Γ₁(N) level as an ample Drinfeld Z/N-generator P; and naive Γ₀(N) level as an ample cyclic subgroup G⊂Eˢᵐ of order N. Full level forces an N-gon at degeneration. The point and naive cyclic levels permit exactly polygon counts dividing N. For arbitrary N,n≥1, a mixed Γ₁(N;n) structure is a cyclic order-N subgroup G with generator P and a cyclic order-n subgroup H, with [G_d+H_d]=Eˢᵐ[d] for d=gcd(N,n), and with [G+H] an ample Cartier subgroup divisor of rank Nn. The condition is on subgroup divisors, including nilpotents. Full fixed pairing is the determinant fibre described separately below.

**Hypotheses and conventions.**

- The mixed condition is allowed for all N,n, using the Česnavičius definition; the older Conrad restricted admissible pairs are only a comparison subcase.
- Ampleness is essential on generalized curves. No geometric-point order test replaces the Drinfeld divisor condition.

**Proof plan.**

1. Use the generalized Drinfeld and cyclic-subgroup carriers. Apply the polygon torsion rank formula and ampleness to obtain the allowed component counts.
2. Form standard d-subgroups, impose their full d-torsion span and define the sum divisor locally from generators; use generator independence to descend.
3. On the elliptic open recover precisely the existing MC3C/8D full, point and cyclic levels.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.GeneralizedFullLevel` | structure | An ample full Drinfeld frame with the N-torsion divisor equality. |
| `TauCeti.ModularCurves.GeneralizedPointLevel` | structure | An ample Drinfeld generator of order N. |
| `TauCeti.ModularCurves.GeneralizedNaiveCyclicLevel` | structure | An ample cyclic order-N subgroup. |
| `TauCeti.ModularCurves.GeneralizedMixedLevel` | structure | P,G,H with the d-torsion span and ample sum divisor. |
| `TauCeti.ModularCurves.generalizedLevel_smoothComparison` | compatibility | The elliptic open is the imported ordinary level functor. |
| `TauCeti.ModularCurves.generalizedFullLevel_polygonCount` | characterisation | A degenerate full-level object has exactly N components. |

**Unit tests.**

- `TauCeti.ModularCurves.generalizedFullLevel_one` (degenerate): At N=1 the full compactification has one-gon degeneration and no rigidifying level.
- `TauCeti.ModularCurves.generalizedPointLevel_twoGon` (computation): On C₂ over C, P=(1,1) gives an ample point of order two.
- `TauCeti.ModularCurves.generalizedCyclicLevel_ampleness` (non-example): μ_N in the identity component of C₂ is not ample, so it is not a naive Γ₀(N) boundary level.
- `TauCeti.ModularCurves.generalizedMixedLevel_square` (compatibility): For N=n=p², a full p²-torsion decomposition satisfies the mixed definition; it is not excluded by n being nonsquarefree.

**Uses.**

- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks): Defines the integral moduli groupoids.
- [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions) (Coherent cyclic data on decontractions): Supplies the naive data to refine.

**Prerequisites.**

- [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity) (Drinfeld structures on the smooth locus)
- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons)
- [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension) (Torsion congruences and level extension)
- `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`
- `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`

**Consumers in this roadmap.** [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin); [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions); [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries); [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels); [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi)

**Acceptance checks.**

- The three naive levels are kept separate from the refined Γ₀ model.
- Every allowed component count follows from torsion rank and ampleness.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §1.2, p.2; §2.4, pp.14–16; §3.2, pp.23–26. The full, point and mixed levels in Conrad’s range ord_p(n)≤ord_p(N) for p|gcd(N,n).
- [`ces`](https://arxiv.org/pdf/1511.07475v2), §§4.3.1, 4.4.1 and 4.6.1, pp.37, 39 and 44. The stacks X(n), X₁(n) and X₁(n;n′) with the unrestricted mixed condition and ampleness.

<a id="r13-2-moduli-stacks-are-proper-flat-artin"></a>

### Proper flat integral level stacks

**Theorem** · `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin` · planet: *Proper integral level stacks*

The stacks Xfull(N), X₁(N), X₁(N;n) and X₀(N)^naive of the preceding levels are proper flat finitely presented Artin stacks over Z of relative dimension one, with finite diagonal, and are regular and Cohen–Macaulay. They are smooth after inverting their levels. Xfull(N) and X₁(N) are Deligne–Mumford over all of Z. The naive cyclic stack is DM over Z precisely when N is squarefree; for general N its largest DM open removes the boundary objects with nonétale relative polygon inertia. The mixed stack’s DM range is given by the separate small-level node; it is not characterized by n being squarefree.

**Hypotheses and conventions.**

- N,n≥1; no blanket fine-scheme assertion is part of this theorem.
- “Regular” refers to regular smooth atlases; Cohen–Macaulay and relative dimension are stack properties.
- The flat/proper conclusions include bad characteristics and nonreduced bases.

**Proof plan.**

1. Construct the moduli via polygon-count stacks, the ordinary Drinfeld level functors and finite-presentation descent. Use finite-flat full-level covers and the contraction tower.
2. On the ordinary open apply MC7B’s Katz–Mazur deformation/local-ring contracts. On the boundary use the smooth Ell_m chart and the full-set lifting theorem; faithful flat covers transfer regularity to the other level problems.
3. Apply valuative extension and the generalized-curve contraction interface for properness; establish flatness and relative dimension on these same charts. Compute boundary inertia to identify the DM loci.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.moduliStacksAreProperFlatArtin` | characterisation | The stacks Xfull(N), X₁(N), X₁(N;n) and X₀(N)^naive of the preceding levels are proper flat finitely presented Artin stacks over Z of relative dimension one, with finite diagonal, and are regular and Cohen–Macaulay. They are smooth after inverting their levels. Xfull(N) and X₁(N) are Deligne–Mumford over all of Z. The naive cyclic stack is DM over Z precisely when N is squarefree; for general N its largest DM open removes the boundary objects with nonétale relative polygon inertia. The mixed stack’s DM range is given by the separate small-level node; it is not characterized by n being squarefree. |

**Prerequisites.**

- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures)
- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions)
- [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension) (Torsion congruences and level extension)
- `tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `SchemeAndStackFoundations:SF.1`

**Consumers in this roadmap.** [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli); [`R13.2/fixed-pairing-integral-components`](#r13-2-fixed-pairing-integral-components); [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes); [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts); [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence); [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications); [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura)

**Acceptance checks.**

- Full and point stacks remain DM at bad primes, though they may have geometric automorphisms.
- The naive cyclic model at N=p² is Artin rather than DM at its p-gon boundary in characteristic p.
- No R13.3 Tate chart is assumed in constructing these stacks.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Lemma 3.1.1 and Theorem 3.1.2, p.18; Theorem 3.2.7, p.26; Theorem 3.3.1, pp.26–30. Properness, flatness and regularity of the compactified problems.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), Theorems 4.3.5 (p.39), 4.4.4 (p.40) and 4.6.4 (p.46); Proposition 4.6.5 (p.47). The full/point/mixed stack properties without the older admissibility restriction.

<a id="r13-2-coherent-cyclic-decontractions"></a>

### Coherent cyclic data on decontractions

**Definition** · `ModularCurvesPartII:R13.2/coherent-cyclic-decontractions` · planet: *Coherent cyclic decontractions*

For N≥1 and each m|N put g(m)=gcd(m,N/m) and d(m)=m/g(m). A refined Γ₀(N) object is a generalized elliptic curve E/S, a cyclic order-N subgroup G on its elliptic open U, opens S_(m) covering S whose pairwise intersections for different m are U, and the following data on each S_(m): degenerate fibres are d(m)-gons, and on D_m=S_(m)×_Ell_d(m) Ell_m the universal m-gon decontraction carries an ample cyclic order-N subgroup G_(m) extending G. The subgroups are coherent: for any two decontractions over T, fpqc locally choose generators meeting matched components such that their multiples by N/m have the same image on E_T under the specified contraction identifications. The groupoid transition maps preserve these cyclic subgroups. Morphisms preserve E, the labelled opens, the generic subgroup and this decontraction descent datum.

**Hypotheses and conventions.**

- The label m is retained even when two distinct m have the same d(m).
- The generators in the coherence condition are local witnesses, not part of the object. Their multiples land on the retained smooth components.
- A decontraction is a stack object with a contraction isomorphism, not a chosen curve over S.

**Proof plan.**

1. Define the decontraction stack by the preceding 2-fibre product and pull back its universal generalized curve.
2. Use the cyclic transport lemma: matched component generators with the stated multiple determine uniquely the cyclic subgroup on another decontraction. Check the cocycle condition by uniqueness.
3. Express coherence on the double groupoid presentation and descend the divisor subgroups. The standard subgroup of order (N/m)d(m) gives the common subgroup on the contracted curve.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.RefinedCyclicLevel` | structure | The curve, elliptic subgroup, labelled opens and coherent decontraction data. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.polygonLabel` | projection | The m label with d(m)-gon degeneration. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.decontractionSubgroup` | projection | The ample subgroup on the universal m-decontraction. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.coherence` | relation | Matched generators have equal N/m multiples on the contracted curve. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.transport` | characterisation | Unique coherent cyclic transport among decontractions. |
| `TauCeti.ModularCurves.RefinedCyclicLevel.baseChange` | functoriality | Pullback of the groupoid descent datum and its coherence. |

**Unit tests.**

- `TauCeti.ModularCurves.refinedCyclicLevel_squarefree` (computation): If N is squarefree then g(m)=1 and d(m)=m for every divisor m.
- `TauCeti.ModularCurves.refinedCyclicLevel_four` (computation): For N=4, the labels m=1 and m=2 both have d=1 but are distinct labelled boundary loci.
- `TauCeti.ModularCurves.refinedCyclicLevel_elliptic` (degenerate): On U all decontraction stacks identify with U and the datum is just the cyclic subgroup G.
- `TauCeti.ModularCurves.refinedCyclicLevel_missingLabel` (non-example): A one-gon and a generic order-four subgroup without the m label and coherent decontraction data do not determine a refined Γ₀(4) object.

**Uses.**

- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack): Constructs the normalized integral stack.
- ModularCurvesPartII:R13.4a: Supplies the exact stack whose coarse curve is constructed there.

**Prerequisites.**

- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures)
- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions)
- [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity) (Drinfeld structures on the smooth locus)
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `SchemeAndStackFoundations:SF.1`

**Consumers in this roadmap.** [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli); [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts)

**Acceptance checks.**

- At N=4, m=2 gives g=2 and d=1; the boundary curve is a one-gon with data on its two-gon decontractions.
- The full double-overlap coherence equation, not merely a generic subgroup, is retained.

**Sources.**

- [`ces`](https://arxiv.org/pdf/1511.07475v2), §5.2, p.50; §5.3, p.51; Lemma 5.4, p.52; §5.5 and Lemmas 5.6–5.7, pp.53–54; §5.9, pp.56–57. d(m)=m/gcd(m,n/m), the stack of decontractions, coherent transport of cyclic subgroups and the definition of Γ₀(n)-structures.

<a id="r13-2-refined-gamma-zero-moduli"></a>

### The normalized Γ₀ moduli stack

**Construction** · `ModularCurvesPartII:R13.2/refined-gamma-zero-moduli` · planet: *Normalized cyclic moduli*

Construct X₀(N) as the stack of refined cyclic levels. It is regular, proper flat and Deligne–Mumford over Z, of relative dimension one, with finite diagonal, and is the normalization of X(1)=Ell₁ in Y₀(N) over Z[1/N]. Its forgetful map to X(1) is representable. On the m-labelled chart its map to Ell_d(m) is representable by schemes, quasi-finite separated finitely presented and flat, and is étale after inverting N. The naive-to-refined map contracts an m-gon to a d(m)-gon and equips the result with coherent subgroup data. Its relative inertia is μ_g(m); it is proper flat but need not be representable. The chart square with Ell_m→Ell_d(m) is 2-cartesian. For squarefree N the naive and refined stacks agree; for nonsquarefree N they can differ even over C.

**Hypotheses and conventions.**

- X₀(N) denotes a stack here; its actual coarse scheme and its base-change limits are R13.4a outputs.
- Generic [−1] remains, so this Γ₀ stack is never claimed to be a fine elliptic-curve scheme.
- The normalization is taken in the generic ordinary moduli cover, not in a projective plane modular-polynomial equation.

**Proof plan.**

1. Contract each naive m-gon along d(m)-torsion and use coherent transport to define the map. Prove the labelled chart square is 2-cartesian.
2. Use the polygon contraction tower to obtain the proper flat cover. On the contracted chart, coherence removes exactly the μ_g(m) automorphisms; the residual forgetful map is representable and its local charts give regularity and the DM property.
3. Compare the ordinary open with Y₀(N), apply properness and normality, and identify the normalization by the generic finite-cover universal property.

**Assembly note.** The identification of this stack with the normalization 𝒳_{Γ₀(N)} of X(1) over ℤ is restated, with the full and Γ₁ cases, in [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications), which cites this target and adds the comparison with the level-H stacks of R13.4a. The moduli construction, regularity and Deligne–Mumford property belong here.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.refinedGammaZeroStack` | constructor | X₀(N) with its universal refined cyclic datum. |
| `TauCeti.ModularCurves.refinedGammaZeroStack_normalization` | universal-property | Normalization of X(1) in the ordinary Γ₀ generic cover. |
| `TauCeti.ModularCurves.naiveToRefinedGammaZero` | functoriality | Contraction and coherent transport with kernel μ_g(m). |
| `TauCeti.ModularCurves.refinedGammaZeroStack_chartSquare` | compatibility | The labelled square with Ell_m→Ell_d(m) is 2-cartesian. |
| `TauCeti.ModularCurves.refinedGammaZeroStack_forget` | projection | The representable forgetful map to X(1). |
| `TauCeti.ModularCurves.refinedGammaZeroStack_squarefree` | equivalence | Agreement with the naive stack when N is squarefree. |

**Unit tests.**

- `TauCeti.ModularCurves.refinedGammaZeroStack_one` (degenerate): At N=1 it is Ell₁ and has generic inversion inertia.
- `TauCeti.ModularCurves.refinedGammaZeroStack_prime` (compatibility): For prime p the naive and refined models agree.
- `TauCeti.ModularCurves.refinedGammaZeroStack_four` (non-example): For N=4, the naive-to-refined map at an m=2 cusp has kernel μ₂ and is not an isomorphism over C.
- `TauCeti.ModularCurves.refinedGammaZeroStack_badPrime` (computation): In characteristic p at a naive p-gon of level p², the nonétale μ_p kernel is removed in the refined DM stack.

**Uses.**

- ModularCurvesPartII:R13.4a: The only Γ₀ stack supplied for its normalized coarse construction.
- [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels) (Compactified level maps and their degrees): Supplies the refined target and the nonrepresentable comparison map.

**Prerequisites.**

- [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions) (Coherent cyclic data on decontractions)
- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions)
- `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`
- `SchemeAndStackFoundations:SF.1`
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization`
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite`

**Consumers in this roadmap.** [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries); [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes); [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels); [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts); [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves); [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications); [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure)

**Acceptance checks.**

- At N=4 the two-gon naive chart contracts to a one-gon and loses μ₂ relative inertia, including over C.
- At N=1 the refined stack is X(1), not a fine scheme.

**Sources.**

- [`ces`](https://arxiv.org/pdf/1511.07475v2), §5.10, p.58; §5.11 and Lemma 5.12, p.59; Theorem 5.13 and proof, pp.60–62. The refined stack, its labelled charts and the comparison with the naive model; Theorem 5.13 gives the DM property and regularity.

<a id="r13-2-fixed-pairing-integral-components"></a>

### The cyclotomic fixed-pairing compactification

**Theorem** · `ModularCurvesPartII:R13.2/fixed-pairing-integral-components` · planet: *Integral pairing components*

The Weil-pairing determinant on the ordinary full-level locus extends to a map Xfull(N)→Spec Z[ζ_N], using the primitive cyclotomic algebra rather than the possibly nonreduced primitive-root subset of μ_N. Over this base the full-level stack is proper flat Cohen–Macaulay of relative dimension one and smooth near the boundary. Its characteristic-zero ζ fibre is the fixed-pairing curve of MC5B and its geometric fibres are connected. The proof uses generic connectedness from R12.4 and proper Stein factorization. It does not claim that the bad-characteristic fibres are geometrically irreducible or smooth everywhere.

**Hypotheses and conventions.**

- N≥1; Z[ζ_N] denotes Z[T]/(Φ_N), with the specified structural root.
- The all-pairings stack over Z and a geometric fixed-pairing component are distinct objects.
- At primes dividing N the cyclotomic base can be ramified; roots are not labelled by distinct geometric points there.

**Proof plan.**

1. Extend the primitive pairing map from the ordinary invertible-level locus by normality of Xfull(N) and the integral closure defining the cyclotomic algebra.
2. Use the full-level boundary charts and the ordinary local-ring supplier to establish flatness over the cyclotomic base, Cohen–Macaulayness and boundary smoothness.
3. Use the geometrically connected generic determinant fibre and proper Stein factorization to obtain geometric connectedness of all fibres.

**Assembly note.** This target combines two statements of different kinds: the extension of the Weil-pairing determinant to Xfull(N)→Spec ℤ[ζ_N] with flatness and Cohen–Macaulayness (Conrad Theorem 4.1.1(3)), which needs no analytic input, and the geometric connectedness of the fibres, which uses R12.4. The algebraic coarse construction of R13.4a uses only the first and cites Conrad directly for it; it never uses connectedness.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.fixedPairingIntegralComponents` | characterisation | The Weil-pairing determinant on the ordinary full-level locus extends to a map Xfull(N)→Spec Z[ζ_N], using the primitive cyclotomic algebra rather than the possibly nonreduced primitive-root subset of μ_N. Over this base the full-level stack is proper flat Cohen–Macaulay of relative dimension one and smooth near the boundary. Its characteristic-zero ζ fibre is the fixed-pairing curve of MC5B and its geometric fibres are connected. The proof uses generic connectedness from R12.4 and proper Stein factorization. It does not claim that the bad-characteristic fibres are geometrically irreducible or smooth everywhere. |

**Prerequisites.**

- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness) (Geometric connectedness of a fixed-pairing curve)
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `SchemeAndStackFoundations:SF.4`

**Consumers in this roadmap.** [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes)

**Acceptance checks.**

- For N=5, its generic Z-base change to C has four connected pairing components.
- Bad fibres may have several irreducible components despite being connected.
- The extension is an algebraic target and does not use compact analytic uniformization.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1(3), p.31; Theorem 4.2.1(1), p.35; Lemma 4.2.4, p.37. The CM map to Spec Z[ζ_N], geometric connectedness of the fibres, and smoothness along the cusps over Z[ζ_N].
- [`ces`](https://arxiv.org/pdf/1511.07475v2), §4.3, pp.37–39. The full compact stack and its primitive-pairing base.

<a id="r13-2-small-level-and-dm-boundaries"></a>

### Fine loci and bad-level inertia

**Theorem** · `ModularCurvesPartII:R13.2/small-level-and-dm-boundaries`

The compact full-level stack over Z is a fine scheme for N≥2 unless N is a prime power p^s or twice a prime power 2p^s; N=1 is an additional nonfine case. In the exceptional bad fibres there can be nontrivial automorphisms preserving a Drinfeld full set. A sufficient fine condition for compact Γ₁(N) over a base is that N have an invertible divisor d≥5 on that base; the open complex fine range N≥4 is not substituted at cusps. On an m-gon with an ample naive cyclic order-N subgroup, the relative scaling inertia is μ_gcd(m,N/m), commuting with inversion. Thus naive Γ₀(N) is DM over Z exactly for squarefree N. For arbitrary mixed Γ₁(N;n), deleting boundary fibres at primes with v_p(n)≥v_p(N)+2 gives a DM open; if v_p(n)≤v_p(N)+1 for every p, the forgetful map to X(1) is representable and the whole stack is DM. This includes N=n=p² and corrects the older “n squarefree” criterion.

**Hypotheses and conventions.**

- Fine means that the moduli stack is represented by a scheme with its universal object, not just that its coarse scheme exists.
- The full-level criterion is the corrected version of Česnavičius Proposition 4.3.6, adding the omitted N=1 exception.
- The mixed valuation criterion is a sufficient global DM/representability criterion, not an unproved converse for every deleted point.

**Proof plan.**

1. Use rigidity of full sets on ordinary fibres and the explicit polygon action on boundary labels. At exceptional bad ordinary fibres, inspect inversion on infinitesimal torsion.
2. For point level use an invertible order-d generator to eliminate automorphisms, retaining the compact d≥5 hypothesis.
3. For cyclic and mixed levels compute which ζ^i scalings preserve the divisor data. The cyclic kernel is μ_gcd(m,N/m); the mixed calculation gives the valuation range of Česnavičius.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.smallLevelAndDmBoundaries` | characterisation | The compact full-level stack over Z is a fine scheme for N≥2 unless N is a prime power p^s or twice a prime power 2p^s; N=1 is an additional nonfine case. In the exceptional bad fibres there can be nontrivial automorphisms preserving a Drinfeld full set. A sufficient fine condition for compact Γ₁(N) over a base is that N have an invertible divisor d≥5 on that base; the open complex fine range N≥4 is not substituted at cusps. On an m-gon with an ample naive cyclic order-N subgroup, the relative scaling inertia is μ_gcd(m,N/m), commuting with inversion. Thus naive Γ₀(N) is DM over Z exactly for squarefree N. For arbitrary mixed Γ₁(N;n), deleting boundary fibres at primes with v_p(n)≥v_p(N)+2 gives a DM open; if v_p(n)≤v_p(N)+1 for every p, the forgetful map to X(1) is representable and the whole stack is DM. This includes N=n=p² and corrects the older “n squarefree” criterion. |

**Prerequisites.**

- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures)
- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons)
- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack)
- `tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures`

**Consumers in this roadmap.** [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence); [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications); [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura)

**Acceptance checks.**

- Xfull(12) is fine over Z; Xfull(11) need not be fine in characteristic eleven.
- Xfull(1) has inversion inertia and is not a scheme.
- Γ₁(4) is fine on its complex elliptic open but its compact stack has an irregular cusp.
- For N=n=p² the mixed stack is DM although n is not squarefree.

**Sources.**

- [`ces-published`](https://msp.org/ant/2017/11-9/ant-v11-n9-p02-p.pdf), Proposition 4.3.6, pp.2052–2053, corrected as E113; Proposition 4.6.5, pp.2063–2064. The compact fine and unrestricted mixed DM ranges.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), §5.2, pp.50–51. The naive cyclic boundary scaling kernel.
- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 3.2.7, p.26, corrected as E105; Theorem 4.2.1(2), p.35. The point fine range and the obsolete restricted mixed claim.

<a id="r13-2-agreement-with-katz-mazur-schemes"></a>

### Agreement on the ordinary and tame loci

**Theorem** · `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes` · planet: *Ordinary moduli agreement*

Restricting the integral stacks to the elliptic locus recovers the exact ordinary Katz–Mazur level functors supplied by MC3C/7B/8D and their existing representing schemes where their fine hypotheses hold. After inverting the relevant level, the full and point compactifications agree with the normalizations of X(1) in those ordinary covers; the refined Γ₀ compactification is the corresponding normalization over all of Z. The resulting stack comparisons supply R13.4a, whose coarse construction is compared with the existing prime N≥5, Z[1/N] diamond-quotient model at R12.3.

**Hypotheses and conventions.**

- Use the exact level functor, structural cyclotomic base, and fine/coarse distinction on each overlap.
- The naive cyclic stack is not substituted for the refined normalization at nonsquarefree N.
- This is an identification of carriers and morphisms; no duplicate Katz–Mazur ordinary representability proof is planned.

**Proof plan.**

1. Restrict the divisor/full-set conditions to a smooth proper elliptic family, where they are the imported definitions. Uniqueness of representing objects gives the ordinary identification.
2. Use normality, properness and the shared dense ordinary cover to identify the compact stack normalizations.
3. Keep the full cyclotomic base and the point/cyclic level carriers in these identifications. Export the stack agreement to the coarse construction; its comparison to MC Layer 10 is R12.3, not a prerequisite of this construction.

**Assembly note.** The normalization descriptions stated here are the moduli-side statements; [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications) identifies these stacks with the level stacks 𝒳_H, and [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification) and [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement) carry out the comparison with the coarse schemes and with ModularCurves Layer 10 that the last sentence refers to.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.agreementWithKatzMazurSchemes` | characterisation | Restricting the integral stacks to the elliptic locus recovers the exact ordinary Katz–Mazur level functors supplied by MC3C/7B/8D and their existing representing schemes where their fine hypotheses hold. After inverting the relevant level, the full and point compactifications agree with the normalizations of X(1) in those ordinary covers; the refined Γ₀ compactification is the corresponding normalization over all of Z. The resulting stack comparisons supply R13.4a, whose coarse construction is compared with the existing prime N≥5, Z[1/N] diamond-quotient model at R12.3. |

**Prerequisites.**

- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack)
- [`R13.2/fixed-pairing-integral-components`](#r13-2-fixed-pairing-integral-components) (The cyclotomic fixed-pairing compactification)
- `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures`
- `tauceti:TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes`
- `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization`

**Consumers in this roadmap.** [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications); [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi)

**Acceptance checks.**

- The existing prime-level Z[1/N] diamond quotient is reused.
- The all-pairings ordinary full moduli and a fixed-pairing fibre are compared on their respective bases.
- At N=4, naive and refined boundary objects remain distinct.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1, p.31; Theorem 4.2.1 and Remark 4.2.2, pp.35–36. Agreement of compact stacks with the ordinary moduli and tame fine schemes.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), Theorems 4.3.5 (p.39) and 4.4.4 (p.40); §5.10, p.58. Identification with the appropriate normalized stacks.

<a id="r13-2-contraction-maps-between-levels"></a>

### Compactified level maps and their degrees

**Theorem** · `ModularCurvesPartII:R13.2/contraction-maps-between-levels`

Level reduction followed by contraction extends the ordinary maps Xfull(Nm)→Xfull(N), Xfull(N)→X₁(N), and X₁(N)→X₀(N)^naive. These maps are representable finite locally free, with ranks |GL₂(Z/Nm)|/|GL₂(Z/N)|, Nφ(N), and φ(N), respectively. The composite to the refined X₀(N) is obtained through the coherent naive-to-refined map. That comparison and the bare polygon tower are proper flat but may be nonrepresentable, so their degrees are not read as finite-cover ranks. All maps commute with arbitrary base change of the stack data and with the stated level row/diamond actions. After passing to coarse curves, account for generic stabilizers before inferring degrees: for N≥5 in characteristic zero X₁(N)→X₀(N) has coarse degree φ(N)/2. Pairing-changing row actions are maps between the indicated cyclotomic fibres.

**Hypotheses and conventions.**

- N,m≥1; the full-level ranks are for the all-pairings stacks. A fixed-pairing restriction has its determinant-compatible rank.
- The finite locally free claims apply to the three specified level maps, not to every proper flat contraction of stacks.
- Coarse formation is an R13.4a supplier and need not commute with arbitrary integral base change.

**Proof plan.**

1. Construct the reduction and use subgroup-divisor contraction to restore ampleness. Apply the generalized full-set lifting and generator-scheme results for the three finite-flat ranks.
2. Use coherence to descend the cyclic datum to the refined model; compare the relative μ_g(m) inertia separately.
3. Check the identities on the ordinary open, then on the universal polygon charts; properness and uniqueness of contractions extend them everywhere. For the asserted characteristic-zero coarse degree, the open analytic comparison computes the effective congruence index φ(N)/2; the finite generic coarse extension has that same degree.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.contractionMapsBetweenLevels` | characterisation | Level reduction followed by contraction extends the ordinary maps Xfull(Nm)→Xfull(N), Xfull(N)→X₁(N), and X₁(N)→X₀(N)^naive. These maps are representable finite locally free, with ranks \|GL₂(Z/Nm)\|/\|GL₂(Z/N)\|, Nφ(N), and φ(N), respectively. The composite to the refined X₀(N) is obtained through the coherent naive-to-refined map. That comparison and the bare polygon tower are proper flat but may be nonrepresentable, so their degrees are not read as finite-cover ranks. All maps commute with arbitrary base change of the stack data and with the stated level row/diamond actions. After passing to coarse curves, account for generic stabilizers before inferring degrees: for N≥5 in characteristic zero X₁(N)→X₀(N) has coarse degree φ(N)/2. Pairing-changing row actions are maps between the indicated cyclotomic fibres. |

**Prerequisites.**

- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures)
- [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor) (Contraction along a positive Cartier divisor)
- [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension) (Torsion congruences and level extension)
- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack)
- `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`
- [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization) (Open modular uniformization with the specified level)
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`

**Consumers in this roadmap.** [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence); [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications)

**Acceptance checks.**

- For N=3, full-to-point rank is six.
- For N=11, point-to-cyclic stack rank is ten while its complex coarse degree is five.
- For N=4,m_boundary=2 the naive-to-refined kernel is μ₂ and the map is not a finite locally free representable cover.
- All-pairings full reduction and fixed-pairing reduction have distinct determinant bookkeeping.

**Sources.**

- [`conrad-generalized-elliptic`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.4.5, pp.15–16; §§4.1–4.2, pp.31–37. The specified finite-flat forgetful maps.
- [`ces`](https://arxiv.org/pdf/1511.07475v2), Proposition 4.2.11, pp.33–34; Theorem 5.13, pp.60–62. Replacement lifting argument and proper-flat naive-to-refined comparison.

<a id="r13-3"></a>

## R13.3. Tate curves and formal neighbourhoods of cusps

Tate curves and formal neighbourhoods of the cusps. Construct the generalized Tate n-gon over ℤ[[t]] with q=tⁿ and its power isogenies (finite of generic degree m, but not flat at the nodes), the formal level structures at the cusps for each level problem, the integral Γ₁ cusp strata with their cyclotomic components, the twisted Tate charts, the boundary as an effective Cartier divisor on which the Hodge line is trivialized by du/u, and the cusp rings of Γ₀(pⁿ). These charts are the formal comparison behind the q-expansion principle, and they are the boundary input of R13.4a and R12.3. Tau Ceti's existing Tate equation and its coefficients are imported; on Layer 10's prime-level class the charts are compared with that layer's.

<a id="r13-3-generalized-tate-n-gon"></a>

### Generalized Tate n-gons

**Construction** · `ModularCurvesPartII:R13.3/generalized-tate-n-gon` · planet: *Generalized Tate curve*

For n≥1 put A=ℤ[[t]], q=tⁿ. Glue the n formal node charts A{Xᵢ,Yᵢ}/(XᵢYᵢ−t), i∈ℤ/n, along their punctured branches to a proper formal n-gon; the identifications match consecutive branches and preserve the sections (1,t). Algebraize with the ample rotation orbit of these sections. The resulting generalized elliptic curve Tateₙ(t)/A has split n-gon fibre at t=0, smooth elliptic generic locus t≠0, degeneracy ideal (t), and canonical identity-component formal group Ĝₘ. Its generic elliptic curve is Tate₁(q), with the comparison fixed at the identity. This adds the generalized proper family to the existing equation-level Tate curve, not new coefficients.

**Hypotheses and conventions.**

- No inversion of 2, 3 or n; a node has complete local equation XY=t.
- The conventional Weierstrass coefficients and Laurent-series ellipticity already exist in current Tau Ceti; the construction is the proper generalized family.

**Proof plan.**

1. Glue node charts with the cyclic branch identification from Conrad §2.5; compare the formal smooth locus to Ĝₘ and the rotation action.
2. Use the supplied polarized formal algebraization and full faithfulness to algebraize the curve and action.
3. Apply the Deligne–Rapoport structure criterion imported from R13.1; Theorem 2.5.2 identifies the generic Tate curve and makes the identity comparison unique.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.generalizedTate` | constructor | Tateₙ(t) with its zero, group action and generic-fibre comparison. |
| `TauCeti.ModularCurves.generalizedTate_special` | compatibility | Its closed fibre is the imported split n-gon with identity on component 0. |
| `TauCeti.ModularCurves.generalizedTate_degeneracy` | characterisation | The scheme-theoretic degeneracy ideal is (t), not (tⁿ). |
| `TauCeti.ModularCurves.generalizedTate_formalGroup` | equivalence | The completion along zero is Ĝₘ with invariant differential du/u. |
| `TauCeti.ModularCurves.generalizedTate_unique` | universal-property | A generalized n-gon extension with this generic and identity-formal comparison is uniquely isomorphic to Tateₙ(t). |

**Unit tests.**

- `TauCeti.ModularCurves.generalizedTate_one` (degenerate): Tate₁(t) at t=0 is the pointed nodal cubic.
- `TauCeti.ModularCurves.generalizedTate_two_nodes` (computation): Tate₂(t) has two components and two nodes, although the graph has only two vertices.
- `TauCeti.ModularCurves.generalizedTate_pole` (compatibility): j(Tateₙ(t)) has pole order n, while every node has thickness one over ℤ[[t]].

**Uses.**

- Conrad07 Theorem 4.3.6: Supplies generalized curves on completed cusp charts.
- R14.1: Extends universal isogenies and differentials to cusps.

**Prerequisites.**

- [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve) (Generalized elliptic curves)
- [`R13.1/semistable-genus-one-curves-and-neron-polygons`](#r13-1-semistable-genus-one-curves-and-neron-polygons) (Semistable genus-one curves and split polygons)
- `SchemeAndStackFoundations:SF.4/grothendieck-algebraization`
- `SchemeAndStackFoundations:SF.4/algebraization-of-subschemes-and-morphisms`

**Consumers in this roadmap.** [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement); [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny); [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts); [`R13.3/gamma-one-twisted-tate-chart`](#r13-3-gamma-one-twisted-tate-chart); [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line); [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level)

**Acceptance checks.**

- n=1 specializes to the pointed nodal cubic; n=2 has two rational components and two nodes.
- The generic invariant satisfies j=q⁻¹+744+O(q), hence pole order n in t.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.5, pp.16–18; Theorem 2.5.2, p.18. The glued formal family, ample rotation divisor, algebraization and uniqueness give the generalized n-gon extension.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-3-tate-power-isogeny"></a>

### Power isogenies at the boundary

**Construction** · `ModularCurvesPartII:R13.3/tate-power-isogeny`

For m,n≥1 the branch power maps give a pointed finite morphism Tateₙ(t)→Tateₙ(tᵐ) of generic degree m. Its restriction to the smooth loci is finite locally free of rank m, with kernel μₘ in the identity component and pullback du/u↦m du/u. The proper morphism is not flat at the nodes for m>1: over a field, the completed target-to-source map is k[[t,X,Y]]/(XY−tᵐ) → k[[t,x,y]]/(xy−t), X↦xᵐ, Y↦yᵐ, and the fibre at the closed target node is k[x,y]/(xy,xᵐ,yᵐ) of length 2m−1. The target is the base change t↦tᵐ of the n-gon family and need not have regular total space. On generic fibres the map is u↦uᵐ from Tate₁(tⁿ) to Tate₁(tⁿᵐ).

**Proof plan.**

1. Raise branch coordinates to the mth power, respecting the overlap and equations xy=t and XY=tᵐ. Each branch coordinate is integral over its mth power, so these charts give a finite map.
2. Use SF.4 algebraization and full faithfulness for the proper formal maps. Generic degree m follows from the elliptic isogeny; smooth-locus flatness follows from the μₘ torsor on Gₘ, component by component.
3. At a target node set t=X=Y=0. The remaining monomials 1,x,…,x^(m−1),y,…,y^(m−1) form a basis of the fibre, giving length 2m−1. A finite flat map of generic rank m would have fibre length m, so the proper map is not flat for m>1.
4. The smooth-locus power map gives the kernel and differential, including the zero differential in characteristic dividing m.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.tatePower` | constructor | The pointed finite map of generic degree m, with its source and target comparisons; no whole-curve flatness field. |
| `TauCeti.ModularCurves.tatePower_kernel` | characterisation | The smooth-locus kernel is μₘ, not the constant group ℤ/m in bad characteristic. |
| `TauCeti.ModularCurves.tatePower_differential` | simp | Pullback of du/u is m du/u. |
| `TauCeti.ModularCurves.tatePower_comp` | functoriality | Composition of the mth and rth power maps is the mrth power map with the necessary base changes. |
| `TauCeti.ModularCurves.tatePower_smooth_flat` | compatibility | The restriction to the smooth loci is finite locally free of rank m, a μₘ torsor on each component. |
| `TauCeti.ModularCurves.tatePower_node_fibre_length` | characterisation | At a geometric target node the fibre has length 2m−1; for m>1 the proper map is not flat. |

**Unit tests.**

- `TauCeti.ModularCurves.tatePower_one` (degenerate): m=1 gives the identity.
- `TauCeti.ModularCurves.tatePower_char_two` (computation): m=2 in characteristic 2 has rank-two kernel μ₂ and zero differential.
- `TauCeti.ModularCurves.tatePower_target_thickness` (non-example): For m=2 the target node XY=t² has thickness 2; it is not the original regular smoothing.
- `TauCeti.ModularCurves.tatePower_node_fibre_two` (non-example): For m=2 the node fibre has basis 1,x,y and length 3, not 2. The suggested nodePowerFibreMonomials enumeration checks this exponent list without constructing a geometric carrier.

**Uses.**

- Conrad07 §4.5: Explains the p-divisibility of the coherent Hecke trace.
- R13.6: Tracks thicknesses under boundary morphisms.

**Prerequisites.**

- [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon) (Generalized Tate n-gons)
- [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor) (Contraction along a positive Cartier divisor)
- `SchemeAndStackFoundations:SF.4/grothendieck-algebraization`
- `SchemeAndStackFoundations:SF.4/algebraization-of-subschemes-and-morphisms`

**Consumers in this roadmap.** [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence); [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences); [`R14.1/coherent-hecke-trace`](#r14-1-coherent-hecke-trace); [`R14.1/projective-boundary-hecke-and-degree`](#r14-1-projective-boundary-hecke-and-degree)

**Acceptance checks.**

- For m=p in characteristic p the generic isogeny is inseparable of degree p, the smooth-locus kernel has rank p and the differential vanishes; this does not imply flatness of the proper power map.
- For m=2 the target-node fibre has length 3, whereas the generic degree is 2. Reject a finite-flat assertion for the whole proper morphism.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Example 2.5.1, p.18; Theorem 4.4.3, pp.43–46. The displayed branch maps and smooth-locus isogeny are used with the finite-flat assertion on the whole proper curve corrected by source issue E307. The finite-flat moduli maps of Theorem 4.4.3 are different morphisms.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-3-formal-level-cusp-charts"></a>

### Formal level structures at cusps

**Construction** · `ModularCurvesPartII:R13.3/formal-level-cusp-charts` · planet: *Formal cusp charts*

For a specified Γ-level problem, form its finite generic level cover on Tate₁(q) and take the integral closure of the q-adic base in each generic component. Classify the boundary data on split n-gons via their smooth locus Gₘ×ℤ/n and Drinfeld generators, keeping the stabilizer action on the smoothing parameter and Hodge line. The resulting formal stack charts, with their descent groupoids, describe the completion of the compactified stack. A complete local ring of its coarse curve is an invariant ring only under the applicable coarse-completion theorem; it is not the framed stack chart itself. On the prime N≥5 diamond class over ℤ[1/N], use Layer 10’s existing cusp charts and prove comparison with this generalized family.

**Proof plan.**

1. Identify the generic level cover using the imported torsion/Drinfeld definitions and contraction maps.
2. Normalize each generic component and extend the generalized curve with its identity-formal comparison.
3. Compute stabilizers on the chosen chart before descending; compare the exact prime-level overlap to Layer 10 by uniqueness.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.formalLevelChart` | constructor | A normalized formal level chart with generic level data, generalized family and descent arrows. |
| `TauCeti.ModularCurves.formalLevelChart_generic` | compatibility | Restriction q≠0 identifies the chosen generic level cover. |
| `TauCeti.ModularCurves.formalLevelChart_inertia` | projection | The full stabilizer acts on the parameter and on du/u; retain infinitesimal inertia. |
| `TauCeti.ModularCurves.formalLevelChart_completion` | equivalence | The formal stack completion is obtained from these charts and their overlap groupoid. |
| `TauCeti.ModularCurves.formalLevelChart_primeComparison` | compatibility | Agreement with the Layer 10 chart after inverting prime N≥5. |

**Unit tests.**

- `TauCeti.ModularCurves.formalLevelChart_width_one` (degenerate): No level and the chosen 1-gon chart give parameter q and width 1.
- `TauCeti.ModularCurves.formalLevelChart_prime_import` (compatibility): For prime Γ₀(N), j⁻¹ has orders 1 and N at its two cusps, as in Layer 10.
- `TauCeti.ModularCurves.formalLevelChart_wild_invariants` (non-example): In characteristic 2 the Γ₁(4) coarse completion cannot be obtained by asserting arbitrary base change of invariant rings.

**Uses.**

- R13.4a: Produces the independent algebraic compactification.
- R13.4b and R15: Supplies precise cusp fields, widths and evaluation of sections.

**Prerequisites.**

- [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon) (Generalized Tate n-gons)
- [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity) (Drinfeld structures on the smooth locus)
- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures)
- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions) (Coherent cyclic data on decontractions)
- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack)
- [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels) (Compactified level maps and their degrees)
- `AlgebraicModuliForArithmeticGeometry:R09.6/completed-atlas-presentation`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`

**Consumers in this roadmap.** [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization); [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement); [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels); [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent); [`R13.3/gamma-one-integral-boundary`](#r13-3-gamma-one-integral-boundary); [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves); [`R13.4a/coarse-cusp-regularity`](#r13-4a-coarse-cusp-regularity); [`R13.4a/projective-scalar-coarse-quotient`](#r13-4a-projective-scalar-coarse-quotient); [`R13.3/gamma-zero-prime-power-cusp-rings`](#r13-3-gamma-zero-prime-power-cusp-rings); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence); [`R14.1/diamond-operators`](#r14-1-diamond-operators); [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution); [`R14.1/exact-divisor-atkin-lehner`](#r14-1-exact-divisor-atkin-lehner); [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences); [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level); [`R13.4a/proper-rigidifying-covers`](#r13-4a-proper-rigidifying-covers)

**Acceptance checks.**

- A cusp width is the valuation of q in a local smoothing parameter, not the number of components of the coarse j-fibre.
- The prime Γ₀(N) widths 1 and N and the characteristic-2/3 table are imported.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.5, pp.16–18; Theorems 4.3.6–4.3.7, pp.40–42. Tate families with Drinfeld level yield completed boundary charts and explicit stack covers.
- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.2, Proposition 1.2.2.1 and Theorem 1.2.3.1, pp.36–38. Normalization of the Tate generic Γ₀ cover computes integral cusp charts, including level-dividing primes.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-3-gamma-one-integral-boundary"></a>

### Integral Γ₁ cusp strata

**Theorem** · `ModularCurvesPartII:R13.3/gamma-one-integral-boundary` · planet: *Integral cusp strata*

For d|N let B_d be the d-gon boundary stratum of the Γ₁(N) stack. It is reduced, regular, proper, quasi-finite and flat of relative dimension zero over ℤ. If d>2, it is a disjoint union of φ(d)/2 copies of Spec ℤ[ζ_(N/d)], indexed by b∈(ℤ/d)×/{±1}. Its geometric generic degree is φ(d)φ(N/d)/2. A primitive root ζ_(N/d)^r, r a unit modulo N/d, labels a geometric embedding within that cyclotomic component, not an additional component indexed by a positive divisor of d. This corrects the author PDF’s component indexing in Theorem 4.3.4. If d≤2, the stratum is nowhere a scheme for (N,d)=(1,1),(2,1),(2,2),(4,2). In the remaining partial schematic cases N=pˢ or 2pˢ the required inversion is δ=p; in other cases δ=1. The canonical degree-two cover by Spec ℤ[ζ_(N/d)] remains finite flat without that inversion; on the schematic locus over ℤ[1/δ] it is Spec(ℤ[ζ_(N/d)]⁺[1/δ]). The same covers extend to every infinitesimal boundary neighbourhood. Do not erase the residual inertia in a nowhere-schematic case.

**Proof plan.**

1. In characteristic zero write a point as (ζ_N^r,b), with b a unit modulo d and r a unit modulo N/d. The μ_d automorphisms change r by (N/d)b times an integer, leaving r modulo N/d; inversion sends (r,b) to (−r,−b). For d>2 it acts freely on b. Cyclotomic Galois action is transitive on r modulo N/d, so there is one cyclotomic component per b modulo sign. Normality and finite flatness extend this decomposition integrally.
2. Use the twisted Tate charts for existence and the completed moduli property for the full infinitesimal claim.
3. Descend the degree-two cover only on the stated schematic locus.

**Unit tests.**

- `TauCeti.ModularCurves.gammaOneBoundary_five` (computation): N=d=5 has two cyclotomic components, each Spec ℤ, and two geometric 5-gon cusps; no extra divisor label.
- `TauCeti.ModularCurves.gammaOneBoundary_four` (degenerate): N=d=4 has one 4-gon cusp, although the 2-gon boundary stratum is nowhere schematic.
- `TauCeti.ModularCurves.gammaOneBoundary_galois` (compatibility): For N=15,d=5 there are two copies of Spec ℤ[ζ₃], hence four geometric cusps; conjugation moves r within a component.
- `TauCeti.ModularCurves.gammaOneBoundary_overcount` (non-example): Independent b and positive-divisor r labels give eight components for N=d=5, contradicting the two isomorphism classes.

**Prerequisites.**

- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)

**Consumers in this roadmap.** [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels); [`R13.3/gamma-one-twisted-tate-chart`](#r13-3-gamma-one-twisted-tate-chart)

**Acceptance checks.**

- N=4,d=2 has a non-schematic boundary stratum; taking its real cyclotomic ring does not turn it into a fine moduli scheme.
- For d>2 each cyclotomic chart is a scheme even at primes dividing N.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 4.3.3, Theorems 4.3.4 and 4.3.7, pp.37–42. Use the schematic locus and degree-two covers with the exceptional small levels; correct the d>2 component indexing by the isomorphism calculation in the proof, rather than the overcount in the printed statement.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-3-gamma-one-twisted-tate-chart"></a>

### Twisted Tate charts for Γ₁

**Construction** · `ModularCurvesPartII:R13.3/gamma-one-twisted-tate-chart`

For d|N and a unit r modulo N/d, the unmarked regularized Tate curve over ℤ[ζ_(N/d)][[t]], t=q^(1/d), has generic parameter ζ_(N/d)^(−r)q and boundary ideal (t); over ℤ[ζ_N] it is Tate_d(ζ_N^(−r′)t), for any lift r′ modulo N. For a marked Γ₁ chart choose b a unit modulo d and a unit lift b′ modulo N. The point denoted q^(b/d) descends from Tate_d(ζ_N^(−r′(b′)⁻¹)t) to the regularized family with generic parameter ζ_(N/d)^(−r(b′)⁻¹)q. For d>2 this identifies the completion of the component indexed by b modulo sign. The unit r changes its cyclotomic embedding, not its component count; impose no purported unique positive-divisor lift of r. For d≤2 retain the finite flat degree-two formal cover; when N/d>2 it is étale only after inverting δ. For d=2, after inverting δ on the schematic locus, the invariant parameter is (1+ζ_(N/d)⁻¹)t, as in Theorem 4.3.7, rather than an unqualified parameter t on the real base.

**Proof plan.**

1. Twist the generic Tate parameter by the root of unity fixed by the cusp label.
2. Use Tateₙ uniqueness to descend the regularized generalized curve with its Γ₁ point.
3. Verify the involution on the d≤2 cover and descend the parameter only with the stated étaleness and schematic hypotheses.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.twistedTateChart` | constructor | The chart with b modulo sign, a chosen unit r and lift b′, its Γ₁ point, family and generic parameter; changes of lifts have specified descent comparisons. |
| `TauCeti.ModularCurves.twistedTateChart_degeneracy` | simp | The boundary ideal is generated by t. |
| `TauCeti.ModularCurves.twistedTateChart_cyclotomic` | compatibility | The unmarked twist is Tate_d(ζ_N^(−r′)t); for the descended Γ₁ point the exponent is −r′(b′)⁻¹. |
| `TauCeti.ModularCurves.twistedTateChart_formalModuli` | universal-property | For d>2 it represents the framed boundary deformation problem; for d≤2 keep the covering groupoid. |
| `TauCeti.ModularCurves.twistedTateChart_realDescent` | compatibility | The d=2 descent uses (1+ζ⁻¹)t with the conjugation action of Theorem 4.3.7. |

**Unit tests.**

- `TauCeti.ModularCurves.twistedTateChart_pole` (computation): j has pole order d in t because its generic parameter is a unit times tᵈ.
- `TauCeti.ModularCurves.twistedTateChart_integral` (characterisation): The special fibre is a d-gon and its degeneracy divisor is t=0.
- `TauCeti.ModularCurves.twistedTateChart_nowhereScheme` (non-example): For (N,d)=(4,2), the finite flat chart is a cover of a stack and not its coarse universal family.

**Uses.**

- R13.4b: Computes cusp fields and their Galois descent.
- R14.1: Checks compactified Hecke maps on explicit charts.

**Prerequisites.**

- [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon) (Generalized Tate n-gons)
- [`R13.3/gamma-one-integral-boundary`](#r13-3-gamma-one-integral-boundary) (Integral Γ₁ cusp strata)

**Consumers in this roadmap.** [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison)

**Acceptance checks.**

- The chart is over the ring of integers, not just a cyclotomic field; the divisor t=0 survives in characteristic dividing N.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorems 4.3.6–4.3.7, pp.40–42. Twists, cyclotomic base changes, formal moduli property and the conjugation-invariant parameter are explicit.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-3-boundary-carriers-and-hodge-evaluation"></a>

### Boundary carriers and Hodge evaluation

**Theorem** · `ModularCurvesPartII:R13.3/boundary-carriers-and-hodge-evaluation` · planet: *Tate differential*

On each stated integral stack chart the boundary is an effective relative Cartier divisor cut out by its smoothing parameter, and ω=e\*Ω¹ of the smooth locus agrees with the pushforward of the relative dualizing line. It is trivialized on Tate charts by du/u, invariant under contraction. A weight-k section evaluates as a formal series times (du/u)^k, equivariantly for chart stabilizers; restriction of global sections is injective whenever the chosen union of formal boundary charts meets every irreducible component and the sheaf has the required torsion-free/density property. This is the formal comparison supporting the q-expansion principle; one-cusp integral descent is a separate R15 input. Distinguish the Cartier boundary, its reduced boundary locus and the finite-flat scheme j⁻¹(∞), whose ramification multiplicities are cusp widths. For general Γ₀ integral coarse spaces use the Cartier and regular-cusp theorem below; finite flatness of a reduced coarse cusp locus over ℤ is not inferred.

**Proof plan.**

1. Compare the generalized curve’s dualizing line to invariant differentials on its smooth locus and use contraction invariance.
2. Evaluate on the formal charts and retain the stabilizer linearization; injectivity follows from the supplied density/restriction theorem.
3. Read cusp fibre multiplicities from valuations of j⁻¹, keeping reduction and Cartier constructions separate.

**Prerequisites.**

- [`R13.3/gamma-one-twisted-tate-chart`](#r13-3-gamma-one-twisted-tate-chart) (Twisted Tate charts for Γ₁)
- [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny) (Power isogenies at the boundary)
- `SchemeAndStackFoundations:SF.2`

**Consumers in this roadmap.** [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement); [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing); [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent); [`R14.1/coherent-hecke-trace`](#r14-1-coherent-hecke-trace); [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure)

**Acceptance checks.**

- On Γ₀(5)/ℤ[1/5] the j-cusp fibre is [∞]+5[0], although the reduced boundary has two points; this is an imported Layer 10 check.
- In characteristic 2, the weight-k Hodge action of [−1] must be tracked as a group-scheme linearization, not removed by the equality of coarse maps.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–43; §4.5 Example 4.5.3, p.48. The Hodge line and contraction comparison give the Tate differential and evaluation formula.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Theorem 5.13, pp.60–62; Theorem 6.7, pp.64–65. The refined boundary is a relative Cartier divisor, and the coarse cusp locus is regular even at 2 and 3.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-3-gamma-zero-prime-power-cusp-rings"></a>

### Prime-power Γ₀ cusp rings

**Theorem** · `ModularCurvesPartII:R13.3/gamma-zero-prime-power-cusp-rings` · planet: *Prime-power cusp rings*

For every prime p and n≥1, the normalized Tate Γ₀(pⁿ) cover of ℤ[[q]] is the disjoint union of ℤ[[q]], ℤ[[s]] with q=s^(pⁿ), and, for a+b=n with a,b>0, the following rings: if a≥b, ℤ[ζ_(pᵇ)][[q]]; if b>a, ℤ[ζ_(pᵃ)][[q]][z]/(z^(p^(b−a))−ζ_(pᵃ)q). These are q-adically complete finite rings, each regular. The generic mixed component comes from the cyclotomic condition Φ_p(z^(p^(b−1))/q^(p^(a−1)))=0 before normalization. For Γ₀(pⁿM), p∤M, factor the generic level cover, tensor with the prime-to-p cusp cover and normalize; the tensor product before normalization need not be normal. This is a composite/bad-level extension; prime-level rings after inverting p remain Layer 10’s.

**Proof plan.**

1. Split the generic cyclic Tate subgroup cover by a+b=n.
2. For a≥b divide the coordinate by the appropriate q power, giving a primitive pᵇ root; for b>a adjoin z with the displayed relation.
3. Check regularity in these parameters and compare with the integral closure; normalize the prime-to-p tensor product.

**Prerequisites.**

- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- [`R13.4a/coarse-cusp-regularity`](#r13-4a-coarse-cusp-regularity) (Regularity at integral Γ₀ cusps) *(later layer R13.4a)*

**Consumers in this roadmap.** [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs)

**Acceptance checks.**

- n=2 gives two outer charts and ℤ[ζ_p][[q]]; their j-degrees sum to 1+p²+(p−1)=p²+p.
- p=2,n=3,(a,b)=(1,2) gives z²=−q, a regular formal cusp chart at 2 despite its ramification.

**Sources.**

- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.2.2, Proposition 1.2.2.1, p.37; §1.2.3, p.38. The normalized rings are explicit, with a≥b in the cyclotomic-power-series case, and the prime-to-p product requires normalization.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4"></a>

## R13.4. Integral coarse spaces and comparison with ModularCurves

R13.4 is the combined interface of R13.4a (the algebraic coarse construction) and R13.4b (the generic-fibre and correspondence comparison). It introduces no curve, definition, theorem, API or planet of its own, and a consumer cites the R13.4a or R13.4b target it uses rather than this layer. R12.3 in particular consumes R13.4a/integral-coarse-curves and R13.4a/coarse-normalization-comparisons and does not wait for the rest of R13.4: requiring all of R13.4 before R12.3 would reverse the construction order, since R13.4b uses R12.3 and R12.6.

The interface consists of the following targets.

| Target | Role in the interface |
| --- | --- |
| [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) | The compactified coarse curve X_H and its j-map |
| [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons) | Identification of the elliptic open and of ModularCurves Layer 10's compactification |
| [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change) | The permitted changes of base |
| [`R13.4a/coarse-cusp-regularity`](#r13-4a-coarse-cusp-regularity) | Regularity of the integral Γ₀ boundary |
| [`R13.4a/modular-polynomial`](#r13-4a-modular-polynomial) | The cyclic modular polynomial, with its own degree convention |
| [`R13.4a/projective-scalar-coarse-quotient`](#r13-4a-projective-scalar-coarse-quotient) | The scalar-framed quotient and its determinant-square-class components |
| [`R13.4a/split-cartan-quotient`](#r13-4a-split-cartan-quotient) | The generic-fibre Fricke and normalizer comparison |
| [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison) | Generic components and cusp fields |
| [`R13.4b/compactified-map-comparison`](#r13-4b-compactified-map-comparison) | Degeneracy maps and the boundary differential |
| [`R13.4b/hecke-normalization-comparison`](#r13-4b-hecke-normalization-comparison) | Agreement of the geometric and analytic Hecke actions |

The other targets of R13.4a refine these: the level stacks 𝒳_H, the local structure, degrees and cusps of X_H, its cyclotomic structure, and the Cartan, twisted and Atkin–Lehner curves.

**The upstream boundary.** ModularCurves 9D owns the affine coarse moduli construction, and its Layer 10 compactification covers prime N≥5, diamond subgroups of (ℤ/N)ˣ/{±1} and the base ℤ[1/N]. R13.4a identifies its curves with those on exactly that range. Mathlib's relative normalization and its universal property for a quasi-compact quasi-separated morphism supply neither modular finiteness nor smoothness. To recognize a compactification, the candidate must be finite over the projective j-line and normal, and must contain the common affine level curve as a schematically dense open that meets every component. Properness and agreement on a chosen open are not enough: adjoining a disjoint projective component over j=∞ gives a proper normal candidate with the same open.

**Checks on the combined interface.** These test the contracts of the targets above.

- *Level problem and components.* H is open and contains a principal level; level one is H=GL₂(Ẑ), giving the projective j-line. Honest full level 5 over ℂ has four determinant components, and fixing a primitive Weil-pairing value selects one. The construction keeps the whole generic level algebra of its moduli problem, and the comparison uses the same components (Česnavičius §6.1, p.62; Lemma 6.2 and Proposition 6.3, p.63).
- *Change of base.* For Γ(n)⊂H the coarse curve is smooth over ℤ[1/n], and coarse formation commutes with arbitrary base change over ℤ[1/gcd(6,n)] (Česnavičius Proposition 6.4, pp.63–64, and Remark 6.6, p.64). Level 5 therefore allows every base over ℤ, while the general level-4 statement inverts 2; Γ₁(4) in characteristic 2 obstructs an unrestricted claim. Coarse formation and relative normalization have separate base-change theorems: the normalization of Spec k[t] in D(t) is Spec k[t], whose fibre at t=0 is Spec k, while the normalization over Spec k of the empty fibre of D(t) is empty.
- *Boundary and stack data.* Česnavičius Theorem 6.7, pp.64–65, gives regularity of every integral Γ₀(N) cusp, including in characteristics 2 and 3, but leaves the bad-prime points with j=0 or 1728 outside its regular open; it does not make a level-dividing fibre smooth. Proposition 6.9, p.65, identifies the naive and refined Γ₀ coarse curves without identifying their stacks. At the upstream boundary keep the scheme-theoretic fibre over j=∞: for X₀(N), N≥5 prime, over ℤ[1/N] it is the divisor [∞]+N[0] of rank N+1, not its two-section reduced support.
- *Maps and trace.* The late comparison compares the two algebraic degeneracy maps on completed cusp rings and on the invariant differential. Conrad Theorem 4.4.3, pp.43–46, constructs finite flat stack maps and the extended isogeny map on invariant differentials; passing to coarse maps gives no finite-flat descent by itself, which is why R13.4b/compactified-map-comparison uses the finite-correspondence and stabilizer-descent targets of AlgebraicModuliForArithmeticGeometry R09.5. The coherent pullback, isogeny differential and trace compose to pT_p (Conrad (4.5.1), p.46), and the local divisibility is Theorem 4.5.1, pp.46–47. For p∤N, weight two and n≥1 the normalized coefficient is a_{np}(f)+p·a_{n/p}(⟨p⟩f), the second term being zero when p∤n; the unnormalized trace has an extra factor p.
- *Constant terms.* For general (not necessarily cuspidal) forms the sums of Conrad Example 4.5.3, p.48, start at n=0: for p∤N the constant term of T_p f is a₀(f)+p^{k−1}a₀(⟨p⟩f). At level one, E₄ reduced modulo 5 has q-expansion 1 and T₂E₄ has constant term 1+2³≡4 mod 5, whereas sums starting at n=1 would give 0. This is source correction E115 below.

<a id="r13-4a"></a>

## R13.4a. Algebraic coarse construction before analytic comparison

Construct the compactified coarse curve X_H of every open level H over ℤ by algebraic means: normalize the stack X(1) of generalized elliptic curves with irreducible fibres in the level-H cover of its elliptic locus, take the Keel–Mori coarse space, and compare with the j-line. Full level, fixed pairing, Γ₁ and refined Γ₀ are treated separately, with their bases and stabilizers. The layer proves properness, normality, finiteness over ℙ¹_j and the base-change statements that hold (and one that fails), describes the local rings, degrees, cusps and cyclotomic structure, identifies the elliptic open with the Katz–Mazur problems and coarse schemes of ModularCurves, and proves agreement with ModularCurves Layer 10's curves for the prime-level diamond quotients by a recognition criterion for normalizations. It then supplies the Cartan, twisted and Atkin–Lehner quotient curves and the rational-point criterion that other roadmaps use, and the proper rigidifying covers that make coherent cohomology finite.

No analytic uniformization, no connectedness statement and no input from R12.6 is used: geometric connectedness, genera of particular curves, and fields of definition read off from analytic data are R12.4, R12.6 and R13.4b. The targets below are ordered by their prerequisites: the level subgroups and the stack 𝒳_H come first, then the coarse curves, then the comparisons with ModularCurves, then the special levels. Two targets are general statements about schemes and stacks rather than modular ones (finite-normal-recognition and fibrewise-coarse-base-change); they are owned here because no lower roadmap states them.

<a id="r13-4a-level-subgroups"></a>

### Open level subgroups and the standard levels

**Definition** · `ModularCurvesPartII:R13.4a/level-subgroups`

An open level subgroup is an open subgroup H of GL₂(Ẑ). Its level is the least n≥1 with Γ(n)=ker(GL₂(Ẑ)→GL₂(ℤ/n)) contained in H; for any n with Γ(n)⊂H write H̄ for the image of H in GL₂(ℤ/n), so that H↦H̄ is a bijection between open subgroups containing Γ(n) and subgroups of GL₂(ℤ/n), and H̄ for a multiple m of n is the full preimage of H̄ for n. Matrices act on ordered bases on the right, (P,Q)·[[a,b],[c,d]]=(aP+cQ, bP+dQ), as in Tau Ceti ModularCurves Convention 5. The standard levels are the subgroups whose images are: Γ(N), the trivial group; Γ₁(N)={a≡1, c≡0 mod N}, the stabiliser of the first basis vector P; Γ₀(N)={c≡0 mod N}, the stabiliser of the line through P; the level Γ₁^μ(N)={c≡0, d≡1 mod N}, whose structures (P,Q)↦(⟨P⟩, Q mod ⟨P⟩) are the embeddings μ_N↪E[N] given by P′↦e_N(P′,Q); the mixed levels Γ₁(N)∩Γ₀(M) for N|M; for a prime ℓ the split Cartan C_s(ℓ) of diagonal matrices and its normaliser C_s⁺(ℓ) (diagonal or antidiagonal); for an odd prime ℓ and a fixed nonsquare ε∈𝔽_ℓ^× the nonsplit Cartan C_ns(ℓ)={[[a,εb],[b,a]] : (a,b)≠(0,0)}, the image of 𝔽\_{ℓ²}^× acting on 𝔽\_{ℓ²}=𝔽_ℓ⊕𝔽_ℓ√ε, and its normaliser C_ns⁺(ℓ); C_ns(2) is the cyclic subgroup of order 3 of GL₂(𝔽₂). The invariants of H are its index [GL₂(Ẑ):H]=[GL₂(ℤ/n):H̄], its projective index [GL₂(Ẑ):±H] where ±H is generated by H and −I, its determinant image det(H̄)⊂(ℤ/n)^×, and whether −I∈H. Conjugation by g∈GL₂(Ẑ) sends H to g⁻¹Hg and preserves all four invariants.

**Hypotheses and conventions.**

- n≥1 with Γ(n)⊂H; the nonsplit Cartan needs ℓ odd and ε a nonsquare, or ℓ=2.
- The right-action convention is fixed once; the left action on column vectors of Česnavičius and Zywina gives the same subgroups because g acts on the frame φ:(ℤ/n)²→E[n] by φ↦φ∘g.

**Proof plan.**

1. Define each standard level by entry conditions in GL₂(ℤ/n); closure under products and inverses follows from the 2×2 product and adjugate formulas.
2. Define C_s⁺(ℓ) and C_ns⁺(ℓ) as the normalisers in GL₂(𝔽_ℓ) of C_s(ℓ) and C_ns(ℓ); each Cartan has index 2 in its normaliser for ℓ odd.
3. Compute orders from |GL₂(𝔽_ℓ)|=(ℓ²−1)(ℓ²−ℓ): |Γ₀(ℓ)‾|=ℓ(ℓ−1)², |C_s(ℓ)|=(ℓ−1)², |C_ns(ℓ)|=ℓ²−1, and for general N the indices [GL₂:Γ₀(N)]=ψ(N)=N∏\_{p|N}(1+1/p) and [GL₂:Γ₁(N)]=φ(N)ψ(N).
4. The projective index is the index when −I∈H̄ and half the index otherwise; −I∉Γ₁(N)‾ and −I∉Γ(N)‾ for N≥3.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.levelGamma0` | constructor | The subgroup Γ₀(N)‾ of GL₂(ℤ/N) of matrices with lower-left entry 0. |
| `TauCeti.ModularCurves.levelGamma1` | constructor | The subgroup Γ₁(N)‾ of matrices with upper-left entry 1 and lower-left entry 0; it is the stabiliser of the first basis vector under the right action. |
| `TauCeti.ModularCurves.levelGamma1Mu` | constructor | The subgroup Γ₁^μ(N)‾={c=0, d=1}; its level structures are embeddings μ_N↪E[N], the convention of Calegari–Geraghty. |
| `TauCeti.ModularCurves.splitCartan` | constructor | The diagonal subgroup C_s(ℓ), and splitCartanNormalizer its normaliser. |
| `TauCeti.ModularCurves.nonsplitCartan` | constructor | For a nonsquare ε, the subgroup {[[a,εb],[b,a]]}, and nonsplitCartanNormalizer its normaliser. |
| `TauCeti.ModularCurves.projectiveIndex` | data | The index in GL₂(ℤ/n) of the subgroup ±H̄ generated by H̄ and −I; it is the coarse degree of X_H over the j-line. |
| `TauCeti.ModularCurves.projectiveIndex_eq_index` | characterisation | projectiveIndex H = index H when −I∈H̄, and 2·projectiveIndex H = index H otherwise. |
| `TauCeti.ModularCurves.levelDet` | data | The image det(H̄)⊂(ℤ/n)^×; its fixed field in ℚ(ζ_n) is the field of definition of the components of X_H. |
| `TauCeti.ModularCurves.levelPullback` | functoriality | For n\|m the preimage of H̄ under GL₂(ℤ/m)→GL₂(ℤ/n) has the same index, projective index and determinant image. |
| `TauCeti.ModularCurves.levelGamma0_comap` | compatibility | The preimage in SL(2,ℤ) of levelGamma0 N is Mathlib's CongruenceSubgroup.Gamma0 N, of levelGamma1 N is CongruenceSubgroup.Gamma1 N, and of the trivial group is CongruenceSubgroup.Gamma N. |
| `TauCeti.ModularCurves.levelConj` | functoriality | Conjugation H̄↦g⁻¹H̄g preserves index, projective index and determinant image. |

**Unit tests.**

- `TauCeti.ModularCurves.levelGamma0_projectiveIndex_prime` (computation): For a prime p, projectiveIndex (levelGamma0 p) = p+1.
- `TauCeti.ModularCurves.levelGamma1_five_index` (non-example): index (levelGamma1 5) = 24 but projectiveIndex (levelGamma1 5) = 12, because −I∉Γ₁(5)‾; a definition of the coarse degree as the plain index fails here.
- `TauCeti.ModularCurves.splitCartanNormalizer_thirteen` (computation): projectiveIndex (splitCartanNormalizer 13) = 91 and projectiveIndex (nonsplitCartanNormalizer 13 ε) = 78 for a nonsquare ε.
- `TauCeti.ModularCurves.level_one` (degenerate): For n=1 every subgroup is GL₂(ℤ/1), with index, projective index 1 and trivial determinant group.
- `TauCeti.ModularCurves.levelGamma1_comap` (compatibility): The preimage of levelGamma1 N in SL(2,ℤ) is CongruenceSubgroup.Gamma1 N, whose bottom row is ≡(0,1); the upper-left condition a≡1 is forced there by the determinant.

**Uses.**

- this layer, level-h-structures and deligne-rapoport-level-stack: the level of every moduli problem and stack in R13.4a is an open subgroup in this convention
- this layer, coarse-degree-and-cusp-divisor: the coarse degree over the j-line is the projective index
- Zywina 2015, Proposition 3.3: the rational-point criterion is stated for subgroups containing −I with surjective determinant
- EffectiveDiophantineMethods ED.6 and BDMTV 2019 §6: the Cartan normalisers C_s⁺(13), C_ns⁺(13) and the projective S₄ subgroup at 13 are levels in this sense
- Calegari–Geraghty 2018 §3.2: Γ_H(N)={c≡0, d mod N∈H} and the levels U₀(Q), U₁(Q) are open level subgroups

**Prerequisites.**

- `mathlib:Matrix.GeneralLinearGroup`
- `mathlib:Matrix.GeneralLinearGroup.det`
- `mathlib:Subgroup.index`
- `mathlib:Subgroup.normalizer`
- `mathlib:CongruenceSubgroup.Gamma0`
- `mathlib:CongruenceSubgroup.Gamma1`
- `mathlib:CongruenceSubgroup.Gamma`
- `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`

**Consumers in this roadmap.** [`R13.4a/level-h-structures`](#r13-4a-level-h-structures); [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor); [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves)

**Acceptance checks.**

- [GL₂(Ẑ):±Γ₀(ℓ)]=ℓ+1, [GL₂(Ẑ):±Γ₁(5)]=12, [GL₂(Ẑ):±C_s⁺(13)]=91, [GL₂(Ẑ):±C_ns⁺(13)]=78.
- det is surjective onto (ℤ/n)^× for Γ₀(N), Γ₁(N), C_s(ℓ), C_s⁺(ℓ), C_ns(ℓ) and C_ns⁺(ℓ), and trivial for Γ(N).

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), §4.1.2, p.28; §4.4, p.39. An open subgroup H of GL₂(Ẑ) is described by any n with Γ(n)⊂H and its image H̄ in GL₂(ℤ/n); Γ₁(n) is the subgroup a≡1, c≡0 mod n.
- [`zywina15`](https://arxiv.org/pdf/1508.07660), §3.2, p.15; §1, Notation, p.2 (Cartan subgroups). Modular curves X_G are attached to subgroups G of GL₂(ℤ/N) containing −I with surjective determinant, and the degree of the j-map is [GL₂(ℤ/N):G]; the split and nonsplit Cartan subgroups and their normalisers are fixed there.
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Conventions, item 5; §9B. Ordered bases are row vectors with the right action (P,Q)g=(aP+cQ,bP+dQ); the standard quotient problems of 9B are taken by kernel-of-reduction, upper-triangular, diagonal and diamond subgroups.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/LevelGroups`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-level-h-structures"></a>

### Level-H structures away from the level

**Definition** · `ModularCurvesPartII:R13.4a/level-h-structures`

Let H be an open level subgroup, n with Γ(n)⊂H, S a ℤ[1/n]-scheme and E/S an elliptic curve. The scheme Isom_S((ℤ/n)²_S, E[n]) of frames is a finite étale right GL₂(ℤ/n)-torsor over S, for the action φ↦φ∘g. A level-H structure on E is a section over S of the finite étale quotient Isom_S((ℤ/n)²_S, E[n])/H̄. Level-H structures on elliptic curves over ℤ[1/n]-schemes form a stack Y_H[1/n], and the forgetful map Y_H[1/n]→Ell\_{ℤ[1/n]} is representable, finite étale of degree [GL₂(ℤ/n):H̄]. For n|m reduction of frames modulo n identifies the stacks built from n and from m over ℤ[1/m]. An automorphism α of E fixes the structure φH̄ exactly when φ⁻¹∘α∘φ lies in H̄; in particular [−1] fixes every level-H structure if and only if −I∈H̄. Over ℤ[1/n] this stack is the stack over Ell of the Katz–Mazur quotient problem [Γ(n)]/H̄, which upstream 9A identifies with the fppf sheaf quotient of the naive full level problem.

**Hypotheses and conventions.**

- n is invertible on the base; H contains Γ(n).
- The quotient is the étale-sheaf quotient; an S-point need not lift to an S-frame.

**Proof plan.**

1. E[n] is finite étale of rank n² and étale locally isomorphic to (ℤ/n)² over ℤ[1/n]-schemes (upstream 3N), so the frame scheme is a finite étale GL₂(ℤ/n)-torsor (upstream 5B).
2. A finite étale torsor has a finite étale quotient by any subgroup, formed étale locally as a disjoint union of copies of the base, and its formation commutes with base change (upstream 0C, 0D).
3. For n|m the reduction map GL₂(ℤ/m)→GL₂(ℤ/n) is surjective with kernel inside the preimage of H̄, which gives the change-of-level isomorphism.
4. The automorphism criterion is the torsor identity α∘φ=φ∘(φ⁻¹αφ); for α=[−1] one has φ⁻¹αφ=−I.
5. Stackify over the elliptic moduli stack as in AlgebraicModuli R09.5 and compare with the Katz–Mazur quotient problem by upstream 9A.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.LevelStructure` | constructor | Level-H structures on E/S over a ℤ[1/n]-scheme: sections of Isom((ℤ/n)²,E[n])/H̄. |
| `TauCeti.ModularCurves.LevelStructure.ofFrame` | constructor | The class φH̄ of a frame φ:(ℤ/n)²≅E[n]. |
| `TauCeti.ModularCurves.LevelStructure.ofFrame_eq_iff` | extensionality | φH̄=ψH̄ if and only if φ⁻¹∘ψ∈H̄. |
| `TauCeti.ModularCurves.LevelStructure.baseChange` | functoriality | Pullback along S′→S, compatible with composition. |
| `TauCeti.ModularCurves.LevelStructure.changeLevel` | equivalence | For n\|m, reduction of frames gives a natural bijection between the structures built from m and from n. |
| `TauCeti.ModularCurves.LevelStructure.aut_fix_iff` | characterisation | An automorphism α of E fixes φH̄ iff φ⁻¹αφ∈H̄; [−1] fixes all level-H structures iff −I∈H̄. |
| `TauCeti.ModularCurves.levelOpenStack_forget_finiteEtale` | structure | Y_H[1/n]→Ell\_{ℤ[1/n]} is representable finite étale of degree [GL₂(ℤ/n):H̄]. |
| `TauCeti.ModularCurves.LevelStructure.conj` | functoriality | φH̄↦(φ∘g)(g⁻¹H̄g) identifies level-H and level-g⁻¹Hg structures. |
| `TauCeti.ModularCurves.LevelStructure.toKatzMazur` | compatibility | Over ℤ[1/n] the stack is that of the Katz–Mazur quotient problem [Γ(n)]/H̄ of upstream 9A. |

**Unit tests.**

- `TauCeti.ModularCurves.LevelStructure.full_group` (degenerate): For H̄=GL₂(ℤ/n) every elliptic curve over a ℤ[1/n]-scheme has exactly one level-H structure.
- `TauCeti.ModularCurves.LevelStructure.gamma1_point` (computation): For H=Γ₁(N) the map φH̄↦φ(e₁) identifies level-H structures with points of exact order N, and for H=Γ₀(N) with cyclic subgroups of order N.
- `TauCeti.ModularCurves.LevelStructure.not_frame` (non-example): For a prime p≥3, an elliptic curve over ℚ with a ℚ-rational subgroup of order p has a ℚ-rational Γ₀(p)-structure but no ℚ-rational frame of E[p], since the Weil pairing of a rational frame would be a rational primitive p-th root of unity: the quotient is a sheaf quotient, not the set of orbits of S-frames.
- `TauCeti.ModularCurves.LevelStructure.minusOne_gamma1` (characterisation): For N≥3, [−1] moves every Γ₁(N)-structure, and fixes every Γ₀(N)-structure.

**Uses.**

- this layer, deligne-rapoport-level-stack: the stack is normalised over X(1) along this finite étale open
- this layer, coarse-rational-points: K-points of Y_H over j≠0,1728 are read through Galois-stable classes of frames
- this layer, standard-level-stack-identifications: the elliptic opens of R13.2's stacks are these stacks after inverting the level

**Prerequisites.**

- [`R13.4a/level-subgroups`](#r13-4a-level-subgroups) (Open level subgroups and the standard levels)
- `tauceti:TauCetiRoadmap/ModularCurves#3n-naive-level-structures`
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`
- `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`
- `tauceti:TauCetiRoadmap/ModularCurves#9a-katzmazur-quotient-problems`
- `AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery`
- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions)
- `SchemeAndStackFoundations:SF.1/stack-in-groupoids`

**Consumers in this roadmap.** [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack); [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure); [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor); [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure); [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification); [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients); [`R13.4a/coarse-rational-points`](#r13-4a-coarse-rational-points); [`R13.4a/proper-rigidifying-covers`](#r13-4a-proper-rigidifying-covers)

**Acceptance checks.**

- H=GL₂(Ẑ) gives one level structure on every curve; H=Γ(n) gives the frames themselves; H=Γ₀(p) over ℤ[1/p] gives étale-locally the p+1 subgroups of order p.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), §4.1.2, p.28. For Γ(n)⊂H the stack Y_H[1/n] parametrises elliptic curves over ℤ[1/n]-schemes with a section of the finite étale scheme H̄\\Isom(E[n],(ℤ/n)²), finite étale over Y(1)[1/n].
- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 6.3(a), p.63. The Katz–Mazur quotient problem [Γ(n)]/H̄ is identified with this stack over ℤ[1/n] by Katz–Mazur 7.1.3(2).
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9A, items 1–3 and the final paragraph. After inverting n the Katz–Mazur full-level quotient problem is the fppf sheaf quotient of the naive ordered-basis problem, distinct from the orbit presheaf and from the coarse quotient.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/LevelStack`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-finite-normal-recognition"></a>

### Recognising a relative normalization

**Theorem** · `ModularCurvesPartII:R13.4a/finite-normal-recognition`

Let f:Y→J be a quasi-compact quasi-separated morphism of schemes, g:T→J an integral morphism and u:Y→T an open immersion with f=g∘u. Assume T is locally noetherian and normal (every local ring is an integrally closed domain) and that u(Y) is dense in T. Then the morphism normalizationDesc:Norm_J(Y)→T given by the universal property of the relative normalization is an isomorphism. Density and normality are needed: adjoining to T a disjoint copy of J keeps T integral over J and receiving Y but breaks density; a non-normal T (a cuspidal or nodal curve) receives a finite birational map from the normalization which is not an isomorphism. The criterion is not a base-change statement: for the qcqs open immersion D(t)⊂Spec k[t] the normalization of Spec k[t] in D(t) is Spec k[t], but after the base change t=0 the source is empty, so normalization does not commute with this base change. The same statement holds for representable morphisms of Deligne–Mumford stacks, checked on an étale atlas.

**Hypotheses and conventions.**

- f quasi-compact and quasi-separated; g integral; u an open immersion with dense image.
- T locally noetherian with integrally closed local domains.

**Proof plan.**

1. Work over an affine open Spec A⊂J; then T is Spec C with C integral over A, Y∩Spec C=V is a dense open, and Norm is Spec A′ with A′ the integral closure of A in Γ(V,O) (Stacks 035I, 035K).
2. Since T is reduced and V dense, restriction C→Γ(V,O) is injective, and C lands in A′ because C is integral over A.
3. C is a finite product of normal domains C_i and Γ(V,O) embeds in the product of their fraction fields because V meets every component; an element of Γ(V,O) integral over A is integral over C, hence lies in C. So A′=C (Stacks 035L, 03GP).
4. The map normalizationDesc is the gluing of these identifications, hence an isomorphism; for stacks apply this to an étale atlas, using that normalization commutes with étale base change (Stacks 03GV).

**Prerequisites.**

- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`
- `mathlib:AlgebraicGeometry.IsIntegralHom`
- `mathlib:AlgebraicGeometry.IsOpenImmersion`
- `mathlib:IsIntegrallyClosed`

**Consumers in this roadmap.** [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack); [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications); [`R13.4a/twisted-coarse-curve`](#r13-4a-twisted-coarse-curve); [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification); [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement); [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves); [`R13.4a/atkin-lehner-quotient-curves`](#r13-4a-atkin-lehner-quotient-curves)

**Acceptance checks.**

- Applied with T=X(1), Y=Ell over ℤ[1/n] it gives levelStack GL₂(Ẑ)=X(1).
- Applied to Tau Ceti ModularCurves Layer 10's X_H it is the agreement prime-diamond-agreement.

**Sources.**

- [`stacks`](https://stacks.math.columbia.edu), Tags 035I, 035K, 035L, 03GP, 03GV, 0AXP. The universal property and localization of relative normalization (035I, 035K); the normalization in a normal source is a disjoint union of integral normal schemes (035L); normalization in an integral morphism is the source (03GP); compatibility with smooth base change (03GV); generic points of the normalization come from those of the source (0AXP).
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Layer 10, item 1. The literal universal property of normalization does not characterise X_H up to isomorphism; an isomorphism characterisation needs T finite and normal, an open immersion with schematically dense image, and every irreducible component of T meeting Y_H; normalization does not commute with the base change t=0 for D(t)⊂Spec k[t].

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-deligne-rapoport-level-stack"></a>

### The Deligne–Rapoport level-H stack

**Construction** · `ModularCurvesPartII:R13.4a/deligne-rapoport-level-stack` · planet: *Deligne–Rapoport level stack*

Let X(1)=Ell₁ be the proper smooth Deligne–Mumford stack over ℤ of generalized elliptic curves with irreducible geometric fibres (R13.1). For an open level subgroup H and n with Γ(n)⊂H, define 𝒳_H as the normalization of X(1) in the representable, quasi-compact and separated composite Y_H[1/n]→Ell\_{ℤ[1/n]}⊂X(1). It carries a representable finite morphism 𝒳_H→X(1), the open substack Y_H:=𝒳_H×\_{X(1)}Ell, whose restriction to ℤ[1/n] is Y_H[1/n], and the closed substack 𝒳_H^∞ over the boundary X(1)^∞. Up to unique isomorphism over X(1) it does not depend on n. For H′⊂H the map of level structures extends uniquely to a finite morphism 𝒳\_{H′}→𝒳_H over X(1), compatibly with composition, and g∈GL₂(Ẑ) gives an isomorphism 𝒳_H≅𝒳\_{g⁻¹Hg} over X(1). The universal property: for every representable integral 𝒯→X(1) and every factorisation of Y_H[1/n]→X(1) through 𝒯 there is a unique morphism 𝒳_H→𝒯 over X(1) extending it.

**Hypotheses and conventions.**

- H open, n with Γ(n)⊂H.
- Normalization is relative normalization of a Deligne–Mumford stack in a quasi-compact separated representable morphism, formed on an étale atlas and descended.

**Proof plan.**

1. Let 𝒜 be the integral closure of 𝒪\_{X(1)} in the pushforward of 𝒪 along Y_H[1/n]→X(1). Its sections on an étale scheme chart U→X(1) are those of the relative normalization of U in U×\_{X(1)}Y_H[1/n], and relative normalization commutes with étale (indeed smooth) base change (Stacks 03GV; Mathlib normalizationPullback is an isomorphism for smooth base change), so 𝒜 is a quasi-coherent 𝒪\_{X(1)}-algebra (SchemeAndStackFoundations SF.1 stack-quasi-coherent) and 𝒳_H is its relative spectrum, the chart normalizations descending along the étale atlas (SF.1 affine-fpqc-descent). This is the relative form of the chart-and-descent method of AlgebraicModuli R09.5 dm-normalization, which treats the absolute normalization.
2. 𝒳_H→X(1) is finite because X(1) is of finite type over the excellent ring ℤ, so relative normalization is finite (AlgebraicModuli R09.5 dm-normalization-finite; SchemeAndStackFoundations SF.0 nagata-normalization-finite; Stacks 03GR).
3. Independence of n: for n|m the normalizations along Y_H[1/n] and along its open part Y_H[1/m] agree, because a function on Y_H[1/m] integral over X(1) is regular in codimension one on the normal stack Y_H[1/n] and hence regular (Česnavičius p.28, citing Deligne–Rapoport IV.3.6).
4. Functoriality and the universal property are those of relative normalization (Stacks 035I, 035J; Mathlib normalizationDesc and normalization.hom_ext on charts).
5. For H=GL₂(Ẑ) the stack is X(1) itself, by the recognition criterion finite-normal-recognition applied on charts.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.levelStack` | constructor | The stack 𝒳_H, for an open level subgroup H. |
| `TauCeti.ModularCurves.levelStack.toX1` | projection | The representable finite morphism 𝒳_H→X(1). |
| `TauCeti.ModularCurves.levelStack.ellipticOpen` | projection | The open substack Y_H=𝒳_H×\_{X(1)}Ell, equal to Y_H[1/n] over ℤ[1/n]. |
| `TauCeti.ModularCurves.levelStack.boundary` | projection | The closed substack 𝒳_H^∞ over the boundary of X(1). |
| `TauCeti.ModularCurves.levelStack.indepLevel` | equivalence | For n\|m the stacks built from n and from m are canonically isomorphic over X(1). |
| `TauCeti.ModularCurves.levelStack.map` | functoriality | For H′⊂H the finite morphism 𝒳\_{H′}→𝒳_H over X(1), with map_id and map_comp. |
| `TauCeti.ModularCurves.levelStack.conj` | functoriality | The isomorphism 𝒳_H≅𝒳\_{g⁻¹Hg} over X(1) for g∈GL₂(Ẑ), multiplicative in g. |
| `TauCeti.ModularCurves.levelStack.lift` | universal-property | Every representable integral 𝒯→X(1) through which Y_H[1/n] factors receives a unique morphism from 𝒳_H over X(1) restricting to the given one. |
| `TauCeti.ModularCurves.levelStack.lift_unique` | universal-property | Two morphisms 𝒳_H→𝒯 over X(1) agreeing on Y_H[1/n] are equal. |

**Unit tests.**

- `TauCeti.ModularCurves.levelStack_full_group` (degenerate): levelStack GL₂(Ẑ) is X(1), with toX1 the identity.
- `TauCeti.ModularCurves.levelStack_gamma0_prime_rank` (computation): levelStack (Γ₀ p)→X(1) is finite locally free of rank p+1, and levelStack (Γ N)→X(1) of rank |GL₂(ℤ/N)|.
- `TauCeti.ModularCurves.levelStack_not_naive` (non-example): For a prime p the naive Γ₀(p²) stack is not levelStack Γ₀(p²): on the standard p-gon over ℂ the μ_p of automorphisms preserving ⟨(ζ\_{p²},1)⟩ contract to the identity, so its map to X(1) is not representable.
- `TauCeti.ModularCurves.levelStack_gamma_compat` (compatibility): levelStack (Γ N) is R13.2's full-level stack Xfull(N) over ℤ (standard-level-stack-identifications).

**Uses.**

- this layer, level-stack-geometry and the coarse curve integral-coarse-curves: its Keel–Mori coarse space is the integral coarse curve X_H
- this layer, standard-level-stack-identifications: R13.2's moduli stacks are recognised as these normalizations
- AlgebraicModularFormsAndSerreWeights R15.1–R15.2: the Hodge bundle and modular forms of level H live on 𝒳_H, not on its coarse space
- R13.5 and R14.1: bad fibres and Hecke correspondences are studied on these stacks and their coarse spaces
- Calegari–Geraghty 2018 §3.9: the curves X_W with auxiliary level are these stacks or their coarse spaces

**Prerequisites.**

- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions)
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization`
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite`
- `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`
- `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationPullback`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc`
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`
- `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`

**Consumers in this roadmap.** [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves); [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications); [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure); [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification); [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps); [`R13.4a/coarse-base-change-failure`](#r13-4a-coarse-base-change-failure); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves); [`R13.4a/proper-rigidifying-covers`](#r13-4a-proper-rigidifying-covers)

**Acceptance checks.**

- 𝒳\_{GL₂(Ẑ)}=X(1).
- 𝒳\_{Γ₀(p)}→X(1) has rank p+1 and 𝒳\_{Γ(N)}→X(1) has rank |GL₂(ℤ/N)| (level-stack-geometry).

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), §4.1.2, p.28. Following Deligne–Rapoport IV.3.3, 𝒳_H is the Deligne–Mumford X(1)-stack obtained by normalizing X(1) along the finite étale Y_H[1/n]→Y(1)[1/n]; different n give canonically isomorphic stacks (DR IV.3.6), and H′⊂H gives a finite X(1)-morphism.
- [`ces17`](https://arxiv.org/pdf/1511.07475), §1.1–1.2, pp.2–3. 𝒳₀(n) was defined by Deligne–Rapoport by normalization and has no a priori moduli interpretation; the naive Γ₀(p²) stack is not isomorphic to it over X(1).
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §1.1, p.1. Normalization of the Deligne–Rapoport stacks over Z[1/N] over the proper smooth stack M₁ gives proper normal flat stacks over Z, without a moduli interpretation in bad characteristic.
- [`stacks`](https://stacks.math.columbia.edu), Tags 035I, 035J, 03GV, 03GR. Relative normalization has the integral-factorisation universal property, is functorial, commutes with smooth base change, and is finite over a Nagata base for a finite type source.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/LevelStack`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-standard-level-stack-identifications"></a>

### The standard levels: moduli stacks as normalizations

**Comparison** · `ModularCurvesPartII:R13.4a/standard-level-stack-identifications`

Over ℤ, compatibly with the maps to X(1) and with the elliptic opens: (i) R13.2's stack Xfull(N) of generalized elliptic curves whose degenerate fibres are N-gons with a Drinfeld (ℤ/N)²-structure on E^sm[N] is 𝒳\_{Γ(N)}; (ii) R13.2's stack X₁(N) of ample Drinfeld ℤ/N-structures, with the contraction to X(1), is 𝒳\_{Γ₁(N)}; (iii) R13.2's refined Γ₀(N) stack is 𝒳\_{Γ₀(N)}. In each case the moduli stack is regular, finite and flat over X(1) through the contraction, and its elliptic locus over ℤ[1/N] is Y_H[1/N]. Consequently 𝒳\_{Γ(N)}, 𝒳\_{Γ₁(N)} and 𝒳\_{Γ₀(N)} are regular. The naive Γ₀(N) stack agrees with 𝒳\_{Γ₀(N)} on the elliptic locus and, for squarefree N, everywhere; for N not squarefree the two stacks differ even over ℂ, although their coarse spaces agree (coarse-cusp-regularity). 𝒳\_{Γ(N)} is a projective scheme over ℤ for N≥2 unless N=p^s or N=2p^s (s≥1); 𝒳\_{Γ(1)}=X(1) is not a scheme (source issue ModularCurvesPartII/E113).

**Hypotheses and conventions.**

- N≥1.
- The R13.2 stacks carry the regularity, finiteness over X(1) and Cartier boundary established in R13.2.

**Proof plan.**

1. Each R13.2 stack is regular, hence normal, and its contraction to X(1) is representable, finite and flat (R13.2 contraction-maps-between-levels and moduli-stacks-are-proper-flat-artin).
2. Its elliptic locus over ℤ[1/N] has the moduli interpretation of Y_H[1/N] (R13.2 agreement-with-katz-mazur-schemes; upstream 3D), and its boundary is a relative effective Cartier divisor, so the elliptic locus is dense and meets every component.
3. The recognition criterion (finite-normal-recognition, applied on an étale atlas of X(1)) identifies it with the normalization 𝒳_H.
4. The naive comparison and the scheme property are R13.2 refined-gamma-zero-moduli and small-level-and-dm-boundaries.

**Prerequisites.**

- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack)
- [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes) (Agreement on the ordinary and tame loci)
- [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels) (Compactified level maps and their degrees)
- [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries) (Fine loci and bad-level inertia)
- `tauceti:TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures`

**Consumers in this roadmap.** [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves); [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level); [`R13.4a/fixed-pairing-coarse-curve`](#r13-4a-fixed-pairing-coarse-curve); [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification); [`R13.4a/proper-rigidifying-covers`](#r13-4a-proper-rigidifying-covers)

**Acceptance checks.**

- For N=p², the naive and refined Γ₀ stacks are different over ℂ while having the same coarse curve X₀(p²).
- 𝒳\_{Γ(3)}, 𝒳\_{Γ(4)} and 𝒳\_{Γ(6)} are not schemes over ℤ (N=p^s or 2p^s), while 𝒳\_{Γ(12)} and 𝒳\_{Γ(15)} are projective schemes (N=n₁n₂ with coprime n₁,n₂≥3).

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Theorem 4.3.5 and Proposition 4.3.6, p.39. X(n) is regular and identified with 𝒳\_{Γ(n)} as the normalization of X(1) in Y(n)[1/n]; it is a projective scheme unless n=p^s or 2p^s, to which n=1 must be added (E113).
- [`ces17`](https://arxiv.org/pdf/1511.07475), Theorem 4.4.4, pp.40–41. h:X(n)→X₁(n) and the contraction X₁(n)→X(1) are representable finite locally free; X₁(n) is regular and identified with 𝒳\_{Γ₁(n)}.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Theorem 5.13(a), p.60. The refined X₀(n) is Deligne–Mumford and regular, and X₀(n) and 𝒳\_{Γ₀(n)} are the normalizations of X(1) in Y₀(n)[1/n].
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1, p.31; Remark 4.2.2, p.36. The contraction of M\_{Γ(N)} to M₁ is finite flat, the boundary is a relative effective Cartier divisor and the stacks are regular; for large N the Katz–Mazur schemes coincide with these stacks.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/LevelStack`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-integral-coarse-curves"></a>

### Integral coarse modular curves

**Construction** · `ModularCurvesPartII:R13.4a/integral-coarse-curves` · planet: *Integral coarse curve* · also realises R13.4

For an open H≤GL₂(Ẑ) containing Γ(n), take the finite-inertia coarse space X_H of the corresponding compactified level stack 𝒳_H (R13.4a/deligne-rapoport-level-stack; for the full, Γ₁ and refined Γ₀ levels it is R13.2's moduli stack, by R13.4a/standard-level-stack-identifications). It is a projective normal ℤ-scheme, finite locally free over ℙ¹_j and flat of relative dimension one. The construction is algebraic: normalize the j-line in the generic level algebra and compare the stack coarse space to this normalization. Full level has its determinant/cyclotomic constant algebra, fixed-pairing level is over the corresponding cyclotomic integer base, Γ₁ is the marked-generator problem, and Γ₀ uses the refined cyclic-subgroup stack. Keep disconnected full-level generic components in the normalization algebra. No analytic connectedness or R12.6 is used.

**Proof plan.**

1. Apply finite-inertia coarse existence to the actual level stack; descend the finite j-map through the categorical universal property.
2. Compare on the dense generic level locus with integral closure in its full generic algebra.
3. Normality, projectivity and Cohen–Macaulayness in dimension two yield the finite locally free j-map, as in §6.1.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.integralCoarseCurve` | constructor | X_H with coarse map, j-map and dense elliptic open. |
| `TauCeti.ModularCurves.integralCoarseCurve_universal` | universal-property | Any map of the level stack to an algebraic space factors uniquely through X_H. |
| `TauCeti.ModularCurves.integralCoarseCurve_normal` | structure | X_H is normal and projective over ℤ. |
| `TauCeti.ModularCurves.integralCoarseCurve_j` | projection | The j-map is finite locally free; the full-level generic algebra retains every determinant component. |
| `TauCeti.ModularCurves.integralCoarseCurve_levelMap` | functoriality | Maps of the specified level stacks induce coarse maps by categorical universality; composing level maps composes the induced maps. |

**Unit tests.**

- `TauCeti.ModularCurves.integralCoarseCurve_levelOne` (degenerate): X(1)=ℙ¹_ℤ with its j coordinate.
- `TauCeti.ModularCurves.integralCoarseCurve_fullFive` (computation): Over ℂ honest full level 5 has four determinant components; fixed pairing has one.
- `TauCeti.ModularCurves.integralCoarseCurve_noUniversalFamily` (non-example): The universal elliptic curve does not descend to X(1) merely because a coarse space exists.

**Uses.**

- R12.3: Supplies algebraic curves before proving analytic uniformization.
- R13.5: Supplies the single integral object whose bad fibres are studied.

**Prerequisites.**

- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications) (The standard levels: moduli stacks as normalizations)
- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack)
- `SchemeAndStackFoundations:SF.1/keel-mori`
- `AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/arithmetic-normalization`

**Consumers in this roadmap.** [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization); [`R12.3/cusp-ramification-and-level-maps`](#r12-3-cusp-ramification-and-level-maps); [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels); [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials); [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action); [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing); [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent); [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent); [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility); [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons); [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change); [`R13.4a/coarse-cusp-regularity`](#r13-4a-coarse-cusp-regularity); [`R13.4a/modular-polynomial`](#r13-4a-modular-polynomial); [`R13.4a/projective-scalar-coarse-quotient`](#r13-4a-projective-scalar-coarse-quotient); [`R13.4a/split-cartan-quotient`](#r13-4a-split-cartan-quotient); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison); [`R13.5/igusa-components`](#r13-5-igusa-components); [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model); [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence); [`R14.1/diamond-operators`](#r14-1-diamond-operators); [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution); [`R14.1/exact-divisor-atkin-lehner`](#r14-1-exact-divisor-atkin-lehner); [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality); [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor); [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure); [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement); [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps); [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves); [`R13.4a/atkin-lehner-quotient-curves`](#r13-4a-atkin-lehner-quotient-curves)

**Acceptance checks.**

- For H=GL₂(Ẑ) (level 1) the result is ℙ¹_j over ℤ.
- A fixed Weil pairing changes the base; forgetting it is not a geometrically connected full-level curve over ℚ.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), §6.1–6.3, pp.62–63. Coarse curves are normal projective and finite locally free over the j-line; their quotient and KM descriptions agree.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-fibrewise-coarse-base-change"></a>

### Coarse base change from the fibres over 𝔽_p

**Theorem** · `ModularCurvesPartII:R13.4a/fibrewise-coarse-base-change`

Let 𝒳 be a separated, flat Deligne–Mumford stack locally of finite type over ℤ with coarse space f:𝒳→X. If for every prime p the base change f\_{𝔽_p}:𝒳\_{𝔽_p}→X\_{𝔽_p} is a coarse space of 𝒳\_{𝔽_p}, then for every scheme S the base change f_S:𝒳_S→X_S is a coarse space of 𝒳_S. Equivalently, coarse formation commutes with all base change as soon as it commutes with base change to the prime fields of positive characteristic; it always commutes with flat base change.

**Hypotheses and conventions.**

- 𝒳 separated, flat and locally of finite type over ℤ, Deligne–Mumford, so with finite inertia.

**Proof plan.**

1. Coarse formation commutes with flat base change on X and can be checked fppf locally on X_S (SchemeAndStackFoundations SF.1 keel-mori).
2. Étale locally on X, 𝒳=[Spec B/G] with G finite and X=Spec B^G (étale-local structure of separated Deligne–Mumford stacks over their coarse spaces, Abramovich–Vistoli Lemma 2.2.3, requested from SchemeAndStackFoundations SF.1; Conrad 2005 Theorem 3.1); the coarse space of 𝒳_R is Spec (B⊗R)^G, so one must show B^G⊗R→(B⊗R)^G is an isomorphism for every ring R.
3. ℤ-flatness makes B and B/B^G torsion-free, so the map is injective for every ℤ-module R.
4. Surjectivity: pass to finitely generated R by a filtered colimit, the case R=ℤ is trivial, and dévissage along 0→R′→R→R″→0 with the five lemma reduces to R=ℤ/p, which is the hypothesis.

**Prerequisites.**

- `SchemeAndStackFoundations:SF.1/keel-mori`
- `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`
- `SchemeAndStackFoundations:SF.1`

**Consumers in this roadmap.** [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line); [`R13.4a/coarse-base-change-failure`](#r13-4a-coarse-base-change-failure)

**Acceptance checks.**

- Applied to X(1) this gives compactified-coarse-j-line over every S; applied to 𝒳_H it reduces legal-coarse-base-change over ℤ[1/n] to the fibres 𝔽_p, p∤n.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Lemma 3.3.1 and proof, pp.23–24. For a separated flat locally finite type Deligne–Mumford stack over ℤ, coarse base change to every 𝔽_p implies coarse base change to every scheme, by the torsion-freeness and dévissage argument on rings of invariants.
- [`ces16cb`](https://arxiv.org/pdf/1608.01249), §1.1, p.1. The criterion is how coarse base change for X_H is established, and why failure must be exhibited over some 𝔽_p.
- [`av02`](https://arxiv.org/pdf/math/9908167), Lemma 2.2.3 and sketch of proof, pp.4–5 (arXiv v2). The étale-local presentation [U/Γ] of a separated Deligne–Mumford stack over its coarse space, which Česnavičius invokes in the proof of Lemma 3.3.1.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-compactified-coarse-j-line"></a>

### The compactified coarse j-line

**Theorem** · `ModularCurvesPartII:R13.4a/compactified-coarse-j-line`

The j-invariant extends to a morphism j:X(1)→ℙ¹_ℤ sending the boundary to ∞ (on generalized elliptic curves it is the ratio of the sections c₄³ and Δ of ω^{⊗12}, which have no common zero), and j is the coarse moduli space of X(1)=Ell₁. More generally, for every m≥1 the composite Ell_m→Ell₁→ℙ¹_ℤ is the coarse space of Ell_m, the open Ell⊂Ell_m has coarse space 𝔸¹_ℤ, and the formation of all these coarse spaces commutes with arbitrary base change S→Spec ℤ. On the elliptic locus this is the upstream coarse j-line over every ring (9E, coarseJLine). X(1) is irreducible with geometrically irreducible fibres over ℤ.

**Hypotheses and conventions.**

- m≥1; S an arbitrary scheme.

**Proof plan.**

1. On Ell use the upstream coarse j-line: M([Γ(1)]/R)=Spec R[j] for every ring R (Tau Ceti ModularCurves 9E, recovered as the stack coarse space by AlgebraicModuli R09.5 coarse-j-line-recovery).
2. On the preimage C of ℙ¹∖{0,1728} every object has automorphism group the constant {±1} (Deligne's lemma, as in Česnavičius 2016 Lemma 2.4: the automorphism scheme is finite étale with geometric fibres {±1} by Tau Ceti WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq; for the standard 1-gon it is μ₁×ℤ/2, R13.1 neron-polygon-automorphisms), so {±1} is a rigidifiable subgroup of the inertia (AlgebraicModuli R09.5 normal-inertia-subgroup) and C⫽{±1} has trivial stabilisers (R09.5 rigidification-stabilizers). The rigidification C⫽{±1} has trivial inertia, so it is an algebraic space and its own coarse space; rigidification preserves coarse spaces and commutes with arbitrary base change (AlgebraicModuli R09.5).
3. At the cusp the Tate 1-gon over ℤ[[q]] (R13.3 generalized-tate-n-gon with n=1) is a formal chart on which inversion acts trivially on q, and j=1/q+744+⋯ identifies the completed coarse local ring with ℤ[[1/j]]; together with the elliptic locus this identifies the coarse space of X(1) over ℤ with ℙ¹_ℤ (Česnavičius takes this case from Deligne–Rapoport VI.1.1).
4. Over each 𝔽_p the coarse map of X(1)\_{𝔽_p} to ℙ¹\_{𝔽_p} is an isomorphism over a dense open and finite locally free because its source is normal, hence an isomorphism; fibrewise-coarse-base-change then gives every S.
5. For Ell_m the m-gons over C have automorphism scheme μ_m×ℤ/2 (R13.1), so C_m⫽{±1} is not its own coarse space; it is tame because the remaining stabilisers μ_d are linearly reductive (Česnavičius Lemma 2.1.6 and Deligne 1975 5.3(III)), so its coarse space is ℤ-flat of formation compatible with every base change (SchemeAndStackFoundations SF.1 tame-local-structure; Abramovich–Olsson–Vistoli Corollary 3.3). The induced map from the coarse space of Ell_m to ℙ¹_ℤ is then finite, flat by EGA IV₂ 6.1.5 fibre by fibre, and an isomorphism over 𝔸¹, hence an isomorphism; the coarse map is a homeomorphism, so irreducibility of ℙ¹ gives that of Ell_m and its fibres.

**Prerequisites.**

- [`R13.4a/fibrewise-coarse-base-change`](#r13-4a-fibrewise-coarse-base-change) (Coarse base change from the fibres over 𝔽_p)
- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions)
- [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms) (Automorphisms and torsion of split polygons)
- [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon) (Generalized Tate n-gons)
- `AlgebraicModuliForArithmeticGeometry:R09.5/coarse-j-line-recovery`
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-coarse`
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`
- `SchemeAndStackFoundations:SF.1/keel-mori`
- `SchemeAndStackFoundations:SF.1/setoid-criterion`
- `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`
- `AlgebraicModuliForArithmeticGeometry:R09.5/normal-inertia-subgroup`
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-stabilizers`
- `SchemeAndStackFoundations:SF.1/tame-local-structure`
- `tauceti:WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`
- `SchemeAndStackFoundations:SF.1`

**Consumers in this roadmap.** [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry); [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure); [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor); [`R13.4a/twisted-coarse-curve`](#r13-4a-twisted-coarse-curve)

**Acceptance checks.**

- Over 𝔽₂ the coarse space of X(1)\_{𝔽₂} is ℙ¹\_{𝔽₂} although the stabiliser at j=0 has order 24, which is not invertible.
- X(1) is not ℙ¹_ℤ: every object has the automorphism −1, so there is no universal curve over ℙ¹.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 3.3.2 and proof, pp.24–25. The coarse space of Ell_n (resp. Ell) is ℙ¹_ℤ (resp. 𝔸¹_ℤ via j) and its formation commutes with base change to any S; Ell_n is irreducible with geometrically irreducible fibres; the proof rigidifies by {±1} off j=0,1728, reduces to the fibres over 𝔽_p via Lemma 3.3.1 for n=1, and for general n uses the tameness of the rigidified stack.
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), proof of Theorem 4.2.1, p.36. The map j:M₁→ℙ¹_ℤ is defined by the generating sections Δ and c₄³ of ω^{⊗12} of the universal generalized elliptic curve.
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9E, items 1–6. The coarse j-line over ℤ and over every ring R, with Spec ℤ[j] the coarse space of [Γ(1)], proved without the general coarse base-change theorem.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-level-stack-geometry"></a>

### Geometry of the level-H stacks

**Theorem** · `ModularCurvesPartII:R13.4a/level-stack-geometry`

For every open level subgroup H and n with Γ(n)⊂H: (a) 𝒳_H→X(1) is representable, finite, surjective and locally free of rank [GL₂(Ẑ):H]; (b) 𝒳_H is a normal, Cohen–Macaulay, Deligne–Mumford stack, proper and flat over ℤ, with all fibres of pure dimension one; (c) 𝒳_H is smooth over ℤ[1/n], and over ℤ[1/n] its elliptic open Y_H[1/n] is the quotient stack [Y(n)\_{ℤ[1/n]}/H̄] of the full-level elliptic stack by right translation of frames; the quotient stack [X(n)\_{ℤ[1/n]}/H̄] of the whole compactified full-level stack is not 𝒳_H[1/n] in general, because the rotations μ_n of the n-gon cusps act on E^sm[n]=μ_n×ℤ/n by unipotent matrices [[1,\*],[0,1]] and contract to the identity of X(1), so its map to X(1) is not representable (for H=GL₂(Ẑ) it is Ell_n[1/n], not X(1)[1/n]); (d) for H′⊂H the morphism 𝒳\_{H′}→𝒳_H is finite and surjective of degree [H:H′], and it is flat at every point where 𝒳_H is regular; (e) the open locus of 𝒳_H whose geometric points have trivial automorphism group is a quasi-projective ℤ-scheme, and 𝒳_H is a projective scheme when every geometric point has trivial automorphism group. Regularity of 𝒳_H at points of residue characteristic dividing n is not asserted for general H.

**Hypotheses and conventions.**

- H open; n with Γ(n)⊂H.
- Statement (c) uses the GL₂(ℤ/n)-torsor Y(n)[1/n]→Ell\_{ℤ[1/n]} and the full-level formal cusp charts ⊔Spec ℤ[ζ_n][[q^{1/n}]] of 𝒳\_{Γ(n)} over the Tate chart of X(1).

**Proof plan.**

1. (a) Finiteness is by construction; surjectivity because X(1) is irreducible (compactified-coarse-j-line); X(1) is regular of dimension two and 𝒳_H normal of dimension two, hence Cohen–Macaulay, so the finite map is flat (Stacks 00R4; EGA IV₂ 6.1.5 as cited by Česnavičius); its rank is read on the elliptic locus over ℤ[1/n].
2. (b) Normality is inherited from Y_H[1/n] by relative normalization; properness and flatness over ℤ come from X(1) through (a).
3. (c) On the elliptic open, Y(n)[1/n]→Ell\_{ℤ[1/n]} is a GL₂(ℤ/n)-torsor (level-h-structures), so Y_H[1/n]=[Y(n)[1/n]/H̄] is finite étale over Ell\_{ℤ[1/n]}, hence smooth over ℤ[1/n]. Along the cusps, 𝒳_H×\_{X(1)}Spf ℤ[1/n][[q]] is the normalization of ℤ[1/n][[q]] in the level-H structures on the Tate curve over ℤ[1/n]((q)) (normalization commutes with this base change because ℤ[[q]] is excellent, Conrad Lemma 4.1.6), i.e. the H̄-invariants of the full-level chart, a finite product of copies of ℤ[1/n,ζ_n][[q^{1/n}]] (R13.3 formal-level-cusp-charts; Conrad (4.2.1)); the stabiliser of a factor acts on ζ_n through a free Galois action and on q^{1/n} by n-th roots of unity, so its invariants are power series rings over rings finite étale over ℤ[1/n], and 𝒳_H is smooth over ℤ[1/n] along the cusps (Česnavičius §4.1.2 cites Deligne–Rapoport IV.6.7). The whole quotient stack [X(n)/H̄] is not used: at the cusp ∞ of X(p) the p-gon with level structure (ζ_p,(1,1)) is fixed, up to the unipotent element [[1,k],[0,1]]∈Γ₀(p)‾, by each rotation, which contracts to the identity of the 1-gon (compare Česnavičius §1.2, p.2).
4. (d) Normalization functoriality gives the finite map; miracle flatness at regular points of the target; the degree is computed on Y\_{H′}[1/n]→Y_H[1/n].
5. (e) A Deligne–Mumford stack with trivial geometric automorphism groups and quasi-compact separated diagonal is an algebraic space (Česnavičius Lemma 3.2.2(a)); it is quasi-finite and separated over ℙ¹_ℤ through the coarse j-map, hence a quasi-projective scheme (Lemma 4.1.3 and Remark 4.1.4).

**Prerequisites.**

- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications) (The standard levels: moduli stacks as normalizations)
- [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line) (The compactified coarse j-line)
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions) (Polygon-count stacks and decontractions)
- `SchemeAndStackFoundations:SF.1/quotient-stack`
- `SchemeAndStackFoundations:SF.1/setoid-criterion`
- `mathlib:AlgebraicGeometry.Flat`
- `mathlib:AlgebraicGeometry.IsFinite`
- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`

**Consumers in this roadmap.** [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor); [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level); [`R13.4a/fixed-pairing-coarse-curve`](#r13-4a-fixed-pairing-coarse-curve); [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps); [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients); [`R13.4a/proper-rigidifying-covers`](#r13-4a-proper-rigidifying-covers)

**Acceptance checks.**

- rank 𝒳\_{Γ₁(5)}→X(1) is 24 while the coarse degree of X₁(5)→ℙ¹ is 12.
- 𝒳\_{Γ(N)} is a projective scheme for N≥2 not of the form p^s or 2p^s, and is not a scheme for N=p^s, 2p^s because supersingular points in characteristic p keep the automorphism −1, nor for N=1 (standard-level-stack-identifications).

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), §4.1.2, p.28. The map 𝒳_H→X(1) is representable, finite and surjective, flat by EGA IV₂ 6.1.5, hence locally free of rank [GL₂(Ẑ):H]; 𝒳_H has relative dimension one, and by DR IV.6.7 it is smooth over ℤ[1/n].
- [`ces17`](https://arxiv.org/pdf/1511.07475), Lemma 4.1.3 and Remark 4.1.4, p.28; Lemma 3.2.2(a), p.20. An open substack with trivial geometric automorphism groups is a quasi-projective ℤ-scheme, and 𝒳_H has a largest open subscheme; algebraic-space criterion by automorphisms of geometric points.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 4.3.2(a), p.37. The full-level stack X(n) is Cohen–Macaulay, proper and flat of relative dimension one over ℤ and smooth over ℤ[1/n].
- [`ces17`](https://arxiv.org/pdf/1511.07475), Remark 4.1.4, pp.28–29. Regularity of 𝒳_H is not known in general; through EGA IV₂ 6.1.5 it would give flatness of the maps 𝒳_H→𝒳\_{H′}.
- [`stacks`](https://stacks.math.columbia.edu), Tag 00R4. A finite module over a regular local ring which is Cohen–Macaulay of full dimension is flat (miracle flatness).
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), proof of Theorem 4.1.1, p.34; (4.2.1), p.37. The full-level stack over the Tate chart ℤ[[q]] of the 1-gon is a finite disjoint union of copies of ℤ[ζ_N][[q^{1/N}]], the normalization of ℤ[[q]] in the level structures on the Tate curve; Lemma 4.1.6 gives the regularity of ℤ[[q]]→W[[q]] used to pass to completions.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/LevelStack`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-degree-and-cusp-divisor"></a>

### Degree of the j-map and the cusp divisor

**Theorem** · `ModularCurvesPartII:R13.4a/coarse-degree-and-cusp-divisor`

For every open level subgroup H the coarse j-map X_H→ℙ¹_ℤ, induced from 𝒳_H→X(1) and compactified-coarse-j-line, is finite locally free of constant rank [GL₂(Ẑ):±H], the projective index. The scheme X_H is projective and flat over ℤ with all fibres of pure dimension one; Y_H:=X_H×\_{ℙ¹}𝔸¹ is the coarse space of the elliptic open Y_H of 𝒳_H. The cusp divisor X_H^∞:=X_H×\_{ℙ¹}{∞} is an effective Cartier divisor on X_H which is finite locally free over ℤ of rank [GL₂(Ẑ):±H]; it is the scheme-theoretic fibre, in general not reduced, and its multiplicities are the cusp widths (coarse-cusps-away-from-the-level). The stack 𝒳_H has rank [GL₂(Ẑ):H] over X(1); the two degrees agree exactly when −I∈H.

**Hypotheses and conventions.**

- H open; X_H the coarse space of 𝒳_H (integral-coarse-curves).

**Proof plan.**

1. Finite locally free: integral-coarse-curves (Česnavičius §6.1: X_H is normal and finite over X(1)=ℙ¹_ℤ, so locally free by EGA IV₂ 6.1.5).
2. The rank is computed at a geometric point of 𝔸¹_ℚ with j≠0,1728: its preimages are the classes of level-H structures on one curve E modulo Aut(E)={±1}, i.e. the set {±1}\\GL₂(ℤ/n)/H̄, of cardinality [GL₂(ℤ/n):±H̄].
3. The coarse space of the open substack Y_H is the preimage of 𝔸¹ because coarse formation commutes with flat (here open) base change on X_H.
4. The pullback of the Cartier divisor ∞ along a flat morphism is Cartier, and finite locally free of the same rank over ∞≅Spec ℤ.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry) (Geometry of the level-H stacks)
- [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line) (The compactified coarse j-line)
- [`R13.4a/level-subgroups`](#r13-4a-level-subgroups) (Open level subgroups and the standard levels)
- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- `tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`
- `SchemeAndStackFoundations:SF.1/keel-mori`
- `mathlib:AlgebraicGeometry.Scheme.Hom.finrank`

**Consumers in this roadmap.** [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level); [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure); [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement); [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves)

**Acceptance checks.**

- X₀(N)→ℙ¹ has degree ψ(N); X₁(N)→ℙ¹ has degree φ(N)ψ(N)/2 for N≥3, so 12 for N=5; X(N)→ℙ¹ has degree |GL₂(ℤ/N)|/2 for N≥3; X\_{C_s⁺(13)} and X\_{C_ns⁺(13)} have degrees 91 and 78.
- For a prime p, X₀(p)^∞=[∞]+p·[0], of rank p+1 over ℤ, not reduced.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), §6.1, p.62. X_H is a projective ℤ-scheme finite over X(1)=ℙ¹_ℤ, normal, and X_H→X(1) is locally free of constant rank; X_H is flat of relative dimension one over ℤ.
- [`zywina15`](https://arxiv.org/pdf/1508.07660), §3.2, p.15. For G containing −I the j-map π_G:X_G→ℙ¹_ℚ has degree [GL₂(ℤ/N)/{±I}:G/{±I}]=[GL₂(ℤ/N):G].
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Layer 10, item 2. For prime level diamond quotients the cusp locus is the scheme-theoretic fibre over ∞, finite locally free of rank deg j, not reduced, a relative effective Cartier divisor.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-cusp-regularity"></a>

### Regularity at integral Γ₀ cusps

**Theorem** · `ModularCurvesPartII:R13.4a/coarse-cusp-regularity`

For every N≥1, the integral Γ₀(N) coarse curve is regular at every cusp, including residue characteristics 2 and 3. More generally Česnavičius Theorem 6.7 gives regularity after removing the closed bad-prime points with j=0 or 1728. The refined and naive Γ₀ stacks have the same coarse curve for all N by Proposition 6.9; the refined stack remains necessary for stack regularity, finite-inertia descent and compactified level maps. This theorem gives a regular neighbourhood of the boundary, not smoothness of the whole fibre at a level-dividing prime.

**Proof plan.**

1. Compute prime-power cusp covers by normalizing the Tate cyclic-subgroup cover.
2. Factor prime-to-p level and normalize; exchange the two mixed cusp types using the dual cyclic isogeny.
3. Use the all-level coarse comparison to identify the resulting regular rings with the refined coarse curve.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)

**Consumers in this roadmap.** [`R13.3/gamma-zero-prime-power-cusp-rings`](#r13-3-gamma-zero-prime-power-cusp-rings); [`R13.5/corrected-coarse-singular-locus`](#r13-5-corrected-coarse-singular-locus); [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure)

**Acceptance checks.**

- X₀(4) has regular cusps at 2; this does not make the Γ₁(4) coarse base-change assertion true.

**Sources.**

- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), Proposition 1.2.2.1 and Theorem 1.2.3.1, pp.37–38. The prime-power formal rings normalize to regular charts, and factorization plus Atkin–Lehner proves regularity for arbitrary N.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Theorem 6.7, pp.64–65, and Proposition 6.9, p.65. Coarse cusp regularity is uniform and naive/refined coarses agree.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-local-structure"></a>

### Local structure of coarse level curves

**Theorem** · `ModularCurvesPartII:R13.4a/coarse-local-structure`

Let H be an open level subgroup, π:𝒳_H→X_H the coarse space, x̄ a geometric point of 𝒳_H and Γ_x̄ its finite automorphism group. (a) There are an étale neighbourhood U→X_H of π(x̄) and a finite U-scheme V with a Γ_x̄-action such that 𝒳_H×\_{X_H}U≅[V/Γ_x̄] and U=V/Γ_x̄. (b) The strict henselization of X_H at π(x̄) is the ring of Γ_x̄-invariants of the strict henselization of 𝒳_H at x̄, and the same holds after completion: Ô^{sh}\_{X_H,π(x̄)}=(Ô^{sh}\_{𝒳_H,x̄})^{Γ_x̄}. (c) Γ_x̄ acts through its effective quotient Γ_x̄^{eff}=Γ_x̄/(Γ_x̄∩{±1}) when −I∈H̄, and through Γ_x̄ itself otherwise; this quotient acts faithfully. (d) If x̄ lies over j(x̄)≠∞ in residue characteristic prime to n, then 𝒳_H→X(1) is étale at x̄, Γ_x̄ is the subgroup of Aut(E_x̄) fixing the level structure, and the local degree of X_H→ℙ¹_j at π(x̄), the degree of the extension of fraction fields of the strictly henselian local rings, is [Aut(E_x̄)/{±1} : Γ_x̄^{eff}], where Γ_x̄^{eff} denotes the image of Γ_x̄ in Aut(E_x̄)/{±1}; at a point of the generic fibre this is the ramification index, while at a closed point of residue characteristic p the local rings are two-dimensional and the local degree is the relevant invariant. For H=Γ₀(N) and any geometric point x̄=(E,C), Γ_x̄=Aut(E,C) contains {±1}, and the strictly henselian local ring of X₀(N) is the invariant ring of that of the refined stack under Aut(E,C)/{±1}. (e) On the open of X_H over which every geometric stabiliser has invertible order, in particular over ℤ[1/6] (stabilisers have order dividing 24 because 𝒳_H→X(1) is representable), a line bundle L on 𝒳_H is the pullback of a line bundle on X_H if and only if every Γ_x̄ acts trivially on the fibre L(x̄), and then L≅π\*π_\*L; ω^{⊗12} on X(1) is the pullback of 𝒪\_{ℙ¹}(1) through the section Δ, while ω itself does not descend because −1 acts on it by −1.

**Hypotheses and conventions.**

- H open; 𝒳_H as in deligne-rapoport-level-stack, a separated Deligne–Mumford stack of finite type over ℤ with finite inertia.
- Statement (d) uses that Y_H[1/n]→Ell\_{ℤ[1/n]} is finite étale; statement (b) for completions uses flatness of completion over the noetherian strictly henselian ring.
- For Γ₀(N) the stack is the refined, Deligne–Mumford stack; the naive Γ₀(N) stack has non-étale automorphism groups at some cusps when N is not squarefree and is not used here.

**Proof plan.**

1. (a) is the étale local structure of separated Deligne–Mumford stacks with finite inertia over their coarse spaces (Abramovich–Vistoli Lemma 2.2.3; Olsson 2006 Theorem 2.12 as used by Česnavičius in Proposition 6.4(b)), requested from SchemeAndStackFoundations SF.1, with V a component of an étale atlas over the strict henselization and Γ_x̄ the stabiliser.
2. (b) Strict henselization is ind-étale, hence flat, and taking invariants of a finite group commutes with flat base change; Conrad's proof of the Keel–Mori theorem gives exactly this invariant-subring description. Completion of a noetherian local ring is flat, so invariants also commute with completion.
3. (c) The generic automorphism group of 𝒳_H is {±1} if −I∈H̄ and trivial otherwise (level-h-structures), and it acts trivially on functions; the remaining group acts faithfully on the fraction field of the strictly henselian local ring because a generic deformation has no further automorphisms.
4. (d) Over ℤ[1/n] the strict henselization of 𝒳_H at x̄ is that of Ell at E_x̄, and the coarse local rings of X_H and ℙ¹_j are its invariants under Γ_x̄ and Aut(E_x̄); faithful action of the effective quotients gives an extension of fraction fields of degree equal to the index, and the separably closed residue fields make it totally ramified at points of the generic fibre.
5. For Γ₀(N) apply (a)–(c) to the refined stack, which is Deligne–Mumford and has the same coarse space as the naive stack (coarse-cusp-regularity).
6. (e) is finite flat descent through a tame coarse space (AlgebraicModuli R09.5 tame-finite-flat-descent; the open where the stabiliser orders are invertible is tame by SchemeAndStackFoundations SF.1 tame-stack) applied to the finite locally free algebra 𝒪⊕L with L·L=0, whose descent is that of L; Δ is a nowhere-vanishing section of ω^{⊗12} on Ell with a simple zero along the boundary of X(1), and j=c₄³/Δ (compactified-coarse-j-line).

**Prerequisites.**

- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- `SchemeAndStackFoundations:SF.1/keel-mori`
- `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`
- `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`
- `SchemeAndStackFoundations:SF.1/inertia`
- [`R13.4a/coarse-cusp-regularity`](#r13-4a-coarse-cusp-regularity) (Regularity at integral Γ₀ cusps)
- [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli) (The normalized Γ₀ moduli stack)
- `AlgebraicModuliForArithmeticGeometry:R09.5/tame-finite-flat-descent`
- [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation) (Boundary carriers and Hodge evaluation)
- `SchemeAndStackFoundations:SF.1`
- [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line) (The compactified coarse j-line)
- `SchemeAndStackFoundations:SF.1/tame-stack`

**Consumers in this roadmap.** [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level); [`R13.4a/coarse-base-change-failure`](#r13-4a-coarse-base-change-failure); [`R13.4a/coarse-rational-points`](#r13-4a-coarse-rational-points)

**Acceptance checks.**

- For X₀(N) at a point (E,C) with j(E)=1728 in characteristic prime to 6N: if C is stable under the automorphism of order 4, Γ^{eff} has order 2 and X₀(N)→ℙ¹ is unramified there; otherwise Γ^{eff} is trivial and the local degree is 2.
- For X₁(N) with N≥5 and residue characteristic prime to N, every Γ_x̄ is trivial and X₁(N) is étale locally the stack itself, a fine scheme.

**Sources.**

- [`av02`](https://arxiv.org/pdf/math/9908167), Lemma 2.2.3, p.4 (arXiv v2). For a separated Deligne–Mumford stack with coarse space X there is an étale covering of X over which the stack becomes a quotient [U/Γ] of a scheme by a finite group, Γ the stabiliser over the strict henselization.
- [`conrad05`](https://math.stanford.edu/~conrad/papers/coarsespace.pdf), Theorem 1.1, p.1; Theorem 3.1 and its proof, pp.5–6; Theorem 4.2, p.8. The coarse space exists for finite inertia and is compatible with flat base change (Theorems 1.1 and 3.1); in the proof of Theorem 4.2 its strictly henselian local ring is the subring of the strictly henselian local ring of a finite flat chart on which the two pullbacks agree, and a representable étale separated quasi-compact map inducing isomorphisms on stabilisers induces a map of coarse spaces that is étale at those points.
- [`gz86`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III, §1, (1.3) and the following paragraph, p.255. For X₀(N), Aut_k(x) is the automorphism group of the pair (E,A), contains ±1, and the strict henselization of X at x is the quotient of that of the moduli stack by Aut_k(x)/{±1}; see source issue ModularCurvesPartII/E401 for the stack to which this applies.
- [`ces17`](https://arxiv.org/pdf/1511.07475), proof of Proposition 6.4(b), p.64; proof of Theorem 6.7, pp.64–65. Étale locally on its coarse space 𝒳_H is a quotient of an affine scheme by a group of order dividing 24; on the locus j≠0,1728 the automorphism group of the universal object of 𝒳₀(n) is {±1} and the coarse space is the rigidification.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-cusps-away-from-the-level"></a>

### Cusps of X_H away from the level

**Theorem** · `ModularCurvesPartII:R13.4a/coarse-cusps-away-from-the-level`

Let H be an open level subgroup, n with Γ(n)⊂H, and u=[[1,1],[0,1]]. Over every algebraically closed field k with char k∤n, the points of X_H^∞(k) are in bijection with the double cosets ⟨±u⟩\\GL₂(ℤ/n)/H̄: the coset of g is the Tate curve over k((q^{1/n})) with the level structure φ₀gH̄, where φ₀=(ζ,q^{1/n}) for a fixed primitive n-th root of unity ζ, the monodromy q^{1/n}↦ζq^{1/n} acting by left multiplication by u and inversion by −I. The width of the cusp of g, equal to its ramification index over ∞ and to its multiplicity in X_H^∞, is the least w≥1 with u^w∈±gH̄g⁻¹, and after base change to a strictly henselian base the completed local ring of X_H at it is a power series ring in a parameter t with t^w equal to q times a unit. The reduced cusp scheme (X_H^∞)_red is finite étale over ℤ[1/n] of rank #(⟨±u⟩\\GL₂(ℤ/n)/H̄), the sum of the widths is [GL₂(Ẑ):±H], and Gal(ℚ̄/ℚ) acts on the geometric cusps through Gal(ℚ(ζ_n)/ℚ)≅(ℤ/n)^×, the element d acting by left multiplication by [[d,0],[0,1]].

**Hypotheses and conventions.**

- k algebraically closed of characteristic prime to n; the bad-characteristic cusps are R13.3 and coarse-cusp-regularity.

**Proof plan.**

1. For full level the fibre of 𝒳\_{Γ(n)}→X(1) over the Tate chart is a finite disjoint union of copies of Spec ℤ[ζ_n][[q^{1/n}]], compatibly with the cyclotomic structure; its components over k are the frames of the Tate curve modulo monodromy (Conrad (4.2.1); R13.3 formal-level-cusp-charts).
2. The coarse local ring at a cusp is the invariant ring of this formal chart under the stabiliser of the component in ⟨±u⟩×H̄ (coarse-local-structure (b)); u^b acts by q^{1/n}↦ζ^b q^{1/n} and −I acts trivially on q.
3. The stabiliser of the coset of g is ⟨±u⟩∩gH̄g⁻¹, whose image in the monodromy group is ⟨u^w⟩, so the invariants of k[[q^{1/n}]] are k[[q^{1/w}]] and the ramification index over q is w.
4. Over ℤ[1/n] the Galois group of ℤ[1/n,ζ_n] acts freely on the coefficients; the invariant ring of ℤ[1/n,ζ_n][[x]] under a group acting semilinearly in this way is R[[y]] with R finite étale over ℤ[1/n], which gives the finite étale reduced cusp scheme.
5. σ_d sends φ₀=(ζ,q^{1/n}) to (ζ^d,q^{1/n})=φ₀·[[d,0],[0,1]], hence acts on φ₀gH̄ by left multiplication by [[d,0],[0,1]].

**Prerequisites.**

- [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure) (Local structure of coarse level curves)
- [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor) (Degree of the j-map and the cusp divisor)
- [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry) (Geometry of the level-H stacks)
- [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications) (The standard levels: moduli stacks as normalizations)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon) (Generalized Tate n-gons)
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`

**Consumers in this roadmap.** [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves)

**Acceptance checks.**

- X₀(p): two cusps, of widths 1 and p, both ℚ-rational.
- X₁(p) for p≥5 prime: (p−1)/2 cusps of width 1, conjugate over ℚ(ζ_p)⁺, and (p−1)/2 cusps of width p, each ℚ-rational; the widths sum to (p²−1)/2.
- X(N,ζ) for N≥3: |SL₂(ℤ/N)|/(2N) cusps per component, each of width N (twelve cusps for N=5).
- X₀(N): the cusps are the ⟨±u⟩-orbits on ℙ¹(ℤ/N), of number Σ\_{d|N} φ(gcd(d,N/d)).

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), (4.2.1) and proof of Lemma 4.2.4, p.37; proof of Theorem 4.1.1, p.34. M\_{Γ(N)}×\_{M₁}Spec ℤ[[q]] is a finite disjoint union of copies of Spec ℤ[ζ_N][[q^{1/N}]], compatibly with the ℤ[ζ_N]-structure defined by the Weil pairing on the Tate curve; the boundary lies in the smooth locus over ℤ[ζ_N].
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 4.3.1 and Lemma 4.3.2, p.37. The d-gon strata of the boundary are open and closed and reduced.
- [`gz86`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III, §1, p.255. The cusps of X₀(N) have one component Cusp(d) for each d|N, with φ(gcd(d,N/d)) geometric points and Cusp(d)≅Spec ℤ[μ_f], f=gcd(d,N/d); ∞ and 0 are Cusp(N) and Cusp(1).
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Layer 10, item 2. For prime N≥5 and the diamond quotients, (Cusps_H)_red is finite étale over ℤ[1/N] with (N−1)/(2|H|) geometric cusps of each width 1 and N.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-cyclotomic-structure"></a>

### The cyclotomic structure of X_H

**Construction** · `ModularCurvesPartII:R13.4a/coarse-cyclotomic-structure`

Let H be an open level subgroup, n with Γ(n)⊂H, D_H=det(H̄)⊂(ℤ/n)^×, and O_H the ring of integers of the subfield ℚ(ζ_n)^{D_H} fixed by {σ_d : d∈D_H}, σ_d(ζ)=ζ^d. The Weil pairing gives a morphism det:Y_H[1/n]→Spec O_H[1/n], sending (E,φH̄) to the D_H-orbit of e_n(φ(e₁),φ(e₂)), well defined because e_n((P,Q)g)=e_n(P,Q)^{det g}; it extends uniquely to a morphism X_H→Spec O_H, proper and flat. For H′⊂H the level map X\_{H′}→X_H lies over Spec O\_{H′}→Spec O_H; for g normalising H̄ the automorphism of X_H induced by g lies over σ\_{det g}. For H=Γ(N) this is the morphism X(N)→Spec ℤ[ζ_N] extending the Weil pairing. Whether the fibres of X_H→Spec O_H are geometrically connected is not part of this construction (R12.4 and R12.6).

**Hypotheses and conventions.**

- H open; n with Γ(n)⊂H.
- X_H normal (integral-coarse-curves).

**Proof plan.**

1. On Y(n)[1/n] the Weil pairing of the universal frame is a primitive n-th root of unity, a morphism to μ_n^{prim}=Spec ℤ[1/n][x]/(Φ_n) (upstream 5B), equivariant for the right action of GL₂(ℤ/n) on frames through σ\_{det}.
2. Pass to the quotient by H̄: Y_H[1/n]=Y(n)[1/n]/H̄ maps to Spec of the D_H-invariants ℤ[1/n,ζ_n]^{D_H}=O_H[1/n].
3. Extension: O_H is finite over ℤ, and an element of O_H regular on the dense open Y_H[1/n] of the normal scheme X_H is integral over every local ring of X_H, hence regular; uniqueness by density and separatedness (Conrad's argument for Theorem 4.1.1(3)).
4. Flatness: X_H is flat over ℤ and Spec O_H is a Dedekind scheme; properness from X_H→Spec ℤ.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.cyclotomicBase` | data | O_H, the ring of integers of ℚ(ζ_n)^{det H̄}. |
| `TauCeti.ModularCurves.toCyclotomicBase` | constructor | The morphism X_H→Spec O_H extending the Weil pairing. |
| `TauCeti.ModularCurves.toCyclotomicBase_ellipticOpen` | characterisation | On Y_H[1/n] it sends (E,φH̄) to the det H̄-orbit of e_n(φ e₁, φ e₂). |
| `TauCeti.ModularCurves.toCyclotomicBase_unique` | extensionality | Any two morphisms X_H→Spec O_H agreeing on Y_H[1/n] are equal. |
| `TauCeti.ModularCurves.toCyclotomicBase_levelMap` | functoriality | For H′⊂H the square with Spec O\_{H′}→Spec O_H commutes. |
| `TauCeti.ModularCurves.toCyclotomicBase_normaliser` | compatibility | For g normalising H̄ the induced automorphism of X_H lies over σ\_{det g} on Spec O_H. |
| `TauCeti.ModularCurves.toCyclotomicBase_flat` | structure | toCyclotomicBase is proper and flat. |

**Unit tests.**

- `TauCeti.ModularCurves.cyclotomicBase_gamma0` (degenerate): cyclotomicBase (Γ₀ N) = ℤ, and toCyclotomicBase is the structure morphism.
- `TauCeti.ModularCurves.cyclotomicBase_full` (computation): cyclotomicBase (Γ N) = ℤ[ζ_N], with toCyclotomicBase the extended Weil pairing of Conrad Theorem 4.1.1(3).
- `TauCeti.ModularCurves.toCyclotomicBase_not_connected` (non-example): For N≥3, X(N)_ℚ maps onto Spec ℚ(ζ_N), so X(N)_ℚ̄ has at least φ(N) connected components; X(N) over ℚ is not geometrically connected.
- `TauCeti.ModularCurves.cyclotomicBase_kernelDet` (computation): For H̄=SL₂(ℤ/n), cyclotomicBase = ℤ[ζ_n] although H̄ is large.

**Uses.**

- this layer, fixed-pairing-coarse-curve: X(N) is regarded over ℤ[ζ_N] through this morphism
- R12.3 cusp-fields-and-component-labels and R12.6 component-fields-and-twisted-descent: the algebraic component and pairing labels compared with the analytic ones
- R13.4b generic-component-comparison: the components of X_H over ℚ̄ are compared with the analytic components, indexed by (ℤ/n)^×/D_H
- Zywina 2015, §3.2: a curve X_G with surjective determinant is defined over ℚ with ℚ algebraically closed in its function field

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- [`R13.4a/level-subgroups`](#r13-4a-level-subgroups) (Open level subgroups and the standard levels)
- [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor) (Degree of the j-map and the cusp divisor)
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`
- `mathlib:IsPrimitiveRoot`
- `mathlib:Polynomial.cyclotomic`

**Consumers in this roadmap.** [`R13.4a/fixed-pairing-coarse-curve`](#r13-4a-fixed-pairing-coarse-curve); [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves)

**Acceptance checks.**

- H=Γ₀(N), Γ₁(N), C_s(ℓ), C_ns⁺(ℓ): D_H=(ℤ/n)^× and O_H=ℤ.
- H=Γ(N): O_H=ℤ[ζ_N], recovering the fixed-pairing base.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1(3), p.31, and its proof, p.34. There is a unique Cohen–Macaulay morphism M\_{Γ(N)}→Spec ℤ[ζ_N] extending the Weil-pairing morphism on M⁰\_{Γ(N)}/ℤ[1/N]; the extension uses only ℤ-flatness, normality and the Cartier boundary.
- [`zywina15`](https://arxiv.org/pdf/1508.07660), §3.2, p.15; Proposition 3.1, p.14. For det(G)=(ℤ/N)^× the field ℚ is algebraically closed in the function field of X_G, and θ_N(A)ζ_N=ζ_N^{det A}: the determinant governs the field of constants.
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §5B. The Weil-pairing determinant of Y_full(N) takes values in μ_N^{prim}; fixing ζ gives the fibre Y(N,ζ).

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-level-maps"></a>

### Level maps between coarse curves

**Construction** · `ModularCurvesPartII:R13.4a/coarse-level-maps`

For open level subgroups H′⊂H the finite morphism 𝒳\_{H′}→𝒳_H induces f\_{H′,H}:X\_{H′}→X_H over ℙ¹_ℤ, finite and surjective of degree [±H:±H′], with f\_{H,H}=id and f\_{H′,H}∘f\_{H″,H′}=f\_{H″,H}. For g∈GL₂(Ẑ), conjugation gives c_g:X_H≅X\_{g⁻¹Hg}. The normaliser N(H̄) of H̄ in GL₂(ℤ/n) acts on X_H on the right through N(H̄)/±H̄, by (E,φH̄)↦(E,φgH̄) on Y_H[1/n] extended by normalization; on X₁(N) the element [[d,0],[0,1]] acts as the diamond operator P↦dP and −I acts trivially. These maps are compatible with the cyclotomic structures, send the cusp of a double coset ⟨±u⟩g H̄′ to that of ⟨±u⟩g H̄, and multiply widths by the local degree. Over ℤ[1/n] each f\_{H′,H} is finite flat between smooth curves; over ℤ it is flat at every point of X\_{H′} over which X_H is regular. A coarse map is not a substitute for a stack correspondence: Hecke correspondences are R14.1's.

**Hypotheses and conventions.**

- H′⊂H open; n with Γ(n)⊂H′.
- Flatness assertions at bad primes require regularity of X_H at the image point.

**Proof plan.**

1. The stack map is levelStack.map; the coarse universal property gives f\_{H′,H} and the functor laws (SchemeAndStackFoundations SF.1 coarse-moduli-space).
2. The degree is the ratio of the j-degrees from coarse-degree-and-cusp-divisor.
3. The normaliser acts on Y_H[1/n] by right translation of frames; the action extends to X_H by the universal property of normalization over ℙ¹, and −I acts trivially on the coarse space because [−1] is an isomorphism (E,φH̄)≅(E,φ(−I)H̄).
4. Compatibility with the cyclotomic structure follows from e_n((P,Q)g)=e_n(P,Q)^{det g}; the cusp statement from coarse-cusps-away-from-the-level.
5. Flatness: finite morphisms from a Cohen–Macaulay scheme of pure dimension two to a regular one are flat (Stacks 00R4).

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.levelMap` | constructor | f\_{H′,H}:X\_{H′}→X_H for H′⊂H. |
| `TauCeti.ModularCurves.levelMap_id` | simp | levelMap H H = id. |
| `TauCeti.ModularCurves.levelMap_comp` | functoriality | levelMap H′ H ∘ levelMap H″ H′ = levelMap H″ H. |
| `TauCeti.ModularCurves.levelMap_degree` | characterisation | levelMap H′ H is finite surjective of degree [±H:±H′]. |
| `TauCeti.ModularCurves.levelMap_j` | compatibility | j∘levelMap H′ H = j. |
| `TauCeti.ModularCurves.conjIso` | constructor | c_g:X_H≅X\_{g⁻¹Hg}, with c\_{gh}=c_h∘c_g. |
| `TauCeti.ModularCurves.normaliserAction` | instance | The right action of N(H̄)/±H̄ on X_H by automorphisms over ℙ¹_ℤ. |
| `TauCeti.ModularCurves.normaliserAction_cyclotomic` | compatibility | The automorphism of g lies over σ\_{det g} on Spec O_H. |
| `TauCeti.ModularCurves.levelMap_flat_of_regular` | other | levelMap H′ H is flat at points of X\_{H′} lying over regular points of X_H, in particular everywhere over ℤ[1/n]. |

**Unit tests.**

- `TauCeti.ModularCurves.levelMap_gamma1_gamma0_degree` (computation): For N≥3 the degree of levelMap (Γ₁ N) (Γ₀ N) is φ(N)/2; for N=13 it is 6.
- `TauCeti.ModularCurves.levelMap_self` (degenerate): levelMap H H is the identity of X_H.
- `TauCeti.ModularCurves.normaliserAction_minusOne` (non-example): −I acts trivially on X₁(N), so the diamond group acting faithfully on X₁(N) is (ℤ/N)^×/{±1} and not (ℤ/N)^× (N≥3).
- `TauCeti.ModularCurves.normaliserAction_gamma1_diamond` (compatibility): On Y₁(N)[1/N] the action of [[d,0],[0,1]] is (E,P)↦(E,dP), upstream's diamond action.

**Uses.**

- R14.1 diamond-operators, degeneracy-maps-and-hecke-correspondence: the coarse diamond automorphisms and the forgetful legs of Hecke correspondences
- R12.3 cusp-ramification-and-level-maps: the algebraic level maps whose cusp ramification is compared with the analytic widths
- Calegari–Geraghty 2018 §§3.2, 3.9: the covers X\_{U₁(Q)}→X\_{U_Δ(Q)}→X\_{U₀(Q)} and X_V→X_U are level maps with Galois group a quotient of the normaliser
- this layer, coarse-level-quotients: the quotient description of X_H uses the action of H/H′ on X\_{H′}

**Prerequisites.**

- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor) (Degree of the j-map and the cusp divisor)
- [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure) (The cyclotomic structure of X_H)
- [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level) (Cusps of X_H away from the level)
- [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry) (Geometry of the level-H stacks)
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- `SchemeAndStackFoundations:SF.1/coarse-moduli-space`
- `mathlib:Subgroup.normalizer`

**Consumers in this roadmap.** [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement); [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients)

**Acceptance checks.**

- f\_{Γ₁(N),Γ₀(N)} has degree φ(N)/2 for N≥3.
- On X₁(N), ⟨−1⟩ is the identity.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), §4.1.2, p.28. H′⊂H gives the finite X(1)-morphism 𝒳\_{H′}→𝒳_H from the map of level structures; regularity of 𝒳_H would make these maps flat by EGA IV₂ 6.1.5.
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9B, last paragraph; Layer 10, item 3. The diamond action on [Γ₁(N)] is P↦aP; the covering Y₁(N)→Y₀(N) is Galois with group (ℤ/N)^×/±1 and extends to X₁(N)→X₀(N) along the normalizations.
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Lemma 4.2.3, p.36. Contraction maps between level stacks such as M\_{Γ₁(N)}→M\_{Γ₀(N)} are finite flat surjective of constant rank.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-level-quotients"></a>

### Coarse curves as quotients

**Theorem** · `ModularCurvesPartII:R13.4a/coarse-level-quotients`

Let H′⊂H be open level subgroups with H′ normal in H. Then H/H′ acts on X\_{H′} over X_H through the normaliser action, and X_H is the categorical and geometric quotient X\_{H′}/(H/H′); in particular X_H=X(n)/H̄ for Γ(n)⊂H. For a ring A the comparison (X\_{H′}⊗A)/(H/H′)→X\_{H′}/(H/H′)⊗A is an isomorphism if A is flat over ℤ or if the order of the image of H/H′ in Aut(X\_{H′}) is invertible in A; in general it is a universal homeomorphism. Neither side need be the coarse space of the base-changed stack 𝒳_H⊗A when A is not flat (coarse-base-change-failure).

**Hypotheses and conventions.**

- H′⊴H open; A an arbitrary ring for the comparison map.

**Proof plan.**

1. The quotient X\_{H′}/(H/H′) exists: X\_{H′} is projective, so every finite orbit lies in an affine open (SchemeAndStackFoundations SF.1 finite-group-quotient).
2. Over ℤ both X\_{H′}/(H/H′) and X_H are normal and finite over ℙ¹_ℤ and agree over the elliptic open over ℤ[1/n], where Y_H[1/n]=[Y\_{H′}[1/n]/(H/H′)] (level-h-structures) and coarse spaces of finite quotients are invariant quotients; so they coincide by finite-normal-recognition (Česnavičius Lemma 6.2, citing Deligne–Rapoport IV.3.10(iii)). The quotient stack [𝒳\_{H′}/(H/H′)] is not used: it need not be 𝒳_H at the cusps (level-stack-geometry (c)).
3. Formation of rings of invariants commutes with flat base change, and with every base change when the group order is invertible; in general the comparison is integral, surjective and radicial.

**Prerequisites.**

- [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps) (Level maps between coarse curves)
- [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry) (Geometry of the level-H stacks)
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- `SchemeAndStackFoundations:SF.1/finite-group-quotient`
- `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`
- `tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors`
- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- `tauceti:TauCetiRoadmap/ModularCurves#9a-katzmazur-quotient-problems`

**Consumers in this roadmap.** [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification); [`R13.4a/atkin-lehner-quotient-curves`](#r13-4a-atkin-lehner-quotient-curves)

**Acceptance checks.**

- X₀(N)=X₁(N)/((ℤ/N)^×/±1) for N≥3.
- X\_{C_s⁺(ℓ)}=X\_{C_s(ℓ)}/(ℤ/2).

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Lemma 6.2, p.63. For Γ(n)⊂H, X_H is the categorical quotient X(n)/H̄.
- [`ces16cb`](https://arxiv.org/pdf/1608.01249), §1.2, p.1. The ring of invariants of a finite group commutes with arbitrary base change when the group order is invertible.
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9A, Remark 7.1.4 statement. For a ring map R→R′ the comparison of quotients is an isomorphism for flat R′, for |H| invertible in R′, or for a free action, and is in general surjective and radicial.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-affine-open-identification"></a>

### The elliptic opens are the Katz–Mazur level problems

**Comparison** · `ModularCurvesPartII:R13.4a/affine-open-identification`

Let H be an open level subgroup and n with Γ(n)⊂H. (a) Over ℤ, the open substack Y_H=𝒳_H×\_{X(1)}Ell is the stack over Ell of the Katz–Mazur quotient problem [Γ(n)]/H̄ of Tau Ceti ModularCurves 9A–9B: its objects over S are elliptic curves over S with a [Γ(n)]/H̄-structure. (b) The coarse space Y_H⊂X_H of Y_H is the Katz–Mazur coarse moduli scheme M([Γ(n)]/H̄) of upstream 9D, compatibly with the classifying maps, with the j-maps to the coarse j-line 𝔸¹_ℤ of 9E and with the maps induced by H′⊂H. (c) For the standard levels: Y\_{Γ(N)} is upstream's integral [Γ(N)] of Layer 6, represented over ℤ[1/N] for N≥3 by Y_full(N) of 5B, and its fibres over μ_N^{prim} are Y(N,ζ); Y\_{Γ₁(N)} is [Γ₁(N)] of Layer 6, represented over ℤ[1/N] for N≥4 by Y₁(N) of 5A (over ℤ it is not rigid: at a supersingular point in characteristic p|N the Drinfeld point P=0 is fixed by every automorphism); Y\_{Γ₀(N)} is [Γ₀(N)] of Layer 8D, with coarse space upstream's Y₀(N) of 9E. (d) X_H is the normalization of ℙ¹_ℤ in M([Γ(n)]/H̄), i.e. the Katz–Mazur compactified coarse moduli scheme. No new affine level carrier is introduced: the affine curves are upstream's.

**Hypotheses and conventions.**

- H open; n with Γ(n)⊂H.
- The identifications are of stacks over Ell and of their coarse spaces; no fine-moduli assertion is made outside the ranges stated.

**Proof plan.**

1. For H=Γ(n), the moduli interpretations of Y(n) and of upstream's [Γ(n)] agree by definition of Drinfeld full level structures, and Y(n)=Y\_{Γ(n)} by standard-level-stack-identifications.
2. For general H̄, both sides are the quotient of the Γ(n) case by H̄: over ℤ[1/n] by level-h-structures and upstream 9A (sheaf quotient of the naive problem), and over ℤ by the integral Katz–Mazur quotient property (Katz–Mazur 7.1.3, as used in Česnavičius Proposition 6.3(a)).
3. (b): if [Γ(n)]/H̄ is representable the coarse statement is the definition of M; in general use coarse-level-quotients (X_H=X(n)/H̄) and upstream 9D's M(𝒫)/H≅M(𝒫/H), together with AlgebraicModuli R09.5 elliptic-coarse-recovery, which identifies upstream's coarse scheme with the stack coarse space.
4. (c) is the specialisation of (a)–(b) to the four standard levels, using upstream 5A, 5B, Layer 6, 8D and 9E.
5. (d): X_H is normal and finite over ℙ¹_ℤ with Y_H dense and meeting every component, so it is the normalization by finite-normal-recognition.

**Prerequisites.**

- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications) (The standard levels: moduli stacks as normalizations)
- [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients) (Coarse curves as quotients)
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- `tauceti:TauCetiRoadmap/ModularCurves#9a-katzmazur-quotient-problems`
- `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`
- `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-6-the-three-elementary-integral-level-problems`
- `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n`
- `AlgebraicModuliForArithmeticGeometry:R09.5/elliptic-coarse-recovery`

**Consumers in this roadmap.** [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons); [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement); [`R13.4a/coarse-rational-points`](#r13-4a-coarse-rational-points)

**Acceptance checks.**

- H=Γ₀(N), N≥3: Y₀(N)⊗ℤ[1/N] is upstream's Borel quotient Y_full(N)/B, the coarse open of X₀(N).
- H=Γ₁(5): Y₁(5) over ℤ[1/5] is upstream's Tate-normal-form curve, a fine scheme, and X₁(5) is its normalization over ℙ¹.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 6.3 and proof, p.63. The quotient moduli problem [Γ(n)]/H̄ of Katz–Mazur §7.1 is Y_H, its coarse scheme M([Γ(n)]/H̄) of §8.1 is the coarse space Y_H, and the compactified coarse scheme of §8.6 is X_H, the normalization of X(1) in Y_H.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Lemma 6.2, p.63. For Γ(n)⊂H the coarse curve X_H is the categorical quotient X(n)/H̄ (Deligne–Rapoport IV.3.10(iii)).
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §§5A, 5B, 6, 8D, 9A–9E. The affine integral level problems [Γ(N)], [Γ₁(N)], [Γ₀(N)], their quotient problems and coarse schemes M(𝒫), the coarse j-line and Y₀(N), and the fine curves Y₁(N), Y_full(N), Y(N,ζ) after inverting N.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Comparison`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-prime-diamond-agreement"></a>

### Agreement with the prime-level diamond quotients

**Comparison** · `ModularCurvesPartII:R13.4a/prime-diamond-agreement`

Let N≥5 be prime, Δ=(ℤ/N)^×/{±1}, H≤Δ, and G_H⊂GL₂(Ẑ) the open subgroup whose image modulo N is {[[a,b],[0,d]] : a mod ±1 ∈ H}. Let X_H^{MC} be Tau Ceti ModularCurves Layer 10's compactified coarse curve over ℤ[1/N], the normalization of ℙ¹\_{ℤ[1/N]} in Y₁(N)/H. Then the restriction of X\_{G_H} to ℤ[1/N] is isomorphic to X_H^{MC} by a unique isomorphism over ℙ¹\_{ℤ[1/N]} restricting on 𝔸¹ to the identification of Y\_{G_H} with Y₁(N)/H. The isomorphism matches the cusp divisors, the diamond action of Δ/H, the map X₁(N)→X₀(N) (the cases H=1 and H=Δ) and the cyclotomic structure (both over ℤ). The proof checks the recognition hypotheses on X\_{G_H}[1/N]: it is normal, finite over ℙ¹\_{ℤ[1/N]}, contains Y\_{G_H}[1/N] as a dense open, and each of its irreducible components meets it. No new compactification, cusp width or Shimura covering is built for this class; those stay Layer 10's.

**Hypotheses and conventions.**

- N≥5 prime; H≤(ℤ/N)^×/{±1}; base ℤ[1/N].
- X_H^{MC} is the Layer 10 carrier, built on Mathlib's relative normalization.

**Proof plan.**

1. Upstream 9B (Katz–Mazur 7.4.2(3),(7)) and 9D (M(𝒫)/H≅M(𝒫/H)) identify Y\_{G_H}[1/N] with Y₁(N)/H over 𝔸¹\_{ℤ[1/N]}; by affine-open-identification this is the coarse open of X\_{G_H}.
2. X\_{G_H}[1/N] is normal and finite over ℙ¹ (integral-coarse-curves, coarse-degree-and-cusp-divisor).
3. Every irreducible component of X\_{G_H}[1/N] is finite flat over ℙ¹\_{ℤ[1/N]}, hence surjects onto it and meets the preimage of 𝔸¹; so Y\_{G_H}[1/N] is dense in every component. This is the component-by-component check.
4. finite-normal-recognition gives the isomorphism; its uniqueness is normalization.hom_ext with the affine map to ℙ¹.
5. Compatibilities: the diamond action and X₁(N)→X₀(N) agree on the dense open and extend uniquely; cusp divisors are both the fibre over ∞.

**Prerequisites.**

- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification) (The elliptic opens are the Katz–Mazur level problems)
- [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor) (Degree of the j-map and the cusp divisor)
- [`R13.4a/coarse-level-maps`](#r13-4a-coarse-level-maps) (Level maps between coarse curves)
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- `tauceti:TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems`
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`

**Consumers in this roadmap.** [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons)

**Acceptance checks.**

- N=5, H=Δ: X₀(5)[1/5] agrees with Layer 10's X₀(5), with cusp divisor [∞]+5[0] in both.
- N=11, H=1: X₁(11)[1/11] agrees with Layer 10's X₁(11); both have five cusps of width 1 and five of width 11.

**Sources.**

- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Layer 10, items 1–2. For N≥5 prime and H≤Δ, X_H is the normalization of ℙ¹_j over ℤ[1/N] in Y_H=Y₁(N)/H, with cusps the scheme-theoretic fibre over ∞; the recognition criterion requires finiteness, normality, schematic density and every component meeting Y_H.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 6.3(c), p.63. The Katz–Mazur compactified coarse moduli scheme is X_H, as both are the normalization of X(1)=ℙ¹_ℤ in Y_H.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Comparison`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-normalization-comparisons"></a>

### Coarse normalization comparisons

**Comparison** · `ModularCurvesPartII:R13.4a/coarse-normalization-comparisons`

On the elliptic locus X_H agrees with the affine coarse moduli scheme from ModularCurves 9D, by equality of the moduli problem and its categorical coarse property. It also agrees with the Katz–Mazur compactification as in Česnavičius Proposition 6.3. For prime N≥5 and diamond H over ℤ[1/N], identify the generalized-stack coarse compactification with Layer 10’s X_H by checking normality, finiteness over ℙ¹_j, an open immersion of Y_H with schematic density, and that every component meets Y_H. Then normalization uniqueness identifies the curves and their maps. The universal property of relative normalization alone does not recognize an arbitrary proposed compactification.

**Proof plan.**

1. The elliptic-open identification with the Katz–Mazur coarse schemes is R13.4a/affine-open-identification, and the prime N≥5 diamond-quotient agreement over ℤ[1/N] is R13.4a/prime-diamond-agreement; this node collects them with the Katz–Mazur compactification comparison and proves nothing about them again.
2. Compare affine coarse maps using their universal property.
3. Both compactifications are finite normal extensions of the same dense level algebra; verify all components meet the elliptic open.
4. Apply normalization uniqueness, then use separatedness and schematic density to identify maps.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`
- [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification) (The elliptic opens are the Katz–Mazur level problems)
- [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement) (Agreement with the prime-level diamond quotients)

**Consumers in this roadmap.** [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization); [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison)

**Acceptance checks.**

- For prime N=5 the generalized Γ₀ coarse construction agrees with the pre-existing compactification; no second set of cusp widths is built.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Lemma 6.2 and Proposition 6.3, p.63. Finite quotient descriptions and KM comparison identify the same algebraic coarse curves.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-legal-coarse-base-change"></a>

### Base change for coarse modular curves

**Theorem** · `ModularCurvesPartII:R13.4a/legal-coarse-base-change` · planet: *Coarse base change theorem*

The coarse formation X_H commutes with arbitrary base change over ℤ[1/gcd(6,n)] and X_H is smooth over ℤ[1/n], where Γ(n)⊂H. Away from 6 one uses tame inertia; at 2 or 3 with that prime not dividing n use the separate normal-fibre/rigidification argument of Česnavičius Proposition 6.4. Elsewhere retain only the applicable flat or tame base-change theorem. Γ₁(4) in characteristic 2 is an explicit obstruction to unrestricted coarse base change. Normalization is not asserted to commute with arbitrary base change.

**Proof plan.**

1. Apply tame coarse invariants after inverting 6.
2. At a level-prime-free 2 or 3, use the finite normal fibre comparison and the rigidification argument in Proposition 6.4.
3. Keep the characteristic-2 counterexample outside the statement.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-base-change`
- `SchemeAndStackFoundations:SF.1/keel-mori`

**Consumers in this roadmap.** [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials); [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility); [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality); [`R13.4a/fixed-pairing-coarse-curve`](#r13-4a-fixed-pairing-coarse-curve); [`R13.4a/coarse-base-change-failure`](#r13-4a-coarse-base-change-failure); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves)

**Acceptance checks.**

- n=5 allows arbitrary base change over all ℤ, even though stack stabilizers need not be tame at 2 or 3.
- n=4 only provides the advertised arbitrary range after inverting 2.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 6.4, pp.63–64, and Remark 6.6, p.64. The base-change range includes non-tame primes not dividing level; the Γ₁(4) counterexample excludes a general claim.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-modular-polynomial"></a>

### The cyclic modular polynomial

**Construction** · `ModularCurvesPartII:R13.4a/modular-polynomial` · planet: *Modular polynomial*

For m≥2 define Φ_m(U,V) by the generic cyclic degree-m quotient of the universal j-elliptic curve: its roots in V are j(E/C) for cyclic subgroups C of order m. This gives the irreducible polynomial in ℤ[U,V], monic of degree ψ(m)=m∏_(p|m)(1+1/p) in each variable, symmetric in U,V. Set Φ₁(U,V)=V−U with this orientation. The map (j,j′) from Y₀(m)_ℚ is finite birational onto the plane curve Φ_m=0, and ℚ(X₀(m))=ℚ(j,j′); the smooth coarse curve is its normalization. The integral plane image is not asserted to be the normal integral modular curve, nor does this normalization commute with arbitrary reduction. Cyclic degree ψ(m) differs from the full-subgroup Hecke degree σ₁(m).

**Proof plan.**

1. On the generic j-line take the characteristic polynomial of the target j over the cyclic subgroup algebra.
2. Use finite local freeness of the cyclic coarse algebra over ℤ[j] to make the characteristic polynomial integral; its generic distinct roots give the minimal polynomial. Dual isogeny supplies symmetry for m≥2.
3. Generic distinct targets give birationality and the stated function-field equality; normalize the plane image, rather than identifying it as a smooth model.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.modularPolynomial` | constructor | The normalized integral polynomial with its distinguished orientation at m=1. |
| `TauCeti.ModularCurves.modularPolynomial_cyclic` | characterisation | In characteristic zero, Φ_m(j(E),j(E′))=0 precisely when a cyclic degree-m isogeny exists. |
| `TauCeti.ModularCurves.modularPolynomial_degree` | simp | For m≥2 its degree in each variable is ψ(m), with leading coefficient 1. |
| `TauCeti.ModularCurves.modularPolynomial_dual` | compatibility | For m≥2 dual cyclic isogenies interchange the variables and preserve Φ_m. |
| `TauCeti.ModularCurves.modularPolynomial_normalization` | equivalence | Y₀(m)_ℚ is the normalization of the affine plane image, with function field ℚ(j,j′). |

**Unit tests.**

- `TauCeti.ModularCurves.modularPolynomial_one` (degenerate): Φ₁(U,V)=V−U; swapping variables changes its sign.
- `TauCeti.ModularCurves.modularPolynomial_four_degree` (computation): deg_V Φ₄=6, not 7.
- `TauCeti.ModularCurves.modularPolynomial_nonNormalImage` (non-example): A special elliptic pair can admit several cyclic isogenies of degree m; its plane image point does not encode a unique subgroup or a universal family.

**Uses.**

- Masser–Zannier §3.1: Provides an integral equation and degree bound.
- ComplexMultiplicationAndExplicitReciprocity CM.3/CM.5: Imports this polynomial for arithmetic congruences; those congruences are not prerequisites here.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity) (Drinfeld structures on the smooth locus)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`

**Consumers in this roadmap.** [`R12.6/gamma-zero-rational-function-field`](#r12-6-gamma-zero-rational-function-field); [`R13.4a/atkin-lehner-quotient-curves`](#r13-4a-atkin-lehner-quotient-curves)

**Acceptance checks.**

- ψ(4)=6 whereas σ₁(4)=7; E[2] is the extra noncyclic subgroup of order 4.
- For a transcendental j, Φ₂(j,V) has degree 3.

**Sources.**

- [`mz20`](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §3.1(ii),(v), pp.645–646. Integrality, separate monicity and ψ(m) degree of the cyclic modular polynomial are the input used here.
- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §1, p.226. The function field of X₀(N) is generated by its two j-invariants.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-projective-scalar-coarse-quotient"></a>

### Projective scalar level quotients

**Construction** · `ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient` · planet: *Projective level curve*

For prime p>3 over ℤ[1/p], form the coarse quotient of honest full level p by scalar change of frame a∈𝔽_p×. It classifies a torsion framing modulo scalar up to isomorphism, as a coarse moduli space. The element [−1] remains an automorphism of the unrigidified projective-frame stack, so this quotient is not a fine moduli scheme carrying a descended universal curve. Over ℂ it has two components indexed by the square class of the determinant/Weil pairing; PGL₂(𝔽_p) exchanges these when the determinant is nonsquare, and PSL₂ fixes each. On the p-gon compactification, distinguish full raw stabilizers from the effective rigidification by [−1]; the effective ramification orders over the j-line are 2,3,p. The p-gon automorphism and torsion carriers themselves are imported from R13.1.

**Proof plan.**

1. Take the scalar quotient of the honest framing stack, keeping its residual central automorphism.
2. Compute the determinant action a↦a² and then the PGL₂ action.
3. Use the p-gon formal parameter and imported automorphism action; rigidify the ubiquitous [−1] before reading effective inertia orders.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.projectiveLevelCurve` | constructor | The coarse scalar quotient with its map from honest full level. |
| `TauCeti.ModularCurves.projectiveLevelCurve_pairingClass` | projection | The Weil pairing is retained only modulo squares. |
| `TauCeti.ModularCurves.projectiveLevelCurve_pglAction` | instance | The effective PGL₂ action permutes the two components by determinant square class. |
| `TauCeti.ModularCurves.projectiveLevelCurve_rigidification` | compatibility | Rigidification removes the central [−1] from inertia while preserving the coarse curve. |
| `TauCeti.ModularCurves.projectiveLevelCurve_cusp` | compatibility | The completed p-gon cover has effective inertia p; before rigidification the stabilizer contains the inversion factor. |

**Unit tests.**

- `TauCeti.ModularCurves.projectiveLevelCurve_five` (computation): p=5 gives two scalar-framed complex components, not four and not one.
- `TauCeti.ModularCurves.projectiveLevelCurve_minusOne` (non-example): [−1] fixes a projective framing and prevents a fine universal family.
- `TauCeti.ModularCurves.projectiveLevelCurve_orbifold` (compatibility): After rigidification the three ramification orders are 2,3,p, matching the analytic (2,3,p) orbifold from R12.3.

**Uses.**

- Bakker–Tsimerman §§2–3: Defines their coarse X(p) and effective orbifold without changing upstream elliptic carriers.
- R13.4b: Checks components and analytic comparison.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification`
- `AlgebraicModuliForArithmeticGeometry:R09.5/rigidification-coarse`
- [`R13.1/semistable-genus-one-curves-and-neron-polygons`](#r13-1-semistable-genus-one-curves-and-neron-polygons) (Semistable genus-one curves and split polygons)

**Consumers in this roadmap.** [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison); [`R14.1/projective-boundary-hecke-and-degree`](#r14-1-projective-boundary-hecke-and-degree)

**Acceptance checks.**

- For p=5 honest full level has 4 complex components and the scalar quotient has 2; on one component the effective covering group is PSL₂(𝔽₅).

**Sources.**

- [`bt16`](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.1–2.2, pp.713–715; §3, p.717. The scalar framing and effective orbifold are the application; the fine-moduli and raw-stabilizer wording must be corrected.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-split-cartan-quotient"></a>

### The split Cartan normalizer quotient

**Comparison** · `ModularCurvesPartII:R13.4a/split-cartan-quotient`

For a prime ℓ, over ℚ there is an algebraic isomorphism X₀(ℓ²)/⟨w_(ℓ²)⟩≃X_s(ℓ), where X_s denotes the normalizer of split Cartan, or equivalently the moduli of an unordered pair of distinct ℓ-subgroups. Given a cyclic chain E→E/C_ℓ→E/C_(ℓ²), the middle curve has two distinct order-ℓ subgroups, one from the dual first isogeny and the other from the second; reversing the chain exchanges the pair. The inverse construction and finite-normal compactification comparison establish the isomorphism. This is not the ordered split-Cartan curve. At ℓ itself it is a generic-fibre identification; the semistable quotient is constructed after the explicit extension in R13.5.

**Proof plan.**

1. Construct the unordered middle pair from a cyclic ℓ²-chain, using dual isogenies and the coprimality of the two middle directions.
2. Reconstruct a chain from an unordered pair up to reversal; this identifies the elliptic open moduli functors over ℚ.
3. Extend the finite birational map between normal compactifications; no analytic connectedness is required.

**Assembly note.** Here X_s(ℓ) is the normalizer curve, written X_s⁺(ℓ) in [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves). The Fricke involution w_{ℓ²} used here is constructed on the generic fibre in R14.1, directly from the R13.4a curve, so citing it is not a cycle.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- [`R14.1/exact-divisor-atkin-lehner`](#r14-1-exact-divisor-atkin-lehner) (Exact-divisor Atkin–Lehner operators) *(later layer R14.1)*

**Consumers in this roadmap.** [`R13.5/split-cartan-semistable-model`](#r13-5-split-cartan-semistable-model); [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves); [`R13.4a/atkin-lehner-quotient-curves`](#r13-4a-atkin-lehner-quotient-curves)

**Acceptance checks.**

- For ℓ=13 the quotient has genus 3; calling the ordered split-Cartan curve X_s would change the degree and genus.

**Sources.**

- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, proof of Theorem 6.6, p.929; §6.3, pp.929–930. The rational identification with the Fricke quotient is the algebraic input to the split Cartan semistable model.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-fixed-pairing-coarse-curve"></a>

### The fixed-pairing compactified curve

**Construction** · `ModularCurvesPartII:R13.4a/fixed-pairing-coarse-curve`

For N≥1 and a ring R with a ring map ζ:ℤ[ζ_N]→R, let 𝒳(N,ζ)_R:=𝒳\_{Γ(N)}×\_{Spec ℤ[ζ_N]}Spec R, using the extended Weil pairing 𝒳\_{Γ(N)}→Spec ℤ[ζ_N] (Conrad Theorem 4.1.1(3)), and let X(N,ζ)_R be its coarse space. For R=ℤ[ζ_N], X(N,ζ)=X(N) with its cyclotomic structure. Its elliptic open over ℤ[1/N,ζ_N] is the coarse space of the stack of curves with full level structure of Weil pairing ζ, which for N≥3 is upstream's fine scheme Y(N,ζ). The formation of X(N,ζ)_R commutes with base change R→R′ when R′ is flat over R, when N≥3 and R is a ℤ[1/N]-algebra, and when N is not of the form p^s or 2p^s, because 𝒳\_{Γ(N)} is then a scheme. Over ℤ[1/N,ζ_N] it is a smooth proper curve, and X(N)\_{ℤ[1/N,ζ_N]} is the disjoint union over d∈(ℤ/N)^× of the curves X(N,ζ^d)\_{ℤ[1/N,ζ_N]}. Geometric connectedness of its fibres is R12.4's theorem and is not used here.

**Hypotheses and conventions.**

- N≥1; R a ℤ[ζ_N]-algebra.
- The listed base-change cases are the only ones asserted.

**Proof plan.**

1. Base change the full-level stack along ζ and take the Keel–Mori coarse space (SchemeAndStackFoundations SF.1 keel-mori).
2. For R=ℤ[ζ_N] the base change is the identity, so the coarse space is X(N) with coarse-cyclotomic-structure.
3. Base change: flat base change of coarse spaces; for N≥3 over ℤ[1/N] the stack is a fine scheme (Katz–Mazur rigidity, upstream 2F, 5B); for N not of the form p^s, 2p^s the stack is a projective scheme over ℤ (standard-level-stack-identifications).
4. Over ℤ[1/N] the ring ℤ[1/N,ζ_N]⊗_ℤℤ[ζ_N] is the product of copies of ℤ[1/N,ζ_N] indexed by σ_d, which splits X(N) after base change into the fibres X(N,ζ^d).
5. Smoothness over ℤ[1/N,ζ_N] from level-stack-geometry (c) and legal-coarse-base-change.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.fixedPairingCurve` | constructor | X(N,ζ)_R for a ring R with ζ:ℤ[ζ_N]→R. |
| `TauCeti.ModularCurves.fixedPairingCurve.toBase` | projection | The proper structure morphism X(N,ζ)_R→Spec R. |
| `TauCeti.ModularCurves.fixedPairingCurve.ellipticOpen` | compatibility | Over ℤ[1/N,ζ_N] and N≥3 its elliptic open is upstream's Y(N,ζ). |
| `TauCeti.ModularCurves.fixedPairingCurve.baseChange` | functoriality | The comparison X(N,ζ)\_{R′}→X(N,ζ)_R×_R R′, an isomorphism in the three listed cases. |
| `TauCeti.ModularCurves.fullLevel_split` | equivalence | X(N)×_ℤℤ[1/N,ζ_N] ≅ ⊔\_{d∈(ℤ/N)^×} X(N,ζ^d)\_{ℤ[1/N,ζ_N]}. |
| `TauCeti.ModularCurves.fixedPairingCurve.galois` | functoriality | The frame change by [[1,0],[0,d]] gives an isomorphism X(N,ζ)_R≅X(N,ζ^d)_R over R and over the j-line; for R=ℤ[ζ_N] it is an automorphism of X(N) lying over σ_d. |

**Unit tests.**

- `TauCeti.ModularCurves.fixedPairingCurve_one` (degenerate): For N=1 and N=2, ℤ[ζ_N]=ℤ and X(N,ζ)=X(N); X(1,ζ)=ℙ¹_ℤ and X(2) has degree 6 over ℙ¹.
- `TauCeti.ModularCurves.fixedPairingCurve_five_cusps` (computation): X(5,ζ) over ℚ(ζ₅) has degree 60 over the j-line and twelve cusps, each of width 5.
- `TauCeti.ModularCurves.fixedPairingCurve_not_full` (non-example): X(5) over ℚ is not X(5,ζ): it has degree 240 over ℙ¹_ℚ and maps onto Spec ℚ(ζ₅).
- `TauCeti.ModularCurves.fixedPairingCurve_fine` (compatibility): For N≥3 over ℤ[1/N,ζ_N] the coarse map is an isomorphism from the stack, which is upstream's fine scheme Y(N,ζ) on the elliptic open.

**Uses.**

- R12.3 and R12.4: the compact fixed-pairing curve compared with Γ(N)\\(ℍ∪ℙ¹(ℚ)) and whose geometric connectedness is proved there
- ShimuraCompactifications C6: the requested fixed-pairing compactification with its base
- this layer, twisted-coarse-curve: the twisted curves are forms of X(N,ζ)

**Prerequisites.**

- [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure) (The cyclotomic structure of X_H)
- [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications) (The standard levels: moduli stacks as normalizations)
- [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry) (Geometry of the level-H stacks)
- [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change) (Base change for coarse modular curves)
- `SchemeAndStackFoundations:SF.1/keel-mori`
- `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#2f-endomorphism-degree-trace-and-rigidity`

**Consumers in this roadmap.** [`R13.4a/twisted-coarse-curve`](#r13-4a-twisted-coarse-curve)

**Acceptance checks.**

- N=5 over ℚ(ζ₅): X(5,ζ) has degree 60 over ℙ¹ and twelve cusps of width 5, whereas X(5)_ℚ has degree 240.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1(3), p.31; Lemma 4.2.4, p.37. The full-level stack has a unique Cohen–Macaulay structure morphism to Spec ℤ[ζ_N] extending the Weil pairing, and its boundary is in the smooth locus over ℤ[ζ_N].
- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 4.3.6, p.39. X(n) is a projective scheme over ℤ unless n=p^s or 2p^s.
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §5B and Convention 5. Y_full(N) has a determinant to μ_N^{prim}; Y(N,ζ) is its fibre over a chosen primitive root, the curve to which connectedness statements refer.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-twisted-coarse-curve"></a>

### Compactified twisted curves X(ρ)

**Construction** · `ModularCurvesPartII:R13.4a/twisted-coarse-curve`

Let N≥3 and let V_ρ/ℚ be a finite étale group scheme, étale locally isomorphic to (ℤ/N)², with a perfect alternating Galois-equivariant pairing V_ρ×V_ρ→μ_N, equivalently ρ:G_ℚ→GL₂(ℤ/N) with determinant the mod-N cyclotomic character and the pairing. Upstream 5C constructs the smooth affine curve Y(ρ)/ℚ whose T-points are pairs (E,ι) with ι:E[N]≅V\_{ρ,T} preserving pairings. Define X(ρ) as the normalization of ℙ¹\_{j,ℚ} in the composite Y(ρ)→𝔸¹_j⊂ℙ¹_j. Then X(ρ) is a smooth proper curve over ℚ, Y(ρ) is the preimage of 𝔸¹, and for every finite extension L/ℚ over which V_ρ acquires a symplectic frame of pairing value ζ∈μ_N^{prim}(L), X(ρ)_L≅X(N,ζ)_L compatibly with j; changing the frame changes this isomorphism by the action of SL₂(ℤ/N). The same construction applies after any base change of V_ρ to a field of characteristic zero. For V_ρ=E₀[N] with its Weil pairing, (E₀,id) is a ℚ-point of Y(ρ).

**Hypotheses and conventions.**

- N≥3; V_ρ over ℚ as in upstream 5C, with a perfect alternating pairing to μ_N.
- Only pairing-preserving isomorphisms are parametrised; the unpaired GL₂-twist is a different moduli problem.

**Proof plan.**

1. Over a finite extension L trivialising V_ρ symplectically, Y(ρ)_L≅Y(N,ζ)_L as moduli problems (upstream 5C, steps 3–5).
2. Relative normalization commutes with the étale base change Spec L→Spec ℚ (Stacks 03GV; Mathlib normalizationPullback for smooth maps), so X(ρ)_L is the normalization of ℙ¹_L in Y(N,ζ)_L, which is X(N,ζ)_L by the recognition criterion applied to the normal proper curve of fixed-pairing-coarse-curve.
3. Properness and smoothness descend along Spec L→Spec ℚ.
4. Frame changes act through SL₂(ℤ/N) because they preserve the pairing value.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.twistedCurve` | constructor | X(ρ), the normalization of ℙ¹_j in Y(ρ). |
| `TauCeti.ModularCurves.twistedCurve.ellipticOpen` | compatibility | Y(ρ)=X(ρ)×\_{ℙ¹}𝔸¹, upstream's twisted curve. |
| `TauCeti.ModularCurves.twistedCurve.frameIso` | equivalence | A symplectic frame of V over S′ of value ζ gives X(ρ)\_{S′}≅X(N,ζ)\_{S′} over ℙ¹. |
| `TauCeti.ModularCurves.twistedCurve.frameIso_change` | relation | Changing the frame by γ∈SL₂(ℤ/N) composes the isomorphism with the action of γ on X(N,ζ). |
| `TauCeti.ModularCurves.twistedCurve.smooth` | structure | X(ρ) is a smooth proper curve over ℚ. |
| `TauCeti.ModularCurves.twistedCurve.baseChange` | functoriality | Formation of X(ρ) commutes with extension of the base field. |

**Unit tests.**

- `TauCeti.ModularCurves.twistedCurve_split` (degenerate): For V_ρ=ℤ/N×μ_N with the pairing ⟨(a,x),(b,y)⟩=y^a/x^b, the frame ((1,1),(0,ζ_N)) over ℚ(ζ_N) has pairing value ζ_N and gives X(ρ)\_{ℚ(ζ_N)}≅X(N,ζ_N)\_{ℚ(ζ_N)}.
- `TauCeti.ModularCurves.twistedCurve_point` (characterisation): For V_ρ=E₀[N] with the Weil pairing, (E₀,id) is a ℚ-point of Y(ρ) over j(E₀).
- `TauCeti.ModularCurves.twistedCurve_unpaired` (non-example): Replacing pairing-preserving isomorphisms by all isomorphisms E[N]≅V gives a curve with φ(N) geometric components over a splitting field, not a form of X(N,ζ).

**Uses.**

- R12.4 twisted-geometric-irreducibility and R12.6 component-fields-and-twisted-descent: the canonical compact normalization of the twisted curve whose geometric connectedness and descent are proved there
- EllipticCurveModularityWild3Adic W3.6: the compactification X_ρ(5) whose rationality over ℚ is used for the global companion
- R13.4b: the generic-fibre genus and rationality of X(ρ) for N=3,4,5

**Prerequisites.**

- [`R13.4a/fixed-pairing-coarse-curve`](#r13-4a-fixed-pairing-coarse-curve) (The fixed-pairing compactified curve)
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line) (The compactified coarse j-line)
- `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`
- `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationPullback`
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`

**Acceptance checks.**

- For a curve E₀/ℚ and N=5, X(E₀[5]) is a smooth proper curve over ℚ with the rational point (E₀,id); its genus and rationality are generic-fibre statements of R13.4b.

**Sources.**

- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §5C. Y(ρ) for N≥3 parametrises elliptic curves with a pairing-compatible isomorphism of their N-torsion with V_ρ; the layer owns the algebraic reduction of its geometric irreducibility.
- [`stacks`](https://stacks.math.columbia.edu), Tag 03GV. Relative normalization commutes with smooth, in particular étale, base change.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 6.4(a), p.63. Coarse level curves are smooth over ℤ[1/n], which applies to the forms X(N,ζ) of X(ρ).

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-base-change-failure"></a>

### Failure of coarse base change at Γ₁(4) in characteristic 2

**Theorem** · `ModularCurvesPartII:R13.4a/coarse-base-change-failure`

Let H be an open level subgroup for which there is an open substack U⊂(Y_H)\_{ℤ\_{(2)}} such that the geometric points of U_ℚ have trivial automorphism groups and some nonempty open U′⊂U\_{𝔽₂} has inertia the constant group {±1}. Then the base change to 𝔽₂ of the coarse map π:𝒳_H→X_H is not the coarse map of (𝒳_H)\_{𝔽₂}, and the failure persists on every ℤ\_{(2)}-fibrewise dense open substack. This applies to H=Γ₁(4): on the open of Y₁(4)\_{𝔽₂} where the subgroup generated by the point of order 4 is of multiplicative type and j≠0, the inversion [−1] fixes the Drinfeld ℤ/4-structure, while over ℚ the problem is rigid. Hence Proposition 6.4(b)'s requirement that gcd(6,n) be invertible cannot be dropped in general.

**Hypotheses and conventions.**

- The two conditions (i) generic rigidity over ℚ and (ii) constant inertia {±1} on a dense open of the 𝔽₂-fibre.

**Proof plan.**

1. Reduce to the regular part of U and pass to an auxiliary odd level p∤n where the stack becomes a scheme; the coarse space of U\_{𝔽₂} is the quotient of a scheme by an action in which {±1} acts trivially, while the base change of the coarse space of U is computed from the rigid generic fibre, and the two differ (Česnavičius 2016, Theorem 2.1).
2. For Γ₁(4): over ℤ[1/2] the problem is rigid (Katz–Mazur 2.7.4); over the locus in characteristic 2 where the subgroup G of order 4 generated by α is of multiplicative type, the image of α(1) in G/G₂ generates G/G₂, which is the Frobenius kernel of E/G₂, and the scheme of generators of G/G₂ is the zero section, so α(1) lies in G₂ and 2·α(1)=0; hence [−1] preserves α (Theorem 3.2).

**Prerequisites.**

- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/fibrewise-coarse-base-change`](#r13-4a-fibrewise-coarse-base-change) (Coarse base change from the fibres over 𝔽_p)
- [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change) (Base change for coarse modular curves)
- [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure) (Local structure of coarse level curves)
- `SchemeAndStackFoundations:SF.1/keel-mori`

**Acceptance checks.**

- The same failure holds for Γ₁(4)∩Γ₀(4n) and for balanced Γ₁(4) (Česnavičius 2016, Theorems 4.2 and 5.2).

**Sources.**

- [`ces16cb`](https://arxiv.org/pdf/1608.01249), Theorem 2.1 and Remark 2.2, p.3; Theorem 3.2, p.5. Under the rigidity and constant-{±1}-inertia hypotheses the 𝔽₂ base change of the coarse map of 𝒳_H is not a coarse map, even on any fibrewise dense open; Γ₁(4) satisfies them.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Remark 6.6, p.64. For some H the invertibility of gcd(6,n) in Proposition 6.4(b) cannot be removed, e.g. Γ₁(4) over 𝔽₂.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/CoarseCurves`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-cartan-level-curves"></a>

### Cartan modular curves

**Construction** · `ModularCurvesPartII:R13.4a/cartan-level-curves` · planet: *Cartan modular curves*

Let ℓ be a prime and H̄⊂GL₂(𝔽_ℓ) a subgroup, with H⊂GL₂(Ẑ) its preimage. The coarse curve X_H is a normal projective curve over ℤ, smooth over ℤ[1/ℓ], of degree [GL₂(𝔽_ℓ):±H̄] over ℙ¹_ℤ, with cyclotomic base ℤ when det H̄=𝔽_ℓ^×. For the Cartan levels write X_s(ℓ)=X\_{C_s(ℓ)}, X_s⁺(ℓ)=X\_{C_s⁺(ℓ)}, X_ns(ℓ)=X\_{C_ns(ℓ)}, X_ns⁺(ℓ)=X\_{C_ns⁺(ℓ)}, of degrees ℓ(ℓ+1), ℓ(ℓ+1)/2, ℓ(ℓ−1) and ℓ(ℓ−1)/2 for ℓ odd. Over ℤ[1/ℓ], a level-C_s⁺(ℓ) structure on E is an unordered pair of distinct subgroups of order ℓ (equivalently a split Cartan subalgebra 𝔽_ℓ×𝔽_ℓ of End(E[ℓ])), a level-C_s(ℓ) structure an ordered such pair, a level-C_ns⁺(ℓ) structure a subalgebra of End(E[ℓ]) étale locally conjugate to 𝔽\_{ℓ²}, and a level-C_ns(ℓ) structure such a subalgebra with a chosen isomorphism to 𝔽\_{ℓ²}. The ordered split Cartan curve is identified with X₀(ℓ²) over ℤ[1/ℓ] by (E,C₁,C₂)↦(E/C₁, [ℓ]⁻¹(C₂)/C₁), and X_s⁺(ℓ) with X₀(ℓ²)/⟨w\_{ℓ²}⟩, over ℚ by split-cartan-quotient and over ℤ[1/ℓ] because the ordered identification carries the exchange of C₁ and C₂ to w\_{ℓ²}. Every other subgroup of GL₂(𝔽_ℓ), for example the preimage of an exceptional S₄⊂PGL₂(𝔽₁₃), gives its curve by the same construction. Notation: X_s(ℓ) is the ordered (diagonal) curve as in Zywina; Balakrishnan–Dogra–Müller–Tuitman–Vonk and the node split-cartan-quotient write X_s(ℓ) for the normaliser curve, which is X_s⁺(ℓ) here.

**Hypotheses and conventions.**

- ℓ prime; ℓ odd for the nonsplit Cartan description with a nonsquare ε, ℓ=2 using the order-3 subgroup.
- The moduli descriptions hold over ℤ[1/ℓ]; over ℤ the curve is defined as X_H.

**Proof plan.**

1. Apply deligne-rapoport-level-stack and integral-coarse-curves to the preimage H.
2. Degrees from coarse-degree-and-cusp-divisor and the orders of the Cartan subgroups (level-subgroups); −I lies in each Cartan subgroup, so projective index equals index.
3. Moduli: a frame orbit φH̄ is determined by the subalgebra φAφ⁻¹⊂End(E[ℓ]) with A the Cartan algebra, since frames with the same subalgebra differ by an element of the normaliser of A^×; for C_s this subalgebra is the pair of eigenlines.
4. The ordered split Cartan identification: from complementary lines C₁,C₂, the quotient E/C₁ carries the cyclic subgroup [ℓ]⁻¹(C₂)/C₁ of order ℓ²; conversely a cyclic K of order ℓ² on E′ gives E=E′/K[ℓ] with C₂=K/K[ℓ] and C₁ the kernel of the dual isogeny; both are inverse on the elliptic opens over ℤ[1/ℓ], and they extend to the normal compactifications by finite-normal-recognition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.cartanCurve` | constructor | X_H for a subgroup H̄⊂GL₂(𝔽_ℓ), and the four abbreviations X_s, X_s⁺, X_ns, X_ns⁺. |
| `TauCeti.ModularCurves.cartanCurve_degree` | characterisation | The j-degree of X_s, X_s⁺, X_ns, X_ns⁺ is ℓ(ℓ+1), ℓ(ℓ+1)/2, ℓ(ℓ−1), ℓ(ℓ−1)/2 for ℓ odd. |
| `TauCeti.ModularCurves.cartanCurve_moduli` | characterisation | Over ℤ[1/ℓ], level-Cartan structures are the Cartan subalgebras of End(E[ℓ]) of the given type, ordered for C_s and C_ns. |
| `TauCeti.ModularCurves.splitCartanCurve_iso_gammaZero` | equivalence | X_s(ℓ)≅X₀(ℓ²) over ℤ[1/ℓ] by (E,C₁,C₂)↦(E/C₁,[ℓ]⁻¹(C₂)/C₁); it is not an isomorphism over the j-line. |
| `TauCeti.ModularCurves.cartanCurve_cusps` | characterisation | Cusp counts and fields: X_s⁺(ℓ) has one rational cusp and (ℓ−1)/2 cusps over ℚ(ζ_ℓ)⁺; X_ns⁺(ℓ) has (ℓ−1)/2 cusps over ℚ(ζ_ℓ)⁺ and none rational. |
| `TauCeti.ModularCurves.cartanCurve_quotient` | relation | X_s⁺(ℓ)=X_s(ℓ)/(ℤ/2), the involution swapping the two lines (coarse-level-quotients). |

**Unit tests.**

- `TauCeti.ModularCurves.cartanCurve_splitPlus_thirteen_degree` (computation): X_s⁺(13) has degree 91 and X_ns⁺(13) degree 78 over ℙ¹_j.
- `TauCeti.ModularCurves.cartanCurve_split_two` (degenerate): For ℓ=2, C_s(2) is trivial and X_s(2)=X(2), of degree 6.
- `TauCeti.ModularCurves.cartanCurve_ordered_not_plus` (non-example): The ordered split Cartan curve X_s(ℓ) has degree ℓ(ℓ+1), twice that of X_s⁺(ℓ) (182 against 91 for ℓ=13), and two rational cusps instead of one; it is not the normaliser curve.
- `TauCeti.ModularCurves.cartanCurve_nonsplitPlus_cusps` (characterisation): X_ns⁺(13) has six cusps, permuted transitively by Gal(ℚ(ζ₁₃)⁺/ℚ).

**Uses.**

- EffectiveDiophantineMethods ED.6 and BDMTV 2019: the curves X_s⁺(13), X_ns⁺(13) and the exceptional S₄ curve at 13 and their rational points
- EllipticCurveModularityImaginaryQuadratic IQ.4: the Cartan curves used in the switching arguments of Caraiani–Newton §7
- this layer, coarse-rational-points: rational points of Cartan curves classify elliptic curves with image in a Cartan normaliser
- R13.5 split-cartan-semistable-model: the integral split Cartan quotient whose semistable model is computed

**Prerequisites.**

- [`R13.4a/level-subgroups`](#r13-4a-level-subgroups) (Open level subgroups and the standard levels)
- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor) (Degree of the j-map and the cusp divisor)
- [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level) (Cusps of X_H away from the level)
- [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure) (The cyclotomic structure of X_H)
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.4a/split-cartan-quotient`](#r13-4a-split-cartan-quotient) (The split Cartan normalizer quotient)
- [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change) (Base change for coarse modular curves)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`

**Consumers in this roadmap.** [`R13.4a/coarse-rational-points`](#r13-4a-coarse-rational-points)

**Acceptance checks.**

- X_s(ℓ) has ℓ+1 cusps, all of width ℓ: two ℚ-rational and ℓ−1 conjugate over ℚ(ζ_ℓ); X_s⁺(ℓ) has (ℓ+1)/2 cusps, one ℚ-rational (the common image of 0 and ∞ of X₀(ℓ²)) and (ℓ−1)/2 conjugate over ℚ(ζ_ℓ)⁺.
- X_ns⁺(ℓ) has (ℓ−1)/2 cusps, all conjugate over ℚ(ζ_ℓ)⁺, so no ℚ-rational cusp for ℓ≥5.
- For ℓ=13, X_s⁺(13), X_ns⁺(13) and the exceptional S₄ curve have degrees 91, 78 and 91 over the j-line.

**Sources.**

- [`zywina15`](https://arxiv.org/pdf/1508.07660), §1, Notation, p.2 (Cartan groups); §3.2, p.15; §3.3, Lemma 3.6, p.16. Split and nonsplit Cartan subgroups and normalisers, the curves X_G with their degree [GL₂:G], and the identification of X₀(N²) with the split Cartan curve X_s(N) by f(τ)↦f(τ/N).
- [`ces17`](https://arxiv.org/pdf/1511.07475), §6.1, p.62; Proposition 6.4(a), p.63. For any open H the coarse X_H is a normal projective curve over ℤ, finite locally free over ℙ¹_ℤ and smooth over ℤ[1/n].
- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1, p.887; §6, p.926; §6.3, pp.929–930. X_s(ℓ) there denotes X(ℓ)/C_s(ℓ)⁺, the normaliser curve, well defined up to ℚ-isomorphism; it is ℚ-isomorphic to X₀(ℓ²)/w\_{ℓ²} by conjugation with diag(ℓ,1), has genus 3 for ℓ=13, and Baran's plane quartic model is used for its rational points.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/SpecialLevels`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-coarse-rational-points"></a>

### Rational points of X_H and Galois images

**Theorem** · `ModularCurvesPartII:R13.4a/coarse-rational-points`

Let H be an open level subgroup with −I∈H̄, n with Γ(n)⊂H, and K a field of characteristic not dividing n. If E/K is an elliptic curve whose mod-n image ρ̄\_{E,n}(G_K)⊂GL₂(ℤ/n), computed in some frame, is conjugate into H̄, then j(E) is the image of a K-point of Y_H. Conversely, if x∈Y_H(K) has j(x)∉{0,1728} (j(x)≠0 when char K∈{2,3}), then every elliptic curve E/K with j(E)=j(x) has ρ̄\_{E,n}(G_K) conjugate into H̄. Without −I∈H̄ the converse holds for a suitable quadratic twist of E only; at j=0 or 1728 a K-point need not come from a curve with image in H̄. For H=C_s⁺(ℓ) or C_ns⁺(ℓ) this gives the correspondence between non-cuspidal rational points of X_s⁺(ℓ), X_ns⁺(ℓ) with j∉{0,1728} and elliptic curves over ℚ with image in the Cartan normaliser, with no twist. In particular the fibres of X_s⁺(13) over j=0 and j=1728 contain ℚ-points, coming from y²=x³+1 and y²=x³−x, whose mod-13 images lie in a split Cartan normaliser because 13 splits in ℚ(√−3) and in ℚ(i).

**Hypotheses and conventions.**

- −I∈H̄ for the converse without twist; char K∤n; j(x)∉{0,1728}.

**Proof plan.**

1. The coarse map is bijective on K̄-points (SchemeAndStackFoundations SF.1 coarse-moduli-space) and Gal(K̄/K)-equivariant, so x∈Y_H(K) is a Galois-stable isomorphism class of pairs (E\_{K̄},φH̄).
2. Given E/K with j(E)=j(x)∉{0,1728}, Aut(E\_{K̄})={±1} (Tau Ceti WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq); stability means σ(φ)H̄=±φH̄=φH̄ for every σ, using −I∈H̄, i.e. φ⁻¹∘σ∘φ=ρ̄\_{E,n}(σ)∈H̄ in the frame φ.
3. Conversely, if ρ̄(G_K)⊂gH̄g⁻¹ in a frame φ, the class (φg)H̄ is Galois-stable, hence a K-point of the finite étale scheme Isom/H̄ (Galois descent for finite étale schemes, upstream 0D), i.e. a K-point of the stack Y_H over j(E), which maps to a K-point of Y_H.
4. Without −I∈H̄, stability up to ±1 defines a quadratic character by which E must be twisted.
5. For j=0,1728 the larger automorphism group allows Galois-stable classes not realised by a K-rational structure on any curve with that j-invariant; CM points are therefore checked separately, here by the splitting of 13 in the CM fields.

**Prerequisites.**

- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification) (The elliptic opens are the Katz–Mazur level problems)
- [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure) (Local structure of coarse level curves)
- [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves) (Cartan modular curves)
- `SchemeAndStackFoundations:SF.1/coarse-moduli-space`
- `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`
- `tauceti:WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`

**Acceptance checks.**

- E: y²=x³−x has CM by ℤ[i] and 13=(3+2i)(3−2i), so ρ̄\_{E,13}(G_ℚ) lies in the normaliser of the split Cartan with eigenlines E[3+2i] and E[3−2i], complex conjugation exchanging them: the j=1728 fibre of X_s⁺(13) has a ℚ-point.
- An elliptic curve over ℚ with a rational 7-isogeny gives a ℚ-point of X₀(7) over its j-invariant.

**Sources.**

- [`zywina15`](https://arxiv.org/pdf/1508.07660), Proposition 3.3, p.15; proof in §3.5, pp.17–19. For G containing −I with surjective determinant and E/ℚ with j_E∉{0,1728}, ρ\_{E,N}(G_ℚ) is conjugate into G if and only if j_E∈π_G(X_G(ℚ)).
- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1, pp.887–888, Theorem 1.2. The rational points of the normaliser-of-split-Cartan curve decide which non-CM elliptic curves over ℚ have mod-ℓ image in a split Cartan normaliser; for ℓ=13 there are none.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/SpecialLevels`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-atkin-lehner-quotient-curves"></a>

### Atkin–Lehner quotient curves X₀⁺(N)

**Construction** · `ModularCurvesPartII:R13.4a/atkin-lehner-quotient-curves`

For N≥2 let w_N be the Fricke involution of X₀(N)_ℚ (R14.1 exact-divisor-atkin-lehner with d=N), extended to an involution of the normal ℤ-curve X₀(N) as in the proof. Define X₀⁺(N):=X₀(N)/⟨w_N⟩, the quotient of the projective normal ℤ-curve X₀(N) by the group of order two. It is a normal projective ℤ-curve, flat with fibres of pure dimension one, smooth over ℤ[1/N], with a finite surjective quotient map π_N:X₀(N)→X₀⁺(N) of degree 2 whose formation commutes with flat base change and with base change to ℤ[1/2]-algebras. Over ℤ[1/N] its elliptic part is the coarse space of unordered pairs {φ,φ^∨} of mutually dual cyclic N-isogenies. The j-map of X₀(N) does not descend: the functions j+j∘w_N and j·(j∘w_N) do, and the map X₀⁺(N)→ℙ¹ they define with the modular polynomial is not the j-line. For N=ℓ² it is X_s⁺(ℓ) (split-cartan-quotient).

**Hypotheses and conventions.**

- N≥2; w_N as in R14.1 on X₀(N)_ℚ, extended to X₀(N) over ℤ in the first proof step.
- Base change beyond flat and ℤ[1/2]-algebras is not asserted.

**Proof plan.**

1. Extension of w_N over ℤ: Φ_N is monic of degree ψ(N) in each variable and symmetric (modular-polynomial), so the closure in ℙ¹_ℤ×ℙ¹_ℤ of the image of (j,j′) meets j′=∞ only over j=∞ and is finite over ℙ¹_ℤ by either projection. Hence the normalization of ℙ¹_ℤ×ℙ¹_ℤ in Y₀(N)_ℚ is finite and normal over ℙ¹_ℤ via j and via j′=j∘w_N, so it is X₀(N) for both projections (finite-normal-recognition), and the involution of ℙ¹×ℙ¹ exchanging the factors, which w_N covers on Y₀(N)_ℚ, extends w_N to X₀(N) by functoriality of relative normalization (Stacks 035J).
2. X₀(N) is projective, so ⟨w_N⟩-orbits lie in affine opens; the geometric quotient exists and π_N is finite surjective of degree 2 (SchemeAndStackFoundations SF.1 finite-group-quotient).
3. Normality and flatness pass to the invariant rings; smoothness over ℤ[1/N] of the quotient of a smooth relative curve by a finite group holds without invertibility of the order (upstream 9D, smoothness of finite quotients, applied on invariant affine opens).
4. Invariants commute with flat base change and with base change on which 2 is invertible.
5. Moduli over ℤ[1/N]: w_N sends (E,C) to (E/C,E[N]/C), i.e. φ to its dual up to the identification of E/C, so orbits are unordered dual pairs.
6. Symmetric functions of j and j∘w_N are invariant; j itself is not, since w_N swaps j and j′ and j≠j′ on the generic fibre.

**Assembly note.** The involution w_N is constructed in R14.1 over ℚ (over ℤ[1/N] for prime N≥5); the first proof step extends it to the normal ℤ-curve X₀(N) using the symmetry of Φ_N and the recognition criterion, so the R14.1 citation is an input on the generic fibre only.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.gammaZeroPlus` | constructor | X₀⁺(N)=X₀(N)/⟨w_N⟩ with its quotient map. |
| `TauCeti.ModularCurves.gammaZeroPlus.quotientMap` | projection | π_N:X₀(N)→X₀⁺(N), finite surjective of degree 2 and w_N-invariant. |
| `TauCeti.ModularCurves.gammaZeroPlus.lift` | universal-property | Every w_N-invariant morphism from X₀(N) to a scheme factors uniquely through π_N. |
| `TauCeti.ModularCurves.gammaZeroPlus.smooth` | structure | X₀⁺(N) is smooth over ℤ[1/N]. |
| `TauCeti.ModularCurves.gammaZeroPlus.baseChange` | functoriality | Formation commutes with flat base change and with base change to ℤ[1/2]-algebras. |
| `TauCeti.ModularCurves.gammaZeroPlus.symmetricJ` | other | j+j∘w_N and j·(j∘w_N) descend to X₀⁺(N); j does not. |

**Unit tests.**

- `TauCeti.ModularCurves.gammaZeroPlus_square` (compatibility): gammaZeroPlus ℓ² ≅ X_s⁺(ℓ) over ℚ (split-cartan-quotient).
- `TauCeti.ModularCurves.gammaZeroPlus_cusps` (computation): For a prime p, w_p exchanges the two cusps 0 and ∞ of X₀(p), so X₀⁺(p) has exactly one cusp, and it is ℚ-rational.
- `TauCeti.ModularCurves.gammaZeroPlus_noJ` (non-example): j does not factor through π_N: for N=2 the values j(E) and j(E/C) differ for a generic pair.
- `TauCeti.ModularCurves.gammaZeroPlus_one` (degenerate): For N=1 the Fricke map is the identity, so the quotient is X₀(1)=ℙ¹_ℤ and π₁ has degree 1, not 2; this is why the construction is stated for N≥2.

**Uses.**

- EffectiveDiophantineMethods ED.6: the genus-3 curves X₀⁺(p) for p∈{97,109,113,127,139,149,151,179,239} and their rational points
- R13.5 split-cartan-semistable-model: the quotient X₀(ℓ²)/w\_{ℓ²} whose semistable model is computed

**Prerequisites.**

- [`R14.1/exact-divisor-atkin-lehner`](#r14-1-exact-divisor-atkin-lehner) (Exact-divisor Atkin–Lehner operators) *(later layer R14.1)*
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.4a/split-cartan-quotient`](#r13-4a-split-cartan-quotient) (The split Cartan normalizer quotient)
- [`R13.4a/modular-polynomial`](#r13-4a-modular-polynomial) (The cyclic modular polynomial)
- [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients) (Coarse curves as quotients)
- `SchemeAndStackFoundations:SF.1/finite-group-quotient`
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`
- [`R13.4a/finite-normal-recognition`](#r13-4a-finite-normal-recognition) (Recognising a relative normalization)

**Acceptance checks.**

- X₀⁺(ℓ²)≅X_s⁺(ℓ) over ℚ; for ℓ=13 it has genus 3.
- π_N has degree 2 and its fixed points over ℚ̄ are CM points (their count is a class-number formula in R13.4b).

**Sources.**

- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6, p.926; proof of Theorem 6.6, p.929. X₀⁺(ℓ²), the quotient of X₀(ℓ²) by w\_{ℓ²}, is ℚ-isomorphic to the normaliser-of-split-Cartan curve, and the quotient of a semistable model by w\_{ℓ²} is used for it.
- [`gz86`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I, §1, p.226. Over a field of characteristic zero the points of X₀(N) are cyclic N-isogenies of (generalized) elliptic curves, and the function field is ℚ(j,j′) with Φ_N(j,j′)=0.
- [`tc-modularcurves`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9D, smoothness of finite quotients. A finite quotient of a smooth affine relative curve over a regular base is a smooth relative curve, without invertibility of the group order.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/SpecialLevels`, namespace `TauCeti.ModularCurves`.

<a id="r13-4a-proper-rigidifying-covers"></a>

### Proper rigidifying covers and coherent finiteness

**Theorem** · `ModularCurvesPartII:R13.4a/proper-rigidifying-covers`

Let m=m₁m₂ with coprime m₁,m₂≥3. Then 𝒳\_{Γ(m)} is a projective ℤ-scheme and its contraction to X(1) is representable, finite and locally free of rank |GL₂(ℤ/m)|. For every open level subgroup H the fibre product P_H:=𝒳_H×\_{X(1)}𝒳\_{Γ(m)} is a projective ℤ-scheme with a finite locally free surjection p:P_H→𝒳_H of rank |GL₂(ℤ/m)|, equivariant for GL₂(ℤ/m) acting on the second factor. Consequently: (a) for every quasi-coherent sheaf F on 𝒳_H, H⁰(𝒳_H,F) is the equaliser of the two pullback maps from H⁰(P_H,p\*F) to the sections over P_H×\_{𝒳_H}P_H, and, when F is locally free, it is H⁰(P_H,p\*F)^{GL₂(ℤ/m)}, because p is finite locally free, a GL₂(ℤ/m)-torsor over the elliptic locus over ℤ[1/m], and 𝒳_H is normal; p is not a torsor over all of 𝒳_H[1/m], being ramified along the cusps; (b) for coherent F, H⁰(𝒳_H,F) is a finitely generated ℤ-module whose formation commutes with flat base change ℤ→A, and over ℤ[1/m] every H^i(𝒳_H,F) is finitely generated over ℤ[1/m]; (c) for every ring A, a section of F over 𝒳_H⊗A is the same as a section of p\*F over P_H⊗A whose two pullbacks agree (effective descent along the finite locally free p). No descent of F to the coarse space X_H is asserted: ω^{⊗k} for odd k and stabilisers acting nontrivially do not descend.

**Hypotheses and conventions.**

- m₁,m₂≥3 coprime; F quasi-coherent, coherent for finiteness.
- The invariant description of sections is for locally free F; over ℤ the equaliser is used for quasi-coherent F. Higher coherent cohomology over ℤ is not asserted here.

**Proof plan.**

1. 𝒳\_{Γ(m)} is a projective scheme because m is not of the form p^s or 2p^s (standard-level-stack-identifications), and its contraction to X(1) is representable finite locally free of rank |GL₂(ℤ/m)| (Česnavičius Proposition 4.3.4 with n=1).
2. P_H is finite over the projective scheme 𝒳\_{Γ(m)} because 𝒳_H→X(1) is representable and finite, so P_H is a projective scheme; p is the base change of 𝒳\_{Γ(m)}→X(1).
3. (a),(c): fpqc descent of quasi-coherent sheaves and their sections along the finite locally free surjection p (SchemeAndStackFoundations SF.1 qcoh-fpqc-descent, stack-quasi-coherent).
4. (b): H⁰(𝒳_H,F) is a submodule of the finitely generated H⁰(P_H,p\*F) on a projective ℤ-scheme, and an equaliser of flat-base-change-compatible modules; for every i, H^i(𝒳_H,F) is the abutment of the descent spectral sequence of the finite locally free cover p, with E₁ terms the coherent cohomology of the (a+1)-fold fibre products of P_H over 𝒳_H, which are projective schemes finite over P_H; only finitely many terms contribute to each degree, so H^i(𝒳_H,F) is finitely generated (requested from SchemeAndStackFoundations SF.1).
5. Invariants: P_H is flat over 𝒳_H (base change of 𝒳\_{Γ(m)}→X(1)) and GL₂(ℤ/m) acts on it over 𝒳_H through 𝒳\_{Γ(m)}; over the elliptic locus over ℤ[1/m] it is the GL₂(ℤ/m)-torsor of frames (level-h-structures), so (p_\*𝒪\_{P_H})^{GL₂(ℤ/m)} is a finite torsion-free 𝒪\_{𝒳_H}-algebra equal to 𝒪\_{𝒳_H} on a dense open, hence equal to 𝒪\_{𝒳_H} by normality, and (p_\*p\*F)^{GL₂(ℤ/m)}=F for F locally free. Along the cusps p is ramified (index m in the q-expansion charts of R13.3 formal-level-cusp-charts), so X(1)[1/m] is not [X(m)[1/m]/GL₂(ℤ/m)] (that quotient is Ell_m[1/m]).

**Prerequisites.**

- [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications) (The standard levels: moduli stacks as normalizations)
- [`R13.4a/level-stack-geometry`](#r13-4a-level-stack-geometry) (Geometry of the level-H stacks)
- [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack) (The Deligne–Rapoport level-H stack)
- `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`
- `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`
- [`R13.4a/level-h-structures`](#r13-4a-level-h-structures) (Level-H structures away from the level)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- `SchemeAndStackFoundations:SF.1`

**Acceptance checks.**

- For H=Γ₀(N), weight-k modular forms of level Γ₀(N) over ℤ form a finitely generated ℤ-module, computed as the GL₂(ℤ/m)-invariants of H⁰(P_H,p\*ω^{⊗k}) on a projective ℤ-scheme.
- Over ℤ the sheaf ω on X(1) has H⁰=0, since −1 acts on it by −1 and H⁰ is torsion-free; over 𝔽₂ the Hasse invariant is a nonzero section of ω, so H⁰ does not commute with the non-flat base change ℤ→𝔽₂. ω is a line bundle on the stack that does not come from ℙ¹_ℤ.

**Sources.**

- [`ces17`](https://arxiv.org/pdf/1511.07475), Proposition 4.3.4, p.38; Proposition 4.3.6, p.39. The contraction X(nm)→X(n) is representable finite locally free of rank #GL₂(ℤ/nm)/#GL₂(ℤ/n); X(n) is a projective scheme unless n=p^s or 2p^s.
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.2.1(2) and Remark 4.2.2, pp.35–36. For enough level the moduli stacks are schemes and coincide with the Katz–Mazur projective schemes; for d|N with d≥3 invertible the full-level stack is a scheme with ample boundary.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/LevelStack`, namespace `TauCeti.ModularCurves`.

<a id="r13-4b"></a>

## R13.4b. Generic-fibre and correspondence compatibility

Compare the algebraically constructed curves and maps with the analytic models. Components, completed cusp parameters and the maps themselves are compared before their actions on forms and cohomology; the full and cyclic normalization choices survive every comparison. This layer uses R12.3 and R12.6 and the algebraic correspondences of R14.1.

<a id="r13-4b-generic-component-comparison"></a>

### Generic components and cusp fields

**Comparison** · `ModularCurvesPartII:R13.4b/generic-component-comparison`

After the algebraic construction, use R12.3/R12.6 to identify each generic-fibre component of X_H with the compactified analytic quotient for its determinant orbit. For honest full level n over ℚ the constant algebra is the cyclotomic determinant algebra; fixed pairing over ℚ(ζ_n) selects a component. A subgroup H descends these components by its determinant image. Identify the cusp residue fields and smoothing parameters from R13.3’s cyclotomic charts with the rational boundary points and widths in the analytic quotient. On the scalar-framed prime-p quotient, determinant classes modulo squares give exactly two complex components. No analytic comparison is used to construct X_H.

**Proof plan.**

1. Apply the earlier component and uniformization theorem to the independently constructed normal curves.
2. Identify generic formal parameters and residue fields using the Tate charts, including conjugation in d≤2 charts.
3. Descend using the specified determinant action, rather than imposing geometric connectedness on full level.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons) (Coarse normalization comparisons)
- [`R13.3/gamma-one-twisted-tate-chart`](#r13-3-gamma-one-twisted-tate-chart) (Twisted Tate charts for Γ₁)
- [`R13.4a/projective-scalar-coarse-quotient`](#r13-4a-projective-scalar-coarse-quotient) (Projective scalar level quotients)
- [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization) (Compact analytic–algebraic modular comparison)
- [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement) (Tate and analytic cusp parameters)
- [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels) (Cusp fields and pairing components)
- [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent) (Canonical generic models and coefficient descent)
- [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent) (Component fields and symplectic descent)
- [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility) (Generic base change and level compatibility)

**Consumers in this roadmap.** [`R13.4b/compactified-map-comparison`](#r13-4b-compactified-map-comparison); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences)

**Acceptance checks.**

- Full level 5: four complex components before scalars, two after scalars, one after fixing an honest primitive pairing.

**Sources.**

- [`bt16`](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.1, pp.713–714. The scalar quotient has two determinant-square-class components.
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.3, Theorems 4.3.4 and 4.3.6–4.3.7, pp.38–42. Cyclotomic formal cusp fields and parameters fix the integral-to-generic comparison.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4b-compactified-map-comparison"></a>

### Compactified map comparison

**Comparison** · `ModularCurvesPartII:R13.4b/compactified-map-comparison`

The compactified forgetful and quotient isogeny maps constructed algebraically agree under the generic-fibre comparison with their classical analytic degeneracy maps. On a Γ₁(N;p) chart, π₁ forgets the p-subgroup and π₂ quotients by it then contracts to the allowed level polygon. The generic analytic conventions are π₁(z)=z and π₂(z)=pz on the chosen standard branch. At every cusp compare the induced homomorphism of completed rings and the pullback of du/u. A map to a coarse curve factors by categorical universality, but finite flat stack legs do not automatically become finite flat coarse legs; descent uses the actual stabilizer action or a schematic locus where it is trivial.

**Proof plan.**

1. Identify both maps on the elliptic dense open through the moduli quotient.
2. Use generalized Tate charts and contraction for the boundary maps; retain the power factor on invariant differentials.
3. Separate categorical existence of coarse maps from the finite-flat descent claim; use the finite-correspondence supplier and schematic locus when needed.

**Assembly note.** The algebraic degeneracy maps compared here are constructed in [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) directly from R13.2 and R13.4a; their comparison with the analytic maps is this target, so the later-layer citation is not a cycle.

**Prerequisites.**

- [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison) (Generic components and cusp fields)
- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps) *(later layer R14.1)*
- `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`
- `AlgebraicModuliForArithmeticGeometry:R09.5/tame-finite-flat-descent`

**Consumers in this roadmap.** [`R13.4b/hecke-normalization-comparison`](#r13-4b-hecke-normalization-comparison)

**Acceptance checks.**

- The two legs have different j coordinates. Extension is not obtained by pretending that π₂ is a map over the same j-line.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46. The stack degeneracy maps are finite flat, including the boundary quotient construction.
- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §§5.1–5.2, pp.65–66,71–72. Analytic and algebraic moduli descriptions fix the two maps and their normalization.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-4b-hecke-normalization-comparison"></a>

### Hecke normalization and descent

**Comparison** · `ModularCurvesPartII:R13.4b/hecke-normalization-comparison` · also realises R13.4

On characteristic-zero fibres the geometric pull–trace correspondences agree with the earlier classical Hecke action, with the differential factor of the universal isogeny included. For weight k, the finite-flat coherent trace is pT_p, not T_p; integrality of its division by p is a separate local theorem. For Picard and étale cohomology the action is the integral push–pull of the correspondence without division by its degree. The full-subgroup A_m and cyclic C_m have their separate degrees and repeated-prime relations. These identifications descend to the field of definition with the diamond and cyclotomic Atkin–Lehner conventions fixed.

**Proof plan.**

1. Compare the classical formula on the Tate cusp and use the imported analytic q-expansion determination.
2. Use finite-flat trace, rather than a sum over distinct points, on ramified/inseparable charts.
3. Descend the maps with their actual cyclotomic data and distinguish the two correspondence conventions.

**Prerequisites.**

- [`R13.4b/compactified-map-comparison`](#r13-4b-compactified-map-comparison) (Compactified map comparison)
- [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions) *(later layer R14.1)*
- [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences) (Full and cyclic isogeny correspondences) *(later layer R14.1)*
- [`R14.1/coherent-hecke-trace`](#r14-1-coherent-hecke-trace) (Integral coherent Hecke trace) *(later layer R14.1)*

**Acceptance checks.**

- For weight 2 at p∤N, the normalized coefficient formula is a_n(T_pf)=a_(np)(f)+p a_(n/p)(⟨p⟩f); the unnormalized coherent trace has an extra factor p.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, Theorem 4.5.1 and Example 4.5.3, pp.46–48. The geometric trace gives pT_p and the integral normalized operator is derived locally.
- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–68; §5.2, pp.71–72. The geometric cohomological upper/lower conventions and comparison are explicit.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

At full level 5 there are four determinant components over ℂ. Scalar change of frame multiplies determinants by squares, giving two components; fixing a primitive pairing selects one honest component. A comparison that declares all three models connected fails this example. For a cusp with parameter t=q^(1/d), check the actual homomorphism on t and the factor in du/u; equal generic degrees do not identify the two degeneracy legs.

<a id="r13-5"></a>

## R13.5. Bad fibres and regular/semistable models

Compute the bad fibres. Write down the local modular equations and their finite stabilizer actions, then apply the regular-resolution and semistable algorithms of StableReduction. Fine rigidified geometry with one factor p in the level is kept separate from wild coarse descent at 2 and 3. The prime-square calculation gives its stated nodal extension and no formula for higher prime powers is inferred from it. The cases are exactly those the Serre weight and level arguments of SerreWeightAndLevelOptimisation and the intersection theory of GrossZagierAndArithmeticHeights invoke; the finite case list is at the end of this document.

<a id="r13-5-igusa-components"></a>

### Igusa components of modular fibres

**Construction** · `ModularCurvesPartII:R13.5/igusa-components` · planet: *Igusa curve*

Over a perfect field k of characteristic p, an Igusa pʳ structure on an ordinary elliptic curve E with prescribed prime-to-p level is a Drinfeld generator of ker(Vʳ:E^(pʳ)→E). On the ordinary locus ker Vʳ is étale cyclic of rank pʳ, so its generator cover has degree φ(pʳ) before the effective residual automorphism quotient. Compactify by normalizing the corresponding level curve in this generator cover. Keep the auxiliary rigidifying level when discussing ±1 and other automorphisms; Ig(p)/±1 and Ig(p)/C₄ in Edixhoven/BDMTV denote effective quotient level problems, not two arbitrary additional quotients of an already coarse curve. Γ₀ p-power mixed components, and the middle components after the p² extension, are identified with the relevant descended Igusa problems. Smoothness, ramification at supersingular points and small-p behavior are assertions proved by the local models, not part of a definition of an ordinary cover.

**Proof plan.**

1. Define the ordinary generator cover using imported relative V and Drinfeld cyclicity.
2. Normalize its compactification and descend along the actual auxiliary level and effective automorphism action.
3. Use the p² local model below to compare the descended middle components.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.igusaCover` | constructor | The ordinary Verschiebung-generator cover with auxiliary prime-to-p level. |
| `TauCeti.ModularCurves.igusaCover_degree` | simp | Its degree before stabilizer quotient is φ(pʳ). |
| `TauCeti.ModularCurves.igusaCurve` | constructor | The normal compactification in the Igusa generic function field. |
| `TauCeti.ModularCurves.igusaCurve_effectiveQuotient` | compatibility | The quotient preserves the specified moduli problem and its residual effective action. |
| `TauCeti.ModularCurves.igusaCurve_localModel` | compatibility | The local generator ring identifies with the component chart from the universal cyclic deformation calculation. |

**Unit tests.**

- `TauCeti.ModularCurves.igusaCover_firstLevel` (computation): For p=5,r=1 a rigidified ordinary generator cover has degree 4, and the M=1 sign-class cover has degree 2.
- `TauCeti.ModularCurves.igusaCover_heightZero` (degenerate): r=0 gives the trivial generator problem, not a φ(1)=0 cover.
- `TauCeti.ModularCurves.igusaCover_supersingular` (non-example): The étale-generator description on ordinary curves is not an étale cover at a supersingular point.

**Uses.**

- R20.3: Provides the geometric Igusa/Frobenius inputs for local weight calculations, not the residual Galois theorem.
- BDMTV Theorem 6.6: Identifies the two vertical Igusa/C₄ components.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity) (Drinfeld structures on the smooth locus)
- `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`
- `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`

**Consumers in this roadmap.** [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model); [`R13.5/prime-square-semistable-model`](#r13-5-prime-square-semistable-model)

**Acceptance checks.**

- For M=1 and p>3, the ordinary generator classes up to sign have generic degree (p−1)/2; an auxiliary rigidifier changes how this quotient is presented.

**Sources.**

- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3, pp.34–35; §2.1, pp.55–56. The cyclic-component and p² semistable descriptions use auxiliary-level Igusa moduli.
- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, p.928; Theorems 6.5–6.6, pp.928–929. Igusa is defined through Verschiebung and the middle-component quotients are specified.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-5-gamma-zero-prime-power-local-model"></a>

### Γ₀ prime-power local models

**Theorem** · `ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model` · planet: *Prime-power local model*

Let p>3, n≥1 and M≥1 with p∤M. The Γ₀(pⁿM) coarse special fibre has n+1 components indexed (a,b), a+b=n, each abstractly X₀(M)_𝔽p, of multiplicity φ(p^min(a,b)). All meet at every supersingular Γ₀(M) point and nowhere else; this intersection is not claimed to be transverse for n>1. Under an étale auxiliary rigidifier the completed surface ring at a relevant noncuspidal point is W[[x,y]]/(f₀+p u), u a unit, where W=W(k̄). At a supersingular point f₀=(x^(pⁿ)−y)(x−y^(pⁿ))∏_(a+b=n,a,b>0)(x^(p^(a−1))−y^(p^(b−1)))^(p−1); on the ordinary mixed (a,b) component f₀=(x^(p^(a−1))−y^(p^(b−1)))^(p−1). These x,y are local moduli of source and target; the component-to-j maps may involve Frobenius. The all-N component/multiplicity statement extends to p=2,3 as the Katz–Mazur/Edixhoven cyclic-deformation target, but its wild invariant-ring/resolution calculation is the separate recorded gap.

**Proof plan.**

1. Express cyclic pⁿ-subgroups in the imported Drinfeld deformation of the elliptic curve and its isogeny; split by connected/étale type a,b.
2. Use the source/target deformation coordinates to obtain the displayed f₀ and unit p-term.
3. Descend the auxiliary rigidifier with its stabilizer action. Read multiplicities from f₀, retaining possible inseparable component maps.
4. At 2 or 3 keep the component target but do not apply the tame quotient criterion; the wild calculation is recorded as an unresolved input.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.5/igusa-components`](#r13-5-igusa-components) (Igusa components of modular fibres)
- `tauceti:TauCetiRoadmap/ModularCurves#7g-the-three-characteristic-p-calculations`
- [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity) (Drinfeld structures on the smooth locus)

**Consumers in this roadmap.** [`R13.5/corrected-coarse-singular-locus`](#r13-5-corrected-coarse-singular-locus); [`R13.5/tame-regular-resolution`](#r13-5-tame-regular-resolution); [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model)

**Acceptance checks.**

- n=1 gives two reduced components, local f₀=(xᵖ−y)(x−yᵖ).
- n=2 has multiplicities 1,p−1,1; for p=5 these are 1,4,1, so the coarse fibre is not reduced.

**Sources.**

- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3–1.1.5, pp.34–36. The component multiplicities and explicit f₀ deformation rings are stated before the tame invariant-ring resolution.
- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III §1, pp.254–255. The arbitrary-level component/multiplicity input is used for intersection theory; its regularity locus needs the correction below.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-5-corrected-coarse-singular-locus"></a>

### The corrected coarse singular locus

**Theorem** · `ModularCurvesPartII:R13.5/corrected-coarse-singular-locus`

For p>3, p∤M and n≥1, a noncuspidal point of the integral Γ₀(pⁿM) coarse surface is singular exactly when its elliptic pair has automorphisms beyond ±1 and it is either supersingular or lies on a mixed (a,b) component with a,b>0. Cusps are regular. The extra automorphism condition concerns the pair (E,C_M), not just the value j=0 or 1728. Ordinary points with a=0 or b=0 are smooth over ℤ_p. This corrects the supersingular-only exception in Gross–Zagier III Proposition (1.4); no identical criterion is claimed at p=2 or 3.

**Proof plan.**

1. Outside this locus an auxiliary quotient is étale or acts by pseudo-reflections on the regular deformation ring.
2. At the stated isolated extra-automorphism points compute the effective order-2 or order-3 action on the two local moduli; it is not generated by pseudo-reflections.
3. Apply the supplied tame invariant-ring criterion and the independent cusp regularity theorem.

**Prerequisites.**

- [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model) (Γ₀ prime-power local models)
- [`R13.4a/coarse-cusp-regularity`](#r13-4a-coarse-cusp-regularity) (Regularity at integral Γ₀ cusps)
- `AlgebraicModuliForArithmeticGeometry:R09.5`

**Consumers in this roadmap.** [`R13.5/tame-regular-resolution`](#r13-5-tame-regular-resolution)

**Acceptance checks.**

- At p=5,M=1,n=2 the ordinary j=1728 point on (1,1) is singular although it is not supersingular.

**Sources.**

- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3–1.1.5 and Theorem 1.1.4.1, pp.34–36; §§1.3.2–1.3.6, pp.39–46. The candidates are extra-automorphism supersingular or ordinary mixed points, and the explicit actions give the exact locus.
- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III Proposition (1.4), p.255. The printed exception omits ordinary mixed points; its statement is used only in the corrected form.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-5-tame-regular-resolution"></a>

### Regular resolutions of modular fibres

**Construction** · `ModularCurvesPartII:R13.5/tame-regular-resolution`

For p>3 and p∤M construct the minimal regular resolution of the Γ₀(pⁿM) coarse surface at p from the preceding local rings. Resolve the effective order-2/3 stabilizer action by equivariant blowups until each fixed point has pseudo-reflection cotangent action; take the tame quotient and contract the resulting exceptional −1 curves. For j=1728 the order-2 action on source/target parameters is (x,y)↦(−x,−y); one blowup yields a regular quotient with one exceptional rational curve of self-intersection −2. For j=0 supersingular and n even, the effective order-3 action has equal eigencharacters and one blowup gives one exceptional −3 curve. For j=0 supersingular and n odd, the eigencharacters are inverse; blow up the two remaining fixed points and contract the resulting −1 curve, leaving two exceptional −2 curves. Ordinary mixed points use the corresponding a>b,a=b,a&lt;b variants. Export every component’s multiplicity and intersections by total-transform valuations and F·C=0, not just the reduced incidence graph. General blowups, intersection theory and minimal-model contractions are StableReduction’s.

**Proof plan.**

1. Start with the explicit regular rigidified deformation ring and the effective stabilizer representation.
2. Substitute y=xv or x=yu in f₀+p u and compute valuations; repeat at the fixed points specified in §§1.3.2–1.3.6.
3. Take invariants only after pseudo-reflection regularity is verified; contract the indicated −1 curve in the order-3 inverse-character case.
4. Determine multiplicities and intersection matrix from the total transform and F·C=0; glue with the unchanged regular cusp and ordinary outer charts.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.modularRegularResolution` | constructor | The proper birational regular model with its identified generic fibre. |
| `TauCeti.ModularCurves.modularRegularResolution_exceptional` | projection | Its exceptional divisors have recorded genus, multiplicity, self-intersection and attachment maps. |
| `TauCeti.ModularCurves.modularRegularResolution_fibre` | compatibility | The total special fibre equals the pullback of the coarse fibre with computed valuations. |
| `TauCeti.ModularCurves.modularRegularResolution_minimal` | characterisation | No exceptional −1 curve over the resolved surface remains. |
| `TauCeti.ModularCurves.modularRegularResolution_baseChange` | functoriality | Flat unramified base change transports charts and the resolution; a ramified change requires normalization and a fresh regularity check. |

**Unit tests.**

- `TauCeti.ModularCurves.modularRegularResolution_noExtra` (degenerate): A regular point with trivial effective stabilizer is unchanged.
- `TauCeti.ModularCurves.modularRegularResolution_orderTwo` (computation): The effective −1 action on both parameters contributes one −2 exceptional component.
- `TauCeti.ModularCurves.modularRegularResolution_notSemistable` (non-example): For n=2,p=5 the regular model still has a component of multiplicity 4; regularity does not imply reduced semistability.

**Uses.**

- Gross–Zagier Chapter III: Provides the regular model and fibre intersection data.
- R13.6: Exports the labelled modular graph and component maps.

**Prerequisites.**

- [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model) (Γ₀ prime-power local models)
- [`R13.5/corrected-coarse-singular-locus`](#r13-5-corrected-coarse-singular-locus) (The corrected coarse singular locus)
- `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

**Consumers in this roadmap.** [`R13.5/prime-square-semistable-model`](#r13-5-prime-square-semistable-model); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs)

**Acceptance checks.**

- The resolution of the p=5 ordinary mixed j=1728 point contains a −2 rational exceptional curve; ignoring ordinary singularities misses it.

**Sources.**

- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §§1.3.1–1.3.6 and algorithm §1.4, pp.38–48. The local actions, blowup charts and exceptional configurations give the all-prime-power tame modular resolution algorithm.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-5-one-factor-mixed-level-model"></a>

### One-factor mixed-level models

**Theorem** · `ModularCurvesPartII:R13.5/one-factor-mixed-level-model` · planet: *Mixed-level semistable fibre*

For p∤M and M≥5, the compactified Γ₁(M)∩Γ₀(p) model over ℤ[1/M] has geometric fibre at p consisting of two copies of X₁(M)_𝔽p meeting at the supersingular Γ₁(M) points. On the fine rigidified locus the complete node equation is uv=p up to a unit, hence this is a regular semistable model. The components classify the Frobenius and Verschiebung choices and their maps to X₁(M) include the corresponding Frobenius/diamond transports. For Γ₀(Mp) remove the auxiliary rigidifier and use the tame or wild stabilizer quotient, resolving before using a semistable graph; a coarse extra-automorphism intersection can have higher thickness. For M&lt;5 retain the stack/rigidified statement and descend with the explicit stabilizer analysis, rather than asserting a fine scheme. The cases needed by R20 are listed in the reader, including p=2,3 with p∤M.

**Proof plan.**

1. Use the cyclic p-subgroup deformation on the fine prime-to-p curve to split the special fibre into Frobenius and Verschiebung components.
2. At a supersingular point the two local branches give the smoothing uv=p; retain the lower-level marking in the component maps.
3. Apply the coarse quotient/resolution separately when an effective stabilizer survives; small-level/wild descent belongs to the recorded gap.

**Prerequisites.**

- [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model) (Γ₀ prime-power local models)
- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps) *(later layer R14.1)*
- `tauceti:TauCetiRoadmap/ModularCurves#8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63`

**Consumers in this roadmap.** [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs); [`R14.6/supersingular-character-lattice`](#r14-6-supersingular-character-lattice); [`R14.6/modular-monodromy`](#r14-6-modular-monodromy); [`R14.6/character-degeneracy-sequences`](#r14-6-character-degeneracy-sequences)

**Acceptance checks.**

- At p=2 with M=5 the fine Γ₁(M) marking removes elliptic automorphisms; this is not the same claim as tame coarse Γ₀(10) descent.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp.44–46, Figure 3 and sequence (3.1). The mixed-level fibre consists of two lower-level copies meeting at supersingular points and supplies the Jacobian degeneration.
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46. Compactified mixed Γ₁-level maps and generalized quotient moduli are finite flat.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-5-prime-square-semistable-model"></a>

### Prime-square semistable modular models

**Construction** · `ModularCurvesPartII:R13.5/prime-square-semistable-model` · planet: *Prime-square semistable model*

For p>3, p∤M and an étale auxiliary rigidifying prime-to-p level, over W(k̄)[ϖ] with ϖ^((p²−1)/2)=p construct the proper normal nodal model of X₀(p²M) supplied by Edixhoven §2.1. It has two outer vertical lower-level components and two middle descended Igusa p-components, and a horizontal component over each supersingular lower-level point. With effective automorphism order 1,2,3 the horizontal smooth completion has equation y^((p+1)/e)=x(x−1)^(p−1), with e respectively 1,2,3; these are equations for the normal smooth projective completions, not claims that the affine plane equation is nonsingular. Attachments are at the designated points over 0,1,∞. The quotient by auxiliary level and its effective stabilizers gives the stated coarse modular model. Stabilization or minimal regular resolution uses StableReduction under its genus hypotheses; this nodal model need not itself be stable.

**Proof plan.**

1. Base change and normalize the rigidified cyclic p² model over the displayed extension.
2. Compute the supersingular charts as in §2.2; normalize their plane equations and compare the overlap maps.
3. Glue to the ordinary Igusa charts and take the specified effective stabilizer quotient; use §2.4 for nodalness.
4. Use the existing stabilization theorem only where its genus/marking conditions apply.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.primeSquareModel` | constructor | The nodal model with its generic-fibre identification over W[ϖ]. |
| `TauCeti.ModularCurves.primeSquareModel_vertical` | projection | Two outer and two middle components, four vertical components in total, on the auxiliary rigidified presentation. |
| `TauCeti.ModularCurves.primeSquareModel_horizontal` | projection | The normalized horizontal curve and its attachment points for each effective automorphism type. |
| `TauCeti.ModularCurves.primeSquareModel_quotient` | compatibility | Auxiliary-level descent retains the effective stabilizer quotient and nodal charts. |
| `TauCeti.ModularCurves.primeSquareModel_stabilize` | compatibility | Its stable contraction agrees with the imported stabilization, when the genus/marking hypotheses hold. |

**Unit tests.**

- `TauCeti.ModularCurves.primeSquareModel_extensionThirteen` (computation): p=13 gives ϖ⁸⁴=13.
- `TauCeti.ModularCurves.primeSquareModel_extraAutomorphisms` (non-example): At a supersingular j=0 with effective order 3, the horizontal exponent is (p+1)/3, not p+1.
- `TauCeti.ModularCurves.primeSquareModel_generic` (compatibility): The generic fibre remains X₀(p²M), with the original two j-invariant maps.
- `TauCeti.ModularCurves.primeSquareModel_vertical_count` (computation): The auxiliary presentation has two outer and two middle vertical components, total four. A six-component vertical list is rejected.

**Uses.**

- BDMTV Theorem 6.5: Provides the explicit prime-square semistable fibre and Fricke action.
- R13.6: Computes graphs and Jacobian/nearby-cycle inputs.

**Prerequisites.**

- [`R13.5/tame-regular-resolution`](#r13-5-tame-regular-resolution) (Regular resolutions of modular fibres)
- [`R13.5/igusa-components`](#r13-5-igusa-components) (Igusa components of modular fibres)
- `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`
- `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`

**Consumers in this roadmap.** [`R13.5/split-cartan-semistable-model`](#r13-5-split-cartan-semistable-model)

**Acceptance checks.**

- A rational component with fewer than three special points can be present in this semistable model; it is contracted in the stable model when stabilization applies.

**Sources.**

- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §2.1, pp.55–56; §§2.2–2.4, pp.56–65. The explicit extension, horizontal equations, vertical Igusa components and quotient gluing give the p² nodal model.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-5-split-cartan-semistable-model"></a>

### Split Cartan semistable fibres

**Theorem** · `ModularCurvesPartII:R13.5/split-cartan-semistable-model` · planet: *Split Cartan semistable fibre*

Let ℓ=12k+1 be prime and W=W(𝔽̄_ℓ). Over W[ϖ], ϖ^(12k(6k+1))=ℓ, X₀(ℓ²) has k horizontal curves u²=v^(ℓ+1)+1, and four vertical curves, two rational and two Ig(ℓ)/±1. Each horizontal meets each vertical once, with no other intersections. Fricke fixes each horizontal via (u,v)↦(u,−v), exchanges the rational verticals and preserves the two Igusa verticals. Its tame quotient is a proper nodal model of X_s(ℓ): k horizontals u²=v^(6k+1)+1 of genus 3k, one rational vertical and two Ig(ℓ)/C₄ verticals of genus (k−1)(3k−2)/2. Its dual graph is K_(k,3); hence b₁=2k−2 and g=6k²−3k. The chosen equation ϖ^((ℓ²−1)/2)=ℓ implies ϖ^(ℓ²−1)=ℓ². The squared equation alone also allows ϖ^((ℓ²−1)/2)=−ℓ; recover the chosen extension only with the specified root choice, not by treating the two polynomial equations as equivalent.

**Proof plan.**

1. Specialize the prime-square model to ℓ≡1 mod 12, where no supersingular j=0,1728 correction occurs.
2. Use Fricke action from the source, and tame invariant base change to identify the quotient special fibre.
3. The horizontal quotient replaces v² by its coordinate; the Igusa quotient is the effective C₄ level quotient.
4. Compute genera by the double-cover branch count and the imported nodal genus formula.

**Assembly note.** X_s(ℓ) is the normalizer curve X₀(ℓ²)/w_{ℓ²}, written X_s⁺(ℓ) in R13.4a.

**Prerequisites.**

- [`R13.5/prime-square-semistable-model`](#r13-5-prime-square-semistable-model) (Prime-square semistable modular models)
- [`R13.4a/split-cartan-quotient`](#r13-4a-split-cartan-quotient) (The split Cartan normalizer quotient)
- `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

**Consumers in this roadmap.** [`R13.5/split-cartan-thirteen-good-reduction`](#r13-5-split-cartan-thirteen-good-reduction); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs)

**Acceptance checks.**

- k=1 gives one genus-3 horizontal and three rational vertical leaves; k=3 (ℓ=37) gives total genus 45.

**Sources.**

- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, Theorems 6.5–6.6 and their proof, pp.928–929. The explicit fibre, Fricke action, tame quotient, component genera and incidence are all stated with ℓ≡1 modulo 12.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-5-split-cartan-thirteen-good-reduction"></a>

### Good reduction of the level-13 curve

**Application** · `ModularCurvesPartII:R13.5/split-cartan-thirteen-good-reduction`

The split Cartan normalizer curve X_s(13) has good reduction at every prime other than 13 and acquires good reduction over Frac(W(𝔽̄₁₃)[ϖ]), ϖ⁸⁴=13. At 13 the k=1 semistable model above has a genus-3 horizontal u²=v⁷+1 with three rational leaves; contracting those leaves gives a smooth proper model. Away from 13 use the first Baran plane quartic on BDMTV p.930: (−Y−Z)X³+(2Y²+YZ)X²+(−Y³+Y²Z−2YZ²+Z³)X+2Y²Z²−3YZ³=0. It is smooth over ℤ[1/13], including at 2. The second quartic obtained by the determinant-2 substitution in the source is only smooth away from 2 and 13 and cannot prove the claim at 2.

**Proof plan.**

1. For ℓ=13 specialize the stated quotient graph; contract the three genus-zero leaves using the existing surface contraction theorem.
2. Verify smoothness of the resulting genus-3 fibre and generic-fibre identification.
3. For primes other than 13 apply the Jacobian criterion to the first homogeneous quartic, with all projective charts, including characteristic 2.
4. Check the first quartic at 2 directly. On Z=1 the three derivative equations force t=Y+1≠0, X=t³+1, g=t⁷+t³+1=0 and F=t¹⁰+1. The Bézout identity (t⁹+t⁸+t⁷+t³+t²+t+1)g+(t⁶+t⁵+t⁴+t²+t)(t¹⁰+1)=1 rules out a singular point over the algebraic closure. On Z=0 the derivatives force X=Y≠0 but F_Z=X³≠0.

**Assembly note.** X_s(13) is the normalizer curve X₀(169)/w₁₆₉, written X_s⁺(13) in R13.4a.

**Prerequisites.**

- [`R13.5/split-cartan-semistable-model`](#r13-5-split-cartan-semistable-model) (Split Cartan semistable fibres)
- `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

**Acceptance checks.**

- The Jacobian has toric rank zero after the extension because the graph is a tree; a tree alone would not prove smoothness without contracting the leaves.
- The determinant-2 change of plane coordinates is not an integral isomorphism at 2.

**Sources.**

- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Corollary 6.7, p.929 and first Baran model in §6.3, p.930. The semistable fibre proves potential good reduction at 13; the first integral equation provides the away-from-13 assertion.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

For p=5 and N=25, the ordinary mixed (1,1) point with j=1728 has the effective action (x,y)↦(−x,−y). Its invariant ring is singular, even though the point is not supersingular. This detects the omitted ordinary locus. At ℓ=13 the stated extension has ramification (13²−1)/2=84; the split-Cartan graph is K_(1,3), with b₁=0. The genus-3 central component meets three rational leaves, which are contracted to obtain good reduction. For the first Baran quartic F at 2, work on Z=1. The equation F+X∂_XF=Y(X+1)² shows that a singular point has Y=0 or X=1. If Y=0, ∂_XF=X²+1 forces X=1 and ∂_YF=1 contradicts singularity. If X=1, ∂_YF=Y²+1 forces Y=1 and ∂_XF=1 gives the same contradiction. On Z=0, the X and Y partials force X=Y≠0, while ∂_ZF=X³≠0. This proves geometric smoothness at 2, rather than just absence of F₂-rational singular points. The second model’s coordinate change has determinant 2 and cannot prove this claim.

<a id="r13-6"></a>

## R13.6. Boundary and degeneration outputs

Export concrete model data to the general graph, Néron and nearby-cycle theories: the dual graphs with thicknesses, the character groups of the bad fibres, the nearby-cycle filtration of the nodal models and the action of the degeneracy maps on components. Integral character groups and component groups keep the weighted edge pairing; the displayed monodromy filtration is rational. The general semistable-curve theory is LefschetzPencilsAndVanishingCycles LPV.7.

<a id="r13-6-modular-dual-graphs"></a>

### Modular dual graphs and thicknesses

**Construction** · `ModularCurvesPartII:R13.6/modular-dual-graphs` · planet: *Modular dual graph*

Attach to each specified semistable modular model its imported labelled dual multigraph, retaining the normalized component, each pair of branches, node thickness, residue-field action, marked cusp section and its R13.3 parameter. For a fine one-factor Γ₁(M)∩Γ₀(p) model the graph has two vertices and one edge per supersingular marked elliptic curve, so for s geometric nodes b₁=s−1. For the ℓ² split Cartan model the graph is K_(k,3), with the component genera above. A nonreduced coarse pⁿ fibre is instead exported as a weighted intersection configuration until a stated reduced nodal model is chosen; it is not a semistable dual graph. An n-gon has n edges, also for n=1 (a loop) and n=2 (two parallel edges).

**Proof plan.**

1. Choose the exact proper model and base from R13.5 and use the imported graph construction.
2. Read branch incidences and thickness from its completed local charts; mark cusp sections via the cyclotomic chart maps.
3. Compute the graph ranks without removing loops or parallel edges; export weighted coarse configurations separately.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.modularGraph` | constructor | The imported graph attached to the supplied modular model and base. |
| `TauCeti.ModularCurves.modularGraph_components` | projection | The normalized component curves, genera and residue action. |
| `TauCeti.ModularCurves.modularGraph_nodes` | projection | The two branch flags at each node and its positive thickness. |
| `TauCeti.ModularCurves.modularGraph_cusps` | projection | The cusp sections with component labels and formal parameter maps. |
| `TauCeti.ModularCurves.modularGraph_modelComparison` | compatibility | A regular semistable resolution subdivides an edge according to its thickness without changing the generic curve. |

**Unit tests.**

- `TauCeti.ModularCurves.modularGraph_twoParallel` (computation): A 2-gon has two parallel edges and b₁=1, not a single edge and b₁=0.
- `TauCeti.ModularCurves.modularGraph_thirteen` (computation): For X_s(13) the graph is a three-leaf tree and Σ g_v=3.
- `TauCeti.ModularCurves.modularGraph_nonReduced` (non-example): The multiplicity-4 middle component of X₀(25) cannot be silently entered as a reduced nodal component.
- `TauCeti.ModularCurves.modularGraph_subdivision` (compatibility): Resolving a thickness-n edge by a chain increases both edge and vertex counts by n−1, so H₁ rank is unchanged.

**Uses.**

- R11.4 and R20: Supplies the actual character lattice geometry.
- Lower-tier LPV.7: Instantiates the general normalization and nearby-cycle sequences.

**Prerequisites.**

- [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model) (One-factor mixed-level models)
- [`R13.5/tame-regular-resolution`](#r13-5-tame-regular-resolution) (Regular resolutions of modular fibres)
- [`R13.5/split-cartan-semistable-model`](#r13-5-split-cartan-semistable-model) (Split Cartan semistable fibres)
- [`R13.3/gamma-zero-prime-power-cusp-rings`](#r13-3-gamma-zero-prime-power-cusp-rings) (Prime-power Γ₀ cusp rings)
- `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

**Consumers in this roadmap.** [`R13.6/modular-character-group-interface`](#r13-6-modular-character-group-interface); [`R13.6/modular-nearby-cycle-interface`](#r13-6-modular-nearby-cycle-interface); [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components); [`R14.6/supersingular-character-lattice`](#r14-6-supersingular-character-lattice); [`R14.6/modular-monodromy`](#r14-6-modular-monodromy); [`R14.6/character-degeneracy-sequences`](#r14-6-character-degeneracy-sequences)

**Acceptance checks.**

- At ℓ=13 the quotient graph is K_(1,3), b₁=0; at ℓ=37 it is K_(3,3), b₁=4.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, Figure 3 and sequence (3.1), pp.45–46. The two-component geometry supplies the graph input to the character group.
- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.6 and Figure 1, pp.928–929. The split Cartan incidence has k horizontal and three vertical vertices.
- [`edix90`](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.4, pp.47–48; §2.1, pp.55–56. Weighted regular configurations and nodal p² models are distinct.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-6-modular-character-group-interface"></a>

### Character groups of modular bad fibres

**Application** · `ModularCurvesPartII:R13.6/modular-character-group-interface`

For a proper regular semistable model C/R specified above, apply R11.4 to its nodal special fibre Y. The identity fibre of the Néron model of Jac(C_K) has torus T with character lattice H₁(Γ,ℤ), and abelian quotient ∏_v Jac(Ỹ_v). The monodromy pairing is the thickness-weighted edge pairing on the cycle lattice. Reorienting an edge changes its coordinate sign, not the intrinsic lattice or pairing. For the fine two-component one-factor model, H₁ is the degree-zero subgroup of the free lattice on its s supersingular marked points. The coarse Γ₀ model requires the resolved thicknesses/automorphism weights; it is not obtained by ignoring the stabilizers.

**Proof plan.**

1. Use the imported normalized Picard/Néron comparison for the exact semistable model.
2. Identify the cycle lattice with the kernel of its signed incidence map, and apply the imported weighted edge pairing.
3. In the two-vertex graph the incidence map is the degree sum on supersingular edges, giving the augmentation kernel.

**Prerequisites.**

- [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs) (Modular dual graphs and thicknesses)
- `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`
- `NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence`
- `NeronModelsAndSemistableAbelianVarieties:R11.4`

**Consumers in this roadmap.** [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components)

**Acceptance checks.**

- For X_s(13) after ϖ⁸⁴=13 the torus vanishes and the abelian quotient is the genus-3 horizontal Jacobian.
- For K_(3,3) the character lattice has rank 4, not rank equal to its 9 nodes.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, sequence (3.1) and character description, pp.45–46; §3.10.2, pp.47–48. The modular application of the torus/abelian exact sequence is used by level lowering.
- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.6, p.929. The explicit quotient geometry provides its modular genus and toric-rank example.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-6-modular-nearby-cycle-interface"></a>

### Nearby cycles of modular nodal models

**Application** · `ModularCurvesPartII:R13.6/modular-nearby-cycle-interface`

For a specified proper nodal semistable modular model over a henselian trait, ℓ distinct from the residue characteristic, import the LPV.7 normalization and specialization sequences. With Γ its geometric graph and Ỹ its normalization, they give 0→H¹(Γ,ℚ_ℓ)→H¹(Y,ℚ_ℓ)→H¹(Ỹ,ℚ_ℓ)→0 and 0→H¹(Y,ℚ_ℓ)→H¹(C_K̄,ℚ_ℓ)→H₁(Γ,ℚ_ℓ)(−1)→0. Retain residue Galois action and the distinction H¹ versus H₁. The monodromy graded pieces are graph cohomology, component H¹, and twisted graph homology; no canonical splitting is asserted. Finite trait extension of ramification e multiplies the twisted monodromy by e and an old edge of thickness n becomes e n unit edges in a regular resolution. This is a modular instantiation of lower-tier LPV, replacing the upward prerequisite on WeightsInEtaleCohomology R34.3.

**Proof plan.**

1. Verify the exact model’s properness, smooth generic fibre and reduced nodal special fibre before using LPV.
2. Apply the lower-tier normalization and specialization statements with their branch coordinates and Galois actions.
3. Use the LPV choice/base-change comparison for subdivision and ramification; do not apply this theorem to an unreduced coarse fibre.

**Prerequisites.**

- [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs) (Modular dual graphs and thicknesses)
- `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`
- `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`
- `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-choice-basechange-compatibility`

**Acceptance checks.**

- For the level-13 good model Γ is a tree, so graph terms vanish and generic H¹ is the horizontal H¹.
- A thickness-2 node after ramification 3 gives six unit edges; replacing it by only three would give the wrong pairing.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp.45–46. The specific nodal modular model supplies the geometric input; the general étale theorem is imported from LPV.
- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorems 6.5–6.6, pp.928–929. The explicit proper nodal models supply a second modular instance.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r13-6-degeneracy-on-components"></a>

### Degeneracy maps on modular components

**Theorem** · `ModularCurvesPartII:R13.6/degeneracy-on-components` · planet: *Degeneracy on components*

For the one-factor fine Γ₁(M)∩Γ₀(p) special fibre, identify the two components by the Frobenius and Verschiebung subgroups, retaining transported level points. With lower-level point x=(E,P), the Frobenius component has (π₁,π₂)=(id,F), where F sends (E,P) to (E^(p),P^(p)); on the Verschiebung component π₂ is the identity and π₁ is F followed by the inverse diamond transport needed to send the quotient marked point back to P. Thus the ordinary quotient sum is (E^(p),P^(p))+p(E^(p⁻¹),pP^(p⁻¹)), with the p multiplicity coming from the inseparable leg. Prime-to-level Hecke correspondences act on supersingular marked edges by quotient isogenies and their actual multiplicities; reversing the legs gives the polarization-dual action on the cycle lattice. After a coarse quotient or resolution use the induced branch and thickness maps, rather than transporting a map of sets alone.

**Proof plan.**

1. Label the connected subgroup by ker F and the étale subgroup by ker V, with the correct marked-point quotient.
2. Read the component maps and inseparable degree from the universal isogeny; the ordinary divisor formula fixes the inverse diamond transport.
3. Extend from the ordinary dense locus through the integral component maps and nodal branch data; apply the imported Picard/graph functoriality.
4. The oldspace and transposed character-group matrices are consumers in R20; do not reconstruct their exact-sequence theory here.

**Prerequisites.**

- [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs) (Modular dual graphs and thicknesses)
- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps) *(later layer R14.1)*
- [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators) *(later layer R14.1)*
- [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences) (Full and cyclic isogeny correspondences) *(later layer R14.1)*
- [`R13.6/modular-character-group-interface`](#r13-6-modular-character-group-interface) (Character groups of modular bad fibres)

**Consumers in this roadmap.** [`R14.6/character-degeneracy-sequences`](#r14-6-character-degeneracy-sequences)

**Acceptance checks.**

- For Γ₀ level the diamond is trivial and the special correspondence is Frobenius plus transpose Frobenius, with scheme multiplicities.
- Do not give the same matrix [[T_q,q],[−1,0]] to Jacobians and character groups: the latter uses [[T_q,−1],[q,0]] in R20’s conventions.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.3, pp.77–79; §3.9, pp.45–46. The ordinary subgroup closures give Frobenius plus the p-multiple inverse-Frobenius/diamond branch; the degeneration is Hecke invariant.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

A connected two-vertex graph with s parallel edges has H₁ of rank s−1. For s=1 the torus rank is zero, while s=2 gives rank one. A loop contributes one generator; replacing the multigraph by a simple graph loses it. Multiplying all node thicknesses by a ramification index e multiplies the monodromy pairing by e and can change the integral component-group cokernel even when rational ranks agree.

<a id="r14-1"></a>

## R14.1. Algebraic Hecke correspondences

Construct the Hecke correspondences on the integral curves: the middle level problem and both legs (rather than their image), the diamond operators, the cyclotomic Fricke involution and the exact-divisor Atkin–Lehner involutions, the full and cyclic isogeny correspondences with their composition laws, the comparison with the classical action, the integral coherent trace and the integral étale trace, and the Hecke cycles on the projective level curves. Contractions, stabilizer actions, subgroup multiplicities and the differential factor of the universal isogeny are kept. The coherent trace and the cohomological trace are different operations.

<a id="r14-1-degeneracy-maps-and-hecke-correspondence"></a>

### Compactified Hecke degeneracy maps

**Construction** · `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence` · planet: *Hecke correspondence*

For N≥1 and a prime p, the disjoint Γ₁(N;p) level stack parametrizes a Γ₁(N) structure and an order-p cyclic subgroup disjoint from its marked divisor in the required generalized-curve sense. Its two maps to Γ₁(N) forget the subgroup or quotient by it and contract the polygon to restore the ample marked divisor. Both stack maps are representable finite flat over ℤ, of degree p+1 if p∤N and p if p∣N. Their universal isogeny induces ξ:π₂\*ω→π₁\*ω. For squarefree q use the analogous Γ₁(N;q) disjoint level problem and finite-flat legs. In characteristic zero these are the customary curve correspondences. Coarse finite flatness is asserted only after its own descent check; it does not follow just from stack finite flatness.

**Proof plan.**

1. Use the R13.2 disjoint Drinfeld level stack, not an arbitrary subgroup pair on a degenerate polygon.
2. Form the quotient generalized curve and contract; use the formal power isogeny at multiplicative cusps.
3. Apply the cited finite-flat moduli theorem over ℤ and compute generic degree. On any coarse model verify the separate descent hypotheses.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.heckeLevelStack` | constructor | The disjoint compactified level stack with its universal quotient isogeny. |
| `TauCeti.ModularCurves.degeneracy1` | projection | Forget the p-subgroup then contract the allowed polygon. |
| `TauCeti.ModularCurves.degeneracy2` | projection | Quotient by the subgroup then contract, retaining the transported level point. |
| `TauCeti.ModularCurves.degeneracyDegree` | characterisation | The rank of either finite-flat stack leg is p+1 or p as specified. |
| `TauCeti.ModularCurves.degeneracyHodgeMap` | functoriality | The isogeny differential ξ extends over every cusp and equals the power-map differential on multiplicative charts. |

**Unit tests.**

- `TauCeti.ModularCurves.degree_degeneracy_coprime` (computation): N=11,p=2: degree 3, the three lines of E[2].
- `TauCeti.ModularCurves.degree_degeneracy_dvd` (computation): N=10,p=5: degree 5; the level-intersecting subgroup is excluded.
- `TauCeti.ModularCurves.degeneracy_boundary` (compatibility): On the multiplicative-kernel cusp, ξ sends du/u to p du/u, even when its residue is zero.
- `TauCeti.ModularCurves.degeneracy_point_count` (non-example): The purely inseparable ordinary branch has one geometric preimage with rank p, so counting points gives the wrong trace.

**Uses.**

- Conrad07 §4.5: Defines the coherent trace whose division by p needs a theorem.
- R14.2 and R13.6: Supplies Jacobian push–pull and special-fibre maps.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny) (Power isogenies at the boundary)
- [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures)
- [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks)
- [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries) (Fine loci and bad-level inertia)
- [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels) (Compactified level maps and their degrees)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`
- `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`

**Consumers in this roadmap.** [`R13.4b/compactified-map-comparison`](#r13-4b-compactified-map-comparison); [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model); [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components); [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences); [`R14.1/composition-relations-of-correspondences`](#r14-1-composition-relations-of-correspondences); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences); [`R14.1/coherent-hecke-trace`](#r14-1-coherent-hecke-trace); [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace); [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian); [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients); [`R14.4/degeneracy-cohomology`](#r14-4-degeneracy-cohomology); [`R14.5/trivial-character-J0`](#r14-5-trivial-character-j0); [`R14.5/oldform-comparison`](#r14-5-oldform-comparison); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi); [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover)

**Acceptance checks.**

- N=11,p=2 gives degree 3; N=10,p=5 gives degree 5.
- In characteristic p a leg can be inseparable on one component. Counting geometric points is not a degree computation.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46. Both maps and the universal differential extend over the compactification, with the disjoint level condition.
- [`ces17`](https://arxiv.org/pdf/1511.07475), Lemma 4.7.1, p.49. The squarefree version is finite flat also when q and N share primes.
- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.71–72. The degree is p+1 or p according to p∤N or p∣N.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-diamond-operators"></a>

### Diamond operators

**Construction** · `ModularCurvesPartII:R14.1/diamond-operators`

For a∈(ℤ/N)×, I_a sends (E,P) to (E,aP) on the compactified Γ₁(N) problem, with the necessary contraction on generalized curves. It preserves the coarse curve over ℤ and the Hodge sheaf via the identity on E. The stack action is the whole unit group. On a coarse curve I_−1 is the identity through the isomorphism [−1] of marked curves, but that same isomorphism acts as −1 on ω; weight-k descent therefore requires the appropriate sign/character. I_a I_b=I_ab. On Γ₀(N) every diamond is trivial. Do not identify the Hodge action with a trivial coarse action when k is odd.

**Proof plan.**

1. Change the Drinfeld marked point by a unit; the ample divisor and contraction are preserved.
2. Use the inverse unit for inverse and the product for composition.
3. Track the differential of [−1] when the underlying coarse map becomes identity.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.diamond` | constructor | Compactified automorphism I_a and its Hodge identification. |
| `TauCeti.ModularCurves.diamond_mul` | simp | Composition follows multiplication of units. |
| `TauCeti.ModularCurves.diamond_inv` | instance | I_(a⁻¹) is inverse. |
| `TauCeti.ModularCurves.diamond_minusOne` | compatibility | I_−1 is trivial on the coarse curve but has sign −1 on the Hodge fibre. |
| `TauCeti.ModularCurves.diamond_baseChange` | functoriality | Formation commutes with the legal base changes of the moduli problem. |

**Unit tests.**

- `TauCeti.ModularCurves.diamond_group_order_11` (computation): φ(11)/2=5 for the coarse unit quotient.
- `TauCeti.ModularCurves.diamond_minusOne_hodge` (non-example): Weight one with trivial character cannot descend by asserting I_−1 acts trivially on ω.
- `TauCeti.ModularCurves.diamond_gammaZero` (degenerate): On Γ₀(N) the curve diamond maps are identity.
- `TauCeti.ModularCurves.diamond_product` (compatibility): I_2 I_3=I_6 for N=11, including the boundary.

**Uses.**

- R14.1 and R14.2: Determines repeated-prime terms, adjoints and Galois conventions.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor) (Contraction along a positive Cartier divisor)

**Consumers in this roadmap.** [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components); [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution); [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences); [`R14.1/composition-relations-of-correspondences`](#r14-1-composition-relations-of-correspondences); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences); [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness); [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint); [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients); [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein); [`R14.5/trivial-character-J0`](#r14-5-trivial-character-j0); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi); [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover)

**Acceptance checks.**

- N=11 gives an effective unit quotient of order 5 on X₁(11); N=3 gives a genus-zero coarse curve, whose Jacobian action is trivial.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–43, Lemma 4.4.1. Diamond-invariant forms and the descent of ω retain stabilizer action.
- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–66; §5.2, p.71. The geometric diamond convention and its cohomological action are fixed.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-atkin-lehner-involution"></a>

### Cyclotomic Fricke involution

**Construction** · `ModularCurvesPartII:R14.1/atkin-lehner-involution`

For N≥5 over ℤ[1/N,ζ_N], with ζ_N primitive, construct w_ζ on X₁(N) by quotienting E by ⟨P⟩ and choosing the dual-kernel generator determined by e_N(P,Q)=ζ_N. Extend by the generalized quotient/contraction at cusps. On the coarse curve w_ζ²=id and w_(ζ^a) w_ζ=I_a (the point inversion in the double quotient is already trivial on the coarse curve). Thus w_ζ=w_(ζ⁻¹) on this curve, and it descends to the real cyclotomic base ℤ[1/N,ζ_N+ζ_N⁻¹]. Galois acts by g w_ζ g⁻¹=w_(gζ). It is not generally defined over ℚ. The prime Γ₀(N) integral normalization extension over ℤ[1/N] is Layer 10’s existing construction.

**Proof plan.**

1. Use the Weil pairing and dual quotient isogeny to select the target marked point.
2. Compare two successive quotient constructions, fixing the diamond convention by the displayed law.
3. Extend on Tate charts, then use normality/full faithfulness for equality and descent.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.atkinLehner` | constructor | The cyclotomic pointed quotient map extended to X₁(N). |
| `TauCeti.ModularCurves.atkinLehner_sq` | simp | The coarse map is involutive. |
| `TauCeti.ModularCurves.atkinLehner_changeRoot` | compatibility | w_(ζ^a) w_ζ=I_a. |
| `TauCeti.ModularCurves.atkinLehner_galois` | functoriality | Conjugation changes ζ to gζ. |
| `TauCeti.ModularCurves.atkinLehner_realDescent` | universal-property | Descent along ζ↔ζ⁻¹ to the real cyclotomic base. |

**Unit tests.**

- `TauCeti.ModularCurves.atkinLehner_sq_eq_id` (compatibility): Two cyclic quotients recover the coarse marked curve.
- `TauCeti.ModularCurves.atkinLehner_change_root` (characterisation): At N=11 two root choices with ratio exponent a differ by the nontrivial diamond I_a when a≠±1.
- `TauCeti.ModularCurves.atkinLehner_rationality` (non-example): A full Γ₁ Fricke map is not automatically ℚ-rational just because the Γ₀ Fricke map is.
- `TauCeti.ModularCurves.atkinLehnerAnalytic_involutive` (computation): For N,z≠0, −1/(N(−1/(Nz)))=z.

**Uses.**

- R14.2: Controls polarization adjoints and the twisted Hecke pairing.
- R13.5: The Γ₀ version acts on the p² model.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`

**Consumers in this roadmap.** [`R14.1/exact-divisor-atkin-lehner`](#r14-1-exact-divisor-atkin-lehner); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness); [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi)

**Acceptance checks.**

- Replacing ζ by ζ^a changes the map by a diamond; omitting the field of definition destroys the Galois conjugation law.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.70–73. The moduli construction, real-cyclotomic descent and composition law are explicit.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-exact-divisor-atkin-lehner"></a>

### Exact-divisor Atkin–Lehner operators

**Construction** · `ModularCurvesPartII:R14.1/exact-divisor-atkin-lehner` · planet: *Atkin–Lehner involutions*

For d∣N with gcd(d,N/d)=1, split a cyclic N-subgroup into its d and N/d factors and quotient by the d factor, replacing that factor by the dual kernel. This defines the ℚ-rational involution w_d on X₀(N); compactification is by normalization and the Tate boundary comparison. They commute and w_d w_e=w_(de/gcd(d,e)²), so the group has 2^ω(N) elements. The full Fricke map is d=N. No such involution is asserted from a nonexact divisor. Prime N≥5 over ℤ[1/N] uses the Layer 10 map; at primes dividing N extending to a chosen regular or semistable model is a separate equivariant-model assertion.

**Proof plan.**

1. Construct the coprime subgroup decomposition and its dual quotient on the elliptic open.
2. Extend the map by normal compactification and invert it by the same construction.
3. Compute the composition from prime-power factor decompositions. Import the prime-level integral overlap rather than redo it.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.atkinLehnerExact` | constructor | w_d with a proof d is an exact divisor. |
| `TauCeti.ModularCurves.atkinLehnerExact_mul` | simp | The composition has exact divisor de/gcd(d,e)². |
| `TauCeti.ModularCurves.atkinLehnerExact_one` | simp | w₁ is identity. |
| `TauCeti.ModularCurves.atkinLehnerExact_field` | compatibility | The Γ₀ construction is over ℚ, independently of a primitive root. |
| `TauCeti.ModularCurves.atkinLehnerExact_model` | compatibility | On the specified p² semistable model it is the component/branch action of R13.5. |

**Unit tests.**

- `TauCeti.ModularCurves.atkinLehnerExact_twelve` (computation): N=12: exactly four exact-divisor operators.
- `TauCeti.ModularCurves.atkinLehnerExact_nonexact` (non-example): d=2 at N=12 cannot be supplied as an exact divisor.
- `TauCeti.ModularCurves.atkinLehnerExact_one` (degenerate): d=1 gives identity.
- `TauCeti.ModularCurves.atkinLehnerExact_product` (compatibility): w₃w₄=w₁₂ and w₄²=id for N=12.

**Uses.**

- Gross–Zagier Chapter I: Fixes Γ₀ arithmetic correspondences.
- BDMTV §6.2: Constructs the split-Cartan normalizer quotient.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution) (Cyclotomic Fricke involution)
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`

**Consumers in this roadmap.** [`R13.4a/split-cartan-quotient`](#r13-4a-split-cartan-quotient); [`R13.4a/atkin-lehner-quotient-curves`](#r13-4a-atkin-lehner-quotient-curves)

**Acceptance checks.**

- N=12 has exact divisors 1,3,4,12; 2 is not exact. The product w₃w₄ is w₁₂.
- w₄w₄=w₁, not w₁₆.

**Sources.**

- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §2, p.227. The exact-divisor involutions and their group law fix the Γ₀ convention.
- [`bdmtv19`](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.5 and proof of Theorem 6.6, pp.928–929. w_(ℓ²) extends to the explicit semistable model and its tame quotient is computed.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-full-and-cyclic-correspondences"></a>

### Full and cyclic isogeny correspondences

**Construction** · `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences` · planet: *Full and cyclic correspondences*

For m≥1 prime to N on the smooth characteristic-zero Γ₁(N) curve, let A_m parametrize every subgroup scheme of order m, and let C_m parametrize only cyclic subgroups of order m, transporting the marked point by the quotient. Compactify each elliptic-open correspondence by its normal finite closure, retaining cycle multiplicity. The degrees of both legs are σ₁(m)=Σ_(d∣m)d for A_m and ψ(m)=m∏_(p∣m)(1+1/p) for C_m. On a split Tate cover the subgroups are indexed by a d=m and 0≤b&lt;d; the quotient parameter is q′=ζ_d^b q^(a/d), and the isogeny is u↦u^a. The subgroup is cyclic exactly when gcd(a,b,d)=1. Every noncyclic subgroup has a unique scalar elementary-divisor factor r, and A_m=Σ_(r²∣m)⟨r⟩ C_(m/r²) as operators/cycles in this transported-level convention. The equality is on completed correspondences with their maps, not an assertion that raw cusp fibre products are normal.

**Proof plan.**

1. Classify finite-index rank-two lattices by Hermite normal form; their elementary divisors give the cyclicity criterion and both counts.
2. Read the corresponding Tate quotient on the split cover and keep the root of unity and differential multiplier a.
3. Use the unique scalar subgroup E[r] factor to derive the diamond-weighted decomposition; normalize the compactified finite closures.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.allSubgroupCorrespondence` | constructor | A_m, its two finite generic legs and normalized compactification. |
| `TauCeti.ModularCurves.cyclicSubgroupCorrespondence` | constructor | C_m with the cyclic condition and its finite normalized closure. |
| `TauCeti.ModularCurves.allSubgroupCorrespondence_degree` | characterisation | Its degree is σ₁(m). |
| `TauCeti.ModularCurves.cyclicSubgroupCorrespondence_degree` | characterisation | Its degree is ψ(m). |
| `TauCeti.ModularCurves.correspondenceTateBranch` | compatibility | The branch (a,d,b) has q′=ζ_d^b q^(a/d) and differential multiplier a. |
| `TauCeti.ModularCurves.allSubgroupCorrespondence_scalarDecomposition` | compatibility | The decomposition has the diamond ⟨r⟩ attached to E[r]. |

**Unit tests.**

- `TauCeti.ModularCurves.fullCyclic_four` (computation): σ₁(4)=7 and ψ(4)=6; the pair (a,d,b)=(2,2,0) is the noncyclic one.
- `TauCeti.ModularCurves.fullCyclic_one` (degenerate): A₁=C₁ is the identity correspondence.
- `TauCeti.ModularCurves.fullCyclic_squarefree` (characterisation): For m=6 all twelve branches satisfy the cyclic criterion.
- `TauCeti.ModularCurves.fullCyclic_tate` (compatibility): For m=p the multiplicative branch has q′=q^p and p other branches have q′=ζ_p^b q^(1/p).
- `TauCeti.ModularCurves.fullCyclic_diamond` (non-example): At N=11,m=4 the scalar E[2] term transports P to 2P; replacing it by an identity-level correspondence loses the diamond.

**Uses.**

- Bakker–Tsimerman §2.5 and §6: Fixes cyclic degrees and boundary geometry.
- R14.2 and ModularityLifting: Fixes repeated-prime algebra relations.

**Prerequisites.**

- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators)
- [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts) (Formal level structures at cusps)
- [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny) (Power isogenies at the boundary)
- `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`
- `AlgebraicModuliForArithmeticGeometry:R09.5/finite-closure`
- `AlgebraicModuliForArithmeticGeometry:R09.5/normalized-correspondence`

**Consumers in this roadmap.** [`R13.4b/hecke-normalization-comparison`](#r13-4b-hecke-normalization-comparison); [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components); [`R14.1/composition-relations-of-correspondences`](#r14-1-composition-relations-of-correspondences); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences); [`R14.1/projective-boundary-hecke-and-degree`](#r14-1-projective-boundary-hecke-and-degree); [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein)

**Acceptance checks.**

- m=4 gives seven full subgroups and six cyclic ones. The omitted subgroup is E[2], whose quotient transports P to 2P.
- m=6 gives both degrees 12 because squarefree subgroups are cyclic.

**Sources.**

- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §2, p.227. The full order-m subgroup correspondence has σ₁(m) degree.
- [`bt16`](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.5, pp.716–717. The cyclic definition and Tate boundary specialization are used with corrected degree and polygon domains.
- [`mz20`](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §3.1(ii),(v), pp.645–646. The modular polynomial parametrizes the cyclic correspondence and has ψ(m) degree.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-composition-relations-of-correspondences"></a>

### Hecke composition relations

**Theorem** · `ModularCurvesPartII:R14.1/composition-relations-of-correspondences` · planet: *Hecke composition laws*

For m,n prime to N and gcd(m,n)=1, composition of full correspondences A_m A_n=A_(mn); cyclic correspondences also satisfy C_m C_n=C_(mn). The correspondence equality is a normalized cycle equality, not a raw fibre-product isomorphism at the boundary. For p∤N the repeated-prime relations in the transported-level convention are A_p²=A_(p²)+p⟨p⟩, A_(p²)=C_(p²)+⟨p⟩, and C_p²=C_(p²)+(p+1)⟨p⟩. At p∣N the disjoint U_p correspondences instead compose as U_p U_(p^r)=U_(p^(r+1)), on their specified level problem; no unit diamond ⟨p⟩ exists there. Abstract double-coset algebra is imported from ModularForms layers 2–3 and the pinned Tau Ceti Hecke ring; this theorem realizes it on these modular cycles.

**Proof plan.**

1. For coprime indices split each subgroup into its unique primary factors; compare the transported marked point.
2. For p² count chains above a cyclic subgroup (one) and above E[p] (p+1); the latter transports P to pP.
3. Use normal finite closures for cycle equality and the disjoint bad-prime subgroup condition for U.

**Prerequisites.**

- [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences) (Full and cyclic isogeny correspondences)
- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators)
- `tauceti:HeckeRing.GL2.heckeT_mul_of_coprime`
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`
- `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`

**Consumers in this roadmap.** [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian); [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients)

**Acceptance checks.**

- At p=2 the cyclic relation has coefficient 3, whereas the full relation has coefficient 2.
- At N=11,m=2,n=3 both sides have degree 12.

**Sources.**

- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §2, p.227. The full subgroup correspondence convention determines the classical repeated-prime identity.
- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.71–72. The disjoint level correspondence agrees with the classical Hecke/U operators.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-analytic-comparison-of-correspondences"></a>

### Classical and geometric Hecke actions

**Comparison** · `ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`

Over ℂ on a chosen honest component, identify the modular curves with the earlier compactified congruence quotients. Under Shimura’s weight-two identification, π₁\*π₂^\* on H¹ is the classical upper Hecke operator and its conjugate on the antiholomorphic summand. On holomorphic weight-k forms include the universal isogeny differential ξ^k; the unnormalized coherent trace is p times classical T_p. Full versus cyclic operators, transported diamonds, and the Γ₁ cyclotomic Fricke map retain the R14.1 conventions. The analytic map w_N(z)=−1/(Nz) is the component-fixed shadow of the chosen root, not proof of rational descent.

**Proof plan.**

1. Compare the maps on the elliptic analytic open with the fixed quotient lattice and point conventions.
2. At cusps use the Tate quotient and differential, then use q-expansion determination from the earlier modular-form supplier.
3. Apply the cited cohomological comparison and record upper/lower adjoint conventions separately.

**Assembly note.** This target uses [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison) for the components and cusp fields, and is in turn used by [`R13.4b/hecke-normalization-comparison`](#r13-4b-hecke-normalization-comparison). The targets interleave; at the level of targets there is no cycle.

**Prerequisites.**

- [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison) (Generic components and cusp fields)
- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators)
- [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution) (Cyclotomic Fricke involution)
- [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences) (Full and cyclic isogeny correspondences)
- [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent) (Canonical generic models and coefficient descent)
- [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility) (Generic base change and level compatibility)
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`

**Consumers in this roadmap.** [`R13.4b/hecke-normalization-comparison`](#r13-4b-hecke-normalization-comparison); [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian); [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing); [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison); [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism); [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint); [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein); [`R14.5/oldform-comparison`](#r14-5-oldform-comparison)

**Acceptance checks.**

- For p∤N weight two has a_n(T_pf)=a_(np)+p a_(n/p)(⟨p⟩f); a pointwise average would give a different operator.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Theorems 5.1–5.2, pp.65–67. Shimura comparison and cup/Petersson compatibility fix the upper convention.
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, pp.46–48. The weight-k trace includes the isogeny differential and the factor p.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-coherent-hecke-trace"></a>

### Integral coherent Hecke trace

**Construction** · `ModularCurvesPartII:R14.1/coherent-hecke-trace` · planet: *Integral Hecke trace*

For k≥1, over Γ₁(N)/ℤ define F=Tr_(π₁)∘ξ^k∘π₂^\* on ω^k. The local finite-flat theorem shows F(ω^k)⊂pω^k, hence T_p=F/p exists integrally over ℤ and is compatible with base change as a normalized integral operator. On a characteristic-p base its construction uses lifts modulo p² and the proved divisibility/independence of the lift; it is not division by zero in the residue field. On multiplicative ordinary/kernel and cusp charts ξ vanishes modulo p; on the étale-kernel ordinary chart the purely inseparable leg has trace zero modulo p. The local operators glue by the coherent-extension lemma. On q expansions, for p∤N, a_n(T_pf)=a_(np)(f)+p^(k−1)a_(n/p)(⟨p⟩f), with a_(n/p)=0 unless p∣n; for p∣N it is a_(np). Nothing here defines a normalized étale/Picard trace by dividing by p.

**Proof plan.**

1. Construct the honest finite-flat trace and ξ^k on the integral stack.
2. Prove p-divisibility on the two ordinary charts and Tate boundary charts; extend by the cited local CM/coherent lemma.
3. Divide over ℤ, prove independence of lifts modulo p² and glue; use the Tate branches to verify the coefficient formula.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.coherentHecke` | constructor | The integral normalized T_p on ω^k for k≥1. |
| `TauCeti.ModularCurves.coherentHecke_rawTrace` | characterisation | p T_p=Tr_(π₁) ξ^k π₂^\* over the integral model. |
| `TauCeti.ModularCurves.coherentHecke_baseChange` | functoriality | Base change of the proved normalized operator, including residue characteristic p. |
| `TauCeti.ModularCurves.coherentHecke_qExpansion` | simp | The good and bad coefficient formulas with the displayed diamond. |
| `TauCeti.ModularCurves.coherentHecke_liftIndependence` | compatibility | Modulo-p² lifts define the same characteristic-p operator. |

**Unit tests.**

- `TauCeti.ModularCurves.coherentHecke_weight_one` (computation): Modulo p at k=1 retain both a_(np) and a_(n/p)(⟨p⟩f).
- `TauCeti.ModularCurves.coherentHecke_weight_two` (computation): Modulo p at k=2 the p-multiple term vanishes.
- `TauCeti.ModularCurves.coherentHecke_bad` (compatibility): For p∣N only a_(np) occurs, without an undefined ⟨p⟩.
- `TauCeti.ModularCurves.coherentHecke_division` (non-example): An operator on a characteristic-p ring cannot be defined by inverting p; it is the reduction of the normalized integral trace.

**Uses.**

- R13.4b and ModularForms: Fixes integral geometric/classical normalization.
- R14.2: Distinguishes differential trace from Picard norm.

**Prerequisites.**

- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation) (Boundary carriers and Hodge evaluation)
- [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny) (Power isogenies at the boundary)
- `SchemeAndStackFoundations:SF.2`

**Consumers in this roadmap.** [`R13.4b/hecke-normalization-comparison`](#r13-4b-hecke-normalization-comparison); [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison); [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism)

**Acceptance checks.**

- For k=1 in characteristic p the second q-term has coefficient 1; for k≥2 it vanishes modulo p.
- The construction needs k≥1: ξ^0 does not give the multiplicative-kernel divisibility argument.

**Sources.**

- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.5.1, Lemma 4.5.2 and Example 4.5.3, pp.46–48. The p-divisibility calculation, glueing, lifting in characteristic p and both q-expansion formulas are the targets.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-integral-etale-trace"></a>

### Integral étale correspondence trace

**Theorem** · `ModularCurvesPartII:R14.1/integral-etale-trace`

For the actual finite maps f:D→C between smooth proper geometric generic-fibre modular curves and ℓ invertible in their base, use duality to define the integral H¹_et trace f_\* dual to f^\*. It satisfies f_\*f^\*=[deg f] and is compatible with Picard norm through T_ℓ Pic⁰≃H¹_et(−,ℤ_ℓ(1)). Thus π₁\*π₂^\* and its leg reversal give integral Hecke endomorphisms, even when ℓ divides deg π₁; no averaging is imposed. In special characteristic p≠ℓ an inseparable finite map still has its degree-weighted Gysin trace, not the sum of its distinct geometric fibres. At a bad nodal fibre use the R13.6 nearby-cycle/interface comparison; smooth-curve duality is not asserted on that singular carrier.

**Proof plan.**

1. Import the finite-curve duality trace and prove the degree formula using the actual fundamental class.
2. Compare with Kummer and Picard norm, then compose the two correspondence legs.
3. For special nodal models use the supplied specialization exact sequence, retaining multiplicities.

**Prerequisites.**

- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`
- `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`
- `EtaleDualityAndPerverseSheaves:EDC.6`

**Consumers in this roadmap.** [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness); [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions); [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison); [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients); [`R14.4/degeneracy-cohomology`](#r14-4-degeneracy-cohomology); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura)

**Acceptance checks.**

- A degree-2 map with ℓ=2 has f_\*f^\*=[2], not identity.
- Absolute Frobenius in characteristic p has degree p and its duality trace retains that factor although it is a bijection on geometric points.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Theorem 5.1 and Lemmas 5.4,5.7, pp.65–69. The integral geometric pull–push and Picard/cup comparison fix the trace convention.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-1-projective-boundary-hecke-and-degree"></a>

### Hecke cycles on projective level curves

**Theorem** · `ModularCurvesPartII:R14.1/projective-boundary-hecke-and-degree`

For prime level p>3 and m prime to p, compactify the cyclic degree-m correspondence on the scalar-framed coarse X(p) with its transported framing. For a d=m use C_(pd) as a splitting polygon: the auxiliary map φ_d:C_(pd)→C_p has smooth formula (x,c)↦(x^d,c mod p), degree d² and an isomorphism on p-torsion. For a transverse cyclic subgroup G of order d, its quotient ψ_G:C_(pd)→C_p has degree d, and ξ_a:C_p→C_p is power a on Gₘ and identity on ℤ/p. The boundary framing is ξ_a[p] ψ_G[p] φ_d[p]⁻¹ f. Retain only choices whose composite kernel is cyclic (the Tate criterion gcd(a,b,d)=1); taking every divisor a,d and every transverse G without this condition gives the full-subgroup boundary union. The source of φ_d is Gₘ×ℤ/(pd), and that of ξ_a is Gₘ×ℤ/p. Keep the μ_p-equivariance, smoothing parameter and raw/effective stabilizer distinction. For μ=id×α and ν=id×β on X(p)×T_m, the image cycle ν_\*μ^\*C has canonical degree ψ(m) times that of C, by projection formula and numerical equality of α^\*K and β^\*K. For the full-subgroup convention the multiplier is σ₁(m). This is numerical intersection equality, not a canonical line-bundle isomorphism.

**Proof plan.**

1. Use the split (a,d,b) Tate branch; φ_d has degree d² and is only an auxiliary p-torsion identification. The actual ξ_a ψ_G map has degree ad=m. Its kernel is cyclic exactly under the stated filter.
2. Transport the projective frame, retaining scalar-equivalence and stabilizers rather than introducing a nonexistent universal family.
3. Apply the cycle projection formula; use numerical degree on the curve, then the two equal correspondence degrees.

**Prerequisites.**

- [`R13.4a/projective-scalar-coarse-quotient`](#r13-4a-projective-scalar-coarse-quotient) (Projective scalar level quotients)
- [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences) (Full and cyclic isogeny correspondences)
- [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny) (Power isogenies at the boundary)
- [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor) (Contraction along a positive Cartier divisor)
- `SchemeAndStackFoundations:SF.5`

**Acceptance checks.**

- m=4 gives cyclic multiplier 6, full multiplier 7.
- For m=1 the cycle and canonical degree are unchanged; Γ₁ fine-level geometry is not inferred from this coarse projective statement.

**Sources.**

- [`bt16`](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.5, pp.716–717; §6, p.736. The polygon formula needs domain ℤ/(pm), and the degree multiplier depends on whether the correspondence is cyclic or full.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

For m=4 the HNF data are (1,4,b), 0≤b<4; (2,2,b), 0≤b<2; and (4,1,0): seven branches. The cyclic filter removes (2,2,0), leaving six. Thus A_p²=A_(p²)+p⟨p⟩ while C_p²=C_(p²)+(p+1)⟨p⟩ in the weight-two convention. For N=12 the exact divisors are 1,3,4,12; neither 2 nor 6 defines an exact-divisor Atkin–Lehner involution. At N=11,p=2 a degeneracy leg has degree 3; at N=10,p=5 it has degree 5.

<a id="r14-2"></a>

## R14.2. Jacobians and integral Hecke actions

Construct the relative Jacobian of the modular curve on its smooth base, with pullback and norm along the correspondence legs, the upper and lower Hecke actions, the geometric integral Hecke algebra as the image in the endomorphisms of an actual finite module, the polarization and the adjointness it gives, and the Tate module with its Galois and Hecke actions. Rational rank two is proved in R14.3 and is never an input here.

<a id="r14-2-jacobian-and-functoriality"></a>

### Modular Jacobians and norms

**Construction** · `ModularCurvesPartII:R14.2/jacobian-and-functoriality` · planet: *Modular Jacobian*

For N≥5 put S=Spec ℤ[1/N] and let C=X₁(N)/S, the smooth proper geometrically connected coarse curve. Construct J₁(N)=Pic⁰_(C/S), an abelian scheme of relative dimension g(C), with its canonical principal polarization. For X₀(N) or another smooth proper geometrically connected coarse quotient use the same construction on its legal smooth base; disconnected honest full level requires componentwise Picard and field descent. For a finite flat map f:D→C of such curves, define Picard pullback f^\*:J_C→J_D and divisor norm f_\*:J_D→J_C, with f_\*f^\*=[deg f]; the polarization dual of f^\* is f_\*. Norm counts the ramification/inseparable lengths, not just distinct geometric images. Under the polarization this agrees with the Albanese functor. A bad-level singular coarse fibre is not an abelian scheme: use its smooth generic Jacobian and the lower Néron model.

**Proof plan.**

1. Use the imported relative Picard representability; H² of a curve vanishes, giving smoothness via the requested lifting criterion.
2. Use the proper neutral-component and polarization supplier to identify the abelian scheme and its dual.
3. Construct norm on line bundles/divisors, checking ramification multiplicities and relative base change; prove degree and duality identities.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.modularJacobian` | constructor | The relative neutral Picard abelian scheme on the specified smooth base. |
| `TauCeti.ModularCurves.modularJacobian_dimension` | characterisation | Its relative dimension is the fibre genus. |
| `TauCeti.ModularCurves.jacobianPull` | functoriality | Contravariant pullback of degree-zero line bundles. |
| `TauCeti.ModularCurves.jacobianNorm` | functoriality | Covariant norm with scheme multiplicities. |
| `TauCeti.ModularCurves.jacobianNorm_pull` | simp | f_\*f^\*=[deg f]. |
| `TauCeti.ModularCurves.jacobianNorm_dual` | compatibility | f_\* is the polarization transpose of f^\*. |
| `TauCeti.ModularCurves.modularJacobian_baseChange` | compatibility | Relative Pic⁰ and its canonical polarization commute with the supplied base changes. |

**Unit tests.**

- `TauCeti.ModularCurves.jacobian_genus_zero` (degenerate): J₀(1)=0; its endomorphism ring and all Hecke operators are zero.
- `TauCeti.ModularCurves.albanese_comp_picZero_degeneracy` (computation): N=11,p=2: π₁\*π₁^\*=[3].
- `TauCeti.ModularCurves.jacobianNorm_ramification` (non-example): A totally ramified degree-2 map contributes multiplicity 2 to the norm identity.
- `TauCeti.ModularCurves.jacobianNorm_composition` (compatibility): Norm of g∘f is g_\*f_\*, while pullback reverses order.

**Uses.**

- R14.2: Carries the geometric Hecke algebra and its faithful realizations.
- R13.6/R20: Supplies the generic Jacobian whose special degeneration is computed.

**Prerequisites.**

- [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves) (Integral coarse modular curves)
- [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change) (Base change for coarse modular curves)
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-criterion`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-infinitesimal-lifting`
- `AlgebraicModuliForArithmeticGeometry:A0-extension`
- `AbelianSchemesAndArithmeticModuli:A2`
- `NeronModelsAndSemistableAbelianVarieties:R11.1`

**Consumers in this roadmap.** [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian); [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions); [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism); [`R14.4/compact-ihara`](#r14-4-compact-ihara); [`R14.5/modular-quotient`](#r14-5-modular-quotient); [`R14.5/trivial-character-J0`](#r14-5-trivial-character-j0); [`R14.6/neron-hecke-extension`](#r14-6-neron-hecke-extension); [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi)

**Acceptance checks.**

- For genus zero J=0, so multiplication by any degree is the unique zero endomorphism.
- For a degree-2 map, norm after pullback is [2], not an identity retraction.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Lemma 5.4 and Definitions 5.5–5.6, pp.67–68; §5.2, pp.70–72. Picard pullback and Albanese/norm are transpose under the canonical polarization; J₁ extends over ℤ[1/N].

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-2-hecke-operators-on-the-jacobian"></a>

### Upper and lower Jacobian Hecke operators

**Construction** · `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`

On the generic fibre define upper T_p^J=π₁\*π₂^\* and lower (T_p^J)_\*=π₂\*π₁^\*, with the same disjoint correspondence for p∣N. Define upper diamond by Picard pullback I_a^\* and lower diamond by Albanese norm I_a\*. Extend these endomorphisms uniquely over J₁(N)/ℤ[1/N] by normal-base Hom extension; for p∤N the degeneracy maps themselves exist on the smaller smooth base ℤ[1/Np] before this extension. The endomorphisms commute and satisfy the full-subgroup Hecke algebra relations. Their polarization transposes exchange upper/lower. On the cotangent space the lower operator is classical T_p, whereas the upper operator is its Petersson adjoint. On a bad-level Néron model extend the generic endomorphism by the Néron mapping property, without declaring its identity fibre abelian.

**Proof plan.**

1. Compose the actual Picard and norm maps, then apply polarization duality to reverse the legs.
2. Compare cotangent action under Shimura and use its faithfulness in characteristic zero to transport the classical relations.
3. Extend over the normal good-level base using the imported relative Hom theorem; use Néron extension separately at bad-level DVRs.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.heckeUpper` | constructor | π₁\*π₂^\* on the generic Jacobian and its unique good-base extension. |
| `TauCeti.ModularCurves.heckeLower` | constructor | π₂\*π₁^\* with the transpose convention. |
| `TauCeti.ModularCurves.heckeJacobian_dual` | compatibility | Canonical polarization exchanges the two leg orders. |
| `TauCeti.ModularCurves.heckeJacobian_cotangent` | compatibility | Lower is classical and upper is its adjoint on weight-two cotangent forms. |
| `TauCeti.ModularCurves.heckeJacobian_extend` | universal-property | Unique extension across the normal good-base dense open. |
| `TauCeti.ModularCurves.heckeJacobian_relations` | simp | The full-subgroup Hecke/diamond and bad U relations hold in End(J). |

**Unit tests.**

- `TauCeti.ModularCurves.heckeJacobian_good_norm` (computation): N=11,p=2: each same-leg norm–pull is [3], without a factor 1/3.
- `TauCeti.ModularCurves.heckeJacobian_bad` (non-example): At p∣N do not define diamond p, and do not apply good-prime adjoint formulas using its inverse.
- `TauCeti.ModularCurves.heckeJacobian_upperLower` (compatibility): Polarization transpose of π₁\*π₂^\* is π₂\*π₁^\*.
- `TauCeti.ModularCurves.heckeJacobian_zero` (degenerate): On J₀(1)=0 both operators are zero.

**Uses.**

- R14.2/R14.3: Gives the actual integral endomorphisms before extracting eigenspaces or representations.
- R13.6: Restricts the endomorphisms to the modular torus and abelian component factors.

**Prerequisites.**

- [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms)
- [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators)
- [`R14.1/composition-relations-of-correspondences`](#r14-1-composition-relations-of-correspondences) (Hecke composition relations)
- [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions)
- `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`
- [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace) (Integral étale correspondence trace)

**Consumers in this roadmap.** [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness); [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions); [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing); [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism); [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint); [`R14.5/modular-quotient`](#r14-5-modular-quotient); [`R14.5/modular-quotient-differentials`](#r14-5-modular-quotient-differentials); [`R14.5/trivial-character-J0`](#r14-5-trivial-character-j0); [`R14.6/neron-hecke-extension`](#r14-6-neron-hecke-extension); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura)

**Acceptance checks.**

- For p∣N the geometric operator is U_p; there is no ⟨p⟩ unit to insert.
- For Γ₀(N) good p the diamond is trivial and upper/lower agree, but this equality is not imposed on general Γ₁ level.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 Definitions 5.5–5.6, p.68; §5.2, pp.71–72. Upper and lower operators, their cotangent conventions and integral extension are specified.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-2-integral-hecke-algebra"></a>

### The geometric integral Hecke algebra

**Definition** · `ModularCurvesPartII:R14.2/integral-hecke-algebra` · planet: *Integral geometric Hecke algebra*

Define T_J as the unital image of the abstract integral full-subgroup Hecke/diamond algebra in End(J₁(N)), using the upper convention and all good/bad operators; lower gives its polarization-transpose isomorphic image. It is a commutative finite free ℤ-algebra as a ℤ-module because End(J) is finite free and T_J is a submodule. Faithful action means injectivity of this image algebra into End(J), integral Betti H¹ and End(T_ℓJ), not faithfulness of the entire abstract double-coset algebra before quotienting its kernel. Its rational rank is computed by the modular-form comparison below; on Γ₀ it equals dim_ℚ S₂(Γ₀(N),ℚ). If g=0 the image is the zero ring, of rank 0. No R14.3 eigenspace freeness or rank-two Galois theorem is used here.

**Proof plan.**

1. Take the image ring of the specified realization, inheriting the commutative relations.
2. Use the imported finite-freeness of the abelian Hom group to deduce finite-freeness of its ℤ-submodule.
3. Identify the faithful realized integral action and postpone any rank-two eigenspace claim to R14.3.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.heckeAlgebraUpper` | constructor | The image subring of End(J) with its upper action. |
| `TauCeti.ModularCurves.heckeAlgebraUpper_finiteFree` | instance | Its underlying ℤ-module is finite free, including the zero case. |
| `TauCeti.ModularCurves.heckeAlgebraLower_equiv` | equivalence | Polarization transpose identifies upper and lower commutative image algebras. |
| `TauCeti.ModularCurves.heckeAlgebraUpper_faithful` | characterisation | The image acts faithfully on J and the supplied integral realizations. |
| `TauCeti.ModularCurves.heckeAlgebraUpper_rank` | compatibility | Its rational rank agrees with the appropriately descended weight-two form space. |

**Unit tests.**

- `TauCeti.ModularCurves.heckeAlgebra_genus_zero` (degenerate): Γ₀(1) gives the zero image ring of rank 0.
- `TauCeti.ModularCurves.heckeAlgebra_gammaZero_eleven` (computation): The Γ₀(11) image ring has ℤ-rank 1.
- `TauCeti.ModularCurves.heckeAlgebra_image_kernel` (non-example): An abstract Hecke operator annihilating all level-N forms is zero in T_J.
- `TauCeti.ModularCurves.heckeAlgebra_transpose` (compatibility): Duality reverses products, but on this commutative image it is a ring isomorphism between conventions.

**Uses.**

- R14.3: Supplies the finite faithful integral coefficient ring; R14.3 owns eigenquotients and rank-two assertions.
- ModularForms Layer 8: The geometric realization comparison identifies its existing algebra.

**Prerequisites.**

- [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators)
- `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

**Consumers in this roadmap.** [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions); [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing); [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison); [`R14.5/newform-hecke-prime`](#r14-5-newform-hecke-prime); [`R14.5/modular-quotient`](#r14-5-modular-quotient)

**Acceptance checks.**

- For genus zero T_J=0, not ℤ. For Γ₀(11), g=1 so T_J has rank 1.
- Replacing the image algebra by the abstract Hecke algebra loses finite rank and faithfulness.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.66–69; §5.2, pp.71–72. The integral Hecke ring is a finite free image algebra and agrees with the Jacobian action.
- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p.306. For Γ₀ the characteristic-zero coefficient pairing computes the rational rank.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-2-weil-pairing-adjointness"></a>

### Polarization and Hecke adjoints

**Theorem** · `ModularCurvesPartII:R14.2/weil-pairing-adjointness` · planet: *Hecke adjointness*

The canonical polarization gives a perfect alternating Weil pairing T_ℓJ×T_ℓJ→ℤ_ℓ(1). Upper and lower Hecke operators are mutually adjoint. For p∤N and upper diamond convention, T_p^†=⟨p⟩⁻¹T_p and ⟨a⟩^†=⟨a⟩⁻¹. At bad p use leg reversal, or conjugation by the chosen cyclotomic Fricke map w_ζ; do not substitute an undefined diamond p. Fricke conjugation exchanges upper/lower for all Hecke operators, so the w-twisted bilinear pairing makes the image algebra self-adjoint; this twisted pairing is not claimed alternating. After choosing ℚ̄→ℂ and roots ζ_(ℓ^r)=exp(2πi/ℓ^r), the Weil form on T_ℓPic⁰ corresponds to the negative of the integral cup form on H¹, as in Conrad’s sign convention. With Galois action retain the Tate-twist multiplier and g w_ζ g⁻¹=w_(gζ).

**Proof plan.**

1. Use norm/pullback polarization transposes to compute the adjoint of each correspondence.
2. Compare with Petersson and the Fricke conjugation law to obtain the stated diamond factors.
3. Fix the roots-of-unity identification before comparing Weil and cup signs; retain the Galois twist instead of treating the pairing as ℤ_ℓ-valued intrinsically.

**Prerequisites.**

- [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators)
- [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution) (Cyclotomic Fricke involution)
- [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators)
- `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`
- [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace) (Integral étale correspondence trace)

**Consumers in this roadmap.** [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions); [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint); [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison); [`R14.5/modular-quotient-differentials`](#r14-5-modular-quotient-differentials); [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura)

**Acceptance checks.**

- For Γ₀ good p the diamond is trivial and T_p is self-adjoint.
- Negating the cup form changes the comparison sign but not the norm–pullback transpose; a convention-free equality would fail.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 Theorem 5.2 and Corollary 5.3, p.66; Lemma 5.7, pp.68–69; Theorem 5.8, p.69. Petersson adjoints, the negative cup/Weil sign and twisted self-adjointness fix all conventions.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-2-tate-module-with-galois-and-hecke-actions"></a>

### The modular Jacobian Tate module

**Construction** · `ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions` · planet: *Modular Jacobian Tate module*

For ℓ prime, over ℚ define T_ℓJ=lim_r J[ℓ^r](ℚ̄), a finite free ℤ_ℓ-module of rank 2g with its continuous G_ℚ action and commuting rational Hecke/diamond action. Intrinsically Kummer identifies it with H¹_et(C_ℚ̄,ℤ_ℓ(1)); choosing a complex embedding and compatible roots removes the twist in the comparison with integral Betti H¹⊗ℤ_ℓ. It is not identified with H₁ without duality/polarization. The map End(J)⊗ℤ_ℓ→End_(ℤ_ℓ)(T_ℓJ) is injective with torsion-free cokernel in the supplied Hom theorem; equality with the Galois centralizer is not asserted. Good reduction over ℤ[1/N] makes this representation unramified outside Nℓ by the lower arithmetic good-reduction criterion. w_ζ is defined over its cyclotomic field and obeys semilinear Galois conjugation, rather than commuting with all G_ℚ. The module is rank 2g over ℤ_ℓ; rank 2 over a Hecke factor belongs to R14.3.

**Proof plan.**

1. Import the A4 inverse-limit carrier, its freeness and continuous action.
2. Apply Kummer to Pic⁰ and the supplied integral comparison, tracking the twist and sign.
3. Use the A6 Hom injection for faithfulness and the arithmetic good-reduction criterion for unramifiedness; handle Fricke through its field of definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.jacobianTateModule` | constructor | The inverse-limit ℤ_ℓ lattice with topology and continuous Galois action. |
| `TauCeti.ModularCurves.jacobianTateModule_rank` | characterisation | Its ℤ_ℓ-rank is 2g. |
| `TauCeti.ModularCurves.jacobianTateModule_kummer` | equivalence | T_ℓ Pic⁰≃H¹_et(C,ℤ_ℓ(1)), retaining the twist. |
| `TauCeti.ModularCurves.jacobianTateModule_hecke` | instance | The rational geometric Hecke image acts continuously and commutes with G_ℚ. |
| `TauCeti.ModularCurves.jacobianTateModule_faithful` | compatibility | The imported Hom injection makes the integral image algebra faithful. |
| `TauCeti.ModularCurves.jacobianTateModule_unramified` | compatibility | Unramifiedness away from Nℓ follows from the specified good abelian model. |

**Unit tests.**

- `TauCeti.ModularCurves.jacobianTateModule_zero` (degenerate): Genus zero gives a rank-zero lattice.
- `TauCeti.ModularCurves.jacobianTateModule_eleven` (computation): Γ₀(11) gives rank 2 over ℤ_ℓ, rather than rank 1.
- `TauCeti.ModularCurves.jacobianTateModule_twist` (non-example): Removing ℤ_ℓ(1) without a roots-of-unity choice loses the cyclotomic Galois multiplier.
- `TauCeti.ModularCurves.jacobianTateModule_fricke` (compatibility): g w_ζ g⁻¹=w_(gζ), while rational Hecke endomorphisms commute with g.

**Uses.**

- R14.3: Starting carrier for Hecke eigenspaces and automorphic Galois representations.
- R13.6 and R20: Specializes into the modular torus/component sequence without rebuilding general monodromy.

**Prerequisites.**

- [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms)
- [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators)
- [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra) (The geometric integral Hecke algebra)
- [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness) (Polarization and Hecke adjoints)
- `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`
- `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`
- [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace) (Integral étale correspondence trace)
- `ArithmeticGaloisRepresentations:R01.6/good-reduction-specialization`

**Consumers in this roadmap.** [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison); [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison); [`R14.4/compact-ihara`](#r14-4-compact-ihara)

**Acceptance checks.**

- At genus zero the Tate module is zero. For Γ₀(11) it has ℤ_ℓ-rank 2, and the Hecke algebra has rank 1.
- At ℓ=2 the degree-2 trace remains multiplication by 2 rather than an invertible normalization.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.67–69; §5.2, pp.72–73. The integral H¹/Tate comparison, commuting rational endomorphisms and unramified good-base action are the modular instance.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-2-rational-coefficient-pairing"></a>

### The rational coefficient pairing

**Theorem** · `ModularCurvesPartII:R14.2/rational-coefficient-pairing`

For Γ₀(N) over ℚ identify cotangent forms with S₂(Γ₀(N),ℚ), the rational q-expansion space, using the earlier descent supplier. With the lower Jacobian Hecke image T and β(T,f)=a₁(Tf), the pairing (T⊗ℚ)×S₂(Γ₀(N),ℚ)→ℚ is perfect. The identities a_m(f)=a₁(T_m f), determination by q expansion, commutativity, and faithful cotangent action prove its two nondegeneracy statements. Consequently dim_ℚ(T⊗ℚ)=g(X₀(N)). For Γ₁ or character components, use the actual descended coefficient field and diamond action; this statement does not replace the field by ℚ without proof. Rational perfection alone does not imply an integral unimodular pairing on a chosen q-lattice.

**Proof plan.**

1. If β(T,f)=0 for all T, each Fourier coefficient of f is zero, so f=0.
2. If β(T,f)=0 for every f, then β(T_m,Tf)=β(T_mT,f)=0 for all m,f; hence Tf=0 for every f.
3. Use cotangent faithfulness in characteristic zero to conclude T=0, then use finite dimension for perfection.

**Assembly note.** The perfection of β(T,f)=a₁(Tf) on H⁰(X₀(N)_ℚ,Ω¹) for the full cotangent Hecke image is [`R12.5/perfect-hecke-pairing`](#r12-5-perfect-hecke-pairing), which this target imports. Its own content is the identification of the lower Jacobian Hecke image tensored with ℚ with that cotangent image, by faithfulness of the cotangent action in characteristic zero; the nondegeneracy steps of the proof plan are the supplier's proof and are not carried out again.

**Prerequisites.**

- [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra) (The geometric integral Hecke algebra)
- [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators)
- [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions)
- [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials) (Weight-two cusp forms and regular differentials)
- [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing) (The full Hecke first-coefficient pairing)
- [`R12.5/perfect-hecke-pairing`](#r12-5-perfect-hecke-pairing) (Perfection of the full Hecke pairing)
- [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent) (Canonical generic models and coefficient descent)

**Consumers in this roadmap.** [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison)

**Acceptance checks.**

- Γ₀(1): both sides have dimension 0. Γ₀(11): both have dimension 1.
- A determinant of an integral pairing need not be ±1 merely because its rationalization is perfect.

**Sources.**

- [`grosszagier`](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p.306. Faithful cotangent Hecke action and the rational a₁-pairing prove the Γ₀ rank formula.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

<a id="r14-2-integral-hecke-realization-comparison"></a>

### Integral Hecke realization comparison

**Comparison** · `ModularCurvesPartII:R14.2/integral-hecke-realization-comparison`

With upper/lower transpose conventions fixed, identify the same integral image of the abstract Hecke algebra on J, Betti H¹(C(ℂ),ℤ), and T_ℓJ for every ℓ. Equality of integral kernels uses the faithful Hom/Betti comparison and the supplied End⊗ℤ_ℓ injection; equality after tensoring with ℚ alone does not identify integral lattices. The additional modular-symbol comparison requires a weight-two cuspidal carrier: the kernel of the boundary map in ModularForms Layer 8’s integral symbol module, with its torsion removed, and its actual integral comparison with compact-curve H₁ (or the correctly transposed dual H¹). This missing contract is recorded as a gap; the full symbol module with boundary/Eisenstein classes is not asserted to have the same Hecke kernel. The cotangent/classical-form comparison is the lower action, and the upper action is its adjoint. Normalized coherent weight-two T_p comes from the separate local p-divisibility theorem; Jacobian/étale push–pull has no inverse-degree normalization. These compare existing Hecke actions and their image quotients, not a new abstract algebra or a rank-two eigenspace theorem.

**Hypotheses and conventions.**

- For the modular-symbol realization, supply the recorded integral cuspidal-symbol comparison contract, preserving diamonds and bad-prime operators; no comparison with the entire uncut symbol module is assumed.

**Proof plan.**

1. Use complex comparison to identify integral Betti and Tate lattices after the required choices, compatibly with both correspondence legs.
2. An endomorphism acting as zero on the lattice is zero by the imported Hom injection, so all integral image kernels coincide.
3. Construct the weight-two cuspidal symbol boundary kernel and remove its torsion. Supply the integral Hecke-equivariant comparison with compact-curve H₁, or its correctly transposed dual H¹, with diamonds and bad-prime operators. This is the recorded missing integral comparison, not a consequence of Layer 8’s form-side quotient. Then equality of integral kernels follows from the comparison; boundary/Eisenstein symbols never enter this equality.

**Prerequisites.**

- [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra) (The geometric integral Hecke algebra)
- [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions) (The modular Jacobian Tate module)
- [`R14.2/rational-coefficient-pairing`](#r14-2-rational-coefficient-pairing) (The rational coefficient pairing)
- [`R14.1/coherent-hecke-trace`](#r14-1-coherent-hecke-trace) (Integral coherent Hecke trace)
- [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions)
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`
- [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace) (Integral étale correspondence trace)

**Acceptance checks.**

- For degree p+1 with ℓ∣p+1 the same-leg norm–pull still acts as [p+1] in every realization.
- A rationally isomorphic but index-2 different Hecke lattice is not accepted as this integral comparison.
- At Γ₁(5), the compact curve has genus zero but the full weight-two symbol module has nonzero boundary classes (four cusps). The unit acts nontrivially on these symbols and trivially on the zero Jacobian; their integral image kernels differ. Cut to the cuspidal carrier before comparing.

**Sources.**

- [`ribetstein`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–69; §5.2, pp.71–72. The appendix supplies the compact-curve integral Betti/Jacobian Hecke action and its dual conventions. It does not supply the claimed integral identification with the full modular-symbol module.
- [`conrad07`](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, pp.46–48. The coherent normalization is separate from integral Picard push–pull.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/IntegralGeometry`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

X₁(5) has genus zero and four cusps. Its compact Jacobian is zero and its image Hecke algebra has rank zero, while its full symbol module has nonzero boundary classes. This prevents identifying the entire symbol Hecke kernel with the compact Jacobian kernel. On a ramified finite map, pushforward after pullback multiplies by the total degree, not by the number of distinct points of a special fibre. The negative cup/Weil sign is checked with a chosen complex embedding and compatible roots of unity.

<a id="r14-3"></a>

## R14.3. Cohomological realisations and pairings

Construct the cohomological realizations on the actual smooth universal elliptic family: the weight-two Eichler–Shimura isomorphism with its Hecke equivariance, cup product and Petersson product, self-adjointness for the w_ζ-twisted pairing and rational rank two over the Hecke algebra; the relative symmetric-power coefficient systems, finite and adic parabolic cohomology, the boundary sequence, the integral comparison, the Hecke action with coefficients and parabolic Poincaré duality; non-Eisenstein removal of the boundary and localized integral freeness; the comparison with modular symbols; and the weight-two Tate comparison with the Jacobian. Rational statements are kept apart from integral saturation and reduction, and the higher-weight boundary and dual-lattice hypotheses stay visible.

<a id="r14-3-relative-coefficient-system"></a>

### Geometric weight coefficient systems

**Construction** · `ModularCurvesPartII:R14.3/relative-coefficient-system` · planet: *Symmetric-power coefficient systems*

For the universal elliptic curve f:E→Y₁(N), N≥5, construct L_B=R¹f_an,\*ℤ and L\_{ℓ,n}=R¹f_et,\*ℤ/ℓⁿ, with ℓ invertible on the base. Their geometric fibres are H¹ of the elliptic fibre, locally free of rank two. For r=k−2≥0 set L_r=Sym^r L, of rank r+1. The coefficient maps along an isogeny are induced by its pullback on relative H¹; integral lattices and duals are retained before any inversion of ℓ.

**Hypotheses and conventions.**

- A universal elliptic curve from R13.2; k≥2, n≥1, ℓ prime; finite étale statements require ℓ invertible.
- For coarse levels lacking a fine universal family, use a supplied fine cover with its descent data; descent invariants are not exact if the deck-group order is not invertible.

**Proof plan.**

1. Import the universal family and proper smooth base change to construct relative degree-one sheaves; on the analytic side transport fibre cohomology through local trivializations.
2. Apply the existing symmetric-power functor to each transport map; its identity/composition laws give a local system.
3. Use the elliptic cup product and isogeny pullback to fix the covariant/contravariant and Tate-twist conventions.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.relativeBettiH1` | constructor | The rank-two Betti local system of the supplied universal elliptic family. |
| `TauCeti.ModularCurves.relativeEtaleH1` | constructor | The finite ℤ/ℓⁿ relative degree-one étale local system. |
| `TauCeti.ModularCurves.weightCoefficients` | constructor | Sym^{k−2} of the relative H¹ local system, using the existing representation symmetric-power functor. |
| `TauCeti.ModularCurves.weightCoefficients_fibre` | characterisation | Its fibre at y is Sym^{k−2} H¹(E_y,A), naturally in y and the coefficient ring A. |
| `TauCeti.ModularCurves.weightCoefficients_isogeny` | functoriality | The coefficient morphism is Sym^{k−2} of the isogeny pullback; identity and composite isogenies give identity and composite maps. |
| `TauCeti.ModularCurves.weightCoefficients_compare` | compatibility | Artin comparison identifies the finite Betti and étale systems and their isogeny maps. |

**Unit tests.**

- `weightCoefficients_two` (degenerate): At k=2, Sym⁰ L is the constant rank-one system.
- `weightCoefficients_three` (computation): At k=3, a fibre is L_y and has rank two.
- `weightCoefficients_compat` (compatibility): On every monodromy representation ρ, the action is exactly Representation.symmetricPower ρ (k−2).
- `weightCoefficients_unipotent` (non-example): At k=3 a cusp loop with fibre matrix [[1,w],[0,1]], w nonzero, acts nontrivially over ℤ; the coefficient system is not constant.

**Uses.**

- [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology) (Finite and adic parabolic cohomology): Actual coefficients for parabolic cohomology.
- AutomorphicGaloisRepresentations:R19.1: Higher-weight geometric eigenspace input with its lattice.

**Prerequisites.**

- `ModularCurvesPartII:R13.2`, used through its targets [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks); [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries) (Fine loci and bad-level inertia); [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes) (Agreement on the ordinary and tame loci)
- `AbelianSchemesAndArithmeticModuli:A4`
- `tauceti:TauCeti.LocalCoefficientSystem`
- `tauceti:TauCeti.LocalCoefficientSystem.pullback`
- `tauceti:Representation.symmetricPower`
- `EtaleDualityAndPerverseSheaves:EDC.0`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`
- `tauceti:SymmetricPower.finrank_eq`

**Consumers in this roadmap.** [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology); [`R14.3/integral-comparison`](#r14-3-integral-comparison); [`R14.3/parabolic-duality`](#r14-3-parabolic-duality)

**Acceptance checks.**

- For r=0 the coefficient system is constant; for r=1 its fibre has rank two.
- No universal elliptic family is silently put on a coarse level-one curve.

**Sources.**

- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §§3.9–3.11, pp. 154–156; §3.16, pp. 157–158. Relative H¹ of the universal elliptic curve gives the weight-r coefficient system and its isogeny maps; Deligne works rationally, so finite coefficient base change is imported explicitly.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-parabolic-cohomology"></a>

### Finite and adic parabolic cohomology

**Construction** · `ModularCurvesPartII:R14.3/parabolic-cohomology` · planet: *Parabolic cohomology*

For j:Y→X the supplied compactification and the geometric L_r with A=O, O/πⁿ or K=Frac(O), define H¹_par(Y,L_r)=im(H¹_c(Y,L_r)→H¹(Y,L_r)). Define finite étale analogues first and take compatible inverse limits for the O-adic realization, with O a finite extension of ℤ_ℓ. For constant weight-two coefficients, H¹_par(Y,A)=im(H¹(X,A)→H¹(Y,A)); for these smooth curves the latter map is injective. Twisted coefficients use j_\*L_r and the local boundary sequence, not extension by zero identified with direct image.

**Hypotheses and conventions.**

- N≥5 or a supplied torsion-free fine cover; j and its finite cusp set D=X\\Y are fixed.
- Adic notation denotes the inverse-limit lattice, not merely tensoring rational Deligne cohomology.

**Proof plan.**

1. Import absolute and relative twisted cochains and compact supports from AlgebraicTopology, and finite étale cohomology from EDC.0.
2. Construct the map forgetting support; use its image submodule as the parabolic group.
3. Use the boundary exact sequence to compare with compactification cohomology; establish finite coefficient transition maps before taking limits.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.parabolicH1` | constructor | The image submodule of the actual support-forgetting map u:H¹_c→H¹. |
| `TauCeti.ModularCurves.mem_parabolicH1` | characterisation | x lies in parabolicH1 u exactly when x=u(y) for a compact-support class y. |
| `TauCeti.ModularCurves.parabolicH1_inclusion` | projection | The canonical injection into ordinary H¹. |
| `TauCeti.ModularCurves.parabolicH1_map` | functoriality | For a commuting square b∘u=v∘a, b induces a map of the images; identity and composition are respected. |
| `TauCeti.ModularCurves.parabolicH1_compact` | compatibility | For proper Y=X, the support map is an isomorphism and parabolic H¹ is ordinary H¹. |
| `TauCeti.ModularCurves.parabolicH1_inverseLimit` | compatibility | Under the finite generation and transition hypotheses of integral-comparison, the finite-level parabolic system recovers the specified O-lattice. |
| `TauCeti.ModularCurves.parabolicH1_map_id` | functoriality | The induced image map for identity maps on the support square is the identity. |
| `TauCeti.ModularCurves.parabolicH1_map_comp` | functoriality | The image map of a composite of two commuting support squares is the composite of their image maps. |

**Unit tests.**

- `parabolicH1_id` (degenerate): The image of the identity support map is the entire module.
- `parabolicH1_zero` (computation): A zero support map has zero parabolic image.
- `parabolicH1_Gm` (non-example): For Y=G_m(C), constant ℤ coefficients, ordinary H¹≅ℤ but parabolic H¹=0.
- `parabolicH1_compact_test` (compatibility): For the compact curve X₀(11), parabolic constant ℤ H¹ has rank two.

**Uses.**

- [`R14.3/boundary-exact-sequence`](#r14-3-boundary-exact-sequence) (Boundary and interior cohomology): Specify the support map whose image is parabolic.
- [`R14.4/degeneracy-cohomology`](#r14-4-degeneracy-cohomology) (The two geometric degeneracy pullbacks): Source and target of integral pullbacks.

**Prerequisites.**

- [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system) (Geometric weight coefficient systems)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `EtaleDualityAndPerverseSheaves:EDC.0`
- `mathlib:LinearMap.range`
- `mathlib:AlgebraicGeometry.Scheme.EllAdicCohomology`

**Consumers in this roadmap.** [`R14.3/boundary-exact-sequence`](#r14-3-boundary-exact-sequence); [`R14.3/integral-comparison`](#r14-3-integral-comparison); [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients); [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover)

**Acceptance checks.**

- On an open genus-zero curve, ordinary boundary classes need not be parabolic.
- The degree-one pro-étale ℤ_ℓ carrier in Mathlib is an untwisted comparison target, not the whole coefficient API.

**Sources.**

- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9, pp. 154–155; (3.20), pp. 159–160. Parabolic cohomology is the compact-support image. Its integral/finite realization needs the imported cochain and étale infrastructure.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-integral-comparison"></a>

### Integral comparison and change of level

**Comparison** · `ModularCurvesPartII:R14.3/integral-comparison`

For the supplied smooth finite-type modular curves over Q̄, a chosen embedding Q̄↪C, and finite locally constant ℤ/ℓⁿ coefficients from the universal family, Artin comparison gives H^i_et(Y,L\_{r,ℓ,n})≅H^i_B(Y_an,L\_{r,B}/ℓⁿ), with compact-support analogues and their support maps. These identify finite parabolic images. After proving the required inverse-limit exactness and finite generation, they give the adic comparison; for r=0 this also identifies the actual compact-curve lattice with Mathlib’s pro-étale EllAdicCohomology in degree one. Pullback, trace, cup product and level maps commute with comparison.

**Hypotheses and conventions.**

- The comparison includes local-system coefficients and compact support, not merely constant rational cohomology.
- Derived-limit obstructions must be eliminated by finite coefficient Mittag–Leffler systems; reduction modulo π commutes only under the torsion hypotheses of localized-freeness.

**Proof plan.**

1. Import the general étale–Betti comparison required by RS-06.
2. Use naturality with j_!→Rj_\* and finite correspondences; apply the coefficient comparison from relative-coefficient-system.
3. Apply finite generation and Mittag–Leffler exactness to the finite systems; separately request the comparison with Mathlib’s pro-étale carrier.

**Prerequisites.**

- [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system) (Geometric weight coefficient systems)
- [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology) (Finite and adic parabolic cohomology)
- `SchemeAndStackFoundations:SF.2`
- `EtaleDualityAndPerverseSheaves:EDC.0`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`

**Consumers in this roadmap.** [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism); [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients); [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison)

**Acceptance checks.**

- Trace composed with pullback is degree times identity in each realization.
- Changing the complex embedding changes the comparison choice; Galois invariance is not asserted for that choice.

**Sources.**

- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9 and discussion of W_ℓ, pp. 154–156; corollary following Theorem 4.1, printed as Corollaire 3.2, p. 161. The same geometric space has Betti and algebraic adic descriptions; the general comparison and integral passage are imported rather than re-proved here. This corollary is a lisse-sheaf/unramifiedness consequence, not the general Artin comparison theorem; the latter is explicitly requested from SF.2.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-weight-two-shimura-isomorphism"></a>

### The weight-two Shimura isomorphism is Hecke-equivariant

**Theorem** · `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism` · planet: *Weight-two Shimura isomorphism*

For N ≥ 5, the Hodge decomposition gives S₂(Γ₁(N), ℂ) ⊕ S̄₂(Γ₁(N), ℂ) ≅ H¹(X₁(N)^an, ℤ) ⊗ ℂ, and it identifies ⟨n⟩ ⊕ ⟨n⟩̄ with ⟨n⟩^\*, T_p ⊕ T̄_p with T_p^\* = (π₁^{(p)})_\* ∘ (π₂^{(p)})^\* and w_N ⊕ w̄_N with w^\*\_{e^{2πi/N}}, where π₁^{(p)}, π₂^{(p)} : X₁(N, p) → X₁(N) are the degeneracy maps and (π₁^{(p)})_\* is the trace.

**Hypotheses and conventions.**

- N ≥ 5; at N &lt; 5 both sides vanish. The integral Betti carrier is H¹ of the compact analytic curve. ModularForms Layer 8 supplies a homological symbol module with boundary and possible torsion; only the separately proved cuspidal/dual comparison identifies the relevant lattice.

**Proof plan.**

1. Hodge decomposition of the compact Riemann surface X₁(N)^an with H⁰(Ω¹) = S₂(Γ₁(N), ℂ).
2. Compute T_p^\* on H¹ through the trace along π₁^{(p)} (stalkwise sum with ramification multiplicities) and pullback along π₂^{(p)}; compare with the double-coset action on cusp forms.
3. Diamond operators and w_ζ are induced by automorphisms, so pullback commutes with the Hodge decomposition.

**Prerequisites.**

- `ModularCurvesPartII:R12.5`, used through its targets [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials) (Weight-two cusp forms and regular differentials); [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy) (The Hodge line and the automorphy factor)
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions); [`R14.1/coherent-hecke-trace`](#r14-1-coherent-hecke-trace) (Integral coherent Hecke trace)
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms); [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- [`R14.3/integral-comparison`](#r14-3-integral-comparison) (Integral comparison and change of level)

**Consumers in this roadmap.** [`R14.3/cup-product-petersson`](#r14-3-cup-product-petersson); [`R14.3/betti-free-rank-two`](#r14-3-betti-free-rank-two); [`R14.5/modular-quotient-differentials`](#r14-5-modular-quotient-differentials); [`R14.5/oldform-comparison`](#r14-5-oldform-comparison)

**Acceptance checks.**

- Conrad omits the proof of the compatibility; a complete proof must check the trace formula against the classical double coset (ModularCurvesPartII R12.5 normalises the differentials and Hecke operators).

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 64 (printed page; PDF page 68). The isomorphism.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 65 (printed page; PDF page 69). Theorem 5.1.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-cup-product-petersson"></a>

### Cup product and the Petersson product

**Theorem** · `ModularCurvesPartII:R14.3/cup-product-petersson`

With H²(X₁(N)^an, ℤ) ≅ ℤ by the i-orientation, the cup product pairing on H¹(X₁(N)^an, ℤ) and the non-normalised Petersson product satisfy (Sh(f₁ + ḡ₁), Sh(f₂ + ḡ₂)) = 4π(⟨f₁, g₂⟩ − ⟨f₂, g₁⟩).

**Hypotheses and conventions.**

- The cup-product pairing is perfect; the Petersson integral converges by exponential decay at the cusps.

**Proof plan.**

1. Use the normalization of Sh in Conrad §5.1, pp. 63–65, rather than unscaled f dz. Compute the wedge of the resulting harmonic representatives and evaluate using the specified i-orientation; with the non-normalized Petersson measure the factor is 4π as in Theorem 5.2, p. 66.

**Prerequisites.**

- [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism) (The weight-two Shimura isomorphism is Hecke-equivariant)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `ModularCurvesPartII:R12.5`, used through its targets [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials) (Weight-two cusp forms and regular differentials)

**Consumers in this roadmap.** [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint)

**Acceptance checks.**

- Only adjoints matter downstream; the factor 4π is harmless.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 66 (printed page; PDF page 70). Theorem 5.2 and its use.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-hecke-twisted-self-adjoint"></a>

### Hecke operators are self-adjoint for the w_ζ-twisted pairing

**Lemma** · `ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint`

With [x, y] = (x, w^\*_ζ y) for ζ = e^{2πi/N}, every T ∈ T₁(N) is self-adjoint on H¹(X₁(N)^an, ℤ); for (·,·) the adjoint of T_p^\* (p ∤ N) is ⟨p⁻¹⟩^\* T_p^\* and that of ⟨n⟩^\* is ⟨n⁻¹⟩^\*. The same holds for any primitive N-th root ζ.

**Hypotheses and conventions.**

- T₁(N) ⊂ End_ℤ H¹(X₁(N)^an, ℤ) generated by the T_p^\* and ⟨n⟩^\*; commutative and finite flat over ℤ (Tau Ceti ModularForms Layer 8 owns the integral Hecke algebra).

**Proof plan.**

1. Transport the classical Petersson adjoints (T_p for p | N via w_N) through cup-product-petersson.
2. w^\*\_{ζ^j} ∘ w^\*_ζ = ⟨j⟩^\*, a unit commuting with T₁(N), reduces general ζ to e^{2πi/N}.

**Prerequisites.**

- [`R14.3/cup-product-petersson`](#r14-3-cup-product-petersson) (Cup product and the Petersson product)
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution) (Cyclotomic Fricke involution); [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions)
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness) (Polarization and Hecke adjoints)

**Consumers in this roadmap.** [`R14.3/betti-free-rank-two`](#r14-3-betti-free-rank-two); [`R14.5/modular-quotient-differentials`](#r14-5-modular-quotient-differentials)

**Acceptance checks.**

- The case T = T_p^\* with p | N is the subtle one; keep it.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 66 (printed page; PDF page 70). Corollary 5.3.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-weight-two-tate-comparison"></a>

### The actual Jacobian Tate realization

**Comparison** · `ModularCurvesPartII:R14.3/weight-two-tate-comparison`

For J=Pic⁰(X₁(N)/Q), the canonical comparison identifies T_ℓJ with H¹_et(X₁(N)_Q̄,ℤ_ℓ(1)) and with the dual of untwisted H¹, using the principal polarization; equivalently T_ℓJ is integral first homology after Betti comparison. The comparison is functorial for Picard and Albanese actions, which are adjoint rather than identical. After tensoring Q_ℓ it intertwines the two Hecke conventions. The rank-two consequence is proved in betti-free-rank-two using this comparison; it is not an input to the comparison itself.

**Hypotheses and conventions.**

- This comparison precedes rank-two freeness. The initial Tate carrier and functoriality from R14.2 must not depend on betti-free-rank-two.

**Proof plan.**

1. Apply the Kummer sequence for the Jacobian/Picard functor to identify ℓⁿ torsion with finite curve H¹(1).
2. Pass to limits using the supplied Tate module construction; compare cup and Weil pairings.
3. Use polarization to relate Picard pullback to Albanese norm; apply the integral comparison on the Betti side.

**Prerequisites.**

- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions) (The modular Jacobian Tate module); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness) (Polarization and Hecke adjoints)
- `AbelianSchemesAndArithmeticModuli:A4`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`
- [`R14.3/integral-comparison`](#r14-3-integral-comparison) (Integral comparison and change of level)
- `EtaleDualityAndPerverseSheaves:EDC.2`

**Consumers in this roadmap.** [`R14.3/betti-free-rank-two`](#r14-3-betti-free-rank-two); [`R14.4/compact-ihara`](#r14-4-compact-ihara)

**Acceptance checks.**

- A Tate twist or a dual cannot be omitted when comparing T_ℓJ with untwisted H¹.
- The comparison supplies the actual Jacobian module, not an abstract module declared free by definition.
- With Conrad’s Weil-pairing convention, the diagram comparing cup and Weil pairings anticommutes (§5.1, p. 69). Preserve that sign; it does not change the resulting adjoints.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), §5.1, (5.4) and Theorem 5.8, pp. 68–69; Corollary 5.9, pp. 69–70. The Tate/homology comparison and the two Hecke actions transport the rational freeness theorem.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-betti-free-rank-two"></a>

### H¹ is free of rank two over the Hecke algebra

**Theorem** · `ModularCurvesPartII:R14.3/betti-free-rank-two` · planet: *Rational rank-two cohomology*

H¹(X₁(N)^an, ℚ) is free of rank 2 over ℚ ⊗ T₁(N), and Hom_ℚ(ℚ ⊗ T₁(N), ℚ) is free of rank 1 (ℚ ⊗ T₁(N) is Gorenstein). Consequently V_ℓ(N) = ℚ_ℓ ⊗ T_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗ T₁(N) for either Hecke action.

**Hypotheses and conventions.**

- Characteristic zero coefficients; integral freeness is not claimed (it can fail at Eisenstein maximal ideals).

**Proof plan.**

1. Use the twisted perfect pairing to identify rational H¹ with its Q-dual as Hecke modules.
2. Over C, the coefficient pairing (f,T)↦a₁(Tf) identifies the dual of S₂, rather than S₂ itself at this point of the proof, with C⊗T. The q-expansion principle and faithful Hecke action prove nondegeneracy on both sides.
3. Apply Hodge decomposition to conclude that the dual of H¹ over C is free of rank two; transfer through self-duality and faithfully flat descent over the semilocal rational Hecke algebra.
4. Once H¹ is free rank two and self-dual, its two Hecke-dual summands show Hom_Q(Q⊗T,Q) is projective of full support. Q-dimension comparison gives rank one, hence freeness over the semilocal ring.
5. Transport to V_ℓJ via the initial Tate comparison, preserving the two adjoint Hecke conventions.

**Prerequisites.**

- [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism) (The weight-two Shimura isomorphism is Hecke-equivariant)
- [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint) (Hecke operators are self-adjoint for the w_ζ-twisted pairing)
- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`
- `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`
- [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison) (The actual Jacobian Tate realization)

**Consumers in this roadmap.** [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension)

**Acceptance checks.**

- Integral freeness after localising at a non-Eisenstein maximal ideal is a separate statement (remaining work).
- This is rational rank-two freeness for the full Hecke algebra of Conrad §5.1, including old blocks; it asserts neither integral Gorensteinness nor integral rank-two freeness at every maximal ideal.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 69 (printed page; PDF page 73). Corollary 5.9.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 70 (printed page; PDF page 74). The key reduction in the proof.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-boundary-exact-sequence"></a>

### Boundary and interior cohomology

**Theorem** · `ModularCurvesPartII:R14.3/boundary-exact-sequence`

For a smooth open complex or étale curve with finite puncture set D, the support-forgetting map fits into the cohomology sequence of j_!L→Rj_\*L→i_\*i^\*Rj_\*L. In degree one, H¹_par is ker(H¹(Y,L)→⊕\_{c∈D}H¹(I_c,L_c)); the neighboring H⁰ and H²_c terms are retained. For trivial A coefficients on a connected curve with s cusps, 0→H¹(X,A)→H¹(Y,A)→A^D→A→0 is exact, where the last map sums residues (and the étale terms carry the residue Tate twist).

**Hypotheses and conventions.**

- ℓ is invertible for étale coefficients; local punctured-disc/tame inertia comparison is part of the supplier request.
- The displayed constant-coefficient residue sequence ending A→0 assumes D is nonempty. If D is empty, retain H²(X,A) and use the identity support map; there is no final residue-surjection claim.
- The étale statement is geometric, over an algebraically closed field of characteristic different from ℓ; the curve is connected. Over other bases the corresponding cohomology of the cusp scheme must be retained, rather than replaced by A^D.

**Proof plan.**

1. Apply the localization triangle for j_! and Rj_\*; compute each boundary stalk by local inertia cohomology.
2. For constant coefficients the local invariant and residue groups are rank one; global orientation/trace identifies the final sum map.
3. Pullbacks and traces of finite correspondences induce morphisms of this sequence.

**Prerequisites.**

- [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology) (Finite and adic parabolic cohomology)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `EtaleDualityAndPerverseSheaves:EDC.0`
- `EtaleDualityAndPerverseSheaves:EDC.1`

**Consumers in this roadmap.** [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein); [`R14.3/localized-freeness`](#r14-3-localized-freeness)

**Acceptance checks.**

- Y=X\\{one cusp} has no additional ordinary degree-one rank; with two cusps it has one boundary generator.
- Do not replace H¹_par by all of H¹ before a localization argument.

**Sources.**

- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9 and (3.20), pp. 154–155, 159–160. The image formulation and duality require keeping the support and boundary terms distinct.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-geometric-hecke-coefficients"></a>

### Hecke operators with relative coefficients

**Theorem** · `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`

For a good prime q∤Nℓ and the actual isogeny correspondence Y₁(N,q) with maps q₁,q₂ and its universal isogeny, T_q on H¹_par(Y,L_r) is trace along q₁ after pullback along q₂ and the induced coefficient map. Its comparison with the classical weight k=r+2 operator uses Deligne’s normalization, including the q^{r+1} term in the good-prime Hecke polynomial. Diamond and prime-to-level degeneracy maps preserve the parabolic image; functorial traces satisfy the projection formula and trace∘pullback=degree.

**Hypotheses and conventions.**

- Both direction and scalar normalization are fixed by the universal isogeny, not by an arbitrary action on an unnamed cohomology module.

**Proof plan.**

1. Import the geometric correspondence and finite-map traces; apply Sym^r of the isogeny map.
2. Make the compact-support and ordinary squares commute, obtaining the map on their images.
3. Apply comparison and the analytic normalization of ModularForms; distinguish T_q from a rescaled double-coset operator.

**Prerequisites.**

- [`R14.3/integral-comparison`](#r14-3-integral-comparison) (Integral comparison and change of level)
- [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology) (Finite and adic parabolic cohomology)
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps); [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace) (Integral étale correspondence trace); [`R14.1/composition-relations-of-correspondences`](#r14-1-composition-relations-of-correspondences) (Hecke composition relations); [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators)
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`
- `EtaleDualityAndPerverseSheaves:EDC.0`
- `EtaleDualityAndPerverseSheaves:EDC.2`

**Consumers in this roadmap.** [`R14.3/parabolic-duality`](#r14-3-parabolic-duality); [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein); [`R14.4/degeneracy-cohomology`](#r14-4-degeneracy-cohomology); [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover)

**Acceptance checks.**

- At r=0 this recovers the weight-two Shimura convention.
- Changing the isogeny pullback to its dual without changing Tate twists must fail the pairing adjoint test.

**Sources.**

- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Propositions 3.18–3.19 and (3.20), pp. 158–160. The isogeny pull-push construction matches the classical Hecke operator with its weight factor.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-boundary-non-eisenstein"></a>

### Non-Eisenstein removal of the boundary

**Theorem** · `ModularCurvesPartII:R14.3/boundary-non-eisenstein`

For weight-two constant coefficients at a torsion-free congruence level and an anemic Hecke maximal ideal m of residue characteristic ℓ≥3, call m non-Eisenstein if its good-prime eigenvalues are not ψ₁(q)+qψ₂(q) with ψ₁,ψ₂ finite congruence characters and diamond product ψ₁ψ₂. The cusp boundary modules and H⁰(Y,O/π) have only those Eisenstein eigensystems. Thus they vanish after localization at m, and H¹_c→H¹ identifies its localized image with ordinary localized H¹. For Sym^r coefficients the same implication is a separate requested calculation, not an assertion from the weight-two source.

**Hypotheses and conventions.**

- Anemic operators exclude level and residue-characteristic primes; fine level removes stabilizer torsion.
- In weight two this definition is an algebraic Hecke condition; the identification with residual Galois irreducibility is a consequence in R19, not a prerequisite here.

**Proof plan.**

1. Compute the two parts of the good-prime correspondence on cusps from R14.1: one permutes with multiplicity q and the other with multiplicity one.
2. Diagonalize the finite cusp action after extending residue coefficients; obtain the displayed sums of congruence characters.
3. Apply exact localization to the boundary sequence; compute H⁰ by constants.

**Prerequisites.**

- [`R14.3/boundary-exact-sequence`](#r14-3-boundary-exact-sequence) (Boundary and interior cohomology)
- [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients) (Hecke operators with relative coefficients)
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences) (Full and cyclic isogeny correspondences); [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions)

**Consumers in this roadmap.** [`R14.3/localized-freeness`](#r14-3-localized-freeness); [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness)

**Acceptance checks.**

- An Eisenstein maximal ideal may retain cusp classes.
- The statement does not demand a Galois representation theorem to define non-Eisenstein localization.

**Sources.**

- [`TAYLOR-WILES`](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proof of Proposition 1 and preceding localization setup, author pp. 6–8. Localized irreducible weight-two cohomology replaces open-curve cohomology by the cuspidal module; the boundary calculation must precede that replacement.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-localized-freeness"></a>

### Finite generation and localized integral freeness

**Theorem** · `ModularCurvesPartII:R14.3/localized-freeness`

For a torsion-free congruence modular curve Y and a finite free O-local system L, H¹(Y,L) is O-finite. If H⁰(Y,L/π)_m=0, the localized group H¹(Y,L)_m is O-torsion-free, hence O-free; if in addition the boundary sequence localizes to zero, it equals H¹_par(Y,L)_m, and reduction gives H¹_par(Y,L)_m/πⁿ≅H¹_par(Y,L/πⁿ)_m. Constant weight-two coefficients satisfy these conditions at the non-Eisenstein ideals of boundary-non-eisenstein. Higher-weight claims retain the displayed vanishing conditions until the separate boundary gap is resolved.

**Hypotheses and conventions.**

- O is a complete DVR finite over ℤ_ℓ; anemic localization is a direct summand of the completed O-finite Hecke module.
- Use a finite graph deformation retract of the noncompact torsion-free quotient; its two-term cochain complex has finite free terms.

**Proof plan.**

1. Import the Fuchsian finite-type/free-group model and twisted cochains.
2. The coefficient sequence 0→L→L→L/π→0 shows π-torsion in H¹ is the image of H⁰(L/π); the localized vanishing kills it.
3. A finite torsion-free module over a DVR is free; graph cohomological dimension one removes H² obstructions to reduction.
4. Use the boundary sequence at O and finite levels to identify ordinary and parabolic groups under the stated vanishings.

**Prerequisites.**

- [`R14.3/boundary-exact-sequence`](#r14-3-boundary-exact-sequence) (Boundary and interior cohomology)
- [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein) (Non-Eisenstein removal of the boundary)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`

**Consumers in this roadmap.** [`R14.3/parabolic-duality`](#r14-3-parabolic-duality); [`R14.4/taylor-wiles-root-control`](#r14-4-taylor-wiles-root-control); [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness)

**Acceptance checks.**

- No freeness over the integral Hecke algebra is asserted.
- At level divisible by ℓ, or with coarse stabilizers, the displayed geometric and vanishing hypotheses must be checked afresh.

**Sources.**

- [`TAYLOR-WILES`](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proof of Proposition 1, author pp. 7–8. Free congruence groups give finite cochains; compact localized cohomology is recovered only after boundary removal.
- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9 and (3.20), pp. 154–155, 159–160. The integral statement refines the rational parabolic realization with explicit torsion hypotheses.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-parabolic-duality"></a>

### Parabolic Poincaré pairing

**Theorem** · `ModularCurvesPartII:R14.3/parabolic-duality` · planet: *Parabolic Poincaré duality*

The elliptic cup product L⊗L→A(−1) induces Sym^r L⊗Sym^r L→A(−r). For A=K it is perfect. For finite or integral coefficients assume r! is a unit (in particular ℓ>r); then the symmetrized tensor pairing is perfect with the chosen normalization. On parabolic H¹ it induces a pairing into A(−r−1), alternating for even r and symmetric for odd r. The rational pairing is nondegenerate; integral/finite perfection is exported only in the localized setting of localized-freeness, where boundary and coefficient-reduction obstructions vanish. Pullback and trace are adjoint.

**Hypotheses and conventions.**

- A complete DVR O of residue characteristic ℓ; finite coefficients O/πⁿ; integral conclusion additionally needs finite freeness and boundary conditions.
- At ℓ≤r no integral perfectness is inferred from Deligne’s rational statement; a different divided-power lattice would require its own comparison.

**Proof plan.**

1. Form the coefficient pairing by symmetrizing products of the alternating rank-two elliptic pairing; invert r! when necessary.
2. Apply EDC.2 curve duality to j_\*L and its dual, or Betti Poincaré–Lefschetz duality.
3. Restrict the compact-support/ordinary pairing to their common image, using the vanishing and exactness hypotheses to prove integral perfection.
4. The sign is the coefficient sign (−1)^r times the degree-one cup sign.

**Prerequisites.**

- [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system) (Geometric weight coefficient systems)
- [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients) (Hecke operators with relative coefficients)
- [`R14.3/localized-freeness`](#r14-3-localized-freeness) (Finite generation and localized integral freeness)
- `EtaleDualityAndPerverseSheaves:EDC.2`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

**Consumers in this roadmap.** [`R14.3/symbols-geometric-comparison`](#r14-3-symbols-geometric-comparison)

**Acceptance checks.**

- r=0 gives an alternating curve pairing; r=1 gives a symmetric pairing.
- A rationally perfect pairing whose determinant is divisible by ℓ is not an integral acceptance case.

**Sources.**

- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), (3.20), pp. 159–160. Coefficient pairing, rational nondegeneracy, parity and the degree formula are stated there; integral perfection requires the extra lattice hypotheses.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

<a id="r14-3-symbols-geometric-comparison"></a>

### Modular symbols and the geometric lattice

**Comparison** · `ModularCurvesPartII:R14.3/symbols-geometric-comparison`

For the torsion-free congruence quotient Y_an, use a compact oriented surface B with boundary circles obtained by truncating its cusp ends; its interior is Y_an and B≃Y_an. Extend the local system L_r and its coefficient dual to B via this homotopy equivalence. Compare the imported homological Manin-symbol module with H₁(B,∂B;L_r^∨), after fixing the standard-versus-relative-H¹ representation convention. Its boundary lands in H₀(∂B;L_r^∨), whose cusp terms are monodromy coinvariants. The cuspidal kernel modulo torsion gives the dual parabolic cohomological lattice rationally, and integrally only with the stated comparison, saturation and perfectness hypotheses. For r=0 the constant-coefficient comparison recovers H₁(X_an,D;A). Integration is a functional on symbols and Hecke acts on the dual by transpose.

**Hypotheses and conventions.**

- The symbol lattice is the existing coinvariants of Div⁰(P¹(Q))⊗Sym^r(ℤ²), not a second definition of that object.
- Integral conclusions use the local coefficient dual and saturation; the whole symbol module contains boundary and may contain torsion.
- For r>0 cusp monodromy can be nontrivial, so L_r need not extend as a local system across the collapsed cusps of X_an. The pair (X_an,D;L_r) is not used in that case.

**Proof plan.**

1. Use cusp collars to construct B and the coefficient extension; import relative chains and manifold duality from AlgebraicTopology Stages 2/6.
2. Fix the explicit equivariant identification of the standard symbol coefficient representation with the appropriate dual of the geometric relative H¹ lattice, including determinant twists. Send each symbol to its geodesic relative chain, and compare Manin relations and cusp coinvariants. The precise integral presentation comparison remains the recorded lattice gap.
3. Use the boundary long exact sequence and duality on B to pass from the cuspidal homological kernel to the parabolic image. Retain torsion, saturation and the coefficient dual.
4. Match integration and Hecke pull-push with the existing period functional. Deligne supplies the rational cohomological realization, not an integral Manin-presentation theorem.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- [`R14.3/parabolic-duality`](#r14-3-parabolic-duality) (Parabolic Poincaré pairing)

**Acceptance checks.**

- The period map lands in the dual of symbols, as the current ModularForms roadmap requires.
- The boundary quotient is not erroneously retained as part of compact H¹.

**Sources.**

- [`DELIGNE-355`](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §3.11, p. 156 and (3.20), pp. 159–160. Geometric cohomology is the realization underlying the period comparison; the integral symbol presentation is imported from its existing owner.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Theorems 5.1–5.2, pp. 65–66. Weight-two Hodge classes and integration determine the normalization of the comparison.
- [`FUNKE-MILLSON`](https://arxiv.org/pdf/1108.5309), §2, p. 8; Lemma 3.8 and Remark 3.9, p. 12; Proposition 3.11, p. 13. The surface compactification adds cusp circles; geodesics with coefficients define relative classes, and the boundary calculation uses monodromy coinvariants. Their rational even symmetric-power setting illustrates this model, not the unrestricted integral Manin comparison.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Cohomology`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

For constant coefficients on G_m(ℂ), ordinary H¹ is ℤ but the parabolic image is zero. For the compact genus-one X₀(11), constant integral H¹ has rank two. Weight 2 gives Sym⁰ of rank one and weight 3 gives Sym¹ of rank two with nontrivial elliptic monodromy. At ℓ≤r the denominators in symmetrization cannot be dismissed; the rational perfect pairing does not establish an integral unimodular one.

<a id="r14-4"></a>

## R14.4. Ihara and level-change statements

Prove the Ihara-type statements. The principal-level tree amalgam, the Lyndon sequence and the congruence subgroup property for SL₂(ℤ[1/p]) are group-theoretic inputs. Ordinary H¹ at principal level has a congruence-class obstruction, so its kernel is bounded by congruence classes; compact weight-two Γ₁ cohomology satisfies a different, saturated injectivity theorem at every coefficient prime; and the selected-root Taylor–Wiles statement localizes both sides with the component and normalization choices kept.

<a id="r14-4-degeneracy-cohomology"></a>

### The two geometric degeneracy pullbacks

**Construction** · `ModularCurvesPartII:R14.4/degeneracy-cohomology`

For Γ=Γ₁(N) and p prime with p∤N, put Γ′=Γ₁(N)∩Γ₀(p); both maps δ₁,δ_p:X_Γ′→X_Γ come from the moduli correspondence. With the specified isogeny coefficient maps, define d_p(x,y)=δ₁^\*x+δ_p^\*y on the compact, ordinary, compact-support or parabolic cohomology groups where those maps are defined. On ordinary group characters the kernel equation is equally expressed by D_p(ψ,φ)=ψ|\_{Γ′}−φ∘(g↦AgA⁻¹), A=diag(p,1), after negating the second summand. This sign change is recorded, not treated as a change of level.

**Hypotheses and conventions.**

- Mixed Γ₁(N)∩Γ₀(p) is not Γ₁(Np).
- Coefficients O or O/πⁿ; constant coefficients for the integral compact Ihara result, Sym^r only with explicitly checked coefficient maps.

**Proof plan.**

1. Import δ₁,δ_p from R14.1 and their coefficient maps from R14.3.
2. Form the coprod of the actual two pullbacks; prove the support squares and common anemic Hecke equivariance.
3. Identify conjugation by A with the second analytic level map; negation of one source copy relates sum and difference conventions.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.degeneracyH1` | constructor | For the actual pullbacks a,b:H→H′, degeneracyH1 a b sends (x,y) to a(x)+b(y). |
| `TauCeti.ModularCurves.degeneracyH1_apply` | simp | Evaluation on a pair is the sum of its two geometric images. |
| `TauCeti.ModularCurves.degeneracyH1_fst` | simp | The first source inclusion composes to a. |
| `TauCeti.ModularCurves.degeneracyH1_snd` | simp | The second source inclusion composes to b. |
| `TauCeti.ModularCurves.degeneracyH1_hecke` | compatibility | If a and b intertwine the same anemic operators, their coprod intertwines the product action. |
| `TauCeti.ModularCurves.degeneracyH1_sign` | equivalence | Negating the second source converts the sum convention into the ordinary restriction-difference convention. |

**Unit tests.**

- `degeneracyH1_first` (computation): With a=id and b=0 on O, (3,5) maps to 3.
- `degeneracyH1_diagonal` (non-example): With a=b=id on O, (1,−1) is in the kernel; injection is a geometric theorem, not a generic property of coprods.
- `degeneracyH1_zero` (degenerate): Two zero maps give the zero map.
- `degeneracyH1_comp` (compatibility): Postcomposing by c gives degeneracyH1 (c∘a) (c∘b).

**Uses.**

- [`R14.4/compact-ihara`](#r14-4-compact-ihara) (Compact weight-two Ihara and saturation): The compact weight-two map whose mod-ℓ injection gives saturation.
- [`R14.4/principal-ihara`](#r14-4-principal-ihara) (Principal-level Ihara modulo congruence classes): The ordinary restriction difference used in the congruence-kernel theorem.

**Prerequisites.**

- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps); [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace) (Integral étale correspondence trace)
- [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients) (Hecke operators with relative coefficients)
- `mathlib:LinearMap.coprod`

**Consumers in this roadmap.** [`R14.4/principal-ihara`](#r14-4-principal-ihara); [`R14.4/compact-ihara`](#r14-4-compact-ihara); [`R14.4/taylor-wiles-root-control`](#r14-4-taylor-wiles-root-control)

**Acceptance checks.**

- Away from Np the map commutes with T_q and diamonds.
- Do not substitute a map to Γ₁(Np) unless the extra covering and its torsion are explicitly handled.

**Sources.**

- [`RIBET-1984`](https://math.berkeley.edu/~ribet/Articles/icm.pdf), §3, pp. 507–508; §4, pp. 510–513. The mixed-level degeneracy map on Jacobians and compact cohomology.
- [`CDT-2025`](https://arxiv.org/pdf/2109.09040), §4.6, Lemma 4.6.2, p. 33. Ordinary degree-one restriction uses the difference of the two character maps.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-modular-amalgam"></a>

### The principal-level SL₂ amalgam

**Theorem** · `ModularCurvesPartII:R14.4/modular-amalgam` · planet: *The SL₂ amalgam*

For N≥3 and prime p∤N, let Γ_N(R)=ker(SL₂(R)→SL₂(ℤ/N)) for R=ℤ[1/p], and Γ(N)=Γ_N(ℤ). The natural inclusions and conjugation by A=diag(p,1) identify Γ_N(ℤ[1/p]) with Γ(N)\*\_{Γ(N)∩Γ₀(p)}A⁻¹Γ(N)A. The associated SL₂(Q_p) lattice tree has a fundamental edge with these vertex and edge stabilizers; the action preserves vertex type. The central quotient or signed Γ(N) variant must be changed consistently throughout the presentation.

**Hypotheses and conventions.**

- p and N are coprime; A is invertible over ℤ[1/p] and conjugates preserve reduction level because p is a unit modulo N.
- The tree vertices are homothety classes of rank-two ℤ_p lattices; adjacent representatives have quotient of order p.

**Proof plan.**

1. Construct the lattice tree and verify connectivity and unique geodesics by elementary divisors over ℤ_p.
2. Identify the standard adjacent-lattice stabilizers in SL₂ and their arithmetic intersections.
3. Use strong approximation/density, together with surjectivity of reductions prime to p, to show the principal congruence arithmetic group has that edge as fundamental domain.
4. Apply the tree presentation, retaining the two distinct embeddings of the edge subgroup.

**Imported steps.** Proof steps 1–2 (construct the lattice tree, prove it is a tree, identify the adjacent-lattice stabilizers) and the strong-approximation input of step 3. These are supplied by `ReductiveGroupsPartII:RG2.2/sl2-tree`, `ReductiveGroupsPartII:RG2.2/ihara-amalgam`, `AdelicAlgebraicGroups:AA.4/strong-approximation-sufficiency`, `AdelicAlgebraicGroups:AA.4/strong-approximation-finite-places`. ReductiveGroupsPartII, now a TauCetiRoadmap roadmap (README RG2.2.4, sl2-tree and ihara-amalgam), owns the Bruhat–Tits tree of SL₂ over a nonarchimedean local field, its type-preserving action without inversion and the local amalgam SL₂(ℚ_p)=SL₂(ℤ_p)\*_I gSL₂(ℤ_p)g⁻¹. AdelicAlgebraicGroups AA.4 owns strong approximation for simply connected groups with S noncompact. The node keeps only the arithmetic step: density of Γ_N(ℤ[1/p]) in SL₂(ℚ_p) and surjectivity of reduction prime to p give an edge as fundamental domain, and the segment-amalgam theorem presents Γ_N(ℤ[1/p]). Both suppliers are in lower tiers (1 and 2); the same imports are already used by AutomorphyLiftingBeyondTaylorWiles BT.3/global-ihara-amalgam.

**Prerequisites.**

- `mathlib:groupCohomology.H1`
- `ReductiveGroupsPartII:RG2.2/sl2-tree` (imported step; see above)
- `ReductiveGroupsPartII:RG2.2/ihara-amalgam` (imported step; see above)
- `AdelicAlgebraicGroups:AA.4/strong-approximation-sufficiency` (imported step; see above)
- `AdelicAlgebraicGroups:AA.4/strong-approximation-finite-places` (imported step; see above)

**Consumers in this roadmap.** [`R14.4/congruence-subgroup-property`](#r14-4-congruence-subgroup-property); [`R14.4/lyndon-exact-sequence`](#r14-4-lyndon-exact-sequence); [`R14.4/compact-ihara`](#r14-4-compact-ihara)

**Acceptance checks.**

- At p|N the statement is not asserted.
- An unrestricted PGL₂ action that exchanges vertex types does not have this same amalgam.

**Sources.**

- [`SERRE-TREES`](https://www.numdam.org/item/AST_1983__46__1_0.pdf), II §1.4, Theorem 3 and Corollary 2, p. 110. Fundamental-edge criterion and SL₂(ℤ[1/p]) presentation.
- [`CDT-2025`](https://arxiv.org/pdf/2109.09040), §4.4, pp. 27–28; proof of Lemma 4.6.2, pp. 33–34. The principal-level subgroup has the corresponding amalgam.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-congruence-subgroup-property"></a>

### Congruence subgroup property of SL₂(ℤ[1/p])

**Theorem** · `ModularCurvesPartII:R14.4/congruence-subgroup-property` · planet: *Congruence subgroup property*

For a prime p every finite-index subgroup H of SL₂(ℤ[1/p]) contains ker(SL₂(ℤ[1/p])→SL₂(ℤ/m)) for some positive m coprime to p. The same conclusion, intersected with Γ_N(ℤ[1/p]), holds for every finite-index subgroup of that principal-level group. This is the split real S-arithmetic specialization of Serre’s congruence kernel theorem, with S={∞,p}; it is not a statement about all finite-index subgroups of SL₂(ℤ).

**Hypotheses and conventions.**

- Serre’s condition |S|≥2 and the real-place alternative both hold.
- The proof uses the specific S-arithmetic congruence kernel theorem; its deeper central-extension input is recorded as a gap rather than imported from an unrelated profinite-power roadmap.

**Proof plan.**

1. Apply Serre §2.6 Theorem 2 and Corollary 3 with Q and S={∞,p}.
2. Translate the trivial congruence kernel into the stated finite-index containment.
3. A finite-index subgroup of Γ_N is also finite index in SL₂(ℤ[1/p]); intersect the congruence kernel with Γ_N.

**Prerequisites.**

- [`R14.4/modular-amalgam`](#r14-4-modular-amalgam) (The principal-level SL₂ amalgam)

**Consumers in this roadmap.** [`R14.4/principal-ihara`](#r14-4-principal-ihara); [`R14.4/compact-ihara`](#r14-4-compact-ihara)

**Acceptance checks.**

- Finite characters of Γ_N(ℤ[1/p]) factor through a finite congruence quotient.
- The conclusion is not derived from mere density of the group in SL₂(Q_p).

**Sources.**

- [`SERRE-CSP`](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §2.6, Theorem 2 and Corollary 3, pp. 498–500. The real-place S-arithmetic congruence kernel is trivial when S contains at least two places.
- [`CDT-2025`](https://arxiv.org/pdf/2109.09040), Proof of Lemma 4.6.2, p. 34. A finite character of the amalgam factors through a congruence quotient by this theorem.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-lyndon-exact-sequence"></a>

### Lyndon sequence for the modular amalgam

**Theorem** · `ModularCurvesPartII:R14.4/lyndon-exact-sequence` · planet: *Lyndon exact sequence*

For the actual amalgam G=G₁\*\_{H}G₂ of modular-amalgam and a G-module M, there is a natural exact sequence …→H^i(G,M)→H^i(G₁,M)⊕H^i(G₂,M)→H^i(H,M)→H^{i+1}(G,M)→…, with the middle map the difference of restrictions along the two embeddings. At i=0 it begins with invariants. The same sequence is equivariant for double-coset maps that preserve the diagram, using restriction and transfer with the displayed coefficient actions.

**Hypotheses and conventions.**

- M is an actual representation of the amalgam; the two restricted modules on H are identified through that representation.
- The degree of the first displayed group is i, not i−1.

**Proof plan.**

1. Use the cellular chain sequence of the contractible tree: 0→ℤ[G/H]→ℤ[G/G₁]⊕ℤ[G/G₂]→ℤ→0.
2. Apply a group-cohomology resolution, Shapiro and the connecting morphisms, or equivalent classifying-space Mayer–Vietoris.
3. Construct correspondence maps on this chain sequence to obtain the equivariance required for the normalized U_p² argument.
4. Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

**Prerequisites.**

- [`R14.4/modular-amalgam`](#r14-4-modular-amalgam) (The principal-level SL₂ amalgam)
- `mathlib:groupCohomology.H1`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `mathlib:groupCohomology.coindIso`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

**Consumers in this roadmap.** [`R14.4/principal-ihara`](#r14-4-principal-ihara); [`R14.4/taylor-wiles-root-control`](#r14-4-taylor-wiles-root-control)

**Acceptance checks.**

- H⁰(G,M) is the kernel of the difference on vertex invariants.
- For trivial M=F_q, an agreeing pair of characters descends to a character of G.

**Sources.**

- [`SERRE-TREES`](https://www.numdam.org/item/AST_1983__46__1_0.pdf), II §2.8, Proposition 13 and example, pp. 168–170. Tree homology gives the exact cohomological sequence, with the correct degree.
- [`CALEGARI-GERAGHTY`](https://arxiv.org/pdf/1207.4224), Lemma 9.6, pp. 89–90 (author preprint); Springer-layout author copy PDF pp. 122–123. The modular double-coset application uses this sequence; its displayed degree is corrected here.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-congruence-classes"></a>

### Congruence classes in ordinary H¹

**Definition** · `ModularCurvesPartII:R14.4/congruence-classes` · planet: *Congruence cohomology classes*

For Γ(N)⊂SL₂(ℤ), N≥3, and a prime q, identify ordinary H¹(Γ(N),F_q) with Hom(Γ(N),F_q) for the trivial additive action. Define H¹_cong as the subspace of characters ψ for which Γ(M)⊂ker ψ for some positive M divisible by N. Equivalently it is the directed union of the pullbacks of characters of finite congruence quotients Γ(N)/Γ(M). It is not defined as all ordinary cohomology or as the parabolic subspace.

**Hypotheses and conventions.**

- All principal kernels are taken in SL₂(ℤ), consistently with the chosen signed/central quotient convention.

**Proof plan.**

1. Use the trivial-action H¹-to-character comparison.
2. The common refinement lcm(M₁,M₂) proves closure under addition and scalar multiplication, giving a submodule.
3. Use quotient descent to prove the finite-congruence-quotient characterization.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.congruenceClasses` | constructor | For the directed family Γ(M) inside Γ(N), the submodule of additive characters killing one of these kernels. |
| `TauCeti.ModularCurves.mem_congruenceClasses` | characterisation | Membership is equivalent to vanishing on some Γ(M), N\|M. |
| `TauCeti.ModularCurves.congruenceClasses_refine` | relation | A character killing Γ(M) also kills Γ(M′) whenever M\|M′. |
| `TauCeti.ModularCurves.congruenceClasses_quotient` | universal-property | A character killing Γ(M) descends uniquely to Γ(N)/Γ(M). |
| `TauCeti.ModularCurves.congruenceClasses_restrict` | functoriality | Restriction to a deeper principal subgroup preserves congruence classes. |
| `TauCeti.ModularCurves.congruenceClasses_H1` | compatibility | The classifying map is the actual trivial-action H¹/character isomorphism. |

**Unit tests.**

- `congruenceClasses_zero` (degenerate): The zero character kills every deeper principal subgroup.
- `congruenceClasses_finiteQuotient` (compatibility): Pulling back a character of Γ(N)/Γ(M) gives a member.
- `congruenceClasses_joint` (characterisation): If ψ kills Γ(M₁) and φ kills Γ(M₂), ψ+φ kills Γ(lcm(M₁,M₂)).
- `congruenceClasses_noncongruence` (non-example): At Γ(3) with F₅ coefficients the congruence subspace is zero, whereas ordinary H¹ has dimension three. A nonzero ordinary character is therefore not a congruence class. Use the pro-3 level factor and the perfectness/abelianization of the other SL₂(Z_p) factors, as in CDT §4.5, to check the finite congruence quotients.

**Uses.**

- [`R14.4/principal-ihara`](#r14-4-principal-ihara) (Principal-level Ihara modulo congruence classes): Precise kernel bound.
- [`R14.4/enhanced-ihara`](#r14-4-enhanced-ihara) (The enhanced principal-level kernel bound): The residual congruence-class conclusion at Γ₁(p) level.

**Prerequisites.**

- `mathlib:groupCohomology.H1`
- `mathlib:CongruenceSubgroup.Gamma`
- `mathlib:groupCohomology.H1IsoOfIsTrivial`
- `tauceti:CongruenceSubgroup.Gamma_le_Gamma_of_dvd`

**Consumers in this roadmap.** [`R14.4/principal-ihara`](#r14-4-principal-ihara); [`R14.4/enhanced-ihara`](#r14-4-enhanced-ihara); [`R14.4/congruence-invariance`](#r14-4-congruence-invariance)

**Acceptance checks.**

- The zero character is congruence; every character pulled from Γ(N)/Γ(M) is congruence.
- A character known only to have finite image is not thereby proved congruence.

**Sources.**

- [`CDT-2025`](https://arxiv.org/pdf/2109.09040), §4.5, definition of H¹_cong, pp. 29–30; Lemma 4.6.2, p. 33. The ordinary characters trivial at a deeper principal level are exactly the congruence classes.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-principal-ihara"></a>

### Principal-level Ihara modulo congruence classes

**Theorem** · `ModularCurvesPartII:R14.4/principal-ihara` · planet: *Ihara modulo congruence classes*

For N≥3 and primes p,q with p∤N, the kernel of D_p:H¹(Γ(N),F_q)²→H¹(Γ(N)∩Γ₀(p),F_q), D_p(ψ,φ)(g)=ψ(g)−φ(AgA⁻¹), is contained in H¹_cong(Γ(N),F_q)². There is no requirement q≠p in this ordinary character theorem, and no unconditional injectivity assertion.

**Hypotheses and conventions.**

- Trivial F_q coefficients; ordinary group cohomology, not compact cohomology or an arbitrary Sym^r system.

**Proof plan.**

1. An element of the kernel is an agreeing pair of additive characters for the amalgam, so it extends to a character of Γ_N(ℤ[1/p]).
2. Its image is finite. Apply congruence-subgroup-property to its kernel.
3. Restrict the resulting congruence factorization back to each integral vertex subgroup; both original characters lie in H¹_cong.

**Prerequisites.**

- [`R14.4/degeneracy-cohomology`](#r14-4-degeneracy-cohomology) (The two geometric degeneracy pullbacks)
- [`R14.4/congruence-classes`](#r14-4-congruence-classes) (Congruence classes in ordinary H¹)
- [`R14.4/lyndon-exact-sequence`](#r14-4-lyndon-exact-sequence) (Lyndon sequence for the modular amalgam)
- [`R14.4/congruence-subgroup-property`](#r14-4-congruence-subgroup-property) (Congruence subgroup property of SL₂(ℤ[1/p]))

**Consumers in this roadmap.** [`R14.4/enhanced-ihara`](#r14-4-enhanced-ihara)

**Acceptance checks.**

- Kernel zero follows only after independently killing the congruence subspaces in the chosen quotient/localization.
- The q=p case is covered by this character argument, not by ℓ-adic geometric smoothness.

**Sources.**

- [`CDT-2025`](https://arxiv.org/pdf/2109.09040), Lemma 4.6.2 with proof, pp. 33–34. Kernel classes extend to the S-arithmetic group and are therefore congruence characters.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-congruence-invariance"></a>

### Congruence invariance of ordinary characters

**Theorem** · `ModularCurvesPartII:R14.4/congruence-invariance`

For N≥3, prime q and η∈H¹(Γ(N),F_q), let SL₂(Z/N) act by the conjugations of ambient SL₂(Z). If gη−η belongs to H¹_cong(Γ(N),F_q) for every g∈SL₂(Z/N), then η itself belongs to H¹_cong. Equivalently, the direct limit of ordinary H¹ over principal levels, with restriction transition maps, has no SL₂(Ẑ)-invariants. This direct-limit character input is the specific prerequisite of enhanced-ihara, rather than a completion of the completed-cohomology roadmap.

**Hypotheses and conventions.**

- The action factors through the finite quotient because inner conjugation acts trivially on trivial-coefficient H¹.
- The coefficient prime may be 2 or 3; the proof retains the exceptional small-prime calculations.

**Proof plan.**

1. Pass to the restriction direct limit; its kernel from a finite level consists exactly of the congruence classes, and the hypothesis makes the image invariant.
2. Follow CDT §§4.5.4–4.5.9: finite SL₂ homology, continuous cohomology of SL₂(Z_p), Künneth and Hochschild–Serre isolate coefficient primes 2,3,5 and show the relevant H² restriction vanishes at deeper levels.
3. Use the genus-zero cusp representation at levels 3 and 5 with coefficients F₃ and F₅ respectively; at coefficient prime 2 use the level-8 to level-16 calculation. Lemma 4.5.11’s printed F₃ at level 5 is replaced by F₅, as required in its application.
4. Apply the two five-term sequences of (4.5.10) and the corrected finite-level invariant computations to kill the invariant limit class. The source’s computer calculation at levels 8/16 and Lazard/adjoint-cohomology inputs remain proof-chain refinements in the recorded gap.

**Prerequisites.**

- [`R14.4/congruence-classes`](#r14-4-congruence-classes) (Congruence classes in ordinary H¹)
- `mathlib:groupCohomology.H1`

**Consumers in this roadmap.** [`R14.4/enhanced-ihara`](#r14-4-enhanced-ihara)

**Acceptance checks.**

- The condition must hold for every ambient finite-quotient conjugation, not just one level-changing element.
- An arbitrary noncongruence character cannot be declared congruence just because its codomain is finite.

**Sources.**

- [`CDT-2025`](https://arxiv.org/pdf/2109.09040), Theorem 4.5.2 and Corollary 4.5.3, p. 29; Lemmas 4.5.4–4.5.11 and proof, pp. 30–32; published §§4.5–4.6, pp. 661–666. The no-invariants theorem gives the finite-level criterion; retain the small-prime proof and corrected coefficient in the level-5 computation.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-enhanced-ihara"></a>

### The enhanced principal-level kernel bound

**Theorem** · `ModularCurvesPartII:R14.4/enhanced-ihara`

With N,p,q as in principal-ihara, the kernel of the same restriction difference into H¹(Γ(N)∩Γ₁(p),F_q) is also contained in H¹_cong(Γ(N),F_q)². The congruence-invariance criterion used here says that if every conjugation difference for a character of a principal subgroup is congruence, then the character itself is congruence, as in CDT Corollary 4.5.3 with the SL₂(Z/N)-action induced by ambient SL₂(ℤ) conjugations.

**Hypotheses and conventions.**

- This is still trivial-coefficient ordinary H¹ and still a kernel bound, not automatic injectivity.

**Proof plan.**

1. Restriction to Γ(N)∩Γ₁(p) implies that the disagreement on Γ(N)∩Γ₀(p) is a congruence class because the quotient of these two groups is congruence.
2. Follow the ambient conjugations in CDT Lemma 4.6.3 and apply Corollary 4.5.3 to the two source characters.
3. Use the principal-level kernel bound after the congruence error is removed.

**Prerequisites.**

- [`R14.4/principal-ihara`](#r14-4-principal-ihara) (Principal-level Ihara modulo congruence classes)
- [`R14.4/congruence-classes`](#r14-4-congruence-classes) (Congruence classes in ordinary H¹)
- [`R14.4/congruence-invariance`](#r14-4-congruence-invariance) (Congruence invariance of ordinary characters)

**Acceptance checks.**

- The enhancement is not proved by treating restriction across a finite quotient as injective when q divides its order.

**Sources.**

- [`CDT-2025`](https://arxiv.org/pdf/2109.09040), Corollary 4.5.3, p. 29; Lemma 4.6.3, p. 34. Congruence invariance strengthens the Γ₀(p) kernel bound to Γ₁(p); the ambient conjugations must be retained.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-compact-ihara"></a>

### Compact weight-two Ihara and saturation

**Theorem** · `ModularCurvesPartII:R14.4/compact-ihara` · planet: *Compact Ihara lemma*

For N≥5 and prime p∤N, let X′ be the compact curve of Γ₁(N)∩Γ₀(p). The map δ₁^\*+δ_p^\*:H¹(X₁(N),F_ℓ)²→H¹(X′,F_ℓ) is injective for every prime ℓ. Equivalently the sum of the two Jacobian pullbacks J₁(N)²→Jac(X′) has trivial kernel (Ribet Corollary 4.2). The corresponding integral H¹ map has torsion-free cokernel; after O-extension it is saturated and remains injective modulo πⁿ. For Γ₀(N), Ribet Theorem 4.3 gives kernel the anti-diagonal Shimura subgroup, not unconditional injectivity; localization away from its Eisenstein support removes that kernel.

**Hypotheses and conventions.**

- Weight two means constant coefficients. The compact curves are smooth in characteristic zero, so no ℓ∤N hypothesis is added to this Betti statement.
- The Γ₀ version needs a supplied Shimura subgroup and its Eisenstein Hecke action; small levels and stabilizers use their actual compact curves.

**Proof plan.**

1. Ribet’s compact homology proof quotients ordinary abelianizations by the subgroups generated by parabolics; the amalgam and CSP show the two-map integral homology map is surjective.
2. Dualize the compact free homology lattices to obtain integral cohomology injection with saturated image.
3. Alternatively use the zero Jacobian kernel of Corollary 4.2 and the Tate comparison; reduce the saturated integral map at every ℓ.
4. For Γ₀ retain the anti-diagonal Shimura kernel of Theorem 4.3 and remove it only under the explicit support hypothesis.

**Prerequisites.**

- [`R14.4/degeneracy-cohomology`](#r14-4-degeneracy-cohomology) (The two geometric degeneracy pullbacks)
- [`R14.4/modular-amalgam`](#r14-4-modular-amalgam) (The principal-level SL₂ amalgam)
- [`R14.4/congruence-subgroup-property`](#r14-4-congruence-subgroup-property) (Congruence subgroup property of SL₂(ℤ[1/p]))
- [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison) (The actual Jacobian Tate realization)
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms); [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions) (The modular Jacobian Tate module)

**Acceptance checks.**

- This supplies the mixed-level, weight-two cohomological Ihara input of R20.2 even when ℓ|N.
- It does not supply the exceptional-image or multiplicity-one steps of mod-two level lowering.
- For N=11,p=2, the source compact rank is 2·2=4, and its image in the mixed level has saturated rank four.

**Sources.**

- [`RIBET-1984`](https://math.berkeley.edu/~ribet/Articles/icm.pdf), Theorem 4.1, Corollary 4.2 and Theorem 4.3, pp. 510–513. The compact Jacobian result and its parabolic homology proof yield integral saturation, including the distinct Γ₀ kernel.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

<a id="r14-4-taylor-wiles-root-control"></a>

### Taylor–Wiles degeneracy control

**Theorem** · `ModularCurvesPartII:R14.4/taylor-wiles-root-control`

For constant coefficients O/πⁿ, odd residue characteristic ℓ, torsion-free modular level Γ with p∤Nℓ, and a localized cyclotomic-determinant residual eigensystem at which p≡1 mod ℓ and T_p has residual roots α,β with αβ=1 and α≠β, the two degeneracy images identify H^i(Y,O/πⁿ)_m² with the sum of the two selected old-root factors in H^i(Y₀(p),O/πⁿ). Localization additionally at U_p−α identifies its factor with one copy of H^i(Y,O/πⁿ)_m. The operator normalization is the one in CG Lemma 9.6; in the general character setting the off-diagonal diamonds must be restored and checked, not suppressed.

**Hypotheses and conventions.**

- α,β∉{1,−1} follows from odd ℓ and αβ=1, α≠β.
- The full anemic localized target is not asserted to have no additional U_p=±1 factors; those are killed in the selected U_p²−1 localization.

**Proof plan.**

1. Compute trace∘pullback matrix [[p+1,T_p],[T_p,p+1]] and its determinant (p+1)²−T_p²; it is a unit at the selected residual roots.
2. Use the correctly graded Lyndon sequence: the normalized double-coset operator for diag(p,p⁻¹) acts as identity on the amalgam terms.
3. Localize at U_p²−1 to remove both adjacent amalgam terms and identify the two-copy old factors.
4. Apply the idempotent for the distinct roots and descend across any elementary two-group component quotient, whose order is invertible.

**Prerequisites.**

- [`R14.4/lyndon-exact-sequence`](#r14-4-lyndon-exact-sequence) (Lyndon sequence for the modular amalgam)
- [`R14.4/degeneracy-cohomology`](#r14-4-degeneracy-cohomology) (The two geometric degeneracy pullbacks)
- [`R14.3/localized-freeness`](#r14-3-localized-freeness) (Finite generation and localized integral freeness)

**Consumers in this roadmap.** [`R14.6/augmentation-control`](#r14-6-augmentation-control)

**Acceptance checks.**

- The repeated-root case α=β is excluded.
- The proof cannot use exact invariants for a quotient whose order is divisible by ℓ.

**Sources.**

- [`CALEGARI-GERAGHTY`](https://arxiv.org/pdf/1207.4224), Lemma 9.6 and Remarks 9.7–9.8, pp. 88–90; author Springer-layout copy PDF pp. 120–123. The all-degree finite-coefficient root-control argument; the degree and determinant misprints are corrected, and localization at the root is made explicit.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/Ihara`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

For Γ(3), ordinary mod-5 H¹ has dimension three whereas its congruence-class subspace is zero; the ordinary principal kernel statement still names that subspace at every coefficient prime. At level 5 over F₃ the 12-cusp permutation module has an invariant constant vector in the augmentation kernel because 12=0 in F₃. This detects the printed F₃ coefficient in CDT Lemma 4.5.11; the intended level-5 calculation is over F₅. The matrix [[p+1,T_p],[T_p,p+1]] has determinant (p+1)²−T_p². Reversing its sign preserves invertibility, whereas shifting the Lyndon connecting degree does not preserve exactness.

<a id="r14-5"></a>

## R14.5. Modular quotients

For a primitive weight-two newform f, form the Hecke prime and coefficient field, the modular abelian variety A_f as the Albanese quotient of J₁(N) (or of J₀(N) for trivial character) by the image of the Hecke ideal, and prove Shimura's theorem dim A_f=[K_f:ℚ] from rational Tate exactness and rank two. Identify the differentials of A_f, compare oldforms at raised level with all their divisor degeneracies, and show the Abel–Jacobi composite to A_f is nonconstant. The λ-adic Galois identification of V_ℓ(A_f) is AutomorphicGaloisRepresentations R19.1/R19.6, not a defining property of A_f.

<a id="r14-5-newform-hecke-prime"></a>

### The Hecke prime and coefficient field of a newform

**Definition** · `ModularCurvesPartII:R14.5/newform-hecke-prime` · planet: *Newform Hecke prime*

For a normalized cuspidal newform f of weight exactly two and primitive level N, import its coefficient field K_f from ModularForms Layers 8/8G. The geometric Hecke action gives the eigenvalue character λ_f:T₁(N)→K_f. Set p_f=ker λ_f; it is a minimal prime and (T₁(N)/p_f)⊗Q≅K_f. Coefficient fields, integrality of eigenvalues and the notion of newform are imports, not definitions of this layer.

**Hypotheses and conventions.**

- f a normalised newform of weight 2 and level exactly N (Tau Ceti ModularForms Layer 4).

**Proof plan.**

1. The eigenvalue map T₁(N) → ℂ has image the order ℤ[a_n(f)] ⊂ K_f; its kernel is prime.
2. The integral Hecke algebra is finite and torsion-free over ℤ. Localizing at ℤ\\{0} makes it a finite-dimensional commutative ℚ-algebra, hence Artinian; every prime there is minimal. Since λ_f has characteristic-zero image, p_f is disjoint from ℤ\\{0}, and contraction of that minimal prime is minimal. This does not assume the full old-level Hecke algebra is reduced.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.heckePrime` | constructor | Kernel ideal of the imported geometric eigenvalue character λ_f. |
| `TauCeti.ModularCurves.mem_heckePrime` | characterisation | t∈p_f iff λ_f(t)=0. |
| `TauCeti.ModularCurves.heckePrime_isPrime` | structure | The character lands in a field, so p_f is prime. |
| `TauCeti.ModularCurves.heckePrime_quotient` | equivalence | The integral quotient is canonically the image eigenvalue order by RingHom.quotientKerEquivRange; after rationalization it is K_f. The integral image need not be the maximal order. |
| `TauCeti.ModularCurves.heckePrime_conjugate` | compatibility | Postcomposing λ_f with a field embedding does not change its kernel. |

**Unit tests.**

- `heckePrime_int` (computation): The kernel of ℤ→ℚ is zero.
- `heckePrime_projection` (characterisation): For the first projection ℚ×ℚ→ℚ, the kernel is {0}×ℚ.
- `heckePrime_embedding` (compatibility): An injective field embedding on the target preserves the kernel.

**Uses.**

- [`R14.5/modular-quotient`](#r14-5-modular-quotient) (The modular abelian variety A_f): The actual ideal cutting out the modular quotient.
- [`R14.5/quotient-tate-exact`](#r14-5-quotient-tate-exact) (Tate module of the actual modular quotient): The ideal acting on the rational Tate module.

**Prerequisites.**

- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra) (The geometric integral Hecke algebra)
- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`
- `mathlib:RingHom.ker`
- `mathlib:RingHom.quotientKerEquivRange`

**Consumers in this roadmap.** [`R14.5/modular-quotient`](#r14-5-modular-quotient); [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension)

**Acceptance checks.**

- Weak multiplicity one gives a_n(f) ∈ K_f for all n.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77). K_f.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77). p_f.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-5-modular-quotient"></a>

### The modular abelian variety A_f

**Construction** · `ModularCurvesPartII:R14.5/modular-quotient` · planet: *Modular abelian quotient*

With the Albanese Hecke action on J₁(N), let B_f be the connected abelian subvariety generated by all images t(J₁(N)), t∈p_f. Define A_f=J₁(N)/B_f over Q with its surjective quotient map q_f. It has good reduction outside N and an action of the order T₁(N)/p_f; the K_f action is in End⁰(A_f). This is a quotient by an actual abelian subvariety, not a pointwise module quotient or an assumed Galois representation.

**Hypotheses and conventions.**

- N ≥ 5 (for N &lt; 5, S₂(Γ₁(N)) = 0).
- Conrad Definition 5.13 uses the Albanese action ( )_\* on J₁(N) of the (E,P) model. A Picard-action quotient must be separately constructed and transported by w_ζ over a field containing ζ. Neither the action nor the moduli model is silently changed on the same quotient.

**Proof plan.**

1. Use the actual Albanese action to form the connected abelian subvariety generated by t(J₁(N)), t∈p_f; finite ideal generators suffice. Import the quotient and its universal property from AbelianSchemesAndArithmeticModuli A6, whose positive-dimensional quotient input is requested explicitly.
2. Apply the requested A6 good-reduction quotient theorem to J₁(N) over ℤ[1/N]; the resulting connected-subvariety quotient extends as an abelian scheme. This needs the positive-dimensional quotient theorem, not only the finite-flat-kernel quotient API.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.modularQuotient` | constructor | The actual abelian variety J₁(N)/B_f, using the Albanese action. |
| `TauCeti.ModularCurves.modularQuotient_map` | projection | The surjective Q-homomorphism q_f:J₁(N)→A_f with connected kernel B_f. |
| `TauCeti.ModularCurves.modularQuotient_kills` | relation | q_f∘t=0 for every t∈p_f. |
| `TauCeti.ModularCurves.modularQuotient_lift` | universal-property | A homomorphism h:J₁(N)→B killing all p_f images descends uniquely through q_f. |
| `TauCeti.ModularCurves.modularQuotient_baseChange` | functoriality | Formation and the quotient map commute with field extension. |
| `TauCeti.ModularCurves.modularQuotient_hecke` | compatibility | The quotient order acts faithfully in characteristic zero; the induced rational action is K_f in End⁰(A_f). |
| `TauCeti.ModularCurves.modularQuotientForIdeal` | constructor | For any ideal I of the supplied acting modular Hecke algebra, form the connected subvariety generated by its Albanese images and invoke the A6 quotient. modularQuotient f is this modular specialization at I=p_f; the generic abelian-subvariety quotient is imported, not redefined here. |
| `TauCeti.ModularCurves.modularQuotient_lift_map` | simp | The descended homomorphism composed with q_f equals the original h. |
| `TauCeti.ModularCurves.modularQuotient_hom_ext` | extensionality | Two homomorphisms out of A_f agree when their compositions with the surjective q_f agree. |

**Unit tests.**

- `modularQuotient_zeroIdeal` (degenerate): The modularQuotientForIdeal quotient attached to the zero ideal of an acting algebra is the supplied Jacobian itself.
- `modularQuotient_unitIdeal` (degenerate): The modularQuotientForIdeal quotient for the unit ideal is the zero abelian variety; this tests the image-generated-kernel convention.
- `modularQuotient_level11` (computation): For the rational weight-two newform of level 11 and trivial character, the J₀(11) quotient has dimension one.
- `modularQuotient_weight` (non-example): No Jacobian quotient is defined for a weight-12 level-one newform by this constructor.

**Uses.**

- [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension) (Shimura's theorem: dim A_f = [K_f : ℚ]): Compute the dimension from the actual quotient Tate module.
- EllipticCurveModularity:R29.5: The surjective quotient and nonconstant curve map, before any isogeny to a specified elliptic curve.

**Prerequisites.**

- [`R14.5/newform-hecke-prime`](#r14-5-newform-hecke-prime) (The Hecke prime and coefficient field of a newform)
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms); [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators); [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra) (The geometric integral Hecke algebra)
- `AbelianSchemesAndArithmeticModuli:A6`
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`

**Consumers in this roadmap.** [`R14.5/quotient-tate-exact`](#r14-5-quotient-tate-exact); [`R14.5/modular-quotient-differentials`](#r14-5-modular-quotient-differentials); [`R14.5/abel-jacobi-composite-nonzero`](#r14-5-abel-jacobi-composite-nonzero)

**Acceptance checks.**

- A_f is nonzero when f exists (modular-quotient-dimension).
- Do not assert a quotient of a modular-curve Jacobian for weight > 2.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77). Definition 5.13.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77). Good reduction.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33). Ribet–Stein's formulation.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-5-quotient-tate-exact"></a>

### Tate module of the actual modular quotient

**Comparison** · `ModularCurvesPartII:R14.5/quotient-tate-exact`

For the actual quotient q_f:J₁(N)→A_f, the induced map identifies V_ℓ(A_f) with V_ℓ(J₁(N))/p_fV_ℓ(J₁(N)) as a module over Q_ℓ⊗T₁(N), with the chosen Albanese convention. Generic exactness of rational Tate modules for abelian-subvariety quotients is imported; integral exactness is not inferred by tensoring this rational statement.

**Hypotheses and conventions.**

- ℓ prime; base characteristic zero. B_f is the actual connected image-generated kernel from modular-quotient.

**Proof plan.**

1. Import rational Tate exactness for a connected abelian-subvariety quotient.
2. Choose finitely many generators of p_f; the sum of their abelian images is B_f and gives a surjection J^a→B_f.
3. Apply rational Tate exactness again to identify its image with p_fV_ℓJ.

**Prerequisites.**

- [`R14.5/modular-quotient`](#r14-5-modular-quotient) (The modular abelian variety A_f)
- `AbelianSchemesAndArithmeticModuli:A4`
- `AbelianSchemesAndArithmeticModuli:A6`

**Consumers in this roadmap.** [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension)

**Acceptance checks.**

- Test: an isogeny B → A with kernel of order ℓ is surjective on V_ℓ but not on T_ℓ.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77). The claim in the proof of Theorem 5.14.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77). Its proof.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-5-modular-quotient-dimension"></a>

### Shimura's theorem: dim A_f = [K_f : ℚ]

**Theorem** · `ModularCurvesPartII:R14.5/modular-quotient-dimension` · planet: *Shimura dimension theorem*

dim A_f = [K_f : ℚ], and V_ℓ(A_f) = V_ℓ(J₁(N))/p_f V_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗_ℚ K_f. In particular A_f ≠ 0 and dim V_ℓ(A_f) = 2[K_f : ℚ].

**Hypotheses and conventions.**

- The Frobenius characteristic polynomial on V_ℓ(A_f) is AutomorphicGaloisRepresentations R19.1/R19.6's statement, not a defining property of A_f.

**Proof plan.**

1. V_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗ T₁(N) (betti-free-rank-two).
2. quotient-tate-exact applied to p_f J₁(N) → J₁(N) → A_f → 0 identifies V_ℓ(A_f) with V_ℓ(J₁(N))/p_f.
3. Hence V_ℓ(A_f) is free of rank 2 over ℚ_ℓ ⊗ T₁(N)/p_f = ℚ_ℓ ⊗ K_f, of ℚ_ℓ-dimension 2[K_f : ℚ] = 2 dim A_f.

**Prerequisites.**

- [`R14.5/quotient-tate-exact`](#r14-5-quotient-tate-exact) (Tate module of the actual modular quotient)
- [`R14.3/betti-free-rank-two`](#r14-3-betti-free-rank-two) (H¹ is free of rank two over the Hecke algebra)
- [`R14.5/newform-hecke-prime`](#r14-5-newform-hecke-prime) (The Hecke prime and coefficient field of a newform)
- `AbelianSchemesAndArithmeticModuli:A4`

**Consumers in this roadmap.** [`R14.5/modular-quotient-differentials`](#r14-5-modular-quotient-differentials); [`R14.5/trivial-character-J0`](#r14-5-trivial-character-j0); [`R14.5/oldform-comparison`](#r14-5-oldform-comparison); [`R14.5/abel-jacobi-composite-nonzero`](#r14-5-abel-jacobi-composite-nonzero)

**Acceptance checks.**

- Check on N = 11 (dimension 1) and N = 23 (dimension 2).

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77). Theorem 5.14.
- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 2, §2.3.1, p. 28 (printed; PDF page 32). Ribet–Stein's statement.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-5-modular-quotient-differentials"></a>

### Differentials on A_f

**Theorem** · `ModularCurvesPartII:R14.5/modular-quotient-differentials`

For the Albanese-action quotient q_f:J₁(N)→A_f defined here, cotangent pullback identifies H⁰(A_f,Ω¹)⊗ℂ with the span of f^σ, σ:K_f↪ℂ, inside S₂(Γ₁(N),ℂ)=Cot₀(J₁(N)_ℂ). If A_f^Pic is instead constructed with the Picard action on the same model, its separately defined quotient map has cotangent image w_ζ of this span over a field containing ζ. The two quotient maps are not identified without this transport.

**Hypotheses and conventions.**

- Conrad's warning: the Picard action on Cot₀ is the Petersson adjoint of the classical action; w_ζ conjugates one action into the other.

**Proof plan.**

1. Cot₀(A_f) ↪ Cot₀(J₁(N)) is the subspace killed by p_f for the induced action on cotangent spaces.
2. For the Albanese action this is the classical action; the p_f-eigenspace of S₂(Γ₁(N), ℂ) is ⊕_σ ℂ f^σ (multiplicity one for newforms), of dimension [K_f : ℚ] = dim A_f.

**Prerequisites.**

- [`R14.5/modular-quotient`](#r14-5-modular-quotient) (The modular abelian variety A_f)
- [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension) (Shimura's theorem: dim A_f = [K_f : ℚ])
- [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint) (Hecke operators are self-adjoint for the w_ζ-twisted pairing)
- [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism) (The weight-two Shimura isomorphism is Hecke-equivariant)
- `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness) (Polarization and Hecke adjoints)

**Acceptance checks.**

- Fix the Hecke-action convention before identifying differentials; the two choices differ by w_ζ.
- For a separately constructed Picard quotient retain the w_ζ transport; never change the action on the already defined Albanese quotient.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 68 (printed page; PDF page 72). The cotangent identification and the adjoint warning.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-5-trivial-character-j0"></a>

### Trivial character: the quotient of J₀(N)

**Comparison** · `ModularCurvesPartII:R14.5/trivial-character-J0`

If χ_f is trivial, let p_f⁰ ⊂ T₀(N) be the kernel of the eigenvalue map on the Hecke algebra of J₀(N). Then A_f⁰ := J₀(N)/p_f⁰J₀(N) is an abelian variety over ℚ of dimension [K_f : ℚ], and the map J₀(N) → J₁(N) (pullback along X₁(N) → X₀(N)) induces an isogeny A_f⁰ → A_f compatible with the K_f-actions.

**Hypotheses and conventions.**

- The pullback J₀(N) → J₁(N) is Hecke-equivariant with finite kernel.

**Proof plan.**

1. Apply the J₁ argument to J₀(N) with H¹(X₀(N)) free of rank 2 over ℚ ⊗ T₀(N) (same proof as betti-free-rank-two).
2. The composite J₀(N) → J₁(N) → A_f kills p_f⁰J₀(N) and is nonzero on V_ℓ; compare dimensions.

**Prerequisites.**

- [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension) (Shimura's theorem: dim A_f = [K_f : ℚ])
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms); [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators)

**Acceptance checks.**

- Consumers (EllipticCurveModularity R29.5) use the J₀(N) quotient; keep the isogeny explicit.
- Diamond eigenvalues must all equal one; a nontrivial-character form is not assigned a J₀ quotient.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33). The construction applied to J₀(N).

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-5-oldform-comparison"></a>

### Oldforms: A_f inside J₁(M) for N | M

**Theorem** · `ModularCurvesPartII:R14.5/oldform-comparison` · planet: *Oldform multiplicity*

Let f have primitive level N and weight two, and let N|M. For the anemic Hecke algebra at level M, the rational abelian factor attached to the Galois orbit of f is isogenous over Q to A_f^{τ(M/N)}, where τ counts positive divisors. The degeneracy images for d|M/N give that factor up to isogeny. This uses the complete fixed-character oldspace and cross-level multiplicity-one theorem imported from ModularForms Layers 4/5; an eigenvector at raised level can be a linear combination of these images. The simple isogeny factor A_f is attached to the primitive eigensystem, whereas the full raised-level anemic quotient has the stated larger dimension.

**Hypotheses and conventions.**

- The anemic operators exclude primes dividing M.
- Character transport is the fixed character of f pulled to modulus M; do not count a different character’s oldspace.

**Proof plan.**

1. Import the fixed-character oldspace basis {V_d f:d|M/N} and the completeness/unique primitive-pair statement.
2. For each Galois conjugate the basis has τ(M/N) independent images; the leading q exponent proves independence, and imported completeness excludes other forms with that primitive eigensystem.
3. Use weight-two Shimura comparison to identify the rational Hecke block, then Poincaré complete reducibility and the degeneracy homomorphisms to obtain the Q-isogeny.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`
- `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`
- [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism) (The weight-two Shimura isomorphism is Hecke-equivariant)
- [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension) (Shimura's theorem: dim A_f = [K_f : ℚ])
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps); [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences) (Classical and geometric Hecke actions)
- `AbelianSchemesAndArithmeticModuli:A6`

**Acceptance checks.**

- M=N gives one copy; M=Np with p∤N gives two; M=Np² gives three, not four.
- No mod-ℓ saturation follows from this rational isogeny statement.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.6, p. 40; Corollary 5.9, pp. 69–70; Theorem 5.14, p. 73. The two old images at a prime and the rational Tate/dimension theorem motivate the geometric transfer. The complete all-divisor analytic theorem is imported from its existing owner, not attributed to that discussion.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-5-abel-jacobi-composite-nonzero"></a>

### The Abel–Jacobi composite to A_f is nonconstant

**Theorem** · `ModularCurvesPartII:R14.5/abel-jacobi-composite-nonzero`

For any supplied rational base point c∈X₁(N)(Q), the composite q_f∘AJ_c:X₁(N)→A_f is nonconstant and sends c to zero. The same assertion holds for a supplied point of X₀(N) and its trivial-character quotient. The argument uses A_f≠0 and the generation of the Jacobian by AJ_c; it does not require the rational-cusp construction of R14.6.

**Hypotheses and conventions.**

- A_f ≠ 0; the Abel–Jacobi map and its universal property are Tau Ceti JacobianChallenge Layer F.

**Proof plan.**

1. Import AJ_c and its universal property for the supplied rational point.
2. If the composite is constant, its value is zero because AJ_c(c)=0.
3. Since the image of AJ_c generates J, the quotient homomorphism is zero, contradicting surjectivity onto A_f≠0.

**Prerequisites.**

- [`R14.5/modular-quotient`](#r14-5-modular-quotient) (The modular abelian variety A_f)
- [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension) (Shimura's theorem: dim A_f = [K_f : ℚ])
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

**Acceptance checks.**

- No isogeny to a target curve is asserted here (that is EllipticCurveModularity R29.5).

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 74 (printed page; PDF page 78). Conrad's use of a rational cusp as base point.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

A rational-eigenvalue newform gives [K_f:ℚ]=1 and a dimension-one A_f. For a coefficient field of degree d, V_ℓA_f has ℚ_ℓ-dimension 2d, not d. At raised level M the anemic factor has τ(M/N) degeneracy copies: all divisors of M/N appear. The kernel of a character ℚ×ℚ→ℚ selecting the first factor is the second factor; conjugating through an injective field homomorphism leaves the kernel unchanged.

<a id="r14-6"></a>

## R14.6. Bad-prime and patching interfaces

Extend the Hecke endomorphisms to Néron models, prove the special-fibre Eichler–Shimura relation in weight two, normalize the Abel–Jacobi map at a rational cusp, and export the modular semistable data (supersingular character lattice, monodromy, character maps along degeneracies, the semistable Tate filtration) and the finite Taylor–Wiles cover with its freeness and augmentation. The integral quaternionic character pivot is a recorded missing input. Taylor–Wiles freeness is over the diamond group ring and asserts no Hecke multiplicity one.

<a id="r14-6-neron-hecke-extension"></a>

### Reduction of the supplied modular Hecke action

**Application** · `ModularCurvesPartII:R14.6/neron-hecke-extension`

Apply R14.2’s existing Néron extension of the actual modular Hecke endomorphisms. At p∤N, reduce them on the good abelian fibre J_p; at semistable primes use the induced torus, character and component-group maps of R11.6. The degeneracy morphisms of curves need not extend across their correspondence prime in the same form; the Jacobian endomorphism is what is reduced.

**Hypotheses and conventions.**

- Pic⁰\_{X₁(N)/ℤ[1/N]} is an abelian scheme, hence the Néron model of its generic fibre.

**Proof plan.**

1. Import the endomorphisms and their already-owned generic Néron extension.
2. Take the appropriate special fibre; apply the generic functoriality on tori, characters and components.
3. Match the reduced operator to the specific modular correspondence on the special fibre.

**Prerequisites.**

- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms); [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators)
- `NeronModelsAndSemistableAbelianVarieties:R11.6`

**Consumers in this roadmap.** [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura); [`R14.6/supersingular-character-lattice`](#r14-6-supersingular-character-lattice)

**Acceptance checks.**

- The degeneracy maps π_i^{(p)} themselves do not exist over ℤ[1/N] near p; only the induced endomorphisms extend.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 72 (printed page; PDF page 76). The extension.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-special-fibre-eichler-shimura"></a>

### The Eichler–Shimura relation

**Theorem** · `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura` · planet: *Eichler–Shimura relation*

For p∤N and J_p=Pic⁰(X₁(N)_Fp), let F be the p-power Frobenius endomorphism and V its Verschiebung, so FV=VF=[p]. In End_Fp(J_p), the Albanese Hecke operator satisfies (T_p)_\*=F+⟨p⟩_\*V. Over F̄_p, for a chosen primitive Nth root ζ, w_ζ⁻¹Fw_ζ=⟨p⟩_\*⁻¹F. This is the weight-two special-fibre relation exported to R19.1; identification of a selected eigencomponent’s Galois characteristic polynomial is the consumer’s theorem.

**Hypotheses and conventions.**

- p prime, p∤N; the supplied proper curve and its Jacobian have good reduction.
- V is the actual Verschiebung, identified with the polarization dual of F; w_ζ is only required over the field containing ζ.

**Proof plan.**

1. On the ordinary dense locus, the good-prime isogeny correspondence consists of the Frobenius graph and its transpose with the diamond twist; import this special-fibre correspondence statement from R14.1/R13.2.
2. Equality of correspondence actions on degree-zero divisors yields equality of Jacobian endomorphisms by Albanese functoriality; extend by density.
3. For w_ζ use Frobenius on level roots of unity and the dual isogeny relation, exactly as in Conrad’s proof.

**Assembly note.** AutomorphicGaloisRepresentations R19.1 imports this relation in weight two and deduces from T_p=F+⟨p⟩V and FV=p the characteristic polynomial of Frobenius at a good prime; R19 keeps only the higher-weight Sym^(k−2) congruence of Deligne.

**Prerequisites.**

- [`R14.6/neron-hecke-extension`](#r14-6-neron-hecke-extension) (Reduction of the supplied modular Hecke action)
- `ModularCurvesPartII:R13.2`, used through its targets [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin) (Proper flat integral level stacks); [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries) (Fine loci and bad-level inertia); [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes) (Agreement on the ordinary and tame loci); `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps); [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators); [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace) (Integral étale correspondence trace)
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian) (Upper and lower Jacobian Hecke operators); [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness) (Polarization and Hecke adjoints)
- `AbelianSchemesAndArithmeticModuli:A4`

**Acceptance checks.**

- The extra w_ζ relation is part of the statement; it is used to identify the characteristic polynomial of Frobenius (AutomorphicGaloisRepresentations R19.1).

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Theorem 5.16 and proof, pp. 74–79. The actual Jacobian endomorphism identity, its w_ζ conjugation and the Frobenius/Verschiebung convention.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-rational-cusp-abel-jacobi"></a>

### Cusp-normalised Abel–Jacobi maps

**Construction** · `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi` · planet: *Cusp-normalised Abel–Jacobi maps*

Use the supplied rational cusp ∞ of X₀(N), and a specified rational cusp c of the chosen X₁(N) point-of-exact-order moduli model (Conrad uses 0), to specialize the imported AJ construction: AJ_c(x)=[x−c]. It is over Q, sends c to zero and is a closed immersion when the genus is positive. For a degeneracy morphism α:X′→X and rational cusp c′, α_\*AJ\_{c′}(x)=AJ_c(α(x))+[α(c′)−c]. Hecke compatibility is on degree-zero divisors; without a base-point correction this is not an equality of point maps.

**Hypotheses and conventions.**

- Rationality is proved for the chosen cusp and moduli model; the cusp named ∞ on X₁(N) is not assumed rational in every model.

**Proof plan.**

1. Import cusp fields and the precise moduli model from R12.3; select the rational cusp there.
2. Instantiate JacobianChallenge Layer F’s actual morphism and immersion theorem.
3. Compute pushforward of [x−c′] to obtain the base-point correction; compute the Hecke action on degree-zero divisors.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.abelJacobiInfty` | constructor | The imported AJ for X₀(N), based at its supplied rational cusp ∞. |
| `TauCeti.ModularCurves.abelJacobiInfty_cusp` | simp | AJ_∞(∞)=0. |
| `TauCeti.ModularCurves.abelJacobiInfty_injective` | characterisation | AJ_∞ is a closed immersion for genus at least one; no immersion conclusion for genus zero. |
| `TauCeti.ModularCurves.abelJacobi_changeBase` | relation | AJ_b(x)=AJ_c(x)−AJ_c(b). |
| `TauCeti.ModularCurves.abelJacobi_degeneracy` | compatibility | α_\*AJ\_{c′}(x)=AJ_c(αx)+[αc′−c]. |
| `TauCeti.ModularCurves.abelJacobi_hecke` | compatibility | On degree-zero divisors D, the induced endomorphism sends [D] to [T(D)] using the chosen Picard/Albanese convention. |

**Unit tests.**

- `abelJacobi_X011` (computation): For the genus-one curve X₀(11), AJ_∞ is an isomorphism with its Jacobian.
- `abelJacobi_genus0` (degenerate): For X₀(1), the Jacobian and AJ image are zero; the curve map is not injective.
- `abelJacobi_baseChange_test` (compatibility): For any supplied rational cusp b, AJ_b(b)=0 and AJ_b(x)=AJ_∞(x)−AJ_∞(b).
- `abelJacobi_degeneracy_offset` (non-example): If [αc′−c]≠0, the uncorrected identity α_\*AJ\_{c′}=AJ_c∘α fails already at c′.

**Uses.**

- EllipticCurveModularity:R29.5: A rational normalized curve map once the modular quotient is identified.
- [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura) (The Eichler–Shimura relation): The Albanese description with a rational point on the good fibre.

**Prerequisites.**

- `ModularCurvesPartII:R12.3`, used through its targets [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels) (Cusp fields and pairing components); [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent) (Canonical generic models and coefficient descent)
- `ModularCurvesPartII:R13.2`, used through its targets [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures) (Integral full, point and cyclic level structures); [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes) (Agreement on the ordinary and tame loci)
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps); [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators); [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution) (Cyclotomic Fricke involution)
- `ModularCurvesPartII:R14.2`, used through its targets [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality) (Modular Jacobians and norms)
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

**Acceptance checks.**

- No modular parametrisation of an elliptic curve is asserted here.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 74 (printed page; PDF page 78). The base-point choice.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/ModularQuotient`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-supersingular-character-lattice"></a>

### The modular supersingular character lattice

**Construction** · `ModularCurvesPartII:R14.6/supersingular-character-lattice` · planet: *Supersingular character lattice*

For the mixed level Γ₁(M)∩Γ₀(p), M≥5 and p∤M, use R13.5’s split geometric semistable fibre: its two smooth components are the two copies of X₁(M)_F̄p and they meet at the finite supersingular level-point set S. Orient every edge from the first component to the second. The toric character group is canonically Z[S]⁰=ker(Σ:Z[S]→Z), compatibly with good-prime Hecke correspondences, diamonds and geometric Frobenius (including the action on orientations). Thickness is retained in the monodromy pairing rather than in this unweighted boundary map.

**Hypotheses and conventions.**

- The two-component description is a supplied theorem for the mixed Γ₀(p) model, not a claim about X₁(Mp).
- If a regular model introduces subdivisions, compare graph homology by contraction; the stable thickness data must be preserved.

**Proof plan.**

1. Import the actual fibre normalization, nodes and their correspondences from R13.5.
2. Its dual graph has two vertices and edges S; the boundary of each edge is v₂−v₁, so the cycle lattice is ker Σ.
3. Import R11.4’s X\*(torus)=H₁(dual graph,Z), and transport the actual operators through the incidence-chain description.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.supersingularDegreeZero` | constructor | The kernel of total sum on the free abelian module on the supplied finite set S. |
| `TauCeti.ModularCurves.mem_supersingularDegreeZero` | characterisation | A combination belongs exactly when its coefficients sum to zero. |
| `TauCeti.ModularCurves.supersingularDifference` | constructor | For s,t∈S, the generator [s]−[t]. |
| `TauCeti.ModularCurves.supersingularDifference_diagonal` | simp | The difference with equal endpoints is zero. |
| `TauCeti.ModularCurves.supersingularDegreeZero_graph` | equivalence | For the supplied two-component fibre, this kernel is the actual integral H₁ graph lattice and torus character group. |
| `TauCeti.ModularCurves.supersingularDegreeZero_correspondence` | compatibility | A supplied geometric graph correspondence induces its character map via incidence chains; no division by an edge multiplicity is used. |
| `TauCeti.ModularCurves.supersingularDegreeZero_ext` | extensionality | Two elements of the degree-zero lattice are equal when every supersingular coefficient agrees. |

**Unit tests.**

- `supersingularDegreeZero_singleton` (degenerate): With one supersingular edge the kernel is zero.
- `supersingularDegreeZero_two` (computation): With two edges the kernel is generated by (1,−1) and is free of rank one.
- `supersingularDegreeZero_difference` (characterisation): For distinct s,t, [s]−[t] is a nonzero degree-zero element.
- `supersingularDegreeZero_notComponent` (non-example): The one-loop lattice with edge thickness h has character rank one for every h, although its component cokernel has order h.

**Uses.**

- [`R14.6/modular-monodromy`](#r14-6-modular-monodromy) (Modular monodromy and component sequence): The concrete integral lattice carrying the monodromy form.
- SerreWeightAndLevelOptimisation:R20.2: The actual toric lattice, with degeneracy and Hecke maps.

**Prerequisites.**

- `ModularCurvesPartII:R13.5`, used through its targets [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model) (One-factor mixed-level models); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs) (Modular dual graphs and thicknesses)
- `NeronModelsAndSemistableAbelianVarieties:R11.4`
- [`R14.6/neron-hecke-extension`](#r14-6-neron-hecke-extension) (Reduction of the supplied modular Hecke action)

**Consumers in this roadmap.** [`R14.6/modular-monodromy`](#r14-6-modular-monodromy); [`R14.6/character-degeneracy-sequences`](#r14-6-character-degeneracy-sequences)

**Acceptance checks.**

- If |S|=s≥1, rank X\*=s−1.
- Character group means integral graph homology, not its dual or the component group.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp. 44–46; §3.10.2, p. 48. The semistable mixed-level Jacobian has a toric part and two good-reduction Jacobian factors; character groups carry the level-change action.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-modular-monodromy"></a>

### Modular monodromy and component sequence

**Comparison** · `ModularCurvesPartII:R14.6/modular-monodromy`

For the actual semistable modular Jacobian at p and its supplied regular or weighted stable dual graph, transport R11.4’s integral monodromy map μ:X\*(J^∨)→Hom(X\*(J),Z). The sequence 0→X\*(J^∨)→Hom(X\*(J),Z)→Φ_J(F̄p)→0 is exact. Under the principal polarization and graph identification, μ is the edge pairing Σ_e h_e a_e b_e, with positive thickness h_e; a regular semistable model uses h_e=1. It is perfect over Q but need not be unimodular over Z. The ℓ-primary component group is its tensor cokernel, including ℓ dividing the determinant.

**Hypotheses and conventions.**

- Use the actual model; the component sequence is geometric over F̄p with descent action retained.

**Proof plan.**

1. Import the dual character lattice and monodromy sequence from R11.4.
2. Identify it with the graph intersection pairing via R13.5’s supplied node thicknesses.
3. Use Néron functoriality to compare endomorphisms and their adjoints; derive the Hecke action on Φ from the cokernel.

**Prerequisites.**

- [`R14.6/supersingular-character-lattice`](#r14-6-supersingular-character-lattice) (The modular supersingular character lattice)
- `NeronModelsAndSemistableAbelianVarieties:R11.4`
- `ModularCurvesPartII:R13.5`, used through its targets [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model) (One-factor mixed-level models); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs) (Modular dual graphs and thicknesses)

**Consumers in this roadmap.** [`R14.6/character-degeneracy-sequences`](#r14-6-character-degeneracy-sequences); [`R14.6/semistable-tate-interface`](#r14-6-semistable-tate-interface)

**Acceptance checks.**

- For two vertices joined by two edges of thickness one, the generator (1,−1) has monodromy value 2 and component cokernel Z/2.
- No ℓ-primary information is recovered by inverting ℓ first.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp. 44–46; §3.10.2, p. 48. The modular character and component groups enter level lowering; the generic integral monodromy theorem is imported from R11.4.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-character-degeneracy-sequences"></a>

### Integral modular character maps and exactness

**Theorem** · `ModularCurvesPartII:R14.6/character-degeneracy-sequences`

Every supplied degeneracy homomorphism of semistable modular Jacobians induces the contravariant character map and the compatible monodromy/component diagram of R11.6. For a supplied exact sequence of special-fibre tori 0→T₁→T→T₂→0, the resulting character sequence 0→X\*(T₂)→X\*(T)→X\*(T₁)→0 is integral and Hecke-equivariant. An old/new abelian isogeny decomposition alone does not provide this exact torus sequence: the concrete modular integral kernel, cokernel and saturation must be computed from the graph maps. The pivot character sequence 0→X_p(J_pq(K))→X_q(J(K,pq))→X_q(J(K,q))²→0 of Ribet–Stein (3.2) requires its quaternionic/Cerednik–Drinfeld input and remains an explicitly recorded ownership/source gap in this part.

**Hypotheses and conventions.**

- All tori and maps in an exactness assertion are specified geometric objects; if only an isogeny is known, retain its finite lattice error.
- J_pq(K) in the pivot sequence is a Shimura-curve Jacobian, not a modular-curve Jacobian of level pq.

**Proof plan.**

1. Import generic character functoriality, then identify the specific maps on the normalization graph supplied by R13.5.
2. Dualize a proved exact torus sequence; compute any finite lattice error instead of erasing it by rationalization.
3. For the pivot sequence retain the explicit quaternionic term and request the missing model-to-graph comparison with its correct owner; do not re-prove level lowering here.

**Prerequisites.**

- [`R14.6/modular-monodromy`](#r14-6-modular-monodromy) (Modular monodromy and component sequence)
- [`R14.6/supersingular-character-lattice`](#r14-6-supersingular-character-lattice) (The modular supersingular character lattice)
- `NeronModelsAndSemistableAbelianVarieties:R11.6`
- `ModularCurvesPartII:R13.5`, used through its targets [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model) (One-factor mixed-level models); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs) (Modular dual graphs and thicknesses); [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components) (Degeneracy maps on modular components)

**Acceptance checks.**

- A finite isogeny kernel can give a nonzero finite character cokernel.
- The character maps reverse the direction of torus maps.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.10.2, equation (3.2), p. 48. The pivot sequence includes a different Shimura-curve Jacobian; the Cerednik–Drinfeld proof is cited but not supplied by that reference.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-semistable-tate-interface"></a>

### The semistable modular Tate filtration

**Application** · `ModularCurvesPartII:R14.6/semistable-tate-interface`

For an actual semistable modular Jacobian J over Q_p and ℓ≠p, import the saturated filtration T_ℓ(J)_t⊂T_ℓ(J)_f⊂T_ℓ(J), with T_t≅Hom(X\*(J),Z_ℓ(1)), T_f=T_ℓ(J)^{I_p}, and T_f/T_t the Tate module of the abelian part of the special fibre. The ranks are t,t+2a,2(t+a), respectively. Identify the inertia/monodromy map with the modular monodromy pairing and the induced Hecke maps. This is the actual integral input for R20’s ramification arguments; the p-adic semistable representation case belongs to p-adic comparison owners.

**Hypotheses and conventions.**

- ℓ≠p and actual semistable reduction; no claim T_f=T^{I_p} at ℓ=p.

**Proof plan.**

1. Apply R11.3 and the actual toric character computation.
2. Use modular-monodromy and its imported R11.4 graph comparison to match the monodromy operator and Weil pairing.
3. Transport the supplied degeneracy and Hecke maps through the filtration.
4. Use the lower-tier R11.3 Tate filtration and R11.4 graph comparison for this modular application. No completion of the higher-tier weights roadmap is needed; its nearby-cycle interpretation belongs to the weights owner.

**Prerequisites.**

- [`R14.6/modular-monodromy`](#r14-6-modular-monodromy) (Modular monodromy and component sequence)
- `NeronModelsAndSemistableAbelianVarieties:R11.3`

**Acceptance checks.**

- The toric torsion is Hom(X\*,μ_ℓ), with the cyclotomic twist.
- Inertia invariants of residual torsion need not be the reduction of integral invariants; the finite monodromy cokernel matters.

**Sources.**

- [`RIBET-STEIN-SERRE-LECTURES`](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp. 45–46; §3.10.3, pp. 48–49. Toric torsion embeds into inertia-fixed modular Jacobian torsion; the semistable comparison is imported from its general owner.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-taylor-wiles-cover"></a>

### The finite Taylor–Wiles modular cover

**Construction** · `ModularCurvesPartII:R14.6/taylor-wiles-cover` · planet: *Taylor–Wiles modular cover*

Fix odd residue characteristic ℓ and a finite set Q of primes q∤Nℓ with q≡1 mod ℓ. Let H_q be the prime-to-ℓ subgroup of (Z/q)× and Δ_q=(Z/q)×/H_q, Δ_Q=∏Δ_q. At q, Γ̄_Q has Γ₀(q) level and Γ_Q is the inverse image of H_q under the diamond quotient. Retain the fixed base level at N, and intersect both groups with the same auxiliary Γ₁(R), with R≥5 a prime coprime to Nℓ∏Q, to remove stabilizers. Then Γ_Q⊲Γ̄_Q with quotient Δ_Q, and Y_Q→Ȳ_Q is an actual finite étale analytic cover with that deck group. Complex conjugation ξ=diag(−1,1) normalizes both groups and acts trivially on Δ_Q. For the actual H¹(Y_Q,O), define M_Q^- as the kernel of ξ+1, and then take the specified anemic and selected U_q-root localization.

**Hypotheses and conventions.**

- O complete DVR finite over Z_ℓ; all auxiliary cover data and level maps are fixed.
- The open cover is unramified; its compactification can ramify at cusps and is not assumed étale there.
- Selected residual roots are distinct, and the cyclotomic-determinant specialization uses q≡1 and α_qβ_q=1.

**Proof plan.**

1. Build the subgroup from the actual congruence conditions and identify its finite diamond quotient using the Chinese remainder map.
2. Import the torsion-free analytic quotients and their cover action; verify ξ conjugation on the congruence subgroup and quotient.
3. Use the actual group/Betti H¹ module with deck action, form its minus eigenspace and complete/localize the commuting Hecke action.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularCurves.taylorWilesLevel` | constructor | The congruence subgroup Γ_Q and its cover of the specified Γ̄_Q quotient. |
| `TauCeti.ModularCurves.taylorWilesLevel_quotient` | equivalence | Γ̄_Q/Γ_Q≅Δ_Q, with the actual diamond action. |
| `TauCeti.ModularCurves.taylorWilesLevel_conjugation` | compatibility | ξ fixes Δ_Q and commutes with its action on H¹. |
| `TauCeti.ModularCurves.taylorWilesMinus` | constructor | The ξ=−1 submodule of the actual cover H¹, before the specified commuting Hecke localization. |
| `TauCeti.ModularCurves.mem_taylorWilesMinus` | characterisation | x lies in M^- iff ξx=−x. |
| `TauCeti.ModularCurves.taylorWilesMinus_projector` | projection | Since 2 is a unit, (1−ξ)/2 projects to the minus submodule. |
| `TauCeti.ModularCurves.taylorWilesMinus_coefficients` | functoriality | Coefficient change and deck/Hecke-equivariant morphisms commute with minus projection under the proved base-change hypotheses. |
| `TauCeti.ModularCurves.taylorWilesMinus_ext` | extensionality | Two minus classes are equal if their images in the actual cover H¹ agree. |

**Unit tests.**

- `taylorWilesMinus_id` (degenerate): If ξ=id and 2 is invertible, the minus module is zero.
- `taylorWilesMinus_neg` (characterisation): If ξ=−id, the minus module is the whole module.
- `taylorWilesMinus_swap` (computation): For ξ(x,y)=(y,x) on O², the minus submodule is {(a,−a):a∈O}.
- `taylorWilesLevel_empty` (degenerate): For Q empty the diamond quotient is trivial and the selected cover is the base cover.
- `taylorWilesMinus_two` (non-example): In characteristic two the kernel of ξ+1 need not be a complementary direct summand; the projector statement requires 2 invertible.

**Uses.**

- [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness) (Finite-level Taylor–Wiles freeness): Actual geometric O[Δ_Q]-module for the freeness theorem.
- [`R14.6/augmentation-control`](#r14-6-augmentation-control) (Augmentation and selected-root specialization): The level quotient whose augmentation specialization returns the base module.

**Prerequisites.**

- [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology) (Finite and adic parabolic cohomology)
- [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients) (Hecke operators with relative coefficients)
- `ModularCurvesPartII:R14.1`, used through its targets [`R14.1/diamond-operators`](#r14-1-diamond-operators) (Diamond operators); [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) (Compactified Hecke degeneracy maps)
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

**Consumers in this roadmap.** [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness); [`R14.6/diamond-group-ring-local`](#r14-6-diamond-group-ring-local)

**Acceptance checks.**

- Q=empty gives Δ_Q=1 and the fixed auxiliary base-level module.
- The choice of root is part of the Hecke localization, not a new definition of an abstract free module.

**Sources.**

- [`TAYLOR-WILES`](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Definition of Δ_Q, Γ_Q, Γ̄_Q and auxiliary R, author pp. 4–7; Proposition 1, pp. 7–8. The actual finite diamond cover and minus cohomology module used in the freeness proof.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-diamond-group-ring-local"></a>

### Apply the existing local group-ring algebra to diamond groups

**Application** · `ModularCurvesPartII:R14.6/diamond-group-ring-local`

For the actual finite abelian ℓ-group Δ_Q and DVR O of taylor-wiles-cover, specialize the current Tau Ceti local-group-ring and local-augmentation theorems to obtain IsLocalRing O[Δ_Q]. The maximal ideal is the inverse image of the maximal ideal of O under augmentation, generated by that ideal and [δ]−1. Apply the pinned finite-flat-over-local-ring freeness theorem to the finite projective minus module. This node imports these algebra facts and records their modular hypotheses; it plans no second generic local-group-ring theorem.

**Hypotheses and conventions.**

- Δ is the finite diamond group of taylor-wiles-cover; the assertion is not made for a finite group of order prime to ℓ.

**Proof plan.**

1. Read the current declarations TauCeti.MonoidAlgebra.isLocalRing_of_isPGroup and isLocalHom_lift_one_of_isPGroup: the inputs are a commutative local ring, a prime ℓ with ¬IsUnit(ℓ:O), and a finite commutative ℓ-group. The actual diamond group and residue characteristic supply precisely these inputs.
2. Use the existing augmentation and its kernel-span description to identify the maximal ideal; the local augmentation is surjective.
3. Apply Module.free_of_flat_of_isLocalRing to the finite projective module (projective implies flat); finite generation is essential. Integration of the post-pin group-ring module is explicitly recorded as a gap, rather than claimed at f790474.

**Prerequisites.**

- [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover) (The finite Taylor–Wiles modular cover)
- `mathlib:Module.free_of_flat_of_isLocalRing`

**Consumers in this roadmap.** [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness)

**Acceptance checks.**

- Δ=1 recovers O.
- For Δ=C₂ and ℓ odd the group ring has distinct trivial and sign factors, so this local-ring conclusion is false.

**Sources.**

- [`TAYLOR-WILES`](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proof of Proposition 1, author pp. 7–8. The minus cohomology is projective over the local diamond group ring, hence free.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-taylor-wiles-freeness"></a>

### Finite-level Taylor–Wiles freeness

**Theorem** · `ModularCurvesPartII:R14.6/taylor-wiles-freeness` · planet: *Taylor–Wiles freeness*

For the actual cover and O of taylor-wiles-cover, H¹(Y_Q,O)^− is finite free over O[Δ_Q], with rank equal to rank_O H¹(Ȳ_Q,O)^−. Each commuting completed anemic/selected-root Hecke localization is an O[Δ_Q]-direct summand and is therefore also finite free. At the non-Eisenstein ideals of R14.3, boundary removal identifies this with the compact cuspidal module. Reduction modulo πⁿ yields a finite free (O/πⁿ)[Δ_Q]-module of the same rank. The plus eigenspace and Hecke-rank-one multiplicity claims are not conclusions of Proposition 1.

**Hypotheses and conventions.**

- Odd ℓ; Δ_Q is an abelian ℓ-group; the congruence group Γ̄_Q is torsion-free and free of finite rank.
- The finite-level identification with cohomology modulo πⁿ uses localized-freeness or the minus-cochain computation, not merely a claim that rational invariants commute with integral reduction.

**Proof plan.**

1. Apply Shapiro: H¹(Γ_Q,O)=H¹(Γ̄_Q,O[Δ_Q]). Since Γ̄_Q is free, its cocycle module is finite free over O[Δ_Q].
2. ξ acts trivially on Δ_Q, so all coboundaries are in the plus eigenspace; minus H¹ equals minus cocycles, a projective summand.
3. O[Δ_Q] is local for a finite ℓ-group over the complete DVR, so that finite projective module is free.
4. Over Frac(O), finite cover descent identifies Δ_Q invariants with base cohomology, giving the stated rank; prove coefficient reduction by the same finite free minus complex.
5. Completed commuting Hecke localization is an idempotent summand; use boundary removal only for the stated non-Eisenstein modules.
6. Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

**Prerequisites.**

- [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover) (The finite Taylor–Wiles modular cover)
- [`R14.3/localized-freeness`](#r14-3-localized-freeness) (Finite generation and localized integral freeness)
- [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein) (Non-Eisenstein removal of the boundary)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`
- `mathlib:groupCohomology.coindIso`
- [`R14.6/diamond-group-ring-local`](#r14-6-diamond-group-ring-local) (Apply the existing local group-ring algebra to diamond groups)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

**Consumers in this roadmap.** [`R14.6/augmentation-control`](#r14-6-augmentation-control)

**Acceptance checks.**

- This is freeness over O[Δ_Q], not over the localized Hecke algebra.
- For Δ_Q of order ℓ, the O-rank is ℓ times the O[Δ_Q]-rank.
- Nothing is asserted about weight-one coherent cohomology by this weight-two argument.

**Sources.**

- [`TAYLOR-WILES`](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proposition 1 and proof, author pp. 7–8. The minus cocycle/direct-summand argument proves finite group-ring freeness and its base rank.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

<a id="r14-6-augmentation-control"></a>

### Augmentation and selected-root specialization

**Theorem** · `ModularCurvesPartII:R14.6/augmentation-control`

Let I_Q be the augmentation ideal of O[Δ_Q]. For the minus modules of the actual covers, M_Q^-/I_QM_Q^- identifies with H¹(Ȳ_Q,O)^−, via Shapiro’s induced-coefficient complex and its augmentation. At the cyclotomic-determinant Taylor–Wiles roots of taylor-wiles-root-control, successive root selection at q∈Q identifies the localized base-side module with the fixed-level localized module. All maps commute with anemic Hecke operators and reduction modulo πⁿ. A finite free O[Δ_Q] module M satisfies rank_O(M/I_QM)=rank\_{O[Δ_Q]}M; this numerical fact is used only after the actual geometric specialization map has been proved.

**Hypotheses and conventions.**

- The same auxiliary R-level is retained at both ends. Removing R requires a separate checked level-control argument and its source hypotheses.
- Distinct residual roots, q∤Nℓ and odd ℓ; no repeated-root specialization.

**Proof plan.**

1. On the Shapiro free-group complex, augmentation is coefficient change O[Δ_Q]→O. The degree-zero coboundaries are plus, so minus projection and its H¹ commute with this change.
2. Use finite group-ring freeness and the exact minus complex to prove augmentation and coefficient compatibility.
3. Apply the finite-level degeneracy root-control theorem successively; retain the actual root idempotents.
4. Export the geometric module and specialization data to generic patching owners, which own inverse systems and the ring theorem.

**Prerequisites.**

- [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness) (Finite-level Taylor–Wiles freeness)
- [`R14.4/taylor-wiles-root-control`](#r14-4-taylor-wiles-root-control) (Taylor–Wiles degeneracy control)
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

**Acceptance checks.**

- A rank equality without the specialization morphism is insufficient.
- This does not remove an auxiliary R-level on its own.

**Sources.**

- [`TAYLOR-WILES`](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proof of Proposition 1, author pp. 7–8. The free-group/Shapiro computation supplies the module used for augmentation control.
- [`CALEGARI-GERAGHTY`](https://arxiv.org/pdf/1207.4224), Lemma 9.6, pp. 88–90. Distinct-root finite-level control identifies the auxiliary Γ₀(q) level with the selected fixed-level module.

**Proposed library placement:** `TauCeti/NumberTheory/ModularCurves/PatchingInterface`, namespace `TauCeti.ModularCurves`.

### Worked examples for this layer

For a supersingular set with one element the degree-zero character lattice is zero; for two elements it is ℤ generated by [s]−[t]. Positive thicknesses change its monodromy index. For the swap involution on O² the minus vectors are (a,−a); for ξ=−id the minus module is all of M, and for ξ=id it is zero when 2 is invertible. In characteristic 2 plus and minus cease to split. With Q empty the cover and augmentation are identity maps. For Q nonempty, rank agreement is checked only after the geometric augmentation and selected-root maps have been proved.

<a id="supplier-contracts"></a>

## Supplier contracts

These are the exact statements this roadmap needs from other roadmaps, where the supplier's layer is cited rather than one of its targets, or where the supplier states the needed result only inside a larger target. Each lists the targets here that consume it. A contract is a planning interface: it records what must be true of the supplier's construction, and the consuming target's proof is complete once the supplier proves it.

### AbelianSchemesAndArithmeticModuli

- **`A2`**: Dual abelian schemes, canonical principal polarization of a relative curve Jacobian, and the norm/pullback transpose identity; use the curve-specific relative construction requested in A0-extension. *Needed by* [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality).
- **`A4`**: Actual ℓ-power torsion and inverse-limit Tate module, its 2g rank and Weil pairing; the curve-Picard Kummer comparison needed in weight-two-tate-comparison. For the weight-two special-fibre calculation include Frobenius/Verschiebung and finite-flat p-torsion connected–étale structure in characteristic p, distinct from the ℓ-invertible Tate comparison. *Needed by* [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system), [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison), [`R14.5/quotient-tate-exact`](#r14-5-quotient-tate-exact), [`R14.5/modular-quotient-dimension`](#r14-5-modular-quotient-dimension), [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura).
- **`A5`**: Relative rank-one complex tori: the exponential uniformization E≅Lie(E)/H₁ of a proper smooth analytic family of one-dimensional complex tori over an arbitrary analytic base (package A5.6), so that a marking of H₁ gives holomorphically varying periods and a holomorphic classifying map to H. *Needed by* [`R12.2/marked-torus-family`](#r12-2-marked-torus-family), [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization).
- **`A6`**: General quotient by a connected abelian subvariety over Q, field of definition, extension across a good-reduction abelian scheme and rational Tate exactness, using Poincaré reducibility. A3 finite-flat-kernel quotients do not alone supply this positive-dimensional quotient. *Needed by* [`R14.5/modular-quotient`](#r14-5-modular-quotient), [`R14.5/quotient-tate-exact`](#r14-5-quotient-tate-exact), [`R14.5/oldform-comparison`](#r14-5-oldform-comparison).

### AlgebraicModuliForArithmeticGeometry

- **`A0-extension`**: Consumed as planned in its package Layer 7: §7.10.1 complex analytic spaces (ComplexAnalyticSpace with nilpotent local models; closedSubspace, openSubspace, glue, fibreProduct, coherentStructure) and complexSchemeAnalytification of schemes locally of finite type over C (functor laws, homEquiv, closed/open/fibre-product comparisons, etaleLocalIso, so smooth schemes give complex manifolds); §7.10.3 completedAnalyticStalkComparison and the proper comparison properSchemeGagaPushforward/properSchemeGagaEquivalence (H⁰ and H¹ of O, Ω¹ and line powers on proper curves); §§7.3 and 7.9 the Picard space of a proper flat curve with geometrically connected reduced fibres and its identity component. This replaces the earlier SF.2 integration request: the RT-AREA-algebraicgeometry/3 carrier now has this owner. *Needed by* [`R12.1/lattice-weierstrass-model`](#r12-1-lattice-weierstrass-model), [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization), [`R12.2/marked-torus-family`](#r12-2-marked-torus-family), [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization), [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization), [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement), [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy), [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials), [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing), [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent), [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility), [`R13.1/deligne-rapoport-structure-criterion`](#r13-1-deligne-rapoport-structure-criterion).
- **`A0-extension`**: For a proper smooth geometrically connected curve over ℤ[1/N], relative Picard representability, smooth/proper neutral component and base change, using the existing A0-extension nodes picard-space-representability, picard-zero-criterion and picard-infinitesimal-lifting. Supply the curve-specific relative norm and canonical principal polarization with pullback/norm duality; JacobianChallenge D alone is only a field theorem. *Needed by* [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality).
- **`R09.5`**: For a regular local ring finite over its invariant subring, a finite residue-trivial group of order invertible in the residue field has regular invariants exactly when its cotangent image is generated by pseudo-reflections. Use this tame quotient criterion only in the stated scope. This is an additional supplier contract requested from the quotient owner, not an assertion that its current R09.5 packet already has a pseudo-reflection node. Current ModularCurves 9C supplies only its more restricted Katz–Mazur quotient criteria. *Needed by* [`R13.5/corrected-coarse-singular-locus`](#r13-5-corrected-coarse-singular-locus).
- **`R09.6/completed-atlas-presentation`**: Import the existing identity-framed object/relation formal groupoid presentation of a smooth atlas, including its hypotheses. Residual automorphisms outside the identity relation completion must be retained separately; the finite-inertia coarse-invariant comparison is the R09.5 request, not a consequence of the single completed atlas chart. Invariant completions require the actual stabilizer action from R09.5 and the explicit local charts; they are not identified with the atlas ring itself. *Needed by* [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts).

### EtaleDualityAndPerverseSheaves

- **`EDC.0`**: Finite locally constant coefficient cohomology and compact supports on smooth curves, constructibility, finite generation and proper smooth base change for R¹ of the universal elliptic family. Supply j_!, Rj_\* and the enhanced coefficient/support categories used for the boundary complex. *Needed by* [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system), [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology), [`R14.3/integral-comparison`](#r14-3-integral-comparison), [`R14.3/boundary-exact-sequence`](#r14-3-boundary-exact-sequence), [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients).
- **`EDC.1`**: Supply the localization triangle j_!L→Rj_\*L→i_\*i^\*Rj_\*L through the open/closed adjunction and localization API. Its local inertia stalk calculation is a specific required input, not a cycle-class theorem in EDC.3. *Needed by* [`R14.3/boundary-exact-sequence`](#r14-3-boundary-exact-sequence).
- **`EDC.2`**: Curve Poincaré–Lefschetz/étale duality with coefficient duals and twists; restrict to the parabolic image and prove integral perfection only under the displayed torsion and boundary vanishings. Use the trace-purity target for finite étale pullback/trace, trace∘pullback=degree and the projection formula; use its pairing target for duality. These are not supplied by the EDC.3 cycle-class target. *Needed by* [`R14.3/parabolic-duality`](#r14-3-parabolic-duality), [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison), [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients).
- **`EDC.6`**: Integral comparison with complex H¹ and compatibility of its trace/cup product with finite curve maps; Tate twist in the Jacobian comparison. *Needed by* [`R14.1/integral-etale-trace`](#r14-1-integral-etale-trace).

### FiniteFlatGroupsAndIntegralPadicHodgeTheory

- **`R07.1`**: The general finite locally free group/subgroup divisor and infinitesimal lifting interfaces used by Drinfeld torsion congruences; no duplicate general full-set theory is requested. *Needed by* [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension).

### NeronModelsAndSemistableAbelianVarieties

- **`R11.1`**: Néron extension of generic Jacobian homomorphisms over a DVR when the modular coarse fibre is singular; do not claim abelian good reduction at level-dividing primes. *Needed by* [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality).
- **`R11.3`**: Semistable integral Tate filtration at ℓ≠p: T_tor⊂T_f=T^{I_p}⊂T, toric term Hom(X\*(T),Z_ℓ(1)), finite quotient T_ℓ of the abelian reduction; keep saturation hypotheses. *Needed by* [`R14.6/semistable-tate-interface`](#r14-6-semistable-tate-interface).
- **`R11.4`**: Comparison of the Néron identity fibre with Pic⁰ of a proper regular semistable curve, the thickness-weighted graph monodromy pairing and its component-group discriminant. Import the general theorem; this part supplies the modular component/branch data. Additional consuming contract: Generic graph identification X\*(T)=H₁(dual graph,Z), weighted monodromy into its Z-dual and component-group cokernel, retaining all node thicknesses and primary torsion. *Needed by* [`R13.6/modular-character-group-interface`](#r13-6-modular-character-group-interface), [`R14.6/supersingular-character-lattice`](#r14-6-supersingular-character-lattice), [`R14.6/modular-monodromy`](#r14-6-modular-monodromy).
- **`R11.6`**: Generic Néron extension and contravariant maps on characters; exact character sequences only when an exact sequence of reduction tori is given. This does not prove exactness for an arbitrary old/new modular isogeny. *Needed by* [`R14.6/neron-hecke-extension`](#r14-6-neron-hecke-extension), [`R14.6/character-degeneracy-sequences`](#r14-6-character-degeneracy-sequences).

### SchemeAndStackFoundations

- **`SF.0`**: Invariance of connected components under extension of a separably algebraically closed base field (Stacks, Lemma 33.7.6, tag 0363), for schemes of finite type. *Needed by* [`R12.4/geometric-connectedness-field-extension`](#r12-4-geometric-connectedness-field-extension).
- **`SF.1`**: Algebraic stacks in groupoids with fppf descent, 2-fibre products, representable diagonals, inertia and the Deligne–Mumford criterion by unramified diagonal (packet nodes SF.1/algebraic-stack, SF.1/two-fibre-product, SF.1/deligne-mumford-stack, SF.1/inertia, SF.1/stack-fppf). No generalized elliptic structure is supplied here. *Needed by* [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve), [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions), [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin), [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions), [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli).
- **`SF.1`**: Étale-local structure of a separated Deligne–Mumford stack 𝒳 with finite inertia over its coarse space π:𝒳→X (Abramovich–Vistoli Lemma 2.2.3; Olsson 2006 Theorem 2.12): for a geometric point x̄ with stabiliser Γ there are an étale neighbourhood U of π(x̄) and a finite U-scheme V with a Γ-action such that 𝒳×_X U≅[V/Γ] and U=V/Γ; consequently the strictly henselian local ring of X at π(x̄), and its completion, are the Γ-invariants of those of 𝒳 at x̄. *Needed by* [`R13.4a/fibrewise-coarse-base-change`](#r13-4a-fibrewise-coarse-base-change), [`R13.4a/coarse-local-structure`](#r13-4a-coarse-local-structure), [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line).
- **`SF.1`**: Cohomology of quasi-coherent sheaves on an algebraic stack computed by a flat surjective representable cover P→𝒳 by a scheme: the descent (Čech) spectral sequence with E₁ terms the cohomology of the fibre powers of P over 𝒳. *Needed by* [`R13.4a/proper-rigidifying-covers`](#r13-4a-proper-rigidifying-covers).
- **`SF.2`**: Coherent restriction, flat base change and dualizing sheaves for proper flat nodal curves; torsion-free sections are determined on a schematically dense locus, including the formal-completion restriction when each component meets the boundary. *Needed by* [`R13.3/boundary-carriers-and-hodge-evaluation`](#r13-3-boundary-carriers-and-hodge-evaluation).
- **`SF.2`**: Coherent restriction, flat base change and dualizing sheaves for proper flat nodal curves; torsion-free sections are determined on a schematically dense locus, including the formal-completion restriction when each component meets the boundary. Additional consuming contract: Integrate the general finite-coefficient étale–Betti comparison with locally constant coefficients, compact support, traces and cup products required by accepted RS-06 as UPSTREAM:CohomologicalPointCounting:ComplexComparison:etale-Betti. Also supply finite-generation/Mittag–Leffler inverse-limit exactness and comparison to the pinned pro-étale EllAdicCohomology carrier. The checkout has no resolvable roadmap anchor for that RS-06 upstream label; do not substitute de Rham comparison. *Needed by* [`R14.1/coherent-hecke-trace`](#r14-1-coherent-hecke-trace), [`R14.3/integral-comparison`](#r14-3-integral-comparison).
- **`SF.3`**: For a finite morphism of smooth projective curves over a field of characteristic zero, the trace map on regular differentials (the coherent duality trace f_\*Ω¹_X→Ω¹_Y, compatible with the field trace on Kähler differentials of the function fields) and its compatibility with base change of the field. *Needed by* [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action).
- **`SF.4`**: Hilbert and Quot schemes of projective morphisms (SF.4/hilbert-scheme), for the tricanonical atlas of polygon-count stacks; Stein factorization of a proper morphism with geometrically connected fibres (SF.4/stein-factorization). *Needed by* [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions), [`R13.2/fixed-pairing-integral-components`](#r13-2-fixed-pairing-integral-components).
- **`SF.4/grothendieck-algebraization`**: Import the existing compatible proper thickenings with an ample invertible sheaf over a Noetherian complete ring and their effective polarized algebraization. SF.4/algebraization-of-subschemes-and-morphisms supplies full faithfulness for the resulting proper maps; uniqueness transports group actions and their identities. These exact targets exist in the SF.4 packet; cohomological Grothendieck existence alone is not the input. *Needed by* [`R13.3/generalized-tate-n-gon`](#r13-3-generalized-tate-n-gon), [`R13.3/tate-power-isogeny`](#r13-3-tate-power-isogeny).
- **`SF.5`**: Projection formula for proper pushforward and flat pullback of curve cycles on a product of proper curves; numerical degree of pullback along a finite curve map is its degree times the original degree. *Needed by* [`R14.1/projective-boundary-hecke-and-degree`](#r14-1-projective-boundary-hecke-and-degree).

### TauCetiRoadmap AlgebraicCurves

- **`layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`**: Use the anti-equivalence between function fields and regular projective curves (12C): generic finite maps extend uniquely and the normalization of a plane model is the regular projective model. *Needed by* [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action), [`R12.6/gamma-zero-rational-function-field`](#r12-6-gamma-zero-rational-function-field).

### TauCetiRoadmap AlgebraicTopology

- **`stage-2-relative-singular-chains-and-homology`**: Use current relative/twisted singular chains, functoriality and compactification-pair homology; the specific modular-symbol comparison and tree stabilizers remain here. *Needed by* [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology), [`R14.3/symbols-geometric-comparison`](#r14-3-symbols-geometric-comparison), [`R14.4/lyndon-exact-sequence`](#r14-4-lyndon-exact-sequence).
- **`stage-5-bundles-covers-products-and-finite-cover-descent`**: Use finite-cover/local-coefficient descent, transfer, Cartan–Leray and permutation coefficient systems; Shapiro itself is already pinned. Keep noninvertible deck orders and derived invariants explicit. *Needed by* [`R14.3/relative-coefficient-system`](#r14-3-relative-coefficient-system), [`R14.4/lyndon-exact-sequence`](#r14-4-lyndon-exact-sequence), [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover), [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness), [`R14.6/augmentation-control`](#r14-6-augmentation-control).
- **`stage-6-cohomology-products-and-manifold-duality`**: Use current cochains with local coefficients, relative/compact-support cohomology, cup product and Poincaré–Lefschetz duality with the chosen orientation; no new generic twisted cochain definition is planned. *Needed by* [`R14.3/weight-two-shimura-isomorphism`](#r14-3-weight-two-shimura-isomorphism), [`R14.3/cup-product-petersson`](#r14-3-cup-product-petersson), [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology), [`R14.3/boundary-exact-sequence`](#r14-3-boundary-exact-sequence), [`R14.3/integral-comparison`](#r14-3-integral-comparison), [`R14.3/parabolic-duality`](#r14-3-parabolic-duality), [`R14.3/localized-freeness`](#r14-3-localized-freeness), [`R14.3/symbols-geometric-comparison`](#r14-3-symbols-geometric-comparison), [`R14.4/lyndon-exact-sequence`](#r14-4-lyndon-exact-sequence), [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover), [`R14.6/taylor-wiles-freeness`](#r14-6-taylor-wiles-freeness).

### TauCetiRoadmap FuchsianOrbifolds

- **`layer-2-hyperbolic-polygons-and-cofinite-groups`**: Supply finite type of the torsion-free congruence quotient, its finite graph deformation retract and finitely generated free fundamental group, with the exact fine/auxiliary-level hypotheses. *Needed by* [`R14.3/localized-freeness`](#r14-3-localized-freeness), [`R14.6/taylor-wiles-cover`](#r14-6-taylor-wiles-cover).

### TauCetiRoadmap JacobianChallenge

- **`layer-d-the-relative-picard-functor-and-the-jacobian-scheme`**: Existing field-curve Picard/Jacobian scheme theorem with dimension, principal polarization and field-base change. Use it for each geometric fibre; the relative norm/polarization extension is requested separately from A0-extension/A2. *Needed by* [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality).
- **`layer-f-abeljacobi-and-the-universal-property`**: Use the supplied generic Abel–Jacobi morphism x↦[x−c], its cotangent/universal property and change-of-base-point formula; this part only specializes the modular rational cusp and quotient composite. *Needed by* [`R14.3/weight-two-tate-comparison`](#r14-3-weight-two-tate-comparison), [`R14.5/abel-jacobi-composite-nonzero`](#r14-5-abel-jacobi-composite-nonzero), [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi).

### TauCetiRoadmap ModularCurves

- **`0a-relative-effective-cartier-divisors`**: Use the existing relative effective Cartier divisors and their sums and base change. *Needed by* [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor).
- **`0a-relative-effective-cartier-divisors`**: Relative effective Cartier divisors and their pullback along flat morphisms. *Needed by* [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor).
- **`0b-finite-locally-free-group-schemes-and-cartier-duality`**: Use the existing finite locally free group-scheme, Cartier duality and subgroup carrier; polygon torsion/quotients specialize it. *Needed by* [`R13.1/neron-polygon-automorphisms`](#r13-1-neron-polygon-automorphisms), [`R13.1/finite-subgroup-quotients`](#r13-1-finite-subgroup-quotients), [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity).
- **`0c-finite-quotients-and-torsors`**: Use the existing finite quotients of affine schemes by finite locally free group actions and torsors. *Needed by* [`R13.1/finite-subgroup-quotients`](#r13-1-finite-subgroup-quotients).
- **`0c-finite-quotients-and-torsors`**: Finite group quotients of affine schemes and finite étale torsors. *Needed by* [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients), [`R13.4a/level-h-structures`](#r13-4a-level-h-structures).
- **`0d-finite-étale-schemes-and-galois-actions`**: Finite étale schemes, Galois actions and Galois descent of their points. *Needed by* [`R13.4a/coarse-rational-points`](#r13-4a-coarse-rational-points), [`R13.4a/level-h-structures`](#r13-4a-level-h-structures).
- **`0e-effective-descent-and-spreading-out`**: Use the existing effective descent (schemes, morphisms, sections, polarized curves, groups, level structures, torsors) and spreading out. It does not state invariance of connectedness under field extension; that is the SF.0 request. *Needed by* [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness), [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison), [`R12.4/twisted-geometric-irreducibility`](#r12-4-twisted-geometric-irreducibility), [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing), [`R12.5/perfect-hecke-pairing`](#r12-5-perfect-hecke-pairing), [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent), [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent), [`R12.6/complex-conjugation-comparison`](#r12-6-complex-conjugation-comparison), [`R12.6/generic-base-change-and-level-compatibility`](#r12-6-generic-base-change-and-level-compatibility), [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve), [`R13.1/non-smooth-locus-and-base-change`](#r13-1-non-smooth-locus-and-base-change), [`R13.1/deligne-rapoport-structure-criterion`](#r13-1-deligne-rapoport-structure-criterion), [`R13.1/finite-subgroup-quotients`](#r13-1-finite-subgroup-quotients), [`R13.1/formal-polygon-algebraization`](#r13-1-formal-polygon-algebraization), [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin), [`R13.2/coherent-cyclic-decontractions`](#r13-2-coherent-cyclic-decontractions), [`R13.2/fixed-pairing-integral-components`](#r13-2-fixed-pairing-integral-components).
- **`0e-effective-descent-and-spreading-out`**: Effective descent along étale coverings. *Needed by* [`R13.4a/twisted-coarse-curve`](#r13-4a-twisted-coarse-curve).
- **`1a-projective-weierstrass-models`**: Use the existing smooth projective Weierstrass curve with identity and projective-point dictionary. *Needed by* [`R12.1/lattice-weierstrass-model`](#r12-1-lattice-weierstrass-model), [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization).
- **`1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`**: Use the invariant-differential line, dx/(2y+a₁x+a₃), coordinate-change multiplier and Weierstrass differential identities. *Needed by* [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization), [`R12.1/homothety-and-isogeny-compatibility`](#r12-1-homothety-and-isogeny-compatibility), [`R12.1/invariant-differentials-and-periods`](#r12-1-invariant-differentials-and-periods), [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy).
- **`1d-the-scheme-theoretic-group-law`**: Use the algebraic pointed elliptic group scheme and its translation-invariant differential; ordinary group laws are not reconstructed here. *Needed by* [`R12.1/lattice-weierstrass-model`](#r12-1-lattice-weierstrass-model), [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization), [`R13.1/generalized-elliptic-curve`](#r13-1-generalized-elliptic-curve), [`R13.1/deligne-rapoport-structure-criterion`](#r13-1-deligne-rapoport-structure-criterion).
- **`2b-isogenies-and-quotients`**: Use algebraic isogenies, finite subgroup quotients and their dual/kernel/degree/base-change API. *Needed by* [`R12.1/homothety-and-isogeny-compatibility`](#r12-1-homothety-and-isogeny-compatibility), [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison), [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action), [`R13.1/finite-subgroup-quotients`](#r13-1-finite-subgroup-quotients).
- **`2b-isogenies-and-quotients`**: Quotients E→E/C of elliptic curves by finite locally free subgroups. *Needed by* [`R13.4a/cartan-level-curves`](#r13-4a-cartan-level-curves).
- **`2b-isogenies-and-quotients`**: Elliptic quotients by finite locally free subgroup schemes, the universal quotient isogeny and its degree; no new elliptic-curve or quotient carrier is defined here. *Needed by* [`R13.4a/modular-polynomial`](#r13-4a-modular-polynomial), [`R13.4a/split-cartan-quotient`](#r13-4a-split-cartan-quotient).
- **`2b-isogenies-and-quotients`**: Elliptic quotients by finite locally free subgroup schemes, the universal quotient isogeny and its degree; no new elliptic-curve or quotient carrier is defined here. *Needed by* [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence), [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution), [`R14.1/exact-divisor-atkin-lehner`](#r14-1-exact-divisor-atkin-lehner), [`R14.1/full-and-cyclic-correspondences`](#r14-1-full-and-cyclic-correspondences).
- **`2e-cartiernishi-duality-and-the-weil-pairing`**: Use the Silverman-convention scheme Weil pairing, nondegeneracy, functoriality and determinant identity; its current library implementation is already available. *Needed by* [`R12.1/analytic-algebraic-weil-pairing`](#r12-1-analytic-algebraic-weil-pairing), [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison), [`R12.3/cusp-fields-and-component-labels`](#r12-3-cusp-fields-and-component-labels), [`R13.2/fixed-pairing-integral-components`](#r13-2-fixed-pairing-integral-components).
- **`2e-cartiernishi-duality-and-the-weil-pairing`**: The Weil pairing e_N, alternating and perfect, with e_N((P,Q)g)=e_N(P,Q)^{det g}. *Needed by* [`R13.4a/coarse-cusps-away-from-the-level`](#r13-4a-coarse-cusps-away-from-the-level), [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure).
- **`2e-cartiernishi-duality-and-the-weil-pairing`**: Relative Weil pairing on elliptic torsion, alternating perfection and compatibility with an isogeny, including the multiplier equal to its degree. *Needed by* [`R13.4a/modular-polynomial`](#r13-4a-modular-polynomial).
- **`2e-cartiernishi-duality-and-the-weil-pairing`**: Relative Weil pairing on elliptic torsion, alternating perfection and compatibility with an isogeny, including the multiplier equal to its degree. *Needed by* [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution).
- **`2f-endomorphism-degree-trace-and-rigidity`**: Rigidity of elliptic curves with naive full level N≥3 structure over ℤ[1/N] (Katz–Mazur 2.7). *Needed by* [`R13.4a/fixed-pairing-coarse-curve`](#r13-4a-fixed-pairing-coarse-curve).
- **`3c-the-four-level-structures`**: Use the ordinary elliptic Drinfeld full, point and cyclic level definitions/full-set theorems. *Needed by* [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity), [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension), [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures), [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes).
- **`3d-comparison-with-naive-level-structures`**: Use prime-to-characteristic agreement with naive torsion labels and exact full/point level rigidity ranges. *Needed by* [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization), [`R12.2/stabilizers-and-small-levels`](#r12-2-stabilizers-and-small-levels), [`R13.2/small-level-and-dm-boundaries`](#r13-2-small-level-and-dm-boundaries).
- **`3d-comparison-with-naive-level-structures`**: Comparison of Drinfeld and naive level structures after inverting N. *Needed by* [`R13.4a/standard-level-stack-identifications`](#r13-4a-standard-level-stack-identifications).
- **`3n-naive-level-structures`**: Naive level structures and the finite étale N-torsion over ℤ[1/N]. *Needed by* [`R13.4a/level-h-structures`](#r13-4a-level-h-structures).
- **`5a-tate-normal-form-and-y₁n-for-n4`**: Use fine open Y₁(N) over Z[1/N] for N≥4 and its moduli/universal-object interface. *Needed by* [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization), [`R12.2/stabilizers-and-small-levels`](#r12-2-stabilizers-and-small-levels).
- **`5a-tate-normal-form-and-y₁n-for-n4`**: Y₁(N) for N≥4 over ℤ[1/N] via Tate normal form. *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification).
- **`5b-full-ordered-bases-and-fixed-pairing`**: Use the ordinary full ordered-basis moduli, cyclotomic determinant fibre and fine fixed-pairing scheme for N≥3; do not assume connectedness before R12.4. *Needed by* [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization), [`R12.2/stabilizers-and-small-levels`](#r12-2-stabilizers-and-small-levels), [`R12.4/geometric-connectedness-field-extension`](#r12-4-geometric-connectedness-field-extension), [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness), [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison), [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent), [`R13.2/fixed-pairing-integral-components`](#r13-2-fixed-pairing-integral-components).
- **`5b-full-ordered-bases-and-fixed-pairing`**: Y_full(N) for N≥3 over ℤ[1/N], its determinant to μ_N^{prim} and the fibres Y(N,ζ). *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification), [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure), [`R13.4a/fixed-pairing-coarse-curve`](#r13-4a-fixed-pairing-coarse-curve), [`R13.4a/level-h-structures`](#r13-4a-level-h-structures).
- **`5c-the-twisted-curve-yρ`**: Use the paired finite-module symplectic-frame twist Y(ρ), its smooth finite-type quotient/descent, and its conditional geometric-irreducibility theorem. Its three missing comparison contracts are discharged separately in R12.4. *Needed by* [`R12.4/geometric-connectedness-field-extension`](#r12-4-geometric-connectedness-field-extension), [`R12.4/fixed-pairing-geometric-connectedness`](#r12-4-fixed-pairing-geometric-connectedness), [`R12.4/twisted-analytic-comparison`](#r12-4-twisted-analytic-comparison), [`R12.4/twisted-geometric-irreducibility`](#r12-4-twisted-geometric-irreducibility), [`R12.6/canonical-generic-fibre-descent`](#r12-6-canonical-generic-fibre-descent), [`R12.6/component-fields-and-twisted-descent`](#r12-6-component-fields-and-twisted-descent).
- **`5c-the-twisted-curve-yρ`**: The twisted curve Y(ρ)/ℚ for N≥3 and a symplectic Galois module V_ρ. *Needed by* [`R13.4a/twisted-coarse-curve`](#r13-4a-twisted-coarse-curve).
- **`7b-local-algebra-and-local-schemes`**: Use the existing Katz–Mazur ordinary local/deformation-ring and regularity statements at bad primes, with their stated hypotheses; the private Chapter 5 input has this owner. *Needed by* [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension), [`R13.2/moduli-stacks-are-proper-flat-artin`](#r13-2-moduli-stacks-are-proper-flat-artin), [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes).
- **`7e-p-divisible-groups`**: Import the existing elliptic PD-3 target: relative Frobenius and Verschiebung in characteristic p with V∘F=[p]=F∘V, together with the PD-1 finite locally free torsion levels and Cartier duality from Layer 2E. Quotients remain the existing Layer 2B interface; these elliptic notions are not new A3 definitions. Additional consuming contract: for the ordinary-locus proof of the special-fibre Eichler–Shimura relation (Conrad, Theorem 5.16), use PD-2 (connected–étale sequence over a henselian local base, giving the connected and étale order-p subgroups of an ordinary curve and of its lifts) and PD-5 (the ordinary/supersingular dichotomy). *Needed by* [`R13.5/igusa-components`](#r13-5-igusa-components), [`R14.6/special-fibre-eichler-shimura`](#r14-6-special-fibre-eichler-shimura).
- **`7f-serretate-theory-with-level-structure`**: The universal ordinary elliptic deformation with Serre–Tate parameter and the supersingular one-dimensional deformation, including Frobenius/Verschiebung torsion and Drinfeld-generator conditions. The exact current ModularCurves Layer 7F–7H and Layer 8C outputs are imported, not re-planned. *Needed by* [`R13.5/igusa-components`](#r13-5-igusa-components).
- **`7g-the-three-characteristic-p-calculations`**: Deformations of elliptic isogenies and their finite-flat kernels on the universal deformation ring; preserve inseparable cases and the chosen source/target local moduli. *Needed by* [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model).
- **`8b-generator-schemes-and-the-cyclicity-theorem`**: Use generator schemes, finite locally free rank φ(N), cyclicity and standard subgroup/quotient identities on ordinary elliptic curves. *Needed by* [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity), [`R13.1/torsion-congruences-and-level-extension`](#r13-1-torsion-congruences-and-level-extension).
- **`8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63`**: Import the actual cyclic-generator comparison and its supersingular deformation rings; combine with Layer 7F–7H and the existing rigidifier/representability package. The mixed-level node supplies only the modular one-factor component calculation. *Needed by* [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model).
- **`8d-the-cyclicity-locus-and-γ₀n`**: Use the ordinary cyclicity locus and Y₀(N) level functor; boundary extension is R13.1/R13.2. *Needed by* [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action), [`R13.1/drinfeld-structures-and-cyclicity`](#r13-1-drinfeld-structures-and-cyclicity), [`R13.2/gamma-level-structures`](#r13-2-gamma-level-structures), [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli), [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes).
- **`8d-the-cyclicity-locus-and-γ₀n`**: The cyclicity locus and the integral problem [Γ₀(N)]. *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification).
- **`9a-katzmazur-quotient-problems`**: Katz–Mazur quotient problems [Γ(n)]/H̄ over ℤ with Q1–Q2, and after inverting n their identification with the fppf sheaf quotient of the naive full-level problem. *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification), [`R13.4a/coarse-level-quotients`](#r13-4a-coarse-level-quotients), [`R13.4a/level-h-structures`](#r13-4a-level-h-structures).
- **`9b-the-standard-quotient-problems`**: Use row action (P,Q)γ=(aP+cQ,bP+dQ) and exact full-to-point-to-cyclic quotient identifications; upper triangular labels act on P by a=d⁻¹. *Needed by* [`R12.2/level-map-and-diamond-comparison`](#r12-2-level-map-and-diamond-comparison), [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels).
- **`9b-the-standard-quotient-problems`**: The seven standard quotient identifications of Katz–Mazur 7.4.2 in the row-vector convention, in particular [Γ₁(N)] and [Γ₀(N)] as quotients of [Γ(N)], and the diamond action P↦aP. *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification), [`R13.4a/level-subgroups`](#r13-4a-level-subgroups), [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement).
- **`9d-coarse-moduli-schemes-and-finite-quotients`**: Use finite group quotients and coarse moduli universal properties, preserving stack inertia versus coarse objects. *Needed by* [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization), [`R12.2/stabilizers-and-small-levels`](#r12-2-stabilizers-and-small-levels), [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action), [`R13.2/agreement-with-katz-mazur-schemes`](#r13-2-agreement-with-katz-mazur-schemes).
- **`9d-coarse-moduli-schemes-and-finite-quotients`**: Coarse moduli schemes M(𝒫) of affine moduli problems with M(𝒫)/H≅M(𝒫/H) (Katz–Mazur 8.1.5), base change 8.1.6, and the smoothness of finite quotients of smooth affine relative curves. *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification), [`R13.4a/atkin-lehner-quotient-curves`](#r13-4a-atkin-lehner-quotient-curves), [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement).
- **`9d-coarse-moduli-schemes-and-finite-quotients`**: The KM affine coarse quotient of the supplied relatively representable affine level problem, its classifying map, normality and categorical universal property. *Needed by* [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons).
- **`9e-the-coarse-j-line-and-y₀n`**: Use the ordinary coarse j-line/Y₀(N) schemes and their source/quotient-invariant maps. *Needed by* [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization).
- **`9e-the-coarse-j-line-and-y₀n`**: The coarse j-line Spec ℤ[j] over ℤ and over every ring (coarseJLine_int, coarseJLine), and M([Γ₀(N)])⊗ℤ[1/N]≅Y_full(N)/B for N≥3. *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification), [`R13.4a/compactified-coarse-j-line`](#r13-4a-compactified-coarse-j-line).
- **`layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`**: Use only the existing prime N≥5, Z[1/N] compact diamond-quotient coarse curve, its cusp/covering interface and its stated base; no composite/bad-level extension is inferred. *Needed by* [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization).
- **`layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`**: The prime N≥5 diamond quotients X_H over ℤ[1/N] as normalizations of ℙ¹_j in Y₁(N)/H with their cusp divisor; R13.4a proves agreement and builds nothing again on this class. *Needed by* [`R13.4a/coarse-degree-and-cusp-divisor`](#r13-4a-coarse-degree-and-cusp-divisor), [`R13.4a/prime-diamond-agreement`](#r13-4a-prime-diamond-agreement).
- **`layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`**: Import the prime N≥5 diamond quotient cusp package over ℤ[1/N]: Tate torsion/level covers, integral closures, cusp labels, widths, characteristic-2/3 ramification and stabilizers; establish identity-compatible agreement rather than rebuilding it. *Needed by* [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts), [`R13.4a/coarse-normalization-comparisons`](#r13-4a-coarse-normalization-comparisons).
- **`layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`**: Import the prime N≥5 diamond quotient cusp package over ℤ[1/N]: Tate torsion/level covers, integral closures, cusp labels, widths, characteristic-2/3 ramification and stabilizers; establish identity-compatible agreement rather than rebuilding it. *Needed by* [`R14.1/atkin-lehner-involution`](#r14-1-atkin-lehner-involution), [`R14.1/exact-divisor-atkin-lehner`](#r14-1-exact-divisor-atkin-lehner).
- **`layer-6-the-three-elementary-integral-level-problems`**: The integral level problems [Γ(N)], [Γ₁(N)] and balanced [Γ₁(N)] over ℤ. *Needed by* [`R13.4a/affine-open-identification`](#r13-4a-affine-open-identification).

### TauCetiRoadmap ModularForms

- **`10a--the-analytic-modular-curve`**: Use the analytic congruence quotient and compactification, effective cusp widths, local finite stabilizer charts, branched maps and orbit/genus input. *Needed by* [`R12.2/open-level-uniformization`](#r12-2-open-level-uniformization), [`R12.2/stabilizers-and-small-levels`](#r12-2-stabilizers-and-small-levels), [`R12.2/projective-prime-level-application`](#r12-2-projective-prime-level-application), [`R12.3/compact-modular-uniformization`](#r12-3-compact-modular-uniformization), [`R12.3/tate-and-cusp-parameter-agreement`](#r12-3-tate-and-cusp-parameter-agreement), [`R12.3/cusp-ramification-and-level-maps`](#r12-3-cusp-ramification-and-level-maps), [`R13.2/contraction-maps-between-levels`](#r13-2-contraction-maps-between-levels).
- **`10b--compact-riemann-surface-cohomology`**: Use compact Riemann-surface integral homology, bilinear period relation/positivity, canonical cohomology and the genus computation; no new genus formula is planned. *Needed by* [`R12.1/pointed-elliptic-uniformization`](#r12-1-pointed-elliptic-uniformization), [`R12.1/invariant-differentials-and-periods`](#r12-1-invariant-differentials-and-periods), [`R12.2/projective-prime-level-application`](#r12-2-projective-prime-level-application), [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials).
- **`10c--modular-forms-as-section-spaces-and-the-dimension-formulas`**: Use modular/cusp-form spaces as equivariant automorphy-line sections and the weight-two canonical differential dictionary, including finite stabilizer invariance. *Needed by* [`R12.5/hodge-line-automorphy`](#r12-5-hodge-line-automorphy), [`R12.5/weight-two-regular-differentials`](#r12-5-weight-two-regular-differentials).
- **`layer-2-hecke-operators-and-the-hecke-algebra`**: Use the native analytic full Hecke algebra/slash operators, commutativity, span/product relations and composite coefficient theorem including bad-prime blocks; retain the anchor’s normalization and character conventions. *Needed by* [`R12.5/characteristic-zero-hecke-action`](#r12-5-characteristic-zero-hecke-action), [`R12.5/hecke-normalization-comparison`](#r12-5-hecke-normalization-comparison), [`R12.5/first-coefficient-hecke-pairing`](#r12-5-first-coefficient-hecke-pairing), [`R12.5/perfect-hecke-pairing`](#r12-5-perfect-hecke-pairing).
- **`layer-2-hecke-operators-and-the-hecke-algebra`**: Existing double-coset Hecke algebra/action and its full-subgroup multiplication convention; this part realizes those relations on the actual integral modular correspondence. *Needed by* [`R14.1/composition-relations-of-correspondences`](#r14-1-composition-relations-of-correspondences), [`R14.1/analytic-comparison-of-correspondences`](#r14-1-analytic-comparison-of-correspondences), [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra).
- **`layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`**: Existing abstract Hecke/diamond relations and bad-prime U convention; import, never build another abstract Hecke algebra. *Needed by* [`R14.1/composition-relations-of-correspondences`](#r14-1-composition-relations-of-correspondences).
- **`layer-4-eigenforms-newforms-primitive-forms-the-conductor`**: Use the current all-degeneracy-map oldspace span and primitive conductor/newform input; for f of conductor N at level M count the copies indexed by d|M/N, retaining arbitrary linear combinations. *Needed by* [`R14.3/betti-free-rank-two`](#r14-3-betti-free-rank-two), [`R14.5/newform-hecke-prime`](#r14-5-newform-hecke-prime), [`R14.5/oldform-comparison`](#r14-5-oldform-comparison).
- **`layer-5-strong-multiplicity-one-and-the-eigenform-characterization`**: Use the current strong multiplicity-one/eigenform characterization to identify the primitive simple factor independently of the ambient old level; no new analytic multiplicity-one proof is planned. *Needed by* [`R14.3/betti-free-rank-two`](#r14-3-betti-free-rank-two), [`R14.5/oldform-comparison`](#r14-5-oldform-comparison).
- **`layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`**: Import the existing integral symbol module 𝕄_N,k, its boundary map, diamond/bad-prime action, and the period-induced quotient onto the form-side Hecke image. Layer 8 proves ker(eval_𝕄)⊆ker(eval_S), not equality. The compact-curve/Jacobian image is compared only after the separate local R14.2 integral cuspidal-symbol contract recorded as a gap; no existing integral Betti isomorphism is attributed to Layer 8. Additional consuming contract: Import the integral homological symbol lattice, Manin presentation, cuspidal boundary map, period functional into the dual of symbols, integral finite Hecke algebra and eigenvalue field; comparison to actual geometric cohomology is new here. *Needed by* [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra), [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison), [`R14.3/betti-free-rank-two`](#r14-3-betti-free-rank-two), [`R14.3/geometric-hecke-coefficients`](#r14-3-geometric-hecke-coefficients), [`R14.3/symbols-geometric-comparison`](#r14-3-symbols-geometric-comparison), [`R14.5/newform-hecke-prime`](#r14-5-newform-hecke-prime).
- **`layer-8g-galois-stability-the-character-field-and-rationality`**: Use the current coefficient-field and Galois-conjugate rationality statements to descend the weight-two differential block and its Hecke ideal. *Needed by* [`R14.5/newform-hecke-prime`](#r14-5-newform-hecke-prime), [`R14.5/modular-quotient-differentials`](#r14-5-modular-quotient-differentials), [`R14.5/oldform-comparison`](#r14-5-oldform-comparison).

### TauCetiRoadmap StableReduction

- **`layer-1-nodes-normalization-and-dual-graphs`**: Use the existing at-worst-nodal relative curves, Fitting-ideal singular locus, normalization exact sequence, dual graph and arithmetic-genus formula. *Needed by* [`R13.1/semistable-genus-one-curves-and-neron-polygons`](#r13-1-semistable-genus-one-curves-and-neron-polygons), [`R13.1/non-smooth-locus-and-base-change`](#r13-1-non-smooth-locus-and-base-change).
- **`layer-1-nodes-normalization-and-dual-graphs`**: Existing dual multigraph of a proper nodal curve with loops, multiple edges, arithmetic genus Σ g_v+b₁ and the branch data; import rather than define a second graph carrier. *Needed by* [`R13.5/split-cartan-semistable-model`](#r13-5-split-cartan-semistable-model), [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs).
- **`layer-2-coherent-curve-theory-duality-and-positivity`**: Use the existing relative dualizing sheaf of nodal curves with its componentwise degree formula, Cartier divisors from smooth sections, ampleness criterion, relative Proj, cohomology and base change and contraction descent. *Needed by* [`R13.1/semistable-genus-one-curves-and-neron-polygons`](#r13-1-semistable-genus-one-curves-and-neron-polygons), [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor), [`R13.1/deligne-rapoport-structure-criterion`](#r13-1-deligne-rapoport-structure-criterion), [`R13.1/finite-subgroup-quotients`](#r13-1-finite-subgroup-quotients), [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions).
- **`layer-3-prestable-semistable-stable-and-pointed-curves`**: Use the existing prestable/semistable pointed families and the single-marking contraction primitive by relative Proj of a section algebra. *Needed by* [`R13.1/semistable-genus-one-curves-and-neron-polygons`](#r13-1-semistable-genus-one-curves-and-neron-polygons), [`R13.1/contraction-away-from-a-divisor`](#r13-1-contraction-away-from-a-divisor), [`R13.1/polygon-count-stacks-and-decontractions`](#r13-1-polygon-count-stacks-and-decontractions).
- **`layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`**: Existing arithmetic-surface blowups, total transforms, exceptional self-intersection, contractions of admissible −1 curves, regular resolutions and compatibility with flat base change. This part adds only the modular input rings and stabilizer actions. *Needed by* [`R13.5/tame-regular-resolution`](#r13-5-tame-regular-resolution), [`R13.5/split-cartan-thirteen-good-reduction`](#r13-5-split-cartan-thirteen-good-reduction).
- **`layer-7-semistable-reduction`**: Import the existing semistable-reduction existence theorem with identified generic fibre. Canonical contraction to the unpointed stable model is a separate Layer 8 input, for genus at least two. *Needed by* [`R13.5/prime-square-semistable-model`](#r13-5-prime-square-semistable-model).
- **`layer-8-canonical-contraction-and-unpointed-stable-reduction`**: Import the canonical contraction of a proper prestable family of genus g≥2, its uniqueness and coherent arbitrary base change. For marked stability use Layer 9 with 2g−2+r>0 instead; do not attribute stabilization to Layer 7. *Needed by* [`R13.5/prime-square-semistable-model`](#r13-5-prime-square-semistable-model).

<a id="open-obligations"></a>

## Open proof obligations

These are the inputs the plan has not yet reduced to a target here or a supplier's target. Each consuming target states its result conditionally on them, or restricts its range, and no theorem below is used outside the range these obligations allow.

### Wild coarse bad-level interior models at 2 and 3

The required arbitrary-N Γ₀(pⁿM) component/multiplicity target and R20 cases include p=2,3. Edixhoven’s exact interior invariant-ring/minimal-resolution formulas are proved for p>3. Česnavičius gives all-prime coarse cusp regularity and regularity away from exceptional interior j-values, not the missing wild local equations. Required calculation: use imported cyclic deformation rings, compute the actual finite stabilizer action at level-dividing 2 or 3 (including infinitesimal inertia), identify normal invariant completions and their multiplicities, resolve and export branch/thickness maps. A tame order-2/3 eigencharacter argument is insufficient. The fine rigidified one-p-factor uv=p model is separated from this coarse descent gap.

*Needed by* [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model), [`R13.5/tame-regular-resolution`](#r13-5-tame-regular-resolution), [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model), [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs), [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components).

### Relative curve norm and principal polarization contract

JacobianChallenge D proves the field curve Jacobian. A0-extension supplies relative Picard space, lifting and a neutral-component criterion; it does not by itself supply the curve-specific relative canonical principal polarization/norm theorem over ℤ[1/N]. The request to A0-extension and AbelianSchemes A2 names this exact additional comparison. No fictional relative Jacobian carrier or field-only-to-relative inference is made.

*Needed by* [`R14.2/jacobian-and-functoriality`](#r14-2-jacobian-and-functoriality), [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian), [`R14.2/integral-hecke-algebra`](#r14-2-integral-hecke-algebra), [`R14.2/tate-module-with-galois-and-hecke-actions`](#r14-2-tate-module-with-galois-and-hecke-actions).

### Integral cuspidal-symbol realization contract

Current ModularForms Layer 8 constructs the full Γ₁-coinvariant module Div⁰(P¹(ℚ))⊗Sym and a Hecke-equivariant period quotient onto the form-side image. It explicitly does not require an isomorphism of its whole module with S_k⊕conj(S_k); boundary/Eisenstein classes and integral torsion must be handled. The local R14.2 comparison target must construct the weight-two cuspidal boundary kernel modulo torsion and identify its integral Hecke action with compact-curve H₁, or the appropriately transposed dual H¹, retaining all diamond and bad-prime conventions. Determine exact kernels at the integral level, rather than inferring them from rational dimensions or period injectivity on forms. The J/Betti/Tate comparison remains separate and justified.

*Needed by* [`R14.2/integral-hecke-realization-comparison`](#r14-2-integral-hecke-realization-comparison).

### Integral higher-weight boundary and lattice range

Deligne supplies rational Sym^r cohomology. Prove the exact good-prime Hecke eigensystems on H⁰ and cusp inertia cohomology for Sym^r integral coefficients; specify residual ideals where they vanish and where reduction and saturated parabolic comparison hold. For ℓ≤r symmetrization need not be perfect: choose a divided-power/dual lattice with a sourced comparison or retain a weaker pairing. The present conditional theorem does not claim unconditional integral freeness or perfectness in that range. The symbol comparison must identify the standard representation with the dual geometric relative-H¹ coefficient system, including determinant twists, and prove the Manin/geodesic relative-chain presentation on B. Deligne and the rational even-weight boundary model do not by themselves establish this integral identification.

*Needed by* [`R14.3/parabolic-duality`](#r14-3-parabolic-duality), [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein), [`R14.3/localized-freeness`](#r14-3-localized-freeness), [`R14.3/symbols-geometric-comparison`](#r14-3-symbols-geometric-comparison).

### Deep input to the S-arithmetic congruence kernel theorem

Serre 1970 §2.6 gives the correct real-place specialization, but its proof depends on central Mennicke-symbol/congruence-kernel calculations and the Moore/class-field-theory input. Those intermediate theorems have not been decomposed against the baseline. A follow-up must supply that exact proof chain; an unrelated profinite arithmetic action theorem cannot replace it.

*Needed by* [`R14.4/congruence-subgroup-property`](#r14-4-congruence-subgroup-property).

### Tree fundamental edge and enhanced congruence-character proof

The lattice tree of SL₂(ℚ_p), its type-preserving action without inversion and the local amalgam are imported from ReductiveGroupsPartII RG2.2/sl2-tree and RG2.2/ihara-amalgam, and strong approximation with reduction surjectivity prime to p from AdelicAlgebraicGroups AA.4/strong-approximation-sufficiency and AA.4/strong-approximation-finite-places (dependencyAdditions). Still missing for modular-amalgam: Serre’s theorem that a group acting on a tree without inversion with a segment as fundamental domain is the amalgam of the two vertex stabilizers over the edge stabilizer (Trees I §4.1 Theorem 6, p. 48), which ReductiveGroupsPartII uses inside the proof of ihara-amalgam but does not state as a target, and the finite congruence-quotient sublemmas of the principal-level argument. Refine the CDT Corollary 4.5.3 conjugation-invariance criterion against existing finite-group APIs. This is a proof-chain gap, not permission to erase the congruence subspace from ordinary Ihara. For congruence-invariance, supply the exact continuous-cohomology, Künneth and Hochschild–Serre proof interfaces, Lazard’s uniform-group calculation, adjoint-cohomology vanishing, and a reproducible proof of the level-8/16 computations used in CDT §4.5.11. These source inputs are not declarations established by the pinned ordinary H¹ carrier.

*Needed by* [`R14.4/modular-amalgam`](#r14-4-modular-amalgam), [`R14.4/enhanced-ihara`](#r14-4-enhanced-ihara), [`R14.4/congruence-invariance`](#r14-4-congruence-invariance).

### Integral modular old/new and quaternionic pivot exactness

Ribet–Stein §3.10.2 equation (3.2), p. 48 involves a quaternionic Shimura-curve Jacobian J′\_{pq}(K). The exact sequence 0→X_p(J′\_{pq}(K))→X_q(J(K,pq))→X_q(J(K,q))²→0 needs the specific Cerednik–Drinfeld identification and integral Hecke-compatible maps. Generic Néron functoriality and a rational old/new isogeny do not establish this integral sequence. Keep the conditional torus theorem here; arrange a lower-tier geometric interface before the higher Hilbert/Shimura-curve roadmap consumes it, or explicitly narrow the requested consumer. Retain finite cokernels and component groups until that proof is supplied.

*Needed by* [`R14.6/character-degeneracy-sequences`](#r14-6-character-degeneracy-sequences).

### Extensions of the exact Ihara consumer range

The compact constant-coefficient Γ₁(N) result includes ℓ|N on characteristic-zero curves and has no exceptional residual-image hypothesis. It does not by itself prove level lowering, nor a uniform Sym^r/coarse Γ₀(N) or characteristic-ℓ fibre result. R20/R22 must use the stated fine/mixed-level weight-two prefix, or specify a sourced further injectivity theorem with its stabilizer, coefficient and exceptional-image hypotheses; Γ₀(N) has a Shimura-subgroup kernel.

*Needed by* [`R14.4/compact-ihara`](#r14-4-compact-ihara), [`R14.4/taylor-wiles-root-control`](#r14-4-taylor-wiles-root-control).

### Integrate existing post-pin diamond group-ring algebra

The current Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 implements TauCeti.MonoidAlgebra.isLocalRing_of_isPGroup and isLocalHom_lift_one_of_isPGroup in TauCeti/Algebra/MonoidAlgebra/LocalRing.lean, with augmentation and ker_augmentation_eq_span in Exactness.lean. They are absent at f790474. Import the existing implementation when updating the baseline; do not plan or prove a duplicate. The pinned prototype does not import that post-pin module.

*Needed by* [`R14.6/diamond-group-ring-local`](#r14-6-diamond-group-ring-local).

<a id="bad-level-cases"></a>

## The finite list of bad-level cases

R13.5 and R13.6 plan exactly the bad fibres that the level-lowering and intersection arguments of other roadmaps invoke. The list is finite and each entry names the targets that supply its geometry.

| Case | Geometry | Consumer |
| --- | --- | --- |
| Good p∤N ordinary/supersingular Γ₁ level | [`R13.5/igusa-components`](#r13-5-igusa-components); [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model); [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components) | R20 Serre weight inputs via Igusa/Frobenius; prime-to-p auxiliary rigidifier when the level is small. |
| Γ₁(M)∩Γ₀(p), p∤M; M may contain arbitrary ℓ-powers | [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs); [`R13.6/modular-character-group-interface`](#r13-6-modular-character-group-interface); [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components) | R20 Mazur principle and trivial-character Γ₀(Mp) level lowering: p≠ℓ, ℓ odd, with their respective residual hypotheses. Includes p=2,3: fine geometry is separated from the recorded coarse wild descent gap. |
| Γ₀(pⁿM), arbitrary n≥1, p∤M | [`R13.3/gamma-zero-prime-power-cusp-rings`](#r13-3-gamma-zero-prime-power-cusp-rings); [`R13.5/gamma-zero-prime-power-local-model`](#r13-5-gamma-zero-prime-power-local-model); [`R13.5/corrected-coarse-singular-locus`](#r13-5-corrected-coarse-singular-locus); [`R13.5/tame-regular-resolution`](#r13-5-tame-regular-resolution) | Gross–Zagier integral intersection model, all N. For p>3 the minimal regular modular algorithm is explicit; p=2,3 wild interior resolution remains a gap. |
| Two added primes p,q, pq∤M | [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model); [`R13.6/degeneracy-on-components`](#r13-6-degeneracy-on-components); [`R13.6/modular-character-group-interface`](#r13-6-modular-character-group-interface) | R20 character-group/Jacobian oldspace matrices; the common lower geometry is imported once, while R20 owns the exact sequence and level-lowering theorem. |
| Residual characteristic 2, M odd or 2∥M, p odd and p∤M | [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model); [`R13.6/modular-dual-graphs`](#r13-6-modular-dual-graphs); [`R13.6/modular-character-group-interface`](#r13-6-modular-character-group-interface) | Buzzard/R20 mod-2 level lowering. Includes p=3 and hence does not silently omit the coarse wild quotient. |
| Γ₀(p²M), p>3 and split Cartan ℓ=12k+1 | [`R13.5/prime-square-semistable-model`](#r13-5-prime-square-semistable-model); [`R13.5/split-cartan-semistable-model`](#r13-5-split-cartan-semistable-model); [`R13.5/split-cartan-thirteen-good-reduction`](#r13-5-split-cartan-thirteen-good-reduction) | The explicit ramified nodal extension and BDMTV NC.5 use. No pⁿ,n>2 stable-model formula is inferred from the p² calculation. |

### Papers and where their mathematics is planned

| Paper | Planned here |
| --- | --- |
| Bakker–Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields* (Ann. Math. 2016) | The projective-frame quotient, its components and effective stabilizers (R12.2, R13.4a/projective-scalar-coarse-quotient); cusp inertia and fields (R12.3); pairing components and twists (R12.4); polygon automorphisms and boundary moduli (R13.1, R13.2); the cyclic versus full-subgroup correspondence degrees (R12.5, R14.1); boundary Hecke cycles and their numerical degree (R14.1/projective-boundary-hecke-and-degree). |
| Gross–Zagier, *Heegner points and derivatives of L-series* (Invent. Math. 1986) | ℚ(X₀(N))=ℚ(j,j′) and the rational cusps (R12.6, R12.3); the full rational weight-two Hecke image and the perfect first-coefficient pairing (R12.5); the integral X₀(N) and its local rings (R13.4a); the corrected singular locus and regular models of the bad fibres (R13.5); Atkin–Lehner involutions and integral correspondences (R14.1); faithfulness on the Jacobian (R14.2). |
| Masser–Zannier, *Abelian varieties isogenous to no Jacobian* (Ann. Math. 2020) | The cyclic modular polynomial and its degree (R13.4a/modular-polynomial); the CM congruences are ComplexMultiplicationAndExplicitReciprocity's. |
| Balakrishnan–Dogra–Müller–Tuitman–Vonk, *Explicit Chabauty–Kim for the split Cartan modular curve of level 13* (Ann. Math. 2019) | Cartan level curves and the rational-point criterion (R13.4a); X₀(ℓ²)/w_{ℓ²} as the normalizer curve (R13.4a/split-cartan-quotient); the semistable model at ℓ and good reduction of X_s(13) away from 13, including at 2 (R13.5). Local heights are AnabelianGeometryAndNonabelianChabauty's. |
| Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method* (Invent. Math. 2018) | The auxiliary levels X₁(N;Q), the covers X_Δ(Q)→X₀(Q) and their quotients (R13.4a); distinct-root control (R14.4/taylor-wiles-root-control). |
| Calegari–Dimitrov–Tang, *The unbounded denominators conjecture* (J. Amer. Math. Soc. 2025) | Principal-level Ihara modulo congruence classes, the enhanced kernel bound and congruence invariance (R14.4). |
| Conrad, *The Shimura construction in weight 2* (appendix to Ribet–Stein) | The weight-two Eichler–Shimura isomorphism, the Petersson and Weil pairings, rank two, A_f and its dimension, and the special-fibre Eichler–Shimura relation (R14.3, R14.5, R14.6). |

<a id="source-corrections"></a>

## Corrections to the sources

Reading the sources for this roadmap found the following mistakes. Each is stated in our own words at its locator, with the correction the targets above use and whether a published correction already exists. The identifiers are those of the source-issue register (ModularCurvesPartII/E…); a node that says "corrected as E106" refers to the entry of that number below.

### E1 (misprint, affects nothing)

**Where.** Lemma 9.6 proof, arXiv author preprint p. 88; author-hosted Springer-layout PDF p. 120

**What it says, in our words.** For the matrix with diagonal entries q+1 and off-diagonal entries T_q, the displayed determinant is T_q²−(q+1)².

**Correction.** The determinant is (q+1)²−T_q². The two expressions differ by −1, a unit, so their invertibility tests agree.

**Why.** The 2×2 determinant formula gives a²−b²; at T_q=0 the determinant equals (q+1)².

**Existing correction.** Present in both author copies read. The publisher lists a 2021 correction but its text was unavailable; confirmation against that correction is requested, and no novelty claim is made.

### E2 (misprint, affects the proof)

**Where.** Lemma 9.6 proof, arXiv author preprint p. 89; author-hosted Springer-layout PDF p. 122

**What it says, in our words.** The displayed Lyndon segment places H^{i−1}(G) directly before H^i(Γ)²→H^i(H).

**Correction.** The segment is H^i(G)→H^i(Γ)²→H^i(H)→H^{i+1}(G), with the two subgroup restrictions and their difference.

**Why.** Serre Trees II §2.8 Proposition 13, pp. 168–170, or the long exact sequence of the tree cochain short exact sequence, fixes the degrees. Degree-zero invariants already require H⁰(G) before H⁰(Γ)².

**Existing correction.** Present in both author copies read. The publisher lists a 2021 correction but its text was unavailable; confirmation against that correction is requested, and no novelty claim is made.

### E3 (misprint, affects a stated result)

**Where.** Lemma 4.5.11, second displayed invariant dimension and ensuing semisimplification claim: author preprint p. 31; published JAMS offprint p. 663, proof p. 664 and application pp. 664–665

**What it says, in our words.** The level-5 term uses F₃ coefficients and claims zero SL₂(F₅)-invariants, also after semisimplification.

**Correction.** Use F₅ in the level-5 term, as the proof of Theorem 4.5.2 requires when ℓ=5. Keep F₃ at level 3 and F₂ at levels 4/8/16. The printed level-5/F₃ invariant-vanishing assertion cannot be exported.

**Why.** X(5) has genus zero and 12 cusps. Its ordinary H¹ with F₃ coefficients identifies through residues with the kernel of the total-sum map F₃^{12}→F₃. The constant vector is a nonzero SL₂(F₅)-invariant vector in that kernel because 12=0 in F₃. Thus the printed zero dimension is false. With F₅, this counterexample disappears and the stated level-5 Brauer-character calculation supplies the case used in Theorem 4.5.2.

**Existing correction.** Present in the author preprint and published offprint read. No correction was found in the publisher or author listings searched; novelty remains unconfirmed. The intended coefficient is determined by the proof’s ℓ=5 application.

### E101 (error, affects a stated result)

**Where.** Author copy, §2.1, p.5, paragraph introducing the standard 1-gon (after Lemma 2.1.3)

**What it says, in our words.** The standard 1-gon over Z is identified with the plane cubic y²z=x³−x²z through the parametrization t↦(t²+1,t(t²+1)).

**Correction.** Use the split nodal model y²z+xyz=x³, with distinct normalization node preimages in every characteristic.

**Why.** The asserted model has tangent cone y²+x² and is not split over Z; in characteristic two the tangent cone is a repeated line. The printed parametrization glues t=±i, not 0 and ∞, so it does not factor through the 1-gon over Z. The replacement has tangent cone y(y+x), and x=t(t+1), y=t²(t+1) glues t=0 and t=−1.

**Existing correction.** new

### E102 (error, affects a stated result)

**Where.** Author copy, Theorem 2.2.2, pp.7–8, automorphism conclusion

**What it says, in our words.** An automorphism commuting with the given translation action is declared to be a translation without a condition on its Pic⁰ action.

**Correction.** Require that automorphism to act trivially on Pic⁰, as in DR II Théorème 3.2, p.193.

**Why.** On a smooth elliptic curve, take G=1. Inversion commutes with G and fixes the identity, yet is not a translation in characteristic zero.

**Existing correction.** The original DR II Théorème 3.2 (p.193) states the automorphism clause with condition (3.1.1); the author-copy formulation drops it.

### E103 (misprint, affects the proof)

**Where.** Author copy, Theorem 2.4.5, p.16, proof for the generator map

**What it says, in our words.** After choosing Q′ with p^(r−e)Q′=Q, the proof assigns the lifted Z/p^r structure to Q.

**Correction.** Assign that Z/p^r structure to Q′; Q retains the reduced Z/p^e structure.

**Why.** The immediately preceding lift equation and the subsequent full-basis argument use Q′ at level p^r. Q only generates the smaller subgroup when r>e.

**Existing correction.** new

### E104 (misprint, affects the proof)

**Where.** Author copy, p.21, frame atlas after Theorem 3.1.6

**What it says, in our words.** The morphism S_Γ→M_Γ from the scheme of Γ-structures with a trivialization of f_\*O(3D) is called a projective-space bundle.

**Correction.** It is a GL\_{3d}-torsor (the frame bundle of the rank-3d bundle f_\*O(3D)); smoothness and surjectivity, the properties used, hold for it.

**Why.** The fibre of S_Γ→M_Γ is the set of trivializations ι:f_\*O(3D)≅O^{3d}, a GL\_{3d}-torsor; a projective-space point records only a line.

**Existing correction.** new

### E105 (error, affects a stated result)

**Where.** Author copy, Theorem 3.2.7, p.26 (final sentence); compare Theorem 3.1.7, p.21

**What it says, in our words.** The mixed Γ₁(N;n) stack is characterized as DM exactly when n is squarefree in the admissible range.

**Correction.** Use the valuation criterion of Česnavičius Proposition 4.6.5(b), published pp.2063–2064: v_p(n)≤v_p(N)+1 gives the global representable/DM range.

**Why.** For N=n=p² (an admissible pair) the complementary full torsion data eliminate the μ_p polygon inertia: a point P of order p² is étale, so the cyclic subgroup must contain μ\_{p²} and is connected. The non-DM triples of the theorem therefore do not exist, and the stack is DM although n is nonsquarefree. Česnavičius states that his Proposition 4.6.5(b) improves Conrad 3.1.7 by including all cusps in characteristics p|N even when p²|n.

**Existing correction.** Česnavičius Proposition 4.6.5(b) supplies the corrected unrestricted criterion.

### E106 (misprint, affects nothing)

**Where.** Math 248B modularcurves.pdf, Proposition 2.9, p.4

**What it says, in our words.** The relative ℘ function is treated as holomorphic into C on the entire product parameter domain.

**Correction.** Remove the relative lattice for the affine function; the projective Weierstrass map extends over that lattice with value O.

**Why.** ℘ has a double pole at every lattice point, so it cannot be a holomorphic C-valued function there.

**Existing correction.** new

### E107 (misprint, affects the proof)

**Where.** Math 248B modularcurves.pdf, proof of Theorem 17.1, p.37

**What it says, in our words.** In the level-three sketch for y(y+a₁x+a₃)=x³ the discriminant is printed as (a₁³−27a₃)a₁³.

**Correction.** It is a₃³(a₁³−27a₃), as computed from the native Weierstrass discriminant and as used on p.38.

**Why.** Set a₁=0,a₃=1: the printed expression is zero while the discriminant is −27.

**Existing correction.** The following page uses the correct a₃ factor; the local misprint remains in the served copy.

### E108 (error, affects a stated result)

**Where.** Math 248B classical.pdf, Proposition 3.1(1), p.3

**What it says, in our words.** The whole projection H→Γ\\H is described as proper and finite.

**Correction.** Restrict that assertion to the local finite stabilizer quotient U→U/Γ_y. The global quotient by an infinite Γ is neither finite nor proper.

**Why.** A generic orbit of an infinite finite-index congruence group has infinitely many points, while the fibres of a finite analytic map are finite.

**Existing correction.** new

### E109 (error, affects the proof)

**Where.** MF v1.31, proof of Theorem 6.1, p.89, integer-coefficient step

**What it says, in our words.** The proof selects the smallest index with a nonintegral coefficient in a polynomial in j and extracts that coefficient from its Laurent expansion.

**Correction.** Select the largest nonintegral index after removing higher integral terms, then use the leading Laurent coefficient.

**Why.** Take c with 1488c not an algebraic integer, for instance c=1/1489. Then P=cj²−1488cj has nonintegral coefficient of j, but its q⁻¹ coefficient is 1488c−1488c=0, so the smallest-index argument fails. Taking the largest nonintegral index m instead, only c_m contributes a nonintegral amount to the q⁻ᵐ coefficient.

**Existing correction.** new

### E110 (error, affects a stated result)

**Where.** MF v1.31, Example 8.9, p.100

**What it says, in our words.** The Legendre parameter is presented as a fine full-level-two moduli scheme with a universal family.

**Correction.** It gives the coarse curve A¹\\{0,1}; the level stack retains inversion and has twists.

**Why.** Over C(t), a generic Legendre curve and a nonsquare quadratic twist have the same parameter and rational two-torsion labels but need not be isomorphic.

**Existing correction.** new

### E111 (error, affects a stated result)

**Where.** Published Annals paper, §§2.1–2.2 (pp.714–716 as recorded by the planning pass); checked by the review in arXiv:1403.7168v2, §§2.1–2.2, pp.5–6

**What it says, in our words.** Scalar-equivalence full p-frames are treated as fine, and the bare p-gon automorphism count used at the cusp is p.

**Correction.** The scalar-frame stack retains central inversion. Use its coarse curve or specify μ₂-rigidification; the bare p-gon has automorphism scheme μ_p×Z/2, of order 2p in characteristic zero.

**Why.** Inversion multiplies a frame by −1 and therefore fixes its scalar class. The two polygon factors act independently; an effective cusp order p follows only with the quotient/rigidification convention.

**Existing correction.** new

### E112 (error, affects a stated result)

**Where.** Published Annals paper, §2.5 (pp.716–717 as recorded by the planning pass); checked by the review in arXiv:1403.7168v2, §2.5, pp.7–8

**What it says, in our words.** The cyclic-kernel closure definition is combined with the σ₁(m) degree used for the full Hecke correspondence at arbitrary m.

**Correction.** Distinguish the cyclic correspondence of degree ψ(m) from the all-subgroup correspondence of degree σ₁(m).

**Why.** At m=4 there are six cyclic order-four subgroups and one further order-four subgroup E[2]. Thus the two source degrees are six and seven.

**Existing correction.** new

### E113 (error, affects a stated result)

**Where.** Published Proposition 4.3.6, pp.2052–2053

**What it says, in our words.** The fine-scheme criterion at N≥1 omits N=1 from the exceptional levels, retaining only prime powers and twice prime powers.

**Correction.** Add N=1 as nonfine, or state the criterion for N≥2.

**Why.** At level one there is no rigidifying frame: Xfull(1)=X(1) has generic inversion inertia and cannot be represented by a scheme.

**Existing correction.** new

### E114 (gap, affects the proof)

**Where.** Author copy, proof of Theorem 2.4.5, p.16

**What it says, in our words.** The deformation reduction invokes DR III 1.2 while the mixed-level argument allows polygon count divisible by the residue characteristic.

**Correction.** Use Česnavičius Proposition 4.2.11 and the preceding torsion congruence results for the mixed/bad-characteristic case.

**Why.** DR’s cited smoothing reduction has a prime-to-characteristic polygon-count restriction. Ampleness of the mixed point/subgroup data does not impose that restriction.

**Existing correction.** Česnavičius, arXiv:1511.07475v2, remark before Proposition 4.2.11, p.33: the universal-deformation step of Conrad 2.4.5 relies on DR III 1.2(iii), which needs the number of components prime to the residue characteristic; Proposition 4.2.11(b) supplies a replacement proof.

### E115 (misprint, affects a stated result)

**Where.** Author PDF dated 18 July 2006, Example 4.5.3, p.48; sha256 f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8

**What it says, in our words.** The Fourier expansion of T_ℓ on arbitrary Katz modular forms is written with every displayed sum starting at n≥1, without a cusp-form hypothesis.

**Correction.** Start those sums at n≥0 for general modular forms. For ℓ∤N the constant term is a₀(f)+ℓ^(k−1)a₀(⟨ℓ⟩f); for ℓ∣N it is a₀(f). Alternatively retain n≥1 and restrict to cusp forms or explicitly to positive-index coefficients.

**Why.** Take N=1, residual characteristic 5, k=4 and ℓ=2. The integral level-one E₄ has q-expansion 1+240·Σ_(n≥1)σ₃(n)qⁿ, so its reduction has constant coefficient 1. The normalized two-isogeny formula is 2³f(q²)+(f(q^(1/2))+f(−q^(1/2)))/2; its constant coefficient is 8+1=9≡4 mod 5. Sums starting at n≥1 give zero. Positive-index coefficients and cuspidal comparisons are unaffected.

**Existing correction.** new in this review; no correction was located in the checked primary listings. This finding concerns only the identified author copy; journal wording was unavailable.

### E301 (error, affects a stated result)

**Where.** Gross–Zagier (1986), Chapter III Proposition (1.4), p.255, published scan sha256 8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521

**What it says, in our words.** In our words: The singular exception is restricted to supersingular extra-automorphism points.

**Correction.** For p>3 also include ordinary mixed (a,b), a,b>0, extra-automorphism points of the elliptic level pair; use Edixhoven’s resolution. At p=2,3 keep the wild calculation separate.

**Why.** At p=5,N=25, the ordinary j=1728 point on (1,1) has effective order-2 cotangent action (−x,−y), hence singular invariants. It is not supersingular.

**Existing correction.** Known: Edixhoven 1990 §1.1.4–1.1.5, pp.35–36, identifies the omission and gives the corrected locus and resolution.

### E302 (error, affects the proof)

**Where.** Bakker–Tsimerman (2016), §2.1–2.2, pp.713–715 (fine-moduli assertion on p.715), published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a

**What it says, in our words.** In our words: The scalar-equivalence framing problem is described as fine.

**Correction.** Use its coarse moduli curve or rigidify the ubiquitous central inversion; do not claim a universal elliptic family descends to the scalar quotient.

**Why.** [−1] acts as scalar −1 on E[p], fixes a projective framing and is a nonidentity automorphism of its unrigidified object.

**Existing correction.** new; the linked metric erratum does not correct this moduli convention.

### E303 (error, affects a stated result)

**Where.** Bakker–Tsimerman (2016), §2.5, p.717, published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a

**What it says, in our words.** In our words: The cyclic isogeny correspondence is assigned degree σ₁(m).

**Correction.** Use ψ(m) for the cyclic correspondence; σ₁(m) is the degree of the full order-m subgroup correspondence. The unfiltered divisor boundary union is full-subgroup data, so filter by cyclicity for the cyclic definition.

**Why.** At m=4, subgroup E[2] is noncyclic: seven order-4 subgroups, six cyclic. The three (a,d) families have 4+2+1 branches but only 4+1+1 cyclic branches.

**Existing correction.** new; neither the author metric erratum nor the checked journal/arXiv listing gives a correction to this convention.

### E304 (misprint, affects the proof)

**Where.** Bakker–Tsimerman (2016), §2.5, pp.716–717, two smooth-locus polygon domains, published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a

**What it says, in our words.** In our words: The auxiliary C_(pm)→C_p map and the C_p power map have component domains written as ℤ/m.

**Correction.** The first has component domain ℤ/(pm) and reduction modulo p; the second has domain ℤ/p and identity component index. The auxiliary first map has degree m² and is used only for its p-torsion identification; it is not the degree-m isogeny.

**Why.** C_r smooth locus is Gₘ×ℤ/r. The first map has smooth-locus kernel μ_m times a component subgroup of order m, while p∤m makes its map on p-torsion an isomorphism.

**Existing correction.** new; the inspected erratum does not address these domains.

### E305 (error, affects the proof)

**Where.** Bakker–Tsimerman (2016), §2.2, p.715, published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a

**What it says, in our words.** In our words: The unrigidified stack of generalized p-gons is assigned cusp stabilizer order p.

**Correction.** Its raw pointed generalized-elliptic automorphism group is μ_p×{±1}, of order 2p in characteristic zero. Order p is the effective stabilizer after central inversion is rigidified; use that effective stack for the (2,3,p) orbifold.

**Why.** The source itself gives the two factors of the p-gon automorphism group; inversion persists on the unframed object. Correspondingly the raw interior orders 4,6 become effective 2,3. On Gₘ×ℤ/p, α_ζ(u,c)=(ζ^c u,c) and inversion ι(u,c)=(u⁻¹,−c) commute, so the pointed automorphism group may be written as a direct product. The order distinction is the finding.

**Existing correction.** new; the inspected metric erratum does not address this stack convention.

### E306 (error, affects a stated result)

**Where.** Conrad, author PDF dated 18 July 2006, Theorem 4.3.4 p.38 and the final component clause of Theorem 4.3.6 p.40, sha256 f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8

**What it says, in our words.** In our words: For d>2 the component labels use both a unit b modulo d and a positive divisor r of d; the later chart clause asserts a unique positive-divisor lift.

**Correction.** Use φ(d)/2 cyclotomic components indexed by b modulo sign. A unit r modulo N/d selects an embedding of the cyclotomic field. Keep the marked twist exponent −r(b′)⁻¹, and allow arbitrary residue lifts rather than a unique positive divisor.

**Why.** Automorphisms identify r modulo N/d and inversion identifies (r,b) with (−r,−b). N=d=5 consequently has two 5-gon cusps, whereas the printed indexing gives eight; N=d=4 similarly has one rather than six. For N=d=5 the unique residue class modulo 1 has at least the positive-divisor lifts 1 and 5.

**Existing correction.** Known component overcount: Frederick Vu, 2023 UCLA dissertation A map in Sharifi’s conjecture for general non-exceptional characters and tame level, §3.2.2, discussion explicitly pointing out the error in Conrad Theorem 4.3.4 (eScholarship item 4th7g01n, indexed text inspected; PDF pagination unavailable through the access challenge). The related positive-lift uniqueness failure is checked here directly. Journal text was not accessible; this finding asserts the inspected author version only.

### E307 (error, affects a stated result)

**Where.** Conrad, author PDF dated 18 July 2006, Example 2.5.1, p.18, sha256 f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8

**What it says, in our words.** In our words: The branchwise mth-power map between the proper formal Tate n-gon curves is asserted finite flat of degree m.

**Correction.** Keep a finite pointed morphism of generic degree m and finite locally free rank-m restriction on the smooth loci. For m>1 the proper map is not flat at the nodes.

**Why.** After base change to a field the target node XY=tᵐ maps to xy=t via X=xᵐ,Y=yᵐ. Its closed-node fibre is k[x,y]/(xy,xᵐ,yᵐ), with basis 1,x,…,x^(m−1),y,…,y^(m−1) and length 2m−1. For m=2 this is 3, unlike generic rank 2. This obstruction is independent of the characteristic. The distinct moduli maps of Theorem 4.4.3 and the formal Gₘ power map used in §4.5 are unaffected.

**Existing correction.** new in this review; the inspected author version is the claim under review. The journal article was not accessible, so no claim is made about its published wording.

### E401 (gap, affects the proof)

**Where.** Chapter III, §1, the paragraph after (1.3), p.255; the stack defined on p.254; Invent. Math. 84 (1986), published version (MPIM scan)

**What it says, in our words.** The stack used is that of cyclic N-isogenies of generalized elliptic curves whose kernel meets every component of each geometric fibre, cyclic in the Cartier-divisor sense; the source then asserts that at every geometric point the strict henselization of the coarse scheme X is the quotient of the strict henselization of this stack by Aut_k(x)/{±1}, with Aut_k(x) the group of automorphisms of the pair, and derives Proposition (1.4) from it.

**Correction.** For N divisible by p² this is the naive Γ₀(N) stack, which is not Deligne–Mumford at the cusps of residue characteristic p, so it has no étale strict henselization there and the group Aut_k(x) of k-points misses its infinitesimal automorphisms. The statement holds for Česnavičius's refined stack 𝒳₀(N), which is Deligne–Mumford and regular and has the same coarse space; with that stack the argument for Proposition (1.4) goes through (Česnavičius Theorem 6.7 recovers the regularity away from the points with j=0 or 1728 in characteristics dividing N, and Česnavičius §6 reports that Edixhoven 1990 §1.2 computes the completions along the cusps).

**Why.** On the standard p-gon over 𝔽_p the infinitesimal μ_p of automorphisms fixing the identity component stabilises suitable ample cyclic subgroups of order N whose p-part is non-étale and disconnected, so the automorphism group scheme of that point is not étale (Česnavičius arXiv:1511.07475v2 §1.2, p.2; Conrad 2007 §1.1, p.1). The coarse spaces of the naive and refined stacks coincide (Česnavičius Proposition 6.9), so the coarse scheme X and the conclusion of (1.4) are unaffected.

**Existing correction.** new

## Notes for existing Tau Ceti roadmaps

Observations about existing Tau Ceti roadmaps, for their maintainers. They change nothing here.

- *ModularCurves.* Layer 5C lists three external comparison contracts for Y(ρ) (invariance of connectedness under Q̄→C, the analytic uniformization of Y(ρ)⊗C, and algebraic versus analytic connectedness of a smooth affine curve) and says no roadmap owns them. ModularCurvesPartII R12.4 plans all three (the first from Stacks Lemma 33.7.6, tag 0363); Layer 0E does not state the first.
- *ModularCurves, EllipticCurves.* Layer 2E fixes the Weil-pairing normalisation by comparison with the equation-level pairing e_N(S,T)=τ_S^\*g_T/g_T (Silverman III.8). On C/(Z+Zτ) this gives e_N(τ/N,1/N)=e^{2πi/N} and e_N(1/N,τ/N)=e^{−2πi/N}, the normalisation of Conrad’s Math 248B handout and Milne’s Lemma 8.7; ModularCurvesPartII R12.1 states this comparison.

<a id="sources"></a>

## Sources and versions

Every locator in this document refers to the version listed here. The same work is sometimes cited under two identifiers by targets of different layers; the table groups them. Where a book or paper was not freely readable, the targets cite a public source for the same statement instead.

| Source | Version read | Cited as | SHA-256 |
| --- | --- | --- | --- |
| Brian Conrad, *Arithmetic moduli of generalized elliptic curves* | [Author copy dated July 18, 2006, 49 pages; result numbers and printed pages refer to this copy. Published JIMJ 6 (2007), 209–278.](https://math.stanford.edu/~conrad/papers/kmpaper.pdf) | `conrad-generalized-elliptic`, `conrad07` | `f53e4ff819d5…` |
| Pierre Deligne and Michael Rapoport, *Les schémas de modules de courbes elliptiques* | [Modular Functions of One Variable II, LNM 349 (1973), pp.143–316; public IAS scan, PDF page plus 142 is the printed page.](https://publications.ias.edu/sites/default/files/Number22.pdf) | `dr` | `201e758341c6…` |
| Kęstutis Česnavičius, *A modular description of X₀(n)* | [arXiv:1511.07475v2, October 5, 2017, 67 pages; locators use its own page numbers.](https://arxiv.org/pdf/1511.07475v2) | `ces`, `ces17` | `94d0532f6881…` |
| Kęstutis Česnavičius, *A modular description of X₀(n), version of record* | [Algebra & Number Theory 11 (2017), 2001–2089; MSP PDF with two cover pages, printed page = PDF page +1998.](https://msp.org/ant/2017/11-9/ant-v11-n9-p02-p.pdf) | `ces-published` | `4fc4d2f992d1…` |
| Brian Conrad, *Modular curves and analytic families* | [Stanford Math 248B course handout, modularcurves.pdf, 47 pages; undated file served on 2026-10-13.](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf) | `conrad-course` | `457c963242d4…` |
| Brian Conrad, *Classical analytic modular curves* | [Stanford Math 248B classical.pdf handout, 13 pages.](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf) | `conrad-classical` | `01002b8e372f…` |
| Brian Conrad, *The q-expansion principle* | [Stanford Math 248B qexp.pdf handout, 6 pages.](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf) | `conrad-qexp` | `6f9af5d7ed3f…` |
| Henri Darmon, Fred Diamond and Richard Taylor, *Fermat’s Last Theorem* | [Author-hosted exposition dated September 9, 2007, 166 pages; internal page numbers.](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) | `ddt` | `254f6e29957f…` |
| J. S. Milne, *Modular Functions and Modular Forms* | [Version 1.31, March 22, 2017, 134 pages.](https://www.jmilne.org/math/CourseNotes/MF.pdf) | `milne` | `977f06a4e838…` |
| Benjamin Bakker and Jacob Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields* | [Annals of Mathematics 184 (2016), 709–744, published PDF; printed page = PDF page +708.](https://benjamin-bakker.github.io/P.torsion.pdf) | `bt` | `814976eeb933…` |
| Benjamin Bakker and Jacob Tsimerman, *Erratum to p-torsion monodromy representations of elliptic curves over geometric function fields* | [Author-hosted five-page erratum; version served on 2026-10-13.](https://benjamin-bakker.github.io/P.torsion.erratum.pdf) | `bt-erratum` | `db8effa1d3ef…` |
| Benedict Gross and Don Zagier, *Heegner points and derivatives of L-series* | [Inventiones Mathematicae 84 (1986), 225–320; published scan with one GDZ cover page, printed page = PDF page +223.](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | `gz` | `a9a52cb8662e…` |
| The Stacks project authors, *The Stacks project* | [Online, tag 0363 (Lemma 33.7.6) as served on 2026-10-13](https://stacks.math.columbia.edu/tag/0363) | `stacks` |  |
| Benjamin Bakker and Jacob Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields (preprint)* | [arXiv:1403.7168v2, 31 pages; preprint page numbers.](https://arxiv.org/pdf/1403.7168v2) | `bt-preprint` | `871ee74881f9…` |
| Bas Edixhoven, *Minimal resolution and stable reduction of X₀(N)* | [Published Ann. Inst. Fourier 40 (1990), 31–67, Numdam scan; first PDF page is a repository cover, so use printed page numbers.](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf) | `edix90` | `cff6a257adca…` |
| Kenneth A. Ribet and William A. Stein; appendix Brian Conrad, *Lectures on Serre’s conjectures, including Conrad’s The Shimura construction in weight 2* | [Author PDF with internal printed pp.1–94 (printed page = PDF page − 4); published IAS/Park City Math. Ser. 9 (2001), 143–232. Locators here are internal, not publication pagination.](https://wstein.org/papers/serre/ribet-stein.pdf) | `ribetstein`, `RIBET-STEIN-SERRE-LECTURES` | `e1bf2b5cd14d…` |
| Benedict H. Gross and Don B. Zagier, *Heegner points and derivatives of L-series* | [Published Invent. Math. 84 (1986), 225–320, MPIM author-hosted scan; locators use journal pages.](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf) | `grosszagier`, `gz86` | `8afee839cdc0…` |
| Benjamin Bakker and Jacob Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields* | [Published Ann. Math. 184 (2016), 709–744; journal PDF, printed pages.](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf) | `bt16` | `814976eeb933…` |
| Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk, *Explicit Chabauty–Kim for the split Cartan modular curve of level 13* | [Published Ann. Math. 189 (2019), 885–944; journal PDF, printed pages.](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) | `bdmtv19` | `e1aa5f9662b4…` |
| David Masser and Umberto Zannier, *Abelian varieties isogenous to no Jacobian* | [Published Ann. Math. 191 (2020), 635–674; journal PDF, printed pages.](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf) | `mz20` | `8b76bfac8837…` |
| Kęstutis Česnavičius, *Coarse base change fails for some modular curves* | [arXiv:1608.01249v2 (24 October 2016), printed pp.1–7; published Algebraic Geometry 4 (2017), no. 4, 444–451.](https://arxiv.org/pdf/1608.01249) | `ces16cb` | `c2f4a0311bef…` |
| Brian Conrad, *The Keel–Mori theorem via stacks* | [Author notes dated 27 November 2005, 12 pp.](https://math.stanford.edu/~conrad/papers/coarsespace.pdf) | `conrad05` | `31535943dd0f…` |
| Dan Abramovich and Angelo Vistoli, *Compactifying the space of stable maps* | [arXiv:math/9908167v2 (12 March 2000); published J. Amer. Math. Soc. 15 (2002), 27–75.](https://arxiv.org/pdf/math/9908167) | `av02` | `8b19db73bcda…` |
| David Zywina, *On the possible images of the mod ℓ representations associated to elliptic curves over ℚ* | [arXiv:1508.07660 (PDF retrieved 2026-10-13), PDF page numbers.](https://arxiv.org/pdf/1508.07660) | `zywina15` | `b3b747c876c4…` |
| The Stacks Project authors, *The Stacks Project* | [Online version and morphisms.tex at the GitHub master branch, read 2026-10-13; cited by tag.](https://stacks.math.columbia.edu) | `stacks` |  |
| Tau Ceti contributors, *Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)* | [TauCetiRoadmap main at commit 0d144d0, TauCetiRoadmap/ModularCurves/README.md and Suggested.lean.](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves) | `tc-modularcurves` |  |
| Pierre Deligne, *Formes modulaires et représentations ℓ-adiques* | [Séminaire Bourbaki, exposé 355 (1968–1969), pp. 139–172; Numdam scan](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) | `DELIGNE-355` | `19509c19b0cb…` |
| Kenneth A. Ribet, *Congruence relations between modular forms* | [Proceedings ICM Warsaw 1983, published 1984, pp. 503–514; author scan](https://math.berkeley.edu/~ribet/Articles/icm.pdf) | `RIBET-1984` | `44f74c2a9e33…` |
| Frank Calegari, Vesselin Dimitrov and Yunqing Tang, *The unbounded denominators conjecture* | [arXiv:2109.09040 author preprint dated 18 September 2024, fetched 11 October 2026; compared with the author-hosted published JAMS 38 (2025), 627–702 offprint in §§4.4–4.6, pp. 659–666. Node locators distinguish preprint and journal pages.](https://arxiv.org/pdf/2109.09040) | `CDT-2025` | `9bffb12953db…` |
| Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method* | [arXiv:1207.4224 author preprint, fetched 11 October 2026; comparison with author-hosted Springer-layout copy, PDF pp. 120–123](https://arxiv.org/pdf/1207.4224) | `CALEGARI-GERAGHTY` | `67896c853258…` |
| Jean-Pierre Serre, *Arbres, amalgames, SL₂* | [Astérisque 46, third edition 1983 (original 1977), Numdam scan](https://www.numdam.org/item/AST_1983__46__1_0.pdf) | `SERRE-TREES` | `7f048d9e3896…` |
| Jean-Pierre Serre, *Le problème des groupes de congruence pour SL₂* | [Annals of Mathematics 92 (1970), pp. 489–527; author-hosted scan](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf) | `SERRE-CSP` | `2a079cca247d…` |
| Richard Taylor and Andrew Wiles, *Ring-theoretic properties of certain Hecke algebras* | [Author manuscript dated 7 October 1994, pp. 1–22; Proposition 1 on pp. 7–8 (published Annals 141 (1995), pp. 553–572 has different pagination)](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf) | `TAYLOR-WILES` | `3a58acd02155…` |
| Jens Funke and John Millson, *Spectacle cycles with coefficients and modular forms of half-integral weight* | [arXiv:1108.5309v1 identifier (26 August 2011); the retrieved author PDF carries the date 27 August 2021.](https://arxiv.org/pdf/1108.5309) | `FUNKE-MILLSON` | `225af406ef90…` |

<a id="baseline"></a>

## Pinned library declarations

These declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, the pins of this roadmap. Each supplies exactly what its row says and nothing more; in particular none of them constructs a modular curve, a stack or a geometric correspondence.

| Declaration | Module | What it provides |
| --- | --- | --- |
| `mathlib:PeriodPair` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | A pair of real-linearly independent complex periods; its lattice and integer basis already exist. |
| `mathlib:PeriodPair.weierstrassP` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | The lattice Weierstrass function, including totalized values at lattice points; only its restriction off the lattice is used for affine coordinates. |
| `mathlib:PeriodPair.derivWeierstrassP` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | The native derivative function, periodic and odd. |
| `mathlib:PeriodPair.g₂` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | The invariant 60 G₄ of a native period pair. |
| `mathlib:PeriodPair.g₃` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | The invariant 140 G₆ of a native period pair. |
| `mathlib:PeriodPair.derivWeierstrassP_sq` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | For z outside the lattice, ℘′(z)² = 4℘(z)³ − g₂℘(z) − g₃. |
| `mathlib:WeierstrassCurve` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | The five-coefficient Weierstrass equation over a commutative ring and its discriminant. |
| `mathlib:WeierstrassCurve.IsElliptic` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | The class asserting that the Weierstrass discriminant is a unit; over C this is precisely nonsingularity. |
| `mathlib:Polynomial.natDegree_cyclotomic` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean` | For a nontrivial ring R, Φ_n has natural degree φ(n). |
| `tauceti:TauCeti.Subgroup.integerCuspWidth` | `TauCeti/NumberTheory/ModularForms/Cusps/Basic.lean` | For a subgroup 𝒢 of GL₂(R), the least positive n with [[1,n],[0,1]]∈𝒢, or zero if none; positivity needs finite relative index in SL₂(Z). It is the strict width at ∞ of 𝒢 itself (−1 is not adjoined); other cusps σ∞ use σ⁻¹𝒢σ, and at an irregular cusp it is twice the effective PSL₂ width. |
| `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk` | `TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean` | A locally Noetherian connected scheme with all stalks domains is irreducible. |
| `tauceti:HeckeRing.GL2.qExpansion_coeff_one_heckeRingHomCharSpace_heckeTCompositeGamma0` | `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Composite.lean` | For [NeZero N], a character χ of (Z/N)^× and n≠0, a₁(T_n F)=a_n(F) for F in the χ-part of M_k(Γ₁(N)) (width-one q-expansion); trivial χ is the Γ₀(N) case. T_n is the native composite operator, bad-prime blocks included; no coprimality hypothesis. |
| `tauceti:HeckeRing.GL2.heckeT_mul_of_coprime` | `TauCeti/NumberTheory/HeckeRing/GL2/Basic.lean` | For m,n:ℕ+ and Nat.Coprime(m:ℕ)(n:ℕ), HeckeRing.GL2.heckeT m \* HeckeRing.GL2.heckeT n = HeckeRing.GL2.heckeT (m\*n). This is the abstract full-subgroup integral GL₂ Hecke product, not the cyclic repeated-prime law. |
| `mathlib:AlgebraicGeometry.Flat` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean` | Flat morphisms of schemes |
| `mathlib:AlgebraicGeometry.IsFinite` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean` | Finite morphisms of schemes |
| `mathlib:AlgebraicGeometry.IsIntegralHom` | `Mathlib/AlgebraicGeometry/Morphisms/Integral.lean` | Integral morphisms of schemes |
| `mathlib:AlgebraicGeometry.IsOpenImmersion` | `Mathlib/AlgebraicGeometry/OpenImmersion.lean` | Open immersions of schemes |
| `mathlib:AlgebraicGeometry.Scheme.Hom.finrank` | `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean` | The locally constant rank of a finite locally free morphism |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The relative normalization of the target in a quasi-compact quasi-separated morphism of schemes |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization.hom_ext` | `Mathlib/AlgebraicGeometry/Normalization.lean` | Uniqueness of morphisms out of the relative normalization over an affine morphism |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The universal property of relative normalization: a morphism to any integral factorisation |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationPullback` | `Mathlib/AlgebraicGeometry/Normalization.lean` | The comparison morphism from the normalization of a base change to the base change of the normalization; an isomorphism for smooth (hence étale) base change (instance tagged Stacks 03GV) |
| `mathlib:CongruenceSubgroup.Gamma` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | Γ(N) in SL(2,ℤ): matrices ≡ identity mod N |
| `mathlib:CongruenceSubgroup.Gamma0` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | Γ₀(N) in SL(2,ℤ): lower-left entry ≡0 mod N |
| `mathlib:CongruenceSubgroup.Gamma1` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | Γ₁(N) in SL(2,ℤ): a≡1, d≡1 and c≡0 mod N |
| `mathlib:IsIntegrallyClosed` | `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean` | Integrally closed commutative rings |
| `mathlib:IsPrimitiveRoot` | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | Primitive roots of unity |
| `mathlib:Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | The general linear group GL(n,R) as units of matrices |
| `mathlib:Matrix.GeneralLinearGroup.det` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | The determinant homomorphism GL(n,R)→Rˣ |
| `mathlib:Polynomial.cyclotomic` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean` | Cyclotomic polynomials |
| `mathlib:Subgroup.index` | `Mathlib/GroupTheory/Index.lean` | The index of a subgroup |
| `mathlib:Subgroup.normalizer` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | The normaliser of a subset in a group |
| `tauceti:WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq` | `TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean` | For an elliptic Weierstrass curve over a domain with j≠0,1728, every change of variables fixing it is the identity or the negation change; over a field these are its automorphisms |
| `mathlib:AlgebraicGeometry.Scheme.EllAdicCohomology` | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean` | Untwisted pro-étale ℤ_ℓ sheaf cohomology carrier with additive group; does not supply twisted finite coefficients, comparison or a ℤ_ℓ-module instance. |
| `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf` | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean` | Continuous ℤ_ℓ-valued pro-étale sheaf, for ℓ prime. |
| `tauceti:TauCeti.LocalCoefficientSystem` | `TauCeti/AlgebraicTopology/LocalCoefficient.lean` | Module-valued functors on the fundamental groupoid; the abstract local-system carrier is imported. |
| `tauceti:TauCeti.LocalCoefficientSystem.pullback` | `TauCeti/AlgebraicTopology/LocalCoefficient.lean` | Pullback functor along a continuous map, with identity and composition isomorphisms in that file. |
| `tauceti:Representation.symmetricPower` | `TauCeti/RepresentationTheory/SymmetricPower.lean` | Action on Sym^r of a representation; includes pure-tensor evaluation and functorial intertwining maps. The abstract symmetric-power representation is not a new target. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` | Actual proper geometrically integral group-scheme carrier over a field; not a Jacobian or a quotient construction. |
| `mathlib:RingHom.ker` | `Mathlib/RingTheory/Ideal/Maps.lean` | Kernel ideal of a ring homomorphism. |
| `mathlib:LinearMap.coprod` | `Mathlib/LinearAlgebra/Prod.lean` | Sum map from a product of two modules, used only after geometric pullbacks have been constructed. |
| `mathlib:LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Range.lean` | Image submodule, used to define parabolic cohomology from the actual compact-support map. |
| `mathlib:groupCohomology.H1` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` | Group-cohomology carrier for an actual representation. With trivial action, degree one is additive characters, not compact curve cohomology. |
| `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` | `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean` | Same-level newforms, with equal characters and good eigenvalues outside a finite set, are equal. This does not prove cross-level multiplicity one or integral saturation. |
| `mathlib:groupCohomology.coindIso` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean` | Shapiro isomorphism for coinduction from a subgroup, in every degree; use this existing theorem rather than plan another Shapiro theorem. |
| `mathlib:groupCohomology.H1IsoOfIsTrivial` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` | Existing trivial-action H¹/character isomorphism; congruenceClasses_H1 specializes this result rather than reproving it. |
| `tauceti:CongruenceSubgroup.Gamma_le_Gamma_of_dvd` | `TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean` | Existing antitonicity of principal congruence subgroups under divisibility of levels; use it in refinement and restriction tests. |
| `mathlib:Module.free_of_flat_of_isLocalRing` | `Mathlib/RingTheory/LocalRing/Module.lean` | A finite flat module over a commutative local ring is free. Finite projective modules supply flatness; this is not an unrestricted infinitely generated freeness assertion. |
| `tauceti:SymmetricPower.finrank_eq` | `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean` | For a finite free module over a commutative semiring with strong rank condition, the nth symmetric power has finrank multichoose(finrank M,n); supplies the rank checks for relative rank-two coefficients. |
| `mathlib:RingHom.quotientKerEquivRange` | `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` | For a commutative ring R and a ring S, R/ker f is canonically ring-isomorphic to the image subring f.range. This is an integral image theorem, not a rational coefficient-field identification. |

## Requests from other roadmaps that need generic-fibre targets

Several roadmaps ask this roadmap for statements about particular curves on the generic fibre. The algebraic curves are constructed in R13.4a (the twisted curve X(ρ), the Atkin–Lehner quotients X₀⁺(N), the Cartan curves and the rational-point criterion), but the following generic-fibre statements need connectedness (R12.4) or genus computations, so they belong with R13.4b, and R13.4b does not yet state them as targets:

- the rationality X_ρ(5)≅ℙ¹_ℚ of the compactified twisted curve for a determinant-compatible representation over 𝔽₅ (Shepherd-Barron–Taylor, Lemma 1.1), requested by EllipticCurveModularityWild3Adic W3.6;
- the genera of X₀(4), X₀(9), X₀(25) and X₀(49) and the four fixed points of w₄₉, requested by EffectiveDiophantineMethods ED.6, together with the generic-fibre comparison, components, determinant data and cusp fields of its Cartan, exceptional S₄(13) and X₀(N)/⟨w_N⟩ curves;
- the normalized genus-zero Borel and Cartan coordinates of Caraiani–Newton §7.1.3, requested by EllipticCurveModularityImaginaryQuadratic IQ.4.

R13.4b/generic-component-comparison supplies the components, determinant data and cusp fields of every X_H, which covers the comparison part of the second item; the rationality, genus and coordinate statements are to be added to R13.4b as targets on the R13.4a carriers.

## Required checks

The roadmap's three strands each name checks that a correct development must pass. They are realized by the unit tests and acceptance checks of the targets above.

| Check | Where it is tested |
| --- | --- |
| The j-line at level one | `integralCoarseCurve_levelOne` and `integralCoarseCurve_noUniversalFamily` in [`R13.4a/integral-coarse-curves`](#r13-4a-integral-coarse-curves); `levelStack_full_group` in [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack). |
| Two or more components distinguished by the determinant at small full level, and the rejection of "Y_full(N) is geometrically connected" | `toCyclotomicBase_not_connected` in [`R13.4a/coarse-cyclotomic-structure`](#r13-4a-coarse-cyclotomic-structure); `twistedCurve_unpaired` in [`R13.4a/twisted-coarse-curve`](#r13-4a-twisted-coarse-curve); the full-level-5 component count (four over ℂ, two after scalars, one after fixing the pairing) in [R13.4](#r13-4) and [`R13.4b/generic-component-comparison`](#r13-4b-generic-component-comparison). |
| X₀(11), its rational cusp and its weight-two quotient | `abelJacobi_X011` in [`R14.6/rational-cusp-abel-jacobi`](#r14-6-rational-cusp-abel-jacobi); `modularQuotient_level11` in [`R14.5/modular-quotient`](#r14-5-modular-quotient); `parabolicH1_compact_test` in [`R14.3/parabolic-cohomology`](#r14-3-parabolic-cohomology); the degree-3 degeneracy leg at N=11, p=2 in [`R14.1/degeneracy-maps-and-hecke-correspondence`](#r14-1-degeneracy-maps-and-hecke-correspondence) and [`R14.2/hecke-operators-on-the-jacobian`](#r14-2-hecke-operators-on-the-jacobian). |
| Prime level away from and at the prime; level p²; a composite level with nontrivial boundary contraction | [`R13.5/one-factor-mixed-level-model`](#r13-5-one-factor-mixed-level-model), [`R13.5/prime-square-semistable-model`](#r13-5-prime-square-semistable-model), `levelStack_not_naive` in [`R13.4a/deligne-rapoport-level-stack`](#r13-4a-deligne-rapoport-level-stack), `refinedGammaZeroStack_badPrime` in [`R13.2/refined-gamma-zero-moduli`](#r13-2-refined-gamma-zero-moduli), and the bad-level case list above. |
| A characteristic-2 or 3 stabilizer, and the rejection of arbitrary base change for coarse spaces | `formalLevelChart_wild_invariants` in [`R13.3/formal-level-cusp-charts`](#r13-3-formal-level-cusp-charts); [`R13.4a/coarse-base-change-failure`](#r13-4a-coarse-base-change-failure); [`R13.4a/legal-coarse-base-change`](#r13-4a-legal-coarse-base-change). |
| T_ℓ on q-expansions | [`R12.5/hecke-normalization-comparison`](#r12-5-hecke-normalization-comparison) and [`R13.4b/hecke-normalization-comparison`](#r13-4b-hecke-normalization-comparison), with the coefficient formula a_{np}(f)+p·a_{n/p}(⟨p⟩f). |
| The adjoint formula on a Jacobian | [`R14.2/weil-pairing-adjointness`](#r14-2-weil-pairing-adjointness) and [`R14.3/hecke-twisted-self-adjoint`](#r14-3-hecke-twisted-self-adjoint). |
| An oldform at raised level | [`R14.5/oldform-comparison`](#r14-5-oldform-comparison), with τ(M/N) degeneracy copies. |
| A non-Eisenstein localization is a localization of the constructed Hecke module | [`R14.3/boundary-non-eisenstein`](#r14-3-boundary-non-eisenstein) and [`R14.3/localized-freeness`](#r14-3-localized-freeness). |

## The suggested Lean file

[`ModularCurvesPartII.lean`](../suggested/ModularCurvesPartII.lean) states what the pinned Mathlib and Tau Ceti can already express, in one namespace `TauCeti.ModularCurves`:

- for R12–R13.2, the lattice Weierstrass model on Mathlib's `PeriodPair` with its discriminant and nonsingularity, the split one-gon equation over ℤ, the σ₁(4)=7 subgroup count, the cyclotomic degree used for pairing bases, and Tau Ceti's connected-to-irreducible theorem;
- for R13.3–R14.2, the node-fibre lengths 2m−1 that show the proper Tate power map is not flat, the degrees of the degeneracy legs, the Hermite-normal-form counts of the full and cyclic correspondences (seven against six at m=4), Tau Ceti's coprime Hecke multiplicativity, the analytic Fricke formula, the exact divisors of 12, the corrected Γ₁ cusp-component counts, and the characteristic-two certificate for the first Baran quartic;
- for R13.5, the split-Cartan ramification index (ℓ²−1)/2 and the genus of the semistable fibre over K_(k,3);
- for R13.4a, the level subgroups Γ₀, Γ₁, Γ₁^μ and the split and nonsplit Cartan subgroups and normalizers of GL₂(ℤ/n) in the row-action convention, the projective index (the degree of the j-map), the determinant image (the cyclotomic base), pullback along reduction, the cusp double cosets ⟨±u⟩\GL₂(ℤ/n)/H̄ with their counts, the comparison with Mathlib's `CongruenceSubgroup`, and the recognition criterion for Mathlib's relative normalization;
- for R14.3–R14.6, the symmetric-power coefficient action, parabolic cohomology as the image of an actual support map with its functoriality, the two-leg degeneracy map, congruence classes in H¹ of Γ(N) with Mathlib's trivial-action character isomorphism, the Hecke prime of an eigencharacter, the rank-two base-change algebra behind Shimura's theorem, the degree-zero supersingular lattice, the Taylor–Wiles minus part with its projector, and Mathlib's freeness of finite flat modules over local rings.

Everything else is a target of this document. The file closes with the proposed names of the API items and unit tests of each target whose carriers are not at the pins, so that implementations converge on the names used here. It opens with the standard note: it is not the roadmap, it is not exhaustive, and this document is definitive.
