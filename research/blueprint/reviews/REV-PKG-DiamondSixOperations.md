# REV-PKG-DiamondSixOperations

Independent package review by Codex, session `codex-6oopjk`, 2026-10-13, for issue #9209. The package was written by Claude in `claude-myKl7u`; I did not write or previously review that package.

**Verdict: accepted with the corrections below.** The resulting package is ready for a draft TauCetiRoadmap PR. This verdict concerns the mathematical plan and its representative signatures; the theorems with `sorry` remain formalisation targets.

## Coverage and upstream form

I read the entire package README and Suggested.lean, the accepted 90-node packet, the package author's handoff, WORKERS.md, PACKAGE_REVIEW.md, the relevant PROTOCOL requirements, the expansion protocol and UPSTREAM_GUIDE.md. The form checks used the atlas's AdicSpaces and AlgebraicTopology READMEs, and the current upstream ProfiniteArithmetic README and Suggested.lean together with AdicSpaces' suggested signatures.

The seven layers retain their exact hypotheses, proof routes, source locators, supplier names, APIs and worked examples. The README contains 97 principal target paragraphs naming 109 declarations. The 90-node packet's 99 declaration names and 141 API names are covered except for `normalizedHaar` and its seven API names, deliberately deferred to SmoothRepresentationsOfLocalGroups. All 109 principal names occur either as Lean declarations or in the closing comment. The 25 Checks blocks each contain at least three discriminating checks. The metadata remains the single fitting line `topic = "math.AG"`.

I checked the statements and API clauses in their surrounding subsection, including restriction, base change, composition, units, counits, support and coefficient changes. The adversarial table below groups an API with its defining target. Thus repeated stability APIs are checked with the same concrete map and its identity, empty and iterated pullbacks, rather than treated as separate inventions.

The README is a construction-led roadmap in the author's own words, rather than a transcription or a source digest. No packet identifiers, job narrative, coverage claims, private paths or placeholder carriers occur in the package. Heavy geometric and enhanced categorical carriers remain README targets. The suggested file has one module docstring, the required namespace, layers in order and a short closing list of README targets.

## Corrections made in place

1. **Constant hypercovers, S2.1.** A quasiseparated locally spatial diamond gives a constant hypercover in the broader class used to construct the exceptional image. It need not give one whose terms are disjoint unions of strictly totally disconnected spaces. I distinguished the two classes, required refinement for the stronger class and added empty, strictly disconnected and ball checks.
2. **Higher-rank counterexample, S6.3.** The complement of the closed point equals the generic-point open only for a two-point chain. I distinguished `j_s` from `j_η`, computed the middle stalk in a rank-three chain, and justified derived internal-Hom vanishing on each open using the flabby constant sheaf on the irreducible chain. The open–closed triangle has two pieces; the wording does not assert a direct-sum splitting. The counterexample explicitly requires nonzero coefficients.
3. **Zero coefficient ring, S4.1 and S4.2.** Finite locally constant functions are always Λ^S, but the rank cardinality assertion requires Λ nonzero. The degree −2d of the dualizing complex similarly requires nonzero coefficients. The zero-ring statement and a proved Lean extensionality example now pin this edge case; the existing nontriviality hypothesis on shift uniqueness remains.
4. **Local splitting, S0.3 and S4.4.** The source explains that compactifiability descent without local splitting is unknown. I removed the stronger assertion that cohomological smoothness fails to imply local splitting. The roadmap keeps local splitting as a separate hypothesis and uses no such implication.
5. **Upstream Haar ownership, S5.3.** I removed the remaining layer-level measure-construction/API restatement and its measure checks. The boundary already imports SR.0.3 `HasUnitProOrder` and SR.1.1 `HaarMeasureWithValues`, normalised uniqueness and integration. The retained bridge deduces invertible finite quotient orders from Tau Ceti's primewise pro-order and coefficient nilpotence; it is different from defining that condition or constructing a measure. Its four checks now concern precisely this bridge.
6. **Trace conventions, S3.4.** Added empty, one-point and F_5 two-point computations. The plain sum after the diagonal is 2; averaging after the diagonal is 1; averaging (1,0) is 3. Normalisation at cardinality zero requires the zero ring. Lean includes proved empty/one-point controls and the numerical normalised-trace target.
7. **Huber locators and amplitude.** Added the verified printed pages and corrected the Lemma 7.5.4 proof range to pp. 391–396. The classical supplier contract now states Proposition 5.5.8 with the input-complex upper bound n and output n + 2 dim.tr f, together with the separated, taut, finite-dimensional and locally +weakly finite-type hypotheses. Here n denotes the input amplitude, not a geometric dimension.

No packet or supplier package was edited. No definition, theorem or API was discarded merely to reduce the package's size.

## Sources checked directly

Every Huber locator the author had not re-read was checked in the maintainer-cleared 1996 book. Printed pages are used below. The results are paraphrases, with no source passage reproduced.

| Locator | Printed page | What was verified |
| --- | --- | --- |
| Corollary 1.6.10 | 80 | Local smooth charts through relative Tate balls; the analytic smooth-map target uses these charts. |
| Proposition 5.5.8 | 304 | The output upper bound is n + 2 dim.tr f for a complex bounded above by n, under the stated geometric hypotheses. |
| Theorem 6.2.2 | 329 | Constructibility for the smooth separated family in the classical supplier contract, including the analytic base and coefficient conditions. |
| Theorem 7.2.2 | 368 | The smooth-curve trace on compactly supported degree-two μ_n-cohomology and its point normalisation. |
| Theorem 7.5.3 | 390 | The smooth trace-induced duality comparison permits arbitrary K in D(X), while the second coefficient L is in D⁺(S). This supports the all-G use with a bounded open coefficient. |
| Lemma 7.5.4 | 391–396 | The trace-induced comparison is an isomorphism, with the compatibility used in the ball argument. |

The random sample consists of 15 distinct remaining packet targets selected with Python's `random.Random('codex-6oopjk')`. I opened and read the associated passages in Scholze's arXiv:1709.07343v4, dated 14 April 2026. Its printed and PDF pages agree; the checked PDF has SHA-256 `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`.

| Sampled target | Verified ECD locator | Finding |
| --- | --- | --- |
| S3 adjunction calculus | 23.4(i), p. 141; 23.12(iii), p. 147 | Trace-adjoint twisted pullback and the smooth base-change comparison have the stated direction. |
| S6 closed-point detection | Proof of 25.4, p. 161 | Compactified geometric points, Zariski–Riemann fibres and closed-point detection are the intended argument. |
| S1 cohomological dimension | 22.5, pp. 130–131 | General 3d bound and the separately qualified 2d bound are retained. |
| S3 internal Hom | 23.3(ii), p. 140; proof p. 141 | Exceptional inverse image of internal Hom has the stated first pullback argument. |
| S2 base change | 22.19, pp. 137–138 | The eligible exceptional image commutes with arbitrary base change. |
| S4 universal openness | 23.11, p. 146 | Cohomological smoothness implies universal openness, including the nonvanishing ingredient. |
| S2 exceptional image | Construction after 22.17 and 22.18, p. 137 | Enhanced descent glues the exceptional image beyond locally spatial bases. |
| S4 target locality | 23.15, p. 150 | The local representability and local dimension conditions remain in the roadmap. |
| S2 hypercover independence | 22.18 and following paragraph, p. 137 | Refinements compare the constructions; stronger geometric refinements are separately owned here. |
| S5 perfectoid ball | 24.1, pp. 152–153 | Smoothness and the Λ(1)[2] dualizing convention match the trace argument. |
| S0 compactifiable | 22.2, p. 128 | Open immersion followed by partially proper map, without adding representability. |
| S4 direct sums | 23.7, pp. 144–145 | Direct-sum preservation is equivalent to constructibility of exceptional images in the stated situation. |
| S4 exceptional base change | 23.12(iii), p. 147; proof pp. 148–149 | The canonical transformation is an isomorphism for smooth f. |
| S6 Verdier dual | 25.1, p. 158; 25.4, p. 161 | Biduality and conservativity have different hypotheses; neither is extended to arbitrary plus rings. |
| S0 eligible | Convention 22.1, p. 127; local dimension discussion p. 135; 22.18, p. 137 | Compactifiability, representability and local dimension are distinct requirements. |

I also read the critical dimension and compactification passages 21.1–21.8, pp. 122–123; the free/nonfree quotient proofs 24.2–24.3, pp. 153–155; the analytic and arithmetic examples 24.4–24.5, pp. 156–157; and the plus-ring counterexamples 25.2 and 25.5, pp. 158 and 161. In particular the source explicitly uses the proper quasi-pro-étale image-relation quotient in 24.3. I retained it, rather than substituting the action groupoid quotient.

## Prerequisite closure and ownership

The 90-node accepted packet passes `scripts/check_blueprint.py` with zero errors and zero warnings. The package contains all its retained declarations and APIs. Exact suffix matching resolves all 50 C, 32 D, 11 E, four A and four P target references in the accepted supplier packets. I read the mathematical contracts at the points of use, including C4's relative compactification properties, C8's dimension bounds, D4's small-stack/quotient contracts, E2's enhanced refinement descent and E3's right-adjoint coproduct criterion. E2's refinement descent does not itself construct geometric common refinements; S2.1 supplies those.

CaraianiNewton's order places SmoothRepresentationsOfLocalGroups at tier 2; AdicEtaleGeometry, PerfectoidSpaces and DiamondsAndVStacks at tier 3; EnhancedDerivedSheaves at tier 4; ClassicalAdicEtaleCohomology at tier 10; DiamondEtaleCohomology at tier 11; and this package at tier 12. Every prerequisite ends in the pinned libraries, an earlier layer or one of those lower suppliers. Higher consumer roadmaps occur only as ownership boundaries or consumers. There are no upward Needs lines, `UPSTREAM:` prerequisites or FoundationsAndLibraryIntegration dependencies.

The library-coverage audit has no DiamondSixOperations layer entries, so it was not treated as proof that a target is absent. Pinned declarations were read locally: `nonempty_inter_closedPoints`, `JacobsonSpace.of_isOpenEmbedding`, `IsLocalRing.exists_factor_valuationRing`, `finite_of_finite_type_of_isJacobsonRing`, integer-coefficient `LocallyConstant.freeOfProfinite`, `Adjunction.comp`, `conjugateIsoEquiv`, `rootsOfUnity`, `Module.evalEquiv`, the degree-zero single-complex homology comparison, and Tau Ceti's pro-order/index/Lagrange statements. Tau Ceti's Order, Lagrange and Index/Basic modules used for these checks agree byte-for-byte with f790474. Mathlib is 082e2d37e8b0463410cdb532e111cd43d5a66174.

| Accepted-plan request or gap | Package resolution and residual obligation |
| --- | --- |
| Geometric strict-disconnected hypercovers and common refinement, requested from E2 | Named targets in S2.1, with construction route and distinguishing checks; enhanced descent still comes from E2. |
| Fibre-chain bound and dimension of canonical compactification, requested from C8 | `fibreDimension_le_dimTrg` and `dimTrg_canonicalCompactification` in S1.1, with exact analytic/dimension and universally open presentation suppliers. |
| Nonfree profinite image-relation quotient, requested from D4 | `quotientByProfiniteAction` in S5.3, using D4 small v-sheaves and D5 quasi-pro-étale permanence. |
| Compact-generation criterion, requested from E3 | Already supplied by `E3/right-adjoint-coproducts`; the compactly generated source hypothesis is retained. |
| Higher-rank classical curve duality | Explicit lower contract in ClassicalAdicEtaleCohomology §9.6; Huber's all-K/bounded-L comparison was checked directly. Its formal proof remains that supplier's work. |
| Local compactification over a nondiscretely valued algebraically closed field | Explicit lower contract in ClassicalAdicEtaleCohomology §8.2. The generality is not inferred from the discretely valued compactification citation. Its proof obligation remains with the accepted lower package. |

These are complete roadmap targets or explicit lower contracts, not claims that the missing geometric infrastructure has already been formalised. No new unresolved closure defect was found in this package.

## Current upstream duplication audit

I searched by mathematical objects, operators, hypotheses and structure fields across current TauCetiRoadmap main and Completed, including the nine additions named in WORKERS.md, and across the current Tau Ceti library. The inspected upstream commit is `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These checkouts were read only.

| Targets audited | Existing work and decision |
| --- | --- |
| S0–S2 compactifiability, eligible maps, dimension bridges, support and hypercover constructions of exceptional image | No current roadmap or library supplies these diamond/v-stack exceptional operations. AdicSpaces provides analytic foundations, not these statements. Retained. |
| S3 adjunction duality, mates, twisted pullback and trace | Mathlib supplies adjunction composition and conjugation, not the kept internal-Hom consequences, specified transformation or finite trace normalisation as these targets. The formal hypotheses use those existing APIs. Retained. |
| S4 locally constant freeness | Mathlib proves integer-coefficient Nöbeling; the kept theorem extends it to every commutative Λ by base change. The distinction is explicit. Retained. |
| S4 smoothness criteria, degree, dualizing complex and stability | Current profinite/derived roadmaps provide prerequisites, not cohomological smoothness of diamond maps. Shift uniqueness adds the nonzero coefficient hypothesis. Retained. |
| S5 Haar measure and unit pro-order | SR.0.3 and SR.1.1 already own `HasUnitProOrder`, `HaarMeasureWithValues`, normalised uniqueness and integration. The original author removed `normalizedHaar` plus seven APIs; I removed the remaining layer restatement. Their definitions occur only in the boundary. |
| S5 finite quotient order bridge | Tau Ceti supplies supernatural order and its quotient inequalities, not the nilpotent-coefficient unit conclusion. The bridge derives the SR hypothesis instead of defining it. Retained. |
| S5 perfectoid ball, twists, free/nonfree quotients and Spd ℚ_p | Analytic polydiscs, profinite arithmetic and cohomology are different objects; they do not supply the absolute perfectoid v-sheaf ball and its exceptional dualizing complex. Retained. |
| S6 valuation refinement and Jacobson detection | Mathlib's dominating valuation theorem does not refine inside V₀ with residue k. Existing scheme Jacobson/skyscraper results do not assert the kept general topological sheaf theorem. Retained, with exact suppliers. |
| S6 biduality, finiteness, conservativity and plus-ring failures | No matching diamond Verdier-duality target exists in current main, Completed or Tau Ceti. Retained. |

All 97 principal target paragraphs and their API clauses were assigned to these object-based searches. Modular-form diamond operators and arithmetic profinite group cohomology hits were read as different objects, not counted as duplicate geometric operations.

## Lean signatures and verification

`lean-check` on the final Suggested.lean exited 0. The 370-line file has five light definitions, nine theorems and 18 examples. Its 22 warnings are all `declaration uses sorry`; no data definition has a `sorry` body. The added zero-ring locally constant example has an explicit extensionality proof. The heavy target names are retained in the closing comment, not assigned artificial Lean carriers.

I compared all 14 signatures with the README, exceeding the required sample of ten:

| Signature | Mathematical match and concrete check |
| --- | --- |
| `formalVerdierDuality` | The projection is natural in the target coefficient; taking right adjoints reverses its direction. Identity adjunctions give internal Hom with itself; restriction/coinduction along R → S gives the usual Hom adjunction. |
| `formalUpperShriekInternalHom` | The fixed A and natural variable C projection has right adjoint `ihom A ⋙ fUpperShriek`; its conjugate is the stated exceptional-Hom comparison. |
| `exceptionalBaseChange_of_baseChange` | Both composite left adjoints are typed through the four categories. Reversal yields `fLower ⋙ gUpperShriek ≅ gtUpperShriek ⋙ f'Lower`, matching S3.3. |
| `twistedPullbackTransformation` | The real body is the adjoint of the projection comparison followed by the counit and unit-object unitor. Domain is `f^!1 ⊗ f^*(-)`; codomain is `f^!(-)`. |
| `finiteTrace` | Real finite sum; empty sum is zero and two-coordinate (1,0) sums to 1. |
| `finiteUnit` | Real diagonal; one point returns the argument, and two points send 1 to (1,1). |
| `normalizedTrace` | Uses an explicit `IsUnit` cardinality witness and its inverse; F_5 cardinality two gives 3 on (1,0). Cardinality zero is excluded over a nonzero ring. |
| `unitComplex` | Real degree-zero single complex in the existing derived category; the added H⁰ target identifies it with Λ, fixing the shift convention. |
| `shift_unitComplex_injective` | Nontrivial Λ is present. Cohomology singles out degree −n; the zero-ring example permits shifts 0 and 1 to be isomorphic. |
| `LocallyConstant.free_of_profinite` | General commutative Λ rather than only integers; freeness includes the zero ring. Infinite nonfinite generation and the distribution counterexample separately require nonzero coefficients. |
| `isUnit_card_quotient_of_profiniteOrder` | Compactness, total disconnectedness, continuous multiplication, prime ℓ, zero ℓ-exponent and ℓ-power nilpotence are all present. Discrete noncompact ℤ cannot enter the theorem. |
| `isZero_of_isZero_stalk_closedPoints` | A sheaf of modules on a Jacobson TopCat, vanishing at every closed point; no separatedness or constructibility restriction is silently added. Sierpiński is the excluded case. |
| `exists_closed_valuationSubring_le` | Algebraically closed k, finitely generated k-subalgebra A and A ⊆ V₀ are explicit. Residue k is encoded by reducing every w to a constant modulo nonunits. |
| `valuationSubring_eq_of_le` | The smaller V contains k and lies in residue-k W. This direction is precisely closedness of W; reversing containment would be false. |

Elaboration confirms types and available APIs; the mathematical checks below provide the additional truth audit.

## Adversarial pass: every principal target

Each row covers the named principal statement and its local API. “Retained” means the explicit hypotheses survive the tested instances; it does not mean the target theorem has a Lean proof. Empty maps, zero objects, identity maps and iterated squares were checked throughout. The nontrivial instance or excluded case distinguishing each row is recorded here.

| Statement | Instances and computed or distinguishing result | Action |
| --- | --- | --- |
| `IsCompactifiable` | Identity and empty maps factor; an open disc factors through its canonical partially proper envelope; doubled-origin étale maps fail separatedness. | Retained. |
| `isCompactifiable_iff_isSeparated_and_isOpenImmersion` | Spa(C,O_C) inside Spa(C,C⁺) is an open canonical-compactification map; a nonseparated source is excluded by the conjunction. | Retained both conditions. |
| `IsCompactifiable.baseChange` | Pull back an open immersion to a point and to the empty diamond: the result remains open; the empty pullback stays compactifiable. | Retained arbitrary base change. |
| `IsCompactifiable.of_baseChange_of_surjective` | A surjective v-cover detects the open canonical-compactification inclusion; an empty cover of a nonempty target cannot test it. | Retained surjectivity. |
| `IsCompactifiable.comp` | Open subdisc into ball into the point: compose the two open/partially proper factorizations; inserting an identity changes nothing. | Retained. |
| `IsCompactifiable.of_openCover` | Two compactifiable opens in a separated locally spatial source glue to an open inclusion in the same envelope. | Retained separation and representability. |
| `IsCompactifiable.of_isSeparated_of_isEtale` | Finite étale maps and open immersions factor as required; the doubled-origin example is étale but excluded by separation. | Retained. |
| `IsCompactifiable.of_comp` | Cancel an open subspace through a separated map to a point; cancellation supplies no dimension or representability bound. | Retained the separate eligible hypotheses. |
| `IsLocallySplit` | Identity and an étale open-cover surjection have local sections; a proper field-extension v-cover of a geometric point need not have a section. | Removed the unsupported assertion about smoothness; kept local splitting separate. |
| `IsCompactifiable.of_comp_of_isLocallySplit` | A separated étale surjection supplies clopen local sections over a strict-disconnected test space; a mere v-cover does not supply the proof. | Retained local splitting. |
| `IsEligible` | Ball to the point is eligible; an identity on a disjoint union of balls is eligible with local bounds; a map not representable in locally spatial diamonds is excluded. | Retained all three conditions. |
| `IsSpatialEligible` | A quasicompact ball has a finite global bound; a nonquasicompact disjoint union is not spatial-eligible even if each component is bounded. | Retained the quasicompact/global distinction. |
| `IsEligible.of_comp` | For ball projections the dimension hypotheses persist under the eligible cancellation; compactifiability cancellation alone cannot make the conclusion eligible. | Retained the additional representability and local-bound hypotheses. |
| `fibreDimension_le_dimTrg`, `dimTrg_canonicalCompactification` | Finite profinite fibres have dimension zero; the one-dimensional ball has fibre bound one and canonical compactification does not raise dim.trg. | Retained both separately named bridges. |
| `lowerShriekQC` | For identity the formula gives identity; for a proper finite map it gives the finite pushforward; for an open immersion it gives extension by zero. | Retained the spatial-eligible domain. |
| `lowerShriekQC_factorisation` | Use the identity compactification and a larger partial compactification of an open immersion; the comparison is natural on coefficients. | Retained canonical comparison, not a chosen equality. |
| `properDimTrgZero_equiv_compHaus` | One and two points recover finite discrete spaces; a connected compact Hausdorff interval is permitted and is not a discrete finite set. | Retained the full compact Hausdorff category. |
| `qcqsDiamond_cohomology_continuous` | A constant inverse system gives identity; a profinite set as a limit of finite clopen partitions gives locally constant sections by filtered colimit. | Retained qcqs and transition conditions. |
| `properDimTrgZero_topological_equiv` | Finite discrete S gives a product of coefficient categories; a connected compact Hausdorff S has its topological sheaf category rather than a product over discrete points. | Retained the topological topos, not merely stalks. |
| `lowerShriekQC_cd_le_three_mul` | At d=0 the proper finite pushforward has no positive cohomology; for d=1 the coarse upper bound is 3, while ball compact support reaches degree 2. | Retained the 3d bound and geometric assumptions. |
| `lowerShriekQC_cd_le_two_mul_of_spatial` | For the spatially compactified relative ball the upper bound is 2; the nonspatial compactification case cannot be assigned this sharper estimate. | Retained the spatial compactification hypothesis. |
| `lowerShriekQC_baseChange` | For an open immersion, pullback of extension by zero is extension by zero; empty pullback gives zero on both sides. | Retained arbitrary base change in its typed domain. |
| `lowerShriekQC_comp` | Compose finite maps and an open immersion; successive summation/extension by zero agrees with the composite map. | Retained eligibility for each map. |
| `lowerShriekQC_eq_etaleLowerShriek` | For identity and finite étale maps, the constructed image is the existing étale image; an open immersion keeps the zero stalk outside its image. | Retained étale agreement. |
| `lowerShriekQC_projection` | For two points, summation of (B₁⊗A,B₂⊗A) gives (B₁⊕B₂)⊗A; zero A gives zero on both sides. | Retained the derived tensor convention. |
| `lowerShriekQC_preservesCoproducts` | Finite pushforward and extension by zero commute with sums; the zero and empty families give zero. | Retained the cohomological bound used for the general proof. |
| `exists_hypercover_strictlyTotallyDisconnected`, `hypercover_commonRefinement` | The empty and strictly disconnected constant hypercovers have the strong shape; the ball's constant hypercover only has the broader locally spatial shape. | Corrected constant-cover claim and added three checks. |
| `properSupportSubcategory` | For qc f every object lies in the support category; a closed-subdisc extension lies in it; the nonzero constant sheaf on the open disc has no relatively qc support. | Retained the relative support condition. |
| `lowerShriekLocSpatial` | Spatial-eligible maps recover S1; the open disc gives compactly supported degree-two cohomology, whereas its ordinary direct image is degree zero. | Retained left Kan extension on enhancements and local base restriction. |
| `lowerShriekLocSpatial_colim` | For a disjoint union of points the support formula gives a direct sum, rather than the direct product of ordinary global sections. | Retained the filtered support formula. |
| `lowerShriekLocSpatial_preservesColimits` | A countable sum of disc skyscrapers maps to the sum of their compactly supported cohomologies; zero summands do not change it. | Retained exactness and coproduct argument. |
| `lowerShriekLocSpatial_baseChange` | Pull back disc support to a point or open base; support formulas commute after restricting to spatial qc base opens. | Retained quasiseparated target of base change. |
| `hypercoverSupportDiagram`, `lowerShriekHypercover` | A constant hypercover gives a constant augmented diagram; face and degeneracy maps must compose coherently, so isolated homotopy-category equivalences are insufficient. | Retained the enhanced/coCartesian construction. |
| `lowerShriekHypercover_fibre` | At the augmentation and each simplex the fibre is the stated exceptional image; at an empty simplex it is zero. | Retained the fibre identification. |
| `lowerShriekHypercover_cocartesian` | For an identity face the comparison is identity; for two faces their composition is the same base-change comparison in the enhanced diagram. | Retained coCartesian transport and coherence. |
| `lowerShriek` | Identity hypercover recovers the locally spatial image; [*/K]→* for nontrivial profinite K is outside representability and is not silently assigned this functor. | Retained eligible small-stack maps only. |
| `lowerShriek_hypercover_indep` | A hypercover and itself compare by identity; two covers compare through a common refinement, and a second refinement does not change the descent result. | Retained common-refinement independence. |
| `lowerShriek_baseChange` | Pullback of a finite étale map gives its fibrewise sum; an empty fibre gives zero. The locally spatial calculation descends through the chosen covers. | Retained arbitrary base change for eligible maps. |
| `lowerShriek_preservesColimits` | Disjoint point sources and a countable coefficient sum produce a direct sum; empty diagrams produce zero. | Retained all colimits, using exactness. |
| `lowerShriek_comp` | Two finite fibres of sizes a,b produce ab coordinates and iterated summation equals total summation; a or b zero gives zero. | Retained composition direction. |
| `lowerShriek_eq_etaleLowerShriek` | An open immersion has zero stalk outside the open and the original coefficient inside; this distinguishes it from ordinary direct image. | Retained existing étale extension by zero. |
| `lowerShriek_projection` | On finite fibres the tensor distributes over sums; a two-term complex is treated with derived tensor, not underived tensor on cohomology. | Retained enhanced projection formula. |
| `lowerShriek_baseChange_comp`, `lowerShriek_comp_assoc` | Three finite maps yield the same sum in either bracketing; two successive pullbacks have the same fibres as the pasted square. | Retained both associativity and base-change pasting. |
| `upperShriek`, `lowerShriekUpperShriekAdj` | Identity and open immersion have identity/restriction right adjoints; infinite profinite projection instead has distributions and is not pullback. | Retained adjoint construction rather than universal twisted pullback. |
| `upperShriek_restrictScalars` | For ℤ/ℓ²→F_ℓ and identity, restriction is the underlying coefficient complex; the same operation commutes with the shriek adjoint by the projection-formula mate. | Retained restriction of scalars, not tensor substitution. |
| `formalVerdierDuality`, `formalUpperShriekInternalHom` | Identity adjunctions give internal Hom with itself; restriction along R→S has exceptional coinduction Hom_R(S,−). Right-adjoint conjugation reverses the supplied projection isomorphism. | Retained both formal signatures and correct directions. |
| `verdierDuality` | For f identity it is internal Hom itself; for two points, Hom from a finite sum is the finite product of the Homs, which the pushforward supplies. | Retained f_* on the right, not f_!. |
| `upperShriek_internalHom` | For identity and A=0 both sides are zero; for finite étale maps pullback of the first internal-Hom argument gives the pointwise formula. | Retained f^* on the first argument and f^! on the second. |
| `upperShriek_comp` | The right adjoint of the composite of two finite sums is successive diagonals in reverse adjoint order. | Retained composition order. |
| `upperShriek_etale` | An open immersion has restriction as right adjoint of extension by zero; for identity this is identity. | Retained separated étale hypothesis. |
| `upperShriek_pushforward_exchange` | A square restricting the base to an open has the right-adjoint mate of ordinary shriek base change; the four category directions agree. | Retained this formal exchange before smoothness. |
| `shriekTrace`, `twistedPullbackTransformation`, `upperShriekBaseChangeTransformation` | Empty trace is zero, singleton trace/unit are identity, and over F_5 on two points the sum of (1,0) is 1 while its average is 3; sum after diagonal is 2. | Added the edge and numerical checks and Lean examples. |
| `LocallyConstant.free_of_profinite` | Empty S gives zero, singleton S gives Λ and finite S gives Λ^S; zero Λ gives zero for all S. Infinite ℤ_r with F_ℓ has infinite-dimensional locally constant functions. | Scoped the rank claim and added the zero-ring Lean example. |
| `profiniteProjection_pushforward_pullback` | For S finite, Rh_*h^*C is the finite direct sum C^S; for S=ℤ_r it is C⁰(S,Λ)⊗C, not the product of arbitrary functions. | Retained locally constant rather than all functions. |
| `upperShriek_twist_tfae` | For the ball the twist and base-change conditions hold; an infinite profinite projection fails coproduct preservation, hence the equivalence is not automatic. | Retained every part of the strictly local criterion. |
| `upperShriek_twist_of_ellTorsion` | For ℤ/ℓ² the filtration has F_ℓ-graded pieces, not two copies of a derived mod-ℓ reduction; the ball has ℤ/ℓ²(1)[2]. | Retained graded-complex dévissage and restriction-of-scalars hypotheses. |
| `upperShriek_preservesCoproducts_iff` | Finite profinite fibres have constructible finite-dimensional image; infinite ℤ_r has nonconstructible C⁰(ℤ_r,F_ℓ) and the right adjoint fails sums. | Retained compact-generation/source hypotheses. |
| `IsInvertibleObject` | Λ[0] and Λ(1)[2] are invertible; a two-component space may have different shifts. Over Λ=ℤ/1 all shifts agree, so no degree is determined. | Retained locally constant degree and nonzero-ring uniqueness. |
| `IsCohomologicallySmooth` | Separated étale maps and ball projections pass; a closed point immersion into a nontrivial valuation chain is not universally open and cannot pass smoothness. | Retained compactifiability, representation and local dimension in the definition. |
| `isCohomologicallySmooth_iff_practical` | For disjoint unions of Bⁿ over disjoint point bases no uniform n exists, though the criterion holds locally. | Retained local dimension, not a false global bound. |
| `IsCohomologicallySmooth.of_separated_etale` | Identity and open immersion have f^!=f^* and unit dualizing object; doubled-origin étale maps fail the separated premise. | Retained separatedness. |
| `IsCohomologicallySmooth.upperShriek_baseChange` | Pull back a ball to a geometric point or to the empty base; the dualizing twist pulls back, and the empty comparison is uniquely zero. | Retained the canonical base-change transformation. |
| `IsCohomologicallySmooth.upperShriek_twist` | For a d=0 étale map the twist is Λ; for the ball it is Λ(1)[2]. Infinite profinite projection is the excluded distribution example. | Retained smoothness as the condition making τ an equivalence. |
| `dualizingComplex` | Ball of dimension one gives degree −2; two-dimensional ball gives −4; over the zero ring there is no unique degree. | Qualified the numerical degree by Λ nonzero. |
| `IsCohomologicallySmooth.lowerShriek_perfectConstructible` | Finite étale maps preserve finite locally free coefficients; ball compact support gives one twisted shifted perfect coefficient. | Retained perfect-constructible input and the relevant qc hypotheses. |
| `IsCohomologicallySmooth.isUniversallyOpen` | Identity, ball projection and étale opens are open after base change; a closed point of a nontrivial chain is not open. | Retained universal rather than only pointwise openness. |
| `IsCohomologicallySmooth.baseChange` | Ball products after a geometric field extension have the same dimension/twist; empty pullback remains smooth. | Retained arbitrary base change. |
| `IsCohomologicallySmooth.of_baseChange_of_surjective` | A surjective v-cover can test the twist isomorphism; a nonsurjective empty test of a nonempty map cannot detect failure. | Retained surjectivity and preexisting compactifiability/local bounds. |
| `IsCohomologicallySmooth.comp` | Two relative one-dimensional balls give dualizing Λ(2)[4]; inserting an étale d=0 map contributes no shift. | Retained composition and tensor formula. |
| `IsCohomologicallySmooth.of_comp_of_surjective` | A surjective smooth source chart detects the property of f; without it, an empty chart gives no information. Compactifiability of f is still needed. | Retained all cancellation hypotheses. |
| `representableInLocallySpatial_of_universallyOpen_cover`, `IsCohomologicallySmooth.of_comp_of_isLocallySplit` | Étale surjective charts are locally split and universally open; a general smooth cover supplies universal openness but no local-splitting implication is used. | Corrected the assertion about the unknown implication. |
| `IsCohomologicallySmooth.pushforward_baseChange` | For a finite étale smooth base-change map the pushforward comparison is a finite direct-sum comparison; an open restriction gives the usual restriction law. | Retained smooth base change and typed source/target. |
| `IsCohomologicallySmooth.upperShriek_exchange` | For identity smooth map exceptional exchange is identity; for a relative ball the shift/twist commutes with the pulled-back other exceptional inverse image. | Retained corrected compactifiability/local-dimension assumptions. |
| `IsCohomologicallySmooth.pullback_internalHom` | For identity and zero first argument the formula is immediate; for a smooth ball the invertible twist may be pulled through internal Hom in the specified argument. | Retained smooth map and correct argument order. |
| `Ball` | On Spa(C,C⁺) the ball is the relative perfected Tate ball; changes of plus ring and field preserve its v-sheaf meaning. It is not declared proper. | Retained the absolute perfectoid functor rather than an analytic-coordinate carrier. |
| `tateTwist` | For exponent zero twist is Λ; for n=4→2 the map μ₄→μ₂ is squaring, not inclusion. Characteristic-two signs do not trivialise the cyclotomic twist. | Retained the transition and tensor/dual conventions. |
| `Ball.isCohomologicallySmooth`, `Ball.dualizingComplex_iso` | One ball gives dualizing Λ(1)[2] and compact support Λ(−1)[−2]; empty base gives zero, and dimension-zero finite étale maps give Λ. | Verified trace orientation and Huber locators; qualified degree only. |
| `quotientByProfiniteAction` | Trivial action gives Y itself; a nonfree finite action uses the image relation, not [Y/K]. In particular a trivial nontrivial-group action must not retain stabilisers in this diamond quotient. | Retained the separately defined image-relation quotient. |
| `isUnit_card_quotient_of_profiniteOrder` | Trivial quotient has order 1; for pro-2 group and F_5, order 2 has inverse 3; pro-ℓ quotient in F_ℓ has order zero and is excluded. Nilpotent ℓ works equally in ramified coefficient quotients. | Removed the imported Haar API restatement; retained only the unit bridge. |
| `averagingTransformation` | For a free two-point action over F_5, integration is the average and α=3 rather than identity under q^!=q^*. Infinite profinite integration has compact-open inverse-index normalisation. | Retained the explicit denominator witness from the bridge. |
| `IsCohomologicallySmooth.quotient_free` | Free trivial-group quotient preserves the original smooth map; a free finite prime-to-ℓ torsor descends it. A nonfree action cannot be substituted in this theorem. | Retained freeness. |
| `profiniteProjection_upperShriek_distributions` | For finite S, distributions equal finite function modules; for S=ℤ_r over F_ℓ their dimensions differ. A Dirac distribution need not have a locally constant density. | Retained the distribution sheaf and negative control. |
| `IsCohomologicallySmooth.quotient_nonfree` | A trivial finite action has the same diamond quotient and passes the geometric-fibre smoothness premise. For a general action, global pro-order prime to ℓ does not replace the separate test that each geometric-fibre quotient is smooth. | Retained the additional geometric-fibre smoothness hypothesis and the global pro-order hypothesis. |
| `IsCohomologicallySmooth.of_adic_smooth` | Relative dimension zero reduces to separated étale maps; dimension one recovers the curve and twist [2]; a nonseparated doubled-origin chart is excluded. | Retained analytic smoothness charts and p≠ℓ. |
| `SpdQp.isCohomologicallySmooth` | At p=2 the finite cyclotomic torsion must be removed to obtain the torsion-free subgroup used in the torsor argument; ℓ still differs from p. | Retained the finite étale descent step, not a naive ℤ_p identity. |
| `isCohomologicallySmooth_iff_geometricBase` | Ball and finite étale maps can be tested over completed algebraically closed field points; their nonzero dualizing shifts have dimensions one and zero respectively. | Retained the stated compactifiability/locally spatial hypotheses. |
| `verdierDual`, `naiveDual` | At a point Verdier and naive dual coincide; a shifted Λ[1] dualises to Λ[−1]. On the ball Verdier dual of Λ is Λ(1)[2]. | Retained contravariant shift and the distinction between the two duals. |
| `biduality` | Finite-dimensional F_ℓ at a point is reflexive; a constructible constant on the smooth ball passes; the higher-rank plus-ring open-extension example fails. | Retained smoothness, bounded constructibility and O_C base. |
| `finite_cohomology_of_smooth` | A point has H⁰=F_ℓ; ball has the stated finite cohomology; a nonqc infinite disjoint union has infinite-dimensional degree-zero sections. | Retained quasicompactness in the finiteness conclusion. |
| `biduality_ellTorsion`, `perfect_globalSections` | For Λ=ℤ/ℓ² the constant ball has perfect global sections Λ and reflexive dual; F_ℓ as a Λ-module is not a perfect input merely because it is finite. | Retained perfect-constructible rather than arbitrary finite coefficients. |
| `not_biduality_valuedPlus` | For a nontrivial chain, j_η!F_ℓ has closed stalk zero but its double dual is constant F_ℓ with closed stalk F_ℓ. | Retained C⁺ strictly smaller than O_C. |
| `exists_closed_valuationSubring_le` | For K=k only k occurs; for k(t) local rings on P¹ have residue k. Over ℝ, the degree-two closed point has residue ℂ, so the residue-k characterisation fails. | Retained algebraic closedness and the downward containment direction. |
| `isZero_of_isZero_stalk_closedPoints` | Finite discrete spaces reduce to stalkwise zero; Spec ℤ is Jacobson; Sierpiński j_!M has zero closed stalk but is nonzero. | Retained Jacobson hypothesis and general sheaves, not merely constructible ones. |
| `closedPoints_detect_zero` | A compactified geometric-point fibre is ZR(k′/k); its nonempty locally closed sets have closed points. Arbitrary integral plus rings are not assumed to be valuation rings. | Retained the fibre-wise Jacobson argument and all-complex detection. |
| `verdierDual_conservative` | At a point F_ℓ-linear dual detects arbitrary nonzero cohomology; compact support on X and X minus a closed point detects the closed stalk. | Retained O_C base, compactifiability and local dimension; no smoothness or constructibility added. |
| `not_verdierDual_conservative_valuedPlus` | Rank-two chain has j_s=j_η; rank-three chain has middle stalk Λ for j_s!Λ and zero for j_η!Λ. The closed skyscraper has zero dual; zero Λ cannot witness failure. | Replaced generic complement with the closed-point complement; added three checks and open-wise flabby argument. |
| `verdierDual_conservative_of_ring` | For Λ=ℤ/ℓ^m, self-injective cogenerator duality detects cohomology. The spherically complete valuation-ring example concerns the ring condition and lies outside torsion coefficients. | Retained the explicit conditional ring hypothesis and scoped the negative example. |

## Conventions, limits and final checks

The direction/normalisation checks include Λ[1] dualising to Λ[−1], the two-dimensional ball's Λ(2)[4] in cohomological degree −4, the opposite compact-support shift Λ(−1)[−2] for the one-dimensional ball, μ₄→μ₂ by squaring, and the two-coordinate F_5 trace computation. Each named denominator is a finite quotient cardinality proved to be a unit, not simply a nonzero integer. The zero ℓ-exponent of pro-order is tested against ℓ-primary coefficient nilpotence; compactness excludes infinite-index open subgroups. General commutative coefficient signatures are not silently specialised to ℤ_p, and the numerical shift/rank assertions isolate the zero-ring exception.

The changed checks belong in the README even where diamonds and their exceptional operators cannot yet be typed in Lean. Existing Lean carriers pin the formal adjoint directions, trace model, zero-ring behaviour, shift convention, distribution negative control, Jacobson negative control and valuation inclusion. There is no claim that successful elaboration proves a `sorry` theorem.

No package defect remains unresolved. The inherited classical compactification and higher-rank duality proof obligations remain explicitly owned by the lower supplier, and all geometric/enhanced carriers remain future formalisation work. This is the normal roadmap boundary, recorded above, rather than a hidden new gap or an assertion of a completed library development.

Validation on the final deliverables:

- `lean-check` on Suggested.lean: exit 0; 22 warnings, all `declaration uses sorry`; 370 lines, 14 declarations and 18 examples.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DiamondSixOperations.json`: exit 0; zero errors and zero warnings. Packet unchanged.
- `python3 research/blueprint/intake.py check-files` on the package README, Suggested.lean, metadata, review.json, this report and the handoff: zero problems.
- Coverage: all 90 plan targets accounted for, including the deliberate upstream Haar deferral, and all retained APIs covered; 97 principal target blocks, 109 principal names; every principal name represented in Lean or the closing comment; 25 Checks blocks with at least three bullets each.
- `git diff --check`: clean. Only the issue's package deliverables, this report and this job's handoff changed.
