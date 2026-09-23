# Farb–Kisin–Wolfson: extraction after independent review

**Partial extraction; independent review requests revision.** The paper uses prismatic restriction bounds and finite Heisenberg cohomology to obtain algebraic p-incompressibility results, including principal congruence covers of Shimura varieties. This corrected extraction has 150 items: 5 library, 46 planned, 99 missing. Every missing item has exactly one owner route. No formalisation or Lean compilation is claimed.

The source read independently is [arXiv2110.05534v2](https://arxiv.org/pdf/2110.05534v2), all40 pages including proofs and references. Page images27–30,33,36 were inspected. The [Farb author copy](https://www.math.uchicago.edu/~farb/papers/thirdessdim.pdf) has identical bytes. The48-page Duke typesetting was not obtained; the institutional copy adds a cover to the arXiv text. The v1 and TeX files were downloaded, but their complete reading is not claimed by this reviewer. Prior extraction claims are attributed separately in the JSON.

The corrected statements retain the strict restriction range i<p−2, the separate empty-boundary abelian endpoint, and the cup-product bound. Positive torus rank and a nonempty torus-fixed stratum are now explicit. The ordinary analytic essential dimension in Definition3.2.15 remains distinct from a restricted Stein-torsor compression invariant: proving a lower bound for the latter does not prove it for the former. The direct algebraic compression comparison and localization to a finite full-dimensional cone in an arithmetic fan remain proof obligations. These gaps do not assert counterexamples to the main algebraic incompressibility theorem.

Pinned-library checking found two substantial existing suppliers missed by the extraction: Tau Ceti already constructs factor-set extensions and classifies them by H², and it implements the maximal pro-p quotient. The revised items import those results and separate the remaining Baer-sum and coefficient comparisons. Sixteen relevant Lean blobs were checked against the pinned trees. The finite-fan carrier requires finitely many cones; it cannot silently represent an arithmetic fan. The higher-dimensional semicontinuity input imports A0-extension, while abelian schemes, K(pi,1), normal-crossings compactifications and torus torsors import their existing owners.

The review also read [Prasad–Rapinchuk06](https://uva.theopenscholar.com/files/ixqrlw/files/adv_reprint_8.pdf), printed647–656, including Theorem1 and its proof. Its global rank is controlled by common distinguished Galois orbits and an exceptional-place condition, not the minimum of local ranks. The exact imaginary-quadratic specialization replaces the extraction’s overbroad version. [Benoist25, §1.1.1](https://www.math.ens.psl.eu/~benoist/articles/Artinvanishing.pdf) supplies the checked smooth/singular Stein citation distinction; the original Narasimhan/Hamm proofs remain external suppliers.

## Ownership and route decisions

Source acceptance assigns mathematics to an existing owner; it does not certify that owner as implemented. Matching candidate IDs are reused and are not treated as live atlas stages.

| Route | Owner | Verdict | Reason |
|---|---|---|---|
| 1 | EssentialDimensionOfCovers | reject | The essential-dimension direction is appropriate, but the ordinary analytic theorem and local arithmetic-fan comparison remain open. Generic foundations have been removed from its private ownership. |
| 2 | ProfiniteCohomologyPartIIHeisenbergCohomology | accept | The odd-prime Heisenberg computation extends upstream profinite cohomology. Import existing FactorSet/classification/maximal-pro-p carriers, and plan only the cohomology/weight/Baer/scalar/comparison increments. The corrected brief specifies multiplicative HS and finite-filtration requirements. |
| 3 | PrismaticCohomologyPartIIPrismaticDieudonneTheory | reject | The ALB proposal with this identifier was checked and already owns the abelian prismatic computation. The exact mod-p Breuil–Kisin endpoint specialization still needs its primary proof; no new live stage is inferred from a matching candidate identifier. |
| 4 | ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary | reject | C4/C5 were checked: PEL integral compactifications do not supply the Hodge-type boundary theorem. The extension is in the right direction, but its exact Madapusi Pera proof/model/prime contracts remain unverified. |
| 5 | ShimuraVarietiesHondaTatePartII | reject | The Kisin17/KMPS22 briefs confirm the common integral-model candidate. The adjoint Hodge lift and principal-level comparison need their exact source contracts and compatible levels; a whole-group isogeny cannot substitute for a derived isogeny. |
| 6 | ReductiveGroupsArithmeticPartII | accept | PR06 Theorem1 and its proof were read. The corrected brief records the exceptional place and common distinguished-orbit count, not a minimum of local ranks, and reuses the existing proposed global-arithmetic owner checked in KMPS22/Kisin17. |
| 7 | DerivedDeRhamCohomology | accept | Logarithmic Cartier and Deligne–Illusie are source material for existing DD.3/DD.6, with the degree truncation and W_2 lift retained. |
| 8 | DerivedDeRhamCohomology | accept | Completed scalar extension and the separated concentration/exactness statements feed DD.1. They do not assert exactness of arbitrary completion. |
| 9 | PrismaticCohomology | accept | The relative/log prismatic, Frobenius and étale comparisons serve existing PR.1/PR.4/PR.8; the restriction argument imports these suppliers. |
| 10 | HodgeTateAndCanonicalSubgroups | accept | The Kummer-étale/log-purity inputs belong to the existing T6:log-sites supplier, with their log and coefficient hypotheses preserved. |
| 11 | SchemeAndStackFoundations | accept | Albanese/Picard and spreading/model inputs are already the SF.3/SF.4 direction. Their external proof leaves stay visible; this source acceptance is not an implementation claim. |
| 12 | AdelicAlgebraicGroups | accept | Unipotent approximation belongs in AA.4. The corrected input fixes K_{U,p}=U(Z_p) and separates the additional pro-p-completion comparison. |
| 13 | ShimuraData | accept | Deligne-torus, Hodge/abelian-type and reductive-model interfaces serve D0/D4; they use the correct derived-group and effective-action conventions. |
| 14 | ComplexComparisonPartIISteinTopology | reject | Generic analytic topology is assigned to the complex comparison direction, but singular-Stein constant-coefficient vanishing and finite analytic trace are not supplied by C1 coherent vanishing. The new extension needs exact primary proof contracts. |
| 15 | SchemeAndStackFoundations | accept | Generic K(pi,1), torus comparison/Künneth and normal-crossings compactification interfaces belong to SF.2/SF.4, rather than a private essential-dimension foundation. |
| 16 | AlgebraicModuliForArithmeticGeometry | accept | The reviewed A0-extension explicitly owns higher-dimensional proper-flat coherent cohomology/base change and the semicontinuity application; the curve-only StableReduction citation was too narrow. |
| 17 | AbelianSchemesAndArithmeticModuli | accept | Multiplication torsors, degree-one realizations and complex uniformization have the existing A3/A4/A5 owner. The exterior-cohomology application consumes those suppliers. |
| 18 | ShimuraCompactifications | accept | The relative torus-torsor carrier already belongs to ShimuraCompactifications:C0. Keep only the FKW-specific calculations in the essential-dimension consumer. |

## Remaining work

- **G-analytic**: Supply primary analytic trace and singular-Stein contracts, preserve analytic-Zariski density, and either prove the ordinary compression reduction or retain the restricted invariant and prove the direct algebraic comparison.
- **G-fan**: Work with a chosen full-dimensional finite cone subfan of the arithmetic fan; prove its local completion and neighbourhood/nonvanishing comparison. An arbitrary smooth or infinite fan cannot be inserted into the finite complete-fan theorem.
- **G-abelian-prismatic**: Read the exact ALB23 statements and base-change proof for the empty-boundary Breuil–Kisin specialization. Reuse the matching ALB proposal, which is not yet a live stage.
- **G-integral-boundary**: Read Madapusi Pera2019 integral boundary proof with the prime/model/reflex-field hypotheses and compare C4/C5 versus the Hodge-type extension. Do not treat the PEL C5 result as the Hodge-type result.
- **G-hodge-lift**: Acquire Kisin2010 Lemma3.4.13 and the FKW21 principal-cover proof. Construct compatible levels and distinguish whole-group central quotients from derived central isogenies. Integrate the existing Honda–Tate/integral-model proposal.
- **G-closure**: Close Koizumi/Poincaré extension, nilpotent arithmetic pro-p completion, Baer-sum and scalar-restriction proof leaves. Split remaining multi-part results and give all missing declaration-sized proof/API dependencies before calling the extraction complete.
- **G-versions**: Compare the inaccessible48-page Duke typesetting and later author corrections before asserting that these v2 findings persist in the published article.

The JSON includes all150 statements and locators, a per-item search/status ledger, pinned declaration evidence, eight API contracts with concrete mathematical boundary tests, and an acyclic supplier graph whose open leaves are explicit. Those are review repairs, not a declaration-complete blueprint or an elaborated suggested Lean file.

## Source findings

The independent review checked all18 original findings, rejected E7’s terminology objection, and added13 findings. All31 entries have individual verdicts:30 confirmed and one rejected. E30 separately records the empty-boundary proof hypothesis that E7 had conflated with terminology. The JSON gives versioned locators, corrections, counterexamples or type checks, impact and bounded correction searches. Findings concern arXivv2; published-version agreement is unverified.

See [the independent review](../reviews/REV-PAPER-FARB-KISIN-WOLFSON-24.md) for the full verdict register.
