# Independent review: REV-DESIGN-BETTS-STIX

**Verdict: accepted after correction.** Refs #953. Codex (GPT-6), session
`codex-2uoWrL`, 19 October 2026. The original design was by Claude, session
`claude-q6eBsS`; this reviewer did not write it.

This accepts a complete **target-level planning pass**, not a closed dependency
graph or a formalisation. All 59 nodes have individual verdicts and explanations
in the packet's `review.checked`. Four gaps and 18 supplier requests remain
explicit. No unresolved contradiction was retained as an accepted statement.

## Inventory

| Item | Result |
| --- | --- |
| Nodes | 59: 14 definitions, 5 constructions, 31 theorems, 7 lemmas, 2 applications |
| Individual verdicts | 43 verified, 16 corrected; none unverifiable |
| Nodes added / removed | 0 / 0 |
| API entries | 125, up from 123 |
| Definition/construction tests | 82, up from 81; every such node has at least three |
| Planets | 30, with no layer exceeding six |
| Baseline declarations | All 14 confirmed; four descriptions corrected; no references removed |
| Supplier requests | 18, up from 15 |
| Gaps | Four: two inherited supplier gaps, an orbit-dimension input, a catalogue edge |
| Coverage | All ten layers planned; SPM.0 and SPM.3 closed in the protocol's planning sense |
| Source issues | 11: ten confirmed, E10 rejected as an established erratum |

The roadmap definition, packet, full reader and suggested file were reconciled.
No other roadmap, library, atlas data or original author's handoff was edited.
All nodes retain `implementationStatus: unchecked`.

## Sources and scope of the check

The four public versions below were read at the packet's locators, including
proofs and the hypotheses needed by their consumers. Their downloaded PDF hashes
agree with the packet. All mathematical descriptions here are authored
paraphrases; no source excerpts were added.

- Betts–Stix, [arXiv:2204.13674v1](https://arxiv.org/pdf/2204.13674v1), §§1–7,
  pp. 1–56, with the appendix filtration input checked on pp. 57–58. In
  particular, the local comparison arguments of §3, the period-image argument
  of §5 and all cases of the trichotomy were checked, rather than only the
  headline statements. Every Betts–Stix locator and erratum verdict concerns
  this version. The Annals 2025 revision was **not compared**; the metadata no
  longer substitutes an assertion about its accessibility for this boundary.
- Harari–Stix, [arXiv:1005.1302v2](https://arxiv.org/pdf/1005.1302v2),
  Introduction and §1, pp. 1–10; Theorem 2.1, its proof and remarks, pp. 11–12.
  Theorem 2.1 is the arXiv locator for the result cited as Theorem 11 in the
  published numbering.
- Stoll, [arXiv:math/0606465v3](https://arxiv.org/pdf/math/0606465v3), §2,
  p. 4; §5, especially Definitions 5.2 and 5.4, Lemma 5.8 and Proposition 5.9,
  pp. 14–20; Conjecture 9.1, p. 38.
- Stix, [arXiv:0809.0017v1](https://arxiv.org/pdf/0809.0017v1), Introduction
  and conventions; Appendix B, Proposition 44, Theorem 45 and Remark 46,
  pp. 22–23. The generic divisibility criterion is available in the NC.6
  supplier; it must not be confused with that node's number-field corollary.

For E9 I also read Deligne's [Weil I, Theorem 1.6, p. 276](https://www.numdam.org/item/PMIHES_1974__43__273_0.pdf)
and [Weil II, Corollary 3.3.9, p. 218](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf).
The latter supplies integral coefficients as well as purity for smooth proper
varieties, so a further unspecified SGA 7 integrality citation is unnecessary.
No restricted book was needed or used.

## Corrections to the nodes

The table uses the suffix of each id after `GaloisSectionsPadicPeriodMaps:`.
These are all 16 nodes changed by the review; the packet records the exact
source locators and the verdict for every other node as well.

| Node | Correction and reason |
| --- | --- |
| SPM.0/local-section-restriction | Replaced an underspecified change-of-embedding test by the explicit sections of Ẑ(1) ⋊ C₂ sending its involution to (2,c) and (−2,c). They are unequal and conjugate by (−2,1), so the test actually detects failure to pass to section classes. |
| SPM.0/local-section-map-injective | Specified the field-general first assertion of NC.6/section-map-injective as the input. Profinite abelian groups have no nonzero point divisible by every positive integer; the number-field corollary alone would not supply the p-adic application. |
| SPM.0/selmer-sections | Localisation functoriality now assumes injectivity of both local section maps. The full-rational-two-torsion test starts with E/Q, so its global Selmer classes are defined. |
| SPM.1/symplectic-pair | Removed the assumed neutral Q_p-valued fibre functor for MF(φ,N,G_v); its realisations use Q_p^nr and K_v. Restricted functoriality to tensor functors preserving the required module structures. Added componentwise morphism extensionality and a test with V=0 and a rank-two line candidate. |
| SPM.1/adelic-lv-locus | Added nonemptiness of the adelic point set to the local-only test. Fixing the other coordinates then permits varying the v-coordinate. |
| SPM.2/restriction-induction | Renamed `pHCohomology_weilRestriction` to `pHCohomology_viewOverBase`. Equation (2.2) views an L_w-variety over K_v by structural composition; it does not compute the cohomology of its Weil restriction scheme. |
| SPM.2/automorphism-group | Defined Aut^GSp as pairs (f,c) inside Aut(D) × G_m. Kept the multiplier when D=0, corrected the scalar map to λ ↦ (λ id,λ²), and added extensionality for both components. Put the End-finiteness argument before construction of the algebraic group, eliminating an apparent dependency on the later dimension theorem. |
| SPM.2/orbit-lemma | Restricted the three-orbit P¹ example to K_v=Q_p. For a larger base, Q_p-rational diagonal scalars do not act transitively on the complement of the two eigenlines. Recorded the missing explicit orbit-dimension supplier statement. |
| SPM.2/automorphism-dimension-bound | The embedding in the similitude group now retains its multiplier. The zero-dimensional module gives G_m and dimension one; positive symplectic rank gives the usual GSp dimension. |
| SPM.3/self-conjugate-character-restriction | Replaced the unsupported passage from a product of local idele components to one component by finite-power descent along N_{K/E}. Added the direct infinity-type factorisation prerequisite and the actual GlobalNumberFields ray-class and norm suppliers. |
| SPM.6/period-domain-lv-locus | The constant-family test now assumes positive relative dimension; otherwise a constant map to a point need not fail density. |
| SPM.6/trichotomy-loci | The quintic example now uses the split algebra H⁰_ét of the geometric fibre, rather than an H⁰_pH object in another category. |
| SPM.7/type-a-classes | A class with incompatible unfiltered discrete data contributes no Lagrangians; a compatible class contributes one automorphism orbit. The old assertion of one orbit for every class was too strong. |
| SPM.7/type-a-period-non-density | The point corresponding to ψ is geometric over K̄_v, with its residue-field embedding. Calling it a K_v-point contradicted the required stabiliser index at least four. |
| SPM.8/small-extension-count | Made the uniform bound explicit using the existing full-G_v generator theorem in LocalGaloisGroups Layer 7. The maximal pro-p quotient would not suffice. Kept the count of conjugate non-Galois cubic subfields, giving seven subfields in total when v∤6. |
| SPM.8/type-c-empty | Replaced the impossible condition that q−1 be coprime to four by 4∤q−1 in the source match and layer description. The forbidden odd divisors and lower bound are unchanged. |

The suggested `SymplecticModule` had not enforced either finite-dimensionality
or line rank one. It now states a faithful **field specialisation**, with both
spaces finite-dimensional and `finrank A L = 1`, and the standard-plane example
constructs that additional field. The general categorical definition over finite
algebras remains a reader target. This preserves the compact suggested-file
shape; it introduces no heavy carrier or data definition with an unproved body.

## Baseline audit

The source files and statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The table gives the module and line
at those pins. Existence was checked in the source, not inferred from the index.

| Declaration | Pinned module:line | Fit and limits |
| --- | --- | --- |
| Field.absoluteGaloisGroup | Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:43 | The topological automorphism group of an algebraic closure. Corrected `provides`: decomposition-group comparison comes from R01.2. |
| ContinuousMonoidHom | Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57 | A monoid homomorphism with continuity; splitting the projection is a separate condition. |
| ConnectedComponents | Mathlib/Topology/Connected/Clopen.lean:510 | The quotient by connected components used at the archimedean places. |
| IsDedekindDomain.HeightOneSpectrum.adicCompletion | Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:602 | The valuation completion for the finite-place carrier. |
| LinearMap.IsAlt | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:287 | The diagonal vanishing condition, with the bilinear specialisation used here. |
| LinearMap.Nondegenerate | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:596 | Left and right separation. Corrected `provides`: equivalence with perfectness requires finite dimension and a one-dimensional target line. |
| Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:101 | Standard-form Sp. Clarified that it supplies neither GSp nor a retained multiplier. |
| TauCeti.Symplectic.groupScheme | TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122 | Constant-form Sp as a group scheme. The same Sp/GSp distinction is explicit. |
| NumberField.IsCMField | Mathlib/NumberTheory/NumberField/CMField.lean:71 | The CM-field predicate used to quantify over CM subfields. |
| NumberField.IsCMField.ringOfIntegersComplexConj | Mathlib/NumberTheory/NumberField/CMField.lean:238 | Conjugation on the integer ring, giving its action on primes. |
| MulAction.orbit | Mathlib/GroupTheory/GroupAction/Defs.lean:49 | The full group orbit; no replacement by a single Frobenius action. |
| Nat.forall_exists_prime_gt_and_eq_mod | Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442 | Arbitrarily large primes in a unit residue class; the CRT classes used here meet that hypothesis. |
| hasSum_zeta_four | Mathlib/NumberTheory/ZetaValues.lean:458 | The ζ(4) value used to bound ζ(2g) for g≥2. |
| IntermediateField | Mathlib/FieldTheory/IntermediateField/Basic.lean:52 | Subfields of a fixed closure, so conjugate non-Galois cubic fields remain distinct. |

All 14 names and mathematical uses were retained. Four `provides` descriptions
were narrowed or clarified as indicated; no near-miss declaration is used as a
replacement for a new theorem.

## Closure, existing work and remaining inputs

I read the relevant supplier statements in the NC.6 part packet; LV.0–LV.4,
LV.7–LV.8 and LV.10–LV.11; the p-adic Hodge period, descent and relative
comparison nodes; and the listed fundamental-group, Galois, duality, moduli,
Gauss–Manin, weight and cohomological-comparison suppliers. In particular:

- The NC.6 injectivity node has a field-general divisibility criterion before
  its number-field specialisation. Importing the former is valid; it does not
  require a duplicate general injectivity node here.
- LV's good-model, unramified-place and residue-disc statements do not supply
  the model-free variants merely by removing hypotheses. The five LV requests
  retain the precise extensions, including local Kodaira–Parshin fibres and
  the isotropic four-Lagrangian statement. Its available general-position
  result with five Lagrangians is insufficient at degree four.
- Full faithfulness of D_st for semistable representations is not full
  faithfulness of D_pH for every de Rham representation. The Part II need,
  Shimizu specialisation and finite-étale polyannulus dictionary remain
  identified inputs, rather than claims of existing formalisation.
- Current ClassFieldTheory Layers 7 and 11 supply the Artin maps and their
  compatibility. Current GlobalNumberFields Layer 2 explicitly states
  `finite_rayClassGroup`; Layer 7 supplies `rayClassQuotient` with its kernel;
  Layer 8 supplies idele norms and their component formula. Three requests and
  direct edges now name those actual suppliers.
- Current LocalGaloisGroups Layer 7 and its suggested statements
  `isTopologicallyFinitelyGenerated_absoluteGaloisGroup` and
  `rank_absoluteGaloisGroup` already plan the full local absolute Galois group.
  No part of that theory is re-planned here. That roadmap is absent from this
  atlas catalogue, whose validator otherwise misreads its layer id as a
  library declaration. Its exact mathematical dependency is recorded in a
  gap and `upstreamNotes`, and in the roadmap's dependency list, until the
  existing layer is registered.
- Current ReductiveGroups Layer 3 supplies closed subgroups and quotients,
  but does not explicitly state the finite-type image-dimension bound used
  for orbit closures. The request now distinguishes that extra input from
  the supplied statements, and a gap names the exact bound and consumer.

The relevant current LocalFieldsRamification, LocalGaloisGroups,
ClassFieldTheory, GlobalNumberFields, ReductiveGroups and Chebotarev documents
were read in the shared read-only checkout. LocalFieldsRamification supplies
the tame presentation, and Chebotarev Layer 10 supplies the density statement.
The current Tau Ceti symplectic files and the nine newer roadmap directories
were checked for overlap. The reviewed library audit's anabelian entries were
also read; they do not implement these Selmer, model-free period or trichotomy
targets. No library or existing roadmap result was replaced by a new local plan.

The prerequisite graph is acyclic. Every target in the ten layer descriptions
has a node; keeping the proof steps inside target nodes is appropriate here.
The two new gaps are added to the relevant `remaining` lists, including their
effect on the final assembly. SPM.0 and SPM.3 have no unsupplied mathematical
input after the corrections; the other layers explicitly retain their requests
and gaps. All coverage statuses retain their protocol meaning as planning
statuses, with no assertion that the statements have Lean proofs.

## Source-issue verdicts

Every issue has `review.by: REV-DESIGN-BETTS-STIX` and its own reason in the
packet. The original ten entries were checked independently; E11 is new.

| Finding | Verdict | Locator and basis |
| --- | --- | --- |
| E1 | Confirmed | Proposition 5.3, (5.1), pp. 40–41: pulling the filtration back uses inverse horizontal transport. |
| E2 | Confirmed | Lemma 4.7, p. 35: the fibre comparison needs proper smooth base change. Strengthened the counterexample to (A²∖{0})×G_m→A¹, whose fibre H² changes from zero to dimension one. |
| E3 | Confirmed | Remark 5.11, p. 43: the global finite-disc argument needs compactness, supplied by properness here. The local Corollary 5.10 is valid and is not made into an erratum. |
| E4 | Confirmed | §3.5, p. 29: the ensuing proof is of Theorem 3.22, not the already deduced Theorem 3.3. |
| E5 | Confirmed | §4.2, p. 36: the Poincaré bundle lives on the product with the dual abelian scheme. |
| E6 | Confirmed | Equation (4.3), p. 38: product indices must match its residue-field factors. |
| E7 | Confirmed | Lemma 6.17 proof, p. 50: the variable embedding index is j; i is fixed. |
| E8 | Confirmed | Remark 6.23(I), p. 54: the product concerns odd prime factors of q−1. |
| E9 | Confirmed | Example 2.2, p. 7: Weil I Theorem 1.6 assumes projectivity; Weil II Corollary 3.3.9 gives the smooth proper version and integrality. |
| E10 | Rejected as an established erratum | Stix Remark 46, p. 22: its use of local fields need not include archimedean fields. The p-adic domain clarification and the profinite proof are retained without alleging an established source error. |
| E11 | Confirmed; added | Remark 2.20, p. 14: restricting an idele character to the CM subfield gives a product of local components. The single-component inference requires the norm-descent step now supplied in the target's proof. |

For E11, the repair realises a positive power of the factored algebraic type
as a Q_p-valued idele character of the CM subfield. Raising to an exponent of
the finite ray class group extends the principal-ideal character without
extracting roots in Q_p. Its norm pullback differs from the corresponding
power of the original character by a finite-order character. Conjugation at a
self-conjugate prime then proves finiteness of its local component, and norm
pullback proves the required conclusion for the original component. This
supplies a proof of the target; no claim is made that it is the published
revision's argument.

## Validation and maintainer actions

- `scripts/check_blueprint.py` with the pinned declaration index: **0 errors,
  0 warnings**.
- `research/blueprint/intake.py check-files` on the six deliverables, including
  this report and the review handoff: **0 problems**.
- `git diff --check`: passed.
- `lean-check research/blueprint/suggested/GaloisSectionsPadicPeriodMaps.lean`:
  **exit 0**, with exactly 12 expected declaration-uses-`sorry` warnings and no
  other warning or error. Available memory was checked first. No Lake build,
  package update, cache download or language server was run.
- The full reader's target bodies, API, tests, sources, dependencies, requests
  and gaps were regenerated from the corrected JSON. The same renderer was
  first checked against the original inputs and reproduced their target bodies
  exactly. All 59 review ids are unique and exhaust the packet.

Two concrete actions remain for the orchestrator, in addition to the already
recorded LV and p-adic Hodge supplier work: register existing LocalGaloisGroups
Layer 7 so that its exact graph edge can replace the catalogue gap; assign the
generic image/orbit-dimension input to the relevant supplier without treating
it as already present in ReductiveGroups Layer 3. Neither action requires a
new version of the local Galois theory or a second job by this worker.
