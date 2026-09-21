# PAPER-SCHROER-23 — source-qualified checkpoint

Status: **partial**. Agent: Codex, session codex-c83e7a, continuing codex-a71f92’s merged [checkpoint #1653](https://github.com/CBirkbeck/tauceti-explorer/pull/1653). Issue: [#1087](https://github.com/CBirkbeck/tauceti-explorer/issues/1087). Read and checked on 2026-09-21.

The result now contains **188 items: 15 library, 8 planned, and 165 missing**. Nine routes own every missing item exactly once. IDs /1–/171 are preserved; /172–/188 expose the inputs to a concrete repair of the previously unrouted canonical-cover comparison /63. The repair and local scheme models are detailed below. This is not a complete dependency closure and does not claim that the paper has been formalized.

## Source and scope

The main source is Schröer's [author PDF](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf), “Third revised version, 19 July 2022”, 52 pages. Its SHA-256 is 828efee55d68b29b5c1617872cc97955bb22374500de721cddd24a7b3c1ed191. All main text, introduction, §§1–15 and references were read. The continuation reread all 52 pages and visually inspected pages 14, 29, 33–44, 46–48 as relevant to tables, matrices and diagrams; specifically the image reads were 14,29,33,34,35,36,37,38,39,40,41,42,43,44,46,47,48. Pages45 and49 have no displayed configuration diagram. This closes the visual-reading gap, not every geometric proof dependency.

The [arXiv v3 PDF](https://arxiv.org/pdf/2004.07025v3), dated 9 August 2022, has SHA-256 ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61. Extracted text after the first page agrees with the author PDF; the first page differs in watermark/indentation. The [publisher record](https://annals.math.princeton.edu/2023/197-1/p01) has the same revision date. The published article is 63 pages; its typeset PDF was not acquired. All page locators here refer to the author version. Do not attribute a preprint typo to the publication without checking that edition.

The arXiv history explicitly records correction of an earlier two-section argument using Nikulin's theory. Use v3, retaining the square-zero integral two-section branch. The claim that every useful two-section is a rational (-2)-curve is not available.

Further primary-source reading and hashes are recorded in the result’s source/prerequisites fields. The earlier worker’s prerequisite reading is preserved as such. This continuation separately reread Fontaine’s PDF pages2–4 visually, Conrad’s Theorems3.2,4.1,4.5 and the proof of4.5, and the Stacks lemmas named below with their proofs. It did not reread every earlier prerequisite passage. The author/arXiv extracted-text comparison was rerun: pages2–52 agree exactly. The original 1989 [Cossec–Dolgachev volume](https://link.springer.com/book/10.1007/978-1-4612-3696-2), not the differently numbered 2025 edition, is the cited book. Its proof text remains an acquisition task. The [exceptional-surfaces preprint](https://arxiv.org/abs/math/0405510) is currently v2 (2021); its full proof likewise remains to be read.

## What the argument requires

The target concerns flat proper finitely presented **algebraic-space** Enriques families over Z. Proposition 5.5 would force the full Picard scheme to be constant, not just the numerical local system. The characteristic-two fiber cannot be exceptional, because such a fiber has no lift modulo 4. The remaining contradiction is Theorem 15.1: a nonexceptional Enriques surface over F₂ cannot have constant full Picard scheme.

The surface proof descends (-2)-curves and genus-one fibrations; counts 25 rational points; transfers Picard constancy to rational Jacobians; classifies eleven elliptic equations and four quasielliptic configurations; reduces fifteen possibilities to eight; and then excludes I₄*, multiple III*, simple III*, and the last two configuration families. The two ten-curve exclusions require actual discriminant forms, not just determinants. The integer argument additionally needs Fontaine's low-degree Hodge obstruction for good reduction over W(F_pbar) at every prime.

All named main-paper results are represented, with multiparts split where their contracts differ. This does not mean that every unnamed construction, imported theorem, or proof-interior branch has been extracted. Those omissions are explicit in the handoff.

## Ownership decisions

| Route | Missing items | Boundary |
| --- | ---: | --- |
| NumericalPicardAndContractionDescent, Part II of AlgebraicModuliForArithmeticGeometry | 13 | General proper-scheme numerical Picard objects and contraction descent, beyond relative Pic⁰ representability |
| GenusOneFibrationsAndRationalEllipticSurfaces, Part II of NeronModelsAndSemistableAbelianVarieties | 52 | Regular genus-one torsor surfaces, rational Jacobians and F₂ classification; import Tate's algorithm |
| EverywhereGoodReductionAndLowDegreeHodgeNumbers, Part II of SmallRamificationAndAbelianVarietyBaseCases | 2 | Fontaine 1993 for higher cohomology; the parent's abelian-variety theorem is insufficient |
| Source for FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1 | 4 | Rank-two Oort–Tate classification and its compatibility with existing Cartier duality |
| Source for WeilConjectures:WC.7 | 4 | Algebraic-cycle realizations and the 25-point example, importing the shared trace/cohomology machinery |
| New EnriquesSurfacesAndIntegralNonexistence | 87 | Enriques-specific geometry, canonical covers, lifting, numerical-lattice realization and the configuration proof |
| Source for InverseGaloisAndArithmeticFundamentalGroups:IG.0 | 1 | Finite étale covers of Spec Z, importing the built number-field theorem |
| Source for AlgebraicModuliForArithmeticGeometry:A0-extension | 1 | Picard rigidification with a section |
| Source for SchemeAndStackFoundations:SF.1 | 1 | Henselian lifting for smooth separated algebraic spaces |

The briefs in the result identify exact final theorems, imports, tests and scope limits. They are proposals for future design, not new stage definitions applied by this worker. In particular, /63 is now accompanied by a proof and singly routed to the Enriques consumer; its Hensel, local-field, Galois-category and Picard suppliers retain their existing owners.

The atlas screen covered full relevant stage descriptions and the relevant reviewed audits: SchemeAndStackFoundations SF.0–SF.6; AlgebraicModuliForArithmeticGeometry A0-extension; Néron R11.1, R11.2, R11.4; R25.3; Weil WC.7; and all five IntegralLattices layers. The broader stage/document screen also covered R07, the remaining Néron and R25 layers, arithmetic fundamental groups, geometry of numbers and EllipticCurves Layer 4. New roadmap definitions, packets and accepted decomposition/restructure records were searched for competing owners. No Enriques or rational-elliptic-surface owner was found. Relevant live audit entries were compared to the local snapshot; absence of an R07.1 audit row is explicitly not evidence of an empty finite-flat library.

SchemeAndStackFoundations:SF.5 owns surface Riemann–Roch, adjunction and Hodge index. A0-extension owns the relative Picard representability foundation. Néron R11.2/R11.4 and the existing StableReduction numerical-type work remain suppliers. The completed IntegralLattices roadmap is imported, never replanned. No proposed route recreates the cohomological point-counting machinery or the elliptic Tate algorithm.

## Pinned-library evidence

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Names alone were not treated as proof of coverage.

The decisive existing implementation is [Tau Ceti's integral lattice library](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice). Actual declarations were read in Basic, Dual/Basic, Discriminant/Group, Discriminant/Quadratic, Overlattice/Isotropic, Overlattice/Index, RootLattice/TypeD/Basic, RootLattice/TypeE, and RootLattice/D8Plus/Isometry. Items /151–/163 cite the particular statements.

The library provides dual pairings, discriminant quotients, even-overlattice/isotropic-subgroup correspondence, index-square formulas, the D_n discriminant quadratic module, and an actual E₈–D₈⁺ isometry. Its quadratic convention is **half-norm B(x,x)/2 modulo Z**. The paper uses **full norm B(x,x) modulo 2Z**. Translation, including negation for the negative-definite geometric root lattice, is a required compatibility theorem. The existence of these abstract structures does not prove Num(Y)≅U⊕E₈(-1) or identify curves with a chosen root basis.

Searches at the pins found no implementation of Enriques surfaces, their conductrix/exceptionality, the Oort–Tate classification, Kodaira classification, or the relevant Picard schemes. Existing affine group schemes/Cartier duality and equation-level elliptic reduction are not claimed absent. General source imports whose exact declarations were not read were not assigned library status.

The continuation also read the exact pinned statements of `mathlib:hensels_lemma` (Mathlib/NumberTheory/Padics/Hensel.lean:461) and `tauceti:NumberField.finrank_eq_one_of_forall_ramificationIdx_eq_one` (TauCeti/NumberTheory/NumberField/Inertia.lean:89). The former supplies the strong norm inequality used for dyadic squares; the latter supplies the arithmetic Minkowski step. Neither is replaced with a new proof plan. All earlier /151–/163 lattice declaration statements were checked again, including determinant/index hypotheses.

The added atlas checks include LocalFieldsRamification Layers1–2 and AUDIT-04, ClassFieldTheory Layer10 and AUDIT-03, IG.0’s reviewed finite-étale audit, and R09.1/A0-extension. The local-field layer already explicitly includes eight dyadic square classes, deep-unit squares with witness5, and the Q₂(√5) unramified example. The pinned power-subgroup file only proves the invertible-exponent regime; its theorem cannot be used with exponent2 at the dyadic prime. Relative ampleness and algebraic-space descent remain R09.1/R09.3 suppliers. The full 211-roadmap portfolio was screened for competing Enriques/twist owners and checked against the current input tree.

## Source precision and proof obligations

These findings concern the public preprint and the stated proof, not an allegation that its main theorem is false.

1. **Lemma 1.1:** require d>0 and retain the numerically trivial twist N: L^d⊗N descends. Setting d=0 makes the printed criterion vacuous. P¹_C considered as a proper R-scheme has geometric Num=Z² with conjugation interchanging the factors, a counterexample to the zero-exponent criterion.

2. **Proposition 3.1:** the equivalence between a rational base point and rational fiber components needs a singular underlying geometric fiber. A smooth elliptic fiber of E×P¹ over F_q is a counterexample to the unrestricted statement. The general graph-descent theorem itself remains separate. Theorem 2.1 is about a **contraction**, not an arbitrary morphism of surfaces.

3. **Rank-two group law, p14:** for f²=af and ab=2, the law is f+g−bfg. Oort–Tate's original introductory construction confirms the minus sign. The printed plus sign fails over Z with a=1,b=2,f=g=1: it gives4, and4²≠4. The regression tests check the corrected law in small finite rings.

4. **Weierstrass construction:** retain a′_i=a_i/t^i. The displayed reciprocal equality in the proof has the wrong exponent. O_J(3E) contracts components disjoint from E; very ampleness/embedding concerns the Weierstrass model, not those components of J.

5. **Weights and counts:** integrality of Frobenius eigenvalues does not survive arbitrary Tate twists; H⁰(Spec F_q,Q_ℓ(1)) has eigenvalue q⁻¹. The cycle-surjectivity hypothesis of Proposition 7.1 is for cycles over F_q, not merely over its algebraic closure. Corollary 7.2 counts F_q-points, not the printed F_p-points.

6. **Proposition 9.3(v):** Br(F₂(t)) is not zero by Tsen. A concrete nontrivial class is the cyclic algebra for F₄(t)/F₂(t) and t: norms have even valuation at t=0, so t is not a norm. A proposed repair is given below. The LLR2018 corrigendum independently emphasizes the distinction Pic⁰(C)⊂Jac(C)(K) over finite-field function fields; its corrections concern Brauer/height formulas, not the geometric-fiber statement used here.

7. **Proposition 9.5:** restriction/orthogonal projection W→L* is not generally an isometry. Replace that assertion by the dual-image argument below.

8. **Section 10:** “additive iff c₄ vanishes” needs the singular-fiber hypothesis Δ=0; a smooth supersingular fiber is not additive. In the twisted-fiber inequality on p31, r_c≤2 and i≤2 with r_a+i+r_c=11 imply r_a≥7, not the displayed r_c≥7.

9. **Proposition 12.3:** after quotienting out the vertical classes and a degree-two class, the generic target is Pic⁰(Y_K), not the full Pic(Y_K), whose degree image is2Z.

10. **Proposition 5.5 — comparison repaired for review:** local canonical covers are related by a torsor; arbitrary choices cannot simply be identified. The four-twist argument below makes a compatible global choice and supplies projective local models. This replaces the previous unexplained obligation /63. It is a mathematical proof offered for independent review, not a claim that the printed preprint contained this argument or that a Lean proof has been checked.

11. **Proposition 9.2 smooth-point choice:** an I_n cycle has no terminal vertex. For the multiplicative case, take any rational component and remove at most two nodes; P¹(F₂) has three points. In an additive tree choose a multiplicity-one terminal component. The nonsplit I₁/I₂ cases use their conductor descriptions. Do not apply a terminal-vertex argument to a cycle.

### Four-twist repair of canonical-cover compatibility

Assume, as in the excluded branch of Proposition5.5, an Enriques family Y/Z with P=Pic^τ=μ₂. Its Cartier-dual cover group is **G=Z/2**, including at2. The following steps use Num constancy before any claim of full Picard constancy.

1. **A local cover defined over Q₂.** Minkowski gives π₁(Spec Z)=1, hence Num is constant. Corollary7.3 then gives #Y(F₂)=25. Its proof uses b₁=0, b₂=ρ=10 and Num alone, so this is not circular with Proposition5.5. A rational point lifts to Y(Z₂), because the family is smooth. For algebraic spaces use a residue-preserving affine étale chart ([Stacks, Lemma68.11.4](https://stacks.math.columbia.edu/tag/0EMV)) and [smooth henselian lifting](https://stacks.math.columbia.edu/tag/0H74). Proposition5.4(ii) now gives a canonical G-cover X₂ over Z₂.

2. **Compare over Q₂.** Put S=Spec Z[1/2]. Proposition5.4(iii) gives a canonical cover X_S because P_S is étale and Pic(S)=0. By the twisting statement, its Q₂-fiber differs from (X₂)_Q₂ by c∈H¹(Q₂,Z/2)=Q₂×/Q₂×². Making the local cover over Z₂ first is essential: this is a Q₂ square class, not an arbitrary class over Frac W(F₂bar).

3. **Separate ramified and unramified factors.** An odd 2-adic unit is a square iff it is1 modulo8 ([Conrad, Theorem4.5](https://kconrad.math.uconn.edu/blurbs/gradnumthy/hensel.pdf)). Necessity is reduction modulo8; sufficiency applies strong Hensel at1 to X²−u, since |1−u|₂≤1/8<1/4=|2|₂². Thus c=(−1)^e2^a5^b modulo squares, uniquely for e,a,b∈{0,1}. The class5 has the finite étale model B=Z₂[z]/(z²−z−1), with involution z↦1−z: its discriminant is5, residue field F₄, and (2z−1)²=5. In particular, it becomes trivial over W(F₂bar). The naive equation s²−5 is not an étale integral model.

4. **Twist without losing odd-prime reduction.** Set u=(−1)^e2^a. Since u is a unit on S, Spec O_S[s]/(s²−u) is a finite étale G-torsor. Twist X_S by this torsor. Its new difference from X₂ over Q₂ is cu=5^b. Twist X₂ by B if b=1, and leave it unchanged if b=0. The two resulting generic covers are isomorphic over Q₂. Both integral constructions are finite étale over the corresponding Y, hence smooth proper over their bases. In particular the global twist still extends over every odd Z_p and now extends over Z₂. There is no global twist by5, which could introduce ramification at5.

5. **Meet the scheme hypothesis.** Fontaine’s [Theorem1 and remark(a)](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf) require smooth proper schemes. This can be justified without assuming every proper algebraic space is projective. For every prime p, Corollary7.3 gives #Y(F_p)=1+10p+p²>0, hence a Z_p-section. The section identifies relative Picard classes with line bundles modulo pullbacks ([Stacks, Lemma99.11.4](https://stacks.math.columbia.edu/tag/0D24)). As 2P=0, multiplication by2 on Pic factors through Num: locally lift a numerical class, double it, and observe that different lifts have the same double. Choose the numerical class of an ample bundle on the closed Enriques surface and extend it through constant Num. This produces a line bundle on Y_Z_p numerically equal to twice that ample class on the closed fiber, hence ample there. [Stacks, Lemma71.15.3](https://stacks.math.columbia.edu/tag/0D3A) (or [0D3D](https://stacks.math.columbia.edu/tag/0D3D)) spreads ampleness and scheme representability to a neighborhood of the closed point, which is all of Spec Z_p. Thus Y_Z_p is projective. Each twisted cover is finite over this scheme, so its pullback ample bundle makes it projective too.

The chosen generic cover is a K3 surface, with h^{2,0}=1, and now has a smooth proper scheme model at every prime. This contradicts Fontaine and excludes P=μ₂. The remaining P=Z/2 branch of Proposition5.5 splits over Z by π₁(Spec Z)=1 as in the source. The geometric canonical-cover/K3 input, finite-field cohomology and Fontaine’s theorem remain genuine imported prerequisites; this repair does not claim their unread original proofs have been extracted.

Items /172–/188 make these steps individually reviewable. Source proofs are distinguished from the worker’s deductions: the four-twist assembly and local projectivity application are this continuation’s arguments. No appeal to H²(Z₂,Z/2)=0, to Br(F₂(t))=0, or to a dyadic e<p−1 uniqueness theorem occurs.

### Proposed repair of Mordell–Weil descent

Let Y/F₂ have constant full Picard scheme, and choose an F₂-defined two-section R. Such a choice follows by taking the two-section supplied by Proposition 4.1 (a (-2)-curve or half-fiber) and applying Theorem 5.6.

Over the algebraic closure of constants, Tsen applies to F₂bar(t). The geometric generic Picard functor's rational points then equal actual degree-zero line-bundle classes. Every such line bundle extends from the generic curve to the regular surface: close a representing divisor and use regularity to make its Weil divisor Cartier. Every surface divisor has even generic degree, since the fiber class is twice a half-fiber. Consequently
L ↦ (L−(deg(L|generic)/2)R)|generic
is a surjective Galois-equivariant map from Pic(Ybar) to MW(Jbar/P¹bar).

The source has trivial Galois action by full Picard constancy, hence the target does too. Fixed geometric sections descend, giving MW(J/P¹)=MW(Jbar/P¹bar). No vanishing of Br(F₂(t)) is used. This is a proposed mathematical repair for independent review, not a checked Lean proof.

### Proposed repair of the D_n projection argument

Let L be the negative D_n root sublattice in an even unimodular lattice W, and let P be the image of W under orthogonal projection to L_Q, identified with a subgroup of L*. If no section meets either spinor terminal component, the generating-section and vertical-component formulas give
P⊂L+Zv,
where v is the vector fundamental weight, with v²=−1.

For x∈L_Q, pairing with the projected image of W equals pairing with W. Thus
P^dual = W*∩L_Q = W∩L_Q.
Since v pairs integrally with L and has integral square, it pairs integrally with L+Zv, hence with P. Therefore v∈W. Its odd square contradicts evenness. No projection-isometry assertion is needed.

For IV and IV*, if all sections meet only the identity component, the root sublattice is an orthogonal summand in the source's generating presentation; its discriminant3 contradicts unimodularity. The geometric generation statements and root identifications remain separate proof obligations. The repair is recorded for review, not as new formalized library coverage.

## Exact computational checks

The original reproducible standard-library Python script follows. It was rerun and passed **4,949 assertions**. A second script below passed **64 further assertions** (5,013 total).

It enumerates all nonsingular Weierstrass coefficient tuples over F₂ and the eight admissible coordinate changes, verifies five disjoint isomorphism classes, and checks point counts. It checks degrees, discriminants, functional j and the smooth t=1 fiber for all eleven displayed equations.

For the two lattice calculations, the first eight coordinates are C₁,…,C₈ with negative D₈ Gram matrix. Matrix14 adds R²=−2, R·C₄=1, R·F=1; matrix16 adds U. Exact rational inversion gives determinant−4, four dual residue classes, vector norm−1 and two isotropic spinor classes of norm−2. It also checks the square2n of C₈*+nR*+F* in the first configuration. These tests verify the transcribed matrices, not the existence of the geometric curves or the entire configuration proof.

Not checked computationally: minimal resolutions/Kodaira symbols, the full 2²¹ coefficient search, equivalence/completeness of Lang's classification, or all geometric graph-exclusion cases. Passing algebraic tests does not fill those gaps.

```python
"""Exact finite checks for SCH23; not a replacement for geometric proofs."""
from fractions import Fraction as Q
from itertools import product

checks = 0
def check(p):
    global checks
    assert p
    checks += 1

def pmul(a, b):
    z = 0
    while b:
        if b & 1: z ^= a
        a <<= 1
        b >>= 1
    return z

def ppow(a, n):
    z = 1
    for _ in range(n): z = pmul(z, a)
    return z

def invs(c):
    a1, a2, a3, a4, a6 = c
    b2 = ppow(a1, 2)
    b4 = pmul(a1, a3)
    b6 = ppow(a3, 2)
    b8 = pmul(ppow(a1, 2), a6) ^ pmul(pmul(a1, a3), a4) ^ pmul(a2, ppow(a3, 2)) ^ ppow(a4, 2)
    delta = pmul(ppow(b2, 2), b8) ^ ppow(b6, 2) ^ pmul(pmul(b2, b4), b6)
    return ppow(a1, 4), delta

def peval(a, t):
    return (a & 1) if t == 0 else (a.bit_count() % 2)

def point_count(c):
    a1, a2, a3, a4, a6 = c
    return 1 + sum((y*y+a1*x*y+a3*y-x*x*x-a2*x*x-a4*x-a6) % 2 == 0
                   for x, y in product(range(2), repeat=2))

E = {1:(0,1,1,0,1),2:(1,1,0,1,0),3:(0,0,1,0,0),4:(1,0,0,0,1),5:(0,1,1,0,0)}
# E4 above is isomorphic to the source's y²+xy=x³+x; use the source literally.
E[4] = (1,0,0,1,0)
for n,c in E.items():
    check(invs(c)[1] == 1)
    check(point_count(c) == n)

def change(c,r,s,t):
    a1,a2,a3,a4,a6=c
    return tuple(v%2 for v in (a1,a2+s*a1+r+s*s,a3+r*a1,
        a4+s*a3+(t+r*s)*a1+r*r,
        a6+r*a4+r*r*a2+r*r*r+t*a3+r*t*a1+t*t))

smooth = {c for c in product(range(2),repeat=5) if invs(c)[1] == 1}
orbits = [{change(c,*rst) for rst in product(range(2),repeat=3)} for c in E.values()]
check(set().union(*orbits) == smooth)
check(sum(map(len,orbits)) == len(smooth))
for c in smooth:
    for rst in product(range(2), repeat=3):
        check(point_count(change(c,*rst)) == point_count(c))

# a1,a2,a3,a4,a6; expected delta and j numerator/denominator, Table10.4/10.5.
models = [
 ((2,2,4,16,96),256,16,1),
 ((2,0,0,8,96),7168,4,7),
 ((2,0,0,8,0),1024,4,1),
 ((2,4,0,8,0),1024,4,1),
 ((2,0,0,0,32),2048,2,1),
 ((2,4,0,0,32),2048,2,1),
 ((2,2,0,16,0),4096,1,1),
 ((2,2,2,2,0),16,256,1),
 ((0,2,4,0,0),256,0,1),
 ((0,0,4,8,0),256,0,1),
 ((0,0,4,0,0),256,0,1),
]
smooth_at_one=[4,4,4,2,4,2,2,4,5,5,3]
for (c,d,jnum,jden),n in zip(models,smooth_at_one):
    c4,delta=invs(c)
    check(delta == d)
    check(pmul(ppow(c4,3),jden) == pmul(delta,jnum))
    check(point_count(tuple(peval(a,1) for a in c)) == n)
    check(all(a.bit_length()-1 <= i for a,i in zip(c,[1,2,3,4,6])))

def matmul(a,b):
    return [[sum(x*y for x,y in zip(row,col)) for col in zip(*b)] for row in a]

def inverse_det(a):
    n=len(a); b=[[Q(x) for x in row]+[Q(i==j) for j in range(n)] for i,row in enumerate(a)]
    det=Q(1)
    for i in range(n):
        p=next(j for j in range(i,n) if b[j][i])
        if p!=i: b[p],b[i]=b[i],b[p];det=-det
        v=b[i][i];det*=v;b[i]=[x/v for x in b[i]]
        for j in range(n):
            if j!=i:
                v=b[j][i];b[j]=[x-v*y for x,y in zip(b[j],b[i])]
    return [r[n:] for r in b],det

def gram(kind):
    a=[[0]*10 for _ in range(10)]
    for i in range(8): a[i][i]=-2
    for i,j in [(0,1),(1,2),(2,3),(3,4),(4,5),(5,6),(5,7),(8,9)]:a[i][j]=a[j][i]=1
    if kind==14:a[8][8]=-2;a[3][8]=a[8][3]=1
    return a

for kind in [14,16]:
    a=gram(kind);b,det=inverse_det(a)
    check(det == -4)
    check(matmul(a,b) == [[Q(i==j) for j in range(10)] for i in range(10)])
    check(all((2*x).denominator==1 for row in b for x in row))
    cols=[tuple(row[j]%1 for row in b) for j in range(10)]
    check(len(set(cols))==4)
    check(cols[0]==cols[2]==cols[4])
    check(tuple((x+y)%1 for x,y in zip(cols[6],cols[7]))==cols[0])
    check((b[0][0],b[6][6],b[7][7])==(-1,-2,-2))
    check(b[0][6]==b[0][7]==Q(-1,2))
    # Only the two spinor classes are nonzero isotropic for full-norm mod2.
    check([i for i in [0,6,7] if b[i][i]%2==0]==[6,7])
    if kind==14:
        check(b[8][8]==b[6][8]==b[7][8]==0)
        check(b[7][9]==2 and b[8][9]==1 and b[9][9]==-2)
        for n in range(20):
            w=[Q(0)]*10;w[7]=1;w[8]=n;w[9]=1
            check(sum(w[i]*b[i][j]*w[j] for i,j in product(range(10),repeat=2))==2*n)

# Rank-two group law: closure, exponent two and associativity in finite rings.
for m in range(2,18):
    for a,b in product(range(m),repeat=2):
        if (a*b-2)%m:continue
        pts=[f for f in range(m) if (f*f-a*f)%m==0]
        def op(f,g):return (f+g-b*f*g)%m
        for f,g in product(pts,repeat=2):check(op(f,g) in pts)
        for f in pts:check(op(f,f)==0 and op(f,0)==f)
        for f,g,h in product(pts,repeat=3):check(op(op(f,g),h)==op(f,op(g,h)))
check(4*4 != 4)  # printed positive sign fails for a=1,b=2,f=g=1 over Z.

print(f'SCH23: {checks} exact assertions passed; five F2 elliptic isomorphism classes, eleven table invariants, matrices14/16, corrected rank-two law. No Kodaira resolution or classification completeness claim.')
```

### Dyadic classes and incidence-case checks

The second script enumerates all eight dyadic square-class representatives and verifies that exactly one of the four globally allowed twists sends each to {1,5}. It checks the square residues modulo2^k for3≤k≤12 and the correct integral polynomial for the unramified class. These finite checks accompany, rather than replace, the Hensel proof above.

For the visually read diagrams it verifies the primitive multiplicity vector lies in the kernel of the negative intersection matrix for I₄*, III*, II*, IV*, I₁* and I₂*. It then checks the finite incidence lists:15 weighted-degree-two vectors give six I₄* graph-symmetry orbits, and6 vectors give four III* orbits, exactly /134 and /144. This verifies the numerical cases before geometric exclusions, not the existence of all proposed curves or all contradiction branches.

```python
from itertools import product
from fractions import Fraction
checks=0
def check(b):
 global checks
 assert b
 checks+=1
# Square class represented by valuation parity and odd residue modulo 8.
def cls(n):
 n=Fraction(n);v=0
 while n.numerator%2==0:n/=2;v+=1
 while n.denominator%2==0:n*=2;v-=1
 return v%2,(n.numerator*pow(n.denominator,-1,8))%8
reps=[s*2**a*5**b for s,a,b in product([1,-1],range(2),range(2))]
check(len(set(map(cls,reps)))==8)
for c in reps:
 good=[u for u in [1,-1,2,-2] if cls(c*u) in [cls(1),cls(5)]]
 check(len(good)==1)
check(cls(5)!=cls(1))
check(cls(3)==cls(-5))
for k in range(3,13):
 m=2**k
 squares={x*x%m for x in range(1,m,2)}
 check(squares=={x for x in range(1,m,8)})
# z^2-z-1 gives an etale quadratic algebra; no root over F2.
for z in range(2):
 check((z*z-z-1)%2==1)
 check((2*z-1)%2==1)
check(1+4==5)
# Exact gram matrices for the diagrams inspected in the author PDF.
graphs={
 'I4*':(9,[(0,2),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(6,8)],[1,1,2,2,2,2,2,1,1]),
 'III*':(8,[(0,1),(1,3),(3,4),(4,5),(5,6),(6,7),(2,4)],[1,2,2,3,4,3,2,1]),
 'II*':(9,[(1,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,0),(2,4)],[1,2,3,4,6,5,4,3,2]),
 'IV*':(7,[(1,3),(3,4),(4,5),(5,6),(4,2),(2,0)],[1,1,2,2,3,2,1]),
 'I1*':(6,[(0,2),(1,2),(2,3),(3,4),(3,5)],[1,1,2,2,1,1]),
 'I2*':(7,[(0,2),(1,2),(2,3),(3,4),(4,5),(4,6)],[1,1,2,2,2,1,1])}
for n,e,m in graphs.values():
 a=[[-2*int(i==j) for j in range(n)] for i in range(n)]
 for i,j in e:a[i][j]=a[j][i]=1
 check(all(sum(a[i][j]*m[j] for j in range(n))==0 for i in range(n)))
 check(min(m)==1 and len(e)==n-1)
def permutation(n,*pairs):
 p=list(range(n))
 for a,b in pairs:p[a],p[b]=p[b],p[a]
 return tuple(p)
def group(n,gens):
 g={tuple(range(n))}
 while True:
  h=g|{tuple(p[q[i]] for i in range(n)) for p in g for q in gens}
  if h==g:return g
  g=h
def vector(n,*entries):
 v=[0]*n
 for i,x in entries:v[i]=x
 return tuple(v)
for name,gens,expected in [
 ('I4*',[permutation(9,(0,1)),permutation(9,(7,8)),(7,8,6,5,4,3,2,0,1)],
 [(2,),(3,),(4,),(0,1),(0,8),(0,0)]),
 ('III*',[(7,6,2,5,4,3,1,0)],[(2,),(0,7),(1,),(0,0)])]:
 n,e,m=graphs[name];g=group(n,gens);edges={tuple(sorted(x)) for x in e}
 for p in g:
  check({tuple(sorted((p[i],p[j]))) for i,j in e}==edges)
  check(tuple(m[p[i]] for i in range(n))==tuple(m))
 def orbit(v):return {tuple(v[p[i]] for i in range(n)) for p in g}
 solutions={v for v in product(range(3),repeat=n) if sum(a*b for a,b in zip(v,m))==2}
 orbits=set()
 for v in solutions:orbits.add(min(orbit(v)))
 representatives=[]
 for inds in expected:
  v=[0]*n
  if len(inds)==1:v[inds[0]]=1
  else:
   for i in inds:v[i]+=1
  representatives.append(tuple(v))
 check(len(orbits)==len(expected))
 check({min(orbit(v)) for v in representatives}==orbits)
 check(set.union(*(orbit(v) for v in representatives))==solutions)
 print(name,len(solutions),'incidence vectors',len(orbits),'orbits')
print('SCH23 continuation:',checks,'exact assertions passed; dyadic classes and graph incidence lists only.')
```

## Validation and next work

The repository's paper checker passes. Additional structural checks verify unique IDs, route multiplicity, three tests and an API for every definition/construction, valid galaxy/parent/stage IDs, and exact-once routing of all165 missing items. All17 added IDs are appended to the unchanged /1–/171 identity set. Public source URLs and hashes are recorded without local paths. No Lean file is a deliverable for this paper job; no Lean compilation was attempted or claimed.

Resume from the handoff: independently check the concrete /63 repair, then acquire the outstanding primary-source prerequisites, especially Lang2000. Preserve stable item IDs; append missing atomic construction and proof-input items instead of renumbering existing ones. An independent reader must validate the proposed source repairs and remaining diagram/case interiors before the status can become complete.
