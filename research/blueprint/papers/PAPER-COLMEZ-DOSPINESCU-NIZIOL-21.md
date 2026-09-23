# PAPER-COLMEZ-DOSPINESCU-NIZIOL-21 — independent-review revision

Colmez–Dospinescu–Nizioł, *Integral p-adic étale cohomology of Drinfeld symmetric spaces*, Duke Mathematical Journal 170 (2021), no. 3, 575–613, [DOI](https://doi.org/10.1215/00127094-2020-0084).

Status: **partial**, following independent review `REV-PAPER-COLMEZ-DOSPINESCU-NIZIOL-21`. The review itself is finished and requests revision. There are 53 items: 8 library carriers, 8 planned, 37 missing; nine routes and fifteen source findings. Nothing here asserts that these cohomology theorems have been formalized.

## Source witnesses

The [24-page Nizioł author PDF](https://webusers.imj-prg.fr/~wieslawa.niziol/integral-Omega3.pdf), compiled 28 June 2020, was read completely. Its SHA-256 is `0535b22d7a61aff68405a2b364ff4d6b62cb7928eb14479840989dd46db14d34`. Main item locators retain its pagination.

The input's assertion that there is no arXiv version was false. [arXiv:1905.11495](https://arxiv.org/abs/1905.11495) lists v1, submitted 27 May 2019, and the journal page range. The downloaded [v1 PDF](https://arxiv.org/pdf/1905.11495v1) has 21 pages and SHA-256 `d651dbc382b328956594deeb4e6de589889753e549a4110f90a7f016c9df6be1`. The [Dospinescu author PDF](https://dospinescu.perso.math.cnrs.fr/cdn4.pdf) has 36 pages, a 19 July 2020 compilation date and SHA-256 `a6204fe0291c072c2b689f02c53f4e195e6a0f56c8cc3b751e225d46f0c6bdb3`.

Only selected corresponding passages of the latter two witnesses were collated; they were not both read completely. The DOI fetch failed and the Euclid page did not expose readable article text. The published text and publisher correction history remain unverified. An empty search is not evidence that no correction exists.

## Mathematical content and scope

For a finite extension K/Q_p, its completed algebraic closure C, G=GL_(d+1)(K), and the Drinfeld complement X=H_K^d⊗C, Theorems 1.1/5.1 give G×G_K-equivariant topological isomorphisms

`H^i_ét(X,Z_p(i)) ≅ Sp^i(Z_p)^*` and `H^i_ét(X,F_p(i)) ≅ Sp^i(F_p)^*`.

The integral groups are p-torsion-free and vanish for i>d. The theorem is proved for every prime p; the restriction p≥5 belongs to the separate compact-support result discussed in Remark 1.2.

For the standard semistable formal model 𝔛, Theorems 1.4/4.1 identify `H^i_ét(𝔛,AΩ_𝔛{i})` with `A_inf ⊗̂ Sp^i(Z_p)^*`, compatibly with φ^{-1}. Symbols, their Hodge–Tate specialization, integration over hyperplanes, acyclicity of logarithmic differential sheaves and derived Nakayama lead to this computation. Theorem 2.9 then supplies a truncated Frobenius-fibre description and the exact sequence whose adjacent-degree cokernel vanishes. In that adjacent degree the coefficient is **A_inf{1}**, not A_inf.

The distinction between generic fibre X and formal model 𝔛 is essential in Lemma 3.4: ε_* acts on Ω_X, not Ω_𝔛. The source correctly identifies the dual of LC as an inverse limit; the Steinberg dual is the appropriate annihilator submodule, not that whole limit.

Local smooth AΩ in AI.3–4 is already non-proper. AI.5 has proper finiteness/BKF conclusions and AI.6 an explicit proper-DVR semistable contract. Neither justifies every flat-model or non-quasi-compact assertion by its name. Generic completion belongs to DD.1, not a new A_inf extension.

## Library and owner checks

The eight new carrier items B01–B08 cite statements actually inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: ordinary derived categories, Witt vectors, locally constant functions, AbstractMeasure, Dirac evaluation, p-adic integers, algebraic Kähler differentials and exterior algebra. Each records its source path, line and file hash. These restricted matches do not supply period arithmetic, logarithmic/continuous differential comparisons, distribution-topology comparisons, derived completion or Drinfeld cohomology.

The reviewed library audit's AUDIT-25 explicitly distinguishes bounded-measure carriers from the missing locally analytic/functional-analytic theory. No matching audit entry was found for the exact AI/PR/DD/P8/A1 stage keys; that absence was not used as an implementation certificate. Searches at both pinned libraries distinguished unrelated finite-group Steinberg relations and classical Hodge objects from the p-adic statements needed here.

## Routing

| Route | Corrected destination | Review |
|---|---|---|
| 1 | Shared DrinfeldSymmetricSpacesAndSteinbergCohomology proposal | Reject pending atomic/proof closure |
| 2 | AInfCohomology Part II, narrowed to symbols and flat-model interfaces | Reject pending scope and construction details |
| 3 | AInfCohomology AI.0, AI.1, AI.3, AI.4 | Accept as source |
| 4 | PrismaticCohomology PR.4 | Accept as source, including missing flat-model extension |
| 5 | PadicHodgeTheory P8:local-rational | Accept as source; exact comparison remains missing |
| 6 | ClassicalAdicEtaleCohomology H0 | Accept coefficient-limit and K(pi,1) source additions |
| 7 | DerivedDeRhamCohomology DD.1 | Accept generic completion source |
| 8 | Shared LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis proposal | Reject pending precise topological interfaces |
| 9 | EnhancedDerivedSheaves E4 | Accept ringed-topos completion source |

Routes 1 and 8 reuse the companion extraction's exact proposed IDs, not rival roadmaps. Route 2 does not own generic derived completion, general nearby cycles, pro-discrete functional analysis or unconditional non-proper torsion-freeness. All 37 missing items have exactly one route even though overall extraction status is partial.

## Source findings

The independent review confirms E1, E2, E3, E4, E6, E7, E8, E10 and E14 in the main witness. The July author witness retains them. E3 is now a **gap**, not a supposedly repaired misprint: a degree-i regulator needs a compatible complete higher-degree cochain/cocycle construction, and replacing a displayed H^1-type module by H^i does not prove the completed-tensor/homotopy-limit argument.

E10 has an exact correction: BMS1's result is **Corollary 6.5**, so the footnote calling it a lemma is wrong.

E5, E9, E11, E12 and E13 are rejected: defining x_0=1 is harmless; one Stacks tag can support multiple related claims; * can select either symbol theory; explicitly typed compatible maps may share γ; and a secondary citation is legitimate. A direct generator-wise completeness citation is [Stacks 091Q](https://stacks.math.columbia.edu/tag/091Q), but the input's repeated-tag argument did not establish an error.

New entry E15 records an **already corrected** arXiv-only omission of the coefficient twist A_inf{1} in Theorem 5.1's proof. Both 2020 author versions contain it. This must not become a new accusation against those versions or the inaccessible publication.

E4 corrects the ring input of ordinary Milnor K-theory only. The extraction no longer claims that `{x,a}=0` for all constants in raw Milnor K-theory: the needed vanishing is after the geometric Kummer regulator, or in a specified quotient killing constant symbols.

## Remaining work

Split the bundled completion/Lη properties, multipart local comparisons, Frobenius lemmas and regulator theorems. Supply the E3 cochain construction, integral splitting and LC/measure topology comparison, coefficient and exhaustion limits, the strict topological inverse in §4.4, and the formal étale/Zariski and non-proper semistable scope bridges. Finish individual dependency, API and test contracts after the split.

The added APIs and boundary tests are planning outlines, not Lean proofs. The finite diagnostic tests check quotient-dual dimensions, alternating cocycle identities, cup-cochain degree and torsion quotients; they cannot establish the infinite-dimensional cohomology theorems.

Remark 1.2 is historical context. It yields an abstract duality after two separate computations, not a canonical Poincaré pairing; it is not a present-day nonexistence assertion. The source explicitly defines LC_c by its two conditions, so the unexplained letter c is not a missing mathematical definition.

Validation results and reproducible boundaries are recorded in the independent review report and handoff.
