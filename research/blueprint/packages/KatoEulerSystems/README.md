# Roadmap: Kato's Euler systems

Construct the cyclotomic zeta classes of a modular eigenform from normalized
theta units on elliptic curves. The construction passes through Siegel units,
ordered symbols in the K₂ of open modular curves, étale Chern moments, and
explicit reciprocity. Its endpoints are the rational Kato zeta morphism,
the full-level and twist-one versions of that morphism, and the upper
divisibility in the cohomological and ordinary main conjectures. The elliptic
specialization gives finite generation over the cyclotomic tower and a
rank-zero upper bound for the p-primary Tate–Shafarevich group.

## Scope and ownership

This roadmap owns the particular normalized units, their particular K₂
symbols, the modular zeta classes, their normalization comparisons, and the
application of Euler-system bounds to those classes. It owns neither a
generic Euler-system machine nor a generic regulator. **EulerSystemsAndKolyvaginSystems**
ES.2, ES.4 and ES.8 supply the conductor carrier, finite-level bounds and
Iwasawa bounds. **PadicHodgeRegulators** L1, L3 and D.2 supply the dual
exponential, vector/scalar regulators, Coleman maps and big-local-field
reciprocity. **SelmerIwasawaCohomology** L0–L3 supplies continuous arithmetic
cohomology, Selmer conditions, twisting and duality. The construction here
identifies the actual geometric classes to which these machines apply.

**AlgebraicVectorBundles** L0B and L0C supply tensor, dual,
symmetric-power and determinant operations on vector bundles. The integral
local-system comparisons below use those operations and keep their actual
coefficient lattices; they do not plan the generic bundle operations again.

The **ModularCurves** roadmap supplies elliptic curves, Cartier
divisors, Picard duality, multiplication maps and full ordered level bases.
Its **Part II** supplies the analytic/algebraic and coefficient comparisons.
The **ModularForms** roadmap supplies modular forms, normalized
Eisenstein series and analytically continued L-functions. The
**EllipticCurves** Layers 4 and 6 supply local reduction/formal groups and
the finite-level Mordell–Weil theorem. These subjects are used at their
interfaces below. **ModularSymbolsPadicLFunctions** owns modular-symbol
period lines, the rational Drinfeld–Manin splitting, analytic distributions
and their noncritical or family uniqueness principles.

Generic scheme K₂ products and transfers belong to **SchemeKTheoryOperations**
and **K2SymbolsBrauer**, while finite étale Chern maps and the real regulator
belong to **MotivicEtaleKTheory**. Tau Ceti field Kummer classes,
field restriction/norm compatibilities, continuous cup products and field
Steinberg relations are deferrals, not new targets here. They do not provide
the scheme K₂ symbol or a Chern character on an open modular curve. The
particular symbol computations below differ by their curve, ordered
torsion sections, integral coefficients and trace normalization.

**AutomorphicGaloisRepresentations** R19.1, R19.3 and R19.5 own eigenform
realizations, image theorems and p-adic Hodge properties. **CompletedCohomologyAndLocalGlobalCompatibility**
R31.2 owns the completed Borel–Moore-to-classical moment map. The full-level
classes here are its particular inputs. **PadicMeasuresIwasawaAlgebras** L4
owns the completed group ring, characteristic ideals and support arguments.

No reverse divisibility or BSD equality is an endpoint. CM module structure
requires the early elliptic-unit input specified below; the CM equality is
outside the scope. Critical-slope equality is a conditional comparison of
compatible families. This roadmap supplies no arithmetic family from a
single critical fiber. **PadicFamilies** consumes these classes and is not
a prerequisite for constructing them. **EllipticRegulators** imports the
normalized units from Layer 0 rather than constructing them again.

## Conventions

Let f be a normalized newform of weight k≥2, level N and nebentypus ε. Put
F=ℚ(a_n), choose λ|p, write E=F_λ and O=O_λ, and fix compatible roots
ζ_{p^n}, complex and p-adic embeddings, and the resulting cyclotomic
character κ. A stable lattice means an O-lattice in the specified
cohomological realization V(f), with continuous Galois action. The dual
form is f*=∑ conjugate(a_n)q^n; it is kept distinct from f, even when they
coincide in a particular example. Arithmetic Frobenius is denoted Fr_ℓ.
All inverses of σ_ℓ refer to the action on the named cyclotomic coefficient
algebra, not to replacement of arithmetic Frobenius by geometric Frobenius.

Write G∞=Gal(ℚ(ζ_{p∞})/ℚ), Λ=O[[G∞]] and Λ_ℚ=Λ[1/p]. This localization
is not a field. On odd-prime tame character components one may use the
usual power-series description. At two retain the full algebra and its
finite tame part; integral plus/minus projectors cannot be obtained by
dividing by two. Statements about height-one primes always specify whether
primes above p are excluded. Torsion means annihilation elementwise by
regular elements of the indicated ring; no domain hypothesis is hidden
in a semilocal statement.

Use Kato's theta divisor c²[0]−E[c], with auxiliary integers
c,d≥2 prime to six; impose the additional level/prime coprimalities
at each construction. The unit lives
on E\E[c]; norms push divisors forward and pullbacks pull them back.
At c=5,a=2 a nonzero point of E[2] has coefficient zero in the original
divisor and 24 in 25E[2]−E[10]. This fixes the direction of the norm
identity. Torsion pairs are nonzero and are row indices for a universal
ordered column basis. Thus [[1,1],[0,1]] sends (1/5,0) to (1/5,1/5),
whereas its transpose sends that pair to itself. Determinant d sends the
chosen level root ζ_N to ζ_N^d.

Unit groups are multiplicative. In their tensor product with ℚ write
[u] additively, so [uv]=[u]+[v]. The ordered symbol is {u,v}; its étale
Chern character is Kummer(u) cup Kummer(v). In Kato's notation
c_(2,2)({u,v}) is the negative of that product and ch_(2,2)=−c_(2,2).
The two ordered degree-one slots have the sign witnessed by det(e₁,e₂)=1
and det(e₂,e₁)=−1. Inverting both entries leaves the K₂ symbol unchanged;
inverting only one negates it.

The moment uses T_pE≃H_p(1), where H_p is the cohomological local system.
The total twist is 2−r+(k−2)=k−r. Weight two and r=1 therefore give twist
one; weight four and r=1 give twist three. Literal duals of integral
symmetric powers are retained. Their identification with ordinary
symmetric powers is rational, or requires (k−2)! invertible. In degree
two at p=2 the middle binomial coefficient is a nonunit; it cannot be
removed by a rational self-duality formula.

The untwisted Kato map obeys z(ιγ)=−σ_{−1}z(γ). Nakamura's twist-one map
obeys the positive relation after both twists. For a linear map z, the
composite (−id)∘z∘(−id) sends x to z(x), fixing this cancellation. Critical
periods use sign (−1)^(k−r−1)χ(−1): at k=2,r=1 the even character chooses
plus and the odd character minus; at k=4,r=2 an even character chooses
minus. Gauss sums are G(χ,ζ)=∑χ(b)ζ^b, with the character inversion in the
interpolation formula kept explicit.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib `Units` and `Units.map` for ring units and their functoriality;
`UpperHalfPlane`, `ModularForm`, `CuspForm` and `DirichletCharacter` for
analytic carriers; `AlgebraicGeometry.Scheme` for the scheme carrier;
`PadicInt` for ℤ_p, with `Fact p.Prime`; and `PowerSeries` for integral
formal expansions. Fractional analytic q powers need the chosen
exponential branch; they are not powers of the formal variable in an
ordinary power-series ring. `LSeries` is a total tsum and supplies no
analytic continuation at critical integers by itself.

Use Mathlib `LinearMap`, `Submodule`, `Submodule.span`, `Module.Dual`,
`Module.Basis.constr`, `Module.IsTorsion`, `Module.IsTorsionFree`,
`Module.Finite` and `Matrix.GeneralLinearGroup` at their stated algebraic
generality. Mathlib `Module.IsTorsion` and `Module.IsTorsionFree` both use regular
scalars. The latter requires multiplication by a regular ring element
to act injectively on the module; for modules over a commutative ring
this is equivalent to zero `Submodule.torsion`. Use these predicates
directly on the full group ring as well as on its domain components.
The stronger condition forbidding annihilation by every nonzero scalar
agrees with torsion-freeness over a domain, but fails for the free
rank-one module over ℚ×ℚ: (1,0)(0,1)=0 although both factors are nonzero.
Mathlib nevertheless gives `Module.IsTorsionFree (ℚ×ℚ) (ℚ×ℚ)`.
Suggested.lean checks both facts, distinguishing regular scalars from
arbitrary nonzero scalars. In particular `Module.Dual R M` is `M →ₗ[R] R`, and
`Module.Finite ℤ M` is finite generation, not finite cardinality. The
representative linear maps in Suggested.lean are ingredients of the
arithmetic constructions, not assertions that arbitrary linear maps
satisfy explicit reciprocity.

Tau Ceti `FieldTheory/GaloisCohomology/Kummer` at `a91d3aaf` supplies
`TauCeti.kummerMap`, `TauCeti.kummerIso`, `TauCeti.kummerRes_kummerMap` and
`TauCeti.kummerCor_kummerMap` for fields, with n invertible for the Kummer
isomorphism and finite extension for corestriction/norm. Its continuous
cohomology modules supply the class maps, cup products and restriction
machinery. Those field statements are useful consistency checks on the
scheme Chern normalization; extension to the modular scheme, trace and
Hochschild–Serre limit still requires the contracts below.

### Curves, symbols and realizations

From **ModularCurves** 0a, 2a, 2d, 2e and 5b use relative effective Cartier
divisors, finite locally free isogeny norms with their divisor pushforward,
Abel/Pic⁰ duality, the integral Weil pairing, and fine full ordered bases
over ℤ[1/N] with pairing component and universal torsion sections. From
**ModularCurvesPartII** R12.2, R12.3, R12.6 and R13.3 require the exact
analytic/algebraic quotient, compactification and cusp widths,
determinant action on constants, and the integral Tate chart with
parameter q^(1/N).

From **ModularCurvesPartII** R14.1 require finite locally free level maps,
K₂ transfers and Hecke/diamond actions for the two-index curve Y(M,N),
including primes dividing N that are allowed in Kato 2.4. A Γ₁-only
correspondence is insufficient. R14.3 must give finite-coefficient étale
cohomology and higher-degree vanishing on the open affine curve, quotient
descent, traces, and the logarithmic de Rham comparison with cusp boundary
and Sym^(k−2)H coefficients. Its critical filtration step is the full
M_k(X), including Eisenstein forms. A parabolic realization does not
provide that open-curve statement.

From **SchemeKTheoryOperations** require the product K₁×K₁→K₂, finite
flat transfer, pullback and the projection formula. From **K2SymbolsBrauer**
T2–T3 use unit-symbol bilinearity and identity-entry relations. From
**MotivicEtaleKTheory** M.8 require the finite étale ch_(2,2) on scheme
K₂, its ordered Kummer-cup comparison and transfer compatibility. The
real Deligne/Beilinson regulator with ℝ(2) coefficients on a smooth
complex open curve is a further exact export of M.8, not a consequence
of its finite étale Chern map.

From **AutomorphicGaloisRepresentations** R19.1 require the rank-two
cohomological newform quotient, parity, dual-form/Poincaré dictionary and
strictly compatible local factors. R19.5 must give the chosen
de Rham/crystalline realization, Frobenius eigenline and weak-admissibility
comparison. R19.3 must retain Ribet's inner-twist quaternion algebra and
its local splitting. Open SL₂ in the cyclotomic image follows on the
split branch; full integral SL₂ holds at almost all coefficient places.
The every-place rational weak-Leopoldt and divisibility argument at a
division place is an additional unsupplied input. Quaternion-valued
openness gives no nontrivial unipotent there. Separately require the
elliptic Serre exports: open GL₂ at each p, surjectivity for almost all p,
and finite torsion over the cyclotomic tower.

From **CompletedCohomologyAndLocalGlobalCompatibility** R31.2, using
**CompletedCohomologyPartII** CC.6 and CC.7, require the actual map

```text
Sym^(k−2)(ℤ_p²)^* ⊗_{ℤ_p[[K_m]]} H₁^BM(K^p(N₀))(1)
  → H¹(Y(N), V^*_{k/ℤ_p})(2).
```

It must preserve the literal dual, Hecke action, coefficient change and
conductor/level maps (Nakamura Lemma 2.10, pp.200–202; §3.1.4,
pp.208–214). An integral isomorphism is not required.

### Cohomology, periods and regulators

From **SelmerIwasawaCohomology** L0 require finite continuous cohomology,
Shapiro, traces, Hochschild–Serre edges and coefficient limits. L2 supplies
the elliptic and ordinary Selmer instances and finite/Poitou–Tate exact
sequences. L3 must additionally identify the modular étale/Galois
Iwasawa complex, the strict dual Selmer module with the global-to-local
H² kernel, and the Euler-characteristic/torsion-free/rank-one passage.
Character components and the semilinear twist must work at all primes,
with global twist, specialization and localization commuting using the
same roots. The cohomology constructor alone does not supply these
comparisons.

For the parabolic full-level result L3 must export Nakamura Lemma 3.4,
p.221: on X(N),j_*V_k, the conductor Iwasawa H¹ is Λ_n-torsion-free at
every integer twist and its twist-one inverse-limit local exponential
into the trace-compatible cusp-form system is injective. This exact
global comparison remains an input; no analogous open-curve injectivity
is assumed. For the elliptic endpoints L3 must also export Greenberg's
no-finite-submodule criterion and integral ordinary control with local
torsion exclusions and the (1−α^(−1))² restriction-cokernel factor.

From **ArithmeticGaloisDuality** D7 require the local Tate/Pontryagin
pairing with the invariant-inertia cokernel dual to residue H¹;
corestriction is adjoint to restriction. The cyclotomic residue-field
union must have p-cohomological dimension zero. These exact properties,
not a slogan about local duality, prove the S-integrality of the limit.

From **ModularForms** Layer 0 require the normalized Kato E^h_(α,β) and
F^h_(α,β), rational q-expansions and index/determinant action, including
E¹=F¹, dlog(g)=−F², regularized E², and
cF^h=c²F^h−c^(2−h)F^h_(cα,cβ),
cE^h=c²E^h−c^hE^h_(cα,cβ). Layer 7 must supply continued L-functions,
Euler factors, functional equations and the operator-valued Hecke
normalization. From **ModularSymbolsPadicLFunctions** L0 require the
integration/Poincaré period pairing, Ash–Stevens generators and rational
Drinfeld–Manin splitting; L1 supplies the differential, period, Gauss-sum,
character-inversion and U_p dictionary; L2 supplies admissible analytic
distributions and small-slope uniqueness.

From **PadicHodgeRegulators** L1 use the generic dual exponential with
its Tate-pairing normalization. L3 supplies vector regulator, growth,
interpolation, scalar projection and Coleman map. Its exact de Rham
extension must have D_crys(V*(1))⊂F⁰D_dR(V*(1)), with singular Euler
operators on their stated domains. Its integral ordinary image must
retain the good differential/lattice of Kato 17.5 and kernel/cokernel
corrections of 17.8–17.10. The inspected crystalline/growth/Coleman
exports are odd-prime statements; the dyadic version is an additional
input for each all-prime assertion below. D.2 must supply the
non-perfect-residue-field reciprocity used in Kato §10 and the exact
comparison square (10.9.5), proved through §11. A finite-residue-field
syntomic exponential does not replace it.

### Euler-system bounds and support

From **EulerSystemsAndKolyvaginSystems** ES.2 require its existing
conductor carrier and norm/extensionality API. ES.4 supplies rational and
integral finite-level bounds. ES.8 supplies rational/integral Iwasawa
divisibility, weak Leopoldt, the evaluation index, and the true-Selmer
singular-quotient bound. The rational and integral image packages, their
group of irreducibility, the τ quotient, parity and purity are verified
separately in Layer 4. The strict H² identification is supplied by the
cohomology contract, not by renaming an Euler-system index.

From **PadicMeasuresIwasawaAlgebras** L4 require completed group-ring
localization, characteristic ideals and multiplicativity of lengths.
For Kato 13.12 require the precise full-algebra finite-support theorem:
a finitely generated module annihilated by a regular μ, with Λ/μΛ
p-torsion-free and zero localization at every height-one prime, is finite
as an abelian group. This is required also at p=2. Finite quotient and
equality of submodules are different conclusions.

The early CM elliptic-unit contract is not attached to an owner
layer. It must supply H² torsion and H¹ rank one at every p, including
p=2 and K=ℚ(i), and the contained-cyclotomic branch in Kato 15.14.
It must precede the rational Kato map. The additional CM upper bound
requires the elliptic-unit specialization/local-length comparison of
15.13–15.17 and the one-direction input of 15.2. An equality involving an
already constructed Kato map cannot serve as the early contract. The
all-prime CM assertions below remain conditional on these inputs.

Finally, **ModularSymbolsPadicLFunctions** L3 supplies a comparison
principle at a decent critical point on its specified affinoid
neighborhood, with a dense noncritical locus and nonvanishing compatible
periods. A compatible arithmetic zeta section on that same neighborhood
and its specialization are additional hypotheses.

## How to read the build

Layers 0–2 construct the geometric classes before any canonical rational
map exists. Layer 3 computes their modular and archimedean regulators.
Layer 4 proves image and module-structure inputs using those smoothed
classes and analytic detection. Only then does Layer 5 construct the
rational morphism and its twist-one transport. Layer 6 compares scalar
regulators and periods, and Layer 7 applies the bounds. This order
separates geometric nonvanishing from nonvanishing of the subsequently
constructed canonical map. Each named theorem is a target to prove from
its stated sources and contracts; an explicitly conditional branch
requires exactly the additional input named there.

## Layer 0: normalized theta and Siegel units

### 0.1 The normalized theta unit

For an elliptic curve E over a scheme S, c≥2 prime to six, construct
`cTheta` in Γ(E\E[c],O)^× with Cartier divisor c²[0]−E[c]. Require
N_a(cTheta)=cTheta for every integer a prime to c. The norm is that of
the finite locally free multiplication map. These two conditions
characterize the unit uniquely (Kato Proposition 1.3(1), p.121;
existence and uniqueness proof 1.10, pp.124–125). The normalization
removes the arbitrary constant in a rational function with this divisor.
Existence is local on S, by the Abel/Pic⁰ description of the divisor;
uniqueness descends those local choices. For the constant quotient of
two candidates, the a=2 and a=3 norm equations force respectively its
third and eighth powers to be one, hence force the constant to be one.

The API is `cTheta_divisor`, `cTheta_norm`, `cTheta_unique`,
`cTheta_isogeny`, `cTheta_auxiliary` and `cTheta_baseChange`. For an
isogeny of degree prime to c, the norm sends the source unit to the
target unit. On E\E[cd], with c,d≥2 prime to six, the auxiliary identity is

```text
cTheta_c^(d²) / [d]^*cTheta_c = cTheta_d^(c²) / [c]^*cTheta_d.
```

Both expressions have divisor c²d²[0]−c²E[d]−d²E[c]+E[cd] and the same
norm normalization. Base change preserves the normalized unit (Kato
1.3(2),(4), pp.121–122; 1.10, pp.124–125). These statements use actual
isogeny norms, not arbitrary maps of unit groups. The representative
`thetaCondition` and `cTheta` in Suggested.lean isolate selection from
existence; their existence/uniqueness input is the output of this
geometric theorem, not its proof.

**Checks.**

- `theta_divisor`: c=5 gives 25[0]−E[5]. The selected unit must have that
  divisor; a construction returning one fails as soon as the divisor is
  nonzero. The representative test retains the prescribed divisor.
- `theta_norm_two`: N₂(cTheta_5)=cTheta_5, since gcd(2,5)=1. Replacing
  the norm by pullback fails the geometric normalization.
- `theta_pushforward_not_pullback`: at a nonzero two-torsion point over
  a characteristic-zero field, [2]^*(25[0]−E[5]) has coefficient 24,
  while 25[0]−E[5] has coefficient zero. The two divisor directions
  cannot be interchanged; the Lean calculation is 0≠25−1.

- For `thetaCondition`, take rational units with divisor equal to their
  rational value and identity norms. One satisfies prescribed divisor one;
  this rejects an always-false predicate.
- With the same divisor and identity norms, minus one fails prescribed
  divisor one. A predicate that keeps only the norm clause fails this test.
- With prescribed divisor one, a norm sending one to minus one fails
  `thetaCondition`. A predicate that keeps only the divisor clause fails.
- With identity norms and uniquely prescribed rational value minus one,
  `cTheta` selects minus one. A constant-one selector fails this instance.

*Needs:* ModularCurves 0a, 2a and 2d with the exact norm/Picard contracts;
Mathlib `Units` and Cartier-divisor group operations.

### 0.2 Torsion evaluation and rational auxiliary independence

For N≥3 work on the fine full-level curve over ℤ[1/N], with universal
ordered basis (e₁,e₂) and a nonzero torsion pair (α,β) of order dividing
N. For c≥2 prime to six and to its torsion order, define `siegelUnit`
as the pullback of cTheta along αe₁+βe₂. This is an integral unit on the
open curve, because the section avoids E[c] (Kato 1.4, pp.122–123).
The API begins with `siegelUnit_pullback` and `siegelUnit_level`: pullback
along an admitted level map preserves the indexed section and its unit.

In rationalized units define the unsmoothed g_(α,β) by dividing
[c-g_(α,β)] by c²−1 for any c≡1 modulo the torsion order, c≥2 prime to
six. The denominator is nonzero in ℚ under the size condition.
`siegelUnit_auxiliary` proves independence of that choice, using the
theta auxiliary identity. It does not assert equality of the integral
c-units for different c. `siegelUnit_smoothing` is

```text
[c-g_(α,β)] = c²[g_(α,β)] − [g_(cα,cβ)].
```

The transparent linear operation `rationalSmoothing c g gc` records
the right-hand side. Its identification with the indexed unit is a
geometric theorem (Kato 1.4–1.5, pp.122–123), not a consequence of the
linear formula alone. For level N|N′ the fine curves and coefficient
maps must be the ones supplied by the modular-curve contract.

**Checks.**

- `siegel_smoothing_five`: when multiplication by five fixes the
  torsion index, rationalSmoothing 5 g g is 24g, including nonzero g.
- `siegel_auxiliary_seven`: when both five and seven fix the index,
  48[c₅-g]=24[c₇-g]. This tests the rational comparison itself.
- `siegel_integral_not_equal`: for g=1 in ℚ the two smoothings are 24
  and 48. Auxiliary independence holds after rational normalization.
- `siegel_identity_pullback`: the identity ring map sends the supplied
  theta unit to itself, including a unit other than one. This rejects
  a constant-one torsion evaluation.

- Pulling back the identity unit gives one, testing `siegelUnit` itself
  rather than only the rational smoothing expression.
- Pulling back an inverse gives the inverse of the pulled-back unit.
  This tests compatibility with the nearest library unit-map operation.

*Needs:* 0.1; ModularCurves 5b; ModularCurvesPartII R12.2 and R12.6;
Mathlib `Units.map` and ℚ-module operations.

### 0.3 Galois action and two-coordinate distribution

Prove `siegelGaloisDistribution` with the full-level convention fixed
above. For σ=[[a,b],[c,d]] in GL₂(ℤ/N), indexed pullback sends the pair
to (aα+cβ,bα+dβ); constants transform by det(σ). Thus the basis action,
the torsion-index action and the pairing component must be transported
together (Kato 1.6, p.123). The helper `torsionIndexAction` records the
row convention as `Matrix.vecMul` over ℚ; the actual finite torsion
action is on (ℚ/ℤ)² and respects admissibility.

For a nonzero integer A and a nonzero pair (α,β), multiplication
distribution multiplies over the A² simultaneous solutions
(α′,β′) with Aα′=α and Aβ′=β. It gives the lower indexed c-unit, provided
c is prime to six, A and the admitted torsion orders. Rationalization
gives the corresponding additive sum (Kato Lemma 1.7(2), p.123).
Both coordinates vary here. Equality of a product over this fiber is
derived from the multiplication norm on the universal elliptic curve;
it does not follow from a product over only second-coordinate roots.

**Checks.**

- The upper shear sends (1/5,0) to (1/5,1/5), whereas the lower
  shear fixes it. Transposing the action changes this value.
- The identity matrix fixes (1/5,2/5), and the diagonal matrix
  diag(2,1) has determinant two, sending ζ_N to ζ_N² when
  two is invertible modulo N. Suggested.lean pins both computations.
- A=1 gives the one-element distribution fiber. A=0 is excluded:
  its fiber is not the finite isogeny fiber used by the theorem.

*Needs:* 0.1–0.2; ModularCurves 5b and ModularCurvesPartII R12.6;
finite locally free multiplication norms and the determinant action.

### 0.4 Analytic product, cusp order and integral descent

For τ in the upper half-plane put q=exp(2πiτ) and define fractional
powers by q^x=exp(2πixτ). Choose 0≤a<N, and require (a,b) modulo N to
be nonzero. The analytic expression representing the rational Siegel
unit is

```text
q^(B₂(a/N)/2)
  · ∏_{n≥0}(1−q^(n+a/N) ζ_N^b)
  · ∏_{n>0}(1−q^(n−a/N) ζ_N^(−b)),
B₂(x)=x²−x+1/6.
```

`siegelAnalyticProduct` establishes convergence, nonvanishing and the
agreement of the smoothed product with the algebraic c-unit. The
unsmoothed expression is understood with the specified rational-unit
normalization and fractional power; it is not asserted to be an
integral global unit without smoothing. The all-zero pair is excluded:
its n=0 factor is zero (Kato 1.3(3), p.122; 1.9, p.124).

Define `siegelLeadingExponent x=B₂(x)/2`. In 1.9, p.124, the printed
last term lacks the square on a; the theta formula and the Bernoulli
comparison after 3.10, p.141, require a²/(2N²). Use this corrected
formula. `siegelCuspOrder` computes the c-smoothed exponent difference
at each cusp after the full-level action. If the cusp width is N and
its parameter is q^(1/N), the order is N times that exponent difference,
not merely the q-exponent. `siegelIntegralDescent` uses the integral
Tate chart, the two-coordinate transformation and normalization to
show the c-unit lies in the integral open-curve unit group after the
admitted torsion primes are inverted. Boundary orders belong to the
compactification; the unit is invertible on the open curve.

**Checks.**

- At x=0 the leading exponent is 1/12; this first index is allowed
  only with a nonzero second index.
- At x=1/2 it is −1/24, and at a=2,N=5 it is −11/300. The latter
  disagrees with the missing-square value −23/300.
- Reflection x↦1−x preserves the exponent. For a cusp of width N,
  multiplying the q-exponent by N is necessary to obtain the order
  in q^(1/N). Suggested.lean checks the rational exponent identities;
  the geometric cusp-order theorem requires the Tate-chart contract.

*Needs:* 0.1–0.3; ModularCurvesPartII R12.3 and R13.3; Mathlib
`UpperHalfPlane` and the chosen exponential branch; ModularForms
Layer 0 for the logarithmic derivative dlog(g)=−F².

### 0.5 The one-coordinate degeneracy product

Prove `siegelDegeneracyProduct` for A≥1 along the degeneracy map whose
analytic description is τ↦Aτ. The product runs over β′ with Aβ′=β,
while α is fixed; it is not the A²-element fiber in 0.3. Assume the
two levels and torsion sections are admitted and c is prime to six,
A and the relevant torsion orders. The identity identifies the
pulled-back lower-level c-unit with that one-coordinate product
(Kato Lemma 2.12, pp.131–132, using 1.7 and the theta product).

The statement allows composite A. A=1 is the identity pullback and
one factor; A=2 gives two second-coordinate roots, and A=4 gives four,
not sixteen. This counting distinction must be preserved when the
analytic identity descends to a finite locally free algebraic level map. Write the exact analytic identity as

```text
c-g_(α,β)(Aτ) = ∏_(Aβ′=β) c-g_(α,β′)(τ).
```

Use the Tate parameter and universal section to identify both sides
before applying the norm on units. Their labels alone do not establish
compatibility of a chosen degeneracy map.

*Needs:* 0.2–0.3; ModularCurvesPartII R12.2 and R14.1 with the two-index
level-map contract; the analytic product in 0.4 for the comparison proof.

### Examples

The c=5 divisor and its multiplication-by-two pullback give a concrete
test of norm direction. The 24 and 48 smoothing factors show why only
the rationalized unit is auxiliary independent. The half-index and
2/5-index Bernoulli values detect the square in the product exponent.
These calculations also fix the inputs for the K₂ smoothing expansion.

### Dependencies

ModularCurves 0a, 2a, 2d and 5b; ModularCurvesPartII R12.2, R12.3,
R12.6, R13.3 and R14.1; ModularForms Layer 0. The algebraic ingredients
are Mathlib units, matrices, ℚ-modules and analytic exponential products.

## Layer 1: ordered symbols and Chern moments

### 1.1 The two-index curve and Beilinson element

For M,N≥2 and M+N≥5, use the supplier's Y(M,N) from the full-level curve Y(L),
where M,N divide L, and quotient by the subgroup with a≡1,b≡0 modulo M
and c≡0,d≡1 modulo N. Its common-level independence and universal injections
ℤ/M×ℤ/N→E are part of the exact
quotient and fine-moduli supplier, rather than treating Y(M,N) as a
synonym for a Γ₁ curve (Kato 2.1, p.125).

For c≥2 prime to 6M and d≥2 prime to 6N, define `beilinsonElement` by
the ordered scheme K₂ symbol

```text
c,d-z_(M,N) = {c-g_(1/M,0), d-g_(0,1/N)}.
```

The unsmoothed z_(M,N) is the rational symbol of the two unsmoothed
units. Auxiliary admissibility is slot specific: c needs M and d needs
N. The API is `beilinsonElement_symbol`, `beilinsonElement_smoothing`,
`beilinsonElement_pullback` and `beilinsonElement_bilinear`, besides the
constructor. Rational smoothing gives
(c²−⟨c,1⟩*)(d²−⟨1,d⟩*)z_(M,N), with the diamond actions on the named
indices. Pullback takes the symbol to the symbol of the pulled-back
units; bilinearity expands {uu′,vv′} into its four ordered terms
(Kato 2.2, pp.125–126). The linearized `beilinsonElement` in
Suggested.lean applies a supplied bilinear pairing. Its scheme
realization uses the K₁ product and cannot be replaced by an arbitrary
bilinear map when proving the Chern or transfer theorems.

The four-term smoothing is c²d²{u,v}−c²{u,v_d}−d²{u_c,v}+{u_c,v_d}.
In particular both cross terms have negative sign. Pullback and
bilinearity must commute with restriction to every admitted common
open curve, so that both auxiliary torsion divisors have been removed
before the two units are multiplied in K₂.

**Checks.**

- `beilinson_order`: ch_(2,2) gives Kummer of the first unit cup Kummer
  of the second. The determinant pairing gives 1 in that order and
  −1 in the reverse order, providing the representative sign witness.
- `beilinson_identity_entry`: either identity unit gives zero. In
  additive rationalized units either zero slot gives zero.
- `beilinson_bilinearity`: replacing the first slot by u+u′ gives the
  sum of the two symbols with the same second slot. Together with the
  four-term smoothing this excludes a pairing that ignores a slot.

- For the bilinear scalar-multiplication map on ℚ, `beilinsonElement`
  takes (2,3) to six. A zero construction fails this direct evaluation.
- Under that same nonzero map, (2,0) gives zero. A constant nonzero
  construction fails this degenerate case.
- Under that map, (2+3,7) gives 35, testing a nonzero first-slot sum.
  The determinant check separately fixes the alternating-symbol convention.

*Needs:* Layer 0; ModularCurves 5b and ModularCurvesPartII R12.2;
SchemeKTheoryOperations product/pullback; K2SymbolsBrauer T2–T3.

### 1.2 Norms when the level prime sets agree

Prove `k2NormProjection`: for M|M′ and N|N′ with
prime(M)=prime(M′) and prime(N)=prime(N′), the finite flat transfer on the admitted
level map sends c,d-z_(M′,N′) to c,d-z_(M,N), with the same admissible
auxiliary units. Use the actual divisor-free open curves and torsion
sections (Kato Proposition 2.3, p.126; proof 2.11, pp.130–131).
The prime sets must agree separately for each index. Equality of their
unions is insufficient: adding to M a prime already dividing N still
calls for 1.3's ramified branch. The auxiliary coprimalities at the lower
level remain valid at the upper level because of these two equalities.

The imported projection formula is f_*{u,f^*v}={Norm_f(u),v}.
Apply it after arranging the two slots along the particular level
map, then use Layer 0's unit norm. The distinction between pullback
of the second slot and transfer of the symbol is essential. Coefficient
rationalization is functorial, but does not justify replacing the
integral transfer theorem by a formal identity of rational operators.

Raising the exponent of a prime already dividing the same index has
identity factor: M′=pM with p|M and N′=N is an example. In contrast,
(M,N)=(2,3) and (M′,N′)=(6,9) have equal combined prime sets, but the
first index has acquired the new prime 3. Proposition 2.4's ramified
branch applies and gives 1−T′(3)⟨1/3,1⟩*, rather than the
prime-set-preserving theorem's identity factor. Suggested.lean checks
the two prime-set equalities and the failed first-index equality.
Degenerate identity level maps act as identity on K₂, including the
zero symbol. These examples test the transfer construction without
assuming its norm equation.

*Needs:* 1.1, Layer 0's distribution and degeneracy products;
SchemeKTheoryOperations transfer/projection formula;
ModularCurvesPartII R14.1 for Y(M,N).

### 1.3 Auxiliary-prime Euler operators

Let ℓ be prime with ℓ∤M. Admit the upper and lower levels in Kato 2.4,
and assume c prime to 6Mℓ, d prime to 6Nℓ. Prove
`k2AuxiliaryEulerFactor`: the transfer of the upper-level Beilinson
class is obtained by the following operator on the lower class,
with the dual Hecke and diamond actions supplied on K₂:

```text
ℓ∤N:  1 − T′(ℓ)⟨1/ℓ,1⟩* + ℓ⟨1/ℓ,1/ℓ⟩*,
ℓ|N:  1 − T′(ℓ)⟨1/ℓ,1⟩*.
```

The second branch is allowed; it is not necessary to assume ℓ∤MN in
every statement. The coefficient of the quadratic term is ℓ, and its
diamond action changes both indices. These are identities of the
particular class under actual finite-flat transfers, not polynomial
identities for unrelated vectors (Kato Proposition 2.4, p.126;
proof 2.12–2.13, pp.131–133).

The proof partitions the torsion-section fibers and applies the
projection formula slot by slot. One-sided degeneracy contributes the
Hecke term and the common scalar correspondence contributes the last
term. In the ramified branch the latter fiber is absent. Passing to
Chern moments later changes the powers of ℓ; applying that twist at
this stage would give the wrong geometric K₂ equation.

*Needs:* 1.1–1.2 and Layer 0's one-coordinate product;
ModularCurvesPartII R14.1 dual-Hecke/diamond transfers and
SchemeKTheoryOperations projection formula.

### 1.4 Chern normalization and denominator discipline

Prove `chernSymbolNormalization` for the finite étale Chern map on the
open curve, with p inverted in the base. For an ordered pair of units,

```text
ch_(2,2)({u,v}) = Kummer(u) cup Kummer(v),
c_(2,2)({u,v})  = −Kummer(u) cup Kummer(v).
```

The equality uses ch_(2,2)=−c_(2,2); weight two introduces no additional
factorial. Check the sign against the scheme-to-field restriction,
where the field Kummer classes are already supplied. Compatibility of
Chern classes with products and transfers is supplied by
MotivicEtaleKTheory M.8 (Kato 8.4, pp.182–184, with the finite
Chern-class comparison used there).

The Kuga–Sato rational comparison in §§10–11 has symmetric projectors
and finite quotient averages. State exactly which finite-group orders
and factorials are inverted in that comparison. The finite integral
moment construction does not become an integral ordinary symmetric
self-duality by this rational argument. In particular the literal
symmetric dual is a divided-power lattice; a divided-power monomial
and an ordinary symmetric monomial agree only through the stated
coefficient comparison.

The ordered determinant values 1 and −1 fix the cup sign in the
representative examples. With two inverted unit entries, bilinearity
cancels the two negatives. With just one inverted entry the sign
changes. These controls ensure that the inverse-divisor convention in
Nakamura §3.1.3, p.207, is not silently used for the individual Kato
units, even though inverting both entries leaves its equal-auxiliary
K₂ symbol unchanged.

*Needs:* 1.1; MotivicEtaleKTheory M.8 finite étale Chern character;
SchemeKTheoryOperations product; field Kummer/cup restriction for the
normalization check; the rational quotient comparisons in Kato
§§10–11 only on their stated denominator domain.

### 1.5 Étale moments into the modular local system

For k≥2 and 1≤r′≤k−1, let r be any integer. Starting from a
norm-compatible K₂ tower, define `chernMoment` by finite étale
ch_(2,2), insertion of the monomial

e₁^(r′−1)e₂^(k−r′−1)ζ^(−r), trace through the actual torsion-level
cover, and the Hochschild–Serre edge. The two exponents are nonnegative
and add to k−2. Use finite ℤ/p^n coefficients first, then the lattice
limit. The target has cohomological twist k−r: the K₂ twist contributes
two, the root factor contributes −r, and T_pE≃H_p(1) contributes k−2
(Kato 8.3–8.4, pp.181–184).

The API is `chernMoment_factorization`, `chernMoment_twist`,
`chernMoment_coefficients` and `chernMoment_ext`. The first names the
ordered composite; the coefficient theorem asserts reduction or
extension commutes with every constituent map, including trace and
edge, rather than just with scalar multiplication. Pointwise equality
of proposed moment morphisms gives equality as linear maps. The
representative four-map composite captures this order over any field;
its arithmetic coefficient theorem requires the finite-coefficient
supplier and is stated here as that separate target.

Higher-degree étale cohomology of the open affine modular curve
vanishes on the supplied finite-coefficient range, yielding the
required edge identification. Rational parabolic comparison cannot
supply the integral open-curve edge. S-integrality of the resulting
Galois inverse limit is proved in Layer 2, not assumed in the moment
definition.

**Checks.**

- `moment_weight_two`: k=2,r=1 gives total twist one. A convention
  treating T_pE as the untwisted H_p fails here.
- `moment_weight_four`: k=4,r=1 gives twist three, distinguishing it
  from the erroneous 2−r−(k−2)=−1.
- `moment_monomial_degree`: within 1≤r′≤k−1 both exponents are
  nonnegative and their sum is k−2. r′=0 is a negative control and
  must not create a moment by truncated subtraction.
- `moment_identity_maps`: four identity constituent maps on ℚ send
  1 to 1. This exercises the composite, rejecting a zero morphism.

- Identity constituent maps with a zero trace give zero on input one.
  This direct `chernMoment` check rejects a skipped trace.
- Constituent scalings 2,3,5,7 give 210 on input one, rejecting a
  construction that skips a nonidentity constituent.

*Needs:* 1.1–1.4; ModularCurves 2e integral Weil/Poincaré pairing;
ModularCurvesPartII R14.3 open-curve finite-coefficient comparison;
SelmerIwasawaCohomology L0; MotivicEtaleKTheory M.8.

### 1.6 Hecke and diamond equivariance

For n prime to Mp, prove `chernHeckeDiamond` with the dual-Hecke
normalization

```text
T′(n) Ch = n^(r−1) Ch T′(n).
```

The Hecke operators on the two sides act on different source and
target carriers; their equality of names does not identify their
scalars. For a prime to Mp and b prime to Np, the diamond transport
multiplies the moment by

a^(r′−1)b^(k−r′−1)(ab)^(−r). These factors come from the two monomial
slots and the root twist (Kato 8.8, pp.184–185).

On the central a=b=n specialization the diamond scalar is
n^(k−2−2r), which differs from n^(r−1). In the weight-two,r=1 case
it is n^(−2), while the Hecke scaling is one. This two-term
comparison is a direct safeguard against transporting the wrong
operator through the moment. For n=1 both actions agree with identity.
All inverses occur in coefficients where the level primes are units.

*Needs:* 1.5 and 1.3; ModularCurvesPartII R14.1 actions on both K₂ and
coefficient cohomology; the finite trace and coefficient comparisons.

### Examples

At k=2,r=1 the geometric quadratic coefficient ℓ becomes ℓ^(−1)
after the two diamond/moment powers are inserted. The ordered
Kummer cup and the four-term smoothing pin the Chern sign before
any projection to an eigenform. A prime-set-preserving level raise
has identity transfer factor; a genuinely new prime has 1.3's operator.

### Dependencies

Layer 0; SchemeKTheoryOperations; K2SymbolsBrauer T2–T3;
MotivicEtaleKTheory M.8; ModularCurves 2e and 5b;
ModularCurvesPartII R12.2, R14.1 and R14.3;
SelmerIwasawaCohomology L0. No ordinary local condition occurs here.

## Layer 2: integral towers and full-level conductor relations

### 2.1 S-integrality of the cyclotomic limit

Let K be a number field, T a finite continuous ℤ_p-module and S a finite
set of places containing those above p. Prove `cyclotomicLimitIntegral`:
H¹(O_{K,S},T)→H¹(K,T) is injective, and a corestriction-compatible
cyclotomic tower of classes arising from the modular construction
belongs to the S-integral inverse limit. First work with T/p^n and
then pass to a finite free lattice. The integral limit for the modular
classes uses O_K[1/p] after their finite unramified conditions have
been verified (Kato Lemma 8.5 and proof 8.6, pp.183–184).

The local cokernel is controlled by invariant inertia. Via the exact
Tate/Pontryagin pairing it is dual to residue H¹ with coefficients
Hom(T,ℚ_p/ℤ_p)(1), and corestriction is adjoint to restriction.
`cyclotomicDualLimitVanishes` identifies the obstruction limit with
zero: restriction eventually kills each finite-coefficient residue
class because the residue-field union has p-cohomological dimension
zero. The pairing must be separating; a zero pairing would prove
nothing about the obstruction. Interchange of coefficient and tower
limits must use the supplied finite/continuous cohomology theorem.

No ordinary hypothesis is needed. Neither an arbitrary map called
“integral inclusion” nor a formal inverse-limit constructor yields
injectivity or a lift: those are the substantive local/global claims.
The trivial coefficient module has zero classes and is a necessary
boundary case. Nonzero finite coefficients require the actual residue
duality; the proof cannot silently use ℚ-valued perfectness for a
finite ℤ/p^n module.

*Needs:* Layer 1's finite Chern/trace construction;
SelmerIwasawaCohomology L0 and finite unramified comparison;
ArithmeticGaloisDuality D7 with the exact residue and adjointness
contracts. This target is independent of the canonical rational map.

### 2.2 Geometric p-adic zeta classes

For M,N≥1 with M+N≥5, k≥2, 1≤r′≤k−1 and r∈ℤ, choose c prime to
6pM and d prime to 6pN. Define `padicZeta` by applying the actual
Chern-moment map to the norm-compatible c,d-Beilinson tower. Its
cohomological coefficient is the modular local system twisted by
k−r, and 2.1 supplies its S-integral target (Kato 8.1–8.4,
pp.180–184). The level-one indices here use the admitted nonzero
sections in the source construction; the two-index K₂ construction
of 1.1 supplies the appropriate raised levels before trace.

The API is `padicZeta_def`, `padicZeta_norm`,
`padicZeta_pDirection` and `padicZeta_coefficients`. For a new prime
ℓ∤Mpcd, transfer gives the following lower-level operator, where
A=T′(ℓ)⟨1/ℓ,1⟩* and B=⟨1/ℓ,1/ℓ⟩* on the target:

```text
ℓ∤N:  1 − ℓ^(−r)A + ℓ^(k−1−2r)B,
ℓ|N:  1 − ℓ^(−r)A.
```

In the p-direction corestriction from the next p-level is the identity
factor, since the prime set has already acquired p. Reduction,
extension and eigenform coefficient change commute with the class
construction, using the full coefficient squares of Layer 1 (Kato
8.7–8.8, pp.184–185). The linear representative `padicZeta Ch symbols`
is simply Ch(symbols). Its diagrammatic repeated-prime theorem is
conditional on the constituent transfer square and source coherence;
the arithmetic norm relations are proved from the particular source
tower, not postulated for arbitrary vectors.

**Checks.**

- `zeta_unramified_r_one`: at k=2,r=1 the operator is
  1−A/ℓ+B/ℓ. Taking ℓ=3 and eigenvalues 2,1 gives the polynomial
  1−(2/3)X+(1/3)X² in Suggested.lean.
- `zeta_bad_prime_r_one`: at ℓ|N it is 1−A/ℓ. In the same ℓ=3
  specialization the quadratic coefficient is zero, with the linear
  coefficient still −2/3.
- `zeta_p_direction`: a coherent source transfer and commuting
  moment square give cor(z_{n+1})=z_n, with no new Euler factor.
  The representative example tests the constructed moments on both
  sides of that square.
- `zeta_identity_moment`: the identity moment on ℚ-valued sequences
  applied to the constant-one tower has value one at index zero.
  Coherence alone would also admit a zero tower; this test rejects it
  as an accidental replacement for the supplied nonzero input.

- An identity moment sends the zero rational tower to zero, rejecting a
  constant nonzero `padicZeta` output.
- A moment scaling by two sends the constant-three tower to six.
  This rejects a construction that ignores the supplied moment map.

*Needs:* Layer 1's symbols, norm relations and Hecke scalars; 2.1;
SelmerIwasawaCohomology L0 coefficient and tower comparisons.

### 2.3 The conductor Euler-system adapter

Fix the eigenform quotient, stable lattice
T=V_O(f)(k−r), critical slot j, c,d and an admitted modular-symbol
label ξ. Let Σ contain the excluded level, auxiliary and coefficient
primes. The conductor domain consists of m≥1 with
prime(m)∩Σ={p}; thus p divides m, while its other prime factors avoid
Σ. Define `katoEulerAdapter` as the member of the existing ES.2
carrier obtained from the conductor family, its coefficient
projection and the specified Frobenius/Tate convention conversion
(Kato 8.9, p.185; §13.1 and Example 13.3, pp.224–225). No second Euler-system
carrier is introduced.

The API is `katoEulerAdapter_component`, `katoEulerPolynomial`,
`katoEulerAdapter_norm` and `katoEulerAdapter_ext`. Its p-power
component is exactly the modular zeta class. The raw unramified
polynomial for the arithmetic Frobenius on T is

```text
P_ℓ(t)=det(1−Fr_ℓ t | T)
      =1−conjugate(a_ℓ)ℓ^(1−r)t
         +conjugate(ε(ℓ))ℓ^(k+1−2r)t².
```

Evaluation at t=ℓ^(−1)σ_ℓ^(−1) gives
1−conjugate(a_ℓ)ℓ^(−r)σ_ℓ^(−1)
+conjugate(ε(ℓ))ℓ^(k−1−2r)σ_ℓ^(−2).
The helper `katoEulerPolynomial` names this evaluated polynomial in a
variable X, representing σ_ℓ^(−1). The conversion to the supplier's
polynomial convention is by its explicit dual/variable transport;
equality of dimensions of representations is insufficient.
Repeated conductor primes have identity factor, and new unramified
primes have the displayed evaluated factor. ES.2 extensionality
identifies data with equal conductor components.

**Checks.**

- `euler_weight_two`: k=2,r=1 gives −conjugate(a_ℓ)/ℓ and
  conjugate(ε(ℓ))/ℓ as coefficients. For ℓ=3,a=2,ε=1 the
  polynomial is 1−(2/3)X+(1/3)X².
- `euler_repeated_prime`: the repeated-prime equation has identity
  factor, tested by the commuting source/moment square in 2.2.
  A rule inserting the quadratic factor at every conductor raise
  would fail even for a repeated p-prime.
- `euler_polynomial_constant`: evaluation at X=0 is one for every
  admissible coefficient specialization. This excludes a zero factor.
  ℓ is a nonzero prime in the arithmetic theorem; total zpow syntax
  at ℓ=0 does not extend the theorem to that value.

*Needs:* 2.2; EulerSystemsAndKolyvaginSystems ES.2 carrier and
convention transport; AutomorphicGaloisRepresentations R19.1
newform quotient and dual realization; SelmerIwasawaCohomology
coefficient projection.

### 2.4 Literal duals and the Hecke/twist dictionary

Let N≥3, k≥2 and ℓ∤Np. Prove `heckeDualTwistDictionary` over rational
coefficients, or a coefficient ring in which (k−2)! is a unit.
Transport V_k≃V_k^*(2−k) using the normalized Poincaré/symmetric
pairing. For the full-level operators fix

```text
T_ℓ = T(ℓ) diag(ℓ,1)* = T*(ℓ) diag(1,ℓ)*,
S_ℓ = ℓ^(k−2) diag(ℓ,ℓ)*,
T′_ℓ = ℓ^(k−2) T_ℓ S_ℓ^(−1),
S′_ℓ = ℓ^(2(k−2)) S_ℓ^(−1).
```

The Γ₁ literal-dual quotient V′(f) has T′ eigenvalue a_ℓ and S′
eigenvalue ℓ^(k−2)ε(ℓ). Its rational transport is
V′(f)(1−k)≃V(f*) (Nakamura §3.1.2, pp.205–206, and Appendix A,
pp.265–269). The Γ₁ quotient is the rank-two realization. A full-level
f-eigenquotient can retain automorphic multiplicity and is not
identified with it merely by notation; Appendix A's comparison must
use Y₁(N_f) for the rank-two object.

Integrally use Sym^(k−2)(ℤ_p²)^* literally. It corresponds to the
appropriate divided-power Tate lattice, and cannot be replaced by
ordinary Sym^(k−2)(T_pE) without the factorial condition. At p=2,k=4,
an equivariant pairing on ordinary Sym² with basis x²,xy,y² has
antidiagonal outer entries −2 times its middle entry, and determinant
−4b³. It is never perfect over ℤ₂. The Lean nonunit test at two
records the denominator obstruction; the integral geometric theorem
retains the literal dual and does not assert such a pairing.

*Needs:* Layer 1's Hecke/diamond equivariance; ModularCurvesPartII
R14.1 and R14.3; AutomorphicGaloisRepresentations R19.1 rational
Poincaré/dual-form realization. No arithmetic family is used.

### 2.5 Full-level Hecke-linear zeta classes

Put Σ=prime(Np), let n≥1 be prime to Np and choose c≥2 prime to
6Nnp. Define `fullLevelZeta` as the ℤ_p-linear full-level moment map
from Sym^(k−2)(ℤ_p²)^* to the Iwasawa cohomology over
ℤ[1/Σ_n,ζ_n] with H¹(Y(N),V^*_{k/ℤ_p})(2) coefficients. Its moment
is the Chern image of the c,c-K₂ class at all p-levels, transported by
the actual completed Borel–Moore classical moment map (Nakamura
§3.1.3–3.1.4, pp.207–214; Lemma 2.10,
pp.200–202). It is Hecke linear before taking an f-quotient.

The API is `fullLevelZeta_moment`, `fullLevelZeta_hecke`,
`fullLevelZeta_corestriction` and `fullLevelZeta_ext`. For ℓ∉Σ,
corestriction has identity factor when ℓ already divides n; for a
new ℓ it has 1−T′_ℓσ_ℓ^(−1)+ℓS′_ℓσ_ℓ^(−2).
The two linear moment maps and the level/conductor transfer maps must
commute. Extensionality is equality on every literal-dual input.
The representative `fullLevelZeta` is Ch∘moment on `Module.Dual`;
`fullLevelEulerOperator` names the displayed quadratic operator.
`fullLevelZeta_transfer` proves the algebraic transport from three
constituent squares: Chern/transfer, source moment/transfer and
Chern/Euler compatibility. Neither the Hecke action nor the norm
relation is an assertion about unrelated Ch and moment maps.
For the helper `fullLevelEulerOperator`, identity actions and ℓ=3
send one to three, identity actions and ℓ=0 give the zero operator,
and zero u gives the identity operator. These three Lean checks
pin the coefficients and composition order; the ℓ=0 and u=0
instances do not extend the geometric prime/Frobenius theorem.

**Checks.**

- `fullLevel_zero`: zero literal-dual moment gives zero cohomology,
  including over the integral coefficient ring.
- `fullLevel_add`: v+w gives the sum of the two values. This excludes
  nonlinear evaluation or a constant shift.
- `fullLevel_new_prime`: with T′,S′ and inverse-Frobenius action all
  identity and ℓ=3, the quadratic operator is multiplication by three.
  Once the geometric transfer square is proved, it gives that operator
  on the constructed high and low moments. Suggested.lean checks the
  operator and its action on both constructed moments through the
  separate Chern-transfer and moment-transfer squares in
  `fullLevelZeta_transfer`; the arithmetic maps are the stated
  corestriction target.
- `fullLevel_identity_moment`: evaluate the literal dual of ℚ at one,
  then apply identity Ch. The identity functional gives one. This
  rejects a constant-zero moment construction.

*Needs:* 2.1–2.4; Layer 1's Chern moments;
CompletedCohomologyAndLocalGlobalCompatibility R31.2 on the exact
literal-dual carrier; ModularCurvesPartII R14.1 and R14.3;
SelmerIwasawaCohomology L0.

### Examples

At weight two the eigenform conductor factor has the same ℓ-inverse
in both nonconstant coefficients. At full level the unspecialized
quadratic factor still has the coefficient ℓS′. These are two
representations of the same transfer after the 2.4 dictionary,
not interchangeable input polynomials. Integral degree-two moments
at two provide a concrete rejection of rational self-duality applied
to an integral lattice.

### Dependencies

Layer 1; ArithmeticGaloisDuality D7;
SelmerIwasawaCohomology L0; ModularCurvesPartII R14.1 and R14.3;
AutomorphicGaloisRepresentations R19.1;
EulerSystemsAndKolyvaginSystems ES.2;
CompletedCohomologyAndLocalGlobalCompatibility R31.2 with
CompletedCohomologyPartII CC.6–CC.7.

## Layer 3: modular filtration and period reciprocity

### 3.1 The open-curve modular dual exponential

Let D=D_dR(H¹(Y,Sym^(k−2)H_p)) for an admitted open modular curve
Y with smooth compactification X and cusp boundary. For k≥2, identify
its filtration with

```text
F^iD = D                    if i≤0,
F^iD = M_k(X)⊗ℚ_p           if 1≤i≤k−1,
F^iD = 0                    if i≥k.
```

Define `modularFiltration` with precisely these three branches. The
modular-form step is a subspace of D through the logarithmic
comparison, including the Eisenstein part. In interior critical
positions it is the same nonzero step even though its associated
graded quotient is zero. The k≥2 condition prevents conflicting
endpoint branches at nonpositive weights (Kato 9.2–9.4,
pp.186–188).

For 1≤i≤k−1 define `modularDualExp` by the generic dual exponential
on H¹(ℚ_p,V_k(Y)(i)), then the proved identification
F⁰D_dR(V_k(Y)(i))=F^iD=M_k(X)⊗ℚ_p. For the eigenform quotient its
range is S(f)⊗_F E, with the corresponding cyclotomic field factor.
It is the imported exponential followed by this range restriction,
not a new generic definition of exp*. The API is
`modularFiltration_nonpositive`, `modularFiltration_critical`,
`modularFiltration_endpoint`, `modularDualExp` and
`modularDualExp_coe`. The last theorem recovers the supplied exp*
value after forgetting the range subtype. Existence of the range
identification is the exact open-curve comparison contract.

**Checks.**

- `filtration_interior`: at k=4, F¹=F²=M_k(X)⊗ℚ_p and gr¹=0.
  Replacing the target by gr¹ would erase the modular form.
- `filtration_endpoint`: at k=4,i=4 the step is zero. A filtration
  continuing the modular-form step at k fails.
- `filtration_weight_two`: at k=2,i=1 the modular-form step remains;
  the critical range is not empty.
- `dualExp_coercion`: coercing the subtype value returns the imported
  exponential, including a nonzero input value. Suggested.lean
  tests this for an arbitrary linear exp* with its proved range.

- On the whole rational line, the identity exponential gives one on
  input one, rejecting a zero `modularDualExp` construction.
- A zero exponential gives zero on input one, rejecting an identity
  map substituted for the imported exponential.
- The doubling exponential gives six on input three, testing that range
  restriction preserves a nonidentity value.

*Needs:* ModularCurvesPartII R14.3 open logarithmic comparison and
R12.3 compactification; PadicHodgeRegulators L1 generic dual
exponential; AutomorphicGaloisRepresentations R19.1 for the f-quotient.

### 3.2 Eisenstein zeta forms and Betti periods

Use the one-dimensional Hecke quotient S(f) of M_k(X₁(N)) and the
two-dimensional rational quotient V_F(f) of
H¹(Y₁(N),Sym^(k−2)H). Each rational complex-conjugation eigenspace has
dimension one. Define `periodMap` per_f:S(f)→V_ℂ(f) by integration
and Poincaré duality, with the supplied Hecke quotient. This is not
an arbitrary isomorphism between the one- and two-dimensional spaces
(Kato 6.3–6.5, pp.161–163).

Define `archimedeanEisensteinZeta` using the precisely normalized
additive-index Eisenstein series. For M,N≥1, M+N≥5, critical
1≤r,r′≤k−1 and at least one of r,r′ equal to k−1, the two formulas
are

```text
r′=k−1:
  (−1)^r / (r−1)! · M^(k−r−2)N^(−r)
    · F^(k−r)_(1/M,0) E^r_(0,1/N),
r=k−1:
  (−1)^r′ / (k−2)! · M^(r′−k)N^(−r′)
    · E^(k−r′)_(1/M,0) F^r′_(0,1/N).
```

The unsmoothed definition excludes (r,r′)=(2,k−1),(k−1,2),
(k−1,k−2), as in Kato 4.2.3, p.142. When r=r′=k−1 the two
formulas agree by E¹=F¹. Define the c,d-smoothed product by inserting
the cF,cE,dF,dE series in the same formulas. Require the source
auxiliary admissibility and, if (r,r′)=(k−2,k−1), M≥2; the
smoothed definition has the 4.2.1–4.2.2 range, without the additional
unsmoothed exclusions. At h=2 use the regularized E series and its
smoothing, not an unsmoothed holomorphic E² (Kato 4.2–4.2.4,
pp.142–143). All factorial denominators are nonzero in characteristic
zero; negative M,N powers require their positive integer values.

Trace and pull back these forms as in Kato 5.2 to obtain the
conductor form z_m(f,r,r′,ξ,S). For ξ∈SL₂(ℤ), m≥1,
prime(mN)⊂S and a character χ:(ℤ/m)^×→ℂ^×, prove
`archimedeanCriticalValues`:

```text
∑_b χ(b) per_f(σ_b z_m(f,r,r′,ξ,S))^±
  = (2πi)^(k−r−1) L_S(f*,χ,r) δ(f,r′,ξ)^±,
± = (−1)^(k−r−1)χ(−1).
```

Use the unsmoothed restrictions of 5.2.3 for this unsmoothed formula.
For the c,d version retain 5.2.1–5.2.2, the admissible auxiliary
coprimalities and c=d=1 modulo N in the SL₂ branch. Replace δ by
(c²−c^u conjugate(χ(c)))(d²−d^v conjugate(χ(d)))δ, where
(u,v)=(r+2−k,r) if r′=k−1, and (u,v)=(k−r′,r′) if r=k−1.
The source's rational-shift label ξ=a(A) has instead the four-term
smoothed modular-symbol vector, with the labels a(A),ac(A),
“a/d”(A) and ξ and the ε(d) factors of 6.6; do not replace it by
the SL₂ two-factor expression (Kato Theorem 6.6(1), p.163;
4.2.4, p.143; §5.2, pp.153–154).

The period API must preserve Hecke quotient, complex-conjugation
projection, and the normalization comparison to the L1 period lines.
The Eisenstein API must preserve weight, index action, the two
endpoint formulas, regularized weight-two smoothing and trace. These
are additional named constructions even though their geometric
carriers are absent from the representative Lean file.

**Checks.**

- For the period convention k=2,r=1 and χ(−1)=1 select plus; the
  same value with χ(−1)=−1 selects minus. `criticalSign` tests both.
- At k=4,r=2 and an even character select minus; forgetting the
  weight factor would select plus.
- A zero modular form has zero period. An affine shift of the
  integration map fails this check.
- The period of a sum is the sum of the periods, and multiplying
  the differential by a scales its period by a.
- The supplied nonzero f-differential has a nonzero period in its
  Hecke realization, rejecting a zero period map. These are geometric
  period-map targets in the closing Lean comment, rather than claims
  proved by the representative parity calculations.
- At r=r′=k−1 the two Eisenstein products agree using E¹=F¹;
  both coefficient powers and the factorial must agree.
- The excluded unsmoothed pairs must be rejected even when the
  corresponding smoothed product is defined. This detects a missing
  regularization condition.
- In the fixed-index weight-one smoothing c=5,d=7 the two scalar
  factors are 24 and 48. Their product is 1152, with the two negative
  cross terms retained. The linear smoothing tests in Layers 0–1
  exercise the corresponding algebraic operations.

*Needs:* Layers 0–1; ModularForms Layers 0 and 7 exact normalized
Eisenstein/continued-L contracts; ModularSymbolsPadicLFunctions
L0–L1 period and modular-symbol dictionary; R19.1 eigenform realization.

### 3.3 The real regulator and the derivative at zero

For M,N≥2, M+N≥5 and prime(M)⊂prime(N), let
Z_(M,N)(s)=∑_{(n,M)=1}T′(n)⟨1/n,1⟩* n^(−s).
Use its convergence for Re(s)>2 and meromorphic continuation at the
specified evaluation point, with Z_(M,N)(0)=0. Let δ_(M,N) be the
Poincaré-dual class of the path y↦ν(iy) from the cusp zero to infinity
in relative cusp homology. Prove `beilinsonArchimedeanRegulator`:
the real regulator of z_(M,N) is Z′_(M,N)(0)δ_(M,N)
(Kato Theorem 2.6, p.127; definitions 2.5–2.7, pp.127–128).

The target uses ℝ(2) coefficients and
H¹(Y(M,N)(ℂ),ℤ)≃H₁(X(M,N)(ℂ),{cusps},ℤ). The endpoints of the
relative path are part of the data; replacing it by a closed cycle
on the open curve is not the same class. Complex conjugation
projection is rational/real, with its factor one half in those
coefficients. It does not assert an integral dyadic projector.

On the f-quotient in weight two and sign −χ(−1), the χ-weighted
regulator is
2πi·lim_{s→0}s^(−1)L_S(f*,χ,s)·δ(f,1,ξ)^±
(Kato Theorem 6.6(2), p.163). The derivative or divided limit is
essential: replacing it by Z(0) or L_S(f*,χ,0) gives zero and loses
the regulator. This archimedean weight-two input is distinct from
the r=1 p-adic dual-exponential formula. The proof compares
Eisenstein/Poincaré pairings in §§7.7 and 7.12 and then descends
through §§7.18–7.20.

*Needs:* Layer 1's unsmoothed K₂ symbol; 3.2 periods and continued
operator-valued zeta function; MotivicEtaleKTheory M.8 real regulator
with transfer and ℝ(2) normalization. Its finite étale Chern map alone
is insufficient.

### 3.4 Generalized explicit reciprocity

For M,N≥1, M+N≥5, k≥2, 1≤r,r′≤k−1, at least one of r,r′ equal to
k−1 and prime(M)⊂prime(N), assume M≥2 if
(r,r′)=(k−2,k−1). Admit c,d as in the geometric p-adic construction.
Prove `generalizedExplicitReciprocity`: localization and the modular
dual exponential at twist k−r take c,d-z^(p)_(M,N)(k,r,r′) to the
c,d-Eisenstein product of 3.2 acted on by

```text
p|M:             1,
p∤M and p|N:     1−p^(−r)T′(p)⟨1/p,1⟩*,
p∤MN:            1−p^(−r)T′(p)⟨1/p,1⟩*
                    +p^(k−1−2r)⟨1/p,1/p⟩*.
```

The image belongs to the filtration step of 3.1. An interior associated
graded quotient would give the wrong zero target. All three level
branches and the exceptional M condition are needed (Kato Theorem
9.5, p.188; Theorems 9.6–9.7, pp.188–189, give trace/eigenform
versions). At weight two,r=1 in the last branch both nonconstant
powers are p^(−1), providing the same numerical control as Layer 2.

The proof requires the exact big-local-field statement used in Kato
§10, whose Proposition 10.12, p.198, cites [KK3] Theorem 4.3.1,
and the square (10.9.5) relating symbol,
Kummer cup, trace, modular differential and dual exponential. Section
11 supplies the syntomic/Kuga–Sato comparison with its rational
projector denominators. Complete proof closure of the non-perfect-
residue-field reciprocity is an unsupplied D.2 contract. The theorem
is a target conditional on that contract; the finite-field syntomic
comparison does not prove it. Neither independent linear maps nor an
arbitrary vector named “Eisenstein product” satisfy this equality.

In the archived author version of *Generalized explicit reciprocity laws*,
Theorem 4.3.1, internal p.23, has hypotheses 4.1.1, internal p.19:
a mixed-characteristic complete discrete valuation field with finite
p-basis, a one-dimensional p-divisible group, an endomorphism domain Λ
finite free over ℤₚ, a free Λ-Tate module, and an isomorphism for the
filtered connection. Set h=rank_Λ(T_pG) and r=∑ᵢs(i) for the
nonnegative derivative multi-index. Its input consists of norm-compatible
units evaluated on the ordered division basis. The formula has sign
(−1)^(h−1), conductor factor p^(−m(h+r)), and factorial denominator
r!, with m≥1. For Λ=ℤₚ, h is the p-divisible-group height. The
h=2 sign is negative before transporting the Chern and comparison
normalizations; Proposition 10.12 states the resulting modular formula.
At p=2,m=1,r=0 this scalar factor is −1/4 for h=2 and 1/2
for h=1; Suggested.lean pins these two values before any comparison.
The author version's internal pagination is distinct from the published
article's pp.57–126. The proof and the comparison square still belong
to the D.2 contract.

*Needs:* Layers 1–2 and 3.1–3.2; PadicHodgeRegulators D.2 exact
big-local-field reciprocity/10.9.5 square; ModularCurvesPartII
R14.1 and R14.3; MotivicEtaleKTheory M.8 with rational comparison
normalization where used.

### 3.5 Parabolic full-level uniqueness

For N≥3,k≥2, Σ=prime(Np), n≥1 prime to Np and c≥2 prime to 6Nnp,
use the rational Drinfeld–Manin splitting s_N from open to
parabolic cohomology. Prove `parabolicFullLevelCharacterisation` for
the split image of the full-level class. Its coefficient object is
H¹(X(N),j_*V_k), not the open cohomology H¹(Y(N),V_k).
The supplied conductor Iwasawa H¹ is Λ_n-torsion-free for every
integer twist, and its twist-one inverse-limit loc_p/exp* into the
trace-compatible cusp-form system is injective (Nakamura Lemma 3.4,
Remark 3.5 and Corollary 3.6, pp.221–222).

For v∈Sym^(k−2)(ℤ²)^*, the rational split class is characterized by
its values after twist 1−k, specialization, localization and exp*.
These values ω_m lie in S_k(N)_ℚ⊗ℚ(ζ_{np^m}), and their periods obey

```text
per(ω_m) = (2πi)^(1−k) Z_(Σ,np^m)(k−1)
                         s_N(c-δ_(N,np^m)(k,v)).
```

The target has the specified complex-conjugation tensor decomposition
and cyclotomic Galois action. Injectivity proves uniqueness after the
splitting and coefficient identifications. The global inverse-limit
injectivity is a separate exact SelmerIwasawaCohomology L3 export;
it follows neither from a generic local dual exponential nor from a
cohomology constructor. The splitting is rational and Hecke/Galois
equivariant, with no integral splitting assertion. Boundary Eisenstein
cohomology on the open curve is not covered by this theorem.

*Needs:* 2.5 full-level classes; 3.1 and 3.4; ModularSymbolsPadicLFunctions
L0 Drinfeld–Manin splitting; SelmerIwasawaCohomology L3 exact
parabolic inverse-limit comparison. The latter contract remains
unsupplied until its all-weight/full-level proof is provided.

### Examples

The k=4 filtration has F¹=F² but gr¹=0, exhibiting why reciprocity
lands in a step. Critical signs at weight two distinguish even and
odd characters. At weight four,r=2 the weight parity changes that
sign. The derivative-at-zero archimedean theorem and the critical
p-adic theorem therefore have different evaluation points and
normalizations, despite originating from the same K₂ symbol.

### Dependencies

Layers 0–2; ModularCurvesPartII R12.3, R14.1 and R14.3;
ModularForms Layers 0 and 7; ModularSymbolsPadicLFunctions L0–L1;
MotivicEtaleKTheory M.8 real and finite regulators;
PadicHodgeRegulators L1 and D.2;
SelmerIwasawaCohomology L3 parabolic comparison;
AutomorphicGaloisRepresentations R19.1. The open-curve and parabolic
contracts are distinct.

## Layer 4: image hypotheses and Iwasawa structure before the canonical map

### 4.1 Rational unipotents, integral unipotents and the CM boundary

For a non-CM eigenform on the split local quaternion branch, prove
`nonCmLargeImage` from the precise R19.3 cyclotomic image theorem.
The open determinant-one image contains upper and lower unipotents
with nonzero parameter x. An upper unipotent
[[1,x],[0,1]] gives dim_E V/(τ−1)V=1; upper and lower unipotents
have no common invariant line, giving rational irreducibility over
the cyclotomic tower. The field realization and cyclotomic
restriction are part of the hypotheses (Kato 12.8.2, p.223;
after Theorem 13.4, p.226; Ribet §3, pp.190–192).

Define the algebraic action `upperUnipotent x` on column vectors by
(v₀+xv₁,v₁). Its difference has range E·e₁ if x≠0. This calculation
proves the rank-one rational quotient once the actual Galois image
contains that element; it does not itself prove an image theorem.
For a stable integral lattice the stronger `nonCmIntegralRankOne`
requires full SL₂(ℤ_p) in the named basis. Then x=1 gives a free
rank-one O quotient and residual irreducibility. Openness alone may
supply x divisible by p and does not give integral freeness. The
representative theorem over a commutative ring accordingly assumes
x is a unit, while the rational range theorem assumes a field and
x≠0 (Kato 12.8.1, pp.222–223; Rubin draft III.5.8–5.10, p.50).

At a division place the quaternion-valued openness theorem cited by
Kato supplies no nontrivial unipotent: such an element would give a
nonzero nilpotent in a division algebra. Passing to a power in the
finite-index inner-twist kernel does not remove this obstruction.
Therefore the all-place rational Iwasawa argument below requires
its additional alternative input on that branch. This identifies a
limit of the cited deduction, not a counterexample to the all-prime
Iwasawa theorem. Rational Zariski density is not the τ hypothesis.
For CM forms the torus/normalizer image also supplies no such
unipotent; use the early elliptic-unit contract before the canonical
map (Kato §§15.12–15.17, pp.263–265).

The rational and integral Rubin hypotheses must retain their actual
Galois group of irreducibility and τ quotient. At two do not use the
public draft's integral H¹(GL₂(ℤ₂),p-primary torsion)=0 assertion:
the finite GL₂(ℤ/4) calculation has a nonzero H¹ class. Rational
image arguments remain separate from that erroneous vanishing.

**Checks.**

- With x=2 over ℚ the difference sends e₂ to 2e₁ and has the first
  coordinate line as range; the quotient is one dimensional.
- Over ℤ the same x=2 does not generate e₁ integrally: 2a=1 has no
  integer solution. Its quotient has a torsion direction. This
  rejects “open image implies free integral τ quotient.”
- With x=0 the action is identity and the difference range is zero.
  The x≠0 hypothesis is essential for the rational rank claim.

*Needs:* R19.1 cohomological realization, parity and determinant;
R19.3 split/quaternion and almost-all-prime integral image contracts;
EulerSystemsAndKolyvaginSystems ES.8 rational/integral hypothesis
packages. The every-place nonsplit and early CM inputs remain distinct.

### 4.2 Analytic twists detect the geometric classes

Prove `analyticTwistNonvanishing` before constructing the rational
Kato map. The Ash–Stevens generators δ(f,j,ξ), ξ∈SL₂(ℤ),
1≤j≤k−1, span V_F(f). Jacquet–Shalika gives
L(f*,k−1)≠0 for k≥3, while in weight two Rohrlich gives
L(f*,χ,1)≠0 for all but finitely many cyclotomic characters.
For the other noncentral critical values use Kato 13.5(1) and the
functional equation. The central statement 13.5(2) requires even
weight and concerns k/2, with a finite exceptional set among
characters whose conductor primes lie in a fixed finite set S
(Kato 13.5–13.6, pp.226–227).

Fix a height-zero component and an admitted sign. Choose a spanning
modular-symbol vector with nonzero projection to that sign.
Choose auxiliary c,d as in the smoothed construction and exclude
the finite set of characters at which a smoothing factor vanishes.
Infinitely many remaining characters also avoid the analytic
exceptional set. Layer 3's period/reciprocity formula then detects a
nonzero geometric Iwasawa class in that component (Kato proof of
Proposition 13.7, pp.227–228). The full-level spanning vector in
13.6 has both level indices equal to L, before projecting to f;
replacing it by an unequal-index vector changes the source statement.

The weight-two trivial twist is not asserted to be nonvanishing.
An elliptic curve of positive analytic rank is compatible with this
theorem because sufficiently ramified twists avoid the exceptional
set. The analytic input is the continued modular L-function; the
total `LSeries` sum outside its convergence half-plane does not give
these values. The argument detects particular smoothed classes,
not every member of an arbitrarily named conductor family.

*Needs:* 2.2–2.3 geometric classes, 3.2 and 3.4 regulator/period
formulas; ModularSymbolsPadicLFunctions L0 spanning; ModularForms
Layer 7 continuation/nonvanishing inputs. No canonical rational map
is used in this proof.

### 4.3 The modular application of the generic bound

For the non-CM geometric conductor system, verify the rational
Hyp(ℚ∞,V) and tower hypothesis of ES.8 using 4.1, and its non-torsion
component using 4.2. Prove `modularEulerSystemBound`: the restricted
dual Selmer module X_strict is torsion and

```text
char_Λ(X_strict) divides p^t ind_Λ(c) for some t≥0.
```

After inverting p this is exact divisibility. For the integral bound
require p odd and the complete Hyp(ℚ∞,T) package, including residual
irreducibility and a free rank-one τ quotient; then the p-power
error can be removed (Kato Theorem 13.4(2)–(3), p.226;
Rubin draft II, hypotheses on p.27 and Theorem 3.3, p.28).
The split local branch verifies the rational image package;
the remaining branch needs the alternative input in 4.1.

Retain all five Kato arithmetic conditions in the conversion:
finite ramification, oddness dim(V⁺)=dim(V⁻)=1, purity, rational
irreducibility and the rational τ quotient. Purity comes from strict
compatibility/monodromy weight; it does not imply oddness. Kato's
irreducibility is stated over Gal(ℚbar/ℚ), while Rubin's hypothesis
uses the cyclotomic restriction. The upper/lower unipotents verify
the stronger group-specific claim on the split branch. A rational
open subgroup cannot replace the full integral package.

The exact Poitou–Tate comparison identifies X_strict with the kernel
of global H²→local H² after the stated localization and unramified
conditions. After weak Leopoldt, the supplier's Euler-characteristic and module
comparison identify the rational H¹ as rank-one free, before the
canonical map exists. In that module the evaluation ideal equals
the index of the line generated by the particular non-torsion class.
Pass from that line to the geometric zeta span using the smoothed
comparison. Retain the local H² correction when returning to global
cohomology. This section applies the supplier's bound and index
construction; it does not reprove an abstract Euler-system theorem.

*Needs:* 2.3, 4.1–4.2; EulerSystemsAndKolyvaginSystems ES.8 rational
and integral divisibility, λ-index and weak-Leopoldt exports;
SelmerIwasawaCohomology L2–L3 strict H² comparison;
PadicMeasuresIwasawaAlgebras L4 characteristic ideals; R19.1 oddness
and R19.3 strictly compatible purity.

### 4.4 All-prime rational and lattice module structure

Prove `rationalIwasawaStructure` for every normalized newform,
weight k≥2, p any prime and λ|p. For every stable lattice T,
H²(T) is Λ-torsion and H¹(T) is Λ-torsion-free. After inverting p,
H²(V) is Λ_ℚ-torsion and H¹(V) is Λ_ℚ-free of rank one.
If p≠2 and the residual lattice representation is irreducible,
H¹(T) is Λ-free of rank one (Kato Theorem 12.4, p.221;
Burungale–Tian arXiv v2 Theorem 2.3, p.4).

The rational theorem has no ordinary, CM or residual-image restriction.
Its proof splits by image: for non-CM on the verified split branch,
the geometric non-torsion class of 4.2 and ES.8 weak Leopoldt yield
H² torsion; the exact modular Iwasawa-complex Euler characteristic
and lattice torsion-freeness then give rank one and rational freeness
(Kato §§13.7–13.8, pp.227–228). The nonsplit branch requires its
alternative weak-Leopoldt input. For CM first use the early
elliptic-unit theorem, including the exceptional p=2 and ℚ(i)
contained-cyclotomic branch (Kato 15.14, p.264).
These inputs remain conditional until supplied; they do not narrow
the stated source theorem to ordinary or non-CM forms.

This result precedes the canonical Kato map. It cannot be obtained
by applying nonvanishing of that map, or by assuming a main-conjecture
equality containing it. The additional integral freeness clause has
its own odd-prime and residual hypotheses. At two retain integral
torsion-freeness and rational rank one, without silently asserting
integral freeness. The zero module is a useful negative control for
rank-one freeness: torsion alone never forces H¹ to be rank one.

*Needs:* 2.2 geometric classes, 4.1–4.3; ES.8 weak Leopoldt;
SelmerIwasawaCohomology L3 exact modular complex/rank comparison;
PadicMeasuresIwasawaAlgebras L4 regular-local/module structure;
the early CM and nonsplit rational inputs specified above.

### Examples

A nonzero rational unipotent parameter gives the required quotient;
a nonunit integral parameter does not. In weight two use ramified
analytic twists rather than the trivial central value. A rational
rank-one Λ_ℚ module supplies the space for the forthcoming canonical
map; it gives no unconditional integral rank-one theorem at two.

### Dependencies

Layers 2–3; AutomorphicGaloisRepresentations R19.1, R19.3 and R19.5
where its local realization is used; ModularForms Layer 7;
ModularSymbolsPadicLFunctions L0;
EulerSystemsAndKolyvaginSystems ES.8;
SelmerIwasawaCohomology L2–L3;
PadicMeasuresIwasawaAlgebras L4. The alternative nonsplit and early
CM contracts are explicit additional proof inputs.

## Layer 5: rational zeta morphisms and twist-one transport

### 5.1 The rational Kato zeta morphism

Using 4.4, construct `katoZetaMap`, the E-linear morphism

```text
z^Ka : V_E(f) → H¹_Iw(V_E(f)).
```

Its values on the Ash–Stevens modular-symbol generators are the
geometric smoothed classes with the explicitly named smoothing and
local factors divided out in the fraction/localized module. Prove
independence of auxiliaries, consistency of every generator relation,
and membership in H¹_Iw(V), so that the result is a map to the
rational Iwasawa module rather than only its fraction space (Kato
Theorem 12.5(1), p.221; construction §§13.9–13.12,
pp.228–232). There is no good-reduction, ordinary or residual
irreducibility hypothesis on this rational construction. Its CM and
nonsplit proof branches retain the earlier conditional module input.

The API is `katoZetaMap_generator`, `katoZetaMap_conjugation`,
`katoZetaSubmodule`, `katoZetaSubmodule_mem`, `katoZetaMap_unique`
and `katoZetaSubmodule_eq_span`. Untwisted conjugation is
z^Ka(ιγ)=−σ_{−1}z^Ka(γ). Uniqueness uses generator spanning together
with the proved relations, not a hypothesis declaring the desired
map unique. Define Z(f) as the Λ_ℚ-submodule spanned by all values,
with every value in it. For a stable T the initial integral span
Z(f,T) lives inside H¹(V) and is compared with H¹(T) later; its
integral membership is not built into its definition.

The representative `katoZetaMap` in Suggested.lean is the final
linear-algebra realization from a genuine `Module.Basis` and
prescribed values. A basis construction always exists, but says
nothing about consistency of an arbitrary family of arithmetic
modular-symbol values. The geometric map target must first prove
those relations and rational membership; only then may this basis
realization be used. `katoZetaSubmodule` is the span over the named
Λ, with no replacement by the smaller E-linear image.


**Checks.**

- `katoMap_zero`: the zero Betti vector has zero zeta value.
- `katoMap_add`: γ+δ has the sum of the two zeta values.
- `katoMap_sign`: on a nonzero rational map value, the minus
  conjugation relation differs from a plus relation. The representative
  example evaluates the constructed map at −v and v and uses
  z(v)≠0; at characteristic two this sign distinction is unavailable,
  hence the example uses ℚ.
- `katoSpan_zero`: the zero realization on ℚ has span zero.
- `katoSpan_identity`: the identity on ℚ has span the whole module,
  testing nonzero generation rather than merely membership of zero.
- `katoSpan_member_one`: its value one belongs to the generated
  span. All three span tests appear in Suggested.lean and concern
  that construction rather than arithmetic nonvanishing.
- `katoMap_generator_one`: a one-element basis with prescribed value
  one receives that value. It excludes a constant-zero realization;
  the arithmetic analogue uses a nonzero spanning generator detected
  by 4.2.

*Needs:* Layers 2–3 and 4.4 before the construction;
ModularSymbolsPadicLFunctions L0 spanning/period generators;
SelmerIwasawaCohomology L3;
PadicMeasuresIwasawaAlgebras L4 rational membership and support.

### 5.2 The smoothed integral span has finite index

Let T=V_O(f). Let Z_sm be the Λ-span of both geometric families of
Kato 12.6: the rational-shift labels a(A), with A≥1 and critical j,
and the SL₂ labels with c=d=1 modulo N. Retain their respective
auxiliary conditions (c,6pA)=1,(d,6pN)=1 for the first family and
(cd,6pN)=1 for the second; use the admitted raised-level classes
specified in that theorem. Prove `integralZetaFiniteIndex`:

```text
Z_sm ⊂ Z(f,T), and Z(f,T)/Z_sm is a finite abelian group.
```

This is not equality of lattices (Kato Theorem 12.6, p.222;
§§13.10–13.12, pp.230–232). Inclusion follows by the canonical
generator expansions, with the correct smoothing exponents and local
factors. Rational equality alone does not yield the finite-index
claim over the full Λ.

Choose the auxiliary combination μ as in the construction, prove
it regular and prove Λ/μΛ is p-torsion-free. At height-one primes
away from p, analytic nonvanishing and auxiliary choices give the
required localized equality. Include the primes over p using the
specific p-torsion-free/support argument. Apply the full-algebra
finite-support contract to the finite generated quotient. This
argument includes p=2 and its finite tame part; a prime-to-p
componentwise calculation does not supply the dyadic full algebra.

The quotient can be nonzero and finite, as ℤ/2ℤ illustrates. A
characteristic ideal equal to one or equality after localization
must not be relabeled as equality of the original submodules.
No residual irreducibility is required for the finite-index theorem.
Integral membership Z(f,T)⊂H¹(T) under large-image hypotheses is a
separate endpoint in Layer 7; it uses integral H¹ freeness.

*Needs:* 5.1 and 4.2–4.4; Layer 2's two admitted geometric families;
PadicMeasuresIwasawaAlgebras L4 regular-μ/p-torsion-free/full-support
contract. This precise finite-support export remains an input.

### 5.3 Critical interpolation of the canonical map

For γ∈V_F(f), 1≤r≤k−1 and n≥0, FIRST twist z^Ka(γ) by the compatible
roots with exponent k−r, THEN specialize at ℚ(ζ_{p^n}), localize at p
and apply exp*. Prove `zetaCriticalInterpolation`: the image
ω_(γ,r,n) lies in S(f)⊗ℚ(ζ_{p^n}) and, for each finite character χ,
its character-weighted period is

```text
∑_σ χ(σ) per_f(ω_(γ,r,n)^σ)^±
  = (2πi)^(k−r−1) L_{ {p} }(f*,χ,r) γ^±,
±=(−1)^(k−r−1)χ(−1).
```

This is Kato Theorem 12.5(1), p.221. It uses the dual form f* and
the actual semilinear Iwasawa twist. With target action distinguished
from source action, twist_j(σx)=κ(σ)^(−j)σ twist_j(x).
A finite-level root multiplied into a class is not a substitute for
changing the representation twist. The global-to-local twist square
is an all-prime SelmerIwasawaCohomology export and uses the same roots
as the regulator.

Apply the Layer 3 formula first to smoothed generators, then the
rational membership and auxiliary cancellation of 5.1–5.2. The
canonical map is uniquely characterized by these critical
specializations using the rational rank-one input, not by an
arbitrary period linear map. The rational statement includes p=2
with its all-prime comparison contract; no new ordinary hypothesis
appears. The examples of `criticalSign` fix the parity in the
interpolation, and the twist calculations in Layer 1 fix k−r.

*Needs:* 5.1–5.2, 3.2 and 3.4; 4.4 rank-one structure;
SelmerIwasawaCohomology L3 all-prime semilinear twist/specialization/
localization contract; ModularSymbolsPadicLFunctions L1 periods.

### 5.4 Nakamura's twist-one zeta morphism

Let n≥1 be prime to Σ_f, and use the rank-two Γ₁ literal-dual
quotient V′ with rational identification V′(1−k)≃V(f*). Define
`twistedKatoZeta` by

```text
z_n = twist_k ∘ z^Ka_n(f*) ∘ twist_(1−k)
       : V′ → H¹_Iw(V′(1)).
```

The input twist identifies the source with the dual-form cohomological
realization, and the output twist produces total degree one.
The API is `twistedKatoZeta_def`, `twistedKatoZeta_ext`,
`twistedKatoZeta_conjugation` and `twistedKatoZeta_norm`.
Conjugation is positive: z_n(ιγ)=σ_{−1}z_n(γ). For a repeated
conductor prime transfer has identity factor; for a new ℓ∉Σ_f it
has P_ℓ(σ_ℓ^(−1)), where
P_ℓ(X)=1−a_ℓX+ℓ^(k−1)ε(ℓ)X² in this convention
(Nakamura Theorem A.1, pp.265–267; Definition A.4 and
Corollary A.5, pp.268–269).

To apply exp* and periods, first undo the output twist with −k.
The corresponding edge critical value is
L_{{p},n}(f,χ,k−1), with (2πi)^(1−k)γ and sign χ(−1).
The conductor-n smoothing has second scalar d², as at conductor one;
the unsquared d in the published p.267 display is incompatible with
its construction. Use the corrected operator. The rank-two
Poincaré dictionary is on Y₁(N_f), not the full-level quotient that
retains multiplicity. For the integral lattice-preservation assertion
of Remark A.2 retain p odd and residual absolute irreducibility;
the rational morphism itself has the broader coefficient scope.

The representative `twistedKatoZeta` is the three-map linear
composite after the specified coefficient transport. Actual Iwasawa
semilinearity, conductor norms and the positive conjugation theorem
require the geometric map and global-to-local twist API.

**Checks.**

- `twisted_total_degree`: (1−k)+k=1 for every integer k. Both twists
  must be present.
- `twisted_zero`: zero source maps to zero.
- `twisted_positive_sign`: (−id)∘z∘(−id) evaluated at x is z(x).
  The example tests the composite, rather than an unrelated scalar
  identity, and fixes cancellation of the two minus signs.
- `twisted_identity_maps`: with the three constituent maps identity
  on ℚ, one maps to one. A zero transport fails this example.

*Needs:* 5.1 and 5.3; 2.4 dual/twist dictionary;
SelmerIwasawaCohomology L3 all-prime twist compatibility and conductor
transport; AutomorphicGaloisRepresentations R19.1 rational Γ₁
Poincaré comparison. The integral clause retains its extra hypotheses.

### Examples

The canonical map vanishes on zero but is not the zero map, as
Layer 4's detected generator will show componentwise in Layer 7.
Finite index between spans need not be equality. Twist-one transport
changes the conjugation sign while the two degree shifts add to one.
The finite-support theorem and the all-prime twist square are both
needed to pass from the geometric tower to the rational morphism.

### Dependencies

Layers 2–4; ModularSymbolsPadicLFunctions L0–L1;
SelmerIwasawaCohomology L3;
PadicMeasuresIwasawaAlgebras L4 full-support contract;
AutomorphicGaloisRepresentations R19.1. Neither an arithmetic family
nor a reverse main-conjecture divisibility occurs in this layer.

## Layer 6: scalar regulators and elliptic periods

### 6.1 The period-normalized scalar regulator

Fix a nonzero ω∈S(f*) and γ∈V_F(f*) with γ⁺,γ⁻ nonzero. Choose a
nonzero refinement α, a root of
X²−a_pX+ε(p)p^(k−1), where ε(p)=0 at bad level. In the small-slope
case require v_p(α)<k−1. Write
per_(f*)(ω)=Ω_+γ⁺+Ω_-γ⁻ with the common root/embedding conventions.
Under V(f*)(k)^*(1)≃V(f), choose η in the φ=α crystalline line
with ⟨ω,η⟩=1. Weak admissibility and the strict slope inequality
prove the pairing nonzero before this division (Kato 16.4–16.6,
pp.270–271).

Define `katoScalarRegulator` to be the η-projection of the imported
vector regulator applied to loc_p twist_k z^Ka_γ(f*). Thus the
arithmetic distribution depends on the normalized eigenvector,
period and Betti input; it is not determined by V alone. The API is
`katoScalarRegulator_def`, `katoScalarRegulator_linear`,
`katoScalarRegulator_scale` and `katoScalarRegulator_projection_add`.
It is linear in the cohomology input and additive in the projection
pairing. Replacing ω by aω, a≠0, renormalizes η by a^(−1); replacing
γ by bγ scales the output by a^(−1)b. The representative map is
projection∘regulator, over any field with those supplied linear maps.
The period/eigenline existence is the arithmetic target above, not
an assertion about arbitrary linear maps.

For merely de Rham V use precisely Kato 16.4's scalar extension
under D_crys(V*(1))⊂F⁰D_dR(V*(1)), retaining the domain of each
singular Euler operator and its trace normalization. A crystalline
regulator statement is not that extension. If no nonzero crystalline
refinement line exists, there is no scalar α-projection: retain the
appropriate vector/de Rham comparison. At two the all-prime target
requires the separate dyadic regulator contract, since the inspected
supplier's growth and interpolation statements assume odd p.

**Checks.**

- `scalar_zero`: zero local class gives zero distribution.
- `scalar_add`: x+y gives the sum of the two scalar distributions.
- `scalar_period_scale`: doubling the period and tripling a class
  multiplies the scalar by 3/2. Suggested.lean computes that value
  with the identity vector regulator on ℚ and half the projection.
  The hypothesis a≠0 is required for period normalization.
- `scalar_identity_maps`: identity regulator and projection on ℚ
  take one to one, rejecting a zero scalar construction.

*Needs:* 5.1 and 5.3, 2.4 dual/twist dictionary;
PadicHodgeRegulators L3 vector/scalar regulator, growth and de Rham
extension; R19.5 eigenline/weak admissibility;
ModularSymbolsPadicLFunctions L1 period normalization. The de Rham
and dyadic exports remain exact additional inputs.

### 6.2 Noncritical analytic–arithmetic equality

Under 6.1's refinement, nonzero-period and strict small-slope
hypotheses, prove `noncriticalAnalyticArithmeticComparison`: the
arithmetic distribution equals the analytic p-adic L-function of
ModularSymbolsPadicLFunctions L2 with periods Ω_±. For χ of exact
conductor p^n, n≥1, and 1≤r≤k−1, both evaluations at κ^rχ^(−1)
must be

```text
(r−1)! p^(nr) α^(−n) G(χ,ζ_{p^n})^(−1)
  (2πi)^(k−r−1) L_{ {p} }(f,χ,r) / Ω_±,
±=(−1)^(k−r−1)χ(−1).
```

At the unramified character κ^r the value is

```text
(r−1)! (2πi)^(k−r−1)
  (1−p^(r−1)α^(−1))(1−ε(p)p^(k−r−1)α^(−1))
  L(f,r) / Ω_±,
±=(−1)^(k−r−1).
```

These formulas are Kato Theorem 16.2, p.269; equality follows from
Theorem 16.6(2), p.271, and the growth/uniqueness in Remark 16.3,
pp.269–270. The primitive Gauss sum is nonzero under the exact
conductor hypothesis. α and the period scalars must also be nonzero.
The vector started from f*, hence the scalar formula contains f.
An unexamined switch of χ with χ^(−1), or G with its inverse, changes
the value.

The two distributions must inhabit the same admissible growth
space. Ramified and unramified interpolation alone is not a
uniqueness proof without the small-slope bound. Compare the entire
factorial, p-power, α-power, Gauss sum, complex period, character
inversion and Euler-factor dictionary supplied by L1. The generic
R09 growth theorem and the analytic admissibility theorem have to
match that weight and Mellin convention. The equality at p=2 is
conditional on the dyadic regulator/growth export; it is not derived
from the odd-prime supplier.

The helper `ordinaryEulerFactor` records both unramified factors.
Singular Euler operators keep their exact domain, even if their
scalar evaluation is zero.

**Checks.**

- At k=2,r=1, a split multiplicative α=1 with ε(p)=0 gives zero;
  replacing that correction by a unit would lose the trivial zero.
- At the same weight, a nonsplit α=−1 with ε(p)=0 gives two;
  the split and nonsplit corrections differ, also at p=2.
- At p=3,k=2,r=1,α=2,ε=1 the algebraic product gives 1/4.
  This coefficient specialization tests the two factors; it does not
  assert that those coefficients belong to a particular newform.

*Needs:* 6.1 and 5.3; ModularSymbolsPadicLFunctions L1 exact
period/Gauss/Mellin dictionary and L2 interpolation/admissibility/
small-slope uniqueness; PadicHodgeRegulators L3 ramified,
unramified and growth exports, including the explicit dyadic input.

### 6.3 Critical fibers and bad-reduction domains

Prove `criticalBadReductionComparison` on the domain of the supplied
family comparison theorem. Fix a decent critical refinement and its
specified affinoid neighborhood, a Zariski-dense noncritical locus,
compatible nonvanishing period normalization, and an arithmetic
zeta section on that same neighborhood. Require both eigensymbol
and regulator specialization to commute with their section, and
require their common noncritical fibers to be the equality of 6.2.
The L3 separatedness principle then gives equality on the family
and at the chosen critical fiber.

This is a conditional mathematical implication. A compatible
arithmetic Kato section and its specialization are an additional
unsupplied input; Kato 16.6 does not produce them. An unspecified
family, a dimension count or interpolation at a single critical
fiber is weaker than the hypothesis. Do not import a higher
PadicFamilies layer that itself uses Kato's classes. The analytic
critical family and its uniqueness principle remain owned by
ModularSymbolsPadicLFunctions L3/family-comparison-principle and
L3/critical-slope-non-uniqueness.

At bad reduction require the de Rham regulator domain of Kato
16.4.1, including D_crys(V*(1))⊂F⁰D_dR(V*(1)), and retain
kernel/cokernel corrections at singular Euler operators. If α=0
or the crystalline line is absent, state the vector/de Rham
comparison rather than a scalar α-equality. The nonzero pairing
used in 16.6 comes from strict slope, so its proof cannot simply
be copied at critical slope (Kato 16.4, Remark 16.5(2) and proof
of 16.6, pp.270–271).

*Needs:* 6.1–6.2; ModularSymbolsPadicLFunctions L3 specified decent
family principle; PadicHodgeRegulators L3 exact de Rham extension;
the compatible arithmetic family/specialization contract stated here.
This conditional target introduces no dependency on PadicFamilies.

### 6.4 Elliptic local lattice and Kato period

Let E/ℚ be modular of conductor N, T=T_pE, ω_E a minimal Néron
differential and Ω_E the corresponding real period. For p odd,
prove `ellipticLocalLattice`:

```text
exp*_{ω_E}(H¹_s(ℚ_p,T))
  = [E(ℚ_p):E₁(ℚ_p)+E(ℚ_p)_tors] · p^(−1)ℤ_p.
```

Here H¹_s is the singular quotient and E₁ is the kernel of reduction.
The index is a local finite index, including at bad reduction; it
is not replaced by the cardinality of the reduced curve. Use the
Tate-pairing adjoint of the formal logarithm, whose pairing is
x↦Tr(log_E(x) exp*_{ω_E}(z)). For odd p the logarithm image of E₁
is pℤ_p, giving the displayed dual lattice (Rubin public draft
III.5.1, p.48).

Transport the actual modular Euler system of Layer 2 through the
weight-two dictionary and integral modular parametrization. Prove
there is a positive integer r_E, independent of p, such that

```text
exp*_{ω_E}(loc^s_p c_ℚ) = r_E L_{Np}(E,1)/Ω_E,
∑_γ χ(γ) exp*_{ω_E}(loc^s_p c_{ℚ_n}^γ)
  = r_E L_{Np}(E,χ,1)/Ω_E.
```

Use the cyclotomic ℤ_p-extension ℚ_n and the same roots and
minimal differential for every character. The removed Np factors
are retained. The scalar r_E is the integral parametrization/period
denominator, not a choice depending on the local prime (Rubin draft
III.5.2–5.3, pp.48–49).

At p=2 retain the actual logarithm lattice and its annihilator under
the pairing, rather than the printed odd-prime p^(−1) formula.
For the good-reduction curve y²+xy=x³+1 with Δ=−433, the formal
logarithm on t=2u begins 2u+2u² and its integral tail lies in 4ℤ₂.
Its E₁ logarithm image is 4ℤ₂, rather than 2ℤ₂, showing why that
qualification is necessary. The period assertion still requires
its actual dyadic comparison input; the local-lattice correction
is not a proof of it. Zero local classes give zero exponential, but
the canonical class is shown nonzero only when the relevant L-value
is nonzero.

*Needs:* 2.3, 5.3; PadicHodgeRegulators L1 Tate-normalized exp*;
EllipticCurves Layer 4 reduction/minimal differential/formal logarithm;
SelmerIwasawaCohomology L2 elliptic singular quotient and Kummer
instance; ModularSymbolsPadicLFunctions L1 integral periods.

### Examples

Period scaling by a≠0 and Betti scaling by b give a^(−1)b, not ab.
An α=1 split multiplicative refinement has a trivial-character zero;
an α=−1 nonsplit refinement does not have that zero in the first
Euler factor. The dyadic logarithm example distinguishes a local
lattice theorem from an all-prime rational regulator theorem.

### Dependencies

Layer 5 and Layer 2's realization dictionary;
PadicHodgeRegulators L1 and L3 with de Rham/dyadic contracts;
ModularSymbolsPadicLFunctions L1–L3;
AutomorphicGaloisRepresentations R19.5;
EllipticCurves Layer 4;
SelmerIwasawaCohomology L2–L3. The critical-family arithmetic
compatibility is an explicit additional hypothesis.

## Layer 7: divisibility and elliptic applications

The canonical classes now meet the abstract Euler-system bounds. Keep the
height-one cohomological inequality, the ordinary Selmer inequality and
its elliptic specialization distinct: their hypotheses and local terms
are different.

### 7.1 The zeta submodule is non-torsion

For every f, k, λ and p of 4.4, prove Z(f) is nonzero on each
character component of Λ_Q, so H¹(V(f))/Z(f) is Λ_Q-torsion. The
hypothesis concerns the canonical image of V(f), rather than every
individual γ: the zero vector certainly has zero image. Detect a
nonzero image using 3.4 and 5.3, an appropriate sign and a finite-order twist
with nonzero critical L-value. Choose smoothing parameters whose
values are nonzero at that twist, and use the modular-symbol spanning
result to pass from those geometric classes to Z(f). The proof uses
4.3 and therefore retains its conditional CM and nonsplit-image
inputs. A map into a rank-one free module alone can be the zero map;
4.4 without this argument does not prove 7.1 (Kato 13.5–13.7,
pp.226–228; Burungale–Tian v2 Theorem 2.4 and Remark 2.5, p.5).

*Needs:* 3.4, 4.3–4.4, 5.1–5.3;
ModularSymbolsPadicLFunctions L0 modular-symbol spanning.

### 7.2 The cohomological upper bound

For every height-one prime 𝔭 of Λ not containing p, prove

```text
length_𝔭 H²(V(f)) ≤ length_𝔭(H¹(V(f))/Z(f))
                     + length_𝔭 H²_loc(V(f)).
```

Here local cohomology is the sum of the supplier's local Iwasawa
complexes, with the same restriction/corestriction conventions. The
last term vanishes except when k=2, f is not potentially good at p,
and 𝔭 is the kernel of the character κ^(−2)χ for a finite-order χ;
at these exceptional primes it has length one. Include that term
rather than asserting the uncorrected inequality for every rational
height-one prime (Kato Theorem 12.5(3), pp.221–222).

For a stable T, assume p is odd and the cyclotomic image contains
the required conjugate of SL₂(ℤ_p), with a basis identifying the
integral representation. Then Z(T)⊂H¹(T) and

```text
length_𝔭 H²(T) ≤ length_𝔭(H¹(T)/Z(T))
```

at every height-one prime of Λ, including primes over p, except
the specified exceptional primes. The integral modules in this
formula are intentional: the printed rational modules in 12.5(4)
would discard the very p-primary information being asserted. Use
integral freeness from 12.4(3), rather than torsion-freeness from
12.4(2), in the integral proof of 13.14, p.234. Do not deduce this
bound from a rational equality or from residual irreducibility alone.
The CM proof requires the earlier elliptic-unit characteristic-ideal
bound and the comparison of 15.13–15.17, pp.264–265; early CM
rank-one freeness by itself is insufficient. The nonsplit local
image branch likewise awaits the comparison specified in 4.1.
The direction is an upper bound; Conjecture 12.10 is not asserted.

As a compatible twist-one specialization, Nakamura Theorem 5.2,
pp.253–254, assumes p odd, absolutely irreducible residual
representation and the required τ with free rank-one quotient.
Its strict Selmer kernel is related to H² by the stated localization
sequence. Do not replace absolute irreducibility or the localization
sequence by a numerical rank-one assumption. Nakamura's citation
of Kato is corrected to 12.5(4), its conjecture is 5.1 and the
canonical map is 12.5(1).

The representative `lengthBoundWithLocalTerm` adds the separately
computed local length to a strict-Selmer length bound through the
actual localization length identity. The arithmetic theorems supply
those modules and lengths; the Lean theorem states only their
numerical consequence, without redefining length or cohomology.

**Checks.**

- With global length 2, zeta quotient length 1 and local correction
  1, the bound holds; dropping the correction makes it fail.
- With lengths 2, 1, 0 it fails. A bound cannot be made true by
  silently choosing the correction after seeing the answer.
- With lengths 0, 0, 0 it holds. This empty case does not establish
  non-torsion of the canonical zeta module.

*Needs:* 4.1–4.4, 5.3–5.4, 7.1;
EulerSystemsAndKolyvaginSystems ES.8 rational/integral cohomological
bounds; SelmerIwasawaCohomology L3 localization and local H² lengths;
PadicMeasuresIwasawaAlgebras L4 localized lengths and characteristic
ideals; the early CM bound and nonsplit image comparison specified
under exact contracts.

### 7.3 Elliptic points in the cyclotomic tower

Let E/ℚ be modular and non-CM and let ℚ_∞/ℚ be its cyclotomic
ℤ_p-extension, for any p. Prove E(ℚ_∞) is finitely generated over
ℤ. Apply the finite-level rational Euler-system bound to the actual
conductor system of 2.3 with its twist transport and interpolation. The nonzero reciprocity value of
6.4 shows that the corresponding χ-components of E(ℚ_n) and
Ш(E/ℚ_n) are finite. Rohrlich's finite exceptional set makes the
free rank stabilize, and Serre's elliptic open-image theorem makes
the torsion subgroup T₀ of E(ℚ_∞) finite (Rubin draft III.5.4–5.6,
p.49; III.5.8–5.11, pp.50–51).

Complete the descent argument: choose one finite layer containing
T₀ and generators of E(ℚ_∞)⊗ℚ. Its procyclic Galois group Γ
acts trivially modulo T₀. For every point P, the map
σ↦σP−P is a continuous homomorphism Γ→T₀. An exponent e of T₀
kills all such homomorphisms on eΓ, uniformly in P. Thus every
point lies in one uniformly enlarged finite layer, whose Mordell–Weil
group is finitely generated. Bounded rank and finite torsion would
not, for an abstract abelian group, imply finite generation; this
uniform Galois descent is essential.

If L(E,1)≠0, the same finite-level argument gives finite E(ℚ)
and finite Ш(E/ℚ)[p^∞] for each p. Global finiteness of Ш also
uses the almost-all-prime vanishing in 7.7. The elliptic open-image
export must include finite cyclotomic torsion, not merely openness
of a general modular quaternion representation. At p=2 use 6.4's
actual local lattice.

*Needs:* 4.1, 4.3, 5.3, 6.4;
EulerSystemsAndKolyvaginSystems ES.4 rational finite-level bound;
AutomorphicGaloisRepresentations R19.3 elliptic Serre consequences;
SelmerIwasawaCohomology L2 elliptic instance;
EllipticCurves Layer 6 Mordell–Weil theorem.

### 7.4 Elliptic ordinary and multiplicative divisibility

Let E/ℚ be modular non-CM of conductor N and have good ordinary or
multiplicative reduction at p. Put T=T_pE,
Λ=ℤ_p[[Gal(ℚ_∞/ℚ)]] and Z_∞=Sel(E/ℚ_∞)^∨. Use the
supplier's actual Coleman map on the singular local Iwasawa group.
For the concrete system c of 2.3 and the same r_E of 6.4, prove

```text
Col(c) = r_E L_(E,N).
```

Here L_(E,N) retains the bad Euler factors and uses the minimal
Néron differential and real period. For good ordinary or nonsplit
multiplicative reduction, Z_∞ is finitely generated torsion and

```text
char(Z_∞) divides p^t L_(E,N) Λ for some integer t.
```

The integer t may be negative when the analytic value is initially
fractional; interpret this as fractional-ideal divisibility, rather
than an unsupported assertion that every L-value is integral. Under
the complete integral ES.8 hypotheses and
p∤r_E ∏_(q|N, q≠p) ell_q(q^(−1)), strengthen the bound to
char(Z_∞)|L_E Λ. A sufficient usable integral image condition is
p odd and ρ_(E,p) surjective. Rational open image does not prove
this stronger statement. The supplier's full dyadic integral
hypothesis would be needed to extend that usable condition to p=2
(Rubin draft III.5.14–5.16, pp.52–53).

For split multiplicative reduction, the Coleman image lies in the
augmentation ideal J, and the bound is

```text
J char(Z_∞) divides p^t L_(E,N) Λ,
```

or divides L_E Λ under the stronger unit and image hypotheses.
Set α=1 in the split case, α=−1 in the nonsplit case and α equal
to the unit root in good ordinary reduction; put β=p/α. The
trivial-character value of Coleman contains
(1−α^(−1))/(1−β^(−1)); its ramified value contains
α^(−a)τ(χ) and the inverse-character exponential sum of 6.4.
Keep the augmentation factor in the split case and never invert
1−α^(−1). In the nonsplit dyadic case it equals 2, which is
nonzero but not a unit. The generic Coleman map, its image theorem
and its local analytic interpolation remain supplier results.

*Needs:* 4.1, 4.3, 5.3, 6.4;
PadicHodgeRegulators L3 elliptic Coleman map and augmentation image;
ModularSymbolsPadicLFunctions L2 p-adic L-function;
EulerSystemsAndKolyvaginSystems ES.8 true Selmer/singular quotient
bound; PadicMeasuresIwasawaAlgebras L4 characteristic ideals.

### 7.5 Ordinary modular Selmer divisibility

Let f, k, λ be as before, with p∤N and a_p a λ-adic unit.
The local representation is crystalline and has its unramified
ordinary line V′. For a stable lattice T put T′=T∩V′ and
T″=T/T′. Use the supplier's ordinary local conditions to define
Sel_∞(T)=lim Sel(ℚ(ζ_(p^n)),T(r))(−r) for 1≤r≤k−1;
Kato 17.2 identifies this with a kernel independent of r. Set
X=Hom_(O_λ)(Sel_∞(T),F_λ/O_λ), with its contragredient
Λ-action. This is the Selmer object of the Selmer supplier, not a
second global cohomology theory (Kato 17.1–17.2, pp.272–273).

Prove X is finitely generated Λ-torsion. For nonzero ω in S(f*)
and γ∈V(f*) with both sign components nonzero, the unit-root
function L_(p,α,ω,γ)(f) of 6.1 belongs to Λ_Q and satisfies

```text
length_𝔭 X ≤ ord_𝔭 L_(p,α,ω,γ)(f)
```

for every height-one 𝔭 not containing p. Under p odd, the full
integral SL₂(ℤ_p) image condition and good periods, the function
belongs to Λ and the inequality holds at every height-one prime.
The goodness condition is on the stable lattice
U⊂V(f*)≅T*(1−k): ω generates
H⁰(ℚ_p, ℤ̂_p^ur⊗U″(k−1)), and γ^± are bases of U^±.
It is not a condition on a lattice in V(f). Retain the literal
integral dual at p=2 or weights whose factorials are not units;
the rational self-duality of 3.1 does not transport these bases
integrally (Kato 17.4–17.5, pp.273–274; proof 17.13,
pp.279–280).

The proof combines the actual Kato class, 7.2, ordinary local
comparison and the noncritical equality of 6.2. The ordinary unit root
has slope zero, strictly below k−1. Do not infer the ordinary Selmer bound merely
from the cohomological inequality without accounting for the local
ordinary quotient. No reverse divisibility is claimed.

*Needs:* 3.1, 5.4, 6.1–6.2, 7.1–7.2;
SelmerIwasawaCohomology L2 ordinary Selmer conditions and L3 ordinary
localization; PadicHodgeRegulators L3 ordinary Perrin–Riou comparison;
ModularSymbolsPadicLFunctions L3 good periods;
AutomorphicGaloisRepresentations R19.5 ordinary filtration;
PadicMeasuresIwasawaAlgebras L4 localized lengths.

### 7.6 No finite submodule in the ordinary elliptic Selmer dual

For modular non-CM E with good ordinary reduction at p, assume

```text
p ∤ ∏_(q|N) |E(ℚ_q)_tors|.
```

Then Z_∞ of 7.4 has no nonzero finite Λ-submodule. The exclusions
refer to local torsion at every bad q, not E(ℚ)_tors. The proof
uses the exact dual Poitou–Tate sequence, disappearance of its bad
local terms, the rank-one free formal-group norm module at p and
weak Leopoldt. Import the formal-group norm theorem and the precise
Greenberg criterion from SelmerIwasawaCohomology L3 (Rubin draft
III.5.17 and its proof, p.53).

An arbitrary quotient of a free module can contain finite
submodules, and a torsion Λ-module need not avoid them. This result
therefore requires the arithmetic sequence and the supplier's
criterion, rather than a hypothesis asserting the desired
conclusion. Good ordinary reduction is essential here; do not
apply this theorem to a split multiplicative local term.

*Needs:* 7.4; SelmerIwasawaCohomology L2 finite/unramified comparison
and Poitou–Tate, L3 weak Leopoldt, formal-group norms and Greenberg
criterion; EllipticCurves Layer 4 local torsion and formal group.

### 7.7 Rank-zero upper bound for the elliptic p-part

Let E/ℚ be modular non-CM and L(E,1)≠0. Suppose p is odd, E has
good reduction at p, ρ_(E,p) is surjective, and

```text
p ∤ 2 r_E ∏_(q|N) (ell_q(q^(−1)) |E(ℚ_q)_tors|).
```

Then Ш(E/ℚ)[p^∞] is finite and

```text
ord_p |Ш(E/ℚ)[p^∞]| ≤ ord_p (L(E,1)/Ω_E).
```

Interpret the p-integrality/unit condition through the specified
algebraic Euler factors. In the ordinary case specialize the
characteristic-ideal upper bound of 7.4 using 7.6 and the exact
control formula. The analytic trivial-character value and the
control cokernel contain the same (1−α^(−1))² correction;
cancel it in the inequality rather than assuming it is a unit.
In the supersingular case p∤|Ẽ(𝔽_p)| for odd p, and the local
lattice of 6.4 gives Rubin III.5.11(ii), p.51. The hypotheses
exclude p=2 from this numerical bound (Rubin Corollary 5.18,
pp.53–54).

For almost all p, Serre's elliptic surjectivity and the finite list
of bad factors/period denominators satisfy the hypotheses; the
right side is zero, so almost all primary components vanish.
Together with each-prime finiteness from 7.3, this proves finite
Ш(E/ℚ). The conclusion is an upper bound and global finiteness;
it does not give the BSD p-part equality or a lower bound.

*Needs:* 5.3, 6.4, 7.3–7.4, 7.6;
EulerSystemsAndKolyvaginSystems ES.4 finite-level bound;
SelmerIwasawaCohomology L2 elliptic instance and L3 exact ordinary
control/correction factors; AutomorphicGaloisRepresentations R19.3
almost-all-prime elliptic surjectivity;
PadicMeasuresIwasawaAlgebras L4 characteristic-ideal specialization.

### Examples

The localized lengths (2,1,1) require a local correction, while
(2,1,0) violate the bound. A zero zeta map is compatible with a
rank-one ambient module, so 7.1 needs nonvanishing. A split
multiplicative refinement α=1 has zero trivial-character Coleman
value and retains J. In good ordinary reduction, a nonunit
(1−α^(−1))² is canceled against the actual control factor, not
removed by an integrality convention. A finite Λ-module such as
Λ/(p,γ−1) is torsion and is itself a nonzero finite submodule;
7.6 supplies an additional arithmetic assertion.

### Dependencies

Layers 2–6; EulerSystemsAndKolyvaginSystems ES.4 and ES.8;
SelmerIwasawaCohomology L2–L3 with all local, control and
Greenberg contracts stated above; PadicHodgeRegulators L3;
ModularSymbolsPadicLFunctions L0–L3;
AutomorphicGaloisRepresentations R19.3 and R19.5;
PadicMeasuresIwasawaAlgebras L4; EllipticCurves Layers 4 and 6.
The early CM inputs and nonsplit image comparison remain required
for the full all-prime general-newform assertions.

## Downstream use

PadicFamiliesEigenvarieties uses the rank-two full-level Γ₁
specialization of 2.5, its Hecke and moment comparisons, and the
canonical zeta morphism of 5.1–5.2. Its family construction must
import these pointwise classes before interpolating them; it does
not supply their geometric existence. This preserves the direction
of the dependency.

EulerSystemsAndKolyvaginSystems receives concrete modular and
elliptic systems satisfying its definitions from 5.3, while its
bounds are used in Layer 7. Its abstract system and descent theory
have no dependency on Kato's reciprocity or canonical rational map.
SelmerIwasawaCohomology receives the concrete applications 7.3–7.7;
its cohomology, duality, control and local conditions supply their
statements beforehand. ModularSymbolsPadicLFunctions uses the
reciprocity compatibility of Layer 6 to compare its analytic
functions with these classes; its independent analytic
construction and period normalization remain earlier inputs.

The cohomological and ordinary divisibilities provide one direction
of the cyclotomic main conjecture. CM equality, a reverse
divisibility, dyadic integral bounds and arbitrary-family
interpolation require the additional results specified in the
scope and exact contracts; they are not consequences of this
roadmap's stated upper bounds.

## References

All statements here are paraphrases. Page numbers below refer to the
specified printed edition unless a draft page is explicitly named.

- Kazuya Kato, *p-adic Hodge theory and values of zeta functions of
  modular forms*, Astérisque **295** (2004), 117–290.
  [Public article](https://www.numdam.org/item/AST_2004__295__117_0.pdf).
  Core locators: 1.3–1.10 (121–125), 2.1–2.13 (125–133),
  3.1–3.11 (134–142), 4.1–4.2 (142–143), 5.1–5.2 (152–154),
  6.1–6.6 (160–163), 8.1–8.5 (180–184), 9.1–9.6 (186–189),
  12.4–12.5 (221–222), 13.5–13.14 (226–234), 15.12–15.17
  (263–265), 16.1–16.3 (268–270), 17.1–17.5 (272–274).
  The displayed convention repairs are explained at their uses.
- Kazuya Kato, *Generalized explicit reciprocity laws*, Advances in
  Studies in Contemporary Mathematics **1** (1999), 57–126.
  [Archived author version](https://web.archive.org/web/20220531053712id_/http://www.math.columbia.edu/~phlee/F16-Kato/GER.pdf).
  The locators used here are hypotheses 4.1.1, internal p.19,
  and Theorems 4.3.1 and 4.3.4, internal pp.23–24, of this
  65-page author version. Its internal pages are not published page numbers.
- Karl Rubin, *Euler Systems*, public 1999 Arizona Winter School
  draft, III.5, draft pp.47–54.
  [Public draft](https://swc-math.github.io/notes/files/99RubinES.pdf).
  This is the freely available draft, not the page collation of the
  published Annals of Mathematics Studies volume.
- Kentaro Nakamura, *Zeta morphisms for rank two universal
  deformations*, Inventiones mathematicae **234** (2023), 171–290.
  [Published article](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf).
  The literal dual and theta convention are in §3.1.2–3.1.3,
  pp.205–207; full-level zeta construction and reciprocity are in
  §3.1–3.2, pp.207–222, and the twist transport in Appendix A,
  pp.265–269; the cyclotomic divisibility
  statement is Theorem 5.2, pp.253–254.
- Ashay A. Burungale and Ye Tian, *A rank zero p-converse to a theorem of Gross–Zagier,
  Kolyvagin and Rubin*, arXiv:2506.03465, version 2 (11 October 2025),
  Theorems 2.3–2.4 and Remark 2.5, pp.4–5.
  [Versioned author manuscript](https://arxiv.org/pdf/2506.03465v2).
  This manuscript is the locator used here; the published article
  is Annals of Mathematics **203** (2026), 1–14.
- Kenneth A. Ribet, *On ℓ-adic representations attached to modular
  forms. II*, Glasgow Mathematical Journal **27** (1985), 185–194,
  Theorem 3.1 and the quaternion discussion, pp.190–192.
  [Author-hosted article](https://math.berkeley.edu/~ribet/Articles/rankin.pdf).
  Its open-image assertion is used only through the locally split
  branch described in 4.1; a nonsplit quaternion algebra does not
  contain the same unipotent subgroup.
