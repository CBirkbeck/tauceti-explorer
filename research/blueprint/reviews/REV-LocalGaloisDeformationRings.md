# Independent review: Local Galois deformation rings and their components

Job **REV-LocalGaloisDeformationRings**, issue **#447**. Reviewer: **Codex, codex-Co5mlT**, 7 October 2026. This session did none of the original planning. The review pass is complete, with verdict **needs_changes**.

All 153 original nodes have a verdict. Clear errors were corrected in place; no nodes were added or removed. Unresolved statements, supplier gaps, ownership conflicts and absent suggested signatures prevent acceptance. The packet is now partial, with precise remaining work for each of its eight stages. This is a completed independent review, not an unfinished review checkpoint. No implementation is claimed; every implementationStatus remains unchecked.

## Scope, counts and evidence

I read WORKERS, the blueprint and expansion protocols, UPSTREAM_GUIDE, the full issue after the confirmed claim, the packet, its suggested file, the reader document, the reviewed library audit, and the upstream ClassicalGroups and LocalFieldsRamification documents. This is a target-level review. I checked all node locators and excerpts in the public source versions below, including formula context when text extraction obscured subscripts. Reading a cited result and its relevant proof is not a claim to have independently reconstructed every imported theorem in each paper. The exact unresolved imports are recorded as gaps.

I read the statements of the 42 originally referenced external blueprint nodes, then the integral GSp and polarized local-problem supplier nodes added to prerequisites. The current packet has 43 distinct external blueprint-node prerequisites: removing the Colmez–Fontaine definition as a proof citation and adding two suppliers changes 42 to 43. I also read the stage scopes supplying R03.1–R03.3, R09.1, R07.1, R07.4, R06.3, R06.4, P7 and R30.5, and the actual ClassFieldTheory Layers 5 and 7 and ProfiniteCohomology Layer 9 statements. A requested stage is an explicit open input, not a theorem already supplied.

| Item | Original | Reviewed |
| --- | ---: | ---: |
| Nodes | 153 | 153 |
| Definitions and constructions | 43 | 43 |
| Planning API items | 208 | 246 |
| Planned unit tests | 160 | 162 |
| Planets | 43 | 43 |
| Source identifiers | 34 | 36 |
| Source-version records | 3 | 40 |
| Cross-roadmap requests | 17 | 19 |
| Recorded gaps | 3 | 11 |

Verdicts: **48 verified, 77 corrected, 28 unverifiable**. There are **94 edited nodes** and **191 changed node fields**, plus **10 changed top-level fields**. Verdicts describe whole targets: a target with a clear subcorrection and a remaining gap is still unverifiable. Some metadata/closure corrections also affect nodes whose mathematical target was verified. The complete per-node record and exact change ledger follow below.

The reviewed node kinds are 91 theorems, 14 lemmas, 14 definitions, 29 constructions, four comparisons and one application. The KW ordinarity import is a comparison rather than a second proof owned locally. No new node needed an addedBy marker.

## Mathematical corrections

1. **Obstructions, dimension and coefficient fields.** The minimal relation space is a quotient of the dual obstruction space: H²(G,ad ρ̄)∨ ↠ J/𝔪J, equivalently (J/𝔪J)∨ ↪ H²(G,ad ρ̄). An embedding in the opposite direction is not the canonical obstruction statement. Formal smoothness has relative dimension n²(1+[K:ℚ_p]) at p, and n² away from p; the extra one belongs to absolute dimension over a DVR. The equal-characteristic coefficient DVR requires the uniformizer-adic completion of 𝒪⟦t⟧[1/t]. The uncompleted ring has the additional ideal (t−ϖ). Natural-topology κ-coefficient duality is requested separately from finite discrete Tate duality.
2. **Tame decomposition.** The profinite Frobenius quotient is ℤ̂. Multiplicity spaces use representations over the residual coefficient field 𝔽, with absolute irreducibility after coefficient enlargement. The prime-to-p subgroup P_K here is not ordinary wild inertia; a tame character of prime-to-p order can act nontrivially on it.
3. **Types and components.** Away from p a full inertial WD type retains N. Its ring is the reduced flat closure of exact-type points; monodromy can drop at the boundary. Distinct such closures can meet, so neither a disjoint type-ring decomposition nor an exact-type iff at every boundary point is valid. Monodromy constancy uses the unique-component hypotheses of BLGGT Lemma 1.3.4. Fixed-determinant rank-two type components have absolute dimension four, while unrestricted ones have dimension five. The p-adic Hodge-type component comparison takes place inside a common bounded semistable-over-L locus, not inside the unrestricted lifting ring.
4. **Actual supplier scope.** R06.2 defines the Colmez–Fontaine proposition; it does not prove it. The R06.3 proof is still a proposal/open input. ClassicalGroups over ℂ does not supply integral GSp. ArithmeticStatistics ST.5 owns the integral matrix carrier; smooth group-scheme/Lie structure remains a precise extension request. Fixed data for a general reductive G means the full quotient G/Gder, rather than a single multiplier. Ding's result concerns the specified noncritical crystabelline locus.
5. **p-adic endpoints and finite-flat cases.** Strict Fontaine–Laffaille stops at p−2 and requires residual realizability and determinant compatibility. All clauses of KW II §3.2.7 use F_v=ℚ_p. Endpoint integral classifications and the complete KW Lemma 3.5 remain supplier gaps. For p>2, finite-flat Kisin theory contains étale as well as connected objects; only the stated connected restriction applies at p=2. Savitt's nodal presentation is restricted to its particular residual/type cases. BCDT's Barsotti–Tate type quotient is potentially crystalline; the larger PST quotient would include Tate-curve points of the wrong kind. Coefficients for nontrivial p-power inertial characters must be enlarged beyond ℤ_p.
6. **Ordinary conditions.** The weight dictionary records the dual/flag reversal between CN and KW; inertia-trivial is insufficient for arbitrary labelled weights. Ordinary representations need not be crystalline, as the Tate curve shows. Snowden's trivial residual example requires μ_p⊂F. Stable unramified Lagrangian planes require the actual quotient condition, not just a nonzero matrix entry. Only the weight-two arithmetic specializations have the cited semistable conclusion. The GL₂ upper-root character is εχ². Rank-four GSp connectedness cannot be deduced solely from rank-two connectedness.
7. **Integral matrix distinctions.** The determinant-ordinary non-example is now over ℤ/9: M=diag(4,7), U=(1 1;0 1). All elements of their generated group have characteristic polynomial (X−1)², but (M−I)(U−I)≠0. This replaces a field example that did not distinguish the conditions. The symplectic nilpotent model has ΦNΦ⁻¹=qN+q*N³ with q*=(q−q³)/3; the cubic term is essential in characteristic three. Rational nilpotent orbit statements retain splitting hypotheses. Repeated-root Hensel was replaced by the cyclic/Krylov-basis argument where appropriate.
8. **Doubling and rank-n conditions.** The eigenvalue/unramified decomposition is a direct sum of modules, not a product of rings. After inverting p the ordinary eigenvalue map is an isomorphism; rank two applies to its torsion unramified algebra, not generic degree. Trivial residual determinant χ^(n−1) requires n≡1 mod p−1. Partition dominance alone does not produce Taylor's q-chain quotient maps: roots {1,q,q²,b} split as (3,1) but generally not (2,2). Block Taylor–Wiles conditions impose scalar inertia; they do not derive it from the tame relation. Variable determinant and fixed determinant have different rank-two dimensions. Orbit lifting over Artinian coefficients is stronger than generic rank.
9. **Polarized level raising and GL₃.** The LTXZZ local nodal problem is polarized at an inert CM place, with q=Nv and residue cardinality q² upstairs. Its antisymplectic constraint and p∤(q²−1) hypothesis matter; it is not an arbitrary GL_N local problem. The rigid version keeps its disjoint-place and eigenvalue conditions. Nongeneric does not imply an empty crystalline ring; a trivial weight-zero lift is a counterexample. The identity-shape GL₃ row has six minimal primes, not three. Actual row equations, gauge comparisons and the component-weight graph remain absent.

## Baseline audit at the exact pins

All nine declarations exist under the cited names and in the cited modules. None was removed. Their checked records now explicitly state that the full declarations were read at the pins. Three provides clauses were narrowed: H2 supplies an additive group, Matrix.symplecticGroup uses AJAᵀ=J, and Weierstrass division keeps its nonzero residue-series hypothesis. These are limitations on use, not missing declaration names.

| Declaration | Exact pinned file | What it provides and what remains |
| --- | --- | --- |
| `mathlib:MvPowerSeries` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean) | Multivariable power series rings. |
| `mathlib:ProfiniteGrp` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean) | Profinite groups. |
| `tauceti:TauCeti.ContCohomology.H2` | [statement](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean) | The underlying additive group H²(G,M); a coefficient-linear structure, finite-dimensionality, duality and Euler characteristic need the stated suppliers. |
| `mathlib:Module.Finite` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean) | Finite modules (Lemma 6.2.9). |
| `mathlib:Matrix.symplecticGroup` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/SymplecticGroup.lean) | Matrices satisfying A J Aᵀ=J over a commutative ring. Use the carrier’s owner for GSp and a transpose-convention comparison before applying gᵀJg=νJ formulas. |
| `mathlib:IsAdicComplete` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | I-adic completeness of a module, used for the complete local coefficient rings |
| `mathlib:IsLocalRing.ResidueField` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean) | The residue field of a local ring |
| `mathlib:PowerSeries.exists_isWeierstrassFactorization` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean) | Weierstrass preparation over a complete local ring: g with nonzero image in k⟦X⟧ factors as a distinguished polynomial times a unit |
| `mathlib:PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` | [statement](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean) | Weierstrass division over a complete local ring, with the same nonzero residue-series hypothesis on the divisor; factor out a common uniformizer power before using it. |

MvPowerSeries, adic completeness, finite modules and residue fields are reused. Tau Ceti's H2 declaration alone gives neither coefficient-linear structure nor finite-dimensional Tate duality. Sp does not define GSp and its transpose convention must be translated. Both Weierstrass theorems require a nonzero residual series; a common uniformizer factor must be removed before applying them. The reviewed library audit has no completed LocalGaloisDeformationRings layer that justifies deleting these local targets; existing general algebra remains imported from its owners, with no new basic power-series, completion or symplectic carrier invented here.

## Closure, granularity, API, tests and suggested Lean

The target-level node budget is respected. Table-by-table proof lemmas are not required in this review, but an explicit-ring target must actually give its equations: a table reference alone leaves the GL₃ presentations unverifiable. Projective smoothness alone does not discharge the smooth-resolution criterion's algebraization/special-fibre comparison. General Kisin modules, Fontaine–Laffaille categories/realizations and the canonical torus stay with R07.4, R07.3/R06.4 and their reductive-group owner. Local coefficient-family, deformation and shape wrappers can remain here. The current API still needs that narrowing; marking the unresolved ownership as a gap does not make duplicated declarations acceptable.

The 19 requests now include exact natural-topology cohomology and Colmez–Fontaine proof needs. The existing requested finite-flat/local-model, Kummer, KW, moduli, algebra, Robba and block inputs were checked against their suppliers. I corrected the integral GSp owner, relation-map direction and scope where clear. Missing supplier statements remain open; no definition was silently treated as a proof. The eight-stage remaining table below identifies the unfinished target work. The five existing restructuring proposals remain proposals: they repair the stage-level cycles involving lattice moduli and ordinary coefficient rings and assign arithmetic consumers correctly, but this review does not apply atlas restructuring.

All 43 definitions/constructions have uses, an API and at least three precise planned tests. I added 38 API items: two for minimality/base-change and generator independence, and 36 tailored items covering uniqueness of closure quotients, moduli point descriptions, coefficient functoriality, extensionality, image rings, ordered matrix products, category inclusions and block projectors. The tests now total 162. Added tests detect the cubic nilpotent term and invalid partition-dominance inference; other tests were corrected for monodromy boundaries, coefficient fields, nonreduced ordinary matrices, endpoints, doubling and GL₃ components. Missing source inputs still prevent verification of the corresponding full APIs.

The suggested file's 153-entry mathematical inventory now agrees with the packet's statements, 246 API names/statements and 162 test names/statements. It is explicitly a comment inventory. Most definitions, API lemmas, tests and named theorems still have no elaborated signatures, so section 13 remains unmet. I removed malformed informal pseudo-signatures with undeclared carriers, preserved the four existing substantive sorry signatures, clarified the pointwise kernel-rank helper's limited meaning, and added genuine proved checks over ℤ/9 and ℤ/3. The file imports individual pinned Mathlib modules and does not invent Prop-valued carriers to hide missing mathematics.

The suggested file elaborates at the pinned Mathlib through lean-check. Its only warnings are the four existing declarations using sorry. The nonreduced determinant-ordinary characteristic-polynomial/product computations and characteristic-three cubic checks have proofs. Compilation validates that concrete content; it does not turn the inventory into Lean declarations and does not accept the blueprint.

All 43 planets are key definitions/constructions or central named theorems. Names fit the 60-character bound; no caveat, test or bookkeeping node is a planet. Their distribution is:

| Layer | Planets |
| --- | ---: |
| `LocalGaloisDeformationRings:L7` | 6 |
| `LocalGaloisDeformationRings:L8` | 4 |
| `LocalGaloisDeformationRings:R08.1` | 6 |
| `LocalGaloisDeformationRings:R08.2` | 6 |
| `LocalGaloisDeformationRings:R08.3` | 5 |
| `LocalGaloisDeformationRings:R08.4` | 6 |
| `LocalGaloisDeformationRings:R08.5` | 4 |
| `LocalGaloisDeformationRings:R08.6` | 6 |

No layer exceeds six. No planet names or node ownership were promoted to atlas data.

## Five confirmed red-team findings

| Finding | Packet and reader check | Remaining action |
| --- | --- | --- |
| RT-AREA-langlands-2/14 | R08.3/pst-quotient-in-families exports the rank-general family result, and both artifacts propose the R08.3→R19.5 input. | Maintainer applies the consumer/link proposal; filtered-module supplier closure is still open. |
| RT-AREA-langlands-2/16 | Both artifacts explicitly cite ClassFieldTheory Layer 5 for finite-coefficient duality/Euler characteristic. Added the missing direct prerequisite in the flag-ring target. | Apply the layer link and extend the supplier for natural-topology κ coefficients; finite coefficients alone do not suffice there. |
| RT-AREA-langlands-2/17 | Both artifacts identify R06.4 as the single owner of complete KW II Lemma 3.5, including Berger–Li–Zhu. The local proof becomes an imported comparison. | R06.4 does not yet supply that complete statement. Keep the request, correct every weight-(p+1) clause to ℚ_p, and update ownership/link records. |
| RT-AREA-langlands-2/18 | Both artifacts plan general potentially semistable rings once in R08.3, with L7 importing them. | Further narrow L7's general FL/Kisin category APIs to wrappers around their existing owners; the present duplication is a separate remaining conflict. |
| RT-AREA-langlands-2/22 | Both artifacts direct arithmetic component-support consumers to PotentialAutomorphyInfrastructure PA.3, keeping P9 algebra-only. | Apply the proposed L7/L8/G8→PA.3 atlas links; no atlas file was edited here. |

## Source issues

All source issues have an independent confirmed verdict; E3 was added in this review. Evidence is mathematical, with exact public versions and limitations below.

- **E1, Savitt:** arXiv v3 Remark 1.7 reports the published Theorem 6.12(4) error for i=1 and its corrected split reduction. I checked that report and the character coincidence. The published journal PDF was not separately read; confirmation uses the author's explicit correction. Theorem 6.22–6.24 applications are unaffected. [Corrected public text](https://arxiv.org/pdf/math/0404327v3).
- **E2, CHT:** the character ratio printed in §2.4.2, p.37, is inverted relative to the H² vanishing required in the proofs on pp.39–40. For a cyclotomic subline over ℚ_l, l>3, the printed exclusion allows the nonzero H² obstruction. The first-order upper-triangular count is five rather than the claimed four before framing. The corrected exclusion is χ̄_j/χ̄_i≠1,ε̄ for i<j, with the specified source ordering. [Public journal text](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf).
- **E3, Gee:** §3.30 retains N in full inertial WD type, while the point criterion after Theorem 3.31 excludes its possible degeneration. For q≡1 mod p, Φ=diag(q,1) and inertia (1,c;0,1), c=pt, form a continuous family of fixed determinant q. Nonzero c gives Steinberg monodromy; c=0 gives N=0. A closed quotient containing the dense nonzero-c locus contains the boundary. The correct statement is the closure criterion, with unique-component qualifications for constancy. [Gee](https://arxiv.org/pdf/2202.05818v2), [Shotton Definition 3.5/Proposition 3.6](https://arxiv.org/pdf/1608.01784v2), [BLGGT Lemma 1.3.4](https://arxiv.org/pdf/1010.2561v4).

E1 is an author-reported correction. For E2/E3 the records retain the erratum-search results rather than claiming that no erratum exists. Other source corrections already routed through reviewed paper extractions remain cited where used; this review does not certify the entirety of those extractions.

## Public source-version record

Every original source identifier was checked in an accessible public version. Shotton and Thorne were added. Each reviewedVersion has the URL, SHA-256 and reading date; sourceVersions preserves the three historical entries and adds 36 review entries plus the separate CG20 appendix, for 40 records. KISIN-PST-2008 and KISIN-PST-2008-AMS are two identifiers for the same author DVI, not two independent editions. Cited sections/locators are in each node and each source's readSections.

| Source identifier | Public version actually checked | SHA-256 |
| --- | --- | --- |
| `GEE-MLT-2022` | [public text](https://arxiv.org/pdf/2202.05818v2) | `878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5` |
| `KISIN-LECTURES` | [public text](https://people.math.harvard.edu/~kisin/notes/notes.pdf) | `9f3698a791b6a96318b8eded26962f2da7d3f34628ab47d855df7e36cd5712c6` |
| `TUNG-2021` | [public text](https://arxiv.org/pdf/1908.06174v3) | `a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8` |
| `CHT08` | [public text](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| `TAYLOR-II-2008` | [public text](https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf) | `f9014a899bcccaa56035314f196b15b581abe63d56cb9d9a285ce9e93f1030bc` |
| `KISIN-PST-2008` | [public text](https://people.math.harvard.edu/~kisin/dvifiles/def.dvi) | `ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee` |
| `KW2-2009` | [public text](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| `KISIN-FFLAT-2009` | [public text](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi) | `242151c94cb831c526e67de6e3b70a370b65a002342074440e86fc88a2ec5f0f` |
| `SAVITT-2005` | [public text](https://arxiv.org/pdf/math/0404327v3) | `e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c` |
| `ACC-POTENTIAL-AUTOMORPHY-CM-2023` | [public text](https://arxiv.org/pdf/1812.09999v2) | `7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c` |
| `SKINNER-WILES-1999` | [public text](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) | `ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3` |
| `KISIN-2ADIC-2009` | [public text](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi) | `a11fdea301d662ada1cd675bea21a89ba9ab0a75955e496e4a1bcdecab97bf7d` |
| `BIP-2023` | [public text](https://arxiv.org/pdf/2110.01638v2) | `b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4` |
| `PQ-2026` | [public text](https://arxiv.org/pdf/2404.14622v2) | `eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c` |
| `CG-2018` | [public text](https://arxiv.org/pdf/1207.4224v2) | `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb` |
| `BCGP-2021` | [public text](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| `BHS-2019` | [public text](https://arxiv.org/pdf/1702.02192) | `4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961` |
| `DING-2025` | [public text](https://arxiv.org/pdf/2407.21237) | `a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8` |
| `LTXZZ-2022` | [public text](https://arxiv.org/pdf/1912.11942v3) | `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86` |
| `LTXZZ-RIGID-2021` | [public text](https://arxiv.org/pdf/2108.06998v1) | `fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a` |
| `NT-2026` | [public text](https://arxiv.org/pdf/2212.03595v2) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| `CG-2020` | [public text](https://arxiv.org/pdf/1907.08691v1) | `39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059` |
| `FKP-2022` | [public text](https://arxiv.org/pdf/2008.12593v5) | `6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2` |
| `BCGP-2025` | [public text](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| `KISIN-PST-2008-AMS` | [public text](https://people.math.harvard.edu/~kisin/dvifiles/def.dvi) | `ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee` |
| `CDN-2023` | [public text](https://arxiv.org/pdf/2204.11214) | `c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee` |
| `BCDT-2001` | [public text](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf) | `13043cf6e9043a69dc7988882658cd92595efc88dfd4fd2f326ac3ef3cae8e06` |
| `CN-2023` | [public text](https://arxiv.org/pdf/2301.10509v3) | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |
| `KW1-2009` | [public text](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| `BLGGT-2014` | [public text](https://arxiv.org/pdf/1010.2561v4) | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| `BCGNT-2025` | [public text](https://arxiv.org/pdf/2309.15880) | `0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d` |
| `BCG-2025` | [public text](https://arxiv.org/pdf/2309.15944v3) | `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684` |
| `LLHLM-2020` | [public text](https://arxiv.org/pdf/1608.06570v4) | `cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd` |
| `CT-2017` | [public text](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf) | `a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659` |
| `SHOTTON-2018` | [public text](https://arxiv.org/pdf/1608.01784v2) | `54775e5adac83cdbb628ea5238aab8a7a04a3d9bb3dc2502b46da6bb21689992` |
| `THORNE-2015` | [public text](https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download) | `76393fcb9a31931789fa4f7c6de9a64275fb02e81e5a3b98c53b8aa1a1834928` |
| `CG-2020`, separate appendix §A.4 | [public text](https://arxiv.org/pdf/1907.08694v1) | `8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed` |

The AMS endpoints for Kisin PST and BCDT did not supply the PDFs in this run. I read Kisin's author DVI, where the published locator corresponds to author page plus 512, and BCDT's public author manuscript. BCDT §1.1/Conjecture 1.1.1 occur at author pp.7–8 and §4.3 at author pp.27–28; those alternative locators were added. Published BCDT pagination was not independently checked. The remaining Kisin author DVIs, Thorne's accepted manuscript dated 16 April 2014, and Clozel–Thorne's accepted manuscript retain their section/theorem labels. Thorne's access is resolved; Geraghty's exact completed-local/ordinary inputs remain a mathematical/source gap, not a Thorne-access gap. The CG20 appendix was checked separately from its main manuscript. Hashes establish the reviewed bytes, not identity of every preprint with a later published edition.

## Reader consistency and revision questions

The issue permits edits to the packet, suggested file and review report. WORKERS permits this job's handoff. The reader document is outside those deliverables, so its corrections must be included in the revision job's scope. I read it and checked the five red-team treatments, but left it unchanged. It now contradicts the corrected packet in several places:

| Reader location | Revision required |
| --- | --- |
| Requests and R08.1/local-tangent-obstruction, lines 25 and 71–79 | Correct the obstruction-map direction and absolute/relative dimension. |
| Supplier list, line 35 | Replace the complex ClassicalGroups citation as integral GSp provider. |
| R08.2/inertial-type-quotient and inertial-type-with-monodromy, lines 446 and 608 | State flat closures, monodromy boundary behavior and intersecting components. |
| R08.2/level-raising-local-problems, line 561 | Restore polarization, inert-place q versus q² normalization and side conditions. |
| R08.2/gsp4-unipotent-local-models, line 776 | Include q*N³ in the defining equation and the splitting qualifications. |
| R08.3/hodge-type-components, line 1017 | Use the common bounded semistable locus. |
| L7 ordinary/eigenvalue entries, lines 1367 and 1601, and L8 doubling, line 2200 | Retain the corrected character direction and module/generic-degree distinctions. |
| R08.5/weight-p-plus-one-ordinary-ring, line 2656, and endpoint export, line 2880 | Restrict all weight-(p+1) clauses to ℚ_p. |
| Remaining-gap list, line 3077 | Thorne is now read publicly; replace the access claim with the exact Geraghty prerequisite gap. |

The full node-change ledger below is the authoritative list for synchronizing all 94 edited entries, including Savitt's case restrictions, p=2 connectedness, endpoint imports, ordinary signs, coefficient enlargement and GL₃ component counts.

Orchestrator decisions needed for the revision:

1. Include the reader document in the revision deliverables so its contradictory assertions can be fixed with the packet and suggested file.
2. Route the exact Pappas–Rapoport/Deligne–Pappas and Emerton–Gee/generic-reducedness inputs to an owner or Part II, preserving the recorded cases needed here.
3. Finish the R06.3 Colmez–Fontaine proof and R06.4 KW/endpoint statements; retain one general R07.4 Kisin/descent API and R07.3/R06.4 FL API.
4. Resolve the precise Geraghty flag/ordinary and rank-four component inputs, general G/Booher hypotheses, canonical-torus comparison and Dotto cycle-map ownership.
5. Apply the five existing restructuring/link proposals, after reconciling the L7 lattice/ordinary coefficient ordering with the single owners. This review requests no promotion.

## Stage work remaining

Every stage is partial; these remaining lists are copied exactly from the reviewed packet.

### LocalGaloisDeformationRings:R08.1

- Lemma-level refinement (when the roadmap reaches lemma level): PQ26 Lemmas 3.3–3.5 (continuous sections for G(A), A ∈ 𝔄_Λ) and BIP23 Corollary 3.42 (regularity of X^gen read on completions) as separate lemma nodes.
- Complete the κ-coefficient duality comparison and integral GSp group-scheme supplier; restrict Ding to ΦΓ_nc(φ,h).

### LocalGaloisDeformationRings:R08.2

- G-valued (beyond GL_n and GSp₄) minimally ramified and fixed-type rings away from p are planned only through R08.2/g-valued-generic-fibre-away-from-p (Bellovin–Gee, Booher, as FKP use them); Booher's construction of minimally ramified G-valued conditions is cited there, not decomposed.
- BCGP21 Propositions 7.4.14–7.4.18 (components of 𝒩(q) and ℳ(x, y; q)) are stated inside R08.2/gsp4-unipotent-local-models and R08.2/gsp4-ihara-avoidance-rings; a lemma-level pass splits them.
- Supply the exact general G minimally ramified hypotheses/definitions and the Dotto inertial cycle-map input. Keep monodromy type closures and the polarized inert-place level-raising normalization.

### LocalGaloisDeformationRings:R08.3

- CDN Théorème 5.11 rests on the p-adic local Langlands correspondence (requested from PadicLocalLanglandsForGL2Qp R30.5); its proof is not decomposed here.
- Ding's trianguline variety X^□_tri and its smoothness at non-critical points belong to the trianguline-variety roadmap proposed by the Breuil–Hellmann–Schraen extraction (route 2); R08.3 plans only the (φ, Γ)-module deformation rings (R08.1/phi-gamma-module-deformation-rings) it consumes.
- Complete the determinant and Hodge-type compatibility hypotheses and the fixed-extension G-valued quotient/flag comparison.
- Import the actual ColmezFontainePst proof from R06.3; the existing R06.2 node only defines the proposition.

### LocalGaloisDeformationRings:R08.4

- Generic reducedness of potentially Barsotti–Tate rings (Caraiani–Emerton–Gee–Savitt) is a recorded gap behind R08.4/bt-ring-unique-generalisation.
- Provide the precise local-model supplier and endpoint integral classification behind the stated resolutions.

### LocalGaloisDeformationRings:R08.5

- The Pappas–Rapoport local-model input behind R08.5/rank-two-connected-components remains the recorded gap.
- Import the complete KW II Lemma 3.5 and the integral endpoints, retaining flat-family hypotheses at p=2.
- Make the connected augmented-coefficient node a wrapper around R07.4’s category and realization, not a second integral Kisin theory.

### LocalGaloisDeformationRings:R08.6

- The modern general de Rham lifting theorem itself is GL2ModularityLifting R32; R08.6 exports its local conditions (R08.6/ordinary-pcris-lifts-reducible, R08.6/serre-weight-crystalline-lift, R08.6/newton-thorne-local-quotients, R08.6/torsion-semistable-condition, R08.6/category-deformation-conditions).
- Complete the endpoint classification dependencies for the exported local table; reconcile the corrected Savitt type restriction in the reader document.

### LocalGaloisDeformationRings:L7

- LLHLM's row-by-row computations (Tables 3–4, the matching cases of §3.6.2 and Lemmas 3.6.12–3.6.16) are summarised in L7/gl3-explicit-rings and L7/gl3-component-labelling; a lemma-level pass gives one node per row.
- Geraghty's ordinary rings for nontrivial ρ̄ in rank n are planned through L7/ordinary-flag-scheme (all ρ̄), L7/g-valued-ordinary-quotient and L7/g-valued-ordinary-components (G = GL_n); Geraghty's own Corollary 3.6 and Lemmas 3.7, 3.10, 3.14 are cited from those nodes and from L7/weight-zero-crystalline-connectedness rather than read from Geraghty's paper, which was not obtained.
- Give actual GL3 row presentations and exact gauge-basis comparisons; import general Kisin/FL and canonical-torus objects from their owners. Resolve the ordinary sign dictionary and Geraghty/rank-four component inputs.
- Remove duplicated FL/Kisin category declarations from local API; retain coefficient-family and GL₃ shape wrappers using the single R06.4/R07.3/R07.4 owners.

### LocalGaloisDeformationRings:L8

- Implement actual determinant-ordinary signatures and examples in the suggested file; retain the corrected nonreduced matrix test and module, rather than ring, doubling comparison.

## Per-node verdicts

Each node was checked against its source, hypotheses, direct prerequisites and target-level proof sketch. For definitions/constructions this includes the API and tests. A verified target may still import a precisely requested stage. Unverifiable means a substantive missing statement or comparison remains. Field changes in corrected subparts do not override that verdict.

| Node | Verdict | Review note | Edited fields |
| --- | --- | --- | --- |
| `LocalGaloisDeformationRings:R08.1/local-lifting-ring` | verified | Local framed representability is a specialization of R04.1; coefficient and strict-equivalence conventions agree. | — |
| `LocalGaloisDeformationRings:R08.1/local-tangent-obstruction` | corrected | Separate absolute Krull and relative smooth dimensions. The canonical minimal-presentation map is H2 dual onto J/mJ, equivalently (J/mJ) dual into H2. | acceptance, proofSteps, statement |
| `LocalGaloisDeformationRings:R08.1/local-fixed-determinant` | verified | The integral determinant splitting requires p not dividing n; retain it and use rational twisting separately at p dividing n. | — |
| `LocalGaloisDeformationRings:R08.1/local-forget-framing` | verified | The trace splitting and determinant deformation complex agree with the fixed-determinant supplier. | — |
| `LocalGaloisDeformationRings:R08.1/archimedean-rings-p-odd` | verified | The archimedean odd component has the stated dimension when 2 is invertible. | — |
| `LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2` | verified | Cayley–Hamilton gives trace zero for a determinant-minus-one involution over every commutative ring, including characteristic two. | — |
| `LocalGaloisDeformationRings:R08.1/local-residue-field-change` | verified | Coefficient extension agrees with R04.2; distinguish finite unramified coefficient extension from extension of K. | — |
| `LocalGaloisDeformationRings:R08.2/tame-splitting` | corrected | The Frobenius quotient is Zhat, not Z; coefficients are F[P_K]. P_K here is the kernel of I_K to Z_p and includes prime-to-p tame inertia. Add splitting coefficients. | acceptance, hypotheses, statement |
| `LocalGaloisDeformationRings:R08.2/unramified-lifting-ring` | verified | The unramified framed functor is the formal completion of GL_n at the chosen Frobenius matrix. | — |
| `LocalGaloisDeformationRings:R08.2/minimally-ramified-condition` | corrected | The minimal condition needs base-change and choice-independence API for kernel flags. | api |
| `LocalGaloisDeformationRings:R08.2/minimally-ramified-ring` | verified | Minimal ramification formal smoothness follows from CHT Jordan-type lifting and the local duality input. | — |
| `LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p` | verified | Rank-two unrestricted away-from-p statements agree with Gee; their dimensions are absolute unless explicitly relative. | — |
| `LocalGaloisDeformationRings:R08.2/inertial-type-quotient` | corrected | Exact WD inertia type retains N and need not be closed at component intersections. Use the reduced flat Zariski closure of exact-type points, not a pointwise iff. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, proofSteps, sources, statement, tests |
| `LocalGaloisDeformationRings:R08.2/taylor-wiles-local-ring` | corrected | The q not congruent to one extrapolation also requires eigenvalue ratio different from q and q inverse. | acceptance |
| `LocalGaloisDeformationRings:R08.2/steinberg-condition` | corrected | The Steinberg condition is a flat closure and includes boundary points with zero monodromy. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components` | corrected | Use Thorne Proposition 3.15 for the extension beyond Taylor’s standing p>n and sufficiently large coefficients for geometric irreducibility. Rank-two fixed determinant is separately p odd. | hypotheses, sources |
| `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types` | corrected | Hodge type dimensions use labelled embeddings and partial flag multiplicities; p-adic inertial type forgets N. Added the missing characterisation, compatibility API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:R08.3/semistable-height-quotient` | verified | The semistable quotient construction depends on the bounded-height lattice supplier and retains that dependency. | — |
| `LocalGaloisDeformationRings:R08.3/hodge-type-components` | verified | Generic-fibre dimensions agree with Kisin’s theorem in arbitrary rank and arbitrary finite K/Q_p. | — |
| `LocalGaloisDeformationRings:R08.3/pst-deformation-ring` | corrected | Different Hodge/type loci are not irreducible components of the unrestricted ring. The component statement is inside a fixed bounded semistable-over-L quotient. | acceptance, proofSteps, statement |
| `LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations` | unverifiable | The R06.2 Colmez–Fontaine node defines the proposition. Its supplier packet proposes, but does not yet contain, the proof in R06.3; replace the definition citation as proof input by an explicit stage request and gap. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses, prerequisites |
| `LocalGaloisDeformationRings:R08.3/pst-generic-fibre` | corrected | Fixed-determinant dimensions require a compatible nonzero quotient; rational determinant twisting handles p dividing the rank. | hypotheses, prerequisites, statement |
| `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth` | corrected | Fontaine–Laffaille smoothness requires residual FL realizability and compatible determinant, not just a weight interval. | hypotheses, prerequisites |
| `LocalGaloisDeformationRings:R08.3/pst-coefficient-change` | verified | Generic regularity is stable under the finite separable coefficient extensions in the source. | — |
| `LocalGaloisDeformationRings:R08.4/flat-deformation-condition` | corrected | The finite-flat deformation condition is conditional on the imported Raynaud closure results. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli` | corrected | Finite-flat model moduli use the p>2 classification; the p=2 extension needs its separate connected construction. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:R08.4/small-ramification-flat` | verified | Small-ramification uniqueness retains e<p−1 and the exact Raynaud supplier. | — |
| `LocalGaloisDeformationRings:R08.4/flat-generic-fibre` | verified | The dimension and irreducibility count is for the specified flat/FL condition, not every crystalline lift. | — |
| `LocalGaloisDeformationRings:R08.4/hodge-type-resolution` | corrected | The Hodge vector fixes determinant Hodge type only, leaving an unramified determinant twist. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | acceptance, api |
| `LocalGaloisDeformationRings:R08.4/resolution-local-structure` | unverifiable | The Pappas–Rapoport/Deligne–Pappas input is an honest unresolved local-model gap. | — |
| `LocalGaloisDeformationRings:R08.4/components-via-special-fibre` | verified | Component comparison uses the cited formal-functions and algebraization suppliers; projectivity alone is insufficient. | — |
| `LocalGaloisDeformationRings:R08.4/ordinary-type-of-components` | verified | Ordinary type is constant on the specified finite-flat model components. | — |
| `LocalGaloisDeformationRings:R08.4/rank-two-nonordinary-connected` | verified | The nonordinary connectedness result retains K_0=Q_p; it is not arbitrary K. | — |
| `LocalGaloisDeformationRings:R08.4/rank-two-ordinary-locus` | verified | The rank-two ordinary finite-flat locus has the stated one/two/P1 cases with the specified residual characters. | — |
| `LocalGaloisDeformationRings:R08.4/rank-two-bt-components` | verified | The unrestricted Barsotti–Tate dimension is 4+d and the determinant-fixed dimension 3+d. | — |
| `LocalGaloisDeformationRings:R08.4/savitt-weight-two-rings` | corrected | Savitt’s residual shapes must be written explicitly; pointing to a list does not state the theorem. | statement |
| `LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion` | unverifiable | The smooth-resolution criterion needs a precise algebraization and special-fibre comparison, not only smoothness of a projective scheme. | — |
| `LocalGaloisDeformationRings:R08.6/kw-local-conditions` | corrected | KW’s local table distinguishes F_v=Q_p in the exceptional weights and compatible determinant. Added the missing characterisation API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:R08.6/export-archimedean` | verified | The odd archimedean criterion agrees with the earlier construction. | — |
| `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible` | unverifiable | Weights p and the p=2 endpoint exceed the strict FL interval; the integral endpoint classification input is missing. | — |
| `LocalGaloisDeformationRings:R08.6/export-weight-two-irreducible` | corrected | The nodal weight-two ring belongs to the specific nontrivial tame principal-series inertial type of Savitt 6.22(3). | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.6/export-ordinary` | verified | The ordinary component exports the specified ordinary deformation condition. | — |
| `LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p` | corrected | Dropping the chosen Frobenius eigenvalue while retaining determinant does not automatically add a parameter. | acceptance |
| `LocalGaloisDeformationRings:R08.6/export-endpoint-weight` | unverifiable | The weight-(p+1) Berger–Li–Zhu branch is over Q_p and needs the requested single owner. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.6/export-away-from-p` | verified | Away-from-p inertia-rigid conditions correctly import the finite-inertia global supplier. | — |
| `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product` | corrected | The tensor product needs direct prerequisites for the local cases whose dimensions it sums. | prerequisites |
| `LocalGaloisDeformationRings:R08.6/local-nonemptiness` | verified | The nonemptiness argument is conditional on all the individual local-ring inputs. | — |
| `LocalGaloisDeformationRings:L7/finite-height-lattices` | unverifiable | General finite-height Kisin modules belong to R07.4; retain only the deformation-family lattice wrapper here. Added the missing extensionality API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:L7/height-lattice-moduli` | unverifiable | The moduli theorem still depends on the imported finite-height family theory and local-model comparison. | — |
| `LocalGaloisDeformationRings:L8/ordinary-coefficient-ring` | corrected | The local Artin normalization is needed directly to define the ordinary coefficient ring. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api, prerequisites |
| `LocalGaloisDeformationRings:L7/ordinary-flag-scheme` | corrected | The flag scheme’s proper map defines an image ring; flags live over coefficient algebras, not only the residue field. Added the missing universal-property, functoriality API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:L7/trivial-residual-flag-ring` | unverifiable | Thorne 2015 Proposition 3.14 and Lemmas 3.11–3.13 are publicly available. The Geraghty completed-local comparison remains an unexpanded input. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | proofSteps |
| `LocalGaloisDeformationRings:L7/residually-split-nearly-ordinary-ring` | corrected | The Skinner–Wiles tangent computation requires local Tate duality directly. | prerequisites |
| `LocalGaloisDeformationRings:L8/determinant-ordinary-ring` | corrected | The repeated-character field test is false. A genuine failure of product annihilation occurs over Z/9 with diag(4,7) and an upper unipotent generator. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api, tests |
| `LocalGaloisDeformationRings:L8/det-ord-finite` | verified | Finite root choices give the finite module comparison; distinguish a module decomposition from a ring product. | — |
| `LocalGaloisDeformationRings:L8/ordinary-point-criteria` | verified | The reduced image comparison is made after the reduction/flatness operation stated in ACC. | — |
| `LocalGaloisDeformationRings:L8/distinct-characters-flag` | verified | Distinct prescribed ordered characters give a flag; fieldwise repeated characters do not give the proposed non-example. | — |
| `LocalGaloisDeformationRings:L8/determinant-flag-comparison` | unverifiable | The ACC dimension bound consumes Thorne/Geraghty flag geometry, not determinant equations alone. | — |
| `LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition` | unverifiable | The general Fontaine–Laffaille category and realization functor belong to R06.4/R07.3; this node should be only a local deformation wrapper. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness` | verified | The FL tangent calculation agrees with the fixed interval and residual realization assumptions. | — |
| `LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters` | corrected | CHT’s printed ratio is inverted relative to the proof; the matrix test must put chi_1 on the stable subline. Added the missing simp API, with its coefficient/ordering hypotheses explicit. | api, tests |
| `LocalGaloisDeformationRings:L7/ordinary-fixed-inertial-characters-smoothness` | verified | Ordinary fixed-inertial-character smoothness uses the corrected ratio and ordered filtration. | — |
| `LocalGaloisDeformationRings:L7/discrete-series-deformation-condition` | corrected | The q=1 test violates the discrete-series hypothesis; use it only as a contrast between Frobenius-polynomial conditions. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | acceptance, api, tests |
| `LocalGaloisDeformationRings:L7/discrete-series-smoothness` | corrected | The new block has rank d, not the auxiliary integer m, in the inductive tangent computation. | acceptance, proofSteps |
| `LocalGaloisDeformationRings:R08.5/connected-kisin-modules-with-coefficients` | corrected | Connectedness is not automatic for p>2. The etale rank-one Kisin module is a real finite-flat object, also at p=2. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, statement, tests |
| `LocalGaloisDeformationRings:R08.5/etale-multiplicative-parts` | corrected | At p>2 the equivalence covers all finite-flat objects; do not claim every object is connected. | acceptance |
| `LocalGaloisDeformationRings:R08.5/connected-model-moduli` | corrected | The p=2 model construction cannot invoke a p>2-only moduli node as its proof. | prerequisites |
| `LocalGaloisDeformationRings:R08.5/flat-connected-deformation-ring` | corrected | The connected flat locus is open inside the flat deformation family, not inside an arbitrary unrestricted Galois deformation ring. | hypotheses |
| `LocalGaloisDeformationRings:R08.5/rank-two-type-v` | unverifiable | The determinant condition for local models uses labelled Hodge data; the requested local-model supplier is still absent. | — |
| `LocalGaloisDeformationRings:R08.5/rank-two-connected-components` | corrected | At p=2 a rank-two fixed determinant cannot use the p-prime-to-rank integral split; use rational twisting. | hypotheses, prerequisites |
| `LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2` | corrected | The ordinary domain/normality conclusion requires the source’s formally smooth flat deformation family. | hypotheses |
| `LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison` | verified | The away-from-two and archimedean component analysis agrees with the displayed presentations. | — |
| `LocalGaloisDeformationRings:R08.1/coefficient-rings-lambda` | corrected | O_L[[t]][1/t] is not a DVR before p-adic completion; for example t−pi gives another maximal ideal. | proofSteps |
| `LocalGaloisDeformationRings:R08.1/lambda-presentation` | unverifiable | Local duality over the possibly infinite characteristic-p residue field needs an extension beyond finite discrete modules in ClassFieldTheory Layer 5. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses |
| `LocalGaloisDeformationRings:R08.1/completion-at-points` | verified | The completed-local comparison agrees with the coefficient-extension construction. | — |
| `LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre` | verified | Regularity uses the characteristic-zero local deformation theorem, not the dimension lower bound by itself. | — |
| `LocalGaloisDeformationRings:R08.1/rank-one-ring` | verified | Rank-one components are indexed by the finite p-power torsion character choice. | — |
| `LocalGaloisDeformationRings:R08.1/determinant-twisting` | verified | Rational determinant twisting is valid even at p dividing n; integral twisting is not claimed. | — |
| `LocalGaloisDeformationRings:R08.1/g-valued-framed-ring` | unverifiable | ClassicalGroups Layer 0 is over C and does not supply integral GSp. ArithmeticStatistics ST.5 supplies its matrix carrier; integral group-scheme/Lie API still needs an extension. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. Added the missing extensionality API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, prerequisites |
| `LocalGaloisDeformationRings:R08.1/g-valued-presentations` | verified | The relative G-valued presentation uses the full Lie algebra, or its derived Lie algebra when the full abelianization is fixed. | — |
| `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings` | corrected | Ding assumes a noncritical crystabelline module in PhiGamma_nc(phi,h), not an arbitrary generic trianguline module. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, tests |
| `LocalGaloisDeformationRings:R08.2/q-tame-group` | corrected | The tame pair description requires complete local coefficient rings and continuity. Added the missing extensionality API, with its coefficient/ordering hypotheses explicit. | api, hypotheses |
| `LocalGaloisDeformationRings:R08.2/level-raising-local-problems` | corrected | The level-raising model is for polarized G_N-valued lifts at an inert place. Frobenius on F_w has residue cardinality q_v squared; arbitrary GL_N loses the polarization constraint. | acceptance, api, hypotheses, prerequisites, proofSteps, statement, tests |
| `LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection` | corrected | The unrestricted away-from-p complete intersection dimensions agree with Shotton; k in Delta must mean the local residue field. | acceptance |
| `LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy` | corrected | A monodromy type ring is the closure of exact-type points, with possibly smaller monodromy at boundary points. Type-ring loci are not a disjoint union. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, proofSteps, sources, statement, tests |
| `LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n` | corrected | Full monodromy constancy needs both points on a unique irreducible component, as BLGGT 1.3.4(2) states. Fixed-determinant rank-two absolute dimension is four. | acceptance, hypotheses, proofSteps, statement |
| `LocalGaloisDeformationRings:R08.2/rank-two-unrestricted-rings-cg` | corrected | CG’s smoothness result assumes a ramified representation of conductor minimal among twists at v\|N; it does not cover arbitrary unrestricted residual representations. | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent` | corrected | Restore the source’s p>n standing hypothesis, unless the characteristic-small extension is separately proved. | hypotheses |
| `LocalGaloisDeformationRings:R08.2/steinberg-ring-domain` | corrected | Thorne 2015 Proposition 3.17 is accessible; fixed-determinant rank-two dimension is four. | acceptance, hypotheses, sources |
| `LocalGaloisDeformationRings:R08.2/dotto-division-algebra-cycles` | unverifiable | Dotto’s cycle map and the inertial Jacquet–Langlands transfer are not supplied; JL cannot simply be applied to an O_D-unit representation. | — |
| `LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified` | corrected | Multiple-root Hensel does not lift the kernel flag. Use a lifted cyclic vector and invertibility of its Krylov matrix. | proofSteps |
| `LocalGaloisDeformationRings:R08.2/gsp4-ramification-types` | corrected | Finite-field rank-two square-zero symplectic nilpotents can have different rational orbits. Require a splitting coefficient field or state geometric conjugacy. Added the missing compatibility API, with its coefficient/ordering hypotheses explicit. | api, hypotheses |
| `LocalGaloisDeformationRings:R08.2/gsp4-taylor-wiles-lifts` | corrected | The tame relation forces diagonal inertia by invertible eigenvalue ratios; q=1 only modulo p does not make Frobenius commute with inertia integrally. | hypotheses |
| `LocalGaloisDeformationRings:R08.2/gsp4-unipotent-local-models` | corrected | The GSp4 truncated-log local model requires Phi N Phi inverse = qN + ((q−q^3)/3) N^3; the cubic term was missing from the definition. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, sources, statement, tests |
| `LocalGaloisDeformationRings:R08.2/gsp4-ihara-avoidance-rings` | corrected | The GSp4 Ihara statement requires v not dividing p and p>2. | hypotheses |
| `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p` | unverifiable | General G-valued fixed multiplier must fix the full abelianization. Types need not index components bijectively; Booher’s hypotheses/construction are not yet decomposed. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.2/equal-characteristic-local-lifts` | verified | The pth-root adjustment is Hensel on pro-p units under p≫n; the equal-characteristic minimal condition is away from p. | — |
| `LocalGaloisDeformationRings:R08.2/reducible-lifts-prescribed-determinant` | verified | The local reducible lift is within the stated compatible multiplier problem. | — |
| `LocalGaloisDeformationRings:R08.2/ihara-avoidance-rings-p2` | corrected | Strict diagonalization requires first fixing a residual eigenbasis. | hypotheses |
| `LocalGaloisDeformationRings:R08.3/pst-quotient-in-families` | verified | Kisin’s quotient in finite coefficient algebras supplies the intended families API and the local-global compatibility consumer. | — |
| `LocalGaloisDeformationRings:R08.3/g-valued-pst-rings` | unverifiable | For the regular G-valued PST target the flag dimension is constant at each embedding, as stated. Fix the full abelianization G/G_der; the integral group-scheme and exact family comparison suppliers remain unexpanded. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses |
| `LocalGaloisDeformationRings:R08.3/weil-deligne-type-ring` | corrected | The ring is unique up to isomorphism. Forgetting Frobenius while fixing determinant does not necessarily add one dimension to a supercuspidal type ring. Added the missing characterisation API, with its coefficient/ordering hypotheses explicit. | acceptance, api, proofSteps, statement, tests |
| `LocalGaloisDeformationRings:R08.3/bcdt-type-rings` | corrected | BCDT type means potentially Barsotti–Tate, so use the potentially crystalline quotient with its compatible Teichmüller determinant; the semistable quotient would wrongly include a Tate curve. Extended type additionally fixes Frobenius. | acceptance, hypotheses, prerequisites, proofSteps, sources, statement |
| `LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings` | corrected | Disambiguate the labelled determinant-weight sum and add the semistable ordinary quotient prerequisite. | prerequisites, statement |
| `LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer` | verified | The Kummer isomorphism is supplied by ProfiniteCohomology and is equivariant under Frobenius. | — |
| `LocalGaloisDeformationRings:R08.4/kw-algebraisation-lemma` | corrected | Factor out the common uniformizer power (and handle the zero series) before applying the pinned Weierstrass theorem. | proofSteps |
| `LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation` | corrected | The excluded-case acceptance test is not established; do not infer a failure from absence of the source hypothesis. | acceptance |
| `LocalGaloisDeformationRings:R08.5/weight-p-crystalline-ordinarity` | unverifiable | KW Lemma 3.5 is an import from the requested single R06.4 owner, whose current packet does not yet supply the complete lemma. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses, kind |
| `LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring` | unverifiable | Every clause of KW’s weight-(p+1) section is over Q_p, not arbitrary F_v. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution` | corrected | The stable line is unique with its prescribed graded character. The coefficient flag completion is P1_O at the residual point. | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.5/dyadic-minimal-lifts` | verified | A mod-two character has odd order; the displayed order 3 times 2^a must have a=0. | — |
| `LocalGaloisDeformationRings:R08.5/twisted-semistable-away-from-p` | verified | The away-from-p rank-two cocycle computation agrees with Euler characteristic and duality. | — |
| `LocalGaloisDeformationRings:R08.5/kw1-endpoint-weight-rings` | unverifiable | The supplied connected p=2 classification does not by itself classify all Barsotti–Tate families. | — |
| `LocalGaloisDeformationRings:R08.6/kw1-lift-types` | corrected | Order-p type characters take values in enlarged coefficient integers, not necessarily Z_p. | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.6/good-dihedral-type` | corrected | The good-dihedral characters likewise need coefficient enlargement; the q+1 condition and parity are retained. | hypotheses, statement |
| `LocalGaloisDeformationRings:R08.6/dyadic-weight-two-transition` | verified | The chosen ordinary characters and finite-order determinant match the source’s weight-two condition. | — |
| `LocalGaloisDeformationRings:R08.6/ordinary-pcris-lifts-reducible` | corrected | The Kummer unit class is Barsotti–Tate; the uniformizer class is semistable noncrystalline and cannot serve as the flat example. | acceptance |
| `LocalGaloisDeformationRings:R08.6/serre-weight-crystalline-lift` | verified | The residual reducible representation and crystalline Serre-weight lift agree with FKP’s local statement. | — |
| `LocalGaloisDeformationRings:R08.6/newton-thorne-local-quotients` | corrected | Newton–Thorne uses trivial residual representations after base change and specified nonordinary components; the present arbitrary-residual formulation omits those assumptions. | hypotheses |
| `LocalGaloisDeformationRings:R08.6/torsion-semistable-condition` | verified | Subquotient stability follows from the torsion semistable definition with the specified fixed weight interval. | — |
| `LocalGaloisDeformationRings:R08.6/category-deformation-conditions` | corrected | The split-sum category is closed under subobjects/quotients in the semisimple case. Use the category of objects of length at most one as the actual non-example to finite-product closure. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, sources, tests |
| `LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda` | corrected | CN uses geometric Artin and cyclotomic Hodge weight −1. Translate to the KW convention by duality and reversal of the flag; the current rank-two test has the wrong sign. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, tests |
| `LocalGaloisDeformationRings:L7/semistable-ordinary-quotient` | corrected | Strict Hodge weights belong to characteristic-zero lifts, not to the residual representation. | proofSteps |
| `LocalGaloisDeformationRings:L7/g-valued-ordinary-condition` | unverifiable | The canonical torus is owned by the reductive-group supplier. GL_n compatibility requires explicit cocharacter/weight and duality translation. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses |
| `LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient` | unverifiable | The G-ordinary construction requires regular lambda and a specified semistable extension. Ordinary does not imply potentially crystalline: the Tate curve is a counterexample. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, tests |
| `LocalGaloisDeformationRings:L7/g-valued-ordinary-components` | verified | Being a union of components uses a lower dimension bound on every component through an ordinary point. | — |
| `LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual` | corrected | Snowden assumes mu_p subset F_v; Q_p for odd p is not an admissible dimension test. | acceptance, hypotheses |
| `LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue` | corrected | Residual triviality requires n congruent to one modulo p−1. The unramified splitting is as a module, and Rtilde is generically birational, not generically degree two. Added the missing extensionality API, with its coefficient/ordering hypotheses explicit. | acceptance, api, hypotheses, tests |
| `LocalGaloisDeformationRings:L7/eigenvalue-ring-normal-cm-type-three` | verified | The normal CM type-three statement is conditional on Snowden’s ordinary ring hypotheses. | — |
| `LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-condition` | corrected | A nonzero extension matrix entry does not rule out Siegel ordinarity. Use a ramified nonsplit extension on the prescribed unramified quotient plane. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, tests |
| `LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-tangent` | verified | The upper character ratio in the BCGP finite-flat criterion is retained with the corrected inverse convention. | — |
| `LocalGaloisDeformationRings:L7/gsp4-borel-ordinary-conditions` | corrected | Variable-weight ordinary points are not all semistable; only the specified weight-two arithmetic specialization has that property. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres` | unverifiable | The GSp ordinary regularity target omits the actual character exclusions in the cited lemma. | — |
| `LocalGaloisDeformationRings:L7/gl2-borel-ordinary-ring` | unverifiable | The upper-root cocycle has character epsilon chi squared, not its inverse. The precise relative-weight smoothness case distinctions still need expansion. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | proofSteps |
| `LocalGaloisDeformationRings:L7/gsp4-ordinary-flag-incidence` | corrected | The GSp flag dimensions and four-component weight algebra are consistent; compare prescribed characters explicitly. Added the missing universal-property API, with its coefficient/ordering hypotheses explicit. | api |
| `LocalGaloisDeformationRings:L7/gsp4-ordinary-regularity` | verified | The ordinary rank-four dimension is 16 with the stated coefficient and flag parameters. | — |
| `LocalGaloisDeformationRings:L7/gsp4-ordinary-weight-two-components` | unverifiable | The weight-two GSp4 connectedness proof needs the rank-four ordinary crystalline component input, not only rank-two connectedness. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | prerequisites |
| `LocalGaloisDeformationRings:L7/connects-relation` | corrected | The connects relations require lifts defined over finite coefficient extensions and track uniqueness of components. | hypotheses |
| `LocalGaloisDeformationRings:L7/weight-zero-crystalline-connectedness` | unverifiable | Geraghty’s weight-zero crystalline component theorem remains an unexpanded source input. | — |
| `LocalGaloisDeformationRings:L7/local-model-rho-nm0` | corrected | The tensor local-model weights are i+j; p>nm gives the uniform FL bound. Failure of the bound does not imply every example is outside FL. Added the missing simp API, with its coefficient/ordering hypotheses explicit. | api, tests |
| `LocalGaloisDeformationRings:L7/kisin-modules-tame-descent` | unverifiable | General Kisin modules with tame descent belong to R07.4; only the local GL3 deformation/shape interface belongs here. Correct the false converse “nongeneric implies zero”: the trivial weight-zero crystalline lift is a counterexample. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | hypotheses, tests |
| `LocalGaloisDeformationRings:L7/semisimple-kisin-modules-and-shapes` | corrected | The exact alternative genericity assumptions of LLHLM 3.3.11 must replace “suitably generic”. | statement |
| `LocalGaloisDeformationRings:L7/gl3-pcris-deformation-rings` | corrected | A nonzero ring is required for the normal-domain wording; LLHLM 3.5.4 also has a precise residual Deligne–Lusztig presentation. | hypotheses, statement |
| `LocalGaloisDeformationRings:L7/gl3-explicit-rings` | unverifiable | The actual row presentations of Tables 3–4 are absent. The identity-shape ring has six components, not three. Clear subcorrections were made, but the remaining supplier/statement gap prevents verification of the whole target. | acceptance |
| `LocalGaloisDeformationRings:L7/gl3-component-labelling` | unverifiable | The component labels need the explicit weight graph and rowwise identifications, not only table references. | — |
| `LocalGaloisDeformationRings:L7/partition-monodromy-rings` | corrected | Splitting Frobenius q-chains gives quotient maps; partition dominance alone does not. Example (3,1) versus (2,2) prevents the proposed API. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, tests |
| `LocalGaloisDeformationRings:L7/partition-ring-smooth-points` | verified | Regular unipotent inertia gives the specified smooth and normal components with its source hypotheses. | — |
| `LocalGaloisDeformationRings:L7/away-from-p-rank-n-interface` | corrected | Frobenius partition conditions do not bound monodromy; full monodromy constancy needs the unique-component qualification. | hypotheses, statement |
| `LocalGaloisDeformationRings:L8/doubling-equals-unramified` | corrected | The unramified rank-two decomposition is an R_unr-module decomposition, not a product of local rings. | statement |
| `LocalGaloisDeformationRings:R08.2/taylor-wiles-block-condition` | corrected | The block Taylor–Wiles definition allows variable determinant; compatibility with the earlier fixed-determinant ring needs imposing determinant. Scalar inertia is imposed, not deduced. Added the missing characterisation API, with its coefficient/ordering hypotheses explicit. | api, hypotheses, proofSteps, tests |
| `LocalGaloisDeformationRings:R08.2/gsp4-minimal-conditions` | corrected | Rank over an Artinian ring is insufficient to define the nilpotent orbit. Require conjugacy to the chosen N_i (or all free kernel/image rank conditions). Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | api, proofSteps, statement, tests |
| `LocalGaloisDeformationRings:R08.2/rigid-residual-conditions` | corrected | The rigid definition is for polarized representations, with disjoint inert level-raising places; the monotonicity API needs those side conditions. | api, hypotheses |
| `LocalGaloisDeformationRings:L7/torsion-crystalline-representations` | corrected | Torsion crystalline subquotient closure holds in every weight interval by definition. Endpoint FL full faithfulness, not subquotient closure, can fail. Added the missing functoriality API, with its coefficient/ordering hypotheses explicit. | acceptance, api, proofSteps, tests |

## Exact change ledger

This ledger records every changed packet field against the input commit. It omits unchanged content. JSON-pointer-like paths use final array indices for replacements; oldRange/newRange identify list insertions/deletions precisely. The per-node review table records the added review.checked array in full. The node count and identifiers are unchanged. The suggested-file changes are recorded separately after this ledger.

### Packet-level changes

<details>
<summary>status</summary>

```json
[
  {
    "path": "/status",
    "before": "complete",
    "after": "partial"
  }
]
```

</details>

<details>
<summary>summary</summary>

```json
[
  {
    "path": "/summary",
    "before": "Blueprint for local Galois deformation rings, within the RS-08 boundaries (accepted). R08.1 plans the G_K specialisations of GlobalGaloisDeformations R04.1's functors — local framed rings, tangent and obstruction description with the dimension bound from local Tate duality and the Euler characteristic (Tau Ceti ClassFieldTheory Layer 5), fixing the determinant (including Böckle–Iyengar–Paškūnas's twisting by φ_d when p | d), forgetting the framing, archimedean rings (the explicit odd ring at p = 2), coefficient change — together with coefficient rings Λ for finite, p-adic and local residue fields, presentations over Λ, completions at points of the generic fibre (Kisin's comparison), smooth points and purity, the rank-one ring, G-valued framed rings (Paškūnas–Quast; GSp₄ with fixed similitude) and deformation rings of (φ, Γ)-modules. R08.2 plans the conditions away from p: tame splitting and the q-tame group, unramified, minimally ramified, unrestricted (complete intersections, Shotton), fixed inertial types with monodromy and their constancy on components, Taylor–Wiles conditions (rank two, rank n and the block condition, GSp₄), Steinberg rings, Ihara avoidance (rank n, p = 2, GSp₄ with the local models ℳ(x, y; q)), level-raising problems 𝒟^mix/𝒟^unr/𝒟^ram, Calegari–Geraghty's rank-two rings (with the omitted case v ≡ −1 mod p), regular unipotent lifts, GSp₄ ramification types and minimal conditions, Breuil–Mézard cycles for division algebras, G-valued generic fibres and equal-characteristic lifts. R08.3 plans Kisin's potentially semistable rings in every rank (types, semistable and Hodge-type quotients, the rings with their point criterion, generic dimension and smoothness, coefficient change), their families form over an arbitrary complete local base (exported to AutomorphicGaloisRepresentations R19.5), G-valued rings (Balaji, Bellovin–Gee), rings of fixed Weil–Deligne type cut out of pseudo-character rings (Colmez–Dospinescu–Nizioł), Breuil–Conrad–Diamond–Taylor's type rings and fixed-determinant power-series decompositions. R08.4 plans the finite flat and Barsotti–Tate rank-two component theory (Kisin, Savitt), KW II's finite cocycles and algebraisation lemma, and unique generalisation for Barsotti–Tate rings. R08.5 plans Kisin's 2-adic rings, the weight-p and weight-(p + 1) endpoint rings, the dyadic semistable resolution, dyadic minimal lifts and twists, and the endpoint rings of KW I Theorem 4.1. R08.6 exports each local condition of KW I–II with ring, dimension, nonemptiness and tangent space, the good-dihedral type, the dyadic weight-two transition, and the local conditions of modern lifting arguments. L7 plans bounded-height lattice moduli, Fontaine–Laffaille and discrete-series conditions, ordinary representations of weight λ and their flag schemes (GL_n, G-valued, GSp₄ Siegel- and Borel-ordinary, Calegari–Geraghty's ring with a Frobenius eigenvalue of type three), Snowden's two-component ordinary ring, the relation 'connects' with its local models, Le–Le Hung–Levin–Morra's GL₃ rings and component labelling, and Clozel–Thorne's partition rings. L8 compares flags with determinant-ordinary conditions, including Calegari–Geraghty's J = I. Status: complete; every stage is planned (L8 source-decomposed), with the remaining refinements and three gaps recorded.",
    "after": "Blueprint for local Galois deformation rings, within the RS-08 boundaries (accepted). R08.1 plans the G_K specialisations of GlobalGaloisDeformations R04.1's functors — local framed rings, tangent and obstruction description with the dimension bound from local Tate duality and the Euler characteristic (Tau Ceti ClassFieldTheory Layer 5), fixing the determinant (including Böckle–Iyengar–Paškūnas's twisting by φ_d when p | d), forgetting the framing, archimedean rings (the explicit odd ring at p = 2), coefficient change — together with coefficient rings Λ for finite, p-adic and local residue fields, presentations over Λ, completions at points of the generic fibre (Kisin's comparison), smooth points and purity, the rank-one ring, G-valued framed rings (Paškūnas–Quast; GSp₄ with fixed similitude) and deformation rings of (φ, Γ)-modules. R08.2 plans the conditions away from p: tame splitting and the q-tame group, unramified, minimally ramified, unrestricted (complete intersections, Shotton), fixed inertial types with monodromy and their constancy on components, Taylor–Wiles conditions (rank two, rank n and the block condition, GSp₄), Steinberg rings, Ihara avoidance (rank n, p = 2, GSp₄ with the local models ℳ(x, y; q)), level-raising problems 𝒟^mix/𝒟^unr/𝒟^ram, Calegari–Geraghty's rank-two rings (with the omitted case v ≡ −1 mod p), regular unipotent lifts, GSp₄ ramification types and minimal conditions, Breuil–Mézard cycles for division algebras, G-valued generic fibres and equal-characteristic lifts. R08.3 plans Kisin's potentially semistable rings in every rank (types, semistable and Hodge-type quotients, the rings with their point criterion, generic dimension and smoothness, coefficient change), their families form over an arbitrary complete local base (exported to AutomorphicGaloisRepresentations R19.5), G-valued rings (Balaji, Bellovin–Gee), rings of fixed Weil–Deligne type cut out of pseudo-character rings (Colmez–Dospinescu–Nizioł), Breuil–Conrad–Diamond–Taylor's type rings and fixed-determinant power-series decompositions. R08.4 plans the finite flat and Barsotti–Tate rank-two component theory (Kisin, Savitt), KW II's finite cocycles and algebraisation lemma, and unique generalisation for Barsotti–Tate rings. R08.5 plans Kisin's 2-adic rings, the weight-p and weight-(p + 1) endpoint rings, the dyadic semistable resolution, dyadic minimal lifts and twists, and the endpoint rings of KW I Theorem 4.1. R08.6 exports each local condition of KW I–II with ring, dimension, nonemptiness and tangent space, the good-dihedral type, the dyadic weight-two transition, and the local conditions of modern lifting arguments. L7 plans bounded-height lattice moduli, Fontaine–Laffaille and discrete-series conditions, ordinary representations of weight λ and their flag schemes (GL_n, G-valued, GSp₄ Siegel- and Borel-ordinary, Calegari–Geraghty's ring with a Frobenius eigenvalue of type three), Snowden's two-component ordinary ring, the relation 'connects' with its local models, Le–Le Hung–Levin–Morra's GL₃ rings and component labelling, and Clozel–Thorne's partition rings. L8 compares flags with determinant-ordinary conditions, including Calegari–Geraghty's J = I. Independent review: needs_changes. All 153 targets were reviewed; stage coverage is partial where an exact key statement, supplier or actual suggested signature is missing. The recorded gaps and remaining lists identify the required revision. Type quotients are closures of exact-type points; full monodromy constancy is qualified at component intersections. No implementation is claimed."
  }
]
```

</details>

<details>
<summary>baseline</summary>

```json
[
  {
    "path": "/baseline/declarations/0/checked",
    "before": "name, kind and module confirmed in the pinned declaration index at the baseline commits (2026-09-28)",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/1/checked",
    "before": "name, kind and module confirmed in the pinned declaration index at the baseline commits (2026-09-28)",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/2/checked",
    "before": "name, kind and module confirmed in the pinned declaration index at the baseline commits (2026-09-28)",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/2/provides",
    "before": "Continuous H²(G, M).",
    "after": "The underlying additive group H²(G,M); a coefficient-linear structure, finite-dimensionality, duality and Euler characteristic need the stated suppliers."
  },
  {
    "path": "/baseline/declarations/3/checked",
    "before": "name, kind and module confirmed in the pinned declaration index",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/4/checked",
    "before": "statement read at the pinned commit (def symplecticGroup : Submonoid (Matrix (l ⊕ l) (l ⊕ l) R))",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/4/provides",
    "before": "The symplectic group Sp of matrices preserving the standard symplectic form, over any commutative ring; GSp is not in Mathlib",
    "after": "Matrices satisfying A J Aᵀ=J over a commutative ring. Use the carrier’s owner for GSp and a transpose-convention comparison before applying gᵀJg=νJ formulas."
  },
  {
    "path": "/baseline/declarations/5/checked",
    "before": "statement read at the pinned commit",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/6/checked",
    "before": "statement read at the pinned commit",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/7/checked",
    "before": "statement read at the pinned commit (section IsAdicComplete, hypothesis g.map (IsLocalRing.residue A) ≠ 0)",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/8/checked",
    "before": "statement read at the pinned commit",
    "after": "Declaration and full statement read at the exact packet pin by independent reviewer REV-LocalGaloisDeformationRings on 2026-10-07."
  },
  {
    "path": "/baseline/declarations/8/provides",
    "before": "Weierstrass division f = g·(f /ʷ g) + (f %ʷ g) over a complete local ring",
    "after": "Weierstrass division over a complete local ring, with the same nonzero residue-series hypothesis on the divisor; factor out a common uniformizer power before using it."
  }
]
```

</details>

<details>
<summary>sources</summary>

```json
[
  {
    "path": "/sources",
    "oldRange": [
      0,
      34
    ],
    "newRange": [
      0,
      36
    ],
    "removed": [
      {
        "id": "GEE-MLT-2022",
        "title": "Modularity lifting theorems",
        "authors": "Toby Gee",
        "edition": "Essential Number Theory 1 (2022), no. 1, 73–126; arXiv:2202.05818v2 (17 October 2022), 45 pages. The arXiv version was read; printed page = PDF page.",
        "url": "https://arxiv.org/pdf/2202.05818v2",
        "sha256": "878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5",
        "read": "2026-09-28",
        "readSections": [
          "§3.1–3.19, pp. 11–15",
          "§3.27–3.28 (local deformation rings with l = p), pp. 18–19",
          "§3.29–3.38 (ℓ ≠ p, n = 2), pp. 19–21"
        ]
      },
      {
        "id": "KISIN-LECTURES",
        "title": "Lectures on deformations of Galois representations (Lecture 1)",
        "authors": "Mark Kisin",
        "edition": "Lecture notes on the author's Harvard page, 4 pages.",
        "url": "https://people.math.harvard.edu/~kisin/notes/notes.pdf",
        "sha256": "9f3698a791b6a96318b8eded26962f2da7d3f34628ab47d855df7e36cd5712c6",
        "read": "2026-09-28",
        "readSections": [
          "Lecture 1, pp. 1–4"
        ]
      },
      {
        "id": "TUNG-2021",
        "title": "On the modularity of 2-adic potentially semi-stable deformation rings",
        "authors": "Shen-Ning Tung",
        "edition": "Mathematische Zeitschrift 298 (2021), 107–159; arXiv:1908.06174v3, 41 pages. The arXiv version was read.",
        "url": "https://arxiv.org/pdf/1908.06174v3",
        "sha256": "a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8",
        "read": "2026-09-28",
        "readSections": [
          "§3.2.5 Odd deformations, Proposition 3.2.7, and §3.2.6, Lemma 3.2.8, p. 15"
        ]
      },
      {
        "id": "CHT08",
        "title": "Automorphy for some l-adic lifts of automorphic mod l Galois representations",
        "authors": "Laurent Clozel, Michael Harris and Richard Taylor",
        "edition": "Publications mathématiques de l'IHÉS 108 (2008), 1–181; open access on Numdam. Printed page = PDF page.",
        "url": "https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf",
        "sha256": "9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c",
        "read": "2026-09-28",
        "readSections": [
          "§2.4.3 Unrestricted deformations, Lemma 2.4.9, p. 40",
          "§2.4.4 Minimal deformations, Lemmas 2.4.10–2.4.22, pp. 41–47",
          "§2.4.1 Crystalline (Fontaine–Laffaille) deformations, Lemmas 2.4.1–2.4.5, pp. 33–37 (checkpoint 7, on the page images)",
          "§2.4.2 Ordinary deformations, Lemmas 2.4.6–2.4.8, pp. 37–40 (checkpoint 7)",
          "§2.4.5 Discrete series deformations, Lemmas 2.4.22–2.4.30, pp. 47–53 (checkpoint 7)"
        ]
      },
      {
        "id": "TAYLOR-II-2008",
        "title": "Automorphy for some l-adic lifts of automorphic mod l Galois representations. II",
        "authors": "Richard Taylor",
        "edition": "Publications mathématiques de l'IHÉS 108 (2008), 183–239; open access on Numdam. Printed page = PDF page + 182.",
        "url": "https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf",
        "sha256": "f9014a899bcccaa56035314f196b15b581abe63d56cb9d9a285ce9e93f1030bc",
        "read": "2026-09-28",
        "readSections": [
          "§3, the deformation problems D^{(χ)}, D^{Stein} and Proposition 3.1, p. 196"
        ]
      },
      {
        "id": "KISIN-PST-2008",
        "title": "Potentially semi-stable deformation rings",
        "authors": "Mark Kisin",
        "edition": "J. Amer. Math. Soc. 21 (2008), no. 2, 513–546 (electronically published 20 September 2007); the AMS PDF, freely downloadable from ams.org, was read. Printed page = PDF page + 512. It ends with 'Errata for [Ki 2]' (pp. 544–545), corrections to Kisin, Crystalline representations and F-crystals (2006).",
        "url": "https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf",
        "sha256": "3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556",
        "read": "2026-09-28",
        "readSections": [
          "Introduction, pp. 513–516",
          "§1 Representations of finite E-height, (1.1)–(1.7), pp. 516–522",
          "§2.5–2.7, pp. 529–534 (§2.1–2.4 skimmed: Proposition 2.4.7 and Lemma 2.4.6 read)",
          "§3 The local structure of potentially semi-stable deformation rings, pp. 535–541",
          "Errata for [Ki 2], pp. 544–545"
        ]
      },
      {
        "id": "KW2-2009",
        "title": "Serre's modularity conjecture (II)",
        "authors": "Chandrashekhar Khare and Jean-Pierre Wintenberger",
        "edition": "Authors' final version (PDF dated 30 May 2009), 98 pages, on Khare's UCLA page; published as Invent. Math. 178 (2009), 505–586. Printed page = PDF page; the numbering is the published one.",
        "url": "https://www.math.ucla.edu/~shekhar/papers/proofs.pdf",
        "sha256": "53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4",
        "read": "2026-09-28",
        "readSections": [
          "§2.3 Proposition 2.2 and Corollary 2.3, pp. 8–10",
          "§2.8 smooth resolutions and Proposition 2.12, pp. 16–18",
          "§3 (Theorem 3.1, Propositions 3.2, 3.3, 3.6, Definition 3.4, Lemmas 3.5, 3.7–3.9, §§3.2.2–3.2.7, 3.3.1–3.3.4), pp. 18–37"
        ]
      },
      {
        "id": "KISIN-FFLAT-2009",
        "title": "Moduli of finite flat group schemes, and modularity",
        "authors": "Mark Kisin",
        "edition": "Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page (the preprint's own numbering). Published as Ann. of Math. 170 (2009), 1085–1180.",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi",
        "sha256": "242151c94cb831c526e67de6e3b70a370b65a002342074440e86fc88a2ec5f0f",
        "read": "2026-09-28",
        "readSections": [
          "§2.1, (2.1.1)–(2.1.14) with proofs, pp. 16–22",
          "§2.2, (2.2.1)–(2.2.5) and the statement of (2.2.8), pp. 22–24",
          "§2.3, (2.3.8)–(2.3.11), pp. 32–33",
          "§2.4, (2.4.1)–(2.4.19), pp. 34–41",
          "§2.5, (2.5.1)–(2.5.5), the statement and the end of the proof of (2.5.6), (2.5.15) and (2.5.16), pp. 41–49",
          "References, pp. 78–80"
        ]
      },
      {
        "id": "SAVITT-2005",
        "title": "On a conjecture of Conrad, Diamond, and Taylor",
        "authors": "David Savitt",
        "edition": "arXiv:math/0404327v3 (15 September 2010), 45 pages; published in Duke Math. J. 128 (2005). The arXiv v3 fixes an error of the published version (its Remark 1.7) and keeps the published numbering. Printed page = PDF page.",
        "url": "https://arxiv.org/pdf/math/0404327v3",
        "sha256": "e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c",
        "read": "2026-09-28",
        "readSections": [
          "§1, Conjecture 1.1, Theorems 1.2–1.3 and Remark 1.7, pp. 1–4",
          "§6.6, Theorems 6.22–6.24 and the start of their proof, pp. 41–43"
        ]
      },
      {
        "id": "ACC-POTENTIAL-AUTOMORPHY-CM-2023",
        "title": "Potential automorphy over CM fields",
        "authors": "Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne",
        "edition": "arXiv:1812.09999v2, 218 pages; published in Ann. of Math. (2) 197 (2023), no. 3, 897–1113. Page numbers are those of the arXiv v2 PDF (printed page = PDF page).",
        "url": "https://arxiv.org/pdf/1812.09999v2",
        "sha256": "7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c",
        "readSections": [
          "2026-09-28 (cc-39fac3, checkpoint 6): §6.2.5–6.2.6 (ordinary deformations: Λ_v, 𝒢_v, R^△_v, R^{det,ord}_v, Lemma 6.2.9, Proposition 6.2.10, Lemma 6.2.11, Proposition 6.2.12 with proof), pp. 137–141; the bibliography entries [Ger19], [Tho15], [CS19a]."
        ]
      },
      {
        "id": "SKINNER-WILES-1999",
        "title": "Residually reducible representations and modular forms",
        "authors": "C. M. Skinner and A. J. Wiles",
        "edition": "Publications mathématiques de l'IHÉS 89 (1999), 5–126, DOI 10.1007/BF02698855; Numdam open-access scan (OCR text layer; printed page = PDF page + 3).",
        "url": "http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf",
        "sha256": "ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3",
        "readSections": [
          "2026-09-28 (cc-39fac3, checkpoint 6): §2.1, Lemma 2.2 and Corollary 2.3 with proofs, pp. 11–13, read on the page images."
        ]
      },
      {
        "id": "KISIN-2ADIC-2009",
        "title": "Modularity of 2-adic Barsotti–Tate representations",
        "authors": "Mark Kisin",
        "edition": "Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page. Published in Invent. Math. 178 (2009) (the published version was not compared).",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi",
        "sha256": "a11fdea301d662ada1cd675bea21a89ba9ab0a75955e496e4a1bcdecab97bf7d",
        "read": "2026-09-29",
        "readSections": [
          "Introduction (Theorem 0.1), and §2 in full: (2.1.1)–(2.1.13), (2.2.1)–(2.2.7), (2.3.1)–(2.3.13), (2.4.1)–(2.4.6), (2.5.1)–(2.5.6), pp. 1–2 and 19–35."
        ]
      },
      {
        "id": "BIP-2023",
        "title": "On local Galois deformation rings",
        "authors": "Gebhard Böckle, Ashwin Iyengar, Vytautas Paškūnas",
        "edition": "Forum of Mathematics, Pi 11 (2023), e30; Corrigendum, Forum Math. Pi 12 (2024), e5; read in arXiv:2110.01638v2 (22 August 2023), sha256 b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2110.01638",
        "sha256": "b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4",
        "readSections": [
          "§3.5 (Proposition 3.33)",
          "§3.7 (Proposition 3.41, Corollary 3.42, Remark 3.43)",
          "§4 (Lemma 4.1, Remark 4.4)",
          "§5 (the functor 𝒳, Proposition 5.1, Corollary 5.2, Lemma 5.3)"
        ]
      },
      {
        "id": "PQ-2026",
        "title": "On local Galois deformation rings: generalised reductive groups",
        "authors": "Vytautas Paškūnas, Julian Quast",
        "edition": "Forum of Mathematics, Pi 14 (2026), e15; read in arXiv:2404.14622v2 (9 January 2026), sha256 eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2404.14622",
        "sha256": "eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c",
        "readSections": [
          "§3 (Lemmas 3.1–3.5, Proposition 3.6, Corollary 3.8, Lemmas 3.10–3.11)",
          "§3.1 (Corollary 3.12, Proposition 3.13)"
        ]
      },
      {
        "id": "CG-2018",
        "title": "Modularity lifting beyond the Taylor–Wiles method",
        "authors": "Frank Calegari, David Geraghty",
        "edition": "Inventiones Math. 211 (2018), 297–433; Correction, Invent. Math. 227 (2022), 855–856; read in arXiv:1207.4224v2 (the accepted version), sha256 67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb, accessed 2026-10-07; locators are the published pages as recorded by the reviewed extraction PAPER-CALEGARI-GERAGHTY-18",
        "url": "https://arxiv.org/abs/1207.4224",
        "sha256": "67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb",
        "readSections": [
          "§3.7 (Theorem 3.19, Definitions 3.20–3.21, Lemma 3.22 and its proof)",
          "§4.1 (Theorem 4.3, Lemmas 4.5–4.7, Lemma 4.11 with its proof and footnote 5)",
          "§8.5.1"
        ]
      },
      {
        "id": "BCGP-2021",
        "title": "Abelian surfaces over totally real fields are potentially modular",
        "authors": "George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni",
        "edition": "Publ. Math. IHÉS 134 (2021), 153–501; read in arXiv:1812.09269v3 (final version, 28 November 2021), sha256 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed, accessed 2026-10-07; locators are arXiv v3 pages",
        "url": "https://arxiv.org/abs/1812.09269",
        "sha256": "7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed",
        "readSections": [
          "§7.1 (Definition 7.1.2, the paragraph after it, Lemma 7.1.3)",
          "§7.3 (Definition 7.3.1 to Lemma 7.3.18)",
          "§7.4 (Proposition 7.4.2 to Proposition 7.4.21)"
        ]
      },
      {
        "id": "BHS-2019",
        "title": "A local model for the trianguline variety and applications",
        "authors": "Christophe Breuil, Eugen Hellmann, Benjamin Schraen",
        "edition": "Publ. Math. IHÉS 130 (2019), 299–412; read in arXiv:1702.02192, sha256 4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/1702.02192",
        "sha256": "4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961",
        "readSections": [
          "§3.6 with (3.27)–(3.28) and Remark 3.6.1"
        ]
      },
      {
        "id": "DING-2025",
        "title": "p-adic Hodge parameters in the crystabelline representations of GL_n",
        "authors": "Yiwen Ding",
        "edition": "Publ. Math. IHÉS 142 (2025), 1–74; read in arXiv:2407.21237, sha256 a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2407.21237",
        "sha256": "a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8",
        "readSections": [
          "§3.2.2 (the rings R_D, R_{D,w}, R_{D,g}, R_δ)",
          "§4.1 (the trianguline variety, as consumed)"
        ]
      },
      {
        "id": "LTXZZ-2022",
        "title": "On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives",
        "authors": "Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu",
        "edition": "Inventiones Math. 228 (2022), 107–375; read in arXiv:1912.11942v3, accessed 2026-10-07; locators are the published numbering recorded by the reviewed extraction PAPER-LIU-ETAL-22 (arXiv v3 numbers the rigidity definition 6.3.4)",
        "url": "https://arxiv.org/abs/1912.11942",
        "readSections": [
          "§6.3 (the rigidity definition)",
          "§6.4 (the rings R^mix, R^unr, R^ram and the local model at 𝔭)"
        ]
      },
      {
        "id": "LTXZZ-RIGID-2021",
        "title": "Deformation of rigid conjugate self-dual Galois representations",
        "authors": "Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu",
        "edition": "arXiv:2108.06998v1 (2021), the companion [51] of LTXZZ 2022; accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2108.06998",
        "readSections": [
          "§3.3 (Definition 3.3.1)",
          "§3.4 (Definition 3.4.8, Proposition 3.4.12)",
          "§3.5 (Definition 3.5.1, Proposition 3.5.2 and its proof)"
        ]
      },
      {
        "id": "NT-2026",
        "title": "Symmetric power functoriality for Hilbert modular forms",
        "authors": "James Newton, Jack A. Thorne",
        "edition": "Annals of Math. 203 (2026), no. 1; read in arXiv:2212.03595v2, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2212.03595",
        "readSections": [
          "§2 (Definition 2.5)",
          "§3 (Lemma 3.1, Lemma 3.6 with its proof, Lemma 3.8 and its proof)",
          "§4 (the local quotients after Theorem 4.1, Lemma 4.2)",
          "§5 (proof of Theorem 5.9)"
        ]
      },
      {
        "id": "CG-2020",
        "title": "Minimal modularity lifting for nonregular symplectic representations",
        "authors": "Frank Calegari, David Geraghty; appendix by Frank Calegari, David Geraghty, Michael Harris",
        "edition": "Duke Math. J. 169 (2020), no. 5, 801–896; read in arXiv:1907.08691v1 and the appendix arXiv:1907.08694v1, accessed 2026-10-07; locators are published pages as recorded by the reviewed extraction PAPER-CALEGARI-GERAGHTY-20",
        "url": "https://arxiv.org/abs/1907.08691",
        "readSections": [
          "§4 (Assumption 4.3, Remark 4.4, Definition 4.6, Remark 4.7, Lemma 4.8 and its proof)",
          "Appendix §A.4"
        ]
      },
      {
        "id": "FKP-2022",
        "title": "Lifting and automorphy of reducible mod p Galois representations over global fields",
        "authors": "Najmuddin Fakhruddin, Chandrashekhar Khare, Stefan Patrikis",
        "edition": "Inventiones Math. 228 (2022), 415–492; read in arXiv:2008.12593v5 (final version), sha256 6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2 as recorded by the extraction, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2008.12593",
        "readSections": [
          "§2 (local lifting rings in equal characteristic)",
          "§5 (Theorem 5.2)",
          "§7 (Lemma 7.2)",
          "§8 (proof of Theorem 8.1)",
          "§9 (proof of Proposition 9.1)",
          "Appendix B (Definition B.2, Lemmas B.3–B.4)"
        ]
      },
      {
        "id": "BCGP-2025",
        "title": "Modularity theorems for abelian surfaces",
        "authors": "George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni",
        "edition": "arXiv:2502.20645v1 (2025), sha256 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2502.20645v1",
        "sha256": "51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c",
        "readSections": [
          "§1.8.10",
          "§5.4–5.6 (local deformation problems, Lemmas 5.6.2–5.6.3, Propositions 5.6.4, 5.6.6, Remark 5.6.7, Definition 5.6.8)",
          "§6.1–6.2 (fixed-similitude lifts, Lemma 6.1.6, ordinary GSp₄ rings, 6.2.1–6.2.6)",
          "§7.5.2"
        ]
      },
      {
        "id": "KISIN-PST-2008-AMS",
        "title": "Potentially semi-stable deformation rings",
        "authors": "Mark Kisin",
        "edition": "J. Amer. Math. Soc. 21 (2008), 513–546; the AMS open-access PDF, sha256 3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556, re-read 2026-10-07 for (2.5.5), (2.7.5)–(2.7.7) in families",
        "url": "https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/",
        "sha256": "3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556",
        "readSections": [
          "Introduction (the Corollary on Hilbert modular forms)",
          "(2.1), (2.5.5)",
          "(2.7.5)–(2.7.7)"
        ]
      },
      {
        "id": "CDN-2023",
        "title": "Factorisation de la cohomologie étale p-adique de la tour de Drinfeld",
        "authors": "Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł",
        "edition": "Forum of Mathematics, Pi 11 (2023), e16; read in arXiv:2204.11214, sha256 c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2204.11214",
        "sha256": "c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee",
        "readSections": [
          "§0.1",
          "§5.2 (the ring R_{B,M}, Théorème 5.11, Lemme 5.12)"
        ]
      },
      {
        "id": "BCDT-2001",
        "title": "On the modularity of elliptic curves over Q: wild 3-adic exercises",
        "authors": "Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor",
        "edition": "J. Amer. Math. Soc. 14 (2001), 843–939; the AMS open-access PDF, sha256 1e34130e55a0ef39d7ef2566cc7d518e2b69048dece36328a0b6530e92044cf2, accessed 2026-10-07",
        "url": "https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/",
        "sha256": "1e34130e55a0ef39d7ef2566cc7d518e2b69048dece36328a0b6530e92044cf2",
        "readSections": [
          "§1.1 (ℓ-types, R^D, weakly of type, Conjecture 1.1.1)",
          "§4.3 (the categories S and the functors D^S)"
        ]
      },
      {
        "id": "CN-2023",
        "title": "On the modularity of elliptic curves over imaginary quadratic fields",
        "authors": "Ana Caraiani, James Newton",
        "edition": "arXiv:2301.10509v3, sha256 57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2301.10509v3",
        "sha256": "57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3",
        "readSections": [
          "§3.3 (Definition 3.3.1, Lemma 3.3.2, Theorem 3.3.3, §3.3.5, Lemma 3.3.6)",
          "§5.3 (Proposition 5.3.2, Lemmas 5.3.3–5.3.4)"
        ]
      },
      {
        "id": "KW1-2009",
        "title": "Serre's modularity conjecture (I)",
        "authors": "Chandrashekhar Khare, Jean-Pierre Wintenberger",
        "edition": "Inventiones Math. 178 (2009), 485–504; the authors' copy results.pdf on Khare's UCLA page, accessed 2026-10-07",
        "url": "https://www.math.ucla.edu/~shekhar/papers/results.pdf",
        "readSections": [
          "§4 (Theorem 4.1)",
          "§5 (minimal lifts, Theorem 5.1 and the remarks after it)"
        ]
      },
      {
        "id": "BLGGT-2014",
        "title": "Potential automorphy and change of weight",
        "authors": "Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor",
        "edition": "Annals of Math. 179 (2014), 501–609; read in arXiv:1010.2561v4, sha256 c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/1010.2561",
        "sha256": "c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24",
        "readSections": [
          "§1.3 (local theory, l ≠ p: Lemmas 1.3.2, 1.3.4)",
          "§1.4 (local theory, l = p: connects and its properties)"
        ]
      },
      {
        "id": "BCGNT-2025",
        "title": "The Ramanujan and Sato–Tate conjectures for Bianchi modular forms",
        "authors": "George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne",
        "edition": "Forum of Mathematics, Pi 13 (2025), e10; read in arXiv:2309.15880, sha256 0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2309.15880",
        "sha256": "0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d",
        "readSections": [
          "§3.2 (Theorem 3.2.1, Remark 3.2.2)",
          "§5.1 (Definition 5.1.1, Lemmas 5.1.3–5.1.5)",
          "§6.2 (proof of Proposition 6.2.3)"
        ]
      },
      {
        "id": "BCG-2025",
        "title": "Cuspidal cohomology classes for GL_n(Z)",
        "authors": "George Boxer, Frank Calegari, Toby Gee",
        "edition": "J. Amer. Math. Soc. 38 (2025), 509–520; read in arXiv:2309.15944v3, sha256 abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2309.15944",
        "sha256": "abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684",
        "readSections": [
          "proof of Theorem 2.1 (FKP Lemma B.4 as used)",
          "proof of Theorem 3.1 (connects)"
        ]
      },
      {
        "id": "LLHLM-2020",
        "title": "Serre weights and Breuil's lattice conjecture in dimension three",
        "authors": "Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra",
        "edition": "Forum of Mathematics, Pi 8 (2020), e5; read in arXiv:1608.06570v4, sha256 cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd, accessed 2026-10-07; locators follow the reviewed extraction PAPER-LE-LEHUNG-LEVIN-ETAL-20 (published pages)",
        "url": "https://arxiv.org/abs/1608.06570",
        "sha256": "cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd",
        "readSections": [
          "§3.1 (Definitions 3.1.3, 3.1.6)",
          "§3.2 (Propositions 3.2.1–3.2.2, Lemma 3.2.3)",
          "§3.3 (Definitions 3.3.1–3.3.7, Propositions 3.3.5–3.3.9, Lemma 3.3.10, Theorems 3.3.11–3.3.12)",
          "§3.5 (Theorem 3.5.3, Lemma 3.5.4)",
          "§3.6 (Proposition 3.6.1, diagram (3.9), Proposition 3.6.3, Theorem 3.6.4, Lemma 3.6.6, Corollary 3.6.7, Propositions 3.6.9, Lemma 3.6.10, Tables 3–4)"
        ]
      },
      {
        "id": "CT-2017",
        "title": "Level-raising and symmetric power functoriality, III",
        "authors": "Laurent Clozel, Jack A. Thorne",
        "edition": "Duke Math. J. 166 (2017), 325–402; read in the accepted manuscript lrspiii.pdf on Thorne's Cambridge page, sha256 a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659, accessed 2026-10-07",
        "url": "https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf",
        "sha256": "a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659",
        "readSections": [
          "§5.1 (the local deformation problems, the rings R^m_v, Lemma 5.2 and its proof)"
        ]
      }
    ],
    "added": [
      {
        "id": "GEE-MLT-2022",
        "title": "Modularity lifting theorems",
        "authors": "Toby Gee",
        "edition": "Essential Number Theory 1 (2022), no. 1, 73–126; arXiv:2202.05818v2 (17 October 2022), 45 pages. The arXiv version was read; printed page = PDF page.",
        "url": "https://arxiv.org/pdf/2202.05818v2",
        "sha256": "878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5",
        "read": "2026-09-28",
        "readSections": [
          "§3.1–3.19, pp. 11–15",
          "§3.27–3.28 (local deformation rings with l = p), pp. 18–19",
          "§3.29–3.38 (ℓ ≠ p, n = 2), pp. 19–21"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2202.05818v2",
          "sha256": "878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "KISIN-LECTURES",
        "title": "Lectures on deformations of Galois representations (Lecture 1)",
        "authors": "Mark Kisin",
        "edition": "Lecture notes on the author's Harvard page, 4 pages.",
        "url": "https://people.math.harvard.edu/~kisin/notes/notes.pdf",
        "sha256": "9f3698a791b6a96318b8eded26962f2da7d3f34628ab47d855df7e36cd5712c6",
        "read": "2026-09-28",
        "readSections": [
          "Lecture 1, pp. 1–4"
        ],
        "reviewedVersion": {
          "url": "https://people.math.harvard.edu/~kisin/notes/notes.pdf",
          "sha256": "9f3698a791b6a96318b8eded26962f2da7d3f34628ab47d855df7e36cd5712c6",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "TUNG-2021",
        "title": "On the modularity of 2-adic potentially semi-stable deformation rings",
        "authors": "Shen-Ning Tung",
        "edition": "Mathematische Zeitschrift 298 (2021), 107–159; arXiv:1908.06174v3, 41 pages. The arXiv version was read.",
        "url": "https://arxiv.org/pdf/1908.06174v3",
        "sha256": "a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8",
        "read": "2026-09-28",
        "readSections": [
          "§3.2.5 Odd deformations, Proposition 3.2.7, and §3.2.6, Lemma 3.2.8, p. 15"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1908.06174v3",
          "sha256": "a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "CHT08",
        "title": "Automorphy for some l-adic lifts of automorphic mod l Galois representations",
        "authors": "Laurent Clozel, Michael Harris and Richard Taylor",
        "edition": "Publications mathématiques de l'IHÉS 108 (2008), 1–181; open access on Numdam. Printed page = PDF page.",
        "url": "https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf",
        "sha256": "9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c",
        "read": "2026-09-28",
        "readSections": [
          "§2.4.3 Unrestricted deformations, Lemma 2.4.9, p. 40",
          "§2.4.4 Minimal deformations, Lemmas 2.4.10–2.4.22, pp. 41–47",
          "§2.4.1 Crystalline (Fontaine–Laffaille) deformations, Lemmas 2.4.1–2.4.5, pp. 33–37 (checkpoint 7, on the page images)",
          "§2.4.2 Ordinary deformations, Lemmas 2.4.6–2.4.8, pp. 37–40 (checkpoint 7)",
          "§2.4.5 Discrete series deformations, Lemmas 2.4.22–2.4.30, pp. 47–53 (checkpoint 7)"
        ],
        "reviewedVersion": {
          "url": "https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf",
          "sha256": "9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "TAYLOR-II-2008",
        "title": "Automorphy for some l-adic lifts of automorphic mod l Galois representations. II",
        "authors": "Richard Taylor",
        "edition": "Publications mathématiques de l'IHÉS 108 (2008), 183–239; open access on Numdam. Printed page = PDF page + 182.",
        "url": "https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf",
        "sha256": "f9014a899bcccaa56035314f196b15b581abe63d56cb9d9a285ce9e93f1030bc",
        "read": "2026-09-28",
        "readSections": [
          "§3, the deformation problems D^{(χ)}, D^{Stein} and Proposition 3.1, p. 196"
        ],
        "reviewedVersion": {
          "url": "https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf",
          "sha256": "f9014a899bcccaa56035314f196b15b581abe63d56cb9d9a285ce9e93f1030bc",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "KISIN-PST-2008",
        "title": "Potentially semi-stable deformation rings",
        "authors": "Mark Kisin",
        "edition": "J. Amer. Math. Soc. 21 (2008), no. 2, 513–546 (electronically published 20 September 2007); the AMS PDF, freely downloadable from ams.org, was read. Printed page = PDF page + 512. It ends with 'Errata for [Ki 2]' (pp. 544–545), corrections to Kisin, Crystalline representations and F-crystals (2006). Independent review 2026-10-07: Author DVI; published locators correspond to author page plus 512. AMS PDF returned HTTP 403; the published PDF was not independently read in this review.",
        "url": "https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf",
        "sha256": "3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556",
        "read": "2026-09-28",
        "readSections": [
          "Introduction, pp. 513–516",
          "§1 Representations of finite E-height, (1.1)–(1.7), pp. 516–522",
          "§2.5–2.7, pp. 529–534 (§2.1–2.4 skimmed: Proposition 2.4.7 and Lemma 2.4.6 read)",
          "§3 The local structure of potentially semi-stable deformation rings, pp. 535–541",
          "Errata for [Ki 2], pp. 544–545"
        ],
        "reviewedVersion": {
          "url": "https://people.math.harvard.edu/~kisin/dvifiles/def.dvi",
          "sha256": "ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee",
          "read": "2026-10-07",
          "note": "Author DVI; published locators correspond to author page plus 512. AMS PDF returned HTTP 403; the published PDF was not independently read in this review."
        }
      },
      {
        "id": "KW2-2009",
        "title": "Serre's modularity conjecture (II)",
        "authors": "Chandrashekhar Khare and Jean-Pierre Wintenberger",
        "edition": "Authors' final version (PDF dated 30 May 2009), 98 pages, on Khare's UCLA page; published as Invent. Math. 178 (2009), 505–586. Printed page = PDF page; the numbering is the published one.",
        "url": "https://www.math.ucla.edu/~shekhar/papers/proofs.pdf",
        "sha256": "53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4",
        "read": "2026-09-28",
        "readSections": [
          "§2.3 Proposition 2.2 and Corollary 2.3, pp. 8–10",
          "§2.8 smooth resolutions and Proposition 2.12, pp. 16–18",
          "§3 (Theorem 3.1, Propositions 3.2, 3.3, 3.6, Definition 3.4, Lemmas 3.5, 3.7–3.9, §§3.2.2–3.2.7, 3.3.1–3.3.4), pp. 18–37"
        ],
        "reviewedVersion": {
          "url": "https://www.math.ucla.edu/~shekhar/papers/proofs.pdf",
          "sha256": "53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "KISIN-FFLAT-2009",
        "title": "Moduli of finite flat group schemes, and modularity",
        "authors": "Mark Kisin",
        "edition": "Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page (the preprint's own numbering). Published as Ann. of Math. 170 (2009), 1085–1180.",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi",
        "sha256": "242151c94cb831c526e67de6e3b70a370b65a002342074440e86fc88a2ec5f0f",
        "read": "2026-09-28",
        "readSections": [
          "§2.1, (2.1.1)–(2.1.14) with proofs, pp. 16–22",
          "§2.2, (2.2.1)–(2.2.5) and the statement of (2.2.8), pp. 22–24",
          "§2.3, (2.3.8)–(2.3.11), pp. 32–33",
          "§2.4, (2.4.1)–(2.4.19), pp. 34–41",
          "§2.5, (2.5.1)–(2.5.5), the statement and the end of the proof of (2.5.6), (2.5.15) and (2.5.16), pp. 41–49",
          "References, pp. 78–80"
        ],
        "reviewedVersion": {
          "url": "https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi",
          "sha256": "242151c94cb831c526e67de6e3b70a370b65a002342074440e86fc88a2ec5f0f",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "SAVITT-2005",
        "title": "On a conjecture of Conrad, Diamond, and Taylor",
        "authors": "David Savitt",
        "edition": "arXiv:math/0404327v3 (15 September 2010), 45 pages; published in Duke Math. J. 128 (2005). The arXiv v3 fixes an error of the published version (its Remark 1.7) and keeps the published numbering. Printed page = PDF page.",
        "url": "https://arxiv.org/pdf/math/0404327v3",
        "sha256": "e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c",
        "read": "2026-09-28",
        "readSections": [
          "§1, Conjecture 1.1, Theorems 1.2–1.3 and Remark 1.7, pp. 1–4",
          "§6.6, Theorems 6.22–6.24 and the start of their proof, pp. 41–43"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/math/0404327v3",
          "sha256": "e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "ACC-POTENTIAL-AUTOMORPHY-CM-2023",
        "title": "Potential automorphy over CM fields",
        "authors": "Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne",
        "edition": "arXiv:1812.09999v2, 218 pages; published in Ann. of Math. (2) 197 (2023), no. 3, 897–1113. Page numbers are those of the arXiv v2 PDF (printed page = PDF page).",
        "url": "https://arxiv.org/pdf/1812.09999v2",
        "sha256": "7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c",
        "readSections": [
          "2026-09-28 (cc-39fac3, checkpoint 6): §6.2.5–6.2.6 (ordinary deformations: Λ_v, 𝒢_v, R^△_v, R^{det,ord}_v, Lemma 6.2.9, Proposition 6.2.10, Lemma 6.2.11, Proposition 6.2.12 with proof), pp. 137–141; the bibliography entries [Ger19], [Tho15], [CS19a]."
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1812.09999v2",
          "sha256": "7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "SKINNER-WILES-1999",
        "title": "Residually reducible representations and modular forms",
        "authors": "C. M. Skinner and A. J. Wiles",
        "edition": "Publications mathématiques de l'IHÉS 89 (1999), 5–126, DOI 10.1007/BF02698855; Numdam open-access scan (OCR text layer; printed page = PDF page + 3).",
        "url": "http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf",
        "sha256": "ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3",
        "readSections": [
          "2026-09-28 (cc-39fac3, checkpoint 6): §2.1, Lemma 2.2 and Corollary 2.3 with proofs, pp. 11–13, read on the page images."
        ],
        "reviewedVersion": {
          "url": "https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf",
          "sha256": "ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "KISIN-2ADIC-2009",
        "title": "Modularity of 2-adic Barsotti–Tate representations",
        "authors": "Mark Kisin",
        "edition": "Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page. Published in Invent. Math. 178 (2009) (the published version was not compared).",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi",
        "sha256": "a11fdea301d662ada1cd675bea21a89ba9ab0a75955e496e4a1bcdecab97bf7d",
        "read": "2026-09-29",
        "readSections": [
          "Introduction (Theorem 0.1), and §2 in full: (2.1.1)–(2.1.13), (2.2.1)–(2.2.7), (2.3.1)–(2.3.13), (2.4.1)–(2.4.6), (2.5.1)–(2.5.6), pp. 1–2 and 19–35."
        ],
        "reviewedVersion": {
          "url": "https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi",
          "sha256": "a11fdea301d662ada1cd675bea21a89ba9ab0a75955e496e4a1bcdecab97bf7d",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BIP-2023",
        "title": "On local Galois deformation rings",
        "authors": "Gebhard Böckle, Ashwin Iyengar, Vytautas Paškūnas",
        "edition": "Forum of Mathematics, Pi 11 (2023), e30; Corrigendum, Forum Math. Pi 12 (2024), e5; read in arXiv:2110.01638v2 (22 August 2023), sha256 b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2110.01638",
        "sha256": "b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4",
        "readSections": [
          "§3.5 (Proposition 3.33)",
          "§3.7 (Proposition 3.41, Corollary 3.42, Remark 3.43)",
          "§4 (Lemma 4.1, Remark 4.4)",
          "§5 (the functor 𝒳, Proposition 5.1, Corollary 5.2, Lemma 5.3)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2110.01638v2",
          "sha256": "b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "PQ-2026",
        "title": "On local Galois deformation rings: generalised reductive groups",
        "authors": "Vytautas Paškūnas, Julian Quast",
        "edition": "Forum of Mathematics, Pi 14 (2026), e15; read in arXiv:2404.14622v2 (9 January 2026), sha256 eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2404.14622",
        "sha256": "eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c",
        "readSections": [
          "§3 (Lemmas 3.1–3.5, Proposition 3.6, Corollary 3.8, Lemmas 3.10–3.11)",
          "§3.1 (Corollary 3.12, Proposition 3.13)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2404.14622v2",
          "sha256": "eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "CG-2018",
        "title": "Modularity lifting beyond the Taylor–Wiles method",
        "authors": "Frank Calegari, David Geraghty",
        "edition": "Inventiones Math. 211 (2018), 297–433; Correction, Invent. Math. 227 (2022), 855–856; read in arXiv:1207.4224v2 (the accepted version), sha256 67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb, accessed 2026-10-07; locators are the published pages as recorded by the reviewed extraction PAPER-CALEGARI-GERAGHTY-18",
        "url": "https://arxiv.org/abs/1207.4224",
        "sha256": "67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb",
        "readSections": [
          "§3.7 (Theorem 3.19, Definitions 3.20–3.21, Lemma 3.22 and its proof)",
          "§4.1 (Theorem 4.3, Lemmas 4.5–4.7, Lemma 4.11 with its proof and footnote 5)",
          "§8.5.1"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1207.4224v2",
          "sha256": "67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BCGP-2021",
        "title": "Abelian surfaces over totally real fields are potentially modular",
        "authors": "George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni",
        "edition": "Publ. Math. IHÉS 134 (2021), 153–501; read in arXiv:1812.09269v3 (final version, 28 November 2021), sha256 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed, accessed 2026-10-07; locators are arXiv v3 pages",
        "url": "https://arxiv.org/abs/1812.09269",
        "sha256": "7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed",
        "readSections": [
          "§7.1 (Definition 7.1.2, the paragraph after it, Lemma 7.1.3)",
          "§7.3 (Definition 7.3.1 to Lemma 7.3.18)",
          "§7.4 (Proposition 7.4.2 to Proposition 7.4.21)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1812.09269v3",
          "sha256": "7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BHS-2019",
        "title": "A local model for the trianguline variety and applications",
        "authors": "Christophe Breuil, Eugen Hellmann, Benjamin Schraen",
        "edition": "Publ. Math. IHÉS 130 (2019), 299–412; read in arXiv:1702.02192, sha256 4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/1702.02192",
        "sha256": "4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961",
        "readSections": [
          "§3.6 with (3.27)–(3.28) and Remark 3.6.1"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1702.02192",
          "sha256": "4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "DING-2025",
        "title": "p-adic Hodge parameters in the crystabelline representations of GL_n",
        "authors": "Yiwen Ding",
        "edition": "Publ. Math. IHÉS 142 (2025), 1–74; read in arXiv:2407.21237, sha256 a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2407.21237",
        "sha256": "a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8",
        "readSections": [
          "§3.2.2 (the rings R_D, R_{D,w}, R_{D,g}, R_δ)",
          "§4.1 (the trianguline variety, as consumed)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2407.21237",
          "sha256": "a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "LTXZZ-2022",
        "title": "On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives",
        "authors": "Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu",
        "edition": "Inventiones Math. 228 (2022), 107–375; read in arXiv:1912.11942v3, accessed 2026-10-07; locators are the published numbering recorded by the reviewed extraction PAPER-LIU-ETAL-22 (arXiv v3 numbers the rigidity definition 6.3.4)",
        "url": "https://arxiv.org/abs/1912.11942",
        "readSections": [
          "§6.3 (the rigidity definition)",
          "§6.4 (the rings R^mix, R^unr, R^ram and the local model at 𝔭)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1912.11942v3",
          "sha256": "84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "LTXZZ-RIGID-2021",
        "title": "Deformation of rigid conjugate self-dual Galois representations",
        "authors": "Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu",
        "edition": "arXiv:2108.06998v1 (2021), the companion [51] of LTXZZ 2022; accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2108.06998",
        "readSections": [
          "§3.3 (Definition 3.3.1)",
          "§3.4 (Definition 3.4.8, Proposition 3.4.12)",
          "§3.5 (Definition 3.5.1, Proposition 3.5.2 and its proof)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2108.06998v1",
          "sha256": "fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "NT-2026",
        "title": "Symmetric power functoriality for Hilbert modular forms",
        "authors": "James Newton, Jack A. Thorne",
        "edition": "Annals of Math. 203 (2026), no. 1; read in arXiv:2212.03595v2, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2212.03595",
        "readSections": [
          "§2 (Definition 2.5)",
          "§3 (Lemma 3.1, Lemma 3.6 with its proof, Lemma 3.8 and its proof)",
          "§4 (the local quotients after Theorem 4.1, Lemma 4.2)",
          "§5 (proof of Theorem 5.9)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2212.03595v2",
          "sha256": "6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "CG-2020",
        "title": "Minimal modularity lifting for nonregular symplectic representations",
        "authors": "Frank Calegari, David Geraghty; appendix by Frank Calegari, David Geraghty, Michael Harris",
        "edition": "Duke Math. J. 169 (2020), no. 5, 801–896; read in arXiv:1907.08691v1 and the appendix arXiv:1907.08694v1, accessed 2026-10-07; locators are published pages as recorded by the reviewed extraction PAPER-CALEGARI-GERAGHTY-20",
        "url": "https://arxiv.org/abs/1907.08691",
        "readSections": [
          "§4 (Assumption 4.3, Remark 4.4, Definition 4.6, Remark 4.7, Lemma 4.8 and its proof)",
          "Appendix §A.4"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1907.08691v1",
          "sha256": "39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "FKP-2022",
        "title": "Lifting and automorphy of reducible mod p Galois representations over global fields",
        "authors": "Najmuddin Fakhruddin, Chandrashekhar Khare, Stefan Patrikis",
        "edition": "Inventiones Math. 228 (2022), 415–492; read in arXiv:2008.12593v5 (final version), sha256 6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2 as recorded by the extraction, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2008.12593",
        "readSections": [
          "§2 (local lifting rings in equal characteristic)",
          "§5 (Theorem 5.2)",
          "§7 (Lemma 7.2)",
          "§8 (proof of Theorem 8.1)",
          "§9 (proof of Proposition 9.1)",
          "Appendix B (Definition B.2, Lemmas B.3–B.4)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2008.12593v5",
          "sha256": "6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BCGP-2025",
        "title": "Modularity theorems for abelian surfaces",
        "authors": "George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni",
        "edition": "arXiv:2502.20645v1 (2025), sha256 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2502.20645v1",
        "sha256": "51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c",
        "readSections": [
          "§1.8.10",
          "§5.4–5.6 (local deformation problems, Lemmas 5.6.2–5.6.3, Propositions 5.6.4, 5.6.6, Remark 5.6.7, Definition 5.6.8)",
          "§6.1–6.2 (fixed-similitude lifts, Lemma 6.1.6, ordinary GSp₄ rings, 6.2.1–6.2.6)",
          "§7.5.2"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2502.20645v1",
          "sha256": "51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "KISIN-PST-2008-AMS",
        "title": "Potentially semi-stable deformation rings",
        "authors": "Mark Kisin",
        "edition": "J. Amer. Math. Soc. 21 (2008), 513–546; the AMS open-access PDF, sha256 3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556, re-read 2026-10-07 for (2.5.5), (2.7.5)–(2.7.7) in families Independent review 2026-10-07: Same author DVI as KISIN-PST-2008; families theorems checked there. AMS PDF returned HTTP 403.",
        "url": "https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/",
        "sha256": "3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556",
        "readSections": [
          "Introduction (the Corollary on Hilbert modular forms)",
          "(2.1), (2.5.5)",
          "(2.7.5)–(2.7.7)"
        ],
        "reviewedVersion": {
          "url": "https://people.math.harvard.edu/~kisin/dvifiles/def.dvi",
          "sha256": "ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee",
          "read": "2026-10-07",
          "note": "Same author DVI as KISIN-PST-2008; families theorems checked there. AMS PDF returned HTTP 403."
        }
      },
      {
        "id": "CDN-2023",
        "title": "Factorisation de la cohomologie étale p-adique de la tour de Drinfeld",
        "authors": "Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł",
        "edition": "Forum of Mathematics, Pi 11 (2023), e16; read in arXiv:2204.11214, sha256 c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2204.11214",
        "sha256": "c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee",
        "readSections": [
          "§0.1",
          "§5.2 (the ring R_{B,M}, Théorème 5.11, Lemme 5.12)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2204.11214",
          "sha256": "c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BCDT-2001",
        "title": "On the modularity of elliptic curves over Q: wild 3-adic exercises",
        "authors": "Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor",
        "edition": "J. Amer. Math. Soc. 14 (2001), 843–939; the AMS open-access PDF, sha256 1e34130e55a0ef39d7ef2566cc7d518e2b69048dece36328a0b6530e92044cf2, accessed 2026-10-07 Independent review 2026-10-07: Author manuscript. §1.1 and Conjecture 1.1.1 are on author pp.7–8; §4.3 on author pp.27–28. Published page locators were not independently compared.",
        "url": "https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/",
        "sha256": "1e34130e55a0ef39d7ef2566cc7d518e2b69048dece36328a0b6530e92044cf2",
        "readSections": [
          "§1.1 (ℓ-types, R^D, weakly of type, Conjecture 1.1.1)",
          "§4.3 (the categories S and the functors D^S)"
        ],
        "reviewedVersion": {
          "url": "https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf",
          "sha256": "13043cf6e9043a69dc7988882658cd92595efc88dfd4fd2f326ac3ef3cae8e06",
          "read": "2026-10-07",
          "note": "Author manuscript. §1.1 and Conjecture 1.1.1 are on author pp.7–8; §4.3 on author pp.27–28. Published page locators were not independently compared."
        }
      },
      {
        "id": "CN-2023",
        "title": "On the modularity of elliptic curves over imaginary quadratic fields",
        "authors": "Ana Caraiani, James Newton",
        "edition": "arXiv:2301.10509v3, sha256 57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2301.10509v3",
        "sha256": "57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3",
        "readSections": [
          "§3.3 (Definition 3.3.1, Lemma 3.3.2, Theorem 3.3.3, §3.3.5, Lemma 3.3.6)",
          "§5.3 (Proposition 5.3.2, Lemmas 5.3.3–5.3.4)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2301.10509v3",
          "sha256": "57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "KW1-2009",
        "title": "Serre's modularity conjecture (I)",
        "authors": "Chandrashekhar Khare, Jean-Pierre Wintenberger",
        "edition": "Inventiones Math. 178 (2009), 485–504; the authors' copy results.pdf on Khare's UCLA page, accessed 2026-10-07",
        "url": "https://www.math.ucla.edu/~shekhar/papers/results.pdf",
        "readSections": [
          "§4 (Theorem 4.1)",
          "§5 (minimal lifts, Theorem 5.1 and the remarks after it)"
        ],
        "reviewedVersion": {
          "url": "https://www.math.ucla.edu/~shekhar/papers/results.pdf",
          "sha256": "3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BLGGT-2014",
        "title": "Potential automorphy and change of weight",
        "authors": "Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor",
        "edition": "Annals of Math. 179 (2014), 501–609; read in arXiv:1010.2561v4, sha256 c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/1010.2561",
        "sha256": "c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24",
        "readSections": [
          "§1.3 (local theory, l ≠ p: Lemmas 1.3.2, 1.3.4)",
          "§1.4 (local theory, l = p: connects and its properties)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1010.2561v4",
          "sha256": "c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BCGNT-2025",
        "title": "The Ramanujan and Sato–Tate conjectures for Bianchi modular forms",
        "authors": "George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne",
        "edition": "Forum of Mathematics, Pi 13 (2025), e10; read in arXiv:2309.15880, sha256 0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2309.15880",
        "sha256": "0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d",
        "readSections": [
          "§3.2 (Theorem 3.2.1, Remark 3.2.2)",
          "§5.1 (Definition 5.1.1, Lemmas 5.1.3–5.1.5)",
          "§6.2 (proof of Proposition 6.2.3)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2309.15880",
          "sha256": "0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "BCG-2025",
        "title": "Cuspidal cohomology classes for GL_n(Z)",
        "authors": "George Boxer, Frank Calegari, Toby Gee",
        "edition": "J. Amer. Math. Soc. 38 (2025), 509–520; read in arXiv:2309.15944v3, sha256 abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684, accessed 2026-10-07",
        "url": "https://arxiv.org/abs/2309.15944",
        "sha256": "abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684",
        "readSections": [
          "proof of Theorem 2.1 (FKP Lemma B.4 as used)",
          "proof of Theorem 3.1 (connects)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/2309.15944v3",
          "sha256": "abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "LLHLM-2020",
        "title": "Serre weights and Breuil's lattice conjecture in dimension three",
        "authors": "Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra",
        "edition": "Forum of Mathematics, Pi 8 (2020), e5; read in arXiv:1608.06570v4, sha256 cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd, accessed 2026-10-07; locators follow the reviewed extraction PAPER-LE-LEHUNG-LEVIN-ETAL-20 (published pages)",
        "url": "https://arxiv.org/abs/1608.06570",
        "sha256": "cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd",
        "readSections": [
          "§3.1 (Definitions 3.1.3, 3.1.6)",
          "§3.2 (Propositions 3.2.1–3.2.2, Lemma 3.2.3)",
          "§3.3 (Definitions 3.3.1–3.3.7, Propositions 3.3.5–3.3.9, Lemma 3.3.10, Theorems 3.3.11–3.3.12)",
          "§3.5 (Theorem 3.5.3, Lemma 3.5.4)",
          "§3.6 (Proposition 3.6.1, diagram (3.9), Proposition 3.6.3, Theorem 3.6.4, Lemma 3.6.6, Corollary 3.6.7, Propositions 3.6.9, Lemma 3.6.10, Tables 3–4)"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1608.06570v4",
          "sha256": "cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd",
          "read": "2026-10-07",
          "note": "Cited sections, locators and excerpts checked in this public version; formula OCR compared in context. This records source reading, not a claim that every missing proof input has been supplied."
        }
      },
      {
        "id": "CT-2017",
        "title": "Level-raising and symmetric power functoriality, III",
        "authors": "Laurent Clozel, Jack A. Thorne",
        "edition": "Duke Math. J. 166 (2017), 325–402; read in the accepted manuscript lrspiii.pdf on Thorne's Cambridge page, sha256 a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659, accessed 2026-10-07",
        "url": "https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf",
        "sha256": "a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659",
        "readSections": [
          "§5.1 (the local deformation problems, the rings R^m_v, Lemma 5.2 and its proof)"
        ],
        "reviewedVersion": {
          "url": "https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf",
          "sha256": "a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659",
          "read": "2026-10-07",
          "note": "Accepted author manuscript; same locator numbering. Downloaded after the endpoint certificate validation failed."
        }
      },
      {
        "id": "SHOTTON-2018",
        "title": "Jack Shotton, Generic local deformation rings when ℓ≠p, Duke Mathematical Journal 167 (2018), author preprint v2",
        "url": "https://arxiv.org/pdf/1608.01784v2",
        "authors": "Jack Shotton",
        "edition": "Duke Mathematical Journal 167 (2018); author preprint arXiv:1608.01784v2.",
        "readSections": [
          "Definition 3.5; Proposition 3.6"
        ],
        "reviewedVersion": {
          "url": "https://arxiv.org/pdf/1608.01784v2",
          "sha256": "54775e5adac83cdbb628ea5238aab8a7a04a3d9bb3dc2502b46da6bb21689992",
          "read": "2026-10-07",
          "note": "Author preprint v2; Definition 3.5 and Proposition 3.6 read."
        }
      },
      {
        "id": "THORNE-2015",
        "title": "Jack Thorne, Automorphy lifting for residually reducible l-adic Galois representations, JAMS 28 (2015), accepted author manuscript",
        "url": "https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download",
        "authors": "Jack Thorne",
        "edition": "J. Amer. Math. Soc. 28 (2015); publicly available accepted author manuscript, 16 April 2014.",
        "readSections": [
          "§3.3.2, Lemmas 3.11–3.13 and Proposition 3.14",
          "§3.3.3–3.3.4, Propositions 3.15–3.17"
        ],
        "reviewedVersion": {
          "url": "https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download",
          "sha256": "76393fcb9a31931789fa4f7c6de9a64275fb02e81e5a3b98c53b8aa1a1834928",
          "read": "2026-10-07",
          "note": "Accepted author manuscript dated 16 April 2014; Lemmas 3.11–3.13 and Propositions 3.14–3.17 read."
        }
      }
    ]
  }
]
```

</details>

<details>
<summary>requests</summary>

```json
[
  {
    "path": "/requests/1/need",
    "before": "The presentation algebra relating relations to obstructions: for a lifting ring with tangent dimension d, a minimal presentation 𝒪[[x₁..x_d]]/J has J/𝔪J ↪ H²(G, ad ρ̄)^∨.",
    "after": "The presentation algebra relating relations to obstructions: for a lifting ring with tangent dimension d, a minimal presentation 𝒪[[x₁..x_d]]/J has H²(G, ad ρ̄)^∨ ↠ J/𝔪J (equivalently (J/𝔪J)^∨ ↪ H²(G, ad ρ̄))."
  },
  {
    "path": "/requests/11/need",
    "before": "The general symplectic group GSp_{2n} as a matrix group scheme over any commutative ring (g with gᵀJg = ν(g)J), its multiplier ν : GSp_{2n} → 𝔾_m, its derived group Sp_{2n} and Lie algebras Lie GSp_{2n} ⊃ Lie Sp_{2n} (dimensions 11 and 10 for n = 2), over 𝒪 and over Artinian 𝒪-algebras.",
    "after": "Extend the integral matrix carrier and multiplier of ST.5/symplectic-similitude-group to the smooth affine GSp group scheme over any coefficient DVR, with derived group Sp and integral Lie algebras of dimensions 11 and 10 in rank four, compatible with both transpose conventions. ClassicalGroups Layer 0 over ℂ does not supply this generality."
  },
  {
    "path": "/requests/11/note",
    "added": "Read the existing ArithmeticStatistics ST.5 definition and ClassicalGroups Layer 0; the extension belongs to the carrier’s owner, not a second definition here."
  },
  {
    "path": "/requests/11/status",
    "added": "open"
  },
  {
    "path": "/requests/11/supplier",
    "before": "tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation",
    "after": "ArithmeticStatistics:ST.5"
  },
  {
    "path": "/requests",
    "oldRange": [
      17,
      17
    ],
    "newRange": [
      17,
      19
    ],
    "added": [
      {
        "supplier": "tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality",
        "status": "open",
        "need": "Extend local continuous-cohomology duality, finiteness and Euler characteristic to finite-dimensional modules over κ that is a characteristic-zero local field or a possibly infinite characteristic-p local field, with the natural topology, as in PQ26 Lemma 3.1. Also supply the κ-linear H² structure and scalar-extension comparison; the pinned TauCeti H2 is only an additive group.",
        "neededBy": [
          "LocalGaloisDeformationRings:R08.1/lambda-presentation",
          "LocalGaloisDeformationRings:R08.1/g-valued-presentations"
        ]
      },
      {
        "supplier": "PadicHodgeTheory:R06.3",
        "status": "open",
        "need": "Prove the descent-data ColmezFontainePst proposition defined by R06.2/colmez-fontaine-theorem, with finite coefficient fields and the scalar-extension comparison needed for completed local filtered (φ,N)-module deformations. The supplier packet proposes R06.3/colmez-fontaine-proof but contains no such theorem node yet. Supply the explicit projection from its full WD pair (r,N) to the p-adic inertia type that forgets N.",
        "neededBy": [
          "LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations",
          "LocalGaloisDeformationRings:R08.3/hodge-and-galois-types"
        ]
      }
    ]
  }
]
```

</details>

<details>
<summary>coverage</summary>

```json
[
  {
    "path": "/coverage/0/remaining",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Complete the κ-coefficient duality comparison and integral GSp group-scheme supplier; restrict Ding to ΦΓ_nc(φ,h)."
    ]
  },
  {
    "path": "/coverage/0/status",
    "before": "planned",
    "after": "partial"
  },
  {
    "path": "/coverage/1/remaining",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "Supply the exact general G minimally ramified hypotheses/definitions and the Dotto inertial cycle-map input. Keep monodromy type closures and the polarized inert-place level-raising normalization."
    ]
  },
  {
    "path": "/coverage/1/status",
    "before": "planned",
    "after": "partial"
  },
  {
    "path": "/coverage/2/remaining",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      4
    ],
    "added": [
      "Complete the determinant and Hodge-type compatibility hypotheses and the fixed-extension G-valued quotient/flag comparison.",
      "Import the actual ColmezFontainePst proof from R06.3; the existing R06.2 node only defines the proposition."
    ]
  },
  {
    "path": "/coverage/2/status",
    "before": "planned",
    "after": "partial"
  },
  {
    "path": "/coverage/3/remaining",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Provide the precise local-model supplier and endpoint integral classification behind the stated resolutions."
    ]
  },
  {
    "path": "/coverage/3/status",
    "before": "planned",
    "after": "partial"
  },
  {
    "path": "/coverage/4/remaining",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      3
    ],
    "added": [
      "Import the complete KW II Lemma 3.5 and the integral endpoints, retaining flat-family hypotheses at p=2.",
      "Make the connected augmented-coefficient node a wrapper around R07.4’s category and realization, not a second integral Kisin theory."
    ]
  },
  {
    "path": "/coverage/4/status",
    "before": "planned",
    "after": "partial"
  },
  {
    "path": "/coverage/5/remaining",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Complete the endpoint classification dependencies for the exported local table; reconcile the corrected Savitt type restriction in the reader document."
    ]
  },
  {
    "path": "/coverage/5/status",
    "before": "planned",
    "after": "partial"
  },
  {
    "path": "/coverage/6/remaining",
    "oldRange": [
      0,
      1
    ],
    "newRange": [
      0,
      0
    ],
    "removed": [
      "Thorne's structure theorem for the flag image ring (ACC+ Proposition 6.2.10; Thorne 2015 Proposition 3.14) remains the recorded gap behind L7/trivial-residual-flag-ring."
    ]
  },
  {
    "path": "/coverage/6/remaining",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      2,
      4
    ],
    "added": [
      "Give actual GL3 row presentations and exact gauge-basis comparisons; import general Kisin/FL and canonical-torus objects from their owners. Resolve the ordinary sign dictionary and Geraghty/rank-four component inputs.",
      "Remove duplicated FL/Kisin category declarations from local API; retain coefficient-family and GL₃ shape wrappers using the single R06.4/R07.3/R07.4 owners."
    ]
  },
  {
    "path": "/coverage/6/status",
    "before": "planned",
    "after": "partial"
  },
  {
    "path": "/coverage/7/remaining",
    "oldRange": [
      0,
      0
    ],
    "newRange": [
      0,
      1
    ],
    "added": [
      "Implement actual determinant-ordinary signatures and examples in the suggested file; retain the corrected nonreduced matrix test and module, rather than ring, doubling comparison."
    ]
  },
  {
    "path": "/coverage/7/status",
    "before": "source_decomposed",
    "after": "partial"
  }
]
```

</details>

<details>
<summary>gaps</summary>

```json
[
  {
    "path": "/gaps/1/detail",
    "before": "ACC+ Proposition 6.2.10 is proved by reference to Thorne, Automorphy lifting for residually reducible l-adic Galois representations, J. Amer. Math. Soc. 28 (2015), 785–870, Proposition 3.14 (flatness, reducedness, equidimensionality and the bijection on generic points for trivial ρ̄ and [F_v : ℚ_p] > n(n − 1)/2 + 1). That paper is not on arXiv (only part II, arXiv:1912.11269, is) and was not obtained; Geraghty, Math. Ann. 373 (2019), §3 (the source of R^△_v and of the tangent computation Lemma 3.7) is also still to be read.",
    "after": "Thorne 2015 is publicly accessible and was read: Lemmas 3.11–3.13 and Proposition 3.14 give the flag-ring statement. Its proof uses the comparison of completed local flag rings with the Demuškin matrix model and the fixed-character tangent computation from Geraghty. These exact imported key statements, including Geraghty Lemmas 3.7, 3.10 and 3.14 used elsewhere, are not separately supplied in the packet. Source access to Thorne is resolved; the remaining issue is prerequisite closure."
  },
  {
    "path": "/gaps/1/title",
    "before": "Thorne's structure theorem for the flag image ring (ACC+ Proposition 6.2.10)",
    "after": "Completed-local flag geometry imported from Geraghty"
  },
  {
    "path": "/gaps",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      11
    ],
    "added": [
      {
        "title": "Natural-topology continuous cohomology beyond finite coefficients",
        "neededBy": [
          "LocalGaloisDeformationRings:R08.1/lambda-presentation",
          "LocalGaloisDeformationRings:R08.1/g-valued-presentations"
        ],
        "detail": "ClassFieldTheory Layer 5 is a finite discrete coefficient theory; PQ’s natural-topology κ-coefficient extension and the coefficient-linear H² comparison are requested explicitly."
      },
      {
        "title": "Integral reductive group scheme and Lie API",
        "neededBy": [
          "LocalGaloisDeformationRings:R08.1/g-valued-framed-ring",
          "LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p",
          "LocalGaloisDeformationRings:R08.3/g-valued-pst-rings"
        ],
        "detail": "ArithmeticStatistics ST.5 owns the integral GSp carrier. Its smooth group-scheme/Lie extension, general reductive minimally ramified conditions, and the exact Booher prime hypotheses are not supplied by the complex ClassicalGroups roadmap."
      },
      {
        "title": "Endpoint crystalline classification and KW ordinarity input",
        "neededBy": [
          "LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible",
          "LocalGaloisDeformationRings:R08.6/export-endpoint-weight",
          "LocalGaloisDeformationRings:R08.5/weight-p-crystalline-ordinarity",
          "LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring"
        ],
        "detail": "The strict FL interval stops at p−2. Integral endpoint lattice results at weights p and p=2, plus full KW II Lemma 3.5 including Berger–Li–Zhu, must be imported from R07.4/R06.4. The existing R06.4 branch statements do not supply the complete lemma."
      },
      {
        "title": "Inertial Jacquet–Langlands cycle map",
        "neededBy": [
          "LocalGaloisDeformationRings:R08.2/dotto-division-algebra-cycles"
        ],
        "detail": "Dotto’s cycle map requires the precise discrete-series inertial type transfer, extensions from O_D units, and cycle comparison. The present node invokes these without supplying their definitions or an exact owning supplier."
      },
      {
        "title": "Ordinary weight and canonical torus comparison",
        "neededBy": [
          "LocalGaloisDeformationRings:L7/g-valued-ordinary-condition",
          "LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient",
          "LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres",
          "LocalGaloisDeformationRings:L7/gl2-borel-ordinary-ring",
          "LocalGaloisDeformationRings:L7/gsp4-ordinary-weight-two-components",
          "LocalGaloisDeformationRings:L7/weight-zero-crystalline-connectedness"
        ],
        "detail": "CN/KW/FKP conventions need explicit duality and cocharacter translation; the canonical torus must come from its reductive-group owner. Geraghty’s ordinary crystalline component theorem and the rank-four component input for GSp4 need precise supplier statements. The omitted GSp character exclusions and GL2 relative-weight presentations must be stated."
      },
      {
        "title": "GL3 explicit presentation and comparison",
        "neededBy": [
          "LocalGaloisDeformationRings:L7/kisin-modules-tame-descent",
          "LocalGaloisDeformationRings:L7/gl3-explicit-rings",
          "LocalGaloisDeformationRings:L7/gl3-component-labelling"
        ],
        "detail": "Supply the actual defining polynomial equations for the length>1, alpha and identity cases of Tables 3–4, the exact formal comparison with gauge choices, and the component-label weight graph. General Kisin modules/descent remain owned by R07.4; do not rebuild them here."
      },
      {
        "title": "Suggested Lean correspondence",
        "neededBy": [
          "LocalGaloisDeformationRings:L7/finite-height-lattices",
          "LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition",
          "LocalGaloisDeformationRings:R08.5/connected-kisin-modules-with-coefficients",
          "LocalGaloisDeformationRings:R08.1/g-valued-framed-ring",
          "LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings",
          "LocalGaloisDeformationRings:L7/g-valued-ordinary-condition",
          "LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient",
          "LocalGaloisDeformationRings:L7/kisin-modules-tame-descent",
          "LocalGaloisDeformationRings:L7/gl3-explicit-rings"
        ],
        "detail": "Most of the packet’s 43 definitions/constructions, 208 original API items and 160 original tests appear only as names in comments. Section 13 requires actual signatures/examples where expressible and honest omission otherwise; the suggested file must not substitute Prop placeholders."
      },
      {
        "title": "Colmez–Fontaine proof and inertia-type projection",
        "neededBy": [
          "LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations",
          "LocalGaloisDeformationRings:R08.3/hodge-and-galois-types"
        ],
        "detail": "PadicHodgeTheory--P7 defines the Colmez–Fontaine proposition in R06.2 and records the R06.3 proof as a restructure proposal/open gap. It cannot yet discharge admissibility in filtered-module deformation comparisons. The exact proof and the projection forgetting N are requested from R06.3."
      }
    ]
  }
]
```

</details>

<details>
<summary>sourceIssues</summary>

```json
[
  {
    "path": "/sourceIssues",
    "oldRange": [
      0,
      2
    ],
    "newRange": [
      0,
      3
    ],
    "removed": [
      {
        "id": "LocalGaloisDeformationRings/E1",
        "source": "SAVITT-2005",
        "kind": "error",
        "locator": "Theorem 6.12(4), in the published version (Duke Math. J. 128 (2005)); read through Remark 1.7 of arXiv v3, p. 4",
        "printed": "The mistake is in the statement and proof of Theorem 6.12(4) of the published version. … if m = 1 + (p + 1)j — i.e., if i = 1 — then the two characters ωm+p 2 and ωpm+1 2 are both characters of niveau one, and are equal.",
        "correction": "When i = 1 the reduction mod p of the lattice considered in Theorem 6.12(4) is split, not of niveau two; one more family of strongly divisible modules is needed, constructed in arXiv v3. The main theorems (6.22–6.24) are unaffected.",
        "reason": "The two fundamental characters of level two named in 6.12(4) coincide and have niveau one when i = 1, so the niveau-two conclusion cannot hold there (the author's Remark 1.7).",
        "affects": "a stated result",
        "known": "Savitt, arXiv:math/0404327v3 (Remark 1.7) and the corrigendum on the author's website",
        "searched": [
          "arXiv:math/0404327v3, Remark 1.7, read 2026-09-28."
        ],
        "note": "Recorded so that formalisers use the corrected Theorem 6.12(4); the nodes of this packet use only Theorems 6.22–6.24."
      },
      {
        "id": "LocalGaloisDeformationRings/E2",
        "source": "CHT08",
        "kind": "error",
        "affects": "a stated result",
        "locator": "§2.4.2, condition 2 on the characters χ_{v,i}, p. 37, against the proofs of Lemmas 2.4.7 and 2.4.8, pp. 39–40 (read on the page images)",
        "printed": "2. If χ̄_{v,i} denotes the reduction of χ_{v,i} modulo λ then for i < j the ratio χ̄_{v,i}/χ̄_{v,j} is neither trivial nor the cyclotomic character.",
        "correction": "For i < j the ratio χ̄_{v,j}/χ̄_{v,i} is neither trivial nor the cyclotomic character (equivalently χ̄_{v,i}/χ̄_{v,j} ≠ 1, ε̄^{−1}).",
        "reason": "The proof of Lemma 2.4.7 needs H⁰(G, Hom_k(Fil^{i+1}r̄, gr^i r̄)(1)) = 0 and states it holds 'because, for j > i, χ̄_{v,i}ε/χ̄_{v,j} ≠ 1'; the proof of Lemma 2.4.8 needs H²(G, χ̄_{v,0}^{−1}r̄′) = 0. Both are χ̄_{v,j}/χ̄_{v,i} ≠ ε̄ for i < j, which the printed condition does not give. Counterexample to the printed version: n = 2, F_ṽ = ℚ_l, l > 3, r̄ = ω ⊕ 1 with the ω-line as Fil¹ (χ_{v,1} = ε, χ_{v,0} = 1). Then χ̄_{v,0}/χ̄_{v,1} = ω^{−1} is neither trivial nor cyclotomic, but H²(G_{ℚ_l}, k(ω)) ≅ H⁰(G_{ℚ_l}, k)^∨ ≠ 0; the suitable lifts to B₂(k[ε]/(ε²)) form a space of dimension 1 + 1 + 3 = 5 rather than n(n + 1)/2 + [F_ṽ : ℚ_l]n(n − 1)/2 = 4 (the fibre of Z¹ has dimension (n − 1) + [F_ṽ : ℚ_l](n − 1) + dim H² = 3), so dim_k L_v − dim_k H⁰(ad r̄) = 2 and R^{loc}/𝓘 is not a power series ring in 5 variables. This is the familiar non-smoothness of ordinary weight-two deformations when the sub-character is the cyclotomic character times the quotient; the section is not used by CHT's applications.",
        "known": "new: no erratum found (Numdam item page; a web search for an erratum to CHT §2.4.2, 29 September 2026)",
        "searched": [
          "the Numdam item page for Publ. Math. IHÉS 108 (2008), 1–181",
          "a web search for an erratum or corrigendum to Clozel–Harris–Taylor §2.4.2 (29 September 2026): none found"
        ]
      }
    ],
    "added": [
      {
        "id": "LocalGaloisDeformationRings/E1",
        "source": "SAVITT-2005",
        "kind": "error",
        "locator": "Theorem 6.12(4), in the published version (Duke Math. J. 128 (2005)); read through Remark 1.7 of arXiv v3, p. 4",
        "printed": "The mistake is in the statement and proof of Theorem 6.12(4) of the published version. … if m = 1 + (p + 1)j — i.e., if i = 1 — then the two characters ωm+p 2 and ωpm+1 2 are both characters of niveau one, and are equal.",
        "correction": "When i = 1 the reduction mod p of the lattice considered in Theorem 6.12(4) is split, not of niveau two; one more family of strongly divisible modules is needed, constructed in arXiv v3. The main theorems (6.22–6.24) are unaffected.",
        "reason": "The two fundamental characters of level two named in 6.12(4) coincide and have niveau one when i = 1, so the niveau-two conclusion cannot hold there (the author's Remark 1.7).",
        "affects": "a stated result",
        "known": "Savitt, arXiv:math/0404327v3 (Remark 1.7) and the corrigendum on the author's website",
        "searched": [
          "arXiv:math/0404327v3, Remark 1.7, read 2026-09-28."
        ],
        "note": "Recorded so that formalisers use the corrected Theorem 6.12(4); the nodes of this packet use only Theorems 6.22–6.24.",
        "review": {
          "verdict": "confirmed",
          "by": "REV-LocalGaloisDeformationRings",
          "reason": "Savitt arXiv v3 Remark 1.7 explicitly reports the published 6.12(4) mistake and its repair; Theorems 6.22–6.24 are unaffected."
        }
      },
      {
        "id": "LocalGaloisDeformationRings/E2",
        "source": "CHT08",
        "kind": "error",
        "affects": "a stated result",
        "locator": "§2.4.2, condition 2 on the characters χ_{v,i}, p. 37, against the proofs of Lemmas 2.4.7 and 2.4.8, pp. 39–40 (read on the page images)",
        "printed": "2. If χ̄_{v,i} denotes the reduction of χ_{v,i} modulo λ then for i < j the ratio χ̄_{v,i}/χ̄_{v,j} is neither trivial nor the cyclotomic character.",
        "correction": "For i < j the ratio χ̄_{v,j}/χ̄_{v,i} is neither trivial nor the cyclotomic character (equivalently χ̄_{v,i}/χ̄_{v,j} ≠ 1, ε̄^{−1}).",
        "reason": "The proof of Lemma 2.4.7 needs H⁰(G, Hom_k(Fil^{i+1}r̄, gr^i r̄)(1)) = 0 and states it holds 'because, for j > i, χ̄_{v,i}ε/χ̄_{v,j} ≠ 1'; the proof of Lemma 2.4.8 needs H²(G, χ̄_{v,0}^{−1}r̄′) = 0. Both are χ̄_{v,j}/χ̄_{v,i} ≠ ε̄ for i < j, which the printed condition does not give. Counterexample to the printed version: n = 2, F_ṽ = ℚ_l, l > 3, r̄ = ω ⊕ 1 with the ω-line as Fil¹ (χ_{v,1} = ε, χ_{v,0} = 1). Then χ̄_{v,0}/χ̄_{v,1} = ω^{−1} is neither trivial nor cyclotomic, but H²(G_{ℚ_l}, k(ω)) ≅ H⁰(G_{ℚ_l}, k)^∨ ≠ 0; the suitable lifts to B₂(k[ε]/(ε²)) form a space of dimension 1 + 1 + 3 = 5 rather than n(n + 1)/2 + [F_ṽ : ℚ_l]n(n − 1)/2 = 4 (the fibre of Z¹ has dimension (n − 1) + [F_ṽ : ℚ_l](n − 1) + dim H² = 3), so dim_k L_v − dim_k H⁰(ad r̄) = 2 and R^{loc}/𝓘 is not a power series ring in 5 variables. This is the familiar non-smoothness of ordinary weight-two deformations when the sub-character is the cyclotomic character times the quotient; the section is not used by CHT's applications.",
        "known": "new: no erratum found (Numdam item page; a web search for an erratum to CHT §2.4.2, 29 September 2026)",
        "searched": [
          "the Numdam item page for Publ. Math. IHÉS 108 (2008), 1–181",
          "a web search for an erratum or corrigendum to Clozel–Harris–Taylor §2.4.2 (29 September 2026): none found"
        ],
        "review": {
          "verdict": "confirmed",
          "by": "REV-LocalGaloisDeformationRings",
          "reason": "The Numdam CHT text at pp.37,39–40 prints the inverse of the ratio used by the H²-vanishing proofs. The displayed ω-subline example gives the excluded obstruction and a five-dimensional tangent space, so the printed smoothness claim fails."
        }
      },
      {
        "id": "LocalGaloisDeformationRings/E3",
        "source": "GEE-MLT-2022",
        "kind": "error",
        "affects": "a stated result",
        "locator": "arXiv:2202.05818v2, §3.30 and paragraph after Theorem 3.31, pp.19–20",
        "printed": "factors through R□ρ,χ,τ if and only if ... has inertial Weil–Deligne type τ",
        "correction": "For the full type retaining N, use the reduced flat closure of exact-type points; the reverse implication is valid only on the appropriate nondegenerate locus, not at all boundary points.",
        "reason": "Take p odd and q≡1 mod p, determinant q, ρ_c(φ)=diag(q,1), ρ_c(t)=(1 c;0 1), with c=pt over 𝒪[[t]]. Arithmetic Frobenius satisfies φtφ⁻¹=t^q. For c≠0 the type is Steinberg with N≠0; at c=0 it has N=0. A closed quotient containing the dense nonzero-c locus contains c=0 too. Gee §3.30 retains N, so forgetting N cannot resolve the iff as printed. Shotton Definition 3.5 uses the Zariski closure; BLGGT 1.3.4(2) requires points on unique components.",
        "known": "new: no matching erratum located",
        "searched": [
          "Gee arXiv v2, author publications page and web searches for erratum / full inertial WD type, 2026-10-07",
          "Shotton arXiv:1608.01784v2, Definition 3.5 and Proposition 3.6; BLGGT arXiv:1010.2561v4, Lemma 1.3.4"
        ],
        "review": {
          "verdict": "confirmed",
          "reason": "The explicit one-parameter continuous family violates the exact-full-type pointwise iff; the source defines the full type with N.",
          "by": "REV-LocalGaloisDeformationRings"
        }
      }
    ]
  }
]
```

</details>

<details>
<summary>sourceVersions</summary>

```json
[
  {
    "path": "/sourceVersions",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      40
    ],
    "added": [
      {
        "kind": "public source",
        "sourceId": "GEE-MLT-2022",
        "url": "https://arxiv.org/pdf/2202.05818v2",
        "citation": "Modularity lifting theorems",
        "read": "2026-10-07",
        "sha256": "878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "KISIN-LECTURES",
        "url": "https://people.math.harvard.edu/~kisin/notes/notes.pdf",
        "citation": "Lectures on deformations of Galois representations (Lecture 1)",
        "read": "2026-10-07",
        "sha256": "9f3698a791b6a96318b8eded26962f2da7d3f34628ab47d855df7e36cd5712c6",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "TUNG-2021",
        "url": "https://arxiv.org/pdf/1908.06174v3",
        "citation": "On the modularity of 2-adic potentially semi-stable deformation rings",
        "read": "2026-10-07",
        "sha256": "a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "CHT08",
        "url": "https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf",
        "citation": "Automorphy for some l-adic lifts of automorphic mod l Galois representations",
        "read": "2026-10-07",
        "sha256": "9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "TAYLOR-II-2008",
        "url": "https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf",
        "citation": "Automorphy for some l-adic lifts of automorphic mod l Galois representations. II",
        "read": "2026-10-07",
        "sha256": "f9014a899bcccaa56035314f196b15b581abe63d56cb9d9a285ce9e93f1030bc",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "author copy",
        "sourceId": "KISIN-PST-2008",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/def.dvi",
        "citation": "Potentially semi-stable deformation rings",
        "read": "2026-10-07",
        "sha256": "ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee",
        "note": "Author DVI; published locators correspond to author page plus 512. AMS PDF returned HTTP 403; the published PDF was not independently read in this review."
      },
      {
        "kind": "public source",
        "sourceId": "KW2-2009",
        "url": "https://www.math.ucla.edu/~shekhar/papers/proofs.pdf",
        "citation": "Serre's modularity conjecture (II)",
        "read": "2026-10-07",
        "sha256": "53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "KISIN-FFLAT-2009",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi",
        "citation": "Moduli of finite flat group schemes, and modularity",
        "read": "2026-10-07",
        "sha256": "242151c94cb831c526e67de6e3b70a370b65a002342074440e86fc88a2ec5f0f",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "SAVITT-2005",
        "url": "https://arxiv.org/pdf/math/0404327v3",
        "citation": "On a conjecture of Conrad, Diamond, and Taylor",
        "read": "2026-10-07",
        "sha256": "e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "ACC-POTENTIAL-AUTOMORPHY-CM-2023",
        "url": "https://arxiv.org/pdf/1812.09999v2",
        "citation": "Potential automorphy over CM fields",
        "read": "2026-10-07",
        "sha256": "7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "SKINNER-WILES-1999",
        "url": "https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf",
        "citation": "Residually reducible representations and modular forms",
        "read": "2026-10-07",
        "sha256": "ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "KISIN-2ADIC-2009",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi",
        "citation": "Modularity of 2-adic Barsotti–Tate representations",
        "read": "2026-10-07",
        "sha256": "a11fdea301d662ada1cd675bea21a89ba9ab0a75955e496e4a1bcdecab97bf7d",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "BIP-2023",
        "url": "https://arxiv.org/pdf/2110.01638v2",
        "citation": "On local Galois deformation rings",
        "read": "2026-10-07",
        "sha256": "b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "PQ-2026",
        "url": "https://arxiv.org/pdf/2404.14622v2",
        "citation": "On local Galois deformation rings: generalised reductive groups",
        "read": "2026-10-07",
        "sha256": "eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "CG-2018",
        "url": "https://arxiv.org/pdf/1207.4224v2",
        "citation": "Modularity lifting beyond the Taylor–Wiles method",
        "read": "2026-10-07",
        "sha256": "67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "BCGP-2021",
        "url": "https://arxiv.org/pdf/1812.09269v3",
        "citation": "Abelian surfaces over totally real fields are potentially modular",
        "read": "2026-10-07",
        "sha256": "7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "BHS-2019",
        "url": "https://arxiv.org/pdf/1702.02192",
        "citation": "A local model for the trianguline variety and applications",
        "read": "2026-10-07",
        "sha256": "4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "DING-2025",
        "url": "https://arxiv.org/pdf/2407.21237",
        "citation": "p-adic Hodge parameters in the crystabelline representations of GL_n",
        "read": "2026-10-07",
        "sha256": "a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "LTXZZ-2022",
        "url": "https://arxiv.org/pdf/1912.11942v3",
        "citation": "On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives",
        "read": "2026-10-07",
        "sha256": "84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "LTXZZ-RIGID-2021",
        "url": "https://arxiv.org/pdf/2108.06998v1",
        "citation": "Deformation of rigid conjugate self-dual Galois representations",
        "read": "2026-10-07",
        "sha256": "fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "NT-2026",
        "url": "https://arxiv.org/pdf/2212.03595v2",
        "citation": "Symmetric power functoriality for Hilbert modular forms",
        "read": "2026-10-07",
        "sha256": "6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "CG-2020",
        "url": "https://arxiv.org/pdf/1907.08691v1",
        "citation": "Minimal modularity lifting for nonregular symplectic representations",
        "read": "2026-10-07",
        "sha256": "39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "FKP-2022",
        "url": "https://arxiv.org/pdf/2008.12593v5",
        "citation": "Lifting and automorphy of reducible mod p Galois representations over global fields",
        "read": "2026-10-07",
        "sha256": "6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "BCGP-2025",
        "url": "https://arxiv.org/pdf/2502.20645v1",
        "citation": "Modularity theorems for abelian surfaces",
        "read": "2026-10-07",
        "sha256": "51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "author copy",
        "sourceId": "KISIN-PST-2008-AMS",
        "url": "https://people.math.harvard.edu/~kisin/dvifiles/def.dvi",
        "citation": "Potentially semi-stable deformation rings",
        "read": "2026-10-07",
        "sha256": "ca85f74a47caf411dfb7fe0fa356ef30928d5dbd2cd518bafcc13943cf483dee",
        "note": "Same author DVI as KISIN-PST-2008; families theorems checked there. AMS PDF returned HTTP 403."
      },
      {
        "kind": "public source",
        "sourceId": "CDN-2023",
        "url": "https://arxiv.org/pdf/2204.11214",
        "citation": "Factorisation de la cohomologie étale p-adique de la tour de Drinfeld",
        "read": "2026-10-07",
        "sha256": "c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "author copy",
        "sourceId": "BCDT-2001",
        "url": "https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf",
        "citation": "On the modularity of elliptic curves over Q: wild 3-adic exercises",
        "read": "2026-10-07",
        "sha256": "13043cf6e9043a69dc7988882658cd92595efc88dfd4fd2f326ac3ef3cae8e06",
        "note": "Author manuscript. §1.1 and Conjecture 1.1.1 are on author pp.7–8; §4.3 on author pp.27–28. Published page locators were not independently compared."
      },
      {
        "kind": "public source",
        "sourceId": "CN-2023",
        "url": "https://arxiv.org/pdf/2301.10509v3",
        "citation": "On the modularity of elliptic curves over imaginary quadratic fields",
        "read": "2026-10-07",
        "sha256": "57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "KW1-2009",
        "url": "https://www.math.ucla.edu/~shekhar/papers/results.pdf",
        "citation": "Serre's modularity conjecture (I)",
        "read": "2026-10-07",
        "sha256": "3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "BLGGT-2014",
        "url": "https://arxiv.org/pdf/1010.2561v4",
        "citation": "Potential automorphy and change of weight",
        "read": "2026-10-07",
        "sha256": "c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "BCGNT-2025",
        "url": "https://arxiv.org/pdf/2309.15880",
        "citation": "The Ramanujan and Sato–Tate conjectures for Bianchi modular forms",
        "read": "2026-10-07",
        "sha256": "0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "BCG-2025",
        "url": "https://arxiv.org/pdf/2309.15944v3",
        "citation": "Cuspidal cohomology classes for GL_n(Z)",
        "read": "2026-10-07",
        "sha256": "abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "public source",
        "sourceId": "LLHLM-2020",
        "url": "https://arxiv.org/pdf/1608.06570v4",
        "citation": "Serre weights and Breuil's lattice conjecture in dimension three",
        "read": "2026-10-07",
        "sha256": "cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd",
        "note": "Cited sections checked in this public version."
      },
      {
        "kind": "author copy",
        "sourceId": "CT-2017",
        "url": "https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf",
        "citation": "Level-raising and symmetric power functoriality, III",
        "read": "2026-10-07",
        "sha256": "a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659",
        "note": "Accepted author manuscript; same locator numbering. Downloaded after the endpoint certificate validation failed."
      },
      {
        "kind": "author copy",
        "sourceId": "SHOTTON-2018",
        "url": "https://arxiv.org/pdf/1608.01784v2",
        "citation": "Jack Shotton, Generic local deformation rings when ℓ≠p, Duke Mathematical Journal 167 (2018), author preprint v2",
        "read": "2026-10-07",
        "sha256": "54775e5adac83cdbb628ea5238aab8a7a04a3d9bb3dc2502b46da6bb21689992",
        "note": "Author preprint v2; Definition 3.5 and Proposition 3.6 read."
      },
      {
        "kind": "author copy",
        "sourceId": "THORNE-2015",
        "url": "https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download",
        "citation": "Jack Thorne, Automorphy lifting for residually reducible l-adic Galois representations, JAMS 28 (2015), accepted author manuscript",
        "read": "2026-10-07",
        "sha256": "76393fcb9a31931789fa4f7c6de9a64275fb02e81e5a3b98c53b8aa1a1834928",
        "note": "Accepted author manuscript dated 16 April 2014; Lemmas 3.11–3.13 and Propositions 3.14–3.17 read."
      },
      {
        "kind": "preprint",
        "sourceId": "CG-2020",
        "url": "https://arxiv.org/pdf/1907.08694v1",
        "citation": "Calegari–Geraghty–Harris appendix to Minimal modularity lifting for nonregular symplectic representations",
        "read": "2026-10-07",
        "sha256": "8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed",
        "note": "Appendix §A.4 checked separately from the main manuscript."
      }
    ]
  }
]
```

</details>

<details>
<summary>review</summary>

```json
[
  {
    "path": "/review",
    "added": {
      "status": "needs_changes",
      "reviewer": "independent-review-REV-LocalGaloisDeformationRings",
      "date": "2026-10-07",
      "notes": "Independent target-level pass over all 153 original nodes, all baseline declarations at the exact pins, definition/construction APIs and tests, public source locators, supplier statements, library audit, planets and five confirmed red-team findings. Clear mathematical errors corrected in place and source issues E1–E3 confirmed. Remaining unverifiable targets, missing actual Lean signatures and the uneditable reader-document contradictions require revision; precise gaps and partial-stage remaining lists are recorded. The review pass is complete; implementation remains unchecked. Full field-by-field change record is in REV-LocalGaloisDeformationRings.md."
    }
  },
  {
    "path": "/review/checked",
    "added": "153 entries, given verbatim in the per-node verdict table above"
  }
]
```

</details>

### Node fields

<details>
<summary>LocalGaloisDeformationRings:R08.1/local-tangent-obstruction: acceptance, proofSteps, statement</summary>

```json
[
  {
    "path": "/acceptance/2",
    "before": "ℓ ≠ p, ℓ ≡ 1 mod p, n = 1, ρ̄ = 1: h² = h⁰(𝔽(1)) = 1 and R^□ = 𝒪[[x, y]]/((1 + y)^{p^m} − 1), m = v_p(ℓ − 1), of dimension 2 = 1 + n² but not formally smooth.",
    "after": "K = ℚ_ℓ, ℓ ≠ p, ℓ ≡ 1 mod p, n = 1, ρ̄ = 1: h² = h⁰(𝔽(1)) = 1 and R^□ = 𝒪[[x, y]]/((1 + y)^{p^m} − 1), m = v_p(ℓ − 1), of dimension 2 = 1 + n² but not formally smooth."
  },
  {
    "path": "/proofSteps/1",
    "before": "(2): choose a surjection 𝒪[[x₁, …, x_d]] ↠ R^□ inducing an isomorphism on tangent spaces; the obstruction to lifting ρ^□ mod 𝔪J across 0 → J/𝔪J → 𝒪[[x]]/𝔪J → R^□ → 0 is a class in H²(G_K, ad ρ̄) ⊗ J/𝔪J whose dual map is injective (Mazur's argument, R03.2).",
    "after": "(2): choose a surjection 𝒪[[x₁, …, x_d]] ↠ R^□ inducing an isomorphism on tangent spaces; the obstruction to lifting ρ^□ mod 𝔪J across 0 → J/𝔪J → 𝒪[[x]]/𝔪J → R^□ → 0 is a class in H²(G_K, ad ρ̄) ⊗ J/𝔪J whose map H²(G_K, ad ρ̄)^∨ → J/𝔪J is surjective by minimality (its transpose is injective) (Mazur's argument, R03.2)."
  },
  {
    "path": "/statement",
    "before": "K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. (1) m_{R^□}/(m², λ) is dual to Z¹(G_K, ad ρ̄), of dimension h¹ + n² − h⁰ where h^i = dim_𝔽 H^i(G_K, ad ρ̄). (2) R^□_ρ̄ ≅ 𝒪[[x₁, …, x_d]]/J with d = dim Z¹(G_K, ad ρ̄), and J/𝔪J embeds into H²(G_K, ad ρ̄)^∨, so J is generated by at most h² elements. (3) By local Tate duality h² = dim H⁰(G_K, ad ρ̄^∨(1)), and by the local Euler characteristic formula h⁰ − h¹ + h² = −n²[K:ℚ_p] if ℓ = p and 0 if ℓ ≠ p; hence dim R^□_ρ̄ ≥ 1 + n² + n²[K:ℚ_p] if ℓ = p and ≥ 1 + n² if ℓ ≠ p, and R^□_ρ̄ is formally smooth of that relative dimension when H⁰(G_K, ad ρ̄^∨(1)) = 0.",
    "after": "K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. (1) m_{R^□}/(m², λ) is dual to Z¹(G_K, ad ρ̄), of dimension h¹ + n² − h⁰ where h^i = dim_𝔽 H^i(G_K, ad ρ̄). (2) R^□_ρ̄ ≅ 𝒪[[x₁, …, x_d]]/J with d = dim Z¹(G_K, ad ρ̄), and the canonical obstruction map H²(G_K, ad ρ̄)^∨ ↠ J/𝔪J is surjective (equivalently (J/𝔪J)^∨ ↪ H²(G_K, ad ρ̄)), so J is generated by at most h² elements. (3) By local Tate duality h² = dim H⁰(G_K, ad ρ̄^∨(1)), and by the local Euler characteristic formula h⁰ − h¹ + h² = −n²[K:ℚ_p] if ℓ = p and 0 if ℓ ≠ p; hence dim R^□_ρ̄ ≥ 1 + n² + n²[K:ℚ_p] if ℓ = p and ≥ 1 + n² if ℓ ≠ p, and R^□_ρ̄ is formally smooth of relative dimension n²(1 + [K:ℚ_p]) if ℓ = p and n² if ℓ ≠ p when H⁰(G_K, ad ρ̄^∨(1)) = 0."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/tame-splitting: acceptance, hypotheses, statement</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "ρ̄ unramified: only τ = 1 occurs and ρ̄_1 = ρ̄ as a T_K-representation factoring through ℤ.",
    "after": "ρ̄ unramified: only τ = 1 occurs and ρ̄_1 = ρ̄ as a T_K-representation factoring through ℤ̂."
  },
  {
    "path": "/acceptance/1",
    "before": "ρ̄ tamely ramified: P_K acts trivially.",
    "after": "If the residual inertia image is a p-group, P_K acts trivially. A tame character of nontrivial prime-to-p order instead acts nontrivially on P_K; tame ramification alone does not imply trivial P_K-action."
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Enlarge 𝔽 so that every irreducible constituent of ρ̄|P_K is absolutely irreducible; the multiplicity-space tensor description uses this splitting-field hypothesis. P_K is not the usual wild inertia subgroup."
    ]
  },
  {
    "path": "/statement",
    "before": "K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. Let P_K ⊆ I_K be the kernel of a surjection I_K ↠ ℤ_p (pro-order prime to p). Then G_K = P_K ⋊ T_K with T_K = G_K/P_K ≅ ℤ_p ⋊ ℤ (Frobenius acting by q). For an irreducible k[P_K]-module τ with stabiliser G_τ, deformations of ρ̄ are equivalent to tuples of deformations of the multiplicity spaces ρ̄_τ = Hom_{P_K}(τ, ρ̄) as T_τ-representations.",
    "after": "K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. Let P_K ⊆ I_K be the kernel of a surjection I_K ↠ ℤ_p (pro-order prime to p). Then G_K = P_K ⋊ T_K with T_K = G_K/P_K ≅ ℤ_p ⋊ ℤ̂ (Frobenius acting by q). For an irreducible 𝔽[P_K]-module τ with stabiliser G_τ, deformations of ρ̄ are equivalent to tuples of deformations of the multiplicity spaces ρ̄_τ = Hom_{P_K}(τ, ρ̄) as T_τ-representations."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/minimally-ramified-condition: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.minimal_baseChange",
        "role": "functoriality",
        "statement": "A map of coefficient algebras carries a minimal lift and its split kernel flag to the corresponding minimal lift; each kernel commutes with base change."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.minimal_generator_independent",
        "role": "relation",
        "statement": "Replacing a topological generator of the pro-p tame inertia factor by its unit power gives the same minimal condition and kernel filtration."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/inertial-type-quotient: api, hypotheses, proofSteps, sources, statement, tests</summary>

```json
[
  {
    "path": "/api/1/statement",
    "before": "ℚ̄_p-points are the lifts of inertial type τ.",
    "after": "Every exact-type point factors through the type quotient; its exact-type points are Zariski dense. The converse can fail on component intersections."
  },
  {
    "path": "/api",
    "oldRange": [
      3,
      4
    ],
    "newRange": [
      3,
      5
    ],
    "removed": [
      {
        "name": "TauCeti.GaloisDeformation.Local.typeQuotient_finite",
        "role": "relation",
        "statement": "Only finitely many τ give nonzero quotients."
      }
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.typeQuotient_finite",
        "role": "relation",
        "statement": "Only finitely many full inertial types have a nonzero closure quotient."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.typeQuotient_unique",
        "role": "universal-property",
        "statement": "The defining ideal is the intersection of the kernels of all characteristic-zero exact-type points. Any reduced 𝒪-flat quotient defined by that same closure has the same kernel, hence a unique compatible quotient-ring isomorphism."
      }
    ]
  },
  {
    "path": "/hypotheses/0",
    "before": "Existence uses unrestricted-away-from-p (2): the type is constant on components of the generic fibre.",
    "after": "The type retains N, as in Gee §3.30. The closure construction is Shotton Definition 3.5 and Proposition 3.6; constancy of full monodromy is only claimed for points on unique irreducible components (BLGGT Lemma 1.3.4(2))."
  },
  {
    "path": "/proofSteps/0",
    "before": "Take the union of the components of Spec R^□[1/p] on which the type is τ, and the reduced p-torsion-free closure in Spec R^□.",
    "after": "Take the Zariski closure of the exact-type E-points and its reduced scheme structure. Shotton Proposition 3.6 identifies it with a union of irreducible components, hence it is 𝒪-flat. A closed quotient cannot exclude specializations where N drops in rank."
  },
  {
    "path": "/sources",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      {
        "sourceId": "SHOTTON-2018",
        "locator": "Definition 3.5 and Proposition 3.6",
        "excerpt": "the Zariski closure",
        "match": "The definition is a closure of exact-type points, not an iff at every boundary point."
      }
    ]
  },
  {
    "path": "/statement",
    "before": "For n = 2, ℓ ≠ p and an inertial Weil–Deligne type τ, R^□_{ρ̄,χ,τ} is the unique reduced p-torsion-free quotient of R^□_{ρ̄,χ} whose ℚ̄_p-points are exactly the lifts whose Weil–Deligne representation restricted to inertia is τ; it is nonzero for finitely many τ and then of Krull dimension 4 (a union of components of R^□_{ρ̄,χ}).",
    "after": "For n = 2, ℓ ≠ p and a full inertial Weil–Deligne type τ = (r|I_K,N), let R^□_{ρ̄,χ,τ} be the reduced 𝒪-flat quotient defined by the Zariski closure in Spec R^□_{ρ̄,χ} of its characteristic-zero points of exact type τ. A nonzero such quotient is a union of irreducible components of absolute Krull dimension 4. Exact-type points lie in its generic fibre and are Zariski dense there; boundary points may have smaller monodromy. The pointwise iff in Gee §3.31 requires correction (E3). Only finitely many types give nonzero quotients."
  },
  {
    "path": "/tests/0/statement",
    "before": "The trivial type with N = 0 gives the unramified quotient.",
    "after": "For ρ̄ unramified, trivial r|I_K and N = 0 give the unramified quotient. The closure of a Steinberg type with N ≠ 0 can meet it at an N = 0 point."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/taylor-wiles-local-ring: acceptance</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "m = 0 (q ≢ 1 mod p): R^□ = 𝒪[[x, y, B]], formally smooth.",
    "after": "Outside the q ≡ 1 hypothesis, if q ≢ 1 mod p and the residual Frobenius eigenvalue ratio is neither q nor q⁻¹, local duality gives H²(ad⁰ρ̄) = 0 and the fixed-determinant ring is formally smooth of relative dimension 3. The displayed Taylor–Wiles presentation is not asserted without these extra conditions."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/steinberg-condition: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      5
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.SteinbergLifts.baseChange",
        "role": "functoriality",
        "statement": "A coefficient map carries a lift with unipotent inertia and a chosen q-chain Frobenius polynomial to one satisfying the same equations. A lift represented by the 𝒪-flat closure stays represented by that quotient after composition."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/ihara-avoidance-components: hypotheses, sources</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "The geometric irreducibility statements use sufficiently large coefficient integers 𝒪. Thorne 2015 Proposition 3.15 supplies the general-rank extension beyond Taylor’s standing p>n; in the separate n=2 fixed-determinant clauses assume p>2 and χ=1 on G_K."
    ]
  },
  {
    "path": "/sources",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      {
        "sourceId": "THORNE-2015",
        "locator": "Proposition 3.15 and its proof",
        "excerpt": "the proof of this lemma goes through without change",
        "match": "The proof explicitly extends Taylor’s p>n restriction; coefficients must be sufficiently large for geometric integrality."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/hodge-and-galois-types: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.HodgeType.filteredIsom_iff",
        "role": "characterisation",
        "statement": "Over a splitting coefficient field, two filtered K⊗E-modules of the given rank are filtered-isomorphic iff their graded multiplicities agree at every embedding and jump. This concerns filtered isomorphism classes, not equality of raw filtration subspaces."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.GaloisType.conjugacy",
        "role": "compatibility",
        "statement": "A change of basis conjugates the finite inertia representation and gives an isomorphic Galois type; isomorphism classes and the type condition are independent of the chosen matrix representative."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/pst-deformation-ring: acceptance, proofSteps, statement</summary>

```json
[
  {
    "path": "/acceptance",
    "oldRange": [
      0,
      3
    ],
    "newRange": [
      0,
      1
    ],
    "removed": [
      "Empty for p > 2: d = 1, K = ℚ_p, V_𝔽 = ω (the mod p cyclotomic character), τ trivial and Hodge–Tate weight 0. Such lifts would be crystalline characters of weight 0, hence unramified, and cannot reduce to the ramified ω; so R^{□,τ,v} = 0.",
      "d = 1, V_𝔽 trivial, τ trivial, weight 0: R^{□,τ,v} is the unramified quotient 𝒪_E⟦x⟧ (Frob ↦ 1 + x), of generic dimension 1 = d² + 0.",
      "Different (τ, v) give disjoint unions of components of Spec R^□[1/p]."
    ],
    "added": [
      "Check the component statement in a common semistable-over-L quotient. Changing τ or v does not assert a component decomposition of the unrestricted generic fibre."
    ]
  },
  {
    "path": "/proofSteps",
    "oldRange": [
      0,
      4
    ],
    "newRange": [
      0,
      1
    ],
    "removed": [
      "Choose L/K finite Galois with I_L ⊆ ker τ. hodge-type-components over L gives A_{pst,v}, and Proposition 2.7.2 gives D_A ≅ Hom_{A[G_L]}(V_A, B⁺_st,A), a finite free W_{L,A}-module with a semilinear Gal(L/K)-action.",
      "For σ ∈ I_{L/K}, tr(σ) lies in (W_{L,A})^{φ=1} = A and is locally constant on Spec A; take the components where tr(σ) = tr τ(σ) for all σ (Theorem 2.7.6).",
      "Potentially crystalline: impose N = 0 on D (Corollary 2.7.7).",
      "(3): take the scheme-theoretic closure of the reduced subscheme in Spec R^□; ℚ̄_p-points of a p-torsion-free reduced quotient are determined by its generic fibre."
    ],
    "added": [
      "In a family semistable over the fixed extension L, the finite inertia action on D_st,L splits into isotypic summands in characteristic zero. The labelled filtration ranks are locally constant by the Hodge-type component theorem. Thus each (τ,v) locus is open and closed in this common quotient."
    ]
  },
  {
    "path": "/statement",
    "before": "Let V_𝔽 be a d-dimensional 𝔽-representation of G_K, R^□ = R^□_{V_𝔽} its framed deformation ring over 𝒪_E (R08.1/local-lifting-ring), and (τ, v) a Galois type and a p-adic Hodge type. (1) There is a quotient (R^□[1/p])^{τ,v} of R^□[1/p] such that a map to a finite E-algebra B factors through it exactly when V_B is potentially semistable of type τ and p-adic Hodge type v. It is a union of connected components of the Hodge-type-v locus of the semistable-over-L quotient, for any finite Galois L/K with I_L ⊆ ker τ. (2) The locus (R^□[1/p])^{τ,v}_cr where V_B is potentially crystalline is its closed subscheme N = 0. (3) R^{□,τ,v} denotes the reduced, p-torsion-free quotient of R^□ with R^{□,τ,v}[1/p] = ((R^□[1/p])^{τ,v})_red; its ℚ̄_p-points are exactly the lifts that are potentially semistable of type (τ, v). The same holds for R_{V_𝔽} when End_{𝔽[G_K]}V_𝔽 = 𝔽, and with fixed determinant.",
    "after": "Fix a finite Galois extension L/K and a bounded Hodge-type family of representations semistable over L. In this common semistable-over-L quotient, Hodge type and the finite inertial type factoring through I_K/I_L are locally constant on the generic fibre. Each fixed (τ,v) locus is a union of connected, hence of irreducible, components of that quotient. This assertion concerns the bounded semistable quotient, not the unrestricted lifting ring R^□[1/p]."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations: hypotheses, prerequisites</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "R06.2/colmez-fontaine-theorem defines ColmezFontainePst; it does not prove it. The R06.3 proof is requested, as proposed in the supplier packet. This is an open prerequisite, not an existing theorem node."
    ]
  },
  {
    "path": "/prerequisites/2",
    "before": "PadicHodgeTheory:R06.2/colmez-fontaine-theorem",
    "after": "PadicHodgeTheory:R06.3"
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/pst-generic-fibre: hypotheses, prerequisites, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The determinant must have the Hodge and inertia type forced by (τ,v). Dimension lowering uses characteristic-zero determinant twisting; it does not require p∤d."
    ]
  },
  {
    "path": "/prerequisites",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      "LocalGaloisDeformationRings:R08.1/determinant-twisting"
    ]
  },
  {
    "path": "/statement",
    "before": "Spec (R^□_{V_𝔽}[1/p])^{τ,v} is equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K} and has a formally smooth dense open subscheme. If End_{𝔽[G_K]}V_𝔽 = 𝔽, the same holds for (R_{V_𝔽}[1/p])^{τ,v} with dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. Consequently a nonzero R^{□,τ,v} has Krull dimension 1 + d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}, and fixing the determinant lowers these dimensions by one.",
    "after": "Spec (R^□_{V_𝔽}[1/p])^{τ,v} is equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K} and has a formally smooth dense open subscheme. If End_{𝔽[G_K]}V_𝔽 = 𝔽, the same holds for (R_{V_𝔽}[1/p])^{τ,v} with dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. Consequently a nonzero R^{□,τ,v} has Krull dimension 1 + d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}, and imposing a compatible determinant with nonzero fixed-determinant quotient lowers these dimensions by one."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/pcris-generic-smooth: hypotheses, prerequisites</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "For the integral Fontaine–Laffaille assertion, assume the residual representation belongs to the FL essential image with the specified regular labelled weights, and fix a compatible determinant for which the quotient is nonzero. The FL liftability/tangent calculation is imported from L7/fontaine-laffaille-deformation-condition and L7/fontaine-laffaille-tangent-space-and-smoothness."
    ]
  },
  {
    "path": "/prerequisites",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      6
    ],
    "added": [
      "LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition",
      "LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness"
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.4/flat-deformation-condition: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.flatLiftingRing.universal",
        "role": "universal-property",
        "statement": "For an Artinian coefficient algebra A, the natural bijection Hom_cont,𝒪(R^{fl,□},A)≃{framed lifts to A satisfying the finite-flat deformation condition} commutes with coefficient maps. At coefficient integers its point criterion is the p-divisible-group criterion already stated."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.finiteFlatModels.points",
        "role": "universal-property",
        "statement": "For an R-algebra B in the source moduli category, morphisms Spec B→𝒢ℛ_{V_𝔽,ξ} correspond to E-height≤1 projective lattices in M(ξ)_B, with the specified generic-fibre identification. Pullback of the universal lattice gives this bijection and commutes with B→B′."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.4/hodge-type-resolution: acceptance, api</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "v_ψ = 1 for all ψ, d = 2: 𝒢ℛ^{v,loc} = 𝒢ℛ^v, and R^v is the cyclotomic-determinant part of the flat ring.",
    "after": "v_ψ = 1 for all ψ, d = 2: 𝒢ℛ^{v,loc} = 𝒢ℛ^v, and R^v has cyclotomic determinant Hodge type; its determinant is cyclotomic up to an unramified character, and a chosen determinant requires a further quotient."
  },
  {
    "path": "/api",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.flatResolution.points",
        "role": "universal-property",
        "statement": "An admissible B-point is a finite-flat model lattice satisfying the labelled Hodge determinant/rank condition defining v. Pullback of the universal lattice and its filtration commutes with coefficient base change."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.4/savitt-weight-two-rings: statement</summary>

```json
[
  {
    "path": "/statement",
    "before": "Let p be odd, ρ̄ : G_{ℚ_p} → GL_2(k_E) with End ρ̄ = k_E, and R(2, τ, ρ̄) the quotient of the universal deformation ring by the intersection of the primes of type (2, τ) (potentially Barsotti–Tate of inertial type τ, Hodge–Tate weights (0, 1), fixed determinant). (1) If τ = ω̃^i ⊕ ω̃^j with i ≢ j mod p − 1: R(2, τ, ρ̄) = 0 unless ρ̄|I_p is (ω^{1+i} ∗; 0 ω^j), (ω^{1+j} ∗; 0 ω^i) or ω₂^k ⊕ ω₂^{pk} with k = 1 + {j − i} + (p + 1)i; it is 𝒪_E⟦Y⟧ in the two reducible cases, and 𝒪_E⟦X₁, X₂⟧/(X₁X₂ − pw) with w ∈ 𝒪_E^× in the irreducible case (E ⊇ ℚ_{p²}, √det ρ̄(Frob_p) ∈ k_E). (2) If τ = ω̃₂^m ⊕ ω̃₂^{pm} with p + 1 ∤ m: R(2, τ, ρ̄) is 𝒪_E⟦B⟧ for the reducible and irreducible shapes listed by Savitt (Theorem 6.23), and 0 otherwise. So the Breuil–Mézard conjecture holds for k = 2 and τ tame.",
    "after": "Let p be odd, ρ̄ : G_{ℚ_p} → GL_2(k_E) with End ρ̄ = k_E, and R(2, τ, ρ̄) the quotient of the universal deformation ring by the intersection of the primes of type (2, τ) (potentially Barsotti–Tate of inertial type τ, Hodge–Tate weights (0, 1), fixed determinant). (1) If τ = ω̃^i ⊕ ω̃^j with i ≢ j mod p − 1: R(2, τ, ρ̄) = 0 unless ρ̄|I_p is (ω^{1+i} ∗; 0 ω^j), (ω^{1+j} ∗; 0 ω^i) or ω₂^k ⊕ ω₂^{pk} with k = 1 + {j − i} + (p + 1)i; it is 𝒪_E⟦Y⟧ in the two reducible cases, and 𝒪_E⟦X₁, X₂⟧/(X₁X₂ − pw) with w ∈ 𝒪_E^× in the irreducible case (E ⊇ ℚ_{p²}, √det ρ̄(Frob_p) ∈ k_E). (2) If τ = ω̃₂^m ⊕ ω̃₂^{pm} with p + 1 ∤ m: R(2, τ, ρ̄) is 𝒪_E⟦B⟧ for the reducible and irreducible shapes listed by Savitt (Theorem 6.23), and 0 otherwise. So the Breuil–Mézard conjecture holds for k = 2 and τ tame. Explicitly in Theorem 6.23 write m = i + (p+1)j, 1≤i≤p, so p+1∤m. The reducible inertial shapes are (ω^{i+j} *;0 ω^{1+j}) and (ω^{1+j} *;0 ω^{i+j}); the first extension is peu ramifié for i=2 and the second for i=p−1. The irreducible inertial shapes are ω₂^{p+m}⊕ω₂^{1+pm} and ω₂^{1+m}⊕ω₂^{p(1+m)}. These cases give 𝒪_E[[B]], and all other shapes give zero. For Theorem 6.22 the nodal case has τ=ω̃^i⊕ω̃^j, i≢j mod p−1, and ρ̄|I_p=ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i, where 0<{j−i}<p−1; assume E contains ℚ_{p²} and k_E contains a square root of det ρ̄(Frob_p)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/kw-local-conditions: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.KWCondition.ring_unique",
        "role": "characterisation",
        "statement": "With all local type, weight, determinant and chosen-character data fixed, two reduced 𝒪-flat quotient rings having the same characteristic-zero X_v-points have the same kernel in R^□_v and a unique isomorphism respecting that quotient map."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/export-weight-two-irreducible: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses/0",
    "before": "The computation is Savitt, 'On a conjecture of Conrad, Diamond, and Taylor' (Duke Math. J. 128 (2005)), Theorems 6.22(3) and 6.24, cited by KW II. It is to be planned with this roadmap's R08.4 (potentially Barsotti–Tate rings); Savitt was not read in this checkpoint.",
    "after": "Use precisely Savitt Theorem 6.22(3): τ=ω̃^i⊕ω̃^j with i≢j mod p−1, and ρ̄|I_p=ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i. Enlarge E to contain ℚ_{p²} and k_E to contain a square root of det ρ̄(Frob_p). The compatible fixed determinant is that of Savitt’s weight-two problem; rescale one variable to absorb the unit w in X₁X₂−pw."
  },
  {
    "path": "/statement",
    "before": "Let p ≠ 2, F_v = ℚ_p and ρ̄_p irreducible. After enlarging 𝒪, the fixed-determinant ring of weight-two potentially semistable lifts of the prescribed inertial type is 𝒪⟦T₁, T₂⟧/(T₁T₂ − p), and every 𝒪′-point is of the required type. The framed ring R̄^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p) is a domain, flat of relative dimension 4, with regular generic fibre, and it is not formally smooth.",
    "after": "Let p ≠ 2, F_v = ℚ_p and ρ̄_p irreducible. After enlarging 𝒪, the fixed-determinant ring of weight-two potentially semistable lifts of this nontrivial tame principal-series inertial type is 𝒪⟦T₁, T₂⟧/(T₁T₂ − p), and every 𝒪′-point is of the required type. The framed ring R̄^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p) is a domain, flat of relative dimension 4, with regular generic fibre, and it is not formally smooth."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p: acceptance</summary>

```json
[
  {
    "path": "/acceptance/2",
    "before": "The character γ_v is fixed, not deformed: without fixing it the dimension is one larger.",
    "after": "γ_v²χ_p equals the fixed determinant φ. Deforming γ_v while retaining φ does not freely add one parameter; the determinant relation still constrains it. Removing both the chosen γ_v and determinant constraint adds the unramified character parameter at p odd."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/export-endpoint-weight: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "The weight-(p+1) branch of KW II §3.2.7 is over F_v=ℚ_p. Its printed dimension formula does not extend its local classification to every unramified extension."
    ]
  },
  {
    "path": "/statement",
    "before": "Let p ≠ 2, F_v/ℚ_p unramified and k(ρ̄_v) = p + 1. The framed ring of crystalline (hence ordinary) lifts of weight p + 1 is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p]. The map to the space of characters of the stable line is not formally smooth.",
    "after": "Let p>2, F_v=ℚ_p and k(ρ̄_v)=p+1 in the KW II §3.2.7 residual Serre-weight case, with its compatible fixed determinant. The framed ring of crystalline (hence ordinary) lifts of weight p+1 is formally smooth over 𝒪 of relative dimension 4. The map to the space of characters of the stable line is not formally smooth."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/export-completed-tensor-product: prerequisites</summary>

```json
[
  {
    "path": "/prerequisites",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      10
    ],
    "added": [
      "LocalGaloisDeformationRings:R08.6/kw-local-conditions",
      "LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible",
      "LocalGaloisDeformationRings:R08.6/export-weight-two-irreducible",
      "LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p",
      "LocalGaloisDeformationRings:R08.6/export-endpoint-weight"
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/finite-height-lattices: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      5
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.HeightLattice.ext",
        "role": "extensionality",
        "statement": "Two family lattices inside the same M_B, with the inherited Frobenius and specified generic-fibre identification, are equal if their underlying 𝔖_B-submodules are equal. Their height and projectivity witnesses are properties."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L8/ordinary-coefficient-ring: api, prerequisites</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.ordinaryWeightRing.universal",
        "role": "universal-property",
        "statement": "Continuous 𝒪-algebra maps Λ_v→A correspond to ordered continuous characters of 𝒪_{F_v}^×(p) with the prescribed reductions whose induced map from the completed group algebra kills 𝔞. The correspondence commutes with maps of complete coefficient algebras."
      }
    ]
  },
  {
    "path": "/prerequisites",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors"
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/ordinary-flag-scheme: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.points",
        "role": "universal-property",
        "statement": "A coefficient point is a framed lift together with a full flag of locally direct summands, stable under G_{F_v}, with the prescribed ordered inertia characters on its graded lines. Pullback of the universal flag realizes this bijection."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.baseChange",
        "role": "functoriality",
        "statement": "Tensoring a flag of direct summands along a coefficient map gives the new point of the incidence scheme; identity and composition agree with ordinaryFlagScheme pullback."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/trivial-residual-flag-ring: proofSteps</summary>

```json
[
  {
    "path": "/proofSteps/1",
    "before": "Thorne's proof (J. Amer. Math. Soc. 28 (2015)) was not obtained; see the gap.",
    "after": "Thorne Proposition 3.14 and Lemmas 3.11–3.13 were read in the public Cambridge author manuscript. Its completed-local flag/matrix comparison and Geraghty fixed-character tangent statements remain precise missing key inputs, as recorded in the gap."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/residually-split-nearly-ordinary-ring: prerequisites</summary>

```json
[
  {
    "path": "/prerequisites",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      "tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality"
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L8/determinant-ordinary-ring: api, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.detOrdTilde.factor_iff",
        "role": "universal-property",
        "statement": "A continuous map from R̃^□_v to A factors uniquely through R̃^{det,ord}_v iff every coefficient of (6.2.7) and every ordered matrix entry of (6.2.8) vanishes in A. The ordered products are required for all tuples of group elements, and are preserved by A→A′."
      }
    ]
  },
  {
    "path": "/tests/2/statement",
    "before": "Over a field with repeated characters, (6.2.7) holds for any unipotent ρ(g) = 1 + N while (6.2.8) can fail; the product condition is independent.",
    "after": "Over A=ℤ/9 let M=diag(4,7), U=(1 1;0 1), and H the finite subgroup they generate in GL₂(A). Every element of H has characteristic polynomial (X−1)², with both prescribed characters equal to 1, but (M−I)(U−I)=(0 3;0 0)≠0. Thus (6.2.7) does not imply (6.2.8)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.FLDeformation.baseChange",
        "role": "functoriality",
        "statement": "A map of Artinian coefficient algebras carries a lift in the local FL deformation condition to another lift in that condition by the imported coefficient-compatible FL realization. This is a local wrapper; the filtered category and realization remain R07.3/R06.4."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters: api, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.graded_character",
        "role": "simp",
        "statement": "For a lift satisfying the fixed-inertia ordinary condition, the action of σ∈I_v on gr^i of its unique filtration is multiplication by χ_{v,i}(σ); this statement is compatible with the source’s one-based ordering."
      }
    ]
  },
  {
    "path": "/tests/1/statement",
    "before": "For n = 2 and r̄ = (χ̄_0 *; 0 χ̄_1) with χ̄_0/χ̄_1 ≠ 1, ω, the filtration is the unique line with character χ̄_0.",
    "after": "For n=2 write ρ̄=(χ̄₁ *;0 χ̄₀) with χ̄₁/χ̄₀ ≠ 1,ω. The decreasing filtration has Fil¹ equal to the unique line carrying the prescribed χ̄₁; its quotient carries χ̄₀."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/discrete-series-deformation-condition: acceptance, api, tests</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "Check the case d = 1, m = n = 2 against the Steinberg condition of R08.2 at the level of k[ε]/(ε²)-points.",
    "after": "For d=1,m=n=2 the discrete-series hypothesis requires the residual cyclotomic twists to be distinct. Compare its Frobenius chain α,qα with the Steinberg characteristic-polynomial relation; do not apply the functor at q≡1 mod p, where hypothesis (3) fails."
  },
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.DiscreteSeriesType.filtration_baseChange",
        "role": "functoriality",
        "statement": "The unique direct-summand filtration of a discrete-series lift pulls back along every allowed coefficient map; its graded identifications and the fixed prime-to-p inertia representation pull back with it."
      }
    ]
  },
  {
    "path": "/tests/2/statement",
    "before": "If q ≡ 1 mod l then k(1) ≅ k and condition (3) fails for i = 1.",
    "after": "If q ≡ 1 mod p then k(1) ≅ k and condition (3) fails for i = 1."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/discrete-series-smoothness: acceptance, proofSteps</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "Check the dimension identity m(n − m) + (n − m)² + (m² − 1) + (m(n − m) + 1) = n² in the Lean file.",
    "after": "Check the dimension identity d(n − d) + (n − d)² + (d² − 1) + (d(n − d) + 1) = n² in the Lean file."
  },
  {
    "path": "/proofSteps/1",
    "before": "Lemma 2.4.28: the space of r̃_v-discrete series liftings to k[ε]/(ε²) has dimension m(n − m) + (n − m)² + (m² − 1) + (m(n − m) + 1) = n², by induction on m and the local Euler characteristic.",
    "after": "Lemma 2.4.28: the space of r̃_v-discrete series liftings to k[ε]/(ε²) has dimension d(n − d) + (n − d)² + (d² − 1) + (d(n − d) + 1) = n², by induction on m and the local Euler characteristic."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/connected-kisin-modules-with-coefficients: api, statement, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.kisinGroupoid.baseChange",
        "role": "functoriality",
        "statement": "Along an admissible morphism of augmented coefficient algebras, tensor the imported Kisin module, its connectedness condition and its identification with the fixed étale φ-module. This defines pullback on the local deformation groupoid, with identity and composition laws; it does not redefine the underlying integral category."
      }
    ]
  },
  {
    "path": "/statement",
    "before": "For a ℤ_p-algebra A, (Mod/𝔖)_A is the category of finite projective 𝔖_A-modules 𝔐_A with 1 ⊗ φ : φ^*(𝔐_A) → 𝔐_A whose cokernel is killed by E(u) (so 1 ⊗ φ is injective); (Mod/𝔖)^c_A is the full subcategory where ψ_n(𝔐_A) ⊆ (p, u)φ^{n*}(𝔐_A) for n large, with ψ_n = φ^{n−1*}(ψ) ∘ ⋯ ∘ ψ (2.1.4). 𝔐_A is multiplicative if φ^*(𝔐_A) → 𝔐_A is an isomorphism and étale if its image is E(u)𝔐_A. With M_𝔽 = (𝒪_{ℰ^ur} ⊗ V_𝔽(−1))^{G_{K∞}}, D_{V_𝔽}, D_{M_𝔽} and D_{𝔖,M_𝔽} ⊇ D^c_{𝔖,M_𝔽} are the groupoids of deformations of V_𝔽, of the étale φ-module M_𝔽, and of Kisin modules (connected) with an identification of their 𝒪_ℰ-module with M_𝔽 (2.1.1–2.1.5), and 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A is a morphism D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7).",
    "after": "For an admissible augmented coefficient algebra (A,I) in Kisin’s category 𝔄𝔲𝔤_{W(𝔽)}, (Mod/𝔖)_A is the category of finite projective 𝔖_A-modules 𝔐_A with 1 ⊗ φ : φ^*(𝔐_A) → 𝔐_A whose cokernel is killed by E(u) (so 1 ⊗ φ is injective); (Mod/𝔖)^c_A is the full subcategory where ψ_n(𝔐_A) ⊆ (p, u)φ^{n*}(𝔐_A) for n large, with ψ_n = φ^{n−1*}(ψ) ∘ ⋯ ∘ ψ (2.1.4). 𝔐_A is multiplicative if φ^*(𝔐_A) → 𝔐_A is an isomorphism and étale if its image is E(u)𝔐_A. With M_𝔽 = (𝒪_{ℰ^ur} ⊗ V_𝔽(−1))^{G_{K∞}}, D_{V_𝔽}, D_{M_𝔽} and D_{𝔖,M_𝔽} ⊇ D^c_{𝔖,M_𝔽} are the groupoids of deformations of V_𝔽, of the étale φ-module M_𝔽, and of Kisin modules (connected) with an identification of their 𝒪_ℰ-module with M_𝔽 (2.1.1–2.1.5), and 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A is a morphism D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7)."
  },
  {
    "path": "/tests/2/statement",
    "before": "Rank one, φ(e) = pE(u)/E(0)·e: connected, with G_{K∞} acting on (𝔐 ⊗ 𝒪_{ℰ^ur})^{φ=1} by χ^{−1} (proof of Lemma 2.3.4).",
    "after": "The rank-one module with φ(e)=pE(u)/E(0)·e is étale because p/E(0) is a unit; it is not connected. A module with unit Frobenius is multiplicative and connected. Use the source’s fixed (1) twist in the Galois realization when comparing characters."
  },
  {
    "path": "/tests/3/statement",
    "before": "For p > 2 every object of (Mod/𝔖) corresponds to a finite flat group scheme (Kisin FM); at p = 2 only the connected ones do (1.3), so the étale part must be excluded.",
    "after": "At p=2 an étale rank-one object is nonconnected and still has a finite-flat étale model. Kisin’s connected equivalence is restricted to connected objects; it does not exclude all nonconnected finite-flat groups."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/etale-multiplicative-parts: acceptance</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "The p = 2 replacement for the automatic connectedness of the p > 2 theory.",
    "after": "For p>2 the finite-flat equivalence applies to all objects. The connected subcategory still excludes nonzero étale objects. At p=2 Kisin’s connected equivalence alone is insufficient for the full category."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/connected-model-moduli: prerequisites</summary>

```json
[
  {
    "path": "/prerequisites",
    "oldRange": [
      1,
      2
    ],
    "newRange": [
      1,
      1
    ],
    "removed": [
      "LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli"
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/flat-connected-deformation-ring: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "In the open-immersion assertion, ξ is a flat deformation V_R in D^{fl}(R), and R^c is its maximal connected quotient. The assertion is not made for an arbitrary unrestricted family."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/rank-two-connected-components: hypotheses, prerequisites</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "Dimension lowering at p=2 uses the rational determinant-twisting construction, not the p∤rank integral splitting."
    ]
  },
  {
    "path": "/prerequisites",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      "LocalGaloisDeformationRings:R08.1/determinant-twisting"
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "For the normality/domain conclusions for R^{ord}_ξ assume the source’s formally smooth flat deformation family ξ, as in Kisin (2.3.12), (2.4.4)–(2.4.6)."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.1/coefficient-rings-lambda: proofSteps</summary>

```json
[
  {
    "path": "/proofSteps/1",
    "before": "Case (3): 𝒪_{L′}⟦t⟧[1/t] is a DVR with uniformiser ϖ; its ϖ-adic completion has residue field k′((t)) = κ; uniqueness of 𝒪-Cohen rings is Bourbaki, Algèbre commutative IX §2.3, Proposition 4 (BIP Remark 3.32).",
    "after": "Case (3): The ϖ-adic completion of 𝒪_{L′}⟦t⟧[1/t] is a DVR with uniformiser ϖ and residue field k′((t)) = κ; uniqueness of 𝒪-Cohen rings is Bourbaki, Algèbre commutative IX §2.3, Proposition 4 (BIP Remark 3.32)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.1/lambda-presentation: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The possibly infinite residue field κ and its natural topology require continuous-cohomology finiteness, duality and Euler characteristic beyond finite discrete coefficients. This is requested separately; ClassFieldTheory Layer 5 alone does not supply that generality."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.1/g-valued-framed-ring: api, hypotheses, prerequisites</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.GFramedRing.hom_ext",
        "role": "extensionality",
        "statement": "Two continuous Λ-algebra maps R^□_{ρ,G}→A are equal iff the induced G(A)-valued framed lifts are equal. The pro-representing bijection is natural in A; this uses framed equality rather than conjugacy."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      2
    ],
    "newRange": [
      1,
      3
    ],
    "removed": [
      "The group GSp_{2n} over 𝒪 is the matrix group {g : gᵀJg = ν(g)J}; Mathlib has the symplectic group Sp (Matrix.symplecticGroup) but not GSp, which this node takes from the classical-groups supplier (request)."
    ],
    "added": [
      "The group GSp_{2n} over 𝒪 is the matrix group {g : gᵀJg = ν(g)J}; Mathlib has the symplectic group Sp (Matrix.symplecticGroup) but not GSp, which this node takes from ArithmeticStatistics ST.5’s integral matrix carrier and its requested group-scheme extension (request).",
      "For GSp the integral matrix carrier and multiplier come from ArithmeticStatistics ST.5/symplectic-similitude-group, not ClassicalGroups Layer 0 over ℂ. The smooth group-scheme, derived-group and integral Lie-algebra API remains a supplier extension. For compatibility with Matrix.symplecticGroup, prove equivalence of gJgᵀ=νJ and gᵀJg=νJ for invertible g."
    ]
  },
  {
    "path": "/prerequisites/4",
    "before": "tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation",
    "after": "ArithmeticStatistics:ST.5/symplectic-similitude-group"
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings: api, hypotheses, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.triangulineDefRing.forget",
        "role": "functoriality",
        "statement": "Forgetting the chosen deformation of the triangulation gives a natural transformation to the deformation functor of D, hence a continuous E-algebra map R_D→R_{D,w}. Composition with this map sends a trianguline point to its underlying module deformation."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      "D is a noncritical crystabelline object of Ding’s ΦΓ_nc(φ,h), with φ generic, h regular and all refinements noncritical. These are the standing assumptions of §3.2.2; arbitrary generic trianguline objects are not covered."
    ]
  },
  {
    "path": "/tests/2/statement",
    "before": "For D = ℛ ⊕ ℛ(x) (δ₁δ₂^{-1} = x^{-1}, not generic), Ext²(D, D) ≠ 0 and R_D is not formally smooth.",
    "after": "D=ℛ⊕ℛ(ε) lies outside the End(D)=E and genericity hypotheses. Its cyclotomic off-diagonal summand has H²≠0 by local duality; it cannot be used as an instance of the stated smoothness theorem."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/q-tame-group: api, hypotheses</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      5
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.TameGroup.lift_ext",
        "role": "extensionality",
        "statement": "Two continuous representations of T_q into GL_n(R) that agree on the chosen dense topological generators t and φ_q are equal. The unique lift of a tame pair commutes with continuous coefficient maps."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "The pair criterion is for R∈C_𝒪 with its maximal-ideal topology and continuous representations; it is not a claim for arbitrary discrete rings."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/level-raising-local-problems: acceptance, api, hypotheses, prerequisites, proofSteps, statement, tests</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "N = 2, q = p_0 (a prime ≠ p): 𝒟^mix has two components, the unramified lifts and the Steinberg-type lifts with Frobenius eigenvalue ratio q².",
    "after": "N=2 at an inert v: the polarized mixed ring has two components, with GL₂ Frobenius on G_{F_w} of residue size q² and the special pair in ratio q²."
  },
  {
    "path": "/api/0/statement",
    "before": "The local deformation problem 𝒟^mix with its decomposition R^N = M₀ ⊕ M₁.",
    "after": "The polarized local problem 𝒟^mix with its canonical rank-two block at an inert place; the GL_N restriction is r♮ on G_{F_w}."
  },
  {
    "path": "/api/5/statement",
    "before": "𝒟^unr is the minimally ramified problem of R08.2/minimally-ramified-condition for unramified r̄.",
    "after": "For the unramified polarized residual problem 𝒟^unr is the polarized unramified lifting condition; after restriction to G_{F_w} it is unramified GL_N inertia."
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      0,
      2
    ],
    "newRange": [
      0,
      1
    ],
    "removed": [
      "Monodromy direction: the inertia generator t moves the q^{−N}-eigenvector towards the q^{−N+2}-eigenvector; LTXZZ 2022 §6.4 prints r(t)v′ = xv + v′, which with φ t φ^{-1} = t^q would give x(s − q²s′) = 0 instead (source issue recorded by the reviewed extraction PAPER-LIU-ETAL-22); this node uses the direction of the companion's proof of Proposition 3.5.2.",
      "In LTXZZ the lifts are conjugate self-dual (values in 𝒢_N with similitude χ); at a place inert in F/F⁺ the local problem is written for r^♮ on G_{F_w}, which is the GL_N statement here with q replaced by q² for the Frobenius φ_w = φ_q²."
    ],
    "added": [
      "Retain the polarized group 𝒢_N=(GL_N×GL₁)⋊{1,j}, its fixed similitude and the inert quadratic local extension. The source’s μ is the sign parameter of this polarized problem. The monodromy direction is from the q^{−N} eigenline toward q^{−N+2}; with arithmetic φ_w the relation uses q²."
    ]
  },
  {
    "path": "/prerequisites",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      "GlobalGaloisDeformations:G7/polarized-deformation-problem"
    ]
  },
  {
    "path": "/proofSteps",
    "oldRange": [
      0,
      3
    ],
    "newRange": [
      0,
      1
    ],
    "removed": [
      "Decomposition: Hensel's lemma on the characteristic polynomial of r(φ) splits R^N along the factor lifting (T − q^{−N})(T − q^{−N+2}), as p ∤ (q² − 1) separates the two eigenvalues from each other and from the rest.",
      "On M₁, r(I_K) trivial makes r|M₁ unramified; on M₀ (rank 2) a lift of T_q with t ↦ 1 + (0 0; x₀ 0) and φ ↦ diag(q^{−N}(1+x)(1+y)^{-1}, q^{−N+2}(1+y)(1+x)^{-1}) satisfies the relation φtφ^{-1} = t^q iff x₀·x₁ = 0 with x₁ = x − y (companion, proof of Proposition 3.5.2).",
      "The remaining coordinates (conjugation and the unramified part) are free, giving formal smoothness over 𝒪⟦x₀, x₁⟧/(x₀x₁) of relative dimension N² − 1."
    ],
    "added": [
      "Use the source’s block decomposition with the polarization to reduce to N=2. Then pairs (B,X) satisfy BᵗXB⁻¹=−qX (LTXZZ Proposition 3.5.2, equation (3.21)). This extra polarized relation gives the nodal equation. The other block and conjugation coordinates are formally smooth of total relative dimension N²−1 over the nodal base."
    ]
  },
  {
    "path": "/statement",
    "before": "Let K/ℚ_q be finite with residue cardinality q (q ≠ p), N ≥ 2 with p ≥ N, p ∤ (q² − 1), and r̄ : G_K → GL_N(k) unramified such that the generalised eigenvalues of r̄(φ) (φ a Frobenius) contain the pair {q^{−N}, q^{−N+2}} exactly once. For a lift r to R ∈ C_𝒪 there is a canonical r(φ)-stable decomposition R^N = M₀ ⊕ M₁ with the characteristic polynomial P₀ of r(φ) on M₀ congruent to (T − q^{−N})(T − q^{−N+2}). 𝒟^mix: lifts with r(I_K) preserving M₀ and acting trivially on M₁. 𝒟^unr ⊂ 𝒟^mix: I_K also acts trivially on M₀ (the minimally ramified = unramified condition). 𝒟^ram ⊂ 𝒟^mix: P₀(T) = (T − q^{−N})(T − q^{−N+2}) in R[T]. Then 𝒟^mix is formally smooth over Spf 𝒪⟦x₀, x₁⟧/(x₀x₁) of pure relative dimension N² − 1, with 𝒟^unr = {x₀ = 0} and 𝒟^ram = {x₁ = 0}; 𝒟^ram is formally smooth of relative dimension N². Equivalently, with v, v′ eigenvectors of r(φ) (eigenvalues s, s′ lifting q^{−N}, q^{−N+2}) and x defined by r(t)v = v + xv′, one has x(s − q^{−N}) = 0, R^unr = R^mix/(x), R^ram = R^mix/(s − q^{−N}), R^unr ⊗_{R^mix} R^ram = R^mix/(s − q^{−N}, x).",
    "after": "Let F/F⁺ be a quadratic CM extension, v an inert finite place with residue cardinality q=Nv prime to p, w the place above v, N≥2, p≥N, and p∤(q²−1). Let (r̄,χ) be the polarized 𝒢_N-valued local problem of LTXZZ Definition 3.5.1, with r̄♮ on G_{F_w} unramified, χ=η_v^μ ε_p^{1−N}, and the generalized eigenvalues of r̄♮(φ_w) containing {q^{−N},q^{−N+2}} exactly once. In its canonical rank-two block M₀, define 𝒟^mix by inertia preserving M₀ and acting trivially on M₁, 𝒟^unr by trivial inertia on M₀ too, and 𝒟^ram by characteristic polynomial (T−q^{−N})(T−q^{−N+2}) on M₀. For these polarized lifts, 𝒟^mix is formally smooth over Spf 𝒪[[x₀,x₁]]/(x₀x₁) of pure relative dimension N²−1; its two components 𝒟^unr and 𝒟^ram have relative dimension N². With r♮(t)v=v+xv′, and Frobenius eigenvalues s,s′, the relation is x(s−q^{−N})=0. Here φ_w t φ_w⁻¹=t^{q²}, since #k(w)=q². This is not asserted for arbitrary GL_N lifts over a local field of residue size q."
  },
  {
    "path": "/tests/2/statement",
    "before": "With monodromy r(t)v′ = v′ + xv (the printed direction) the relation would be x(s − q²s′) = 0, which is not satisfied on the unramified component; the correct relation is x(s − q^{−N}) = 0.",
    "after": "For φ_w t φ_w⁻¹=t^{q²}, the direction r♮(t)v=v+xv′ gives x(s′−q²s)=0; the reversed direction gives x(s−q²s′)=0. These are different relations. Both vanish when x=0, so the reversed relation does not fail on the unramified component."
  },
  {
    "path": "/tests/3/statement",
    "before": "If p | q² − 1, the eigenvalues q^{−N}, q^{−N+2} coincide mod p and the decomposition R^N = M₀ ⊕ M₁ need not exist; the construction requires p ∤ q² − 1.",
    "after": "When p divides q²−1 the two residual eigenvalues coincide and separate eigenlines are not supplied by Hensel. The polarized nodal model requires p∤(q²−1)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection: acceptance</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "N = 1: R^□ = 𝒪[Δ]⟦y⟧ with Δ the p-part of k^×, a complete intersection with #Δ components.",
    "after": "N = 1: R^□ = 𝒪[Δ]⟦y⟧ with Δ the p-part of the local residue field k_K^×, a complete intersection with #Δ components."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy: api, hypotheses, proofSteps, sources, statement, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      1,
      5
    ],
    "newRange": [
      1,
      6
    ],
    "removed": [
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing",
        "role": "constructor",
        "statement": "R^□_r̄(τ), the reduced 𝒪-flat quotient with ℚ̄_p-points of type τ."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing_points",
        "role": "characterisation",
        "statement": "x ∈ Spec R^□_r̄[1/p](ℚ̄_p) lies on R^□_r̄(τ) iff WD(ρ_x)|_{I_K} ≅ τ."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing_union",
        "role": "other",
        "statement": "Spec R^□_r̄[1/p] is the disjoint union over the finitely many τ of Spec R^□_r̄(τ)[1/p]."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing_n2",
        "role": "compatibility",
        "statement": "For n = 2 and N = 0, R^□_r̄(τ) with fixed determinant is R08.2/inertial-type-quotient."
      }
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing",
        "role": "constructor",
        "statement": "R^□_r̄(τ), the reduced 𝒪-flat closure quotient of exact-type points."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing_points",
        "role": "characterisation",
        "statement": "Every exact-type point lies on R^□_r̄(τ), and such points are dense in its generic fibre. Boundary points need not have exact type τ."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing_union",
        "role": "other",
        "statement": "The generic fibre is covered by finitely many closed type-ring loci, which can intersect; this is not a disjoint union."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing_n2",
        "role": "compatibility",
        "statement": "For n=2, after imposing the same compatible determinant, this closure definition agrees with R08.2/inertial-type-quotient."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.fixedTypeRing.unique",
        "role": "universal-property",
        "statement": "The reduced flat closure quotient is uniquely characterized by the intersection of kernels of exact-type characteristic-zero points. Its ring maps agree if they agree after precomposing the quotient map from R^□_r̄."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      0,
      2
    ],
    "newRange": [
      0,
      1
    ],
    "removed": [
      "This refines R08.2/inertial-type-quotient (n = 2, types without monodromy) and agrees with it on types with N = 0.",
      "Dotto's smooth types forget N; the Steinberg type τ_{Sp_n} (r trivial on I_K, N regular nilpotent) differs from the trivial type (r trivial, N = 0) here but not there."
    ],
    "added": [
      "This is the rank-general form of R08.2/inertial-type-quotient, which already retains N. The full type is the isomorphism class of the inertial representation including its unipotent part, equivalently (r|I_K,N)."
    ]
  },
  {
    "path": "/proofSteps/0",
    "before": "The set of ℚ̄_p-points with given τ is a union of irreducible components of Spec R^□_r̄[1/p] (Shotton Theorem 2.5; BLGGT Lemma 1.3.4: the type is locally constant on the generic fibre), so the closure in Spec R^□_r̄ is a reduced 𝒪-flat quotient.",
    "after": "Use Shotton Definition 3.5 and Proposition 3.6: the reduced closure of exact-type points is a union of irreducible components. Full monodromy type need not be constant at intersections. BLGGT Lemma 1.3.4(1) keeps the semisimple inertia representation fixed, while (2) requires unique irreducible components for N as well."
  },
  {
    "path": "/sources",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      {
        "sourceId": "SHOTTON-2018",
        "locator": "Definition 3.5 and Proposition 3.6",
        "excerpt": "the Zariski closure",
        "match": "Defines the closure of exact-type points and identifies the resulting union of components."
      }
    ]
  },
  {
    "path": "/statement",
    "before": "Let K/ℚ_ℓ be finite, ℓ ≠ p. An inertial type (in Shotton's sense) is an isomorphism class of continuous representations τ : I_K → GL_n(ℚ̄_p) that extend to the Weil group W_K, together with the monodromy: equivalently, an I_K-isomorphism class of Weil–Deligne representations (r, N) restricted to inertia with N retained. For r̄ : G_K → GL_n(k) and τ, R^□_r̄(τ) is the unique reduced, 𝒪-flat quotient of R^□_r̄ whose ℚ̄_p-points are exactly the lifts ρ with WD(ρ)|_{I_K} ≅ τ (N included).",
    "after": "Let K/ℚ_ℓ be finite, ℓ ≠ p. An inertial type (in Shotton's sense) is an isomorphism class of continuous representations τ : I_K → GL_n(ℚ̄_p) that extend to the Weil group W_K, together with the monodromy: equivalently, an I_K-isomorphism class of Weil–Deligne representations (r, N) restricted to inertia with N retained. For r̄ : G_K → GL_n(k) and τ, R^□_r̄(τ) is the reduced 𝒪-flat quotient of R^□_r̄ defined by the Zariski closure of exact-type characteristic-zero points; N is retained in τ but may drop at boundary points."
  },
  {
    "path": "/tests/0/statement",
    "before": "τ_{Sp_2} (unipotent N ≠ 0) and the trivial type (N = 0) are different inertial types though both have trivial r|_{I_K}; their rings are different components.",
    "after": "The trivial type and Steinberg type Sp₂ differ by N. Their closure rings can meet at an N=0 specialization, for instance the family ρ_c(φ)=diag(q,1), ρ_c(t)=(1 c;0 1) with c=pt and q≡1 mod p."
  },
  {
    "path": "/tests/3/statement",
    "before": "If τ|_{P_K} is not the semisimplification of r̄|_{P_K}, R^□_r̄(τ) = 0.",
    "after": "If the reductions of τ|P_K and ρ̄|P_K are incompatible after coefficient extension, the exact-type locus and its closure ring are empty. Compare characteristic-zero and characteristic-p representations through reduction, not literal equality."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n: acceptance, hypotheses, proofSteps, statement</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "n = 2, ℓ ≡ 1 mod p, r̄ trivial: the inertial types occurring are the trivial type (N = 0), the Steinberg type Sp₂ (N ≠ 0), and χ ⊕ χ^{-1} on tame inertia with χ ≠ 1 of p-power order (fixed determinant); each gives components of dimension 5 = 1 + n² of the framed ring.",
    "after": "For n=2, K=ℚ_ℓ with ℓ≡1 mod p, trivial residual representation and the compatible fixed determinant, the trivial, Steinberg and nontrivial tame type closures have absolute dimension 4. The unrestricted determinant-varying framed dimension is 5."
  },
  {
    "path": "/hypotheses/0",
    "before": "(2) is BLGGT Lemma 1.3.4(2) as used by LTXZZ 2022 (proof of Lemma 6.4.2) and BCGP25 §7.5.2; it is a statement about the generic fibre only.",
    "after": "(2) is BLGGT Lemma 1.3.4(2) as used by LTXZZ 2022 (proof of Lemma 6.4.2) and BCGP25 §7.5.2; it is a statement about points of the generic fibre that each lie on a unique irreducible component."
  },
  {
    "path": "/proofSteps/1",
    "before": "(2) the restriction to inertia of the universal Weil–Deligne representation over the generic fibre is locally constant in the Zariski topology on a component (Grothendieck's monodromy theorem in families; Choi's theorem, BLGGT Lemma 1.3.4(1)).",
    "after": "BLGGT Lemma 1.3.4(1) gives constancy of semisimple inertia on a connected component. Lemma 1.3.4(2) also gives constancy of N for two points on the same irreducible component when neither lies on another component. Pure points are smooth by R08.1/smooth-points-generic-fibre, so the conductor conclusion applies to them."
  },
  {
    "path": "/proofSteps/2",
    "before": "(3) finitely many types appear (r̄|_{P_K} determines τ|_{P_K} and the tame part has bounded order); by (2) one point per component suffices.",
    "after": "There are finitely many connected components. Semisimple inertial type is constant on each by BLGGT Lemma 1.3.4(1); choose one point per connected component and an extension killing these finite inertia actions. The remaining inertia acts unipotently, irrespective of monodromy-rank drops."
  },
  {
    "path": "/statement",
    "before": "Let K/ℚ_ℓ be finite, ℓ ≠ p, r̄ : G_K → GL_n(k). (1) For each inertial type τ, R^□_r̄(τ) is reduced, 𝒪-flat and equidimensional of dimension 1 + n², and R^□_r̄/ϖ is equidimensional of dimension n². (2) If two ℚ̄_p-points of R^□_r̄ lie on the same irreducible component of Spec R^□_r̄[1/p], their Weil–Deligne representations restricted to I_K are conjugate; hence the conductor is constant on pure points of a component. (3) Spec R^□_r̄[1/p] has finitely many connected components, and there is a finite extension K′/K such that every lift of r̄ becomes unipotently ramified on G_{K′}.",
    "after": "Let K/ℚ_ℓ be finite, ℓ ≠ p, r̄ : G_K → GL_n(k). (1) For each inertial type τ, R^□_r̄(τ) is reduced, 𝒪-flat and equidimensional of dimension 1 + n², and R^□_r̄/ϖ is equidimensional of dimension n². (2) If two ℚ̄_p-points lie on the same irreducible component of Spec R^□_r̄[1/p] and neither lies on any other irreducible component, their Weil–Deligne representations restricted to I_K are conjugate; hence the conductor is constant on pure points of a component. (3) Spec R^□_r̄[1/p] has finitely many connected components, and there is a finite extension K′/K such that every lift of r̄ becomes unipotently ramified on G_{K′}."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/rank-two-unrestricted-rings-cg: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "This is the ramified, conductor-minimal-among-twists setting v|N of CG18 §4.2, with p≥3 and the determinant character prescribed there. It excludes arbitrary unramified residual representations such as 1⊕1, whose unrestricted ring has nonsmooth points 1⊕ε."
    ]
  },
  {
    "path": "/statement",
    "before": "Let p be odd, v ≠ p a prime, ρ̄ : G_v → GL₂(k) and φ a fixed determinant; R_v = R_{v,φ} is the framed fixed-determinant ring. (1) R_v is a complete intersection, and R_v[1/p] is formally smooth over K. (2) After twisting ρ̄|G_v to be minimal among its twists (and extending k), H²(G_v, ad⁰ρ̄) ≠ 0 — i.e. R_v is not formally smooth — exactly in four cases: (a) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (χ ⊕ 1) with χ ramified; (b) v ≡ −1 mod p, ρ̄|G_v absolutely irreducible and induced from ℚ_{v²}; (c) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (1 ∗; 0 1) with ∗ ramified; (d) v ≡ −1 mod p, ρ̄|G_v ≅ unr ⊗ (ω̄ ∗; 0 1) with ∗ ramified. (3) In cases (a), (b), R_v is a power series ring over 𝒪[Δ], Δ the maximal p-quotient of F_v^× resp. F_{v²}^×. (4) In cases (c), (d), R_v ≅ 𝒪⟦x₁, …, x₄⟧/(r) for one r ≠ 0; in case (c) one may take r = C(T) − T with C(t + t^{-1}) = t^v + t^{-v} and T the trace of a generator of tame inertia, and R_v[1/p] has (q + 1)/2 geometric components (q the largest power of p dividing v − 1): one where inertia acts unipotently (T = 2) and (q − 1)/2 where it acts through ζ ≠ 1, ζ^q = 1, with T = ζ + ζ^{-1}.",
    "after": "In the CG18 §4.2 setting at v|N, assume ρ̄ is ramified and its conductor is minimal among twists, p≥3, and use the compatible fixed determinant χ_φ of that section. Let p be odd, v ≠ p a prime, ρ̄ : G_v → GL₂(k) and φ a fixed determinant; R_v = R_{v,φ} is the framed fixed-determinant ring. (1) R_v is a complete intersection, and R_v[1/p] is formally smooth over K. (2) After twisting ρ̄|G_v to be minimal among its twists (and extending k), H²(G_v, ad⁰ρ̄) ≠ 0 — i.e. R_v is not formally smooth — exactly in four cases: (a) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (χ ⊕ 1) with χ ramified; (b) v ≡ −1 mod p, ρ̄|G_v absolutely irreducible and induced from ℚ_{v²}; (c) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (1 ∗; 0 1) with ∗ ramified; (d) v ≡ −1 mod p, ρ̄|G_v ≅ unr ⊗ (ω̄ ∗; 0 1) with ∗ ramified. (3) In cases (a), (b), R_v is a power series ring over 𝒪[Δ], Δ the maximal p-quotient of F_v^× resp. F_{v²}^×. (4) In cases (c), (d), R_v ≅ 𝒪⟦x₁, …, x₄⟧/(r) for one r ≠ 0; in case (c) one may take r = C(T) − T with C(t + t^{-1}) = t^v + t^{-v} and T the trace of a generator of tame inertia, and R_v[1/p] has (q + 1)/2 geometric components (q the largest power of p dividing v − 1): one where inertia acts unipotently (T = 2) and (q − 1)/2 where it acts through ζ ≠ 1, ζ^q = 1, with T = ζ + ζ^{-1}."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Retain CG18’s standing p>n and sufficiently large coefficient field for the cited tangent-space theorem."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/steinberg-ring-domain: acceptance, hypotheses, sources</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "n = 2, q_v ≡ 1 mod p, p > 2: R^St is Gee's P_m-component of R08.2/ihara-avoidance-components, a domain of dimension 5.",
    "after": "For n=2 and p>2, the unrestricted Steinberg ring has absolute dimension 5. After imposing the compatible determinant it is the Gee P_m component of the fixed-determinant ring, with absolute dimension 4."
  },
  {
    "path": "/hypotheses/0",
    "before": "The domain property is Thorne, J. Amer. Math. Soc. 28 (2015), Proposition 3.17, which is not openly available (the gap recorded for Proposition 3.14 of the same paper applies to its source text); NT26 is the source read.",
    "after": "Thorne Proposition 3.17 was read in the publicly accessible accepted author manuscript. Its proof explicitly removes Taylor’s standing p>n restriction. Retain the trivial residual representation and q_v≡1 hypotheses; the p^N>n restriction is the NT application’s specialization."
  },
  {
    "path": "/sources",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      {
        "sourceId": "THORNE-2015",
        "locator": "Proposition 3.17",
        "excerpt": "geometrically integral of dimension n2 + 1",
        "match": "The Steinberg ring and its generically reduced special fibre are accessible in the public author manuscript."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified: proofSteps</summary>

```json
[
  {
    "path": "/proofSteps/0",
    "before": "Induction on n: r̄(σ) has a unique eigenvector over k, which lifts to a unique eigenvector of r(σ) over A with nonzero reduction (Hensel, as (X − 1)^n has the single root 1); pass to the quotient A^{n−1} and k^{n−1}.",
    "after": "Write T=r(σ)−1, so Tⁿ=0 by Cayley–Hamilton and its reduction is regular nilpotent. Choose a lift v of a residual cyclic vector. The Krylov matrix [v,Tv,…,T^{n−1}v] has unit determinant by reduction, hence is a basis over the local coefficient algebra. In this basis T is a single nilpotent Jordan block. Its kernels are free direct summands of the prescribed ranks and commute with base change. This proves minimality without applying simple-root Hensel to a multiple root."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/gsp4-ramification-types: api, hypotheses</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      5
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.GSp4RamType.conjugate",
        "role": "compatibility",
        "statement": "Each ramification type is invariant under GSp₄(k)-conjugation of the residual representation. Its geometric orbit description is preserved by splitting coefficient-field extension, with the rational-orbit qualification already stated."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "State rank-to-orbit identifications over a splitting coefficient field (or after algebraic closure). Over a finite field a square-zero rank-two symplectic nilpotent can have more than one rational orbit; rank alone does not select the displayed representative."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/gsp4-taylor-wiles-lifts: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "The integral inertia matrix is diagonal in the lifted Frobenius eigenspaces because the relevant eigenvalue ratios minus q are units; q≡1 mod p does not mean q=1 in 𝒪."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/gsp4-unipotent-local-models: api, hypotheses, sources, statement, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.GSp4.exp₂_conjugate",
        "role": "functoriality",
        "statement": "For invertible g in GSp₄, exp₂(gNg⁻¹)=g exp₂(N)g⁻¹ and log₂(gUg⁻¹)=g log₂(U)g⁻¹. Both polynomial maps commute with coefficient maps in which 2 is invertible."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The nilpotent representatives describe geometric or split orbits; the source’s rank-two rational conjugacy statement needs the indicated coefficient enlargement."
    ]
  },
  {
    "path": "/sources",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      {
        "sourceId": "BCGP-2021",
        "locator": "§7.4.13, Spaces of matrices",
        "excerpt": "qN + q∗N3",
        "match": "The cubic correction is part of the definition of 𝒩(q)."
      }
    ]
  },
  {
    "path": "/statement",
    "before": "Let p ≥ 3 and q a positive integer prime to p. 𝒰 ⊂ GSp₄/𝒪 is the closed subscheme of matrices with characteristic polynomial (X − 1)⁴ and 𝒩 ⊂ Lie GSp₄ that of matrices with characteristic polynomial X⁴. The truncated maps exp₂(N) = I + N + N²/2 + N³/2 and log₂(U) = (U − I) − (U − I)²/2 are mutually inverse GSp₄-equivariant isomorphisms 𝒩 ≅ 𝒰, with exp₂(mN + m*N³) = exp₂(N)^m and log₂(U^m) = m log₂(U) + m* log₂(U)³, m* = (m − m³)/3. 𝒩_i ⊂ 𝒩 is the reduced locally closed stratum of nilpotents of rank i, with representatives N₀ = 0, N₁ = E₁₄, N₂ = E₁₃ + E₂₄, N₃ = E₁₂ + E₂₃ − E₃₄; the centraliser Z_{GSp₄}(N_i) is smooth over 𝒪 with fibres of dimensions 11, 7, 5, 3. 𝒩(q) is the scheme of pairs (Φ, N) with Φ ∈ GSp₄, N ∈ 𝒩 and ΦNΦ^{-1} = qN, and ℳ(x, y; q) (x, y ∈ 𝒪^×) the scheme of pairs (Φ, Σ) ∈ GSp₄² with char Σ = (X − x)(X − y)(X − y^{-1})(X − x^{-1}) and ΦΣΦ^{-1} = Σ^q; (Φ, Σ) ↦ (Φ, log₂ Σ) is an isomorphism ℳ(1, 1; q) ≅ 𝒩(q).",
    "after": "Let p ≥ 3 and q a positive integer prime to p. 𝒰 ⊂ GSp₄/𝒪 is the closed subscheme of matrices with characteristic polynomial (X − 1)⁴ and 𝒩 ⊂ Lie GSp₄ that of matrices with characteristic polynomial X⁴. The truncated maps exp₂(N) = I + N + N²/2 + N³/2 and log₂(U) = (U − I) − (U − I)²/2 are mutually inverse GSp₄-equivariant isomorphisms 𝒩 ≅ 𝒰, with exp₂(mN + m*N³) = exp₂(N)^m and log₂(U^m) = m log₂(U) + m* log₂(U)³, m* = (m − m³)/3. 𝒩_i ⊂ 𝒩 is the reduced locally closed stratum of nilpotents of rank i, with representatives N₀ = 0, N₁ = E₁₄, N₂ = E₁₃ + E₂₄, N₃ = E₁₂ + E₂₃ − E₃₄; the centraliser Z_{GSp₄}(N_i) is smooth over 𝒪 with fibres of dimensions 11, 7, 5, 3. 𝒩(q) is the scheme of pairs (Φ, N) with Φ ∈ GSp₄, N ∈ 𝒩 and ΦNΦ^{-1} = qN + q*N³, q*=(q−q³)/3∈ℤ, and ℳ(x, y; q) (x, y ∈ 𝒪^×) the scheme of pairs (Φ, Σ) ∈ GSp₄² with char Σ = (X − x)(X − y)(X − y^{-1})(X − x^{-1}) and ΦΣΦ^{-1} = Σ^q; (Φ, Σ) ↦ (Φ, log₂ Σ) is an isomorphism ℳ(1, 1; q) ≅ 𝒩(q)."
  },
  {
    "path": "/tests/2/statement",
    "before": "For N₃ (N₃³ ≠ 0), exp₂(N₃) ≠ exp(N₃) = I + N₃ + N₃²/2 + N₃³/6; exp₂ is not the exponential, but it is a bijection 𝒩 → 𝒰 for p ≥ 3.",
    "after": "For p≥5 and N₃ with N₃³≠0, exp₂(N₃)≠exp(N₃)=I+N₃+N₃²/2+N₃³/6. At p=3 the usual exponential formula is undefined, whereas exp₂ is still a bijection 𝒩→𝒰."
  },
  {
    "path": "/tests",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      5
    ],
    "added": [
      {
        "name": "nilpotentModel_cubic_correction",
        "kind": "non-example",
        "statement": "For q=2 one has q*=−2. In characteristic 3 the cubic coefficient is 1 and N₃³≠0, so the defining equation is ΦN₃Φ⁻¹=2N₃+N₃³, not merely 2N₃."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/gsp4-ihara-avoidance-rings: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      0,
      0
    ],
    "newRange": [
      0,
      1
    ],
    "added": [
      "v∤p and p>2, as in BCGP §7.4; this is an away-from-p local problem."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "A dimension involving Lie(G_der) requires fixing the full quotient G/G_der. An arbitrary character called a multiplier need not remove all central directions. The exact prime hypotheses and the minimally ramified G-valued construction of Booher remain to be supplied; do not infer a bijection between types and components."
    ]
  },
  {
    "path": "/statement",
    "before": "Let ℓ ≠ p, K/ℚ_ℓ finite (or a local field of characteristic ℓ), G a smooth affine group over 𝒪 with reductive G⁰, ρ̄ : G_K → G(k) and μ a fixed multiplier. (1) (Bellovin–Gee, Theorem 3.3.3) Spec R^{□,μ}_ρ̄[1/p] is equidimensional of dimension dim G^der, its components are indexed by inertial types up to G⁰-conjugacy, and it has an open dense regular subscheme; the Zariski closure of a component is a reduced 𝒪-flat quotient. (2) (Booher) For G = GSp_{2n} and multiplier κ^{1−2n}, ρ̄ has a minimally ramified lift lying on an irreducible component of R^{□,κ^{1−2n}}_ρ̄ isomorphic to 𝒪′⟦X₁, …, X_{dim G^der}⟧. (3) At a trivial prime v₀, a lift whose Weil–Deligne representation is a twist of the Steinberg parameter is a formally smooth point of R^{□,κ^{1−2n}}_{ρ̄|G_{v₀}}.",
    "after": "Let ℓ ≠ p, K/ℚ_ℓ finite (or a local field of characteristic ℓ), G a smooth affine group over 𝒪 with reductive G⁰, ρ̄ : G_K → G(k) and μ a fixed multiplier. (1) (Bellovin–Gee, Theorem 3.3.3) Spec R^{□,μ}_ρ̄[1/p] is equidimensional of dimension dim G^der, its components are covered by the closures of inertial-type loci, with possibly multiple components for one type up to G⁰-conjugacy, and it has an open dense regular subscheme; the Zariski closure of a component is a reduced 𝒪-flat quotient. (2) (Booher) For G = GSp_{2n} and multiplier κ^{1−2n}, ρ̄ has a minimally ramified lift lying on an irreducible component of R^{□,κ^{1−2n}}_ρ̄ isomorphic to 𝒪′⟦X₁, …, X_{dim G^der}⟧. (3) At a trivial prime v₀, a lift whose Weil–Deligne representation is a twist of the Steinberg parameter is a formally smooth point of R^{□,κ^{1−2n}}_{ρ̄|G_{v₀}}."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/ihara-avoidance-rings-p2: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "First choose a residual eigenbasis for the regular semisimple Frobenius matrix. Diagonalization by strict equivalence is relative to this basis; strict conjugation alone cannot change a nondiagonal residual matrix."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/g-valued-pst-rings: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "Fix the full abelianization G/G_der, with Hodge and inertial data compatible with that fixed character, and assume the quotient is nonzero."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/weil-deligne-type-ring: acceptance, api, proofSteps, statement, tests</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "At each maximal ideal x, ρ_{B,M} specialises to the unique de Rham ρ_x of type M with trace the specialised pseudo-character.",
    "after": "At each maximal ideal x, ρ_{B,M} specialises to the unique up to isomorphism de Rham ρ_x of type M with trace the specialised pseudo-character."
  },
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.WDTypeRing.integralImage",
        "role": "characterisation",
        "statement": "R^+_{B,M} is the image of R^{ps,δ_M}_B→R_{B,M}; its kernel is the inverse image of I_{B,M} under localization, and localizing R^+_{B,M} at p gives R_{B,M}. This makes integral image and generic ring distinct constructions."
      }
    ]
  },
  {
    "path": "/proofSteps/1",
    "before": "Théorème 5.11 is proved in CDN's earlier paper [19, Théorème 0.1] via the p-adic local Langlands correspondence; uniqueness of ρ_{B,M} from irreducibility of V_{M,L} (Lemme 5.12).",
    "after": "Théorème 5.11 is proved in CDN's earlier paper [19, Théorème 0.1] via the p-adic local Langlands correspondence; uniqueness up to isomorphism of ρ_{B,M} from irreducibility of V_{M,L} (Lemme 5.12)."
  },
  {
    "path": "/statement",
    "before": "Let p be such that the block theory of GL₂(ℚ_p) applies, B a block of mod p representations of GL₂(ℚ_p) with pseudo-character deformation ring R^{ps,δ}_B, and M a supercuspidal Weil–Deligne representation (a filtered (φ, N, G_{ℚ_p})-module type of weights 0 and 1) with δ_M its determinant. I_{B,M} is the intersection of the maximal ideals 𝔭 of R^{ps,δ_M}_B[1/p] at which the universal pseudo-character specialises to the trace of a de Rham representation of weights {0, 1} and type M (whole Weil–Deligne representation fixed, not only its restriction to inertia). R_{B,M} := R^{ps,δ_M}_B[1/p]/I_{B,M} is reduced and Jacobson, R^+_{B,M} is the image of R^{ps,δ_M}_B, and R_{B,M} = R^+_{B,M}[1/p]. (Théorème 5.11) R_{B,M} is the ring of bounded analytic functions on an open subset of ℙ¹, a finite product of principal ideal domains, and there is a unique representation ρ_{B,M} : G_{ℚ_p} → GL₂(R_{B,M}) with trace the universal pseudo-character.",
    "after": "Let p be such that the block theory of GL₂(ℚ_p) applies, B a block of mod p representations of GL₂(ℚ_p) with pseudo-character deformation ring R^{ps,δ}_B, and M a supercuspidal Weil–Deligne representation (a filtered (φ, N, G_{ℚ_p})-module type of weights 0 and 1) with δ_M its determinant. I_{B,M} is the intersection of the maximal ideals 𝔭 of R^{ps,δ_M}_B[1/p] at which the universal pseudo-character specialises to the trace of a de Rham representation of weights {0, 1} and type M (whole Weil–Deligne representation fixed, not only its restriction to inertia). R_{B,M} := R^{ps,δ_M}_B[1/p]/I_{B,M} is reduced and Jacobson, R^+_{B,M} is the image of R^{ps,δ_M}_B, and R_{B,M} = R^+_{B,M}[1/p]. (Théorème 5.11) R_{B,M} is the ring of bounded analytic functions on an open subset of ℙ¹, a finite product of principal ideal domains, and there is a unique up to isomorphism representation ρ_{B,M} : G_{ℚ_p} → GL₂(R_{B,M}) with trace the universal pseudo-character."
  },
  {
    "path": "/tests/1/statement",
    "before": "Fixing only the Galois type τ = M|_{I_{ℚ_p}} gives a ring of larger dimension (an unramified twist parameter); R_{B,M} fixes the Frobenius as well and so is one-dimensional (a product of PIDs).",
    "after": "Choose a supercuspidal WD representation M that is not isomorphic to its unramified quadratic twist. The two have the same inertial restriction and determinant but differ as full WD types. Forgetting Frobenius does not by itself imply an increase of one in dimension when determinant is fixed."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/bcdt-type-rings: acceptance, hypotheses, prerequisites, proofSteps, sources, statement</summary>

```json
[
  {
    "path": "/acceptance",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "For trivial inertia type, a Tate-curve representation is semistable of weights {0,1} with N≠0 but is not potentially Barsotti–Tate. It must not be a point of the BCDT type ring."
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The finite-order prime-to-ℓ determinant factor is uniquely its Teichmüller lift. For an extended type, additionally impose the full Frobenius datum; the inertial type alone does not fix it."
    ]
  },
  {
    "path": "/prerequisites",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      "LocalGaloisDeformationRings:R08.3/pcris-generic-smooth"
    ]
  },
  {
    "path": "/proofSteps/0",
    "before": "(1): both rings are reduced, p-torsion-free quotients of R_{V,𝒪} with the same ℚ̄_ℓ-points (BT over F with I_F ⊂ ker τ is potentially Barsotti–Tate of Hodge type {0, 1}, PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion), so they coincide.",
    "after": "Both quotients are reduced and ℓ-torsion-free with the same characteristic-zero points: crystalline of weights {0,1} over an extension killing τ, the specified inertial type, and determinant ε times the Teichmüller lift of ε̄⁻¹det ρ̄. The Barsotti–Tate comparison is imported from R06.4. Use the potentially crystalline quotient, not merely the potentially semistable quotient."
  },
  {
    "path": "/proofSteps/1",
    "before": "(2): the ℚ̄_ℓ-points of R^{τ,v} are exactly the lifts of type (τ, v) (R08.3/pst-deformation-ring (3)); a deformation weakly of type τ factors through R^D = R^{τ,v_BT} and so is of type τ.",
    "after": "Kisin’s potentially crystalline point criterion identifies the quotient with the intersection of all primes of type τ. Thus weakly of type τ is equivalent to type τ for a lift to coefficient integers. The absolutely irreducible extended-type form also fixes Frobenius in the associated crystalline WD representation."
  },
  {
    "path": "/sources/0/locator",
    "before": "§1.1, p. 851",
    "after": "§1.1, p. 851; author manuscript pp.7–8 (§1.1)"
  },
  {
    "path": "/sources/1/locator",
    "before": "Conjecture 1.1.1, p. 851",
    "after": "Conjecture 1.1.1, p. 851; author manuscript pp.7–8 (§1.1)"
  },
  {
    "path": "/statement",
    "before": "Let ℓ be a prime, ρ̄ : G_ℓ → GL(V) two-dimensional over k with End_{k[G_ℓ]} V = k, and R_{V,𝒪} its universal deformation ring. An ℓ-type τ is a class of two-dimensional τ : I_ℓ → GL(D) over ℚ̄_ℓ with open kernel extending to W_{ℚ_ℓ}; an extended ℓ-type τ′ a class of τ′ : W_{ℚ_ℓ} → GL(D′) with open kernel. ρ over K is of type τ (resp. τ′) if it is Barsotti–Tate over every finite F/ℚ_ℓ with τ|_{I_F} trivial, WD(ρ)|_{I_ℓ} ∈ τ (resp. WD(ρ) ∼ τ′), and ε^{-1} det ρ has finite order prime to ℓ. R^D_{V,𝒪} = R^τ_{V,𝒪} is the quotient of R_{V,𝒪} by the intersection of the primes of type τ (0 if none); 'weakly of type τ' means factoring through R^D; τ is weakly acceptable if R^D = 0 or there is a surjection 𝒪⟦X⟧ ↠ R^D. Then: (1) R^D_{V,𝒪} is the unframed fixed-type ring R^{τ,v_{BT}} of R08.3/pst-deformation-ring with v_{BT} the Hodge type of weights {0, 1} and the determinant condition. (2) BCDT Conjecture 1.1.1 (a deformation to 𝒪′ is weakly of type τ iff it is of type τ) holds, by the point characterisation of Kisin's rings.",
    "after": "Let ℓ be a prime, ρ̄ : G_ℓ → GL(V) two-dimensional over k with End_{k[G_ℓ]} V = k, and R_{V,𝒪} its universal deformation ring. An ℓ-type τ is a class of two-dimensional τ : I_ℓ → GL(D) over ℚ̄_ℓ with open kernel extending to W_{ℚ_ℓ}; an extended ℓ-type τ′ a class of τ′ : W_{ℚ_ℓ} → GL(D′) with open kernel. ρ over K is of type τ (resp. τ′) if it is Barsotti–Tate over every finite F/ℚ_ℓ with τ|_{I_F} trivial, WD(ρ)|_{I_ℓ} ∈ τ (resp. WD(ρ) ∼ τ′), and ε^{-1} det ρ has finite order prime to ℓ. R^D_{V,𝒪} = R^τ_{V,𝒪} is the quotient of R_{V,𝒪} by the intersection of the primes of type τ (0 if none); 'weakly of type τ' means factoring through R^D; τ is weakly acceptable if R^D = 0 or there is a surjection 𝒪⟦X⟧ ↠ R^D. Then: (1) R^D_{V,𝒪} is the unframed potentially crystalline quotient R^{τ,v_{BT},cris} obtained from R08.3/pst-deformation-ring and R08.3/pcris-generic-smooth with v_{BT} the Hodge type of weights {0, 1} and the determinant condition. (2) BCDT Conjecture 1.1.1 (a deformation to 𝒪′ is weakly of type τ iff it is of type τ) holds, by the point characterisation of Kisin's rings."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings: prerequisites, statement</summary>

```json
[
  {
    "path": "/prerequisites",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "LocalGaloisDeformationRings:L7/semistable-ordinary-quotient"
    ]
  },
  {
    "path": "/statement",
    "before": "Let p ∤ n, λ a dominant weight, ρ̄ : G_K → GL_n(k), and ψ : G_K → 𝒪^× a crystalline character lifting det ρ̄ with τ-labelled Hodge–Tate weight Σ_i λ_{τ,i} + (n − i). For R = R^{cris,λ}_ρ̄ (resp. R^{△,λ}_ρ̄, L7/semistable-ordinary-quotient) put R^ψ = R ⊗_{R^□_ρ̄} R^{□,ψ}_ρ̄. Then the quotient map R → R^ψ has a section extending to an isomorphism R^ψ⟦X⟧ ≅ R; in particular R^ψ is 𝒪-flat and reduced, and a map R^{□,ψ}_ρ̄ → B (B a finite E-algebra) factors through R^ψ iff the corresponding lift is crystalline of Hodge type v_λ (resp. semistable-ordinary of weight λ).",
    "after": "Let p ∤ n, λ a dominant weight, ρ̄ : G_K → GL_n(k), and ψ : G_K → 𝒪^× a crystalline character lifting det ρ̄ with τ-labelled Hodge–Tate weight Σ_i (λ_{τ,i} + n − i). For R = R^{cris,λ}_ρ̄ (resp. R^{△,λ}_ρ̄, L7/semistable-ordinary-quotient) put R^ψ = R ⊗_{R^□_ρ̄} R^{□,ψ}_ρ̄. Then the quotient map R → R^ψ has a section extending to an isomorphism R^ψ⟦X⟧ ≅ R; in particular R^ψ is 𝒪-flat and reduced, and a map R^{□,ψ}_ρ̄ → B (B a finite E-algebra) factors through R^ψ iff the corresponding lift is crystalline of Hodge type v_λ (resp. semistable-ordinary of weight λ)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.4/kw-algebraisation-lemma: proofSteps</summary>

```json
[
  {
    "path": "/proofSteps",
    "oldRange": [
      0,
      0
    ],
    "newRange": [
      0,
      1
    ],
    "added": [
      "For a nonzero power series f over the coefficient DVR, factor f=ϖ^a f₀ using the minimum valuation of its nonzero coefficients, so f₀ has nonzero residue series. Handle f=0 separately. Apply the pinned Weierstrass factorization/division to f₀; the pinned theorem does not apply to f with zero residue series."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation: acceptance</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "k_v = 𝔽_p is excluded: for F_v = ℚ_p and ρ̄ trivial the ordinary and non-ordinary loci can fail to be separate components.",
    "after": "The source excludes the stated scalar/residue-field case; no failure or counterexample is asserted outside its hypotheses."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/weight-p-crystalline-ordinarity: hypotheses, kind</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "The crystalline-to-ordinary criterion is imported from the requested full KW II Lemma 3.5 at PadicHodgeTheory R06.4; the current supplier’s endpoint branch does not yet state that complete criterion. This node is a deformation-ring comparison, not a second owner of the Galois criterion."
    ]
  },
  {
    "path": "/kind",
    "before": "theorem",
    "after": "comparison"
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "F_v=ℚ_p in every clause, as in KW II §3.2.7; the weight-(p+1) statement is not for an arbitrary finite extension."
    ]
  },
  {
    "path": "/statement",
    "before": "Let p ≠ 2, ρ̄ : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified, k(ρ̄) = p + 1 (so ρ̄|I_v ≅ (χ̄_p ∗; 0 1) très ramifié) and φ a fixed determinant. (1) For F_v = ℚ_p, every crystalline lift of weight p + 1 is ordinary (Berger–Li–Zhu), i.e. an extension of an unramified free rank-one representation by a free rank-one representation on which I_v acts by χ_p^p. (2) The framed fixed-determinant ring R^{□,ψ}_v of ordinary lifts of weight p + 1 (extensions of unramified η₂ by χ_p^pη₁) is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p]. (3) The map Spf R^{□,ψ}_v → X to the space of characters giving the action on the stable line is not formally smooth.",
    "after": "Let p ≠ 2, ρ̄ : G_{F_v} → GL₂(k) with F_v = ℚ_p, k(ρ̄) = p + 1 (so ρ̄|I_v ≅ (χ̄_p ∗; 0 1) très ramifié) and φ a fixed determinant. (1) For F_v = ℚ_p, every crystalline lift of weight p + 1 is ordinary (Berger–Li–Zhu), i.e. an extension of an unramified free rank-one representation by a free rank-one representation on which I_v acts by χ_p^p. (2) The framed fixed-determinant ring R^{□,ψ}_v of ordinary lifts of weight p + 1 (extensions of unramified η₂ by χ_p^pη₁) is formally smooth over 𝒪 of relative dimension 4. (3) The map Spf R^{□,ψ}_v → X to the space of characters giving the action on the stable line is not formally smooth."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Uniqueness is for a stable line with the prescribed graded character, not for all invariant lines. A split sum of distinct characters has two invariant lines."
    ]
  },
  {
    "path": "/statement",
    "before": "Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified and γ̄_v unramified, φ a fixed determinant, and γ_v a fixed unramified lift of γ̄_v with γ_v²χ_p = φ. Consider lifts (γ_vχ_p ∗; 0 γ_v). For finite A, |Z¹(D_v, A(χ_p))| = |A|^{2+[F_v:ℚ_p]}, and the moduli of such lifts with a stable line is a smooth resolution ℛ → Spf R^{□,ψ}_v: (1) unless p = 2 and D_v acts on ρ̄_v by homotheties, ℛ → Spf R^{□,ψ}_v is an isomorphism and ℛ is a torsor over the completion of ℙ¹_k at the unique stable line of ρ̄_v under the completion of a free module of rank 2 + [F_v:ℚ_p] along the zero section; (2) if p = 2 and D_v acts by homotheties, ℛ is a torsor over the completion of ℙ¹_𝒪 along its special fibre under the completion of a free module of rank 2 + [F_v:ℚ_p].",
    "after": "Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified and γ̄_v unramified, φ a fixed determinant, and γ_v a fixed unramified lift of γ̄_v with γ_v²χ_p = φ. Consider lifts (γ_vχ_p ∗; 0 γ_v). For finite A, |Z¹(D_v, A(χ_p))| = |A|^{2+[F_v:ℚ_p]}, and the moduli of such lifts with a stable line is a smooth resolution ℛ → Spf R^{□,ψ}_v: (1) unless p = 2 and D_v acts on ρ̄_v by homotheties, ℛ → Spf R^{□,ψ}_v is an isomorphism and ℛ is a torsor over the completion of ℙ¹_𝒪 at the residual line with its prescribed character of ρ̄_v under the completion of a free module of rank 2 + [F_v:ℚ_p] along the zero section; (2) if p = 2 and D_v acts by homotheties, ℛ is a torsor over the completion of ℙ¹_𝒪 along its special fibre under the completion of a free module of rank 2 + [F_v:ℚ_p]."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/kw1-lift-types: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "The order-p tame characters take values in enlarged coefficient integers 𝒪′ containing μ_p; they do not in general take values in ℤ_p^×."
    ]
  },
  {
    "path": "/statement",
    "before": "KW I Theorem 5.1 lifts ρ̄ (S-type, 2 ≤ k(ρ̄) ≤ p + 1 for p > 2) to an almost strictly compatible system whose p-adic member has one of the following local types; each is exported with its ring, dimension, nonemptiness and tangent condition: (1) minimally ramified at primes ≠ p (R08.2/minimally-ramified-ring, R08.5/dyadic-minimal-lifts; R08.6/export-away-from-p) and crystalline of weight k(ρ̄) at p (R08.6/export-fontaine-laffaille-irreducible, R08.6/export-ordinary, R08.6/export-endpoint-weight); (2) weight 2, minimally ramified at primes ≠ p, with inertial Weil–Deligne parameter (ω_p^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (p > 2) or k(ρ̄) = 4 (p = 2) (R08.6/export-weight-two-irreducible, R08.6/export-ordinary, R08.6/export-semistable-weight-two-at-p, R08.6/dyadic-weight-two-transition); (3) at q ∥ N(ρ̄) with p | q − 1 and ρ̄|I_q = (χ ∗; 0 1): ρ_p|I_q = (χ′ ∗; 0 1) for a chosen non-trivial ℤ_p-valued lift χ′ of χ factoring through (ℤ/q)^× (i even if p = 2): the abelian condition with fixed inertial character (R08.6/export-away-from-p); (4) at q ≠ p with p | q + 1 and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist: the good-dihedral condition (R08.6/good-dihedral-type).",
    "after": "KW I Theorem 5.1 lifts ρ̄ (S-type, 2 ≤ k(ρ̄) ≤ p + 1 for p > 2) to an almost strictly compatible system whose p-adic member has one of the following local types; each is exported with its ring, dimension, nonemptiness and tangent condition: (1) minimally ramified at primes ≠ p (R08.2/minimally-ramified-ring, R08.5/dyadic-minimal-lifts; R08.6/export-away-from-p) and crystalline of weight k(ρ̄) at p (R08.6/export-fontaine-laffaille-irreducible, R08.6/export-ordinary, R08.6/export-endpoint-weight); (2) weight 2, minimally ramified at primes ≠ p, with inertial Weil–Deligne parameter (ω_p^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (p > 2) or k(ρ̄) = 4 (p = 2) (R08.6/export-weight-two-irreducible, R08.6/export-ordinary, R08.6/export-semistable-weight-two-at-p, R08.6/dyadic-weight-two-transition); (3) at q ∥ N(ρ̄) with p | q − 1 and ρ̄|I_q = (χ ∗; 0 1): ρ_p|I_q = (χ′ ∗; 0 1) for a chosen non-trivial 𝒪′-valued lift χ′ of χ factoring through (ℤ/q)^× (i even if p = 2): the abelian condition with fixed inertial character (R08.6/export-away-from-p); (4) at q ≠ p with p | q + 1 and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist: the good-dihedral condition (R08.6/good-dihedral-type)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/good-dihedral-type: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The order-p tame characters take values in enlarged coefficient integers 𝒪′ containing μ_p; they do not in general take values in ℤ_p^×."
    ]
  },
  {
    "path": "/statement",
    "before": "Let q ≠ p be a prime with p | q + 1, and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist. Let {χ′, χ′^q} be a pair of ℤ_p-valued characters of I_q of level 2 (factoring through 𝔽_{q²}^× but not 𝔽_q^×) of p-power order, χ′ = ω_{q,2}^i ω_{q,2}^{qj} with 0 ≤ j < i ≤ q − 1, and i + j even when p = 2. The lifts with ρ|I_q ≅ χ′ ⊕ χ′^q (induced from a character of G_{ℚ_{q²}}) and fixed determinant form the non-abelian level-two inertia-rigid problem: its ring is flat of relative dimension 3 over 𝒪 with regular generic fibre, and it is non-empty after enlarging 𝒪. Such χ′ exist unless p = 2 and v₂(q + 1) = 1; for p odd they are the non-trivial powers of ω_{q,2}^{(q²−1)/p^r} (r = v_p(q + 1)), and (i, j) = (q − 1 − j, m(q + 1)/p^r − 1) with 0 < m < p^r/2, so i = j + 1 does not occur.",
    "after": "Let q ≠ p be a prime with p | q + 1, and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist. Let {χ′, χ′^q} be a pair of 𝒪′-valued characters of I_q of level 2 (factoring through 𝔽_{q²}^× but not 𝔽_q^×) of p-power order, χ′ = ω_{q,2}^i ω_{q,2}^{qj} with 0 ≤ j < i ≤ q − 1, and i + j even when p = 2. The lifts with ρ|I_q ≅ χ′ ⊕ χ′^q (induced from a character of G_{ℚ_{q²}}) and fixed determinant form the non-abelian level-two inertia-rigid problem: its ring is flat of relative dimension 3 over 𝒪 with regular generic fibre, and it is non-empty after enlarging 𝒪. Such χ′ exist unless p = 2 and v₂(q + 1) = 1; for p odd they are the non-trivial powers of ω_{q,2}^{(q²−1)/p^r} (r = v_p(q + 1)), and (i, j) = (q − 1 − j, m(q + 1)/p^r − 1) with 0 < m < p^r/2, so i = j + 1 does not occur."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/ordinary-pcris-lifts-reducible: acceptance</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "r = 2, χ̄|G_{F_v} = κ̄, ∗ peu ramifié: the lift is (κ ∗; 0 1) with ∗ a Kummer class, the Tate module of an ordinary p-divisible group.",
    "after": "r = 2, χ̄|G_{F_v} = κ̄, ∗ peu ramifié: the lift is (κ ∗; 0 1) with ∗ a Kummer class, the Tate module of an ordinary p-divisible group. Use a Kummer unit class for the Barsotti–Tate example; the uniformizer class gives semistable noncrystalline monodromy."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/newton-thorne-local-quotients: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Use Newton–Thorne’s §4 standing local situation after the soluble base change: the residual representation is trivial at every v∈S, and the determinant is ε⁻¹. The five quotients are not a theorem for arbitrary residual r. The noncrystalline p-adic case requires p>2."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.6/category-deformation-conditions: api, sources, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.CategoryCondition.mono",
        "role": "functoriality",
        "statement": "For S⊂T satisfying the category-condition hypotheses and the same residual object and determinant, D^S⊂D^T induces a canonical surjection R^T↠R^S commuting with the universal lifts."
      }
    ]
  },
  {
    "path": "/sources/0/locator",
    "before": "§4.3, p. 874",
    "after": "§4.3, p. 874; author manuscript pp.27–28 (§4.3)"
  },
  {
    "path": "/tests/2/statement",
    "before": "The subcategory of modules with a filtration by V whose extension classes are all split is not closed under quotients of nontrivial extensions in general, so it does not define a deformation condition.",
    "after": "The full subcategory consisting of 0 and a single copy of the residual object V is not closed under finite products: V⊕V is missing. It therefore fails the category-condition hypotheses. A category of semisimple sums is not a counterexample to subobject/quotient closure."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda: api, hypotheses, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.baseChange",
        "role": "functoriality",
        "statement": "A coefficient map between the allowed finite E-algebras carries the stable full flag of direct summands and its ordered inertia characters to an ordinary flag of the same weight. Exact semistable-ordinary characters are preserved as well."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "This node uses CN’s convention HT(ε_p)=−1 and geometric Artin. To compare with PadicHodgeTheory R06.4 and KW’s HT(χ_p)=+1, dualize the representation and reverse the flag; do not identify upper triangular matrices without this conversion."
    ]
  },
  {
    "path": "/tests/0/statement",
    "before": "n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω of order p) is ordinary but not semistable-ordinary.",
    "after": "n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω ramified of order p) is ordinary but not semistable-ordinary."
  },
  {
    "path": "/tests/1/statement",
    "before": "λ = 0, n = 2: ordinary of weight 0 means a stable line with characters ψ₁·(finite) and ψ₂·χ_p^{−1}·(finite), Hodge–Tate weights {0, 1} with HT(χ_p) = −1.",
    "after": "For n=2 and λ=(0,0), the ordered inertia characters are 1 and ε_p⁻¹. Weight zero is not the condition that both diagonal characters are unramified."
  },
  {
    "path": "/tests/2/statement",
    "before": "Over B = E[ε]/ε², a lift ρ_B of an ordinary ρ whose characteristic polynomials agree with those of an ordinary representation of weight λ need not preserve any full flag over B when two graded characters of ρ coincide; equality of characteristic polynomials does not imply ordinary (L8/distinct-characters-flag).",
    "after": "For n=2, λ=(0,0), a nonsplit extension with subcharacter ε_p⁻¹ and quotient 1 has the same characteristic polynomials as 1⊕ε_p⁻¹ but lacks a stable subline carrying 1. It fails CN’s prescribed ordering despite the determinant equations."
  },
  {
    "path": "/tests/3/statement",
    "before": "For n = 2, K/ℚ_p unramified and λ = (k − 2, 0), ordinary of weight λ with semistable normalisation is KW II Definition 3.4(2) (a stable rank-one W with inertia on W by χ_p^{k−1} up to finite order, trivial on V/W).",
    "after": "For n=2, λ=(k−2,0), CN’s ordered inertia characters are 1 and ε_p^{−(k−1)}. Dualizing and reversing the flag gives KW’s higher-weight subline χ_p^{k−1} and weight-zero quotient. This is a duality comparison, not equality of the original ordered representations."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/semistable-ordinary-quotient: proofSteps</summary>

```json
[
  {
    "path": "/proofSteps/1",
    "before": "(2): the slopes of ρ̄ are strictly increasing, v_i = (1/e)Σ_τ(λ_{τ,n+1−i} + i − 1); the generalised φ^f-eigenspace filtration of D_st(ρ_B) is weakly admissible with rank-one graded pieces, giving the flag over B.",
    "after": "(2): the Hodge–Tate weights of the characteristic-zero lift ρ are strictly increasing, v_i = (1/e)Σ_τ(λ_{τ,n+1−i} + i − 1); the generalised φ^f-eigenspace filtration of D_st(ρ_B) is weakly admissible with rank-one graded pieces, giving the flag over B."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/g-valued-ordinary-condition: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The canonical-torus/Borel quotient is imported from the reductive-group owner; the missing exact supplier and weight-convention comparison are recorded as gaps, rather than defining a second general reductive-group API here."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient: api, hypotheses, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.points",
        "role": "universal-property",
        "statement": "Over a finite E-algebra in the specified semistable-over-F′_v Hodge family, a point is a framed lift and a Borel reduction satisfying the root and canonical-torus equations. Base change pulls back the Borel reduction and these equations; the torus equations are retained also when G has no roots."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "λ is dominant regular, F′_v/F_v is fixed, and the ambient p-adic Hodge quotient is the one semistable over that fixed extension with compatible Hodge data. The unique-flag proof uses regularity."
    ]
  },
  {
    "path": "/tests/1/statement",
    "before": "Without the generators ψ(t) − ψ(χ_λ(σ)) the scheme 𝒢_λ for G = GL₁ would be all of Spec R^{□,v_λ}, which contains non-ordinary points.",
    "after": "In the ambient unrestricted framed GL₁ ring there are no root generators. The torus equations ρ(σ)=χ_λ(σ) on I_{F′_v} must be imposed explicitly. Whether they are redundant after a particular fixed Hodge/semistable quotient is a separate assertion."
  },
  {
    "path": "/tests/2/statement",
    "before": "G = GL₂, F_v = ℚ_p, λ = (1, 0): E-points of R^{△λ} are the crystalline-over-F′_v lifts (ψ₁χ_p ∗; 0 ψ₂) with ψ_i potentially unramified.",
    "after": "For G=GL₂, F_v=ℚ_p and λ=(1,0), the stated ordinary point has the form (ψ₁χ_p *;0 ψ₂) in the FKP convention and is semistable over F′_v. A nonzero Tate-curve extension can have N≠0 and need not be crystalline."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual: acceptance, hypotheses</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "F_v = ℚ_p: dimension 5 = [F_v:ℚ_p] + 4.",
    "after": "F_v = ℚ_p(ζ_p): dimension p+3 = [F_v:ℚ_p] + 4."
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "µ_p⊂F_v (equivalently ε̄_p|G_{F_v}=1) is required. For odd p this excludes F_v=ℚ_p."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue: acceptance, api, hypotheses, tests</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "R̃† is finite over R† of generic rank 2 (the two choices of α) away from the locus α = α^{-1}.",
    "after": "R̃† is finite over R† and is an isomorphism after inverting p. Its rank-two unramified eigenvalue algebra is supported on the ϖ-power-torsion unramified quotient; it does not give generic degree two."
  },
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.hom_ext",
        "role": "extensionality",
        "statement": "Two continuous maps R̃†→A are equal iff they induce the same framed lift ρ and the same eigenvalue α. Equality of ρ alone characterizes maps from the image ring R†, not maps from R̃†."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "With trivial residual representation and determinant χ^{n−1}, require n≡1 mod p−1. The eigenvalue α is a unit reducing to 1. Choose φ_p with χ(φ_p)=1."
    ]
  },
  {
    "path": "/tests/0/statement",
    "before": "R^unr ≅ 𝒪/ϖ^m⟦φ₁, …, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃) and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr, with ϖ^m the largest power dividing all χ^{n−1}(g) − 1, g ∈ D_p.",
    "after": "R^unr ≅ 𝒪/ϖ^m⟦φ₁, …, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃) and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr, with ϖ^m the largest power dividing all χ^{n−1}(g) − 1, g ∈ D_p. The direct sum is an isomorphism of R^unr-modules, not a product of rings."
  },
  {
    "path": "/tests/1/statement",
    "before": "R̃† ⊗_{R†} Frac(R†) has degree 2 over Frac(R†) (two eigenvalues).",
    "after": "The unramified quotient has a rank-two eigenvalue algebra as a module, while its support is killed by a power of ϖ. After inverting p, I=J becomes the unit ideal and R̃†[1/p]=R†[1/p]; the ordinary eigenvalue map is generically degree one."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-condition: api, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.SiegelOrdinary.baseChange",
        "role": "functoriality",
        "statement": "Along a coefficient map, the Galois-stable unramified Lagrangian direct summand pulls back to the corresponding plane; isotropy, its rank and the fixed multiplier are preserved. Under the stated uniqueness hypothesis this is the plane assigned to the pulled-back lift."
      }
    ]
  },
  {
    "path": "/tests/1/statement",
    "before": "A lift conjugate to an upper-triangular form with non-zero (1, 2)-entry is Borel-ordinary but not Siegel-ordinary.",
    "after": "A ramified nonsplit extension of the two prescribed unramified characters on the Lagrangian quotient plane is not Siegel ordinary: the quotient-plane inertia action is nontrivial. A nonzero upper matrix entry alone is insufficient, since an unramified extension may be split by conjugation."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/gsp4-borel-ordinary-conditions: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      5
    ],
    "newRange": [
      4,
      6
    ],
    "removed": [
      {
        "name": "TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary.semistable",
        "role": "compatibility",
        "statement": "Every characteristic-zero point of R^{B,𝔠̄}_v is semistable (L7/g-valued-ordinary-quotient (4))."
      }
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary.semistable",
        "role": "compatibility",
        "statement": "At the specified weight-two arithmetic specialization, the source’s ordinary finite-flat flag criterion gives a semistable lift. Arbitrary variable-weight points are not asserted semistable."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.BorelOrdinary.toParabolic",
        "role": "functoriality",
        "statement": "Forgetting the appropriate steps of the ordinary full flag and restricting its weight characters to Λ_{v,1} gives a parabolic-ordinary point. The induced map of representing rings follows the opposite direction and commutes with universal representations."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/gl2-borel-ordinary-ring: proofSteps</summary>

```json
[
  {
    "path": "/proofSteps/2",
    "before": "(3): write the B₂-valued lift as a character χ = Teichmüller(λ_ᾱ)·(universal character over R^{GL₁}) and a cocycle valued in ε^{-1}χ^{-2}; variables x_i (framing), y_i (character) and z_i (cocycle) (Remark 7.3.8).",
    "after": "(3): write the B₂-valued lift as a character χ = Teichmüller(λ_ᾱ)·(universal character over R^{GL₁}) and a cocycle valued in εχ²; variables x_i (framing), y_i (character) and z_i (cocycle) (Remark 7.3.8)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/gsp4-ordinary-flag-incidence: api</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      6,
      6
    ],
    "newRange": [
      6,
      7
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme.points",
        "role": "universal-property",
        "statement": "A coefficient point consists of a fixed-similitude framed lift, an isotropic stable full flag and the ordered universal weight characters of its graded lines. This description and the incidence equations commute with coefficient base change."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/gsp4-ordinary-weight-two-components: prerequisites</summary>

```json
[
  {
    "path": "/prerequisites",
    "oldRange": [
      3,
      3
    ],
    "newRange": [
      3,
      4
    ],
    "added": [
      "LocalGaloisDeformationRings:L7/weight-zero-crystalline-connectedness"
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/connects-relation: hypotheses</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "Representations are defined over the integers of finite extensions of the coefficient field. Component relations are not asserted for an arbitrary infinite-coefficient representation without descent."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/local-model-rho-nm0: api, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.rhoNM0.rank_one",
        "role": "simp",
        "statement": "For n=1 the sole summand has exponents zero, so ρ_{1,m,0} is the trivial character for every allowed m."
      }
    ]
  },
  {
    "path": "/tests/3/statement",
    "before": "For p ≤ nm the weights exceed the Fontaine–Laffaille range and formal smoothness of the lifting ring, hence (2), is not available.",
    "after": "The bound p>nm supplies the uniform FL range for the tensor weights. If p≤nm that hypothesis is unavailable; this does not imply that every individual weight multiset is outside the FL interval."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/kisin-modules-tame-descent: hypotheses, tests</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The genericity assumption belongs to the shape uniqueness/domain theorems, not to the existence of every Kisin module. A failure of genericity does not imply a zero deformation ring."
    ]
  },
  {
    "path": "/tests/3/name",
    "before": "kisinDescent_nongeneric",
    "after": "kisinDescent_nongeneric_not_empty"
  },
  {
    "path": "/tests/3/statement",
    "before": "For τ not 1-generic the potentially crystalline ring is zero (Theorem 3.5.3), so no shape is attached.",
    "after": "Without 1-generic τ, Theorem 3.5.3 does not apply; it does not imply that the ring is zero. The trivial residual representation has a trivial-type, weight-zero crystalline lift, a concrete nonzero nongeneric case."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/semisimple-kisin-modules-and-shapes: statement</summary>

```json
[
  {
    "path": "/statement",
    "before": "Keep L7/kisin-modules-tame-descent (GL₃, K/ℚ_p unramified). (1) A semisimple Kisin module of shape w̃ (Definition 3.3.4) gives a semisimple G_{K_∞}-representation, with the explicit normal form of Proposition 3.3.6 and étale φ-module 𝓜(w̃) (Definition 3.3.7); T*_dd of it and its inertial type are given by Proposition 3.3.8. (2) Semisimple Kisin modules of a fixed shape and inertial restriction are classified (Proposition 3.3.9). (3) If ρ̄ has a potentially crystalline lift of type (η, τ), then so does ρ̄^ss (Lemma 3.3.10). (4) (Theorem 3.3.11) If ρ̄ has a potentially crystalline lift of type (η, τ) with τ suitably generic, its Kisin module has shape in Adm^∨(η). (5) (Theorem 3.3.12) Sums of characters admit semisimple Kisin modules, and the Kisin module of type (η, τ) of a semisimple ρ̄ is semisimple.",
    "after": "Keep L7/kisin-modules-tame-descent (GL₃, K/ℚ_p unramified). (1) A semisimple Kisin module of shape w̃ (Definition 3.3.4) gives a semisimple G_{K_∞}-representation, with the explicit normal form of Proposition 3.3.6 and étale φ-module 𝓜(w̃) (Definition 3.3.7); T*_dd of it and its inertial type are given by Proposition 3.3.8. (2) Semisimple Kisin modules of a fixed shape and inertial restriction are classified (Proposition 3.3.9). (3) If ρ̄ has a potentially crystalline lift of type (η, τ), then so does ρ̄^ss (Lemma 3.3.10). (4) (Theorem 3.3.11) If ρ̄ has a potentially crystalline lift of type (η, τ) with either τ a regular principal-series type and general effective λ, or λ=η and τ 3-generic, as in Theorem 3.3.11, its Kisin module has shape in Adm^∨(η). (5) (Theorem 3.3.12) Sums of characters admit semisimple Kisin modules, and the Kisin module of type (η, τ) of a semisimple ρ̄ is semisimple."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/gl3-pcris-deformation-rings: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "For the nonemptiness assertion of Lemma 3.5.4, use its residual Deligne–Lusztig presentation V(ρ̄|I_K)=R_{sw*}(µ+η), τ 5-generic and each specified shape in Adm^∨(η) of length>1; generic τ alone does not assert existence."
    ]
  },
  {
    "path": "/statement",
    "before": "Let K/ℚ_p be unramified of degree f, ρ̄ : G_K → GL₃(F) continuous, 10-generic and semisimple, τ a tame inertial type, and R^τ_ρ̄ the framed potentially crystalline deformation ring of type (η, τ) with η = (2, 1, 0) (R08.3/pst-deformation-ring). If τ is not 1-generic, R^τ_ρ̄ = 0. If τ is 1-generic: R^τ_ρ̄ is a normal Cohen–Macaulay domain; R̄^τ_ρ̄ := R^τ_ρ̄/ϖ is reduced, its irreducible components are formally smooth of the same dimension, and their number equals #W^?(ρ̄, τ) (the predicted Serre weights in the Jordan–Hölder factors of σ(τ)). For shapes w̃_j of length > 1 at every j (τ 5-generic), the same holds with R^τ_ρ̄ ≠ 0 (Lemma 3.5.4).",
    "after": "Let K/ℚ_p be unramified of degree f, ρ̄ : G_K → GL₃(F) continuous, 10-generic and semisimple, τ a tame inertial type, and R^τ_ρ̄ the framed potentially crystalline deformation ring of type (η, τ) with η = (2, 1, 0) (R08.3/pst-deformation-ring). If τ is not 1-generic, R^τ_ρ̄ = 0. If τ is 1-generic and R^τ_ρ̄≠0: R^τ_ρ̄ is a normal Cohen–Macaulay domain; R̄^τ_ρ̄ := R^τ_ρ̄/ϖ is reduced, its irreducible components are formally smooth of the same dimension, and their number equals #W^?(ρ̄, τ) (the predicted Serre weights in the Jordan–Hölder factors of σ(τ)). For shapes w̃_j of length > 1 at every j (τ 5-generic), the same holds with R^τ_ρ̄ ≠ 0 (Lemma 3.5.4)."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/gl3-explicit-rings: acceptance</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "Shape id: R̄^{expl,∇} is the ring of LLHLM18 Corollary 8.4, with three components meeting along 𝔴_{ε1}, 𝔴_{ε2}, 𝔴₀.",
    "after": "Identity shape: the explicit special-fibre ring has six minimal primes (Table 3, row id). The three named intersection ideals refer to unions/intersections of these components, not three components of this ring. Row presentations and the exact formal comparison remain to be supplied."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/partition-monodromy-rings: api, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      5
    ],
    "newRange": [
      4,
      6
    ],
    "removed": [
      {
        "name": "TauCeti.GaloisDeformation.Local.partitionRing_mono",
        "role": "other",
        "statement": "m ≤ m′ in the dominance order gives a surjection R^m_v ↠ R^{m′}_v (larger partitions impose more chains)."
      }
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.partitionRing_mono",
        "role": "other",
        "statement": "If m is obtained by splitting the parts of m′ into shorter consecutive q-chains, Pol_n(m′,q)⊂Pol_n(m,q), giving R^m_v↠R^{m′}_v. Dominance of partitions alone does not imply this inclusion."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.partitionRing.coefficientMap",
        "role": "functoriality",
        "statement": "Composing a framed lift with a coefficient map preserves unipotent inertia and the defining Frobenius q-chain equations. A point of the reduced flat quotient R^m_v therefore pulls back as a point of that same quotient; no bound on the rank of N is inferred."
      }
    ]
  },
  {
    "path": "/tests",
    "oldRange": [
      4,
      4
    ],
    "newRange": [
      4,
      5
    ],
    "added": [
      {
        "name": "partitionRing_dominance_insufficient",
        "kind": "non-example",
        "statement": "The roots {1,q,q²,b} for generic b form chains of lengths (3,1), but cannot be grouped into two chains of length 2. Thus dominance (3,1)≥(2,2) does not give the proposed quotient map."
      }
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/away-from-p-rank-n-interface: hypotheses, statement</summary>

```json
[
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "Full inertial type including N is constant for two points on a common irreducible component only when each is on a unique irreducible component (R08.2/fixed-type-rings-rank-n)."
    ]
  },
  {
    "path": "/statement",
    "before": "L7's rank-n semistable, Steinberg and minimally ramified conditions away from p are those of R08.2, cited and not rebuilt (RS-08 link R08.2 → L7): (1) minimally ramified lifts in rank n (R08.2/minimally-ramified-condition, R08.2/minimally-ramified-ring), which equal the unipotent lifts when r̄(σ) is a single Jordan block (R08.2/regular-unipotent-minimally-ramified); (2) Steinberg lifts with monodromy (R08.2/steinberg-condition, R08.2/steinberg-ring-domain) and their generalisations with monodromy bounded by a partition (L7/partition-monodromy-rings); (3) fixed inertial types with monodromy (R08.2/inertial-type-with-monodromy) with constancy on components (R08.2/fixed-type-rings-rank-n); (4) Ihara-avoidance rings (R08.2/ihara-avoidance-components, R08.2/ihara-avoidance-rings-p2); (5) discrete series lifts (L7/discrete-series-deformation-condition). These, together with the ordinary and Fontaine–Laffaille conditions of L7, are exported to GlobalGaloisDeformations G7 and, for the comparisons of patched complexes under change of local condition, to PotentialAutomorphyInfrastructure PA.3.",
    "after": "L7's rank-n semistable, Steinberg and minimally ramified conditions away from p are those of R08.2, cited and not rebuilt (RS-08 link R08.2 → L7): (1) minimally ramified lifts in rank n (R08.2/minimally-ramified-condition, R08.2/minimally-ramified-ring), which equal the unipotent lifts when r̄(σ) is a single Jordan block (R08.2/regular-unipotent-minimally-ramified); (2) Steinberg lifts with monodromy (R08.2/steinberg-condition, R08.2/steinberg-ring-domain) and their generalisations with Frobenius characteristic polynomial constrained by q-chains of a partition (L7/partition-monodromy-rings); (3) fixed inertial types with monodromy (R08.2/inertial-type-with-monodromy) with constancy on components (R08.2/fixed-type-rings-rank-n); (4) Ihara-avoidance rings (R08.2/ihara-avoidance-components, R08.2/ihara-avoidance-rings-p2); (5) discrete series lifts (L7/discrete-series-deformation-condition). These, together with the ordinary and Fontaine–Laffaille conditions of L7, are exported to GlobalGaloisDeformations G7 and, for the comparisons of patched complexes under change of local condition, to PotentialAutomorphyInfrastructure PA.3."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L8/doubling-equals-unramified: statement</summary>

```json
[
  {
    "path": "/statement",
    "before": "Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R^unr ≅ 𝒪/ϖ^m⟦φ₁, φ₂, φ₃, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃), where ϖ^m is the largest power of ϖ dividing χ^{n−1}(g) − 1 for all g in the decomposition group at p, and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr; so R^unr → R̃^unr is injective and R^unr acts faithfully on R̃^unr/R^unr ≅ R^unr. (2) J = I: the annihilator of R̃†/R† (the ring with a Frobenius eigenvalue modulo the flag-free image ring) is the kernel of the map to the unramified quotient.",
    "after": "Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R^unr ≅ 𝒪/ϖ^m⟦φ₁, φ₂, φ₃, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃), where ϖ^m is the largest power of ϖ dividing χ^{n−1}(g) − 1 for all g in the decomposition group at p, and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr as R^unr-modules; so R^unr → R̃^unr is injective and R^unr acts faithfully on R̃^unr/R^unr ≅ R^unr. (2) J = I: the annihilator of R̃†/R† (the ring with a Frobenius eigenvalue modulo the flag-free image ring) is the kernel of the map to the unramified quotient."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/taylor-wiles-block-condition: api, hypotheses, proofSteps, tests</summary>

```json
[
  {
    "path": "/api",
    "oldRange": [
      4,
      5
    ],
    "newRange": [
      4,
      6
    ],
    "removed": [
      {
        "name": "TauCeti.GaloisDeformation.Local.TaylorWilesBlock.rank2",
        "role": "compatibility",
        "statement": "For n = 2, n₁ = 1 it is the Taylor–Wiles local ring of R08.2/taylor-wiles-local-ring."
      }
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.TaylorWilesBlock.rank2",
        "role": "compatibility",
        "statement": "For n=2,n₁=1, distinct eigenvalues and q_v≡1 mod p, impose the compatible unramified determinant to recover R08.2/taylor-wiles-local-ring."
      },
      {
        "name": "TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition_unique",
        "role": "characterisation",
        "statement": "The selected Frobenius block is the image of the idempotent obtained by Hensel separation of its residual eigenvalue from the complementary eigenvalues. This projector, its A_v⊕B_v decomposition and the imposed scalar inertia character commute with allowed coefficient maps."
      }
    ]
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      1,
      1
    ],
    "newRange": [
      1,
      2
    ],
    "added": [
      "The block condition has variable determinant. For comparison with R08.2/taylor-wiles-local-ring, impose the same compatible unramified determinant and assume q_v≡1 mod p and distinct residual eigenvalues. Scalar inertia on A_v is part of the condition, not a consequence of the tame relation."
    ]
  },
  {
    "path": "/proofSteps/0",
    "before": "The decomposition lifts uniquely by Hensel (α_v is separated from the other eigenvalues of Frob_v); inertia acts on the generalised α_v-block through a character because q_v ≡ 1 mod p^N at Taylor–Wiles primes and the tame quotient is abelian on that block; Art_{F_v} identifies the p-part of tame inertia with Δ_v (Tau Ceti ClassFieldTheory Layer 7).",
    "after": "Hensel separates the selected Frobenius eigenblock from the other eigenvalues, giving its canonical decomposition. Impose scalar inertia on the A_v-block and trivial inertia on B_v. The tame relation then forces ψ_v to factor through the p-part Δ_v of the local residue units, identified by the normalized Artin map. The relation alone does not force a general repeated-eigenvalue block to have scalar inertia."
  },
  {
    "path": "/tests/0/statement",
    "before": "n = 2, n₁ = 1, distinct eigenvalues: R^TW_v ≅ 𝒪[Δ_v]⟦x, y, B⟧, matching R08.2/taylor-wiles-local-ring.",
    "after": "For n=2,n₁=1 and distinct eigenvalues, the variable-determinant block ring is 𝒪[Δ_v][[x,y,B,C]]. After imposing the compatible unramified determinant it is 𝒪[Δ_v][[x,y,B]], as in R08.2/taylor-wiles-local-ring."
  },
  {
    "path": "/tests/3/statement",
    "before": "If r̄(Frob_v) is not semisimple on the α_v-block, A_v(Frob_v) = α_v·1 cannot be lifted and the condition is empty.",
    "after": "A nonscalar residual Jordan block does not satisfy the semisimple-block hypothesis. The source condition does not impose A_v(Frob_v)=α_v I on lifts, so it does not force emptiness merely because a generalized eigenblock is nonsemisimple."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/gsp4-minimal-conditions: api, proofSteps, statement, tests</summary>

```json
[
  {
    "path": "/api/1/statement",
    "before": "At types U_i the image of inertia is generated by exp(N) with rank N = i.",
    "after": "At U_i the logarithm lifts the specified nilpotent orbit over the Artinian coefficient ring; require conjugacy to the chosen representative or equivalent free kernel/image conditions for every power, not just generic matrix rank."
  },
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.baseChange",
        "role": "functoriality",
        "statement": "The split nilpotent-orbit lifting condition at U_i is preserved under Artinian coefficient maps by applying the map to its conjugating element and unit parameter. The P/H condition uses the fixed prime-to-p inertia lift and is preserved under the same maps."
      }
    ]
  },
  {
    "path": "/proofSteps/1",
    "before": "Types U: the rank of the logarithm of a generator of the unipotent image is constant in the condition; closedness under strict equivalence from GSp₄-equivariance of exp/log (R08.2/gsp4-unipotent-local-models).",
    "after": "For types U impose the nilpotent orbit lifting condition with all kernel/image ranks fixed. Conjugation and exp/log preserve it; the smooth centralizer controls liftability. Generic rank of N alone is not a coefficient-ring definition."
  },
  {
    "path": "/statement",
    "before": "Let r̄ : G_ℚ → GSp₄(k) with similitude ε̄^{−(a−1)} and x ∈ S(r̄) of one of the types of R08.2/gsp4-ramification-types. A lift r of r̄|G_x with similitude ε^{−(a−1)} is minimal at x if: (U1–U3) r|I_x has unipotent image, topologically generated by exp(N) with N nilpotent of rank 1, 2 or 3 respectively (the same rank as for r̄); (P) r(I_x) ≅ r̄(I_x) (reduction is injective on the image of inertia); (H) likewise r(I_x) ≅ r̄(I_x). Minimal lifts at x form a local deformation problem; at a prime x of type U3 it coincides with the unipotent problem R^1 and with the minimally ramified condition (R08.2/regular-unipotent-minimally-ramified).",
    "after": "Let r̄ : G_ℚ → GSp₄(k) with similitude ε̄^{−(a−1)} and x ∈ S(r̄) of one of the types of R08.2/gsp4-ramification-types. A lift r of r̄|G_x with similitude ε^{−(a−1)} is minimal at x if: (U1–U3) r|I_x has unipotent image, topologically generated by exp(N) with N conjugate over the coefficient algebra (after the specified splitting extension) to the chosen residual orbit representative N₁, N₂ or N₃ respectively, up to the compatible unit rescaling; (P) r(I_x) ≅ r̄(I_x) (reduction is injective on the image of inertia); (H) likewise r(I_x) ≅ r̄(I_x). Minimal lifts at x form a local deformation problem; at a prime x of type U3 it coincides with the unipotent problem R^1 and with the minimally ramified condition (R08.2/regular-unipotent-minimally-ramified)."
  },
  {
    "path": "/tests/2/statement",
    "before": "A lift at a U1 prime with r(σ) = exp(N) for N of rank 2 is not minimal: the rank of N must equal that of the residual.",
    "after": "Over an Artinian coefficient algebra, a nilpotent lifting N₁ whose square is a nonzero nilpotent matrix cannot be conjugate to N₁ (which squares to zero). It fails the U1 orbit condition even if its reduction has rank 1; a generic-rank label alone would miss this."
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:R08.2/rigid-residual-conditions: api, hypotheses</summary>

```json
[
  {
    "path": "/api/3/statement",
    "before": "Rigid for (Σ_min, Σ_lr) and 𝔭 satisfying (2) ⟹ rigid for (Σ_min, Σ_lr ∪ {𝔭}).",
    "after": "Rigid for (Σ_min, Σ_lr) and 𝔭 satisfying (2) ⟹ rigid for (Σ_min, Σ_lr ∪ {𝔭}). Require every added place to be outside the previous minimal, level-raising and p-adic sets and to satisfy the inert-place and q²−1 side conditions."
  },
  {
    "path": "/hypotheses",
    "oldRange": [
      2,
      2
    ],
    "newRange": [
      2,
      3
    ],
    "added": [
      "The polarized rigid datum has mutually disjoint Σ_min⁺, Σ_lr⁺ and Σ_p⁺; every level-raising place is inert in F/F⁺ and p∤((Nv)²−1), as in the standing assumptions immediately before Definition 3.6.1."
    ]
  }
]
```

</details>

<details>
<summary>LocalGaloisDeformationRings:L7/torsion-crystalline-representations: acceptance, api, proofSteps, tests</summary>

```json
[
  {
    "path": "/acceptance/0",
    "before": "a = 0, b = 1, F_w = ℚ_p: torsion crystalline modules are the finite flat group scheme representations (Raynaud, e = 1 < p − 1).",
    "after": "For p≥3 and e(F_w/ℚ_p)=1<p−1, the relevant two-weight torsion crystalline condition agrees with finite-flat representations after the stated sign/Tate-twist conversion."
  },
  {
    "path": "/api/2/statement",
    "before": "For b − a ≤ p − 2 the class is closed under subobjects, quotients and finite direct sums.",
    "after": "For every fixed [a,b], torsion crystalline objects are closed under subobjects, quotients and finite direct sums."
  },
  {
    "path": "/api",
    "oldRange": [
      5,
      5
    ],
    "newRange": [
      5,
      6
    ],
    "added": [
      {
        "name": "TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.twist",
        "role": "functoriality",
        "statement": "Tensoring a torsion crystalline object with a lattice in a crystalline character of constant labelled Hodge weight w shifts its weight interval from [a,b] to [a+w,b+w]. This states the shift in terms of w, independently of the cyclotomic sign convention."
      }
    ]
  },
  {
    "path": "/proofSteps/0",
    "before": "The class of torsion crystalline modules is closed under subobjects, quotients and direct sums when b − a ≤ p − 2 (Fontaine–Laffaille), which makes the induced deformation condition stable (as in R08.6/category-deformation-conditions).",
    "after": "Torsion crystalline objects are closed under subobjects and quotients in every fixed weight interval by pulling back or pushing forward the lattice quotient R″/R′. Direct sums use direct sums of crystalline representations. The short FL range supplies its fully faithful classification, not this closure property."
  },
  {
    "path": "/tests/2/statement",
    "before": "For b − a ≥ p − 1 the class is not closed under quotients in general (Fontaine–Laffaille fails at the endpoint, PadicHodgeTheory R06.4/fontaine-laffaille-endpoint-non-example).",
    "after": "At b−a=p−1, unrestricted integral FL full faithfulness can fail (R06.4/fontaine-laffaille-endpoint-non-example). Torsion crystalline subquotient closure still holds by the lattice-quotient definition."
  }
]
```

</details>

### Suggested-file changes

- Added Matrix.Charpoly.Coeff and ZMod.Basic imports for the actual regression proofs.
- Rewrote the header to distinguish concrete signatures/proved checks from the informal inventory and to state the unmet section-13 correspondence honestly.
- Clarified that KernelsHaveRank is only the pointwise necessary condition; base-change kernel compatibility is part of the full minimal condition.
- Removed the malformed informal pseudo-signature/template block containing undeclared period, flag and coefficient carriers. No such carrier was substituted by a Prop placeholder.
- Added ordinaryDet_trace_det and proved characteristic-polynomial and nonzero ordered-product examples over ZMod 9. The trace/determinant and characteristic polynomial facts cover matrices of the form occurring in the generated finite subgroup.
- Added regularNilpotentModThree, the proved nonzero cube/zero fourth-power and the q*=−2 cubic-correction check over ZMod 3.
- Replaced the comment inventory from the corrected packet: all 153 node statements, all 246 API items and all 162 tests. This records every inventory edit, including newly added names, through the packet ledger.
- Preserved the four existing sorry theorem signatures and all earlier proved checks. No claim that the full roadmap is formalised was added.

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/LocalGaloisDeformationRings.json`: zero errors, zero warnings. `lean-check research/blueprint/suggested/LocalGaloisDeformationRings.lean`: successful elaboration at the pinned Mathlib, with only four sorry warnings. Memory was checked before compiling; no language server or new build was started. Final whitespace/path and review-coverage checks are recorded in the PR.

The [handoff](../handoff/REV-LocalGaloisDeformationRings.md) gives the revision worklist without transient source/log paths. All source URLs, hashes, verdicts, exact edits and remaining inputs are committed here or in the packet; the job scratch directory can be deleted after submission. The completed review is needs_changes and must not be interpreted as permission to promote this plan.
