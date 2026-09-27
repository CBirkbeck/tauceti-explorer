# DESIGN-AREA-SeveralComplexVariablesKahlerGeometry — actual-function Levi calculus

Issue #3070. Agent: ChatGPT Pro (GPT-6 Astra Pro).
Session `gpt-20260926-c4e7b2`; publication date 27 September 2026.
Claim `5853852517`; bot confirmation `5853853528`, re-read in the live issue thread before publication.
Branch `gpt-20260926-c4e7b2-3070-scv`.

## Status and files

**Partial new geometry-roadmap design and proof specification.** The seven-stage programme runs from actual complex differentials and Levi forms through pseudoconvexity and the weighted barpartial equation, and through Hermitian geometry to compact Kähler Hodge theory, vanishing and Kodaira embedding. The declaration-level contribution is CV.0; the global stages retain precise source and supplier worklists. No stage is closed and no Lean implementation is claimed.

All five allowed deliverables are supplied: roadmap definition, packet, reader, suggested file and this handoff. All five paths were absent when read; the integrated decomposition path also returned 404. No application, data, content, queue, other packet or unrelated roadmap is modified. This is the next new geometry design requested by the maintainer, not a continuation of the preceding contact-geometry job.

## Mathematical contribution

The prefix uses derivatives of actual functions on existing normed spaces. It does not attach arbitrary first/second jets to a function or store a desired geometric conclusion in a record.

The complex differential is the complex-linear part of the real derivative, with the factor one-half and the sign of i fixed. Its existing linear-map kernel is the complex tangent condition. The complex-Hessian diagonal uses the existing bilinear real second derivative with factor one-quarter. Its comparison with the actual mixed complex derivative uses the pinned C2 symmetry theorem, and its affine-line comparison uses the actual one-variable Laplacian.

The product and scalar chain rules include all first-derivative cross terms. Holomorphic pullback is proved through the actual complex map and cancellation of the trace of its real second derivative on a complex line. The norm-square and pluriharmonic examples pin these conventions and reject substituting real convexity or real-smooth pullback for the complex notions.

At a regular zero level, the normalized Levi diagonal is restricted to the actual complex tangent and divided by the operator norm of the actual real derivative. Under a GIVEN nonzero C2 defining multiplier, it transforms by h/|h|. Positive factors preserve the chosen inside; negative factors reverse its sign. The normalization uses the fixed ambient norm and is not declared invariant under arbitrary norm/chart changes.

Two explicit boundary tests prevent invalid strengthenings. For the unit-sphere function rho in C2, sigma=rho-rho^2 defines the same local inside and has the same gradient, yet its complex Hessian is negative on the normal direction and positive on the tangent direction at (1,0). Separately, rho(t)=t and sigma(t)=t(1+|t|^(3/2)) are C2 defining functions with a ratio that is not C2. The multiplier proof therefore does not close general C2 defining-function independence. The reader specifies the correct implicit-function/level-curve route and records it as outstanding work. Neither example is alleged to be an error in the source.

General plurisubharmonicity remains an upper-semicontinuous extended-real notion; it is not defined by the C2 diagonal. Total derivative fallback values at nonsmooth functions are never treated as evidence of regularity or positivity.

## Ownership and global hypotheses

The exact ComplexComparisonPartII C0–C1 stages were read and used for their Weierstrass/coherence, nonreduced analytic and local acyclicity direction. General intrinsic analytic-space and Stein Cartan extensions stay with that owner, not in a competing sheaf package. C2 and C4 supply GAGA/Chow only after the analytic projective embedding, avoiding a circular proof.

The PDE requests use its actual weak-derivative, mollification and trace/Rellich stages. They do not pretend scalar density proves weighted barpartial graph-norm density or that scalar-domain elliptic estimates prove compact vector-bundle Hodge theory. The latter generic extension is recorded explicitly. The new roadmap owns the complex-geometric estimates and Kähler identities.

The linear Hodge/polarization carriers are imported from HodgeStructures L0–L1. The new geometric realization must prove its actual decomposition and comparison maps. A real Kähler class is not automatically a rational polarization; the rational assertion retains a rational class.

ComplexManifolds PR279 was inspected while open at head `581f66fed0f12fe49b8f5dd96aa18d3e435c190a`, in `Paul-Lez/TauCetiRoadmap`. Its README blob is `d1e74161fee827ffc9970e345b34a97662eff2ef`. It owns atlas realification and holomorphic bundle gluing. No matching atlas stage was resolved, so the interface is a gap to reconcile rather than an invented prerequisite or a reason to duplicate its carriers.

The weighted theorem fixes a Euclidean coefficient-norm normalization. Demailly VIII (6.5) is an (n,q) theorem; the scalar Euclidean specialization still needs its exact top-form/norm adapter. On curved manifolds the canonical-bundle/Ricci contribution cannot be dropped. The compact Hodge and vanishing branch retains compactness, a Kähler metric, positive line-bundle hypotheses and the point/tangent separation needed for embedding.

## Inventory and prototype

The packet has **28 nodes: 1 definition, 2 constructions, 21 lemmas, 3 theorems and 1 comparison; 9 API items; 10 definition/construction tests; 5 planets; 11 baseline references; 9 source records; 9 requests; 5 gap records; 7 stages and 0 closed stages**.

The suggested file has **31 named declarations and 14 examples**: 28 core nodes, three additional API-only lemmas, ten definition tests and four theorem-level regressions. Every data-bearing definition/construction has at least three tests. The normalized-Levi tests provide actual regularity and kernel witnesses, rather than presuming potentially inconsistent hypotheses.

**Lean was not compiled.** No Lean/Lake executable or pinned local build was available. Quotient/kernel coercions, complex scalar restriction, second-derivative regularity and all proof placeholders still require elaboration. Neither a signature nor the structural checker establishes that.

## Source evidence

Pins, confirmed against the current baseline file:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The eleven Mathlib declarations were read at the exact pin, including statements, parameters and proof/construction passages. Seven source files supply the actual Hessian/Laplacian, C2 symmetry, chain/product/bilinear rules, scalar restriction and the existing one-variable harmonic primitive. The packet gives exact file blobs and locators. No generic Hessian, Laplacian or harmonic primitive is replanned as a new node.

The mathematical sources are Jiří Lebl's version 4.4 of 31 May 2026 and Jean-Pierre Demailly's 21 June 2012 author version. Lebl's printed pp.66 and 85 were visually inspected; p.68 was parsed-only after a failed image. Its defining-function and some subharmonic proof exercises remain required. Demailly's printed pp.59,311,334,378 were visually inspected; the normalized definition on p.58 was parsed-only after failures. Embedding passages on pp.358–359 were statements rather than a full proof audit. The Hodge, vanishing and weighted endpoints rely on preceding analytic inputs not all decomposed here.

No PDF-byte hash, publisher-edition comparison or whole-book certification is claimed. The different normalized and unnormalized Levi conventions are reconciled, not called an erratum. There is no source-error record or author communication.

Read the worker, blueprint, expansion, browser and upstream rules; the complete claimed issue; and the neighbouring ComplexComparison, ConformalMapping, PDE, HodgeStructures and ComplexManifolds texts. The oversized aggregate library audit returned empty content. Limited default-branch searches for Levi, psh and related terms are not a fresh exhaustive absence certificate, particularly for the later Chern/elliptic stages.

## Checks actually performed

The local draft passed **412 structural/preservation-of-inventory checks**: JSON syntax, exact scope/pins, unique node/source/baseline/stage IDs, required fields, all local/baseline prerequisite resolutions, the displayed 28-node DAG and seven-stage DAG, matching external-stage request strings, short source excerpts, planet limits, unchecked statuses and declaration/API/test-name agreement with the reader and prototype. These checks are not the repository-wide validator or a whole-atlas cycle check.

The exact SymPy suite, deterministic seed 3070, ran successfully twice with **345 assertions**. It differentiates actual polynomial functions, not free-standing matrices. It covers the real/complex derivative factors, scalar and product rules, affine-line Laplacian, four nonlinear holomorphic polynomial maps and their second traces, squared-modulus pullbacks, the normal/tangent counterexample, 24 positive rational defining multipliers with 96 tangent comparisons, and 96 checks each for positive and reversed normalized signs. It also checks pluriharmonic nonconvexity and the C2-ratio asymptotic obstruction. These finite examples supplement the written proofs rather than prove universal statements.

The uploaded reader and prototype were fetched and match the complete locally checked blobs exactly:

- reader `50638e32874f92c0de8a4accba01ed15b9c65366`;
- suggested Lean `27232a7dfd7a8ecbee3db85d47519dd7275fca3d`.

The roadmap readme and repeated packet proof/metadata prose were condensed from the local drafts for publication; the seven stage targets, 28-node mathematics and declaration/API/test inventory are retained. No byte-identity claim is made for those JSON drafts. The actual published packet must pass current-head submission CI, whose observed result is recorded in the PR conversation. No successful predecessor PR is used as evidence for this one.

No git command, local full-repository check or full-atlas DAG test ran. There is no claim that passing the remote structural/pinned-index check proves mathematics or Lean elaboration.

## Exact continuation

First elaborate CV.0 against the pin and close the full Hermitian polarization and general C2 defining-function comparison using the actual implicit-function/level-curve interface. Preserve the distinction between first-derivative regularity, a given C2 multiplier, and an arbitrary C2 pair. Then construct the general psh object and its subharmonic/regularization proofs; do not replace it with a smooth Hessian predicate.

Reconcile the existing manifold/bundle and coherent/Stein owners, and assign the genuine compact-bundle elliptic extension before expanding the global branches. Source-decompose the weighted adjoint estimates, Levi-problem exhaustion, Chern/Kähler identities and harmonic comparisons. Complete the positive-power section/jet construction and actual embedding before invoking projective GAGA/Chow. Every stage has its precise remaining list; this is a partial checkpoint rather than a completed seven-stage roadmap.
