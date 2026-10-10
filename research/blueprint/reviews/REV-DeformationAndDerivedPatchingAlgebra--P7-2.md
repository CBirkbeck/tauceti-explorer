# Independent review: P7, Part II

**Accepted as a complete planning pass, with P7 planned rather than closed.**
This review verifies the mathematical targets and corrects the packet and its
suggested file. Nine precisely scoped gaps and four supplier contracts remain;
none is presented as library implementation or as a proved Lean theorem.

Job: `REV-DeformationAndDerivedPatchingAlgebra--P7-2`, issue #6269.
Reviewer: Codex, session `codex-aXRijI`, 10 October 2026. The input was written
by session `codex-CxeBin` in PR #6373, independently of this reviewer. The earlier
review handoff recorded a failed claim and no mathematical work; this report
and the new handoff replace that checkpoint's state.

## Counts and review standard

| Item | Reviewed result |
| --- | --- |
| Nodes | 118: 67 verified, 46 corrected, 5 added |
| Kinds | 5 definitions, 9 constructions, 49 lemmas, 20 theorems, 34 comparisons, 1 application |
| Definition/construction API | 58 statements, covering all 14 objects |
| Discriminating tests | 42, exactly three per definition/construction |
| Baseline declarations | 44 confirmed; one module locator fixed, three references added |
| Public source versions | 27 independently retrieved; every SHA-256 matches the recorded version |
| Source issues | All eight independently checked and given reasoned verdicts |
| Closure | Nine gaps, four requests; no closed stage |
| Planets | Zero new; preserve the accepted predecessor's six-planet aggregate budget |

The issue's older lemma-level brief is superseded by the 9 October streamlined
WORKERS rule and current `detail.json`: this roadmap is at target level.
Proof sketches therefore retain routine intermediate steps. Five missing key
constructions/comparisons receive nodes, each marked with this review's
`addedBy`; smaller native adapters are named in gaps. The packet's `review.checked`
contains a distinct explanation for every node, including the limitations of
nodes that depend on those gaps.

Read the full P7 stage, its reviewed library audit, accepted predecessor,
writer's handoff, part reader and suggested file, the binding protocols and
the complete upstream AdicSpaces and JacobianChallenge examples. All ten target
ledger entries have either local nodes or explicit imports. The prerequisite
graph remains acyclic. All implementation statuses remain unchecked.

## Mathematical and dependency corrections

1. **Existing generic owners.** Current TauCetiRoadmap commit
   `670582c502e1d4497d9ccd492b36c67028ef6666` already contains the K-flat,
   derived tensor and derived internal Hom plans in
   `SmoothRepresentationsOfLocalGroups`, SR.0d. Nodes 1, 11 and 44 now plan
   the native ModuleCat transport at the trivial group, with the finer atlas
   `dg-enhancement` input and an explicit realization contract. The atlas's
   registered SR.0:derived-extension id is retained, and its current upstream
   layer name is explained. E1 supplies replacements, not a duplicate generic
   tensor/Hom construction. Its contract also distinguishes termwise-flat
   replacement from K-flatness and specifies strict upper support for the
   projective representative used by the amplitude theorem. The current
   Tau Ceti library was also checked at commit
   `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; its native Hom complex and Koszul
   structure remain imports. The newer AlgebraicVectorBundles and generic
   DGAInfinity plans do not become additional P7 definitions.
2. **Tier order and inverse limits.** P7 is in tier 10; CompletedCohomologyPartII
   is in tier 12. Remove its CC.2 and CC.3 prerequisites and their two requests.
   P7 now owns the strict R-linear tower construction. Its source is a strict
   diagram of complexes, not a diagram in an ordinary triangulated category:
   products followed by the one-minus-shift cone, shifted by minus one.
   Strict tower maps give functorial cone maps; native exact module products
   give objectwise quasi-isomorphism invariance. R02.1's finer lim-one and
   Milnor nodes supply the lower-tier mathematics. The strict-kernel
   comparison and R-linear realization remain a precise gap.
3. **DVR duality.** Replace the unspecified continuous/Pontryagin dual by
   the actual native module `Hom_O(-,E/O)`, realized using linear Yoneda.
   New nodes prove its needed inputs: injectivity of E/O by the DVR Baer
   argument, scalar endomorphisms of E/O via completion, and finite free
   evaluation. They justify the kernel/adjoint-cokernel formula and BCGP's
   degree-zero integral comparison. Completeness is required for the scalar
   endomorphism identification with O. These are discrete algebraic modules;
   a later topological application must separately specify arithmetic
   hypotheses and character normalization. Preserve the old node id
   `p7ii-dvr-pontryagin-adjoint` for links, but give it the accurate title and
   declaration `dvr_quotient_adjoint`.
4. **Signs and direct inputs.** The chain contraction in the order
   E tensor Dual(P) sends e tensor f to the map x to f(x)e, without an
   additional sign. For degrees q,p the differential signs agree since
   q+p+1 and q-p+1 have the same parity; reversing the factors uses the Koszul
   sign. This resolves the previous contraction gap. Add native homology
   exactness to the K-flat cone and amplitude-extension proofs, native
   braiding/symmetry to tensor coherence, one-K-flat comparison to scalar
   extension, finite-order shift to retracts, and the finer E1 replacement
   dependency. The amplitude base-change proof now handles a>b as the zero
   object before constructing a nonempty interval model.
5. **Coefficients and completion.** The quotient-level derived comparison
   now restricts scalars to the common R-category and gives the actual
   map on 1 tensor x. Completion comparisons use the existing finer DD.1
   completeness, completion and ordinary-quotient-completion nodes and retain
   the Noetherian restriction. The suggested file now includes the local
   bounded-residue perfectness criterion, lim-one vanishing, completion-unit
   isomorphism, localization-Hom completeness criterion and morphism version
   of derived Nakayama.
6. **Spectral actions.** Identity/composition alone do not supply a ring
   action. Add pagewise additivity in both coefficient-sequence variables,
   actual unital ring maps to each page complex's endomorphism ring, action
   compatibility with differentials and transitions, and a stable abutment
   filtration with equivariant graded comparisons. The native spectral-sequence
   category has no preadditive instance, so additivity is stated on its native
   page morphisms. The filtered page construction and stable-cycle abutment
   comparison stay recorded as gaps. Finite diagonal and stabilization bounds
   retain the stated cochain convention.

All other altered original nodes receive precise PDF page locators. The full
change ledger below distinguishes mathematical changes from locator additions;
source passages are never reproduced.

## Added nodes

| Suffix under `DeformationAndDerivedPatchingAlgebra:P7/` | Justification |
| --- | --- |
| `p7ii-dvr-quotient-injective` | Principal DVR ideals and divisibility of E/O satisfy the native Baer criterion. |
| `p7ii-dvr-quotient-endomorphism` | Compatible endomorphisms of uniformizer-power torsion identify the endomorphism ring with the completion. |
| `p7ii-quotient-dual` | Native linear Yoneda supplies the contravariant module-valued Hom functor; four API statements and three tests. |
| `p7ii-finite-free-quotient-dual` | Finite basis evaluation and the endomorphism computation give the natural adjoint comparison. |
| `p7ii-derived-inverse-limit` | Strict product/cone construction with native exact module products; four API statements and three tests. |

The new tests check zero modules/towers, the residue module, the scalar
endomorphism case, constant identity towers and towers whose proper transition
maps are zero. Existing tests were checked for all-module Tor quantification,
cochain shifts, empty support, infinite-rank completeness, actual coefficient
transitions and nonunital/noncommuting actions. Their Lean statements are
planning obligations with admitted proofs, not executed mathematical proofs.

## Sources and source issues

All cited statements and proof passages were independently read from the
packet's public URLs. Existing source-version hashes and their original read
dates are preserved; `independentReview` records the new check date and exact
byte match. Stacks locators use stable tags and the lemma numbers in the fetched
version; these web pages are unpaginated. PDF page numbers below count from the
first PDF page and distinguish the exact author copy/preprint used.

| Public document | Checked mathematical locator |
| --- | --- |
| [Calegari–Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf), author copy | §7.2, Lemmas 7.5–7.7, PDF pp. 100–102 |
| [Boxer–Calegari–Gee–Pilloni](https://arxiv.org/pdf/1812.09269v3), v3 | §7.8, Lemmas 7.8.5–7.8.6, p. 213; Remark 7.8.7, p. 214 |
| [Boxer–Calegari–Gee–Pilloni](https://arxiv.org/pdf/2502.20645v1), v1 | §7.2 and compatible actions, pp. 161–163; Lemma 7.4.11, p. 172 |
| [Boxer–Pilloni](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), 5 November 2025 author copy | §2.3.12 and Proposition 2.3.13, p. 17; Lemmas 2.6.6–2.6.7 and nearby applications, pp. 21–22 |
| [Pilloni](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 17 June 2019 author copy | §2.1–2.3, pp. 7–11; Propositions 2.2.1–2.2.2, p. 9; Proposition 2.3.1 and Lemma 2.3.1, pp. 10–11 |

The 22 Stacks inputs are 06XY, 0A5W, 0A66, 0651, 0656, 064N, 064Q, 064V,
064X, 061Y, 051G, 0ATK, 064J, 00M5, 0658, 058Z, 058T, 091N, 0922, 0BKN,
0132 and 012W. Their per-node theorem locators, corrected hypotheses and
proof routes are in the packet. In particular the arbitrary-rank Kaplansky
arguments, finite-order boundary surjections, derived-complete Nakayama
hypotheses and finite filtered convergence were checked rather than inferred
from source titles. BCGP25 Lemma 7.4.11(4) was also checked in the rendered PDF:
its second formula uses coinvariants of the dual, so no source error is alleged.

| Source issue suffix | Independent disposition |
| --- | --- |
| E-P7II-01 | Confirm the reversed successive-ideal quotient in Proposition 2.2.1, p. 9. Correct the original attribution: Lemma 2.1.2, p. 8 has the correct quotient. |
| E-P7II-02 | Confirm that Proposition 2.2.2's residual vanishing argument must be applied to the cone, p. 9. |
| E-P7II-03 | Qualify as an ambiguity/gap: Lemma 2.3.1, p. 10 requires the completed free direct sum. The notation alone does not establish that the author intended a product. |
| E-P7II-04 | Confirm the residual matrix block has rows indexed by the target complement and columns by the source complement, p. 10. |
| E-P7II-05 | Confirm the cycle kernel in Stacks Lemma 15.66.5 uses the differential into degree n+1. |
| E-P7II-06 | Confirm the top-degree statement in Stacks Lemma 15.66.7 is only finite-order pseudo-coherence. |
| E-P7II-07 | Confirm the bottom truncation in Stacks Lemma 15.76.3 uses the negative-degree cokernel; remove the original misleading reference to a preceding symmetric support bound. |
| E-P7II-08 | Confirm Stacks Lemma 15.93.21's bound is i<-r, as forced by the previous tensor bound and Milnor sequence. |

These verdicts concern the exact hashed versions, including the specified
Pilloni author copy, and do not assert that the same printing persists in a
different published version. Existing correction searches remain recorded;
none is newly labelled a previously unknown published error.

## Baseline verification

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
All 41 inherited entries were checked by reading full declarations and relevant
instances at these pins; the three additions received the same check. Generic
Grothendieck-axiom transfer statements were checked together with their native
ModuleCat AB5 and AB4Star instances. Their conclusions are not treated as
hypothesis-free facts in an arbitrary category. No declaration was removed.

The mapping cone's old module did not exist at the pin; its corrected file is
`Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean`. The three added
references are `CategoryTheory.linearYoneda`, `Module.Baer.injective` and
`CategoryTheory.HasExactLimitsOfShape.domain_of_functor`.

| Confirmed reference | Module at the pin |
| --- | --- |
| `mathlib:DerivedCategory.Q` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` |
| `mathlib:HomologicalComplex.Acyclic` | `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean` |
| `mathlib:HomologicalComplex.tensorObj` | `Mathlib/Algebra/Homology/Monoidal.lean` |
| `mathlib:CochainComplex.mappingCone` | `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean` |
| `mathlib:CochainComplex.isKProjective_of_projective` | `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean` |
| `mathlib:CochainComplex.IsKProjective.Qh_map_bijective` | `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean` |
| `mathlib:Module.Flat.of_projective` | `Mathlib/RingTheory/Flat/Basic.lean` |
| `mathlib:ModuleCat.extendScalars` | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean` |
| `mathlib:CategoryTheory.Tor` | `Mathlib/CategoryTheory/Monoidal/Tor.lean` |
| `mathlib:CategoryTheory.Tor'` | `Mathlib/CategoryTheory/Monoidal/Tor.lean` |
| `mathlib:DerivedCategory.homologyFunctor` | `Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean` |
| `mathlib:DerivedCategory.singleFunctor` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` |
| `mathlib:Module.Flat.projective_of_finitePresentation` | `Mathlib/RingTheory/Flat/EquationalCriterion.lean` |
| `mathlib:Module.finitePresentation_of_surjective` | `Mathlib/Algebra/Module/FinitePresentation.lean` |
| `tauceti:TauCeti.linearHomComplex` | `TauCeti/Algebra/Homology/LinearHomComplex/Basic.lean` |
| `tauceti:TauCeti.forget₂LinearHomComplexIso` | `TauCeti/Algebra/Homology/LinearHomComplex/Basic.lean` |
| `tauceti:TauCeti.koszulBraiding` | `TauCeti/Algebra/Homology/Monoidal/Braiding.lean` |
| `tauceti:TauCeti.koszulSymmetricCategory` | `TauCeti/Algebra/Homology/Monoidal/Braiding.lean` |
| `mathlib:Module.dual_projective` | `Mathlib/LinearAlgebra/Dual/Lemmas.lean` |
| `mathlib:Module.dual_finite` | `Mathlib/LinearAlgebra/Dual/Lemmas.lean` |
| `mathlib:Module.evalEquiv` | `Mathlib/LinearAlgebra/Dual/Defs.lean` |
| `mathlib:dualTensorHomEquiv` | `Mathlib/LinearAlgebra/Contraction.lean` |
| `mathlib:DerivedCategory.triangleOfSES_distinguished` | `Mathlib/Algebra/Homology/DerivedCategory/ShortExact.lean` |
| `mathlib:DerivedCategory.HomologySequence.exact₂` | `Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean` |
| `mathlib:Module.Flat.iff_rTensor_injective` | `Mathlib/RingTheory/Flat/Tensor.lean` |
| `mathlib:Module.IsLocalRing.linearIndependent_of_flat` | `Mathlib/RingTheory/LocalRing/Module.lean` |
| `mathlib:Module.finitePresentation_of_finite` | `Mathlib/Algebra/Module/FinitePresentation.lean` |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` |
| `mathlib:AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` |
| `mathlib:AdicCompletion.ofLinearEquiv` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` |
| `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` | `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean` |
| `mathlib:CategoryTheory.E₂CohomologicalSpectralSequence` | `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean` |
| `mathlib:Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean` |
| `mathlib:Representation.Coinvariants` | `Mathlib/RepresentationTheory/Coinvariants.lean` |
| `mathlib:Representation.Coinvariants.lift` | `Mathlib/RepresentationTheory/Coinvariants.lean` |
| `mathlib:Representation.dual` | `Mathlib/RepresentationTheory/Basic.lean` |
| `mathlib:Representation.asModule` | `Mathlib/RepresentationTheory/Basic.lean` |
| `mathlib:CategoryTheory.HasExactColimitsOfShape.domain_of_functor` | `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean` |
| `mathlib:AdicCompletion.of_bijective_iff` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` |
| `mathlib:isArtinianRing_iff_isNilpotent_maximalIdeal` | `Mathlib/RingTheory/HopkinsLevitzki.lean` |
| `mathlib:isArtinian_of_fg_of_artinian'` | `Mathlib/RingTheory/Artinian/Module.lean` |
| `mathlib:CategoryTheory.linearYoneda` | `Mathlib/CategoryTheory/Linear/Yoneda.lean` |
| `mathlib:Module.Baer.injective` | `Mathlib/Algebra/Module/Injective.lean` |
| `mathlib:CategoryTheory.HasExactLimitsOfShape.domain_of_functor` | `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean` |

## Original-node change ledger

The suffixes below all belong to `DeformationAndDerivedPatchingAlgebra:P7/`.
A sources-only entry adds an exact PDF page locator. All 67 unchanged nodes
have independent verified notes in `review.checked`, rather than being omitted
from the audit.

| Node suffix | Fields corrected |
| --- | --- |
| `p7ii-kflat` | prerequisites, proofSteps, statement |
| `p7ii-kflat-cone` | prerequisites |
| `p7ii-kflat-quasiiso-arbitrary-factor` | prerequisites |
| `p7ii-derived-tensor` | prerequisites, proofSteps, statement |
| `p7ii-tensor-coherence` | prerequisites |
| `p7ii-derived-extension` | prerequisites |
| `p7ii-amplitude-flat-representative` | prerequisites |
| `p7ii-amplitude-basechange` | proofSteps |
| `p7ii-amplitude-triangle-middle` | prerequisites |
| `p7ii-mpseudo-retract` | prerequisites |
| `p7ii-derived-hom` | prerequisites, proofSteps, statement |
| `p7ii-chain-tensor-hom` | proofSteps, statement |
| `p7ii-dvr-lifts-span-quotients` | sources |
| `p7ii-dvr-lifts-independent-quotients` | sources |
| `p7ii-dvr-torsionfree-quotient-free` | sources |
| `p7ii-finite-algebra-residue-free` | sources |
| `p7ii-finite-group-coefficient-free` | sources |
| `p7ii-complete-flat-complex` | sources |
| `p7ii-complete-flat-morphism-splitting` | sources |
| `p7ii-complete-flat-disk-cancellation` | sources |
| `p7ii-complete-flat-minimal-model` | sources |
| `p7ii-complete-flat-residual-perfect` | sources |
| `p7ii-complete-flat-residual-acyclic` | sources |
| `p7ii-complete-flat-residual-quasiiso` | sources |
| `p7ii-complete-flat-transfer-composition` | sources |
| `p7ii-dual-degree-zero-cokernel` | sources |
| `p7ii-dual-degree-zero-field` | sources |
| `p7ii-dvr-pontryagin-adjoint` | declaration, prerequisites, proofSteps, sources, statement, title |
| `p7ii-dual-degree-zero-dvr` | proofSteps, sources, statement |
| `p7ii-quotient-tower-derived-comparison` | prerequisites, statement |
| `p7ii-surjective-tower-derived-limit` | prerequisites, proofSteps, statement |
| `p7ii-module-tower-milnor` | prerequisites, proofSteps |
| `p7ii-perfect-derived-completion-comparison` | prerequisites, statement |
| `p7ii-complete-pseudo-derived-nakayama` | prerequisites |
| `p7ii-strict-tower-action` | sources |
| `p7ii-strict-action-limit-milnor` | sources |
| `p7ii-coefficient-spectral-sequence` | api, proofSteps |
| `p7ii-coefficient-spectral-actions` | acceptance |
| `p7ii-complete-flat-cone` | sources |
| `p7ii-complete-flat-kflat` | sources |
| `p7ii-complete-flat-minimal-residue` | sources |
| `p7ii-strict-action-limit` | sources |
| `p7ii-projective-group-invariants-norm` | sources |
| `p7ii-projective-group-coset-trace` | sources |
| `p7ii-projective-group-invariants-basechange` | sources |
| `p7ii-coinvariant-dual-invariant` | sources |

Outside those nodes, changes are the baseline module correction and three
additions, five added nodes, replacement supplier contracts, reconciliation of
coverage/remaining and gaps, source review metadata and PDF page locators,
three source-issue clarifications, all eight issue verdicts, scope/ownership
notes, one upstream-ownership note and the complete per-node review object.
The suggested file mirrors the substantive corrections and supplies the
additional native APIs and test signatures described above.

## Remaining work and reader reconciliation

The nine packet gaps concern Tor/flat-resolution adapters; finite-order
triangle lifts; compatible descending attachments; linear Hom homology;
Kaplansky transfinite support and local support minimization; strict-limit/Milnor
realization; filtered coefficient pages; and finite filtered convergence.
They name the exact consuming nodes. The four requests are to E1 for stronger
replacement/support, SR.0 for native module transport, L0 for the complete-local
completed-direct-sum extension, and DD.1 for completion/unit transport.
Neither packet completeness nor this verdict closes those obligations.

The reader is an input, not a deliverable of issue #6269. It was therefore
read but not edited. Assembly/package must reconcile it from the accepted
packet before treating it as the new reader:

- Replace the introductory duality/tower paragraphs and declaration entries
  80–81, 87–88 and 91 with the discrete dual and strict tower formulations.
  Remove the two CC.2/CC.3 supplier contracts. CompletedCohomologyPartII must
  import these algebraic P7 results when its later application needs them.
- Update entries 1, 11 and 44 and their supplier paragraphs to preserve
  current upstream SR.0d ownership. Update the E1, L0 and DD.1 contracts and
  direct prerequisites to the reviewed packet's stronger precise statements.
- Insert the five new node entries with their API/tests, and synchronize
  the changed-field ledger above, including the contraction formula,
  quotient restriction comparison, empty interval case and page additivity.
- Replace the old contraction gap and ten-gap count with the nine reviewed
  gaps, keep coverage planned, and synchronize all source corrections and
  PDF page locators. Retain the predecessor's planet budget and existing
  rescope proposals; no manual atlas promotion or layer rename is requested.

There is no unresolved contradiction within the reviewed packet or suggested
file. The reader synchronization and downward owner moves are concrete
instructions for the existing assembly/package work, not a claim of closure
or a request to review this worker's own new implementation.

## Validation

- `python3 scripts/check_blueprint.py` on the packet: 118 nodes, 44 baseline
  declarations, 58 API statements, 42 tests; zero errors and zero warnings.
- `lean-check` on the entire final suggested file: exit 0 at the pinned build;
  236 warnings, all declarations using `sorry`. No other warning or error.
  The original full file also elaborated, so elaboration alone did not reveal
  the mathematical/interface corrections made by this review.
- `git diff --check` and the submission intake path/content checks pass for
  the four authorized deliverables, including the replacement handoff.

The Lean result verifies syntax and types of the planning file; the admitted
mathematics remains unimplemented. No library build, language server, external
promotion, manual issue closure or label edit was performed.
