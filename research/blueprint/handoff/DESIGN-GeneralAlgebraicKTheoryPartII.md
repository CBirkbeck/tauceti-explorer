# General algebraic K-theory, Part II — design handoff

Issue: #3477. Worker: Codex, session `codex-FSZ2Vz`. Claim confirmed on
2026-10-19. This submission completes the target-level design pass and is ready
for independent review. It is not a checkpoint or a formalization claim.

The roadmap definition, packet, reader and suggested Lean file are the four
deliverables named by the issue. All eleven layers KII.0–KII.10 are `planned`;
none is `closed`. Every node has `implementationStatus: unchecked`.

## Inventory and coverage

There are 73 nodes: 8 definitions, 9 constructions, 30 theorems, 7 comparisons,
5 lemmas and 14 applications. The 17 definitions/constructions have 68 API
items and 51 discriminating tests. There are 45 planets, at most six per layer,
and seven actual pinned-library declarations. There is one proof-audit gap,
sixteen supplier-extension requests and one proposed source correction.

The extraction's route to `GeneralAlgebraicKTheoryPartIITelescopicLocalization`
contains 73 items. `extractionCoverage` accounts for all of them: 72 lead to
targets and Question 3.10 is an explicit theorem boundary. Its general
K(n)-purity assertion is not taken as a theorem. Item /68 additionally supplies
the local negative-degree nilinvariance target; its classical K0 and Bass
inputs retain their owners. The extraction index is not a synopsis of the
source. The packet, reader and roadmap stage descriptions contain the same
target statements.

| Layer | Targets | Planets | Status |
| --- | ---: | ---: | --- |
| KII.0, stable categories and nonconnective K | 5 | 5 | planned |
| KII.1, connective and additive comparisons | 4 | 4 | planned |
| KII.2, pullbacks, truncation and excision | 5 | 4 | planned |
| KII.3, stable envelopes and bounded hearts | 6 | 5 | planned |
| KII.4, Theorem A | 13 | 6 | planned |
| KII.5, trace, CMNN vanishing and purity | 6 | 3 | planned |
| KII.6, height bounds and redshift | 6 | 4 | planned |
| KII.7, examples and iterated K | 8 | 2 | planned |
| KII.8, descent and modular examples | 8 | 4 | planned |
| KII.9, height one | 7 | 4 | planned |
| KII.10, additive comparison and assembly | 5 | 4 | planned |

## Ownership and proof order

The binding brief assigns enhanced K-theory foundations here. Generic stable
infinity-categories, modules, Ind and presentability remain EDS-owned; spectra
and classical plus/delooping remain H-owned; classical exact/Waldhausen and
Bass K-theory remain with the parent. Chromatic spectra, ko/tmf, Tate
blueshift and Lubin–Tate actions remain CH-owned. THH, TC and trace remain
RT-owned. Scheme K geometry and KH remain S-owned. Big Witt vectors remain
Habiro-owned. The reader gives the exact imported stage/node contracts.

The packet proposes a rescope of overlapping RT targets; no other roadmap's
files were changed. The maintainer should apply the proposal and repoint
consumers after review:

- The generic exact-sequence and weakly localizing core of
  `RefinedTraceMethods:RT.3/localizing-invariants` imports
  `GeneralAlgebraicKTheoryPartII:KII.0/perfect-categories`.
- The generic part of `RefinedTraceMethods:RT.3/truncating-excision` imports
  KII.2/amalgam, KII.2/truncating and KII.2/truncating-excision. RT retains
  trace-specific examples and applications.
- `RefinedTraceMethods:RT.5/localizing-invariant` keeps its accessible,
  filtered-continuous refinement; motives remain RT.5-owned.
- ChromaticHomotopyTheory's accepted packet still names the extraction's
  provisional roadmap id `GeneralAlgebraicKTheoryPartIITelescopicLocalization`.
  Repoint that reference to `GeneralAlgebraicKTheoryPartII` and the matching
  KII.5 purity target, or provide the appropriate route alias.

KII.0–KII.3 have no RT or CH prerequisites in their own dependency chains.
Theorem A precedes high-height trace comparison; CMNN vanishing uses these
and the genuine Cp-transfer, then purity uses CMNN vanishing. The CMNN
induction's m=0 case is Mitchell; the high-trace comparison is used for m≥1.
Yuan's lower bound uses purity and is placed after it. No purity-to-CMNN or
purity-to-Theorem-A cycle is introduced.

## Open obligations and exact resume points

G1 concerns KII.4/nil-witt-action and KII.4/nk-localization. The public Weibel
scan, Theorem 3.1, p.474, supplies the continuous action and finite
annihilator, but cites Stienstra for its construction. That original proof
was not read. Read an authorized public construction, verify the
nilpotent-endomorphism filtration argument and its Bass contraction to all
negative degrees before claiming this proof audited. The statement, API,
tests and downstream uses are already specified. No gap is concealed by a
Lean assumption.

The sixteen requests are listed in full with consumer ids in the packet and
reader. Their short index is:

1. H.3: coherent plus/group completion for matrix-unit spaces.
2. Parent K.2:plus: discrete model and its natural K comparison.
3. H.5:spectra: spectrum assembly and realization comparison.
4. H.5:S-delooping: coherent iterated Waldhausen delooping.
5. EDS E5:abstract: multiplicative Postnikov and square-zero interfaces.
6. Z.1: nilpotent K0 invariance, with the actual quotient-induced map.
7. CH.10: positive-height Nullstellensatz, rational height-zero input, and
   the precise May-nilpotence criterion used by CMNN.
8. CH.7: strict-Henselian Lubin–Tate detection and the equivariant even
   finite free H-complex from CMNN Appendix B.
9. CH.12: regular/coherent support models for ko and tmf localization.
10. M.7: Suslin comparison and the spectral étale/strict-Henselian extension.
11. RT.2: TC/p colimits, coherent cyclic THH assembly, and Yuan's residual
    circle-action Tate calculation.
12. RT.3: the odd-prime and prime-two TC(Z) calculations, TC(Z[1/p])
    vanishing, discrete-ring filtered continuity, and the stable-K shift.
13. RT.5/localizing-motives: the A-linear weakly additive motive refinement.
14. S.1: enhanced Perf on qcqs schemes and its classical K comparison.
15. S.4: Nisnevich/derived blowup descent, approximation and platification,
    retaining the finite-presentation restrictions of LT Appendix A.
16. S.5: KH, the Karoubi–Villamayor comparison and its convergence/nil inputs.

These are supplier obligations, not assertions that current supplier plans
already prove the stronger interfaces. Independent review must check them
alongside the imported nodes, especially the spectral étale extension,
equivariant Lubin–Tate realization and weakly additive motive refinement.

Source issue E1 needs an independent mathematical verdict. The published
LMMT introduction, p.1014, states redshift at nonnegative height while its
Definition 2.1, p.1016, uses global T(0)=S[1/p]. The rational height-zero
field-map argument requires nonzero rationalization. The packet records the
counterexample at an odd coefficient prime using the characteristic-two
1-periodic ring (HF2)^tC2 and additivity on its K-theory. BSY starts its
application in §9 with p-local rings. The planned redshift theorem therefore
uses p-local input, or positive global height, or global height zero with
nonzero rationalization. Its graded-piece n=0 comparison is also p-local.
The arbitrary E1 purity theorem keeps its global scope. Source versions,
hashes, locators and correction searches are recorded; the publisher record
returned HTTP 403, but the published PDF was read in the author-hosted copy.
No published correction was located. This is a proposed finding for review,
not an accepted erratum.

## Sources and baseline checked

The complete published LMMT paper was read, pp.1011–1040. Supporting passages
were read in BGT, Land–Tamme, CMNN20 and CMNN24, Barwick, Antieau–Gepner–Heller,
Hebestreit–Steimle, Patchkoria–Pstrągowski, Mitchell, Yuan, BSY and Weibel.
The packet records each public URL, version, read date, hash and exact
sections/pages read. In particular: LT Appendix A.2, pp.35–37, for all four
cdh-descent steps; CMNN20 p.19 for the rational-transfer argument and
Appendix B, pp.37–39; BSY Corollary 5.2, p.55, and §9, pp.86–90; Weibel
pp.473–477 and 483–486. Stienstra's construction is the source missing for G1.
Lurie's Postnikov statement is requested from EDS using LMMT's account, not
claimed to have been read independently. No restricted book was needed.

The extraction's unresolved reference in the proof of Corollary 4.31 is
Proposition 3.12 in the published text; no erratum to that corollary is
proposed. Keep ordinary K(0)=HQ distinct from global T(0)=S[1/p].

The pinned declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed coverage for parent
K.1–K.7, H.5 and EDS was read. Current TauCetiRoadmap main, including the
nine roadmaps newer than the atlas snapshot, and current Tau Ceti were
checked read-only. Existing ordinary exact/K0 constructions retain their
owners. Current Tau Ceti commit was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current Mathlib was
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. No build or Lake command was run
in either read-only checkout.

## Validation and Lean scope

`python3 scripts/check_blueprint.py` on the packet reports zero errors and
zero warnings, using the available declaration index. Section 18 source-issue
and source-version metadata checks pass. Cross-checks compare every target,
API item, test, locator and extraction route against the reader and roadmap,
resolve stage inputs, check the internal build order, and check the
trace/chromatic boundaries and absence of purity cycles.

`python3 research/blueprint/intake.py check-files` reports five files and zero
problems. `python3 scripts/check_sorry_data.py` passes on the suggested file.
The staged diff has no whitespace errors.

The suggested file **compiled**, using `lean-check`, with exit code 0 and no
diagnostics. It has 45 lines and four examples over actual pinned carriers:
Kan implies quasicategory, the Karoubi idempotent equation, the finite
projective split exact structure and the bounded t-structure predicate.
WORKERS' 2026-10-12 shape controls: absent enhanced carriers and their API and
tests are fully stated in the reader. No replacement K-theory carrier,
axiom, data placeholder or assumed purity predicate was introduced. Successful
elaboration checks these four interfaces; it does not establish the roadmap.

The independent reviewer should begin with the packet's coverage and
`sourceIssues`, reconcile the ownership proposal, check G1 and the supplier
contracts, then audit the proof order and target statements. Packaging begins
after acceptance and in the required upstream dependency order.
