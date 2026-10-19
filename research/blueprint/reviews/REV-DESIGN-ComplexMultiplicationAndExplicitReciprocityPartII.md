# Independent review: Complex multiplication and explicit reciprocity, Part II

**Verdict: accepted as a complete target-level planning pass.** This accepts the statements, ownership, dependency plan and recorded proof obligations. All 14 layers remain `planned`; none is `closed`. All 21 proof and edition gates remain open and every node has implementation status `unchecked`.

Reviewer: Codex, session `codex-hUQQOA`, 19 October 2026. Review job #3510, `REV-DESIGN-ComplexMultiplicationAndExplicitReciprocityPartII`; original design job #3405 was written by the distinct session `codex-jxfcHU`. The packet records this review as `independent-review-REV-DESIGN-ComplexMultiplicationAndExplicitReciprocityPartII`.

## Inventory and coverage

| Item | Reviewed result |
| --- | --- |
| Nodes | 69: 55 theorems, 11 definitions, 3 constructions |
| Individual node verdicts | 36 verified, 33 corrected, 0 added, 0 unverifiable |
| Definition/construction API | 75 items across all 14 objects; 30 items added |
| Discriminating Checks | 44: 11 computations, 8 degenerate cases, 8 compatibilities, 2 characterisations, 15 non-examples |
| Layers | CMH.0–CMH.13: 14 planned, 0 proof-closed |
| Library citations | 9 confirmed; none removed or replaced |
| Supplier requests | 38, with precise interfaces and consuming nodes |
| Open gates | 21, retained with resolutions and consumers |
| Source findings | 37: 36 confirmed, E22 rejected; E36 and E37 added |
| Public source versions | 9, each with URL, SHA-256, reading date and scope |
| Atlas coverage | 94 routed extraction items, 55 planets |

The packet's `review.checked` contains a separate reason for every node. Every scoped layer has its target nodes, and the roadmap descriptions now state all those targets. Its stage prerequisites are derived from the direct prerequisites of those targets. Target-level proof sketches retain named supplier inputs and recorded gaps rather than manufacturing auxiliary lemma nodes. No new mathematical node was necessary to express the clear repairs.

## Corrections made in place

The following table records each corrected target. Additional source findings and bookkeeping changes are recorded below. A corrected locator is specific to the edition actually read.

| Target | Change and verification |
| --- | --- |
| `cm-class-functions` | Checked CM⁰ versus its proper total-height span, finite quotient refinement and odd-character regularity; added finite-quotient constructor, evaluation extensionality and linear structure. |
| `height-torus` | Checked the character annihilator, dimension, distinguished cocharacter and μ_d diagonal kernel; added quotient construction, character extensionality and CM-isomorphism transport. |
| `integral-level` | Checked the local unit-image exact sequence and ramified uniformizer non-example; added subgroup construction and extensionality and corrected test categories. |
| `total-reflex-pair` | Added the positive-integer scaling making the polarization integral on O_E♯; checked product CM algebra, dimension and embedding-set descent and transport API. |
| `polarized-family` | Added integrality of the alternating form on the actual full lattice and the A6 normal-base extension prerequisite. A4 supplies the Tate realization, not the extension theorem. |
| `integral-bk-comparison` | Corrected the Eisenstein polynomial to that of the actual ramified completed local ring O_y over W(k̄_y), retaining φ* and the dual Tate convention. |
| `standard-line` | Corrected the explanation of the positive metric and source locator; added scalar construction and evaluation-at-one extensionality/transport. |
| `newton-and-nonsplit` | Corrected the source to Propositions 3.6.1–3.6.2 and Lemma 3.6.3; replaced the inertia stage R07.5 by the actual R07.2 slope and Dieudonné–Manin targets. |
| `determinant-section` | Checked determinant variance and effectiveness from the actual graded-action map; added its construction and vanishing/base-change API. |
| `dvr-partition` | Checked complete DVR, invertible B-module, all embeddings and unramified factorization hypotheses; added quotient universal map and length/base-change transport. |
| `local-conductor` | Checked finite-quotient domain, conjugacy averaging and inflation compatibility; added linearity and uniqueness on finite quotients without a measure claim. |
| `local-total-reflex` | Checked the local type restriction multiplicity and character calculation. The separate all-prime filtered quotient identification remains G-IntegralReflex. Corrected the final local calculation locator to p. 522. |
| `reflex-height-bridge` | Checked powers of two, normalized complex degrees and log D_F term; finite étale level changes scale both degrees. Corrected the final local calculation locator to p. 522. |
| `good-auxiliary` | Corrected Definition 5.3.3 to p. 460; checked trace/sign and norm-ideal goodness and added local-data construction and isometric change API. |
| `auxiliary-choice` | Corrected theorem kinds in the locator; checked narrow norm image and unramified sign case, retaining the primary Armitage gate. |
| `nearby-height` | Checked unordered edges, half-sum and conjugate pair; added edge construction and CM-algebra transport. |
| `different-graph-datum` | Checked specified ideal-torsion graph and good-reduction data against the read revised author erratum; added constructor and graph extensionality. |
| `relative-determinant-cancellation` | Corrected the original proposition locator to p. 575; retained the explicit ramified image/relative determinant gate instead of asserting exactness of raw tensor quotients. |
| `quaternion-point-height` | Removed the claim that all CM points form one reciprocity orbit: functoriality gives invariance within an orbit, and the later formula gives full independence. Added point construction and field-extension API. |
| `quaternion-hodge-comparison` | Corrected the source to Propositions 5.3–5.4 and Corollary 5.5; retained the different twist, metric and ramified Kodaira–Spencer gate. |
| `arithmetic-adjunction` | Read the full pp. 629–635 proof and identified the non-étale cover slip E37. Retained invariant local lifts, multiplicity e, conormal and vertical corrections as G-Adjunction. |
| `averaged-colmez` | Checked both alternative branches, their d=1 boundary and the h_YZ-to-unscaled adapter. No individual Colmez conjecture or quantitative orbit theorem enters either branch. |
| `quadratic-hecke-bound` | Checked unconditional quadratic Hecke completion, uniformity in the varying real base and finite-L conventions against exact AN.4 targets; retained the primary estimate gate. |
| `centre-order` | Corrected the repeated-factor test to distinguish the integral center order from its rational center field; added actual-center construction and presentation invariance. |
| `order-discriminant` | Checked the exact index-square identity for the full center product, separated from all Mumford–Tate compact indices. |
| `primitive-reciprocity-image` | Extended the principal-only CM.2 supplier argument explicitly to arbitrary polarizations via (I,ξ); bounded the unit obstruction and relative/absolute marked/unmarked fibers without assuming a principal maximal-CM realization. |
| `norm-image` | Checked the class norm cokernel bound via the Hilbert class-field intersection and the bounded normal-closure degree; norm maps and reflex maps are distinguished. |
| `general-orbit-reduction` | Checked primitive factors in every dimension h≤g, normal-closure norm loss, compact index and bad-prime factor B^#S; quantitative orbit/moduli injectivity remains G-TorusOrbit. |
| `all-cm-orbit` | Checked absorption of the bad-prime loss and combination of order index and field discriminants to a positive power of D_x with g-only constants. |
| `cm-coordinate-degree` | Checked rational homology linear algebra over the normal closure and adjoining i separately, giving (2g)! and 2(2g)!. Refined E28 to the joint field actually claimed by the source. |
| `cm-lift-height` | Checked all dimensions, full center-order D_x and the coordinate-degree adapter; it states absolute multiplicative Weil height rather than only analytic period size. |
| `bounded-degree-cm` | Checked D_x bounded by the absolute polarized orbit, polynomial lift height, bounded algebraic coordinate degree and Qbar Northcott; no fixed-field substitution or André–Oort input is used. |
| `colmez-conjecture` | Checked the predicate on the actual height span and its generator equivalence; added generator construction and product/induction compatibility without assuming it in any proof. |

The API additions supply finite-quotient constructors and extensionality for CM class functions; quotient and character interfaces for the height torus; the local unit-image exact sequence and subgroup extensionality; total-reflex descent and transport; the standard line's scalar construction and evaluation interface; construction and vanishing of the determinant section; partition quotient maps and transport; conductor linearity and uniqueness; local good-auxiliary construction and isometry invariance; nearby-edge construction and transport; the specified different-torsion graph and its extensionality; quaternionic point construction and field extension; the actual endomorphism center and independence of presentation; and generator/product/induction interfaces for the Colmez predicate. Each serves a recorded use or a standard object interface.

The 44 existing Checks remain mathematical tests of the intended definitions. Their invalid generic `example` categories were replaced by the protocol's discriminating categories. The integral center test now allows a nonmaximal center order. The full local level is the unit image in the quotient torus, with scalar units as kernel; it is not a quotient by every local scalar in the ambient field. The determinant section is a section of its stated line, with its divisor denoted separately. These details are reflected in both packet and reader.

Source locators were corrected throughout: AGHMP Definition 5.3.3 is on p. 460; the slope results are Propositions 3.6.1–3.6.2 and Lemma 3.6.3; the auxiliary results are Lemmas 9.5.3–9.5.4; the total-reflex local calculation reaches p. 522; its height bridge uses Proposition 9.4.1 and Theorem 9.4.2 on pp. 515–516. Yuan–Zhang Proposition 5.4 is on p. 575, and the Hodge comparison uses Propositions 5.3–5.4 and Corollary 5.5. Combined citations have been separated so that each locator and `match` belongs to its own source version. In particular PT14 Conjecture 7.1 is identified as the earlier conjectural formulation, while the later Tsimerman theorem supplies the result.

The reader was synchronized with all corrected statements, hypotheses, source locators, prerequisites, proof sketches, uses, API items, Checks, acceptance conditions, requests, gaps and source verdicts. The compact suggested file only needed comments clarifying integral polarization, the actual Breuil–Kisin coefficient ring, the slope supplier, and orbitwise versus full CM-height independence. It continues to state representative signatures over existing carriers, with the geometric targets in the reader.

## Baseline and ownership

All nine declaration statements were read at the recorded pins, not inferred from their names. Their URLs and individual confirmations are in `baseline.declarations[*].review`.

| Pin and module | Confirmed declarations and actual scope |
| --- | --- |
| Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Mathlib/NumberTheory/NumberField/CMField.lean` | `NumberField.IsCMField`, `complexConj`, `complexConj_apply_apply`, `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`, `indexRealUnits_eq_one_or_two` in the CM-field namespace where appropriate. The conjugation's integral-over-Q assumption is retained. The regulator ratio is dimension-bounded and generally differs from one. |
| Same Mathlib pin, `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | `NumberField.classNumber_pos`, `NumberField.exists_ideal_in_class_of_norm_le`; the latter is the explicit nonzero integral representative bound. |
| Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean` | `NumberField.card_ideal_absNorm_le`, whose bound is quadratic in X and alone is insufficient for the distant-isogeny argument. |
| Same Tau Ceti pin, `TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean` | `NumberField.abs_discr_le_of_basis_isIntegral`, an inequality for an integral rational basis; the order index-square equality is a distinct imported result. |

The reviewed library audit's CM layers were read. Existing CM fields, conjugation, class groups, class numbers, discriminants and lattice interfaces remain imports. The base CM roadmap owns CM types, reflex fields and polarized lattice classification. This Part II owns the specialized height comparisons, their quantitative orbit consequences and CM lift-height adapters.

The current read-only upstream roadmap checkout was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine roadmaps added after the atlas snapshot and the four named Completed roadmaps were included in the ownership search. IntegralLattices, OrthogonalSpinGroups, GlobalNumberFields, ReductiveGroups, ClassFieldTheory and EffectiveBounds were checked where relevant. General duality, tori, orders, norm theorems and existing effective bounds are imported. They do not supply the additional quantitative CM hermitian/Siegel reduction or the uniform near-linear ideal estimate required here. No upstream file was changed and no build was run there. The new roadmap is outside the current Caraiani–Newton 94-roadmap tier list; no ownership move between tiers was needed.

## Supplier statement audit

The existing owner statements were read for all 38 requests, including exact fine-node imports where present. A request for a refinement does not claim the owner already proves it. The resulting contracts distinguish the following inputs.

| Supplier family | Checked interface and retained boundary |
| --- | --- |
| Base complex multiplication | Actual CM types and orders, arbitrary polarized lattice data and classification. The class-map stabilizer and relative marked-orbit statements are principal-polarization scoped; the consuming primitive-image target now gives the nonprincipal adapter explicitly. |
| Abelian schemes, PEL moduli, Faltings isogeny Part II | A4 Tate realization, A5 integral Riemann forms and algebraization, A6 extension of Hom over a normal base and CM decomposition; M5 polarized data and M6 polarized rigidification/descent. The definition-field request retains the factor from adjoining μ₃. QI.5 supplies a geometric isogeny with its actual common field and stable-height maximum. |
| Arakelov geometry | Stack-weighted degree, metric normalization, stable-height properties, component lines and the locally-free component isogeny formula. The raw ramified τ-quotient is not silently treated as an invertible line. The primary CM Hodge-filtration gate remains explicit. |
| Finite flat groups and Lubin–Tate theory | R07.2 slopes/Dieudonné–Manin, R07.4 coefficient rings and integral comparisons including the dyadic branch, LT.2's reciprocity convention. Breuil–Kisin uses the uniformizer of the actual completed local model. The specialized CM torsion calculation retains its primary proof gate. |
| Shimura data/varieties and automorphic bundles | Cocharacter/reflex dictionary, torus datum, canonical tower and CM reciprocity, coarse versus non-neat stack comparison, canonical tensor realizations and exact Hodge-line metric adapters. D3 alone is not claimed to construct a torus Shimura datum. |
| Gross–Zagier and Hilbert/quaternion curves | Exact Colmez kernel, modified projection, self-intersection, adjunction and residue-line interfaces, with their compactness, level, ramification and Schwartz-data hypotheses. General cuspidal projection alone is insufficient. Integral maximal orders and ramified Kodaira–Spencer require their listed refinements. |
| Analytic number theory and local factors | Fixed-degree Brauer–Siegel, quadratic Hecke conductor/completion, functional equation and uniform Cauchy/log-derivative estimates. General Artin holomorphy is not assumed. The varying-real-base uniform estimate remains a primary proof gate. |
| Geometry of numbers, heights, Néron models, metaplectic forms | Mixed-embedding covolumes, minima, integral hermitian reduction and the extra quantitative Siegel refinement; absolute height and Qbar Northcott; good reduction and isogeny invariance; the actual MP.7 rank-one input, with full support-controlled Borcherds existence left as a gap. |
| Current upstream GlobalNumberFields, ReductiveGroups, ClassFieldTheory; RG2.0a | Order discriminants and Picard distinctions, tori/character lattices and Weil restriction, and the norm-cokernel bound from the Hilbert class-field intersection. No conflation of norm maps, reflex maps or compact indices. |

The direct extension prerequisite for the polarized family was added. The wrong inertia-stage supplier for Newton slopes was replaced by the actual slope and classification targets. Requests for the Colmez-specific Gross–Zagier interfaces, the quadratic completion and the varying-base analytic bound were made precise. The gap list retains the additional work rather than declaring those refinements delivered.

## Sources and independent source findings

Only the nine public versions listed in `sources` and `sourceVersions` were used. Their reading boundaries are explicit. Tsimerman's 2018 article and the revised author erratum were read in full; the relevant sections and statements of the other sources were read at every cited locator. The underlying long proofs and cited primary references that were not independently established remain named gates. The report and deliverables contain our own mathematical statements, not source excerpts or a section-by-section reproduction.

All 35 inherited source findings were checked individually and two were added. Each of the resulting 37 entries has its own `confirmed` or `rejected` verdict and reason. The significant qualifications are:

- **E22 rejected.** An integral O_E-linear different-torsion isomorphism already permits extension of every generic unit automorphism: lift the unit and its inverse modulo the different to integral scalar endomorphisms. Composition extends the specified graph map. This is not an additional gap beyond the specialized CM classification.
- **E23 narrowed.** The semilinear Frobenius permutes embedding factors. A diagonal expression on the appropriately linearized source is legitimate; the error claim must not reject that notation itself.
- **E24 retained with a deeper start.** The contraction argument can begin only after its displayed valuation estimate applies; the proposed start fails already at ramification index one.
- **E26 retained for unpolarized rigidity.** Congruence-one units can remain nontrivial automorphisms in higher-dimensional unpolarized CM. The corrected argument rigidifies the polarized object and transports the quotient polarization.
- **E28 narrowed to the joint coordinate field.** The source's degree bound for the entire CM point is too small. The safe normal-closure bounds are (2g)! for complex coordinates and 2(2g)! after adjoining real and imaginary parts; this does not assert the same counterexample for every individual entry.
- **E35 has the corrected locator p. 510.** Total overlaps span the height subspace, not the full class-function space. Colmez's component generators on pp. 630–632 distinguish those domains.
- **E36 added.** Tsimerman p. 382 identifies CM and real regulators, whereas the actual ratio is 2^(g−1)/Q_E with Q_E equal to one or two. Fixed-dimension comparability preserves the class-number argument.
- **E37 added.** Yuan–Zhang p. 633 calls the level projection étale while the same paragraph allows CM-fiber multiplicity e>1. The adjunction plan retains the actual local lift, elliptic ramification and modified projection formula.

The T12 and PT findings are explicitly limited to the downloaded arXiv versions. The JAMS and Compositio editions were identified through their publisher records but not collated. The 2022 author erratum was read in full; its 2023 Annals edition was identified but not collated. No claim is made that a preprint defect survives in a journal edition. These access results and the bounded correction searches are recorded in the packet. The unread book on quaternion orders was not obtained from an uncleared copy.

## Remaining work and orchestrator notes

All 21 gates have exact consumers and resolutions in the packet and reader. The target-level acceptance does not discharge primary period relations, integral tensor and determinant comparisons, the orthogonal arithmetic-height and Borcherds inputs, primary CM Kisin classification, ramified component determinants, quaternion maximal orders and Kodaira–Spencer, noncuspidal kernels and ramified adjunction, uniform Hecke estimates, compact torus indices, orbit/moduli injectivity or quantitative period reduction.

No issue needs an answer before accepting this review. Follow-up workers should collate the three identified publisher editions when accessible, and propagate this independent rejection of E22 to any subsequent review of the earlier Yuan–Zhang extraction. That earlier extraction and all other owners were left untouched because they are outside this job's deliverables. No new owner or roadmap is proposed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ComplexMultiplicationAndExplicitReciprocityPartII.json`: zero errors and zero warnings.
- Source-version validation and `source_issues.check_issues`: passed for all nine versions and 37 findings.
- Structural reconciliation: all 69 review records, 14 API/test-bearing objects, 44 legal test kinds, layer descriptions/prerequisites and complete reader statements, sources, API and Checks agree with the packet.
- `lean-check research/blueprint/suggested/ComplexMultiplicationAndExplicitReciprocityPartII.lean`: exit 0 at the pinned shared build; only declaration-uses-sorry warnings. Available memory was checked before compiling. The file has 189 lines, no sorry'd data definitions and no auxiliary development.
- `git diff --check`: passed. Only this job's five deliverables and its handoff note are changed.
