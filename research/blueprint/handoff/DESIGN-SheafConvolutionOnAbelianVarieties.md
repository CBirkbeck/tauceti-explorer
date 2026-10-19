# Design handoff: sheaf convolution and convolution monodromy

Issue: #3353. Worker: Codex (GPT-6), session `codex-00yeZm`.

The target-level planning pass is complete. The packet has status `complete`,
and SC.0, SC.1, SC.2, SC.3, SC.4, SC.5, SC.6, SC.7, SC.8 and SC.9 each have
coverage `planned`. None is claimed closed or implemented. This is a completed
design submission for independent review, rather than a checkpoint.

## Delivered and checked

The roadmap definition, blueprint packet, full reader and suggested Lean file
are the four sibling deliverables named `SheafConvolutionOnAbelianVarieties`.
The reader states all targets, hypotheses, direct dependencies, proof routes,
definition APIs, discriminating examples and acceptance checks. Its crosswalk
accounts for all 26 routed items in `PAPER-LAWRENCE-SAWIN-25`.

There are 51 nodes: 8 definitions, 9 constructions, 33 theorems and 1 comparison;
69 API items, 52 unit tests, 44 planets, 10 baseline declarations, 17 supplier
contracts, 2 proof gaps and 20 source findings. Every node has implementation
status `unchecked`. There are at most six planets per layer.

The suggested file elaborated using `lean-check` at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: exit status zero, with only the 22
permitted unfinished-proof warnings. Its three light definitions have real
bodies on existing finite-set and integer carriers. It has twelve theorem
signatures and ten examples. Heavy geometric carriers and their APIs remain
precise reader targets, as the current roadmap shape requires.

The blueprint checker passes with zero errors and zero warnings against the
pinned declaration index. The source-finding/version schemas, allowed output
paths, JSON, reader/packet alignment, data-definition check and staged whitespace
check were also checked before submission.

Independent exact arithmetic checks cover 1,981 displayed Eulerian comparisons
in their stated ranges through ambient dimension 200, using integer recurrence
and rational upper bounds for radicals. Three subset histograms, twelve Pell
invariants and the first three nontrivial binomial divisibility identities were
checked. These finite checks do not prove the uniform estimates in G1. The
source ancillary program was read and was not executed. The reader retains the
checked ranges and formulas; no scratch file is needed to understand them.

## Mathematical decisions for review

- Generic vanishing precedes the negligible-ideal and quotient constructions.
  Arbitrary perverse objects have general translated exceptional loci; torsion
  translates are asserted under geometric-origin hypotheses.
- The quotient is the existing generic Serre localization, with an EDC.5
  request for the perverse-heart/Verdier comparison. It is not identified with
  the entire derived quotient. Existing finite-comodule Tannaka declarations
  do not replace abstract reconstruction and its exactness criteria.
- The represented rank is the positive number `N=n!d`, while the topological
  Euler characteristic has sign `(-1)^(n-1)`. In the native supplier convention
  the Hodge–Tate weights are `-q`, with multiplicities `d A(n,q)`.
- The nonsymmetric microlocal simplicity argument is restricted to `n>2`.
  Its repaired degree argument needs only an isogeny generically injective on
  the hypersurface, not an isomorphism of the ambient variety. Independent
  review should check this repair in SC.4/almost-simple against its supplier
  contracts.
- The threefold exception is `d=8855`, giving rank `N=53130`; the first Pell
  pair is indexed separately from the first genuine degree exception. Surface
  counting does not imply surface convolution simplicity.
- SC.7 retains the full independent product `(G*)^c` and its direct-sum
  distinguished action. SC.8 proves the prime-to-residue-characteristic
  Frobenius form. Choosing the order prime different from that residue
  characteristic gives the uniform orbit output needed by the arithmetic
  consumer. No unrestricted p-primary avoidance assertion is exported.
- The surface period case has a separate proof in
  SC.9/surface-period-finiteness. Torelli reduces it to embeddings of a fixed
  curve; the Jacobian universal property and unramified Hom space reduce a
  connected family of embeddings to translations. The fixed ample line bundle
  leaves a finite translation kernel. Thus `m=1` suffices in dimension two,
  subject to the explicit polarized comparison and relative universal-property
  exports R16–R17. This avoids using the `n>2` simplicity theorem for a surface.

## What remains, and where to resume

**G1: uniform Eulerian and occupancy certificates.** Start with
SC.6/eulerian-comparisons, then the two large-ratio exclusions. Derive explicit
large-dimension cutoffs from CA.2/C.1–C.5 and supply exact finite certificates
below them and for the B.11/B.12 occupancy cases. Repair the ancillary program's
missing fifth contribution and incorrect logarithmic factor as specified in
E16–E17. The finite checks through 200 are diagnostic evidence. Do not mark
SC.6/classical-monodromy established from those checks alone.

**G3: higher-dimensional marked-period relations.** Start with
SC.9/finite-period-detection and its complete statement of the marking problem.
CDK's bounded-norm theorem supplies closed projected identity-orbit Hodge loci.
Verify that the identity transport, flat pullback/trace idempotents and chosen
polarized period quotient give nested relations for divisibility, and that
their stabilization detects the required period fibres. Explain the passage to
one algebraic family whose every torsion-character summand has finite
monodromy. An arbitrary isomorphism of total cohomology is insufficient to
assert preservation of a designated trace summand. This obligation concerns
the higher-dimensional monodromy route; the surface proof is separate.

Every open supplier contract is stated in full in the packet and reader.
The ownership checklist is:

| Requests | Supplier | Required export |
| --- | --- | --- |
| R1–R3 | EtaleDualityAndPerverseSheaves, EDC.6/5/7 | Coherent six operations and character descent; heart/quotient comparison; characteristic-zero semisimplicity and spreading receipts |
| R4 | MotivesAndAlgebraicCycles, MC.6 | Fibre-functor torsors and EHS group-scheme exactness criteria |
| R5–R6 | AbelianSchemesAndArithmeticModuli, A2/A3 | Albanese, finite stabilizers and quotient families; deck-character and trace comparisons |
| R7 | SchemeAndStackFoundations, SF.5 | Multiplicity-sensitive cycles, coherent Riemann–Roch and Chern–Gauss–Bonnet |
| R8 | ComplexComparisonPartII, C5 | Regular-holonomic/perverse comparison and microlocal index compatibilities |
| R9 | PadicHodgeTheory, R06.2 | General Hodge–Tate cocharacter from compared fibre functors |
| R10 | TauCetiRoadmap/ReductiveGroups, layer 7 | Normalizer, Jordan and Lie-containment inputs |
| R11–R13 | TauCetiRoadmap/RepresentationTheory/LieHighestWeight, layers 4/6/8 | Minuscule table, exterior weights and exceptional dimensions |
| R14 | TauCetiRoadmap/RepresentationTheory/SpinRepresentations, layer 4 | Spin/half-spin dimensions and image conventions |
| R15 | HodgeStructuresPartII, H.7 | CDK bounded-norm finite theorem and closed fixed-orbit locus |
| R16 | StableReductionPartII, MC.6 | Polarized integral weight-one curve/Jacobian comparison |
| R17 | TauCetiRoadmap/JacobianChallenge, layer F | Relative pointed Abel–Jacobi universal property |

R9 moves the general Hodge–Tate cocharacter input down from its routed
Lawrence–Venkatesh Part II consumer to its existing lower owner R06.2.
The maintainer should repoint that consumer accordingly. General Eulerian
objects and Appendix C bounds remain in CA.2. The existing reductive,
highest-weight, spin, Jacobian and generic Albanese work is imported.
No other packet was edited and no restructuring is requested.

## Sources and version limits

All source-derived statements are paraphrases with theorem/section/page
locators. The packet and reader record URLs, versions, access dates, SHA-256
hashes, read scopes and individual findings. The main source is
Lawrence–Sawin, arXiv:2004.09046v5 (16 October 2025), §§2–4 and Appendices B–C,
with its ancillary Eulerian program. Supporting passages read are Krämer–Weissauer
arXiv:1111.4947v6; Krämer's characteristic-cycle papers
arXiv:1604.02389v3 and 1807.01929v2; Esnault–Hai–Sun's author copy, Appendix A;
Weissauer's rigidity note arXiv:1111.6095v1; CDK arXiv:alg-geom/9402009v1,
Theorem 1.1 and Corollary 1.3; and Milne's corrected 2021 Jacobian notes,
Proposition 6.1, pp. 19–20, and Theorem 12.1, pp. 38–39.

The Annals landing page was checked for bibliography and correction searches.
The 144-page version of record was not read or collated. All twenty findings
are expressly restricted to the 121-page v5 preprint or its ancillary program;
none is asserted against unexamined publisher text. No source required an
uncleared book copy. No PDFs, source passages or ancillary program are included.

The pinned library declarations were read at their recorded commits. Current
Tau Ceti library commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current
TauCetiRoadmap sources were also read without building or modifying them,
including ReductiveGroups, LieHighestWeight, SpinRepresentations,
OrthogonalSpinGroups and JacobianChallenge. The current generic Albanese
carrier is not claimed to exist at the older pins.

The next worker should begin with the independent review of these five
deliverables. After acceptance, follow-up work must discharge the two named
proof obligations and exact supplier contracts before any layer or the whole
roadmap is declared closed. All needed statements and locations are durable
in these files; the job scratch directory can be removed.
