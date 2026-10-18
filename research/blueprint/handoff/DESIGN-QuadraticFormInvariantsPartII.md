# DESIGN-QuadraticFormInvariantsPartII — completed target-level pass

Issue: #3385. Worker: Codex, session codex-J5ZJbB. Date: 18 October 2026.

The bot confirmed this worker's claim on issue comment 6244432567. This submission is a complete planning pass for independent review, not a proof-closed package or a checkpoint. No implementation is claimed.

## Deliverables and coverage

The new roadmap defines Q2.0–Q2.7. Its packet has 47 nodes: 5 definitions, 10 constructions, 31 theorems and 1 application; 64 API items, 45 discriminating unit tests, 31 planets and 14 verified baseline declarations. Every implementationStatus is unchecked. Every stage has coverage planned; no stage is closed. The remaining lists propagate the exact outstanding supplier contracts and proof-input audits through the prerequisite graph.

The reader is definitive: all target statements, hypotheses, source locators, proof routes, APIs, tests, layer dependencies, acceptance criteria and eight worked examples are present. The suggested file contains only real-bodied binary and C_i definitions and statements over existing pinned carriers. Heavy carriers are README targets, following the current WORKERS shape rule.

The mathematical chain covers characteristic-two nonsingular binary forms, scalar extension and bilinear Witt action; all-characteristic Pfister construction and roundness; polynomial representation, transfer, norm principles, projective quadric fields and the Arason–Pfister bound; the graded quadratic comparison and invariant-zero criterion; arbitrary-rank non-dyadic unit/value isotropy; C_i systems, algebraic/transcendental extensions and dimension drop; coefficient fields, finite real-place descent and the dimension-unit theorem; and the two patch-open henselization loci.

Important boundary checks: the characteristic-two filtration is I_b^(n−1)I_q; its coefficient group is H¹_et of logarithmic differentials, not étale μ₂ or BGK sections. The valuation results include equal characteristic two and exclude mixed characteristic (0,2). Finite Kronecker dimension is never replaced by finite generation. The final local–global step is applied only after characteristic-zero finite descent. The real-place proof uses a finite inverse system of bad places, with the pinned Mathlib nonemptiness theorem and cohomological continuity.

## Ownership and split decision

Read-only current upstream audit: TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. This is separate from the pinned baseline Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The current parent already owns all-length odd-characteristic Pfister construction and additive generation, in addition to Witt theory, signatures, Clifford/quaternion and low-degree invariants. These are imported, including current-main results that postdate the pins. Only the missing all-length proofs and characteristic-two structures are added. RealAlgebraicGeometry Layer 1 owns ordering/real-closure existence. AdicSpaces Layer 1 owns Spv and the patch topology. No upstream file was edited.

The issue explicitly permits planning the first direction and proposing independent directions separately. The packet proposes one new QuadraticFormsRealFunctionFields roadmap for both real-function-field routes, with RF.0 ordering/real-closure adapters, RF.1 Harrison/signature/u theory, RF.2 real-curve/Brauer/DVR/common-zero inputs, RF.3 level/cohomology/quadric criteria, and RF.4 conjecture statements. All 30 routed items are accounted for exactly once in routeAssignments. The two shared C_i/Tsen–Lang items have their owner here and are imported by that proposal. RealSurfacePeriodIndex stays downstream and owns the real-surface endpoint theorems. No second roadmap file is created. The maintainer must decide this split; no work is silently dropped. No higher-tier target was moved into this plan.

## Exact remaining proof-input audits

1. **Kato comparison.** EKM Fact 16.2 states the required characteristic-two graded comparison and cites Kato, Inventiones 66 (1982), 493–510, DOI 10.1007/BF01389226. The full primary proof was unavailable from the public/cleared sources read. Obtain an authorized/public full text, verify the differential relation presentation and the kernel I_q^(n+1), then refine Q2.3/kato-graded-comparison. BGK does not establish this quadratic kernel theorem.
2. **Morel external leaves.** The all-odd-characteristic construction, Ext vanishing and lifting argument were read and planned. Independently trace the Ojanguren–Panin Witt purity theorem (Morel Theorem 2.2), the generic Rost cycle-module/residue/transfer/unramified-sheaf infrastructure, and the prime-field computations used on p.66 to primary proofs and exact owners. Search ownership before assigning the generic infrastructure. These leaves are explicit in G2; they are not assumed proved. OVV's characteristic-zero proof is not used to cover positive odd characteristic.

## Supplier contracts to discharge

There are 16 exact request records, with neededBy lists in the packet and full contracts in the reader:

- Parent QuadraticFormInvariants Layers 1, 4 and 7A: existing odd-characteristic decomposition, ring/Pfister/generation and low-degree coefficient adapters.
- ProfiniteCohomology Layers 10, 11 and 12: all-degree cohomology, dimension inequalities and cup products.
- LogicAndDefinabilityInNumberTheory LD.1: arbitrary-rank Hensel/residue/henselization interfaces, special integral primitive generators, and algebraic-henselization/completion comparison at number-field finite places.
- AdicSpaces Layer 1: existing valuation spectrum and patch clopens.
- SchemeAndStackFoundations SF.0: projective charts/function fields and the precise nonemptiness theorem for r homogeneous equations in N>r variables over an algebraically closed field. SF.2: sheaf/Ext/cohomology continuity and the geometric cohomological-dimension estimate.
- MotivicEtaleKTheory M.5a and M.5d: motivic complexes and the all-odd-characteristic norm-residue/motivic–étale comparison. The local quadratic sheaf and kernel argument remains here.
- ClassFieldTheory Layer 6: local-field cd₂=2, including p=2.
- HigherLocalFieldsAndHigherClassFieldTheory HL.6: the exact Jannsen local–global injectivity in Dittmann–Pop Fact 2.1; existing generic HL.6 targets do not already establish it. Consumed here only in characteristic zero.
- K2SymbolsBrauer T.2: graded algebraic Milnor symbols and mod-two quotient.
- HigherLocalFieldsAndHigherClassFieldTheory HL.2: H¹ logarithmic-differential coefficient quotient with Artin–Schreier degree one, alongside its existing logarithmic coefficient node.

Requests are specifications, not messages sent to their workers or assertions that the supplier already proves them. Closure requires their owners to supply these exact interfaces. The reader identifies each consumer, so follow-up can begin directly with a chosen remaining contract rather than reconstructing the graph.

## Sources and corrections

Public author/publisher PDFs read: Elman–Karpenko–Merkurjev, targeted proof chains in §§1–4, 7–9, 15–20, 22–23, 97 and 101; Dittmann–Pop arXiv v2 §2, Proposition 3.2 and Lemma 3.9 with their proofs; Morel's published 2005 article, the statements and proof chain named by Q2.3; OVV Theorem 4.1 with its characteristic-zero boundary; Benoist §0.5 and the proof boundary of Theorem 0.12; Benoist–Wittenberg §2.3 and Lemma 3.7 for the split. The real-function-field proposal still needs its own full source audit. Exact URLs, read sections, versions and PDF hashes are in the packet. No private book passages or source excerpts occur in the deliverables.

Four inherited Dittmann–Pop findings are recorded with extraction provenance and corrections: characteristic-two outer-factor notation, the invalid formally-real cd₂ intermediary, missing tensor-block signs, and the valuation-neighborhood variable. They are scoped to the arXiv v2 actually read. The Annals landing page was checked, but its PDF was not obtained and no published/preprint collation is claimed. No corrigendum was located by the recorded searches.

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/QuadraticFormInvariantsPartII.json`: 0 errors, 0 warnings.
- Embedded sourceIssues checked with check_errata's versions_checked and check_issues functions: passed. Its standalone CLI expects errata-v1 rather than blueprint-v1, so that CLI is not a packet validator.
- Independent local structural checks: acyclic target graph; 30 distinct routed items assigned exactly once; reader contains every packet target statement, API statement and test; all implementation statuses unchecked.
- `lean-check research/blueprint/suggested/QuadraticFormInvariantsPartII.lean`: exit 0 at the pins; only permitted proof-placeholder warnings. Available memory exceeded 20 GB. No Lake build/update/cache command or language server was used.
- `git diff --check`: passed. Only the five allowed deliverable paths are submitted.

Next action is independent review of this completed planning pass, with particular attention to G1/G2, the exact Jannsen contract, the proposed real-function-field split, and the current-main import boundary. Proof closure and packaging depend on those audits/contracts. No second job is claimed by this run.
