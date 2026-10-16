# BP-SmoothRepresentationsOfLocalGroups — handoff

Issue #9908. Worker: Codex, session `codex-CW4r7M`, 16 October 2026.
This is a complete target-level planning pass for independent review, with
explicit gaps; it does not claim mathematical closure or implementation.

## Deliverables and coverage

- [Packet](../packets/SmoothRepresentationsOfLocalGroups.json), with `part: null`
  and all eleven issue stage IDs preserved.
- [Reader](../readmes/SmoothRepresentationsOfLocalGroups.md), with layer contracts,
  new target statements, proof routes, API, checks, source locators and the
  qualified late integral chain under its existing IDs.
- [Suggested Lean](../suggested/SmoothRepresentationsOfLocalGroups.lean), 61 lines:
  one real-bodied light definition over existing Mathlib carriers, three API
  theorem signatures and three examples.

The new packet contains 11 nodes: 4 constructions, 2 definitions and 5 theorems;
18 API items; 21 unit tests; 8 planets; 14 baseline declarations; 8 gaps and
3 requests. Every new definition/construction has three API items and at least
three discriminating tests. The SR.3 planet count is six; SR.1 and SR.6 have
one each. Every node retains `implementationStatus: unchecked`.

| Stage | Status |
| --- | --- |
| SR.0 | planned |
| SR.0:abelian-category | planned |
| SR.0:derived-extension | planned |
| SR.1 | planned |
| SR.2 | planned |
| SR.2a | planned |
| SR.3 | planned |
| SR.3a | planned |
| SR.4 | planned |
| SR.5 | planned |
| SR.6 | planned |

The packet and reader give a precise remaining list for each stage. None is
marked closed. Imported roadmap mathematics is planned work, not a declaration
implemented in the pinned libraries.

## Existing upstream work and identifiers

The decisive scope check was the current
[Smooth roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md),
at TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`.
Its 157 named targets already cover the basic smooth category, Hecke theory,
derived dual/Hecke targets, induction, early admissibility, complex Bernstein
theory, early second adjointness, Satake, integral families and much of the
parameter-finiteness engine. These are imported, not replanned. The Suggested
file was inspected as a prototype, not treated as implemented library theory.
The related ReductiveGroupsPartII scope, conventions and supplier contracts
were also checked.

The existing SR.0 and SR.4 atlas packets contain 170 target IDs. The new
`roadmapImports` registry accounts for every one: 152 same-name current-upstream
matches, four aliases and fourteen residual Part II targets. The
`upstreamTargetInventory` separately records all 157 upstream target headings
with immutable source-line links. The old SR.0 packet is accepted; the old SR.4
packet needs changes. Importing its IDs does not accept its unqualified claims.
Do not create copies of these 170 nodes in a follow-up.

The new scope proposal is **Smooth representations of local groups, Part II**.
It preserves the current stage IDs and accepted RS-21 boundaries, including
the early abelian meaning of unqualified SR.0. No other packet or atlas stage
edge was edited.

## Mathematical boundaries retained

- The early characteristic-zero second adjunction is independent of the late
  FS/DHKM branch. With the stated modulus convention, the normalized second
  adjunction uses the opposite Jacquet functor; the unnormalized right adjoint
  is the opposite Jacquet functor twisted by the original modulus.
- Schwartz modules mean algebraic nondegenerate modules. The Ext comparison
  has an admissible source and an arbitrary Schwartz-module target. Comparison
  with the imported matrix-coefficient temperedness predicate additionally
  retains its scalar-central-character hypothesis. Discrete-series
  projectivity retains compact centre. Bernstein decomposition is used
  componentwise, without assuming one global good level for every admissible
  representation. No flatness of Schwartz over Hecke is asserted.
- The principal-series centre is over a sufficiently large coefficient field;
  its inertial Weyl action may include affine character twists. Completion is
  at a generic rational point with free orbit, not a global torus/quotient
  isomorphism. The smooth tangent dimension is n; locally analytic directions
  remain with the locally analytic roadmap.
- The residual DHKM chain is stated in detail in the reader. Theorems 1.1–1.2
  require noetherian Z_ell-algebras, ell different from p. Corollary 1.3 gives
  second adjointness over every Z[1/p]-algebra. Theorem 4.1's centre map requires
  noetherian flat Z[1/p] coefficients; Theorem 4.3's nonflat coefficient
  finiteness is over the scalar extension of the integral centre, not an
  unrestricted centre map. Lemma 3.4 is the projective-embedding input; the
  excursion-finiteness argument is in section 3.1. Fixed-depth stability has
  one exponent for all ell at fixed group, level, depth and positive operator.
  The faithful dual uses injective torsion coefficients and smooth products.
- FS Corollary IX.0.3's spectral-centre descent needs its component-group
  invertibility condition. The unreduced excursion action does not inherit
  that restriction. A fixed finite wild level is not a global level for the
  entire smooth category.

## Ownership, findings and required continuation

The continuation should start with the packet's eight named gaps, rather than
expanding the imported basic theory again:

1. `G-DERIVED-ENHANCEMENT`: the actual enhanced smooth category, degree-zero
   centre comparison and equivariant derived tensor interface.
2. `G-SCHWARTZ-ANALYSIS`: the Harish–Chandra estimates and completed cellular
   contraction underlying the stated Schwartz targets.
3. `G-PRINCIPAL-EXT`: a direct generic-block Morita/Jacquet proof identifying
   smooth first-order self-extensions with ordered character deformations.
4. `G-ESSENTIAL`: a source-qualified canonical integral GL_n essential-vector
   contract; derivative rank one alone does not select it. GL₂ field newvectors
   and the minimal-lift application keep their existing downstream owners.
5. `G-GEOMETRIC-ACTION`: move down the minimum Fargues–Fontaine/Bun_G, sheaf,
   six-operation and Satake/fusion constructions needed for the actual FS
   action. An assumed action record does not resolve this gap.
6. `G-DAT-CONSEQUENCES`: read Dat (2009), Lemma 4.2, and the Dat (2005),
   Proposition 3.14 / Dat (2009), Lemmas 4.12–4.13 inputs used by DHKM.
7. `G-CONDITIONAL-CLASSIFICATION`: preserve the conditional Harish–Chandra
   support input and the general Whittaker, nonsplit, modular-type and count
   obligations at their current owners.
8. `G-OWNERSHIP`: reconcile the historical finite-wild LP1 ownership direction
   with the existing current-upstream Smooth construction and present tiers.

The three precise supplier requests are to SchemeAndStackFoundations SF.1
(finite invariant quotient and free-orbit completion), SF.4 (dual-number
tangents and torus completion), and ReductiveGroupsPartII RG2.2 (enlarged
building, oriented facets and proper central length). These are lower-tier
requests, not assumptions silently counted as proved.

For RT-AREA-geomlanglands/9, current upstream SR.1.3 already owns the integral
Lambda-centre, corner inverse limit and ell-adic separatedness. The packet
records outgoing SR.1 links to ES0:classical-center and ES7:parabolic. The
maintainer should correct ES0's supplier sentence to SR.1; editing that other
job's packet was outside this issue. The enhancement comparison remains a gap.

For RT-AREA-geomlanglands/26, use the existing single integral finite-wild
construction and obtain ell-adic versions by base change. The older LP1 move
would duplicate current upstream work and introduce an upward prerequisite.
The packet records this conflict for the maintainer; no second scheme or
comparison between duplicate constructions is planned. RS-21 now has an
accepted review. The minimum geometric and derived interfaces above are the
remaining downward moves; higher roadmaps must consume their eventual owner.

## Reading provenance and checks

Pinned baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The fourteen cited
declaration statements were read at these pins. Current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and the reviewed library audit
were also checked. Searches do not establish implementation of any new target.

The packet's `sources` records the particular primary passages read in DHKM v2,
FS v4, Ding's published article and collated arXiv v2, CEGGPS v5, Gan–Savin v1,
Opdam–Solleveld v2, Schneider–Zink Part II and He's published article. Exact
versions, section/theorem/page locators and PDF hashes are preserved there and
in `sourceVersions`; the reader maps every routed source to its existing
supplier or new extension. Imported upstream sources were not represented as
fresh complete readings. No restricted book was used and no source passage
was copied into the deliverables.

Two Ding notation/composition misprints are recorded in `sourceIssues`, with
the published locators, preprint collation, correction searches and typed
corrections. Their intended mathematics is unchanged. They await independent
verification; this worker did not review its own findings.

Validation on 16 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroups.json`:
  zero errors and zero warnings, with the declaration index available.
- `lean-check` on the suggested file: exit zero, six permitted proof-placeholder
  warnings and no other warnings. Available memory was checked first. No
  custom Lake project, library build, cache update or language server was used.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  zero problems.
- `git diff --check`: clean.

Only this job's packet, reader, suggested file and this handoff are submitted.
Temporary retrieval and generation files are removed after submission. Review
and follow-up can resume from the committed source inventory and gap contracts.
