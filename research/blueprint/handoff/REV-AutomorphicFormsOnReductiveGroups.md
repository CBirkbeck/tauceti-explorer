# Handoff: REV-AutomorphicFormsOnReductiveGroups

Codex, session `codex-CRfBlG`, issue **#359**, 6 October 2026.
Branch: `codex-CRfBlG-review-automorphic-forms`.

**Finished independent review; needs_changes.** This is a completed review,
not a checkpoint of an unfinished review. All 90 nodes were checked at target
granularity, including each source locator/excerpt, hypotheses, proof sketch,
direct prerequisite, API/test outline and planet. The entire original suggested
file and all 34 original pinned baseline statements were read. This session did
none of the planning by Claude session `claude-OpNE3H` (PR #6704).

The [review report](../reviews/REV-AutomorphicFormsOnReductiveGroups.md) is the
durable record of every correction, all ninety individual verdicts, the full
36-entry pinned baseline audit, thirty public source versions, eighteen gaps,
the supplier and six red-team checks, and the exact omitted API/test names.
The packet's `review.checked` also records each node. No evidence needed to
continue depends on retaining scratch files.

## Result to preserve

- 90 nodes: 26 definitions, 18 constructions, 46 theorems. No new node or
  lemma-level split; no original node removed. **56 corrected, 14 verified,
  20 unverifiable**; 66 node records have changed fields.
- 236 API items, 167 planned unit tests and 30 planets. All 44 definitions
  and constructions retain at least three planned tests. These counts do
  not claim implemented APIs or executed mathematical tests.
- 36 baseline declarations, 30 sources and 157 node citations. The added
  Mathlib building blocks are `PiTensorProduct` and `Module.DirectLimit`.
  `RestrictedProduct` remains a valid point-space baseline but is removed
  from the restricted-tensor node's prerequisites.
- 40 owner requests and 18 gaps. Every coverage row is `partial`, with a
  precise stage-specific continuation list. Every node remains `unchecked`.
- Ten source findings: nine confirmed and **E8 rejected**. The alleged GSp4
  example with two length-one Siegel Kostant representatives is false: the
  four lengths are 0,1,2,3. Do not reapply its dropped-uniqueness correction.
  E10 records the known published Goldring–Koskivirta correction to Harris's
  general other-degree vanishing claim for the full disconnected group.

The main normalization repairs concern GL1 Schwartz decay at both ends;
the augmentation-ideal derivative test and convolution sign; genuine
derivative-compatible compact pairs and smooth Frechet representations;
unitary split-central discrete-series/cohomology conventions; SL2 principal
series parity; pointwise constant terms and their actual Fubini fibres;
algebraic-group highest-weight integration; coherent SL2 coefficient signs;
cohomological finite-part rationality; integral torsion eigenclass data;
GL2 rotation, bounded-cusp, Casimir and Hecke factors; and AMF's full
stabilizers, discrete rational centre and coefficient-action conventions.
The report records exact before/after implications and changed fields.

## Where a revision resumes

1. Use this corrected packet and its per-node ledger, rather than restoring
   the old suggested signatures. The twenty unverifiable verdicts identify
   analytic, classification, relative Ext, component or exact-supplier proof
   boundaries that still prevent acceptance. Partial stages alone are not a
   reason to reject an otherwise justified pass.
2. Read the original nonroutine proofs identified in the gaps. In particular,
   the relative Koszul/Ext resolution, Harish-Chandra smoothing/finiteness,
   rapid-decay/Hilbert–Schmidt estimates, BHR/coherent-limit and rational
   cuspidal-cohomology arguments are not supplied by their proof-route labels.
   Public Knapp §§2–4 and Harris printed pp.58–63 have now been inspected;
   their availability assertions must stay corrected. Knapp is at
   `https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf` and Harris
   is in `https://www.jmilne.org/math/Books/AA1988b.pdf`.
3. Resolve `K` versus the noncompact Hodge stabilizer `K^h`, which contains
   `A_infinity`. On centrally balanced coefficients, import the actual
   quotient and prove the comparison with
   `(p_h/a_infinity, K^h/A_infinity)`. Keep full disconnected versus
   positive-similitude component actions explicit. Preserve parameterized
   `(kappa,w)` uniqueness without asserting uniqueness or concentration
   solely from a cohomological degree.
4. Request algebraic-group highest-weight integration from its existing
   owner as a Part II extension. ReductiveGroups Layer 1 only supplies
   representations/comodules, while LieHighestWeight Layers 4 and 9 still
   need the algebraic character-lattice/integration constraint. Do not
   duplicate those owners here. Preserve the added ModularForms Layer 5
   multiplicity-one and Layer 8G rational-field imports.
5. Verify the eventual exact supplier declarations. The AA and ShimuraData
   statements were read but their reviews say `needs_changes`. AL.0 has a
   Bessel plan; AL.3 lacks the requested genericity node. SR, ALS, AS and RG2
   campaign scopes were read, with no matching packet exports present.
   Stage promises are conditional inputs, not closure certificates. AA height
   comparison must avoid a cycle through AF.1. Orchestrator coordination
   retains proposed AF.1b and general AMF ownership with R18.3 specialization.
6. Restore the missing faithful Lean signatures and discriminating tests
   against those actual supplier types. The corrected file contains six
   families of expressible objects, eight main packet names and seven exact
   named tests. Local lattice and abstract eigenclass statements are partial
   specializations. The report's per-object inventory lists every missing
   API/test name. No arbitrary action, measure, PDE-free Maass predicate or
   unconstrained projector should replace the required mathematics.

The reader document was outside this review's writable deliverables.
**The next revision's deliverables should include it.** The report lists the
six required red-team findings and all reader synchronization points, including
its false GL1 Gaussian, compact/Hodge pair, coherent and Hecke normalization,
H1 torsion, type-number and definite-constant statements, and E8 application.
Update its source list, precise locators and partial coverage too. Propagate
E8's rejection to the originating extraction through its own job; do not edit
another packet as part of this review.

## Validation boundary

The packet checker reports **0 errors, 0 warnings**. The final suggested file
was elaborated with `lean-check`, using the existing shared build at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: **exit 0, zero errors, 38 warnings,
all `sorry`**. No imports or declarations were temporarily disabled.
The checked file's SHA-256 is
`d2261a0b11c07fc3adcccd6276e455e1cb871940e91a59c5698d7fdc944b0bfa`.

The file imports only Mathlib. All original Tau Ceti citations were checked
by reading their source at `f790474821cf4256814db967cb154e7af3d0c369`; this is
not a claim to have compiled unavailable pinned Tau Ceti objects or omitted
analytic signatures. Available memory exceeded 20 GB. No new project,
repository copy, build, cache download or language server was used; no
compilation remains running.

Deliverable/private-path and diff checks are run before opening the PR.
Only the packet, suggested file, report and this handoff change. The intake
determines review completeness from the recorded verdict, so `needs_changes`
completes this review and sends the blueprint to revision. No manual atlas
promotion, issue closure, label change or merge was performed.

This run opens one PR and stops without claiming another issue. Its scratch
directory is deleted after submission; the public versions, packet, report
and handoff contain the lasting continuation evidence.
