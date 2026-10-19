# Roadmap: main conjectures for modular forms and their families

**Summary.** Build the comparisons between ordinary Selmer, Kato cohomological and signed formulations of the cyclotomic main conjecture for modular forms. Combine the separately constructed Euler-system bound and automorphic reverse bounds in their precise ranges, transport the resulting statements to elliptic curves and families, and derive the stated specialization and rank-zero consequences. Integral periods, stable lattices, tame components and local correction factors remain part of every comparison.

## Scope and ownership

This roadmap owns the modular formulation dictionaries, the assembly of the two ordinary divisibilities, and the comparisons that turn the pointwise, family and elliptic-curve endpoints into the chosen formulations. It also owns the elementary residual predicates, the rank-one coinvariant argument, Euler-factor and coefficient-change comparisons, the modular instances of general main-conjecture propositions, and the specified leading-term consequences.

The following constructions and arithmetic proofs are consumed from their owners.

- **Mathlib and Tau Ceti.** Use Mathlib's `Representation`, `Representation.invariants`, `Module.finrank`, `Matrix.toLin'`, `PowerSeries`, `Associated`, `IsDiscreteValuationRing`, subgroup and quotient-module APIs. Tau Ceti's Galois cohomology and Kummer maps supply their existing functoriality. The finite two-descent group `WeierstrassCurve.Affine.selmerGroup₂` is a different object from the cyclotomic p-primary Selmer groups used here. Current Tau Ceti supplies `TauCeti.tateCurve` and `TauCeti.tateCurveAt`; the elliptic local-field supplier provides the further point uniformization and multiplicative inertia comparison. No second formal Tate curve, cyclotomic character, Kummer theory or local absolute Galois group is constructed here.
- **ArithmeticGaloisRepresentations and EllipticCurveModularity.** Use modular Galois representations, integral lattices, residual local types and the modularity/parametrization/Tate-module comparisons. The corresponding current Tau Ceti roadmaps ModularForms, ModularCurves, EllipticCurves, LocalGaloisGroups, ProfiniteArithmetic, ProfiniteCohomology, ClassFieldTheory and LocalFieldsRamification supply the underlying arithmetic. IntegralLattices treats quadratic lattices; the stable representation lattice here carries a Galois action and is a distinct specialization of module theory.
- **PadicMeasuresIwasawaAlgebras.** Use completed group algebras, characteristic ideals, Weierstrass invariants and perfect-complex determinants. The determinant of a perfect Iwasawa complex is distinct from the determinant bundle construction in AlgebraicVectorBundles.
- **SelmerIwasawaCohomology.** Use continuous cohomology with local conditions, Greenberg's condition, Poitou–Tate, Pontryagin duals, control and no-finite-submodule results. Here those constructions are specialized to the stated modular datum and compared with the analytic normalization.
- **KatoEulerSystems.** Use the modular zeta classes and morphisms, their reciprocity laws, divisibilities and the elliptic no-finite-Iwasawa-submodule theorem. Generic Euler/Kolyvagin-system descent belongs to EulerSystemsAndKolyvaginSystems. This roadmap combines those outputs with reverse bounds rather than constructing another Euler-system theory.
- **ModularSymbolsPadicLFunctions and the signed regulator theory.** Use saturated period lattices, modular-symbol interpolation and integral Coleman maps/Wach bases. The signed local definitions below use the regulator supplier's actual domain and image, rather than another construction of those maps.
- **AutomorphicCongruences.** Layers 1 and 2 own the different ordinary reverse bounds. Layer 4 owns the Fouquet–Wan pointwise and universal-family arithmetic endpoints. Layer 5b owns both Burungale–Castella–Skinner cyclotomic endpoints. Here their hypotheses are exposed and their formulations compared; none of their automorphic proofs is a second target.
- **Other arithmetic branches.** HeegnerPointEulerSystems HE.8b owns the ordinary anticyclotomic proofs and their Heegner/BDP comparison. RankZeroOneBSD BSD.7a owns the Eisenstein-prime endpoints, and BSD.6a owns the semistable supersingular and multiplicative anticyclotomic endpoints. Layer 6 transports these outputs through the stated formulation maps. It gives no proof of these branches from the irreducible ordinary theorems.

The named theorem families do not assert the main conjecture for every ordinary representation, every nebentypus, every tame component, every crystalline basis, or every deformation ring. General input data may be used to define a conjectural proposition without asserting its truth. In particular, a rational ideal equality, an integral ideal equality and an exact normalized leading coefficient are separate conclusions.

## Conventions

Let p be an odd prime, L/ℚ_p finite, O its ring of integers, ϖ a uniformizer and F=O/(ϖ). Use continuous actions of the relevant profinite Galois groups on the indicated topological modules. Mathlib's `ContRepresentation` ensures that each individual operator is continuous; continuity in the group variable, or joint continuity of the action, is a separate hypothesis and must be supplied for Galois representations.

Write ℚ∞ for the cyclotomic ℤ_p-extension, Γ=Gal(ℚ∞/ℚ), and choose γ with κ(γ)=1+p. Set Λ=O[[Γ]]≃O[[X]], X=γ−1. For the full p-power cyclotomic extension use G∞=Δ×Γ with Δ≃(ℤ/pℤ)× and Λ(G∞)=O[Δ][[Γ]]. A finite coefficient extension contains the values of each tame character under consideration. An integral statement is over Λ; a rational one is over Λ[1/ϖ]. The latter is an algebraic localization and is not identified with L[[X]]. Characteristic ideals are taken only for finitely generated torsion modules over the specified regular component ring.

The form's representation V_f is cohomological: geometric Frobenius at an unramified ℓ has polynomial X²−a_ℓX+ε(ℓ)ℓ^{k−1}, and the arithmetic cyclotomic determinant is ε^{-1}κ^{1−k}. Write T_f for the chosen integral lattice. The Skinner–Urban Selmer lattice is T=T_f(det ρ_f^{-1}); in dimension two its rational representation is V_f^*. For weight two and a specified modular elliptic curve, this twist corresponds to the homological Tate-module realization. Do not change between these representations inside an Euler polynomial or a residual local condition.

In the good ordinary cohomological representation the selected line V_f^+ is unramified. After the determinant twist, T^+=T∩V_f^+(det ρ_f^{-1}) need not be unramified; the quotient T/T^+ is unramified. Set A=T⊗_O L/O and A^-=(T/T^+)⊗_O L/O. For good ordinary forms use the strict decomposition-group kernel with coefficients A^−. It equals the inertia kernel because the unramified eigenvalue is not 1. For the multiplicative theorem use Skinner’s inertia-kernel condition. At split multiplicative reduction the eigenvalue is 1, so the strict condition is a separate auxiliary condition and its local correction is retained (Skinner §2.3, pp.8–12).

For Iwasawa modules use Skinner’s scalar-dual convention: `D_Λ(M)=Hom_cont(M,ℚ_p/ℤ_p)` with `(λ·φ)(m)=φ(λm)` (Skinner §2.3, p.8). This is a Λ-module dual. Distinguish the contragredient representation dual, whose action is `(g·φ)(m)=φ(g⁻¹m)`. The latter is `D_Λ(M)^ι`, where ι(g)=g⁻¹. Thus e_ηD_Λ(M)=D_Λ(e_ηM), whereas the contragredient dual of M^η has character η⁻¹. For a tame generator acting by 2 in F₇, precomposition gives scalar 2 and contragredient precomposition gives 4, since 2·4=1 and 2≠4. Every characteristic-ideal statement below uses D_Λ; converting to the contragredient convention applies ι to both the algebraic ideal and the analytic function. Local Tate/Galois representation duals remain contragredient. Transport every supplier comparison to these conventions before comparing its characteristic ideal or Coleman-image quotient.

Keep the cohomological canonical period Ω_f^± distinct from the differential period P_f^±=−2πiΩ_f^±. With Ω_f the interpolation denominator has exponent m+1 on −2πi; with P_f it has exponent m. For m=0 the denominator is −2πiΩ_f=P_f, and for m=1 it is (−2πi)²Ω_f=(−2πi)P_f. The scalar from a form-normalized analytic function to the curve's Néron-normalized one is P_f^+/Ω_E^+, with the appropriate sign component. Algebraicity of this scalar does not make it a unit. Skinner's §2.4 equation (2.4.1) and footnote 6, p.14, fix this convention.

Use cochain degrees for determinants: `det C = ⊗_i(det C^i)^{(−1)^i}`. The fundamental line includes the inverse determinant and its stated Betti factor. For nonzero a, the complex `[O --a--> O]` in degrees 1 and 2 has H¹=0 and H²=O/(a); its inverse-determinant trivialization has divisor +div(a). Separately, H¹=Oe, z=ae and H²=0 give the zeta quotient O/(a) and divisor −div(a). When both contributions occur, their lengths subtract; equal lengths cancel. The determinant/characteristic comparison equates the degree-two torsion ideal with the degree-one zeta-quotient ideal. For a removed Euler factor E, the primitive zeta normalization is `z_prim=E_dual^{-1}z_Σ`; with E_dual=2 the two values 1 and 2 satisfy z_Σ=2z_prim, fixing the direction.

Signed labels refer first to a chosen integral Wach basis and its Coleman coordinates. For a_p=0 and the LLZ elliptic basis, index 1 is Kobayashi's minus condition and index 2 is plus. A general basis change changes individual kernels. A component's analytic term is `char(I_i^η/Λ L_i^η)` for the actual image lattice I_i^η. Principal-ideal notation `(L_i^η)` is justified only by the image computation and normalization comparison specified for that component.

Use Iwasawa's branch of log_p, with log_p(p)=0, and ord_p(p)=1. The analytic cyclotomic coordinate is X=κ(γ)^{s−1}−1; its first coefficient is log_p κ(γ). The inverse coordinate κ(γ)^{1−s}−1 has first coefficient −log_p κ(γ). For γ with κ(γ)=1+p, these coefficients differ by a sign, but the logarithm itself is a nonunit. In a rank-r leading coefficient it occurs to the power r and must be compared with the height normalization.

## Exact supplier contracts

The following outputs specify the maps and normalizations consumed here. An application carrying one of these comparisons as a hypothesis remains conditional on precisely that comparison.

### From Mathlib and Tau Ceti

Use `Representation.invariants` for the fixed submodule, with `ρ.comp I.subtype` for restriction to a subgroup; `Module.finrank` is finite dimension over F in all residual invariant calculations. Use `Matrix.toLin'` on `Fin 2 → O` and the quotient by `LinearMap.range (u−LinearMap.id)` for integral coinvariants. `Associated f g` means equality up to a unit, not equality after inverting ϖ. The exact algebraic μ comparison in §5.3 is stated over a DVR and does not require mixed characteristic.

Current Tau Ceti already defines `TauCeti.completedGroupAlgebra R Γ` as the inverse limit over open normal subgroups, together with `TauCeti.completedGroupAlgebra.proj`, `.of`, `.map` and `.map_of` in `Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` and `.Map`. Its `.PowerSeries` module supplies `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, `.powerSeriesCoordinate_X` and `.powerSeriesCoordinate_one_add_X` over ℤ_p for an infinite compact commutative pro-p group with the specified topological generator. The finite discrete tame-product comparison is `TauCeti.completedGroupAlgebra.monoidAlgebraProdEquiv` in `.Prod`. Reuse these constructions; finite O-coefficient extension and the characteristic-ideal/determinant interfaces are consumed from PadicMeasuresIwasawaAlgebras. The power-series coordinate theorem just cited is ℤ_p-linear, not a theorem already stated over every O.

The underlying absolute Galois groups, cyclotomic characters, restriction/corestriction and Kummer interfaces are the existing Mathlib/Tau Ceti objects and the local-field/class-field roadmaps named under Scope and ownership. The additional output consumed from EllipticCurves Layer 4 is: for a split multiplicative E/ℚ_p, a parameter q_E∈ℚ_p× with |q_E|<1, point uniformization E(ℚ̄_p)≃ℚ̄_p×/q_E^ℤ and ord_p(q_E)=ord_p Δ_min=−ord_p j_E>0. For multiplicative E at ℓ≠p, its residual Tate module is ramified at ℓ exactly when p∤ord_ℓ Δ_min, after the unramified quadratic splitting twist in the nonsplit case. This is an inertia criterion away from the coefficient prime; it is not a criterion that q_E be a p-th power over the original local field.

### From PadicMeasuresIwasawaAlgebras and SelmerIwasawaCohomology

PadicMeasuresIwasawaAlgebras Layer 1 supplies the O-coefficient, tame-component and inversion interfaces on those completed group algebras, with γ↦1+X. Layer 4 supplies `charIdeal`/`charDivisor`, exact-sequence multiplicativity, pseudo-isomorphism invariance, tame-component decomposition, finite coefficient base change, Weierstrass preparation and μ/λ. Layer 5 supplies determinants of perfect complexes, derived base change and specialization, and compact topological Nakayama.

SelmerIwasawaCohomology Layers 1–3 supply the ordinary Selmer complex and its discrete/compact dual descriptions, change-of-local-condition triangles, Poitou–Tate and Iwasawa Shapiro. Sections 3.18–3.21 supply the explicit Greenberg structure hypotheses, localization surjectivity, no-pseudo-null and Fitting/characteristic comparisons; §4.21 supplies the general Greenberg proposition. Retain the stated ordinary range and transport the supplier’s contragredient dual through the scalar-dual convention above. Localization surjectivity in §5.1 is used only with the specified global hypotheses and a set containing the ramification set. Signed conditions use local Tate orthogonality with the same dual and inversion conventions as the Coleman domain.

For the Schneider consequence, require the following extra comparison from the Selmer theory: identify the ordinary Galois Selmer characteristic series with the alternating flat Néron-model cohomology characteristic factors of Schneider §2, pp.340–342, retaining the global degree-zero/degree-two terms, local component groups and #Ẽ(F_p)². Supply its leading-term interpretation for Schneider Theorem 7, p.371, together with the comparison of the analytic κ-height and the MTT height under X=κ(γ)^{±(s−1)}−1, including log_p κ(γ)^r. The arithmetic cyclotomic height is explicit input; NoncommutativeAndEquivariantIwasawa NE.7's Bockstein pairing alone is not this comparison.

### From KatoEulerSystems and the analytic/regulator suppliers

KatoEulerSystems §2.4 supplies the dual/Hecke/twist dictionary; §§3.2 and 3.4 supply Betti periods and geometric explicit reciprocity. Sections 4.4 and 5.1–5.4 supply Iwasawa module structure, the rational zeta morphism, its smoothed integral span and Nakamura’s classical twist-one transport. Sections 6.1–6.2 supply the scalar regulator and its noncritical analytic equality. Sections 7.1–7.2 supply non-torsion and the cohomological bound, with the stated local correction and integral image hypotheses; §§7.4–7.6 supply the distinct elliptic and ordinary Selmer bounds and the good-ordinary no-finite-submodule theorem. The Λ-rank-one assertion and rank-one Betti period factor are transported to the fundamental line here. None of the classical morphisms in §5.4 constructs a morphism over the universal deformation ring. The family target in §4.1 additionally requires the extension specified there; it remains conditional until that construction is supplied by the zeta-morphism owner.

ModularSymbolsPadicLFunctions Layer 1 supplies saturated canonical period lines; Layers 2–4 supply the ordinary analytic construction, interpolation and primitive/imprimitive level change. For the ordinary integral cohomological comparison require the exact equality `L_Kato=u L_f` with u∈O× under the same lattice, good dual pair, sign, tame component and Euler-factor normalization. A ratio in L× gives only the rational comparison. No general-weight unit claim follows solely from saturation of a modular-symbol period line.

The signed regulator supplier, PadicHodgeRegulators Layers 2–4, supplies integral Wach bases, the integral Coleman domain, Coleman maps `Col_i`, the logarithm matrix and their image computations in the LLZ range. SelmerIwasawaCohomology supplies the underlying Bloch–Kato local theory. Transport the maps' actual images under coefficient extension and basis change. To identify LLZ coordinates with separately Néron-normalized Pollack functions, require a proved O-unit period comparison for that lattice and basis; a rational coordinate multiplier is sufficient for the corresponding transported kernel but does not establish that integral analytic normalization.

### From AutomorphicCongruences

Layer 1 supplies the Skinner–Urban GU(2,2) reverse bound: for p≥3, trivial nebentypus, good ordinary f of weight k≡2 mod p−1, irreducible and p-distinguished residual representation, and a ramified q∥N, choose an imaginary quadratic K in which p and every prime of N/q split and q is inert. For the source's large Σ, supply

```text
char(X_f^Σ) char(X_(f⊗χ_K)^Σ) ⊆ (L_f^Σ L_(f⊗χ_K)^Σ).
```

Use the Selmer/period normalization of §§0.2–0.4; integral assembly uses the actual rank-one unipotent inertia element. This is Skinner–Urban Theorem 3.6.1 and Corollary 3.6.3, pp.41–42 of the author copy, together with Skinner §2.5.

Layer 2 supplies Fouquet–Wan §4.8's reverse cohomological divisibility for good ordinary f, p>2, arbitrary even weight, absolutely irreducible residual representation, distinct ordinary characters and an auxiliary ℓ∥N with residual inertia invariants of dimension one and decomposition invariants zero in the cohomological realization. The output is

```text
char(H¹_Iw/Λ z_Kato) divides char(H²_Iw).
```

Its proof uses the GU(3,1) bound, Beilinson–Flach reciprocity, Poitou–Tate and the weight-k version of the Castella–Wan argument, with the Kato twist/factor separation. No canonical/Gross period comparison is an input to this route.

Layer 4 supplies Fouquet–Wan Theorems 5.1–5.2 in the exact residual range of §§2.2 and 4.1. The pointwise output is that the zeta morphism trivializes the integral fundamental line on the trivial tame component for classical f of level Np^r. The family output is an isomorphism `Δ_Σ(T_Σ)≃Λ` over the regular subring Λ≃O[[X₁,X₂,X₃]], not over an arbitrary singular deformation or Hecke ring. All derived/local corrections in §4.2 remain attached to specialization.

Layer 5b supplies Burungale–Castella–Skinner Theorem 1.1.2: for E/ℚ, p>3 good ordinary and E[p] irreducible, the cyclotomic equality is rational; with a cyclotomic-kernel element whose Tate-module coinvariants are free of rank one, it is integral. Both use the Néron-normalized function of §3.2 and the Tate lattice, with no auxiliary Steinberg-prime hypothesis and no non-CM hypothesis on this particular theorem.

### From elliptic modularity, families and heights

EllipticCurveModularity R29.4–R29.6 supplies a newform f_E, a modular parametrization and a rational Galois comparison; use the inverse image of T_pE under the rational modular isogeny for the integral lattice. GrossZagierAndArithmeticHeights GZ.3 supplies Manin integrality and its p-unit range. An optimal parametrization gives the saturated homology/period comparison used in §3.1, while a general isogeny requires its explicit degree/index corrections.

The multiplicative argument requires `multiplicativeHidaApproximation` from PadicFamilies Layer 1 and the ordinary-family owner. For a weight-two p-new ordinary f of level pM, after a finite extension of L, this must provide, for every m>0, a good-at-p ordinary newform f_m of level M and weight k_m>2, an O[G_Q]-isomorphism T_f/p^m≃T_(f_m)/p^m identifying the ordinary lines at p, and `(L_f^Σ,p^m)=(L_(f_m)^Σ,p^m)`. Skinner §2.6, pp.16–18, (2.6.1)–(2.6.3), chooses a precision r_m with k_m≡2 mod (p−1)p^(r_m); increase r_m to at least m if desired. Weight congruence alone is not the lattice/ordinary-line comparison. Proposition 2.6.1 supplies a unit u_m∈O× comparing the specialized family function with L_(f_m); chosen generators need not be congruent without that unit. Skinner §3.1(a)–(f), pp.18–19, uses the resulting Selmer p^m-torsion isomorphism and Fitting-ideal congruence. His sets contain p; here write Σ_total=Σ∪{p} to match that convention. The current classical Hida supplier assumes p≥5. The same package of outputs at p=3 is a required extension, not an existing export or a consequence of weight congruence.

PadicFamilies Layer 3 supplies Greenberg–Stevens' derivative formula for a split multiplicative curve, via the Mazur–Kitagawa two-variable function: `L'_p(E,1)=ℒ_p(E)L(E,1)/Ω_E^+`. ColemanIntegration Layer 0 supplies log_p on ℚ_p× with log_p(p)=0. DiophantineApproximationAndTranscendence DT.5 supplies the Barré-Sirieix–Diaz–Gramain–Philibert transcendence/nonvanishing input, so ℒ_p(E)≠0 for E/ℚ. Nondegeneracy of the arithmetic p-adic height is a hypothesis, not a consequence of defining its regulator.

ArithmeticGaloisRepresentations R01.6 supplies the rank-two lifting lemma: for p≥5, a closed subgroup of SL₂(ℤ_p) surjecting modulo p is SL₂(ℤ_p). With the Weil-pairing determinant and the closed commutator subgroup, residual GL₂-surjectivity gives full p-adic GL₂ image and cyclotomic-kernel image SL₂. The introduction of Landesman–Swaminathan–Tao–Xu, p.1, records this rank-two input from Serre; their Theorem 1 concerns higher dimension.

### From the other branch owners

HeegnerPointEulerSystems HE.8b supplies rational and integral Heegner and Greenberg–BDP endpoints and the named `anticyclotomic-formulation-comparison`/`bdp-function-convention-comparison`: the BDP square convention, completed unramified coefficients, the involution and finite local cokernels. Retain the rational irreducibility versus integral surjectivity distinction and the supplier's rank-one assertions.

RankZeroOneBSD BSD.7a supplies the named CGS and Keller–Yin cyclotomic theorems, including their own integral Néron normalization, distinguished lattice, character exclusions, local-invariant and finite-submodule corrections. BSD.6a supplies the BSTW semistable a_p=0 signed theorem and its comparison, and Castella's corrected multiplicative anticyclotomic theorem with its own strict/unrestricted local conditions and coefficient extension. The Eisenstein proof supplier also requires the imaginary-quadratic main conjectures via elliptic units, the Hida–Tilouine theorem and the anticyclotomic Katz μ-invariant theorem. Those constructions are not supplied by this formulation comparison; its proof remains conditional on the branch owner discharging those inputs. Layer 6 asks only for the formulation maps on the stated endpoints. It does not construct elliptic units, imaginary-quadratic Iwasawa theory or a second anticyclotomic proof.

The elliptic-unit owner is now CMAllPrimeMainConjectures CZ.0–CZ.3. Its CZ.3 anticyclotomic character theorem currently assumes a character valued in F_p× with θ|G_v̄≠1,ω; its recorded p|h_K and Coleman/measure comparison gaps remain relevant. The broader `ellipticUnitCharacterComparison` requested by RankZeroOneBSD §11.6 must cover the finite residue fields k_O and exceptional characters of Keller–Yin. Precisely, let K be imaginary quadratic with p=v v̄ split, and take the Teichmüller lift of a continuous θ:G_K→k_O× of conductor supported at split primes. Put M_θ=O(θ)⊗Λ∨ with inverse tautological action and X_θ=H¹_Fnr(K,M_θ)∨, relaxed at v and unramified at v̄ and away from p; compute global cohomology outside a finite set containing p, the conductor and the archimedean places. With Λ=O[[Γ_K^-]] and its completed unramified coefficient extension Λ^nr, require X_θ to be finitely generated Λ-torsion, μ(X_θ)=0 and

```text
char_Λ(X_θ) Λ^nr = (L_θ)       if θ ≠ 1,
char_Λ(X_1) Λ^nr = ((γ−1)L_1)  if θ = 1.
```

These are Keller–Yin Definition 1.2.1(iii), p.13, and Theorem 1.2.2 and its proof, p.14, with their period-normalized Katz function and coefficient rings (§2, pp.31–33). They add no p∤h_K, nonanomalous or p>3 restriction. The trivial-character factor is the augmentation γ−1, not a uniformizer; it raises λ by one without raising μ. The requested CM extension must supply the integral character/module and Coleman/measure comparison in this full range. The all-prime *rational* CM theorem CZ.6 cannot replace it.

AutomorphicPadicLFunctions L3 owns Katz–Hida–Tilouine interpolation; L3h's proposed L3m owns Hida's anticyclotomic Katz μ theorem. Apply [Hida, Theorem I, p.45](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf) with p>2 unramified in the totally real field, split conductor and the exceptional condition (V) excluded in the actual branch. Its proof must use the replacement for Lemma 3.17 in [Hida's 24 July 2022 addendum, Lemma 0.2, p.1](https://www.math.ucla.edu/~hida/Addendam.pdf). Katz interpolation alone proves neither μ=0 nor an integral characteristic-ideal equality. The distinct Hida–Tilouine main-conjecture/congruence comparison requested from AutomorphicCongruences remains source-qualified there; its proposed L0c label is not a closed general export. These are requirements on the branch proof, not new constructions in this roadmap.

The general Greenberg and Coates–Perrin-Riou/Panchishkin propositions are consumed in the forms of SelmerIwasawaCohomology Layer 4 and AutomorphicPadicLFunctions Layer 5: a motive/realization, ordinary filtration, critical twists, Deligne periods, refinement and interpolation factors must all be specified. Section 5.9 verifies their modular instances only, with the indicated tame projection. No assertion about arbitrary motives follows from that verification.

### Required extensions of supplier interfaces

The following names specify requested outputs. Their statements do not certify that the owner has constructed them. The affected endpoints retain these inputs until the owner supplies their constructions and comparisons.

| Requested output | Exact use and missing comparison |
| --- | --- |
| KatoEulerSystems `universalDeformationZeta` | §4.1 specifies the deformation-algebra-linear morphism, every classical specialization square and coefficient specialization under FW Assumptions 2.1 and 3.5, including p=3. Kato §5.4's classical twist-one composite does not supply it. |
| Arithmetic cyclotomic height and `schneiderOrdinaryComparison` | §§5.6 and 5.8 require the arithmetic height with its splitting, and the flat Néron-model/Galois Selmer comparison with all alternating cohomology and finite local factors. SelmerIwasawaCohomology §3.14's determinant alone supplies neither. The arithmetic-height owner and the Selmer adapter must be routed together; nondegeneracy and Sha[p∞] finiteness remain hypotheses. |
| `katoCanonicalPeriodUnit` | §§0.4, 0.9, 1.5 and 2.3 require L_Kato=u L_f with u∈O× on the same stable lattice and literal dual, good pair, sign and tame component, retaining factorial, congruence and Euler factors. Kato §3.2's rational period quotient and saturated canonical period lines do not prove this valuation-zero comparison. |
| `wachNeronPeriodUnit` | §§4.5 and 5.10 separately require the elliptic Wach/Néron period comparison on the transported integral domain and actual Coleman images. LLZ Proposition 5.10/Corollary 5.11 only give Λ_E-unit multipliers; they do not make an independently normalized function an O-unit multiple. |
| `multiplicativeHidaApproximation` at p=3 | §1.6 needs all the lattice, ordinary-line, period-unit, Selmer and ideal congruences specified above. A p≥5 family or weight congruences alone leave the small-prime case open. |
| CM `ellipticUnitCharacterComparison` and the analytic/congruence inputs | §6.2 requires the integral exceptional-character and finite-O extension above, Hida's μ theorem in its actual range, and the branch's Hida–Tilouine comparison. The current BSD and CM owner documents still record gaps. |

This roadmap and several required external suppliers, including KatoEulerSystems, AutomorphicCongruences, RankZeroOneBSD and HeegnerPointEulerSystems, are not assigned numbered tiers in the Caraiani–Newton order. An upstream submission therefore also requires the maintainer to order their stages acyclically, including the common formulation layer used by CM and BSD. No whole-roadmap dependency cycle is licensed by the stage-level contracts above. This package neither assigns tiers to those owners nor treats a requested output as an available lower-tier theorem.

## How to read the build

`README.md` specifies the full mathematics; `Suggested.lean` records only representative definitions and statements expressible using the pinned APIs, and is not exhaustive. Layer 0 fixes the three formulations and their comparisons. Layer 1 assembles ordinary theorems with explicit residual hypotheses. Layer 2 translates the broader pointwise theorem, Layer 3 transports elliptic-curve endpoints, and Layer 4 handles the regular family base and signed image corrections. Layer 5 gives invariant changes and leading-term consequences with their precise inputs. Layer 6 compares the separately owned arithmetic branches. In a prerequisite annotation, a section number refers to this roadmap and a named external layer refers to the supplier contract above.

## Layer 0: the three cyclotomic formulations

### 0.1 The modular Iwasawa datum

A modular Iwasawa datum D = (f, p, L, T_f) consists of: an odd prime p with fixed embeddings ι_∞ : Q̄ → C and ι_p : Q̄ → Q̄_p; a newform f ∈ S_k(Γ_1(N), ε) of weight k ≥ 2; a finite extension L/Q_p containing ι_p(Q(f)), with ring of integers O, uniformiser ϖ and residue field F; the two-dimensional L-representation ρ_f : G_Q → Aut_L(V_f) of Deligne in geometric normalisation, so that for ℓ ∤ Np the geometric Frobenius has characteristic polynomial X² − a_ℓ(f)X + ε(ℓ)ℓ^{k−1} and L(V_f, s) = L(f, s); and a G_Q-stable O-lattice T_f ⊂ V_f. Put T := T_f(det ρ_f^{-1}), V := T[1/p], A := V/T (for f=f_E, the lattice chosen by the inverse-image construction in §3.1 gives T≅T_pE; an arbitrary stable lattice gives only the rational comparison), Γ := Gal(Q_∞/Q) for the cyclotomic Z_p-extension Q_∞, G_∞ := Gal(Q(μ_{p^∞})/Q) ≅ Δ × Γ with Δ ≅ (Z/p)^×, Λ := O[[Γ]], Λ(G_∞) := O[[G_∞]], γ ∈ Γ the generator corresponding to 1 + p under the cyclotomic character κ, and ι : Λ → Λ the involution induced by g ↦ g^{-1}. The residual representation ρ̄ is the reduction of T_f modulo ϖ; its semisimplification does not depend on T_f. The datum is good ordinary when p ∤ N and a_p(f) ∈ O^×; then V_f has a unique G_{Q_p}-stable line V_f^+ on which inertia acts trivially, and T^+ := (T_f ∩ V_f^+)(det ρ_f^{-1}). The ordinary datum satisfies (dist) when the two characters of G_{Q_p} on ρ̄^{ss} restricted to G_{Q_p} are distinct, and (irred) when ρ̄ is irreducible. For the multiplicative branch only, also allow a weight-two p-new form of level N₀p, p ∤ N₀, with a_p = ±1: use its unramified cohomological subline and the same saturated determinant twist (Skinner 2016 §2.1, pp.5–6). In this roadmap ordinary includes this specified semistable case; good ordinary always requires p ∤ N.

Assume p is odd and f is a newform. Require that L contains the Hecke field and, for an ordinary datum, the roots of X² − a_p X + ε(p)p^{k−1}.

Use the geometric normalisation of ρ_f as in Skinner–Urban; Kato's V_{F_λ}(f) is related to it by the dictionary of `KatoEulerSystems` Layer 2 (`hecke-dual-twist-dictionary`), and Fouquet–Wan's cohomological ρ_f (det = χ_cyc^{1−k} for trivial ε) by §2.1.

The usable interface consists of the following named outputs.

- `ModularIwasawaDatum.T`: The twisted lattice T = T_f(det ρ_f^{-1}) with its continuous G_Q-action; V = T[1/p], A = V/T.
- `ModularIwasawaDatum.residual`: The residual representation ρ̄ = T_f/ϖT_f of G_Q over F.
- `ModularIwasawaDatum.residual_ss_independent`: ρ̄^{ss} is independent of the lattice T_f (Brauer–Nesbitt); if ρ̄ is irreducible, any two lattices are homothetic.
- `ModularIwasawaDatum.changeLattice`: A G_Q-equivariant inclusion T_f' ⊂ T_f with finite cokernel induces A' → A with finite kernel; the data D' and D share V and ρ̄^{ss}.
- `ModularIwasawaDatum.extendCoefficients`: For a finite extension L'/L with ring O', the datum D ⊗ O' has lattice T_f ⊗_O O' and Iwasawa algebra Λ_{O'} = Λ ⊗_O O', faithfully flat over Λ.
- `ModularIwasawaDatum.ordinaryLine`: The saturated G_{Q_p}-stable line T^+ has free rank-one quotient T/T^+. In the good ordinary case the quotient’s character is the inverse of the unramified character of V_f^+, since T ≅ V_f^∨ rationally in dimension two. Thus T/T^+ is unramified; T^+ itself is generally ramified.
- `ModularIwasawaDatum.ofEllipticCurve`: For E/Q with newform f_E (`EllipticCurveModularity` R29.6 (`modularity-theorem`)), the datum with L = Q_p, T ≅ T_pE; T^+ is the kernel of reduction (the formal-group line) when p is good ordinary.
- `ModularIwasawaDatum.cyclotomicIdentification`: Λ ≅ O[[X]] via γ ↦ 1 + X, and Λ(G_∞) ≅ O[Δ][[Γ]] ≅ ∏_{η ∈ Δ^∨} Λ when O contains μ_{p−1}.

Take ρ_f and its integral lattices from `AutomorphicGaloisRepresentations` R19.5 (`ordinary-refinement-and-saturated-lattice`) (ordinary case) and R19.5 (`good-nonordinary-crystalline-wach-realisation`) (crystalline nonordinary case); the line V_f^+ and saturation T_f ∩ V_f^+ are the ordinary refinement supplied there (Skinner–Urban §1.1, p.2).

The twist by det ρ_f^{-1} is the one Skinner–Urban use to define their Selmer group (§1.1, p.2); for f=f_E and the chosen inverse-image lattice of §3.1, the identification T≅T_pE comes from `EllipticCurveModularity` R29.4 (`tate-module-comparison`) and the Weil pairing.

Λ, Λ(G_∞), the involution and the identification Λ ≅ O[[X]], γ ↦ 1 + X, are those of the completed group rings of `PadicMeasuresIwasawaAlgebras` Layer 1.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.1, pp.5–6.

*Needs:* `AutomorphicGaloisRepresentations` R19.5 (`ordinary-refinement-and-saturated-lattice`); `AutomorphicGaloisRepresentations` R19.5 (`good-nonordinary-crystalline-wach-realisation`); `EllipticCurveModularity` R29.4 (`tate-module-comparison`); `KatoEulerSystems` Layer 2 (`hecke-dual-twist-dictionary`); `PadicMeasuresIwasawaAlgebras` Layer 1.

**Checks.**

- For E = 11a1 (y² + y = x³ − x² − 10x − 20) and p = 7, a_7(E) = −2, so the datum is ordinary, and (dist) holds because on the cohomological ρ̄_f the sub-character is unramified and the quotient has the nontrivial inertia character ω⁻¹; on the determinant-twisted Tate representation these roles are dual.
- For an upper-triangular two-dimensional representation whose residual characters are 1 and ω, a stable lattice and an isogenous stable lattice have the same residual semisimplification 1 ⊕ ω even when their extension classes differ. Residual semisimplification, rather than equality of matrices or extension classes, is the lattice-independent output.
- For f = f_E of weight two and trivial character, det ρ_f = χ_cyc^{-1} in geometric normalisation, so with §3.1’s chosen lattice T=T_f(χ_cyc)≅T_pE; a definition omitting the twist would give T_pE^∨, whose Selmer group is not the p^∞-Selmer group of E.
- For E = 14a1 and p = 5, a_5 = 0, so the datum is not ordinary and has no unramified G_{Q_5}-stable line.
- For f = f_E attached to 11a1 (weight 2, N = 11, ε = 1) and p = 7: a_7 = −2 ∈ Z_7^×, so the datum is ordinary; the unit root α of X² + 2X + 7 is congruent to −2 mod 7.
- Changing T_f to ϖT_f gives the same T up to the isomorphism multiplication by ϖ; changing it to a non-homothetic lattice changes T but not ρ̄^{ss}.

### 0.2 The ordinary Selmer group over Q_∞ and its dual

For a good ordinary modular Iwasawa datum and a finite set Σ of primes not containing p, the Σ-imprimitive ordinary Selmer group is Sel^Σ(Q_∞, A) := the subgroup of H¹(Q_∞, A) of classes that are unramified at every finite place of Q_∞ not above p or Σ and whose restriction to the decomposition group at the unique place above p maps to zero in H¹(Q_{∞,p}, A^−); Sel(Q_∞, A) is the case Σ=∅. For a weight-two multiplicative datum replace the decomposition-group target at p by H¹(I_{∞,p},A^−), as in Skinner §2.3; this is the inertia-kernel version. Its Pontryagin dual X^Σ := Hom_cont(Sel^Σ(Q_∞, A), Q_p/Z_p) is a finitely generated Λ-module, with the scalar-dual Λ-action fixed under Conventions. The same construction over Q(μ_{p^∞}) gives a Λ(G_∞)-module X^Σ(G_∞) whose η-components, for η ∈ Δ^∨, are obtained by the explicit discrete-coefficient twist A⊗η⁻¹ over Q_∞, with the local conditions twisted as well; a modular-form identification additionally uses the Hecke dual/twist dictionary.

The datum is either good ordinary or the explicitly specified weight-two multiplicative datum, with the corresponding local condition just stated.

Take Σ finite with p∉Σ and relax the conditions at its primes.

Finite generation over Λ is unconditional; torsion is a theorem under hypotheses (§0.3), never part of the definition.

The usable interface consists of the following named outputs.

- `OrdinarySelmer.mem_iff`: A class c∈H¹(Q_∞,A) lies in Sel^Σ iff it is unramified away from pΣ and loc_p(c) maps to zero in H¹(Q_{∞,p},A^−) in the good ordinary case, or in H¹(I_{∞,p},A^−) in the multiplicative case.
- `OrdinarySelmer.dual`: X^Σ = Hom_cont(Sel^Σ, Q_p/Z_p) with (λ·φ)(c)=φ(λc), the scalar-dual convention.
- `OrdinarySelmer.dual_fg`: X^Σ is a finitely generated Λ-module.
- `OrdinarySelmer.relax`: For Σ' ⊂ Σ there is an exact sequence 0 → (⊕_{ℓ∈Σ∖Σ'} H¹(Q_{∞,ℓ}, A))^∨ → X^Σ → X^{Σ'} → 0 when X^Σ is torsion and T* has no nonzero G_Q-invariants. Require also Σ ∪ {p} to contain every prime where T ramifies, as in Skinner–Urban Proposition 3.2.18.
- `OrdinarySelmer.changeLattice`: A finite-index inclusion of lattices induces a map of Selmer groups whose kernel and cokernel are annihilated by a bounded power of ϖ; they need not be finite over an infinite tower. The duals become isomorphic over Λ[1/p]. Under residual irreducibility, compare homothetic lattices by the equivariant scalar isomorphism, giving equal integral characteristic ideals.
- `OrdinarySelmer.extendCoefficients`: X^Σ(D ⊗ O') ≅ X^Σ(D) ⊗_O O' as Λ_{O'}-modules.
- `OrdinarySelmer.ofEllipticCurve`: For the datum of E/Q at a good ordinary p, Sel(Q_∞, A) = lim_n Sel_{p^∞}(E/Q_n), Mazur's Selmer group.
- `OrdinarySelmer.etaComponent`: With e_η = |Δ|⁻¹Σ_δ η(δ)⁻¹δ, e_ηX(G_∞)=D_Λ(e_ηSel(G_∞)). By restriction/corestriction it identifies with the scalar dual of the Selmer module of A⊗η⁻¹ over Q_∞, including the twisted local conditions. No assertion that a p-ramified modular twist has good ordinary level is implicit.

Instantiate the Greenberg local condition `SelmerIwasawaCohomology` Layer 2 (`greenberg-condition`) at p with F^+ = T^+ and the unramified condition `SelmerIwasawaCohomology` Layer 2 (`unramified-condition`) away from pΣ, over the cyclotomic tower; the global group is `SelmerIwasawaCohomology` Layer 2 (`galois-selmer-group`) in its discrete form and the dual is `SelmerIwasawaCohomology` Layer 2 (`pontryagin-dual`).

Skinner–Urban define the condition at p as vanishing in H¹(Q_{∞,p}, A^−) (§1.1, p.2). Since Q_{∞,p}/Q_p is totally ramified, the kernel of H¹(Q_{∞,p}, A^-) → H¹(I, A^-) is A^-/(φ − 1)A^-, which is zero whenever the unramified Frobenius eigenvalue on A^−=(T/T^+)⊗_O L/O is not 1. This proves the good ordinary comparison. For split multiplicative reduction α=1, the kernel is A^−≅L/O and must be retained; Skinner’s main conjecture uses the inertia-kernel Selmer group, not his auxiliary strict group S (Skinner §2.3, pp.8–12).

Finite generation of X^Σ follows from that of H¹(Q_Σ'/Q_∞, A)^∨ over Λ (`SelmerIwasawaCohomology` Layer 3 (`iwasawa-finiteness-euler`)) by Nakayama over the compact local ring Λ (`PadicMeasuresIwasawaAlgebras` Layer 5).

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17 and Proposition 3.2.18, pp.26–27; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.1 and §2.5, p.15; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, p.1.

*Needs:* `SelmerIwasawaCohomology` Layer 2 (`greenberg-condition`); `SelmerIwasawaCohomology` Layer 2 (`unramified-condition`); `SelmerIwasawaCohomology` Layer 2 (`galois-selmer-group`); `SelmerIwasawaCohomology` Layer 2 (`pontryagin-dual`); `SelmerIwasawaCohomology` Layer 3 (`iwasawa-finiteness-euler`); §0.1; `PadicMeasuresIwasawaAlgebras` Layer 5.

**Checks.**

- At split multiplicative reduction α=1, A^−/(φ−1)A^−=A^−≅L/O, whereas for α≠1 multiplication by φ−1 on the divisible module A^− is surjective and this quotient is zero. Thus these local conditions cannot be identified in the split case.
- If the unramified Frobenius eigenvalue on T/T^+ is not 1 (e.g. E = 11a1 at p = 7, eigenvalue the unit root α ≡ −2 mod 7), the strict and inertial conditions at p define the same Selmer group.
- At ℓ ≠ p the unramified and strict conditions over Q_∞ agree, because Gal(Q_ℓ^{ur}/Q_{∞,w}) has profinite order prime to p; a definition imposing the Bloch–Kato finite condition gives the same group.
- For E = 11a1, p = 7, the Γ-coinvariants of the dual relate to Sel_{7^∞}(E/Q) with finite kernel and cokernel (Mazur control), and Sel_{7^∞}(E/Q) is finite since E(Q) and Sha(E/Q)[7^∞] are finite.
- The definition does not assert that X is Λ-torsion: torsion is the theorem of Kato (17.4(1)); a construction that builds torsion into the definition would make §0.3 vacuous.
- For E = 11a1 and p = 7, Sel(Q_∞, A) is the p^∞-Selmer group Sel_{7^∞}(E/Q_∞) of Mazur, and X its dual (Burungale–Castella–Skinner §1.1, p.1).
- Relaxing Σ: X^Σ surjects onto X with kernel the dual of ⊕_{ℓ∈Σ} H¹(Q_{∞,ℓ}, A) (Skinner–Urban Proposition 3.2.18, p.27) when X is torsion and T* has no G_Q-fixed vectors. Here Σ ∪ {p} contains the ramification set.

### 0.3 Structure of the ordinary Selmer dual

Let D be an ordinary modular Iwasawa datum with trivial character. (1) X^Σ is finitely generated over Λ. (2) If p ∤ N, then X is Λ-torsion (Kato 17.4(1)); for f = f_E with E/Q non-CM and good ordinary or multiplicative at p, Z_∞ = Sel(E/Q_∞)^∨ is torsion. (3) If X^Σ is torsion, ρ̄ is irreducible, and Greenberg's local hypotheses hold (for the quoted Rubin elliptic case: E non-CM and good ordinary at p and p ∤ ∏_{q|N} #E(Q_q)_tors), then X^Σ has no nonzero finite Λ-submodule. (4) Under (3), char_Λ(X^Σ) = Fitt_Λ(X^Σ) is principal, and char_Λ(X^Σ) does not depend on the lattice T_f.

Assume the datum is ordinary with trivial character.

The non-elliptic torsion assertion in (2) requires p∤N.

The assertion in (3) needs X^Σ torsion and the local hypotheses of Greenberg's theorem; for Σ-imprimitive X^Σ Skinner–Urban Lemma 3.2.17(i) gives the absence of pseudo-null submodules of the local terms.

The Fitting comparison in (4) is over Λ ≅ O[[X]] for modules with no nonzero finite submodule and projective dimension one.

Assertion (1) is §0.2’s finiteness.

Assertion (2) is Kato Theorem 17.4(1) as supplied by `KatoEulerSystems` Layer 7 (`ordinary-selmer-divisibility`), and for elliptic curves `KatoEulerSystems` Layer 7 (`elliptic-ordinary-and-multiplicative-divisibility`) (Rubin III.5.14–5.16).

Assertion (3) is Greenberg’s theorem in the form `SelmerIwasawaCohomology` Layer 3 (`selmer-no-pseudonull`), and for elliptic curves Rubin Corollary 5.17 (`KatoEulerSystems` Layer 7 (`elliptic-no-finite-iwasawa-submodule`)).

Assertion (4) is `SelmerIwasawaCohomology` Layer 3 (`selmer-fitting-characteristic`); lattice independence follows because irreducible ρ̄ forces homothetic lattices (Skinner–Urban §1.1, p.2).

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 17.4(1), p.273; [Karl Rubin](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter III, Theorem 5.16 and Corollary 5.17, p.53; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17(i), p.26; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.3.

*Needs:* §0.2; `KatoEulerSystems` Layer 7 (`ordinary-selmer-divisibility`); `KatoEulerSystems` Layer 7 (`elliptic-ordinary-and-multiplicative-divisibility`); `KatoEulerSystems` Layer 7 (`elliptic-no-finite-iwasawa-submodule`); `SelmerIwasawaCohomology` Layer 3 (`selmer-no-pseudonull`); `SelmerIwasawaCohomology` Layer 3 (`selmer-fitting-characteristic`).

**Checks.**

- For E = 11a1, p = 7: E has good ordinary reduction at 7, and E(Q_11) ≅ Q_11^×/q^Z for a Tate parameter q of 11-adic valuation 5, whose torsion subgroup has order dividing (11 − 1)·5 = 50, hence prime to 7; so Z_∞ has no nonzero finite submodule.
- Skinner's proof of Theorem A uses exactly (3)–(4): Ch^Σ(f_m) = F^Σ(f_m) for each member f_m of the Hida family (Skinner §1, p.3).

### 0.4 The ordinary p-adic L-function with canonical periods

For an ordinary datum with trivial character and p ∤ N, let α be the unit root of X² − a_p X + p^{k−1} and Ω_f^± the canonical periods of f (generators of the saturated integral period lattices, defined up to O^× ∩ Q(f)). The ordinary p-adic L-function L_f ∈ Λ is the unique element such that for every finite-order character φ of Γ with φ(γ) = ζ a primitive p^{t−1}-th root of unity and every integer 0 ≤ m ≤ k − 2, φκ^m(L_f) = e(φκ^m)·p^{t'(m+1)} m! L(f, χ_φ^{-1}ω^{-m}, m+1) / ((−2πi)^{m+1} G(χ_φ^{-1}ω^{-m}) Ω_f^{sgn((−1)^m)}), with e the interpolation factor built from α, as in Skinner–Urban §1.1 with the correction in Skinner 2016, §2.4, footnote 6 (p.14). For a finite set Σ of primes not containing p, L_f^Σ := L_f · ∏_{ℓ∈Σ} P_{T,ℓ}(ℓ^{-1}γ_ℓ^{-1}), where P_{T,ℓ}(Y)=det(1−Y·Frob_ℓ | V_{I_ℓ}) uses inertia coinvariants of V=T[1/p], Frob_ℓ is arithmetic and γ_ℓ is its image in Γ (Skinner §2.3, pp.8–9); these are the same factors as on the Selmer side. L_f lies in Λ (not only Λ[1/p]) because the canonical periods are integral normalisations. Here χ_φ is the primitive p-power-order Dirichlet character with χ_φ(1+p) = ζ⁻¹, p^{t′} is the conductor of ω^mχ_φ, κ is the cyclotomic character with κ(γ)=1+p, and G is the Gauss sum. For the weight-two multiplicative branch replace α by a_p = ±1 and use the multiplicative interpolation factor of Skinner §2.4; the trivial value has one factor 1−α⁻¹. The integral normalization is Skinner–Urban’s canonical normalization. Its identification with a particular saturated modular-symbol lattice and Kato good dual pair must retain any period scalar; integral transport requires the period-unit comparison stated in §0.9. Write P_f^± := −2πi Ω_f^± for the corresponding differential/modular-symbol periods. If the modular-symbol supplier calls its periods Ω, first translate that notation to P_f; do not substitute P_f for the cohomological Ω_f in this formula.

To make the interpolation factor explicit, put ψ=χ_φω^m and let p^n be its **primitive** conductor (n=0 for ψ=1). In the good ordinary case use

```text
e(φκ^m) = α^(−n)                                  if n>0,
e(φκ^m) = (1−p^m/α)(1−p^(k−2−m)/α)                if n=0.
```

Thus t′=n in the displayed interpolation value. These are the primitive-character and untwisted factors of Kato Theorem 16.2(i)–(ii), p.269, transported through the period dictionary above. In the weight-two multiplicative case the n>0 factor is again α^(−n), while n=0 gives the single factor 1−α⁻¹. The unit root α is nonzero, every Gauss sum is nonzero, and 0!=1. At m=0 and ψ=1, good ordinary reduction gives (1−α⁻¹)(1−p^(k−2)/α), in particular the square (1−α⁻¹)² in weight two. The conductor exponent n must not be confused with an index t for which a trivial root of unity is written as a primitive p^(t−1)-th root.

Assume good ordinarity, p∤N and trivial character.

Use the canonical periods supplied by `ModularSymbolsPadicLFunctions` Layer 1 (`integral-period-lattices`); a different choice changes L_f by an element of O^×.

The measure is the ordinary branch of `ModularSymbolsPadicLFunctions` Layer 2 (`ordinary-integral-measure`) restricted to the cyclotomic Z_p-direction through the twist by ω^{-m}.

The coefficient lattice is the one compatible with the specified canonical normalization. If a supplier measure uses a different lattice, carry its scalar rather than infer it is an O-unit.

The usable interface consists of the following named outputs.

- `ordinaryPadicL`: L_f ∈ Λ = O[[Γ]] for an ordinary datum with chosen canonical periods.
- `ordinaryPadicL_interpolation`: The interpolation formula of Skinner–Urban §1.1 at every φκ^m, 0 ≤ m ≤ k−2. Use exponent m+1 for Skinner–Urban’s cohomological Ω_f, or exponent m after replacing it by P_f=−2πiΩ_f.
- `ordinaryPadicL_unique`: An element of Λ satisfying the interpolation formula at infinitely many characters equals L_f.
- `ordinaryPadicL_period_unit`: Canonical periods are defined up to O^× ∩ Q(f); replacing them by other canonical periods replaces L_f by a unit multiple, so the ideal (L_f) ⊂ Λ is independent of that choice.
- `ordinaryPadicL_depleted`: L_f^Σ = L_f ∏_{ℓ∈Σ} P_{T,ℓ}(ℓ^{-1}γ_ℓ^{-1}), and L_f^Σ ≠ 0 iff L_f ≠ 0 (each Euler factor is a nonzero element of Λ).
- `ordinaryPadicL_extendCoefficients`: For O ⊂ O', L_f computed over O' is the image of L_f under Λ → Λ_{O'}.
- `ordinaryPadicL_ne_zero`: L_f ≠ 0 by the nonvanishing of the required critical twists (Rohrlich), supplied by `KatoEulerSystems` Layer 7 (`nonvanishing-of-the-zeta-submodule-at-height-zero`). The value s=1 is central only in weight two.

Take the ordinary integral measure μ_{f,α} on Z_p^× of `ModularSymbolsPadicLFunctions` Layer 2 (`ordinary-integral-measure`) with the period lattice normalisation of `ModularSymbolsPadicLFunctions` Layer 1 (`integral-period-lattices`). Translate the supplier’s differential period P_f to Ω_f=P_f/(−2πi) before writing the interpolation formula.

Push it to Γ through the projection Z_p^× → 1 + pZ_p ≅ Γ after the appropriate Teichmüller twist; interpolation and uniqueness are `ModularSymbolsPadicLFunctions` Layer 2 (`interpolation-and-uniqueness`).

The Σ-depleted function is the primitive/imprimitive comparison `ModularSymbolsPadicLFunctions` Layer 4 (`primitive-imprimitive-level-change`).

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 16.2(i)–(ii), p.269 (primitive-conductor interpolation factors); [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Conjecture 3.5.5, p.41, with the Σ-imprimitive L_f^Σ of §3.4; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.1; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4, pp.13–15; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4, equation (2.4.1) and footnote 6, p.14.

*Needs:* `ModularSymbolsPadicLFunctions` Layer 2 (`ordinary-integral-measure`); `ModularSymbolsPadicLFunctions` Layer 1 (`integral-period-lattices`); `ModularSymbolsPadicLFunctions` Layer 2 (`interpolation-and-uniqueness`); `ModularSymbolsPadicLFunctions` Layer 4 (`primitive-imprimitive-level-change`); §0.1.

**Checks.**

- In weight two only Ω_f^+ enters the interpolation formula (m = 0); replacing Ω_f^+ by uΩ_f^+ with u ∈ O^× replaces L_f by u^{-1}L_f and keeps the ideal, while replacing it by ϖΩ_f^+ replaces the ideal (L_f) by (ϖ^{-1}L_f), so the integral equality can hold for at most one of the two normalisations.
- For E = 11a1 and p = 7, the trivial-character value of the Néron-normalised function is (1 − α^{-1})² L(E,1)/Ω_E^+ = (1 − α^{-1})²/5 with α ≡ −2 mod 7, a nonzero element of Z_7.
- For Σ = ∅, L_f^Σ = L_f.
- L_f is integral (in Λ), not merely in Λ[1/p]: using Shimura's transcendental periods without saturating the period lattice gives a function in Λ[1/p] whose ideal may differ from (L_f) by a power of ϖ.
- Replacing Ω_f by P_f=−2πiΩ_f changes the denominator (−2πi)^{m+1}Ω_f to (−2πi)^m P_f, not to (−2πi)^{m+1}P_f. In weight two the Néron comparison uses P_f.
- In weight two, changing Ω_f^+ by a unit u ∈ O^× multiplies L_f by u^{-1} and leaves the ideal (L_f) unchanged; changing it by ϖ changes (L_f) by ϖ^{-1}, so the integral equality of §0.5 is sensitive to the period normalisation.
- For E = 11a1 and p = 7 at the trivial character: L(E,1)/Ω_E^+ = 1/5, so the value of the Néron-normalised function at the trivial character is (1 − α^{-1})² · 1/5, a 7-adic unit times (1 − α^{-1})² (Colmez Remark 0.10 with b = 1).

### 0.5 The Iwasawa–Greenberg main conjecture for an ordinary form

For an ordinary datum D with trivial character and p ∤ N, and a finite set Σ of primes not containing p, IMC^Σ(D) is the proposition: X^Σ is a torsion Λ-module and char_Λ(X^Σ) = (L_f^Σ) as ideals of Λ. The rational form IMC^Σ_Q(D) asserts the same equality in Λ[1/p] = Λ ⊗_{Z_p} Q_p. For f = f_E it is Mazur's main conjecture in the normalisation of §3.3. The proposition is a statement, not an axiom: conditional consequences explicitly list it as an assumption (in particular Schneider’s leading-term implication).

Assume a good ordinary datum with trivial character and p∤N.

Fix the canonical periods of §0.4.

The characteristic ideal is that of `PadicMeasuresIwasawaAlgebras` Layer 4 (charIdeal over the UFD Λ ≅ O[[X]]).

The usable interface consists of the following named outputs.

- `IMC`: IMC^Σ(D) : Prop, the integral equality char_Λ(X^Σ) = (L_f^Σ) with X^Σ torsion.
- `IMC_rational`: IMC^Σ_Q(D) : Prop, the same equality in Λ[1/p].
- `IMC.toRational`: IMC^Σ(D) → IMC^Σ_Q(D).
- `IMC.iff_of_sigma`: IMC^Σ(D) ↔ IMC^{Σ'}(D) for finite Σ, Σ' not containing p.
- `IMC.iff_extendCoefficients`: IMC(D) ↔ IMC(D ⊗ O') for a finite extension O'/O.
- `IMC.iff_divisibilities`: For X^Σ finitely generated torsion and L_f^Σ integral and nonzero, IMC^Σ(D) ↔ (L_f^Σ) ⊂ char(X^Σ) ∧ char(X^Σ) ⊂ (L_f^Σ). Without the torsion hypothesis the right side is not a replacement for the definition.
- `IMC.greenberg_instance`: IMC_Q(D) is the case V = V_f ⊗ det^{-1} of the Greenberg proposition `SelmerIwasawaCohomology` Layer 4 (`greenberg-main-conjecture`), with L_p(V) = L_f.

Form X^Σ (§0.2) and L_f^Σ (§0.4).

Use the characteristic ideal of `PadicMeasuresIwasawaAlgebras` Layer 4 §4.6; the rational form compares ideals after extension of scalars to Λ[1/p].

The integral statement is meaningful only after the period normalisation is fixed; Skinner–Urban §1.1 (p.2) note the characteristic ideal depends on T_f only through its ϖ-adic valuation, and not at all when ρ̄ is irreducible.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2 and Conjecture 3.5.5, p.41; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Conjecture 2.5.1, p.15; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), §13.5.3, Conjecture 13.21, p.71; Appendix B.2.3, Theorem B.4, p.80.

*Needs:* §0.2; §0.4; `PadicMeasuresIwasawaAlgebras` Layer 4; `SelmerIwasawaCohomology` Layer 4 (`greenberg-main-conjecture`).

**Checks.**

- IMC(D) implies IMC_Q(D). Algebraically (ϖ) and (1) become equal in Λ[1/p] but differ in Λ, so a definition identifying the rational and integral forms fails this test.
- Replacing the canonical period of a weight-two form by ϖ times it turns a true integral equality into a false one, while the rational statement IMC_Q is unchanged: the proposition must carry the period normalisation.
- For Σ = ∅, IMC^Σ is the primitive statement char(X) = (L_f).
- For V = V_f ⊗ det^{-1}, r_V = 0 and `SelmerIwasawaCohomology` Layer 4 (`greenberg-main-conjecture`) with L_p(V) = L_f is IMC_Q(D).
- IMC^Σ(D) for one Σ is equivalent to IMC^{Σ'}(D) for every Σ' (§5.1).
- IMC(D) implies IMC_Q(D); the converse holds when μ(X) = μ(L_f) (§5.3).

### 0.6 Iwasawa cohomology, the zeta element and the fundamental line

For a modular Iwasawa datum with the lattice T_K in Kato's normalisation (the dictionary of `KatoEulerSystems` Layer 2 (`hecke-dual-twist-dictionary`)), put H^i(T_K) := lim_n H^i_et(Z[ζ_{p^n}, 1/p], j_*T_K) for i = 1, 2, Λ(G_∞)-modules, and RΓ_Iw(T_K) the corresponding perfect complex of Λ(G_∞)-modules with j_* conditions (extension by zero is not used; ramified primes keep the j_* condition). The Iwasawa fundamental line is the invertible Λ(G_∞)-module Δ_Iw(T_K) := Det^{-1}_{Λ(G_∞)} RΓ_Iw(T_K) ⊗ Det^{-1}_{Λ(G_∞)} (T_K ⊗ Λ(G_∞))(−1)^+, and Kato's zeta element z_f ∈ H¹(T_K) ⊗ Q (`KatoEulerSystems` Layer 5 (`integral-zeta-submodule-and-finite-index`), the Λ-module Z(f, T_K) generated by Kato's zeta elements) defines, through the zeta morphism T_K(−1)^+ → H¹, a trivialisation triv_z : Δ_Iw(T_K) ⊗ Frac → Q(Λ(G_∞)). The same construction over Q_∞ (Λ in place of Λ(G_∞)) gives Δ_Iw over Λ = O[[Γ]], the form used by Fouquet–Wan. Here Q(Λ(G_∞)) denotes the total quotient ring, a product of fraction fields of the η-components, not a field. The primitive j_* complex is used only with its perfectness and local comparison hypotheses. For general family coefficients use Fouquet–Wan Definition 3.18’s modified local factors, not an unconditional j_* complex.

Assume p is odd.

H¹(T_K) torsion-free of Λ-rank one and H²(T_K) torsion (Kato Theorem 12.4) are theorems, used to identify the determinant with an invertible fractional ideal.

The {p}-partial complex over Z[1/p] is the one in Kato's Conjecture 12.10; the Σ-partial complex over Z[1/Σ] is used in families and changes Δ by Euler factors.

The j_* / continuous comparison is only the supported comparison in the indicated degrees; do not infer a complex equivalence from the H¹ edge sequence alone.

The usable interface consists of the following named outputs.

- `iwasawaH1`: H¹(T_K) = lim_n H¹_et(Z[ζ_{p^n},1/p], j_*T_K) as a Λ(G_∞)-module.
- `iwasawaH2`: H²(T_K), a torsion Λ(G_∞)-module.
- `fundamentalLine`: Δ_Iw(T_K), an invertible Λ(G_∞)-module.
- `fundamentalLine.triv`: triv_z : Δ_Iw(T_K) → Q(Λ(G_∞)) induced by the zeta morphism.
- `fundamentalLine.changeLattice`: A finite-index inclusion T'_K ⊂ T_K induces Δ_Iw(T'_K) ≅ Δ_Iw(T_K) compatible with triv_z.
- `fundamentalLine.baseChange`: For a perfect complex C, det(C) ⊗ S ≅ det(C ⊗^L S) for every ring map. Identifying the latter complex and zeta map with the specialised arithmetic objects is additional: Σ-partial objects commute with the stated derived base changes; the primitive modified line requires relative purity and Iwasawa suitability (Fouquet–Wan Proposition 3.20, pp.31–32; Propositions 3.22–3.23, p.33).
- `fundamentalLine.divisor`: div(triv_z(Δ_Iw)) = Σ_𝔭 (length H²_𝔭 − length (H¹/Λz)_𝔭)[𝔭] over height-one primes 𝔭.
- `fundamentalLine.sigmaPartial`: Retain both the local determinant factors and the zeta factors. For primitive versus Σ-partial zeta maps, Proposition 3.28, p.35 gives z_primitive = (∏_{ℓ∈Σ∖{p}} Eul_ℓ(V^*(1)))⁻¹ z_Σ in the total fraction algebra. These factors need not be units; integral comparison uses their compatible local lines.

Iwasawa cohomology and its finiteness are `SelmerIwasawaCohomology` Layer 3 (`iwasawa-cohomology`) and `SelmerIwasawaCohomology` Layer 3 (`iwasawa-finiteness-euler`); the étale/continuous comparison is `SelmerIwasawaCohomology` Layer 3 (`etale-iwasawa-comparison`).

The determinant functor and the height-one divisor of an acyclic-after-Frac perfect complex are `PadicMeasuresIwasawaAlgebras` Layer 5 §5.1 and `SelmerIwasawaCohomology` Layer 3 (`selmer-determinant`).

The classical zeta morphism is Kato's (`KatoEulerSystems` §§5.1 and 5.4, `rational-kato-zeta-morphism` and `nakamura-twisted-zeta-morphism`); Fouquet–Wan Definition 3.3 and Theorem 3.4 record it as the {p}-partial zeta morphism z(f)_Iw. The universal deformation-ring construction is a separate required extension in §4.1, rather than a consequence of classical twist-one transport.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Definition 3.3, p.23, and Theorem 3.4, p.24; [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §12.10, pp.223–224.

*Needs:* `SelmerIwasawaCohomology` Layer 3 (`iwasawa-cohomology`); `SelmerIwasawaCohomology` Layer 3 (`iwasawa-finiteness-euler`); `SelmerIwasawaCohomology` Layer 3 (`etale-iwasawa-comparison`); `SelmerIwasawaCohomology` Layer 3 (`selmer-determinant`); `PadicMeasuresIwasawaAlgebras` Layer 5; `KatoEulerSystems` Layer 5 (`integral-zeta-submodule-and-finite-index`); `KatoEulerSystems` Layer 5 (`rational-kato-zeta-morphism`); `KatoEulerSystems` Layer 2 (`hecke-dual-twist-dictionary`); §0.1.

**Checks.**

- If H¹ = Λ·z' with z = (γ − 1)z' and H² ≅ Λ/(γ − 1), the divisor of triv_z(Δ_Iw) is zero, i.e. triv_z is an isomorphism.
- If z generates H¹ and H² = 0, then triv_z(Δ_Iw) = Λ.
- If z=e generates H¹=Λe and H²=Λ/(X²), the fractional ideal triv_z(Δ_Iw) is (X²), of divisor +2[X]. If H²=0 and z=X²e, it is X⁻²Λ, of divisor −2[X]. These unequal-length cases fix the inverse determinant, including its overall sign.
- With Det in place of Det^{-1} the divisor changes sign: a definition using Det would make Kato's divisibility read in the wrong direction.
- For cohomology in degrees one and two the divisor equals char H² / char(H¹/Λz) as in `SelmerIwasawaCohomology` Layer 3 (`selmer-determinant`).
- When H¹(T_K) is free of rank one and H²(T_K) is torsion, the divisor of triv_z(Δ_Iw) is char(H²) − char(H¹/Λz) (`SelmerIwasawaCohomology` Layer 3 (`selmer-determinant`) with the inverse-determinant sign convention).
- Replacing T_K by an isogenous lattice changes neither Δ_Iw ⊗ Frac nor triv_z (Fouquet–Wan p.5: the fundamental line is independent of the lattice up to canonical isomorphism).

### 0.7 Kato's main conjecture for modular forms

For a modular Iwasawa datum with lattice T_K in Kato's normalisation and a character η of Δ, KMC^η(T_K) is the proposition: the η-component of the zeta module Z(f, T_K) lies in H¹(T_K)^η and char_{Λ}(H¹(T_K)^η / Z(f, T_K)^η) = char_{Λ}(H²(T_K)^η). KMC(T_K) is the conjunction over η, equivalently (when H¹ is free of rank one) the assertion that the zeta morphism trivialises Δ_Iw(T_K): triv_z(Δ_Iw(T_K)) = Λ(G_∞). The rational form KMC_Q compares the ideals in Λ[1/p]. Over Q_∞ (η = 1 and Λ = O[[Γ]]) this is Fouquet–Wan's Conjecture 1.5 for M(f).

Assume p is odd. In contrast, at p=2 Kato’s statement excludes height-one primes containing 2.

The definition permits arbitrary nebentypus and does not need ε=1.

No reduction type at p is assumed: the proposition makes sense for supercuspidal π(f)_p.

The usable interface consists of the following named outputs.

- `KMC`: KMC^η(T_K) : Prop for η ∈ Δ^∨; KMC(T_K) := ∀ η, KMC^η(T_K).
- `KMC_rational`: The equality of ideals in Λ[1/p].
- `KMC.iff_triv`: When H¹(T_K) is free of rank one: KMC(T_K) ↔ triv_z(Δ_Iw(T_K)) = Λ(G_∞).
- `KMC.iff_reverse_divisibility`: Under Kato's (12.5.2), KMC^η ↔ char(H²)^η ⊂ char(H¹/Z)^η.
- `KMC.changeLattice`: KMC_Q is independent of the lattice; KMC is independent of the lattice when ρ̄ is irreducible.
- `KMC.fw_form`: The η = 1 component over Q_∞ is Fouquet–Wan Conjecture 1.5 under the dictionary §2.1.

State the equality using the Λ-modules of §0.6 and the characteristic ideal of `PadicMeasuresIwasawaAlgebras` Layer 4 on η-components (the isotypic decomposition of `PadicMeasuresIwasawaAlgebras` Layer 4 §4.6).

The equivalence with the fundamental-line form is §0.8.

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Conjecture 12.10, pp.223–224; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Conjecture 1.5, p.6, and Conjecture 3.24, p.34; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Conjecture 6.2 and Remark 6.3, p.43.

*Needs:* §0.6; `PadicMeasuresIwasawaAlgebras` Layer 4; `KatoEulerSystems` Layer 7 (`cohomological-divisibility-one-direction`).

**Checks.**

- If H¹ = Λz' and Z = Λ(γ−1)z', then KMC holds iff char H² = (γ − 1).
- KMC(T_K) → KMC_Q(T_K), and the converse fails in general: the rational form says nothing about μ.
- KMC predicts nothing about the specialisation of z at the finitely many characters where the L-value vanishes (Fouquet–Wan footnote 1, p.6); it is not Fouquet–Wan's Conjecture 1.3.
- If H² = 0 and Z = H¹, KMC holds with both characteristic ideals equal to Λ.
- Kato Theorem 12.5 gives the inclusion char(H¹/Z) ⊂ char(H²) under (12.5.2) (`KatoEulerSystems` Layer 7 (`cohomological-divisibility-one-direction`)), so KMC is the reverse divisibility.
- LLZ Remark 6.3: the η-component formulation is Kobayashi's §5 form of Kato's Conjecture 12.10.

### 0.8 Zeta basis versus characteristic ideals

Let λ be an Iwasawa-suitable classical specialisation in the sense of Fouquet–Wan Definition 3.12 (in particular ρ̄ satisfies their Assumption 2.1 and there is ℓ ∥ N, ℓ ≠ p, with dim ρ̄^{I_ℓ} = 1). Then H¹(T_λ,Iw) is free of rank one over O_Iw, the integral cone C of z(λ)_Iw has cohomology H¹/z in degree one and H² in degree two, while C ⊗ Frac(O_Iw) is acyclic (V_λ,Iw in Lemma 3.13 already denotes fraction-field coefficients), and consequently: z(λ)_Iw is a basis of Δ_Iw(T_λ) iff char H²(T_λ,Iw) = char(H¹(T_λ,Iw)/O_Iw·z(λ)_Iw). Moreover Kato's divisibility char(H¹/z) ⊂ char(H²) holds integrally for such λ.

Use Fouquet–Wan Assumption 2.1 (ρ̄|G_{Q(√p*)} absolutely irreducible; no extension 0 → χ₁ → ρ̄|G_{Q_p} → χ₂ → 0 with χ₁^{-1}χ₂ ∈ {1, χ̄_cyc}) and Assumption 3.7.

Require λ to be Iwasawa-suitable in the direction of Fouquet–Wan Definition 3.12: λ has values in a domain A and contains an O-valued specialization ψ through a local ring map A→O, with T_ψ and T_ψ*(1) both relatively pure and z(ψ)_Iw nonzero. Relative purity of λ follows from Lemma 3.11; it does not replace purity of both representations at ψ. For an O-valued classical λ one may take ψ=λ when these conditions hold.

For the integral Euler-system bound, retain the genuine unipotent inertia lift supplied by the auxiliary Steinberg prime; residual unipotence alone is insufficient.

H¹ is torsion-free by vanishing of H⁰ of the reductions modulo regular sequences (Assumption 2.1), of depth two, hence free of rank one by Auslander–Buchsbaum–Serre (Fouquet–Wan Lemma 3.13).

At the auxiliary Steinberg prime choose an actual inertia element σ acting unipotently on the characteristic-zero lattice and nontrivially modulo ϖ; then T_λ/(σ − 1)T_λ is free of rank one. An arbitrary lift of a residual unipotent does not suffice; this verifies Kato's hypotheses in place of the SL₂(Z_p)-image condition, using the actual free rank-one quotient as part of the local input, giving the integral divisibility and torsion of H².

With cohomology in degrees one and two only, the determinant of the cone is computed by §0.6's divisor formula.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Lemma 3.13 and its proof, pp.26–27; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Definitions 3.8, 3.9, 3.12, Proposition 3.10, Lemma 3.11, pp.25–26; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Conjecture 1.5, p.6.

*Needs:* §0.6; `KatoEulerSystems` Layer 7 (`cohomological-divisibility-one-direction`); `KatoEulerSystems` Layer 5 (`nakamura-twisted-zeta-morphism`); `SelmerIwasawaCohomology` Layer 3 (`selmer-determinant`).

**Checks.**

- For E = 14a1 at p = 13, ℓ = 2: ord_2 Δ = 6 is prime to 13, so ρ̄ is ramified at 2 with unipotent inertia image, dim ρ̄^{I_2} = 1, and the theorem applies.
- The equivalence fails to make sense without freeness of H¹: if H¹ had torsion, Λ·z would not determine the line.
- An O-valued classical λ with pure T_λ and T_λ*(1) and nonzero z(λ)_Iw passes the suitability test with ψ=λ and the identity local map.
- A domain-valued λ containing a pure point ψ but with z(ψ)_Iw=0 fails the test; generic purity alone cannot supply the nonzero zeta trivialization.
- The specialization must factor through A→O. A map O→A in the opposite direction, without the required contained point, is not a witness to Definition 3.12.

### 0.9 Kato's main conjecture versus the ordinary main conjecture

Let D be an ordinary datum with trivial character, p ∤ N, p odd, with α the unit root, and let L_{p-adic,α,ω,γ}(f) be Kato's p-adic zeta function for a good pair (ω, γ) for the dual lattice. For every height-one prime 𝔭 of Λ not containing p there is an exact sequence of Λ_𝔭-modules 0 → (H¹/Z)_𝔭 → (H¹_loc/H¹_loc')_𝔭/(image of Z) → X_𝔭 → H²_𝔭 → 0 (Kato (17.13.1) localised), whose middle term has length ord_𝔭(L_{p-adic,α,ω,γ}(f)) by the Coleman map; hence length(X_𝔭) = ord_𝔭(L_{p-adic}) iff length(H²_𝔭) = length((H¹/Z)_𝔭). If in addition ρ̄ is irreducible and the integral representation has an actual unipotent element in the cyclotomic kernel with free rank-one coinvariants (or satisfies Kato's (12.5.2)), and p≠2, the same holds at 𝔭 = (ϖ). Consequently KMC(T_K), on the η-component matched with D by Kato's twist T ↦ T(k) in (17.13.1), is equivalent to IMC(D), and KMC_Q to IMC_Q, once L_{p-adic,α,ω,γ}(f) is identified with L_f for the canonical periods (with the integral period-unit comparison in Exact supplier contracts).

Assume good ordinarity at an odd p with p∤N.

(ω, γ) good for the dual lattice in Kato's sense (17.5), so Kato's p-adic L-function is integral.

At the height-one prime (ϖ), require Kato’s (12.5.2), or residual irreducibility together with the actual rank-one unipotent substitute of Skinner §2.5 and Fouquet–Wan Lemma 3.13.

Euler and Tamagawa corrections: the sequence uses j_* conditions away from p and the Coleman image at p; no correction is discarded.

For the conclusion involving canonical L_f integrally, separately assume the O-unit period comparison specified in Exact supplier contracts. The exact-sequence length identity itself uses Kato’s specified analytic term.

Take the limit of the Poitou–Tate sequences for T(r) over Q(ζ_{p^n}) (`SelmerIwasawaCohomology` Layer 2 (`selmer-structure-poitou-tate`), `SelmerIwasawaCohomology` Layer 3 (`iwasawa-selmer-duality`)) to get Kato (17.13.1).

Show lim H¹_c of the strict condition vanishes (17.13.2) because the image of Z already has Λ-rank one, identify the local quotient with the Coleman map image (17.9; `PadicHodgeRegulators` Layer 3 (`rubin-coleman-map`)) and use finiteness of H²_loc (17.13.4).

Kato's scalar reciprocity (`KatoEulerSystems` §§6.1–6.2, built from §3.4 `generalised-explicit-reciprocity-law-for-zeta-elements`) identifies the Coleman image of z with L_{p-adic,α,ω,γ}(f).

Compare lengths at each height-one prime; both directions of the equivalence follow from the additivity of length in the four-term sequence.

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §17.13, pp.279–280; [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.6, p.274; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Lemma 4.50, p.65.

*Needs:* §0.7; §0.5; `SelmerIwasawaCohomology` Layer 2 (`selmer-structure-poitou-tate`); `SelmerIwasawaCohomology` Layer 3 (`iwasawa-selmer-duality`); `PadicHodgeRegulators` Layer 3 (`rubin-coleman-map`); `KatoEulerSystems` §§3.4 and 6.1–6.2 (`generalised-explicit-reciprocity-law-for-zeta-elements`); `KatoEulerSystems` Layer 7 (`ordinary-selmer-divisibility`).

**Checks.**

- Kato 17.13 derives Theorem 17.4(2)–(3) from Theorem 12.5 by this sequence, and remarks (p.274) that Conjecture 12.10 implies the ordinary main conjecture 17.6; the length identity gives the converse as well.
- Fouquet–Wan Lemma 4.50 is the analogous equivalence with the signed or v^∨-Selmer group in place of X.

### 0.10 Signed Selmer groups from Coleman maps

Let D be a datum with p ∤ N whose local representation at p is crystalline, and fix a good basis ν₁, ν₂ of D_cris and its lift n₁, n₂ to the Wach module (LLZ §3.3, Lemma 3.15), giving Coleman maps Col_i : H¹_Iw(Q_p, T_K) → Λ_E(G_∞), i = 1, 2 (`PadicHodgeRegulators` Layer 4 (`signed-local-condition`)). For n ≥ 0 let H¹_f(Q_{p,n}, A^*)_i be the orthogonal complement, under the local Tate pairing between H¹(Q_{p,n}, T_K) and H¹(Q_{p,n}, A^*), of the image of ker(Col_i) in H¹(Q_{p,n}, T_K); here A^* is the discrete module paired with T_K in LLZ's Definition 6.4. The i-th signed Selmer group is Sel^i(Q(μ_{p^∞}), A^*) := lim_n ker(Sel(Q(μ_{p^n}), A^*) → H¹(Q_{p,n}, A^*)/H¹_f(Q_{p,n}, A^*)_i), with Bloch–Kato conditions away from p, and X^i := its Pontryagin dual, a finitely generated Λ(G_∞)-module.

Assume p∤N and V_f|G_{Q_p} crystalline, and fix the Wach-module basis; the groups depend on that basis.

For supersingular f, LLZ’s assumption (A) (k ≥ 3 or a_p = 0) and for good ordinary f assumption (A') (k ≥ 3 and V_f not locally split) are needed for cotorsion, not for the definition.

The usable interface consists of the following named outputs.

- `SignedSelmer.localCondition`: H¹_f(Q_{p,n}, A^*)_i, the annihilator of ker(Col_i) at level n.
- `SignedSelmer.dual`: X^i, the Pontryagin dual of Sel^i, a finitely generated Λ(G_∞)-module.
- `SignedSelmer.poitouTate`: The exact sequence H¹(T_K) → Im(Col_i) → X^i → H²(T_K) → 0, injective on the left when X^i is torsion and H¹(T_K) is torsion-free of rank one, as in LLZ Theorem 6.1 and the nonvanishing range of Theorem 6.5.
- `SignedSelmer.changeBasis`: For actual target basis b′ = b B, Col′ = B⁻¹Col in column convention, and the new signed groups use the new coordinate kernels. A general Wach basis change requires computing its induced Λ-coordinate matrix first.
- `SignedSelmer.etaComponent`: η-components X^{i,η} for η ∈ Δ^∨ over Λ.
- `SignedSelmer.ordinary_case`: For good ordinary f with the basis of LLZ §3.6, the relation (3) of LLZ p.6 gives L̃_{p,α} = ū·L̃_{p,2} with ū ∈ Λ_E(G_∞)^×, so the second Coleman map carries Kato's class to the unit-root p-adic L-function up to a unit. The analytic quotient in SMC still retains the actual image of that map.

The local condition on H¹_Iw(Q_p, T_K) is `PadicHodgeRegulators` Layer 4 (`signed-local-condition`) (the kernel of Col_j for the chosen good Wach basis, `PadicHodgeRegulators` Layer 4 (`good-wach-basis`)); its orthogonal complement at each finite layer is `SelmerIwasawaCohomology` Layer 1 (`orthogonal-complement`).

Glue with the Bloch–Kato conditions away from p (`SelmerIwasawaCohomology` Layer 2 (`selmer-data`)) and take the direct limit; finite generation of the dual as for §0.2.

The Poitou–Tate sequence H¹(T_K) → Im(Col_i) → X^i → H²(T_K) → 0 (LLZ (60)) records how X^i sits between Kato's modules.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), §6.2, Definition 6.4 and sequence (60), p.43; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), §3.3, assumptions (A)–(D), p.14.

*Needs:* `PadicHodgeRegulators` Layer 4 (`signed-local-condition`); `PadicHodgeRegulators` Layer 4 (`good-wach-basis`); `SelmerIwasawaCohomology` Layer 1 (`orthogonal-complement`); `SelmerIwasawaCohomology` Layer 2 (`selmer-data`); §0.1; §0.6.

**Checks.**

- Choose two actual Coleman coordinate systems with Col′₁ = Col₁ and Col′₂ = Col₂ − Col₁. For independent coordinate maps, the second kernels differ, so signed groups must retain their coordinate choice. This is an explicit constant Λ-coordinate transformation, not a formula for arbitrary Wach matrices.
- For E = 14a1 and p = 5 (a_5 = 0), the two signed Selmer groups for the basis of LLZ Proposition 5.10 are Kobayashi's Sel^−(E/Q_∞) and Sel^+(E/Q_∞).
- In the displayed kernel construction, if ker Col_i = 0 then its annihilator is all local H¹ and the extra restriction is void: the result is the starting Bloch–Kato Selmer group. A construction starting from H¹ with only away-p conditions would instead give the relaxed-at-p group; these two starting objects must not be confused.
- For a change b′ = b B of the actual good Λ-basis of (φ*N(T))^(ψ=0), the coordinate column changes by B⁻¹. A Wach-module change U first induces a change through φ and the Mellin comparison; its matrix must not be substituted for B without proof.
- For a_p = 0 and the basis of LLZ Proposition 5.10, X^1 and X^2 are Kobayashi's minus and plus Selmer duals (§4.5).

### 0.11 The signed main conjecture with the Coleman-image term

For the data of §0.10, put L̃_{p,i} := Col_i(loc_p z_Kato) ∈ Λ_E(G_∞). The i-th signed main conjecture SMC^{i,η} is the proposition: X^{i,η} is Λ-torsion and char_Λ(X^{i,η}) = char_Λ(Im(Col_i)^η / Λ·L̃^η_{p,i}). Only when Im(Col_i)^η is computed to be Λ (or Λ_E rationally) does it simplify to char(X^{i,η}) = (L̃^η_{p,i}).

The Coleman-image correction is part of the statement; replacing it by the principal ideal (L̃_{p,i}) is a separate theorem (§4.4).

L̃_{p,i} depends on the Wach basis; it is related to the unbounded refined functions L̃_{p,α}, L̃_{p,β} by the logarithm matrix M of LLZ Theorem 3.25 (`PadicHodgeRegulators` Layer 4 (`logarithmic-matrix`)).

Fix the integral Coleman domain and its actual finitely generated Λ-lattice I_i = Im Col_i inside Λ_E. For an integral statement require Z(f,T_K) ⊂ H¹(T_K), L̃_{p,i} ∈ I_i and L̃_{p,i}^η ≠ 0. The quotient I_i^η/Λ L̃^η is then a finitely generated torsion Λ-module even if I_i is fractional.

The usable interface consists of the following named outputs.

- `SMC`: SMC^{i,η} : Prop, the equality with the Coleman-image term.
- `SMC_rational`: The same equality after extending both modules to Λ[1/ϖ] on the chosen tame component.
- `SMC.of_image_eq_top`: If Im(Col_i)^η = Λ then SMC^{i,η} ↔ char(X^{i,η}) = (L̃^η_{p,i}).
- `SMC.changeBasis`: Whenever each chosen integral good basis and index satisfies the torsion, nonvanishing and exact-sequence hypotheses of signed-cohomological-comparison, its corrected image-quotient assertion is equivalent to KMC. An arbitrary basis or index outside that range has no such asserted equivalence.
- `SMC.kobayashi_form`: At a_p = 0 and weight two, the LLZ maps have the Kobayashi kernels (1 = minus, 2 = plus). Translating analytic ideals uses the explicit Coleman images and period scalars. Proposition 5.10/Corollary 5.11 give rational unit comparisons; an integral equality of Pollack ideals also requires an integral unit normalization.

Form X^{i,η} and the Λ-submodule Im(Col_i)^η ⊂ Λ_E(G_∞)^η; the quotient by L̃^η_{p,i} is torsion when L̃^η_{p,i} ≠ 0 (LLZ Corollary 3.29, Proposition 3.39).

Take char_Λ of the actual fractional-lattice quotient, retaining its integral Λ-module structure. LLZ Remark 6.7 does not force inversion of p: a fractional embedding of a finitely generated lattice does not change its coefficient ring. The rational version separately tensors both modules with E.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Corollary 6.6, p.44; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 1.3 (= Theorem 3.25), p.5, and Remark 6.7, p.44.

*Needs:* §0.10; `PadicHodgeRegulators` Layer 4 (`actual-coleman-image`); `PadicHodgeRegulators` Layer 4 (`logarithmic-matrix`); `PadicMeasuresIwasawaAlgebras` Layer 4; §0.6.

**Checks.**

- For an elliptic curve with a_p=0, LLZ Proposition 5.21 gives Im(Col_2)=(Σ_{δ∈Δ}δ)Λ(G∞)+XΛ(G∞). On a nontrivial tame component this is (X), so the principal-ideal statement char(X^{2,η})=(L̃^η_{p,2}) differs from SMC^{2,η} by char(Λ/(X)). On the trivial component the image is all of Λ, since p−1 is a unit. This checks the definition on every component without asserting that the theorem proves every component.
- If Im(Col_i) = Λ, SMC^i is the principal-ideal statement.
- For good ordinary f with LLZ's §3.6 basis, (L̃_{p,2}) = (L̃_{p,α}) as ideals of Λ_E(G_∞), because ū is a unit (LLZ (3), p.6); the numerator of SMC² is therefore a unit multiple of the unit-root function. Its analytic quotient still contains Im(Col₂); this comparison alone does not show that the image is Λ_E.
- If Im(Col_i)^η = Λ, the proposition reads char(X^{i,η}) = (L̃^η_{p,i}).
- At a_p = 0 and weight two, the LLZ maps have the Kobayashi kernels (1 = minus, 2 = plus). Translating analytic ideals uses the explicit Coleman images and period scalars. Proposition 5.10/Corollary 5.11 give rational unit comparisons; an integral equality of Pollack ideals also requires an integral unit normalization.

### 0.12 The signed reformulation of Kato's main conjecture

Assume LLZ's (A) if f is supersingular at p, or (A') if f is good ordinary, and (E): some basis of T_f has image of Gal(Q̄/Q(μ_{p^∞})) containing SL₂(Z_p). Then for each η ∈ Δ^∨ (with i = 1 for every η and i = 2 for η trivial): X^{i,η} is Λ-torsion, there is an exact sequence 0 → (H¹/Z)^η → (Im(Col_i)/L̃_{p,i})^η → X^{i,η} → H²^η → 0, and KMC^η(T_K) ⟺ SMC^{i,η}. Without (E) the same holds rationally, and the divisibility ϖ^{n_i}L̃^η_{p,i} ∈ char(X^{i,η}) holds for some n_i ≥ 0.

(A) for supersingular f: k ≥ 3 or a_p = 0; (A') for good ordinary f: k ≥ 3 and V_f not locally split at p.

(E) for the integral statement; the unipotent substitute of §1.2 supplies Kato's integral inputs but the equivalence as printed uses (E).

The η-restriction for i = 2 is LLZ's.

L̃^η_{p,i} ≠ 0 under (A) or (A') (LLZ Corollary 3.29, Proposition 3.39), so the cokernel of H¹(T_K) → Im(Col_i) is torsion; with H² torsion (Kato) X^i is torsion.

As in Kobayashi Theorem 7.3, the first map of (60) is injective, giving (61); taking characteristic ideals in the four-term sequence gives the equivalence (LLZ Corollary 6.6).

Kato's divisibility Theorem 6.1(d)–(e) (`KatoEulerSystems` Layer 7 (`cohomological-divisibility-one-direction`)) gives the divisibility in Theorem 6.5.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 6.1, Theorem 6.5 and its proof, Corollary 6.6, pp.43–44; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Corollary 3.29, p.20, and Proposition 3.39, p.22.

*Needs:* §0.7; §0.11; §0.10; `KatoEulerSystems` Layer 7 (`cohomological-divisibility-one-direction`); `SelmerIwasawaCohomology` Layer 2 (`selmer-structure-poitou-tate`); `PadicHodgeRegulators` Layer 3 (`explicit-reciprocity`).

**Checks.**

- For E = 14a1 at p = 5: a_5 = 0 gives (A); the mod-5 representation is surjective (5 is not among the nonmaximal primes 2, 3 of 14a1), hence the 5-adic image is GL₂(Z_5) and (E) holds.
- The comparison is Kato-side; it proves no divisibility by itself.

### Examples

For a rank-one module over Λ with z = X²e and a torsion degree-two term Λ/(X²), both characteristic ideals are (X²). Replacing z by ϖz multiplies only the zeta quotient ideal by (ϖ): a rational comparison does not prove the integral equality. For the signed image I = (X) and z_i = X², multiplication by X identifies I/(z_i) with Λ/(X), whose characteristic ideal is (X), whereas the ideal (z_i) is (X²). These are separate tests of the integral and image conventions.

### Dependencies

Use PadicMeasuresIwasawaAlgebras Layers 1, 4 and 5, SelmerIwasawaCohomology Layers 1–4, KatoEulerSystems Layers 2–7, ModularSymbolsPadicLFunctions Layers 1–4, ArithmeticGaloisRepresentations R01, and the signed regulator contract stated above. No arithmetic carrier in this layer is manufactured from an unspecified proposition.


## Layer 1: ordinary theorems and residual hypotheses

### 1.1 Residual hypotheses of the main theorems

For a two-dimensional representation ρ̄ : G_Q → GL_F(W) over a finite field F of characteristic p > 2, with decomposition and inertia groups D_ℓ ⊃ I_ℓ at each prime ℓ, define the following predicates. (irred): W has no G_Q-stable line. (dist) at p: ρ̄|D_p has a D_p-stable line on which D_p acts by χ̄₁ with quotient χ̄₂ and χ̄₁ ≠ χ̄₂. (SU_q): q ≠ p, q ∥ N and ρ̄(I_q) ≠ 1. (FW1.6_ℓ), in Fouquet–Wan's cohomological normalisation (det ρ̄ = χ̄_cyc^{1−k}): ℓ ≠ p, ℓ ∥ N, dim_F W^{I_ℓ} = 1 and dim_F W^{D_ℓ} = 0. (FWexp_ℓ(μ)): ℓ ≠ p and ρ̄|D_ℓ is a nonsplit extension 0 → μχ̄_cyc^{1−k/2} → ρ̄|D_ℓ → μχ̄_cyc^{−k/2} → 0 with μ unramified quadratic or trivial and ρ̄(I_ℓ) ≠ 1. (LocExc_p): there is no character χ̄ of D_p with (ρ̄|D_p)^{ss} ≅ χ̄ ⊕ χ̄χ̄_cyc. (ScalarExc_p): there is no χ̄ with (ρ̄|D_p)^{ss} ≅ χ̄ ⊕ χ̄. (Im): there is σ ∈ G_{Q(μ_{p^∞})} with T/(σ − 1)T free of rank one over O, for a lattice T lifting ρ̄. These predicates are evaluated on the chosen residual representation. Residual semisimplification is lattice-independent; extension and ramification data need not be. Under residual irreducibility all stable lattices are homothetic, so their residual representations agree up to isomorphism. (Im) is an integral condition on T.

Assume p is odd.

The normalisation of ρ̄ matters for (FW1.6_ℓ): in the homological normalisation (det = χ̄_cyc^{k−1}) the inertia-invariant line carries a different character.

Here k is the weight of the form under consideration; (FWexp_ℓ) uses k even, automatic for trivial nebentypus.

The usable interface consists of the following named outputs.

- `ResidualHyp.irred`: Irreducibility of ρ̄ over F.
- `DistinctCharacters`: (dist): the two characters of D_p on the ordinary filtration differ; for reducible ρ̄|D_p this is also (ScalarExc_p).
- `IsRamifiedAt`: (SU_q), local part: some element of I_q acts nontrivially (the condition q ∥ N is on the level).
- `FWAuxiliaryCondition`: (FW1.6_ℓ), local part: dim W^{I_ℓ} = 1 and dim W^{D_ℓ} = 0, in cohomological normalisation.
- `ResidualHyp.fwExplicit`: (FWexp_ℓ(μ)): the explicit twisted-Steinberg extension with μ unramified quadratic (possibly trivial), ρ̄|I_ℓ ≠ 1.
- `LocalExclusion`: (LocExc_p) for reducible ρ̄|D_p with Jordan–Hölder characters χ₁, χ₂: the pair is not {χ, χω}.
- `ScalarExclusion`: (ScalarExc_p): (ρ̄|D_p)^{ss} is not χ̄ ⊕ χ̄; equal to DistinctCharacters in the reducible case and automatic in the irreducible case.
- `HasRankOneCoinvariants`: For an O-linear endomorphism σ of T, this means that T/(σ−1)T admits an O-linear equivalence with O. This is the free rank-one condition, rather than rational rank one alone.
- `HasRankOneImage`: (Im): some σ in the given subgroup has HasRankOneCoinvariants (ρ σ), i.e. T/(σ − 1)T ≅ O.
- `FWAuxiliaryCondition.isRamifiedAt`: For dim W = 2, (FW1.6_ℓ) implies IsRamifiedAt, i.e. (FW1.6_ℓ) → (SU_ℓ).
- `localExclusion_one_iff`: With ω = 1, LocalExclusion χ₁ χ₂ 1 ↔ DistinctCharacters χ₁ χ₂.
- `ResidualHyp.fwAux_iff_nonsplit_weight_two`: For k = 2 and ℓ ∥ N multiplicative with ρ̄(I_ℓ) ≠ 1: (FW1.6_ℓ) ↔ μ nontrivial ↔ nonsplit multiplicative reduction at ℓ.
- `ResidualHyp.suAux_im`: (SU_q) → (Im) (§1.2).
- `ResidualHyp.ramified_iff_not_pth_power`: For E/Q with multiplicative reduction at ℓ ≠ p: ρ̄_{E,p}(I_ℓ) ≠ 1 ↔ p ∤ ord_ℓ(Δ_E^{min}).
- `ResidualHyp.locExc_ordinary_weight_two`: For E good ordinary at p > 3 with unit root α: (LocExc_p) ↔ ᾱ² ≠ 1; for p = 3 it always fails.

Evaluate the residual predicates on finite-dimensional restrictions of ρ̄ to D_ℓ, I_ℓ or G_Q, using Mathlib's Representation.invariants for fixed subspaces. The predicates HasRankOneCoinvariants and HasRankOneImage instead concern the integral lattice T: residual dimensions alone do not detect torsion in T/(σ−1)T.

At a Steinberg prime ℓ ≠ p, inertia acts unipotently. For an elliptic curve, after the unramified quadratic extension in the nonsplit case, its residual inertia action is nontrivial iff p ∤ ord_ℓ(q_E) = ord_ℓ(Δ_min). This is an inertia criterion: divisibility of the valuation does not assert that q_E is a p-th power in Q_ℓ itself, where a unit obstruction can remain.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 1, p.2 and Theorem 3.6.4, p.43; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorems 1.1, 1.6, 1.7, pp.3, 6–7; Assumption 2.1, p.17; Theorem 5.1, p.68; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2, p.2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16.

*Needs:* Mathlib `Representation.invariants`; Mathlib `ContRepresentation`; TauCetiRoadmap.EllipticCurves Layer 4; §0.1.

**Checks.**

- For 11a1 (Δ = −11^5, split at 11) and p = 7: (irred) holds (only 5-isogenies), (SU_11) holds (7 ∤ 5), (FW1.6_11) fails (split, so the inertia-invariant line is D_11-fixed in cohomological normalisation), (LocExc_7) holds (ā_7 = −2, and 4 ≢ 1 mod 7), (Im) holds via τ ∈ I_11.
- For 14a1 (Δ = −2^6·7^3, nonsplit at 2, split at 7) and p = 13: (FW1.6_2) holds (13 ∤ 6 and nonsplit), (SU_2) and (SU_7) hold, and a_13 = −4 is a 13-adic unit.
- In the homological normalisation (W = E[p]) the D_ℓ-invariants of the inertia-invariant line vanish iff ψ(ℓ)ℓ ≢ 1 mod p (ψ the unramified quadratic character of the reduction type); for 11a1 at p = 7 this holds although (FW1.6_11) fails in Fouquet–Wan's normalisation, so a definition in the wrong normalisation admits curves the theorem does not cover.
- For E good ordinary at p = 3, ā_3 ∈ {1, 2} = {±1} mod 3, so (LocExc_3) fails for every such curve.
- For T = O² and σ = [[1, 1], [0, 1]], T/(σ − 1)T ≅ O, so (Im) holds; for σ = 1 and for [[1, ϖ], [0, 1]] it fails.
- Weight two, cohomological normalisation, ℓ ∥ N_E multiplicative, ρ̄ ramified at ℓ: (FW1.6_ℓ) ⟺ E has nonsplit multiplicative reduction at ℓ ⟺ (FWexp_ℓ(μ)) with μ nontrivial; for k > 2 the dimension condition (FW1.6_ℓ) means μ(ℓ)ℓ^{1−k/2} ≢ 1 mod ϖ, which is neither implied by nor implies μ nontrivial.
- (SU_q) ⟸ (FW1.6_q): the second is strictly stronger; E = 11a1 at p = 7 satisfies (SU_11) but not (FW1.6_11), since 11a1 is split at 11.

- For `ResidualHyp.irred`, 11a1 at p=7 and 14a1 at p=13 pass by the nonsquare Frobenius discriminants computed in §5.10. The two-dimensional trivial representation fails, and 11a1 at p=5 fails because its rational 5-torsion gives a stable line. Oddness at p>2 promotes the stated irreducibility to absolute irreducibility.
- For `ScalarExclusion`, the scalar pair (1,1) fails, the pair (1,ω) with ω≠1 passes, and an irreducible two-dimensional local representation passes. Thus scalar exclusion differs from `LocalExclusion`, which rejects (1,ω).
- For `ResidualHyp.fwExplicit`, weight-two 14a1 at ℓ=2, p=13 passes with nontrivial unramified quadratic μ. Weight-two 11a1 at ℓ=11, p=7 passes with μ trivial although its decomposition-invariant vanishing condition fails. The direct sum μ⊕μω⁻¹ fails the ramified-extension condition, even when μ is nontrivial.
- For `IsRamifiedAt`, scalar multiplication of F₇× on F₇ is ramified on the full group; a trivial representation is unramified on every subgroup, and restriction of any representation to the identity subgroup is unramified.
- For `FWAuxiliaryCondition`, let D=F₇××F₇× act diagonally on F₇² and let I=ker(fst). Then dim W^I=1 and dim W^D=0. With I trivial in dimension two the first dimension is 2, so the condition fails. With D=I=ker(fst), both invariant dimensions are 1: the first condition passes and the zero decomposition-invariants condition fails. This detects omission of the second condition.
- For `DistinctCharacters`, the trivial and tautological characters of F₇× differ. An equal pair fails, including the pair of trivial characters; reversing a pair preserves distinctness.
- For `LocalExclusion`, each pair (1,ω) and (ω,1) fails. On F₇× with ω tautological, the pair (1,ω²) passes: ω has order 6, so neither ω²=ω nor ω³=1. At ω=1 the predicate agrees with distinctness, rather than excluding every pair.
- For `HasRankOneCoinvariants`, the standard unipotent on O² passes; the identity fails because the quotient is O²; the upper-right-ϖ unipotent fails because its quotient has nonzero ϖ-torsion. These tests apply over an arbitrary DVR, including equal characteristic, not just ℤ_p.
- For `HasRankOneImage`, the natural representation of GL₂(O) on O² with the full subgroup passes by the standard unipotent. A trivial rank-two representation on any subgroup fails; the identity subgroup in any rank-two representation also fails. A rational rank-one quotient with integral torsion is not a witness.

The representative Lean tests use the actual predicates and quotient modules. The scalar ramification witness is multiplication by 2 in F₇; the nonadjacent-character test evaluates at 3∈F₇×, of order six. Evaluation at 2 alone cannot reject the reversed exceptional pair, since 2³=1. The standard unipotent quotient test works over every commutative ring: its range is the kernel of the second-coordinate map. The identity and identity-subgroup failures work over every nontrivial commutative ring with the strong rank condition. Neither test needs a DVR. All the arithmetic and normalization checks elsewhere in this README remain prose checks; isolated numerical identities do not stand in for tests of the arithmetic constructions.

The following boundary checks are named mathematical targets in `Suggested.lean`, rather than admitted examples. Their full statements are these §1.1 checks, with the indicated coefficient hypotheses.

| Target | Statement |
| --- | --- |
| `fwAuxiliary_independentCharacters` | Over F₇, the product of the two tautological unit characters, restricted to I=ker(fst) inside D=F₇××F₇×, has invariant dimensions one and zero. |
| `not_fwAuxiliary_bot` | Over any field, a two-dimensional representation with trivial inertia cannot satisfy `FWAuxiliaryCondition`, for any decomposition subgroup. |
| `not_rankOneCoinvariants_uniformizer` | Over any DVR O with irreducible ϖ, the matrix [[1,ϖ],[0,1]] fails `HasRankOneCoinvariants`, since its quotient is O/(ϖ)⊕O. |
| `hasRankOneImage_fullAutomorphismGroup` | Over any DVR, the natural action of the full linear automorphism group on O² satisfies `HasRankOneImage` on the full subgroup. |

### 1.2 A ramified multiplicative prime gives a rank-one quotient

Let T be a free O-module of rank two with a continuous G_Q-action ρ, and q ≠ p a prime at which ρ restricted to I_q is unipotent and nontrivial modulo ϖ (as for a newform with q ∥ N, trivial character, and ρ̄ ramified at q). For τ ∈ I_q mapping to a topological generator of the tame quotient, ρ(τ) is unipotent, ρ̄(τ) ≠ 1, T/(ρ(τ) − 1)T is free of rank one over O, and τ ∈ G_{Q(μ_{p^∞})}. More generally, any σ with ρ(σ) unipotent and ρ̄(σ) ≠ 1 has T/(ρ(σ) − 1)T ≅ O.

Require q∥N with π(f)_q an unramified twist of Steinberg, so that inertia acts unipotently on V_f (local–global compatibility).

Require ρ̄(I_q)≠1.

Local–global compatibility at q (`AutomorphicGaloisRepresentations` R19.4 (`conductor-and-local-factors-classical`)) makes ρ(I_q) unipotent through the tame quotient.

For a unipotent u ≠ 1 mod ϖ on O², u − 1 has rank one modulo ϖ, so its image is a saturated rank-one submodule and the cokernel is free of rank one (elementary divisors).

The prime q is unramified in Q(μ_{p^∞}), so I_q ⊂ G_{Q(μ_{p^∞})}.

The source for this target is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), proof of Lemma 3.13, pp.26–27.

*Needs:* Mathlib `Matrix.toLin'`; `AutomorphicGaloisRepresentations` R19.4 (`conductor-and-local-factors-classical`); §1.1.

**Checks.**

- The matrix [[1, ϖ],[0, 1]] is unipotent with cokernel O/ϖ ⊕ O of (u − 1): it is not free, which is why ρ̄(τ) ≠ 1 is needed.
- Applied with q = 11 for 11a1 at p = 7, this gives (Im) for Burungale–Castella–Skinner Theorem 1.1.2(b).
- Residual unipotence is insufficient even with determinant one: g = [[1,1],[ϖ,1+ϖ]] lies in SL₂(O), but det(g−1) = −ϖ ≠ 0, ker(g−1) = 0 and coker(g−1) ≅ O/ϖ. The characteristic-zero unipotence hypothesis is essential.

### 1.3 The Skinner–Urban ordinary main conjecture

Let p ≥ 3, f ∈ S_k(Γ_0(N)) a newform with trivial character, ordinary at p with respect to L, p ∤ N, k ≡ 2 mod (p − 1), (irred) and (dist) for ρ̄, and a prime q ≠ p with q ∥ N and ρ̄ ramified at q. Then for every finite set Σ of primes not containing p, X^Σ is Λ-torsion and char_Λ(X^Σ) = (L_f^Σ) in Λ: IMC^Σ holds integrally. In weight two this is the form p ≥ 3, f ordinary, ρ̄ irreducible, q ∥ N with ρ̄ ramified at q.

Assume p≥3, trivial character and k≡2 mod p−1; the weight congruence is automatic for k=2.

(dist) is automatic in weight two for p odd, the cohomological quotient having inertia character ω⁻¹ while the sub-character is unramified.

For integrality, Skinner–Urban state the result under an SL₂(Z_p)-image hypothesis; Skinner §2.5 shows (irred) and the ramified q suffice, via §1.2.

Reverse divisibility (L_f^Σ L_{f⊗χ_K}^Σ) ⊃ Ch^Σ(f)Ch^Σ(f⊗χ_K) for an imaginary quadratic K in which p splits, the prime divisors of N/q split and q is inert: the GU(2,2) Eisenstein congruence argument of Skinner–Urban Theorem 3.6.1 and Corollary 3.6.3, owned by `AutomorphicCongruences` Layer 1.

Kato's divisibilities (L_f^Σ) ⊂ Ch^Σ(f) and (L_{f⊗χ_K}^Σ) ⊂ Ch^Σ(f⊗χ_K) (`KatoEulerSystems` Layer 7 (`ordinary-selmer-divisibility`)), made integral by §1.2 as in Skinner §2.5.

If the first Kato inclusion were strict the product inclusion would be strict, contradicting the reverse divisibility; so (L_f^Σ) = Ch^Σ(f) (Skinner–Urban proof of Theorem 3.6.4).

Independence of Σ: §5.1; the statement for Σ = ∅ follows.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.6.4 and its proof, pp.43–44; Theorem 1, p.2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Theorem 2.5.2 and the following paragraph, pp.15–16; Theorem A, p.1; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2.

*Needs:* `AutomorphicCongruences` Layer 1; `KatoEulerSystems` Layer 7 (`ordinary-selmer-divisibility`); §1.2; §1.1; §0.5; §0.3.

**Checks.**

- E = 11a1, p = 7: k = 2, a_7 = −2 unit, (irred), q = 11 ∥ 11 with 7 ∤ ord_11(Δ) = 5, so IMC holds integrally for 11a1 at 7.
- E = 14a1, p = 13: q = 2 (13 ∤ 6) or q = 7 (13 ∤ 3) works; a_13 = −4 is a unit.

### 1.4 The Fouquet–Wan ordinary theorem

Let p > 2, f ∈ S_k(Γ_0(N)) an eigencuspform with p ∤ N and k ≥ 2, such that: ρ̄_f is absolutely irreducible; (FW1.6_ℓ) holds for some ℓ ∥ N (in Fouquet–Wan's cohomological normalisation); and ρ_f|G_{Q_p} is an extension 0 → χ₁ → ρ_f|G_{Q_p} → χ₂ → 0 with χ̄₁ ≠ χ̄₂. Then char(H¹(Z[1/p], T ⊗ Λ_Iw)/Λ_Iw·z(f)_Iw) divides char(H²(Z[1/p], T ⊗ Λ_Iw)), and together with Kato's divisibility this gives KMC^{η=1} over Q_∞ (Fouquet–Wan Conjecture 1.5) integrally.

Assume p>2, p∤N, trivial character and k≥2, without a congruence condition on k.

(FW1.6_ℓ) in cohomological normalisation; in weight two it means nonsplit multiplicative reduction at ℓ with ρ̄ ramified there.

Require the ordinary filtration to have distinct residual characters.

Kato's divisibility in this range: Fouquet–Wan Lemma 3.13 verifies its hypotheses (§0.8; `KatoEulerSystems` Layer 7 (`cohomological-divisibility-one-direction`)).

Reverse divisibility: Fouquet–Wan §4.8 — choose the auxiliary imaginary quadratic K as in §4.6, prove the two-variable Rankin–Selberg Iwasawa–Greenberg main conjecture over K by reducing it, through Beilinson–Flach explicit reciprocity and Poitou–Tate, to the GU(3,1) divisibility Theorem 7.32, in weight k (Castella–Wan Theorem 3.8 in weight two); then descend with Kato's result. The whole reverse-divisibility route is owned by AutomorphicCongruences Layer 2, which also needs `KatoEulerSystems` Layers 2 and 7 for its twist/factor separation.

Combine the two divisibilities at every height-one prime (§0.7, KMC.iff_reverse_divisibility).

No canonical-versus-Gross period comparison is used: §4.8 bypasses it, and the proof uses the stated Beilinson–Flach route.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.6 and the preceding paragraph, pp.6–7; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §4.8, p.68; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), footnote 2, p.7.

*Needs:* `KatoEulerSystems` Layer 7 (`cohomological-divisibility-one-direction`); `AutomorphicCongruences` Layer 2; §0.7; §0.8; §1.1.

**Checks.**

- E = 14a1, p = 13, ℓ = 2: hypotheses hold (nonsplit at 2, 13 ∤ 6, χ̄₁ unramified ≠ χ̄₂ with inertia character ω⁻¹), so KMC holds for 14a1 at 13.
- E = 11a1, p = 7: (FW1.6_11) fails, so this theorem does not apply even though §1.3 does.

### 1.5 The ordinary Selmer form of the ordinary theorems

Assume the hypotheses of §1.4 and, in addition, a proved identity L_{p-adic,α,ω,γ}(f) = u L_f with u ∈ O^× for Kato’s good pair for the dual lattice and Skinner–Urban’s canonical periods. Then IMC(D) holds integrally. Conversely, under §1.3 and this same integral period identification, KMC^{η=1}(T_K) follows from IMC. The rational comparison only needs the nonzero period scalar carried into the analytic object. The unit identification in general weight is an explicit input, not a conclusion of the rational Deligne-period quotient.

Assume good ordinarity, p∤N, p odd and trivial character.

Require (irred) and a rank-one unipotent element (§1.2) to work at the prime (ϖ).

Use Kato’s good pair (ω,γ) for the dual lattice U ≅ T*(1−k) (`KatoEulerSystems` Layer 7 (`ordinary-selmer-divisibility`), hypothesis (3)).

Integral period compatibility: the Kato good dual pair and the canonical modular-symbol periods produce a scalar in O^×. A saturated rank-one lattice in each realization alone does not prove this comparison.

Apply §0.9 at every height-one prime, including (ϖ) by the rank-one quotient.

Apply Kato’s explicit reciprocity with its actual period scalar. If the integral period-compatibility input gives a unit, the analytic ideals agree. `KatoEulerSystems` §3.2 (`archimedean-period-quotient-and-critical-values`) supplies an algebraic period quotient, not by itself its O-unit valuation.

Translate Fouquet–Wan's T and Λ_Iw into the datum D using the Hecke-dual twist dictionary in §0.1.

The source for this target is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.4–17.6, pp.273–274, and 17.13, pp.279–280; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.5.6 and Theorem 3.6.4, pp.41–43; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.6, pp.6–7.

*Needs:* §0.9; §1.4; §1.3; `KatoEulerSystems` §3.2 (`archimedean-period-quotient-and-critical-values`); `ModularSymbolsPadicLFunctions` Layer 1 (`integral-period-lattices`).

**Checks.**

- For the optimal semistable elliptic curve 14a1 at p=13 the Néron/canonical unit comparison is supplied by §3.1; the integral main conjecture is independently supplied by §1.3. General-weight translation retains the period-compatibility input.
- A period choice not saturated in the integral lattice gives L_{p-adic} = ϖ^m u L_f with m ≠ 0, and the integral equality would fail by ϖ^m.

### 1.6 Skinner's theorem for multiplicative reduction

Let p ≥ 3 and f ∈ S_2(Γ_0(N)) a newform with p ∥ N (so f is ordinary at p, k = 2, and a_p = ±1), L/Q_p as in the datum, (irred) for ρ̄_f, and a prime q ≠ p with q ∥ N and ρ̄_f ramified at q. Then for every finite Σ not containing p, X^Σ is Λ-torsion and char_Λ(X^Σ) = (L_f^Σ) in Λ, where X^Σ uses the inertia-kernel condition of §0.2 and the ordinary line of the Steinberg representation at p and L_f is the Mazur–Tate–Teitelbaum p-adic L-function (with its trivial zero when a_p = 1).

Assume p≥3, p∥N, weight two and trivial character.

Require (irred) and a ramified q∥N with q≠p.

The p ∤ N seed is §1.3 in weights k_m>2, k_m≡2 mod (p−1)p^(r_m) on level N/p, where r_m is chosen to give the precision p^m and may be increased to at least m. It is applied only after the lattice congruence modulo p transports the irreducibility and ramified-prime hypotheses.

The Hida-family theorem `OrdinaryAutomorphicFormsAndModularityLifting` R21.6 (`ordinary-newform-lies-in-a-hida-family`) is stated for p ≥ 5; for p = 3 require the same Hida approximation contract at p = 3, as specified under Exact supplier contracts.

Reductions: it suffices to prove the statement after a finite extension of L and for Σ containing all primes dividing N, using faithful flat coefficient change and the Selmer local-condition triangle stated in Exact supplier contracts.

Hida theory: f is the weight-two member of a Hida family (`OrdinaryAutomorphicFormsAndModularityLifting` R21.6 (`ordinary-newform-lies-in-a-hida-family`), with its required p=3 extension); for each m>0 choose f_m∈S_(k_m)(Γ_0(N/p)), ordinary, with k_m as above. The isomorphism T_f/p^m≃T_(f_m)/p^m must identify T_f^+/p^m with T_(f_m)^+/p^m at G_Qp. Congruent q-expansions alone are not the Selmer comparison used here.

The two-variable p-adic L-function of `PadicFamilies` Layer 1 (`branch-l-functions`) yields congruence of the principal ideals (L^Σ_{f_m}, p^m) = (L^Σ_f, p^m), with compatible choices of periods or their unit ambiguity. An exact equality of chosen analytic generators modulo p^m is not asserted without fixing these choices.

Greenberg's theorem (§0.3) gives Ch^Σ(f_m) = Fitt(X^Σ(f_m)); the congruence gives Sel^Σ(f)[p^m] ≅ Sel^Σ(f_m)[p^m], hence (Fitt(X^Σ(f)), p^m) = (Ch^Σ(f_m), p^m) = (L^Σ_{f_m}, p^m) = (L^Σ_f, p^m) for every m.

Since L^Σ_f ≠ 0, Fitt(X^Σ(f)) ≠ 0, so X^Σ(f) is torsion, Greenberg's theorem gives Ch^Σ(f) = Fitt, and principal ideals agreeing modulo every p^m are equal.

The source for this target is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Theorem A, pp.1–2, and §2.3, pp.8–12; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, pp.3–4, §2.6, pp.16–18, Proposition 2.6.1 and (2.6.1)–(2.6.3), and §3.1, pp.18–19.

*Needs:* §1.3; `OrdinaryAutomorphicFormsAndModularityLifting` R21.6 (`ordinary-newform-lies-in-a-hida-family`); `PadicFamilies` Layer 1 (`branch-l-functions`); §0.3; `SelmerIwasawaCohomology` Layer 3 (`selmer-fitting-characteristic`).

**Checks.**

- For E with split multiplicative reduction at p, L_f has a trivial zero at the trivial character and the theorem is consistent with Greenberg–Stevens (§5.7): (γ − 1) divides both sides.
- This supplies `RankZeroOneBSD` BSD.6 (`rank-zero-ordinary-multiplicative-p-part`) for p ∥ N.
- At p=3 and precision p^m, an ordinary family restricted to p≥5 supplies no approximant. Even a congruent residual representation supplies only the m=1 residual data, not the lattice and ordinary-line comparisons for every m or the period-unit congruence.

### Examples

The standard unipotent u = [[1,1],[0,1]] has (u−1)(x,y) = (y,0), so its coinvariants are O, with quotient map (x,y) ↦ y. Replacing the upper-right entry by ϖ gives O/(ϖ) ⊕ O. The matrix g = [[1,1],[ϖ,1+ϖ]] has determinant 1 and reduces to u, but det(g−1) = −ϖ; thus its coinvariants are torsion and it is not an acceptable characteristic-zero witness. At p=3 each nonzero residue squares to 1, so the ordinary elliptic local exclusion used in Layer 2 always fails; Layer 1’s ordinary theorem has no such restriction.

### Dependencies

Use Layer 0; ArithmeticGaloisRepresentations for residual representations and local types; EllipticCurves Layer 4 for the multiplicative inertia criterion; KatoEulerSystems Layer 7 for the forward divisibility; AutomorphicCongruences Layers 1 and 2 for the separate reverse bounds; and the Hida approximation contract for the multiplicative limit.


## Layer 2: the pointwise cohomological theorem

### 2.1 Fouquet–Wan conventions against the modular Iwasawa datum

Let f ∈ S_k(Γ_0(N)) with trivial character. Fouquet–Wan's T(f) ⊂ M(f)_{et,p} is a lattice in the cohomological realisation, with det ρ_f = χ_cyc^{1−k}, and their Λ_Iw-adic objects are RΓ_et(Z[1/p], T(f) ⊗ Λ_Iw), Δ(M(f))_Iw and the {p}-partial zeta morphism z(f)_Iw : T(f)_Iw(−1)^+ → H¹(Z[1/p], T(f)_Iw). Under the dictionary T(f) ↔ Kato's T_K (`KatoEulerSystems` Layer 2 (`hecke-dual-twist-dictionary`)) and Λ_Iw ↔ the η = 1 quotient Λ of Λ(G_∞), these are the objects H^i(T_K), Δ_Iw(T_K) and triv_z of §0.6, and Fouquet–Wan's Conjecture 1.5 for M(f) is KMC^{η=1}(T_K). The half-weight twists χ_cyc^{1−k/2}, χ_cyc^{−k/2} in Fouquet–Wan's local hypothesis are integral powers because k is even for trivial character. More precisely z(f)_Iw = (∏_{ℓ∈Σ∖{p}} Eul_ℓ(V_f^*(1)))⁻¹ z(f)_Σ,Iw in the total fraction algebra (Proposition 3.28, p.35); the local determinant corrections must accompany this formula integrally.

Assume trivial nebentypus, so k is even.

The dictionary of Hecke actions and twists is the one fixed in `KatoEulerSystems` Layer 2 (`hecke-dual-twist-dictionary`); no other convention is introduced here.

Compare Fouquet–Wan §1.1.1 (pp.4–5) and Definition 3.3/Theorem 3.4 (p.23) with Kato §12 and the datum's conventions term by term.

Fouquet–Wan's T(f)_Iw is T(f) ⊗ Λ_Iw with the Galois action twisted through Γ_Iw, matching Kato's j_*-limit over Q(ζ_{p^n}) projected to the η = 1 component (Shapiro, `SelmerIwasawaCohomology` Layer 3 (`iwasawa-shapiro`)).

The Σ-partial versus {p}-partial comparison uses the Euler factors of Fouquet–Wan Definition 3.8, nonzero by Lemma 3.11.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5; Theorem 1.7, p.7; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Definition 3.3, p.23, Theorem 3.4, p.24; Definition 3.8, Lemma 3.11, p.25.

*Needs:* `KatoEulerSystems` Layer 2 (`hecke-dual-twist-dictionary`); `SelmerIwasawaCohomology` Layer 3 (`iwasawa-shapiro`); §0.6; §0.7; §0.1.

**Checks.**

- For f = f_E of weight two, T(f) = T_pE^∨ = Hom(T_pE, Z_p), while the datum's T ≅ T_pE; the dictionary is the Weil pairing and the Tate twist by one.
- Fouquet–Wan's residual hypotheses on ρ̄_f are read in this cohomological normalisation (§1.1).

### 2.2 The Fouquet–Wan pointwise main conjecture

Let p ≥ 3, F a finite field of characteristic p and ρ̄ : G_Q → GL₂(F) absolutely irreducible and odd, satisfying: (LocExc_p); and for some ℓ ≠ p, (FWexp_ℓ(μ)) — a ramified extension 0 → μχ̄_cyc^{1−k/2} → ρ̄|D_ℓ → μχ̄_cyc^{−k/2} → 0 with μ unramified quadratic (possibly trivial), and μ nontrivial if ρ̄|G_{Q_p} is irreducible. Let f ∈ S_k(Γ_0(Np^r)) be a normalised eigencuspform of weight k ≥ 2 with ρ̄_f ≅ ρ̄ and ℓ ∥ N. Then KMC^{η=1} holds for f integrally: the zeta morphism induces Δ_{O_Iw}(T(f)_Iw) ≅ O_Iw (Fouquet–Wan Conjecture 3.24 = 1.5). In particular this holds for every reduction type of f at p (crystalline, semistable, potentially semistable; principal series, Steinberg or supercuspidal π(f)_p).

Assume p≥3, k≥2 even and trivial nebentypus. Theorem 5.1 permits level Np^r; μ is an unramified quadratic character, allowed to be trivial when the local representation at p is reducible.

The scalar semisimplification is automatically excluded: det ρ̄_f = χ̄_cyc^(1−k) has odd exponent, whereas a scalar semisimplification has square determinant on tame inertia (Fouquet–Wan remark following Theorem 5.1, p.69).

Assumption 2.1(1), absolute irreducibility over Q(√p*), follows from the genuine ramified unipotent at ℓ; Assumption 3.5 follows from (LocExc_p).

The proof is owned by AutomorphicCongruences Layer 4: the universal-family theorem (§4.1) at points of X^sm via ordinary/crystalline-short points and the GU(3,1) congruence, propagated to all classical points by the height-one descent of Fouquet–Wan §§5–6.

State the endpoint in the datum's conventions: translate by §2.1, and check the residual hypotheses with §1.1.

Derive Assumption 2.1(1) from the ramified unipotent at ℓ (the image of G_{Q(√p*)} contains ρ̄(I_ℓ), and an induced-from-quadratic image has no nontrivial unipotent elements for p odd).

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.7, p.7; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 5.1, p.68; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Assumption 2.1, p.17, and Theorem 1.1, p.3; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Remark immediately after Theorem 5.1, p.69.

*Needs:* `AutomorphicCongruences` Layer 4; §2.1; §1.1; §0.7.

**Checks.**

- E = 14a1, p = 5 (supersingular, a_5 = 0): ρ̄|G_{Q_5} is irreducible, so (LocExc_5), (ScalarExc_5) hold; ℓ = 2 is nonsplit (μ nontrivial) and 5 ∤ ord_2 Δ = 6, so ρ̄ is ramified at 2; ρ̄ is absolutely irreducible (no rational 5-isogeny). KMC holds for 14a1 at p = 5.
- E = 11a1, p = 7: ρ̄|G_{Q_7} is reducible (ordinary), so Theorem 5.1 allows μ trivial at ℓ = 11 (split); with 7 ∤ 5 and ā_7² = 4 ≠ 1 the hypotheses hold, while the introduction's Theorem 1.7 (μ nontrivial) does not apply.

### 2.3 Ordinary and signed consequences of the pointwise theorem

Let f satisfy the hypotheses of §2.2. (1) If moreover p ∤ N, f is ordinary at p, (dist) holds and ρ̄ satisfies (Im), and the integral period-compatibility input of §1.5 holds, then IMC(D) holds integrally for the ordinary datum of f. (2) If moreover p ∤ N, f is supersingular at p with LLZ's (A) (k ≥ 3 or a_p = 0), and (E) holds, then for the LLZ basis the signed main conjectures SMC^{1,η=1} and SMC^{2,η=1} hold integrally; without (E) they hold rationally. Nothing is asserted about a bounded scalar p-adic L-function at points where none exists (infinite slope, supercuspidal π(f)_p).

(1) needs the comparison hypotheses of §0.9.

Assertion (2) needs the hypotheses of §0.12; the two hypothesis sets are intersected, not merged.

For (1), combine the pointwise theorem with §0.9 and the integral identification of §1.5.

For (2), combine it with §0.12 (LLZ Corollary 6.6).

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.2, p.7; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Corollary 6.6, p.44; [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.13, pp.279–280.

*Needs:* §2.2; §0.9; §0.12; §1.5.

**Checks.**

- (2) applies to E = 14a1 at p = 5: (A) since a_5 = 0, (E) since the mod-5 representation is surjective; so the LLZ actual-image equalities SMC^{1}, SMC^{2} hold for this basis. Their kernel identification is Kobayashi’s, with index 1 minus and index 2 plus; the separately Néron-normalized Pollack analytic equalities also need §4.5’s unit-period comparison.
- For E = 11a1 at p = 7, Theorem 5.1 supplies KMC independently of §1.3. Applying (1) retains the Kato/canonical-period unit input; it is not proved by the pointwise theorem alone.

### Examples

For 11a1 at p=7, the residual representation is locally ordinary and the auxiliary prime 11 is split multiplicative. The ordinary Fouquet–Wan theorem in §1.4 does not apply, because its decomposition invariants at 11 do not vanish. Theorem 5.1 allows the trivial unramified quadratic μ in the locally reducible case, so the pointwise theorem does apply. Its conclusion is the trivial tame component of KMC. An integral ordinary analytic conclusion also uses the period-unit comparison of §0.9.

### Dependencies

Use Layer 0’s cohomological formulation and Layer 1’s residual predicates. The pointwise arithmetic endpoint is the AutomorphicCongruences Layer 4 contract. Its proof may use its own family theorem, but that endpoint is an imported theorem here, so the formulation in this layer does not create a dependency cycle with Layer 4.


## Layer 3: ordinary elliptic curves

### 3.1 Elliptic curves against their newforms: lattices and periods

Let E/Q have conductor N and newform f_E (`EllipticCurveModularity` R29.6 (`modularity-theorem`)), and fix the modular parametrisation φ_E : X_0(N) → E of `EllipticCurveModularity` R29.5 (`modular-parametrisation`) through a Q-isogeny λ : A_{f_E} → E, with φ_E^*ω_E = c_φ·2πi f_E(z)dz. Then: (1) T_pE ≅ T for the datum of f_E with Tate lattice λ_*⁻¹(T_pE) in V_p(A_{f_E}) and the corresponding cohomological dual lattice T_f; (2) write Ω_E^± for the periods of a Néron differential ω_E and Ω_{f_E}^± for the canonical periods defined by the saturated f_E-isotypic part of H¹(X_0(N), Z_{(p)})^±; for the X_0(N)-optimal curve φ_{E,*} is surjective on integral homology, so φ_E^* identifies H¹(E(C), Z_{(p)})^± with that saturated part and Ω_E^± = ±c_φ·u^±·P_{f_E}^±, where P_{f_E}^± := −2πi Ω_{f_E}^± in Skinner–Urban’s cohomological convention with u^± ∈ Z_{(p)}^×; for a curve E' isogenous to the optimal curve the ratio is multiplied by the period ratio of the isogeny, a rational number whose p-part divides a power of the p-part of the isogeny degree; (3) for p > 2 semistable for E and φ_E optimal, p ∤ c_φ (`GrossZagierAndArithmeticHeights` GZ.3 (`manin-integrality-and-p-unit`)). Every nonunit factor is retained; none is assumed to be 1.

E/Q, N its conductor, f_E the attached newform.

Assume p>3, so that H¹(X_0(N), Z_(p)) is the parabolic cohomology of Γ_0(N) with Z_(p) coefficients used to define canonical periods.

The isogeny λ is part of the data; for the X_0(N)-optimal curve λ = id.

The unit assertion in (3) needs p>2, E semistable and φ_E optimal; otherwise c_φ is only an integer.

Modularity and the parametrisation: `EllipticCurveModularity` R29.6 (`modularity-theorem`) and R29.5 (`modular-parametrisation`).

Use R29.4 (`tate-module-comparison`) rationally, then choose λ_*⁻¹(T_pE) in V_p(A_{f_E}) and its corresponding cohomological dual lattice. Although λ_* is a rational isomorphism, λ_*T_p(A_{f_E}) can be a proper sublattice of T_pE when p divides deg λ.

Periods: φ_E^*ω_E = c_φ·2πi f_E(z)dz; since φ_{E,*} is surjective on H_1 for the optimal curve, φ_E^* is injective on H¹ with torsion-free cokernel, so φ_E^*H¹(E(C), Z_(p))^± is a saturated rank-one sublattice of the f_E-part, hence equal to it; pairing gives the period relation. The canonical periods are those of `ModularSymbolsPadicLFunctions` Layer 1 (`integral-period-lattices`). Here the differential period is P_f=−2πiΩ_f, as in Skinner 2016 footnote 6, rather than the cohomological Ω_f itself.

Manin constant: `GrossZagierAndArithmeticHeights` GZ.3 (`manin-integrality-and-p-unit`).

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.20, p.258; Theorem 0.8, p.255; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), remark after Corollary 1.10, p.9; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4 footnote 6, p.14.

*Needs:* `EllipticCurveModularity` R29.6 (`modularity-theorem`); `EllipticCurveModularity` R29.5 (`modular-parametrisation`); `EllipticCurveModularity` R29.4 (`tate-module-comparison`); `ModularSymbolsPadicLFunctions` Layer 1 (`integral-period-lattices`); `GrossZagierAndArithmeticHeights` GZ.3 (`manin-integrality-and-p-unit`); §0.1.

**Checks.**

- For E = 11a1 (optimal, Manin constant 1) at p = 7: Ω_E^+ and P_{f_E}^+=−2πiΩ_{f_E}^+ agree up to a 7-adic unit, so L_p(E/Q) and L_{f_E} generate the same ideal of Λ.
- For a p-isogeny, the image of the source Tate lattice can be proper in T_pE, and the Néron period ratio can be nonunit (e.g. p=5 in class 11a). Track both lattice and analytic period factors. Under residual irreducibility stable lattices are homothetic, so this issue disappears for the integral irreducible branches.

### 3.2 The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve

Let E/Q have good ordinary or multiplicative reduction at an odd prime p, with α the unit root of X² − a_pX + p (α = a_p = ±1 in the multiplicative case). L_p(E/Q) ∈ Λ ⊗ Q_p is the element whose associated measure μ_{E,α} on Z_p^× satisfies ∫ μ_{E,α} = (1 − α^{-1})^{b+1}·L(E,1)/Ω_E^+ with b = 1 for good and b = 0 for multiplicative reduction, and ∫ χ μ_{E,α} = p^n α^{-n} L(E, χ^{-1}, 1)/(G(χ^{-1}) Ω_E^{χ(−1)}) for χ primitive of conductor p^n > 1, restricted to the Γ-branch through 1 + pZ_p. Its analytic form is L_p(E, s) = ∫ ⟨x⟩^{s−1} μ_{E,α}. If E[p] is irreducible, L_p(E/Q) ∈ Λ.

Assume p odd and good ordinary or multiplicative reduction.

Néron-differential periods Ω_E^±, not canonical periods of f_E.

Under (irr_Q), integrality follows from the optimal X₁(N) period comparison, without an extra Manin-constant hypothesis: Skinner §3.3, p.25 and note 8, identifies the Néron and canonical differential periods up to a p-unit when ord_p(N)≤1. A prime-to-p isogeny transfers this to E. This is the elliptic comparison; it does not prove a general-weight Kato/canonical-period unit assertion.

The usable interface consists of the following named outputs.

- `mazurSwinnertonDyerL`: L_p(E/Q) ∈ Λ ⊗ Q_p for E good ordinary or multiplicative at odd p.
- `mazurSwinnertonDyerL_trivial_character`: Its value at the trivial character is (1 − α^{-1})^{b+1} L(E,1)/Ω_E^+.
- `mazurSwinnertonDyerL_twist`: Its value at a primitive χ of conductor p^n > 1 is p^n α^{-n} L(E, χ^{-1}, 1)/(G(χ^{-1})Ω_E^{χ(−1)}).
- `mazurSwinnertonDyerL_mem_Lambda`: If E[p] is irreducible then L_p(E/Q) ∈ Λ.
- `mazurSwinnertonDyerL_isogeny`: For a Q-isogeny E → E', L_p(E'/Q) = (Ω_E^+/Ω_{E'}^+)·L_p(E/Q), the period ratio being a rational number.
- `mazurSwinnertonDyerL_eq_form`: L_p(E/Q) = (P_{f_E}^+/Ω_E^+) L_{f_E}, where P_{f_E}^+=−2πiΩ_{f_E}^+ is the differential period corresponding to Skinner–Urban’s cohomological canonical period. The ratio is algebraic and its p-part is retained.
- `mazurSwinnertonDyerL_analytic`: L_p(E, s) := ∫ ⟨x⟩^{s−1} μ_{E,α}, s ∈ Z_p, and γ − 1 ↦ ⟨u⟩^{s−1} − 1 identifies the two forms.

Construct μ_{E,α} from the modular symbols of f_E (`ModularSymbolsPadicLFunctions` Layer 2 (`ordinary-integral-measure`)) and rescale from canonical to Néron periods by §3.1.

Interpolation: `ModularSymbolsPadicLFunctions` Layer 2 (`interpolation-and-uniqueness`), with the trivial-character Euler factor of `ModularSymbolsPadicLFunctions` Layer 4 (`euler-factor-comparison`) (the factor (1 − α^{-1})² for good and (1 − α^{-1}) for multiplicative reduction).

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.8, Definition 0.9, Remark 0.10, p.255; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §3.3, p.25 and note 8 (optimal X₁(N) periods).

*Needs:* `ModularSymbolsPadicLFunctions` Layer 2 (`ordinary-integral-measure`); `ModularSymbolsPadicLFunctions` Layer 2 (`interpolation-and-uniqueness`); `ModularSymbolsPadicLFunctions` Layer 4 (`euler-factor-comparison`); §3.1; §0.4.

**Checks.**

- If E has split multiplicative reduction at p then α = 1 and the trivial-character value is 0.
- For E = 11a1 at p = 7, the trivial-character value is (1 − α^{-1})²/5 ≠ 0 with α ≡ −2 mod 7.
- For a non-optimal curve E' in the class 11a and p = 5, L_p(E'/Q) and L_{f_E} differ by the 5-adic nonunit period ratio, so using canonical periods in place of Néron periods changes the integral main conjecture for E'.
- For multiplicative reduction b = 0, so the trivial-character factor is (1 − α^{-1}), not its square.
- For α = 1 (split multiplicative), (1 − α^{-1})^{b+1} = 0: the trivial zero of Colmez Remark 0.10.
- For E = 11a1 at p = 7, the value at the trivial character is (1 − α^{-1})²/5, a nonzero element of Z_7.

### 3.3 Mazur's main conjecture for an elliptic curve

For E/Q and a prime p of good ordinary reduction, MMC(E, p) is the proposition: X_ord(E/Q_∞) := Sel_{p^∞}(E/Q_∞)^∨ is Λ-torsion and char_Λ(X_ord(E/Q_∞)) = (L_p(E/Q)) in Λ. MMC_Q(E, p) is the equality in Λ ⊗ Q_p. Under §3.1, MMC(E, p) ⟺ IMC(D_{f_E}) when the period ratio Ω_E^+/P_{f_E}^+ (P_f=−2πiΩ_f) is a p-adic unit, and MMC_Q(E, p) ⟺ IMC_Q(D_{f_E}) always.

Assume p is good ordinary. Section 1.6 covers the multiplicative form with its stated local condition.

The integral form carries the implicit integrality L_p(E/Q) ∈ Λ.

The usable interface consists of the following named outputs.

- `MazurMC`: MMC(E, p) : Prop.
- `MazurMC_rational`: MMC_Q(E, p) : Prop.
- `MazurMC.iff_IMC`: MMC(E, p) ↔ IMC(D_{f_E}) when Ω_E^+/P_{f_E}^+ (P_f=−2πiΩ_f) ∈ Z_p^×; MMC_Q(E, p) ↔ IMC_Q(D_{f_E}).
- `MazurMC.isogeny`: For an isogeny E → E' of degree prime to p, MMC(E, p) ↔ MMC(E', p).
- `MazurMC.toRational`: MMC(E, p) → MMC_Q(E, p).

X_ord(E/Q_∞) is the ordinary Selmer dual of the datum of f_E (§0.2, OrdinarySelmer.ofEllipticCurve).

L_p(E/Q) is §3.2; compare with L_{f_E} by the period ratio.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Conjecture 1.1.1, p.1; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), §2.2.2, p.6.

*Needs:* §0.2; §3.2; §0.5; §3.1.

**Checks.**

- MMC(11a1, 7) holds (§1.3 with q = 11, or §3.5).
- MMC_Q does not determine μ: it is compatible with char(X) = (p·L_p(E/Q)), which MMC excludes.
- For p = 7 and the 5-isogenous curves 11a1, 11a2, 11a3, the three conjectures MMC(·, 7) are equivalent.
- MMC(E, p) depends only on the isogeny class up to the p-part of period ratios and of the change of Selmer groups along the isogeny; both are tracked, not assumed to cancel.
- For E = 11a1 at p = 7 the period ratio is a unit, so MMC ⟺ IMC for f_E.

### 3.4 The Burungale–Castella–Skinner rational cyclotomic theorem

Let E/Q, p > 3 a prime of good ordinary reduction with E[p] irreducible. Then X_ord(E/Q_∞) is Λ-torsion and MMC_Q(E, p) holds: char_{Λ_Q}(X_ord(E/Q_∞)) = (L_p(E/Q)) in Λ ⊗ Q_p. No ramification hypothesis on E[p] is assumed.

Assume p>3, good ordinary reduction and (irr_Q).

The proof owner is `AutomorphicCongruences` Layer 5b; this comparison transports its endpoint into the formulation of §3.3.

Import `AutomorphicCongruences` Layer 5b (`rational-cyclotomic-endpoint`) (base change to the quartic CM field, Wan's divisibility, the four-factor descent and Kato's bounds).

Translate its Selmer and analytic objects with §3.1 and §3.2; the rational form needs no Manin-constant input.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2(a), p.2; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Remark 1.1.3, p.2.

*Needs:* `AutomorphicCongruences` Layer 5b (`rational-cyclotomic-endpoint`); §3.3; §3.1.

**Checks.**

- Applies to 11a1 at p = 7 and to 14a1 at p = 13; it does not apply at p = 3 or at Eisenstein primes (11a1 at p = 5).
- It removes the ramification hypothesis (mult) of Skinner–Urban: 11a1 at p = 7 is covered by both, while a curve with no multiplicative prime at which E[p] ramifies (e.g. a curve of prime conductor ℓ with p | ord_ℓ Δ) is covered only here.

### 3.5 The Burungale–Castella–Skinner integral cyclotomic theorem

Under the hypotheses of §3.4, if moreover (Im) holds — there is σ ∈ G_{Q(μ_{p^∞})} with T_pE/(σ − 1)T_pE ≅ Z_p — then MMC(E, p) holds integrally.

Assume p>3, good ordinary reduction, (irr_Q) and (Im).

(Im) is not interchangeable with residual surjectivity or with irreducibility without the sufficient-condition lemma §3.6.

Import `AutomorphicCongruences` Layer 5b (`integral-cyclotomic-endpoint`) and transport it as in the rational case.

The imported endpoint is already an integral statement for this elliptic curve E with its own Néron normalization. Integrality of L_p(E/Q) under (irr_Q) is §3.2. No extra semistability or Manin-constant unit hypothesis is added to the BCS theorem; the curve/form dictionary is used only when translating to a separate modular-form presentation.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2(b), p.2.

*Needs:* `AutomorphicCongruences` Layer 5b (`integral-cyclotomic-endpoint`); §3.4; §1.2.

**Checks.**

- 11a1 at p = 7: (Im) holds via τ ∈ I_11 (§1.2), so MMC(11a1, 7) holds integrally.
- For a curve with no multiplicative prime where E[p] is ramified, (Im) can still hold through surjectivity (§3.6); under (irr_Q) the essential case left out by Theorem 1.1.2 is that of residually dihedral primes (Burungale–Castella–Skinner Remark 1.1.3(iii)).

### 3.6 Residual surjectivity gives the rank-one image condition

Let E/Q, p ≥ 5, and suppose ρ̄_{E,p} : G_Q → GL₂(F_p) is surjective. Then the image of ρ_{E,p^∞} is GL₂(Z_p), the image of G_{Q(μ_{p^∞})} contains SL₂(Z_p), and σ with ρ_{E,p^∞}(σ) = [[1, 1], [0, 1]] satisfies T_pE/(σ − 1)T_pE ≅ Z_p, so (Im) holds.

Assume p≥5.

Require residual surjectivity onto GL₂(F_p).

Let H be the closed p-adic image. Its closed commutator subgroup lies in SL₂(Z_p) and reduces onto [GL₂(F_p),GL₂(F_p)]=SL₂(F_p). Serre’s SL₂ lifting lemma for p≥5 makes this subgroup SL₂(Z_p). Since det H is all Z_p× (Weil pairing), H=GL₂(Z_p).

Q(μ_{p^∞}) is cut out by the determinant, so G_{Q(μ_{p^∞})} maps onto SL₂(Z_p) ∩ image = SL₂(Z_p).

For u = [[1,1],[0,1]], u − 1 has image Z_p·e₁, so the quotient is free of rank one (§1.2).

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Remark 1.1.3(i), p.2; Theorem 1.2.2(b), p.3; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), assumption (E), p.43; [Aaron Landesman, Ashvin A. Swaminathan, James Tao and Yujie Xu](https://arxiv.org/abs/1607.04698v2), §1, p.1, the g=1 discussion citing Serre IV.3.4 Lemma 3.

*Needs:* §1.2; §1.1; `ArithmeticGaloisRepresentations` R01.6.

**Checks.**

- For E = 14a1 and p = 5 (5 is not a nonmaximal prime for 14a1), ρ̄_{E,5} is surjective, so (Im) holds.
- Burungale–Castella–Skinner Remark 1.1.3(i): for non-CM E, (Im) holds for all sufficiently large p by Serre's open image theorem.

### Examples

For the optimal curve 11a1, the canonical differential period P_f and the Néron real period differ by a 7-adic unit because the Manin constant is 1. The curve’s Tate lattice is the one transported back through the modular isogeny; using its image lattice instead would lose an index at primes dividing the isogeny degree. At p=7 the curve is ordinary, E[7] is irreducible, and inertia at 11 gives the rank-one image condition, so the integral theorem applies. At p=5 it has rational 5-torsion and belongs to the separate Eisenstein comparison of Layer 6.

### Dependencies

Use Layers 0–2, EllipticCurveModularity R29.4–R29.6, GrossZagierAndArithmeticHeights GZ.3 for the Manin constant, AutomorphicCongruences Layer 5b for the two BCS branches, and ArithmeticGaloisRepresentations R01.6 for the rank-two lifting theorem.


## Layer 4: families and signed consequences

### 4.1 The Fouquet–Wan universal-family main conjecture

Let ρ̄ satisfy the hypotheses of §2.2, Σ a finite set of primes, and T_Σ the universal deformation of ρ̄ unramified outside Σ, viewed as a free module of finite rank over the regular subring Λ ≅ O[[X₁, X₂, X₃]] of the Hecke algebra. Assume the `universalDeformationZeta` construction specified below, and let z_Σ : T_Σ(−1)^+ → H¹_et(Z[1/Σ], T_Σ) be that morphism. Then z_Σ induces an isomorphism triv_{z_Σ} : Δ_Σ(T_Σ) ≅ Λ of the Σ-partial fundamental line with Λ: Kato's generalised main conjecture (Fouquet–Wan Conjecture 3.30) holds for (Spec Z[1/Σ], Λ, T_Σ). The trivialisation is over Λ; nothing is asserted over a possibly singular deformation ring or Hecke algebra.

Require the residual hypotheses of the pointwise theorem: Fouquet–Wan Theorem 5.2 has the same hypotheses as Theorem 5.1.

The ring Λ≅O[[X₁,X₂,X₃]] is the specified regular subring; T_Σ is free of finite rank over it.

Nakamura's zeta morphism exists under Fouquet–Wan Assumptions 2.1 and 3.5 (Theorem 3.6), for all p ≥ 3 by the remark after it.

The proof is owned by AutomorphicCongruences Layer 4: reduction to points of X^sm via ordinary and crystalline-short points, the GU(3,1) congruence and Theorem 7.32, and the height-one descent.

Assumption 2.1 includes absolute irreducibility on G_Q(√p*) and the stated ordered local extension exclusions; Assumption 3.5 additionally excludes the cyclotomic ratio for either ordering of a reducible local semisimplification. Neither an ordinary filtration nor residual absolute irreducibility alone replaces these conditions. The deformation/Hecke identification is the one under these hypotheses; this is not a construction for an arbitrary deformation problem.

The required extension of KatoEulerSystems is `universalDeformationZeta`: under Fouquet–Wan Assumptions 2.1 and 3.5, construct the linear morphism z_Σ : T_Σ(−1)^+ → H¹_et(Z[1/Σ],T_Σ) over the localized Hecke/universal deformation algebra, with `universalDeformationZeta_classical` identifying its specialization at every classical point λ_f with the Σ-partial classical zeta morphism of Theorem 3.4, and `universalDeformationZeta_specialize` giving the induced map at a general coefficient specialization. The p=3 clause uses the remark following Theorem 3.6, not an unstated extension of a p≥5 construction. Restrict scalars to the specified regular Λ only after this construction. KatoEulerSystems §5.4 supplies classical twist-one morphisms and does not currently supply this universal contract; the family endpoint here is conditional on that extension. The Σ-partial line is §0.6 over Λ.

Transport the endpoint over its stated regular coefficient ring.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 1.8, p.8, and Theorem 5.2, p.69; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem 3.6 and the remark after it, p.24; Conjecture 3.30, p.36.

*Needs:* `AutomorphicCongruences` Layer 4; the required KatoEulerSystems `universalDeformationZeta` extension just specified; §0.6; §2.2.

**Checks.**

- Specialising at a classical point recovers the pointwise statement at the Σ-imprimitive level (§4.2).
- When the deformation problem is unobstructed, R_Σ(ρ̄) is itself a power-series ring and the theorem is the most general cyclotomic statement (Fouquet–Wan p.8).
- A collection of classical zeta maps without a deformation-algebra-linear map does not satisfy `universalDeformationZeta`: interpolation at points is a compatibility theorem, not its construction.
- At p=3 retain the same classical-specialization square and the source’s local residual exclusions; replacing them by a p≥5 assertion leaves this case unproved.

### 4.2 Specialising the family statement

Under §4.1, let ψ be a coefficient specialization from its specified regular base Λ. The Σ-partial perfect complex and line commute with derived base change, and the compatible zeta morphism induces Δ_Σ(T_Σ) ⊗^L_{Λ,ψ} S ≅ Δ_Σ(T_Σ ⊗^L_{Λ,ψ} S). For a cyclotomic specialization use ψ_Iw and S_Iw consistently on both sides. Identifying this derived coefficient object with the specialized arithmetic lattice, primitive line and zeta trivialization requires Fouquet–Wan’s relative-purity and Iwasawa-suitability conditions, using Definition 3.19 for the regular base (Definition 3.12 is for the Hecke-algebra setting). At a classical point the primitive zeta map satisfies z_primitive = (∏_{ℓ∈Σ∖{p}} Eul_ℓ(V_f^*(1)))⁻¹ z_Σ (Proposition 3.28); compatible local determinant factors accompany it. These nonzero factors need not be units. Characteristic ideals are recovered from the specialized determinant with all cohomology and Tor terms, rather than specialized term by term.

For primitive arithmetic compatibility use the Iwasawa-suitable specialization of Definition 3.19 (p.31), including its condition on all lifts above the regular-base point; do not substitute a single suitable Hecke lift.

The Σ-partial derived base change is unconditional in Lemma 3.17’s coefficient setting; the primitive modified local line uses Proposition 3.20 and relative purity.

Euler factors and their dual/twist are those of Proposition 3.28, p.35; nonvanishing does not license cancellation inside integral lines without the local determinant comparison.

Use Lemma 3.17 for perfect derived coefficient change, Definition 3.19 for suitability over the regular subring, Proposition 3.20 for primitive local compatibility and Propositions 3.22–3.23 for the zeta trivialisations.

Compare Σ- and {p}-partial lines by the local Euler factors (§0.6, fundamentalLine.sigmaPartial).

Translate to KMC through §0.8 at Iwasawa-suitable points.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Propositions 3.22–3.23, p.33; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Lemma 3.17 and Definitions 3.18–3.19, p.31; Proposition 3.20, p.32; Proposition 3.28, p.35; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), remarks after Theorem 1.8, p.8.

*Needs:* §4.1; §0.6; §0.8; `PadicMeasuresIwasawaAlgebras` Layer 5.

**Checks.**

- At a point where H⁰ or a Tor term is nonzero, termwise specialisation of char(H²) would be wrong; the determinant form remains valid.
- The family statement implies the pointwise conjecture outside a closed subset of positive codimension (Fouquet–Wan p.8); the pointwise theorem at every classical point is §2.2.

### 4.3 The signed main conjecture for crystalline forms

Let f ∈ S_k(Γ_0(N)) with p ∤ N, crystalline at p, satisfying the hypotheses of §2.2 and LLZ's (A) if supersingular or (A') if good ordinary, together with (E). Then for the Wach basis of LLZ §3.3 (resp. §3.6) and η=1 (both i=1,2), the signed main conjecture SMC^{i,η} of §0.11 holds integrally, with the Coleman-image term char(Im(Col_i)^η/(L̃^η_{p,i})). The statement is proved only on the intersection of the two hypothesis sets.

Require the hypotheses of the pointwise theorem and of LLZ Corollary 6.6 simultaneously.

The image-of-Coleman term is retained; its simplification is §4.4.

The unconditional application here is η=1. For nontrivial η, LLZ’s equivalence still applies in its allowed index range, but KMC^η must be separately supplied. A twist f⊗η generally has p-power level and nontrivial nebentypus, so the stated FW theorem cannot be invoked merely by checking residual conditions.

For η=1 use KMC from §2.2. A nontrivial η statement is conditional on an independently proved KMC^η, with LLZ Theorem 6.5 allowing i=1 for all η and i=2 only for η=1.

Convert to SMC^{i,η} by §0.12.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 6.5, Corollary 6.6, pp.43–44; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), §1.1.2, p.7.

*Needs:* §2.2; §0.12; §0.11.

**Checks.**

- E = 14a1, p = 5: SMC^{1}, SMC^{2} hold for η = 1 with the LLZ basis.
- A form with k ≥ 3 that is good ordinary but locally split at p is excluded by (A').

### 4.4 Removing the Coleman-image term

Let f be supersingular at p with p ∤ N satisfying LLZ's (A)–(D): k ≥ 3 or a_p = 0; a_p ≠ p^j + p^{k−2−j} for 1 ≤ j ≤ k − 3; v_p(a_p) > ⌊(k − 2)/(p − 1)⌋; p ≥ k − 1. Then Col₁ : N(V)^{ψ=1} → Λ_E(G_∞) is surjective (LLZ Theorem 4.28), so Im(Col₁) = Λ_E(G_∞) and, after tensoring with Q, KMC^η is equivalent to char(X^{1,η}) = (L̃^η_{p,1}) (LLZ Corollary 6.8). For elliptic curves with a_p = 0 the images are computed integrally: Col₁ : D(T)^{ψ=1} → Λ(G_∞) is surjective and Im(Col₂) = (Σ_{i=1}^{p−1} δ_i)Λ(G_∞) + (γ − 1)Λ(G_∞) (LLZ Corollaries 5.18 and 5.22, equivalent to Kobayashi's Theorem 6.2). The simplified statement is basis-adjusted: it is the principal-ideal form for the LLZ basis, not automatically for another author's normalisation.

(A)–(D) for the rational simplification.

For the integral image computation assume E is an elliptic curve and a_p=0.

The basis is LLZ's; another basis changes Col by a matrix and the image by its effect.

Image computation: `PadicHodgeRegulators` Layer 4 (`actual-coleman-image`) (LLZ Proposition 4.7, Corollary 4.8, Theorem 4.28) and, for a_p = 0, LLZ Propositions 5.17–5.21 and Corollaries 5.18–5.22.

Insert Im(Col_i) into §0.11 (SMC.of_image_eq_top).

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Theorem 4.28, p.30; assumptions (B)–(D), p.14; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Remark 6.7 and Corollary 6.8, p.44; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Propositions 5.17, 5.19 and 5.21 and Corollaries 5.18, 5.20 and 5.22, pp.38–40.

*Needs:* `PadicHodgeRegulators` Layer 4 (`actual-coleman-image`); §0.11; §0.12.

**Checks.**

- For a_p = 0, SMC² keeps the nontrivial factor char(Λ/Im Col₂) on its η-components where Im(Col₂)^η ≠ Λ; only for i = 1 does the principal form hold for all η.
- Assumption (D) p ≥ k − 1 holds for every weight-two form; (C) holds for a_p = 0.

### 4.5 Kobayashi's and Pollack's signed objects

Let E/Q have good supersingular reduction at an odd prime p with a_p = 0. For the LLZ basis there are units a^± ∈ Λ_E(G_∞)^× with a^−·Col₁ = Col^− and a^+·Col₂ = Col^+, where Col^± are the plus and minus Coleman maps whose kernels define Kobayashi's local conditions E^±; consequently (1) the signed Selmer groups X¹, X² of §0.10 are Kobayashi's Sel^−(E/Q_∞)^∨ and Sel^+(E/Q_∞)^∨; (2) L̃_{p,1}, L̃_{p,2} are Pollack's L_p^−, L_p^+ up to units of Λ_E(G_∞), and the decomposition of L̃_{p,α}, L̃_{p,β} in LLZ Theorem 1.3 reduces to Pollack's decomposition with the half-logarithms log^±_p; (3) SMC^{1,η}, SMC^{2,η} are Kobayashi's minus and plus main conjectures char(Sel^∓(E/Q_∞)^{∨,η}) = char(Im(Col^∓)^η/(L_p^{∓,η})). The comparison is specific to a_p = 0; for a_p ≠ 0 the LLZ objects are not Pollack's plus/minus objects without a separate argument. The Coleman multipliers stated here lie in Λ_E×. On the same integral source, multiplication by these units in the rational target preserves zero, so their kernels coincide before inverting p. Each actual image lattice is carried to its corresponding image lattice; multiplication gives an O[[Γ]]-linear isomorphism of these transported images and their corrected zeta quotients when the period normalization is the same. This need not preserve the standard ambient O[[Γ]] lattice. Equality with a separately Néron-normalized Pollack function integrally requires the explicit period scalar to be a unit; without that comparison only the rational analytic identification is asserted.

E/Q, p odd, good supersingular reduction with a_p = 0 (automatic for p ≥ 5 supersingular).

Use the LLZ basis of Proposition 5.10.

For an integral equality with a separately normalized Pollack analytic function, require the integral period comparison and actual integral Coleman image normalization; a Λ_E-unit alone does not prove equality of principal ideals over Λ_O.

LLZ Proposition 5.10 and Corollary 5.11 give the units a^± relating Col_i and Col^±.

Pollack's plus/minus decomposition and half-logarithms are `ModularSymbolsPadicLFunctions` Layer 4 (`plus-minus-decomposition`) and `ModularSymbolsPadicLFunctions` Layer 4 (`half-logarithms`); Kato's reciprocity identifies Col^±(loc z) with them (`KatoEulerSystems` §§3.4 and 6.1–6.2 (`generalised-explicit-reciprocity-law-for-zeta-elements`)).

Kernels of unit multiples coincide, so the local conditions and hence the Selmer groups agree; insert into §0.11.

The source for this target is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Proposition 5.10 and Corollary 5.11, pp.35–36; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), §1.2 after Theorem 1.3, p.6, and §5.3, pp.38–40; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Remark 6.3, p.43.

*Needs:* §0.10; §0.11; `ModularSymbolsPadicLFunctions` Layer 4 (`plus-minus-decomposition`); `ModularSymbolsPadicLFunctions` Layer 4 (`half-logarithms`); `KatoEulerSystems` §§3.4 and 6.1–6.2 (`generalised-explicit-reciprocity-law-for-zeta-elements`); `PadicHodgeRegulators` Layer 4 (`coleman-coordinates`).

**Checks.**

- E = 14a1, p = 5 (a_5 = 0): X¹ = Sel^−(E/Q_∞)^∨, X² = Sel^+(E/Q_∞)^∨.
- This supplies the Kobayashi/Pollack formulation for `RankZeroOneBSD` BSD.0 and BSD.6a (`bstw-signed-main-conjecture`).

### Examples

For the a_p=0 elliptic basis, the second Coleman image is generated over Λ(Δ×Γ) by ∑δ∈Δ δ and γ−1. Its trivial tame component is Λ, since |Δ|=p−1 is a unit; each nontrivial component is (X). This is why “image equals Λ” cannot be asserted uniformly across tame characters. If a basis row changes from (b₁,b₂) to (b₁+b₂,b₂), the coordinate column changes from (c₁,c₂) to (c₁,c₂−c₁); the vector (1,0) becomes (1,−1), and the second kernel changes.

### Dependencies

Use Layers 0–3 and AutomorphicCongruences Layer 4’s universal endpoint. PadicMeasuresIwasawaAlgebras Layer 5 supplies derived determinants; the signed regulator supplier supplies integral Coleman maps, Wach bases and the local image computations. Each signed consequence also carries its own KMC component and integral normalization hypothesis.


## Layer 5: specialization, leading terms and arithmetic examples

### 5.1 Changing the imprimitive set: Euler factors on both sides

Let D be an ordinary datum with trivial character, p ∤ N, and Σ' ⊂ Σ finite sets of primes not containing p, with Σ ∪ {p} containing the ramification set of T. If X^Σ is Λ-torsion and T* has no nonzero G_Q-invariants, then 0 → (⊕_{ℓ∈Σ∖Σ'} H¹(Q_{∞,ℓ}, A))^∨ → X^Σ → X^{Σ'} → 0 is exact, each local term is torsion with no nonzero pseudo-null submodule and characteristic ideal (P_{T,ℓ}(ℓ^{-1}γ_ℓ^{-1})), where P_{T,ℓ}(Y)=det(1−Y·Frob_ℓ | V_{I_ℓ}) uses inertia coinvariants, with Frob_ℓ arithmetic and γ_ℓ its image in Γ; this is Skinner §2.3, pp.8–9, in the scalar-dual convention; hence char(X^Σ) = char(X^{Σ'})·∏_{ℓ∈Σ∖Σ'} (P_{T,ℓ}(ℓ^{-1}γ_ℓ^{-1})). On the analytic side L_f^Σ = L_f^{Σ'}·∏_{ℓ∈Σ∖Σ'} P_{T,ℓ}(ℓ^{-1}γ_ℓ^{-1}) with the same factors. Therefore IMC^Σ(D) ⟺ IMC^{Σ'}(D), integrally and rationally, and the same holds for KMC with Σ-partial lines.

Assume X^Σ is torsion; this then follows for X^{Σ′}.

Assume T* has no nonzero G_Q-invariants, as holds when ρ̄ is irreducible.

The same polynomial P_{T,ℓ} must be used on both sides; using the Euler factor of V where that of its dual is meant breaks the equality.

For the displayed exact sequence require Σ ∪ {p} to contain the ramification set, as in SU Proposition 3.2.18. Comparisons between arbitrary Σ,Σ′ pass through a common larger set containing that set; no unconditional localization-surjectivity assertion is made.

For a large Σ containing every ramified prime other than p, use SU Proposition 3.2.18. For arbitrary finite sets, compare each with a common larger set and cancel the identical nonzero analytic/algebraic Euler factors in the domain Λ.

For torsion and absence of pseudo-null submodules use Skinner–Urban Lemma 3.2.17(i). For the explicit Euler generator use Skinner §2.3, pp.8–9: the coinvariant polynomial above evaluated at ℓ⁻¹γ_ℓ⁻¹. Skinner–Urban §2.1.2 instead calls geometric Frobenius `frob`; convert the Frobenius and group-ring arguments together rather than retaining the same symbol across both conventions.

Analytic side: `ModularSymbolsPadicLFunctions` Layer 4 (`primitive-imprimitive-level-change`).

Multiplicativity of characteristic ideals in exact sequences: `PadicMeasuresIwasawaAlgebras` Layer 4 (charIdeal_mul_of_exact).

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17 and Proposition 3.2.18, pp.26–27; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.3, pp.8–9, and remark after Conjecture 2.5.1, p.15.

*Needs:* §0.5; §0.2; `ModularSymbolsPadicLFunctions` Layer 4 (`primitive-imprimitive-level-change`); `PadicMeasuresIwasawaAlgebras` Layer 4; `SelmerIwasawaCohomology` Layer 2 (`condition-change-triangle`).

**Checks.**

- For ℓ ∥ N with split multiplicative reduction of E, P_ℓ has degree one, and the factor 1−ℓ⁻¹γ_ℓ⁻¹ appears on both sides (arithmetic Frobenius acts by 1 on the inertia-coinvariant Tate line); for ℓ of good reduction P_ℓ has degree two.
- At ℓ=11 with the group-ring variable specialized to γ_ℓ=2, the split multiplicative Euler factor is 1−11⁻¹·2⁻¹=21/22; replacing γ_ℓ⁻¹ by γ_ℓ would give 9/11. This rational witness fixes the inverse group-ring argument.
- Skinner Conjecture 2.5.1: the conjecture for one Σ gives it for all Σ.

### 5.2 Invariance under extension of coefficients

For an ordinary datum D and a finite extension L'/L with ring of integers O', X^Σ(D ⊗ O') ≅ X^Σ(D) ⊗_O O', L_f^Σ is unchanged in Λ_{O'} = Λ ⊗_O O', and char_{Λ_{O'}}(M ⊗_O O') = char_Λ(M)Λ_{O'} for every finitely generated torsion Λ-module M. Since Λ → Λ_{O'} is faithfully flat, IMC^Σ(D ⊗ O') ⟺ IMC^Σ(D), and similarly for KMC and SMC.

Require O′/O finite, allowing ramification.

Take characteristic ideals over the regular rings Λ and Λ_{O′}.

For SMC, extend the integral Coleman domain, actual image lattices and basis as well as coefficients; do not replace the transported image with the whole coefficient ring.

Selmer groups commute with the flat base change ⊗_O O' (O' free over O).

Characteristic ideals commute with flat base change between normal noetherian domains when heights are preserved (`PadicMeasuresIwasawaAlgebras` Layer 4, base change of charIdeal).

For principal ideals I, J of Λ, IΛ_{O'} = JΛ_{O'} implies I = J by faithful flatness.

The source for this target is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, p.3, and remark after Conjecture 2.5.1, p.15 (relation (2.3.1)).

*Needs:* §0.5; §0.7; `PadicMeasuresIwasawaAlgebras` Layer 4.

**Checks.**

- Skinner's proof of Theorem A first replaces L by a finite extension; this theorem justifies it.
- A ramified extension multiplies μ-invariants by the ramification index e(L'/L) on both sides, so integral equalities are preserved.

### 5.3 μ- and λ-invariants of the two sides

Let O be a complete discrete valuation ring with uniformiser ϖ, Λ = O[[X]], and f, g ∈ Λ nonzero. If (f)Λ[1/ϖ] = (g)Λ[1/ϖ] and ϖ^n | f ⟺ ϖ^n | g for all n (equal μ-invariants), then f and g are associated in Λ. Consequently: (1) IMC(D) implies μ(X) = μ(L_f) and λ(X) = λ(L_f); (2) IMC_Q(D) together with μ(X) = μ(L_f) implies IMC(D); (3) the same holds for KMC and Mazur's conjecture; in particular IMC_Q(D) and μ(L_f) = 0 = μ(X) give the integral conjecture.

Assume O is a complete DVR, so Λ=O[[X]] is a UFD.

Use the μ and λ invariants of `PadicMeasuresIwasawaAlgebras` Layer 4 §4.4.

Λ is a UFD with ϖ prime; the units of Λ[1/ϖ] are ϖ^Z·Λ^×; so (f) = (g) in Λ[1/ϖ] means f = ϖ^m u g with m ∈ Z, u ∈ Λ^×, and equal μ forces m = 0.

For (1): Weierstrass preparation f = ϖ^μ P u (`PadicMeasuresIwasawaAlgebras` Layer 4 §4.3–4.4) and char(X) = (ϖ^{μ(X)} char-poly) give equality of invariants.

Apply to f = a generator of char(X), g = L_f.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2; [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2 and Remark 1.1.3, p.2.

*Needs:* `PadicMeasuresIwasawaAlgebras` Layer 4; Mathlib `PowerSeries`; Mathlib `Associated`; Mathlib `IsDiscreteValuationRing`; §0.5.

**Checks.**

- μ(X) = μ(L_f) = 0 and IMC_Q imply IMC: this is how integral statements are obtained once μ-vanishing is known.
- f = p, g = 1 have (f) = (g) in Λ[1/p] but different μ, so the μ-hypothesis is necessary.

### 5.4 The rank-zero p-converse

(1) (Skinner–Urban) Let E/Q, p≥3 a prime of good ordinary reduction with ρ̄_{E,p} irreducible and a prime q ≠ p, q ∥ N_E, at which ρ̄_{E,p} is ramified. If Sel_{p^∞}(E/Q) is finite then L(E,1) ≠ 0; equivalently, L(E,1) = 0 implies corank_{Z_p} Sel_{p^∞}(E/Q) ≥ 1. The same holds at p of multiplicative reduction under Skinner's Theorem C hypotheses. (2) (Fouquet–Wan) For f ∈ S_k(Γ_0(N)) satisfying the hypotheses of §2.2 with p ∤ N, the discrete Bloch–Kato Selmer group associated with a lattice in V = M(f)_{et,p}(k/2) and A=V/T is finite iff L(f, k/2) ≠ 0. (3) For f = f_E with E/Q and N not squarefull (Skinner–Urban) or arbitrary N (Wan), if rank E(Q) = 0 and Sha(E/Q)[p^∞] is finite for one sufficiently large ordinary p, then ord_{s=1}L(E,s) = 0.

(1): the hypotheses of §1.3 in weight two (or §1.6).

Assertion (2) uses the hypotheses of the pointwise theorem.

Assertion (3) uses the range quoted by Skinner 2020 §1; the all-N case rests on Wan's thesis, cited there.

In (2) finiteness concerns the discrete p-primary Selmer group. For the Q_p-vector-space Bloch–Kato group the corresponding conclusion is zero, not finiteness of a nonzero vector space. The statement for arbitrary N in (3) is source-reported context only; no proof from the narrower ordinary theorem is asserted.

For the good ordinary range in (1), prove `ordinaryAugmentationControl`: restriction Sel_{p^∞}(E/Q)→Sel_{p^∞}(E/Q_∞)^Γ has finite kernel and cokernel, so corank_{Z_p} Sel_{p^∞}(E/Q)=rank_{Z_p} X_Γ. Specialize the classical restriction-control sequence of SelmerIwasawaCohomology §3.11 to A=E[p^∞], using the ordinary local comparison of §0.2 and its global and local invariant error terms. This is the ordinary control input used in Skinner–Urban Theorem 3.6.11(b), p.46, via Greenberg [Gr99] Theorem 4.1. Then (γ−1) divides char(X) iff X_Γ has positive Z_p-rank; IMC and the nonzero trivial interpolation factor (1−α⁻¹)^2 identify this with L(E,1)=0. For the multiplicative case use Skinner Theorem C with the inertia condition and split-multiplicative correction of §§0.2 and 1.6; the good-ordinary nonzero interpolation factor cannot be used in that case.

For (2), apply Fouquet–Wan Corollary 5.3: if the specialisation of z(f)_Iw at γ ↦ 1 vanishes, (γ − 1) divides char(H¹/z) = char(H²), giving positive corank; otherwise its image spans a nonzero line in H¹_f.

For (3), Skinner 2020 §1 records this converse from the ordinary main conjecture.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 2 (= Theorem 3.6.11), pp.3 and 46; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), Theorem C, p.3; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Corollary 1.9, p.8, and Corollary 5.3 with its proof, p.69; [Christopher Skinner](https://arxiv.org/abs/1405.7294), §1, pp.1–2.

*Needs:* §1.3; §1.6; §2.2; SelmerIwasawaCohomology Layer 3, §3.11 (classical restriction control); §0.2; §0.7.

**Checks.**

- E = 11a1 at p = 7: L(E,1) ≠ 0 and Sel_{7^∞}(E/Q) is finite, consistent with (1).
- In the good ordinary range, finite changes to the control kernel or cokernel do not change Z_p-corank. A local error with a copy of Q_p/Z_p would change it and must fail the finite-error criterion.
- At split multiplicative reduction the analytic trivial-character value vanishes even if L(E,1)≠0; the good-ordinary control/interpolation argument cannot be reused unchanged.
- The rank-one converse belongs to `RankOneConverse` PC.3 (`theorem-b`), not this comparison.

### 5.5 The ℒ-invariant of a split multiplicative curve

Let E/Q_p have split multiplicative reduction, with Tate parameter q_E ∈ Q_p^×, |q_E| < 1, so that E(Q̄_p) ≅ Q̄_p^×/q_E^Z (the Tate curve). The ℒ-invariant is ℒ_p(E) := log_p(q_E)/ord_p(q_E), where log_p is Iwasawa's branch of the p-adic logarithm (log_p(p) = 0). For a weight-two newform f with p ∥ N and a_p = 1 attached to E, ℒ(V_f) := ℒ_p(E) is the Mazur–Tate–Teitelbaum ℒ-invariant.

Assume split multiplicative reduction, so a_p=1.

Iwasawa's normalisation log_p(p) = 0; a different branch changes ℒ_p(E) by a multiple of the branch constant.

The usable interface consists of the following named outputs.

- `tateLInvariant`: ℒ_p(E) ∈ Q_p for E/Q_p split multiplicative.
- `tateLInvariant_def`: ℒ_p(E)·ord_p(q_E) = log_p(q_E).
- `tateLInvariant_ne_zero`: For E/Q, ℒ_p(E) ≠ 0 (`DiophantineApproximationAndTranscendence` DT.5).
- `tateLInvariant_isogeny`: Q_p-isogenous split multiplicative curves have the same ℒ-invariant. Their Tate lattices are commensurable: there are positive integers a,b with q_E^a=ζq_E′^b for a root of unity ζ. Thus a·log_p(q_E)=b·log_p(q_E′) and a·ord_p(q_E)=b·ord_p(q_E′); the positive valuations permit division. This covers both an isogeny and its dual, including when one parameter is a root of a power of the other.
- `tateLInvariant_ofForm`: For f = f_E with p ∥ N and a_p = 1, ℒ(V_f) = ℒ_p(E).

The Tate parameter is supplied by the Tate curve of TauCetiRoadmap.EllipticCurves Layer 4 (the analytic strand over a complete rank-one valued field).

The p-adic logarithm on Q_p^× with log_p(p) = 0 is not in Mathlib at the pin; it is imported from `ColemanIntegration` Layer 0 (`iwasawa-logarithm`).

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Remark 0.10, p.255; Remark 0.13(i), p.256; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §2.4, (2.4.3), p.15.

*Needs:* TauCetiRoadmap.EllipticCurves Layer 4 `ColemanIntegration` Layer 0 (`iwasawa-logarithm`); `DiophantineApproximationAndTranscendence` DT.5.

**Checks.**

- With log_p(p) = 0, ℒ_p(E) is independent of writing q_E = p^n u with u ∈ Z_p^×: ℒ_p(E) = log_p(u)/n.
- For E = 11a1 at p = 11, ord_11(q_E) = ord_11(Δ) = 5, so ℒ_11(E) = log_11(q_E)/5.
- For nonsplit multiplicative reduction (a_p = −1) the p-adic L-function has no trivial zero and no ℒ-invariant enters; the definition is restricted to a_p = 1.
- ord_p(q_E) = ord_p(Δ_E^{min}) = −ord_p(j_E) > 0.
- For q and q^p, both logarithm and valuation scale by p. For instance 21/14=3/2, whereas scaling only the valuation gives 3/14≠3/2. The reverse isogeny uses the same equality in the other direction.
- The local Tate curve with parameter q=p has ℒ=0. The nonvanishing assertion for E/Q uses algebraicity of the global j-invariant and the transcendence input; it is not asserted for every E/Q_p.
- ℒ_p(E) ≠ 0 for E/Q (Barré-Sirieix–Diaz–Gramain–Philibert, transcendence of q_E), supplied by `DiophantineApproximationAndTranscendence` DT.5.

### 5.6 The Mazur–Tate–Teitelbaum p-adic BSD conjecture

Let E/Q have good ordinary or multiplicative reduction at an odd p, r = rank E(Q), α the unit root, L_{p,α}(E, s) the function of §3.2, ⟨ , ⟩_{p,α} the p-adic height on Q_p ⊗ E(Q) attached to the splitting of the Hodge filtration given by the α-eigenline of Frobenius, and R_{p,α}(E) its regulator. MTT(E, p) is the proposition: (i) if α ≠ 1, ord_{s=1} L_{p,α}(E, s) ≥ r and lim_{s→1} (s − 1)^{−r} L_{p,α}(E, s) = (1 − α^{-1})^{b+1}·#Sha(E)·R_{p,α}(E)·∏_v m_v; (ii) if α = 1, the order is ≥ r + 1 and lim_{s→1} (s − 1)^{−r−1} L_{p,α}(E, s) = ℒ_p(E)·#Sha(E)·R_{p,α}(E)·∏_v m_v. Here b=1 in good reduction and b=0 in multiplicative reduction. As in Colmez Conjecture 0.12, R_{p,α}(E) := e^{−2} det(⟨P_i, P_j⟩_{p,α}) for P_1, …, P_r spanning Q ⊗ E(Q) and generating a subgroup of index e in E(Q) (so R_{p,α}(E) = #E(Q)_tors^{−2} when r = 0), m_v is the number of components at v (m_∞ for E(R), the Tamagawa number at finite v), and Ω_E^+ satisfies m_∞Ω_E^+ = |∫_{E(R)} ω_E|. The exact proposition MTT includes finiteness of the full Sha(E/Q), so #Sha has its usual finite meaning. Define separately MTT_p: assume only Sha(E/Q)[p∞] finite and use its order in the displayed leading-term formula up to multiplication by a Z_p-unit (there exists u∈Z_p× multiplying the right side to give the left side, including when both sides are zero), retaining the same order lower bound. If the regulator is nonzero this formula gives the exact order. These exact and unit propositions are not identified.

Assume good ordinary or multiplicative reduction at an odd p.

The p-adic height pairing is an input (the Mazur–Tate/Schneider height for ordinary E); its nondegeneracy is not known in general.

The torsion enters through the index e in the regulator, as in Colmez's normalisation of R_∞(E); the formula must not divide by #E(Q)_tors² a second time.

MTT uses full Sha finiteness; MTT_p uses only finiteness of its p-primary part. This finiteness is supplied as an input, not inferred merely by writing #Sha.

The usable interface consists of the following named outputs.

- `MTT`: MTT(E,p): finiteness of full Sha and the displayed exact leading-term/order statement. MTT_p(E,p): finiteness of Sha[p∞] and the corresponding leading coefficient up to a Z_p-unit, with #Sha[p∞].
- `MTT.order_lower_bound`: ord_{s=1} L_{p,α}(E, s) ≥ r (+1 if α = 1) is Kato's theorem (Colmez Theorem 0.15), stated separately.
- `MTT_p.rank_zero_iff_BSD_p`: For r=0, α≠1 and Sha[p∞] finite, MTT_p(E,p) ↔ the p-part of classical BSD. With full Sha finite, exact MTT ↔ exact classical BSD.
- `MTT.exceptional_rank_zero`: For r=0, α=1, Greenberg–Stevens identifies exact MTT with exact classical BSD; it identifies MTT_p with the p-part, since ℒ_p(E)≠0 and can be cancelled in either equality.

State with L_{p,α}(E, s) (§3.2), ℒ_p(E) (§5.5) and the p-adic height.

Take an arithmetic cyclotomic height pairing, with its splitting and normalization, as explicit input to this proposition. A Bockstein pairing alone is insufficient: the application in §5.8 also requires its comparison with Schneider’s analytic κ-height.

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), §0.3 (from p.254): Conjecture 0.12 and note 14, p.256; [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.15, p.257; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7.

*Needs:* §3.2; §5.5; the specified arithmetic height as an input.

**Checks.**

- For E = 11a1, p = 7, r = 0, taking #Sha = 1 as an explicit arithmetic input to this numerical test: R_{p,α} = 5^{−2}, m_∞ = 1, m_11 = 5, so MTT predicts L_{7,α}(E,1) = (1 − α^{-1})²·5/25 = (1 − α^{-1})²/5, matching Colmez Remark 0.10's value (1 − α^{-1})² L(E,1)/Ω_E^+ with L(E,1)/Ω_E^+ = 1/5.
- For split multiplicative E with r=0 and the finiteness input, the regulator is #E(Q)_tors⁻²≠0 and ℒ_p(E)≠0, so either MTT or MTT_p predicts order exactly one, never zero.
- Using the canonical (Néron–Tate) real regulator in place of R_{p,α}(E) gives a statement with the wrong field of values: the leading coefficient lies in Q_p, the real regulator in R.
- Kato's theorem (Colmez Theorem 0.15): ord_{s=1} L_{p,α}(E,s) ≥ r (≥ r + 1 if α = 1), and equality implies Sha[p^∞] finite and R_{p,α}(E) ≠ 0 — a consequence, not an assumption.
- In rank zero with α≠1 and full Sha finite, exact MTT is equivalent to the full numerical BSD formula. With only Sha[p∞] finite, MTT_p is equivalent to its p-part. Even at an anomalous ordinary prime, the nonzero factor 1−α⁻¹ cancels in the comparison; it need not be a p-adic unit.

### 5.7 Trivial zeros in analytic rank zero

Let E/Q have good ordinary or multiplicative reduction at an odd prime p with L(E,1) ≠ 0. Then ord_{s=1} L_{p,α}(E, s) ∈ {0, 1}, with order one iff E has split multiplicative reduction at p (α = 1), and in that case L'_{p,α}(E, 1) = ℒ_p(E)·L(E,1)/Ω_E^+ (Greenberg–Stevens) with ℒ_p(E) ≠ 0. Consequently, if Sha(E/Q) is finite, exact MTT(E,p) and the full classical BSD formula are equivalent; with only Sha[p∞] finite, MTT_p and the p-part are equivalent in this case.

L(E,1) ≠ 0.

The derivative formula is Greenberg–Stevens' theorem, supplied by `PadicFamilies` Layer 3 (it uses the Mazur–Kitagawa two-variable p-adic L-function).

Nonvanishing of ℒ_p(E) is supplied by `DiophantineApproximationAndTranscendence` DT.5.

If α ≠ 1 the value at s = 1 is (1 − α^{-1})^{b+1} L(E,1)/Ω_E^+ ≠ 0 (§3.2).

If α = 1 the value vanishes; Greenberg–Stevens gives the derivative (`PadicFamilies` Layer 3), nonzero since ℒ_p(E) ≠ 0 (`DiophantineApproximationAndTranscendence` DT.5) and L(E,1) ≠ 0.

Compare with §5.6 in rank zero, where R_{p,α} = #E(Q)_tors⁻².

The source for this target is [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Remark 0.10 and Theorem 0.11, p.255; Remark 0.13(i), p.256; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), (2.4.3), p.15.

*Needs:* §3.2; §5.5; `PadicFamilies` Layer 3; `DiophantineApproximationAndTranscendence` DT.5; §5.6.

**Checks.**

- For E = 11a1 at p = 11 (split, L(E,1) ≠ 0): the p-adic L-function has a simple zero at s = 1 with derivative ℒ_11(E)/5.
- This supplies the trivial-zero comparison for `RankZeroOneBSD` BSD.6.

### 5.8 The main conjecture implies p-adic BSD under nondegenerate heights

Let E/Q have good ordinary reduction at an odd prime p, irreducible E[p], finite Sha(E/Q)[p^∞], and a nondegenerate cyclotomic p-adic height. Use the analytic κ-height of Schneider §7, with its comparison to the height and cyclotomic coordinate in MTT_p(E,p) fixed. Assume also the flat Néron-model/Galois ordinary Selmer comparison specified below. If MMC(E,p) holds, then ord_{s=1} L_p(E,s)=rank E(Q)=r and its leading coefficient satisfies MTT_p(E,p): L_p^{(r)}(E,1)/r! ∼_p (1−α⁻¹)^2 R_p(E) · #Sha(E/Q)[p^∞] · ∏_{ℓ|N}c_ℓ(E) / #E(Q)_tors^2. Here ∼_p denotes equality up to Z_p×. This is the p-primary, up-to-unit consequence; it is not an exact MTT identity. In this display R_p is the unnormalized determinant on a basis of the free Mordell–Weil group; thus R_{p,α} of §5.6 equals R_p/#E(Q)_tors². The torsion denominator is included exactly once.

Assume p is good ordinary and ρ̄ is irreducible.

Assume Sha[p^∞] is finite and ⟨ , ⟩_{p,α} is nondegenerate.

Assume MMC(E,p), for instance from §3.5.

The ordinary Galois Selmer characteristic series is identified with Schneider’s algebraic Iwasawa L-function under the control/comparison contract with `SelmerIwasawaCohomology` Layer 3.

The height is Schneider’s analytic κ-height, or a height equipped with a proved normalization comparison. Keep log_p κ(γ)^r when passing from X to s; that factor is not a p-adic unit.

Apply Schneider §2 Theorem 2′ (p.342) and §7 Theorems 6–7 (p.371): the algebraic Iwasawa L-function has order r and leading coefficient, up to a p-adic unit, det(height)·#Sha[p∞]·∏_v#π_v(E)·#Ẽ(F_p)^2/#E(Q)_tors^2. Theorem 6 identifies the algebraic and analytic κ-heights up to sign.

Compare Schneider’s flat Néron-model cohomology and its alternating characteristic factors (§§1–2) with the ordinary Galois Selmer dual. Irreducibility removes global p-power torsion terms. This is the explicit supplier obligation below, rather than an assertion that the objects are definitionally equal.

Use #Ẽ(F_p)=(1−α)(1−p/α), so #Ẽ(F_p)^2 ∼_p (1−α⁻¹)^2, including anomalous primes. Transfer the characteristic-series leading term through MMC(E,p). The explicit ratio before squaring is −α(1−p/α), a p-adic unit even if 1−α⁻¹ is a nonunit. This comparison cannot justify discarding #Ẽ(F_p)^2 itself.

Schneider evaluates in the coordinate κ(γ)^{1−s}−1; the convention here uses κ(γ)^{s−1}−1. The sign contributes a unit, while the factor log_p κ(γ)^r must be matched with the regulator normalization. Use the specified height comparison to obtain the displayed MTT_p formula.

The source for this target is [Peter Schneider](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF), §2 Theorem 2′, p.342; §7 Theorems 6–7, p.371; algebraic Iwasawa L-function in §2, p.341; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7; [Pierre Colmez](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), note 14, p.256.

*Needs:* §3.3; §5.6; the arithmetic height and its explicit comparison; `SelmerIwasawaCohomology` Layer 3.

**Checks.**

- In rank zero the regulator is 1 and the coordinate logarithm has exponent zero, yielding the p-part of the rank-zero BSD expression. This does not infer the full exact BSD formula from an integral ideal equality.
- Without nondegeneracy, the order of vanishing of char(X) at the trivial character can exceed the rank.
- If F(X)=a_r X^r+O(X^(r+1)) and c=log_p κ(γ), substitution X=κ(γ)^(s−1)−1 gives leading coefficient a_r c^r; the inverse coordinate gives (−1)^r a_r c^r. The sign is a unit, whereas c^r generally is not. The height comparison must account for exactly this power, including r=0.

### 5.9 The modular instances of the Greenberg and Coates–Perrin-Riou propositions

Let D be an ordinary datum with trivial character and V := V_f ⊗ det ρ_f^{-1}. (1) V is p-ordinary with Greenberg filtration F^+V = V^+ ⊗ det ρ_f^{-1}, r_V = r_{V^∨} = 0 is the criticality of the relevant twists (V^∨=Hom(V,Q_p(1)) is the Tate dual), and the trivial tame-component projection of Greenberg’s proposition (`SelmerIwasawaCohomology` Layer 4 (`greenberg-main-conjecture`)) for (V,L_p(V)) is IMC_Q(D), after descending its Selmer group over F∞^+=Q(μ_{p∞})^+ to Q∞ and identifying that projected analytic function with L_f. (2) The Coates–Perrin-Riou existence proposition for V (owned by `AutomorphicPadicLFunctions` Layer 5) is satisfied by L_f: its interpolation formula at the critical twists is the Skinner–Urban formula of §0.4 with Deligne periods Ω_f^± and the modified Euler factors at p. (3) The proposition 'Greenberg's conjecture for every ordinary V' is not proved here; nor is Greenberg's μ = λ = 0 conjecture for totally real fields.

Use an ordinary datum and the Coates–Perrin-Riou proposition in the form fixed by `AutomorphicPadicLFunctions` Layer 5.

Use the trivial character of Gal(F∞^+/Q∞), whose order (p−1)/2 is a p-adic unit; the full Greenberg proposition over F∞^+ includes other tame components. V^∨ means the Tate dual, not the untwisted linear dual.

For (1), unwind the Greenberg Selmer group of V over the cyclotomic Z_p-extension (`SelmerIwasawaCohomology` Layer 2 (`greenberg-condition`)) as the Skinner–Urban Selmer group. Apply finite-group inflation–restriction and the tame idempotent to descend from F∞^+ to Q∞ (order prime to p); match the same component of the analytic function. The whole conjecture over F∞^+ is not identified with just its trivial component.

For (2), compare the interpolation factor of Coates–Perrin-Riou with Skinner–Urban's e(φ) and Gauss sums (Rodrigues Jacinto–Williams Appendix B.2–B.3).

The source for this target is [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), §13.5.3, Conjecture 13.21, p.71; [Joaquín Rodrigues Jacinto and Chris Williams](https://arxiv.org/abs/2309.15692v2), Appendix B.2.3–B.3(1), pp.80–81.

*Needs:* `SelmerIwasawaCohomology` Layer 4 (`greenberg-main-conjecture`); `AutomorphicPadicLFunctions` Layer 5; §0.5; §0.4; `SelmerIwasawaCohomology` Layer 3 (`iwasawa-shapiro`).

**Checks.**

- Rodrigues Jacinto–Williams Theorem B.4 (the main conjecture for f 'under mild technical hypotheses') is made explicit by the theorems of Layers 1–4 with their hypotheses.
- Example 13.22 of Rodrigues Jacinto–Williams (V = Q_p(n)) is the GL(1) instance, not a modular one.

### 5.10 Verified weight-two examples

(a) E = 11a1 = [0,−1,1,−10,−20] (N = 11, Δ = −11⁵, split at 11, torsion Z/5, only 5-isogenies, Manin constant 1) at p = 7: a_7 = −2, ordinary; ρ̄ irreducible; (SU_11) holds since 7 ∤ 5; (FW1.6_11) fails (split); (LocExc_7) holds (ā_7² = 4 ≠ 1); hence §1.3 and §3.5 give MMC(11a1,7) integrally. §2.2 also gives KMC (Theorem 5.1 form, μ trivial allowed as ρ̄|G_{Q_7} is reducible); its independent transport to MMC uses the recorded integral period comparison, while the Fouquet–Wan ordinary theorem does not apply. (b) E = 14a1 = [1,0,1,4,−6] (N = 14, Δ = −2⁶·7³, nonsplit at 2, split at 7, isogeny degrees 1, 2, 3, 6) at p = 13: a_13 = −4, ordinary; ρ̄ irreducible (no 13-isogeny); (FW1.6_2) holds since 13 ∤ 6; so §1.4 applies. (c) E = 14a1 at p = 5: a_5 = 0, supersingular, crystalline nonordinary; ρ̄_{E,5} surjective (5 is not a nonmaximal prime); ℓ = 2 nonsplit with 5 ∤ 6; hence §2.2 gives KMC, and §4.3 with §4.5 gives the LLZ actual-image signed equalities. The identification with separately Néron-normalized Kobayashi–Pollack ± analytic equalities is conditional on the unit-period comparison in §4.5.

The reduction types, discriminants, a_p values and isogeny data are those of the minimal models (checked by point counts and against LMFDB's curve data).

Compute a_p by point counting on the minimal model, a_ℓ = ±1 at the multiplicative primes, and ord_ℓ(Δ_min); ρ̄ ramified at ℓ iff p ∤ ord_ℓ(Δ_min) (§1.1).

Irreducibility of ρ̄_{E,p}: a reducible ρ̄_{E,p} gives a rational p-isogeny, excluded by the isogeny degrees; for p odd, irreducible odd representations are absolutely irreducible.

Check each theorem's hypothesis list in turn, recording which theorem applies and which does not.

Point counts independently give a_7(11a1)=−2 and a_5(14a1)=0, a_13(14a1)=−4. They also give a₂(11a1)=−2 and a₃(14a1)=−2: the Frobenius discriminants are respectively −4≡3 mod 7, and −8≡2 mod 5 or 5 mod 13. Each is nonsquare, giving an independent irreducibility certificate in these three cases. The Weierstrass discriminants are −161051 and −21952. Database analytic Sha values are not used as a proof of actual Sha orders.

The source for this target is [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 1, p.2; remark after Theorem 2, p.3; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorems 1.6, 5.1, pp.6–7, 68; [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), assumptions (A), (E), pp.14, 43; [The LMFDB Collaboration](https://www.lmfdb.org/EllipticCurve/Q/11/a/2), Curve 11.a2, equations, modular invariants, local data and isogenies; accessed 2026-10-19; [The LMFDB Collaboration](https://www.lmfdb.org/EllipticCurve/Q/14a1/), Curve 14.a6, local data, Galois representations and isogenies; accessed 2026-10-19.

*Needs:* §1.3; §1.4; §2.2; §3.5; §4.3; §4.5; §1.1.

**Checks.**

- 11a1 at p = 7: the trivial-character value of L_p is (1 − α^{-1})²/5 ≠ 0, matching finiteness of Sel_{7^∞}(E/Q).
- 14a1 at p = 5: (A) holds as a_5 = 0; (E) holds as the 5-adic image is GL₂(Z_5).

### 5.11 A higher-weight example

Let f = η(z)⁴η(5z)⁴ = q − 4q² + 2q³ + 8q⁴ − 5q⁵ − 8q⁶ + 6q⁷ + ⋯, the newform spanning S_4(Γ_0(5)) (a_2 = −4, a_3 = 2, a_5 = −5, a_7 = 6, a_11 = 32, a_13 = −38). At p = 7: a_7 = 6 is a 7-adic unit, so f is ordinary; (dist) holds since the residual characters are unramified and ω^{−3} ≠ 1; ρ̄ is irreducible over F_7 because the Frobenius polynomial at 2 is X²−a_2X+2³, with discriminant a_2²−4·2³=−16≡5 mod 7, a nonsquare. Oddness at p≠2 makes this rank-two irreducibility absolute; π(f)_5 is the Steinberg representation twisted by the unramified character with μ(5) = −1 (from a_5 = −5 = μ(5)·5); and the inertia-invariant line has Frobenius eigenvalue μ(5)·5^{−1} ≡ 4 ≢ 1 mod 7, so dim ρ̄^{D_5} = 0 once ρ̄ is ramified at 5. Granting the ramification at 5, §1.4 gives KMC for f at p = 7; Skinner–Urban's theorem does not apply (k = 4 ≢ 2 mod 6). At p = 13, the tested prime coefficients satisfy a_ℓ≡1+ℓ³ mod 13 and 13 divides 5⁴−1. These are diagnostics of an Eisenstein congruence, not a proof of reducibility: a complete congruence/Sturm argument and residual recognition would be needed to turn this into a non-example.

The q-expansion is computed from the eta product; multiplicativity a_4 = a_2² − 8, a_6 = a_2a_3, a_25 = a_5² is checked.

The named arithmetic input `etaProduct_residualRamifiedAtFive` is the assertion that this f has ρ̄_7(I_5)≠1. It is not proved here. A proposed level-lowering route would exclude an unramified representation using S_4(SL₂(Z))=0, but the inequalities 4≤7+1 and 5≢1 mod 7 alone are not a verified theorem with all its local and lattice hypotheses. No unconditional ramification claim is made from that route or from the nonsquare Frobenius polynomial. The §1.4 application retains this explicit input; the example is not a supplier of any other endpoint.

Compute coefficients and check the Hecke relations.

Check ordinarity, the nonsquare Frobenius discriminant at 2 for p=7, oddness and the local residual conditions. The claimed p=7 application remains conditional on the recorded ramification-at-5 input.

Check (FW1.6_5) in Fouquet–Wan's normalisation.

The source for this target is [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorems 1.4 and 1.6, pp.5–7; [Christopher Skinner and Eric Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.6.4, p.43.

*Needs:* §1.4; §1.1; §1.3.

**Checks.**

- The p=13 calculation is a diagnostic only. Finite trace agreement must not be used to conclude reducibility. These coefficient checks remain here in prose, rather than as isolated arithmetic examples in the representative Lean file.
- Kato's divisibility (k > 2) holds here without potential good reduction (Fouquet–Wan Theorem 1.4(2)).

### Examples

For 11a1, Δ_min=−11⁵ and a₇=−2, so 7∤5 and ā₇²=4≠1. For 14a1, Δ_min=−2⁶7³, a₁₃=−4 and a₅=0. Thus p=13 is ordinary and p=5 is supersingular with a_p=0; both see ramification at 2. The full theorem checks and the conditional higher-weight application appear in §§5.10–5.11. In rank zero the MTT regulator is #E(Q)_tors⁻², whereas Schneider’s unnormalized empty determinant is 1; putting both torsion conventions into the same formula would count the torsion factor twice.

### Dependencies

Use Layers 0–4; PadicMeasuresIwasawaAlgebras Layer 4 for characteristic ideals and Weierstrass invariants; SelmerIwasawaCohomology for localization, control and the Schneider comparison contract; ColemanIntegration Layer 0 for the Iwasawa logarithm; EllipticCurves Layer 4 for point uniformization; PadicFamilies Layer 3 for Greenberg–Stevens; and DiophantineApproximationAndTranscendence DT.5 for nonvanishing of the ℒ-invariant. The arithmetic height, its nondegeneracy and the higher-weight ramification input are explicit inputs where used.


## Layer 6: comparison with other arithmetic branches

### 6.1 The anticyclotomic interface

Let E/Q, p > 3 good ordinary, K imaginary quadratic with (disc), (Heeg), (spl), Λ_K^− = Z_p[[Γ_K^−]] and Λ_K^{−,ur} = Λ_K^− ⊗̂ Ẑ_p^{ur}. The Heegner point main conjecture (char(X_ord(E/K_∞^−)_tors) = char(H¹_{F_Λ}(K, T)/(κ_1^{Heeg}))²) and the Greenberg–BDP main conjecture (char(X_Gr(E/K_∞^−)) = (L_p^{BDP}(E/K)) in Λ_K^{−,ur}) are compared through `HeegnerPointEulerSystems` HE.8b (`anticyclotomic-formulation-comparison`) (the BDP square convention, the coefficient extension to Λ_K^{−,ur}, finite local cokernels and ι), and the proved branch endpoints of `HeegnerPointEulerSystems` HE.8b — rational under (irr_Q), integral under (sur) — are re-exported in these formulations. The anticyclotomic equality is over Λ_K^{−,ur}, never over Λ_K^− unless the source proves the descent; rational and integral statements stay distinct.

(disc): D_K odd, ≠ −3; (Heeg): every ℓ | N splits in K; (spl): p splits in K.

The proofs belong to `HeegnerPointEulerSystems` HE.8b; this comparison is the formulation interface only.

Import `HeegnerPointEulerSystems` HE.8b (`rational-heegner-main-conjecture`), HE.8b (`integral-heegner-main-conjecture`), HE.8b (`rational-greenberg-bdp-main-conjecture`), HE.8b (`integral-greenberg-bdp-main-conjecture`).

Use `HeegnerPointEulerSystems` HE.8b (`anticyclotomic-formulation-comparison`) and HE.8b (`bdp-function-convention-comparison`) for the dictionary.

Do not identify ideals up to units with normalised elements.

The source for this target is [Ashay Burungale, Francesc Castella and Christopher Skinner](https://arxiv.org/abs/2405.00270v2), §1.2, Conjecture 1.2.1, Theorems 1.2.2 and 1.2.4, pp.2–3.

*Needs:* `HeegnerPointEulerSystems` HE.8b (`anticyclotomic-formulation-comparison`); `HeegnerPointEulerSystems` HE.8b (`bdp-function-convention-comparison`); `HeegnerPointEulerSystems` HE.8b (`rational-heegner-main-conjecture`); `HeegnerPointEulerSystems` HE.8b (`integral-heegner-main-conjecture`); `HeegnerPointEulerSystems` HE.8b (`rational-greenberg-bdp-main-conjecture`); `HeegnerPointEulerSystems` HE.8b (`integral-greenberg-bdp-main-conjecture`); §0.5.

**Checks.**

- Burungale–Castella–Skinner Theorems 1.2.2/1.2.4 are the two formulations of the same theorem.
- The rank-one statements of the Heegner form require H¹_{F_Λ} and X of Λ_K^−-rank one; those are part of the imported theorems.

### 6.2 The Eisenstein-prime branch interface

For E/Q and a good ordinary Eisenstein prime p (E[p] reducible), the integral cyclotomic main conjectures proved in `RankZeroOneBSD` BSD.7a (Castella–Grossi–Skinner Theorems A/C and the weight-two specialisation of Keller–Yin Theorem 3.0.10) are re-exported in the formulation of §3.3 for the lattice and imprimitive set used there, keeping the residual-character exclusions, the local-invariant corrections at the bad primes, the distinguished lattice and the finite-submodule corrections. The irreducible-prime theorems of Layers 1–3 are not used for this branch.

Assume p>2, p∤N and E[p] reducible. CGS additionally requires its isogeny-kernel character at G_p to differ from 1 and ω; KY Theorem 3.0.10 has no such exclusion and includes rational p-torsion.

The lattice is the one of the imported theorem; change of lattice multiplies characteristic ideals by explicit powers of p.

Import `RankZeroOneBSD` BSD.7a (`cgs-cyclotomic-main-conjecture`) and `RankZeroOneBSD` BSD.7a (`ky-cyclotomic-main-conjecture`).

Use the imported theorem’s integral Néron-normalized analytic function directly. The irreducible-prime integrality lemma of §3.2 is not available here. Compare local conditions, lattices and Euler factors only under the supplier’s actual Eisenstein hypotheses; do not invoke Layer 5’s irreducibility-based surjectivity criterion.

The source for this target is [Francesc Castella, Giada Grossi and Christopher Skinner](https://arxiv.org/abs/2303.04373v2), Theorem A, p.2 (cyclotomic endpoint), and Theorem C, p.3 (the anticyclotomic input); [Timo Keller and Mulun Yin](https://arxiv.org/abs/2402.12781v2), Theorem 3.0.10 and its proof, p.41 (weight two, with the local-character exclusion removed).

*Needs:* `RankZeroOneBSD` BSD.7a (`cgs-cyclotomic-main-conjecture`); `RankZeroOneBSD` BSD.7a (`ky-cyclotomic-main-conjecture`); its branch-specific primitive/imprimitive comparison (§11.8 of that package, with its actual invariant and surjectivity hypotheses); §3.3. Section 5.1 is not an unconditional Eisenstein-prime cancellation theorem.

**Checks.**

- 11a1 at p=5 is a good ordinary Eisenstein prime with rational 5-torsion. It is excluded from the irreducible theorems of Layers 1–3 and from CGS’s local exclusion, but it is included in the KY supplier endpoint, subject to its integral Néron normalization.
- Kato's divisibility is only rational at Eisenstein primes in `KatoEulerSystems` Layer 7; integral inputs come from the imported theorems.

### 6.3 The supersingular and multiplicative anticyclotomic branch interfaces

(1) Let E/Q be semistable and let p>2 be a good supersingular prime, with a_3(E)=0 if p=3 (for p≥5, a_p=0 is automatic). The signed main conjecture of Burungale–Skinner–Tian–Wan (`RankZeroOneBSD` BSD.6a (`bstw-signed-main-conjecture`)) gives char_Λ X^±=(L_p^±) in the integral Néron-normalized Kobayashi formulation. Its base statement imposes no additional residual-image hypothesis. The same endpoint holds for a quadratic twist E^K when the quadratic discriminant is coprime to Np and supported on primes of ordinary reduction for E; coprimality alone does not suffice.

(2) Let E/Q have conductor N and multiplicative reduction at p>3. Let K be imaginary quadratic, with an ideal 𝔑⊂O_K satisfying O_K/𝔑≃Z/NZ, and with p split. Require E[p] irreducible over G_Q; if 2 is nonsplit in K, require 2∥N; at every q∥N nonsplit in K require nonsplit multiplicative reduction, with at least one such q where E[p] is ramified; and require E(Q_p)[p]=0. Castella's corrected theorem (`RankZeroOneBSD` BSD.6a (`castella-anticyclotomic-main-conjecture`)) then gives Λ-torsion X_ac and char(X_ac)Λ_{R₀}=(L_p(f)) for its strict/unrestricted local conditions and multiplicative BDP normalization. Neither branch follows from Layers 1–4.

Retain every hypothesis of the imported branch theorem.

Layers 0 and 4 supply the signed formulation only in its own range (a_p = 0 for the Kobayashi identification).

Import the two `RankZeroOneBSD` BSD.6a endpoints and `RankZeroOneBSD` BSD.6a (`bstw-signed-main-conjecture-comparison`).

For (1) use the a_p=0 kernel dictionary of §4.5 and the supplier’s integral normalization. For (2) use BSD.6a (`castella-anticyclotomic-main-conjecture`) itself with its multiplicative local conditions; §6.1 assumes good ordinary reduction and is not a theorem at a multiplicative prime. No Heegner-square equivalence is imported across that boundary.

The arithmetic endpoints are [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.3, p.3, with the a_p=0 convention (1.7), p.6; and [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), corrected Theorem 1.1, p.1. The signed-kernel comparison, rather than the arithmetic main conjecture, is [Antonio Lei, David Loeffler and Sarah Livia Zerbes](https://arxiv.org/abs/0912.1263v3), Proposition 5.10 and Corollary 5.11, pp.35–36.

*Needs:* `RankZeroOneBSD` BSD.6a (`bstw-signed-main-conjecture`); `RankZeroOneBSD` BSD.6a (`bstw-signed-main-conjecture-comparison`); `RankZeroOneBSD` BSD.6a (`castella-anticyclotomic-main-conjecture`); §4.5; §6.1.

**Checks.**

- 14a1 at p=5 is semistable and supersingular, hence lies in the BSTW supplier theorem’s stated range. Additional vanishing/non-torsion hypotheses belong to the supplier’s comparison identity, rather than its base semistable main-conjecture statement.
- At p=3 a supersingular curve with a_3=±3 fails the stated BSTW hypothesis; at p≥5 the Hasse bound forces a_p=0. No extra surjectivity assumption is added to Theorem 1.3.
- A twist discriminant coprime to Np but containing a supersingular reduction prime fails the twist hypothesis. In Castella’s branch, residual irreducibility does not discharge E(Q_p)[p]=0 or the nonsplit-multiplicative condition at the auxiliary q.
- The withdrawn preprints of Wan (1411.6352, 1412.1767, 1607.07729) are replaced by the published or current sources owned by the suppliers; this interface cites only those.

### Examples

An equality over Λ_K^{−,ur}[1/p] remains rational, even if its two sides descend as modules: ideal descent and integral descent each require their stated supplier comparison. For 11a1 at p=5, rational 5-torsion rules out the irreducible branch and the CGS local exclusion, while the Keller–Yin endpoint has a different stated range. For 14a1 at p=5, the a_p=0 signed kernel comparison is available. A good-ordinary anticyclotomic comparison cannot be substituted at a multiplicative prime.

### Dependencies

Use Layers 0, 3 and 4 for formulation comparisons. HeegnerPointEulerSystems HE.8b and RankZeroOneBSD BSD.7a/BSD.6a supply the branch proofs with their own hypotheses and normalization comparisons. The Eisenstein local and lattice comparisons use those supplier contracts rather than the irreducibility-dependent localization theorem of §5.1.

## Downstream consumers

HeegnerPointEulerSystems HE.0 consumes the source-precise ordinary theorem. RankZeroOneBSD BSD.0/BSD.6 consumes ordinary and multiplicative main conjectures, the signed kernel dictionary and the rank-zero leading-term consequences. The general Greenberg and Coates–Perrin-Riou interfaces consume only the modular instances specified in §5.9. The branch comparisons in Layer 6 keep their proof ownership separate, so these downstream uses do not assert a general main conjecture outside the listed hypotheses.

## References

- Olivier Fouquet and Xin Wan, [The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), arXiv:2107.13726v3 (8 April 2022), 103 pp.
- Christopher Skinner and Eric Urban, [The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Invent. Math. 195 (2014), 1–277; authors' copy (226 pp.) on E. Urban's Columbia page; page numbers below are those of this copy.
- Christopher Skinner, [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), Pacific J. Math. 283 (2016), 171–200; arXiv:1407.1093v1 (4 July 2014), 26 pp.; page numbers are those of the arXiv PDF.
- Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294), Ann. of Math. 191 (2020), 329–354; arXiv:1405.7294v1 (28 May 2014).
- Ashay Burungale, Francesc Castella and Christopher Skinner, [Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), arXiv:2405.00270v2 (March 2025), 12 pp.
- Antonio Lei, David Loeffler and Sarah Livia Zerbes, [Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Asian J. Math. 14 (2010), 475–528; arXiv:0912.1263v3 (18 October 2010), 45 pp.; theorem numbers are those of arXiv v3.
- Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), arXiv:2309.15692v2 (19 December 2024), 85 pp.; page numbers are those of arXiv v2.
- Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Astérisque 295 (2004), 117–290; Numdam AST_2004__295__117_0; printed page numbers.
- Karl Rubin, [Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Annals of Mathematics Studies 147, Princeton 2000; author's draft hosted on the SWC notes page (187 pp.); printed page numbers.
- Pierre Colmez, [La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Séminaire Bourbaki exposé 919 (2002–2003), Astérisque 294 (2004), 251–319; Numdam SB_2002-2003__45__251_0.
- Francesc Castella, Giada Grossi and Christopher Skinner, [Mazur’s main conjecture at Eisenstein primes](https://arxiv.org/abs/2303.04373v2), arXiv:2303.04373v2, Theorems A/C.
- Timo Keller and Mulun Yin, [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/abs/2402.12781v2), arXiv:2402.12781v2, Theorem 3.0.10.
- Haruzo Hida, [The Iwasawa μ-invariant of p-adic Hecke L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf), Ann. of Math. 172 (2010), 41–137, Theorem I, p.45; [2022 addendum](https://www.math.ucla.edu/~hida/Addendam.pdf), Lemma 0.2, p.1, replacing Lemma 3.17 in the indicated range.
- Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan, [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2), arXiv:2409.01350v2, Theorem 1.3.
- Francesc Castella, [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), corrected Theorem 1.1, p.1.
- Peter Schneider, [p-adic height pairings. II](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF), Invent. Math. 79 (1985), 329–374; author-hosted journal scan; printed page numbers.
- Aaron Landesman, Ashvin A. Swaminathan, James Tao and Yujie Xu, [Lifting subgroups of symplectic groups over Z/ℓZ](https://arxiv.org/abs/1607.04698v2), arXiv:1607.04698v2.
- The LMFDB Collaboration, [Elliptic curve 11.a2 (Cremona 11a1)](https://www.lmfdb.org/EllipticCurve/Q/11/a/2), Curve record accessed 2026-10-19; database evidence, not a formal certificate.
- The LMFDB Collaboration, [Elliptic curve 14.a6 (Cremona 14a1)](https://www.lmfdb.org/EllipticCurve/Q/14a1/), Curve record accessed 2026-10-19; database evidence, not a formal certificate.
