# Handoff: DESIGN-LogicAndDefinabilityInNumberTheoryPartII

Issue #3384. Agent: Codex. Session: codex-27ngX6. Date: 19 October 2026.

## Submission and scope

This completes the target-level planning pass permitted by PROTOCOL section 0 and the issue's independent-directions clause. Packet status is `complete`, not `closed`. All eight stages are `planned`; none is `closed`. Every node keeps implementation status `unchecked`. There are 58 nodes: 11 definitions, 4 constructions, 5 lemmas, 34 theorems and 4 comparisons. The 15 definition/construction nodes carry 69 API items and 54 discriminating tests. There are 29 planets, at most six per stage, and 15 baseline declarations.

All 52 items routed by PAPER-DITTMANN-POP-23 to FinitelyGeneratedFieldDefinability are mapped to the actual target nodes in `routeRealisation`. The fixed issue identifier is used, with the old routed name recorded as an alias. The separate functional-transcendence direction is preserved as a detailed proposal, rather than omitted or made a prerequisite of the field theorem.

The reader states every target, hypothesis, proof sketch, definition API, test and source locator, with examples and dependencies for each layer. It is organized by the mathematical build, not as a summary of source sections. The compact suggested file has three light, real-bodied definitions and representative native-carrier milestones/end statements. Heavy interpretation, cohomology and resolution carriers remain mathematical reader targets, as required by the current roadmap shape. No theorem is claimed formalized.

## Stage coverage

| Stage | Build | Nodes | Coverage |
| --- | --- | ---: | --- |
| FG.0 | Uniform arithmetic predicates | 9 | planned |
| FG.1 | Nice presentations and anisotropic test forms | 7 | planned |
| FG.2 | Prime divisors from compact detecting valuations | 8 | planned |
| FG.3 | Anisotropy sets and singleton divisors | 8 | planned |
| FG.4 | Uniform formulas for geometric prime divisors | 8 | planned |
| FG.5 | Definable finite normalizations | 8 | planned |
| FG.6 | Bi-interpretability with arithmetic | 6 | planned |
| FG.7 | Single sentences for finitely generated fields | 4 | planned |

The packet coverage entries list direct proof gaps and the exact supplier stages whose receipts remain to be obtained. Dependencies inherited through an earlier stage remain prerequisites of every later conclusion; a stage's `planned` status never asserts those proofs are complete.

## Mathematical decisions to preserve

- Kronecker dimension is transcendence degree plus one in characteristic zero and just transcendence degree in positive characteristic. The resolution-above-F₂ premise has both birational-resolution and smooth SNC compactification clauses, and occurs only in characteristic two above dimension three. Comparison fields in the final single-sentence theorem have no resolution premise.
- Field generation is `Field.FG`, not ring generation. The QFA transfer therefore first adds total inverse with inverse of zero equal to zero, making field generation into generation in a finite language. Eliminate inverse afterward; finite fields use exact-cardinality field sentences.
- Niceness retains real and dyadic conditions. Its finite-place isotropy formula uses a primitive Hensel witness and derivative inequality, not the existence of a base-field isotropic vector. The real-place condition uses the already owned preordering-extension target and bounded sums of squares.
- Restrict auxiliary detecting valuations to one finite field before applying patch compactness. Do not restrict the compact ambient space to rank one. Coarsening, triviality on the relative constants, and the curve/place dictionary produce the discrete divisor afterward.
- Auxiliary quadratics give degrees at most two and four, with split/repeated-root cases interpreted as fields of degree one. Raw polynomial quotient algebras are not silently fields. In the characteristic-two curve argument the cubic root compositum has degree at most nine.
- Stabilizers start as subsets. The empty-set stabilizer is K; the valuation filter excludes it by properness. All failed parameter tuples give empty fibers. Strict valuation balls include zero explicitly because the library's integer order at zero is zero. The stabilizer of a finite union of these balls uses place approximation, with sufficiently low values at the other places.
- Low-dimensional curve formulas keep both shifted stabilizations, with additive zero 1 and multiplicative unit 2, including 2=0 in characteristic two. The local Hensel scalar must be nonzero: retain 2n outside characteristic two and use n=3 in characteristic two. The printed characteristic-two scalar is recorded as E22 and needs independent confirmation.
- Arithmetic intersections require full geometric flags and a terminal finite place, including the empty geometric flag for number fields. A rank-one divisor with a positive-dimensional residue is not the terminal flag. The integrality-preserving refinement is supplied here from the requested formal-étale comparison and avoidance of finitely many arithmetic primes.
- R_T is a normal finite normalization with fraction field K; it need not equal its geometric counterpart S_T in characteristic zero. All-prolongations integrality may not assume the intersection has the whole base field as fraction field.
- Only the normal-domain instance of the AKNS theorem is needed. Normality repairs the Dedekind-core inference; it is not inferred from one-dimensional finite generation. Evaluation uses ideal membership in a coded tensor algebra, with bounded generators for auxiliary domains and no bound on polynomial degree. Arithmetic codes are taken modulo equal decoding. Both composite interpretation comparison graphs are specified.

## Proof gaps and where to resume

### G-DIM: Published fixed-dimension proof identification

Poonen Theorem 2.3,p.4 identifies Pop 2002 Theorem 1.5(3). The accessible 2001 arXiv v1 has different numbering and only pp.1–5 were inspected. Acquire/collate the final proof and identify the degree-sensitive diagonal-form dimension test. The target is stated, not source-closed.

### G-PO: Elliptic and degree-three inputs to uniform predicates

Poonen §§3–5 and Appendix A were read in full. The remaining external proof leaves are Moret–Bailly’s elliptic constancy theorem used at p.4, the positive-characteristic ordinary elliptic point-count/Albanese-twist inputs at pp.6–10, and the general degree-three C_i and anisotropy descent inputs used in characteristic two. Quadratic Pfister theory does not cover the latter. The generic elliptic/Albanese and all-degree C_i owners must receive exact extension contracts before source closure; no second elliptic geometry foundation is specified here.

### G-RUM: Primary uniform arithmetic and sequence decoding proofs

Rumely 1980 Introduction I–III is identified in the author-uploaded copy and its use is checked against Poonen Theorem 2.2 and AKNS Lemmas 3.7–3.8. The valuation, integer-ring, polynomial-ring and Gödel decoding proofs,especially p.211,are not read in full. AMS PDF access returned HTTP403; the author-copy download link and CiteSeer retrieval did not return a usable PDF during acquisition. Preserve the uniformity and all-fibers contracts when acquiring the primary text.

### G-ALT: Prime-to-two alteration proof leaf

The proof of Proposition 3.4 requires a generically finite regular proper alteration of odd degree over a henselian non-dyadic global DVR,with the model and divisor compatibility used after restriction. The generic alteration target in AdicCoefficientsAndComparisons permits degree divisible by two and is insufficient. Keep the routed PrimeToDegreeAlterations direction as the canonical owner; acquire the ILO/Gabber proof and exact hypothesis package,then add its accepted layer receipt. This missing source contract is not replaced by a resolution axiom in characteristic different from two.

### G-LOW: Surface/norm and adapted-base audit in dimension two

Pop 2017 §§2A–5B pp.2093–2110 was read and the shifted-stabilizer recipe decomposed. Audit the original Kato 1986 Corollary p.145 and prime-index reduced-norm theorem, plus the adapted smooth global-base argument cited by DP Remark4.4. The n=3 characteristic-two branch is required. The recipe’s parameters must retain every nonzero H-subgroup and good-base condition; no black-box conclusion is used as its own premise.

### G-QFA: Arithmetic standardness coding in QFA

AKNS Proposition2.28 and Lemmas2.29–2.30 pp.20–21 were read. Lemma2.29 cites Nies Claim7.15 for its uniform finite-sequence/term coding and standardness argument. Acquire a cleared/public proof or supply a checked independent proof; do not read an uncleared book copy. The total-inverse language bridge in this roadmap is separately explicit and does not discharge that coding lemma.

### G-UPSTREAM: Preordering supplier receipt absent from atlas

RealAlgebraicGeometry current main Layer1 already owns the preordering-extension theorem. Record its current-roadmap reference in upstreamNotes and obtain the accepted atlas receipt on synchronization. This is a dependency-record gap, not new mathematical work or permission to duplicate it.

Do not relabel any of these source audits as completed merely because a theorem statement has a citation. The independent review should check the four newly noted source discrepancies E19–E22 and the concrete repairs before accepting them. These records make no claim of priority or of an exhaustive erratum search.

## Supplier requests and ownership

The following twelve requests are records in this packet; no other roadmap or issue was edited. Their `neededBy` lists identify every direct consumer.

- **LogicAndDefinabilityInNumberTheory:LD.0**: Import actual finite-tuple interpretation domains, definable equivalence relations, relation/function graphs, quotient semantics, homotopy and parametric bi-interpretation with composition/transitivity. Include bounded-degree finite field extensions by structure constants, split polynomial field-factor cases, fraction fields, finite-module algebra codes and arithmetic coding of finite sequences from AKNS Lemmas 2.10–2.26. These are general logic suppliers, not assumptions that field formulas exist. Arithmetic finite-sequence codes must be quotiented by equality of their decoded sequences; no uniqueness of a raw Gödel code is assumed. The bounded extension carrier must allow degrees up to nine for the characteristic-two curve-symbol construction.

- **LogicAndDefinabilityInNumberTheory:LD.1**: Import valuation rings up to equivalence, restriction/prolongation, rank and residue dimension, geometric prime divisors, henselizations and their inclusions under extension/coarsening, the patch valuation-spectrum dictionary, convex-subgroup coarsening, fixed-depth residue interpretation and composition. Import terminal finite residue extensions and all-prolongations compatibility for full flags; the specified-integrality refinement is proved in FG.5 from the A0 étale-specialization contract. Include adapted separating global bases in dimension two. The adapted-base proof-level obligation is G-LOW.

- **tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy**: Use Hasse–Minkowski for global fields and their real/nonarchimedean local fields, including the norm criterion for a two-fold tail, finite-place isotropy bounds, and the number-field four-square bound for sums of squares. No formally-real global cd₂ bound is imported.

- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev**: Use infinitely many primes split completely in a finite separable global number-field extension, avoiding any finite set. Local nonsplit quadratic residues and compatible Frobenius conditions are chosen only after excluding ramified/dyadic/bad places.

- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences**: Use simultaneous weak approximation at finitely many inequivalent global valuations, retaining open norm conditions and prescribed finite orders.

- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles**: Extend the additive strong-approximation target to approximation off ONE chosen finite place: simultaneous finite-place and archimedean open conditions plus integrality at every other finite place. Finite-adèle density alone is not the required statement. Apply to the a₁ norm neighborhoods in Lemma 3.5 and to the Pop curve-symbol construction.

- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-0-function-fields-constant-fields-and-places**: Use one-variable function fields, relative algebraically closed constants and their normal proper curve/place dictionary, including the classification of nontrivial constant-trivial valuations as places.

- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge**: Use normal affine curve models, finite separable residue fields at étale closed points and DVR local rings at height-one points. The arithmetic finite-normalization theorem is supplied separately by A0-extension.

- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields**: Use full fundamental equality and henselization embeddings for finite function-field extensions, including the inseparable comparison, all prolongations and the residue/ramification degree accounting.

- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts**: Use the equivalence of function fields with normal projective curves, the closed-point/local-ring place dictionary, and finite support of principal divisors.

- **AlgebraicModuliForArithmeticGeometry:A0-extension**: Extend the finite generic normalization contract to the formal-étale completion comparison at a chosen rational base point: a finite étale local algebra with separable residue k_ε has completion k_ε[[π₂,…,π_{d−1}]], with compatible embeddings of fraction fields into the ordered iterated Laurent series field. No Hilbert scheme construction is needed.

- **HigherLocalFieldsAndHigherClassFieldTheory:HL.6**: Extend the generic Kato-complex input to the classical regular arithmetic SURFACE Hasse sequence of Kato 1986,Corollary p.145,with invertible prime n=2 or 3 and the ordering-free hypothesis needed by Pop 2017 Theorem 2.1. Supply horizontal and vertical residue compatibility and the degree-three prime-index cyclic-algebra reduced-norm criterion used in Pop §2C. This exact n=3 surface/norm adapter is not implied by the existing mod-two good-model or characteristic-two logarithmic theorem. Coordinate the norm theorem with the generic symbols/Brauer owner; G-LOW records its primary proof audit.

Generic quadratic/Pfister/cohomology inputs use existing Q2.1–Q2.7 and HL.2/HL.6 node IDs; they are not re-planned here. The routed name HigherPfisterForms aliases QuadraticFormInvariantsPartII. A0-extension's finite normalization, all-prolongations and coefficient-descent nodes and R03.3's height-one intersection are reused. Current RealAlgebraicGeometry Layer 1 already owns preordering extension; `upstreamNotes` and G-UPSTREAM preserve its receipt issue without inventing a nonexistent atlas layer.

The reviewed library-coverage file had no entry for this new continuation or LD.0–LD.1. Related curve, quadratic and arithmetic entries were inspected, along with the current upstream roadmaps and current library. Patch compactness, finite prescribed-order place approximation, function-field strong approximation and the sole-pole theorem are existing library inputs. They are baseline citations, not new development targets.

## Restructuring proposals

The first `restructure` entry proposes FunctionalTranscendenceForShimuraVarieties, a model-theory continuation of LogicAndDefinabilityInNumberTheory, aliasing the pending LogicAndDefinabilityPartII name. It preserves all 38 MPT19 routes and all six Tsimerman18 routes, assigning each exactly once to seven proposed stages. The packet contains the full item lists, precise target contracts, corrected published/preprint numbering and supplier boundaries:

1. FT.0: special/weakly-special geometry, CM promotion, definable uniformization and countable families.
2. FT.1: Hilbert families and algebraicity of definable analytic images.
3. FT.2: pure Ax–Schanuel and the Ax–Lindemann consequence.
4. FT.3: fixed-arity jets, weighted compactification, effective group actions and rigidity.
5. FT.4: jet Ax–Schanuel, Schwarzian equations and modular derivative fields.
6. FT.5: uniformized differential loci, differential Ax–Schanuel and derivative recovery.
7. FT.6: mixed Ax–Lindemann with the precise ambient-algebraic maximality hypothesis.

The early o-minimal/counting prefix of LD.6 must be separated from its arithmetic applications, and early mixed foundations from mixed applications, to avoid dependency cycles. Functional transcendence imports the early prefixes and exports to the late applications. There is no FG-to-FT prerequisite. These stage IDs are proposed, not active graph dependencies. The primary functional-transcendence proofs were not read in this run; the proposal preserves the corrected extraction's finite-order rigidity gap and its other exact proof obligations for that design.

The second proposal retains PrimeToDegreeAlterations as the canonical owner of the odd-degree regular proper alteration needed by FG.2. The existing arbitrary-degree alteration target is insufficient. G-ALT remains until that owner supplies a source-checked stage receipt. No resolution hypothesis in odd characteristic is substituted.

## Sources actually read

- Dittmann–Pop: final author version dated 27 April 2023, arXiv:2012.01307v2, full text, including Theorems 1.1–1.3 and their proofs. All packet/reader page locators use author pagination. No collation with the publisher's text is claimed.
- Poonen: author version dated 11 January 2007, main text pp.1–12 and Appendix A pp.13–14. The external elliptic/Albanese and all-degree form inputs remain G-PO.
- AKNS: October 2016 author manuscript, §1.3 pp.6–7, §§2.1–2.9 pp.8–21 and §§3.1–3.2 pp.21–24. Quotient coding, localization, finite-module and tensor-algebra codes, arithmetic rigidity and the injective-code criterion were followed. Nies's cited arithmetic-standardness proof remains G-QFA; no uncleared book copy was used.
- Pop 2017: published publisher PDF, introduction and §§2A–5B through p.2110. The source facts used in the low-dimensional construction were followed through its shifted-ring argument; Kato's original surface proof and the prime-index norm theorem remain G-LOW.
- Pop 2002: 2001 arXiv v1 pp.1–5 only. Its numbering differs from the final publication; G-DIM records the missing collation.
- Rumely 1980: author-uploaded Introduction I–III and its contracts were identified. The full original valuation and arithmetic decoding proofs were not acquired/read; G-RUM records the failed access and the exact required pages.

Public URLs, version dates and SHA-256 identifiers for the five downloaded primary papers are in `sourceVersions`. The paper briefs, inherited corrections and related supplier packets were read as routing/dependency evidence. The reader's reference list is not an assertion that every external proof in those references was audited. No private source files or source passages enter the repository.

Thirteen relevant discrepancies inherited from the DP extraction are retained with attribution; four additional records E19–E22 describe the Gödel-code injection issue, the Dedekind-core inference, the δ-unit translation and the characteristic-two Hensel bound. All are written in own words, with locators, reasons and corrections.

## Validation and next action

The suggested file elaborated through `lean-check` at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369: exit status zero, with only the expected theorem-placeholder warnings. There are no incomplete data definitions. The current-main-only `Place.integers_def` was not used; the carriers were read in the pinned build. Other cited Tau Ceti source files were independently compared with their pinned raw source, and Mathlib's source HEAD matched its pin.

The indexed blueprint validator reports zero errors and zero warnings for 58 nodes, all eight stages planned, seven gaps and twelve requests. The ordinary blueprint check, allowed-file/private-path/JSON intake check, no-incomplete-data check and whitespace check also passed. Structural cross-checks verify 52/52 DP routes, 44/44 retained functional-transcendence routes, reader agreement with all definition APIs/tests and at most six planets per stage.

Next action is independent review of this complete planning pass. Proof-audit and supplier-receipt work stays explicit in coverage; accepted open stages produce follow-up jobs under PROTOCOL section 0. The orchestrator must decide the functional-transcendence split and assign the alteration receipt. No scratch file is needed to resume: all mathematical work, precise open obligations, item assignments and source identities are in the five deliverables.
