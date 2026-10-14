# Independent review: p-adic differential equations and rigid cohomology

**Verdict: accepted as a completed, partial target-level pass.** All 305 nodes have an individual justified verdict: 201 verified, 103 corrected and one added. All 79 baseline declarations were read at the packet’s pins. No unresolved contradiction is presented as a result. All eight stages remain `partial`, with 53 explicit proof, source or supplier gaps and nine requests. Acceptance does not close those gaps or certify any theorem as formalised.

Reviewer: Codex, session `codex-Tl5vtU`, job `REV-PadicDifferentialEquationsAndRigidCohomology` (#460), 14 October 2026. The blueprint under review was written by a different worker session, `codex-FXlUXu`. This review changes the packet, suggested file, this report and its own handoff only. The orchestrator must regenerate the reader document from the corrected packet.

## Inventory and method

The packet has 50 definitions, 30 constructions, 112 lemmas, 97 theorems, four comparisons and 12 applications; 552 API items, 352 discriminating definition/construction checks and 44 planets. The stages have 26, 43, 30, 22, 33, 73, 67 and 11 nodes respectively, in RD.0–RD.7 order. Integrated node IDs are preserved even where their parent stage changes.

I read every target statement, hypotheses, proof sketch, direct prerequisites and associated source locators. The individual evidence is in `review.checked`; corrected entries record the actual change, rather than a generic approval. I checked the definitions’ APIs against their uses and their positive, degenerate and negative examples. I checked closure at target granularity: a nonroutine missing proof remains a named gap, rather than being disguised as a routine step or expanded into a long auxiliary-lemma development. Only the exterior-power descent criterion required a new key theorem node.

The inherited 71 source issues were independently checked, and 29 additional issues were recorded. The resulting 100 entries have 99 confirmed verdicts and one rejected verdict. The rejection is E20: I could not independently obtain the Davis–Schneider erratum, so the inherited claim attributing a specific necessity conclusion to it is not confirmed. The integral Quillen–Suslin target retains its DVR hypothesis, and the visible proof gap in the public preprint is recorded separately. This is not evidence that the broader analytic theorem is false.

## Sources and limits of the evidence

The packet records hashes and independent targeted-reading receipts for 33 accessible sources. The remaining source, the author’s finiteness errata text, was not independently accessible; its older receipt is identified as inherited. Independent reading does not repeat every earlier `readSections` claim and does not mean every paper was read in full.

The principal readings were:

| Source | Locations used in the mathematical review |
| --- | --- |
| Kedlaya, *Slope filtrations revisited*, arXiv v4 | Chapters 2–7, pp.6–72, including analytic rings, semiunit presentations, vector bundles, eigenvectors, standard modules, descent, slope filtration and connections; the two-page additional author errata |
| Kedlaya, *A p-adic local monodromy theorem*, arXiv v4 and Annals version | The algebraic preliminaries and the slope/monodromy statements and proof steps cited by the packet; Annals Theorem 1.2, p.97, and §§6.4–6.5, pp.179–182 |
| Kedlaya, *Local monodromy of p-adic differential equations: an overview* | The cited annulus, connection, radius, antecedent and monodromy locations through p.42; the unreached proof interiors remain gaps |
| Christol–Dwork; Kedlaya–Xiao; Kedlaya’s Swan-conductor paper | The cited spectral-norm, transfer, radius and break statements; Christol–Dwork’s scanned pages were inspected visually where OCR was unreliable; Kedlaya–Xiao Theorem 2.6.1, p.32, including its proof |
| Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv v6 | The cited definitions, relative-monodromy and pushforward arguments, curve computation, strictness, duality and descent spine, pp.1–67; targeted v5/v6 comparison in §§7.5, 8.3–8.5 and 9.3 |
| Kedlaya, *Fourier transforms and p-adic “Weil II”*, arXiv v3 | The cited trace, Fourier, monodromy-group and weight arguments, pp.1–53 |
| Berthelot, MSMF 23; Arabia | Berthelot’s frames, tubes, supports and comparisons, printed pp.7–30; Arabia’s introduction and §3 through printed p.638, especially Théorèmes 3.3.1–3.3.4, pp.636–637 |
| Crew; Chiarellotto–Tsuzuki; van der Put | Crew’s curve topology and residue-duality statements in §§2–10; Chiarellotto–Tsuzuki Proposition 2.7.2(3), pp.79–80, and the cited descent/comparison results; van der Put’s dagger and affine-curve computations |
| Kedlaya’s hyperelliptic point-counting paper, its author errata and Harvey | The polynomial reconstruction, reduction and precision statements, the two-page author errata, and Harvey §3, pp.5–7 |

I also checked the targeted later-paper coverage: Fargues–Fontaine Proposition 11.2.24 and Lemme 11.2.25, pp.378–379; D’Addezio §§2.2, 3.3, 4.1–4.4 and the cited §5 argument; Dospinescu–Le Bras Proposition 6.4, pp.356–357; Guo–Reinecke Definition 2.12, Theorem 2.14, Proposition 2.17, pp.35–37, and Theorem 6.13, pp.97–98; Disegni–Liu Appendix B, PDF pp.113–121; Xu–Zhu’s coefficient conventions; Fresán–Sabbah–Yu §3.2.2 and §§5.1.5–5.1.6, pp.25 and 49–52; Pan Definition 5.1.6 and Proposition 5.1.7, pp.53–54. These remain bounded coverage obligations where their carriers or proofs have not been planned. For example, a log-convergent coefficient is not silently treated as an ordinary overconvergent coefficient, and a finite-level cohomology theorem does not imply finite-dimensionality of an infinite-level limit.

Arabia’s author PDF contains printed pp.607–638, although the published article ends at p.639. All cited lifting and homotopy theorems are present; reading the missing final page is not claimed. Its public URL and the Berthelot PDF URL were repaired. The inaccessible published slope erratum, overview/full-faithfulness author corrections and Davis–Schneider text are not used as independently read evidence. Findings against preprints explicitly name those versions and make no claim of novelty in the version of record. No passages from sources are copied into the deliverables.

## Baseline, suppliers and ownership

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` are the baseline. All 79 names exist with the cited scope. No declaration was removed; five `provides` contracts were narrowed or clarified:

| Declaration | Correct supplier scope |
| --- | --- |
| `SkewPolynomial` | A multiplicative twist after a `MulSemiringAction` is supplied; not differential Ore multiplication |
| `DiscreteConvolution.ringConvolution` | A total `tsum` operation; summability and analytic closure are additional obligations, not a supplied Robba ring structure |
| `Module.Dual` | The algebraic dual; not a strong continuous dual or its topology |
| `AlgHom.IsArithFrobAt` | A residue congruence with a quotient-cardinality exponent; identification with finite-field q is additional data |
| `Matrix.charpolyRev` | The determinant convention `det(1 − TF)`; no eigenbasis or invertibility assumption is built in |

I checked the current read-only TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the newer upstream roadmaps and completed roadmaps named by WORKERS. No complete specialised Robba, rigid-coefficient or rigid-cohomology target was found there to remove. Existing algebra, finite-dimensional linear algebra and curve interfaces are cited instead of planned again. OperatorTheory is over real/complex Hilbert spaces and does not provide the needed nonarchimedean nuclear LF trace theorem.

Exact supplier statements were read for the consumed F1 dagger, R2 generic-fibre and R3 acyclicity interfaces, the L2 Nagata node, SF.4 alterations, the arithmetic local Swan input, DWP.0 numerical weights and its all-embeddings bridge, DWP.2 positive products, DWP.4/DWP.7 purity, L4 compact-matrix/Fredholm pieces, and CR.1–CR.3 crystalline interfaces. The CR.2 global embedding theorem with locally nilpotent p is not a global p-adic formal embedding theorem; that extension is now a precise comparison gap. The all-embeddings bridge is used over the finite Witt fraction field K₀, whose algebraic closure satisfies its cardinality hypothesis.

Upstream TraceFormula PR [#196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196) remains open at `4bd72379658126cbe9be935656396f0c9dac4de0` on 14 October. Its Layers 12–13 were read as a pending exact provider. They are not cited as installed on current main; the packet keeps a request and gap until adoption.

The six assigned interface findings have these dispositions:

| Finding | Reviewed disposition |
| --- | --- |
| RT-AREA-padic-2/31 | One Laurent carrier is owned by RD.0 under the current tier order; P7 is a later consumer. The earlier RS-26/P7 assignment needs manager reconciliation. Imperfect residue fields, Amice completion and moving Frobenius radii remain explicit. |
| RT-AREA-padic-2/32 | F1 supplies analytic dagger complexes. RD supplies frame coefficients and rigid cohomology. AG2.4’s ordinary-locus/logarithmic boundary comparison remains its own named obligation. RD.4 reuses RD.3’s j† rather than defining it again. |
| RT-AREA-padic-2/33 | Finite étale affine-space charts, generic pushforward and smooth finiteness are separate from schematic alterations, rigid hypercover construction and proper rigid descent. The unread descent proof is a gap. |
| RT-AREA-padic-2/34 | Global GOS consumes the geometric local inertia/Swan input and still needs the local index theorem and compatibility proof. Equal-characteristic extensions are not inferred from mixed-characteristic Cohen/Witt constructions. |
| RT-AREA-etale/9 | DWP.0 owns numerical weights. RD retains the coefficient-category, realisation and determinantal-weight targets, and imports the all-embeddings bridge with its hypotheses. |
| RT-AREA-etale/21 | Accepted RS-25 and the later RT-AREA-algebraicgeometry/16 fix put de Jong’s schematic alteration theorem in SF.4. L5 consumes it for étale descent; RD.5 consumes the same exact SF.4 node for its distinct rigid construction/descent. |

Mixed local/global full-faithfulness targets retain their integrated RD.3 IDs but live in RD.5, where their local slope prerequisites fit the atlas’s stage graph. No upward prerequisite to WC.3, WC.6 or P7 remains. The corresponding higher-stage consumer updates are handoff actions, not edits to another roadmap in this review.

## Mathematical adversarial checks

Every target was assessed with its standing hypotheses and the node’s existing checks. The following are decisive examples and corrections; the individual ledger below records the remaining changes.

| Statement or convention | Instance or calculation | Outcome |
| --- | --- | --- |
| SL completion and stable ideals | A one-entry unimodular row `(2)` over Q₂; the zero stable ideal | Add n≥2 for SL completion and nonzero for the fixed-generator assertion |
| Partial valuations and slope logarithms | Zero, a Teichmüller monomial, π; the ramified Dwork coefficient field | Handle infinity at radius zero and distinguish uniformiser from p-adic slopes |
| Amice/Robba/dagger distinction | Sparse p-power tails and the completed form with no convergent primitive | Completion does not supply overconvergence or dagger acyclicity |
| Frobenius semilinearity | q=p² and a nonfixed scalar; imperfect residue field with infinite p-basis | Use fixed scalars for morphisms, invertible linearisation for duals, and relative finite-flat Frobenius |
| Taylor transport | A line with D(e)=ae and two different coordinate lifts | Evaluate/transport in the correct direction; unevaluated positive derivative series is not horizontal |
| Full-faithfulness block equations | Scalar blocks A=2, D=3, B=5; direct substitution in y−Uv | Restore the missing D⁻¹ and the correct scalar coefficient/sign |
| Trace compatibility | y=x^q on G_m and the affine disc | Compatibility of lifts alone does not make finite-flat trace commute with Frobenius; require the cartesian relative square |
| Relative radius and unipotence | Fixed-radius annulus versus boundary ring; rank-zero module; m=−1,l=1 | Keep the two-sided radius margin, handle rank zero and avoid division by a vanishing binomial factor |
| Principal parts | Constant-field elements of pole degree zero; zero numerator a | Add a constant to the degree bound and require a≠0 |
| Cohomological signs/supports | G_m; residue pairing in degree one in two variables | H¹_c(G_m)=K, not zero; reverse support arrows and use the graded integration-by-parts sign |
| Fourier normalisation | The order-one Weyl commutator; ∇e=πe dx | Preserve ∂x−x∂=π⁻¹ and the multiplier exp(π(x^p−x)); Frobenius transport is a separate obligation |
| Realisation and local weights | A weight-zero eigenvalue i; a noninteger real weight; a two-dimensional Jordan block | Purity does not force real trace; arbitrary real Tate twists are undefined; a tensor-horizontal inclusion in the proof is false |
| Slopes versus roots of unity | A weight-one Weil 25-number with p=5 slopes 0,1,1,2 | Balance at one p-adic place is insufficient; Kronecker needs an algebraic unit at every finite place |
| Weil factors and point counts | E:y²=x³+x+1 and C:y²=x⁵+x+3 over F₇ | Independent finite-field enumeration gives #E(F₇)=5, #C(F₇)=11 and #C(F₄₉)=55, agreeing with the stated polynomials |
| Reconstruction precision | The genus-two polynomial and its first g coefficients | Use the functional-equation powers of q and precision for a₁,…,a_g; distinguish positive-y reduction from inverse-y reduction |

Several witnesses refute a printed proof step while leaving the theorem intact. These are recorded as proof defects/gaps rather than false-theorem claims: nonflat unipotent base change, local tensor invariants, and the nonnegative-slope argument using vanishing H¹_c are examples.

## Suggested Lean file and validation

The previous prototype was replaced with a compact representative-signature file in `TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology`, ordered by all eight layers. It has five light definitions with real bodies over existing semilinear, linear and complex carriers: Frobenius equivariance, the linear Nφ=qφN relation, linear Tate-twisted Frobenius, numerical purity and a pure matrix spectrum. Its statements cover the matching linear-algebra milestones and include degenerate/sign checks. Every heavy definition or construction remains named in the closing reader-target list, with its full statement, API and checks retained in the packet. There is no sorry-defined data, analytic ring construction, chain of auxiliary lemmas or pretend cohomology carrier.

`lean-check` elaborates the file at Mathlib 082e2d3 with exit code zero; only declaration-uses-`sorry` warnings occur. This checks signatures, not truth or completed proofs. The blueprint checker reports zero errors and zero warnings. The embedded section-18 source-issue and version-receipt checks pass. The final intake file check is recorded in the handoff.

## Follow-up obligations

Regenerate the reader and reconcile the ownership proposals described above. Keep all eight coverage statuses partial. The 53 gap entries and their `neededBy` lists are the actionable proof/source worklist; do not interpret the review as closing Arabia’s proof interiors, rigid proper descent, nonarchimedean LF trace theory, the corrected Fourier summability/transport arguments, constant-slope lattices, global formal crystalline computation, or the later-paper coefficient comparisons. The pending TraceFormula provider must become an actual upstream roadmap before it is treated as one.

The next section records every corrected or added node. Baseline scope corrections, receipt repairs, coverage/ownership reconciliation and the Lean rewrite are recorded above; unmodified-node justifications are in the packet’s individual review entries.

## Corrected and added node ledger

| Node | Change |
| --- | --- |
| `RD.0/frobenius-lift-on-robba-ring` | Corrected the Amice completion and distinguished the two density topologies. Reconciled the full Frobenius-lift target with the compact suggested file; no incomplete data record remains. |
| `RD.0/witt-partial-valuations` | Defined the zero-radius case without multiplying zero by infinity. Made the API use the corrected extended-real convention. Added the nonzero qualification to the Teichmüller test. |
| `RD.0/analytic-ring` | Removed a stale ownership label from the compatibility test. |
| `RD.0/analytic-ring-membership-and-intersections` | Inserted the missing truncation hypothesis from the author’s errata. Removed circular use of membership in Γ_J in the intersection proof. |
| `RD.0/closed-interval-analytic-ring-pid` | Moved discreteness from the residue valuation to the coefficient ring, as required by corrected Remark 2.6.4. Replaced the invalid residue-discreteness argument with the corrected division algorithm. |
| `RD.0/matrix-approximation-and-factorization` | Propagated the corrected coefficient-ring hypothesis to matrix factorisation. |
| `RD.0/vector-bundles-on-half-open-intervals-free` | Required an admissible interval cover; an arbitrary singleton cover does not support analytic gluing. Separated coefficient discreteness and admissibility from the residue valuation. Supplied the normalisation needed before applying the near-identity factorisation lemma. |
| `RD.0/analytic-ring-bezout` | Propagated the author’s correction of the discreteness hypothesis to the Bézout theorem. |
| `RD.0/modules-over-bezout-domains` | Added the necessary dimension hypothesis to special-linear row completion. Excluded the zero ideal from the Galois descent hypothesis. |
| `RD.0/robba-ring` | Corrected the valuation-to-norm sign; in particular w_s(π) = 1. |
| `RD.0/bounded-robba-ring` | Repaired the π-adic density proof, which cannot use Laurent polynomials alone. |
| `RD.0/derivation-on-robba-ring` | Distinguished p-adic norms from ordinary integer size in the primitive estimate. |
| `RD.0/change-of-frobenius-lift-taylor-formula` | Fixed the direction of the Gauss-norm rescaling in the ring Taylor convergence sketch. |
| `RD.0/frobenius-lift-on-dagger-algebra` | Restricted finite flatness to relative Frobenius over an arbitrary imperfect residue field. Removed the false assertion that absolute Frobenius is finite over every imperfect field. Restored the compatible reduction-lift hypothesis in Arabia’s definition of very smoothness. |
| `RD.0/frobenius-lifts-induce-homotopic-maps` | Restored the quotient ring omitted from the homotopy construction. |
| `RD.1/differential-twisted-polynomial-ring` | Made the differential Ore-extension boundary explicit at the pinned baseline. |
| `RD.1/generic-radius` | Separated absolute from intrinsic subsidiary radii and stated a rank-zero convention. |
| `RD.1/dwork-transfer-generic-disc` | Corrected the sign and evaluation convention in the claimed horizontal Taylor series. Made the transfer proof use actual parallel transport. |
| `RD.1/break-decomposition` | Used intrinsic subsidiary radii in the break decomposition. |
| `RD.1/differential-swan-conductor` | Used intrinsic subsidiary radii consistently in the Swan conductor and its API. |
| `RD.1/frobenius-module` | Included the finiteness and isogeny conditions in the Ore-module characterisation. |
| `RD.1/standard-frobenius-modules` | Repaired the eigenbasis argument and restricted the semilinear iterate identity to basis vectors. |
| `RD.1/isoclinic-frobenius-module` | Corrected the Hom-vanishing direction against Proposition 4.6.4. Corrected the same inequality in the planning API. |
| `RD.1/generic-slope-decomposition-and-descent` | Added the missing exterior-power descent prerequisite. |
| `RD.1/frobenius-differential-module` | Corrected the coefficient field of horizontal sections. Corrected the H0 API and avoided asserting bijectivity for non-surjective coefficient Frobenius. Added the field and rank distinction to the compatibility check. |
| `RD.1/change-of-frobenius-for-frobenius-structures` | Fixed the Taylor sign and specified evaluation in the target pullback. |
| `RD.2/coincident-polygons-common-filtration` | Added the missing exterior-power descent prerequisite. Replaced the freeness citation by the actual determinant descent criterion. |
| `RD.2/slope-filtration-for-frobenius-modules-statement` | Added the missing exterior-power descent prerequisite. Replaced an incorrect reduction supplier. |
| `RD.2/finite-etale-extension-of-bounded-robba-ring` | Made uniqueness relative to the residue identification; unmarked extensions have automorphisms. Defined inverse-Frobenius extensions without inverting a non-surjective map inside K. |
| `RD.2/robba-ring-antiderivative` | Removed the unsupported closed-boundary convergence assertion. Corrected the bound for negative integer exponents. |
| `RD.2/log-robba-ring` | Replaced an invalid tame Galois logarithm by the canonical pullback construction and fixed ramification normalisation. Separated canonical base-coordinate structure from local logarithm choices. Used the published pullback construction instead of an insufficient symbol presentation. Cited the precise canonical Galois-action supplier. Replaced incorrect unnormalised coordinate independence with the ramification formula. Completed the base-coordinate correction in the logarithm acceptance check. |
| `RD.2/log-robba-ring-antiderivative` | Propagated the open-annulus convergence qualification to logarithmic primitives. |
| `RD.2/slope-pieces-horizontal-after-finite-extension` | Rephrased the source misprint in the reviewer’s own words, retaining the corrected module name. |
| `RD.2/local-monodromy-finite-etale-form` | Clarified inverse-Frobenius base change for imperfect residue fields. Restored the logarithmic Kummer denominator. |
| `RD.2/solution-space-phi-n-module` | Removed bijectivity unsupported over an imperfect coefficient field. Corrected the Frobenius API. Kept the semilinear coefficient action in the trivial example. Distinguished semilinear triviality from identity action of the whole Galois group. |
| `RD.2/monodromy-representation-equivalence` | Restored the source’s definition of trivial semilinear representations. |
| `RD.2/unipotent-log-extension-nilpotent-residue-example` | Added the essential extension condition for residue nilpotence. Replaced an incorrect rational-eigenvalue assertion with the actual valuation argument. Made nilpotence valid for a nontrivial coefficient Frobenius. |
| `RD.2/frobenius-hypothesis-is-necessary` | Corrected the connection sign in the radius computation. |
| `RD.3/independence-of-compactification` | Reconciled the prose compactification supplier with the exact lower-tier node. |
| `RD.3/overconvergent-isocrystals-of-a-variety` | Reconciled the prose compactification supplier with the exact lower-tier node. |
| `RD.3/overconvergent-f-isocrystal` | Separated p-power Witt Frobenius from q-power Frobenius on a finite field. |
| `RD.3/rigid-quillen-suslin` | Removed an unverified erratum attribution; recorded the rank-one proof extension and projective-module algebra as explicit gaps while retaining the source-stated target. |
| `RD.3/sigma-nabla-module-over-dagger-algebra` | Restored the coefficient Frobenius in the Kummer horizontality equation. Qualified the rationality conclusion by the fixed-coefficient hypothesis. Propagated the coefficient Frobenius correction to the acceptance criterion. Corrected the point case over an imperfect coefficient field. |
| `RD.3/restriction-to-convergent` | Corrected the scalar field of morphisms commuting with semilinear Frobenius. |
| `RD.3/finite-etale-pushforward-of-isocrystals` | Restored the constant-field hypothesis in the horizontal-section check. Qualified the Kummer splitting by its Frobenius permutation. Propagated the splitting qualification to acceptance. |
| `RD.3/splitting-of-slope-separated-extensions` | Corrected the splitting equation for the stated block matrix convention. Computed both splitting equations directly, including the sign and coefficient Frobenius. |
| `RD.3/local-full-faithfulness` | Specified the normalised generator to which the horizontality argument applies. |
| `RD.4/de-rham-trace` | Moved logarithmic trace forms to the multiplicative group, where they are regular. Corrected the affine-disc trace check. Added the cartesian base-change hypothesis to trace/Frobenius compatibility. |
| `RD.4/finite-flat-pullback-injective` | Corrected finite flatness over an imperfect residue field. Specified the relative factorisation used for cohomological injectivity. |
| `RD.4/overconvergent-de-rham-complex` | Reused the coefficient-layer j-dagger construction instead of defining it a second time. Removed duplicate j-dagger API ownership; retained the cohomology comparison. |
| `RD.4/frobenius-vector-space` | Defined duals through linearisation when coefficient Frobenius is not surjective. Corrected the general coefficient-field isocrystal condition. Corrected scalar closure of Frobenius-equivariant morphisms. Corrected the dual API over imperfect coefficients. |
| `RD.4/rigid-cohomology-with-supports` | Replaced an insufficient exactness argument with the precise sheaf-surjection theorem. |
| `RD.4/tate-twist` | Used the appropriate duality hypothesis for semilinear Frobenius. Propagated the duality hypothesis to the twist API. |
| `RD.4/compact-support-complex-of-affine-space` | Distinguished global supported hypercohomology from cohomology sheaves and included the derived direct image. |
| `RD.4/compact-support-cohomology-of-affine-space-with-coefficients` | The denominator is the sum of overlapping submodules, not their direct sum. |
| `RD.4/gysin-isomorphism` | Made the coordinate-pair and pure-codimension hypotheses precise. Delimited the Gysin target to the justified scope. |
| `RD.5/relative-robba-ring` | Separated the fixed-radius auxiliary ring from the boundary-annulus Fréchet ring. Separated auxiliary fixed-radius API naming. Specified the convergence margin of the auxiliary ring. |
| `RD.5/unipotent-relative-module` | Preserved the coefficient algebra in the relative connection invariance assertion. |
| `RD.5/strongly-unipotent-span-unique` | Removed a circular assertion that each basis derivative already belonged to the other span. |
| `RD.5/binomial-denominator-bound` | Repaired the negative-integer zero-factor case in the printed binomial proof. |
| `RD.5/horizontal-projection-iteration` | Handled rank zero before using D^{e−1}. |
| `RD.5/horizontal-sections-descend` | Delimited the generic fraction-field argument to a multiplicative affinoid norm. |
| `RD.5/generic-unipotence-spreads-out-radius` | Delimited the generic fraction-field argument to a multiplicative affinoid norm. |
| `RD.5/generic-unipotence-spreads-out` | Delimited the generic fraction-field argument to a multiplicative affinoid norm. |
| `RD.5/local-algebras-at-missing-points` | Restored the constants in the principal-parts kernel. |
| `RD.5/reduction-principal-parts-near-isomorphism` | Allowed nontrivial constant-field elements, which have pole order zero but may need positive polynomial degree. |
| `RD.5/principal-parts-near-isomorphism` | Excluded the zero numerator, whose zero source cannot have finite-dimensional principal-parts cokernel. |
| `RD.5/simultaneous-matrix-approximation` | Corrected the printed page locator for simultaneous approximation. |
| `RD.5/strict-map` | Marked the strong dual as a new topological target rather than an algebraic-dual baseline result. |
| `RD.5/unipotent-local-cohomology-finitely-generated` | Made the nilpotent coefficient inversion explicit instead of treating a coupled system as a scalar derivative. |
| `RD.5/relative-local-cohomology-base-change` | Retained the flat base-change theorem; deferred the printed nonflat strengthening whose snake-lemma proof requires extra justification. Made flatness explicit in every proved case. Replaced an unjustified nonflat snake-lemma induction with the explicit flat coefficient computation. |
| `RD.5/poincare-duality-on-affine-space` | Corrected which side of the cochain pairing is Fréchet–Montel. Restored the degree-dependent sign in the cochain residue pairing. |
| `RD.5/smooth-proper-hypercovering` | Retargeted the schematic alteration theorem to SF.4, following accepted RS-25 and the later RT-AREA-algebraicgeometry/16 verification; L5 imports it and only supplies étale descent. |
| `RD.5/excision-duality-compatibility` | Reversed both displayed sequences to the actual excision and dual-localisation directions, and recorded the Frobenius twist. |
| `RD.5/finiteness-of-compactly-supported-rigid-cohomology` | Corrected compact support in degree zero for the nonproper connected cusp. |
| `RD.5/no-finiteness-without-frobenius` | Replaced arbitrary real coefficient powers by actual elements of the discretely valued coefficient field. Propagated the coefficient-field correction to the independent-cokernel-classes argument. |
| `RD.6/dwork-operator` | Removed the unsupported extension of an arbitrary Dwork operator to differential forms. |
| `RD.6/parallel-transport-action` | Replaced a one-step contraction by the required iteration. Separated ordinary and logarithmic coordinate derivatives. |
| `RD.6/dwork-trace-vanishes-without-rational-points` | Kept σ(a) in the cyclic trace identity before applying the Dwork relation. |
| `RD.6/alternating-trace-additivity` | Added compact-support finiteness explicitly; ordinary finiteness alone does not supply the trace-formula spaces. |
| `RD.6/lefschetz-trace-formula` | Added compact-support finiteness explicitly; ordinary finiteness alone does not supply the trace-formula spaces. |
| `RD.6/l-function-rationality` | Added compact-support finiteness explicitly; ordinary finiteness alone does not supply the trace-formula spaces. |
| `RD.6/frobenius-structure-gives-weyl-module` | Removed an unweighted convergence claim not implied by the radius estimate. |
| `RD.6/p-adic-fourier-transform` | Aligned the coordinate action with extension of scalars along ρ. Applied the inverse automorphism in the tensor-product API. |
| `RD.6/fourier-transform-rank-and-irreducibility` | Made the missing Fourier–Frobenius compatibility step explicit. |
| `RD.6/swan-conductor-of-isocrystal` | Separated geometric inertia from semilinear coefficient action in the Swan character. |
| `RD.6/conductor-estimate-for-polynomial-twists` | Used the local coordinate t = 1/x in the Artin–Schreier polynomial at infinity. Corrected the integer-bound hypothesis in the theorem statement. Distinguished rational ramification breaks from the integer upper bound N. |
| `RD.6/iota-real-and-realizable` | Restricted the integer Tate twist and made the real-weight scalar requirement explicit. Avoided treating a real weight as an available Tate twist. Qualified the realizability API by the available twist. Qualified the conjugation test by integer weight. Restored purity as the necessary hypothesis of the realisation construction. Restored purity in the real-weight version too. |
| `RD.6/rank-one-isocrystals-are-pure` | Handled the constant-field extension in rank-one purity. |
| `RD.6/global-monodromy-group` | Closed the generated tensor category under finite direct sums and made tensor powers explicit. Specified tensor compatibility in the Tannakian group. Removed an invalid inference from ordinary to absolute irreducibility. Removed the unsupported motives supplier. Qualified the absolute irreducibility API. |
| `RD.6/normaliser-over-centraliser-finite` | Expanded the omitted isotypical reduction and distinguished the finite algebraic quotient from rational-point quotients. |
| `RD.6/determinantal-weights-functoriality` | Added the hypothesis needed for reverse detection of determinantal weights. |
| `RD.6/local-invariants-weakly-mixed` | Applied tensor powering pointwise; cross terms between distinct boundary points do not embed in local cohomology. |
| `RD.6/local-invariants-strongly-mixed` | Removed the false kernel containment in the published shortcut and isolated the required monodromy-filtration proof. |
| `RD.6/purity-via-fourier-on-affine-line` | Qualified the weight-zero normalisation rather than silently twisting by a real number. |
| `RD.6/p-adic-weil-ii` | Applied the realizability qualification to the global weight theorem. |
| `RD.6/purity-smooth-proper` | Added the actual all-embeddings Weil-number bridge supplier, including its cardinality hypothesis, read in DWP.0. |
| `RD.6/nonnegative-slopes-of-h1c-on-curves` | Repaired the false constant-coefficient vanishing and supplied the power-trace integrality argument. |
| `RD.7/rigid-crystalline-comparison` | Rephrased the source correction in our own words. Kept semilinearity in the crystalline comparison example over a general perfect residue field. Recorded the precise scope of the crystalline supplier instead of claiming a global formal computation from an affine one. |
| `RD.7/frobenius-compatibility-of-comparison` | Kept the coefficient Frobenius in the projective-line acceptance check. |
| `RD.7/weil-factors-rational-and-integral` | Applied the all-embeddings bridge over the finite Witt fraction field, where its cardinality hypothesis holds. |
| `RD.7/elliptic-curve-slopes-versus-weights` | Added the missing global integrality/unit hypothesis to the root-of-unity claim. Separated the prime-field computation from the additional elliptic p-rank theorem for q = p^f. |
| `RD.7/kedlaya-point-counting-certification` | Restricted the uniform reconstruction bound to the first half of the coefficients. Scoped the precision maximum to the coefficients being reconstructed. Added integrality of the input polynomial and nonnegative exponent parameter. Restricted the corrected positive-power lemma to its domain, so its logarithm has positive argument. Assigned the two reduction estimates to the correct exponent ranges. |
| `RD.1/saturated-subobject-descent-via-exterior-power` | Added the determinant-line descent criterion used by three filtration proofs. |
