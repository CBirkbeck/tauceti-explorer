# DESIGN-AutomorphicSpectralTheoryPartII

Completed target-level design pass for issue #3394 by Codex, session
`codex-SwqWWZ`, on 19 October 2026. The claim was confirmed by the swarm bot
at issue comment 6261258714. This submission contains the new roadmap
definition, packet, reader, suggested Lean file and this handoff. It requires
independent review; it is not an implementation or a claim of mathematical
closure.

## Deliverables and coverage

The packet is `complete`, with 63 nodes: 23 definitions, 6 constructions,
30 theorems, 2 comparisons and 2 applications. Its 29 definitions and
constructions have 87 API items, 87 discriminating unit tests and recorded
uses. There are 32 planets, with no more than six on a layer, and seven
pinned-library citation anchors. All implementation statuses are `unchecked`.

| Layer | Coverage | Targets |
| --- | --- | --- |
| SM.0 | planned | Finite-rank zero sets, entire interpolation, real-form spectral lattices, moderate/rapid/sharp symbols and polynomial-preserving difference operators. |
| SM.1 | planned | Real Schwartz comparison, reductive Delorme extension, Kostant tensor operators, rapid estimates, moderate multipliers, finite K-type detection and the adelic stage comparison. |
| SM.2 | planned | Quotient weights and depth, volume function, SLF representations, weighted smooth L², rapid and growth spaces, nuclearity, constant-term extensions and weighted decompositions. |
| SM.3 | planned | Relative characters, Arthur factorization, weighted cuspidal-support projections, regular constant terms, the regular GL_n Lapid expansion and Schwartz kernels. |
| SM.4 | planned | T-characters, fixed-inner-form CAP, multiplier and quasi-cuspidality predicates, typicality, Casimir counting and finite archimedean selection. |
| SM.5 | planned | Simultaneous occurrence, mixed separation, normalized global isolation, non-CAP isolation, preservation of admissible representations, GL_n support and the conditional discrete-data refinement. |

No layer is closed. The packet records 16 gaps: the Nash/functional-analysis
comparison G1 and one gap for each of 15 supplier requests. Coverage records
name the outstanding contracts at their direct consumers. The mathematical
targets, hypotheses, proof plans, acceptance checks and source locators are in
the packet and reader; nothing depends on retained scratch files.

The packet's `inputCoverage` accounts for all 99 routed items: 80 from BPLZZ,
18 from BPCZ and one from Bakker–Tsimerman. The two Schwartz route aliases
coalesce under the issue's canonical id `AutomorphicSpectralTheoryPartII`.
The congruence spectral gap is already planned by
`CongruenceSpectralGap:CSG.5/congruence-bound`, including curvature −1,
the continuous threshold and the 21/100 bound. The ownership proposal routes
that item to its existing owner. It does not build another Laplacian or
introduce a dependency of Schwartz isolation on the congruence-gap theorem.

## Existing work and remaining contracts

The library audit and parent/neighbor packets were inspected before planning.
The packet records Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Cited source
statements were read at those pins. The additive definition `Summable` is
generated from `Multipliable` in its source and elaborates in the suggested
file. The declaration index omits that generated name, so the packet uses
the checked generating declaration as its citation anchor and explains the
relationship explicitly.

The current upstream roadmap tree was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. OperatorTheory and
ReductiveGroups supplied complete ownership/style comparisons. OperatorIdeals
OI-B32–41 and OI-B84, LieGroups real forms, PDE local Sobolev targets and
RealAlgebraicGeometry's Nash boundary were checked at the relevant interfaces.
Generic spectral calculus, operator ideals and root-data structure retain
their upstream owners. AF.0 retains its existing adelic test-Schwartz and
uniform moderate-growth carriers. AS.1 retains normalized cuspidal data.

The requests are recorded in the packet, with exact statements and consuming
node ids; no supplier file was edited and no separate issue was opened.

| Request | Supplier | Required verification or strengthening |
| --- | --- | --- |
| R1 | AS.0 | Vector-valued holomorphy, strict-LF closed subspaces/open mapping and fixed-Fréchet bilinear continuity. |
| R13 | Current ReductiveGroups | Root data, maximal-torus lattices and connected central/derived coverings, with real components. |
| R14 | Current LieGroups | Real forms, Cartan identifications and split/compact eigenspaces. |
| R2 | AF.1 | Faithful real Plancherel transform and containment of tempered infinitesimal characters in the specified strips. |
| R3 | AS.6 | Delorme's rapid-symbol theorem, the split-centre multiplier theorem and Nash Schwartz products; compact Paley–Wiener alone is insufficient. |
| R4 | AF.1 | Kostant tensor centralizers, generic principal series, minimal types including limits, and compact-Casimir seminorm/dimension bounds. |
| R5 | AA.3 | Proper quotient heights, Franke comparison, cusp-cover finite fibers, deep-cusp uniqueness and quotient-volume estimates. |
| R6 | AS.1 | Comparison of the two source conventions for cuspidal data, their measures and pseudo-Eisenstein spans. |
| R7 | AF.3 | Donnelly's polynomial cuspidal counting bound at fixed type/level, including finitely many conjugate derived levels. |
| R8L | AS.2 | Lapid's hereditary property (HP), its GL_n applicability and normalization comparison. |
| R8D | AS.4 | Discrete-data Langlands decomposition and Müller's polynomial discrete-spectrum counting input for the refined target. |
| R9 | AA.2 | Compact-central character lattice and finite component characters, with central-character quotient comparison. |
| R10 | SR.4 | Normalized Satake compatibility and finite exponential-polynomial dependence along induced families. |
| R11 | AS.3 | Regular-support constant-term bounds and the regular weighted wave-packet comparison. |
| R12 | AS.6 | Arthur's finite differentiability factorization and the compact-kernel/central-disintegration comparison. |

G1 additionally requires tracing the exact Nash Schwartz, local Sobolev,
Riesz-duality and nuclear-map comparisons at the stated generality. These
are specific required inputs, not asserted baseline results.

## Sources and corrections

Public source URLs, SHA-256 hashes, access date, editions and read ranges are
in both JSON source inventories. The mathematics is written in our own words;
no source passages, source files or section-by-section digests are submitted.

- BPLZZ, arXiv:1912.07169v3: §§1–3, pp.1–30; Appendix A, pp.43–45;
  §4.2, pp.33–35 only at the finite-place interfaces. All locators use that
  preprint's pagination. The Annals article record was checked, but its full
  published text was not read.
- BPCZ, published IHÉS 135 (2022), 183–336: §§2.4–2.5, pp.202–221 and
  §§2.8.4–2.10.2, pp.227–243, including the cuspidal-data convention.
  The display in Proposition 2.8.4.3, p.229, was visually checked for the
  conjugation in its adjoint function.
- Lapid, ESI 2403: §2, §3.6 pp.19–20, Theorem 4.5 p.22,
  Proposition 5.1 pp.22–24, Corollaries 5.7–5.8 pp.25–26 and §6 pp.26–28.
- Bernstein, Journal of Geometry and Physics 5(4) (1988), 663–710:
  §3.4 pp.685–688 and §3.5 pp.688–689, at the Sobolev, weighted
  Hilbert–Schmidt and nuclearity inputs.

The original statements still needing verification are Donnelly 1982
Theorem 9.1, Müller 1989 Theorem 0.1, Delorme 1986 Theorem 1.7, Kostant
1975 Theorems 4.8–4.9, Wallach 1992 §10.1, Müller 2000 Lemma 6.1,
Aizenbud–Gourevitch's Nash product result and Sakellaridis's centre multiplier
theorem. Their uses were read in the sources above and their exact needs
recorded as gaps. No restricted Wallach, Knapp or Trèves volume was accessed.

There are 36 source-issue records. Thirty-four recheck relevant BPLZZ
extraction findings against the specified preprint; they do not allege that
the unread published text has the same mistakes. The BPCZ records concern
the closed-image embedding sentence before Lemma 2.5.4.1, p.210, and strong
Banach continuity of the total-variation measure representation in §2.5.9,
p.213. The latter fails for translated Dirac masses; the plan retains weak
convolution and norm-smooth vectors. No published correction was verified.

The reviewer should check the finite real-form coset, the translated-character
sign, both typicality conditions, the distinction between a finite list of
cuspidal components and infinitely many irreducibles, simultaneous occurrence
at all retained places, fixed-inner-form CAP, and the discrete-counting
hypothesis on the refined theorem. Arthur's Z is K∞-invariant, with no claim
of centrality; its adjoint function uses conjugate inversion. General
unconditional Lapid expansion and the conjectural converse multiplier
classification are excluded from the targets.

## Validation and next work

`python3 scripts/check_blueprint.py` on the packet passes with zero errors
and zero warnings using the pinned declaration index.
`python3 scripts/check_sorry_data.py` on the suggested file passes.
`lean-check` elaborated the suggested file successfully at the pinned shared
build: exit 0, 156 lines, 23 warnings, all for declarations using `sorry`.
No other Lean warnings or errors remain. The suggested file follows the
current WORKERS.md statement-only shape: light definitions have real bodies
over available carriers; heavy automorphic carriers remain fully specified
README targets. The older issue template's request to simulate every target
in Lean is superseded by that shape rule.

The next worker is the independent reviewer. Verify the source corrections,
ownership and exact supplier contracts, then resolve the named prerequisite
gaps before marking any layer closed. In particular, obtain the original
counting and multiplier theorems and reconcile their hypotheses with the
parent conventions. This is a completed design pass, not a checkpoint of an
unfinished pass.
