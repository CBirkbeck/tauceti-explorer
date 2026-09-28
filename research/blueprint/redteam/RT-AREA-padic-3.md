# RT-AREA-padic-3

Three findings concern accepted extraction contracts: the previously reviewed Ding triangulation input (**medium**), a lost rational-slope Hom multiplicity in CN25 (**high**), and two confirmed CN25 corrections left out of the theorem statements (**medium**). Findings 2–3 are supplemental and await independent verification. The existing review covers finding 1 only.

Codex · codex-7e92bd · 26 September 2026 · Refs #1515.

## Finding 1: compatible parameters are part of the theorem

`PAPER-DING-25/4.2-global-triangulation` currently infers a triangulation after shrinking from a reduced affinoid and a dense set of trianguline fibres. Individual fibres being trianguline does not record a choice of their ordered parameters interpolating analytically over the family. The missing data are explicit in the cited sources.

In [Ding's published proof of Proposition 4.17](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), p. 69, the ordered character family is constructed before the triangulation argument. Bergdall applies at a noncritical, phi-generic point. The conclusion carries the displayed character twists, and the neighborhood is shrunk around that specified point.

In [KPX's published text](https://www.mathi.uni-heidelberg.de/~otmar/lehre/seminare/KPX.pdf), Definition 6.3.2, pp. 1102–1103, densely pointwise strict triangulinity includes ordered global continuous characters. Corollary 6.3.10, p. 1108, first gives a proper birational modification and a coherent filtration with an exceptional locus and parameter line bundles. One may derive statements on suitable smaller opens; simply deleting compatibility and base-point conditions is not such a derivation. The published text drops the irreducible-connected-components restriction appearing in arXiv v3, and this report does not ask to reintroduce it.

**Repair:** use Ding's precise local application with its ambient hypotheses and ordered characters, or split out the general published KPX theorem with its actual hypotheses and conclusion. Keep PG.7. The machine-readable finding records the exact item, short source quotations, locators and actionable replacement requirements. The severity is medium because this is one source contract; PG.7 itself already asks for source-qualified triangulation inputs.

## Finding 2: rational-slope Hom needs its multiplicity

**Location:** research/blueprint/papers/PAPER-COLMEZ-NIZIOL-25.result.json, item PAPER-COLMEZ-NIZIOL-25/320, source route to VectorBundlesAndIsocrystals:VB1–VB3

The rational-slope Hom formula drops the multiplicity of the Hom bundle. At λ1 = λ2 = 1/2 it identifies End(O(1/2)) with H⁰(O) = Q_p, contradicting the division-algebra assertion in the same item: that endomorphism algebra has Q_p-dimension 4. The routed input is therefore false even as a vector-space isomorphism.

**Evidence:** The author copy CN5.pdf of Colmez–Nizioł, On the cohomology of p-adic analytic spaces II, §3.2.6(2), p. 17, prints “Hom(O(λ1),O(λ2)) = Hom(O,O(λ2−λ1))”; the extraction reproduces it. The page image was checked, so this is not OCR. URL https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf, read 2026-09-26, SHA-256 bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a. The publisher DOI page returned an unavailable challenge page; this finding concerns the recorded extraction and this author copy, and makes no claim about the published Duke text. Countercheck: O(1/2) has rank 2. Its dual tensor itself has rank 4 and slope 0, hence is O^4 by the stated classification. Consequently its global sections have dimension 4, whereas the displayed right side has dimension 1. The extraction's preceding tensor-product multiplicity h1*h2/h and the author copy's division-algebra assertion independently expose the loss. The printed tensor multiplicity has its own typographical issue; this finding is about the Hom formula.

**Repair:** Use Hom_X(O(λ1),O(λ2)) = H⁰(X,O(λ1)^∨ ⊗ O(λ2)). After choosing a slope decomposition, this is H⁰(X,O(λ2−λ1)) to the direct-sum power N, where N = h1*h2/h and h is the positive denominator of λ2−λ1 in lowest terms. Do not make the chosen splitting canonical or identify the endomorphism algebra with a product algebra. Add the half-slope dimension-4 check and an integral-slope N=1 check to the VB1/VB2 planning interface. Record the source discrepancy with its author-copy version metadata; do not accuse the unexamined published version of the error.

## Finding 3: confirmed corrections must reach theorem statements

**Location:** research/blueprint/papers/PAPER-COLMEZ-NIZIOL-25.result.json, items PAPER-COLMEZ-NIZIOL-25/326 and /327; sourceIssues E31 and E3

Two accepted source corrections remain only in notes/sourceIssues while the theorem statements routed into VB3 still assert the known false versions: /326(b) omits nonzero W, and /327(iv) identifies every height-zero quotient of nonnegative curvature as curvature zero. PROTOCOL §18 requires the items themselves to use corrected statements. This is a failure to propagate already confirmed corrections, not two new source-error discoveries.

**Evidence:** The extraction records confirmed E31 and E3 and supplies counterexamples in the corresponding item notes. Their statements nonetheless retain the uncorrected conclusions. Independently checked in the same CN5 author copy, p. 18, Corollaries 3.20(b), 3.21(iv), §3.2.8 and footnote 9: W=0 violates the strict height conclusion; a torsion object supported at x≠∞ has height 0 and positive curvature, and its identity quotient violates /327(iv). The finding is scoped to that author copy and the extraction; the version of record was unavailable. The short printed assertion “curvature < 0 implies height > 0” is the strict conclusion at issue in /326(b).

**Repair:** In /326(b), require W≠0 for positive height, or state height≥0 with equality exactly at W=0. Replace /327(iv) by the existing E3 correction: the quotient has HN slope zero and is a sum of torsion contributions at closed points; curvature zero requires support at ∞. Preserve the original text only in sourceIssues, retain the independent verdicts, and link both corrected items to E31/E3. Keep VB3 as the owner.

## Coverage

Seven complete roadmap documents and all 58 primary stage descriptions and prerequisite lists: DiamondEtaleCohomology C0-C9; DiamondSixOperations S0-S6; PerfectoidShimuraVarieties S0-S6 and S0.general; PhiGammaModulesAndIwasawaCohomology PG.0-PG.7; TropicalAndBerkovichArithmetic TB.0-TB.7; VectorBundlesAndIsocrystals VB0-VB4 including split and aggregate stages; upstream TauCetiRoadmap/AdicSpaces Layers 0-6. Compared the extracts with data/atlas.json and the roadmap documents; the upstream roadmap is an import boundary, not work to re-plan.

Titles and full layer descriptions of the other 16 roadmaps named in issue #1515: AdicEtaleGeometry, AdicSpacesPartII, DiamondsAndVStacks, FarguesFontaineDiamonds, HodgeTateAndCanonicalSubgroups, PerfectoidQuotients, PerfectoidSpaces, RelativeFarguesFontaine, AInfCohomology, CohomologyComparisons, CrystallineCohomology, DerivedDeRhamCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory, PrismaticCohomology. These were read for cross-part ownership, not given a second full source audit.

TropicalAndBerkovichArithmetic integrated decomposition: all four nodes, coverage, source/proof gaps and review. VectorBundlesAndIsocrystals: all 24 nodes in the two partial VB0/VB3 packets, including statements, hypotheses, proof steps, APIs, tests, requests, restructuring suggestions and gaps; compared the 23 integrated nodes field by field with those packets. The mathematical fields agree; some integrated source annotations differ. The packets are partial, not accepted completed blueprints.

Scope-facing owner, layer and dependency decisions in RS-02, RS-05, RS-08, RS-15, RS-16, RS-20, RS-25, RS-26 and RS-32. In particular, RS-15 already specifies the isocrystal coefficient field and sign, constant-polygon/local-system hypotheses and Banach-Colmez proof-order repair; RS-26 separates shared annulus rings from cyclotomic actions and Herr/Iwasawa theory. RS-20 remains qualified by its recorded RF3 blocker.

Area-facing routes and extracted item contracts in the following 32 paper result files (including proposed Part II contracts and their recorded review status): PAPER-ANDRE-18, PAPER-ANDRE-18-B, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18, PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22, PAPER-BHATT-SCHOLZE-22, PAPER-BOXER-CALEGARI-GEE-PILLONI-21, PAPER-BOXER-CALEGARI-GEE-PILLONI-25, PAPER-BOXER-PILLONI-26, PAPER-BREUIL-HELLMANN-SCHRAEN-19, PAPER-CARAIANI-SCHOLZE-17, PAPER-CARAIANI-SCHOLZE-24, PAPER-COLMEZ-DOSPINESCU-NIZIOL-20, PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B, PAPER-COLMEZ-NIZIOL-17, PAPER-COLMEZ-NIZIOL-25, PAPER-DEMARCO-KRIEGER-YE-20, PAPER-DING-25, PAPER-DOSPINESCU-LEBRAS-17, PAPER-GLEASON-LIM-XU-26, PAPER-GUO-REINECKE-24, PAPER-HANSEN-KALETHA-WEINSTEIN-22, PAPER-HOWE-KLEVDAL-26, PAPER-KISIN-ZHOU-25, PAPER-LE-LEHUNG-LEVIN-ETAL-20, PAPER-LIU-ZHU-17, PAPER-NEWTON-THORNE-21, PAPER-PAN-26, PAPER-PILLONI-20, PAPER-SCHOLZE-26, PAPER-TSUZUKI-23, PAPER-YUAN-26, PAPER-ZAVYALOV-25. This means the routed slices, not a line-by-line re-reading of every original paper. Partial/rejected routes were treated as leads. Own LLHLM23 and KMPS22 work and the ZHU17 supplier reference were excluded from attack.

Generated data/library-coverage.json and scoped AUDIT-39 target/overlap records (review accepted), distinguishing complete upstream plans from partial pinned implementations. Scoped AUDIT-36 and AUDIT-38 records were consulted as leads, without independently verifying their library assertions. The generated coverage file omits these roadmaps; this does not imply that a separate audit-review report is absent. No new library-absence finding is made. The pins remain Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; no Lean compilation or kernel verification was performed.

Scope-touching stage edges and 50 link/overlap entries from the AdicSpaces, ModularCurves, EllipticCurves, ClassFieldTheory, LocalFieldsRamification and ProfiniteProPGroups link maps. Read the neighboring EC4 and Neron/Raynaud contracts when checking TB.7. Existing RT-AREA-padic-1 and RT-AREA-padic-2 claims and the confirmed RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves finding were used to avoid reporting the same repair twice; their findings were not independently re-verified here.

Direct source checks for the reported finding: Ding published PDF pp. 62, 68-69, especially Proposition 4.17 proof; KPX published PDF Definition 6.3.1-6.3.2, Corollary 6.3.10 and Remark 6.3.11, pp. 1102-1103, 1108-1109. Compared KPX arXiv v3 at those statements, then used the published contract. Also checked Fargues-Scholze v4 Corollary II.2.4 and Proposition II.2.5 with surrounding argument (pp. 60-63) for divisor base fields, affinoid H1 vanishing and the perfectoid-ball slope bound. These are passage-level checks, not whole-book or whole-paper verification.

## Leads excluded after checking

- The TB.7/Tate-curve ownership concern is already a confirmed finding in `RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves`; EC4's pointwise uniformization and TB.7's analytic quotient/skeleton work need the already-requested comparison.
- The LLHLM20 Kummer-tower imports do not fit the cyclotomic PG prefix without further work, but `RT-AREA-padic-2/4` already identifies the Kummer equivalence and Kisin-theory gap. No second finding is created here.
- `RT-AREA-padic-1` already treats the Berkovich-spectrum overlap, compactification owner, Hodge–Tate/toroidal period-map overlaps, divisor base-field mismatch, omitted period-space boundary and the RF3/VB proof-order problem.
- RS-15 already fixes the rational isocrystal field, sign conventions, local-system scalar behavior, constant-polygon condition and the general Banach–Colmez dependency issue. Old packet wording is not a new unassigned repair.
- Fargues–Scholze p. 61 distinguishes the divisor presentation on Perf_Fq from its restriction to Perf_k. The unramified-completion symbol cannot be inserted indiscriminately. Proposition II.2.5 keeps the affinoid H1 hypothesis and the positive-slope bound on its perfectoid-ball statement.
- The tropical decomposition openly records its missing proof inputs; the VB packets remain partial. Their disclosed source gaps are not falsely reported as completed mathematics. The CN25 parent/Part II routes and other rejected or incomplete paper continuations were likewise kept distinct from accepted completed plans.

The report does not attack the worker's own LLHLM23, KMPS22 or ZHU17 work. Both attacked extractions and their reviews were performed by other sessions, identified in the JSON independence record. The CN25 additions were checked in the author copy; the unavailable version of record is not accused of these errors.

## Source versions and validation

The JSON records the URLs, dates, SHA-256 hashes and exact passages read. Ding and KPX were checked against their published PDFs. Fargues–Scholze was checked in arXiv v4. These passage checks do not certify every original paper named in the route inventory.

PASS: red-team checker and exact-file intake (two files, zero problems). All 160 captured inputs and both absent-output guards matched fresh main `919bf760943644067515a97924a98953309d4123`; the issue body and bot-confirmed claim were unchanged. No Lean file is part of this deliverable and no compilation or formalization is claimed.

## Supplemental validation and review boundary

The supplemental read covers CN5.pdf pp. 16–18, the rendered page 17, extraction items /320, /326, /327 and confirmed sourceIssues E31/E3. The source URL, hash and limitation to the author copy are recorded in `sourceVersions`. The algebraic rank check uses O(1/2) of rank 2 and H⁰(O)=Q_p; its endomorphism bundle has rank 4 and slope 0. The splitting is noncanonical and does not identify the division algebra with a product algebra.

Finding 3 propagates existing confirmed corrections; it does not assert that those source errors were newly discovered. The Kummer supplier lead remains excluded because RT-AREA-padic-2/4 already records it.

The original independent review file and finding 1 are unchanged. Findings 2–3 require fresh independent verdicts. Under WORKERS.md, this correction is submitted for maintainer handling because review #1514 has already completed; it must not inherit that review's confirmation.

Supplemental checks passed: red-team result checker, exact-file intake (two files, zero problems), unchanged first finding and explicit pending verification for the two additions. All 12 captured supplemental input blobs matched fresh main `faf7465b83943b530bb811435ad60c8808b9256a`. No Lean file was required or compiled.
