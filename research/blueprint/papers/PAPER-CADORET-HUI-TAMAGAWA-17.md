# PAPER-CADORET-HUI-TAMAGAWA-17 — geometric monodromy

Codex — codex-a71f92. Issue #1157. Status: **partial**, not formalised.

All 32 pages of the published paper, including references, were read. The inventory has **119 interfaces: 7 library, 8 planned, 104 missing**. Every missing interface is routed exactly once. There are four proposed Part II extensions and three source routes. The partial status records external-input and integral-carrier debts, not an unread remainder of the paper.

## Source and scope

Primary text: Cadoret–Hui–Tamagawa, [Annals 186 (2017), 205–236](https://annals.math.princeton.edu/2017/186-1/p05), DOI 10.4007/annals.2017.186.1.5, [official journal PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p05-p.pdf). Read 22 September 2026; SHA256 `3aa67f6881cd54cdb5384eada8dc3ec9eff051d6ccb43de76d28100297b298d5`.

The [author PDF](https://webusers.imj-prg.fr/~anna.cadoret/GSS.pdf), SHA256 `bd7bd8204d7d3a02df8ca15da194f122766aab61c88103948aa75ee55f67baaf`, was compared at selected errata passages only. [arXiv1702.07017](https://arxiv.org/abs/1702.07017) shows a single v1. The author list and journal page showed no linked corrigendum to these passages. Absence from this search is not a claim that no correction exists.

The original [Larsen 2010 paper](https://msp.org/ant/2010/4-8/ant-v4-n8-p02-s.pdf), SHA256 `a14bc3effc7007f972cb2b6f1cd2de14824ac7965b4b7b95088207ae9fa89284`, was read at Definition 5, Lemma 6, Theorem 7 and the initial proof through the connected-group reduction (pp.1034–1036). It confirms the precise Nori-dimension inequality and the equality-case index bound **under the unipotent-radical hypothesis**. This is not a claim to have read or closed all its proof.

## Exact endpoint boundaries

Let X be connected smooth separated over algebraically closed k of characteristic p≥0, and f:Y→X smooth proper. For ℓ≠p write H∞=H*(Yx,Zℓ), H=H*(Yx,Fℓ), π=π₁(X,x); π₀ is the arithmetic group of a finitely generated model. All large-prime bounds depend on this fixed family; bounded tensor results additionally depend on fixed degrees.

Theorem 1.1 proves **geometric** semisimplicity on H for every sufficiently large ℓ. Theorem 1.3 proves invariant reduction for bounded mixed Schur tensors and, separately, for every **π₀-stable** free quotient and saturated submodule. Merely π-stable subquotients are not in that assertion.

After one connected finite étale cover independent of ℓ, Theorem 1.2/Corollary 8.2 identifies this with an **almost-hyperspecial** geometric image. The inverse image under the simply connected cover is hyperspecial; the original image is not asserted to equal a hyperspecial group.

Corollary 11.1 is conditional arithmetic mathematics over a finitely generated field of positive characteristic. It assumes rational semisimplicity in degree 2w and rational Tate fullness in **both** codimensions w and d−w. It does not turn Theorem 1.1 into unconditional arithmetic Frobenius semisimplicity. The exact source-wide ℓ quantifier and finite-extension stability of the Milne–Ramachandran input remain G7.

## Ownership and routes

| Route | Interfaces | New responsibility and imported boundary |
|---|---:|---|
| ArithmeticGaloisRepresentationsGeometricMonodromy, Part II of ArithmeticGaloisRepresentations | 39 | Fixed-cover reduction, uniform images, full invariant theorem, both geometric proofs, conditional arithmetic application; import representation carriers and ordinary cohomology. |
| ReductiveGroupsMonodromyModels, Part II of upstream ReductiveGroups | 36 | Nori envelopes, tensor stabilizers, integral models, finite-factor comparisons and Lie-defect criterion; import RG2 buildings/parahorics and existing field-level groups. |
| SchurWeylIntegralFunctors, Part II of upstream SchurWeyl | 6 | Integral/mod-ℓ functors and determinant splittings; preserve built rational symmetrizers and characteristic-zero Weyl modules. |
| DeligneWeightsUniformIntegralMonodromy, Part II of DeligneWeightsAndPurity | 13 | Gabber–Suh uniform freeness, rational/mod-ℓ annihilators and the curve Inv proof; import rational weights, duality and alterations. |
| ArithmeticGaloisDuality:R02.1–2, source | 7 | Compact H¹ exactness/rationalization, extension classes, prime-to-index descent; no private cohomology carrier. |
| SchemeAndStackFoundations:SF.2, source | 3 | Lisse/fundamental-group comparison, arithmetic action and fibre-power Künneth on shared scheme-cohomology infrastructure. |
| EtaleDualityAndPerverseSheaves:EDC.2, source | 1 planned | Finite étale compact-support trace normalization and regression E1. |

The proposed IDs are new in this atlas snapshot; the JSON gives detailed design briefs, imports, suggested Lean files and tests. Generic compatible-system operations remain with their existing owners. Classical analytic/adic cohomology is not a replacement for scheme cohomology here. Upstream CFSGStatement L3 explicitly constructs finite Lie-type candidate carriers without proving finiteness or simplicity; it cannot silently discharge the Tits/Steinberg/Lang input of Lemma 8.1.

These roadmaps interact at **stage** level, not by a circular import of their final theorems. In particular, geometric characteristic-zero semisimplicity and uniform covers come first; the curve quotient theorem then precedes the determinant reduction and saturated-submodule theorem. Only afterwards do the two mod-ℓ semisimplicity proofs consume Theorem 1.3.

## Library evidence

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Atlas/audit snapshot: `7b65e518c872fabd61ed788df956668e2f67211d`.

The seven credited interfaces were read in the actual pinned files:

- `TauCeti.YoungTableau.youngSymmetrizer_sq` and `isIdempotentElem_smul_youngSymmetrizer`: rational normalization only, from Symmetric/Specht/Ideal/Idempotent.lean.
- `continuousCohomology`: the TopRep homogeneous-cochain homology object, not compact exactness.
- `LinearMap.charpoly_baseChange`: finite-free endomorphisms over arbitrary commutative base change.
- `TauCeti.semisimpleCommHopfAlgProperty`, its iff theorem and `reductiveAffineGroupSchemeProperty`: field-level predicates, not smooth integral models.
- `TauCeti.semisimpleCommHopfAlgProperty.reductive`: field-level structural implication.
- `exteriorPower.presentation` and `exteriorPower.map`: module-level exterior powers and functorial maps.
- `TauCeti.ContCohomology.explicitCor1_comp_res1`: continuous explicit H¹ corestriction–restriction for open finite-index subgroups; comparison to canonical compact cohomology is not supplied by this credit.

The pinned ClassicalGroups/WeylModule.lean explicitly requires a Q-algebra and only constructs a Schur functor's value at a standard module. Its name is not evidence for an integral functor on arbitrary Zℓ-lattices. The source was read and used to narrow the proposed extension.

Reviewed audits read: AUDIT-01 SF.2; AUDIT-02 R02.1–2; AUDIT-18 DWP.0/7/8, EDC.0/2 and L5; AUDIT-19 WC.3; AUDIT-31 R01.1–6. DWP.5's existing layer supplies pure/mixed lisse definitions. ReductiveGroupsPartII and upstream SchurWeyl had no dedicated reviewed-audit entries; actual library statements and relevant layer descriptions were inspected instead. Searches covered both complete pinned trees, atlas roadmaps, new roadmaps, packets, decompositions and reserved IDs. “Missing” here is a scoped result of that evidence, not a claim about future libraries.

## Proof spine and fragile interfaces

1. **Weights to invariants.** Gabber–Suh gives H∞ free and reduction compatible in every degree. The H¹ ℓ-torsion obstruction is annihilated by a fibre polynomial of weight w and another polynomial of weights≥w+1. Lemma 5.1 compares torsion with reduction; Lemma 5.2 supplies a uniform compact-support annihilator over Qℓ and Fℓ; Lemma 5.3 uses the curve Leray edge and duality. A rational Bézout identity/resultant excludes finitely many primes and kills the obstruction.
2. **Free quotients and saturated submodules.** On an affine curve, cdℓ≤1 gives H¹ quotient surjectivity. The same annihilator works for every arithmetic quotient. For saturated M, geometric determinant triviality plus M≅(Λ^(m−1)M)∨⊗det(M) reduces to a free quotient of a dual fibre-power cohomology module. The determinant is geometrically trivial, not necessarily arithmetically trivial. Rank zero is separate; the finitely many ranks/degrees allow one bound.
3. **Nori and maximality.** T≤d has s,t≤d separately, hence the polynomial degree bound is 2d(r−1). Nori's plus theorem and CT16 Lemma 4.1's uniform **pointwise** tensor-stabilizer theorem are different inputs. Invariants imply Gs⊂Nℓ; Larsen's dimension bound and flatness give scheme equality. Bounded index plus ℓ-generation gives Π∞=𝒢(Zℓ)+. Composition-factor bounds and the simply connected hyperspecial model give Corollary 8.2.
4. **Lie proof.** A nice torus must extend as a closed integral immersion. The defect uses invariants under the **identity component** of the special fibre. Δ on the dual Lie exterior powers detects the reductive centre and the unipotent radical through the exterior-adjoint Poincaré polynomial. Arithmetic-stable free tensor quotients Λ^n𝔤∨ use Theorem 1.3(1), not its submodule clause. The arithmetic compatible-Frobenius argument supplies the nice torus.
5. **Cohomological proof.** A split determinant inclusion gives an equivariant retraction via wedge/Hom, without division by its dimension. Fibre powers reduce to splitting invariant vectors. The invariant lattice A∞ and free quotient B∞ reduce exactly. Their extension class is rationally zero; Inv for the **saturated arithmetic-stable** Hom lattice A∞⊗B∞∨ makes H¹ inject into rational cohomology. This uses Theorem 1.3(2), independently of the Lie-defect branch.

Item-level dependency lists retain this order. No spectral-sequence convergence, cohomological finiteness or positive-characteristic complete reducibility is smuggled into a carrier definition.

### Total-cohomology dévissage supplied here

Theorem 4.5 is stated for H*, while §§5.2–5.3 work with H^w. Here is the explicit bridge (item116).

Choose a rational-point Frobenius after a finite constant-field extension. For each degree w its common rational polynomial P_w has roots of weight w. Different degrees have disjoint root sets. Exclude denominators and the finitely many nonzero pairwise resultants. Over Zℓ[T], the ideals (P_w) are then pairwise comaximal, and the Chinese remainder theorem provides e_w congruent to 1 modulo P_w and 0 modulo each P_v, v≠w. Cayley–Hamilton gives e_w(F) equal to the canonical degree-w projector on H∞.

An arithmetic-stable submodule is F-stable, hence stable under all e_w(F); so is its quotient. The projectors therefore decompose it into degreewise submodules/quotients. Each factor is free or saturated when the original module is. This is uniform in the chosen subquotient because the excluded primes depend only on the finite list P_w. The resulting operators commute with π₀ because they are the canonical grading projections on H∞, **not** because Frobenius is central. This fills a planning step; it is not asserted as a source error.

## Source findings

All four are unreviewed and require the independent review required by the protocol. No author was contacted.

- **E1, p.218:** the direct-factor sentence drops compact support on the target. The preceding trace maps and the identity cover of A¹ identify the intended correction. The author copy has the same typo; the intended mathematics is unaffected.
- **E2, p.229:** a Frobenius-indexing closed point is placed in π₁(X₀,x). It belongs to the closed points of X₀; its Frobenius is a conjugacy class in π₁. Same in the author copy.
- **E3, pp.226–227:** parts 9.1.1–2 have no prime bound in their statement, while the displayed root-exponential proof uses ℓ≥r. This is a **proof-scope gap**, not a counterexample. Export the large-prime version used by the main application; verify the missing range separately before claiming the unrestricted theorem. The author copy has the same scope.
- **E4, p.233:** [BT84] has the wrong page interval and a Numdam identifier for an unrelated Kac–Moody Bourbaki talk. The [original Bruhat–Tits record](https://www.numdam.org/item/PMIHES_1984__60__5_0/) gives IHÉS60 (1984),5–184, DOI10.1007/BF02700560. The author copy already has the correct interval.

The JSON retains short printed extracts, corrections, reasons, extent and correction-search records.

## Prerequisite closure and handoff

Already-owned foundations are imported, not requested again: Weil II rational weights/geometric semisimplicity, scheme cohomology/duality, de Jong alterations and the RG2 building/parahoric prefix. The exact unclosed inputs are listed in the JSON: Gabber/Suh; CT13 (now IMRN2019)/CT16/CT12; Nori; Larsen10; Jantzen/Larsen95b; Larsen–Pink92/95; the exterior-adjoint invariant calculation and its characteristic transfer; Milne–Ramachandran; and the precise Lang/Tits/Steinberg and Bruhat–Tits/Conrad applications.

- G1: Read and verify the full primary external inputs, not just CHT's use: Gabber/Suh, CT13/CT16 (now published), Nori Theorem B, Jantzen Proposition 3.2 and Larsen95b, Larsen–Pink92/95, Milne–Ramachandran. Larsen10 Definition5/Lemma6/Theorem7 statement and initial proof were checked directly; its remaining proof is not closed. Blocks: Complete source/prerequisite closure and precise uniform-prime dependencies.
- G2: Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient. Blocks: Implementation-ready total-H* quotient/submodule proof. The mathematical reduction is supplied here; this is extraction/typing debt, not a new source error.
- G3: Establish canonical versus explicit continuous H¹ comparison for compact coefficients, continuous splittings, the exact reduction/rationalization sequences and affine-curve cd≤1 on the correct coefficient carrier. Blocks: Both weight and extension-class proof branches.
- G4: Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export. Blocks: Exact integral-model theorem generality.
- G5: Verify CT16 Lemma4.1's uniform pointwise tensor stabilizer, including separate tensor bounds and scheme-level equality. Do not cite it as Nori TheoremB or infer it from finite point sets. Blocks: Theorem7.3 special-fibre equality.
- G6: Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients. Blocks: Nice-torus application in §9.2 and arithmetic §11.
- G7: Resolve the precise rational-coefficient ℓ quantification and finite-extension stability in Corollary11.1/MR04 Lemma3.1, with both complementary Tate assumptions and integral cycle saturation. Blocks: Do not strengthen the conditional arithmetic corollary to a one-prime or unconditional assertion.
- G8: Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work. Blocks: Final design ownership, not the proposed monodromy-specific interfaces.
- G9: Expand suggested files/API/tests into reviewed blueprint packets and compile them against the pins. No Lean file was an issue deliverable; no Lean compilation or formal proof is claimed here. Blocks: Formalization handoff.

A full main-paper inventory does not establish the primary-source closure of these external theorems. Keep status partial until those checks are completed and the conditional arithmetic quantifiers are fixed.

## Verification

The final checks are recorded in the handoff: paper schema, exact-once missing-item routing, dependency acyclicity, sourceIssue schema, all paper-checker tests and the three-file intake check. No Lean file was required or compiled.

The following standard-library Python certificate was executed. It checks 166 root-system products and 4,714 equal-rank/different-dimension coefficient witnesses, 4,356 truncated exp/log group laws, 84 denominator-free determinant splittings (including characteristic dividing the dimension), and 162 weight-projector entries. These are finite regressions, **not proofs** of the geometric theorems, Nori uniformity, group invariant formula or all-prime bounds. The exponent table is input data here; the computation does not establish it.

```python
"""Exact finite checks for CHT17 extraction; not geometric proofs."""
from itertools import combinations
from math import factorial

def mulpoly(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out

types = []
for n in range(1, 7):
    types.append(("A"+str(n), list(range(1, n+1))))
    if n >= 2:
        types.append(("B"+str(n), list(range(1, 2*n, 2))))
        types.append(("C"+str(n), list(range(1, 2*n, 2))))
    if n >= 4:
        types.append(("D"+str(n), list(range(1, 2*n-2, 2))+[n-1]))
types += [("G2", [1,5]), ("F4", [1,5,7,11]), ("E6", [1,4,5,7,8,11])]
systems = []
def enumerate_systems(start=0, names=(), exponents=()):
    if exponents:
        poly = [1]
        for e in exponents:
            poly = mulpoly(poly, [1]+[0]*(2*e)+[1])
        assert sum(poly) == 2**len(exponents)
        assert len(poly)-1 == sum(2*e+1 for e in exponents)
        systems.append((names, len(exponents), len(poly)-1, poly))
    for i in range(start, len(types)):
        name, es = types[i]
        if len(exponents)+len(es) <= 6:
            enumerate_systems(i, names+(name,), exponents+tuple(es))
enumerate_systems()
witnesses = 0
for a in systems:
    for b in systems:
        if a[1] == b[1] and a[2] < b[2]:
            assert any(a[3][m] > b[3][m] for m in range(a[2]+1))
            witnesses += 1

def ident(r):
    return [[int(i == j) for j in range(r)] for i in range(r)]
def mm(a, b, p):
    r = len(a)
    return [[sum(a[i][k]*b[k][j] for k in range(r)) % p
             for j in range(r)] for i in range(r)]
def add(a, b, p):
    return [[(x+y) % p for x,y in zip(ar,br)] for ar,br in zip(a,b)]
def scale(c, a, p):
    return [[c*x % p for x in row] for row in a]
def expm(a, p):
    r, out, term = len(a), ident(len(a)), ident(len(a))
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale(pow(factorial(n), -1, p), term, p), p)
    return out
def logm(u, p):
    r = len(u)
    a = add(u, scale(-1, ident(r), p), p)
    out, term = scale(0, a, p), ident(r)
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale((-1)**(n+1)*pow(n, -1, p), term, p), p)
    return out
group_laws = 0
for p in (5,7,11,17):
    for r in (2,3,4):
        for seed in (1,2,3):
            a = [[(seed+i+2*j) % p if i < j else 0
                  for j in range(r)] for i in range(r)]
            u = expm(a,p)
            assert logm(u,p) == a
            values = [expm(scale(t,a,p),p) for t in range(p)]
            for t in range(p):
                for v in range(p):
                    assert mm(values[t],values[v],p) == values[(t+v)%p]
                    group_laws += 1
            # Strict polynomial degree < p matters in Lemma 7.1(3).
            assert all((t**p-t) % p == 0 for t in range(p))
            assert [0,(-1)%p]+[0]*(p-2)+[1] != [0]*(p+1)

splittings = 0
for p in (2,3,5,7):
    for r in range(1,7):
        for a in range(1,r+1):
            top = tuple(range(a))
            coefficients = {I:(sum((k+1)*(j+1) for k,j in enumerate(I))+3)%p
                            for I in combinations(range(r),a)}
            coefficients[top] = 1
            def wedge_value(indices):
                if len(set(indices)) < len(indices):
                    return 0
                inversions = sum(indices[i] > indices[j]
                                 for i in range(a) for j in range(i+1,a))
                return (-1)**inversions*coefficients[tuple(sorted(indices))] % p
            retraction = [[(-1)**i*wedge_value([j]+[k for k in range(a) if k != i])%p
                           for j in range(r)] for i in range(a)]
            assert [row[:a] for row in retraction] == ident(a)
            splittings += 1

projectors = 0
for q in (2,3,5,7):
    for p in (5,7,11,13,17):
        eigen = [1,q%p,q*q%p]
        if q%p == 0 or len(set(eigen)) < 3:
            continue
        for i, lam in enumerate(eigen):
            for j, mu in enumerate(eigen):
                value = 1
                for k, nu in enumerate(eigen):
                    if k != i:
                        value = value*(mu-nu)*pow((lam-nu)%p,-1,p)%p
                assert value == int(i == j)
                projectors += 1
assert (4-1)%3 == 0  # weight-separated rational roots can collide mod 3.
print({"root_system_products":len(systems), "equal_rank_dimension_witnesses":witnesses,
       "exp_log_group_laws":group_laws, "determinant_splittings":splittings,
       "weight_projector_entries":projectors})
```
