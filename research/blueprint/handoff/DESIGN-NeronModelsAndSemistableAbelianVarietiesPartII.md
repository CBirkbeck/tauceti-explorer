# Quadratic pinching: full presentation and finite-module checkpoint

Agent: ChatGPT Pro — `gpt6astra-20261002-c84f2a`. Refs #3378.
2 October 2026. Claim 5956064315 was confirmed by bot 5956066605;
the issue was reread after confirmation. Publication base
`4c60fa3dd0933cd4220d9590ea93b7779089e678`.

**Partial source-proof checkpoint, not a completed blueprint or formalisation.**
Only this handoff changes. The roadmap definition, canonical packet, reader
and suggested file are unchanged. Their inherited inventory remains 154 nodes
(12 definitions, 3 constructions, 108 lemmas, 26 theorems, 5 comparisons),
60 API entries, 57 definition/construction tests, 29 planets, 89 baseline
references, 17 gaps and 23 requests. All 78 routes, 21 source findings and
seven partial stages are retained, with every implementation status unchecked.
These counts and the earlier compilation/axiom receipts are historical,
not fresh whole-packet verification or new implementation claims.

The complete preceding accumulated handoff is preserved at
[the immutable publication base](https://github.com/CBirkbeck/tauceti-explorer/blob/4c60fa3dd0933cd4220d9590ea93b7779089e678/research/blueprint/handoff/DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII.md).
This current receipt replaces that accumulation, not its canonical mathematics.

## 1. Delivered and notation

The missing generation and **entire presentation-kernel** arguments are
proved below, not merely the vanishing of the displayed relation. The same
normal forms give finite inclusion, the canonical localization, the field
normalization, the conductor defect sequence, and an explicit two-periodic
presentation of the finite module. They also distinguish arbitrary changes
of the coefficient ring from nonflat base change on the pinched curve.

Let R be a commutative ring, a,b in R, and put

    q(t)=t^2+a t+b,    B=R[t],    A=R+qB,
    u=q(t),           v=tq(t),   C=R[U].

C acts on B by U mapping to u; A is the existing quotient-preimage
subalgebra, not a replacement carrier. Write

    F(U,V)=V^2+aUV+bU^2-U^3,    d=U(U-b).

Thus F=V^2+aUV-Ud. The inherited native forms use a field k; the
coefficient-ring algebra here is stronger and those field targets follow
by specialization. Generalizing their typeclasses has NOT been implemented
or compiled. The zero coefficient ring is a trivial separate case before
using a positive polynomial degree or a nonzero basis vector. No field,
Noetherian, reducedness, perfectness, separability or characteristic-zero
hypothesis is imposed on Sections 2–5 and 7–9.

The finite-module comparison is specific to this pinching family. Generic
polynomial quotients, power bases, scalar descent, localization and matrix
operations remain library inputs, not new competing programmes.

## 2. The actual polynomial-ring basis

In C[T] consider the monic polynomial

    P(T)=T^2+aT+b-U.

There is a canonical R-algebra equivalence

    C[T]/(P) -> B,    U |-> q(t),    T |-> t.

Its inverse is the polynomial map t mapping to the class of T. The two
composites are the identity: on t this is immediate, and on U it is exactly
U=T^2+aT+b in the quotient. The coefficient map and generator identities
make this a C-algebra comparison with the stated C-action, rather than an
abstract isomorphism chosen by rank.

Use the native monic AdjoinRoot power basis. It gives the unique normal form

    f(u)+t g(u),     f,g in R[U].                         (B-NF)

An elementary recurrence provides explicit coordinates for each t^n:

    f_0=1, g_0=0;
    f_(n+1)=(U-b)g_n,    g_(n+1)=f_n-a g_n.

This follows by multiplying f_n(u)+t g_n(u) by t and substituting
 t^2=u-a t-b. Linear combination computes the normal form of every
polynomial. Uniqueness comes from the same monic quotient basis, not from
field-valued point evaluations. In particular C -> B is injective, and
multiplication by U on C and by q on B is injective. These regularity
claims use a monic polynomial, not that R is a domain.

## 3. The pinching basis and its full hypersurface presentation

Modulo q, (B-NF) has the unique form f(0)+t g(0) in the R-basis 1,t of
R[t]/(q). It lies in the image of R exactly when g(0)=0. Polynomial division
by U says this is equivalent to g(U)=U h(U). Consequently

    A={f(u)+v h(u): f,h in R[U]},                       (A-NF)

and that expression is unique. This proves generation by u,v and gives a
C-basis 1,v for A. Relative to (1,v) and (1,t), the inclusion A -> B is
exactly the C-linear matrix diag(1,U). This is not a claim that B is free
of rank two over A.

The relation F(u,v)=0 follows by multiplying t^2+a t+b=u by u^2. To prove
that this is the WHOLE kernel, take an arbitrary H(U,V) in C[V]. Divide by
F, monic in V of degree two:

    H=J F+f(U)+Vg(U).

If H(u,v)=0, the remainder maps to f(u)+t u g(u). By (B-NF), f=0 and Ug=0.
Since U is regular on C, g=0. Conversely every multiple of F maps to zero.
Thus the canonical evaluation has image A and kernel (F), and induces

    R[U,V]/(V^2+aUV+bU^2-U^3) = A                     (PRESENT)

through its specified generator maps. This proves the inherited
`quadratic-pinch-generation` and `quadratic-pinch-presentation` targets,
including inseparable quadratics, as mathematical statements.

The current suggested file uses MvPolynomial (Fin 2), with variable 0=U,
1=V. Native MvPolynomial.finSuccEquiv makes variable 0 the OUTER polynomial
variable, not variable 1. For division in V, first exchange the two variables
with the native rename equivalence, then use finSuccEquiv and identify the
remaining one-variable coefficient polynomial. Alternatively construct the
two evaluation maps and check each generator. A silent U/V swap gives the
wrong monic-division argument. The compatibility is a proof obligation, not
a new polynomial carrier.

## 4. Finite inclusion, localization and the field normalization

B is generated as an A-module by 1,t, because C is a subring of A and
(B-NF) spans. The element t is integral over A, satisfying

    T^2+aT+(b-u)=0.

The localization comparison is the actual map

    A[1/u] -> B[1/q]

induced by inclusion. Its inverse sends t to v/u. Indeed PRESENT implies
(v/u)^2+a(v/u)+b=u. The composites agree on R,u,v,t and the inverted
elements. This proves an isomorphism compatible with the original maps,
not just an agreement of complements on points.

For R=k a field, A and B are domains inside k(t), and their fraction fields
agree by the canonical inclusion. Explicitly, any f(t)/g(t) with g nonzero
is (qf)/(qg), with numerator and nonzero denominator in A. B is finite
integral over A and is integrally closed in k(t). For completeness, the
last fact has the standard elementary proof: put an integral rational
function in coprime form f/g; a monic equation shows g divides f^n, whence
g is a unit in the polynomial PID. An element of k(t) integral over A is
also integral over B by the same equation, so it belongs to B. Therefore B
is precisely the integral closure of A in this identified fraction field.

Only this last normalization paragraph uses a field. No normality theorem
for R[t] over arbitrary R is asserted. The exact native fraction-field,
localization and scheme-normalization comparisons still need registration,
including the actual SR.1 normalization type. Separability of q is not
needed for normalization; it is a separate hypothesis in the nodal/branch
conclusion, which is not proved by PRESENT alone.

## 5. Defect, conductor and the two coefficient actions

Define the R-linear map

    delta:B -> R,    delta(f(u)+t g(u))=g(0).

Its kernel is A, it is surjective, and r mapping to rt is an R-linear
section. For alpha=f(u)+v h(u) in A define

    epsilon(alpha)=f(0).

The multiplication formula gives delta(alpha z)=epsilon(alpha)delta(z).
Thus the actual inclusion fits in the short exact A-module sequence

    0 -> A -> B --delta--> R_epsilon -> 0,             (DEFECT)

where R_epsilon means R with A-action through epsilon. This epsilon agrees
with the inherited scalar residue: reduce f(u)+v h(u) modulo q. The
sequence splits over R, not over A when R is nonzero. An A-linear section
would send 1 to an element of B killed by u, impossible since u is regular
on B and the section would have nonzero delta.

The conductor in B is qB. Here is its computation from the same coordinates,
consistent with the predecessor's proved field statement. An element
alpha=f(u)+v h(u) belongs to the conductor iff alpha and t alpha both lie
in A, because B=A+A t. The coefficient of t in t alpha modulo q is f(0).
Hence the conductor contracted to A is

    I=ker epsilon=(u,v),   and I=qB as subsets of B.

Multiplication by q gives an A-linear isomorphism B -> I. In normal
coordinates it is (f,g) mapping to (Uf,g), with codomain in A-coordinates.
Its inverse exists on I because f(0)=0 exactly when U divides f; injectivity
uses regularity of q. Also Ann_A(B/A)=I, using DEFECT and the faithful
regular R-module. The ideal I is generally NOT uA: for R nonzero, v is not
in uA, since that would force t to belong to A after cancelling q.

A useful specialized dual comparison follows without a generic duality
theory. Evaluation at 1 gives

    Hom_A(B,A) = I.

If h(1)=r and h(t)=s, then u s=v r, hence q(s-tr)=0 in B. Therefore s=tr,
and r lies in the conductor. Conversely multiplication by any r in I is
an A-linear map B -> A; the values on 1,t determine it. Composing with
multiplication by q identifies B with this Hom module. This is a concrete
conductor comparison, not a newly assumed dualizing complex.

## 6. A complete normalization-module presentation

All matrices act on column vectors. In A set d=u(u-b) and define

    Psi = [ -v,        -d       ],
          [  u,         v+a u   ]

    Phi = [ -v-a u,    -d       ].
          [  u,         v       ]

Let pi:A^2 -> B send (r,s) to r+t s. It is surjective. The two displayed
columns of Psi map to zero, since ut=v and t(v+a u)=u(u-b).
Over R[U,V], before imposing F, both matrix products equal F times the
identity; over A they are zero. This alone would not prove exactness.

For the missing kernel proof write

    r=r0+v r1,    s=s0+v s1,     r_i,s_i in C.

In B-coordinates,

    pi(r,s)=(r0+d s1) + t(U r1+s0-aU s1).

Thus pi(r,s)=0 implies r0=-d s1 and s0=-U r1+aU s1, and the explicit
preimage is

    (r,s)=Psi(-r1,s1).                                (KERNEL-PI)

The arguments on the right are included from C into A. This proves
ker(pi)=image(Psi), hence coker(Psi) is B through pi, not merely a module
with the same generic rank.

For periodic exactness, define

    w=U r1+s0,    z=-r0+aU r1-d s1.

The first coordinate of Psi(r,s), in A-coordinates, is -d w+v z;
the second is -U z+aU w+v w. Uniqueness of (A-NF) says it vanishes exactly
when w=z=0. Substitution then gives

    (r,s)=Phi(-r1,s1).                                (KERNEL-PSI)

For Phi, put c=r0+d s1 and e=U r1+s0-aU s1. Its coordinates are
-d e-aU c-v c and U c+v e. They vanish exactly when c=e=0, giving
(KERNEL-PI) again. Therefore

    ker(Psi)=image(Phi),   ker(Phi)=image(Psi).

This supplies the exact two-periodic free resolution ending in B. The proof
uses the actual coefficient equations and constructs the preimage of every
kernel element. It does not replan a general hypersurface matrix-factorization
theorem from another roadmap. In particular det(Psi)=-F is only a check,
not the reason the augmented complex is exact.

The coordinate proofs of this SECTION survive every C-algebra base change,
even when U becomes a zero divisor, because the monic quotients retain bases
1,v and 1,t and the displayed kernel reconstructions never divide by U.
After such a change B denotes the specialized finite module, not a newly
asserted normalization. By contrast, injectivity of A -> B before taking
cokernels used regularity of U; that injectivity need not survive.

## 7. Coefficient-ring base change does preserve this family

For any ring map R -> R', let a',b' be the images and form q',A',B' by the
same formulas. Then the canonical maps give

    A tensor_R R' = A',     B tensor_R R' = R'[t],

with the inclusion and residue maps commuting. One proof uses the monic
presentation and (A-NF); another tensors the R-split exact sequence DEFECT.
The finite quotient B/qB is free of rank two over R, so the actual constant
preimage agrees after every coefficient-ring change, not only a flat one.

This is a special uniform quadratic FAMILY over Spec R. It does not strengthen
the general Ferrand theorem to arbitrary base change on Spec A. Its free
C-module rank two is likewise not flatness of the normalization over A.
For a field, the latter has generic rank one and a two-dimensional fiber
at the pinch.

## 8. The nonflat curve-base-change obstruction, with its nilpotent

For L>=1, set C_L=R[U]/(U^L), D_L=A/(u^L), and B_L=B/(q^L). The first two
normal forms specialize to C_L-bases (1,v) for D_L and (1,t) for B_L. The
natural comparison D_L -> B_L still has matrix diag(1,U). It has kernel

    R times u^(L-1)v

and cokernel R. For R nonzero the displayed kernel element is nonzero:
its v-coordinate U^(L-1) is nonzero in the monic truncated polynomial ring.
No point-counting test detects this kernel.

At L=1, D_1=R[V]/(V^2), while B_1=R[t]/(q)=E. The original conductor
square has rings A,B,R,E. After base change along A -> D_1, the other three
rings are E,R,E, with the E -> E map the identity. Their recomputed fiber
product is R. The canonical map

    D_1 -> E times_E R = R

kills the nonzero square-zero class v. Thus the base-changed square is not
the same geometric pushout. At general L the recomputed ring is the image
R+qB inside B/(q^L), and the same comparison loses u^(L-1)v.

This works for separable, repeated-root and inseparable quadratics; the
nilpotent is scheme-theoretic information, not a claim that each fiber has
the same singularity type. The example supplements the existing nonflat
conductor warnings without introducing a new source error.

## 9. Proof-sized integration targets and tests

These are refinements to integrate under this roadmap's G.1, NOT registered
new nodes or new inventory counts in this checkpoint. Keep the IDs of the
existing generation, presentation, residue, conductor and normalization
nodes. The exact API statements and tests below should be reflected in the
canonical packet, reader and suggested file together.

1. **Eliminated quadratic root equivalence:** the specified C[T]/(P) -> R[t]
   comparison and C-basis 1,t. Import AdjoinRoot; prove both generator
   identities. Tests: t^2=(u-b)-at; a=b=0; characteristic-two a=b=1.
2. **Pinching normal-form equivalence:** A is C plus C v with the inclusion
   diag(1,U). Tests: constants and v survive; t is not in A for nonzero R;
   R=Z/4 with a nilpotent coefficient still has unique coordinates.
3. **Monic-V kernel reduction:** division by F and vanishing of its entire
   evaluated remainder, giving the inherited presentation theorem. Tests:
   the cusp V^2-U^3, the split-node equation, and the characteristic-two
   UV term; pointwise equality on a finite field is not kernel equality.
4. **Finite module and localization:** generators 1,t, their integral equation,
   and inverse t mapping to v/u. The field fraction-ring/integral-closure
   corollary is separate and must retain the actual canonical maps.
5. **Defect sequence:** delta, its kernel/surjectivity, and its R-linear
   section; compare epsilon to the EXISTING residue map. Tests: delta(t)=1,
   delta(A)=0, and failure of A-linearity of the section.
6. **Conductor module comparison:** the existing conductor is (u,v), with
   multiplication q:B -> I an equivalence; evaluation Hom_A(B,A) -> I is a
   separate lemma. Tests: v is in I but not uA; q times t maps to v; the
   conductor is not inferred from equal closed point sets.
7. **Augmented relation preimage:** formula KERNEL-PI proves exactness of
   A^2 --Psi--> A^2 --pi--> B -> 0, not just pi composed with Psi=0.
8. **Two periodic kernels:** split KERNEL-PSI and the Phi-kernel identity into
   individual lemmas. Use actual normal-form coordinates; generic matrix
   factorization/homological constructions remain imported.
9. **Coefficient specialization:** canonical arbitrary R -> R' comparisons,
   with all four conductor-square maps. This is not arbitrary A-base change.
10. **Nonflat specialization:** the exact kernel R times u^(L-1)v, its
    nonvanishing, and the L=1 conductor-square comparison to R.

The dependency direction is elimination/basis -> A normal form -> full
presentation -> module/localization/conductor comparisons -> specialized
module/base-change tests. No new cross-roadmap reverse dependency or planet
is proposed. Before changing the existing SF.0 request, integrate these
specific proofs and distinguish them from the genuinely generic localization,
fraction-field and geometric exports. The separate SR.1 node/normalization
and SF.3 proper-P1/cohomology/finite-field interfaces remain open.

## 10. Sources and native-interface receipts

Fresh primary reading was deliberately bounded:

- [Schröer arXiv:2004.07025v3](https://arxiv.org/pdf/2004.07025v3), selected
  §3 text on pinching and residue algebras. The rendered printed p.10 was
  inspected, including the two conductor diagrams and the split, infinitesimal
  and separable quadratic residue cases. Rendering printed pp.9 and 11
  failed; no fresh complete §3 proof, full paper, edition collation or
  source-erratum audit is claimed. The inherited PDF hash is not a fresh
  downloaded-byte certificate from this continuation.
- [Stacks 0ECH](https://stacks.math.columbia.edu/tag/0ECH), Section 37.67:
  the scheme hypotheses, affine construction and geometric sheaf formula,
  and the displayed flat-base-change statements/proofs. Its finite-fiber
  affine-neighborhood hypothesis is retained. No unconditional global-scheme
  pushout theorem is deduced from the affine calculation here.

The coordinate normal forms, matrix kernels and base-change examples above
are explicitly derived adapters motivated by those sources. They are not
claimed as separately numbered theorems of Schröer. No new source mistake
is alleged; all prior 21 findings retain their earlier attribution.

Fresh native statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- RingTheory/AdjoinRoot.lean, lines 230–340 and 580–800, blob
  `1945b7728630a10baf56374f183be1bcfa3727f0`: lift/liftAlgHom with their actual
  coefficient maps and generator evaluations; monic-root integrality,
  modByMonicHom and its inverse comparison; powerBasisAux', powerBasis',
  and Polynomial.Monic.free_adjoinRoot/finite_adjoinRoot. The arbitrary
  CommRing hypotheses, rather than the later field-only powerBasis, are
  essential. Zero rings require the explicit separate degree case.
- Algebra/MvPolynomial/Equiv.lean, lines 460–620 and 640–780, blob
  `fdfc975d04badb9226183345a7558ee477649af0`: optionEquivLeft, its generator
  maps, finSuccEquiv and finSuccEquiv_X_zero/X_succ. These expose the
  outer-variable convention used in Section 3.
- Algebra/MvPolynomial/Polynomial.lean, complete file, blob
  `cdb9754b529c499e7b53514526df99addf91e186`: evaluation compatibility for
  finSuccEquiv. Searches on current main were only leads, not pin evidence.

The current native QuadraticPinch definitions, admitted generation/presentation
forms and proved residue/conductor adapters were read. The general-R carrier
and formal first-isomorphism/localization/normalization comparisons are NOT
claimed to elaborate. The polynomial PID argument for field normality is a
mathematical proof, not a newly inspected exact native normalization theorem.

Read the complete issue before and after claim, the latest handoff and
relevant canonical nodes/request/omission records, the seven-stage roadmap,
and selected reviewed AUDIT-10 parent information. No direct PartII audit
was located in that material. The parent review distinguishes scheme Neron
objects from existing algebra/group-scheme ingredients. Upstream style and
ownership reading in this working session included GrothendieckEulerForms
and Multiquadratic, and the opening function-field/scheme boundary of
EllipticCurves; this is not a fresh full read of every geometric supplier.
No claim of a new exhaustive link-map or library-absence search is made.

## 11. Validation and remaining scope

The standalone program below executed **52,339 assertions**. It covers all
200 monic quadratic coefficient choices over moduli 1,2,3,4,5,8,9, including
the zero ring and rings with nilpotents, with nine random polynomial/module
samples per choice. Monic division returns the full quotient and remainder
and checks the polynomial identity independently of substitution. Entire
finite coefficient boxes over F2 and F3 give 23,779 additional kernel tests.

The 152 finite module cases use all a,b over F2,F3,F5 and C/(U^L), 1<=L<=4.
Exact Gaussian ranks validate the full finite maps, complementing the
composition and explicit preimage tests. Four hundred coefficient-reduction
cases separately test multiplication and inclusion. Highlights: 1,800 each
of full division identities, principal-ideal regressions, normalization
coordinates, conductor comparisons, augmented relations and periodic
composition/preimage checks; 152 nonflat kernel witnesses and rank checks.

These are finite regressions, not a substitute for the general proofs,
Lean elaboration, normalization of a scheme, or the geometric nodality
comparison. The tests do not revalidate the inherited fourteen-model surface
classification or its completeness certificates.

Program SHA-256:
`bf4d1cad82aa6e8ecaeb6c95cb435d888e832e50b9e88c294e304a1a23049fce`.
JSON output SHA-256:
`d57103c71cf92cc8ba5a5644fc29be912e130647f31348f3eeb42a5e55105f84`.

**Lean was not compiled.** Available memory was about 3 GB, below WORKERS'
20 GB threshold, and no existing pinned build was available. No project,
cache retrieval, library build or language server was started. The local
indexed checker and actual atlas assembly were not run; the canonical packet
was not changed. Submission CI is a separate mechanical check, not an
independent mathematical review. Historical compilation applies only to its
own exact file/excerpt. No new formalization or stage closure is claimed.

Resume by integrating Sections 2–4 into the existing generation/presentation
and finite-normalization targets, with proof-sized helpers and native
signatures, then Sections 5–8 into the conductor and nonflat-test interfaces.
Preserve the variable convention and distinguish C-freeness from A-flatness.
Finish actual scheme normalization/node/branch comparison, proper P1
pinching and cohomology, the I1/I2 and field-extension maps, all space/gluing,
canonical/wild, DVR/quasielliptic and model-resolution obligations, and the
missing William Lang source/completeness work. The reserved general Ferrand
key is not closed by this affine quadratic computation.

## 12. Reproduction

Run this standalone Python 3 program; only the standard library is used.

```python
"""Quadratic-pinch exact regressions. Standard library only; not Lean proofs."""
from collections import Counter
from itertools import product
from random import Random
import json

counts=Counter(); rng=Random(3378); modulus=2; a=0; b=0; trunc=None

def ck(name, assertion):
    if not assertion: raise AssertionError((name,modulus,a,b,trunc))
    counts[name]+=1

def trim(f):
    f=[x%modulus for x in f]
    if trunc is not None: f=f[:trunc]
    while f and f[-1]==0: f.pop()
    return tuple(f)
def add(f,g): return trim([(f[i] if i<len(f) else 0)+(g[i] if i<len(g) else 0) for i in range(max(len(f),len(g)))])
def neg(f): return trim([-x for x in f])
def sub(f,g): return add(f,neg(g))
def mul(f,g):
    h=[0]*max(0,len(f)+len(g)-1)
    for i,x in enumerate(f):
        for j,y in enumerate(g): h[i+j]+=x*y
    return trim(h)
def c(x): return trim([x])
def shift(f,n=1): return trim([0]*n+list(f))
def power(f,n):
    h=c(1)
    for _ in range(n): h=mul(h,f)
    return h
def eval_poly(f,x):
    h=()
    for v in reversed(f): h=add(mul(h,x),c(v))
    return h
def randpoly(n=5): return trim([rng.randrange(modulus) for _ in range(n)])
def padd(z,w): return add(z[0],w[0]),add(z[1],w[1])
def pneg(z): return neg(z[0]),neg(z[1])
def pscale(f,z): return mul(f,z[0]),mul(f,z[1])
def pmul(z,w,kind):
    # B: t^2=U-a*t-b; A: V^2=U^3-a*U*V-b*U^2.
    gj=mul(z[1],w[1]); u=shift(c(1))
    d=sub(u,c(b)) if kind=='B' else sub(power(u,3),pscale(c(b),(power(u,2),()))[0])
    e=c(a) if kind=='B' else pscale(c(a),(u,()))[0]
    return add(mul(z[0],w[0]),mul(d,gj)), sub(add(mul(z[0],w[1]),mul(z[1],w[0])),mul(e,gj))
def inc(z): return z[0],shift(z[1])
def times_t(z): return mul(sub(shift(c(1)),c(b)),z[1]), sub(z[0],mul(c(a),z[1]))
def pi(z): return padd(inc(z[0]),times_t(inc(z[1])))
def normal_B(f):
    out=((),()); tpower=(c(1),())
    for coeff in f:
        out=padd(out,pscale(c(coeff),tpower)); tpower=times_t(tpower)
    return out

def poly_t_from_B(z):
    # Only call with no truncation: the argument is a pair of U-polynomials.
    q=(b%modulus,a%modulus,1%modulus)
    return add(eval_poly(z[0],q),shift(eval_poly(z[1],q)))
def poly_t_from_A(z): return poly_t_from_B(inc(z))
def normal_A_eval(f):
    z=normal_B(f)
    return (z[0],trim(z[1][1:])) if not z[1] or z[1][0]==0 else None

def mvec(M,z):
    return tuple(padd(pmul(M[i][0],z[0],'A'),pmul(M[i][1],z[1],'A')) for i in range(2))
def matrices():
    zero=((),()); u=shift(c(1)); v=((),c(1)); up=(u,()); d=(mul(u,sub(u,c(b))),())
    psi=((pneg(v),pneg(d)),(up,padd(v,(mul(c(a),u),()))))
    phi=((pneg(padd(v,(mul(c(a),u),()))),pneg(d)),(up,v))
    return psi,phi

def nf(P):
    # Actual monic division in V: retain the entire quotient and remainder.
    P={ij:x%modulus for ij,x in P.items() if x%modulus}; H={}
    while any(j>=2 for i,j in P):
        i,j=max((ij for ij in P if ij[1]>=2),key=lambda z:(z[1],z[0]))
        x=P[(i,j)]; pos=(i,j-2); H[pos]=(H.get(pos,0)+x)%modulus
        # subtract x U^i V^(j-2) (V^2+aUV+bU^2-U^3)
        for di,dj,w in [(0,2,1),(1,1,a),(2,0,b),(3,0,-1)]:
            key=(i+di,j-2+dj); P[key]=(P.get(key,0)-x*w)%modulus
            if not P[key]: P.pop(key,None)
    F=trim([P.get((i,0),0) for i in range(1+max((i for i,j in P),default=-1))])
    G=trim([P.get((i,1),0) for i in range(1+max((i for i,j in P),default=-1))])
    return (F,G),{ij:x for ij,x in H.items() if x}
def mvadd(P,Q):
    out=dict(P)
    for ij,x in Q.items(): out[ij]=(out.get(ij,0)+x)%modulus
    return {ij:x for ij,x in out.items() if x}
def mvmul(P,Q):
    out={}
    for (i,j),x in P.items():
        for (k,l),y in Q.items(): out[(i+k,j+l)]=(out.get((i+k,j+l),0)+x*y)%modulus
    return {ij:x for ij,x in out.items() if x}
def from_normal(z): return {(i,0):x for i,x in enumerate(z[0]) if x}|{(i,1):x for i,x in enumerate(z[1]) if x}
def eval_mv(P):
    q=trim([b,a,1]); tq=shift(q); out=()
    for (i,j),x in P.items(): out=add(out,mul(c(x),mul(power(q,i),power(tq,j))))
    return out

ring_cases=0
for modulus in [1,2,3,4,5,8,9]:
    trunc=None
    for a,b in product(range(modulus),repeat=2):
        ring_cases+=1; F={(0,2):1,(1,1):a,(2,0):b,(3,0):-1}
        for _ in range(9):
            h=randpoly(13); z=normal_B(h)
            ck('normalization_polynomial_basis',poly_t_from_B(z)==h)
            f,g=randpoly(),randpoly(); zz=(f,g)
            ck('pinch_normal_form_injective',normal_A_eval(poly_t_from_A(zz))==zz)
            w=(randpoly(),randpoly())
            ck('multiplication_diagonal_inclusion',inc(pmul(zz,w,'A'))==pmul(inc(zz),inc(w),'B'))
            ck('polynomial_multiplication',poly_t_from_A(pmul(zz,w,'A'))==mul(poly_t_from_A(zz),poly_t_from_A(w)))
            # Cokernel is the coefficient of t in the remainder modulo q.
            delta=z[1][0] if z[1] else 0
            projected=sub(h,shift(c(delta)))
            ck('split_coefficient_cokernel',normal_A_eval(projected) is not None)
            ck('conductor_membership',(normal_A_eval(poly_t_from_B(times_t(inc(zz)))) is not None)==(not f or f[0]==0))
            P={(rng.randrange(5),rng.randrange(5)):rng.randrange(modulus) for _ in range(10)}
            N,H=nf(P)
            ck('monic_division_identity',mvadd(mvmul(F,H),from_normal(N))=={ij:x%modulus for ij,x in P.items() if x%modulus})
            ck('normal_form_evaluation',eval_mv(P)==poly_t_from_A(N))
            ck('kernel_equivalence_sample',(eval_mv(P)==())==(N==((),())))
            ck('principal_ideal_sample',nf(mvmul(F,P))[0]==((),()))
            psi,phi=matrices(); y=((randpoly(),randpoly()),(randpoly(),randpoly())); zero=(((),()),((),()))
            syz=mvec(psi,y); syz2=mvec(phi,y)
            ck('augmented_relation',pi(syz)==((),()))
            ck('periodic_compositions',mvec(phi,syz)==zero and mvec(psi,syz2)==zero)
            rec=((neg(syz[0][1]),()),(syz[1][1],()))
            ck('kernel_augmentation_preimage',mvec(psi,rec)==syz)
            rec2=((neg(syz2[0][1]),()),(syz2[1][1],()))
            ck('kernel_psi_preimage',mvec(phi,rec2)==syz2)
            # conductor qB has A-normal coordinates (U*f,g).
            con=(shift(z[0]),z[1]); q=trim([b,a,1])
            ck('conductor_multiplication_isomorphism',poly_t_from_A(con)==mul(q,h))

# Entire finite coefficient boxes, not just random ideal elements.
for modulus,bound in [(2,8),(3,6)]:
    trunc=None; basis=[(i,j) for j in range(bound//3+1) for i in range(bound//2+1) if 2*i+3*j<=bound]
    for a,b in product(range(modulus),repeat=2):
        for coeff in product(range(modulus),repeat=len(basis)):
            P={ij:x for ij,x in zip(basis,coeff) if x}; z,H=nf(P)
            ck('exhaustive_presentation_box',(eval_mv(P)==())==(z==((),())))

# Prime-field linear algebra validates entire finite module maps, not just samples.
def rank(cols,p):
    if not cols: return 0
    A=[list(row) for row in zip(*cols)]; r=0
    for j in range(len(cols)):
        pivot=next((i for i in range(r,len(A)) if A[i][j]%p),None)
        if pivot is None: continue
        A[r],A[pivot]=A[pivot],A[r]; u=pow(A[r][j]%p,-1,p); A[r]=[(x*u)%p for x in A[r]]
        for i in range(len(A)):
            if i!=r and A[i][j]%p:
                u=A[i][j]%p; A[i]=[(x-u*y)%p for x,y in zip(A[i],A[r])]
        r+=1
        if r==len(A): break
    return r

def flatpair(z,L): return tuple(z[0])+(0,)*(L-len(z[0]))+tuple(z[1])+(0,)*(L-len(z[1]))
def flatvec(z,L): return flatpair(z[0],L)+flatpair(z[1],L)
finite_cases=0
for modulus in [2,3,5]:
    for a,b in product(range(modulus),repeat=2):
        for L in range(1,5):
            finite_cases+=1; trunc=L; psi,phi=matrices(); columns_psi=[];columns_phi=[];columns_pi=[]
            for i in range(4*L):
                parts=[(),(),(),()]; parts[i//L]=trim([0]*(i%L)+[1]); z=((parts[0],parts[1]),(parts[2],parts[3]))
                columns_psi.append(flatvec(mvec(psi,z),L));columns_phi.append(flatvec(mvec(phi,z),L));columns_pi.append(flatpair(pi(z),L))
            ck('finite_cokernel_surjection',rank(columns_pi,modulus)==2*L)
            ck('finite_augmented_exactness',rank(columns_psi,modulus)==2*L)
            ck('finite_periodic_exactness',rank(columns_phi,modulus)==2*L)
            # inclusion diag(1,U) has exactly one-dimensional kernel and cokernel.
            inc_cols=[]
            for i in range(2*L):
                z=(trim([0]*i+[1]),()) if i<L else ((),trim([0]*(i-L)+[1]))
                inc_cols.append(flatpair(inc(z),L))
            ck('nonflat_inclusion_rank',rank(inc_cols,modulus)==2*L-1)
            witness=((),trim([0]*(L-1)+[1]))
            ck('nonflat_kernel_witness',witness!=((),()) and inc(witness)==((),()))

# Arbitrary coefficient reduction, distinguished from quotienting by U on A.
trunc=None
for source,target in [(4,2),(8,4),(8,2),(9,3)]:
    for _ in range(100):
        modulus=source;a=rng.randrange(source);b=rng.randrange(source)
        z=(randpoly(),randpoly());w=(randpoly(),randpoly());prod0=pmul(z,w,'A');image0=poly_t_from_A(z)
        modulus=target;a%=target;b%=target
        zz=(trim(z[0]),trim(z[1]));ww=(trim(w[0]),trim(w[1]))
        ck('coefficient_base_change_product',pmul(zz,ww,'A')==(trim(prod0[0]),trim(prod0[1])))
        ck('coefficient_base_change_inclusion',poly_t_from_A(zz)==trim(image0))

print(json.dumps({'seed':3378,'quadratic_coefficient_cases':ring_cases,'coefficient_moduli':[1,2,3,4,5,8,9],
'finite_module_cases':finite_cases,'checks':dict(counts),'total_assertions':sum(counts.values()),
'scope':'Exact polynomial and finite-module regressions; not formal proofs or scheme/normalization verification'},sort_keys=True,indent=2))
```
