# Handoff: REV-AnabelianGeometryAndNonabelianChabauty

Issue [#526](https://github.com/CBirkbeck/tauceti-explorer/issues/526); checkpoint
by Codex `codex-i1BjcC`, 2026-10-05. Input explorer revision
`b4ea721503c52188587f85a4ebc5541d02f6e151`.
Continue this same unfinished independent review. The reviewer did not author
the blueprint. There is no final packet `review` object or acceptance verdict.
Earlier independent checkpoints
[#6170](https://github.com/CBirkbeck/tauceti-explorer/pull/6170),
[#6175](https://github.com/CBirkbeck/tauceti-explorer/pull/6175) and
[#6180](https://github.com/CBirkbeck/tauceti-explorer/pull/6180) are incorporated.

## Durable evidence from this pass

The review report now starts with a **50-row scoped node audit**, positions
51–100 inclusive (zero-based packet order), from `NC.3/cocycle-map-one` through
`NC.3/h1-finite-quotient-equivalence`. Statements, hypotheses, proof sketches,
direct prerequisites, sources and actual suggested signatures were examined,
including all construction APIs/tests in this family. This verifies the
mathematical calculations within that scope, not every precursor proof or
whole-packet closure. The previous 49-node late-family screen (314–362) and
160-entry pinned statement locator table remain in the historical report with
their attribution. The new packet checkpoint preserves its predecessor in
`independentReviewCheckpoints`.

The significant checks are ordered cocycle/gauge conventions, invariant targets,
**same-N** gauge reflection and inflation injectivity, inverse-gauge
normalization, the neutral restriction fibre, quotient-action joint continuity
using an open product quotient map, reversed-inclusion transitions, and the
native Types colimit universal property using a common intersection refinement.
No blanket claim about the full 363-node plan is made.

Corrections/additions:

- Three new concrete identity-S₃ tests pin the actual descent, inflation and
  forward descent equivalence to nonidentity values. Inverse laws alone could
  accept an equivalence conjugating the output by (12). New statements still
  use `sorry`; this is a planning prototype, not an implementation.
- A native `by decide` example proves c(n)=1, c(gn)=c(g), c(ng)≠c(g) for a
  conjugation coboundary in S₃. It discriminates right/left constancy and the
  normality requirement. The report distinguishes these proved arithmetic
  assertions from the mathematical centralizer/cocycle explanation.
- Finite-quotient class surjectivity directly cites `NC.3/nonabelian-h1` for
  its actual orbit carrier and representative choice.
- The residual central-extension action codomain is corrected to G×B→B.
  Keep the preceding positive-defect convention: Kim arXiv v1's printed
  inverse defect gives the negative class, with the same zero locus.

Fresh reading: exact Kim v1 printed pp.5–9 definitions, Proposition 1 proof and
selected central-extension passages; Poonen Definition 1.3.14 and complete
Proposition 1.3.15 proof, printed pp.11–12. The general compact/discrete
colimit is an authored deduction, not the printed Hilbert 90 theorem. Source
hashes and links are in the report. No whole-paper, Serre or published-version
collation is claimed. All seven NC coverage entries and the upstream roadmap
comparators were consulted. The selected consumers' **47 Mathlib prerequisite
statements** were reread with their namespace/hypothesis context at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti remains pinned at
`f790474821cf4256814db967cb154e7af3d0c369`. This session does not claim a fresh
all-160 consumer audit. Historical encoded payloads were preserved without
being decoded or executed.

Counts: 363 nodes, 160 baseline declarations, 17 requests, 10 gaps, 11 planets;
320 definition/construction API entries and 253 tests; 340 API entries and
269 tests across all node kinds. NC.0/NC.3 remain partial, other stages
not_read, all implementations unchecked. Packet `complete` means its
budget-complete planning pass, not review completion.

## Checks and reproduction

Packet checker: 0 errors, 0 warnings. The native S₃ arithmetic and relevant
baseline name checks elaborate without admissions. Full suggested `lean-check`
was attempted but stops at the unavailable
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree.olean`.
Do not build or update libraries to repair it.

The Mathlib projection exits 0 with **693 warnings, all `sorry`**, no errors or
other warnings. Available memory was 95 GiB. Reproduce in authorized on-disk
scratch by removing exactly `^import TauCeti\..*` lines and the exact block
`section Abelian` through `end Abelian` inclusive. Keep
`section AbelianTwistingTest`; check memory and run `lean-check` once under
WORKERS.md. This validates signatures outside additive comparisons, not the
admitted statements/proofs or the full suggested file.

Suggested SHA-256:
`ea15ef060b3deffef127327fe1f1431e6400f22ae2c20d5fc238b111435c92cf`.
Projection SHA-256:
`20475e3ff9c7cd0f9c85f76ca2c873310836cddf0bc95e20d456f04874183afc`.
The report and public pinned sources contain all durable evidence. No scratch
file is required to resume. Scratch is deleted after submission.

## Where to resume

1. **Node/consumer matrix:** complete positions 0–50, then 101–313. The former
   supply the cocycle, native fixed-point and orbit-carrier precursors of this
   pass; the latter include coefficient/source changes, twisting, kernel
   adapters, stabilizers, central/additive comparisons and geometry. Reuse
   this scoped table and the historical late-family calculations, but check
   transitive closure before issuing any final per-node verdict. Successful
   projection elaboration and inherited source receipts are not mathematical
   proof certificates.
2. **Central/additive interfaces:** keep positive D and Tau Ceti's continuous
   B². Connecting H², continuous-lift independence, exactness/freeness and
   canonical additive-cocycle comparison remain explicit omissions. Native
   sign/normality arithmetic does not construct them. Compatibility with Tau
   Ceti's finite-quotient transitions/colimit and the all-degree comparison
   remains to be settled. ProfiniteCohomology Layer 10 owns the latter.
3. **Geometric leaves:** prior checkpoints read the complete Stacks 01ZM
   statement/proofs, surrounding 03RH/03RM arguments and Schmidt–Stix
   Appendix A.3. Their affine/limit/gluing, Tsen/stalk/Leray/colimit and
   Isaksen/Artin–Mazur proof leaves still need closure. Finish 03SB/0F13
   context/proofs and finite-presentation property/finite-group descent.
   Descending a cover and eventual vanishing of its pulled-back class are
   distinct; restriction to a separable closure need not be injective.
   Algebraic torsor comparison needs point existence, compatible actions,
   orbit homeomorphisms and effectivity.
4. **Ownership/coverage/planets:** inspect current fine-grained IG/SF supplier
   contracts and gap supersession chains. Requests are desired exports,
   not established results. IG.0's geometric product/P¹ contracts need
   confirmation; IG.0/IG.1/IG.6 have no completed relevant supply here, and
   SF.2's accepted packet is partial. Avoid an NC.3→NC.0 stage cycle.
   Keep M₀,n, generic NS and heights with their routed owners. The unaccepted
   raw-homotopy candidate supplies no registered foundation stages. Complete
   every planet and duplication screen.
5. **Reserved key/final verdict:** preserve the single
   `AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1`, its exact
   coefficient class and canonical map in every degree. Full finite and
   p-primary classes use full profinite π; constant-Fₚ specialization alone
   does not justify pro-p replacement. Raw equivalence retains separately
   verified geometrically-unibranch scope; geometric Lean interfaces are
   omitted. `sourceIssues` is empty with an unfinished screen. Honest
   partial/not_read stages alone do not reject a budget-complete pass. Only
   after the whole screen supply the required `review` object and a justified
   verdict for every node.

No reader, atlas data, supplier packet or author handoff was changed. Reader
reconciliation should reflect the strengthened tests and residual B codomain
correction when authorized. Continue only this review's deliverables/handoff.
