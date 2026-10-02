# #3378: explicit projective quadratic pinching — 2 October 2026

**Partial mathematical checkpoint, not a completed blueprint or Lean implementation.** Agent: ChatGPT Pro — cp-20261002-sr-c72e81. Job: DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII. Claim comment 5960141363; winning-claim confirmation 5960144999. Publication parent: `420d642c046a3f3931a40e7897d077d0c3b952c9`.

This handoff continues the merged affine-normalization checkpoint, PR #5843. Its complete proofs of the two-generator presentation, syzygies, localization, integral closure, quotient module, nonflatness and duality, together with its reproducible program and all remaining obligations, are preserved in the [previous handoff at the publication parent](https://github.com/CBirkbeck/tauceti-explorer/blob/420d642c046a3f3931a40e7897d077d0c3b952c9/research/blueprint/handoff/DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII.md).

**Only this handoff changes.** The canonical roadmap, packet, reader and suggested file retain their contents and statuses: the reader's 182 declarations, seven partial stages, 78 source routes, 21 source findings, reserved Ferrand key, requests and planets are not rewritten or marked complete. The older packet summary still says 163 declarations; this is inherited stale summary text, not a new count or a reason to delete nodes. The mathematical continuation below has not yet been integrated into those four canonical files. There is no Lean code in this handoff.

The new contribution is an explicit projective realization of the one-component quadratic pinch, with both charts and their inverses, its normalization and conductor, the actual coherent-cohomology quotient, and a direct bridge to the existing Weierstrass point-count convention. The point-count bridge does not depend on completing scheme foundations. The geometric proof is a specialized calculation; no second Ferrand construction, general normalization theory, arithmetic-genus definition or point-count carrier is proposed.

## 1. Fixed objects, signs and existing owners

Let k be any field and let a,b belong to k. Put

    B = k[t],       q(t) = t^2 + a t + b,
    A = k + q B,    E = B/(q),       L = E/k,
    F(U,V) = V^2 + a U V + b U^2 - U^3.

Here A is the existing native `QuadraticPinch.algebra`, not a new abstract ring with prescribed invariants. L is the quotient of k-vector spaces by the constant subspace; it is not a quotient ring. The existing presentation is A ≅ k[U,V]/(F), U ↦ q, V ↦ tq. Its residue map epsilon:A→k has kernel m=qB=(U,V), and the conductor of A⊂B is qB. These are the precise predecessor inputs.

Let C be the projective plane cubic, with homogeneous coordinates [U:V:Z], defined by

    Fh(U,V,Z) = V^2 Z + a U V Z + b U^2 Z - U^3 = 0.

This is the projective equation of the existing Weierstrass datum with coefficient tuple

    (a1,a2,a3,a4,a6) = (a,-b,0,0,0).

The sign of a2 is **minus** b. Its discriminant is zero. It is a proper curve of arithmetic genus one, not a smooth elliptic curve and not, by itself, a regular generic curve of the roadmap's genus-one-fibration definition.

Write P=[0:0:1] for the pinched point and O=[0:1:0] for the point at infinity. On P1 use homogeneous coordinates [S:T] and set Q(S,T)=S^2+aST+bT^2. General scheme/Proj/coherent-cohomology interfaces stay with SchemeAndStackFoundations:SF.3 and StableReduction Layers 1–2. The reserved owner `NeronModelsAndSemistableAbelianVarietiesPartII:key/ferrand-pushouts` and all its nonradicial cases remain unchanged.

## 2. Point parametrization independent of scheme infrastructure

The affine equation is y^2+a x y+b x^2=x^3. If x=0, the field property gives y=0. If x≠0, set t=y/x and divide the equation by x^2. This gives q(t)=x, hence y=tq(t). Conversely, every t with q(t)≠0 gives the nonsingular affine solution (q(t),tq(t)), and y/x recovers t. Consequently there is an actual bijection

    {affine equation solutions} ≅ {t in k : q(t) ≠ 0} disjoint-union {P}.

The maps, not just the dimensions or cardinalities, are specified here. The inverse sends P=(0,0) to the exceptional summand; on the other summand it is y/x. No division is attempted at P, and no separability hypothesis is needed. The coordinate proof also identifies all non-P affine solutions with the open D(q) of the normalization.

Over a finite field of cardinality Q0, let r be the number of **distinct field roots** of q. The native defining equation in the pinned Tau Ceti `PointCount.lean` is

    W.pointCount = Nat.card {affine equation solutions} + 1.

The final one is O, and the singular point P is already in the solution subtype. Thus a subtraction-free natural-number target is

    W.pointCount + r = Q0 + 2.                              (PC)

Equivalently W.pointCount=Q0+2-r. The built integer-valued `frobeniusTrace` therefore equals r-1. These are comparisons with existing definitions, not new definitions of either invariant. In contrast, Mathlib's nonsingular-point group omits P, and has one fewer point. The built `pointCount_eq_card_point` theorem requires `IsElliptic` and cannot be applied to this singular equation.

For k=F2, the coefficient pairs (a,b)=(1,0),(1,1),(0,0) give counts 2,4,3 respectively, and the corresponding integer defects are 1,-1,0. The value r counts distinct roots, so the double root of t^2 contributes one, not two.

This is a useful first native integration target: construct the displayed subtype equivalence, its forward/inverse evaluation API, and prove (PC) using finite-subtype cardinalities and the already built point-count defining equation. It needs field algebra and finite counting, not a new Scheme carrier or an imported theorem saying that the desired point count holds.

## 3. The actual projective normalization morphism

Define

    nu:P1 → C,        [S:T] ↦ [T Q(S,T) : S Q(S,T) : T^3].    (N)

These are three sections of O(3). They have no simultaneous zero: if T is nonzero, T^3 is nonzero; if T=0, S is nonzero and SQ=S^3 is nonzero. The same argument in homogeneous prime ideals proves the generating-open condition for the scheme morphism, not merely its assertion on k-rational points. Substitution gives

    Fh(TQ,SQ,T^3) = T^3 Q^2 (S^2+aST+bT^2-Q) = 0.

Thus the morphism factors through the actual closed cubic subscheme.

### 3.1 The finite chart

The inverse image of D(Z) is D(T). Set t=S/T. The coordinate map is exactly

    U/Z ↦ q(t),       V/Z ↦ t q(t),

so D(Z)∩C is Spec A, and the map from Spec B is the existing finite affine normalization. This identifies the map with the predecessor, rather than inventing a second normalization with unspecified comparison.

### 3.2 The infinity chart and an explicit inverse

On D(V) put u=U/V and z=Z/V. Its coordinate ring is

    D = k[u,z]/(z h(u)-u^3),       h(u)=1+a u+b u^2.

Define polynomials

    e(u)=1-a u+(a^2-b)u^2,
    c(u)=a^3-2ab+(a^2 b-b^2)u.

Direct expansion gives h e=1+u^3 c, so in D

    h(e-z c)=1.

In particular h is a unit, without assuming u is a unit. The homomorphisms

    D → k[u,1/h],       u ↦ u,       z ↦ u^3/h,
    k[u,1/h] → D,       u ↦ u,       1/h ↦ e-z c

are inverse: the first composition is immediate on u and 1/h; the other sends z to u^3(e-zc)=zh(e-zc)=z. These identities hold in characteristics two and three as well.

The inverse image nu^-1(D(V)) is D(SQ). There S is nonzero; setting u=T/S identifies it with Spec k[u,1/h]. The pullback in (N) sends z to u^3/h. Thus nu is an isomorphism on this whole chart. At O we have u=z=0, and the inverse point on P1 is [1:0]. The partial derivative dFh/dZ equals one at O, so infinity is smooth.

### 3.3 Cover, integrality and normalization

D(Z) and D(V) cover C: a homogeneous prime containing Z and V would contain U^3, hence U, contrary to the irrelevant-ideal condition. The two chart rings are domains, and their intersection is nonempty, as witnessed by the common rational function field. Their union is therefore reduced and irreducible. Repeating the same computation over every field extension K/k proves that C is geometrically integral. Do not replace this argument by nonemptiness of the intersection's k-points: that intersection can have no F2-point.

On the target affine cover, nu is respectively the finite map A⊂B and an isomorphism. Hence nu is finite. Its dense open D(U) on the first chart is an isomorphism by the predecessor's localization calculation. Since P1 is normal, this finite birational morphism is the normalization. In particular it is surjective, but it need not be surjective on k-rational points: the nonsplit conductor point P has no rational preimage.

The equation realizes C as a closed subscheme of P2, so C is projective and proper. This proves the specialized projective step directly; it does not rely on the incorrect implication that every topological quotient of a proper space is a proper scheme, nor on a generic projective-normalization theorem without its hypotheses.

## 4. The full conductor and the Ferrand comparison

The predecessor identifies the conductor on D(Z) as m=qB⊂A. On D(V), nu is an isomorphism, so the conductor is the unit ideal. These local ideals agree on the overlap, giving exactly the closed point i:Spec k→C at P. Its inverse image is the **scheme** Spec E, since

    B tensor_A k = B/mB = B/(q).

This retains the double point when q has a repeated root. No replacement of E by its reduction is permitted. Infinity does not belong to this fiber because Q(1,0)=1.

The diagram E→P1, E→Spec k, P1→C, Spec k→C is cartesian and is the Ferrand geometric and categorical pushout. To see the comparison with the existing general owner, check its scheme existence hypothesis: all of E is contained in the affine open D(T) of P1. The source map E→P1 is closed and E→Spec k is finite. On that affine open, its ring pullback is exactly A=k+qB; off E the complement is unchanged, and the infinity chart above gives the same gluing. Uniqueness of the existing pushout identifies the constructed scheme with C and identifies its sheaf fiber-product map. This is a consumer of `G.0/global-existence` and the reserved key, not a new general pushout node.

For the repeated-root algebra E, do not apply `G.1/quadratic-point-proper-pushout` as currently stated: that theorem's input E is a **field extension**. The applicable owner here is the general finite closed pinching theorem, with the affine-neighborhood condition verified as above. The separable irreducible case specializes to the existing single-field-point theorem.

## 5. Coherent cohomology with its actual quotient map

On Spec A the map B→L is reduction modulo q followed by quotient by constants. Its kernel is A, it is surjective, and it is A-linear when A acts on L through epsilon:A→k. This is the predecessor's quotient-module map, intrinsically expressed without a basis. On the complementary infinity chart its target is zero. Gluing gives the actual exact sequence of coherent O_C-modules

    0 → O_C → nu_* O_P1 → i_* L → 0.                        (H)

The maps on the overlap agree because the support of L is P, outside D(V). Exactness is checked on the two affine charts. Finiteness of nu implies that nu_*O_P1 is coherent and that its higher direct images vanish. The latter is the standard affine-morphism theorem; it is not true because nu is flat, and the predecessor explicitly shows its failure of flatness at P.

Use H^0(P1,O)=k and H^1(P1,O)=0. In the long exact sequence of (H), the map k→L is zero, since a constant is zero modulo constants. Thus the structure map identifies H^0(C,O_C) with k, and the connecting map gives a natural k-linear isomorphism

    delta:L = E/k → H^1(C,O_C).

The quotient has dimension one, so p_a(C)=1. The coordinate t supplies the basis [t] of E/k; composing with it gives a displayed k-basis of H^1. That basis depends on the chosen coordinate and is not an intrinsic trivialization invariant under every change of coordinate. The original `quadratic-pinch-i1-genus` statement's natural E/k comparison is retained.

For every field extension K/k, tensoring the affine maps is exact, q stays monic quadratic, and all equations and both charts base-change to the identical construction over K. Hence nu_K is its normalization by the same proof. Applying (H) over K and the naturality of its connecting map gives the actual H^0 and H^1 field-base-change isomorphisms. This proves compatibility in this explicit family; it does not assert that normalization commutes with arbitrary base change for all schemes.

## 6. Nodes, cusps and the imperfect-field boundary

Outside P the normalization is an isomorphism to an open of P1, so C is smooth there. At P the completed equation has no linear term and has nonzero quadratic term V^2+aUV+bU^2. Its local dimension is one and its cotangent dimension is two, hence P is singular. The unique singular **point** need not be a reduced singular closed subscheme.

If q is separable, over a splitting field its two roots r0,s0 are distinct. In the complete one-variable ring, Hensel lifting gives roots rho(U),sigma(U) of X^2+aX+b-U, with residues r0,s0. Then

    F = (V-U rho(U))(V-U sigma(U)).

The linear part of the two displayed factors has determinant s0-r0, a unit. Solving degree by degree therefore gives an invertible formal coordinate change, identifying the completed local ring with kbar[[X,Y]]/(XY). This is the existing StableReduction nodal criterion applied to an explicit chart, not a new definition of a node. A split q gives two rational branches; an irreducible separable q gives two conjugate branches. In characteristic two, the separability condition is a≠0.

If q=(t-r0)^2 over an extension, the change W=V-r0U gives F=W^2-U^3. This is the cusp, including characteristics two and three. Over an imperfect field, a quadratic **field** conductor is not enough to conclude that the curve is nodal: over k=F2(s), q=t^2-s is irreducible (the valuation of s is odd) but purely inseparable. After adjoining a square root of s, the curve is the cusp just computed. This preserves, rather than erases, the imperfect-field form in `small-conductor-classification`.

A useful scheme-level boundary test is the characteristic-two cusp. Its Jacobian ideal is (U^2), and its singular closed subscheme has coordinate ring k[U,V]/(U^2,V^2), of length four. It still has only one geometric point. In characteristic three the cusp's Jacobian quotient is k[U]/(U^3). A predicate using only the number of singular points would miss the unramified-singular-locus distinction required by the nodal owner. The finite point-enumeration program below does not certify these nonreduced scheme statements; the displayed ideal computations are the mathematical justification.

## 7. Finite-extension counts and their scope

Over F_Q0, all quadratic field extensions are separable. The three cases of (PC) are:

    two roots (split node):          #C(F_Q0) = Q0,
    no roots (nonsplit node):        #C(F_Q0) = Q0+2,
    one double root (cusp):          #C(F_Q0) = Q0+1.

For n≥1, the split and cusp counts over F_(Q0^n) are Q0^n and Q0^n+1. In the nonsplit case, the two roots are in F_(Q0^n) exactly when n is even, so

    #C(F_(Q0^n)) = Q0^n + 1 - (-1)^n.                       (EXT)

This is also the geometric replacement formula #P1(K)-#E(K)+1, but the direct affine bijection of section 2 already proves it without a scheme-rational-point comparison theorem. To consume it in the original fiber node, one must still identify the actual fiber reduction with this C. Field-valued points kill nilpotents, but that does not prove such an identification.

Equation (EXT) supplies the one-component part of the existing `G.1/quadratic-extension-counts` contract. That node also includes I2, whose two-component incidence and cohomology maps are different; it is **not** marked complete here. None of the global surface hypotheses in `count-15` through `count-18` is removed. No classification of all genus-one fibers, regular models or rational elliptic surfaces is inferred from this family of cubics.

## 8. Integration worklist and acceptance requirements

Reuse `G.1/quadratic-pinch-algebra`, `-relation`, `-residue`, `-presentation`, `-conductor` and `-normalization`. The geometric consumer endpoints already exist as `G.1/quadratic-pinch-i1-genus`, `-splitting`, `G.1/quadratic-extension-counts`, `G.1/nonsplit-i1` and `G.1/count-16`. Do not create duplicate endpoints under this checkpoint's headings.

The declaration-sized specialized helpers still to integrate, in dependency order, are: the affine-solution subtype equivalence and its evaluation laws; the native point-count balance; the explicit infinity-chart algebra equivalence and its two inverse laws; the projective morphism (N) with its two chart formulas; the affine cover and finite-birational-normal comparison; the conductor subscheme comparison; the sheaf quotient map and exactness; the connecting-map cohomology isomorphism and its coordinate/base-change comparisons. Give each construction its own API and at least three typed acceptance examples in the allowed suggested file. Register only genuinely missing helpers, after checking the current pinned libraries and supplier contracts. The general Proj, normalization, coherent pushforward, cohomology and Ferrand theorems remain imports from their existing owners.

Required acceptance cases include: split q=t^2+t over F2, nonsplit q=t^2+t+1 over F2, and q=t^2; the nonsplit example after extension to F4 and F8; infinity O and its inverse [1:0]; the actual nonreduced conductor E for the cusp; the inseparable field example over F2(s); and the mismatch between projective point count and the nonsingular-point group. For the chart construction, h=1 in the cusp case must give z=u^3 and the ordinary affine-line chart, not require u to be invertible. The general affine point equivalence must exclude q(t)=0 rather than making division by zero a default value.

The next native proof to write is (PC) via the explicit subtype equivalence. It is independent of the unimplemented projective/cohomological interfaces. Then integrate the projective and sheaf strand into packet, reader and suggested file together, preserving all inherited nodes. Run the indexed blueprint checker and whole dependency/assembler checks, and record exact results. Until that integration, all canonical implementation and coverage statuses remain unchanged.

The predecessor's specialized affine normalization/homological helpers still need canonical integration. The full two-component construction, general Ferrand-space interfaces, DVR/model comparisons, source-route closure and all surface-classification stages remain open. No supplier request, source-error verdict, ownership decision or reserved ID is changed by this handoff.

## 9. Fresh source and validation receipts

Read on 2 October 2026:

- [Schröer, arXiv:2004.07025v3](https://arxiv.org/pdf/2004.07025v3), third revised version dated 19 July 2022, section 3, printed pages 10–11. The conductor diagrams on page 10 and the Proposition 3.2 table on page 11 were inspected in successful rendered screenshots in this run; earlier failed screenshot attempts do not prevent that later verification. Only the one-component pinching/count application is supplied here. No claim of a fresh full-paper read or a new published correction is made.
- [Stacks 0ECH](https://stacks.math.columbia.edu/tag/0ECH), Situation 37.67.1, Lemma 37.67.2 and Proposition 37.67.3 including proofs, and the stated separatedness/finite-type consequences. The precise affine-neighborhood hypothesis was checked for E⊂D(T), and the affine ring pullback and cartesian tensor quotient were read. The projective polynomial and its explicit chart inverse above are this checkpoint's calculation, not attributed verbatim to that source.
- [Stacks 01XS](https://stacks.math.columbia.edu/tag/01XS), Lemmas 30.8.1–2 and their Cech-complex proof and base-change comparison; use only the P1, O specialization here. [Stacks 01XC](https://stacks.math.columbia.edu/tag/01XC) and [02KG](https://stacks.math.columbia.edu/tag/02KG), affine higher-direct-image vanishing and affine pushforward/base change. These are supplier mathematics, not newly built Lean declarations.
- The pinned Tau Ceti file `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean` at `f790474821cf4256814db967cb154e7af3d0c369`, blob `a1c0db6d278c1ea94d09778b0826d67106bd7a5a`: the actual definitions and proofs of `pointCount_def`, `pointCount_eq_card_point`, `frobeniusTrace_def`, including the ellipticity hypothesis of the group-cardinality comparison.
- The actual existing G.1 reader contracts listed above, the current seven-stage roadmap, the packet baseline header and the previous handoff. Nearby upstream reading covered the conventions and relevant foundational sections of `content/tau-ceti/StableReduction/README.md` and `content/tau-ceti/EllipticCurves/README.md`; in particular their normalization/coherent ownership and equation-versus-scheme distinction. This is not a fresh audit of every stage, routed item or API. The browser fetch of `data/library-coverage.json` returned empty text despite a blob SHA; no fresh full-library-audit claim is made.

**No Lean compilation was performed.** There is no existing pinned build in this environment, and available memory is below the WORKERS minimum. No installation, Lake invocation, cache download, large build or language server was attempted. The mathematical proof and executable checks are not a substitute for elaborating the canonical suggested file. The indexed blueprint checker and actual assembler were not run locally; their earlier receipts are historical, and the canonical inputs to them are unchanged.

The independent executable check below enumerates the actual projective equation, rather than assigning it the predicted count. It ran 259 coefficient/field models, tested 44,089 candidate projective points and 3,090 normalization source points, and also checked every nonzero-V point against the explicit chart inverse. The fields are F2,F3,F5,F7,F11, F4,F8,F9,F27,F25. Coefficients a,b range over the prime subfield in each extension test. There are **132,079 passing assertions**: 115,533 field-implementation sanity assertions and 16,546 curve/map/count assertions. The sanity assertions are not represented as additional geometric examples.

Script SHA-256: `c5ca830260f2389c362b635b72ddde749ec21d3d669aaf75ecfebdc76600c938`. Extract the exact code fence, retaining its terminal newline, to a disk-backed Python file and run Python 3. It prints its own source hash and complete JSON receipt. It writes no repository data. These tests certify neither scheme-level normalization, nilpotent conductor structure, arbitrary-field statements nor coherent cohomology; those have their separate mathematical arguments above.

## 10. Reproducible program

```python
#!/usr/bin/env python3
"""Exact projective cubic regressions, not a scheme/cohomology or Lean proof."""
from __future__ import annotations
from collections import Counter
from hashlib import sha256
from itertools import product
import json
from pathlib import Path


class Field:
    """Fp[x]/(modulus), elements encoded by base-p coefficient digits."""
    def __init__(self, p: int, modulus: tuple[int, ...]) -> None:
        assert modulus[-1] == 1
        self.p, self.n = p, len(modulus) - 1
        self.q = p ** self.n
        self.elements = range(self.q)
        self.digits = [tuple((x // p ** i) % p for i in range(self.n))
                       for x in self.elements]
        self.plus = [[self.encode([(u + v) % p for u, v in
                                  zip(self.digits[x], self.digits[y])])
                      for y in self.elements] for x in self.elements]
        self.times = []
        for x in self.elements:
            row = []
            for y in self.elements:
                coeff = [0] * (2 * self.n - 1)
                for i, u in enumerate(self.digits[x]):
                    for j, v in enumerate(self.digits[y]):
                        coeff[i + j] = (coeff[i + j] + u * v) % p
                for d in range(len(coeff) - 1, self.n - 1, -1):
                    lead = coeff[d]
                    for j, c in enumerate(modulus):
                        coeff[d - self.n + j] = (coeff[d - self.n + j] - lead * c) % p
                row.append(self.encode(coeff[:self.n]))
            self.times.append(row)
        self.negative = [next(y for y in self.elements if self.plus[x][y] == 0)
                         for x in self.elements]
        # Existence of every inverse also rejects reducible chosen moduli.
        self.inverse = [0] + [next(y for y in self.elements if self.times[x][y] == 1)
                              for x in range(1, self.q)]

    def encode(self, coeff: list[int]) -> int:
        return sum(c * self.p ** i for i, c in enumerate(coeff))

    def add(self, *xs: int) -> int:
        out = 0
        for x in xs:
            out = self.plus[out][x]
        return out

    def mul(self, *xs: int) -> int:
        out = 1
        for x in xs:
            out = self.times[out][x]
        return out

    def neg(self, x: int) -> int:
        return self.negative[x]

    def canonical(self, xs: tuple[int, ...]) -> tuple[int, ...]:
        first = next(x for x in xs if x)
        return tuple(self.mul(x, self.inverse[first]) for x in xs)


def main() -> None:
    checks = Counter()

    def verify(condition: bool, label: str, context: object = None) -> None:
        if not condition:
            raise AssertionError((label, context))
        checks[label] += 1

    fields = [Field(p, (0, 1)) for p in (2, 3, 5, 7, 11)]
    fields += [Field(2, (1, 1, 1)), Field(2, (1, 1, 0, 1)),
               Field(3, (1, 0, 1)), Field(3, (1, 2, 0, 1)),
               Field(5, (2, 0, 1))]
    models = 0
    point_candidates = 0
    normalization_points = 0
    counts_by_field = {}
    for f in fields:
        add, mul, neg = f.add, f.mul, f.neg
        for x, y, z in product(f.elements, repeat=3):
            verify(add(add(x, y), z) == add(x, add(y, z)), 'field_add_associative')
            verify(mul(mul(x, y), z) == mul(x, mul(y, z)), 'field_mul_associative')
            verify(mul(x, add(y, z)) == add(mul(x, y), mul(x, z)), 'field_distributive')
        for x in f.elements:
            verify(add(x, neg(x)) == 0 and mul(x, 1) == x, 'field_identity_inverse')
            if x:
                verify(mul(x, f.inverse[x]) == 1, 'field_nonzero_inverse')
        p1 = [(1, t) for t in f.elements] + [(0, 1)]
        p2 = [(1, y, z) for y, z in product(f.elements, repeat=2)]
        p2 += [(0, 1, z) for z in f.elements] + [(0, 0, 1)]
        node, infinity = (0, 0, 1), (0, 1, 0)
        field_counts = Counter()
        for a, b in product(range(f.p), repeat=2):
            models += 1
            context = (f.p, f.n, a, b)

            def equation(u: int, v: int, z: int) -> int:
                return add(mul(v, v, z), mul(a, u, v, z), mul(b, u, u, z),
                           neg(mul(u, u, u)))

            def normalize(s: int, t: int) -> tuple[int, ...]:
                qt = add(mul(s, s), mul(a, s, t), mul(b, t, t))
                coords = (mul(t, qt), mul(s, qt), mul(t, t, t))
                verify(any(coords), 'normalization_no_basepoint', context)
                return f.canonical(coords)

            curve = {p for p in p2 if equation(*p) == 0}
            point_candidates += len(p2)
            fibers = Counter(normalize(*p) for p in p1)
            normalization_points += len(p1)
            verify(set(fibers) <= curve, 'normalization_lands_on_curve', context)
            roots = [t for t in f.elements if add(mul(t, t), mul(a, t), b) == 0]
            verify(fibers[node] == len(roots), 'actual_conductor_fiber', context)
            verify(all(fibers[p] == 1 for p in curve if p != node),
                   'normalization_bijection_off_conductor', context)
            verify(fibers[infinity] == 1, 'single_infinity_preimage', context)
            singular = set()
            for u, v, z in curve:
                grad = (add(mul(a, v, z), mul(2 % f.p, b, u, z), neg(mul(3 % f.p, u, u))),
                        add(mul(2 % f.p, v, z), mul(a, u, z)),
                        add(mul(v, v), mul(a, u, v), mul(b, u, u)))
                if not any(grad):
                    singular.add((u, v, z))
                if v:
                    h_u, h_z = mul(u, f.inverse[v]), mul(z, f.inverse[v])
                    h = add(1, mul(a, h_u), mul(b, h_u, h_u))
                    e = add(1, neg(mul(a, h_u)), mul(add(mul(a, a), neg(b)), h_u, h_u))
                    c = add(mul(a, a, a), neg(mul(2 % f.p, a, b)),
                            mul(add(mul(a, a, b), neg(mul(b, b))), h_u))
                    verify(h != 0 and mul(h_z, h) == mul(h_u, h_u, h_u),
                           'infinity_chart_equation', context)
                    verify(mul(h, add(e, neg(mul(h_z, c)))) == 1,
                           'explicit_chart_inverse_identity', context)
                    verify(normalize(1, h_u) == (u, v, z), 'infinity_chart_inverse', context)
            verify(singular == {node}, 'unique_singular_point', context)
            verify(len(curve) == f.q + 2 - len(roots), 'projective_count', context)
            affine_count = sum(equation(x, y, 1) == 0 for x, y in product(f.elements, repeat=2))
            verify(len(curve) == affine_count + 1, 'native_pointCount_convention', context)
            verify(len(curve - singular) == affine_count, 'nonsingular_group_one_less', context)
            verify(f.q + 1 - len(curve) == len(roots) - 1, 'native_trace_convention', context)
            base_roots = sum((t * t + a * t + b) % f.p == 0 for t in range(f.p))
            predicted_roots = (2 if f.n % 2 == 0 else 0) if base_roots == 0 else base_roots
            verify(len(roots) == predicted_roots, 'odd_even_extension_roots', context)
            expected = f.q + 1 - (-1) ** f.n if base_roots == 0 else f.q + 2 - base_roots
            verify(len(curve) == expected, 'odd_even_extension_count', context)
            discriminant = add(mul(a, a), neg(mul(4 % f.p, b)))
            verify((discriminant == 0) == (len(roots) == 1), 'finite_field_cusp_boundary', context)
            field_counts[f'{base_roots}_base_roots'] += 1
        counts_by_field[f'F{f.q}'] = dict(sorted(field_counts.items()))
    receipt = {
        'agent': 'ChatGPT Pro — cp-20261002-sr-c72e81',
        'scope': 'actual projective point enumeration, normalization fibers and chart identities',
        'models': models,
        'projective_point_candidates': point_candidates,
        'normalization_source_points': normalization_points,
        'checks_by_kind': dict(sorted(checks.items())),
        'assertions': sum(checks.values()),
        'models_by_field_and_base_root_count': counts_by_field,
        'source_sha256': sha256(Path(__file__).read_bytes()).hexdigest(),
        'lean_compiled': False,
        'warning': 'No scheme-theoretic normalization or cohomology theorem is certified by finite tests.'
    }
    print(json.dumps(receipt, indent=2))


if __name__ == '__main__':
    main()
```
