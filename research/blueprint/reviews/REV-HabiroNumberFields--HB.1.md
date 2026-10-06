# REV-HabiroNumberFields--HB.1

Accepted after corrections. Reviewer: Codex, session `codex-RX9uU4`, 6 October 2026; issue #6445. The planner was Codex session `codex-NVgsZd` (PR #6556); this is an independent review of another session's work.

The packet is a complete **target-level planning pass**, with HB.1 **planned**, not closed. Its two supplier gaps remain explicit. Acceptance verifies the downstream arguments conditional on those interfaces; it does not verify the unavailable original Keune proof or claim any result is formalized.

| Item | Result |
|---|---|
| New packet nodes | 7 checked: 3 verified, 4 corrected |
| Nodes added or removed | 0 |
| Baseline declarations | 28 inherited confirmed; 3 existing Mathlib declarations added; 31 total |
| Baseline declarations removed | 0; 2 descriptions made more precise |
| Source findings | E1, E2, E6, E7 independently confirmed; 0 new findings |
| Stage coverage | 1 planned; 0 closed |
| Supplier boundaries | 5 requests checked; 2 propagated gaps retained |
| Planets | 2; ordinary-unit planet renamed |
| Definition/construction API and tests | No new objects; 3 inherited objects have 25 API entries and 13 tests |
| Suggested file | 4 active signatures elaborate; 3 arithmetic contracts remain comments |

## Reading and source checks

I read the packet, suggested file, HB.1 reader, original HB.1 nodes and their API/tests, the planner's handoff, the reviewed HB.1 audit (AUDIT-28), the relevant ArithmeticKTheory N.1/N.3/N.6 and published K3BlochGroups V.3 nodes, accepted RS-08/RS-10 decisions, and the assigned red-team findings and their independent verification. The Multiquadratic and ArithmeticDirichletSeries upstream documents were read in full. The local/global and cohomology supplier descriptions were read at the requested interfaces.

The public texts checked were:

- [Published CGZ author copy](https://www.math.uchicago.edu/~fcale/papers/CGZ.pdf), *Annales scientifiques de l'École normale supérieure* 56 (2023), 383–426, DOI 10.24033/asens.2537. Checked §2.6, pp.398–399, and §§3.1–3.5, pp.400–403, including each node's locator and short excerpt. The tensor exponent on p.401 was also checked in a rendered page.
- [CGZ arXiv v3](https://arxiv.org/pdf/1712.04887v3), collated at the corresponding §2.6 and §3 passages. The proof findings persist in the published text; no allegation rests only on an earlier version.
- [Sutherland, Lecture 24 (2021)](https://math.mit.edu/classes/18.785/2021fa/LectureNotes24.pdf), the infinite-place discussion and Theorem 24.6 with proof, pp.3–4. It supports the permutation-module calculation; the packet instead builds the application from the pinned Dirichlet lattice.

All three downloaded PDFs independently match the SHA-256 values already recorded in `sourceVersions`. The original Keune article was not independently read: the supplier explicitly records that source gap, and this review preserves it. Its secondary quotation in CGZ was checked.

## Node-by-node mathematical review

All identifiers below have prefix `HabiroNumberFields:HB.1/`.

1. **finite-endomorphism-obstruction-criterion — verified.** On each finite q-primary component for q dividing n, the hypothesis iterates to surjectivity because a sufficiently large power of n is zero. Surjectivity is injectivity on a finite group. Components prime to n contribute no n-torsion; n=0 reduces directly to surjectivity. A cyclic generator supplies all twisted coinvariant relations by the geometric-sum identity. This establishes the needed vanishing implication without identifying torsion with a quotient. The ℤ/9 cases and the ℚ/ℤ counterexample distinguish the hypotheses.

2. **keune-picard-eigen-obstruction — verified conditionally.** The exact N.6 supplier is an injection from the inverse-character coinvariant quotient of Pic/n, not from Pic[n]. Finiteness of K₂ and p prime to its order make the target zero. Pic of the localization is finite by the actual baseline class-group results; the finite-endomorphism criterion then kills its inverse-character n-torsion. Full cyclic G is supplied by the cyclotomic node. The m>1 argument never divides by the group order. The remaining original-source verification is precisely the existing N.6 gap.

3. **cyclotomic-prime-valuation-action — corrected request, verified argument.** The integer cyclotomic polynomial result uses exponent k+1, so take k=m−1. Over an unramified completion of F, p remains a uniformizer and the shifted polynomial remains Eisenstein. Its degree is φ(p^m). The canonical completion product, together with the global upper bound, forces one prime over each base prime, e=φ(p^m), f=1 and full cyclotomic character. The ideal action and valuation-image action are therefore trivial. I made the unramifiedness translation, canonical scalar structures and Layer 5.3/5.5 outputs explicit in the request. The primitive-root theorem's surjectivity is derived here, not incorrectly attributed to the baseline injectivity theorem.

4. **injective-exact-map-eigenclass-lift — verified.** Equivariance makes the obstruction an eigenvector, hence zero. Middle exactness supplies a preimage; injectivity forces each eigenrelation and uniqueness. There is no right-exactness claim for eigenspaces, no averaging and no finite-group hypothesis. The active signature has exactly these hypotheses.

5. **ordinary-unit-eigenclass-lift — corrected supplier, verified argument.** First lift across the equivariant Kummer inclusion using Pic[n] vanishing. For the second lift retain D, the image of the integer valuation map. It is free, and the reduced sequence with D/n is exact; replacing it by the full coordinate group modulo n would require saturation. Trivial action on D and a character value whose difference from one is a unit kill its inverse-character part, including m>1. The result is a unique unit **class**, not an eigenunit representative. M.3's degree-two K₂ comparison does not cover the weight-one compatibility requested here. I moved that precise request and prerequisite to M.1's realization/Kummer-localization interface. The field Kummer input remains ProfiniteCohomology Layer 9; the early Chern input remains a recorded gap.

6. **odd-cyclotomic-unit-multiplicity — corrected dependencies and naming, verified argument.** Restore the omitted weighted logarithmic coordinate and use the full lattice, so the real tensor map is an isomorphism, not just a surjection. With the natural unit action and Mathlib's inverse place action the full logarithm is equivariant. Complexification gives the sum-zero permutation hyperplane; a nontrivial character contributes nothing to the constant line. Each complex base place contributes one parameter; each real base place contributes none by the oddness condition on its actual order-two stabilizer. This proves the stated more general relative theorem without a Galois-closure product assumption. I added the missing prerequisite for its cyclotomic specialization and the precise torsion/conjugation existence inputs. Its group is all integral units, so its title and planet now refer to ordinary units rather than the customary cyclotomic-unit subgroup. The trivial-character rejection and the nonnormal cubic example are appropriate acceptance cases.

7. **prime-unit-torsion-exact-sequence — corrected freeness citation, verified argument.** The existing integral basis of U/T makes reduction of the torsion sequence left exact. Since |G|=p−1 is a unit, the character projector is exact. The integral trace calculation transports the character multiplicity to a free ℤ_p summand and hence its residual dimension. Comparing the local degrees at p and p² excludes μ_{p²} from L; μ_p carries χ and contributes to χ⁻¹ precisely at p=3. I added `basisModTorsion` as the explicit existing freeness input. The packet imports, rather than recomputes, the matching K₃-side count.

## Baseline audit and corrections

Every cited statement and its namespace was independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No declaration was removed or replaced with a planned theorem. The following table covers all 31 declarations; the module paths and individual checked records are in the packet.

| Pinned module | Declarations checked |
|---|---|
| `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` | `mathlib:NumberField.Units.logEmbedding`, `mathlib:NumberField.Units.dirichletUnitTheorem.sum_logEmbedding_component`, `mathlib:NumberField.Units.logEmbeddingEquiv`, `mathlib:NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`, `mathlib:NumberField.Units.instZLattice_unitLattice`, `mathlib:NumberField.Units.unitLattice_rank`, `mathlib:NumberField.Units.basisModTorsion` |
| `Mathlib/NumberTheory/NumberField/Units/Basic.lean` | `mathlib:NumberField.Units.torsion`, `mathlib:NumberField.Units.sum_mult_mul_log`, `mathlib:NumberField.Units.mem_torsion` |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | `mathlib:NumberField.InfinitePlace.mult`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces` |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean` | `mathlib:NumberField.InfinitePlace.smul_apply`, `mathlib:NumberField.InfinitePlace.orbitRelEquiv`, `mathlib:NumberField.InfinitePlace.IsUnramified.stabilizer_eq_bot`, `mathlib:NumberField.ComplexEmbedding.IsConj.coe_stabilizer_mk`, `mathlib:NumberField.InfinitePlace.exists_isConj_of_isRamified` |
| `Mathlib/NumberTheory/NumberField/Basic.lean` | `mathlib:NumberField.RingOfIntegers.mapRingHom` |
| `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean` | `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn` |
| `Mathlib/RingTheory/Polynomial/Eisenstein/IsIntegral.lean` | `mathlib:cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt` |
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | `mathlib:IsPrimitiveRoot.autToPow` |
| `Mathlib/NumberTheory/Cyclotomic/Gal.lean` | `mathlib:IsPrimitiveRoot.autToPow_injective` |
| `Mathlib/RepresentationTheory/Basic.lean` | `mathlib:Representation` |
| `TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean` | `tauceti:IsDedekindDomain.selmerGroup.fromSUnitLift_injective`, `tauceti:IsDedekindDomain.selmerGroup.ker_toClassGroup`, `tauceti:IsDedekindDomain.selmerGroup.range_toClassGroup` |
| `Mathlib/RingTheory/RamificationInertia/Ramification.lean` | `mathlib:Ideal.ramificationIdx` |
| `Mathlib/RingTheory/RamificationInertia/Inertia.lean` | `mathlib:Ideal.inertiaDeg` |
| `Mathlib/Algebra/Module/ZLattice/Basic.lean` | `mathlib:Module.Basis.ofZLatticeBasis` |
| `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup` |
| `TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean` | `tauceti:IsDedekindDomain.finite_integer_classGroup` |

The added citations are `NumberField.Units.mem_torsion`, `NumberField.InfinitePlace.exists_isConj_of_isRamified` and `NumberField.Units.basisModTorsion`. These are existing results, not new nodes. `coe_stabilizer_mk` describes a stabilizer given a conjugation; the new citation supplies existence. `torsion` is a definition with accompanying finite/cyclic instances; its absolute-value characterization now has its own theorem citation. The omitted-coordinate description now explicitly retains the multiplicity weight. Independent checking was recorded on all baseline entries.

The audit's absent K₃/coefficient/Chern interfaces are still absent. The seven nodes are applications and missing proof inputs, not a second Dirichlet theorem, Bloch presentation, general Kummer theory or generic Chern construction.

## Source findings

All four entries now carry this review's explicit `confirmed` verdict and reason.

- **E1, published p.401:** the target twist and root-change law require tensor exponent m in place of the printed n.
- **E2, p.403:** at F=ℚ and p=3 the unit cube-class space has order 3 despite r₂=0. The χ≠χ⁻¹ restriction of Proposition 2.12(b) excludes that case. The extra μ₃ dimension must occur in the unit and K₃ counts; the square-free isomorphism survives.
- **E6, p.399:** the nonnormal cubic F=ℚ(∛2) is disjoint from ℚ(ζ₃), but its Galois closure contains ζ₃. The proposed product has order 12 instead of 6. The direct relative argument avoids it.
- **E7, p.400:** for F=ℚ, n=3, m=2, H¹(C₂,ℤ/3(2))=0 although every unit residue squares to one. This refutes the printed converse; Sah supplies only necessary annihilators for the actual character image.

## Closure, API, planets and assigned findings

The seven additions refine the two open parent proof chains. All 16 inherited HB.1 targets are retained and mapped in `targetCoverage`; no HB.2 regulator target is invented. At target level the local cyclotomic and logarithmic arguments are coherent nodes; splitting their proof sketches further is unnecessary. The added direct dependencies remain acyclic.

There are no new definitions or constructions in this follow-up. The inherited cyclotomic/eigenspace, excluded-integer and c_ζ objects have respectively 12/6/7 API entries and 5/4/4 tests. Their coefficient, sign, trivial-group, n=1 and p=3 cases distinguish plausible wrong definitions. I reviewed these as planning contracts; I did not rerun the parent's PARI calculations. V.3's convention objects and the generic Chern/coefficient objects retain their own owners. The two planets are central theorem targets; their number is below the six-per-layer limit. The renamed unit planet needs the reader synchronization noted below.

Both packet and reader address the three assigned findings:

| Finding | Verification |
|---|---|
| RT-AREA-ktheory-2/14 | N.6 owns the exact Keune injection; the follow-up supplies the finite Pic/n-to-Pic[n] argument and preserves the original-source gap. Neither text substitutes M.3's K₂ comparison for Keune. |
| /17 | The published V.3 nodes own the integral Bloch presentations and comparison maps. Both texts import the specified odd-coefficient isomorphisms and retain separate Suslin restrictions. The direct V.3→HB.1 link is recorded. |
| /18 | Both texts assign generic finite Chern classes and products to the single M.8 owner, retain only c_ζ specialization in HB.1, and request an approved early prefix. They explicitly avoid making the whole late M.8 an input, with its D.2/R.7 cycle. |

## Validation and handoff to assembly

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.1.json` reports **0 errors, 0 warnings**. The `check_errata.versions_checked` source-version metadata check passes. JSON decoding and whitespace/diff checks pass.

`lean-check research/blueprint/suggested/HabiroNumberFields--HB.1.lean` exits **0** at the pinned Mathlib, with only **four declaration-uses-sorry warnings**. Only the four active signatures elaborate. The three arithmetic contracts are explicitly comments awaiting real K-theory, étale and residual-eigenspace interfaces; no proposition-valued stand-ins were introduced. The suggested-file changes only explain the corrected dependencies and names.

The following work belongs to suppliers or assembly, not to an unresolved contradiction in the downstream plan:

1. ArithmeticKTheory N.6 must read the original Keune theorem and verify the exact finite-level hypotheses before discharging that source gap.
2. The restructuring owner must approve the early M.8 prefix and assign real stage/node IDs; HB.1, HB.2 and D.2 then import its common finite-Chern/product interface.
3. Assembly must attach the refinement edges to the accepted parent, use V.3's published coefficient maps, and replace the parent's ambiguous composite-order complex-character notation by actual characters.
4. The HB.1 reader is outside this review issue's allowed deliverables. In its ordinary-unit section, change the Kummer compatibility supplier from M.3 to M.1; synchronize the ordinary-unit title/planet and the added explicit baseline inputs. Its mathematical arguments and the three assigned red-team corrections were checked. This report and the corrected packet record the authoritative corrections for that synchronization. PLAN-HABIRO/RS-10 scope wording also remains an assembly task.

No additional nodes, owner duplicates, undocumented conjectural replacements or coverage upgrades were introduced. The own-session handoff records these concrete remaining tasks.
