# Coleman power series with finite unramified coefficients

This part finishes the coefficient-Frobenius direction left open by the
accepted Coleman power-series blueprint. The parent packet supplies the
coefficient-fixed substitution algebra, determinant norm, integral trace,
norm projection and arithmetic interpolation over ℤ_p. Here the coefficient
ring is the integer ring of a finite unramified extension of ℚ_p. The resulting
series interpolate the actual cyclotomic local-unit tower, with an arithmetic
Frobenius twist. All statements are plans, and all implementation statuses are
unchecked.

The stage is `ColemanPowerSeries:L1`. Its existing ℤ_p targets remain in
[the parent packet](../packets/ColemanPowerSeries.json) and
[its reader](ColemanPowerSeries.md). The present packet uses distinct node
identifiers and imports the parent's applicable constructions and proof
lemmas. It adds the unramified coefficient calculation and the twisted
interpolation theorem. It does not reconstruct general local-field theory,
the bounded measure operator, or Weierstrass preparation. Those have existing
owners.

## Conventions and the theorem

Let p be a prime and let E/ℚ_p be finite unramified. Write O for its
native ring of integers, identified with the integral closure of ℤ_p in E.
It is a complete compact discrete valuation ring, finite free over ℤ_p, with
maximal ideal pO and residue field k of order p^f. Fix the canonical
**arithmetic p-Frobenius** σ. It fixes ℤ_p and induces c↦c^p on k. The
p-power, rather than the p^f-power, is essential: σ is generally nonidentity
when f>1. LocalFieldsRamification supplies the coefficient ring, its topology,
and this automorphism. These are imported mathematical inputs.

Put B=O[[T]] and Y=1+T. Give B the product of the usual p-adic topologies on
its coefficients. Define Φ(f)=f(Y^p−1), with coefficients fixed. This is a
native formal substitution because the substituted series has zero constant
coefficient. Write Σ for the coefficientwise action of σ. Then Φ and Σ
commute, but they have different roles. The finite-free scalar algebra used
below has base B and underlying algebra B, with structural map Φ. In
particular a acts on the second B by multiplication by Φ(a).

The basis of this module is 1,Y,…,Y^(p−1). Its norm N is the native determinant
of multiplication and its trace τ is the native linear trace, with values in
the **base** B. Neither is a new abstract product operator. The embedded norm
is Φ(Nf); only after adjoining the p-th roots of unity does that become a
product of translated values. The trace already has values in the base, so its
normalization is τ=pψ_O, without another inverse substitution. The bounded
measure operator ψ_O is supplied independently by PMIA L2. The determinant
sign is retained at p=2: for s=(−1)^(p−1), N(Y)=sY and N(T)=sT. Thus the
norm-compatible root tower is sζ_n and its interpolating series is sY.
For odd p this is ζ_n and Y; for p=2 it is −ζ_n and −Y. Interpolation
itself does not need an odd-prime hypothesis.

Choose ζ_n of order p^(n+1), n≥0, with ζ_(n+1)^p=ζ_n. Set E_n=E(ζ_n),
O_n=integralClosure O E_n and π_n=ζ_n−1. Thus level zero uses a root of order
p. The degree d_n=[E_n:E]=p^n(p−1) grows without bound. The inclusions of these
native intermediate fields determine the integral-ring algebras and their
relative norms. Write ε_n:B→O_n for native convergent power-series evaluation
at π_n. The finite-level topology is the inherited valuation topology, whose
p-power ideals form a neighborhood basis. It is complete and Hausdorff; no
linear topology is installed on a fraction field to manufacture convergence.

The lift σ_n of σ to E_n fixes every cyclotomic root and restricts to an
automorphism of O_n. This condition specifies the lift; a general automorphism
lifting residue Frobenius need not fix the chosen roots. The σ_n commute with
the inclusions and relative norms. The supplier must establish these facts
from the disjoint unramified and totally ramified extensions.

Let U∞ be the native subgroup of ∏_(n≥0)O_nˣ consisting of u with
N_(n+1/n)(u_(n+1))=u_n. Its topology is the product/subtype topology. It is an
inverse limit of the actual arithmetic unit groups, not a formal series
equalizer with a renamed interpretation. The series subgroup corresponding
to it is

\[
B^{N=\Sigma}=\{f\in B^\times:N(f)=\Sigma(f)\}.
\]

The target is the multiplicative topological equivalence

\[
\operatorname{Col}_\sigma:U_\infty\simeq B^{N=\Sigma},\qquad
\varepsilon_n(\operatorname{Col}_\sigma(u))=\sigma_n^n(u_n).
\]

Its inverse sends f to the tower with nth coordinate σ_n^(−n)(ε_n(f)).
The positive exponent belongs to the series interpolation formula, and the
negative exponent belongs to the tower evaluation formula. Existence,
uniqueness, fixedness and continuity are proved separately below. This is the
integral-unit, finite-unramified specialization of Coleman's original Theorem
A (p.92), Theorem 16 (p.105) and Corollary 17 (pp.105–106). His Laurent-series
and general Lubin–Tate conclusions are outside this stage's integral
cyclotomic-unit targets.

## Dependency boundary

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Native substitution, power series,
bases, determinant norm, trace, unit maps, equalizer subgroups, convergent
evaluation, polynomial density and compact-to-Hausdorff inversion are already
available. The packet names the exact declarations and modules that were
read. In particular native norm has a default value for a non-finite module;
the explicit power basis must establish rank p before its value is used.

The current read-only TauCetiRoadmap main was checked alongside the current
Tau Ceti library, including the roadmaps newer than the atlas snapshot. The
LocalFieldsRamification document and Suggested file already own the native
integer-ring/integral-closure comparison, finite intermediate-field topology,
residue correspondence and arithmetic Frobenius. Current Tau Ceti has
`frobeniusAlgEquiv` beyond the pinned baseline. It is therefore a citation of
that upstream layer, not a claim that the older pin contains it. The nearby
ArithmeticDirichletSeries roadmap was also read for upstream mathematical and
API conventions. None of these upstream constructions is re-planned here.

Four precise requests remain at the supplier boundary:

1. LocalFieldsRamification layer 0 supplies the native coefficient integer
   ring and finite-extension topologies, compactness, finite freeness and
   closed p-power ideals. This uses its existing scope.
2. LocalFieldsRamification layer 2 supplies σ, its continuity and its residue
   action. This uses its existing unramified/Frobenius scope.
3. `ColemanPowerSeries:L0` specializes its existing native cyclotomic
   arithmetic to finite unramified E: the compatible roots, degrees,
   integral and relative power bases, norm/trace comparison with fraction
   fields, continuous evaluation, polynomial unit lifts, and the lifts σ_n
   fixing roots. It supplies U∞ on those native carriers. This arithmetic
   specialization is distinct from the parent's abstract finite-coefficient
   tensor exact sequences in L3–L4.
4. `PadicMeasuresIwasawaAlgebras:L2` supplies the continuous coefficient
   extension of its independently constructed bounded ψ operator, with
   ψ_O(Y^m)=Y^(m/p) for p|m and zero otherwise. Its existing integral
   coefficient-extension and Amice-comparison nodes are the starting point;
   the finite-extension receiving topology and lattice adapter must be
   attached to them. Identifying ψ with the trace is the present comparison,
   and is not a supplier hypothesis.

`PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization` already
states complete-DVR Weierstrass factorization at the required coefficient
generality. It is imported directly. The parent L1 coordinate, root-matrix,
precision and separation lemmas supply proof patterns at their stated ℤ_p
generality; the coefficient-extension lemmas here establish what is needed
over O rather than treating an ℤ_p statement as an O statement.

Coverage is **planned**. Every remaining L1 target has a node and a dependency
chain ending in the pinned libraries, the accepted parent, an existing
supplier node or one of the precise requests. There is no unidentified proof
gap. The open requests prevent a claim of closed coverage. Assembly must join
this part with the accepted ℤ_p L1 plan and discharge the supplier interfaces.

## How the arithmetic proof closes

The power basis is obtained by choosing a finite ℤ_p-basis of O and applying
its coordinate functions coefficientwise. Since Φ and each Y^i have ℤ_p
coefficients, this decomposition commutes with assembly. The parent's
injectivity and surjectivity give those of the O-valued assembly. Native
Basis.mk then constructs the rank-p basis. Assembly is continuous on each
coefficient, and it is a bijection between compact Hausdorff products, so the
inverse coordinates are continuous. This establishes the topology used by
the matrix determinant and trace.

The trace is p times the zeroth coordinate. After reduction modulo p, the
norm algebra becomes k[[T]] over k[[T^p]]. Native Frobenius expansion gives
f^p=Φ(Σf) there. The p-th power of the multiplication matrix is the scalar
matrix Σf. Taking determinants and using injectivity of p-th powers in the
residue series domain gives Nf≡Σf modulo p. For r≥1, expanding det(I+p^r M_h) shows
N(1+p^r h)≡1 modulo p^(r+1): the linear term contains the trace, already
divisible by p, and every higher term contains p^(2r). This also improves
congruences of unit ratios by one power of p.

Define M=Σ⁻¹N on units. It satisfies M(f)≡f modulo p and gains a digit on
unit differences. Consequently M^a(f) and M^b(f), a≥b, agree modulo
p^(b+1). Completeness gives the coefficientwise limit Lσf, and closedness of
the native unit space retains invertibility. The uniform estimate passes to
the limit; comparison with a continuous finite iterate proves continuity.
Fixed inputs give constant sequences, so Lσ retracts onto B^(N=Σ).

Arithmetic specialization is an actual matrix calculation. The power basis
Y^i specializes at π_(n+1) to the relative integral basis ζ_(n+1)^i.
Evaluation of Φ sends base coefficients to their image from O_n. Therefore
the multiplication matrix specializes entrywise to the finite-level
multiplication matrix. Determinants and traces give the norm and trace
squares. This proves that twisted evaluation of a fixed series lies in U∞;
norm compatibility is not assumed in the definition of the map.

For uniqueness, factor a nonzero difference f−g as p^μ times a distinguished
polynomial times a unit using the PMIA L4 result. Evaluation of the unit
factor is invertible. If the difference vanished at every π_n, the
distinguished polynomial would vanish there too. Its fixed degree is
eventually smaller than d_n, the minimal-polynomial degree of π_n over E.
That is impossible. The same argument gives eventual nonvanishing, a sharper
form of the separation assertion.

For existence, fix u∈U∞. At level 2r choose a polynomial unit lift g_r of
σ_(2r)^(2r)u_(2r) using the supplied integral power basis. Put v_r=M^r g_r.
For n≤r, norm transport shows that M^(2r−n)g_r evaluates **exactly** to
σ_n^n u_n. Since 2r−n≥r, iteration precision compares this series with v_r
modulo p^(r+1), uniformly in all coefficients. Thus each fixed evaluation of
v_r approaches its prescribed value as r tends to infinity. The native unit
space is compact, so choose a convergent subnet whose indices tend to
infinity. Continuity of each evaluation and vanishing p-power errors give a
unit limit interpolating every level. The approximate equation
M(v_r)≡v_r modulo p^(r+1) passes to the limit, proving fixedness. Separation
gives uniqueness.

Twisted evaluation is then a continuous bijective homomorphism from the
compact fixed series subgroup to the Hausdorff arithmetic tower. Its inverse
is continuous by the native compact-to-Hausdorff theorem. Coefficient
Frobenius equivariance follows by evaluating the proposed equality at every
level and using uniqueness. When O=ℤ_p and σ=id, the norms, limits, subgroups
and interpolation formulas agree with the accepted parent constructions.

## Declarations, API and tests

The following catalogue follows the dependency graph of the constructions,
rather than the order of sections in a source. All hypotheses refer to the
conventions above; extra receiving-ring hypotheses are stated where needed.
Each construction includes its public API and tests. The accompanying
Suggested file gives corresponding signatures and examples against native
carriers. Supplier objects appear as their transparent native expressions or
as explicitly typed supplier parameters with their exact mathematical
characterizations. No free proposition substitutes for an arithmetic input.

### Coefficient-fixed cyclotomic scalar algebra

Node `ColemanPowerSeries:L1/unramified-scalar-algebra`; proposed declaration `TauCetiRoadmap.ColemanUnramified.scalarAlgebra`.

Give the second B its B-algebra structure with algebraMap=Φ. Thus a•f=Φ(a)f. Coefficients are unchanged by Φ.

Proof plan: Use native formal substitution at Y^p−1, whose constant coefficient is zero. Convert that ring homomorphism to its induced scalar algebra. This extends the parent ℤ_p scalar algebra along the coefficient map.

Direct prerequisites: `mathlib:PowerSeries.substAlgHom`, `ColemanPowerSeries:L1/frobenius-scalar-algebra`.

Source: Coleman1979, §IV, Theorem 11, pp.102–103. The product identity uses the multiplication-by-p substitution; the scalar-algebra presentation extends the parent determinant construction.

Uses: L1 determinant norm and trace: Fixes the actual rank-p scalar action and excludes the rank-one self-algebra.

Public API:

- `TauCetiRoadmap.ColemanUnramified.scalarAlgebra_map` (compatibility): The structural map is Φ.
- `TauCetiRoadmap.ColemanUnramified.scalarAlgebra_smul` (simp): Scalar multiplication is Φ(a)f.
- `TauCetiRoadmap.ColemanUnramified.scalarAlgebra_coefficientMap` (functoriality): The coefficient map ℤ_p[[T]]→B commutes with the two structural maps.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.scalar_X` (computation): The structural image of T is Y^p−1.
- `TauCetiRoadmap.ColemanUnramified.Tests.scalar_constant` (compatibility): The structural image of C(c) is C(c), even if σ(c)≠c.
- `TauCetiRoadmap.ColemanUnramified.Tests.scalar_identity` (non-example): The structural image of T differs from T when p=3.

### Uniqueness of unramified cyclotomic coordinates

Node `ColemanPowerSeries:L1/unramified-coordinates-injective`; proposed declaration `TauCetiRoadmap.ColemanUnramified.coordinates_injective`.

The assembly map (a_i)↦∑_(i<p)Y^iΦ(a_i) from B^p to B is injective.

Proof plan: Choose a finite ℤ_p-basis of O. Apply its coordinate functions to every power-series coefficient. These component maps commute with Φ and multiplication by Y^i, because those series have ℤ_p coefficients. Each component relation is the parent ℤ_p coordinate relation. Its injectivity annihilates every component; basis extensionality annihilates every a_i.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-scalar-algebra`, `ColemanPowerSeries:L1/frobenius-coordinate-injectivity`, `mathlib:PowerSeries.mk`, `mathlib:Module.Basis.linearCombination_repr`.

Source: Coleman1979, §IV, Theorem 11, pp.102–103. Worker coefficient extension of the finite-degree norm algebra implicit in Coleman’s norm construction; the component proof uses the parent finite-free calculation.

### Existence of unramified cyclotomic coordinates

Node `ColemanPowerSeries:L1/unramified-coordinates-surjective`; proposed declaration `TauCetiRoadmap.ColemanUnramified.coordinates_surjective`.

Every f∈B has an expansion f=∑_(i<p)Y^iΦ(a_i).

Proof plan: Apply a chosen finite ℤ_p-basis coordinate function coefficientwise to f. Use the parent ℤ_p coordinate surjectivity for each of the finitely many component series. Assemble their coefficients back in O using the chosen basis; finite sums commute with all formal substitutions and recover f.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-scalar-algebra`, `ColemanPowerSeries:L1/frobenius-coordinate-surjectivity`, `mathlib:PowerSeries.mk`, `mathlib:Module.Basis.linearCombination_repr`.

Source: Coleman1979, §IV, Theorem 11, pp.102–103. The norm is a degree-p integral norm. The component proof supplies the corresponding finite-free construction over the finite unramified coefficient ring.

### Unramified Frobenius power basis

Node `ColemanPowerSeries:L1/unramified-basis`; proposed declaration `TauCetiRoadmap.ColemanUnramified.basis`.

Construct the B-basis b_i=Y^i, i∈Fin p, of B under the coefficient-fixed Φ scalar algebra. Let c_i(f) be its native basis coordinates.

Proof plan: Apply native Basis.mk to the injective and surjective assembly map. The basis has exactly p vectors. Keep the induced module argument explicit in every norm, trace and finrank application.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-coordinates-injective`, `ColemanPowerSeries:L1/unramified-coordinates-surjective`, `mathlib:Module.Basis.mk`.

Source: Coleman1979, §IV, Theorem 11, pp.102–103. This is the explicit finite-free algebra realizing Coleman’s norm in the cyclotomic specialization.

Uses: L1 norm/trace congruences: Supplies rank p and multiplication matrices. L1 arithmetic evaluation: Specializes to the relative power basis of ζ_(n+1).

Public API:

- `TauCetiRoadmap.ColemanUnramified.basis_apply` (data): b_i=Y^i.
- `TauCetiRoadmap.ColemanUnramified.basis_expansion` (characterisation): f=∑_(i<p)Y^iΦ(c_i(f)).
- `TauCetiRoadmap.ColemanUnramified.basis_scalar` (compatibility): c_i(Φ(a)f)=a c_i(f).
- `TauCetiRoadmap.ColemanUnramified.basis_rank` (structure): The explicitly induced module has finrank p.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.basis_zero` (degenerate): b_0=1.
- `TauCetiRoadmap.ColemanUnramified.Tests.basis_one_three` (computation): For p=3, b_1=Y.
- `TauCetiRoadmap.ColemanUnramified.Tests.basis_carry` (compatibility): The coordinates of Y^p are Y in position 0 and zero in all other positions.

### Topology of unramified cyclotomic coordinates

Node `ColemanPowerSeries:L1/unramified-coordinates-homeomorphism`; proposed declaration `TauCetiRoadmap.ColemanUnramified.coordinates_homeomorphism`.

Assembly B^p→B and the coordinate inverse f↦(c_i(f)) are continuous for coefficientwise p-adic topologies.

Proof plan: Assembly is continuous coefficientwise: substitution at a zero-constant polynomial uses only finitely many input coefficients in each output coefficient. O is compact Hausdorff, so B and B^p are compact Hausdorff products. The basis gives a continuous bijection. Native compact-to-Hausdorff inversion gives continuity of its inverse.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-basis`, `mathlib:Continuous.homeoOfEquivCompactToT2`.

Source: Coleman1979, §IV, Proposition 14 and Corollary 17, pp.104–106. The source uses the coefficient topology for norm projection and interpolation. This finite-basis topological lemma supplies that continuity without a coefficient supremum norm.

### Unramified Coleman determinant norm

Node `ColemanPowerSeries:L1/unramified-norm`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm`.

Define N:B→*B as native Algebra.norm for the Φ scalar algebra. Its multiplication matrix is taken in b_i=Y^i; the resulting norm is base-valued.

Proof plan: Use the explicit scalar algebra in native Algebra.norm. The finite basis certifies the module is finite free of rank p, so this is its determinant norm rather than the native non-finite fallback.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-scalar-algebra`, `ColemanPowerSeries:L1/unramified-basis`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_eq_matrix_det`.

Source: Coleman1979, §IV, Theorem 11, pp.102–103. Coleman defines the integral norm by its division-point product. The determinant realization gives that norm before any root translations are introduced.

Uses: Coleman Theorem A and Lemma 13: Controls norm-compatible interpolation and iteration. ColemanPowerSeries:L2: Provides the arithmetic input to the Coleman-map construction.

Public API:

- `TauCetiRoadmap.ColemanUnramified.norm_def` (compatibility): N is native Algebra.norm for the Φ algebra.
- `TauCetiRoadmap.ColemanUnramified.norm_matrix` (data): N(f)=det(left-multiplication matrix of f in b).
- `TauCetiRoadmap.ColemanUnramified.norm_constants` (simp): N(C(c))=C(c^p).
- `TauCetiRoadmap.ColemanUnramified.norm_scalar` (simp): N(Φ(f))=f^p.
- `TauCetiRoadmap.ColemanUnramified.norm_Y` (simp): For s=(−1)^(p−1), N(Y)=sY and N(T)=sT. In particular these are Y and T for odd p, and their negatives for p=2.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.norm_zero` (degenerate): N(0)=0.
- `TauCetiRoadmap.ColemanUnramified.Tests.norm_constant` (computation): N(C(1+p))=C((1+p)^p).
- `TauCetiRoadmap.ColemanUnramified.Tests.norm_native` (compatibility): The returned map equals native Algebra.norm under Φ, not under the ordinary self-algebra.

### Unramified integral Coleman trace

Node `ColemanPowerSeries:L1/unramified-trace`; proposed declaration `TauCetiRoadmap.ColemanUnramified.trace`.

Define τ:B→ₗ[B]B as native Algebra.trace for the Φ scalar algebra, with the domain module using Φ. This is an integral base-valued map, before normalization.

Proof plan: Apply native Algebra.trace with the explicit scalar algebra. Use the finite power basis for its matrix and coordinate formulas.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-scalar-algebra`, `ColemanPowerSeries:L1/unramified-basis`, `mathlib:Algebra.trace`, `mathlib:Algebra.trace_eq_matrix_trace`.

Source: Coleman1979, §IV, Corollary 12 and Lemma 13, pp.102–103. The trace is the additive counterpart of the norm and gives the divisibility used in the norm congruence.

Uses: L1 near-one norm gain: The linear determinant term is divisible by p. L1 normalized trace: Compares the integral trace to the independently supplied ψ operator.

Public API:

- `TauCetiRoadmap.ColemanUnramified.trace_def` (compatibility): τ equals native Algebra.trace under Φ.
- `TauCetiRoadmap.ColemanUnramified.trace_coordinates` (data): τ(f)=p c_0(f).
- `TauCetiRoadmap.ColemanUnramified.trace_scalar` (simp): τ(Φ(a)f)=aτ(f).
- `TauCetiRoadmap.ColemanUnramified.trace_powers` (example): τ(Y^m)=pY^(m/p) if p divides m, and zero otherwise.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.trace_zero` (degenerate): τ(0)=0.
- `TauCetiRoadmap.ColemanUnramified.Tests.trace_one` (computation): τ(1)=p.
- `TauCetiRoadmap.ColemanUnramified.Tests.trace_Yp` (non-example): τ(Y^p)=pY, which differs from pY^p.

### Trace in unramified Frobenius coordinates

Node `ColemanPowerSeries:L1/unramified-trace-coordinates`; proposed declaration `TauCetiRoadmap.ColemanUnramified.trace_coordinates`.

For every f∈B, τ(f)=p c_0(f). In particular τ(B)⊆pB.

Proof plan: Expand f in the power basis. Multiplication by Y^i has zero diagonal for 0<i<p; multiplication by 1 has diagonal one. Φ-scalar linearity gives the claimed sum.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-basis`, `ColemanPowerSeries:L1/unramified-trace`.

Source: Coleman1979, §IV, Corollary 12 and Lemma 13(i), pp.102–103. The integral trace divisibility underlies norm improvement. The coordinate computation extends the parent’s base-valued formula. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-trace-coordinates. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

### Unramified trace and integral psi

Node `ColemanPowerSeries:L1/unramified-trace-psi`; proposed declaration `TauCetiRoadmap.ColemanUnramified.trace_psi`.

Let ψ_O be the independently supplied continuous coefficient-extended bounded measure operator, normalized by ψ_O(Y^m)=Y^(m/p) when p|m and zero otherwise. Then τ=pψ_O on all B.

Additional hypotheses: The PMIA L2 request supplies ψ_O independently from bounded measures, its continuity and the displayed polynomial action. No division by p in O[[T]] is used.

Proof plan: The trace coordinate formula gives its values on every Y^m. These vectors span the polynomial series. The measure supplier’s polynomial formula identifies pψ_O there. Both maps are continuous; polynomial series are dense for the coefficient topology. Apply the native dense equalizer theorem.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-trace-coordinates`, `ColemanPowerSeries:L1/unramified-coordinates-homeomorphism`, `PadicMeasuresIwasawaAlgebras:L2`, `mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries`, `mathlib:DenseRange.equalizer`, `ColemanPowerSeries:L1/unramified-norm-continuous`.

Source: Coleman1979, §IV, Corollary 12(ii), p.102; comparison with parent normalized-trace formula. Coleman’s additive division-point sum is the integral trace. Identification with the measure-theoretic normalization uses the parent comparison and the coefficient-extension input, not a new definition of ψ.

### Commutation of norm with coefficient Frobenius

Node `ColemanPowerSeries:L1/unramified-norm-frobenius`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_frobenius`.

For all f∈B, N(Σf)=ΣN(f). The same statement holds for any continuous ℤ_p-algebra coefficient automorphism of O.

Proof plan: Σ commutes with Φ and fixes each basis vector. The left-multiplication matrix of Σf is the coefficientwise σ-image of that of f. Determinants commute with ring maps.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-basis`, `ColemanPowerSeries:L1/unramified-norm`, `mathlib:RingHom.map_det`.

Source: Coleman1979, §IV, equations (2)–(4), p.103. Coleman forms Frobenius-corrected norm iterates. The cyclotomic matrix calculation proves the required commutation explicitly.

### Unramified norm as division-point product

Node `ColemanPowerSeries:L1/unramified-norm-root-product`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_root_product`.

For a complete ramified integral receiving ring S containing O and a primitive p-th root ξ, with continuous coefficient map ρ, the identity map(ρ)(Φ(Nf))=∏_(i<p) t_i(map(ρ)f) holds, where t_i is native convergent power-series evaluation T↦ξ^iY−1. Each such substitution is defined only in S[[T]], with ξ^i−1 topologically nilpotent.

Additional hypotheses: S is a complete Hausdorff DVR receiving O injectively and continuously, with an adic topology in which ξ−1 is topologically nilpotent. ξ has order p; the translated series ξ^iY−1 satisfy native HasEval in S[[T]], and the constant-series coefficient homomorphism is continuous.

Proof plan: Extend the multiplication matrix along ρ. Evaluate the basis at the p translated points using convergent evaluation first in S[[T]]. Then extend coefficients to (Frac S)[[T]]. The Vandermonde determinant is a product of distinct root differences and powers of Y, hence is invertible in this coefficient extension. Diagonalization there gives the translated values as diagonal entries. Take determinants and descend to S[[T]] using coefficient-map injectivity. Evaluation is never manufactured in a field with an artificial linear topology.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-basis`, `ColemanPowerSeries:L1/unramified-norm`, `tauceti:PowerSeries.aeval_subst`, `mathlib:PowerSeries.eval₂Hom`.

Source: Coleman1979, §IV, Theorem 11, p.102. This is the defining division-point product in Coleman, specialized to the multiplicative formal group. The determinant comparison reuses the parent Vandermonde argument over the correct receiving ring. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/root-translation-multiplication-matrix, ColemanPowerSeries:L1/coleman-norm-root-product. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

Acceptance: For a complete ramified integral receiving ring S containing O and a primitive p-th root ξ, with continuous coefficient map ρ, the identity map(ρ)(Φ(Nf))=∏_(i<p) t_i(map(ρ)f) holds, where t_i is native adic substitution T↦ξ^iY−1. Each such substitution is defined only in S[[T]], with ξ^i−1 topologically nilpotent.

### Coefficient precision reflected by cyclotomic substitution

Node `ColemanPowerSeries:L1/unramified-phi-reflection`; proposed declaration `TauCetiRoadmap.ColemanUnramified.phi_reflection`.

For r≥0 and f∈B, Φ(f)∈p^rB if and only if f∈p^rB.

Proof plan: Modulo p, Φ becomes expansion T↦T^p, which is injective over the residue field. Induct on r, using p-torsion freeness of O to divide coefficients once and coefficientwise completeness only where the parent coordinate construction needs it. Equivalently project to each finite ℤ_p-basis component and apply the parent reflection theorem.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-scalar-algebra`, `mathlib:PowerSeries.coeff_map`.

Source: Coleman1979, §IV, Lemma 13(i), p.103. The residue substitution is injective; this is the integral descent step in the norm congruence argument. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/frobenius-congruence-reflection. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

### Coleman norm modulo the coefficient prime

Node `ColemanPowerSeries:L1/unramified-norm-residue-frobenius`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_residue_frobenius`.

For every f∈B, N(f)−Σf∈pB. For nontrivial unramified coefficients this is not the congruence N(f)≡f.

Proof plan: In k[[T]], the native map_frobenius_expand identity and the residue action of σ give f̄^p=Φ̄(Σ̄f). Thus f^p−Φ(Σf) lies in pB. The multiplication-matrix homomorphism sends f^p to M_f^p and Φ(Σf) to the scalar matrix Σf·I. It preserves pB because Φ fixes p. Reduce its entries modulo p, so M̄_f^p=Σ̄f·I. Take determinants using RingHom.map_det and Matrix.det_pow. Since the matrix has rank p, (N̄f)^p=(Σ̄f)^p. The residue series ring k[[T]] is a domain; in characteristic p this forces N̄f=Σ̄f. This establishes the congruence directly, without assuming a purely inseparable norm theorem.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-basis`, `ColemanPowerSeries:L1/unramified-norm`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `mathlib:PowerSeries.map_frobenius_expand`, `mathlib:Matrix.det_pow`, `mathlib:RingHom.map_det`.

Source: Coleman1979, §IV, Lemma 13(ii), p.103; see also Sharifi §5.4, proof of Proposition 5.4.6, p.145. Coleman’s corrected congruence includes the arithmetic coefficient Frobenius. This fixes the omitted coefficient action in the inspected secondary calculation. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-residue-identity. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

Acceptance: For a Teichmüller c with σ(c)=c^p≠c modulo p, N(C(c)) is congruent to C(σ(c)), not C(c).

### One extra digit from the norm near one

Node `ColemanPowerSeries:L1/unramified-norm-near-one-gain`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_near_one_gain`.

For r≥1 and h∈B, N(1+p^r h)−1∈p^(r+1)B.

Proof plan: Expand det(I+p^r M_h). The term linear in p^r is p^r τ(h), divisible by p^(r+1) by the trace coordinate formula. Each term of degree at least two contains p^(2r), divisible by p^(r+1). The constant term is one.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm`, `ColemanPowerSeries:L1/unramified-trace-coordinates`.

Source: Coleman1979, §IV, Lemma 13(ii), p.103. The norm of an element congruent to one gains one uniformizer power; the explicit determinant expansion proves the needed integral statement. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-improves-one-congruence. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

### Improved congruence for unit norms

Node `ColemanPowerSeries:L1/unramified-norm-congruence-gain`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_congruence_gain`.

For f,g∈Bˣ and r≥1, f−g∈p^rB implies N(f)−N(g)∈p^(r+1)B.

Proof plan: Write fg⁻¹=1+p^r h in B. Apply near-one gain. Multiply by the unit N(g), which preserves the p-power ideal.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm-near-one-gain`, `ColemanPowerSeries:L1/unramified-norm`.

Source: Coleman1979, §IV, Lemma 13(ii), p.103. The near-one congruence becomes a contracting congruence on unit ratios.

### Coefficientwise continuity of the unramified norm

Node `ColemanPowerSeries:L1/unramified-norm-continuous`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_continuous`.

N:B→B and τ:B→B are continuous for the coefficientwise p-adic topology.

Proof plan: In the finite basis, the matrix of multiplication by f depends continuously on its coordinate functions. Those coordinates are continuous. Finite determinant and trace polynomials are continuous.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-coordinates-homeomorphism`, `ColemanPowerSeries:L1/unramified-norm`, `ColemanPowerSeries:L1/unramified-trace`.

Source: Coleman1979, §IV, Proposition 14 and Corollary 17, pp.104–106. The projection and interpolation are topological. Finite matrices establish the continuity needed here in the source’s coefficient topology.

### Frobenius-corrected Coleman norm

Node `ColemanPowerSeries:L1/unramified-corrected-norm`; proposed declaration `TauCetiRoadmap.ColemanUnramified.correctedNorm`.

Define M:Bˣ→*Bˣ by M(f)=Σ⁻¹(N(f)). This is the corrected one-step norm on series units.

Proof plan: Restrict the native norm homomorphism to units by native Units.map. Postcompose with coefficientwise σ⁻¹. Both maps preserve units and multiplication.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm`, `ColemanPowerSeries:L1/unramified-norm-frobenius`, `tauceti:TauCeti.Algebra.normUnits`, `mathlib:Units.map`.

Source: Coleman1979, §IV, equations (2)–(4), p.103. Coleman iterates the norm with inverse coefficient Frobenius; this is his corrected iteration specialized to integral unit series.

Uses: Coleman Lemma 13 and Proposition 14: Produces convergent iterates although raw norms can cycle on constants. L1 interpolation existence: Corrects finite-level lifts without reversing the arithmetic Frobenius convention.

Public API:

- `TauCetiRoadmap.ColemanUnramified.correctedNorm_val` (data): M(f)=Σ⁻¹N(f) on underlying series.
- `TauCetiRoadmap.ColemanUnramified.correctedNorm_iterate` (relation): M^r(f)=Σ^(−r)N^r(f).
- `TauCetiRoadmap.ColemanUnramified.correctedNorm_fixed` (characterisation): M(f)=f if and only if N(f)=Σf.
- `TauCetiRoadmap.ColemanUnramified.correctedNorm_continuous` (structure): M is continuous.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.corrected_one` (degenerate): M(1)=1.
- `TauCetiRoadmap.ColemanUnramified.Tests.corrected_teichmuller` (computation): If σ(c)=c^p for c∈Oˣ, M(C(c))=C(c).
- `TauCetiRoadmap.ColemanUnramified.Tests.corrected_native` (compatibility): M is inverse coefficient Frobenius composed with the native unit norm for Φ.

### Uniform precision of corrected norm iterates

Node `ColemanPowerSeries:L1/unramified-iteration-precision`; proposed declaration `TauCetiRoadmap.ColemanUnramified.iteration_precision`.

For f∈Bˣ and a≥b≥0, M^a(f)−M^b(f)∈p^(b+1)B.

Proof plan: The residue-Frobenius norm congruence gives M(f)≡f modulo p. Apply the unit congruence gain repeatedly, since σ⁻¹ preserves all p-power ideals. Consecutive iterates at index b agree modulo p^(b+1). Telescope from b to a; every later difference lies in the same ideal.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-corrected-norm`, `ColemanPowerSeries:L1/unramified-norm-residue-frobenius`, `ColemanPowerSeries:L1/unramified-norm-congruence-gain`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Source: Coleman1979, §IV, equation (2) and Lemma 13, p.103. The uniform precision estimate is the cyclotomic version of Coleman’s corrected-iterate estimate.

### Frobenius norm-fixed unit subgroup

Node `ColemanPowerSeries:L1/unramified-fixed-units`; proposed declaration `TauCetiRoadmap.ColemanUnramified.fixedUnits`.

Define B^(N=Σ)={f∈Bˣ:N(f)=Σf}, the equalizer subgroup of the unit norm and coefficient Frobenius. Its topology is the inherited unit/subtype topology.

Proof plan: Use the native equalizer subgroup of the two group homomorphisms. The defining equation is equivalent to M(f)=f. No abstract fixed predicate replaces the native subgroup.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm`, `ColemanPowerSeries:L1/unramified-corrected-norm`, `mathlib:MonoidHom.eqLocus`.

Source: Coleman1979, §IV, Proposition 14 and Corollary 17, pp.104–106. Coleman’s limiting group is cut out by norm equals coefficient Frobenius, rather than raw norm equals identity.

Uses: Coleman Theorem A: This is the integral series group corresponding to actual unit towers. L1 norm projector: This is the image and codomain of the corrected norm limit.

Public API:

- `TauCetiRoadmap.ColemanUnramified.mem_fixedUnits` (characterisation): f belongs exactly when N(f)=Σf.
- `TauCetiRoadmap.ColemanUnramified.fixedUnits_corrected` (compatibility): Membership is equivalent to M(f)=f.
- `TauCetiRoadmap.ColemanUnramified.fixedUnits_ext` (extensionality): Members are equal when their underlying power series agree.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.fixed_one` (degenerate): 1 belongs.
- `TauCetiRoadmap.ColemanUnramified.Tests.fixed_Y` (computation): For s=(−1)^(p−1), the unit series sY belongs: Y for odd p and −Y for p=2.
- `TauCetiRoadmap.ColemanUnramified.Tests.fixed_teichmuller` (non-example): C(c) belongs when σ(c)=c^p, even if N(C(c))≠C(c).

### Compactness of series units and the fixed subgroup

Node `ColemanPowerSeries:L1/unramified-unit-space-compact`; proposed declaration `TauCetiRoadmap.ColemanUnramified.unit_space_compact`.

The native unit space Bˣ and its closed subgroup B^(N=Σ) are compact Hausdorff for the coefficient/unit topology.

Proof plan: A series is a unit exactly when its constant coefficient is a unit. Oˣ is clopen in compact O, so unit-valued series form a compact subset of the compact product O^ℕ. Formal inversion has each coefficient a finite polynomial in coefficients and the inverse constant. This identifies that subset homeomorphically with native Bˣ. The norm and coefficient Frobenius are continuous, hence their equalizer is closed.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-fixed-units`, `ColemanPowerSeries:L1/unramified-norm-continuous`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

Source: Coleman1979, §I, Lemma 2a, pp.94–95; §IV, Proposition 14, p.104. Compactness and the source coefficient topology supply a closed unit carrier for the interpolation argument. The finite-unramified case is a compact coefficient product.

### Corrected norm projector

Node `ColemanPowerSeries:L1/unramified-norm-limit`; proposed declaration `TauCetiRoadmap.ColemanUnramified.normLimit`.

Construct Lσ:Bˣ→*B^(N=Σ) by the coefficientwise limit of M^r(f). This is a multiplicative retraction onto the Frobenius norm-fixed subgroup.

Proof plan: Iteration precision makes every coefficient Cauchy. Complete O gives a unique limiting series. The constant coefficients stay unit-valued; alternatively take the limit in the compact native unit space. Continuity of M and the precision estimate imply M(Lσf)=Lσf. Multiplication commutes with limits. For fixed inputs the iterates are constant, proving the retraction property. Continuity is established by the separately promoted uniform-precision lemma.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-iteration-precision`, `ColemanPowerSeries:L1/unramified-norm-continuous`, `ColemanPowerSeries:L1/unramified-unit-space-compact`, `ColemanPowerSeries:L1/unramified-fixed-units`.

Source: Coleman1979, §IV, equations (3)–(4), p.103, Proposition 14, p.104. Coleman constructs the Frobenius-corrected limiting norm as a projection. The finite unramified specialization retains units and uses the exact corrected iterates. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-limit-convergence. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

Uses: Coleman Proposition 14: Gives the fixed subgroup as a retract. Coleman Theorem A: Produces fixed approximants and clarifies the coefficient twist.

Public API:

- `TauCetiRoadmap.ColemanUnramified.normLimit_tendsto` (characterisation): M^r(f) tends to the underlying unit of Lσf.
- `TauCetiRoadmap.ColemanUnramified.normLimit_precision` (data): Lσf−M^r(f)∈p^(r+1)B.
- `TauCetiRoadmap.ColemanUnramified.normLimit_retract` (simp): Lσ(f)=f for f in B^(N=Σ).
- `TauCetiRoadmap.ColemanUnramified.normLimit_continuous` (structure): Lσ is continuous in coefficientwise topology.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.limit_one` (degenerate): Lσ(1)=1.
- `TauCetiRoadmap.ColemanUnramified.Tests.limit_teichmuller` (computation): Lσ(C(c))=C(c) for a Teichmüller unit.
- `TauCetiRoadmap.ColemanUnramified.Tests.limit_near_one` (non-example): Lσ(C(1+p))=1, so this projector is not the identity on Bˣ.

Acceptance: Construct Lσ:Bˣ→*B^(N=Σ) by the coefficientwise limit of M^r(f). This is a multiplicative continuous retraction onto the Frobenius norm-fixed subgroup.

### Uniform precision of the corrected projector

Node `ColemanPowerSeries:L1/unramified-norm-limit-precision`; proposed declaration `TauCetiRoadmap.ColemanUnramified.normLimit_precision`.

For f∈Bˣ and r≥0, Lσf−M^r(f)∈p^(r+1)B.

Proof plan: Pass the iteration precision estimate to the limit, using closed p-power ideals coefficientwise.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-iteration-precision`, `ColemanPowerSeries:L1/unramified-norm-limit`, `ColemanPowerSeries:L1/unramified-norm-continuous`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: Coleman1979, §IV, equations (3)–(4), p.103, Proposition 14, p.104. The uniform coefficient precision turns the corrected limit into a continuous projection; no continuity in a supremum norm is assumed.

### Coefficient Frobenius and native cyclotomic evaluation

Node `ColemanPowerSeries:L1/unramified-evaluation-frobenius`; proposed declaration `TauCetiRoadmap.ColemanUnramified.evaluation_frobenius`.

For every f∈B and n≥0, ε_n(Σf)=σ_n(ε_n(f)). Also ε_(n+1)(Φf)=inclusion(ε_n(f)).

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: For coefficients and T, these equations are the coefficient-extension property of σ_n, its fixing π_n, and ζ_(n+1)^p=ζ_n. They follow on polynomial series by ring-homomorphism laws. All participating homomorphisms are continuous. Apply polynomial density and the native equalizer theorem.

Direct prerequisites: `ColemanPowerSeries:L0`, `ColemanPowerSeries:L1/unramified-scalar-algebra`, `mathlib:PowerSeries.eval₂Hom`, `mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries`, `mathlib:DenseRange.equalizer`.

Source: Coleman1979, §IV, Corollary 12, p.102, Theorem 16, pp.105–106. The source’s evaluation and coefficient-Frobenius squares use a lift fixing division points. These are the two native specialization identities.

### Specialization to the unramified relative multiplication matrix

Node `ColemanPowerSeries:L1/unramified-evaluation-matrix`; proposed declaration `TauCetiRoadmap.ColemanUnramified.evaluation_matrix`.

The b_i multiplication matrix of f, evaluated entrywise by ε_n, equals the multiplication matrix of ε_(n+1)(f) in the relative O_n-basis ζ_(n+1)^i, i<p.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Specialize the basis expansion for fY^j at π_(n+1). Evaluation of Φ(c_i(fY^j)) is the inclusion of ε_n(c_i(fY^j)). The supplied relative power basis makes those coefficients unique, hence gives entrywise matrix equality.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-basis`, `ColemanPowerSeries:L1/unramified-evaluation-frobenius`, `ColemanPowerSeries:L0`.

Source: Coleman1979, §IV, Corollary 12, p.102. Coleman’s finite-level norm and trace identities specialize the division-point algebra. The matrix lemma supplies an integral proof over the actual coefficient compositum. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/arithmetic-multiplication-matrix. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

### Unramified arithmetic norm square

Node `ColemanPowerSeries:L1/unramified-norm-evaluation`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_evaluation`.

For n≥0 and f∈B, ε_n(Nf)=Algebra.norm_(O_n)(ε_(n+1)(f)); on units the native unit-map version is ε_n(Nf)=ν_n(ε_(n+1)f).

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Take determinants of the specialized multiplication matrices. Ring homomorphisms commute with determinants. The L0 fraction-field comparison identifies the native integral norm with the field norm after inclusion; import that supplier result. Restrict the displayed integral square using the native unit-norm homomorphism.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-evaluation-matrix`, `ColemanPowerSeries:L1/unramified-norm`, `mathlib:RingHom.map_det`, `tauceti:TauCeti.Algebra.normUnits`, `ColemanPowerSeries:L0`.

Source: Coleman1979, §IV, Corollary 12(i), p.102. This is the actual norm/evaluation compatibility, rather than an assumed interpolation equation.

Acceptance: For f=C(c), both sides equal the scalar image of c^p, even when σ(c)≠c. For f=Y and odd p both sides are ζ_n.

### Unramified arithmetic trace square

Node `ColemanPowerSeries:L1/unramified-trace-evaluation`; proposed declaration `TauCetiRoadmap.ColemanUnramified.trace_evaluation`.

For n≥0 and f∈B, ε_n(τf)=Algebra.trace_(O_n)(ε_(n+1)f).

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Take traces of the specialized matrices. The L0 integral-to-field trace comparison is an imported supplier result. The displayed square is integral and base-valued; no normalization or inverse substitution enters.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-evaluation-matrix`, `ColemanPowerSeries:L1/unramified-trace`, `ColemanPowerSeries:L0`.

Source: Coleman1979, §IV, Corollary 12(ii), p.102. The division-point sum is the finite-level trace. It is integral before any normalized ψ comparison.

### Separation over finite unramified coefficients

Node `ColemanPowerSeries:L1/unramified-evaluation-separation`; proposed declaration `TauCetiRoadmap.ColemanUnramified.evaluation_separation`.

If f,g∈B have ε_n(f)=ε_n(g) for every n≥0, then f=g.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: If f−g were nonzero, its evaluations would eventually be nonzero by the preceding lemma. Every one is zero by the hypothesis.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-evaluation-eventually-nonzero`.

Source: Coleman1979, Introduction, Theorem A, p.92; §IV, Theorem 16, pp.105–106. Coleman identifies uniqueness with Weierstrass preparation. This specializes that argument to the actual finite unramified cyclotomic fields and increasing degrees.

Acceptance: A single level does not determine a series: the minimal polynomial of π_n evaluates to zero at that level.

### Frobenius-twisted evaluation into local unit towers

Node `ColemanPowerSeries:L1/unramified-twisted-evaluation`; proposed declaration `TauCetiRoadmap.ColemanUnramified.twistedEvaluation`.

Define evσ:B^(N=Σ)→*U∞ by (evσf)_n=σ_n^(−n)(ε_n(f)). These are actual finite-level units and are norm-compatible.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: The native evaluation and coefficient automorphisms map units to units. Use norm evaluation: ν_n(ε_(n+1)f)=ε_n(Nf)=σ_n(ε_n f). The supplied σ_n commute with the relative norm. Apply σ_n^(−n−1) to the last equality to obtain ν_n((evσf)_(n+1))=(evσf)_n. Multiplication is coordinatewise.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-fixed-units`, `ColemanPowerSeries:L1/unramified-norm-evaluation`, `ColemanPowerSeries:L1/unramified-evaluation-frobenius`, `ColemanPowerSeries:L0`, `tauceti:TauCeti.Algebra.normUnits`.

Source: Coleman1979, Introduction, Theorem A, p.92; §IV, Corollary 17, pp.105–106. Coleman’s inverse Frobenius twist on the nth evaluation is precisely the coordinate formula for the map into the norm limit.

Uses: Coleman Theorem A and Corollary 17: Gives the inverse of the Coleman interpolating-series map. ColemanPowerSeries:L2: Provides the correct arithmetic identification when coefficients are extended.

Public API:

- `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_coordinate` (data): Coordinate n is σ_n^(−n)ε_n(f).
- `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_continuous` (structure): The map is continuous for the coefficient and product/subtype topologies.
- `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_injective` (characterisation): All coordinates determine f uniquely.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.evaluation_one` (degenerate): evσ(1) is the unit tower of ones.
- `TauCetiRoadmap.ColemanUnramified.Tests.evaluation_Y` (computation): For s=(−1)^(p−1), evσ(sY) has coordinate sζ_n. This is the root tower ζ_n for odd p and the signed root tower −ζ_n for p=2.
- `TauCetiRoadmap.ColemanUnramified.Tests.evaluation_teichmuller` (non-example): For a Teichmüller c with σ(c)=c^p≠c, C(c) has tower σ_n^(−n)c. The repeated constant c violates the actual relative norm equation already at levels 1→0.

### Injectivity of twisted evaluation

Node `ColemanPowerSeries:L1/unramified-twisted-evaluation-injective`; proposed declaration `TauCetiRoadmap.ColemanUnramified.twistedEvaluation_injective`.

evσ is injective.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Apply σ_n^n to equality of coordinate n. The two series then have identical ε_n values at every level. Apply evaluation separation.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-twisted-evaluation`, `ColemanPowerSeries:L1/unramified-evaluation-separation`.

Source: Coleman1979, Introduction, Theorem A, p.92; §IV, Corollary 17, pp.105–106. This is the uniqueness half of the interpolation isomorphism.

### Corrected norms of native finite-level lifts

Node `ColemanPowerSeries:L1/unramified-iterated-lift-evaluation`; proposed declaration `TauCetiRoadmap.ColemanUnramified.iterated_lift_evaluation`.

Let u∈U∞ and let g∈Bˣ have ε_m(g)=σ_m^m(u_m). For 0≤n≤m, ε_n(M^(m−n)g)=σ_n^n(u_n).

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Iterate the norm evaluation square from level m to n. The tower equations identify the iterated norm of u_m with u_n. Coefficient Frobenius commutes with all relative norms and evaluation. Corrected iteration inserts σ_n^(−m+n). The resulting coefficient exponent is n, giving the stated equality.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm-evaluation`, `ColemanPowerSeries:L1/unramified-evaluation-frobenius`, `ColemanPowerSeries:L1/unramified-corrected-norm`, `ColemanPowerSeries:L0`.

Source: Coleman1979, §IV, Theorem 15, pp.104–105, and Theorem 16, p.105. The finite interpolation theorem transports division-point values through corrected norms. This lemma is the native cyclotomic transport identity used in the compactness proof.

### Uniform finite-level approximation of a unit tower

Node `ColemanPowerSeries:L1/unramified-finite-precision-interpolation`; proposed declaration `TauCetiRoadmap.ColemanUnramified.finite_precision_interpolation`.

For u∈U∞ and r≥0, choose a polynomial unit lift g_r with ε_(2r)(g_r)=σ_(2r)^(2r)(u_(2r)). Put v_r=M^r(g_r). For every n≤r, ε_n(v_r)−σ_n^n(u_n)∈p^(r+1)O_n, and M(v_r)−v_r∈p^(r+1)B.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: The L0 integral power basis and local unit criterion give the polynomial unit lift at level 2r. For n≤r, the iterated-lift identity gives exact interpolation by M^(2r−n)g_r. The exponent 2r−n is at least r. Iteration precision compares this exact value with M^r g_r modulo p^(r+1); evaluation is a ring homomorphism fixing p, so it sends the scalar p-power ideal into the corresponding native ideal of O_n. The same precision theorem compares consecutive iterates at r to prove the approximate fixed equation.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-iterated-lift-evaluation`, `ColemanPowerSeries:L1/unramified-iteration-precision`, `ColemanPowerSeries:L0`.

Source: Coleman1979, §IV, Theorem 15, pp.104–105, and Theorem 16, p.105. This is a worker compactness route to the finite-unramified unit specialization of Coleman’s interpolation theorem. The doubled-level indexing avoids requiring a lift already satisfying the target fixed equation. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/evaluation-precision-bound. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

Acceptance: Level zero uses ζ_0 of order p, not the identity root. The approximation exponent is r+1 and holds uniformly in all coefficients before evaluation.

### Coleman interpolation with arithmetic Frobenius

Node `ColemanPowerSeries:L1/unramified-interpolation-existence`; proposed declaration `TauCetiRoadmap.ColemanUnramified.interpolation_existence`.

For every u∈U∞ there exists a unique f∈Bˣ with ε_n(f)=σ_n^n(u_n) for every n≥0. This f satisfies N(f)=Σf.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Take the approximating v_r from finite-precision interpolation in the compact native unit space. Choose a convergent subnet with r tending to infinity. For each fixed n, the errors eventually lie in p^(r+1)O_n and tend to zero in the native finite-level adic topology. Continuity of ε_n gives exact interpolation for the limit f. The approximate fixed equation passes to the limit by continuity of M, so f is in the norm/Frobenius equalizer. Evaluation separation gives uniqueness even among all unit series, without assuming fixedness in the uniqueness hypothesis.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-finite-precision-interpolation`, `ColemanPowerSeries:L1/unramified-unit-space-compact`, `ColemanPowerSeries:L1/unramified-norm-continuous`, `ColemanPowerSeries:L1/unramified-evaluation-separation`, `ColemanPowerSeries:L0`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: Coleman1979, Introduction, Theorem A, p.92; §IV, Theorem 16 and Corollary 17, pp.105–106. This proves the integral-unit, finite-unramified specialization of the original interpolation result, with the source’s coefficient twist and actual cyclotomic indexing.

### Unramified Coleman power-series equivalence

Node `ColemanPowerSeries:L1/unramified-interpolation-equivalence`; proposed declaration `TauCetiRoadmap.ColemanUnramified.colemanEquiv`.

Construct Colσ:U∞≃*B^(N=Σ) as the inverse of evσ. Thus ε_n(Colσ(u))=σ_n^n(u_n); neither norm compatibility nor surjectivity is assumed.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Interpolation existence supplies surjectivity of evσ; its injectivity is already proved. Apply the native equivalence construction for a bijective homomorphism and take its inverse. The group laws follow from the native monoid homomorphism and uniqueness of interpolation.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-twisted-evaluation`, `ColemanPowerSeries:L1/unramified-twisted-evaluation-injective`, `ColemanPowerSeries:L1/unramified-interpolation-existence`, `mathlib:MulEquiv.ofBijective`.

Source: Coleman1979, §IV, Theorem 16 and Corollary 17, pp.105–106. Coleman’s series map is the inverse of the twisted evaluation map and is a multiplicative isomorphism.

Uses: Coleman Corollary 17: Identifies local units with the Frobenius norm-fixed power-series subgroup. ColemanPowerSeries:L2: Allows subsequent Coleman constructions to consume actual arithmetic units.

Public API:

- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_interpolation` (data): ε_n(Colσ(u))=σ_n^n(u_n).
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_symm` (compatibility): The inverse is evσ.
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_mul` (simp): Colσ(uv)=Colσ(u)Colσ(v).
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_unique` (characterisation): A unit series with these interpolation values equals Colσ(u).
- `TauCetiRoadmap.ColemanUnramified.colemanEquiv_continuous` (structure): Both directions are continuous.

Unit tests:

- `TauCetiRoadmap.ColemanUnramified.Tests.coleman_one` (degenerate): The tower of ones maps to 1.
- `TauCetiRoadmap.ColemanUnramified.Tests.coleman_root_tower` (computation): The compatible tower sζ_n, s=(−1)^(p−1), maps to sY. At p=2 the compatible signed root tower maps to −Y.
- `TauCetiRoadmap.ColemanUnramified.Tests.coleman_teichmuller` (non-example): The tower σ_n^(−n)c for a Teichmüller c maps to C(c), rejecting the opposite twist.

### Topology of unramified Coleman interpolation

Node `ColemanPowerSeries:L1/unramified-interpolation-homeomorphism`; proposed declaration `TauCetiRoadmap.ColemanUnramified.interpolation_homeomorphism`.

Colσ and evσ are continuous inverse homomorphisms; their underlying equivalence is a homeomorphism.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Twisted evaluation is coordinatewise continuous by native convergent evaluation and σ_n continuity. The map into the product and its closed subgroup is continuous. The fixed series subgroup is compact and U∞ is Hausdorff as a subgroup of a Hausdorff product. The continuous bijective evσ has continuous inverse by compact-to-Hausdorff inversion.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-interpolation-equivalence`, `ColemanPowerSeries:L1/unramified-unit-space-compact`, `ColemanPowerSeries:L0`, `mathlib:Continuous.homeoOfEquivCompactToT2`, `ColemanPowerSeries:L1/unramified-twisted-evaluation`.

Source: Coleman1979, §IV, Corollary 17, pp.105–106. Coleman’s interpolation is a topological isomorphism in the coefficient and norm-limit topologies.

### Arithmetic coefficient Frobenius equivariance

Node `ColemanPowerSeries:L1/unramified-interpolation-frobenius-equivariant`; proposed declaration `TauCetiRoadmap.ColemanUnramified.interpolation_frobenius_equivariant`.

For u∈U∞ let (σu)_n=σ_n(u_n). Then Colσ(σu)=Σ(Colσ(u)).

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: The norm/Frobenius square shows σu is still in U∞. Evaluate the proposed equality at every level and commute σ_n with its own integer powers. Use uniqueness of interpolation. Σ preserves the fixed subgroup by norm/Frobenius commutation.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-interpolation-equivalence`, `ColemanPowerSeries:L1/unramified-norm-frobenius`, `ColemanPowerSeries:L1/unramified-evaluation-frobenius`, `ColemanPowerSeries:L0`.

Source: Coleman1979, §IV, Corollary 17, pp.105–106. The source’s topological Galois-equivariance includes the coefficient automorphism action. This isolates that component in the finite unramified specialization.

### Recovery of the accepted ℤ_p interpolation

Node `ColemanPowerSeries:L1/unramified-base-coefficient-comparison`; proposed declaration `TauCetiRoadmap.ColemanUnramified.base_coefficient_comparison`.

When E=ℚ_p, O=ℤ_p and σ=id, N, τ, M, B^(N=Σ), Lσ and Colσ identify with their accepted parent ℤ_p versions, under the canonical native scalar-algebra and cyclotomic-tower identifications.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: The two structural maps and basis vectors agree, so the native norm and trace agree. The correction is the identity, hence fixed subgroup and iteration limits agree by their defining equations and uniqueness of limits. The interpolation formulas agree; parent and unramified series maps agree by evaluation separation.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm`, `ColemanPowerSeries:L1/unramified-trace`, `ColemanPowerSeries:L1/unramified-corrected-norm`, `ColemanPowerSeries:L1/unramified-norm-limit`, `ColemanPowerSeries:L1/unramified-interpolation-equivalence`, `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/coleman-integral-trace`, `ColemanPowerSeries:L1/coleman-norm-limit`, `ColemanPowerSeries:L1/coleman-equivalence`.

Source: Coleman1979, Introduction, discussion after Theorem A, p.92; §IV, Corollary 17, pp.105–106. Coleman states the ℚ_p specialization; this comparison prevents the coefficient variant from introducing a second incompatible norm or interpolation convention.

### Preservation of integral coefficient precision

Node `ColemanPowerSeries:L1/unramified-norm-preserves-precision`; proposed declaration `TauCetiRoadmap.ColemanUnramified.norm_preserves_precision`.

For f,g∈B and r≥0, f−g∈p^rB implies N(f)−N(g)∈p^rB; units are not required.

Proof plan: The basis coordinate map preserves p^rB, because Φ fixes the scalar p and basis.repr is B-linear for the Φ action. Thus the corresponding multiplication matrices agree modulo p^r. Apply the finite determinant polynomial entrywise.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-basis`, `ColemanPowerSeries:L1/unramified-norm`.

Source: Coleman1979, §IV, Lemma 13 and equations (2)–(3), p.103. Worker determinant consequence supplying the unchanged-precision congruence over finite unramified coefficients. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-preserves-congruence. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

### Iterated norm gain at one

Node `ColemanPowerSeries:L1/unramified-iterated-near-one-gain`; proposed declaration `TauCetiRoadmap.ColemanUnramified.iterated_near_one_gain`.

If f∈Bˣ, r≥1 and f−1∈p^rB, then N^m(f)−1∈p^(r+m)B for every m≥0. The same assertion holds for corrected iterates M^m(f).

Proof plan: Induct on m using the one-step near-one gain. Native unit norms keep every iterate a unit. Coefficient σ and σ⁻¹ preserve each p-power ideal, so the corrected one-step gain and the same induction apply to M.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm-near-one-gain`, `ColemanPowerSeries:L1/unramified-corrected-norm`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Source: Coleman1979, §IV, Lemma 13(ii) and equation (2), p.103. This states the iterated near-one estimate explicitly, completing the unramified variants of the parent congruence package. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/coleman-norm-iterated-improvement. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

### Continuity of the corrected projector

Node `ColemanPowerSeries:L1/unramified-norm-limit-continuous`; proposed declaration `TauCetiRoadmap.ColemanUnramified.normLimit_continuous`.

Lσ:Bˣ→B^(N=Σ) is continuous for the coefficientwise p-adic topology.

Proof plan: Fix a basic output neighborhood, determined by finitely many coefficients and one p-adic precision. Choose r so the uniform error bound for Lσ−M^r is smaller than that precision. Continuity of the finite iterate M^r provides a basic input neighborhood. The uniform error estimate controls both limits there and proves continuity.

Direct prerequisites: `ColemanPowerSeries:L1/unramified-norm-limit`, `ColemanPowerSeries:L1/unramified-norm-limit-precision`, `ColemanPowerSeries:L1/unramified-corrected-norm`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: Coleman1979, §IV, equations (3)–(4), p.103, Proposition 14, p.104. Worker topological consequence of Coleman’s uniform corrected-limit precision estimate.

### Eventual nonvanishing at cyclotomic levels

Node `ColemanPowerSeries:L1/unramified-evaluation-eventually-nonzero`; proposed declaration `TauCetiRoadmap.ColemanUnramified.evaluation_eventually_nonzero`.

For every nonzero f∈B, ε_n(f) is nonzero for all sufficiently large n.

Additional hypotheses: Choose ζ_n of exact order p^(n+1) in an algebraic closure of E, with ζ_(n+1)^p=ζ_n. E_n=E(ζ_n), O_n=integralClosure O E_n, π_n=ζ_n−1. Use the L0 native integral closure, inherited valuation topology, and inclusion-induced algebras. d_n=[E_n:E]=p^n(p−1). ε_n is native convergent series evaluation O[[T]]→O_n at π_n. σ_n extends σ and fixes ζ_n. ν_n is the native unit norm O_(n+1)ˣ→O_nˣ. U∞ is the subgroup of the product of these actual unit groups cut out by ν_n(u_(n+1))=u_n, with product/subtype topology.

Proof plan: Apply the independently supplied complete-DVR Weierstrass factorization f=p^μ P v, with P distinguished and v a unit. The factors p^μ and ε_n(v) are nonzero in O_n, so a zero of ε_n(f) forces P(π_n)=0. The supplied nonzero minimal polynomial of π_n over E has degree d_n=p^n(p−1), tending to infinity. For any nonzero P, a root at π_n forces that minimal polynomial to divide its coefficient image in E[X]. Its degree then cannot exceed degree P. Once d_n>degree P, this is impossible.

Direct prerequisites: `PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization`, `ColemanPowerSeries:L0`.

Source: Coleman1979, Introduction, Theorem A, p.92; §IV, Theorem 16, pp.105–106. Coleman identifies uniqueness with Weierstrass preparation. This specializes that argument to the actual finite unramified cyclotomic fields and increasing degrees. Parent proof models (not assumed O-valued theorems): ColemanPowerSeries:L1/polynomial-evaluation-degree-obstruction. The displayed proof establishes the coefficient variant from its listed native and supplier inputs.

## Acceptance and integration

The main failures the tests must distinguish are an ordinary self-algebra
whose norm has rank one, an embedded rather than base-valued norm, coefficient
Frobenius accidentally included in Φ, a trace with an extra inverse
substitution, a raw norm limit on an unramified coefficient ring, level-zero
evaluation at the identity root, and reversal of the interpolation twist.
The small p=3 basis and trace calculations test the scalar convention.
Teichmüller constants test σ, M, the fixed subgroup and the arithmetic tower
together. For p=3 in the unramified quadratic coefficient field, a Teichmüller
unit c of order eight has raw norm iterates c,c³,c,… and corrected iterate c;
this is a concrete rejection of raw-norm convergence. A single-level minimal
polynomial is a rejection of finite-level uniqueness.

The six proposed planets are the Frobenius power basis, Coleman norm, Coleman
trace, Frobenius-corrected norm, Coleman interpolation theorem and Coleman
power-series equivalence. Assembly chooses at most six for the whole L1
layer, reconciling these names with the parent packet's planets; it does not
concatenate the two planet lists. No new roadmap or carrier ownership is
proposed.

The Suggested file uses the native formal-series scalar module explicitly,
including basis coordinates and left-multiplication matrices. Cyclotomic
fields are intermediate-field adjunctions inside the algebraic closure of
the coefficient fraction field. Their integer rings are native integral
closures. The tower is the intersection of native relative-norm equalizer
subgroups of the actual product of unit groups. Parameters identify those
fields' inclusions, power bases, Frobenius extensions and polynomial lifts,
rather than postulating a norm/evaluation square or interpolation conclusion.
The field and integer-ring parameters are native intermediate fields and
subalgebras, with exact equalities to the indicated adjunctions and integral
closures. Evaluation and the tower subgroup are typed native maps and a
subgroup, with exact characterizations as convergent evaluation and the
norm equalizer. These parameter equalities let the signatures share the L0
inputs without repeatedly normalizing the same field expressions. They do
not assume the L1 norm square or interpolation result. The factorization
supplier is stated using an actual polynomial and unit series. This is a signature prototype, not a proof or implementation.

The parent ℤ_p constructions are also roadmap inputs, rather than compiled
library declarations. The comparison signature therefore takes their native
scalar algebra, norm, additive trace, limiting-unit function and series map
with their already-planned characterizations after the canonical coefficient
and tower identifications. It proves agreement of those objects, not a second
interpolation theorem assumed as an input.

## Sources and version-specific findings

The sources were read on 10 October 2026. All descriptions here and in the
packet are authored paraphrases; source locators identify mathematical claims
and the proof adaptations.

- Robert F. Coleman, *Division Values in Local Fields*, Inventiones
  Mathematicae 53 (1979), 91–116, DOI 10.1007/BF01390028. The published scan
  is linked through [EuDML](https://eudml.org/doc/142657) and
  [Göttingen's scan](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289).
  Theorem A at p.92 fixes the Frobenius direction. Theorem 11 and Corollary
  12 at p.102 give the norm and finite-level identities. Lemma 13 and the
  corrected-limit formulas at p.103, Proposition 14 at p.104, and Theorems
  15–16 and Corollary 17 at pp.104–106 supply the projection and interpolation
  results. Lemma 2a at pp.94–95 supplies the coefficient-topology compactness
  context. The packet pins the scan manifest separately; its hash is not an
  article PDF hash.
- Romyar Sharifi, *Iwasawa Theory*, [author's public notes](https://math.ucla.edu/~sharifi/notes/iwasawa.pdf),
  §5.4, Notation 5.4.1 through Corollary 5.4.13, printed pp.143–147. The
  packet records the SHA-256 of the PDF version read. The
  [author's chapter page](https://math.ucla.edu/~sharifi/notes/iwasawa-ch05.html)
  was checked for existing corrections.

Three findings are scoped to that exact Sharifi version and await independent
review. E-L1-1 concerns the p^n root in Theorem 5.4.9 (p.145) against the
earlier E_n=E(μ_(p^(n+1))) convention: the former would evaluate at zero at
level zero, so the interpolation root must have order p^(n+1). E-L1-2
concerns the product in the proof of Proposition 5.4.6 (p.144), which omits
the identity p-th root: a constant c requires p factors to give c^p. E-L1-3
concerns the final congruence chain in that same proof (p.145): after taking
coefficient Frobenius, the substitution is Φ(Σf). The stated proposition and
its following conclusion already retain Σ. These are intended-formula
misprints, rather than claims that Coleman's theorem is false. No published
correction was found in the inspected author PDF, chapter page or author-site
search results. The packet records the locators, tests, corrections and search
locations; an independent reviewer must confirm them.

All source material needed for this finite-unramified specialization was
accessible publicly. No inaccessible book result is an unexamined proof input.
Assembly must discharge the four precise supplier requests and merge the
parent and this part's declarations, tests and planet choices into one L1
document.
