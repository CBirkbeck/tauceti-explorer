# Abelian varieties isogenous to no Jacobian

The goal is the Masser–Zannier bounded-degree avoidance theorem. For every dimension
`g ≥ 2` and every proper algebraic hypersurface `H` in the moduli space `A_g` of
principally polarized abelian varieties, construct a Hodge-generic principally
polarized `A/K` with `[K : ℚ] ≤ 2^{16g⁴}` whose geometric isogeny class avoids `H`.
The field-degree bound depends only on `g`, while the constants in the counting
argument can depend on the chosen hypersurface and arithmetic family. For `g ≥ 4`,
the Torelli locus has dimension `3g−3 < g(g+1)/2`, so this produces an abelian
variety isogenous to no smooth Jacobian, and also to no canonically polarized
Jacobian of a stable compact-type curve. The isogenies being excluded are
unpolarized isogenies: they need not carry one chosen principal polarization to
the other.

The roadmap builds the applications of arithmetic isogeny estimates, Rosati
geometry, definable counting and theta coordinates that lead to this theorem.
It also proves the quantitative box estimate, the abundance of distinct isogeny
classes and the Euclidean density consequence. The elliptic real-curve argument
is a separate, useful model for the projected-block method. The interpolation
construction explains how compact real analytic images can meet all algebraic
isogeny classes without contradicting algebraic hypersurface avoidance.

Two final layers are mathematical research problems with precise specifications.
The analytic description of a theta level does not by itself give a field in
which every sixteen-torsion point is rational. Also, in genus at least two, every
globally closed pure analytic hypersurface in `A_g(ℂ)` is algebraic: the Satake
boundary has smaller dimension, so Remmert–Stein and Chow apply. Consequently a
class-covering compact interpolation image cannot be placed in a globally closed
analytic hypersurface. A local or germwise replacement needs its own existence
argument. Neither research problem is a prerequisite for the main theorem.

## Scope and neighbouring roadmaps

The shared definitions retain their existing owners. This roadmap does not
reconstruct abelian varieties, general PEL moduli, Galois representations, the
general theory of heights or o-minimality. It builds the source-specific adapters
and estimates needed to use those theories together. The following are the
interfaces expected from neighbouring layers; a stage identifier refers to that
layer's mathematical contract, rather than asserting that it is already a Lean
module.

| Supplier | Interface used here |
| --- | --- |
| `JacobianChallengePartII:JC1/relative-jacobian` and `JC1/principal-polarization` | The relative Jacobian morphism and its canonical principal polarization; comparison with the Jacobian of one curve. |
| `StableReductionPartII:MC.2/pointed-dm-theorem` | Stable pointed curve moduli and the compact-type specialization of the Torelli morphism. |
| `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `A3`, `A5` and the cited `A6` targets | Polarizations, duality, finite torsion and Weil pairings; polarized complex torus uniformization; finite-free Hom groups, rational Rosati positivity and the degree polynomial. |
| `PELModuli:M2`, `M5` | Arithmetic fine-level spaces and their universal families, the coarse Siegel moduli space and its analytic comparison. |
| `ShimuraData:D1`, `D4`, `D5` | The Hodge and Mumford–Tate language, weakly special subvarieties and the Siegel datum with its symplectic action. |
| `ShimuraVarieties:V0`, `V2`; `ShimuraCompactifications:C5` | Arithmetic quotients, automorphic growth, quasi-projectivity and the projective normal Satake compactification with its boundary strata. |
| `AdelicAlgebraicGroups:AA.3` | Reduction theory for the arithmetic action; the classical Siegel fundamental domain is specialized here. |
| `ModularCurvesPartII:R12.1`, `R13.4` | Elliptic lattice uniformization and the irreducibility, monicity and bidegree of modular polynomials. |
| `ArithmeticGaloisRepresentations:R01.6` | Tate modules, their isogeny compatibility and the cyclotomic similitude character from the Weil pairing. |
| `AutomorphicBundles:B4`, `B5` | The automorphy cocycle, Siegel forms, Fourier expansions and their geometric comparison; the order and theta-degree applications belong here. |
| `ArakelovGeometryAndAbelianHeights:R35.3`, `R35.4` | Stable Faltings height and its isogeny and projective-height comparisons, with their exact field conventions. |
| `FaltingsFinitenessAndIsogenyTheorems:R28.4` | Qualitative Tate and isogeny comparison. Quantitative isogeny and endomorphism estimates are an additional Part II input, specified below; they are not inferred from the qualitative theorem. |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.2` | Hilbert irreducibility and specialization of finite covers; the quantitative thin-set bound must be supplied as well. |
| `LogicAndDefinabilityInNumberTheory:LD.6` | Restricted uniformization and definable counting. Uniform connected blocks and the Ax–Lindemann image argument require the stronger Part II input specified below. |
| `ComplexMultiplicationAndExplicitReciprocity:CM.0`, `CM.2` | CM orders and reciprocity. Quantitative orbit bounds and bounded-discriminant finiteness are additional Part II inputs. |
| `AlgebraicModuliForArithmeticGeometry:R09.1`, `R09.2` | Dimension, projective degree, generic projections and the finite-fibre rational-map formalism. |
| `ComplexComparisonPartII:C0`, `C4` | Singular complex analytic spaces, relatively closed analytic subsets, singular-space Remmert–Stein and Chow algebraization. |
| Integral Lattices, Layer 2F | Successive-minimum witnesses and Minkowski's second theorem. Its minima are squared lengths; take square roots before using the Rosati-length product estimate. |
| Real Algebraic Geometry | Semialgebraic sets and projection. Clearing the fractional-linear denominators specializes that existing theory; it does not introduce a second general projection API. |

The quantitative shared inputs have substantial content. An implementation must
import their actual statements with the specified field, height and uniformity
hypotheses. Merely assuming a qualitative isogeny criterion, a bare point-counting
theorem or qualitative CM reciprocity cannot discharge these uses:

- **Quantitative isogeny and endomorphism theory.** The elliptic input gives the
  degree bound `m̃ ≪ D̃⁷` in Layer 2, with its height estimate. The higher-dimensional
  input bounds the rational Rosati discriminant of `End(A×Ã)` and an isogeny degree
  in terms of the actual model-field degrees and stable heights, supplies
  Rosati submultiplicativity and `deg v ≤ ℓ(v)^{2 dim B}`, and provides the
  cusp-value lower bound used to estimate period diagonals. These are outputs
  of Faltings Finiteness and Isogeny Theorems, Part II. MZ20 §2 Lemma 2.2,
  p.644, §4 Lemmas 4.2–4.3, pp.655–657, and §5.1, pp.659–662, specify
  the applications.
- **Uniform projected blocks and functional transcendence.** The elliptic and
  Siegel families require connected Pila blocks, constants uniform in the
  period parameter, and semialgebraic projection images containing algebraic
  arcs when positive-dimensional. Ax–Lindemann and weakly special bi-algebraicity
  give the image dichotomy through a Hodge-generic point. These stronger
  inputs belong to Logic and Definability, Part II; the exact applications are
  MZ20 §3.2, pp.648–650, and §5.1, pp.662–663. Empty algebraic part is an
  image assertion, not an assertion about all matrix fibres.
- **Quantitative CM theory.** A uniform bound on model-field degrees must bound
  the relevant CM discriminants, and bounded discriminants must give finitely
  many distinct CM moduli points. The older orbit-bound route has the
  genus/GRH restriction stated in 8I. Its unconditional all-genus replacement
  uses the averaged-Colmez/Tsimerman input of Complex Multiplication and
  Explicit Reciprocity, Part II. MZ20 §5.4, p.667, gives the application;
  parameter multiplicities need the finite-domain hypotheses here as well.

## Conventions

Work in characteristic zero unless a supplier explicitly states a more general
result. `A_g` is the coarse moduli space over `ℚ`, and its complex points classify
principally polarized `g`-dimensional abelian varieties up to polarized
isomorphism. Set `G = g(g+1)/2`. Use `T_g` for the smooth Torelli image and
`closure(T_g)` for its reduced Zariski closure in the **open** `A_g`. The symbol
`H` denotes a fixed proper algebraic hypersurface, possibly defined over `ℂ`.
It is unrelated to the Siegel domain `ℋ_g`.

The period domain is the set of symmetric complex matrices `τ=x+iy` with
`y` real positive definite. Periods use a symplectic integral homology basis.
Write `y_i=y_ii` and `D_y=diag(y₁,…,y_g)`. Loewner order `u≤v` means that
`v−u` is positive semidefinite, using Mathlib's actual `Matrix.PosSemidef`.
The classically reduced domain `F_g` includes ordered diagonals. The enlarged
domain used for product periods keeps the diagonal comparisons and real-entry
bound but drops diagonal order. This difference matters for a block product.

For a usual symplectic matrix with blocks `(a,b;c,d)`, the action is the **left**
action `τ ↦ (aτ+b)(cτ+d)⁻¹`. The integer rational representation of an
endomorphism in the source uses signed blocks `(a,−b;−c,d)`. Convert those
signs before inserting its blocks into the positive-coordinate matrix
correspondence. All denominators are guarded by a nonzero determinant; a
total matrix inverse at a singular matrix is never interpreted geometrically.
Real coordinate blocks are cast entrywise into `ℂ`.

Rosati trace is rational trace on integral homology. Its real bilinear Gram
entry is `2 Re tr_ℂ(κ(v)y κ(w)̄ᵗ y⁻¹)` in the analytic representation.
Thus `ℓ([n])=√(2g)|n|`; dropping the factor two changes both norm and
discriminant conventions. Write `D(A)` for the determinant of the real
rational Gram matrix on an integral endomorphism basis, with covolume
`√D(A)`. It is distinct from the family field-degree bound `D` and a target
model degree `D̃`. Independent successive-minimum witnesses need not form an
integral basis.

An arithmetic family consists of dominant generically finite rational maps
`π:Ã ⇢ A_g` and `Ψ:Ã ⇢ 𝔸^G`, with specified nonempty common regular domains
and finite fibres. Its coefficient and model fields are part of the data. Use
`D(Ã,Ψ)=[F̃:ℚ][F_Ψ:ℚ]D_Ψ`, as in MZ20 §1.2 (1), p.638. Field of moduli,
field of definition of an abelian variety, theta-coordinate field, cyclotomic
field and torsion field are different objects. Model descent requires the
bounded fine-level lifting argument; do not identify a residue-field bound
with a model-field bound without it. The cyclotomic component of a full
symplectic level must be specified.

`h(A)` is the stable Faltings height in the supplier's fixed normalization.
It can be negative, so every positive majorant uses `max{1,h(A)}` or the
displayed equivalent. Box sizes `N`, degree cutoffs `M`, isogeny degrees `m`
and field degrees are positive integers with the lower bounds stated in each
milestone. Logs are natural logarithms. The notation `≪` denotes a positive
constant with exactly the fixed-data dependence stated there; no constant
may depend on `N`, `M` or a conjugate being counted.

Hodge genericity means `MT(H₁(A,ℚ))=GSp_{2g}`, equivalently that the moduli
point belongs to no proper special subvariety. For a fixed prime `p`,
`p`-Galois genericity means that the division-field image is open in
`GSp_{2g}(ℤ_p)`. Use the adelic Galois-generic notion in Pink's convention
for the intermediate implication in Layer 4. The arithmetic image is
compared up to conjugacy and commensurable integral lattices; isogeny does
not give equality of integral images. In particular, `End(A)=ℤ` is not a
replacement for Hodge or Galois genericity in dimension four.

Normalize the Siegel Fourier expansion as `∑_M a(M)exp(πi tr(Mτ))`.
The indices are symmetric rational positive-semidefinite matrices with
`dM` half-integral, meaning integral diagonal and half-integral off-diagonal.
The order is the least trace of a nonzero coefficient, extended by `ord(0)=∞`.
Theta characteristics are **row vectors**, and `e` is an integer level, not
a matrix. In `Γ(e,2e)`, both the principal congruence condition and the
diagonal divisibility conditions are required. For the projective construction
use the square level `e=16`, divisible by eight. The gamma function in the
Minkowski constant is the Euler gamma function, not a symplectic group.

All API and test names below lie in `TauCeti.NoJacobian`. The tests are
mathematical examples and counterexamples that distinguish the intended
definition from an incorrect one. `Suggested.lean` proposes the native forms
that the available interfaces allow; this document is the definitive roadmap.

## Existing library inputs

The native linear-algebra and finite-grid tools are already available. The
applications here should import them individually and should not restate their
definitions as new targets.

| Existing declaration | Use and limitation |
| --- | --- |
| `Polynomial.resultant`, `Polynomial.resultant_eq_zero_iff` | The fixed-size Sylvester determinant and its coprimality criterion. Specify the degree bounds before specializing; the criterion over a field includes `(f≠0 ∨ g≠0)`. |
| `MvPolynomial.schwartz_zippel_totalDegree` | The finite-grid zero-proportion bound for a nonzero polynomial over an integral domain. Clear the side cardinality only when the grid side is nonempty. |
| `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` | Vanishing on a product grid with each variable degree below the corresponding side size forces the polynomial to be zero. This supplies the nonzero degree-polynomial selection in 3H. |
| `Matrix.fromBlocks`, `Matrix.det_mul`, `Matrix.mul_nonsing_inv` | The actual block carrier, determinant product and nonsingular inverse law. The inverse law requires `IsUnit det`, equivalent to nonzero determinant over `ℂ`. |
| `isLittleO_log_rpow_rpow_atTop` | For every real logarithmic exponent and every positive power exponent, a logarithmic power is little-o of that positive power. This turns the logarithmic exceptional terms into the stated power saving. |
| `Matrix.PosSemidef`, `Matrix.PosDef.one`, `Matrix.PosDef.add_posSemidef`, `Matrix.posSemidef_self_mul_conjTranspose` | Native matrix order and the positivity of `I+wwᵗ` over the reals. These do not supply an analytification or a moduli space. |
| `TauCeti.cholesky`, `TauCeti.continuous_cholesky` | The actual positive-diagonal lower-triangular factor of a positive-definite real symmetric matrix and its continuity. Continuity suffices for successive interpolation tolerances; no Lipschitz estimate is inferred. |
| `NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt` | A number field containing a primitive root of order greater than two has no real places; combine it with the Weil-pairing implication in 10B. |

The Tau Ceti abelian-variety, endomorphism and isogeny APIs remain the underlying
objects for the geometric suppliers. Their existence is not a substitute for
principal polarization, degree, complex uniformization or arithmetic fine-level
comparison. Likewise the Hodge polarization API is linear Hodge theory; an
abelian-variety Rosati involution must come through the geometric supplier.

## Order of the construction

| Layer | Main output |
| --- | --- |
| 0 (`MZ0`) | Torelli and period-domain conventions, coefficient descent and the guarded matrix correspondence. |
| 1 (`E0`) | Elliptic matrix heights, subgroup counts and many elliptic isogeny classes. |
| 2 (`E1`) | Elliptic real-curve avoidance and the corrected horizontal-offset bound. |
| 3 (`I0`) | Rational Rosati normalization, short off-diagonal isogenies and period heights. |
| 4 (`G0`) | Genericity implications and arithmetic exceptional sets. |
| 5 (`C0`) | Arithmetic candidates and large-isogeny field-degree growth. |
| 6 (`T0`) | Theta coordinate model and explicit parameter degree. |
| 7 (`C1`) | Projected-block collapse and the strong quantitative counting theorem. |
| 8 (`A0`) | Bounded-degree avoidance, no Jacobians, density and conditional rational examples. |
| 9 (`X0`) | Compact real analytic interpolation images meeting every algebraic isogeny class. |
| 10 (`T1`) | The separate arithmetic full-level comparison and torsion-degree problem. |
| 11 (`X1`) | Algebraicity of globally closed analytic hypersurfaces and the local replacement specification. |

Layers 1–2 and 3–5 are largely independent after Layer 0. Layer 6 comes before
the final statement of Layer 7 because it supplies the explicit numerical `D`.
Layers 10–11 do not feed the avoidance proof. Within a layer, the direct input
table below specifies the dependencies between its milestones.

## Layer 0: Moduli, the Torelli locus and period conventions (MZ0)

The common geometric language comes first. The Torelli closure is taken in the open Siegel moduli
space, whereas compactifications enter only when explicitly specified. The last two milestones
supply algebraic descent and the actual matrix set used in the counting argument; they do not define
a second moduli theory.

**0A. The smooth Torelli locus.**

For g≥2, define T_g⊆A_g as the image of the smooth genus-g curve moduli stack under the canonical
principally polarized relative Jacobian morphism. Take its reduced Zariski closure inside A_g, not
inside a Satake compactification. Isogenies in the avoidance problem need not preserve
polarizations.

API in `TauCeti.NoJacobian`:

- `torelliLocus.mem_iff`: x∈T_g iff x is the canonically polarized Jacobian of a smooth genus-g curve over an algebraically closed field of characteristic zero.
- `torelliLocus.subset_closure`: T_g⊆closure(T_g), with closure in A_g.
- `torelliLocus.baseChange`: The relative Jacobian moduli morphism commutes with extension of characteristic-zero algebraically closed fields.
- `torelliLocus.jacobianComparison`: For a single curve the relative Jacobian specializes to the JacobianChallenge Jacobian with its theta polarization.

Unit tests:

- `torelliLocus.genusTwoClosure`: The closure of T_2 is A_2; it is not a proper hypersurface.
- `torelliLocus.genusFourDimension`: dim T_4=9 whereas dim A_4=10.
- `torelliLocus.productBoundary`: A product of two elliptic curves belongs to closure(T_2) and is not a smooth genus-two Jacobian with its product principal polarization.

Source: [MZ20] §1.1 pp.635–636 and §1.2 p.637.

**0B. Torelli dimension.**

For g≥2 in characteristic zero, dim T_g=3g−3. In particular 3g−3<g(g+1)/2 for g≥4.

Source: [MZ20] §1.1 p.635; §1.2 p.637.

**0C. Compact-type Jacobians and the Torelli closure.**

Over C, closure(T_g) inside A_g is the locus of principally polarized Jacobians of stable
compact-type genus-g curves. Its product factors come from the smooth components; non-compact-type
generalized Jacobians have toric parts and are not A_g-points.

Source: [MZ20] §1.1 pp.635–636; §1.4 p.642.

**0D. A hypersurface containing the Jacobian locus.**

For g≥4 over C, choose a proper algebraic hypersurface H_g⊆A_g containing closure(T_g). The choice
is an algebraic hypersurface in a quasi-projective moduli space; it need not be defined over Q.

API in `TauCeti.NoJacobian`:

- `jacobianHypersurface.contains`: Every canonically polarized compact-type Jacobian lies in the chosen H_g.
- `jacobianHypersurface.proper`: H_g is a proper algebraic subset of pure codimension one after adding any needed hypersurface components.
- `jacobianHypersurface.dimension`: dim H_g=G−1 on its nonempty components.
- `jacobianHypersurface.ambient`: The containment is inside PELModuli A_g and is independent of a chosen level lift.

Unit tests:

- `jacobianHypersurface.genusFour`: For g=4 the Jacobian closure itself is the Schottky hypersurface.
- `jacobianHypersurface.genusThree`: The construction requires g≥4: closure(T_3)=A_3.
- `jacobianHypersurface.levelForgetful`: Every fine-level lift of a Jacobian maps into H_g under the forgetful map.

Source: [MZ20] §1.1 p.635; §1.2 Corollary 1.2 p.637.

**0E. The classical Minkowski-reduced Siegel domain.**

For g≥1, F_g is the set of symmetric τ=x+iy in ℋ_g for which y is Minkowski reduced, every
|x_ij|≤1/2, and |det(cτ+d)|≥1 for every block matrix in Sp_{2g}(Z). Pin the classical reduction
inequalities, including the ordered diagonal, and retain boundary equalities.

API in `TauCeti.NoJacobian`:

- `minkowskiDomain.mem_iff`: For τ∈ℋ_g, membership in F_g is equivalent to Minkowski reduction of Im τ, all |Re τ_ij|≤1/2, and all symplectic-block determinant inequalities |det(cτ+d)|≥1; these retain equality on the boundary.
- `minkowskiDomain.orbitMeets`: Every Sp_{2g}(Z)-orbit in ℋ_g meets F_g.
- `minkowskiDomain.realPart`: τ∈F_g implies |Re τ_ij|≤1/2 for all i,j.
- `minkowskiDomain.semialgebraic`: F_g is semialgebraic after the source reduction to finitely many polynomial inequalities.
- `minkowskiDomain.genusOne`: F_1 agrees with the closed SL_2(Z) domain |Re τ|≤1/2 and |τ|≥1.

Unit tests:

- `minkowskiDomain.i`: τ=i lies in F_1 and has y=1.
- `minkowskiDomain.smallImaginary`: τ=i/2 is in ℋ_1 but not in F_1.
- `minkowskiDomain.diagonalOrder`: The block product diag(2i,i) need not lie in F_2 because its imaginary diagonal is not ordered.

Source: [MZ20] §4 p.653; Igusa references pp.192–195.

**0F. Igusa diagonal comparison.**

For each g≥1 there exists δ_g∈(0,1] such that every τ=x+iy∈F_g satisfies δ_g y^(0)≤y≤δ_g⁻¹y^(0),
y^(0)≥δ_g I, and √3/2≤y_1≤⋯≤y_g. Matrix order means positive semidefinite difference.

Source: [MZ20] §4 (23)–(24) p.653.

**0G. The enlarged product domain.**

If two genus-g matrices satisfy the diagonal comparisons with the same δ∈(0,1] and |x_ij|≤δ⁻¹, their
block diagonal matrix in H_{2g} satisfies the same comparisons and real-entry bound. No ordered
diagonal hypothesis is retained.

Source: [MZ20] §4 p.653; §5.1 p.662.

**0H. An algebraic hypersurface capturing algebraic points.**

For a proper complex algebraic hypersurface H in a geometrically integral quasi-projective variety X
defined over Q̄, its Q̄-points are contained in a proper Q̄-defined algebraic hypersurface H′. On a
finite affine/projective cover, expand defining equations against a finite Q̄-linearly independent
coefficient basis; all resulting coefficient equations vanish at algebraic points.

Source: [MZ20] §3.2 pp.646–647 and §5.1 p.661 (Galois conjugation setup).

**0I. A fractional-linear period-matrix correspondence.**

For g≥1, τ∈M_g(C) and any Z⊆M_g(C), define W_τ(Z)⊆M_2(M_g(R)) by det(cτ+d)≠0 and (aτ+b)(cτ+d)⁻¹∈Z.
Here a,b,c,d are the four real blocks cast entrywise to C, in the order X_00,X_01,X_10,X_11. The
signs in the integer rational representation (a,−b;−c,d) are converted to this positive coordinate
convention before membership.

API in `TauCeti.NoJacobian`:

- `periodMatrixCorrespondence.mem_iff`: X∈W_τ(Z) iff det(cτ+d)≠0 and (aτ+b)(cτ+d)⁻¹∈Z in the pinned block convention.
- `periodMatrixCorrespondence.mono`: Z⊆Z′ implies W_τ(Z)⊆W_τ(Z′).
- `periodMatrixCorrespondence.inter`: W_τ(Z∩Z′)=W_τ(Z)∩W_τ(Z′).
- `periodMatrixCorrespondence.empty`: W_τ(∅)=∅.
- `periodMatrixCorrespondence.identity`: The 2×2 block identity belongs to W_τ(Z) iff τ∈Z, with ordinary native matrix multiplication and inverse.

Unit tests:

- `periodMatrixCorrespondence.emptyTarget`: For any g≥1 and τ, W_τ(∅)=∅.
- `periodMatrixCorrespondence.identityGenusOne`: At g=1, τ=i and Z={i}, the real block identity lies in W_τ(Z).
- `periodMatrixCorrespondence.singularExcluded`: The zero block matrix does not lie in W_τ(Z), even for Z=all matrices, when g≥1.

Source: [MZ20] §5.1 pp.662–663.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 0A | `JacobianChallengePartII:JC1/relative-jacobian`; `JacobianChallengePartII:JC1/principal-polarization`; `StableReductionPartII:MC.2/pointed-dm-theorem`; `PELModuli:M5` |
| 0B | 0A |
| 0C | 0A; `StableReductionPartII:MC.2/pointed-dm-theorem` |
| 0D | 0B; 0C; `ShimuraCompactifications:C5` |
| 0E | `ShimuraData:D5`; `AdelicAlgebraicGroups:AA.3`; `ShimuraVarieties:V0` |
| 0F | 0E |
| 0G | 0F; Mathlib `Matrix.fromBlocks` |
| 0H | `AlgebraicModuliForArithmeticGeometry:R09.1`; `PELModuli:M5` |
| 0I | Mathlib `Matrix.fromBlocks`; Mathlib `Matrix.mul_nonsing_inv` |

## Layer 1: Elliptic matrices and isogeny-class counts (E0)

These three estimates isolate the genus-one arithmetic needed both for the elliptic argument and for
the later comparison of isogeny classes. A degree-m elliptic isogeny need not be cyclic; the matrix
estimate applies to it nonetheless. The subgroup count is a count of subgroups, rather than of
choices of generators.

**1A. Bounded integer matrix of an elliptic isogeny.**

If E, Ẽ are related by an isogeny of degree m and τ, τ̃ ∈ F satisfy j(τ) = j(E), j(τ̃) = j(Ẽ), then
τ̃ = (aτ + b)/(cτ + d) with a, b, c, d ∈ Z, ad − bc = m and max{|a|, |b|, |c|, |d|} ≤ 2m^{3/2}.

Source: [MZ20] §2 Lemma 2.1 p.643.

**1B. Finite subgroups of a rational torus.**

For g≥1 there exists C_g>0 such that the number of finite subgroups Γ⊆(Q/Z)^{2g} of order at most m
is ≤C_g m^{2g} for every integer m≥1. For g=1 the bound m² suffices.

Source: [MZ20] §2 p.644; §5.1 Lemma 5.1(b) p.658.

**1C. Many elliptic isogeny classes.**

For every integer N≥2, the curves E_j, j = n1 + in2 with 1 ≤ n1, n2 ≤ N, represent at least C_0^{-1}
N²/(log N)⁴ isogeny classes, C_0 > 0 absolute.

Source: [MZ20] §2 p.644.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 1A | 0E; `ModularCurvesPartII:R12.1` |
| 1B | Mathlib subgroups, finite sets and integer arithmetic; the finite-subgroup estimate is the new theorem of this milestone. |
| 1C | 1B |

## Layer 2: Elimination and elliptic real-curve avoidance (E1)

Elimination controls the small-degree isogenies, and definable blocks control the remaining Galois
conjugates. The projected periods are what have trivial algebraic part. The ambient
eight-dimensional matrix correspondence can have positive-dimensional fibres, so applying point
counting directly to that matrix set would give the wrong conclusion.

**2A. Elimination along two modular correspondences.**

Given f ≠ 0 in C[y1, y2] there is c = c(f) such that for every integer m≥1 there is G_m ≠ 0 in C[x1,
x2] of degree at most cψ(m)² with G_m(ξ1, ξ2) = 0 whenever Φ_m(ξ1, η1) = Φ_m(ξ2, η2) = f(η1, η2) =
0.

API in `TauCeti.NoJacobian`:

- `eliminationPolynomial.nonzero`: For f≠0 and m≥1 the chosen G_m is nonzero.
- `eliminationPolynomial.vanishes`: A common solution of the two modular equations and f=0 maps to G_m=0.
- `eliminationPolynomial.degree`: deg G_m≤c(f)ψ(m)².
- `eliminationPolynomial.constant`: For nonzero constant f choose G_m=1.
- `eliminationPolynomial.resultantComparison`: Each elimination uses Polynomial.resultant at the fixed source degree bounds, with its specialization law.

Unit tests:

- `eliminationPolynomial.constantOne`: For f=1 there are no common solutions and G_m=1 works.
- `eliminationPolynomial.identityCorrespondence`: For m=1 and f(y1,y2)=y1−y2 one may choose G_1=x1−x2 up to a nonzero scalar.
- `eliminationPolynomial.zeroExcluded`: f=0 is excluded: a nonzero polynomial cannot vanish on every pair under the identity correspondence.

Source: [MZ20] §3.2 Lemma 3.1 pp.646–647.

**2B. A quadratic modular-degree sum.**

For ψ(m)=m∏_{p∣m}(1+1/p) and integers M≥2, ∑_{1≤m≤M}ψ(m)²≪M³ log M. The companion bound is
∑_{m≤M}ψ(m)≤∑_{d≤M}d⌊M/d⌋≤M²; keeping the floor factor is necessary for the divisor-sum argument.

Source: [MZ20] §3.2 Lemma 3.2 p.647; §3.1 p.645.

**2C. Few small-isogeny elliptic candidates.**

Fix a nonzero polynomial f∈Q̄[y1,y2] and the real algebraic curve C={c∈C:f(c,c̄)=0}, with constants
depending on f. Given integers M ≥ 2 and N ≥ 1, there are only ≪_f N M³ log M pairs n = (n1, n2)
with 1 ≤ n1, n2 ≤ N such that E_n (j = n1 + in2) is isogenous to its complex conjugate or to some
E_c with c ∈ C via an isogeny of degree at most M.

Source: [MZ20] §3.2 Lemma 3.2 p.647.

**2D. Large isogenies force large fields.**

For N sufficiently large depending on the fixed f, with M=floor((log N)³)≥2, suppose E_n is
isogenous to Ẽ=E_c with c∈C and n is outside the exceptions of 2C at this M. If Ẽ has a model over a
number field of degree at most D̃≥2, then there is an isogeny of degree m̃≪D̃⁷ and log N≪D̃²(log
D̃)². Constants depend only on the fixed curve.

Source: [MZ20] §3.2 Lemma 3.3 p.648.

**2E. The paired elliptic period correspondence.**

For τ,τ′∈ℋ_1 and a non-modular absolutely irreducible C_f⊆C², put Z=F_1²∩(j×j)⁻¹(C_f). Let
W_{τ,τ′}⊆R^8 be the pairs of real 2×2 fractional-linear matrices with both denominators nonzero and
both outputs in Z. Its projection π sends a pair to those two periods; no determinant=m restriction
is part of the ambient definable family.

API in `TauCeti.NoJacobian`:

- `ellipticDoubleCorrespondence.mem_iff`: Membership requires both nonzero denominators and f(j(output1),j(output2))=0 with both outputs in F_1.
- `ellipticDoubleCorrespondence.projection`: π(X,X′) is the ordered pair of fractional-linear images.
- `ellipticDoubleCorrespondence.height`: The integral matrices arising from degree m isogenies have all eight entries at most 2m^{3/2}.
- `ellipticDoubleCorrespondence.productCompatibility`: The two outputs agree with the genus-one specialization of periodMatrixCorrespondence.

Unit tests:

- `ellipticDoubleCorrespondence.identityPair`: For identity matrices membership is exactly (τ,τ′)∈Z.
- `ellipticDoubleCorrespondence.oneZeroDenominator`: A zero denominator in either factor excludes the pair even if the other factor is valid.
- `ellipticDoubleCorrespondence.pairedNeeded`: A single R^4 correspondence does not encode both conjugate modular equations used in this proof.

Source: [MZ20] §3.2 (13)–(18) pp.649–650.

**2F. The non-modular elliptic image has no positive-dimensional blocks.**

If C_f⊆C² is absolutely irreducible, involves both variables, and is neither a modular
correspondence nor vertical/horizontal, then Z=F_1²∩(j×j)⁻¹(C_f) has empty algebraic part. Every
connected Pila-block image under π is a point.

Source: [MZ20] §3.2 p.650.

**2G. Bounded elliptic Galois degree.**

Outside the small-isogeny exceptional set, the paired periods of the conjugates of c have
cardinality ≫D̃ and lie among ≤C_ε T^ε point images with T≤2m̃^{3/2}. Hence D̃≪m̃^{3ε/2}; choosing
0<ε<2/21 and m̃≪D̃^7 forces D̃≪1.

Source: [MZ20] §3.2 pp.649–650.

**2H. The modular real-curve case.**

If the real algebraic curve becomes a modular correspondence Φ_m(j,j̄)=0, any E_n isogenous to a
curve on it is isogenous to its own complex conjugate. The number of such n is ≪N(log N)^7; the
fixed m changes the implied constant.

Source: [MZ20] §3.2 p.648.

**2I. The elliptic real-curve avoidance theorem.**

Given a real algebraic curve C in A_1(C) = R², there is C = C(C) such that for every integer N ≥ 2
there are at most C N(log N)^{10} pairs of integers 1 ≤ n1, n2 ≤ N for which E_j, j = n1 + in2,
either has complex multiplication or is isogenous to some E_c with c ∈ C.

Source: [MZ20] §1.2 Theorem 1.7 p.640; §3.2 pp.646–651.

**2J. Exceptional horizontal offsets.**

Let d≥1 bound each variable degree of f. For n0≠0, if G_m(x+in0,x−in0) is identically zero, the
modular function-field argument forces ψ(m)≤d. For each such m at most 2dψ(m)² integer offsets are
exceptional.

Source: [MZ20] §3.3 p.651.

**2K. A corrected polynomial bound for a one-parameter offset.**

With the variable-degree bound d≥1 and obstruction in 2J, there is an integer 1≤n₀≤2d⁴+1 such that
every specialization G_m(x+in₀,x−in₀) is nonzero. The elementary proof uses ψ(m)≥m, hence m≤d, and
sums at most 2dψ(m)²≤2d³ forbidden offsets for each of at most d degrees. The sharper bound 2d³+1
and a quantitative exceptional-count theorem on the selected horizontal line are additional
problems; they are not consequences of this union bound.

Source: [MZ20] §3.3 p.651.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 2A | Mathlib `Polynomial.resultant`; Mathlib `Polynomial.resultant_eq_zero_iff`; `ModularCurvesPartII:R13.4` |
| 2B | Mathlib finite sums, divisor arithmetic and real logarithms; the ψ estimate is proved here. |
| 2C | 2A; 2B; Mathlib `MvPolynomial.schwartz_zippel_totalDegree`; `ModularCurvesPartII:R13.4` |
| 2D | 2C |
| 2E | 1A; 0I; 0E; `ModularCurvesPartII:R12.1`; `LogicAndDefinabilityInNumberTheory:LD.6` |
| 2F | 2E; `LogicAndDefinabilityInNumberTheory:LD.6` |
| 2G | 2F; 2D; `LogicAndDefinabilityInNumberTheory:LD.6` |
| 2H | 2C; 2D |
| 2I | 2G; 2H; 2C; 0H; 2D |
| 2J | 2A; `ModularCurvesPartII:R13.4` |
| 2K | 2J |

## Layer 3: Rosati geometry and controlled period matrices (I0)

The rational Rosati form is the Euclidean form on the endomorphism lattice. Its integral Gram
determinant fixes the covolume used by Minkowski’s theorem. The four entry estimates have the same
period-domain hypotheses; their different powers of the diagonal entries are essential when the
product period is not classically reduced.

**3A. The corrected rational Rosati trace.**

For a principally polarized complex A of dimension g≥1, a symplectic integral homology basis with
polarization matrix ε and period τ=x+iy∈ℋ_g, and endomorphisms v,w, the rational Rosati Gram entry
tr_Q(ρ(v)ερ(w)^tε⁻¹) equals 2 Re tr_C(κ(v)yκ(w)̄^t y⁻¹). In particular ℓ(v)² is the rational
expression and is twice the complex self-expression. D(A) is the determinant of the real rational
Gram matrix, never of the complex Hermitian matrix.

Source: [MZ20] §4 (21)–(22) p.653 and discriminant display p.655.

**3B. Lower-left period-matrix entry bounds.**

Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A in a symplectic
integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹.
For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational
Rosati length of 3A. Then |c_ij|≤C(g,δ)ℓ(v)/√(y_i y_j).

Source: [MZ20] §4 Lemma 4.1 pp.654–655.

**3C. Upper-left period-matrix entry bounds.**

Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A in a symplectic
integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹.
For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational
Rosati length of 3A. Then |a_ij|≤C(g,δ)√(y_i/y_j)ℓ(v).

Source: [MZ20] §4 Lemma 4.1 p.654.

**3D. Lower-right period-matrix entry bounds.**

Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A in a symplectic
integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹.
For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational
Rosati length of 3A. Then |d_ij|≤C(g,δ)√(y_j/y_i)ℓ(v).

Source: [MZ20] §4 Lemma 4.1 pp.654–655.

**3E. Upper-right period-matrix entry bounds.**

Let g≥1, 0<δ≤1 and τ=x+iy∈ℋ_g be a period of a principally polarized complex A in a symplectic
integral basis. Put D_y=diag(y_1,…,y_g), y_i=y_ii, and require δD_y≤y≤δ⁻¹D_y, D_y≥δI and |x_ij|≤δ⁻¹.
For v∈End(A) let ρ(v)=(a,−b;−c,d) be its signed integral representation and let ℓ be the rational
Rosati length of 3A. Then |b_ij|≤C(g,δ)√(y_i y_j)ℓ(v).

Source: [MZ20] §4 Lemma 4.1 pp.654–655.

**3F. Off-diagonal endomorphism extraction.**

For B=A×Ã let e,ẽ be the two factor projections as endomorphisms. The additive Z-linear operator
v↦v#=e v ẽ+ẽ v e sends a block Hom matrix to (α,α̃)↦(f̃(α̃),f(α)), with zero diagonal blocks. Its
Rosati length is ≤C_gℓ(v).

API in `TauCeti.NoJacobian`:

- `offDiagonal.apply`: offDiagonal(v)(α,α̃)=(f̃(α̃),f(α)) in the source block decomposition.
- `offDiagonal.add`: offDiagonal(v+w)=offDiagonal(v)+offDiagonal(w).
- `offDiagonal.idempotent`: offDiagonal(offDiagonal(v))=offDiagonal(v).
- `offDiagonal.homComparison`: The two off-diagonal entries are exactly the native product-Hom projections and not chosen maps.

Unit tests:

- `offDiagonal.identityZero`: offDiagonal(id_{A×Ã})=0.
- `offDiagonal.alreadyOffDiagonal`: A block matrix with zero diagonal is unchanged.
- `offDiagonal.sameFactorEndomorphism`: An endomorphism acting only on A is sent to zero, not preserved.

Source: [MZ20] §4 (26)–(28) pp.655–656.

**3G. A short independent endomorphism family.**

For E=End(A×Ã) of rank r≤(4g)² and rational Rosati discriminant D, there are Z-linearly independent
v_1,…,v_r with ∏ℓ(v_i)≤C_g√D. Each nonzero integral endomorphism has ℓ≥1, hence max_iℓ(v_i)≤C_g√D.

Source: [MZ20] §4 (29) p.656.

**3H. A controlled-length off-diagonal isogeny.**

There is c = c(g) such that for isogenous principally polarized A, Ã of dimension g there are
isogenies f : A → Ã and f̃ : Ã → A such that v(α, α̃) = (f̃(α̃), f(α)) on A × Ã has ℓ(v) ≤ c D(A ×
Ã)^{1/2}; consequently (deg f)(deg f̃) = deg v ≤ ℓ(v)^{4g} (31).

Source: [MZ20] §4 Lemma 4.2 and (30)–(31) pp.655–656.

**3I. Imaginary periods bounded by Faltings height.**

Given g ≥ 1 and 0 < δ ≤ 1 there is C = C(g, δ) such that if τ = x + iy∈ℋ_g represents principally
polarized A in a symplectic integral basis, defined over a number field of degree at most D,
satisfies y ≥ δy^{(0)} and y^{(0)} ≥ δι, then y_i ≤ C D max{1, h(A)} for i = 1, …, g.

Source: [MZ20] §4 Lemma 4.3 pp.656–657.

**3J. Invertibility of the fractional-linear denominator.**

For complex square matrices a,b,c,d,τ,η of size g, if det(a,−b;−c,d)≠0 and η(cτ+d)=aτ+b, then
det(cτ+d)≠0 and η=(aτ+b)(cτ+d)⁻¹. The block matrix is Matrix.fromBlocks a (−b) (−c) d; no
polarization-preserving hypothesis is used.

Source: [MZ20] §5.1 (39)–(42) p.661.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 3A | `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`; `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`; `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`; `AbelianSchemesAndArithmeticModuli:A5` |
| 3B | 3A; 0G |
| 3C | 3B; 3A |
| 3D | 3B; 3C |
| 3E | 3D; 3C |
| 3F | `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`; 3A |
| 3G | 3A; `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`; Integral Lattices, Layer 2F (successive minima and Minkowski’s second theorem) |
| 3H | 3G; 3F; `AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function`; Mathlib `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` |
| 3I | 0G; `ArakelovGeometryAndAbelianHeights:R35.3`; `AutomorphicBundles:B4`; `AutomorphicBundles:B5` |
| 3J | Mathlib `Matrix.fromBlocks`; Mathlib `Matrix.det_mul`; Mathlib `Matrix.mul_nonsing_inv` |

## Layer 4: Galois genericity and arithmetic specialization (G0)

The arithmetic specialization argument supplies the genericity hypotheses used by the geometric
block argument. Geometric endomorphism ring ℤ, open p-adic image, adelic genericity and Hodge
genericity are separate conditions. Only the stated implications connect them; the Serre dimension
restriction must survive every later application.

**4A. Isogeny and conjugation invariance of p-genericity.**

For a number-field principally polarized A of dimension g and a prime p, openness of its p-adic
division-field image in GSp_{2g}(Z_p) is invariant under geometric isogeny and Galois conjugation.
Extend fields to define the isogeny, use finite-index restrictions, and compare integral lattices up
to commensurability; do not assert equality of integral images.

Source: [MZ20] §5.1 pp.658 and 663.

**4B. Cadoret: p-genericity implies Galois genericity.**

For a principally polarized abelian variety of positive dimension over a number field, p-Galois
genericity for a single prime p implies the Galois-generic property in Pink’s convention, using the
precise adelic open-image theorem of Cadoret. No Mumford–Tate conjecture is assumed.

Source: [MZ20] §5.1 p.658; Cadoret [5] Theorem 1.2.

**4C. Pink: Galois genericity implies Hodge genericity.**

For a principally polarized number-field A, Galois genericity implies MT(H_1(A,Q))=GSp_{2g}, hence
Hodge genericity of its A_g-point. The implication uses the absolute-Hodge theorem for abelian
varieties; End(A)=Z alone is not a substitute.

Source: [MZ20] §1.2 p.637; §5.1 pp.657,663; Pink [36] p.274.

**4D. Serre open image in the permitted dimensions.**

Let A be a dimension-g principally polarized abelian variety over a number field, with geometric
End(A)=Z. If g is odd or g∈{2,6}, A is p-Galois generic for every prime p. No corresponding
inference is made for g=4.

Source: [MZ20] §5.1 Lemma 5.1(c) p.658; Serre [39] p.35.

**4E. Open arithmetic monodromy of the universal family.**

For generic x of A^G and A_x in the projection of Ψ^{-1}(x), defined over a finite extension k_x of
Q(x), the Galois group of k_x(A_x[p^∞])/k_x contains an open subgroup of Sp_{2g}(Z_p) (Deligne,
Hodge II, Lemma 4.4.16), and is therefore open in GSp_{2g}(Z_p) by the Weil pairing.

Source: [MZ20] §5.1 p.659; Deligne [10] Lemma 4.4.16.

**4F. Few endomorphism-specialization exceptions.**

For the fixed arithmetic finite cover π:Ã⇢A_g and dominant generically finite parameter map Ψ:Ã⇢A^G
used in the candidate setup, take the associated polarized family on a specified common regular
finite-fibre domain, with generic geometric endomorphism ring Z. For every N≥2, the number of
integral n∈[1,N]^G for which some regular projected fibre has geometric End≠Z is ≪N^{G−1}(log N)^µ,
µ=µ(g), with constants depending on the fixed family. The fixed algebraic bad locus contributes
O(N^{G−1}) separately. This is the source-scoped application of Masser [23], not an assertion for an
arbitrary complex family.

Source: [MZ20] §5.1 p.658; Masser [23] main theorem.

**4G. Full p-adic image from a finite Frattini quotient.**

For the open compact p-adic image G of the universal family, its Frattini subgroup Φ(G) is open. A
specialized closed subgroup G_y with full image in G/Φ(G) equals G. Hilbert irreducibility excludes
a thin set so that this full image holds outside it.

Source: [MZ20] §5.1 p.659.

**4H. The genericity exceptional-set bound.**

For the fixed finite cover and generically finite parameter map, at most C[N^{G−1}(log
N)^μ+N^{G−1/2}log N] integral n∈[1,N]^G have a projected fibre point which is not p-Galois generic,
with fixed p and N≥2. If g is odd or g∈{2,6}, omit the half-saving term.

Source: [MZ20] §5.1 (32) pp.658–659.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 4A | `ArithmeticGaloisRepresentations:R01.6`; `AbelianSchemesAndArithmeticModuli:A3` |
| 4B | `ArithmeticGaloisRepresentations:R01.6`; `FaltingsFinitenessAndIsogenyTheorems:R28.4` |
| 4C | 4B; `ShimuraData:D1`; `ShimuraData:D4`; `ShimuraData:D5` |
| 4D | `ArithmeticGaloisRepresentations:R01.6`; `FaltingsFinitenessAndIsogenyTheorems:R28.4` |
| 4E | `PELModuli:M2`; `PELModuli:M5`; `AbelianSchemesAndArithmeticModuli:A5`; `ArithmeticGaloisRepresentations:R01.6` |
| 4F | `PELModuli:M5`; `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank` |
| 4G | 4E; `InverseGaloisAndArithmeticFundamentalGroups:IG.2` |
| 4H | 4G; 4F; 4D; Mathlib `MvPolynomial.schwartz_zippel_totalDegree`; `InverseGaloisAndArithmeticFundamentalGroups:IG.2` |

## Layer 5: Candidate families and large-isogeny estimates (C0)

Fix the arithmetic cover, its parameter map, the hypersurface and a prime p before choosing a box
size N or a cutoff M. All exceptional events are existential over the regular fibre: a box point is
bad if any projected point is bad. The fixed algebraic locus where a rational map is undefined or a
fibre is not finite is removed first.

**5A. Fields of regular finite fibres.**

Let π:Ã⇢A_g and Ψ:Ã⇢A^G be dominant generically finite rational maps over number fields F̃,F_Ψ, with
degree D_Ψ for Ψ. Outside a fixed algebraic exceptional locus, every projected fibre point over an
integral n has a field of definition of degree ≤D=[F̃:Q][F_Ψ:Q]D_Ψ in the source’s moduli/model
interpretation. Indeterminacy, nonfinite fibres and model descent are separate hypotheses.

Source: [MZ20] §1.2 (1) p.638; Lemma 5.1(a) p.658.

**5B. A bounded model field over the moduli field.**

For a principally polarized abelian variety Ã over Q̄ with moduli point x ∈ A_g(Q̄) and field of
moduli Q(x), there is a field of definition K̃ ⊇ Q(x) of Ã with [K̃ : Q(x)] ≤ c(g): lift x to the
fine moduli space A_{g,3} of principally polarized abelian varieties with full level-3 structure and
take the residue field of the lift.

Source: [MZ20] §5.1 p.663 orbit-degree adapter.

**5C. Reverse a small isogeny by principal duality.**

For principally polarized A,Ã and an isogeny f:A→Ã of degree m, identify the dual isogeny Ã∨→A∨ with
an isogeny Ã→A of the same degree m using the principal polarizations. Thus A≅Ã/ker(f∨), without
requiring f to preserve the polarizations.

Source: [MZ20] §5.1 Lemma 5.1(b) p.658.

**5D. Small-isogeny hypersurface images.**

Fix an algebraic hypersurface H⊂A_g and integer M≥1. The points A with geometric End(A)=ℤ that are
connected to H by an unpolarized isogeny of degree at most M lie in an algebraic hypersurface of
degree at most C M^{2g} in the fixed parameter model. The constant depends on H, the cover,
parameter map and embedding, and is independent of M and N. This target requires the
correspondence-degree estimate as well as the subgroup count. End(A)=ℤ is needed to control the
principal polarizations; all other points are included in the separate genericity exceptional set.

Source: [MZ20] §5.1 Lemma 5.1(b) p.658.

**5E. The higher-dimensional candidate count.**

There is µ = µ(g) such that for integers M ≥ 1 and N ≥ 2 there are only ≪ N^{G−1}M^{2g} +
N^{G−1}(log N)^µ + N^{G−1/2} log N elements n ∈ [1, N]^G such that some A_n in the projection of
Ψ^{-1}(n) is (a) not defined over an extension of Q of degree at most D (1), (b) isogenous to some Ã
in H via an isogeny to Ã of degree at most M, or (c) not p-Galois generic, for a fixed prime p (p =
2 will do); the implied constant depends only on Ã, Ψ, H. For g odd or g = 2, 6 the last term can be
omitted.

Source: [MZ20] §5.1 Lemma 5.1 (32) pp.658–659.

**5F. Product discriminant and height estimates.**

For a candidate A=A_n and an isogenous Ã defined over a degree-D̃ field, with D̃≥2,
D(A×Ã)≪max{D̃,log N+h(Ã)}^λ and max{1,h(A),h(Ã)}≪log N+log m̃ for the selected isogeny of degree m̃.
The stable Faltings height may be negative.

Source: [MZ20] §5.1 Lemma 5.2 (34)–(35) p.660.

**5G. The isogeny-degree height bound.**

For λ=λ(g)>0, the selected isogeny f:A_n→Ã has degree m̃≪max{D̃,log N}^{2gλ}. Constants depend only
on the fixed family and H.

Source: [MZ20] §5.1 Lemma 5.2 (33) p.660.

**5H. A logarithmic threshold forces large target degree.**

Choose ν>2gλ and M=floor((log N)^ν). For sufficiently large N, a candidate avoiding all degree≤M
isogenies but isogenous to Ã has (log N)^ν≪m̃≪D̃^{2gλ}.

Source: [MZ20] §5.1 (36) p.660.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 5A | `PELModuli:M2`; `PELModuli:M5`; `AlgebraicModuliForArithmeticGeometry:R09.1` |
| 5B | `PELModuli:M2`; `PELModuli:M5`; `AbelianSchemesAndArithmeticModuli:A3` |
| 5C | `AbelianSchemesAndArithmeticModuli:A3`; 1B |
| 5D | 5C; 1B; `AlgebraicModuliForArithmeticGeometry:R09.1`; `PELModuli:M5`; 4C |
| 5E | 5A; 5D; 4H; Mathlib `MvPolynomial.schwartz_zippel_totalDegree` |
| 5F | 3H; `ArakelovGeometryAndAbelianHeights:R35.3`; `ArakelovGeometryAndAbelianHeights:R35.4` |
| 5G | 5F; 3H; Mathlib `isLittleO_log_rpow_rpow_atTop` |
| 5H | 5G; 5E |

## Layer 6: Fourier order, theta coordinates and explicit degree (T0)

This layer produces the numerical field-degree bound independently of the avoidance estimate. Use
the common theta multiplier, the finite-level norm and a strict Fourier cutoff to obtain a
projective relation. Arithmetic descent of the coordinate model is a separate input from the
analytic quotient description, and it does not identify a field in which all level-sixteen torsion
is rational.

**6A. The order of a Siegel Fourier expansion.**

For a nonzero Λ-form ϕ of nonnegative integer weight, g≥2, with Fourier expansion indexed by
positive-semidefinite symmetric rational M satisfying dM half-integral, define ord(ϕ)=min{tr
M:a(M)≠0}. Half-integral means integral diagonal and half-integral off-diagonal. The trace support
is a discrete nonnegative subset of (1/d)Z. Extend ord(0)=+∞ explicitly.

API in `TauCeti.NoJacobian`:

- `fourierOrder.supportMinimum`: For ϕ≠0, ord(ϕ) is attained and every nonzero coefficient has trace at least ord(ϕ).
- `fourierOrder.zero`: ord(0)=+∞ in the extended nonnegative order carrier.
- `fourierOrder.scalar`: For c∈C with c≠0, ord(cϕ)=ord(ϕ).
- `fourierOrder.vanishingCutoff`: For ϕ≠0, all coefficients with tr M≤W vanish iff ord(ϕ)>W.
- `fourierOrder.expansionCompatibility`: The coefficients are precisely the AutomorphicBundles Fourier coefficients in the same exp(πi tr(Mτ)) normalization; changing to 2πi rescales the index.

Unit tests:

- `fourierOrder.constant`: For a nonzero constant weight-zero form the order is 0.
- `fourierOrder.zeroForm`: The zero form has order +∞ and is excluded from finite order bounds.
- `fourierOrder.cutoffEquality`: If the first nonzero trace is W, the assertion that every coefficient with trace≤W vanishes is false.

Source: [MZ20] §5.2 p.665.

**6B. Superadditivity of Fourier order.**

For nonzero compatible Λ-forms ϕ_1,ϕ_2, ord(ϕ_1ϕ_2)≥ord(ϕ_1)+ord(ϕ_2). No equality is required;
cancellation at the lowest trace cannot reduce the order.

Source: [MZ20] §5.2 p.665.

**6C. The coset norm of a Λ-form.**

Let g≥2 and Λ◁Γ=Sp_{2g}(Z) have finite index n. For a Λ-form ϕ of weight k≥0 and representatives
γ_1=1,…,γ_n, define Φ=∏_i ϕ(γ_iτ)/Δ(γ_i,τ)^k and Φ_1=∏_{i≥2}ϕ(γ_iτ)/Δ(γ_i,τ)^k. Then Φ is a Γ-form
of weight nk and Φ_1 is a Λ-form of weight (n−1)k. For ϕ≠0 both are nonzero.

API in `TauCeti.NoJacobian`:

- `normForm.product`: The norm equals the stated finite product of slash transforms.
- `normForm.weight`: Its Γ weight is index(Λ) times the original weight.
- `normForm.factorization`: Φ=ϕΦ_1 with Φ_1 analytic of weight (n−1)k.
- `normForm.representativeIndependent`: Changing the coset representatives does not change Φ, by the Λ law and the cocycle.
- `normForm.slashCompatibility`: Each factor is the imported left-action slash transform in the AutomorphicBundles convention.

Unit tests:

- `normForm.indexOne`: For Λ=Γ, Φ=ϕ and Φ_1=1.
- `normForm.constantOne`: The norm of the weight-zero constant form 1 is 1.
- `normForm.wrongWeight`: For n>1 and k>0 the norm has weight nk, not k.

Source: [MZ20] §5.2 Lemma 5.3 pp.664–665.

**6D. Igusa full-group order bound.**

A nonzero Γ-form of weight k has ord ≤ κ_g k/(4π), with κ_g ≤ (2g/√3)c_g for the Minkowski constant
c_g ≤ (4/π)^g Γ((g+1)/2)² (3/2)^{(g−1)(g−2)} (Igusa [18, Th. 7 p. 206, p. 197]; Lekkerkerker [22, p.
63]). Here g≥2, k≥0 and the form is nonzero; Γ((g+1)/2) in the constant is the Euler gamma function,
not the symplectic group.

Source: [MZ20] §5.2 Lemma 5.4 proof p.665 and constant bound p.666.

**6E. Finite-level order bound.**

Let g≥2, k≥0 be an integer and Λ◁Γ=Sp_{2g}(Z) have finite index n=[Γ:Λ]. A nonzero Λ-form ϕ of
weight k satisfies ord(ϕ)≤κ_g n k/(4π), with Fourier order and κ_g as in the preceding milestones.

Source: [MZ20] §5.2 Lemma 5.4 p.665.

**6F. Theta constants in the fixed row-vector convention.**

For symmetric τ∈ℋ_g and real row characteristics m,m*, define
θ_{m,m*}(τ)=∑_{h∈Z^g}exp(πi(h+m)τ(h+m)^t+2πi(h+m)m*^t). For positive even integer e, define
Γ(e,2e)={γ=(a,b;c,d)∈Sp_{2g}(Z):γ≡I mod e, diag(ab^t)≡diag(cd^t)≡0 mod 2e}. Equivalently use
diag(a^tc),diag(b^td) in the second condition. The blocks here have the usual symplectic signs,
independent of the signed endomorphism convention. Use the theta family θ_{m,0}(eτ), with
m∈e⁻¹Z^g/Z^g and canonical representatives. For the projective model require 8|e and e a square.

API in `TauCeti.NoJacobian`:

- `thetaConstant.series`: The theta constant is the normally convergent series in the displayed row-vector convention.
- `thetaConstant.shiftFirst`: θ_{m+k,m*}=θ_{m,m*} for k∈Z^g by reindexing.
- `thetaConstant.shiftSecond`: θ_{m,m*+k}=exp(2πi m k^t)θ_{m,m*} for k∈Z^g.
- `thetaConstant.squaredWeight`: θ_{m,0}(eτ)² is a Γ(e,2e)-form of weight 1 with half-integral Fourier denominator d=e.
- `thetaConstant.analyticCompatibility`: Its holomorphy and slash law are statements in the imported Siegel/AutomorphicBundles types, not a private analytic carrier.
- `thetaLevel.mem_iff`: A symplectic integer matrix belongs to Γ(e,2e) iff it is I mod e and both diag(ab^t),diag(cd^t) vanish mod 2e.
- `thetaLevel.subgroup`: The congruence conditions define a subgroup of Sp_{2g}(Z); for positive even e it is normal and has finite index.
- `thetaLevel.inclusions`: Γ(2e)⊆Γ(e,2e)⊆Γ(e), with every level positive.
- `thetaLevel.transposeCompatibility`: The diagonal conditions are equivalent to diag(a^tc),diag(b^td)≡0 mod 2e, in the same principal-congruence subgroup.

Unit tests:

- `thetaConstant.zeroCharacteristicImaginary`: θ_{0,0}(it I_g) is positive real for t>0.
- `thetaConstant.oddElliptic`: For g=1, θ_{1/2,1/2}(τ)=0 by the odd-characteristic cancellation.
- `thetaConstant.secondShiftPhase`: For m=1/2 in genus one, shifting m* by 1 multiplies the value by −1 and is not ordinary periodicity.
- `thetaLevel.identity`: The identity belongs to Γ(e,2e) for every positive even e.
- `thetaLevel.principalDoubleLevel`: Every matrix congruent to I mod 2e satisfies both diagonal conditions and lies in Γ(e,2e).
- `thetaLevel.ellipticShear`: For g=1 and positive even e, the shear (1,e;0,1) lies in Γ(e) but not Γ(e,2e), since diag(ab^t)=e is not zero mod 2e.

Source: [MZ20] §5.2 pp.665–666; [BCCR17] §2 p.3, Igusa subgroup definition preceding Definition 2.1.

**6G. Squared theta combinations have weight one.**

For the specified positive even level e, the theta constants θ_{m,0}(eτ) have the common multiplier
needed so that every complex linear combination χ has χ² a Γ(e,2e)-form of weight 1, with Fourier
denominator e. For the geometric application use e=16.

Source: [MZ20] §5.2 Lemma 5.5 p.665.

**6H. Counting bounded-trace Fourier indices.**

For W≥0 and e≥1, the number of positive-semidefinite symmetric rational g×g matrices M with eM
half-integral and tr M≤W is at most (4eW+1)^G, where G=g(g+1)/2. Use the real bound as stated, or
its correctly rounded integer version.

Source: [MZ20] §5.2 Lemma 5.5 proof pp.665–666.

**6I. A high-order homogeneous theta relation.**

Let χ₁,…,χ_{G+2} be complex linear combinations of θ_{m,0}(eτ), let W≥0 be real and D≥0 an integer.
If (D+1)^{G+1}>(G+1)!(4eW+1)^G, there is a nonzero homogeneous P∈ℂ[X₁,…,X_{G+2}] of degree D for
which every Fourier coefficient of ϕ=P(χ₁²,…,χ_{G+2}²) with tr M≤W vanishes. Thus ϕ≠0 implies
ord(ϕ)>W. The strict inequality is the conclusion required in the next milestone; vanishing of all
coefficients with trace at most W proves it directly.

Source: [MZ20] §5.2 Lemma 5.5 (48) pp.665–666.

**6J. The order comparison forces an identically zero relation.**

Let n=[Γ:Γ(e,2e)] and β=κ_g n/(4π). If (D+1)^{G+1}>(G+1)!(4eβD+1)^G, the relation from the
coefficient-kernel theorem with W=βD satisfies P(χ_1²,…,χ_{G+2}²)=0 identically. Its degree in the
unsquared χ variables is 2D.

Source: [MZ20] §5.2 p.666.

**6K. The theta-coordinate projective model.**

For e=16, form the quasi-projective image V_e of ℋ_g under [θ_{m,0}(eτ)]_m and its irreducible
projective closure. Its complex analytic quotient is the quotient of ℋ_g by Γ(e,2e) in the exact
source level interpretation. Its Q-coordinate model and Q-defined forgetful morphism to A_g require
the arithmetic descent theorem, independently of any universal full-torsion family.

API in `TauCeti.NoJacobian`:

- `thetaModel.coordinateMap`: The coordinate map uses the family θ_{m,0}(16τ) in projective space.
- `thetaModel.dimension`: dim V_16=G.
- `thetaModel.quotientComparison`: The complex quotient comparison preserves the source’s exact congruence subgroup and coordinate ratios.
- `thetaModel.forgetful`: The arithmetic theta model has its proved algebraic forgetful map to the PEL A_g.
- `thetaModel.levelDistinction`: A full arithmetic symplectic-level model with universal scheme requires a separately proved comparison; it is not this coordinate model by definition.

Unit tests:

- `thetaModel.realThetaRatios`: At τ=iI_g the defined theta ratios are positive real.
- `thetaModel.projectiveScaling`: A common nonzero scalar on all theta coordinates leaves the projective point unchanged.
- `thetaModel.torsionField`: The coordinate field and projective degree alone do not split A[16].

Source: [MZ20] §5.2 pp.665–666.

**6L. Generic projections preserve or bound projective degree.**

Let V ⊂ P^r_C be an irreducible projective variety of dimension G < r. For generic linear forms χ_1,
…, χ_{G+2}, the projection V ⇢ P^{G+1} is birational onto a hypersurface of degree deg V, so if the
image lies in the zero set of a nonzero homogeneous polynomial of degree δ, then deg V ≤ δ. A
generically finite projection V ⇢ P^G has degree at most deg V.

Source: [MZ20] §5.2 p.666 degree-of-closure adapter.

**6M. The explicit theta-model degree bound.**

For g≥2 and G=g(g+1)/2, deg V̄_16≤2(G+1)!((32g/(π√3))512^{2g²}c_g)^G≤2^{16g^4−1}, with c_g bounded
by the source gamma/Minkowski expression. The index bound is [Γ:Γ(e,2e)]≤e^{2g²}(2e)^{2g²}.

Source: [MZ20] §5.2 p.666.

**6N. A small-degree theta parameter map.**

Choose a suitable subset of θ_{m,0}(16τ)/θ_{0,0}(16τ) as a dominant generically finite rational map
Ψ:V_16⇢A^G. On its regular nonempty domain D_Ψ≤deg V̄_16≤2^{16g^4−1}. The source arithmetic descent
gives F_Ψ=F̃=Q; the main bound can be enlarged to 2^{16g^4}. This statement contains no rational
16-torsion clause.

API in `TauCeti.NoJacobian`:

- `thetaParameter.genericDegree`: The generic degree is at most 2^{16g^4−1}.
- `thetaParameter.regularDomain`: The coordinate ratios define a rational map on a nonempty open where denominators and finite-fibre conditions hold.
- `thetaParameter.fieldFormula`: D=[F̃:Q][F_Ψ:Q]D_Ψ with the actual forgetful and parameter fields.
- `thetaParameter.projectionComparison`: The degree bound is the generic linear/coordinate projection degree of the same projective theta model.

Unit tests:

- `thetaParameter.degreeVersusTorsion`: A projective-degree estimate is not a bound for a torsion splitting extension.
- `thetaParameter.quadraticAllowance`: If D_Ψ≤2^{16g^4−1}, then 2D_Ψ≤2^{16g^4}.
- `thetaParameter.zeroDenominator`: A ratio with θ_{0,0}=0 lies outside that chart; it is not assigned an artificial parameter value.

Source: [MZ20] §5.2 p.666.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 6A | `AutomorphicBundles:B4`; `AutomorphicBundles:B5`; `ShimuraVarieties:V2` |
| 6B | 6A; `AutomorphicBundles:B5` |
| 6C | `AutomorphicBundles:B4`; 6A |
| 6D | 6A; `AutomorphicBundles:B4`; `AutomorphicBundles:B5`; 0F |
| 6E | 6C; 6B; 6D |
| 6F | `ShimuraData:D5`; `AutomorphicBundles:B4`; `AutomorphicBundles:B5`; `AbelianSchemesAndArithmeticModuli:A5` |
| 6G | 6F; `AutomorphicBundles:B4` |
| 6H | 6F; Mathlib `Matrix.PosSemidef` |
| 6I | 6H; 6G; 6A |
| 6J | 6I; 6E |
| 6K | 6F; `PELModuli:M5`; `ShimuraVarieties:V2`; `AlgebraicModuliForArithmeticGeometry:R09.1` |
| 6L | `AlgebraicModuliForArithmeticGeometry:R09.1`; `AlgebraicModuliForArithmeticGeometry:R09.2` |
| 6M | 6K; 6J; 6L; 6D |
| 6N | 6K; 6M; 6L |

## Layer 7: Projected blocks and quantitative avoidance (C1)

The matrix height bound feeds uniform block counting, and the projection of every relevant connected
block is a point. There are many distinct conjugate periods, rather than merely many homomorphism
matrices. Comparing the lower bound for those periods with the point-block bound forces the target
field degree to remain bounded.

**7A. Definability of the period correspondence family.**

If restricted J on F_g is definable and H is algebraic, Z=F_g∩J⁻¹(H) and the family W_τ(Z), with τ
as a real parameter, are definable. On det(cτ+d)≠0 the projection π_τ(X)=(aτ+b)(cτ+d)⁻¹ is
semialgebraic.

Source: [MZ20] §5.1 pp.662–663.

**7B. Integral matrices of bounded polynomial height.**

For the Galois conjugates Ã^σ fixing the fields of A and H, choose controlled-length isogenies and
F_g period representatives. Their signed rational blocks ρ_σ are integral, project to τ̃_σ∈Z, and
have sup norm ≤C D̃^λ after enlarging λ≥4.

Source: [MZ20] §5.1 (38)–(45) pp.661–662.

**7C. Hodge-generic points force zero-dimensional block images.**

Every Pila block B containing a relevant integral ρ_σ has zero-dimensional connected image π_τ(B). A
positive-dimensional image would give a positive-dimensional weakly-special K⊂H through the
Hodge-generic Ã^σ, contradicting the point-or-whole-A_g dichotomy.

Source: [MZ20] §5.1 p.663.

**7D. Bounded target field degree from projected blocks.**

Take a model field K̃ with [K̃:Q(x̃)]≤c(g) and D̃=max(2,[K̃:Q]). Distinct periods of conjugates
fixing the fixed fields have cardinality ≥c′D̃. Uniform point-block counting and T≤C D̃^λ give
D̃≤C_ε D̃^{λε}; choose 0<ε<1/λ to conclude D̃≤C.

Source: [MZ20] §5.1 p.663.

**7E. The strong quantitative hypersurface-avoidance theorem.**

For g ≥ 2, a finite cover Ã of A_g, a finite map Ψ : Ã → A^G, an algebraic hypersurface H ⊂ A_g and
γ < 1/2, there are C = C(Ã, Ψ, H, γ) and D = D(Ã, Ψ) = [F̃ : Q][F_Ψ : Q]D_Ψ (1) such that for every
N ≥ 1 at most C N^{G−γ} elements n ∈ [1, N]^G have a point of Ψ^{-1}(n) whose projection to A_g is
(a) not defined over an extension of Q of degree at most D, or (b) isogenous to some B in H; the
remaining ones can be taken Galois (hence Hodge) generic ('strong Theorem 1.3'); for g odd or g = 2,
6 any γ < 1 works; and there are Ã, Ψ over Q with D(Ã, Ψ) = 2^{16g⁴}. Interpret covers and finite
maps as dominant generically finite rational maps on their specified nonempty regular domains. The
exceptional event is existential in a fibre; all regular projected points of each remaining fibre
satisfy the conclusions.

Source: [MZ20] §1.2 Theorem 1.3 p.638; §5.1 pp.658–663; §5.2 p.666.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 7A | 0I; 0E; `LogicAndDefinabilityInNumberTheory:LD.6` |
| 7B | 3J; 3B; 3C; 3D; 3E; 3I; 5F; 5H; 0I |
| 7C | 7A; 4A; 4C; `LogicAndDefinabilityInNumberTheory:LD.6`; `ShimuraData:D4`; `ShimuraData:D5` |
| 7D | 5B; 7B; 7C; `LogicAndDefinabilityInNumberTheory:LD.6` |
| 7E | 5E; 5H; 7D; 4B; 4C; Mathlib `isLittleO_log_rpow_rpow_atTop`; 6N |

## Layer 8: Arithmetic consequences and the Schottky application (A0)

The counting theorem gives points avoiding a prescribed hypersurface, then the Torelli dimension
argument gives the no-Jacobian result. The density argument uses new arithmetic parameter maps in
each neighbourhood, preserving a uniform model-degree bound. It cannot be replaced by taking
rational symplectic translates of one fixed example, whose model degrees can grow.

**8A. The main bounded-degree hypersurface-avoidance theorem.**

Given an algebraic hypersurface H in A_g with g ≥ 2, there is A in A_g, defined over an extension of
Q of degree at most 2^{16g⁴} and Hodge generic, that is not isogenous to any B in H.

Source: [MZ20] §1.2 Theorem 1.1 p.637; §5.1–5.2.

**8B. An abelian variety isogenous to no Jacobian.**

For every g ≥ 4 there is a principally polarized abelian variety of dimension g, defined over an
extension of Q of degree at most 2^{16g⁴} and Hodge generic, that is not isogenous to any Jacobian.
This excludes canonically principally polarized Jacobians of stable compact-type curves as well as
smooth curves; isogenies need not respect polarizations.

Source: [MZ20] §1.2 Corollary 1.2 p.637.

**8C. Many isogeny classes in the parameter box.**

For every ε>0 there are C_0=C_0(Ψ,ε)>0 and N_0 such that for every N≥N_0, the regular projected
points from Ψ^{-1}(n), n∈[1,N]^G, represent at least C_0^{-1}N^{G−ε} isogeny classes. Work on a
fixed common nonempty open where Ψ is regular with finite fibres and the forgetful map π is finite,
so the parameter-to-moduli multiplicity is uniformly bounded. The bad algebraic domain is discarded
separately, not counted with finite multiplicity.

Source: [MZ20] §1.2 p.638 and §5.3 p.666.

**8D. Bounded-degree points in every Euclidean open set.**

For every nonempty Euclidean open U⊆A_g(C), there is a Hodge-generic hypersurface-avoiding point in
U with model degree≤2^{16g^4}. Lift a regular point to V_16, approximate its Ψ-image by ξ∈Q(i)^G and
apply the counting theorem to Λ_d∘Ψ, where Λ_d(x)_j=1/[d(x_j−ξ_j)].

Source: [MZ20] §5.3 (49) p.667.

**8E. Avoid finitely many preselected isogeny classes in an open.**

Each nonempty Euclidean open contains bounded-degree Hodge-generic hypersurface-avoiding points
outside any prescribed finite set of isogeny classes.

Source: [MZ20] §5.3 p.667.

**8F. A dense set of pairwise non-isogenous examples.**

For every g ≥ 4 there is a set of principally polarized abelian varieties of dimension g, dense in
the euclidean topology, each defined over an extension of Q of degree at most 2^{16g⁴} and not
isogenous to any of the others or to any Jacobian.

Source: [MZ20] §1.2 Corollary 1.4 p.638; §5.3 p.667.

**8G. The unirational counting theorem.**

For g = 2, 3, 4, 5, assume a dominant rational map Ξ : A^G → A_g over Q. For every hypersurface H ⊂
A_g and γ < 1/2 there is C = C(Ξ, H, γ) such that for every N ≥ 1 at most C N^{G−γ} elements n ∈ [1,
N]^G have Ξ(n) (a) not defined over Q or (b) isogenous to some B in H; the others can be taken Hodge
generic, and for g = 2, 3, 5 any γ < 1 works.

Source: [MZ20] §1.2 Theorem 1.5 p.639; §5.1 p.657.

**8H. The conditional rational fourfold consequence.**

If A_4 is unirational over Q, there is a principally polarized abelian fourfold defined over Q and
Hodge generic that is not isogenous to any Jacobian.

Source: [MZ20] §1.2 Corollary 1.6 p.640.

**8I. Boundedly many distinct CM moduli points.**

For a fixed arithmetic family with a uniform bound on its model-field degrees, the number of
distinct CM moduli points in A_g is bounded independently of N, assuming the quantitative CM orbit
lower bound and bounded-discriminant finiteness. To bound parameter tuples, also restrict to a fixed
common open where Ψ has finite fibres and π is finite; exceptional positive-dimensional fibres are
excluded. The 2012 orbit-bound route is unconditional for 1≤g≤6 and assumes GRH for larger g. An
unconditional all-genus route requires the averaged-Colmez/Tsimerman quantitative input from Complex
Multiplication and Explicit Reciprocity, Part II; qualitative reciprocity alone does not provide it.

Source: [MZ20] §5.4 p.667.

**8J. The genus-four Igusa–Schottky form.**

F_g(τ) = 2^g U_g(τ) − V_g(τ)² with U_g = Σ θ_{mm*}(τ)^{16}, V_g = Σ θ_{mm*}(τ)^8 over m, m* ∈
2^{-1}Z^g/Z^g is a Γ-form of weight 8; it vanishes identically on A_g for 1≤g≤3, and for g = 4 its
zero locus is the closure of the Jacobian locus (Grushevsky [16, Th. 3.8]).

Source: [MZ20] §5.4 p.670.

**8K. Factorization of theta sums on products.**

For block-diagonal τ=diag(τ′,τ″), θ_{m,m*}(τ) factors as the product of the two block theta
constants. Hence U_{g′+g″}=U_{g′}U_{g″} and V_{g′+g″}=V_{g′}V_{g″} in the source’s
sixteenth/eighth-power sums.

Source: [MZ20] §5.4 p.670.

**8L. Products lie in the genus-four Torelli closure.**

For block-diagonal τ, U_g and V_g factor as products; hence F_4 vanishes on products of two
principally polarized abelian surfaces and on products of an elliptic curve with a principally
polarized abelian threefold, which therefore lie in the closure of the Jacobian locus of A_4.

Source: [MZ20] §5.4 p.670.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 8A | 7E; 6N; 0H |
| 8B | 8A; 0D |
| 8C | 1B; 5A; `ArakelovGeometryAndAbelianHeights:R35.3`; 4H; 4C |
| 8D | 7E; 6N; `PELModuli:M5` |
| 8E | 8D; 8C; 7E |
| 8F | 8B; 8E |
| 8G | 5E; 7D; 4C |
| 8H | 8G; 0D |
| 8I | 5A; `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `ComplexMultiplicationAndExplicitReciprocity:CM.2` |
| 8J | 6F; `AutomorphicBundles:B4`; 0C |
| 8K | 6F |
| 8L | 8J; 8K |

## Layer 9: Newton interpolation within isogeny classes (X0)

Accumulating interpolation parameters are allowed because the values are chosen within explicit
successive coefficient tolerances. Arbitrary prescribed values at such parameters need not admit an
entire interpolant. The resulting moduli image is compact and parametrized by a real analytic map;
neither embeddedness nor a global analytic hypersurface follows from that description.

**9A. Normalized Newton interpolation series.**

For an injective sequence t_n of real numbers and complex coefficients a_n, form
F(z)=∑_{n≥0}a_n∏_{m<n}(z−t_m)/(t_n−t_m), with empty product 1. The native total sum is used; it
represents an entire interpolation function under the explicit coefficient envelope: for every R>0,
∑_n |a_n|∏_{m<n}(R+|t_m|)/|t_n−t_m| converges. No arbitrary interpolation data at accumulating t_n
is claimed to admit that envelope.

API in `TauCeti.NoJacobian`:

- `newtonSeries.at_parameter`: F(t_k)=∑_{n≤k}a_n∏_{m<n}(t_k−t_m)/(t_n−t_m), for injective t, without a global convergence assumption.
- `newtonSeries.finite_support`: If a_n=0 outside a finite set s, F equals the finite sum over s for every z.
- `newtonSeries.summable_at`: Under the stated envelope, the Newton terms are summable at every z∈C.
- `newtonSeries.holomorphic`: Under the envelope, F is complex differentiable everywhere, hence entire.
- `newtonSeries.polynomial_compatibility`: For finitely supported coefficients the function equals evaluation of the native complex polynomial sum of the normalized Newton basis polynomials.

Unit tests:

- `newtonSeries.zero_coefficients`: All a_n=0 gives F(z)=0 for every z.
- `newtonSeries.constant_coefficients`: If a_0=c and a_n=0 for n>0, then F(z)=c.
- `newtonSeries.linear_basis`: For t_n=n+1, a_1=1 and all other a_n=0, F(z)=z−1, the native polynomial X−1.

Source: [MZ20] §3.3 interpolation (19)–(20) p.652.

**9B. Successive Newton coefficient tolerances.**

For any injective real sequence t_n∈[1,2], there are positive ε_n such that |a_n|≤ε_n for every n
implies the coefficient envelope of 9A. Choosing target values s_n so that the triangular Newton
coefficient a_n lies in that disk gives F(t_n)=s_n.

Source: [MZ20] §3.3 interpolation (19)–(20) p.652; §5.4 pp.668–669.

**9C. Select elliptic periods within coefficient tolerances.**

Enumerate algebraic j-invariants and choose representative periods. Positive rational scaling and
rational translation preserve elliptic isogeny classes. They allow distinct imaginary parts
t_n∈[1,2] and real parts s_n that meet each successive Newton coefficient tolerance.

Source: [MZ20] §3.3 p.652.

**9D. A bounded elliptic real-analytic interpolation image.**

The image Z={j(F(y)+iy):1≤y≤2}, with the coefficient-tolerant F from the elliptic selection, is
compact and real-analytically parametrized, has |j|≤2079+e^{4π}, and meets every algebraic elliptic
isogeny class. By the real-curve avoidance theorem it is not contained in any real algebraic curve.
No embeddedness assertion is made.

API in `TauCeti.NoJacobian`:

- `ellipticInterpolationImage.image`: Z is the image of [1,2] under y↦j(F(y)+iy).
- `ellipticInterpolationImage.compact`: Z is compact in C.
- `ellipticInterpolationImage.meetsClass`: Every elliptic curve over Q̄ is isogenous to a curve with j∈Z.
- `ellipticInterpolationImage.periodCompatibility`: Its isogeny relation is the imported rational lattice relation, not a private equivalence on j-values.

Unit tests:

- `ellipticInterpolationImage.imaginaryBounds`: Every period used has imaginary part between 1 and 2.
- `ellipticInterpolationImage.algebraicCurve`: Z cannot be contained in a real algebraic curve.
- `ellipticInterpolationImage.complexContinuation`: The positivity assertion concerns real y∈[1,2]; arbitrary complex parameters are not asserted to lie in ℋ_1.

Source: [MZ20] §3.3 pp.651–652.

**9E. Dense rational symplectic isogeny orbits.**

The action of Sp_{2g}(Q) on ℋ_g has dense orbit through every τ, and each rational symplectic
translate represents an isogenous principally polarized abelian variety. Thus each enumerated
algebraic class can meet a prescribed nonempty period neighbourhood.

Source: [MZ20] §1.1 p.636; §5.4 pp.668–669.

**9F. A compact matrix interpolation image meeting all algebraic classes.**

For g≥2, choose distinct interpolation parameters t_n∈[1,2] and representatives τ_n of all algebraic
moduli points, modified by Sp_{2g}(ℚ) within their isogeny classes. Newton interpolation constructs
matrices F_x,F_w of entire functions, real on the real line, with F_x(t_n)=x_n and F_w(t_n)=w_n,
such that F(t)=F_x(t)+i(I+F_w(t)F_w(t)^t) lies in ℋ_g for real t∈[1,2]. Its compact real-analytic
parametrized image K=J(F([1,2])) meets every isogeny class represented by A_g(ℚ̄). No embedded-curve
or global closed analytic hypersurface assertion is part of this construction.

API in `TauCeti.NoJacobian`:

- `matrixInterpolationImage.interpolation`: F_x(t_n)=x_n and F_w(t_n)=w_n entrywise.
- `matrixInterpolationImage.symmetricRealPart`: F_x(t) is real symmetric for real t.
- `matrixInterpolationImage.positiveImaginaryPart`: I+F_w(t)F_w(t)^t is positive definite for real t, by the native Gram-matrix positivity API.
- `matrixInterpolationImage.compactImage`: K=J(F([1,2])) is compact.
- `matrixInterpolationImage.meetsClass`: Each algebraic A_g isogeny class meets K.
- `matrixInterpolationImage.choleskyCompatibility`: The factor for each selected positive-definite y−I is the existing TauCeti.cholesky, whose continuity preserves the source tolerance.

Unit tests:

- `matrixInterpolationImage.zeroFactor`: At w=0 the imaginary part is I, still positive definite.
- `matrixInterpolationImage.energyIdentity`: For real v≠0, v^t(I+ww^t)v=‖v‖²+‖w^t v‖²>0.
- `matrixInterpolationImage.closedComplexHypersurface`: Compactness and real-analytic parametrization of K do not make it a globally closed complex analytic hypersurface.

Source: [MZ20] §5.4 interpolation (50)–(60) pp.668–670.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 9A | Mathlib complex arithmetic, finite products, infinite sums and complex polynomials; see the individual imports in `Suggested.lean`. |
| 9B | 9A |
| 9C | 9B; `ModularCurvesPartII:R12.1` |
| 9D | 9C; 9A; 2I; `ModularCurvesPartII:R12.1` |
| 9E | `ShimuraData:D5`; `AbelianSchemesAndArithmeticModuli:A5` |
| 9F | 9A; 9B; 9E; Tau Ceti `TauCeti.cholesky`; Tau Ceti `TauCeti.continuous_cholesky`; Mathlib `Matrix.PosDef.one`; Mathlib `Matrix.PosDef.add_posSemidef`; Mathlib `Matrix.posSemidef_self_mul_conjTranspose`; `PELModuli:M5`; `AbelianSchemesAndArithmeticModuli:A5` |

## Layer 10: The full sixteen-torsion comparison problem (T1)

This is a separate research problem: strengthen hypersurface avoidance by requiring every
sixteen-torsion point to be rational over the same bounded-degree field. The target depends on an
arithmetic fine-level comparison and the total extension degree. The main bounded-degree theorem in
Layer 8 does not use a solution of this problem.

**10A. Arithmetic comparison cover for full level sixteen.**

The required arithmetic comparison consists of a finite cover π:Y→V₁₆ over a specified number field,
a universal principally polarized abelian scheme on Y, and a full symplectic or similitude
sixteen-level trivialization with its exact cyclotomic-component convention. Include an
analytification comparison with the theta quotient that preserves both polarization and level. The
coefficient fields and generic comparison degree are data of the construction. Obtaining such data
with the numerical bound needed in 10D is an existence problem, not a consequence of the complex
analytic level alone.

API in `TauCeti.NoJacobian`:

- `arithmeticComparisonCover.projection`: Y has its finite comparison map to the theta coordinate model.
- `arithmeticComparisonCover.universalFamily`: The pullback of the PEL universal polarized scheme carries the specified complete level trivialization.
- `arithmeticComparisonCover.degree`: The coefficient fields and generic comparison-cover degree are explicit.
- `arithmeticComparisonCover.analyticComparison`: Its analytification comparison preserves polarization and the exact congruence-level interpretation.

Unit tests:

- `arithmeticComparisonCover.realBase`: A real residue field cannot carry a principally polarized family with all sixteen-torsion rational.
- `arithmeticComparisonCover.cyclotomicOnly`: Containing ζ_16 does not itself trivialize the entire Galois module.
- `arithmeticComparisonCover.degreeOne`: Even a geometrically degree-one comparison needs proof of its arithmetic descent field.

Motivation and source context: [MZ20] p.637 supplementary sentence and §5.2 p.666.

**10B. Full rational torsion forces cyclotomic containment.**

Let (A,λ)/K be principally polarized of dimension g≥1 in characteristic zero. If all A[16](K̄) are
K-rational, then μ_16⊆K: choose an exact-order-16 point and use perfection of the alternating Weil
pairing to find a partner pairing to a primitive sixteenth root.

Source: [MZ20] p.637 supplementary claim; §5.2 p.666.

**10C. The complete arithmetic comparison degree.**

For a proved comparison cover Y and Ψ_Y=Ψ∘π, use D(Y,Ψ_Y)=[F_Y:Q][F_{Ψ_Y}:Q]D_{Ψ_Y}, including the
comparison degree. Alternatively for a residue-field tower K_θ⊆K_A⊆K_cyc=K_A(ζ_16)⊆K_tor, [K_tor:Q]
is the product of all four successive degrees and [K_cyc:K_A]≤8. The two descriptions must not count
the same extension twice.

Source: [MZ20] §1.2 (1) p.638; §5.2 p.666.

**10D. The supplementary rational-torsion problem.**

Research problem, for g≥2: find a principally polarized hypersurface-avoiding A/K with
[K:ℚ]≤2^{16g⁴} and all A[16](K̄) rational over K. A solution must prove the arithmetic comparison of
10A and its complete degree estimate in 10C. Describing the complex quotient by Γ(16,32) or defining
its theta ratios over ℚ does not establish this stronger conclusion. This problem is separate from
Masser–Zannier Theorem 1.1.

Motivation and source context: [MZ20] p.637 after Theorem 1.1; §5.2 closing paragraph p.666.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 10A | 6K; `PELModuli:M2`; `PELModuli:M5`; `AbelianSchemesAndArithmeticModuli:A3`; `AbelianSchemesAndArithmeticModuli:A5` |
| 10B | `AbelianSchemesAndArithmeticModuli:A3`; `ArithmeticGaloisRepresentations:R01.6`; Mathlib `NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt` |
| 10C | 10A; 10B; 6N |
| 10D | 8A; 10A; 10C |

## Layer 11: Global analytic obstructions and a local existence problem (X1)

The projective Satake boundary prevents the proposed global analytic endpoint in genus at least two.
The remaining local construction is an existence problem with explicitly specified domains and
compatible equations. Contributors should implement the obstruction theorem and the local
specification first; an existence theorem requires a further mathematical argument and must not be
inferred from compactness.

**11A. Satake boundary below hypersurface dimension.**

For g≥2 and G=g(g+1)/2, the projective Siegel Satake boundary has dimension G−g and every pure
analytic hypersurface in the open A_g has local dimension G−1>G−g. At g=1 the inequality becomes
equality and this obstruction argument does not apply.

Source: [LeFourn19] Definition–Proposition 6.4(a,b), printed p.181 (PDF p.24).

**11B. Every globally closed analytic hypersurface is algebraic.**

For g≥2, every globally closed pure analytic hypersurface W⊂A_g(C) is algebraic. Its closure in the
projective Satake compactification is analytic by the singular-space Remmert–Stein extension across
the lower-dimensional boundary, then algebraic by Chow; restriction returns W because W is closed in
A_g.

Source: [DemaillyCADG] Chapter II (8.7) p.118, proof pp.118–121; (8.10) p.121; [LeFourn19]
Definition–Proposition 6.4(a,b), printed p.181 (PDF p.24).

**11C. No globally closed transcendental interpolation hypersurface.**

For g≥2, no globally closed pure analytic hypersurface W⊂A_g(ℂ) meets every isogeny class
represented by A_g(ℚ̄). Indeed 11B makes W algebraic, and 8A gives an algebraic point whose whole
isogeny class avoids W. In particular the compact class-covering image K of 9F cannot lie in such a
hypersurface.

Motivation and source context: [MZ20] §5.4 pp.668–670.

**11D. A local analytic hypersurface specification.**

A local replacement consists of an explicitly chosen open U⊆A_g(C) containing K and a pure
codimension-one analytic subset W_U closed relative to U, containing K. Local defining equations
must be defined on specified domains and have proved compatibility/extensions on overlaps. A
germwise or nonclosed replacement has its own separately stated conclusion; no existence is supplied
by this specification.

API in `TauCeti.NoJacobian`:

- `localHypersurfaceSpec.ambient`: The specification exports an actual open U and the inclusion K⊆U.
- `localHypersurfaceSpec.relativeClosed`: W_U is closed as an analytic subset of U, not asserted closed in all A_g.
- `localHypersurfaceSpec.contains`: K⊆W_U.
- `localHypersurfaceSpec.overlap`: The specified local analytic ideals/equations restrict compatibly on every stated overlap.

Unit tests:

- `localHypersurfaceSpec.genusTwoGlobal`: Taking U=A_2 would force a class-covering closed hypersurface to be algebraic and contradict avoidance.
- `localHypersurfaceSpec.differentDomains`: A finite product of functions on different open sets is not a global equation without compatible extensions.
- `localHypersurfaceSpec.sameDomainProduct`: On a common domain, a finite product of holomorphic equations is holomorphic and its zero set is their union.

Motivation and source context: [MZ20] §5.4 pp.669–670.

**11E. The local replacement existence problem.**

Research problem: construct an open U⊆A_g(ℂ) and a relatively closed pure codimension-one analytic
subset W_U satisfying 11D for the compact image K, or formulate and prove a precise germwise or
nonclosed alternative. A construction must give the domains of all equations and their overlap
compatibility. A finite chart cover of K does not by itself extend those equations to a common
domain, so the compactness argument does not prove existence.

API in `TauCeti.NoJacobian`:

- `localReplacement.specification`: A successful construction returns the actual specified U,W_U and containment of K.
- `localReplacement.equations`: All equation domains and their compatibility proofs are identified.
- `localReplacement.analyticComparison`: The constructed analytic subset uses the existing singular analytic-space supplier and not only smooth-chart functions.

Unit tests:

- `localReplacement.globalImpossible`: A globally closed class-covering hypersurface in A_g is ruled out for g≥2.
- `localReplacement.compactnessInsufficient`: A finite cover of K by charts alone does not extend their equations to a common ambient domain.
- `localReplacement.restriction`: A valid relative analytic hypersurface restricts to one on every smaller open containing the required part of K.

Motivation and source context: [MZ20] §5.4 pp.669–670.

Direct prerequisites for this layer:

| Milestone | Inputs |
| --- | --- |
| 11A | `ShimuraCompactifications:C5`; `ShimuraVarieties:V2` |
| 11B | 11A; `ComplexComparisonPartII:C0`; `ComplexComparisonPartII:C4` |
| 11C | 11B; 8A; 9F |
| 11D | `ComplexComparisonPartII:C0`; 9F |
| 11E | 11D |

## References

- **[MZ20]** David Masser and Umberto Zannier, *Abelian varieties isogenous to no
  Jacobian*, Annals of Mathematics **191** (2020), no. 2, pp.635–674,
  [published article](https://annals.math.princeton.edu/2020/191-2/p07),
  [authoritative PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf),
  DOI 10.4007/annals.2020.191.2.7. Use printed page numbers. The main results are
  Theorems 1.1, 1.3 and 1.5 and Corollary 1.4; the final two layers distinguish
  their supplementary questions from those results.
- **[DemaillyCADG]** Jean-Pierre Demailly, *Complex Analytic and Differential
  Geometry*, [public author manuscript](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf),
  Chapter II §8.2, (8.7)–(8.10), pp.118–121. In particular (8.7) is stated for
  a complex-space ambient, including singular spaces; (8.10) is the projective
  Chow theorem used in Layer 11.
- **[LeFourn19]** Samuel Le Fourn, *A tubular variant of Runge’s method in all
  dimensions, with applications to integral points on Siegel modular varieties*,
  Algebra & Number Theory **13** (2019), no. 1, pp.159–210,
  [published PDF](https://msp.org/ant/2019/13-1/ant-v13-n1-p04-s.pdf),
  §6, Definition–Proposition 6.3, 6.4(a,b), and Definition 6.5, pp.180–182
  (PDF pp.23–25). The boundary codimension and projective normal ambient are
  the inputs to the Remmert–Stein specialization.
- **[BCCR17]** Dave Benson, Caterina Campagnolo, Andrew Ranicki and Carmen Rovi,
  *Cohomology of symplectic groups and Meyer’s signature theorem*,
  [author manuscript dated 9 October 2017](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/paper1.pdf),
  §2, p.3. This citation fixes the equivalent diagonal conditions for the
  Igusa subgroup; no cohomology theorem is used here.

For the analytic theta inputs, MZ20 §5.2, pp.665–666, gives the exact references
to Jun-ichi Igusa, *Theta Functions* (Springer, 1972): pp.177–178 for normality,
p.185 for weight, p.197 and Theorem 7 on p.206 for the order estimate,
pp.208 and 415, 422–423 for the index, projective model and transformation
conventions. The elementary Minkowski-constant estimate there cites C. G.
Lekkerkerker, *Geometry of Numbers* (1969), p.63. These references specify
the stronger shared theorems needed by Layer 6; the statements in this roadmap
are mathematical targets, not a claim that an original theta proof or an
arithmetic descent has already been implemented.

Similarly, MZ20 §5.1, pp.658–663, identifies the Cadoret, Pink, Serre, Deligne,
Cohen and functional-transcendence inputs for Layers 4 and 7. Their owner
interfaces must retain their original hypotheses. MZ20 §5.4, p.670, cites
Grushevsky Theorem 3.8 for the genus-four Schottky description in 8J.
