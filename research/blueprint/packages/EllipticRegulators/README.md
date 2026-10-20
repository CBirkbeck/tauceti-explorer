# Roadmap: elliptic regulators, explicit K₂ classes and L-values

**Summary.** Build the complex regulator of `K₂` of an elliptic curve in explicit form and prove the theorems that tie it to `L(E, 2)`. The regulator of a symbol `{f, g}` is Brunault's integral `∫ log|f|·ω ∧ ∂̄ log|g|`; Bloch's divisor formula evaluates it as half the conjugate of Bloch's function `R_q = J + iD_q`, the elliptic dilogarithm and its regularised companion, on the diamond convolution of the divisors of `f` and `g`. From this the roadmap proves Bloch's finite Fourier identity for the classes built from torsion points; Bloch's theorem for elliptic curves over `ℚ` with complex multiplication by a maximal order, with the explicit formula `L(E, 2) = (π·χ̂(ḡ)·g/(i·y²·C⁴))·R_q(U)` under the compatible real structure of Layer 5 and the additional twist-transport target of §5.1 for the general curve; Brunault's explicit Beilinson theorem on `X₁(N)`, `L(f, 2)L(f, χ, 1) = (Nπi/φ(N))·τ(χ)·r_N({u_{ψχ}, u_χ̄}, f)`; and Beilinson's theorem for every elliptic curve over `ℚ` in Schappacher–Scholl's form, that the regulator image of the integral modular-unit classes is the line `L′(E, 0)·H¹_B(E/ℝ, ℚ(1))`. Beilinson's conjecture for `K₂` of an elliptic curve over a number field is stated as a precise proposition about the integral part, and the roadmap separates it from the weaker statements its constructions prove. Every normalisation — orientation, `2π`, the factor `2` between Brunault's and Beilinson's regulators, Fourier kernels, root numbers — is fixed and pinned by computed examples, and the corrections to the printed sources (Brunault's Théorèmes 1 and 2, Merel's Théorème D, Zagier's weight-two constant) are part of the statements. A final layer formulates the weight-two `p`-adic Beilinson relation for elliptic curves with good reduction, as a conjecture, with its Frobenius and period normalisations.

## Scope and ownership

This roadmap owns: the elliptic specialisation of periods for regulators (oriented period data on Mathlib's `PeriodPair`, change of basis, conjugate and real periods, primitive real regulator cycles); the elliptic Deligne target with its archimedean orbit coordinates and dimension `[F : ℚ]`; Brunault's symbol regulator on an elliptic curve and on `X₁(N)`, with the constants relating it to Beilinson's regulator and to the real coordinate; the elliptic dilogarithm, Bloch's companion and its Bernoulli regularisation, the weight-two Kronecker–Eisenstein kernel and the Kronecker expansion of `R_q`, the Green function and Goncharov's function of an elliptic curve, and the Steinberg relations for `D_q` and Bloch's companion `J_q`, with a direct truncation proof beside the Stokes proof; the diamond convolution, the divisor formula, the lift formula, the finite Fourier transform of the `C`-torsion and Bloch's finite Fourier identity (his Theorem 10.2.1) with a direct proof by explicit orbit sums, and the trace formula for transfers; Bloch's CM theorem with its CM Fourier analysis on `O/CO`, Gauss coefficients and class `U`; the regulator on the integral part, Beilinson's conjecture for `K₂` of an elliptic curve as a proposition, the determinant-witness formalism and potentially good integrality; level-`N` real-analytic Eisenstein series with Kronecker's limit formulas, the Manin–Drinfeld theorem for `X₁(N)`, the modular units `u_f`, the Rankin–Selberg evaluation of regulators of modular units, Brunault's explicit theorems, Schappacher–Scholl's Beilinson theorem for modular curves and its consequence for modular elliptic curves; Shimura's period algebraicity for twisted central values, in the form used here; and the worked examples and the `p`-adic normalisations of the final layer.

The supplier contracts below leave lattice uniformisation, modular curves, cusps, correspondences and regular modular models to ModularCurvesPartII; de Rham–Betti comparison and cycle integration to ComplexComparisonPartII; universal Deligne cohomology and Chern regulators to MotivicEtaleKTheory, and number-field ranks and the independent Borel normalisation to BorelRegulators; classical single-valued polylogarithms and analytic tails to PolylogarithmFunctions, and curve currents and Chow dilogarithms to Polylogarithms; Matsumoto symbols and norms to K2SymbolsBrauer; elliptic schemes, localisation, arithmetic models, certified classes and rational descent to EllipticKTheory; Arakelov Green functions to GrossZagierAndArithmeticHeights; finite Fourier analysis to AdditiveCombinatorics; CM reciprocity and elliptic Hecke characters to ComplexMultiplicationAndExplicitReciprocity; local factors and Rankin–Selberg theory to AutomorphicLFunctionsAndLocalFactors; Siegel units and the pair symbol to KatoEulerSystems; modularity to EllipticCurveModularity; weight-two representations to GL2AutomorphicRepresentationsAndTransfer; modular symbols, period lines and refined `p`-adic `L`-functions to ModularSymbolsPadicLFunctions; the minimal differential lattice to NeronModelsAndSemistableAbelianVarieties; scheme `K`-theory operations to SchemeKTheoryOperations; finite-field bounds to WeilConjectures; and syntomic and Coleman constructions to PadicHodgeRegulators and ColemanIntegration. Each input is identified by its current mathematical section in the contracts.

From the Tau Ceti roadmaps it uses: ModularForms, Layer 7 (the `L`-function of a newform, its Euler product, continuation and functional equation) and Layer 8 (modular symbols and the period map); EllipticCurves, Layer 4 (reduction types and the `j`-invariant criterion for potentially good reduction; that roadmap deliberately leaves complex uniformisation out, which is why it is taken from ModularCurvesPartII); GlobalNumberFields, Layers 9–10 (ray-class quotients and infinity types of Hecke characters); AlgebraicTopology, Stages 5–6 (homology of the torus and the intersection sign). The current Tau Ceti library has holomorphic Eisenstein series of level one and with character; the real-analytic series `E_x(z, s)` of Layer 7 are a different object, built here. No current Tau Ceti roadmap or library file contains period orientation data, the elliptic dilogarithm, Kronecker–Eisenstein kernels, modular units, Brunault's regulator or the Beilinson statements of this roadmap.

**Sources for Bloch's results.** Bloch's Irvine lectures (*Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves*, CRM Monograph Series 11) are not freely available. They are credited for the constructions and theorems that are Bloch's — the function `R_q` and its companion, the classes `S_a`, the finite Fourier identity and the CM `L`-value theorem — and are cited by number only where a free source cites the same number: Theorem 10.2.1 and Lemma 10.2.2 (p. 77) and the definition (8.1.4) of `J_q` (p. 62), as Brunault's thesis cites them (pp. 23–24). The analytic identities credited to Bloch have proof routes from the free sources named with them (Brunault's thesis, Goncharov–Levin, Zagier; Dokchitser–de Jeu–Zagier for the history), and the finite Fourier scalar is pinned by computed examples. The general CM real-structure transport remains the explicit gap in §5.1; numerical agreement for selected curves does not supply it. Nothing is asserted about the text of the lectures.

## Conventions

- **Orientation and periods.** `H₁(E(ℂ), ℤ)` is oriented by the complex structure; an integral basis `(γ₁, γ₂)` is oriented when `γ₁·γ₂ = +1`, equivalently `Im(ω₂/ω₁) > 0` for `ω_i = ∫_{γ_i} ω`. `τ = ω₂/ω₁ ∈ ℍ`, `q = exp(2πiτ) = Function.Periodic.qParam 1 τ`, `y = Im τ`. A change of basis by `(a b; c d) ∈ SL₂(ℤ)` takes `(ω₁, ω₂)` to `(dω₁ + cω₂, bω₁ + aω₂)`, so `τ ↦ (aτ + b)/(cτ + d)` (Mathlib's action) and `η ↦ η/(cτ + d)`. For a real curve, `γ₁` generates the conjugation-fixed lattice with the orientation of `E(ℝ)`; shear `γ₂` by an integral multiple of `γ₁` as in §1.7 so that `2 Re τ ∈ {0, 1}`.
- **Embeddings.** Over a number field `F`, every embedding `σ : F → ℂ` is carried separately; conjugation is Mathlib's `NumberField.ComplexEmbedding.conjugate`. Dimensions of regulator targets are `r₁ + 2r₂ = [F : ℚ]`.
- **Tate twists and the regulator.** `ℝ(p) = (2πi)^p ℝ`. Brunault's regulator is `r_E({f, g})(ω) = ∫_{E(ℂ)} log|f| · ω ∧ ∂̄ log|g|`, with `∂̄`, not `d^c`. On `ℂ/(ℤ + ℤτ)` with `z = s + tτ`, `dz ∧ ∂̄ log|g| = −i·conj(g′/g) dx dy` and `dx dy = Im τ ds dt`. Brunault's form is `η_B = iη` with `η(f, g) = log|f| d arg g − log|g| d arg f`, and Beilinson's regulator in the wedge identification is `r_Beil = 2r_E`. For `E/ℚ` the real coordinate of the Deligne target is `φ ↦ φ(ω₀)/i` with `∫_{E⁰(ℝ)} ω₀ = 1`.
- **Dilogarithms.** `D(z) = Im Li₂(z) + arg(1 − z) log|z|` (PolylogarithmFunctions Layers 1, 4–5), `J(x) = log|x| log|1 − x|`, `D_q(x) = Σ_{n∈ℤ} D(xqⁿ)`, Bloch's `J_q(x) = Σ_{n≥0} J(xqⁿ) − Σ_{n≥1} J(x^{−1}qⁿ)`, `J(q; x) = J_q(x) + (1/3)(log|q|)² B₃(log|x|/log|q|)` with `B₃(t) = t³ − 3t²/2 + t/2`, and **`R_q = J(q; ·) + iD_q`**, so that `D_q − iJ(q; ·) = −iR_q` is the function whose Fourier expansion Zagier records (1990, p. 616). Brunault's `2R_ω(P, 0)` is `−conj(R_q)`. At the point `a + bτ` the Kronecker form is `R_q = −i(y²/π)Σ_v K_τ(a, b; v)`, `K_τ(a, b; m, n) = exp(2πi(mb − na))/((m + nτ)²(m + nτ̄))`.
- **Divisors.** The diamond convolution is `Σ m_i[P_i] ⋄ Σ n_j[Q_j] = Σ m_i n_j [Q_j − P_i]`, second point minus first; the opposite convention is the reflection.
- **Tame symbols.** `∂_P{f, g} = (−1)^{ord f·ord g}(f^{ord g}/g^{ord f})(P)` (K2SymbolsBrauer §§9.2–9.8).
- **Finite Fourier transforms.** On `(ℤ/C)²`, the torsion transform `torsionFourier`, `f̂(k, ℓ) = C^{−2} Σ f(a, b) e^{2πi(−ak + bℓ)/C}`. On `O/CO`, the dual-first transform `F̂(x) = C^{−1} Σ_y F(y)⟨x, y⟩` with `⟨a + bτ, k + ℓτ⟩ = e^{2πi(−aℓ + bk)/C}`. On `ℤ/N`, `f̂(b) = Σ f(v) e^{−2πibv/N}` (Mathlib's `ZMod.dft`), and `τ(χ) = Σ χ(a) e^{2πia/N} = gaussSum χ ZMod.stdAddChar`.
- **L-functions.** For `E` over a number field, `L(E, s)` is Mathlib's `WeierstrassCurve.LSeries` (all local factors, `1` at additive primes); at `s = 2` it is an absolutely convergent Euler product, so value-at-two statements need no continuation. Continued values (`L′(E, 0)`, `L(f, χ, 1)`) are values of the entire continuation, never of the totalised raw series. The root number `ε(E)` satisfies `Λ(E, s) = ε(E)Λ(E, 2 − s)`; Brunault's `w(E)` is `−ε(E)`. For `d = [F : ℚ]`, `Λ(s) = N^{s/2}(2π)^{−ds}Γ(s)^d L(E, s)` with `N = |d_F|²·N_{F/ℚ}(𝔣_E)`.
- **Coefficients.** `K₂(X) ⊗ ℚ` and `K₂(X)_{ℤ,ℚ}` are rational; a statement "up to `ℚ^×`" is an equality of rational lines. Statements over `ℂ` or `ℚ(χ)` coefficients say so.

## Exact supplier contracts

The library baseline for the representative signatures is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

**From Mathlib.** `PeriodPair` with `lattice`, `latticeBasis`, `latticeEquivProd` (an `ℝ`-independent pair, not oriented); `UpperHalfPlane` with the `SL(2, ℤ)` action and `ModularGroup.S`, `ModularGroup.T`; `Function.Periodic.qParam`, `norm_qParam`, `norm_qParam_lt_one`, `qParam_ne_zero`; `NumberField.ComplexEmbedding.conjugate`, `IsReal`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`; `Module.End.eigenspace`; `MeromorphicOn`, `meromorphicOrderAt`; `intervalIntegral`, `deriv`; `Polynomial.bernoulli`, `Polynomial.bernoulli_comp_one_add_X`, `bernoulliFourierCoeff_eq`, `hasSum_one_div_nat_pow_mul_sin`; `fourier`, `fourierCoeff`, `fourierBasis_repr`; `ZLattice.summable_norm_rpow`, `EisensteinSeries.summable_one_div_norm_rpow`; `MeasureTheory.integral_tsum_of_summable_integral_norm`; `Complex.hasSum_taylorSeries_neg_log`, `hasSum_coe_mul_geometric_of_norm_lt_one`, `iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow`, `Complex.cot_pi_eq_exp_ratio`, `cot_series_rep`; `AddMonoidAlgebra` with `mapDomain` and `single_mul_single`; `ZMod.stdAddChar`, `ZMod.dft`, `AddChar.complexBasis`, `gaussSum`; `DirichletCharacter.IsPrimitive`, `DirichletCharacter.LFunction`; `ModularForm.eta`, `CongruenceSubgroup.Gamma1`; `WeierstrassCurve.LSeries`, `WeierstrassCurve.LFunction`, `WeierstrassCurve.localPolynomial`, `WeierstrassCurve.Ψ`, `WeierstrassCurve.Affine.FunctionField`; `Module.Basis.baseChange`, `Module.rank_baseChange`, `Matrix.det`; `Submodule.span`, `Submodule.comap`, `Submodule.map`, `Submodule.mem_iSup_of_directed`; `LinearMap.BilinForm`; `FreeAbelianGroup`; `Complex.tendsto_self_mul_Gamma_nhds_zero`, `analyticOrderAt`. None of these supplies `K₂` of a curve, a Deligne cohomology group, the Bloch–Wigner function or a modular unit.

**From Tau Ceti.** `WeierstrassCurve.Affine.invariantDifferential`; `AddCircle.prodFundamentalGroupMulEquiv` (the fundamental group of a torus); `TauCeti.finrank_weilDifferentialFiltration_zero` (the regular differentials of a genus-one function field form a line); `TauCeti.rouche_windingNumber_comp` and `TauCeti.argumentPrinciple_windingNumber`; `TauCeti.MultiplicativeIdealWeight`, `TauCeti.norm_idealTerm`, `TauCeti.summable_absNorm_rpow_ideal_iff`, `TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm`, `TauCeti.LSeries_normCoeff`; `HeckeRing.GL2.Newform`; `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero`, `WeierstrassCurve.zsmul_fromAffine_eq_zero_iff`, `WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity`, `WeierstrassCurve.Affine.genericX`, `WeierstrassCurve.Affine.genericY`, `TauCeti.Divisor.principal`.

**From the Tau Ceti roadmaps.** ModularForms, Layer 7: for a newform `f` of weight `k`, `L(s, f)` with its Euler product (character zero-extended), the completed function, Hecke's functional equation and the entire continuation; Layer 8: Manin symbols and the period map. EllipticCurves, Layer 4: Kodaira–Néron reduction types, Tate's algorithm, and potentially good reduction from integrality of `j`. GlobalNumberFields, Layers 9–10: ray-class characters, finite quotients `O/𝔣` with lifting of units, and the infinity type of an algebraic Hecke character. AlgebraicTopology, Stages 5–6: singular homology of the torus and the intersection pairing with its sign.

**From other proposed roadmaps.** The following sections specify the mathematical inputs required by the layers. A section citation specifies ownership; it does not certify an ordering of whole roadmaps or split a supplier into an independently ordered prefix.

- **ModularCurvesPartII.** §§1.1–1.4 supply lattice uniformisation and differentials, the group law, homotheties and the converse Weierstrass construction. §§3.14–3.15 and 6.1–6.3 supply open/compact complex uniformisation, level maps and cusp fields; §§4.1–4.5 supply integral cusp strata and diamond operators; §8.4 supplies complex conjugation. §§7.2–7.4, 9.1–9.2 and 10.2 supply weight-two forms as differentials, trace, Hecke/diamond correspondences and their classical comparison. §11.4 supplies regular resolutions of modular fibres; §§13.1–13.4 supply Jacobian norms and adjoints; §17.2 supplies Eichler–Shimura. Resolution of a regular arithmetic graph is SchemeKTheoryOperations §§3.7, 5.7–5.8’s surface input, not a claim that an arbitrary correspondence extends as a finite map of minimal models.
- **ComplexComparisonPartII.** §C5.1 (The ordinary comparison) supplies de Rham–Betti comparison; §C5.3 (Geometric Hodge theory) supplies Hodge decomposition, polarisation and real conjugation; §C5.4 (Integration over analytic cycles and the Chern normalisation) supplies the actual cycle-integration map. The elliptic orientation computation is §1.1 here.
- **MotivicEtaleKTheory**, §12.2 (Deligne complexes and the regulator roof): the real Deligne complex `ℝ(p)_D`, its hypercohomology, the cone sequence, cup products, the Chern-character regulator with Schneider's signs (`ch_{2,2} = −c_{2,2}`, `c_{2,2}({f, g}) = −c_{1,1}(f) ∪ c_{1,1}(g)`), naturality under restriction and total conjugation, and proper covariance with supports.
- **BorelRegulators.** §3.12 supplies Borel's number-field ranks, in particular `K₂(F) ⊗ ℚ = 0` for a number field, used through EllipticKTheory §3.7. §8.2 supplies an independent cone model `Cone(ℝ(j) ⊕ FʲΩ → Ω)[−1]` and its universal number-field Chern regulator; §§8.3–8.5 compare that regulator with the stable general-linear-group Borel class: `r_Bo = 2r_Be`, and a determinant gains `2ʳ`. These maps are distinct from the curve-symbol comparison `r_D = 2r_Brunault` in §2.6 here. The number-field archimedean dimension in §4.1 is `r₁ + r₂` for odd `j` and `r₂` for even `j`; it does not give the elliptic target dimension `r₁ + 2r₂` of §2.3. No elliptic formula is deduced from the stable Borel factor alone.
- **PolylogarithmFunctions.** Layer 1 supplies classical `Li₂` including its closed-disc boundary; Layer 5, “The Bloch–Wigner dilogarithm”, “The Bloch–Wigner one-form” and “The analytic five-term relation”, supplies `D`, continuity, `dD(z) = η(z, 1 − z)`, inversion and conjugation; Layers 4–5 supply distribution. Layer 7, “Uniform disc truncation bounds” and “Closed-disc and Fourier tail bounds”, supplies certified analytic tails.
- **Polylogarithms.** §2.5 supplies certified rational-shape and circle estimates; §5.13 supplies the curve current `η(f, g)`, `dη = 2πΣ log|tame_x{f, g}|δ_x`, closedness for unit-modulus tame symbols and its Chern-regulator comparison. §§5.14–5.15 supply the Chow dilogarithm and reciprocity on `ℙ¹`, with real normalisation `−(2π)⁻¹∫r₂`. PolylogarithmFunctions supplies the classical analytic functions.
- **K2SymbolsBrauer.** §§5.2, 7.1–7.3 and 8.3 supply the degree-two Milnor–classical–Quillen dictionary; §§9.2–9.8 supply the normalised tame symbol; §§10.24–10.27 supply general Milnor norms, their Artinian-length base change and norm–residue formula; §§11.6–11.7 identify these with Quillen transfers. §10.8 supplies the projection formula, which does not assert that every symbol has a pulled-back entry.
- **EllipticKTheory.** §§1.1–1.6 supply the elliptic scheme and its base changes. §§3.1–3.6 supply curve localisation, tame residues and finite pullback/transfer; §3.7 supplies rational injectivity into the function field over a number field (its kernel comes from torsion `K₂` of residue number fields, not a rank theorem for a curve). §§5.1–5.3 supply finite functoriality and projection formulas; §§5.5–5.11 supply the finite-field `K₁` input. §§6.1–6.8 supply regular proper arithmetic models and model independence of the rational integral image; §6.9 supplies good-prime integrality and §6.10 its vertical-residue criterion. §§7.1–7.3 supply symbol and integral certificates, §§7.4–7.5 reciprocity and torsion divisors, §§7.6–7.7 Bloch's correction and classes `S_a`, and §§7.8–7.9 constant-field transfer and rational Galois descent with inverse `N/[L : F]`. Layer 8 supplies the bad-fibre and non-rational-residue examples. Local-field integral images, finite-extension reflection and the weight-two bridge are additional targets of §6.7 here; they are not supplied by §§6.8–6.10.
- **GrossZagierAndArithmeticHeights**, §2.8 (Normalized Arakelov Green function): the Arakelov Green function of a compact Riemann surface with its characterisation.
- **AdditiveCombinatorics**, AC.0: the normalised Fourier transform on a finite abelian group, inversion and Parseval, with counting and unitary comparisons.
- **ComplexMultiplicationAndExplicitReciprocity.** §§1.1–1.2 supply the CM lattice, action on forms, isogenies and rational twists; §2.2 supplies ideal-torsion and Galois reciprocity. §4.1 supplies the general elliptic Hecke character, and §4.2 supplies Deuring's all-prime local-factor comparison. The character in Layer 5 is extracted from this general character; it is not restricted to the canonical Gross-character families of §4.3. These inputs do not make conjugation on every CM lattice equal to `z ↦ z̄`; `CMRealStructure` and its transport are targets of §5.1 here.
- **AutomorphicLFunctionsAndLocalFactors.** AL.1: unramified and ramified local-factor conventions. AL.3: the symmetric-square `L`-function and its residue relation.
- **KatoEulerSystems.** §§0.1–0.5 supply theta/Siegel units, torsion evaluations, Galois action, integral cusp products and degeneracy compatibilities; §1.1 supplies the bilinear pair symbol into weight-two `K₂` of `Y(M, N)`. Its regulator comparison in §3.3 is not an input here.
- **EllipticCurveModularity.** R29.5: a nonconstant modular parametrisation `X₀(N) → E` over `ℚ`. R29.6: the newform with `L(f, s) = L(E, s)` including bad factors, continuation, the functional equation with root number, and Hasse's bound.
- **GL2AutomorphicRepresentationsAndTransfer.** R16.2, R16.4, R16.5: local Kirillov models and test vectors, the finite-level automorphic decomposition with multiplicities, and the global theory of weight-two cuspidal representations.
- **ModularSymbolsPadicLFunctions.** §§0.7–0.8, 1.1–1.2 supply period symbols, Drinfeld–Manin splitting, period lines and the twisted Mellin formula. Layers 2–4 supply the `p`-adic `L`-function of a refined newform, interpolation, critical slope and Euler-factor comparisons.
- **NeronModelsAndSemistableAbelianVarieties**, §§1.11, 6.9: the invariant-differential lattice and its minimal generator. The oriented real period of that generator is defined by §1.7 here.
- **SchemeKTheoryOperations.** §§2.1–2.6 supply pullback, proper pushforward, `G`-theory, Cartan comparison and base change. §§3.3, 3.6–3.7 supply localization and oriented curve/surface residues. §§6.8–6.11 supply rational Adams operations, weight decompositions and transfer/residue weight shifts; §§5.7–5.8 supply regular blowups.
- **WeilConjectures**, WC.5: the Weil bound for curves over finite fields.
- **PadicHodgeRegulators.** D.2: the étale regulator and the Bloch–Kato logarithm. D.5: the syntomic regulator of a curve with good reduction, its cup/trace pairing and its comparison with Coleman integrals.
- **ColemanIntegration**, L1: Coleman integrals on curves with good reduction, pull-back, Galois equivariance and finite-extension descent.

The universal Deligne construction is consumed from MotivicEtaleKTheory §12.2; its §12.7 determinant applications are downstream and are not inputs. This distinction does not by itself establish an order of the two whole roadmaps.

## How to read the build

Layer 1 fixes the period coordinates: oriented periods, `τ`, `q`, change of basis, conjugation and the primitive real cycles. Layer 2 computes the Deligne target, defines the regulator of a symbol and fixes every constant between it, Beilinson's regulator and the real coordinate. Layer 3 builds `R_q = J + iD_q`, proves its Kronecker–Eisenstein expansion directly, constructs the Green function and Goncharov's function, and proves the Steinberg relation, by Stokes and directly by truncating theta products. Layer 4 proves the divisor formula and evaluates Bloch's torsion classes, ending with Bloch's finite Fourier identity. Layer 5 specialises to CM curves over `ℚ` and proves Bloch's `L`-value theorem with its exact scalar. Layer 6 states Beilinson's conjecture precisely and separates what is proved from what is conjectured. Layer 7 carries the theory to modular curves: Brunault's explicit theorems and Schappacher–Scholl's Beilinson theorem, hence the theorem for every elliptic curve over `ℚ`. Layer 8 tests the normalisations on explicit certified classes and formulates the `p`-adic relation. `Suggested.lean` states, on Mathlib and Tau Ceti carriers, the divisor formula, the Gaussian case of Bloch's CM theorem, the Steinberg relation, the torsion Fourier identity and the light definitions of the layers (oriented periods, the Kronecker kernel and `R_q`, the torus regulator, the diamond convolution, the torsion transform, the regulator determinant and witness, the modular subspaces, the normalised unit reduction, the Frobenius scalar and the `p`-adic relation); the README specifies everything else.

## Layer 1: The analytic elliptic curve and its periods

This layer fixes, once and for all, the period coordinates in which every regulator of this roadmap is computed. The uniformisation of a complex elliptic curve by a lattice quotient, the de Rham–Betti comparison and singular homology belong to the supplier roadmaps named in the contracts; what is built here is the elliptic specialisation: an oriented choice of periods packaged on Mathlib's `PeriodPair`, its normalised uniformisation, the parameter `q`, the action of a change of basis, the conjugation at a conjugate or real embedding, and the primitive real cycles on which a real regulator is evaluated. Every convention fixed here is pinned by a computed value.

### 1.1 Oriented period data

Let `E` be an elliptic curve over `ℂ` with origin and a nonzero invariant differential `ω`, and let `(γ₁, γ₂)` be an integral basis of `H₁(E(ℂ), ℤ)` that is positively oriented for the complex structure, so that the intersection number `γ₁·γ₂` is `+1`. The periods are `ω₁ = ∫_{γ₁} ω` and `ω₂ = ∫_{γ₂} ω`, read from the integration map of ComplexComparisonPartII §C5.4 on actual singular cycles; they are never assigned by hand. Positive orientation is equivalent to `Im(ω₂/ω₁) > 0` (Brunault, thesis, Remarque 20 and its footnote, p. 22).

Define `RegulatorPeriods` as a structure extending Mathlib's `PeriodPair` (whose only condition is `ℝ`-linear independence of `ω₁, ω₂`) by the single extra field `0 < Im(ω₂/ω₁)`. It stores no curve, no homology and no comparison matrix: it is the coordinate interface that the geometric periods are fed into, at one embedding at a time. Define

```text
tau D       = ω₂/ω₁ ∈ ℍ                     (an element of Mathlib's UpperHalfPlane)
q D         = Function.Periodic.qParam 1 (tau D) = exp(2πi·tau D)
normalise D z = z/ω₁
```

and the two constructors `RegulatorPeriods.square` (periods `1, i`) and `RegulatorPeriods.scale D c` for `c ≠ 0` (both periods multiplied by `c`; orientation is preserved because the ratio is unchanged). Provide `RegulatorPeriods.ext` (two data with equal periods are equal), `tau_eq` (`↑(tau D) = ω₂/ω₁`, simp), `q_eq` (`q D = qParam 1 (tau D)`), `normalise_eq` (simp), `square_periods`, `scale_periods`, `scale_tau` (`tau (scale D c) = tau D`), `scale_normalise` (`normalise (scale D c) (c·z) = normalise D z`), `scale_one` and `scale_mul` (`scale (scale D c) d = scale D (d·c)`). The lattice of `D` is Mathlib's `PeriodPair.lattice`, with `PeriodPair.latticeBasis` and `PeriodPair.latticeEquivProd`; no second lattice carrier is introduced (Brunault, thesis, Remarque 20, (1.40), p. 22).

**Checks.**

- `tau (square) = i` and `q (square) = e^{−2π} = 0.0018674427317…`, an exact real number in `ℂ`.
- `scale D 1 = D` (degenerate case).
- `q D = Function.Periodic.qParam 1 (tau D)` (agreement with Mathlib's `q`-parameter).
- There is no `RegulatorPeriods` with periods `(1, −i)`, although `(1, −i)` is a Mathlib `PeriodPair`: the orientation field is what fails (non-example).

### 1.2 The normalised uniformisation and the multiplicative presentation

For `E` over `ℂ`, `ω` and an oriented basis as in §1.1, put `τ = ∫_{γ₂}ω / ∫_{γ₁}ω` and `η(P) = (∫_{γ₁}ω)⁻¹ ∫₀^P ω mod ℤ + ℤτ`. Define `normalisedTau` and `normalisedUniformisation` (`η : E(ℂ) ≅ ℂ/(ℤ + ℤτ)`, an isomorphism of complex Lie groups). Prove `normalisedUniformisation_pullback_dz` (`η^*dz = ω/∫_{γ₁}ω`, and `η` is `(∫_{γ₁}ω)⁻¹` times the uniformisation `u_ω : E(ℂ) ≅ ℂ/Λ_ω` of ModularCurvesPartII §§1.1–1.4), `normalisedUniformisation_indep` (`τ` and `η` do not depend on `ω`, because rescaling `ω` rescales every integral), `normalisedUniformisation_changeOfBasis` (for `(a b; c d) ∈ SL₂(ℤ)` and the basis `(dγ₁ + cγ₂, bγ₁ + aγ₂)`, `τ' = (aτ + b)/(cτ + d)` and `η' = η/(cτ + d)`), and `normalisedUniformisation_conj` (if `E` and `ω` are defined over `ℝ` and `γ₁` generates the conjugation-fixed part `H₁⁺(E(ℂ), ℤ)` with the orientation of `E(ℝ)`, then complex conjugation of `E(ℂ)` corresponds to `z ↦ z̄`; after the integral shear of `γ₂` specified in §1.7, `2 Re τ ∈ {0, 1}`) (Brunault, thesis, §1.2, (1.36)–(1.37), p. 21; Remarque 20, (1.40), p. 22; proof of Proposition 26, p. 27). The uniformisation itself, its compatibility with the group law, the converse Weierstrass construction from a lattice and homothety invariance are imported and not proved again.

For `τ ∈ ℍ` define `qParameter τ = qParam 1 τ` and `multiplicativePresentation : ℂ/(ℤ + ℤτ) ≅ ℂˣ/q^ℤ`, induced by `z ↦ exp(2πiz)`; composed with `η` it gives `E(ℂ) ≅ ℂˣ/q^ℤ` (Brunault, thesis, (1.37), p. 21). Prove `qParameter_norm_lt_one` (`|q| = exp(−2π Im τ) < 1`, from Mathlib's `Function.Periodic.norm_qParam`), `qParameter_ne_zero`, `qParameter_add_one` (simp: `q(τ + 1) = q(τ)`), `qParameter_real_iff` (`q` is real if and only if `2 Re τ ∈ ℤ`), `multiplicativePresentation_conj` (for a real curve normalised by (1.40): conjugation becomes `x ↦ 1/x̄`, and `E(ℝ)` is the circle `|x| = 1`, together with `|x| = |q|^{1/2}` when `q > 0`) and `multiplicativePresentation_orientation` (reversing the orientation of `E(ℝ)` replaces `x` by `1/x` and fixes `q`). A general `SL₂(ℤ)` change of basis acts through `z ↦ z/(cτ + d)`, not by a formula in `q` alone. For a real curve with (1.40), `q` is real, `−1 < q < 1`, `q ≠ 0`, it depends only on `E`, and `q > 0` exactly when `E(ℝ)` has two components (Brunault, thesis, Remarque 20, after (1.40), p. 22).

For use in the divisor formula define `torusCoord τ w = (Re w − (Im w/Im τ)Re τ, Im w/Im τ)`, for `Im τ > 0`. Its API is `torusCoord_reconstruct` (`w = a + bτ`), `torusCoord_add`, `torusCoord_one = (1, 0)` and `torusCoord_tau = (0, 1)`, all under this nondegeneracy hypothesis. This is real linear algebra in the oriented basis, not a choice of representatives of the quotient.

**Checks.**

- `torusCoord i (1 + 2i) = (1, 2)`; subtracting the real part of `τ` in the wrong coordinate fails after replacing `τ` by `1/2 + i` and `w` by `τ`.
- `torusCoord τ 0 = (0, 0)` (degenerate input, valid for every admissible `τ`).
- For real `τ = 1`, the totalized formula sends `i` to `(0, 0)` and cannot reconstruct `i`; this is outside the coordinate theorem's domain.
- For `y² = x³ − x` over `ℝ` with `γ₁` the oriented generator of `H₁⁺`, `τ = i` (the lattice of `dx/2y` is `Ω(ℤ + iℤ)` with `Ω = 2.62205755429211981…`) and `q = e^{−2π}`.
- For `y² = x³ + x + 1` (discriminant `−496 < 0`), `Re τ = 1/2`, `τ = 1/2 + 0.352464168465…i`, and `q ≈ −0.109197437222 < 0`; `E(ℝ)` is connected.
- Replacing `γ₂` by `γ₂ + γ₁` replaces `τ` by `τ + 1` and leaves `η` and `q` unchanged (degenerate case).
- For the oriented basis `(γ₂, −γ₁)`: `τ' = −1/τ` and `η' = η/τ`.
- On `y² = x³ − x` with the (1.40) normalisation, the point `(2, √6)` lies on `|x| = 1` and `(−1/2, √(3/8))` on `|x| = e^{−π} = q^{1/2}`.
- Non-example: for `y² = x³ − x` and the oriented basis `(γ₁ + 2γ₂, γ₂)`, `τ' = i/(2i + 1) = (2 + i)/5` has real part `2/5`, conjugation is not `z ↦ z̄` on `ℂ/(ℤ + ℤτ')`, and `q' = exp(2πiτ') ≈ −0.2302540 + 0.1672893i` is not real.

### 1.3 Periods, homology and the comparison

For `E` over a subfield `k ⊂ ℂ` with nonzero invariant differential `ω`, prove that the integration pairing `H₁(E(ℂ), ℤ) × Ω^{1,0}(E) → ℂ` induces the Abel–Jacobi isomorphism `H₁(E(ℂ), ℝ) ≅ Hom_ℂ(Ω^{1,0}(E), ℂ)` of real vector spaces and carries `H₁(E(ℂ), ℤ)` onto the period lattice `Λ_ω` of ModularCurvesPartII §§1.1–1.4's uniformisation, so that `H₁(E(ℂ), ℤ)` is free of rank two (Brunault, thesis, §1.2, (1.43)–(1.44), p. 22). The intersection pairing, written on `Λ_ω` as `⟨λ, μ⟩ = Im(λ̄μ)/covol(Λ_ω)`, is integral, alternating and unimodular, and `⟨γ₁, γ₂⟩ = 1` exactly on oriented bases; its sign is the complex orientation (Brunault, thesis, Remarque 20, footnote 2, p. 22). The period matrix is the matrix of the de Rham–Betti comparison `H¹_dR(E/k) ⊗_k ℂ ≅ H¹(E(ℂ), ℂ)` of ComplexComparisonPartII §C5.1 in a `k`-basis of `H¹_dR` and a basis of `H₁`; its nondegeneracy is the statement that the comparison is an isomorphism, not a property of a matrix attached to `E` by definition. For `E` over `ℝ`, complex conjugation acts on `H₁` and `H₁⁺(E(ℂ), ℤ)` is free of rank one.

Here `H₁` is singular homology. The comparison of singular `H₁` of the torus with the deck group of `ℂ → ℂ/Λ_ω` (Hurewicz, with Tau Ceti's `AddCircle.prodFundamentalGroupMulEquiv` after a real-linear change of coordinates) is a target of this subsection: it is what identifies integration on singular cycles with the lattice. Tau Ceti's `TauCeti.finrank_weilDifferentialFiltration_zero` (the regular differentials of a genus-one curve form a line) and its abstract weight-one Hodge structures are the pinned material; neither library has algebraic de Rham cohomology of a variety, which is supplied by ComplexComparisonPartII §C5.1.

*Needs:* ModularCurvesPartII §§1.1–1.4; ComplexComparisonPartII §§C5.1, C5.3–C5.4; AlgebraicTopology (Tau Ceti roadmap) stages 5–6 for torus homology and the intersection sign.

### 1.4 Change of oriented basis

For `D : RegulatorPeriods` and `M = (a b; c d)` in Mathlib's `SL(2, ℤ)`, define `RegulatorPeriods.rebase D M` with periods `(dω₁ + cω₂, bω₁ + aω₂)`: it is the integral change of basis `J M J` on the column `(ω₁, ω₂)`, `J` the coordinate swap, so it has the same integral lattice and the same orientation. Prove `rebase_periods` (simp), `rebase_one`, `rebase_mul` (`rebase (rebase D N) M = rebase D (M * N)`), `rebase_lattice` (the Mathlib `PeriodPair.lattice` is unchanged), `rebase_tau` (`tau (rebase D M) = M • tau D`, Mathlib's action of `SL(2, ℤ)` on `ℍ`, that is `(a·tau + b)/(c·tau + d)`) and `rebase_normalise` (`normalise (rebase D M) z = normalise D z/(c·tau + d)`). The first new period is `ω₁(c·tau + d)`, nonzero because `tau` is not real, and `Im(M • tau) = Im tau/|c·tau + d|² > 0`. Determinant `−1` reverses orientation and is excluded. The representative Lean file states the `τ`-law on the periods themselves, as `RegulatorPeriods.rebase_ratio`, because the orientation of the rebased datum is a theorem. These are the coordinate laws for the chosen-basis part of §1.2; no new uniformisation is built (Brunault, thesis, (1.36) and Remarque 20, (1.40), pp. 21–22).

**Checks.**

- Rebasing by the identity gives `D` (degenerate case).
- For Mathlib's `ModularGroup.S`, `tau` becomes `−1/tau` and `normalise z` becomes `normalise D z/tau` for every `z`; rebasing by `S` and then by `S⁻¹` returns `D`. This pins the matrix-entry convention.
- For `ModularGroup.T`, `tau` becomes `tau + 1`, `normalise` is unchanged and `q` is unchanged; for every `M` the lattice is the same `ℤ`-submodule of `ℂ`.
- Non-example: rebasing by `−I` fixes `tau` but sends `normalise D 1` to its negative, so `SL(2, ℤ)` does not act on coordinates through `PSL(2, ℤ)`.

### 1.5 Periods at a conjugate embedding

For `D : RegulatorPeriods` define `RegulatorPeriods.conjugate D` with periods `(conj ω₁, −conj ω₂)`. Conjugation reverses the complex orientation and the sign on the second vector restores it, since `Im(−conj tau) = Im tau`. Prove `conjugate_periods` (simp), `conjugate_involutive`, `conjugate_tau` (`tau (conjugate D) = −conj(tau D)`), `conjugate_q` (`q (conjugate D) = conj(q D)`, from the definition of `qParam` by the exponential), `conjugate_normalise` (`normalise (conjugate D) (conj z) = conj(normalise D z)`) and `conjugate_lattice` (`z` lies in the conjugate lattice if and only if `conj z` lies in the original one); the Lean file states the ratio law as `RegulatorPeriods.conjugate_ratio`. Geometrically, at a pair of distinct conjugate embeddings `σ, σ̄` one takes `γ̄₁ = c_*γ₁` and `γ̄₂ = −c_*γ₂`, with `c : E_σ(ℂ) → E_σ̄(ℂ)` the antiholomorphic base-change map; at a real embedding the conjugate datum is in general a different basis of the same curve (for the half-integral real shape, `tau (conjugate D) = tau D − 1`), and the two are not asserted to coincide (Brunault, thesis, Remarque 20 and (1.40), p. 22; Dokchitser–de Jeu–Zagier, arXiv:math/0405040v2, Remark 3.14, p. 7, for conjugation exchanging the non-real embedding components).

**Checks.**

- `conjugate (square) = square`.
- `conjugate (conjugate D) = D` (degenerate case).
- `conjugate (scale D c) = scale (conjugate D) (conj c)` (compatibility with scaling).
- Non-example: for `D₀ = rebase square T`, `tau D₀ = 1 + i` and `tau (conjugate D₀) = −1 + i`; a construction that only restores orientation without conjugating the real part fails, and `Im(tau (conjugate D)) > 0` always.

### 1.6 All complex embeddings and the conjugation action

Let `E` be an elliptic curve over a number field `F`. For every embedding `σ : F → ℂ` (embeddings, not places) form `E_σ = E ⊗_{F,σ} ℂ` with the data of §§1.1–1.5. Complex conjugation acts on embeddings by Mathlib's `NumberField.ComplexEmbedding.conjugate` and induces an antiholomorphic, orientation-reversing isomorphism `c : E_σ(ℂ) → E_σ̄(ℂ)` with `∫_{c_*γ} σ̄(ω) = conj(∫_γ σ(ω))` for `ω` defined over `F`; for bases exchanged as in §1.5, `τ_σ̄ = −conj(τ_σ)` and `q_σ̄ = conj(q_σ)`. A real embedding gives a curve over `ℝ` with the normalisation (1.40) and a real `q_σ ∈ (−1, 0) ∪ (0, 1)`. On `E(ℂ) = ⊔_σ E_σ(ℂ)` with the combined involution `F_∞` (conjugation on coefficients and on points together), `H₁(E(ℂ), ℝ)` has dimension `2[F : ℚ]` and each `F_∞`-eigenspace has dimension `r₁ + 2r₂ = [F : ℚ]` (Mathlib's `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`), not `r₁ + r₂`. Mathlib's `InfinitePlace` identifies `σ` with `σ̄` and carries no conjugation action, so embeddings are the indexing set. A statement at one embedding is not a statement at all of them (Brunault, thesis, Remarque 20, p. 22, for the real case; the number-field bookkeeping is part of this roadmap).

*Needs:* EllipticKTheory Layer 1 for the elliptic curve as a scheme and its base changes; Mathlib's `NumberField.ComplexEmbedding.conjugate`, `IsReal`, `InfinitePlace.mk_conjugate_eq`, `nrRealPlaces`, `nrComplexPlaces`.

**Checks.**

- For `F=ℚ`, there is one embedding, the total real homology has dimension two, and each conjugation eigenspace is a line.
- For `F=ℚ(i)`, there are two embeddings exchanged by conjugation; each eigenspace of the combined involution has dimension two. Replacing embeddings by the single complex place would lose a component.
- For `F=ℚ(√2)`, both embeddings are real and each contributes one positive and one negative line. The two eigenspaces each have dimension two, as required by `[F:ℚ]`.


### 1.7 Real periods and the sign of `q`

If `conj ω₁ = ω₁` and `conj ω₂ = −ω₂ + mω₁` with `m ∈ ℤ`, then `2 Re(tau D) = m`. In a real-adapted oriented basis (`γ₁` the primitive positive generator of the conjugation-fixed sublattice) the shear `γ₂ ↦ γ₂ + kγ₁` changes `m` by `2k`, so `m` can be taken to be `0` or `1`, giving `Re tau = 0` or `1/2`. In the first case `q = exp(−2π Im tau) > 0`, in the second `q = −exp(−2π Im tau) < 0`; in both, `q` is real and `0 < |q| < 1`. Prove these as `RegulatorPeriods.real_period_shape` and `RegulatorPeriods.real_q_sign` (in the Lean file `RegulatorPeriods.two_re_tau_of_real` and `RegulatorPeriods.q_neg_of_re_half`). Reversing the orientation of `E(ℝ)` negates both basis vectors, preserves `tau` and `q`, and inverts the multiplicative coordinate. The existence of the real-adapted basis is the real normalisation of §1.2, not a new Hodge-theoretic statement (Brunault, thesis, Remarque 20, (1.40)–(1.41), p. 22).

### 1.8 Primitive real regulator cycles

In the real-adapted basis with `m ∈ {0, 1}`, conjugation acts on lattice coordinates by `(u, v) ↦ (u + mv, −v)`. Prove `real_conjugation_coordinates`, `positive_cycle_coordinates` (the fixed integral sublattice is `ℤ·(1, 0)`), `negative_cycle_coordinates_zero` (for `m = 0` the anti-invariant integral sublattice is `ℤ·(0, 1)`, with normalised period `i·Im tau`), `negative_cycle_coordinates_one` (for `m = 1` it is `ℤ·(−1, 2)`, with normalised period `2i·Im tau`), the period statements `negative_cycle_period_zero`/`negative_cycle_period_one`, and `eigensublattice_index_two` (for `m = 1` the sum of the two integral eigensublattices is the subgroup of pairs with even second coordinate, of index exactly two, by the surjection `(u, v) ↦ v mod 2`; for `m = 0` it is everything). Over `ℝ` both eigenspaces are lines. The rational anti-eigenvector `(−1/2, 1)` for `m = 1` is not an integral generator, and the integral kernels are used rather than a direct-sum decomposition over `ℤ` (Brunault, thesis, Remarque 20, p. 22, and (1.48), p. 23; Dokchitser–de Jeu–Zagier, arXiv:math/0405040v2, §3, paragraph before (3.4), p. 5, where the regulator is evaluated on integral anti-invariant cycles).

### 1.9 Conjugation in multiplicative coordinates

For every `z ∈ ℂ`, `qParam 1 (conj z) = 1/conj(qParam 1 z)` and `qParam 1 (−z) = 1/qParam 1 z` (`exponential_conjugate`, `exponential_neg`). These are identities for the point coordinate, distinct from the modulus identity `q(−conj τ) = conj(q(τ))` of §1.5. In the multiplicative presentation, conjugation from `E_σ` to `E_σ̄` is `[x] ↦ [1/x̄]` between the quotients by `q^ℤ` and `conj(q)^ℤ`; it is well defined because `qⁿ` goes to `conj(q)^{−n}`. In the real-normalised case it is an involution of one quotient; a representative of modulus one is fixed, while for `q > 0` the circle `|x|² = q` is fixed only in the quotient (`1/x̄ = x/q`) (Brunault, thesis, (1.36)–(1.37), p. 21, and Remarque 20, p. 22).

**Checks** (for §§1.7–1.9).

- Periods `(1, i)`: `m = 0` and `q = e^{−2π}`; periods `(1, 1/2 + i)`: `m = 1` and `q = −e^{−2π}`, so a real curve need not have positive `q`.
- For `m = 1` the anti-invariant integral generator has normalised period `2i·Im tau`, not `i·Im tau`, and an anti-invariant functional evaluated on it is twice its value on `γ₂`.
- At `z = i/2`, conjugation in multiplicative coordinates sends `e^{−π}` to `e^{π}`, not to `e^{−π}`.
- Orientation reversal acts by `[x] ↦ [1/x]`.

### 1.10 The normalised differential used by the regulator

For the normalised uniformisation `η` and the period datum `D`, the normalised differential is `ω/ω₁ = η^*dz`, with integrals `1` and `tau D` on `γ₁` and `γ₂`; the same nonzero `q` with `|q| < 1` comes from `qParam`. For `E` over `ℝ`, `γ₁` is the positive primitive real cycle and `∫_{γ₁} ω/ω₁ = 1` (Brunault, thesis, Proposition 26, (1.64), p. 26, with (1.40), p. 22). Over a number field the statement is carried at every embedding, with conjugation acting simultaneously on coefficients, the curve and its homology; §1.5 supplies compatible bases at each conjugate pair, §1.8 the primitive negative cycles at each real embedding, and §1.6 the rank `[F : ℚ]` of each sign. Prove this as `RegulatorPeriods.regulator_period_normalisation`. No universal Chern or Deligne factor, and in particular no power of `2π`, is chosen in this layer; that is Layer 2's.

### Examples

- `y² = x³ − x`: `τ = i`, `q = e^{−2π}`, two real components, real points on `|x| = 1` and `|x| = e^{−π}`.
- `y² = x³ + x + 1`: `τ = 1/2 + 0.352464168465…i`, `q ≈ −0.1091974372`, one real component; the PARI periods are `3.749942978094…` and `1.874971489047… ± 1.321720533565…i`.
- `y² = x³ − x` over `ℚ(i)`: two embeddings forming one conjugate pair, each eigenspace of `H₁(E(ℂ), ℝ)` of dimension `2`.

### Dependencies

Mathlib: `PeriodPair`, `PeriodPair.lattice`, `PeriodPair.latticeBasis`, `PeriodPair.latticeEquivProd`, `UpperHalfPlane` with the `SL(2, ℤ)` action, `ModularGroup.S`, `ModularGroup.T`, `Function.Periodic.qParam`, `norm_qParam`, `norm_qParam_lt_one`, `qParam_ne_zero`, `NumberField.ComplexEmbedding.conjugate`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `Subgroup.index`. Tau Ceti: `WeierstrassCurve.Affine.invariantDifferential`, `AddCircle.prodFundamentalGroupMulEquiv`, `TauCeti.finrank_weilDifferentialFiltration_zero`. Roadmaps: ModularCurvesPartII §§1.1–1.4 (uniformisation), ComplexComparisonPartII §§C5.1, C5.3–C5.4 (comparison and integration), EllipticKTheory Layer 1 (the curve and its base changes), AlgebraicTopology stages 5–6.

## Layer 2: Deligne cohomology and the symbol regulator

The real Deligne complex, its hypercohomology, cup products and the universal Chern-character regulator are supplied by MotivicEtaleKTheory §12.2, and the curve current `η(f, g)` with its Steinberg identity and closed-current class is Polylogarithms §§5.13–5.15's. This layer specialises both to an elliptic curve: it computes the regulator target and its dimension, defines the regulator of a symbol by an explicit integral, and fixes every constant between that integral, Beilinson's regulator and the real coordinate in which L-values are compared. No constant is chosen by requiring an L-value formula to hold.

### 2.1 The regulator target and its dimension

Let `E` be an elliptic curve over a number field `F`, with `E(ℂ) = ⊔_σ E_σ(ℂ)` and the involution `F_∞` of §1.6. Write `ℝ(p) = (2πi)^p ℝ`. Specialising the Deligne comparison of MotivicEtaleKTheory §12.2 to each smooth projective `E_σ` gives, from the cone sequence of `ℝ(2)_D = [ℝ(2) → 𝒪 → Ω¹]` (degrees 0, 1, 2), the exact sequence

```text
0 → F²H¹_dR(E_σ) → H¹(E_σ(ℂ), ℝ(1)) → H²_D(E_σ, ℝ(2)) → 0,
```

and `F²H¹_dR = 0` because `Ω^{≥2} = 0` on a curve, so the last arrow is an isomorphism (Schneider, "Introduction to the Beilinson conjectures", §2, pp. 7–9; Brunault, thesis, §2.5, (2.97), p. 64). Total de Rham conjugation is coefficient conjugation composed with the geometric involution; on `ℝ(1)`-valued classes it is `−c^*`, so the real Deligne cohomology is the geometric minus part. Define `ellipticDeligneTarget` as `H¹(E(ℂ), ℝ(1))⁻`, the classes anti-invariant under `c^*`, together with its comparison isomorphism to MotivicEtaleKTheory §12.2’s `H²_D(E_ℝ, ℝ(2))` (Brunault, thesis, §2.5, Lemme 61, (2.94), p. 64). Prove `ellipticDeligneTarget_equivHom` (`[ν] ↦ (ω ↦ ∫_{E(ℂ)} ν ∧ ω)` is an isomorphism onto `Hom_ℝ(Ω^{1,0}_ℝ, ℝ(1))`, the functionals taking the real differentials, those fixed by `ω ↦ c^*ω̄`, into `ℝ(1)`; Brunault, thesis, Lemme 62, (2.100) and (2.104) with `d = 1`, pp. 65–66), `ellipticDeligneTarget_finrank` (`dim_ℝ = r₁ + 2r₂ = [F : ℚ]`), `ellipticDeligneTarget_toReal` (for `F = ℚ`: `φ ↦ φ(ω₀)/i`, where `ω₀ = η^*dz` is the holomorphic differential with `∫_{E⁰(ℝ)} ω₀ = 1`, Brunault, thesis, Proposition 26, p. 26) and `ellipticDeligneTarget_toReal_orientation` (reversing the orientation of `E(ℝ)` replaces `ω₀` by `−ω₀` and negates `toReal`). The identification with `ℝ` is not canonical; another normalisation of `ω₀` changes it by a nonzero real factor. Brunault states Lemmes 61–62 for an abelian variety over `ℚ`; for `F ≠ ℚ` they are applied to `E` viewed over `ℚ`, componentwise.

**Checks.**

- For `E/ℚ` (for instance `y² = x³ − x`) the target has dimension `1`.
- For `y² = x³ − x` over `ℚ(i)` the target has dimension `2 = r₁ + 2r₂`, not `r₁ + r₂ = 1`.
- `⊕_σ H¹(E_σ(ℂ), ℝ(1))` has dimension `2[F : ℚ]`, twice the target's: the target is the anti-invariant part, not the product (non-example).
- For `E`, `f`, `g` defined over `ℝ` and `ω ∈ Ω^{1,0}_ℝ`, `∫ η_B(f, g) ∧ ω ∈ ℝ(1) = iℝ` (Brunault, thesis, (2.116), p. 67).
- Reversing the orientation of `E(ℝ)` negates the identification with `ℝ`.

### 2.2 Archimedean orbit coordinates

Refine §2.1 by an explicit coordinate equivalence. Untwist `ν = 2πi·a` and use the period bases of Layer 1. At a real place `v` choose `γ₊·γ₂ = 1`, `c^*γ₊ = γ₊` and `c^*γ₂ = ε_v γ₊ − γ₂` with `ε_v ∈ {0, 1}`; on periods `(a, b)` the geometric involution is `C_ε(a, b) = (a, εa − b)` and its `−1`-eigenspace is `{(0, b)}`. At a complex place choose one embedding `σ` of the pair, identify the conjugate `H¹` with `H¹(E_σ, ℝ)` by geometric transport `c^*`, and write the pair as `(u, v)`; conjugation is the swap `S(u, v) = (v, u)` with `−1`-eigenspace `{(u, −u)}`. Define `Archimedean.orbitEquiv`, the real-linear equivalence from the untwisted period model of the target to `(I_real → ℝ) × (I_complex → ℝ²)`, sending a family to its `b`-coordinate at each real orbit and its `u`-coordinate at each complex orbit; `I_real` indexes the real places and `I_complex` one representative of each conjugate pair. The cohomological equivalence is its composite with the Layer 1 period comparisons; the choices are part of the interface and are not claimed canonical. Provide `orbitEquiv_real` (the real-place component is the untwisted `γ₂`-period), `orbitEquiv_complex`, `orbitEquiv_symm` (the inverse sends `(b, u)` to `((0, b(v)), (u(w), −u(w)))`), `orbitEquiv_ext`, `real_mem_iff` (for Mathlib's `Module.End.eigenspace` of `C_ε` at `−1`, `(a, b)` belongs if and only if `a = 0`) and `pair_mem_iff` (for the swap, `(u, v)` belongs if and only if `v = −u`). Changing the representative of a complex pair replaces `u` by `−c^*u` (Brunault, thesis, §2.5, Lemme 61, (2.94), p. 64, and Proposition 26, p. 26; the orbit formula is computed from these and the lattice action of Layer 1).

**Checks.**

- One real orbit with `ε = 0` and no complex orbits: `(0, 1)` has coordinate `1`, and `(1, 0)` is not in the minus eigenspace.
- One real orbit with `ε = 1`: the eigenline is still `{(0, b)}` and `(1, 0)` fails, despite the non-diagonal conjugation matrix.
- One complex orbit: `((1, 2), (−1, −2))` has coordinate `(1, 2)`, and `((1, 0), (−1, 0))`, `((0, 1), (0, −1))` are independent, so a complex place keeps two real coordinates.
- Both index sets empty: the orbit model is the zero space (degenerate case).
- Non-example: `((1, 2), (1, 2))` is swap-invariant but not in the minus eigenspace.

### 2.3 The archimedean dimension formula

Prove `dim_ℝ H²_D(E_ℝ, ℝ(2)) = |I_real| + 2|I_complex| = r₁ + 2r₂ = [F : ℚ]`, by invariance of `finrank` under `orbitEquiv` and Mathlib's `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`. Before imposing conjugation, `⊕_σ H²_D(E_σ, ℝ(2))` has dimension `2[F : ℚ]`; the regulator of a class defined over `F` is a family with `c_σ^* ν_σ̄ = −ν_σ` in the `ℝ(1)`-valued presentation (total-conjugation naturality of the regulator of MotivicEtaleKTheory §12.2), so the orbit model, not the unrestricted product, is its coordinate space (Brunault, thesis, §2.5, Lemmes 61–62, pp. 64–66, and §2.6, Proposition 66, p. 67). Nothing is asserted here about injectivity, surjectivity or Beilinson's conjecture.

**Checks.** For `E/ℚ` the rank is `1`; for `E/ℚ(i)` it is `2`, not `1`; for `E/ℚ(√2)` it is `2`, contributed by two real places.

### 2.4 The form `η` on an elliptic curve

The form `η(f, g) = log|f| d arg g − log|g| d arg f`, its bilinearity and antisymmetry, the identity `η(f, 1 − f) = d(D ∘ f)`, its closedness off the divisors, the current identity `dη(f, g) = 2π Σ_x log|tame_x{f, g}| δ_x` and its period statements are Polylogarithms §§5.13–5.15's (its weight-two regulator form and unramified class). For a complex elliptic curve `E` and `f, g ∈ ℂ(E)^×`, prove two facts linking it to Brunault's regulator: Brunault's form `η_B(f, g) = log|f|·(∂ − ∂̄) log|g| − log|g|·(∂ − ∂̄) log|f|` equals `i·η(f, g)`, because `(∂ − ∂̄) log|g| = i d arg g` for meromorphic `g`; and for every `ω ∈ Ω^{1,0}(E)`,

```text
∫_{E(ℂ)} η_B(f, g) ∧ ω = 2 ∫_{E(ℂ)} log|f| · ω ∧ ∂̄ log|g|,
```

by integration by parts on `E` minus small discs, the boundary terms being `O(r log² r)` (Brunault, thesis, §2.5, Définition 63, (2.107), p. 66; §2.6, proof of Théorème 68, pp. 69–70, with `J = E` and `α = ω`). The integrals converge absolutely because the singularities are logarithmic. On `E = ℂ/(ℤ + ℤτ)` with `τ = 0.2 + 1.1i`, `ω = dz` and the theta quotients of §2.5, quadrature gives `−0.331325 + 0.070010i` for the left side and `2 × (−0.1656624 + 0.0350051i)` for the right.

### 2.5 The regulator of a symbol

For a complex elliptic curve `E` define

```text
symbolRegulator : K₂(ℂ(E)) → Hom_ℂ(Ω^{1,0}(E), ℂ),
{f, g} ↦ (ω ↦ ∫_{E(ℂ)} log|f| · ω ∧ ∂̄ log|g|)
```

(Brunault, thesis, §1.1, Définition 16, (1.27), p. 19; the operator is `∂̄`, not `d^c`). The integral converges absolutely: `log|f|` is integrable and `∂̄ log|g| = ½ conj(g′/g) dz̄` has `1/r` singularities. The formula is bilinear, vanishes when one entry is constant, and vanishes on `{f, 1 − f}` by Brunault's Lemme 15, whose proof is the exact identity `log|f| · ω ∧ ∂̄ log|1 − f| = (i/2) d((D ∘ f + i log|f| log|1 − f|)ω)` (1.26) with Stokes, using the derivative of the Bloch–Wigner function from PolylogarithmFunctions Layers 1, 4–5; so it descends to `K₂(ℂ(E))` presented by Matsumoto's theorem (K2SymbolsBrauer §§5.2, 7.1–7.3, 8.3), and it is antisymmetric (Brunault, thesis, §1.1, Lemme 15, (1.25)–(1.26), p. 19). Provide `symbolRegulator_symbol` (simp), `symbolRegulator_steinberg`, `symbolRegulator_const` (simp), `symbolRegulator_antisymm`, `symbolRegulator_eq_half_eta` (`r_E{f, g}(ω) = ½∫ η_B(f, g) ∧ ω = (i/2)∫ η(f, g) ∧ ω`, by §2.4), `symbolRegulator_periods` and `symbolRegulator_real`.

The period formula: if `ξ = Σ{f_i, g_i}` has `|tame_x(ξ)| = 1` at every point (K2SymbolsBrauer §§9.2–9.8 for the tame symbol), then `η(ξ)` is closed (Polylogarithms §§5.13–5.15) and, for an oriented basis `(γ₁, γ₂)` of `H₁(E(ℂ), ℤ)` represented by cycles avoiding the supports,

```text
r_E(ξ)(ω) = (i/2)(∫_{γ₁} η(ξ) ∫_{γ₂} ω − ∫_{γ₂} η(ξ) ∫_{γ₁} ω),
```

by the Riemann bilinear relation with the intersection pairing of §1.3; the value does not depend on the cycles chosen. For `E` over a number field `F`, the regulator of `K₂(E) ⊗ ℚ` is the composite of the injection `K₂(E) ⊗ ℚ → K₂(F(E)) ⊗ ℚ` (EllipticKTheory §§3.1–3.7) with `r_{E_σ}` at every embedding `σ`. For `E`, `f`, `g` defined over `ℝ` and `ω` real, `r_E{f, g}(ω) ∈ iℝ` (Brunault, thesis, (2.116), p. 67).

On the torus `E_τ = ℂ/(ℤ + ℤτ)` with `ω = dz`, writing `z = s + tτ` and `dz ∧ dz̄ = −2i dx∧dy`, the definition becomes the explicit double integral

```text
torusRegulator τ f g = −i·Im τ · ∫₀¹∫₀¹ log|f(s + tτ)| · conj(g′(s + tτ)/g(s + tτ)) ds dt
```

for doubly periodic meromorphic `f`, `g` on `ℂ`. Precisely, `IsEllipticFunction τ f` requires `MeromorphicOn f univ`, periods `1` and `τ`, and finite `meromorphicOrderAt f z` at every `z`; the last clause excludes an identically zero meromorphic germ. Supply `isEllipticFunction_const` for nonzero constants, `isEllipticFunction_mul`, `isEllipticFunction_inv`, and the order/period consequences. For pairwise incongruent `P_i` modulo `ℤ + ℤτ`, define `HasTorusDivisor τ f P m` by `ord_z f = Σ_{i: z−P_i ∈ ℤ+ℤτ} m_i` at every `z`, as an equality in `WithTop ℤ`. Its API identifies the orders at each `P_i`, gives zero order outside the listed classes, and handles multiplication and inversion after collecting coincident classes. These predicates record actual orders, not just support containment. This is the form in which the representative Lean file states the regulator (`torusRegulator`, for functions satisfying `IsEllipticFunction`), its Steinberg relation (`torusRegulator_one_sub`), its antisymmetry (`torusRegulator_swap`), the vanishing for constant entries (`torusRegulator_const_left`) and the divisor formula of Layer 4.

**Checks.**

- The constant function `1` satisfies `IsEllipticFunction τ` and has the empty torus divisor; its orders are all `0`.
- The constant function `0` fails both the finite-order clause and an empty-divisor claim: its order is `⊤`. The function `exp z` also fails the predicate because `1` is not a period.
- Two equal points listed with distinct indices fail `HasTorusDivisor` even if their coefficients cancel; after collecting them the empty divisor of `1` is valid. A nonzero multiplicity assigned to a single point for `1` fails the order equation.

- `r_E{c, g} = 0 = r_E{f, c}` for every `c ∈ ℂ^×` (degenerate case).
- `r_E{f, 1 − f} = 0` for every `f ∈ ℂ(E) − {0, 1}`.
- On `E = ℂ/(ℤ + ℤτ)`, `τ = 0.2 + 1.1i`, `ω = dz`: for `f = θ₁(z − a₁)θ₁(z − a₂)/(θ₁(z − b₁)θ₁(z − b₂))` with `a₁ = 0.13 + 0.21τ`, `a₂ = 0.47 + 0.66τ`, `b₁ = 0.31 + 0.05τ`, `b₂ = 0.29 + 0.82τ`, and `g` the analogous quotient with zeros `0.72 + 0.35τ`, `0.05 + 0.48τ` and poles `0.58 + 0.90τ`, `0.19 − 0.07τ`, `r_E{f, g}(dz) = −0.1656624 + 0.0350051i` (midpoint quadrature on a 400 × 400 grid).
- Non-example: replacing `∂̄ log|g|` by `d^c log|g| = (∂ − ∂̄) log|g|/(4πi)` multiplies every value by `i/(4π)` (only the `∂̄`-part survives against `ω`), so the previous value fails.
- For `E`, `f`, `g` real and `ω` real, the value lies in `iℝ`.

### 2.6 The normalisation factor

The "up to a factor" of Brunault's first remark (thesis, §1.1, Remarques, item 1, pp. 19–20) is resolved in the same source. In the identification `H²_D(E_ℝ, ℝ(2)) ≅ H¹(E(ℂ), ℝ(1))⁻ ≅ Hom_ℝ(Ω^{1,0}_ℝ, ℝ(1))` of §2.1, Beilinson's regulator is `r_Beil(γ) = (ω ↦ ∫_{E(ℂ)} η_B(γ) ∧ ω)` on `K₂^{(2)}(E) ⊂ K₂(ℚ(E)) ⊗ ℚ` (Brunault, thesis, §2.5, Proposition 67, (2.118), p. 67, from the cup-product formula for Deligne cohomology and compatibility with restriction to open subsets and with products), and by §2.4

```text
r_Beil = 2 · r_E
```

(the computation in the proof of Théorème 68, pp. 69–70). The factor between the source's functional and Beilinson's regulator is therefore `2`, not an unknown power of `2π`. The proof: write `r_Beil(γ) = [ν]` and `η^*γ = (1/N)Σ{F_i, G_i}`; on `U = E − S` the class `ν` is `(1/N)Σ η_B(F_i, G_i) + dφ` with `φ` of logarithmic growth (Brunault, thesis, (2.121)–(2.123), p. 68), and Stokes gives `∫ ν ∧ α = r̂(η^*γ)(α)`. The comparison of the Schneider/Nekovář normalisation of `H_D` used by Brunault with the universal Chern and Deligne regulator is MotivicEtaleKTheory §12.2’s, with Polylogarithms §§5.13–5.15 for the weight-two curve case (sign `(−1)^m = +1` for `m = 2`).

### 2.7 Chern character, symbol cup product and the constants

Specialise the imported higher Chern and curve-regulator comparisons to `E/F`. In Schneider's convention `ch_{2,2} = −c_{2,2}` and `c_{2,2}({f, g}) = −c_{1,1}(f) ∪ c_{1,1}(g)`, so the rational Deligne regulator of a symbol is the positive cup product (Schneider, §4, p. 28). On `U = E_σ` minus the divisors its representative is `log|f| π₁(d log g) − log|g| π₁(d log f)` with `π₁(α) = (α − ᾱ)/2`, hence `iη(f, g) = η_B(f, g)`, with no extra `2π` (Nekovář, "Beilinson's conjectures", author copy, §7.3, (7.3.2), and §7.4, (7.4.1), p. 23). If `γ ∈ K₂(E)_ℚ` and its function-field image is `ξ = Σ q_j{f_j, g_j}` with rational `q_j`, then at each embedding the wedge identification sends `r_D(γ)` to `ω ↦ Σ q_j ∫ η_B(f_j, g_j) ∧ ω = 2 r_E(ξ)(ω)` (Brunault, thesis, Proposition 67, pp. 67–69, and proof of Théorème 68, pp. 69–70). Polylogarithms §§5.13–5.15 supplies Steinberg descent and the closed-current comparison; EllipticKTheory §§3.1–3.7 supplies restriction and lift independence. A symbol combination whose tame symbols merely have modulus one still has an `η`-period class, but it is not asserted to lift to `K₂(E)`: real-current descent is weaker than rational `K₂` descent.

**Checks.**

- The three constants are checked separately: positive unit cup product; `η_B = iη`; `r_D = 2r_E` in the untwisted wedge pairing.
- For a local symbol `{z, c}`, `c ≠ 0`, `∮η = −2π log|c|` and the tame symbol is `c^{−1}`; it defines no compact-curve class if `|c| ≠ 1`.
- For `|c| = 1` and `c` not a root of unity the real residue vanishes while the rational tame class need not.
- A torsion change of lift leaves both `r_D` and the real scalar unchanged.
- Nekovář's author-copy pairing carries an extra factor `1/(2πi)`; it changes the evaluated scalar, not the Deligne class or the factor `2` in the wedge convention.

### 2.8 The torsion ambiguity has zero regulator

Let `E` be an elliptic curve over a number field `F` and `ξ ∈ K₂(F(E))` with trivial tame symbol at every closed point. Two classes of `K₂(E)` restricting to `ξ` differ by an element of the image of `⊕_x K₂(k(x))`, which is torsion (EllipticKTheory §§3.1–3.7). The regulator is additive with values in a real vector space, so it vanishes on torsion: if `nt = 0` then `n·r(t) = 0`, so `r(t) = 0`. Hence the value on a lift of `ξ` does not depend on the lift, and the function-field formula of §2.5 computes the regulator of `K₂(E) ⊗ ℚ` (Brunault, thesis, §2.5, (2.92), p. 64). Nothing is claimed about the torsion classes themselves.

### 2.9 The oriented real coordinate

For `E/ℚ`, let `γ₊` generate the conjugation-fixed homology line with the chosen orientation of `E⁰(ℝ)`, choose `γ₂` with `γ₊·γ₂ = +1` and `ω₀` with `∫_{γ₊} ω₀ = 1` (Layer 1; both one- and two-component `E(ℝ)` are allowed). For `ν ∈ H¹(E(ℂ), ℝ(1))⁻` write `ν = 2πi·a` with `a` real; then `a(γ₊) = 0`, and the Riemann bilinear formula in the wedge identification `W(ν)(ω) = ∫ ν ∧ ω` gives `W(ν)(ω₀) = −ν(γ₂)`. Therefore

```text
ellipticDeligneTarget_toReal(ν) = W(ν)(ω₀)/i = −2π · a(γ₂),
```

and if `ν = r_D(γ) = [iη(ξ)]` the scalar is `−∮_{γ₂} η(ξ) = 2 Im(r_E(ξ)(ω₀))`. The value is unchanged by the shear `γ₂ ↦ γ₂ + nγ₊`; reversing the real orientation sends `(γ₊, γ₂, ω₀)` to `(−γ₊, −γ₂, −ω₀)` and negates it. Nekovář's explicitly scaled pairing `J = (1/(2πi))W` has `J(ν)(ω₀) = r_E(ξ)(ω₀)/(πi) = toReal(ν)/(2π)` (Brunault, thesis, Proposition 26, p. 26; Lemme 62, pp. 65–66; Définition 16, p. 19; Nekovář, author copy, §7.5, p. 24, the pairing before (7.5.1)).

**Checks.**

- With untwisted `a(γ₂) = 1` the coordinate is `−2π`; with `∮_{γ₂} η = 1` the regulator coordinate is `−1` and `r_E(ω₀) = −i/2`.
- For `ε = 0` and `ε = 1`, `a(γ₊) = 0` and the same transverse formula applies.
- Shearing `γ₂` leaves the scalar unchanged; reversing the real orientation negates it.
- Non-example: a geometric plus eigenclass with `a(γ₊) ≠ 0` fails the transverse-only formula; the minus hypothesis is essential.

### Examples

- The theta-quotient pair of §2.5 on `τ = 0.2 + 1.1i`: `r_E{f, g}(dz) = −0.1656624 + 0.0350051i` and `∫ η_B(f, g) ∧ dz = −0.331325 + 0.070010i = 2 r_E{f, g}(dz)`.
- Dimensions of the target: `1` over `ℚ`, `2` over `ℚ(i)` (one complex place) and over `ℚ(√2)` (two real places).

### Dependencies

Layer 1 (periods, orientation, all embeddings). MotivicEtaleKTheory §12.2 (Deligne complex, cone sequence, cup products, Chern-character regulator and its conjugation compatibility). PolylogarithmFunctions Layers 1, 4–5 (Bloch–Wigner function and its derivative) and Polylogarithms §§5.13–5.15 (curve current `η`, Steinberg, closed-current class, regulator comparison). K2SymbolsBrauer §§5.2, 7.1–7.3, 8.3 (Matsumoto presentation) and §§9.2–9.8 (tame symbol). EllipticKTheory §§3.1–3.7 (localisation sequence for a curve and what it does not identify). ComplexComparisonPartII §C5.1 (de Rham–Betti comparison, Poincaré pairing and real conjugation). Mathlib: `Module.End.eigenspace`, `Module.End.mem_eigenspace_iff`, `NumberField.InfinitePlace.nrRealPlaces`, `nrComplexPlaces`, `card_add_two_mul_card_eq_rank`, `Complex.imCLM`, `intervalIntegral`, `deriv`.

## Layer 3: The elliptic dilogarithm and its companion

This layer builds the analytic function that every later regulator formula is evaluated with: Bloch's `R_q = J + iD_q` on `E_τ = ℂˣ/q^ℤ`. Its imaginary part is the elliptic dilogarithm, an orbit sum of the Bloch–Wigner function; its real part needs a regularisation, because the two-sided orbit sum of `J(x) = log|x| log|1 − x|` diverges. The layer proves the absolutely convergent Kronecker–Eisenstein expansion of `R_q` directly, by a complex Fourier calculation, so that no later layer is needed for it; constructs the Green function and Goncharov's function on `E`; and proves that `D_q` and Bloch's companion `J_q` satisfy the Steinberg relation, by Stokes (§3.16) and again directly by truncating theta products (§§3.11–3.15). The Bloch–Wigner function `D(z) = Im Li₂(z) + arg(1 − z) log|z|`, its functional equations and its continuity are PolylogarithmFunctions Layers 1, 4–5's.

Throughout, `τ ∈ ℍ`, `y = Im τ`, `q = exp(2πiτ)` and `x(a, b) = exp(2πi(a + bτ))` for real `a, b`. The convention is `R_q = J(q; ·) + iD_q`. Brunault's function satisfies `2R_ω(P, 0) = −conj(R_q(x))` (§3.9), and Zagier's Kronecker formula is a statement about `D − iJ = −iR_q`.

### 3.1 Bounds for `D` and `J` near zero

For `|z| ≤ 1/2`: `|D(z)| ≤ 2|z|(1 + |log|z||)` and `|J(z)| ≤ 2|z| |log|z||`; for `z, z′` in a disc of radius `a ≤ e^{−1}/4` about `0`, `|D(z) − D(z′)|` and `|J(z) − J(z′)|` are `O(|z − z′| |log|z − z′||)`. The proof uses `|Im Li₂(z)| ≤ Σ|z|ⁿ/n² ≤ 1.2|z|`, `|arg(1 − z)| ≤ |log(1 − z)| ≤ 2|z|` and `|log|1 − z|| ≤ 2|z|` for `|z| ≤ 1/2`, and the monotonicity of `y|log y|` for `y ≤ e^{−1}`. These bounds give the convergence of the orbit sums below and drive the truncation estimates of §§3.13–3.15; they are elementary, from the three series bounds just listed.

### 3.2 The elliptic dilogarithm

For `0 < |q| < 1` define the elliptic dilogarithm

```text
ellipticDilog q x = D_q(x) = Σ_{n∈ℤ} D(x qⁿ)        (x ∈ ℂˣ),
```

and for `E` with the normalised uniformisation `η` of §1.2, `D_{E,η}(P) = D_q(exp(2πiη(P)))` (Brunault, thesis, §1.2, Définition 19, (1.38), p. 21; Zagier 1990, §2, p. 615). Prove `ellipticDilog_converges` (uniformly on compact subsets of `ℂˣ`: for `n ≥ 0` use §3.1 at `xqⁿ`, for `n < 0` use `D(z) = −D(1/z)` and §3.1 at `x^{−1}q^{−n}`), `ellipticDilog_continuous` (continuous on `ℂˣ`, real-analytic off `q^ℤ`), `ellipticDilog_mul_q` (simp: `D_q(qx) = D_q(x)`), `ellipticDilog_inv` (`D_q(1/x) = −D_q(x)`), `ellipticDilog_conj` (`D_{q̄}(x̄) = −D_q(x)`, so `D_q` vanishes on `ℝˣ` when `q` is real), `ellipticDilog_distribution` (`D_{E,η}(nP) = n Σ_{Q∈E[n]} D_{E,η}(P + Q)` for `n ≠ 0`, from `E[n] ↔ {ζ q^{k/n}}` and the distribution relation of `D`), `ellipticDilog_real` (for `E` over `ℝ` with (1.40), `D_E = D_{E,η}` depends only on `E` and the orientation of `E(ℝ)`) and `ellipticDilog_orientation_sign` (reversing the orientation negates `D_E`, since `x ↦ 1/x`) (Brunault, thesis, after (1.38), p. 21; (1.39) and Remarque 20, (1.41), p. 22).

**Checks.**

- `D_{e^{−2π}}(i) = 0.9432623087139065947…` (Catalan's constant `0.9159655941772…` plus `2Σ_{n≥1} D(i e^{−2πn})`).
- `D_q(1) = 0`, and for real `q`, `D_q(x) = 0` for every real `x`, in particular at the two-torsion point `−1` (degenerate case).
- `D_q(x²) = 2(D_q(x) + D_q(−x) + D_q(q^{1/2}x) + D_q(−q^{1/2}x))`; at `q = e^{−2π}`, `x = 0.3 + 0.7i` both sides are `0.530237890914402…`.
- Non-example: the one-sided sum `Σ_{n≥0} D(xqⁿ)` is not `q`-invariant; its value at `qx` minus its value at `x` is `−D(x)`, that is `−0.9159655941772…` at `x = i`.
- At `τ = 0.23 + 1.05i`, `η(P) = 0.31 + 0.17τ`, the orbit sum, Brunault's Fourier series (1.49)–(1.50) and the Kronecker series of §3.6 all give `0.502940259517639…`.

### 3.3 Bloch's companion, its regularisation and `R_q`

Let `J(x) = log|x| log|1 − x|` with `J(0) = J(1) = 0`. Define Bloch's companion

```text
blochJ q x = J_q(x) = Σ_{n≥0} J(x qⁿ) − Σ_{n≥1} J(x^{−1} qⁿ)
```

(Bloch, (8.1.4), p. 62, as cited in Brunault, thesis, p. 24). Both one-sided sums converge without correction (§3.1), whereas the two-sided sum `Σ_{n∈ℤ} J(xqⁿ)` diverges, because `J(xq^{−n})` grows like `n²(log|q|)²`. `J_q` is continuous on `ℂˣ` and `J_q(qx) − J_q(x) = −(log|x|)²`, from `J(x) + J(1/x) = (log|x|)²`, so `J_q` is not a function on `E`. It is well defined on divisors: if `F = Σ d_j(α_j)` and `G = Σ e_k(β_k)` are permitted lifts (`Σ d_j = Σ e_k = 0` and `Π α_j^{d_j} = Π β_k^{e_k} = 1`), then `J_q(F^- ∗ G) = Σ d_j e_k J_q(α_j^{−1}β_k)` depends only on the divisors of `f` and `g`: by `ellipticJ_eq_blochJ_of_permitted` below it equals the lift-free sum `Σ d_j e_k J(q; α_j^{−1}β_k)`.

Define the `q`-invariant regularisation

```text
ellipticJ q x = J(q; x) = J_q(x) + (1/3)(log|q|)² B₃(log|x|/log|q|),   B₃(t) = t³ − 3t²/2 + t/2,
```

with Mathlib's Bernoulli polynomial `Polynomial.bernoulli 3` (Zagier, "The Bloch–Wigner–Ramakrishnan polylogarithm function", Math. Ann. 286 (1990), §2, p. 616; the same Bernoulli term reappears in the class regulator of §4.5). Prove `ellipticJ_mul_q` (simp: `J(q; qx) = J(q; x)`, because `B₃(t + 1) − B₃(t) = 3t²`, Mathlib's `Polynomial.bernoulli_comp_one_add_X`, contributes exactly `(log|x|)²`), `ellipticJ_inv` (`J(q; 1/x) = −J(q; x)` and `J(q̄; x̄) = J(q; x)`), `ellipticJ_eq_blochJ_of_permitted` (on permitted lifts, `Σ d_j e_k J(q; α_j^{−1}β_k) = J_q(F^- ∗ G)`: the Bernoulli term is a cubic polynomial in `log|β_k| − log|α_j|`, and each monomial is killed by one of `Σ d_j = 0`, `Σ d_j log|α_j| = 0`, `Σ e_k = 0`, `Σ e_k log|β_k| = 0`) and `ellipticJ_eq_zero_of_real` (for real `q` and `|x| = 1`, or `|x| = q^{1/2}`, `J(q; x) = 0`, by oddness, conjugation invariance and `q`-invariance under `x ↦ 1/x̄`).

Define `ellipticR q x = R_q(x) = J(q; x) + i·D_q(x)` (Zagier's `D − iJ`, 1990, p. 616, is `−iR_q`), with `ellipticR_im` (`Im R_q = D_q`) and `ellipticR_re` (`Re R_q = J(q; ·)`). Brunault's `J_{E,η}` (the imaginary part of his (1.50)) is `−J(q; ·)` (Brunault, thesis, §1.2, after Théorème 21, pp. 23–24; the source asserts this without proof, and §3.6 proves it). For a real curve with (1.40), `J(q; ·)` vanishes on the real locus, so real symbols see only `D_q`; at a complex embedding both parts are needed, and under a change of oriented basis `D_q` alone is not invariant (§3.7).

**Checks.**

- Non-example: at `τ = 0.23 + 1.05i`, `x = exp(2πi(0.31 + 0.17τ))`, the partial sums of `Σ_{|n|≤N} J(xqⁿ)` are `2177.9`, `15955.5`, `121833.9` for `N = 5, 10, 20`.
- Non-example: `J_q(qx) − J_q(x) = −(log|x|)² = −1.25787121131` at the same point, so Bloch's `J_q` is not a function on `E`; `J(q; qx) = J(q; x)` for all `x`.
- At the same point: `J(q; x) = 0.43352307796225…`, `J_q(x) = −0.242027754937798…`, `D_q(x) = 0.502940259517639…`.
- `J(e^{−2π}; x) = 0` whenever `|x| = 1`; `J(q; x) = 0` at the real points `(0, 1)` and `(1, √3)` of `y² = x³ + x + 1` (`q ≈ −0.1092`) (degenerate case).
- On the divisor pair of §2.5, `Σ m n J_q(Q_j − P_i) = Σ m n J(q; Q_j − P_i) = −0.331324812695` for a permitted lift; moving one point of `(f)` by `τ` gives `−22.4005498` for `J_q`.

### 3.4 The weight-two Kronecker–Eisenstein kernel

For `τ ∈ ℂ`, `a, b ∈ ℝ` and `v = (m, n) ∈ ℤ²` put `λ_v = m + nτ` and `χ_v(a, b) = exp(2πi(mb − na))`. Define `kroneckerTerm τ a b v` to be `0` at `v = (0, 0)` and `χ_v(a, b)/(λ_v² · conj λ_v)` otherwise. This is the summand, with no convergence assumption; `χ_v` is the intersection-pairing character for the oriented basis `(1, τ)` and equals the product of Mathlib's unit-period circle characters `fourier (−n)` at `a mod ℤ` and `fourier m` at `b mod ℤ`. Prove `kroneckerTerm_zero` (simp), `kroneckerTerm_eq` (the formula for `v ≠ 0`), `kroneckerTerm_norm` (for `Im τ > 0` and `v ≠ 0`, `|K| = |m + nτ|^{−3}`: if `m + nτ = 0` then its imaginary part forces `n = 0` and then `m = 0`), `kroneckerTerm_neg_index` (`K(a, b; −m, −n) = −conj(χ_v(a, b))/((m + nτ)²(m + n τ̄))`, valid also at `v = 0` with total division), `kroneckerTerm_neg_point` (`K(−a, −b; m, n) = −K(a, b; −m, −n)`), `kroneckerTerm_add_int_left` and `kroneckerTerm_add_int_right` (invariance under integer shifts of `a` and of `b`) and `kroneckerTerm_circle` (the comparison with Mathlib's `fourier` characters) (Zagier, 1990, §2, p. 616, and Theorem 1, p. 619, rewritten in the oriented basis `(1, τ)`; the printed weight-two constant of Zagier's Theorem 1 is not used, see §3.5). In the Lean file the summand is `kroneckerTerm` and `R_q` is `ellipticR τ a b`, its Kronecker form, with `summable_kroneckerTerm`, `ellipticR_neg`, `ellipticR_add_one_right`, `ellipticR_S` (the basis change by `S` of §3.7) and the pinned value `ellipticR_I_quarter_im` of §3.2.

**Checks.**

- At `τ = i`, `a = b = 0`: `K(0, 0) = 0` (degenerate), `K(1, 0) = 1`, and `K(0, 1) = −i`, which distinguishes `λ² λ̄` from `λ λ̄²`.
- At `τ = i`, `a = 1/4`, `b = 0`: `K(0, 1) = −1`, which distinguishes `exp(−2πina)` from `exp(+2πina)`.
- At `τ = i`, `a = 0`, `b = 1/4`: `K(1, 0) = fourier 1 (1/4 mod ℤ) = i` (agreement with Mathlib's circle characters).
- Non-example: at `τ = i`, `a = b = 0`, `K(2, 0) = 1/8`, not the Green-kernel scale `1/4`.

### 3.5 The complex Fourier coefficients of the orbit sums

Put `F_τ(a, b) = D_q(x(a, b)) − i·J(q; x(a, b))`. Prove that its Fourier coefficient `∫₀¹∫₀¹ F_τ(a, b) conj(χ_{m,n}(a, b)) da db` is `0` for `(m, n) = (0, 0)` and `−y²/(π(m + nτ)²(m + n τ̄))` otherwise; this is the complex calculation, including the companion, not only the real part. The method is Zagier's (1990, §2, proof of Theorem 1, pp. 619–620): for a disc argument `w` expand `D(w) − iJ(w) = Σ_h [(wʰ − w̄ʰ)/(2ih²) + i log|w| wʰ/h]` from `Li₂(w) = Σ wʰ/h²` and `log(1 − w) = −Σ wʰ/h`; split the orbit at `b + r > 0` and `b + r < 0` by inversion, with the integrals of the absolute disc series bounded by multiples of `Σ h^{−3}`; for horizontal frequency `h > 0` unfold `b + r` to `u ∈ ℝ`, where the integrands are `−i(1/(2h²) + 2πyu/h) exp(2πi(hτ − m)u)` for `u > 0` and `−i/(2h²) exp(2πi(hτ̄ − m)u)` for `u < 0`, and integrate to `y²/(π(hτ − m)²(hτ̄ − m))`, which is the coefficient at `n = −h`; oddness `F(−a, −b) = −F(a, b)` gives `h < 0`. At horizontal frequency zero the disc terms average to zero and the remaining function is `−i(4π²y²/3)B₃(b)`; Mathlib's `bernoulliFourierCoeff_eq` at `k = 3` gives `−y²/(πm³)` for `m ≠ 0` and `0` for `m = 0`. This Bernoulli mode is exactly the regularisation of §3.3. Prove this as `complex_fourier_coefficients`. The weight-two constant is computed here; Zagier's printed Theorem 1 (p. 619) needs the factor `−(τ − τ̄)²/(2πi)` with the character `exp(2πi(nξ − mη))` in weight two, so that `D_{1,2} = 2(J + iD)` and `D_{2,1} = 2(J − iD)` in his notation, and the formula on p. 616 has `(i/π)·Im(τ)²` with `sin(2π(nξ − mη))`.

**Checks.**

- At `(m, n) = (1, 0)` the coefficient is the negative real number `−y²/π`.
- At `τ = i`, `(m, n) = (0, 1)` the coefficient is `i/π`.
- Non-example: omitting the Bernoulli correction changes every `n = 0` coefficient and fails the first check.

### 3.6 The Kronecker–Eisenstein expansion

Prove `complex_fourier_reconstruction`: `Σ_{v∈ℤ²} K_τ(a, b; v)` converges absolutely and uniformly in real `a, b` (compare with Mathlib's `ZLattice.summable_norm_rpow` at exponent `−3` on `PeriodPair.lattice` for the periods `(1, τ)`), and

```text
D_q(x) − i·J(q; x) = −(y²/π) Σ_{v∈ℤ²} K_τ(a, b; v),   that is   R_q(x) = −i(y²/π) Σ_v K_τ(a, b; v),
```

for `x = x(a, b)`, everywhere, including `(a, b) = (0, 0)` where pairing `v` with `−v` gives `0`. The proof integrates the summed kernel term by term (`MeasureTheory.integral_tsum_of_summable_integral_norm`), compares coefficients with §3.5, and concludes by injectivity of the Fourier basis in `L²` (`fourierBasis_repr`) and continuity, one variable at a time. Equivalently, with `λ = m[1] + n[τ] ∈ H₁(E, ℤ)`, `χ_λ(P) = exp(2πi⟨λ, P⟩)` for the complex orientation and `η(λ) = m + nτ`, Brunault's (1.49)–(1.50) hold, `J_{E,η} = −J(q; ·)`, and `R_q(x) = −i(y²/π) Σ'_λ χ_λ(P)/(η(λ)² conj η(λ))` (Brunault, thesis, §1.2, Théorème 21, (1.50), p. 23; Remarque 25, p. 26, for normal convergence). Neither `D_q` nor `R_q` needs regularisation in this series. The only series of this layer that is not absolutely convergent is the Green function's `Σ' χ_λ/‖λ‖²` (§3.8; Brunault, thesis, Remarque 23, p. 25). With the opposite orientation of the intersection pairing the right side is `−D_q`: the orientation is part of the statement. This proof uses no torsion-point identity and no result of Layer 4; Bloch's finite Fourier identity at torsion points (§4.17) is the specialisation of this theorem to torsion points, and §4.16 also proves it directly.

**Checks.**

- At `τ = 0.23 + 1.05i`, `(a, b) = (0.31, 0.17)`: `F = 0.502940259517639 − 0.433523077962249i`; a square cut-off at `|m|, |n| ≤ 400` agrees within `3 × 10^{−9}`; the same agreement holds at `τ = 0.8i`, `(a, b) = (0.2, 0.35)` and at `τ = 1/2 + 0.9i`, `(a, b) = (0.13, 0.61)`.
- At every two-torsion point, oddness and periodicity give `F = 0`.
- Non-example: the Green series, whose terms are of order `|λ|^{−2}`, cannot be substituted for this absolutely convergent series; with the opposite orientation the series gives `−D_q`.

### 3.7 Change of the lattice basis

For `γ = (a b; c d) ∈ SL₂(ℤ)`, `τ′ = γτ`, `x = exp(2πiz)` and `x′ = exp(2πiz/(cτ + d))`:

```text
R_{q(τ′)}(x′) = R_{q(τ)}(x)/(cτ̄ + d).
```

In the series of §3.6, `η(λ) ↦ η(λ)/(cτ + d)` and `Im τ′ = Im τ/|cτ + d|²`, so the series is multiplied by `(cτ + d)²(cτ̄ + d)/|cτ + d|⁴ = 1/(cτ̄ + d)`; the intersection pairing is `SL₂(ℤ)`-invariant, so `χ_λ` is unchanged. In particular `D` alone is not invariant: `D_{q(τ′)}(x′) = Im(R_{q(τ)}(x)/(cτ̄ + d))` involves `J(q; x)`. Under `τ ↦ τ + 1` nothing changes; under `τ ↦ −1/τ`, `R′ = R/τ̄`. Brunault announces the dependence on `η` without stating it (thesis, §1.2, Remarque 27, p. 27). Both `y²` and the lattice vectors are rescaled; keeping `y²` fixed would give the factor `(cτ + d)²(cτ̄ + d)` instead, which fails the first check below.

**Checks.**

- At `τ = 0.23 + 1.05i`, `z = 0.31 + 0.17τ`, `γ = S`: `D_{q′}(x′) = 0.494093380257417` and `J(q′; x′) = −0.370760744817555`, which are the imaginary and real parts of `R_q(x)/τ̄`, while `D_q(x) = 0.502940259517639`.
- `τ ↦ τ + 1` leaves `D` and `J` unchanged (difference below `10^{−21}`).

### 3.8 The Green function of `E`

The Arakelov Green function `G_X` of a compact Riemann surface (with `∂_y∂̄_y G_X(x, ·) = πi·vol_X` off `x`, `G_X(x, y) − log|z(y)|` smooth at `x`, `∫ G_X(x, ·) vol_X = 0`, symmetric) is GrossZagierAndArithmeticHeights §2.8's. For `E` with `η : E ≅ ℂ/(ℤ + ℤτ)` define `greenFunction` and prove: `vol_E = (i/(2 Im τ)) η^*(dz ∧ dz̄)` and `‖λ‖² = π|η(λ)|²/Im τ` (Brunault, thesis, (1.57)–(1.58), p. 24); `greenFunction_fourier` (`G_E(P, Q) = −½ Σ'_λ χ_λ(P − Q)/‖λ‖²` as distributions, the series not being absolutely convergent; Brunault, thesis, §1.2, Proposition 22, (1.54), p. 24, and Remarque 23, p. 25); `greenFunction_translate` (simp: translation invariance, Proposition 18, p. 20); the real case `G_E(P, c(t)) = G_E(P, t)` for real `P` ((1.65), p. 27); `greenFunction_closedForm` (Kronecker's second limit formula: for `η(z) = a + bτ` with `0 ≤ b < 1` and `x = exp(2πiη(z))`, `G_E(0, z) = ½B₂(b) log|q| + log|1 − x| + Σ_{n≥1} log|(1 − qⁿx)(1 − qⁿ/x)|`); `greenFunction_logAbs` (`log|f| = C_f + Σ_x ord_x(f) G_E(x, ·)` with `C_f = ∫ log|f| vol_E`, because the difference is harmonic on `E`; Brunault, thesis, (1.14)–(1.15), p. 17); and `greenFunction_eq_arakelov` (agreement with GrossZagierAndArithmeticHeights §2.8's kernel for the Arakelov volume form). The Fourier identification follows from `∂∂̄ = πi(vol_E − δ₀)`, integral zero and uniqueness; the closed form from the same three properties (Brunault, thesis, §1.1, Proposition 9, p. 16, for the general Green function).

**Checks.**

- `∫_E G_E(0, ·) vol_E = 0` (degenerate case).
- `G_E(0, z) = 0.111063245655…` at `τ = 0.23 + 1.05i`, `η(z) = 0.31 + 0.17τ`, and the Gaussian-regularised Fourier sum `−½Σ' χ_λ e^{−δ‖λ‖²}/‖λ‖²` equals it minus `δ/2` for `δ = 0.02, 0.005, 0.00125`.
- `∂∂̄ G_E(0, ·) = πi(vol_E − δ₀)` as currents.
- Non-example: `Σ'_{‖λ‖≤R} 1/‖λ‖²` grows like `log R`, so the Fourier series cannot be integrated termwise without justification.
- `G_E` agrees with GrossZagierAndArithmeticHeights §2.8's Arakelov Green kernel of `E(ℂ)`.

### 3.9 Goncharov's function and Brunault's evaluation

For `ω ∈ Ω^{1,0}(E)` let `R_ω(P, Q) = ∫_{t∈E} G_E(P, t) ω_t ∧ ∂̄_t G_E(Q, t)` and `R_E(P, Q) = (ω ↦ R_ω(P, Q))` (Brunault, thesis, Définitions 11 and 14, p. 18). Prove: `R_E` is antisymmetric (Proposition 12, p. 18, by Stokes) and translation invariant (Proposition 18, p. 20); for `ω = η^*dz`, `R_ω(P, Q) = (πi/2) Σ'_λ χ_λ(P − Q) η(λ)/‖λ‖⁴`, a normally convergent series (Proposition 24, (1.61)–(1.62), p. 25; Remarque 25, p. 26); with `x = exp(2πiη(P))`,

```text
2R_ω(P, 0) = −J(q; x) + i·D_q(x) = −conj(R_q(x))
```

(Proposition 26, (1.63), p. 26, together with `J_{E,η} = −J(q; ·)` from §3.6, after rewriting `‖λ‖⁴ = π²|η(λ)|⁴/y²`); for `E` over `ℝ` with (1.40), `R_ω(P, Q) = (i/2) D_E(P − Q)` for real `P, Q` ((1.64), p. 26); and `r_E{f, g}(ω) = Σ_x Σ_y ord_x(f) ord_y(g) R_ω(x, y)` (Proposition 17, (1.28)–(1.29), p. 19, substituting §3.8 for `log|f|` and `log|g|` in (1.27), the constant `C_f` contributing `−C_f ∫ d(log|g| ω) = 0`). The interchange of sum and integral in Proposition 24 is justified by pairing `G_E(P, ·)` in the Sobolev space `H^{1/2}(E)` with `ω ∧ ∂̄G_E(Q, ·)` in `H^{−1/2}(E)`, where Parseval holds, or by inserting `e^{−δ‖λ‖²}` and letting `δ → 0`; Brunault's text passes over this step. The divisor formula that results is §4.2.

**Checks.**

- At `τ = 0.23 + 1.05i`, `η(P) = 0.31 + 0.17τ`, the lattice sum (1.62) with `|m|, |n| ≤ 120` gives `2R_ω(P, 0) = −0.4335231634 + 0.5029403073i`, against `−J(q; x) + iD_q(x) = −0.4335230780 + 0.5029402595i`.
- For the theta quotients of §2.5, `½ conj(R_q(Σ m n [Q_j − P_i])) = −0.1656624063 + 0.0350051346i`, the quadrature value of `r_E{f, g}(dz)`.
- `J(q; x) = 0` at the real points of `y² = x³ − x` and `y² = x³ + x + 1`, as (1.64) requires.

### 3.10 The relation on the projective line

Let `f ∈ ℂ(t)^×` with `f(0) = f(∞) = 1`, so that `(f) = Σ d_j(α_j)` on `ℂˣ` with `Σ d_j = 0` and `Π α_j^{d_j} = 1`, and let `g ∈ ℂ(t)^×` with `(g) = Σ e_k(β_k)` on `ℂˣ`. Prove `projective_line_companion_tame`: `J((f)^- ∗ (g)) := Σ d_j e_k J(α_j^{−1}β_k) = Σ_{x∈ℂˣ} log|x| log|tame_x{f, g}|`, by expanding the rational functions into linear factors and using `(log|α|)² = J(α) + J(1/α)` (a computation on `ℙ¹`, proved here). For `K ∉ {0, 1}` and `f ≠ K`, put `F = f/K` and prove `projective_line_companion_steinberg`: `J((f)^- ∗ (K − f)) = 0`. Indeed bilinearity gives

```text
{f, K − f} = {F, 1 − F} + {K, 1 − F} + {F, K} + {K, K},
∂_x{f, K − f} = K^{ord_x(K − f) − ord_x(f)}.
```

The Steinberg term has trivial tame symbols, and both weighted sums `Σ ord_x(f) log|x|` and `Σ ord_x(K − f) log|x|` vanish because the functions have equal nonzero values at `0` and `∞`. This proves the assertion with K2SymbolsBrauer §§9.2–9.8's convention `∂{f, g} = (−1)^{ab}f^b/g^a`; in particular `∂_x{f, K} = K^{−ord_x f}`. The general elliptic relation, including `K = 1`, remains §3.14; every symbol requires both entries nonzero.

For the dilogarithm prove `relative_projective_line_steinberg`: if moreover `K ∉ {0, 1}` and `g = K − f ≠ 0`, then `Σ_{j,k} d_j e_k D(β_k/α_j) = 0`. Repeated zeros and poles are allowed through their multiplicities. The proof uses the Chow dilogarithm of Polylogarithms §§5.13–5.15, with the corrected real normalisation `−(2π)^{−1}∫r₂`: by its projective-line divisor formula `P₂(f ∧ g ∧ t) = Σ d_j e_k D(α_j/β_k)` (with `div(t) = [0] − [∞]` and the cross-ratio normalisation `r(∞, 0, 1, z) = z`), and multiplication by a nonzero constant leaves each divisor unchanged, so `P₂(f ∧ g ∧ t) = P₂(F ∧ (1 − F) ∧ t)` with `F = f/K`; its endpoint Steinberg evaluation gives `D(F(0)) − D(F(∞)) = 0`, both endpoint values being `1/K`; inversion of `D` turns `α/β` into the diamond argument `β/α` (Goncharov, "Polylogarithms, regulators, and Arakelov motivic complexes", arXiv:math/0207036v3, Theorem 3.4, p. 28, and Proposition 6.8 with Lemma 6.9, p. 57, with the normalisation corrections recorded by Polylogarithms). No elliptic relation is used.

**Checks.**

- For `f = (t − a₁)(t − a₂)/((t − b₁)(t − b₂))` with `a₁ = 0.3 + 1.2i`, `a₂ = −0.7 + 0.4i`, `b₁ = 1.1 − 0.5i`, `b₂ = a₁a₂/b₁` and `K = 0.6 − 1.3i`, both sums are below `10^{−24}` in absolute value.
- For `f = 1` and `K ∉ {0, 1}` the divisor sum is empty (degenerate case).
- Replacing `K − f` by `1 − f/K` leaves the divisor unchanged. For an independent sign check, take `f = (t − 2)(t − 3)/((t − 1)(t − 6))`, `g = (t − 5)/(t − 7)`: both the `J(β/α)` sum and the weighted logarithm of the tame symbols are `−0.574674630675974…`; reversing the diamond gives the positive value. A zero Steinberg sum alone cannot detect that reversal.
- At `t = 0`, `∂_0{t, 2} = 1/2`, rather than `2`; and `{f, 1 − f/K}` alone is not a Steinberg symbol unless its first entry is also scaled (non-example).

### 3.11 Truncated theta products

§§3.11–3.15 prove the two Steinberg relations of §3.16 a second time, directly from the product expansion of `f` and its truncations, without the Green function or currents. Nothing after this layer depends on §§3.11–3.15. Let `f` be an elliptic function with divisor `Σ d_j(α_j)` on `ℂˣ/q^ℤ`, lifted with `Σ d_j = 0` and `Π α_j^{d_j} = 1`, and put `F₀(w) = Π_j (w − α_j)^{d_j}`, so that `F₀(0) = 1` and `F₀(w) → 1` as `w → ∞`. The theta product `F(w) = Π_{r∈ℤ} F₀(q^r w)` converges locally uniformly off its zero and pole support, extends meromorphically across that support, is `q`-invariant and has the divisor of `f`, so `f = cF` with `c` constant. Fix `K ∉ {0, 1}`. Let `A_N` be the annulus `|q|^N ≤ |w| ≤ |q|^{−N}`, `F_N(w) = Π_{|r|≤N} F₀(q^r w)` and `T_N = F/F_N` the tail product. Prove: (i) there is `R > 0` independent of `N` such that `F_N − K` has no zeros off `A_{N+R}`: for `|w| ≥ |q|^{−N−R}` every factor is evaluated at a point `v` with `|v| ≥ |q|^{−R}`, where `log F₀(v) = Σ_j d_j log(1 − α_j/v) = O(|v|^{−1})`, and the geometric sum over `r` gives `|F_N(w) − 1| = O(|q|^R)`; symmetrically for `|w| ≤ |q|^{N+R}`, from `F₀(v) = Π_j (1 − v/α_j)^{d_j}`; so `F_N − K` stays near `1 − K ≠ 0`; (ii) for irrational `0 < ε < 1`, `R > 0` and `N₀` there is `N ≥ N₀` with `Z(F_N − K, N(1 − ε) + R) = Z(F − K, N(1 − ε) + R)`, `Z(g, R)` counting zeros on `A_R`, so that along a sequence `N → ∞` the number of zeros of `F_N − K` off `A_{N(1−ε)+R}` is `O(Nε) + O(1)`. For (ii), choose `N` so that both boundary phases `±(R − Nε) mod 1` avoid the finitely many logarithmic radii `log|β_k|/log|q|` and `log|α_j|/log|q|`, with a fixed positive separation (possible because `ε` is irrational); on the boundary circles `|F(w) − K|` is bounded below, `F_N` is bounded and `|T_N − 1| = O(|q|^{Nε})`, and Tau Ceti's `TauCeti.rouche_windingNumber_comp` and `TauCeti.argumentPrinciple_windingNumber` equate the zero counts.

**Checks.**

- For the empty divisor, `F₀ = F_N = F = 1`, and `F_N − K` has no zeros for `K ≠ 1`.
- For `F₀(w)=(w−2)(w−3)/((w−1)(w−6))`, the divisor is balanced and `F₀(0)=F₀(∞)=1`, but `F₀(2)=0` and it has a pole at `1`; balancing does not make the truncation constant.
- `K=1` must be excluded from the confinement argument: for the empty divisor `F_N−1` is identically zero, so its zeros cannot be confined to a bounded annulus.

### 3.12 Where the zeros of `F_N − K` lie

Write the divisor of `F − K` on `ℂˣ/q^ℤ` as `Σ_k e_k(β_k)`, with nonzero integral multiplicities, lifted with `Σ e_k = 0` and `Π β_k^{e_k} = 1`. Choose disjoint small discs about the `β_k` whose images on the torus are disjoint and which avoid `0`. Prove `truncation_divisor_clusters`: for every sufficiently small irrational `ε > 0` and all sufficiently large `N`, each disc translated by `q^r`, `|r| ≤ M_N := ⌊N(1−ε)⌋`, contains exactly `|e_k|` zeros if `e_k > 0`, or poles if `e_k < 0`, counted with multiplicity. Denote them by `β_{k,j}(N,r)`, `1 ≤ j ≤ |e_k|`, with sign `sgn(e_k)`. Rouché's theorem gives the zero count; poles of `F_N` in this inner region agree with those of `F`, since the omitted tail is a holomorphic unit there. Shrink the discs so that

```text
|log|β_{k,j}(N,r)| − log|β_k q^r|| ≤ c ε.
```

All constants may depend on the fixed divisor and discs, but not on `N` or `r`. The annulus between these complete clusters and the boundary in §3.11 has bounded width in the logarithmic radius; its zero and pole count is `O(1)`, by the same boundary count and local comparison. Thus the remaining signed divisor, denoted by `β′_N`, has total absolute multiplicity `O(Nε)+O(1)`. Selecting the same range `−M_N ≤ r ≤ M_N` for every `k` is essential: the complete clusters have signed degree `(2M_N+1)Σ_k e_k = 0`. Since `(F_N−K)(0)=(F_N−K)(∞)=1−K`, its full divisor has degree zero and logarithmic moment zero. Subtracting the complete clusters therefore gives `Σ e_{β′_N}=0` and `Σ e_{β′_N}log|β′_N|=O(Nε)+O(1)`, using `Σ e_k log|β_k|=0` and the displayed estimate. This proves the multiplicity version of (iii)–(iv); no simple-pole reduction is assumed.

**Checks.** For the empty divisor `F = F_N = 1`, `F_N − K = 1 − K` has no zeros or poles and every sum in (iv) is `0` (degenerate case). For every `N`, `(F_N − K)(0) = (F_N − K)(∞) = 1 − K`, so the zeros and poles of `F_N − K` satisfy `Π β^{e_β} = 1`: their total `Σ e log|β|` is `0` for every `K`, not `log|1 − K|` (non-example at `K = 3`). A Weierstrass `℘` function has a double pole, and `℘−K` retains that pole for every `K`; varying the regular value can simplify its zeros but cannot make its divisor simple. The cluster count at that pole is two, including when both entries are represented at the same point.

### 3.13 Uniform estimates for the companion

For a rational function `g` on `ℙ¹` with divisor `Σ d_j(α_j)` in `ℂˣ` put `J_g(x) = Σ_j d_j J(α_j^{−1}x)`, so that `J_{F_N}(x) = Σ_{|r|≤N} Σ_j d_j J(q^r α_j^{−1}x)`; put `J_{F,q}(x) = Σ_j d_j J_q(α_j^{−1}x)` and `C_F = Σ_j d_j (log|α_j|)²`. Prove: (a) `Σ e_{β′_N} J_{F_N}(β′_N) = O(Nε) + O(1)`, via `J_{F_N}(β) + (log|β|/log|q| − N)C_F = O(1)` uniformly for `β ∈ A_{N+R}` and `N`, with `R` fixed as in §3.11 (each factor with `|q^r α_j^{−1}β|` large contributes about `C_F`, because `Σ d_j = 0` and `Σ d_j log|α_j| = 0`, and the others are summable), together with (iv); (b) if `|xq^{N₀}| ≤ M` then `Σ_{n≥N₀} |J(xqⁿ)| = O(M|log M|)` as `M → 0` (§3.1), hence `|J_{F,q}(x) − J_{F_N}(x) + N C_F| = O(Nε |q|^{Nε})` uniformly on `A_{N(1−ε)+R}`: by `J(1/z) = (log|z|)² − J(z)`, the left side is the sum over `n > N` of `Σ_j d_j J(qⁿα_j^{−1}x)` and of `Σ_j d_j J(q^{−n}α_j^{−1}x) − C_F`, two tails of that size; (c) `|J_{F,q}(x) − J_{F,q}(x′)| = O(ε log ε)` uniformly for `|x − x′| ≤ ε|x′|`, using `J_{F,q}(qx) − J_{F,q}(x) = −C_F` and §3.1.

**Checks.** The annular restriction in (a) is necessary. For `F₀(w)=(w−2)(w−3)/((w−1)(w−6))`, the two balancing conditions hold and `C_F=−2log 2 log 3 ≠ 0`. With `N` fixed and `β→0`, `J_{F_N}(β)→0`, whereas `(log|β|/log|q|−N)C_F` is unbounded. Thus the estimate is false uniformly over all `ℂˣ`. For the empty divisor, `C_F=J_{F_N}=J_{F,q}=0`. Translating `x` by `q` changes `J_{F,q}` by `−C_F`; it is not individually periodic when `C_F≠0`.

### 3.14 The Steinberg relation for the companion

Prove: for every elliptic function `f` and every constant `K` with both `f` and `K − f` nonzero, `J_q((f)^- ∗ (K − f)) = 0` on permitted lifts, where `J_q(F^- ∗ G) = Σ d_j e_k J_q(α_j^{−1}β_k)` is the diamond sum of §3.3. Since the sum vanishes when an entry is constant, `f` may be replaced by its theta product `F` and `K` by `K/c`. The case `K = 0` follows from the oddness of `J(q; ·)` and antisymmetry. For nonzero `K` the reduction to `K ∉ {0, 1}` is by continuity, which is part of this target: `K ↦ J_q((f)^- ∗ (K − f))` is continuous on `ℂˣ` by (c) of §3.13 and continuity of roots as multiplicity-bearing divisors. Repeated zeros and poles are handled by §3.12, including critical values; changing `K` is not a reduction to simple poles. Then apply §3.10 to `F_N` and `K − F_N`: the zeros and poles `β` of `K − F_N` satisfy `Σ e_β J_{F_N}(β) = 0`. By (a) the stray ones contribute `O(Nε) + O(1)`; by (b), and since the complete clusters have signed degree zero, `Σ_k Σ_{|r|≤M_N} Σ_{j=1}^{|e_k|} sgn(e_k) J_{F,q}(β_{k,j}(N,r)) = O(Nε) + O(1) + O(N²ε|q|^{Nε})`; (c) replaces each `β_{k,j}(N,r)` by `β_k q^r` at total cost `O(Nε|log ε|)`; `J_{F,q}(qx) − J_{F,q}(x) = −C_F` and `Σ e_k = 0` give `(1 + 2⌊N(1 − ε)⌋) Σ_k e_k J_{F,q}(β_k) = O(Nε) + O(1) + O(N²ε|q|^{Nε}) + O(Nε|log ε|)`; divide, let `N → ∞` along the sequence of §3.11, then `ε → 0`.

### 3.15 The Steinberg relation for the dilogarithm

Prove `D_q((f)^- ∗ (K − f)) = 0` for every elliptic `f` and constant `K` with both symbol entries nonzero. The inputs are (d) `|D_{F_N}(x) − D_{F,q}(x)| = O(Nε|q|^{Nε})` uniformly on `A_{N(1−ε)+R}` (from `|D(y)| = O(|y| |log|y||)` near `0`, §3.1, and `D(1/y) = −D(y)` for the large arguments) and (e) `|D_{F,q}(x) − D_{F,q}(x′)| = O(ε log ε)` for `|x − x′| ≤ ε|x′|` (as (c) of §3.13, using `D(1/x) = −D(x)` and `D(x) = −D(1 − x)`). The argument is simpler than §3.14 because `Σ_n |D(xqⁿ)|` converges, so `D_{F_N}` is bounded uniformly in `x` and `N` and the `O(Nε) + O(1)` stray zeros of §3.12 contribute `O(Nε) + O(1)`; the relation on the projective line is §3.10. The proof does not use §3.14, and §3.14 does not follow from it.

### 3.16 `R_q` descends to `K₂`

For every elliptic `f` and every constant `K` with `K − f` not identically zero, `D_q((f)^- ∗ (K − f)) = 0` and `J_q((f)^- ∗ (K − f)) = 0` on permitted lifts, and both vanish when an entry is constant; in the Lean file the statement for `R_q` on torus divisors is `ellipticR_diamond_steinberg`. Hence `R_q = J(q; ·) + iD_q` induces a homomorphism `K₂(ℂ(E)) → ℂ`, `{f, g} ↦ R_q((f) ⋄ (g))` (Matsumoto presentation, K2SymbolsBrauer §§5.2, 7.1–7.3, 8.3), and a map on `K₂(E)` through `K₂(E) → K₂(ℂ(E))`. This is the regulator Bloch introduced and evaluated by the elliptic dilogarithm (Goncharov–Levin, "Zagier's conjecture on L(E, 2)", arXiv:alg-geom/9508008v4, §3.3, pp. 21–22). The proof the rest of the roadmap uses is Stokes. By §3.9, with translation invariance and the oddness of `R_q`, `r_E{f, g}(dz) = Σ_{x,y} ord_x(f) ord_y(g) R_{dz}(x, y) = ½ conj(R_q((f) ⋄ (g)))` for all `f, g` (Brunault, thesis, Propositions 17, 18 and 26, pp. 19–26; the same evaluation by Fourier expansion of `log|f|` is Goncharov–Levin, §3.3, Lemma 3.22 and the formula before it, pp. 21–22); this is the divisor formula, restated as §4.2. The integral `r_E` vanishes on symbols with a constant entry and on `{F, 1 − F}` (§2.5, Brunault's Lemme 15), so by the expansion `{f, K − f} = {F, 1 − F} + {K, 1 − F} + {F, K} + {K, K}`, `F = f/K`, of §3.10 it vanishes on `{f, K − f}` for `K ≠ 0`, and for `K = 0` the sum `R_q((f) ⋄ (−f))` vanishes because `R_q` is odd; real and imaginary parts give the two relations, the companion one through `ellipticJ_eq_blochJ_of_permitted` (§3.3). §§3.11–3.15 give a second proof, with its own estimates for each part.

**Checks.**

- At `τ = 0.23 + 1.05i`, for the degree-two theta quotient `f` with zeros `0.13 + 0.21τ`, `0.47 + 0.66τ`, a pole at `0.31 + 0.05τ` and the second pole fixed by the sum condition, and `K = 0.6 − 1.3i`, `2.5`, `−0.4 + 0.9i`: the two zeros of `f − K` are found by Newton's method, and `|R_q((f) ⋄ (K − f))|` and the permitted-lift companion sum are below `2·10^{−14}`.
- `R_q((c) ⋄ (g)) = 0` for a constant `c`, since `(c) = 0` (degenerate case).
- Non-example: for the unrelated theta quotients of §2.5 (`τ = 0.2 + 1.1i`), `R_q((f) ⋄ (g)) = 2 conj(r_E{f, g}(dz)) = −0.3313248 − 0.0700102i ≠ 0`: the vanishing is a property of `{f, K − f}`, not of products of degree-zero divisors.

### Examples

- The test point `τ = 0.23 + 1.05i`, `η(P) = 0.31 + 0.17τ`: `D_q = 0.502940259517639`, `J(q; ·) = 0.43352307796225`, `J_q = −0.242027754937798`, `G_E(0, P) = 0.111063245655`.
- `τ = i`: `D_{e^{−2π}}(i) = 0.9432623087139065947…`.

### Dependencies

Layer 1 (`q`, `η`, orientation, change of basis) and Layer 2 (the symbol regulator). PolylogarithmFunctions Layers 1, 4–5 (the Bloch–Wigner function, `Li₂`, inversion and distribution relations, continuity) and Polylogarithms §§5.13–5.15 (the Chow dilogarithm on the projective line and its Steinberg evaluation). GrossZagierAndArithmeticHeights §2.8 (the Arakelov Green function). K2SymbolsBrauer §§5.2, 7.1–7.3, 8.3, 9.2–9.8. Mathlib: `Polynomial.bernoulli`, `Polynomial.bernoulli_comp_one_add_X`, `bernoulliFourierCoeff_eq`, `fourier`, `fourierCoeff`, `fourierBasis_repr`, `fourierCoeff_eq_intervalIntegral`, `ZLattice.summable_norm_rpow`, `MeasureTheory.integral_tsum_of_summable_integral_norm`, `Complex.log`, `ZMod.dft`. Tau Ceti: `TauCeti.rouche_windingNumber_comp`, `TauCeti.argumentPrinciple_windingNumber`.

## Layer 4: The divisor formula and Bloch's classes

This layer turns the regulator integral of Layer 2 into a finite sum of values of `R_q`, over a convolution of the divisors of `f` and `g`, and evaluates it on the classes Bloch builds from torsion points. The output is Bloch's finite Fourier identity (his Theorem 10.2.1), which expresses a twisted sum of regulators as a weight-two Kronecker–Eisenstein lattice sum; Layer 5 specialises it to a CM curve and Layer 7 uses the divisor formula on modular curves. The identity is proved twice: from the Kronecker expansion of §3.6, and directly, by evaluating the orbit sums at torsion points in closed form (Bloch's route), given here in full so that no step depends on an unproved interchange of sums, with each closed form pinned by a computed witness (§4.16).

### 4.1 The diamond convolution

Let `A` be an abelian group (`E(k̄)` for an elliptic curve over a field, or `E_τ = ℂ/(ℤ + ℤτ)`), and identify divisors with elements of Mathlib's group ring `AddMonoidAlgebra ℤ A`. For `D = Σ m_i[P_i]` and `D′ = Σ n_j[Q_j]` define the diamond convolution

```text
diamond D D′ = D ⋄ D′ = Σ_{i,j} m_i n_j [Q_j − P_i] = (mapDomain (a ↦ −a) D) * D′,
```

the product of the reflection of `D` with `D′`. It is the convention in which the divisor formula §4.2 reads `r_E = ½ conj R_q((f) ⋄ (g))`, the multiplicative argument `α_j^{−1}β_k` being the point `Q_k − P_j`; Goncharov–Levin's Bloch map `f ⊗ g ↦ Σ n_i m_j{a_i − b_j}` (arXiv:alg-geom/9508008v4, §3.1, p. 11) is its reflection `[−1]_*((f) ⋄ (g))`. The opposite convention `Σ m_i n_j [P_i − Q_j]` equals `[−1]_*(D ⋄ D′)`: it is the reflected divisor, not the negated one, so an odd function such as `R_q` or `D_q` changes sign under the change of convention and an even function does not. Provide `diamond_single_single` (simp: `[P]·m ⋄ [Q]·n = [Q − P]·mn`, from `single_mul_single`), `diamond_add_left`, `diamond_add_right` (simp), `divDeg_diamond` (`deg(D ⋄ D′) = deg D · deg D′` for the augmentation, a ring homomorphism with `deg ∘ mapDomain(−·) = deg`), `diamond_single_left` (`[P] ⋄ D′` is `D′` translated by `−P`; `D ⋄ [Q]` is the reflection of `D` translated by `Q`), `diamond_comm` (`D′ ⋄ D = mapDomain (a ↦ −a)(D ⋄ D′)`) and `diamond_map` (for a group homomorphism `φ : A →+ B`, an isogeny or a Galois automorphism, `φ_*(D ⋄ D′) = φ_*D ⋄ φ_*D′`).

**Checks.**

- In `ℤ[ℤ/5ℤ]`: `[1] ⋄ [3] = [2]` and `([1] + [2]) ⋄ [0] = [4] + [3]`.
- `0 ⋄ D′ = 0`, and if `deg D = 0` then `deg(D ⋄ D′) = 0` (degenerate case).
- Non-example: for `D = [1]`, `D′ = [3]` in `ℤ[ℤ/5ℤ]`, the opposite convention gives `[1 − 3] = [3]`, while `−(D ⋄ D′) = −[2]`.
- `(D ⋄ D′)(c) = Σ_{b − a = c} D(a)·D′(b)`, the `Finsupp` convolution of the reflected divisor with `D′`.
- For `F : A → ℂ` odd, extended `ℤ`-linearly, `F(D′ ⋄ D) = −F(D ⋄ D′)`.

### 4.2 The divisor formula

Let `R_q = J(q; ·) + iD_q` be the `q`-invariant function of §3.3, extended `ℤ`-linearly to divisors on `E_τ`. For all `f, g ∈ ℂ(E_τ)^×`, with no condition on tame symbols,

```text
r_E({f, g})(dz) = ½ · conj(R_q((f) ⋄ (g))).
```

Equivalently Brunault's function satisfies `R_{dz}(P, Q) = ½ conj(R_q(Q − P))`; in particular `Im r_E({f, g})(dz) = −½ D_q((f) ⋄ (g))` and `Re r_E({f, g})(dz) = ½ J(q; (f) ⋄ (g))`. Symbols with a constant entry have `r_E = 0`, and `{f, g} ↦ R_q((f) ⋄ (g))` is the regulator `K₂(ℂ(E_τ)) → ℂ` of §3.16, so `R_q(ξ) = 2 conj(r_E(ξ)(dz))` on all of `K₂(ℂ(E_τ))`; the Steinberg relation for `R_q` thus follows from Layer 2's, independently of the truncation argument of §§3.11–3.15; §3.16 records the same consequence. The proof: `r_E{f, g}(ω) = Σ_{x,y} ord_x(f) ord_y(g) R_ω(x, y)` (§3.9, Brunault Proposition 17), translation invariance `R_ω(x, y) = R_ω(x − y, 0)` (Proposition 18, (1.34), p. 20), Brunault's evaluation `2R_{dz}(P, 0) = −conj(R_q(P))` (§3.9), and oddness of `R_q`: `r_E = Σ m_i n_j R_{dz}(P_i − Q_j, 0) = ½ Σ m_i n_j conj(R_q(Q_j − P_i))` (Brunault, thesis, §1.1, Proposition 17, (1.28)–(1.29), p. 19; §1.2, Propositions 24 and 26, pp. 25–26). For `ω = c·dz` the left side is multiplied by `c`. Under a change of oriented basis `τ′ = (ατ + β)/(γτ + δ)`, `z′ = z/(γτ + δ)`, both sides are multiplied by `(γτ + δ)^{−1}` (§3.7). Vanishing tame symbols are needed only to identify `r_E` with the period pairing of §2.5, never for this formula.

The formula is stated in the representative Lean file as `torusRegulator_eq_half_conj_diamond`, in the following form, on the torus and on Mathlib carriers only: for doubly periodic meromorphic `f`, `g` on `ℂ` whose orders `meromorphicOrderAt f z` are the multiplicities of finitely many points `P_i` modulo `ℤ + ℤτ`, and likewise for `g` with points `Q_j`, `torusRegulator τ f g = ½ conj(Σ_{i,j} m_i n_j · R_τ(Q_j − P_i))`, where `R_τ(a + bτ) = −i(y²/π) Σ_v K_τ(a, b; v)` is the Kronecker form of `R_q` from §3.6 and the coordinates are `torusCoord τ (Q_j − P_i)`; the divisor hypothesis is `HasTorusDivisor`.

**Checks.**

- At `τ = 0.3 + 1.2i`, with `(f) = [0.11 + 0.07i] + [0.37 + 0.52τ] − [0.63 + 0.21τ] − [P₄]`, `(g) = [0.21 + 0.81τ] + [0.77 + 0.33τ] − [0.45 + 0.09τ] − [Q₄]`, `P₄` and `Q₄` fixed by the sum-zero condition and `f`, `g` theta quotients: the integral `−i∫∫ log|f| · conj(g′/g) dx dy` over the fundamental parallelogram is `−1.22280 + 1.33589i` (800 × 800 midpoint grid) and `½ conj(R_q((f) ⋄ (g))) = −1.2228051 + 1.3358976i`.
- Non-example: without the conjugation one gets `−1.2228 − 1.3359i`.
- `Im r_E({f, g})(dz) = −½ D_q((f) ⋄ (g))`.
- `r_E` vanishes on every symbol with a constant entry, matching `(c) = 0` (degenerate case).

### 4.3 Bloch's lift formula

Let `R^{Bl}_q = J^{Bl}_q + iD_q` on `ℂˣ`, with Bloch's unregularised `J^{Bl}_q = J_q` of §3.3. Let `F = Σ d_j(α_j)` and `G = Σ e_k(β_k)` be permitted lifts of `(f)` and `(g)`. Then `Σ_{j,k} d_j e_k R^{Bl}_q(α_j^{−1}β_k) = R_q((f) ⋄ (g))`: the Bernoulli terms contribute `(1/3) log²|q| Σ d_j e_k B₃(u_k − v_j) = 0`, where `u_k = log|β_k|/log|q|` and `v_j = log|α_j|/log|q|`, because `Σ d_j = Σ e_k = 0` and `Σ d_j v_j = Σ e_k u_k = 0`. Consequently the lift formula does not depend on the permitted lift. For `R^{Bl}_q` the product-one condition cannot be dropped; for the `q`-invariant `R_q` no lift is needed; the degree-zero condition is automatic for lifts of divisors of functions. `B₃` is used without reduction modulo one, so that `J_q(x) + (1/3) log²|q| B₃(log|x|/log|q|)` is `q`-invariant on `ℂˣ`.

**Checks.**

- At `τ = 0.1 + 1.1i`, `C = 4`, lift the points of `(ρ)` and `(f_{1/4})` (§4.5) to the canonical representatives `e^{2πi(k+ℓτ)/4}`, `0 ≤ k, ℓ < 4`, except one copy of the origin in `(ρ)`, lifted to `q⁶` so that the product is one: this permitted lift gives `Σ d_j e_k R^{Bl}_q = −0.519724 + 59.438583i = 64·R_q(e^{2πi/4})`.
- Non-example: replacing one point `x` of the lift of `(f_{1/4})` by `qx` (product one violated) gives `−1553.008 + 59.438583i` with `J^{Bl}_q`, and still `−0.519724 + 59.438583i` with `R_q`.
- The imaginary part `D_q` never depends on the lift.

### 4.4 The finite Fourier transform of the `C`-torsion

For `C ≥ 1` and `f : ℤ/C × ℤ/C → ℂ` define

```text
torsionFourier C f (k, ℓ) = f̂(k, ℓ) = C^{−2} Σ_{a,b=0}^{C−1} f(a, b) e^{2πi(−ak + bℓ)/C}
```

It is normalised by `1/C²`, not by `1/C`: this is the normalisation in which Bloch's identity §4.17 carries the factor `C³`, and the unitary `1/C` normalisation is that of the transform on `O/CO` (§5.2). Define `torsionFourierCharacter C (k, ℓ)`, the bundled `AddChar` on `(ℤ/C)²` given by `ZMod.stdAddChar (a·k − b·ℓ)`, and `torsionFourierDuality`, the resulting equivalence `(ℤ/C)² ≃ AddChar ((ℤ/C)²) ℂ`. Then `f̂(k, ℓ)` is the averaged coefficient of `f` against `conj χ_{(k,ℓ)}`; this is the specialisation of AdditiveCombinatorics AC.0's normalised character interface, whose inversion and Parseval are imported, not rebuilt. Provide `torsionFourier_inversion` (`f(a, b) = Σ_{k,ℓ} f̂(k, ℓ) e^{2πi(ak − bℓ)/C}`), `torsionFourier_odd` (`f` odd if and only if `f̂` odd), `torsionFourier_single` (simp: the transform of `δ_{(a,b)}` is `(k, ℓ) ↦ C^{−2} e^{2πi(−ak + bℓ)/C}`), `torsionFourierCharacter_apply` (`χ_{(k,ℓ)}(a, b) = exp(2πi(ak − bℓ)/C)` on residue representatives), `torsionFourier_eq_complexBasis_repr` (agreement with `(AddChar.complexBasis ((ℤ/C)²)).repr f χ_{(k,ℓ)}`), `torsionFourier_eq_dft` (`f̂(k, ℓ) = C^{−2} · ZMod.dft (a ↦ ZMod.dft (b ↦ f(a, b)) (−ℓ)) k`), `torsionFourier_parseval` (`Σ |f̂|² = C^{−2} Σ |f|²`) and `torsionFourier_eq_fourierO` (if `f(m, n) = F(n + mτ)` then `f̂(k, ℓ) = C^{−1}·F̂(k + ℓτ)` for the transform on `O/CO` of §5.2, swapping only the input coordinates).

**Checks.**

- `C = 3`, `f = δ_{(1,0)}`: `f̂(1, 0) = exp(−2πi/3)/9`, fixing both the sign and averaging factor.
- `C = 3`, `f = δ_{(1,0)} − δ_{(2,0)}`: `f̂(1, ℓ) = −i√3/9` and `f̂(0, ℓ) = 0` for every `ℓ`.
- The transform of `0` is `0`; for `C = 1`, `f̂(0, 0) = f(0, 0)` (degenerate case).
- Inversion recovers `f` for every `f`; `torsionFourier C χ_{(k,ℓ)}` is the point mass at `(k, ℓ)`.
- `C = 3`, `f = δ_{(0,0)}`: `Σ |f̂|² = 1/9`; a unitary `1/C` factor gives `1` and fails.
- Non-example: with the normalisation `1/C`, the right side of §4.17 must be multiplied by `C` (`iy²C⁴/π` instead of `iy²C³/π`).

### 4.5 The regulator of Bloch's classes

Let `C ≥ 1` and, for `a ∈ E_τ[C] − {0}`, let `S_a ∈ K₂(ℂ(E_τ)) ⊗ ℤ[1/C]` be Bloch's class of EllipticKTheory §§7.1–7.9, base-changed to `ℂ`: `S_a = (1/C)(C{ρ, f_a} + Σ_i {f_i, c_i})` with `(ρ) = (C² − 1)[0] − Σ_{b∈E[C]−0}[b]` (EllipticKTheory §§7.1–7.9), `(f_a) = C[a] − C[0]` and constants `c_i`. Then

```text
R_q(S_a) = R_q((ρ) ⋄ (f_a)) = C³ · R_q(a),     equivalently   r_E(S_a)(dz) = ½ C³ conj(R_q(a)).
```

The constant-symbol corrections contribute zero (§4.2); `(ρ) ⋄ (f_a) = C(C² − 1)([a] − [0]) − C Σ_{b≠0}([a − b] − [−b])` (§4.1); and `Σ_{b∈E[C]} R_q(a − b) = Σ_b R_q(b) = 0`, `Σ_{b≠0} R_q(−b) = 0` by oddness with `R_q(0) = 0`, so `R_q((ρ) ⋄ (f_a)) = C(C² − 1)R_q(a) + C·R_q(a)`. This is Bloch's evaluation of the regulator of his classes (Lemma 10.2.2, p. 77, as cited by Brunault, thesis, p. 23). In canonical coordinates `a = (k + ℓτ)/C`, `0 ≤ k, ℓ < C`, it reads `R_q(S_a) = C³(R^{Bl}_q(e^{2πi(k+ℓτ)/C}) + 4π²y²(ℓ³/3C³ − ℓ²/2C² + ℓ/6C))`, the bracketed Bernoulli term being exactly the difference between `R_q` and the unregularised function at the canonical lift (§3.3); computing through permitted lifts instead (§4.3) gives the same value. The points of `E[C]` must be rational over the field of definition of the class (automatic over `ℂ`), and `S_a` is defined modulo torsion and symbols with both entries constant, which the regulator kills.

**Checks.**

- At `τ = 0.1 + 1.1i`, `C = 4`, for `(k, ℓ) = (1, 0), (0, 1), (1, 1), (3, 2), (1, 3)`, the lift computation with Bloch's `J_q` and `64·R_q(e^{2πi(k+ℓτ)/4})` agree to 15 digits (for instance `−0.519724250391782 + 59.4385831263844i` at `(1, 0)`).
- The constant-symbol corrections contribute zero.
- `R_q(S_a) = C³R_q(a)` for every nonzero `a ∈ E_τ[C]`; for `C = 1` there is no such `a` (degenerate case).

### 4.6 Convergence for the direct torsion calculation

Fix `C ≥ 1`, `T_C = (ℤ/C)²` with canonical representatives `0 ≤ k, ℓ < C`, `x_u = exp(2πi(k + ℓτ)/C)` for `u = (k, ℓ)`, and `f : T_C → ℂ` extended periodically to `ℤ²`, with no reality assumption. Put `W(z) = log|z| log(1 − z)` with the principal logarithm and `W(1) = 0`. Prove that the forward and backward orbit series `Σ_{n≥0} W(x_u qⁿ)` and `Σ_{n≥1} W(x_u^{−1} qⁿ)` are absolutely summable, that the double logarithmic power series `Σ_{n≥0, j≥1} log|x_u qⁿ| (x_u qⁿ)^j/j` and its backward analogue are absolutely summable (with zero forward summands when `n = ℓ = 0`), and likewise the `Li₂` orbit series and the double series `Σ (x_u qⁿ)^j/j²`; and that for bounded periodic `f` each of `Σ_{m≠0,n} f(m, n)/(m(mτ + n)²)`, `Σ_{m≠0,n} f(m, n) Im(1/(m²(mτ + n)))`, `Σ'_{m,n} f(m, n)/((mτ + n)²(mτ̄ + n))` and `Σ_{n≠0} f(0, n)/n³` is absolutely summable (`Im` taken before multiplication by `f`). The unit-circle boundary is the forward term `n = ℓ = 0`, where `W` vanishes because `log|x_u| = 0`. Row bounds use shells `j ≤ |n + m Re τ| < j + 1` and `Σ_n |mτ + n|^{−2} ≤ K_y/|m|`, uniformly in `m Re τ`; the unprojected reciprocal series is not absolutely summable and is not claimed to be. The cubic kernel uses Mathlib's `EisensteinSeries.summable_one_div_norm_rpow` at `k = 3`. These estimates justify the rearrangements of §§4.9–4.14.

### 4.7 Bloch's logarithmic term `L`

Define `blochLogTerm C τ f = L = Σ_{u∈T_C} f̂(u) A_τ(x_u)` with `A_τ(x) = Σ_{n≥0} W(xqⁿ) − Σ_{n≥1} W(x^{−1}qⁿ)`, the weighted specialisation of the logarithmic part of the raw regulator (the real factor `log|z|` multiplies the full complex logarithm, argument term included). Provide `blochLogTerm_apply`, `blochLogTerm_zero` (simp), `blochLogTerm_add`, `blochLogTerm_smul` (complex linearity is in `f`, not in `x`), `blochLogTerm_character` (`L(C, τ, χ_u) = A_τ(x_u)` by character orthogonality) and `blochLogTerm_boundary` (`W(z) = 0` for `|z| = 1`, including `z = 1`, as an equality of weighted summands). The raw part depends on its lift and is not asserted `q`-invariant.

**Checks.**

- `L(1, τ, f) = 0` for every `f`, since `A_τ(1) = 0` by tail cancellation (degenerate case).
- `C = 3`, `u = (0, 1)`: `L(3, τ, χ_u) = A_τ(exp(2πiτ/3))`, with no factor `3` or `9`.
- `W(i) = W(1) = 0` although `log(1 − i) ≠ 0`.
- `L(C, τ, i·f) = i·L(C, τ, f)`.
- Non-example: `Im W(i/2) = log 2 · arctan(1/2) > 0`; replacing `Complex.log(1 − z)` by `log|1 − z|` loses the argument contribution.

### 4.8 Bloch's dilogarithmic term `M`

Define `blochDilogTerm C τ f = M = i Σ_{u∈T_C} f̂(u) V_τ(x_u)` with `V_τ(x) = Σ_{n≥0} Im Li₂(xqⁿ) − Σ_{n≥1} Im Li₂(x^{−1}qⁿ)`, `Li₂` the principal dilogarithm of PolylogarithmFunctions Layers 1, 4–5, equal to `Σ_{j≥1} z^j/j²` on `|z| ≤ 1`; `Im` is applied to each `Li₂` value before the complex Fourier coefficient. Then `A_τ(x) + iV_τ(x) = R^{Bl}_q(x)`; the term `log|z| arg(1 − z)` of `D` lies in `A`, so `V` alone is not `D_q`. Provide `blochDilogTerm_apply`, `blochDilogTerm_zero` (simp), `blochDilogTerm_add`, `blochDilogTerm_smul` and `blochDilogTerm_character` (`M(C, τ, χ_u) = i V_τ(x_u)`).

**Checks.**

- `M(1, τ, f) = 0` for every `f`, since `V_τ(1) = 0` (degenerate case).
- `M(3, τ, χ_{(0,1)}) = i V_τ(exp(2πiτ/3))`, which catches the Fourier sign and the `C^{−2}` factor.
- Non-example: `M(C, τ, i·f) = i·M(C, τ, f)`; moving `Im` outside a complex-weighted sum fails this.
- `C = 4`, `τ = i`, `χ_{(1,0)}`: `M = i Im Li₂(i) + 2i Σ_{n≥1} Im Li₂(i e^{−2πn})`; the nonzero unit-circle value is retained.

### 4.9 Splitting the dilogarithmic orbit sum

For odd `f` (so `f(0) = 0` and `f̂` is odd), prove `blochDilogTerm_split`: `M = M₁ + M₂` with `M₁ = 2i Σ_u f̂(u) Im Σ_{n≥0} Li₂(x_u qⁿ)` and `M₂ = −i Σ_k f̂(k, 0) Im Li₂(exp(2πik/C))`, both absolutely convergent. Change `u` to `−u` in the backward sum: for `ℓ > 0` the canonical negative lift is `q/x_u`, so `n ≥ 1` becomes `n − 1 ≥ 0`; for `ℓ = 0` it is `1/x_u` and the backward series is the forward one without its `n = 0` term. The `ℓ = 0` endpoint therefore occurs once, with coefficient `−i`, not `−2i`.

### 4.10 The Bernoulli horizontal term

Let `b_τ(u) = 4π²y²(t³/3 − t²/2 + t/6)` with `t = ℓ/C`. For odd `f`, `B = Σ_u f̂(u) b_τ(u) = (iy²/π) Σ_{n≠0} f(0, n)/n³`. Pair `±n` in Mathlib's `hasSum_one_div_nat_pow_mul_sin` to get `Σ_{n≠0} exp(2πint)/n³ = (4π³i/3) B₃(t)` on `[0, 1]`, exchange with the finite sum, and use inversion `Σ_u f̂(u) exp(2πinℓ/C) = f(0, −n)` and oddness. This is the unscaled correction for `R_q`, before multiplying by `C³`.

**Checks.** For `C = 3` and `f = δ_{(0,1)} − δ_{(0,2)}`, `B = 8π²i y²/(81√3)`; for `f` supported off the row `a = 0` the correction vanishes.

### 4.11 Evaluation of `L`

For odd `f`: `L = −(y/(2π)) Σ_{m≠0, n∈ℤ} f(m, n)/(m(mτ + n)²)`, all indices signed and the row `m = 0` absent. Combine the forward and backward logarithmic sums by oddness of `f̂` (the `ℓ = 0` endpoint has multiplier `0`); expand the principal logarithm on the open-disc terms (Mathlib's `Complex.hasSum_taylorSeries_neg_log`); orthogonality imposes `j ≡ a (mod C)`; the weighted geometric series (`hasSum_coe_mul_geometric_of_norm_lt_one`) gives `−1/(4 sin²(πz))`, and the cotangent derivative identity `π²/sin²(πz) = Σ_n (z + n)^{−2}` (`iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow` at `k = 1`) with `z = (jτ + b)/C` finishes; pairing `(m, n)` with `(−m, −n)` gives the factor `½`.

### 4.12 The forward dilogarithmic sum

For odd `f` put `H = (1/C) Σ_{m≥1} Σ_{b mod C} f(m, b)/m²`. Then `M₁ = H − (1/(2π)) Σ_{m≠0, n} f(m, n) Im(1/(m²(mτ + n)))`. Expand `Li₂` on the closed disc; for complex `f`, pair `(a, b)` with `(−a, −b)` to cancel the cosine phase (rather than moving complex scalars through `Im`); sum over `k` to impose `m ≡ a (mod C)` and sum the geometric series with `z = (mτ + b)/C`; use `1/(1 − exp(2πiz)) = (1 + i cot πz)/2` (`Complex.cot_pi_eq_exp_ratio`): the constant `½` gives `H` and the cotangent part is summed by `cot_series_rep`, its imaginary projection being absolutely summable since `Im 1/(mτ + n) = −my/|mτ + n|²`.

### 4.13 The unit-circle boundary

For odd `f`, `M₂ = −i Σ_k f̂(k, 0) Im Li₂(exp(2πik/C)) = −H`, cancelling the `H` of §4.12. Use the absolutely convergent `Li₂` series on the unit circle (including the value `1`), cancel the cosine part by pairing, and apply orthogonality in `k`: the condition `m ≡ a (mod C)` leaves a factor `C` against the transform's `C^{−2}`. Keeping this endpoint prevents a spurious constant in §4.14.

**Checks** (for §§4.11–4.13).

- For `C = 3`, `f = δ_{(1,0)} − δ_{(2,0)}`: `H = (1/3) Σ_{r≥0} ((3r + 1)^{−2} − (3r + 2)^{−2}) > 0`, so `M₂ = −H ≠ 0`.
- For `f = δ_{(0,1)} − δ_{(0,2)}` every residue row sum vanishes and `H = M₂ = 0`.
- The complex multiple `(1 + 2i)` of the first input scales `H` and `M₂` by `1 + 2i`.
- `C = 1` or `C = 2` forces an odd input to vanish, and both sides of each evaluation are `0` (degenerate case).

### 4.14 Evaluation of `M`

For odd `f`: `M = −(1/(2π)) Σ_{m≠0, n∈ℤ} f(m, n) Im(1/(m²(mτ + n)))`, the real value of `Im` cast into `ℂ` before multiplying by `f`. Substitute §4.12 and §4.13 into §4.9 and cancel `H`.

### 4.15 The raw Fourier identity

For odd `f`: `Σ_{u∈T_C} f̂(u) R^{Bl}_q(x_u) = L + M = (iy²/π) Σ_{m≠0, n} f(m, n)/((mτ + n)²(mτ̄ + n))`, the identity for canonical lifts and the raw function, with the whole row `m = 0` omitted. For `m ≠ 0` and `w = mτ + n`, `1/(m w²) + y^{−1} Im(1/(m² w)) = −2iy/(w² w̄)`, using `w − w̄ = 2imy`. This proof uses neither §3.6 nor the Green function, the divisor formula or the class regulator; the conjugated factor of the denominator is forced by `w − w̄ = 2imy`.

### 4.16 The regularised torsion Fourier identity

For odd `f`:

```text
Σ_{u∈T_C} f̂(u) R_q(x_u) = L + M + B = (iy²/π) Σ'_{m,n} f(m, n)/((mτ + n)²(mτ̄ + n)),
```

where `R_q = R^{Bl}_q + b_τ` on canonical torsion lifts (§3.3) and `Σ'` omits only `(0, 0)`: add §4.10 to §4.15, the cubic kernel being exactly `n^{−3}` on the row `m = 0`. This is the analytic statement at torsion points, with prefactor `iy²/π`, stated in the Lean file as `sum_torsionFourier_mul_ellipticR`; it is consistent with, and independent of, the Kronecker expansion §3.6, of which it is the specialisation to `C`-torsion.

**Checks** (for §§4.14–4.16).

- The full series includes the horizontal terms `n ≠ 0`; erasing them loses the Bernoulli correction (non-example).
- Under `f = i·g` with `g` odd every side scales by `i`; taking `Im` after weighting fails.
- Zero input gives zero on both sides (degenerate case).
- At `τ = 0.37 + 0.83i`, `C = 3`, `f = (δ_{(1,1)} − δ_{(2,2)}) + i(δ_{(1,0)} − δ_{(2,0)}) + (δ_{(0,1)} − δ_{(0,2)})`: the orbit sums give `L = −0.3738060785 + 0.1653502819i`, `M = 0.1579904388 + 0.3414240824i` and `B = 0.3877039903i`, each equal to its closed form (§§4.10, 4.11, 4.14) within `10^{−12}`, and `L + M + B = −0.2158156397 + 0.8944783547i` equals `(iy²/π) Σ' f(m, n)/((mτ + n)²(mτ̄ + n))` within `10^{−12}`.

### 4.17 Bloch's finite Fourier identity

Let `C ≥ 1` and `f : ℤ/C × ℤ/C → ℂ` odd. Then

```text
Σ_{k,ℓ=0}^{C−1} f̂(k, ℓ) · R_q(S_{(k+ℓτ)/C}) = (iy²C³/π) Σ_{(m,n)≠(0,0)} f(m, n)/((mτ + n)²(mτ̄ + n)),
```

with `f̂ = torsionFourier C f`, `R_q(S₀) := 0` and `f(m, n) := f(m mod C, n mod C)` (Bloch, Theorem 10.2.1, p. 77, as cited and used by Brunault, thesis, p. 23). By §4.5 this is equivalent to `Σ f̂(k, ℓ) R_q(e^{2πi(k+ℓτ)/C}) = (iy²/π) Σ' f(m, n)/((mτ + n)²(mτ̄ + n))`, which is §4.16. It also follows from §3.6: at the torsion points, `R_q(e^{2πi(k+ℓτ)/C}) = (y²/π) Σ'_{(m,n)} sin(2π(ℓm − kn)/C)/((m + nτ)²(m + nτ̄))`, the finite sum passes inside the absolutely convergent series, inversion and oddness give `Σ_{k,ℓ} f̂(k, ℓ) sin(2π(ℓm − kn)/C) = i·f(n, m)`, and relabelling `(m, n) ↦ (n, m)` and multiplying by `C³` concludes.

**Checks.**

- With `f(m, n) = χ(n + mτ)` for the CM characters of §5.1, the right side is `(iy²C³/π)·|μ_κ|·L(2, χ^{Gross})`, and left over right equals `1.0000000000` for `τ = i, C = 4`; `τ = (1 + √−3)/2, C = 6`; `τ = (1 + √−7)/2, C = 7` and `C = 14` (PARI values of `L`).
- For `C = 1` or `2` an odd `f` vanishes and both sides are `0` (degenerate case).
- Non-example: with the transform normalised by `1/C` the prefactor would be `iy²C⁴/π`.

### 4.18 Extension by transfer and the trace formula

Let `k` be a number field, `L/k` finite, `σ : k ↪ ℂ`, `E/k` an elliptic curve, and for `β ∈ K₂(L(E))` let `Nβ ∈ K₂(k(E))` be the transfer along `L(E)/k(E)` (EllipticKTheory §§7.1–7.9). For `τ : L ↪ ℂ` let `reg_τ(β)` be the regulator (Layer 2's `r_E`, or `R_q`) of the image of `β` in `K₂(ℂ(E^σ))` under the embedding induced by `τ`. Prove the trace formula

```text
reg_σ(Nβ) = Σ_{τ : τ|_k = σ} reg_τ(β).
```

Its inputs are the base-change formula for the Milnor transfer, `res_{ℂ(E)/k(E)} ∘ N_{L(E)/k(E)} = Σ_τ res_τ` (K2SymbolsBrauer §§10.24–10.27, 11.6–11.7: with `L = k(a)`, the minimal polynomial of `a` over `k(E)` is its minimal polynomial over `k`, which splits over `ℂ` into distinct linear factors `Π_τ(t − τ(a))`), and additivity of the regulator. `E` is geometrically integral over `k`, so `L(E) = L ⊗_k k(E)` is a field. The formula is an identity of regulators after base change, not of classes. It is required before any computation over `L` is used for a class over `k`; The descent of the CM class in Layer 5 uses it. Brunault's projection formula for finite morphisms of Riemann surfaces is a different statement and belongs to Layer 7. In Layer 5, for the Galois-invariant class `U` over `L = κ(E[C])` with `res(U₀) = U` and `U₀ = N(U)/[L : ℚ]`, the formula gives `reg(U₀) = reg(U)` at the chosen embedding.

### Examples

- The `τ = 0.3 + 1.2i` theta-quotient pair of §4.2 and the `τ = 0.1 + 1.1i`, `C = 4` classes of §4.5.
- The finite transform at `C = 3` (§4.4) and the four CM instances of §4.17.

### Dependencies

Layers 2–3 (the regulator integral, `R_q`, the Green function, Brunault's evaluation, the Kronecker expansion). EllipticKTheory §§7.1–7.9 (Bloch's classes and their transfer). K2SymbolsBrauer §§10.24–10.27, 11.6–11.7 (base change of the transfer). AdditiveCombinatorics AC.0 (normalised finite Fourier transform, inversion, Parseval). PolylogarithmFunctions Layers 1, 4–5 (`Li₂` on the closed disc). Mathlib: `AddMonoidAlgebra`, `MonoidAlgebra.mapDomain`, `single_mul_single`, `ZMod.stdAddChar`, `ZMod.dft`, `AddChar.complexBasis`, `AddChar.sum_apply_eq_ite`, `hasSum_one_div_nat_pow_mul_sin`, `Complex.hasSum_taylorSeries_neg_log`, `hasSum_coe_mul_geometric_of_norm_lt_one`, `iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow`, `Complex.cot_pi_eq_exp_ratio`, `cot_series_rep`, `EisensteinSeries.summable_one_div_norm_rpow`, `Real.summable_one_div_int_pow`, `meromorphicOrderAt`.

## Layer 5: Bloch's CM example

This layer targets Bloch's theorem for every elliptic curve over `ℚ` with complex multiplication by a maximal order. The displayed construction gives `L(E, 2)` as an explicit nonzero multiple of the regulator of a rational class under the standing real-structure compatibility below. Extending this construction to every rational twist requires `cmRealStructureTransport` in §5.1, which is not supplied by the finite Fourier calculation. The scalar is fixed exactly and pinned by the Gaussian, Eisenstein and `√−7` examples: no factor `|μ_κ|` occurs, the sign is the one of the Fourier kernel of §5.2, and the index set is the set `W` of residues invertible modulo the conductor, which is larger than the units modulo `C` when the auxiliary level has a prime not dividing the conductor (§5.18). The theorem is Bloch's (recalled in Brunault, thesis, §0.5, p. 11; Goncharov–Levin, arXiv:alg-geom/9508008v4, §1.2, pp. 2–3; Dokchitser–de Jeu–Zagier, §1, p. 1); the proof here uses Layers 3–4 and the finite Fourier analysis of this layer, and each of its finite identities is computed in the examples. The Grössencharakter, Deuring's comparison and the Galois action on torsion are ComplexMultiplicationAndExplicitReciprocity's (ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2, ComplexMultiplicationAndExplicitReciprocity §2.2, ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2); the classes `S_a` and their rational descent are EllipticKTheory §§7.1–7.9's.

Standing data for §§5.6–5.18: `E/ℚ` has CM by the maximal order `O = O_κ = ℤ + ℤτ` of an imaginary quadratic field `κ` of class number one, `y = Im τ > 0` for the chosen embedding, `μ = O^×`; `χ : (O/fO)^× → μ` is primitive of conductor `f`, restricts to the chosen embedding on `μ`, satisfies `χ(x̄) = χ̄(x)`, and `(f̄) = (f)` as ideals (not `f̄ = f` as elements: `f = 2 + 2i` is a counterexample to the stronger equation); `C = fg ≥ 1` is a rational integer with `f, g ∈ O − 0`; on `O/CO`, `χ` means the pull-back from `O/fO` on residues invertible modulo `f`, extended by zero, and `W` is exactly that nonzero locus; `R_C(x) = R_q(S_{x/C})` always uses classes built at the same level `C`. For rational descent and the purely imaginary regulator, the chosen CM uniformisation must intertwine complex conjugation with `z ↦ z̄` on `ℂ/O` ; this is an additional hypothesis on the displayed construction, not a consequence of maximal-order CM and a shared `j`-invariant. The general CM endpoint retains all rational twists and requires the separate transport target below.

### 5.1 The CM curve and its Hecke character

Let `E/ℚ` have CM by the full ring of integers `O = ℤ + ℤτ` of an imaginary quadratic field `κ`; then `κ` has class number one, `j(E) ∈ ℚ`, and `κ = ℚ(√−d)` with `d ∈ {1, 2, 3, 7, 11, 19, 43, 67, 163}`. Fix `κ ↪ ℂ` with `E(ℂ) ≅ ℂ/ΩO`. The theory of complex multiplication (ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2) attaches to `E` its Grössencharakter, written as `χ^{Gross}((h)) = h̄·χ(h)` for `(h)` prime to `f`, with `χ` as in the standing data (ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2). Provide `cmHeckeCharacter` (imported from ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2 in this form), `cmHeckeCharacter_conductor` (`f` with `(f̄) = (f)`), `cmFiniteCharacter_conj` (`χ(x̄) = χ̄(x)`), `cm_maximal_order` (the hypothesis `End(E) = O_κ` and the resulting list of nine fields), `deuringComparison` (for `Re s > 3/2`, Mathlib's `WeierstrassCurve.LSeries W s` of a Weierstrass model `W` of `E` equals the Hecke series `L(s, χ^{Gross}) = Σ_{𝔞 prime to f} χ^{Gross}(𝔞) N𝔞^{−s}` over ideals, with equality of every Euler factor) and `deuringComparison_badPrimes` (all bad primes of `E` are additive, lie exactly below `f`, and both Euler factors there are `1`; Mathlib's `localPolynomial` is `1` at additive primes). At a split good prime `p = 𝔭𝔭̄`, `a_p(E) = χ^{Gross}(𝔭) + χ^{Gross}(𝔭̄)`; at an inert good prime `a_p(E) = 0` and `χ^{Gross}(pO) = −p`, so both Euler factors are `(1 + p^{1−2s})^{−1}`. The conductor is `N_E = |d_κ|·N(f)`. Only `s = 2`, in the half-plane of absolute convergence, is used, so neither modularity nor analytic continuation is needed. The comparison does not follow from `E(ℂ)` having extra endomorphisms: the twists of `E` share the torus `ℂ/ΩO` and have different Grössencharaktere. The four non-maximal CM orders with rational `j` (discriminants `−12, −16, −27, −28`) are outside this layer (scope of Brunault, thesis, §0.5, p. 11).

**Checks.**

- `y² = x³ − x` (32a2), `κ = ℚ(i)`, `τ = i`, `f = 2 + 2i`, `χ(h)` the unit congruent to `h` modulo `2 + 2i`: `a₅ = −2` (primary generator `−1 + 2i`) and `a₁₃ = 6`; `L(E, 2) = 0.917050635318654988643805524…`.
- At `p = 2` for `y² = x³ − x`, `localPolynomial` is `1` (additive reduction) and the Hecke factor at `(1 + i)` is `1`, since `(1 + i) | f`.
- `y² = x³ + 1` (36a1; `κ = ℚ(√−3)`, `f = 2√−3`): `L(E, 2) = 0.940013007388225781496…`; `49a1` (`κ = ℚ(√−7)`, `f = √−7`, `χ` the quadratic character modulo `√−7`): `L(E, 2) = 1.138814388703848117450…`.
- Non-example: `y² = x³ − x` and `y² = x³ + x` have the same `j = 1728` and the same endomorphism ring `ℤ[i]`, but conductors `32` and `64` and `L`-values `0.917050635…` and `1.023147652…` at `s = 2`.
- The discriminants of maximal CM orders of elliptic curves over `ℚ` are exactly `−3, −4, −7, −8, −11, −19, −43, −67, −163`.

**Real structures and the general CM target.** Define `CMRealStructure` for a chosen CM uniformisation `E(ℂ) ≅ ℂ/ΩO` by its actual conjugation action `c_E(z)=u·z̄` on `ℂ/O`, where `u=Ω̄/Ω` preserves the lattice and `uū=1`. The unit `u`, its action on torsion, and change of CM trivialisation belong to the data. Its API is `cmConjugation_apply`, `cmConjugation_sq`, `cmConjugation_torsion` and `cmConjugation_changeTrivialisation`: changing `Ω` to `Ωζ`, `ζ∈O×`, replaces `u` by `ζ⁻¹uζ̄`. The supplied complex uniformisation and CM torsion action do not themselves set `u=1`.

**Checks.**

- For the square torus and `u=1`, the fixed locus consists of the two circles with imaginary coordinate `0` and `1/2` modulo `ℤ[i]`.
- For the square torus and `u=i`, solving `z=i z̄` modulo `ℤ[i]` gives one circle: `Re z−Im z` is integral. The involution still squares to the identity.
- The real curve `y²=x³−x` has two real components, whereas `y²=x³+x` has one: their cubics have respectively three and one real roots. Both have maximal Gaussian CM. Consequently both curves cannot be identified with the square torus equipped with ordinary conjugation. This is a negative control for the claim that a common `j` supplies a common real uniformisation.
- Replacing `Ω` by `iΩ` changes `u` to `−u`; it cannot turn either `i` or `−i` into `1`.

Prove `cmRealStructureTransport` for **every** `E/ℚ` with maximal-order CM: construct the finite-character torsion expression in its actual CM trivialisation, transport Bloch's classes under `c_E`, construct a rational descended class with nonzero regulator, and compute the corresponding real-period scalar in `L(E,2)`. The result must recover §§5.9–5.15 when `u=1`, be invariant under change of CM trivialisation, and cover `y²=x³+x` as well as `y²=x³−x`. Export `blochClassU_twisted_conjugation`, `blochClassU_twisted_descent` and `cmLValue_realPeriod`. **Gap:** the conjugation-invariance argument in §5.9 and the purely imaginary conclusion in §5.14 currently use `u=1`. No proof or verified explicit formula for this transport at arbitrary `u` is given here. Brunault, thesis, §0.5, p.11, and Goncharov–Levin, §1.2, pp.2–3, credit the CM theorem but do not supply this twist-dependent formula. The general theorem remains a target; the compatible-real-structure calculation is not a replacement for it. *Needs:* Layer 1's real periods, complex uniformisation, ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2 and 2.2 for the actual CM action, and EllipticKTheory §§7.6–7.9 for class construction and rational descent.

### 5.2 The pairing on `O/CO` and its Fourier transform

Let `O = ℤ + ℤτ` be an order with `τ² + Aτ + B = 0`, `A, B ∈ ℤ`, and `C ≥ 1`. Define `pairingO`, `⟨a + bτ, k + ℓτ⟩ = e^{2πi(−aℓ + bk)/C}` on `O/CO`; it is bi-additive, `⟨x, y⟩⟨y, x⟩ = 1` (`pairingO_swap`), and `⟨xy, z⟩ = ⟨x, ȳz⟩` (`pairingO_mul_left`, by expanding with `τ² = −Aτ − B`). Define

```text
fourierO C F x = F̂(x) = C^{−1} Σ_{y∈O/CO} F(y)·⟨x, y⟩,   i.e.   F̂(k + ℓτ) = C^{−1} Σ_{a,b} F(a + bτ) e^{2πi(aℓ − bk)/C},
```

with the dual argument first. It is the transform for which the CM Fourier identity of §5.4 holds with a positive sign; the opposite kernel `⟨y, x⟩ = ⟨x, y⟩^{−1}` gives `−F̂` for odd `F`. Provide `fourierO_inversion` (`F(y) = C^{−1} Σ_x F̂(x)⟨x, y⟩^{−1}`), `fourierO_parseval` (`Σ |F̂|² = Σ |F|²`, from AC.0 through §4.4 and the factor `C`) and `fourierO_eq_torsionFourier` (for `f(m, n) = F(n + mτ)`, `torsionFourier C f (k, ℓ) = C^{−1}·F̂(k + ℓτ)`, swapping only the input coordinates; the output coordinates `(k, ℓ)` stay fixed).

**Checks.**

- For `O = ℤ[i]`, `C = 4`: `⟨xy, z⟩ = ⟨x, ȳz⟩` for all `x, y, z ∈ O/4O`.
- `κ = ℚ(i)`, `C = 4`, `χ` the unit congruent modulo `2 + 2i`, extended by `0`: `χ̂` is supported on `{1 + i, 1 + 3i, 3 + i, 3 + 3i}` with `χ̂(1 + i) = 1 + i`; with the opposite kernel one gets `−1 − i`.
- For `f(m, n) = F(n + mτ)`: `fourierO C F (k, ℓ) = C · torsionFourier C f (k, ℓ)` with the same output index.
- Non-example: `C = 3`, `F = δ_{(1,0)}`: `F̂(0, 1) = exp(2πi/3)/3` while `F̂(1, 0) = 1/3`, so swapping the output in the comparison with `torsionFourier` is false.
- Non-example: with the opposite kernel, `Σ_x F̂(x) R_q(S_{x/C}) = −(iy²C⁴/π) Σ' F(w)/(w²w̄)` for the odd characters of `ℚ(i)` (`C = 4`), `ℚ(√−3)` (`C = 6`), `ℚ(√−7)` (`C = 7`).

### 5.3 The two transforms compared

For `C ≥ 1`, `τ ∈ ℍ` and odd `F : O/CO → ℂ`, with `H_F = fourierO C F` and `f₁₀(a, b) = F(b + aτ)`, `H_F(k + ℓτ) = C·f̂₁₀(k, ℓ)` with the same output coordinates; hence §4.16 and §4.5 give `Σ_x H_F(x) R_C(x) = (iy²C⁴/π) Σ_{w∈O−0} F(w)/(w²w̄)`, the analytic transform supplying one factor `C` and the class normalisation `C³`. For odd `F` the opposite kernel gives `−H_F` and the negative of this identity; the associated sine kernel is `sin(2π(bm − an)/C)`, not `sin(2π(an − bm)/C)`. Only `O = ℤ + ℤτ` is used, to identify residue coordinates; no dependence on the L-value theorem enters.

**Checks.** `C = 3`, `F = δ_{(1,0)}`: `H_F(0, 1) = exp(2πi/3)/3` and `H_F(1, 0) = 1/3`. `C = 4`, `τ = i`, primitive `χ`: `H_χ(1 + i) = 1 + i`, and the opposite kernel gives `−1 − i`.

### 5.4 Bloch's identity on `O/CO`

For `O = ℤ + ℤτ`, `C ≥ 1` and odd `F : O/CO → ℂ`:

```text
Σ_{x∈O/CO} F̂(x)·R_q(S_{x/C}) = (iy²C⁴/π) Σ_{0≠w∈O} F(w)/(w²w̄)            (CM Fourier identity)
```

(apply §4.17 to `f(m, n) = F(n + mτ)` with §5.2). Moreover `R_q(S_{−x/C}) = −R_q(S_{x/C})` (oddness of `R_q`, §3.6), and

```text
R_q(S_{(a+bτ)/C}) = (y²C³/π) Σ_{(m,n)≠(0,0)} sin(2π[bm − an]/C)/((m + nτ)²(m + nτ̄))
```

(apply the CM Fourier identity to the odd `F` with `F̂ = δ_x − δ_{−x}`, or pair `v` with `−v` in §3.6; the order `an − bm` in the sine gives the negative).

**Checks.**

- Left over right in the CM Fourier identity is `1.0000000000` for the characters of `ℚ(i)` (`C = 4`), `ℚ(√−3)` (`C = 6`), `ℚ(√−7)` (`C = 7` and `14`), and `−1` with the opposite kernel.
- `τ = 0.1 + 1.1i`, `C = 4`, `(a, b) = (1, 0)`: the lattice sum truncated at `|m|, |n| ≤ 400` gives `−0.51972 + 59.43843i` against `C³R_q = −0.51972 + 59.43858i`; the opposite order in the sine gives `+0.51972 − 59.43843i` (non-example). The same holds at `(0, 1)` and `(3, 2)`.

### 5.5 Units and the CM distribution relation

Let `O = O_κ = ℤ + ℤτ` with `κ` of class number one, and `C ≥ 1`, all classes built at level `C`. (a) For `ζ ∈ μ_κ`, `R_q(S_{ζx/C}) = ζ^{−1}·R_q(S_{x/C})` (from §5.4 and `⟨ζx, y⟩ = ⟨x, ζ̄y⟩`, substituting `w ↦ ζ̄w`). (b) If `C = fg` with `f, g ∈ O`, then `ḡ·Σ_{μ∈O/gO} R_q(S_{x/C + fμ/C}) = R_q(S_{x/f})`, where `S_{x/f}` is the class at the `C`-torsion point `x/f`, built with the same `C` (from `Σ_{μ∈O/gO} ⟨μ, f̄y⟩ = N(g)` if `ḡ | y` and `0` otherwise).

**Checks.** `κ = ℚ(i)`, `τ = i`, `C = 4`: `R_q(S_{i(1+2i)/4})/R_q(S_{(1+2i)/4}) = −i`; for `f = 2 + 2i`, `g = 1 − i` and `x = 1, 1 + 2i, 3` both sides of (b) agree (`−37.3640042692 + 37.3640042692i` for `x = 1`).

### 5.6 The Fourier transform of the CM character

With `χ` of conductor exactly `f`, pulled back to `O/CO`, and `χ̂ = fourierO C χ`: (i) `χ̂(x) = 0` unless `C | f̄x`, that is unless `ḡ | x` (split `y = y′ + fy″` and sum the character `y″ ↦ ⟨xf̄, y″⟩`); (ii) `χ̂(xy) = χ̄(x̄)·χ̂(y)` for `x ∈ (O/CO)^×` (substitute `z ↦ x̄z` and use §5.2); (iii) for any proper ideal divisor `(d)` of `(f)`, meaning `(f) ⊊ (d) ⊆ O`, if `C | d̄x` then `χ̂(x) = 0` (primitivity). Indeed this additive character factors through `O/dO`; its Fourier coefficient vanishes because a primitive `χ` does not descend through that proper conductor quotient. Equality `(d)=(f)` is excluded. Hence `χ̂(w) ≠ 0` only for `w = ḡx` with `x` invertible modulo `f̄`, and then `χ̂(ḡx) = χ̄(x̄)·χ̂(ḡ)`. All three statements are homogeneous in `χ̂`, so they hold for either sign of the kernel.

**Checks.** `κ = ℚ(i)`, `C = 4`: `χ̂` is supported exactly on `(1 + i)·(O/4O)^×` and (ii) holds for all `x, y`. At the proper divisor `d=1`, the zero Fourier coefficient vanishes for the nontrivial primitive character. Taking `d=f` would falsely force all the allowed coefficients to vanish: the Gaussian example has `χ̂(1+i)=1+i`. The trivial character modulo `f` is imprimitive and does not satisfy the support conclusion for a primitive character of conductor `f`.

### 5.7 The CM Gauss coefficient

Define `cmGaussCoefficient C F g = Γ_C(F, g) = g · H_F(ḡ mod C)`, a complex-linear scalar in a finite weight `F`; the CM specialisation is `Γ_C(χ, g)`, the numerator coefficient of Bloch's regulator formula, named separately so that the generator, the Fourier sign and the level are pinned. It constructs no Hecke character. Provide `cmGaussCoefficient_apply` (`Γ_C(F, g) = g·C^{−1} Σ_x F(x)⟨ḡ, x⟩`), `cmGaussCoefficient_congr`, `cmGaussCoefficient_zero` (simp), `cmGaussCoefficient_add`, `cmGaussCoefficient_smul`, `cmGaussCoefficient_changeGenerator` (for `ζ ∈ μ`, replacing `f` by `ζf` and `g` by `ζ^{−1}g` with `C` fixed preserves `Γ_C(χ, ·)`), `cmGaussCoefficient_real` and `cmGaussCoefficient_norm` (for the primitive CM character, `Γ_C(χ, g)` is real and `|Γ_C(χ, g)| = N(g) = C²/N(f) > 0`, §5.8) and `cmGaussCoefficient_oppositeKernel` (for odd `F`, the coefficient formed with `⟨x, ḡ⟩` is `−Γ_C(F, g)`).

**Checks.**

- `τ = i`, `C = 4`, `f = 2 + 2i`, `g = 1 − i`: `H_χ(1 + i) = 1 + i` and `Γ = 2`.
- `τ = (1 + √−3)/2`, `C = 6`, `f = 2√−3`, `g = −√−3`: `H_χ(√−3) = √−3` and `Γ = 3`.
- `τ = (1 + √−7)/2`, `C = 7`, `f = √−7`, `g = −√−7`, `χ(a + bτ) = (a + 4b | 7)` (Legendre symbol): `H_χ(√−7) = √−7` and `Γ = 7`.
- The zero weight gives `Γ = 0`, so the norm formula cannot drop its hypotheses (degenerate case).
- Non-example: the opposite kernel gives `Γ = −2` in the Gaussian case.
- Non-example: at `τ = i`, `C = 4`, the trivial character on units modulo `2 + 2i`, extended by zero, has `H(1 + i) = 0` and `Γ = 0`; it is imprimitive and does not restrict to the embedding on `μ`.
- At `τ = i`, `C = 4`, replacing `f = 2 + 2i` by `if = −2 + 2i` and `g = 1 − i` by `−ig = −1 − i` changes the Fourier input from `(1, 1)` to `(3, 1)` but preserves `Γ = 2`.

### 5.8 Primitive Gauss sums

For the primitive CM character, `H_χ` is supported exactly on `ḡ·(O/f̄O)^×` inside `O/CO`, `|H_χ(ḡ)|² = N(g)`, and `Γ_C(χ, g)` is real with `|Γ_C(χ, g)| = N(g) > 0`; so `Γ = ±N(g)`, the sign being determined by the character and the fixed kernel. The proof: by §5.6 every allowed coefficient is a root of unity times `H_χ(ḡ)` (a unit modulo `f̄` lifts to a unit modulo `C` by the finite quotient interface of the Tau Ceti roadmap GlobalNumberFields, layer 9); reduction `O/CO → O/fO` has `N(g)` elements per fibre, so `Σ_x |χ(x)|² = N(g)φ(f)` while the support has `φ(f̄) = φ(f)` elements, and counting Parseval (§5.2) gives `φ(f)|H_χ(ḡ)|² = N(g)φ(f)`; conjugation reverses the pairing, `χ(x̄) = χ̄(x)` gives `conj H_χ(w) = H_χ(w̄)`, and since `u = g/ḡ = f̄/f` is a unit, `H_χ(g) = u·H_χ(ḡ)`, whence `conj(g H_χ(ḡ)) = g H_χ(ḡ)`. These are consequences of §5.6. The norms are `|1 + i|² = 2`, `3` and `7` in the three examples.

### 5.9 Bloch's class `U`

Fix `C ≥ 1` with `f | C`, `C = fg`, `g ∈ O`, and `L = κ(E[C])` (so `E[C] ⊂ E(L)` and `μ_C ⊂ L`). For `w ∈ O/CO` let `S_{w/C} ∈ K₂T(E_L) ⊗ ℚ` be Bloch's class (EllipticKTheory §§7.1–7.9) at the `C`-torsion point `w/C` of `ℂ/ΩO`, `S₀ := 0`. Define

```text
blochClassU = U = Σ_{x∈W/μ_κ} S_{x·χ̄(x)/C},     W = {x ∈ O/CO : x invertible modulo f},
```

and `cmCharExtend` (`χ` on `O/CO`). The summand depends only on the `μ_κ`-orbit of `x`, since `ζx·χ̄(ζx) = ζζ̄·x·χ̄(x)` (`blochClassU_summand_orbit`). `U` is invariant under the ray-class action `x·(y/C) = x^{−1}χ(x)y/C` by which `Gal(L/κ)` acts on `E[C]` (ComplexMultiplicationAndExplicitReciprocity §2.2) and under complex conjugation, so `U ∈ (K₂T(E_L) ⊗ ℚ)^{Gal(L/ℚ)}` (`blochClassU_galois_invariant`) and descends to `U₀ = N_{L/ℚ}(U)/[L : ℚ] ∈ K₂(E_ℚ) ⊗ ℚ` with `res(U₀) = U` (`blochClassU_descends`, `blochClassU_rational`; EllipticKTheory §§7.1–7.9's rational Galois descent and EllipticKTheory §§3.1–3.7). The units `(O/CO)^×` form the same index set exactly when every prime dividing `g` divides `f`; when they differ, only `W` gives the L-value theorem (§5.18). No integrality is asserted here; for CM curves over `ℚ` it is §6.7.

**Checks.**

- `κ = ℚ(i)`, `C = 4`, `f = 2 + 2i`, `g = 1 − i`: `W/μ₄` has two elements and `x·χ̄(x) ∈ {1, 3 + 2i}` modulo `4`, so `U = S_{1/4} + S_{(3+2i)/4}`, with regulator `64·(R_q(e^{πi/2}) + R_q(e^{2πi(3+2i)/4})) = 37.36400426919091138661…·i` at `q = e^{−2π}`.
- `S₀ = 0`, and the summands at `x` and `ζx` coincide (degenerate case).
- `U` is fixed by `Gal(κ(E[C])/ℚ)` and equals `res(N(U)/[L : ℚ])`.
- `κ = ℚ(√−3)`, `C = 6`: three orbits, index points `1/6`, `(5 + 4τ)/6`, `(3 + 2τ)/6`; `κ = ℚ(√−7)`, `C = 7`: 21 orbits.
- Non-example: `κ = ℚ(√−7)`, `C = 14`, `g = −2√−7`: the sum over `(O/14O)^×/±1` (21 orbits) has regulator twice the required value; the sum over `W/±1` (84 orbits) is right.

### 5.10 Conductor fibres in the weighted regulator sum

Let `A_C = Σ_{w∈O/CO} H_χ(w) R_C(w)`. Then `A_C = Γ_C(χ, g) Σ_{x∈W} χ(x) R_C(x)`, even when `g` has a prime factor not dividing `f`. By §5.6, `A_C = H_χ(ḡ) Σ_{t∈(O/f̄O)^×} χ(t) R_C(ḡt)`; by §5.5(b) for the factorisation `C = f̄ḡ`, `R_C(ḡt) = g Σ_{ν∈O/ḡO} R_C(t + f̄ν)` with classes at the same `C`; these fibres partition the residues invertible modulo `f̄`, which are `W` because `(f̄) = (f)`, and `χ` is constant on each. The step never identifies `W` with the units modulo `C`, which would need every prime of `g` to divide `f`.

**Checks.** At `√−7`, `C = 14`, `|W| = 168` although `|(O/14O)^×| = 42`; at `ℚ(i)`, `C = 4`, `W` is the unit group modulo `C`; the prefactor is `g` (from the factorisation `f̄ḡ`), and substituting `ḡ` fails the Gaussian example.

### 5.11 Root-of-unity orbits

The `μ`-action on `W` is free (if `ζx ≡ x` modulo `C`, invert `x` modulo `f` to get `ζ ≡ 1` modulo `f`, and `χ|_μ` gives `ζ = 1`); `x ↦ xχ̄(x)` identifies `W/μ` with its image in `O/CO`, and `|W/μ| = N(g)φ(f)/|μ|`. For `U` of §5.9, `Σ_{x∈W} χ(x) R_C(x) = |μ|·R_q(U)` by §5.5(a), `R_C(xχ̄(x)) = χ(x)R_C(x)`; hence `A_C = |μ|·Γ_C(χ, g)·R_q(U)`.

**Checks.** `ℚ(i)`, `C = 4`: eight residues, four roots of unity, two index points `(1, 0)`, `(3, 2)`. Eisenstein, `C = 6`: eighteen residues, six roots, index points `(1, 0)`, `(5, 4)`, `(3, 2)`. `√−7`: 21 orbits at `C = 7` and 84 at `C = 14`, with freeness at `14`.

### 5.12 Absolute convergence and non-vanishing at two

For the CM weight `ψ = χ^{Gross}` of ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2, viewed as Tau Ceti's `TauCeti.MultiplicativeIdealWeight κ` with `|ψ(I)| = N(I)^{1/2}` on ideals prime to `f` and `0` otherwise (GlobalNumberFields, layer 10, for the infinity type), the ideal series `Summable (idealTerm κ ψ.toIdealArithmeticFunction s)` holds for `Re s > 3/2` (by `TauCeti.norm_idealTerm` and `TauCeti.summable_absNorm_rpow_ideal_iff` at exponent `Re s − 1/2 > 1`), and `LSeries (normCoeff κ ψ.toIdealArithmeticFunction) s ≠ 0` there (`TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm`, which handles the reciprocal Euler product). With the unramified and ramified local-factor conventions of AutomorphicLFunctionsAndLocalFactors AL.1 (unitary parameter `ψ(P)/N(P)^{1/2}` at argument `s − 1/2`; the coefficient `ψ(P) = 0` at conductor primes is a zero-extension convention) and ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2's comparison of all local factors with the curve's `WeierstrassCurve.LSeries` (additive factors `1`), this gives `L(E/ℚ, 2) = L(2, ψ) ≠ 0`. The exponent at `s = 2` is `3/2`; a theorem for bounded or unitary weights applied directly to `ψ` would have the wrong hypothesis. No continuation, functional equation, injectivity or spanning follows.

### 5.13 Ideal and generator normalisations of the Hecke series

At `s = 2` the absolutely convergent element sum `T_C = Σ_{a∈O−0} χ(a)/(a²ā)` equals `|μ| · LSeries (normCoeff κ ψ.toIdealArithmeticFunction) 2 = |μ|·Σ_{I≠0} ψ(I)/N(I)²`. Indeed `ψ((a)) = āχ(a)` and `N((a)) = aā` identify the summand with `ψ((a))/N((a))²`, unchanged by `a ↦ ζa` because `χ(ζ) = ζ` and `ζ̄ζ = 1`; class number one makes every nonzero ideal principal with exactly `|μ|` generators; and Tau Ceti's `TauCeti.LSeries_normCoeff` regroups. The summand is zero when `a` is not prime to `f`, not merely when `a` is not prime to `C`. Passing from the element sum to the ideal series without dividing by `|μ|` multiplies the final scalar by `|μ|` (non-example of §5.15).

**Checks.** For `ℚ(i)` the ideal `(1)` has four generators, each contributing `1`, and contributes once to the ideal series; the multiplier is `6` for Eisenstein and `2` for `√−7`; at `C = 14` the ideals above `2`, prime to the conductor, are retained (deleting them gives an imprimitive `L`-function).

### 5.14 The normalisation certificate

The weighted sum `A_C` of §5.10 satisfies `A_C = |μ|·Γ_C(χ, g)·R_q(U)` (§§5.10–5.11) and `A_C = (iy²C⁴/π)·|μ|·L(2, ψ)` (§§5.3, 5.13). Cancelling `|μ| > 0` and dividing by `iy²C⁴/π ≠ 0`:

```text
L(2, ψ) = (π · Γ_C(χ, g) / (i · y² · C⁴)) · R_q(U).
```

If `Γ_op` is `g` times the transform with the opposite kernel, then `Γ_op = −Γ_C(χ, g)` and the same theorem reads `L(2, ψ) = −π·Γ_op/(iy²C⁴)·R_q(U)`: the Fourier convention changes neither the `L`-value nor the coefficient once both signs are accounted for, and no factor `|μ|` survives. Conjugation-stability of the index set kills the real part `J`, so for the rational class `R_q(U) = i·C³ Σ_{x∈W/μ} D_q(exp(2πi·xχ̄(x)/C))` and

```text
L(E, 2) = (π · Γ_C(χ, g) / (y² · C)) · Σ_{x∈W/μ} D_q(exp(2πi·xχ̄(x)/C)).
```

The regulator here is Bloch's complex `R_q`; Brunault's functional is `r_E = ½ conj R_q` (§4.2), whereas the universal Deligne regulator, under the wedge identification of §§2.6–2.7, is `r_D = 2r_E = conj R_q` on compact classes. Thus neither scalar can be substituted for the other (Brunault, thesis, Remarque 20, p. 22, Proposition 26 with its proof, pp. 26–27, and Théorème 68, pp. 69–70).

### 5.15 Bloch's CM L-value theorem

In the standing data, with `U` of §5.9, `R_q` Bloch's regulator (§4.2) and `χ̂` the transform of §5.2,

```text
L(2, χ^{Gross}) = (π · χ̂(ḡ) · g / (i · y² · C⁴)) · R_q(U),
```

where `L(s, χ^{Gross}) = Σ_{𝔞⊂O prime to f} χ^{Gross}(𝔞) N𝔞^{−s}` is the Hecke series over ideals, equal to `L(E, s)` by §5.1. In Layer 2's normalisation `r_E(U)(dz) = ½ conj(R_q(U))`, so equivalently `L(2, χ^{Gross}) = (2π·χ̂(ḡ)·g/(iy²C⁴))·conj(r_E(U)(dz))`. The identity is at the chosen embedding with the oriented basis `(1, τ)`; under `τ ↦ (ατ + β)/(γτ + δ)`, `R_q` is multiplied by `(γτ̄ + δ)^{−1}` (§3.7). The proof is §5.14, through §§5.4–5.6. This is Bloch's CM theorem (Brunault, thesis, §0.5, p. 11; Goncharov–Levin, §1.2, pp. 2–3) with the scalar derived in §5.14. Each of three alterations fails: an extra factor `|μ_κ|` and `χ̂` formed with the opposite kernel of §5.2 fail every example below, and the units modulo `C` as index set fails at level 14, where `g` has a prime factor not dividing `f` (§5.18).

**Checks.**

- 32a2 (`y² = x³ − x`): `κ = ℚ(i)`, `τ = i`, `C = 4`, `f = 2 + 2i`, `g = 1 − i`, `χ̂(ḡ) = 1 + i`: `L(E, 2) = (π/2)·[D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4})] = 0.9170506353186549886438055…` with `q = e^{−2π}`, agreeing with PARI to 25 digits; the scalar with an extra factor `|μ_κ|` and the opposite kernel gives `−3.66820254127461995… = −4·L(E, 2)` (non-example).
- 36a1 (`y² = x³ + 1`): `τ = (1 + √−3)/2`, `C = 6`, `f = 2√−3`, `g = −√−3`: `L(E, 2) = (2π/3)·Σ D_q` over the index points `1/6`, `(5 + 4τ)/6`, `(3 + 2τ)/6` `= 0.9400130073882257814963…`; the same two changes give `−6·L(E, 2)`.
- 49a1: `τ = (1 + √−7)/2`, `C = 7`, `f = √−7`, `g = −√−7`: `L(E, 2) = (4π/7)·Σ D_q` over 21 index points `= 1.1388143887038481174506…`; the same two changes give `−2·L(E, 2)`.
- Every period (`y`), level (`f`, `g`, `C`), Gauss sum (`χ̂(ḡ)`) and root-of-unity factor is accounted for; `|μ_κ|` does not occur.

The Gaussian case is stated in the representative Lean file on Mathlib's carriers, as `curve32a2_LSeries_two`: for the Weierstrass curve `y² = x³ − x` over `ℚ`, `WeierstrassCurve.LSeries W 2 = (π/2)·(Im R_i(1/4, 0) + Im R_i(3/4, 1/2))`, where `R_i(a, b)` is the Kronecker form of `R_q` at `τ = i` (§3.6), so that `Im R_i(a, b) = D_q(exp(2πi(a + bi)))`.

### 5.16 Non-vanishing, and what is not claimed

Since `|χ^{Gross}(𝔭)| = N𝔭^{1/2}`, the Euler product of `L(s, χ^{Gross})` over prime ideals converges absolutely for `Re s > 3/2`, so `L(2, χ^{Gross}) ≠ 0` (§5.12); with §5.15 this gives `R_q(U) ≠ 0`, hence `U ≠ 0` in `K₂(E_ℚ) ⊗ ℚ`. That is the whole of what is proved. Not claimed: that `U` spans `K₂(E_ℚ) ⊗ ℚ`, which is a conjecture (the CM case of the rank statement of §6.2) (in the form with all of `K₂(E) ⊗ ℚ` rather than the integral part, the analogue is false for general elliptic curves, by Bloch–Grayson and Dokchitser–de Jeu–Zagier §3; for CM curves over `ℚ` the two groups coincide by §6.7); nor anything for non-maximal CM orders or fields of larger class number. The only K-theoretic input beyond Layers 4–5 is EllipticKTheory §§3.1–3.7 (`K₂` of a number field is torsion, so `K₂(E) ⊗ ℚ ↪ K₂(ℚ(E)) ⊗ ℚ`); Borel's rank theorem is not used and only motivates that conjecture (Brunault, thesis, §0.5, p. 11, for the status beyond the CM case).

**Checks.** For 32a2, `R_q(U) = 37.364…·i ≠ 0`; `U` is not claimed to span; nothing is claimed for other CM orders or larger class number.

### 5.17 The Gaussian, Eisenstein and `√−7` examples

For `y² = x³ − x`: `τ = i`, `C = 4`, `f = 2 + 2i`, `g = 1 − i`, `Γ = 2`, `U = S_{1/4} + S_{(3+2i)/4}`, `R_q(U) = 37.36400426919091138661030173188499…·i` and `L(E, 2) = 0.917050635318654988643805524295713…`. For `y² = x³ + 1`: `τ = (1 + √−3)/2`, `C = 6`, `Γ = 3`, index points `(1, 0)`, `(5, 4)`, `(3, 2)` divided by `6`. For 49a1: `C = 7`, `χ(a + bτ) = (a + 4b | 7)`, `Γ = 7`, 21 index points. The finite Gauss data and scalars are exact; the decimals are diagnostics. The tables are built by unit congruence modulo `f` (Gaussian, Eisenstein) and by the quadratic residue character modulo `7` (`√−7`), with `|W| = 8, 18, 42` and `|μ| = 4, 6, 2`. For `√−7`, `H(ḡ) = Σ_{t mod 7} (t | 7) e^{2πit/7} = 2i[sin(2π/7) + sin(4π/7) − sin(6π/7)]`, of absolute value `√7` and positive imaginary part (since `sin(2π/7) > sin(6π/7)`), so `H(ḡ) = i√7` and `Γ = 7`; at `C = 14` four residue lifts and the factor `1/14` give `Γ = 28`. An independent check of the Gaussian ideal series: `L(2, ψ) = Σ_{a≥1 odd} (−1)^{(a−1)/2} [π/(4a²) csch(πa/2) + π²/(8a) csch(πa/2) coth(πa/2)]`, from `χ(a + bi) = sin(πa/2)cos(πb/2) + i cos(πa/2)sin(πb/2)`, unit symmetry `L(2, ψ) = Σ_{a>0 odd} (−1)^{(a−1)/2} a Σ_n (−1)ⁿ/(a² + 4n²)²`, and the derivative of `Σ_n (−1)ⁿ/(a² + 4n²) = π csch(πa/2)/(2a)` (Mathlib's `cot_series_rep`), with termwise differentiation justified by locally uniform convergence; it agrees with the regulator evaluation within `10^{−42}` at 45-digit working precision (a diagnostic, not a certified bound). Twisting to `y² = x³ + x` preserves the CM order and changes the conductor and the finite character, so these data cannot be reused.

### 5.18 The enlarged index set at level fourteen

For `κ = ℚ(√−7)`, `τ = (1 + √−7)/2`, `f = √−7`, `C = 14`, `g = −2√−7` and `χ(a + bτ) = (a + 4b | 7)`: `Γ = 28`; `W` has 168 residues and 84 root-of-unity orbits, while the units modulo `14` have 42 residues and 21 orbits. The `W`-sum gives `L(2, ψ) = 1.13881438870384811745067015019065…`, and the unit-only sum gives twice that value. The primes above `2` divide `g` but not `f`, so the units modulo `14` are not the right index set; this is the instance showing that `W` is required.

### Examples

The three CM curves 32a2, 36a1 and 49a1 of §5.17, with the exact scalars `π/2`, `2π/3` and `4π/7`, and the level-14 instance of §5.18.

### Dependencies

Layers 1–4. ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2, ComplexMultiplicationAndExplicitReciprocity §2.2, ComplexMultiplicationAndExplicitReciprocity §§4.1–4.2 (CM datum, Galois action on torsion, Grössencharakter, Deuring's comparison with all local factors). EllipticKTheory §§3.1–3.7 and EllipticKTheory §§7.1–7.9 (Bloch's classes, rational Galois descent, injectivity into the function field). AutomorphicLFunctionsAndLocalFactors AL.1 (local-factor conventions). AdditiveCombinatorics AC.0 (Parseval). The Tau Ceti roadmap GlobalNumberFields, layers 9–10 (ray-class quotients and infinity types). Mathlib: `WeierstrassCurve.LSeries`, `WeierstrassCurve.LFunction`, `WeierstrassCurve.localPolynomial`, `ZMod.stdAddChar`, `cot_series_rep`. Tau Ceti: `TauCeti.MultiplicativeIdealWeight`, `TauCeti.norm_idealTerm`, `TauCeti.summable_absNorm_rpow_ideal_iff`, `TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm`, `TauCeti.LSeries_normCoeff`.

## Layer 6: Integral parts and the Beilinson statement

This layer states Beilinson's conjecture for `K₂` of an elliptic curve precisely, as a proposition about the integral part, separates it from the weaker statements that the constructions of this roadmap actually prove, and supplies the vertical step that makes Bloch's class integral. The integral part `K₂(E)_{ℤ,ℚ}`, its model independence and its vertical-residue description are EllipticKTheory §§6.1–6.10's. The determinant formalism is linear algebra over Mathlib carriers and is stated in the representative Lean file.

### 6.1 The regulator on the integral part

Let `F` be a number field, `E/F` an elliptic curve and `K₂(E)_{ℤ,ℚ} ⊆ K₂(E) ⊗ ℚ` its rational integral part (EllipticKTheory §§6.1–6.10, independent of the regular model). Define `regulatorOnIntegralPart`, the `ℚ`-linear map `reg_ℤ : K₂(E)_{ℤ,ℚ} → H²_D(E_ℝ, ℝ(2))` obtained by restricting Layer 2's regulator along `K₂(E) ⊗ ℚ ↪ K₂(F(E)) ⊗ ℚ` (EllipticKTheory §§3.1–3.7) and taking the part invariant under the combined conjugation, and its real extension `regulatorOnIntegralPart_realify`. Provide `regulatorOnIntegralPart_apply` (simp: `reg_ℤ α` is Layer 2's regulator of `α` in `K₂(F(E)) ⊗ ℚ`) and `regulatorTarget_finrank` (`finrank_ℝ H²_D(E_ℝ, ℝ(2)) = [F : ℚ] = r₁ + 2r₂`, §2.3: a real place contributes `1`, a complex place `2`, since there the regulator is complex-valued). Nothing is asserted about the source: finite dimensionality of `K₂(E)_{ℤ,ℚ}` is an open conjecture (Bass; part of §6.2), so `reg_ℤ ⊗ ℝ` is a map out of a space of unknown dimension. Brunault's modular version `r_N : K₂(X₁(N))_ℤ ⊗ ℚ → T ⊗ ℝ(1)` is the same construction on `X₁(N)` (Brunault, thesis, §3.4, (3.89)–(3.90), p. 93).

**Checks.**

- For `α ∈ K₂(E)_{ℤ,ℚ}`, `reg_ℤ α` equals Layer 2's regulator of its image in `K₂(F(E)) ⊗ ℚ`.
- For `E` over `ℚ(i)` the target has real dimension `2`.
- For `E = 32a2`, Bloch's class `U` of §5.9 lies in `K₂(E)_{ℤ,ℚ}` (§6.7) and `reg_ℤ(U) ≠ 0`.
- Non-example: an unramified class with a non-torsion vertical residue (Dokchitser–de Jeu–Zagier, Theorem 8.3(2); EllipticKTheory Layer 8) is not in the source of `reg_ℤ`, although Layer 2's regulator is defined on it.
- Classes coming from `K₂(F)` are torsion and `reg_ℤ` vanishes on them (degenerate case).

### 6.2 Beilinson's conjecture for `K₂` of an elliptic curve

For `E` over a number field `F` with `d = [F : ℚ]`, define `BeilinsonConjecture E` as the proposition: (1) `dim_ℚ K₂(E)_{ℤ,ℚ} = d` and `reg_ℤ ⊗ ℝ` is an isomorphism onto `H²_D(E_ℝ, ℝ(2))`; (2) with respect to a `ℚ`-basis of `K₂(E)_{ℤ,ℚ}` and Deligne's `ℚ`-structure on `H²_D(E_ℝ, ℝ(2))`, `det(reg_ℤ) ∈ ℚ^× · L*(E, 0)`, where `L*(E, 0) = lim_{s→0} s^{−d} L(E, s)`. Define `BeilinsonConjectureAtTwo E` by replacing `L*(E, 0)` with `π^{−2d}·L(E, 2)`; it is a well-formed proposition without analytic continuation, since `L(E, 2)` is an absolutely convergent Euler product (Mathlib's `WeierstrassCurve.LSeries` at `2`). Provide the projections `BeilinsonConjecture.finrank` and `BeilinsonConjecture.isIso` (Dokchitser–de Jeu–Zagier, "Numerical verification of Beilinson's conjecture for K₂ of hyperelliptic curves", arXiv:math/0405040v2, §3, Conjecture 3.11 and Remark 3.12, p. 6, and p. 5 for why the integral part is the subject). The two forms are equivalent given the functional equation (§6.8). Stated for all of `K₂(E) ⊗ ℚ` instead of the integral part, the rank statement already fails for elliptic curves, as Bloch and Grayson found (Dokchitser–de Jeu–Zagier, §3, p. 5). The normalisation of the regulator is Layer 2's, fixed independently of this conjecture. Nothing about the conjecture itself is proved in this roadmap beyond §6.8 and the special cases of Layers 5 and 7, classified in §6.3.

**Checks.**

- For `E/ℚ`, `BeilinsonConjecture E` implies `finrank_ℚ K₂(E)_{ℤ,ℚ} = 1`; for `E` over `ℚ(i)`, clause (1) predicts `2 = [ℚ(i) : ℚ]`.
- Non-example: replacing `K₂(E)_{ℤ,ℚ}` by `K₂(E) ⊗ ℚ` gives a false statement for some `E/ℚ`.
- `BeilinsonConjectureAtTwo E` uses only the convergent value `WeierstrassCurve.LSeries W 2` (degenerate case: no continuation is needed to state it).

### 6.3 Three conclusions that must not be conflated

With `d = [F : ℚ]`, consider: (1) a constructed class has nonzero regulator; (2) a constructed `ℚ`-subspace `V ⊆ K₂(E)_{ℤ,ℚ}` of dimension `d` has regulator image of full rank, with the determinant relation of §6.2; (3) the conjecture: `dim K₂(E)_{ℤ,ℚ} = d` and `reg_ℤ ⊗ ℝ` is an isomorphism. Prove: (1) does not imply (2) when `d > 1`; (2) implies the surjectivity half of (3) but not its injectivity half, since it says nothing about classes outside `V`; (1) and (2) together do not imply (3) without a separate dimension bound or injectivity theorem, and none is available in this roadmap or its suppliers. For `E/ℚ` (`d = 1`) a nonzero integral class with an explicit `L`-value formula is already of kind (2): Bloch's theorem (§5.15), once `U` is integral (§6.7) and its scalar is expressed in Layer 2's normalisation, is of kind (2) — for 32a2, `L′(E, 0) = 32·L(E, 2)/(4π²) = (4/π)·[D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4})] = 0.7433332466435517344801648…` (root number `+1`). Brunault's Théorème 5 (the regulator images of `K_p ⊆ K₂(X₁(p))_ℤ ⊗ ℚ` span `V_p`) is the surjectivity half of (3) for `X₁(p)` and contains no `L`-value: it is neither (1) nor (2) (Brunault, thesis, Théorème 5, p. 11, and §3.4, Remarques 84.2, p. 93). A claim that the conjecture holds for a curve must cite an injectivity or dimension theorem; none of the constructions here provides one.

### 6.4 Unramified on the generic fibre is not integral

A class whose tame residues on the curve vanish is unramified on the generic fibre; lying in the integral part of EllipticKTheory §§6.1–6.10, an image out of the `K`-theory of a regular proper model, imposes in addition the vertical conditions: the tame symbols at the components of the bad fibres are torsion (EllipticKTheory §§6.1–6.10, vertical residues). So a construction of unramified classes has not thereby produced integral ones, and a claim matching an integral formulation must include the vertical step (Dokchitser–de Jeu–Zagier, §8, p. 22; Brunault, thesis, §1.1, Remarques after Proposition 17, pp. 19–20). For the classes of Layer 5 on a CM curve over `ℚ` the vertical step is §6.7. In general it is a genuine condition (§6.5), and where it is not proved the honest statement is the rational one.

### 6.5 Strict implications and a vertical obstruction

Horizontal unramifiedness (all horizontal closed points, not only rational ones) identifies a class in `K₂(E) ⊗ ℚ` (EllipticKTheory §§3.1–3.7), not necessarily in `K₂(E)_{ℤ,ℚ}`; a nonzero regulator implies a nonzero class; a `d`-dimensional determinant witness (§6.10) implies real surjectivity on the integral part; neither implies real injectivity or the full conjecture. For the smooth genus-one curve `y² + (x + 12)y + x³ = 0` with its point at infinity, the class `M = {y²/x³, (x − 4)/(−4)}` of Dokchitser–de Jeu–Zagier is horizontally unramified but no nonzero multiple is integral, by their Theorem 8.3(2) (p. 23) with `g = 1`, their `d = 3`, `f = x + 12`, `m = x − 4`, `m(0) = −4` and `p = 2` not dividing `b₁ = 1` (their `d` is unrelated to `[F : ℚ]`). The factorisation `−4t(x) = 4x³ − x² − 24x − 144 = (x − 4)(4x² + 15x + 36)` has a quadratic factor of discriminant `−351` and value `160` at `x = 4`, so the cubic has distinct roots; the theorem then gives a non-torsion vertical residue at `p = 2`. The change `u = −x` gives the Mathlib equation with coefficients `(−1, 0, 12, 0, 0)`, `c₄ = 289`, `Δ = −561600` and `v₂(j) = −6`, consistent with the failure of potentially good reduction (Schappacher–Scholl, "Beilinson's theorem on modular curves", author copy, §1.1.3(iii), p. 3, for the fact that an integral constructed subspace does not by itself give injectivity).

**Checks.**

- The projection `ℚ² → ℚ` passes the constructed-subspace certificate and fails the full criterion (§6.11).
- For the equation `W = (−1, 0, 12, 0, 0)`: `c₄ = 289`, `Δ = −561600`, `v₂(j) = −6` (exact arithmetic).
- No theorem asserting that all horizontal classes are integral applies without its potentially-good hypothesis.

### 6.6 Potentially good reduction: the fibre-graph argument

Let `E/F` have potentially good reduction at every finite prime (for example `E/ℚ` with complex multiplication, whose `j`-invariant is integral). Then `K₂(E)_{ℤ,ℚ} = K₂(E) ⊗ ℚ`. A first proof: by EllipticKTheory §§6.1–6.10 it suffices that `∂_D(α)` is torsion for every `α ∈ K₂(E) ⊗ ℚ` and every vertical component `D` of one regular proper model (EllipticKTheory §§6.1–6.10 model independence; good primes impose no condition). At a bad prime the reduction is additive of potentially good type, so the special fibre of the minimal regular model has Kodaira type `II, III, IV, I₀*, IV*, III*` or `II*`: its components are genus-zero curves over finite fields and its dual graph (with a triple point of type `IV` or a tangency of type `III` counted as one intersection vertex) is a tree, and blowing up preserves both. Reciprocity on the regular surface (SchemeKTheoryOperations §§3.3, 3.6–3.7) makes the divisors of the `∂_D(α)` a divergence-free flow on the dual graph, which vanishes on a tree; so each `∂_D(α)` is a constant of the finite constant field of `D`, hence torsion. **Gap in this separate proof route.** The graph argument needs a precise residue diagram over the residue field, with norms at non-rational intersection points and the incidence convention at tangencies and triple points; it must also cover the wild fibres in residue characteristics `2` and `3`. No cited published passage supplies these steps. They remain targets of this subsection. The theorem is instead obtained by the descent route of §6.7; this does not certify the graph proof. At a fibre whose graph has a cycle (multiplicative reduction), the tree argument fails and integrality is a genuine condition (EllipticKTheory Layer 8). Dokchitser–de Jeu–Zagier, §8, p. 22 supplies the good-reduction vertical condition alone.

### 6.7 Potentially good integrality by local descent

For every number field `F` and elliptic curve `E/F` with potentially good reduction at every finite place, prove `potentiallyGood_integralPart_eq_top`: `K₂(E)_{ℤ,ℚ} = K₂(E) ⊗ ℚ`. This is equality of rational images: an integral lift may require a multiple. The arithmetic integral part and its global model independence are EllipticKTheory §§6.8–6.10's. The following adapters, needed to apply the published weightwise descent argument, are targets here, not assertions that EllipticKTheory already contains a local-field theorem.

First prove `curveK2_adamsWeightTwo` over a number field: every rational `K₂(E)` class has Adams weight two. The rational injection of EllipticKTheory §3.7 into `K₂(F(E)) ⊗ ℚ` commutes with Adams operations; Matsumoto symbols generate the latter, and `ψᵏ{f,g} = k²{f,g}` for every positive integer `k`. Thus `ψᵏα = k²α` by injectivity. This uses SchemeKTheoryOperations §§6.8–6.11 and K2SymbolsBrauer §§8.2–8.3, not an unspecified decomposition of all local `K₂` into finitely many weights. Pullback of this global class to a completion retains weight two; rational injectivity into a function field is not asserted for a curve over an arbitrary local field.

For a smooth proper curve `X` over any finite extension `K/ℚ_p`, define `localCurveIntegralImage X` to be the rational image of `K₂(𝒳) → K₂(X)` for a regular proper flat `O_K`-model `𝒳`. Provide `localCurveIntegralImage_model_independent`, `localCurveIntegralImage_good` (a smooth proper model has full image, since its localization boundary lands in torsion `K₁` of a smooth proper finite-field curve), `localCurveIntegralImage_restrict`, and the weight-two reflection theorem `localCurveIntegralImage_reflect`: for every finite extension `L/K`, a weight-two rational class is integral if and only if its restriction is integral over `L`. Use Scholl I, §1.3.3 and Corollary 1.3.4, printed p. 8, for the alteration/degree argument: resolve the model graph, apply pullback and proper transfer, and divide by the nonzero degree in rational coefficients. No extension is required to be unramified; the alteration theorem, rather than a finite morphism between minimal models, justifies reflection. The global–local test `curveIntegralImage_iff_all_completions` is Scholl I, Proposition 1.3.6, p. 9; Scholl II, §2, p. 5 recalls the integral-image formalism. Scholl II's separate `ℓ`-adic unramified subgroup is not the horizontal tame kernel.

Given a global `α`, at each `v` choose a finite `L_v/F_v` over which `E` has good reduction. Its pullback is locally integral by `localCurveIntegralImage_good`; weight-two reflection returns integrality over `F_v`, and the global–local test proves the displayed equality. This works in residue characteristics `2` and `3`, including wild ramification, and gives no dimension bound. *Needs:* EllipticKTheory §§3.7, 5.5–5.11, 6.8–6.10; SchemeKTheoryOperations §§2.3–2.6, 5.7–5.8, 6.8–6.11; the potentially-good criterion of TauCetiRoadmap.EllipticCurves Layer 4.

**Checks.**

- For a good-reduction model and the trivial extension, the local image is the entire rational group, and restriction and reflection are identities.
- For an extension of degree `e > 1`, normalised transfer uses `1/e`; unnormalised transfer returns `eα`, not `α`. Rational membership is unchanged, whereas an integral lift without a multiple does not follow.
- A global symbol has `ψ²α = 4α`; a hypothetical nonzero weight-three kernel class would give `8α` and is excluded by the number-field rational injection. The same injection is not assumed over a completion.
- The curve of §6.5 has `v₂(j) = −6` and a nonzero vertical obstruction, so it is excluded. For `j = 0, 1728`, integral `j` supplies the hypothesis also at `2, 3`.
- The zero class belongs to every local image. The model-independent image agrees with the supplier's global integral image under the global–local test; changing a model by a regular blowup does not change it.

### 6.8 The leading-term and value-at-two forms are equivalent

Let `E` be an elliptic curve over a number field `F`, `d = [F : ℚ]`, `N = |d_F|²·N_{F/ℚ}(𝔣_E)`, and assume that `L(E, s)` continues analytically with `Λ(s) = w·Λ(2 − s)`, `Λ(s) = N^{s/2}(2π)^{−ds}Γ(s)^d L(E, s)`, `w = ±1` (a theorem for `E/ℚ`: EllipticCurveModularity R29.6). Then `L(E, s)` vanishes to order exactly `d` at `s = 0` and

```text
L*(E, 0) = w · N · (2π)^{−2d} · L(E, 2),
```

since `Γ(s)^d = s^{−d}(1 + O(s))`, `Λ(2) = N(2π)^{−2d}L(E, 2) ≠ 0` (absolute convergence of the Euler product) and `L*(E, 0) = Λ(0) = wΛ(2)`. Hence `BeilinsonConjecture E ↔ BeilinsonConjectureAtTwo E`, the rational factor changing by `w·N·2^{−2d}`: the two forms do not have the same rational factor (Dokchitser–de Jeu–Zagier, §3, Remark 3.12, p. 6). The functional equation is an input, not available for general `F`.

### 6.9 The leading coefficient from modularity

For `E/ℚ`, import the continuation and completed functional equation of EllipticCurveModularity R29.6, with all bad Euler factors and the conductor `N`: `Λ(s) = N^{s/2}(2π)^{−s}Γ(s)L(s)` away from the gamma poles and `Λ(s) = wΛ(2 − s)`. Then `lim_{s→0} L(s)/s = wN(2π)^{−2}L(E, 2)`, and when `L(E, 2) ≠ 0` the analytic order at `0` is exactly one. The analytic prototype allows `Γ(s)^d` and gives `lim L(s)/s^d = wN(2π)^{−2d}L(2)`. Here `L` is a continued function agreeing with Mathlib's `LSeries` on its convergence region, never the totalised raw series at `0`. Multiply by `(sΓ(s))^{−d}` and use `sΓ(s) → 1` (Mathlib's `Complex.tendsto_self_mul_Gamma_nhds_zero`) and `Γ(2) = 1` (`Complex.Gamma_one`, `Complex.Gamma_add_one`); for analytic `L`, a nonzero finite limit of `L(s)/s^d` means `analyticOrderAt L 0 = d` (`AnalyticAt.analyticOrderAt_eq_natCast`). Non-vanishing of `L(E, 2)` follows from the Euler product with Hasse's bound, which is part of R29.6's contract (Dokchitser–de Jeu–Zagier, §2, display after Conjecture 2.1, p. 3).

**Checks.**

- For `N = 32`, `w = +1`, `d = 1`: `L′(0) = 8π^{−2}L(2)`, rational factor `8`.
- Changing `w` to `−1` reverses the signed leading coefficient; the `ℚ^×` class of the determinant is unchanged.
- For `d = 2` the comparison is `wN/(16π⁴)`, not `wN/(4π²)`, and the leading coefficient is `L″(0)/2!`, not `L″(0)` (non-example).

### 6.10 The regulator determinant and the determinant witness

Fix `F`, `E`, `d = [F : ℚ] > 0`, `I = K₂(E)_{ℤ,ℚ}` and `r : I → D` the restricted regulator of §6.1. Let `B = H¹(E(ℂ), ℚ(1))⁻` for the geometric conjugation `c^*`, `ℚ(1) = 2πiℚ`; its inclusion into `H¹(E(ℂ), ℝ(1))⁻` followed by §2.1 gives the Betti rational structure of `D`, with `ℝ ⊗_ℚ B ≅ D` and `dim_ℚ B = d` (both targets of Layer 2's comparison). No finite dimensionality of `I` is assumed. The construction below is linear algebra and makes sense for arbitrary `ℚ`-vector spaces `I`, `B` and `ℚ`-linear `r : I → ℝ ⊗_ℚ B`.

Define `regulatorDet b r x = Δ_b(r; x) = det((b_ℝ.repr(r(x_j)))_i)` for a `ℚ`-basis `b` of `B` indexed by `Fin d` and a `d`-tuple `x` in `I`, using `b.baseChange ℝ` and Mathlib's signed `Matrix.det`, with the regulator images as columns. Provide `regulatorDet_eq_matrix`, `regulatorDet_changeFrame` (stated in the Lean file on frames `x ↦ (Σ_i A_{ij}x_i)_j`) (for every `d × d` matrix `A` over `ℚ`, `Δ_b(r; xA) = Δ_b(r; x)·det A`; `A` need not be invertible), `regulatorDet_changeBetti` (if `C_{ij} = b.repr(b′_j)_i` then `Δ_b(r; x) = det C · Δ_{b′}(r; x)`, by `Matrix.det_mul`), `regulatorDet_zero` (simp: for `d > 0` the zero regulator has determinant `0`) and `regulatorDet_pullback` (`Δ_b(r ∘ f; x) = Δ_b(r; f ∘ x)`). Replacing `b` by an arbitrary real basis is not a permitted rational normalisation; a change of rational basis preserves only the `ℚ^×` class (Dokchitser–de Jeu–Zagier, Conjecture 3.11(2), p. 6, and Remark 3.14, p. 7; Schappacher–Scholl, §1.1.0 and Theorem 1.1.2(ii), pp. 2–3).

Define `HasDeterminantWitness b r ℓ` as `ℓ ≠ 0 ∧ ∃ x q, q ≠ 0 ∧ Δ_b(r; x) = q·ℓ`. Its nonzero determinant makes the regulator images an `ℝ`-basis of `D` and `x` a `ℚ`-basis of its span `V ⊆ I`: this is the weak Beilinson statement on a constructed subspace, not a rank assertion on `I`. The two choices of `ℓ` are `L*(E, 0)` and `π^{−2d}L(E, 2)`. Provide `HasDeterminantWitness.mk`, `HasDeterminantWitness.det_ne_zero`, `HasDeterminantWitness.rescaleValue` (for `a ∈ ℚ^×`, a witness for `aℓ` exists if and only if one for `ℓ` does: use `q·a` or `q/a`), `HasDeterminantWitness.changeBetti` (any two rational bases give equivalent predicates), `HasDeterminantWitness.liftAlongSurjection` (for surjective `f : J → I`, witnesses for `r ∘ f` and `r` are equivalent) and `HasDeterminantWitness.surjective` (stated in the Lean file as `HasDeterminantWitness.span_eq_top`, the regulator image spanning the real target; if `r_ℝ : ℝ ⊗_ℚ I → D` is the scalar extension, `r_ℝ(a ⊗ x) = a·r(x)`, a witness implies `r_ℝ` surjective, since the columns form an invertible matrix and each is `r_ℝ(1 ⊗ x_j)`) (Dokchitser–de Jeu–Zagier, Remark 3.13, pp. 6–7; Schappacher–Scholl, §1.1.0, p. 3). Numerical agreement does not supply the exact rational `q`.

**Checks.**

- With `I = B`, `r(y) = 1 ⊗ y` and `x = b`: `Δ = 1`, and a witness with `ℓ = 1` exists.
- For `d = 0`, `Δ = 1` (the empty determinant), including the zero map (degenerate case).
- `d = 2`, `I = B`, `r(y) = 1 ⊗ y`, `x_j = b_{1−j}`: `Δ = −1`; `d = 1`, `x₀ = 2b₀`: `Δ = 2`.
- No regulator has a witness with `ℓ = 0`; for `d > 0` the zero regulator has no witness for any `ℓ` (non-examples).
- Non-example: for one-dimensional `B`, `r : B ⊕ B → ℝ ⊗ B`, `(u, v) ↦ 1 ⊗ u`, has a witness for `ℓ = 1` although it is not injective.
- `b = b′` gives determinant factor `1`; for `d = 1`, replacing `b` by `2b` divides `Δ` by `2`.

### 6.11 The full integral basis criterion

Let `r_ℝ : ℝ ⊗_ℚ I → D` be the scalar-extended regulator. Prove `fullBasisCriterion`: a determinant witness for `ℓ` together with injectivity of `r_ℝ` is equivalent to `ℓ ≠ 0` and the existence of a `ℚ`-basis `a` of the whole of `I`, indexed by `Fin d`, and `q ∈ ℚ^×` with `Δ_b(r; a) = q·ℓ`. Either side gives `dim_ℚ I = d` and `r_ℝ` an isomorphism. The proof uses cardinal rank preservation under base change (`Module.rank_baseChange`), not a numerical `finrank` equality, so that a `Fin d` basis of `I` is obtained without assuming finiteness; a witness frame is `ℚ`-independent and hence a basis of a `d`-dimensional `I`; conversely an invertible regulator matrix makes `r_ℝ` injective (Dokchitser–de Jeu–Zagier, Conjecture 3.11(1–2), p. 6, and footnote 3, p. 5). Applied to §6.2 this is a reformulation of the conjunction rank–isomorphism–determinant, never a proof of it for a curve.

**Checks.**

- The projection `ℚ² → ℚ` passes the witness and fails the criterion.
- For `d = 1`, a nonzero regulator on a constructed class yields a one-dimensional subspace; it does not prove `dim I = 1`.
- Non-example: `ℚ`-injectivity is not enough: `(a, b) ↦ a + √2·b` from `ℚ²` to `ℝ` is `ℚ`-injective but its real extension has a one-dimensional kernel.

### 6.12 Witnesses in the two normalisations

Let `d = [F : ℚ]`, `N > 0`, `w = ±1`. If the leading coefficient satisfies `ℓ₀ = wN(2π)^{−2d}L(E, 2)`, then `HasDeterminantWitness b r ℓ₀ ↔ HasDeterminantWitness b r (π^{−2d}L(E, 2))`, with rational factors related by `q₂ = q₀·wN·2^{−2d}`, not equal in general (`hasDeterminantWitness_atTwo_iff`); the same rescaling preserves the full criterion. For `E/ℚ` the identity is §6.9; over a general number field it is conditional on the completed continuation (with `d = r₁ + 2r₂` and `N = |disc F|²·N_{F/ℚ}(𝔣_E)`), and Layer 5's Hecke route supplies analytic inputs only for its maximal-order, class-number-one CM setup over `ℚ`. The Betti rational structure and the regulator normalisation are held fixed: changing them to make a formula fit is not allowed; a real part of a complex leading term is never taken to force a real comparison (Dokchitser–de Jeu–Zagier, Remark 3.12, p. 6, and Remark 3.14, p. 7).

**Checks.**

- `d = 1`, `N = 32`, `w = 1`: a leading-form coefficient `q₀ = 1` becomes `q₂ = 8`; `d = 2`, `N = 16`, `w = −1`: the conversion scalar is `−1`.
- If `L(E, 2) = 0` both predicates fail (degenerate case).
- Replacing `2π` by `π` without changing `q` gives the wrong coefficient (non-example).

### 6.13 Bloch's class is integral and spans the target

In the maximal-order CM setup of Layer 5 over `ℚ`, let `U` be the descended Bloch class, and assume `E` has potentially good reduction at every finite place (supplied for `j = 1728` and `j = 0` by the `j`-integrality criterion of EllipticCurves, layer 4). Then `U ∈ K₂(E)_{ℤ,ℚ}` by §6.7. Under Layer 2's identification of the symbol regulator with the universal regulator by a nonzero factor (§§2.6–2.7), the non-vanishing of §5.16 gives `r(U) ≠ 0`; so `ℚ·U` is a one-dimensional subspace of `K₂(E)_{ℤ,ℚ}` whose scalar-extended regulator is an isomorphism onto the one-dimensional target, and the regulator on all of `K₂(E)_{ℤ,ℚ}` is surjective (Scholl II, §2, p. 5, for integral membership after a finite extension). Neither full integral rank nor an exact rational Betti determinant certificate follows from non-vanishing alone; a hypothetical second integral class in the regulator kernel would leave this conclusion intact and contradict the rank-one conjecture, and nothing here excludes it.

### Examples

- 32a2: `U` integral, `reg_ℤ(U) ≠ 0`, `L′(E, 0) = 0.7433332466435517344801648… = 8π^{−2}L(E, 2)`.
- The Dokchitser–de Jeu–Zagier curve `y² + (x + 12)y + x³ = 0`: an unramified class with no integral multiple.
- The linear-algebra controls of §§6.10–6.11: the identity regulator, the projection `ℚ² → ℚ`, the irrational slope `a + √2 b`.

### Dependencies

Layers 2 and 5. EllipticKTheory §§3.1–3.7, EllipticKTheory §§6.1–6.10 (integral part, regular proper models, model independence, vertical residues, good-reduction primes, with no assumption of the additional local-field descent adapters of §6.7 here) and EllipticKTheory Layer 8 (the bad-fibre example). SchemeKTheoryOperations §§3.3, 3.6–3.7 (reciprocity on a regular surface, for §6.6). EllipticCurveModularity R29.6 (continuation and functional equation for `E/ℚ`). The Tau Ceti roadmap EllipticCurves, layer 4 (reduction types and `j`-integrality). Mathlib: `Module.Basis`, `Module.Basis.baseChange`, `Module.rank_baseChange`, `Matrix.det`, `Matrix.det_mul`, `Matrix.isUnit_iff_isUnit_det`, `TensorProduct.AlgebraTensorModule.lift`, `WeierstrassCurve.LSeries`, `WeierstrassCurve.c₄`, `WeierstrassCurve.Δ`, `Complex.tendsto_self_mul_Gamma_nhds_zero`, `analyticOrderAt`.

## Layer 7: Modular curves and modular elliptic curves

This layer carries the regulator to modular curves. On `X₁(N)` the symbols of modular units have regulators computed by a Rankin–Selberg integral against real-analytic Eisenstein series, and Brunault's explicit theorem expresses `L(f, 2)L(f, χ, 1)` exactly as a regulator. For an elliptic curve over `ℚ`, Beilinson's theorem in Schappacher–Scholl's form — the regulator image of the modular-unit classes, after transfers from finer levels, is the line `L′(E, 0)·H¹_B(E/ℝ, ℚ(1))` and consists of integral classes — is proved with the modularity theorem and a modular parametrisation as inputs. The source corrections are part of the statements: the sign of Brunault's Théorème 1 (his `w(E)` is minus the root number), the constants of his formulas (6) and (8), and the factor `4` in Merel's Théorème D.

Modular curves, their cusps, models over `ℚ` and `ℤ[1/N]`, Hecke correspondences and degeneracy maps are supplied by ModularCurvesPartII §§3.14–3.15, 4.1–4.5, 6.1–6.3, 7.2–7.4, 9.1–9.2, 11.4, 13.1–13.4, 17.2; algebraic modular units and Siegel units are supplied by KatoEulerSystems §§0.1–0.5, with its bilinear `K₂` pair symbol in §1.1; the newform `L`-function with its Euler product, continuation and functional equation is the Tau Ceti roadmap ModularForms, Layer 7, and its modular symbols and period map are Layer 8 there; the modularity theorem and modular parametrisations are EllipticCurveModularity R29.5–R29.6.

Conventions for this layer: `N ≥ 1`; `f̂(b) = Σ_v f(v) e^{−2πibv/N}` is Mathlib's `ZMod.dft`; the Gauss sum is `τ(χ) = Σ_a χ(a) e^{2πia/N} = gaussSum χ ZMod.stdAddChar`; for a weight-two cusp form `f`, `ω_f = 2πi f(z) dz`; Brunault's regulator on `X₁(N)` is `r_N({u, v}, f) = ∫_{X₁(N)(ℂ)} log|u| · ω_f ∧ ∂̄ log|v|`, Layer 2's `r_E` on a general compact curve, and the version of record uses `r̂_N({u, v})(ω) = ∫ η(u, v) ∧ ω = −2i·r_N({u, v})(ω)` (Brunault, thesis, (3.110), p. 101; Brunault, "Valeur en 2 de fonctions L de formes modulaires de poids 2 : théorème de Beilinson explicite", Bull. SMF 135 (2007), (3), p. 216). The model of `Y₁(N)` over `ℚ` is the one in which the cusp `∞` is rational (Diamond–Im, Variant 9.3.6); with the other standard model the statements change by the Atkin–Lehner involution.

### 7.1 Real-analytic Eisenstein series of level `N`

For `x = (u, v) ∈ (ℤ/N)²`, `z = x₀ + iy ∈ ℍ` and `Re s > 1` define

```text
eisensteinE x z s = E_x(z, s) = Σ'_{(m,n) ≡ (u,v) mod N} y^s/|mz + n|^{2s},
```

the condition on the row vector `(m, n)`. It continues meromorphically in `s` with a single simple pole at `s = 1` of residue `π/N²`, independent of `z` and `x`; define `eisensteinStar x z = E*_x(z) = lim_{s→1}(E_x(z, s) − π/(N²(s − 1)))` and, for `f : ℤ/N → ℂ`, `eisensteinStarOf f = E*_f = Σ_v f(v) E*_{(0,v)}` (Brunault, thesis, §3.1, (3.4) and the paragraph after (3.8), pp. 73–74). Prove `tendsto_eisensteinE_sub_pole` (along real `σ ↓ 1`), `eisensteinStar_smul` (`E*_x(gz) = E*_{xg}(z)` for `g ∈ SL₂(ℤ)`, `x` a row vector), `eisensteinStar_conj` (`E*_{(u,v)}(−z̄) = E*_{(−u,v)}(z)`), `eisensteinStarOf_odd` (simp: `E*_f = 0` for odd `f`), Γ₁(N)-invariance and reality of `E*_f` for real `f`, and `eisensteinStarOf_fourier`: for `Σ_v f(v) = 0`,

```text
E*_f(z) = (Σ'_{n∈ℤ} f(n)/n²) · y + (π/N²) Σ_{r≥1} (1/r)(Σ_{k|r} k(f̂(k) + f̂(−k)))(q^r + q̄^r),   q = e^{2πiz}
```

(Brunault, thesis, Proposition 71, (3.27), p. 76). The proof goes through the twisted Epstein functions `ζ_{a,b}(z, s) = Σ' e^{2πi(ma+nb)/N} y^s/|mz + n|^{2s}`, the finite Fourier relations between them and the `E_x` ((3.6)–(3.7)), their continuation (§7.2), and the Fourier series of the periodic Bernoulli function `B̄₂`. The expansion is stated only for `f` of sum zero; for the trivial character the constant term contains `π log y` and Euler's constant, and `E*_f` is not `π` times the logarithm of the modulus of a unit.

**Checks.**

- `N = 1`, `z = i`: `E*_{(0,0)}(i) = 2π(γ − log 2 − 2 log η(i)) = 2.58498175957925321706589358738…` with `η(i) = Γ(1/4)/(2π^{3/4})` (Kronecker's first limit formula; Mathlib's `ModularForm.eta`).
- `E*_f = 0` for odd `f`, in particular `E*_χ = 0` for an odd Dirichlet character (degenerate case).
- `E*_{(u,v)}(z + 1) = E*_{(u,u+v)}(z)`, not `E*_{(u,v−u)}(z)`, and `E*_x(−1/z) = E*_{(v,−u)}(z)` (checked for `N = 11`, `x = (3, 5)`, `z = 0.13 + 0.87i`): this pins the row-vector convention.
- `f̂ = ZMod.dft f`, and for a primitive even character `χ̂ = τ(χ)·χ̄`.
- Non-example: subtracting `π/(s − 1)` instead of `π/(N²(s − 1))` gives no finite limit for `N > 1`.

### 7.2 Kronecker's limit formulas

For `z ∈ ℍ`: `ζ*_{0,0}(z) = 2π(γ − log 2 − log √y − 2 log|η(z)|)` with `η(z) = e^{πiz/12} Π_{n≥1}(1 − e^{2πinz})`; and for `(a, b) ∈ (ℤ/N)² − {(0, 0)}` with representatives `(ã, b̃)`,

```text
ζ*_{a,b}(z) = (2π²b̃²/N²) y − 2π log|ϑ((ã − b̃z)/N, z)|,
ϑ(w, z) = e^{πiz/6}(e^{πiw} − e^{−πiw}) Π_{n≥1}(1 − e^{2πi(w+nz)})(1 − e^{−2πi(w−nz)}),
```

independent of the representatives; `ζ*_{a,b}` is the regularised value, the pole being subtracted only at `(0, 0)` (Brunault, thesis, §3.1, (3.10) and (3.12), p. 74). Consequently the expansions (3.16), (3.17), (3.19) hold. Brunault gives no proofs. They are Siegel's: for the first, separate the row `n = 0`, apply one-dimensional Poisson summation to the kernel `(x² + y²)^{−s}`, evaluate the nonzero Fourier integrals by contour deformation and the zero one by the beta function, use exponential bounds for locally uniform continuation, isolate the pole and sum the logarithmic eta product (Siegel, *Lectures on advanced analytic number theory*, Tata Institute 1965, §1, Theorem 1, p. 13, proof pp. 5–13). For the second apply Abel summation to the Fourier expansion, identify the resulting meromorphic partial-fraction sum by matching its poles and quasiperiods with an exponential expression and applying Liouville's theorem, then sum the logarithms to obtain the theta product (Siegel, §3, Theorem 2, p. 28, proof pp. 21–28; these are printed pages, PDF pages 25–32). The two expressions (3.12) and (3.19) for `ζ*_{a,b}` agree to 60 digits at `N = 11`, `(a, b) = (3, 5), (7, 2)`, `z = 0.1 + 0.9i`.

### 7.3 Harmonicity

For `f : ℤ/N → ℂ` of sum zero, `E*_f` descends to a smooth function on `Y₁(N)(ℂ) = Γ₁(N)\ℍ` with `∂∂̄E*_f = 0`, including at the elliptic points: write `E*_f = E₁ + E₂` (holomorphic and antiholomorphic parts read from §7.1) and check that each is invariant under the local rotation at a point of ramification index `n` (Brunault, thesis, Lemme 78, p. 84).

### 7.4 The Manin–Drinfeld theorem

For `N ≥ 1`, `div ⊗ ℚ : 𝒪^*(Y₁(N)(ℂ)) ⊗ ℚ → Div⁰(P_N) ⊗ ℚ` is surjective, `P_N` the cusps of `X₁(N)(ℂ)`; equivalently every degree-zero cuspidal divisor has finite order in `Pic⁰(X₁(N)(ℂ))`. Hence `0 → ℂ^* ⊗ ℂ → 𝒪^*(Y₁(N)(ℂ)) ⊗ ℂ → Div⁰(P_N) ⊗ ℂ → 0` is exact and `u ↦ û(∞)`, the leading `q`-coefficient at `∞`, splits it (Brunault, thesis, §3.3, (3.58)–(3.59), p. 85, citing Manin (1972) and Drinfeld (1973) without proof). Nothing is asserted integrally: an integral unit version at all bad primes is false (§7.38). The proof is §7.5: identify cuspidal classes with points of the Jacobian, and separate the Hecke spectra.

**Checks.** For `N = 11`, `X₁(11)` is `y² + y = x³ − x²`, its five rational cusps are `O, (1, 0), (0, −1), (0, 0), (1, −1)` (Brunault, thesis, (3.152), p. 119), forming `E(ℚ)` of order `5`, so every degree-zero divisor on them has order dividing `5`.

### 7.5 The Hecke separation

For a full level `n ≥ 3` and a good prime `p ∤ n` with `p ≥ 7`, the eigenvalues of `T_p` on the rational degree-zero cuspidal divisor module have the form `pχ₁(p) + χ₂(p)` with finite-order characters `χ_i`, of modulus at least `p − 1`, while on the Jacobian differentials they have modulus at most `2√p` (Eichler–Shimura and the Weil bound of WeilConjectures WC.5); since `p − 1 > 2√p` for `p ≥ 7` the spectra are disjoint, so the cuspidal subgroup of the Jacobian is torsion, hence finite. For general level use a finite full-level cover and the norm (Schappacher–Scholl, author copy, 3.4.0, p. 11; the same geometric Hecke correspondence acts on divisors, `Pic⁰` and differentials, ModularCurvesPartII §§4.1–4.5, 6.2–6.3, 8.4 and ModularCurvesPartII §17.2). At `p = 7`, `6 > 2√7`; the argument is not licensed at `p = 2`.

### 7.6 The modular unit `u_f`

Let `N ≥ 1` and `f : ℤ/N → ℂ` with `Σ_v f(v) = 0`. Define `modularUnit f = u_f ∈ 𝒪^*(Y₁(N)(ℂ)) ⊗ ℂ` as the unique element with `log|u_f| = E*_f/π` and `û_f(∞) = 1 ∈ ℂ^* ⊗ ℂ`. Its divisor is supported on the cusps: for `P = [u, v]`,

```text
ord_P(u_f) = −(1/(N·(u, N))) Σ_{(a,b)∈(ℤ/N)²} f̂(au + bv) B̄₂(b̃/N)
```

(Brunault, thesis, Proposition 79, (3.63), p. 85). The proof: `E*_f` is harmonic (§7.3); at a cusp `E*_f(gz) = K_{f,P}y + α₀ + (exponentially small)` with `K_{f,P} = (2π²/N²) Σ f̂(au + bv) B̄₂(b̃/N)` ((3.64)–(3.65)); `E*_f + (N/2π) Σ_P K_{f,P}/(u, N)·G(P, ·)` extends harmonically to `X₁(N)(ℂ)`, hence is constant, so `Σ_P K_{f,P}/(u, N) = 0`; Manin–Drinfeld (§7.4) and the splitting by `û(∞)` give `u_f`. Provide `modularUnit_logabs`, `modularUnit_leadingCoeff`, `modularUnit_unique`, `modularUnit_divisor`, `modularUnit_add` (simp: `u_{f+g} = u_f · u_g` and `u_{cf} = u_f ⊗ c`) and `modularUnit_eq_siegel` (`u_f` is the `ℂ`-linear combination of the Siegel units of KatoEulerSystems §§0.1–0.5 given by Kronecker's second limit formula, (3.12)). For an even nontrivial Dirichlet character `χ` modulo `N` this gives `u_χ ∈ 𝒪^*(Y₁(N)) ⊗ ℂ` (not a unit) with `log|u_χ| = (1/π) Σ_{a∈(ℤ/N)^*} χ(a) E*_{0,a}` (Brunault, thesis, §0.3, (13), p. 10).

**Checks.**

- `N = 5`, `χ = (·/5)`: `div u_χ = −(4/(25√5))(P₁ − P₂)`, since `L(χ, 2) = 4π²/(25√5) = 0.706211403259740969931…`.
- For `χ` odd, `E*_χ = 0` and `u_χ = 1` (degenerate case).
- Non-example: for the trivial character modulo `N > 1`, `f = 1` on `(ℤ/N)^*` has sum `φ(N) ≠ 0`, `E*_f` has a `π log y` term, and no `u_f` with `log|u_f| = E*_f/π` exists.
- For every `f` of sum zero, `div u_f` is supported on `P_N` and has degree zero.
- For `χ` primitive even, `div u_χ̂ = τ(χ)·div u_χ̄`.

### 7.7 The divisors of `u_χ` and `u_χ̂`

Let `χ` be a Dirichlet character modulo `N`. If `χ` is even and nontrivial, `div u_χ = −(L(χ, 2)/π²) Σ_{v∈(ℤ/N)^*/±1} χ̄(v)·P_v` with `P_v = [0, v] = ⟨v⟩∞`, so `u_χ` is supported on the diamond orbit of `∞`; here `L(χ, 2)` is Mathlib's `DirichletCharacter.LFunction χ 2`. If `χ` is even and `N > 1`, `u_χ̂` is defined and `ord_P(u_χ̂) = 0` unless `N_χ | d = (u, N)`, in which case it is `−((φ(N)/N)/(φ(d)/d)) Σ_{β∈(ℤ/d)^*} B̄₂(β̃/d) χ_d(β v_d)` at `P = [u, v]`; if `χ` is primitive, `div u_χ̂ = τ(χ)·div u_χ̄`. Moreover `E*_χ(⟨d⟩z) = χ̄(d)E*_χ(z)` (Brunault, thesis, Proposition 80, (3.76)–(3.77), p. 88). Numerically, for `N = 5` and `χ = (·/5)`, `div u_χ = −0.0715541752799932702…·(P₁ − P₂)`.

**Checks.**

- For the even order-five character modulo `11` with `χ(3) = ζ₅`, `χ̂(3) = τ(χ)ζ₅^{−1}` and the coefficient of `P₃` in `div u_χ` is `−L(χ, 2)ζ₅^{−1}/π²`. Replacing either inverse by `ζ₅` fails.
- For this same character `⟨3⟩^*u_χ = u_χ ⊗ ζ₅^{−1}`, and `u_χ̂ = u_χ̄ ⊗ τ(χ)` by the leading-coefficient normalisation; both distinguish the conjugate character.
- For the quadratic character modulo `5` conjugation is invisible, and the computed divisor in §7.6 is unchanged. An odd character gives the identity unit and zero divisor.

### 7.8 Rationality of modular units


For `f` of sum zero, `u_f ∈ 𝒪^*(Y₁(N)) ⊗ ℚ(f̂) ⊂ 𝒪^*(Y₁(N)(ℂ)) ⊗ ℂ`, in the model where `∞` is rational and `Aut(ℂ/ℚ)` acts on cusps by `[u, v]^σ = [ε(σ)^{−1}u, v]` with `σ(ζ_N) = ζ_N^{ε(σ)}` (ModularCurvesPartII §§7.2–7.4, 9.1–9.2, 10.2). The orders `ord_P(u_f)` lie in `ℚ(f̂)` and are Galois-equivariant by the substitution `a = ε(σ)a′` in (3.63); the exact sequence over `ℚ` (exact on the right by Hilbert 90) maps injectively to the one over `ℂ`, compatibly with the splittings by `û(∞)` (Brunault, thesis, Lemme 85, p. 94, quoting the Galois action on cusps from Schappacher–Scholl 3.0.2). For `χ` even nontrivial, `u_χ` is defined over `ℚ` with coefficients in `ℚ(χ̂) ⊆ ℚ(μ_N, χ)`; for `N = 11` the cusps are rational points of `X₁(11)`.

### 7.9 Symbols of character units lie in `K₂` of the complete curve

Let `f, g : ℤ/N → ℂ` have sum zero and support in `(ℤ/N)^*`, and let `L` be the field generated by the values of `f̂` and `ĝ`. Then `{u_f, u_g} ∈ K₂(ℚ(X₁(N))) ⊗ L` has trivial tame symbol at every closed point of `X₁(N)`, hence lies in `K₂(X₁(N)) ⊗ L` (EllipticKTheory §§3.1–3.7's rational injectivity into `K₂` of the function field). In particular `{u_χ, u_χ′} ∈ K₂(X₁(N)) ⊗ ℂ` for all even nontrivial `χ, χ′`, and `{u, v} ∈ K₂(X₁(N)) ⊗ ℚ` for `u, v ∈ 𝒪^*(Y₁(N)) ⊗ ℚ` supported on the cusps `P_w` with `û(∞) = v̂(∞) = 1`. The tame symbol is K2SymbolsBrauer §§9.2–9.8's, `∂_P{f, g} = (−1)^{ord f·ord g}(f^{ord g}/g^{ord f})(P)` (Brunault's (3.87)). The proof: reduce to characters; `⟨d⟩^*u_χ = u_χ ⊗ χ̄(d)` because the defect is a homomorphism from a finite group to a `ℚ`-vector space; `∂_{P_w}{u_χ, u_χ′} = ∂_∞{u_χ, u_χ′} ⊗ (χχ′)̄(w)`; and `∂_∞ = 1` because both leading coefficients are `1` (Brunault, thesis, Proposition 86, p. 95; the citation "proposition 80" in its proof refers to (3.76)). Support in `(ℤ/N)^*` is essential: otherwise the tame symbols need not vanish (Remarque 87, p. 96), which is why the general symbol of §7.13 is not asserted to lie in `K₂(X₁(N))`.

**Checks.** On `X₁(11)` the symbol `{x, y}` has tame values `−1, −1, 1, 1` at `(0, 0), (0, −1), (1, 0), O`, so `2{x, y}` lies in the kernel (EllipticKTheory §§7.1–7.9); the tame symbols of `{u_χ, u_χ′}` vanish at every cusp.

### 7.10 The real structure of the regulator

The composite `K₂(ℚ(X₁(N))) → K₂(ℂ(X₁(N))) → T ⊗ ℂ`, `{f, g} ↦ ∫ log|f| · Ω ∧ ∂̄ log|g|`, with `Ω = 2πi Σ T_n e^{2πinz} dz` the universal modular form and `T` the Hecke algebra of `S₂(Γ₁(N))`, takes values in `T ⊗ ℝ(1)`; hence the Beilinson regulator is `r_N : K₂(X₁(N)) ⊗ ℚ → V_N := T ⊗ ℝ(1)`. For `f, g` defined over `ℚ`, complex conjugation `c : z ↦ −z̄` reverses orientation and `c^*Ω = Ω̄`, so `r_N{f, g} = −conj(r_N{f, g})` (Brunault, thesis, Lemme 83, p. 92). For `N = 11`, `T ⊗ ℂ = ℂ` and `V₁₁ = 2πiℝ`.

### 7.11 The convolution Dirichlet series

Let `ψ` be a Dirichlet character modulo `N`, `χ₁, χ₂` Dirichlet characters, `σ_{χ₁,χ₂}(n) = Σ_{d|n} d χ₁(d) χ₂(n/d)`, and `T^ψ` the `ψ`-isotypic part of `T ⊗ ℂ`. For `Re s` large,

```text
Σ_{n≥1} T_n^ψ σ_{χ₁,χ₂}(n) n^{−s} = L(T^ψ, χ₂, s) · L(T^ψ, χ₁, s − 1) / L(ψχ₁χ₂, 2s − 2),
```

an identity of Euler products whose local factors are computed from `L_p(T^ψ, X) = (1 − T_p^ψ X + pψ(p)X²)^{−1}` in three cases, including `p | N` (Brunault, thesis, Lemme 77, (3.47), p. 82). Brunault states it for `Re s > 5/2` using the weight-two Ramanujan–Petersson bound cited without reference; Hecke's bound `T_n = O(n)` gives it for `Re s > 3`, which suffices since both sides are then continued. For `N = 1`, `χ₁ = χ₂ = 1` it is Rankin's identity `Σ a_n σ₁(n) n^{−s} = L(f, s)L(f, s − 1)/ζ(2s − 2)`.

### 7.12 The Rankin–Selberg integral

Let `χ` be an even Dirichlet character modulo `N`, `χ′` an even character modulo a divisor `M` of `N`, `χ′_N` the induced character modulo `N`, and `ψ = χ·χ̄′_N`. Then

```text
∫_{X₁(N)(ℂ)} E*_χ · Ω ∧ ∂̄E*_{χ̂′} = −iπ (φ(N)/M) · L(T^ψ, 2) L(T^ψ, χ′, 1)    in T^ψ
```

(Brunault, thesis, Théorème 73, (3.37), p. 78, proved pp. 79–83), and for a primitive weight-two form `f` of character `ψ_f`, `∫ E*_χ · ω_f ∧ ∂̄E*_{χ̂′} = −iπ(φ(N)/M) L(f, 2)L(f, χ′, 1)` if `ψ_f = χ·χ̄′_N` and `0` otherwise (Théorème 72, (3.31), p. 78). `L(f, s)` and `L(f, χ′, s)` are the continued functions of ModularForms Layer 7; the value at `s = 1` is reached by continuing the integral `I(s)`. The proof: the integral lies in `T^ψ` by `z ↦ ⟨d⟩z`; replace `E*_χ` by `E_χ(·, s)` (Stokes and moderate growth at the cusps) and write `E_χ(z, s) = 2L(χ, 2s) Σ_{γ∈Γ_∞\Γ₀(N)} χ(γ) Im(γz)^s`; unfold to `Γ_∞\ℍ` against the constant term computed from §7.1, obtaining `I(s) = −(16π³iφ(N)/M) Γ(s + 1)(4π)^{−s−1} L(χ, 2s) Σ c_n n^{−s−1}`; apply §7.11 with `χ₁ = χ′`, `χ₂ = 1`, cancel `L(χ, 2s)`, continue and set `s = 1`. The case `M = 1` uses (3.16) in place of (3.27). The factor `−iπφ(N)/M` is exact.

### 7.13 The general explicit formula

Let `f` be a primitive weight-two cusp form for `Γ₁(N)` of character `ψ`, `χ` an even nontrivial character modulo `N`, `χ′` an even character modulo a divisor `M > 1` of `N`, `α : Y₁(N)(ℂ) → Y₁(M)(ℂ)` the degeneracy map induced by the identity of `ℍ` (ModularCurvesPartII §§9.1, 13.1–13.4), and `χ′_N` the induced character. Then

```text
r_N({u_χ, α^*u_{χ̂′}}, f) = (φ(N)/(Mπi)) · L(f, 2)L(f, χ′, 1)   if ψ = χ·χ̄′_N,   and 0 otherwise
```

(Brunault, thesis, Théorème 81, (3.83), p. 91), because `log|u_χ| = E*_χ/π` and `log|α^*u_{χ̂′}| = E*_{χ̂′}/π` (§7.6 at levels `N` and `M`), so the regulator is `π^{−2}∫ E*_χ · ω_f ∧ ∂̄E*_{χ̂′}`, evaluated by §7.12. The symbol lies in `K₂` of the function field tensored with `ℂ`; it is not asserted to lie in `K₂(X₁(N)) ⊗ ℂ` unless `M = N` and `χ′` is primitive. `χ` nontrivial and `M > 1` are exactly what make `u_χ` and `u_{χ̂′}` defined.

### 7.14 Brunault's explicit Beilinson theorem

Let `f` be a primitive weight-two cusp form for `Γ₁(N)` of character `ψ` and `χ` an even primitive Dirichlet character modulo `N` with `χ ≠ ψ̄`. Then `{u_{ψχ}, u_χ̄} ∈ K₂(X₁(N)) ⊗ ℂ` and

```text
L(f, 2) L(f, χ, 1) = (Nπi/φ(N)) · τ(χ) · r_N({u_{ψχ}, u_χ̄}, f),
```

equivalently, in the normalisation of the version of record, `L(f, 2)L(f, χ, 1) = (Nπτ(χ)/(2φ(N)))·r̂_N({u_χ̄, u_{ψχ}})(ω_f)` (Brunault, thesis, Corollaire of Théorème 4, p. 91, and Théorème 4, p. 11; Bull. SMF 2007, Théorème 1.1 and (3), pp. 216–217). The proof is §7.13 with `M = N` and `χ′ = χ` (then `ψ = ψχ·χ̄`), `χ̂ = τ(χ)χ̄` for primitive `χ`, §7.9 for membership in `K₂(X₁(N))`, and (3.110) for the conversion. The symbol order matters: reversing it changes the sign. Primitivity is essential for the `K₂` statement: without it no formula for this symbol is known (Remarque 82, p. 91; the version of record lists lifting it as open, Remarque 1.2, p. 217), and the identity without primitivity is §7.13 for a function-field symbol. For `N ≡ 2 mod 4` there are no primitive characters modulo `N` and the theorem is empty (for instance `N = 14`). The constant depends on the regulator normalisation, which is Layer 2's.

**Checks.**

- For `N = 11`, `ψ = 1` and `χ` even nontrivial, both sides are nonzero (§7.24).
- The factor is `Nπiτ(χ)/φ(N)` in the thesis normalisation and `Nπτ(χ)/(2φ(N))` in the published one.
- Non-example: `N = 14` admits no primitive `χ`, so the theorem says nothing there.

### 7.15 Spanning for prime level

For every prime `p`, the real vector space `V_p = T ⊗ ℝ(1)` is spanned by `r_p(K_p)`, where `K_p ⊂ K₂(X₁(p)) ⊗ ℚ` is the subspace of symbols `{u, v}` of modular units in the kernel of the tame symbol (Brunault, thesis, Théorème 5, p. 93, proof pp. 96–98, also p. 11; Bull. SMF 2007, Théorème 1.4, p. 218). The proof uses the units `u_α` (`α ∈ (ℤ/p)^*`) with `div u_α = P_α − P₁` and `û_α(∞) = 1` (§7.4), expresses `r_p{u_χ, u_χ′}` through the `r_p{u_α, u_β}` and evaluates it by §7.13 as `(p − 1)/(pπiτ(χ̄′))·L(T^{χχ′}, 2)L(T^{χχ′}, χ̄′, 1)`, uses that `L(T^ψ, 2)` is invertible in `T^ψ` (Euler product), and shows that the `L(T^ψ, χ, 1)` span `T^ψ` by identifying `T^ψ` with `H₁⁺(X₁(p)(ℂ), ψ̄)` and these values with the cycles `−(τ(χ)/p)W_p ξ(1, χ̄)` through Manin's presentation of relative homology (ModularSymbolsPadicLFunctions §§0.7–0.8, 1.1–1.2). This is a spanning statement for the regulator on a constructed subspace: it is not injectivity on `K₂(X₁(p))_ℤ ⊗ ℚ` and gives no rank. The analogous statement for `Γ₀(p)` is false when `X₀(p)` has positive genus.

### 7.16 The forms `η(l, m)` of two divisors

For functions `l, m` on `ℤ/N` define `etaDiv l m = η(l, m) = E*_l·(∂ − ∂̄)E*_m − E*_m·(∂ − ∂̄)E*_l`, a `Γ₁(N)`-invariant one-form on `Y₁(N)(ℂ)`. Prove `d_etaDiv` (`dη(l, m) = (πi/N²) E*_{D(l,m)} dx ∧ dy/y²` with `D(l, m) = (deg m)l − (deg l)m`, from `∂∂̄E*_l = −(πi/(2N²))(deg l) dx ∧ dy/y²`), `etaDiv_eq_units` (for `l, m` of degree zero, `η(l, m) = π²i·η(u_l, u_m)` with the curve form `η(u, v) = log|u| d arg v − log|v| d arg u` of Polylogarithms §§5.13–5.15, closed), `etaDiv_antisymm`, `etaDiv_bilinear` and `integral_eisenstein_eq_etaDiv` (`∫_{X₁(N)(ℂ)} E*_l · ω_f ∧ ∂̄E*_m = −½ ∫ ω_f ∧ η(l, m)` for every weight-two cusp form, by integration by parts and moderate growth at the cusps) (Brunault, thesis, Définition 88 and Lemme 89, (3.112)–(3.114), p. 101; Lemme 90, p. 102).

**Checks.**

- For `l = [1] − [2]`, `m = [1] − [3]` on `ℤ/5`, `dη(l, m) = 0`.
- Non-example: for `l = [1]`, `m = [2]` on `ℤ/N` with `N ≥ 5`, `dη(l, m) = (πi/N²) E*_{[1]−[2]} dx∧dy/y² ≠ 0` (for `N = 3`, `E*_{(0,2)} = E*_{(0,1)}` and the form is closed).
- `η(l, l) = 0` (degenerate case).
- For `χ, χ′` even nontrivial, `η(χ, χ′) = π²i·η(u_χ, u_χ′)`.

### 7.17 The relative cycle `c(l, m)` and its boundary

For divisors `l, m` on `ℤ/N` define `maninCycle l m = c(l, m) = ¼ Σ_{x∈E_N} (∫_{g_xρ}^{g_xρ²} η(l, m)) ξ(x) ∈ H₁(X₁(N)(ℂ), P_N, ℂ)`, where `E_N` is the set of elements of order `N` of `(ℤ/N)²`, `g_x ∈ SL₂(ℤ)` has bottom row `≡ x`, `ρ = e^{πi/3}`, the integral is along the geodesic (it depends only on `x`), and `ξ(x) = {g_x0, g_x∞}` is the Manin symbol. For `l, m` of degree zero, `∂c(l, m) = −2π³i Σ_{P∈P_N} log|∂_P{u_l, u_m}|·[P]`: the cycles `γ_P = Σ_{x above P}{g_xρ, g_xρ²}` are negatively oriented loops around the cusps and the integral of `η(f, g)` around `P` is `2π log|∂_P{f, g}|` (Brunault, thesis, Définition 91, (3.117), and Proposition 92, (3.118), p. 103). Provide `maninCycle_boundary` and `maninCycle_bilinear`. So `c(l, m)` is closed when `{u_l, u_m}` has trivial tame symbols, for instance `l = ψχ`, `m = χ̂` with `χ` primitive.

**Checks.**

- For `χ` primitive even and `ψχ` nontrivial, `∂c(ψχ, χ̂) = 0`.
- `c(l, 0) = 0` (degenerate case); for `l` odd, `E*_l = 0` and `c(l, m) = 0`.
- For the level-11 newform and any even nontrivial `χ`, §7.19 gives `∫_{c(χ,χ̂)}ω_f = (20πi/11)L(f,2)L(f,χ,1) ≠ 0`. This detects the zero-cycle definition, which the vanishing tests alone would allow.


### 7.18 Unfolding over the fundamental domain

Let `f` be a weight-two cusp form for `Γ₁(N)`, `l, m` divisors on `ℤ/N`, and `F_x(z) = ∫_∞^z ω_f|g_x`. Then `∫_{X₁(N)(ℂ)} ω_f ∧ η(l, m) = ∫_{c(l,m)} ω_f − ∫_𝓕 Σ_{x∈E_N/±1} F_x · d(η(l, m)|g_x)` with `𝓕` the standard fundamental domain, and for `l, m` of degree zero

```text
∫ ω_f ∧ η(l, m) = ∫_{c(l,m)} ω_f = −(π/2) Σ_{x∈E_N} (∫_{g_xρ}^{g_xρ²} η(l, m)) ξ_f(x),   ξ_f(x) = −i ∫_{g_x0}^{g_x∞} f(z) dz
```

(Brunault, thesis, Théorème 93, (3.122)–(3.123), pp. 104–105, following Merel's Théorème C). Decompose `X₁(N)(ℂ)` into the translates `g_x𝓕`, apply Stokes on `𝓕`, cancel the vertical sides after summing over `x` (`F_x ∘ T = F_{xT}`), and on the arc use `σ` and `F_x(σz) = F_{xσ}(z) + 2πξ_f(x)`. The correction term depends only on `f` and `D(l, m)` and vanishes in degree zero (§7.16); Brunault could not remove it in general (Remarque 94), which is why characters are restricted later.

### 7.19 The cycle formula

Let `f` be a primitive weight-two form for `Γ₁(N)` of character `ψ` and `χ` an even Dirichlet character modulo `N` distinct from `ψ̄`. Then

```text
L(f, 2) L(f, χ, 1) = (Ni/4) Σ_{x∈E_N} (∫_{g_xρ}^{g_xρ²} η(1, χ̂)) ξ_f⁺(x) = (N/(2πiφ(N))) ∫_{c(ψχ, χ̂)} ω_f,
```

where `1` is the divisor `[1̄]`, `η(1, χ̂) = Σ_b χ̂(b)η(1, b)`, `ξ_f^±(x) = (ξ_f(x) ± ξ_f(x^c))/2` and `x^c = (−u, v)` (Brunault, thesis, Corollaire of Théorème 3, (3.124), p. 106). No primitivity is needed. The proof: §7.12 and §7.16 give `L(f, 2)L(f, χ, 1) = (N/(2πiφ(N)))∫ ω_f ∧ η(ψχ, χ̂)`; apply §7.18; show `∫_{c(ε, χ̂)} ω_f = 0` for `ε ≠ ψχ` by diamond equivariance and sum over all `ε` to replace `ψχ` by the divisor `1`; symmetrise with `x ↦ x^c` using `c^*η(l, m) = −η(l, m)`. Both sides agree to 38 digits for `N = 11` (the newform of 11a, `ψ = 1`) and the four even nontrivial `χ`.

### 7.20 A twist with nonzero central value

Let `f` be the newform of an elliptic curve `E/ℚ` of conductor `N > 1`. There is an even nontrivial Dirichlet character `χ` modulo `N` with `L(f, χ, 1) ≠ 0` (Brunault, thesis, Lemme 99 and proof, pp. 110–114). Suppose not; by Merel's Corollaire 2 the trivial character is the only even primitive one with nonzero twisted value, so by Merel's Théorème A `ξ_f⁺` is invariant under `(ℤ/N)^*` in both variables (Merel, appendix to Brunault's thesis, Corollaire 2, p. 145, and Théorème A, p. 144; or Merel, "Symboles de Manin et valeurs de fonctions L", author manuscript, pp. 277–302). For `N` odd, `T₂` on `ξ(0, 1)` and the Manin relation `ξ(1, 1) = 0` give `(a₂(f) − 3)ξ_f⁺(0, 1) = 0`, impossible since `|a₂| ≤ 2√2` and `L(f, 1) ≠ 0`; for `N = 2N′`, `N′` odd, the `T₂` relations force `a₂(f) = 1` and contradict `L(f, 1_{N′}, 1) ≠ 0`; for `4 | N`, `a₂(f) = 0` and the function `F(n)` of (3.140) gives `F(2) = 2` against `F(2) = −1`. For a primitive form of arbitrary character, Merel's Corollaire 2 gives only a primitive character of conductor dividing `N`, not a primitive character modulo `N`, and for `N ≡ 2 mod 4` there is none: this does not make §7.14 applicable in general (Bull. SMF 2007, Remarque 1.2, p. 217).

**Checks.** For `N = 11` all four even nontrivial characters have `L(f, χ, 1) ≠ 0`. For `N = 14` there is no primitive character modulo `14`, while this subsection still gives an even nontrivial `χ` modulo `14` for §7.19.

### 7.21 `L(E, 2)` as a rational combination of geodesic periods

For every elliptic curve `E/ℚ` of conductor `N`, `L(E, 2)` is a `ℚ`-linear combination of the numbers `(1/πi) ∫_{g_xρ}^{g_xρ²} η(1, a)`, `x ∈ E_N`, `a ∈ ℤ/N`, which depend only on `N` (Brunault, thesis, Théorème 97, (3.127), p. 109). Apply §7.19 to every even nontrivial `χ` and extend linearly to the span `V̂` of the `χ̂`; `V̂ ∩ ℚ[ℤ/N]` is a `ℚ`-structure of `V̂` (Lemme 98, Galois traces); by §7.20 some rational `m ∈ V̂` has `∫_{m/N}^∞ ω_f ≠ 0`; divide by the nonzero rational multiple of `Ω_E⁺` using Manin–Drinfeld rationality `ξ_f⁺(x) ∈ ℚ·Ω_E⁺/(2π)` and Birch's formula `L(f, α, 1) = −(1/N) Σ_a α̂(a) ∫_{a/N}^∞ ω_f` (ModularSymbolsPadicLFunctions §§0.7–0.8, 1.1–1.2; the Néron real period from NeronModelsAndSemistableAbelianVarieties §§1.11, 6.9). Modularity is an input (EllipticCurveModularity R29.5–R29.6). The coefficients are rational but not explicit in general.

### 7.22 Brunault's Théorème 1, with the sign corrected

Let `E/ℚ` have prime conductor `p` and root number `ε(E)` (`Λ(E, s) = ε(E)Λ(E, 2 − s)`); Brunault's `w(E)` is `−ε(E)` (thesis, Introduction, p. 7). For `χ` modulo `p` put `η_χ = Σ_{a,b∈(ℤ/p)^*} χ(a)χ̄(b)η(a, b)` and, for `χ′` modulo `p`, `c_{χ,χ′} = τ(χ̄′) Σ_{v=1}^{p−1} χ′(v) ∫_{g_vρ}^{g_vρ²} η_χ` with `g_v = (0 −1; 1 v)`. For every even nontrivial `χ` modulo `p`,

```text
L(E, 2) L(E, χ, 1) = (p · ε(E) · τ(χ) / (8πi(p − 1))) · Σ_{χ′} c_{χ,χ′} L(E, χ′, 1),
```

the sum over even nontrivial `χ′` modulo `p`; the coefficients `c_{χ,χ′}` depend only on `χ`, `χ′` and `p`. The printed formula (Brunault, thesis, Théorème 1, p. 8, and pp. 115–117) has `w(E)` where `ε(E)` is correct: the even part of the specialisation (3.145) of Merel's Théorème A (p. 116; appendix p. 155) has the opposite sign, `ξ_f⁺(x) = −(w(E)/(2π(p − 1))) Σ_{χ′ even ≠ 1} τ(χ̄′)χ′(x)L(f, χ′, 1)`, checked at `p = 11` and `19` against Manin symbols computed from the definition. The proof: from §7.19 with `χ` primitive, `L(f, 2)L(f, χ, 1) = (piτ(χ)/4) Σ_{x∈(ℤ/p)^*} (∫_{g_xρ}^{g_xρ²} η_χ) ξ_f⁺(x)` (3.144); expand `ξ_f⁺` in twisted values; `c_{χ,χ′} = 0` for `χ′` odd since `c^*η_χ = −η_χ`; bring the geodesics to `g_vρ → g_vρ²`. The formula is an analytic identity between `L`-values and periods of explicit forms; it asserts nothing about `K₂(E)`. Modularity is an input.

**Checks.** For `p = 11` (11a3, `ε = +1`) and the four even nontrivial `χ`, the corrected formula holds to 45 digits; the printed one gives `−L(E, 2)L(E, χ, 1)` (non-example).

### 7.23 Brunault's Théorème 2 and formula (8), corrected

Let `E/ℚ` have prime conductor `p`, `ε(E)` its root number and `R = Res_{s=2} Σ a_n² n^{−s}`. With `λ_{χ,χ′} = Σ_{χ″} (τ(χ″)/τ(χ′χ″)) c_{χ″,χ}` (`χ″` even nontrivial):

```text
L(E, 2) = (p³ ε(E) / (2(p + 1)(p − 1)³ π²)) · Σ_{χ,χ′} λ_{χ,χ′} L(E, χ, 1) L(E, χ′, 1) / R,
L(E, 2) = (p² i ε(E) / (8(p − 1) π)) · Σ_{χ,χ′} λ_{χ,χ′} L(E, χ, 1) L(E, χ′, 1) / Σ_{χ,χ′} τ(χ̄χ̄′) L(E, χ, 1) L(E, χ′, 1),
```

the sums over `χ` even nontrivial and `χ′` odd. Multiply §7.22 by `L(E, χ′, 1)/τ(χχ′)` and sum; evaluate `R = L(Sym²E, 2)/(ζ(2)(1 + 1/p))` for multiplicative reduction at `p` (AutomorphicLFunctionsAndLocalFactors AL.3) and relate it to the twisted values through the Petersson norm (Merel's Théorème D, appendix p. 154, also Théorème 10 of his author manuscript, p. 299, whose printed right side is four times too small: with `L(f ⊗ f, s) = Σ a_n² n^{−s}` as defined there, the constant is `8πi/((N + 1)(N − 1)²)`); eliminate `R` for the second formula. These differ from Brunault's printed (6) (thesis, Théorème 2, p. 9 and p. 118) by the factor `−4` and from his printed (8) (p. 9; (3.149), p. 118) by the factor `−1`, with `π` in place of `π²`.

**Checks.** For 11a3: `R = 0.58936464004658978237…` and `L(E, 2) = 0.54604803621501351833…`; the printed (6) gives `−L(E, 2)/4` and the printed (8) gives `−L(E, 2)/π` (non-examples); `Σ_{n≤X} a_n² ≈ RX²/2` (`X = 4·10⁵` gives `0.5895` for `2Σ/X²`).

### 7.24 The example `X₁(11)`

Let `E : y² + y = x³ − x²` (`= X₁(11)`, Cremona 11a3), `P = (0, 0)` of order `5`, `E(ℝ)` oriented so that `Ω⁺ = ∫_{E(ℝ)} dx/(2y + 1) > 0`, and `D_E(x) = Σ_{n∈ℤ} D(uqⁿ)` the elliptic dilogarithm in that orientation (`u = e^{2πiz/Ω⁺}`). For every even nontrivial `χ` modulo `11` with `ζ = χ(3)`,

```text
L(E, 2) = (2²·5·π/11²) · ((1 + 3(ζ + ζ̄))/(ζ − ζ̄)) · Σ_{a∈ℤ/5} ζ^a D_E(aP),
```

and consequently `L(E, 2) = (10/11)·π·D_E(P)` and `D_E(2P) = (3/2)D_E(P)` (the relation of Bloch–Grayson) (Brunault, thesis, Théorème 8, (3.150), p. 119, and Corollaire 101, p. 119). The proof applies §7.14 with `ψ = 1`, the cusps `P_v`, `v ∈ (ℤ/11)^*/±1`, being the five rational points with `P_{4^a} = aP`; evaluates `r₁₁({u_χ, u_χ̄})` by the divisor formula with `R_ω(P, Q) = (i/2)D_E(P − Q)` for `ω = ω_f/Ω⁺` (§3.9, real case); uses `L(χ, 2)L(χ̄, 2) = π⁴(2/11)⁴(7 − ζ − ζ̄)` and `L(f, χ, 1) = −αΩ⁺/(5τ(χ̄))` with `α = ζ − ζ̄ + 2(ζ² − ζ̄²)`; and simplifies with `η = ζ + ζ̄`, `η² = 1 − η`, eliminating `η` between the two Galois conjugates. In Brunault's (3.155) and (3.156) (pp. 120–121) the displayed factors `(7 − η)` and `(8 + η)` are to be read as `(1 + 3η)` and `(−2 − 3η)`, as (3.150) requires; (3.157) and (3.151) are then correct. Brunault fixes the sign of `L(f, χ, 1)` by an uncertified numerical evaluation; here that sign is a target to be certified, by an interval evaluation of `L(f, χ, 1)` with rigorous error (the certified numerics of Polylogarithms §2.5 and PolylogarithmFunctions Layer 7) or by an exact modular-symbol computation that tracks the orientation; the sign is minus.

**Checks.**

- `Ω⁺ = 6.3460465213977671084439730837727365261`, `q = −0.2358955385047122079000528089561130080`, `D_E(P) = 0.19119373708433169575495443431217381…`, `D_E(2P) = 0.28679060562649754363243165146826072…`, `L(E, 2) = 0.54604803621501351833412666043344433859…`; `D_E(P) = 11L(E, 2)/(10π)` and `D_E(2P) = (3/2)D_E(P)` to 36 digits; the displayed formula holds for all four `χ` to 38 digits.
- `L(χ, 2)L(χ̄, 2) = π⁴(2/11)⁴(7 − ζ − ζ̄)` and `L(f, χ, 1) = −αΩ⁺/(5τ(χ̄))` for all four `χ`; with `+` in place of `−` the formula fails (non-example).

### 7.25 The regulator under a finite pushforward

Let `φ : X → Y` be a finite morphism of compact connected Riemann surfaces obtained from smooth projective curves over a number field at a complex embedding, and let `N_φ : K₂(ℂ(X)) → K₂(ℂ(Y))` be the field transfer. The general target `symbolRegulator_finite_transfer` is

```text
r_Y(N_φ ξ)(ω) = r_X(ξ)(φ^*ω)
```

for every `ξ ∈ K₂(ℂ(X))` and every holomorphic one-form `ω` on `Y`, without a horizontal-unramifiedness hypothesis. Provide identity and composition compatibilities, with no degree scalar. For `{f, φ^*g}`, the projection formula gives `{Nf,g}` and `log|Nf| = φ_*log|f|`, so the integral identity follows. Brunault's Corollaire 37 and Remarque 38, p. 40, give this Goncharov-function case. They do not show that arbitrary symbols have an entry pulled back from `Y`; Matsumoto generation and the projection formula do not supply that reduction.

For rational compact classes, prove `compactRegulator_finite_transfer` directly from proper covariance of the universal Deligne regulator with supports and integration duality (Deninger–Scholl, (1.3)(1), (2.6)–(2.8), pp. 2, 6–8; MotivicEtaleKTheory §12.2). EllipticKTheory §§3.6, 5.1–5.3 and the norm–residue formula of K2SymbolsBrauer §10.27 show that transfer preserves horizontal unramifiedness; §2.6 converts the universal regulator to Brunault's pairing. This is the statement used for the modular classes in §§7.26, 7.40–7.41.

**Gap for general symbols.** To obtain the first display for arbitrary ramified function-field classes, establish compatibility of the supported/open-curve regulator and transfer with the explicit integral pairing, including its logarithmic boundary terms. Proper covariance on a compact unramified class alone does not prove it. This additional comparison is a target here; no verified proof reducing it to the two projection-formula families is available in the cited passages. Its full domain is retained.

**Checks.** For the identity map both sides coincide with no scalar; composition of finite maps composes both transfers. For an isogeny the compact theorem recovers the distribution relation of `D_E` (Brunault, (1.99)–(1.101)). A symbol with a nontrivial tame residue lies outside the compact proof, even when its integral pairing is defined; it tests the extra supported comparison rather than being silently excluded from the general target. *Needs:* Layers 2–4; the supplier sections just named.

### 7.26 Pushing to `E` along a modular parametrisation

Let `E/ℚ` have conductor `N`, `f` its newform, and `φ : X₁(N) → E` a nonconstant morphism over `ℚ` with `φ(∞) = O` (EllipticCurveModularity R29.5, composed with `X₁(N) → X₀(N)`), with `φ^*ω_E = c_φ·ω_f`, `c_φ ∈ ℚ^×`, `ω_E` the Néron differential. For `χ` even primitive modulo `N` put `ξ_χ = N_φ{u_χ, u_χ̄} ∈ K₂(E) ⊗ ℂ`. Then

```text
r_E(ξ_χ)(ω_E) = c_φ · (φ(N)/(Nπiτ(χ))) · L(E, 2) L(E, χ, 1)
```

(EllipticKTheory §§5.1–5.3 for `N_φ`, §7.25, §7.14). For `L(E, χ, 1) ≠ 0`, construct a rational class by **weighted coefficient trace**. Set `L = ℚ(χ)`, `p_E = L(E, 2)/(πi)` and

```text
a_χ = c_φ · φ(N)/N² · τ(χ̄)L(E, χ, 1)/Ω_E⁺ ∈ L^×.
```

Prove `character_symbol_coefficients`: `ξ_χ ∈ K₂(E)_ℚ ⊗ L` and `σξ_χ = ξ_{χ^σ}` for every embedding `σ : L → ℂ`. To see the coefficient field, choose rational normalised units `h_v` with `div h_v = P_v − P₁` (§7.4); §7.7 writes the two units using `L(χ, 2)/π²` and `L(χ̄, 2)/π²`, and the product of these coefficients is Galois-equivariant in `L` by the Bernoulli formula and `τ(χ)τ(χ̄) = N`. Next prove `elliptic_character_regulator_descent`: Birch's formula (ModularSymbolsPadicLFunctions §§0.7–0.8, 1.1–1.2), or §7.30 with the Néron period comparison, gives the algebraic, Galois-equivariant coefficients `a_{χ^σ} = σ(a_χ)`. Thus at every embedding

```text
r_E(σξ_χ)(ω_E/Ω_E⁺) = p_E · σ(a_χ),
η = (id ⊗ Tr_{L/ℚ})(a_χ^{−1} ξ_χ) ∈ K₂(E)_ℚ,
r_E(η)(ω_E/Ω_E⁺) = [L : ℚ] · p_E ≠ 0.
```

The coefficient trace is applied to the algebraic coefficients; it does not apply a field automorphism to the transcendental period. This proves the required membership in `ℚ^×·iL(E, 2)/π`. The all-embedding calculation is essential: an unweighted orbit trace can vanish even when every conjugate has nonzero regulator (Brunault, thesis, Proposition 80, p. 88, Lemme 85, p. 94, Corollaire (3.84), p. 91; Shimura 1977, Theorem 1, p. 212). This is conditional on a supplied `φ` and newform correspondence, and unconditional for `E/ℚ` once modularity is imported. It does not prove that a primitive `χ` with `L(E, χ, 1) ≠ 0` exists (open in general; Bull. SMF 2007, Remarque 1.2), does not treat `N ≡ 2 mod 4`, and claims integrality only through §7.38. Brunault's account of the classical argument: taking the auxiliary level equal to `N` removes the unspecified choice of auxiliary level and character, but not the inexplicit parametrisation, which remains an input (thesis, §0.3, p. 10; the source avoids it by Théorèmes 3 and 97, and for `N = 11` by `E = X₁(11)`). Only the `f`-isotypic part of `r_N` survives the pairing with `φ^*ω_E`.

**Checks.** For a non-real even character modulo `11`, coefficient conjugation sends `{u_χ, u_χ̄}` to `{u_χ̄, u_χ} = −{u_χ, u_χ̄}` in rational `K₂`, so its unweighted full orbit trace is zero. The weighted trace above has regulator `[L : ℚ]p_E`. For `E = X₁(11)`, `φ` the identity (`c_φ = 1`): the class `{x, y} + {−1, x} ∈ K₂(E)_ℤ ⊗ ℚ` has `r_E(ω) = −(5i/4)D_E(P) = −(πi/2)L′(E, 0) ≠ 0` with `ω = ω_f/Ω⁺` (§8.9). No unrestricted rank statement for `K₂` of elliptic curves follows.

### 7.27 The fixed-level modular-unit subspace

Let `Y_K` be the modular curve over `ℚ` of an open compact `K ⊂ GL₂(𝔸_f)`, `X_K` its smooth projective compactification (componentwise if not geometrically connected), and `j : H²_M(X_K, ℚ(2)) → H²_M(Y_K, ℚ(2))` the injective rational weight-two restriction (EllipticKTheory §§3.1–3.7). Define

```text
fixedLevelBeilinson j S = Q_K = j⁻¹(span_ℚ S),   S = {{u, v} : u, v ∈ 𝒪(Y_K)^× ⊗ ℚ}.
```

The span is taken before the compactness condition: the condition is vanishing of the total horizontal tame boundary, not of each generator, and a linear combination can have cancelling cusp residues (Schappacher–Scholl, author copy, 1.1.1, p. 3). Algebraic modular units are KatoEulerSystems §§0.1–0.5's and the bilinear pair symbol is its L1's. As linear algebra, for `ℚ`-vector spaces `A`, `B`, linear `j : A → B` and `S ⊆ B`, `Q_K` is Mathlib's `Submodule.comap j (Submodule.span ℚ S)`. Provide `fixedLevelBeilinson_mem` (`x ∈ Q_K ↔ j x ∈ span S`), `fixedLevelBeilinson_id` (for `j = id` it is `span S`), `fixedLevelBeilinson_mono`, `fixedLevelBeilinson_empty` (for injective `j`, `S = ∅` gives `0`; without injectivity, `ker j`), `fixedLevelBeilinson_pullback` and `fixedLevelBeilinson_linearCombination`.

**Checks.**

- On `ℚ`, `j = id` and `S = {1}` give all of `ℚ`.
- For `j : ℚ → ℚ²`, `x ↦ (x, 0)`, an empty `S` gives `0` (degenerate case).
- For that `j` and `S = {(1, 1), (0, 1)}`, `1 ∈ Q_K` because `(1, 0) = (1, 1) − (0, 1)`, although neither symbol is in the image of `j`.
- Non-example: for that `j` and `S = {(0, 1)}`, `1 ∉ Q_K`; taking the whole compact group without the span condition fails this.
- For `X₀(p)`, two cusps give one modular unit modulo constants and its same-level regulator image is zero, even in genus one.

### 7.28 The transfer Beilinson subspace

Define `beilinsonSubspace = P_K` as the filtered union of the images `θ_{K′/K,*} Q_{K′}` over open compact `K′ ⊂ K`, equivalently their supremum as `ℚ`-submodules; `Q_K ⊂ P_K` and equality is not asserted. Every element has a single finite-level witness after common refinement, because `θ_*θ^* = [K : K′]` (componentwise, with the actual degree) and dividing by the nonzero rational degree lets the common refinement dominate each image (Mathlib's `Submodule.mem_iSup_of_directed`; transfers and pullbacks from EllipticKTheory §§5.1–5.3 and EllipticKTheory §§3.1–3.7) (Schappacher–Scholl, 1.1.1–1.1.3, p. 3). As linear algebra: for a family of submodules `Q_i` and linear transfers `t_i` into `A`, `P = ⨆_i (Q_i).map t_i`. Provide `beilinsonSubspace_transfer`, `beilinsonSubspace_finiteWitness` (in the Lean file `mem_beilinsonSubspace_iff`) (for directed images and a nonempty index type, `x ∈ P ↔ ∃ i, ∃ y ∈ Q_i, t_i y = x`), `beilinsonSubspace_single` (one index gives `Submodule.map`), `beilinsonSubspace_zero` (simp), `beilinsonSubspace_mono`, `beilinsonSubspace_map` and `beilinsonSubspace_degree` (multiplying a transfer by a nonzero rational leaves its image unchanged).

**Checks.**

- One index with identity transfer gives the prescribed submodule.
- All `Q_i = 0` give `0`, even with nonzero transfers (degenerate case).
- Non-example: on `ℚ²` with levels `n ∈ ℕ`, `Q₀ = span{(1, 0)}`, `Q_n = ℚ²` for `n > 0` and identity transfers, the family is directed and `P = ℚ² ≠ Q₀`.
- On `ℚ`, the transfer `x ↦ 2x` has full image; an integral span would keep an index two.
- For `X₀(11)`, `Q_K` has zero regulator but `P_K` has a one-dimensional regulator image (§7.33).

### 7.29 Compact correction without changing the regulator

After refining `K` to a full level `n ≥ 3`, let `X(n)` be one connected component over `F = ℚ(μ_n)`, with all cusps `F`-rational, and `α` a rational combination of symbols of units on `Y(n)`. There is a rational combination `γ` of constant-unit symbols `{a, h}`, `a ∈ F^×`, `h ∈ 𝒪(Y(n))^×`, such that `ξ = α + γ` has zero horizontal tame boundary, lifts to compact weight-two `K₂`, stays in the unit-symbol span on this full-level component, and has the same compact regulator as `α`; transfers of `ξ` lie in `P_K`. Choose a base cusp `P₀`; Manin–Drinfeld gives `h_P` with `div h_P = m_P(P − P₀)`, `m_P > 0`, realised over `F` by KatoEulerSystems §§0.1–0.5; with `t_P = ∂_P(α) ∈ F^× ⊗ ℚ`, Weil reciprocity on `X(n)/F` (SchemeKTheoryOperations §§3.3, 3.6–3.7) gives `Σ_P t_P = 0`; with `∂_P{a, h} = ord_P(h)·a`, take `γ = −Σ_{P≠P₀}(1/m_P){t_P, h_P}`. Compact Stokes and orthogonality make constant-unit symbols pair to zero with every holomorphic differential (Schappacher–Scholl, 1.3.0–1.3.1, p. 5, and 3.5.3, p. 11; the full-level, rational-cusp specialisation is proved here). For non-rational cusps the norm-weighted relation cannot be replaced by an unweighted sum; constants of `F` are units on the actual full-level component and cannot be replaced by `ℚ`-rational constants.

### 7.30 Period algebraicity of twisted values

Let `f` be a weight-two newform with coefficient field `K_f`, and let `χ₀` be the primitive character associated to a Dirichlet character `χ` of any modulus. Choose the Galois-compatible system of nonzero periods `u_{f,σ}⁺`, `u_{f,σ}⁻`, indexed by coefficient embeddings `σ`, supplied by Shimura's Theorem 1; these are not independent arbitrary period choices. Prove `twisted_central_value_period_algebraicity`: the numbers

```text
L(f^σ, χ^σ, 1) / ((2πi) · τ(χ₀^σ) · u_{f,σ}^{−χ(−1)})
```

are the embeddings of one element of `K_f(χ)`. The sign here is Shimura's: at `m = 1`, an even `χ` uses `u⁻` and an odd `χ` uses `u⁺`. Equivalently set `Ω_{f,σ}^{χ(−1)} = (2πi)u_{f,σ}^{−χ(−1)}` and omit the extra `2πi` from the denominator. Each period is nonzero by the theorem; `τ(χ₀^σ) ≠ 0` since `χ₀` is primitive. An imprimitive twist retains its removed Euler factors, which are algebraic and Galois-equivariant at `s = 1`. Therefore nonzero at one embedding implies nonzero at every embedding (Shimura, "On the periods of modular forms", Math. Ann. 229 (1977), the definition of `g(ψ)` and `A(m, f, ψ)`, pp. 211–212, and Theorem 1, p. 212). This is the period interface used by §§7.31–7.32.

**Checks.**

- For the trivial character displayed modulo `4`, its modulus-four Gauss sum is `i − i = 0`, while the associated primitive character has conductor `1` and Gauss sum `1`. Division by the former is undefined; the primitive Gauss sum in this statement is admissible.
- For a primitive character modulo `5`, `|τ(χ₀)|² = 5`, so the denominator is nonzero. For a real newform, `u⁺` is real and `u⁻` purely imaginary: at `m = 1` the even branch has the real period `(2πi)u⁻`, and the odd branch has the imaginary period `(2πi)u⁺`.
- A zero central value stays zero at every embedding; rescaling the period system by the embeddings of a single element of `K_f^×` rescales the algebraic coefficient compatibly. Independent algebraic rescalings preserve the individual period lines but need not preserve this all-embedding equality.

### 7.31 The modular regulator period

For every weight-two cuspidal automorphic `π` occurring in `Ω¹` of the modular tower, every level `K`, `ω ∈ V_π^K` and rational modular units `u, v`, the tuple over embeddings of `∫_{Y_K(ℂ)} log|u| · conj(d log v) ∧ ω` lies in `2πi·c⁺(π)·L′(π̌, 0)·ℚ̄` inside `ℚ̄ ⊗ ℂ`, as an equality of period lines modulo `ℚ̄^×` (Schappacher–Scholl, 1.3.2(i), 2.3, 4.5.3, 5.1.0 and 5.2, pp. 6–7 and 14–16). Expand `log|u|` in degree-zero real Eisenstein series (§§7.1–7.2) and `d log v` in weight-two Eisenstein representations; unfold the cuspidal Rankin–Selberg integral (§7.12) with Schappacher–Scholl's Haar measures, where 5.1.0 gives `πiΓ(s + 1)/(4π)^{s−1}` times `[GL₂(ℤ̂) : ±K]` times a finite-adelic integral; at `s = 1`, 4.5.3 gives an algebraic local factor times `L(π, 2)L(π ⊗ χ, 1)/L(ω_πχ, 2)`, the denominator nonzero by absolute convergence; conclude with the functional equations, the Gauss-sum transformation and §7.30 over all embeddings. Divide by `2πi` only after Layer 2's normalisation comparison. The arithmetic `L`-normalisation has functional equation `s ↦ 2 − s`, and `π̌` is the contragredient (GL2AutomorphicRepresentationsAndTransfer R16.2 and R16.5 for the local and global theory).

**Checks.** At `s = 1` the analytic prefactor is `πi` times the congruence index; changing a period by a nonzero algebraic scalar leaves the line unchanged.

### 7.32 Non-vanishing after a change of level

For each such `π` there are a finite level `K`, `ω ∈ V_π^K` and rational modular units `u, v` with `∫ log|u| conj(d log v) ∧ ω ≠ 0`; `K` is chosen after the auxiliary character and local test vectors and need not be the original level. After the correction of §7.29 this gives a nonzero compact regulator in `P_K`. The auxiliary character: Shimura's Theorem 2 and the remark after it give nonzero odd twists at a prime `p` away from a prescribed `M` and then at `q` away from `pM`; their product is primitive even of conductor `pq`, distinct from `1` and from `ω_π^{−1}` when `M` contains the level and the central-character conductor (Shimura 1977, Theorem 2, pp. 212–213, and the remark, pp. 213–214), and §7.30 transports non-vanishing to every coefficient embedding. At bad primes use compactly supported Kirillov vectors with local integral `1`, at good primes spherical vectors (Schappacher–Scholl, 4.5.4, p. 14); subtract the `(1, 1)`-Eisenstein component, whose integral vanishes by the nontrivial central character `χω_π`, to reach degree zero; then apply Manin–Drinfeld and §7.29 (Schappacher–Scholl, 1.3.2(ii) and 6.0–6.1.1, pp. 6 and 17). No primitivity at a fixed modulus appears; for `χ = ω_π^{−1}` the cancellation fails and is excluded.

### 7.33 The isotypic regulator image and the rational structure

For every `K` and every occurring `π`, `e_{π̌} r_D(P_K ⊗ ℚ̄) = L′(π̌, 0)·c⁺(π)·Hom_{ℚ̄}(V_π^K, ℚ̄)` inside the corresponding real Betti component; if `dim V_π^K = m > 1` this is an `m`-dimensional period subspace, not a single newform line (Schappacher–Scholl, 1.2.6–1.2.9, p. 5). Period inclusion at all levels (§7.31) and transfer/pull-back adjointness give one inclusion; the nonzero pairing at a finer level (§7.32) and Hecke stability make the image a nonzero invariant submodule, and irreducibility of the finite-level Hecke module with transfer adjointness give equality; the projector is `π̌`, not `π`, and oldform multiplicities are kept (GL2AutomorphicRepresentationsAndTransfer R16.4; ModularCurvesPartII §§4.1–4.5, 6.2–6.3, 8.4). Summing over a coefficient field that splits the Hecke algebra, `r_D(P_K)` is a `ℚ`-structure on `H²_D(X_{K/ℝ}, ℝ(2)) = H¹_B(X_{K/ℝ}, ℝ(1))`, whose real span is the whole space of dimension `g`, the sum of the genera of the components (Schappacher–Scholl, 1.1.2(i) and 1.2.4–1.2.9, pp. 3–5; §7.10 for the real structure). This is a statement about the regulator image, not about finite generation or injectivity on rational `K₂`.

**Checks.** A level at which `π` has two independent oldvectors gets a two-dimensional image; for genus zero the image is the zero-dimensional rational structure (degenerate case); for `X₀(11)`, `Q_K` has zero regulator but `P_K` a one-dimensional image.

### 7.34 Beilinson's determinant formula for modular curves

In the determinant line of `H¹_B(X_{K/ℝ}, ℝ(1))`,

```text
det_ℚ r_D(P_K) = L^{(g)}(H¹(X_K), 0) · det_ℚ H¹_B(X_{K/ℝ}, ℚ(1))
```

as rational lines (modulo `ℚ^×`), `L^{(g)}` the `g`-th derivative at `0` (the leading Taylor coefficient differs by `g!` and gives the same line), `g` the total genus (Schappacher–Scholl, 1.1.2(ii) and 1.2.2–1.2.6, pp. 3–5). Take determinants in §7.33 with multiplicities `m(π, K)`, compare Betti and automorphic period determinants, and use `L(H¹(X_K), s) = Π_π L(π, s)^m` with all finite Euler factors (ModularCurvesPartII §17.2); each factor has a simple trivial zero at `0`; coefficient conjugation permutes `π` and `π̌` with equal multiplicities, so the product is rationally defined. The weight-two arithmetic normalisation is used, not the unitary `s ↦ 1 − s`. For `g = 1` derivative and leading coefficient coincide; for `g = 0` the empty determinant is `ℚ`.

### 7.35 Normalised reduction of a modular unit

On the regular full-level model at `p` of level `n = mp^k`, `m ≥ 3`, `p ∤ m` (ModularCurvesPartII §11.4), let `C` be a component of the bad fibre with `e_C = ord_C(p) > 0`. For a modular unit `u` define `normalizedUnitReduction p u = u_C`, the residue of `u^{e_C}/p^{ord_C(u)}`, of valuation zero; it is independent of the uniformiser and is a unit on the ordinary locus (Schappacher–Scholl, 7.2.3–7.2.4, p. 19). The tame boundary `∂_C{u, p}` agrees up to the conventional sign, which dies after rationalisation. As algebra: for groups `F^×`, `κ^×`, a valuation `v : F^× → ℤ` and an angular component `ac : F^× → κ^×`, `u_C = ac(u)^{v(p)}/ac(p)^{v(u)}`. Provide `normalizedUnitReduction_mul`, `normalizedUnitReduction_inv`, `normalizedUnitReduction_zpow`, `normalizedUnitReduction_orderZero` (`v(u) = 0` gives `ac(u)^{v(p)}`), `normalizedUnitReduction_multiplyBase` (`u·p^a` has the same reduction; in the Lean file `normalizedUnitReduction_mul_zpow`) and `normalizedUnitReduction_changeAngular` (replacing `ac(x)` by `ac(x)·t^{−v(x)}` leaves it unchanged: change of uniformiser). The correction exponent is `e_C`, not `1`.

**Checks.**

- `u_C(p) = 1` (degenerate case).
- `v(p) = 1`, `v(u) = 0`: the reduction is `ac(u)`, the usual residue.
- `v(p) = 2`, `v(u) = 0`, `κ = ℚ`, `ac(u) = 2`: the reduction is `4`, not `2` (non-example for exponent `1`).
- Multiplying `u` by `p³` does not change the reduction, even when `v(u) ≠ 0`.

### 7.36 Uniform supersingular orders

On the same model, the orders of `u_C` at the supersingular points of each component `C` are all equal, for the divisor pulled through the finite component map of 7.2.3 with its ramification multiplicities. The cusp divisor of `u` lies in an Eisenstein Hecke module (KatoEulerSystems §§0.1–0.5, §7.6); the supersingular divisor modulo component constants is cuspidal with local representation `sp(1)` at `p` (7.1.1); Hecke separation forces the image of the unit-divisor module there to vanish, so the supersingular content lies in the component-constant subspace `ℚ[S]` (Schappacher–Scholl, 7.1.1 and 7.2.5, pp. 18–19; ModularCurvesPartII §11.4 and ModularCurvesPartII §17.2). Uniformity is per component; the quotient by `ℚ[S]` cannot be omitted.

### 7.37 Integrality at full level

For a full level `n` divisible by two coprime factors each at least `3`, every class of `Q_n` lies in the integral rational weight-two part `im(K₂^{(2)}(X(n)/ℤ) → K₂^{(2)}(X(n)))`; every vertical boundary of a horizontally compact combination of modular-unit symbols vanishes after tensoring with `ℚ` (Schappacher–Scholl, 7.3.0–7.3.2, especially the proof of 7.3.1 printed after 7.3.2, pp. 19–20). At `p ∤ n` the special fibre is proper smooth over a finite field, whose weight-one `K₁` is its global units tensored with `ℚ`, hence zero. At `p | n`, write `n = mp^k`; the horizontal/vertical residue square 7.3.0 gives the vertical boundary zero cusp orders, §7.36 makes its supersingular orders uniform, total degree zero forces them to vanish, the boundary extends to a unit on each complete normalised component, and the finite constant field makes it torsion. Arithmetic-surface localisation with codimension-two terms and Adams weights (SchemeKTheoryOperations §§3.3, 3.6–3.7 and S.6) lifts to the integral part. Small levels are reached by refinement and transfer; no assertion says every modular unit is integral at every bad prime.

### 7.38 Integrality of the Beilinson subspace

For every open compact `K`, `P_K ⊂ im(K₂^{(2)}(X_K/ℤ) → K₂^{(2)}(X_K)) ⊗ ℚ`, independently of the regular proper model (Schappacher–Scholl, 1.1.2(iii), deduced in 7.3.2 by graph correspondences, pp. 3 and 19–20). Refine a finite-level witness to a full level with the coprime-factor hypothesis and apply §7.37; extend the level map by a resolved regular graph (ModularCurvesPartII SchemeKTheoryOperations §§3.7, 5.7–5.8), pull back a model lift, push it forward in total `K₂` (or `G₂ = K₂` by regularity), identify the restriction with the curve transfer by flat base change, and project to weight two (SchemeKTheoryOperations §§2.1–2.6 for pullback, proper pushforward, the Cartan equivalence and base change; S.6 for the weight decomposition); divide by the covering degree. For two regular proper models choose a common regular model over both. The integral Manin–Drinfeld shortcut is false — the function `Δ(pz)/Δ(z)` is a counterexample at the bad primes (Schappacher–Scholl, 7.4, p. 20) — and is not used.

### 7.39 The elliptic image of Beilinson classes

Given a nonconstant `ℚ`-morphism `φ : X_K → E` to an elliptic curve `E/ℚ`, define `ellipticBeilinsonSubspace = P_{E,φ} = φ_*(P_K) ⊂ K₂^{(2)}(E) ⊗ ℚ`, Mathlib's `Submodule.map` of `P_K` under the proper transfer of EllipticKTheory §§5.1–5.3. No surjectivity or injectivity of `φ_*` is assumed. Provide `ellipticBeilinsonSubspace_mem`, `ellipticBeilinsonSubspace_id`, `ellipticBeilinsonSubspace_comp`, `ellipticBeilinsonSubspace_zero` (simp), `ellipticBeilinsonSubspace_regulator` (if `r_B ∘ push = t ∘ r_A` then `r_B(P_{E,φ}) = t(r_A(P_K))`) and `ellipticBeilinsonSubspace_integral` (if `P ≤ I_A` and `push(I_A) ≤ I_B` then the image lies in `I_B`) (Schappacher–Scholl, 1.2.9 for adjointness and 1.1.2 applied to an elliptic quotient, pp. 3 and 5). Its nonzero regulator is §7.41; it does not follow from the norm of an individual symbol.

**Checks.** The identity push on `ℚ²` keeps a one-dimensional submodule; the zero push gives `0` (degenerate case); the first-coordinate projection `ℚ² → ℚ` maps `span{(0, 1)}` to `0` despite its nonzero generator (non-example); multiplication by `3` on `ℚ` has full image.

### 7.40 Regulator adjointness and rational descent on `E`

For a finite `ℚ`-map `φ : X_K → E` and a compact rational weight-two class `ξ`, `⟨r_E(φ_*ξ), ω_E⟩ = ⟨r_{X_K}(ξ), φ^*ω_E⟩` for the real Deligne regulator in one normalisation on both curves: Deninger–Scholl construct the regulator with supports and prove proper covariance `r_E φ_* = φ_* r_X`, with no degree or Tate shift in relative codimension zero (Deninger–Scholl, "The Beilinson conjectures", author preprint, (1.3)(1), (2.6)–(2.8), pp. 2 and 6–8), and Poincaré duality pairs cohomological pushforward with form pullback; Layer 2 converts to Brunault's explicit pairing. For a finite Galois `F/ℚ`, an invariant pushed class `β_F ∈ K₂(E_F) ⊗ ℚ` descends as `β = Norm(β_F)/[F : ℚ]` with `res(β) = β_F` (EllipticKTheory §§7.1–7.9; Deninger–Scholl, (1.3)(6)). No nonzero-regulator conclusion is drawn from the unweighted trace of a single non-invariant character class: a class with `σβ = −β` has trace zero. For integral classes use the resolved regular graph of §7.38. The identity map gives equality with no factor `2` and no degree.

### 7.41 Beilinson's theorem for a modular elliptic curve

Let `E/ℚ` have conductor `N` and `φ : X₀(N) → E` a nonconstant `ℚ`-parametrisation with `φ^*ω_E = c_φ·2πi f(z) dz`, `c_φ ∈ ℚ^×`, `f` the normalised weight-two newform with `L(f, s) = L(E, s)` including bad factors (EllipticCurveModularity R29.5–R29.6; the Tau Ceti carrier `HeckeRing.GL2.Newform`). Then `P_{E,φ}` lies in the integral rational part of `K₂(E)` and

```text
r_D(P_{E,φ}) = L′(E, 0) · H¹_B(E/ℝ, ℚ(1))    as rational lines in H¹_B(E/ℝ, ℝ(1));
```

for each nonzero rational Betti generator `b` there is an integral rational class `β` with `r_D(β) = L′(E, 0)·b`. With the modularity theorem this applies to every elliptic curve over `ℚ`; no claim is made about the dimension of `K₂(E) ⊗ ℚ`. Apply §7.33 to the rational newform component containing `φ^*ω_E ≠ 0`; §7.40 identifies the pushed image with the elliptic period line (pullback followed by pushforward on Betti cohomology is multiplication by `deg φ`); the elliptic motive factor and its rational Betti comparison give `L′(E, 0)` times the Betti `ℚ`-line (§7.34); §7.38 and the resolved-graph transfer give integrality; `L′(E, 0) ≠ 0` follows from the functional equation and `L(E, 2) ≠ 0` (§6.9) (Schappacher–Scholl, 1.1.2 and 1.2.6–1.2.9, pp. 3 and 5, specialised to an elliptic quotient; Schappacher–Scholl do not prove modularity, which is imported). No optimality or `c_φ = 1` is needed, and the primitive-even-same-level condition of §7.14 is never used. In the terms of §6.3, this is a conclusion of kind (2) for every `E/ℚ`, and with §6.13 its surjectivity half; the injectivity half of Beilinson's conjecture is not claimed.

**Checks.** For `E = X₀(11)`, same-level `Q_K` has zero regulator while `P_{E,φ}` gives the required nonzero line; replacing `ω_E` by a rational multiple changes `c_φ` and leaves the line unchanged; this is existence with transfers, not an explicit same-level formula for every conductor.

### Examples

- `X₁(11) = 11a3`: `L(E, 2) = (10/11)πD_E(P) = 0.546048036215013518334…`, `D_E(2P) = (3/2)D_E(P)`, `R = 0.58936464004658978237…`.
- `N = 5`, `χ = (·/5)`: `div u_χ = −(4/(25√5))(P₁ − P₂)`.
- `E*_{(0,0)}(i) = 2.58498175957925321706589358738…` at level one.

### Dependencies

Layers 2–4 and 6. ModularCurvesPartII §§3.14–3.15, 6.1, ModularCurvesPartII §§4.1–4.5, 6.2–6.3, 8.4, ModularCurvesPartII §§7.2–7.4, 9.1–9.2, 10.2, ModularCurvesPartII §11.4, SchemeKTheoryOperations §§3.7, 5.7–5.8, ModularCurvesPartII §§9.1, 13.1–13.4, ModularCurvesPartII §17.2 (modular curves, cusps and their Galois action, Hecke correspondences, regular models, degeneracy maps). KatoEulerSystems §§0.1–0.5, 1.1 (Siegel and modular units, the bilinear pair symbol). The Tau Ceti roadmap ModularForms, Layers 7–8 (newform `L`-functions, modular symbols). EllipticCurveModularity R29.5–R29.6. GL2AutomorphicRepresentationsAndTransfer R16.2, R16.4, R16.5. ModularSymbolsPadicLFunctions §§0.7–0.8, 1.1–1.2 (Manin symbols, Birch's formula, rationality of periods). NeronModelsAndSemistableAbelianVarieties §§1.11, 6.9 (Néron period). EllipticKTheory §§3.1–3.7, EllipticKTheory §§5.1–5.3, EllipticKTheory §§7.1–7.9. SchemeKTheoryOperations §§2.1–2.6, 3.3, 3.6–3.7, 6.8–6.11. K2SymbolsBrauer §§9.2–9.8, 10.24–10.27. AutomorphicLFunctionsAndLocalFactors AL.3. WeilConjectures WC.5. Polylogarithms §2.5 and PolylogarithmFunctions Layer 7 (certified numerics) and Polylogarithms §§5.13–5.15. Mathlib: `UpperHalfPlane`, `CongruenceSubgroup.Gamma1`, `ZMod.dft`, `gaussSum`, `ZMod.stdAddChar`, `DirichletCharacter.IsPrimitive`, `DirichletCharacter.LFunction`, `ModularForm.eta`, `Submodule.comap`, `Submodule.span`, `Submodule.map`, `Submodule.mem_iSup_of_directed`. Tau Ceti: `HeckeRing.GL2.Newform`.

## Layer 8: Worked examples and the p-adic comparison

This layer tests every normalisation of the roadmap on explicit classes, and fixes the order in which a `p`-adic Beilinson statement for an elliptic curve can be formulated. The syntomic regulator of a curve with good reduction and its comparison with Coleman integrals are PadicHodgeRegulators D.5's (with the étale side in D.2) and ColemanIntegration L1's; the `p`-adic `L`-function of an elliptic curve, its period lines and refinements are ModularSymbolsPadicLFunctions Layers 0–4's; symbol certificates, Bloch's correction, transfers of certified classes and the arithmetic-integral certificates are EllipticKTheory Layers 6–8's. What is built here is the elliptic specialisation: explicit certified classes over `ℚ` and `ℚ(√−3)` with their regulators, the Frobenius-normalised `p`-adic regulator scalar, and the weight-two `p`-adic Beilinson relation stated as a conjecture. No `p`-adic statement is asserted as a theorem, and no object of this layer enters Layers 5–7.

### 8.1 A normalisation check on the projective line

On `ℙ¹_ℂ` with coordinate `z`, for every path `γ` in `ℂ − {0, 1}` from `a` to `b`, `∫_γ η(z, 1 − z) = D(b) − D(a)`, with `η` the form of §2.4 and `D` the Bloch–Wigner function (PolylogarithmFunctions Layers 1, 4–5, whose differential is `dD(z) = η(z, 1 − z)`). For `γ` the segment from `1/2` to `e^{iπ/3}`, `∫_γ η(z, 1 − z) = D(e^{iπ/3}) = 1.0149416064096536250212025542745…`. Equivalently, on any compact Riemann surface `X` and `f ∈ ℂ(X) − {0, 1}`, `log|f| · ω ∧ ∂̄ log|1 − f| = (i/2) d((D ∘ f + i log|f| log|1 − f|)ω)`, so `r_X({f, 1 − f}) = 0`; and `⟨r_X({f, g}), ω⟩ = −(i/2)∫_X ω ∧ η(f, g)` relates the two regulator formulas of Layers 2 and 7 (Brunault, thesis, Lemme 15 and (1.26), p. 19; (3.106), p. 100; (3.110), p. 101). A factor or sign error in `η` or in the regulator shows up here. The regulator of a symbol on `ℙ¹` itself is zero (`Ω^{1,0}(ℙ¹) = 0`), and a symbol on `ℙ¹_ℚ` with trivial tame symbols comes from the torsion group `K₂(ℚ)`; so the check is an identity of forms and path integrals, not a regulator value.

### 8.2 Bloch's CM class on `y² = x³ + 1`

Take `E : y² = x³ + 1` (36a1), with CM by `ℤ[ζ₃]`, conductor `36 = 3·N(f)` with `f = 2√−3`, so `C = fg = 6` with `g = −√−3` in Layer 5's notation. The class `U` of §5.9 is built from Bloch's `S_a` at the six-torsion points over a field containing `E[6]` (the points of order six are not all rational) and descended to `ℚ`. The example exhibits: (i) the divisors, uniformisers and leading units of every function in `U`, and a certificate of vanishing tame symbols in EllipticKTheory §§7.1–7.9's format with K2SymbolsBrauer's tame-symbol convention (§8.3); (ii) the regulator of `U` by the divisor formula (§4.2); (iii) Layer 5's identity with all its constants (§8.4) (Brunault, thesis, §0.5, p. 11, for the statement instantiated). Numerical targets, not proofs: `L(E, 2) = 0.94001300738822578150…`, `L′(E, 0) = 0.85718907492991773072…`; with the orientation `∫_{E(ℝ)} dx/(2y) > 0` and `P = (2, 3)` of order six, `D_E(P) = −0.44882315008954339…`, `D_E((2ζ₃, 3)) = 0.22441157504477169… = −D_E(P)/2`, and `L(E, 2) = −(2/3)πD_E(P) = (4/3)πD_E((2ζ₃, 3))` to 19 digits. Any assertion of arithmetic integrality needs EllipticKTheory §§6.1–6.10's model and vertical certificate in addition to the generic-fibre certificate.

### 8.3 The full six-torsion certificate on 36a1

Let `κ = ℚ(√−3)`, `τ = (1 + √−3)/2` and `L = κ(E[6])`. In `L(E)` put `ψ₆ = 6xy(x³ + 4)(x³ − 8)(x⁹ + 228x⁶ + 48x³ + 64)` and `ρ = 1/ψ₆`, so `div(ρ) = 35[O] − Σ_{b∈E[6]−O}[b]`; `ψ₆` is the evaluation of Mathlib's division polynomial `WeierstrassCurve.Ψ` (with `preΨ_even` and `CoordinateRing.mk_ψ`), and Tau Ceti's `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `evalEval_ψ_eq_zero_of_zsmul_eq_zero` and `zsmul_fromAffine_eq_zero_iff` pass to affine six-torsion; its factors have simple zeros on the curve and its pole order is `35`, not `36`. For each nonzero `b ∈ E[6]` let `f_b` be the Miller function with `div(f_b) = 6[b] − 6[O]` and leading coefficient `1` at `O` for `t_O = −x/y`, computed by the chain `f₁ = 1`, `f₂ = h_{b,b}/v_{2b}`, `f₃ = f₂ h_{2b,b}/v_{3b}`, `f₆ = f₃² h_{3b,3b}/v_{6b}` (with `v_O = 1`, `h_{P,Q} = v_P` when `P + Q = O`, `h_{O,P} = h_{P,O} = v_P`, `h_{O,O} = 1`), so that `div(h_{P,Q}/v_{P+Q}) = [P] + [Q] − [P + Q] − [O]` by the line intersection formula (Tau Ceti's `WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity` supplies existence; this is the explicit instance). For each chosen `a`, `c_{a,b} = tame_b{ρ, f_a}` is `f_a(b)` for finite `b ≠ a`, `r_a⁶u_a` at `a` (`r_a`, `u_a` the leading units of `ρ` and `f_a` in the local parameter `t_b = x − x_b` if `y_b ≠ 0`, `t_b = y` if `y_b = 0`), and `6⁶` at `O` (where `ρ` has leading coefficient `−1/6`). Set `S_a = (6{ρ, f_a} + Σ_{b≠O} {f_b, c_{a,b}})/6`; each numerator has tame value `1` at every point, including `O` by reciprocity over the fully split field (`c_{a,O} Π_{b≠O} c_{a,b} = 1`). For Layer 5 the three `a` are the images under the fixed CM uniformisation of `1/6`, `(5 + 4τ)/6`, `(3 + 2τ)/6`; summing these `S_a` and descending by `N/[L : ℚ]` gives exactly the `U` of §5.9 in rational `K₂` (EllipticKTheory §§7.1–7.9 choice independence and rational descent). The certificate specifies all 35 finite rows for each `a`; `L` must contain all six-torsion points, the quadratic field alone does not suffice; the uniformisation's algebraic-coordinate dictionary is ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2, 2.2's.

**Checks.** `ψ₆` has pole order `35`; at `O` the uncorrected residue is `6⁶` and the corrected one is `1`; the three index points come from Layer 5, and the quadratic class of §8.6 is not a substitute for `U` (non-example).

### 8.4 The L-value identity on 36a1

For `U` on `y² = x³ + 1`, with `f = 2√−3`, `g = −√−3`, `C = 6`, `y² = (Im τ)² = 3/4` and the dual-first transform of §5.2, `χ̂(ḡ)g = 3`, so by §5.15

```text
L(E, 2) = (π/(324 i)) · R_q(U) = (2π/3) Σ_{a} D_E(a),     R_q(U) = i·6³·Σ_a D_E(a),
```

the sums over the three index points of §8.3. There is no factor `|μ_κ| = 6`. The reduction of this three-point sum to the observed one-point identity `L(E, 2) = −(2/3)πD_E((2, 3))` requires an explicit point and distribution identity, which is a target here and is not inferred from decimal agreement. The regulator is Bloch's `R_q`; translating to the Beilinson period coordinate uses Layer 2. No `p`-adic statement about `U` follows.

**Checks.** The complex scalar is `π/(324i)`; the sum has three index points, not the 35 nonzero torsion points and not the rational points; a formula with an extra factor `|μ_κ| = 6` gives `6·L(E, 2)` (non-example).

### 8.5 A non-rational torsion point and the trace formula

On `y² = x³ + 1` the point `T = (2ζ₃, 3)` of order six is defined over `L = ℚ(√−3)`, with conjugate `T′ = (2ζ₃², 3)`. A class `β ∈ K₂(E_L)` supported on `{O, T, T′, (2, 3), (0, ±1), (−1, 0)}` with trivial tame symbols over `L`, pushed to `ℚ` by `N_{L/ℚ}`, tests: (i) the tame symbols of `Nβ` over `ℚ` are the residue-field norms of those of `β` (EllipticKTheory §§7.1–7.9, with the non-rational residue computation of EllipticKTheory Layer 8 on the same curve as model); (ii) the trace formula of §4.18: `r(Nβ)` at the complex place of `ℚ` equals the sum of `r(σβ)` over the two embeddings of `L`. The values `D_E(T) = D_E(T′) = 0.22441157504477169… = −D_E((2, 3))/2` enter through the divisor formula. Since `L/ℚ` is quadratic the norms are not the identity. §§8.6–8.8 give the explicit class (Brunault, thesis, Corollaire 37, p. 40, for the geometric compatibility; the constant-field trace formula is §4.18).

### 8.6 An explicit corrected symbol at a quadratic torsion point

Let `L = ℚ(ζ)`, `ζ² + ζ + 1 = 0`, `T = (2ζ, 3)`, `A = (0, 1)`, `B = (0, −1)`; then `2T = A`, `3T = (−ζ, 0)`, `6T = O`, `B = −A`. Put `ℓ = y − 2ζ²x + 1`, `m = y − ζ²x − 1`, `f_T = ℓ²m²/((ζ²x)²(ζ²x + 1))`, `f_A = (y − 1)²`, `f_B = (y + 1)²`, with divisors `div ℓ = 2[T] + [B] − 3[O]`, `div x = [A] + [B] − 2[O]`, `div f_T = 6[T] − 6[O]`, `div f_A = 6[A] − 6[O]`, `div f_B = 6[B] − 6[O]` (substituting the tangent line gives `(2ζ²x − 1)² − x³ − 1 = −x(x − 2ζ)²`, the secant `−x(x − 2ζ)(x + ζ)`). Set `c_T = 1/(4ζ²)`, `c_A = 2`, `c_B = 2ζ²` and

```text
quadraticSymbol = β = 6{ℓ, x} + {f_T, c_T} + {f_A, c_A} + {f_B, c_B}.
```

With `tame_P{f, g} = (−1)^{ord f·ord g}(f^{ord g}/g^{ord f})(P)`, the uncorrected `6{ℓ, x}/6` has values `c_T, c_A, c_B, 1` at `T, A, B, O` (at `B`, `ℓ/x` has leading value `−2ζ²` and the sign gives `+2ζ²`); `c_T c_A c_B = 1`, so the corrected `β` has value `1` at every place and defines a class of `K₂T(E_L)`, hence a unique rational `K₂(E_L)` lift (EllipticKTheory §§3.1–3.7). Its raw representative is an element of Mathlib's `FreeAbelianGroup` on pairs of units of the function field (`WeierstrassCurve.Affine.FunctionField`, with Tau Ceti's `genericX`, `genericY` and `TauCeti.Divisor.principal`); the symbol quotient and certificate map are EllipticKTheory §§7.1–7.9's. Provide `quadraticFunctionT_val`, `quadraticFunctionA_val`, `quadraticFunctionB_val`, `quadraticFunctionT_principal` (its Tau Ceti principal divisor is `6[T] − 6[O]`), `quadraticSymbol_expand`, `quadraticSymbol_map` (for every additive homomorphism out of the free group, the value is six times the first generator's plus the three correction values) and `quadraticSymbol_certified`. The four-row certificate (uniformisers `x − 2ζ` at `T`, `x` at `A` and `B`, `−x/y` at `O`) records `(order, leading unit)` of `ℓ, x, f_T, f_A, f_B`: at `T` `(2, ζ/3), (0, 2ζ), (6, 1/108), (0, 4), (0, 16)`; at `A` `(0, 2), (1, 1), (0, 4), (6, 1/4), (0, 4)`; at `B` `(1, −2ζ²), (1, 1), (0, 16), (0, 4), (6, 1/4)`; at `O` `(−3, −1), (−2, 1), (−6, 1), (−6, 1), (−6, 1)`. Unramifiedness is horizontal; a global arithmetic-integral certificate is a separate EllipticKTheory Layers 6–7 obligation.

**Checks.**

- The principal divisor of `f_T` is `6[T] − 6[O]`; existence of some such function does not certify this formula.
- `T`-row: `{ℓ, x} ↦ c_T`, `{f_T, c_T} ↦ c_T^{−6}`, the others `↦ 1`; the corrected value is `1`.
- `B`-row: `{ℓ, x} ↦ 2ζ²`, `{f_B, 2ζ²} ↦ (2ζ²)^{−6}`; the uncorrected value is `2ζ²`, not `−2ζ²`.
- `O`-row: `c_T⁶c_A⁶c_B⁶ = 1`.
- Non-example: the uncorrected `{ℓ, x}` has `T`-value `c_T = 1/(4ζ²) ≠ 1`.

### 8.7 The quadratic transfer and its certificate

For `β̄` the conjugate of `β`, in `K₂(ℚ(E)) ⊗ ℚ`,

```text
N_{L/ℚ} β = γ = 6{H, x} + {F, 1/4} + {f_A, 4} + {f_B, 4},
H = (y + 1)² + 2x(y + 1) + 4x² = ℓℓ̄,   J = (y − 1)² + x(y − 1) + x² = m m̄,   F = H²J²/(x⁴(x² − x + 1)) = f_T f̄_T,
```

a rational identity: rewriting `c_T = ζ/4` and `c_B = 2ζ²` discards symbols with a root-of-unity entry, killed by `3`. `div H = 2[T] + 2[T̄] + 2[B] − 6[O]` and `div F = 6[T] + 6[T̄] − 12[O]`. At the `ℚ`-closed point `Z = (x² + 2x + 4 = 0, y = 3)`, with `x₀ = 2ζ` in its residue field `ℚ(ζ)` and uniformiser `x − x₀`, the tame value of `{H, x}` is `1/x₀² = 1/(4ζ²)`, not its norm `1/16`; its sixth power `(1/4)⁶` cancels `{F, 1/4}`. At `A` and `B` the uncorrected value is `4`, cancelled by the order-six corrections; at `O` the value is `(1/4)^{12}·4⁶·4⁶ = 1`. Thus `γ` has an exact horizontal certificate over `ℚ`; the integral transfer `Nβ` is certified by EllipticKTheory §§7.1–7.9's transfer of certified classes, and no equality of integral representatives is asserted (EllipticKTheory §§7.1–7.9 projection formula and root-of-unity torsion; EllipticKTheory Layer 8's non-rational residue model).

### 8.8 The regulator trace of the quadratic class

With the diamond convention of §4.1 and `R_q = J + iD_q`, `r(ξ)(dz) = ½ conj(R_q(◇ξ))` (§4.2). For `ℓ` and `x` the diamond is `7[O] + 2[T] − 5[2T] + 2[3T] − 2[4T] − 4[5T]`; since `2T = A`, `4T = −A`, `5T = −T` and `3T` is two-torsion, its odd evaluation is `6R_q(T) − 3R_q(A)`. Constant-entry corrections have zero regulator, so `r(β)(dz) = 18 conj R_q(T) − 9 conj R_q(A)`, and by §4.18 `r(Nβ)(dz) = 18 conj(R_q(T) + R_q(T̄) − R_q(A))`. For the rational transferred class and the real-adapted differential the real part vanishes, so `r(Nβ)(dz) = −18i(D_E(T) + D_E(T̄) − D_E(A))`. The full complex identity precedes the imaginary simplification; neither value is identified with the Néron-cycle coordinate without Layer 2's factor `2` and period conversion.

**Checks.** The coefficient of `D_E(T) + D_E(T̄) − D_E(A)` is `−18i`; reversing the diamond convention reverses the sign (non-example); `r(β)` is not replaced by its imaginary part before the trace.

### 8.9 An integral class on `X₁(11)`, and an unramified non-integral class

(a) On `E = X₁(11) : y² + y = x³ − x²` (11a3), `P = (0, 0)` of order five, `(x) = [P] + [4P] − 2[O]` and `(y) = 2[P] + [3P] − 3[O]` (modular units supported on the cusps). The class `ξ = {x, y} + {−1, x}` has trivial tame symbols and is integral on the minimal model (EllipticKTheory Layer 8: the fibre at `11` is split `I₁`). With `ω = (dx/(2y + 1))/Ω⁺`, `Ω⁺ = ∫_{E(ℝ)} dx/(2y + 1) = 6.3460465213977671…` and the orientation making `Ω⁺ > 0`,

```text
r_E(ξ)(ω) = (i/2) Σ ord_a(x) ord_b(y) D_E(a − b) = −(i/2) D_E((x) ◇ (y)) = −(5i/4) D_E(P)
          = −(11i/(8π)) L(E, 2) = −(πi/2) L′(E, 0) = −0.23899217135541461969… i,
```

where `(x) ◇ (y) = 8[O] − 7[P] + 3[2P] − 2[3P] − 2[4P]` and `D_E((x) ◇ (y)) = 5(D_E(2P) − D_E(P)) = (5/2)D_E(P)`, using §7.24 and `L′(E, 0) = 11L(E, 2)/(4π²)` (root number `+1`, §6.9) (Brunault, thesis, Proposition 17, (1.29), p. 19; Proposition 26, (1.64), p. 26). So `ξ` is a nonzero integral class with an explicit rational regulator-to-`L`-value ratio. Direct integration of `∫ log|x| ω ∧ ∂̄ log|y|` over the period parallelogram gives `−0.2389921521i` on an 800 × 800 grid (`−0.23899186i` at 200, `−0.23899209i` at 400). (b) On `y² = x(x + 1)(x + 1/9)` the certified class of EllipticKTheory Layer 8 is unramified on the generic fibre but no nonzero multiple is integral (a vertical tame value of infinite order at a component of the `I₄` fibre at `3`); only the rational statement may be quoted for it (§6.4).

### 8.10 Conductors 14, 35 and 54

For `E_k : y² + kxy + y = x³` (`k = −1, −2, −3`; isomorphic to 14a4, 35a3, 54a3) and `A = (0, 0)` of order three, `(x) = (A) + (−A) − 2(O)` and `(y) = 3(A) − 3(O)`; the tame symbols of `{x, y}` at `O, A, −A` are `1, −1, −1`, so `{x, y} ∈ K₂(E_k) ⊗ ℚ`, and its regulator is a rational multiple of `D_E(A)` by the divisor formula. Brunault proves `L(E_{−1}, 2) = (9π/7)D(A)`, `L(E_{−2}, 2) = (36π/35)D(A)` and `L(E_{−3}, 2) = (2π/3)D(A)`, with the orientation making `∫_{E(ℝ)} dx/(2y + kx + 1) > 0`, through modular-unit expressions of `x` and `y` (Brunault, "Regulators of Siegel units and applications", arXiv:1504.08127v1, §5.1, Theorem 24, p. 13, and the class on p. 12). Level `14` is out of reach of §7.14, which needs a primitive character modulo the level.

**Checks.** `L(E_{−1}, 2) = 0.64147133708796867992…`, `D(A) = 0.15881185312116081245…`, ratio `9/7`; `L(E_{−2}, 2) = 0.94932492663132852534…`, ratio `36/35`; `L(E_{−3}, 2) = 0.84677583812591668994…`, ratio `2/3`, each to at least 19 digits.

### 8.11 Integrality and admissibility of the examples

On `E₁₁ : y² + y = x³ − x²`, the class `ξ` of §8.9 has a rational lift and an arithmetic-integral certificate on the regular minimal proper model over `ℤ`: the discriminant is `−11`, the fibre at `11` is split `I₁` and irreducible, and `x`, `y` have vertical order zero (EllipticKTheory §§6.1–6.10 vertical residues, EllipticKTheory §§7.1–7.9 integral certificates). So `ξ` is an admissible integral input at every good `p > 2`, `p ≠ 11`, subject to the eigenline and period conditions of §§8.14–8.16; its complex regulator on the period-one differential `ω₀ = (dx/(2y + 1))/Ω⁺` is `−(11i/(8π))L(E₁₁, 2) = −(πi/2)L′(E₁₁, 0)` (evaluating on `dx/(2y + 1)` multiplies it by `Ω⁺`). In contrast the class on `y² = x(x + 1)(x + 1/9)` has the vertical residue `1/w` of infinite order on the component `V = 0` at `3` of EllipticKTheory Layer 8's model, so no nonzero rational multiple lies in the global integral part; a regulator can be evaluated locally at a good prime without making it a witness for the global conjecture. The quadratic `β` and the CM class `U` need an independent vertical certificate for any global integral claim. Good primes exclude `11` for `E₁₁` and `2, 3` for 36a1.

### 8.12 The `p`-adic side: suppliers and order of definitions

Let `E/ℚ` have good reduction at `p`. PadicHodgeRegulators D.5 constructs the syntomic regulator `reg_p : K₂(E) ⊗ ℚ → H¹_dR(E/ℚ_p)` of a smooth proper curve with good reduction and compares it on symbols with Coleman integrals (ColemanIntegration L1). For the classes of this roadmap — supported on torsion points (Layer 4) or pushed from modular units (Layer 7) — `⟨reg_p(ξ), ω⟩` is expressed by the same finite combinatorics as the divisor formula, with the complex elliptic dilogarithm replaced by its Coleman counterpart; §8.13 states the formula on symbols. A `p`-adic Beilinson statement is formulated only after its ingredients are defined: the `p`-adic `L`-function of `E` with its `p`-stabilisation and Euler factors (ModularSymbolsPadicLFunctions L2), the period normalisation (L1) and the exceptional factors at `p`; good reduction alone does not identify the ordinary and supersingular theories. Bad or semistable reduction needs the logarithmic input that D.5 names and is not treated. The real-regulator theorems of Layers 5–7 use none of this.

### 8.13 The Coleman formula for the elliptic syntomic pairing

Let `K/ℚ_p` be finite, `p > 2`, `X/𝒪_K` a smooth proper elliptic model with generic fibre `E`, and fix a branch of the `p`-adic logarithm. Let `u ∈ K₂(X)^{(2)} ⊗ ℚ` restrict to `K(E)` with a finite presentation `Σ_i n_i{f_i, g_i}`, `n_i ∈ ℚ`, all horizontal tame symbols trivial. For every holomorphic differential `η` on `E`,

```text
Tr(reg_syn(u) ∪ η) = Σ_i n_i Σ_P ord_P(f_i) · Tr_{K(P)/K}(CT_P(∫ log(g_i) η)),
```

where `CT_P` is the log-free constant term of a Coleman primitive in a local parameter, computed after a finite extension; it does not depend on the parameter (integrating `tⁿ log t` produces a factor `t^{n+1}`), and the degree-zero divisor removes the additive constant (Besser–de Jeu, "The syntomic regulator for K₄ of curves", arXiv:1208.0516v1, Introduction, Remark 1.10, p. 4, restating the `K₂` formula of Coleman–de Shalit, with the conventions on pp. 3–4). This specialises the D.5 symbol comparison to elliptic symbols with EllipticKTheory §§7.1–7.9 certificates (EllipticKTheory §§6.1–6.10 for the good-reduction extension of rational unramified classes); closed points enter through the residue-field trace, not one chosen conjugate. It determines the pairing with holomorphic `η`, not the whole two-dimensional de Rham vector. On `ℙ¹` the Steinberg symbol `{z, 1 − z}` is zero, and its proper-curve syntomic regulator is zero, although a based dilogarithm primitive on the punctured line need not vanish; two presentations of one symbol give the same pairing.

### 8.14 The Frobenius-normalised regulator scalar

For any field `K`, a `K`-vector space `H`, a bilinear form `B` on `H`, `ω, v, r ∈ H` and `p, γ ∈ K`, define

```text
frobeniusRegulatorScalar p γ B ω v r = (1 − p/γ) · B(r, v)/B(ω, v).
```

The formula is total, but its geometric use requires `γ ≠ 0` and `B(ω, v) ≠ 0`; division at zero is not an admissible period coordinate. In the elliptic case `H = H¹_dR(E/K)`, `B = Tr(∪)`, `r = reg_syn(ξ)`, `ω` the Néron differential, `p > 2` prime to the conductor, `γ` a root of `X² − a_pX + p`, `v ≠ 0` with `Φv = γv`, and `Φ(ω) ≠ γω` (Asakura–Chida, "A numerical approach toward the p-adic Beilinson conjecture for elliptic curves", accepted manuscript, §3.4, the definition before Conjecture 3.3, at `n = 0`, where `Γ*(−n) = 1`). Provide `frobeniusRegulatorScalar_eq`, `frobeniusRegulatorScalar_zero` (simp), `frobeniusRegulatorScalar_add`, `frobeniusRegulatorScalar_smul`, `frobeniusRegulatorScalar_scale_eigenvector` (for `c ≠ 0` and `B(ω, v) ≠ 0`, replacing `v` by `cv` leaves the total algebraic scalar unchanged; geometric use also requires `γ ≠ 0`) and `frobeniusRegulatorScalar_scale_differential` (replacing `ω` by `cω` multiplies it by `c^{−1}`, the same scaling as the Néron-normalised period of the `p`-adic `L`-function).

**Checks.**

- Over `ℚ²` with `B((a, b), (c, d)) = ad − bc`, `p = 5`, `γ = 2`, `ω = (1, 0)`, `v = (0, 1)`, `r = (3, 0)`: the scalar is `−9/2`.
- With the same data and `r = 0` the scalar is `0` (degenerate case).
- With `v = (0, 7)` the scalar is still `−9/2`.
- Non-example: for that `B` and `ω = v = (1, 0)`, `B(ω, v) = 0`; the coordinate is inadmissible even though the total field expression is `0`.

### 8.15 The Frobenius correction in the comparison

Let `E/ℚ` have good reduction at `p > 2`, extend its linear untwisted crystalline Frobenius (eigenpolynomial `X² − a_pX + p`) and the cup pairing from `H¹_dR(E/ℚ_p)` to a coefficient field containing `γ`, and let `Φ` be the extended operator under D.5's identification of the syntomic target with this space; let `z = log_BK(reg_ét(u))` (D.2 for the étale regulator and the Bloch–Kato logarithm). Then `reg_syn(u) = (1 − p^{−2}Φ)z`. With `B(a, b) = Tr(a ∪ b)`, `B(Φa, Φb) = p·B(a, b)`, so for `Φv = γv`, `γ ≠ 0`, `B(reg_syn(u), v) = (1 − 1/(pγ))·B(z, v)`, and the scalar of §8.14 is `(1 − p/γ)(1 − 1/(pγ))·B(z, v)/B(ω, v)`. The two factors have different origins and neither is omitted (Asakura–Chida, accepted manuscript, §6, footnote 10, printed p. 46 (PDF p. 47), citing Besser, Proposition 9.11). The Tate twist is accounted for in `p^{−2}`; no linearity over `K` is asserted for the semilinear Frobenius of an arbitrary curve over `K`.

**Checks.** For `p = 5`, `γ = 2` the pairing factor `1 − 1/(pγ)` is `9/10`, not `1` or `3/5`.

### 8.16 Néron periods and the refined `p`-adic `L`-function

Let `E/ℚ` have conductor `N`, `p > 2` prime to `N`, `ω` a Néron differential, and primitive integral cycles `u⁺`, `u⁻` in the conjugation eigenspaces (§1.8) oriented by `Ω⁺ = ∫_{u⁺} ω > 0` and `Ω⁻/i > 0`; the whole real locus can have index two and is not substituted. Let `f_E` be the newform and `γ` a root of `X² − a_pX + p` of slope `< 1`, or of slope `1` with a refinement that is not theta-critical. Select ModularSymbolsPadicLFunctions §§0.7–0.8, 1.1–1.2's period bases by `λ^±(a, m) = (πi/Ω^±)(∫_∞^{a/m} f_γ dz ± ∫_∞^{−a/m} f_γ dz)`, import L2's (or at slope one L3's) eigen-distribution `μ_γ`, and set `L_p(E, χ, s) = ∫ χ(x)⟨x⟩^{s−1} dμ_γ`. For `τ(χ) = Σ χ(a) exp(2πia/p^ν)` and `L(E, χ, s) = Σ χ(n)a_n n^{−s}`, a nontrivial primitive `χ` of conductor `p^ν` has `L_p(E, χ, 1) = γ^{−ν} τ(χ) L(E, χ^{−1}, 1)/Ω^{χ(−1)}`, and the trivial character gives `(1 − γ^{−1})² L(E, 1)/Ω⁺`; `L_p(E, ω_Teich^{−1}, 0)` is the inverse-`x` moment, not a classical interpolation value (Asakura–Chida, accepted manuscript, §2.2 and §3.4; their Theorem 2.3 and the interpolation formula of §3.4, printed pp. 7 and 16 (PDF pp. 8 and 17), need `γ^{−ν}τ(χ)L(E, χ^{−1}, 1)` in their finite-coset convention, equivalently `χ(−1)(p/γ)^ν L(E, χ^{−1}, 1)/(τ(χ^{−1})Ω^{χ(−1)})`; the arXiv version's Theorem 2.2(1), p. 6, needs the factor `α^{−ν}` that the manuscript has). At critical slope use the eigenlift (L3), not uniqueness from classical moments (Asakura–Chida, arXiv:2003.08888v2, §2.3). Differential rescaling is tracked in both the periods and the regulator coordinate; L4's Euler-factor comparison is the good-prime cross-check.

**Checks.** At `χ = 1` the Euler factor is the square `(1 − 1/γ)²`; for primitive `χ` of conductor `p^ν` the factor is `γ^{−ν}` and the complex twist is `χ^{−1}`; replacing `ω` by `cω` rescales `L_p` and the scalar by `c^{−1}`; for the odd quadratic character modulo `3`, `τ² = −3` so `3/τ = −τ`, which detects the sign error that even quadratic characters miss (non-example); a CM split critical refinement does not satisfy the non-theta-critical hypothesis.

### 8.17 The common rational-scalar relation

Let `M` be a `ℚ`-vector space (geometrically, the integral weight-two motivic group), `K` a field of characteristic zero, `r_∞ : M → ℝ` `ℚ`-linear and `r_p : M → K` additive (hence automatically `ℚ`-linear), `A ∈ ℝ`, `B ∈ K`. Define `WeightTwoBeilinsonRelation r_∞ r_p A B` to mean: there are `ξ ∈ M`, `q ∈ ℚ` and `ε ∈ {1, −1}` with `ξ`, `q`, `r_∞(ξ)`, `r_p(ξ)` nonzero, `A = q·r_∞(ξ)` and `B = ε·q·r_p(ξ)`, with `q` embedded separately in `ℝ` and `K`. It is an explicit predicate on supplied maps; it neither constructs the motivic group nor asserts the conjecture, and a common rational scalar is not an equality between elements of `ℝ` and `ℚ_p` (Asakura–Chida, accepted manuscript, §3.4, Conjecture 3.3 at `n = 0` and the preceding rationality sentence, printed pp. 16–17 (PDF pp. 17–18)). Provide `weightTwoBeilinsonRelation_iff`, `weightTwoBeilinsonRelation_ratios` (`A/r_∞(ξ) = q` and `B/r_p(ξ) = εq`), `weightTwoBeilinsonRelation_rescale_witness` (for `c ∈ ℚ^×`, `(ξ, q, ε) ↦ (cξ, q/c, ε)`) and `weightTwoBeilinsonRelation_change_sign` (replacing `r_∞` by `−r_∞` sends `(q, ε)` to `(−q, −ε)`).

**Checks.**

- On `M = ℚ`, `K = ℚ`, `r_∞(x) = x`, `r_p(x) = 2x`: `A = 3`, `B = 6` satisfy the relation with `ξ = 1`, `q = 3`, `ε = 1`.
- With `r_p` identically zero the relation is false for every `A, B` (degenerate case).
- With the same nonzero maps, `A = 3`, `B = 5` fail (non-example); `A = 3`, `B = −6` satisfy it with `ε = −1`.

### 8.18 The weight-two `p`-adic Beilinson conjecture for elliptic curves

Conjecture, not a theorem. Let `E/ℚ` have good reduction at `p > 2`, fix a Néron `ω` and oriented primitive cycles as in §8.16, and select `γ` of slope `< 1` or of slope `1` non-theta-critical, with `Φ(ω) ≠ γω`. Put `M = H²_M(E, ℚ(2))_ℤ` (EllipticKTheory §§6.1–6.10's integral part, not the whole unramified generic-fibre group), `r_∞(ξ) = reg_D(ξ)(u⁻)/(2πi)` (Layer 2's Deligne regulator and §2.9's coordinate), `r_p(ξ) = (1 − p/γ)·Tr(reg_syn(ξ) ∪ v_γ)/Tr(ω ∪ v_γ)` (§8.14), `A = L′(E, 0)` and `B = L_p(E, ω_Teich^{−1}, 0)`. The conjecture asserts `WeightTwoBeilinsonRelation r_∞ r_p A B` (Asakura–Chida, accepted manuscript, §3.4, Conjecture 3.3 at `n = 0`, printed p. 17 (PDF p. 18)). The rationality of `A/r_∞` is the real Beilinson component, which the `p`-adic ratio statement alone does not prove. In an example a proposed witness needs both an arithmetic-integral certificate and an exact `L`-value comparison; numerical agreement is a diagnostic, and the label stays conjecture when an example passes. A horizontally unramified class with a nonzero vertical residue is not a witness; a CM split theta-critical refinement is not covered.

### Examples

- `ℙ¹`: `D(e^{iπ/3}) = 1.0149416064096536250212025542745…`.
- 36a1: `L(E, 2) = (2π/3)Σ D_E(a) = 0.94001300738822578150…`; the quadratic class `β` over `ℚ(√−3)` and its transfer `γ` over `ℚ`.
- 11a3: `r_E(ξ)(ω) = −(πi/2)L′(E, 0) = −0.23899217135541461969… i`.
- 14a4, 35a3, 54a3: ratios `9/7`, `36/35`, `2/3`.

### Dependencies

Layers 1–7. PadicHodgeRegulators D.2 and D.5 (étale and syntomic regulators and their comparison). ColemanIntegration L1 (Coleman integration, pull-back, Galois equivariance, finite-extension descent). ModularSymbolsPadicLFunctions Layers 0–4 (period lines, twisted Mellin formula, `p`-adic `L`-function, interpolation, critical slope, Euler factors). EllipticKTheory §§3.1–3.7, EllipticKTheory §§6.1–6.10, EllipticKTheory §§7.1–7.9, EllipticKTheory Layer 8 (rational lifts, integral part and vertical residues, symbol and integral certificates, Bloch correction, transfers, worked bad-fibre and non-rational-residue examples). ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2, 2.2. K2SymbolsBrauer §§9.2–9.8. PolylogarithmFunctions Layers 1, 4–5. Mathlib: `WeierstrassCurve.Ψ`, `WeierstrassCurve.preΨ_even`, `WeierstrassCurve.Affine.CoordinateRing.mk_ψ`, `WeierstrassCurve.Affine.FunctionField`, `FreeAbelianGroup`, `FreeAbelianGroup.of`, `FreeAbelianGroup.lift`, `LinearMap.BilinForm`. Tau Ceti: `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero`, `WeierstrassCurve.zsmul_fromAffine_eq_zero_iff`, `WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity`, `WeierstrassCurve.Affine.genericX`, `WeierstrassCurve.Affine.genericY`, `TauCeti.Divisor.principal`.

## Downstream consumers

SpecialValuesBirchTate uses the Beilinson statement of Layer 6 and the normalisations of Layers 2 and 5 as its elliptic model for regulators of `K₂`. PeriodsAndSpecialValues uses Bloch's CM theorem of Layer 5 and the period interface of Layer 7. Roadmaps that need the elliptic dilogarithm, Bloch's function `R_q`, the divisor formula, the regulator of modular units or the Beilinson theorem for elliptic curves over `ℚ` import them from Layers 3, 4 and 7.

## References

- S. Bloch, *Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves*, CRM Monograph Series 11, American Mathematical Society, 2000 (the 1978 Irvine lectures; not freely available, credited for Bloch's results, and cited by number only for Theorem 10.2.1, Lemma 10.2.2 and (8.1.4), as Brunault's thesis cites them).
- A. B. Goncharov and A. M. Levin, "Zagier's conjecture on L(E, 2)", Invent. Math. 132 (1998), 393–432; arXiv:alg-geom/9508008v4 (page numbers are those printed on the arXiv version).
- F. Brunault, *Valeur en 2 de fonctions L de courbes elliptiques*, thèse, Université Paris 7, 2005, with an appendix by L. Merel, "Symboles de Manin et valeurs de fonctions L"; arXiv:math/0602186v1 (page numbers are those of the arXiv PDF).
- F. Brunault, "Valeur en 2 de fonctions L de formes modulaires de poids 2 : théorème de Beilinson explicite", Bull. Soc. Math. France 135 (2007), 215–246.
- F. Brunault, "Regulators of Siegel units and applications", J. Number Theory 163 (2016), 542–569; arXiv:1504.08127v1.
- D. Zagier, "The Bloch–Wigner–Ramakrishnan polylogarithm function", Math. Ann. 286 (1990), 613–624.
- T. Dokchitser, R. de Jeu and D. Zagier, "Numerical verification of Beilinson's conjecture for K₂ of hyperelliptic curves", Compositio Math. 142 (2006); arXiv:math/0405040v2.
- P. Schneider, "Introduction to the Beilinson conjectures", in *Beilinson's Conjectures on Special Values of L-Functions*, Perspectives in Mathematics 4, Academic Press, 1988, 1–35.
- J. Nekovář, "Beilinson's conjectures", in *Motives*, Proc. Sympos. Pure Math. 55, Part 1, AMS, 1994, 537–570 (author copy).
- A. B. Goncharov, "Polylogarithms, regulators, and Arakelov motivic complexes", J. Amer. Math. Soc. 18 (2005); arXiv:math/0207036v3.
- N. Schappacher and A. J. Scholl, "Beilinson's theorem on modular curves", in *Beilinson's Conjectures on Special Values of L-Functions*, Perspectives in Mathematics 4, Academic Press, 1988, 273–304 (author copy; section numbers as printed).
- A. J. Scholl, "Integral elements in K-theory and products of modular curves", in *The Arithmetic and Geometry of Algebraic Cycles*, NATO Science Series C 548, 2000, 467–489 (author copy).
- A. J. Scholl, "Integral elements of K-theory and products of modular curves II", arXiv:0710.5453v1.
- C. Deninger and A. J. Scholl, "The Beilinson conjectures", in *L-functions and Arithmetic*, LMS Lecture Note Series 153, 1991 (author preprint).
- C. L. Siegel, *Lectures on Advanced Analytic Number Theory*, Tata Institute of Fundamental Research, 1965.
- G. Shimura, "On the periods of modular forms", Math. Ann. 229 (1977), 211–221.
- L. Merel, "Symboles de Manin et valeurs de fonctions L", in *Algebra, Arithmetic, and Geometry* (Manin Festschrift), Progress in Mathematics 270, Birkhäuser, 2009 (cited from the author manuscript, pp. 277–302, and from the appendix to Brunault's thesis).
- M. Asakura and M. Chida, "A numerical approach toward the p-adic Beilinson conjecture for elliptic curves over ℚ", Res. Math. Sci. 10 (2023), 11 (author accepted manuscript); arXiv:2003.08888v2.
- A. Besser and R. de Jeu, "The syntomic regulator for K₄ of curves", arXiv:1208.0516v1.
- F. Diamond and J. Im, "Modular forms and modular curves", in *Seminar on Fermat's Last Theorem*, CMS Conference Proceedings 17, 1995 (Variant 9.3.6, for the model of `Y₁(N)`).
