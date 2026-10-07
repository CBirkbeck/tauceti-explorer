# REV-SchemeKTheoryOperations — independent review

Verdict: **needs_changes**. Completed by Codex, session `codex-yWbVuV`, on 7 October 2026 for issue #484. This is a finished independent review, not a checkpoint. This session did not write the input plan.

The review covers the packet and suggested Lean file for S.1–S.7 at target granularity. I read every node’s statement, hypotheses, proof steps, prerequisites, uses, API and acceptance cases; checked every source locator/excerpt against the public text and its proof context; read every inherited baseline declaration at the exact pins; checked supplier statements, the library audit, RS-18 and all eight assigned red-team findings. The packet has been corrected where the repair is clear. Twelve additional proof bridges remain unestablished, and the reader still contains claims contradicted by those corrections. Its path is outside this review issue’s editable deliverables, so this PR leaves it for a revision job.

## Counts and scope

| Item | Result |
|---|---|
| Nodes | 282; 218 verified, 52 corrected, 12 unverifiable; none added or removed |
| Source citations | 619 locator/excerpt pairs checked in context |
| API / tests | 451 API specifications; 287 test specifications |
| Checker subset | 437 API items and 278 tests on the kinds it counts; applications and comparison cases explain the difference |
| Baseline | 133 inherited declarations confirmed; two `provides` descriptions repaired; one class added, total 134; none removed |
| Gaps / requests | 42 inherited gaps plus 12 new gaps = 54; 34 owner requests retained |
| Planets | 40, reviewed as definitions, central constructions or named theorems |
| Source issues | 31 inherited: 29 confirmed, E4/E5 rejected; 10 added, confirmed; 41 total (39 confirmed, two rejected) |
| Coverage | Seven planned stages, zero closed; packet status `complete` retained as one pass under the 300-node budget |

A verified node is source-supported within its stated scope; it does not certify its suppliers are implemented. The packet’s per-node `review.checked` entries give the verdict and source contexts for all 282 nodes. `implementationStatus` remains `unchecked` throughout. The seven planned stages enumerate targets and now include the new gap titles in `remaining`; none is upgraded to proof-closed. Existing honest gaps alone are not grounds for rejection under the issue instructions.

## Clear corrections

The following ledger records every node changed by the review, including changes confined to its proof, API, tests or source match. Its full corrected contract is in the packet and the suggested file’s review comments. All three added regressions are acceptance specifications, not executed tests.

| Node within its stage | Change and reason |
|---|---|
| `S.1/strictly-perfect-complex` | Corrected the global TT/Stacks convention conflation, the empty-scheme counterexample, and added the O(1) regression. |
| `S.1/perfect-derived-tensor` | Added the global Tor bound for the bounded mixed tensor assertion, with a disjoint-union counterexample. |
| `S.1/coherator` | Reversed the erroneous adjunction in the proof and reconciled the noetherian unbounded comparison with Stacks 09T4. |
| `S.1/perfect-complicial-waldhausen-category` | Corrected the essential image and comparison API on non-quasi-compact schemes; TT 3.1 imposes a global Tor bound. |
| `S.1/perfect-frobenius-pair` | Qualified the contractibility regression by nonemptiness, matching its native Lean hypothesis. |
| `S.2/k-theory-model-invariance` | Recorded TT 3.5’s non-quasi-compact extension with its globally finite Tor-amplitude convention. |
| `S.2/k-theory-proper-pushforward` | Corrected the arbitrary-base flat-proper variant to require finite presentation; recorded a finite flat closed-immersion counterexample to TT 3.16.6 as printed. |
| `S.2/affine-pullback-is-scalar-extension` | Separated flat underived tensor from the finite-Tor derived functor; added the ℤ/2 exactness check. |
| `S.2/cartan-equivalence` | Distinguished TT’s nonnoetherian pseudo-coherent G-model from the noetherian coherent-sheaf model. |
| `S.3/perfect-complexes-with-support` | Qualified the model comparison by qcqs, retaining the derived support definition on arbitrary schemes. |
| `S.3/killing-morphisms-into-supported` | The cellular construction uses arbitrary coproducts, not finite sums. The passage from a compact source mapping to an object of Loc(G) to a factorisation through Thick(G) needs the compact-factorisation theorem, with its finite-cell argument. EnhancedDerivedSheaves E1 presentability alone is not that theorem. Stacks 0A9C gives the asserted killing result directly; its pseudo-coherent branch does not make the cone Q perfect. |
| `S.3/affine-support-comparison` | Separated the connective Waldhausen support theory from its nonconnective extension. |
| `S.3/divisor-support-comparison` | Added the qcqs hypothesis used by its supported comparisons. |
| `S.3/coherent-sheaves-with-support` | Made the noetherian ambient hypothesis explicit in the pushforward API and Lean signature, so the closed immersion has a finitely generated ideal. |
| `S.3/g-theory-localisation` | Completed the module-action route for schemes lacking vector-bundle comparison. |
| `S.3/regular-support-devissage` | Added characteristic different from 2 to the nodal negative-K counterexample. |
| `S.3/unit-loop-class` | Corrected the additive/multiplicative type synonym in the constructor API; the source map is a homomorphism from multiplicative units to additive K₁. |
| `S.3/algebraically-closed-injectivity` | Retained the packet’s necessary A≠0 hypothesis and corrected its source-match claim; recorded the missing printed hypothesis as E41. |
| `S.3/one-dimensional-localisation-sequence` | Excluded isolated closed generic points from the codimension-one support category. |
| `S.3/arithmetic-surface-localisation` | Added the arithmetic-model hypotheses needed for curve fibres; corrected the claim that an infinite sum of finite residue-field unit groups is finite. |
| `S.4/zariski-mayer-vietoris` | Corrected the support in the localisation proof: take T = W minus U, then fibre support T ∩ Z. The old V minus T equality was false. |
| `S.4/mayer-vietoris-property` | Corrected the constant-presheaf regression: square excision holds, empty normalisation fails. Added empty normalisation to the Nisnevich API. |
| `S.4/brown-gersten-vanishing` | Corrected the restriction carrying the Mayer–Vietoris boundary and the containment after shrinking V; equality with W is unnecessary. |
| `S.4/nisnevich-cohomological-dimension` | Made the finite-dimensional hypothesis of TT E.6(d) explicit. |
| `S.4/k-coniveau-spectral-sequence` | Restricted the supported first-page sum to x in Y; the full-support edge API still concerns Y = X. |
| `S.4/g-coniveau-spectral-sequence` | The finite-dimensional exact couple and convergence are justified. The extra arbitrary-dimensional convergence and proper codimension shift require H.6 completeness/derived-limit conditions and a filtered coherent pushforward with a support-dimension estimate. Fibre dimension alone does not supply a codimension estimate on arbitrary nonequidimensional schemes. The nonreduced generic-edge API uses Artinian dévissage from the existing quotient-decomposition node, rather than residue-field tensor. |
| `S.4/coniveau-chow-group` | Specified the codimension-graded convention and the pure-dimensional scope of the Fulton comparison. |
| `S.4/one-dimensional-coniveau` | Excluded isolated closed generic points from the codimension-one support category. |
| `S.4/quillen-presentation-lemma` | Made explicit r ≥ 1 and the constant-rank hypothesis used by Quillen’s proof. The replacement of primes by containing maximal ideals is valid because the smooth locus is open; retained it after checking the source. Added a pinned local standard-smooth relative-dimension contract to the native signature and excluded r = 0; global Krull dimension alone does not express constant relative dimension. |
| `S.4/quillen-effacement` | Corrected the retraction: its ideal is the kernel of multiplication R ⊗_A B → B, not (t ⊗ 1). Read Quillen’s printed p.126 argument. |
| `S.4/gersten-power-series` | The source uses a Weierstrass coordinate change, not necessarily a linear change of variables. Over a finite field, a homogeneous polynomial can vanish on every field-rational direction. Supply the formal triangular coordinate substitution or a transfer argument, with the finiteness and principal-kernel checks; the theorem itself remains source-supported. |
| `S.4/mixed-char-higher-effacement` | The printed proof’s single-DVR reduction requires πR prime. Supply the componentwise semilocal localisation for the full smooth scope. Factorwise zero maps on homotopy groups do not automatically assemble into a nullhomotopy of a filtered-colimit spectrum: a compatible categorical nullhomotopy is required for the stated strengthening. The source asserts that strengthening; its provided colimit argument alone does not establish it. |
| `S.5/graded-quillen-lemma` | The generated-in-degrees filtration F_m is not an exact functor on Mgr(S). For S = k[x], applying F₀ to 0 → S(−1) →ˣ S → k → 0 gives 0 → 0 → S → k → 0, which is not exact. The proof’s invocation of admissible-filtration additivity is therefore unjustified. Supply the correct resolving-category/filtered-module argument for β-surjectivity; the theorem is not withdrawn. K-book Ex. V.3.3 contains only a hint, not this missing exactness theorem. |
| `S.5/g-theory-homotopy-invariance` | Corrected the separated affine-cover induction: a union intersected with one affine need not be affine. |
| `S.5/negative-k-vanishing-regular` | Added characteristic different from 2 to the nodal negative-K counterexample. |
| `S.5/projective-bundle-cohomology` | Used properness for coherence, rather than qc separatedness alone. |
| `S.5/bass-fundamental-theorem` | Retained supports in the Bass contraction formula. |
| `S.5/affine-fundamental-theorem-comparison` | Retained the universal boundary sign in the splitting h_T, consistent with the preceding node. |
| `S.5/blowup-exceptional-divisor-tests` | Added local dimension two; global Krull dimension two alone allows lower-dimensional components. |
| `S.6/support-product-pairings` | Removed the false universal nonunit claim and added a clopen-component regression. |
| `S.6/external-product` | Added the qcqs condition on the fibre product required by the supported model and descent comparisons. |
| `S.6/non-unital-gamma-filtration` | Added the square-zero hypothesis to the grading assertion, matching the proof and native Lean form. |
| `S.6/adams-eigenvalue-on-gamma-graded` | Added the positive operation index and recorded the known printed λ-sign correction separately. |
| `S.6/kratzer-low-gamma` | Removed the false claim that γ^k vanishes on SK₁. It is its image under the λ-compatible determinant quotient that vanishes. |
| `S.6/soule-gamma-bound` | Distinguished the integral operation-generated ″F bound from the rational full-filtration bound. Theorem 1(ii) does not prove the full coefficient-filtration bound integrally; Soulé §1.6 supplies comparison modulo torsion. |
| `S.6/affine-weight-decomposition` | Added k ≥ 2 for distinct rational eigenvalues and used Soulé’s ″F filtration in the integral proof, with full F only rationally. |
| `S.6/simplicial-sheaf-hypercohomology` | H.6’s spectrum spectral sequence does not construct the asserted general pointed-sheaf spectral sequence or its nonabelian fringe. Specify the support cofiber representing the homotopy fibre, and import the unstable model-category and Brown results with convergence hypotheses. The infinite-loop specialisation remains justified by S.4. |
| `S.6/soule-scheme-operations` | Construct the global sheaf-level additivity homotopies and stable-representation-to-operation map. For the GS99 alternative, define K-coherence and prove it for the regular finite-dimensional scheme and its support cofiber (GS99 Proposition 5 and §3.2.4), importing uniform finite-rank stability. Stalkwise comparisons alone do not prove equality of global homotopy classes or the global product comparison. |
| `S.6/scheme-weight-decomposition` | The source’s integral F² decomposition is supported (Soulé Proposition 5), but GS99 Proposition 8 states the rational decomposition for K-coherent spaces with a cohomological-dimension bound. Establish the supported comparison and sharp d-bound, or widen the range using the support-cofiber bound. Also prove the weighted λ-module filtration argument; operationwise bounds and stalkwise Kratzer identities alone do not establish the asserted global filtration bounds. |
| `S.6/finite-coefficient-weight-decomposition` | The proof establishes additivity only for m ≥ 2 but claims an eigenspace decomposition also for m = 1. Supply additivity for the Moore-space degree-one group, then the Bockstein argument. Commutation of Adams operations alone does not identify eigenspaces for different primitive roots; prove their common weight action on the primary blocks. This is a packet deduction, not a theorem quoted in the cited passage. |
| `S.6/riemann-roch-without-denominators` | Corrected the deformation space to the open deformation-to-normal-cone space and replaced the false λ-series identity by its unitised coefficient formula. |
| `S.7/chern-character` | Added finite Krull dimension to the broadened statement, matching its hypotheses and direct-sum Chow target. The regular separated resolution-property route is already supplied; no missing-RP allegation remains. |
| `S.7/chern-class-of-subvariety` | Generic smoothness is false over imperfect fields. Regularity of the ambient local ring gives a regular immersion near the generic point, but an equality on that open does not alone prove the global vanishing of lower Chern classes. Supply SF.5’s supported Chow localisation argument, controlling the complement inside Z and the lower-degree supported classes, before the Koszul/Newton calculation. |
| `S.7/gamma-chow-comparison` | Replaced the ill-typed equality of a Chow Chern class and a K-theoretic gamma operation with the Newton/Chern-character comparison. |
| `S.7/grothendieck-riemann-roch` | Borel–Serre works throughout over an algebraically closed field. The packet states arbitrary k while saying it does not extend SF.5’s source scope. Supply a public primary source proving the arbitrary-field version, or a field-extension/descent argument for Chow classes and K-pushforward; otherwise restrict this node to the cited algebraically closed scope. |
| `S.7/g-theory-adams-operations` | Corrected the smooth API’s missing base-dimension factor and confusion of Cartan duality with σ; typed the inverse in the associated-graded formula and fixed the increasing-filtration quotient. |
| `S.7/self-intersection-formula` | Corrected the Cartesian-square specialisation to X prime = Y, as in Thomason (3.1.4). |
| `S.1/enhanced-perf-truncation` | Corrected the source locator and replaced the placeholder excerpt by the actual erroneous assertion; local representatives and the extra core degree are explicit. |
| `S.6/gillet-soule-strict-support-comparison` | Corrected the Li–Liu application locator and distinguished it from the general supplier theorem. |
| `S.6/supported-codimension-filtration` | Corrected the Li–Liu application locator and distinguished it from the general supplier theorem. |
| `S.6/rational-supported-filtration-product` | Corrected the Li–Liu application locator and distinguished it from the general supplier theorem. |
| `S.7/supported-cycle-to-k-zero` | Corrected the Li–Liu application locator and distinguished it from the general supplier theorem. |
| `S.7/supported-chow-k-zero-comparison` | Corrected the Li–Liu application locator and distinguished it from the general supplier theorem. |
| `S.7/dimension-one-supported-g-cycle-comparison` | The proof via GS87 Theorem 8.2 applies to a pure-dimensional catenary ambient scheme, using dimension plus codimension equals d. The first assertion has broader regular separated finite-dimensional scope. Supply an independent dimension-filtration argument for that broader scope, or restrict it to the source hypotheses. Zhang’s model application uses the pure-dimensional case; its arrow to proper cycles is not an isomorphism. |

The three new tests distinguish TT strict perfectness from global finite-free summands using `O(1)` on `P¹`; distinguish underived tensor from finite-Tor derived pullback using `ℤ→ℤ/2`; and detect a unit on a proper clopen support. Other repairs qualify existing counterexamples by nonemptiness, characteristic or local dimension.

Soulé’s §1.6 distinguishes full `F`, the Loday-product `′F` and individual-operation `″F` filtrations. Theorem 1(ii) proves `″F^{m+r}=0` integrally; comparison modulo torsion gives the full `F` bound rationally. The integral proof of Corollary 1 uses `″F`. This resolves the packet’s unsupported integral full-filtration deduction without inventing a stable-rank bound on all of `K₀`.

## Unresolved proof routes

These twelve entries have per-node verdict `unverifiable`. Each identifies an argument the present prerequisites/proof sketch do not establish; none asserts a counterexample to the cited theorem. The revision may supply the missing owner theorem, add a justified node, or narrow the scope.

- **Compact factorisation through supported finite cells** (`SchemeKTheoryOperations:S.3/killing-morphisms-into-supported`): The cellular construction uses arbitrary coproducts, not finite sums. The passage from a compact source mapping to an object of Loc(G) to a factorisation through Thick(G) needs the compact-factorisation theorem, with its finite-cell argument. EnhancedDerivedSheaves E1 presentability alone is not that theorem. Stacks 0A9C gives the asserted killing result directly; its pseudo-coherent branch does not make the cone Q perfect.
- **Exact graded-module filtration for Quillen’s graded lemma** (`SchemeKTheoryOperations:S.5/graded-quillen-lemma`): The generated-in-degrees filtration F_m is not an exact functor on Mgr(S). For S = k[x], applying F₀ to 0 → S(−1) →ˣ S → k → 0 gives 0 → 0 → S → k → 0, which is not exact. The proof’s invocation of admissible-filtration additivity is therefore unjustified. Supply the correct resolving-category/filtered-module argument for β-surjectivity; the theorem is not withdrawn. K-book Ex. V.3.3 contains only a hint, not this missing exactness theorem.
- **Unbounded coniveau convergence and proper filtered functoriality** (`SchemeKTheoryOperations:S.4/g-coniveau-spectral-sequence`): The finite-dimensional exact couple and convergence are justified. The extra arbitrary-dimensional convergence and proper codimension shift require H.6 completeness/derived-limit conditions and a filtered coherent pushforward with a support-dimension estimate. Fibre dimension alone does not supply a codimension estimate on arbitrary nonequidimensional schemes.
- **Weierstrass coordinate change for arbitrary coefficient fields** (`SchemeKTheoryOperations:S.4/gersten-power-series`): The source uses a Weierstrass coordinate change, not necessarily a linear change of variables. Over a finite field, a homogeneous polynomial can vanish on every field-rational direction. Supply the formal triangular coordinate substitution or a transfer argument, with the finiteness and principal-kernel checks; the theorem itself remains source-supported.
- **Supported Chow reduction for the leading Chern class** (`SchemeKTheoryOperations:S.7/chern-class-of-subvariety`): Generic smoothness is false over imperfect fields. Regularity of the ambient local ring gives a regular immersion near the generic point, but an equality on that open does not alone prove the global vanishing of lower Chern classes. Supply SF.5’s supported Chow localisation argument, controlling the complement inside Z and the lower-degree supported classes, before the Koszul/Newton calculation.
- **Dimension/codimension conversion for supported one-cycles** (`SchemeKTheoryOperations:S.7/dimension-one-supported-g-cycle-comparison`): The proof via GS87 Theorem 8.2 applies to a pure-dimensional catenary ambient scheme, using dimension plus codimension equals d. The first assertion has broader regular separated finite-dimensional scope. Supply an independent dimension-filtration argument for that broader scope, or restrict it to the source hypotheses. Zhang’s model application uses the pure-dimensional case; its arrow to proper cycles is not an isomorphism.
- **Mixed-characteristic effacement: semilocal branches and nullhomotopies** (`SchemeKTheoryOperations:S.4/mixed-char-higher-effacement`): The printed proof’s single-DVR reduction requires πR prime. Supply the componentwise semilocal localisation for the full smooth scope. Factorwise zero maps on homotopy groups do not automatically assemble into a nullhomotopy of a filtered-colimit spectrum: a compatible categorical nullhomotopy is required for the stated strengthening. The source asserts that strengthening; its provided colimit argument alone does not establish it.
- **Global representation additivity and supported stabilisation** (`SchemeKTheoryOperations:S.6/soule-scheme-operations`): Construct the global sheaf-level additivity homotopies and stable-representation-to-operation map. For the GS99 alternative, define K-coherence and prove it for the regular finite-dimensional scheme and its support cofiber (GS99 Proposition 5 and §3.2.4), importing uniform finite-rank stability. Stalkwise comparisons alone do not prove equality of global homotopy classes or the global product comparison. GS99 Definition 1, printed p.38, requires both colim_N H^{−m}(X,K^N) → H^{−m}(X,K) and colim_N H^m(X,π_{−n}K^N) → H^m(X,π_{−n}K) to be isomorphisms for all m,n ≥ 0.
- **Sharp supported rational weight range and filtration comparison** (`SchemeKTheoryOperations:S.6/scheme-weight-decomposition`): The source’s integral F² decomposition is supported (Soulé Proposition 5), but GS99 Proposition 8 states the rational decomposition for K-coherent spaces with a cohomological-dimension bound. Establish the supported comparison and sharp d-bound, or widen the range using the support-cofiber bound. Also prove the weighted λ-module filtration argument; operationwise bounds and stalkwise Kratzer identities alone do not establish the asserted global filtration bounds.
- **Finite coefficients: degree-one additivity and primitive-root independence** (`SchemeKTheoryOperations:S.6/finite-coefficient-weight-decomposition`): The proof establishes additivity only for m ≥ 2 but claims an eigenspace decomposition also for m = 1. Supply additivity for the Moore-space degree-one group, then the Bockstein argument. Commutation of Adams operations alone does not identify eigenspaces for different primitive roots; prove their common weight action on the primary blocks. This is a packet deduction, not a theorem quoted in the cited passage.
- **Unstable Brown spectral sequence and supported representability** (`SchemeKTheoryOperations:S.6/simplicial-sheaf-hypercohomology`): H.6’s spectrum spectral sequence does not construct the asserted general pointed-sheaf spectral sequence or its nonabelian fringe. Specify the support cofiber representing the homotopy fibre, and import the unstable model-category and Brown results with convergence hypotheses. The infinite-loop specialisation remains justified by S.4.
- **GRR field scope in the imported geometric theorem** (`SchemeKTheoryOperations:S.7/grothendieck-riemann-roch`): Borel–Serre works throughout over an algebraically closed field. The packet states arbitrary k while saying it does not extend SF.5’s source scope. Supply a public primary source proving the arbitrary-field version, or a field-extension/descent argument for Chow classes and K-pushforward; otherwise restrict this node to the cited algebraically closed scope.

## Baseline and ownership

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Every inherited declaration was read from its module at those commits, including surrounding binders and instances where needed. The existing `checked` locators are retained. No approximate name match was accepted in place of reading a declaration.

Two descriptions were repaired: `AlgebraicGeometry.AlgebraicCycle` allows locally finite support, rather than requiring globally finite support; `CategoryTheory.Abelian.SpectralObject.coreE₂Cohomological` uses `EInt`, so integer-indexed specialisations need an explicit restriction. Neither declaration was removed.

The added class is `Algebra.IsStandardSmoothOfRelativeDimension` in `Mathlib/RingTheory/Smooth/StandardSmooth.lean`, lines 74–91, at the Mathlib pin. Its arguments are `n R S`; it asserts a submersive presentation of dimension `n`. Requiring such a localisation at every prime, together with `r≥1`, states the constant relative-dimension assumption missing from the suggested Quillen signature. Global `ringKrullDim R=r` alone does not imply it.

The reviewed library audit lists the existing categorical, module, cycle, spectral-object and degree-zero K machinery as baseline. None is replanned as a new independent owner. DGAInfinity supplies arbitrary-ring perfect modules (use the opposite ring for Mathlib’s left-module convention); EnhancedDerivedSheaves E0/E1 supplies unbounded replacements, enhanced derived functors and sign comparison; GeneralAlgebraicKTheory supplies categorical K, products and the ring fundamental theorem; StableHomotopyKTheory supplies generic spectra and convergence; SchemeAndStackFoundations supplies sites/cohomology and source-scoped Chow/GRR; KTheoryLowDegrees supplies ring λ-operations, determinant and low-degree arithmetic. Proper coherence is imported from StableReduction; JacobianChallenge’s proper-flat-finitely-presented overlap is not treated as the whole coherence theorem. All 34 requests are precise conditional owner interfaces, not claims that those interfaces already exist.

The seven-stage target counts are:

| Stage | Nodes | Status |
|---|---:|---|
| SchemeKTheoryOperations:S.1 | 34 | planned; explicit remaining work |
| SchemeKTheoryOperations:S.2 | 34 | planned; explicit remaining work |
| SchemeKTheoryOperations:S.3 | 51 | planned; explicit remaining work |
| SchemeKTheoryOperations:S.4 | 54 | planned; explicit remaining work |
| SchemeKTheoryOperations:S.5 | 35 | planned; explicit remaining work |
| SchemeKTheoryOperations:S.6 | 52 | planned; explicit remaining work |
| SchemeKTheoryOperations:S.7 | 22 | planned; explicit remaining work |

## Assigned red-team findings and reader concordance

The reader is `research/blueprint/readmes/SchemeKTheoryOperations.md`; the original campaign README and supplier documents were also read. The table separates the accepted ownership repairs from mathematical errors newly found inside the reader.

| Assigned finding | Packet and document disposition |
|---|---|
| RT-AREA-ktheory-1/17 | Correct owner split: current K.6 supplies the ring projective-line/Nil theorem; S.2 owns negative G vanishing and S.5 scheme nonconnective agreement/regular negative vanishing. The reader’s opening boundary paragraph and S.5 say this. The nodal counterexample now adds characteristic ≠2 in the packet. |
| RT-AREA-ktheory-1/23 | H.6 supplies generic exact couples/convergence; S.4 gives scheme descent/coniveau instances with `E₂^{p,q}=H^p(K_{−q}) ⇒ K_{−p−q}`. Packet and reader use this orientation. The additional arbitrary-dimensional coniveau claim needs the newly recorded completeness/derived-limit bridge. |
| RT-AREA-ktheory-2/38 | Nisnevich-site ownership is requested from SF.2, with S.4’s comparison/excision instances. The reader’s SF.2 request and generic-site boundary agree. The packet now makes finite dimension explicit for TT E.6’s hypercohomology-colimit assertion. |
| RT-AREA-ktheory-2/39 | Chow/Chern/intersection theory and geometric GRR are imported from SF.5; S.5 gives scheme K projective-bundle/blow-up formulas and S.7 their K interfaces. Packet and reader acknowledge this boundary. Borel–Serre’s algebraically closed field scope is not enough for the packet’s arbitrary-field GRR assertion: a new gap records the needed extension. |
| RT-AREA-ktheory-2/40 | General proper coherent direct images come from StableReduction layer 2; JacobianChallenge A–C provides only its proper-flat-finitely-presented overlap. The reader opening supplier list and S.2 coverage state this. The packet’s arbitrary-base flat-proper K variant required a separate finite-presentation repair. |
| RT-AREA-ktheory-2/41 | S.6/S.7 import low-degree operations from Z.3, scheme low-degree comparisons from Z.5/Z.6, and the motivic finite-coefficient interfaces from M.4. Neither packet nor reader uses a universal Frobenius lift. The further scheme-operation and weight-decomposition proof routes remain conditional on the new gaps. |
| RT-AREA-ktheory-2/42 | N.2 is the arithmetic consumer; S.3 owns ramified DVR/geometric localisation and S.4 mixed-characteristic coniveau compatibility. Ownership agrees in packet and reader. The review adds integrality, dominance/flatness and pure curve fibres to the arithmetic-surface contract; the old broad reader assertion must follow that repair. |
| RT-AREA-ktheory-2/45 | Generic unbounded sheaf complexes and replacements are imported from E1, with E0’s enhancement/sign comparison. Packet and reader opening boundaries agree. TT’s global finite-Tor model on non-quasi-compact schemes must still be distinguished from all locally perfect objects. |

Concrete reader contradictions preventing acceptance include line 559 (Stacks 08C4 claimed globally equivalent to finite locally free terms), line 2304 (arbitrary-base flat proper K-pushforward without finite presentation), line 4856 (a constant presheaf falsely said to fail square excision), line 8585 (γ-operations falsely said to vanish on SK₁), and lines 8603/8640/8641 (the full integral γ-filtration bound and integral proof). The node correction ledger is the complete revision list, including other proof and API changes. A revision job must reconcile the reader with the corrected packet, its gap/status statements and source-issue verdicts; the two rejected Stacks allegations must not remain advertised as confirmed mistakes.

## Sources and errata

The review downloaded 29 original source PDFs and the Bhatt–Scholze author copy, read their cited statements and proof contexts, and appended dated URL/SHA-256 receipts. The detailed `sourceVersions` retain the planning worker’s historical receipts. In particular, the freshly fetched Soulé PDF has a different SHA-256; it is a new receipt, not a replacement of the earlier one. Invalid receipt-kind labels were normalised to the protocol enum with the original labels preserved in `citation`.

Source limitations: the AMS K-book edition was unavailable, so its findings remain against the 29 August 2013 author draft; the direct author errata PDF returned 404 and its indexed two-page listing was checked. The Springer Bhatt–Scholze PDF endpoint returned HTML; E32 is scoped to arXiv v3 and the author PDF, not asserted against the unread version of record. Supplied historical errata receipts are not relabelled as fresh successful downloads. Scanned or incorrectly encoded pages of TT, Gillet–Soulé, Kratzer and Soulé were inspected as rendered pages where the text layer was inadequate. This is a cited-passage audit, not a claim to have read every page of every source volume.

E4 is rejected because an omitted routine roof/homotopy-fibre proof is not a mathematical gap. E5 is rejected because the approximation detail is routine and its proposed absolute-diagonal pullback description is wrong; one uses the closed relative diagonal followed by a base-changed approximating diagonal. E14 is reclassified as a proof gap: mixed-characteristic scope is not established by the field-case proof, but no counterexample to the conclusion has been exhibited. E22’s exercise locator is repaired; E26 now includes TT 1.9.6 and its published 1993 correction.

| Finding | Verdict | Locator / correction |
|---|---|---|
| E1 | confirmed | Remark V.3.4.2 (PDF p. 395, book p. 387) — The example must be affine n-space with a double origin for n ≥ 2 (the affine plane, as in II.8.2.4 and Ex. II.9.10(d)); for the affine line with double origin K0VB(X) ≅ K0(X) ≅ G0(X) ≅ Z ⊕ Z and Theorem V.3.4's conclusion holds. |
| E2 | confirmed | Proper Transfer V.3.11 (PDF p. 403, book p. 395) — F_X must consist of homologically bounded pseudo-coherent complexes of flasque O_X-modules (TT 3.11.5); only then does F_X ⊂ Ch^hb_pcoh(X) induce K(F_X) ≃ G(X). |
| E3 | confirmed | Proposition 37.5 (tag 0F8I), Derived Categories of Schemes, version ed88ff78 — is an exact functor of triangulated categories |
| E4 | rejected | Lemma 46.8(2) (tag 08C9), Cohomology of Sheaves — If α : E• → F• is zero in D(O_X), choose a quasi-isomorphism s : F• → G• with s∘α null-homotopic; then α factors in K(O_X) through the acyclic homotopy fibre of s, and a map from the strictly perfect E• to an acyclic complex is locally null-homotopic by Lemma 46.6(1), so α is locally null-homotopic. |
| E5 | rejected | Lemma 36.10 (tag 0F8C), proof, Derived Categories of Schemes — The reduction needs a noetherian approximation X = lim X_i (Limits 5.4) with X_i having the resolution property (Lemma 36.9) and an argument that affine diagonal descends from some X_i to X (affine morphisms are stable under base change and the diagonal of X is the base change of that of X_i along X × X → X_i × X_i); the detail is not written in the source. |
| E6 | confirmed | Proposition 3.18, p. 321 — Let (3.18.1) be a pullback diagram of quasi-compact schemes, with f a quasi-separated map. |
| E7 | confirmed | 2.4.4, p. 302 — On a general scheme, the perfect complexes are the locally finitely presented objects in the “homotopy-stack” of derived categories. |
| E8 | confirmed | 5.10, p. 13 (preprint of 16 June 2003) — Let X be a quasi-compact and quasi-separated scheme |
| E9 | confirmed | V.6.6.4, change of parameter for the specialisation map (PDF p. 418) — With the right-linear boundary used in V.6.6.1 and V.6.7 (∂{s, a} = {∂s, a}) and graded commutativity, λ_{us}(a) = λ_s(a) − {ū, ∂a} = λ_s(a) + (−1)^n{∂a, ū}; the printed sign is correct for odd n and wrong for even n. |
| E10 | confirmed | Exercise V.6.9(b) (PDF p. 428) — The node is Spec k[x, y]/(y² − x² − x³) (Example I.3.10.2, char k ≠ 2). |
| E11 | confirmed | Exercise V.5.3 (PDF p. 413) — {x, y} ∈ K_{n+j}(A'/B') and ∂({x, y}) ∈ K_{n+j−1}(B'). |
| E12 | confirmed | Proof of Theorem V.9.6 (PDF p. 447) — given by Lemma 9.6.2 (the normalisation lemma); 9.6.1 is the proposition being proved. |
| E13 | confirmed | Theorem V.9.6 (PDF p. 446) — Add the hypothesis that R_p is regular for every p in the finite set (Quillen, Theorem 5.11); the proof's first step ('We may replace R by R[1/f], f ∈ S, to assume that R is smooth') uses it. |
| E14 | confirmed | Proposition V.9.8.1 (PDF p. 449) — For the proof given, add “over a field”, or retain the explicit Gersten–Quillen condition. A proof of the broader mixed-characteristic branch is not supplied here; no counterexample to Bloch’s formula is asserted. |
| E15 | confirmed | Proof of Theorem V.6.9.1 (PDF p. 422) — With the right-linear boundary of V.6.6.1, ∂{a', s'} = (−1)^{n−1}{a', ∂s'} for a' of degree n − 1. |
| E16 | confirmed | Corollary V.1.5.1, PDF p. 377 (book p. 369), author copy of 29 August 2013 — K_*(P^n_X) ≅ K_*(X)[z]/(z^{n+1}). |
| E17 | confirmed | Lemma V.1.5.2, proof, PDF p. 377 (book p. 369) — ι_n has Σ_{i=1}^{r+1} (−1)^{i−1} λ_i as a homotopy inverse. |
| E18 | confirmed | Proposition II.8.7.10, proof (PDF p. 160) and Lemma V.1.5.2, proof (PDF p. 377) — 0 → F → F(1) ⊗ π^*E^∨ → ⋯ → F(r + 1) ⊗ π^*Λ^{r+1}E^∨ → 0, with the dual bundle E^∨. |
| E19 | confirmed | Theorem V.6.2, proof, PDF p. 415 (book p. 407) — M^b_gr(S) must be the Serre subcategory of finitely generated graded S-modules annihilated by a power of t; this is not the same as having finitely many non-zero components. |
| E20 | confirmed | Remark V.8.3.2, PDF p. 440 (book p. 432) — … → K_{n+1}(X[t, 1/t]). |
| E21 | confirmed | Lemma IV.12.8(2), PDF p. 372 (book p. 364) — KH(X × Spec ℤ[x, x⁻¹]) ≃ KH(X) × Ω⁻¹KH(X). |
| E22 | confirmed | Exercise V.3.3, PDF p.404 (book p.396), author-hosted combined draft of 29 August 2013 — … of graded S-modules M with M = F_m(M). |
| E23 | confirmed | Exercise V.3.4, PDF p. 405 (book p. 397) — … acyclic for both ⊗_S R and ⊗_R S. |
| E24 | confirmed | Section 4.8, Lemma numbered 4.8.4 (p. 334; PDF p. 88), scan of the published article — The lemma is 4.8.3. |
| E25 | confirmed | Section 4.6 (p. 331; PDF p. 85) — Koszul complex. |
| E26 | confirmed | Theorem 1.9.8 (p. 271; PDF p. 25), as used in 4.11 (p. 336); Theorem 1.9.6 as corrected by Thomason 1993 §4 — Theorem 1.9.8 needs the additional hypothesis that a retract up to weak equivalence of an object weakly equivalent to zero is itself weakly equivalent to zero (Thomason 1993, Hypothèse 4.1.1); it holds when weak equivalences are quasi-isomorphisms, so 4.11 is unaffected. |
| E27 | confirmed | Theorem 6.1(b), proof (p. 354; PDF p. 108) — The calculation of the sign ∂_T(T) = +1 is not given; the proof establishes ∂_T(T) = ±1, which is all 6.1(b) as stated needs. |
| E28 | confirmed | Ex. II.8.7 (printed p. 157, PDF p. 165) and the proof of Corollary II.8.9.1 (printed p. 155, PDF p. 163), author-hosted draft of 29 August 2013 — c_i([O_Z]) = (−1)^{i−1}(i − 1)![Z]. |
| E29 | confirmed | Example IV.5.4.1 (printed p. 313, PDF p. 321), author-hosted draft of 29 August 2013 — λ^k(a) = a^{(−1)^{k−1}} (in additive notation λ^k(a) = (−1)^{k−1}a), and ψ^k(a) = a^k. |
| E30 | confirmed | II.4, Chern character, expansion of ch (printed p. 100, PDF p. 108), author-hosted draft of 29 August 2013 — The degree-two term is (1/2)[c_1(x)² − 2c_2(x)]. |
| E31 | confirmed | Proof of Proposition 5, pp. 513–514 (Canad. J. Math. 37, published version) — The reference should be [33] (Suslin, Stability in algebraic K-theory, LNM 966), as in the proof of Lemme 1 and in 2.4–2.6; the same applies to 'est surjectif [32]' on p. 514. |
| E32 | confirmed | Proof of Theorem 11.2(2), assertion (1), PDF p.47, arXiv:1507.06490v3 and the read author copy; published version not available — The mapping spaces are (b−a)-truncated; the core object space is (b−a+1)-truncated. Only a finite bound is used, so Theorem 11.2(2) survives. |
| E33 | confirmed | 3.16.6, printed p.320 (PDF p.74), scan of the published article — Require finite presentation (or a perfect proper morphism), rather than arbitrary flat proper morphisms of qc schemes. |
| E34 | confirmed | 3.15, printed p.319 (PDF p.73), scan of the published article — A proper support need not be unital, but a nonempty clopen component gives a unit. |
| E35 | confirmed | Proposition II.4.9, printed p.97 (PDF p.105), combined author draft of 29 August 2013; not the unread AMS edition — Replace (−1)^k by (−1)^{k−1}. |
| E36 | confirmed | Théorème 7, printed p.533 (PDF p.46), published Cambridge article — For the stated increasing filtration, Gr_j = F_j/F_{j−1}. |
| E37 | confirmed | Théorème 7(vi), last formula, printed p.534 (PDF p.47), published Cambridge article — Under the graded map induced by Cartan duality η, σ(x) corresponds to ch_γ(ηx)Td_γ(X). |
| E38 | confirmed | Théorème 7(vi), first formula, printed p.534 (PDF p.47), published Cambridge article — For positive k, k^{dim S}η(φ^k x) = ψ^k(ηx)θ^k(X), where θ^k(X)=θ^k(−Ω_{X/S}). |
| E39 | confirmed | Displayed complex (9.8), printed p.441 (PDF p.449), combined author draft; not the unread AMS edition — The codimension-p term is ⊕_{cd=p}(i_x)_*K_{n−p}(k(x)), beginning with p=0 after K_n. |
| E40 | confirmed | Proof of Proposition V.9.4.1, printed p.438 (PDF p.446), combined author draft; not the unread AMS edition — Y has codimension i−1 in the dominant generically finite branch of the argument. |
| E41 | confirmed | Corollary V.6.7.4, printed p.412 (PDF p.420), combined 29 August 2013 author draft; not the unread AMS edition — Require A ≠ 0 (equivalently the unital field-to-algebra map is injective). The packet already imposes this. |

Each finding contains its independent review reason and search history. E32 and E35 are already recorded elsewhere in the atlas and are linked as known findings. No author was contacted. The packet uses corrected mathematics even when a printed formula is retained as the evidence for an erratum.

## Suggested Lean and validation

The native suggested definitions, structures, signatures and examples were read statically against the packet and pinned declarations. I corrected the coherent-support pushforward’s ambient noetherian hypothesis and Quillen’s constant positive relative dimension; repaired stale prose; and added explicit corrected contracts for missing higher-K, enhanced and supported-Chow carriers. The file retains honest omissions rather than constructing proposition-valued substitutes. All new mathematical cases are labelled acceptance specifications; no test execution or formalisation is claimed.

The full file **was not compiled**. The existing shared build has the Mathlib pin but a different Tau Ceti commit, and no existing build at both pins was found. WORKERS.md forbids creating a replacement build. No Lean language server or prohibited Lake command was started. The planning worker’s earlier Mathlib-only square-zero receipt is preserved and explicitly attributed; this independent review did not rerun it.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeKTheoryOperations.json`: zero errors, zero warnings.
- `python3 scripts/check_errata.py` on a scratch `errata-v1` wrapper containing the packet’s exact findings and receipts: passed.
- Static review completeness: every node has exactly one verdict; every source issue has this job’s verdict; exact pins and all 134 baseline declaration records are present.
- `git diff --check`, JSON parsing and deliverable/private-path checks: passed before submission.

## Orchestrator handoff

Queue a revision for this roadmap; do not promote it. The revision should reconcile the reader and address or honestly narrow the twelve proof routes above. Reuse the recorded corrected contracts and public receipts. No change to upstream Tau Ceti roadmaps, atlas data, ownership or labels is made by this review. A fresh independent session should review the revision. This review job itself is complete.
