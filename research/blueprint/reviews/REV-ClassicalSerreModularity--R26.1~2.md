# Independent review: Classical Serre Modularity, revision 2

**Job:** REV-ClassicalSerreModularity--R26.1~2 · **Issue:** #7036 · **Reviewer:** Codex, session codex-mDgRfa · **Date:** 2026-10-08 · **Verdict:** `accepted`.

The revised [packet](../packets/ClassicalSerreModularity--R26.1.json), [reader](../readmes/ClassicalSerreModularity--R26.1.md) and [suggested Lean file](../suggested/ClassicalSerreModularity--R26.1.lean) now agree. This is an independent review of work by codex-uGlOi6, its earlier review by codex-sHhOXz, and the reader revision by codex-vmLqNQ; this reviewer did none of those jobs. The previous `needs_changes` verdict concerned a reader that the previous review issue did not authorize changing. This issue includes that reader, and it has been checked and synchronized with every correction below.

The complete pass contains **36 nodes** (14 theorems, 13 lemmas, seven applications, two definitions), **16 API items, 11 tests, seven planets and eight pinned baseline citations**. This review corrects **ten node objects**, adds **no nodes**, refreshes all **seven source-issue verdicts**, and leaves **23 explicit open supplier requests and seven gaps**. All eight scoped stages are **planned**, none closed. The report accepts the mathematical planning pass, including its honest boundaries; it does not certify completed proofs, implemented declarations, or application of the proposed stage split.

## Corrections and consistency

1. **Minimal deformation finiteness and R=T.** The R22.1 contract constructs the deformation-to-Hecke map; it does not prove an integral isomorphism. The flatness application now imports R22.3/minimal-ring-finite and R22.4/integral-r-equals-t-when-smooth. Its open request explicitly requires matching the chosen totally real field, determinant, residual image and local conditions with those exports. Khare's older KW preprint Lemma2.4 is distinguished from published Annals Lemma3.6, p.241.
2. **Crystalline local rings.** The old request asserted smoothness solely from k≤p+1. It now preserves odd p, normalized weight and k≠p, and uses the separate R08.6 irreducible Fontaine–Laffaille, ramified/distinguished ordinary, and residual-weight p+1 endpoint exports. Framed dimensions are not substituted for the unframed h⁰+1 dimension. Khare's preprint Proposition2.3 reference is mapped to published Annals Proposition3.5, pp.240–241. Matching these cases remains a precise supplier obligation.
3. **Odd-prime lifting.** R22.6 supplies dyadic lifting. The level-one lifting, degenerate branches, assembly and terminal-row application instead use R22.5/kw-i-theorem-4-1-odd-prime. Its actual statement includes p>2, residual modularity, absolute irreducibility over Q(μ_p), and crystalline weight2≤k≤p+1 or potentially semistable weight two. The supplier's nonordinary k=p+1/residual-weight-two boundary and the independent ordinary CM correction gap remain visible.
4. **Local conductor and recognition.** Inertia/decomposition inclusions belong to R01.2; Artin/Swan conductor and reduction/support comparisons belong to R01.3. The good-dihedral and conductor-two applications now import those stages separately. R01.5 is retained specifically for Frobenius recognition in the finiteness corollary. Abelian-character finiteness imports the existing Tau Ceti ClassFieldTheory Layer13 Kronecker–Weber and conductor comparison. The integral finite Hecke algebra requested at R15.3 is explicitly an additional export beyond its present characteristic-p operators contract.
5. **Definition tests and edition provenance.** The p=7,q=241 upper-endpoint test is a non-example. Source reads now have a fresh independent provenance entry and accurate published/preprint locators. The reader's current source boundaries, mathematical specifications, imports, requests and source findings match the packet. Historical reviews are retained as history, not presented as the current verdict.

No baseline citation was removed or renamed. No generic supplier theorem, upstream carrier, or sibling Chebotarev/insertion node was duplicated. The target-level granularity is retained: the local deformation calculation, five terminal-row applications and two different induction arguments are connected rather than split into incidental algebraic microlemmas.

## Source checks and limits

All ten public PDFs were obtained independently and their SHA256 values matched the packet. The statements and scoped proof arguments below were read, not inferred from the packet's citations. The descriptions here and in the deliverables are in our own words; no source passage has been added.

| Public source | Independent reading and limit |
| --- | --- |
| [On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Qbar/Q) unramified outside p](https://arxiv.org/pdf/math/0504080v1) | Introduction pp.1–5, complete scoped §§2–6 pp.7–28 and §7.1 pp.28–29; all 36 node applications checked against their source contracts. Duke text not obtained. |
| [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | Definition2.1 pp.5–6, Theorem4.1 p.7, Theorem5.1 and remarks pp.8–10, §§6–7 pp.10–13, complete §8.2 pp.13–15 and §8.3 pp.16–17 including Lemma8.2 proof. |
| [Appendix 1: On the isomorphism R_empty -> T_empty](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf) | Entire seven-page appendix, including all statements and proofs on pp.1–6. |
| [On a conjecture of Conrad, Diamond, and Taylor](https://arxiv.org/pdf/math/0404327v3) | Remark1.7 p.4, Theorem6.11 pp.34–35, Corollary6.15 pp.38–39 and Remark6.17 p.39. Earlier published correction is author-reported; old edition not obtained. |
| [A simplified proof of Serre’s conjecture](https://arxiv.org/pdf/2108.07577v2) | Definition1.12 and Lemmas1.13–1.15 with proofs/remarks, v2 pp.7–10. |
| [Images of semistable Galois representations](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf) | Standing §2 conventions, Lemma2.1, Proposition2.2 and complete proof, published pp.278–280. |
| [Approximate formulas for some functions of prime numbers](https://denisevellachemla.eu/Rosser-Schoenfeld-1962.pdf) | Exact Theorem2 and Corollary1 (3.3)–(3.6) and their domains, published p.69. Analytic proof and tables not read. |
| [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf) | Introduction pp.1–2, modular/strongly-modular distinction and equivalence only for residual characteristic at least three. |
| [On Serre’s conjecture for 2-dimensional mod p representations of Gal(Qbar/Q)](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf) | Published Proposition3.2 and Theorem3.3 p.239, Propositions3.4–3.5 pp.240–241 and Lemma3.6/proof p.241; Definition4.1/Theorem4.2 pp.243–245, Theorem5.2(ii) and proof p.247, §6.2 pp.250–251. Distinguished preprint Lemma2.4/Proposition2.3 from their published numbers. |
| [Multiplicités modulaires et représentations de GL₂(ℤ_p) et de Gal(ℚ̄_p/ℚ_p) en ℓ=p](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf) | Odd-prime convention in Introduction p.2; Proposition4.1.1/proof pp.30–31 and §6 introduction/Proposition6.1.1 pp.67–68. The author omits §6 calculations; source access does not discharge R07.5. |

The earlier review's substantive corrections remain sound: the local quadratic has a plus sign; literal member ramification can include the coefficient characteristic; fixed Weil–Deligne support is the system invariant; Corollary5.5 has a fixed-weight/destination bound before its full-theorem transfer; a general-weight system is required there; solvability does not imply ordinarity; the foil uses the general bad-dihedral lemma rather than a level-one theorem; and KW's induction requires its final third system/reduction to the predecessor characteristic.

All seven source issues have fresh `confirmed` verdicts under this job id:

| Finding | Independent conclusion |
| --- | --- |
| ClassicalSerreModularity/E1 | Read Khare v1 §6.1 p.25. The mod-7 companion of the characteristic29 row has support{7,29}, whereas{3,19} is the preceding row. Confirmed the preprint slip only; Duke text not obtained. |
| ClassicalSerreModularity/E2 | Read Khare v1 §6.1 pp.25–26 and recomputed the characteristic31/foil5 coset modulo6. The printed exponent16 is unavailable; exponent18 gives weights20/14 and lies in(12,18]. No published-edition assertion. |
| ClassicalSerreModularity/E10 | Read KW I §7–§8.2 pp.12–15. The conductor-prime count r is fixed, independently of the exponent of the selected prime-power divisor. Confirmed the collision and the use of e≥4 for the dyadic estimate, with prior correction attribution retained. |
| ClassicalSerreModularity/E11 | Read Khare v1 §4 pp.19–20 and computed π(31)=11,π(100)=25. These contradict the proposed uniform upper constant. Rosser–Schoenfeld p.69 supplies the replacement domains; this confirms a proof-input error, not failure of the intended prime-ratio conclusion or an error in the unread Duke edition. |
| ClassicalSerreModularity/E12 | Read Savitt v3 Remark1.7 p.4 and corrected Theorem6.11/Corollary6.15/Remark6.17 pp.34–39. The i=1 case gives coincident niveau-two exponents of niveau one. Confirmed the author-reported published correction; the older published theorem was not independently read. |
| ClassicalSerreModularity/E13 | Read Khare v1 §2.3 p.15 and independently derived α−β=γ(c−1),αβ=ψ, hence β²+βγ(c−1)−ψ=0. A numerical substitution distinguishes the signs; its derivative reduces to a nonzero twice-eigenvalue in odd characteristic. This is edition-qualified and leaves smoothness unchanged. |
| ClassicalSerreModularity/E14 | Read Ribet published Proposition2.2 proof p.280 with its semistable/cyclotomic conventions. Cyclic tame inertia of order p±1 cannot lie in the dihedral center when its order exceeds two; the index-two rotation subgroup gives the stated quadratic quotient. Confirmed the terminology slip without broadening the theorem. |

These verdicts preserve edition limits. E12 is the correction explicitly reported by Savitt v3, not a claim to have read the older published theorem. E1/E2/E11/E13 concern Khare v1 and make no allegation about the unread Duke edition. E14 concerns the published Ribet proof and does not remove its semistability/cyclotomic-determinant assumptions. Existing correction/search provenance is retained; this review does not claim a new exhaustive erratum search.

## Pinned libraries, owners and targets

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the eight actual declaration statements were read:

| Declaration | Module and exact usable contract |
| --- | --- |
| `Nat.maxPrimeFac` | `Data/Nat/MaxPrimeFac`: existing greatest-prime-divisor function for n>1, with separate 0/1 defaults. |
| `Nat.maxPrimeFac_one` | Same module: Q(1)=1. |
| `Nat.isGreatest_maxPrimeFac` | Same module: 1<n is required for the greatest prime-divisor characterization. |
| `Nat.maxPrimeFac_mul` | Same module: both factors must be nonzero. |
| `Nat.maxPrimeFac_pow` | Same module: the exponent must be nonzero. |
| `Matrix.GeneralLinearGroup` | `LinearAlgebra/Matrix/GeneralLinearGroup/Defs`: units of the matrix ring, supplying GL₂. |
| `Nat.primeCounting` | `NumberTheory/PrimeCounting`: counts primes ≤n using the strict counter at n+1; the real adapter uses natural floor. |
| `Nat.exists_prime_lt_and_le_two_mul` | `NumberTheory/Bertrand`: n≠0 gives a prime q with n<q≤2n. It does not supply the sharper ratio by itself. |

Commit-qualified reads at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` confirm the absolute Galois-group, modular/cusp-form and abelian-variety carriers. The missing canonical interface is the assembled residual representation with its actual Artin conductor, classical Serre weight and attached-newform witness, not the absolute Galois group or GL₂ itself. All eight scoped records of `data/library-coverage.json` were read. R26.1 process bookkeeping is not re-planned; R26.5 imports R25's arithmetic results without constructing another abelian-variety carrier. Full Chebotarev and GlobalNumberFields upstream examples were read to check density and granularity; the ClassFieldTheory Layer13 contract was also read at its upstream heading.

Direct supplier contracts were compared against the R01, R04, R07, R08, R15, R17, R20, R21, R22, R24 and R25 packets/stage descriptions. A stage name alone is not treated as an available theorem. In particular, the R21.5 CM exclusion, R22.5 endpoint boundary, R15.3 integral-Hecke extension and R22.3/R22.4 matching conditions are still open, with named next actions. Generic lifting/potential modularity and compatible systems stay at R24, local integral classification at R07, local deformation rings at R08, solvable modularity at R17, and exact weight/level at R20.

Coverage was checked against each stage's actual targets: R26.1 theorem/corollary and lifting contracts; R26.2 local/prescribed lifts and systems; R26.3 prime estimates, twists and weight induction; R26.4 ordinary and degenerate lifting routes; R26.5 all five terminal rows; R26.6 assembly, both corollaries and W₁; R27.1 good-dihedral definition, images and the two stable sibling imports; R27.2 L/W/D, dyadic arithmetic and W_r⇒L_r. Each target has a plan or an exact imported node. Seven planets designate central definitions, constructions or theorems. Both definition families have constructor/projection/compatibility APIs and tests distinguishing genuine examples, degeneracy and false premises.

The two R27.1 Chebotarev/insertion nodes in the sibling R27.3 packet were read rather than copied. Lemma8.2 requires the prime field F_p and p≡1 mod4; insertion has its own lift/type hypotheses and belongs to the late prefix. RS06's mixed Dickson/modularity/weight source alias is retained with its R01/R17/R20/R15 component owners. Its whole mathematical statement is not re-owned at the early image stage.

## Assigned red-team dispositions

- **RT-AREA-langlands-2/1:** reproduced the defect on the read-only atlas with all accepted `data/restructure` proposals applied using `scripts/restructure.py`. R33.2–R33.5 acquire R26.1–R26.6 ancestors through R26.6→R27.1. A graph-only dry run deleting that inherited edge removes every R26.x ancestor from R33.1–R33.5 while preserving R26.6→R27.3 for W₁; R33.6 retains its permitted late modularity ancestors. The packet and reader explicitly propose early R27.1a/late R27.1b, migration of the stable sibling nodes, replacement of base requirements and repointing the RS06 endpoints. The early imports now name R01.2/R01.3/R01.4. This is a proposal awaiting maintainer application, not a claim that adding links fixes the graph or that those new stage ids are live.
- **RT-AREA-langlands-2/7:** checked Khare Lemma5.3, BM Proposition6.1.1, Savitt Theorem6.11/Corollary6.15/Remark6.17 and KW Theorem5.1(3),(4). The integral classification belongs to R07.5 after R07.4 descent; R15 supplies the classical weight recipe, not its integral proof. R26.4/R27.2 and R24's compatible-system exports consume that contract. BM's arbitrary-lattice statement is separated from Savitt's lattice/endomorphism condition; the author-omitted calculations remain an owner proof obligation.
- **RT-AREA-langlands-2/11:** compared both §7/§4 prime estimates and the RS06 ownership metadata. R26.3 owns the shared odd estimate once. R27.2 imports it and supplies only its dyadic exponent/parity and characteristic-induction application. No second prime-counting function, Bertrand theorem or odd auxiliary-prime theorem is planned.

## Arithmetic and Lean validation

An independent integer sieve through 22,000 and factorisation of each P−1 checked all **2,422 primes 5≤p≤21,591**. For the least non-Fermat P>p, choose the largest exact odd prime power v=ℓ^e satisfying `(m+1)P+m≤vp`, with v=2m+1. Every selected ℓ≤p; the maximum P is **21,599**, and the minimum integer margin is **0**. The check visited **284,062 integer interval representatives**, verified both returned weights in [2,p+1], and checked exactly one representative in each residue class modulo L=(P−1)/v. All 13 terminal-row weight/coset checks passed. The initial triples and the Fermat skip match the packet; p=251 chooses P=263,v=131. These are finite computation checks, not Lean proofs or replacements for the analytic prime-counting proof.

The two logarithmic endpoint margins, evaluated at precision60, are **0.2459763296005387** at p=31 and **0.6667561460935359** at p=21,591. Each comparison increases with log p. Additional checks confirm 176<208, π(31)=11, π(100)=25, the local quadratic's sign, the corrected characteristic31 exponent, and Savitt's i=1 coincident-character corner. The small terminal rows select their own admissible cosets and earlier weights; they need not lie in the later generic half-open interval.

A compact reproduction of the exhaustive prime/interval check, requiring no scratch files:

```python
from bisect import bisect_right
from math import isqrt
limit = 22000
prime = bytearray([1]) * (limit + 1)
prime[:2] = bytes(2)
for a in range(2, isqrt(limit) + 1):
    if prime[a]:
        prime[a*a:limit+1:a] = bytes((limit-a*a)//a + 1)
ps = [n for n in range(limit + 1) if prime[n]]
fermat = {2**(2**a) + 1 for a in range(5)}
count = total = largest = 0
for p in ps:
    if not 5 <= p <= 21591:
        continue
    i = bisect_right(ps, p)
    while ps[i] in fermat:
        i += 1
    P, factors, n = ps[i], [], ps[i] - 1
    for ell in ps:
        if ell * ell > n:
            break
        v = 1
        while n % ell == 0:
            n //= ell
            v *= ell
        if ell != 2 and v > 1:
            factors.append((v, ell))
    if n > 2:
        factors.append((n, n))
    v, ell = max((v, ell) for v, ell in factors
                 if ((v+1)//2)*P + (v-1)//2 <= v*p)
    m, L = (v-1)//2, (P-1)//v
    assert ell <= p and (P-1) % (v*ell) != 0
    js = range(m*L + 1, (m+1)*L + 1)
    assert len({j % L for j in js}) == L
    assert all(2 <= j+2 <= p+1 and 2 <= P+1-j <= p+1 for j in js)
    count += 1
    total += L
    largest = max(largest, P)
assert (count, total, largest) == (2422, 284062, 21599)
```

The suggested file was reviewed in full and left unchanged: actual matrix homomorphisms, nontrivial character order, the existential wrapper, conjugation API, interval/prime arithmetic and integer examples are well typed. Its name-by-name omission ledger leaves conductor-dependent and representation-valued headline/HypL/HypW/HypD declarations pending the genuine canonical interface. It does not replace them with arbitrary proposition fields.

Checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R26.1.json`: **0 errors, 0 warnings**, with eight planned stages and zero closed stages.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity--R26.1.lean`: **exit 0**, exactly **32 warnings**, all `declaration uses sorry`. Memory exceeded 20 GB; one compile ran, with no language server or build/update/cache operation. This verifies elaboration, not proofs.
- Reader consistency for all 36 statements, input conditions, proof steps, prerequisites and acceptance criteria, all 16 API items, 11 tests, 23 requests, seven source findings, seven gaps and ten source-version entries; local prerequisite acyclicity; all review/source verdicts; JSON validity and `git diff --check`.

## Per-node verdicts

Every node has a fresh independent verdict; ten are corrected and 26 verified.

| Node | Verdict | Evidence / boundary |
| --- | --- | --- |
| `R26.1/level-one-theorem-and-the-meaning-of-arises-from` | verified | Khare v1 Theorem1.1 pp.1–2 and BCDT Introduction pp.1–2 agree with the residual theorem and the optimal-weight/level convention; the characteristic≥3 equivalence is scoped and R15/R20 retain ownership. |
| `R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof` | verified | Khare v1 Cor1.2 pp.2–3 is restricted to p>2, whereas KW I Cor8.1(i) p.16 includes p=2. The Duke [24] reference and unpublished ordinary correction remain explicit edition gaps. |
| `R26.1/bockle-appendix-minimal-deformation-ring-presentation` | verified | Read the entire appendix, Theorem1/Proposition1/Lemmas1–2 pp.1–6: fixed determinant, oddness, decomposable flat exception and reduced Hecke hypotheses are retained; R04/R24 supply generic statements. |
| `R26.2/lifting-method-flatness` | corrected | Khare §2.1 pp.8–11 and published Annals Lemma3.6 p.241 support the restriction/finiteness application. Corrected the older preprint locator and replaced the R22.1 map by exact R22.3/R22.4 finiteness/integral-R=T contracts, with matching hypotheses still requested. |
| `R26.2/minimal-weight-two-lift` | verified | Khare Prop2.1 pp.7–8 and §2.2 pp.11–13 retain p>3, ordinary residual, k≠p and the k=2 BT/k=p+1 semistable alternatives. Solvable and nonsolvable routes use different suppliers. |
| `R26.2/local-ring-at-q-smooth` | verified | Recomputed the triangular-matrix commutation and determinant in Khare §2.3 pp.14–15: the plus-sign quadratic and odd-characteristic unit derivative are correct. The q≠p, q≡1 modp and exact character coset conditions survive. |
| `R26.2/nebentype-lift-at-q` | corrected | Khare Prop2.2 pp.13–15 agrees with the prescribed nebentypus. Replaced the unrestricted R08.3 smoothness request by the three case-specific R08.6 exports and distinguished framed from unframed dimensions; mapped preprint Prop2.3 to published Prop3.5 pp.240–241. |
| `R26.2/compatible-system-lifts` | verified | Khare Prop3.1/§3 pp.16–19 and KW I Thm5.1 pp.9–10 agree with minimal/nonminimal types. Coefficient-characteristic ramification is permitted; fixed Weil–Deligne support supplies the transfer, and R24 owns the system. |
| `R26.3/chebyshev-next-prime` | verified | Khare §4 pp.19–20 and KW I §7 pp.12–13 use the same odd prime-power inequality. Finite and analytic replacement inputs validate the plan without using the false uniform Chebyshev range; R26.3 is the sole owner. |
| `R26.3/serre-weight-twist` | verified | Khare Lemma5.2 p.21 has k≠2 and k<p. The irreducible and split inertia formulas, and their residual/cyclotomic interpretation, agree with the R15 recipe request. |
| `R26.3/weight-interval-containment` | verified | The integer interval in Khare §6.2 pp.26–28 has length L=(P−1)/(2m+1). Both weight bounds follow from the cleared-denominator inequality; every residue class occurs once in the half-open interval. Checked 284,062 representatives independently. |
| `R26.3/level-one-induction-scheme` | verified | Khare §6 pp.23–28 supports induction on the all-characteristic weight bound. The base completes S(32); the transition completes the normalized characteristic before Cor5.5 transfer, with no circular appeal to the final theorem. |
| `R26.4/local-reducibility-ordinary` | verified | Khare Lemma5.3 p.22, BM Prop6.1.1 pp.67–68 and Savitt Thm6.11 pp.34–35 agree for odd p, nonscalar tame type and HT {0,1}. BM allows any lattice; Savitt Cor6.15 has its own End condition and Remark6.17 only extends semisimplifications. |
| `R26.4/level-one-lifting-lemma` | corrected | Khare Lemma5.4/Cor5.5 p.22 retains even k, fixed-weight q≥k−1 and the full-theorem premise in part(ii). Corrected the odd-prime import to R22.5 and the local cases to R08.6; general-weight R24 systems and the ordinary CM gap remain explicit. |
| `R26.4/degenerate-branches` | corrected | Khare §5/§6.2 and DP Lemmas1.13–1.14 pp.8–9 justify separate reducible, bad-dihedral and cyclotomically irreducible branches. BM Prop4.1.1 pp.30–31 handles scalar crystalline k=2<ℓ, including ℓ=3. Routed odd-prime lifting to R22.5. |
| `R26.5/small-weights-table` | verified | Read all five rows in Khare §6.1 pp.24–26; computed the 13 exponent cosets and returned weights independently. E1 applies to P=29 support and E2 to P=31 nebentypus, without changing the legitimate P=29 exponent16. |
| `R26.6/level-one-proof-assembly` | corrected | Khare §§6–7 pp.23–29 assembles the completed weight induction, matching lifts and exact-weight/level optimisation. Changed the odd-prime direct import to R22.5; no unresolved supplier is described as proved here. |
| `R26.6/corollary-1-2-proof` | corrected | KW I §8.3 p.16 and Annals Def4.1/Thm4.2/Thm5.2(ii) pp.244–247 require conductor-two semistability and the GL2-type realisation. Corrected inertia/conductor ownership to R01.2/R01.3. The q=2 fixed-line calculation and separate R25 Schoof application are sound. |
| `R26.6/finiteness-corollary-1-3` | corrected | Khare §7.1 pp.28–29 requires a finite integral Hecke algebra, not just a finite complex dimension. Added upstream ClassFieldTheory Layer13 for abelian characters; retained R01.5 specifically for Frobenius recognition and recorded the R15.3 integral-export extension. |
| `R26.6/corollary-8-1-ii-and-the-statement-W1` | verified | KW I Cor8.1(ii) p.16 gives the stated weight-two odd-conductor initial case. The plan imports the mixed image/modularity/optimisation components, and the stage proposal preserves R26.6→R27.3 for W1. |
| `R27.1/good-dihedral-prime-definition` | corrected | KW I Def2.1 p.5 requires nontrivial odd-prime-power inertia and inclusive prime congruences. Corrected local imports to R01.2/R01.3 and classified the p=7,q=241 endpoint test as a non-example. The full API uses actual conductor only after specialization. |
| `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved` | corrected | KW I Lemma6.3 pp.11–12 excludes small exceptional and quadratic-induced images and preserves the prime-power local type in the bounded characteristic range. Corrected conductor/support inputs to R01.2/R01.3; no modularity theorem is an early-prefix input. |
| `R27.1/dickson-and-the-dyadic-solvable-refinement` | verified | KW I Lemmas6.1–6.2 pp.10–11 retain solvability in characteristic two and normalized odd-prime weights. RS06 componentMigrations retain the stable alias while R01/R17/R20/R15 own its distinct components; Ribet Prop2.2 is an analogy, not an unrestricted theorem. |
| `R27.2/hypotheses-Lr-Wr-and-Dr` | verified | KW I §3 pp.5–6 agrees with r≥1 for L/W and r≥0 for D. Checked all seven API items, four tests and the reverse direction of monotonicity: stronger universal hypotheses imply the smaller conductor range. |
| `R27.2/prime-gap-estimates-driving-the-weight-recursion` | verified | KW I §7 pp.12–13 imports the single odd estimate and adds the dyadic application. The exponent e≥4 is independent of conductor count r; 176<208 at (13,17,4), and the even exponent interval has length two. |
| `R27.2/theorem-3-2-weight-reduction` | verified | Read all §8.2 pp.13–15, including characteristic3/5 branches and the third compatible system. The final reduction to the smaller predecessor characteristic is essential; the crystalline foil condition preserves the ≤r prime count. R07.5 supplies integral residual weights. |
| `R26.3/explicit-prime-counting-input` | verified | Published Rosser–Schoenfeld p.69 gives precisely (3.3)–(3.6) and their four domains. Nat.primeCounting at the pin counts≤n; the floor adapter is right. E11 counterexamples and the unread analytic proof/table boundary remain explicit. |
| `R26.3/next-prime-ratio` | verified | Independently evaluated positive logarithmic margins at 31 and 21591, respectively 0.2459763296 and 0.6667561461, with increasing comparisons. Bertrand has n≠0; the Fermat skip is separate and 22/15 is exact. |
| `R26.3/finite-auxiliary-prime-checks` | verified | An independent sieve/factorisation checked all 2,422 primes 5≤p≤21591, least non-Fermat P, exact odd powers, ℓ≤p and integer margins. Largest P=21599 and minimum margin0; p=251 correctly skips257 for263. |
| `R26.4/ordinary-reduction-and-parity` | verified | Khare §6.2 pp.26–27 uses twists only for k<P and treats k=P+1 separately. Even weight gives an odd residual-character exponent, hence distinction in odd characteristic; this is not a characteristic-two or automatic modularity assertion. |
| `R26.5/terminal-row-branch-contract` | corrected | Khare §6.1–6.2 uses the allowable exponent coset and separate residual-image branches at both returns. Corrected the nonordinary odd-prime reference to R22.5; the general bad-dihedral lemma applies at the ramified foil, unlike the level-one classification. |
| `R26.5/weight-eight` | verified | Khare §6.1 p.24: (P,ℓ,ℓ^e,j)=(7,3,3,2), support{3,7}, returned weights4/6. Verified the coset and prior bound; the normalized characteristic7 range is completed before all-characteristic export. |
| `R26.5/weights-ten-twelve` | verified | Khare §6.1 p.24: (11,5,5,4), support{5,11}, returned weights6/8. Both starting weights meet the coset; the full bound12 is completed before transport. |
| `R26.5/weights-fourteen-twenty` | verified | Khare §6.1 pp.24–25: (19,3,9,8), support{3,19}, returned weights10/12. All four starting weights have the same residue modulo2 and the full bound20 is completed first. |
| `R26.5/weights-twentytwo-thirty` | verified | Khare §6.1 p.25: (29,7,7), support{7,29}; j16 for22/26/30 returns18/14, j14 for24/28 returns16/16. Computed both modulo4 cosets; this row does not inherit E2. |
| `R26.5/weight-thirtytwo` | verified | Khare §6.1 pp.25–26: (31,5,5,18), support{5,31}; 6 divides18 but not16 and (12,18] selects18. Returned weights20/14 precede32, with the full characteristic31 range completed before transfer. |

## Questions and next actions for the orchestrator

1. Apply or commission the precise R27.1 early/late stage split, including base-edge deletion, stable node migrations and RS06 endpoint changes. Re-run ancestry checks on the applied graph; the dry run is not the application.
2. Obtain the cleared published Duke Khare text if available, identify Theorems5.1/6.1 used by KW Cor8.1, and resolve the unpublished Skinner CM correction through its R21 owner. Preserve the current source limits until that is done.
3. Route the exact R22.3/R22.4 matching, R08.6 framing/local cases, R15.3 integral-Hecke extension and R01 conductor/local-character applications to their owners. Keep R07's omitted integral calculations and the prime-counting analytic proof/table work as proof obligations.
4. Supply the genuine residual representation/conductor/weight/newform interface before elaborating the signatures individually omitted from the suggested file. Existing GL₂, Galois-group and abelian-variety carriers should be reused.

No mathematical contradiction remains in this reviewed planning pass. These recorded obligations explain why acceptance retains planned stages and open requests rather than promoting them to closed.
