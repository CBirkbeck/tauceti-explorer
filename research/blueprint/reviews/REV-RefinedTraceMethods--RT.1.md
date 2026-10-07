# Independent review: RefinedTraceMethods, part RT.1

**Job:** REV-RefinedTraceMethods--RT.1 · **Issue:** #480 · **Reviewer:** Codex, session codex-79dlkk · **Date:** 2026-10-07 · **Review status:** complete · **Verdict:** needs_changes.

This is the finished independent review of BP-RefinedTraceMethods--RT.1 (#983), authored by Claude, session claude-w5NJ1D. It is not a checkpoint. The claim was confirmed by the swarm bot before work began. The packet now has status `partial`, reflecting missing key definitions below the 300-node budget; that is the status of the plan being reviewed, not the status of this review job. Its review object names `independent-review-REV-RefinedTraceMethods--RT.1`. Nothing is formalised or promoted.

All 134 nodes were checked at **target level**, including their locators, excerpts, hypotheses, direct prerequisites, proof sketches, APIs, tests and planets where present. The review also checked all 20 baseline declarations at the exact pins, the reviewed library audit, the roadmap and reader, 72 external supplier interfaces, all 15 source issues, and all 10 handed red-team findings. Source checking means reading the cited passages and relevant surrounding definitions and hypotheses, not reading every page of each long book or paper. Mechanical excerpt normalization was supplemented by visual inspection of scans and displayed mathematics; quotation agreement alone was not treated as proof of a node.

## Counts and verdict

| Item | Result |
|---|---|
| Nodes | 134 |
| Definitions / constructions / theorems / comparisons / applications | 33 / 26 / 72 / 1 / 2 |
| Per-node verdicts | 59 verified / 26 corrected / 49 unverifiable / 0 added |
| Existing nodes edited | 54 |
| Changed node fields | 91 |
| API items / unit tests / planets | 300 / 186 / 24 |
| Pinned baseline declarations | 20 confirmed; 0 removed or replaced |
| Sources | 30 original public sources + Antieau–Riggenbach (31 total) |
| Node-source bindings | 226 input; 228 after corrections |
| Source issues | 14 confirmed; E5 rejected (E14 confirmed only as a definition/hypothesis gap) |
| Gaps | 6 retained + 16 review gaps = 22 |
| Requests | 10 retained + 7 precise supplier requests = 17 |
| Coverage | 5 partial / 3 planned / 0 closed |

The 49 unverifiable verdicts identify unresolved mathematical interfaces, not unavailable sources or a compile failure. Some of those nodes also received clear corrections; the stronger unresolved verdict takes priority. Acceptance would be unjustified while the unbounded mixed-complex carrier, coherent-category interfaces, Raskin convergence definitions, actual even-flat sites and synthetic finite-cyclic construction remain unspecified. Conversely, an explicit proof gap in a source is not by itself a demand to decompose that proof into lemma nodes. No nodes were added and no source-supported target was rejected merely for lacking lemma-level expansion.

## Main corrections and their mathematical effect

1. **Cyclic theory and HKR.** Periodic chains use Laurent series with a finite lower bound, `colim_r ∏_{i≥−r} M_{n+2i}`, not an unrestricted product over all integers. The ground-ring sum/product counterexample and SBI check were corrected. The nonunital matrix corner is not a mixed-complex inverse: unit-inserting degeneracies and Connes B obstruct it; generalized trace has a derived inverse. Antisymmetrization is a homology map and inverse on HH, not a strict chain inverse of the de Rham projection. The HKR filtration is complete and descending, with Fil⁰ = HH and grⁿ = cofib(Filⁿ⁺¹→Filⁿ). The p²-extension in NS IV.4.7 concerns THH homotopy fixed points, not the asserted first HH/HKR extension. The direct DD.1 Koszul prerequisite was added to HKR, replacing the circular appeal to its later filtration.

2. **Tate, TC and genuine comparison.** The adjunction order is orbits ⊣ trivial ⊣ fixed. There are zero natural unshifted maps; the obstruction is that their cofibres cannot give the circle Tate construction with the required suspension. A simplicial object can have a trivial circle action, so “no circle action exists” was an invalid test. NS B.20 supplies a comparison from realization of levelwise Tate to Tate of realization, not an equivalence even under the old uniform boundedness condition. The THH Frobenius uses this comparison. Unsupported rational equivalences of the individual TC⁻→HC⁻ and TP→HP maps and the integral TC filtered-colimit assertion were removed; connective TC/p has the separate CMM Theorem 2.7 scope. NS IV.4.12 covers all circle-equivariant Hℤ-modules, without the invented finiteness bounds. Geometric fixed-point point-set comparison was restricted to H=G, the Borel unit was correctly typed, and coalgebra coreflection requires colimit-preserving F. FV is the residual C_p norm, equal to p under the trivial-action condition. The Witt identification remains an L.4 convention test rather than a duplicate theorem here.

3. **Trace and convergence.** The trace on π₀ for 𝔽_p is ℤ→ℤ_p, an isomorphism after p-completion. Connective fib(K→TC) is not claimed to be localizing; nonconnective fib(IK→TC) has that scope. Raskin §2.3 linearization needs cocomplete stable categories and sifted-colimit preservation; the connective extension is Variant 2.3.2. The invented general “nil-convergent” derivative criterion was replaced by Proposition 5.5.3: Postnikov convergence, infinitesimal sifted-colimit preservation and constancy on split square-zero extensions. Derivative vanishing reaches that last condition using Corollary 2.11.7 and actual pseudo-extensibility, not derivatives alone. The K/TC application uses Theorem 5.6.1. The tower square now retains I-completeness, noetherianity and F-finiteness of R/p, and the assembly input is the precise connective p-completed Hesselholt–Nikolaus cofiber sequence, with LMMT’s chromatic extension distinguished.

4. **Beilinson comparisons.** β first lands in integral HP(R;ℤ_p); p inversion gives its ℚ_p version. The fibre-square proof compares horizontal orbit fibres instead of commuting rationalization through infinite fixed points. Actual AMMN Theorem 3.4 and Corollary 3.9 locators replace citations of definitions or coefficient conventions alone. In weights n≤p−2 the integral syntomic reduction fibre is the shifted fibre of the map between de Rham Hodge quotients; it is not the quotient itself. Proposition 6.21 classifies endomorphisms of ℤ_p(n), not uniqueness of χ_n.

5. **Topological K and q-Hodge.** Reduced K for disconnected based spaces needs [X,ℤ×BU]_* and the nondegenerate-basepoint condition. The c_i are polynomial generators, with Whitney coproduct Δc_n=∑c_i⊗c_{n−i}, not primitive generators. General Chern characters land in a product of even cohomology groups. Perfect-even descent and the HRW comparison are after completion; the latter requires an actual faithfully even flat map to an even E_∞-ring. Whitehead filtration uses even homotopy (condensed homotopy sheaves in the solid case), whereas homological evenness alone is different. Discrete homotopy-evenness does imply discrete homological evenness by Pstrągowski Proposition 2.36. Retracts were restored to the solid-perfect-even closure. The relative THH comparison was p-completed; at p=2 the established refinement is E₁, without claiming E_∞ impossibility. The precise j_{p,0} was specified. THH(S[x]) has no extra S[x] factor. Cyclonic comparison retains boundedness, geometric complex orientations and homological-evenness conditions. Number-field inversion requires 6|Δ and disc(F)|Δ independently, rather than the stronger 6·disc(F)|Δ. The unit Habiro test uses ℤ[1/2] to satisfy 2 invertible.

## Closure gaps and supplier boundaries

### R1: Unbounded mixed complexes and Laurent product totalization

RT.1/mixed-complex and the Lean carrier are ℕ-graded, whereas RT.2/mixed-complexes-are-circle-modules claims all D(k)^{BT}. Plan a ℤ-graded mixed-complex definition with degree +1 B and degree −1 b, its derived localization, and CP_n=colim_r Π_{i≥−r}M_{n+2i}. Give unbounded examples separating Laurent series from unrestricted doubly infinite products. This is a key-definition gap, not a proof refinement.

Needed by: `RT.1/mixed-complex`, `RT.1/cyclic-homology`, `RT.2/mixed-complexes-are-circle-modules`.

### R2: Cyclic Morita enhancement and cyclic shuffle

DGAInfinity 8–9 supplies Hochschild Morita invariance, not the mixed/cyclic enhancement. The nonunital matrix corner fails B/degeneracies. Supply the categorical cyclic-bar enhancement of a progenerator equivalence and a classical cyclic-shuffle source covering flat noncommutative algebras; AMMN/BMS commutative derived products do not by themselves supply this interface.

Needed by: `RT.1/morita-invariance`, `RT.1/external-products`.

### R3: Base-change hypotheses and the smooth HKR reduction

Weibel–Geller Theorem 2.1 changes A→B and coefficients over a fixed ground ring; it is not the asserted change of ground ring k→k′. Their étale HH descent does not automatically transport HC⁻ or HP through infinite products/limits. Check the actual cyclic base-change theorem, scope any completed comparisons, and import the smooth étale-chart reduction plus the DD.1 Koszul node (now a direct prerequisite).

Needed by: `RT.1/base-change`, `RT.1/etale-base-change`, `RT.1/hkr-theorem`.

### R4: General coherent action Kan extensions and parametrized diagrams

EDS E3/left-kan-extension-along-a-full-inclusion does not apply to BG→*, which is not a full inclusion. E0 restricts straightening to its listed diagram shapes. Request coherent left/right Kan extension along BG→*, and the arbitrary space-indexed diagram range required for parametrized Tate, with pointwise formulas and Beck–Chevalley, rather than treating the ordinary functor prototype as a supplying theorem.

Needed by: `RT.2/spectra-with-action`, `RT.2/homotopy-orbits-fixed-points`, `RT.2/parametrised-tate`, `RT.2/cyclic-realisation`.

### R5: Homotopy-coherent equalizers and coalgebra/coreflection prototypes

The Lean ordinary categories and equalities of morphisms model strict diagrams, not the homotopy-coherent lax equalizer and mapping-space universal properties of NS18. RT2G.Presentable means only completeness/cocompleteness, not accessibility. The colimit-preserving F hypothesis is corrected, but the real presentable ∞-category interface and coherent inverse towers are still needed. Do not replace them by bare Prop fields.

Needed by: `RT.2/lax-equalizer`, `RT.2/cyclotomic-spectrum`, `RT.2/genuine-cyclotomic-spectrum`, `RT.2/endofunctor-coalgebras`, `RT.2/genuine-cyclotomic-coreflection`.

### R6: Stable-category K-theory and E_1-ring model comparisons

GeneralAlgebraicKTheory K.2/functorial-K-theory-of-a-ring covers discrete unital rings; K.6/nonconnective-spectrum-and-derived-invariance covers Frobenius pairs. Neither cited statement alone supplies K and IK of arbitrary small stable ∞-categories or connective E_1-rings. Request exact model comparisons, functorial Perf interfaces and localization scope from their owner. RT.5 must supply the motives/corepresentability construction used by the cyclotomic trace, with a direct requested prerequisite.

Needed by: `RT.3/localizing-invariants`, `RT.3/dennis-trace`, `RT.3/cyclotomic-trace`, `RT.3/trace-uniqueness-multiplicative`, `RT.3/relative-trace`, `RT.3/stable-k-theory-thh`, `RT.3/stable-tc-thh`, `RT.3/dgm-theorem`, `RT.3/kinv-truncating`, `RT.3/truncating-excision`, `RT.3/tower-square`.

### R7: THH with bimodule coefficients and categorical trace

THH(A,M), the connective bimodule category and split square-zero extension are hidden helper carriers in Lean, not definitions in the packet. Add target-level nodes or precise owner imports for their data, functoriality, bar realization and trace comparison. THH(A) with no coefficients is not the supplying definition.

Needed by: `RT.3/stable-k-theory-thh`, `RT.3/stable-tc-thh`.

### R8: Raskin convergence definitions

The old generic nil-convergent derivative criterion was replaced by Raskin Proposition 5.5.3 and Corollary 2.11.7. Still plan pseudo-extensibility (2.11.2), Postnikov convergence (5.5.1), and infinitesimal sifted-colimit preservation on the category of square-zero extensions (5.5.2). The Taylor tower is expressly omitted by Raskin Remark 2.1.1; no general first-derivative-only convergence theorem follows from the old proof sketch.

Needed by: `RT.3/goodwillie-calculus`, `RT.3/dgm-convergence`, `RT.3/dgm-theorem`.

### R9: Coherent tower and general quasisyntomic descent interfaces

The cited H.6 Milnor/tower statement and PR.2 prism-relative descent are narrower than the coherent spectrum tower and general qSyn site used here. RT.6 is already a named stage prerequisite but must supply BMS motivic/syntomic filtration and general qSyn descent. Keep the DD.0 quasisyntomic Tor-amplitude and bounded-torsion hypotheses when stating the graded square; the Lean signature explicitly omits the Tor-amplitude condition.

Needed by: `RT.3/tower-square`, `RT.3b/graded-beilinson-square`.

### R10: Stable E_∞ Adams operations

The existing recorded gap remains: unstable λ/Adams operations on K(X) do not alone produce a stable multiplicative operation on KU[1/k]. Give a cited E_∞ construction and prove ψ^k(β)=kβ with the required inversion. No integral periodic ring map with β↦kβ exists for nonunit k.

Needed by: `RT.4:topological/adams-operations-spectra`.

### R11: Graded/derived HKR for THH over KU

RT.1 HKR is for ordinary smooth algebras. The rational Q[β^{±1}] spectrum calculation needs the graded/derived HKR interface, with degree conventions and the circle action. Cite or import that interface rather than apply the ordinary degree-zero statement literally.

Needed by: `RT.4:topological/relative-thh-ku`.

### R12: Light solid spectra, duality and noncommutative module pairing

VS2 supplies solid abelian groups, not the complete light spectral extension. Keep the existing unpublished-source gap. For an E_1-ring, a left-module category is not generally monoidal over R; trace-class evaluation uses a right-module dual tensored with a left module. The Lean monoidal instance for all SolidMod R is a prototype requiring correction or an E_2/commutative restriction.

Needed by: `RT.4:q-Hodge/solid-spectra`, `RT.4:q-Hodge/nuclear-objects`.

### R13: Perfect even modules, even flatness and homological evenness

Plan the perfect-even and solid-perfect-even sites (including retracts), even flat modules as filtered colimits of perfect evens, faithful even flatness for a ring map, homological evenness as vanishing odd even sheaves, and Wagner Assumption 2.13(R). These are key definitions, not an instruction to split Lemmas 2.14–2.16. The Lean injectivity predicates do not imply actual faithful even flatness. Descent is after completion and solid descent needs nuclear homologically even M; π-even discrete modules do give homological evenness, while point-evaluated homotopy cannot replace condensed homotopy sheaves.

Needed by: `RT.4:q-Hodge/perfect-even-filtration`, `RT.4:q-Hodge/solid-even-filtration`, `RT.4:q-Hodge/solid-thh-even-filtration`.

### R14: Synthetic finite cyclic fixed points, norm and Tate

AR24 Definition 2.61 and Construction 2.63 provide a filtered finite-C_n norm/Tate functor, distinct from the circle functor already named by node even-circle-fixed-points. It is used in Wagner 3.16 and 5.46 but has no node or supplying import. Plan it with residual action, lax monoidality, induced vanishing and truncation hypotheses. Even-circle underlying fixed-point comparisons need AR24 Lemma 2.75(iv)–(vi); completeness/exhaustiveness alone is not its theorem. The primary source is now listed.

Needed by: `RT.4:q-Hodge/even-circle-fixed-points`, `RT.4:q-Hodge/tc-minus-m`, `RT.4:q-Hodge/cyclonic-even-filtrations`.

### R15: Spherical/cyclonic coherence hypotheses

The suggested spherical-lift and Adams-operation carriers do not encode the source’s compatible per-prime E_2/E_1 lifts and (A_2) coherences. State actual A_2 data, composition/divisibility compatibility and the homological-even/complex-orientable fixed-point hypotheses before using Wagner 5.46 and 5.63. An arbitrary sequence of maps ψ:ℕ→End(S_A) is not such data. Preserve bounded-below ku construction before β inversion; use an in-scope R=A=ℤ[1/2] example for 5.63.

Needed by: `RT.4:q-Hodge/spherical-lift`, `RT.4:q-Hodge/global-even-filtration`, `RT.4:q-Hodge/q-hodge-multiplicativity`, `RT.4:q-Hodge/cyclonic-spectrum`, `RT.4:q-Hodge/cyclonic-ku`, `RT.4:q-Hodge/tc-minus-m`, `RT.4:q-Hodge/cyclonic-even-filtrations`, `RT.4:Habiro-comparison/twisted-q-hodge-comparison`, `RT.4:Habiro-comparison/habiro-comparison-theorem`.

### R16: Faithfulness of topological representability on based spaces

The disconnected reduced theory requires [X,ℤ×BU]_* (corrected). The based compact-Hausdorff formulation must specify a nondegenerate/cofibrant basepoint or an equivalent derived mapping convention; the present Lean pointed homotopy classes omit that condition. S⁰ detects the component/rank error.

Needed by: `RT.4:topological/bu-representability`.

The original six gaps remain recorded. Their wording about unread or undecomposed proofs is inherited provenance, not a new requirement for lemma-level splitting. The Raskin source was read more precisely in this review and its actual missing definitions are R8. The revised worker must reconcile those old gap descriptions and the reader with this disposition.

### Seven added requests

- **EnhancedDerivedSheaves:E3**: Left AND right coherent Kan extensions along BG→* for a small group anima G, in Sp and D(R), with orbits⊣trivial⊣fixed and pointwise slice formulas; E3’s current full-inclusion theorem does not apply. Needed by: `RT.2/spectra-with-action`, `RT.2/homotopy-orbits-fixed-points`, `RT.2/cyclic-realisation`.
- **EnhancedDerivedSheaves:E0**: Straightening and coherent sections for arbitrary small space-indexed diagrams and their slices used by parametrized Tate, and coherent inverse towers of spectra; identify the size bounds and Beck–Chevalley theorem. Current restricted diagram-shape statement is insufficient. Needed by: `RT.2/parametrised-tate`, `RT.3/tower-square`.
- **DerivedDeRhamCohomology:DD.0**: A cited smooth étale-chart/local polynomial comparison sufficient to transfer the Koszul HKR calculation to arbitrary smooth finitely presented commutative base-ring algebras; Algebra.Smooth and smooth-cotangent alone supply no such chart theorem. Needed by: `RT.1/hkr-theorem`.
- **GeneralAlgebraicKTheory:K.4**: Functorial Waldhausen/Perf K-theory on connective E_1-rings and small idempotent-complete stable ∞-categories, agreeing with the cited discrete K.2 ring model and preserving split-exact sequences; give the comparison theorem rather than assume equality of models. Needed by: `RT.3/dennis-trace`, `RT.3/cyclotomic-trace`, `RT.3/stable-k-theory-thh`, `RT.3/stable-tc-thh`, `RT.3/dgm-theorem`.
- **GeneralAlgebraicKTheory:K.6**: Extension/comparison of the Frobenius-pair IK spectrum with nonconnective K of Cat^perf_∞ and spectral Perf(A), functorial in exact functors and localizing on Verdier exact sequences; the current Frobenius-pair declaration has narrower input. Needed by: `RT.3/localizing-invariants`, `RT.3/cyclotomic-trace`, `RT.3/kinv-truncating`, `RT.3/truncating-excision`.
- **RefinedTraceMethods:RT.5**: The universal localizing motives category and corepresentability of nonconnective K, with the no-filtered-colimit convention used by Hesselholt–Nikolaus and comparison to BGT’s filtered-colimit variant, furnishing the construction of K→TC. Needed by: `RT.3/cyclotomic-trace`, `RT.3/trace-uniqueness-multiplicative`.
- **RefinedTraceMethods:RT.6**: General BMS quasisyntomic sheaves, motivic/syntomic filtrations and descent on p-complete p-torsion-free qSyn rings, compatible with DD.0’s Tor-amplitude condition and the integral de Rham quotient-reduction map in AMMN Theorem 6.17. PR.2’s descent for a fixed prism is not the general site interface. Needed by: `RT.3b/graded-beilinson-square`.

Each added request is also represented by a direct requested-stage prerequisite on its consumers. Existing owner imports remain in place. In particular, H.5 already supplies the spectra, smash and E_∞ foundations (63-node spectra packet; RS-33 accepted on 2026-09-29); no duplicate S-delooping or spectra development was requested. DGAInfinity layers 8–9 supply Hochschild chains and Hochschild Morita theory, not their cyclic enhancement. DD.0 supplies cotangent objects and DD.2 de Rham theory; DD.1 owns Koszul. General K’s discrete-ring and Frobenius-pair declarations do not silently supply all E₁/stable-category models. PR.2 prism-relative descent is narrower than RT.6’s general qSyn interface. The classical general TR comparison remains RT.2-owned, and its Witt specialization is L.4-owned. HR.6 supplies the Habiro degree-zero identification, without duplication here. The henselian-pair square belongs to the proposed Part II, with no RT.3→Part II→RT.3 cycle.

### Coverage changes

| Stage | Coverage | Remaining at target level |
|---|---|---|
| RT.1 | partial | R1: plan ℤ-graded mixed complexes, their derived localization and Laurent product totalization, reconciling RT.2’s all-D(k) circle-module comparison. R2–R3: source and close the cyclic Morita/shuffle and base-change interfaces; these are not requests for lemma-level splitting. |
| RT.2 | partial | R1: the unbounded circle/mixed-complex comparison must use the corrected RT.1 carrier. R7: provide THH with bimodule coefficients and its categorical trace API used by the DGM derivative targets. R4–R5: resolve the precise Kan/coherence supplier requests. The general classical comparison stays owned here; L.4 owns its Witt specialization. |
| RT.3 | partial | R7–R8: plan the connective bimodule/split-square-zero/coefficient-THH interfaces and Raskin pseudo-extensibility, Postnikov convergence and infinitesimal sifted-colimit preservation. R6: obtain the precise K/IK E_1-ring and stable-category model comparisons and RT.5 motives import. The henselian-pair square remains owned by the separate Part II. |
| RT.3b | planned | R9: RT.6 must supply the general motivic/quasisyntomic interface; implement the integral low-weight reduction-fibre formula and the actual omitted Tor-amplitude condition. All stage targets already have nodes. |
| RT.4 | partial | The q-Hodge substage remains partial because of the unplanned key definitions R13–R15; its other substages retain target-level planned status with their recorded proof/interface gaps. |
| RT.4:topological | planned | Real K-theory KO/BO, the Atiyah–Segal completion theorem, p-adic Adams operations Ψ^k (k ∈ ℤ_p^×) and the universal Chern character requested by KTheoryFiniteLocalFields, ArithmeticKTheory, MotivicEtaleKTheory and BorelRegulators are proposed as a Part II (restructure), not planned here. The E_∞-structure of the stable Adams operations on KU[1/k] is recorded with a gap (no read source states it). |
| RT.4:q-Hodge | partial | R13: plan perfect even modules/sites, actual even and faithful even flatness, homological evenness and Assumption 2.13(R), with their API and discriminating tests. R14: plan synthetic finite-C_n fixed points, norm and Tate (AR24 §2.3), including residual actions and Lemma 2.75’s underlying comparison hypotheses. R15: specify compatible spherical/cyclonic lift data and A_2; retain the explicit source proof gaps without demanding lemma decomposition of the thesis. |
| RT.4:Habiro-comparison | planned | R14–R15: use the q-Hodge substage’s synthetic finite cyclic and compatible Adams-lift interfaces, retaining 2∈R× for Theorem 5.63. The existing source sketch of Theorem 5.51 is recorded as a proof gap; no lemma-level split is required at this granularity. |

## Baseline audit

All names and statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No baseline entry was removed, replaced or edited. Each is used as the stated ingredient, not as a claim that it already supplies the new ∞-categorical or spectral target. The additive Grothendieck construction generated by `to_additive` is the relevant form for vector-bundle direct sum; the existing multiplicative abbreviation is a valid citation to that source, not a missing-name error.

| Declaration | Pinned module | Confirmed scope |
|---|---|---|
| `mathlib:Algebra.Etale` | [Mathlib/RingTheory/Etale/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Etale/Basic.lean) | An R-algebra A is étale if it is formally étale and of finite presentation. |
| `mathlib:Algebra.GrothendieckGroup` | [Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean) | The Grothendieck group of a commutative monoid M, as the localisation of M at the top submonoid; @[to_additive] generates the additive form Algebra.GrothendieckAddGroup, which is the one applied to (Vect_ℂ(X), ⊕). |
| `mathlib:Algebra.Smooth` | [Mathlib/RingTheory/Smooth/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/Basic.lean) | An R-algebra A is smooth if it is formally smooth and of finite presentation. |
| `mathlib:AlgebraicTopology.alternatingFaceMapComplex` | [Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean) | The alternating face map complex functor SimplicialObject C ⥤ ChainComplex C ℕ of a preadditive category C, with differential Σ(−1)^i d_i. |
| `mathlib:AlgebraicTopology.normalizedMooreComplex` | [Mathlib/AlgebraicTopology/MooreComplex.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/MooreComplex.lean) | The normalized Moore complex functor SimplicialObject C ⥤ ChainComplex C ℕ of an abelian category. |
| `mathlib:CategoryTheory.SimplicialObject` | [Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean) | Simplicial objects SimplexCategoryᵒᵖ ⥤ C in a category C. |
| `mathlib:CategoryTheory.Tor` | [Mathlib/CategoryTheory/Monoidal/Tor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Tor.lean) | The left-derived functors Tor_n of the tensor product in a monoidal abelian category with enough projectives. |
| `mathlib:DividedPowerAlgebra` | [Mathlib/RingTheory/DividedPowerAlgebra/Init.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean) | The divided power algebra of an R-module M, as a quotient of the polynomial ring on symbols x^[n] m. |
| `mathlib:ExteriorAlgebra.exteriorPower` | [Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean) | The n-th exterior power ⋀[R]^n M as a submodule of the exterior algebra. |
| `mathlib:HomologicalComplex₂.total` | [Mathlib/Algebra/Homology/TotalComplex.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/TotalComplex.lean) | The total complex of a bicomplex, built from coproducts (the direct-sum totalisation); no product totalisation exists. |
| `mathlib:KaehlerDifferential` | [Mathlib/RingTheory/Kaehler/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | The module of Kähler differentials Ω[S⁄R] of an R-algebra S, as I/I² for the diagonal ideal I. |
| `mathlib:Matrix.trace` | [Mathlib/LinearAlgebra/Matrix/Trace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Trace.lean) | The trace of a square matrix. |
| `mathlib:Module.Flat` | [Mathlib/RingTheory/Flat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean) | Flatness of a module over a ring. |
| `mathlib:MoritaEquivalence` | [Mathlib/RingTheory/Morita/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Morita/Basic.lean) | A Morita equivalence between R-algebras A and B: an R-linear equivalence of module categories ModuleCat A ≌ ModuleCat B. |
| `mathlib:VectorBundle` | [Mathlib/Topology/VectorBundle/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/VectorBundle/Basic.lean) | Topological vector bundles over a field with fibre model F: a fibre bundle whose trivialisations are fibrewise linear with continuous coordinate changes. |
| `mathlib:WittVector` | [Mathlib/RingTheory/WittVector/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean) | The ring of p-typical Witt vectors 𝕎 R. |
| `mathlib:WittVector.frobenius` | [Mathlib/RingTheory/WittVector/Frobenius.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Frobenius.lean) | The Witt vector Frobenius 𝕎 R →+* 𝕎 R. |
| `mathlib:WittVector.verschiebung` | [Mathlib/RingTheory/WittVector/Verschiebung.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Verschiebung.lean) | The Verschiebung 𝕎 R →+ 𝕎 R. |
| `mathlib:tateCohomology` | [Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean) | Tate cohomology Ĥ^n(G, M) ∈ ModuleCat R of a representation M of a finite group G, from the Tate complex built with the norm map. |
| `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven` | [TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean) | For a finite group G generated by g (hence cyclic), tateCohomology M n for every even n is isomorphic to the homology of the norm/(g − 1) complex of M, independently of n: two-periodicity in even degrees. |

`data/library-coverage.json` was checked for every scoped stage. Existing Kähler/exterior/tensor constructions, normalized Moore complexes, vector bundles, Grothendieck groups, Morita equivalence, Witt operations, Tate cohomology and the finite cyclic even Tate comparison are imported at their actual scopes. Their presence does not close the unbounded derived, stable ∞-categorical, multiplicative or coherent interfaces recorded above.

## Public-source audit and source issues

All 30 original public PDFs were obtained. Twenty-nine matched the author’s recorded hashes. The original HKR URL was replaced by the public Rochester mirror of the published paper, and its newly obtained PDF hash was recorded; printed Theorem 5.2 (p.395) was checked. Loday–Quillen’s scanned mathematical pages and Weibel–Geller’s printed pp.368/374 were visually inspected because text extraction was insufficient. The review added Antieau–Riggenbach v1 and read its filtered circle/finite-cyclic norm constructions and underlying comparison Lemma 2.75; this exposes the missing R14 interface rather than pretending an existing circle norm supplies finite C_n Tate.

URLs, editions, read sections and full SHA-256 hashes are recorded in the packet. The following table identifies the actual public files; hash prefixes are for quick comparison with those full records.

| Source | Public file | SHA-256 prefix |
|---|---|---|
| `ammn-20` | [arXiv:2003.12541v2 (29 Sep 2021); numbering checked against v1 (Corollary 3.9 exists only in v2)](https://arxiv.org/pdf/2003.12541v2) | `2a0224b2e8b7c5f1` |
| `bgt-13` | [arXiv:1001.2282v4 (5 Feb 2013); published Geom. Topol. 17 (2013) 733–838](https://arxiv.org/abs/1001.2282v4) | `08a8ae7fb5715d82` |
| `bgt-14` | [arXiv:1103.3923v3 (1 Jul 2015)](https://arxiv.org/abs/1103.3923v3) | `3bf564f86fda5425` |
| `blumberg-mandell-12` | [arXiv:0802.3938v4 (24 May 2012); published Geom. Topol. 16 (2012) 1053–1120](https://arxiv.org/abs/0802.3938v4) | `db3f296fe7e8b5e5` |
| `bms2-19` | [arXiv:1802.03261v2 (9 Apr 2019); published Publ. Math. IHÉS 129 (2019) 199–310; arXiv pagination used](https://arxiv.org/pdf/1802.03261) | `b2338ef19714f39a` |
| `cmm-21` | [arXiv:1803.10897v2 (20 Jul 2020); published J. Amer. Math. Soc. 34 (2021) 411–473](https://arxiv.org/abs/1803.10897v2) | `ad23c1d7b818b85e` |
| `cortinas-06` | [arXiv:math/0111096v5 (3 Oct 2005); published Invent. Math. 164 (2006) 143–173](https://arxiv.org/abs/math/0111096v5) | `3496320585a1415a` |
| `devalapurkar-raksit-25` | [arXiv:2505.02218v2 (20 Jul 2026)](https://arxiv.org/abs/2505.02218) | `9634c4c7b019b4eb` |
| `devalapurkar-thesis` | [PhD thesis, Harvard University (PDF from the author's page, version of 4 Sep 2026); printed page numbers](https://sanathdevalapurkar.github.io/files/thesis.pdf) | `934a902f83a40445` |
| `dundas-97` | [Acta Math. 179 (1997) 223–242 (published scan)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf) | `4c40669f0a20f2f5` |
| `gepner-snaith-09` | [arXiv:0712.2817v3 (27 May 2010); published Doc. Math. 14 (2009) 359–396](https://arxiv.org/pdf/0712.2817) | `b80f305dcf977825` |
| `ginzburg-05` | [arXiv:math/0506603v1 (29 Jun 2005)](https://arxiv.org/pdf/math/0506603) | `d128d33a9cc0376f` |
| `hatcher-vbkt` | [Version 2.2 (November 2017); printed page numbers](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf) | `04282b30dfa63051` |
| `hesselholt-nikolaus-19` | [arXiv:1905.08984v1 (22 May 2019); Handbook of Homotopy Theory (2020)](https://arxiv.org/abs/1905.08984v1) | `233e53dcf91c3812` |
| `hkr-62` | [Trans. Amer. Math. Soc. 102 (1962) 383–408 (published scan)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf) | `ff575d981f2d5233` |
| `hoyois-15` | [arXiv:1506.07123v2 (21 Apr 2018)](https://arxiv.org/pdf/1506.07123) | `a51aa52ec74e195e` |
| `hrw-22` | [arXiv:2206.11208v3 (19 Oct 2025)](https://arxiv.org/abs/2206.11208) | `8c79a5fa38c2e5be` |
| `land-tamme-19` | [arXiv:1808.05559v3 (8 Nov 2019); published Ann. of Math. 190 (2019) 877–930](https://arxiv.org/abs/1808.05559v3) | `59adf6a7d0a8b20d` |
| `lmmt-24` | [arXiv:2001.10425v5 (18 Dec 2023); published J. Amer. Math. Soc. (2024)](https://arxiv.org/abs/2001.10425v5) | `9eabee34fd018d50` |
| `loday-quillen-84` | [Comment. Math. Helv. 59 (1984) 565–591 (published scan)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf) | `461c68509eaeb1f9` |
| `lurie-ec2` | [Version of 26 April 2018 (author's page)](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf) | `741e87d7eed621a2` |
| `lurie-ha` | [Version of 18 September 2017 (author's page)](https://www.math.ias.edu/~lurie/papers/HA.pdf) | `112b145a95a62dae` |
| `may-concise` | [Revised author's PDF of the 1999 University of Chicago Press edition](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf) | `6724f02748ed1f2f` |
| `mccarthy-97` | [Acta Math. 179 (1997) 197–222 (published scan)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf) | `e6389a7a3642a283` |
| `nikolaus-scholze-18` | [Acta Math. 221 (2018) 203–409 (published version; printed pages), compared with arXiv:1707.01799v2](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf) | `8b1856fa8faefa3e` |
| `pstragowski-23` | [arXiv:2304.04685v2 (24 Oct 2024)](https://arxiv.org/abs/2304.04685) | `37cd80d462acf94f` |
| `raskin-18` | [arXiv:1807.06709v1 (17 Jul 2018)](https://arxiv.org/abs/1807.06709v1) | `3ae1b7a88baa13c9` |
| `wagner-habiro-25` | [arXiv:2510.04782v2 (8 Oct 2025); Corollary 3.13 numbering identical in v1](https://arxiv.org/abs/2510.04782) | `591d0bdf2c48d12f` |
| `wagner-ku-25` | [arXiv:2510.06057v1 (7 Oct 2025)](https://arxiv.org/abs/2510.06057) | `fe9d7d71478eb546` |
| `weibel-geller-91` | [Comment. Math. Helv. 66 (1991) 368–388 (published scan)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf) | `215203519a8f2790` |
| `antieau-riggenbach-24` | [arXiv:2411.19929v1 (29 November 2024)](https://arxiv.org/pdf/2411.19929v1) | `e35d20715e547f5e` |

Source issues remain in place with explicit review objects, including the rejected allegation. E9 was cross-checked against the publicly available [Cortiñas infinitesimal K-theory manuscript](https://arxiv.org/pdf/math/0001138v1), the already listed Cortiñas excision paper and the published CMM attribution. It is a version-specific citation correction, not a new excision theorem here. The already registered NS II.3.4 boundedness error in PAPER-NS18/E1 was checked with its KU counterexample and not entered again as a duplicate source issue.

| Issue | Verdict | Reason |
|---|---|---|
| RefinedTraceMethods/E1 | confirmed | B.5 and B.18 give a circle action on cyclic realization; B.19 prints Bℤ as target and calls the cyclic input paracyclic. These are convention misprints in the read Acta text. |
| RefinedTraceMethods/E2 | confirmed | IV.4.12 is about Hℤ-modules with T-action. The proof’s Hℤ^{hℤ} and reversed base-change arrow disagree with that context and the displayed tensor construction. |
| RefinedTraceMethods/E3 | confirmed | The subgroup chain is H⊆H′, so the residual quotient is H′/H; the linear-isometry space has target V. |
| RefinedTraceMethods/E4 | confirmed | Definition 2.14 explicitly precomposes β with the trace; types are K→TC→HP, hence β∘tr. |
| RefinedTraceMethods/E5 | rejected | Not established: Remark 6.23 explicitly discusses left Kan extension from the p-torsion-free subcategory. The narrower hypotheses of Theorem 6.22 alone do not disprove Theorem F. Do not register this allegation as a confirmed error. |
| RefinedTraceMethods/E6 | confirmed | Theorem E starts with x∈K_j and its lift has the same degree. The printed i is inconsistent with Theorem 4.14. |
| RefinedTraceMethods/E7 | confirmed | In Remark 4.14 the graded object is evaluated at B; the placeholder − in L_{−/A} should be B in that display. |
| RefinedTraceMethods/E8 | confirmed | Raskin Theorem 2.12.1(2) identifies the derivative with THH(A,M)[1]. For A=S this is ΣM; the shift does not affect the acyclicity argument. |
| RefinedTraceMethods/E9 | confirmed | The read CMM v2 bibliography [19] is Infinitesimal K-theory, whose main statements describe infinitesimal hypercohomology and nilpotent deformation invariance. Cortiñas (2006), Main Theorem 0.1 and Corollary 0.2, supplies the rational bi-relative excision obstruction theorem. The attribution here needs that latter paper; the published CMM Theorem 4.2 credits the 2006 work. |
| RefinedTraceMethods/E10 | confirmed | The multiplicative lifting/uniqueness result is Theorem 1.12; Corollary 1.15 states the Perf comparison. |
| RefinedTraceMethods/E11 | confirmed | The K in Lemma 10.5 is connective K-theory. The introduction distinguishes additive connective K from localizing nonconnective K, so “additive” is the consistent word. |
| RefinedTraceMethods/E12 | confirmed | Both read versions of arXiv:2510.04782 label the number-field identification Corollary 3.13; 3.12 is an example. |
| RefinedTraceMethods/E13 | confirmed | Paragraph 4.7 defines ψ⁰; 4.6 defines a different comparison. The printed cross-reference is off by one. |
| RefinedTraceMethods/E14 | confirmed | Confirmed only as a hypothesis-definition gap: “solid homologically flat” has no definition at this use, and the proof invokes even-flat properties. A silent unconditional substitution is not justified; the revised correction requires a definition or sufficient even-flat hypothesis. |
| RefinedTraceMethods/E15 | confirmed | Version 2.2 p.110 names Proposition 2.3 for the ordinary-cohomology splitting principle; that principle is Proposition 3.3 on p.80. Corollary 2.3 concerns K(S²). |

E5 is **not confirmed** merely because Theorem 6.22 has narrower input: AMMN Remark 6.23 explicitly discusses the left Kan extension from p-torsion-free rings. E14 is confirmed as an undefined-hypothesis gap; the correction requires defining the intended condition or imposing a sufficient actual even-flat condition, without asserting that an unconditional substitution is equivalent.

## Handed red-team findings

| Finding | Disposition | Independent result |
|---|---|---|
| RT-AREA-ktheory-2/3 | needs_changes | The image-of-J, Devalapurkar and odd-prime/p=2 targets are present. Corrected the precise j_{p,0}, p-completion and E∞ versus E₁ scope. R13–R15 still leave real lift/filtration interfaces missing; the thesis proof gap is retained without a lemma-splitting demand. |
| RT-AREA-ktheory-2/30 | needs_changes | Solid, nuclear, perfect-even, gluing and étale-lift targets are present, but actual perfect-even sites, even flatness, homological evenness, Assumption 2.13 and finite-C_n synthetic norm/Tate are not key-definition nodes. Corrected completion, retracts and Whitehead hypotheses; q-Hodge is partial. |
| RT-AREA-ktheory-2/31 | checked | Read the HR.6 degree-zero supplier. Habiro comparison imports it and HR.5 rather than redefining them. Existing aggregate-stage cycle proposal is retained; requests should use the precise topological substage where appropriate. |
| RT-AREA-ktheory-2/32 | checked | H.5’s accepted spectra plan supplies smash, ring/module spectra and operadic E∞ inputs; RS-33 was accepted 2026-09-29. RT imports it, without a duplicated spectra or S-delooping foundation. |
| RT-AREA-ktheory-2/33 | checked | RT.2 owns general genuine/modern TR comparison. L.4 owns the Hesselholt–Madsen Witt specialization. Removed the latter from RT.2’s own planned theorem while retaining the downstream convention test and refining FV to its residual norm scope. |
| RT-AREA-ktheory-2/35 | checked | Henselian rigidity and the K-theoretic henselian Beilinson square remain Part II-owned. RT.3’s tower square is continuity for noetherian I-complete R with R/p F-finite, now corrected; no henselian inference from DGM is made. |
| RT-AREA-ktheory-2/37 | checked | DD.0 cotangent and DD.2 de Rham interfaces remain imports. Added DD.1’s actual Koszul node directly to HKR and removed the circular later-filtration appeal. The needed smooth chart is a precise DD.0 request. |
| RT-AREA-ktheory-2/43 | needs_changes | BU, λ/Adams, Chern classes and character targets are present. Fixed disconnected based representability, Whitney coproduct and product-valued character. Stable E∞ Adams construction remains the explicit R10 gap; KO/BO and real/p-adic extensions remain proposed Part II work. |
| RT-AREA-ktheory-2/44 | needs_changes | DGA8/9 provide Hochschild chains/normalization and Hochschild Morita, not a cyclic enhancement. Removed the nonunital mixed-complex corner inverse; R2 requires the categorical cyclic enhancement and a source for the noncommutative cyclic shuffle scope. |
| RT-AREA-ktheory-2/46 | needs_changes | Ownership direction is correct and no algebraic K foundation is duplicated. The exact discrete K.2/Frobenius K.6 supplying statements are narrower than arbitrary E₁ rings and Cat^perf∞; precise K.4/K.6 comparisons and RT.5 motives requests were added (R6). |

## Node change register and reader synchronization

Only the packet, suggested file, this report and this job’s handoff are edited. The reader is not an authorized deliverable for this review, so the following table is an exact synchronization request for the revision/orchestrator. It lists **every edited node** and **every changed node field**; the committed packet is the replacement text for those fields, and the PR diff preserves the exact previous values. There are 54 edited nodes and 91 changed fields. Unchanged fields and source excerpts need no wholesale rewrite. A node corrected in place can still have an unverifiable review verdict when its remaining gap is unresolved.

| Node | Changed fields to copy from packet | Reader section line | Disposition |
|---|---|---|---|
| `RT.1/cyclic-homology` | `statement` | 381 | R1 unresolved (see gap above); clear field corrections retained. |
| `RT.1/sbi-sequence` | `acceptance` | 436 | Ground-ring SBI test corrected: HH_{2m}=0 for m≥1, S is an isomorphism in the positive even range; I is the degree-zero isomorphism. |
| `RT.1/morita-invariance` | `statement`, `proofSteps` | 459 | R2 unresolved (see gap above); clear field corrections retained. |
| `RT.1/hkr-theorem` | `proofSteps`, `prerequisites` | 635 | R3 unresolved (see gap above); clear field corrections retained. |
| `RT.1/b-equals-d` | `statement` | 663 | B=d and the inverse antisymmetrization are on Hochschild homology; no strict inverse mixed-complex chain map is asserted. |
| `RT.1/hkr-filtration` | `statement`, `proofSteps` | 709 | BMS2 §4.4 corrected to complete descending Fil^n, gr^n=cofib(Fil^{n+1}→Fil^n), and actual bounded-torsion/p-completely-quasismooth scope. |
| `RT.1/hh-of-fp` | `statement`, `proofSteps` | 760 | Removed the THH homotopy-fixed-point p²-extension assertion from HH/HKR; the divided-power HH and cotangent computations retain their stated scopes. |
| `RT.2/spectra-with-action` | `prerequisites`, `api` | 807 | R4 unresolved (see gap above); clear field corrections retained. |
| `RT.2/homotopy-orbits-fixed-points` | `prerequisites` | 854 | R4 unresolved (see gap above); clear field corrections retained. |
| `RT.2/parametrised-tate` | `prerequisites` | 1096 | R4 unresolved (see gap above); clear field corrections retained. |
| `RT.2/circle-tate` | `tests` | 1119 | Circle norm uses ΣX_hT. Corrected non-example: the unshifted cofiber has wrong positive even homotopy for trivial Hℤ; zero natural maps do exist. |
| `RT.2/cyclic-realisation` | `prerequisites`, `tests` | 1191 | R4 unresolved (see gap above); clear field corrections retained. |
| `RT.2/edgewise-subdivision` | `statement`, `hypotheses`, `proofSteps` | 1239 | NS18 B.19 gives subdivision equivalence; B.20 gives a comparison, not a Tate/realization equivalence even with uniformly connective levels. |
| `RT.2/cyclotomic-frobenius-thh` | `statement`, `hypotheses`, `proofSteps` | 1364 | Frobenius realization now composes with the comparison of B.20; proof no longer assumes Tate preserves the realization. |
| `RT.2/tc-minus-and-tp` | `api` | 1721 | Removed unsupported rational equivalence of individual TC⁻/TP→HC⁻/HP maps. Infinite limits require their own hypotheses; the natural comparison maps remain. |
| `RT.2/topological-cyclic-homology` | `api` | 1771 | Integral TC filtered-colimit assertion removed. Exactness remains; connective TC/p colimit scope is CMM Theorem 2.7. |
| `RT.2/hz-module-circle-tate` | `hypotheses`, `proofSteps` | 1886 | NS18 IV.4.12 applies to all circle-equivariant Hℤ-modules. Removed invented boundedness/finite-generation restriction and invalid arbitrary-colimit proof step. |
| `RT.2/geometric-fixed-points` | `statement` | 2002 | Restricted the point-set Φ^G comparison to H=G; residual Φ^H still lives in G/H-spectra. |
| `RT.2/borel-completion` | `statement` | 2047 | Corrected the adjunction unit to id_{GSp}→B_G∘forget. The bare id→B_G statement had mismatched domains. |
| `RT.2/tr-and-genuine-tc` | `statement`, `proofSteps` | 2221 | Source scope and clear packet/signature corrections checked; see the correction register in the report. |
| `RT.2/endofunctor-coalgebras` | `statement`, `hypotheses`, `api`, `tests` | 2324 | R5 unresolved (see gap above); clear field corrections retained. |
| `RT.2/genuine-cyclotomic-coreflection` | `statement` | 2367 | R5 unresolved (see gap above); clear field corrections retained. |
| `RT.3/localizing-invariants` | `prerequisites` | 2500 | R6 unresolved (see gap above); clear field corrections retained. |
| `RT.3/cyclotomic-trace` | `acceptance`, `prerequisites` | 2598 | R6 unresolved (see gap above); clear field corrections retained. |
| `RT.3/trace-uniqueness-multiplicative` | `prerequisites` | 2650 | R6 unresolved (see gap above); clear field corrections retained. |
| `RT.3/relative-trace` | `statement`, `tests` | 2672 | R6 unresolved (see gap above); clear field corrections retained. |
| `RT.3/goodwillie-calculus` | `statement`, `hypotheses`, `proofSteps`, `acceptance`, `api`, `tests`, `sources` | 2718 | R8 unresolved (see gap above); clear field corrections retained. |
| `RT.3/stable-k-theory-thh` | `prerequisites` | 2762 | R7 unresolved (see gap above); clear field corrections retained. |
| `RT.3/stable-tc-thh` | `prerequisites` | 2788 | R7 unresolved (see gap above); clear field corrections retained. |
| `RT.3/dgm-convergence` | `statement`, `hypotheses`, `proofSteps`, `sources` | 2809 | R8 unresolved (see gap above); clear field corrections retained. |
| `RT.3/dgm-theorem` | `prerequisites` | 2831 | R8 unresolved (see gap above); clear field corrections retained. |
| `RT.3/goodwillie-rational` | `proofSteps` | 2862 | Relative Goodwillie rational theorem supported by Cortiñas (5)–(6) and LT §3. Removed the absolute rationalization/limit shortcut from the proof sketch. |
| `RT.3/kinv-truncating` | `prerequisites` | 2890 | R6 unresolved (see gap above); clear field corrections retained. |
| `RT.3/truncating-excision` | `prerequisites` | 2912 | R6 unresolved (see gap above); clear field corrections retained. |
| `RT.3/tower-square` | `statement`, `prerequisites` | 2939 | R9 unresolved (see gap above); clear field corrections retained. |
| `RT.3/hesselholt-nikolaus-assembly` | `statement`, `hypotheses` | 2963 | Replaced vague assembly claim by the connective Hesselholt–Nikolaus p-completed cofiber sequence; LMMT T(n)-localized extension stays separate. |
| `RT.3b/crystalline-trace-map` | `statement`, `api` | 3095 | β now lands in integral HP(R;ℤ_p); p inversion produces the quotient comparison. Composition order is β∘tr. |
| `RT.3b/beilinson-square-spectral` | `proofSteps` | 3142 | AMMN Beilinson proof now compares horizontal fibers via orbit terms; it does not infer individual rational TC⁻ or TP equivalences. |
| `RT.3b/reduction-quasi-isogeny` | `sources` | 3166 | Added actual AMMN Theorem 3.4 locator/statement to the quasi-isogeny definition citation; nilpotent π_0-surjection hypothesis retained. |
| `RT.3b/beilinson-square-ordinary` | `sources` | 3187 | Replaced the coefficient-convention locator by Corollary 3.9/display (19); this TC square holds for every associative ring, without henselian hypotheses. |
| `RT.3b/graded-beilinson-square` | `statement`, `proofSteps` | 3234 | R9 unresolved (see gap above); clear field corrections retained. |
| `RT.4:topological/bu-representability` | `statement`, `hypotheses` | 3408 | R16 unresolved (see gap above); clear field corrections retained. |
| `RT.4:topological/chern-classes` | `statement` | 3747 | Corrected primitive Chern classes to polynomial generators; Whitney coproduct is Δc_n=Σ c_i⊗c_{n−i}. |
| `RT.4:topological/chern-character` | `statement` | 3797 | Chern character target corrected to the product of even cohomology groups on general spaces; finite CW inputs recover the usual direct-sum range. |
| `RT.4:q-Hodge/perfect-even-filtration` | `statement`, `acceptance`, `api` | 4056 | R13 unresolved (see gap above); clear field corrections retained. |
| `RT.4:q-Hodge/solid-even-filtration` | `statement`, `api` | 4108 | R13 unresolved (see gap above); clear field corrections retained. |
| `RT.4:q-Hodge/even-circle-fixed-points` | `statement`, `sources` | 4157 | R14 unresolved (see gap above); clear field corrections retained. |
| `RT.4:q-Hodge/image-of-j` | `statement` | 4232 | Specified j_{p,0}=τ_{≥0}(KU_p^{hΓ_0}) from the thesis, retaining the chosen Adams subgroup; it is not an arbitrary image-of-J variant. |
| `RT.4:q-Hodge/devalapurkar-comparison` | `statement`, `acceptance` | 4300 | Restored p-completion in the relative THH carrier; odd-prime equivariant E_∞ comparison checked. Thesis proof is a recorded target-level gap, not a reason to demand lemma splitting. |
| `RT.4:q-Hodge/nikolaus-e1-equivalence` | `statement` | 4329 | Restored p-completion and clarified p=2: only the E_1 equivalence is established here, not a proof that an E_∞ refinement is impossible. |
| `RT.4:q-Hodge/raksit-polynomial-example` | `proofSteps` | 4564 | Removed extra S[x] factor: THH(S[x])=Σ∞_+B^cyN. Polynomial q-Hodge filtration is fil^0 separately and (q−1)^i/(q−1)^{i−1} for i≥1. |
| `RT.4:q-Hodge/cyclonic-even-filtrations` | `statement`, `hypotheses` | 4730 | R15 unresolved (see gap above); clear field corrections retained. |
| `RT.4:Habiro-comparison/habiro-comparison-theorem` | `acceptance` | 4816 | R15 unresolved (see gap above); clear field corrections retained. |
| `RT.4:Habiro-comparison/number-field-habiro` | `hypotheses` | 4864 | Corrected Δ hypothesis to 6\|Δ and disc(F)\|Δ independently; HR.6 degree-zero supplier read, avoiding a duplicated Habiro-ring definition. |

Additional reader synchronization:

- **Introduction, lines 3–10, and stage introductions:** replace the claim that every needed key definition already has a node with the precise five partial/three planned coverage above; distinguish a finished independent review from the partial input plan.
- **Conventions, lines 48–50, and RT.1 introduction, lines 110–124:** specify the finite-lower-bound Laurent totalization and distinguish the ordinary Hochschild shuffle from its cyclic correction. Remove the unqualified claim that the shuffle itself is a mixed-complex map; R2 remains unresolved.
- **Sources, lines 76–108:** synchronize the HKR public mirror and version/hash record; add Antieau–Riggenbach v1 with the read constructions and comparison conditions. Preserve explicit public version URLs for the original sources.
- **Prerequisite summaries:** incorporate all seven requested-stage edges and the direct DD.1 Koszul import; keep the precise ownership boundaries above rather than treating stage names as stronger supplier theorems.
- **Gaps and coverage at the end:** add R1–R16 and all seven precise requests; revise the old Raskin/decomposition prose to reflect the actual missing definitions and target-level standard. Do not reinterpret recorded sketch gaps as a requirement for lemma decomposition.
- **Habiro introduction, lines 4780–4784:** replace 6·disc(F)|Δ by the two divisibility hypotheses; synchronize the ℤ[1/2] unit test and compatible-lift conditions.
- **Mistakes found in the sources, final section:** mark E5 rejected rather than present it as an established error; qualify E14 as a definition/hypothesis gap with a sufficient-condition correction. Add the 14-confirmed/1-rejected dispositions and preserve the version-specific E9 explanation.

Other packet changes are fully enumerated here: status `complete`→`partial`; summary gains the honest coverage/verdict prefix; source metadata read dates are refreshed, HKR URL/hash replaced and AR24 added with sourceVersions; all 15 source issues receive review objects and E14’s correction is qualified; seven requests and their direct consumer edges are added; five coverage statuses/remaining lists and the other three remaining lists are revised; 16 gaps are added; all 10 red-team entries receive their independent disposition; and the 134-entry top-level review object is added. Baseline, scope, restructure proposals, upstream notes, node IDs/kinds, planet names and implementationStatus values are unchanged.

## Suggested Lean corrections and validation

The Lean edit register, including changes not already apparent from the packet field register:

- Add the review limitation note: ordinary categories are signature carriers, not ∞-categorical mapping spaces/coherence; identify the omitted interfaces.
- Remove RT1.matrixCorner and its false mixed-complex inverse clause, keeping the generalized-trace quasi-isomorphism and explaining the derived inverse.
- Reverse hkrFiltration arrows, set F 0 = HH, use cofib(F(n+1)→F n), and state connectivity of each descending term; correct the HH(𝔽_p/ℤ) doc attribution.
- Delete the false Tate/realization equivalence from edgewiseSubdivision and add RT2.edgewiseTateComparison with the actual arrow direction.
- Change TCminus.toHC from a rational-equivalence assertion to the pair of natural comparison maps; remove integral filtered-colimit preservation from TC.exact.
- Require PreservesColimits F in both Endofunctor.coreflection signatures, retaining the extra pullback/fully faithful right-adjoint conditions for the formula.
- Remove the unqualified FV=p clause from TR.relations; document the residual-norm statement and when the scalar formula applies.
- Correct GoodwillieDerivative.universal documentation to Raskin’s actual source hypotheses and omission limits; synchronize the linear example with identity on connective spectra.
- Replace the invented dgmConvergence documentation by Proposition 5.5.3, Corollary 2.11.7 and Theorem 5.6.1, explicitly stating the omitted pseudo-extensibility/convergence/infinitesimal-colimit conditions.
- Make beilinsonBeta integral in its target and adjust naturality, commutativity and the zero example; keep betaRational as the separately inverted comparison.
- Add the deRhamQuotMap carrier and replace the low-weight cofiber-is-quotient clause in gradedBeilinsonSquare by the shifted fibre of quotient reduction; correct the Proposition 6.21 doc attribution.
- Use ℤ×BU in based buRepresentability and disclose the omitted nondegenerate-basepoint condition.
- Complete both sides of perfectEvenFiltration.descent. Correct the perfect-even Whitehead and HRW comparison hypotheses, explicitly disclosing that the injectivity proxy is not actual even flatness.
- Add retract closure to IsSolidPerfectEven. Correct the solid Whitehead, discrete Pstrągowski comparison and descent documentation, distinguishing sheaf evenness, homological evenness, nuclear M and Assumption 2.13.
- p-complete thhZeta with pCompleteT and synchronize the relative THH comparison docs; state that the p=2 E∞ refinement is unknown here, rather than impossible.

Some proposed signatures still omit conditions or use inadequate ordinary-category/flatness carriers. Under PROTOCOL §13 these omissions are documented rather than replaced with opaque Prop-valued assertions, but they remain mathematical interface failures under R1/R5/R8/R12/R13/R15. Elaborating the file does not verify their mathematics. Every packet definition/construction has at least three listed tests, but the incorrect carriers can defeat their intended discrimination; the per-node unverifiable verdicts record this. The 24 unchanged planet names are source-based and within the checker’s per-layer limits.

- `python3 scripts/check_blueprint.py research/blueprint/packets/RefinedTraceMethods--RT.1.json`: **0 errors, 0 warnings**; 134 nodes, 300 API items, 186 tests, 24 planets, 22 gaps and 17 requests.
- `lean-check research/blueprint/suggested/RefinedTraceMethods--RT.1.lean`: **exit 0**, 1,415 warnings, all “declaration uses sorry”; no errors or other warnings. This checks the final edited file against the shared Mathlib build at `082e2d37e8`. Memory was checked first (108 GB available); only one compiler ran at a time and none remains running.
- The shared Tau Ceti build is at a later checkout (`cf3866…`), so this is not claimed as a full exact-pin Tau Ceti build. The file imports individual Mathlib modules and no TauCeti module; all Tau Ceti baseline citation statements were read separately at the exact recorded pin.
- `git diff --check`: checked before submission. Only the four authorized deliverables are included. No atlas data, source papers, external-owner packets or reader file is modified.

## Per-node review index

The packet’s `review.checked` has the full reason for every node. This index lists all 134 exactly once; R identifiers refer to the detailed gaps above.

| Node | Verdict | Reason/index |
|---|---|---|
| `RT.1/cyclic-category` | verified | NS18 B.1–B.4 and Loday–Quillen §1 support cyclic category and simplicial inclusion; scanned pages checked. |
| `RT.1/cyclic-bar-construction` | verified | Classical cyclic bar formula checked including degeneracies/unit insertions. DGA8 owns imported Hochschild chains; RT adds cyclic structure. |
| `RT.1/hochschild-homology` | verified | HH definition uses the imported normalized chains; BMS2 §2.2 and LQ §1 agree. The circle action is additional structure, not an ordinary chain-map proof. |
| `RT.1/connes-operator` | verified | Connes operator and signs checked against Hoyois §2 and LQ. The mixed identities and unit tests distinguish B from the Hochschild differential. |
| `RT.1/mixed-complex` | unverifiable | R1 |
| `RT.1/cyclic-homology` | unverifiable | R1 |
| `RT.1/sbi-sequence` | corrected | Ground-ring SBI test corrected: HH_{2m}=0 for m≥1, S is an isomorphism in the positive even range; I is the degree-zero isomorphism. |
| `RT.1/morita-invariance` | unverifiable | R2 |
| `RT.1/external-products` | unverifiable | R2 |
| `RT.1/base-change` | unverifiable | R3 |
| `RT.1/etale-base-change` | unverifiable | R3 |
| `RT.1/hkr-map` | verified | HKR antisymmetrization is a map to HH, with homology class convention; the packet’s exterior/Kähler library inputs provide the correct carriers. |
| `RT.1/hkr-theorem` | unverifiable | R3 |
| `RT.1/b-equals-d` | corrected | B=d and the inverse antisymmetrization are on Hochschild homology; no strict inverse mixed-complex chain map is asserted. |
| `RT.1/hkr-cyclic-char0` | verified | Characteristic-zero smooth cyclic formulas checked in LQ Theorem 2.9 and the norm/HP comparison, with product conventions. Derived formalism depends on the separate mixed-complex gap. |
| `RT.1/hkr-filtration` | corrected | BMS2 §4.4 corrected to complete descending Fil^n, gr^n=cofib(Fil^{n+1}→Fil^n), and actual bounded-torsion/p-completely-quasismooth scope. |
| `RT.1/hh-universal-property` | verified | HH universal property is in commutative algebras, not a bare underlying-module universal property; BMS2 §2.2/4.4 supports it. |
| `RT.1/hh-of-fp` | corrected | Removed the THH homotopy-fixed-point p²-extension assertion from HH/HKR; the divided-power HH and cotangent computations retain their stated scopes. |
| `RT.2/spectra-with-action` | unverifiable | R4 |
| `RT.2/homotopy-orbits-fixed-points` | unverifiable | R4 |
| `RT.2/norm-map-tate` | verified | Checked cited locator/excerpt, hypotheses, direct prerequisites, target-level proof sketch and, where applicable, API and tests. No new contradiction found. |
| `RT.2/tate-of-eilenberg-maclane` | verified | Finite cyclic Tate/EM calculation needs the cyclic resolution. The pinned even-degree periodic declaration is used only in its actual scope; odd/ring computation remains a planned proof, not a baseline claim. |
| `RT.2/tate-vanishing-induced` | verified | Induced Tate vanishing follows from the norm equivalence/ambidexterity, not a claim that arbitrary Tate colimits commute. |
| `RT.2/tate-multiplicativity` | verified | NS18 I.3 supplies the lax symmetric monoidal structure and natural can; the universal property is the quotient by induced objects. |
| `RT.2/tate-p-local-properties` | verified | NS18 finite cyclic p-local and boundedness properties checked; none is promoted to an unrestricted colimit assertion. |
| `RT.2/tate-orbit-lemma` | verified | NS18 Tate orbit lemma retains bounded-below hypothesis; KU is an obstruction to deleting it. |
| `RT.2/tate-fixpoint-lemma` | verified | NS18 fixed-point lemma retains the source’s bounded-above scope and residual cyclic action. |
| `RT.2/parametrised-tate` | unverifiable | R4 |
| `RT.2/circle-tate` | corrected | Circle norm uses ΣX_hT. Corrected non-example: the unshifted cofiber has wrong positive even homotopy for trivial Hℤ; zero natural maps do exist. |
| `RT.2/tate-cpn-via-cp` | verified | Iterated finite cyclic Tate comparison checked with the source’s boundedness and residual actions. |
| `RT.2/cyclic-realisation` | unverifiable | R4 |
| `RT.2/edgewise-subdivision` | corrected | NS18 B.19 gives subdivision equivalence; B.20 gives a comparison, not a Tate/realization equivalence even with uniformly connective levels. |
| `RT.2/tate-diagonal` | verified | Tate diagonal construction/universality checked in NS18 III.1; no bounded-below completion theorem is claimed for arbitrary unbounded input. |
| `RT.2/thh-e1-ring` | verified | THH E_1 cyclic bar definition and sphere/π_0 tests checked; uses accepted H.5 spectra smash/operadic inputs. |
| `RT.2/cyclotomic-frobenius-thh` | corrected | Frobenius realization now composes with the comparison of B.20; proof no longer assumes Tate preserves the realization. |
| `RT.2/thh-symmetric-monoidal` | verified | THH symmetric monoidality checked in NS18 III.2, with the source’s E_1/commutative structure distinctions. |
| `RT.2/relative-thh` | verified | Relative THH is over the stated commutative spectral base, with circle action; base/category inputs are imported. |
| `RT.2/thh-over-thhz` | verified | The comparison after base change over THH(ℤ) is BMS2’s, with its relative tensor convention; not absolute THH=HH. |
| `RT.2/mixed-complexes-are-circle-modules` | unverifiable | R1 |
| `RT.2/norm-sequence-hc` | verified | The HC/HC⁻/HP norm sequence keeps the circle suspension; unbounded carrier mismatch is separately recorded at node 38. |
| `RT.2/thh-spherical-group-rings` | verified | Spherical group-ring THH is the suspension spectrum of the cyclic bar; free-loop form needs the group/loop-space hypotheses. |
| `RT.2/thh-spectral-categories` | verified | Spectral-category THH/Morita/localizing statement checked in Blumberg–Mandell and BGT; the existing spectral-category inputs are not replanned as K-theory. |
| `RT.2/lax-equalizer` | unverifiable | R5 |
| `RT.2/cyclotomic-spectrum` | unverifiable | R5 |
| `RT.2/tc-minus-and-tp` | corrected | Removed unsupported rational equivalence of individual TC⁻/TP→HC⁻/HP maps. Infinite limits require their own hypotheses; the natural comparison maps remain. |
| `RT.2/topological-cyclic-homology` | corrected | Integral TC filtered-colimit assertion removed. Exactness remains; connective TC/p colimit scope is CMM Theorem 2.7. |
| `RT.2/tc-fibre-sequence` | verified | NS18 fiber formula keeps products over primes and can−φ; bounded-below p-typical identification is stated with its hypotheses. |
| `RT.2/tc-p-completion` | verified | p-completion formula checked in NS18 II.4, including the relevant boundedness convention. |
| `RT.2/trivial-cyclotomic-adjunction` | verified | Trivial-cyclotomic adjunction checked against NS18’s exact Frobenius convention; not an adjunction with arbitrary trivial underlying actions. |
| `RT.2/hz-module-circle-tate` | corrected | NS18 IV.4.12 applies to all circle-equivariant Hℤ-modules. Removed invented boundedness/finite-generation restriction and invalid arbitrary-colimit proof step. |
| `RT.2/orthogonal-spectra` | verified | Orthogonal spectra/category/structure maps checked in NS18 II.2; H.5 stable model supplies comparison, not a duplicate smash construction. |
| `RT.2/genuine-g-spectra` | verified | Genuine G-spectrum representation indexing and genuine versus naive distinction checked in NS18 II.2. |
| `RT.2/geometric-fixed-points` | corrected | Restricted the point-set Φ^G comparison to H=G; residual Φ^H still lives in G/H-spectra. |
| `RT.2/borel-completion` | corrected | Corrected the adjunction unit to id_{GSp}→B_G∘forget. The bare id→B_G statement had mismatched domains. |
| `RT.2/isotropy-separation` | verified | Isotropy-separation fiber/cofiber conventions checked in NS18 II.2. |
| `RT.2/geometric-fixed-points-localisation` | verified | Geometric-fixed-point localization kernel and residual action checked with normal-subgroup assumptions. |
| `RT.2/genuine-cyclic-and-circle-spectra` | verified | NS18 genuine finite-cyclic/circle family model checked with the family-localization convention. |
| `RT.2/genuine-cyclotomic-spectrum` | unverifiable | R5 |
| `RT.2/orthogonal-cyclotomic-spectra` | verified | Statement of orthogonal/genuine cyclotomic comparison agrees with NS18 II.3.7. The pre-existing unread Barwick–Glasman proof gap is honest at target level. |
| `RT.2/tr-and-genuine-tc` | corrected | Source scope and clear packet/signature corrections checked; see the correction register in the report. |
| `RT.2/restriction-pullback` | verified | NS18 restriction pullback checked with R versus F and boundedness conventions; no Witt computation is replanned. |
| `RT.2/genuine-tc-agrees` | verified | Bounded-below genuine/modern TC comparison is NS18 II.4.10–II.4.11; KU tests do not remove the bound. The statement and target-level outline are source-supported. |
| `RT.2/endofunctor-coalgebras` | unverifiable | R5 |
| `RT.2/genuine-cyclotomic-coreflection` | unverifiable | R5 |
| `RT.2/bounded-below-cyclotomic-equivalence` | verified | NS18 bounded-below cyclotomic equivalence checked using the Tate orbit lemma and the genuine coreflection. |
| `RT.2/bokstedt-construction` | verified | NS18 III.4–III.5 supports the Bökstedt model and the comparison; point-set convergence/cofibrancy remains explicit in its invariant statement. |
| `RT.2/thh-models-agree` | verified | NS18 III.6 model agreement checked as a cyclotomic comparison, using the stated genuine/modern inputs. |
| `RT.3/localizing-invariants` | unverifiable | R6 |
| `RT.3/dennis-trace` | unverifiable | R6 |
| `RT.3/cyclotomic-trace` | unverifiable | R6 |
| `RT.3/trace-uniqueness-multiplicative` | unverifiable | R6 |
| `RT.3/relative-trace` | unverifiable | R6 |
| `RT.3/goodwillie-calculus` | unverifiable | R8 |
| `RT.3/stable-k-theory-thh` | unverifiable | R7 |
| `RT.3/stable-tc-thh` | unverifiable | R7 |
| `RT.3/dgm-convergence` | unverifiable | R8 |
| `RT.3/dgm-theorem` | unverifiable | R8 |
| `RT.3/goodwillie-rational` | corrected | Relative Goodwillie rational theorem supported by Cortiñas (5)–(6) and LT §3. Removed the absolute rationalization/limit shortcut from the proof sketch. |
| `RT.3/kinv-truncating` | unverifiable | R6 |
| `RT.3/truncating-excision` | unverifiable | R6 |
| `RT.3/tower-square` | unverifiable | R9 |
| `RT.3/hesselholt-nikolaus-assembly` | corrected | Replaced vague assembly claim by the connective Hesselholt–Nikolaus p-completed cofiber sequence; LMMT T(n)-localized extension stays separate. |
| `RT.3/low-degree-tests` | verified | Low-degree tests use the cited T.6 square-zero/Denis–Stein supplier, not LT’s different perfect-characteristic-p example alone. Hypotheses 1/2 and the absolute differential base matter. |
| `RT.3b/qp-coefficients` | verified | p-completion THEN p inversion convention checked in AMMN; not ordinary tensoring with ℚ_p before infinite limits. |
| `RT.3b/trivial-vs-thh-fp` | verified | AMMN trivial-versus-THH(𝔽_p) comparison checked with bounded-below input and p-completed TP-equivalence. |
| `RT.3b/crystalline-trace-map` | corrected | β now lands in integral HP(R;ℤ_p); p inversion produces the quotient comparison. Composition order is β∘tr. |
| `RT.3b/beilinson-square-spectral` | corrected | AMMN Beilinson proof now compares horizontal fibers via orbit terms; it does not infer individual rational TC⁻ or TP equivalences. |
| `RT.3b/reduction-quasi-isogeny` | corrected | Added actual AMMN Theorem 3.4 locator/statement to the quasi-isogeny definition citation; nilpotent π_0-surjection hypothesis retained. |
| `RT.3b/beilinson-square-ordinary` | corrected | Replaced the coefficient-convention locator by Corollary 3.9/display (19); this TC square holds for every associative ring, without henselian hypotheses. |
| `RT.3b/beilinson-fibre-sequence` | verified | AMMN/HC norm fiber statement checked with the suspension and completion-before-inversion conventions. |
| `RT.3b/graded-beilinson-square` | unverifiable | R9 |
| `RT.4:topological/complex-k-theory` | verified | Compact-Hausdorff complex K uses vector-bundle isomorphism classes and GrothendieckAddGroup; Lean allows locally varying rank via finite partitions, so no fixed-rank-only error is alleged. |
| `RT.4:topological/reduced-and-graded-k` | verified | Reduced/relative/graded topological K conventions checked against Hatcher, with basepoint and exact-sequence scope; no new KO or completion theorem is introduced. |
| `RT.4:topological/bott-periodicity` | verified | Bott periodicity and external product conventions checked against Hatcher/May; unit tests distinguish the connective cover from periodic KU. |
| `RT.4:topological/bu-representability` | unverifiable | R16 |
| `RT.4:topological/ku-spectrum` | verified | ku/KU spectrum construction is distinct from algebraic K; Bott and E_∞ realization sources checked. |
| `RT.4:topological/connective-ku` | verified | Connective ku and τ_{≥0}KU definition keep negative homotopy zero. |
| `RT.4:topological/homotopy-of-ku` | verified | π_*ku=ℤ[β] and π_*KU=ℤ[β^{±1}], \|β\|=2, are the stated convention checks. |
| `RT.4:topological/bott-localisation` | verified | KU=ku[β^{-1}] agrees with Snaith/Lurie spectral localization and shifts. |
| `RT.4:topological/splitting-principle` | verified | Splitting principle checked in Hatcher at the cohomological and K-theoretic locators. |
| `RT.4:topological/lambda-ring-k` | verified | λ-ring operations via exterior powers checked; monoid/group completion extension and identities distinguish λ from Adams. |
| `RT.4:topological/adams-operations` | verified | Adams operations on K(X) keep the k-th power line-bundle test and multiplicativity; stable refinement is separately gapped at node 102. |
| `RT.4:topological/adams-operations-spectra` | unverifiable | R10 |
| `RT.4:topological/chern-classes` | corrected | Corrected primitive Chern classes to polynomial generators; Whitney coproduct is Δc_n=Σ c_i⊗c_{n−i}. |
| `RT.4:topological/chern-character` | corrected | Chern character target corrected to the product of even cohomology groups on general spaces; finite CW inputs recover the usual direct-sum range. |
| `RT.4:topological/relative-thh-ku` | unverifiable | R11 |
| `RT.4:topological/ku-circle-actions` | verified | Circle actions on ku/KU and Bott-periodic fixed/Tate conventions checked against Wagner; graded coefficients need their stated degree conventions. |
| `RT.4:q-Hodge/spherical-lift` | unverifiable | R15 |
| `RT.4:q-Hodge/solid-spectra` | unverifiable | R12 |
| `RT.4:q-Hodge/nuclear-objects` | unverifiable | R12 |
| `RT.4:q-Hodge/perfect-even-filtration` | unverifiable | R13 |
| `RT.4:q-Hodge/solid-even-filtration` | unverifiable | R13 |
| `RT.4:q-Hodge/even-circle-fixed-points` | unverifiable | R14 |
| `RT.4:q-Hodge/solid-thh-even-filtration` | unverifiable | R13 |
| `RT.4:q-Hodge/image-of-j` | corrected | Specified j_{p,0}=τ_{≥0}(KU_p^{hΓ_0}) from the thesis, retaining the chosen Adams subgroup; it is not an arbitrary image-of-J variant. |
| `RT.4:q-Hodge/devalapurkar-raksit-thh` | verified | Devalapurkar–Raksit THH/image-of-J theorem checked in the stated odd-prime scope, preserving the separate p=2 discussion. |
| `RT.4:q-Hodge/devalapurkar-comparison` | corrected | Restored p-completion in the relative THH carrier; odd-prime equivariant E_∞ comparison checked. Thesis proof is a recorded target-level gap, not a reason to demand lemma splitting. |
| `RT.4:q-Hodge/nikolaus-e1-equivalence` | corrected | Restored p-completion and clarified p=2: only the E_1 equivalence is established here, not a proof that an E_∞ refinement is impossible. |
| `RT.4:q-Hodge/q-hodge-comparison-map` | verified | Comparison map/pullback q-Hodge filtration checked; polynomial formula is for i≥1 with fil^0 separately specified, as the Lean tests already did. |
| `RT.4:q-Hodge/p-complete-comparison-odd` | verified | Odd-prime q-Hodge comparison keeps the spherical-lift/qSyn hypotheses and the source’s completion conventions. |
| `RT.4:q-Hodge/p-complete-comparison-two` | verified | p=2 comparison is Wagner’s separate E_1 case with its stated lift hypotheses, not an extension of the odd-prime E_∞ theorem. |
| `RT.4:q-Hodge/quasi-regular-quotients` | verified | Quasiregular quotient and bounded torsion/Tor-amplitude scope checked against Wagner; no arbitrary discrete quotient is asserted. |
| `RT.4:q-Hodge/global-even-filtration` | unverifiable | R15 |
| `RT.4:q-Hodge/q-hodge-global` | verified | Global q-Hodge comparison keeps the source’s arithmetic gluing and quasi-lci/per-prime assumptions; the source sketch remains explicitly recorded. |
| `RT.4:q-Hodge/q-hodge-multiplicativity` | unverifiable | R15 |
| `RT.4:q-Hodge/raksit-polynomial-example` | corrected | Removed extra S[x] factor: THH(S[x])=Σ∞_+B^cyN. Polynomial q-Hodge filtration is fil^0 separately and (q−1)^i/(q−1)^{i−1} for i≥1. |
| `RT.4:q-Hodge/cyclonic-spectrum` | unverifiable | R15 |
| `RT.4:q-Hodge/cyclonic-ku` | unverifiable | R15 |
| `RT.4:q-Hodge/tc-minus-m` | unverifiable | R15 |
| `RT.4:q-Hodge/cyclonic-even-filtrations` | unverifiable | R15 |
| `RT.4:Habiro-comparison/twisted-q-hodge-comparison` | unverifiable | R15 |
| `RT.4:Habiro-comparison/habiro-comparison-theorem` | unverifiable | R15 |
| `RT.4:Habiro-comparison/etale-einfty-lift` | verified | HA 7.5.0.6 étale E_∞ lift theorem checked with connective base and ordinary étale algebra; this is imported, not another Habiro definition. |
| `RT.4:Habiro-comparison/number-field-habiro` | corrected | Corrected Δ hypothesis to 6\|Δ and disc(F)\|Δ independently; HR.6 degree-zero supplier read, avoiding a duplicated Habiro-ring definition. |

## Orchestrator actions

1. Route the plan to revision with verdict needs_changes; this review job is complete. Do not promote this packet. The revision should address the specified key definitions and interfaces, not add lemma-level proof nodes to satisfy a different granularity.
2. Authorize or apply the reader synchronization described above, since the review issue permits editing only the packet and suggested file plus review/handoff. The committed packet is the authoritative replacement for each listed reader field.
3. Route the seven precise requests to their owners, preserving dependency direction. Obtain explicit models and comparison theorems instead of widening the currently read supplier statements by inference.
4. Reconcile inherited proof-gap prose with the target-level standard; retain honest unpublished/sketch-source limits, establish the actual missing definitions, and send the revised plan to a new independent review. The author session and this review session must remain distinguishable for independence checks.

