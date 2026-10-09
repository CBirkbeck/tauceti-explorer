# Handoff: PKG-ClassicalSerreModularity~2

Completed by Codex, session `codex-DYQB0w`, for #7894 on 2026-10-09. This is a complete package revision, not a checkpoint. The claim bot confirmed this session’s claim. No second job was claimed. The prior independent review remains unchanged for the next independent reviewer.

## Revision and boundaries

- Review A: all 22 omitted API entries now have active declarations. Local characters live on the absolute Galois group of ℚ_N; induction, full stable lattices, residue embeddings and the linked global systems are explicit. Standard/adapted basis statements connect the original matrix computations to those representations. Full residual modules name their lattice; only semisimplification is lattice independent.
- Review B: all 32 packet test names label mathematical examples. Added actual level-one induction reducibility, the unnormalised induced image orders, lattice invariant dimensions, the prime-field trace obstruction, strict q>5, the lift alternatives, oddness of e=3 and the Steinberg/unramified-at-3 distinctions. The ownership-boundary test has an application of Paso 2 plus its boundary in prose; no example of `True` was manufactured.
- Review C: the ledger below maps all 81 targets to active declarations or, for the two dependency audits, the appropriate prose. It includes the classical prescribed-lift/ring/system contracts, the Dickson/A₅ and good-dihedral propagation clauses, the full auxiliary-prime choice, finite-flat exports, regular-system modularity, Artin realization and lattices, both weight-one forms and all modern system transitions. Frobenius-semisimplified WD isomorphism replaces literal equality. Paso 5’s new system has an unspecified regular weight, as in the source; Paso 6 accepts that weight.
- Review D: both bundled newform carriers now contain the actual pinned `HeckeRing.GL2.Newform`. Nebentypus is obtained from its character and coefficients from q-expansion. Only unavailable Galois attachments remain supplier stand-ins. The final compiler check exercises the Tau Ceti import.

The README retains every accepted target and the previous reviewer’s source-faithful corrections. Its Lean-policy paragraphs now describe the actual file. Statements are in our own words. Nothing is claimed formalised: supplier objects and theorem proofs use honest data-valued `sorry` stand-ins and `sorry` proofs. No packet, supplier, atlas file or review.json was edited.

## Inherited qualifications and plan wording

1. R26.4 still needs the imaginary-quadratic ordinary lifting extension: the current R21.5 theorem excludes that branch. The README and `level_one_lifting`/degenerate-branch documentation explicitly retain this required scope. This revision does not certify the existing supplier as having the extension or edit its plan.
2. The R32.6 globalisation audit remains partial. The README does not certify every modern lifting theorem’s independence from Serre modularity; Tung/CEG+16/EP/BLGG13 A.4.1/Gee 4.4.12 retain the inherited audit requirements. No logical dependency certificate was added. General irregular systems remain ML.1’s consumer target.
3. The packet’s rationality test overstates what inertness proves: degree-two coefficients do not alone prevent descent. The reader and example now say that descent is not supplied and use a trace outside the prime field as the actual obstruction. The packet is unchanged.
4. In the unnormalised-character test, μ_q×μ_q is the image of the induced representation restricted to the quadratic subgroup, not the image of the one-dimensional character. The README and example make that distinction; no packet was changed.
5. Corollary 8.1(ii)’s form space at q² allows a newform of level dividing q²; the suggested signature keeps that divisibility. It does not manufacture a newform of exact level q² from the source’s oldform-inclusive space.

No definitions moved between roadmap owners. `ImportedInterfaces` adapters cite R01/R04/R07/R08/R15/R24 rather than replan their mathematics. Current TauCetiRoadmap and current Tau Ceti were inspected read-only: LocalGaloisGroups owns `localCyclotomicCharacter` (Layer 0), LocalFieldsRamification the tame frame and ClassFieldTheory reciprocity. IntegralLattices concerns quadratic lattices and does not replace the stable p-adic lattice supplier. The existing induction and newform carriers are reused. The two full upstream README exemplars read were InductionRestriction and SemisimpleAlgebras; no upstream build was run.

## Source audit

The delicate signatures were compared with these public source passages, read in disposable scratch space. No private book was used. Savitt and the scanned Serre locators remain inherited from the accepted plan/review; this note does not claim a fresh scan audit.

| Source | Passages used | PDF SHA-256 |
| --- | --- | --- |
| [Khare, level-one preprint](https://arxiv.org/pdf/math/0504080v1) | Proposition 2.1 and the minimal weight-two condition, §2.2 pp. 11–12; Proposition 2.2 §2.3 pp. 13–15; Proposition 3.1 pp. 16–17; Lemmas 5.2–5.4 and Corollary 5.5 pp. 21–22; terminal rows §6.1 pp. 24–26 | `3012a51759ad10695792bc8a2d1af75890f38d6ebacd37fb61e01bfdb89c9c2f` |
| [Khare–Wintenberger I](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | Definition 2.1 pp. 4–5; lifting and almost-strict system definitions §§4–5 pp. 7–10; Lemma 8.2 and rationality pp. 17–18; dyadic proof p. 19; Theorem 10.1 and Artin export pp. 19–21 | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Böckle appendix](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf) | Theorem 1 p. 1; Proposition 1 p. 2, fixed/unfixed determinant counts; Lemma 1 p. 3, the decomposable flat local condition | `67de08f6a1958d6c350d6de0ad70839cc737cc14c9c3636ab68fb1bd638202de` |
| [Dieulefait–Pacetti v2](https://arxiv.org/pdf/2108.07577v2) | Theorems 1.4–1.9 pp. 4–6, Definition 1.10 and Remark 4 pp. 6–7; Lemmas 1.13–1.15 pp. 7–9; Pasos 1–2 pp. 10–11; Lemmas 2.1/2.3 and Pasos 3–4 pp. 11–13; Pasos 5–6 p. 14; characteristic-two closure p. 15 | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |

## Validation

- `lean-check research/blueprint/packages/ClassicalSerreModularity/Suggested.lean`: exit 0; 234 warnings, all `declaration uses sorry`; no errors or other warnings. Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Final suggested-file SHA-256: `cfb0e92d178e07a22d241c6cd5503cf736b211f593564314c0899af317dc721a`.
- `python3 scripts/check_blueprint.py` on each of R26.1, R27.3 and R33.5: zero errors and zero warnings.
- Coverage ledger verified: 81 targets, 38 named APIs and 32 named tests. Declaration entries were checked against active Lean commands, including generated structure projections.
- `python3 research/blueprint/intake.py check-files` on the four allowed deliverable paths: zero problems. `git diff --check`: clean.
- Metadata remains exactly `topic = "math.NT"`. README is 177,439 bytes, below the 200 KB limit. Only the README, suggested file and this handoff changed.

## Target-to-active-declaration ledger

All target IDs have prefix `ClassicalSerreModularity:`. All declaration names have prefix `TauCeti.SerreConjecture.`. Multiple entries reflect subsidiary clauses, not a text-label-only coverage check. The mathematical meaning is given in the corresponding README target and the declaration’s hypotheses. The two dependency audits stay prose; the eigenform/newform comparison is a mathematical equivalence with a signature.

| Target | Active declaration(s) or proof documentation |
| --- | --- |
| `R26.1/level-one-theorem-and-the-meaning-of-arises-from` | `level_one` (L309); `ArisesFrom` (L285) |
| `R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof` | `conductor_prime_weight_two` (L317) |
| `R26.1/bockle-appendix-minimal-deformation-ring-presentation` | `bockle_level_one_presentation` (L2100); `decomposable_flat_local_ring` (L2117); `bockle_minimal_r_equals_t_application` (L2579) |
| `R26.2/lifting-method-flatness` | `lifting_method_flatness` (L2130) |
| `R26.2/minimal-weight-two-lift` | `minimal_weight_two_lift_prescribed` (L1889); `MinimalWeightTwoLift` (L1875); `minimal_weight_two_lift` (L1863) |
| `R26.2/local-ring-at-q-smooth` | `local_ring_at_q_smooth` (L2151); `local_frobenius_quadratic` (L449) |
| `R26.2/nebentype-lift-at-q` | `NebentypeLift` (L1900); `nebentype_lift_at_q` (L1934) |
| `R26.2/compatible-system-lifts` | `compatible_system_minimal_weight_two` (L1943); `compatible_system_nebentype` (L1954) |
| `R26.3/chebyshev-next-prime` | `odd_auxiliary_prime` (L424) |
| `R26.3/serre-weight-twist` | `serre_weight_twist` (L1972) |
| `R26.3/weight-interval-containment` | `weight_interval_containment` (L434); `half_open_interval_residue` (L443) |
| `R26.3/level-one-induction-scheme` | `LevelOneUpTo` (L347); `LevelOneUpTo.mono` (L352); `levelOneUpTo_step` (L379) |
| `R26.4/local-reducibility-ordinary` | `local_reducibility_ordinary` (L1983) |
| `R26.4/level-one-lifting-lemma` | `level_one_lifting` (L1995); `level_one_change_characteristic` (L2002) |
| `R26.4/degenerate-branches` | `degenerate_foil_solvable` (L2161); `degenerate_unramified_foil` (L2168); `degenerate_return_solvable` (L2176); `scalar_bt_reducible_ordinary` (L2012) |
| `R26.5/small-weights-table` | `levelOneUpTo_eight` (L356); `levelOneUpTo_twelve` (L360); `levelOneUpTo_twenty` (L364); `levelOneUpTo_thirty` (L369); `levelOneUpTo_thirtyTwo` (L374) |
| `R26.6/level-one-proof-assembly` | `level_one` (L309); `levelOneUpTo_step` (L379) |
| `R26.6/corollary-1-2-proof` | `conductor_prime_weight_two` (L317) |
| `R26.6/finiteness-corollary-1-3` | `finite_level_one_semisimple` (L2336); `finite_level_one` (L336) |
| `R26.6/corollary-8-1-ii-and-the-statement-W1` | `corollary_8_1_ii` (L325); `hypW_one` (L693) |
| `R27.1/good-dihedral-prime-definition` | `IsGoodDihedralPrime` (L470); `IsLocallyGoodDihedral` (L483); `IsGoodDihedralRep` (L577) |
| `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved` | `good_dihedral_large_image` (L2393); `good_dihedral_preserved` (L2404); `isLocallyGoodDihedral_not_isSolvable` (L591) |
| `R27.1/dickson-and-the-dyadic-solvable-refinement` | `dickson_alternatives` (L2360); `projectiveSL_simple` (L2370); `dyadic_solvable_dihedral` (L2374); `dihedral_arisesFrom_optimal` (L2380); `cyclotomic_reducible_weight` (L2386) |
| `R27.2/hypotheses-Lr-Wr-and-Dr` | `HypL` (L630); `HypW` (L637); `HypD` (L644) |
| `R27.2/prime-gap-estimates-driving-the-weight-recursion` | `odd_auxiliary_prime` (L424); `dyadic_weight_bound` (L456) |
| `R27.2/theorem-3-2-weight-reduction` | `hypW_succ_of_hypL` (L689) |
| `R26.3/explicit-prime-counting-input` | `explicit_prime_counting` (L389) |
| `R26.3/next-prime-ratio` | `next_prime_ratio` (L398); `next_nonFermat_prime_ratio` (L406) |
| `R26.3/finite-auxiliary-prime-checks` | `finite_auxiliary_prime_checks` (L413) |
| `R26.4/ordinary-reduction-and-parity` | `ordinary_residual_distinguished` (L2018); `serre_weight_twist` (L1972); `MinimalWeightTwoLift` (L1875); `terminal_row_branch_contract` (L2026) |
| `R26.5/terminal-row-branch-contract` | `terminal_row_branch_contract` (L2026) |
| `R26.5/weight-eight` | `levelOneUpTo_eight` (L356) |
| `R26.5/weights-ten-twelve` | `levelOneUpTo_twelve` (L360) |
| `R26.5/weights-fourteen-twenty` | `levelOneUpTo_twenty` (L364) |
| `R26.5/weights-twentytwo-thirty` | `levelOneUpTo_thirty` (L369) |
| `R26.5/weight-thirtytwo` | `levelOneUpTo_thirtyTwo` (L374) |
| `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` | `lemma_8_2` (L610); `lemma_8_2_trace_eq_zero` (L619); `lemma_8_2_local_shape` (L2417) |
| `R27.1/good-dihedral-prime-insertion` | `classical_good_dihedral_insertion` (L2431) |
| `R27.3/theorem-3-1-killing-ramification` | `hypL_of_hypW` (L685) |
| `R27.3/theorem-3-3-initial-case` | `hypW_one` (L693) |
| `R27.3/double-induction-assembly` | `hypL_all` (L697) |
| `R27.3/d0-from-all-lr` | `hypD_zero_of_hypL` (L701); `hypD_zero` (L705) |
| `R27.4/auxiliary-characteristic-choice` | `classical_auxiliary_characteristic` (L2452) |
| `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice` | `raising_levels` (L716) |
| `R27.4/strong-form-by-minimal-lifts` | `arisesFrom_of_isModular` (L723) |
| `R27.4/theorem-1-2` | `kw_theorem_1_2_odd` (L729); `kw_theorem_1_2_two` (L735) |
| `R27.5/dyadic-weight-two-claim` | `dyadic_finite_flat_weight_two` (L2195) |
| `R27.5/d1-by-the-prime-three` | `hypD_one` (L766) |
| `R27.5/dr-for-r-at-least-two` | `hypD_of_two_le` (L770) |
| `R27.5/hypothesis-H-and-theorem-9-1` | `isModular_of_isSType` (L776) |
| `R27.6/full-classical-serre-theorem` | `serre_strong` (L796) |
| `R27.6/finite-flat-weight-two-export` | `finite_flat_cyclotomic_weight_two` (L2200); `finite_flat_weight_two_export` (L2207) |
| `R27.6/scope-of-the-final-statement-and-the-compatible-system-export` | `regular_compatible_system_modularity` (L2216) |
| `R33.1/dp-target-and-the-weight-at-least-two-convention` | `DP.serre_weak_odd` (L982); `IsModular` (L290) |
| `R33.1/dp-modularity-lifting-inputs` | `DP.modularity_lifting_odd` (L1704); `DP.modularity_lifting_two` (L1711); `DP.modularity_lifting_reducible` (L1718); `DP.modularity_lifting_three_terminal` (L1724); `DP.modularity_member_iff` (L1730) |
| `R33.1/fontaine-laffaille-member-not-bad-dihedral` | `DP.fontaineLaffaille_weight` (L1741); `DP.fontaineLaffaille_not_badDihedral` (L1734) |
| `R33.1/solvable-residual-termination` | `DP.solvable_residual_termination` (L1746); `DP.isModular_of_isSolvable` (L975) |
| `R33.1/paso-1-weight-two-system` | `DP.paso_one` (L1754) |
| `R33.2/dihedral-local-type-at-n` | `DP.levelTwoCharacter` (L1493); `DP.dihedralType` (L1514); `DP.dihedralType.standardLattice` (L1532); `DP.dihedralType_standardLattice_basis` (L1537); `DP.dihedralType_standardLattice_residual` (L1550); `DP.dihedralType_residual_semisimplification` (L1558) |
| `R33.2/dp-lift-existence-and-good-dihedral-insertion` | `DP.GoodDihedralInsertion` (L1668); `DP.exists_goodDihedralInsertion` (L1699) |
| `R33.2/lemma-2-1-large-image` | `DP.DihedralControl` (L1764); `DP.lemma_two_one` (L1777) |
| `R33.2/paso-3-killing-the-odd-level` | `DP.paso_three` (L1783) |
| `R33.3/dp-dyadic-transition-and-the-order-three-type` | `DP.orderThreeCharacter` (L1566); `DP.orderThreeType` (L1568); `DP.orderThreeType.standardLattice` (L1571); `DP.orderThreeType.adaptedLattice` (L1575); `DP.orderThreeType_adaptedLattice_basis` (L1579); `DP.orderThreeType_exists_lattice_reduction_iso` (L1630); `DP.typeChangeAtTwo` (L1790) |
| `R33.3/remark-6-weight-two-after-type-change` | `DP.remark_six` (L1797) |
| `R33.3/paso-4-removing-two` | `DP.paso_four` (L1804) |
| `R33.3/paso-5-killing-the-good-dihedral-prime` | `DP.paso_five` (L1811) |
| `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case` | `DP.terminal_five` (L1818); `DP.modularity_lifting_three_terminal` (L1724) |
| `R33.4/dp-odd-characteristic-assembly` | `DP.serre_weak_odd` (L982) |
| `R27.6/odd-artin-weight-one-modularity` | `odd_artin_weight_one` (L926) |
| `R27.6/artin-reductions-of-serre-type` | `ArtinRealisation` (L2227); `artin_realisation` (L2254); `artin_lattice_independence` (L2259); `artin_lattice_ss_independence` (L2266); `artin_reduction_invariants` (L2280); `artin_frobenius_density` (L2299); `artin_distinct_frobenius_reductions` (L2593); `artin_reduction_ker_eq` (L814); `artin_reduction_finrank_fixedVectors` (L821); `artin_reduction_isAbsIrreducible` (L832); `artin_reduction_conductor` (L842) |
| `R27.6/unramified-residual-representations-arise-in-weight-one` | `unramified_residual_weight_one_general` (L2309); `unramified_residual_arises_in_weight_one` (L854) |
| `R27.6/weight-one-reduction-is-onto-for-almost-all-primes` | `weight_one_reduction_bijective` (L870) |
| `R27.6/weight-one-descent-from-infinitely-many-primes` | `weight_one_descent` (L899); `weight_one_descent_galoisRep` (L910) |
| `R33.5/auxiliary-odd-prime-for-the-dyadic-system` | `DP.auxiliary_odd_member` (L1824) |
| `R33.5/dp-characteristic-two-closure` | `DP.serre_weak_two` (L987); `DP.auxiliary_odd_member` (L1824) |
| `R33.5/qualitative-serre-theorem` | `DP.serre_weak_odd` (L982); `DP.serre_weak_two` (L987) |
| `R33.5/globalisation-dependency-check` | README globalisation audit; no artificial certificate |
| `R33.6/modern-and-classical-modularity-agree` | `IsEigenformModular` (L2325); `eigenform_modularity_iff` (L2331) |
| `R33.6/strong-form-by-the-modern-route` | `arisesFrom_optimal_of_isModular` (L997) |
| `R33.6/two-routes-comparison` | README route/dependency comparison; no artificial certificate |
| `R33.6/elliptic-curve-export-via-either-route` | `weight_two_trivial_character_of_arisesFrom` (L1006); `finite_flat_cyclotomic_weight_two` (L2200) |

## API ledger

All 38 accepted API names are present as active definitions, theorems or generated structure projections. Prefix `TauCeti.SerreConjecture.` is suppressed.

| API name | Suggested.lean line |
| --- | --- |
| `IsGoodDihedralPrime` | 470 |
| `IsLocallyGoodDihedral` | 483 |
| `IsGoodDihedralPrime.inertia` | 490 |
| `IsGoodDihedralPrime.congruences` | 499 |
| `IsGoodDihedralPrime.conjugate` | 504 |
| `IsGoodDihedralPrime.q_sq_dvd_conductor` | 582 |
| `IsGoodDihedralPrime.locallyGood` | 509 |
| `IsLocallyGoodDihedral.exists_good` | 519 |
| `IsLocallyGoodDihedral.conjugate` | 504 |
| `HypL` | 630 |
| `HypW` | 637 |
| `HypD` | 644 |
| `hypL_imp_hypW` | 649 |
| `hypL_mono` | 652 |
| `hypW_mono` | 655 |
| `hypD_mono` | 658 |
| `DP.levelTwoCharacter` | 1493 |
| `DP.levelTwoCharacter_orderOf` | 1497 |
| `DP.levelTwoCharacter_artin` | 1505 |
| `DP.dihedralType` | 1514 |
| `DP.dihedralType_irreducible` | 1525 |
| `DP.dihedralType.standardLattice` | 1532 |
| `DP.dihedralType_standardLattice_residual` | 1550 |
| `DP.dihedralType_residual_semisimplification` | 1558 |
| `DP.GoodDihedralInsertion` | 1668 |
| `DP.GoodDihedralInsertion.system` | 1668 |
| `DP.GoodDihedralInsertion.type_at_N` | 1688 |
| `DP.GoodDihedralInsertion.congruences` | 1691 |
| `DP.GoodDihedralInsertion.modular_iff` | 1695 |
| `DP.orderThreeCharacter` | 1566 |
| `DP.orderThreeType` | 1568 |
| `DP.orderThreeType.standardLattice` | 1571 |
| `DP.orderThreeType.adaptedLattice` | 1575 |
| `DP.orderThreeType_standardLattice_reduction` | 1590 |
| `DP.orderThreeType_adaptedLattice_reduction` | 1596 |
| `DP.orderThreeType_exists_lattice_reduction_iso` | 1630 |
| `DP.orderThreeType_isCompatible` | 1639 |
| `DP.typeChangeAtTwo` | 1790 |

## Test ledger

All 32 accepted test names label `example`s. The prime-field test supplies an actual trace obstruction; the boundary test’s mathematical example is an insertion application. Lattice tests include the one-/two-dimensional invariant assertions. Routine calculations retain actual proofs; representation and period-module tests may use `sorry` as the protocol permits.

| Packet test name | Suggested.lean label line |
| --- | --- |
| `goodDihedral_congruence_fails` | 530 |
| `goodDihedral_trivial_inertia_fails` | 535 |
| `goodDihedral_upper_endpoint` | 541 |
| `goodDihedral_basis_change` | 548 |
| `locallyGood_single_witness` | 554 |
| `locallyGood_trivial_inertia_fails` | 560 |
| `locallyGood_basis_change` | 566 |
| `hypL_imp_hypW_test` | 661 |
| `hypD_even_conductor` | 668 |
| `hyp_count_primes` | 672 |
| `hyp_dyadic_weight` | 679 |
| `residue_field_units` | 1047 |
| `level_two_q7_N13` | 1044 |
| `level_one_nonexample` | 2484 |
| `residual_trace_zero` | 1052 |
| `unnormalised_character` | 2491 |
| `residual_depends_on_lattice` | 1205 |
| `insertion_congruences_q13` | 1056 |
| `insertion_level_two` | 1056 |
| `insertion_needs_rationality` | 2501 |
| `insertion_q_gt_5` | 2510 |
| `insertion_not_general_lift_owner` | 2519 |
| `insertion_crystalline_needs_weight_two` | 2530 |
| `order_three_level_two` | 787 |
| `ramification_index_three` | 2537 |
| `steinberg_nonexample` | 2546 |
| `needs_unramified_at_3` | 2553 |
| `standard_lattice_relations` | 1189 |
| `adapted_lattice_change_of_basis` | 1195 |
| `adapted_lattice_nonsplit` | 1205 |
| `standard_lattice_nonexample` | 1214 |
| `split_case_standard_lattice` | 1219 |

## Remaining work

No package work remains after successful final checks. The next step is independent review; inherited supplier/audit work above retains its owning roadmaps. Source files and compiler logs are disposable and are deleted after the PR opens. This note records the durable receipts, contracts and result; there is no scratch dependency for the next worker.
