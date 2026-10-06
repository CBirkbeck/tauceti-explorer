# Independent review: Classical Serre Modularity, R26.1 part

**Job:** REV-ClassicalSerreModularity--R26.1 · **Issue:** #369 · **Reviewer:** Codex, session codex-sHhOXz · **Date:** 2026-10-06 · **Verdict:** `needs_changes`.

The independent review is finished. Clear fixes have been made in the [packet](../packets/ClassicalSerreModularity--R26.1.json) and [suggested Lean file](../suggested/ClassicalSerreModularity--R26.1.lean). The [reader](../readmes/ClassicalSerreModularity--R26.1.md) remains contradictory: it repeats copied hypotheses, the wrong quadratic sign, the overbroad characteristic-transfer claim and the inference from solvability to ordinarity. This review issue lists only the packet, suggested file and report as deliverables, so it does not authorize changing the reader. A revision must include that path and synchronize the reader before acceptance. The original planning session was codex-uGlOi6; this reviewer did none of that work.

This verdict is not a request to finish the recorded supplier proofs or to implement the maintainer's stage split in a blueprint review. Those boundaries are honest planning gaps. The packet remains a `complete` target-level pass with all eight scoped stages `planned`, none `closed`.

## Counts and changes

| Item | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 36 | 36: 29 corrected, 7 verified, none added |
| Definitions | 2 | 2 |
| API items | 13 | 16 |
| Definition tests | 8 | 11 |
| Planets | 7 | 7 |
| Pinned baseline declarations | 7 | 8 |
| Public source records / versions | 9 | 10 |
| Source issues | 5 | 7, all independently reviewed |
| Supplier requests | 18 | 20 |
| Gaps | 6 | 6, with the BM access gap replaced by its actual proof boundary |
| Scoped stages | 8 | 8 planned, 0 closed |

No baseline citation was removed. Added the existing Bertrand declaration used in the Fermat-skip argument. No new mathematical node or planet was necessary at target granularity. Generic deformation/lifting theorems, image classification, dihedral modularity, weight recipes and integral classifications remain imports from their assigned owners.

The material corrections are:

1. Removed the same two copied hypotheses from ten nodes: prime counting, next-prime estimates, finite certificates, ordinary parity, the terminal branch contract and all five terminal rows. Each now has its own hypotheses. In particular, the P=29 row legitimately uses j=16 or 14; the correction j=18 belongs only to P=31. The supports of the five rows are {3,7}, {5,11}, {3,19}, {7,29}, {5,31}.
2. Corrected the local quadratic to β²+βγ(c−1)−ψ=0, derived from α−β=γ(c−1) and αβ=ψ. Retained the printed text as evidence and recorded E13. The derivative reduces to twice the nonzero residual Frobenius eigenvalue, so Hensel still applies in odd characteristic.
3. Allowed the coefficient prime in each member's literal ramification support. Fixed Weil–Deligne support is the invariant across a system; an ℓ-adic member is not asserted to be unramified at ℓ.
4. Restricted Corollary 5.5(i) to fixed normalized weight k and destination q≥k−1. Its part (ii) requires the full theorem at the chosen characteristic. Each terminal row and induction step first completes that full normalized range before exporting it.
5. Replaced the weight-two-only supplier in Corollary 5.5 by the actual general crystalline weight-k lift and system, with cyclotomic restriction checked. The public Annals numbering is Theorem 3.3 and Theorem 4.2(i), not the older numbering quoted in Khare's preprint. Residual dihedral cases terminate through R17/R20 first.
6. Split solvable residuals into reducible, irreducible bad-dihedral, and cyclotomically absolutely irreducible cases. Solvability alone does not imply local ordinarity. At a foil, where ramification at P may persist, use the general bad-dihedral local weight lemma, not the level-one classification.
7. Obtained the BM primary text. Kept its nonscalar principal-series type, odd-prime, HT {0,1} and arbitrary stable-lattice hypotheses, without imposing the End condition from a different proposition. Separately read its scalar crystalline Proposition 4.1.1 and proof for the ordinary foil branch; the safe k=2<ℓ range includes ℓ=3.
8. Changed the dyadic hypothesis r≥4 to e≥4, with r reserved for conductor count. Corrected the small dyadic comparison from equality to 176<208. Added the local type justification that the foil does not introduce an uncounted conductor prime in KW's return system. Retained the mandatory third system/final reduction to the predecessor characteristic.
9. Added an API and three tests for the existential locally-good-dihedral wrapper. Expanded the expressible Lean interval signature to include both lower bounds and added its unique residue representative signature. Added exact sign and dyadic arithmetic examples. All suggested proofs remain unproved.

## Sources and edition boundaries

Every original PDF was re-fetched and its SHA256 matched the packet. The new BM PDF also has a recorded hash. Every node's locator and excerpt was compared with its source passage; formula excerpts transcribe displayed fractions into inline notation. The short excerpts alone are not the evidence for the hypotheses: the surrounding statements and scoped proof passages were read.

| Source, public text read | Passages checked / boundary |
| --- | --- |
| [Khare, arXiv math/0504080v1](https://arxiv.org/pdf/math/0504080v1) | Introduction and Theorem 1.1/Corollaries 1.2–1.3; §2 lifting and local calculation; §3 systems; §4 prime estimates; all §5 lemmas and Corollary 5.5; both parts of §6; §7.1 corollaries. The Duke publisher endpoint did not provide a PDF; no published numbering or erratum is inferred from v1. |
| [KW I, author results.pdf](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | Definition 2.1; §3 L/W/D statements; Theorem 4.1; all Theorem 5.1 types; §6 image/dihedral lemmas; §7 inequalities; complete §8.2 and §8.3 arguments; Lemma 8.2 and its rationality remark. Running preprint pages, not Inventiones pagination. |
| [Böckle appendix, author copy](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf) | All seven pages, including the fixed-determinant convention, Euler count, decomposable-flat exception and reduced-Hecke/conductor conditions. Metadata corrected: mathematics pp.1–6, references p.7. |
| [Savitt, arXiv math/0404327v3](https://arxiv.org/pdf/math/0404327v3) | Remark 1.7, Theorem 6.11, Corollary 6.15 and Remark 6.17. Published-error identification comes from the author's correction; the old published text was not independently obtained. |
| [Dieulefait–Pacetti, arXiv 2108.07577v2](https://arxiv.org/pdf/2108.07577v2) | Definition 1.12, Lemmas 1.13–1.15 and proofs; normalization, quadratic-restriction bridge and prime-field condition. |
| [Ribet, published MSP PDF](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf) | §2 definitions, Lemma 2.1, Proposition 2.2 and proof pp.279–280. Semistability and cyclotomic determinant are retained. Its theorem is not applied directly to general bad-dihedral residuals. |
| [Rosser–Schoenfeld, published scan](https://denisevellachemla.eu/Rosser-Schoenfeld-1962.pdf) | Theorem 2 and Corollary 1, p.69, with all four exact domains. The analytic proof and published verification tables were not read; that boundary remains a gap. The finite *applications in this packet* were checked independently below. |
| [BCDT, Breuil author copy](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf) | Introduction pp.1–2: modular versus strongly modular and the characteristic restriction. No assertion of a characteristic-two equivalence is imported. |
| [KW Annals, published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf) | Local minimal-lift conventions, Proposition 3.2, Theorem 3.3, Definition 4.1/Theorem 4.2, Theorem 5.2 and its complete proof, Theorem 5.4 context, §6.1–6.2. The q=2 theorem is semistable weight two, with an abelian-variety realization; general killing ramification remains conditional on lifting inputs. |
| [Breuil–Mézard, author copy](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf) | Introduction's odd-prime convention; §4.1 Proposition 4.1.1 and proof pp.30–31; §6 introduction and §6.1 pp.67–68, Propositions 6.1.1–6.1.3. The 82-page author copy has different pagination from Duke. §6 explicitly omits calculation details; access to the statement does not discharge the integral-classification proof. |

The five existing source issues are confirmed with their edition restrictions: E1/E2 are Khare-v1 row slips; E10 is KW's reused exponent notation; E11 is the false uniform Chebyshev upper bound, with π(31)=11 and π(100)=25; E12 is Savitt's author-reported published correction. Added E13 above and E14 in the **published** Ribet proof: the subgroup called the center must be the index-two rotation subgroup. A dihedral center has at most two elements and cannot contain cyclic inertia of order p±1>2; the rotation subgroup supplies exactly the quadratic quotient used in the proof. Both are misprints with unchanged intended conclusions. Public correction searches found no correction for E13/E14; the packet records where those searches were made. E13 makes no accusation about the inaccessible Duke text.

## Baseline, suppliers and coverage

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read these actual statements:

| Declaration | Module / checked contract |
| --- | --- |
| `Nat.maxPrimeFac` | `Data/Nat/MaxPrimeFac`: greatest prime divisor for n>1, with separate 0/1 defaults. |
| `Nat.maxPrimeFac_one` | Same module: Q(1)=1, the source convention. |
| `Nat.isGreatest_maxPrimeFac` | Same module: premise 1<n, greatest element of the prime-divisor set. |
| `Nat.maxPrimeFac_mul` | Same module: both factors nonzero. |
| `Nat.maxPrimeFac_pow` | Same module: exponent nonzero. |
| `Matrix.GeneralLinearGroup` | `LinearAlgebra/Matrix/GeneralLinearGroup/Defs`: units of the matrix ring, providing existing GL₂. |
| `Nat.primeCounting` | `NumberTheory/PrimeCounting`: primes ≤n, via the strict-counting function at n+1. The natural floor therefore matches real π(x). |
| `Nat.exists_prime_lt_and_le_two_mul` | `NumberTheory/Bertrand`: for n≠0, a prime q with n<q≤2n. Added as the direct prerequisite for the intervening-prime argument. |

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, commit-qualified reads confirm the existing absolute Galois-group and modular/cusp-form/abelian-variety carriers. The missing interface is the *assembled* residual G_Q representation with canonical conductor, classical weight and attached-newform witness. The packet does not claim the Galois group itself is missing. No carrier is re-planned.

Read all eight scoped records of `data/library-coverage.json` and the actual referenced R04, R15, R17, R20, R21, R24 and R25 node statements. In particular: R21's Q-specialized reducible theorem removes the totally real abelian-field condition, while its irreducible ordinary theorem still excludes the unresolved CM case; the R24 minimal-lift export requires absolute irreducibility on the cyclotomic restriction; R24's weight-two system is insufficient for the fixed-weight crystalline transfer; R25's level-one dihedral classification cannot be used for the two-prime foil. Added requests specify the ordinary weight-two eigenform realization, general weight-k system/residual contract and scalar crystalline criterion rather than assuming that broad stage names supply them.

The full upstream [Chebotarev](../../../content/tau-ceti/Chebotarev/README.md) and [GlobalNumberFields](../../../content/tau-ceti/GlobalNumberFields/README.md) documents were also read. Chebotarev Layer 10 supplies qualitative positive-density Frobenius classes and finite exclusions. It is requested from upstream, never re-planned.

Coverage was checked against each scoped stage's targets: R26.1 theorem/corollary/contracts; R26.2 lifts/systems/local conditions; R26.3 exact prime estimates/twists/induction; R26.4 local ordinary and lifting branches; R26.5 all five rows; R26.6 assembly/corollaries/W1; R27.1 definition/images/classification and the two stable sibling nodes; R27.2 L/W/D/arithmetic/Theorem 3.2. All have node-level plans or justified imports. The two R27.1 Chebotarev/insertion nodes already present in the sibling R27.3 packet were read and are not duplicated; Lemma 8.2 keeps its prime-field hypothesis. No stage is falsely marked closed. The seven planets name the central theorems/constructions; none is a local calculation or incidental estimate.

## Red-team dispositions

- **RT-AREA-langlands-2/1:** verified against both the base stage graph and accepted RS-06 links. The base graph alone does not yet include the R27.1→R33.2/R33.3 links. Taking their union exposes R26.1–R26.6 ancestry of R33.2–R33.5. The packet and reader correctly say that added links cannot delete this inherited requirement, and propose an early R27.1a versus late R27.1b split. A read-only simulation replacing the early prefix's incoming requirements and those modern-route endpoints removes every R26 ancestor of R33.1–R33.5. Retain the late R26.6→R27.3/W1 path and the prime-field sibling node; actual stage ids/edge deletions remain for the maintainer. R33.6 is deliberately outside that qualitative-independence test.
- **RT-AREA-langlands-2/7:** R07.5 owns the Savitt/BM integral tame classification after R07.4 descent; R15.4 owns the classical weight recipe. Packet and reader already make this distinction and propose R07.5→R24.6. The review strengthens the contract with the newly obtained BM hypotheses and separates the scalar FL criterion at the foil. The reader's claim that BM was not obtained is now stale and must change, as must its copied consumer hypotheses.
- **RT-AREA-langlands-2/11:** there is one odd auxiliary-prime estimate in R26.3. R27.2 imports it and retains the separate dyadic next-Fermat-prime application; it does not introduce a second analytic proof. The reader's introductory distinction is sound, but its duplicated r≥4 hypothesis and claimed dyadic equality require the corrections above.

## Independent arithmetic and Lean validation

An independent sieve through 22,000 checked every prime p with 5≤p≤21,591. For the least non-Fermat P>p it factored P−1, selected an exact odd prime power v=ℓ^e=2m+1, checked ℓ≤p and `(m+1)P+m≤vp`, and checked every integer j in `(mL,(m+1)L]`, L=(P−1)/v: both returned weights lie in [2,p+1] and all residue classes modulo L occur once. **2,422 primes passed; largest selected P=21,599; minimum integer margin 0.** This is an independent finite computation, not a Lean proof or a replacement for the source's analytic proof.

The initial triples are (5,7,3), (7,11,5), (11,13,3), (13,19,9), (17,19,9), (19,23,11), (23,29,7), (29,31,5), (31,37,9). At p=251 the selected P is 263 with v=131, correctly skipping 257. Every terminal row's exact divisor, exponent residue and returned weights was also checked. The two logarithmic endpoint margins are approximately **0.2459763296** at p=31 and **0.6667561461** at p=21,591; both comparisons increase thereafter. All uses of the repeating decimal retain the exact rational 22/15.

This compact Python reproduction covers the finite certificate without retaining private scratch files:

```python
from math import isqrt
limit = 22000
prime = bytearray(b'\1') * (limit + 1)
prime[:2] = b'\0\0'
for q in range(2, isqrt(limit) + 1):
    if prime[q]:
        prime[q*q:limit+1:q] = b'\0' * ((limit-q*q)//q + 1)
ps = [q for q in range(limit + 1) if prime[q]]
fermat = {2**(2**a)+1 for a in range(5)}
count, largest = 0, 0
for p in ps:
    if not 5 <= p <= 21591:
        continue
    P = next(q for q in ps if q > p and q not in fermat)
    choices = []
    for ell in ps:
        if ell >= P:
            break
        if ell == 2 or (P-1) % ell:
            continue
        v = ell
        while (P-1) % (v*ell) == 0:
            v *= ell
        m = (v-1)//2
        if (m+1)*P + m <= v*p:
            choices.append((v, ell, m))
    assert choices, (p, P)
    v, ell, m = max(choices)
    L = (P-1)//v
    js = range(m*L+1, (m+1)*L+1)
    assert ell <= p and len({j % L for j in js}) == L
    assert all(2 <= j+2 <= p+1 and 2 <= P+1-j <= p+1 for j in js)
    count += 1
    largest = max(largest, P)
assert (count, largest) == (2422, 21599)
```

The two definition families now have 16 API items and 11 tests. The additional locally-good tests catch replacing ∃q by ∀q, allowing a witness with trivial inertia, or losing basis invariance. HypL/W/D tests distinguish prime count from exponents, odd conductor from bounded dyadic valuation, and weight-two-only from the characteristic-two implication. Canonical representation-valued signatures/tests are still listed individually in the omission ledger rather than replaced by arbitrary Prop fields.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R26.1.json`: zero errors and zero warnings, including the pinned declaration index.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity--R26.1.lean`: exit 0, **32 warnings, all exactly declaration uses `sorry`**, no other warnings. Available memory exceeded 20 GB; one compile was run. This verifies elaboration of suggestions, not any mathematical proof.
- All ten PDF hashes matched; all 36 review entries and seven source-issue review entries are present; local prerequisite acyclicity, JSON validity and `git diff --check` passed.

## Required revision and orchestrator actions

Authorize the reader path in the revision deliverables and synchronize it from the corrected packet, preserving its useful prose. Specific current reader locations: copied hypothesis pairs at lines **362, 384, 406, 490, 536, 559, 581, 603, 625, 647**; wrong quadratic at **210**; coefficient-prime ramification omission at **248–250**; false Lean-proof claim at **322**; overbroad transfer at **339**; general-weight lifting/degenerate branches in the R26.4 sections; dyadic r/e and equality at **886/891** and **68**; BM access claims at **56/1071**. Synchronize all changed node statements/proof routes/prerequisites, the 16-item API/11 tests, the 20 requests, seven source issues, new source/version and six gap descriptions. Add the edition qualification for the newly recorded E13/E14. The report's per-node record is the authoritative change checklist.

Separately, apply the explicitly pending early/late R27.1 stage split and component endpoint changes, then re-run ancestry against the combined base and accepted links. Neither this review nor the revision may silently turn the proposed ids into live stages. Leave the inaccessible Duke numbering, unpublished Skinner CM correction, analytic prime-counting proof, supplier interfaces and integral proof details as precise gaps until their owners resolve them.

## Per-node independent audit

| Node (roadmap prefix omitted) | Verdict | Check/correction |
| --- | --- | --- |
| `R26.1/level-one-theorem-and-the-meaning-of-arises-from` | corrected | Khare Theorem 1.1 and the arises-from/strong-modularity conventions match. Corrected the proof summary to distinguish the three residual solvable branches instead of attributing ordinarity to solvability. Exact weight/level remains an R15/R20 import. |
| `R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof` | verified | Khare Corollary 1.2 has p>2; KW Corollary 8.1(i) includes p=2. Checked the corrected [24] Duke-numbered references, q=2 semistability/Annals input and the explicit unavailable-publication/CM boundaries. |
| `R26.1/bockle-appendix-minimal-deformation-ring-presentation` | verified | Read all seven Böckle appendix pages and the three R24/R04 supplier statements. Oddness, fixed-determinant convention, decomposable-flat exception and reduced Hecke hypotheses agree; no generic theorem is re-owned. |
| `R26.2/lifting-method-flatness` | corrected | Checked Khare §2.1 and R24 finite-flat complete-intersection contracts. Clarified that this is an application with local hypotheses, not a new generic lifting theorem or a restriction of the source to conductor one. |
| `R26.2/minimal-weight-two-lift` | corrected | Checked Proposition 2.1 including p>3, ordinarity, k=2 and k=p+1 distinctions. Added direct R17 solvable modularity and R20 ordinary weight-two eigenform realisation imports and a precise request. |
| `R26.2/local-ring-at-q-smooth` | corrected | Checked Proposition 2.2 proof on the rendered p.15. Corrected the quadratic sign (E13), explicit odd-prime/coefficient assumptions and unit Hensel derivative; smoothness conclusion is unchanged. |
| `R26.2/nebentype-lift-at-q` | corrected | Proposition 2.2 keeps non-solvable image, normalized weight, fixed determinant and prescribed q-nebentype. Clarified application ownership; the local and generic R24 inputs are direct. |
| `R26.2/compatible-system-lifts` | corrected | Proposition 3.1 has different residual hypotheses in (i) and (ii). Corrected literal ramification support to allow each member’s own coefficient prime, and separated the nonsolvable hypothesis on the new reduction from that on the original representation. |
| `R26.3/chebyshev-next-prime` | corrected | Checked §4 and the independently computed finite certificates. Clarified ℓ≤p after the Fermat skip using P<2p and ℓ≤(P−1)/2; the finite certificate checks this directly. The asymptotic input uses the corrected prime-counting bounds. |
| `R26.3/serre-weight-twist` | verified | Lemma 5.2 retains k≠2, k<p and the distinction between locally irreducible and split inertia cases. R15.4 supplies the recipe; neither arbitrary twists nor unnormalized weights are treated as weight-invariant. |
| `R26.3/weight-interval-containment` | corrected | Added positive-length and m≥1 hypotheses, both lower as well as upper returned-weight bounds, and the residue-coset selection argument. Removed the false claim that the arithmetic had been proved in Lean; suggested signatures are unproved. |
| `R26.3/level-one-induction-scheme` | corrected | Corrected the overbroad one-prime S(B) transfer. Prove the full theorem in characteristic P before applying Corollary 5.5(ii); part (i) only transfers fixed normalized weight k to q≥k−1. Added R15.4 normalization. |
| `R26.4/local-reducibility-ordinary` | corrected | Obtained BM Proposition 6.1.1: odd p, nonscalar principal-series type, HT {0,1}, arbitrary stable lattice, no End premise. Restricted the statement accordingly and separated Savitt’s semisimplification extension from its End-restricted corollary. |
| `R26.4/level-one-lifting-lemma` | corrected | Corollary 5.5 needs the general crystalline weight-k R24 lift/system, not just Khare’s weight-two Proposition 3.1. Added those direct imports, dihedral termination, residual-weight/transfer imports and the separate scalar crystalline FL ordinary criterion; endpoint and CM gaps stay explicit. |
| `R26.4/degenerate-branches` | corrected | Corrected solvable⇒ordinary and use of level-one classification at a foil ramified at P. Separate reducible, general bad-dihedral and cyclotomically absolutely irreducible solvable branches. Added the scalar crystalline BM Proposition 4.1.1/FL criterion, with k=2<ℓ including ℓ=3. |
| `R26.5/small-weights-table` | corrected | All five terminal applications and the R25 table cover the stated even weights through 32. Clarified old versus published Annals numbering; no new abelian-variety carrier or realization is introduced. |
| `R26.6/level-one-proof-assembly` | corrected | Checked the two-system link and R20 refinement. Clarified that the foil adds no fixed Weil–Deligne ramification while its own coefficient member can be ramified; the transfer still checks its local/residual hypotheses. |
| `R26.6/corollary-1-2-proof` | verified | Checked Khare §7.1, corrected KW §8.3 and published Annals Definition 4.1/Theorem 4.2(ii)/Theorem 5.2(ii)/§6.2. The conductor-two application has the explicit R01.5 semistability check and R25 realization/Schoof inputs, not an unconditional killing-ramification axiom. |
| `R26.6/finiteness-corollary-1-3` | verified | Corollary 1.3’s semisimplicity and finite cyclotomic twists are retained. The integral Hecke-algebra argument and prime-to-p abelian character quotient close the two branches via precise R15.3/R01.5 requests; finite complex dimension alone is not used. |
| `R26.6/corollary-8-1-ii-and-the-statement-W1` | corrected | Checked KW Corollary 8.1(ii) and its W1 consequence. Clarified that t=p is a branch handled by part (i), not an omitted source case; added the general R15.4 bad-dihedral weight prerequisite used to check restriction irreducibility. |
| `R27.1/good-dihedral-prime-definition` | corrected | Definition 2.1’s exact nontrivial odd prime-power order, strict size bound, conductor convention, inclusive congruence endpoint and basis invariance agree. Added three API items/tests for the existential locally-good wrapper, catching a universal-quantifier or witness-free definition. |
| `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved` | verified | Lemma 6.3’s minimal-at-q system, ramification support and bounded residual characteristic are retained. Its proof imports only the early image/conductor/system interface; no dependency on the mixed modularity alias or level-one theorem is introduced. |
| `R27.1/dickson-and-the-dyadic-solvable-refinement` | corrected | Checked KW Lemmas 6.1/6.2 and DP Definitions 1.12/Lemmas 1.13–1.14. Retained RS-06’s component owners and added the published Ribet proof locator with its rotation-subgroup misprint E14; that semistable theorem is not a general bad-dihedral weight theorem. |
| `R27.2/hypotheses-Lr-Wr-and-Dr` | verified | L_r/W_r/D_r domains, weight restrictions, odd-conductor versus dyadic-valuation conditions and monotonicity directions agree with §3. The seven API items/four meaningful tests remain typed mathematical plans with an honest missing-interface ledger. |
| `R27.2/prime-gap-estimates-driving-the-weight-recursion` | corrected | Corrected the remaining exponent/conductor-count collision r≥4 to e≥4 and the false equality for (13,17,4) to 176<208. The shared odd estimate stays owned by R26.3; only the dyadic application is retained here. |
| `R27.2/theorem-3-2-weight-reduction` | corrected | Read the entire three-part §8.2 argument. Retained the mandatory third system and final reduction to the predecessor characteristic; added the local crystalline-weight-two argument showing the foil cannot add an uncounted conductor prime. |
| `R26.3/explicit-prime-counting-input` | corrected | Removed copied terminal-row hypotheses and checked all four Rosser–Schoenfeld domains at published p.69. The natural-floor adapter matches pinned Nat.primeCounting; analytic proof/verification-table boundary remains honest. |
| `R26.3/next-prime-ratio` | corrected | Removed copied row hypotheses and added pinned Bertrand as a direct baseline prerequisite. Independently checked positive logarithmic margins at 31 and 21591 and the two-step non-Fermat comparison; exact 22/15 is retained. |
| `R26.3/finite-auxiliary-prime-checks` | corrected | Removed copied row hypotheses. Exhaustive independent sieve checked all 2,422 primes 5≤p≤21591, exact odd prime-power divisors, the least non-Fermat prime, ℓ≤p, integer inequality, all interval weights and residue representatives; largest chosen P=21599. |
| `R26.4/ordinary-reduction-and-parity` | corrected | Removed copied row hypotheses; checked normalized even-weight twist cases and distinguished ordinary-character parity, with k=P+1 handled separately and no characteristic-two inference. |
| `R26.5/terminal-row-branch-contract` | corrected | Removed copied hypotheses and the false level-one premise at the foil. The general bad-dihedral lemma and the three solvable branches now supply the local lifting contract; j must respect its residue coset and the return residual need not be irreducible. |
| `R26.5/weight-eight` | corrected | Replaced copied hypotheses by P=7, ℓ=3, support {3,7}, j=2. Checked exact divisor, coset and weights 4/6; export only after completing all normalized weights≤8 in characteristic 7. |
| `R26.5/weights-ten-twelve` | corrected | Replaced copied hypotheses by P=11, ℓ=5, support {5,11}, j=4. Checked the two residue cosets and weights 6/8; export after the full characteristic-11 bound 12 is proved. |
| `R26.5/weights-fourteen-twenty` | corrected | Replaced copied hypotheses by P=19, ℓ=3, support {3,19}, j=8. Checked exact divisor 9 and all four weights’ cosets; return weights 10/12 precede this row, then export the full bound 20. |
| `R26.5/weights-twentytwo-thirty` | corrected | Replaced copied E2 hypothesis: j=16 for 22/26/30 and j=14 for 24/28. Checked support {7,29} (E1), modulus 4 and weights 18/14 or 16/16; E2 belongs only to the next row. Export after the full bound 30. |
| `R26.5/weight-thirtytwo` | corrected | Replaced copied hypotheses by P=31, ℓ=5, support {5,31}, j=18. Checked 6∣18, 6∤16 and (12,18], returning weights 20/14 (E2); export after the full bound 32. |
