# Independent review of K3BlochGroups V.5

Accepted as a complete **target-level planning pass** on 2026-10-05. V.5 is planned, with five explicit gaps and three supplier requests. It is not closed. Every target has a source-backed refinement or an existing supplier; all implementation statuses remain unchecked.

Reviewer: Codex, session `codex-NT7QyO`, job `REV-K3BlochGroups--V.5`, issue #6400. The reviewed pass was written by a different session. This review follows the blueprint and expansion protocols, the upstream guide, and the Algebraic Topology and Global Number Fields upstream roadmaps.

## Counts and verdicts

| Item | Result |
| --- | --- |
| Nodes | 18: 4 applications, 8 theorems, 5 constructions, 1 comparison |
| Per-node verdicts | 17 corrected, 1 verified, 0 unverifiable |
| Nodes added / removed | 0 / 0 |
| Baseline declarations | 10 confirmed; 0 removed or replaced |
| Construction API | 21 items after adding one compatibility signature |
| Construction tests | 15, three for each of five constructions |
| Planets | 6, within the layer limit |
| Source findings | 2 existing errors confirmed; 3 public-copy misprints added and confirmed |
| Coverage | One stage planned; no stage closed |

The packet's `review.checked` records a separate source, dependency and convention assessment for every node. “Corrected” includes clarification of a hypothesis list that previously contained a conclusion or construction command. The mathematical target statements remain intact.

## Changes made

1. Replaced or clarified 17 hypothesis lists with the actual field, characteristic, coefficient, basis and supplier assumptions. The number-field product-image hypothesis was already appropriate and remains verified.
2. Added the precise `K2SymbolsBrauer:T.2/k2-finite-field` and `T.2/matsumoto` prerequisites to finite indecomposable specialization. The imported parent vanishing node's statement is right, but its proof attributes finite K₂ vanishing to the coarse T.5 stage. The direct T.2 suppliers now make the intended route explicit without editing another packet.
3. Added `K3BlochGroups:V.2/k3-to-h3-sl-field` to stabilization. That existing node already identifies the stable elementary and special linear groups over a field and gives the Hurewicz kernel. Updated the proof route and narrowed the corresponding gap to naturality/localization, Sah's algebraically closed comparison and the filtered-colimit passage. Updated `coverage.remaining` to agree.
4. Added the actual `Matrix.SpecialLinearGroup.map` prerequisite to stabilization and the finite Bloch construction for their naturality APIs. Added `finiteStabilization_hurewicz` to the construction API and suggested Lean file. Its compatibility equation fixes the actual stabilization composite and its normalization, in addition to naturality and localization uniqueness.
5. Added direct prerequisites for the Cartan comparison's stabilization, K₃–Bloch map, CGZ convention comparison and tensor map. Its hypotheses now explicitly include the quadratic extension and chosen basis.
6. Added `K3BlochGroups:V.3/three-c-angle-minus-one` to the real detector and universal-class theorem. This is the existing exact supplier of the upper bound `6c=0`; the detector supplies the independent lower bound.
7. Corrected the Hutchinson source's publication metadata to **Journal of K-Theory 12(1) (2013), 15–68**, [DOI 10.1017/IS013003031JKT13222](https://doi.org/10.1017/IS013003031JKT13222). The checked mathematical locators refer to arXiv v2, as now stated explicitly.
8. Added review verdicts to E501/E502; added E503–E505 and the public copies/metadata actually checked to `sourceVersions`; added the complete top-level review object.

No lemma splitting is needed at the prescribed target granularity. The construction tests check characteristic torsion and small fields, kernels of the actual comparison maps, the Cartan identity/scalar/trace normalization, and Rogers values in all three real intervals. The extra Hurewicz API helps distinguish the actual stabilization map from an arbitrary cyclic-group isomorphism.

## Sources and source mistakes

Every node's locator and excerpt was checked in the public source version named by the packet. Downloaded hashes agree with the recorded source hashes. The public Weibel Chapters III, IV and VI supply the finite Milnor calculation, restriction/transfer and arithmetic applications. Hutchinson §§3,4,6,7 supply the finite homology and refined Bloch comparison. CGZ §4.2 and Lemma4.4 supply the local comparison consumer. Suslin's scanned pp219–220 were read visually, including the three-case inverse and positive-presentation kernel; Zagier pp23–24 fix the interval Rogers normalization.

- **E501, confirmed:** CGZ's [published author copy](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), p406, and [arXiv v3](https://arxiv.org/pdf/1712.04887v3), pp23–24, both assert the incorrect integral H₃ order. Hutchinson Cor3.6 gives the localized order, and Lemma3.14 gives characteristic torsion at precisely q=2,3,4,5,8,9,27. Within CGZ's scope, q=5 with n=3 has integral order120 rather than24. The odd-n comparison survives because n is prime to the characteristic.
- **E502, confirmed:** The same published paragraph identifies C¹ with H₃(C¹) canonically. A cyclic automorphism with exponent a acts on H₃ by a²; inversion already rules out naturality with the original cyclic group. A chosen-generator abstract isomorphism remains possible. The map used by this packet is induced by the actual Cartan inclusion. Inclusion of Cn into Cm has H₃ multiplier m/n; it can vanish after quotienting modulo n when n² divides m, so primitive-root torsion and quotient generators must be distinguished.
- **E503, confirmed misprint:** In Hutchinson's arXiv v2 proof of Cor3.3, p12, the congruence modulus should be4, as in the displayed statement and quaternionic period, instead of3.
- **E504, confirmed misprint:** In the proof of Cor3.13, p17, a nonzero fixed vector exists exactly when1 is an eigenvalue. Removing the negation restores the intended vanishing argument.
- **E505, confirmed and already corrected:** The [institutional author copy](https://researchrepository.ucd.ie/rest/bitstreams/18229/retrieve), proof of Lemma3.14 p18, cites Cor7.5 for the tensor/exterior coinvariant bound. [ArXiv v2](https://arxiv.org/pdf/1107.0264v2) correctly cites Cor3.13 at that step.

E503/E504 occur in both checked public copies. The journal page supplied bibliographic metadata and its abstract but did not provide accessible full text. These misprint findings are explicitly scoped to the copies read, with no assertion that they persist in the version of record. ArXiv history, the institutional copy, journal page and erratum/corrigendum searches are recorded; absence of a found erratum is not a claim of exhaustive absence. The misprints change no intended mathematical statement.

## Pinned baseline and audit

Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369** were checked at those commits. The ten cited Mathlib declarations exist and their statements provide the required carriers and maps:

| Declaration | Checked convention |
| --- | --- |
| `groupHomology` | Degree-three homology of the inhomogeneous chain complex of a representation |
| `groupHomology.map` | Covariant group homomorphism plus compatible coefficient morphism; the inclusion direction |
| `Rep.trivial` | Trivial representation on an actual coefficient module |
| `Matrix.SpecialLinearGroup` | Determinant-one matrices, here indexed by `Fin 2` |
| `Matrix.SpecialLinearGroup.map` | Entrywise ring homomorphism |
| `Algebra.norm` | Determinant of multiplication; the chosen two-element basis provides finite freeness |
| `LinearMap.toMatrix` | Matrix in domain/codomain bases, with the correct change-of-basis direction |
| `TensorProduct.map` | Induced tensor map of the two linear maps, used over ℤ |
| `ZMod` | Integer quotient for the positive moduli in the assertions |
| `AddCircle` | Quotient by integral multiples of the chosen real period π² |

The pinned searches and reviewed `data/library-coverage.json` audit support the recorded absence of Quillen/Milnor K-theory, Bloch groups and Rogers analysis. The packet only selects existing homology/matrix/norm/tensor/circle carriers. Its missing periodic finite-group homology is not claimed to follow from StableHomotopyKTheory H.6's K-spectrum coefficient scope.

## Suppliers and red-team findings

Exact supplier statements were read, including L.1's Quillen computation, Galois descent and transfer formulas; T.2's finite K₂ and Matsumoto nodes; T.2:symbols' degree≥3 Bass–Tate theorem; V.2's quotient, comparison and field Hurewicz theorem; V.3's Bloch conventions and c relations; V.4's configuration, enhanced Tor and infinite exact sequence; N.5's Soulé and real/totally-imaginary rows; and N.7's w-invariant. Global Number Fields Layer1 already supplies total-sign surjectivity. P.1's current stage does not yet state the requested normalized Rogers package, so the precise request remains necessary.

| Finding | Packet and reader outcome |
| --- | --- |
| RT-AREA-ktheory-2/13 | Actual finite Bloch, stabilization and Cartan maps are specified for HB.2. Integral characteristic exceptions, odd-n hypotheses and finite refined-chain boundary are explicit. No use of infinite configuration acyclicity for finite P¹. |
| /19 | Number-field Milnor signs come from the exact T.2:symbols node. Sign surjectivity represents any degree-three sign class by {−1,−1,d}, proving the product-image application. |
| /21 | Stable finite K₃, transfer, restriction and Frobenius are direct L.1 imports; V.5 develops their indecomposable/Bloch applications. |
| /22 | N.5/N.7 supply rational ambient groups. The existing N.8 integer/Gaussian nodes still point to V.5, as independently checked. The reverse dependency is recorded, not imported back; N.8's certificate and ownership correction remain requested. |

The reader gets all four findings right. Its source list still carries the old Hutchinson journal attribution, and its prerequisite catalogues omit the explicit edges added above. Its stable-SL gap also includes a bridge now supplied by V.2. The review issue authorizes the packet, suggested file and report, so these reader synchronizations are listed here for the assembly/owner rather than changing its unlisted file. Its mathematical statements and red-team outcomes agree with the corrected packet. The report is the durable record of these review corrections.

## Remaining work for the orchestrator

No blocking question remains for acceptance. Route the recorded boundaries to their owners:

1. Supply the general finite-group stable-elements, cyclic/quaternion periodic homology and cyclic functoriality package, with the proposed foundational PartII ownership.
2. Refine Sah's comparison and the filtered-colimit/naturality/localization bridge, using the already planned V.2 field Hurewicz theorem.
3. Refine finite square-class configuration chains, β-cycle comparison and the enhanced Tor arrow. `finiteBlochHom_cyclic_bar` remains explicitly unstated until this interface exists.
4. Obtain P.1's precise unshifted Rogers analysis and refine Suslin's positive-presentation descent.
5. Correct the N.8 reverse ownership before adding its edge into V.5, and supply the Gaussian w₂ certificate. Synchronize the reader's bibliographic/dependency details during assembly.

These are recorded input/refinement gaps, not unresolved contradictions in the stated targets. The existing `complete` packet status and `planned` stage status satisfy the protocol's target-level definitions; `closed` would be unjustified.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups--V.5.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/K3BlochGroups--V.5.lean`: exit0 at the pinned Mathlib baseline, only declaration-uses-`sorry` warnings. Memory was checked before the single permitted elaboration.
- `git diff --check`: passed.

Elaboration checks signatures and actual Mathlib carriers. Supplier K-groups, Bloch groups, symbols, localization and analytic inputs remain documented parameters; the file does not implement these objects or prove statements about arbitrary replacements. The explicitly commented cyclic-bar API is consistent with the recorded finite-chain gap.
