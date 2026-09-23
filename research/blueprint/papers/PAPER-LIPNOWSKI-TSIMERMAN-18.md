# Characteristic-p comparison and Frobenius blocks

**Partial checkpoint — Codex, codex-7e92bd, 23 September 2026; Refs #1332.**

This incorporates the mathematical work in [PR #2204](https://github.com/CBirkbeck/tauceti-explorer/pull/2204),
the handoff by ChatGPT Pro, cgp-20260923-h7q4. Its P1–P4 supplied the
independent characteristic-polynomial argument, integral saturation, the
cyclic-block proof and the two opposite-algebra signs; P5 supplied the
Milne Newton-polygon finding. Those contributions are now represented in
the extraction and this report, after a fresh source check.

The inventory has **167 items: 22 library, 29 planned, 116 missing**.
There are still eleven routes. The nine new missing items all belong to the
existing finite-field Part II. Ninety-seven missing items are routed; the
same nineteen disputed LT claims are withheld. Two precise R07.2 imports
join its existing source route; the local cyclic invariant is a planned
ClassFieldTheory import. All 152 previous item IDs, kinds, statuses and
statements, their route memberships, and the seventeen earlier source
findings are preserved. Three inherited proof notes/dependency lists are
updated. Two unreviewed findings are appended, bringing the total to nineteen.

The original p-Tate and local-invariant proofs have been located and
decomposed. This does not close their geometric/classification inputs,
the whole paper's extraction, or its implementation. The earlier report
is preserved after this supplement; only its specifically identified
unread-p-source boundaries are superseded.

## D0. Sources, pins and ownership

All downloads and reads below were on 23 September 2026.

| Source | Fresh reading | SHA-256 |
| --- | --- | --- |
| [LT arXiv v1](https://arxiv.org/pdf/1511.02212v1) | All 38 pages of extracted text, including references; p.21 also image-checked | `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a` |
| [Waterhouse–Milne 1971](https://www.jmilne.org/math/articles/1971a.pdf), pp.53–64 (WM71) | All twelve published page images, including Part II Theorems 1–2 and their proofs | `e482e1c60ccd76a068057b18ac28cec02f2746f87048947d8c2a4c328f6c88a8` |
| [Milne 1968](https://www.jmilne.org/math/articles/1968a.pdf), pp.63–84 (M68) | Images of pp.63–67 and p.84 only | `8abdaf4fa604d5ed7faee3f9d4e9dc9382dc35d7b79382fe3540f495fe98fc35` |

M68's later extension-group proofs were not read. Prior Conrad, Yun,
Tate 1966, Waterhouse 1969 and Bourbaki readings retain their earlier
workers' attribution. WM71 p.64 explicitly says that Tate's projected
second endomorphism paper does not exist; WM71 Part II is the original
public proof to use. The DOI for LT again resolved to publisher security
HTML. Both authors still link arXiv v1; **G0 remains open**, and no
finding about that preprint is asserted of the final 2018 publication.

The working explorer snapshot is `54dbb5b`. The reviewed A3/A4/A6 and
ClassFieldTheory Layer 5 coverage rows were read. Consolidated R07.2 and
SemisimpleAlgebras rows are absent at this snapshot; this is not treated
as evidence that their whole subject is missing. The actual R07.1/R07.2,
A3/A4/A6 and ClassFieldTheory Layer 5 descriptions, and the upstream
JacobianChallenge and SemisimpleAlgebras documents, were read. The
AUDIT-08 accepted review identifies the available Cartier duality and
the absent abelian-variety Tate/Dieudonné and general torsion interfaces.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the
`WittVector.Isocrystal`, Frobenius and equivariant Hom definitions were
reread. They supply the carrier, not the group-scheme realization.
The classification at the end of that file is one-dimensional over an
algebraically closed field, not the required finite-group classification.

The following Tau Ceti statements were read at
`f790474821cf4256814db967cb154e7af3d0c369`. Each containing file was
matched byte-for-byte against its raw GitHub URL at that commit.

| Imported statement | Exact scope and use |
| --- | --- |
| `TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq`, `RingTheory/Semisimple/EndAlgebra.lean:144` | A finite-dimensional simple K-algebra R and a finite-dimensional compatible module M satisfy dim End_R(M) · dim R = (dim M)². Centrality and nonzero M are not required. This directly supplies D3's module dimension count. |
| `TauCeti.tensorCentralizerAlgEquiv` and its pure-tensor evaluation, `Algebra/CentralSimple/Centralizer.lean` | Central simple B inside finite-dimensional simple T gives B⊗C_T(B)≅T by multiplication. Used inside T=End_K(V) in D5. |
| `TauCeti.BrauerGroup.mk_op`, `Algebra/BrauerGroup/Group.lean:207` | The opposite class is the inverse class. In the same file, `mk_tensorProduct`, `mk_matrix`, and `mk_end` give the tensor, matrix and split-endomorphism comparisons used in D5. |

The generic endomorphism-dimension theorem, centralizer theorem and
Brauer-group laws are therefore imported. This continuation does not
plan them again. The arithmetic Frobenius-block presentation and its
application to abelian varieties are the new Part II work. The generic
descent, unramified-field and valuation adapters still needing exact
declaration audits are listed as requests, not assigned invented library
names. The A3 finite-flat quotient, A6 degree/finite-rank Hom and R07.2
finite/p-divisible classification owners remain unchanged.

## D1. Degree and characteristic polynomial before p-Tate

Let k=F_(p^a), W=W(k), L=Frac(W), and σ be Witt Frobenius. All uses of
C(A) below are **contravariant**. The two new planned R07.2 items expose
the exact inputs from WM71 p.56 and M68 p.65: exact finite-level comparison
with C(A)/p^n=D(A[p^n]), and rank(H)=p^length_W D(H). Rank means finite
group-scheme rank; it is neither the number of geometric points nor
|k| raised to this length. The p-divisible comparison gives rank_W C(A)=2g.
These classification proofs are imported, not consequences of p-Tate.

For an isogeny f:A→B, exactness identifies coker C(f) with the module of
the p-primary kernel. Its length equals v_p(deg f). For an endomorphism
isogeny, Smith normal form over W gives the same value as v_p(det C(f)).
This is `p-realization-degree-valuation`. Between different varieties
one uses length or the determinant ideal; no canonical scalar determinant
between two different vector spaces is asserted.

For arbitrary u∈End_k(A), write T=C(u) and F=Bσ. Since T commutes with F,
T=Bσ(T)B⁻¹. Thus Q=charpoly_L(T) has coefficients fixed by σ and integral,
hence in Z_p. Let P_u be the intrinsic polynomial supplied by A6 and
realized on V_ℓ(A), ℓ≠p. For an integral polynomial ψ with ψ(u) an
isogeny, the determinant/degree comparison gives

    v_p Res(Q,ψ) = v_p deg ψ(u) = v_p Res(P_u,ψ).

The last equality uses the A6 degree identity on the prime-to-p
realization and determinant/resultant algebra. It does not use p-Tate.

Here is the separation argument supplied in the preceding handoff.
For each monic irreducible factor R of PQ in Q_p[X], integrality of its
roots gives R∈Z_p[X]. Choose a monic integral R_n congruent to R
coefficientwise modulo p^(2n), and put ψ_n=R_n+p^n. At each root α of
R the value has valuation n. At every other root β of PQ it eventually
has the constant valuation v_p R(β). Therefore, for large n,

    v_p Res(P,ψ_n) = n N_R(P) + c_P,

and similarly for Q. N_R counts roots with multiplicity: a factor of
degree d repeated e times contributes de, not just e. Equal valuations
force equal slopes, hence equal irreducible multiplicities and P=Q.
The test resultants are nonzero for sufficiently large n; the degree
formula consequently ensures that ψ_n(u) is an isogeny, so these are
admissible tests in the application.

This proves `p-realization-characteristic-polynomial` relative to the
named geometric inputs. M68 pp.65–66 provides the comparison; it cites
Lang VII §1 Lemma 1 for uniqueness. That book lemma was not read here;
the expanded separation argument is recorded instead. Its precise
generic valuation, integrality-of-factors and coefficient-density
adapters still need a pinned declaration audit under the existing local
fields owner. They are not silently declared formalized.

For Frobenius π_A specifically, centrality in the semisimple Q-algebra
End⁰_k(A) gives a squarefree minimal polynomial. Transporting it to the
realization gives semisimplicity of C(π_A)=F^a. This is a separate
`p-frobenius-semisimplicity` item. F itself is semilinear when a>1.
Specializing a=1 and taking the ordinary linear dual proves the existing
`prime-field-p-frobenius` item. Arbitrary endomorphisms of E² can be
nilpotent; they are not covered by the semisimplicity conclusion.

## D2. Integral injection and saturation before dimension comparison

Set M=Hom_k(A,B) and H=Hom_(W,F,V)(C(B),C(A)). A6 gives finite free M
over Z. H is finite torsion-free over Z_p because W has finite Z_p-rank.
It is p-saturated in the W-linear maps: cancel p in both equivariance
equations. Hence reduction of H embeds in the linear maps modulo p.

A homomorphism f∈M vanishes on C modulo p exactly when it kills the
**group scheme** A[p]. By the quotient A/A[p]≅A given by [p], this is
equivalent to f=pg for a unique g. Thus M/pM→H/pH is injective. For
j:M⊗Z_p→H, iterated reduction proves injectivity. If j(x)=ph, the same
mod-p injection gives x=px′, and cancellation shows h=j(x′). This proves
`p-realization-saturated-hom` without assuming a rational rank identity.

The geometric input is A3's quotient universal property and finite-level
R07.2 faithfulness. Replacing A[p] by its geometric points loses its
connected part and breaks the argument. End composition reverses;
the Hom map goes from C(B) to C(A).

## D3. Finite Frobenius blocks and the existing dimension theorem

Factor P_A over Q_p as ∏m_i^e_i, with distinct monic irreducible m_i of
degrees d_i. Since F^a is semisimple, V=C(A)[1/p] splits into V_i killed
by m_i(F^a). Write K_i=Q_p[X]/m_i and θ_i=X mod m_i, which is nonzero.
The characteristic-polynomial comparison gives

    dim_L V_i = d_i e_i,       dim_Ki V_i = a e_i.

The new construction `p-frobenius-block-algebra` avoids a dependency on
an unexamined general Ore-polynomial classification. It is the finite
direct sum of a copies of L⊗K_i, with elements ∑b_j U^j and multiplication

    (b U^i)(c U^j) = b σ^i(c) θ_i^floor((i+j)/a) U^((i+j) mod a).

Here σ acts on L and fixes K_i. Associativity follows from σ^a=1 and
the elementary carry identity for the exponents; the dimension is a².
The API specifies coefficient inclusion, generator/inverse, component
extensionality, multiplication, the universal action and scalar extension.
U acts as F and θ_i as F^a on V_i. The construction explicitly allows
L⊗K_i to be a product, as happens when K_i contains L.

Over an algebraic closure Ω of K_i, the coefficient algebra is Ω^a.
Choose its cyclically ordered idempotents as diagonal matrices and U
as a cyclic shift whose nonzero wrap weight is θ_i. The a² elements
e_j U^r are nonzero multiples of every matrix unit, so B_i⊗Ω≅M_a(Ω).
Descent of ideals and centers along a field extension proves central
simplicity. `p-frobenius-block-split` records this step and the still
required exact adapter audit under the existing semisimple-algebra owner.

For the commutant dimension, the fresh pinned library check improves the
handoff's proposed Morita/base-change proof: apply
`TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq` directly to B_i and V_i.
It gives

    dim_Ki End_Bi(V_i) · a² = (a e_i)²,

so the dimension is e_i². B_i-linearity is exactly L-linearity plus
commutation with F. Distinct polynomial blocks have no intertwiners,
by Bézout applied to their coprime annihilators. Thus

    dim_Qp End_(L,F)(V) = Σ_i d_i e_i².

This is `p-frobenius-centralizer-dimension`. It includes V=0 by the empty
sum. Commuting only with F^a does not suffice: over the finite F_9 model
with F=σ on two coordinates there are 9⁴ linear maps but only 3⁴ maps
commuting with F.

## D4. Rational comparison and the integral upgrade

Prime-to-p Tate gives the same dimension for End⁰_k(A). One computes
after a splitting field: each root of P_A contributes its multiplicity
squared, and factoring a separable polynomial over any characteristic-zero
completion preserves that sum. This is a generic semisimple-polynomial
adapter, not a p-Tate hypothesis hidden in the argument.

D2 gives the rational injection; D3 and the prime-to-p comparison give
equal dimensions. This yields the End anti-isomorphism. Apply it to A×B
and take the off-diagonal projector corners to obtain
`rational-p-tate-hom`, with its direction C(B)→C(A). Rational equivariant
maps admit a common p-power denominator, identifying the rationalized
integral target with the isocrystal Hom space. Finally the integral map
has saturated image, equal rank and finite cokernel; a finite torsion
Z_p-module with no p-torsion is zero. This proves the existing integral
`p-tate-hom` relative to its displayed suppliers.

The dependency order is therefore

    R07.2 + A3 → saturated injection
    R07.2 + A3 + A6 → degree/polynomial comparison → Frobenius semisimplicity
    block construction + pinned dimension theorem → p-commutant dimension
    these + prime-to-p Tate → rational p-Tate → integral p-Tate.

In particular the polynomial comparison never depends on p-Tate. The
all-q Hom comparison is now explained; the earlier prime-field linear-dual
lattice convention and numerical counting bounds are not generalized by it.

## D5. Local invariant and two sign changes

For simple A and a place v|p of Q(π), let K=Q(π)_v, with residue degree
f_v and ramification index e_v. Put g=gcd(f_v,a), n=a/g. The coefficient
tensor product L⊗K consists of g copies of LK, an unramified degree-n
extension of K. WM71 p.61 explicitly identifies the Frobenius block with
M_g(D), where D has generator U with Uc=σ^g(c)U and U^n=π.

Arithmetic Frobenius of LK/K restricts to σ^(f_v) on L. Hence, if
τ=σ^g, arithmetic Frobenius is τ^(f_v/g). The imported local cyclic
invariant gives

    inv(D) = (f_v/g) ord_v(π)/(a/g)
           = f_v ord_v(π)/a
           = [K:Q_p] ord_v(π)/ord_v(p^a)  in Q/Z.

The module commutant has the opposite Brauer class: the tensor-centralizer
equivalence inside End_K(V_v), together with its trivial Brauer class,
gives [B_v][End_Bv(V_v)]=1. Rational p-Tate identifies E_v^op with that
commutant. Its second opposite cancels the first. This is the new
`p-endomorphism-local-invariant` item. The existing prime-field
commutativity item consumes it. At a=1 the finite p-invariants vanish,
while the real-place exception remains essential.

The local unramified cyclic-invariant formula and algebraic/cohomological
Brauer comparison are imported from ClassFieldTheory Layer 5, which has
an absent invariant in the reviewed audit. WM71 invokes the cocycle
calculation without supplying its complete proof. That input and global
Brauer classification remain G8. Neither the generic Brauer group nor
the tensor-centralizer theorem is missing at the pinned baseline.

## D6. Two source findings, with their distinct provenance

`E-MILNE68-NEWTON-ABSCISSA` is the handoff's proposed misprint in M68 p.67.
The page prints `(c_i, ord_p(c_i))` for a polynomial's Newton polygon;
the abscissa must be i. For 1+F the printed points collapse to one point,
whereas the correct endpoints have abscissae zero and one. The following
formula on the same page uses the exponent i, confirming the intended
meaning. This does not affect the degree comparison on pp.65–66. The
[author's erratum page](https://www.jmilne.org/math/articles/1968a.html)
lists different corrections on pp.78–81, not this notation.

`E18` is a separate finding from this continuation. LT v1 p.21 concludes
its alternative argument in Proposition 4.14(1) by calling the Frobenius
centralizer non-division. The curve E/F_5 given by y²=x³+1 is a concrete
counterexample to that sentence. It is nonsingular and has affine points
(0,1), (0,4), (2,2), (2,3), (4,0), plus infinity, so its trace is zero and
P_E=X²+5. Its Frobenius field Q(√−5) has no real embedding. Since X²+5
is Eisenstein over Q_5, the commutant on its two-dimensional p-realization
is Q_5[X]/(X²+5), a field, hence a division algebra. In a companion basis,

    F = [[0,−5],[1,0]],   C(F) = {xI+yF},   det(xI+yF)=x²+5y².

For nonzero x,y the two summands have valuations of opposite parity,
so the determinant cannot vanish. A field is split over its own center;
this counterexample does **not** disprove Proposition 4.14. The preceding
local-invariant argument proves the desired splitting and should be used.
Neither being a centralizer nor merely being non-division as a Q_p-algebra
would be enough to prove splitting over its center.

Both findings retain `known: new` only in the protocol's limited-search
sense. The sources/images, author pages, arXiv history and searches are
listed in their JSON entries. No independent-review verdict is attached,
and E18 remains v1-only until the final text can be compared.

## D7. Verification and remaining work

The finite diagnostic code below includes the preceding handoff's exact
cyclic-module, semilinear, multiplicity and normalization checks, rerun
here. The new checks add irreducible quadratic valuation tests with a
nontrivial p^(2n) coefficient approximation, explicit twisted-product
associativity, and the E18 point-count/commutant calculation. They test
normalizations and failure cases; they do not establish the general
geometric or local-class-field theorems.

The repository paper checker, preservation/route/dependency/API checks,
and `git diff --check` are recorded in the handoff after execution.
No Lean file was written or compiled. The nineteen previously withheld
claims remain withheld. G0–G7 retain their stated scopes; G8 now replaces
the missing original-p-source lookup by the exact remaining classification,
geometry, local-invariant and generic-adapter proof/audit obligations.

Resume with those geometric suppliers, PEL fixed-degree/twist finiteness,
Honda CM existence, class-set/narrow-norm issues, the final journal text,
and the mass/residue/limit-law inputs. None is discharged by this
characteristic-p comparison alone.

### Exact diagnostics (Python 3 and SymPy 1.14.0)

```python
"""Exact finite diagnostics for the LT18 p-source continuation, not Lean proofs."""
from fractions import Fraction
from itertools import product, combinations_with_replacement
from math import gcd
import sympy as s

# A split cyclic algebra is generated by diagonal idempotents and a weighted cycle.
# Check both the a^2-dimensional span and its r^2-dimensional module commutant.
cyclic_cases = 0
for a in range(1, 5):
    S = s.zeros(a)
    for j in range(a - 1):
        S[j + 1, j] = 1
    S[0, a - 1] = 2
    assert S ** a == 2 * s.eye(a)
    E = []
    for i in range(a):
        e = s.zeros(a); e[i, i] = 1; E.append(e)
    basis = [e * S ** j for e in E for j in range(a)]
    assert s.Matrix.hstack(*(b.reshape(a*a, 1) for b in basis)).rank() == a*a
    for r in (1, 2):
        n = a*r
        gens = [s.kronecker_product(g, s.eye(r)) for g in E + [S]]
        # Column vectorization: vec(XG-GX)=(G^T tensor I-I tensor G) vec(X).
        eq = s.Matrix.vstack(*(s.kronecker_product(g.T, s.eye(n))
                               - s.kronecker_product(s.eye(n), g) for g in gens))
        assert n*n - eq.rank() == r*r
        cyclic_cases += 1

# F_9 = F_3[t]/(t^2+1), encoded by x+3*y. Frobenius fixes exactly F_3.
def add(x, y):
    return ((x % 3 + y % 3) % 3) + 3*((x // 3 + y // 3) % 3)
def neg(x):
    return (-x % 3) + 3*((-(x // 3)) % 3)
def mul(x, y):
    a,b = x % 3, x // 3; c,d = y % 3, y // 3
    return ((a*c-b*d) % 3) + 3*((a*d+b*c) % 3)
def frob(x):
    return mul(mul(x, x), x)
def mm(A, B):
    return tuple(add(mul(A[2*i], B[j]), mul(A[2*i+1], B[2+j]))
                 for i in range(2) for j in range(2))
def det(A):
    return add(mul(A[0], A[3]), neg(mul(A[1], A[2])))
assert all(frob(frob(x)) == x for x in range(9))
assert {x for x in range(9) if frob(x) == x} == {0, 1, 2}
linear_maps = semilinear_commutants = invertible_cases = 0
for B in product(range(9), repeat=4):
    linear_maps += 1
    semilinear_commutants += all(frob(x) == x for x in B)
    if det(B) == 0:
        continue
    # For F=B sigma, F^2=B sigma(B); its characteristic polynomial is sigma-fixed.
    P = mm(B, tuple(frob(x) for x in B))
    tr = add(P[0], P[3]); d = det(P)
    assert frob(tr) == tr and frob(d) == d
    invertible_cases += 1
assert linear_maps == 9**4 and semilinear_commutants == 3**4
assert invertible_cases == (9**2-1)*(9**2-9)

# Valuation tests recover multiplicity in a split integral-root model.
def vp(x, p):
    assert x != 0
    x = abs(x); n = 0
    while x % p == 0:
        x //= p; n += 1
    return n
multiplicity_cases = 0
for p in (2, 3, 5):
    for rank in range(5):
        for roots in combinations_with_replacement(range(4), rank):
            for alpha in range(4):
                # psi_n(T)=T-alpha+p^n, with n beyond every nonzero separation valuation.
                values = [sum(vp(beta-alpha+p**n, p) for beta in roots) for n in (5, 6)]
                assert values[1] - values[0] == roots.count(alpha)
                multiplicity_cases += 1

# Arithmetic Frobenius versus the chosen cyclic generator, with ramification explicit.
invariant_cases = 0
for a in range(1, 13):
    for f in range(1, 7):
        g = gcd(a, f)
        assert gcd(a//g, f//g) == 1
        for e in range(1, 7):
            for t in range(a*e + 1):
                I = Fraction((f//g)*t, a//g)
                assert I == Fraction(f*t, a) == Fraction(e*f*t, a*e)
                invariant_cases += 1
assert Fraction(1, 2) % 1 == Fraction(1, 2)
assert (-(-Fraction(1, 2))) % 1 == Fraction(1, 2)
# A value away from order two detects a missing sign reversal.
assert (-(-Fraction(1, 3))) % 1 == Fraction(1, 3)
assert (-Fraction(1, 3)) % 1 == Fraction(2, 3)
# Group-scheme rank uses p^length, not |F_q|^length.
p, a, length = 3, 2, 3
assert p**length == 27 and (p**a)**length == 729

print(f'PASS: {cyclic_cases} split cyclic-module commutants; '
      f'{invertible_cases} F_9 semilinear Frobenius matrices; '
      f'{multiplicity_cases} valuation-multiplicity tests; '
      f'{invariant_cases} invariant-normalization identities.')
print(f'Naive versus semilinear commutant sizes: {linear_maps} versus {semilinear_commutants}.')
print('Finite diagnostics only; no general theorem or Lean compilation is inferred.')

# Supplement to the handoff's diagnostics; same SymPy and F_9 helpers.
x = s.symbols('x')
quadratic_cases = 0
for prime, constant in ((3, 1), (5, 2)):
    R = x*x + constant
    assert all((z*z + constant) % prime for z in range(prime))
    for exponent in range(5):
        for extra in range(4):
            P = R**exponent * (x - 2)**extra
            valuations = []
            for n in (2, 3):
                # A genuine coefficient perturbation of the irreducible factor.
                psi = R + prime**n + prime**(2*n)*x
                value = int(s.resultant(P, psi, x))
                valuations.append(vp(value, prime))
            assert valuations[1] - valuations[0] == 2*exponent
            quadratic_cases += 1

# The a=2 cyclic product over F_9/F_3. The F_3 basis includes both L-coordinates.
twisted_cases = 0
units = ((1, 0), (3, 0), (0, 1), (0, 3))
for theta in (1, 2):
    def crossed(X, Y):
        b, c = X; d, e = Y
        return (add(mul(b, d), mul(theta, mul(c, frob(e)))),
                add(mul(b, e), mul(c, frob(d))))
    assert crossed((0, 1), (0, 1)) == (theta, 0)
    for A, B, C in product(units, repeat=3):
        assert crossed(crossed(A, B), C) == crossed(A, crossed(B, C))
        twisted_cases += 1
    for z in range(9):
        assert crossed((0, 1), (z, 0)) == crossed((frob(z), 0), (0, 1))

# E18: point count and the exact companion-matrix commutant.
points = [(a, b) for a in range(5) for b in range(5) if (b*b-a*a*a-1) % 5 == 0]
assert len(points) + 1 == 6
assert (-16*27) % 5 != 0
F = s.Matrix([[0, -5], [1, 0]])
a, b, c, d = s.symbols('a b c d')
Z = s.Matrix([[a, b], [c, d]])
assert s.linsolve(list(Z*F-F*Z), (a, b, c, d)) == s.FiniteSet((d, -5*c, c, d))
z, w = s.symbols('z w')
assert F.charpoly(x).as_expr() == x*x+5
assert (z*s.eye(2)+w*F).det() == z*z+5*w*w
# Eisenstein gives the Q_5 field; parity of valuations supplies the nonzero determinant argument.
for i in range(-8, 9):
    for j in range(-8, 9):
        assert 2*i != 1+2*j
# E^2 may have a nonsemisimple endomorphism even though Frobenius is semisimple.
N = s.Matrix([[0, 1], [0, 0]])
assert N != s.zeros(2) and N*N == s.zeros(2)
# M68's printed abscissae lose the constant coefficient for 1+F.
assert {(1, 0), (1, 0)} != {(0, 0), (1, 0)}
print(f'PASS: {quadratic_cases} irreducible-factor valuation cases; '
      f'{twisted_cases} twisted basis associativity cases; E18 point count and commutant; '
      'valuation parity, nonsemisimple endomorphism and Newton-abscissa controls.')

```

---

# Preserved report through PR #2199

# Classification-source continuation: prime-field realizations and adelic levels

**Status: partial; Codex, session codex-a71f92; 23 September 2026.**
This continues PR #2155, following #1848 and #1652. It adds sixteen items:
three pinned library suppliers and thirteen missing mathematical endpoints.
The inventory is now **152 items: 19 library, 26 planned, 107 missing**.
There are eleven routes: 88 missing items and 25 planned items are routed;
the same nineteen disputed source claims remain withheld. There are thirty-nine
definition/construction API-and-test blocks. All seventeen inherited findings
remain version-qualified, unreviewed proposals; no source issue is added.

The new result is a prime-field proof plan for the arithmetic inputs to S6,
with its original-source leaves exposed. It does **not** certify a gap-free
formal proof, a class-number estimate, an all-q classification, or agreement
with the final journal article. The complete preceding report is preserved
below. Historical statements about unread references are superseded only by
the exact reading record here.

## C0. Sources, library evidence and ownership

The LT source remains [arXiv v1](https://arxiv.org/pdf/1511.02212v1).
Its complete reading belongs to the preceding claim. This claim acquired:

| Source | Reading extent | SHA-256 |
| --- | --- | --- |
| [Tate 1966](https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf), Invent. Math. 2, 134–144 | All 489 extracted lines, §§1–3 and references; p.137 additionally rendered | 47f284526522fb48840e1a1383b9bfc0bfc3f6aded39db6119a34a6e02214b87 |
| [Waterhouse 1969](https://www.numdam.org/article/ASENS_1969_4_2_4_521_0.pdf), Ann. Sci. ENS 2, 521–560 | Introduction, Chapters 1–3, Porism 4.3 with its preceding proof, Chapter 6 and bibliography; p.551 additionally rendered | 7be2bf9dde45454afa3dd9a0ea1ba05acbe952b6b573a0c37c2b1b8f0cccbb47 |
| [Tate, Bourbaki exposé 352](https://numdam.org/item/SB_1968-1969__11__95_0/), November 1968, printed 1971, pp.95–110 | All extracted text surveyed; §§1–2 checked with images of pp.96,98,99. Many later formulas are absent from OCR; §§3–6 are not a complete proof audit | a23d9cd18c2ccc155285428ca02f284bc546711c9eb9fe43555dd020fdd328f3 |

Access date: 23 September 2026. Waterhouse is **not** recorded as read in full.
In particular the dyadic matrices of Theorem 6.2 have not been image-audited,
even though Chapter 6 text was read; no new dyadic endpoint is extracted.
Tate 1966 proves the prime-to-characteristic Hom theorem; its p-local
invariant discussion explicitly omits the proof. Bourbaki §2 is an outline
with further inputs, not a complete original p-proof.

At Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, statements read:

- Module.Finite.toModuleEnd_moduleEnd_surjective and jacobson_density,
  Mathlib/RingTheory/SimpleModule/Basic.lean, lines 552–584. The hypothesis
  is **semisimple** module, not only simple; finiteness over End supplies
  surjectivity onto the bicommutant.
- PadicInt.compactSpace, Mathlib/NumberTheory/Padics/ProperSpace.lean,
  lines 38–61: compactness of p-adic integers for a prime p.
- IsCompact.tendsto_subseq, Mathlib/Topology/Sequences.lean, lines 284–302:
  compact-set subsequence extraction in a first-countable space.

These are existing results, not new roadmap tasks. Basis/topology transport
to Tate-module matrices and the semisimple-algebra action comparison remain
application obligations. At Tau Ceti
**f790474821cf4256814db967cb154e7af3d0c369**, the complete field
AbelianVariety/Isogeny.lean was read. It provides the finite-surjective
isogeny predicate and closure properties, not the required finite-flat
quotients, general [n] torsion theorem or realization functors.

ASAM A2/A3/A4/A6 and PELModuli M0–M6 descriptions and reviewed coverage were
read, together with AA.3 and the relevant AA.1 interface. The full ASAM
campaign document and upstream JacobianChallenge and SemisimpleAlgebras
documents were read. The latter determine granularity and existing-carrier
boundaries; neither is re-planned.

There is no consolidated R07.2 entry in data/library-coverage.json at the
working snapshot. AUDIT-37 is a **lead, not an accepted review**.
Its absence claims were checked against the reviewed A4 import row and
fresh pinned-tree searches. Its one-dimensional isocrystal classification
over an algebraically closed residue field is not Dieudonné classification
of group schemes.

Ownership remains:

| New need | Owner / consumer |
| --- | --- |
| Positive division of a polarization | ASAM A2, with A3 torsion and pairings |
| Integral quasi-homomorphism detection | ASAM A6, on its field Hom carrier |
| Prime-field linear-dual realization | R07.2, on imported modules and existing linear dual |
| Good-prime integral-order/lattice adapter | GN.2 |
| Fixed-degree finite-field finiteness | PELModuli M6, with finite-type moduli and rational-family inputs |
| Tate arithmetic applications, marked classification and counting assembly | Existing proposed ASAM finite-field Part II |
| Restricted products and finite coarse class sets | AA.1 and AA.3 imports |

The PEL route is the only new route. It requests the fixed-degree adapter,
not another moduli stack. It includes degrees divisible by p; M2's
good-prime smoothness alone is insufficient. Seven inherited item notes
are updated. Every inherited ID, kind, status, statement and route
assignment is retained. All source-issue objects are unchanged.

## C1. Tate's proof without a circular counting input

Let A/k have dimension g and a k-polarization θ of degree d², and let
ℓ≠char(k). Tate's hypothesis is finiteness of k-isomorphism classes B
admitting both a degree-d² k-polarization and an ℓ-power isogeny B→A.
Over finite fields, fixed-dimension, fixed-polarization-degree finiteness
suffices. **No unpolarized counting theorem is assumed.**

The PEL M6 supplier must turn finite-type polarized geometry into finiteness
of actual k-isomorphism classes. Rational coarse points alone do not account
for descent and twists. Tate also describes a bounded projective-embedding
argument; its original Mumford/Weil inputs remain unread source leaves.

For a Galois-stable maximal θ-isotropic W⊂V=T_ℓ(A)⊗Q_ℓ, put

\[
T=T_\ell(A),\qquad X_n=(T\cap W)+\ell^nT.
\]

The intersection T∩W is saturated of rank g, so [T:X_n]=ℓ^{ng},
without θ being principal. To produce f_n:B_n→A with image lattice X_n,
take the finite étale subgroup represented by ℓ^{-n}X_n/T, quotient A
by it, and factor [ℓ^n] through that quotient. This uses A3 torsion
and quotients, **not** Tate full faithfulness.

The pullback f_n*θ has degree ℓ^{2ng}d². Its alternating Tate form has
values in ℓ^n Z_ℓ(1), by expanding on T∩W+ℓ^nT and using isotropy.
The separate A2 polarization-divisibility item gives
θ_n=ℓ^{-n}f_n*θ, of degree d². The perfect torsion pairing and
quotient-by-[ℓ^n] detect divisibility as a homomorphism; positive scaling
makes the quotient a polarization. Matrix divisibility does not replace
the positivity input.

Finiteness supplies infinitely many B_i isomorphic to a fixed B_n.
Choose v_i:B_n→B_i and set u_i=f_i v_i f_n^{-1}. They preserve X_n
and have image X_i. Its endomorphism lattice is a finite matrix power
over Z_ℓ, hence compact. Extract u_i→u; the limit lies in
E_ℓ=End_k(A)⊗Q_ℓ because this finite-dimensional subspace is closed.

For y∈X_n, the limit u(y) lies in each closed X_j. Conversely, for
x∈∩X_i choose y_i∈X_n with u_i(y_i)=x. Compactness gives a convergent
subsequence y_i→y, and continuity gives u(y)=x. Therefore
u(X_n)=∩X_i=T∩W and u(V)=W. This compact-preimage argument is essential;
one cannot simply commute image and intersection.

Now let k=F_q and suppose Q_ℓ[π] is split. Write D for the commutant
of E_ℓ. Maximal π-stable isotropic subspaces are E_ℓ-images and hence
D-stable. For smaller W, the split module W⊥/W has even dimension at
least two; two distinct stable lines give larger isotropic extensions
whose intersection is W. Descending induction makes every π-eigenline
D-stable. An operator preserving every line of an eigenspace is scalar
there, so D=Q_ℓ[π]. The existing semisimple bicommutant theorem gives
E_ℓ=End_π(V).

The remaining argument is recorded in the inherited tate-hom item.
Centrality and semisimplicity make Q[π] finite étale; choose a prime
splitting it completely. Two semisimple polynomial modules with
factor multiplicities a_P,b_P have intertwiner dimension

\[
\sum_P a_Pb_P\deg P.
\]

This sum is unchanged when separable factors split further. Comparison
with the split-prime result gives rational full faithfulness at every
ℓ≠p; A×B yields Hom from End. The integral image is saturated because
a homomorphism killing A[ℓ] factors through [ℓ]. Equal rank and
saturation give integral full faithfulness.

Still to supply atomically: fixed-degree moduli finiteness, original
polarization positivity/divisibility, split-prime existence, the
semisimple polynomial dimension adapter, and realization/topology
interfaces. Density and compactness themselves are not missing.

## C2. What Waterhouse supplies

Chapter 1 uses different variances. Away from p, T_ℓ is covariant and
V_ℓ/T_ℓ represents ℓ-power torsion. For q:A→B an isogeny,

\[
q_\ell^{-1}(T_\ell B)/T_\ell A=(\ker q)_\ell.
\]

At p, C(A)=Waterhouse's T_pA is **contravariant**:
C(q):C(B)→C(A) is injective with finite cokernel, the Dieudonné module
of the p-primary kernel. Finite p-subgroups correspond to full
F,V-stable **sublattices** of C(A), not superlattices.

For a simple variety over F_p with nonreal Frobenius field E=Q(π),
the local invariant formula is

\[
\operatorname{inv}_v\operatorname{End}^0(A)
 = f_v\,\operatorname{ord}_v(\pi)/a \pmod{\mathbb Z},
 \qquad q=p^a.
\]

At a=1 all finite invariants vanish; there are no real ones.
Brauer classification then gives End⁰(A)=E, a CM field. The simple,
nonreal and prime-field hypotheses matter, and the invariant/Brauer
supplier is distinct from the lattice calculation.

Waterhouse Theorem 6.1(2) realizes every order R containing π and pπ^{-1}.
Choose rank-one R_ℓ-lattices away from p, and one stable under
F=π,V=pπ^{-1} at p. Only finitely many modifications are needed,
because an order is maximal almost everywhere. C4's quotient construction
realizes them. In C3's convention, take the linear dual of Waterhouse's
chosen contravariant p-lattice.

Theorem 6.1(3) uses a **special reference variety** with every local
realization free of rank one over R_ℓ, so all its ideals are kernel
ideals. A general R-lattice with multiplier order R need not be projective.
The whole class set must not be replaced by Pic(R): the locally free
classes form its Picard torsor but do not necessarily exhaust the set.
The original order-realization item is expanded in place.

Waterhouse Proposition 3.1 is conjugacy of endomorphism-algebra embeddings
fixing π. It is **not** the lattice-realization theorem.

## C3. Prime-field convention and two separate p-inputs

Over F_p, W(F_p)=Z_p and scalar Frobenius is the identity. Define

\[
D^{\mathrm{lin}}_0(A)=\operatorname{Hom}_{\mathbb Z_p}(C(A),\mathbb Z_p),
\quad F_D(\phi)=\phi\circ F_C,\quad V_D(\phi)=\phi\circ V_C.
\]

For f:A→B, D^lin₀(f) is precomposition with C(f):C(B)→C(A).
Transposition reverses the reversed composition, hence gives a covariant
realization of rank 2dim A with FV=VF=p and π_D=F_D.
After inverting p, V_D=pF_D^{-1}.

Use the existing linear dual, not a second Dieudonné category.
This is **linear dual**, not an unannounced interchange of F,V by Cartier
duality. Over F_(p^a), a>1, φ∘F is σ-semilinear rather than W-linear,
so this formula is not the general-q construction. That inherited
convention comparison remains G2.

The JSON specifies constructor, evaluation, identity/composition laws,
Frobenius compatibility and annihilator-lattice equivalence. Four tests
cover zero rank, F=diag(1,p),V=diag(p,1), the [p] scaling direction,
and failure of the naive formula over F_(p²).

Two supplier theorems are kept separate:

1. p-tate-hom: Hom(A,B)⊗Z_p identifies with the **contravariant**
   F,V-equivariant maps C(B)→C(A), as stated in Waterhouse §1.2.
2. prime-field-p-frobenius: the linear p-Frobenius is semisimple with
   the same intrinsic characteristic polynomial as the ℓ≠p realizations;
   Waterhouse Chapter 2 states semisimplicity and the component dimensions.

The latter is required for one discriminant product D_* at every prime.
Transposition preserves a polynomial but does **not** prove the
cross-realization comparison. Tate's Bourbaki §2 outlines dimension
comparison through p-divisible groups; its original realization/degree
and rational-faithfulness inputs are not fully decomposed here. The
integral upgrade needs finite-group-scheme faithfulness and saturation.
Do not use the polynomial comparison to prove p-Tate and simultaneously
derive it from p-Tate. Both source boundaries remain visible in G8.

## C4. Realizing tuples and forgetting the marking

Fix A₀/F_p with reference integral realizations T₀,ℓ (D^lin₀ at p).
Take full lattices M_ℓ equal to T₀,ℓ almost everywhere, π-stable away
from p and F,V-stable at p. Away from p the Frobenius determinant is
an ℓ-adic unit, so π-stability implies inverse and Galois invariance.

Choose N>0 with NT₀,ℓ⊆M_ℓ everywhere. Then

\[
L_\ell=N^{-1}M_\ell\supseteq T_{0,\ell}.
\]

The inverse scaling matters: multiplying M by N shrinks it.
Away from p, L_ℓ/T₀,ℓ is a finite Galois-stable torsion subgroup.
At p its annihilator

\[
L_p^\vee=\{c\in C(A_0)[1/p]:\phi(c)\in\mathbb Z_p
                 \text{ for all }\phi\in L_p\}\subseteq C(A_0)
\]

is F,V-stable by the transpose identities. The finite Dieudonné
anti-equivalence turns C(A₀)/L_p∨ into a finite subgroup H_p.
Combine the finitely many primary subgroups inside A₀ to a finite
flat H, and use A3 to form q:A₀→B=A₀/H. Exact realization comparisons
give q_ℓ^{-1}(T_ℓB)=L_ℓ, including the p-realization.
Thus **f=Nq^{-1}:B→A₀** transports the realization lattices to M_ℓ.
The one quotient by H performs the primewise gluing.

Injectivity is a separate integrality argument. Suppose an already
algebraic rational morphism α:A→B carries all integral realizations
into their targets. Write nα=h with h actual and n>0. For ℓ^a exactly
dividing n, its realization is divisible by ℓ^a, so h kills A[ℓ^a].
At p use finite group schemes and Dieudonné faithfulness, **not
geometric points**. Hence h kills A[n] and factors through its quotient
[n]; the factor is α. Apply this also to α^{-1} to detect isomorphisms.

This does **not** use p-Tate full faithfulness: it tests an already
algebraic rational morphism, not whether an arbitrary local linear map
is algebraic. Equal transported tuples give α=(f′)^{-1}f, integral in
both directions, hence the unique marked isomorphism. Postcomposition
by Γ=End⁰(A₀)^× changes the marking, and Γ\\X is precisely the set
of underlying F_p-isomorphism classes.

The all-q target statements stay unchanged; this is their explicit
prime-field restriction. Nonroutine inputs are the named A3/R07.2
quotient, torsion and exactness suppliers, not an implicit classification.

## C5. Finite support of the adelic conjugators

Let f_min be the monic squarefree minimal polynomial of Frobenius.
Its discriminant is nonzero. Away from its prime divisors,

\[
R_\ell=\mathbb Z_\ell[\pi]=S_\ell=\prod_i\mathcal O_{i,\ell}
\]

is finite étale and maximal. Integral idempotents split every full
π-stable lattice into free modules over the DVR factors. There is one
centralizer orbit, with stabilizer conjugate to ∏GL_{n_i}(O_i).
This is the new GN.2 adapter.

Use **f_min**, not the full characteristic polynomial: repeated factors
make the latter discriminant zero. A scalar operator on rank n has
minimal polynomial T−a of discriminant one. Finite-étale/maximal-order
and local freeness interfaces are still implementation work.

Use Tate away from p and both p-inputs of C3 to identify G(Q_ℓ),
G=End⁰(A₀)^×, with the Frobenius centralizer. At p, V=pF^{-1},
so the simultaneous centralizer is the F-centralizer and preserves
the F,V-stable subset.

Choose a finite exceptional set containing p and the divisors of
disc(f_min). At good primes take H₀,ℓ=Stab(T₀,ℓ); at exceptional
primes use S3 for the reference lattice. Their product K₀ is a compact
open of the AA.1 restricted product.

For a tuple M, use H_M,ℓ=H₀,ℓ and a_ℓ=1 outside that exceptional
set and the support of M. At the remaining finitely many places,
S3 gives H_M,ℓ conjugate to H₀,ℓ, containing
S_M,ℓ=Stab(M_ℓ), of index at most ℓ^{Δ_ℓ}.
These groups come from **successive graded saturations**, not the
saturation of the whole mixed lattice. Each is a product of integral
GL groups in block bases, giving local conjugacy in the centralizer.

The tuple a=(a_ℓ) is an actual finite adele because its support is finite.
Then K_M=aK₀a^{-1}. Componentwise stabilization gives
Stab(M)=∏S_M,ℓ; almost all factors equal H₀,ℓ, so this product lies
inside the restricted product. S5 yields

\[
[K_M:\operatorname{Stab}(M)]
 =\prod_\ell[H_{M,\ell}:S_{M,\ell}]
 \le\prod_\ell\ell^{\Delta_\ell}=D_*.
\]

The same support argument identifies adelic orbits with tuples of local
orbits: choose conjugators 1 wherever both tuples are the reference.
Good primes contribute one orbit. The F,V-stable p-subset is invariant
under the same centralizer, so its orbits inject into the F-stable orbit
set. L8 gives #G(A_f)\\X≤D_*². No strong approximation is used.

## C6. Coarse bound and remaining boundary

C4 identifies the desired isomorphism classes with Γ\\X.
C5 supplies S6's arithmetic interfaces in terms of exact A3/R07.2/Tate/AA
supplier theorems. For m=2g and

\[
h=\#\bigl(G(\mathbb Q)\backslash G(\mathbb A_f)/K_0\bigr)<\infty
\]

the resulting bound is

\[
\#\{\text{F}_p\text{-isomorphism classes isogenous to }A_0\}
 \le D_*^3h
 \le (2\sqrt p)^{3m(m-1)}h.
\]

This is assembly on named suppliers, not a claim that their proofs or
Lean interfaces are complete. AA.3 must supply coarse class-set
finiteness for this reductive semisimple-unit group and relate it to
its archimedean-component formulation. The value h is **not estimated**.
Real-Weil/quaternionic groups, norm images and narrow ideal classes
are retained. D_*=1 gives at most h, not one rational class.

G2 is narrowed, not closed. G8 now names remaining geometric,
p-realization, split-prime, Brauer and Honda proof leaves rather than
saying Tate and Waterhouse are unacquired. G0 final-journal comparison,
G1 sharp estimates, G3 polarization/Lang, G4 mass/dyadic/residue,
G5 quaternionic comparison, G6 small-prime repair and G7 statistical
limits remain as before. No new source error is alleged.

## C7. Reproducible finite checks

The following standard-library-only diagnostic passed **32,608 assertions**:
6,817 dual-composition cases; 3,984 F,V transpose cases and 3,984 rejected
F/V swaps; 15,625 three-prime rank-two scaling/duality cases;
1,230 denominator tests; 180 good-prime projection cases; 28 scalar
cases; five bad-prime examples; 54 nested-image/projection checks;
700 factor-refinement dimension checks; and one F_4 semilinearity test.

These test signs, directions and finite algebra. They are not proofs
of geometric representability, Tate/Dieudonné equivalence, compact
limiting arguments or adelic finiteness.

```python
"""Finite diagnostics for continuation C1-C6; not geometric or infinite proofs."""
from fractions import Fraction
from itertools import product
from collections import Counter

counts = Counter()
def ok(label, assertion):
    assert assertion, label
    counts[label] += 1

def mul(A, B, m):
    a,b,c,d = A
    e,f,g,h = B
    return ((a*e+b*g)%m, (a*f+b*h)%m,
            (c*e+d*g)%m, (c*f+d*h)%m)
def tr(A):
    a,b,c,d = A
    return (a,c,b,d)
def det(A):
    a,b,c,d = A
    return a*d-b*c
def inv(A,m):
    a,b,c,d = A
    u = pow(det(A)%m,-1,m)
    return tuple(u*x%m for x in (d,-b,-c,a))
def mv(A,v,p):
    a,b,c,d=A
    x,y=v
    return ((a*x+b*y)%p,(c*x+d*y)%p)

# Covariance: transposition reverses the contravariant matrix composition.
for prime in (2,3):
    mats=list(product(range(prime),repeat=4))
    for A,B in product(mats,repeat=2):
        ok("dual_composition", tr(mul(A,B,prime)) == mul(tr(B),tr(A),prime))

# Linear F,V need transposition, not interchange. Test all integral basis changes mod p^2.
for prime in (2,3):
    m=prime**2
    F=(1,0,0,prime)
    V=(prime,0,0,1)
    for P in product(range(m),repeat=4):
        if det(P)%prime == 0:
            continue
        Q=inv(P,m)
        A=mul(mul(P,F,m),Q,m)
        B=mul(mul(P,V,m),Q,m)
        ok("dual_fv", mul(tr(A),tr(B),m)==(prime,0,0,prime)
           and mul(tr(B),tr(A),m)==(prime,0,0,prime)
           and det(tr(A))==det(A)
           and (tr(A)[0]+tr(A)[3])%m==(A[0]+A[3])%m)
        ok("nontrivial_fv_swap", A != B)

# F_4 = F_2[a]/(a^2+a+1): the naive transpose is not F_4-linear.
def f4mul(a,b):
    out=0
    while b:
        if b&1:
            out ^= a
        b >>= 1
        a <<= 1
        if a&4:
            a ^= 7
    return out
sigma=lambda x:f4mul(x,x)
ok("nonprime_semilinearity",sigma(2)!=2 and sigma(f4mul(2,1))!=f4mul(2,sigma(1)))

# Diagonal lattice tuples at three primes, rank two each.
# M_l has exponents a_l; choose v_l(N)=max(0,a_l1,a_l2).
for exps in product(range(-2,3),repeat=6):
    for offset in (0,2,4):
        a,b=exps[offset:offset+2]
        n=max(0,a,b)
        L=(a-n,b-n)
        dual=(-L[0],-L[1])
        assert n>=a and n>=b and max(L)<=0 and min(dual)>=0
        assert tuple(n+x for x in L)==(a,b)
        assert tuple(-x for x in dual)==L
    ok("tuple_scaling_and_dual",True)

# A rational number belongs to all Z_l iff its reduced denominator is one.
def vp(n,p):
    if n==0:
        return 10**9
    n=abs(n)
    out=0
    while n%p==0:
        out+=1
        n//=p
    return out
primes=(2,3,5,7,11,13,17,19,23,29)
for n,d in product(range(-20,21),range(1,31)):
    x=Fraction(n,d)
    integral=all(vp(x.numerator,p)>=vp(x.denominator,p) for p in primes)
    ok("integrality_detection",integral==(x.denominator==1))

# Finite quotient analogue of X_n = (T intersect W)+p^n T, W first coordinate.
for p in (2,3,5):
    for r in range(1,5):
        m=p**r
        previous=None
        for n in range(r+1):
            image=frozenset((x,(p**n*y)%m) for x,y in product(range(m),repeat=2))
            ok("nested_images", len(image)==p**(2*r-n)
               and (previous is None or image<=previous))
            previous=image
        ok("limit_projection",previous==frozenset((x,0) for x in range(m)))

# Mod-l stable subspaces and integral idempotents at good primes.
for p in (2,3,5,7,11):
    zero=frozenset({(0,0)})
    full=frozenset(product(range(p),repeat=2))
    lines=[frozenset((t,t*s%p) for t in range(p)) for s in range(p)]
    lines.append(frozenset((0,t) for t in range(p)))
    spaces=[zero,full]+lines
    for a,b in product(range(p),repeat=2):
        stable=[W for W in spaces if all(mv((a,0,0,b),v,p) in W for v in W)]
        if a!=b:
            ok("good_prime_projections",len(stable)==4 and all(
                (x,0) in W and (0,y) in W for W in stable for x,y in W))
        else:
            ok("scalar_repeated_block",len(stable)==p+3)
    diagonal=frozenset((t,t) for t in range(p))
    ok("bad_prime_no_idempotent", (1,0) not in diagonal
       and all(mv((0,0,0,0),v,p) in diagonal for v in diagonal))

# Splitting a separable factor preserves the intertwiner-dimension sum.
for degree,a,b in product(range(1,9),range(5),range(5)):
    for first in range(1,degree):
        ok("hom_dimension_refinement",
           a*b*degree==a*b*first+a*b*(degree-first))

for label,count in sorted(counts.items()):
    print(f"{label}: {count}")
print(f"TOTAL: {sum(counts.values())}")
```

Validation and handoff results are recorded in the current JSON verification and handoff. No Lean file is authorized, written or compiled.

---

# Preserved earlier report

# Lipnowski–Tsimerman: stabilizer and level-map continuation

## Continuation by codex-a71f92 — 23 September 2026

Refs #1332. This is a continuation of PR #1848 (this session), itself
continuing PR #1652 (codex-c83e7a), not an independent review. Status:
**partial**. The 124 inherited item objects, 17 proposed v1 source issues,
all 19 withheld claims and the full earlier report/handoff are preserved.
The current JSON has **136 items: 16 library, 26 planned, 94 missing**.
Ten existing routes contain 75 missing and 25 planned items; the other
19 missing items remain explicitly withheld. There are 38
definition/construction API/test blocks and 42 selected, acyclic,
known-endpoint dependency edges. This selected graph is not full closure.

The new contribution is a replacement proof of a coarse non-isotypic
stabilizer bound, followed by an abstract rational-orbit counting argument
with its arithmetic hypotheses exposed. It does not certify the printed
proof, the sharp constant of Theorem 0.1, or the final journal version.

### Read boundary and provenance

At explorer snapshot
`277594a65a53ae5f7530539524add19c453b4e19`, freshly read all 38 pages /
1804 extracted lines of [LT arXiv v1](https://arxiv.org/pdf/1511.02212v1),
including §§0–5.7.3 and the whole bibliography. SHA-256:
`5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`.
Freshly fetched and read §4.8 and the complete Lemma 4.9 proof, printed
pp.14–15, of [Yun v2](https://arxiv.org/pdf/1303.2420v2), SHA-256
`a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347`.
Retrieval/read date: 23 September 2026. This is not a whole-Yun reading.
The earlier Conrad reading, other Yun sections, page-image inspections and
first eleven library checks remain historical evidence attributed below;
no fresh image inspection is claimed here.

The author listings at [Tsimerman's homepage](https://www.math.toronto.edu/jacobt/)
and [Lipnowski's homepage](https://sites.google.com/site/michaellipnowski/)
and [arXiv metadata](https://arxiv.org/abs/1511.02212) were checked again.
They do not establish agreement with the 51-page 2018 journal article.
The earlier publisher-security-HTML failure is historical, not a fresh
publisher retrieval in this claim. G0 remains open. No new sourceIssue or
independent-review verdict is added. Every inherited proposed error remains
scoped to the public v1, not asserted about the unavailable final text.

### Ownership and pinned API boundary

The reviewed GN.2, GN.3 and AA.4 rows were read along with the GN and AA
campaign documents and relevant atlas descriptions. The full upstream
Completed/IntegralLattices and GlobalNumberFields roadmaps were also read.
IntegralLattices supplies algebraic lattice/quotient vocabulary; its
implemented rational integral-form theory is not an implementation of the
finite-residue DVR adapter below. GlobalNumberFields supplies arithmetic
adele/idele carriers, not algebraic-group level quotients. GN.2 owns the
local lattice adapter, GN.3 the arithmetic lattice-orbit count, and AA.4 the
nested-level maps and stabilizer-sensitive bounds. The existing finite-field
Part II consumes them. No roadmap or competing carrier is introduced.

Five new library items are exact suppliers at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `Submodule.quotientEquivPiSpan`, together with the Smith basis equation
  and nonzero coefficients: FreeModule/Finite/Quotient.lean:37–77 and
  FreeModule/PID.lean:576–641. These are PID-generic.
- `cardQuot_pow_of_prime`, in the root namespace, and
  `Submodule.cardQuot_apply): Ideal/Norm/AbsNorm.lean:52–85,112–180.
  The prime ideal is nonzero; the consumer supplies a finite residue field.
- `IsDiscreteValuationRing.eq_unit_mul_pow_irreducible):
  DiscreteValuationRing/Basic.lean:320–344.
- `DoubleCoset.eq): GroupTheory/DoubleCoset.lean:73–126. The whole file
  was read; the carrier is `DoubleCoset.Quotient`, not a newly bundled
  adelic quotient.
- `MulAction.index_stabilizer): GroupTheory/Index.lean:891–900.
  It works for infinite groups; finiteness of the orbit is proved first.

The compared Tau Ceti statement
`HeckeCoset.degree_eq_relIndex`, NumberTheory/HeckeRing/Basic.lean:530,
was read at `f790474821cf4256814db967cb154e7af3d0c369`. It counts cosets
inside one Hecke double coset, not the coarse fiber after changing the
right level and retaining a left subgroup. It is not a substitute for S4.

Scoped pinned-library and atlas/packet/decomposition searches found no
exact implementation of the seven new assembly endpoints. A live read-only
Mathlib PR search for “double coset” found, among others,
[#43327](https://github.com/leanprover-community/mathlib4/pull/43327),
[#43328](https://github.com/leanprover-community/mathlib4/pull/43328) and
[#41253](https://github.com/leanprover-community/mathlib4/pull/41253);
their descriptions were read. These develop Hecke left-decompositions and
finiteness, reinforce using the existing quotient carrier, and are not
pinned-baseline suppliers for this job. The open-PR DVR search and a public
Zulip search did not identify the exact requested assembly; this is a
limited search, not an absence proof. Build the specified Tau Ceti adapter
on the existing API, not an upstream-PR prerequisite.

## S1. Finite-DVR determinant index

Let O be a DVR with fraction field K, uniformizer π, normalized valuation v
and finite residue field k of size q. Let T span W over K and be finite free
over O. If F is a K-linear automorphism with F(T)⊆T, then

`F⁻¹T/T ≃ T/FT; [x]↦[Fx]; #T/FT=q^{v(det_K F)}.`

The first equivalence is literal: changing x by T changes Fx by FT, and
the inverse takes y to F⁻¹y. For the cardinality, apply the pinned Smith
quotient equivalence to FT≤T. Its nonzero coefficients have form
u_iπ^{a_i}, with a_i≥0. Their principal ideals are the a_i-th powers of
the maximal ideal, whose quotient cardinalities are q^{a_i}. They are
finite: the positive Nat.card formula excludes the infinite case.
The product quotient has cardinality q^{Σa_i}.

To identify the exponent, a basis of T carried by F is a basis of FT.
The Smith basis of FT differs from it by an invertible O-matrix. The top
Smith basis differs from the chosen basis of T by another invertible
O-matrix. Their determinants are units, so v(det F)=Σa_i. The determinant
may equally be computed after scalar extension to W; basis invariance and
scalar extension are ordinary matrix determinant identities. Rank zero
gives the empty product 1. An invertible map with unit determinant gives
FT=T. The zero map on positive rank is excluded.

This is a missing assembly lemma, not a claim that the Z-only determinant
index theorem generalizes by changing its name. It supplies the exact
finite index used in S2 and also the finite-DVR steps isolated in L1/L5.
Suggested home: `TauCeti/LinearAlgebra/Lattice/DVRIndex.lean`, consuming
the existing submodule/basis/quotient API. No Lean file is part of this job.

## S2. Count a fixed successive profile, not intersections with summands

Work over K=Q_ℓ and O=Z_ℓ. Let γ be semisimple with distinct irreducible
monic integral factors f_i and multiplicities n_i. Write
V=⊕V_i, V_i=F_i^{n_i}, F_i=K[X]/f_i; set

`δ_i=v_ℓ disc(f_i); ρ_{ij}=v_ℓ Res(f_i,f_j).`

Fix an order of the blocks and set V_{≤i}=⊕_{j≤i}V_j.
For a full γ-stable lattice M, its successive profile is

`U_i=pr_i(M∩V_{≤i})⊂V_i.`

Each U_i is a full stable lattice. It is the image of the intersection with
the prefix, not M∩V_i. This distinction is the existing `flag-fiber`
definition's point; no second profile carrier is needed.

For fixed prefix lattice L⊂V_{<i} and fixed U_i, all lattices extending them
are graphs of O-linear maps U_i→V_{<i}/L. Because U_i is O-free, choose
lifts of a basis and extend K-linearly. Thus this Hom group is

`W/T; W=Hom_K(V_i,V_{<i}); T=Hom_O(U_i,L).`

The split γ-action gives the Sylvester map
F(t)=γ_{<i}t−tγ_i. It preserves T. Its K-kernel is zero because the two
spectra are disjoint, hence it is invertible. A graph is γ-stable exactly
when its class lies in ker(F:W/T→W/T)=F⁻¹T/T. There is no quotient by a
nonzero rational commuting shear at this step. Such shears matter inside
repeated blocks in L5, not between distinct irreducible factors here.

S1 gives the cardinality ℓ^{v(det F)}. Over a splitting field, the
eigenvalues of F are differences of eigenvalues in the prefix and the new
block. Consequently

`v(det F)=Σ_{j<i} n_j n_i ρ_{ji}.`

The determinant is computed on the ambient K-space, so this exponent does
not depend on the particular prefix lattice L or its basis. Induction on
the number of blocks proves the exact raw profile count

`#{M with successive profile (U_i)}=ℓ^{Σ_{i<j}n_i n_jρ_{ij}}.`

This expands the already present `yun-resultant-fiber` item, rather than
adding a duplicate theorem. Yun's global setup uses regular semisimple
elements. The displayed proof separately checks that the invertible
Sylvester calculation permits repeated multiplicities within each block;
it does not apply a regular-semisimple theorem outside its hypotheses.
The signs of resultants disappear under valuation, and each unordered
pair occurs once. All factors and cross resultants are nonzero integral
elements, so every displayed valuation is nonnegative.

Acceptance: γ=diag(0,0,ℓ^t), with rank-two and rank-one standard graded
lattices, gives ℓ^{2t} raw extensions. For three rank-one blocks 0,2,4
over Q₂, the valuations are 1,2,1 and the total is 16; the prefix Sylvester
matrix need not stay diagonal in a lattice basis. Replacing projected
quotients with coordinate intersections fails to describe these graphs.

## S3. Non-isotypic stabilizer bound

Put R_i=O[θ_i] and S_i=O_{F_i}. Normalize each U_i separately by the
inherited saturation-normalization theorem:

`R_i^{n_i}⊆U_i⊆S_i^{n_i}; S_iU_i=S_i^{n_i}.`

A block-diagonal centralizer element makes all these normalizations
simultaneously. This does not say the whole M lies in the direct sum of
these normalized graded lattices. Let H_i=GL_{n_i}(S_i) and H=∏H_i.

First, any element stabilizing M preserves every prefix V_{≤i}, hence its
intersection with M and the quotient U_i. It also preserves S_iU_i.
Therefore Stab_{Z_γ(K)}(M)⊆H. The relevant compact level is the one from
the **graded saturations**, not an unexplained normalization of SM.

Second, there is an equivariant map

`H·M → ∏_i H_i·U_i.`

L9 bounds each factor by ℓ^{n_i²δ_i}. Its congruence kernel argument also
handles δ_i=0. Thus the profile image has at most
ℓ^{Σn_i²δ_i} elements. For each profile, S2 bounds the subset belonging to
H·M by the number of all lattices with that profile. Multiplication gives

`#(H·M) ≤ ℓ^E; E=Σ_i n_i²δ_i+Σ_{i<j}n_i n_jρ_{ij}.`

This proves the orbit finite. Now apply the pinned `index_stabilizer`,
not a finite-group formula: H itself is generally infinite. With
Δ=Σn_i²δ_i+2Σ_{i<j}n_i n_jρ_{ij}, nonnegative valuations give E≤Δ.
Conjugating back yields the new `nonisotypic-stabilizer-bound` item.

This avoids the unnecessary extra multiplicity introduced by applying a
single global conductor to all matrix entries. It proves a new coarse
bound; it does not repair the printed p.12 map by pretending it is
well-defined. The literal `stabilizer-depth-source` remains withheld.
No sharp global asymptotic constant follows just from S3.

## S4. Nested double-coset levels retain the left stabilizer

For any group G, subgroups H,K and K'≤K, use Mathlib's double-coset carrier.
The map π:H\G/K'→H\G/K sends [g] to [g]. The representative criterion
`DoubleCoset.eq` proves it well-defined.

For a fixed coarse class [g], map the left coset set K/K' to its fiber by
kK'↦[gk]. If k₂=k₁s for s∈K', the two fine double cosets agree.
For surjectivity, [x] lies over [g] exactly when x=h g k for some h∈H,k∈K;
then [x]=[gk] at the fine level. K' need not be normal. The map is a map
of sets, not a homomorphism of quotient groups.

If N=[K:K'] is finite, each fiber has at most N elements. If H\G/K has
h elements, the fine quotient is a finite dependent sum of fibers and has
at most Nh elements. It is generally wrong to replace either bound by an
equality. With H=G every fiber is a singleton for any N. With H=1 the
fiber bound is attained. No neatness, freeness, discrete action, finite G,
or Haar measure is assumed.

The one new construction has an explicit API in JSON: representative
formula, surjectivity, fiber surjection, identity/composition of level
maps, and coset compatibility. Its four tests include a nonnormal
transposition subgroup of S₃. Build in the existing AA.4 direction,
suggested home
`TauCeti/NumberTheory/AdelicAlgebraicGroups/LevelMaps/DoubleCoset.lean`.
The theorem counting its fibers is a separate endpoint.

## S5. Conjugate levels and finite-support products

Two further group-theoretic adapters prevent silent global assumptions.

If K_a=aKa⁻¹, the map H\G/K_a→H\G/K is [g]↦[ga], with inverse
[x]↦[xa⁻¹]. Indeed g'=h g(a k a⁻¹) implies g'a=h(ga)k.
No rationality or normalization of H is imposed on a. Conjugating g itself
would change the left subgroup and would be a different statement.

For S_v≤H_v with S_v=H_v outside a finite set B, the coset set
(∏H_v)/(∏S_v) is equivalent to ∏_{v∈B}H_v/S_v. Equality on the right
means coordinatewise subgroup membership, exactly equality on the left.
Choose representatives at the finitely many exceptional places and fill
all other coordinates with identity for the inverse. Consequently the
index is the finite product of the local indices. No normality is used.
In a restricted-product group, verify that these product subgroups really
embed in the specified ambient group before using the statement.

Both adapters belong to AA.4 for this consumer; neither constructs a new
adele ring. Infinitely many proper local subgroups are excluded. A bare
collection of locally conjugate compact levels does not yet produce an
adelic conjugating element: the integrality/restricted-product condition
must be checked.

## S6. Conditional global counting, with arithmetic inputs still visible

Let G_f act on X and let Γ≤G_f. Suppose there are at most D_*² G_f-orbits,
as the local-orbit bound L8 would supply after the group identifications.
For each representative M, suppose

- Stab(M)=∏S_{M,ℓ} is contained in K_M=∏H_{M,ℓ};
- S_{M,ℓ}=H_{M,ℓ} outside finitely many primes and the product of local
  indices is at most D_*;
- K_M=a_M K₀a_M⁻¹ for a_M∈G_f and a fixed K₀;
- h=#(Γ\G_f/K₀) is finite.

Within one transitive orbit the rational-orbit set is
Γ\G_f/Stab(M): represent a point by gM, and equality modulo Γ is exactly
the double-coset relation. S4 bounds its cardinality by D_* times the
coarse class-set size at K_M. S5 identifies that coarse set with the one
at K₀. Summing over the at most D_*² orbits gives

`#(Γ\X)≤D_*³ h.`

For the semisimple Weil polynomial data of L8, the product of ℓ^{Δ_ℓ}
is the positive integer D_* formed from the ordered unequal root
occurrences, with multiplicities. S3 gives each local index at most
ℓ^{E_ℓ}≤ℓ^{Δ_ℓ}. When the finite-support and ambient-group assumptions
above have been verified, the product bound follows, and

`#(Γ\X)≤(2√p)^{3m(m−1)}h; m=2g.`

This is a conditional mathematical endpoint, not a hypothesis field
asserting the desired conclusion. The actual missing producer contracts
remain `marked-quasi-isogeny`, `forget-marking`,
`prime-p-centralizer`, `adelic-class-set` and
`nonabelian-class-comparison`, with the original classification references
listed in prerequisites. They must establish the action identification,
semisimple local centralizers, product stabilizers, finite-support
conjugacy and finite class-set comparison. At p the prime-field F,V
adapter is required; this is not a statement for arbitrary F_{p^r}.

No strong approximation or reduced-norm class-number identification was
used in the abstract proof. In particular h is not silently replaced by a
product of wide class numbers. The real-Weil/quaternionic rank-one
exception and narrow-class issues in G5 remain. Even D_*=1 leaves h
rational classes, not necessarily one. The Part II brief now names this
conditional bound and its exact supplier obligations; it does not adopt
the source's disputed numerical coefficient.

## S7. Diagnostics and remaining work

The standard-library Python below ran successfully with 47,689 exact
cases: 384 DVR cokernels; 11 flag fibers; 48 stable graph lattices; four
profile counts; nine unequal-block fibers; 135 unequal-block compact
orbit models; 136 double-coset fibers; 90 total bounds; 216 conjugate-level
comparisons; 46,656 exponent inequalities. These are diagnostics of the
written formulas, not proofs or Lean tests. The S₃ test enumerates every
subgroup triple K'≤K and retains H; the lattice test uses exact fractions.

The determinant/index and general non-isotypic steps now have concrete
mathematical proof plans. G2 is narrower, not closed: local type adapters
and the arithmetic identification/finite-support suppliers remain.
G0/G1 and G3–G8 remain unchanged. The report deliberately preserves the
earlier statements of what was unresolved **at the earlier checkpoint**
below; the current S1–S6 supplement and JSON verification describe what
this claim adds.

The source checker, intake checker (three files, zero problems),
preservation/routing/API/DAG checks and all 48 checker/intake regression
tests pass at publication snapshot
`d546d126d455b9add0ac32d9cb30b5ff488dece7`. No Lean
file was written or compiled. Independent review is still required.

```python
from fractions import Fraction as Q
from itertools import product, permutations
from math import gcd

checks = {}

def record(k):
    checks[k] = checks.get(k, 0) + 1

def vp(a, p):
    assert a
    n = 0
    while a % p == 0:
        a //= p
        n += 1
    return n

def matmul(a, b):
    return [[sum(x*y for x, y in zip(row, col)) for col in zip(*b)] for row in a]

def inv(a):
    n = len(a)
    b = [[Q(x) for x in row] + [Q(i == j) for j in range(n)] for i, row in enumerate(a)]
    for i in range(n):
        r = next(r for r in range(i, n) if b[r][i])
        b[i], b[r] = b[r], b[i]
        d = b[i][i]
        b[i] = [x/d for x in b[i]]
        for r in range(n):
            if r != i:
                d = b[r][i]
                b[r] = [x-d*y for x, y in zip(b[r], b[i])]
    return [r[n:] for r in b]

def integral(a):
    return all(x.denominator == 1 for row in a for x in row)

# Exhaustive nonsingular two-dimensional DVR cokernels modulo p^N.
# N exceeds the determinant valuation, hence all Smith factors fit.
for p in (2, 3):
    for entries in product(range(4), repeat=4):
        a, b, c, d = entries
        det = a*d-b*c
        if not det:
            continue
        v = vp(abs(det), p)
        modulus = p**(v+1)
        image = {( (a*x+b*y) % modulus, (c*x+d*y) % modulus)
                 for x, y in product(range(modulus), repeat=2)}
        assert modulus**2 // len(image) == p**v
        record('dvr_cokernel')

# Successive graded profiles are Z_p, not coordinate intersections.
# In the prefix basis the Sylvester matrix need not be diagonal.
for p, eigen in ((2, (0, 2, 4)), (3, (0, 3, 6)), (2, (0, 1, 2)), (3, (0, 1, 3))):
    lattices = [[[Q(1)]]]
    for i in range(1, len(eigen)):
        v = sum(vp(abs(eigen[j]-eigen[i]), p) for j in range(i))
        modulus = p**v
        next_lattices = []
        for basis in lattices:
            f = [[Q((eigen[j]-eigen[i]) if j == k else 0) for k in range(i)] for j in range(i)]
            sylvester = matmul(matmul(inv(basis), f), basis)
            fibers = []
            for numer in product(range(modulus), repeat=i):
                w = [[Q(t, modulus)] for t in numer]
                if integral(matmul(sylvester, w)):
                    col = matmul(basis, w)
                    extended = [row+[col[j][0]] for j, row in enumerate(basis)] + [[Q(0)]*i+[Q(1)]]
                    fibers.append(extended)
            assert len(fibers) == p**v
            next_lattices.extend(fibers)
            record('flag_fiber')
        lattices = next_lattices
    exponent = sum(vp(abs(a-b), p) for j, a in enumerate(eigen) for b in eigen[j+1:])
    assert len(lattices) == p**exponent
    gamma = [[Q(eigen[j] if j == k else 0) for k in range(3)] for j in range(3)]
    for basis in lattices:
        assert integral(matmul(matmul(inv(basis), gamma), basis))
        record('flag_stability')
    record('profile_count')

# Unequal repeated multiplicities: rank-two scalar block against rank one.
for p in (2, 3, 5):
    for t in range(3):
        modulus = p**t
        fibers = list(product(range(modulus), repeat=2))
        assert len(fibers) == p**(2*t)
        # GL_2(Z/p^t) x GL_1 acts on these graph parameters. For t>0,
        # count the orbit of (1,0) directly; its stabilizer is not discarded.
        if t and modulus <= 9:
            units = [u for u in range(modulus) if gcd(u, modulus) == 1]
            matrices = [a for a in product(range(modulus), repeat=4)
                        if gcd(a[0]*a[3]-a[1]*a[2], modulus) == 1]
            for z in fibers:
                orbit = {((a[0]*z[0]+a[1]*z[1])*pow(u, -1, modulus) % modulus,
                          (a[2]*z[0]+a[3]*z[1])*pow(u, -1, modulus) % modulus)
                         for a in matrices for u in units}
                stab = sum(((a[0]*z[0]+a[1]*z[1]-u*z[0]) % modulus == 0 and
                            (a[2]*z[0]+a[3]*z[1]-u*z[1]) % modulus == 0)
                           for a in matrices for u in units)
                assert len(matrices)*len(units) == len(orbit)*stab
                assert len(orbit) <= p**(2*t)
                record('unequal_block_orbit')
        record('unequal_block_fiber')

# Infinite compact groups are not enumerated here: these are finite models.
def mul(a, b):
    return tuple(a[i] for i in b)

def inverse(a):
    return tuple(a.index(i) for i in range(len(a)))

g = set(permutations(range(3)))
identity = tuple(range(3))
subgroups = []
gl = sorted(g)
for mask in range(1 << len(gl)):
    h = {x for i, x in enumerate(gl) if mask >> i & 1}
    if identity in h and all(mul(x, y) in h for x in h for y in h):
        subgroups.append(h)

def dc(h, k, x):
    return frozenset(mul(mul(a, x), b) for a in h for b in k)

def classes(h, k):
    return {dc(h, k, x) for x in g}

strict = 0
for h, k, small in product(subgroups, repeat=3):
    if not small <= k:
        continue
    large_classes, small_classes = classes(h, k), classes(h, small)
    index = len(k)//len(small)
    for cls in large_classes:
        fiber = {c for c in small_classes if c <= cls}
        x = next(iter(cls))
        image = {dc(h, small, mul(x, a)) for a in k}
        assert fiber == image and 1 <= len(fiber) <= index
        strict += len(fiber) < index
        record('double_coset_fiber')
    assert len(small_classes) <= index*len(large_classes)
    record('double_coset_total')
assert strict > 0
assert len(classes(g, {identity})) == 1 < len(g)
for h, k in product(subgroups, repeat=2):
    for a in g:
        ka = {mul(mul(a, x), inverse(a)) for x in k}
        images = []
        for cls in classes(h, ka):
            image = {dc(h, k, mul(x, a)) for x in cls}
            assert len(image) == 1
            images.extend(image)
        assert set(images) == classes(h, k) and len(images) == len(set(images))
        record('conjugate_level')

for n1, n2, n3 in product(range(1, 5), repeat=3):
    for d1, d2, d3, r12, r13, r23 in product(range(3), repeat=6):
        diagonal = n1*n1*d1+n2*n2*d2+n3*n3*d3
        cross = n1*n2*r12+n1*n3*r13+n2*n3*r23
        assert diagonal+cross <= diagonal+2*cross
        record('stabilizer_exponent')

print(checks)
print('PASS', sum(checks.values()), 'exact diagnostic cases; not proofs or Lean tests')
```

---

## Historical report through PR #1848 (unchanged)

# Lipnowski–Tsimerman: local-counting continuation


## Continuation by codex-a71f92 — 22 September 2026

Refs #1332. This continues, rather than independently reviews, PR #1652.
Current totals: **124 items: 11 library, 26 planned, 87 missing**. The ten
existing routes take 68 missing and 25 planned items; all 19 withheld items
stay withheld. There are 37 unchanged definition/construction API/test
blocks, eight new theorem plans, three generic library imports and 24
selected prerequisite edges. This is not a complete DAG or formalization.

### Evidence, imports and ownership

Freshly read all 38 pages of [v1](https://arxiv.org/pdf/1511.02212v1), including
the bibliography, and inspected page images 9, 10 and 12. Freshly read
selected [Yun v2](https://arxiv.org/pdf/1303.2420v2) sections: §§1–2.2,
4.1–4.7 (4.7 only partly), 4.8–4.14, including complete proofs of Lemma 4.9
and Proposition 4.13. This is not a whole-Yun reading. The source hashes are
unchanged. Conrad and the original eight library checks remain attributed
to PR #1652, not claimed as fresh reading.

A fresh request to the [journal DOI](https://doi.org/10.1215/00127094-2018-0029)
and canonical publisher download still did not obtain the final PDF.
Authors' pages still link v1. **G0 remains open**; 38 versus 51 pages does
not establish a mathematical change. The 17 sourceIssues record predecessor
findings and selected G2 rechecks, all version-qualified. “new” means only
that no correction was located in the limited listed search, not priority
or an allegation about the unavailable final text. No independent-review
verdict is added.

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 the actual statements,
proofs and relevant standing hypotheses were read for:

- traceForm_dualSubmodule_adjoin, Submodule.traceDual and
  Submodule.traceDual_span_of_basis, in
  Mathlib/RingTheory/DedekindDomain/Different.lean, especially 57–112 and
  592–631. The integrally closed hypothesis is on the base ring, not the
  order. Module.Basis.traceDual_powerBasis_eq in Trace/Basic.lean:610 was
  also read as compatible basis evidence, not counted as another item.
- HenselianRing.is_henselian and IsAdicComplete.henselianRing, in
  Mathlib/RingTheory/Henselian.lean:88–178.
- IsLocalRing.length_restrictScalars, in
  Mathlib/RingTheory/LocalRing/Length.lean:54–81. This is an extended-natural
  length identity; finite-length/residue-degree conversions remain needed.

The inspected Submodule.natAbs_det_basis_change is over **Z**, not a general
finite-residue DVR; it is not claimed to close the local index adapter.
GN.2/GN.3 reviewed coverage rows were read at blob
5e708cfc74a51b10e62149113872fe4e00eb5846 and the owner description checked.
Library searches did not locate the exact local-order counting endpoints;
this is bounded evidence, not proof that generic ingredients are absent.
GN.2 takes the coefficient-DVR, conductor and isotypic stabilizer adapters;
GN.3 takes local counting. No new carrier, definition or roadmap is
introduced; the existing finite-field Part II is unchanged.

### L1. Ordinary trace dual and the conductor

Let O=Z_ell, K=Q_ell, F=K(theta), R=O[theta], S=O_F,
f=minpoly_K(theta) monic integral irreducible, beta=f'(theta), and
delta=v_ell(disc f). Characteristic zero gives separability. Use the ordinary
field trace, not Yun's modified pairing without its scaling.

The pinned identity gives R^vee=beta^(-1)R. Traces of integral elements are
integral, so S⊆R^vee and beta S⊆R. The determinant of multiplication by beta
is Norm(beta)=±disc(f), hence #S/beta S=ell^delta and length_O(S/R)≤delta.
For R⊆M⊆S, N=beta M^vee is an R-ideal in R, and

    length_O(R/N)=length_O(R^vee/M^vee)=length_O(M/R)≤delta.

Dual bases or the Smith factors of the inclusion prove the middle equality.
N represents the **dual homothety class**, not necessarily M's own class.
Trace duality is an involution on full-lattice homothety classes.

The mathematical DVR calculation used here and in L5 is explicit:
diagonalize an injective equal-rank free-lattice map with factors pi^a_i.
Its quotient has length sum a_i, cardinality Q^(sum a_i), and determinant
valuation sum a_i. The exact pinned finite-DVR adapter remains unmatched;
the Z-only cardinality theorem is not a substitute.

### L2. Correct residue field

The finite O-algebra R is complete and local: otherwise a coprime
factorization modulo ell would lift, contradicting irreducibility of f.
Write k_R=F_(ell^s), not necessarily F_ell. Lift the separable irreducible
polynomial of the residue of theta to a monic polynomial h over O.
Hensel lifting in R gives w≡theta with h(w)=0. Then O_0=O[w] is the
unramified coefficient DVR with residue k_R. Put t=theta−w∈rad R.

We have R=O_0[t]. The radical and ell-adic topologies on this finite local
algebra agree, so t is topologically nilpotent; continuous evaluation gives
O_0[[T]]→R, T↦t, surjectively already on polynomials. This includes t=0.
For a finite R-module A, scalar restriction gives

    length_O(A)=s·length_(O_0)(A).

A colength bound delta becomes floor(delta/s). We do not assert a quotient
of Z_ell[[T]] for s>1. The generic Hensel theorem supplies lifting, not the
whole coefficient-DVR and topological evaluation construction; those
adapters remain planned.

### L3. Weighted partitions, including zero

For Q=#k_R, Yun Proposition 4.13 counts ideals of colength j in O_0[[T]] by
H_Q(j)=sum_(lambda partition of j) Q^(j−length(lambda)).
H_Q(0)=1. For j≥1, inject partitions into ordered compositions by retaining
their nonincreasing order. There are binom(j−1,k−1) compositions of length k,
so

    H_Q(j)≤sum_(k=1)^j binom(j−1,k−1)Q^(j−k)=(Q+1)^(j−1).
    sum_(j=0)^a H_Q(j)≤1+((Q+1)^a−1)/Q≤(Q+1)^a≤Q^(2a).

Pullback injects R-ideals into power-series ideals without changing
O_0-colength. With Q=ell^s and a=floor(delta/s), there are at most
ell^(2delta) R-ideals of O-colength ≤delta. At delta=0 the candidate is R.
No false weak-composition bound from LT (13) is used.

### L4. Rank-one classes

Scale M⊂F so SM=S. Some element of M is an S-unit; divide by it to arrange
R⊆M⊆S. L1 sends the dual class to a small-colength ideal. Duality permutes
homothety classes, so

    C_1 := #(F^× \ {full R-lattices in F}) ≤ ell^(2delta).

For later flag quotients choose trace duals of the finite list of small
ideals as representatives. The factor beta is only a scalar. Claiming the
small ideals directly represent the original classes would omit the
duality step.

### L5. Refine the existing extension-determinant node

Fix gamma-stable U_i⊂V_i. Put W=Hom_K(V_2,V_1),
M=Hom_O(U_2,U_1), F(T)=gamma_1 T−T gamma_2.
An O-splitting identifies graph extensions with ker(F:W/M→W/M);
changing the splitting changes T by M. Rational commuting shears translate
by ker(F:W→W). The snake sequence identifies the quotient with
ker(M/FM→W/FW).

Semisimplicity gives W=ker F⊕W', W'=im F. For M'=M∩W',

    FM'⊆FM⊆M',  ker(M/FM→W/FW)=M'/FM.

There is a **surjection** M'/FM'→M'/FM, not the printed inclusion.
The lattice M' is full in W' and F is invertible there. The index calculation
in L1 bounds the shear quotient by ell^(v_ell det(F|W')).

For V_1=F^(i−1), V_2=F, the nonzero differences of distinct roots of f each
occur i−1 times, giving valuation (i−1)delta. Equal-root directions are
removed by commuting shears, not counted as finite raw graph fibers.
This is added to the existing item, not duplicated as a new theorem.

### L6. Repeated blocks

Use the standard F-coordinate flag in F^n. A block-diagonal
GL_(n−1)(F)×F^× element normalizes the intersection and projected quotient
to their finite orbit lists. L5 bounds the shear orbits for each pair by
ell^((n−1)delta). Parabolic orbits surject onto full centralizer orbits:

    C_n≤C_(n−1)C_1 ell^((n−1)delta)
       ≤ell^((n(n−1)/2+2n)delta)≤ell^(2n²delta), n≥1.

At delta=0 the bound is one. This **quadratic** multiplicity replacement
does not prove the printed linear ell^(4n delta) bound.
The original local-orbit-source item stays withheld.

### L7. Distinct isotypic factors

Write charpoly(gamma)=product_i f_i^n_i,
delta_i=v_ell disc(f_i), rho_ij=v_ell Res(f_i,f_j).
Across distinct isotypic summands the Sylvester operator is invertible;
its determinant contributes n_i n_j rho_ij once per unordered pair.
This reproves Yun's graph-fiber argument using full repeated characteristic
polynomials, not its regular-semisimple statement beyond its hypotheses.

Combining with L6 gives

    C_gamma≤ell^[sum_i (n_i(n_i−1)/2+2n_i)delta_i
                  +sum_(i<j)n_i n_j rho_ij]≤ell^(2Delta),
    Delta=sum_i n_i²delta_i+2sum_(i<j)n_i n_j rho_ij.

Delta is the valuation of the product of **ordered unequal-root
differences with multiplicities**. Valuations are nonnegative.
The ordinary discriminant vanishes for repeated roots and is not used.

### L8. Only the adelic local-orbit factor

For a monic integral polynomial of degree m whose roots have modulus
sqrt(p), the product of ordered unequal-root differences is nonzero,
integral and Galois invariant. Its absolute value D_* is a positive
integer with v_ell(D_*)=Delta_ell. All but finitely many local counts are one:

    product_ell C_(gamma,ell)≤D_*²≤(2sqrt(p))^(2m(m−1)).

For m=2g this is (2sqrt(p))^(4g(2g−1))=exp(O_p(g²)).
This bounds only the restricted-product **local centralizer orbit** factor.
It is not the rational adelic class-set count or the global abelian-variety
count. The application uses the inherited prime-field F,V reduction;
semilinear centralizers over nonprime fields are not covered.

### L9. Isotypic stabilizer by a congruence kernel

Normalize R^n⊆M⊆S^n by choosing an S-basis from M after saturation;
the images of an S-generating set span the residue vector space.
Stab(M)⊆GL_n(S) because SM=S^n. For
g∈ker(GL_n(S)→GL_n(S/beta S)),

    (g−1)M⊆beta S^n⊆R^n⊆M.

The same holds for g^(-1), so gM=M. Bounding the finite reduction image by
all matrices gives

    [GL_n(S):Stab(M)]≤#(S/beta S)^(n²)=ell^(n²delta).

At delta=0 the whole group stabilizes M; no positive-colength hypothesis is
hidden. This avoids the ill-defined p.12 orbit map: for ell=3,
F=Q_3(i), R=Z_3[3i], M=S=Z_3[i], the units **1 and −1 in R** give the
same orbit point but maps evaluated at i differ by 2i modulo R.
The target exists since S⊆R^vee. Using i as the group element would fail
the printed GL_1(R) hypothesis, so that is not the example used.

Only the isotypic case is proved here. In general, a blockwise
minimal-polynomial conductor may introduce n_i²-weighted cross-resultants
and lose the desired O(g²) exponent. A compatible sharper flag/stabilizer
bound and rational class-set glue remain required for (20). G2 stays partial.

### Validation and remaining gaps

The embedded standard-library Python was run: 176 weighted-partition tests,
992 residue-degree cases, 6144 multiplicity/resultant cases, 28 exact
trace-dual examples, all 6561 matrices over F_9 (5760 invertible, stabilizer
48, orbit 120), the unit-of-R counterexample and 30 finite shear cases.
These are regressions, not proofs for arbitrary fields or dimensions.

G0–G8 and the 19 original withheld claims remain, with G2 narrowed by L1–L9.
The final journal comparison, full mass theorem, quaternionic scope,
enhanced limiting law and original external supplier proofs are not closed.
No Lean file was requested, written or compiled. The paper schema and three-file intake checks pass against the complete
catalogue (3 files, 0 problems). Preservation checks retain all 113 original
IDs/statuses/statements, original routes, 37 API/test blocks, all 19 withheld
items and the historical report/handoff. The 24 selected edges have known
endpoints and are acyclic; no local paths were found. Publication was
rebased by API onto fresh snapshot 5db325c698954f89a2b5c8524b297ce8fb066399;
relevant protocols and GN coverage/description hashes are unchanged.

### Reproducible finite checks

```python
"""Finite regression checks for the LT18 local replacement; not proofs."""
from fractions import Fraction as Q
from itertools import product
from math import comb

def partitions(n, largest=None):
    if n == 0:
        yield ()
        return
    largest=min(n, n if largest is None else largest)
    for a in range(largest, 0, -1):
        for rest in partitions(n-a,a):
            yield (a,)+rest

cases=0
for q in (2,3,4,5,8,9,16,25):
    running=1
    for j in range(1,23):
        exact=sum(q**(j-len(lam)) for lam in partitions(j))
        comp=sum(comb(j-1,k-1)*q**(j-k) for k in range(1,j+1))
        assert comp==(q+1)**(j-1)
        assert exact<=comp
        running+=exact
        assert running<=(q+1)**j<=q**(2*j)
        cases+=1
print("PASS:",cases,"weighted partition/composition/cumulative cases; colength zero=1")

residue=0
for ell in (2,3,5,7):
    for s in range(1,9):
        for delta in range(31):
            assert (ell**s+1)**(delta//s)<=ell**(2*delta)
            residue+=1
print("PASS:",residue,"residue-degree/length conversions")

exponents=0
for ni in product(range(1,9),repeat=3):
    for ds in ((0,0,0),(1,1,1),(0,3,2),(7,0,1)):
        for rs in ((0,0,0),(1,2,3),(5,0,7)):
            diag=sum(n*n*d for n,d in zip(ni,ds))
            cross=ni[0]*ni[1]*rs[0]+ni[0]*ni[2]*rs[1]+ni[1]*ni[2]*rs[2]
            refined=sum((n*(n-1)//2+2*n)*d for n,d in zip(ni,ds))+cross
            Delta=diag+2*cross
            assert refined<=2*Delta
            exponents+=1
for n in range(1,101):
    assert sum(range(n))+2*n==n*(n-1)//2+2*n
    assert n*(n-1)//2+2*n<=2*n*n
assert comb(1,1)==1 and 0**1==0  # source composition bound fails at delta=0,n=1
print("PASS:",exponents,"multiplicity/resultant exponent cases and zero-discriminant branch")

def eye(n):
    return [[Q(i==j) for j in range(n)] for i in range(n)]
def mm(A,B):
    return [[sum(a*b for a,b in zip(row,col)) for col in zip(*B)] for row in A]
def det(A):
    a=[list(map(Q,row)) for row in A]
    ans=Q(1)
    for j in range(len(a)):
        k=next((k for k in range(j,len(a)) if a[k][j]),None)
        if k is None:return Q(0)
        if k!=j:a[k],a[j]=a[j],a[k];ans=-ans
        v=a[j][j];ans*=v
        for k in range(j+1,len(a)):
            z=a[k][j]/v
            a[k]=[x-z*y for x,y in zip(a[k],a[j])]
    return ans
def inv(A):
    n=len(A);a=[list(map(Q,row))+e for row,e in zip(A,eye(n))]
    for j in range(n):
        k=next(k for k in range(j,n) if a[k][j])
        a[k],a[j]=a[j],a[k]
        v=a[j][j];a[j]=[x/v for x in a[j]]
        for k in range(n):
            if k!=j:
                z=a[k][j];a[k]=[x-z*y for x,y in zip(a[k],a[j])]
    return [row[n:] for row in a]
dual_cases=0
for r in range(1,8):
    for a in (2,3,5,7):
        # f=X^r-a is Eisenstein, so this is a field order.
        C=[[Q(0) for _ in range(r)] for _ in range(r)]
        for j in range(r-1):C[j+1][j]=1
        C[0][r-1]=a
        powers=[eye(r)]
        for k in range(2*r):
            powers.append(mm(powers[-1],C))
        tr=[sum(M[i][i] for i in range(r)) for M in powers]
        G=[[tr[i+j] for j in range(r)] for i in range(r)]
        assert det(G)
        D=[[r*x for x in row] for row in powers[r-1]] # multiplication by f'(theta)
        B=mm(D,inv(G))
        assert all(x.denominator==1 for row in B for x in row)
        assert abs(det(B))==1
        assert abs(det(D))==abs(det(G))
        assert mm(G,inv(G))==eye(r)
        dual_cases+=1
print("PASS:",dual_cases,"exact trace-dual/codifferent and norm-discriminant cases")

# F_9 = F_3[i], i^2=-1; coordinate subspace F_3^2 in F_9^2.
def add(x,y):return ((x%3+y%3)%3)+3*((x//3+y//3)%3)
def neg(x):return (-x%3)+3*((-(x//3))%3)
def mul(x,y):
    a,b=x%3,x//3;c,d=y%3,y//3
    return ((a*c-b*d)%3)+3*((a*d+b*c)%3)
gl=stab=0
for a,b,c,d in product(range(9),repeat=4):
    determinant=add(mul(a,d),neg(mul(b,c)))
    if determinant:
        gl+=1
        if all(x<3 for x in (a,b,c,d)):stab+=1
assert (gl,stab)==(5760,48)
assert gl//stab==120<=3**8
print("PASS: GL2(F9)=5760, F3-plane stabilizer=48, orbit=120 <= 3^8")

# In R=Z_3[3i] subset S=Z_3[i], both 1 and -1 are R-units.
# They give the same orbit point S, but at m=i the maps modulo R differ.
assert (2 % 3) != 0  # 2i is not in R; reduction detects its i coefficient.
assert mul(2, 2) == 1  # -1 is a unit even in the smaller residue field F_3.
print("PASS: the orbit-map counterexample uses two units of R, not merely of S")

# Repeated eigenvalues are quotiented by commuting shears, not counted as finite raw fibers.
shears=0
for ell,s,eigs in product((2,3),(1,2,3),((0,0),(0,1),(1,1),(0,2),(1,3))):
    mod=ell**s
    differences=[a-b for a in eigs for b in eigs]
    zero_count=differences.count(0)
    # Product of independent one-coordinate kernel counts over Z/ell^s.
    kernel=1;valuation=0
    for d in differences:
        kernel*=sum(d*x%mod==0 for x in range(mod))
        if d:
            dd=abs(d);v=0
            while dd%ell==0:dd//=ell;v+=1
            valuation+=v
    quotient=kernel//mod**zero_count
    assert quotient<=ell**valuation
    shears+=1
print("PASS:",shears,"finite Sylvester-kernel/shear-quotient tests")
```

---

## Historical report from PR #1652 (unchanged)

# Lipnowski–Tsimerman: finite-field abelian-variety counts

Partial checkpoint by **Codex — codex-c83e7a**, 21 September 2026. Refs #1332.

This is a source-qualified extraction and routing proposal, not a formalization. It records 113 items: 8 library imports, 26 planned imports and 79 missing items. Ten routes assign 60 missing items and 25 planned source items without duplication. The remaining 19 missing items are explicitly withheld. All 37 definitions/constructions have a consumer-derived API and at least three discriminating acceptance tests in the JSON.

## What was read

The [public preprint](https://arxiv.org/pdf/1511.02212v1), dated 6 November 2015, was read completely: all 38 pages, §§0–5.7.3 and the bibliography. Both [Tsimerman's page](https://www.math.toronto.edu/jacobt/) and [Lipnowski's page](https://sites.google.com/site/michaellipnowski/) point to this version. Crossref identifies the [published article](https://doi.org/10.1215/00127094-2018-0029) as Duke Math. J. 167(18) (2018), 3403–3453, hence 51 pages. **No match between the preprint and the final text has been established.** The canonical publisher full-text and download links returned security-check HTML, not a PDF. The differences below are findings about the public v1 only.

The supplementary primary reading is [Conrad, *Polarizations*](https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf), all ten pages, and [Yun, *Orbital integrals and Dedekind zeta functions*, v2](https://arxiv.org/abs/1303.2420), introduction and §§1.3–1.5 plus §§4.8–4.13, including the complete proofs of Lemma 4.9 and Proposition 4.13. The rest of Yun is not claimed read. Main-paper pages 5, 10, 15, 18, 27, 30 and 36 were also visually checked to rule out extraction artifacts in the problematic formulas.

Source files were freshly downloaded on 2026-09-21. SHA-256 values and exact access timestamps are in `source.files`:

- https://arxiv.org/pdf/1511.02212: `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`; 38 pages; all 38 pages.
- https://arxiv.org/pdf/1303.2420: `a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347`; 19 pages; selected sections specified above.
- https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf: `7156a718e879f7cc752a460ad61c14dbcfd2978a13149b7024c9809ac487af6b`; 10 pages; all 10 pages.

## The mathematical dependency chain

For fixed prime p, the paper separates the unpolarized count B(p,g) from the principally polarized count A(p,g). Both are unweighted counts of **F_p-isomorphism classes**. Neither is the coarse moduli point count nor the stack mass Σ1/|Aut|. The large difference comes from many inequivalent principal polarizations on a fixed underlying variety.

The unpolarized branch first bounds Frobenius polynomials, hence isogeny classes, then describes each isogeny class by rational orbits on prime-to-p Tate lattices and p-adic Dieudonné lattices. Local centralizer orbits and global adelic class sets give separate factors. The prime-field restriction matters: F and V are Q_p-linear for F_p, whereas nonprime finite fields require semilinear centralizers. Tate-module Frobenius conventions must be compared explicitly with geometric Frobenius on cohomology; purity by itself does not give semisimplicity.

The polarized branch imports duals, the rigidified Poincaré bundle, Mumford's homomorphism, rational Néron–Severi space and Rosati positivity. A fixed principal polarization identifies other principal polarizations with positive integral units modulo Rosati congruence. The model-ring construction then leads to definite hermitian lattices. A mass formula counts all projective classes with automorphism weights; Gram matrices count free classes without weights. The Steinitz/class-group obstruction and the finite automorphism bound are therefore real proof steps.

The statistical branch distinguishes unconditional statements from Conjecture 5.2. The conjecture compares logarithmic polarization counts with model-ring orbit counts only for products of matrix algebras over CM fields. The paper's large elliptic-factor, spacing and enhanced Cohen–Lenstra conclusions require additional checks described below. Definition 5.16's joint limit must exist and be tight before it is a probability measure.

## Source gaps and repairs

**G0 — Final version.** Obtain a legitimate final or author-accepted 2018 version and reconcile all numbered results. A 38-versus-51-page difference can reflect typesetting; it neither proves a mathematical change nor licenses assuming equality. Keep all identifiers stable and record exact changed statements.

**G1 — Polynomial and discriminant constants.** Lemma 2.1 fails literally at g=1,q=2: the five polynomials X²−aX+2 with −2≤a≤2 already exceed 2√2. X²−q also shows why the root-radius condition alone does not force reciprocal coefficients. A checked replacement for reciprocal polynomials is (4g+1)^g q^(g(g+1)/4), obtained from the first g integral power sums, the bound |s_k|≤2gq^(k/2), Newton identities and reciprocity. The resulting isogeny-class logarithmic upper bound retains coefficient 1/4.

The discriminant in (26) is a squared Vandermonde product, giving exponent d(d−1), not binomial(d,2). In (28), powers of 2 raised to multiples of g² cannot be absorbed into o_g(1) when p is fixed. Thus the 17/2 coefficient is not exported. A useful existing substitute is Tau Ceti's h_K≤|D_K|4^[K:Q], which directly gives the coarse exp(O_p(g²)) class-number scale after the corrected discriminant bound; the sharper analytic constants need not be reimplemented for that weaker goal.

**G2 — Local orders and repeated eigenvalues.** Yun Lemma 4.9 counts a fiber with prescribed *flag quotients*, uses full characteristic polynomials in the resultant and counts unordered pairs of blocks once. It does not identify a fiber with fixed intersections in every summand. Yun also makes a residue-field reduction before treating R as a quotient of O[[X]]. For example, an unramified quadratic O_F/Z_ℓ cannot be a quotient of Z_ℓ[[X]], whose unique residue field is F_ℓ. The v1 weak-composition estimate in (13) fails already at δ=0. Dualizing the lattice sandwich, repeated-eigenvalue shear quotients, stabilizer representative choices and multiplicities all remain to close. The statement of Yun for regular semisimple orbital integrals is not a bound for arbitrary repeated blocks without further argument.

**G3 — Polarization normalization.** Conrad Example 2.2 verifies (1,φ_L)*P_A=[2]*L⊗L^(−2), whose NS class is 2[L]. The v1 equality with L is not literal. Its Φ_f=(1/2)f^(−1)φ_L is consistent with D_f(a,1) only after rationalizing NS; Φ_f([L₀])=1/2 and D_f(1,1)=2[L₀]. The principal-polarization orbit map uses f^(−1)λ. Moreover Remark 4.8's unqualified reduced-trace equality fails when End⁰(A)=Q: geometric trace of 1 is 2g and reduced trace is 1. The JSON retains the actual Tate-representation trace and does not copy the incorrect identity.

**G4 — Hermitian masses.** Equation (39)'s displayed factorial product has logarithm (1/2)[K:Q]n²log n+O([K:Q]n²), whereas (51) prints coefficient 1. This is visible in the PDF, and elementary summation checks it. The relative quadratic discriminant also has 4p sin²θ rather than p sin²θ; its O_p(d) logarithmic scale survives. The step (49) from upper bounds for residues to a two-sided bound for their quotient is not justified by those upper bounds alone. Acquire Gan–Yu's actual measure and local-density formula, including its dyadic domain, and the needed analytic estimates before accepting (39), (51), (54)–(56) or the 0.99 threshold. An asymptotic implication also needs an explicit sufficiently-large-g quantifier absorbing uniform O_p(g²) terms.

**G5 — Conditional scope and real Frobenius.** Conjecture 5.2 assumes CM-field endomorphism factors. The real Weil number with field Q(√p) produces the definite quaternionic exception already treated separately in §3.2.2. Corollary 5.13 needs a bound for varieties involving that factor, or an appropriately stated extra hypothesis. Strong approximation also needs its noncompactness hypotheses; at real ramified places reduced norms have positivity restrictions, so the class-set identification must use the correct narrow/norm-image quotient rather than automatically an ordinary class group.

**G6 — Small-prime counterexample.** Over F₂, the smooth curve E: y²+xy=x³+x²+1 has discriminant 1, #E(F₂)=2 and #E(F₄)=8. Both point groups are 2-groups, contradicting the literal v1 Lemma 5.19. Direct enumeration over F₂[t]/(t²+t+1) gives one and seven affine points, respectively. For p≥7 the source argument has a safe repair: the Hasse interval at p contains only the p-power p; trace a=1 then gives #E(F_(p²))=p(p+2), not a p-power. No p=2 conclusion is exported. The final paper may have corrected this; it was not acquired.

**G7 — Statistical normalization and limits.** With 2g cyclic eigenangle gaps, two eigenvalues each repeated h times force at least 2h−2 zero gaps, hence mass at least h/g−1/g, not h/g. State a limiting discrepancy bound in a specified metric. The finite-g matrix laws in Definition 5.16 exist, but the general joint limit and normalization are extra theorems. The odd-prime union bound in Example 5.17 proves a positive liminf, not convergence. Theorem 0.3 retains both “no repeated factors” and “coprime to X²−p”; it does not alone prove that every kind of squarefree isogeny class has negligible probability.

**G8 — Remaining source and extraction closure.** Read the original Tate–Honda and Waterhouse proofs, Jacobowitz's dyadic classification, Gan–Yu, Lang's cone theorem, the analytic residue/regulator estimates, norm-unit/class-group comparison, Serre's finite-group bound and Friedman–Washington. Expand the informal §1 stack/cohomology discussion and its Euler-characteristic suppliers, Remark 2.3's lower bound and the local/global proof interiors into atomic items. The source explicitly says §1 is not used later; an orbifold Euler characteristic must not be used as an ordinary rational Betti-number identity. The general trace-formula owner (upstream PR196, cited by the atlas) needs an exact current stage locator; DWP.7's weight bounds are already a checked planned import. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 has no direct reviewed-audit row at this snapshot, so its absence evidence uses the explicitly cross-referencing A4/A3 reviewed audits plus whole-library searches; this does not pretend that an unaudited packet was reviewed.

## Routes and library evidence

1. **AbelianSchemesAndArithmeticModuli** (source; 15 items). A2 already owns duals, Poincaré bundles, polarizations and Rosati. Add the explicitly normalized NS and orbit dictionary there; use Conrad to repair v1 graph-pullback and rationalization errors.

2. **AbelianSchemesAndArithmeticModuli** (source; 1 items). Tate-module realizations are already an A4 target; finite-field full faithfulness is a separate consumer.

3. **AbelianSchemesAndArithmeticModuli** (source; 6 items). Import the existing field Hom/End carriers and add only the already planned arithmetic, semisimple and Rosati-cone targets.

4. **FiniteFlatGroupsAndIntegralPadicHodgeTheory** (source; 1 items). The existing Dieudonné owner fixes covariance and F,V. A new finite-field application must consume it, not reconstruct it.

5. **GeometryOfNumbersAndQuadraticArithmetic** (source; 13 items). GN.2 explicitly owns integral/hermitian lattices, local invariants, genera and local-global theory. Existing rational Z-lattices and CM fields are reused; O_L-projective lattices and dyadic norm ideals are not already built.

6. **GeometryOfNumbersAndQuadraticArithmetic** (source; 15 items). GN.3 owns arithmetic quotient counts, local densities and mass. Add the checked Yun local inputs and weighted-to-unweighted comparison, while the disputed exact estimates remain outside the route.

7. **AdelicAlgebraicGroups** (source; 1 items). Strong approximation is an existing owner target. Keep the definite quaternion rank-one exception and norm-image obstructions visible.

8. **ArithmeticStatistics** (source; 3 items). ST.0 owns arithmetic families and weighted/unweighted measures; define these counts on actual F_p-isomorphism classes.

9. **ArithmeticStatistics** (source; 9 items). ST.5 explicitly owns random-matrix laws and function-field statistics. Conjectures stay hypotheses, and the enhanced limit is a separate existence task. No disputed 0.99 endpoint is routed here.

10. **AbelianSchemesAndArithmeticModuliPartIIFiniteFields** (part-ii; 21 items). A1–A6 construct relative geometry and realizations but have no Honda–Tate/Waterhouse classification or prime-field lattice-counting layers. This extension consumes them; PEL moduli and statistical models remain with their existing owners.

The sole proposed Part II ends at the explicit finite-field classification and counting suppliers in its brief. It imports the existing abelian-variety carrier and A2–A4/A6, R07.2, GN.2–GN.3 and AA.4. **PELModuli M1–M6 retains ownership of the polarized moduli stack and the rational-object/coarse-point distinction.** ArithmeticStatistics retains the measures and conditional distribution endpoints. No second general mass-formula, Picard, Dieudonné or CM foundation is proposed.

The complete 211-record atlas portfolio was searched and its blob identities checked against the current snapshot. Relevant full owner descriptions, the new-roadmap records, the available packet and the reviewed `data/library-coverage.json` were inspected. The six new roadmap records concern the analytic/Habiro/Witt programme and Lawrence–Venkatesh; none supplies this finite-field classification. Reserved identifiers have no collision. The JacobianChallenge Layer E audit distinguishes built field-level abelian varieties from the absent dual/polarization and general multiplication-isogeny theory; A2/A4/A6, GN.2/GN.3, PEL, AA.4 and ST.0/ST.5 audits make the same boundaries explicit.

The pinned source declarations were opened and their statements read. The eight library items import: AbelianVariety/dim/smooth; IsIsogeny/isIsogeny_iff; WittVector.Isocrystal and its morphisms; NumberField.IsCMField; intrinsic CM conjugation and embedding identities; the real-right-limit analytic class number formula; Tau Ceti's uniform class-number bound; and Matrix.card_GL_field/card_matrix. Witt vectors or a one-dimensional isocrystal classification do not supply Dieudonné classification of abelian varieties; Hodge polarizations do not supply geometric polarizations.

## Validation

`check_paper.py` and `intake.py check-files` were run on the actual named files. Custom checks require those files to exist, check unique IDs and route ownership, validate real stage/parent/area IDs, verify all primary-source hashes and every D/C API/test block, and reject accidental local paths. Mathematical checks independently enumerate the F₂/F₄ elliptic counterexample and finite matrix groups, evaluate Yun's partition counts including colength zero, test the corrected reciprocal-polynomial bound in genus one, the weak-composition failure, the factorial leading coefficient, convex concentration on integer compositions, cyclic zero-gap multiplicities and the p≥7 repair.

These are finite and analytic sanity checks, not Lean proofs. No Lean file is requested by this paper issue and no Lean compilation was performed. The JSON deliberately remains `partial`; passing a schema checker does not certify source closure.

## Item index

Full statements, qualifications, library declarations, existing stage IDs, APIs and tests are in the adjacent JSON. “Withheld” means missing and absent from every proposed route.

| Item | Kind | Status | Locator |
|---|---|---|---|
| `abelian-variety` — Abelian variety over a field | definition | library | §0; §3 setup |
| `unpolarized-count` — Unweighted abelian-variety count | definition | planned | §0 p.1 |
| `ppav-count` — Unweighted principally polarized count | definition | planned | §0 pp.1–2 |
| `polarization-fiber` — Number of polarizations on a fixed variety | definition | missing | §4.4; Conjecture 5.2 |
| `main-unpolarized-source` — Source main unpolarized estimate | theorem | missing / withheld | Theorem 0.1; §3.2.3 (28) |
| `main-repeated-source` — Source squarefree-isogeny probability | theorem | missing / withheld | Theorem 0.3; Proposition 4.17 |
| `main-elliptic-source` — Source conditional large elliptic factor | theorem | missing / withheld | Theorem 0.2; Corollary 5.13 |
| `trace-formula` — Compactly supported trace formula | theorem | missing / withheld | §1 (1)–(2) |
| `weights-source` — Weights used in the point-count heuristic | theorem | planned | §1 p.3 |
| `euler-source` — Orbifold Euler characteristic heuristic | theorem | missing / withheld | §1 pp.4–5 |
| `isogeny` — Isogeny of abelian varieties | definition | library | §3 setup |
| `rational-endomorphism` — Rational endomorphism algebra | definition | planned | §3 pp.6–7 |
| `poincare-decomposition` — Isogeny decomposition and semisimplicity | theorem | planned | §3.2.2; Proposition 4.16 |
| `tate-module` — Prime-to-characteristic Tate module | definition | planned | §3 setup |
| `tate-hom` — Tate full faithfulness over finite fields | theorem | missing | §3 lattice classification; [25] |
| `weil-polynomial` — Frobenius polynomial and reciprocity | definition | missing | §2; §4.3 |
| `isogeny-polynomial` — Frobenius polynomial determines the isogeny class | theorem | missing | Corollary 2.2, Tate input |
| `honda-tate` — Honda–Tate simple isogeny classification | theorem | missing | §0; §3.2.2; Proposition 4.14 |
| `power-sum-count` — A safe reciprocal-polynomial counting bound | theorem | missing | §2 Lemma 2.1, repaired elementary bound |
| `power-sum-source` — Printed polynomial-count constant | theorem | missing / withheld | §2 Lemma 2.1 |
| `isogeny-class-upper` — Asymptotic count of isogeny classes | theorem | missing | Corollary 2.2 with repaired power-sum-count |
| `isocrystal` — Frobenius isocrystal carrier | definition | library | §3 p-adic realization |
| `dieudonne-lattice` — Integral Dieudonné realization | definition | planned | §3 setup |
| `marked-lattice-space` — Prime-to-p and p lattice spaces | definition | missing | §3 equations (5)–(6) |
| `marked-quasi-isogeny` — Marked quasi-isogenies classified by lattices | theorem | missing | §3 (5)–(6) |
| `forget-marking` — Isomorphism classes as rational orbits | theorem | missing | §3 (7) |
| `prime-p-centralizer` — The prime-field p-component reduction | theorem | missing | Remark 3.2 |
| `local-order` — Local monogenic order | definition | missing | §3.1.2 |
| `saturation-normalization` — Normalized lattice sandwiches | theorem | missing | §3.1.2 |
| `flag-fiber` — Stable lattice with prescribed flag quotients | definition | missing | §3.1.3; Yun §4.8–4.9 |
| `extension-shear` — Centralizer shears identify equivalent extensions | theorem | missing | Lemma 3.1 and proof |
| `yun-resultant-fiber` — Resultant cardinality of a disjoint-spectrum fiber | theorem | missing | Yun Lemma 4.9 pp.14–15; LT §3.1.1 |
| `extension-determinant-bound` — Bound after removing zero eigenspaces | theorem | missing | §3.1.4 pp.8–10 |
| `punctual-hilbert-count` — Finite-colength ideal count | definition | missing | Yun §4.12–4.13 |
| `yun-partition-formula` — Yun finite-colength partition formula | theorem | missing | Yun Proposition 4.13 pp.16–17 |
| `hilbert-crude-bound` — Crude partition upper bound | theorem | missing | LT §3.1.5; Yun Proposition 4.13 |
| `local-orbit-source` — Unclosed local orbit estimate | theorem | missing / withheld | §§3.1.5–3.1.6 |
| `stabilizer-depth-source` — Unclosed integral stabilizer-index bound | theorem | missing / withheld | §3.2.1 (16)–(20) |
| `adelic-class-set` — Adelic class set of the endomorphism group | definition | missing | §3.2 (15) |
| `strong-approximation` — Strong approximation supplier | theorem | planned | §3.2.2 before (21) |
| `nonabelian-class-comparison` — Class-set comparison by reduced norms | theorem | missing | §3.2.2 (21) |
| `class-formula` — Analytic class number formula | theorem | library | §3.2.2 (22) |
| `coarse-class-bound` — Available uniform class-number bound | theorem | library | Coarser available replacement for §3.2.2 |
| `weil-discriminant-bound` — Correct elementary discriminant estimate | theorem | missing | §3.2.2 (26), corrected exponent |
| `regulator-source` — Skoruppa input awaiting original proof | theorem | missing / withheld | §3.2.2 (23), [24] |
| `residue-source` — Louboutin input awaiting original proof | theorem | missing / withheld | §3.2.2 (24), [18] |
| `dual-poincare` — Dual variety and rigidified Poincaré bundle | definition | planned | §4.1; Conrad §1 |
| `polarization` — Polarization as a positive symmetric morphism | definition | planned | Definition 4.1; Conrad Definitions 2.1,3.2 |
| `mumford-map` — Mumford homomorphism of a line bundle | construction | planned | §4.1; Conrad Example 2.2 |
| `graph-pullback` — Correct graph-pullback normalization | theorem | missing | Conrad Example 2.2 pp.6–7, correcting LT §4.1 |
| `phi-kernel` — Kernel of the Mumford map | theorem | missing | §4.1 (1)–(2); Conrad Lemma 2.3 and p.8 |
| `phi-ample-isogeny` — Ample line bundles induce isogenies | theorem | planned | §4.1 (3); Conrad Remark 2.4 |
| `finite-field-polarization-descent` — Line-bundle realization over a finite field | theorem | missing | Remark 4.2; Conrad Theorem 2.6 |
| `polarized-isomorphism` — Isomorphism of symmetric morphisms | definition | planned | Definition 4.3 |
| `phi-pullback` — Pullback covariance | theorem | planned | Remark 4.4 (29) |
| `rosati` — Rosati involution | definition | planned | Definition 4.5; Conrad §3 |
| `ns-rational` — Rational Néron–Severi space | definition | missing | §4.2 with rationalization made explicit |
| `ns-rosati-map` — Normalized Néron–Severi/Rosati map | construction | missing | §4.2, Lemma 4.6 with rational domain corrected |
| `endomorphism-trace` — Geometric endomorphism trace | definition | planned | Definition 4.7; Conrad Definition 3.3 |
| `degree-polynomial` — Degree characteristic polynomial | theorem | planned | §4.3, Mumford §19 Theorem 4 |
| `rosati-positivity` — Positive Rosati trace pairing | theorem | planned | §4.3; Conrad Theorem 3.4 pp.9–10 |
| `positive-ample` — Ample classes and positive symmetric elements | theorem | missing | Proposition 4.9 |
| `real-cone` — Real ample-cone matrix description | theorem | missing | Proposition 4.10 |
| `polarization-orbits` — Polarizations as Rosati-conjugacy orbits | theorem | missing | Proposition 4.11 |
| `integer-matrix-example` — No-CM elliptic-power orbit example | theorem | missing | Example 4.12 |
| `cm-field` — CM field and maximal real subfield | definition | library | §4.4.1; Definition 5.1 |
| `cm-conjugation` — Intrinsic CM conjugation | definition | library | Definition 5.1 |
| `cm-unit-orbits` — Polarizations for a maximal CM endomorphism order | theorem | missing | Example 4.13 |
| `prime-field-end-algebra` — Commutative endomorphisms in the nonreal prime-field case | theorem | missing | Proposition 4.14(1) |
| `waterhouse-orders` — Realization of nonreal prime-field orders | theorem | missing | Proposition 4.14(2), Waterhouse Theorem 6.1 |
| `squarefree-pol-count` — Squarefree nonreal polarization bound | theorem | missing | Proposition 4.16 |
| `model-ring` — Model ring with positive involution | definition | missing | Definition 5.1 |
| `model-orbit-count` — Positive-unit model orbit count | definition | missing | Definition 5.1; Conjecture 5.2 |
| `model-comparison-conjecture` — Conjectural comparison with the model ring | theorem | missing | Conjecture 5.2 |
| `unit-norm-label` — Totally positive unit norm labels | definition | missing | §5.2 |
| `unitary-group` — Unitary group of a definite hermitian space | definition | missing | §5.2 |
| `hermitian-lattice` — Integral projective hermitian lattice | definition | planned | Definition 5.3 |
| `hermitian-dual` — Dual and unimodularity | definition | planned | Definition 5.3 |
| `gram-orbit-bijection` — Free unimodular lattices and Gram congruence | theorem | missing | Proposition 5.4 |
| `norm-ideal` — Norm ideal of a local hermitian lattice | definition | missing | Definition 5.5 |
| `local-hermitian-classification` — Local unimodular classification input | theorem | planned | Proposition 5.6 and following paragraph |
| `hermitian-genus` — Genus of a hermitian lattice | definition | planned | §5.3 (37) |
| `genus-double-cosets` — Hermitian genus as a unitary class set | theorem | missing | §5.3 (37) |
| `hermitian-mass` — Weighted hermitian genus mass | definition | planned | §5.4 (38) |
| `tamagawa-mass` — Unitary Tamagawa mass formula | theorem | planned | §5.4 (38) |
| `density-source` — Unverified simplified local-density formula | theorem | missing / withheld | §5.4 (39) |
| `relative-discriminant` — Elementary CM relative-discriminant bound | theorem | missing | §5.4.1 (41), corrected factor |
| `factorial-asymptotic` — Factorial product asymptotic | theorem | missing | §5.4.3, elementary audit of (39) to (51) |
| `mass-asymptotic-source` — Source leading mass asymptotic | theorem | missing / withheld | §§5.4.3–5.5 |
| `gl-card` — Finite general linear group cardinality | theorem | library | Lemma 5.8; Example 5.17 |
| `finite-integral-group` — Minkowski finite integral group bound | theorem | missing | Lemma 5.8 and full proof |
| `mass-cardinality-comparison` — Passing from mass to class count | theorem | missing | §5.4.4 (52)–(53) |
| `free-projective-comparison` — Free versus projective mass classes | theorem | missing | Remark 5.7; (54) |
| `model-count-source` — Source model-ring logarithmic bound | theorem | missing / withheld | §5.4.5 (55) |
| `convex-concentration` — Convex mass-concentration inequality | theorem | missing | Lemma 5.9 |
| `model-concentration-source` — Source model concentration threshold | theorem | missing / withheld | Proposition 5.10 |
| `split-prime-density` — Density of primes splitting in a class-number-one CM field | theorem | missing | Lemma 5.11 proof |
| `cm-elliptic-existence` — Elliptic curve with class-number-one endomorphisms | theorem | missing | Lemma 5.11 proof |
| `elliptic-power-source` — Source elliptic-power asymptotic | theorem | missing / withheld | Lemma 5.11 (56) |
| `spacing-measure` — Normalized eigenangle spacing measure | definition | missing | §5.6, expanded convention |
| `spacing-source` — Source random-matrix discrepancy conclusion | theorem | missing / withheld | Corollary 5.14 |
| `cl-measure` — Cohen–Lenstra probability measure | definition | planned | §5.7.1 |
| `friedman-washington` — Random integral matrices and Cohen–Lenstra | theorem | planned | §5.7.1 [9] |
| `enhanced-cl` — Proposed enhanced Cohen–Lenstra law | definition | missing | Definition 5.16 |
| `cl-two-prime` — Two-extension zero-cokernel probability at two | theorem | missing | Example 5.17, first case |
| `cl-odd-prime` — Uniform positive bound at odd primes | theorem | missing | Example 5.17, second case |
| `enhanced-cl-conjecture` — Source enhanced-statistics conjecture | theorem | missing | Conjecture 5.18 |
| `elliptic-pgroups-source` — False small-prime lemma in the public preprint | theorem | missing / withheld | Lemma 5.19 |
| `elliptic-pgroups-large` — Large-prime repair of the elliptic lemma | theorem | missing | Lemma 5.19, explicitly restricted elementary repair |
| `point-count-isogeny` — Point counts are isogeny invariant | theorem | missing | Corollary 5.20 proof |
| `enhanced-failure-source` — Source failure of enhanced Cohen–Lenstra | theorem | missing / withheld | Corollary 5.20 |
| `reduced-trace-source` — Unqualified reduced-trace identification in v1 | theorem | missing / withheld | Remark 4.8 |
| `ramification-count` — Ramified-prime count from the relative discriminant | theorem | missing | §5.4.2 (44), sharper elementary bound |
