# BP-GrossZagierAndArithmeticHeights

Issue #9416; Codex, session `codex-fpPjYu`; 2026-10-14.
The claim was confirmed by bot comment 6159405664. This is the completed
target-level planning pass, with `part: null` and `status: complete`.
GZ.0, GZ.1, GZ.2, GZ.3, GZ.4, GZ.5, GZ.6, GZ.7, GZ.8 and GZ.9 are all
**planned**. No stage is closed and no target is claimed implemented.

## Deliverables and inventory

- [Primary packet](../packets/GrossZagierAndArithmeticHeights.json).
- [Complete reader](../readmes/GrossZagierAndArithmeticHeights.md).
- [Compact suggested file](../suggested/GrossZagierAndArithmeticHeights.lean).

The resolved plan has 277 targets: 24 definitions, 44 constructions,
190 theorems, 11 comparisons and 8 lemmas. It has 314 API items, 232
mathematical Checks, 40 planets, 83 personally checked baseline declarations,
98 requested interfaces and 16 explicit gaps. Every definition and construction
has at least three API items, at least three Checks and recorded uses.

| Layer | Targets | Planets | Status |
| --- | ---: | ---: | --- |
| GZ.0 | 14 | 1 | planned |
| GZ.1 | 5 | 2 | planned |
| GZ.2 | 17 | 6 | planned |
| GZ.3 | 11 | 5 | planned |
| GZ.4 | 7 | 4 | planned |
| GZ.5 | 11 | 3 | planned |
| GZ.6 | 68 | 5 | planned |
| GZ.7 | 108 | 4 | planned |
| GZ.8 | 19 | 6 | planned |
| GZ.9 | 17 | 4 | planned |

## Accepted parts and consolidation

The accepted GZ.0 and GZ.8 packets contain 243 and 36 targets respectively.
This primary packet owns 13 integrated milestones or new targets and imports
264 targets under their original IDs. Four height definitions/comparisons are
replaced by one pin-specific normalization comparison; two analytic resolvent
targets are redirected to AutomorphicSpectralTheory AS.2. Three other new
targets supply rational Galois descent, the explicit CST local constants and
the Petersson–Whittaker factorization. Hence 279 − 6 + 4 = 277.

The standard checker counts the 13 primary-owned nodes. To reproduce the full
reader, use the packet's `importPolicy`: load exactly each manifest's `nodeIds`,
recursively omit its listed metadata fields, apply `referenceSubstitutions` to
string values, apply the 30 `targetCorrections.fields`, and append `nodes`.
Both source-packet SHA-256 hashes were verified before resolving the plan.

The part files retain their ownership and historical independent approvals.
Those approvals do not approve this consolidation or its corrections. The
100 inherited source findings remain in their owning packets, linked through
`inheritedSourceIssues`; their E-numbers are local to each packet. The primary
reports no newly discovered source error. Intake does not automatically apply
the correction fields to the accepted parts or the existing package. The
independent reviewer and next package worker must use this explicit resolution
when assessing the consolidated targets.

## Mathematical corrections and red-team dispositions

- **RT-AREA-automorphic-1/19:** GZ.5 imports MP.6's binary and ternary
  quadratic-space Siegel–Weil targets and theta pairing/see-saw interfaces.
  The isotropic cases (m,r,n)=(2,1,1) and (3,1,1) fail the strict convergent
  bound m−r>n+1. Their regularized input and the split Shimizu comparison
  remain explicit gaps; the existence of an MP.6 stage proves neither.
- **RT-AREA-iwasawa-1/3:** RP.0 owns general line-bundle heights, Northcott
  and canonical heights; RP.1 owns general Mordell–Weil. GZ.1 retains
  Poincaré normalization, coefficient/character pairings and elliptic
  comparisons. Northcott suffices for the torsion zero locus. The new descent
  comparison gives A(K)⊗ℚ ≅ (A(H)⊗ℚ)^Gal(H/K) using norm divided by [H:K],
  without replanning finite generation. The BSD.1 import move to RP.1 is an
  unapplied ownership proposal.
- **RT-AREA-iwasawa-1/11:** L3h owns the BDP square-root distribution.
  The current GH.4 `bdp-special-value-formula` target owns BDP Theorem 5.13
  for general r and j; GZ.9 imports r=j=0. This is a different GH.4 target
  from the conductor-n>1 Chida–Hsieh formula, which does not supply the
  trivial-character endpoint. GZ.9 owns Brooks's quaternionic construction
  and the weight-two comparisons. Remove the modular-symbol L2 input.
  Castella's multiplicative weight-two formula has no exceptional zero;
  the Hida exceptional-zero derivative belongs to GH.7 if consumed.
- **RT-AREA-iwasawa-1/12:** At f790474, the library height is h_O, with
  denominator 2·4ⁿ, and its pairing is the half-polarization B_O.
  The mathematical x-height/Poincaré convention has h_x=2h_O, B_x=2B_O
  and Reg_x=2^r Reg_O. Current Tau Ceti a91d3aaf instead uses denominator
  4ⁿ, so its current height, pairing and regulator already use the x-height
  convention. The extra factors must never be applied to those current names.
  `upstreamNotes` records the historical disagreement with EllipticCurves
  README Layer 9, lines 1178–1182, and its present agreement with current code.
- **RT-AREA-iwasawa-1/17:** Preserve GZ.3's Manin-integrality/p-unit,
  isogeny/twist-transfer and degree-divisibility targets, with optimality and
  p∤2ND hypotheses. A p-unit need not equal 1; transfer needs its stated
  prime-to-p isogeny hypotheses. Consumers include BSD.6a, BSD.7a and MIMC L3.
  The missing bad-prime differential input remains a requested R14.6 extension.
- **RT-AREA-algebraicgeometry/26:** StableReduction Layers 1, 4, 5 and 7
  supply dual graphs, regular/minimal models, vertical intersection matrices,
  projection formulas and semistable base change. GZ.2 retains admissible
  Green functions, arithmetic measures, global gluing and Faltings–Hriljac.

Other corrections route generalized elliptic curves to R13.1, perfect Hecke
pairings to R12.5, ideal-class theta series to MP.5 and Atkin–Lehner input to
upstream ModularForms Layer 4. The auxiliary quadratic field is a hypothesis:
the previous BSD.2 → GZ.8 dependency is removed. The effective PSL₂ Green
resolvent and its residue import the actual AS.2 targets.

## Supplier contracts and follow-up

Independent package review #9217 found 23 absent and 43 partial historical
contracts, plus Arakelov and rational-structure deficiencies. Its verdict
remains attributed to its reviewer; this run is not a review of its own work.
The primary `supplierAudit` gives 33 grouped dispositions with exact consumers,
and `restructure` gives 28 unapplied proposals. The 98 requests distinguish
desired interfaces from available exports.

The toric Hom definition is redirected to its existing GZ.4 owner. Actual
P4 ordinary infinitesimal and translation trivializations are imported, with
their hypotheses; they do not supply the entire Brooks moment dictionary.
The new CST local constants and analytic Petersson product do not supply
Harris–Kudla algebraicity or Prasanna's integrality and rational-structure formulas.

Resume with the packet's gaps and `supplierAudit`, not a generic stage-name
match. Missing extensions include quadratic base-change epsilon comparison,
archimedean Rankin analysis, cyclic-isogeny deformation, primitive integral
Jacquet–Langlands lattices, p-optimal cotangent saturation, bad-prime
differentials, extra-unit CM cases, local CM lifting, regularized projection,
genus congruences, semistable integration/Bloch–Kato logarithms and abelian
p-adic subgroup results. Arakelov R35.1 needs an actual source decomposition.
Arbitrary-character Hermitian positivity and the rational-structure comparisons
are still gaps. Complete-DVR measure/uniqueness arguments over Ô^ur need the
infinite-residue-field extension; existing finite-residue L4 is insufficient.
The supplier extensions and ownership moves need independent review and
maintainer application before a package claims they are available.

## Sources and library evidence

Fresh source checks are recorded in `sourceInspection`: CST Proposition 2.1
and equation (2.2), pp.14–15; equation (2.4), p.18; Lemma 3.5, p.23;
Propositions 3.11–3.12, pp.26–27; Lemmas 3.13–3.14, pp.30–31; and the
public YZZ author erratum, items 1–45, pp.1–5. CST fraction layouts were
checked on rendered PDF pages. Other public texts supported targeted
normalization and prose checks. The bibliography attributes inherited section
inspections to their original parts rather than claiming a fresh full reading.

The 2013 YZZ book is not cleared in the supplied library and was not accessed.
The attempted public 2011 draft URL returned 404; its accepted historical
locators remain unverified by this worker. The published 2026 Yuan bigness
edition and published 2023 Colmez erratum were not acquired. Their historical
author-version evidence does not verify the published editions. No source
passages or source files are deposited here.

All 83 baseline declarations were read at Tau Ceti f790474 and Mathlib
082e2d3. Current Tau Ceti a91d3aaf and TauCetiRoadmap 0d144d04 were also
screened read-only. StableReduction and JacobianChallenge READMEs were read
in full. The nine newer roadmaps and four Completed roadmaps named in WORKERS
were screened through their actual Suggested files, including nested files;
their general foundations are imported rather than duplicated.

## Validation and Lean boundary

`check_blueprint.py` with the pinned declaration index reports zero errors
and zero warnings. A separate full-resolution audit checked both manifests,
all 30 field patches, all 277 targets, source IDs, request consumers, APIs,
Checks, Lean correspondence and 593 internal dependency edges; no cycle,
unresolved target or warning remained. File intake and whitespace checks pass.

`lean-check research/blueprint/suggested/GrossZagierAndArithmeticHeights.lean`
completed successfully at the blueprint pins. The 195-line file has seven
real-bodied light definitions, seven milestone statements and 23 examples.
Its only output was 30 `declaration uses sorry` warnings. It admits no data
definition and creates no heavy geometric or analytic carrier. The reader
records all arithmetic APIs and Checks, while the Lean correspondence identifies
the precise finite-algebra adapter boundary. This is signature elaboration,
not implementation or proof closure. No Lean process remains running.

Next: independently review the new normalization/comparison targets, correction
resolution, source-access gates and supplier dispositions. Then update the
roadmap package from the resolved reader while retaining every open boundary.
