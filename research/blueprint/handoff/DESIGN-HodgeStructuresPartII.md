# DESIGN-HodgeStructuresPartII — symmetric action and nilpotence checkpoint

Agent: ChatGPT Pro — gpt6astra-20261002-c84f2a. Date: 2 October 2026.
Refs #3371. Claim 5954509324 confirmed by bot 5954512771; the full issue was
reread after confirmation. Publication base:
45a6f659be68c53bad05e539fb0e9706adc17e16.

This is a partial source-proof checkpoint. It changes only this handoff. The
canonical roadmap, packet, reader and suggested file are unchanged. The
mathematical refinements below still require integration into those files.
No new canonical node, implementation or independent review is claimed.

## Predecessor and preservation

The complete preceding handoff, including all historical proof, source,
compilation and reproduction receipts, is preserved at this immutable link:

https://github.com/CBirkbeck/tauceti-explorer/blob/45a6f659be68c53bad05e539fb0e9706adc17e16/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md

Its blob is 831dbdece6fe90aad59fa9203434a7a00acaf252. Read that handoff together
with this one when continuing. This replaces the accumulated handoff text by
a current receipt plus its immutable archive; it does not remove any packet
node, route, source finding or suggested declaration.

Inherited totals remain 60 nodes: 12 definitions, 16 constructions, 14 lemmas,
13 theorems and five comparisons; 103 API items, 89 tests, six planets,
43 baseline declarations, five requests and ten gaps. All 149 routed item
obligations, eight routeManifest entries and 35 global signature omissions
remain. H.0 stays partial; H.1–H.8 stay not_read. The real Noether–Lefschetz
H.8 obligation is retained.

The predecessor's determinant frame bridge remains the starting point for
that lane. In particular, the generic Jacobi theorem belongs to
ColemanPowerSeries:L1/derivation-determinant-unit and is not duplicated here.
Global determinant/exterior descent, CR.1/E1/DD.1 supplier contracts, Tate
and filtered-period adapters, and the unread higher layers remain work.

The preceding exact suggested bytes were reported to elaborate at the pins:
SHA-256 6e90608f1e0748728112b947e7f5f6bf3b1c55398d62235d80cdf7a6300ad290,
123 admitted-body warnings and 48 native examples. That is the predecessor's
receipt, not a compilation or proof claim from this continuation.

## 1. Scope and notation

Use the reserved intrinsic definition
HodgeStructuresPartII:key/higgs-parameter-connections and the existing H.0
symmetric-action, ordered-iterate and nilpotence-filtration nodes. Do not
introduce another Higgs, symmetric-algebra, module or nilpotence carrier.

The algebra below concerns parameter zero. Let A be a commutative ring,
E a finite projective A-module, and Q a finite projective coefficient module.
For the geometric application Q is the appropriate locally free sheaf of
one-forms, possibly with its existing invertible/Tate twist. A Higgs field is
an A-linear map theta:E -> E tensor_A Q with vanishing exterior square.
Write V=Hom_A(Q,A), S=Sym_A(V), a(v)=(id tensor v) theta, and let
alpha:S -> End_A(E) be the action constructed below. End_A(E) need not be
commutative. Let epsilon:S -> A be the canonical augmentation, and I its
kernel. The symbols S, I and End refer to existing algebra/module objects.

All scalar-base-change claims in sections 4–5 use Q'=A' tensor_A Q and
E'=A' tensor_A E. They are not claims that pullback of absolute differentials
along an arbitrary geometric morphism is an isomorphism. A geometric Higgs
pullback also uses its specified differential/coefficient map.

## 2. Close the noncommutative-target step in symmetric-action

### 2.1 Contractions and integrability

On a chart with basis q_1,...,q_d of Q and dual basis v_1,...,v_d, write
A_i=a(v_i). Then theta(e)=sum_i A_i(e) tensor q_i. With the convention that a
new theta is applied to the E factor, the coefficient of q_i wedge q_j for
i<j in the exterior square is A_i A_j - A_j A_i. Consequently the exterior
square vanishes exactly when the A_i commute pairwise. Bilinearity then
shows that all contractions a(v) commute.

This calculation uses the exterior basis with i<j, not division by two.
For E12 and E21 over F_2 the commutator is the identity matrix, not zero.
Thus the characteristic-two test rejects an argument which incorrectly
replaces the commutator by twice one of its terms.

The inverse construction from the contractions uses the coevaluation tensor
of Q and the natural finite-projective duality comparison. Its description
sum_i A_i tensor q_i is independent of the chosen dual basis. This is an
instance of the existing E1 duality/sheaf interface, not a new global frame.

### 2.2 The native lift is through a ring congruence

At the Mathlib pin, SymmetricAlgebra.lift has a commutative target hypothesis.
It therefore cannot be applied directly with target End_A(E). Nor can the
nearby SymmetricAlgebra.algHom_ext theorem be used without checking its
inherited commutative-target hypotheses.

There is a direct construction using already existing native objects:

1. TensorAlgebra.lift extends a to an A-algebra map from TensorAlgebra_A(V)
   to End_A(E). Its target hypothesis is only an associative semiring with
   its central A-algebra structure.
2. The defining relation TensorAlgebra.SymRel identifies v*w with w*v on
   generators. Its two images are a(v)a(w) and a(w)a(v), equal by 2.1.
3. The generated ring congruence is therefore contained in the kernel
   congruence of that tensor-algebra map. RingCon.lift_A (the native spelling
   is RingCon.liftₐ) descends it to the existing SymmetricAlgebra.
4. Generator evaluation is the tensor-lift evaluation followed by
   RingCon.liftₐ_mk. For uniqueness, precompose two candidate algebra maps
   with the surjective TensorAlgebra-to-SymmetricAlgebra quotient. Apply
   TensorAlgebra.hom_ext and then RingCon.Quotient.hom_extₐ. Neither of
   these two extensionality statements requires a commutative target.

Conversely any S-action with the specified degree-one restriction sends
commuting generators to commuting endomorphisms, so 2.1 recovers integrability.
This completes the algebraic argument required by the existing node. It is
not a claim that a separately packaged noncommutative symmetric lift was
absent from every file of Tau Ceti; the actual target restriction and the
native quotient route, not an exhaustive absence claim, are what was checked.

Compatibility with restriction and coefficient isomorphisms follows by
uniqueness on generators. Those equalities are the input to the E1 sheaf
map/gluing construction. They do not identify tensors of global sections
with global sections of a sheaf tensor product.

### 2.3 Morphisms

An A-linear map h:E -> F is a Higgs morphism exactly when
h a_E(v)=a_F(v) h for every v in V. This generator condition implies
h alpha_E(s)=alpha_F(s) h for every s in S by tensor/symmetric-algebra
induction, and the converse follows by evaluation at a generator.
Thus the comparison preserves the actual morphisms, not just objects or
commuting matrices up to a choice of basis. It uses the existing module
structures extending the given A-action. It is not asserted for nonzero
parameter connections, whose differentiation operators are not A-linear.

## 3. Augmentation powers detect ordered Higgs nilpotence

### 3.1 Identify the augmentation ideal without a new grading carrier

I is the ideal generated by the degree-one images of V. One proof is to
quotient S by those images: the quotient is generated by scalars alone, and
the scalar map and augmentation give mutually inverse A-algebra maps with A.
This identifies its kernel with I. On a finite free chart this is the usual
ideal (u_1,...,u_d) in the native symmetric/polynomial algebra.

For N>0, I^N is generated as an ideal by products of N degree-one generators.
This is ordinary ideal multiplication; no factorials, averaging or divided
powers enter. Since alpha is an algebra map,

    I^N E=0  iff  a(v_1)...a(v_N)=0 for every v_1,...,v_N in V.

One direction evaluates the generators of I^N. The other uses their ideal
span and the fact that further S-actions preserve zero.

### 3.2 Compare with the existing ordered iterate

In a finite dual basis, the coefficients of the existing ordered tensor
iterate theta^[N]:E -> E tensor Q^(tensor N) are exactly the ordered products
of N contraction matrices, with the ordering fixed by the iterate convention.
The tensor basis has one distinct element for every word. Hence

    theta^[N]=0  iff  I^N E=0.

This is an equivalence with the actual N, not just an unspecified nilpotence
bound. It is local and invariant under coefficient/frame changes, so it
joins the existing intrinsic nilpotence API through E1's finite-projective
tensor and restriction comparisons. Integrability is needed to use S; the
existing ordered-iterate/filtration theorem itself can still apply without
integrability and must not be narrowed accidentally.

Equivalently, alpha factors through S/I^N. Its kernel is the annihilator of
the S-module E. Thus the correct scheme-theoretic finite-order condition is
I^N contained in that annihilator. A support statement using only the radical
loses the specified exponent and infinitesimal information. This is an
algebraic statement about the action, not construction of a new spectral
scheme, rigid space or moduli space.

### 3.3 A symmetric tensor projection is not this test

Over k=F_2, take E=k[x,y]/(x^2,y^2), with A and B multiplication by x and y.
They commute, A^2=B^2=0, but AB is nonzero. Give Q basis q_1,q_2 and take
theta=A tensor q_1+B tensor q_2. Its ordered square on 1 contains

    xy tensor (q_1 tensor q_2 + q_2 tensor q_1),

which is nonzero because the two tensor words are independent. Projection
to Sym^2(Q) kills it: the mixed coefficient becomes 2xy. Accordingly I^2 E
is nonzero while I^3 E=0. The symmetric action on S is perfectly well
defined; what fails is testing it by first symmetrizing the ordered iterate.

For k=F_p and E=k[x,y]/(x^p,y^p), the same distinction occurs at order p.
The projection of theta^[p] to E tensor Sym^p(Q) is zero by the binomial
coefficients, but I^p E is nonzero for p>1. The exact ordered bound is 2p-1:
x^(p-1)y^(p-1) is nonzero and every monomial of total degree 2p-1 vanishes.
This gives explicit p=2 and p=3 tests. No operation dividing by N! is allowed
in the arbitrary-characteristic interface.

## 4. The finite image algebra and its correct base-change map

This section refines the action's algebraic API and gives tests to its
spectral-algebra consumer. The actual rigid spectral variety and Heuer's
Picard/twisting construction remain with PadicHodgeTheoryPartIIPadicSimpson.
No second spectral-geometry owner is proposed here.

### 4.1 Finite generation, not an unsupported freeness assertion

Let B be the image of alpha in End_A(E). It is commutative because it is an
image of S; this does not make End_A(E) commutative. E is faithful as a
B-module by the definition of an image subalgebra.

On a chart E=A^r, Q=A^d with r>0, each A_i satisfies its monic characteristic
polynomial of degree r by the native Cayley–Hamilton theorem. Commutativity
allows each monomial to be reduced separately in its exponents. Therefore

    A_1^e_1 ... A_d^e_d,  0<=e_i<r,

span B over A. This is a spanning family of size r^d, not a basis and not
an assertion that B is locally free. For r=0 the image algebra is the zero
algebra and is handled separately. Localization compatibility below permits
the finite-projective chart construction; the generic finite-generation
and sheaf comparisons remain E1 inputs.

The conclusion is finite as an A-module. Calling it coherent requires the
appropriate coherent/noetherian hypotheses and their sheaf theorem. In the
locally noetherian rigid setting of Heuer this distinction is available;
finite generation alone is not a general coherence theorem for arbitrary A.

The coevaluation of Q gives a canonical tensor tau in B tensor_A Q whose
image in End_A(E) tensor_A Q is theta. Injectivity of the latter map follows
from flatness of Q. This is the coefficient section from Heuer's Definition
4.1, with its twist retained. It is not obtained by choosing away a Tate
Galois action.

### 4.2 Arbitrary scalar extension gives a surjection

For A -> A' and the coefficient extension fixed in section 1, the native
finite-projective End base-change isomorphism gives a natural map

    B tensor_A A' -> End_A'(E').

Its image is B', the image algebra of the pulled-back action. In particular
there is a canonical surjection B tensor_A A' -> B'. On generators it is
a(v) tensor 1 -> a'(v tensor 1); its compatibility with tau follows by the
same coevaluation calculation. It is not always injective.

If A' is flat over A, injectivity follows by tensoring the inclusion
B -> End_A(E). Thus the comparison is an isomorphism for flat scalar change,
in particular for localization. More precisely, let C be its A-module
cokernel. Since End_A(E) is finite projective, the exact tensor sequence gives

    ker(B tensor_A A' -> End_A'(E')) = image(Tor_1^A(A',C)),

and the connecting map from this Tor group is injective because the preceding
Tor group for End_A(E) is zero. Hence it identifies with that kernel. The
vanishing of this specific Tor group is enough; neither freeness of E nor
freeness of B alone is enough. The generic Tor/tensor exact sequence is an
imported algebra input, not reconstructed in the Higgs roadmap.

### 4.3 Counterexample with a reduced base and free B

Let A=k[t], E=A^2 and Q=Aq. Put N=E12 and theta=tN tensor q. Then

    B=A[U]/(U^2),   U -> tN.

This presentation is injective: a*Id+b*tN=0 forces a=0 and bt=0, hence b=0.
So B is free of rank two over the reduced ring A and acts faithfully on E.
After t=0, however, the Higgs coefficient is zero, and its image algebra is
just k. The canonical map k[U]/(U^2) -> k kills the nonzero class U.
Thus image formation does not commute with this nonflat base change, even
when both E and B were free before base change.

This can be realized on a relative affine line with theta=tN ds; the
parameter t belongs to the base and ds remains the relative differential.
The example is not an argument replacing the coefficient base change by
an arbitrary absolute differential pullback.

Heuer's Remark 4.2 explicitly permits a larger coherent algebra to act
through a quotient. Our example explains why such an action must not be
forced to be faithful after every base change. It is not a claimed error in
that remark or in the paper.

## 5. Rank bounds and filtration tests

### 5.1 A field rank bound without algebraic closure or division

Let k be any field and dim_k E=r>0. For pairwise commuting nilpotent
endomorphisms A_1,...,A_d, all words of length r vanish.

Proof: their kernels have a nonzero common vector. Start with E and successively
intersect with ker(A_i). The current nonzero subspace is stable under the
remaining A_j by commutativity, and the restriction of a nilpotent operator
to it has a nonzero kernel. Choose a line L in the final common kernel.
On E/L the induced operators commute and are nilpotent. Induction on r
makes every word of length r-1 land in L; one further operator kills it.
This proves the claim and also constructs a complete lowering flag over k.
There is no need for k to be algebraically closed.

The nilpotence interface therefore has bound r for integrable Higgs fields
whose contractions are nilpotent over a field. A single Jordan block of
size r shows the bound is sharp. For E=0 use any positive bound, for example
one, rather than an inadmissible length-zero nilpotence filtration.

For a reduced ring A and locally free E of constant positive rank r, the
same r-bound follows if the contractions on every geometric residue-field
fibre are nilpotent. On a finite free chart each word of length r has all
entries zero in every residue field, hence in every prime quotient; their
entries lie in the nilradical, which is zero. This is a reduced-scheme /
commutative-ring assertion with every prime tested. Translating it to just
classical points of a rigid space needs the separate reduced-affinoid
Jacobson/Nullstellensatz comparison from that consumer; it is not assumed.

Reducedness matters. Over Z/4, the rank-one operator multiplication by 2
has square zero but is nonzero, while its only residue-field fibre is zero.
It cannot satisfy the rank-one bound. This strengthens the existing
nonreduced-line test rather than introducing another nilpotence definition.

### 5.2 The lowering filtration need not be a subbundle filtration

The packet already correctly permits subsheaves with non-locally-free
quotients in a NilpotenceFiltration. Here is a concrete acceptance test.
Over R=k[x,y], on R^2 set

    M = [[xy,-x^2],[y^2,-xy]] = column(x,y) * row(y,-x).

Then M^2=0. With theta=M dx on the affine plane, and zero coefficient in
the dy direction, the field is integrable and has ordered bound two.
Since x and y are coprime, y*a=x*b implies (a,b)=h(x,y). Thus
ker M=R*(x,y). At the origin this inclusion is not a subbundle: every
vector in it has both entries in the maximal ideal, so it contains no
unimodular vector over R_(x,y). A rank-one direct summand would contain such
a vector. Consequently no locally split rank-one lowering subbundle can
exist near the origin, although 0 subset ker M subset R^2 is a valid
length-two filtration by submodules.

This does not contradict the existing nilpotence/filtration theorem. It
rejects strengthening that theorem to Griffiths-style subbundle filtrations.
The finite split Rees construction remains a separate DD.1 interface.

## 6. Integration targets and ownership

These are exact refinement targets, not newly registered IDs or completed
supplier requests. Preserve the old IDs when incorporating them.

- Refine H.0/symmetric-action with the tensor lift, kernel-congruence descent,
  generator uniqueness and Higgs-morphism/S-linearity comparison in section 2.
  Reuse the generic symmetric/tensor/quotient carriers through E1; do not make
  a duplicate generic symmetric-algebra development under Hodge namespaces.
- Add a declaration-sized comparison of H.0/ordered-iterate with I^N E=0,
  followed by its quotient-factorization corollary. Give each the actual N,
  finite-projective Q hypothesis, integrability premise and generator proof.
  The characteristic-two four-dimensional example and characteristic-three
  nine-dimensional example must fail any symmetrized-iterate replacement.
- Give H.0/symmetric-action the bounded spanning-family and coefficient-section
  API. Coordinate its image-algebra statements with the existing Heuer
  spectral-algebra consumer. The geometry, coherent analytic image and
  spectral-variety construction remain there, not in a new Hodge layer.
- State the scalar-base-change comparison as a surjection, with flatness or
  the indicated Tor vanishing for an isomorphism. Keep the tE12 example as
  a regression; no faithful-action-under-all-base-changes claim is permitted.
- Refine the existing nilpotence tests by the rank bound and the non-subbundle
  kernel example. Import generic finite-module, ideal, tensor and sheaf facts.
  The existing no-integrability ordered-filtration theorem stays as general
  as it is; only the symmetric-action comparison requires integrability.

A catalogue search located the Heuer extraction's existing
PadicHodgeTheoryPartIIPadicSimpson spectral-algebra route; the report's review
reconciliation assigns the common twisted Higgs definition here. This
continuation follows that boundary. It does not claim a fresh full atlas
link/duplicate audit or edit the consumer's packet. The predecessor's exact
CR.1/E1/DD.1/D3 and Coleman ownership/edge checks remain historical receipts.

## 7. Fresh sources and library reading

Fresh primary-source scope:

1. Heuer, published Inventiones 240 (2025), 261–312:
   https://link.springer.com/article/10.1007/s00222-025-01321-4 and
   https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf.
   Read Definition 1.2, the action/image description in the introduction,
   Definition 4.1 and Remark 4.2 in full at printed pp.297–298, using publisher
   HTML and parsed PDF formulas. Screenshot requests for those PDF pages
   failed, so no successful rendered-page inspection is claimed. The source
   states the action, image and coefficient section; the detailed algebraic
   decompositions and counterexamples above are derived here, not newly
   attributed paper theorems. The twisting correspondence is not reproved.
2. Liu–Zhu, arXiv:1602.06282v3:
   https://arxiv.org/pdf/1602.06282v3.
   Read Theorem 2.1's nilpotence/tensor/dual clauses on PDF p.7 and Lemma 2.15
   with its printed proof on PDF pp.18–19. This verifies the consumer's need
   for actual nilpotence, not just integrability. Its preceding relative
   p-adic Hodge construction and analytic logarithm hypotheses remain source
   inputs; the generic field argument in section 5 is not a fresh proof of
   that arithmetic lemma. The attempted PDF rendering failed. No collation
   with the published Liu–Zhu article is claimed.

No newly downloaded-byte source hashes, whole-paper reading, new published
error or complete source-finding review is claimed. Existing sourceIssues
and sourceVersions in the packet are unchanged.

Fresh native statements read at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174:

- LinearAlgebra/SymmetricAlgebra/Basic.lean: the actual SymRel,
  symRingCon, quotient, generator, augmentation and commutative-target lift
  and extensionality hypotheses. Blob
  69cc0a56e528354faa6bb272b3adf9943aa4dea5.
- RingTheory/Congruence/Hom.lean: RingCon.ker and ker_apply; the algebra
  section with only Semiring targets, liftₐ, liftₐ_mk, liftₐEquiv and
  Quotient.hom_extₐ. Blob dad8f892e37ee4b5f079e7d683999c172434f64b.
- LinearAlgebra/TensorAlgebra/Basic.lean: hom_ext with a Semiring target,
  induction and range_lift, alongside the lift equations in their native
  context. Blob 57195a795e536d4bb7f250350380c6b506c9b09a.
- LinearAlgebra/Matrix/Charpoly/Basic.lean: characteristic matrix/polynomial,
  base-change identity and the complete aeval_self_charpoly statement/proof
  with arbitrary CommRing coefficients. Blob
  bf61c7c7392d447d564072994f8f88a2952017a4.

The parent reviewed AUDIT-02 report was reread: existing pure/polarized/period
linear algebra is reused; the mixed-Hodge category boundary stays distinct.
This is not a fresh verification of all 43 inherited baseline declarations.
No new baseline records have yet been entered in the canonical packet.

## 8. Executed regressions

Exact modular NumPy arithmetic and exact SymPy polynomial calculations passed:

- all 6,817 pairs of 2 by 2 matrices over F_2 and F_3 were screened;
- 1,033 commuting pairs passed polynomial multiplication and 25,825 bounded
  monomial reconstructions; 97 single-matrix Cayley–Hamilton identities passed;
- the 43 commuting nilpotent pairs passed all 172 length-two word checks;
- 15 Jordan tests gave the sharp rank bound over F_2,F_3,F_5, ranks 1–5;
- 52 ordered words and seven symmetric coefficients checked the p=2,p=3
  symmetrization counterexamples;
- noncommuting, nonreduced rank-one, image-base-change rank, and non-subbundle
  kernel checks passed. Coprimality is checked, but the kernel/direct-summand
  proof remains the explicit argument in section 5, not a numeric assertion.

These are regressions, not the proofs of the general statements or a Lean
elaboration. The standalone reproduction program follows. It requires Python
3, NumPy and SymPy and accesses no repository or network.

```python
from itertools import product
from collections import Counter
import json
import numpy as np
import sympy as sp

counts = Counter()
def power(A, n, p):
    B = np.eye(A.shape[0], dtype=np.int64)
    for _ in range(n): B = (B @ A) % p
    return B
def zero(A, p): return not np.any(A % p)
def charpoly2(A, p):
    return int(np.trace(A)) % p, int(A[0,0]*A[1,1]-A[0,1]*A[1,0]) % p
def remainder2(n, tr, det, p):
    a, b = 1, 0
    for _ in range(n): a, b = -det*b % p, (a+tr*b) % p
    return a, b
def evaluate(poly, A, B, p):
    out = np.zeros_like(A)
    for (i,j), c in poly.items():
        out = (out+c*(power(A,i,p)@power(B,j,p))) % p
    return out
def polymul(f,g,p):
    h = {}
    for (i,j),a in f.items():
        for (k,l),b in g.items():
            h[i+k,j+l] = (h.get((i+k,j+l),0)+a*b) % p
    return h

I = np.eye(2,dtype=np.int64)
results=[]
for p in (2,3):
    matrices=[np.array(v,dtype=np.int64).reshape((2,2)) for v in product(range(p),repeat=4)]
    commute_count=nil_count=0
    for A in matrices:
        tr,det=charpoly2(A,p)
        assert zero(A@A-tr*A+det*I,p)
        counts['CayleyHamilton']+=1
    for A in matrices:
        for B in matrices:
            counts['matrixPairsScreened']+=1
            if not zero(A@B-B@A,p): continue
            commute_count+=1
            f={(0,0):1,(1,0):2,(0,1):1,(1,1):1,(2,0):1}
            g={(0,0):1,(1,0):1,(0,2):1,(1,1):2}
            assert zero(evaluate(polymul(f,g,p),A,B,p)-evaluate(f,A,B,p)@evaluate(g,A,B,p),p)
            counts['commutingPolynomialMultiplicativity']+=1
            ta,da=charpoly2(A,p); tb,db=charpoly2(B,p)
            for i,j in product(range(5),repeat=2):
                a0,a1=remainder2(i,ta,da,p); b0,b1=remainder2(j,tb,db,p)
                reduced=a0*b0*I+a1*b0*A+a0*b1*B+a1*b1*(A@B)
                assert zero(power(A,i,p)@power(B,j,p)-reduced,p)
                counts['boundedMonomialReconstruction']+=1
            if zero(A@A,p) and zero(B@B,p):
                nil_count+=1
                for C,D in product((A,B),repeat=2):
                    assert zero(C@D,p)
                    counts['rankTwoJointNilpotence']+=1
    results.append({'prime':p,'commutingPairs':commute_count,'commutingNilpotentPairs':nil_count})

for p in (2,3,5):
    for r in range(1,6):
        J=np.zeros((r,r),dtype=np.int64)
        for i in range(r-1): J[i,i+1]=1
        assert zero(power(J,r,p),p) and not zero(power(J,r-1,p),p)
        counts['sharpJordanBounds']+=1

for p in (2,3):
    basis=list(product(range(p),repeat=2)); pos={v:i for i,v in enumerate(basis)}
    r=p*p; A=np.zeros((r,r),dtype=np.int64); B=A.copy()
    for j,(a,b) in enumerate(basis):
        if a+1<p: A[pos[a+1,b],j]=1
        if b+1<p: B[pos[a,b+1],j]=1
    assert zero(A@B-B@A,p)
    assert zero(power(A,p,p),p) and zero(power(B,p,p),p)
    assert not zero(power(A,p-1,p)@power(B,p-1,p),p)
    for length in (p,2*p-1):
        words=[]
        for word in product((0,1),repeat=length):
            M=np.eye(r,dtype=np.int64)
            for w in word: M=(M@(A if w==0 else B))%p
            words.append((word,M))
            counts['orderedWordProducts']+=1
        if length==p:
            assert any(not zero(M,p) for _,M in words)
            for i in range(p+1):
                coefficient=sum((M for w,M in words if w.count(0)==i),np.zeros((r,r),dtype=np.int64))
                assert zero(coefficient,p)
                counts['symmetrizedZeroCoefficients']+=1
        else: assert all(zero(M,p) for _,M in words)
    counts['orderedVersusSymmetricCounterexamples']+=1

for p in (2,3,5):
    A=np.array([[0,1],[0,0]],dtype=np.int64); B=A.T
    assert zero(A@A,p) and zero(B@B,p) and not zero(A@B,p)
    assert not zero(A@B-B@A,p)
    counts['noncommutingRejected']+=1
assert 2%4!=0 and (2*2)%4==0
counts['nonreducedRankOneRejected']+=1

t,x,y,u,v=sp.symbols('t x y u v')
N=sp.Matrix([[0,1],[0,0]]); M=t*N; Id=sp.eye(2)
assert M*M==sp.zeros(2)
embedding=sp.Matrix.hstack(sp.Matrix(Id).reshape(4,1),sp.Matrix(M).reshape(4,1))
assert embedding.rank()==2 and embedding.subs(t,0).rank()==1
assert (u*Id+v*M)[0,0]==u and (u*Id+v*M)[0,1]==t*v
counts['imageBaseChangeRanks']+=2
K=sp.Matrix([[x*y,-x*x],[y*y,-x*y]])
c=sp.Matrix([x,y]); row=sp.Matrix([[y,-x]])
assert K==c*row and K*K==sp.zeros(2) and K*c==sp.zeros(2,1)
assert K.rank()==1 and K.subs({x:0,y:0}).rank()==0
assert sp.gcd(x,y)==1
counts['kernelSubbundleSymbolicIdentities']+=6
print(json.dumps({'exactArithmetic':True,'finiteCases':results,'counts':dict(counts),
    'scope':'finite and symbolic regressions; not geometric or Lean verification'},indent=2))
```

## 9. What remains and validation boundary

Canonical integration is not done. Split the refinements into declarations,
source-match each statement at the specificity above, resolve the generic
E1 algebra/sheaf proof leaves, and supply actual native signatures and tests.
The newly read noncommutative-target route is a proof plan; no new global
Higgs or spectral carrier is impersonated by a proposition field. Preserve
the existing intrinsic definitions, all higher-layer scope and all source
findings. Read the archived predecessor for its determinant and period lanes.

The full suggested file was not compiled in this continuation. This machine
had about 3 GB available, below WORKERS.md's 20 GB threshold, and no existing
combined pinned build was available. No project, cache download, library
build or language server was started. No local standard blueprint checker
was run; only the allowed handoff changed, so submission CI must validate
that change. The exact Python/SymPy regression above passed. A successful
handoff submission check is not a mathematical review, blueprint closure or
Lean proof certificate.
