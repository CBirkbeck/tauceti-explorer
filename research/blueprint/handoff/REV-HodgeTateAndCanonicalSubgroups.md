# REV-HodgeTateAndCanonicalSubgroups — handoff

Codex, session `codex-P3IfDh`, 14 October 2026. Refs #9394. **Complete independent review, accepted after corrections**, not a checkpoint. The four issue deliverables and this note are the only files changed. This worker did not author the blueprint or its accepted parts.

The [review](../reviews/REV-HodgeTateAndCanonicalSubgroups.md) gives the scope, exact source readings, baseline checks, corrections, supplier boundaries and validation. The packet now records one verdict per effective target: 133 verified, four corrected, no added or unverifiable targets. Historical source verdicts of unchanged imported nodes retain their two accepted part reviews; this session independently re-read the four additions and the six imported field corrections.

The effective inventory is **137 targets, 411 API items, 224 definition tests and 37 planets**. Every stage is planned, none closed. The 25 requests and 23 gaps remain open. All 42 distinct baseline declarations were independently checked at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. All 179 direct fine suppliers resolve and were read; their planned contracts do not mean their implementations or packages are finished.

## Corrections to carry forward

- T2's compact-open index has an explicit nonemptiness proof. Its GL₂ component test uses X(Np^m,ζ) for a fixed Weil pairing; X_full is the disjoint union, following current TauCetiRoadmap ModularCurves.
- The neat open projection is separated **quasi-pro-étale**. Its proof tests over strictly totally disconnected perfectoid bases and cites P5/cofiltered-limits-of-affinoid-perfectoid-spaces, D1/pro-etale-maps-over-std-base and D3/etale-and-quasi-pro-etale-morphisms-of-stacks. The renamed API is `ShimuraTower.infiniteLevel_quasiProEtale`. Added `infiniteLevel.lift`, `.lift_proj` and `.hom_ext`.
- Finite AIP torsor comparison uses n≥1, the scaled radius and the Hilbert canonical range at each quotient. At n=0, coefficient sheaves use AL₁ downstream. Finite conjugation does not preserve Γ₀(p); the proof uses the general chart law and the ratio of actual torsor lifts. The Lean annotation now has the corrected ambient containment direction.
- The suggested file is **780 lines**, with **16** light definitions/structures, six milestones, ten examples and **707 distinct names across 771 index entries**. Compilation exits 0 with four `sorry` warnings only; no admitted data. The historical parts' fuller suggested files remain unchanged.
- AUDIT-37 has an accepted independent review; its roadmap results have not reached the aggregate library register. All nine layers are not built. No existing upstream theory was re-planned.

## Packaging and ownership

Build the effective union explicitly:

1. Read the two hash-pinned part packets in `assembly.imports`.
2. Remove `assembly.outgoingImportedNodes` (T5/aip-hodge-tate-comparison).
3. Replace every imported prerequisite list by `assembly.importedPrerequisites[id]` and every listed corrected field by `assembly.importedNodeCorrections[id].fields`.
4. Add the four whole-packet nodes. The union is exactly the 137 coverage/review ids.

The current atlas merger only concatenates historical nodes and does not apply those overlays or exclusion. Raw promotion therefore retains the retired T5 target and its old O5 link. Use the effective packet/reader for packaging. At the parts' next revision, materialize the authoritative overlays and retirement; no part bytes were changed here.

The manager should retain the existing ownership handoffs:

- PerfectoidShimuraVarieties retires S0/p-level-tower, S0/tower-right-action and S0/infinite-level-diamond in favour of their T2 ids, redirecting its 41 internal citations. It keeps kernel/component/rigidified and perfectoid-representative targets. Carry the corrected `quasiProEtale` API name.
- OverconvergentAutomorphicForms O5/geometric-aip-comparison imports T5/aip-torsor-hodge-tate-comparison; sheaf isomorphism and Hecke results stay O5/O6. The old T5 sheaf theorem is outgoing.
- ShimuraCompactifications C6's Hilbert Hasse/ordinary consumers should cite its C4 semiabelian-hasse-boundary-comparison, rather than T0.
- The proposed T2:tower sub-layer remains a restructuring proposal; T2 already has six planets. No layer or atlas edit was made.

Supplier qualifications remain material: PerfectoidSpaces--P0 and ShimuraData currently have `needs_changes` reviews. P9 must supply relative completed pullback/effective descent; R07.1 the O_C conormal/Faltings contract; R11.3 arbitrary-C Raynaud realization; R2 the actual integral models and transfer; R07.2 normalized determinant pullback. The Scholze–Weinstein classification early owner and TC.2/HigherHida BCGP application nodes remain missing. Resolve suppliers before packaging upstream under the bottom-up rule.

The 44 inherited source findings retain their earlier review provenance. E14–E26 collide between the T0 and T6 parts; cite them with the part packet. This review adds no source-error allegation. No uncleared book was used. Public source URLs, full hashes and exact locators are in the packet/parts and review; nothing needed by another worker depends on disposable scratch files.

## Checks

- Main packet checker: 0 errors, 0 warnings.
- Effective-union audit: hashes, 137 unique nodes/verdicts, coverage, internal acyclicity, reader field agreement, 411/224 API/test counts and all planet caps pass.
- Lean: `lean-check` at the pins, exit 0; four `sorry` warnings only.
- `scripts/check_sorry_data.py`: passes.
- `research/blueprint/intake.py check-files`: all five allowed files pass.

No work remains in this review job. Packaging and the ownership redirects above are subsequent jobs; do not reopen this as a checkpoint. The overlapping assembly job ASM-HodgeTateAndCanonicalSubgroups (#240), if still active, can build on this whole reader or be retired by the maintainer.
