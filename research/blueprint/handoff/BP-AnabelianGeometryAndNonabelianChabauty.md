# BP-AnabelianGeometryAndNonabelianChabauty — discrete degree-one descent research checkpoint

Worker: ChatGPT — gpt-20261002-atlas-b73e. Refs #1020. Date: 2026-10-02.
Claim comment 5958971764; bot confirmation 5958975109. The issue was reread after confirmation.

## Status and preservation

This is a **handoff-only, partial research checkpoint**, not a completed blueprint submission. It records explicit proofs and a freshly executed finite regression program. The packet, reader and suggested Lean file are unchanged; the results below have **not** been inserted as packet nodes or compiled. No coverage, implementation, review or promotion status is changed. No complete stage or complete supplier proof is claimed.

The complete predecessor handoff, including its product proof, native Lean experiment, source hashes, finite regression program and remaining source inventories, is preserved at:

https://github.com/CBirkbeck/tauceti-explorer/blob/9f4e840ad5ebb6bcfbba6f6a42faa088d1e5c885/research/blueprint/handoff/BP-AnabelianGeometryAndNonabelianChabauty.md

That is the merge of predecessor PR #5824. Its reported 51 nodes, 52 API items, 42 test contracts, 11 planets, 69 baseline records, nine gap groups and sixteen requests are inherited counts, not newly recomputed counts. Since this checkpoint changes only this handoff, it adds zero packet nodes, zero packet APIs, zero packet tests, zero planets and zero baseline records. In particular it preserves the reserved `key/etale-k-pi-1` object, the full fundamental group, every coefficient class, all NC.2/NC.5 source routes and the existing product assemblies.

The substantive output is a proof of finite-quotient descent **into the invariant coefficient subgroup**, a same-stage inflation argument, its pointed-set exactness and filtered-colimit consequences, and a separate geometric degree-one effacement proof route. The finite regression program below checks the group-theoretic formulas, including nonnormal one-fibres. These are mathematical proofs and finite experiments, not claims of Lean implementation or of completed blueprint closure.

## Sources actually inspected and limits

1. The current packet's NC.3 continuous-cocycle and H1 conventions, its NC.0 coefficient-class tests, and the preceding handoff. The relevant packet blob was `4f2131a77a6c974b65fea32e8b490a420b44258f`. The entire packet and all transitive suppliers were not freshly audited in this session.
2. Poonen, *Rational points on varieties*, author-hosted AMS 2017 text, Section 1.3.5, Definition 1.3.14 and the opening of the proof of Proposition 1.3.15, printed p.11: https://math.mit.edu/~poonen/papers/Qpoints.pdf . The relevant short verification excerpt is “by taking a direct limit”. The parsed text was inspected; attempts to render PDF pages 24, 25 and 119 with the browser screenshot service failed. This session therefore does not claim successful visual PDF verification or a fresh file hash. Poonen invokes the finite-to-infinite passage; the elementary nonabelian proof below is supplied here, not falsely attributed to a numbered theorem in that book.
3. Stacks Project, Section 59.57, tag 0A2H, https://stacks.math.columbia.edu/tag/0A2H : discrete coefficients and continuous actions, with open element stabilizers. This source's general group-cohomology category is abelian. It is not a source for an assertion that nonabelian H1 is a group.
4. Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174`, the full file `Mathlib/Topology/Algebra/ClopenNhdofOne.lean`, blob `72d6fa19a7785c9e1b6b611863ede9d74ee9aea5`. In particular, the complete statement and proof of `IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one` were read. Its hypotheses are a compact topological group and a clopen set containing 1; it does not require total disconnectedness. The file's `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one` was also read, but is stronger than needed here. The normal-open-subgroup existence result is native library material and must not be replanned.

The current library-coverage file read returned an empty content field with blob SHA `5e708cfc74a51b10e62149113872fe4e00eb5846`. That was **not** a successful fresh read of the NC audit rows. No claim that the lemmas below are absent from the entire pinned libraries follows from that failed read. Before packet insertion, finish the reviewed-audit and supplier overlap checks. The opening conventions and ownership discussion of the upstream AlgebraicCurves roadmap were read; the required full comparison with two nearby upstream documents remains an integration task. The cited Kim PDF could not be fetched afresh. None of these unavailable readings is silently credited as completed.

## Conventions and exact scope

Use the packet's convention

`c(gh) = c(g) · (g • c(h))`,

with gauge action

`(u * c)(g) = u · c(g) · (g • u)^(-1)`.

Here `*` in `u * c` denotes the gauge action, not multiplication of two cocycles. The distinguished cocycle is the constant map 1. Thus H1 is an orbit **pointed set**, not a group, and neutral means belonging to the orbit of 1.

For the compact descent and colimit assertions, G is a compact topological group and U is a discrete group with a continuous G-action by automorphisms. Profinite G is an important special case. U need not be finite, abelian or finitely generated. The invariant subgroup U^N means the existing fixed-point subgroup for the restricted N-action. For quotient statements N is an open normal subgroup. The quotient G/N is discrete, and is finite when G is compact. Its being finite says nothing about the cardinality of U^N.

The discrete hypothesis must **not** be applied to all of the original NC.3 coefficient groups: Kim's topological unipotent coefficient groups are not generally discrete. There is no proposed replacement of the roadmap's general topological cocycle interface by a discrete one.

## D1. An open normal subgroup on which a cocycle is identically one

**Statement.** Under the compact/discrete hypotheses, for every continuous 1-cocycle c there exists an open normal subgroup N of G such that c(n)=1 for every n in N.

**Proof.** The cocycle identity at (1,1), followed by cancellation, gives c(1)=1. At (g,g^(-1)) it gives c(g^(-1))=g^(-1) • c(g)^(-1). Consequently the subset K={g | c(g)=1} contains 1 and is closed under products and inverses: it is a subgroup. Because U is discrete and c is continuous, K is clopen. Apply the pinned native clopen-neighbourhood theorem just cited to obtain an open normal N contained in K. This proves the assertion. Alternatively, the normal core of K works: K has finite index by compactness, so its core is a finite intersection of open conjugates.

There is no normality assertion about K itself, and K is not the kernel of a group homomorphism unless additional hypotheses make c a homomorphism. This distinction matters even for a coboundary.

**Acceptance cases.** For the trivial cocycle N=G works. For an ordinary finite-image homomorphism with trivial coefficient action, its usual kernel works. For S3 acting on itself by conjugation, a transposition coboundary has one-fibre equal to an order-two centralizer, which is not normal; its normal core is trivial.

## D2. Descent into U^N, with uniqueness

**Statement.** Let N be open and normal, and let c be a continuous cocycle with c|N=1. There is a unique cocycle c_bar:G/N -> U^N whose composite with the quotient map and inclusion U^N -> U is c. Conversely, inflation of every such c_bar restricts identically to 1 on N. This assertion does not itself require compactness.

**Proof.** Normality makes U^N stable under G. Indeed, for v in U^N and n in N,

`n • (g • v) = g • ((g^(-1) n g) • v) = g • v`.

The action on U^N factors through G/N: replacing g by gn changes nothing because n fixes v. These observations use the native fixed-point subgroup and quotient-action machinery; they do not define a competing coefficient group.

For n in N, the cocycle identity gives c(gn)=c(g). Also ng=g(g^(-1)ng), so the same identity and normality give c(ng)=c(g). On the other hand c(ng)=n • c(g), because c(n)=1. Hence every c(g) is fixed by N. Define c_bar(gN)=c(g), regarded as an element of U^N. It is well-defined, obeys the same cocycle identity, and is continuous because G/N is discrete. Surjectivity of G -> G/N proves uniqueness. Conversely, the identity coset maps to the identity coefficient, so an inflated cocycle is 1 on N.

When G is compact, D1 followed by D2 proves finite-quotient descent. The phrase “a cocycle factors through a finite quotient” must retain the coefficient target U^N. It does **not** imply that the action on all of U factors through that quotient.

**Acceptance cases.** N=1 gives the original action and cocycle. N=G gives the trivial quotient acting on U^G. For C2 acting on C3 by inversion, the trivial cocycle descends with N=G and U^N={1}, although the original action on C3 does not descend to the trivial group.

## D3. Inflation is injective at the same stage

**Statement.** For an open normal N, inflation

`H1(G/N, U^N) -> H1_cont(G,U)`

is injective as a map of pointed sets. More precisely, if inflated representatives c and d are related by a gauge witness u in U, then u already belongs to U^N, and is a witness of their equivalence at the original quotient stage.

**Proof.** Inflation is well-defined because including a gauge witness in U^N into U preserves the displayed gauge formula. Suppose d(g)=u c(g)(g • u)^(-1) for every g. On n in N both inflated cocycles are 1. Thus

`1 = u · (n • u)^(-1)`,

which gives n • u=u. Therefore u is fixed by all of N. The same equation descends to G/N and proves that the quotient cocycles represent the same orbit. This proves injectivity without choosing a smaller subgroup.

In particular, it would be unnecessarily weak to insist that one must always refine N by the stabilizer of a gauge witness: the cocycle equations already force that stabilizer condition. For representatives initially defined at two different stages, first pass to their intersection; then this same-stage assertion applies.

**Acceptance cases.** It applies to nonabelian U with no group structure on H1. It applies when U^N is a proper subgroup of U. The regression program checks actual gauge witnesses, not only equality of the numbers of source and target orbits.

## D4. The image is the neutral fibre of restriction

**Statement.** For an open normal N, the image of inflation in D3 is exactly the set of classes whose restriction to H1_cont(N,U) is neutral. Thus the pointed-set sequence

`1 -> H1(G/N,U^N) -> H1_cont(G,U) -> H1_cont(N,U)`

is exact at the first two H1 terms, where “exact” at the middle means image equals the preimage of the distinguished point. No group kernel or abelian long exact sequence is asserted.

**Proof.** An inflated representative is 1 on N, so its restriction is neutral. Conversely let c restrict to a neutral class. With the fixed convention there exists v in U such that c(n)=v(n • v)^(-1) for n in N. Gauge c by v^(-1), obtaining c'=v^(-1) * c. Its restriction to N is exactly the trivial cocycle. D2 descends c' to G/N with values in U^N. Since c and c' are cohomologous, their common class is in the image. D3 proves the initial injectivity.

The inverse in the neutralizing gauge is essential. A source using the inverse gauge convention must be translated rather than copied term by term.

## D5. The filtered-colimit description

**Statement.** Under the compact/discrete hypotheses there is a natural bijection of pointed sets

`colim_N H1(G/N,U^N) -> H1_cont(G,U)`,

where N ranges over open normal subgroups, ordered by reverse inclusion. For L contained in N, the transition uses G/L -> G/N and U^N -> U^L. Every transition and every map into H1_cont(G,U) is injective.

**Proof.** The stated transition is the evident inflation of the cocycle formula with inclusion of coefficients. It preserves gauge orbits and the trivial class. Its identity and composition laws follow by evaluation on representatives g in G. The quotient-action identifications are those proved in D2.

For surjectivity, choose a continuous representative of a given H1 class and apply D1 and D2. For injectivity, let classes from the N-stage and M-stage have the same image. Put L=N intersect M; it is open and normal. Both classes have images at the L-stage. D3, applied at L, says these images are equal already there. This is precisely equality in the filtered colimit. D3 also gives injectivity of a transition, by composing it with the injective inflation into the final pointed set. Naturality for a continuous G-equivariant coefficient homomorphism follows by applying that homomorphism to the cocycle and gauge formulas; it maps U^N into the target's N-invariants.

The invariant groups in this colimit may be infinite. The formula is not a claim that one fixed finite quotient computes all of H1.

## D6. Simultaneous killing for a finite family

**Statement.** For a finite family of discrete continuous G-groups U_i and cocycles c_i, with G compact, there is one open normal N on which every c_i is identically 1. Hence a finite family of H1 classes becomes neutral on one such N. The coefficient groups may differ with i.

**Proof.** Apply D1 separately, obtaining N_i, and take their finite intersection. Restrictions of the representatives are identically 1 there. For a family of classes first choose representatives. For the empty family take N=G. The claim needs neither an infinite intersection theorem nor injectivity of restriction.

**Boundary.** For G=product over natural numbers of C2 and U=C2 with trivial action, each coordinate character is continuous. A subgroup killing all coordinate characters would be contained in their intersection, which is {1}; this subgroup is not open. Thus there need not be one open subgroup killing an infinite family. The same example, with U=G carrying its nondiscrete product topology and c the identity homomorphism, shows that D1 fails if the discrete-coefficient hypothesis is omitted.

## G1. A separate finite-étale degree-one proof route

**Statement.** Let X be a nonempty connected noetherian scheme. For finitely many finite locally constant sheaves of abelian groups F_i on X_et and classes alpha_i in H1_et(X,F_i), there exists a connected finite étale surjection Y -> X killing every alpha_i. No K(pi,1) hypothesis on X is required.

**Proof route with explicit suppliers.** Import the natural classification of H1 by torsor sheaves, and the theorem that a torsor under a finite locally constant group sheaf is represented by a finite étale surjection. Let P_i -> X represent alpha_i. Their fibre product P -> X is finite étale and surjective; geometrically its fibres are nonempty finite products. Choose a geometric point above a point of X and the connected component Y of P containing it. Since P is noetherian, its connected components are open and closed. Thus Y -> X is finite étale. Its image is nonempty, open (étaleness) and closed (finiteness), so connectedness of X makes the image all of X. Each projection Y -> P_i supplies a section of the pulled-back P_i-torsor, which trivializes that torsor. Naturality of the H1/torsor comparison gives the vanishing of the pulled-back alpha_i. For the empty family use Y=X.

The supplier statements needed here are precise: finite locally constant sheaves of groups are represented by finite étale group schemes; torsors for these sheaves are representable finite étale covers by effective descent; H1/torsor classification commutes with pullback and sends a torsor with a section to the neutral class; and connected components have the asserted finiteness and étale properties in the noetherian setting. They belong to the existing IG.0/SF.2 foundation requests, not to a newly invented cohomology carrier in NC.0. This checkpoint does not certify that the current supplier packets already contain all these declarations.

**Avoid a stage cycle.** Do not turn the similarity of this proof and D6 into an NC.3 -> NC.0 prerequisite. NC.0 is a foundation for the later nonabelian developments. Use the direct torsor proof above and the existing IG.0/SF.2 ownership for NC.0's degree-one effacement request. The abstract nonabelian finite-quotient theory can be placed in NC.3. Confirm the actual stage graph before adding any directed edge; no new edge is added here.

## Integration work still required

- Read the complete reviewed NC audit and the relevant supplier nodes at the pins. Check whether the finite-quotient and inflation constructions already exist in the owned NC.3 functoriality/exact-sequence material. Reuse them rather than installing parallel actions, quotients or fixed-point groups.
- Insert declaration-sized statements for the arguments above only after that ownership check. D1, D2, D3, D4, D5 and D6 are separate mathematical assertions, not one opaque “finite descent” hypothesis. G1 is a separate geometric assertion with the explicit foundation inputs just listed. No new IDs are reserved by this handoff.
- Add the exact native clopen-neighbourhood declaration to the baseline only when integrating a consumer node. Read the remaining native quotient-action and fixed-point interfaces before choosing Lean signatures. If a new inflation construction is necessary, give its representative formula, base-point law, gauge descent, transition composition and coefficient naturality as API, with N=1, N=G and the C2-on-C3 invariant-target tests. Do not replace an unstated geometric condition by a Prop field.
- Carry the discrete/nondiscrete boundary, nonnormal one-fibre example, coefficient-target correction, same-stage witness test and finite/infinite-family distinction into the reader and its acceptance contracts. This is a clarification of the inherited finite-quotient acceptance sentence, not a claim that its underlying mathematical assertion was false.
- Type the corresponding suggested signatures against the real pinned interfaces. The suggested file was not modified or compiled in this session.
- Run `scripts/check_blueprint.py`, the indexed checks and the combined stage/declaration/request cycle checks after packet insertion. They were **not run** for this handoff-only checkpoint; predecessor runs must not be represented as fresh runs.
- All predecessor tasks concerning product Künneth, finite-cover dictionaries, separable descent, raw homotopy and Artin towers, Chen's groupoid constructions, NC.1 reconstruction, and NC.2/NC.5 source decompositions remain open exactly as recorded at the predecessor link. RT-AREA-algebraicgeometry/8's A2 ownership of NS and the shared Part II ownership of heights are unchanged.

## Fresh executable checks

The program below was run with Python in this session. It exhaustively enumerates cocycles in 45 finite group-action fixtures: all 36 trivial actions from C1, C2, C3, C4, V4 and S3, their six conjugation actions, two inversion actions, and the natural S3 action on V4. It checks action compatibility, the one-fibre subgroup and its normal core, descent into invariant coefficients for every normal subgroup, the full image/neutral-fibre equality, and actual same-stage gauge witnesses. It also checks 36 finite coordinate-family cases. It is a finite regression suite, not a proof about compact groups, schemes, arbitrary cohomology or the pinned Lean implementations.

Fresh output:

```text
{
  "H1_classes": 117,
  "action_cases": 45,
  "cocycles": 149,
  "coordinate_family_cases": 36,
  "descended_cocycles": 275,
  "gauge_closure_checks": 617,
  "nonnormal_one_fibres": 9,
  "normal_quotient_cases": 119,
  "same_stage_gauge_witnesses": 1081
}
PASS: all exhaustive finite descent, inflation and boundary assertions
```

The script SHA-256 is `55f6c9da08b3805ed4d9f81c0e1ce789eca699b42b99e678f406e76422961134`; the output SHA-256 is `bca27f0f9a8e3a17f3c328322bfc2269bd6e18f8bfd5c7c1f6dcb6cb0d95d8a9`. Extract the Python block verbatim, preserving its final newline, and run `python finite_descent.py`. No Lean executable or pinned combined build was available. No Lake setup, cache download, library build or language server was run. No fresh formalization claim is made.

```python
"""Exhaustive finite models of nonabelian cocycle descent; not Lean proofs."""
from itertools import product, permutations
from collections import Counter
import json


def table(xs, op):
    ix = {x:i for i,x in enumerate(xs)}
    return tuple(tuple(ix[op(x,y)] for y in xs) for x in xs)


def cyclic(n):
    return tuple(tuple((i+j)%n for j in range(n)) for i in range(n))


def inv(T):
    return tuple(next(j for j in range(len(T)) if T[i][j] == 0) for i in range(len(T)))


def subgroups(T):
    return [frozenset([0]+[i+1 for i in range(len(T)-1) if m>>i&1])
            for m in range(1<<(len(T)-1))
            if all(T[a][b] in {0}|{i+1 for i in range(len(T)-1) if m>>i&1}
                   for a in ({0}|{i+1 for i in range(len(T)-1) if m>>i&1})
                   for b in ({0}|{i+1 for i in range(len(T)-1) if m>>i&1}))]


def core(T, K):
    I = inv(T)
    return frozenset(x for x in K if all(T[T[g][x]][I[g]] in K for g in range(len(T))))


def cocycles(G,U,A):
    for tail in product(range(len(U)), repeat=len(G)-1):
        c = (0,)+tail
        if all(c[G[g][h]] == U[c[g]][A[g][c[h]]]
               for g in range(len(G)) for h in range(len(G))):
            yield c


def gauge(U,A,c,u):
    I = inv(U)
    return tuple(U[U[u][c[g]]][I[A[g][u]]] for g in range(len(A)))


def orbit(U,A,c):
    return frozenset(gauge(U,A,c,u) for u in range(len(U)))


def quotient(G,N):
    cosets = sorted({frozenset(G[g][n] for n in N) for g in range(len(G))},
                    key=lambda C:min(C))
    representatives = [min(C) for C in cosets]
    q = tuple(next(i for i,C in enumerate(cosets) if g in C) for g in range(len(G)))
    Q = tuple(tuple(q[G[g][h]] for h in representatives) for g in representatives)
    assert all(q[G[g][h]] == Q[q[g]][q[h]] for g in range(len(G)) for h in range(len(G)))
    return Q,q,representatives


S3 = table(list(permutations(range(3))), lambda x,y:tuple(x[y[i]] for i in range(3)))
V4 = tuple(tuple(i^j for j in range(4)) for i in range(4))
groups = {'C1':cyclic(1),'C2':cyclic(2),'C3':cyclic(3),'C4':cyclic(4),'V4':V4,'S3':S3}
cases = []
for gn,G in groups.items():
    for un,U in groups.items():
        cases.append((gn+' / '+un+' trivial',G,U,tuple(tuple(range(len(U))) for _ in G)))
for gn,G in groups.items():
    I = inv(G)
    cases.append((gn+' conjugation',G,G,tuple(tuple(G[G[g][u]][I[g]] for u in range(len(G))) for g in range(len(G)))))
for n in (3,4):
    cases.append(('C2 / C'+str(n)+' inversion',cyclic(2),cyclic(n),
                  (tuple(range(n)),tuple((-u)%n for u in range(n)))))
perms = list(permutations(range(3)))
cases.append(('S3 / V4 natural',S3,V4,tuple((0,)+(tuple(p[i]+1 for i in range(3))) for p in perms)))
counts = Counter()
for label,G,U,A in cases:
    ng,nu = len(G),len(U)
    assert A[0] == tuple(range(nu))
    assert all(A[g][U[u][v]] == U[A[g][u]][A[g][v]] for g in range(ng) for u in range(nu) for v in range(nu))
    assert all(A[G[g][h]][u] == A[g][A[h][u]] for g in range(ng) for h in range(ng) for u in range(nu))
    C = set(cocycles(G,U,A)); subs = subgroups(G); normal = [N for N in subs if core(G,N)==N]
    classes = {orbit(U,A,c) for c in C}
    counts['action_cases'] += 1; counts['cocycles'] += len(C); counts['H1_classes'] += len(classes)
    for c in C:
        K = frozenset(g for g in range(ng) if c[g]==0)
        assert K in subs
        N = core(G,K)
        assert N in normal and N<=K
        assert all(A[n][c[g]]==c[g] for n in N for g in range(ng))
        counts['nonnormal_one_fibres'] += (N!=K)
        for u in range(nu):
            assert gauge(U,A,c,u) in C
            counts['gauge_closure_checks'] += 1
    for N in normal:
        Q,q,reps = quotient(G,N)
        fixed = tuple(u for u in range(nu) if all(A[n][u]==u for n in N))
        ix = {u:i for i,u in enumerate(fixed)}
        UN = tuple(tuple(ix[U[u][v]] for v in fixed) for u in fixed)
        AN = tuple(tuple(ix[A[g][u]] for u in fixed) for g in reps)
        CQ = set(cocycles(Q,UN,AN))
        lift = {d:tuple(fixed[d[q[g]]] for g in range(ng)) for d in CQ}
        assert set(lift.values()) == {c for c in C if all(c[n]==0 for n in N)}
        image = {orbit(U,A,c) for c in lift.values()}
        kernel = {O for O in classes if any(all(c[n]==U[u][inv(U)[A[n][u]]]
                         for n in N) for c in O for u in range(nu))}
        assert image == kernel
        quotient_orbits = {orbit(UN,AN,d) for d in CQ}
        assert len(image) == len(quotient_orbits)
        for d,c in lift.items():
            for e,b in lift.items():
                for u in range(nu):
                    if gauge(U,A,c,u)==b:
                        assert u in fixed
                        assert gauge(UN,AN,d,ix[u]) == e
                        counts['same_stage_gauge_witnesses'] += 1
        counts['normal_quotient_cases'] += 1
        counts['descended_cocycles'] += len(CQ)

# A representative of the neutral class has a nonnormal one-fibre.
I = inv(S3); A = tuple(tuple(S3[S3[g][u]][I[g]] for u in range(6)) for g in range(6))
u = next(i for i in range(1,6) if S3[i][i]==0)
c = gauge(S3,A,(0,)*6,u)
K = frozenset(g for g in range(6) if c[g]==0)
assert len(K)==2 and core(S3,K)==frozenset({0}) and gauge(S3,A,c,I[u])==(0,)*6
# The full coefficient action need not descend even for the trivial cocycle.
A = ((0,1,2),(0,2,1))
assert [u for u in range(3) if A[1][u]==u] == [0] and A[1] != A[0]
# Finite-dimensional shadows of the no-common-cover-for-an-infinite-family boundary.
for r in range(8):
    for k in range(r+1):
        K = [x for x in range(1<<r) if all((x>>i)&1==0 for i in range(k))]
        assert len(K)==1<<(r-k)
        counts['coordinate_family_cases'] += 1
print(json.dumps(dict(sorted(counts.items())), indent=2))
print('PASS: all exhaustive finite descent, inflation and boundary assertions')
```
