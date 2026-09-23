# EVW (2016): extraction and routing checkpoint

Job #1184; Codex session codex-c83e7a; 2026-09-23. Continuation of
codex-a71f92 / PR1843. Status: **partial**.
This is a mathematical extraction and design input, not a Lean formalization.

## Result and scope

The result JSON has 137 items: 7 library imports, 8 planned
suppliers and 122 missing items, each routed exactly once. It has
243 acyclic internal dependency edges, 39 structured planning API outlines and
117 planned acceptance tests. All19 source findings await independent review.
The inherited36 API outlines now include named roles and recorded uses.

The published paper proves linear-range homological stability for Hurwitz
spaces attached to a finite group and a single generating nonsplitting
conjugacy class. Its central operator is a sum of gluing operations. The
arithmetic argument uses the resulting uniform Betti bound, a
generalized-dihedral class-field dictionary, hyperelliptic monodromy,
Frobenius-fixed component counting, and the trace formula with upper weight
bounds.

For fixed finite abelian odd-prime-power group A, both lower and upper
large-degree class-group densities approach the Cohen–Lenstra mass as the
finite field grows in the supported domain. This extraction retains odd q
and ell not dividing q(q−1). It does not claim a distribution limit for each
fixed q, interchange the two limits, or assert that stabilization commutes
with Frobenius. The coefficient prime L used for etale cohomology is separate
from the statistical prime ell; Proposition 7.8 retains
L>max(|G|,q,n).

## Sources actually read

The complete [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
58 pages, pp.729–786, was read this claim: every section, proof, Table 1 and
references. SHA-256:
`6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6`.
The [publisher record](https://annals.math.princeton.edu/2016/183-3/p01)
confirms DOI 10.4007/annals.2016.183.3.1. The predecessor visually checked printed pages733, 739, 763, 772,
774, 777 and 779 against the extracted text.
Other formulas were checked in the text extraction; a successor should
render the remaining disputed minor indices before confirming them.

Predecessor supplementary reading,2026-09-22 (current reading is detailed below):

- [Romagny–Wewers, Hurwitz spaces](https://perso.univ-rennes1.fr/matthieu.romagny/articles/hurwitz_spaces.pdf):
  §§4.1–4.5, including the deformation, algebraization, descent and moduli
  arguments through Remark 4.15. SHA-256
  `caed858ea899e029b96e3b840e605ad6432cdd1100b93125ef39a0d8abde18a0`.
  This is not a full reading of that paper or the SGA/Dèbes–Douai sources
  it invokes.
- [Achter–Pries, integral monodromy](https://www.math.colostate.edu/~pries/Preprints/00DecPreprints/07finaltrielliptic.pdf):
  introduction, §§2.1–2.4 and §§3.1–3.3, including Theorem 3.4 and
  Corollary 3.5 proofs. SHA-256
  `ef86bd41e5b4d61d199f363985732b4965b59ce8cb180040b86ab99118a6b080`.
  The trielliptic remainder was not read. The current continuation below supplies the family adapter and checks
  the original integral lifting theorem in the required range.

The prerequisite list identifies the unread proof suppliers. Their appearance
in that list is not a claim that their statements have been checked in the
originals. In particular, the Salvetti model, arc connectivity,
isotopy-extension input, stable genus-zero moduli, tame vanishing-cycle
comparison, CL mass formula and Haar-cokernel theorem require continuation.

## Routes and ownership

| Route | Items | Responsibility |
| --- | ---: | --- |
| Inverse Galois, Part II: Hurwitz homological stability | 53 | Braid-orbit ring, graded K-complex, degree bounds, arc resolution, actual stabilization operators and uniform Betti estimate |
| Existing Inverse Galois IG.0/IG.1/IG.3/IG.5 | 23 | Marked/unmarked cover dictionary, arithmetic Hurwitz moduli, ordered compactification and tame comparison adapters |
| Existing Arithmetic Statistics ST.0/ST.5 | 46 | CL probability and finite moments, enlargement estimate, dihedral counting, symplectic orbit calculation and large-q densities |

The Part II is
`InverseGaloisPartIIHurwitzHomologicalStability`, extending
`InverseGaloisAndArithmeticFundamentalGroups`. Its brief states the
coefficient, conjugacy-class and stable-range hypotheses. The existing IG
direction has Hurwitz spaces and specialization, but not this homological
stability argument.

Generic topology is imported from
`tauceti:TauCetiRoadmap/AlgebraicTopology`: Stage 4 owns actual cellular
comparison and cell-count bounds; Stage 5 owns finite-cover descent and the
relevant general homological constructions. No second singular-homology or
finite-cover theory is proposed. General class field theory remains with
FA.4; duality with EDC.2:pairings; upper weights with DWP.7; and trace-formula
integration with SF.2. Curve/Jacobian, Riemann existence and nearby-cycle
foundations must likewise remain with their established owners.

A remaining architectural issue is balanced tensor and Tor for right and
left modules over EVW's noncommutative graded ring. The existing abstract
monoidal Tor functor and commutative tensor products are not evidence that
this complete specialized interface exists. The Part II brief expressly
requires resolving the reusable supplier before implementation; it must not
privately duplicate a general homological-algebra package.

## Library evidence and audit boundary

Pins: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Actual statements read include singular chain/homology functors,
TauCeti.BraidGroup and its universal map, the conjugation quandle,
MonoidAlgebra and its extension map, the SpectralSequence carrier,
SemidirectProduct with inclusions/projection, and the symplectic matrix
carrier. These seven claims are deliberately narrower than the EVW
constructions they support. A spectral-sequence data structure does not
prove convergence; a braid presentation does not provide the configuration
space comparison; rank-two symplectic multiplier calculations do not prove
the general integral similitude orbit theorem.

The predecessor reviewed coverage blob was
`5e708cfc74a51b10e62149113872fe4e00eb5846`; atlas snapshot
`49d2d238f02886ddd5eafc31b00c5649599724a6`.
The predecessor ST and IG documents/stages and the ST.5/IG.3/IG.5 audit entries were
read. The full upstream AlgebraicTopology document was read. FA.4 and
EDC/DWP/SF suppliers were checked in the predecessor claim or its preceding Wood
continuation, with the same ownership files. The JSON records the search
scope and limitations. Negative searches are not assertions that all
70,000 Tau Ceti declarations have been manually inspected.

## Proof spine and conventions

Items 8–26 separate configuration and cover carriers, the braid action,
global versus boundary monodromy, concatenation, nonsplitting, the
braid-orbit monoid algebra and the finite-defect central element.

Items 27–46 keep the full section 4 sequence: graded degree and shifts,
augmentation Tor with correct handedness, K(M), the change-of-rings
sequence, tensor degree bounds, central-torsion estimates, higher Tor
bounds, right-generator null-homotopies, K(R) homology annihilation and
universal-coefficient bounds. The constants are
A1=A(R), A2=A1+deg U, A0=5A1+A2. These are not replaced by an opaque
“homological algebra” item.

Items 47–60 describe the actual truncated semisimplicial coset object,
geometric arc model, stabilizers, connectivity, Borel resolution,
inverse-braid face maps and the stability induction. Keep q<n in the
coset formula. The unmarked quotient calculation has locally constant
finite stabilizers, and is not automatically an application of the free
cover theorem.

Items 61–70 and 117–124 separate arithmetic moduli and descent, the two
infinity-ramification pieces, rational-class descent, relative SNC
compactification, finite-symmetry cohomological comparison and the
rank inequality from mod-L to rational L-adic cohomology.

Items 71–110 and 113–116 cover finite-moment determination, the class-field
counting normalization and every step from hyperelliptic monodromy to a
Frobenius-fixed component and a trace estimate. Item116 now supplies
the exact-family adapter in the stated genus/prime range, through
items126–137. Its coordinate torsor retains the distinguished infinity,
all labels and the involution; the general foundations remain imports.

## Continuation: the exact family and its monodromy

This continuation supplies the mathematical comparison requested by item116,
with the generic curve and stack prerequisites explicitly imported. It also
checks the integral lifting reference in the range needed by EVW. These are
planning proofs, not compiled Lean results.

Let k be algebraically closed with characteristic prime to2ell, ell odd,
n=2g+1≥3, and U=PConf_n(A¹_k). Over U take the smooth proper completion of
y²=prod_i(x−a_i), with the n finite ramification points labelled and the last
ramification point at infinity. Write Htilde_g^sm for the stack of smooth
hyperelliptic double covers with every ramification point labelled. Its
objects retain the deck involution.

The relevant coordinate group is

    B_n={(a,b,d): a,d invertible, d²=a^n},
    (a,b,d)(a′,b′,d′)=(aa′,b+ab′,dd′).

It acts by a_i↦aa_i+b, x↦ax+b, y↦dy. Substitution gives
prod_i(ax+b−(aa_i+b))=a^n prod_i(x−a_i)=d² prod_i(x−a_i).
For odd n, the map (b,t)↦(t²,b,t^n) identifies B_n with Ga⋊Gm, where
(b,t)(b′,t′)=(b+t²b′,tt′). Its inverse is t=d a^(-(n−1)/2): the relation
d²=a^n verifies t²=a and t^n=d over arbitrary base rings. Thus B_n is
smooth and geometrically connected. The central element t=−1 is the
nontrivial deck involution. Replacing B_n by its effective action on roots
would lose exactly the stabilizer the monodromy comparison needs.

There is an equivalence [U/B_n]≃Htilde_g^sm. To prove local essential
surjectivity, take the genus-zero quotient and send the distinguished last
branch point to infinity. The other labelled sections supply local
coordinates (three labelled points trivialize a smooth genus-zero curve).
For a double cover in characteristic different from2, trace/2 splits its
rank-two algebra as O⊕L^(-1). Multiplication is a section of L²; in the
smooth branched case its divisor is the reduced branch divisor. The
relative degree of L is g+1. After trivializing the base line-bundle factor,
the equation has form y²=lambda prod_i(x−a_i), with lambda a unit. An
étale-local square root of lambda makes it monic. This uses the ordinary
line-bundle/relative-curve and descent suppliers, which remain explicit
formalisation prerequisites.

An isomorphism of such covers preserves the distinguished infinity and
therefore has x′=ax+b. Equivariance under the involution preserves the
trace-zero summand, so y′=dy; the polynomial equations force d²=a^n.
Conversely these formulas define an isomorphism. The resulting Isom-sheaf
identity, with the displayed composition law, proves full faithfulness;
descent finishes the stack equivalence. In particular U→Htilde_g^sm is
a representable smooth B_n-torsor with geometrically connected fibres.

Here is the fundamental-group argument without assuming that an arbitrary
dominant map induces a surjection. If f:U→X is a representable smooth
surjection with geometrically connected fibres and Y→X is a connected
finite étale cover, then U_Y→Y is still smooth, surjective and has connected
fibres. A nontrivial clopen partition of U_Y would have disjoint open images
in Y: each fibre lies entirely in one member. Those images partition Y,
contradicting its connectedness. Thus every connected finite étale cover
stays connected, which is the Galois-category criterion for surjectivity
of pi1(U)→pi1(X). The stack instance of this dictionary belongs with
IG.0 and R09.4; it is not supplied by a scheme-only theorem.

[Achter–Pries Theorem3.4](https://www.math.colostate.edu/~pries/Preprints/00DecPreprints/07finaltrielliptic.pdf)
already proves full Sp_(2g)(F_ell) monodromy for the **labelled** stack.
Their definition uses the open locus where Pic^0 is an abelian scheme,
including the compact-type degenerations used in their proof. Passing to
the smooth-curve dense open preserves the image: a connected finite étale
cover of a normal locally noetherian stack is irreducible, and its
nonempty dense open remains connected. The connected B_n-torsor therefore
transfers the full image to U. The image for U is contained in the image
for Conf_n because the latter family pulls back to U. The Weil pairing
bounds both by Sp, giving equality for the unordered polynomial family.

The integral step has a genuine range qualification.
[Vasiu, arXiv:math/0209237v2, Theorem1.3](https://arxiv.org/abs/math/0209237v2)
applies to closed subgroups of the simply connected group Sp. For ell≥5
use condition(a); for ell=3 and g≥2, condition(b) has no SL2/PGL2 normal
factor to check. The monodromy image is closed because it is the compact
image of a profinite group. Thus its integral image is full, and smoothness
of Sp gives full reduction modulo every ell^k. This proves item116 for
n≥5, and for n=3 when ell≥5, enough for the eventual-n assertion in EVW8.8.

At g=1,ell=3 the extra first-congruence-kernel hypothesis cannot be
discarded. Modulo9, the matrices

    x=[[0,1],[8,0]],  y=[[1,7],[6,7]]

generate a subgroup S of order24 inside SL2(Z/9), which has order648.
Reduction S→SL2(F3) is bijective. Its inverse image in SL2(Z3) is therefore
a proper closed subgroup of index27 with full mod3 image. The exact finite
code below verifies the subgroup, every product and inverse, and reduction.
The hyperelliptic monodromy theorem at this exceptional pair is not
disproved; its cited lifting argument needs another input. Source finding
E15 records this distinction. Vasiu's theorem and selected proof steps
were read; the root-system/representation-theory references beneath them
are still recursive reading obligations.

Two other findings in this supporting source matter for a faithful adapter.
E16 concerns the branch functor in AP Lemma2.3: as stacks, it retains a
deck-group gerbe. In the hyperelliptic case a nontrivial deck involution
fixes every labelled ramification point, whereas the labelled P1 target
has trivial automorphism group. The functor cannot be a stack isomorphism;
its irreducibility consequence survives. E17 concerns AP§3.1's general
arithmetic/geometric image quotient. The correct sequence is

    1 → (A∩Sp)/G → A/G → chi_ell(G_F) → 1,

where A and G are the arithmetic and geometric images. Equality with the
cyclotomic image follows once G=Sp. For a counterexample without that
hypothesis, take F=C(t) and E:y²=x³−t²x. Over F(sqrt(t)), put x=t u and
y=t sqrt(t) v to identify E with the constant curve v²=u³−u. The quadratic
automorphism acts as−1 on its odd-primary Tate module. Hence A={±I}, G=1,
and the cyclotomic image is1 because F contains all roots of unity. The
later full-Sp application in AP Corollary3.6 is unaffected. These findings
are unreviewed; no novelty or author notification is claimed.

Two further preliminary statements in Vasiu§2.2 are recorded as E18–E19.
The group commutator in the kernel over R[e]/(e²) is trivial, so it cannot
define the Lie bracket: for GL2, E12 and E21 have nonzero matrix bracket.
The usual two-variable mixed-coefficient construction gives the bracket.
Also, over a general affine base smoothness gives a locally free Lie
module, not necessarily a free one; the additive group of a nontrivial
line bundle inside GL(O⊕L) supplies a counterexample. The Witt-ring base
used in the lifting theorem has the required freeness. These literal
preliminary statements are not used as inputs to the continuation, and
they do not refute the odd-prime symplectic lifting theorem.

The predecessor's item115, E7 explanation and report also had a separate
error: their rare-event group was written as cyclic C_(ell^n). The needed
group is the **elementary abelian** E_n=(C_ell)^n. Then
|Sur(E_n,C_ell)|=ell^n−1, so

    nu_n=(1−ell^(-n))mu+ell^(-n)delta_(E_n)

converges to mu in total variation while its C_ell moment is
2−2ell^(-n). A cyclic group has only ell−1 such surjections and would not
give this example. This is a correction to the checkpoint's witness,
distinct from its still-unreviewed finding about the paper's reverse
moment-convergence inference.

The current worker read all58 pages of the published EVW paper and AP
author-PDF pages1–15 and19–20; AP16–18, on trielliptic monodromy, were not
read. Vasiu PDF pages1–5,9,16,23–28 were read, including Theorem1.3 and
its proof4.7. AP pages5,10,14 and Vasiu page2 were also rendered and checked.
The exact Vasiu PDF hash is recorded in the JSON. AP's publisher PDF has
not been collated; searches and version limitations are recorded with
E15–E17. Generic quotient stacks are imported from R09.4, finite étale
image criteria from IG.0/IG.1, and curve/Picard prerequisites from SF.3.
The current reviewed coverage and these stage descriptions were read;
the fresh input manifest was screened for overlap. No new generic owner
or compiled-library claim is introduced.

The continuation arithmetic program passes3371 assertions:2277 coordinate
group checks,412 polynomial substitution checks,54 moment checks and628
mod9 matrix checks. The predecessor program was re-extracted with its
unchanged hash and all1154 assertions passed. These are finite diagnostics;
the quotient-stack, monodromy and infinite probability arguments above
still require independent mathematical review and formalisation.


## Repair of Lemma 8.4

The following replacement argument is derived here, not attributed to the
authors and not independently reviewed.

Let X and A be finite abelian ell-groups. Write x_i and a_i for their
conjugate partition columns: the numbers of cyclic factors of exponent at
least i. Surjectivity requires x_i≥a_i for every i. Under this condition,

```text
|Sur(X,A)| = product_i ell^(x_i a_(i+1))
                        product_(j=a_(i+1))^(a_i−1) (ell^x_i−ell^j).
```

To prove it, represent homomorphisms by matrices between cyclic factors.
A target row of exponent i has arbitrary reduction modulo ell precisely
in the domain columns of exponent at least i, an x_i-dimensional nested
space. Surjectivity is full row rank modulo ell. Process target rows in
descending exponent order: a_(i+1) rows have already been chosen, so each
new row has ell^x_i−ell^j choices at the appropriate j. Each permitted
mod-ell matrix lifts to exactly ell^(sum_i x_i a_(i+1)) homomorphisms,
because the total Hom exponent is sum_i x_i a_i and the free residue
entries number sum_i x_i(a_i−a_(i+1)). This proves the formula.

Suppose X surjects A and |X|>|A|. Choose the least j with x_j>a_j and
increase a_j by one. This is a valid partition: when j>1,
a_(j−1)=x_(j−1)≥x_j>a_j. It is an enlargement A' of A and remains a
quotient of X. The ratio of surjection counts is

```text
j=1:   ell^x_1 − ell^a_1;
j>1:  (ell^x_j − ell^a_j) ell^x_(j−1)
                           / (ell^x_(j−1) − ell^a_j).
```

Both are at least ell−1. This proves the aggregate equation 8.4.1.
It does not assert that every fixed map X→A lifts through the selected
enlargement map.

Iterate s times while |X|>ell^s|A|. Some s-enlargement has at least
(ell−1)^s times the original surjection count. There are at most p(s+m)
isomorphism classes of s-enlargements when |A|=ell^m. For any
1/(ell−1)<r<1, the convergent Euler product for partitions bounds p(t)r^t
uniformly: its logarithm is bounded by
sum_j r^j/(1−r^j)<infinity. Consequently
p(s+m)/(ell−1)^s tends to zero. Choosing s so that this ratio is at most
epsilon proves exactly the averaged finite-set tail domination of Lemma
8.4. If X does not surject A, its required inequality is automatic.

For the counterexample to the printed pointwise lift step, take
X=A'=C9×C3, A=C3²,
pi(x,y)=(x mod3,y), f(x,y)=(y,x mod3).
A lift would send the order-three element (0,1) to an element whose first
coordinate is 1 modulo 3, which necessarily has order nine. No such lift
exists. Of the 48 surjections X→A, 36 have no lift and 12 have nine lifts
each. Nevertheless |Sur(X,A')|=108≥2·48, exactly as the aggregate lemma
requires.

Two further probability checks are explicit. First c_ell>1/2 for ell≥3:
at ell=3 the first two factors times the elementary tail lower bound give
c_3≥(16/27)(17/18)=136/243>1/2. Thus the contraction constant in
Proposition 8.2 is genuinely below one. Second,
nu_n=(1−ell^(-n))mu+ell^(-n)delta_((C_ell)^n)
converges in total variation to mu, while its C_ell-surjection moment is
2−2ell^(-n). Distribution convergence alone does not justify the converse
moment implication in §8.5.

## Source findings awaiting review

The inherited JSON ledger E1–E14 contains exact locators, short printed fragments,
corrections, evidence and the correction-search history. No finding carries
an independent-review verdict.

The material proof issues are the extra subgroup-diagonal scalar in
equation 6.1.6, the failed pointwise lifting step above, the unsupported
reverse distribution-to-moments implication, the missing sign quotient in
the generic fibre, and the main theorem's broader written characteristic
domain. Other entries record swapped fibre descriptions, a tensor-factor
order, a semisimplicial upper range, the n=1 counting exception, standing
abelian and Sylow hypotheses, an index typo and two introductory
normalization slips.

For the diagonal scalar, projecting U onto the exact-monodromy-Q summand
retains just the terms indexed by c∩Q, each once. In S3 with a
two-element subgroup generated by a transposition, that is coefficient
one, not three. Removing the scalar preserves the subgroup induction.

For the generic fibre, unmarked covers identify a surjection with its
negative. With V=F3² and A=F3 there are eight surjections and four sign
classes. Since −I belongs to the geometric symplectic group, the orbit
sets before and after taking signs are the same; the component calculation
survives once this adapter is supplied. It is essential not to lose the
separate factor two in the arithmetic point-count dictionary.

The publisher page, title/erratum searches and author research pages were
checked. No existing correction to these particular statements was located;
novelty is not established, and not every arXiv version was compared.
The [author's EVW II notice](https://www-users.cse.umn.edu/~cwesterl/docs/preprints.html)
concerns a different preprint and is not used to label the published first
paper withdrawn. Nothing has been sent to the authors.

## Validation and continuation

The current paper checker, deliverable-scope checker and structural audit pass:
unique IDs, 122 missing items routed once, 243 acyclic dependency edges,
route/layer IDs, 39 structured API outlines and 117 planned tests, with no
self-review records. Validation scripts check the planning structure; they do
not certify mathematical correctness.

The reproducible exact finite regression below passes 1,154 assertions:
114 independently enumerated surjection counts, 35 enlargement cases,
484 d-squared cases and 480 null-homotopy cases, together with the lift,
sign-orbit and scalar witnesses. The script's SHA-256 is
`e082a2a04ccff85c0d8f1c5501d80b774fe22e9b5e2c108112835a925cd1eeb9`.
It checks small finite groups and chains, not arithmetic schemes or a
formal proof for arbitrary inputs. The 117 JSON acceptance tests are
separate plans and are not all executed.

No Lean file was authored or compiled. The job's allowed deliverables are
only the result, report and handoff. Status stays partial because the
recursive source graph and the reusable noncommutative Tor ownership
remain open. The explicit family adapter still needs formal supplier
implementations and independent review. The handoff gives the next
reading and implementation boundaries.

### Reproducible finite regression

Run this code with Python 3. It has no third-party dependencies and writes
no files.

```python
"""Exact finite witnesses for EVW16; not Lean or Hurwitz-scheme verification."""
from collections import Counter
from functools import lru_cache
from itertools import product, permutations
from math import prod

checks = 0
def check(statement):
    global checks
    assert statement
    checks += 1

def partitions(n, maximum=None):
    if n == 0:
        yield ()
    else:
        for a in range(min(n, maximum or n), 0, -1):
            for tail in partitions(n-a, a):
                yield (a,)+tail

def columns(partition, length):
    return [sum(a >= i for a in partition) for i in range(1,length+1)]

def sur_formula(ell, domain, target):
    length = max(domain+target+(0,))
    x, a = columns(domain,length), columns(target,length)+[0]
    if any(u < v for u,v in zip(x,a)):
        return 0
    return prod(ell**(x[i]*a[i+1]) * prod(ell**x[i]-ell**j
                for j in range(a[i+1],a[i])) for i in range(length))

def homs(ell, domain, target):
    moduli = tuple(ell**a for a in target)
    elements = list(product(*(range(m) for m in moduli)))
    allowed = [[v for v in elements if all(ell**e*y % m == 0
               for y,m in zip(v,moduli))] for e in domain]
    yield from product(*allowed)

def full_rank_mod_ell(rows, ell, target_rank):
    rows = [list(r) for r in rows]
    rank = 0
    for col in range(target_rank):
        pivot = next((i for i in range(rank,len(rows)) if rows[i][col] % ell),None)
        if pivot is None:
            continue
        rows[rank],rows[pivot] = rows[pivot],rows[rank]
        inv = pow(rows[rank][col],-1,ell)
        rows[rank] = [a*inv % ell for a in rows[rank]]
        for i in range(len(rows)):
            if i != rank:
                scale = rows[i][col]
                rows[i] = [(a-scale*b) % ell for a,b in zip(rows[i],rows[rank])]
        rank += 1
    return rank == target_rank

formula_cases = enlargement_cases = 0
for ell, max_size in [(2,3),(3,3),(5,2)]:
    groups = [p for n in range(max_size+1) for p in partitions(n)]
    for domain,target in product(groups, repeat=2):
        actual = sum(full_rank_mod_ell(images,ell,len(target))
                     for images in homs(ell,domain,target))
        expected = sur_formula(ell,domain,target)
        check(actual == expected)
        formula_cases += 1
        if expected and sum(domain) > sum(target):
            length = max(domain+(0,))+1
            x,a = columns(domain,length),columns(target,length)
            j = next(i for i in range(length) if x[i] > a[i])
            a[j] += 1
            enlarged = tuple(sum(v >= i for v in a) for i in range(1,a[0]+1))
            check(sum(enlarged) == sum(target)+1)
            check(sur_formula(ell,domain,enlarged) >= (ell-1)*expected)
            enlargement_cases += 1

# The pointwise lifting claim fails, although aggregate inequality holds.
ell = 3
X, A = (2,1),(1,1)
pi = lambda z: (z[0] % 3,z[1])
f = ((0,1),(1,0))  # images of the C9 and C3 generators
lifts = [images for images in homs(3,X,X) if tuple(map(pi,images)) == f]
check(not lifts)
check(full_rank_mod_ell(f,3,2))
lift_histogram = Counter()
for images in homs(3,X,A):
    if full_rank_mod_ell(images,3,2):
        count = sum(tuple(map(pi,candidate)) == images
                    for candidate in homs(3,X,X))
        lift_histogram[count] += 1
check(lift_histogram == {0:36,9:12})
check(sur_formula(3,X,X) == 108 and sur_formula(3,X,A) == 48)

# Generic fiber over Fbar: nonzero maps F3^2 -> F3, modulo target inversion.
surjections = set(product(range(3),repeat=2))-{(0,0)}
sign_orbits = {min(v,tuple(-a % 3 for a in v)) for v in surjections}
check(len(surjections) == 8 and len(sign_orbits) == 4)

# Braid monoid and K-complex on the transposition class of S3.
G = list(permutations(range(3)))
identity = tuple(range(3))
mul = lambda x,y: tuple(x[y[i]] for i in range(3))
inv = lambda x: tuple(x.index(i) for i in range(3))
c = [g for g in G if g != identity and mul(g,g) == identity]
conj = lambda g,h: mul(mul(inv(h),g),h)  # EVW convention g^h
def multiply(word):
    value = identity
    for g in word:
        value = mul(value,g)
    return value

@lru_cache(None)
def orbit(word):
    found, frontier = {word}, [word]
    while frontier:
        current = frontier.pop()
        for i in range(len(current)-1):
            g,h = current[i:i+2]
            moved = current[:i]+(mul(mul(g,h),inv(g)),g)+current[i+2:]
            if moved not in found:
                found.add(moved)
                frontier.append(moved)
    return min(found)

def normalize(chain):
    result = Counter()
    for (tuple_part,word),coefficient in chain.items():
        result[(tuple_part,orbit(word))] += coefficient
    return {key:value for key,value in result.items() if value}

def differential(chain):
    result = Counter()
    for (tuple_part,word),coefficient in chain.items():
        for i,g in enumerate(tuple_part):
            removed = conj(g,multiply(tuple_part[i+1:]))
            result[(tuple_part[:i]+tuple_part[i+1:],(removed,)+word)] += coefficient*(-1)**i
    return normalize(result)

def homotopy(chain,g):
    result = Counter()
    for (tuple_part,word),coefficient in chain.items():
        inserted = conj(g,inv(multiply(tuple_part+word)))
        result[((inserted,)+tuple_part,word)] += coefficient
    return normalize(result)

chain_cases = homotopy_cases = 0
words = [()]+[(g,) for g in c]
for q in range(5):
    for tuple_part in product(c,repeat=q):
        for word in words:
            chain = {(tuple_part,word):1}
            check(not differential(differential(chain)))
            chain_cases += 1
            if q <= 3:
                for g in c:
                    left = Counter(differential(homotopy(chain,g)))
                    for key,value in homotopy(differential(chain),g).items():
                        left[key] += value
                    right = normalize({(tuple_part,word+(g,)):1})
                    check(normalize(left) == right)
                    homotopy_cases += 1

# Eq6.1.6 diagonal: only the unique transposition inside Q contributes.
g = c[0]
Q = {identity,g}
inside_terms = sum(h in Q for h in c)
check(inside_terms == 1 and len(c)//inside_terms == 3)

print(f"PASS: {checks} assertions; {formula_cases} exact surjection counts; "
      f"{enlargement_cases} enlargement inequalities; {chain_cases} d^2 checks; "
      f"{homotopy_cases} null-homotopy checks; lift histogram {dict(lift_histogram)}")
```


### Reproducible continuation arithmetic checks

Python3, standard library only. SHA-256:
`68d5311c87f2f1c9889961048e4cfb516664748caa6723d48f01f44de34457f5`. No geometry or Lean compilation is tested.

```python
"""Exact finite diagnostics for the EVW continuation; no geometry is certified."""
from itertools import product, permutations
from fractions import Fraction
import json

counts = {"coordinate": 0, "polynomial": 0, "moment": 0, "matrix": 0}
def check(test, kind):
    assert test
    counts[kind] += 1

# Coordinate group: (b,t)(c,s)=(b+t^2 c,ts); a=t^2,d=t^n.
for p, n in [(3,3), (5,3), (7,5)]:
    B = list(product(range(p), range(1,p)))
    triples = [(a,b,d) for a in range(1,p) for b in range(p)
               for d in range(1,p) if (d*d-pow(a,n,p))%p == 0]
    forward = lambda z: (z[1]**2%p,z[0],pow(z[1],n,p))
    check(set(map(forward,B)) == set(triples), "coordinate")
    for a,b,d in triples:
        t=d*pow(pow(a,(n-1)//2,p),-1,p)%p
        check(forward((b,t)) == (a,b,d), "coordinate")
    for z,w in product(B,repeat=2):
        b,t=z; c,s=w
        v=((b+t*t*c)%p,t*s%p)
        a,b,d=forward(z); A,c,D=forward(w)
        check(forward(v) == (a*A%p,(b+a*c)%p,d*D%p), "coordinate")
    roots=tuple(range(n))
    for b,t in B:
        a,d=t*t%p,pow(t,n,p)
        rr=tuple((a*r+b)%p for r in roots)
        for x in range(p):
            f=1; ff=1
            for r in roots:f=f*(x-r)%p
            for r in rr:ff=ff*(a*x+b-r)%p
            check(ff == d*d*f%p, "polynomial")
    check(forward((0,p-1)) == (1,0,p-1), "coordinate")
    # For even n the sign d/a^(n/2) is a separate mu_2 component.
    signs={d*pow(pow(a,2,p),-1,p)%p for a in range(1,p)
           for d in range(1,p) if (d*d-pow(a,4,p))%p==0}
    check(signs == {1,p-1}, "coordinate")

# Corrected rare-event witness: elementary abelian, not cyclic.
for ell in [3,5,7]:
    for n in range(1,7):
        sur=sum(any(v) for v in product(range(ell),repeat=n))
        check(sur == ell**n-1, "moment")
        eps=Fraction(1,ell**n)
        check((1-eps)+eps*sur == 2-2*eps, "moment")
        check((1-eps)+eps*(ell-1) == 1+eps*(ell-2), "moment")

# SL_2(Z/9) has a proper subgroup surjecting bijectively onto SL_2(F_3).
I=(1,0,0,1)
def mul(a,b,m=9):
    return tuple(x%m for x in (a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],
                              a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3]))
def det(a,m):return (a[0]*a[3]-a[1]*a[2])%m
x=(0,1,8,0); y=(1,7,6,7)
S={I}; todo=[I]
while todo:
    a=todo.pop()
    for g in [x,y]:
        b=mul(a,g)
        if b not in S:S.add(b);todo.append(b)
G={a for a in product(range(9),repeat=4) if det(a,9)==1}
G3={a for a in product(range(3),repeat=4) if det(a,3)==1}
check(len(S)==24 and len(G)==648, "matrix")
check(S < G, "matrix")
check({tuple(t%3 for t in a) for a in S} == G3, "matrix")
check(len(G3)==24, "matrix")
for a,b in product(S,repeat=2):check(mul(a,b) in S, "matrix")
for a in S:
    check(any(mul(a,b)==I and mul(b,a)==I for b in S), "matrix")
    check((tuple(t%3 for t in a)==I) == (a==I), "matrix")
print(json.dumps({"status":"PASS","counts":counts,"total":sum(counts.values()),
                  "sectionGenerators":[x,y],"sectionOrder":len(S),"ambientOrder":len(G)},sort_keys=True))
```
