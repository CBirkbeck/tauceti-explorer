# BP-HilbertModularVarietiesAndShimuraCurves--R18.4

Issue #9421. Codex, session codex-GR7zc9. One-job pass; no second claim.

The packet is complete at target level; its sole scope, HilbertModularVarietiesAndShimuraCurves:R18.4, is **planned**, not closed. All implementation statuses remain unchecked. It has 27 new nodes: 5 constructions, 1 definition, 17 theorems, 3 comparisons and 1 application; 23 API items, 19 discriminating definition tests, 6 planets and 7 pinned baseline declarations. There are 2 mathematical source-proof gaps and 12 supplier contracts/requests. Five requests explicitly add generic Part II inputs; the other seven identify existing contracts or their specialization. No implementation or proof closure is claimed.

The issue points to H0, but that accepted packet ends before R18.4. The accepted R18.2 packet contains nine R18.4 core nodes and its remaining-work record. This pass imports those IDs, preserves their statements and limitations, and changes no prior packet. It supplies the missing residual Eisenstein vanishing and its integral control application, the adjoint ideal, the GL2 Gram matrix with central S inverse, large-image residual Ihara and its derived integral saturation, the exact Saito CM/PEL projector shift, and the Hilbert support and Betti coefficient adapters.

The residual theorem retains l>2, effective smallness, the large-image condition, the exceptional projective PGL2(F5) condition and coefficients acting away from the degeneracy prime. The integral result uses proven finite-free source/target and genuine reduction isomorphisms. Unit Gram determinant gives a separate sufficient splitting theorem. No rational injectivity or characteristic-zero projector is promoted to saturation.

The Saito construction uses the actual higher-dimensional PEL family, rank-two Morita summands, CM bridge and elliptic CM factors. With q0=(2g−1)(w−2), a=(g−1)(w−2), the selected H^(q0+1) realizes H1(F(k))(−a), giving weight w−1. Good-model primes, nonnegative direct tensor exponents and rational projector denominators are explicit. The open Hilbert clause concerns inner cohomology, not all ordinary cohomology.

## Exact remaining proof work

1. Obtain and read Kisin, Potentially semi-stable deformation rings, JAMS 21 (2008), 513–546. MS §3.2, p.14, states the potentially semistable quotient and dimension but refers its proof to Kisin. Publisher and author endpoints refused retrieval in this pass. Match the representing quotient, component dimension, fixed determinant and Hodge–Tate convention. This is the first recorded gap, not a claim that a point predicate represents a functor.
2. Trace the finite-level weight-two p-adic compatibility used in MS Lemma 4.11 and §3.6 to EGS §6 and its underlying original argument, with the semistable extension specified for every K_v^0 type. Carayol’s Theorem A is prime-to-l and cannot close this step. EGS §6.2 was inspected to check its setup and full-cohomology versus multiplicity-space distinction; its more restrictive unramified-p setup is not silently substituted for MS’s general F. This is the second gap. No R22 or modularity-lifting result is a permitted substitute.
3. Resolve the precise lower-tier Part II contracts: adjoint Selmer Taylor–Wiles prime selection over F (SelmerIwasawaCohomology:L2); the finite local principal-series model and oriented residual lattice (SmoothRepresentationsOfLocalGroups:SR.3); weak patching exactness and functorial augmentation (DeformationAndDerivedPatchingAlgebra:R03.5); the two nodal flatness transfer lemmas (R03.3); quaternion-inner-form trace comparison (AutomorphicSpectralTheory:AS.6). Each request gives the exact hypothesis and consumer IDs.
4. Keep the existing supplier limitations visible: CC.0’s constructible support comparison and the accepted arithmetic cohomology/PEL carriers are planned mathematics. Their absence from the pins is recorded in the reader’s carrier omission ledger, not filled by postulated data in Lean.

## Ownership moves

- The finite-level fixed-determinant arithmetic deformation datum needed for Ihara is owned here at R18.4/ihara-local-deformation-models and /taylor-wiles-prime-datum. R08 may import it; the generic representability algebra remains with R03.2 and the arithmetic Selmer calculation with L2.
- The weight-two finite-level Galois–Hecke action needed before patching is R18.4/early-quaternionic-galois-hecke-support. Point the corresponding R19.2 input here once the two source leaves are closed. This does not plan general automorphic compatible systems.
- The minimal quaternionic local/global transfer and type supports needed by the proof are /quaternionic-jacquet-langlands-bridge and /quaternionic-local-types-and-support. R17 imports this early finite-level input; generic smooth representations and trace distributions keep their lower-tier owners.
- R34.5/kuga-sato-projector-weight-comparison can import /quaternionic-saito-projector. This stage imports only the generic lower-tier weights operations and Deligne purity; it does not import R34.5 back for its construction.
- R22 is a consumer, never a prerequisite of this Ihara proof. Accepted core nodes with broader upward citations are unchanged; this packet supplies the precise finite-level subinterfaces its proof needs.

The restructure proposal records these directions and the five Part II extensions. No edits were made to the roadmap structure, queue, labels or other jobs.

## Baseline and current upstream credit

Actual pinned statements were read for TauCeti.LocalCoefficientSystem, its constant functor, pullback and monodromy representation; Mathlib Scheme.EllAdicCohomology, IsDiscreteValuationRing and Module.free_of_finite_type_torsion_free'. Pins are Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

Current read-only Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 already has twisted cochain/cohomology carriers and maps. Their coefficient variance is Hom into the target module; arithmetic W uses the W-dual system and biduality, not the unadapted W system. These new library declarations are credited without a false pinned-baseline claim. Current AlgebraicTopology and the nearby AdicSpaces, ModularCurves and ModularForms documents supplied the style and ownership checks; current IntegralLattices and IntegralHeckeAndGaloisDeterminants were checked for overlap. The existing Chebotarev and ClassFieldTheory contracts are imported with their arithmetic/geometric normalization adapter.

## Sources and corrections

The packet records public URLs, access date, exact PDF hashes and sections read for Manning–Shotton arXiv v2; Carayol ASENS 19; Saito arXiv v2; Milne LEC v2.21; Deligne Weil II; Badulescu’s global Jacquet–Langlands preprint; and Emerton–Gee–Savitt arXiv v3, Lemma 4.1.1. EGS §6.2 was additionally inspected for the remaining compatibility input. The original Kisin proof is the missing source above. No private book files or passages were copied. Every repository source description is paraphrased.

Two MS misprints are recorded with corrections: §6’s infinite-place ramification wording (use split at exactly one real place), and §4.2’s unframed determinant (use the same ψε inverse as the framed ring). The fixed-determinant q-local presentations retain the four variables of Propositions 3.5–3.7; extra smooth frame factors do not change the nodal argument. The unqualified source Frobenius notation is resolved by the explicitly declared geometric convention and existing IHG reciprocal conversion, without treating arithmetic and geometric values as identical.

## Validation

- python3 scripts/check_blueprint.py on this packet: zero errors and zero warnings, including the pinned declaration index.
- lean-check on the 184-line suggested file: exit 0 at the shared pinned build, only declaration-uses-sorry warnings. Six real-bodied light definitions; no placeholder data or heavy constructions. Free memory was checked before compilation. No language server, Lake build, update or cache command was run.
- Reader/packet checks: every node, statement, hypothesis, proof step, prerequisite, API item, definition test and acceptance condition appears in both; source locators and the corrected conventions agree. The carrier omission ledger identifies the actual missing arithmetic types.
- Only the four issue deliverables are changed. The source PDFs, extracted texts and temporary notes are scratch material and are removed after the PR opens.

An independent reviewer should focus on the two explicit p-adic source leaves, the lower-tier exactness/flatness contracts, the central Hecke normalization and the Saito CM weight shift. A follow-up closes those precise source/supplier contracts; it must not broaden Ihara to all irreducible residual images or claim integral projector saturation.
