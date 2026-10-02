# Polynomial normal form and regularity — Codex, 2026-10-02

Refs #3342; Codex — codex-J6LwjP. Claim5956261158 confirmed by bot5956264736.
The whole issue was read before claiming and reread after confirmation.
Base c88d8b3b5ebd6ba36e912657b2ea567070cde5ea. This is a partial checkpoint.

All118 node IDs, statements, hypotheses, source routes, consumer requirements,
135 requests and14 gap groups are preserved. 112 complete node objects are
unchanged; six existing proof/API/prerequisite outlines are enriched. There
are135 API items,128 definition/construction tests plus two inherited exactness
tests,35 unchanged planets and63 inspected pinned-library declarations.
All eight stages remain partial and every implementationStatus unchecked.
The 207-entry geometric omission ledger and unapproved ownership proposal
remain unchanged. No generic algebra or upstream geometry is replanned.

## Actual native proof bodies

Fifteen bodies have matching admission-free checks:
NodeForm.eval/map; NodeSectionFactorization.products; and PolynomialModel's
sectionEval, coefficientMap, polynomialMonic, polynomialNatDegree, normalForm,
normalFormFree, sectionCoordinateRegular, polynomialRelationRegular,
coefficientMapValues, coefficientMapEvaluation, coefficientMapIdentity and
coefficientMapComposition. The two polynomial degree/monicity helpers are
added to the existing polynomial-model API; no new declaration node is needed.

The normal-form proof reuses AdjoinRoot.powerBasis' and its basis vectors.
Nontrivial A gives degree2; the zero ring is handled separately by actual
subsingleton modules. The monomial basis and scalar tower give freeness over A.
Freeness over A[Y] and the existing arbitrary-ring regular-scalar torsion-free
instance prove injectivity of multiplication by v−ιt. F itself is regular by
monicity. No unit discriminant, domain, noetherianity or flatness of a coefficient
map is used. Ring-map extensionality proves coefficient-map compatibilities
without depending on the admitted evaluation-kernel or dual theorems.

Six old examples now have actual proofs. Three additional packet/native tests
cover zero-base monicity, quadratic degree in characteristic two, and section
coordinate regularity over ZMod4 with zero discriminant. All nine appear in the
proved extraction. Other examples and comparison theorems remain admitted.

## Executed verification

Mathlib remains082e2d37e8b0463410cdb532e111cd43d5a66174; TauCeti baseline
f790474821cf4256814db967cb154e7af3d0c369. Thirteen newly cited baseline statements,
their ambient hypotheses and exact index names were read and checked.
Fresh selected extracted source text: Knudsen2012 §3 setup and monic normal-form
calculation, printed11–12/PDF10–11, at the exact v2 URL in sourceReadReceipts.
No fresh visual or whole-paper reading is claimed. The latest handoff and
reviewed parent layers1/3 were read; prior continuous-session upstream and
consumer-brief readings remain applicable. Earlier Appendix and finite
regression receipts below remain historical, not rerun.

Complete exact submitted Mathlib-only file: exit0, zero errors,
130 admitted-proof warnings, zero other warnings,
67 examples, 14.58 seconds. Source SHA-256:
`7581e64bec5f64fcdbda9dabc15feaff726b4e9b3fbe20d56ef9b5557a027804`;
log SHA-256:
`8f3796af970ab4aca468391be7cba94e7115d3d32de88661136a7ea7d5d62150`.

Matching extraction: exit0, zero warnings, nine examples, 4.07 seconds.
All fifteen axiom prints exclude an admitted-proof axiom; only propext,
Classical.choice and Quot.sound occur where needed. NodeForm.eval uses none.
Extraction SHA-256:
`ed81b7a6e2b0926f2fd3df0f6742694b42155c495ff0903e23ac92da99094c0c`;
axiom-log SHA-256:
`d63be0284b90a6afbb03e6d736af2aa6f28aaf086cd0e2fcff641522cdd5f25a`.
The extraction is reproducible by retaining the listed declarations, their
native definitions/imports and these nine examples from the submitted file,
then printing each declaration's axioms. These are candidate bodies in a
suggested file, not a claim of delivered formalized geometry.

One existing pinned compiler ran at a time with timeout1200s and at least71GiB
available; no project, cache, library build or LSP was started. No compiler is
left running. Owned scratch is removed after opening the PR; receipts needed
for continuation are durable here and in prototypeCoverage.

Indexed packet checker, five-file intake and whitespace checks pass.
Read-only current atlas projection: stage DAG3050 vertices/8750 edges; owned
DAG118/264; scoped stages/declarations/requests DAG3133/9246, all acyclic.
All178 supplier pairs are reachable, with no own pending/skipped links.
Stage edges are identical before/after this checkpoint. This checks the scoped
closure, not every accepted declaration graph. The read-only overlay does not
write generated atlas data or promote this packet.

## Continuation

Use the now proved elementary foundation when filling the admitted
section-evaluation kernel, exact alternating/transpose complexes and actual
cokernel/dual/tensor comparisons. The ambient and module-completion signatures
are preserved but their proofs remain admitted. Do not infer Knudsen's relative
stable reflexivity from the ordinary flat Hom comparison.

Resolve the unapproved StablePeriodicCurved, PartII ownership proposal, the
relative S→R criterion with arbitrary S-module Hom/Ext comparisons, and the
two-base local completion comparison of Appendix Proposition6. Its Bourbaki
input is still unacquired; Proposition7 is still an exercise. Then establish
the pointed completed-local hull, coefficient-compatible faithful descent,
actual nodal-family/sheaf interfaces and arbitrary-base finite-presentation
approximation. Global dual-section and universal-curve geometry remain open.
All MC.0–MC.7 consumer, shared-key, positivity, level, determinant, Picard/Torelli
and source-collation gaps remain as recorded.

## Historical predecessor handoff

The following is the preceding worker's118-node checkpoint, retained for
source, completion and ownership detail. Its fresh-reading and compile claims
belong to that worker and are not new checks by codex-J6LwjP.

# Flat ambient transport and module completion — Codex, 2026-10-02

Refs #3342; DESIGN-StableReductionPartII; Codex — codex-5ebb6f.
Claim 5955657381, confirmed by bot 5955659893; the full issue was read before
claiming and reread after confirmation. Base 5dab177. This is a partial
research checkpoint. Its predecessor is [PR5786](https://github.com/CBirkbeck/tauceti-explorer/pull/5786),
whose source/proof/regression receipts remain historical.

118 nodes: 8 definitions, 33 constructions, 14 lemmas, 62 theorems and one
application. 133 API items; 125 definition/construction tests plus two inherited
exactness tests; 35 unchanged planets; 50 pinned baseline declarations;
135 unchanged requests; 14 gap groups; eight partial stages. Every
implementationStatus remains unchecked. No stage or reserved key is closed.

All 110 inherited IDs and statements are retained; 109 node objects are
identical. Only the global dual-section proof, prerequisites and source scope
were enriched. The 207-entry geometric omission ledger, requests, consumer
routes, shared-key coverage, source issues/versions and encoding history are
unchanged. The six moduli-key consumer requirements remain planned under the
exact reserved ID; this continuation does not certify their geometric proofs.

## Eight new declarations

1. Finite presentation of the actual polynomial section ideal, from its
   two-generator matrix cokernel, without noetherianity of the coefficient ring.
2. Canonical flat ambient ideal comparison B tensor_R J to J·B.
3. Canonical dual comparison to Hom_B(J·B,B), with evaluation and actual
   multiplication maps specified independently of the comparison.
4. Multiplication compatibility and the full image comparison.
5. Transport of the actual quotient D/im(R→D), with its pure-tensor formula.
6. Completion of the actual module D, identified with the actual completed-ring
   ideal dual using noetherian finite-module completion.
7. Completion of the actual quotient Q, identified with the receiving quotient.
8. Faithful detection of bijectivity for an endomorphism of Q, as an application
   of the pinned theorem with faithful flatness explicitly assumed.

The ambient map is R→B, unlike the special arbitrary coefficient map A→A′
handled previously. If the second section-coordinate difference becomes a
unit, the extended ideal is B and its dual quotient is zero. Five constructions
have 17 API items and 15 native acceptance examples in total. General Hom,
flatness, completion, quotient and faithful-detection algebra is imported from
Mathlib rather than planned again.

## Fresh reading and ownership boundary

Fresh visual reading: KnudsenII Appendix, printed191–199/PDF31–39, including
Definition1, Theorem2 and proof, the short-exact-sequence lemma, Corollary3,
Propositions4–7 and the explicit split-node matrices, contracting homotopy,
fractional dual and residue example. PDF SHA-256:
`18e04bbf5c24a460ff10e965ebf665ea0229378c6a9521bd279909476012e230`.
Proposition6 only cites Bourbaki III5.4.4, which was not acquired; Proposition7
is an exercise. Neither proof is claimed read or closed.

Read the full statements/proofs at Stacks tags087Q/087R, §10.97 Lemmas1–3,
its source/target completion distinction following Lemma6, and selected §10.39
Definition1/Lemmas5,14. Durable URLs, HTML hashes and exact scopes are in
sourceReadReceipts. Their transitive Ext, resolution, Artin–Rees and inverse-limit
proofs are not freshly certified. Seventeen baseline statements were inspected
at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; modules/lines/blobs are in
baseline.declarations. TauCeti stays at f790474821cf4256814db967cb154e7af3d0c369.

Read the reserved key, binding Yuan/DGH routes, relevant accepted AUDIT-02
parent rows and REV-AUDIT-02, pertinent supplier stages and matrix-factorization
link boundary. There is no reviewed PartII audit row. Earlier full upstream
StableReduction/JacobianChallenge reading in this continuous run remains
applicable; broader predecessor paper reading is historical.

A new ownership proposal requests StablePeriodicCurved, PartII for Knudsen's
relative stable-reflexivity predicate and Theorem2/Propositions4–6, subject to
foundational Ext ownership and compatibility with the existing complete
resolution theory. Its existing layer7 does not already supply that relative
criterion. This proposal is unapproved, not a closed supplier or a new request
against an incorrectly scoped stage. No upstream file is edited.

## Executed validation

Indexed packet checker: zero errors/warnings. Five-file intake and whitespace
checks pass. Preservation and native node/API/test parity checks pass.
The reachable declaration graph has 118 vertices / 264 edges and is acyclic.
Read-only normal atlas assembly with a symlink overlay passes: 212 roadmaps,
2999 stages, 8750 stage edges, acyclic; all 118 declarations listed and no own
pending/skipped link. This does not certify all accepted declaration graphs.

The complete Mathlib-only suggested file elaborates in the existing exact-pin
build: exit0, zero errors,149 admitted-proof warnings, zero other warnings,
64 examples,13.10 seconds,2914636 KiB maximum resident memory. Available
memory was74 GiB before the final compile. No build/cache/project/LSP was
created; no compiler remains running. Suggested SHA-256:
`46cd42d06b12bb85540ccab7a105887c3011dab41a23b8f855e8162c4380ed6c`;
log SHA-256:
`e75e04e713e9f19ac5720c37fe08b24274a070aef12071266ad93754d3ab0b28`.
These checks validate signatures; all proof bodies remain admitted. Historical
finite polynomial regressions were not rerun or attributed to this worker.

## Exact continuation

Prove/import the relative S→R stable-reflexivity criterion, arbitrary S-module
Hom/Ext comparisons, and the two-base local completion comparison of
Proposition6. Do not replace them with ordinary flat ambient Hom transport.
Resolve Proposition7's exercise before using infinitesimal reductions as a
leaf. Establish the unit-discriminant pointed completed-local hull and its
identification with an actual nodal family, coefficient-compatible faithful
descent, actual sheaf signatures and finite-presentation approximation for
arbitrary bases. The global dual-section theorem and universal-curve theorem
remain open. All inherited MC.0–MC.7 geometry, positivity, level, determinant,
Picard/Torelli, source-collation gaps and 135 requests remain. Resume at the
Appendix criterion and ownership proposal with the named adapters as inputs.
