# Independent review: AlgebraicCurves links

**Verdict: accepted after correction.** Codex, session `codex-c83e7a`, 2026-09-23. Refs #83.
The original packet was authored by Claude Opus 5 (commit `c69bcc9280faab52126b77beb0caa4454f9112b0`), not this worker. The claim bot confirmed this session before work began.

The corrected packet has **46 links and 11 overlap decisions**. Four valid modular-curve edges are deduplicated into `alreadyRecorded`; the unsupported LV algebraization edge is removed. The genus edge is rerouted from LV.7 to LV.8, and a missed Layer 9 local-expansion input to Belyi descent is added. Original numbering is retained as `AC-L01`–`AC-L50`; the new dependency is `AC-L51`. Acceptance concerns this corrected map of contracts, not formalization or completion of any roadmap theorem.

## Evidence and reading boundary

Initial explorer snapshot: `33d12ff6251829f55e81bc5c7241a83da5724348`. Read the original handoff, every one of the **40 distinct original endpoint stage descriptions in full**, all 13 AlgebraicCurves layers, its conventions and relevant coordination contracts, and the current LV.8 replacement stage. Each of the 50 original directed pairs was checked for the actual output, consuming use and hypotheses; the decision ledger below records all of them. All eleven overlap stage sets were checked, including the full local-field, number-field, modular-curve, elliptic and Belyi stages.

The original validator found three stale LV quotation references. Fifty-three additional quotes matched only after whitespace normalization; these are now literal source substrings, with original newlines preserved. All **116 link quotes and 8 deduplicated-link quotes** pass a separate raw-text substring check. A quote from a roadmap-wide contract is allowed by Protocol 10 and is distinguished from a stage-local quote by that check; it is not evidence that the entire roadmap was reread. No quotations are manufactured from summaries.

Protocol 10 requires reciprocal textual naming for `explicit`. The corrected packet conservatively marks one-sided named matches as `inferred`, alongside genuinely inferred matches, and explains the supplied mathematical interface. It has 17 explicit and 29 inferred links. In particular, an unnamed upstream coordination statement is not treated as reciprocal naming.

## Every original link

| Original link | Independent decision |
|---|---|
| AC-L01 | Normalized places, residue degree and valuation interface match; generic supplier precedes the Weierstrass specialization. |
| AC-L02 | Keep the weighted divisor/product-formula interface; the elliptic group law is not re-proved by RR. |
| AC-L03 | Fundamental identity supplies multiplicity-weighted fibres. Actual point counts additionally require separable-isogeny unramifiedness and split residue fields. |
| AC-L04 | Keep the general affine-prime/place bridge; the Weierstrass Dedekind instance itself already exists at the pin. |
| AC-L05 | Keep the use of surjectivity; Point.toClass_surjective is already proved at the pin, with no ellipticity assumption. |
| AC-L06 | Keep the concrete invariant differential as input to the later Weil-divisor-zero comparison; this does not reverse the early differential-basis dependency. |
| AC-L07 | Keep the existing nonzero isogeny carrier as comparison input. Only dominant, origin-preserving scheme morphisms correspond; zero is separate. |
| AC-L08 | Keep Jacobian divisor/sheaf inputs for 12E under its smooth proper geometrically connected scope; do not use smooth Weil/Cartier comparison on every regular imperfect-field model. |
| AC-L09 | Keep coherent RR and Serre duality as comparison inputs with 12E hypotheses; coherent H1 is not etale H1. |
| AC-L10 | Keep intrinsic function field, exact constants and places for 9.1/9.4. |
| AC-L11 | Keep the rational finite places and infinity; marked branch set is contained in the three points. |
| AC-L12 | Keep divisor/L(D)/genus data for 9.5, using degree-weighted divisors. |
| AC-L13 | Keep the large-degree dimension formula in the analytic/algebraic genus comparison. |
| AC-L14 | Keep e,f and sum e*f; unweighted partitions require residue degree one. |
| AC-L15 | Restrict supplied base change to algebraic constant extensions. The arbitrary-extension assertion in the consumer exceeds this supplier. |
| AC-L16 | Keep the regular-projective/function-field anti-equivalence; analytic algebraization remains the Belyi successor obligation. |
| AC-L17 | Keep the intrinsic function-field entry to the constructive Belyi direction in characteristic zero. |
| AC-L18 | Keep Riemann inequality and L(D); this is the actual source of the (g+1)P bound. |
| AC-L19 | Keep large single-pole functions/gap data for the minimal-pole construction; correct the false implication n>=2g therefore n=g+1. |
| AC-L20 | Keep e-multiplicativity and finite extension theory for composition and descent. |
| AC-L21 | Keep finite support of the different as the missing finite-branch-set input, with characteristic-zero residue separability. |
| AC-L22 | Keep algebraic constant extension from a number field to Qbar only; Qbar to C full faithfulness remains a gap. |
| AC-L23 | Keep genus as the invariant transported by conjugation; the action/transport theorem is the consumer obligation. |
| AC-L24 | Keep finite-Galois constant-extension bookkeeping; effective descent and exactness of descended constants are not automatic. |
| AC-L25 | Keep Galois place action and ramification data for the finite-cover tower. |
| AC-L26 | Keep the stated tame/different input in characteristic zero. Cyclic inertia and wild-inertia vanishing are supplied by Layer 8, separately. |
| AC-L27 | Keep unramified composita/Galois closures and inertia structure; exclude the unsupported transcendental base-change claim. |
| AC-L28 | Valid componentwise Hurwitz input; deduplicate against the ModularCurves packet. |
| AC-L29 | Valid lower-group/Hilbert-different input; deduplicate against the ModularCurves packet. |
| AC-L30 | Valid Kahler/Weil/different comparison input; deduplicate against the ModularCurves packet. |
| AC-L31 | Valid componentwise curve dictionary; deduplicate against the ModularCurves packet. Relative constancy of chi is not supplied. |
| AC-L32 | Keep general local completions and repartition comparison; local compactness requires the finite constant/residue fields of FA.2. |
| AC-L33 | Keep zeta-free bounded-divisor and class-number finiteness plus large-degree RR; no Weil bound imported backwards. |
| AC-L34 | Keep divisor/genus carrier integration, through the curve dictionary when a scheme formulation is needed. |
| AC-L35 | Keep function-field RR as one input; this alone is not coherent Serre duality or Picard representability. |
| AC-L36 | Keep 12E comparison under its smooth/proper/geometrically connected hypotheses. |
| AC-L37 | Keep general curve dictionary as input; E.1 owns elliptic scheme specialization and the zero map separately. |
| AC-L38 | Keep only conversion of the genus convention. Coherent genus comparison does not itself prove b1(etale)=2g. |
| AC-L39 | Keep normalized place valuation and finite zeros/poles for finite support of reciprocity factors. |
| AC-L40 | Keep closed-point/place/order/residue matching; Weil reciprocity itself remains T.4 work. |
| AC-L41 | Keep all rational-function-field places, including infinity, for Bass-Tate. |
| AC-L42 | Keep algebraic differential and local-residue input only. De Rham complexes, rigid comparison and Frobenius continuation are not outputs of Layer 9. |
| AC-L43 | Keep L(G), rational-place evaluation and Riemann inequality as code-bound inputs; encoding and distance arguments stay with FF.4. |
| AC-L44 | Keep Weil differential spaces and their dimensions for residue codes; this is not a second code carrier. |
| AC-L45 | Keep local component/residue theorem and large-degree RR for the residue-code construction. |
| AC-L46 | Keep nonzero scheme-isogeny comparison input; the Tate module functor, continuity and zero morphism are not produced by the anti-equivalence. |
| AC-L47 | Keep the general curve/function-field dictionary for the nonconstant modular parametrization. A map from higher-genus X0(N) is not an elliptic isogeny. |
| AC-L48 | Reroute genus dependency from stale LV.7 to current LV.8. The latter explicitly requests Layer 3 genus; scheme/genus transport is additional. |
| AC-L49 | Remove: current LV.7 contains no cover algebraization construction. LV.8 assigns Riemann existence to IG.3, GAGA to ComplexComparisonPartII and normalization to SF.0; do not substitute the narrower Layer 12 dictionary. |
| AC-L50 | Keep upper numbering/Herbrand/Hasse-Arf only after finite-residue canonical completion and lower-filtration comparison; no arbitrary-residue supplier. |

The four duplicate pairs AC-L28–31 are already emitted by `research/blueprint/links/tauceti_TauCetiRoadmap_ModularCurves.json`. Their mathematics and direction remain valid; their removal from this packet's `links` is not a rejection. The componentwise Euler-characteristic formulation and relative constancy obligation remain with the modular-curve consumer.

AC-L51 supplies exactly the Laurent expansion and coefficient-uniqueness step of Belyi 10.7(3), at a rational place over C. Layer 5's completion construction does not itself provide that series-coordinate theorem. The source is Layer 9's local-expansion subsection, not its later Weil/Kahler comparison. Semilinear invariance of the normalized generator remains consumer work.

The Belyi source explicitly retains Layers 9–11 as specifications owned by `BelyiAlgebraicAndDescent`, and Layer 12 by `BelyiArithmeticActions` with generic profinite suppliers. The current atlas stage IDs are preserved; these links claim no public Belyi carrier or implemented theorem. No successor stage ID was invented.

## Overlap decisions

| Overlap | Decision | Boundary |
|---|---|---|
| O1 | keep | Keep existing upstream responsibilities and cite the pinned implementation. The coordinate-ring normality/Dedekind theorems and pointEquivDegreeOnePlace already provide the concrete interface; Point.toClass_surjective is also proved, without ellipticity. Do not move an existing Tau Ceti layer or make the early elliptic foundation wait for Layer 10. Layer 10 retains the intrinsic genus-one normal-form/genus-computation obligations and the comparison to the shared APIs. A public integral-closure packaging theorem is not asserted merely from the existing private argument. |
| O2 | keep | Reuse TauCeti.finrank_kaehlerDifferential_eq_one_of_separating and kaehlerBasisOfSeparating at the pin, discharging transcendence and Algebra.IsSeparable k(x) F. EllipticCurves supplies its concrete invariant form; Layer 9 owns the later comparison with Weil differentials. No new early-layer split or reverse edge is required, and the general module theorem does not prove divisor(omega_W)=0. |
| O3 | keep | Keep function-field RR and coherent RR/duality as separate developments, joined only by 12E under separable generation and smooth proper geometrically connected hypotheses. In particular no coherent Serre duality theorem is claimed for arbitrary regular imperfect-field models. |
| O4 | keep | Reuse the pinned SchemeWeilDivisor on codimension-one points and its cycle adapter; do not define another carrier. Regular curve models use the generic scheme API. JacobianChallenge smooth-curve Weil/Cartier/Picard comparisons keep their hypotheses: regular does not imply smooth over imperfect fields. Layer 12D owns its comparison, and 12E uses JacobianChallenge only in its explicitly smooth proper geometrically connected scope. |
| O5 | keep | Keep analytic compact-surface RR separate from function-field RR. Their comparison for Belyi pairs belongs to the retained Belyi Layer 9.5 specification / BelyiAlgebraicAndDescent successor. No direct AlgebraicCurves -> ModularForms 10B prerequisite is justified. Remove the obsolete portfolio-wide claim that no current roadmap owns any GAGA: ComplexComparisonPartII has a distinct general comparison programme. |
| O6 | rescope | Narrow proposed FunctionFieldArithmetic FA.0 to the finite-constant-field application of existing AlgebraicCurves Layers 0, 2 and 12. Reuse exact-constant bookkeeping, regular projective models, closed points/places and finite dominant morphisms; perfect finite fields discharge the smoothness issue. Keep FA.0 arithmetic acceptance examples and inseparable degree/residue adapters. This is a proposal to rescope FA.0, not to rewrite the upstream roadmap. |
| O7 | rescope | Narrow proposed FA.1 to importing AlgebraicCurves Layers 3-5 and the Layer 9 differential comparison when Kahler residues are required. Do not rebuild divisor/L(D)/RR or finite Cl0. Preserve the separate comparison between rational divisor classes and rational Picard points, especially without a chosen degree-one point, and certified algorithms for bases of L(D). Any cohomological formulation additionally uses Layer 12E with its hypotheses. |
| O8 | rescope | Narrow proposed FA.3 to the arithmetic specializations of AlgebraicCurves Layers 6-8 and 10; import their extension/different/Hurwitz and Kummer/Artin-Schreier contracts. Retain FA.3 discriminants, upper ramification through finite-residue LocalFieldsRamification, Witt-vector cyclic p-power theory and conductor applications. Preserve roots-of-unity, separability and reduced Artin-Schreier representative hypotheses. Purely inseparable cases remain separate. |
| O9 | rescope | Narrow proposed EllipticKTheory E.1 to consuming AlgebraicCurves 12C and the existing ModularCurves 2A field-level projective-Weierstrass function-field / [N] comparison where applicable. E.1 retains its elliptic projective construction/identification, arbitrary nonzero pointed-isogeny comparison and compatibility with degrees, kernels, divisors and differentials. Treat the zero morphism separately. ModularCurves 2A proves its narrow bridge over fields and then on geometric fibres; no K(E) function field of an arbitrary relative base is supplied. Do not promote or re-plan upstream milestones. |
| O10 | keep | Keep existing scope: AlgebraicCurves owns arbitrary-residue completion/lower-group comparison and function-field different; LocalFieldsRamification supplies upper numbering, Herbrand and Hasse-Arf for finite-residue completions. Their common finite-residue specialization must use one comparison, not two local group carriers. A broader local theorem would be a Local Fields and Ramification, Part II proposal under Protocol 15, with exact residue-separability, finite-Galois, defect/finite-integral-closure and monogenicity requirements verified before use; this packet asserts no such supplier. Existing localization of the different is not completion. |
| O11 | keep | Reuse the pinned generic different-localization theorem under its module-finiteness, integral-closure, finite-separable and Dedekind hypotheses. This does not supply flat completion transport or group comparison. Keep NumberFieldArithmetic canonical number-field completion and finite-residue LocalFieldsRamification imports, including the named maps, density and ideal-power transport. The function-field completion bridge remains AlgebraicCurves work. A common broader completion API is a future Part II/interface proposal, not a reason to broaden the existing upstream number-field layers or claim a dependency. Galois-group formulas require finite Galois extensions; general finite separable extensions supply only the different. |

These are seven `keep` decisions and four `rescope` proposals, the latter confined to proposed FA.0–FA.3 responsibilities and E.1. No upstream Tau Ceti roadmap is rewritten or newly assigned work by this packet. A broader local or number-field completion theory is a possible Part II/interface proposal under Protocol 15, not an available supplier. Generic different **localization** and different **completion** are distinct contracts.

## Library baseline

Read the reviewed AUDIT-01 coverage for all 13 focal layers: the target/status screen reports Layers 1 and 4 built, with the other layers partly built. The audit is a guide to reuse and remaining work, not a substitute for declaration inspection. Relevant positive statements were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; all six downloaded source blobs were checked against that commit's tree. Mathlib remains pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`; no newer library state is assumed.

| Directly inspected pinned source | Statement and scope used |
|---|---|
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/CoordinateRing.lean`, lines 535 and 544 | `isIntegrallyClosed_coordinateRing` assumes an elliptic affine Weierstrass curve over a field; `isDedekindDomain_coordinateRing_of_isIntegrallyClosed` consumes normality. Reuse these theorems/local instances; do not schedule a second proof. No public integral-closure packaging is inferred from a private proof. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/PointPlace.lean`, line 327 | `pointEquivDegreeOnePlace` gives rational points equivalent to degree-one normalized places for an elliptic W, installing the Dedekind theorem locally. Its infinity/affine compatibility statements were read. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/ToClass.lean`, line 655 | `Point.toClass_surjective` has Field and DecidableEq assumptions, with no ellipticity hypothesis. This is already a theorem, not merely a Suggested.lean target. |
| `TauCeti/FieldTheory/FunctionField/Differential/Kaehler.lean`, lines 112 and 118 | `finrank_kaehlerDifferential_eq_one_of_separating` and `kaehlerBasisOfSeparating` require a transcendental x and `Algebra.IsSeparable k(x) F`. They give the early rank/basis input; they do not prove the Weil divisor of the invariant differential is zero. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean`, line 47 | `SchemeWeilDivisor` is already the free divisor carrier on codimension-one scheme points. This generic carrier does not require the Jacobian roadmap's smooth-curve hypotheses; subsequent comparison theorems still have their own hypotheses. |
| `TauCeti/RingTheory/DedekindDomain/Different/Localization.lean`, line 247 | `map_differentIdeal_eq_differentIdeal` is a localization theorem. Its context includes finite module/integral-closure data, finite separable fraction-field extension, compatible localizations/scalar towers and a Dedekind upper ring. It is not a completion theorem. |

This review makes no catalogue-wide absence claim about Lean declarations. The audit's missing comparison/Hurwitz/completion targets remain reported audit gaps; only the positive declarations above were directly certified here. Library reuse concerns the overlapping contracts and does not collapse planned interfaces into assertions that every layer is implemented.

## Completeness probes

Searched all 2,007 stage descriptions and 218 roadmap documents, including the six supplemental roadmap definition files, for the seven focal contract families below. This is a catalogue-wide **search screen**, not a claim that every document was read in full. Original catalogue notes are retained as the extraction's evidence; five newly present roadmap IDs were screened by titles and full-text contract terms. The retired `FoundationsAndLibraryIntegration` ID was removed from active coverage. The resulting examined ledger contains all **216 other active roadmaps** (217 active including the focal roadmap), without duplicates.

| Focal layer | Probe | Result |
|---|---|---|
| 0 | normalized places, point/place interfaces, AlgebraicCurves references | Elliptic/Belyi/reciprocity matches retained; generic valuation/Huber spectrum terminology does not supply this place carrier. |
| 3 | L(D), genus and degree-zero divisors | Found current LV.8 genus use and rerouted AC-L48. Scheme K-theory S.7 needs general scheme cycles, not the curve-specific 12D comparison. |
| 5 | local residues, class-number finiteness, strong approximation | FA.2 and FA.5 retained; number-field/Iwasawa class numbers and algebraic-group approximation do not match these function-field theorems. |
| 7 | Riemann–Hurwitz, different divisors | Finite branch-set input retained; four modular links found already owned. Topological/relative surface formulas are not silently replaced by this finite separable function-field formula. |
| 8 | algebraic constants, inertia, Hilbert different | Kept finite-residue scope, algebraic base change, composita and inertia. Transcendental Qbar-to-C full faithfulness is still not supplied. |
| 9 | Kahler/Weil differentials and local coefficient expansions | Added AC-L51 after reading the entire Belyi 10.7 consumer. General derived de Rham or q-de Rham-Witt theory is not this residue/series theorem. |
| 12 | regular projective models and field/scheme dictionaries | Corrected zero-map, imperfect-field and relative-base boundaries; removed the stale LV cover-algebraization assertion. |

The five newly screened roadmaps are `SolidAnalyticRings`, `AnalyticStacks`, `QWittVectors`, `RingStacksAndTransmutation` and `AnalyticHabiroStack`. Their new ledger entries state why no exact curve contract was found. SchemeKTheoryOperations' preserved KU checkpoints are owner aggregations; `UPSTREAM:AlgebraicCurves-vector-bundles` is not matched by a vector-bundle output in this roadmap. No edge is invented for that unresolved label.

## Remaining scope gaps

- Belyi's Qbar-to-C fully faithful base change is transcendental and exceeds Layer 8's algebraic constant-extension statement. Effective descent is also not a consequence of bookkeeping alone.
- Coleman needs de Rham complexes, rigid comparison and Frobenius continuation beyond the supplied differential/residue input.
- WC.5 still needs the curve/Jacobian etale-cohomology theorem b1=2g; coherent H1/genus comparison is only one input.
- Scheme isogeny comparison excludes zero from the dominant-map anti-equivalence. Modular parametrizations from higher-genus curves are not elliptic isogenies.
- Arbitrary-residue completion transport, local coefficient constructions and finite-residue upper ramification are not interchangeable.

These are precise limitations on accepted partial interfaces, not hidden promises to broaden a supplier.

## Validation

`python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCurves.json`: **0 errors, 0 warnings**, including endpoint and cycle checks against other packets.

The raw-quote/coverage/duplicate verification checks 124 literal quotes, every active examined ID, the two corrected/new edges, all original decisions and the four recorded duplicate owners. `research/blueprint/intake.py check-files` passes for exactly the two authorized deliverables. Publication rechecks original deliverable blobs and all refreshed input blobs/file sets to prevent overwriting concurrent work.

No Lean file was changed, compiled or claimed to elaborate. No Git commands were run.
