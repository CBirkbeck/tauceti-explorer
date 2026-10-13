# Roadmap: rank-zero and rank-one Birch–Swinnerton-Dyer theory

**Summary.** Build the unconditional rank equality and finiteness of the whole Tate–Shafarevich group for elliptic curves over ℚ of analytic rank zero or one, the known source-qualified prime parts of the leading-term formula, and a finite-certificate route to the full formula for a specified curve or family. The proof passes through genuine modular L-functions, quadratic nonvanishing, Gross–Zagier and Kolyvagin descent, and integral Iwasawa comparisons. Every prime-part theorem keeps its own reduction, residual-representation and local hypotheses. A full formula requires positivity, the actual rational BSD defect and complete coverage of its numerator and denominator support, including the prime 2.

## Scope and ownership

The four outputs have different inputs. Analytic rank at most one gives algebraic rank equality and whole-Sha finiteness. A named prime-part theorem gives one valuation equality in its verified range. A complete arithmetic certificate combines all required prime equalities with a proved outside range or canonical support cover. Only this final certificate yields a full leading-term equality for the actual curve. Abstract finiteness supplies no effective annihilator or exact Sha cardinality.

The core rank theorems include curves with additive reduction and CM. Particular prime-part branches can be narrower. The semistable good-prime JSW theorem, the corrected multiplicative Castella theorem, the signed BSTW theorem, and the good Eisenstein CGS/Keller–Yin theorems are separate interfaces. The full-formula result is an individual or explicitly certified family result; no uniform theorem for every exceptional prime of every analytic-rank-one curve is claimed.

### Prerequisites and boundaries

The foundational carriers and algorithms have existing owners:

- TauCetiRoadmap **EllipticCurves** Layers 1–2 own isogenies, duals, invariant differentials, the point group, rational torsion and Tate modules. Layer 3 owns finite-field Frobenius and Hasse bounds; Layer 4 owns reduction, minimal models, Tate's algorithm, component groups and Tate-curve logarithms; Layer 5 owns quadratic twists and their Galois point equivalence. Layer 6 owns Mordell–Weil finite generation, canonical heights, regulator lattices, descent rank bounds and saturation. Layer 7 owns continuous Kummer/Selmer/Sha carriers, finite m-Selmer groups and Cassels' arithmetic isogeny comparison. Their conditional BSD statement does not prove the rank or leading-term assertions developed here.
- The real period is EllipticCurves Layer 7's absolute full-component period of a global minimal long model. Writing (D_W(x)=(a_1x+a_3)^2+4(x^3+a_2x^2+a_4x+a_6)), its convention is (2∫_{D_W>0}dx/√D_W). This already includes every real component. Positivity and convergence are supplied with the period; the totalized value of an unproved integral is insufficient. The separate period over an imaginary quadratic field below uses the complex integration lattice and the Néron differential ideal.
- **EllipticCurveModularity** R29.3 supplies the normalized rational-coefficient weight-two newform attached to the actual curve. R29.4 supplies all bad factors, the exact conductor and the Tate-module comparison; R29.5 supplies the modular parametrization; R29.6 supplies equality with the curve's coefficient series, its entire continuation and functional equation. This roadmap uses the entire function `ellipticL E` provided by that interface. Mathlib's existing `E.LSeries` is a totalized series and is used only where summability is proved. Tau Ceti's pinned `LSeries.HasEntireExtension` supplies existence and uniqueness interfaces, not the modularity proof for E.
- **GrossZagierAndArithmeticHeights** GZ.0 owns the source convention dictionary, real components and integrated complex period lattice. At the pins Tau Ceti's canonical height is the limit of the x-height divided by (2·4^n), and its polarized pairing has self-pairing that canonical height. The BSD x-height pairing is twice this pairing, so `Reg_BSD = 2^r Reg_Tau`. GZ.3 owns parametrization/differential and integral period comparisons; GZ.8 owns the actual Gross–Zagier formula; GZ.9 owns the actual BDP reciprocity formulas, with the multiplicative and supersingular extensions specified below. The regulator itself and its rank-zero value one are already provided by Tau Ceti's `Affine.PointModTorsion`/`Regulator` development.
- The basic **11a3** curve (y^2+y=x^3-x^2), coefficient tuple ((0,-1,1,0,0)), discriminant (-11), and point ((0,0)) of order five are EllipticCurves' named torsion example. The **37a1** curve (y^2+y=x^3-x), tuple ((0,0,1,-1,0)), discriminant (37), and infinite-order point ((0,0)), with rank one by explicit descent, are its named rank example. Those constructions and elementary point-order calculations are imported. The new examples below add analytic enclosures, torsion-sensitive prime-part dispatch and complete BSD certificate obligations. The 32a2 model and its dyadic arithmetic comparison remain explicit targets here.
- Mathlib already supplies `analyticOrderAt`, `analyticOrderNatAt`, iterated derivatives, fundamental discriminants, rational numerator/denominator normal forms, finite prime-factor sets and `padicValRat`. Tau Ceti supplies the quadratic twist point equivalence and `Affine.Point.exists_baseChange_eq_of_map_eq`. Their specializations below add the actual BSD comparisons, rather than a second analytic-order, factorization or Galois-descent theory.

The pinned statements used by Suggested.lean are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current upstream ownership takes precedence over an older library snapshot.

## Conventions

Use the motivic center (s=1). The unitary GL₂ center (1/2) is related by translation by (1/2). Write (r=ord_{s=1}L(E,s)) and (L^*(E,1)=L^{(r)}(E,1)/r!). At rank one this is (L'(E,1)). The completed convention here uses Γℂ(s)=2(2π)⁻ˢΓ(s), twice the conventional Mellin completion; its sign is unchanged. The analytic root number is the negative of the normalized weight-two Fricke eigenvalue.

Use absolute number-field heights with the stated source conversion to the BSD pairing. Over a quadratic field, source relative heights introduce the degree-two scaling retained in the regulator comparison. Write (I_{free}=[E(K)/tors:ℤP̄]) and (I=[E(K):ℤP]=I_{free}#E(K)_{tors}). The height formula uses the free index. All periods refer to minimal Néron differentials; a parametrization or isogeny contributes its actual differential multiplier and local indices.

An odd primary component means the p-primary group with **p an odd prime**. Whole Sha finiteness is a statement about the complete group. The integer valuation `padicValRat p q` is totalized at zero; zero and −1 are deliberate negative controls for reconstruction. Multiplicative/division valuation identities require all their rational factors to be nonzero. Strict positivity is a separate input to (q=1).

For a coefficient DVR O with uniformizer ϖ and residue field of size (p^f), finite length is normalized by ϖ, and cardinality is (p^{fℓ_O(M)}). It is not automatically a ℤₚ length. Use Λ=O⟦Γ⟧, Λ[1/p] and Λ[1/p,1/(γ−1)] with their different meanings. `char` ignores finite pseudo-null modules; Fitting and augmentation control retain them. An ideal containment `(a) ⊆ (b)` means b divides a. A rational containment leaves the coefficient-prime error until an integral argument removes it.

When K is imaginary quadratic and p splits, fix both the embedding and the distinct primes v and v̄. Record the inverse Galois action on induced coefficients independently from the choice of arithmetic Frobenius in an Euler polynomial. The JSW and Eisenstein strict/relaxed conventions are compared by the stated conjugation map, not by matching place names. A BDP function in these characteristic-ideal equalities is the **squared** logarithm function; its square root has a different ideal and λ-invariant.

## Exact supplier contracts

Each contract identifies the existing owner and the extension needed by the stated consumer. An early class, a generic local interpolation formula, or a rational divisibility does not by itself supply an integral arithmetic endpoint. New ordinary BSTW work is routed to the present Kato L4 owner until its early L5 extension exists. The imaginary-quadratic elliptic-unit proof chain has no existing complete owner: it requires integral unit distributions and norm relations, Rubin's 1991/1994 CM main conjectures, Hida–Tilouine Theorem 0.3 (Invent. 117, 1994), and Hida's anticyclotomic Katz μ=0 theorem (Annals, 2010), with the exact characters, primes and coefficient rings used below. Katz interpolation alone does not satisfy that contract.

### From Mathlib at the pin

`Rat.num` and `Rat.den` give the reduced numerator and positive denominator, with coprimality and denominator one at zero. `Nat.primeFactors` is a finite prime set, empty at zero and one; its membership theorem requires a nonzero integer when identifying divisibility. `padicValRat p q` is the difference of the natural valuations of the absolute numerator and denominator. It is zero at q=0, so reconstruction must retain strict positivity. These carriers suffice for the finite certificates in Layer 13.

`WeierstrassCurve` and its affine equation, nonsingularity and point group are the actual curve carriers. `Affine.Point.map` is an additive homomorphism for an algebra homomorphism between extension fields; its base-change and composition identities identify rational and conjugate points. `addOrderOf`, rather than multiplicative `orderOf`, is the additive point-order interface. The model's `j` requires `IsElliptic` in scope. Native rational coercions, finite sets and integer valuations suffice for the representative signatures.

### From Tau Ceti at the pin

`WeierstrassCurve.quadraticTwist` is the trace–norm twist of a separable quadratic extension. `quadraticTwistPointEquiv` carries its M-points to the original curve's M-points in a field tower; its Galois anti-equivariance supplies the negative eigenspace. `Affine.Point.exists_baseChange_eq_of_map_eq` descends an actual point fixed by the nontrivial automorphism. The new quadratic comparison combines these maps with restriction/corestriction and the integral factor two.

`Affine.PointModTorsion` and `Affine.Regulator` supply the free quotient and canonical-height regulator, with finite torsion and rank-zero regulator one. Their source-convention adapter is specified in Scope and ownership. `LSeries.HasEntireExtension` gives a differentiable extension agreeing on a right half-plane, plus uniqueness; modularity supplies the extension for the elliptic coefficients. It does not turn the totalized series into a globally convergent series.

### ArithmeticGaloisDuality R02.1

Continuous cohomology and Pontryagin duality with compact/discrete coefficients, involutions, inverse limits, finite cyclic restriction kernels and local H⁰ cardinalities. Preserve finite terms that characteristic ideals cannot see.

### ArithmeticGaloisDuality R02.4

Extend finite-module Poitou–Tate to the compact Tate/discrete p-divisible and Λ-adic coefficients needed here, with continuous cohomology, completed semilocal terms, exact transition maps, local annihilator conditions and inverse/direct limit exactness. The existing nine-term finite-module statement is not itself this Iwasawa exact sequence.

Poitou–Tate comparison for the stated ordinary-relaxed/strict and Greenberg Selmer structures, with two independent Coleman localizations, finite terms and exact characteristic-ideal orientation.

### ArithmeticGaloisRepresentations R01.1

Stable integral lattices and Ribet’s nonsplit residual-lattice lemma for an irreducible two-dimensional characteristic-zero representation; chosen quotient/subcharacters at p, H⁰ and finite p-power isogeny/lattice indices. Include the characteristic-zero irreducibility and scalar-image/open-image (Bogomolov/Ribet or Serre) inputs in KY Lemma 3.0.3 and CGS Theorem 4.3.1, with actual hypotheses and a finite bound C₁. Extend this direction as a Part II if its present exports do not suffice.

### AutomorphicCongruences L0

Kriz’s Eisenstein congruence for actual ordinary weight-two modular forms, integral p-depleted CM evaluations, residual characters and all Euler/period factors; include the trivial-character constant-term correction.

### AutomorphicCongruences L2

Fouquet–Wan's U(3,1) Eisenstein congruence divisibility (the lower bound on characteristic ideals of anticyclotomic and two-variable Selmer groups by p-adic L-functions) for p-ordinary newforms of even weight, with the exceptional height-one primes treated, as used by JSW §6 (through Wan) and by Castella's erratum Theorem 2.3.

The exact FW Theorem4.41 reverse divisibility and Corollary7.21 Rankin/Katz/Hida factorization with class-number, period and local factors. The erratum’s FO12 Cor7.2.1 does not exist; do not route this factorization to L5a. Retain absolute residual irreducibility over K, crystalline p-local alternative, q∥M nonsplit, and all nonsplit primes ramified-special with the specified twist for the fully integral inclusion; outside that range retain the excluded pullback height-one primes.

### AutomorphicCongruences L2s

Castella–Liu–Wan's semi-ordinary GU(3,1) congruence divisibility (the replacement of withdrawn Wan arXiv:1412.1767) at good supersingular p with a_p = 0, giving one divisibility of the two-variable Greenberg main conjecture over an auxiliary imaginary quadratic L.

### AutomorphicCongruences L5a

AC L5a imports the ordinary BSTW element/Proposition9.18 from KatoEulerSystems early L5 extension and, when its signed branch needs it, the early signed comparison from Layer 8. It must not depend on completed Layer 9. FW factorisation is specified from AC L2 and FO local type from R21.3 separately.

### AutomorphicPadicLFunctions L0

Primitive/imprimitive p-adic interpolation and finite Euler factors for the actual modular, Rankin and CM characters, with the normalization and coefficient rings of CGS §§2.5 and 4.1. Use inertia coinvariants and evaluation at ℓ⁻¹γ_w; distinguish arithmetic Frobenius from the inverse action on the induced module.

### AutomorphicPadicLFunctions L3

The two-variable Hida Rankin–Selberg Greenberg function against the CM family used in BSTW1.14, with completed unramified coefficient ring, interpolation and primitive/imprimitive factors; distinguish it from the anticyclotomic BDP projection.

Export BSTW’s two-variable signed Rankin functions L_p^±∈Λ_L alongside L_p^Gr∈Λ_L^ur, with the common differential/Betti/Gauss-sum normalization of Proposition6.25 and Theorem6.26. The one-variable Pollack functions are obtained by the specified cyclotomic specialization, not identified with these functions by type.

Actual Katz p-adic L-functions and integral CM periods/congruence ideals; precise interface to the elliptic-unit IMC proof extension for character characteristic ideals and μ=0. Katz construction/interpolation alone does not provide Rubin/Hida–Tilouine/Hida proofs. The absent owner is a separately explicit gap.

### AutomorphicPadicLFunctions L3h

Hsieh's toric BDP measure and μ = 0 theorem for the anticyclotomic p-adic L-function of a weight-two (and higher even weight) newform, with its CM periods and hypotheses (squarefree N⁻, local root number conditions). For JSW’s weight-two use export Burungale Proposition5.1.3 and JSW6.1.6’s BDP/Brooks μ calculation with its nonsplit-prime and auxiliary conductor conditions. Do not identify Hsieh’s square-root function with its square.

CGS v2 Proposition2.4.5 anticyclotomic Greenberg ideal equals the BDP ideal, with the square-root/squared convention explicit. Here BSD proves its Σ-imprimitive extension with JSW3.4.2/6.1.6, matching lattices and Euler factors.

### AutomorphicPadicLFunctions L4e

Eischen–Wan finite-slope Klingen families on definite GU(2,0)/GU(3,1) with their constant-term divisibility (Theorem 5.8, Corollary 5.9), used for the finite-slope (supersingular) congruence argument.

### ClassicalArithmeticCompletion CA.1

Extend the primitive discriminant character export to its splitting/Frobenius identification for quadratic number fields, including the explicit dyadic Kronecker rule; identify NumberField.discr with the fundamental discriminant. The pinned multiquadratic theorem alone omits 2.

### ComplexMultiplicationAndExplicitReciprocity CM.1

Characteristic-zero endomorphism classification for the actual elliptic curve y²=x³−x: an origin-preserving automorphism squaring to [−1] gives the full order ℤ[i], not only an abstract action. Import the existing CM curves/ideal-action carriers.

### ComputationalNumberTheory CN.4

Validated rational interval replay for π, positive square roots, exp and E₁(x)=∫_x^∞e^(−t)/t dt, including quadrature and tail errors, on the actual Mellin finite sums. Import existing rational interval product/reciprocal/rounding nodes and extend elementary-function evaluators as a Part II if needed.

### DiophantineApproximationAndTranscendence DT.5

Transcendence of the Tate period q_E when j(E) is algebraic (Barré-Sirieix–Diaz–Gramain–Philibert 1996), hence log_p q_E ≠ 0 and L(V_f) ≠ 0 for every elliptic curve over ℚ with split multiplicative reduction at p.

### EulerSystemsAndKolyvaginSystems ES.2

Actual KLZ motivic Beilinson–Flach norm-compatible classes and their cohomological realization for the modular/CM Rankin pair, with specialization lattice index ϖ^r, auxiliary c,m and ordinary local condition. Extend this Euler-system construction direction as a Part II if needed; Layer 11 specializes the actual classes, not classes defined as inverse images of predicted L-functions. The same arithmetic extension must verify the two global KLZ explicit reciprocity identities for those actual classes and the imported local Coleman maps, with their common lattice and period normalization; this is additional source-specific work, not an existing generic ES.2 theorem.

### EulerSystemsAndKolyvaginSystems ES.4

Generic Beilinson–Flach/Kolyvagin descent and finite-level Selmer bounds, retaining the source H⁰/lattice/character hypotheses, the powers of p and uniform error constants. No Eisenstein BSD theorem is specified from this owner.

### EulerSystemsAndKolyvaginSystems ES.8

Rank-two conjugate-self-dual ordinary Λ-adic Kolyvagin-system bound for actual T_g and cartesian local conditions, including the augmentation-prime proof; supply the generic machinery, while Layer 9 owns its higher-weight image/constant specialization.

Generic inverse-limit Kolyvagin systems and index-square characteristic divisibility with the augmentation prime included when uniform near-trivial bounds justify it; preserve the distinction between Λ, Λ[1/p] and Λ[1/p,1/(γ−1)].

### GL2AutomorphicRepresentationsAndTransfer R16.3

Local ε-factors of GL₂(ℚ_ℓ) representations attached to elliptic curves: w_ℓ = −a_ℓ at multiplicative ℓ, w_ℓ = 1 at good ℓ, the twist formula ε(π ⊗ χ) = χ(−1)-twisted value for unramified π and ramified quadratic χ, and the dyadic values for potentially good reduction needed by the Birch–Stephens table; and the product formula w_E = ∏_v w_v with w_∞ = −1 for weight two.

### GL2AutomorphicRepresentationsAndTransfer R17.3

The Jacquet–Langlands transfer with integral multiplicity one at a non-Eisenstein maximal ideal: a primitive integral eigenfunction on the definite (or indefinite) quaternion algebra of discriminant N⁻ attached to g, with the freeness of the localised character groups needed for Pollack–Weston Theorem 6.2.

### GeneralizedHeegnerCycles GH.7

Castella–Hsieh (4.7), §5.2 and Theorems 5.7/6.1, Longo–Vigni Theorem 4.7 and Castella Theorems 2.11/5.3: big Heegner/generalized Heegner classes in Hida families, their two-variable explicit reciprocity and the congruence of BDP p-adic L-functions along the family, with the Chida–Hsieh erratum and the Kobayashi–Ota local-condition replacement.

### GrossZagierAndArithmeticHeights GZ.0

Construct the actual integration image of H₁(E(ℂ),ℤ) for a global minimal Néron differential as a discrete full Submodule ℤ ℂ. Export its real/imaginary rank-one sublattices, index δ∈{1,2}, covolume/complex-integral factor two, and full real-component period comparison; use native IsZLattice/ZLattice.covolume rather than new real-valued data. This specializes the complex uniformization/real-period development; uses the existing generic lattice theory.

### GrossZagierAndArithmeticHeights GZ.3

Prove that the Manin constant c of the X₀(N)-optimal curve is a positive integer prime to p for p ∤ 2N·D in the range JSW Remark 7.3.3 uses (Mazur, via Jetchev 2008 §1), checked against later sharpenings, with its transfer across the isogeny class and to the twist E^D; consumed by the Néron-period versus canonical-period comparisons of Layer 6–Layer 9.

Rational automorphic realisations and modular degrees: the Manin constant of the optimal parametrisation as a positive integer (with its stated p-integrality), the degrees δ(N⁺, N⁻) of optimal Shimura-curve parametrisations, and the comparison of Néron periods with the modular-symbol periods Ω_f^±.

Export JSW7.3.2’s exact integral modular-degree/Néron-period comparison with localised multiplicity-one hypotheses and proof of their discharge for semistable E, good odd p and irreducible E[p]. Track geometric component multiplicities ord_ℓ Δ and the definite/indefinite parity change; a rational automorphic realization alone does not give it.

For the multiplicative branch p∥N, export the exact p-integral canonical-period/Néron-period comparison used by Skinner C and Castella, with optimal/nonoptimal transfer and full local hypotheses. The existing p∤2ND Manin-constant request does not cover this branch.

### GrossZagierAndArithmeticHeights GZ.5

Prove L(1/2, π ⊗ χ) ≥ 0 for every cuspidal automorphic representation π of PGL₂ over ℚ and every quadratic Hecke character χ (Waldspurger's period formula, or Guo's relative trace formula, or Lapid–Rallis), with the sign conventions for the unitary normalisation; linked to Layer 7 for the positivity of L(E,1) and L′(E,1).

### GrossZagierAndArithmeticHeights GZ.9

Extend multiplicative-prime BDP/control and period comparisons from the existing semistable optimal export to Castella erratum A′/Theorem1.1: multiplicative p>3, additive primes away from p allowed, nonsplit residually ramified q, E(Q_p)[p]=0 and ramified Heegner ideal. Keep Euler factors and local hypotheses; prove the extension instead of calling the semistable theorem identical.

Kobayashi’s supersingular p-adic Gross–Zagier formula [BSTW88], with signed local normalization and exact Euler factors used in BSTW1.5 rank-one deduction. Current ordinary/multiplicative BDP exports do not supply that supersingular formula.

### HeegnerPointEulerSystems HE.7

Export JSW Theorem4.4.1’s odd-prime Shimura-curve Kolyvagin bound in its (gen-H), residual and local conditions, keeping Tamagawa/parametrisation defects. Prove the clean square-index specialization in the exact upper-bound application; dyadic conjugation descent is not this export.

Arithmetic Kolyvagin bounds with explicit whole-Sha annihilator/exponent and finite exceptional-prime data for a supplied actual Heegner curve/point. Finiteness alone supplies no computable exponent; import integral/dyadic arithmetic descent before extracting a numerical bound.

### HeegnerPointEulerSystems HE.8

Λ-adic Heegner classes over the anticyclotomic tower with nonvanishing (Cornut–Vatsal) at an ordinary prime, as an input of the Kolyvagin-system bound in Castella's corrected proof. The ordinary BCK Theorem 5.2 comparison must be proved at this early interface with its integral lattice, local conditions and BDP normalization. Its higher-weight and imprimitive compatibility is an additional obligation of Layer 9. The later HE.8b Eisenstein reexport depends on the equalities proved here and cannot supply this early comparison.

### IntegralIwasawaTheory L4

Ferrero–Washington Dirichlet μ=0 in the isogeny/period comparison in Wüthrich Lemma 17. Cyclotomic elliptic μ=0 is not assumed. The Weierstrass/characteristic/Fitting algebra is specified separately from PadicMeasuresIwasawaAlgebras L4.

### KatoEulerSystems L4

Export Kato Theorem14.2(2), printed p.235, finite Bloch–Kato Selmer for every coefficient prime and zero for almost all when L(E,1)≠0, including the separate CM proof of §15. Provide comparison with EC Layer7 p∞ Selmer at good, finite-flat and Tate-curve primes; existing non-CM/Hyp(v) and good-ordinary divisibilities do not supply all these cases.

Finite-level integral upper bound of JSW7.2.1(i) for weight-two E, odd good (ordinary or supersingular) or multiplicative p, irreducible E[p], L(E,1)≠0, with Néron-period/Tamagawa normalization. Specify the source proof including local finite-flat/Tate conditions and integral lattice errors; ordinary L4 divisibility is only good ordinary and a specialization theorem assuming main-conjecture equality cannot prove this one-sided bound.

Provide the early L5 extension for the ordinary BSTW two-variable zeta element, ordinary reciprocity laws and ordinary Proposition9.18/BCS4.1.3 comparison; BSD imports these. Its present owner is L4. It must not depend on AC L5a or completed Layer 9.

Wüthrich (Doc.Math.19(2014)) Theorem 4, Proposition 8, Theorem 13, Theorem 16, Lemma 17 and Corollary 18: distinguished isogenous E_• and its étale lattice; integral Kato zeta element even when H¹(T)_0 is nonfree; integral char(X_ord) divisibility by the primitive Mazur–Swinnerton-Dyer p-adic L-function at odd good ordinary reducible p, and exact period/isogeny transfer. This extends the present ordinary-selmer-divisibility, which yields only a rationalized bound in its stated range.

### MetaplecticAutomorphicForms MP.7

Half-integral-weight metaplectic Eisenstein and Whittaker kernels with ramified local characters and test functions (Friedberg–Hoffstein's construction), with their Fourier coefficient and Euler-factor identities, so that the twist series with arbitrary prescribed local behaviour (split, inert, ramified) at finitely many primes can be formed.

### ModularIwasawaMainConjectures L0

The ordinary Greenberg Selmer group, its dual X over the cyclotomic Iwasawa algebra and the formulation Ch_Λ(X) = (L_f) with canonical integral periods and primitive/imprimitive conventions, as consumed by the specialisation at the trivial character.

Actual cyclotomic/two-variable/anticyclotomic characteristic-ideal, primitive local-condition and p-adic-L normalization dictionary. L6 is a consumer of the independent Eisenstein equalities and is not a proof input.

### ModularIwasawaMainConjectures L1

A weight-two extension in the Skinner–Urban Theorem 1 / Skinner Theorem A (p ∤ N) form: p ≥ 3, f ordinary at p, ρ̄ irreducible, and some q ≠ p with q ∥ N and ρ̄ ramified at q; integral equality Ch_Λ(X) = (L_f) in Λ, with its own route (Skinner–Urban plus Kato, integrality as in Skinner's remark after Theorem A). The FW 1.6 form stays as it is.

The multiplicative extension of L1 proves Skinner's Theorem A for p ∥ N (weight two, ordinary at p, ρ̄ irreducible, q ≠ p with q ∥ N and ρ̄ ramified at q) by the Hida-family deduction from the p ∤ N case with the Fitting-ideal argument of Skinner §3.1. The owner is L1, and the extension is a proof obligation.

### ModularIwasawaMainConjectures L4

The signed (Kobayashi/Pollack) local conditions and the formulation of the signed main conjecture with Pollack's L^±_p, to which Layer 9 exports BSTW Theorem 1.3 through L6; only the formulation and the FW/LLZ consequence are imported.

### ModularSymbolsPadicLFunctions L1

Saturated integral modular-symbol lattices and period lines for the weight-two ordinary eigenform, with scalar change explicit. Compare canonical periods with the actual minimal Néron differential/period of the distinguished Wüthrich curve through the modular parametrization and isogeny indices, rather than assuming a unit; L2’s bounded slope-zero distribution then becomes the required integral MSD measure. Extend this period-comparison direction as a Part II if needed.

### ModularSymbolsPadicLFunctions L2

Ordinary (slope-zero) weight-two modular-symbol measure, primitive n=0 interpolation with both ordinary Euler factors, and p-stabilization/newform comparison. Use L1’s actual saturated integral period lattice and Wüthrich’s distinguished lattice/isogeny comparison to prove the Néron-period Mazur–Swinnerton-Dyer normalization; boundedness alone is only a rational measure. Critical-slope L3 is not used.

### NeronModelsAndSemistableAbelianVarieties R11.2

Rational component-group order and its isogeny functoriality on actual Néron models; compare with the existing elliptic reduction filtration and Tate-algorithm trace, including wild residue characteristics. Minimality and the specific dyadic/ternary traces are imported from EllipticCurves Layer 4; real components are imported from GZ.0, separately from a finite-place Néron fibre.

### NeronModelsAndSemistableAbelianVarieties R11.6

Export the invertible fractional ideal 𝔞_ω=(e*Ω¹)/ω for E base-changed to 𝓞_K, relative to its rational global minimal differential, and the rational twist differential multiplier u. Use FractionalIdeal.absNorm with denominators. Prove local unit/valuation comparisons away from 2ND, and 𝔞_ω=1 with dyadic u when (D,2N)=1.

### OrdinaryAutomorphicFormsAndModularityLifting R21.3

FO12 Lemma2.14 constancy of the special local type at ℓ|M in the actual ordinary big Galois representation; export the representation/lattice and Hecke relation so BSD transfers nonsplit special hypotheses from f to each g_m.

### PadicFamilies L0

Actual ordinary Hida/CM families and integral Eisenstein/CM evaluations used in Kriz’s congruence, with coefficient ideals and constant-term effects.

### PadicFamilies L3

The Greenberg–Stevens theorem (Invent. Math. 111 (1993), Theorem 7.1): for f of weight two with split multiplicative reduction at p, L′_p(f, 1) = L(V_f)·L_alg(f, 1) with L(V_f) = log_p(q_E)/ord_p(q_E), including the Mazur–Kitagawa two-variable p-adic L-function it uses.

### PadicFamilies L4

The actual integral CM Hida family and its Galois lattice, character conventions and weight/cyclotomic specialization used in BSTW§§3–6; an ordinary eigencurve geometry statement at L1 is not this construction.

Integral CM congruence ideals and their Katz factorization with h_K and ordinary factors retained; the exact primitive Rankin/Greenberg specializations of CGS §2.5.

### PadicHodgeRegulators L3

Actual ordinary local Perrin–Riou/Greenberg Coleman maps on the integral Rankin coefficient lattice, their interpolation, rescaling, injectivity and pseudo-null cokernel, with CGS degree, congruence-ideal and CM normalization factors. The source-specific global KLZ reciprocity identities for the actual BF class require the separately specified Euler-system arithmetic extension; a generic local big-logarithm interpolation theorem alone does not prove those identities.

### PadicHodgeRegulators L4

Integral signed local maps over Λ_L and Λ_L^ur at both split primes, comparison with Kobayashi/Pollack signs, image indices and common lattice/period normalization for BSTW1.14. Current rational one-variable Coleman-image and arbitrary Wach-basis signed-condition statements are insufficient. Both maps are Λ_L-linear; the logarithm target uses the coefficientwise inclusion Λ_L→Λ_L^ur, rather than an unrelated scalar action.

### PadicMeasuresIwasawaAlgebras L4

Weierstrass preparation and height-one characteristic ideals for finitely generated torsion O⟦Γ⟧ modules, μ and λ with uniformizer normalization, exact-sequence multiplicativity and finite-module corrections. Include the characteristic/Fitting comparison under the source’s projective-dimension and no-finite-submodule hypotheses, and the unit-augmentation test for an integral quotient. Extend this algebra direction as a Part II if needed; none of these supply an arithmetic main-conjecture equality.

### SelmerIwasawaCohomology L2

Actual cohomological ordinary/unramified/strict/relaxed local conditions, their propagated lattice and Kummer/torsion comparison, and finite H⁰/local-control terms. Include nonsurjective global localization images rather than assuming local torsion vanishes. Bloch–Kato finite conditions and their ordinary/logarithm comparison are supplied by L4 after the period-ring inputs.

### SelmerIwasawaCohomology L3

Provide Greenberg’s no-finite-submodule result and the required presentation/Fitting-ideal and augmentation control statements for the specific ordinary/signed/Σ-imprimitive dual Selmer modules. Distinguish a dual having no finite submodule from a discrete Selmer group having no proper finite-index submodule. Current iwasawa-torsion-criterion is a specialised acyclicity statement and iwasawa-descent is derived global cohomology, not this Selmer theorem.

Export the embedded cofinal cyclotomic/anticyclotomic compositum tower, compact T_pE continuous-H¹ corestriction system and completed semilocal localizations with the same transitions. Export the independent cyclotomic tower, projection and same-field character projectors under Shapiro. Prove the Λ-coefficient quotient comparison with its Tor/control hypotheses; do not define cyclotomic H¹ as that quotient. Use the existing TauCeti.ContCohomology.H1 and current Tau Ceti Tate-module implementation.

Iwasawa Selmer kernels and Pontryagin duals in the three towers, primitive/imprimitive exact sequences, cotorsion/no-finite-submodule and characteristic-ideal comparisons. Preserve the finite cyclic unramified/Greenberg restriction kernel and its finite-level control contributions.

### SelmerIwasawaCohomology L4

Integral Bloch–Kato finite local conditions on the actual T,V,V/T, and their good-ordinary/Kummer/logarithm comparison at the split p-places. Preserve local torsion before passing to H¹_f(K_v,T)/tors, finite restriction kernels and source exceptional Euler factors; do not replace this by a universal equality of ordinary and finite conditions.

### SerreWeightAndLevelOptimisation R20.2

Ribet's level-lowering theorem away from p (Rib90, Theorem 1.1) for weight two newforms with trivial character: if ρ̄_{f,p} is irreducible and unramified at q ∥ N, q ≠ p, there is a newform of level N/q with the same residual representation.

### TauCetiRoadmap EllipticCurves Layer 1

Actual isogenies, duals, cyclic-kernel quotients and invariant differential pullbacks on the fixed models; no isogeny-degree-only substitute for local/global period indices.

### TauCetiRoadmap EllipticCurves Layer 2

Actual torsion subgroup and prime-to-good-reduction bounds, rational cyclic isogeny kernels, Tate modules and the integral-coordinate torsion criterion used to exclude torsion on fixture37.

### TauCetiRoadmap EllipticCurves Layer 3

For an elliptic curve over a finite field 𝔽_q, the point-count trace t_q = q + 1 − #E(𝔽_q) and the relation t_{q²} = t_q² − 2q (distinct from the Dirichlet coefficient a_{q²}=a_q²−q; equivalently the characteristic polynomial of Frobenius over extensions).

Exact finite-field point counts, Hasse bounds, Frobenius traces and multiplicative/prime-power Fourier coefficient recurrence, including bad-prime branches.

### TauCetiRoadmap EllipticCurves Layer 4

Néron–Ogg–Shafarevich and the Galois description of local factors: for ℓ ≠ r, the local polynomial of a minimal model equals det(1 − Frob T | V_r(E)^{I_ℓ}); Tate's algorithm local index c_ℓ = [E(ℚ_ℓ) : E₀(ℚ_ℓ)] and its base change behaviour.

Actual good ordinary/residual local classification, minimal Weierstrass models and Tate algorithm including p=2,3/additive cases, logarithm and Néron local factors.

### TauCetiRoadmap EllipticCurves Layer 5

The quadratic twist E.quadraticTwist K and the Galois-twisted point isomorphism (quadraticTwistPointEquiv), together with the identification of V_r(E^K) with V_r(E) ⊗ χ_K as G_ℚ-representations.

### TauCetiRoadmap EllipticCurves Layer 6

Mordell–Weil finite generation, rank/descent comparison, explicit height-index bounds and complete finite saturation/search certificates for the actual rank-one free lattice.

### TauCetiRoadmap EllipticCurves Layer 7

Selmer structures and the groups Sel_{p^∞}(E/F), Ш(E/F) for F = ℚ and quadratic F, with Kummer sequences, restriction/corestriction and inflation–restriction for the forced-discrete coefficient modules E[p^∞] and E(F̄); the real period Ω_E = 2∫_{D_W>0} dx/√D_W of the global minimal model and the arithmetic BSD quotient over ℚ with Ш finite; Cassels' isogeny invariance and isogeny equality of all local Euler factors. In particular provide continuous cohomology, finite isogeny-Selmer comparison for Res_{K/ℚ}E ⇄ E×E^K, both compositions [2], finite Sel₂, and maps on locally trivial Sha. Abstract groupCohomology.H1 is not this interface.

Actual finite m-Selmer groups and Kummer–Sha exact sequence, torsion quotient and complete descent presentations. Supply exact cardinalities, not a database analytic-Sha entry.

### TauCetiRoadmap ModularForms Layer 6

The normalised Fricke operator 𝒲_N on S₂(Γ₀(N)) and the sign ε_N(f) of a newform under it.

### TauCetiRoadmap ModularForms Layer 7

Hecke's functional equation Λ_N(2 − s, f) = i² Λ_N(s, 𝒲_N f) for weight two newforms, and the analytic rank of a newform as the order of its entire continuation at s = 1.

Actual newform L-function analytic continuation and functional equation, Mellin splitting at 1/√N and derivative formula; compare to Layer 0 the entire elliptic L-function, retaining the root-number sign.


## How to read and build

Layers follow proof order. In particular the early modular-symbol comparison, definite period identity and signed reciprocity comparison precede their consumers.

The arithmetic companion interfaces form an ordered proof bundle: Gross–Zagier/Heegner constructions, early Kato classes and generic Selmer/duality/regulator machinery supply the proofs here, while completed Eisenstein main conjectures are exported to MIMC L6 and HE.8b. Those reexports are consumers. No endpoint is obtained by importing itself through another roadmap. The arithmetic prerequisites must be established before the endpoints that use them. The source-specific supplier extensions above are additional proof obligations; they cannot be substituted by their present narrower exports.

`README.md` specifies every mathematical target. `Suggested.lean` keeps only light definitions and milestone signatures whose carriers exist at the pins. The actual analytic, arithmetic and Iwasawa end theorems stay in this document until their supplier carriers are available together. Its `sorry` proofs specify goals; they do not certify the mathematics.

## Layer 0: Analytic normalizations and quadratic L-factor comparisons

The continuation is supplied by modularity. The new work identifies its central order and the signs and local factors used in quadratic descent.

### 0.1 The completed L-function and the root number

For E/ℚ elliptic of conductor N, completedEllipticL E is the unique entire continuation of s ↦ N^{s/2} Γ_ℂ(s) ellipticL E s from Re s > 0, where Γ_ℂ(s)=2(2π)^{-s}Γ(s). This product formula is asserted only there; at Gamma poles use the continuation. It satisfies Λ(E,s)=w_E Λ(E,2−s) for a unique sign rootNumber E∈ℤˣ. With the normalised Fricke involution supplied by ModularForms Layer 6, w_E=−ε_N(F_E). The pinned raw TauCeti.frickeOperator has no normalising scalar and does not directly supply that involution.

E/ℚ elliptic; N is the conductor of E, equal to the level of F_E (EllipticCurveModularity R29.4/exact-conductor). Γ_ℂ convention: Λ(E,s) here is 2 × the function N^{s/2}(2π)^{-s}Γ(s)L(E,s) of R29.6 and of BFH; the factor 2 does not change the sign w_E.

Construct the entire Mellin transform through R29.6 and identify it with N^{s/2} Γ_ℂ(s) ellipticL E s on Re s > 0. Choose this witness and prove uniqueness by the identity theorem. Do not define the value at s=0 by a pointwise total Gamma product: Gammaℂ 0=0 in Lean whereas Λ(E,0)=w_E Λ(E,2)≠0. Functional equation: R29.6/l-function-continuation gives Λ(E,s) = w_E Λ(E,2−s) with w_E the eigenvalue of −W_N on F_E. Uniqueness of the sign: completedEllipticL E 2 ≠ 0 (Euler product), so ε with Λ(s) = εΛ(2 − s) is determined by evaluating at s = 2 and s = 0. Comparison with Tau Ceti ModularForms Layer 6–7: the companion equation Λ_N(k−s,f) = i^k Λ_N(s, 𝒲_N f) with k = 2 gives the sign −ε_N.

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543; [Tau Ceti contributors](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularForms/README.md), ModularForms README, Layer 6; [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §5, after (5.2), p. 243 (read from the page image).

*Needs:* Mathlib `Complex.Gammaℂ`; EllipticCurveModularity R29.6, using the pinned entire-extension interface; EllipticCurveModularity R29.6 / l-function-continuation; EllipticCurveModularity R29.4 / exact-conductor; TauCetiRoadmap ModularForms Layer 6; TauCetiRoadmap ModularForms Layer 7; GL2AutomorphicRepresentationsAndTransfer R16.3; Tau Ceti `TauCeti.Isogeny`.

The intended declarations are:

- `WeierstrassCurve.completedEllipticL` — completedEllipticL E : ℂ → ℂ, the unique entire continuation of the Gamma product from Re s > 0.
- `WeierstrassCurve.differentiable_completedEllipticL` — completedEllipticL E is entire.
- `WeierstrassCurve.rootNumber` — rootNumber E : ℤˣ, the sign of the functional equation.
- `WeierstrassCurve.completedEllipticL_two_sub` — completedEllipticL E (2 − s) = rootNumber E * completedEllipticL E s.
- `WeierstrassCurve.rootNumber_eq_neg_fricke` — rootNumber E = −ε_N(F_E), the negative of the eigenvalue of Tau Ceti's normalised Fricke operator on the newform of E.
- `WeierstrassCurve.rootNumber_eq_of_isogenous` — Isogenous curves have equal root numbers.
- `WeierstrassCurve.rootNumber_eq_prod_local` — rootNumber E = ∏_v w_v(E) over all places, w_∞ = −1, w_ℓ = −a_ℓ at multiplicative ℓ and w_ℓ = 1 at good ℓ (local ε-factors, GL2AutomorphicRepresentationsAndTransfer R16.3).
- `WeierstrassCurve.completedEllipticL_one` — completedEllipticL E 1 = N^{1/2} π^{-1} ellipticL E 1 (Γ_ℂ(1) = π^{-1}).
- `WeierstrassCurve.exists_completedEllipticL` — There is an entire F agreeing with N^{s/2} Gammaℂ(s) ellipticL E s for Re s > 0.
- `WeierstrassCurve.completedEllipticL_eq_gammaProduct` — If Re s > 0, completedEllipticL E s = N^{s/2} Gammaℂ(s) ellipticL E s.
- `WeierstrassCurve.completedEllipticL_unique` — Two entire functions agreeing with that product on Re s > 0 are equal.

**Checks.**

- rootNumber (37a1 : y² + y = x³ − x) = −1, while the Fricke eigenvalue of its newform is +1.
- rootNumber (11a1) = +1 (a₁₁ = 1, split multiplicative, w₁₁ = −1, w_∞ = −1).
- completedEllipticL E 1 = Real.sqrt N / π · ellipticL E 1.
- For 37a1, rootNumber E ≠ ε_N(F_E): the tempting definition rootNumber := Fricke eigenvalue has the wrong sign in weight two.
- completedEllipticL E 0 = rootNumber E * completedEllipticL E 2 ≠ 0, detecting the wrong pointwise Gamma product at zero.
- w(11a1) = +1 and w(37a1) = −1.
- rootNumber is invariant under ℚ-isogeny (equal L-functions and conductors).

### 0.2 Analytic rank and the leading coefficient at s = 1

For E/ℚ elliptic, analyticRank E := analyticOrderNatAt (ellipticL E) 1 ∈ ℕ, and analyticOrderAt (ellipticL E) 1 ≠ ⊤. The leading coefficient is leadingTerm E := iteratedDeriv r (ellipticL E) 1 / r! with r = analyticRank E; it is a nonzero real number, and ellipticL E s = (s − 1)^r (leadingTerm E + O(s − 1)) near s = 1. In particular analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and analyticRank E = 1 ↔ ellipticL E 1 = 0 ∧ deriv (ellipticL E) 1 ≠ 0.

Defined on the entire continuation ellipticL E, never on Mathlib's tsum E.LSeries. Finiteness uses only that ellipticL E is entire and not identically zero (it is nonzero at s = 2).

ellipticL E is analytic on the connected set ℂ and nonzero at s = 2 (ellipticL_ne_zero_of_re_gt), so its order at 1 is finite (identity theorem; AnalyticAt.analyticOrderAt_ne_top). The factorisation (s − 1)^r g(s) with g(1) ≠ 0 gives g(1) = iteratedDeriv r (ellipticL E) 1 / r! by Taylor's formula. Reality: ellipticL E is real on ℝ (actual-l-function, ellipticL_conj), hence so are all derivatives at 1. The order-zero and order-one criteria are analyticOrderAt_eq_zero and the r = 1 case of the factorisation.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Order.lean), Mathlib/Analysis/Analytic/Order.lean, docstring of analyticOrderAt; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Conjecture 1.1.1(a), p. 1; [Tau Ceti contributors](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularForms/README.md), ModularForms README, Layer 7.

*Needs:* Mathlib `analyticOrderAt`; Mathlib `analyticOrderNatAt`; Mathlib `AnalyticAt.analyticOrderAt_ne_top`; Mathlib `analyticOrderAt_eq_zero`; Mathlib `iteratedDeriv`; Mathlib `Nat.factorial`; EllipticCurveModularity R29.6, using the pinned entire-extension interface; TauCetiRoadmap ModularForms Layer 7.

The intended declarations are:

- `WeierstrassCurve.analyticRank` — analyticRank E = analyticOrderNatAt (ellipticL E) 1.
- `WeierstrassCurve.analyticOrderAt_ellipticL_ne_top` — analyticOrderAt (ellipticL E) 1 ≠ ⊤, and analyticOrderAt (ellipticL E) 1 = analyticRank E.
- `WeierstrassCurve.analyticRank_eq_zero_iff` — analyticRank E = 0 ↔ ellipticL E 1 ≠ 0.
- `WeierstrassCurve.analyticRank_eq_one_iff` — analyticRank E = 1 ↔ ellipticL E 1 = 0 ∧ deriv (ellipticL E) 1 ≠ 0.
- `WeierstrassCurve.leadingTerm` — leadingTerm E = iteratedDeriv (analyticRank E) (ellipticL E) 1 / (analyticRank E)! as a real number.
- `WeierstrassCurve.leadingTerm_ne_zero` — leadingTerm E ≠ 0.
- `WeierstrassCurve.leadingTerm_of_analyticRank_eq_zero` — analyticRank E = 0 → leadingTerm E = ellipticL E 1.
- `WeierstrassCurve.leadingTerm_of_analyticRank_eq_one` — analyticRank E = 1 → leadingTerm E = deriv (ellipticL E) 1.
- `WeierstrassCurve.ellipticL_isBigO_leading` — ellipticL E s − leadingTerm E (s − 1)^r = O((s − 1)^{r+1}) as s → 1.
- `WeierstrassCurve.analyticRank_eq_of_isogenous` — Isogenous curves have equal analytic rank and leading term.

**Checks.**

- analyticRank E = 0 ↔ ellipticL E 1 ≠ 0, and then leadingTerm E = ellipticL E 1.
- analyticRank (37a1) = 1.
- analyticRank E equals Tau Ceti ModularForms Layer 7's analytic rank of F_E (order of its entire continuation at the centre k/2 = 1).
- analyticRank E = analyticOrderNatAt (fun s ↦ ellipticL E (s + 1/2)) (1/2): the unitary centre s = 1/2 of L(s, π_E) is the motivic centre 1 (GZ.0/unitary-and-motivic-centres).
- For analytic rank one, leadingTerm E = deriv (ellipticL E) 1, not deriv (ellipticL E) 1 / 2: the factor is 1/r! = 1.
- analyticRank (11a1) = 0 and analyticRank (37a1) = 1, with the nonvanishing certified by Layer 14's rigorous enclosures.

### 0.3 The quadratic character of a quadratic field

Let K be a quadratic number field with discriminant D_K = NumberField.discr K (a fundamental discriminant) and χ_K := kroneckerCharacter D_K (ClassicalArithmeticCompletion CA.1). Then for every rational prime ℓ: χ_K(ℓ) = 1 if ℓ splits in K, −1 if ℓ is inert, 0 if ℓ ramifies (equivalently ℓ | D_K); for ℓ ∤ D_K and any arithmetic Frobenius σ at a prime above ℓ, χ_K(ℓ) = quadraticCharacter ℚ K σ (Tau Ceti); and χ_K(−1) = sign D_K, so K is imaginary iff χ_K(−1) = −1.

K/ℚ quadratic, as a number field with Algebra.IsQuadraticExtension ℚ K. χ_K is a primitive Dirichlet character of conductor |D_K| (CA.1/kronecker-character-is-primitive).

Write K = ℚ(√d) with d squarefree; D_K = d or 4d (Mathlib Int.IsFundamentalDiscr, Tau Ceti IsFundamentalDiscriminant). For odd ℓ ∤ d, ℓ splits iff d is a square mod ℓ (Dedekind–Kummer); Tau Ceti's NumberField.isArithFrobAt_multiquadratic_eq_one_iff states the Frobenius form, and kroneckerCharacter D_K (ℓ) = legendreSym ℓ D_K by CA.1. For ℓ = 2 ∤ D_K (d ≡ 1 mod 4), 2 splits iff d ≡ 1 mod 8, matching kroneckerCharacter's value at 2. Ramified primes are exactly ℓ | D_K (discriminant criterion), where χ_K vanishes. The pinned multiquadratic Frobenius theorem covers odd unramified primes only. Obtain the prime 2 splitting criterion and identification of the discriminant Kronecker character with the quadratic Galois character from the specified arithmetic/local exports; do not infer them from that theorem.

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543.

*Needs:* ClassicalArithmeticCompletion CA.1 / kronecker-character; ClassicalArithmeticCompletion CA.1 / kronecker-character-is-primitive; Tau Ceti `Algebra.IsQuadraticExtension.quadraticCharacter`; Tau Ceti `NumberField.isArithFrobAt_multiquadratic_eq_one_iff`; Mathlib `IsArithFrobAt`; Mathlib `NumberField.discr`; Mathlib `Int.IsFundamentalDiscr`; Mathlib `Algebra.IsQuadraticExtension`; ClassicalArithmeticCompletion CA.1.

The intended declarations are:

- `TauCeti.BSD.quadratic_field_character` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- K = ℚ(√−7): D_K = −7, χ_K(2) = 1 (2 splits), χ_K(3) = −1 (3 inert), χ_K(7) = 0.
- K = ℚ(i): D_K = −4, χ_K = χ₄.

### 0.4 Trace of Frobenius of a twist over a finite field

Let F be a finite field with q elements and E an elliptic Weierstrass curve over F, a_q(E) := q + 1 − #E(F). (i) If char F ≠ 2 and d ∈ Fˣ, the twist E_d := E.quadraticTwistOf 0 (−d/4) (discriminant D = d) satisfies a_q(E_d) = quadraticChar F d · a_q(E); this includes d a square, where E_d ≅ E and the factor is 1. (ii) If char F = 2 and E_c := E.quadraticTwistOf 1 c (discriminant 1, the Artin–Schreier twist by x² − x + c), then a_q(E_c) = (−1)^{Tr_{F/𝔽₂}(c)} · a_q(E).

E elliptic over a finite field; for (i) char F odd. The twist is Tau Ceti's quadraticTwistOf; its Weierstrass model is elliptic when D ≠ 0.

Odd characteristic: complete the square, y² = f(x) with f a cubic; the twist is d y² = f(x) up to a change of variables (Tau Ceti exists_smul_quadraticTwistOf_eq). Count points: for each x ∈ F there are 1 + χ(f(x)) points on E and 1 + χ(d f(x)) = 1 + χ(d)χ(f(x)) on E_d; add the point at infinity and sum. Characteristic two: for a₁x+a₃≠0 divide the equation to obtain an Artin–Schreier equation, whose trace obstruction changes by Tr(c). For a₁x+a₃=0, y↦y² is bijective and both curves have exactly one point above x; this contribution has zero trace sign and must be handled separately.

The source comparison is [Tau Ceti contributors](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean), TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistOf.

*Needs:* Tau Ceti `WeierstrassCurve.quadraticTwistOf`; Mathlib `quadraticChar`; TauCetiRoadmap EllipticCurves Layer 3.

The intended declarations are:

- `TauCeti.BSD.finite_field_twist_trace` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Over 𝔽₅, E : y² = x³ + x + 1 has 9 points (a = −3); with d = 2 (a nonsquare) the twist 2y² = x³ + x + 1 has 3 points (a = 3).
- d = 4 (a square in 𝔽₅) gives the same count 9.

### 0.5 Root-number parity of the analytic rank

For every E/ℚ elliptic, (−1)^{analyticRank E} = rootNumber E. Consequently rootNumber E = −1 implies ellipticL E 1 = 0, and analyticRank E = 1 implies rootNumber E = −1.

E/ℚ elliptic.

Write Λ = completedEllipticL E and r = analyticRank E. The factor N^{s/2}Γ_ℂ(s) is analytic and nonzero at s = 1, so ord_{s=1} Λ = r. The functional equation Λ(1 + t) = w_E Λ(1 − t) compares Taylor coefficients at t = 0: c_k = w_E (−1)^k c_k. Taking k = r, where c_r ≠ 0, gives (−1)^r = w_E.

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543.

*Needs:* §0.1 (the completed l-function and the root number); §0.2 (analytic rank and the leading coefficient at s = 1); Mathlib `analyticOrderAt`; Mathlib `iteratedDeriv`.

The intended declarations are:

- `TauCeti.BSD.root_number_parity` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- 37a1: w = −1 and analyticRank = 1; 11a1: w = +1 and analyticRank = 0.
- For the congruent-number twists (congruent-number-root-numbers) the parity of the analytic rank is read off n mod 8.

### 0.6 Local Euler factors of a quadratic twist

Let E/ℚ be elliptic, K a quadratic field with character χ = χ_K and E^K := E.quadraticTwist K. (a) For every prime ℓ ∤ D_K, E^K has the same reduction type as E at ℓ and its local polynomial is P_ℓ(E^K, T) = P_ℓ(E, χ(ℓ)T): at good ℓ, a_ℓ(E^K) = χ(ℓ)a_ℓ(E); at multiplicative ℓ, split and nonsplit reduction are exchanged exactly when χ(ℓ) = −1; at additive ℓ both factors are 1. (b) For ℓ | D_K, P_ℓ(E^K, T) = det(1 − Frob_ℓ T | (V_r(E) ⊗ χ_ℓ)^{I_ℓ}) for any prime r ≠ ℓ, where χ_ℓ is the local character of K at ℓ; in particular if E has good or multiplicative reduction at ℓ then E^K has additive reduction at ℓ and P_ℓ(E^K, T) = 1.

Mathlib's localPolynomial is computed on minimal models (WeierstrassCurve.minimal); the comparison includes the change to a minimal model of the twist. ℓ = 2 is included in both (a) and (b).

(a), ℓ odd: D_K is an ℓ-adic unit, so the twisted model has Δ ↦ D⁶Δ with the same valuation; minimality and the reduction type are preserved, and the reduction of E^K is the twist of the reduction of E by the class of D_K mod ℓ (finite-field-twist-trace). Multiplicative reduction: the tangent directions at the result are defined over 𝔽_ℓ(√(−c₆)); twisting multiplies −c₆ by D³, so splitness flips exactly when D_K is a nonsquare mod ℓ, i.e. χ(ℓ) = −1. (a), ℓ = 2 ∤ D_K: D_K ≡ 1 mod 4, and the twist is an Artin–Schreier twist over 𝔽₂ by x² − x + (1 − D_K)/4, whose trace is 1 exactly when D_K ≡ 5 mod 8, i.e. χ(2) = −1 (finite-field-twist-trace (ii)). (b): the Tate module of E^K is V_r(E) ⊗ χ as a G_ℚ-representation (Tau Ceti quadraticTwistPointEquiv twists the Galois action by the quadratic character). The Néron–Ogg–Shafarevich criterion and the Galois description of local factors (EllipticCurves Layer 4; EllipticCurveModularity R29.4/bad-euler-factors) give the local polynomial as the characteristic polynomial on inertia invariants. If V_r(E) is unramified or has unipotent inertia action, tensoring with the ramified χ_ℓ kills the invariants.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Footnote 7, p. 42; [Christopher Skinner and Wei Zhang](https://arxiv.org/abs/1407.1099v1), §9.1, Corollary 9.2 and proof, p. 29.

*Needs:* §0.4 (trace of frobenius of a twist over a finite field); §0.3 (the quadratic character of a quadratic field); Tau Ceti `WeierstrassCurve.quadraticTwist`; Tau Ceti `WeierstrassCurve.isElliptic_quadraticTwist`; Mathlib `WeierstrassCurve.localPolynomial`; Mathlib `WeierstrassCurve.HasGoodReduction`; Mathlib `WeierstrassCurve.HasSplitMultiplicativeReduction`; Mathlib `WeierstrassCurve.HasMultiplicativeReduction`; Mathlib `WeierstrassCurve.HasAdditiveReduction`; EllipticCurveModularity R29.4 / bad-euler-factors; TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 5.

The intended declarations are:

- `TauCeti.BSD.twist_local_factors` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, K = ℚ(√−7): a₂(E) = −2 and χ(2) = 1, so a₂(E^K) = −2; a₃(E) = −1 and χ(3) = −1, so a₃(E^K) = 1.
- E = 11a1, K = ℚ(√−1): at ℓ = 11, χ(11) = −1, so the split multiplicative reduction of E becomes nonsplit for E^K.

### 0.7 The L-series and conductor of a quadratic twist coprime to the conductor

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then E.quadraticTwist K has conductor N·D_K², its coefficients are a_n(E^K) = χ_K(n)·a_n(E) for every n ≥ 1, ellipticL E^K is the entire continuation of Σ χ_K(n)a_n(E)n^{-s}, and the newform of E^K is the twist F_E ⊗ χ_K, a newform of level N D_K².

(D_K, N) = 1. Without it the coefficients at ℓ | (D_K, N) and the conductor need twist-local-factors (b).

For ℓ ∤ D_K, twist-local-factors (a) gives P_ℓ(E^K,T) = P_ℓ(E, χ(ℓ)T), so a_{ℓ^k}(E^K) = χ(ℓ)^k a_{ℓ^k}(E). For ℓ | D_K, ℓ ∤ N: E has good reduction at ℓ, so E^K is additive there (twist-local-factors (b)) and a_{ℓ^k}(E^K) = 0 = χ(ℓ^k)a_{ℓ^k}(E). Multiplicativity of both coefficient sequences gives the identity for all n. Conductor: at ℓ | D_K the representation V ⊗ χ_ℓ has V unramified, so its conductor exponent is 2·a(χ_ℓ) = 2 v_ℓ(D_K); elsewhere it is unchanged (R29.4/exact-conductor identifies the level with this conductor). Newform: F_E ⊗ χ_K has the coefficients a_n(E^K) and level N D_K² (twist of a newform by a character of coprime conductor is new), and equals F_{E^K} by strong multiplicity one (R29.3/newform-of-E).

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Footnote 8, p. 43.

*Needs:* §0.6 (local euler factors of a quadratic twist); §0.3 (the quadratic character of a quadratic field); EllipticCurveModularity R29.3 / newform-of-E; EllipticCurveModularity R29.4 / exact-conductor; Mathlib `WeierstrassCurve.LFunction`; EllipticCurveModularity R29.6, using the pinned entire-extension interface.

The intended declarations are:

- `TauCeti.BSD.twist_l_series` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, K = ℚ(√−7): E^K has conductor 11·49 = 539.

### 0.8 Factorisation of the L-function over a quadratic field

Let E/ℚ be elliptic and K a quadratic field. As arithmetic functions, (E.baseChange K).LFunction = E.LFunction ⍟ (E.quadraticTwist K).LFunction (Dirichlet convolution), the left side being Mathlib's Euler product over the height-one primes of 𝓞_K grouped by norm. Hence (E.baseChange K).LSeries s = E.LSeries s · (E.quadraticTwist K).LSeries s for Re s > 3/2, and L(E/K, s) has the entire continuation ellipticL E · ellipticL E^K.

K/ℚ quadratic (real or imaginary); no coprimality between D_K and N is assumed.

Both sides are Euler products; compare, for each rational prime ℓ, the product of the factors of E/K at the primes 𝔩 | ℓ with P_ℓ(E,T)P_ℓ(E^K,T). ℓ split: K_𝔩 = ℚ_ℓ for both 𝔩, and E^K ≅ E over ℚ_ℓ since D_K is a square there, so both sides are P_ℓ(E,T)². ℓ inert: one prime of norm ℓ², with factor P_𝔩(E/K, T²) computed over the quadratic unramified extension; at good ℓ the identity (1 − αT)(1 − βT)(1 + αT)(1 + βT) = (1 − α²T²)(1 − β²T²) with t_{ℓ²} := ℓ² + 1 − #E(𝔽_{ℓ²}) = a_ℓ² − 2ℓ (point count over 𝔽_{ℓ²}, EllipticCurves Layer 3) (the Dirichlet coefficient a_{ℓ²} instead equals a_ℓ² − ℓ) and twist-local-factors (a) with χ(ℓ) = −1; at multiplicative ℓ (1 − aT)(1 + aT) = 1 − T² since the reduction over 𝔽_{ℓ²} is split; at additive ℓ both sides are 1. ℓ ramified: one prime of norm ℓ; as I_ℓ/I_𝔩 ≅ {±1} acts on V^{I_𝔩} by an involution, V^{I_𝔩} = V^{I_ℓ} ⊕ (V ⊗ χ_ℓ)^{I_ℓ} as Frobenius modules, which is twist-local-factors (b). Convergence for Re s > 3/2 of each factor gives the LSeries identity (LSeries_convolution); the product of the two entire functions agrees with it there, so it is the continuation.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46; [Thomas Browning (Mathlib)](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean), Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean, docstring of LFunction.

*Needs:* §0.6 (local euler factors of a quadratic twist); EllipticCurveModularity R29.6, using the pinned entire-extension interface; Mathlib `WeierstrassCurve.LFunction`; Mathlib `WeierstrassCurve.LSeries`; Mathlib `WeierstrassCurve.baseChange`; Mathlib `ArithmeticFunction.eulerProduct`; Mathlib `LSeries_convolution`; TauCetiRoadmap EllipticCurves Layer 3; TauCetiRoadmap EllipticCurves Layer 4.

The intended declarations are:

- `TauCeti.BSD.base_change_factorization` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, K = ℚ(√−7): the coefficient of 2^{−s} in L(E/K,s) is a₂(E) + a₂(E^K) = −4 (two primes of norm 2, each with a = −2).
- Coefficient of 3^{−s} in L(E/K,s) is 0 (3 inert: no ideal of norm 3), matching a₃(E) + a₃(E^K) = −1 + 1.

### 0.9 Root numbers of the congruent-number twists

Let E : y² = x³ − x (conductor 32) and, for a positive squarefree integer n, E^(n) : n y² = x³ − x, the twist by the quadratic character attached to n (for n=1 use E itself; ℚ(√1) is not a quadratic extension). Then rootNumber E^(n) = +1 exactly when n ≡ 1, 2, 3 (mod 8), and −1 when n ≡ 5, 6, 7 (mod 8). E^(−1) ≅ E, so the classification is for positive n only.

n > 0 squarefree. The twist-root-number formula does not apply directly, since D = disc ℚ(√n) is even when n ≢ 1 mod 4 or n even, and 2 | N.

Write rootNumber E^(n) = w_∞ · w_2 · ∏_{ℓ | n odd} w_ℓ with w_∞ = −1 (rootNumber_eq_prod_local). For odd ℓ | n, E^(n) has additive potentially good reduction of type I₀* at ℓ and w_ℓ = (−1/ℓ) (local ε-factor of a ramified quadratic twist of an unramified representation, GL2AutomorphicRepresentationsAndTransfer R16.3). At 2, w_2(E^(n)) depends only on n mod 8 (E has CM by ℤ[i] and potentially good reduction at 2); evaluate it on the representatives n = 1, 2, 3, 5, 6, 7 (Birch–Stephens). Combine: the product is +1 exactly for n ≡ 1, 2, 3 (mod 8).

The source comparison is [Ashay A. Burungale and Ye Tian](https://arxiv.org/abs/2506.03465v2), Footnote 2 to Theorem 1.2, p. 2.

*Needs:* §0.1 (the completed l-function and the root number); §0.6 (local euler factors of a quadratic twist); §0.5 (root-number parity of the analytic rank); GL2AutomorphicRepresentationsAndTransfer R16.3.

The intended declarations are:

- `TauCeti.BSD.congruent_number_root_numbers` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- n = 1, 2, 3: w = +1 (not congruent numbers); n = 5, 6, 7: w = −1 (congruent numbers, analytic rank odd).
- The ArithmeticStatistics ST.5 consumer reads w(E^(n)) = +1 for n ≡ 1, 2, 3 mod 8 from this result.

### 0.10 Root number of a quadratic twist

Let E/ℚ be elliptic of conductor N and K a quadratic field with (D_K, N) = 1. Then rootNumber (E.quadraticTwist K) = χ_K(−N)·rootNumber E. In particular, if K is imaginary and every prime dividing N splits in K, then rootNumber E^K = −rootNumber E, and rootNumber E · rootNumber E^K = −1.

(D_K, N) = 1. For K imaginary χ_K(−1) = −1; the Heegner hypothesis gives χ_K(N) = 1.

Twist the completed function: Λ(s, F_E ⊗ χ_K) with conductor N D_K² (twist-l-series). The twist of a newform of level N and sign ε by a primitive character χ of conductor D coprime to N has sign ε·χ(N)·τ(χ)²/D; for quadratic χ = χ_K, τ(χ_K)² = χ_K(−1)|D_K|, so the sign is ε·χ_K(−N). Equivalently, with local ε-factors (GL2AutomorphicRepresentationsAndTransfer R16.3) only the places ℓ | D_K change, together contributing χ_K(−N). Under the Heegner hypothesis χ_K(N) = ∏ χ_K(ℓ)^{v_ℓ(N)} = 1 and χ_K(−1) = −1.

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543; [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543.

*Needs:* §0.1 (the completed l-function and the root number); §0.7 (the l-series and conductor of a quadratic twist coprime to the conductor); §0.3 (the quadratic character of a quadratic field); GL2AutomorphicRepresentationsAndTransfer R16.3.

The intended declarations are:

- `TauCeti.BSD.twist_root_number` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1 (w = −1), K = ℚ(√−7) (37 ≡ 2 mod 7 is a square, so 37 splits): w(E^K) = +1.
- E = 11a1 (w = +1), K = ℚ(√−7) (11 ≡ 4 mod 7 is a square): w(E^K) = −1.

### 0.11 Order, leading term and sign of L(E/K, s) at the centre

Let E/ℚ be elliptic, K quadratic, r = analyticRank E and r' = analyticRank E^K. The continuation ellipticL E · ellipticL E^K of L(E/K,s) has order r + r' at s = 1 and leading coefficient leadingTerm E · leadingTerm E^K. In particular (a) if r = 1 and ellipticL E^K 1 ≠ 0, then L(E/K,s) has a simple zero and L′(E/K,1) = L′(E,1)·L(E^K,1); (b) if r = 0 and r' = 1, then L′(E/K,1) = L(E,1)·L′(E^K,1). If (D_K, N) = 1, K is imaginary and every prime dividing N splits in K, then r + r' is odd.

K quadratic; for the parity statement, the Heegner hypothesis and (D_K, N) = 1.

Orders add and leading coefficients multiply for a product of analytic functions (Mathlib analyticOrderAt of a product). (a), (b) are the cases r + r' = 1 of the product rule. Parity: root-number-parity for E and E^K and twist-root-number give (−1)^{r+r'} = w(E)w(E^K) = −1.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45.

*Needs:* §0.8 (factorisation of the l-function over a quadratic field); §0.2 (analytic rank and the leading coefficient at s = 1); §0.5 (root-number parity of the analytic rank); §0.10 (root number of a quadratic twist); Mathlib `analyticOrderAt`; Mathlib `analyticOrderAt_mul`.

The intended declarations are:

- `TauCeti.BSD.base_change_central_identities` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1, K = ℚ(√−7): r = 1 and w(E^K) = +1 (twist-root-number), consistent with r' even.

### Examples

For (E:y^2=x^3+x+1) over 𝔽₅ the point count is 9, so (a_5=-3). Its nonsquare twist by 2 has 3 points and trace 3; a square twist by 4 retains the trace −3. Over 𝔽₂ᵐ the exceptional fibers (a_1x+a_3=0) each contribute one point on both models and must be counted before the Artin–Schreier sign is applied. For the first curve the extension-field trace is (a_{25}=(-3)^2-2·5=-1), whereas the rational Dirichlet coefficient at (5^2) is ((-3)^2-5=4). These two quantities belong to different comparisons.

For the imported 37a1 example the Fricke eigenvalue is +1 and the analytic root number is −1. Its completed value at zero comes from the entire continuation and the value at two; substituting Lean's totalized Gamma product at zero would give zero. At analytic rank one, the leading coefficient is the derivative itself. A negative root number forces central vanishing but does not distinguish rank one from rank three.

### Dependencies

Supplier interfaces: ClassicalArithmeticCompletion CA.1; ClassicalArithmeticCompletion CA.1 / kronecker-character; ClassicalArithmeticCompletion CA.1 / kronecker-character-is-primitive; EllipticCurveModularity R29.3 / newform-of-E; EllipticCurveModularity R29.4 / bad-euler-factors; EllipticCurveModularity R29.4 / exact-conductor; EllipticCurveModularity R29.6 / l-function-continuation; EllipticCurveModularity R29.6, using the pinned entire-extension interface; GL2AutomorphicRepresentationsAndTransfer R16.3; Mathlib `Algebra.IsQuadraticExtension`; Mathlib `AnalyticAt.analyticOrderAt_ne_top`; Mathlib `ArithmeticFunction.eulerProduct`; Mathlib `Complex.Gammaℂ`; Mathlib `Int.IsFundamentalDiscr`; Mathlib `IsArithFrobAt`; Mathlib `LSeries_convolution`; Mathlib `Nat.factorial`; Mathlib `NumberField.discr`; Mathlib `WeierstrassCurve.HasAdditiveReduction`; Mathlib `WeierstrassCurve.HasGoodReduction`; Mathlib `WeierstrassCurve.HasMultiplicativeReduction`; Mathlib `WeierstrassCurve.HasSplitMultiplicativeReduction`; Mathlib `WeierstrassCurve.LFunction`; Mathlib `WeierstrassCurve.LSeries`; Mathlib `WeierstrassCurve.baseChange`; Mathlib `WeierstrassCurve.localPolynomial`; Mathlib `analyticOrderAt_eq_zero`; Mathlib `analyticOrderAt_mul`; Mathlib `analyticOrderAt`; Mathlib `analyticOrderNatAt`; Mathlib `iteratedDeriv`; Mathlib `quadraticChar`; Tau Ceti `Algebra.IsQuadraticExtension.quadraticCharacter`; Tau Ceti `NumberField.isArithFrobAt_multiquadratic_eq_one_iff`; Tau Ceti `TauCeti.Isogeny`; Tau Ceti `WeierstrassCurve.isElliptic_quadraticTwist`; Tau Ceti `WeierstrassCurve.quadraticTwistOf`; Tau Ceti `WeierstrassCurve.quadraticTwist`; TauCetiRoadmap EllipticCurves Layer 3; TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 5; TauCetiRoadmap ModularForms Layer 6; TauCetiRoadmap ModularForms Layer 7.

## Layer 1: Rational modular-symbol periods

The central-value rationality statement precedes finite Selmer bounds, so those bounds never become an input to their own normalization.

### 1.1 Rationality of L(E,1)/Ω_E

For every elliptic curve E/ℚ, ellipticL E 1 / Ω_E is rational, where Ω_E is the full real Néron period. When L(E,1)≠0 the ratio is nonzero. No specific denominator bound is asserted without a separate integral modular-symbol/Manin–Drinfeld computation.

E/ℚ elliptic; the Manin constant enters through the comparison of Ω_E with the modular-symbol period Ω_f^+.

Modular symbols: L(f, 1) = −2πi ∫_0^{i∞} f(z)dz = Ω_f^+ · ½T(φ^+) with T(φ^+) ∈ ℚ (MSPL L1/critical-value-algebraicity with k = 0, j = 0, χ = 1, f = F_E, coefficient field ℚ). Period comparison: φ_E^* ω_E = c·2πi F_E dz (EllipticCurveModularity R29.5/modular-parametrisation); the image of H₁(X₀(N), ℤ)^+ under ∫ φ_E^*ω_E is a sublattice of the real period lattice of E of finite index, so −2πiΩ_f^+(φ^+) ∈ ℚ^× · Ω_E⁰ for an integral generator φ^+ (MSPL L1/integral-period-lattices). Ω_E = c∞ Ω_E⁰ (GZ.0/real-period-components), with c∞ ∈ {1, 2}. Combine with EllipticCurveModularity R29.3–R29.6 (L(E, s) = L(F_E, s)).

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(i), p. 42; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.3.2, (7.3.b), p. 44.

*Needs:* ModularSymbolsPadicLFunctions L1 / critical-value-algebraicity; ModularSymbolsPadicLFunctions L1 / period-lines; ModularSymbolsPadicLFunctions L1 / integral-period-lattices; EllipticCurveModularity R29.5 / modular-parametrisation; GrossZagierAndArithmeticHeights GZ.0 / real-period-components; EllipticCurveModularity R29.3–R29.6; §0.2 (analytic rank and the leading coefficient at s = 1); TauCetiRoadmap EllipticCurves Layer 7; GrossZagierAndArithmeticHeights GZ.3.

The intended declarations are:

- `TauCeti.BSD.rank_zero_rationality` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1: L(E,1)/Ω_E = 1/5.
- E = 37a1: L(E,1)/Ω_E = 0 (rank one).

### Examples

The exact N=11 modular-symbol comparison gives (L(11a1,1)/Ω_{11a1}=1/5). Under the actual five-isogeny period comparison, (Ω_{11a3}=5Ω_{11a1}), so the ratio for 11a3 is (1/25). Both are rational, while their equality is not required. No Sha order is needed to prove this rationality statement. Conversely a floating-point ratio near (1/25) supplies no rationality witness.

### Dependencies

Earlier comparisons: §0.2. Supplier interfaces: EllipticCurveModularity R29.3–R29.6; EllipticCurveModularity R29.5 / modular-parametrisation; GrossZagierAndArithmeticHeights GZ.0 / real-period-components; GrossZagierAndArithmeticHeights GZ.3; ModularSymbolsPadicLFunctions L1 / critical-value-algebraicity; ModularSymbolsPadicLFunctions L1 / integral-period-lattices; ModularSymbolsPadicLFunctions L1 / period-lines; TauCetiRoadmap EllipticCurves Layer 7.

## Layer 2: Quadratic descent and BSD comparisons

Separate rational eigenspaces, the integral lattice index, odd-primary splitting and the genuine 2-primary comparison. The geometric period over an imaginary quadratic field is a distinct construction from the real period over ℚ.

### 2.1 Restriction, conjugation, trace and twist maps on points over a quadratic field

Let E/ℚ be elliptic, K a quadratic field with nontrivial automorphism σ, E_K = E.baseChange K and E^K = E.quadraticTwist K. Define the additive maps res : E(ℚ) → E(K) (Point.map along ℚ → K), conj : E(K) → E(K) (Point.map along σ), tr : E(K) → E(ℚ) with res (tr P) = P + σP, and ι : E^K(ℚ) → E(K), the composite of res for E^K with quadraticTwistPointEquiv E^K(K) ≃+ E(K). Then res and ι are injective, range res = {P : σP = P}, range ι = {P : σP = −P}, tr ∘ res = 2·id, res ∘ tr = 1 + conj, and 2·E(K) ⊆ range res + range ι.

K/ℚ quadratic; the twist is Tau Ceti's quadraticTwist and the point isomorphism is chosen once (well defined up to the automorphism −1).

res and conj are Mathlib's Point.map; σ² = 1 gives conj² = id. tr: P + σP is σ-fixed, so it descends uniquely to E(ℚ) by Point.exists_baseChange_eq_of_map_eq (uniqueness from injectivity of res). ι: by quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map with M = K and σ the nontrivial element (χ(σ) = −1), points of E^K(ℚ) go to σ-anti-fixed points; conversely an anti-fixed point of E(K) pulls back to a σ-fixed point of E^K(K), which descends. 2P = (P + σP) + (P − σP) with P + σP ∈ range res and P − σP ∈ range ι.

The source comparison is [Tau Ceti contributors](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean), TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean, docstring of quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 47.

*Needs:* Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `WeierstrassCurve.Affine.Point.map`; Mathlib `WeierstrassCurve.baseChange`; Tau Ceti `WeierstrassCurve.quadraticTwist`; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv`; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`; Tau Ceti `WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq`; TauCetiRoadmap EllipticCurves Layer 5.

The intended declarations are:

- `WeierstrassCurve.Affine.Point.quadraticRes` — res : E(ℚ) →+ E(K), injective.
- `WeierstrassCurve.Affine.Point.quadraticConj` — conj : E(K) →+ E(K), the action of σ; conj ∘ conj = id.
- `WeierstrassCurve.Affine.Point.quadraticTrace` — tr : E(K) →+ E(ℚ) with res (tr P) = P + conj P.
- `WeierstrassCurve.Affine.Point.twistEmbed` — ι : E^K(ℚ) →+ E(K), injective.
- `WeierstrassCurve.Affine.Point.quadraticTrace_res` — tr (res P) = 2 • P.
- `WeierstrassCurve.Affine.Point.res_quadraticTrace` — res (tr P) = P + conj P.
- `WeierstrassCurve.Affine.Point.range_quadraticRes` — range res = {P | conj P = P}.
- `WeierstrassCurve.Affine.Point.range_twistEmbed` — range ι = {P | conj P = −P}.
- `WeierstrassCurve.Affine.Point.two_smul_mem_sup` — 2 • P ∈ range res ⊔ range ι for every P ∈ E(K).
- `WeierstrassCurve.Affine.Point.quadraticTrace_twistEmbed` — tr (ι Q) = 0.

**Checks.**

- For E = 37a1, K = ℚ(√−7) and P = (0, 0) ∈ E(ℚ), tr (res P) = 2P = (1, 0).
- conj (ι Q) = −ι Q for every Q ∈ E^K(ℚ).
- tr is not surjective in general: for E = 37a1 (E(ℚ) = ℤ·(0,0), no torsion) and any quadratic K with E(K) = res E(ℚ) + E(K)_tors, the image of tr is 2E(ℚ) ≠ E(ℚ).
- The kernel of res + ι on E(ℚ) × E^K(ℚ) is contained in E(ℚ)[2] × E^K(ℚ)[2] (Submodule.torsionBy ℤ _ 2).
- For P ∈ E(ℚ), tr (res P) = 2P.
- ker(res + ι : E(ℚ) × E^K(ℚ) → E(K)) is a subgroup of E(ℚ)[2] × E^K(ℚ)[2].

### 2.2 Finiteness of Sha descends along a finite extension

Let E/ℚ be elliptic and K/ℚ a finite Galois extension. If Ш(E/K) is finite then Ш(E/ℚ) is finite. In particular, for K quadratic, finiteness of Ш(E/K) implies finiteness of Ш(E/ℚ) and of Ш(E^K/ℚ).

K/ℚ finite Galois; Ш as in EllipticCurves Layer 7, for the whole group (all primes).

The kernel of restriction Ш(E/ℚ) → Ш(E/K) lies in H¹(Gal(K/ℚ), E(K)) by inflation–restriction. E(K) is finitely generated (Mordell–Weil) and Gal(K/ℚ) is finite, so H¹(Gal(K/ℚ), E(K)) is a finitely generated abelian group killed by [K:ℚ], hence finite. So Ш(E/ℚ) is an extension of a subgroup of the finite Ш(E/K) by a finite group. For E^K apply the same argument, since E^K ≅ E over K.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §1.2, p. 1.

*Needs:* Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; TauCetiRoadmap EllipticCurves Layer 7; Tau Ceti `TauCeti.ContCohomology.H1`.

The intended declarations are:

- `TauCeti.BSD.sha_finiteness_descent` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- If Ш(E/K) is finite for some imaginary quadratic K (from HE.7), then Ш(E/ℚ) is finite: this is the descent step of Layer 5 and Layer 6.

### 2.3 Rank splitting over a quadratic field

For E/ℚ elliptic and K a quadratic field, rank E(K) = rank E(ℚ) + rank E^K(ℚ), where rank is Module.finrank ℤ of the free quotient PointModTorsion. More precisely res + ι : E(ℚ) ⊕ E^K(ℚ) → E(K) has kernel and cokernel killed by 2, both finite.

K/ℚ quadratic; all three groups finitely generated (Mordell–Weil over number fields).

Kernel: if res P + ι Q = 0 then applying conj gives res P − ι Q = 0, so 2 res P = 0 and 2 ι Q = 0, hence P ∈ E(ℚ)[2] and Q ∈ E^K(ℚ)[2]. Cokernel: 2E(K) ⊆ range res + range ι (quadratic-point-maps), so the cokernel is a quotient of E(K)/2E(K), finite by Mordell–Weil and killed by 2. Tensoring with ℚ kills both, giving the rank identity.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46.

*Needs:* §2.1 (restriction, conjugation, trace and twist maps on points over a quadratic field); Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`; Mathlib `Module.finrank`.

The intended declarations are:

- `TauCeti.BSD.rank_splitting` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1, K = ℚ(√−7): rank E(ℚ) = 1, and once rank E(K) = 1 is proved (Layer 5), rank E^K(ℚ) = 0.

### 2.4 Torsion over a quadratic field

For E/ℚ elliptic, K quadratic and p an odd prime, res + ι induces E(ℚ)[p^∞] ⊕ E^K(ℚ)[p^∞] ≅ E(K)[p^∞]. At p = 2 the map E(ℚ)[2^∞] ⊕ E^K(ℚ)[2^∞] → E(K)[2^∞] has kernel and cokernel killed by 2. Consequently #E(K)_tors and #E(ℚ)_tors · #E^K(ℚ)_tors have the same odd part.

K quadratic; torsion groups finite (Mordell–Weil).

On a p-primary group with p odd, multiplication by 2 is invertible, so P = ½(P + σP) + ½(P − σP) splits E(K)[p^∞] into its ±1 eigenspaces; quadratic-point-maps identifies them. At p = 2 use the same kernel and cokernel estimates as rank-splitting. For unconditional finiteness over number fields use fg_point_of_numberField and finite torsion of a finitely generated abelian group; pinned finite_torsion additionally requires height/Northcott instances.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 47.

*Needs:* §2.1 (restriction, conjugation, trace and twist maps on points over a quadratic field); Mathlib `Submodule.torsionBy`; Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`.

The intended declarations are:

- `TauCeti.BSD.torsion_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, K = ℚ(√−7): E(ℚ)_tors ≅ ℤ/5, and E(K)[5] = E(ℚ)[5] ⊕ E^K(ℚ)[5].

### 2.5 The period of E over an imaginary quadratic field and its comparison

For E/ℚ elliptic, choose a global minimal Néron differential ω, and an imaginary quadratic field K of discriminant D. Let Λ_ω⊂ℂ be the image of H₁(E(ℂ),ℤ) under integration of ω, a discrete full ℤ-lattice. Let 𝔞_ω be the invertible fractional ideal of 𝓞_K satisfying 𝔞_ω·ω=e*Ω¹ of the Néron model. Define Ω_{E/K}=N(𝔞_ω)·4 covol(Λ_ω), where the covolume uses ordinary Euclidean Haar measure on ℂ. This equals the complex-place factor N(𝔞_ω)·2∫|ω∧ω̄| in the BSD period. If δ=[Λ_ω:Λ_ω^real+Λ_ω^imag]∈{1,2} and the twist pulls its Néron differential back to uω/√D, then Ω_E Ω_{E^K}√|D|/Ω_{E/K}=c∞(E)c∞(E^K)|u|δ/(4N(𝔞_ω)). For (D,2N)=1 the ideal is the unit ideal and u is dyadic, giving a power of two. In general the ratio is rational and is a p-unit when p∤2ND.

K imaginary quadratic; fix the minimal differential and the twist isomorphism. The norm is the absolute fractional-ideal norm, including denominators. The ratio formula retains differential changes and both real component counts; an exact dyadic exponent and the dyadic Tamagawa formula belong to the dyadic refinement.

Import the integrated homology period lattice from GZ.0 and the invertible Néron differential module from R11.6. Represent them by Submodule ℤ ℂ with DiscreteTopology/IsZLattice ℝ and a unit in FractionalIdeal (𝓞_K)⁰ K. Use native ZLattice.covolume and FractionalIdeal.absNorm; do not choose arbitrary real-valued period data. Complex uniformization identifies the integral of |ω∧ω̄| with twice the Euclidean covolume; the extra complex-place factor two in JSW (7.1.b) gives four times that covolume. Positivity follows from the lattice and invertible ideal. Conjugation gives real and imaginary rank-one sublattices; their rectangular lattice has index δ=1 or 2. Its area is the product of the least real and imaginary periods, hence δ times covol(Λ_ω). Include c∞ for the full real periods of both curves and the absolute twist differential multiplier u. R11.6’s local minimal differential/base-change comparison identifies 𝔞_ω and u. Away from 2ND their valuations vanish. When (D,2N)=1, 𝔞_ω=1 and u has only dyadic valuation. Substitute into the displayed rational ratio; the all-prime dyadic exponent is a refinement, not an input to an odd-primary identity.

The source comparison is [JSW (published)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf), §7.1, (7.1.b), printed p.421; [Benedict H. Gross and Don B. Zagier](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, printed pp.310–312, particularly p.312 period identity.

*Needs:* GrossZagierAndArithmeticHeights GZ.0 / real-period-components; NeronModelsAndSemistableAbelianVarieties R11.6 / semistable-differential-basechange; NeronModelsAndSemistableAbelianVarieties R11.6 / equation-minimal-differential; §2.1 (restriction, conjugation, trace and twist maps on points over a quadratic field); TauCetiRoadmap EllipticCurves Layer 7; TauCetiRoadmap EllipticCurves Layer 4; Tau Ceti `TauCeti.Isogeny`; Tau Ceti `TauCeti.Isogeny.degree`; Mathlib `IsZLattice`; Mathlib `ZLattice.covolume`; Mathlib `ZLattice.covolume_pos`; Mathlib `FractionalIdeal.absNorm`; Mathlib `FractionalIdeal.absNorm_eq_zero_iff`.

The intended declarations are:

- `WeierstrassCurve.quadraticPeriod` — Ω_{E/K}=N(𝔞_ω)·4 covol(Λ_ω), with actual full period lattice and invertible fractional differential ideal.
- `WeierstrassCurve.quadraticPeriod_pos` — 0 < Ω_{E/K}.
- `WeierstrassCurve.quadraticPeriod_eq_covolume` — If 𝔞_ω = 𝓞_K then Ω_{E/K} = 4·covol(Λ_ω), Λ_ω the period lattice of the Néron differential.
- `WeierstrassCurve.realPeriod_mul_twist_eq` — For (D,2N)=1, Ω_E Ω_{E^K}√|D|=2^e Ω_{E/K} for an integer e; compute e from c∞, the rectangular lattice index and the twist differential multiplier, as in the displayed exact ratio.
- `WeierstrassCurve.padicValRat_period_ratio` — For p ∤ 2DN, the p-adic valuation of the rational number Ω_E Ω_{E^K}|D|^{1/2}/Ω_{E/K} is 0.
- `WeierstrassCurve.quadraticPeriod_of_isogenous` — Under a ℚ-isogeny of degree prime to p the ratio of periods over K is a p-adic unit.
- `WeierstrassCurve.quadraticPeriod_eq_norm_mul_covolume` — quadraticPeriod E K = FractionalIdeal.absNorm(𝔞_ω) · (4·ZLattice.covolume Λ_ω volume); the norm is rational before casting to ℝ.

**Checks.**

- Ω_{E/K} > 0 for every E/ℚ and K imaginary quadratic.
- For (D,2N)=1, the real/twist/quadratic-period ratio is a nonzero rational power of two. This tests agreement with the complex covolume and all real components.
- If the Néron differential ideal has norm 1 and its period-lattice covolume c is positive, Ω_{E/K}=4c and Ω_{E/K}≠2c. This detects the missing factor 2 in the complex integral, without asserting an unproved transcendence comparison with Ω_E².
- For the unit differential ideal Ω_{E/K}=4 covol(Λ_ω)>0. For p∤2ND the actual rational real/twist/quadratic-period ratio has valuation zero. JSW (7.3.e) concerns the congruence period; it is not a source for this geometric lattice identity.

### 2.6 Lattice index and regulators over a quadratic field

Let E/ℚ be elliptic, K quadratic, Λ = E(K)/tors, Λ₊ = image of res and Λ₋ = image of ι, r₊ = rank E(ℚ), r₋ = rank E^K(ℚ), r = r₊ + r₋. Then Λ₊ ⊥ Λ₋ for the Néron–Tate pairing over K, [Λ : Λ₊ ⊕ Λ₋] = 2^a with 0 ≤ a ≤ r, and with K-relative heights (⟨P, P⟩_K = [K:ℚ]·⟨P, P⟩_ℚ for P defined over ℚ) Reg_BSD(E/K) = 2^r · Reg_BSD(E/ℚ) · Reg_BSD(E^K/ℚ) / 4^a. In particular, if r₋ = 0 then Reg_BSD(E/K) = 2^{r₊} Reg_BSD(E/ℚ)/4^a and E(K)/tors contains res(E(ℚ)/tors) with index 2^a.

Reg_BSD is the regulator of GrossZagierAndArithmeticHeights GZ.0 (x-height normalisation, Reg_BSD = 2^r · Tau Ceti regulator). Use Mathlib’s native NumberField.instAdmissibleAbsValues and Northcott instances at the pin. GZ.0 supplies the relative x-height normalization and compatible-place comparison under extension, rather than a missing number-field height instance.

Orthogonality: the height pairing over K is invariant under σ; for P ∈ Λ₊, Q ∈ Λ₋, ⟨P, Q⟩ = ⟨σP, σQ⟩ = −⟨P, Q⟩. Index: 2Λ ⊆ Λ₊ ⊕ Λ₋ (quadratic-point-maps), so the index divides 2^r. Heights of rational points relative to K are [K:ℚ] = 2 times their heights relative to ℚ; points of E^K(ℚ) carry the same K-height through the isomorphism over K. Gram determinants: det Gram_K(Λ₊ ⊕ Λ₋) = 2^{r₊}Reg(E/ℚ)·2^{r₋}Reg(E^K/ℚ), and passing to the superlattice Λ divides by its index squared (native determinant and finite-index identities in the next step). Write the sublattice Gram matrix as AᵀGA. Matrix.det_mul and Matrix.det_transpose give det(A)² det(G); AddSubgroup.index_eq_natAbs_det identifies |det(A)| with the finite lattice index. These are native pinned declarations, so the Gram determinant comparison uses those pinned APIs. NumberField.instAdmissibleAbsValues and Northcott supply the height instances; GZ.0 supplies the x-height/relative-height normalization transport.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46.

*Needs:* §2.1 (restriction, conjugation, trace and twist maps on points over a quadratic field); §2.3 (rank splitting over a quadratic field); GrossZagierAndArithmeticHeights GZ.0 / bsd-regulator; GrossZagierAndArithmeticHeights GZ.0 / x-height-canonical-height; Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`; Tau Ceti `WeierstrassCurve.Affine.regulator`; Tau Ceti `WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`; Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; Mathlib `Matrix.det_mul`; Mathlib `Matrix.det_transpose`; Mathlib `AddSubgroup.index_eq_natAbs_det`; Mathlib `NumberField.instAdmissibleAbsValues`; Mathlib `NumberField.totalWeight_eq_finrank`; Mathlib `NumberField.finite_setOfPred_logHeight₁_le`.

The intended declarations are:

- `TauCeti.BSD.quadratic_regulator_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Rank one, r₋ = 0, a = 0: Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ).
- Rank zero over K: all regulators are 1 (regulator_eq_one_of_finrank_eq_zero).

### 2.7 Odd-primary Selmer and Sha over a quadratic field

Let E/ℚ be elliptic, K quadratic and p an odd prime. Restriction and the twist isomorphism give isomorphisms Sel_{p^∞}(E/K) ≅ Sel_{p^∞}(E/ℚ) ⊕ Sel_{p^∞}(E^K/ℚ) and Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞] ⊕ Ш(E^K/ℚ)[p^∞], compatible with the Kummer maps and the decomposition of points.

p odd; the Selmer and Sha groups are those of EllipticCurves Layer 7 (Selmer structures on E[p^∞] with the Kummer local conditions).

Gal(K/ℚ) = {1, σ} has order prime to p, so restriction H¹(ℚ, M) → H¹(K, M)^{Gal(K/ℚ)} is an isomorphism for p-primary M (inflation–restriction, H^i(ℤ/2, ·) killed by 2). H¹(K, E[p^∞]) splits into σ-eigenspaces; the +1 part is H¹(ℚ, E[p^∞]) and the −1 part is H¹(ℚ, E^K[p^∞]) since E^K[p^∞] ≅ E[p^∞] ⊗ χ_K. Local conditions: at each place v of ℚ the same argument applies to ⊕_{w|v} H¹(K_w, ·) (semilocal Shapiro), and the Kummer images correspond. Sha is the cokernel of the Kummer map on Selmer groups; combine with torsion-comparison and rank-splitting for the points.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 47.

*Needs:* §2.1 (restriction, conjugation, trace and twist maps on points over a quadratic field); §2.4 (torsion over a quadratic field); TauCetiRoadmap EllipticCurves Layer 7; ArithmeticGaloisDuality R02.4 / restricted-product-cohomology; Tau Ceti `TauCeti.ContCohomology.H1`.

The intended declarations are:

- `TauCeti.BSD.odd_selmer_sha_decomposition` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- If rank E^K(ℚ) = 0 and Ш(E^K/ℚ)[p^∞] = 0 then Ш(E/K)[p^∞] ≅ Ш(E/ℚ)[p^∞].

### 2.8 The 2-primary restriction and corestriction comparison

For E/ℚ elliptic and K quadratic, let R:Sel_{2∞}(E/ℚ)⊕Sel_{2∞}(E^K/ℚ)→Sel_{2∞}(E/K) be the combined ordinary and twisted restriction maps, and C the corresponding pair of corestrictions. Then C∘R=2·id on the direct sum and R∘C=2·id on Sel(E/K). The same holds on Sha[2∞]. Hence their kernels and cokernels are killed by 2, and finite using finite Sel₂ and the isogeny local-condition comparison. No integral direct sum decomposition at 2 is asserted. The formula res∘cor=1+σ applies only to the untwisted summand; the twisted summand contributes 1−σ.

The 2-primary groups of EllipticCurves Layer 7; no hypothesis on E[2].

The rational isogenies Res_{K/ℚ}E ⇄ E×E^K induced by trace and twisted trace compose to multiplication by 2 in both orders. Obtain their Selmer and Sha maps from EC Layer 7, with Weil restriction and local Kummer compatibility. The untwisted and twisted norms are 1+σ and 1−σ; adding gives 2. Cross terms vanish. The finite isogeny-Selmer kernel and cokernel, or finite Sel₂ plus the local comparison, proves finiteness; being killed by 2 by itself is insufficient.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.2, p. 42.

*Needs:* §2.1 (restriction, conjugation, trace and twist maps on points over a quadratic field); §2.7 (odd-primary selmer and sha over a quadratic field); TauCetiRoadmap EllipticCurves Layer 7; Tau Ceti `TauCeti.ContCohomology.H1`.

The intended declarations are:

- `TauCeti.BSD.two_primary_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, K = ℚ(√−7): Sel₂ comparisons hold up to groups of exponent 2, and no statement about Ш[2] is made beyond this.

### 2.9 Tamagawa factors under quadratic base change and twist

Let E/ℚ be elliptic, K quadratic and p an odd prime split in K. For every rational prime ℓ, v_p(∏_{w|ℓ} c_w(E/K))=v_p(c_ℓ(E/ℚ)c_ℓ(E^K/ℚ)). Thus the same equality holds for the global Tamagawa products. The split hypothesis at the valuation prime p is retained from Skinner–Zhang Corollary 9.2; it handles ℓ=p without using a prime-to-residue-characteristic cohomology argument.

p odd; Tamagawa numbers from Tate's algorithm (EllipticCurves Layer 4) and their identification with the Néron component groups (NeronModelsAndSemistableAbelianVarieties R11.6/equation-component-comparison). p splits in K, as in the selected source Corollary 9.2. A broader version requires a separate local proof.

The p-part of c_w is the length of H¹(F_w, E[p^∞]^{I_w}) for w ∤ p (component groups and unramified cohomology, as in Skinner–Zhang Lemma 9.1). ℓ split: E^K ≅ E over ℚ_ℓ = K_w for both w, so the two sides agree. ℓ inert or ramified: with w the unique place above ℓ and p odd, restriction H¹(F_ℓ, E[p^∞]^{I_ℓ}) ⊕ H¹(F_ℓ, E^K[p^∞]^{I_ℓ}) → H¹(F_w, E[p^∞]^{I_w}) is an isomorphism (the ±1 eigenspaces of σ). At ℓ=p, K_w=ℚ_p and the local twist is trivial, so the two factors agree directly. The inertia-cohomology argument above is used only at ℓ≠p.

The source comparison is [Christopher Skinner and Wei Zhang](https://arxiv.org/abs/1407.1099v1), §9.1, Corollary 9.2, p. 29; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.3.1, (7.3.a), p. 43.

*Needs:* §2.7 (odd-primary selmer and sha over a quadratic field); NeronModelsAndSemistableAbelianVarieties R11.6 / equation-component-comparison; TauCetiRoadmap EllipticCurves Layer 4.

The intended declarations are:

- `TauCeti.BSD.tamagawa_base_change` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1 (c₁₁ = 5), K = ℚ(√−7) with 11 split: ∏_{w|11} c_w(E/K) = 25 = c₁₁(E)·c₁₁(E^K).

### 2.10 The BSD quotient over K versus over ℚ at odd primes

Under the hypotheses listed here, the valuation of the rational nonzero BSD defect for E/K equals the sum of those for E and E^K. Thus if one of the two rational-curve p-parts is already known, the p-part over K is equivalent to the other. No conclusion about the separate vanishing of two arbitrary summands follows from their sum alone.

p odd and split in K; (D_K,2N)=1. Assume matching analytic/algebraic ranks and rational nonzero normalized BSD quotients for E, E^K and E/K, with finite p-primary Sha; rank≤1 applications obtain these from Layer 5–5. The comparison itself does not assert general-rank rationality or finiteness.

L-values: L*(E/K,1) = L*(E,1)·L*(E^K,1) (§0.11). Regulators: quadratic-regulator-comparison; the powers of 2 are p-adic units. Periods: quadratic-period; |D_K|^{−1/2} in (7.1.a) cancels the |D|^{1/2} of the comparison. Tamagawa factors: tamagawa-base-change. Torsion: torsion-comparison. Sha: odd-selmer-sha-decomposition.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.1, p. 41.

*Needs:* §2.6 (lattice index and regulators over a quadratic field); §2.5 (the period of e over an imaginary quadratic field and its comparison); §2.9 (tamagawa factors under quadratic base change and twist); §2.4 (torsion over a quadratic field); §2.7 (odd-primary selmer and sha over a quadratic field); §0.11 (order, leading term and sign of l(e/k, s) at the centre).

The intended declarations are:

- `TauCeti.BSD.odd_part_bsd_over_K` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Used with p ∤ 2N D_K in Layer 10: the p-part of BSD for E/K′ plus the rank-zero p-part for E^{K′} gives the p-part for E.

### Examples

On the imported rational point (P=(0,0)) of 37a1 and K=ℚ(√−7), the quadratic trace of its restriction is (2P=(1,0)). An anti-fixed twist point has trace zero. If the rational and twist ranks are (r_+=1,r_-=0) and the free gluing index is (2^a), the relative-height regulator formula reads (Reg_K=2Reg_{ℚ}/4^a); replacing the index by the torsion order would change that formula. At odd p the two eigenspaces split integrally after p-localization. At p=2 the two isogeny compositions are multiplication by 2, so finite kernels/cokernels and finite 2-Selmer data must be retained.

For a unit Néron differential ideal and a complex period lattice of Euclidean covolume c>0 the quadratic period is 4c. The rectangular lattice index is δ=1 or 2. Both real component counts and the twist differential multiplier appear in the comparison; replacing 4c by 2c introduces a dyadic error even if every odd-primary comparison survives.

### Dependencies

Earlier comparisons: §0.11. Supplier interfaces: ArithmeticGaloisDuality R02.4 / restricted-product-cohomology; GrossZagierAndArithmeticHeights GZ.0 / bsd-regulator; GrossZagierAndArithmeticHeights GZ.0 / real-period-components; GrossZagierAndArithmeticHeights GZ.0 / x-height-canonical-height; Mathlib `AddSubgroup.index_eq_natAbs_det`; Mathlib `FractionalIdeal.absNorm_eq_zero_iff`; Mathlib `FractionalIdeal.absNorm`; Mathlib `IsZLattice`; Mathlib `Matrix.det_mul`; Mathlib `Matrix.det_transpose`; Mathlib `Module.finrank`; Mathlib `NumberField.finite_setOfPred_logHeight₁_le`; Mathlib `NumberField.instAdmissibleAbsValues`; Mathlib `NumberField.totalWeight_eq_finrank`; Mathlib `Submodule.torsionBy`; Mathlib `WeierstrassCurve.Affine.Point.map`; Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `WeierstrassCurve.baseChange`; Mathlib `ZLattice.covolume_pos`; Mathlib `ZLattice.covolume`; NeronModelsAndSemistableAbelianVarieties R11.6 / equation-component-comparison; NeronModelsAndSemistableAbelianVarieties R11.6 / equation-minimal-differential; NeronModelsAndSemistableAbelianVarieties R11.6 / semistable-differential-basechange; Tau Ceti `TauCeti.ContCohomology.H1`; Tau Ceti `TauCeti.Isogeny.degree`; Tau Ceti `TauCeti.Isogeny`; Tau Ceti `WeierstrassCurve.Affine.Point.exists_baseChange_eq_of_map_eq`; Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`; Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`; Tau Ceti `WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`; Tau Ceti `WeierstrassCurve.Affine.regulator`; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv`; Tau Ceti `WeierstrassCurve.quadraticTwist`; TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 5; TauCetiRoadmap EllipticCurves Layer 7.

## Layer 3: Auxiliary quadratic fields and nonvanishing

Produce a field with actual twist nonvanishing and compatible finite local prescriptions. A root number supplies parity, while the analytic nonvanishing theorem supplies a nonzero value or derivative.

### 3.1 Admissible discriminants with prescribed local conditions

Fix N ≥ 1 and a finite set S of primes with every ℓ | N in S, together with a local prescription π : S → {split, inert, ramified} and a sign η ∈ {±1}. A fundamental discriminant D is (S, π, η)-admissible if sign D = η and each ℓ ∈ S has the prescribed behaviour in ℚ(√D) (χ_D(ℓ) = 1, −1 or 0). The Heegner hypothesis for N is the prescription 'every ℓ | N splits'; the generalized Heegner hypothesis for a factorisation N = N⁺N⁻ with N⁻ squarefree is 'ℓ | N⁺ splits, ℓ | N⁻ inert'. The prescription is compatible with an elliptic curve E of conductor N and a target sign w ∈ {±1} if every admissible D coprime to N gives rootNumber E^{ℚ(√D)} = w (by twist-root-number this is a condition on η and on π at the primes dividing N). S contains actual primes, D≠1 is required to define a quadratic field, and compatibility includes existence of an admissible discriminant. For prescriptions ramified at a conductor prime, the coprime twist-root-number formula does not apply; use the local epsilon-factor computation separately.

Only finitely many primes are prescribed. Fundamental discriminants as in Mathlib's Int.IsFundamentalDiscr. S contains primes, and a prescription used in a nonvanishing theorem is nonempty and has the required local epsilon sign, including at ramified conductor primes.

Admissibility is decidable: it is a finite list of Kronecker-symbol conditions (quadratic-field-character). Compatibility: for (D, N) = 1, rootNumber E^D = χ_D(−N)·rootNumber E with χ_D(−N) = η·∏_{ℓ|N} χ_D(ℓ)^{v_ℓ(N)}, which is determined by η and π. For prescriptions with no ramified entries, choose a nonzero residue class satisfying the odd Legendre and dyadic Kronecker conditions, then a prime in the corresponding progression to obtain fundamental discriminants of the chosen sign. Discard D=1. General ramified prescriptions require their own compatible local construction, not a vacuous coprime implication.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45; [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 543.

*Needs:* §0.3 (the quadratic character of a quadratic field); §0.10 (root number of a quadratic twist); Mathlib `Int.IsFundamentalDiscr`; ClassicalArithmeticCompletion CA.1 / kronecker-character.

The intended declarations are:

- `TauCeti.BSD.LocalPrescription` — A finite set S of primes, a map S → {split, inert, ramified} and a sign.
- `TauCeti.BSD.LocalPrescription.Admissible` — The predicate on fundamental discriminants D: sign and Kronecker symbols at S as prescribed. Require D≠1; the set S consists of actual primes.
- `TauCeti.BSD.LocalPrescription.heegner` — The Heegner prescription for N (all ℓ | N split, sign −1).
- `TauCeti.BSD.LocalPrescription.generalizedHeegner` — The generalized Heegner prescription for N = N⁺N⁻.
- `TauCeti.BSD.LocalPrescription.admissible_decidable` — Admissibility is decidable.
- `TauCeti.BSD.LocalPrescription.rootNumber_twist_of_admissible` — For admissible D with (D, N) = 1, rootNumber E^D = η·∏_{ℓ|N} χ_D(ℓ)^{v_ℓ(N)}·rootNumber E. Assume every prime of N lies in the prescribed set S.
- `TauCeti.BSD.LocalPrescription.infinite_admissible` — If the prescription has no ramified entries, the set of admissible D is infinite (of either prescribed sign).
- `TauCeti.BSD.LocalPrescription.mono` — Enlarging S (with any prescription on the new primes) shrinks the admissible set.
- `TauCeti.BSD.LocalPrescription.admissible_congr` — Equal prescribed prime sets, equal behaviours on that set and equal signs give equivalent admissibility predicates for every D; values of the behaviour map outside S are irrelevant.

**Checks.**

- D = −7 is admissible for the Heegner prescription of N = 11.
- D = −3 is not admissible for the Heegner prescription of N = 11 (11 is inert in ℚ(√−3)).
- With S = ∅ and η = −1 every negative fundamental discriminant is admissible.
- For the Heegner prescription and (D, N) = 1, rootNumber E^D = −rootNumber E (§0.10).
- For N = 11 and S = {11}, D = −7 is admissible for 'split' (11 ≡ 4 = 2² mod 7), D = −3 is not (11 ≡ 2 mod 3 is a nonsquare).

### 3.2 The polar term of the BFH twist series and its nonvanishing

For a cuspidal even-weight newform f with trivial character and a finite set S of primes containing its conductor primes, choose the BFH arithmetic datum with all S dividing N, 8|N, m=N rad(N), r=1 and the test-vector data of §9. There exist compatible test vectors giving a nonzero polar coefficient for the central derivative branch and a nonzero polar coefficient for the central value branch. These are the weighted double-Dirichlet series of MP.8; they are not asserted to be the unweighted series over fundamental discriminants. The poles force infinitely many squareclasses supporting nonzero central values/derivatives with every S-prime split.

f a newform of even weight with trivial character (k = 2 for elliptic curves). Test vectors and K-types as in MP.8/local-test-nonzero-f, -tau, -m. The identification L(s, D₀) = L_N(s + k/2 − 2, f ⊗ χ_{D₀})/L_N(2s + k − 4, Sym²f) of MP.8/bsd2-export.

Import MP.8 two-variable polar combination, interchanges and the special-value coefficient identification. After twisting initially, BFH §9 reduces to ε=+1. BFH pp.614–615: choose σ₁,T₁,y₂ with F₁⁺(1/2,2)≠0 and τ₁(2)=0 using Proposition 3.12; independently choose σ₂,T₂,y₂ with τ₂(2)≠0 using Proposition 3.13. Subtract (9.4),(9.5) to obtain (9.6), with q=F₁⁺ τ₂ nonzero at (1/2,2). No assertion that all test values of one vector are simultaneously nonzero is used. Derivative branch, p.616: Z⁻(u,2)=0 by sign and Lemma 9.1; therefore p(1/2,2)=q(1/2,2). Differentiating (9.6), the double-pole coefficient is −(p+q) at the intersection, equal to −2q≠0. Value branch, p.617: a third vector from Proposition 3.15 has M₃(2)≠0 and τ₃(2)=0. Multiply (9.5) by M₃(2) and (9.10) by M₂(2), then subtract. After Z⁻(u,2)=0 the simple-pole coefficient is M₃(2)τ₂(2)≠0. Lemma 9.1 factors each coefficient as a holomorphic multiplier times L(s+k/2−2,f⊗χ_{D₀}); its derivative implication uses the central zero. Proposition 7.1 excludes a pole of this order from finitely many fundamental squareclasses. This proves the required infinitude, not just a nonzero series.

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544; [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544; [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §9, printed pp.614–617, equations (9.4)–(9.10), Lemma 9.1.

*Needs:* MetaplecticAutomorphicForms MP.8 / two-variable-polar-combination; MetaplecticAutomorphicForms MP.8 / fourier-residue-interchanges; MetaplecticAutomorphicForms MP.8 / two-variable-twist-series; MetaplecticAutomorphicForms MP.8 / bsd2-export; MetaplecticAutomorphicForms MP.8 / local-test-nonzero-f; MetaplecticAutomorphicForms MP.8 / local-test-nonzero-tau; MetaplecticAutomorphicForms MP.8 / local-test-nonzero-m; MetaplecticAutomorphicForms MP.7; §3.1 (admissible discriminants with prescribed local conditions).

The intended declarations are:

- `TauCeti.BSD.twist_series_residue` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- For f the newform of 37a1 (ε = −1) and S = {37}, the series over admissible D < 0 of L(1, f ⊗ χ_D)|D|^{−w} is not identically zero; every admissible D coprime to 37 has twisted sign +1 (§0.10), so no central value is forced to vanish.

### 3.3 Nonvanishing of quadratic twists and their derivatives (Bump–Friedberg–Hoffstein)

Let f be a cuspidal newform of even weight k with trivial character for Γ₀(M), S a finite set of primes containing all primes dividing M, and ε the sign of the functional equation of f. (i) There is a fundamental discriminant D with εD < 0 such that every prime in S splits in ℚ(√D) and L(s, f, χ_D) has a simple zero at s = k/2. (ii) There is a fundamental discriminant D with εD > 0 such that every prime in S splits in ℚ(√D) and L(k/2, f, χ_D) ≠ 0. Moreover in each case there are infinitely many such D.

Every prime of S split; the sign of D is forced by ε through the twisted sign εχ_D(−M) (§0.10). BFH’s introductory theorem states existence of a quadratic field (so D≠1). Its §9 proof, pp.616–617, gives infinitude through the pole obstruction for finitely many fundamental squareclasses.

twist-series-residue, including BFH Proposition 7.1, gives infinitely many fundamental squareclasses with nonzero central value or derivative; Lemma 9.1 transfers from weighted coefficients. In case (i), εD < 0 and every ℓ | M splits give sign −ε·ε = −1 for f ⊗ χ_D, so its order at k/2 is odd; a nonzero derivative means a simple zero. For a separate elementary infinitude argument, first exclude the trivial discriminant D=1 by requiring a quadratic field. To exclude any finite list of remaining D_i, choose a prime q_i dividing each D_i and enlarge S by all q_i. The new discriminant has q_i split and cannot equal D_i, which is ramified there. BFH §9 also gives infinitude directly.

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Theorem, pp. 543–544; [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Theorem, p. 544; [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), §9, pp.616–617, using Proposition7.1.

*Needs:* §3.2 (the polar term of the bfh twist series and its nonvanishing); §3.1 (admissible discriminants with prescribed local conditions); §0.10 (root number of a quadratic twist); §0.5 (root-number parity of the analytic rank).

The intended declarations are:

- `TauCeti.BSD.bfh_nonvanishing` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- For f attached to 11a1 (ε = +1), case (i) produces D < 0 with 11 split and L′(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (11 splits) whose twist has sign −1.
- For f attached to 37a1 (ε = −1), case (ii) produces D < 0 with 37 split and L(1, f ⊗ χ_D) ≠ 0; ℚ(√−7) is a candidate (37 splits) whose twist has sign +1.

### 3.4 Nonvanishing central twists with arbitrary prescribed local behaviour (Friedberg–Hoffstein)

Let f ∈ S₂(Γ₀(N)) be a newform with trivial character and (S, π, η) a local prescription (heegner-local-conditions) in which π may require primes to be split, inert or ramified. Assume admissible discriminants exist and the prescription is compatible with the actual local root-number formula: every admissible D, including those ramified at a conductor prime, has w(f ⊗ χ_D) = +1. Then there are infinitely many admissible fundamental discriminants D with L(1, f ⊗ χ_D) ≠ 0.

Compatibility with sign +1 is necessary: a twist of sign −1 has vanishing central value. The target is the prescribed-local nonvanishing theorem cited by JSW from Friedberg–Hoffstein, Annals142 (1995), Theorem B. The original full theorem range requires direct verification; direct verification of this stated range remains a source obligation. The local prescription has admissible discriminants and actual local twist sign +1; ramified conductor prescriptions cannot be justified by a statement quantified only over coprime D.

Friedberg–Hoffstein construct the twist series with arbitrary local test data on the double cover of GL₂ (MetaplecticAutomorphicForms MP.7) instead of the genus-two Jacobi construction, and extract a nonzero residue as in twist-series-residue. Obtain infinitude from the full Friedberg–Hoffstein local-character theorem, after refining the coarse split/inert/ramified data to a compatible fixed local-character template. This remains the explicit direct-source obligation. Enlarging S and demanding splitting is not a proof for prescriptions that already require ramification.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45.

*Needs:* MetaplecticAutomorphicForms MP.7; §3.1 (admissible discriminants with prescribed local conditions); §3.2 (the polar term of the bfh twist series and its nonvanishing); §0.10 (root number of a quadratic twist).

The intended declarations are:

- `TauCeti.BSD.prescribed_local_conditions_value_branch` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- JSW §7.4.1: with N = q₁⋯q_r squarefree, the conditions (gen-H), q inert or ramified and p split are compatible with sign +1 for E^{D′} when ord L(E,s) = 1.

### 3.5 Choice of a Heegner field for analytic rank zero or one

Let E/ℚ be elliptic of conductor N with analyticRank E ≤ 1, and let T be a finite set of primes. There are infinitely many imaginary quadratic fields K with discriminant D_K such that (a) every prime dividing N splits in K, (b) every prime in T splits in K, (c) D_K ∉ {−3, −4} and (D_K, 2N) = 1, and (d) analyticRank E^K = 1 − analyticRank E: if analyticRank E = 1 then ellipticL E^K 1 ≠ 0, and if analyticRank E = 0 then E^K has analytic rank one. For every such K, L(E/K, s) has a simple zero at s = 1.

Applies to every E/ℚ, including CM and nonsemistable curves; the restrictions on K are discharged by the construction and are not hypotheses on E.

Put S = {primes dividing 2N} ∪ T ∪ {3} and apply bfh-nonvanishing to f = F_E (k = 2, ε = rootNumber E = (−1)^{analyticRank E} by root-number-parity). Rank one: ε = −1, case (ii) gives D with εD > 0, i.e. D < 0, every ℓ ∈ S split and L(1, f ⊗ χ_D) ≠ 0; E^K has newform f ⊗ χ_D (§0.7) so ellipticL E^K 1 ≠ 0. Rank zero: ε = +1, case (i) gives D < 0 with a simple zero of L(s, f ⊗ χ_D), i.e. analyticRank E^K = 1. 2 split forces D ≡ 1 mod 8, so D is odd and D ≠ −4; 3 split forces D ≢ 0, 2 mod 3, so D ≠ −3; ℓ | N split forces (D, N) = 1. §0.11 gives the simple zero of L(E/K, s).

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544.

*Needs:* §3.3 (nonvanishing of quadratic twists and their derivatives (bump–friedberg–hoffstein)); §3.1 (admissible discriminants with prescribed local conditions); §0.5 (root-number parity of the analytic rank); §0.7 (the l-series and conductor of a quadratic twist coprime to the conductor); §0.11 (order, leading term and sign of l(e/k, s) at the centre); §0.2 (analytic rank and the leading coefficient at s = 1).

The intended declarations are:

- `TauCeti.BSD.heegner_field_selection` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1 (rank one): ℚ(√−7) satisfies the Heegner hypothesis (37 and 2 split) but 3 is inert in it, so it is excluded once 3 ∈ S; the fields produced have D ≡ 1 mod 24 with 37 split.
- Every K produced has D_K odd, so the Heegner points of Layer 5 are defined with u_K = 1.

### 3.6 Simultaneous choice of the auxiliary fields of the prime-part arguments

Let E/ℚ be semistable of conductor N with analyticRank E = 1, p an odd prime of good reduction with E[p] irreducible, and q ∥ N a prime at which E[p] is ramified. (a) There are infinitely many imaginary quadratic K′ with (gen-H) for N = N⁺N⁻, q inert or ramified, p split, and ellipticL E^{K′} 1 ≠ 0. (b) There are infinitely many imaginary quadratic K″ with the primes of N⁺ split, those of N⁻ inert (N⁺ = q, N⁻ = N/q if the number of prime factors of N is odd; N⁺ = 1 otherwise), p split and ellipticL E^{K″} 1 ≠ 0. (c) For E with multiplicative reduction at p > 3 and a nonsplit multiplicative q ≠ p at which E[p] ramifies, there are infinitely many K satisfying the hypotheses of Castella's corrected Theorem 1.1: a Heegner ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N, p split, 2 ∥ N if 2 is nonsplit, every q ∥ N nonsplit in K of nonsplit multiplicative reduction with at least one residually ramified, and ellipticL E^K 1 ≠ 0 whenever analyticRank E = 1.

Hypotheses as in JSW §7.4 and the Castella erratum; each list is a finite set of local conditions compatible with root number +1 for the twist.

Each set of conditions is a local prescription (heegner-local-conditions) with finitely many primes. Root numbers: w(E/K) = −1 for these K (sign −1 under (gen-H) with N⁻ having an even number of prime factors, resp. under (H)), and w(E) = −1, so w(E^K) = +1 by §0.11. Apply prescribed-local-conditions-value-branch to the newform of E. In Castella branch (c), q is ramified in K (per the erratum proof), so D_K is not coprime to N and E^K is additive at q. Compute the local epsilon signs and the Heegner-ideal ramified behaviour; §0.10 is not sufficient. For the JSW supersingular upper-bound branch, also prove the chosen twist lies in BSTW’s ordinary-support range or use the direct rank-one BSTW endpoint instead.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.2, p. 47; [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem 1.1, p. 1.

*Needs:* §3.4 (nonvanishing central twists with arbitrary prescribed local behaviour (friedberg–hoffstein)); §3.1 (admissible discriminants with prescribed local conditions); §0.11 (order, leading term and sign of l(e/k, s) at the centre); §0.10 (root number of a quadratic twist).

The intended declarations are:

- `TauCeti.BSD.auxiliary_fields_for_prime_parts` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- JSW §7.4.1 and §7.4.2: both K′ and K″ exist for every E in Theorem 1.2.1.

### Examples

For N=11 and the split prescription at 11, the fundamental discriminant −7 satisfies the prescribed Kronecker condition, whereas −3 does not. Adding p to the prescribed split set must be checked as a further local condition. In the rank-one branch select a field with a nonzero central value for the twist, so the base-change derivative equals (L'(E,1)L(E^K,1)) and is nonzero. In the rank-zero branch select a twist with a nonzero derivative. An admissible sign alone does not provide either nonvanishing.

A ramified prescription at q|N belongs to the Friedberg–Hoffstein/local-epsilon branch. It cannot be tested using the coprime formula (w(E^D)=χ_D(-N)w(E)). The field choice used by a multiplicative-prime argument must also preserve its Heegner ideal and local no-torsion hypotheses.

### Dependencies

Earlier comparisons: §0.2, §0.3, §0.5, §0.7, §0.10, §0.11. Supplier interfaces: ClassicalArithmeticCompletion CA.1 / kronecker-character; Mathlib `Int.IsFundamentalDiscr`; MetaplecticAutomorphicForms MP.7; MetaplecticAutomorphicForms MP.8 / bsd2-export; MetaplecticAutomorphicForms MP.8 / fourier-residue-interchanges; MetaplecticAutomorphicForms MP.8 / local-test-nonzero-f; MetaplecticAutomorphicForms MP.8 / local-test-nonzero-m; MetaplecticAutomorphicForms MP.8 / local-test-nonzero-tau; MetaplecticAutomorphicForms MP.8 / two-variable-polar-combination; MetaplecticAutomorphicForms MP.8 / two-variable-twist-series.

## Layer 4: Definite congruence periods

Establish this integral comparison before Heegner descent. It depends on character modules, not on a Heegner index or a rank-zero BSD theorem.

### 4.1 The definite congruence-period identity (Ribet–Takahashi, Pollack–Weston)

Let g ∈ S₂(Γ₀(N)) be a newform with trivial character and Hecke field with ring O, 𝔭 | p ≥ 5 a prime of O with p ∤ N, ρ̄_{g,𝔭} : G_ℚ → GL₂(k₀) surjective, and N = N⁺N⁻ with N⁻ squarefree with an odd number of prime factors (the definite quaternion algebra of discriminant N⁻), satisfying Pollack–Weston's hypothesis CR (in particular ρ̄ ramified at every ℓ | N⁻ with ℓ ≡ ±1 mod p, and the nonsquarefree alternatives of Hypothesis ♥ when N is not squarefree). Let η_g(N) be the congruence number of g at full level and ξ_g(N⁺, N⁻) the self-pairing of a primitive integral eigenfunction on the definite quaternion algebra. Then ord_𝔭 (η_g(N)/ξ_g(N⁺, N⁻)) = Σ_{ℓ|N⁻} t_g(ℓ), where t_g(ℓ) = length_{O_𝔭} Φ(A_g/ℚ_ℓ)_𝔭 is the 𝔭-part of the Tamagawa (component-group) factor at ℓ.

The hypotheses are those of HeegnerPointEulerSystems HE.6/ribet-takahashi-tamagawa-comparison, which consumes this result; its contract forbids HE.6, rank-zero BSD, Jochnowitz congruences and the final Heegner-index result as inputs. This is an early export (early layer Layer 4); it depends only on Néron-model character groups and the GL₂ transfer.

Character groups: for N₁N₂ with N₂ having an even number of primes, the character group X̂_r(J) of the Shimura curve Jacobian's toric part at r | N⁻ is free of rank one over the localised Hecke algebra under CR (Pollack–Weston Theorem 6.2, from NeronModelsAndSemistableAbelianVarieties R11.4/characters-graph-homology, R11.4/integral-monodromy-pairing). The monodromy pairing on X̂_r computes congruence numbers: ⟨g_r, g_r⟩ = η_g(N₁/r, rN₂) (Pollack–Weston Proposition 6.4) and the cokernel of the monodromy map is the component group (R11.4/component-cokernel). Ribet–Takahashi: comparing the pairings at successive levels gives ord_𝔭 η_g(aℓ, b) = t_g(ℓ) + ord_𝔭 η_g(a, ℓb) (Pollack–Weston (2)); degeneracy maps and their adjoints are R11.6/degeneracy-functoriality. Iterate over the primes of N⁻ and identify ξ_g(N⁺, N⁻) with η_g(N⁺, N⁻) by freeness (the GL₂ transfer of GL2AutomorphicRepresentationsAndTransfer R17.3 gives the Jacquet–Langlands eigenfunction).

The source comparison is [Robert Pollack and Tom Weston](https://arxiv.org/abs/math/0610694v1), §1, formula (1), p. 3; [Robert Pollack and Tom Weston](https://arxiv.org/abs/math/0610694v1), §6.1, end of the section.

*Needs:* NeronModelsAndSemistableAbelianVarieties R11.4 / characters-graph-homology; NeronModelsAndSemistableAbelianVarieties R11.4 / integral-monodromy-pairing; NeronModelsAndSemistableAbelianVarieties R11.4 / component-cokernel; NeronModelsAndSemistableAbelianVarieties R11.6 / degeneracy-functoriality; NeronModelsAndSemistableAbelianVarieties R11.6 / character-exact-sequences; GL2AutomorphicRepresentationsAndTransfer R17.3; GrossZagierAndArithmeticHeights GZ.3.

The intended declarations are:

- `TauCeti.BSD.definite_congruence_period` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- When N⁻ = ℓ is prime and p ∤ c_ℓ(g), ord_𝔭 η_g(N) = ord_𝔭 ξ_g(N⁺, ℓ).
- JSW use the elliptic case: δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ up to p-units (ribet-takahashi-degree-comparison).

### Examples

Take a nonsplit multiplicative fiber of type I₅. Its rational component order is one, but its geometric multiplicity is five; after a splitting extension the component order is five. At coefficient prime p=5 these have different valuations. The character-group modular-degree calculation must use the geometric monodromy multiplicity or the component order over the specified splitting field. A definite congruence period is also a different object from the complex geometric period used in quadratic BSD.

### Dependencies

Supplier interfaces: GL2AutomorphicRepresentationsAndTransfer R17.3; GrossZagierAndArithmeticHeights GZ.3; NeronModelsAndSemistableAbelianVarieties R11.4 / characters-graph-homology; NeronModelsAndSemistableAbelianVarieties R11.4 / component-cokernel; NeronModelsAndSemistableAbelianVarieties R11.4 / integral-monodromy-pairing; NeronModelsAndSemistableAbelianVarieties R11.6 / character-exact-sequences; NeronModelsAndSemistableAbelianVarieties R11.6 / degeneracy-functoriality.

## Layer 5: Analytic rank one

Gross–Zagier turns a nonzero derivative into a nontorsion point; arithmetic Kolyvagin descent then gives rank one and finiteness of the whole Sha group.

### 5.1 A nonzero derivative over K gives a non-torsion Heegner point

Let E/ℚ be elliptic of conductor N with a modular parametrisation φ : X₀(N) → E sending ∞ to O (EllipticCurveModularity R29.5), K imaginary quadratic of odd discriminant D_K with every prime dividing N split, and y_K = Tr_{H_K/K} φ(x₁) ∈ E(K) the Heegner point (HeegnerPointEulerSystems HE.1). If the continuation of L(E/K, s) = ellipticL E · ellipticL E^K has nonzero derivative at s = 1, then y_K has infinite order; conversely if y_K has infinite order then L′(E/K, 1) > 0.

Heegner hypothesis and D_K odd (Gross–Zagier's standing hypotheses; CST's version allows the general case). L(E/K, s) is the continuation of §0.8, so the derivative is that of the product.

Gross–Zagier: L′(E/K, 1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with ‖ω₀‖² > 0, C the Manin constant of φ (GZ.8/elliptic-curve-heegner-height-formula); the L-function there is the Rankin L-series of F_E with the trivial class character, which is L(E/K, s) by §0.8 and EllipticCurveModularity R29.3–R29.6. If L′(E/K, 1) ≠ 0 then ĥ_K(y_K) ≠ 0; a torsion point has canonical height 0, so y_K has infinite order. Conversely a point of infinite order has positive canonical height (isOfFinAddOrder_of_canonicalHeight_eq_zero and nonnegativity), so L′(E/K, 1) > 0.

The source comparison is [Benedict H. Gross and Don B. Zagier](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, Theorem (2.1), p. 311; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46.

*Needs:* GrossZagierAndArithmeticHeights GZ.8 / elliptic-curve-heegner-height-formula; GrossZagierAndArithmeticHeights GZ.8 / derivative-corollaries; HeegnerPointEulerSystems HE.1 / heegner-points-of-conductor-m-and-the-modular-parametrisation; EllipticCurveModularity R29.5 / modular-parametrisation; §0.8 (factorisation of the l-function over a quadratic field); EllipticCurveModularity R29.3–R29.6; Tau Ceti `WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero`.

The intended declarations are:

- `TauCeti.BSD.heegner_point_nontorsion` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1, K with D_K ≡ 1 mod 24 from §3.5: y_K has infinite order, and lies in res E(ℚ) up to torsion (heegner-point-eigenspace).

### 5.2 Complex conjugation on the Heegner point selects the rational or the twisted part

In the setting of heegner-point-nontorsion, let σ be complex conjugation (the nontrivial automorphism of K). Then σ(y_K) = −rootNumber(E)·y_K + t for a torsion point t ∈ E(K)_tors. Consequently, if y_K has infinite order: when rootNumber E = −1, tr(y_K) ∈ E(ℚ) has infinite order (so rank E(ℚ) ≥ 1); when rootNumber E = +1, the point y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order (so rank E^K(ℚ) ≥ 1).

Gross's normalisation of the parametrisation (Gross §5, Proposition 5.3 with n = 1, traced from K₁ to K); t comes from the Fricke translate of the cusp ∞ and is torsion by Manin–Drinfeld (HE.1/parameter-choice-and-degree).

σ maps x₁ to w_N(x₁)^{[𝔫]}, a Galois conjugate of the Fricke translate (HE.0/dihedral-conjugation). φ ∘ w_N = ε_N·φ + φ(w_N(∞)) with ε_N the Fricke eigenvalue on F_E and φ(w_N(∞)) torsion; summing over Gal(H_K/K) gives σ y_K = ε_N y_K + t. rootNumber E = −ε_N (§0.1), so σ y_K = −w y_K + t (the n = 1 case of HE.4/complex-conjugation-parity). If w = −1, res(tr y_K) = y_K + σ y_K = 2y_K + t, of infinite order; if w = +1, y_K − σ y_K = 2y_K − t is anti-invariant, hence in range ι (§2.1). The geometric Fricke eigenvalue is ε_N=−w_E. Thus φ∘w_N=ε_N φ+t=−w_E φ+t; do not insert an additional minus sign in the parametrisation relation. Gross Proposition 5.3 (printed p.243) matches this convention.

The source comparison is [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §5, Proposition 5.3, p. 243 (read from the page image); [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §5, (5.2) and the sentence after it, p. 243.

*Needs:* HeegnerPointEulerSystems HE.4 / complex-conjugation-parity; HeegnerPointEulerSystems HE.1 / parameter-choice-and-degree; HeegnerPointEulerSystems HE.0 / dihedral-conjugation; §0.1 (the completed l-function and the root number); §2.1 (restriction, conjugation, trace and twist maps on points over a quadratic field); §5.1 (a nonzero derivative over k gives a non-torsion heegner point).

The intended declarations are:

- `TauCeti.BSD.heegner_point_eigenspace` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1 (w = −1): y_K is, up to torsion, a nonzero multiple of the generator (0, 0) of E(ℚ).

### 5.3 Analytic rank one implies rank one and finite Sha (Gross–Zagier–Kolyvagin)

For every elliptic curve E/ℚ with analyticRank E = 1: Module.finrank ℤ (E(ℚ)/tors) = 1 and Ш(E/ℚ) is finite. No further hypothesis is placed on E: CM curves, nonsemistable curves and curves with exceptional primes are included.

E/ℚ elliptic with analyticRank E = 1 (Layer 0).

Choose K by §3.5: Heegner hypothesis, D_K ∉ {−3, −4} odd, ellipticL E^K 1 ≠ 0, so L(E/K, s) has a simple zero (§0.11 (a)). heegner-point-nontorsion: y_K has infinite order. HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) is finite (Kolyvagin, with the CM and p = 2 cases included). rootNumber E = −1 (§0.5), so heegner-point-eigenspace gives rank E(ℚ) ≥ 1; §2.3 gives rank E(ℚ) + rank E^K(ℚ) = 1, hence rank E(ℚ) = 1 and rank E^K(ℚ) = 0. No appeal to this theorem for E^K is made. §2.2: Ш(E/ℚ) is finite.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §1.2, p. 1; [Ashay A. Burungale and Ye Tian](https://arxiv.org/abs/2506.03465v2), §1.0.1, p. 1.

*Needs:* §3.5 (choice of a heegner field for analytic rank zero or one); §0.11 (order, leading term and sign of l(e/k, s) at the centre); §0.5 (root-number parity of the analytic rank); §5.1 (a nonzero derivative over k gives a non-torsion heegner point); §5.2 (complex conjugation on the heegner point selects the rational or the twisted part); HeegnerPointEulerSystems HE.7 / classical-full-sha-finiteness; §2.3 (rank splitting over a quadratic field); §2.2 (finiteness of sha descends along a finite extension); §0.2 (analytic rank and the leading coefficient at s = 1).

The intended declarations are:

- `TauCeti.BSD.analytic_rank_one_theorem` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1: rank 1 and Ш(E/ℚ) finite (indeed trivial, a statement for Layer 13/Layer 14).
- The same argument gives rank E^K(ℚ) = 0 and finite Ш(E^K/ℚ) for the auxiliary K.

### Examples

For root number −1, the Heegner class is conjugation-fixed modulo torsion and its trace has a nonzero rational free component. For root number +1 the anti-fixed component belongs to the quadratic twist instead. The positive height obtained from a nonzero base-change derivative rules out a torsion Heegner point. Arithmetic Kolyvagin descent gives the full rank-one and whole-Sha result; a single odd-primary index bound supplies neither conclusion on its own.

### Dependencies

Earlier comparisons: §0.1, §0.2, §0.5, §0.8, §0.11, §2.1, §2.2, §2.3, §3.5. Supplier interfaces: EllipticCurveModularity R29.3–R29.6; EllipticCurveModularity R29.5 / modular-parametrisation; GrossZagierAndArithmeticHeights GZ.8 / derivative-corollaries; GrossZagierAndArithmeticHeights GZ.8 / elliptic-curve-heegner-height-formula; HeegnerPointEulerSystems HE.0 / dihedral-conjugation; HeegnerPointEulerSystems HE.1 / heegner-points-of-conductor-m-and-the-modular-parametrisation; HeegnerPointEulerSystems HE.1 / parameter-choice-and-degree; HeegnerPointEulerSystems HE.4 / complex-conjugation-parity; HeegnerPointEulerSystems HE.7 / classical-full-sha-finiteness; Tau Ceti `WeierstrassCurve.Affine.Point.isOfFinAddOrder_of_canonicalHeight_eq_zero`.

## Layer 6: Analytic rank zero and whole-Sha finiteness

The Heegner argument descends from a rank-one quadratic base change. The separate Kato argument provides all-prime finiteness and a source-qualified one-sided prime bound.

### 6.1 Analytic rank zero implies rank zero and finite Sha (Kolyvagin)

For every elliptic curve E/ℚ with ellipticL E 1 ≠ 0 (analyticRank E = 0): E(ℚ) is finite and Ш(E/ℚ) is finite. No further hypothesis is placed on E.

E/ℚ elliptic with analyticRank E = 0.

rootNumber E = +1 (§0.5). Choose K by §3.5: Heegner hypothesis, D_K ∉ {−3, −4} odd, and analyticRank E^K = 1, so L(E/K, s) has a simple zero with L′(E/K, 1) = L(E, 1)L′(E^K, 1) ≠ 0 (§0.11 (b)). §5.1: y_K has infinite order; HE.7/classical-full-sha-finiteness: rank E(K) = 1 and Ш(E/K) finite. §5.2 with rootNumber E = +1: y_K − σ(y_K) lies in ι(E^K(ℚ)) and has infinite order, so rank E^K(ℚ) ≥ 1. §2.3: rank E(ℚ) + rank E^K(ℚ) = 1, so rank E(ℚ) = 0 and E(ℚ) is finite. The sign calculation is direct: Layer 5 is not applied to E^K. §2.2: Ш(E/ℚ) is finite.

The source comparison is [Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), Introduction, p. 544.

*Needs:* §3.5 (choice of a heegner field for analytic rank zero or one); §0.11 (order, leading term and sign of l(e/k, s) at the centre); §0.5 (root-number parity of the analytic rank); §5.1 (a nonzero derivative over k gives a non-torsion heegner point); §5.2 (complex conjugation on the heegner point selects the rational or the twisted part); HeegnerPointEulerSystems HE.7 / classical-full-sha-finiteness; §2.3 (rank splitting over a quadratic field); §2.2 (finiteness of sha descends along a finite extension); §0.2 (analytic rank and the leading coefficient at s = 1).

The intended declarations are:

- `TauCeti.BSD.analytic_rank_zero_theorem` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1: E(ℚ) ≅ ℤ/5 and Ш(E/ℚ) finite.
- The argument also yields rank E^K(ℚ) = 1 and Ш(E^K/ℚ) finite for the auxiliary field.

### 6.2 The Beilinson–Kato route to finiteness in analytic rank zero

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0, and f = F_E. For every prime p and every G_ℚ-stable lattice T ⊂ V_p(E), Kato's Bloch–Kato Selmer group Sel(ℚ, T) ⊂ H¹(ℚ, T ⊗ ℚ/ℤ) is finite, and Sel(ℚ, T) = 0 for all but finitely many p. Consequently E(ℚ) is finite and Ш(E/ℚ) is finite, and Ш(E/ℚ)[p^∞] = 0 for all but finitely many p. This route uses the Beilinson–Kato Euler system, its explicit reciprocity law and the nonvanishing of L(E, 1); it uses no Heegner point, no primitivity of Kato's classes and no main conjecture.

Kato, Theorem 14.2(2) with K = ℚ, χ trivial, k = 2, r = k/2 = 1, so V_{F_λ}(f)(1) ≅ V_p(E) by EllipticCurveModularity R29.4/tate-module-comparison. The identification of Kato's Sel(ℚ, T_p E) with Sel_{p^∞}(E/ℚ) of EllipticCurves Layer 7: Bloch–Kato's H¹_f at p is the Kummer image (finite flat or Tate-curve local condition).

KatoEulerSystems L3: the zeta class z_γ interpolates L(f, 1) through the dual exponential, so its localisation at p is nonzero when L(f, 1) ≠ 0. KatoEulerSystems L4 and EulerSystemsAndKolyvaginSystems ES.4: the Euler-system bound kills the Selmer group up to the index of the bottom class, which is finite. For almost all p the image of G_ℚ contains SL₂(ℤ_p) (or the CM Cartan analogue) and the bottom class is a unit multiple, giving vanishing. Sel(E/ℚ) = ⊕_p Sel(ℚ, T_p E) (Kato §14.1) is then finite, so E(ℚ) ⊗ ℚ_p/ℤ_p and Ш(E/ℚ) are finite.

The source comparison is [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 14.2(2), p. 235; [Kazuya Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §14.1, p. 235.

*Needs:* KatoEulerSystems L3 / zeta-class-interpolation-of-complex-L-values; KatoEulerSystems L3 / generalised-explicit-reciprocity-law-for-zeta-elements; KatoEulerSystems L4 / nonvanishing-of-the-zeta-submodule-at-height-zero; KatoEulerSystems L4 / imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra; EulerSystemsAndKolyvaginSystems ES.4 / rubin-bound; EllipticCurveModularity R29.4 / tate-module-comparison; §0.2 (analytic rank and the leading coefficient at s = 1); TauCetiRoadmap EllipticCurves Layer 7; KatoEulerSystems L4.

The intended declarations are:

- `TauCeti.BSD.kato_rank_zero_finiteness` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Agrees with analytic-rank-zero-theorem on every E; for E = 11a1 both give E(ℚ) finite and Ш(E/ℚ) finite.

### 6.3 Kato's upper bound for the p-part of Sha in analytic rank zero

Let E/ℚ be elliptic with good or multiplicative reduction at an odd prime p, E[p] irreducible, and ellipticL E 1 ≠ 0. Then ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L(E, 1)/(Ω_E · ∏_ℓ c_ℓ(E))), where L(E, 1)/Ω_E ∈ ℚ^× by §1.1.

p odd, good or multiplicative reduction at p, E[p] irreducible (so E(ℚ)[p] = 0 and the torsion term is a p-adic unit). Ω_E is the full real period of EllipticCurves Layer 7.

Import the specified finite-level one-sided Kato bound with good ordinary, supersingular and multiplicative local cases stated separately. The current cohomological height-one divisibility alone does not give this conclusion. Use the specified augmentation/Fitting and compact/discrete local-control comparison, retaining every Euler and Tamagawa factor. Do not use §10.1 here: it assumes an equality/main conjecture, whereas this is a one-sided input. Transport canonical periods to the full Néron real period using the exact Manin-constant integrality hypotheses from GZ.3; the multiplicative p∥N branch needs its separately specified export. Rationality is supplied by the early modular-symbol comparison of Layer 1.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(i), p. 42.

*Needs:* KatoEulerSystems L4 / cohomological-divisibility-one-direction; §1.1 (rationality of l(e,1)/ω_e); GrossZagierAndArithmeticHeights GZ.3; TauCetiRoadmap EllipticCurves Layer 7; KatoEulerSystems L4.

The intended declarations are:

- `TauCeti.BSD.kato_p_part_upper_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, p = 3: ord₃(L(E,1)/(Ω_E c₁₁)) = ord₃(1/25) = 0, so Ш(E/ℚ)[3^∞] = 0.

### 6.4 Analytic rank at most one: rank equals analytic rank and Sha is finite

For every elliptic curve E/ℚ with analyticRank E ≤ 1: Module.finrank ℤ (E(ℚ)/tors) = analyticRank E and Ш(E/ℚ) is finite. The separate conclusions (rank equality; finiteness of the whole of Ш) are exported as distinct declarations.

E/ℚ elliptic, analyticRank E ≤ 1; no hypothesis on reduction, CM or residual representations.

analyticRank E = 0: analytic-rank-zero-theorem. analyticRank E = 1: §5.3.

The source comparison is [Ashay A. Burungale and Ye Tian](https://arxiv.org/abs/2506.03465v2), §1.0.1, p. 1.

*Needs:* §6.1 (analytic rank zero implies rank zero and finite sha (kolyvagin)); §5.3 (analytic rank one implies rank one and finite sha (gross–zagier–kolyvagin)).

The intended declarations are:

- `TauCeti.BSD.analytic_rank_at_most_one_theorem` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- 11a1: rank 0 = analytic rank; 37a1: rank 1 = analytic rank; both with finite Ш.

### 6.5 The Kato and Heegner routes in analytic rank zero compared

Let E/ℚ be elliptic with ellipticL E 1 ≠ 0. (a) Both analytic-rank-zero-theorem (Heegner points on an auxiliary E^K, Kolyvagin over K) and kato-rank-zero-finiteness (Beilinson–Kato elements over ℚ) prove that E(ℚ) and Ш(E/ℚ) are finite, and both prove Ш(E/ℚ)[p^∞] = 0 for all p outside a finite set. (b) At an odd prime p of good or multiplicative reduction with E[p] irreducible, the Kato route gives the explicit bound ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p(L(E,1)/(Ω_E ∏c_ℓ)) (kato-p-part-upper-bound), whereas the Heegner route bounds #Ш(E/K)[p^∞] by the square of the Heegner index of the auxiliary twist, which first involves the auxiliary height/index; conversion to L(E,1) requires Gross–Zagier and the auxiliary twist factors. (c) Neither route uses a main conjecture or the primitivity of an Euler system; the equality of p-parts needs the main-conjecture inputs of Layer 10.

As in the two theorems compared.

(a) is the conjunction of the two theorems' conclusions; the finite exceptional sets are the primes where the Kolyvagin (HE.7/almost-all-primary-sha-vanishing) or Kato (large-image) arguments lose control. (b) compares kato-p-part-upper-bound with HE.6/sha-square-index-bound applied to E^K and §2.7. (c) records the inputs of each proof.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.2, p. 42.

*Needs:* §6.1 (analytic rank zero implies rank zero and finite sha (kolyvagin)); §6.2 (the beilinson–kato route to finiteness in analytic rank zero); §6.3 (kato's upper bound for the p-part of sha in analytic rank zero); HeegnerPointEulerSystems HE.6 / sha-square-index-bound; HeegnerPointEulerSystems HE.7 / almost-all-primary-sha-vanishing; §2.7 (odd-primary selmer and sha over a quadratic field).

The intended declarations are:

- `TauCeti.BSD.kato_heegner_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- 11a1: both routes give E(ℚ) finite and Ш(E/ℚ) finite; at p = 3 the Kato bound already gives Ш(E/ℚ)[3^∞] = 0.

### Examples

In analytic rank zero, choose a quadratic twist with nonzero central derivative and apply the rank-one argument over K; the rational rank is zero by the rank splitting, and whole-Sha finiteness descends using the genuine 2-isogeny comparison as well as the odd part. For the CM curve (y^2=x^3-x), Kato's all-prime finite Selmer statement uses its CM proof. An irreducible-residual good-ordinary divisibility is not a replacement for that proof, particularly at the dyadic bad prime.

The separate upper bound has a direction: bounding the arithmetic Sha–Tamagawa term above by the analytic quotient gives a nonnegative defect valuation. Equality requires the other inequality or an independently proved integral main conjecture and exact specialization.

### Dependencies

Earlier comparisons: §0.2, §0.5, §0.11, §1.1, §2.2, §2.3, §2.7, §3.5, §5.1, §5.2, §5.3. Supplier interfaces: EllipticCurveModularity R29.4 / tate-module-comparison; EulerSystemsAndKolyvaginSystems ES.4 / rubin-bound; GrossZagierAndArithmeticHeights GZ.3; HeegnerPointEulerSystems HE.6 / sha-square-index-bound; HeegnerPointEulerSystems HE.7 / almost-all-primary-sha-vanishing; HeegnerPointEulerSystems HE.7 / classical-full-sha-finiteness; KatoEulerSystems L3 / generalised-explicit-reciprocity-law-for-zeta-elements; KatoEulerSystems L3 / zeta-class-interpolation-of-complex-L-values; KatoEulerSystems L4; KatoEulerSystems L4 / cohomological-divisibility-one-direction; KatoEulerSystems L4 / imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra; KatoEulerSystems L4 / nonvanishing-of-the-zeta-submodule-at-height-zero; TauCetiRoadmap EllipticCurves Layer 7.

## Layer 7: Positive rational defects and integral index comparisons

Convert the actual analytic leading coefficient into a positive rational defect. Keep the free Heegner index, torsion and the source normalization of the regulator distinct.

### 7.1 Positivity of the leading term in analytic rank at most one

For every elliptic curve E/ℚ with analyticRank E ≤ 1, leadingTerm E > 0: L(E, 1) > 0 if the analytic rank is 0, and L′(E, 1) > 0 if it is 1. Positivity rests on the nonnegativity of central values L(1/2, π ⊗ χ) ≥ 0 for cuspidal π on PGL₂/ℚ and quadratic χ (Waldspurger), specified from GrossZagierAndArithmeticHeights GZ.5, together with the sign of the Gross–Zagier formula.

analyticRank E ≤ 1. The nonnegativity input is the specified quadratic central-value nonnegativity theorem; modular symbols give only rationality, not sign.

Rank zero: L(E, 1) = L(1/2, π_E) ≥ 0 by the specified Waldspurger nonnegativity (χ trivial), and L(E,1) ≠ 0. Rank one: choose K by §3.5 with L(E^K, 1) ≠ 0; then L′(E/K, 1) = L′(E, 1)L(E^K, 1) (§0.11) and L′(E/K, 1) > 0 because y_K has infinite order (§5.1, converse direction). L(E^K, 1) > 0 by the rank-zero case applied to E^K, so L′(E, 1) > 0.

The source comparison is [Benedict H. Gross and Don B. Zagier](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §1, Corollary (1.1), pp. 308–309 (the GZ.8 normalization).

*Needs:* GrossZagierAndArithmeticHeights GZ.5; GrossZagierAndArithmeticHeights GZ.8 / derivative-corollaries; §3.5 (choice of a heegner field for analytic rank zero or one); §0.11 (order, leading term and sign of l(e/k, s) at the centre); §5.1 (a nonzero derivative over k gives a non-torsion heegner point); §0.2 (analytic rank and the leading coefficient at s = 1).

The intended declarations are:

- `TauCeti.BSD.leading_term_positivity` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- L(11a1, 1) = 0.2538… > 0 and L′(37a1, 1) = 0.3059… > 0 (numerical values for orientation; certification is Layer 14's).

### 7.2 The Heegner index

Let E/ℚ be elliptic, K imaginary quadratic satisfying the Heegner hypothesis, and y_K ∈ E(K) the Heegner point attached to a fixed modular parametrisation φ. When rank E(K) = 1 and y_K has infinite order, heegnerIndex := I_K = [E(K) : ℤ·y_K] (Gross's index, which includes E(K)_tors), and the free index I_K^free := [E(K)/tors : ℤ·ȳ_K]; I_K = I_K^free · #E(K)_tors. For positive integer multiples mφ on the fixed curve, I_K and c_φ both scale by m, so I_K/c_φ is unchanged. Across an isogeny the Mordell–Weil lattice and torsion change and need explicit correction factors.

rank E(K) = 1 (supplied by Layer 5/Layer 6 for the fields of Layer 3) and y_K of infinite order.

Both indices are finite because ȳ_K is a nonzero element of the rank-one free group E(K)/tors. I_K = I_K^free·#E(K)_tors from the exact sequence 0 → E(K)_tors → E(K) → E(K)/tors → 0 restricted to ℤy_K, which meets torsion trivially. For positive multiples mφ on the fixed E, y_K becomes my_K and c_φ becomes mc_φ; in the rank-one free lattice the index scales by m. An arbitrary isogeny is not multiplication by an integer on the same lattice.

The source comparison is [Benedict H. Gross and Don B. Zagier](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, (2.2) Conjecture, p. 311; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46.

*Needs:* §5.1 (a nonzero derivative over k gives a non-torsion heegner point); HeegnerPointEulerSystems HE.1 / heegner-points-of-conductor-m-and-the-modular-parametrisation; HeegnerPointEulerSystems HE.1 / parameter-choice-and-degree; HeegnerPointEulerSystems HE.7 / non-torsion-point-prime-divisibility; Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`; Tau Ceti `WeierstrassCurve.Affine.finite_torsion`.

The intended declarations are:

- `TauCeti.BSD.heegnerIndex` — I_K = [E(K) : ℤ y_K] as a positive natural number, given rank E(K) = 1 and y_K of infinite order.
- `TauCeti.BSD.heegnerIndexFree` — I_K^free = [E(K)/tors : ℤ ȳ_K].
- `TauCeti.BSD.heegnerIndex_eq_free_mul_torsion` — I_K = I_K^free · #E(K)_tors.
- `TauCeti.BSD.heegnerIndex_pos` — 0 < I_K.
- `TauCeti.BSD.heegnerIndex_div_maninConstant_invariant` — For m>0 on the fixed E, I(my_K)/(m c_φ)=I(y_K)/c_φ; no arbitrary-isogeny invariance is asserted.
- `TauCeti.BSD.torsion_dvd_heegnerIndex` — #E(ℚ)_tors divides I_K. Assume y_K has infinite order and finite index.
- `TauCeti.BSD.not_dvd_heegnerIndex_of_large` — For all but finitely many primes p, p ∤ I_K (HE.7/non-torsion-point-prime-divisibility). Assume finite index (so I_K>0); a zero junk index is divisible by every prime.

**Checks.**

- heegnerIndex = heegnerIndexFree * Nat.card (E(K)_tors).
- Replacing φ by 2φ doubles y_K and the index I_K while c_φ doubles too; so I_K alone is not an invariant of E and K, only I_K/c_φ.
- For E₀ = J₀(11) = 11a1 (E(ℚ)_tors ≅ ℤ/5), 5 divides I_K for every point y_K of infinite order generating a finite-index subgroup: the torsion meets ℤy_K trivially (GZ86 Chapter V §2, before (2.3)).
- If ȳ_K generates E(K)/tors then I_K^free = 1 and I_K = #E(K)_tors. Assume y_K has infinite order, not merely that its image generates a possibly rank-zero quotient.
- E = 37a1: y_K = m_K·(0,0) up to torsion and I_K = |m_K| (the integers m_K are coefficients of a weight-3/2 form, Gross §1).
- GZ86 (2.3): t = #E(ℚ)_tors divides I_K.

### 7.3 Modular degrees on X₀(N) and on Shimura curves (Ribet–Takahashi)

For the semistable optimal degree comparison under the localised multiplicity-one/freeness and residual hypotheses of JSW7.3.2 and the selected Ribet–Takahashi theorem, v_p(δ(N,1)/δ(N⁺,N⁻))=Σ_{ℓ|N⁻} v_p(ord_ℓ Δ_min(E)), with N⁻ of even cardinality. These are geometric component multiplicities. In JSW’s application ℓ|N⁻ is inert in K′, so over K′ the multiplicative torus splits and c_ℓ(E/K′)=ord_ℓ Δ_min. At a nonsplit rational multiplicative prime c_ℓ(E/ℚ) is only 1 or 2 and cannot be substituted.

Indefinite quaternion algebra (N⁻ with an even number of primes); E[p] irreducible so that the relevant Hecke modules are free (Ribet's multiplicity one). The exact localised character-module freeness and period comparison must be proved under the endpoint hypotheses; irreducibility alone is not silently identified with Pollack–Weston CR/surjectivity.

Degrees are congruence numbers up to p-adic units: δ(N, 1) ~ η_E(N) and δ(N⁺, N⁻) ~ η_E(N⁺, N⁻) (multiplicity one at the maximal ideal of E[p]). Apply the Ribet–Takahashi recursion of definite-congruence-period one prime at a time along N⁻, now in the indefinite case (component groups of J₀(N) and of the Shimura-curve Jacobian at ℓ | N⁻, R11.4). An unramified quadratic extension makes the nonsplit multiplicative torus split; its geometric component multiplicity is ord_ℓ Δ_min. Rational c_ℓ need not have the same odd p-part. Use the K′ factor or the geometric multiplicity in the degree recursion.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46.

*Needs:* §4.1 (the definite congruence-period identity (ribet–takahashi, pollack–weston)); §2.9 (tamagawa factors under quadratic base change and twist); NeronModelsAndSemistableAbelianVarieties R11.4 / component-cokernel; NeronModelsAndSemistableAbelianVarieties R11.6 / degeneracy-functoriality; GrossZagierAndArithmeticHeights GZ.3.

The intended declarations are:

- `TauCeti.BSD.ribet_takahashi_degree_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- JSW §7.4.1: δ_{N⁺,N⁻} = δ(N,1)/δ(N⁺,N⁻) = ∏_{ℓ|N⁻} c_ℓ(E/K′) up to ℤ_p^×.

### 7.4 Height of the Heegner point and the squared index

In the setting of heegner-index, with heights relative to K in the x-height normalisation: ĥ_K(y_K) = (I_K^free)² · Reg_BSD(E/K). If moreover rank E(ℚ) = 1 and rank E^K(ℚ) = 0 (the case of Layer 5), then Reg_BSD(E/K) = 2·Reg_BSD(E/ℚ)/4^a with 2^a = [E(K)/tors : res(E(ℚ)/tors)] ∈ {1, 2}, so ĥ_K(y_K) = 2·(I_K^free)²·Reg_BSD(E/ℚ)/4^a.

rank E(K)=1; y_K non-torsion, with finite index; use K-relative x-height, namely twice the pinned (O)-height, and Mathlib’s number-field absolute-value/Northcott instances.

In a rank-one lattice the regulator is the height of a generator, and ĥ is quadratic: ĥ_K(y_K) = (I^free)² ĥ_K(generator). §2.6 with r₊ = 1, r₋ = 0.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 46.

*Needs:* §7.2 (the heegner index); §2.6 (lattice index and regulators over a quadratic field); GrossZagierAndArithmeticHeights GZ.0 / bsd-regulator; GrossZagierAndArithmeticHeights GZ.0 / x-height-canonical-height; Mathlib `NumberField.instAdmissibleAbsValues`; Mathlib `NumberField.totalWeight_eq_finrank`; Mathlib `NumberField.finite_setOfPred_logHeight₁_le`.

The intended declarations are:

- `TauCeti.BSD.heegner_index_height_formula` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1: if ȳ_K = m·res(P₀) + torsion with P₀ = (0,0) and a = 0, then ĥ_K(y_K) = 2m²·ĥ_x(P₀) = 2m²·0.0511…, with ĥ_x(P₀) = Reg_BSD(37a1).

### 7.5 Rationality of L′(E,1)/(Ω_E Reg_E) in analytic rank one

For every elliptic curve E/ℚ with analyticRank E = 1, L′(E, 1)/(Ω_E · Reg_BSD(E/ℚ)) ∈ ℚ_{>0}, where Reg_BSD is GZ.0's regulator in the x-height normalisation (twice Tau Ceti's regulator in rank one).

analyticRank E = 1 (so rank E(ℚ) = 1 by §5.3). Normalisation: GZ.0/height-convention-dictionary; with Tau Ceti's regulator the quotient changes by the factor 2.

Choose K by §3.5 with L(E^K, 1) ≠ 0 and D_K odd. Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula): L′(E,1)·L(E^K,1) = ‖ω₀‖² ĥ_K(y_K)/(C² u_K² |D_K|^{1/2}) with C, u_K ∈ ℤ_{>0}. heegner-index-height-formula: ĥ_K(y_K) = (I_K^free)² · 2 · Reg_BSD(E/ℚ)/4^a. §2.5: ‖ω₀‖²/|D_K|^{1/2} = r·Ω_E·Ω_{E^K} with r ∈ ℚ^× (a power of 2 when (D_K, 2N) = 1). rank-zero-rationality for E^K: L(E^K, 1)/Ω_{E^K} ∈ ℚ^×. Dividing gives L′(E,1)/(Ω_E Reg_BSD) ∈ ℚ^×, positive by leading-term-positivity.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §1.2, p. 2.

*Needs:* GrossZagierAndArithmeticHeights GZ.8 / elliptic-curve-heegner-height-formula; §7.4 (height of the heegner point and the squared index); §2.5 (the period of e over an imaginary quadratic field and its comparison); §1.1 (rationality of l(e,1)/ω_e); §7.1 (positivity of the leading term in analytic rank at most one); §3.5 (choice of a heegner field for analytic rank zero or one); GrossZagierAndArithmeticHeights GZ.0 / bsd-regulator; GrossZagierAndArithmeticHeights GZ.0 / height-convention-dictionary.

The intended declarations are:

- `TauCeti.BSD.rank_one_rationality` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1: L′(E,1)/(Ω_E Reg_BSD) = 1 (Ш trivial, c₃₇ = 1, E(ℚ)_tors = 0), as Layer 14 certifies.

### 7.6 Gross–Zagier's index conjecture as a form of BSD over K

Let E/ℚ be elliptic of conductor N with optimal parametrisation of Manin constant c, K imaginary quadratic with D_K odd, every prime of N split, u_K = #𝓞_K^×/2, rank E(K) = 1, y_K has infinite order, and Ш(E/K) finite. For a prime ℓ | N let m_ℓ be the order of the component group of the Néron model at either prime above ℓ, and m = ∏_{ℓ|N} m_ℓ. Then for every odd prime p ∤ D_K, the p-part of the BSD formula for E/K (JSW (7.1.a)) holds if and only if ord_p I_K = ord_p(c · m · u_K) + ½ ord_p #Ш(E/K), i.e. the p-part of Gross–Zagier's Conjecture (2.2): I_K = c·m·u_K·#Ш(E/K)^{1/2}. In particular the p-part of BSD for E/K implies that t = #E(ℚ)_tors divides c·m·u_K·#Ш(E/K)^{1/2} in its p-part (Conjecture (2.3)). For D_K ∉ {−3, −4} (u_K = 1) this is Gross's Conjecture 1.2(2): #Ш(E/K) = (I_K/(c·∏_{ℓ|N} m_ℓ))² with m_ℓ = [E(ℚ_ℓ) : E⁰(ℚ_ℓ)]. The index bound, the Sha bound and the exact formula are three different statements: Kolyvagin's Theorem 1.3 (#Ш(E/K) divides t_{E/K}·I_K²) and Howard's ord_p #Ш(E/K) ≤ 2 ord_p I_K (HE.6) are only one inequality.

Gross–Zagier's standing hypotheses (D_K odd, Heegner hypothesis); p odd and p ∤ D_K so that powers of 2 and the discriminant term are units. m_ℓ is the same at both primes above a split ℓ (m_𝔭 = m_𝔭̄), so ∏_{w|N} c_w(E/K) = m². The modular Heegner point y_K has infinite order (equivalently the base-change analytic rank is one in this setting). Algebraic rank one by itself is not an analytic simple-zero hypothesis.

Write BSD for E/K: L′(E/K,1)/(Ω_{E/K} Reg_BSD(E/K) |D_K|^{−1/2}) = #Ш(E/K)·∏_w c_w(E/K)/#E(K)_tors². Substitute Gross–Zagier (GZ.8/elliptic-curve-heegner-height-formula) for L′(E/K,1), heegner-index-height-formula for ĥ_K(y_K) = (I_K^free)² Reg_BSD(E/K), and §2.5 for ‖ω₀‖² versus Ω_{E/K}. I_K = I_K^free·#E(K)_tors cancels the torsion term; the Tamagawa product over K is m² (split primes, §2.9). What remains is (I_K)² = (c·m·u_K)²·#Ш(E/K) up to powers of 2, which are p-adic units.

The source comparison is [Benedict H. Gross and Don B. Zagier](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, (2.2) Conjecture, p. 311; [Benedict H. Gross and Don B. Zagier](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter V §2, (2.3) Conjecture, p. 311; [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1, Conjecture 1.2(2), p. 236 (read from the page image); [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), §1, Theorem 1.3(2), p. 236.

*Needs:* GrossZagierAndArithmeticHeights GZ.8 / elliptic-curve-heegner-height-formula; §7.4 (height of the heegner point and the squared index); §7.2 (the heegner index); §2.5 (the period of e over an imaginary quadratic field and its comparison); §2.9 (tamagawa factors under quadratic base change and twist); §2.10 (the bsd quotient over k versus over ℚ at odd primes); HeegnerPointEulerSystems HE.6 / sha-square-index-bound; GrossZagierAndArithmeticHeights GZ.0 / heegner-unit-index.

The intended declarations are:

- `TauCeti.BSD.gross_index_formula` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Gross's example E = X₀(37)/w₃₇ (37a1, φ of degree 2, c = 1, m₃₇ = 1): the formula reads #Ш(E/K) = I_K², and y_K = m_K·(0,0) with the m_K Fourier coefficients of a weight-3/2 form; certifying instances is Layer 14's.
- GZ86 examples at N = 11: (E₀ = J₀(11); c, m, t) = (1, 5, 5), (J₁(11); 5, 1, 5), (E₀/(ℤ/5ℤ); 1, 1, 1): t | c·m in each case.
- N = 65: for E₀ = J₀(65)/⟨w₅, w₁₃⟩, (c, m, t) = (1, 1, 2), so for K ≠ ℚ(i) with 5 and 13 split the conjecture forces 2 | #Ш(E/K)^{1/2} or rank E(K) > 1; Kramer's computation gives 2-Selmer rank ≥ 4 (stated in GZ86, not reproved here).

### 7.7 Kolyvagin's index bound as a one-sided p-part statement

Let E/ℚ, K, y_K be as in heegner-index with rank E(K) = 1, p an odd prime with p ∤ D_K N and G_K → GL₂(ℤ_p) surjective on T_pE, D_K ∉ {−3, −4}. Then ord_p #Ш(E/K)[p^∞] ≤ 2 ord_p I_K (HE.6/sha-square-index-bound), whereas Gross–Zagier's conjecture (gross-index-formula) predicts 2 ord_p I_K = ord_p #Ш(E/K) + 2 ord_p(c·m·u_K). Combined with the rank-zero p-part for E^K (Layer 10) and the odd decomposition of Ш(E/K), the inequality gives an upper bound for ord_p #Ш(E/ℚ)[p^∞]. It is not an exact formula: equality needs the opposite inequality from a main conjecture or from Kolyvagin's primitivity, which this lemma does not supply.

Retain all Howard Theorem A hypotheses and parametrisation/local error factors of HE.6; the stated clean inequality is used only when those factors are discharged.

HE.6/sha-square-index-bound gives length Ш[p^∞] ≤ 2·length(E(K) ⊗ ℤ_p/ℤ_p y_K). With E(K)[p] = 0 (surjectivity), the length on the right is ord_p I_K. Convert the index using the proved Gross–Zagier height formula plus quadratic regulator/period comparisons, and split Sha at odd p. gross-index-formula is only an equivalence with BSD; assuming its predicted equality here would assume the desired result.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.2, p. 47.

*Needs:* HeegnerPointEulerSystems HE.6 / sha-square-index-bound; HeegnerPointEulerSystems HE.6 / primitivity-versus-nonzero; §7.2 (the heegner index); §2.7 (odd-primary selmer and sha over a quadratic field); GrossZagierAndArithmeticHeights GZ.8 / elliptic-curve-heegner-height-formula; §7.4 (height of the heegner point and the squared index); §2.5 (the period of e over an imaginary quadratic field and its comparison).

The intended declarations are:

- `TauCeti.BSD.sha_bound_from_heegner_index` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- HE.6/primitivity-versus-nonzero: a nonzero Kolyvagin class gives only this inequality.

### 7.8 The rational BSD defect

For E/ℚ elliptic with analyticRank E ≤ 1 (so rank E(ℚ) = analyticRank E and Ш(E/ℚ) is finite by §6.4), bsdDefect E := leadingTerm E · #E(ℚ)_tors² / (Ω_E · Reg_BSD(E/ℚ) · #Ш(E/ℚ) · ∏_ℓ c_ℓ(E)). It is a positive rational number: bsdDefect E ∈ ℚ_{>0}, with the real identity leadingTerm E = bsdDefect E · (Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors²). The Birch–Swinnerton-Dyer formula for E is the statement bsdDefect E = 1, and its p-part is padicValRat p (bsdDefect E) = 0.

The arithmetic quotient Ω_E·Reg·#Ш·∏c_ℓ/#tors² is EllipticCurves Layer 7's BSD quotient, stated with GZ.0's Reg_BSD (x-height normalisation); with Tau Ceti's halved regulator the defect changes by 2^{rank}. Only finitely many c_ℓ differ from 1 (good primes), so the product is finite.

Rationality: rank-zero-rationality (rank 0, Reg = 1) and rank-one-rationality (rank 1); the arithmetic terms other than Ω_E and Reg are integers. Positivity: leading-term-positivity, Ω_E > 0, Reg_BSD > 0 (positive-definite height on the free quotient), c_ℓ ≥ 1, #Ш ≥ 1. Define the rational number as the quotient of the rational L*(E,1)/(Ω_E Reg_BSD) by #Ш ∏c_ℓ / #tors².

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Conjecture 1.1.1(b), (1.1.a), p. 1; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7, p. 41.

*Needs:* §1.1 (rationality of l(e,1)/ω_e); §7.5 (rationality of l′(e,1)/(ω_e reg_e) in analytic rank one); §7.1 (positivity of the leading term in analytic rank at most one); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite); §0.2 (analytic rank and the leading coefficient at s = 1); GrossZagierAndArithmeticHeights GZ.0 / bsd-regulator; Mathlib `padicValRat`; TauCetiRoadmap EllipticCurves Layer 7; Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; TauCetiRoadmap EllipticCurves Layer 4.

The intended declarations are:

- `WeierstrassCurve.bsdDefect` — bsdDefect E : ℚ for E/ℚ with analyticRank E ≤ 1.
- `WeierstrassCurve.bsdDefect_pos` — 0 < bsdDefect E.
- `WeierstrassCurve.leadingTerm_eq_bsdDefect_mul` — leadingTerm E = bsdDefect E · Ω_E · Reg_BSD · #Ш · ∏c_ℓ / #E(ℚ)_tors² as real numbers.
- `WeierstrassCurve.bsdDefect_eq_one_iff` — bsdDefect E = 1 ↔ the full BSD formula (1.1.a) holds for E.
- `WeierstrassCurve.padicValRat_bsdDefect` — padicValRat p (bsdDefect E) = v_p(L*/(Ω Reg)) + 2 v_p(#tors) − v_p(#Ш) − Σ_ℓ v_p(c_ℓ).
- `WeierstrassCurve.bsdDefect_eq_of_isogenous` — Isogenous curves have equal defects (defect-isogeny-invariance).
- `WeierstrassCurve.bsdDefect_regulator_convention` — The defect computed with Tau Ceti's regulator equals 2^{analyticRank E} · bsdDefect E (GZ.0/bsd-regulator).
- `WeierstrassCurve.bsdDefect_eq_one_of_forall_padicValRat` — If padicValRat p (bsdDefect E) = 0 for every prime p then bsdDefect E = 1 (positive rational, Layer 13's reconstruction).

**Checks.**

- bsdDefect (11a1) = 1 (L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, #Ш = 1).
- If analyticRank E = 0 then Reg_BSD = 1 and bsdDefect E = L(E,1)·#tors²/(Ω_E·#Ш·∏c_ℓ).
- For 37a1 (rank one) the quotient formed with Tau Ceti's halved regulator is 2, not 1: the regulator convention changes the answer.
- bsdDefect (11a1) = bsdDefect (11a3) although their periods, torsion and Tamagawa numbers differ.
- 11a1: L(E,1)/Ω_E = 1/5, #tors = 5, c₁₁ = 5, Ш = 1 gives bsdDefect = (1/5)·25/5 = 1.

### 7.9 Isogeny invariance of the rational BSD defect

If E and E′ are ℚ-isogenous elliptic curves with analyticRank E ≤ 1, then analyticRank E′ = analyticRank E and bsdDefect E = bsdDefect E′.

The arithmetic invariance is Cassels' theorem and the analytic invariance is equality of all local factors; both are owned by EllipticCurves Layer 7 (the EllipticCurves ownership contract) and only composed here.

Equal local Euler factors give ellipticL E = ellipticL E′ (EllipticCurveModularity R29.6, using the pinned entire-extension interface, ellipticL_eq_of_isogenous), hence equal analytic rank and leading term. Cassels: the arithmetic BSD quotient Ω·Reg·#Ш·∏c/#tors² is isogeny invariant (EllipticCurves Layer 7), stated with Reg_BSD; the normalisation adapter GZ.0/bsd-regulator is the same on both sides. Divide.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7, p. 41.

*Needs:* §7.8 (the rational bsd defect); EllipticCurveModularity R29.6, using the pinned entire-extension interface; GrossZagierAndArithmeticHeights GZ.0 / bsd-regulator; TauCetiRoadmap EllipticCurves Layer 7; Tau Ceti `TauCeti.Isogeny`.

The intended declarations are:

- `TauCeti.BSD.defect_isogeny_invariance` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- 11a1, 11a2, 11a3 all have defect 1.

### 7.10 The p-part of BSD from an upper and a lower bound

Let E/ℚ be elliptic with analyticRank E ≤ 1 and p a prime with E(ℚ)[p] = 0 (for instance p odd with E[p] irreducible). Then padicValRat p (bsdDefect E) = v_p(L*(E,1)/(Ω_E Reg_BSD ∏_ℓ c_ℓ)) − v_p(#Ш(E/ℚ)[p^∞]). Hence the upper bound v_p #Ш[p^∞] ≤ v_p(L*/(ΩReg∏c)) is equivalent to padicValRat p (bsdDefect E) ≥ 0, the lower bound to ≤ 0, and the p-part of the BSD formula to the conjunction of the two bounds. Neither a bound on the Heegner index nor a one-sided Euler-system divisibility alone gives padicValRat p (bsdDefect E) = 0.

E(ℚ)[p] = 0 so the torsion term is a p-adic unit; for p = 2 or curves with rational p-torsion the torsion term is kept (Layer 12).

Expand padicValRat of the defining quotient (rational-bsd-defect, padicValRat_bsdDefect); v_p(#Ш) = v_p(#Ш[p^∞]); the torsion term vanishes. Reg_BSD's powers of 2 and the regulator itself are absorbed in the rational L*/(Ω Reg) whose valuation is taken as a whole.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §1.3, p. 2.

*Needs:* §7.8 (the rational bsd defect); Mathlib `padicValRat`.

The intended declarations are:

- `TauCeti.BSD.p_part_from_two_bounds` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- JSW (7.4.d) and (7.4.e) are the two bounds whose conjunction is Theorem 1.2.1.

### Examples

If a nontorsion rank-one point has free index two and the torsion subgroup has order five, its full index is ten and its BSD height is four times the full-lattice regulator. Squaring the full index in the height formula would introduce a factor 25. Doubling a modular parametrization doubles both its Heegner free index and Manin constant; their ratio must change consistently.

With all exact N=11 inputs proved, 11a1 has (L/Ω=1/5), torsion order five, Tamagawa product five and Sha order one, giving defect one. The nonoptimal 11a3 ratio is (1/25), its Tamagawa product is one and its torsion order is also five. The five-isogeny preserves the defect while changing the period and Tamagawa factor. In rank one, using the Tau Ceti pairing without the source convention adapter doubles the quotient; the adapter restores the BSD regulator.

### Dependencies

Earlier comparisons: §0.2, §0.11, §1.1, §2.5, §2.6, §2.7, §2.9, §2.10, §3.5, §4.1, §5.1, §6.4. Supplier interfaces: EllipticCurveModularity R29.6, using the pinned entire-extension interface; GrossZagierAndArithmeticHeights GZ.0 / bsd-regulator; GrossZagierAndArithmeticHeights GZ.0 / heegner-unit-index; GrossZagierAndArithmeticHeights GZ.0 / height-convention-dictionary; GrossZagierAndArithmeticHeights GZ.0 / x-height-canonical-height; GrossZagierAndArithmeticHeights GZ.3; GrossZagierAndArithmeticHeights GZ.5; GrossZagierAndArithmeticHeights GZ.8 / derivative-corollaries; GrossZagierAndArithmeticHeights GZ.8 / elliptic-curve-heegner-height-formula; HeegnerPointEulerSystems HE.1 / heegner-points-of-conductor-m-and-the-modular-parametrisation; HeegnerPointEulerSystems HE.1 / parameter-choice-and-degree; HeegnerPointEulerSystems HE.6 / primitivity-versus-nonzero; HeegnerPointEulerSystems HE.6 / sha-square-index-bound; HeegnerPointEulerSystems HE.7 / non-torsion-point-prime-divisibility; Mathlib `NumberField.finite_setOfPred_logHeight₁_le`; Mathlib `NumberField.instAdmissibleAbsValues`; Mathlib `NumberField.totalWeight_eq_finrank`; Mathlib `padicValRat`; NeronModelsAndSemistableAbelianVarieties R11.4 / component-cokernel; NeronModelsAndSemistableAbelianVarieties R11.6 / degeneracy-functoriality; Tau Ceti `TauCeti.Isogeny`; Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`; Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; Tau Ceti `WeierstrassCurve.Affine.finite_torsion`; TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 7.

## Layer 8: Early signed zeta elements and reciprocity comparison

Construct the signed BSTW class and compare the signed Perrin–Riou and Greenberg divisibilities before using global congruences. The ordinary class is supplied by Kato’s early ordinary construction.

### 8.1 The two-variable zeta element of an elliptic curve over an imaginary quadratic field (BSTW)

Let E/ℚ have good supersingular reduction at p∤2N with a_p=0, and L imaginary quadratic with (D_L,N)=1, p=v v̄ split (v fixed by the p-adic embedding), E[p](L)=0. Construct BSTW §6’s signed zeta element Z^•(E/L) in the actual two-variable relaxed/signed Iwasawa cohomology with its integral lattice and completed unramified coefficients. This result owns only the supersingular construction. The ordinary element, its laws and ordinary Proposition9.18 belong to the specified KatoEulerSystems L5; reuse that owner’s underlying classes/CM-family machinery. Use the cofinal two-variable tower of finite extensions, continuous H¹ of compact T_pE at each level, and corestriction-compatible inverse limits. The relaxed group is the unramified-away-p subgroup with the signed condition at v̄; localization at v is relaxed. With chosen generators Λ_L=ℤ_p[[X,Y]], and Λ_L^ur=R₀[[X,Y]] where R₀=W(𝔽̄_p). The unramified inclusion ℤ_p→R₀ induces a coefficientwise Λ_L→Λ_L^ur map; signed localization and Log_v̄ are Λ_L-linear through this action. Its cyclotomic projection is a rational class over K, identified by BSTW6.26(i) with c^•(ω,γ,γ′)g(χ_K)⁻¹ times the combination of z_g and z_{g⊗χ_K} of §3.3, not a single Kato class. Integrality uses the basis/lattice hypotheses of 6.26(ii).

p>2 good supersingular and a_p=0 (explicit also at p=3); (D_L,N)=1, p split and E[p](L)=0. The embedding fixes v; signs •∈{+,−} use the actual Kobayashi/Pollack normalization. Ordinary ownership is KatoEulerSystems proposed L5, specified at its present nearest L4 stage. Layer 9 owns the signed §6 construction and signed §9.3.2 comparison only. Fix the Néron differential, both Betti sign bases and the Gauss-sum normalization of BSTW6.26; for the integral refinement require irr_ℚ and integral primitive differential/Betti bases. Cyclotomic comparison is made over ℚ_p unless these lattice hypotheses have been discharged. BSTW §§2.2.4–2.2.5, printed pp.13–14, defines the cohomological lattice T_g with determinant χ_cyc⁻¹. Its twist T_g(1) is compared with V_pE through modularity and the polarization; an integral comparison with T_pE must track the modular-parametrization lattice index and chosen differential/Betti bases. The geometric coefficient here is T_pE, not T_pE(1).

Import Kato’s actual classes/norm relations and the ordinary owner’s CM-family base construction; PadicFamilies L4, not merely its eigencurve L1, must supply the CM family specialization. Apply the R29.4 modular Tate-module comparison and polarization to transport T_g(1) to V_pE; prove the integral lattice/basis comparison required by 6.26(ii) before claiming an equality over ℤ_p. Keep all lattice indices in the normalization. Carry out BSTW §6’s supersingular signed construction with the integral two-variable local maps, using the rank-one cohomology statement and no global congruence equality as a construction assumption. Prove both local reciprocity laws with a common integral normalization; one-variable rational PHR maps require the specified signed/unramified two-variable extension and normalization proof. Nonzero analytic images imply nonzero zeta class. Preserve local conditions and lattice under the specified cyclotomic projections, not arbitrary changes of the quadratic field. Construct the cyclotomic target independently as continuous-H¹ inverse limits. BSTW6.26(i), printed p.68, compares specialization with the normalized two-class combination; apply the same-field ± character projectors of §3.3 under Shapiro. A quotient of two-variable cohomology is related by a control theorem and is not its definition.

The source comparison is [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.14, printed p. 7; [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Remark 1.15(ii), printed p. 7; [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), §6.6.2, Proposition6.25 and Theorem6.26, printed p.68; §3.3; [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), §§2.2.4–2.2.5, printed pp.13–14; Theorem6.26(ii), printed p.68.

*Needs:* KatoEulerSystems L2 / p-adic-zeta-elements-and-their-norm-relations; KatoEulerSystems L3 / generalised-explicit-reciprocity-law-for-zeta-elements; PadicHodgeRegulators L3 / crystalline-regulator; PadicHodgeRegulators L4 / signed-local-condition; PadicHodgeRegulators L4 / actual-coleman-image; PadicHodgeRegulators L4 / integral-image-index; SelmerIwasawaCohomology L3 / iwasawa-cohomology; ArithmeticGaloisDuality R02.4; KatoEulerSystems L4; PadicFamilies L4; PadicHodgeRegulators L4; AutomorphicPadicLFunctions L3; Tau Ceti `TauCeti.ContCohomology.H1`; EllipticCurveModularity R29.4 / tate-module-comparison.

The intended declarations are:

- `TauCeti.BSD.bstwZetaElement` — Z^•(E/L) in the two-variable Iwasawa cohomology with the relaxed/signed local condition.
- `TauCeti.BSD.bstwZetaElement_ne_zero` — Z^•(E/L) ≠ 0.
- `TauCeti.BSD.bstwZetaElement_col` — Col^•_v(loc_v Z^•(E/L)) = L^•_p(E/L) (first explicit reciprocity law).
- `TauCeti.BSD.bstwZetaElement_log` — Log^•_{v̄}(loc_{v̄} Z^•)=L^Gr_p(E/L) in the completed unramified coefficient extension. The Coleman law uses v; the logarithm law uses v̄.
- `TauCeti.BSD.bstwZetaElement_cyclotomic` — In ℚ_p⊗H¹_Iw(K_cyc,T_pE), cyclotomic projection of Z^• equals c^•(ω,γ,γ′)g(χ_K)⁻¹ times the combination of the two Kato classes from BSTW§3.3/6.26(i). No identification with a single class is asserted.
- `TauCeti.BSD.bstwZetaElement_twist` — Apply the same-field ± quadratic-character projectors to the cyclotomic equality of 6.26(i); under Shapiro they give the specified g and g⊗χ_K eigenspaces with their differential/Betti/Gauss-sum factors.

**Checks.**

- Under the signed construction hypotheses Z^•≠0, because the nonzero signed analytic image under Col_v is prescribed.
- The same-field character projections of the cyclotomic class agree with those of the independently supplied normalized two-Kato-class combination. Use rational coefficients as in 6.26(i).
- The actual split-prime datum has distinct v and v̄: if v=w then v̄≠w. A repeated prime fails this input condition and cannot give both local maps.
- Constant-coefficient specialization sends Col_v(loc_v Z^•) to the constant term of L_p^• and Log_v̄(loc_v̄ Z^•) to the constant term of L_p^Gr in R₀. The two equality targets are distinct and retain their source normalization.
- Its images under the two explicit reciprocity laws are the nonzero p-adic L-functions L^•_p(E/L) and L^Gr_p(E/L), so Z^•(E/L) ≠ 0 (BSTW Remark 1.15(ii)).

### 8.2 The two explicit reciprocity laws for the BSTW zeta element

In the signed setting of bstw-two-variable-zeta-element, Col^•_v(loc_v Z^•)=L^•_p(E/L) and Log^•_{v̄}(loc_{v̄} Z^•)=L^Gr_p(E/L). The maps have the precise signed local domains and targets Λ_L, respectively its completed unramified coefficient extension, with the common integral normalization of BSTW Theorem1.14, printed p.7. The laws are at conjugate primes. The Greenberg function is the Rankin–Selberg/CM-family function from its analytic owner, with BDP obtained only by the specified anticyclotomic projection.

As the signed zeta construction. The ordinary construction is imported, and no one-variable BDP function is simply declared to be the two-variable Greenberg function.

First law: Kato's explicit reciprocity (KatoEulerSystems L3) interpolated over the family, with the signed Coleman maps of PadicHodgeRegulators L4. Second law: the Perrin-Riou logarithm at the other prime above p, compared with the BDP–Brooks interpolation (GZ.9/bdp-p-adic-l-function, GZ.9/bdp-weight-two-heegner-formula) through the explicit reciprocity of PadicHodgeRegulators L3/explicit-reciprocity. Common normalisation: both are computed with the same integral basis of D_cris and the same CM periods (BSTW §§5–6).

The source comparison is [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.14, printed p. 7.

*Needs:* §8.1 (the two-variable zeta element of an elliptic curve over an imaginary quadratic field (bstw)); KatoEulerSystems L3 / generalised-explicit-reciprocity-law-for-zeta-elements; PadicHodgeRegulators L3 / explicit-reciprocity; PadicHodgeRegulators L4 / regulator-coordinate-decomposition; GrossZagierAndArithmeticHeights GZ.9 / bdp-p-adic-l-function; GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; ArithmeticGaloisDuality R02.4; PadicHodgeRegulators L4; AutomorphicPadicLFunctions L3.

The intended declarations are:

- `TauCeti.BSD.bstw_explicit_reciprocity_laws` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Specialising both laws at the trivial character recovers Kato's reciprocity for E and the BDP formula for E/L.

### 8.3 Signed Perrin–Riou and Greenberg main-conjecture comparison

For the signed BSTW zeta datum with rank-one relaxed cohomology, nonzero analytic images and van_L:E[p](L)=0, the signed and Greenberg dual Selmer modules are torsion and char(X_Gr)·(L_p^•)=char(X_•)·(L_p^Gr) in Λ_L^ur. Obtain the cyclotomic-quotient version only when both localizations of the specialized class are non-torsion (nv). Without van_L retain the source’s rational form after inverting p. This comparison identity is distinct from the extra irreducibility assumptions in an integral main-conjecture proof.

Good supersingular p>2, a_p=0, split p, (D_L,N)=1; actual two-variable and cyclotomic local conditions/coefficients of BSTW9.3.2. Rank-one relaxed cohomology, zeta nonzero and the signed analogues of exact sequences(9.11)–(9.13), with integral local image corrections computed; (nv) for the cyclotomic version.

Prove the signed Poitou–Tate sequences with actual signed lattices, common unramified coefficient extension and Coleman image factors. BSTW presents only the ordinary proof and explicitly leaves the supersingular argument to the reader. Taking characteristic ideals gives char(H/ΛZ)char(X_Gr)=(L_Gr)char(X_st) and char(H/ΛZ)char(X_•)=(L_•)char(X_st); all canceled terms are nonzero torsion ideals. Cancel in the regular Iwasawa domain, keeping integral image terms until shown to match. This identity transports both directions of divisibility; the cyclotomic comparison repeats the argument after the exact specialization and (nv), rather than specializing a characteristic ideal without Tor/control corrections.

The source comparison is [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), §9.3.2, Proposition9.18 and proof, printed pp.83–84.

*Needs:* §8.1 (the two-variable zeta element of an elliptic curve over an imaginary quadratic field (bstw)); §8.2 (the two explicit reciprocity laws for the bstw zeta element); ArithmeticGaloisDuality R02.4; SelmerIwasawaCohomology L3; PadicHodgeRegulators L4.

The intended declarations are:

- `TauCeti.BSD.bstw_signed_main_conjecture_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Verify the product-ideal identity with signed local image corrections and no unproved equality of the main conjectures.
- Verify (nv) is retained after cyclotomic specialization.

### Examples

The signed Coleman law localizes at v and the signed logarithm law at v̄. They have distinct targets Λ_L and its completed unramified extension. Interchanging the primes without the conjugation comparison changes the Selmer conditions. Under cyclotomic specialization the class is the normalized two-Kato-class combination of BSTW §3.3/6.26, with its Betti and Gauss-sum factors. Identifying it with one unscaled Kato class would lose that compatibility.

### Dependencies

Supplier interfaces: ArithmeticGaloisDuality R02.4; AutomorphicPadicLFunctions L3; EllipticCurveModularity R29.4 / tate-module-comparison; GrossZagierAndArithmeticHeights GZ.9 / bdp-p-adic-l-function; GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; KatoEulerSystems L2 / p-adic-zeta-elements-and-their-norm-relations; KatoEulerSystems L3 / generalised-explicit-reciprocity-law-for-zeta-elements; KatoEulerSystems L4; PadicFamilies L4; PadicHodgeRegulators L3 / crystalline-regulator; PadicHodgeRegulators L3 / explicit-reciprocity; PadicHodgeRegulators L4; PadicHodgeRegulators L4 / actual-coleman-image; PadicHodgeRegulators L4 / integral-image-index; PadicHodgeRegulators L4 / regulator-coordinate-decomposition; PadicHodgeRegulators L4 / signed-local-condition; SelmerIwasawaCohomology L3; SelmerIwasawaCohomology L3 / iwasawa-cohomology; Tau Ceti `TauCeti.ContCohomology.H1`.

## Layer 9: Integral anticyclotomic and signed main-conjecture arguments

Use the early signed comparison, exact control and independent congruences to establish the signed endpoint. The corrected multiplicative branch retains its additional local and higher-weight obligations.

### 9.1 Anticyclotomic control at the trivial character (JSW Theorem 3.3.1)

Let E/ℚ be semistable, p ≥ 3 a prime of good reduction with E[p] irreducible, K imaginary quadratic with p = 𝔭𝔭̄ split, (gen-H) for N = N⁺N⁻ and (irred_K). Let K_∞ be the anticyclotomic ℤ_p-extension, Λ = ℤ_p[[Gal(K_∞/K)]], and X_ac the dual of the Selmer group with the 'relaxed at 𝔭, strict at 𝔭̄' conditions at p (the Greenberg-type condition of the BDP main conjecture). If rank E(K) = 1 and Ш(E/K)[p^∞] is finite, then X_ac is Λ-torsion and ord_p(Ch_Λ(X_ac)(0)) = ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])), where, by JSW (3.5.d), ord_p(#H¹_{F_ac}·C) = ord_p #Ш(E/K) − 2 ord_p [E(K) : ℤz_K] + 2 ord_p(((1 + p − a_p)/p)·log_ω z_K) + ord_p ∏_{w|N⁺} c_w(E/K).

JSW's (split), (gen-H), (good), (-free), (irred_K), (corank 1), (sur); the control is a comparison of finite modules with all local terms kept. Use the finite-level/index/regulator convention of JSW3.5 with E(K)[p]=0, nonzero z_K and the (sur) local map; do not replace finite-level H1_ac and Λ-adic duals without the control theorem.

Control via Greenberg's method: compare the Λ-adic Selmer group at the augmentation ideal with H¹_{F_ac}(K, E[p^∞]), the kernel and cokernel being controlled by H⁰ terms that vanish under (irred_K) and local terms at primes w | N⁺ split in K (Tamagawa factors) (SelmerIwasawaCohomology L3/iwasawa-descent, L3/semilocal-cohomology). This requires a Selmer-specific map with its finite kernel/cokernel and augmentation correction; derived cohomology descent alone is insufficient. No proper finite-index Λ-submodules (as in Castella erratum Lemma 2.2), so the characteristic ideal specialises to the Fitting ideal. Express #H¹_{F_ac} through Ш, the index of z_K and the p-adic logarithm at 𝔭 using the Bloch–Kato logarithm of the Kummer class (GZ.9/bloch-kato-logarithm-of-heegner-class) and Poitou–Tate (ArithmeticGaloisDuality R02.4/poitou-tate).

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §1.3, p. 3.

*Needs:* SelmerIwasawaCohomology L3 / iwasawa-descent; SelmerIwasawaCohomology L3 / semilocal-cohomology; GrossZagierAndArithmeticHeights GZ.9 / bloch-kato-logarithm-of-heegner-class; ArithmeticGaloisDuality R02.4 / poitou-tate; §2.9 (tamagawa factors under quadratic base change and twist); ModularIwasawaMainConjectures L0; SelmerIwasawaCohomology L3; ArithmeticGaloisDuality R02.4; Tau Ceti `TauCeti.ContCohomology.H1`.

The intended declarations are:

- `TauCeti.BSD.anticyclotomic_selmer_control` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Used with K = K′ in §10.6 (JSW (7.4.a)–(7.4.b)).

### 9.2 Kobayashi's signed main conjecture for semistable curves at supersingular primes (BSTW Theorem 1.3)

Let E/ℚ be semistable and p > 2 a supersingular prime, with a₃(E) = 0 if p = 3. Then for ∘ ∈ {+, −}, (L^∘_p(E)) = ξ_Λ(X^∘(E)) in Λ = ℤ_p[[Gal(ℚ_∞/ℚ)]], where L^±_p(E) are Pollack's signed p-adic L-functions and X^±(E) the duals of Kobayashi's signed Selmer groups. The same holds for every quadratic twist E^K with D_K coprime to Np and divisible only by primes of ordinary reduction for E. The equality is exported to ModularIwasawaMainConjectures L6.

Exactly BSTW's hypotheses and twist range; Wan arXiv:1411.6352 is withdrawn and superseded in part by BSTW (Remark 1.4); its CM case is Pollack–Rubin.

Choose auxiliary L with split p and the required local character/congruence hypotheses and cyclotomic (nv). Proposition1.19 uses (irr_L), stronger than (van_L), but BSTW §1.2.1 explicitly says (irr_L) holds for good supersingular p>2. Discharge it from the local supersingular residual representation at the split p-adic place; do not present it as an extra unproved field-existence restriction. One divisibility in the two-variable Greenberg main conjecture over L from the semi-ordinary GU(3,1) congruences of Castella–Liu–Wan (AutomorphicCongruences L2s) and Hsieh's μ theorem (AutomorphicPadicLFunctions L3h). Transfer the rational divisibility using bstw-signed-main-conjecture-comparison. BSTW Proposition1.19 upgrades to an integral comparison under E[p]|G_L irreducible (1.6); the weaker van_L is sufficient for Proposition9.18’s comparison identity but not for every integral MC step. The opposite divisibility from Kato's signed Euler-system bound (KatoEulerSystems L4, EulerSystemsAndKolyvaginSystems ES.4, signed local conditions of PadicHodgeRegulators L4). Cyclotomic descent from L to ℚ (BSTW §10), separating E and E^L; track the height-one primes and residual conditions.

The source comparison is [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.3, p. 3; [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.3, p. 3.

*Needs:* §8.2 (the two explicit reciprocity laws for the bstw zeta element); §8.1 (the two-variable zeta element of an elliptic curve over an imaginary quadratic field (bstw)); AutomorphicCongruences L2s; AutomorphicPadicLFunctions L3h; KatoEulerSystems L4 / cohomological-divisibility-one-direction; EulerSystemsAndKolyvaginSystems ES.4 / rubin-bound; PadicHodgeRegulators L4 / signed-local-condition; ModularSymbolsPadicLFunctions L4 / plus-minus-decomposition; ModularIwasawaMainConjectures L4; SelmerIwasawaCohomology L3 / iwasawa-descent; §3.1 (admissible discriminants with prescribed local conditions); §8.3 (signed perrin–riou and greenberg main-conjecture comparison).

The intended declarations are:

- `TauCeti.BSD.bstw_signed_main_conjecture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- 11a1 at p = 19 (a₁₉ = 0, E[19] irreducible, semistable): both signed main conjectures hold, and so does the twisted statement for E^K with D_K coprime to 11·19 supported at ordinary primes.

### 9.3 Higher-weight integral Kolyvagin bound

Extend the rank-two conjugate-self-dual ordinary Kolyvagin-system argument to the actual lattice T_g of an even-weight p-ordinary newform over K with residual representation irreducible over G_K and the corrected generalized Heegner local conditions. For the nonzero Λ-adic generalized Heegner class κ_g, the ordinary compact Selmer group S and dual X have Λ_O-rank one, and char(X_tors)⊇char(S/Λ_O κ_g)^2 integrally, including the augmentation prime, once C1=C2=0 is proved. CGS6.5.1’s elliptic rational theorem alone is not this extension.

The actual T_g, critical self-dual twist, saturated ordinary filtration and cartesian local conditions satisfying the rank-one Kolyvagin-system hypotheses of ES.8; p split in K. Residual irreducibility over G_K, nonzero generalized Heegner class from GH.7 and the required local conditions corrected by Kobayashi–Ota. Prove C1=C2=0 from the specified irreducible image/cohomology inputs rather than adding it as an unexplained assumption.

Transport the CGS6.1.1/6.5.1 rank-two linear-algebra proof to T_g and prove every image, local and cartesian hypothesis. C2: supply CGLS22 Remark3.3.5 irreducible-image argument. C1: verify Cha05 Theorem2 and the applicable Matar–Nekovář0.9 variant for T_g and its finite-level restriction kernel. Handle the augmentation prime before passing from height-one bounds to the integral characteristic ideal. Connect the corrected generalized Heegner class with this ordinary Kolyvagin system. With the same integral lattice, generalized Heegner reciprocity law and primitive local conditions, prove the higher-weight ordinary Poitou–Tate comparison of the BCK Theorem 5.2 argument: the preceding index-square containment implies that X_ac is torsion and char(X_ac)Λ_O^ur contains (L_p(g)). Retain every local image index and period factor before asserting the integral containment. This is an early ordinary comparison and its higher-weight extension, independent of the later HE.8b Eisenstein equality; it is a required compatibility proof for the next main-conjecture target.

The source comparison is [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Proof of Theorem2.3, printed pp.3–4, equation(2.2); [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), §6 opening and Theorems6.1.1,6.5.1.

*Needs:* EulerSystemsAndKolyvaginSystems ES.8; GeneralizedHeegnerCycles GH.7; OrdinaryAutomorphicFormsAndModularityLifting R21.3; SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.higher_weight_integral_kolyvagin_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Give an actual T_g local-condition signature and separate proofs for C1 and C2.
- Retain the augmentation-prime estimate and no unresolved power of p.

### 9.4 The anticyclotomic divisibility for the BDP p-adic L-function (Wan; JSW §6)

In the setting of anticyclotomic-selmer-control (p ≥ 3 good ordinary or supersingular, with a_p = 0 if p = 3 is supersingular), the BDP–Brooks p-adic L-function L_p(f) ∈ Λ^ur (GZ.9) satisfies the divisibility Ch_{Λ^ur}(X_ac) ⊆ (L_p(f)) in Λ^ur ⊗ ℚ_p, and integrally in Λ^ur under JSW's hypotheses (the μ-part requiring JSW6.1.6/Burungale5.1.3 and all selected Hsieh hypotheses); consequently ord_p L_p(f, 1) ≤ ord_p(#H¹_{F_ac}(K, E[p^∞]) · C(E[p^∞])) (JSW Proposition 6.2.1).

Inputs are owned elsewhere: the U(3,1) Eisenstein congruences (AutomorphicCongruences L2 for the ordinary FW route, L2s for the semi-ordinary CLW replacement of withdrawn Wan arXiv:1412.1767), Hsieh's μ theorem (AutomorphicPadicLFunctions L3h) and the Eischen–Wan finite-slope families (L4e). The divisibility direction is the one giving lower bounds for Sha; the reverse divisibility is not claimed here.

Construct the Klingen Eisenstein family on GU(3,1) whose constant term is L_p(f)·(Katz factor) and whose non-degenerate Fourier–Jacobi coefficients are p-adic units (AutomorphicCongruences L2/L2s; Eischen–Wan for finite slope, APL L4e). Lattice construction: the congruence between the Eisenstein family and cusp forms produces Selmer classes, giving Ch(X_ac) ⊆ (L_p(f)) (the Ribet–Urban method). Remove the ambiguity of powers of p: μ(L_p(f)) = 0 by Hsieh (APL L3h) and the comparison of BDP and Hida's two-variable functions (GZ.9/imprimitive-function-dictionary). Specialise at the trivial character with anticyclotomic-selmer-control. CLW L2s supplies fractional one-sided containment with auxiliary-character/local/residual hypotheses and inverted coefficient elements, not an unrestricted integral supersingular equality. Prove those conditions and removal of exceptional height-one primes before asserting the integral JSW consequence.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §1.3, p. 3.

*Needs:* AutomorphicCongruences L2; AutomorphicCongruences L2s; AutomorphicPadicLFunctions L3h; AutomorphicPadicLFunctions L4e; GrossZagierAndArithmeticHeights GZ.9 / bdp-p-adic-l-function; GrossZagierAndArithmeticHeights GZ.9 / bdp-measure-integrality; GrossZagierAndArithmeticHeights GZ.9 / imprimitive-function-dictionary; §9.1 (anticyclotomic control at the trivial character (jsw theorem 3.3.1)).

The intended declarations are:

- `TauCeti.BSD.wan_anticyclotomic_divisibility` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- JSW (7.4.a) for K = K′.

### 9.5 Specialisation of the signed main conjecture in rank zero

Under the hypotheses of bstw-signed-main-conjecture (E or a permitted twist E^K), if L(E, 1) ≠ 0 then #Ш(E/ℚ)[p^∞]·∏_ℓ c_ℓ(E) and L(E,1)/Ω_E have the same p-adic valuation (the r = 0 case of BSTW Theorem 1.5).

Supersingular p > 2 with a_p = 0 (automatic for p ≥ 5).

Specialise (L^+_p(E)) = ξ_Λ(X^+(E)) at the trivial character: L^+_p(E)(1) is a p-adic unit times L(E,1)/Ω_E^+ (interpolation with the factor (p − 1) or 2 from the half-logarithms, ModularSymbolsPadicLFunctions L4/half-logarithms), and Kobayashi's control theorem for the + Selmer group gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ. E(ℚ) is finite (Layer 6) so Sel = Ш[p^∞]; Ω_E^+ versus Ω_E needs the Manin constant prime to p (GZ.3).

The source comparison is [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.5, p. 4.

*Needs:* §9.2 (kobayashi's signed main conjecture for semistable curves at supersingular primes (bstw theorem 1.3)); ModularSymbolsPadicLFunctions L4 / half-logarithms; SelmerIwasawaCohomology L3 / iwasawa-descent; §6.1 (analytic rank zero implies rank zero and finite sha (kolyvagin)); GrossZagierAndArithmeticHeights GZ.3; SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.bstw_rank_zero_p_part` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- BSTW Theorem 1.5 with r = 0.

### 9.6 The higher-weight anticyclotomic main conjecture and Selmer lemmas used by Castella's correction

(a) (Erratum Theorem 2.3.) Let g ∈ S_k(Γ₀(M)) be a p-ordinary newform of even weight k ≥ 2 and level M ≥ 3 with p ∤ M, and K imaginary quadratic with p split and a Heegner ideal of norm M. Assume ρ̄_g|_{G_K} irreducible; 2 ∥ M if 2 is nonsplit in K; some q ∥ M nonsplit in K; and at every ℓ ∥ M nonsplit in K, π(g)_ℓ is the special representation twisted by the unramified character ℓ ↦ −ℓ^{k/2−1}. Then for every finite set Σ of primes not above p, X^Σ_ac(A_g) is Λ_O-torsion and Ch_{Λ_O}(X^Σ_ac(A_g))Λ^ur_O = (L^Σ_p(g)). (b) (Lemma 2.1.) If Σ contains the primes v ∤ p where T_g ramifies, ρ̄_g|_{G_K} is irreducible and H⁰(K_𝔭, A_g[ϖ]) = 0, then Sel^Σ_p(K, M_g[ϖ^m]) ≅ Sel^Σ_p(K, M_g)[ϖ^m]. (c) (Lemma 2.2.) If X_ac(A_g) is Λ_O-torsion, Sel^Σ_p(K, M_g) has no proper finite-index Λ_O-submodules.

Use GH.2–7 generalized Heegner classes and the exact reciprocity laws; the higher-weight integral Kolyvagin bound is proved in §9.3. Import only CGS’s elliptic-curve rational comparison as background, not a ready higher-weight integral theorem. The reverse divisibility uses FW Theorem4.41/Corollary7.21 from AC L2; CGS Proposition2.4.5 from APL L3h; FO12 Lemma2.14 from R21.3; the early ordinary BCK5.2 comparison accompanying the extension in §9.3; Greenberg no-finite-submodule theorem from SIC L3. Prove each local/residual/integral hypothesis and the Σ-imprimitive projection here.

(a) Use the higher-weight integral Kolyvagin bound added in this roadmap, retaining the augmentation-prime case, C1=C2=0 proof and corrected generalized Heegner local conditions. Combine the BCK comparison, exact GH reciprocity, FW reverse divisibility and APL anticyclotomic Rankin/Katz-to-BDP projection. Prove the Σ-imprimitive version via JSW3.4.2/6.1.6 with matching factors. (b) Shapiro's lemma and H⁰(K, M_g) = H⁰(K_∞, A_g) = 0 give H¹(G_{K,S}, M_g[ϖ^m]) ≅ H¹(G_{K,S}, M_g)[ϖ^m]; the local kernel at 𝔭 is H⁰(K_𝔭, M_g)/ϖ^m, zero when H⁰(K_𝔭, A_g[ϖ]) = 0. (c) Greenberg's general results (as in Hsieh–Lei and Skinner Proposition 2.3.3). CGS6.5.1 is for T_pE and gives its displayed bound over Λ[1/p]. Prove the extension to T_g, rather than assuming it. Correct the erratum’s second C2=0 to C1=0 and discharge it via Cha05/large-image input. The nonexistent FO12 Cor7.2.1 is not a supplier. For FW4.41, verify absolute residual irreducibility over K, the crystalline p-local alternative, a nonsplit q∥M, and that every nonsplit conductor prime is ramified special with the prescribed unramified twist; otherwise the source gives only the inclusion away from pullbacks of cyclotomic height-one primes. The cyclic Heegner ideal and residual/local-type comparison must discharge these hypotheses explicitly. Apply FW7.21 with its class-number and Katz factors before the Σ projection; FO2.14 is only the local-type input.

The source comparison is [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem 2.3, p. 3; [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Lemma 2.1, p. 2; [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Remark after Theorem A′, p. 2; [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Lemma2.2, p.3; [Olivier Fouquet and Tadashi Ochiai](https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf), Lemma2.14, pp.12–13; [Olivier Fouquet and Xin Wan](https://arxiv.org/abs/2107.13726v3), Theorem4.41, p.58; Corollary7.21, p.89.

*Needs:* GeneralizedHeegnerCycles GH.7; AutomorphicCongruences L2; AutomorphicPadicLFunctions L3h; AutomorphicPadicLFunctions L4e; §9.3 (higher-weight integral kolyvagin bound); HeegnerPointEulerSystems HE.8; SelmerIwasawaCohomology L3 / iwasawa-shapiro; EulerSystemsAndKolyvaginSystems ES.4 / variant-bounds; SelmerIwasawaCohomology L3; OrdinaryAutomorphicFormsAndModularityLifting R21.3.

The intended declarations are:

- `TauCeti.BSD.castella_higher_weight_input` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- For g of weight 2 congruent to the p-stabilised form of E, (b) needs E(ℚ_p)[p] = 0: this is where hypothesis (iv) of Theorem 1.1 enters.

### 9.7 Castella's corrected anticyclotomic main conjecture at a multiplicative prime (erratum Theorem 1.1)

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3, K imaginary quadratic with an ideal 𝔑 ⊂ 𝓞_K with 𝓞_K/𝔑 ≅ ℤ/N and p = 𝔭𝔭̄ split. Assume (i) E[p] irreducible; (ii) if 2 is nonsplit in K then 2 ∥ N; (iii) E has nonsplit multiplicative reduction at each prime q ∥ N nonsplit in K, and E[p] is ramified at at least one such q; (iv) E(ℚ_p)[p] = 0. Then X_ac(E[p^∞]) is Λ-torsion and Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)), with L_p(f) the BDP-type function of GZ.9/multiplicative-prime-formula.

Exactly the corrected hypotheses; the invalid Hida specialisation step of Castella (2018) Theorem 4.2 is not used, and additive primes are allowed.

Choose a Hida family f through the p-stabilised newform and, for each m, a p-ordinary newform g of weight k > 2 with k≡2 mod p−1 and level M with p ∤ M congruent to f modulo p^m (Skinner §3.1's Hida-family/Fitting-ideal argument; specified from ModularIwasawaMainConjectures). For g, the higher-weight main conjecture castella-higher-weight-input gives Ch(X_ac^Σ(A_g)) = (L^Σ_p(g)). castella-higher-weight-input's Lemma 2.1 (needs (iv)) identifies Sel^Σ_p(K, M_f[ϖ^m]) with Sel^Σ_p(K, M_f)[ϖ^m]; Lemma 2.2 (no proper finite-index submodules) turns characteristic ideals into Fitting ideals, which are compatible with the congruence. Congruence of p-adic L-functions modulo p^m (GH.7 big Heegner/BDP families) and letting m → ∞ gives the equality for f; remove Σ-imprimitivity with local factors. Preserve the nonsplit special local type along the Hida family by FO12 Lemma2.14 from R21.3; carry hypotheses (iii)–(iv) into each g_m using the Hecke relation. Prove the anticyclotomic Fitting-congruence argument for every m, not merely its analogy with Skinner’s cyclotomic proof.

The source comparison is [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem 1.1, p. 1; [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), §1, p. 1.

*Needs:* §9.6 (the higher-weight anticyclotomic main conjecture and selmer lemmas used by castella's correction); GeneralizedHeegnerCycles GH.7; GrossZagierAndArithmeticHeights GZ.9 / multiplicative-prime-formula; ModularIwasawaMainConjectures L1; SelmerIwasawaCohomology L3 / iwasawa-descent; GrossZagierAndArithmeticHeights GZ.9; OrdinaryAutomorphicFormsAndModularityLifting R21.3.

The intended declarations are:

- `TauCeti.BSD.castella_anticyclotomic_main_conjecture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Castella erratum Theorem 1.1.

### Examples

In O⟦T⟧, the ideals (pT) and (T) become equal after inverting p but differ integrally. Their coefficient-prime lengths distinguish them. An augmentation comparison at T=0 cannot show that their quotient is a unit, since the comparison vanishes there. A near-trivial nonzero specialization together with the integral μ comparison and exact control removes this ambiguity. In the signed cyclotomic argument both specified localizations must be non-torsion; one nonzero analytic image supplies only one of those tests.

For the corrected multiplicative theorem, retain p>3, the stated Heegner ideal, residual ramification at the nonsplit multiplicative primes and (E(ℚ_p)[p]=0). Additive primes away from p are permitted by the corrected endpoint, but they require the stated extensions of the period and BDP interfaces.

### Dependencies

Earlier comparisons: §2.9, §3.1, §6.1, §8.1, §8.2, §8.3. Supplier interfaces: ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality R02.4 / poitou-tate; AutomorphicCongruences L2; AutomorphicCongruences L2s; AutomorphicPadicLFunctions L3h; AutomorphicPadicLFunctions L4e; EulerSystemsAndKolyvaginSystems ES.4 / rubin-bound; EulerSystemsAndKolyvaginSystems ES.4 / variant-bounds; EulerSystemsAndKolyvaginSystems ES.8; GeneralizedHeegnerCycles GH.7; GrossZagierAndArithmeticHeights GZ.3; GrossZagierAndArithmeticHeights GZ.9; GrossZagierAndArithmeticHeights GZ.9 / bdp-measure-integrality; GrossZagierAndArithmeticHeights GZ.9 / bdp-p-adic-l-function; GrossZagierAndArithmeticHeights GZ.9 / bloch-kato-logarithm-of-heegner-class; GrossZagierAndArithmeticHeights GZ.9 / imprimitive-function-dictionary; GrossZagierAndArithmeticHeights GZ.9 / multiplicative-prime-formula; HeegnerPointEulerSystems HE.8; KatoEulerSystems L4 / cohomological-divisibility-one-direction; ModularIwasawaMainConjectures L0; ModularIwasawaMainConjectures L1; ModularIwasawaMainConjectures L4; ModularSymbolsPadicLFunctions L4 / half-logarithms; ModularSymbolsPadicLFunctions L4 / plus-minus-decomposition; OrdinaryAutomorphicFormsAndModularityLifting R21.3; PadicHodgeRegulators L4 / signed-local-condition; SelmerIwasawaCohomology L3; SelmerIwasawaCohomology L3 / iwasawa-descent; SelmerIwasawaCohomology L3 / iwasawa-shapiro; SelmerIwasawaCohomology L3 / semilocal-cohomology; Tau Ceti `TauCeti.ContCohomology.H1`.

## Layer 10: Prime parts with irreducible residual representation

State each named range separately: ordinary or multiplicative rank zero, supersingular rank zero, semistable good-prime rank one, and corrected multiplicative rank one.

### 10.1 Specialising a cyclotomic main conjecture at the trivial character

Let f=F_E have weight two and p≥3 good ordinary or multiplicative, with irreducible residual representation and L(f,1)≠0. Assume the integral cyclotomic main conjecture and the local control/period conventions of Skinner §3.2. If reduction is not split multiplicative, the final equality is #ℤ_p/(L_alg(f,1))=#Sel(f)·∏_ℓ c_ℓ(T_f). The anomalous factor #(ℤ_p/(α_p−1))² appears on both sides before cancellation, not as an extra factor in this final equality. For split multiplicative p use the leading coefficients at γ−1, Greenberg–Stevens and the nonzero L-invariant; the same finite equality results after keeping the p-local Tamagawa factor.

Selmer groups with Σ-imprimitive conditions are compared with the primitive ones by local factors at ℓ ∈ Σ (Skinner §3.1). In case (b), the nonvanishing of L(V_f) is an input (transcendence of the Tate period), specified from DiophantineApproximationAndTranscendence DT.5; the Greenberg–Stevens derivative formula is specified from PadicFamilies L3. L(f,1)≠0, integral main conjecture, precise Greenberg no-finite-submodule/projective-dimension and local control hypotheses; all orders displayed are finite.

No nonzero finite Λ-submodules in X (Greenberg; Skinner Proposition 2.3.3), so char ideals equal Fitting ideals and specialise. Control: 0 → S → Sel_{ℚ∞}(f) → H¹(F_p, (M⁻)^{I_p}) → 0, and the last term vanishes unless α_p = 1 (Skinner §3.2); SelmerIwasawaCohomology L3/iwasawa-descent. Local terms: #K_ℓ = c_ℓ(T_f) for ℓ ≠ p, and #K_p = c′_p c″_p with c′_p = c″_p = #(ℤ_p/(α_p − 1)) when α_p ≠ 1 (Tate local duality). Cancel the local anomalous factor against the interpolation factor before displaying the finite BSD equality, as in Skinner (3.2.7). Split multiplicative case: the extra zero of L_f at the trivial character and of Ch at γ − 1; compare L′_f(0) with L(V_f)·L_alg(f,1) (Greenberg–Stevens) and c_p with ψ_ur/ψ_cyc of the extension class (log_p q_E).

The source comparison is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §3.2, p. 20; [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, Theorem B (iii), p. 2.

*Needs:* SelmerIwasawaCohomology L3 / iwasawa-descent; SelmerIwasawaCohomology L4 / greenberg-main-conjecture; ModularIwasawaMainConjectures L0; PadicFamilies L3; DiophantineApproximationAndTranscendence DT.5; PadicHodgeRegulators L3 / rubin-coleman-map; PadicHodgeRegulators L4 / split-multiplicative-augmentation; SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.cyclotomic_specialization_formula` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- 11a1 at p = 5 is excluded (E[5] reducible); 11a1 at p = 3 (ordinary, good) has L_alg(f,1) a 3-adic unit and Sel(f) = 0.

### 10.2 The p-part of BSD in rank zero at supersingular primes

Let E/ℚ be semistable, or a quadratic twist of a semistable curve by a character unramified at the primes dividing the conductor of the semistable curve and with discriminant supported at primes of ordinary reduction and coprime to Np, and let p > 2 be a prime of good supersingular reduction with a_p(E) = 0 (automatic for p ≥ 5). If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0.

Hypotheses of BSTW Theorems 1.3 and 1.5 (r = 0); the twist range is BSTW's, not a broader one from a differently normalised statement. JSW7.2.1(iii) cites a withdrawn Wan preprint and allows a larger coprime-twist range. BSTW1.3/1.5 repair the semistable and ordinary-support twist endpoint only; the statements must not be called identical.

Kobayashi's signed main conjecture (L^±_p(E)) = ξ_Λ(X^±(E)) for E and its permitted twists (§9.2). Specialise the + (or −) equality at the trivial character: Kobayashi's control theorem for signed Selmer groups gives #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ against L^±_p(E)(1) = (unit)·L(E,1)/Ω_E (§9.5). E(ℚ) finite (Layer 6) and E(ℚ)[p] = 0; conclude by §7.10.

The source comparison is [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem 1.5, p. 4; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(iii), p. 43.

*Needs:* §9.5 (specialisation of the signed main conjecture in rank zero); §9.2 (kobayashi's signed main conjecture for semistable curves at supersingular primes (bstw theorem 1.3)); §6.1 (analytic rank zero implies rank zero and finite sha (kolyvagin)); §7.10 (the p-part of bsd from an upper and a lower bound).

The intended declarations are:

- `TauCeti.BSD.rank_zero_supersingular_p_part` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1 has rank one and is outside this result; for a semistable rank-zero curve with a supersingular p ≥ 5 the result applies with a_p = 0.

### 10.3 A semistable curve with irreducible E[p] is residually ramified somewhere

Let E/ℚ be semistable of conductor N>1 and p an odd prime of good reduction with E[p] irreducible. Some q|N, necessarily q≠p, has E[p] ramified. At a multiplicative q≠p this is equivalent to p∤ord_q(Δ_min), the geometric component multiplicity; it is not equivalent to p∤c_q(E/ℚ) at a nonsplit prime. For an imaginary quadratic K in which q is inert or ramified, the residual representation remains irreducible over K under the cited index-two inertia argument.

E semistable, p odd, E[p] irreducible. p has good reduction, the range used in JSW’s level-lowering application; q≠p is required in the Tate-curve residual criterion.

If E[p] were unramified at every q | N, Ribet's level-lowering theorem would remove each q in turn, producing a weight-two cusp form of level 1 with residual representation E[p]; there is none (specified from SerreWeightAndLevelOptimisation R20.2). At a multiplicative q, E[p] is ramified iff p ∤ ord_q(Δ_min) (Tate curve), and c_q = ord_q(Δ_min) in the split case. Irreducibility over K: a G_K-stable line would be stable under the inertia at q, whose image is unipotent nontrivial, forcing a G_ℚ-stable line.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4, p. 45; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, p. 45.

*Needs:* SerreWeightAndLevelOptimisation R20.2; TauCetiRoadmap EllipticCurves Layer 4; §0.6 (local euler factors of a quadratic twist).

The intended declarations are:

- `TauCeti.BSD.residually_ramified_prime` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, p = 3: ord₁₁Δ = 5, so E[3] is ramified at 11.

### 10.4 BSTW supersingular rank-one p-part

Let E/ℚ be semistable with analyticRank E=1, and p>2 a good supersingular prime with a_p=0 (explicit when p=3). Then v_p(bsdDefect E)=0. The same holds for twists in BSTW1.3’s coprime ordinary-support range. This direct endpoint does not assert the JSW auxiliary-twist proof applies outside that range.

Exactly BSTW1.5 rank-one hypotheses, with the Néron period and BSD regulator normalization. No residual irreducibility is added to the source endpoint.

Use the signed main conjecture and the source’s supersingular p-adic Gross–Zagier formula (Kobayashi [88]), signed Selmer control, cyclotomic descent and finite Sha/rank theorem. Transfer the resulting leading-term equality to bsdDefect with the correct regulator and torsion denominator; good supersingular p gives no rational p-torsion.

The source comparison is [Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan](https://arxiv.org/abs/2409.01350v2), Theorem1.5, printed p.4 (rank one), and §11.

*Needs:* §9.2 (kobayashi's signed main conjecture for semistable curves at supersingular primes (bstw theorem 1.3)); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite); §7.8 (the rational bsd defect); GrossZagierAndArithmeticHeights GZ.9; SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.bstw_rank_one_p_part` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Retain a₃=0 when p=3; 37a1 has a₃=−3 and is not an example at that prime.

### 10.5 The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner)

Let E/ℚ be elliptic with good ordinary or multiplicative reduction at a prime p ≥ 3, E[p] irreducible, and a prime q ≠ p of multiplicative reduction at which E[p] is ramified. If ellipticL E 1 ≠ 0 then padicValRat p (bsdDefect E) = 0, i.e. ord_p #Ш(E/ℚ)[p^∞] = ord_p (L(E,1)/(Ω_E ∏_ℓ c_ℓ(E))).

The hypotheses are JSW Theorem 7.2.1(ii) and Skinner Theorem C, kept exactly; the residual hypothesis is the Skinner–Urban form (q ∥ N with ρ̄ ramified at q), not the stronger FW 1.6 form. Multiplicative p (p ∥ N): the main conjecture is Skinner's Theorem A for p | N, and in the split case the exceptional-zero inputs (Greenberg–Stevens, L(V_f) ≠ 0) are used; good ordinary p: Skinner–Urban plus Kato.

Main conjecture Ch_Λ(X) = (L_f) in Λ: for p ∤ N, Skinner–Urban's Theorem in the SU/Skinner Theorem A (p ∤ N) form (specified from ModularIwasawaMainConjectures L1); for p ∥ N, Skinner's Theorem A deduced from the p ∤ N case through Hida families and Fitting ideals (specified as a new ModularIwasawaMainConjectures layer beside L1). cyclotomic-specialization-formula turns the equality into #ℤ_p/(L_alg(E,1)) = #Sel_{p^∞}(E/ℚ)·∏_ℓ c_ℓ, with the split multiplicative case through L(V_f) ≠ 0. Sel_{p^∞}(E/ℚ) = Ш(E/ℚ)[p^∞] as E(ℚ) is finite (§6.1) and E(ℚ)[p] = 0. Periods: Ω_E = −2πiΩ_f^+ up to ℤ_(p)^× (Manin constant prime to p, specified from GZ.3); then §7.10.

The source comparison is [Christopher Skinner](https://arxiv.org/abs/1407.1093v1), §1, Theorem C, p. 3; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Theorem 7.2.1(ii), pp. 42–43.

*Needs:* §10.1 (specialising a cyclotomic main conjecture at the trivial character); ModularIwasawaMainConjectures L1; §6.1 (analytic rank zero implies rank zero and finite sha (kolyvagin)); §7.10 (the p-part of bsd from an upper and a lower bound); §1.1 (rationality of l(e,1)/ω_e); §6.3 (kato's upper bound for the p-part of sha in analytic rank zero); GrossZagierAndArithmeticHeights GZ.3; PadicFamilies L3; DiophantineApproximationAndTranscendence DT.5.

The intended declarations are:

- `TauCeti.BSD.rank_zero_ordinary_multiplicative_p_part` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 11a1, p = 3: hypotheses hold with q = 11 (E[3] ramified at 11 since 3 ∤ ord₁₁Δ = 5), and the formula gives Ш(E/ℚ)[3^∞] = 0.

### 10.6 The lower bound for Sha[p^∞] in analytic rank one (JSW §7.4.1)

Let E/ℚ be semistable, optimal, analyticRank E = 1, p ≥ 3 a prime of good reduction with E[p] irreducible (and a_p = 0 if p = 3 is supersingular). Then ord_p #Ш(E/ℚ)[p^∞] ≥ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

Hypotheses of JSW Theorem 1.2.1; isogeny invariance (§7.9) reduces to optimal E.

Choose q | N with E[p] ramified (residually-ramified-prime) and K′ by §3.6 (a): (gen-H), q inert or ramified, p split, L(E^{K′},1) ≠ 0; so rank E(K′) = 1, Ш(E/K′) finite. Anticyclotomic main-conjecture divisibility plus control (§9.4, §9.1): ord_p L_p(f,1) ≤ ord_p(#H¹_{F_ac}(K′,E[p^∞])·C(E[p^∞])). Remove the excluded height-one and p factors using JSW6.1.6’s exact μ input: Burungale Proposition5.1.3 for BDP/Brooks, with Hsieh’s auxiliary conditions where needed. Check squarefree conductor, a nonsplit bad prime, (irred_K), corank1 and local surjectivity. A generic Hsieh μ=0 citation alone does not discharge these. The BDP–Brooks formula (GZ.9/quaternionic-weight-two-formula, GZ.9/p-optimal-quotient-formula): ord_p L_p(f,1) = 2 ord_p(((1 + p − a_p)/p)·log_ω z_{K′}); hence (JSW (7.4.b)) ord_p #Ш(E/K′)[p^∞] ≥ 2 ord_p m_{K′} − ord_p ∏_{w|N⁺} c_w(E/K′). Gross–Zagier in Zhang's form for z_{K′} and the Ribet–Takahashi comparison (§7.3) give 2 ord_p m_{K′} = ord_p((L′(E,1)/(Ω_E Reg))·(L(E^{K′},1)/Ω_{E^{K′}})) − ord_p ∏_{ℓ|N⁻} c_ℓ(E/K′), using §2.5 and the Manin constant prime to p. §2.9, §2.7 and the Kato bound for E^{K′} (§6.3) give the bound for E.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.1, (7.4.d), p. 47.

*Needs:* §10.3 (a semistable curve with irreducible e[p] is residually ramified somewhere); §3.6 (simultaneous choice of the auxiliary fields of the prime-part arguments); §9.4 (the anticyclotomic divisibility for the bdp p-adic l-function (wan; jsw §6)); §9.1 (anticyclotomic control at the trivial character (jsw theorem 3.3.1)); GrossZagierAndArithmeticHeights GZ.9 / quaternionic-weight-two-formula; GrossZagierAndArithmeticHeights GZ.9 / p-optimal-quotient-formula; §7.3 (modular degrees on x₀(n) and on shimura curves (ribet–takahashi)); §2.5 (the period of e over an imaginary quadratic field and its comparison); §2.9 (tamagawa factors under quadratic base change and twist); §2.7 (odd-primary selmer and sha over a quadratic field); §6.3 (kato's upper bound for the p-part of sha in analytic rank zero); §5.3 (analytic rank one implies rank one and finite sha (gross–zagier–kolyvagin)); §7.9 (isogeny invariance of the rational bsd defect); GrossZagierAndArithmeticHeights GZ.3; GrossZagierAndArithmeticHeights GZ.8 / explicit-gross-zagier-formula.

The intended declarations are:

- `TauCeti.BSD.jsw_lower_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- JSW (7.4.d).

### 10.7 The upper bound for Sha[p^∞] in analytic rank one (JSW §7.4.2)

Under the hypotheses of jsw-lower-bound, ord_p #Ш(E/ℚ)[p^∞] ≤ ord_p (L′(E,1)/(Ω_E Reg_BSD(E/ℚ) ∏_ℓ c_ℓ(E))).

As jsw-lower-bound.

Factor N = N⁺N⁻ (N⁺ = q, N⁻ = N/q if the number of primes of N is odd; N⁺ = 1 otherwise) and choose K″ by §3.6 (b): N⁺ split, N⁻ inert, p split, L(E^{K″},1) ≠ 0. Use the actual odd-prime Shimura-curve Kolyvagin bound of JSW Theorem4.4.1 with its full residual/local hypotheses and defect terms, specified from HE.7/ES.4. The HE.7 dyadic conjugation result and Howard’s more restrictive clean classical bound cannot be substituted without a hypothesis proof. Gross–Zagier for z_{K″} and Ribet–Takahashi as in jsw-lower-bound; no prime w | N⁺ has p | c_w(E/K″). The rank-zero equality for E^{K″} (rank-zero-ordinary-multiplicative-p-part or rank-zero-supersingular-p-part) and the odd decomposition give the bound for E.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §7.4.2, (7.4.e), p. 48.

*Needs:* §3.6 (simultaneous choice of the auxiliary fields of the prime-part arguments); HeegnerPointEulerSystems HE.7 / dyadic-integral-conjugation-descent; HeegnerPointEulerSystems HE.6 / sha-square-index-bound; EulerSystemsAndKolyvaginSystems ES.4 / howard-descent-with-errors; GrossZagierAndArithmeticHeights GZ.8 / explicit-gross-zagier-formula; §7.3 (modular degrees on x₀(n) and on shimura curves (ribet–takahashi)); §10.5 (the p-part of bsd in rank zero at ordinary and multiplicative primes (skinner–urban, skinner)); §10.2 (the p-part of bsd in rank zero at supersingular primes); §2.7 (odd-primary selmer and sha over a quadratic field); §2.9 (tamagawa factors under quadratic base change and twist); §2.5 (the period of e over an imaginary quadratic field and its comparison); GrossZagierAndArithmeticHeights GZ.3; HeegnerPointEulerSystems HE.7.

The intended declarations are:

- `TauCeti.BSD.jsw_upper_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- JSW (7.4.e).

### 10.8 The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′)

Let E/ℚ be elliptic of conductor N with multiplicative reduction at p > 3. Assume E[p] is irreducible, E has nonsplit multiplicative reduction at some prime q ≠ p at which E[p] is ramified, and E(ℚ_p)[p] = 0. If analyticRank E = 1, then padicValRat p (bsdDefect E) = 0: ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_{ℓ|N} c_ℓ(E/ℚ)). E need not be semistable (additive primes other than p allowed); the original wider Theorem A of Castella (2018) is not a target.

Exactly the hypotheses of Theorem A′ of Castella's erratum; the nonsplit condition at q and E(ℚ_p)[p] = 0 are additional to the 2018 statement.

Choose K by §3.6 (c) satisfying the hypotheses of the corrected Theorem 1.1, with L(E^K, 1) ≠ 0. Anticyclotomic main conjecture Ch_Λ(X_ac(E[p^∞]))Λ_{R₀} = (L_p(f)) (§9.7). Specialise at the trivial character with the multiplicative-prime BDP formula L_p(f,1) = (1 − a_p p^{−1})²(log_{ω_E} P_K)² up to units (GZ.9/multiplicative-prime-formula; no exceptional zero) and the anticyclotomic control theorem at a multiplicative prime (Castella §5). Convert the Heegner logarithm/index with the proved Gross–Zagier formula and quadratic comparisons. The chosen q is ramified in K, so E^K is additive there; Skinner C cannot be invoked using q as a multiplicative ramification prime. Supply a separate proved rank-zero input or an alternative inequality, and extend the semistable GZ.9 multiplicative formula/control to the additive-away-from-p range of A′.

The source comparison is [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem A′, p. 1; [Francesc Castella](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Remark after Theorem A′, pp. 1–2.

*Needs:* §9.7 (castella's corrected anticyclotomic main conjecture at a multiplicative prime (erratum theorem 1.1)); §3.6 (simultaneous choice of the auxiliary fields of the prime-part arguments); GrossZagierAndArithmeticHeights GZ.9 / multiplicative-prime-formula; §10.5 (the p-part of bsd in rank zero at ordinary and multiplicative primes (skinner–urban, skinner)); GrossZagierAndArithmeticHeights GZ.8 / explicit-gross-zagier-formula; §2.10 (the bsd quotient over k versus over ℚ at odd primes); §7.10 (the p-part of bsd from an upper and a lower bound); §5.3 (analytic rank one implies rank one and finite sha (gross–zagier–kolyvagin)); §7.9 (isogeny invariance of the rational bsd defect); GrossZagierAndArithmeticHeights GZ.3; GrossZagierAndArithmeticHeights GZ.9.

The intended declarations are:

- `TauCeti.BSD.castella_multiplicative_rank_one_p_part` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Castella's Remark: for split multiplicative p, E(ℚ_p)[p] = 0 is equivalent to p ∤ ord_p(q_E) and log_p(q_E) ∈ pℤ_p^× (Skinner–Zhang's condition (b)).

### 10.9 The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan)

Let E/ℚ be semistable with analyticRank E = 1 and p ≥ 3 a prime of good reduction with E[p] irreducible; if p = 3 and E is supersingular at 3, assume a₃(E) = 0. Then padicValRat p (bsdDefect E) = 0, i.e. ord_p(L′(E,1)/(Reg(E/ℚ)·Ω_E)) = ord_p(#Ш(E/ℚ)·∏_ℓ c_ℓ(E/ℚ)).

Semistability of E is a global hypothesis and is not the same as good reduction at p; both are assumed. p = 3 is included under JSW's extra hypothesis; no upgrade beyond it is claimed.

Reduce to E optimal (§7.9). Combine jsw-lower-bound and jsw-upper-bound with §7.10 (E(ℚ)[p] = 0 as E[p] is irreducible). For the semistable good-supersingular endpoint use bstw-rank-one-p-part directly; that source does not justify the separate jsw-upper-bound auxiliary-twist proof. The ordinary JSW route still needs the explicit exact finite/control/degree inputs.

The source comparison is [JSW (v1)](https://arxiv.org/abs/1512.06894v1), Theorem 1.2.1, p. 2; [JSW (v1)](https://arxiv.org/abs/1512.06894v1), §1.2, p. 2.

*Needs:* §10.6 (the lower bound for sha[p^∞] in analytic rank one (jsw §7.4.1)); §10.7 (the upper bound for sha[p^∞] in analytic rank one (jsw §7.4.2)); §7.10 (the p-part of bsd from an upper and a lower bound); §7.9 (isogeny invariance of the rational bsd defect); §7.8 (the rational bsd defect); §10.4 (bstw supersingular rank-one p-part).

The intended declarations are:

- `TauCeti.BSD.jsw_rank_one_p_part` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- E = 37a1 (prime conductor, no rational isogeny) at every prime p ≥ 3 with p ≥ 5, p ≠ 37: ord_p of the defect is 0.

### Examples

For a semistable rank-one curve at a good p≥5 with E[p] irreducible, the JSW branch gives the prime part under its exact auxiliary-field and integral comparison hypotheses. A good ordinary rank-zero curve still needs the residual ramification prime required by Skinner's branch. The CM fixture of conductor 32 is additive at 2 and fails these semistable/multiplicative dyadic inputs. Source dispatch tests the actual reduction and residual representation rather than inferring a theorem from a prime's size alone.

### Dependencies

Earlier comparisons: §0.6, §1.1, §2.5, §2.7, §2.9, §2.10, §3.6, §5.3, §6.1, §6.3, §6.4, §7.3, §7.8, §7.9, §7.10, §9.1, §9.2, §9.4, §9.5, §9.7. Supplier interfaces: DiophantineApproximationAndTranscendence DT.5; EulerSystemsAndKolyvaginSystems ES.4 / howard-descent-with-errors; GrossZagierAndArithmeticHeights GZ.3; GrossZagierAndArithmeticHeights GZ.8 / explicit-gross-zagier-formula; GrossZagierAndArithmeticHeights GZ.9; GrossZagierAndArithmeticHeights GZ.9 / multiplicative-prime-formula; GrossZagierAndArithmeticHeights GZ.9 / p-optimal-quotient-formula; GrossZagierAndArithmeticHeights GZ.9 / quaternionic-weight-two-formula; HeegnerPointEulerSystems HE.6 / sha-square-index-bound; HeegnerPointEulerSystems HE.7; HeegnerPointEulerSystems HE.7 / dyadic-integral-conjugation-descent; ModularIwasawaMainConjectures L0; ModularIwasawaMainConjectures L1; PadicFamilies L3; PadicHodgeRegulators L3 / rubin-coleman-map; PadicHodgeRegulators L4 / split-multiplicative-augmentation; SelmerIwasawaCohomology L3; SelmerIwasawaCohomology L3 / iwasawa-descent; SelmerIwasawaCohomology L4 / greenberg-main-conjecture; SerreWeightAndLevelOptimisation R20.2; TauCetiRoadmap EllipticCurves Layer 4.

## Layer 11: Independent main conjectures at Eisenstein primes

Build residual character comparisons, integral Heegner bounds and Beilinson–Flach descent. The broader Keller–Yin lattice argument treats characters 1 and ω without identifying its lattice with the distinguished Wüthrich lattice.

### 11.1 Ordinarity and local invariants at a good Eisenstein prime

Good reduction and a G_ℚ-stable line in E[p] imply ordinary reduction at p. Under CGS’s local exclusion both residual characters differ from 1 on G_p, so E(ℚ_p)[p]=0 and hence E(ℚ)[p]=0; for split p, E(K)[p]=0. In the Keller–Yin branch ordinarity still holds but this vanishing is not asserted.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

Use the supersingular inertia description to exclude a residual one-dimensional G_p-subrepresentation; import the local representation classification. Use φψ=ω. If either φ or ψ were trivial locally, φ would be 1 or ω. A local invariant vector would yield a trivial composition factor. Restrict along K_v=ℚ_p to deduce E(K)[p]=0 only in the excluded-character case.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), §1 Introduction and §3.4, before Lemma 3.4.1.

*Needs:* TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 2; SelmerIwasawaCohomology L2.

The intended declarations are:

- `TauCeti.BSD.eisenstein_ordinary_local_exclusion` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A rational p-torsion point has character 1 and fails the CGS exclusion even when reduction is good ordinary.

### 11.2 Ordinary, Greenberg and unramified Eisenstein Selmer comparisons

Specialize the imported Selmer structures to T_pE, its ordinary filtration and the cyclotomic/two-variable/anticyclotomic towers. Keep ordinary, ordinary-relaxed, ordinary-strict, and Greenberg (strict at v, unrestricted at v̄) distinct. For the KY unramified versus Greenberg comparison, restriction has the finite cyclic kernel of Lemma 1.3.6, so characteristic ideals agree after localization at height one; this does not identify integral Fitting ideals or finite control groups.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Instantiate SIC’s kernels and inverse limits with arithmetic Frobenius and the inverse tautological action. Identify the finite restriction kernel from KY Lemma 1.3.6 and take the Pontryagin dual with the involution. Use the source’s exact local conditions, not a name-based identification of different Selmer modules.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), §1.3 Lemmas 1.3.3–1.3.6; §3.0.8; §4.2.

*Needs:* SelmerIwasawaCohomology L2; SelmerIwasawaCohomology L3; SelmerIwasawaCohomology L3 / iwasawa-shapiro; PadicMeasuresIwasawaAlgebras L4.

The intended declarations are:

- `TauCeti.BSD.eisenstein_selmer_normalization` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The strict/unrestricted places must not be interchanged without the induced conjugation/involution.
- A finite Λ-module can have unit characteristic ideal and nonunit Fitting ideal.

### 11.3 Kriz congruence and analytic Iwasawa invariants

For the ordinary weight-two newform f_E with reducible residual representation, compare its p-depleted q-expansion at CM points with the Eisenstein series attached to the residual characters. With the source’s integral periods and Euler factors, its anticyclotomic BDP function has μ=0 and λ(L_E)=λ(L_φ)+λ(L_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). In KY’s local 1/ω case the analytic ordering of characters is relabelled so the first is unramified at p; it need not equal the ordering of the nonsplit lattice.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Label the analytic characters with p∤cond(φ), as required by KY Theorem 2.2.2. This analytic ordering need not equal the chosen residual-lattice ordering.

Apply CGLS Theorem 2.2.1/Kriz’s congruence to the p-depleted forms, including integral CM evaluation and the unit periods; KY Theorem 2.2.1 proves that p-depletion kills the otherwise unmatched constant term. Factor the Eisenstein CM values into the two Katz character functions and the finite S Euler products of KY §2.2/CGLS §2.2, with P_w evaluated at ℓ⁻¹γ_w. This analytic calculation uses the interpolation/Euler-factor dictionary, not the narrower algebraic CGS surjectivity theorem. Use the proposed elliptic-unit/Katz μ theorem under its exact hypotheses, then apply CGLS Theorem 2.2.2 or KY Theorem 2.2.2.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), §2.2 Theorems 2.2.1–2.2.2; compare CGLS §2.2.

*Needs:* AutomorphicCongruences L0; PadicFamilies L0; AutomorphicPadicLFunctions L3; AutomorphicPadicLFunctions L0.

The intended declarations are:

- `TauCeti.BSD.kriz_eisenstein_congruence` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A change of lattice ordering cannot silently change the analytic character convention.

### 11.4 Heegner index and BDP ideal comparison

Under ordinary Heegner conditions, nonzero actual Heegner class and the source H⁰/rank hypotheses, Poitou–Tate and the integral p-adic logarithm reciprocity identify the two directions of the Heegner index-square characteristic divisibility with the corresponding directions for the Greenberg dual and the squared BDP function. KY’s transfer from the geometric lattice to its chosen lattice contributes the fixed p^{t+N} factors of Theorem 3.0.8; they are retained until μ/λ comparison removes them.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use either CGS no-invariants data or the chosen KY residual-invariant-free lattice, and the actual rank-one compact Selmer group.

Use SIC’s strict/relaxed Poitou–Tate sequence and GZ.9’s actual Heegner logarithm formula with its Euler factor and isogeny/differential compatibility. Within a fixed coefficient lattice identify κ∞ and κ₁ as generators of the same Λ-submodule as in CGLS Remark 4.1.3. Separately compare the geometric and chosen KY lattices through their actual maps: the fixed p^{t+N} contribution is not a unit change of generator of an integral Λ-line. Take characteristic ideals in the correct unramified coefficient extension, track involution and the square, and record both implication directions separately.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.8 proof, pp.39–40; CGLS Proposition 4.2.1.

*Needs:* HeegnerPointEulerSystems HE.8 / anticyclotomic-heegner-class; GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; GrossZagierAndArithmeticHeights GZ.9 / isogeny-and-differential-compatibility; SelmerIwasawaCohomology L2; ModularIwasawaMainConjectures L0.

The intended declarations are:

- `TauCeti.BSD.heegner_reciprocity_ideal_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A square-root BDP measure is not substituted for the squared L_E in the Greenberg equality.

### 11.5 Keller–Yin local character cohomology

For KY’s induced discrete character module M_θ over the anticyclotomic Λ=O⟦Γ⟧, the local unramified restriction kernel at a p-place w is O-cofree of rank one when θ|G_w=1. Its dual has Λ-rank zero, rather than being Λ-free of rank one. For θ|G_w=ω the restriction kernel is zero; H¹(K_w,M_θ)^∨ has Λ-rank one, projective dimension at most one, two generators and no nonzero finite Λ-submodule. It is not Λ-free. For the global character Selmer dual X_θ, finite Λ-submodules may occur when θ|G_K=ω; this does not contradict the local assertion. Residual-to-p-torsion comparison uses the source’s actual diagrams.

When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. θ is one of the finite-order residual character lifts used in KY §1.1; the full induced module and inverse tautological action are used.

Apply local inflation–restriction and duality with the decomposed p-place; compute invariants case by case (KY Proposition 1.1.3). Use the finite cyclic restriction kernel calculation and the residual diagrams of §1.2 instead of the earlier no-invariants/free-local-module shortcut. Carry these kernels to the global-to-local comparison and retain the finite-submodule errors.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Proposition 1.1.3; Lemma 1.2.4 and Theorem 1.2.5.

*Needs:* SelmerIwasawaCohomology L2; SelmerIwasawaCohomology L3; ArithmeticGaloisDuality R02.4; PadicMeasuresIwasawaAlgebras L4.

The intended declarations are:

- `TauCeti.BSD.ky_local_character_corrections` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Rank one plus projective dimension at most one is insufficient to replace a two-generator module by Λ.

### 11.6 Keller–Yin trivial-character augmentation correction

For the character Iwasawa modules in KY, μ(X_θ)=0. For θ|G_K≠1, char X_θ=(L_θ); in the trivial character case char X_1=(T·L_1), where T=γ−1. Consequently λ(X_1)=λ(L_1)+1. No p∤h_K, nonanomalous-prime, or p>3 hypothesis is added: the requisite Rubin/de Shalit specialization must provide precisely this version.

When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use the full character modules and period-normalized Katz functions of KY Theorem 1.2.2.

Import Rubin’s elliptic-unit comparison and Hida’s μ theorem from the proposed elliptic-unit owner. Retain the trivial-isotypic global unit/augmentation term in de Shalit III.1.10/Yager’s specialization, rather than applying the nontrivial character formula unchanged. Read μ and λ from the factor T and the nonzero character function.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorem 1.2.2; proof of Theorem 2.2.3 and Remark 2.2.4.

*Needs:* AutomorphicPadicLFunctions L3; ModularIwasawaMainConjectures L0; SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.ky_trivial_character_main_conjecture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The λ correction is one, whereas multiplication by T does not change μ.

### 11.7 Distinguished Wüthrich lattice and integral Kato input adapter

For an elliptic curve E/ℚ and an odd good ordinary Eisenstein p, use Wüthrich’s distinguished E_• in its isogeny class: T_f=T_pE_• and the lattice of all modular symbols agrees with its Néron lattice after tensoring with ℤ_p. The cyclic X₁(N)-optimal quotient isogeny is étale. Kato’s z₀ is integral in H¹_Iw(T_pE_•) even in the nonfree maximal-ideal case, L_p^MSD(E) is integral, and char X_ord(E/ℚ∞) divides (L_p^MSD(E)) as integral ideals. The supplier is the specified Wüthrich addition to Kato L4, with Ferrero–Washington; Kato’s existing rational result is insufficient.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

Import Wüthrich Theorem 4 and Proposition 8 for E_• and the actual lattice, valid at odd primes where reduction at that prime is semistable (not a global semistability hypothesis). Import Theorem 13’s integral z₀ including the rational-torsion/nonfree case, and Theorem 16’s integral divisibility with Lemma 17’s isogeny comparison. Apply Corollary 18 at good ordinary p. Record the split-multiplicative augmentation factor separately; it supplies no bad-prime BSD claim here.

The source comparison is [Christian Wüthrich](https://ems.press/content/serial-article-files/26230?nt=1), Theorems 4,13,16; Proposition 8; Lemma 17; Corollary 18.

*Needs:* KatoEulerSystems L4; IntegralIwasawaTheory L4; TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 6.

The intended declarations are:

- `TauCeti.BSD.distinguished_lattice_integral_input` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The assumptions concern reduction at p. Additive reduction elsewhere does not disqualify the input.
- For split multiplicative p the extra augmentation I is retained, without inferring a BSD formula.

### 11.8 Primitive and imprimitive Euler factors

Let Σ contain the bad primes, v,v̄,∞ and have all finite places split in K. Put S=Σ∖{v,v̄,∞}. For each w∈S define P_w(V,X)=det(1−Frob_w X|V_{I_w}) on inertia coinvariants. For the anticyclotomic branch evaluate it at ℓ⁻¹γ_w, and for CGS’s cyclotomic branch at ℓ⁻¹γ_w⁺, where ℓ is the prime below w and γ is the image of arithmetic Frobenius. The inverse tautological action on the induced coefficient module is separate. Under the stated cotorsion and surjectivity conditions, char X^S=char X·∏_{w∈S}(P_w), and analytic removal multiplies by the same finite factors. Thus μ and λ corrections are those of exactly S before cancellation. This result supplies the locally excluded CGS/CGLS branch.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The actual Selmer dual under comparison is torsion. For CGS’s cyclotomic comparison E(K)[p]=0 and global-to-local surjectivity are verified as in Proposition 3.3.2; the local exclusion above supplies E(K)[p]=0.

Apply SIC’s primitive/imprimitive exact sequence under the verified invariants and surjectivity conditions. Identify the local quotient characteristic polynomial with CGS Proposition 3.3.2 for the cyclotomic branch, and CGLS §1.5/Theorem 1.5.1 for the anticyclotomic branch; add its μ,λ only after proving torsion. Match CGS Definition 2.5.2 and CGLS §1.5, using inertia coinvariants and ℓ⁻¹γ_w; cancel the same nonzero finite Euler product in the domain.

The source comparison is [CGLS (published)](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Published §1.5, pp.537–538; Theorem 1.5.1; [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Definition 2.5.2, p.11; Proposition 3.3.2 and Corollary 3.3.3, pp.14–15.

*Needs:* §11.2 (ordinary, greenberg and unramified eisenstein selmer comparisons); ModularIwasawaMainConjectures L0; AutomorphicPadicLFunctions L0; SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.finite_euler_factor_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- No infinite sum over all w∤p or archimedean Euler factor enters the λ formula.

### 11.9 Uniform near-trivial Kolyvagin bound

Under CGS’s ordinary Heegner setup and E(K)[p]=0, let R be the integers of a finite extension Φ/ℚ_p and α an anticyclotomic character with α≡1 modulo ϖ^m. There are constants M₀,C≥0 depending only on T_pE and rank_ℤp R, independent of m and α in this neighborhood, such that for m≥M₀ and an actual κ∈KS(T_pE⊗R(α),F_ord,L_E) with κ₁≠0: the compact Selmer group has R-rank one, H¹_F(K,A)≅Φ/R⊕M⊕M for a finite M, and length_R M≤length_R(H¹_F(K,T)/Rκ₁)+C.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E(K)[p]=0; the propagated ordinary self-dual local conditions and CGS’s admissible Kolyvagin primes/ideals are used.

Specialize the generic error-tolerant descent of ES.4 to CGS §6.2’s two-copy structure, keeping finite error constants. Use the residual truncated comparison at level m and complex conjugation. CGS §6.3 chooses primes controlling two eigenspaces with the fixed restriction error C₁+C₂. Follow §6.4’s two-step decrease of the largest elementary divisors; this is the new bounded-error argument, not the earlier bound whose error grows with m. Pass to the finite and divisible parts with the same uniform C.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Theorem 6.1.1 and §§6.2–6.4, pp.21–28.

*Needs:* EulerSystemsAndKolyvaginSystems ES.4; EulerSystemsAndKolyvaginSystems ES.8; §11.1 (ordinarity and local invariants at a good eisenstein prime); SelmerIwasawaCohomology L2.

The intended declarations are:

- `TauCeti.BSD.uniform_near_trivial_kolyvagin_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The constants remain fixed as m grows; replacing them with C(α)≥m fails the augmentation argument.

### 11.10 Keller–Yin nonsplit residual lattice

For KY’s ordinary Eisenstein weight-two representation V, choose a stable lattice T with nonsplit residual extension 0→𝔽_p(φ)→T/pT→𝔽_p(ψ)→0 and H⁰(K,T/pT)=0. In the local 1/ω case orient it with φ|G_p=ω and ψ|G_p=1, while φ|G_K may equal ω. The chosen lattice need not be T_p of the original E. For an elliptic curve realize it by an isogenous curve and retain the source’s p-power index between lattices.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use Ribet’s lattice lemma for the irreducible characteristic-zero representation; do not require E[p] irreducible.

Apply KY Proposition 1.3.1 (Ribet lattice) with the ordinary local orientation. Verify that the nonsplit extension has no invariant vector even when its quotient is trivial. Use elliptic Tate-module/isogeny correspondence to relate the chosen lattice to the original curve; preserve the finite p-power quotient and induced Selmer maps.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Proposition 1.3.1; beginning of §1.4; Remark 3.0.9.

*Needs:* TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 2; ArithmeticGaloisRepresentations R01.1; §11.5 (keller–yin local character cohomology).

The intended declarations are:

- `TauCeti.BSD.ky_ribet_lattice` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A curve with rational p-torsion can use the theorem after lattice/isogeny comparison; it cannot be declared residual-invariant-free itself.

### 11.11 Integral Rankin functions and specialization normalization

Compare CGS’s actual two-variable Perrin–Riou Rankin function L_PR and Greenberg function L_Gr to the imported p-adic functions. Normalize L_PR with (deg π/c_π²)H_p(f), H_p(f)=(1−p/α_p²)(1−1/α_p²), and L_Gr with h_K times the anticyclotomic Katz factor. Cyclotomic projection of L_PR has ideal equal to the product of the Néron-period MSD functions of E and E^K; anticyclotomic projection of L_Gr has ideal equal to the squared BDP function. The CM-family congruence ideal and h_K factor must be supplied integrally, with Hida–Tilouine/Rubin input, rather than assumed units.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. α_p is the ordinary unit root; the modular parametrization and Néron differential are fixed.

Import the actual Rankin interpolation from ModularSymbols/AutomorphicPadicLFunctions and the CM Hida family/congruence module from PadicFamilies. Apply CGS Definitions 2.2.2 and 2.4.3 and Lemma 2.4.4, retaining deg π, the Manin constant, h_K and the Katz congruence factor. Verify Propositions 2.2.4 and 2.4.5 with the same integral periods and squared BDP convention.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), §§2.2–2.4, Definitions 2.2.2/2.4.3, Lemma 2.4.4, Propositions 2.2.4/2.4.5.

*Needs:* AutomorphicPadicLFunctions L3; PadicFamilies L0; PadicFamilies L1; AutomorphicCongruences L0; ModularSymbolsPadicLFunctions L2; §11.7 (distinguished wüthrich lattice and integral kato input adapter); GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; ModularSymbolsPadicLFunctions L1.

The intended declarations are:

- `TauCeti.BSD.integral_two_variable_functions` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- No condition p∤h_K is inserted to bypass the integral congruence argument.

### 11.12 CGLS residual extension and algebraic Iwasawa invariants

Under CGS conditions the strict-at-v, unrestricted-at-v̄ anticyclotomic dual X_E is torsion, μ(X_E)=0 and λ(X_E)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). The proof uses the actual residual extension E[p], residual Selmer comparison, and no finite Λ-submodules; it does not replace E[p] by its semisimplification as a representation.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Use the long exact cohomology sequence of 0→𝔽_p(φ)→E[p]→𝔽_p(ψ)→0 and the source local surjectivity/invariant vanishings to obtain the residual Selmer exact sequence (CGLS Proposition 1.4.1). Use the elliptic-unit main-conjecture input for character modules and their μ=0. Identify residual dimension with λ using Proposition 1.4.2 and Corollary 1.4.3, whose no-finite-submodule proof is an input to this identification. Remove imprimitive factors using finite-euler-factor-comparison, retaining only S.

The source comparison is [CGLS (published)](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), §1.4 Propositions 1.4.1–1.4.2, Corollary 1.4.3; Theorem 1.5.1, p.538.

*Needs:* §11.1 (ordinarity and local invariants at a good eisenstein prime); §11.8 (primitive and imprimitive euler factors); SelmerIwasawaCohomology L2; AutomorphicPadicLFunctions L3.

The intended declarations are:

- `TauCeti.BSD.cgls_residual_character_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Splitting the residual representation without checking the connecting map is rejected.

### 11.13 Heegner divisibility including augmentation

For the actual early HE.8 Λ-adic Heegner Kolyvagin system κ^Hg with κ₁≠0, under CGS conditions S_ord(K∞⁻) has Λ-rank one and X_ord(K∞⁻) is pseudo-isomorphic to Λ⊕M⊕M, with M torsion and char_Λ(M) dividing char_Λ(S_ord/Λκ₁) in Λ[1/p]. The height-one prime (γ−1) is included; the prime (p) is still not included by this assertion.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Import the actual Heegner classes, local conditions and nonzero bottom class from early HE.8, not an anticyclotomic equality. Apply the existing weak torsion-localized bound away from augmentation. Apply uniform-near-trivial-kolyvagin-bound along characters approaching 1 to bound the augmentation length and remove its inversion (CGS Theorems 6.5.1–6.5.2).

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Theorems 6.5.1–6.5.2, p.28.

*Needs:* §11.9 (uniform near-trivial kolyvagin bound); HeegnerPointEulerSystems HE.8 / lambda-heegner-derivative-class; HeegnerPointEulerSystems HE.8 / lambda-heegner-local-conditions; HeegnerPointEulerSystems HE.8 / lambda-bottom-class-nontorsion; HeegnerPointEulerSystems HE.8 / weak-torsion-localized-divisibility.

The intended declarations are:

- `TauCeti.BSD.augmentation_inclusive_heegner_divisibility` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- No inference about the p-height-one length is made from a rational divisibility.

### 11.14 Keller–Yin imprimitive residual Selmer comparison

For the chosen invariant-free nonsplit weight-two lattice with residual subcharacter φ|G_p=ω and quotient ψ|G_p=1, let X_f^S, X_φ^S and X_ψ^S be the actual S-imprimitive unramified Selmer duals over Λ=O⟦Γ⟧. Both X_f^S and X_f are torsion with μ=0. If φ|G_K≠ω, λ(X_f^S)=λ(X_φ^S)+λ(X_ψ^S). If φ|G_K=ω (hence ψ|G_K=1), λ(X_f^S)+1=λ(X_φ^S)+λ(X_ψ^S). This is an imprimitive comparison; removing S is a separate theorem.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The lattice is the actual nonsplit lattice of ky-ribet-lattice, with H⁰(K,M_f)=0. Σ contains v,v̄,∞ and every ramified place; its finite places split in K, and S=Σ∖{v,v̄,∞}. Character Selmer groups use KY’s same unramified normalization.

Use the residual sequence 0→M_φ[p]→M_f[p]→M_ψ[p]→0 and the Greenberg/unramified restriction diagrams of KY §1.4. Character residual Selmer finiteness, together with the finite restriction kernel, implies X_f^S and X_f are Λ-torsion with μ=0. Apply the five-term Perrin–Riou comparison with the actual finite kernels and coinvariants, as in Theorem 1.4.1 and its Lemmas 1.4.3–1.4.4. Distinguish globally trivial ψ: the one-dimensional correction remains even though finite modules have unit characteristic ideal.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), §1.4, Theorem 1.4.1 and its proof, pp.23–31; Lemmas 1.4.3–1.4.4.

*Needs:* §11.10 (keller–yin nonsplit residual lattice); §11.5 (keller–yin local character cohomology); §11.6 (keller–yin trivial-character augmentation correction); §11.2 (ordinary, greenberg and unramified eisenstein selmer comparisons); SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.ky_imprimitive_residual_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The globally trivial quotient contributes +1 on the left; no λ=dim(X/p) shortcut suppresses finite-submodule terms.

### 11.15 Beilinson–Flach class and two integral reciprocity laws

Construct the actual CGS class BF_α in H¹_ord,rel(K,T_f(α) completed-tensor Λ_K) from the KLZ Beilinson–Flach classes specialized to the CM family, as in CGS Theorem 4.1.1 (BSTW §5). On T_f=T_pE_•, rescale the two Coleman maps as in Corollary 4.1.3 to injective Λ_K-linear maps with pseudo-null cokernel whose images of p⁻loc_v̄ BF_α and loc_v BF_α are respectively L_PR(E_•(α)/K) and L_Gr(f(α)/K). Neither BF nor a map is defined by assigning those predicted images.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use CGS’s CM Hida family, crystalline twists α, distinguished lattice and specified ordinary local conditions; retain all interpolation/coefficient choices.

Construct and specialize the motivic KLZ classes through the imported cohomology and family APIs; verify the norm and local conditions of the actual classes. This source-specific construction is owned here, with a explicit implementation gap for the missing class interfaces. Apply CGS Theorem 4.1.1 for both explicit reciprocity laws on I_f and I_g^cusp, including injectivity and pseudo-null cokernel. Use deg(π_•)I_f=ℤ_p (Lemma 4.1.2), the ordinary integral de Rham comparison and the exact CM congruence ideal to rescale both maps (Corollary 4.1.3).

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Theorem 4.1.1, Lemma 4.1.2, Corollary 4.1.3, pp.17–18.

*Needs:* §11.7 (distinguished wüthrich lattice and integral kato input adapter); §11.11 (integral rankin functions and specialization normalization); EulerSystemsAndKolyvaginSystems ES.2; PadicHodgeRegulators L3; PadicFamilies L1; ArithmeticGaloisDuality R02.1; SelmerIwasawaCohomology L3.

The intended declarations are:

- `EisensteinBF.class` — The actual specialized motivic Beilinson–Flach cohomology class, not a chosen inverse image of an L-function.
- `EisensteinBF.ordinary_local` — The class lies in the ordinary-relaxed Selmer group with the source strict/relaxed places.
- `EisensteinBF.coleman_PR` — The rescaled Coleman map on p⁻loc_v̄ sends the actual class to the integrally normalized L_PR.
- `EisensteinBF.coleman_Gr` — The rescaled Coleman map on loc_v sends the same actual class to L_Gr with its Katz congruence factor.
- `EisensteinBF.twist_congruence` — After the specified twist automorphism, congruent characters produce congruent images modulo the same coefficient power.

**Checks.**

- Cyclotomic projection of the PR image agrees with the product of MSD functions of E_• and E_•^K in their Néron periods.
- Anticyclotomic projection of the Gr image agrees with the squared BDP normalization, including the nonunit Katz/congruence factor.
- If an injective Coleman projection has nonzero reciprocal L-image then the actual localized class is nonzero; the zero class cannot pass.
- Changing the distinguished quotient differential rescales class/map and period modules by the computed factors, preserving both laws together.
- Both reciprocity images are checked on the same actual class and lattice, before any characteristic equality.

### 11.16 Congruent twists and integral characteristic series

For α≡1 modulo ϖ^m, the finite-S imprimitive L-functions of E and E(α) are congruent after the twist automorphism γ↦α(γ)γ. Under the source torsion and no-finite-submodule hypotheses, their ordinary Selmer characteristic generators are congruent modulo the same ϖ^m up to units. The proof identifies Fitting with characteristic ideals only after the finite-submodule condition, and compares actual residual Selmer modules.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The primitive ordinary Selmer dual is torsion and E(K)[p]=0 for Proposition 3.4.4; use the finite imprimitive S of the relevant tower.

Use CGS Lemma 2.5.1 for the analytic congruence. Use residual coefficient/cohomology comparison and the imprimitive global-to-local surjectivity to compare Selmer modules modulo ϖ^m. Apply Proposition 3.4.3’s no-finite-submodule assertion and Proposition 3.4.4’s Fitting comparison; retain the unit choice of generators.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Lemma 2.5.1; Propositions 3.4.3–3.4.4.

*Needs:* §11.8 (primitive and imprimitive euler factors); §11.2 (ordinary, greenberg and unramified eisenstein selmer comparisons); SelmerIwasawaCohomology L3; ModularIwasawaMainConjectures L0; PadicMeasuresIwasawaAlgebras L4.

The intended declarations are:

- `TauCeti.BSD.congruent_characteristic_series` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A finite Λ-submodule cannot be discarded while taking Fitting ideals.

### 11.17 Keller–Yin uniform near-trivial bound

For KY’s chosen stable self-dual weight-two lattice T with H⁰(K,T/pT)=0 and the actual ordinary conditions, let α≡1 mod ϖ^m. Constants M₀,C depend only on the representation/lattice and rank of the coefficient extension, not on m or α in this neighborhood. If m≥M₀ and κ₁ is nontorsion, the compact Selmer group has rank one, the discrete group is Φ/R⊕M_α⊕M_α, and length_R M_α≤length_R(S/Rκ₁)+C. This generalization requires the chosen nonsplit lattice but not CGS’s local exclusions on its characters.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The invariant-free lattice and propagated ordinary local/dual conditions are verified; an actual Kolyvagin system with nontorsion κ₁ is supplied.

Use ky-ribet-lattice for the cohomological H⁰ hypothesis. Use KY Lemma 3.0.3’s scalar-image argument (Bogomolov/Ribet) to bound the source C₁ on the representation; retain this supplier requirement explicitly. Adapt the two-copy bounded-error descent of CGS §§6.2–6.4 to the KY lattice as Theorem 3.0.2 specifies; the error remains independent of m.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorems 3.0.1–3.0.2, Lemma 3.0.3 and Remark 3.0.4, pp.35–36.

*Needs:* §11.10 (keller–yin nonsplit residual lattice); ArithmeticGaloisRepresentations R01.1; EulerSystemsAndKolyvaginSystems ES.4; EulerSystemsAndKolyvaginSystems ES.8; SelmerIwasawaCohomology L2.

The intended declarations are:

- `TauCeti.BSD.ky_uniform_near_trivial_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The lattice can be invariant-free when the original curve has rational p-torsion.

### 11.18 CGLS equality of anticyclotomic Iwasawa invariants

Under CGS conditions μ(X_E)=μ(L_E)=0 and λ(X_E)=λ(L_E), with the same primitive anticyclotomic Greenberg module and squared BDP normalization. This is an independent residual/congruence computation; it gives equality of characteristic ideals only when combined with a proved one-sided divisibility.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Use cgls-residual-character-comparison and kriz-eisenstein-congruence. Import equality of the character-module and Katz-function characteristic ideals from the elliptic-unit supplier, including its exceptional character conventions. Cancel precisely the matching finite Euler correction terms.

The source comparison is [CGLS (published)](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 2.2.3, p.545.

*Needs:* §11.12 (cgls residual extension and algebraic iwasawa invariants); §11.3 (kriz congruence and analytic iwasawa invariants).

The intended declarations are:

- `TauCeti.BSD.cgls_equal_iwasawa_invariants` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Equal μ and λ alone do not imply equal distinguished polynomials.

### 11.19 Keller–Yin finite Euler comparison

On KY’s chosen invariant-free lattice, and on its two character modules, the primitive and S-imprimitive unramified Selmer duals fit into 0→⊕_{w∈S}H¹(K_w,M_?)^∨→X_?^S→X_?→0. For ?=f,φ,ψ, define P_w(?)=det(1−Frob_w X|V_{?,I_w}) evaluated at X=ℓ⁻¹γ_w, where ℓ is the rational prime below w and γ_w is arithmetic Frobenius in Γ. Thus char(X_?^S)=char(X_?)·∏_{w∈S}(P_w(?)) and λ(X_?^S)=λ(X_?)+Σ_{w∈S}λ(P_w(?)). Inertia coinvariants and this Frobenius evaluation are fixed; the inverse tautological action on the induced coefficient module is a separate convention.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use the chosen invariant-free lattice with φ|G_p=ω and ψ|G_p=1. Σ and finite S are as in ky-imprimitive-residual-comparison. Every module uses KY’s unramified local condition, and each global-to-local map is proved surjective; cotorsion is supplied by the imprimitive residual and character theorems.

For characters use KY Theorem 1.2.2 and Remark 1.2.3(ii) to prove surjectivity, retaining the corrected anticyclotomic/cyclotomic disjointness argument. For f use Remark 1.4.2: cotorsion from Theorem 1.4.1, Cartier-dual finite invariants, and the local coranks of Lemmas 1.3.5–1.3.6. Dualize the primitive/imprimitive exact sequence. Compute local characteristic ideals using KY Lemma 1.1.1 and §1.5; KY Theorem 1.5.1 explicitly invokes the CGLS Theorem 1.5.1 proof after supplying these broader surjectivity hypotheses. Multiply only the finite S factors and then take μ,λ.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Lemma 1.1.1; Remark 1.2.3(ii), pp.14–15; Remark 1.4.2, p.25; §1.5 and Theorem 1.5.1, p.31.

*Needs:* §11.14 (keller–yin imprimitive residual selmer comparison); §11.6 (keller–yin trivial-character augmentation correction); §11.2 (ordinary, greenberg and unramified eisenstein selmer comparisons); ArithmeticGaloisRepresentations R01.1; SelmerIwasawaCohomology L3; AutomorphicPadicLFunctions L0.

The intended declarations are:

- `TauCeti.BSD.ky_finite_euler_factor_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Neither E(K)[p]=0 on the original geometric Tate module nor the CGS local character exclusion is inserted into this broader chosen-lattice branch.
- Do not infer finite-level control from height-one Euler-factor equality.

### 11.20 Keller–Yin integral Kolyvagin divisibility and lattice transfer

On KY’s residual-invariant-free lattice, for a nonzero actual Heegner Kolyvagin system the ordinary compact and dual Selmer groups have Λ-rank one, X is pseudo-isomorphic to Λ⊕M⊕M and char(M) divides char(S/Λκ₁) at every height-one prime, including (ϖ). The canonical geometric system transfers as κ_n^Hg=p^t κ_n, and comparison with its limiting class retains the fixed additional p^N. These exponents are independent of the approaching character but cannot be set to zero without proof.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The chosen lattice has H⁰(K,T/pT)=0 and the actual transferred Heegner system has nonzero initial class.

Apply the nontrivial-character bound KY Theorem 3.0.1 and uniform near-trivial bound Theorem 3.0.2; Lemma 3.0.3 bounds the scalar-image constant. Use KY Theorem 3.0.5 to include the coefficient height-one prime via specialization over ramified extensions; keep the dual two-copy structure. Apply Theorem 3.0.6 to the actual geometric lattice, keeping t+N in the resulting characteristic divisibility.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorems 3.0.1–3.0.2, Lemma 3.0.3, Theorems 3.0.5–3.0.6.

*Needs:* §11.10 (keller–yin nonsplit residual lattice); §11.17 (keller–yin uniform near-trivial bound); EulerSystemsAndKolyvaginSystems ES.4; EulerSystemsAndKolyvaginSystems ES.8; HeegnerPointEulerSystems HE.8 / lambda-heegner-derivative-class; TauCetiRoadmap EllipticCurves Layer 1.

The intended declarations are:

- `TauCeti.BSD.ky_integral_kolyvagin_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The older HE weak divisibility after inverting p is not a substitute for this integral assertion.

### 11.21 Nontrivial-twist rational Beilinson–Flach bound

For CGS’s nontrivial crystalline anticyclotomic α with BF_α≠0 and its verified Euler-system representation hypotheses, S_ord,rel has Λ-rank one, X_ord,str is torsion and its characteristic ideal contains the BF-index characteristic ideal over Λ_K[1/p]. The source checks irreducibility of V_pE⊗Ind_K^ℚ α in characteristic zero and a rank-one σ-coinvariant condition; it does not assume residual irreducibility of E[p].

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. α is nontrivial and crystalline as in §4.3, BF_α≠0; the auxiliary σ and Euler-system hypotheses of Theorem 4.3.1 are verified.

Use the actual BF Euler system and its projection to the initial class. Verify the representation hypotheses by CGS’s non-CM/Serre argument and the explicit σ, not the clean irreducible residual MR theorem. Apply the imported error-tolerant Euler-system bound to obtain the containment only after inverting p.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Theorem 4.3.1 and its proof, pp.19–20.

*Needs:* §11.15 (beilinson–flach class and two integral reciprocity laws); EulerSystemsAndKolyvaginSystems ES.4; EulerSystemsAndKolyvaginSystems ES.8; ArithmeticGaloisRepresentations R01.1.

The intended declarations are:

- `TauCeti.BSD.nontrivial_twist_rational_bf_bound` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The coefficient-prime length is still unresolved by this result.

### 11.22 EisensteinBF.coleman_PR

The normalized injective Coleman map with pseudo-null cokernel sends p⁻loc_v̄ BF_α to L_PR(E_•(α)/K), with exactly the distinguished lattice and integral degree/CM congruence-ideal normalizations of Corollary 4.1.3.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The actual class, map, periods and coefficient-extension choices of beilinson-flach-integral-reciprocity.

Apply CGS Theorem 4.1.1 to the actual KLZ specialization. Use Lemma 4.1.2 and integral-two-variable-functions to rescale the map, retaining the source factors as in Corollary 4.1.3.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Corollary 4.1.3, p.18.

*Needs:* §11.15 (beilinson–flach class and two integral reciprocity laws); §11.11 (integral rankin functions and specialization normalization).

The intended declarations are:

- `TauCeti.BSD.bf_pr_reciprocity` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The image equality uses the actual same class as the other reciprocity law.

### 11.23 EisensteinBF.coleman_Gr

The normalized injective Coleman map with pseudo-null cokernel sends loc_v BF_α to L_Gr(f(α)/K), with exactly the distinguished lattice and integral degree/CM congruence-ideal normalizations of Corollary 4.1.3.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The actual class, map, periods and coefficient-extension choices of beilinson-flach-integral-reciprocity.

Apply CGS Theorem 4.1.1 to the actual KLZ specialization. Use Lemma 4.1.2 and integral-two-variable-functions to rescale the map, retaining the source factors as in Corollary 4.1.3.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Corollary 4.1.3, p.18.

*Needs:* §11.15 (beilinson–flach class and two integral reciprocity laws); §11.11 (integral rankin functions and specialization normalization).

The intended declarations are:

- `TauCeti.BSD.bf_greenberg_reciprocity` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The image equality uses the actual same class as the other reciprocity law.

### 11.24 CGS anticyclotomic Greenberg main conjecture

Under CGS conditions X_Gr(E/K∞⁻) is Λ-torsion and char_Λ X_Gr extended to Λ^ur equals the principal ideal of L_p^BDP(f_E/K) in the source’s squared normalization. The conclusion has no (Sel) corank-one assumption and is integral, including augmentation and the p-height-one prime.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Translate augmentation-inclusive-heegner-divisibility to a one-sided Greenberg/BDP divisibility via heegner-reciprocity-ideal-comparison. Use cgls-equal-iwasawa-invariants: μ=0 removes the remaining p-power ambiguity, and equality of λ makes the integral quotient a unit. Conclude both ideal containments; this removes the earlier CGLS (Sel) restriction by the uniform bound.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Theorem 6.5.3, p.29; compare CGLS Theorem 4.2.2.

*Needs:* §11.13 (heegner divisibility including augmentation); §11.4 (heegner index and bdp ideal comparison); §11.18 (cgls equality of anticyclotomic iwasawa invariants).

The intended declarations are:

- `TauCeti.BSD.cgs_anticyclotomic_main_conjecture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The CGLS prototype alone cannot supply this unconditional-in-(Sel) equality.

### 11.25 Keller–Yin residual extension and corrected lambda formula

For KY’s chosen nonsplit lattice with φ|G_p=ω, the primitive X_f is torsion with μ=0. If φ|G_K≠ω, λ(X_f)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(f))). If φ|G_K=ω (so ψ|G_K=1), the left side is λ(X_f)+1. The same +1 occurs in the imprimitive relation λ(X_f^S)+1=λ(X_φ^S)+λ(X_ψ^S). S is finite and excludes v,v̄,∞.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The chosen lattice is as in ky-ribet-lattice; the generic non-1/ω case is supplied by the CGLS comparison.

Import the separate KY imprimitive residual comparison, including cotorsion, μ=0 and its globally trivial +1. Apply the KY finite Euler comparison to f,φ,ψ under its chosen-lattice surjectivity hypotheses. Subtract the same finite S Euler λ terms. Keep the +1 when φ|G_K=ω; it is cancelled only after importing the corresponding character main-conjecture correction in the subsequent algebraic/analytic comparison.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorems 1.4.1 and 1.5.1; Appendix A finite terms.

*Needs:* §11.14 (keller–yin imprimitive residual selmer comparison); §11.19 (keller–yin finite euler comparison).

The intended declarations are:

- `TauCeti.BSD.ky_residual_extension_lambda` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- When ψ is globally trivial the uncorrected sum of λ invariants is off by one.

### 11.26 Beilinson–Flach divisibility comparison

Under CGS Proposition 4.2.1’s H⁰, torsion and nonzero L-function conditions, the BF-index containment for the ordinary-relaxed compact Selmer group and ordinary-strict dual is equivalent direction by direction to the Greenberg/L_Gr containment and to the ordinary/L_PR containment. All characteristic ideals use the same Λ_K, inverse action and primitive/imprimitive convention. A rational BF bound remains rational until its p-power is removed.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E_•(K)[p]=0, the relevant projected L_PR and L_Gr are nonzero, and the torsion/rank hypotheses in CGS Proposition 4.2.1 hold.

Apply the two strict/relaxed Poitou–Tate exact sequences to the actual BF class. Use injectivity and pseudo-null cokernels of both normalized Coleman maps from beilinson-flach-integral-reciprocity. Take height-one characteristic lengths in each exact sequence, record both containment directions, and keep any inversion of p in the coefficient ring.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Proposition 4.2.1, pp.18–19.

*Needs:* §11.22 (eisensteinbf.coleman_pr); §11.23 (eisensteinbf.coleman_gr); SelmerIwasawaCohomology L2; ModularIwasawaMainConjectures L0.

The intended declarations are:

- `TauCeti.BSD.bf_poitou_tate_divisibility_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- An equality for one projected Selmer group cannot be imported from downstream MIMC L6.

### 11.27 CGLS anticyclotomic prototype

Under the CGS local exclusion and Heegner/split/discriminant conditions, and additionally corank_ℤp Sel_{p∞}(E/K)=1, the CGLS primitive Greenberg dual is Λ-torsion with char(X_E)Λ^ur=(L_E), where L_E is squared BDP. Its Heegner index-square consequence is initially stated in Λ^ac=Λ[1/p] in the published Corollary 4.2.3. This prototype retains (Sel); the stronger CGS equality above removes it by a new proof.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The additional (Sel) condition of CGLS: corank_ℤp Sel_{p∞}(E/K)=1.

Use the early Heegner weak divisibility and its source corank-one augmentation upgrade. Translate to Greenberg/BDP using heegner-reciprocity-ideal-comparison. Use cgls-equal-iwasawa-invariants to obtain the integral Greenberg equality, and record the published rational index-square consequence without silently upgrading its coefficient ring.

The source comparison is [CGLS (published)](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 4.2.2 and Corollary 4.2.3, pp.569–570.

*Needs:* HeegnerPointEulerSystems HE.8 / weak-torsion-localized-divisibility; §11.4 (heegner index and bdp ideal comparison); §11.18 (cgls equality of anticyclotomic iwasawa invariants).

The intended declarations are:

- `TauCeti.BSD.cgls_prototype_main_conjecture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- An analytic rank-two E cannot be fed to this source by omitting (Sel).

### 11.28 CGS Heegner index-square equality

Under CGS conditions the compact and dual ordinary anticyclotomic Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 integrally. The class is the actual geometric early HE.8 class, with its source lattice; κ∞ is not defined by this equality.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Apply cgs-anticyclotomic-main-conjecture and both directions of heegner-reciprocity-ideal-comparison. Use μ=0 to remove the p-power ambiguity from the older index-square corollary.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Corollary 6.5.4, p.29.

*Needs:* §11.24 (cgs anticyclotomic greenberg main conjecture); §11.4 (heegner index and bdp ideal comparison).

The intended declarations are:

- `TauCeti.BSD.cgs_heegner_index_square_equality` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Its exact characteristic equality includes the p-height-one prime.

### 11.29 Keller–Yin equality of analytic and algebraic invariants

For every good ordinary weight-two Eisenstein form in KY’s setting, μ(X_f)=μ(L_f)=0 and λ(X_f)=λ(L_f). In the globally trivial-character case the algebraic +1 in ky-residual-extension-lambda cancels the character main conjecture’s λ(X_1)=λ(L_1)+1. The result is not obtained by imposing the CGS local exclusion.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Split the local cases. When both characters at G_p differ from 1 and ω, import cgls-equal-iwasawa-invariants. In the local 1/ω case use ky-residual-extension-lambda on the chosen lattice and kriz-eisenstein-congruence with its analytic relabelling. Use ky-trivial-character-main-conjecture for the globally trivial constituent and the nontrivial character formulas for the others. Cancel the same finite S factors and the explicit augmentation correction.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorem 2.2.3 and Remark 2.2.4.

*Needs:* §11.25 (keller–yin residual extension and corrected lambda formula); §11.6 (keller–yin trivial-character augmentation correction); §11.3 (kriz congruence and analytic iwasawa invariants); §11.18 (cgls equality of anticyclotomic iwasawa invariants).

The intended declarations are:

- `TauCeti.BSD.ky_equal_iwasawa_invariants` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The correction survives even though finite global torsion does not change a characteristic ideal.

### 11.30 Twisted control and augmentation comparison

For a sufficiently near-trivial crystalline α with nonzero BDP specialization, under CGS Proposition 3.4.2’s conditions, the cyclotomic and anticyclotomic Greenberg characteristic generators specialize at augmentation with equal p-valuations. Their common expression retains the finite twisted Greenberg Selmer cardinality, #H⁰(K_v,W_{α⁻¹})² and every p-primary local Tamagawa term. Nonzero BDP specialization supplies BK corank one and nonzero ordinary localization; these are proved before applying control.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E(K)[p]=0, the twisted BK Selmer group has corank one and the ordinary localization is nonzero as required by Lemma 3.4.1.

Choose α away from the finitely many zeros of the nonzero BDP function. Use actual Heegner reciprocity and the Kolyvagin bound to prove Lemma 3.4.1’s rank/local nonvanishing hypotheses. Apply Proposition 3.4.2 to both towers and compare their finite terms; this is equality up to p-adic unit, not equality of arbitrary chosen generators.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Lemma 3.4.1; Proposition 3.4.2; §7.2 Step 2.

*Needs:* §11.9 (uniform near-trivial kolyvagin bound); HeegnerPointEulerSystems HE.8 / anticyclotomic-heegner-class; GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; SelmerIwasawaCohomology L3; §11.24 (cgs anticyclotomic greenberg main conjecture); SelmerIwasawaCohomology L4.

The intended declarations are:

- `TauCeti.BSD.twisted_control_augmentation_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- No local H⁰ factor is dropped merely because E(K)[p]=0.

### 11.31 Keller–Yin anticyclotomic Greenberg main conjecture

For KY’s weight-two good Eisenstein setup, the unramified Selmer dual X_f (and height-one-equivalent Greenberg dual) is Λ-torsion and char_Λ(X_f)Λ^nr=(L_f). First prove this on the chosen invariant-free lattice, then transfer to the original elliptic curve as in Remark 3.0.9. Local rational p-torsion is allowed. The equality is integral, and no unproved general finite-submodule vanishing is asserted.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Translate ky-integral-kolyvagin-bound through heegner-reciprocity-ideal-comparison, yielding the source’s divisibility with p^{t+N}. Use independently proved μ=0 and λ equality from ky-equal-iwasawa-invariants; the fixed p-power changes μ but not the distinguished factor, so the actual characteristic ideals coincide. Use the lattice/isogeny characteristic comparison and the finite Greenberg/unramified restriction difference to return to the original curve.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.8 (IMC2) and Remark 3.0.9, pp.39–40.

*Needs:* §11.20 (keller–yin integral kolyvagin divisibility and lattice transfer); §11.4 (heegner index and bdp ideal comparison); §11.29 (keller–yin equality of analytic and algebraic invariants); §11.2 (ordinary, greenberg and unramified eisenstein selmer comparisons).

The intended declarations are:

- `TauCeti.BSD.ky_anticyclotomic_greenberg_equality` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A rational p-torsion original curve is accepted only with the proved transfer maps.

### 11.32 Integral twisted cyclotomic equality

For the near-trivial nontrivial crystalline twists used by CGS §7.2, char X_ord(E_•(α)/K∞⁺)=(L_PR(E_•(α)/K)^+) integrally. First the BF bound is rational. Wüthrich’s untwisted integral containment and congruence give the μ inequality that removes its p-power denominator. The anticyclotomic equality and twisted control then show the remaining quotient has a nonzero unit augmentation, hence is a unit. Cyclotomic μ is allowed to be positive.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Use nontrivial-twist-rational-bf-bound and bf-poitou-tate-divisibility-comparison to obtain the rational ordinary/Greenberg containments. Use distinguished-lattice-integral-input plus congruent-characteristic-series for m large to compare μ and make the containment integral (CGS Lemma 7.2.2). Compare the nonzero augmentation values with twisted-control-augmentation-comparison and the anticyclotomic main conjecture. A quotient of integral power series with unit augmentation is a unit (SU Lemma 3.2). Translate the resulting Greenberg equality back to ordinary/L_PR using the two-way BF comparison.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), §7.2 Lemmas 7.2.1–7.2.2 and (7.10)–(7.11).

*Needs:* §11.21 (nontrivial-twist rational beilinson–flach bound); §11.26 (beilinson–flach divisibility comparison); §11.7 (distinguished wüthrich lattice and integral kato input adapter); §11.16 (congruent twists and integral characteristic series); §11.30 (twisted control and augmentation comparison); ModularIwasawaMainConjectures L0; PadicMeasuresIwasawaAlgebras L4.

The intended declarations are:

- `TauCeti.BSD.integral_twisted_cyclotomic_equality` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A rational containment plus specialization at a zero augmentation does not establish equality.

### 11.33 Keller–Yin Heegner index-square equality

In the same KY setup the compact and dual ordinary Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 in the coefficient ring labelled Λ^ac in §3.0.8, with κ∞ the transferred actual Heegner class. Theorem B in the Introduction instead states Λ; record this internal ring discrepancy and require an integral two-way class/lattice comparison before exporting the stronger integral statement. The weaker rationalized index-square equality is retained; the integral Greenberg IMC2 is a separate output.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Use ky-anticyclotomic-greenberg-equality and the reverse implication of heegner-reciprocity-ideal-comparison. Return through the explicit lattice maps in the coefficient ring of the proved two-way comparison. Resolve the Theorem B/§3.0.8 ring discrepancy through the stated integral comparison gap.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Introduction Theorem B, p.5; Theorem 3.0.8 (IMC1), p.40.

*Needs:* §11.31 (keller–yin anticyclotomic greenberg main conjecture); §11.4 (heegner index and bdp ideal comparison).

The intended declarations are:

- `TauCeti.BSD.ky_heegner_index_square_equality` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The characteristic equality refers to the actual κ∞ line and retains the coefficient ring of the verified comparison.

### 11.34 CGS integral cyclotomic main conjecture

Under CGS’s good Eisenstein local exclusion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char_Λℚ X_ord(E/ℚ∞)=(L_p^MSD(E/ℚ)) integrally with Néron real periods. No μ=0 hypothesis or conclusion is imposed on the cyclotomic functions.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Use congruent-characteristic-series and integral-twisted-cyclotomic-equality for arbitrarily close twists to equate μ and λ of the untwisted imprimitive ordinary characteristic and L_PR generators; combine with Wüthrich’s integral containment to get equality over K∞⁺ (Theorem 7.2.3). Apply odd-p quadratic Shapiro splitting of the ordinary Selmer dual and the exact Néron-period product specialization of integral-two-variable-functions. Use Wüthrich’s individual integral containments for E and E^K. Equality of their product forces both quotients to be units. Return from E_• using the proved isogeny comparison.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Theorems 7.2.3 and 7.1.1, pp.30–31.

*Needs:* §11.32 (integral twisted cyclotomic equality); §11.16 (congruent twists and integral characteristic series); §11.11 (integral rankin functions and specialization normalization); §11.7 (distinguished wüthrich lattice and integral kato input adapter); §2.7 (odd-primary selmer and sha over a quadratic field); SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.cgs_cyclotomic_main_conjecture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The result is an output to MIMC L6; that stage’s reexport cannot be its input.

### 11.35 Keller–Yin cyclotomic input transfer

On the actual invariant-free KY lattice, establish the cohomological, finite-submodule, twisted congruence and Coleman/Poitou–Tate inputs needed for the three-step CGS cyclotomic argument, now permitting local characters 1/ω. Use KY’s anticyclotomic equality in the specialization step and Wüthrich’s distinguished integral lattice in the individual containment step. Track the maps between these two lattices rather than identifying them. The original curve’s integral Néron-period ordinary characteristic comparison is part of this transfer, not a consequence of rational isogeny comparison alone.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Chosen KY lattice and actual comparison maps to the distinguished E_• lattice; every rank, H⁰, surjectivity and no-finite-submodule condition used in the CGS argument must be verified on the lattice where it is applied.

KY Theorem 3.0.10 cites substitution of its 3.0.8/3.0.9 into CGS. Verify the §3.4 control and finite-submodule conditions through the exceptional local character diagrams of KY §§1.1–1.4. Construct the actual transferred BF specialization and compare both Coleman images, twist congruences and integral characteristic/Fitting generators; preserve every p-power index. Use the independent KY anticyclotomic equality, the integral Wüthrich individual bound and nonzero augmentation control to repeat CGS’s rational-bound/integral-repair/unit-quotient argument. The remaining source-to-interface verification remains a proof obligation.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.10 proof, p.41; §1.4 lattice independence; Remark 3.0.9.

*Needs:* §11.10 (keller–yin nonsplit residual lattice); §11.5 (keller–yin local character cohomology); §11.31 (keller–yin anticyclotomic greenberg main conjecture); §11.7 (distinguished wüthrich lattice and integral kato input adapter); §11.15 (beilinson–flach class and two integral reciprocity laws); SelmerIwasawaCohomology L2; SelmerIwasawaCohomology L3; PadicHodgeRegulators L3; ModularIwasawaMainConjectures L0.

The intended declarations are:

- `TauCeti.BSD.ky_cyclotomic_proof_inputs` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A CGS lemma requiring φ|G_p≠1,ω cannot be applied to the KY branch merely by changing its name.

### 11.36 Keller–Yin integral cyclotomic main conjecture

For every odd good Eisenstein p of an elliptic curve E/ℚ, including local or global rational p-torsion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char X_ord=(L_p^MSD(E/ℚ)) with its integral Néron-period normalization. This is KY Theorem 3.0.10 in weight two.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

Repeat the CGS three-step cyclotomic argument using ky-anticyclotomic-greenberg-equality in place of the locally excluded CGS equality. Work on the chosen residual-invariant-free isogenous lattice where the congruence and finite-submodule hypotheses hold; use ky-ribet-lattice and Wüthrich’s distinguished integral comparison to return to the original curve. Keep the original curve’s periods, torsion, p-power isogeny factors and finite control terms; a rational lattice comparison alone does not preserve the integral endpoint.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.10, p.41.

*Needs:* §11.31 (keller–yin anticyclotomic greenberg main conjecture); §11.35 (keller–yin cyclotomic input transfer); §11.10 (keller–yin nonsplit residual lattice); §11.7 (distinguished wüthrich lattice and integral kato input adapter); §11.11 (integral rankin functions and specialization normalization); SelmerIwasawaCohomology L3.

The intended declarations are:

- `TauCeti.BSD.ky_cyclotomic_main_conjecture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The original E may have rational p-torsion; the intermediate chosen lattice need not.

### Examples

The trivial isogeny-kernel character of 11a3 at p=5 fails CGS's local exclusion. Keller–Yin passes through a different stable nonsplit lattice with no residual invariants; this does not prove that the original rational torsion disappears. In its trivial-character comparison, the characteristic ideal carries an augmentation factor T and λ increases by one. The matching algebraic correction cancels that analytic increment. Dropping the factor would spoil the integral equality.

An error bound ℓ_R M_α≤ℓ_R(S/Rκ₁)+C is usable as α approaches one only when C is independent of the congruence exponent. A constant that grows with that exponent cannot control augmentation. A characteristic-ideal equality that ignores a finite Λ-submodule also cannot be used as an equality of finite Fitting or specialized cardinality terms.

### Dependencies

Earlier comparisons: §2.7. Supplier interfaces: ArithmeticGaloisDuality R02.1; ArithmeticGaloisDuality R02.4; ArithmeticGaloisRepresentations R01.1; AutomorphicCongruences L0; AutomorphicPadicLFunctions L0; AutomorphicPadicLFunctions L3; EulerSystemsAndKolyvaginSystems ES.2; EulerSystemsAndKolyvaginSystems ES.4; EulerSystemsAndKolyvaginSystems ES.8; GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; GrossZagierAndArithmeticHeights GZ.9 / isogeny-and-differential-compatibility; HeegnerPointEulerSystems HE.8 / anticyclotomic-heegner-class; HeegnerPointEulerSystems HE.8 / lambda-bottom-class-nontorsion; HeegnerPointEulerSystems HE.8 / lambda-heegner-derivative-class; HeegnerPointEulerSystems HE.8 / lambda-heegner-local-conditions; HeegnerPointEulerSystems HE.8 / weak-torsion-localized-divisibility; IntegralIwasawaTheory L4; KatoEulerSystems L4; ModularIwasawaMainConjectures L0; ModularSymbolsPadicLFunctions L1; ModularSymbolsPadicLFunctions L2; PadicFamilies L0; PadicFamilies L1; PadicHodgeRegulators L3; PadicMeasuresIwasawaAlgebras L4; SelmerIwasawaCohomology L2; SelmerIwasawaCohomology L3; SelmerIwasawaCohomology L3 / iwasawa-shapiro; SelmerIwasawaCohomology L4; TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 2; TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 6.

## Layer 12: Prime parts at good Eisenstein primes

Transfer integral cyclotomic and anticyclotomic equalities to the actual defect, keeping the global and local torsion factors in control.

### 12.1 CGLS rank-one anticyclotomic control

Assume E has good ordinary reduction at odd split p, rank E(K)=1, finite Ш(E/K)[p∞], and E(ℚ_p)[p]=0. If F_E generates char of the primitive anticyclotomic Greenberg dual and P∈E(K) is nontorsion, then #ℤ_p/F_E(0)=#Ш(E/K)[p∞]·( #(ℤ_p/(((1−a_p+p)/p)log_ω P)) / [E(K):ℤP]_p )²·∏_{w|N}c_w(E/K)_p. The full index equals free index times torsion order; local vanishing makes the torsion order a p-unit in this branch.

K has Heegner/split/discriminant conditions. p>2, good ordinary, E(ℚ_p)[p]=0; rank E(K)=1; finite p-primary Sha; P nontorsion.

Specialize SIC’s anticyclotomic descent and its global-to-local image with the actual local conditions. Apply CGLS Theorem 5.1.1’s weakening of JSW residual irreducibility to E(K)[p]=0, justified by K_v=ℚ_p. Compute the local Kummer/logarithm cokernel and the full lattice index, retaining the ordinary factor (1−a_p+p)/p and all K-primes over N.

The source comparison is [CGLS (published)](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 5.1.1, p.571.

*Needs:* SelmerIwasawaCohomology L3; TauCetiRoadmap EllipticCurves Layer 4; §7.2 (the heegner index); §11.1 (ordinarity and local invariants at a good eisenstein prime).

The intended declarations are:

- `TauCeti.BSD.cgls_torsion_free_control` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The control theorem is not applied unchanged to X₁(11) at p=5.

### 12.2 Keller–Yin control with rational torsion

In KY Appendix B’s weight-two rank-one setting, drop residual irreducibility but retain the stated rank, local nonzero and finite BK-Sha hypotheses. Put δ_v=coker(H¹_f(K,T)→H¹_f(K_v,T)/tors). Then #Sel_ac(W)=#Ш_BK(W/K)·#δ_v², and #O/f_ac^Σ(0)=#Sel_ac(W)·C^Σ(W)/(#H⁰(K,W)·#H⁰(K,W)^∨), with C^Σ the exact product of both p-place H⁰ orders and the listed unramified/removed local H¹ factors. Keep the global localization image G, since surjectivity can fail. For an elliptic E and P nontorsion the primitive specialization is #ℤ_p/f_E(0)=#Ш(E/K)[p∞]·( #(ℤ_p/(((1−a_p+p)/p)log_ω P))/(I_free,p·#E(K)_tors,p) )²·∏_{w|N}c_w(E/K)_p.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. rank E(K)=1 and finite Ш(E/K)[p∞]; nonzero localization; source Appendix B’s weight-two local/dual hypotheses; correct translation of its S and Σ.

Use the integral local finite condition modulo torsion for δ_v; correct the printed codomain typo by the immediately following (B.1). Follow B.0.1/B.0.2’s snake-lemma control using G=image(loc) and both finite global H⁰ denominators; compute coinvariants as well as invariants. Remove the same finite local factors and substitute the full index I=I_free·#tors as in §4.2; local and global torsion cannot be dropped before cancellation.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Appendix B Proposition B.0.1 and Theorem B.0.2, (B.1)–(B.2); §4.2, p.42.

*Needs:* SelmerIwasawaCohomology L3; SelmerIwasawaCohomology L2; TauCetiRoadmap EllipticCurves Layer 4; §7.2 (the heegner index); §11.2 (ordinary, greenberg and unramified eisenstein selmer comparisons); SelmerIwasawaCohomology L4.

The intended declarations are:

- `TauCeti.BSD.ky_torsion_control` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- If p divides E(K)_tors, its contribution is −2v_p(#tors) in the Sha/log control equation.

### 12.3 Greenberg–Vatsal rank-zero prototype

Let A/ℚ have good ordinary reduction at p>2 and an actual cyclic p-isogeny whose kernel character is ramified at p and even, or unramified at p and odd. If L(A,1)≠0 then v_p(L(A,1)/Ω_A)=v_p(#Ш(A/ℚ)·Tam(A)/#A(ℚ)_tors²). The torsion denominator remains in the source statement. The parity/ramification restrictions are retained; the CGS cyclotomic route supplies the wider rank-zero case.

The exact parity/ramification hypothesis above; p odd good ordinary; nonzero actual central value.

Use the source Greenberg–Vatsal ordinary main-conjecture input and its integral period comparison, as specified from MIMC/ModularSymbols. Apply exact rank-zero control and the finite-Sha conclusion of Layer 6 to the actual curve. Identify the rational positive leading-term quotient with Layer 7’s defect, including the torsion square and full real period.

The source comparison is [CGLS (published)](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 5.1.4, p.573.

*Needs:* ModularIwasawaMainConjectures L0; SelmerIwasawaCohomology L3; ModularSymbolsPadicLFunctions L2; §7.8 (the rational bsd defect); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite); ModularSymbolsPadicLFunctions L1.

The intended declarations are:

- `TauCeti.BSD.greenberg_vatsal_rank_zero_prototype` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The trivial kernel character is unramified and even, so it fails this prototype.

### 12.4 Rank-zero defect from integral cyclotomic equality

For an actual E/ℚ with analyticRank E=0 and an odd good ordinary p, an integral cyclotomic main-conjecture equality in the Néron-period MSD normalization, together with exact cyclotomic control including global/local torsion and Euler factors, implies v_p(bsdDefect E)=0. The interpolation factor (1−α_p⁻¹)² is retained on both sides until control cancels it; full real period versus positive period contributes c∞, a p-unit for odd p.

analyticRank E=0; p odd good ordinary; the stated integral main-conjecture equality and exact control are proved for this E.

Apply MSD interpolation at the trivial character, using actual L(E,1)≠0 and Néron positive period. Apply the torsion-sensitive rank-zero control theorem with its H⁰ and local factor terms. Match the ordinary Euler factor and torsion-square denominator. Use GZ.0’s full-period component formula and Layer 7’s actual defect identity.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), §1.2 proof of Theorem D; §2.1 Proposition 2.1.1.

*Needs:* SelmerIwasawaCohomology L3; ModularIwasawaMainConjectures L0; ModularSymbolsPadicLFunctions L2; GrossZagierAndArithmeticHeights GZ.0 / real-period-components; §7.8 (the rational bsd defect); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite); ModularSymbolsPadicLFunctions L1.

The intended declarations are:

- `TauCeti.BSD.cyclotomic_rank_zero_defect` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A rational main conjecture alone leaves a possible coefficient-prime error.

### 12.5 Rank-one twist comparison with torsion

If analyticRank E=1 and K is selected with L(E^K,1)≠0 and the odd-p Heegner/split conditions, then the anticyclotomic main-conjecture equality, exact control and actual Gross–Zagier/BDP formulas imply v_p(bsdDefect E)+v_p(bsdDefect E^K)=0. In height/index terms use I_free=[E(K)/tors:ℤP̄], I=I_free·#E(K)_tors and h_BSD(P)=I_free²Reg_BSD(E/K). Thus the rank-one defect equals the negative of the rank-zero twist defect; the printed CGLS (5.7) sign and full-index height identity are corrected.

p odd good ordinary, rank E(K)=1, finite whole Sha from Layer 6, L(E^K,1)≠0; source main-conjecture and either the CGLS or KY control hypotheses verified.

Choose K by Layer 3 with split p and twist nonvanishing. Import actual base-change L factorization and Heegner nonvanishing, avoiding a root-number-only argument. Apply the squared BDP logarithm reciprocity and the appropriate exact control, using the full/free index conversion from Layer 7. Apply Gross–Zagier and the height, quadratic-regulator, period, Tamagawa, odd Sha and torsion decompositions. Add the two defect valuations to zero, retaining the minus sign on transfer to E^K.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), §4.2 pp.42–43; corrected CGLS §5.3 (5.5)–(5.7).

*Needs:* §3.5 (choice of a heegner field for analytic rank zero or one); §7.8 (the rational bsd defect); §0.11 (order, leading term and sign of l(e/k, s) at the centre); §7.4 (height of the heegner point and the squared index); §2.6 (lattice index and regulators over a quadratic field); §2.10 (the bsd quotient over k versus over ℚ at odd primes); GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; §12.1 (cgls rank-one anticyclotomic control); §12.2 (keller–yin control with rational torsion).

The intended declarations are:

- `TauCeti.BSD.rank_one_twist_defect_comparison` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A nonzero twist defect δ produces −δ on the rank-one side, not +δ.
- The regulator formula uses the free index; full index includes torsion.

### 12.6 CGLS rank-one Eisenstein BSD prototype

For analytic rank one, p>2 good ordinary, an actual p-isogeny kernel character φ with φ|G_p≠1,ω and φ ramified at p and odd, or unramified at p and even, v_p(bsdDefect E)=0. This is the source Theorem F/5.3.1 branch. Its opposite parity/ramification condition ensures the rank-zero quadratic twist satisfies Greenberg–Vatsal.

The exact rank-one local exclusion and parity/ramification conditions above.

Select K with L(E^K,1)≠0, using Layer 3. Apply the CGLS prototype anticyclotomic equality, whose (Sel) is supplied by analytic rank one over K and whole-Sha finiteness. Use rank-one-twist-defect-comparison and greenberg-vatsal-rank-zero-prototype for E^K with its changed parity.

The source comparison is [CGLS (published)](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 5.3.1, pp.576–577.

*Needs:* §11.27 (cgls anticyclotomic prototype); §12.5 (rank-one twist comparison with torsion); §12.3 (greenberg–vatsal rank-zero prototype); §3.5 (choice of a heegner field for analytic rank zero or one); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite).

The intended declarations are:

- `TauCeti.BSD.cgls_rank_one_prototype` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The parity hypothesis is opposite to the GV rank-zero one.

### 12.7 CGS good Eisenstein prime-part BSD

Let E/ℚ be elliptic, p>2 a prime of good reduction, and φ the actual rational p-isogeny kernel character with φ|G_p≠1,ω. If analyticRank E∈{0,1}, then v_p(bsdDefect E)=0, equivalently v_p(L*(E,1)/(Ω_E Reg_BSD))=v_p(Tam(E)·#Ш(E/ℚ)[p∞]/#E(ℚ)_tors²). The local exclusion proves the torsion denominator is a p-unit, but it remains in this general interface. There is no global semistability or CM hypothesis added.

E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. analyticRank E is zero or one.

Prove ordinarity and local p-torsion vanishing by eisenstein-ordinary-local-exclusion. At rank zero combine cgs-cyclotomic-main-conjecture with cyclotomic-rank-zero-defect; this removes the older GV parity restriction. At rank one choose K with a nonzero rank-zero twist; use cgs-anticyclotomic-main-conjecture, torsion-free control and rank-one-twist-defect-comparison. Apply the same rank-zero theorem to the twist. Use Layer 7’s exact positive rational defect identity and whole-Sha finiteness to express the formula.

The source comparison is [CGS (v2)](https://arxiv.org/pdf/2303.04373v2), Introduction Theorem D and §1.2 proof, pp.4–5.

*Needs:* §11.1 (ordinarity and local invariants at a good eisenstein prime); §11.34 (cgs integral cyclotomic main conjecture); §11.24 (cgs anticyclotomic greenberg main conjecture); §12.4 (rank-zero defect from integral cyclotomic equality); §12.5 (rank-one twist comparison with torsion); §7.8 (the rational bsd defect).

The intended declarations are:

- `TauCeti.BSD.cgs_eisenstein_prime_bsd` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A rational p-torsion point fails the CGS local character check.

### 12.8 Keller–Yin good Eisenstein prime-part BSD

Let E/ℚ be elliptic with analyticRank E∈{0,1}, and p>2 a prime of good reduction at which E has an actual cyclic p-isogeny. Then v_p(bsdDefect E)=0, equivalently v_p(L*(E,1)/(Ω_E Reg_BSD))=v_p(Tam(E)·#Ш(E/ℚ)[p∞]/#E(ℚ)_tors²). Rational p-torsion and local characters 1/ω are allowed. This is the verified KY v2 preprint Theorem C/4.2.1, not a deletion of hypotheses from CGS.

E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. analyticRank E is zero or one.

Use KY’s corrected residual lattice, local cohomology and μ/λ arguments to prove its anticyclotomic and cyclotomic equalities on the actual original curve. At rank zero apply torsion-sensitive cyclotomic-rank-zero-defect. At rank one use ky-torsion-control and rank-one-twist-defect-comparison with the full free-index/torsion correction. The rank-zero twist has the same good Eisenstein property and its defect valuation vanishes by the new rank-zero route; conclude the negative twist defect is zero. Express the result using the actual Layer 7 defect, retaining torsion squared.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), Theorem C, p.4; Theorem 4.2.1 and proof, pp.41–43.

*Needs:* §11.36 (keller–yin integral cyclotomic main conjecture); §11.31 (keller–yin anticyclotomic greenberg main conjecture); §12.2 (keller–yin control with rational torsion); §12.4 (rank-zero defect from integral cyclotomic equality); §12.5 (rank-one twist comparison with torsion); §7.8 (the rational bsd defect).

The intended declarations are:

- `TauCeti.BSD.ky_eisenstein_prime_bsd` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The X₁(11) curve at p=5 uses this branch with a nonunit torsion denominator.

### Examples

At p=5 the imported 11a3 model has five points over 𝔽₅, so a₅=1 and its good reduction is ordinary. The rational order-five point supplies a cyclic isogeny with trivial kernel character. Keller–Yin's good Eisenstein theorem applies after its analytic-rank certificate; CGS and torsion-free CGLS control do not. Its exact leading-term ratio is (1/25), so the analytic side has valuation −2; the arithmetic torsion-square denominator also contributes −2. Removing the torsion would give the wrong equality.

In the rank-one twist comparison the two defect valuations add to zero. If the twist defect has valuation δ, the rank-one defect has valuation −δ. The rank-zero prime-part theorem then sets δ=0.

### Dependencies

Earlier comparisons: §0.11, §2.6, §2.10, §3.5, §6.4, §7.2, §7.4, §7.8, §11.1, §11.2, §11.24, §11.27, §11.31, §11.34, §11.36. Supplier interfaces: GrossZagierAndArithmeticHeights GZ.0 / real-period-components; GrossZagierAndArithmeticHeights GZ.9 / bdp-weight-two-heegner-formula; ModularIwasawaMainConjectures L0; ModularSymbolsPadicLFunctions L1; ModularSymbolsPadicLFunctions L2; SelmerIwasawaCohomology L2; SelmerIwasawaCohomology L3; SelmerIwasawaCohomology L4; TauCetiRoadmap EllipticCurves Layer 4.

## Layer 13: Finite-support certificates and the full formula

A complete finite certificate covers the canonical rational numerator and denominator support. The applied endpoint separately requires the positive actual defect and its analytic/arithmetic identity.

### 13.1 Prime support of a rational number

For q in Q, Rat.primeSupport(q) is Nat.primeFactors(|q.num|) union Nat.primeFactors(q.den), using the existing reduced numerator and positive denominator. It is a finite set of natural numbers, not a set of arbitrary places. At q=0 its value is empty by the existing zero convention.

Take the union of the two existing finite prime-factor sets. The construction is deterministic and uses the canonical rational numerator and denominator; it makes no choice of a factorization or rational representative.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), primeFactors; mem_primeFactors; primeFactors_zero.

*Needs:* Mathlib `Nat.primeFactors`.

The intended declarations are:

- `Rat.mem_primeSupport` — For q nonzero, p belongs to its support exactly when p is prime and divides its absolute numerator or denominator.
- `Rat.primeSupport_zero` — The prime support of zero is empty.
- `Rat.primeSupport_one` — The prime support of one is empty.
- `Rat.primeSupport_neg` — Negation leaves prime support unchanged.
- `Rat.primeSupport_inv` — Inversion leaves prime support unchanged, including at zero.
- `Rat.primeSupport_mul_subset` — The support of a product is contained in the union of the supports of its factors; equality is not asserted because cancellation is possible.

**Checks.**

- The support of 6/35 is {2,3,5,7}.
- The support of 0 is empty; this does not imply 0=1.
- The support of 2 times 1/2 is empty although the union of the two individual supports is {2}.
- The support of -6/35 equals the support of 6/35.
- Changing a displayed fraction by a common nonzero factor does not change its rational prime support.

### 13.2 Zero valuation in the reduced numerator and denominator

For a prime p and any rational q with v_p(q)=0, both the natural valuation of |q.num| and that of q.den are zero.

p is prime. v_p(q)=0; q may be zero.

Use Rat.num_or_den_zero_padicVal to obtain that at least one of the numerator and denominator valuations is zero. Unfold padicValRat. Its vanishing equates the two natural valuations after integer coercion. In each branch, substitute the known zero and deduce that the other valuation is zero.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), Rat.num_or_den_zero_padicVal; padicValRat.

*Needs:* Mathlib `Rat.num_or_den_zero_padicVal`; Mathlib `padicValRat`; Mathlib `padicValInt`.

The intended declarations are:

- `TauCeti.BSD.zero_numerator_denominator` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The result also holds for q=0 under the library convention. It must not be applied to an unreduced numerator/denominator pair.

### 13.3 Rational valuation with torsion square

For a prime p and nonzero rationals q,a,t, v_p(q·t²/a)=v_p(q)+2v_p(t)−v_p(a). In an elliptic defect comparison q is the rational leading-term quotient after period/regulator rationality, t is the actual torsion order and a is the finite Sha–Tamagawa product. The sign of the torsion correction is positive in the defect and negative in the arithmetic leading term.

p prime; q,a,t nonzero rational numbers.

Use padicValRat.mul, pow and div with the nonzero arguments; convert the natural exponent 2 to the integer coefficient. Apply the identity only after Layer 7 provides the rational leading-term quotient.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), padicValRat.mul; padicValRat.pow; padicValRat.div.

*Needs:* Mathlib `padicValRat.mul`; Mathlib `padicValRat.pow`; Mathlib `padicValRat.div`.

The intended declarations are:

- `TauCeti.BSD.torsion_square_valuation` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- For q=1/25,t=5,a=1, the valuation at 5 is zero; omitting t² yields −2.

### 13.4 Finite Selmer cardinality and Sha torsion

For E/ℚ with known Mordell–Weil rank r, exact torsion group and m=p^n>1, a verified finite presentation of Sel_m and the actual Kummer exact sequence give #Ш(E/ℚ)[m]=#Sel_m/(m^r·#E(ℚ)_tors/mE(ℚ)_tors). To conclude the p-primary order from this finite layer one must also prove that p^n annihilates Ш[p∞]. Finiteness alone does not make n=1 sufficient.

m=p^n, p prime, n≥1; exact finite Sel_m presentation and correct actual local Kummer images; rank and torsion verified.

Import EllipticCurves Layer 7’s exact 0→E(ℚ)/mE(ℚ)→Sel_m→Ш[m]→0, not a new Selmer definition. Use the actual finite generated Mordell–Weil decomposition from Layer 6 to compute the quotient cardinality; a subgroup of finite index is not automatically the full free lattice. Take cardinalities of the verified finite presentation. With an independent exponent bound identify Ш[m] with Ш[p∞].

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.6 2-descent, exact sequence following the quartic Selmer description.

*Needs:* TauCetiRoadmap EllipticCurves Layer 7; TauCetiRoadmap EllipticCurves Layer 6; ArithmeticGaloisDuality R02.4.

The intended declarations are:

- `TauCeti.BSD.selmer_cardinality_adapter` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A p-Selmer count can detect Sha[p] without measuring the higher p-power exponent.

### 13.5 Certified free lattice and saturation index

For actual points P₁,…,P_r on E/ℚ, a certified rank bound and linear independence identify their subgroup as finite index, not as the full Mordell–Weil free lattice. A proved height bound plus finite complete search, or certified q-saturation for every prime dividing a proved index bound, supplies the exact index I_free. In rank one h_BSD(P)=I_free²Reg_BSD(E), while [E(ℚ):ℤP]=I_free·#tors.

Actual points and torsion subgroup; exact rank r; a proved height/index bound and a complete finite enumeration or all required saturation proofs.

Import EllipticCurves Layer 6’s saturation and height-comparison algorithms, with their termination bounds. Use Cremona Proposition 3.5.1’s explicit height comparison to bound possible divisors/generators; exclude them by exact rational arithmetic and a complete search. Apply Layer 7’s free-index height identity with GZ.0’s BSD regulator normalization.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.5, Proposition 3.5.1 and rank-one generator criterion.

*Needs:* TauCetiRoadmap EllipticCurves Layer 6; §7.4 (height of the heegner point and the squared index); GrossZagierAndArithmeticHeights GZ.0 / height-convention-dictionary.

The intended declarations are:

- `TauCeti.BSD.mordell_weil_saturation_adapter` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Replacing a generator by 2P multiplies its height by 4 but does not change Reg_BSD of the full lattice.

### 13.6 Local Tamagawa certificate adapter

For the actual integral minimal models at every bad prime ℓ of E, a verified Tate-algorithm trace determines the reduction type, conductor exponent and component-group order c_ℓ. The finite Tamagawa product is over the support of the minimal discriminant; every good-prime factor is one. Dyadic, ternary and additive cases use their own residue-characteristic branches and exact minimality proofs.

Integral models with certified local minimality and a complete bad-prime list; exact Tate-algorithm traces including ℓ=2,3.

Import EllipticCurves Layer 4 and Néron-model component groups rather than defining c_ℓ by a table. Replay each integral coordinate change and residue calculation; identify the component group cardinality, not only its Kodaira symbol. Prove all primes outside the discriminant support have good reduction and c_ℓ=1, then form the finite product.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.2 Tate algorithm and local information.

*Needs:* TauCetiRoadmap EllipticCurves Layer 4; NeronModelsAndSemistableAbelianVarieties R11.2; Mathlib `Nat.primeFactors`.

The intended declarations are:

- `TauCeti.BSD.local_tamagawa_certificate_adapter` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- An additive prime at 2 is not certified by the ℓ≥5 table.

### 13.7 Exact local isogeny comparison

For an actual ℚ-isogeny φ:E→E′ and its dual, certified kernel, cokernel and differential indices at each relevant place, with global Mordell–Weil/torsion and Sha terms, verify the Cassels arithmetic quotient comparison. Transport a proved p-part/full certificate via Layer 7’s bsdDefect-isogeny invariance. The local data are not replaced by isogeny degree alone, especially at p dividing deg φ and at additive or dyadic places.

Actual isogeny and dual; exact finite local/global index calculations and the source’s finite-Sha hypotheses.

Import EllipticCurves Layers 1/4/7’s differential, local Kummer and Cassels comparison APIs. Compute local cokernels and kernel orders on the actual models, with Néron differential pullback and full real components. Use defect-isogeny-invariance, which combines the arithmetic comparison with equality of all analytic local factors.

The source comparison is [Christian Wüthrich](https://ems.press/content/serial-article-files/26230?nt=1), Lemma 17, p.398; Theorem 4 lattice construction.

*Needs:* TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 7; §7.9 (isogeny invariance of the rational bsd defect).

The intended declarations are:

- `TauCeti.BSD.local_isogeny_certificate_adapter` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Isogenous curves may have different torsion and Tamagawa numbers and different real periods.

### 13.8 Membership in rational prime support

For q nonzero and p natural, p belongs to Rat.primeSupport(q) if and only if p is prime and either p divides |q.num| or p divides q.den.

q is a nonzero rational number.

Unfold the union defining prime support. Apply Nat.mem_primeFactors to each summand. Nonzero q gives nonzero absolute numerator; the canonical denominator is positive. Remove these two nonzero conditions and distribute the shared primality condition.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), mem_primeFactors.

*Needs:* §13.1 (prime support of a rational number); Mathlib `Nat.mem_primeFactors`.

The intended declarations are:

- `TauCeti.BSD.support_membership` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- At q=6/35, 5 belongs to the support and 4 does not. The nonzero hypothesis prevents treating every prime as a divisor contributing to the support of zero.

### 13.9 Empty prime support and rational units of absolute value one

For nonzero q in Q, Rat.primeSupport(q) is empty if and only if q=1 or q=-1.

q is nonzero.

A union is empty exactly when each of its finite sets is empty. Apply Nat.primeFactors_eq_empty to the absolute numerator and denominator. Their nonzero properties eliminate the zero alternatives. Thus the absolute numerator and denominator are both one; the canonical rational normal form gives q=1 or q=-1. Conversely, substitute either value in the definition.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), primeFactors_eq_empty.

*Needs:* §13.1 (prime support of a rational number); Mathlib `Nat.primeFactors_eq_empty`.

The intended declarations are:

- `TauCeti.BSD.empty_support_units` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Both 1 and -1 must occur. The unrestricted implication with q=0 is false.

### 13.10 Finite certificate of rational prime-valuation vanishing

Rat.PrimeValuationCertificate(q) consists of a finite set primes of natural numbers, proofs that every member is prime, that Rat.primeSupport(q) is contained in primes, and that v_p(q)=0 for every member p. It stores no equality q=1, no positivity assumption, and no unproved assertion that a partial list covers the support.

Form the structure using the existing finite-set and valuation types and the explicit primeSupport construction. Constructor fields have the stated mathematical content. Extensionality reduces to equality of the finite sets, since the other fields are proofs.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.1 (prime support of a rational number); Mathlib `padicValRat`.

The intended declarations are:

- `Rat.PrimeValuationCertificate.primes` — The finite set used by this certificate.
- `Rat.PrimeValuationCertificate.prime_mem` — Every member of primes is prime.
- `Rat.PrimeValuationCertificate.covers` — The canonical support is contained in primes.
- `Rat.PrimeValuationCertificate.localZero` — The valuation vanishes at every member of primes.
- `Rat.PrimeValuationCertificate.ext` — Certificates for the same q with equal finite sets are equal.
- `Rat.PrimeValuationCertificate.zeroValuation` — A certificate implies zero valuation at every prime, including outside its finite set.
- `Rat.PrimeValuationCertificate.eq_one` — A certificate for strictly positive q implies q=1.

**Checks.**

- A certificate for 1 exists with empty finite set.
- A certificate for 0 exists with empty finite set, but the positivity input is false.
- A certificate for -1 exists; its existence alone is not a full-formula certificate.
- There is no certificate for 2.
- There is no certificate for 1/4, whose missing dyadic valuation is negative.
- An empty list is not evidence of coverage for q=2. Zero and -1 can have such valuation certificates but cannot pass positive reconstruction.

### 13.11 Certified Sha annihilator and finite descent

For an analytic-rank-at-most-one actual E, take a proved positive integer B annihilating the whole Ш(E/ℚ), obtained from an explicit bounded-error Kolyvagin descent or another independently certified arithmetic bound. For each prime p|B, verified Sel_{p^{v_p(B)}} data determine #Ш[p∞] by selmer-cardinality-adapter. Their product is the whole Sha order; for p∤B the p-primary group vanishes. A claimed annihilator must include all exceptional, dyadic and bad-prime constants.

A theorem proves B>0 and [B]Ш(E/ℚ)=0, not just predicted order or abstract finiteness. Each listed finite Selmer presentation is certified with its local images and actual Mordell–Weil quotient.

Import the all-prime arithmetic descent from HE.7 and the explicit error constants/annihilator promised for the particular curve or family; record a gap where no numerical annihilator producer has been established. Factor B with the baseline primeFactors/factorization API. Apply selmer-cardinality-adapter at the full exponent. Use primary decomposition for the finite group to reconstruct its cardinality and prove outside-prime vanishing.

The source comparison is [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem 1.3, printed p.236; exceptional factor discussed on pp.236–239.

*Needs:* §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite); HeegnerPointEulerSystems HE.7; TauCetiRoadmap EllipticCurves Layer 7; §13.4 (finite selmer cardinality and sha torsion); Mathlib `Nat.primeFactors`.

The intended declarations are:

- `TauCeti.BSD.sha_annihilator_adapter` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A bound proved only away from a finite set does not certify an annihilator of the whole group.

### 13.12 Prime valuation and exact support

For a nonzero rational q and a prime p, v_p(q)=0 if and only if p does not belong to Rat.primeSupport(q).

q is nonzero. p is prime.

For the forward implication, apply zero-numerator-denominator. Use dvd_iff_padicValNat_ne_zero, separately for the nonzero absolute numerator and the positive denominator, to exclude both divisibilities. Apply support-membership. For the reverse implication, support-membership excludes both divisibilities. The same baseline equivalence gives zero for both natural valuations. Subtract them in the definition of padicValRat. Install Fact p.Prime locally when applying the baseline valuation lemma.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), dvd_iff_padicValNat_ne_zero; [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), mem_primeFactors.

*Needs:* §13.8 (membership in rational prime support); §13.2 (zero valuation in the reduced numerator and denominator); Mathlib `dvd_iff_padicValNat_ne_zero`; Mathlib `padicValRat`; Mathlib `padicValInt`.

The intended declarations are:

- `TauCeti.BSD.zero_iff_outside_support` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- For q=1/2, the valuation at 2 is -1 and 2 is in the support; negative valuations are not discarded.

### 13.13 Canonical certificate from all prime valuations

Given a rational q and a proof that v_p(q)=0 for every prime p, construct Rat.PrimeValuationCertificate.ofAllPrimes(q) with finite set exactly Rat.primeSupport(q). No nonzero or sign hypothesis is needed.

All prime valuations of q vanish.

Choose the canonical support as the finite set; support coverage is reflexive. Its members are prime by Nat.mem_primeFactors, even when the numerator is zero. The supplied all-prime assertion gives every local proof.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), mem_primeFactors.

*Needs:* §13.10 (finite certificate of rational prime-valuation vanishing); Mathlib `Nat.mem_primeFactors`.

The intended declarations are:

- `Rat.PrimeValuationCertificate.ofAllPrimes` — Construct the certificate from the all-prime vanishing hypothesis.
- `Rat.PrimeValuationCertificate.ofAllPrimes_primes` — Its finite set is exactly Rat.primeSupport(q).
- `Rat.PrimeValuationCertificate.ofAllPrimes_proof_independent` — The constructed certificate is independent of the chosen proof of all-prime vanishing.

**Checks.**

- For q=1 the chosen finite set is empty.
- For q=0 the chosen finite set is empty.
- For q=-1 the chosen finite set is empty without providing positivity.
- The chosen set is canonical rather than an unspecified finite witness.

### 13.14 Exceptional-prime leading-term certificate adapter

For a specific E and a prime p excluded from the available named prime-part theorems, exact rational leading-term/period/regulator comparison, finite Sha/descent data, torsion order and all local Tamagawa factors compute v_p(bsdDefect E). A valuation-zero conclusion requires the computed equality, including p=2,3 or bad/additive p. Such data are certificate producers for a curve or specified family; they are not a uniform all-E exceptional-prime theorem.

Actual positive rational defect and exact analytic rational quotient; certified whole-Sha p-primary data, torsion, free lattice and local invariants.

At rank zero import Layer 7 modular-symbol rationality and its actual period comparison; at rank one import its Gross–Zagier/free-index rationality. Use sha-annihilator-adapter, mordell-weil-saturation-adapter and local-tamagawa-certificate-adapter, or an exact isogeny transfer with all indices verified. Apply torsion-square-valuation and exact integer factorization; produce a proof that the resulting integer is zero rather than a numerical approximation to the real leading term.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §7.8 (the rational bsd defect); §1.1 (rationality of l(e,1)/ω_e); §7.5 (rationality of l′(e,1)/(ω_e reg_e) in analytic rank one); §13.11 (certified sha annihilator and finite descent); §13.5 (certified free lattice and saturation index); §13.6 (local tamagawa certificate adapter); §13.7 (exact local isogeny comparison); §13.3 (rational valuation with torsion square).

The intended declarations are:

- `TauCeti.BSD.exceptional_prime_part_adapter` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A database’s analytic Sha order is not admitted as a finite-Sha proof.

### 13.15 Reconstruction of a positive rational from all prime valuations

For q in Q with 0<q, q=1 if and only if v_p(q)=0 for every prime natural p.

q is strictly positive.

If q=1, use padicValRat.one at every prime. Conversely q is nonzero. Every member of primeSupport(q) is prime by support-membership, and zero-iff-outside-support contradicts its membership if all prime valuations vanish. Hence the support is empty. Apply empty-support-units. Strict positivity eliminates the alternative q=-1.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), primeFactors_eq_empty.

*Needs:* §13.8 (membership in rational prime support); §13.12 (prime valuation and exact support); §13.9 (empty prime support and rational units of absolute value one); Mathlib `padicValRat.one`.

The intended declarations are:

- `TauCeti.BSD.positive_rational_reconstruction` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Reject the conclusion for q=0 and q=-1 when positivity is removed. Testing only odd primes leaves q=2 undecided.

### 13.16 A finite certificate controls every prime

For any rational q, any Rat.PrimeValuationCertificate(q), and any prime p, v_p(q)=0.

A finite prime-valuation certificate for q is supplied. p is prime.

If q=0 use padicValRat.zero. Otherwise split on membership of p in the certificate finite set. Inside the set use localZero. Outside it, covers implies p is outside canonical support. Apply zero-iff-outside-support to nonzero q.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.10 (finite certificate of rational prime-valuation vanishing); §13.12 (prime valuation and exact support); Mathlib `padicValRat.zero`.

The intended declarations are:

- `TauCeti.BSD.certificate_all_primes` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The outside-set branch must be justified by covers. The statement also applies at the zero convention without producing equality to one.

### 13.17 Certificate from an exceptional-prime set and an outside theorem

Given q in Q, a finite set S of primes, vanishing of v_p(q) on S, and vanishing at every prime outside S, construct Rat.PrimeValuationCertificate.ofExceptionSet(q,S) with finite set S. Its support coverage is proved, not an extra unverified field.

Every member of S is prime. v_p(q)=0 for each p in S. For every prime p outside S, v_p(q)=0.

For q=0 the canonical support is empty, so coverage is immediate. For q nonzero and p in canonical support, support-membership gives primality. If p were outside S, the outside theorem and zero-iff-outside-support would contradict membership. This proves coverage. Use the given primality and inside vanishing statements for the remaining fields.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.10 (finite certificate of rational prime-valuation vanishing); §13.8 (membership in rational prime support); §13.12 (prime valuation and exact support).

The intended declarations are:

- `Rat.PrimeValuationCertificate.ofExceptionSet` — Construct the certificate from inside and outside prime-valuation proofs.
- `Rat.PrimeValuationCertificate.ofExceptionSet_primes` — Its finite set equals the supplied S.
- `Rat.PrimeValuationCertificate.ofExceptionSet_proof_independent` — For fixed q and S the constructed certificate is independent of the primality, inside and outside proofs.

**Checks.**

- For q=1 and S empty the supplied global outside theorem gives the empty certificate.
- For q=1 and S={2,3}, correct inside and outside proofs produce a certificate with exactly {2,3}, not the minimal support.
- For q=-1 and S={2}, correct prime data produce a valuation certificate, still without positivity.
- The outside theorem has to cover every prime outside S, not just every sufficiently large prime beyond a second unstated exception set.

### 13.18 Source-qualified fixed-prime dispatch

For an actual curve E of analytic rank at most one and a prime p, a verified instance of a named Layer 10 branch, cgs-eisenstein-prime-bsd, ky-eisenstein-prime-bsd, or exceptional-prime-part-adapter proves v_p(bsdDefect E)=0. The instance includes every source hypothesis; no disjunction is discharged by an unproved blanket claim that p is good, large or irreducible.

E actual elliptic; analyticRank E≤1; p prime; one exact source-qualified branch or a complete arithmetic certificate applies.

Match the actual residual representation/isogeny and local reduction to the chosen source branch. Apply its defect-valuation conclusion and normalize it through Layer 7. Retain the branch witness as the provenance for the finite certificate entry.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §10.5 (the p-part of bsd in rank zero at ordinary and multiplicative primes (skinner–urban, skinner)); §10.2 (the p-part of bsd in rank zero at supersingular primes); §10.9 (the p-part of bsd in analytic rank one (jetchev–skinner–wan)); §10.8 (the p-part of bsd at multiplicative primes in analytic rank one (castella's corrected theorem a′)); §10.4 (bstw supersingular rank-one p-part); §12.7 (cgs good eisenstein prime-part bsd); §12.8 (keller–yin good eisenstein prime-part bsd); §13.14 (exceptional-prime leading-term certificate adapter); §7.8 (the rational bsd defect).

The intended declarations are:

- `TauCeti.BSD.source_qualified_prime_part_dispatch` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Good irreducible reduction alone is insufficient for the rank-zero ramification-qualified branch.

### 13.19 Positive reconstruction from a finite certificate

For strictly positive q in Q, a Rat.PrimeValuationCertificate(q) implies q=1.

q is strictly positive. A finite prime-valuation certificate for q is supplied.

Use certificate-all-primes to get the valuation statement at every prime. Apply positive-rational-reconstruction with the supplied strict positivity.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.16 (a finite certificate controls every prime); §13.15 (reconstruction of a positive rational from all prime valuations).

The intended declarations are:

- `TauCeti.BSD.certificate_reconstruction` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Neither a certificate for -1 nor one for 0 supplies the positivity hypothesis.

### 13.20 Transfer of a certified rational quotient to a real identity

Let A,B be real numbers with B nonzero. If q is a strictly positive rational number, its canonical real image equals A/B, and q has a finite prime-valuation certificate, then A=B.

B is nonzero. q is strictly positive. The real image of q is exactly A/B. A finite prime-valuation certificate for q is supplied.

Apply certificate-reconstruction to obtain q=1. Transport this equality through the canonical rational-to-real map. The identified quotient is one. Multiply by nonzero B using field algebra.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.19 (positive reconstruction from a finite certificate).

The intended declarations are:

- `TauCeti.BSD.real_identity` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The theorem does not assert that arbitrary A/B is rational. It also does not identify A or B with elliptic-curve invariants.

### 13.21 Full leading term under the actual defect certificate

For an actual elliptic curve E/ℚ of analytic rank at most one, a Rat.PrimeValuationCertificate for Layer 7’s bsdDefect E proves the full real identity L*(E,1)=Ω_E Reg_BSD(E/ℚ) #Ш(E/ℚ) ∏c_ℓ(E)/#E(ℚ)_tors². Its hypotheses include the proved analytic-rank bound and a complete certificate, not just finitely many observed p-parts.

analyticRank E≤1. A complete finite valuation certificate for the actual bsdDefect E.

Import rational-bsd-defect, its positivity and exact real quotient, including rank equality and whole-Sha finiteness from Layer 6. Apply real-identity to the certificate and the positive arithmetic denominator.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §7.8 (the rational bsd defect); §13.20 (transfer of a certified rational quotient to a real identity).

The intended declarations are:

- `TauCeti.BSD.elliptic_endpoint` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- An arbitrary rational carrying the same label is not an admissible substitute for d_E. Keep rank equality and whole-Sha finiteness as separate public results.

### 13.22 Individual full BSD from a finite exceptional set

For an actual E/ℚ with analyticRank E≤1, let S be an explicit finite set of primes. Prove v_p(bsdDefect E)=0 for every p∈S, and prove the same for every prime p∉S using source-qualified theorem ranges or a certified arithmetic bound. Then the exact leading-term BSD formula holds for E. The outside theorem proves support coverage; alternatively supply the canonical numerator/denominator support cover directly. Both constructions require every listed localZero proof.

S finite, all members prime; actual defect positivity; all inside and all outside valuations vanish.

Use certificate-from-exceptions to prove the actual support lies in S; no unverified support field remains. Apply elliptic-endpoint to the resulting complete certificate. When the outside range is p>B, include every prime ≤B together with all other named exclusions; simply recording “sufficiently large” is not an outside proof for a supplied S.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.17 (certificate from an exceptional-prime set and an outside theorem); §13.21 (full leading term under the actual defect certificate); §13.18 (source-qualified fixed-prime dispatch).

The intended declarations are:

- `TauCeti.BSD.individual_full_bsd_from_exceptions` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Omitting a possibly nonzero dyadic valuation blocks this theorem.

### 13.23 Full BSD for an explicitly certified family

For a specified parameter type A and an actual elliptic curve E_a/ℚ for each a, if every E_a has analyticRank≤1 and a supplied complete Rat.PrimeValuationCertificate for bsdDefect E_a, then the full leading-term formula holds for every a. If S_a and source-qualified inside/outside proofs construct the certificate, they may depend on a. No uniform theorem on all residual exceptional primes is assumed.

A specified family of actual curves; proved rank bound and complete certificate for each parameter.

Apply individual-full-bsd-from-exceptions or elliptic-endpoint pointwise. Expose the parameter-dependent bad-prime set, reduction/isogeny data, and certified exceptional valuations in the family theorem’s hypotheses.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.22 (individual full bsd from a finite exceptional set); §13.21 (full leading term under the actual defect certificate).

The intended declarations are:

- `TauCeti.BSD.family_full_bsd_from_certificates` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A theorem proving only all sufficiently large p for every a does not satisfy this contract.

### Examples

The rational number 6/35 has support {2,3,5,7}. Cancellation gives support(2·1/2)=∅, smaller than the union of the two supports. A complete valuation-zero certificate exists for 1, zero and −1; only the first is positive. No such certificate exists for 2 or 1/4 because their dyadic valuations are respectively 1 and −2.

For the actual elliptic endpoint, identify the defect with the actual real analytic/arithmetic quotient before using reconstruction. If a whole-Sha annihilator B has been proved, a finite Selmer presentation at pᵛᵖ⁽ᴮ⁾ can compute each primary order. A p-Selmer count without an exponent bound computes only Sha[p]. A point of finite free index supplies a regulator only after saturation or exact index comparison. These arithmetic certificates supplement, rather than follow from, abstract rank and finiteness.

### Dependencies

Earlier comparisons: §1.1, §6.4, §7.4, §7.5, §7.8, §7.9, §10.2, §10.4, §10.5, §10.8, §10.9, §12.7, §12.8. Supplier interfaces: ArithmeticGaloisDuality R02.4; GrossZagierAndArithmeticHeights GZ.0 / height-convention-dictionary; HeegnerPointEulerSystems HE.7; Mathlib `Nat.mem_primeFactors`; Mathlib `Nat.primeFactors_eq_empty`; Mathlib `Nat.primeFactors`; Mathlib `Rat.num_or_den_zero_padicVal`; Mathlib `dvd_iff_padicValNat_ne_zero`; Mathlib `padicValInt`; Mathlib `padicValRat.div`; Mathlib `padicValRat.mul`; Mathlib `padicValRat.one`; Mathlib `padicValRat.pow`; Mathlib `padicValRat.zero`; Mathlib `padicValRat`; NeronModelsAndSemistableAbelianVarieties R11.2; TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 4; TauCetiRoadmap EllipticCurves Layer 6; TauCetiRoadmap EllipticCurves Layer 7.

## Layer 14: Arithmetic and analytic comparison examples

The examples distinguish four conclusions: rank equality, whole-Sha finiteness, one prime part, and a full leading-term formula with every exceptional prime certified.

### 14.1 A prime defect is invisible at every other prime

For distinct primes p and ell, the rational number p has valuation zero at ell.

p and ell are primes. p is different from ell.

Nat.Prime.dvd_iff_eq implies ell does not divide p, since ell is not one and the primes differ. Apply padicValNat.eq_zero_of_not_dvd, then padicValRat.of_nat.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean), Nat.Prime.dvd_iff_eq; [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), padicValRat.of_nat.

*Needs:* Mathlib `Nat.Prime.dvd_iff_eq`; Mathlib `padicValNat.eq_zero_of_not_dvd`; Mathlib `padicValRat.of_nat`.

The intended declarations are:

- `TauCeti.BSD.away_from_prime` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- With p=2 this verifies all odd-prime checks even though the rational defect is not one. With p=3 the same issue affects an omitted triadic check.

### 14.2 No complete certificate for a prime defect

For every prime p, Rat.PrimeValuationCertificate(p), where p is cast to Q, is uninhabited.

p is prime.

Suppose a certificate were supplied. The rational p is positive, so certificate-reconstruction would give p=1. Primality gives p>1, a contradiction.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §13.19 (positive reconstruction from a finite certificate).

The intended declarations are:

- `TauCeti.BSD.prime_obstruction` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Combine with away-from-prime for p=2: all odd-prime checks pass, but no complete certificate exists. The primitive baseline padicValRat.self gives the missing valuation as one.

### 14.3 The remaining dyadic equality under all odd-prime equalities

For strictly positive q in Q, assume v_p(q)=0 for every odd prime p. Then q=1 if and only if v_2(q)=0.

q is strictly positive. All odd-prime valuations of q vanish.

Use Nat.forall_prime_iff_two_and_odd to combine the supplied odd-prime results with a dyadic equality, or extract that equality from all-prime vanishing. Apply positive-rational-reconstruction in both directions.

The source comparison is [Mathlib contributors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean), forall_prime_iff_two_and_odd.

*Needs:* §13.15 (reconstruction of a positive rational from all prime valuations); Mathlib `Nat.forall_prime_iff_two_and_odd`.

The intended declarations are:

- `TauCeti.BSD.dyadic_gate` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- For q=2 and q=1/4 the dyadic hypothesis fails although every odd-prime test succeeds. For q=1 both sides hold.

### 14.4 Concrete 32a2 Weierstrass model

Define fixture32 as the actual Mathlib WeierstrassCurve over ℚ with coefficient tuple (0,0,0,−1,0). Its invariants are Δ=64, c₄=48 and j=1728. It is nonsingular and supplies the CM and additive dyadic reduction test. Labels are descriptive; changing the model changes the period and differential data.

Use the existing five-field Mathlib structure, its invariant polynomials and toAffine. Evaluate b₂,b₄,b₆,b₈,c₄,Δ by exact rational arithmetic; nonzero Δ gives IsElliptic. Evaluate the affine equation and partial derivatives at (0,0), proving Nonsingular rather than merely Equation.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 32a2.

*Needs:* Mathlib `WeierstrassCurve`; Mathlib `WeierstrassCurve.Δ`; Mathlib `WeierstrassCurve.IsElliptic`; Mathlib `WeierstrassCurve.Affine.Nonsingular`.

The intended declarations are:

- `WeierstrassCurve.BSD.fixture32_coefficients` — (a₁,a₂,a₃,a₄,a₆)=(0,0,0,−1,0)
- `WeierstrassCurve.BSD.fixture32_discriminant` — Δ=64
- `WeierstrassCurve.BSD.fixture32_elliptic` — fixture32.IsElliptic
- `WeierstrassCurve.BSD.fixture32_origin_nonsingular` — fixture32.toAffine.Nonsingular 0 0
- `WeierstrassCurve.BSD.fixture32_j` — j=1728

**Checks.**

- x³−x has the three distinct rational roots −1,0,1
- v₂(Δ)=6, while c₄=48
- Δ>0, so c∞=2
- Exact rational arithmetic distinguishes the models and proves Δ≠0.

### 14.5 Central Mellin formulas with explicit tails

For the actual modular form of E of conductor N, write β=2π/√N, ρ=exp(−β) and a_n for its exact Fourier coefficients. If the root number is +1 then L(E,1)=2Σ_{n≥1}(a_n/n)exp(−βn). If it is −1 then L′(E,1)=2Σ_{n≥1}(a_n/n)E₁(βn), with E₁(x)=∫_x^∞exp(−t)/t dt. For |a_n|≤n² and a cutoff M, the absolute tails are bounded respectively by 2ρ^(M+1)((M+1)−Mρ)/(1−ρ)² and 2ρ^(M+1)/(β(1−ρ)). These concern the actual analytic continuation, never the raw Dirichlet series evaluated at 1.

E modular, N>0, actual functional equation/root number; M≥0; exact coefficient bounds from Hasse and multiplicativity.

Import the modularity/functional-equation and actual-L interfaces. Split the Mellin transform at 1/√N and substitute the functional equation, keeping its sign convention. Differentiate the completed Mellin formula in the sign −1 case; use Cremona Proposition 2.13.1, whose E₁ is the indicated integral. Bound E₁(x)≤exp(−x)/x for x>0; sum Σ_{n>M}nρ^n and Σ_{n>M}ρ^n explicitly. Hasse plus multiplicativity gives |a_n|≤d(n)√n≤n².

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/chapter2.pdf), §§2.8,2.12 and Proposition 2.13.1, pp.41–45.

*Needs:* EllipticCurveModularity R29.6, using the pinned entire-extension interface; §0.1 (the completed l-function and the root number); TauCetiRoadmap EllipticCurves Layer 3; TauCetiRoadmap ModularForms Layer 7.

The intended declarations are:

- `TauCeti.BSD.mellin_central_tail_bounds` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Swapping the root-number sign swaps the value and derivative formulas and fails the fixture test.

### 14.6 Five-isogeny and torsion-square comparison

For fixture11=11a3 and the actual optimal curve 11a1, construct the cyclic five-isogeny and dual. With minimal Néron differentials and full real periods, verify Ω(11a3)=5Ω(11a1), c₁₁(11a3)=1, c₁₁(11a1)=5 and both rational torsion orders 5. The exact modular-symbol ratio L(11a1,1)/Ω(11a1)=1/5 then gives L(fixture11,1)/Ω(fixture11)=1/25. The arithmetic quotient has the same change; the p=5 torsion-square denominator cannot be dropped.

Actual isogeny/differential and local/global index certificates on both models; exact modular-symbol period comparison.

Use point11’s kernel with EllipticCurves Layer 1; replay the isogeny formulas, minimal differential scaling and map on real components. Import the exact N=11 modular-symbol computation and verify its optimal-model period; transport it through the actual isogeny. Use local-isogeny-certificate-adapter and torsion-square-valuation. The two ratios are exact; decimal period ratios are insufficient.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/examples.pdf), N=11 worked example, period and L-value.

*Needs:* EllipticCurves worked examples; Layers 1–2 and 6; §13.7 (exact local isogeny comparison); §13.3 (rational valuation with torsion square); TauCetiRoadmap EllipticCurves Layer 1; §1.1 (rationality of l(e,1)/ω_e).

The intended declarations are:

- `TauCeti.BSD.fixture_11_isogeny_period` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Replacing torsion² by torsion changes the predicted 5-adic valuation by one; deleting torsion changes it by two.

### 14.7 32a2 discriminant calculation

The actual coefficient polynomial gives fixture32.Δ=64.

Unfold the five coefficients and Mathlib Δ; reduce the rational polynomial.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 32a2.

*Needs:* §14.4 (concrete 32a2 weierstrass model); Mathlib `WeierstrassCurve.Δ`.

The intended declarations are:

- `TauCeti.BSD.fixture_32_discriminant` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The result is nonzero and has the stated sign.

### 14.8 Certified central values for the three fixtures

Replay exact rational interval certificates for the actual L-functions of fixture11, fixture37 and fixture32: 1/4<L(fixture11,1)<3/10, 1/4<L′(fixture37,1)<1/3 and 3/5<L(fixture32,1)<7/10. Their root numbers are respectively +1,−1,+1; the second sign forces L(fixture37,1)=0. The bounds then prove analytic ranks 0,1,0. The listed intervals are proof targets, not claims of completed interval proofs.

Exact modular-form identification, conductor/root-number certificates and rigorous interval replay for π, square roots, exponentials and E₁ at each finite argument.

Use the exact coefficient recurrence and finite-field point counts through a cutoff such as M=40, including the bad-prime coefficient cases. Evaluate each finite sum using outward rational enclosures for elementary functions and a proved E₁ quadrature/tail bound; add mellin-central-tail-bounds. Record the rational bounds and all rounding errors in the certificate. Use the Layer 0 analytic-rank definition and the functional equation to conclude the orders of vanishing. A floating-point sum is only a diagnostic.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/examples.pdf), N=11 and N=37 worked computations; compare Chapter 2 §2.13.

*Needs:* EllipticCurves worked examples; Layers 1–2 and 6; §14.4 (concrete 32a2 weierstrass model); §14.5 (central mellin formulas with explicit tails); §0.2 (analytic rank and the leading coefficient at s = 1); ComputationalNumberTheory CN.4.

The intended declarations are:

- `TauCeti.BSD.analytic_fixture_enclosures` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Certificates must enclose every finite-sum error and the infinite tail; no raw LSeries at 1 or decimal nonzero test is allowed.

### 14.9 32a2 ellipticity and affine point domain

fixture32 is elliptic and fixture32.toAffine.Nonsingular 0 0 holds.

Apply the nonzero-discriminant criterion. For (0,0), evaluate the equation and at least one nonzero partial derivative.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 32a2.

*Needs:* §14.7 (32a2 discriminant calculation); Mathlib `WeierstrassCurve.IsElliptic`; Mathlib `WeierstrassCurve.Affine.Nonsingular`.

The intended declarations are:

- `TauCeti.BSD.fixture_32_elliptic` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A proof of Equation alone does not construct a Mathlib affine point.

### 14.10 Rational five-torsion theorem-range test

fixture11 has good ordinary reduction at p=5, with #E(𝔽₅)=5 and a₅=1, and the actual point11 gives a rational cyclic 5-isogeny kernel. Its character is 1 at G₅. Therefore Keller–Yin’s good Eisenstein hypotheses apply and CGS’s local exclusion fails. Once the certified rank-zero analytic bound is supplied, the 5-part of the actual BSD defect vanishes by ky-eisenstein-prime-bsd.

Reduce the nonsingular model modulo 5; enumerate its four affine points and O exactly. Use point-11-order to construct the rational kernel/isogeny via EllipticCurves Layer 1, and read the trivial Galois action. Apply ky-eisenstein-prime-bsd with analytic-fixture-enclosures. Check Δ=−11 gives good reduction and a₅ is a 5-adic unit.

The source comparison is [Keller–Yin (v2)](https://arxiv.org/pdf/2402.12781v2), §0.3, p.5, example 11a3; Theorem C.

*Needs:* EllipticCurves worked examples; Layers 1–2 and 6; §14.8 (certified central values for the three fixtures); §12.8 (keller–yin good eisenstein prime-part bsd); TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 3.

The intended declarations are:

- `TauCeti.BSD.fixture_11_good_five` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- No local torsion-free control formula may be substituted in this example.

### 14.11 Fixture periods, heights and regulator conventions

On fixture11, c∞=1, and on fixture37 and fixture32, c∞=2. Their actual BSD real periods are Ωfull=c∞Ωpositive. Rank zero gives Reg_BSD=1 using the existing Tau Ceti rank-zero regulator theorem; the convention adapter Reg_BSD=2^r Reg_Tau has no effect at r=0 and doubles the rank-one regulator. On fixture37, if point37 is a saturated generator, Reg_BSD=h_BSD(point37); replacing it by 2point37 multiplies the point height by four and must not replace the regulator of the full lattice.

Actual rank certificates, invariant differentials, and a saturated free generator in rank one.

Use the discriminant signs with GZ.0 real-period-components. Apply Tau Ceti’s regulator_eq_one_of_finrank_eq_zero under its actual finitely-generated PointModTorsion hypotheses; import GZ.0’s convention dictionary rather than replanning the regulator. Use Layer 7’s free-index formula and rank-one saturation to compute the actual regulator; count c∞ only once.

The source comparison is [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed p.236, infinite cyclic rational group and free generator of the 37 curve.

*Needs:* EllipticCurves worked examples; Layers 1–2 and 6; §14.7 (32a2 discriminant calculation); §13.5 (certified free lattice and saturation index); GrossZagierAndArithmeticHeights GZ.0 / real-period-components; GrossZagierAndArithmeticHeights GZ.0 / height-convention-dictionary; Tau Ceti `WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`.

The intended declarations are:

- `TauCeti.BSD.fixture_period_height_comparisons` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A missing real-component factor is detected on both Δ>0 fixtures; a missing factor two in rank-one pairing is detected on fixture37.

### 14.12 Rank equality comparison example

The actual fixtures have algebraic/analytic ranks 0,1,0 by applying Layer 6 to the certified analytic bounds.

The exact certificates and source hypotheses listed by the preceding comparisons.

Apply the imported rank theorem to each actual curve.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §14.8 (certified central values for the three fixtures); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite).

The intended declarations are:

- `TauCeti.BSD.rank_equality_example` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

### 14.13 Whole Sha finiteness comparison example

The whole Sha groups of the three actual fixtures are finite, independently of any exact cardinality certificate.

The exact certificates and source hypotheses listed by the preceding comparisons.

Apply Layer 6’s whole-Sha conclusion; no finite index or p-primary datum replaces it.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §14.8 (certified central values for the three fixtures); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite).

The intended declarations are:

- `TauCeti.BSD.whole_sha_finiteness_example` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

### 14.14 Actual 32 fixture point

Define point32 by the actual Mathlib Affine.Point.some constructor at (0,0), using fixture-32-elliptic. Its additive order is 2 (zero denotes infinite order). Addition gives 2P=O; the other nonzero rational 2-torsion points are (1,0),(−1,0).

Construct Point.some from the Nonsingular proof; import the existing AddCommGroup law. Evaluate the Weierstrass chord/tangent law at the listed points, taking all denominator and exceptional cases into account. For 37 transport by X=4x,Y=8y+4 to the short integral model Y²=X³−16X+16 and use Lutz–Nagell on X(8P)=84/25; for 11 and 32 use the listed order and nonidentity tests.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators.

*Needs:* §14.9 (32a2 ellipticity and affine point domain); Mathlib `WeierstrassCurve.Affine.Point`; TauCetiRoadmap EllipticCurves Layer 2; Mathlib `orderOf`.

The intended declarations are:

- `WeierstrassCurve.BSD.point32_nonzero` — P≠O
- `WeierstrassCurve.BSD.point32_order` — addOrderOf P=2
- `WeierstrassCurve.BSD.point32_coordinates` — P is the actual point (0,0) on fixture32

**Checks.**

- 2P=O
- (−1,0),(0,0),(1,0) are distinct nonzero 2-torsion points
- (1,0)+(−1,0)=P
- All points and multiples refer to the specified model.

### 14.15 Fixed prime BSD comparison example

For fixture11 at p=5, the KY theorem proves the actual prime part despite rational 5-torsion. A generic fixed-prime endpoint retains the named branch and its hypotheses, including every reduction/ramification exception.

The exact certificates and source hypotheses listed by the preceding comparisons.

Use the range-tested KY instance; do not infer all primes from this one instance.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §14.10 (rational five-torsion theorem-range test); §13.18 (source-qualified fixed-prime dispatch).

The intended declarations are:

- `TauCeti.BSD.fixed_prime_example` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

### 14.16 Order of the 32 fixture point

For the actual point32, addOrderOf point32=2.

Use the concrete multiples and nonidentity tests of point-32. For 37 first transport by X=4x,Y=8y+4 to Y²=X³−16X+16, then invoke Lutz–Nagell on X(8P)=84/25; for finite prime order, rule out order one.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators.

*Needs:* §14.14 (actual 32 fixture point); TauCetiRoadmap EllipticCurves Layer 2; Mathlib `orderOf`.

The intended declarations are:

- `TauCeti.BSD.point_32_order` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Infinite order is distinguished from a missing order calculation.

### 14.17 CM and additive dyadic fixture

For fixture32, exact local minimality and the dyadic Tate algorithm give conductor 32, Kodaira type III at 2 and c₂=2; all other c_ℓ=1. The automorphism (x,y)↦(−x,iy) over ℚ(i) squares to [−1], and the imported characteristic-zero endomorphism classification identifies End(E_ℚ̄)=ℤ[i]. Thus this actual CM curve is not semistable. Its full rational torsion group is (ℤ/2)², established from the three displayed points and reduction bounds.

Replay the residue-characteristic-two minimality and Tate-algorithm trace, not the ℓ≥5 classification. Verify the automorphism on the actual equation, its group-law compatibility and square; use the CM endomorphism-ring theorem. Combine point32 and the other two roots with prime-to-good-reduction torsion bounds at two odd good primes to exclude further rational torsion.

The source comparison is [John E. Cremona](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, p.111, row 32A2.

*Needs:* §14.4 (concrete 32a2 weierstrass model); §14.16 (order of the 32 fixture point); §13.6 (local tamagawa certificate adapter); TauCetiRoadmap EllipticCurves Layer 2; TauCetiRoadmap EllipticCurves Layer 3; ComplexMultiplicationAndExplicitReciprocity CM.1.

The intended declarations are:

- `TauCeti.BSD.fixture_32_cm_additive` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The good-Eisenstein BSD theorem is not used at the bad prime 2.

### 14.18 Finite descent and saturation for the three fixtures

Construct replayable arithmetic certificates for fixture11, fixture37 and fixture32 proving respectively rank/torsion/Tamagawa data (0,5,1), (1,1,1), (0,4,2), with point37 a saturated free generator. A full-Sha certificate additionally supplies a proved annihilator B of the whole Sha group and complete Selmer presentations for every p^n needed by B; the target Sha order is 1 in each fixture. This target must be derived, not read from analytic-Sha tables. If an annihilator or a primary presentation is absent, only the certified primary components are output.

Actual models and points; exact local traces, descent presentations, rank and saturation bounds; a proved whole-Sha exponent bound for any whole-Sha assertion.

Use analytic-fixture-enclosures and Layer 6 for rank equality and whole-Sha finiteness, but not an effective exponent bound. Apply the Selmer-cardinality and Sha-annihilator adapters to each required p^n; finite Selmer computations with an unproved exponent do not finish this step. Replay local-tamagawa-certificate-adapter and the torsion/reduction computations; use mordell-weil-saturation-adapter on point37. Gross Theorem 1.3 bounds Sha by tI² with exceptional power of 2; retain that factor, and use actual 2-primary descent if necessary. Gross Conjecture 1.2 is not used as a theorem.

The source comparison is [Benedict H. Gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed pp.235–239, Conjecture 1.2 versus Theorem 1.3.

*Needs:* §14.8 (certified central values for the three fixtures); EllipticCurves worked examples; Layers 1–2 and 6; §14.17 (cm and additive dyadic fixture); §6.4 (analytic rank at most one: rank equals analytic rank and sha is finite); §13.4 (finite selmer cardinality and sha torsion); §13.11 (certified sha annihilator and finite descent); §13.5 (certified free lattice and saturation index); §13.6 (local tamagawa certificate adapter).

The intended declarations are:

- `TauCeti.BSD.fixture_finite_arithmetic` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- A 2-Selmer rank bound alone does not certify the odd primary components or the whole Sha order.

### 14.19 Full BSD certificate comparison examples

For each actual fixture, its proved complete prime certificate yields the full leading-term formula. Construct this certificate only after exact modular-symbol or Gross–Zagier/period/free-index comparison, finite arithmetic certificates and every exceptional valuation are available. This application is conditional on those concrete replayed inputs; it is not proved by rank equality or Sha finiteness alone.

The exact certificates and source hypotheses listed by the preceding comparisons.

Compute the actual rational defect with exact analytic/arithmetic comparisons. Use exceptional-prime-part-adapter at every prime in its canonical support and construct PrimeValuationCertificate. Apply elliptic-endpoint.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §14.18 (finite descent and saturation for the three fixtures); §14.11 (fixture periods, heights and regulator conventions); §14.6 (five-isogeny and torsion-square comparison); §13.14 (exceptional-prime leading-term certificate adapter); §13.21 (full leading term under the actual defect certificate).

The intended declarations are:

- `TauCeti.BSD.full_bsd_example` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

### 14.20 Missing exceptional prime regression

In an actual fixture proof, deleting the dyadic or any other exceptional localZero entry invalidates the full-formula application unless a separate proof recovers it. The positive rational countermodels q=2 and q=1/4 have zero valuation at every odd prime and nonzero dyadic valuation; their certificate type is empty. Thus odd-prime results and whole-Sha finiteness alone cannot satisfy the final gate.

Use dyadic-gate and the exact positive rational countermodels. Check the full-bsd-example dependency still requires all support-covered entries, including the bad additive prime 2 for fixture32.

This is a consequence of the preceding definitions and comparisons, with the proof obligations stated here.

*Needs:* §14.3 (the remaining dyadic equality under all odd-prime equalities); §14.19 (full bsd certificate comparison examples); §14.17 (cm and additive dyadic fixture).

The intended declarations are:

- `TauCeti.BSD.missing_exception_fixture` — The stated conclusion with exactly the hypotheses above.

**Checks.**

- Removing one undecided exceptional prime must fail the certificate construction.

### Examples

The comparison curves have target analytic ranks 0,1,0. The rigorous intervals are (1/4<L(11a3,1)<3/10), (1/4<L'(37a1,1)<1/3) and (3/5<L(32a2,1)<7/10), with the root-number certificate forcing L(37a1,1)=0. Each interval must include all finite-sum rounding errors and the explicit infinite tail. The arithmetic targets are respectively (rank,torsion,Tamagawa)=(0,5,1),(1,1,1),(0,4,2). The target whole-Sha order one requires its own annihilator and complete primary descent proofs.

For a proposed full proof on 32a2, deleting the dyadic valuation entry prevents certificate assembly unless another proved branch supplies it. All odd-prime equalities can hold for the positive rational countermodels 2 and 1/4, so no conclusion about the complete formula can be inferred from those odd equalities alone. The rank-equality, whole-Sha and fixed-prime applications remain distinct even while the full arithmetic replay is unfinished.

### Dependencies

Earlier comparisons: §0.1, §0.2, §1.1, §6.4, §12.8, §13.3, §13.4, §13.5, §13.6, §13.7, §13.11, §13.14, §13.15, §13.18, §13.19, §13.21. Supplier interfaces: ComplexMultiplicationAndExplicitReciprocity CM.1; ComputationalNumberTheory CN.4; EllipticCurveModularity R29.6, using the pinned entire-extension interface; EllipticCurves worked examples; Layers 1–2 and 6; GrossZagierAndArithmeticHeights GZ.0 / height-convention-dictionary; GrossZagierAndArithmeticHeights GZ.0 / real-period-components; Mathlib `Nat.Prime.dvd_iff_eq`; Mathlib `Nat.forall_prime_iff_two_and_odd`; Mathlib `WeierstrassCurve.Affine.Nonsingular`; Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `WeierstrassCurve.IsElliptic`; Mathlib `WeierstrassCurve.Δ`; Mathlib `WeierstrassCurve`; Mathlib `orderOf`; Mathlib `padicValNat.eq_zero_of_not_dvd`; Mathlib `padicValRat.of_nat`; Tau Ceti `WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`; TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 2; TauCetiRoadmap EllipticCurves Layer 3; TauCetiRoadmap ModularForms Layer 7.

## Mathematical boundaries and refinements

The arbitrary ramified local-prescription branch requires the original Friedberg–Hoffstein [Theorem B](https://annals.math.princeton.edu/1995/142-2/p04) (Annals of Mathematics 142 (1995), 385–423) and a compatible nonempty local prescription. The coprime conductor formula cannot be used at a ramified conductor prime. In particular a Castella auxiliary twist ramified at q is additive at q; the unramified Skinner rank-zero route must not be asserted there. Similarly coprimality of an auxiliary discriminant with Np does not prove BSTW's ordinary-support condition for a supersingular twist. The direct semistable BSTW rank-one route has its own hypotheses.

The exact dyadic period exponent, ramified/dyadic Tamagawa comparison and Birch–Stephens dyadic root calculation require their local proofs. Odd-primary comparisons do not supply these. Integral modular-degree comparisons require the actual localized multiplicity-one/freeness hypotheses, geometric component multiplicities and definite/indefinite parity. Rational automorphic realizations and a nonsplit rational component count do not replace them.

The higher-weight Castella argument requires a uniformizer-integral Kolyvagin bound for the actual self-dual lattice, including augmentation, the vanishing of its representation-dependent errors in the irreducible case, and the precise imprimitive projection. Its local automorphic-type comparison and the stronger Fouquet–Wan hypotheses must be discharged. BSTW's printed Proposition 9.18 proves the ordinary comparison and leaves the signed proof implicit; the signed Poitou–Tate, image-index and cyclotomic non-torsion proofs are targets of the early signed layer. Their integral lattice and Coleman images are further obligations of the completed signed argument.

The Eisenstein path requires the source-specific integral Wüthrich, early Heegner and actual KLZ reciprocity exports. For Keller–Yin, the Introduction's integral index-square equality and §3.0.8's printed Λᵃᶜ have an unresolved coefficient-ring comparison. The index-square interface below retains the rationalized conclusion until an integral two-way comparison retains and removes the actual p-power transfer factors. The integral Greenberg equality and the printed BSD theorem remain separate targets. Keller–Yin's short cyclotomic substitution proof also requires checking control, finite-submodule and reciprocal-image statements on its actual chosen lattice; the narrower CGS local-character hypotheses cannot simply be erased.

The numerical intervals, saturated generators, effective whole-Sha annihilators and exact fixture Sha orders below are proof targets for replayable proofs. A floating-point central value, an analytic-Sha table or abstract finiteness supplies none of those certificates. Where only some primary descent presentations have been proved, only those primary components are output. The full fixture formula is applied after complete support coverage has been proved.

## Downstream applications

Export the analytic-rank-at-most-one rank and whole-Sha theorem to arithmetic applications independently of any exact-order result. Export integral signed and Eisenstein main conjectures to ModularIwasawaMainConjectures L6 and the later Heegner reexports, preserving their normalization and coefficient rings. Export source-qualified prime-part instances and complete certificates to individual elliptic-curve calculations and explicit families. The certificate interface exposes the exceptional set, outside-prime theorem, local proofs and actual positive defect identity; it enables a consumer to audit every missing prime.

## References

- Dimitar Jetchev, Christopher Skinner and Xin Wan, [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://arxiv.org/abs/1512.06894v1). arXiv:1512.06894v1 (2015); published in Cambridge Journal of Mathematics 5 (2017), no. 3, 369–434.
- Christopher Skinner, [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1). arXiv:1407.1093v1 (2014); published in Pacific Journal of Mathematics 283 (2016), no. 1, 171–200.
- Francesc Castella, [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://arxiv.org/abs/1704.06608v2). arXiv:1704.06608v2; published in Cambridge Journal of Mathematics 6 (2018), no. 1, 1–23.
- Francesc Castella, [Erratum to “On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes”](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf). Author's homepage erratum (2024), 5 pages.
- Ashay Burungale, Christopher Skinner, Ye Tian and Xin Wan, [Zeta elements for elliptic curves and applications](https://arxiv.org/abs/2409.01350v2). arXiv:2409.01350v2 (11 September 2024).
- Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein, [Nonvanishing theorems for L-functions of modular forms and their derivatives](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf). Inventiones Mathematicae 102 (1990), 543–618 (GDZ scan).
- Ashay A. Burungale and Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2). arXiv:2506.03465v2 (October 2025); Annals of Mathematics 203 (2026), no. 1.
- Christopher Skinner and Wei Zhang, [Indivisibility of Heegner points in the multiplicative case](https://arxiv.org/abs/1407.1099v1). arXiv:1407.1099v1 (2014).
- Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290 (Numdam).
- Robert Pollack and Tom Weston, [On anticyclotomic μ-invariants of modular forms](https://arxiv.org/abs/math/0610694v1). arXiv:math/0610694v1; published in Compositio Mathematica 147 (2011).
- Benedict H. Gross and Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Inventiones Mathematicae 84 (1986), 225–320 (GDZ scan).
- Benedict H. Gross, [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf). L-functions and Arithmetic (Durham, 1989), LMS Lecture Note Series 153 (1991), 235–256.
- Chris Birkbeck (Tau Ceti), [TauCeti/NumberTheory/LSeries/EntireExtension.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/EntireExtension.lean). Tau Ceti at f790474.
- Tau Ceti contributors, [TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean). Tau Ceti at f790474.
- Thomas Browning (Mathlib), [Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean). Mathlib at 082e2d3.
- Mathlib contributors, [Mathlib/Analysis/Analytic/Order.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Order.lean). Mathlib at 082e2d3.
- Tau Ceti contributors, [Roadmap: modular forms (Tau Ceti), Layers 6–7](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularForms/README.md). content/tau-ceti/ModularForms/README.md in this repository.
- Jetchev, Skinner and Wan, [The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one](https://archive.ymsc.tsinghua.edu.cn/pacm_download/253/8639-CJM_05_03_A02.pdf). Cambridge J. Math.5 (2017),369–434.
- Francesc Castella, [On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2018/0006/0001/CJM-2018-0006-0001-a001.pdf). Cambridge J. Math.6 (2018),1–23.
- Francesc Castella, Giada Grossi, Christopher Skinner, [Mazur's main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2). arXiv:2303.04373v2, 15 October 2025; the cited version.
- Olivier Fouquet and Tadashi Ochiai, [Control theorems for Selmer groups of nearly ordinary deformations](https://www.math.titech.ac.jp/top/~ochiai/ControlF-O.pdf). Author-hosted ControlF-O.pdf; pagination of this copy, accessed 2026-10-10.
- Olivier Fouquet and Xin Wan, [The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3). arXiv:2107.13726v3 (8 April 2022).
- Mathlib contributors, [p-adic Valuation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean). Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- Mathlib contributors, [Prime numbers: finite sets of factors](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean). Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- Mathlib contributors, [Prime numbers](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean). Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
- Timo Keller, Mulun Yin, [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2). arXiv:2402.12781v2, 30 October 2024; preprint, not a verified published version.
- Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf). Inventiones mathematicae 227 (2022), 517–580; published author PDF.
- Christian Wüthrich, [On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://ems.press/content/serial-article-files/26230?nt=1). Documenta Mathematica 19 (2014), 381–402; DOI 10.4171/DM/450.
- John E. Cremona, [Algorithms for Modular Elliptic Curves: chapter2](https://johncremona.github.io/book/fulltext/chapter2.pdf). Second edition (1997), corrected author online edition.
- John E. Cremona, [Algorithms for Modular Elliptic Curves: chapter3](https://johncremona.github.io/book/fulltext/chapter3.pdf). Second edition (1997), corrected author online edition.
- John E. Cremona, [Algorithms for Modular Elliptic Curves: examples](https://johncremona.github.io/book/fulltext/examples.pdf). Second edition (1997), corrected author online edition.
- John E. Cremona, [Algorithms for Modular Elliptic Curves: Table 1](https://johncremona.github.io/book/fulltext/table1.pdf). Second edition (1997), corrected author online edition; rows are comparison data, not proofs.
- John E. Cremona, [Algorithms for Modular Elliptic Curves: Table 4](https://johncremona.github.io/book/fulltext/table4.pdf). Second edition (1997), corrected author online edition; numerical/analytic Sha entries are not proofs.
