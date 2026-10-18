# Independent review: Abelian surfaces potential modularity

**Verdict: needs_changes.** The review is complete; this is not a checkpoint. Codex, session codex-F5ke1e, reviewed the design written by Claude Opus 5.5 (claude-miNWKw), introduced in PR #10330 at 00e544746. Refs #3485. Review date: 2026-10-18.

All 57 original nodes were checked and one target was added. Final verdicts: **21 verified, 33 corrected, 1 added, 3 unverifiable**. “Verified” describes the source statement and its conditional design route, using the explicitly requested supplier contracts. It does not discharge a supplier request or an unresolved prerequisite. In particular no descendant of defect-one patching is certified as an unconditional proof.

| Inventory | Reviewed packet |
| --- | ---: |
| Nodes | 58 |
| Definitions / constructions / theorems / applications | 14 / 4 / 39 / 1 |
| API items / unit tests / planets | 127 / 71 / 31 |
| Pinned baseline declarations | 17 |
| Supplier requests / recorded gaps | 89 / 8 |
| Planned / partial stages | 3 / 5 |

The packet is partial: AP.0–AP.2 are planned; AP.3–AP.7 are partial. Their remaining lists identify both the unresolved arithmetic obligations and supplier contracts. Every implementation remains unchecked. The review cannot accept the three nodes marked unverifiable while their asserted proof routes still have the gaps below. Merely declaring those stages partial does not resolve these particular contradictions in the proposed argument.

## Sources and scope

Read the two specified public arXiv editions at every original node locator: [BCGP18, v3](https://arxiv.org/abs/1812.09269v3), especially §§7.7–10, pp.210–281, and the conventions and abelian-variety inputs in §§2.7–2.9, pp.34–40; [BCGP25, v1](https://arxiv.org/abs/2502.20645v1), Theorem 1.8.17, pp.13–14, §8.1, pp.180–183, §9.2.1, p.192, §9.3, pp.200–203, and Remark 9.4.4, p.206. Exact node locators and own-word matches remain in the packet and reader. PDF hashes and edition information are recorded there.

Also read the [published BCGP paper](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), pp.426–427 and 461–465, to check the flatness and polarization issues against the version of record. This review does not claim to have compared every page of the published paper with arXiv. Its other locators refer explicitly to arXiv pagination.

For Lemma 10.4.6 read the authors’ [Magma files at commit 8a274357327de5c326f6d1887998f2d6c5207659](https://github.com/fcale75/abeliansurfacesmagmafiles/tree/8a274357327de5c326f6d1887998f2d6c5207659): README, CharPolyFakeElliptic and its output. These provide computations for their displayed model, not an enumeration eliminating every possible quadratic CM extension. No Magma run is claimed. Independent exact discriminant and finite-field calculations are described in finding 10.

No source excerpt is included. Other literature cited by BCGP remains an input requested from its mathematical owner; this report does not certify having independently proved all those external theorems.

## Findings and corrections

1. **Separate residual lattices, semisimplification and self-twists.** In AP.0 require a prime-to-p polarization when using the integral symplectic structure on A[p]. A CM representation splits into Hecke characters only after all its CM endomorphisms are defined. The product example assumes its elliptic factors are automorphic; a noncuspidal GL_4 transfer does not preclude an endoscopic cuspidal GSp_4 representation. For an arbitrary continuous modular representation Chebotarev identifies its semisimplification, not a nonsplit representation itself. A quadratic character can be a self-twist, so the negative test now excludes the self-twist group. Weight-two reconstruction needs the symplectic pseudocharacter and perfect alternating pairing, not just a line in the exterior square. Sources: BCGP18 Definitions 9.1.1, 9.1.6, 9.1.8 and Remark 9.1.9, pp.249–251; BCGP25 Theorem 1.8.17, pp.13–14.

2. **Repair false tests rather than weaken definitions.** For the neat-level negative test take R=Q=∅ and hyperspecial level everywhere, including p; deleting one auxiliary level alone need not destroy neatness. Replace the incorrect rank test for duality over a finite group ring by C=[O —λ→ O] in cochain degrees 0,1: H⁰RHom(C,O)=O/λ, whereas Hom(H⁰C,O)=0. This catches dualizing H⁰ prematurely. Sources: Lemma 7.8.3, p.212, Lemmas 7.8.5–7.8.6, pp.213–214.

3. **Keep local–global compatibility and descent at the correct degree.** Theorem 7.9.4 gives a unique strict deformation class; its matrix representative depends on the frame. The Klingen splitting uses both choices of ordinary unit root and Chebotarev, killing the two relevant off-diagonal entries. Proposition 7.9.8 supplies the all-degree comparison for partial localizations, then descent of the final module after RHom⁰ and H⁰. It does not justify the previous all-degree maximal-ideal localization assertion. The AutomorphicBundles B5 request is narrowed accordingly. Sources: Theorem 7.9.4, pp.218–220; Proposition 7.9.8, pp.222–223.

4. **Unresolved defect-one flatness is a separate target.** Added AP.3/patched-flatness, tagged with this review id, and made patched-mcm depend on it. For defect zero freeness over S∞ proves O-flatness. For defect one a square presentation does not exclude λ-torsion: S∞/λ is a counterexample. The action cannot be passed to the maximal O-flat deformation-ring quotient before that flatness is known; its dimension cannot supply the missing support bound circularly. The MCM node is unverifiable. The gap is propagated through multiplicities, lifting and potential modularity, and stage coverage is corrected. Source: Proposition 7.11.2 and equation (7.11.1), arXiv p.226; published pp.426–427; compare Remark 7.3.17. This confirms the existing extraction finding E125, rather than claiming a newly discovered theorem counterexample.

5. **Use the precise cycle and rank inputs.** Generic rank equals the eigenspace fibre dimension only at the smooth point under the MCM hypothesis (Lemma 7.13.8, p.231). The multiplicity comparison needs coefficient-one special-fibre components, Propositions 7.4.17(1) and 7.4.21, and nonzero χ-specialization modulo λ followed by Nakayama; these are now explicit proof steps and a precise local-deformation request. Added the direct dependency used by regular-weight dimensions. Sources: §§7.12–7.13, pp.227–235.

6. **Complete analytic continuation and character descent.** The descent trace is normalized by the degree: G=(deg q)⁻¹q_*F, with F=q*G after the correspondence argument, and the required operators at different places commute. The connected-component argument uses proper projections, Ekedahl–Oort superspecial strata and Kottwitz–Rapoport incidence; it is not an assertion that one dense open automatically meets every component. Poineau’s shrinking-neighbourhood comparison is requested explicitly. Uniqueness of a similitude ratio uses irreducibility after restriction to ker ψ. The twisted lifting proof distinguishes χ̄′=χ̄ from equality of lifts and records the local and total-realness conditions on square roots. Sources: Lemmas 8.2.3–8.2.5 and Corollary 8.2.2, pp.237–243; §8.3; Theorem 8.5.2, pp.248–249.

7. **Do not replace a semilinear image by an unjustified split extension.** AP.6/big-image now uses the normalizer model N={(A,±τA)} and its index-two extension without claiming a splitting. The adjoint calculation uses the twisted tensor constituent. Tidiness is checked in the full multiplier fibre; a claimed central element of order three cannot serve in a group whose scalar symplectic centre has order two. Also distinguish automorphic “weight 0” from Weil purity weight one. The CM endomorphism field need not be totally real. Source: Proposition 9.2.1 and Lemma 9.2.2, pp.253–255; extraction correction of the real-multiplication inert case.

8. **The p–q switch needs its whole level and a compatible polarization.** In twisted Siegel moduli restrict to odd n≥3 and describe the selected Weil-pairing component. At a residue-characteristic prime use the finite-flat primary level, not an étale rank-four module. Set V=ρ̄_A,p ⊕ ρ̄_q, so V∨=A[p] ⊕ ρ̄_q∨. The local point must realize both primary parts. Prime-to-pq polarization degree does not make the given A principally polarized. Theorem 9.2.8 uses A to obtain a point of a space identified with principal-polarization moduli, and no compatible replacement is supplied. AP.6/potential-modularity is therefore unverifiable; this new proof obligation is source issue E2, confirmed against published p.464 and Definition 9.2.3, p.461 (arXiv pp.255,257). A repair can use a torsion-preserving principally polarized local replacement, or fixed-type moduli with connectedness and the required ordinary local points. The theorem is not asserted false.

   The fixed-determinant auxiliary-extension proof is also expanded: use a generically free regular representation, twist the determinant cover U/SL₂→U/GL₂, retain determinant trivializations for SL₂-conjugacy conditions, and impose auxiliary Frobenii split in the avoidance field. Jordan’s lemma must force SL₂ after restriction to that field, which proves the required intersection. A finite torsor alone is not the parameter variety. The main switch now writes the residual q-adic representation with its missing bar. The positive real trace-discriminant difference used to strengthen Chebotarev is recorded. Sources: Proposition 9.1.12, pp.252–253; Lemmas 9.2.6–9.2.7 and Theorem 9.2.8, pp.255–258.

9. **Keep the local seed theorem distinct from the 2018 residual hypothesis.** Correct the 2025 labels: 9.3.6 is a corollary and 9.3.5 a remark. A product seed does not become a Jacobian by the direct smooth-curve lifting remark. Use its point on P(ρ̄), a Kisin neighbourhood preserving 3-torsion, mod-2 action, ordinarity and characteristic-zero unit roots, and intersect the dense Torelli open. The curve can have bad reduction although its Jacobian has good reduction. For elliptic traces −1 and 2, a₁=1,a₂=4 at p=3: ordinary, but a₁²−4a₂=−15 is divisible by 3. Thus distinct characteristic-zero roots in BCGP25 do not imply distinct residual roots in BCGP18. Added light Lean examples exposing this distinction. Sources: BCGP25 §9.2.1, p.192, Lemma 9.3.4, Remark 9.3.5, Corollary 9.3.6 and Lemma 9.3.7, pp.200–203.

   In the fixed-torsion and infinity arguments distinguish geometric PSp₄(F₅) monodromy from arithmetic multiplier descent, recover Sp₄ using commutators, and retain the dense Torelli open. Infinitely many modular examples need infinitely many choices of the required residual local data; the two scalar seeds alone do not prove this. In the dihedral auxiliary construction require p>2. In the mod-five quartic construction require positive nonsquare d with X⁴−d irreducible and check disjointness using ramification at 5. Sources: Lemmas 7.5.25–7.5.27, pp.205–208; Theorems 10.1.4, 10.2.1 and 10.2.6, pp.266–274.

10. **Make the final applications honest.** The paramodular comparison now imports Faltings directly. The motives argument requests the motivic-realization form of Fontaine–Mazur, a weight-one Hodge realization, countability and descent of the isogeny class, Weil restriction, Tate and Albert classification with the necessary polarization and square-characteristic-polynomial inputs; a bare invocation of conjectures is not a proof sketch. Kummer cohomology also needs a Shioda–Inose correspondence for the asserted extension. The Hasse–Weil check distinguishes the whole zeta function (reflection d+1−s) from H¹ of a curve or its Jacobian (2−s). Sources: Corollary 2.8.7, pp.37–38; §9.4, pp.261–264; Lemmas 10.3.1–10.3.2, pp.274–276.

   The explicit quaternionic node remains unverifiable. Independent rational arithmetic in Q(√−6), computing the 11×11 Sylvester determinant, confirms a₅=−240−96√−6 and the corrected discriminant in Lemma 10.4.6, p.280. Direct enumeration over F₁₁ and F₁₂₁=F₁₁[u]/(u²−2), counting the infinity points too, gives:

   | √−6 mod 11 | Sextic coefficients, constant first | #C(F₁₁) | #C(F₁₂₁) | Frobenius polynomial |
   | --- | --- | ---: | ---: | --- |
   | 4 | 0,9,8,10,2,3,3 | 8 | 158 | (X²−2X+11)² |
   | 7 | 4,4,3,6,10,1,8 | 10 | 164 | (X²−X+11)² |

   Recover the quartic using t=12−#C(F₁₁), b=(t²+#C(F₁₂₁)−122)/2 and X⁴−tX³+bX²−11tX+121. These check the source’s two reductions, p.281. They do not prove exact geometric endomorphism algebra D. That needs the candidate quadratic CM-extension list and inert-prime nonzero-trace witnesses; the linked authors’ code does not contain that certificate, and its displayed model is different. Expected Lemma 10.4.4, p.278, also needs its real-point construction and the residual-image-to-open-image/centralizer proof. Those obligations are requested and retained as a gap.

## Baseline and ownership audit

All 17 baseline entries were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed. The packet records the module of every entry and the date checked. `Equiv.Perm` is an abbreviation, corrected from a definition. The following checks fix their intended strength and conventions:

| Declaration(s) | What the citation supplies and its limits |
| --- | --- |
| NumberField.IsTotallyReal; NumberField.InfinitePlace | Totally real hypothesis and infinite places, not the later automorphic archimedean theory. |
| Field.absoluteGaloisGroup | Absolute automorphism group with Krull topology. |
| Matrix.J; Matrix.symplecticGroup | Block form (0,−I;I,0) and the submonoid satisfying AJAᵀ=J. It does not supply the GSp similitude group scheme. |
| Nat.Prime; Polynomial.Monic | Prime and monic predicates; no finite-field trace-existence theorem. |
| Module.Free; Module.Finite; IsLocalRing | Separate module and local-ring hypotheses, not finite freeness or complete Noetherian structure automatically. |
| ringKrullDim | Dimension valued in WithBot ℕ∞; finite numerical dimensions still require the Noetherian/dimension inputs in the proof. |
| Equiv.Perm; alternatingGroup | Permutation groups and the alternating subgroup; no identification Sp₄(F₂)≅S₆ automatically. |
| TauCeti.AlgebraicGeometry.AbelianVariety; .dim | Proper geometrically integral group object and scheme dimension (WithBot ℕ∞). Principally polarized moduli are not supplied. |
| TauCeti.schurMultiplier | Coefficient-dependent H²(G,k×), not integral H₂(G,ℤ). Clarified the baseline description and coefficient comparison in the odd-theta proof. |
| TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff | Requires FaithfulSMul k× V and trivial cohomology class; rescaling criterion, not a precomputed PSp₄ multiplier. |

Read the reviewed library audit and the current read-only TauCetiRoadmap main at `0d144d0` and Tau Ceti library at `a91d3aa`, including the newer LocalGaloisGroups, ProfiniteArithmetic, OrthogonalSpinGroups and IntegralLattices boundaries and the relevant ModularForms/RepresentationTheory plans. OrthogonalSpinGroups already plans split Sp₄ through the dimension-five Clifford model; it is not a new target here. No GSp₄ modularity-lifting, higher Hilbert–Siegel Hida complexes or paramodular theorem is thereby supplied. Existing Chebotarev, Jacobian, curve, elliptic-curve and induction/projective-representation layers remain direct imports. No read-only tree was modified or built.

Checked supplier statements and kept each extension a request instead of a duplicate target. In particular ArithmeticGaloisRepresentations G7 explicitly owns the GSp₄ vast/tidy/adjoint conventions (not its general GLₙ enormous definition); PELModuli M5 already has arbitrary polarization type, and M6 supplies universal objects, level maps and the descent distinction between an object and a coarse point. The proposed repair must add the particular connectedness and local points needed here, not replan those moduli. DeformationAndDerivedPatchingAlgebra P9 supplies codimension/amplitude and support transport with explicit dimension and action assumptions; it cannot prove the missing arithmetic flatness. Its requested BCGP cycle comparison remains an extension contract. The generic conjecture register of MotivesAndAlgebraicCycles MC.7 does not supply the whole specialized type-II fourfold argument.

The 89 requests are explicit contracts, not 89 independently established supplier theorems. Existing higher-Hida/Coleman, Hilbert–Siegel, coherent-Hecke, GSp₄-local and open-image shortfalls remain named in the eight gaps. The request and coverage reference to the affinoid pseudocharacter extension now consistently names IntegralHeckeAndGaloisDeterminants IHG.0–IHG.4 rather than a stale LanglandsParameterStacks stage. Stage-level `requires` lists were synchronized with the actual node imports; ordering AP.0 through AP.7 remains unchanged. No ownership was moved to a higher tier or duplicated from current upstream.

## API, tests, granularity and companion

All 18 definitions/constructions retain at least three discriminating tests. Reviewed all 127 API items against their uses and all 71 tests for plausible wrong definitions. The changes above repair false tests and strengthen the full-level moduli constructor. The 31 planets remain mathematical definitions, constructions or named theorems; the new diagnostic flatness obligation is not presented as a proved named theorem or a new planet. Target-level granularity is retained; the only added node isolates a logically necessary missing theorem rather than splitting a routine proof.

The suggested Lean file stays a statement companion over carriers available at the pins. It has no sorry-defined data, no fabricated Hida or deformation carriers, and no claimed formalization of the large targets. Added ordinary-but-not-residually-distinguished scalar-seed checks and corrected the documentation of `hasseWeilCentre`, retaining its existing name and d+1 body. The reader was regenerated from the corrected node statements, proof routes, APIs, tests, requests and gaps and checked for the remaining stale labels. Its whitespace changes separate tables and lists correctly.

## Per-node disposition and complete field-change inventory

The table lists every node. Field names record all changes relative to the submitted design; the findings above explain the mathematical changes. The precise revised statements and locators are in the packet and reader. Unchanged fields are intentionally not copied here.

| Node (after AP.) | Verdict | Changed node fields |
| --- | --- | --- |
| AP.0/abelian-surface-system | corrected | hypotheses |
| AP.0/automorphic-compatible-system | corrected | tests |
| AP.0/automorphic-abelian-variety | corrected | tests |
| AP.0/modular-gsp4-representation | corrected | proofSteps, tests, statement |
| AP.0/weight-two-galois | corrected | proofSteps |
| AP.1/standing-hypotheses | verified | none |
| AP.1/deformation-problems | verified | none |
| AP.1/tame-levels | corrected | tests |
| AP.1/weights | verified | none |
| AP.1/hecke-modules | corrected | tests |
| AP.1/finite-free-balanced | verified | none |
| AP.2/doubling-surjections | verified | none |
| AP.2/hida-hecke-galois | corrected | prerequisites, proofSteps, statement |
| AP.2/ordinary-weight-two-corollary | verified | none |
| AP.2/taylor-wiles-descent | corrected | proofSteps |
| AP.3/patching-datum | verified | none |
| AP.3/patched-flatness | added | entire added target; addedBy recorded |
| AP.3/patched-mcm | unverifiable | hypotheses, prerequisites, proofSteps |
| AP.4/lifting-hypotheses | verified | none |
| AP.4/eigenspaces | corrected | acceptance |
| AP.4/iwahori-multiplicities | verified | none |
| AP.4/doubling-injection | verified | none |
| AP.4/regular-weight-dimensions | corrected | prerequisites |
| AP.4/multiplicity-theorem | corrected | prerequisites, proofSteps |
| AP.5/analytic-continuation-descent | corrected | sources, prerequisites, proofSteps |
| AP.5/connected-components | corrected | proofSteps |
| AP.5/gluing-theorem | verified | none |
| AP.5/automorphy-of-rho | verified | none |
| AP.5/solvable-descent | corrected | proofSteps |
| AP.5/main-lifting-theorem | verified | none |
| AP.5/twisted-ordinary | verified | none |
| AP.5/twisted-lifting-theorem | corrected | proofSteps |
| AP.6/galois-types | corrected | hypotheses |
| AP.6/non-challenging-automorphy | corrected | proofSteps |
| AP.6/big-image | corrected | acceptance, proofSteps, statement |
| AP.6/good-primes | verified | none |
| AP.6/good-prime-density | corrected | proofSteps |
| AP.6/twisted-siegel-moduli | corrected | proofSteps, api, uses, hypotheses, acceptance, tests, statement |
| AP.6/fixed-determinant-extensions | corrected | proofSteps |
| AP.6/pq-switch | verified | none |
| AP.6/potential-modularity | unverifiable | prerequisites, proofSteps |
| AP.6/gl2-quadratic-galois | corrected | prerequisites |
| AP.6/potential-automorphy | verified | none |
| AP.6/hasse-weil-genus-two | corrected | acceptance |
| AP.6/genus-one-quadratic | verified | none |
| AP.6/kummer-surfaces | verified | none |
| AP.7/ordinary-surface-modularity | verified | none |
| AP.7/residual-modularity-cases | verified | none |
| AP.7/dihedral-crossing | corrected | hypotheses |
| AP.7/mod-five-quadratic | corrected | proofSteps, statement |
| AP.7/odd-theta-cover | corrected | proofSteps, tests |
| AP.7/local-three-seeds | corrected | sources, title, acceptance, proofSteps, statement |
| AP.7/fixed-three-torsion | corrected | prerequisites, proofSteps |
| AP.7/infinitely-many-modular | corrected | proofSteps |
| AP.7/paramodular-lemma | corrected | prerequisites |
| AP.7/paramodular-conjecture | corrected | prerequisites |
| AP.7/motives-conditional | corrected | proofSteps |
| AP.7/fake-surface-examples | unverifiable | sources, acceptance, prerequisites, proofSteps |

Non-node changes comprise the source/version records and computation source; all baseline verification dates and the two clarified baseline entries; refined supplier requests; coverage statuses and remaining lists; the flatness, polarization and computation gaps; both reviewed source issues; the top-level review inventory; synchronized stage imports/descriptions and reader; and the Lean examples/documentation. No unrelated file is edited.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/AbelianSurfacesPotentialModularity.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/AbelianSurfacesPotentialModularity.lean`: exit 0 at the pinned Mathlib; only expected `sorry` warnings. The file imports Mathlib, not Tau Ceti; Tau Ceti declarations were checked in source at their pin.
- `scripts/check_errata.py`: passed on a temporary `errata-v1` wrapper containing this packet’s identical sourceIssues and sourceVersions. The errata tool requires that protocol wrapper; no extra errata deliverable was added.
- Exact discriminant and finite-field enumeration checks described in finding 10 passed. They are finite arithmetic checks, not certificates for the omitted CM exclusion.
- JSON parsing, unique node/review ids, internal dependency acyclicity, test counts, reader synchronization, permitted-path scope and `git diff --check` checked before submission.

## Questions and repair criteria for the orchestrator

1. Route a mathematical revision of defect-one flatness to this design and the relevant patching/local-deformation owners. Require an argument before the flat quotient is used, for both character versions. A restatement of Proposition 7.11.2 or balancedness is insufficient.
2. Select and prove a polarization-compatible p–q local realization, then update its PEL contract and main switch. The current principal-polarization point is unavailable for a general prime-to-pq-polarized surface.
3. Require the finite CM-extension elimination certificate for Lemma 10.4.6 and the missing real-point/open-image arguments for Expected Lemma 10.4.4 before accepting the final application. The discriminant and both primes above 11 are already independently checked.
4. Keep the supplier Part II and Deuring/Kummer gaps assigned explicitly. They are not fixed by this review and are not evidence of a completed formalization.
5. The queue also contains duplicate review #907 and duplicate design #3472 for this same roadmap (original design #905). Please reconcile those queue aliases; this worker claimed only #3485 and makes no label/issue-state changes.

A further review can start at these three unverifiable nodes and the revised supplier contracts. None of the unresolved arguments is silently assumed by this report’s verified or corrected entries.
