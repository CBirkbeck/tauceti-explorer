# REV-SchemeKTheoryOperations~2 — independent review

Verdict: **needs_changes**. This is a finished independent review of revision round 2 for issue #7089, by Codex, session `codex-HftjQr`, on 8 October 2026. This session did neither planning job. No second job is taken.

The review checks S.1–S.7 at target granularity. Every node's hypotheses, statement, proof route, prerequisites, uses, API and examples was read. The cited public statements and proof contexts were checked; the exact pinned declaration statements, supplier contracts, reviewed library audit, RS-18 boundaries and eight assigned red-team findings were checked independently. Clear repairs are applied to the packet and both companions. The previous review's 52 corrections are retained and its twelve disputed routes are accounted for below.

The remaining obstacle is the perfect-complex model in global K-coherence. GS99 Proposition 5 applies scheme descent to vector-bundle K-theory beyond the range of its comparison with perfect-complex K-theory. That inference fails on the nonseparated doubled affine plane. Uniform local stability and a support cofiber dimension bound do not repair the global model comparison. The desired perfect-complex theorem is not refuted; its present proof route remains unestablished.

## Counts

| Item | Result |
| --- | --- |
| Nodes | 284; 247 verified, 35 corrected, two unverifiable; none added, removed or renamed |
| Source citations | 626 locator/match pairs checked in statement and proof context |
| API and tests, all node kinds | 458 API items, 294 mathematical test specifications |
| Validator-counted API and tests | 444 API items, 285 tests; applications/comparisons explain the difference |
| Baseline | All 134 declarations confirmed at Mathlib 082e2d3 and Tau Ceti f790474; none removed or replaced |
| Gaps and requests | 43 gaps (42 inherited and one added), 42 owner requests retained |
| Coverage | Six planned stages, partial S.6, zero closed; packet status partial |
| Planets | 40, retained as key definitions, central constructions or named results |
| Source findings | 51; 49 confirmed, E4/E5 rejected; ten new entries E42–E51 |

Every node has exactly one entry in `review.checked`, and every source finding has this job's independent verdict. A verified contract can have explicitly requested suppliers or proof/source gaps; it does not certify those inputs are implemented. `implementationStatus` remains unchecked throughout. The review job is complete even though the reviewed packet requires another revision.

## Corrections made in this review

This ledger includes changes to hypotheses, proofs or examples even when the theorem statement itself was already sound. Source-only metadata repairs are listed separately below.

| Node, following SchemeKTheoryOperations: | Correction |
| --- | --- |
| `S.1/strictly-perfect-local-lifting` | Separated the local theorem from global affine lifting against termwise quasi-coherent targets. |
| `S.1/perfect-enhanced-subcategory` | Compactness is in enhanced D_QCoh on qcqs schemes; the ambient all-sheaf category has no such blanket assertion. |
| `S.2/k-theory-base-change` | Corrected the base-change map target to G(V). |
| `S.2/cartan-equivalence` | The rank summand is ℤ only for a connected curve. |
| `S.3/affine-extension-of-perfect` | Corrected the supported cone count and final projection; retained the affine hypothesis. |
| `S.3/localisation-fibre-sequence` | The Frobenius localisation theorem supplies the fibre directly; removed the forward scheme-Bass comparison input. |
| `S.3/affine-support-comparison` | The connective support category is the connective cover of the nonconnective fibre; retained the K₀-image cover in the connective localisation statement. |
| `S.3/one-dimensional-localisation-sequence` | Added the two-branch characteristic hypothesis to the nodal example. |
| `S.3/arithmetic-surface-localisation` | Rational vacuity at good reduction requires a proper smooth fibre over a finite field. |
| `S.3/vertical-residue-compatibility` | Required v∈V and qualified the rational arithmetic criterion; a direct sum of finite units is torsion, not finite. |
| `S.4/mayer-vietoris-property` | Specified the qc-open basis and nonconnective K in the Mayer–Vietoris examples. |
| `S.4/nisnevich-site` | A field cover needs a residue-isomorphic component, not an isomorphism of an entire member. |
| `S.4/nisnevich-excision-square` | The p-adic completion square uses infinitely-near excision directly, rather than an étale limit. |
| `S.4/coherent-codimension-filtration` | Excluded the component intersection from the codimension-one example. |
| `S.4/coniveau-residue-differential` | Corrected the coniveau row indexing so the source is K_n and the target K_{n−1}. |
| `S.4/coniveau-chow-group` | Made the ambient-codimension restriction explicit in the divisor relation. |
| `S.4/one-dimensional-coniveau` | Qualified the K rather than G curve example by regularity. |
| `S.4/k-coniveau-first-page-regular` | Replaced the vague singular example with the ordinary nodal local ring. |
| `S.4/gersten-conditions-equivalent` | The equivalent-condition theorem does not prove Gersten for arbitrary mixed-characteristic DVRs. |
| `S.4/quillen-gersten-theorem` | For semilocal rings the generic ring is the product of component fraction fields; a single fraction field requires a domain. |
| `S.4/mixed-char-k0-generation` | Retained integer coefficients in the induction and used the semilocal total quotient ring. |
| `S.5/blowup-adjunction-lemma` | The negative-twist vanishing test requires d≥2; the d=1 range is empty. |
| `S.6/scheme-lambda-algebra` | A clopen support can still have a unit. |
| `S.6/soule-gamma-bound` | Replaced the false tensor-product claim by representation-ring generation. |
| `S.6/vector-bundle-lambda-ring` | Kept λ-operations on vector-bundle K₀ and made its perfect-complex comparison conditional. |
| `S.6/quillen-hiller-special-lambda` | Qualified the special λ unit axiom by k≥2. |
| `S.6/gysin-weight-shift` | Replaced the circular higher-weight assertion with finite descending induction; retained the explicit weighted-module input. |
| `S.6/adams-on-coniveau` | Hypercohomology is covariant in its coefficient sheaf; distinguished additive Adams maps from nonadditive λ operations. |
| `S.7/chern-character` | Confirmed the regular separated scope through TT 2.1.2(d), rather than assuming an unproved resolution property. |
| `S.7/cycle-class-to-graded-k0` | Matched rational equivalence to the ambient codimension relation; the usual Chow comparison retains the dimension formula. |
| `S.7/gamma-chow-comparison` | Qualified the rank-one curve calculation by connectedness. |
| `S.7/gamma-chern-character` | Corrected the γ-graded exponential explanation; preserved the Newton formula. |
| `S.7/hirzebruch-riemann-roch` | Scoped this GRR-derived proof to algebraically closed fields; the arbitrary-field extension needs a descent/base-change proof. |
| `S.7/adams-riemann-roch` | Replaced the untyped Manin/Todd formula with the explicit projective-space Euler-sequence calculation. |
| `S.6/riemann-roch-without-denominators` | Corrected the zero-section compactification to P_quot(N⊕1), whose affine chart is Spec Sym N, consistent with the conormal convention. |

The two unverifiable contracts also received clear repairs: S.6/sheaf-level-k-theory-model uses a filtered colimit and a uniform stability bound across degrees up to m+D+1, with D=max(dim X,dim U+1), rather than a bound on m alone. S.6/scheme-and-support-k-coherence now explicitly identifies the missing perfect-complex comparison and removes its purported proof by finite-rank vector-bundle classification. These edits do not turn that missing bridge into a theorem.

Other synchronized changes replace inherited source passages with own-word descriptions, refresh every source-error verdict, distinguish publication/page sequences, replace the historical review object with the current per-node audit, and bring summary and coverage status into agreement. The reader contains every current node, API, test, gap, request and source finding. The suggested file retains its native pinned-carrier prototypes and replaces the two accumulated historical appendices by one catalogue of the current contracts. Missing enhanced, spectral and supported Chow signatures remain explicit omissions under PROTOCOL §13.

No new node is introduced, so no `addedBy` field is needed. No baseline citation is removed or repaired. Existing declaration-location receipts are preserved, with this review's independent statement confirmation appended. In particular, the categorical Cartan map is imported from Tau Ceti, and ordinary derived categories are not claimed to be enhanced ones.

## The previous review's twelve disputed routes

| Previous route | Revision checked and present disposition |
| --- | --- |
| Supported compact factorisation, S.3/killing-morphisms-into-supported | The E1 Part II request now names both the cellular telescope and finite-extension compact-factorisation theorems, Stacks 09SN/09SP. Compactness factors through a stage and then through Thick(G); arbitrary coproducts are not replaced by finite sums without this input. Stacks 0A9C proves the stated killing theorem directly. |
| Exact graded filtration, S.5/graded-quillen-lemma | The argument now works on the Tor-independent resolving subcategory. Quillen §6 Lemma 1 and Theorem 6, LNM pp.117–118 (PDF pp.33–34), identify exact induced subquotient functors; additivity is not applied to the nonexact filtration on all graded modules. |
| Unbounded coniveau and proper pushforward, S.4/g-coniveau-spectral-sequence | Convergence is finite-dimensional; arbitrary-dimensional claims are removed. Proper functoriality uses the explicit finite-type, pure-dimensional support estimate and dimension formula, with H.6 supplying generic exact-couple machinery. |
| Power-series coordinate change, S.4/gersten-power-series | Formal triangular substitutions isolate the leading exponent over arbitrary fields. The analytic branch has an infinite coefficient field. Weierstrass preparation/completed tensor remain an honest owner gap, rather than a claimed linear direction over finite fields. |
| Global operations, S.6/soule-scheme-operations | GS99 Lemmas 19–20 and §4.2 specify global block-triangular homotopies and rank correction before completion. This removes the stalkwise-equality argument. The result is conditional on the newly named K-coherence model input, which remains open. |
| Supported weights, S.6/scheme-weight-decomposition | Rational support weights use the cofiber bound D, not the sharper unsupported d bound. The integral F² result is distinguished from the full filtration. The requested Z.3 coefficient-weight bridge is explicit; global model transfer remains its prerequisite. |
| Finite coefficients, S.6/finite-coefficient-weight-decomposition | Degree one is excluded. Integral endpoint decompositions, exponent and additive coefficient operations are hypotheses. The CRT primary-block proof includes the square-zero off-diagonal part and proves primitive-root independence using the common endpoint weights. This is a conditional deduction, not a source theorem. |
| Unstable hypercohomology, S.6/simplicial-sheaf-hypercohomology | H.2 Part II supplies the pointed model category and Brown fringe theorem; C_Y is the support cofiber. The stable specialization and unstable pointed/group fringe are distinguished. |
| Mixed-characteristic effacement, S.4/mixed-char-higher-effacement | The proof uses semilocal localisation at all special-fibre generic points, not a single DVR. Its conclusion is group-level zero; a coherent spectrum nullhomotopy is not inferred from elementwise vanishing. |
| Leading Chern class, S.7/chern-class-of-subvariety | SF.5 Part II explicitly requests integral supported classes and their forget-support/Newton compatibility. The top supported cycle group determines the integral coefficient; neither generic smoothness over an imperfect field nor injective open restriction is used. This remains conditional on the declared supplier. |
| Geometric GRR, S.7/grothendieck-riemann-roch | The statement uses Borel–Serre's algebraically closed scope. This review also narrows the GRR-derived Hirzebruch node to match it. |
| Dimension-one G-cycles, S.7/dimension-one-supported-g-cycle-comparison | Pure dimension, catenarity and the dimension formula are stated. Ambient codimension p=d−1 is distinguished from support dimension one; Zhang's final proper-cycle arrow is a map, not an isomorphism. |

The new model problem appears in the two added revision-round nodes. The previous global-operation and supported-weight repairs are therefore valid conditional contracts, but their expanded global proof pipeline has not closed.

## The remaining model comparison

The two unverifiable nodes are `SchemeKTheoryOperations:S.6/scheme-and-support-k-coherence` and `SchemeKTheoryOperations:S.6/sheaf-level-k-theory-model`. Their shared new gap is **Perfect-complex K-coherence model transfer**.

The source read is the 60-page archived GS99 author/preprint copy, §3.2.2, Proposition 5, pp.39–40; it is distinguished from the unread AMS publication and the separate 66-page CERN preprint. It uses Quillen K of vector bundles, then invokes TT 8.1's unrestricted scheme descent. TT Exercise 8.6, printed p.376, gives K₀(Vect X)=ℤ and K₀(Perf X)=ℤ⊕ℤ for the doubled affine plane. This regular noetherian finite-dimensional nonseparated example satisfies the claimed scheme scope. The comparison cannot be justified merely by local agreement on affines.

A revision must prove K-coherence for the perfect-complex model, including rank/completion/product comparisons and support cofibers, or consistently restrict every affected operation/weight/coniveau contract to a justified ample-family scope. Narrowing only the two carrier nodes while leaving their consumers unrestricted will not resolve it. No conclusion here claims that perfect-complex K-coherence itself is false.

## Assigned red-team findings and ownership

| Finding | Boundary checked |
| --- | --- |
| RT-AREA-ktheory-1/17 | K.6 owns ring Bass/Nil and categorical negative vanishing; S.2 owns scheme negative G vanishing and S.5 owns scheme IK/TT agreement. The S.3 localisation proof uses Frobenius localisation directly, avoiding a forward agreement input. |
| RT-AREA-ktheory-1/23 | H.6 supplies filtered spectra, exact couples and convergence; S.4 supplies the scheme descent/coniveau instance and residues. |
| RT-AREA-ktheory-2/38 | S.4's explicit Nisnevich fallback owns the site/square criterion until a foundations move is adopted; it supplies M.5a. SF.2 does not already assert the full Nisnevich contract. Moving it must replace this owner, not create a duplicate. |
| RT-AREA-ktheory-2/39 | R09.1 supplies projective/flag geometry and R09.7a blowups. S.5 supplies the K formulas and S.7 imports SF.5 geometric Chow/GRR. Upstream StableReduction is imported on its overlap. |
| RT-AREA-ktheory-2/40 | StableReduction layer 2 supplies proper coherent cohomology; JacobianChallenge layer C supplies the proper flat finitely presented overlap. The derived and proper-support bridges remain S.2 contracts. |
| RT-AREA-ktheory-2/41 | S.6 supplies M.6b, rather than the unused M.4 edge. Z.3 supplies Z.5's abstract operations, while S.2/S.5 supply Z.5/Z.6's actual scheme comparisons. The old S.7→Z.6 edge is removed in the proposal. |
| RT-AREA-ktheory-2/42 | S.3 supplies the Dedekind localisation sequence to ArithmeticKTheory N.2; N.2 keeps arithmetic finite-support and field-extension consequences. |
| RT-AREA-ktheory-2/45 | DGAInfinity layer 5 supplies arbitrary-ring perfect modules. S.1 supplies scheme/affine comparisons; P7 is only its complete-local overlap. Generic enhancements stay with E0/E1. |

The supplier check read exact packet declarations where available, integrated declarations for the fourteen names not in current supplier packets, and stage scope plus precise owner requests otherwise. There are 137 distinct imported references, comprising 105 declaration references and 32 stage-level interfaces. Missing extensions are not claimed to be delivered by a near-miss supplier. The two upstream documents read for conventions and granularity were DGAInfinity and GrothendieckEulerForms. No upstream roadmap, atlas data, ownership map or label is edited.

## Source findings and editions

All 41 inherited findings were independently adjudicated: 39 confirmed, E4/E5 rejected as routine omitted arguments. E5's proposed absolute-diagonal argument is replaced by the relative diagonal and its subsequent base-changed approximating diagonal. E9/E15 retain the right-linear boundary convention and its graded sign. E19 uses t-power torsion, which need not have finite graded support. E29's unit λ sign and E40's codimension/product-branch/length-order argument are explicit.

The ten added findings are:

| Finding | Exact read locator and reason |
| --- | --- |
| E42 | Stacks 08EK, Lemma 13.10 proof, PDF pp.35–36: starting at F⊕F[1] gives binomial order s+1 after s cones; the next cone must use g_(i+1). The first cone already detects both shifts. |
| E43 | Soulé §2.5, printed pp.496–497, PDF pp.9–10: irreducible representations are not tensor products of exterior powers. Sym²(ℚ²) has dimension three; the alleged tensor products have dimension a power of two. Representation-ring generation is the needed fact. |
| E44 | Soulé proof of Théorème 4(i), printed p.522, PDF p.35: hypercohomology is covariant in its coefficient object, contravariant in its space. |
| E45 | GS99 author-copy Proposition 5, pp.39–40: the unrestricted vector-bundle/descent comparison has the doubled-plane obstruction above. This finding is confined to that author copy. |
| E46 | K-book author draft II.4.11 CC1, book p.98, PDF p.106: the rank endpoint is n>rank, not n≥rank; O(1) on P¹ detects it. |
| E47 | K-book author draft II.4.11.2, book p.99, PDF p.107: total Chern classes are multiplicative, not degreewise additive. Two O(1) classes on P² have nonzero second cross term. |
| E48 | K-book author draft V.9.2 proof, book p.436, PDF p.444: the coherent-filtration abutment is G, not unrestricted K. |
| E49 | K-book author draft V.10.11 proof, book p.449, PDF p.457: the nth Postnikov stage retains q≤n and kills q>n; the printed inequalities are reversed. |
| E50 | TT Appendix B.17, printed p.416, PDF p.170: the coherator right adjoint is left exact, not right exact. |
| E51 | K-book author draft II.4.11.2, book p.99, PDF p.107: the leading γ-graded Chern coefficient is (−1)^(n−1)(n−1)!, detected already by n=1. |

Fresh URL/SHA-256 receipts and read dates are in `sourceVersions`. The Weibel findings remain scoped to the combined 29 August 2013 author draft; the AMS edition was not obtained. The live errata endpoint returned 404, but the public three-page 2024-02-11 archived author list was read in full. Its published page numbers are not substituted into draft locators. Quillen's scan has header pages 77–139 and LNM footer pages 85–147; Theorem 5.13 is header 127, LNM 135, PDF 51. GS87's cover-page offset and GS99's distinct versions are recorded. Scanned mathematics was read through rendered/OCR pages where extraction was inadequate.

The author/journal listings and relevant later corrections were checked before marking the added findings new. No author was contacted. Receipts describe a cited-passage audit, not a claim to have read every page of every volume. No cleared private book was needed or copied.

## Validation and handoff

- Packet validation: `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeKTheoryOperations.json` reports zero errors and zero warnings.
- Source-finding schema and edition receipts: the shared `source_issues.check_issues` and `check_errata.versions_checked` checks pass on the packet's entries.
- Companion completeness: every node, API name and test name occurs in the reader and in the current suggested-file catalogue; review node ids are unique and complete, and all source verdicts name this review job.
- JSON parsing, comment delimiter balance, permitted paths, private-path scan and `git diff --check` pass.
- Final `lean-check` attempt after checking memory stops at the absent compiled `TauCeti.Algebra.Category.ModuleCat.CartanMap` import. The shared build has the pinned Mathlib but does not supply that Tau Ceti object. The file is **not elaborated**; no new build, cache download, Lake update or language server was started.

The orchestrator should queue revision round 3 to resolve or consistently narrow the model comparison, then obtain a fresh independent review. The current needs_changes verdict prevents promotion. The reader's reconciliation and this review are complete; they are not additional unfinished jobs. Resume instructions are in the accompanying handoff note.
