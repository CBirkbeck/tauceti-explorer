# Independent review: Gross–Zagier formulas and arithmetic heights, revision 2

Issue #7053 · `REV-GrossZagierAndArithmeticHeights--GZ.0~2` · Codex, session `codex-57X7se` · 10 October 2026.

**Verdict: accepted.** This is a completed independent review of the GZ.0–GZ.7 target pass, with corrections made in place. The packet has 243 targets: 211 verified, 30 corrected and two added. All 50 pinned baseline citations are confirmed. No unresolved mathematical contradiction was found in the corrected statements. Acceptance concerns the mathematical plan and its honest prerequisite and gap records. Every implementation remains unchecked, and no stage is closed.

## Counts and coverage

| Item | Result |
| --- | --- |
| Target nodes | 243: 25 definitions, 40 constructions, 2 lemmas, 7 comparisons, 169 theorems |
| Independent node verdicts | 211 verified, 30 corrected, 2 added |
| Baseline declarations | 50 confirmed; 45 inherited and 5 added; none removed |
| Supplier requests | 78 checked; one additional existing-period contract |
| Definition/construction API | 274 items across 65 definitions/constructions |
| Mathematical unit tests | 202; every definition/construction has at least 3 |
| Planets | 33 retained key definitions, constructions and named theorems |
| Source issues | 86 checked: 85 confirmed, E47 rejected |
| Explicit gaps | 10 retained and clarified |
| Stage statuses | GZ.0–GZ.7 planned; none closed |

The layer target counts are 17, 4, 17, 11, 6, 10, 68 and 110 respectively. Every coverage target is a node in its stated layer. The internal prerequisite graph is acyclic. Target-level proof sketches retain smaller routine steps rather than creating declaration-sized nodes. Non-routine inputs end at actual library declarations, precise supplier requests or the named gaps.

I read the original independent review, the revision handoff, all inherited target statements and hypotheses, the API and tests, the suggested file's written declarations and omission inventory, and the reader. The earlier mathematical corrections remain in force: degree-dependent Green equations, unsquared hermitian norms, relative field heights, trace versus probability average, effective PSL₂ representatives, signed negative-index divisor sums, the inert order congruence, connecting-ideal orientation, fibre multiplicities, different versus residue cardinality, and the nonzero auxiliary-place corrections. Earlier review objects and source decisions are preserved as history; the current verdict is separately identified.

## Main mathematical corrections

The classical finite self-intersection formulas needed one consistent convention at exceptional CM stabilizers. The new target `GZ.7/classical-modified-intersection` defines the modified automorphism pairing and its explicit tensor comparison to a chosen cotangent local symbol. The new `GZ.7/classical-tensor-global-decomposition` then recombines finite and complex terms using one global differential tensor and the product formula. Both are marked with this review's `addedBy` value.

For the discriminant tensor of weight six, the finite term is

\[
J_v=I_v^{\mathrm{GZ}}-\frac{r_A(m)}{r_x+6}\operatorname{ord}_{(v,x)}(\Delta),
\qquad r_x+6=6/u_x.
\]

The p-height aggregate sums these terms with the negative residue logarithm; the complex aggregate uses the matching eta-normalized limit. At the two level orientations this gives zero on the connected branch and the negative level contribution on the étale branch. The inert, ramified, split, level and aggregate formulas now use this convention. The ordinary-unit, prime-to-level eta corollary remains restricted. These corrections follow [Conrad, published version](https://library.slmath.org/books/Book49/files/05conrad.pdf), §9, (9.9)–(9.12), pp.126–127; Theorem 9.6, pp.129–130; Lemma 10.1 and Theorems 10.4–10.5, pp.131–139. The analytic parameter agrees with [Gross–Zagier](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II §5, pp.250–251. This supplies the missing mathematical dictionary while leaving the integral carrier realization explicit.

The starred torus integral was also incorrectly described as subtraction of divergent constant terms. The corrected arithmetic height kernel first probability-averages over a compact central idele quotient, then integrates over the torus quotient with its chosen measure. The normalized regularized average divides that result by `vol([T])=2L(1,η)`; with the additional finite-level and archimedean invariance hypotheses it becomes the finite-orbit average. A volume conversion API and discriminating test are now planned. The actual definition is in the [6 November 2011 YZZ draft](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), §1.6.7, (1.6.1)–(1.6.2), pp.34–35, together with the geometric kernel in §1.5.5, p.24, and §5.1.2, pp.183–184. Later spectral projection has its own prerequisites.

The weight-two projection formula now uses the factored Fourier expansion with `exp(2πimz)`, matching the `exp(−4πmy)` Mellin kernel in Gross–Zagier, Chapter IV §6, pp.295–300. The real-place s-dependent zero Whittaker formula specifies the standard Gaussian. The coefficient-valued height cites the draft's trace-dual construction in §1.2.4, p.15; character projection cites §1.3.1–2, pp.16–17, and preserves the inverse-character slot. Picard series, theta lifting and the good local identity have corrected version-specific pagination.

## Complete change ledger

The following records every changed or added target. Review metadata, source verdicts and history were synchronized separately on all targets.

| Target | Correction or addition |
| --- | --- |
| `GZ.6/classical-holomorphic-projection` | Corrected the factored Fourier convention in the weight-two projection formula. |
| `GZ.6/colmez-whittaker` | Specified the standard Gaussian for the archimedean s-dependent zero coefficient. Corrected the correspondence of absent Lean examples: normalizedWhittaker_standard_zero. The mathematical tests remain planned, and their actual-carrier gates are explicit. |
| `GZ.0/real-period-components` | Added the existing full-period supplier to the graph and distinguished the component comparison it does not supply. The numerical LMFDB citation now uses the accessible 37.a1 curve page rather than an unread knowl. |
| `GZ.0/height-convention-dictionary` | Reclassified the written elliptic comparison as a partial signature of the larger dictionary. The numerical LMFDB citation now uses the accessible 37.a1 curve page rather than an unread knowl. |
| `GZ.1/coefficient-valued-height` | Corrected the public-draft locator for the coefficient/character height. |
| `GZ.1/character-height-pairing` | Corrected the public-draft locator for the coefficient/character height. |
| `GZ.7/classical-modified-intersection` | Added the modified CM intersection pairing with five API items and three discriminating mathematical tests. |
| `GZ.7/classical-tensor-global-decomposition` | Added the global tensor comparison that justifies combining the modified finite terms with the eta-normalized archimedean terms. |
| `GZ.7/classical-new-hom-intersection` | Extended the new-Hom formula using its correct modified pairing, while retaining the restricted eta corollary. |
| `GZ.7/classical-inert-total-intersection` | Corrected the inert total formula to use the modified pairing at exceptional stabilizers. |
| `GZ.7/classical-ramified-total-intersection` | Corrected the ramified total formula to use the modified pairing at exceptional stabilizers. |
| `GZ.7/classical-split-total-intersection` | Corrected the split total formula to use the modified pairing at exceptional stabilizers. |
| `GZ.7/classical-level-intersection` | Included the discriminant correction in the level intersection formula. |
| `GZ.2/classical-p-height-sum` | Defined the p-height contribution by the modified pairing with its discriminant correction and added a level tensor test. |
| `GZ.7/classical-split-height-sum` | Propagated the tensor normalization into the split p-height sum. |
| `GZ.7/classical-inert-height-sum` | Propagated the tensor normalization into the inert p-height sum. |
| `GZ.7/classical-ramified-height-sum` | Propagated the tensor normalization into the ramified p-height sum. |
| `GZ.7/classical-finite-height-sum` | Specified the tensor-normalized convention of the aggregate finite height. |
| `GZ.7/classical-global-local-archimedean-sum` | Linked the archimedean aggregate to the same global tensor decomposition as the finite terms. |
| `GZ.7/cm-tensor-stabilizer-height` | Made the generic field explicit and replaced the missing pairing dictionary by explicit modified/global comparison nodes. |
| `GZ.0/heegner-unit-index` | Completed the unit-index proof chain using five additional pinned library inputs for the product formula, torsion criterion, parity and cyclotomic degree bound. |
| `GZ.6/cm-degree-zero-class` | Added an independently read public-draft source, preserving the separate unread 2013 edition. |
| `GZ.6/arithmetic-height-kernel` | Corrected the starred torus integral to compact central probability averaging, distinguished it from the normalized average by vol([T]), added a volume conversion API/test, and corrected the public-draft locator to §1.6.7 pp.34–35. |
| `GZ.6/incoherent-central-derivative` | Added an independently read public-draft source, preserving the separate unread 2013 edition. |
| `GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity` | Added an independently read public-draft source, preserving the separate unread 2013 edition. |
| `GZ.6/picard-generating-series` | Corrected the exact public-draft pagination and retained its stated normalization/hypotheses. |
| `GZ.6/arithmetic-theta-lifting` | Corrected the exact public-draft pagination and retained its stated normalization/hypotheses. |
| `GZ.7/good-local-arithmetic-identity` | Corrected the exact public-draft pagination and retained its stated normalization/hypotheses. |
| `GZ.0/x-height-canonical-height` | Replaced an inaccessible LMFDB knowl citation with the independently read 37.a1 generator/BSD page, retaining Müller–Stoll and the pinned code for the general height convention. |
| `GZ.2/arakelov-dualizing-metric` | Corrected the correspondence of absent Lean examples: arakelovDualizingMetric_genus_one, arakelovDualizingMetric_genus_two. The mathematical tests remain planned, and their actual-carrier gates are explicit. |
| `GZ.7/classical-inert-norm-ideal-map` | Corrected the correspondence of absent Lean examples: inertNormIdeals_nonzero. The mathematical tests remain planned, and their actual-carrier gates are explicit. |
| `GZ.6/classical-genus-sign-function` | Corrected the correspondence of absent Lean examples: rankinGenusSign_negative_index. The mathematical tests remain planned, and their actual-carrier gates are explicit. |

The definition API now includes the modified pairing and its cotangent, Hecke and discriminant comparisons. Its tests distinguish the ordinary-unit specialization, exceptional stabilizers and connected/étale level branches. The global comparison has direct tensor, product-formula, eta and integral-model prerequisites. The arithmetic kernel's new volume test distinguishes an integral from an average. All mathematical tests remain specifications where the real carriers are absent.

## Baseline, suppliers and existing upstream work

Every baseline declaration was read with its surrounding hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No inherited citation was removed or replaced. The five added inputs close the imaginary-quadratic unit classification proof chain:

- `NumberField.Units.sum_mult_mul_log`, `mem_torsion` and `even_torsionOrder`, in `Mathlib/NumberTheory/NumberField/Units/Basic.lean`, lines 138, 152 and 229;
- `IsPrimitiveRoot.lcm_totient_le_finrank`, in `Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean`, line 189;
- `Polynomial.cyclotomic.irreducible_rat`, in `Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean`, line 190.

The product formula forces every unit to have absolute value one at the single complex place. The torsion criterion and the finite cyclic torsion instances reduce the possibilities to roots of unity. The cyclotomic degree bound and parity give orders 2, 4 or 6, and the two exceptional quadratic fields follow. This is a proof plan using existing inputs, rather than a new universal finiteness assertion.

The period target now directly imports upstream EllipticCurves Layer 7's full real period. That supplier does not prove the identity-component comparison; GZ.0 retains it. The independently read [37a1 LMFDB page](https://www.lmfdb.org/EllipticCurve/Q/37a1/) supplies only the numerical convention check, rather than a general height or period theorem.

I checked the reviewed library audit and current read-only upstream roadmaps, including the nine additions absent from the atlas snapshot and the four Completed additions. Existing line-bundle, differential, lattice, orthogonal/quaternionic, intersection/model and Jacobian inputs retain their owners. No upstream checkout was modified or built. At TauCetiRoadmap `48cda9f` and current Tau Ceti `a91d3aa`, the height code now uses the **full x-height**. The pinned code uses half that height. The packet's factor-two pairing and `2^r` regulator dictionary is correct specifically at the pin; migration must use the current implementation and translate the convention. Both the historical text/code discrepancy and the current change are recorded in `upstreamNotes`.

All 78 requests were checked against the available supplier statements and consuming nodes. Where the supplier is narrower, the request names an extension instead of claiming the output exists. In particular R07.2 supplies perfect-field classification and still owes nilpotent deformation/endomorphism lifting; R14.6's current good-prime result still owes the bad-prime extension; HE.1's current scope excludes the two exceptional fields; and AF.5/AS.3 still owe the specified nonholomorphic kernel growth passage. A generic Jacobian does not supply the integral tensor comparison.

The five supplied red-team findings are reconciled as follows:

| Finding | Checked ownership and mathematical boundary |
| --- | --- |
| Automorphic 1/19 | MP.6 owns theta/Siegel–Weil/see-saw and the exact split Shimizu contraction. GZ.5 specializes its measures and periods. Ordinary convergence needs Witt index zero or `m−r>n+1`; split binary and boundary ternary cases keep regularization. The GQT residual-image identity alone is insufficient. |
| Iwasawa 1/3 | RP.0 owns general heights and RP.1 general descent. GZ.1 owns the Poincaré, coefficient and character specializations using A2's actual algebraic comparison nodes. |
| Iwasawa 1/12 | GZ.0 owns the convention dictionary; BSD consumers import it with its stated pin and scaling. The current full-height implementation is a migration input. |
| Iwasawa 1/17 | GZ.3 retains the exact Manin integrality and p-unit hypotheses, including source-dependent level/group restrictions. BSD and L3 consumer conclusions are not their own suppliers. |
| Algebraic geometry /26 | StableReduction Layers 1, 4, 5 and 7 supply general models, intersection and semistable infrastructure. GZ.2 owns admissible arithmetic specialization and gluing; TB.3 owns general graph analysis. |

## Source evidence and remaining gates

Every node has an independently checked public primary statement supporting its corrected mathematics. The inherited 25 citations to the 2013 YZZ publication remain explicitly unverifiable as edition-specific citations. They are historical, and each affected node has a separately identified public alternative. I did not acquire or read that publication and did not equate its pagination or digest with the 2011 draft. The public author versions of Yuan's bigness manuscript and the two Colmez errata likewise remain distinct from their unacquired publications. The packet records the actual editions, locators, inspected passages and acquisition evidence; it contains no source excerpts.

All 86 source issues now have this review's independent decision and an own-words mathematical reason. E47 remains rejected: the printed sufficient convergence half-plane is true, even though a stronger range can be proved. E50 is restricted to the independently established ordinary exceptional singularities for `p>3`, from [Edixhoven](https://www.numdam.org/item/10.5802/aif.1202.pdf), §1.1.3, pp.34–35; no complete `p=2,3` classification is asserted. The correction ledger retains the signed divisor sums, congruence and ideal orientation, different factors, zero Whittaker branch, nonzero S² terms and ordinary-derivative factorial. Historical erratum searches and previous verdicts are identified as previous records, not new searches by this worker.

Acceptance does not certify unread full proofs. The ten explicit gates retain the full Picard modularity and bad-place proof comparisons; unavailable arithmetic carriers; the genus-one resistance-measure argument; integral tensor realization; the historical definite theta comparison; half-weight/2-adic normalization; nilpotent deformation; distinct unread publication editions; geometric signature/test realization; and exact split Shimizu contraction. In particular the genus-one measure identity cannot be obtained by canceling `2g−2`, and GQT's formula modulo a residual image is not an exact contraction. These gates are precise and do not contradict the stated target-level acceptance conditions.

## Suggested Lean correspondence and validation

| Ledger | Typed | Algebraic fragment | Omitted |
| --- | --- | --- | --- |
| Target signatures | 6 | 75 | 162 |
| API signatures | 23 | 205 | 46 |
| Mathematical tests | 20 | 166 | 16 |

The full height dictionary includes a number-field comparison not supplied by its written elliptic theorem, so it is classified as a partial fragment. Five old test labels pointed only to omission comments: the two dualizing-metric genus cases, the standard zero Whittaker value, nonzero inert norm image and negative-index genus sign. Their correspondence is now omitted, with the actual missing carriers named. The retained algebraic fragments check their written operations; they do not instantiate missing geometric constructions. False universal scalar signatures removed by the original review have not been restored. All 243 targets, 274 API names and 202 mathematical test names agree across packet, reader and Lean ledger; every claimed written declaration and retained example was checked against the file body.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.0.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.0.lean`: full file elaborated at the pinned build, exit 0, 443 `sorry` warnings and no errors or other warnings. Memory was checked before sequential compilation; no language server, build, update or cache command was used.
- Final structural checks: exact layer target sets; acyclic local prerequisites; current verdicts on every node, baseline and source issue; all API/test names and actual written examples; at least three mathematical tests per definition/construction; no excerpt fields, private paths or control characters.
- Swarm file intake check and `git diff --check`: passed on the five authorized deliverables, including this job's handoff.

## Orchestrator handoff

No answer is required to complete this review. Preserve the 78 supplier requests, the ten proof/carrier/edition gates and the current-library normalization note when continuing the roadmap. Future geometric signatures must use real supplier carriers and instantiate the mathematical tests. Later GZ layers and whole-roadmap packaging remain separate jobs; this review changes no stage to closed and promotes no upstream work.
