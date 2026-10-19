# StableHomotopyKTheory package repair

Completed fix for #10926, `FIX-PKG-StableHomotopyKTheory~adv`. Codex, session `codex-R3CNe6`, 2026-10-19. This is a repair submission, not an independent review of this session's work or a checkpoint. The independent follow-up should review these four deliverables. Nothing here asserts that the roadmap's admitted mathematical theorems have been formalised.

## Findings and disposition

The input adversarial report is `research/blueprint/reviews/REV-PKG-StableHomotopyKTheory~adv.md`. It rejected the shape before undertaking the full mathematical pass. Its diagnostic count included Prop-valued instances and was not a count of confirmed data violations. The shape rejection was correct.

| Finding | Repair |
|---|---|
| Sorry-bodied vertices, edges, CW structures, opposite homeomorphisms and category-chain carriers | Define the vertex by the actual realisation–singular adjunction unit on the object zero-simplex. Keep the realised nerve, its functor, and the selected vertex with real bodies. State CW existence and opposite homeomorphism existence as theorems over existing carriers. Edge and chain constructions, with their complete interfaces, remain in README §§1.1–1.34. |
| Sorry-bodied pointed smash, spheres, iterated structure maps, spectra, naive and true π, model/localisation structures | Remove these data declarations and every Lean statement depending on them. README §§4.1–7.34 contains their construction targets, equations, hypotheses, sources and Checks. No replacement spectral carrier or weak substitute is introduced. |
| Heavy theory developed on those carriers | Remove the construction development and auxiliary chains. Keep light subtype/predicate definitions on existing spaces and representative end statements; the closing comment identifies the further definitions in the README. |
| A successful admitted build was insufficient | Run the data-shape checker as well as elaboration. Neither successful elaboration nor the examples proved with `sorry` is counted as mathematical proof. |
| Source/generality/ownership/adversarial passes had not been completed by the rejecting reviewer | Perform the additional pass recorded below, including all 222 subsection contracts, their API and Checks, all retained Lean signatures and their variable blocks, the original proof-input list and a fresh 15-locator sample. |

The reader keeps all 222 numbered subsections. An exact-name inventory of its original 698 distinct named API/Check bullets loses only `Skeleton` and `MonoidalCategory.MonoidalLeftAction`, both already supplied by Mathlib and now cited in the boundaries/contracts. Their new comparisons/action categories remain local. All original named Checks survive. The new tests and strengthened target contracts are additions, not replacements for the detailed specification.

Additional repairs found in this pass:

- Replace the false exact-couple assertion `jk=0` by its actual value `(jk)(x,y)=(y,0)`, which is nonzero at `(0,1)` and squares to zero. Exactness requires `ji=kj=ik=0`; `i²` can also be nonzero.
- Correct Thomason's comparison to `hocolim B(Fc) → B(∫F)`. Kahn's Theorem 1.4.3 gives this direction. Its forward Grothendieck edge has fibre identity; it is now a computed Lean example as well as a reader Check.
- Correct the inverse-warning test: the problematic natural transformation is from the constant unit functor to `id⊗swap`. The old `id→id⊗swap` test did not capture the source's warning. Naturality along `(0,0)→(1,1)`, followed by the automorphism `(-1,1)`, forces unequal diagonal matrices to be equal. The matrix inequality is computed in Lean.
- Supply the space-tower path model and individual Postnikov section contract, with separate tests for constant towers and nonempty stages with empty limit. Supply the Serre-class closure API, finite-projective complement contract and local Waldhausen K₀ presentation instead of unnamed inputs.
- Separate simplicial E∞ contractibility/freeness from the spectral augmentation-equivalence predicate. Spectral arities are equivalent to the sphere, not to a contractible spectrum. State positive admissibility/rectification without an unsupported underlying positive-cofibrancy conclusion.
- Correct the cochain-degree-two witness to spectrum degree minus two. Retain the actual shifted-complex example, integral Koszul sign, characteristic-two specialization, right-module order and coefficient-transition witnesses.
- State group-completion uniqueness also for a countable cofinal submonoid. State p-completeness for degreewise bounded exponent, retaining the uniform bound as a specialization. Constant filtered objects, all-integer rational groups and Boardman's conditional hypotheses receive explicit negative controls.
- Correct Shipley's Proposition 4.4 locator to pp. 17–18 of the linked 22-page version, add Jardine's direct simplicial-group/normalisation locators, and identify the missing direction of Hatcher's Serre-comparison proof. Correct the two strictification/relative-plus source attributions described below.

## Shape and generality

The surviving data definitions are only notation for singular homology, realised nerves and their induced functor/maps/vertex, the path-subspace homotopy fibre and its projection/constant point, and three predicates: acyclic spaces, acyclic maps, plus recognition. All have real bodies over carriers present at the pins. There is no sorry-bodied data, no new spectral carrier, and no theorem depending on a removed declaration.

The reader is the full specification. Distinct representative names make the limits of the Lean signatures explicit: `realisation_has_cw` states existence rather than constructing the indexed CW data; `classifyingSpaceProdHomeomorph` is the finite-right-factor ordinary-product theorem, while §1.9 retains arbitrary k-products; `IsAcyclicMap.homology_criterion` is only the constant-coefficient consequence of the full local-system criterion. The CW-restricted perfectness/kernel theorems are labelled accordingly. The raw recognition predicate does not itself impose the geometric plus-construction hypotheses; the existence theorem does. The small-category source/target universes, homotopy-fibre path endpoints, chosen constant basepoint, connectedness, CW assumptions and normal/perfect subgroup hypotheses were read directly in the retained `variable` blocks and theorem statements. No statement obtains its conclusion as an unrelated hypothesis.

Heavy objects and theorems absent from Lean are README targets, not weaker Lean substitutes. Elementary examples compute the group, matrix, residue, complex-shift and triangle operations already available at the pins. They fix conventions; they do not purport to construct a spectrum. This is also why the README's geometric checks are retained even when their carriers cannot yet be stated in Lean.

## Supplier and ownership audit

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE, the expansion protocol, the PadicMeasuresIwasawaAlgebras exemplar, current AlgebraicTopology and UniversalCovers material, and `data/library-coverage.json`. Inspect mathematical objects and their fields/operations, not just the proposed names.

Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only roadmaps: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmaps and four Completed roadmaps named in WORKERS were included in the object searches. No Lake operation ran in those current checkouts.

| Existing owner | Disposition |
|---|---|
| Mathlib `CategoryTheory.Monoidal.Action.Basic` | Consume `MonoidalCategory.MonoidalLeftAction` with its coherence; remove its planned duplicate from §4.4. Translation categories and the diagonal action are the new targets. |
| Mathlib `CategoryTheory.Monoidal.Skeleton` | Consume the existing skeleton monoid/commutative-monoid structures, functor map and equivalence. Replace the duplicate §4.1 construction by the comparison with classifying-space components. |
| Current Tau Ceti `Topology.Homotopy.Extension.Basic` | Consume `HasHomotopyExtensionProperty`, cylinder retraction and universe extension. Remove the duplicate predicate/interface; proper realisation uses it on closed embedding images. It postdates the elaboration pin and is not imported there. |
| Mathlib compactly-generated spaces, simplicial objects, nerves, realisation, monoidal/derived/triangulated/spectral-object APIs | Reuse the actual carriers. CGWH closure, category-realisation comparisons and concrete stable constructions are additional targets, not renamed copies. |
| AlgebraicTopology and UniversalCovers | Reuse ordinary chains/local systems, relative homotopy, Hurewicz/Whitehead, coverings, basepoint change and actions. New targets are category-specific comparisons, arbitrary fibre-pair lifting and the indicated twisted extensions. |
| Tau Ceti split K₀ and GrothendieckEulerForms | Reuse the algebraic split group and `SplitK0.grothendieckAddGroupEquiv`. The local Waldhausen K₀ target has weak-equivalence and cofibration relations; its split-projective specialization consumes that supplier. |
| IntegralLattices and OrthogonalSpinGroups | Reuse forms, isometries and sums. Clifford-algebra periodicity is not topological KU/KO Bott periodicity. No existing current roadmap was found to supply the new concrete spectrum, plus or operad constructions. |

The existing downward ownership moves remain necessary; other packages are outside this issue's allowed paths. The maintainer should redirect K2SymbolsBrauer to §3.30 for universal central extensions; KTheoryLowDegrees to §§4.14–4.15 for stable GL/E and projective complements; GeneralAlgebraicKTheory to §§6.1–6.2 for Waldhausen/S/additivity/relative-S and the local K₀ presentation; ArithmeticGaloisDuality to §7.10 for countable abelian-tower algebra; EnhancedDerivedSheaves to §§5.28–5.29 and §5.40 for the concrete stable/operadic models. No reverse imports of those higher plans are used. Remove self-dependencies and distinguish foundation construction from subsequent comparison in §§3.32, 4.14–4.15, 5.29, 6.1–6.2 and 7.10. Later-numbered local dependencies are read in mathematical order, for example cellular generation before connectivity calculations; numbering alone is not an implementation order.

## Sources and proof inputs

Only public primary author/arXiv PDFs linked in the README were used. The cleared-library index was consulted; no library book was needed or copied. No passages or source excerpts were put in a deliverable. The following fresh random sample uses seed 10926 over the 222 numbered subsections, independently of the prior author's sample. Each listed passage was opened and read, using the version and pagination in References.

| Reader | Passage checked | Outcome |
|---|---|---|
| 1.11 | Quillen Prop. 2/Cor. 1, p. 92; Weibel IV 3.2, p. 26 | Unit/counit give homotopies of the actual functor maps. |
| 2.5 | Hatcher AT Thm. 4.41, p. 376 | Arbitrary fibre pairs, n≥1; no NDR premise is justified here. |
| 2.7 | Weibel IV Homotopy Fiber 1.2, p. 3 | Opposite path direction explicitly compared by reversal. |
| 3.6 | Hatcher SS Prop. 1.12, pp. 20–21 | Statement includes the fibre implication; its proof omits this direction. README now supplies the relative/first-failure proof route explicitly. |
| 3.14 | Hatcher AT, p. 342 | Simple/abelian includes all positive π actions, not just abelian π₁. |
| 3.15 | Hatcher AT Example 4A.3, p. 422 | Connected H-space suffices; no associative hypothesis added. |
| 3.34 | Weibel IV Ex. 1.9, p. 15; 1.4/1.6, pp. 4–5 | Exercise only treats the central-extension special case. Replace that attribution for the general closure by the stated homotopy-pullback/acyclic-map argument. |
| 4.8 | Weibel IV Ex. 4.6, p. 46 | Restore the groupoid premise inherited from Ex. 4.5. |
| 4.20 | Weibel IV 4.11, pp. 44–45 | Aut bijectivity and positive-degree conclusion retained; no π₀-surjectivity claim. |
| 4.23 | Weibel IV Ex. 4.4, p. 46; Carlsson §1.2, p. 10 | The exercise concerns opposites, not strictification. Use the symmetric strictification statement and the explicitly described strong-equivalence/quasi-inverse argument. |
| 5.9 | Schwede I 3.14–3.16, pp. 38–39 | Semistability remains essential for the naive/true comparison. |
| 5.26 | Schwede II 5.22, p. 264 | All integer connectivity degrees, bottom tensor isomorphism only. |
| 7.1 | Schwede II 6.33, 6.39–6.43, 6.48/6.50, pp. 284–288; Weibel IV 2.1, p. 18 | Preserve the even-modulus lift ambiguity and degree-two ℤ/4. Use the correct Moore-space shift n−1. |
| 7.3 | Weibel IV 2.1.1/2.2, pp. 18–19 | Correct the page span; quotient and torsion terms differ by one degree. |
| 7.29 | Boardman Def. 5.10, p. 19, Thms. 7.1/8.2, pp. 20/24, Eq. 8.7, p. 25 | Conditional hypotheses, derived cycles and whole-plane W remain separate. |

Additional direct checks addressed the earlier handoff's 45 proof-input items. The table groups items sharing a source, but accounts for every item. These are statements/construction contracts and proof routes for a roadmap; no claim is made to have verified every original proof or implemented those proofs.

| Earlier proof-input item(s) | Verification and treatment |
|---|---|
| 1, 5, 24: products, gluing, pushout products | Schwede Appendix A, Def. 2.3/Props. 2.4–2.5, pp. 421–423, and NS Appendix C, Props. C.1–C.3, pp. 160–161. Correct Schwede's version-specific numbering; retain CGWH, closed h-cofibration and product hypotheses. |
| 2, 3, 9: diagram resolutions and twisted chains | Quillen §1 and Weibel IV §3 supply category chains/comparisons; Hatcher AT §3.H supplies twisted chains. Diagram-projective resolutions and action-compatible cellular/Serre comparisons are explicitly named targets, not inferred from projectives in the value category. |
| 4, 6, 7: quasifibration/realisation | May Cor. 2.3, p. 94, Cor. 2.4/Lem. 2.5/Thm. 2.6, p. 95; BF B.3–B.4, pp. 119–121; NS B.7, p. 149. Keep intersections, every basepoint, properness, the actual π*-Kan horn condition and the separate π₀ Kan map. Skeletal replacement gives a direct hocolim comparison without an unstated Reedy model. |
| 8: Thomason | Kahn Thm. 1.4.3, p. 6, Lem. 1.4.5, p. 7, read directly; correct the comparison direction and its forward edge. |
| 10–12: cellwise plus, extension, relative plus | Hatcher AT Prop. 4.40, p. 374; Weibel IV 1.4–1.8, pp. 4–6. The relative group-ring differential is identity; twisted obstruction groups precede general extension. The fibre-plus compatibility is restricted to the pullback construction described in §3.34, not falsely sourced as the general content of Ex. 1.9. |
| 13, 33, 45: HA, complexes and homology | Jardine Lecture 06 Lemmas 14.1/14.3, pp. 1–5, directly supplies Kan/π-normalisation. Shipley Prop. 2.10, p. 7, Cor. 2.15, p. 8, §§3–4, pp. 10–21, and Prop. 4.4, pp. 17–18, support the complex/module comparisons. The smash-sphere normalisation comparison is a quasi-isomorphism, not a literal one-term equality. Stable ordinary homology is separately named in §5.35. |
| 14, 34, 35: space/spectrum/module models | HSS Thms. 4.2.6/4.3.2, p. 42, and Schwede's stated stable/module models give the named model/Quillen targets. No carrier or model instance is admitted as data in Lean. |
| 15: operad models | Pavlov–Scholbach Thms. 4.1/4.6, Ex. 4.7, pp. 17–18, read directly. Distinguish positive admissibility from underlying positive cofibrancy. |
| 16, 17, 27, 29: infinite loops and Picard objects | Bhatt–Scholze §12, pp. 56–59, Def. 12.8, Thm. 12.9, Props. 12.10/12.15 and Cor. 12.12. Preserve nullary data, Γ coherence, the group-completion unit and Picard self-braiding. Existing monoidal action/coherence is a supplier; symmetric coherence is an extension. |
| 18, 19, 28: completion uniqueness and stable perfectness | Weibel IV 4.4.3, p. 39; Randal-Williams Thm. 1.1/Cor. 1.2, pp. 1–2, Prop. 3.1, pp. 7–8. Countable cofinal submonoids allowed. The weak comparison runs ΩBM→Borel hofib; upgrade to homotopy equivalence only with CW models. Stable commutators use disjoint blocks, not E₂ perfectness. |
| 20: topological variants | HK III §3.2, proof of Lem. 3.2.11, p. 59, identifies the connective real target ko. Weibel IV §2.1, pp. 13–17, supplies Bott conventions. Connective ko/ku and periodic KO/KU are now separate. |
| 21, 22, 31, 32: coefficient products/splitting | Weibel IV 2.1–2.2 and 2.7–2.8.1, pp. 18–21; Burklund Thms. 1.1/1.2, p. 1, Thm. 1.5, p. 2, Thm. 5.2, p. 10, Remark 5.7, p. 12. Read the statements directly. Distinguish a particular Moore product's properties from existence of other associative products, and v-compatible uniqueness from arbitrary algebra uniqueness. |
| 23, 44: convergence and coherent filtrations | Boardman's passages above; HA Def. 1.2.2.9/Prop. 1.2.2.14 and proof, pp. 52–53. Read the convergence proof, keeping bounded-below filtration and sequential-colimit compatibility, coherent relative cofibres and all obstruction conditions. |
| 25, 26, 30: Serre comparison/classes/rational finiteness | Hatcher SS Prop. 1.12 and AT §4.B–4.C; explicit first-failure argument for the omitted implication. Multiplicative Serre and rational EM cohomology are named before the rational H-space/stable-stem consequences. |
| 36: completed integers | Read the pinned PadicInt residue/lift declarations and adic-completion comparison API. `completionZEquiv` is the additional residue-characterised comparison, not a new construction of padic integers. |
| 37, 40, 41, 42: lifting and CW scope | Hatcher AT Thm. 4.41, p. 376, Prop. 4.48, pp. 376–377, and the mapping-path construction. Keep arbitrary parameter spaces in Hurewicz HLP, relative disk lifting without an NDR fibre, and CW type on the superperfectness representative. No general CW-approximation theorem is silently assumed. |
| 38, 39, 43: stems, flatness, Moore mapping | Schwede I 5.41/5.47, pp. 98–100; II 6.39–6.50, pp. 285–288. The truncated-sphere latching fold is not mono. The Moore mapping Ext term uses π₁; it is distinct from smash UCT. ℤ/4 at modulus two prevents incorrect splitting and annihilator claims. |

For Waldhausen assembly, additionally read Waldhausen's additivity statement (Thm. 1.4.2, p. 336) and relative-S fibre sequence (Prop. 1.5.3, p. 342), including the n≥1 delooping conclusion. The README now distinguishes the initial nerve(wC) level from the positive Ω-spectrum comparison. The entire formal development, including original proof details cited by these sources, remains the future roadmap implementation; there is no unresolved source locator or mathematical contract being passed off as an established library fact.

## Adversarial pass

Each row covers the subsection's defining equations, named API statements and Checks, not merely its heading. “Keep” means that the indicated degenerate/negative instances agree with the stated hypotheses; it is not a proof of the general target. Mathematical rows also cover statements removed from Lean but retained as full README targets. The previous author's pass table was not used as this run's verdict. New or changed witnesses are identified explicitly. Parameters such as ramification, unit ideals and finite slopes do not occur in these topological contracts; zero/rank, low degrees, noncommutative rings, characteristic two, noncompact spaces and prime-power coefficients are tested where they do occur.

| Statements | Instances/computation | Result/change |
|---|---|---|
| 1.1 | Empty category is empty; discrete Bool has distinct vertices; [1] has distinct endpoints but is contractible. Reflection is not induced by an order-preserving functor. | Real vertex replaces admitted data; add two distinct-vertex Lean controls. |
| 1.2 | n=0 gives empty boundary→point; n=1 gives endpoints→interval; n=2 gives circle→disk. | Keep the arrow isomorphism, including both maps. |
| 1.3 | Δ[0] has one cell, not infinitely many; Δ[2] has 3 vertices, 3 edges, 1 face; nonidentity group elements index one-cells. | Keep full indexed construction in README; Lean states CW existence only. Faithfulness additionally needs injective objects. |
| 1.4 | Interval endpoints and an infinite wedge vertex admit contractible neighbourhood bases. | No local finiteness added; keep strong local contractibility. |
| 1.5 | Empty mono has empty image; a vertex inclusion is closed; noninjective vertex maps fail mono. | Keep closed subcomplex conclusion. |
| 1.6 | A point has infinitely many degenerate simplices but only one nondegenerate cell; compact subsets of CW realisations meet a finite subcomplex. | Finiteness counts nondegenerates. |
| 1.7 | [1] reverses coordinate t↦1−t; a one-object group requires inverse arrows. | Homeomorphism, not a nonexistent arbitrary C→Cᵒᵖ functor. |
| 1.8 | Point and empty factors; [1] factor gives the ordinary cylinder. | Actual projection map and finite-CW ordinary-product hypothesis retained. |
| 1.9 | Compact Hausdorff factor needs no k-correction; maps from point give Y; closed interval gluing gives circle. | Version-specific CGWH source corrected; unrestricted product is k-product. |
| 1.10 | Identity transformation gives constant homotopy; an arrow in [1] joins distinct endpoint maps. | Keep track direction and actual realised maps. |
| 1.11 | Identity adjunction gives identity; point↔[1] gives contractions, not homeomorphisms. | Actual unit/counit and functor maps are retained in Lean. |
| 1.12 | Empty category has neither initial nor terminal object; [1] has both. | Nonempty contractibility follows from the object hypothesis. |
| 1.13 | Constant filtered diagram; a finite arrow string occurs at a common stage. | Keep filteredness and category-colimit cocone, not arbitrary colimits. |
| 1.14 | Degree zero sees zigzag components; a sphere map has compact image in finitely many cells. | Based higher groups use compatible vertices and filtered stages. |
| 1.15 | Constant diagram gives identity; empty categories satisfy the same statement vacuously as spaces. | Transition and cocone maps are tied to the homotopy equivalences. |
| 1.16 | Terminal filtered category gives a point; an empty category is not filtered. | Keep CW Whitehead upgrade after finite-diagram contraction. |
| 1.17 | Zero coefficient module stays zero; n=0 gives component modules; constant diagram recovers stage homology. | Arbitrary unital Ring/module coefficients in Lean, not an unnecessary CommRing restriction. |
| 1.18 | Discrete two objects give two components; [1] gives one although reverse reachability fails. | Zigzag equivalence and vertex normalization retained. |
| 1.19 | Identity covering; empty covering; two sheets over a point. | Covering condition remains stronger than simplicial mono. |
| 1.20 | Constant set gives product cover; noninvertible set transport is excluded. | Recover objects, arrows and monodromy, not just fibre cardinality. |
| 1.21 | A tree has trivial π₁; a one-object group recovers G; monoid arrows must be formally inverted. | Full groupoid localization is required. |
| 1.22 | A tree gives no free generator; a circle edge gives ℤ; composing two noncommuting labels fixes order. | Retain maximal-tree choices, reversed tree paths and label(g)label(f). |
| 1.23 | Constant coefficient functor; an isomorphism action; noninvertible transport fails. | Consume the local-system carrier and compare category functors. |
| 1.24 | Terminal category evaluates coefficients; zero module vanishes; H₂(C₂;ℤ)=0 but H²(C₂;ℤ)=ℤ/2. | Homology is not cohomology; retain all face maps and coefficient naturality. |
| 1.25 | Representable free diagrams have no higher homology; H₀ is colimit; zero diagram stays zero. | Diagram-projective resolutions remain an explicit prerequisite target. |
| 1.26 | Point gives degree-zero fibre; circle with T=1 gives zero differential, T=−1 gives −2. | Keep twisted cellular comparison; Lean computes the negative sign. |
| 1.27 | Trivial monodromy recovers ordinary comparison; nontrivial circle action retains T−1. | Naturality and transported action are part of the comparison. |
| 1.28 | Trivial group gives point; C₂ has one nondegenerate cell per degree; G=ℤ has π₁=ℤ. | Retain based functorial maps and loop(g)↦g. |
| 1.29 | X=G gives contractible translation space; X=G/H gives BH; empty G-set gives empty cover. | Keep the inclusion-induced map to BG, not just an abstract equivalence. |
| 1.30 | G=1 contracts; G=ℤ gives K(ℤ,1); nonabelian G still has vanishing higher π. | Consume the existing asphericity predicate; BG construction is local. |
| 1.31 | Inner automorphism of a nonabelian group fixes the free homotopy class but need not the based class. | Free/based distinction retained. |
| 1.32 | d₁[g,a]=g⁻¹a−a; d₂ uses gh; (01)(12) sends 2 to 0, reversed order sends it to 1. | Actual pinned bar differential and permutation computations in Lean. |
| 1.33 | Groupoid horn filler uses inverses; the nerve of [1] fails the reverse-arrow horn. | Groupoid hypothesis retained. |
| 1.34 | Disjoint groupoids remain disconnected; connected groupoid reduces to one automorphism group. | 1-type does not mean contractible or connected. |
| 2.1 | Point→two points fails π₀; S¹⊔point→two points fails at the circle basepoint. | Retain all basepoints and π₀, rather than one chosen group calculation. |
| 2.2 | Identity fibre contracts; point→B gives ΩB; A→point gives A; empty A gives empty fibre. | Real path-subtype body, projection and constant point; endpoints fixed by Lean examples. |
| 2.3 | Identity lifts; product projection fixes its first coordinate; {0}→I cannot lift t↦t. | Hurewicz HLP quantifies over every parameter space; mapping-path endpoint theorem states it in Lean. |
| 2.4 | Constant-path inclusion projects back to a; contraction shortens the path. | Homotopy equivalence need not be over the target B. |
| 2.5 | Identity fibration gives trivial relative groups; path fibration recovers loop shift; fibre pair need not be NDR. | Keep n≥1 and relative disk lifting, not an imported NDR-only theorem. |
| 2.6 | Projection A×B→B gives fibre A; identity gives point; point→nontrivial B is generally not a fibration. | Strict fibre comparison requires the fibration hypothesis. |
| 2.7 | Identity connecting map is zero; point inclusion gives loop-shift bijection; S₂⊂S₃ gives a nongroup quotient set. | Homomorphism only in positive group degrees; endpoint reversal documented. |
| 2.8 | n=0 is pointed-set exactness; n=1 may be nonabelian; identity sequence has contractible fibre. | Do not replace low-degree terms by abelian groups. |
| 2.9 | Subgroup inclusion has coset components and stabilizer H; nonsurjective π₁ map has multiple orbits. | Loop-appending action and stabilizer use the chosen path multiplication. |
| 2.10 | Constant transport is homotopic to identity; loop transport permutes cosets; reversing the path gives inverse. | Composition order and selected-basepoint transport remain explicit. |
| 2.11 | Point pullback is ΩB; identity square is homotopy-cartesian; strict subgroup fibre misses cosets. | Comparison uses actual tracks, not a formal commutative-square assertion. |
| 2.12 | Contractible base gives A×C; a contractible source corner gives the specified homotopy-fibre comparison. | Add the separate source-corner theorem needed by the earlier Check. |
| 2.13 | Identity pasted square; pullback along a weak equivalence; an outer weak square alone does not identify every inner corner. | Keep the stated pair of pasting hypotheses. |
| 2.14 | Identity comma category contracts; subgroup comma components invert right cosets to left cosets; {0}→[1] has an empty opposite comma at 1. | Keep both comma directions and reversed tracks distinct. |
| 2.15 | Every Serre fibration passes; point→I fails away from 0; quasifibration does not itself provide HLP. | Predicate is strict-fibre→homotopy-fibre weakness at all points. |
| 2.16 | Degree one is set-level; connected excisive triads give the higher comparison; nonexcisive covers are excluded. | Retain low-degree/based clauses and actual triad inclusions. |
| 2.17 | Trivial cover; two intervals and their overlap; checking only U and V leaves U∩V untested. | Keep finite-intersection restrictions and disconnected-fibre basepoints. |
| 2.18 | Constant exhaustion; increasing CW skeleta; compact maps land in finite stages under the stated exhaustion premise. | Exhaustion/compactness condition remains, not an arbitrary union claim. |
| 2.19 | Identity deformation; fibre-preserving contraction; base deformation without fibre equivalences is insufficient. | Retain lifted deformation and endpoint fibre hypotheses. |
| 2.20 | Constant point; discrete simplicial spaces; nontrivial bisimplicial directions. | Coend faces/degeneracies and topology stay in README, with properness separate. |
| 2.21 | Constant bisimplicial object; Δ[1] in both directions gives the square via diagonal triangulation. | Keep k-topology and transpose comparison. |
| 2.22 | Discrete levels have closed degeneracy images; identity degeneracy is harmless; arbitrary degeneracies need not be cofibrations. | Use existing HEP supplier; skeletal free extension does not assume unspecified space-level degeneracies. |
| 2.23 | Empty/terminal finite limits; products; equalizers with their k-topology. | Preserve NS's finite-limit generality, not only products. |
| 2.24 | Identity attaching map; gluing intervals; arbitrary noncofibrant attachments are excluded. | Closed h-cofibration/CGWH hypotheses retained. |
| 2.25 | Boundary inclusions of two intervals give square boundary; empty inclusion gives the other factor. | Product theorem uses closed Hurewicz cofibrations on both factors. |
| 2.26 | Constant levelwise weak map; discrete degeneracies; nonproper inputs do not satisfy the theorem. | Properness remains an independent premise. |
| 2.27 | Constant fibre sequence; connected rows; disconnected rows need separate π₀ control. | Keep all-basepoint conditions before realization. |
| 2.28 | Connected rows and bisimplicial groups pass; vertically discrete non-Kan K passes π*-Kan but not π₀ Kan. | Separate the horn condition from the square theorem's π₀ Kan-fibration premise. |
| 2.29 | Point-valued diagram gives BI; terminal index evaluates; point←S⁰→point has hocolim S¹ but colimit point. | Keep X(c₀) weighting and forward d₀ action. |
| 2.30 | Constant proper point; split degeneracy contraction; ordinary coend is not automatically a derived colimit. | Name replacement augmentation and direct skeletal comparison. |
| 2.31 | Constant point gives identity to BC; non-equivalence transition violates the hypothesis. | Quasifibration at all vertices uses arrowwise weak equivalences. |
| 2.32 | Point index and constant terminal fibres give identities; forward edge is (f,id). | Reverse comparison corrected; three reader Checks and actual Grothendieck edge example added. |
| 2.33 | Identity functor has contractible commas; point target gives total category homology; zero coefficients vanish. | Covariant comma coefficient and first-quadrant convergence retained. |
| 2.34 | Identity; final-object inclusion; empty source into nonempty target fails comma contractibility. | CW conclusion concerns BF itself; Lean uses the explicitly dual comma convention. |
| 2.35 | Identity fibres; cartesian lift adjunction; merely nonempty strict fibres need not give adjoints. | Do not conflate prefibred with a stronger arbitrary lifting assertion. |
| 2.36 | Identity and point fibres; an empty strict fibre violates contractibility. | Fibre-to-comma adjunction is the needed bridge. |
| 2.37 | Identity and group homomorphisms; {0}→[1] fails comma base-change invariance. | Preserve actual comparison map and base-change hypothesis. |
| 2.38 | Constant fibred diagram; homotopy-equivalent transitions; nonempty fibres alone are inadequate. | Keep transition-map requirement. |
| 2.39 | Identity group extension; trivial quotient; nonsurjective subgroup map has extra coset components. | Surjectivity and actual kernel sequence retained. |
| 3.1 | Point acyclic; empty fails nonemptiness; S¹ fails H₁; punctured Poincaré sphere is acyclic with nontrivial π₁. | Real predicate distinguishes acyclicity from contractibility; superperfectness API scoped to §3.2. |
| 3.2 | Point gives trivial group/H₂; punctured homology sphere gives a nontrivial superperfect group. | CW-type representative retained explicitly. |
| 3.3 | Identity and equivalence pass; X→point tests X; point→punctured homology sphere preserves constant homology but fails acyclicity. | Full target uses every pulled-back local system. |
| 3.4 | Identity kernel is trivial; acyclic-to-point kernel is all π₁; central image of π₂Y does not force that kernel to be abelian. | Perfect quotient argument and CW restriction of the Lean representative stated explicitly. |
| 3.5 | Trivial deck group recovers ordinary chains; sign module changes circle boundary; nonflat module prevents commuting tensor with homology. | Right deck action is inverted and flatness is not omitted. |
| 3.6 | Identity fibration; point base; first nonzero relative fibre-homology group lies in column zero. | Add explicit proof route for the source's omitted reverse implication. |
| 3.7 | Identity and plus inclusion pass; point→nontrivial acyclic space fails regular-cover coefficient test. | All local systems, connected CW hypotheses and actual pullbacks retained. |
| 3.8 | Identity is plus at bottom; acyclic-to-point is plus at top; nonperfect P cannot occur. | Raw predicate and geometric standing hypotheses separated; quotient map normalized in Lean. |
| 3.9 | Identity; simply connected acyclic fibre; a nontrivial perfect kernel defeats the bijective-π₁ premise. | Weak equivalence first, homotopy equivalence only with CW type. |
| 3.10 | P=1 changes no homotopy type; perfect G gives simply connected BG⁺; nonperfect P cannot be used. | Cell data move to README; relative differential is identity over the quotient group ring. |
| 3.11 | P=1 gives original group; P=G perfect gives trivial group. | Identify inclusion with the quotient homomorphism, not an unspecified group isomorphism. |
| 3.12 | Degree zero stays ℤ; the relative two-term identity complex has zero homology in every degree. | Keep integral result as a consequence of the actual relative complex. |
| 3.13 | Zero coefficient module; arbitrary quotient module; sign/nontrivial action retained. | Identity differential remains invertible after tensor, without a flatness assumption. |
| 3.14 | Point and S¹ pass; RP² has abelian π₁ but nontrivial action on π₂. | All positive-degree actions required. |
| 3.15 | Circle group and connected topological groups pass; disconnected input is excluded. | Unit homotopies suffice; associativity not added unnecessarily. |
| 3.16 | A=0 contracts; A=ℤ,n=1 gives circle; K(ℤ/2,1) has nonzero H₃ unlike RP². | Maps of spaces and homotopy classes remain separate interfaces. |
| 3.17 | Identity pair has zero relative groups; n=2 requires the crossed-module action; nontrivial action is excluded. | Keep NDR, connectivity and trivial-action premises on this Hurewicz theorem. |
| 3.18 | Trivial fibre; n=1 abelian fibre; nontrivial monodromy obstructs principal recognition. | Relative π action is the precise criterion. |
| 3.19 | Constant point and identity towers; shrinking discrete tails have nonempty stages but empty holim; P₁S²=point, P₂S²=K(ℤ,2). | Add explicit path model, section invariants, bonding-map distinction and six Checks. |
| 3.20 | Point gives reduced zero; circle and n=1 recover homomorphisms; n=0 uses discrete locally constant values. | Based reduced and unbased ordinary forms retained. |
| 3.21 | S¹ stabilizes after stage one; S² first retains π₂ at stage two; RP² action excludes the principal untwisted statement. | Keep compatible tower maps and k-invariants. |
| 3.22 | Identity pair has zero obstruction; n=1 obstruction is degree two; sign monodromy changes differential to −2. | Twisted coefficient module and Hⁿ torsor are explicit. |
| 3.23 | Identity pair; homology-equivalence pair has vanishing cohomological obstructions; n=1 cannot use H¹ instead of H². | General obstruction criterion separated from homology-isomorphism specialization. |
| 3.24 | Identity and simply connected cases; RP² is excluded from the abelian-space premise. | Integral homology alone is not used for arbitrary spaces. |
| 3.25 | Point, circle and connected topological groups; a homology map need not preserve multiplication. | H-map hypothesis not imposed; CW type retained. |
| 3.26 | P=1 reduces to homotopy equivalence; map to point; nonabelian target still uses quotient local systems. | General lift/uniqueness use twisted relative obstructions, not only the abelian-target theorem. |
| 3.27 | Same chosen plus model; two cell choices; compatibility is under X up to homotopy. | No on-the-nose equality of chosen spaces. |
| 3.28 | Identity group map; composition preserving P; map not preserving P is excluded. | Functor laws in homotopy category; coherent selected model is separately named. |
| 3.29 | Contractible target; BGL⁺ recognition; constant homology alone without abelian intermediate target is insufficient. | Keep the abelian-target comparison and actual factorization. |
| 3.30 | Trivial perfect group; P=G gives π₂BG⁺=H₂G; ℤ has no universal central extension. | Full universal lifting property, superperfect source and kernel/H₂ comparison are local foundations. |
| 3.31 | Identity and trivial group maps; inclusion P→P′ fixes the induced H₂ map. | Preserve quotient action and basepoint transports. |
| 3.32 | H=G gives identity cover; H=P gives universal cover; P=1 recovers BH→BG. | Remove self-dependency; retain actual covering projection. |
| 3.33 | Trivial extension; superperfect E gives π₁=π₂=0 after plus; boundary recovers central kernel A. | Keep relative-plus argument and nontrivial BA fibre. |
| 3.34 | Identity plus gives original fibre; point base reduces to f; a chosen factorization supplies the pullback square. | General closure is proved by homotopy-pullback invariance, not misattributed to the UCE exercise. |
| 3.35 | ℤ finitely generated, ⊕ℕℤ not; ℤ/p² is finite p-primary; exponent-p groups fail extension closure. | Add six named closure operations and three discriminating Checks. |
| 3.36 | A=0; A=ℤ; finite cyclic p-groups; unrestricted p-torsion is a filtered union. | Only the supported three Serre classes; finite generation is not filtered-colimit closed. |
| 3.37 | K(ℤ,1), finite-primary K(A,n), RP² excluded by its action. | Positive homotopy/homology criterion and degree-n kernel/cokernel version retained. |
| 3.38 | K(ℚ,1) exterior, K(ℚ,2) polynomial; point-base product; derivation sign on two odd factors. | Multiplicative input and finite-type rational hypotheses remain named. |
| 4.1 | Zero additive category; finite-set core; noninvertible map has no core arrow. | Existing skeleton monoids consumed; new core/π₀ comparison replaces duplicate Skeleton target. |
| 4.2 | Unit category gives point; discrete ℕ gives addition, not a group; two rank-one finite sets give rank two. | Add three Checks and general k-product formulation. |
| 4.3 | Unit groupoid contracts; Picard input already grouplike; all projective maps instead of isomorphisms contract. | Keep translation quotient and rank difference; correct unit-to-id⊗swap obstruction with diagonal-matrix witness. |
| 4.4 | Trivial action gives X; ℕ acting on itself gives its ordered telescope, not discrete ℕ. | Remove duplicate coherent-action definition; use Mathlib's full action input. |
| 4.5 | (2,1)↦+1, (1,2)↦−1, (0,0)↦0. | Actual generator and swap normalization retained in README and Lean. |
| 4.6 | ℕ→ℤ passes; grouplike identity passes; disjoint symmetric-group spaces→ℤ fails higher homology localization. | Components alone do not define group completion. |
| 4.7 | Trivial monoid gives identity projection; translation matrices retain injectivity. | Keep faithful translations and specified cocartesian transitions. |
| 4.8 | Trivial action identity; invertible translations; non-groupoid input excluded by the source. | Add explicit symmetric-monoidal-groupoid premise. |
| 4.9 | Unit category; Picard case; finite-set core gives nontrivial higher completion. | All degrees/coefficient rings and actual localization maps retained. |
| 4.10 | Already grouplike input; disconnected abelian group; components translated to unit component. | CW-type homology Whitehead is applied componentwise. |
| 4.11 | Countable monoid and countably cofinal submonoid; finite-type hypothesis needed to eliminate phantoms. | Restore supported cofinal generality; no arbitrary unique comparison claim. |
| 4.12 | Trivial X; identity action; failure of monicity or Aut injectivity is outside the theorem. | Keep both extra action hypotheses. |
| 4.13 | P=Q=1; acyclic spaces to points; infinite CW product requires k-product/CW replacement. | Product fibre/kernel statement retained with correct topology. |
| 4.14 | Rank zero and zero ring; field determinant quotient; E₂(𝔽₂)=S₃ is not perfect. | Stable third-index argument, not finite-rank perfectness; duplicate dependency removed. |
| 4.15 | Zero/free projective complements; non-IBN ring identifies module ranks but not labels; nonprincipal Dedekind ideal lacks free complement. | Name the finite projective complement target; allow projective Q, not only free Q. |
| 4.16 | Zero ring still has rank labels ℤ; field recovers determinant/K₁; rank pair (2,1) fixes component. | Actual rank-labeled free category, not all module maps. |
| 4.17 | Identity telescope and cofinal product sequence; no cofinality from only one initial stage. | Correct weak comparison direction ΩBM→Borel fibre; CW models needed for HE language. |
| 4.18 | Unit groupoid; free-module rank-one stabilization; noncommuting finite-rank automorphisms become stable commutators. | Stable perfectness uses disjoint blocks and faithful translations. |
| 4.19 | Identity cofinal functor; finite-free→projective complemented objects. | Aut bijectivity is not added to the action theorem. |
| 4.20 | Identity; inclusion missing some component classes but covering after complements. | Positive π isomorphisms require Aut bijectivity; π₀ need not be onto. |
| 4.21 | P=0; nonfree finite projective; zero ring has K₀=0 rather than rank-label ℤ. | Reuse split K₀; unit component is BGL⁺. |
| 4.22 | Identity ring map; zero ring map; entrywise matrix maps and scalar extension. | Naturality square uses actual functors. |
| 4.23 | Identity strictification; unit/two/three tensor words; permutation and symmetric quasi-inverse. | Replace wrong opposite-category exercise attribution; retain symmetric rather than bare categorical equivalence. |
| 4.24 | Point Γ-space; discrete abelian group; ℕ special but not very special; noncontractible nullary input fails. | All Γ maps/nullary condition retained. |
| 4.25 | Zero category; finite-set core; projective direct sums; missing sums fail the input. | Underlying sequence and full spectrum machine remain separate named targets. |
| 4.26 | Unit groupoid; finite-dimensional vector spaces over a field; Picard groupoid; naive subset diagrams lack coherence. | Replace ambiguous integral vector-space example by finite free/field input; retain symmetric braid/inverse/unit tests. |
| 4.27 | Point; grouplike discrete abelian group; ℕ only deloopable by equivalences in positive levels. | Zero-level grouplike distinction retained. |
| 4.28 | ℕ completes to ℤ; group input unchanged; finite-set core retains stable symmetric-group homology. | H-map/localized homology unit required, not just π₀ completion. |
| 4.29 | Grouplike object has invertible unit; mapping into nongrouplike objects is not the claimed adjunction. | Keep derived unit/counit laws. |
| 4.30 | Discrete abelian group is Picard; finite-set core lacks inverses; odd line has nontrivial self-swap. | Symmetry retained with π₀ and π₁. |
| 4.31 | Zero form; positive/negative rank-one forms; even hyperbolic and odd forms differ at 2. | Scope remains classical symmetric unimodular ℤ-forms, with existing form carriers. |
| 4.32 | Discrete ring gives original construction; ℝ gives π₁ko=ℤ/2 rather than ℝˣ; negative Bott groups distinguish periodic from connective. | Correct ko/ku versus KO/KU and retain continuous topology. |
| 5.1 | S⁰ is smash unit; pointed zero smashes to zero; S¹ has one nondegenerate one-cell; S⁰×S⁰ is not S⁰∧S⁰. | Smash/monoidal/sphere data belong in README; strict loops require Kan input. |
| 5.2 | Zero and sphere spectra; iterates zero/one/successor; a sequential map sending one of the two triangles of S¹∧S¹ to a generator and the other to basepoint fails symmetric equivariance. | No admitted iterσ or spectrum carrier; retain the concrete negative control. |
| 5.3 | Zero groups; sphere π̂₀=ℤ, negative groups zero; F₁S¹ distinguishes naive from true. | Integer degree uses a sufficiently high nonnegative, then abelian, tail. |
| 5.4 | HA and zero are Ω-spectra; sphere is not; positive Ω condition does not control level zero. | Kan/Ω/naive-connective conditions remain distinct. |
| 5.5 | Suspension spectrum of point is zero; F₀S⁰=S; free levels below m vanish; F₁S¹ has unusual naive groups. | Free/coend constructions retained only as full README targets. |
| 5.6 | Zero; sphere shift; F₁S¹ prevents naive shift equivalence without semistability. | Block permutation and λ orientation retained. |
| 5.7 | Cone(id) contracts; cone(X→0)=ΣX; boundary at degree zero lands in degree −1. | No unnecessary semistability hypothesis on the naive LES. |
| 5.8 | Fibre(id) contracts; fibre(0→Y)=ΩY after Kan replacement. | Strict loop/fibre needs fibrancy, distinct from derived fibre. |
| 5.9 | Zero/sphere/Ω-spectra pass; F₁S¹ fails. | Do not equate naive and true π in general. |
| 5.10 | Identity/level equivalence pass; F₁S¹→S stable but not naive π iso; 0→S fails. | Mapping-class definition ranges over injective Ω-spectra, not one test object. |
| 5.11 | Semistable sphere case; nonsemistable free-one example. | Only forward implication is unconditional. |
| 5.12 | Zero, HA, shifted HA in negative degrees; F₁S¹ true π₀ agrees with sphere. | Stable replacement is a README construction, not sorry'd data. |
| 5.13 | Sphere unit and zero product; degree-one generators; second-variable suspension contributes minus. | Retain distinct first/second suspension formulas. |
| 5.14 | Point Kan; horn anodyne; interval boundary cofibration not weak; stable free-one map not level weak. | Add explicit model Checks; absolute sphere cofibrant but 0→S not positive cofibration. |
| 5.15 | Zero object has zero groups; [S,HA]=A; level localization would not invert the required stable map. | Complete the zero-object Check; localization carrier stays in README. |
| 5.16 | Identity cone; source-to-zero cone; zero-to-target derived fibre; strict quotient is not general cone. | Distinguish Kan-level from derived fibre explicitly. |
| 5.17 | Identity and zero maps; every integer degree including degree zero boundary. | Actual fibre/cofibre maps and signs required. |
| 5.18 | Identity has zero fibre/cone; zero map gives split summands and detects minus target inclusion. | Keep hΣδ=−i rather than plus. |
| 5.19 | Zero summand; two sphere factors give four matrix entries id,0,0,id. | Finite wedge/product comparison only. |
| 5.20 | Empty product is zero stable object; two factors give biproduct; infinite factors use injective Ω replacements. | Point-set product of arbitrary unreplaced spectra is not substituted. |
| 5.21 | Rotate identity triangle: last map is minus suspended identity; char 2 alone would not detect sign. | Actual Mathlib derived-category rotation equation proved in Lean. |
| 5.22 | Sphere and zero inputs; level-zero smash; two odd sphere factors have nontrivial symmetry. | Full bimorphism equations include second-variable block permutation; no partial carrier retained. |
| 5.23 | Sphere/free/zero flat; deleted-zero-level sphere has a nonmono latching fold. | Flatness uses underlying latching mono, not free symmetric action; comparison requires a flat input. |
| 5.24 | (1,1) twist has degree −1; (0,1) degree +1; negative shifts use integer degrees. | Keep oriented sphere-factor isomorphism and inverse shifts. |
| 5.25 | Product with sphere unit; two odd generators; sign becomes +1 mod 2. | Integral parity and characteristic-two specialization computed in Lean. |
| 5.26 | Zero spectrum; arbitrary shifted spheres; HA bottom tensor formula. | Integer connectivity and bottom degree only; no false all-degree Künneth formula. |
| 5.27 | Zero ring terminal; sphere initial; Hℤ ring; S/2 cannot be unital; e₁₂e₂₁≠e₂₁e₁₂. | Keep actual unit/product and π₀ addition agreement. |
| 5.28 | R=S; zero module; free R maps compute π₀; free-one stable equivalence is not levelwise. | Full model/free–forgetful targets; no false zero-ring negative example. |
| 5.29 | Unary-only operad is not E∞; Com algebra equations; Barratt–Eccles arity has π₀=ℤ, not zero. | Repair spectral contractibility error; positive rectification stated with full laws and no underlying positive-cofibrancy claim. |
| 5.30 | A=0; constant A only π₀; Dold–Kan A[1] only π₁; smash circle chains have extra cells. | Direct Jardine source and corrected Shipley pages; quasi-isomorphism, not literal chain equality. |
| 5.31 | Connective point/sphere; HA only degree zero; negative homotopy in target allowed by coconnectivity. | Heart result retains all hypotheses and normalized identity on π₀. |
| 5.32 | Zero ring/module; canonical ℤ→R unit; M₂(ℤ) right action order; HF₂∧HF₂ has extra homotopy. | Relative HR smash is not sphere smash; matrix order computed in Lean. |
| 5.33 | Zero/acyclic complex; ℤ in cochain +2 gives π₋₂, in −2 gives π₂; differential ×2 gives ℤ/2, not a graded direct sum. | Correct sign mismatch; unbounded model/derived equivalence stays explicit. |
| 5.34 | Degree-two cochain object moves to degree one under [1], hence π₋₂→π₋₁. | Actual shifted component and zero opposite-degree component checked in Lean. |
| 5.35 | Point, degree zero gives A; negative ordinary cohomology vanishes; reduced sphere homology shifts correctly. | Separate ordinary cohomology representability and HA smash-homology comparison. |
| 5.36 | Connective X unchanged at cover zero; Σ⁻¹Hℤ erased; Hℤ∨Σ²Hℤ∨Σ⁻²Hℤ retains the correct summands. | All integer covers/sections and their opposite adjunction directions retained. |
| 5.37 | Constant identity sequence has hocolim X, not ⊕X; zero maps yield zero; multipliers 1,2,3 give ℚ. | 1−shift and stage-map equations fixed; coherent telescope needed for functoriality. |
| 5.38 | Empty compact generating set gives trivial cellular part; sphere generation uses all needed shifts; zero functor yields zero. | Compactness and sums-to-products premises retained. |
| 5.39 | Sphere in degree n; zero spectrum; right extensions/sums preserve the stated connectivity bound. | Generation uses shifted spheres and actual all-π approximation. |
| 5.40 | Zero stable object; identity cofibre square; ΣS has π₁=ℤ and π₀=0. | Fix BS's connectivity convention explicitly; add model/localization/monoidal prerequisites. |
| 5.41 | Discrete abelian input gives HA; nongrouplike ℕ requires completion first. | Full grouplike machine equivalence, not only an object correspondence. |
| 5.42 | Discrete A gives HA; one-object BA gives ΣHA; odd real line self-braiding is −1. | Retain Hopf action and all integer homotopy vanishing claims. |
| 6.1 | Zero category; S₀ terminal, S₁=C, S₂ has quotient square; finite pointed sets count nonbasepoints; acyclic complex is weakly zero. | Replace all Lean assembly data by README target; add explicit Waldhausen K₀ relations/map/universal property and four Checks. |
| 6.2 | Zero category; n=1 first relative-S delooping; unreplaced level zero need not be group-completed. | Foundations/additivity precede comparison; n≥1 positive Ω conclusion. |
| 6.3 | Identity exact functor; split projectives recover split K₀; finite pointed sets recover sphere. | Keep non-split cofibration relations and BPQS comparison as separate targets. |
| 7.1 | m=1 gives zero; m=0 has extra H₁; m=2 has π₂=ℤ/4 and no unit; odd modulus lifts are unique. | Complete m=1 Check, retain ambiguity and Moore-space shift; no admitted Moore carrier. |
| 7.2 | E=0; m=1; Hℤ/m=H(ℤ/m); ΣH(ℤ/2) at degree two has torsion contribution. | Preserve derived smash, duality shift and non-tensor example. |
| 7.3 | Identity/zero coefficient class; every integer n; H(ℤ/2) produces degree-one Bockstein term. | Correct page span; use chosen triangle boundary. |
| 7.4 | Hℤ has quotient term; shifted H(ℤ/2) has torsion term; S/2 produces nonsplit ℤ/4. | No general splitting or tensor-only formula. |
| 7.5 | m=1 trivial; odd and 4-divisible m split; m=2 nonsplit. | Existence only, no functorial choice of splitting. |
| 7.6 | q₁=2,q₂=3 inclusions send 1 to 3 and 2 mod 6; q=1 summand zero. | Actual CRT inclusion direction computed in Lean. |
| 7.7 | p=2,r=1 inclusion 1↦2, reduction 1↦1; r=0 is S/1=0. | Distinguish quotient/torsion outer maps and retain nonunique even lifts. |
| 7.8 | E=0; Hℤ gives Prüfer group in degree zero; finite tensor summand vanishes. | Colimit uses inclusions, not reductions; torsion term shifts by one. |
| 7.9 | Identity tower recovers X; zero maps give contractible holim; multiplication-by-p sphere tower has extra π₋₁. | Selected TR3 lift not assumed unique/functorial; coherent model separately required. |
| 7.10 | Identity difference kernel A/cokernel 0; zero maps make difference=id; surjections permit recursive solution. | Keep actual 1−shift; build abelian algebra before applying the triangle, remove circular prerequisite wording. |
| 7.11 | p=2, 1/3 nonintegral in ℤ₂; difference series telescopes to integer; infinitely p-divisible integer is zero. | Explicit p-adic digit/kernel proof route, not reliance on unfinished draft proof. |
| 7.12 | Zero and Hℚ complete to zero; sphere π₀ completes to ℤₚ; H(ℚ/ℤ) retains a degree-one Tate module. | Completion is not tensoring homotopy groups; unit/internal-Hom/tower models identified. |
| 7.13 | Surjective quotient tower has no lim¹; finite coefficient groups remove the other lim¹; torsion tower yields Tate module. | Separate exactly which finiteness premise removes each term. |
| 7.14 | A=0 Moore zero; A=ℤ Moore sphere, Ext zero; A=ℤ/2 has nonzero mapping Ext. | Mapping UCT and smash UCT are distinct; general Moore choice not asserted functorial. |
| 7.15 | ℤ gives ℤₚ with residue 1; ℤ/p survives; ℤ/ℓ dies for ℓ≠p; non-finitely generated Prüfer input has Tate correction. | Prime and both adjacent finite-generation inputs explicit. |
| 7.16 | Hℚ is noncomplete when nonzero; H(ℤ/p) complete; p-inverted sphere is the actual multiplication telescope. | Criteria refer to specified unit/maps, not arbitrary equivalent carriers. |
| 7.17 | Complete fibre with zero mod p is zero; nonzero rational spectrum has zero mod p and is a counterexample without completeness. | Keep completeness at source and target. |
| 7.18 | Zero, products, fibres and retracts pass; infinite sums of complete groups need not be complete. | Do not claim arbitrary coproduct closure. |
| 7.19 | S/2 degree-two group is ℤ/4: 2 does not kill it, 4 does; r=0 gives zero. | Bound is p^(2r), not p^r. |
| 7.20 | N(k)=0 forces that degree zero; uniform N=0 forces E=0; degreewise bounds make multiplication towers pro-zero. | Restore degreewise bounded-exponent generality. |
| 7.21 | Zero; Hℤ/p rationalizes to zero; sphere gives ℚ; first maps 1 and 2, not 0 and 1. | Keep exact unit/universal property and Lean multiplier computation. |
| 7.22 | Zero graded vector space; degrees 0 and 2; sole degree −2 gives Σ⁻²Hℚ. | Add three tests; product indexed by all integers, no hidden connectivity. |
| 7.23 | Hℤ diagonal unit gives 1−1=0; (2,1)↦+1 and (1,2)↦−1. | Add reader/Lean difference witness; rationalization stays outside infinite prime product. |
| 7.24 | Constant nonzero filtration exhaustive but not complete; zero filtration of E complete but not exhaustive; Whitehead graded piece has degree −s. | Coherent replacements/relative cofibres remain explicit. |
| 7.25 | Zero E permits nonzero invertible i; tuple couple has i²=i and jk(0,1)=(1,0), (jk)²=0. | Correct false Check and compute it in Lean; retain unsplit two-column extension indexing. |
| 7.26 | Zero and single-step filtrations; constant nonzero filtration has zero pages but nonzero colimit. | Candidate filtration distinguished from convergence; d_r lowers s+t by one. |
| 7.27 | Finite filtration collapses; zero negative stages make exiting differentials eventually zero; E may be nonconnective. | Bounded-below filtration, not connective spectrum, is the hypothesis. |
| 7.28 | Constant tower has F₀ only; growing connectivity makes π towers eventually constant; (0,2) maps by d₁ to (1,2). | Add total-degree witness, preserve fibre construction rather than bare index reversal. |
| 7.29 | Zero couple; D=ℤ,i=id,E=0 has zero pages but fails conditional hypotheses; finite cycles are ML. | Add three negative/degenerate controls; RE∞ and whole-plane W are separate. |
| 7.30 | X=point recovers coefficients; E=HA recovers ordinary homology; E=0 gives zero. | Homological bounded-below skeletal filtration convergence; cohomological convergence separately scoped. |
| 7.31 | Moduli 1,2,3,4,8 and odd p²; mod 2 lacks unit; mod 3 lacks associativity. | Distinguish selected Araki–Toda products from other associative products on S/4 or S/8. |
| 7.32 | q=n+1 passes q>n; q=n excluded; zero quotient harmless. | Only v-compatible uniqueness, with the monoidal and right-unit premises. |
| 7.33 | E=0 and connective odd-positive-degree rings; sphere has positive even stems and is excluded. | Vanishing applies to E, so no contradiction with S/2 obstruction. |
| 7.34 | p=2,n=1,q=3 gives S/8 E₁; n=2 requires q≥5; odd p,n=1,q=2 passes. | Integer 2q≥3(n+1) bound retained, no blanket algebra uniqueness. |

The section table also covers the unnumbered layer examples: each is a specialization of its named checks, with no stronger conclusion. Scope, coefficient universes, path multiplication, cochain shift, spectral degrees, Moore modulus and convergence conventions are pinned by the rows above and the corresponding Lean computations. Source locators and ownership changes are recorded separately so that the algebraic examples are not mistaken for verification of an entire source proof.

## Validation and next step

- `lean-check research/blueprint/packages/StableHomotopyKTheory/Suggested.lean`: exit 0, 494 lines, 53 warnings, all `declaration uses sorry`, no errors. The file contains 30 theorems, 45 examples and 11 real-bodied data/predicate declarations. Elaboration establishes signature compatibility, not the admitted mathematics.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/StableHomotopyKTheory/Suggested.lean`: exit 0, no offenders.
- `python3 scripts/check_blueprint.py research/blueprint/packets/StableHomotopyKTheory.json`: exit 0, 0 errors and 0 warnings. This reads the existing packet; the packet is outside this issue's editable paths and is unchanged.
- `python3 research/blueprint/intake.py check-files` on the four issue deliverables: exit 0, 4 files, 0 problems. JSON parses and no private paths occur.
- `git diff --check`: exit 0. Only the four authorised deliverables change.
- Exact reader inventory: 3,078 lines; all 222 original numbered subsections retained; 740 distinct named API/Check bullets versus the original 698. The only two lost names are the existing Mathlib definitions listed above. All original named Checks remain. The adversarial table has one row for each of the 222 subsection contracts; the separate source table has 15 rows.

`review.json` records `accepted` under the issue-required `fix-FIX-PKG-StableHomotopyKTheory~adv` identity. This closes the repair findings and leaves the submission for independent review. No second job is claimed. Maintainer redirections above are follow-up ownership bookkeeping outside the four allowed paths; no extra file needs to be recovered from scratch. The mathematical targets are fully specified for independent review and subsequent upstream port.
