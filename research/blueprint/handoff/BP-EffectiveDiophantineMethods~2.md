# BP-EffectiveDiophantineMethods~2 — revision planning pass

Issue [#6936](https://github.com/CBirkbeck/tauceti-explorer/issues/6936).
Author: Codex, session `codex-TIdyyn`, 7 October 2026.
The claim was confirmed by the bot in comment 6039950433 after claim comment 6039947284.
This is one job, revising the independently reviewed input in place under RS-03's accepted boundaries.

The packet is `complete` as a planning pass. Every stage is `planned`; **none is closed**.
Every implementation status remains `unchecked`. The existing `needs_changes` review object
is preserved byte-for-byte as JSON data; it is for the next independent reviewer to replace.
No formal implementation, executed global rational-point computation, or supplier closure is claimed.

| Stage | Nodes | Coverage |
| --- | ---: | --- |
| ED.0 | 9 | planned |
| ED.1 | 11 | planned |
| ED.2 | 32 | planned |
| ED.3 | 29 | planned |
| ED.4 | 26 | planned |
| ED.5 | 29 | planned |
| ED.6 | 39 | planned |

Totals: **175 nodes**: 24 definitions, 31 constructions, 102 theorems, 16 applications,
2 lemmas. There are **415 API records and 270 test contracts across all nodes**, 40 planets,
194 baseline declarations, 23 gaps, 34 supplier requests, 24 source issues and 8 restructuring
proposals. The checker reports 398 API items and 263 unit tests because it counts these fields
only on definitions/constructions; the other 17 APIs and 7 tests belong to theorem/lemma nodes.
These are planning contracts and suggested statements, not proved tests. The 29 per-node
`suggestedOmissions` entries give exact absent signatures, reasons and required mathematical
contracts, reproduced in the reader and as a comment register in the suggested file.

## Revision against F1–F13

1. **F1, ED.0.** Preserved the review's nonzero-polynomial isolation and exact-zero Hensel
   corrections. Renamed the ball-membership helper `centre_ball_mem`; it no longer claims to
   return CN.0's approximation. The missing adapter specifies precision, valuation/residue,
   denotation and the `(5,1)` at p=3 output `(1,0,2)`. Added arbitrary-element characteristic
   polynomial and basis-invariance signatures with the tower proof obligation. The
   height-one-prime/completion dictionary specifies negative multiplicative exponents,
   additive order, ramification/residue degrees and absolute-value normalization; its
   finite-extension bridge remains a gap rather than an assumed CN.2 consequence.
2. **F2, ED.1.** Added proof-free rational/integer `RawDistanceCertificate` and
   `RawRealExclusionCertificate`, finite checks, soundness and producer contracts. The slow
   distance fallback checks both inverse identities, row caps and every integer vector in
   a finite cube; real exclusion additionally checks rational interval rounding and the
   full separation inequality. No raw input assumes a real inequality. The semantic LLL
   record remains distinct. The enumeration branch now carries its actual finite enumeration
   and completeness condition. Read de Weger's accessible homogeneous backtracking and
   enlarged-radius affine translation; exact rational LDL/direct affine traversal is an
   ED-owned adaptation, not attributed verbatim to the source.
3. **F3, ED.2.** The main exponent chain is componentwise, antitone, includes the scalar prime
   coordinate, and retains finite exceptions; `WeightedExponentReductionChain` identifies the
   older scalar helper. Norm representatives are nonzero. The norm/divisor producer now states
   irreducible degree, root-field degree, integral nonzero norms, complete unit/divisor data.
   The Thue–Mahler ideal-factorization factory and concrete end-to-end factory tests are
   omitted exactly, rather than renamed unit helpers or assumed complete outputs. Added the
   inactive degree-one exponent-zero and primitive/sign regressions, including exclusion of
   `(2,0)` for `X³−2Y³=8`. Preserved primality/nonzero-pivot/zero-constant fixes.
4. **F4, ED.3.** Imported the pinned local descent module and added `ellipticLocalImage` using
   the actual curve, étale algebra, `W.M` and `W.μ`; the coordinate equivalence and point list
   are inputs to this supporting adapter, not a local-factor producer. Exact omissions specify
   actual local factors, valuation/residue coordinates, Hensel lifts and cardinality factories.
   Ambient square-class inclusion replaces equality in the semantic Selmer monotonicity lemma,
   with the new local compatibility hypothesis. The actual Selmer example computation is
   registered as missing; basis-length arithmetic is named as such. E11, Fermigier, the
   rank-zero genus-two examples and corrected Poonen descent gaps remain.
5. **F5, heights.** Imported actual pinned canonical height, `PointModTorsion` and regulator.
   Read Cremona III Proposition3.5.1 and footnote3: for an integral standard equation over Q,
   divide the whole inequality by two, including μ, 1.922 and2.14. The lower constant is
   h(j)/24+μ_C+961/1000; the upper is μ_C+107/100. `log⁺` uses absolute value; the
   `(log|Δ|+log⁺j)/6` term and separate `log⁺(b₂/12)` are kept in their actual positions.
   The general-number-field Silverman statement is omitted, with a source gap.
   `HeightCoordinates`/`heightCoordinatePoints` require a genuine free/torsion decomposition,
   a finite torsion type and positive coercivity. Enumeration includes every torsion fibre;
   rank zero and an infinite zero-form kernel are explicit boundary tests. RP.1 must supply
   the actual Jacobian decomposition and RP.0 its positive canonical form.
6. **F6, ED.4.** Renamed abstract reduction data `ReductionDiscData` and its set-fibre helper
   `baseResidueDisc`; these are not the Coleman good-reduction pair. Replaced the invalid
   genus-zero/infinity test by the genus-one special-fibre count at3. Actual full analytic
   discs, smooth proper curves, differential pullback, geometric logarithm and tiny integral
   are exact omissions. The false primitive theorem remains absent. Narrower
   `pullback_basepoint_independent` and `hyperelliptic_chart_powerSeries` describe only the
   supporting algebra. The Coleman comparison and relative criterion still need their
   genuine supplier derivations. Point-first pairing kernels are torsion on the left and
   zero on the right; the differential-first order is stated separately. Finite extensions
   give algebraic-closure points; completed Cp requires analytic extension.
7. **F7.** Preserved the nonzero dominant coefficient and `F(T)=T` Strassmann regression.
   The reader now explicitly interprets valuation(0) as infinity mathematically and rejects
   a zero series as a finite zero-bound input, rather than using totalized valuation zero.
8. **F8.** Renamed the Chabauty index helper `withFiniteIndex`; added the FG/rank/independence
   finite-index theorem. The geometric rank/genus/nonzero-annihilator producer is an exact
   omission. `SieveCertificate.Checked` now checks only `j<length`. Added proof-free finite
   projection/allowed-class `RawSieveStep` tables and a computable check; actual CN.3 quotient
   presentation transport remains a gap. QC's arbitrary-function record is explicitly named
   `SemanticQCDiscCertificate`. The numerical target needs restricted coefficient/tail data,
   a finite complete ball tree and certified root multiplicities/uniqueness, never universal
   zero predicates as raw input.
9. **F9.** Consolidated twelve routine ED.5 nodes into admissible-class, lift, chain and
   local-datum APIs. Declaration names, contracts, tests, evidence and prerequisites are retained.
   `consolidatedNodes` maps every old identifier to its owner; the reader reproduces it.
   A scan of all other packets found no external reference to these twelve identifiers.
   All other original node IDs are retained. Historical review entries are unchanged.
10. **F10.** Deep information translates Pic⁰ to Pic¹ by `D↦D+D₁`, and requires a separate
    test for membership in the embedded curve. Necessary Kummer congruences give a superset.
    Cantor/Mumford arithmetic, finite Jacobian presentations, component maps and explicit
    Kummer height constants remain recorded supplier gaps.
11. **F11.** The modular rank-one input over Q explicitly requires admissible quadratic field,
    twist nonvanishing/factorization, Gross–Zagier trace and Q-descent; stage labels do not
    discharge it. Positive derivative intervals alone establish neither central vanishing
    nor analytic rank. Stoll's arithmetic and certified numerical conditions are both retained.
    Supporting Lean dimension/nonzero-derivative lemmas have narrower names.
12. **F12.** Hodge truncation requires bounds for products of primitives and actual Laurent
    data, not the maximum individual pole order. Root perturbation requires nonzero restricted
    normalization, n−k>0, positive multiplicity bound, actual polynomial approximation and
    completed-Cp root multisets/Weierstrass degree. A congruence solution is not a root with a
    lift multiplicity. `root_satisfies_truncation_congruence` is explicitly only the necessary
    congruence helper; the stronger Newton/Weierstrass statement is omitted exactly. The
    NC.2/NC.5, SF.3, RP.1 and general Tuitman RD.7 requests remain.
13. **F13.** Renamed weak X_s(13) prototypes to their actual algebraic/nonzero/dimension claims.
    Added unique projective F17 representatives and their twenty-point/gradient contracts;
    cubic inertness; the actual affine coordinate-ring quotient; and nonvacuous gamma-class
    tests. Removed the assumption-based polynomial Hodge test. Modular identification,
    geometric smoothness, full charts, Tuitman matrix production, actual log vector E₁(P5),
    height/determinant evaluation, chart zero tables and ramified P0-disc replay are exact
    omissions/gaps. The source's E₁ is already a logarithm vector; no torsion counterexample
    is alleged against that source datum.

The reader now agrees with the revised contracts, explicit status and E22–E24 corrections.
Unsupported globally acyclic stage claims are removed. The combined stage projection still
contains the reviewed ED.4–DY–LV–MP–QM–Dirichlet–Coleman cycle. ColemanIntegration's proposed
move of its unnecessary Dirichlet L0 input to L3 and LV/DY's single ED.4 Strassmann import require
owner coordination. The internal node DAG alone does not settle that cycle. No foreign packet,
upstream reader, atlas data or application code was edited.

## Evidence and validation

`python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveDiophantineMethods.json`
passes with **zero errors**. Its one warning is the previously reviewed index false positive
for `Finset.mem_filter`; the actual pinned declaration is not renamed. JSON parsing, diff
whitespace, preserved baseline/review, retained-ID mapping and unchecked-status assertions pass.

**The full suggested file did not compile in this run.** `lean-check` against the existing
Mathlib082e2d3 build stops at its first new Tau Ceti import: the compiled object for
`TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight` is absent. Source was available and
read at Tau Ceti f790474; the four imported source modules were unchanged between that pin and
the shared checkout. Other available compiled copies use different Mathlib commits and were
not used. No build/update/cache download or Lean server was started.

A scratch-only harness retained the suggested file except its four Tau Ceti imports and the
`EllipticLocalImage` and `Heights` through `HeightTests` sections, which depend on those modules.
It elaborated against pinned Mathlib with **zero errors and729 warnings, all only `sorry`**.
This establishes the checked subset's types, not the omitted Tau Ceti-dependent sections or proofs.
Available memory was107GB before the final run; all Lean processes finished.

Nine actual finite evaluations returned:

| Check | Result |
| --- | --- |
| Raw distance, identity lattice/nonzero vectors | true |
| Same data with forged zero inverse | false |
| Integral nonzero target with claimed positive distance | false |
| Raw sieve, complete mod4 lifts of the odd mod2 class | true |
| Same sieve with one lift missing | false |
| False local allowed-table with empty output | true |
| Raw real exclusion, exact θ=10 data | true |
| Same enclosure with upper endpoint12 | false |
| Same real certificate with forged zero distance inverse | false |

The data are the named raw examples in the suggested file; the temporary harness only replaced
those example conclusions by evaluations of `.check`. Producer implementations and all
soundness proofs remain suggested obligations.

An independent exact sparse-integer-polynomial check reproduced Q(X−Y,X+Y,X+Z)=16B and all
seven rational memberships. Complete projective representative enumeration modulo17 found
20 points, nonzero gradient at each F17 point,17 points in U1, and no root of the coefficient
cubic modulo17. It also checked Q_y(P2)=−16 and Q_y(P0)=0. These elementary checks do not prove
geometric smoothness over the algebraic closure, modularity, analytic charts or QC completeness.

The 194 baseline citations and earlier full audit remain the independent review's evidence.
This revision re-read touched interfaces and the nearby library audit/suppliers; it does not
claim a new independent audit of every retained baseline declaration or every historical
source passage. JacobianChallenge and Multiquadratic were read as upstream density examples.

Newly accessed source evidence, with scope distinguished from previous read histories:

- [Cremona, ChapterIII](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.5 pp.76–78,
  Proposition3.5.1 and footnote3; SHA256 `c4843b80ae1b6b91795b9952d782912542dd8d6b17c1940cd1a881fa6fdd9c26`.
- [de Weger, CWI Tract65](https://math.deweger.net/proefschrift/CWITract65.pdf), §3.6 pp.51–53,
  Figure2 and affine-target discussion; SHA256 `faaa8184cefdf7498008f8a117a4153ade7c9c7b6428c90801e8e8d2c52f2d7a`.
- [BDMTV 2021 arXiv v4](https://arxiv.org/pdf/2101.01862v4), Lemma4.7/Remark4.8 pp.24–25,
  reread for root perturbation; SHA256 `738f0ec0cd588e20a569bc029fe2bb9611abc5d16fee7d36f9e966357c25f61d`.
- BDMTV2019's public Annals text was accessed for the explicit-example interfaces. Earlier
  version-specific source and erratum histories are preserved, not promoted to fresh full-paper
  read claims. The Compositio version of record was not independently read here.

Fincke–Pohst1985 and Silverman1990 originals remain independently inaccessible. Cremona supplies
the rational comparison; de Weger supplies an accessible enumeration foundation. The original
sources' unverified general assertions remain explicit gaps. No author was contacted.

## Where to resume

The next job is independent review of this revision, not another claim by this worker.
For each F1–F13, compare the revised mathematical target with its narrower supporting prototype
and the exact omission register. Re-run the full suggested file once the pinned Tau Ceti
compiled imports exist; do not infer full compilation from the subset check.

The packet's 23 gaps and each coverage `remaining` list are the precise follow-up worklist.
Resolve CN.0/2/3/4 approximation, local factor, exact quotient and numerical adapters; RP.0/1
Jacobian heights/FG/free-torsion decomposition; actual curve/Jacobian differentials and formal
charts; NC.2/5 filtered connection/height geometry; SF.3 specialization; RD.7 general Tuitman;
and the exact GZ.8/HE.7 admissible modular Q-rank theorem. Existing local/arithmetic/example
source gaps remain listed individually. Replay actual Thue/Thue–Mahler, Selmer and all QC
factory outputs before calling those computations certified. Coordinate the eight stage
restructuring proposals with their owners before applying stage edges. The34 existing requests
are preserved and refined; no supplier result is assumed proved by a request.

All durable evidence, counts, consolidation mappings, omission contracts and resumption pointers
are in the four deliverables. No scratch file is needed by the next worker.
