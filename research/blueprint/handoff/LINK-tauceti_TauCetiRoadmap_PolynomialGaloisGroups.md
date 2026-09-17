# Handoff: PolynomialGaloisGroups links

Worker: **ChatGPT Pro — cgp-95cdeccd608b**  
Job: `LINK-tauceti_TauCetiRoadmap_PolynomialGaloisGroups`  
Issue: **#30**  
Input revision: `dbafc759460581dbd23999a3c112149fedefe2b5`  
Claim: comment `5713497981`; exact-session acceptance `5713499996`.  
Status: **partial, submitted for preservation and continuation; not an accepted complete mapping**.

## Deliverables and result

The only repository outputs are:

- `research/blueprint/links/tauceti_TauCetiRoadmap_PolynomialGaloisGroups.json`
- this handoff.

The packet adds **eight outgoing links**, six to Belyi Maps and two to Modular Forms. It adds no incoming link because the sole explicitly contracted incoming dependency, Number Field Arithmetic Layer 3 to Polynomial Galois Groups Layer 5, is already recorded. It adds **five overlaps**: two `rescope` recommendations and three `keep` recommendations. No whole-roadmap merger is proposed.

The six Belyi links concern the full cycle-type API and its fixed points, relabeling, computation and database comparisons, and the low-degree reference-group/label API. The label links discharge **degrees 1 through 5 only**. Belyi's requested degree range through 11 is not supplied. The two Modular Forms links supply the polynomial discriminant test and the conditional prime-degree transposition criterion for the coefficient-field certificate interface. They do not perform the numerical weight-60 verification, which the consumer explicitly assigns to a separate computational repository.

## Stage inputs and outputs

All eight recorded source layers and the complete source README were read. Their interfaces are:

| Layer | Inputs and exports |
|---|---|
| 0 | Uses polynomial Galois groups, splitting fields, root actions, minimal polynomials and permutations. Exports full cycle types including fixed points; the root-orbit/irreducible-factor bijection; separable irreducibility/transitivity; and the splitting-field/normal-closure/point-stabilizer dictionary. Embeddings indexed by `G/H` are distinguished from conjugate subfields indexed by `G/N(H)`. |
| 1 | Uses abstract group actions, blocks, semidirect products and permutation theory. Exports block/stabilizer comparisons, wreath products, the faithful-imprimitivity embedding, Jordan's criterion and smaller recognition lemmas. No field arithmetic is imported. |
| 2 | Uses Layers 0–1 and Galois correspondence. Exports intermediate-field/block comparisons, primitivity and two-transitivity tests, and the product-polynomial Galois image as a fibre product over the intersection field. A direct product requires the corresponding disjointness hypothesis. |
| 3 | Uses polynomial discriminants, resultants and symmetric-polynomial algebra. Exports the root-product formula, degree-preserving base change, field/fraction-field separability comparisons, the characteristic-not-two alternating-group test, the discriminant quadratic extension and the power-basis comparison. |
| 4 | Uses root actions, discriminants and integral symmetric-polynomial descent. Exports universal exact-stabilizer resolvent specifications, coefficient specialization, the separated-value factorization theorem, the quartic and quintic resolvents and Tschirnhaus transport. It does not prove that an admissible transform can always be found. |
| 5 | Imports exactly NFA Layer 3.10's factorization-type/Frobenius-cycle theorem. Exports the canonical factor-degree and good-prime interfaces, the finite-field orbit interpretation, factorization-type membership and conditional recognition. Reducible monic integral polynomials are allowed; the hypothesis is on the polynomial discriminant. Observed cycle types do not prove containment in a proper subgroup. |
| 6 | Uses group-theoretic classification, discriminants, resolvents and prime evidence. Exports reference groups and ambient-conjugacy labels in degrees 1–5, polynomial label invariance and certificate soundness. No general search-completeness claim is made. |
| 9 | Uses generic recognition, Frobenius specialization, finite-field irreducible polynomials and coefficientwise CRT. Exports explicit monic irreducible integral realizations of `S_n` for `n >= 1`. The construction uses reductions at 2, 3 and 5, not Chebotarev or Hilbert irreducibility. |

## Overlap decisions and existing work

1. **PGG1 / Profinite Cohomology 13 — rescope the shared wreath carrier.** Reuse the pinned full-symmetric-top wreath product. Put any extension to an arbitrary abstract `Q`-set in shared group theory, retaining a nonfaithful top-action kernel. The profinite consumer still owns topology, the continuous monomial homomorphism, tensor induction and the Evens norm. This is not a dependency on its entire cohomology layer.
2. **PGG3 / NFA3 — keep the power-basis comparison shared.** The generic discriminant identity belongs below both. NFA retains the integral primitive-element presentation, casts and index formula; PGG retains the root-action and alternating-group consequences. Do not add a reverse import contradicting the one-declaration exchange.
3. **PGG3 / ClassicalArithmeticCompletion CA.3 — keep shared polynomial algebra.** Share resultant/discriminant identities; keep algorithm termination, matrix normal forms and reconstruction certificates in CA.3. Common terminology alone does not settle a dependency direction.
4. **PGG6 / MordellLawrenceVenkatesh LV.0 — keep the affine-group special-case comparison.** `F20` is the `q=5` instance of `Aff(q)`. Identify the actual embedded reference subgroup through an explicit `Fin 5`/finite-field equivalence and conjugacy. The degree-five table does not supply general-prime affine groups or their commutator-counting theorem.
5. **PGG6 / Modular Forms 9 — rescope generic polynomial certificates.** Keep polynomial certificate soundness in PGG; make the modular interface an adapter after identifying a coefficient-field generator, its minimal polynomial and the normal closure. The narrower transposition certificate used by the weight-60 example already comes from PGG5; do not force it through the different symmetric route of `QuinticCertificate`.

The existing NFA3-to-PGG5 link and NFA7/PGG0 normal-closure overlap were read in `research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json` (blob `122355643f21bbc5a3becc88d6a65110834fff2d`) and were not duplicated. The Schur–Weyl Layer 0 / PGG0 cycle-partition overlap was read in its existing packet (blob `534c837cdd6f3714155b2f68233d961e2d1d8c0a`) and was not duplicated either.

## Source issues and repairs

These are recorded in the packet's `gaps`. No source README was edited by this job.

**G-FAITHFUL-WREATH.** The generic imprimitivity embedding must assume a faithful action or use the permutation image. For a concrete obstruction, `C3 × C4` acts on four points through the regular `C4` action with two blocks, but its order 12 cannot divide the order 8 of `S2 wr S2`. The block/stabilizer order isomorphism itself needs no faithfulness; add the hypothesis only where injectivity requires it.

**G-ORDER-30-PROOF.** The proposed order-30-subgroup contradiction in `S5` asserts that the four-coset action has kernel order exactly five without establishing the image order. Replace that step by the sufficient facts: the kernel is nontrivial since `120 > 24`, is normal in `S5`, and is contained in the supposed subgroup of order 30. The normal-subgroup alternatives then contradict those facts. This diagnoses a proof step, not a counterexample to the classification.

**G-PHI5-DISCRIMINANT.** The quartic example `X^4+X^3+X^2+X+1` has discriminant **125, not a square**. Correct the worked table's square entry; its `C4` label is consistent with the nonsquare branch because a 4-cycle is odd.

**G-BELYI-DISJOINT-MONODROMY.** A disjoint sum of permutation triples generates the subgroup from the paired generators, generally a subdirect subgroup of the product, not the whole product. Two identical connected degree-two cyclic triples give diagonal `C2`, of order two, not `C2 × C2`, of order four. Additivity of cycle counts, degree and Euler characteristic survives; it does not require full-product monodromy.

**G-EARLY-REFERENCE-DATA.** Static resolvent stabilizers refer to `referenceSubgroup` data associated with Layer 6, while its later arithmetic classifiers use Layer 4. Avoid importing the whole later layer: isolate the early reference definitions and finite stabilizer identifications. The checked baseline already defines the reference data separately from the classification theorem.

**G-CRT-FINITE-FIELD-GENERALITY.** The `S_n` construction's first irreducible-polynomial milestone is stated only over `F2`; the next two use `F3` and `F5`. Cite and verify a genuinely general finite-field existence statement, or name all three specializations with their small-degree and squarefreeness conditions. The current specialized prerequisite does not discharge the other characteristics. No claim of library absence is made.

**G-X-POWER-BOUNDARY.** The negative regression for `X^n` needs `n >= 2`. For `n=1`, `X` is separable and has the full `S1` root action, so it satisfies the intended predicate. Add the positive degree-one test rather than excluding it.

The remaining cross-roadmap requests are **R-LABEL-RANGE**, **R-WREATH-COMPARISONS** and **R-MODULAR-CERTIFICATE-BRIDGE**. In particular, Belyi's reference to PGG Layer 7 does not name a recorded stage at this input. Its degree-6-through-11 parser cannot return an index of the pinned family, which is empty outside degrees 1–5. This is an unresolved contract, not an implementation detail.

## Coverage and provenance

The packet records **218 individually identified examined entries**: 212 snapshot roadmaps and six new roadmaps. Every snapshot roadmap received a summary or opening-scope screen, and every new roadmap received a summary screen. These are **unequal reading depths**, not 218 complete mathematical reviews. The broad summary screen is finished; the frozen catalogue-wide input/output search through every stage description and relevant document is **not finished**. Therefore `status` remains `partial`.

Complete source documents read: PolynomialGaloisGroups, CFSGStatement, ComputationalNumberTheory, ArithmeticDynamics, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatistics, ClassicalArithmeticCompletion and FiniteFieldsAndCharacterSums. Full candidate-stage reading additionally includes Belyi Maps Layers 0–3 and 14, NFA Layer 3, Profinite Cohomology Layer 13, Modular Forms Layer 9 and its coefficient-field worked example, and the new Lawrence–Venkatesh LV.0 stage. Incidental Belyi Layers 9/12 and Modular Forms Layer 8 excerpts are not counted as complete reads.

Repository-wide indexed discovery queries included `PolynomialGaloisGroups`, `fullCycleType`, `wreath`, `resolvent`, `imprimitive`, `quintic`, `normalClosure` and `factorDegrees`. Search hits were not treated as frozen evidence: every quoted candidate was reopened at the input commit. An `examined.result` of `none` means that this checkpoint asserts no new relationship, not that all relationships have been disproved.

Primary evidence consists of the roadmap passages themselves, with literal quotes, owner paths, stage IDs and section locators. The packet records their Git blob hashes. No private PDF, external book proof or external formalization was claimed checked. The exact example computations below supplement direct mathematical reasoning; they are not Lean proofs.

## Baseline verification

Pins read from `research/blueprint/baseline.json`:

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`

`REV-AUDIT-05.md` was read in full and the relevant polynomial-Galois records of `AUDIT-05.result.json` were read. They were discovery aids, not substitutes for reading declarations.

The actual pinned source statements read are recorded in `baseline.declarations`: `Equiv.Perm.fullCycleType` and its transport law in `TauCeti/GroupTheory/Perm/Partition.lean`; `TauCeti.WreathProduct` and `PermSubgroupWreathProduct` in `TauCeti/GroupTheory/Perm/WreathProduct.lean`; Mathlib's `MulAction.block_stabilizerOrderIso`; and the degree-limited `TransitiveGroupIndex`/`TransitiveGroupLabel` definitions in `TauCeti/GroupTheory/Perm/TransitiveGroupLabel.lean`. These checks establish those statements only, not every claim in the older roadmap inventory.

The retired `FoundationsAndLibraryIntegration` entry was screened as catalogue context but is never a supplier or link endpoint. No declaration was implemented, no Lean code was added, and `implementationStatus` remains `unchecked`.

## Validation

Actual local commands, run in the isolated scratch workspace:

```text
python3 scratch/check_packet_structure.py
PASS: 8 unique links; 5 overlaps; 218 unique examined entries;
proposed-edge DAG; no retired endpoint.
Full-world and automated source-quote checks are not performed by this script.

python3 scratch/check_examples.py
PASS: disc(Phi_5)=125, nonsquare; diagonal monodromy order 2 versus product 4;
faithful-action counterexample orders 12 and 8.
```

The first checks a structural subset against captured IDs, not the complete world. The second uses exact symbolic discriminant arithmetic and finite permutation calculations, not floating-point approximations or an asserted formal proof.

The current official validator was read at blob `57e02703163a9286d28cf3869b557983be6efc64`. Required command:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_PolynomialGaloisGroups.json
```

It was **not run locally**, because the complete atlas was not materialized in this runtime. The supported PR workflow runs it against the full atlas and the other link packets. Its **actual job log**, including the command, packet counts and errors/warnings, must be recorded after execution. A green check alone is not source validation, and structural checks are not independent mathematical review.

## Revision and claim safety

The pre-submission comparison from the input revision to `a427e4f19e3c789c29cd7fb9b7650ae6870a00f2` found three intervening commits affecting only audits, comparisons, review reports, ledger and queue. No quoted source, atlas, baseline, link packet or authorized output path changed. The complete issue comments still identified this session as the sole successful claimant; both competing claims were rejected. Only the two authorized files are written on the session-specific branch. No git commands were run.

## Remaining work

Finish the frozen catalogue-wide stage-description and document input/output screen, particularly the remaining discriminant/root-product, Jordan-cycle, primitive-action and root-orbit/intermediate-field synonyms. Inspect integrated decomposition hits such as ArithmeticStatistics rather than assuming their brief roadmap summaries settle them. Extend the same packet and preserve the existing IDs and ownership decisions.

Resolve the degree-range and coefficient-field adapter requests, and route the seven source corrections through separately authorized source-roadmap work. Recheck all link packets and the complete graph at integration time. Arrange an independent review only after the complete catalogue screen; this author is not its reviewer.

A durable partial submission preserves the work without declaring the job done. Do not release this submitted claim merely to take another job, and do not treat a merged checkpoint as mathematical acceptance.
