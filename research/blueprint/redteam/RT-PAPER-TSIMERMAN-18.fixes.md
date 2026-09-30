# FIX-RT-PAPER-TSIMERMAN-18 — extraction and ownership corrections

Issue #4985. Codex — `codex-5ebb6f`, 30 September 2026. Claim comment
5918029815; bot confirmation 5918031946. Input revision
`ac4bad49de4975fbd69d14d9cda2d8b636a822d6`.

All eleven findings in [the red-team result](RT-PAPER-TSIMERMAN-18.result.json)
are confirmed in [its independent verification](RT-PAPER-TSIMERMAN-18.review.json).
This fix updates the extraction and reader report. The five medium findings in
the issue body are not the whole worklist: findings 6–11 are addressed too.
Independent `REV-FIX-RT-PAPER-TSIMERMAN-18` remains required. Neither the older
paper review nor the red-team verification accepts the revised routes or new
source-issue records.

## Finding-by-finding changes

1. **Duplicate functional-transcendence suppliers.** The four false planned
   LD.6 items (special/weakly-special definitions, CM-point promotion,
   restricted Siegel definability and hyperbolic Ax–Lindemann) are missing,
   without planned stages, and route to the exact existing MPT19 route-1
   `LogicAndDefinabilityPartII` identity. PT2014 Lemma 7.5's countable
   weakly-special decomposition is also missing there, refining the families
   interface in MPT19/2. The brief shares MPT19/2 and /8 and derives the pure
   Ax–Lindemann corollary from MPT19 Theorem 1.1 instead of scheduling another
   proof. Arithmetic orbit-to-lifts, exceptional-CM finiteness, finite-family
   application and André–Oort stay at LD.6. Its reason now describes these
   imports. The accepted MPT brief already requires early counting and late
   applications to be separated; this fix repeats that design constraint.

2. **Retired AN.0.** Route 5 names only AN.4/AN.5. AN.5 receives the missing
   `a_K(m)<=d_n(m)` majorant beside fixed-divisor-subpolynomial and its existing
   divisor estimates. The carrier/Euler factors are imports from existing
   ArithmeticDirichletSeries Layer 3. The CM quantitative brief and analytic
   reader paragraphs agree. RS-07 and the AN packet's closed dropped layer
   were checked; neither AN.0 nor an upstream roadmap receives new work.

3. **Artin contour gap.** E9 records the printed pointwise Cauchy/convexity
   step at published p.384, comparing v5 Corollary 3.2 p.5. Brauer denominators
   can introduce poles, so the text supplies no conductor-uniform holomorphic
   disc for an arbitrary Artin factor. `artin-derivatives` now asks for the
   factorwise logarithmic estimate at one, explicitly requiring pole-order
   cancellation and regularization of trivial Hecke factors before evaluation.
   `artin-values` uses only finite nonzero values at one, with reciprocal
   control. The existing entire quadratic-Hecke deduction remains the height
   consumer; no stronger Artin result is claimed proved.

4. **Unpolarized rigidity error.** E10 records the published Lemma 4.1 step
   and its use in Theorem 4.2. The finite-index kernel of CM units modulo 3
   contains a nontrivial unit when g>=2; its action fixes full 3-torsion, so
   unpolarized rigidity fails. All three affected items cite E10 and use the
   polarized field of moduli. The quotient polarization is now explicit:
   if f:A→B=A/T_I and n kills T_I, the defined g:B→A satisfying g∘f=[n]
   gives g^*lambda_A. This gives the compatible polarized quotient needed for
   descent. Polarization morphisms and chosen ample line bundles remain
   distinguished. Lemma 4.1 is absent from v5; this finding is scoped to the
   publication.

5. **Mixed foundations missing from the intake.** Chose option (a).
   Added the missing Pink/Gao mixed-data and variety item, including the pure
   projection, subvarieties, lattices, levels and weakly-special convention.
   Added Gao's mixed Ax–Lindemann as one cited theorem for the shared logic
   Part II. The conditional theorem already invokes Gao Theorem 12.2, so its
   quotient-reduction statement is now an explicit cited item too. The new
   `ShimuraVarietiesPartII` extends the parent's actual title, *Complex Shimura
   varieties and canonical models*, by mixed Shimura varieties. It receives
   foundations, denominator, relative orbit, quotient reduction and conditional
   André–Oort. Only the restricted `mixed-application-interface` stays at LD.6,
   merged into route 1; old duplicate route 11 is removed. G5 records this
   replacement. C1 supplies boundary instances, not all mixed geometry.
   Following the verifier's correction, the brief imports the concrete
   universal-family carrier of DGH21/17 from an early uniformization prefix of
   `AbelianSchemesBettiMapsPartII`; it does not duplicate that datum or import
   the downstream Betti-form/non-degeneracy programme into foundations.

6. **Positive lower-constant misprint.** E11 records the published word and
   both consumer notes cite it. The correct lower constant is real; the j=0
   example is approximately -1.66769 in the printed unscaled volume metric,
   and -0.74875 after the stated normalization shift. The inequality is
   unchanged. One verifier detail is corrected: the corresponding v5
   Corollary 3.2 proof p.5 does not call this lower constant positive. The
   positive isogeny exponent elsewhere on v5 p.4 is a different constant.

7. **Numerical lift-degree gap.** E12 records the unsupported printed 2g and
   `cm-lift-degree` cites it. The Hodge-plane/type-stabilizer argument gives
   the reflex field and a complex-coordinate bound at most 2^g in the
   CM-field case; integral symplectic reduction preserves the field. The
   generic sextic group action has eight CM types, exceeding 2g=6. Keep the
   sufficient bound d_g, with explicit coordinatewise counting and a separate
   real/imaginary conversion (a coarse 2^(g+1) bound suffices). Neither the
   earlier PT Lemma 7.4's repeated assertion nor joint-degree language proves
   the printed coordinatewise 2g. This changes no André–Oort endpoint.

8. **Duplicated height-metric adapter.** R35.2 is the single supplier of the
   unscaled, standard integration and Yuan–Zhang metric comparison, including
   additive constants. The CM Part II imports it rather than building both
   normalizations. The printed Tsimerman norm is AGHMP's norm, so the latter's
   route-11 adapter is the same identity. RS-06's retained product/dual
   normalization and the reviewed R35.2 audit were checked. The cross-paper
   handoff below requests the matching AGHMP brief correction.

9. **Existing absolute coordinate heights.** Read the actual pinned
   `NumberField.absMulHeight₁` and `absLogHeight₁` definitions. A new library
   item cites them, and the old stable `algebraic-point-height` item imports
   those same declarations, with planned RP.0 referring to extension and
   complex-to-real comparisons. Tuple counting takes their maximum, rather
   than constructing another absolute-height definition. The code's junk
   branch is 1, despite the docstring's 0; algebraic coordinates exclude that
   branch. Fixed-number-field Northcott is not promoted to bounded-degree
   Northcott.

10. **Counting split and prerequisite links.** The stable `pila-wilkie` item
    is the rational theorem explicitly planned at LD.6. The added missing
    theorem is Pila 2009 Theorem 1.6, with independent coordinatewise degrees
    and maximum absolute coordinate height. It is in route 1's counting
    prefix and explicitly enters exceptional-CM finiteness. Pila 2009 is now
    a prerequisite. Links identify the [MSJ book record](https://www.mathsoc.jp/publications/pubmsj/),
    [MPIM 96-51 conference record](https://archive.mpim-bonn.mpg.de/id/eprint/707/)
    and [Rademacher publisher record](https://doi.org/10.1007/BF01162949).
    They no longer point to Tsimerman or Thorner–Zaman PDFs. The records and
    Pila's author-copy theorem were checked; this is not a claim to have read
    the full book, Bost or Rademacher proofs.

11. **Stale counts and missing source-version metadata.** Current counts and
    the reader headline agree: 106 items, 6 library/25 planned/75 missing,
    twelve routes. Historical 101-item inventories and regression counts are
    explicitly historical. Nine fresh PDF hashes, reading dates and selected
    extents are in extraction `sourceVersions`; the attributed 23 September
    main-PDF/version reads remain in provenance. E6–E8 payloads and independent
    verdicts are unchanged, E1–E5 remain linked from their separate errata
    file, and new E9–E12 have no fabricated verdicts. The separately owned
    errata file is outside the three deliverables authorized by issue #4985;
    its missing `sourceVersions` update is handed to its owner below, rather
    than editing an unlisted file. Its existing checker passes, but that does
    not discharge the metadata obligation.

## Sources and scope of evidence

The extraction's `sourceVersions` records selected fresh reads of the published
article, arXiv v1–v5, PT2014 v3, Pila 2009's dated author copy and Gao v6. The
reader report lists exact pages and images. The published and v5 hashes match
the independent verifier's hashes. The Mathlib/Tau Ceti commits are unchanged:
`082e2d37e8b0463410cdb532e111cd43d5a66174` and
`f790474821cf4256814db967cb154e7af3d0c369`.

The Annals article page, arXiv history and versions, author's publications and
title/correction searches yielded no applicable correction in this bounded
search. Crossref's DOI record returned no `update-to` entries and an empty
relation object. This is not proof that no correction exists. The main paper's
inherited complete reads remain attributed to their workers; this fix makes
selected fresh checks. It does not certify recursive proofs of the cited
sources or rerun the historical 2412 assertions. No Lean file was written or
compiled.

## Maintainer and supplier handoff

- **MPT19 / DESIGN-LogicAndDefinabilityInNumberTheoryPartII:** /2 and /8 are
  now explicitly shared by this paper. Merge the route briefs under the
  existing `LogicAndDefinabilityPartII` identity. Include PT2014's countable
  locus and pure Ax–Lindemann corollary; add the distinct mixed theorem with
  its geometric supplier. Preserve early counting versus late applications.
- **DESIGN-ShimuraVarietiesPartII and DGH21/17's design:** coalesce the general
  mixed foundation and the existing concrete Kuga example through one early
  universal-family implementation. Give that early uniformization and later
  Betti applications separate actual stages, with independent acyclicity
  review. The new mixed brief is a proposed owner, not an existing stage.
- **AGHMP18 / ComplexMultiplicationAndExplicitReciprocityPartII:** its
  route-11 metric-adapter sentence should import R35.2. This paper's brief now
  does so. The AGHMP file is outside this fix's deliverables.
- **ERRATA-PAPER-TSIMERMAN-18 owner:** add `sourceVersions` to the separate
  errata JSON in its authorized scope, using the already recorded published
  and v5 hashes and its attributed review dates/read extents. This extraction
  supplies the fresh selected-read records. Preserve E1–E5 and their reviews;
  do not copy them into a second register entry.
- **Independent REV-FIX:** review the twelve routes and E9–E12, including the
  corrected edition scope of E11. The earlier paper review is evidence for
  the unchanged revision, not a verdict on these proposals.

These are deliverable-contained handoffs for the maintainer and future jobs;
no source author or other worker was contacted, and no campaign, atlas,
upstream roadmap, packet or independently owned paper/errata file was edited.

## Validation

The repository paper checker, explicit `versions_checked` and source-issue
checker, stable-ID/payload checks, exact missing-item routes, pinned reference
checks and item DAG pass. The separately owned errata checker passes read-only.
Fresh graph and preservation totals are recorded below. Intake validation and
`git diff --check` cover exactly this job's three deliverables. E1–E8 retain
eight collector-confirmed records; E9–E12 remain four awaiting review. Nothing
was written to the source-issue register or atlas data.

Fresh totals: 101 incoming IDs preserved; 80 original item records unchanged;
106 item vertices and 152 item dependency edges acyclic; all 75 missing items
uniquely routed. The assembled baseline has 2891 endpoints and 8258 edges.
Fourteen required directions through seven temporary early/late vertices are
acyclic. Both negative controls (whole LD.6 and downstream Betti import) reject
a cycle. These temporary vertices are never written as roadmap stage IDs and
do not claim that the future designs already exist. Nine PDF hashes match the
recorded binaries. The exact pinned height definitions were read, not merely
found by declaration-name search. The numerical negative-height calculation
is a sanity check on the stated closed forms, not a proof of averaged Colmez.
