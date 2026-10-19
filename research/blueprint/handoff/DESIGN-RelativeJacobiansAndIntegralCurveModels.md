# DESIGN-RelativeJacobiansAndIntegralCurveModels

Completed target-level design for #11046 by Codex (GPT-6), session
`codex-n5Qv4G`, on 2026-10-19. The claim bot confirmed the claim before work
began. This is a complete planning pass, not an implementation or a claim of
dependency closure.

## Deliverables and coverage

The roadmap definition, packet, reader document and compact suggested file
cover RJ.0–RJ.5. All six stages are **planned**; none is closed. All 27 node
implementation statuses are unchecked. Counts: 1 definition, 6 constructions,
12 theorems, 3 comparisons and 5 applications; 34 API items, 28 discriminating
Checks, 14 planets and 10 verified pinned baseline declarations. There are
11 explicit supplier requests, 3 supplier-scope gaps and no sourceIssues.

The roadmap is a Part II of the upstream Jacobian challenge, with that parent
as first prerequisite. It imports the existing JacobianChallengePartII
relative Jacobian, degree-component, base-change and point-Abel nodes. The
normalized curve×Jacobian universal-bundle contract is distinguished from that
roadmap's Jacobian×Jacobian Poincaré bundle. Néron existence and Raynaud's
semistable Picard theorem retain their existing owner. Finite-flat uniqueness
is imported from the exact Raynaud node; RJ.5 proves its specialization
consequence using the finite schematic closure of a cyclic group of integral
sections. No notion was moved from a higher-tier roadmap. This new roadmap is
outside the published tier list; assign it after its suppliers and before its
arithmetic consumers when updating that list.

The current upstream JacobianChallenge README and Suggested.lean and the
AlgebraicVectorBundles README were read in full. Current native rigidified
Picard functors, affine acyclicity, higher two-affine vanishing and the
proper-curve point/place equivalence were inspected and reused. Their exact
declarations and current commits are in the packet. They are not described as
pinned declarations. The suggested file uses only pinned native cohomology
and restriction maps; it has one theorem and no substitute Picard/Néron
carriers, admitted data definitions or admitted examples.

## Remaining dependency work

The precise `requests` and `coverage.remaining` entries in the packet are the
worklist for independent review and supplier implementation. Three scope
increases must be resolved before closure:

1. R11.1 currently gives local existence over excellent DVRs. The required
   smooth-Jacobian result over any DVR is BLR §9.5 Proposition 6(a), p.268,
   using the general abelian-variety existence theorem of Chapter 10. That
   Chapter 10 proof has not been read or decomposed here; it remains a Néron
   supplier obligation, including global Dedekind gluing.
2. R11.4's current exact nodes assume strict henselian DVRs with algebraically
   closed residue field. The requested arbitrary-residue semistable result
   uses BLR §9.5 Theorem 4 and Remark 5, pp.267–268: geometrically reduced
   fibres provide an étale quasi-section. The supplier owns this extension,
   its naturality and descent. RJ.4 glues and evaluates those comparisons.
3. Native normalization is integral but does not prove finiteness. SF.0 must
   provide Nagata finiteness, Stacks Lemma 29.54.14, tag 0AVK, chapter p.140.
   Over a non-Nagata Dedekind base the stated model theorem instead assumes
   finite normalization. Normality is not used as a substitute for
   regularity or semistability.

Additional requests spell out rigidified/sheaf comparison, relative divisors,
cohomology module structure, curve dictionaries, positivity, Galois descent
and unit-order torsion. Existing exact supplier nodes remain explicit graph
edges. Completion invariance is distinguished from ramified base extension;
full Néron special fibres are distinguished from identity components and
component quotients. The residue-primary torsion result requires mixed
characteristic and the strict absolute bound e<ℓ−1. The boundary and dyadic
Checks prevent a stronger claim.

## Sources and validation

BLR was read only from the maintainer-cleared library copy. The packet records
edition, checksum, precise reading bounds and own-word source matches. The
complete second finite-type proof in §9.5 and Chapter 10 are not claimed read.
Kleiman v1, Raynaud's 1974 paper and the Stacks chapter PDFs supply the other
locators. No source text or private source file was copied into the repository.
All material necessary for continuation is in the five deliverables; the
scratch sources and generator need not be retained.

Validation on 2026-10-19:

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeJacobiansAndIntegralCurveModels.json`:
  0 errors, 0 warnings, using the available pinned declaration index.
- `lean-check research/blueprint/suggested/RelativeJacobiansAndIntegralCurveModels.lean`:
  **compiled successfully**, with only the expected warning that its named
  theorem uses `sorry`. Memory was checked before compilation (76 GB
  available). No library build, cache download or language server was started.
- Submission-file, no-admitted-data and final consistency checks are recorded
  in the pull-request description.

Next step: independent target-level review of this complete design, then
fulfil the supplier requests and package the accepted roadmap. There is no
second job claimed by this session.
