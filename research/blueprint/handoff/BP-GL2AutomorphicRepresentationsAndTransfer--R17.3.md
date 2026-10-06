# BP-GL2AutomorphicRepresentationsAndTransfer--R17.3

Agent: Codex. Session: codex-CcaPB4. Issue: [#734](https://github.com/CBirkbeck/tauceti-explorer/issues/734).

## Submission status

Complete **target-level planning pass**, not a checkpoint and not a closed blueprint. Exactly the assigned stages R17.3, R17.4, R17.5 and R17.6 are in scope. Each target has a declaration, source passage, proof outline, acceptance checks and direct prerequisites. Every new definition/construction has uses, a named API and at least three discrimination tests. All implementations are unchecked.

| Measure | Count |
|---|---:|
| Declaration nodes | 55 |
| Definitions | 1 |
| Constructions | 6 |
| Theorems | 33 |
| Comparisons | 7 |
| Applications | 8 |
| API items | 33 |
| Unit tests | 28 |
| Planets | 20 |
| Read baseline declarations | 7 |
| Explicit gaps | 7 |
| Open supplier requests | 25 |
| Stages planned / closed | 4 / 0 |

All four coverage records are `planned`. Closure requires resolving the gaps and requests, supplying the canonical automorphic/arithmetic interfaces, and checking the proof dependencies against those interfaces. Further proof refinement belongs to the lemma-level pass; this issue requested target-level granularity.

## Deliverables

- [Packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json): authoritative machine-readable statements, ownership, API, tests, sources and closure obligations.
- [Reader](../readmes/GL2AutomorphicRepresentationsAndTransfer--R17.3.md): conventions and full declaration-by-declaration plan, supplier requests, correction and source-version records.
- [Suggested Lean](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.3.lean): 55 declaration prototypes, 33 named API lemmas and 28 test examples identified by their packet names.

## Binding ownership and red-team findings

The base/title and narrowed ownership come from the live accepted `data/restructure/RS-21.result.json`, independently reviewed as REV-RS-21 and accepted on 29 September 2026. The pending correction to the research proposal does not supersede that accepted version. The roadmap extends `tauceti:TauCetiRoadmap/ModularForms`.

- R17.3 imports quaternion ramification parity from ClassFieldTheory Layer 14. It retains global JL, the norm-character exception, local/split-Hecke comparisons, multiplicity one, rational-model conditions and definite/indefinite analytic transfer. Geometry is exported to R18/R22.
- R17.5 imports generic projective factor sets/linear lifting from InductionRestriction Layer 7 and the pinned Tau Ceti zero-class theorem. It owns arithmetic obstruction vanishing, continuity/finite image and Artin automorphy. The generic carrier is not recreated.
- R17.6 imports the exact R15 Hasse, Deligne–Serre, true-eigenform and residual-witness nodes. Wiese's missing auxiliary-level independence/descent and stabilization formulations are requested from R15.2; the existing R15.1 form nodes and R15.2 q-expansion principle are reused directly.
- RT-AREA-automorphic-1/1: propose R17.4a for the adjoint GL3 lift, cubic character induction, GL3 recognition and nonnormal cubic transfer. Generic GL3 converse, uniqueness and pole inputs belong to a single AL extension after AL.3, specialized by R16.5. A nonnormal cubic extension is not a solvable Galois prime-cyclic tower.
- RT-AREA-automorphic-1/11: record R16.4 → R17.3 and R16.5/R16.6 → R17.5.
- RT-AREA-automorphic-1/12: record R17.3 → R18.3, reaching R18.4 without a reverse geometric dependency.
- RT-AREA-langlands-2/4: record R17.4 → R19.2, reaching R19.4/R19.5. **Carayol's extraordinary dyadic local comparison consumes Artin automorphy.** Its node therefore belongs to R17.6 and has a separate R17.6 → R19.2 export. It is excluded from the proposed R17.4a Artin prerequisites. Weak cubic-transfer existence and this strong local comparison must remain distinct to avoid a cycle.

## Source and mathematical boundaries

Fifteen public source versions were downloaded; the packet records URLs, access date, SHA-256 and the sections actually read. It distinguishes published versions from author scans/preprints. The Pan source is arXiv:2209.06366v1, not a claim to have read the published 2026 version. CDN20/CDN23/Pan supply the source-specific global JL applications. BCGP's published proofs identify the residual solvable-image consumer and its separate ordinary weight-two adjustment.

The reader and packet preserve these boundaries:

- A local quaternionic character is allowed; a global reduced-norm character is outside the cuspidal JL bijection. Badulescu–Renard's extended residual branch is distinguished from classical local JL.
- Equality of rationality fields does not remove a Schur/descent obstruction. Cohomological coefficient conjugation is not asserted for arbitrary Maass or weight-one forms.
- The prime-cyclic cuspidality exception is quadratic. Cuspidal output has a distinct prime-degree twist fiber; the dihedral noncuspidal output has a unique cuspidal descent. Isobaric character pairs allow independent kernel twists.
- Solvable descent requires compatible successive automorphic choices. A descending Galois representation alone does not supply those choices.
- Tate vanishing uses discrete Q/Z with trivial action; it does not vanish fixed mu_n cohomology or the Brauer group. Arithmetic projective lifting does not by itself preserve a prescribed residual representation.
- Tetrahedral determinant matching removes cubic ambiguity. Quadratic determinant matching cannot identify the octahedral descent; Tunnell's comparison is required.
- Totally real odd Artin forms have parallel weight one with the appropriate infinity parameter, outside a dictionary restricted to cohomological discrete series of weight at least two.
- Rohrlich–Tunnell's exact level/trivial character applies to the determinant-normalized linear-dihedral representation and only its stated discriminant cases. Its technical Fourier conditions are retained. Scalar twisting back recomputes level and character.
- Wiese's general odd lift does not promise unchanged conductor. Exact odd-conductor Katz weight one when unramified at two includes exceptional parameters, without a same-level classical weight-one lift. General minimal-weight/level lowering is not an elementary consequence supplied here.
- Hasse powers preserve q-expansions but require the integral/cohomological lifting criterion before Deligne–Serre. Stable lattices, coefficient places and full characteristic polynomials remain in the witness.
- Compatible-system exports take the family as data and require one matching finite-order character for every coefficient place. Prescribed extensions and family existence belong to their downstream owners.

## Seven gaps and actionable closure work

1. **GL3 analytic supplier.** Extend AL after AL.3 by the precise n=3 converse, both dual analytic conditions, full twisting set, strip bounds, functional equations, central character/convergence assumptions, isobaric strong multiplicity one and Rankin–Selberg constituent/pole recognition. The read Cogdell coauthor survey states the converse; its generic proof and recognition interfaces require the owning plan.
2. **JPSS nonnormal cubic proof.** Obtain *Relèvement cubique non normal*, C. R. Acad. Sci. Paris Sér. I Math. 292 (1981), 567–571, and the analytic proof it invokes. Carayol's consumer statement was read; the original construction and unrestricted all-place upgrade were not obtained. Do not prove it by cyclic-tower iteration.
3. **Tunnell 1981 octahedral proof.** Obtain Bull. AMS (N.S.) 5 (1981), 173–175. AMS endpoints refused access and the Project Euclid legacy endpoint did not return the PDF. Read the argument distinguishing the two quadratic descents and its all-place hypotheses. Carayol/Rogawski–Tunnell support the theorem statement, not a replacement original proof.
4. **Clozel globalization.** Supply the precise limit-multiplicity prescribed-supercuspidal theorem identified by CDN20 §5.2.1 footnote 21. Retain global central-character twist, finite coefficient extension and admissible tame/infinity data. AS.6's general trace engine does not supply this exact existence statement.
5. **Tunnell 1978 primitive globalization.** Obtain the globalization input cited in Carayol §12.2.2, with finite-image primitive Weil parameter, specified completion, cubic global extension and unramified-twist handling. The consumer local argument was read. This is distinct from the preceding Clozel input.
6. **Serre reduction-preserving lift.** Obtain the relevant Durham 1977 weight-one/Galois-representation argument (Theorem 4 and lifting discussion), or a primary complete proof with the same totally real, p>2, irreducible/solvable hypotheses. BCGP cites it but does not prove the prescribed-reduction step. Tate plus algebraic factor-set trivialization alone is insufficient.
7. **Compiled supplier interfaces.** Complete the requested R16/R17 local/trace interfaces, R01 conductor/classification/recognition, totally real weight-one dictionary and the exact continuous-cohomology/global-character interfaces. Replace the provisional Lean type parameters and operations by canonical supplier carriers, and restore every condition identified as omitted. No prototype signature is a theorem for arbitrary parameters.

The packet gives all 25 requests with their exact consuming nodes. The reader reproduces them, so the next worker needs no scratch files. Resolve the R15.2 Wiese independence/descent request from Proposition 7 and Corollary 8, with coprime N,m and a coefficient ring containing 1/(Nm) and (Nm)-th roots of unity. Prove independence of the auxiliary level structure before applying descent; matching q-expansions alone is not an arbitrary level-descent theorem.

## Source correction

Packet `sourceIssues` E1 records a misprint in the published Rohrlich–Tunnell PDF, p. 307: the sentence assigning nu=3 to case (iii) should name case (iv). The four cases and the following proof give nu=2 in case (iii) and nu=3 in case (iv). The corrected statement is used. The MSP article/PDF and a correction search revealed no linked corrigendum on 6 October 2026. This does not alter the source's theorem or require a roadmap correction.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json --index <pinned declaration index>`: **zero errors, zero warnings**. The index belongs to the shared pinned baseline, not a newly created project.
- `lean-check research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer--R17.3.lean`: **exit 0; 116 placeholder-proof warnings, no other warnings/errors**. Memory was checked before compilation. Only exact-pin Mathlib modules were imported; the newer shared Tau Ceti build was not substituted for the Tau Ceti pin.
- Every packet declaration/API/test name matches the suggested file. Seven construction/definition blocks have all 33 API signatures and 28 named example comments. There are 116 declarations/examples, all with placeholder proofs.
- Current atlas stage edges plus all packet cross-stage prerequisites and proposed links: **acyclic**, 3,548 edges across 1,371 stages including the final exact R15 node imports.
- All four scope/coverage IDs are exact. Planet counts per assigned layer are 4, 6, 5 and 5. JSON, allowed paths, relative document links and whitespace were checked before submission.

No atlas, upstream roadmap, supplier packet or other worker's files are changed. Independent review should verify the source-sensitive conductor/Fourier computations and the unresolved original-proof boundaries before accepting the plan. Scratch downloads and extracted text are not required by this handoff and are removed after the pull request opens.
