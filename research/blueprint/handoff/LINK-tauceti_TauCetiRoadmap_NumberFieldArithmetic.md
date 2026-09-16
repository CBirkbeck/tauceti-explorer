# Handoff: LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic

## Identity, state and authorised files

Worker: **ChatGPT Pro — cgp-866dc6aebdcc**. Issue: **#18**. Status: **partial**. This is a substantive, resumable link-map checkpoint, not a completed catalogue-wide survey, independent review, or integration-ready submission.

- Claim: https://github.com/CBirkbeck/tauceti-explorer/issues/18#issuecomment-5696760004.
- Workflow ownership confirmation: https://github.com/CBirkbeck/tauceti-explorer/issues/18#issuecomment-5696761786.
- Isolated branch: `swarm/cgp-866dc6aebdcc/number-field-links`.
- Packet: `research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json`.
- Handoff: this file.
- Packet checkpoint commit: `db83e9750175c27e0af6c390d71ddd98f40d3041`.

Only the two authorised repository files were written. No git command was run. No default-branch push, merge, approval, issue closure or state:done action was performed. The claim was not released. A later worker must coordinate ownership before continuing; the same GitHub account is not proof of session ownership.

## What is actually in the packet

There are **19 links**: **four incoming** from LocalFieldsRamification and **15 outgoing**: five to GlobalNumberFields, three to ClassFieldTheory, six to Chebotarev, and one to PolynomialGaloisGroups. Every link has two endpoint quotes. The links describe mathematical roadmap contracts, not implemented Lean declarations.

The four overlap recommendations are:

1. **Rescope** Chebotarev's `ramifiedPrimes` construction to reuse NFA's `ramifiedSupport`; retain Chebotarev's Artin-fibre complement theorem. The corresponding inferred link is a proposed reuse interface, not a claim that the consumer already imports it. A reviewer should retain just the overlap if the ownership proposal is not accepted.
2. **Keep** the abstract-field and polynomial normal-closure/action interfaces distinct, with common generic comparison lemmas below both. Do not add a reverse polynomial-roadmap prerequisite.
3. **Keep** primitive-element power-order index/discriminant work distinct from arbitrary orders and Picard groups. Share determinant/index lemmas without importing the entire Picard development into early splitting arithmetic.
4. **Keep** rational cyclotomic Frobenius identification distinct from the general-base cyclotomic character-weight construction. The rational calculation alone is not the arbitrary-number-field theorem.

No merger of whole roadmaps is recommended.

## Source coverage and locators

All quotations were read at repository revision **`49f74b4d2bace99a76ceff4ac2199a3384c83c57`**. Each evidence stage ID supplies its exact README heading anchor. The packet also records every quoted README path and blob SHA.

| Roadmap | Reading completed |
| --- | --- |
| NumberFieldArithmetic | Entire README, all eight source stages, including conventions, ownership boundaries and worked examples |
| LocalFieldsRamification | Entire README and all five stages |
| GlobalNumberFields | Entire README and all twelve layers |
| Chebotarev | Entire README and all fourteen layers |
| ClassFieldTheory | Ownership contracts at lines 151–230; complete global Layers 10–14 at lines 1053–1354; other layer metadata screened in the atlas |
| PolynomialGaloisGroups | Scope/exchange contract at lines 1–185; complete Layers 0 and 5 at lines 442–531 and 1054–1171; other layer metadata screened in the atlas |

Additional discovery reading in `data/roadmap-summaries.json` covered lines 1–66 and 154–end. This was a **summary-only screen**, not a stage-by-stage examination and not evidence of absence of other links. The six `examined` entries are the roadmaps whose actual source documents were opened and compared. No full examination of all upstream roadmaps or all classical-area roadmaps is claimed. Directory listing is not counted as examination.

The catalogue-wide pass stopped before summary lines 67–153 and before recursive stage matching of the remaining campaign and upstream candidates. No reviewed pair is silently labelled absent on the strength of a keyword search alone.

## Source-stage input/output checkpoint

The following distils the more detailed scratch analysis and is sufficient to resume candidate matching without rereading the source merely to reconstruct its scope.

| NFA layer and original lines | Inputs, outputs and limitations |
| --- | --- |
| 1, 486–613 | Finite Galois extensions, primes-over actions, decomposition/inertia subgroups and double cosets. Exports the prime bijection, decomposition/inertia fields and splitting in Galois closures/composita. The e*f index formula is distinct from the separate inertia-index formula for e; the latter needs residue separability. |
| 2, 614–832 | Finite-level unramified Frobenius, a chosen prime of the top field, conjugation and restriction. Exports `artinSymbol`, the two different tower laws, prime-to-S ideal carriers, ideal Artin homomorphisms and prime-value uniqueness. S is an arbitrary finite excluded set with an unramified-away hypothesis; the construction must not depend on reciprocity or on first constructing ramifiedSupport. |
| 3, 833–1084 | A primitive integral element, finite power-order index, discriminants and Dedekind–Kummer. Exports factorization/ramification dictionaries and the full-cycle-type theorem for arbitrary monic integral polynomials at p not dividing the polynomial discriminant. Reducible polynomials use one common Frobenius lift; fixed points must be restored. Field-unramified alone does not discharge the hypothesis. |
| 4, 1085–1280 | Different ideals, ideal norms, scalar extension and discriminant towers. Exports relative discriminants and the finite ramified support with its exact membership criterion. Its later Artin adapter depends on Layer 2, but the support definition itself does not. |
| 5, 1281–1716 | Canonical finite-place completions plus intrinsic local-field exports. Constructs named completion maps, canonical valuation/algebra structures, residue/e/f comparisons, semilocal tensor decomposition, trace/norm formulas, decompositionHom and different localization. Local monogenicity is imported, not reproved. Arbitrary compatible algebra structures are not acceptable substitutes for the canonical extension. |
| 6, 1717–1889 | The local lower filtration, local Hilbert formula and tame/wild bounds, together with Layer 5 transport. Exports global ideal-theoretic filtrations and different/discriminant exponent consequences. The upper bound also needs a separate natural-number valuation/multiplicity bridge. This is number-field-specific at the stated point; it does not prove a generic Dedekind-domain version or Artin-conductor integrality. |
| 7, 1890–2127 | Normal closures, embeddings, integral elements and finite-index comparisons. Exports subfield/action data, explicit integral bases and conditional unit certificates. The explicit-unit criterion has both rank-one and prime-degree restrictions; it does not supply general unit algorithms, regulators or imaginary-quartic unit certification. |
| 8, 2128–2204 | The earlier invariant dictionaries and worked arithmetic. Exports the intrinsic degree/signature/absolute-discriminant label prefix and invariant suite. No canonical LMFDB index, transitive-group nTj label, general class-number calculation or density theorem is supplied. |

## Recursive boundary checks already performed

The local/global edge direction was checked against the complete intrinsic local roadmap: the latter does not need the global completion dictionary. Completion topology, scalar towers, residue-field identifications, normalized valuations and integral-closure structures remain NFA obligations before local theorems can be applied.

GlobalNumberFields' ray-class carriers import `idealsAway` and `integralIdealsAway`, not the Artin map. ClassFieldTheory compares its own reciprocity map with the existing *planned* ideal Artin map by prime values and the supplier's uniqueness contract. Its commutativity-hypothesis adapter belongs to the consumer. There is no reciprocity feedback into NFA's ideal-carrier or Artin construction.

The adelic and local-norm links only supply the finite-place semilocal comparison and component norms. The restricted-product map, almost-everywhere unit preimages, module topology and continuous equivalence are additional consumer obligations. A bare algebra equivalence does not prove topological adelic base change.

Chebotarev's fixed-field fibre requires the prime-relative Frobenius power formula, not an arbitrary representative at a fixed nonnormal intermediate prime. Its exceptional set must include primes over ramified primes of the base, not just relatively ramified primes. Its analytic and density theorems do not feed back into the finite arithmetic.

PolynomialGaloisGroups explicitly names one import, NFA 3.10. Its discriminant/resolvent and group-recognition layers do not become reverse prerequisites merely because their terminology overlaps with NFA.

## Source issues requiring separate action

**R-FROB-DOMAIN.** Clarify the scope of the local-Frobenius comparison in NFA 5.6. The local supplier's `frobeniusAlgEquiv` is for an unramified Galois extension; a ramified extension supplies a Frobenius coset modulo inertia, not a canonical element. No separate LF Layer 2 → NFA Layer 5 edge is included until the exact unramified branch or quotient-valued comparison is fixed. This is a domain/adapter question, not a claim that all of Layer 5 is invalid.

**R-EULER-RESIDUE.** Chebotarev 12.1 says deleting finitely many Euler factors preserves the Dedekind-zeta residue. Deletion multiplies that residue by the product of `(1 - Norm(p)^(-1))` over the deleted primes; the coefficient 1 of the logarithmic-derivative pole is unchanged. GlobalNumberFields 3E already records the Euler correction. Correct this separately in the source roadmap; no unauthorised README edit was made here. It does not invalidate the arithmetic dependency links.

## Provenance, baseline and live recheck

- Atlas blob: `37f2add06983c206067d1104e0f40a839cc3961a`.
- Baseline JSON blob: `fdb00afdfae8e5728e070f310f5a880707764bc2`.
- Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
- Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Original browser/protocol blobs: `d33a88ca6fd92a299143bf4a3b502221aaf49132`, `7bfc37011027b62f1976c3ff1fd88fc8c9b83cb3`.
- Upstream/expansion guide blobs: `a767747585bba9a7c57ff365e02a574f04cfec71`, `c763c69dd1a81f4ded9843c714f8b32c9c4cf854`.

These pins were read; no declaration-level library baseline verification is claimed. README implementation inventories, suggested names and Lean snippets are not independent evidence that a declaration exists at the pin. No private-library primary reference or theorem-number verification is claimed by this link-mapping job.

The pre-submission main revision is **`1338883fe31f3b357dd91b7d5916e76e3b950c81`**, 15 commits beyond the input. The GitHub compare action showed no changes to the six quoted READMEs, atlas, baseline or our two output paths. It did show new packets, a new roadmap, atlas extracts and protocol/validator changes. Current browser instructions and section 10 were read; they explicitly permit `status: partial` and require a later worker to continue the same file.

Current browser/protocol/validator blobs are `e4854be9cb94f4e9fe6f4ac76a5468f56c53d3a0`, `41099c03ea64d701d05b1277a83141ef9d4868db`, and `88135efe5a74ef82e088f3fa3189893e27a7867a`. The updated validator was read in full.

At the input revision, `research/blueprint/links` and `research/blueprint/roadmaps` were absent. At the pre-submission revision there are other workers' StandardDistributions, UniversalCovers and ZigzagPreprojective link packets and a MordellLawrenceVenkatesh roadmap. Their integration and any subsequent changes must be included in global validation. They were not edited. The original job-ID search found no competing producer or PR; the later compare still showed no changes to this job's output paths. Issue #18 and its complete comments were re-fetched, retaining this session's uncontested accepted claim.

## Validation: exact scope

Executed successfully in scratch:

```text
python3 scratch/check_packet_structure.py
PASS limited packet structure: 19 unique non-self links, 4 overlaps,
2 endpoint quotes per link, proposed-edge DAG acyclic.
```

This custom standard-library check parsed JSON, checked the stated partial/unchecked status, edge uniqueness/non-self incidence, confidence values, endpoint quote presence/length, overlap fields and acyclicity of the proposed edges alone. It did **not** load the complete atlas, search all existing link packets, automatically compare quotes with source files, or prove mathematical correctness.

The actual repository command is:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json
```

It was **not run locally**: the large atlas was readable through the GitHub blob connector, but not materialised in the local runtime; direct downloads failed. The PR workflow `swarm-check.yml` invokes this command against the repository checkout. No CI pass is claimed in this checkpoint; its actual result must be recorded in the PR/issue discussion. The new sub-1MB atlas extracts provide a better continuation route, not a retroactive validation result.

## Exact continuation work

1. Read `research/blueprint/atlas/README.md` and use the new index, per-roadmap and area extracts. Complete the catalogue-wide exact/synonym screen, including every other upstream roadmap and every classical-area roadmap. Preserve the six deep-read entries and expand `examined` with honest scopes.
2. Prioritise campaign candidates ComputationalNumberTheory, ArithmeticStatistics, ClassicalArithmeticCompletion, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, ArithmeticGaloisRepresentations and ComplexMultiplicationAndExplicitReciprocity. Check exact existing stage IDs and full statements; do not insert guessed keys or use a transitive dependency as evidence of a direct one.
3. Finish the same-area upstream screen: Completed/EffectiveBounds, Completed/IntegralLattices, AlgebraicCodingTheory, ArithmeticDirichletSeries, GlobalQuadraticForms, Multiquadratic and QuadraticFormInvariants, followed by the remaining upstream catalogue. Local logarithms, algebraic-group Frobenius terminology and unrelated discriminants are not dependencies by vocabulary alone.
4. Read the newly added MordellLawrenceVenkatesh roadmap and any later packets. Check all source and target pairs against existing stage edges/other packets. Preserve earlier valid links; resolve overlaps or cycles without editing another worker's files.
5. Run the actual validator and fix every error. Treat a passing structural check as necessary, not as mathematical review. Resolve or explicitly scope R-FROB-DOMAIN and R-EULER-RESIDUE through separately authorised source work.
6. Keep the packet partial until the full screen is finished. Then request independent review; do not mark integrated or done merely because a PR exists.
