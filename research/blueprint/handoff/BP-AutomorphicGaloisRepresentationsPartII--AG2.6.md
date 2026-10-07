# Handoff: BP-AutomorphicGaloisRepresentationsPartII--AG2.6

Agent: Codex, session codex-XfFDY5. Refs #687.

The target-level pass is complete. Both AG2.6 and AG2.7 have coverage **planned**, not closed. The packet has 43 nodes: 22 theorems, 7 definitions, 7 constructions, 6 comparisons and 1 lemma. It contains 58 API items, 49 definition/construction tests, 11 planets (5 in AG2.6, 6 in AG2.7), 7 pinned baseline declarations, 17 precise supplier requests and 3 recorded gaps. Every node remains unchecked. The reader is approximately 11,500 words and specifies every definition, API and test. This is a completed planning pass with identified supplier refinements, not a claim of formal implementation or gap-free closure.

The nine checkpoint node IDs are preserved. The accepted RS-12 review dated 2026-10-01 is binding; its title is **Galois representations attached to regular algebraic automorphic representations of GL_n**. The former handoff's claim that RS-12 still needed changes is superseded.

## What is covered

AG2.6 covers the geometric coefficient-prime comparison, its restriction through projectors and algebraic twists, constant-Hodge-type families and cyclic descent, the two-boundary log-crystalline purity argument and full polarized comparison. It also includes the unrestricted nonselfdual CM coefficient-prime theorem and its monodromy bound, weak-compatible instances, embedding independence, complex/local coefficient conjugation, strong coefficient fields, purity/polarization, the totally real polarized branch, tensor-automorphy coefficient independence, exact R19 overlap, and the regular CG/Pilloni GSp4 branches.

AG2.7 covers finite p-adic realization before lattices, residual semisimple independence and polynomial reduction, Galois-type versus non-Eisenstein ideals, fixed-λ Hecke-ideal independence and dual/twist conventions. It distinguishes local ACC+ genericity, completely split generic primes, the existential global condition, and the stronger arbitrary-local-field CS condition. It includes infinitely many witnesses, transfer/ramified-twist qualifications, Liu's finite-exceptional residual genericity application, five distinct typed exports, and residual comparison with R19.

The exports are GoodPrimeExport, NonselfdualComparisonExport, PolarizedComparisonExport, UnitaryDiscreteExport and ResidualPolynomialExport. In particular the nonselfdual export includes the known de Rham/Hodge, ss WD and monodromy-bound outputs; it is not restricted to good-prime polynomials.

## Confirmed findings handled

- **RT-AREA-langlands-1/16.** The nodes `all-cm-de-rham-and-semisimplified-coefficient-comparison` and `nonselfdual-coefficient-prime-monodromy-bound` state A'Campo–Hevesi–Thorne–Whitmore Theorem 1.2.1 and Corollary 1.2.2, arXiv:2607.11763v1, explicitly an unrefereed July 2026 preprint. The statements impose neither residual irreducibility nor decomposed genericity. The source/proof records name quantitative Hecke annihilators via local Shimura cohomology and Mantovan's formula, bounded potentially semistable pseudodeformations with arbitrary residual multiplicities, and non-Siegel boundary/degree shifting. The exact remaining supplier extensions are a gap and restructuring proposals. The nonselfdual export includes their Hodge outputs. Varma's published §8.2 Jordan-block order is specified and requested from AG2.5; no full N equality is inferred from the bound.
- **RT-AREA-langlands-1/20.** No new compatible-system carrier is defined. The old extremely-weak definition node is now a comparison importing the exact R24.5 weak carrier, weakened-data predicates and branch predicates. The supplier nodes live in the early `R24.5:operations` substage. The stage-route check verified that these imports add no return path from AG2.6. Only the automorphic instances and branch-specific comparisons are constructed here.
- **RT-AREA-padic-2/22.** PadicHodgeTheory R06.5 supplies general geometric comparisons. Its modular-form application nodes are not imported. The higher-rank application is a node of AG2.6; the exact classical/Hilbert application is imported from R19.3/R19.5 with an explicit dual/twist dictionary. No R06.5 application to geometry constructed downstream is silently assumed. Its semistable general-comparison extension is requested precisely.

The historical density-one DGI conclusion is retained under its original ID as a comparison: modern weak compatibility implies very weak compatibility. Its older Fontaine–Laffaille proof is a downstream PA.1 consumer, not a reverse dependency. Similarly the CG ordinary filtration is requested from the p-adic Hodge supplier, rather than PA.1. Adding the packet's resolved direct stage routes to the atlas graph produces no new cycle. This avoids an IG.5/PA.1 consumer-to-construction loop.

## Remaining work and supplier boundaries

No stage is closed. The exact next refinement is to close these contracts, then elaborate the full dependent signatures:

1. PadicHodgeTheory R06.5: projector-compatible general semistable comparison; R06.2: the CH bounded constant-type family comparison; R06.4: the ordinary Newton/Hodge-equality filtration. Existing scalar period, good-reduction and ordinary-definition nodes are used where sufficient.
2. CrystallineCohomology CR.6, Part II: Caraiani's two-boundary log de Rham–Witt complex, residue realization of N and Theorem 4.6. AG2.1a supplies the actual tensor-square realization and projected closed-stratum concentration; WeightsInEtaleCohomology R34.6 supplies the pure monodromy inference. The gap is not replaced by a purity assumption on the final Galois representation.
3. The AHTW proof needs a designed local Shimura cohomology/quantitative-annihilator extension and a Local Galois Deformation Rings, Part II extension for arbitrary-multiplicity bounded p-adic Hodge pseudodeformations. Existing BunG/Newton and fixed-representation deformation scopes are only foundations. The packet records the missing bridge explicitly; it does not falsely cite the generic IG.5 concentration theorem as proving the unrestricted theorem.
4. ArithmeticGaloisRepresentations R01.1: countable local-field/Baire realization before the existing lattice theorem. R01.5: arbitrary-rank Chebotarev/Brauer–Nesbitt recognition and CH regular-Frobenius simultaneous descent, beyond its existing rank-two recognition.
5. ET.7: S-general cyclic patching and local extension realization. AG2.3 supplies the geometric eigenvariety; its Fredholm determinant, finite-slope summands and completed base change are imported by exact LocallyAnalyticDistributions L4 node IDs.
6. IHG.3: integral unramified Hecke/eigencharacter/residue/dual-twist interfaces. Interpolation over nonreduced Hecke rings stays with IHG. AG2.2/AG2.5, ET.6, AF.4 and ML.4 provide their precise algebraic twist, pure-WD uniqueness, unitary transfer, coefficient conjugation and GSp4 normalization interfaces.

ArithmeticGaloisRepresentations G7 owns enormousness. The local ratio predicate neither includes its adjoint-cohomology conditions nor implies global irreducibility. The strong local predicate excludes both ratios 1 and q; the weaker ACC+ predicate permits repeats when q≠1.

## Sources and corrections

Public versions read on 2026-10-07, with SHA-256 and sections in the packet: BLGGT arXiv v4; ACC+ journal-paginated author copy; Chenevier–Harris author copy §§1–3 and the totally real comparison; Caraiani arXiv v1 §§1–5; AHTW arXiv v1 §1.2, Theorems 2.5.7, 3.3.6, Proposition 5.2.8/Theorem 5.2.9 and §6; Newton–Thorne arXiv v2 Lemma 2.1 and §5; Liu et al. journal copy §§1.1,3.2 and Appendix D; CG Proposition 6.8; Pilloni Theorem 5.1.7.1/normalization remark; CS17 Definition 1.9 and §5.5.

All nodes carry a matched locator and short literal excerpt. Source-result scope is limited to the targets here. CHT twisting, Clozel–Thorne unitary construction, BCGP pure-WD uniqueness/monodromy and singular-weight interpolation are owned by the indicated AG2.0/2/3/5 or nonregular suppliers. They are not new AG2.6/7 constructions.

E3/E4 retain the checkpoint's ACC+ polynomial misprints. E5 records a new qualification of its projective-genericity sentence: arbitrary ramified scalar twists destroy local unramifiedness, although global existential genericity survives by avoiding finitely many ramified primes. E5 is scoped to the identified journal-paginated author copy. The publisher article page offered no PDF and the attempted public PDF URL returned 404; no claim of publisher-text collation is made. Article, author-publication pages and arXiv versions were searched for an erratum. The known CG E54/E55 and Pilloni E27 corrections are imported, not reported again as new.

## Validation and suggested file

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json`: 0 errors, 0 warnings.
- Source-issue and source-version validation using the shared `check_issues` and `versions_checked` helpers: passed. `check_errata.py` itself expects a separate errata-job envelope and is not the validator for a blueprint packet.
- Name consistency: all 58 API items and 49 tests appear in both the reader and suggested file. All nine retained IDs and all unchecked implementation statuses were checked.
- Direct stage-route check against the atlas plus resolved packet-node parents: no new cycles. Packet-node acyclicity is checked by the blueprint checker.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII--AG2.6.lean`: exit 0; only 5 declaration-uses-`sorry` warnings. Memory was above 20 GB available. No build, dependency update, cache fetch or language server was started.

The suggested file imports Mathlib only and was elaborated at its pinned commit. The actual executable signatures cover unit-valued eigenvalue predicates, matrix/local-inertia algebraic prototypes, the stronger predicate, invariance and characteristic-polynomial coefficient change, with concrete arithmetic tests. Local-field continuity/place constructors are explicitly omitted from these prototypes. Full compatible-system, automorphic, lattice, Hecke and typed-export signatures are mathematical entries in the named register because their supplier types are absent from the pinned baseline. The register is not presented as elaborated code; no fake proposition fields or replacement supplier carriers were used. The shared Tau Ceti working tree was not imported; its pinned sources were inspected read-only for the audit. The remaining supplier-type gap records this limitation.

Read the packet's coverage, requests and gaps as the worklist for refinement. No independent review verdict is asserted by this handoff.
