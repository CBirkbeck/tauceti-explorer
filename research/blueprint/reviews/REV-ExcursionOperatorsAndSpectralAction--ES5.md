# Independent review: ES5 and ES6

Reviewer: Codex, session `codex-6JYKsM`, 2026-10-07. Job `REV-ExcursionOperatorsAndSpectralAction--ES5`, issue #404. The input was written by session `codex-dJ6mRX`; this reviewer did not author it.

Verdict: **needs_changes**. This review is finished, rather than a checkpoint. Clear corrections are applied to the packet and suggested file. Two torus nodes remain unverifiable, and the purported arbitrary-field connected-centre cover has been removed. The reader still contains that false cover because it is an input, not an editable deliverable of #404. A revision must synchronize it and supply a correct plan for the missing target.

## Counts and coverage

The reviewed artifact has 21 nodes: 2 definitions, 2 constructions, 16 theorems and 1 comparison. The verdicts are 8 verified, 11 corrected and 2 unverifiable. No nodes were added or deleted. There are 31 node-source excerpts, 22 API entries, 12 named planned tests, 13 planets, 20 baseline entries, 16 requests and 11 gaps. Before review there were 19 baseline entries, 13 requests, 8 gaps and 3 source issues; afterward there are 5 independently confirmed source issues.

ES5, ES6 and ES6:duality remain planned at target level, with precise supplier gaps. ES6:functoriality is partial: its conditional p-adic comparison does not realize the arbitrary-local-field disconnected-centre target. The packet status is consequently partial. At 21 nodes it cannot retain complete while a stage is partial under protocol §0. Existing requests and honest prototype omissions alone are not reasons to reject a plan. The verdict concerns the specific unverified torus proof and the false general-field route, rather than asking this review to formalize geometry or close all owners' requests.

## Sources and scope of verification

All 31 node excerpts match the identified PDFs after whitespace normalization. Statements and complete cited proofs were read independently, including their coefficients and field ranges. The recorded SHA-256 values were reproduced. Page numbers below refer to the cited manuscript, not Astérisque pagination.

- [Fargues–Scholze, author manuscript](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), 356 pages: II.2.1–II.2.4, VI.12.1, VII.7.1–VII.7.10, VIII.3.5–VIII.3.8 and VIII.4, IX.0–IX.2, IX.4–IX.6, IX.7.1 and IX.7.3, including the proofs used here.
- [Fargues–Scholze, arXiv v4](https://arxiv.org/pdf/2102.13459v4): separately collated VIII.3.8 and IX.6, and each of the five source-issue passages. Author pages 276, 331 and 333 were also visually inspected.
- [Lafforgue, arXiv v10](https://arxiv.org/pdf/1209.5352v10), Proposition 11.7 and Lemmas 11.9–11.10, pp. 143–147: finite anchors, multiplicativity and continuity. Its characteristic-zero Reynolds argument is not evidence for modular coefficients.
- [Kaletha, arXiv v2](https://arxiv.org/pdf/1502.00650v2), §5.1, pp. 16–20: Definition 5.1, Proposition 5.2, Corollary 5.3 and Facts 5.4–5.9, including common refinements and the representation-extension paragraph. These are p-adic statements; that paragraph uses complex characters.
- [Fargues, author Abel–Jacobi manuscript](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), §2.3 and Proposition 2.16, Propositions 3.1–3.3, and §5.2: the torsor descent and inverse-character/Artin conventions, including the equal-characteristic geometry.

The [SMF publication page](https://smf.emath.fr/publications/geometrisation-de-la-correspondance-de-langlands-locale) and its [public ten-page sample](https://smf.emath.fr/sites/default/files/2026-07/AST-466-web__sample.pdf) were examined. None of the disputed passages is in that sample. The full published edition was not read; the source-issue verdicts apply only to the author manuscript and arXiv v4. A correction search on [Scholze's papers page](https://people.mpim-bonn.mpg.de/scholze/papers.html), [Fargues' publications page](https://webusers.imj-prg.fr/~laurent.fargues/Publications.html), the arXiv record and SMF page found no linked correction for those passages on 2026-10-07.

The independently checked PDF hashes are:

- FS-geometrization: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
- Lafforgue-2018: `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.
- Kaletha-2018: `067aa7999a96980da07ebf90ab5cf7b30819a34235460c0818ad6d96dae2cfb3`.
- Fargues-AbelJacobi: `35c7268fd6ce086f1267a00c18e02900c87ed5da65781d3b8695644d6e8fef73`.
- FS arXiv v4: `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027`.

Vignéras II.2.8 remains a precisely identified supplier request, not a proof read for this review. Upstream AdicSpaces and InductionRestriction were read as density/convention models, and ClassFieldTheory layer 9 was checked for its arithmetic normalization and limited equal-characteristic range.

## Reasons requiring revision

### Torus operators over general coefficients

The statement of `torus-two-leg-calculation` is field-valued. It cannot establish equality of centre operators for general eligible Lambda. For example, in `F_ell[epsilon]/(epsilon^2)`, every map to an algebraically closed field kills epsilon, whereas multiplication by epsilon on the regular module is nonzero. Matching every scalar character therefore does not detect the required integral operator.

The necessary strengthening is a kernel calculation on the regular smooth modules `Lambda[E×/K]`, for each compact open pro-p K and every degree stratum. It must identify the two-leg operator with translation by the element attached to `rec_geom^-1(gamma1 gamma2^-1)`, naturally in Lambda and compatibly with K-refinement. Regular-module faithfulness then identifies each completed group-algebra coordinate. The reviewed sketch had not proved that calculation. It is now explicitly a gap, and the diagonal node's proof no longer infers integral equality from scalar values.

The sign must be computed through the actual Hecke source/target endpoint actions and character-sheaf descent. Fargues' propositions give the inverse-character convention, but do not by themselves establish this adapter for the stated kernel. Geometric reciprocity is arithmetic Artin **precomposed with pointwise inversion**; it is not the inverse function of the arithmetic Artin map. The normalization wording was corrected. Neither the manuscript's brief assertion nor the algebraic suggested signature settles the endpoint sign. Both torus nodes are marked unverifiable with these exact obligations.

### Disconnected centres and field range

A standard surjective z-extension has induced-torus kernel and simply connected derived group; its centre need not be connected. A connected-centre surjective central-torus cover of SL2 in characteristic zero cannot exist: its derived group would map by a central isogeny onto the simply connected SL2, hence isomorphically. The nontrivial central mu2 in that derived group is central in the cover and maps nontrivially to SL2. But a connected centre maps trivially into the finite centre mu2 of SL2, a contradiction. Already SL2 times G_m has the disconnected centre mu2 times G_m.

Thus the reader's requested connected-centre surjective cover is a false interface, even if described as a gap. Foundational RG2.6 z-extensions cannot satisfy it. The corrected comparison states the actual conditional p-adic injective z-embedding result, requiring smooth character extensions also on common refinements. A source-backed all-field disconnected-centre route is still to be identified. For equal characteristic, cohomology of nonsmooth centres must be specified; p-adic finiteness of centre H1 cannot be transferred blindly (mu_p is a basic warning case).

## Per-node check

Node suffixes below retain their full ES5/ES6 parent in the packet's checked ledger. A verified or corrected target with an honest owner gap is a conditional plan, not a claim of source-verified closure.

| Node | Verdict | Check or correction |
|---|---|---|
| `schur-irreducible-object` | verified | Condensed scalar unit is the defining isomorphism; five API entries and three negative/positive tests distinguish it from an abstract ring isomorphism. |
| `condensed-schur-from-admissibility` | corrected | Added direct SR.2, VS4 and condensed-enrichment supplier dependencies; all-coefficient admissibility and noncompact enrichment remain explicitly requested. |
| `excursion-character-of-a-schur-object` | verified | Checked the fixed-vector/enrichment direct prerequisite and scalar-unit inversion, which preserves the two ordered finite-leg relations. |
| `abstract-semisimple-parameter` | corrected | Replaced the Bun_G compact action prerequisite by abstract LP2 action/presentation; requested the missing arbitrary-discrete-W classifier variant explicitly. |
| `parameter-of-a-schur-irreducible-sheaf` | verified | IX.4.1 and VIII.3.8 supply the stated local continuous closed-orbit parameter, conditional on the exact LP2 interface; no characteristic-zero Reynolds transfer. |
| `parameter-of-an-irreducible-smooth-representation` | corrected | Added centre-independence and the requested VS4 adjunction as direct prerequisites; noncompact smooth representations are not assumed compact. |
| `stratum-centre-embedding-independence` | corrected | Added LP2 uniqueness and VS4 enriched stratum comparison as direct prerequisites; independence is of eligible extensions through the central action. |
| `invariance-and-coefficient-transport` | corrected | Coefficient transport retains the Schur and base-change hypotheses; the suggested algebraic fragment now uses an actual coefficient-field extension square. |
| `coefficient-policy-for-the-functorial-diagrams` | verified | Excursion relations have general coefficients; the spectral map retains the component-order hypothesis from ES1. No categorical prime hypothesis is inserted into scalar reconstruction. |
| `isogenies` | verified | IX.6.1 proof and adjoint-isomorphism/Satake suppliers checked; the stronger HS4 kernel comparison remains an explicit request. |
| `products` | corrected | Corrected source-finding reference to E2; IX.6.2 uses both distinct factors and compact exterior generators, without claiming the tensor map exhausts the centre. |
| `weil-restriction` | corrected | Replaced abelian Shapiro as proof input by the existing subgroup freeness instance, retaining finite-index finite generation; nonabelian stack/coinduction proof is planned locally. |
| `tori-spectral-center` | corrected | Added RG2.5 and BG1 supplier request dependencies. Completed quotient group algebras allow infinite T(E)/K; full equal-characteristic reciprocity remains requested. |
| `torus-two-leg-calculation` | unverifiable | Corrected geometric Artin normalization to arithmetic Artin precomposed with inversion. The actual Hecke endpoint sign and the universal-coefficient regular-module operator identity have not been established. |
| `tori-diagonal-embedding` | unverifiable | Replaced invalid scalar-to-integral inference by the required regular-module operator/generator proof and recorded its gap. This essential calculation remains unverified; the suggested fragment does not discharge it. |
| `central-characters-and-twisting` | verified | Connected-centre factorization follows the torus and adjoint-isomorphism diagrams; general induced-torus/resolution inputs are explicitly requested. |
| `twisting-by-abelianized-characters` | verified | IX.6.5 twisting proof uses the normalized torus action and mixed Satake compatibility; scalar twisting does not assert a disconnected centre is a torus. |
| `z-embedding` | verified | Kaletha Definition 5.1 and Corollary 5.3 provide the p-adic injective construction with induced quotient and H1 comparison; modular character extension is separately requested. |
| `z-embedding-central-character-comparison` | corrected | Removed the unsupported connected-centre surjective cover and restricted the theorem to the conditional p-adic injective comparison. An all-field target is explicitly left open. |
| `bernstein-zelevinsky-duals` | corrected | Added VS5 stage dependency and precise lisse/general-coefficient BZ request; checked the full IX.5.3 proof and its enhanced-centre domain. |
| `smooth-duals` | corrected | Added VS5 lisse dependency and all-coefficient duality/admissibility request. The IX.2 all-Hecke argument and late ES7 parabolic return are explicit, with no reverse dependency from ES6 functoriality. |

## Baseline declarations

Every entry was checked by reading its declaration at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, rather than using a name search as evidence. The exact source modules are recorded in the packet.

| Declaration | Actual supply and limitation |
|---|---|
| Representation | A monoid homomorphism to linear endomorphisms over a semiring/module; no smoothness or Schur theorem. |
| Representation.IntertwiningMap | Equivariant linear maps; representation endomorphisms rather than all linear endomorphisms. |
| MonoidHom | Bundled homomorphisms; prescribed Weil projection and continuity are additional inputs. |
| AlgHom | Algebra homomorphisms with their scalar compatibility. |
| Condensed | Sheaves on the coherent topology of CompHaus; no animated/lisse enhancement. |
| AlgCat | Associative R-algebras with Ring carriers; appropriate categorical algebra values. |
| CategoryTheory.IsIso | Invertibility of a specified morphism, which is the scalar unit here. |
| CategoryTheory.CatCenter | Natural endomorphisms of the ordinary identity functor; enhanced comparison remains ES0-owned. |
| Module.End | Linear endomorphism ring; equivariance remains essential. |
| CategoryTheory.Adjunction | Ordinary unit/counit triangle identities; the enriched stratum adjunction is not already built. |
| TensorProduct | Algebraic tensor product, declared in LinearAlgebra/TensorProduct/Defs.lean. Corrected the original Basic.lean locator to the declaration's module. |
| MonoidAlgebra | Finitely supported coefficients on an arbitrary monoid/group; quotient group finiteness is not required. |
| Subgroup | Bundled subgroup with the inherited group structure. |
| IsFreeGroup | Existence of a free-group basis; not by itself the subgroup theorem. |
| Subgroup.fg_of_index_ne_zero | Instance requiring a finitely generated ambient group and a finite-index subgroup; gives subgroup finite generation. |
| subgroupIsFreeOfIsFree | Newly recorded pinned Nielsen–Schreier instance: every subgroup of a free group is free. Together with finite generation it supplies IX.6.3's free finite-index subgroup. |
| groupCohomology.coindIso | Shapiro for abelian cohomology of representations over a commutative ring. Removed from the nonabelian node's proof prerequisites; retained only as an explicitly labelled contrast in metadata. |
| TauCeti.IsSmoothDiscrete | Discrete module topology and open stabilizers on a TopRep carrier. |
| TauCeti.SmoothDiscreteTopRep | The corresponding full subcategory; no derived enhancement or Bernstein centre theorem. |
| TauCeti.ClassFieldTheory.Formation | Smooth discrete integral coefficient infrastructure for a class formation; no local Artin isomorphism. |

No baseline declaration was invented and no built result was re-planned as a new node. The reviewed library audit marks these excursion stages not built. The existing free-subgroup and finite-index results replace local planning of those facts.

## Supplier and request audit

The relevant ES0, ES1, ES4, ES7, LP0/LP2, GS4, HS1/HS4, BG0/BG1, RF3 and VS4/VS5 node statements, and the SR/RG/upstream layer statements, were read. Exact prerequisite links were added wherever a requested interface was otherwise only mentioned in prose. No proposed stage was presented as already existing.

The 16 requests have the following dispositions (numbers are packet order):

1. SR.0: the actual arbitrary-coefficient smooth carrier and scalar/central-character conventions; an owner refinement.
2. SR.2 → proposed SR.3b after SR.2: all-coefficient irreducible admissibility and smooth character extension/duality dictionary. Complex SR.3/SR.3a and downstream SR.6 are not suppliers.
3. VS4: the enriched relative-homology left adjoint, invertible unit, noncompact mapping-object and eligible right-extension comparison; the existing stratum/compact-generation result is narrower.
4. HS1 condensed-enrichment: fixed-vector evaluation into relatively discrete coefficient algebras; the existing general enrichment statement needs this explicit interface.
5. LP2 local character-bijection: the two ordered finite-leg relations, projection and modular continuity proof. Lafforgue's characteristic-zero argument is insufficient for that last clause.
6. HS4 geometric comparisons: full pre-evaluation pi_H-sharp kernel and common-leg/wild-subgroup diagrams, rather than only the resulting centre conclusions.
7. VS5 exterior products: VII.7.10 compact A_i/arbitrary B_i Hom comparison at the stated enrichment and coefficients.
8. SR.1: arbitrary-coefficient abelian Bernstein centre and pro-p corners; the existing complex Bernstein blocks are narrower.
9. RG2.5 → proposed RG2.6: induced-torus resolutions, surjective z-extensions and compatible pi1/dual maps. Explicitly does not replace injective z-embeddings or provide a connected-centre cover.
10. BG1: all torus degree components and maps compatible with abelianization and stratum dictionaries.
11. Upstream ClassFieldTheory layer 9 → Part II: consume its arithmetic normalization/topological abelianization within its proven range, request full equal-characteristic wild reciprocity separately.
12. RF3 → Part II: Lubin–Tate cover/torsor and endpoint actions; the existing line-bundle sign is narrower.
13. RG2.5 refinement for the p-adic injective construction: diagonalizable centres, pushout and cohomological interfaces; replace the false all-field cover request with the precise unresolved comparison.
14. New LP2 abstract action request: VIII.4.1 for arbitrary discrete W and the coherent Rep(Q^I)-linear monoidal family. ES0's finite-wild compact Bun_G action is narrower.
15. New LP2 discrete classifier request: VIII.4.3's arbitrary-W version, prescribed projection and closed-orbit uniqueness; the current condensed local-Weil node is narrower.
16. New VS5 request: VII.7.4–VII.7.7 lisse BZ duality for general eligible Lambda, domain/extension, enriched mapping objects and enhanced-centre involution. Existing VS5 states the étale compact result. Coordinate with the already recorded ES0 review request.

Target-level granularity was retained: no proof was split into lemma nodes merely to increase density. The new gaps identify three exact interfaces rather than duplicate supplier mathematics locally.

## APIs, planned tests and suggested file

All 21 suggested names and 22 API names occur in the Lean file. Each of the four definition/construction nodes has three named tests. Schur tests check the identity, zero-target rejection and failure on a nontrivial test object; scalar-character tests check unit, inverse-pair compatibility and variable order; representation tests check the basepoint, centre independence and trivial group; z-embedding tests check identity, product and central-lifting failure. Their algebraic fragments were read. The inverse-pair example assumes its relation; it is not evidence that geometric excursion relations have been implemented.

The definition APIs cover the scalar inverse/section criterion, character algebra structure and naturality, assignment/isomorphism/embedding comparisons, and rational-point z-embedding factorization and uniqueness. Generic construction/extensionality is supplied by IsIso, AlgHom and the explicit bundles. The geometry/enrichment omission ledger is allowed by protocol §13, and every node remains implementationStatus unchecked.

Two prototype signatures were strengthened. Coefficient transport now relates different coefficient fields through a commuting ring-homomorphism square. Diagonal propagation now assumes equality on algebra generators and generation of the algebra, rather than assuming the entire conclusion pointwise. An additional example records preservation of a nonzero square-zero element. Neither fragment claims the actual completed group-algebra operator calculation.

There are 13 source-based planets and at most six in any stage. No planet was added or renamed; they name the central definitions and named comparisons at the required level.

## Confirmed source issues

The original E2–E4 are confirmed in author/v4 p. 331: the second product's repeated first-group label, the factors' Bun labels, and the reversed prose direction of the group map. They are independent harmless display/prose slips; the surrounding domains and diagrams determine the corrections. The product acceptance reference was fixed from nonexistent E1 to E2.

Added E5 records the IX.6 closing paragraph's z-extension terminology at p. 333: its cited Kaletha construction is an injective z-embedding. This correction concerns nomenclature; the blueprint's all-field inference is a separate gap. Added E6 records VII.7.10's exterior-product clause at p. 276: its compact lisse inputs and preceding functor require a lisse target, while the clause retains the étale label from the parallel torsion formulation. Both are independently confirmed in author/v4. No conclusion is asserted about the full published passages.

## Red-team obligations

Confirmed RT-AREA-geomlanglands/7: exact ES1 spectral-map prerequisites occur in both ES6 children. Centre-order conditions and excursion variants are preserved. The late ES7 duality return does not create a dependency cycle. ES2/ES4/ES7 edits remain outside this review's paths.

Confirmed /8: the admissibility request is upstream at SR.3b after SR.2; SR.6 is not imported backwards. Qbar_ell is uncountable and Fbar_ell is countable. Condensed Schur requires its own fixed-vector argument. The reader has this routing, though the new direct prerequisites must be synchronized.

Confirmed /10: foundational surjective z-extensions and induced-torus resolutions go to proposed RG2.6, while injective z-embeddings remain ES6-owned with Kaletha's citation. The reader's subsequent general-field cover undoes that distinction and must be removed. BG2/ET0 consumers and new RG layers require separate orchestrator routing. Confirmed /9, encountered through torus dependencies, correctly puts the arbitrary-coefficient abelian centre in SR.1.

## Revision and orchestrator handoff

Authorize the next revision's reader path as well as packet and suggested file. Synchronize these exact places:

- The abstract scalar-parameter section: replace the ES0 compact-action input by the two requested abstract LP2 variants and add their presentation link.
- Direct-prerequisite lists for condensed Schur, the representation assignment, centre independence, torus centre/diagonal, Weil restriction and both duality nodes: copy the corrected packet links.
- The normalized two-leg and diagonal sections: copy the pointwise Artin inversion convention and replace scalar-to-integral inference with the regular-module operator obligation and sign verification.
- The disconnected-centre comparison section, proof step 5, Gap 7 and Request 13: remove the connected-centre surjective cover; state the conditional p-adic comparison and the genuinely unidentified all-field route.
- The reader's gap/request ledgers: add the three new gaps and three new requests; incorporate E5/E6 in the source-issue record and its version scope.
- The opening/closing coverage claims: set ES6:functoriality and packet status partial and preserve the precise remaining targets. The final sentence presently says all four stages are planned.
- The prototype discussion: describe the actual coefficient-field extension square, generator propagation and nilpotent example.

The next revision must either provide a source-backed non-routine torus operator/sign plan and a valid all-field disconnected-centre target node, or explicitly leave the affected targets partial with exact remaining work. It must not restore complete merely to pass a checker or request the impossible cover from RG2.6. Supplier extensions should be routed to their existing owners, and the ES0/VS5 lisse requests should be consolidated. No changes to the live atlas, upstream roadmaps or other jobs were made.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES5.json`: 0 errors, 0 warnings. The shared source-issue and source-version validators also report 0 errors. Name correspondence and review coverage are complete. `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES5.lean` exited 0 at the pinned Mathlib build, with only declarations-using-sorry warnings; available memory was 108 GB before the run. The file imports only Mathlib, so the shared Tau Ceti checkout's newer HEAD does not affect elaboration. Tau Ceti baseline declarations were read separately at the exact recorded pin. Compilation establishes the suggested signatures' consistency, not the omitted geometry.
