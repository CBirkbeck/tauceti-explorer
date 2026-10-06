# Independent review of K3BlochGroups V.6

**Accepted**, 2026-10-06, by Codex, session **codex-7NFcBx**, for
[issue #6401](https://github.com/CBirkbeck/tauceti-explorer/issues/6401).
The original part was written by Codex **codex-yOvAM9** for BP-K3BlochGroups--V.6;
this is an independent session. The packet is a complete target-level planning
pass, with V.6 **planned**, three gaps and two requests. Acceptance does not
assert that the stage is closed or that any field-specific construction is
implemented. Every implementation status remains unchecked.

The checked inputs were the part packet, its reader and suggested file, the
reviewed parent K3BlochGroups packet, the HabiroNumberFields supplier packet,
the V.6 stage description, and RT-AREA-ktheory-2 finding 23 and its confirmed
review. Upstream density and API guidance were checked against the
AlgebraicTopology and UniversalCovers roadmaps. The reviewed AUDIT-29 entry in
data/library-coverage.json is **not built**, with all six original V.6 targets
absent; its review is REV-AUDIT-29, 2026-09-17. General group homology, kernels,
and tensors are baseline objects, and are reused here.

The final part has **5 nodes** (3 constructions, 2 definitions), **43 API
items**, **21 unit tests**, **4 planets**, and **18 baseline declarations**.
All five nodes have a verdict in the packet's review.checked list.

| Node suffix | Verdict | Mathematical and API check |
| --- | --- | --- |
| integral-root-multiple | verified | The element is the multiple in the actual additive kernel. The primitive-root boundary input comes from the parent; retaining the antisymmetric quotient preserves its diagonal 2-torsion. The API provides the inclusion, proof independence, zero, multiplication and transport laws. Four tests distinguish the multiple from the raw symbol. |
| root-coefficient-class | verified | The divided pure tensor uses a specified unit denominator. Its image follows from tensor balance. For two annihilators m,l, the equality l·(mx)=m·(lx) holds already in the kernel; balancing and the inverse units give denominator independence. No flatness is needed. Four tests include the noninjective inclusion after tensoring with ℤ/2. |
| suslin-lift-fibre | verified | For an infinite field the imported exact sequence gives a nonempty fibre and a free transitive enhanced-Tor action. Surjectivity permits choice but supplies no additive section. The model ℤ/24→ℤ/6 has four representatives above 1 and is nonsplit: none of those representatives is killed by 6. Constructors, extensionality, action and functoriality are present. |
| bar-lift-witness | corrected | Witnesses use Mathlib's actual degree-three cycles and retain a finite chain. The trivial-coefficient differential agrees with the source's bar signs; source right-module action and Mathlib inverse leading action both become trivial. Added a finite-chain constructor and its projection law, with explicit baseline inputs. Five tests now reject a concrete noncycle as well as distinguishing chains from homology. |
| finite-coefficient-identification | verified | Both supplied equivalences have a common cohomology target and the same twist. Their composition is R_ζ⁻¹c̄. The subgroup equation follows by applying R_ζ and using the linearity and inverse unit scalar γ⁻¹. Its additional M_F hypothesis is retained. The finite middle group, quotient subgroup and K₂ torsion term remain distinct; four tests check composition direction and the distinction. |

The new bar test uses g≠1 and the chain [g|1|1]. Its boundary is
[1|1]−[g|1], which is nonzero because the two basis tuples are distinct.
The existing trivial-group cube test is also correct for the **unnormalized**
complex: [1|1|1] is a nonzero chain and a boundary of [1|1|1|1].
The finite arithmetic acceptance example is consistent: K₃(ℚ)/5 vanishes,
whereas the imported étale Bloch class [32] has a tame boundary value 2 at 31,
of order 5. This is not replaced by the simpler finite-group test in the file.

All node locators and short excerpts were read in the following public versions;
the downloaded SHA-256 values agree with the packet. Page numbers below refer
to those versions, and the published copy was also inspected visually at p415.

| Source | Passages and version fingerprint |
| --- | --- |
| [Weibel, K-book VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) | VI.5.1–5.2, pp23–24, and ψ, VI.5.10/5.12, pp28–29; SHA-256 efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1. The exact sequence used for lifts is explicitly for infinite fields. The image statement supports existence, not effective cycle synthesis. |
| [Calegari–Garoufalidis–Zagier, arXiv v3](https://arxiv.org/pdf/1712.04887v3) | §§1.2, 2.1, 3.1–3.3, 6, especially pp31–33; SHA-256 024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5. The root multiple and coefficient hypothesis, finite exact sequences, and good-prime R_ζ range match. |
| [Hutchinson, arXiv v4](https://arxiv.org/pdf/2104.14413v4) | §§1, 2.1–2.3, especially Theorem 2.10, p4; SHA-256 e7a358154bf29701afcb1feb2308287f90e0fe405813d9548879dd5b2f2f30bf. The requested finite Chern statement uses the theorem and odd-primary Milnor reduction. Corollary 2.11's narrower roots-of-unity hypothesis is not discarded. |
| [CGZ, author-hosted published copy](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf) | Printed p415, §6; SHA-256 13d38474d6b7b6e3fc946d50cc2764094c3a25a194d873c17d9cd334c25600cf. Collated with arXiv p32; equation numbers differ between the two versions. |

Both sourceIssues are **confirmed** in both versions. E-V6-1 needs K₂(F)[n]
in the intermediate isomorphism, as forced by the adjacent exact sequences.
E-V6-2 needs the lifted x where z is printed: z is introduced later in K₂.
Neither changes the stated theorem. Independent title/erratum/correction and
DOI searches found no correction of these passages. The search record was
extended, and E-V6-2's copied description of the searched mistake was corrected.

Each baseline statement and its ambient hypotheses was read at
[Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174).
The table gives source file suffixes under Mathlib and declaration lines.
Only ker, trans and symm need generated additive counterparts; their
to_additive annotations and the elaborating uses were checked.

| Declaration | Module suffix and line | What is supplied |
| --- | --- | --- |
| MonoidHom.ker | Algebra/Group/Subgroup/Ker.lean:238 | Generated additive subgroup, membership δx=0. |
| AddMonoidHom.toIntLinearMap | Algebra/Module/LinearMap/Defs.lean:719 | Additive maps of abelian groups as ℤ-linear maps. |
| TensorProduct | LinearAlgebra/TensorProduct/Defs.lean:71 | Module tensor quotient with bilinear balancing. |
| TensorProduct.tmul | LinearAlgebra/TensorProduct/Defs.lean:97 | Pure tensors. |
| TensorProduct.map | LinearAlgebra/TensorProduct/Map.lean:53 | Tensor functoriality; its semilinear generality includes the uses here. |
| IsPrimitiveRoot | RingTheory/RootsOfUnity/PrimitiveRoots.lean:63 | Power-one and divisibility minimality in a commutative monoid. |
| Rep.trivial | RepresentationTheory/Rep/Basic.lean:286 | Trivial representation on a module. |
| groupHomology.cycles | RepresentationTheory/Homological/GroupHomology/Basic.lean:195 | Actual cycle module, rather than a replacement submodule. |
| groupHomology.cyclesMk | Same module:203 | Cycle constructor from a chain and differential equation, with explicit predecessor. |
| groupHomology.iCycles | Same module:208 | Inclusion into chains. |
| groupHomology.toCycles | Same module:219 | Boundary as an element of the cycle module. |
| groupHomology.π | Same module:235 | Projection to actual homology. |
| groupHomology_induction_on | Same module:244 | Representation of every homology element by a cycle. |
| groupHomology.inhomogeneousChains.d | Same module:127 | Finite-support bar differential; d_single at 134 checks its signs. |
| isZero_groupHomology_succ_of_subsingleton | Same module:263 | Positive homology vanishes for a subsingleton group. |
| MulEquiv.trans | Algebra/Group/Equiv/Defs.lean:405 | Generated additive composition, in the order used. |
| MulEquiv.symm | Same module:285 | Generated additive inverse. |
| ZMod.castHom | Data/ZMod/Basic.lean:331 | Characteristic-divisibility map; 6 divides 24 for the lift test. |

The pinned Tau Ceti tree was independently checked through its untruncated
GitHub tree at f790474: 5,478 files under TauCeti/. Its Steinberg-named paths
concern other notions; there is no Bloch/Suslin/algebraic-K₃ path. This agrees
with the reviewed audit. No Tau Ceti declaration from the differently pinned
shared build is used.

Every imported prerequisite was checked against its supplier's statement.
The parent supplies the five-term and boundary certificates, Bloch constructor,
root boundary and specializations, rational/integral/ordinary-modulo
comparisons, and the existential Steinberg lift. Habiro HB.1 supplies its finite
coefficient object and Chern conventions; HB.2 owns the étale Bloch object,
good-prime R_ζ, and comparison scalar. Those objects are imported, not replanned.
M.7/M.8 requests specify the original number field, finite indecomposable
convention, odd-primary Milnor reduction, twist and Bockstein compatibility.
The targetCoverage map accounts for every retained V.6 target.

RT-AREA-ktheory-2/23 is handled correctly. P.2 owns real regulator agreement,
with R.7's scalar input; D.2 owns p-adic agreement. P.2's reviewed comparison
already imports V.4, and D.3 is not the owner of agreement. The checked stage
paths P.2→R.7→M.8 and D.2→M.8 make whole-stage V.6 exports to those owners
cyclic when V.6 consumes M.8. The proposed V.6a/V.6b split also separates
V.6a→HB.2→V.6b. These are maintainer proposals; no atlas edges or campaign
documents were changed. Four new planets plus the parent's two retained
certificate/constructor planets give six at assembly.

Changes made in this review are limited to the explicit bar constructor,
projection API and noncycle test; its two missing baseline references and proof
inputs; individualized baseline checks; the audit verdict spelling; the two
source-issue reviews/search notes; and the packet review object. No node was
added, removed or renamed. The reader remains mathematically compatible; its
description of supplied finite-chain witnesses is refined by the new API.

Validation: check_blueprint.py reports **0 errors, 0 warnings**. The embedded
source-issue/source-version validators report no errors. All 43 API names and
21 test names occur in the suggested file, including the explicitly deferred
field-specialization signature. lean-check of the final file at the pinned
Mathlib exits **0**, with **54 declaration-uses-sorry warnings** and no other
warnings or errors. Finite arithmetic checks confirm the lift fibre and
nonsplitting, the mod-5 composition, the order-five tame value, and the new bar
boundary in the group of order two. Elaborating signatures and examples with
sorry does not prove the proposed mathematics.

The remaining mathematical work is unchanged: effective finite-certificate
to Steinberg-cycle synthesis; the right-end finite-coefficient normalization
with M.7/M.8 supplies; and the inherited V.1 Hurewicz/comparison citation input.
These are explicit planning gaps, not hidden proof steps or unfinished review.
