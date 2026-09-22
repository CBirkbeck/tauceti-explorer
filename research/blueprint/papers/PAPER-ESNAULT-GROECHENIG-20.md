# Esnault–Groechenig: rigid connections and F-isocrystals

Status: **partial extraction checkpoint**, by Codex, session codex-a71f92, 22 September 2026. Issue #1466. The structured companion is [PAPER-ESNAULT-GROECHENIG-20.result.json](PAPER-ESNAULT-GROECHENIG-20.result.json).

The published paper has been read completely, including Appendix A and references. The checkpoint records 136 interfaces: 5 library, 12 planned and 119 missing. All missing interfaces have exactly one proposed owner. It does **not** claim that the dependency graph is mathematically closed, that any geometric theorem is formalized, or that the ten source findings are independently confirmed. The completion gates below are substantive, not documentation cleanup.

## Source and scope of reading

The source of record is [the published Acta Mathematica PDF](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), volume 225 (2020), pp.103–158, DOI [10.4310/ACTA.2020.v225.n1.a2](https://doi.org/10.4310/ACTA.2020.v225.n1.a2). Its SHA-256 is `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`; accessed 2026-09-22. Journal pagination is used throughout. The PDF has 56 pages. The contents of §§1–8, Appendix A and bibliography were read; images of pp.106, 116, 118, 127, 129 and 154 were inspected to disambiguate formulas.

The [author copy](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf) has SHA-256 `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`. Its BNR proof on pp.13–14 was compared directly; selected other passages were searched, not fully collated. [arXiv 1707.00752](https://arxiv.org/abs/1707.00752) lists four versions through the accepted v4 of 1 June 2020. No later version was listed at access.

The additional proof passages actually read were Ogus–Vologodsky's PD setup, Theorem 2.8 and proof, Corollary 2.9 and Remark 2.10, pp.32–35, and Groechenig's earlier BNR Proposition 3.15 and proof, pp.14–16, with its acknowledgement on p.4. The JSON gives URLs, hashes and exact limits of these readings. The introduction of the 2023 paper *Cristallinity of rigid flat connections revisited* was also read. It develops a new local/nonproper approach, not an announced correction of the findings here. Its v2 correction of Proposition 3.9 is about that later paper. The remaining external sources have bibliographic or abstract checks and explicit proof-extraction gates; they have not silently been counted as read in full.

## What the paper establishes, with its boundaries

The standing complex variety is smooth, connected and projective, with a polarization. Rigidity is in the stable rank-r **fixed-determinant** moduli; the determinant has finite order. Isolated does not mean reduced. Cohomological rigidity uses trace-free endomorphisms. Simpson's Higgs correspondence uses the vanishing rational Chern-class component, not every stable Higgs bundle.

Theorem 1.4 supplies a chosen, sufficiently shrunken arithmetic model whose closed fibres have nilpotent p-curvature. This does not say that p-curvature is zero, or that every model and every small prime works. The p-curvature convention is ψ(∂)=∇(∂)^p−∇(∂^[p]); it is Frobenius-semilinear, not an ordinary linear endomorphism-valued one-form on the original variety. Corollary 1.5 supplies the associated crystal after the indicated completion.

Theorem 1.6 constructs a Frobenius isocrystal after a finite residue-field extension. A periodic flow gives an iterate F^f with f>0; there is no general assertion that f=1. The integral filtered realization through periodic Higgs–de Rham flow is stronger data than a pointwise semilinear vector space. This distinction is essential to the five small library credits below.

Theorem 5.4 concerns absolute irreducibility and rigidity of the geometric p-adic representation. The exact relation between the residual convention in Definition 5.3 and the generic Faltings argument is retained as G5, not settled by translating the word “rigid” mechanically. Theorem 6.1 concludes **unitary monodromy** from zero p-curvature on every closed fibre of a suitable model. It does not conclude finite monodromy without additional input.

Theorem 7.3 concerns companions within the cohomologically rigid family. Frobenius normalization, finite-order determinant and geometric versus arithmetic isomorphism classes must be fixed before a counting argument becomes a bijection of coefficient objects. Corollary 4.17 obtains motivicity after restriction to a complete-intersection curve and then a dense open; it is not motivicity on the entire original variety.

Proposition 8.1 treats the cohomologically rigid SL3 application using integrality and motivicity inputs. Proposition 8.2 has a premise about **all** cohomologically rigid connections, needed also for the relevant conjugates; an assertion about one object alone is insufficient. Simpson's motivicity conjecture, the global question in §8.3 and Question A.8 are retained as questions, not extracted as proved theorems.

## Coverage and proof organization

The numerical suffixes below refer to the JSON item ids; each item has a statement, source locator, status and ownership evidence. Definitions and constructions carry at least three planning API entries and at least three acceptance tests. These are mathematical obligations, not executed Lean examples.

| Items | Content |
| --- | --- |
| 001–008 | Fixed-determinant rigidity, trace-free cohomological rigidity, stable moduli, Riemann–Hilbert, Simpson and rigid Higgs nilpotency |
| 009–024 | Derivations, relative Frobenius, p-curvature, crystalline differential operators, cotangent centre, Azumaya and Morita interfaces |
| 025–036 | Cartier and inverse Cartier, bounds and signs, Hitchin/spectral constructions, corrected family BNR invariant |
| 037–047 | Witt vectors, pointwise isocrystals, crystalline sites, crystals/connections and reduction/completion |
| 048–060 | Arithmetic spreading, bounded rigid loci, admissibility and stability, deformation truncation, nilpotent reductions |
| 061–075 | λ-connections, Hodge splitting, filtered and mixed-characteristic periodic flows and realization |
| 076–085 | Finite permutation, determinant orbit, rigid lifts, liftable Witt towers and iterated Frobenius |
| 086–104 | Curve motivicity, representations, fixed-determinant deformation, Faltings comparison, good points and unitarity |
| 105–122 | Integrality, strong integrality, companions, finite counts, SL3 and all-rigid applications |
| 123–130 | Appendix A scaling, Brauer classes, Morita deformation and PD action |
| 131–136 | Imported Fontaine–Laffaille, overconvergence, weights, formal moduli, general integrality and geometric origin |

The first main chain runs from stable rigid moduli and p-curvature through the spectral/Morita construction, a uniform deformation bound and the rigidity-preserving inverse Cartier transform to nilpotent reductions. The BNR invariant and truncation are genuine intermediate proof obligations, not one large “standard argument.”

The second chain uses the finite collection of determinant powers L^a, with 0≤a<d and p prime to d. The rigid-point map must be a **permutation**, not merely an endomap: only the former makes every point periodic. Compatible lifts and filtrations then produce mixed-characteristic flow and an iterated Frobenius structure. The liftable subsets at Witt level n are intersections of all higher-level images. A finite inverse-limit argument is needed; a bijection between compatible Witt points and level-one points does not assert a bijection at every unrestricted finite level.

The last chains consume these constructions rather than redefine them: p-adic representation comparison, then good-point descent and unitarity; separately, companion existence, irreducibility, trace-free H¹ vanishing, determinant control and normalized counting.

## Baseline and ownership decisions

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Both source trees were searched; credited declarations were read in their Lean files.

Only five items receive library status: derivations (009), the ring Azumaya predicate and canonical multiplication map (021), Witt vectors and extensionality (037), Witt Frobenius over a perfect characteristic-p ring (038), and the pointwise isocrystal carrier (039). The JSON cites the exact names and file locators. A ring-level `IsAzumaya` is not scheme-relative splitting and coherent Morita descent. A pointwise `WittVector.Isocrystal` is not a crystal or overconvergent F-isocrystal on a variety.

The reviewed AUDIT-02 coverage marks the fibrewise Hodge foundations largely built. Its verdict supersedes old “missing” claims in the upstream README. No reviewed CR, RD, R07 or R04 verdict was available in this snapshot. AUDIT-36, AUDIT-37 and AUDIT-32 were used only as unreviewed search leads. The complete upstream HodgeStructures and SemisimpleAlgebras documents were read, together with the relevant atlas stages, proposed definitions and packet searches. Existing field-level central-simple algebra does not settle the nonreduced geometric problem.

The six routes deliberately avoid a new monolithic “rigid connections” roadmap:

### 1. Hodge structures (pure, mixed, and polarized), Part II: variations, period maps and non-abelian Hodge theory

Reuse the same pending Part II proposed by PAPER-LANDESMAN-LITT-24; its source list should gain this projective rigid-connection core, not create a second owner. Existing L0–L3 are fibrewise theory, much of it already built; they do not supply Simpson moduli, harmonic correspondence or arithmetic spreading.

Extend the already-proposed HodgeStructuresPartII, coordinated with PAPER-LANDESMAN-LITT-24, from the parent Hodge structures (tauceti:TauCetiRoadmap/HodgeStructures) to the geometric interfaces in EG20. Import the reviewed/built fibrewise pure, polarized and period-domain algebra; do not assume a complex VHS has an integral lattice. Build projective stable Betti/de Rham/Dolbeault moduli with fixed torsion determinant, Riemann–Hilbert and Simpson on the vanishing-Chern-class component, rigid/cohomologically rigid loci with End⁰ tangent space, nilpotency of rigid Higgs fields, smooth arithmetic models of all isolated points, λ-connections, equivariant rigid Hodge-moduli splitting, Griffiths filtrations and complex variations. The final foundational results are EG20 Lemmas 2.1, 3.1, 4.9 and Propositions 3.3, 4.10, and the equivalence between vanishing graded Higgs field and unitary monodromy. Import generic connection/crystal carriers from CrystallineCohomology:CR.1, moduli foundations from AlgebraicModuliForArithmeticGeometry and scheme spreading from SchemeAndStackFoundations. Add the integral-versus-strongly-integral distinction and the rank-one infinite-image unitary example; source-gate the separate EG18, Langer–Simpson SL3 and BKT inputs. The p-curvature nilpotency and Frobenius construction belong to the Cartier/flow successor, while unitarity from zero p-curvature and companion bijections belong to the rigid-arithmetic successor. Keep this foundational Hodge stage independent of those consumers to avoid a dependency cycle.

The route contains 26 extracted items.

### 2. Semisimple algebras, Artin–Wedderburn and module structure, Part II: geometric Azumaya and Morita descent

The ring IsAzumaya carrier exists, and field central-simple/Brauer theory is already upstream. The needed equivalence concerns sheaf algebras over nonreduced spectral schemes, with descent and annihilator control; neither field Skolem–Noether nor the endoscopic Hitchin roadmap supplies it.

Start from Semisimple algebras and Artin–Wedderburn (tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras), Mathlib IsAzumaya and Tau Ceti field-level central-simple/Brauer declarations. Extend once to sheaf Azumaya algebras, splitting modules and coherent Morita equivalence over general scheme bases. The foundational theorem is equivalence of modules over End(P) with modules over the base for a finite projective generator P, compatible with annihilators, affine pushforward and the local-free rank calculations used in EG20 Theorem 2.17. Prove strict-henselian splitting, transition invertible bimodules, and descent of the reduced characteristic invariant even on nonreduced parameter schemes. Coordinate geometric Brauer comparison with SchemeAndStackFoundations:SF.2, already requested by PAPER-CESNAVICIUS-19; it is a supplier, not a duplicate Brauer owner. Import quasi-coherent sheaves and étale descent from SchemeAndStackFoundations/AlgebraicModuliForArithmeticGeometry. Export the Cartier one-form connecting map and its functorial/additive Brauer-class interpretation, while the special crystalline D-algebra and its W₂ splitting remain in the Cartier-transform successor. No assertion of unique isomorphisms between arbitrary modules, and no ordinary-henselian splitting without a residue-field condition, is permitted.

The route contains 4 extracted items.

### 3. Crystalline cohomology, Part II: Cartier transforms and periodic rigid connections

CR.1 owns crystals and quasi-nilpotent connection comparison, but its layers do not promise crystalline differential-operator Azumaya theory, inverse Cartier in families or Higgs–de Rham flow. R07.3 owns absolute Fontaine–Laffaille theory; relative filtered connections on a variety are additional.

Extend Crystalline cohomology (CrystallineCohomology), importing CR.1 crystals/connections and CR.2 comparison rather than constructing rival carriers. With HodgeStructuresPartII supplying stable Higgs moduli and nice arithmetic models, build restricted tangent derivations, p-curvature with its Frobenius-semilinearity and horizontality, relative Frobenius, tensor nilpotency, the crystalline D-algebra and its cotangent centre, BMR rank p^(2dim Z), Cartier descent and the W₂-dependent Ogus–Vologodsky equivalence with explicit signs and nilpotency range. Import sheaf Morita descent from SemisimpleAlgebrasPartIIGeometricMorita. Correct the family BNR invariant conditions as in E2/034–035 before the nonreduced deformation proof; locate an explicit R(r,m) support bound and repair E3. Then prove EG20 Theorem 1.4: a rigid stable fixed-torsion-determinant complex connection has a selected arithmetic model with nilpotent p-curvature at every closed point. Build signed inverse Cartier, finite and mixed-characteristic periodic flows, LSZ/SYZ realization and its reduction compatibility; import only the absolute Fontaine–Laffaille input from FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. Prove the finite permutation over all determinant powers, lift independence at the level of rigid points, unique filtered lifts, and the finite inverse-limit argument. The second final result is Theorem 1.6: every permitted W(k)-point yields an F^f-isocrystal after finite residue-field extension, with the stronger filtered integral realization specified separately. Develop the Appendix-A scaling/PD action only after repairing the relative Brauer argument E5; retain Corollary A.7's p>2, W₂-liftability and cohomological rigidity hypotheses. This is not a proof of Question A.8 or Simpson motivicity.

The route contains 60 extracted items.

### 4. P-adic differential equations and rigid cohomology, Part II: rigid connections and companions

RD.3 and RD.6 supply geometric coefficients and weights. None of their existing layers states Faltings/LSZ compatibility, rigid p-adic representations, the zero-p-curvature unitarity result or the cohomologically rigid companion bijections. This successor consumes, not repeats, the Cartier-flow construction.

Extend P-adic differential equations and rigid cohomology (PadicDifferentialEquationsAndRigidCohomology) from its frame/coefficient and p-adic-weight foundations to arithmetic rigid connections. Import periodic crystalline realizations from CrystallineCohomologyPartIICartierFlows, projective stable Hodge/Betti theory and unitarity criterion from HodgeStructuresPartII, fixed-determinant deformation functors from GlobalGaloisDeformations, and étale fundamental-group specialization from InverseGaloisAndArithmeticFundamentalGroups. Build the Faltings small p-adic Simpson input and the LSZ comparison by direct sums of Frobenius shifts, keeping generic, geometric and residual rigidity distinct. Prove EG20 Theorem 5.4 in its verified convention; construct Cassels good points densely in arithmetic opens, projective arithmetic descent and projective period one. Theorem 6.1 concludes UNITARY monodromy from vanishing p-curvature on every closed fibre of a model; finite monodromy needs the extra hypotheses in Propositions 8.1/8.2. For companions, import CR.2 coefficient comparison and RD.6 weights, explicitly source-gate Abe's crystalline shtuka realization and Abe–Esnault p-to-ℓ existence rather than substituting the ℓ-adic GS.6 theorem. Construct local-polynomial companions, finite normalized geometric comparison sets, geometric irreducibility, End⁰-H¹ vanishing by L-functions/purity, determinant-order control and the counting bijection. Final Theorem 7.3 gives p↔ℓ and p↔p companions only for this cohomologically rigid family. Corollary 4.17 gives motivicity only after restriction to a complete-intersection curve and a dense open. The higher-dimensional motivicity problem remains a question. Resolve all source gates and arithmetic-Frobenius normalization before treating the design as closed.

The route contains 24 extracted items.

### 5. CrystallineCohomology

Reuse the unique crystalline-site/connection owner. EG20 §2.6 is a precise source for the mod-p nilpotence criterion, finite-Witt and complete-formal evaluation equivalences; add item 044's reduction argument to CR.1. CR.2 supplies End⁰ coefficient comparison, not all companions.

Stages: CrystallineCohomology:CR.1, CrystallineCohomology:CR.2. These supply the corresponding interfaces without exporting the additional conclusions of the other routes.

The route contains 9 extracted items.

### 6. GlobalGaloisDeformations

Extend the existing determinant-fixed deformation owner to the finitely generated abstract and topologically finitely generated geometric profinite groups used in §5. Separate framing/conjugacy and Artinian-completion hypotheses. This follows the same generic-group extension requested by PAPER-LANDESMAN-LITT-24 and does not assert that the present G_F,S-specific representability statement already covers every group.

Stages: GlobalGaloisDeformations:R04.1, GlobalGaloisDeformations:R04.2. These supply the corresponding interfaces without exporting the additional conclusions of the other routes.

The route contains 4 extracted items.

Among these routes, HodgeStructuresPartII is the **same pending owner** proposed by PAPER-LANDESMAN-LITT-24. It is not evidence that the new theory already exists. The foundational Hodge supplier must not depend back on its arithmetic consumers. Geometric Brauer cohomology is coordinated with SchemeAndStackFoundations:SF.2, as already requested by PAPER-CESNAVICIUS-19. The endoscopic Hitchin application in the GWZ extraction is not a substitute for arbitrary-dimensional p-curvature BNR.

The source route to CrystallineCohomology has eight planned interfaces and one missing reduction criterion. The GlobalGaloisDeformations route has four missing generic-group interfaces; its current number-field Galois-group scope cannot simply be cited as already covering geometric fundamental groups.

## Source findings awaiting independent review

All ten findings have exact locators, correction proposals, evidence and correction searches in `sourceIssues`. They remain author-unconfirmed. No communication with the authors has been made. The arXiv history, author's publication listing, matching author PDF and targeted correction searches did not identify an EG20-specific repair of E2–E6. This is not an exhaustive novelty claim. In particular, the historical correction acknowledged in Groechenig's earlier paper must be reconciled.

### E2: nonreduced family BNR needs the reduced characteristic invariant

Theorem 2.17, pp.117–119, uses a p-power characteristic-polynomial root to recover spectral data over an arbitrary parameter scheme. Frobenius is not injective on dual numbers, so monicity does not make such a root unique.

There is a trace-free geometric witness, not just a univariate warning. Let k be perfect of characteristic p≥5, let Z be an elliptic curve, choose a nonzero global differential ω on Z', and let R=k[ε]/(ε²). In the rank-three Hitchin base set

```text
a(λ) = λ³ + εω²λ,    a₀(λ) = λ³.
```

Both are trace-free, a≠a₀, a(0)=0, and a^p=a₀^p. Take the canonical zero-p-curvature rank-three connection F*O³, with trivial determinant. Its corresponding crystalline differential-operator module is supported on the zero section, hence on the spectral scheme cut out by a. Its pushforward has rank 3p and the characteristic polynomial λ^(3p)=a^p. It therefore satisfies the printed support and powered-characteristic-polynomial conditions. But the unique reconstructed connection has reduced characteristic polynomial a₀, not a. Thus the printed essential-image condition does not force membership in the fibre indexed by a.

Items 033–035 demand the locally Morita-reduced rank-three characteristic invariant itself equal a, together with independence of a splitting module and descent on the parameter scheme. This is a proposed repair whose proof remains G1. Restricting the theorem to reduced parameters would not suffice for its later infinitesimal use in Proposition 3.5. This finding does **not** give a counterexample to Theorems 1.4 or 1.6.

The earlier Groechenig paper explicitly thanks Yun Hao for finding an error in an earlier Theorem 3.2/Proposition 3.15. Its current proof was read. The relationship between that repair and this stronger nonreduced-family condition needs independent checking; no claim of an unrelated new discovery is justified.

### Other consequential gates

**E1, p.106:** fixed-determinant cohomological rigidity uses End⁰. Rank one with determinant fixed has no such deformation, while H¹_dR(O) on a positive-genus curve is nonzero. Section 7, p.148, already uses the trace-free expression. The extracted definition follows that correction.

**E3, p.127:** a nonconstant map u=t^m becomes constant on Spec k[t]/(t^m). Nonconstancy alone cannot supply the claimed nonzero truncated jet. A valuation-controlled choice of truncation and the required uniform bound must be proved. This is a gate in the proof, not a counterexample to Proposition 3.5.

**E4, pp.139,141:** the deformation functor must fix the determinant for the Artinian fixed-determinant completion argument. On a positive-genus curve, unrestricted rank-one pro-p characters deform into 1+tF_p[[t]], while the determinant-fixed rank-one moduli is a point. A standing convention might supply the omission; the repair makes it explicit. This does not settle the separate generic-versus-residual ambiguity in G5.

**E5, p.154:** vanishing after restriction to the reduced zero parameter does not imply zero-section support. On a cotangent chart the difference ε ξ dx becomes zero when ε=0 but remains nonzero after ξ is inverted. Thus the written support inference needs a relative Cartier/PD/Brauer argument. The example does not disprove the desired Brauer-class equality. Appendix A is not used as an automatic replacement proof for the earlier gaps.

**E6, p.146:** infinitely many residue characteristics alone do not give density in an arithmetic model. The points (p,t) of Spec Z[t], for varying primes p, all lie on V(t). A proof must produce good points in every relevant open, potentially by rerunning the coefficient embedding with selected elements inverted. This is a possible repair strategy, not a supplied density theorem.

### Normalization and typographical findings

**E7, pp.116–117:** the monic trace-free Hitchin affine space is not the vector space of all homogeneous degree-r expressions. On P¹, the positive symmetric differential sections vanish, but the polynomial λ^r still exists. The tautological section and vector-valued component ideal are normalized in the spectral construction.

**E8, pp.129–130:** the printed orientation of C₁ and its inverse does not type-check in the stated flow. The extraction uses one consistently oriented inverse-Cartier functor I₁ and Iₙ at mixed-characteristic level n.

**E9, pp.124,133:** determinant exponents and the indexing of their orbit are normalized to 0,…,d−1; the duplicated L⁰ endpoint, base-variable switches and nonexistent part (f) reference are recorded.

**E10, pp.108,110:** the context requires integrability of the connection and a vector-field argument ∂, rather than the printed word/symbol slips. These do not alter the intended mathematics.

## Reproducible finite checks

The following Python certificate ran with assertions enabled. It checks the arithmetic underlying the root, jet and localized-support witnesses, all permutations through seven elements, and the eigenvalue calculation for the restricted derivation x∂/∂x. It is not a proof of Morita descent, a geometric BNR equivalence or any main theorem.

```python
from itertools import permutations
from math import lcm

# Polynomials in x over F_p[e]/e^2; tuple key = (x degree, e degree).
def add(a,b,p):
    c=dict(a)
    for k,v in b.items(): c[k]=(c.get(k,0)+v)%p
    return {k:v for k,v in c.items() if v}
def mul(a,b,p):
    c={}
    for (i,e),v in a.items():
        for (j,f),w in b.items():
            if e+f<2:
                k=(i+j,e+f); c[k]=(c.get(k,0)+v*w)%p
    return {k:v for k,v in c.items() if v}
def power(a,n,p):
    b={(0,0):1}
    while n:
        if n&1: b=mul(b,a,p)
        a=mul(a,a,p); n//=2
    return b

roots=0
for p in (3,5,7,11):
    for r in range(2,8):
        a={(r,0):1}; b=add(a,{(r-2,1):1},p)
        assert a!=b and power(a,p,p)==power(b,p,p)
        roots+=1
# Rank 3 trace-free BNR witness: x^3+e*x annihilates x=0
# while its pth power is x^(3p); the rank-three zero operator
# has reduced characteristic polynomial x^3, not x^3+e*x.
bnr=0
for p in (5,7,11):
    a={(3,0):1,(1,1):1}
    assert not any(i==0 for i,e in a)
    assert power(a,p,p)=={(3*p,0):1}
    assert a!={(3,0):1}
    bnr+=1

# Nonconstant u=t^m becomes zero on the (m-1)-jet k[t]/t^m.
jets=0
for m in range(2,21):
    exponent=m
    assert exponent>=m
    jets+=1

# The conic difference e*xi remains nonzero after inverting xi:
# multiply by xi^-1 and obtain nonzero e (Laurent monomial model).
support=0
for p in (3,5,7,11):
    assert mul({(1,1):1},{(-1,0):1},p)=={(0,1):1}
    support+=1

cycles=0
for n in range(1,8):
    for perm in permutations(range(n)):
        periods=[]
        for start in range(n):
            j=perm[start]; period=1
            while j!=start: j=perm[j]; period+=1
            periods.append(period)
        common=lcm(*periods)
        for start in range(n):
            j=start
            for _ in range(common): j=perm[j]
            assert j==start
        cycles+=1

# p-th iterate of x*d/dx on F_p[x]/x^N equals x*d/dx:
# all eigenvalues j lie in F_p, so j^p=j.
restricted=0
for p in (3,5,7,11):
    for j in range(4*p):
        assert pow(j,p,p)==j%p
        restricted+=1
print(dict(monic_root_witnesses=roots, trace_free_BNR_witnesses=bnr,
           jet_counterexamples=jets, localized_support_witnesses=support,
           permutations=cycles, restricted_derivation_eigenvalues=restricted))
```

Output:

```text
{'monic_root_witnesses': 24, 'trace_free_BNR_witnesses': 3, 'jet_counterexamples': 19, 'localized_support_witnesses': 4, 'permutations': 5913, 'restricted_derivation_eigenvalues': 104}
```

## Completion gates and handoff

- **G1:** Verify E2 independently and prove a corrected arbitrary-family BNR equivalence via Morita reduced characteristic invariants. The elliptic-curve dual-number witness is an elementary source-level obstruction, not a formal Lean proof. Reconcile Grc16's acknowledged historical correction.
- **G2:** Construct the explicit R(r,m), stability upgrade, uniform rigid-component length bound, determinant transport and valuation-controlled deformation truncation. E3 remains a proof gate.
- **G3:** Complete external LSZ/SYZ/Xu proof extraction, including finite-field descent, endpoint restrictions, locally split filtrations and the nilpotency convention. OV Theorem 2.8/Corollary 2.9 were read, but their full foundational proof closure was not attempted.
- **G4:** Prove stack/coarse-point and scalar-automorphism comparisons for Claims 4.14–4.15, spread the nonreduced Hodge splitting, and supply the finite-tower inverse-limit argument.
- **G5:** Read the full Faltings/LSZ comparison sources; resolve whether Theorem 5.4 exports generic or residual rigidity under Definition 5.3. Keep E4 fixed-determinant repair separate from this unresolved representation convention.
- **G6:** Check the normal-closure coefficient-field construction and prove good-point density on arbitrary opens, including the model refinements required by E6. A nonzero scalar nilpotent argument is valid only on the reduced geometric fibre.
- **G7:** Resolve geometric versus arithmetic isomorphism classes and finite-order determinant/Frobenius normalization in S(s,p,r,d) and S(s,ℓ,r,d). Over a point, an underlying rank-one crystal admits multiple root-of-unity Frobenius structures; one cannot infer a bijection of arithmetic objects from geometric counts alone. Decompose Abe/AE existence, uniqueness and shtuka realization with exact locators.
- **G8:** Repair the relative Brauer support argument E5; verify the PD scaling action, determinant condition and p-divisible weight/rank cases needed to obtain Corollary A.7 for every p>2. No safe replacement by the same unverified Appendix is claimed.
- **G9:** Read the properness theorem in Langer's semistable category and the exact external SL3, integrality, André, BKT and strong-integrality inputs. Match them to the pending HodgeStructuresPartII design without duplicating its ownership.

The extraction is therefore partial despite a complete first reading and exact-once routing. The next worker should start with G1 and the independent source check, then G2–G4; G5–G9 can be addressed through their named primary sources without changing the ownership boundaries. Every additional nonroutine prerequisite must be extracted or recorded as a precise supplier request. The present dependency graph is an interface graph, not a proof-closure certificate.

Validation: `scripts/check_paper.py`, the three-path intake check, and `tests.test_check_paper` are required before submission. The handoff records their actual outcome. No suggested Lean file belongs to this paper issue, and no Lean file was compiled.
