# Independent review: Explicit K₃ and Bloch groups, V.2

Accepted after the corrections below. This accepts a complete **target-level planning pass**, with V.2 coverage `planned`; it does not certify source-decomposed closure or implemented K-theory. The four supplier gaps remain necessary and visible.

Reviewer: Codex, session `codex-W9yXbt`, job `REV-K3BlochGroups--V.2`, issue #6397. Reviewed on 2026-10-05. The input was written by session `codex-RbnUTd` in planning PR #6532; this reviewer did none of that work.

## Counts and changes

| Item | Reviewed result |
| --- | --- |
| New consumer nodes | 8: 5 constructions, 1 lemma, 2 theorems |
| Inherited V.2 contracts | 10; retained as imports |
| Nodes added or removed by review | 0 / 0 |
| Baseline declarations | 9 confirmed; 0 removed or replaced |
| Construction API items | 26, unchanged |
| Unit tests | 15 → 17; every construction has at least 3 |
| Supplier requests / gaps | 10 / 4, retained |
| Original stage targets | All 3 covered |
| Planets | 3 new + 3 inherited = 6 in assembled V.2 |
| Source findings | 0 → 2, both confirmed author-copy proof misprints |

Every node's source record was tightened: the Bass–Tate theorem is on printed p.396, its concluding generator argument on p.402 (volume PDF pp.406 and 412). The match explanations now distinguish the primary theorem from the consumer consequences. K-book references were narrowed to the actual injectivity, stable Hurewicz, or low-degree sequence passage. The literal excerpts were checked in the source text at these locations.

Added `r₁(F)=0` to the hypotheses list of `totally-imaginary-quotient-equivalence`. This condition was already explicit in its statement, the reader and the Lean zero-image premise. The theorem itself was not broadened or weakened.

Added `decomposableSignature_coordinate`: the equivalence must preserve each labelled real coordinate. The previous zero, nonzero and empty-place tests could admit an arbitrary postcomposition on the coordinate group. Added `stableHurewiczQuotient_representative`: evaluation on the quotient class of x must equal the supplied Hurewicz map on x. The previous kernel and zero-image tests alone could admit an unrelated abstract isomorphism. Both tests are `example`s in the suggested file and exercise APIs already stated in the reader. All existing tests are retained. Added nine `#check`s to verify the exact baseline names, including generated additive names.

Clarified the four infinite-place baseline verification descriptions: additive-translation language did not apply to those declarations. The mathematical citations and provides contracts are unchanged. Added `sourceVersions`, the two source findings and their verdicts, updated `sourceAudit.scope`, and recorded the localization correction in G-Chern. All eight nodes carry individual `corrected` review records, including source-only corrections. No implementation status changed.

## Mathematical and closure checks

| Node suffix | Independent check |
| --- | --- |
| `real-place-basis` | Transport δ_v through the supplier signature equivalence. Its finite expansion and order two follow coordinatewise. A real place of an extension restricts to a real place of the base, so restriction pulls functions back and sends b_v to the sum over places above v, including an empty sum. |
| `real-basis-symbol-representatives` | A nonempty open sign box and pinned weak approximation give a field element; negativity at v makes it a unit. The triple {−1,−1,u_v} has exactly the desired signature, so signature injectivity proves equality and independence of choices. No assertion that repeated Milnor entries vanish is used. |
| `minus-one-product-surjective` | Lift b_v by {−1,u_v}, then use finite expansion. Matsumoto and the ordered graded product square identify the Quillen product image with the actual Milnor image. This is restricted to number fields. |
| `decomposable-signature` | Injective m₃ corestricts to an equivalence with its range. Composing its inverse with the signature gives the cardinality, exponent and naturality formulas. Its range is not identified with all ambient torsion. |
| `totally-imaginary-quotient-equivalence` | With r₁=0, Bass–Tate gives zero Milnor source and zero image. The actual quotient map is bijective; its unique inverse gives the stated naturality. The listed decomposition input is sufficient, although this consequence can be proved without using integral injectivity. |
| `number-field-stable-hurewicz-equivalence` | The inherited stable Hurewicz map is onto with kernel im(m₃∘p). Product surjectivity makes this D(F). The quotient equivalence evaluates as the original Hurewicz map and is natural. Stable SL is not confused with SL₂. |
| `weight-two-mod-two-obstruction-zero` | The integral Chern composite is +2, so d₂ factors through H⁰(Z(2))/2. The coefficient triangle and the requested degree-zero comparison inject this quotient into the constant étale group Z/2. Restriction to the algebraic closure is the identity on those constant groups, hence induces an injection of the quotients. Over the closure, torsionfree Milnor K₃ first forces d₂=0; only then is K₄ onto H⁰. Divisible K₄ makes that H⁰ divisible, proving vanishing and descent. The proof does not assume its desired integral injectivity or divisibility of an arbitrary subgroup. |
| `indecomposable-motivic-edge-equivalence` | The rightmost integral exact sequence gives edge surjectivity and kernel D(F) for every field. The quotient equivalence needs no injectivity of m₃. Representative evaluation, inverse, uniqueness and naturality are correctly typed. |

The ten inherited statements were read in the accepted parent packet, together with its independent review. Exact supplier statements were read in `K2SymbolsBrauer--T.1.json` for Matsumoto, graded comparison and its degree-three component, Milnor sign identities, the general n≥3 Bass–Tate theorem and algebraically closed unique divisibility in degrees n≥2. The BorelRegulators R.3 rank statement and the relevant ArithmeticKTheory N.3/N.5, MotivicEtaleKTheory M.4–M.8, SchemeKTheory S.7 and downstream V.5/Habiro HB.2 stage descriptions were checked.

These inputs justify the requests' exact degrees, coefficient conventions, maps and characteristic hypotheses. Borel's rank statement does not supply finite generation or the field/order comparison; N.3 and N.5 are separately requested. The diagonal norm-residue theorem alone does not supply H⁰(F,Z/2(2)): G-comparison correctly asks for its truncated extension. Integral motivic Chern operations and general Izhboldin remain Part II requests of their owners. Importing regulator M.8 as the foundational Chern construction would lead back through downstream comparisons; the packet correctly avoids that route.

A traversal of the reachable fine-node prerequisite graph found 39 nodes, no cycles and no unknown frontier IDs. Stage frontiers remain planning contracts, not proven fine-node closure. The supplier Bass–Tate and algebraically closed Milnor proof gaps remain G-supplier-proofs; the primary citations behind those proofs were not independently decomposed here. All original V.2 targets are covered by the inherited contracts and new consumer interfaces, so `complete`/`planned` is honest. No proof was unnecessarily split into lemma-level nodes.

The reviewed AUDIT-29 `not_built` assessment agrees with source searches at the exact library pins. The parent reader plus the V.2 reader agree with the corrected mathematical statements. The reader was read only, as required by the deliverable scope; its broader source locators still contain the corrected pinpoint locations, and its existing APIs state both added test properties. The upstream AlgebraicTopology and UniversalCovers documents were read for interface density and conventions.

## Pinned baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each Mathlib source statement and the relevant additive-translation attribute was read. The four source files inspected have no worktree differences from the Mathlib pin. Tau Ceti searches were made against its pinned Git object; the suggested file imports only Mathlib.

| Source declaration | Module and confirmed provision |
| --- | --- |
| `QuotientGroup.mk'` | `GroupTheory/QuotientGroup/Defs.lean`: quotient homomorphism; generates `QuotientAddGroup.mk'`. |
| `QuotientGroup.liftEquiv` | Same module: surjective homomorphism and N=ker give the quotient equivalence; generates the additive form. |
| `QuotientGroup.map` | Same module: N≤f⁻¹(M) gives the induced quotient map, with the stated representative formula. |
| `Function.MulExact` | `Algebra/Exact/Basic.lean`: kernel membership iff set-theoretic image; generates `Function.Exact`. Neither endpoint injectivity nor surjectivity is included. |
| `CommGroup.torsion` | `GroupTheory/Torsion.lean`: finite-order subgroup; generates `AddCommGroup.torsion`. |
| `NumberField.InfinitePlace.nrRealPlaces` | `NumberTheory/NumberField/InfinitePlace/Basic.lean`: cardinality of the real-place subtype. |
| `NumberField.InfinitePlace.nrComplexPlaces` | Same module: complex places, not the doubled count of complex embeddings. |
| `NumberField.InfinitePlace.embedding_of_isReal` | Same module: field-to-real ring homomorphism attached to a real place and its absolute-value identification. |
| `NumberField.InfinitePlace.denseRange_algebraMap_pi` | Same module: dense diagonal in the product of WithAbs infinite-place topologies; applicable to the nonempty sign box. |

## Sources and red-team findings

Downloaded the four public files listed in the packet. All SHA-256 values match. Read Bass–Tate II §§1–2, printed pp.393–402, and the K-book sections listed in `sources.readSections`, including the complete displayed injectivity argument and the Chern construction passages. Restricted claims remain restricted: the primary papers underlying the outstanding supplier gaps and the published K-book edition were not collated.

Added and confirmed:

- **K3BlochGroups/E31**, author chapter V, p.87: the first localization term must use P(F′), the closed subbundle. Its already printed weight n′ is correct because n=n′+n″. The complement term continues to use P(F″). This corrects a proof display, not the Whitney-sum statement.
- **K3BlochGroups/E32**, author chapter VI, p.24: the coefficient connecting map lands in H¹(Z(2))[m], which here equals its torsion subgroup; the finite Z/w conclusion concerns torsion in K₃^ind. Its free Z^{r₂} summand remains. The corollary's statement is already correct.

The author's [K-book page](https://sites.math.rutgers.edu/~weibel/Kbook.html) was consulted for known corrections. Its linked published-errata PDF and the corresponding host mirror returned 404. Searches and the programme's existing source register found no accessible correction of these exact proof displays. `known: new` is scoped to the inspected author copies; the packet records this limitation and the exact source versions. Existing parent E6 and E7 and the supplier's n≥2 correction were retained by reference rather than duplicated.

**RT-AREA-ktheory-2/19:** addressed in packet and reader. General Bass–Tate is imported from its owner, with the located primary source and explicit remaining proof inputs. Real-place representatives give the −1 product theorem and totally imaginary vanishing needed by HB.2 and V.5.

**RT-AREA-ktheory-2/20:** addressed in packet and reader. The graded construction remains owned by K2SymbolsBrauer T.2, with its K.7 product prerequisite; V.2 is a degree-three consumer alias. The three `importResolutions` avoid duplicate Bass–Tate, graded-map and Borel planets. The assembled six planets are key constructions or named theorems, with valid short labels.

## Validation and remaining work

- `check_blueprint.py` with an index generated from the existing pinned Mathlib source: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/K3BlochGroups--V.2.lean`: **exit 0**, with only expected `sorry` warnings. The nine baseline names, all 26 construction API forms and all 17 tests elaborate. General additive-carrier prototypes are explicit supplied inputs; no missing higher K-group or motivic operation is replaced by a dummy predicate. The motivic obstruction remains an honest precise comment because its objects are absent.
- Source-issue schema and source-version checks, exact packet/Lean API and test-name matching, submission file validation and `git diff --check`: passed.

No orchestrator decision is needed to accept this pass. Subsequent supplier work must preserve G-Chern, G-Izhboldin, G-comparison and G-supplier-proofs and return exact fine declarations. Published-edition collation of E31–E32 remains a separate source task, not a reason to present these author-copy findings as published errata.
