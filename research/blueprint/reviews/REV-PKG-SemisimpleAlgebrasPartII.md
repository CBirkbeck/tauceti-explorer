# Independent package review: SemisimpleAlgebrasPartII

Verdict: **needs_changes**. Job `REV-PKG-SemisimpleAlgebrasPartII`, issue
#7609; reviewer `independent-review-REV-PKG-SemisimpleAlgebrasPartII`;
Codex (GPT-6), session `codex-qj2ht1`; 2026-10-10. This session did none of
the package job. This is a completed independent review.

The reader represents all 55 accepted targets and preserves their important
hypotheses. The suggested file elaborates, but 23 target signatures, 14 API
signatures and 13 planned examples are absent. Its native corestriction also
lacks its defining normalized comparison equation. Consequently elaboration
does not establish package fidelity under PROTOCOL section 20.

## Required checks

| Requirement | Result | Evidence |
| --- | --- | --- |
| Upstream form and size | Pass | Introduction, scope, supplier boundaries, conventions, sources and five ordered mathematical layers. Compared with the current SemisimpleAlgebras and AlgebraicVectorBundles readers. README is below 200 KB. |
| Fidelity to the accepted plan | Reader statements pass; supplier identification needs clarification | Read every statement, hypothesis, proof outline, prerequisite, API and test in `packets/SemisimpleAlgebrasPartII.json`, and the entire package. All 55 targets, 30 API items and 31 tests appear in the reader. The anonymous Cartier supplier remains unresolved, as described below. |
| Own words and locators | Pass with the source-access limit below | The reader is organized by its constructions, not by the sections of a source. No source passage was found. It uses explicit versions, theorem/section numbers and printed pages. Added the missing page range for GS §4.4. |
| No process in the roadmap | Pass after correction | No packet names, job identifiers, review verdicts or checkpoint text occur in README. Replaced the Lean comment about a missing normalization by its mathematical coefficient contract. |
| Suggested Lean | Elaboration passes; completeness and normalization fail | Independent `lean-check` before and after the arithmetic correction exits 0, with 66 warnings, all `declaration uses sorry`; no errors or other warnings. Missing interfaces are inventoried below. |
| Metadata | Pass | Exactly `topic = "math.RA"` followed by a newline; ring and algebra theory fits the roadmap. |

## Corrections made

1. `divisionModuleDimension` formerly returned an arbitrary `Module D` instance
   satisfying the dimension conditions. The reader requires the action obtained
   from the specified splitting. The signature now constructs
   `ρ = (e.restrictScalars K).toAlgHom.comp Algebra.TensorProduct.includeRight`
   and requires the returned witness to equal `divisionColumnModule (deg K D) ρ`.
   The existing `Module.compHom` construction was moved before this use. This
   links the adapter to the actual action without introducing another carrier.
2. Added GS §4.4, pp. 95–99, both in the bibliography and at the all-class
   comparison target. The first-edition publisher contents identify §4.4 at
   p. 95 and §4.5 at p. 100.
3. Corrected the BB rank formula's Markdown to `$p^{2d}$`.
4. Removed the progress-oriented normalization comment from Suggested.lean.

## Target correspondence

The identifiers in this table are the final components of the accepted node
IDs; the stage column supplies their prefix. “Present” means a native signature
with the stated hypotheses, not an implemented theorem. The reader locations
are section titles, so subsequent line-number changes do not invalidate them.

| Stage | Target | Reader section | Lean correspondence |
| --- | --- | --- | --- |
| SA.0 | index-brauer-congr | Descending the algebra index | `indexBrauerCongr` |
| SA.0 | class-index | Descending the algebra index | `classIndex` |
| SA.0 | class-index-mk | Descending the algebra index | `classIndex_mk` |
| SA.0 | class-index-positive | Descending the algebra index | `classIndex_pos` |
| SA.0 | class-index-one | Descending the algebra index | `classIndex_eq_one_iff` |
| SA.0 | splitting-degrees | Splitting degrees | `splittingDegrees` |
| SA.0 | division-module-dimension | The actual division-column module | `divisionModuleDimension`, corrected |
| SA.0 | index-divides-splitting-degree | Arithmetic of index under scalar extension | `indexDividesSplittingDegree` |
| SA.0 | index-basechange-divides | Arithmetic of index under scalar extension | `classIndex_baseChange_dvd` |
| SA.0 | index-divides-degree-index | Arithmetic of index under scalar extension | `indexDividesDegreeIndex` |
| SA.0 | class-index-attained | Splitting degrees | `classIndex_mem_splittingDegrees` |
| SA.0 | minimum-splitting-degree | Least degree, gcd and cyclic-subgroup invariance | `minimumSplittingDegree` |
| SA.0 | gcd-splitting-degrees | Least degree, gcd and cyclic-subgroup invariance | `gcdSplittingDegrees` |
| SA.0 | same-cyclic-index | Least degree, gcd and cyclic-subgroup invariance | `sameCyclicIndex` |
| SA.0 | division-column-action | The actual division-column module | `divisionColumnModule` |
| SA.0 | column-action-coordinate | The actual division-column module | `divisionColumnAction` |
| SA.0 | column-scalar-tower | The actual division-column module | `divisionColumnTower` |
| SA.0 | column-finite | The actual division-column module | `divisionColumnFinite` |
| SA.0 | column-tower-dimension | The actual division-column module | `divisionColumnDimension` |
| SA.0 | column-splitting-degree | The actual division-column module | `splittingDegreeDvd` |
| SA.1 | comparison-basechange-units | The all-class restriction square | **Absent**; `transportedCorestriction_res` assumes the square |
| SA.1 | brauer-corestriction | Transported Brauer corestriction | `brauerCorestriction` present; normalization missing |
| SA.1 | corestriction-restriction-degree | Transported Brauer corestriction | `corestrictionRestrictionDegree` |
| SA.1 | separable-splitting-annihilates | Annihilation by splitting degree and by index | `separableSplittingAnnihilates` |
| SA.1 | class-power-index | Annihilation by splitting degree and by index | `classPowerIndex` |
| SA.1 | brauer-finite-order | Annihilation by splitting degree and by index | `brauerFiniteOrder` |
| SA.1 | period-divides-index | Annihilation by splitting degree and by index | `periodDividesIndex` |
| SA.1 | prime-to-p-splitting | Prime-to-period splitting and prime divisors | `primeToPSplitting` |
| SA.1 | index-prime-divides-period | Prime-to-period splitting and prime divisors | `indexPrimeDividesPeriod` |
| SA.1 | same-prime-divisors | Prime-to-period splitting and prime divisors | `samePrimeDivisors` |
| SA.2 | matrix-support | Annihilators of matrix columns | `matrixSupport` |
| SA.2 | nilpotent-support-boundary | The nilpotent support boundary | `nilpotentSupportBoundary` |
| SA.2 | sheaf-morita | The sheaf Morita equivalence | **Absent** |
| SA.2 | coherent-morita | Finite presentation and coherence | **Absent** |
| SA.2 | sheaf-support-morita | Equality of ideal-sheaf annihilators | **Absent** |
| SA.3 | splitting-transition-line | Transition lines between splitting generators | **Absent** |
| SA.3 | charpoly-line-twist | Characteristic polynomials under line twist | **Absent** |
| SA.3 | morita-characteristic-polynomial | The Morita characteristic polynomial | **Absent** |
| SA.3 | frobenius-root-boundary | The nonreduced Frobenius-root boundary | `distinctMonicFrobeniusRoots` |
| SA.3 | finite-pushforward-morita | Finite pushforward of a split Morita module | **Absent** |
| SA.3 | spectral-line-trivialization | Lines on finite spectral covers | **Absent** |
| SA.3 | finite-pushforward-line-invariant | Lines on finite spectral covers | **Absent** |
| SA.3 | morita-higgs-overlap | Overlap and the full Morita Higgs invariant | **Absent** |
| SA.3 | morita-higgs-invariant | Overlap and the full Morita Higgs invariant | **Absent** |
| SA.3 | higgs-invariant-local | Overlap and the full Morita Higgs invariant | **Absent** |
| SA.3 | higgs-invariant-change | Overlap and the full Morita Higgs invariant | **Absent** |
| SA.3 | higgs-invariant-basechange | Overlap and the full Morita Higgs invariant | **Absent** |
| SA.3 | higgs-invariant-power | Overlap and the full Morita Higgs invariant | **Absent** |
| SA.4 | cartier-middle-image | The middle image and the two boundaries | **Absent** |
| SA.4 | cartier-boundary-additivity | Additivity and full-sequence naturality | **Absent** |
| SA.4 | cartier-boundary-naturality | Additivity and full-sequence naturality | **Absent** |
| SA.4 | cartier-brauer-comparison | The differential-operator Brauer comparison | **Absent** |
| SA.4 | relative-class-vanishing-input | The relative class-vanishing target | **Absent** |
| SA.4 | relative-brauer-equality | Equality of the relative algebraic Brauer classes | **Absent** |
| SA.4 | relative-morita-refinement | Chosen relative Morita refinement | **Absent** |

This gives 32 present target signatures, of which the corestriction definition
is not adequately normalized, and 23 absent signatures. All 20 SA.0 targets
are present; SA.1 has 9 of 10, SA.2 has 2 of 5, SA.3 has 1 of 13, and SA.4
has 0 of 7. Extra affine examples do not replace these missing geometric
declarations.

The missing API items are:

- `brauerCorestriction_embedding`, `brauerCorestriction_cohomology`;
- `sheafMorita_unit`, `sheafMorita_counit`, `sheafMorita_restrict`,
  `sheafMorita_matrix`;
- `moritaCharpoly_matrix`, `moritaCharpoly_changeSplitting`,
  `moritaCharpoly_baseChange`, `moritaCharpoly_degree`;
- `moritaHiggsInvariant_local`, `moritaHiggsInvariant_changeSplitting`,
  `moritaHiggsInvariant_baseChange`, `moritaHiggsInvariant_power`.

The missing planned tests are the four sheaf-Morita tests (`rank_one`,
`matrix_rank_two`, `disconnected_rank`, `nongenerator`), four Morita-polynomial
tests (`rank_one_scalar`, `zero_rank`, `nonreduced_scalar`, `line_twist`), and
five Higgs tests (`higgs_scalar_rank_one`, `higgs_zero_module`,
`higgs_spectral_line`, `higgs_nonreduced_root`, `higgs_mixed_degree_boundary`).
The standalone polynomial counterexample is useful but does not test the absent
Morita or Higgs constructions. The remaining 16 API items and 18 planned tests
have signatures in the file.

## Revision requirements

**R1: connect field transfer to the normalized comparison.** The native
`brauerCorestriction` is admitted as a homomorphism. The separate helper
`transportedCorestriction` accepts arbitrary additive equivalences `cK`, `cLU`
and an open subgroup `U`. It correctly forms a transport of `explicitCor2`,
but nothing identifies that helper with `brauerCorestriction`, selects the
crossed-product normalization, or proves the all-class restriction square.
Its restriction theorem takes that square and the degree/index equation as
hypotheses. Supply the actual comparison-basechange signature, the defining
cohomology equation for the native map and embedding independence. The current
QuadraticFormInvariants 7B prototype specifies `brauerCohomologyEquiv` together
with its crossed-product equation and uniqueness theorem; retain that
normalization rather than replacing it by an arbitrary group isomorphism.

**R2: supply the geometric signatures and their APIs/examples.** SA.2 needs
actual quasi-coherent algebra modules, tensor/internal Hom functors, unit and
counit, restriction and finiteness data, and ideal-sheaf annihilators. SA.3
needs the transition line, polynomial and coefficient-valued Higgs carriers
and their finite-pushforward comparisons. The supplier package
SchemeAndStackFoundations still records its shared scheme-Brauer declarations
in a mathematical omission comment. HodgeStructuresPartII likewise records
the general symmetric-action interface as omitted; its native affine results
do not supply the entire geometric carrier. GeneralAlgebraicKTheory's package
does not contain the requested projective-generator tensor/Hom prototype.
Those observations explain the dependency work, but do not make this package
complete. Use the named shared interfaces as they become concretely expressible;
do not create private algebra/Brauer/Higgs carriers or substitute arbitrary
categories and property fields for them.

**R3: identify the Cartier owner and state the relative interfaces.** The
dependency table calls its supplier “The characteristic-p Cartier-transform
development”, without a roadmap/layer ID. The accepted plan already leaves
this supplier unresolved. Keep its exact contract, but provide a named owner
or record the required ownership decision in the revision handoff. SA.4 still
needs all seven signatures: the middle image and two short exact sequences,
their boundaries and full relative naturality, the represented
differential-operator class, actual relative vanishing, equality in the shared
algebraic scheme-Brauer group, and the chosen bimodule refinement. An axiom
asserting the desired vanishing inside an input structure would weaken the
accepted target. Equality of Brauer classes also does not select the required
evaluation, identity-fibre and composition data.

## Mathematical fidelity and supplier boundaries

The reader retains the following distinctions, which the revision must preserve:

- The index is descended from the existing algebra index. Splitting degrees
  include inseparable finite extensions; corestriction uses finite separable
  extensions. Finite order is proved before positivity of `orderOf`. The
  Hamilton/complexification examples distinguish index from representative
  degree and illustrate strict decrease under extension.
- The column action uses rows of the supplied matrix map and the original
  scalar action. Positive matrix size is needed only at cancellation; the
  empty column module remains legitimate. The corrected adapter preserves
  this particular action.
- Morita support is equality of ideal-sheaf annihilators, including nilpotent
  ideals. Splitting rank is positive locally; inverse-module rank may be zero.
  Coherence is restricted to a locally noetherian base, while the finite-
  presentation formulation uses arbitrary bases.
- Transition lines are `Hom_A(Q,P)` with the stated dual direction for inverse
  modules. A spectral line is a line on the finite cover, not necessarily a
  pullback from the base. Higgs descent retains all symmetric coefficients.
  The power law assumes one fixed positive splitting rank over the entire
  inverse image of a base chart. The mixed-rank example has original rank 3
  and inverse rank 2, so no single integral power works.
- The dual-number example refutes uniqueness of monic Frobenius roots over
  nonreduced rings. The reader descends coefficients of actual actions instead
  of selecting a polynomial root.
- SA.4 uses two connecting homomorphisms through a specified middle image and
  the injective algebraic Brauer-to-étale-cohomology map, without asserting
  surjectivity. The nonreduced parameter requires the full relative exact
  diagram. The source's fibre-vanishing-to-zero-section-support inference is
  not used as a proof of the relative vanishing target.

I checked current upstream main at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. In particular the
AlgebraicVectorBundles L0A–L0C ownership is retained. The existing parent
CSA, quotient, splitting and algebra-index work is consumed rather than
planned again. No matching class-index/corestriction implementation was found
in the current library.

The 48 baseline references were inspected at the accepted pins, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Their source files match the
shared checking build. In particular the two existing splitting-field
existence statements do not by themselves supply a separable extension of
exact index degree. The native `UnitsCoeff` action, `explicitCor2`,
`explicitRes2` and their index composite are real inputs; they do not supply
the absent normalized field comparison or the geometric constructions.

## Source inspection and validation

Fresh copies of GS errata, Benoist, EG v4, published OV, and BB v2 were read at
the cited passages. Their SHA-256 hashes agree with the accepted source
receipts. Relevant locators are GS errata p. 3; Benoist §0.1, p. 63;
EG Theorem 2.17/Remark 2.18, pp. 13–14, and Proposition A.2/Remark A.3,
pp. 40–41; OV Theorem 2.8/Corollary 2.9, pp. 33–34, and §4.2,
equation (4.1.1), Proposition 4.2/4.4, pp. 85–88; BB §2.2, p. 3, and
Proposition 3.11/Corollary 3.12, p. 11. The corrected rank and arrow order in
the BB discussion agree with its construction rather than its typographical
slips. These sources justify inspecting the exact support, rank and relative
contracts; none supplies the missing Lean signatures.

The GS first-edition institutional PDF timed out on repeated retrieval, including
the older institutional hostname. Its detailed theorem/page locators therefore
remain inherited from the accepted design review, not independently reread
in this session. The added §4.4 range was checked against the
[publisher's first-edition contents](https://assets.cambridge.org/97805218/61038/frontmatter/9780521861038_frontmatter.pdf).
No other edition or unofficial book copy was substituted.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SemisimpleAlgebrasPartII.json`:
  0 errors, 0 warnings; 55 declarations, 30 API items, 31 tests. The accepted
  packet is unchanged.
- `lean-check research/blueprint/packages/SemisimpleAlgebrasPartII/Suggested.lean`:
  exit 0 before and after the signature correction; 66 `sorry` warnings,
  0 errors, 0 other warnings. Only a comment changed after the second check.
- Package JSON, metadata, target inventory, size and whitespace checks pass.
- `python3 research/blueprint/intake.py check-files` on the five changed
  deliverables: 5 files, 0 problems.

Acceptance requires R1–R3, followed by a fresh elaboration and fidelity review.
This verdict does not change the accepted plan or claim any implementation.
