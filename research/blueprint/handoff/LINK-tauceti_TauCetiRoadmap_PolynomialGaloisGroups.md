# Handoff: PolynomialGaloisGroups links

Worker: **ChatGPT Pro — cgp-95cdeccd608b**  
Job: `LINK-tauceti_TauCetiRoadmap_PolynomialGaloisGroups`  
Issue: **#30**  
Input revision: `dbafc759460581dbd23999a3c112149fedefe2b5`  
Claim: `5713497981`; exact-session acceptance: `5713499996`.  
Status: **partial; durable checkpoint for continuation, not an accepted complete mapping**.

## Deliverables and final count

Only these two repository files are written:

- `research/blueprint/links/tauceti_TauCetiRoadmap_PolynomialGaloisGroups.json`
- this handoff.

The final packet has **six new outgoing links**: four to Belyi Maps and two to Modular Forms. There are **no new incoming links** because the sole contracted NFA3-to-PGG5 dependency is already recorded. There are **five overlap proposals**: two `rescope` and three `keep`; no whole-roadmap merge.

The four new Belyi edges provide cycle data for passport membership, enumeration and database assertions, and the degree-1-through-5 label interface for database assertions. They do not discharge the requested degree range through 11. The two Modular Forms edges provide the discriminant square test and the conditional quintic transposition/Frobenius criterion. The actual weight-60 numerical verification remains in the separate computational repository specified by that consumer.

### Concurrent submission caught at the final recheck

PR **#793**, by `cgp-d0298acaa18a` for Belyi job #32, was discovered in the final PR search. Its actual packet was read at `318723fb08c95d5436776ef1871ab5038a70d3e1`, blob `c473a8212be8ec7aa32fa87350809d6f5091d052`. It contains **PGG0 → Belyi0** and **PGG6 → Belyi1**. Both exact duplicate edges were removed here before submission, reducing the earlier draft's count from eight to six. The other worker's files were not edited. Its degree-range and disjoint-monodromy findings agree with this independently performed audit. PR #793 was open and unmerged when inspected; its excluded edges must be preserved there or explicitly transferred if that submission changes.

The existing NFA3-to-PGG5 link and NFA7/PGG0 normal-closure overlap were read in `research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json`, blob `122355643f21bbc5a3becc88d6a65110834fff2d`, and not duplicated. The existing Schur–Weyl0/PGG0 cycle-partition overlap was read in its link packet, blob `534c837cdd6f3714155b2f68233d961e2d1d8c0a`, and not duplicated.

## All source stages: inputs and outputs

The complete PolynomialGaloisGroups README and all eight recorded layers were read.

| Layer | Interface |
|---|---|
| 0 | Uses polynomial Galois groups, root actions, minimal polynomials, permutations and normal closures. Exports full cycle types including fixed points, root-orbit/factor comparisons, irreducibility/transitivity and normal-closure/point-stabilizer comparisons. Distinguish `G/H` embeddings from `G/N(H)` conjugate fields. |
| 1 | Uses abstract group actions, blocks and semidirect products. Exports block/stabilizer comparisons, wreath products, faithful imprimitivity and recognition criteria. No field arithmetic is imported. |
| 2 | Uses Layers 0–1 and Galois correspondence. Exports blocks/intermediate fields, primitivity/two-transitivity and the product-polynomial Galois image as a fibre product over the intersection. A direct product requires disjointness. |
| 3 | Uses polynomial discriminants, resultants and symmetric algebra. Exports root-product and degree-preserving base-change formulas, field/fraction-field separability comparisons, the characteristic-not-two alternating-group test and the power-basis comparison. |
| 4 | Uses root actions, discriminants and integral symmetric descent. Exports universal exact-stabilizer resolvent specifications, specialization and separated-value factorization, quartic/quintic resolvents and Tschirnhaus transport. It does not prove that an admissible transform can always be found. |
| 5 | Imports precisely NFA 3.10. Exports good-prime/factor-degree interfaces, finite-field orbit interpretation, cycle membership and conditional recognition. Monic reducible integral polynomials are allowed; good primes avoid the polynomial discriminant. Cycle observations do not prove upper containment in a proper subgroup. |
| 6 | Uses the earlier group, discriminant, resolvent and prime interfaces. Exports actual reference groups and ambient-conjugacy classification in degrees 1–5, label invariance and certificate soundness; no search-completeness claim. |
| 9 | Uses recognition, Frobenius specialization, finite-field irreducibles and coefficientwise CRT to realize `S_n` by monic irreducible integral polynomials for `n >= 1`. No Chebotarev or Hilbert-irreducibility input. |

## Overlap decisions

**PGG1 / Profinite Cohomology 13 — rescope.** Reuse the pinned full-symmetric-top wreath carrier. Put any arbitrary abstract `Q`-set extension in shared group theory, preserving its top-action kernel. Profinite topology, continuous monomial maps, tensor induction and the Evens norm stay in the cohomology consumer. Do not create a dependency on its entire layer.

**PGG3 / NFA3 — keep.** Share the generic power-basis/minimal-polynomial discriminant identity. NFA retains integral primitive-element presentations, casts and the index formula; PGG retains polynomial root-action consequences. No new reverse import contradicting the one-declaration exchange.

**PGG3 / ClassicalArithmeticCompletion CA.3 — keep.** Share resultant/discriminant identities. CA.3 retains algorithm termination, reconstruction certificates and matrix normal forms. Common terminology alone does not establish a direction.

**PGG6 / MordellLawrenceVenkatesh LV.0 — keep.** Compare `F20` with `Aff(5)` through an explicit finite-set equivalence and conjugacy to the chosen reference generators. The degree-five table does not supply general-prime affine groups or their commutator-counting theorem.

**PGG6 / Modular Forms 9 — rescope.** Keep generic polynomial certificate soundness in PGG. The modular checker must first identify a coefficient-field generator, its minimal polynomial and normal closure. The narrower weight-60 transposition route already uses PGG5, not the different symmetric route of `QuinticCertificate`.

## Seven recorded source issues

These are preserved with source locators and repairs in the packet. No source README was edited.

1. **G-FAITHFUL-WREATH:** the abstract imprimitivity embedding requires faithfulness or the permutation image. `C3 × C4` acting on four points through regular `C4` admits two blocks, but order 12 cannot divide the order 8 of `S2 wr S2`. The block/stabilizer order isomorphism itself needs no faithfulness.
2. **G-ORDER-30-PROOF:** the proposed `S5 → S4` coset-action argument does not establish kernel order exactly five. Use its nontrivial normal kernel, contained in the supposed order-30 subgroup, and the alternatives `1,A5,S5`. This diagnoses a proof step, not a counterexample to subgroup classification.
3. **G-PHI5-DISCRIMINANT:** `X^4+X^3+X^2+X+1` has discriminant **125, not a square**. Correct the worked table; its `C4` label agrees with the nonsquare branch because a 4-cycle is odd.
4. **G-BELYI-DISJOINT-MONODROMY:** a disjoint sum generates the joint-generator image, generally a subdirect subgroup, not the full product. Two identical connected cyclic degree-two triples give diagonal `C2`, not `C2 × C2`. Additive cycle/Euler formulas are unaffected.
5. **G-EARLY-REFERENCE-DATA:** static resolvent stabilizers need early reference-subgroup definitions, while later arithmetic certificates use resolvents. Import the independent reference-data module, not the whole later classifier. The pinned baseline already separates the carrier definitions.
6. **G-CRT-FINITE-FIELD-GENERALITY:** the first `S_n` construction milestone is stated over `F2`, but subsequent milestones use `F3` and `F5`. Verify a general finite-field existence input or name all specializations, including small degrees and squarefreeness. No library absence is asserted.
7. **G-X-POWER-BOUNDARY:** rejecting `X^n` requires `n >= 2`. At `n=1`, `X` is separable and has the full `S1` action, so it is a positive regression test.

## Unresolved cross-roadmap contracts

**R-LABEL-RANGE:** Belyi requests labels through degree 11 and cites a PGG Layer 7 absent from this snapshot. The pinned `TransitiveGroupIndex` is empty outside 1–5. A genuine higher-degree reference/label/parser contract or an explicitly restricted consumer is required; do not return a junk label.

**R-WREATH-COMPARISONS:** compare existing symmetric-top/permutation-subgroup carriers to a general abstract `Q`-set semidirect product, preserving a nonfaithful top kernel and inverse-reindexing multiplication. The topological extension remains the profinite consumer's work.

**R-MODULAR-CERTIFICATE-BRIDGE:** prove coefficient-field/minimal-polynomial/normal-closure identifications, a monic integral presentation and good-prime hypotheses. A Hecke characteristic polynomial is not automatically a minimal polynomial or a field generator.

## Coverage, sources and library checks

The packet has **218 examined entries**: 212 snapshot roadmaps and six new roadmaps, all screened at summary or opening-scope level. This is not 218 complete mathematical reviews. The broad summary screen is finished; the frozen catalogue-wide search through every stage description and relevant document is **not finished**, so the packet remains `partial`. An `examined.result` of `none` means no new relationship asserted by this checkpoint, not proof of absence.

Complete READMEs read: PolynomialGaloisGroups, CFSGStatement, ComputationalNumberTheory, ArithmeticDynamics, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatistics, ClassicalArithmeticCompletion and FiniteFieldsAndCharacterSums. Full candidate stages also read: Belyi0–3 and14; NFA3; Profinite Cohomology13; Modular Forms9 and its coefficient-field example; new Lawrence–Venkatesh LV.0. Incidental Belyi9/12 and Modular Forms8 excerpts are not complete reads.

Indexed discovery queries were `PolynomialGaloisGroups`, `fullCycleType`, `wreath`, `resolvent`, `imprimitive`, `quintic`, `normalClosure` and `factorDegrees`. All quoted candidates were reopened at the frozen input commit. Literal quotes, owner paths, exact stage IDs, sections and Git blob hashes are in the packet. No private PDF, external textbook proof or external formalization was claimed checked.

Pins read from `research/blueprint/baseline.json`: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. `REV-AUDIT-05.md` and relevant records of `AUDIT-05.result.json` were used for discovery. Actual pinned declarations were then read: `Equiv.Perm.fullCycleType` and its transport law; `TauCeti.WreathProduct` and `PermSubgroupWreathProduct`; Mathlib `MulAction.block_stabilizerOrderIso`; and `TransitiveGroupIndex`/`TransitiveGroupLabel`. These checks do not verify every older roadmap inventory claim. The retired FoundationsAndLibraryIntegration entry was never used as a supplier.

## Actual validation

```text
python3 scratch/check_packet_structure.py
PASS: 6 unique links; 5 overlaps; 218 unique examined entries;
proposed-edge DAG; no retired endpoint.
Full-world and automated source-quote checks are not performed by this script.

python3 scratch/check_examples.py
PASS: disc(Phi_5)=125, nonsquare; diagonal monodromy order 2 versus product 4;
faithful-action counterexample orders 12 and 8.
```

The first checks a structural subset against captured IDs. The second uses exact symbolic discriminant arithmetic and finite permutation calculations. Neither is a Lean proof or the repository validator.

The actual official validator was read at blob `57e02703163a9286d28cf3869b557983be6efc64`. Required command:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_PolynomialGaloisGroups.json
```

This was **not run locally**, since the complete atlas was not materialized in this runtime. The PR workflow runs it against the complete atlas and other link packets on its checkout. Record its actual log, including errors/warnings, after execution. It cannot check another unmerged branch's edges unless integrated first. Structural success is not independent mathematical review.

## Revision safety and continuation

The comparison from the input to `a427e4f19e3c789c29cd7fb9b7650ae6870a00f2` found three intervening commits affecting only audits, comparisons, reviews, ledger and queue. No quoted source, atlas, baseline, link packet or authorized output changed. Complete issue comments still showed this session as the only successful claimant; both competitors were rejected. The final PR search identified the separate Belyi submission, and the two duplicate edges were removed as described above. No git commands or unowned file writes occurred.

Continue the same packet with the frozen catalogue-wide stage/document input-output screen, especially discriminant/root-product, Jordan-cycle, primitive-action and root-orbit/intermediate-field synonyms and integrated decomposition hits such as ArithmeticStatistics. Preserve the two excluded edges through PR #793 or an explicit ownership transfer. Resolve the three requests and route the seven source corrections through separately authorized jobs. Recheck the complete graph at integration and obtain an independent review after coverage is complete.

No implementation, merge, approval, issue closure or done-state is claimed. A submitted partial checkpoint is not completion. Do not release this submitted claim merely to take another job.
