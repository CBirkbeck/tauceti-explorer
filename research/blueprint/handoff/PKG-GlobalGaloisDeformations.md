# PKG-GlobalGaloisDeformations

Issue #7540. Codex, session `codex-M1o4bP`, 10 October 2026.

The four requested deliverables are complete for package review. The input packet,
reader document and suggested file are unchanged. This is a roadmap package, not
an implementation of arithmetic deformation theory. The bot confirmed the session's
claim in issue comment 6098963788. No second issue was claimed.

## Delivered

The README presents all 67 targets in eight layers, with all 91 API contracts and
71 named regression specifications. Every definition/construction has at least
three tests. Each target has sources with edition-specific numbered locators and
pages, and explicit prerequisites. The order is R04.1–R04.6, G8, G7, placing
variable-determinant representability before its enormous-image application.
The README has mathematical introductions, conventions, boundaries, dependency
links and consumer exports; it contains no queue history or coverage claims.
`metadata.toml` is `topic = "math.NT"`.

Suggested.lean joins the native portion of the supplied suggested file, removes
historical/process headers, and adds coefficient pushforward on lifts and strict
classes, actual continuous adjoint Z1/H1 tangent signatures, fixed-determinant
strict classes, and explicit action/restriction formulas. The strict action is
conjugation, the simultaneous action multiplies frames on the left, and the
fixed-determinant action restricts the lift action. The native action interfaces
require a topological ring. They do not assert continuity of conjugation for an
arbitrary topology on a ring.

As in the supplied suggested file and PROTOCOL §13's nonexhaustive convention,
supplier-dependent signatures are omitted where their conditions cannot be stated
against the imported baseline. The final mathematical contract block preserves
every target, API name and regression name, in the package's notation. These
comments are neither elaborated signatures nor Lean examples. The module
isomorphism-class functor, polynomial-law deformation functor, coefficient
categories, arithmetic local-condition rings, polarized group, Selmer complexes
and auxiliary-prime systems need their named supplier interfaces before the full
signatures can be elaborated. No empty carriers, conclusion-valued structure
fields or placeholder predicates substitute for them. Compilation certifies only
the native declarations and examples. It does not certify the entire arithmetic
specification or the supplier contracts.

The native regressions include actual matrix and quotient-space calculations:
nonlocal scalar-normalization failure, its Artinian-local correction, the proper
S3 adjoint sign line despite absolute irreducibility, scalar frame quotients of
dimensions 1/0/0 for two/one/no frames, characteristic-two and characteristic-three
trace exceptions, twists and integral patching numerology.

## Source and library audit

Read WORKERS.md, both protocols and UPSTREAM_GUIDE.md. Read the current upstream
Chebotarev and ProfiniteArithmetic READMEs in full and their relevant suggested
interfaces, then the pertinent ClassFieldTheory, LocalGaloisGroups,
IntegralHeckeAndGaloisDeterminants and ModularCurves interfaces. Upstream roadmap
main was `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; the current Tau Ceti library
was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were read only.

The build baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the declarations and
hypotheses of the packet's 26 baseline interfaces at the shared build, including
continuous Z1/B1/H1. The shared LowDegree source hash agrees with that exact Tau
Ceti commit. B1 is an algebraic range; continuity of the action is required to
put it inside Z1. H1 is used as an additive quotient, without treating its
pointwise quotient topology as the intended discrete cohomology topology.
Read the relevant library-coverage rows and searched the current library; there
is continuous low-degree cohomology and generic ring/presentation algebra, but
no imported native arithmetic Selmer or global deformation-ring interface used
as a stand-in here.

Checked the mathematical source statements in Gee §§3,5; Kisin Lecture 1;
Chenevier §§1.17,2.22,3.1; BLGGT Lemma 1.2.3; KW author-final §§2.4–2.7,4–5,9;
the ESI counterpart of §4.1; CHT §§2.1–2.3; and published ACC+ §6.2, especially
Lemma 6.2.32 and Proposition 6.2.33 and their proofs. Taylor's Lemma 2.5 is the
meromorphic-continuation paper, KW reference [59], and its proof uses l > 3.
The public sources are cited in the README. The published ACC+ copy was read
in the maintainer's cleared library without copying it or source passages.
The package uses our own mathematical descriptions throughout.

## Clarifications for review and input follow-up

- R04.3's relation bound needs T = S or liftability of each local problem outside
  T; compare CHT Corollary 2.2.12, p. 25. The README states this separately from
  the tangent-generator surjection. The input presentation node does not expose
  that additional hypothesis. The input files were not changed.
- Gee Lemma 3.17(3), p. 14, states a sufficient radical-ideal converse. CHT Lemma
  2.2.3, p. 19, supplies the general invariant-ideal correspondence, including
  nonradical local quotients. Both are distinguished and cited.
- Fixed-determinant framing uses full adjoints in degree zero and trace-zero
  positive degrees. The nonempty-T correction is |T|−1; no-framing H0 is handled
  separately. Variable-determinant and polarized complexes retain their different
  Euler characteristics. GL_n framings remove one scalar coordinate; polarized
  fixed-multiplier framings at odd p do not.
- G8's type condition includes unramifiedness outside S, not just membership in
  the specified local subfunctors. The latter phrase alone would allow extra
  global ramification.
- In dyadic finite-level data, first identify G'_n = G_n/2^(n−2)G_n with the
  corresponding free-lattice quotient, then choose a compatible surjection from
  the lattice onto the whole G_n. KW p. 86 supplies this choice. It embeds the
  whole dual in the torus; the chosen quotient supplies its torsion subgroup for
  the action chunks. A quotient alone does not specify the whole embedding.
- Published ACC+ numbering differs from arXiv v2. The bibliography records both
  and cites each explicitly. The enormous-image presentation retains
  F = F+ F0, zeta_p not in F, p not dividing 2n, enormous cyclotomic image,
  eigenvalue field, T = S, and q at least the ordinary dual Selmer dimension.
  It proves nonnegativity before using qn−n²[F+:Q] as a variable count.

No higher-tier material moved down. This is the tier-15 bundle with
LocalGaloisDeformationRings. FoundationsAndLibraryIntegration references were
replaced by their actual library or ClassFieldTheory suppliers, and UPSTREAM
references by named upstream layers. Chebotarev Layer 10 and 11.3(2) already
provide the density and higher-residue-degree discard estimate: the new selector
here is the conditional Selmer-detection induction and padding argument, not a
second analytic density development. IHG.1 already owns henselian reconstruction;
it is applied to the Cayley–Hamilton quotient. The local pro-p finite-generation
result stays in LocalGaloisGroups Layer 3. Supplier requests in the unchanged
packet remain implementation dependencies, not claims of completed proofs.

## Validation and next step

The final `lean-check research/blueprint/packages/GlobalGaloisDeformations/Suggested.lean`
passed at the pinned build with exit 0, no errors and only 40
`declaration uses sorry` warnings. Memory was checked before each sequential
compile; no Lean server or library build was started.

`python3 scripts/check_blueprint.py research/blueprint/packets/GlobalGaloisDeformations.json`
passed with zero errors/warnings. It reports all eight stages planned, 67 nodes,
91 APIs, 71 tests and 20 supplier requests; its input status remains partial.
It was a read-only consistency check, not a proof-closure claim.
A package-specific check verified all 67 target anchors, all API/regression
names in both deliverables, three tests per definition/construction, source and
prerequisite paragraphs on every target, resolving local links, the size limit,
metadata and absence of private paths/process text in the README.
`git diff --check` passed, and only the four authorized paths changed.

Next is the independent package review, particularly the relation-bound
hypothesis and the distinction between native Lean signatures and the full
mathematical contracts. There is no unfinished packaging task or checkpoint.
