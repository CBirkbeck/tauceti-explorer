# REV-ShimuraCompactifications--C0

Independent reviewer: Codex, session `codex-Vb3YJC`. Issue #487. Date: 2026-10-07.
Input: BP-ShimuraCompactifications--C0, session `codex-ewf5qv`, merged PR #6765. The reviewer did not author that work.

Verdict: **needs_changes**. This review job is complete; it is not a checkpoint. The mathematical contracts have been checked and clear fixes applied. The unresolved submission requirement is the suggested Lean file: most geometric declarations, APIs and tests remain comments rather than the signatures and examples required by PROTOCOL §13. The existing mathematical proof/interface gaps are honestly recorded and are not, by themselves, grounds for rejecting a target-level pass.

## Counts and coverage

| Item | Input | Reviewed packet |
| --- | ---: | ---: |
| Nodes | 89 | 90 |
| Definitions / constructions | 26 | 27 |
| API items | 95 | 119 |
| Packet unit tests | 89 | 92 |
| Planets | 34 | 34 |
| Baseline declarations | 14 | 14 |
| Explicit gaps | 18 | 21 |
| Supplier requests | 35 | 37 |
| Sources / hashed PDFs | 16 / 14 | 17 / 15 |
| Node source citations | 110 | 112 |
| Source issues | 1 | 2 |

The per-node mathematical verdicts are 52 verified, 37 corrected and one added; all 90 have individual notes in `review.checked`. Those verdicts certify the mathematical planning contracts at the stated target granularity, not the omitted Lean signatures or unread proof leaves.

All eight scoped stages remain `planned`, none `closed`, and the packet remains `complete`: every target has a node and its prerequisite chains terminate at a checked baseline, a supplier node/request, or an explicit gap. The new construction supplies the previously conflated projective-model target. Every stage retains its remaining list; C5 now also lists the distinct model/formal-comparison work. This review does not require splitting target proofs into lemma-level nodes. All implementation statuses remain `unchecked`.

The planet counts are C0 5, C1 5, C2 6, C2.general 1, C3 5, C3.general 1, C4 5 and C5 6. Names designate constructions and named results; no new planet was added to the full C5 layer.

## Source checks and substantive corrections

The 14 original PDF hashes independently match `sourceVersions`; the added one-page Lan 2017 erratum has its own URL/hash. Both Stacks pages were read as public HTML. Every original node statement, hypothesis, proof outline, locator and excerpt was compared with the indicated source passages; the two additional citations were read too. Page-restricted literal checks supplemented that reading and found the accent/word/page defects corrected below. A one-word excerpt is only a locator witness, not evidence for a whole theorem; the mathematical check used the source statements. Unread AMRT, KKMS, Faltings–Chai, Lan [17]/[18]/Lan–Stroh proof leaves and uncollated publisher editions remain explicit. No whole-book reading is claimed.

The main corrections are:

1. Pink 4.12 compares an **ambient** representation restricted to the boundary group, at corresponding points. It does not compare an arbitrary boundary representation with a nonexistent ambient extension. The adjoint boundary filtration is treated separately. The partial-chart citation now includes the actual construction 6.13 and elementary identifications 6.14–6.17.
2. The continuous toroidal-to-minimal map precedes compactness. Its properness and algebraic comparison are later consequences. Removing the premature properness claim breaks the hidden dependency circle; projective algebraization now lists compactness directly. The inspected complex-comparison supplier has only a proper-**scheme** Hom theorem, so analytic algebraization existence and algebraic-space extensions are explicitly requested.
3. Lan's extension classification is the anti-equivalence in Proposition 3.1.5.1, with **negative-character** pushout. The polarized tuple is `DD_pol` in Definition 4.4.6, while `DD_ample` has extra line/action data. Remark 4.4.7's auxiliary choice changes the displayed polarization to `2 lambda_A`. The polarized equivalence uses structure-preserving **isomorphisms**, not arbitrary generic Hom arrows. The semi-abelian definition keeps Lan's fibrewise smooth separated notion without silently adding global finite presentation.
4. Good-model embeddings are ring maps `R_alg→R^hat`, with `R^hat` a completed **strict local** chart ring, not just embeddings of a common function field. The etale relation is the normalization of the **interior** fibre-product relation. The ordinary integral construction requires Lan's **smooth compatible** cone collection, including its stated no-self-identification and standing PEL conditions. Non-neat output is a stack before any coarse-space claims. Properness is Proposition 6.3.3.17; Theorem 6.4.1.1(6) is the distinct all-traits cone extension criterion.
5. A fixed **same-fan** good-level normalization is finite. A fan modification need not be finite. Lan 2017's general projective model instead normalizes a **blow-up of the minimal model**. Added `C5/projective-normalized-blowup` with `addedBy` identifying this review, the exact neat-away-from-p/lattice-collection/projective-fan hypotheses, five APIs and three tests. Ramified interior/minimal suppliers and the complete stabilization/completion proof are explicit gaps. Its identification with a finite same-fan normalization is also a gap.
6. Formal Koecher needs the **toroidal-to-minimal contraction** structure-sheaf comparison. A fan-refinement direct-image theorem proves a different assertion. The minimal Stein equality is now an API item; the formal node requests proper formal functions for its actual normalized/ordinary model, plus the exact projection formula and special-fibre comparison. BCGP's inspected page 240 is identified as arXiv v3 pagination, without claiming uninspected published numbering.
7. Corrected literal excerpts (`H-torsor`, `stratum`, `toroidal embeddings`, `push-out`, `algebraizes`, `extends`, `good algebraic model`, `degenerating`, `normalisé`, `faisceau`, `Köcher`) and affected page ranges. The minimal ample-line claim is explicitly the finite-pullback deduction from the Stein map. The author erratum for Lan 2017 Theorem 8.7 independently confirms the already-retained dimension-one/nonempty-boundary exception.

Every existing node edit is recorded here; fields not listed were retained:

| Node (prefix `ShimuraCompactifications:`) | Changed fields | Check / correction |
| --- | --- | --- |
| `C0/relative-torus-embedding` | `api`, `sources` | Corrected the literal H-torsor excerpt; added relative-Spec mapping API. Right-translation convention and the rank-one dual-line test are consistent. |
| `C0/relative-boundary-coordinates` | `sources` | Corrected the literal stratum excerpt. Coordinate intersections are relative normal-crossings intersections; arbitrary nonreduced bases are retained. |
| `C0/arbitrary-ring-toric-charts` | `api` | Added chart-gluing mapping API. Spec and contravariant coefficient maps are native; fan gluing is a new arbitrary-ring extension of the same finite complex anchor. |
| `C1/mixed-boundary-datum` | `api`, `hypotheses` | Corrected supplier attribution: D4 is the ambient pure datum; V2 supplies rational boundary data. Added fixed-data extensionality; distinct U1,W1 and the finite cover remain explicit. |
| `C1/boundary-mixed-hodge-structure` | `api`, `hypotheses`, `proofSteps`, `statement` | Corrected Pink 4.12: Hodge-filtration comparison requires an ambient representation restricted to P1 at corresponding points. Added native WQ/F/graded-filtration compatibility. |
| `C1/cusp-label` | `api` | Added quotient-label constructor and equality criterion. Rational/level equivalence and cone transport retain actual lattice maps. |
| `C2/partial-boundary-charts` | `api`, `sources` | Extended locator through the actual 6.13 construction and 6.14–17 identifications; added gluing API. Nilpotent-preserving analytic carrier remains an explicit RT3 gap. |
| `C2/arithmetic-gluing` | `api` | Added mapping descent API for the controlled quotient charts and their elementary identifications, preserving the actual overlap cocycle. |
| `C2/compactness-properness` | `proofSteps` | Clarified order: the continuous minimal map is constructed first, then compactness proves analytic properness; algebraic properness is conditional on algebraization. |
| `C2/projective-algebraization` | `prerequisites` | Added compactness as a direct prerequisite; projective/ample and general algebraic-space conclusions are distinguished, with missing algebraization interfaces explicitly requested. |
| `C2/minimal-boundary-map` | `proofSteps`, `sources`, `statement` | Removed the hidden properness prerequisite circle and false whole-fibre description; constructed the continuous map first and added the 6.21 locator. Proper algebraization is a later consequence. |
| `C2/canonical-toroidal-model` | `api` | Added descent-model uniqueness API. Special mixed canonical torsor models and dense-special-point descent remain an explicit supplier gap, beyond pure V8. |
| `C3/refinement-map` | `api` | Added identity-refinement simp API. Properness uses unchanged cusp support; ordinary chart maps are shared, not redefined. |
| `C3/toric-structure-sheaf-vanishing` | `sources` | Fixed two literal excerpts and the Lan proof-page range. Integral monomial Cech/KKMS proof remains a named gap; formal vanishing is not derived from a real-cone slogan. |
| `C4/semi-abelian-scheme` | `api`, `statement` | Removed unsupported global finite presentation from the source definition; added fixed-carrier constructor/extensionality API. Rank-jumping Tate and G_a exclusion tests discriminate the fibrewise notion. |
| `C4/poincare-extension-classification` | `proofSteps`, `sources`, `statement` | Corrected locator to 3.1.5.1, negative-character pushout, and anti-equivalence; retained fixed-A,H extension classification and inverse-Poincare convention. |
| `C4/polarized-degeneration-data` | `api`, `sources`, `statement` | Corrected DD_pol locator to 4.4.6 and distinguished DD_ample. Added isomorphism criterion and the source auxiliary construction with 2phi/2lambda_A. |
| `C4/mumford-quotient` | `sources` | Corrected literal algebraizes excerpt and locator. Relative formal period quotient, cubical ample effectivity and local R11.3 ownership gap remain honest. |
| `C4/degeneration-effectivity` | `hypotheses`, `proofSteps`, `statement` | Corrected polarized equivalence to source isomorphism groupoids. Extending an isomorphism AND its inverse supplies full faithfulness; arbitrary Hom arrows are not substituted. |
| `C4/homomorphism-extension` | `sources` | Corrected BP literal excerpt. Generic Hom extension requires the normal-base hypotheses, and the locally-Noetherian version is local gluing of the cited Noetherian statement. |
| `C4/endomorphism-extension` | `sources` | Corrected literal good algebraic model excerpt. Endomorphism identities extend by dense-open uniqueness; dual/polarization input is only the actual abelian source comparison. |
| `C4/tate-degeneration-comparison` | `sources` | Corrected literal degenerating excerpt. Rank-one Tate specialization uses the existing modular-curve supplier rather than a duplicate elliptic degeneration theory. |
| `C5/good-algebraic-model` | `acceptance`, `api`, `hypotheses`, `proofSteps`, `sources`, `statement` | Corrected embeddings to R_alg→completed strict local ring and pp. 503–505; added explicit smooth-cone and (3a)–(3c) requirements. Distinct natural/algebraic embeddings are retained. |
| `C5/etale-chart-relation` | `hypotheses`, `prerequisites`, `proofSteps`, `sources`, `statement` | Corrected relation to normalization of the INTERIOR fibre-product relation, with extended tautological isomorphism and 6.3.3.13–14 etale laws; added normalization supplier prerequisite. |
| `C5/integral-toroidal-space` | `api`, `hypotheses`, `sources`, `statement` | Narrowed ordinary construction to Lan SMOOTH compatible Sigma, Conditions 6.2.5.25/6.3.3.2 and standing PEL hypotheses; added quotient mapping API and separated neat space from non-neat stack/coarse claims. |
| `C5/formal-completion` | `hypotheses` | Retained the same smooth ordinary fan assumptions and the exact removed-stratum neighbourhood before completion; higher-level singular normalization comparison is separate. |
| `C5/valuative-properness` | `hypotheses`, `proofSteps`, `sources`, `statement` | Corrected properness locator to 6.3.3.17/opening theorem assertion; (6) is the distinct all-traits cone criterion. Descent needs the actual separated/fpqc argument, not labels alone. |
| `C5/integral-minimal-space` | `api`, `proofSteps`, `sources`, `statement` | Added Stein O_min≅pi_*O_tor API and its precise construction locator. Formal/special-fibre transfer is explicitly separate; B5 enters only after early toroidal properness. |
| `C5/minimal-hodge-ampleness` | `sources` | Corrected source excerpt/locator to finite Stein map and made ampleness a finite-pullback deduction; auxiliary-level/coarse Q-line descent stays conditional. |
| `C5/higher-level-toroidal-normalization` | `api`, `hypotheses`, `proofSteps`, `sources`, `statement` | Narrowed to good-prime SAME-fan normalization with possible p-power higher level; generic p-level structures are not extended automatically. Lan normalized blow-up is a distinct target/gap. Added normalization mapping API. |
| `C5/normalized-chart-finiteness` | `hypotheses`, `prerequisites`, `proofSteps`, `sources`, `statement` | Separated finite normalization from projective normalized-blowup formal charts; a fan subdivision can have positive-dimensional fibres and is not generally finite. Added the new source-model prerequisite. |
| `C5/integral-coefficient-extension` | `prerequisites`, `sources` | Corrected French literal faisceau and added the projective source-model prerequisite. Integral coefficient functors must satisfy ALL of Definition 8.5, beyond characteristic-zero B3. |
| `C5/normalized-koecher` | `prerequisites`, `sources` | Corrected French literal Köcher and added the projective source-model prerequisite and author erratum citation. Simple-algebra and dimension-one/nonempty-boundary exceptions remain explicit. |
| `C5/hilbert-siegel-boundary-codimension` | `sources` | Corrected inspected edition to arXiv v3 p. 240. Genus-two Hilbert–Siegel minimal codimension is 2d; the toroidal divisor is not this boundary. |
| `C5/formal-hilbert-siegel-koecher` | `hypotheses`, `prerequisites`, `proofSteps`, `sources` | Replaced the incorrect fan-refinement prerequisite with minimal Stein comparison and proper formal functions. Actual normalized/ordinary formal-model transfer remains an explicit gap; corrected edition locator. |
| `C5/prime-Q-generator-cover` | `api` | Added Isom-section characterization. Q invertible and finite-flat group hypotheses give the finite-etale generator torsor; zero or arbitrary torsion points are not generators. |
| `C4/semiabelian-tate-module` | `api` | Added full torsion-system projections and explicit n|m transitions. Characteristic-zero finite torsion exactness is distinguished from the still-requested continuous full/primewise inverse-limit interface. |

Outside nodes, this review changed `requests` (four contracts rewritten precisely, additional consumers, two new requests), `gaps` (three added), C5 `coverage.remaining`, source read-section/version metadata, both `sourceIssues` reviews, and the top-level `review`. The suggested-file comments were synchronized with every changed mathematical statement/API/test and the added construction; its header now records the unresolved review requirement. The typed Mathlib declarations were retained.

## Baseline and supplier contracts

Both exact commits were used: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 14 citations were confirmed by reading the declarations and surrounding hypotheses in eight distinct modules. **No baseline citation was removed or replaced.** Source-generated additive declarations were checked through their `to_additive` definitions/annotations.

| Citation | Verified scope |
| --- | --- |
| `tauceti:TauCeti.Toric.Fan.ext` | Extensionality on the existing finite fan carrier. Its structure has finite_cones; it is not an arithmetic fan with merely finitely many orbits. Reuse its lattice/cone vocabulary and finite specialization. |
| `tauceti:TauCeti.SplitTorus.groupScheme` | The actual finite-rank split torus over Spec R for any commutative ring, not just over a field. Relative torsors and toroidal boundary charts are additional constructions. |
| `tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk` | A locally Noetherian connected SCHEME with domain stalks is irreducible. This is a scheme-specialization input for the foundations owner, not the algebraic-space or geometric-fiber theorem needed below. |
| `mathlib:MonoidAlgebra.comapDomain` | Coefficient restriction along an injective degree map, including its source-generated AddMonoidAlgebra version. The operation is additive, not an algebra homomorphism without the face condition proved in C0. |
| `mathlib:AddMonoidAlgebra.lift` | Equivalence between multiplicative maps from Multiplicative P to an R-algebra A and R-algebra homomorphisms from AddMonoidAlgebra R P. It packages the actual monomial-or-zero map once its multiplication law is established. |
| `mathlib:AddMonoidAlgebra.lift_single` | The additive monoid-algebra lift evaluated on a coefficient monomial is the scalar multiple of the chosen monoid map. This checks the face-projection normalization. |
| `mathlib:MonoidAlgebra.mapDomainAlgHom` | The algebra map induced by a degree-monoid homomorphism, with its source-generated AddMonoidAlgebra form. Used for the existing inclusion R[F] to R[P], not replanned. |
| `mathlib:MonoidAlgebra.mapRingHom` | The ring map changing every monoid-algebra coefficient along a unital ring homomorphism, with its source-generated additive-degree form, coefficient formula and monomial formula. |
| `mathlib:MonoidAlgebra.domCongr` | An equivalence of degree monoids induces an algebra equivalence for any coefficient algebra. Its source-generated additive version supplies the algebraic part of integral regular coordinates, but not the dual-monoid or torsor theorem. |
| `mathlib:Ideal.quotientKerAlgEquivOfRightInverse` | For an algebra homomorphism with an actual right inverse, the quotient by its kernel is algebra-isomorphic to its codomain. The C0 work identifies the specified off-face monomial ideal with that kernel. |
| `tauceti:TauCeti.Hodge.MixedHodgeStructure` | Integral module with actual rational/complex base-change models, bounded increasing WQ and decreasing F, and native pure graded Hodge structures whose filtration is exactly the induced quotient filtration. C1 only constructs its boundary instance. |
| `tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure` | The native weight-k graded Hodge structure, with F defined by gradedF and exact gradedHodgeStructure_F comparison. C1 uses this existing pure carrier rather than choosing an unrelated pure structure. |
| `mathlib:AlgebraicGeometry.Spec` | The existing scheme spectrum of CommRingCat, used for Spec R[P] rather than a new affine-scheme carrier. |
| `mathlib:AlgebraicGeometry.Spec.map` | A ring morphism R to S induces the scheme morphism Spec S to Spec R. Coefficient maps of integral charts use this existing contravariance. |

The reviewed library audit does not provide the new arbitrary-ring relative torsor embedding, arithmetic admissible fan, mixed boundary, integral degeneration or compactification targets. The finite Fan, native mixed Hodge carrier, algebra/ideal operations, Spec and split torus remain imports. No duplicate generic cone, lattice, fan, Hodge structure, abelian scheme, formal/adic theory or local Tate/Raynaud theory was introduced.

Cross-roadmap references were resolved across all packet files, including suppliers whose nodes live in a combined packet with a different filename. The relevant supplier statements were read, rather than treating a stage ID as an existing theorem. In particular:

- V2 supplies rational boundary/Baily–Borel data; D4 supplies the ambient pure datum. V8 supplies the actual ordered canonical tower and Hecke span, but its pure models do not supply special mixed boundary canonical models.
- B3's refinement comparison is the characteristic-zero canonical case, with a subcanonical **map**, not pullback equality; B5's constant terms/Fourier–Jacobi inputs follow early toroidal properness. The five-target component detector does not import downstream B5 back into early C5.
- M2 supplies good-prime stacks/spaces and families under its actual order, polarization-defect, level and quaternionic p=2 restrictions. M4 supplies good-prime higher-p-level **normalization**, without a special-fibre universal p-level structure. Its broader ramified lattice-collection input is absent and requested explicitly.
- SF.1 supplies the algebraic-space/atlas carrier; the necessary torsor grading, effective quotient/descent, component and normalization APIs remain additional requests. SF.2's current supplier nodes do not already prove the exact smooth-closure detector or every requested Stein/projection formula. SF.3 and several abelian-scheme stage contracts are still gaps, not invented existing node IDs.
- F0's proper formal-functions comparison requires proper locally-Noetherian **schemes** and coherent coefficients. It is used only with those hypotheses or an explicitly requested space extension. Mittag-Leffler cohomology needs its local hypotheses as well. R2/R3 do not already supply the exact ordinary/formal Hartogs or Klingen factorization theorem.
- The accepted RS-32 local R11.3 direction is preserved, but its Raynaud comparison still verbally depends on early C4; that carrier ownership issue remains recorded. Full Tate-module exactness needs the actual torsion-system/compact-coefficient interface; existing R02.1 cochain/lim1 nodes do not prove it automatically.

## API and tests

All 27 definitions/constructions have at least three mathematical tests; 92 packet tests remain discriminating rather than mere satisfiability. Nilpotent coefficients, nontrivial torsors, inverse line/sign conventions, face direction, ineffective kernels, Tate rank loss, boundary ramification, missing cone support and coarse/non-neat restrictions were checked. The three new normalized-blowup tests distinguish the unit-ideal/rank-zero case, a positive-dimensional exceptional fibre, and stabilization preserving labelled charts/families.

Twenty-four API items were added, derived from actual uses and universal properties:

| Node | Added API names |
| --- | --- |
| `C0/relative-torus-embedding` | `TauCeti.Toric.Relative.embedding_homEquiv` |
| `C0/arbitrary-ring-toric-charts` | `Toric.finiteFan_glue_hom` |
| `C1/mixed-boundary-datum` | `MixedBoundaryDatum.ext` |
| `C1/boundary-mixed-hodge-structure` | `BoundaryMHS.native_filtrations` |
| `C1/cusp-label` | `CuspLabel.mk`, `CuspLabel.eq_iff` |
| `C2/partial-boundary-charts` | `PartialBoundaryChart.glue_hom` |
| `C2/arithmetic-gluing` | `ToroidalSpace.descend_hom` |
| `C2/canonical-toroidal-model` | `ToroidalCanonicalModel.unique` |
| `C3/refinement-map` | `ToroidalRefinement.id` |
| `C4/semi-abelian-scheme` | `SemiAbelianScheme.ofGroup`, `SemiAbelianScheme.ext` |
| `C4/polarized-degeneration-data` | `PolarizedDegenerationData.iso_iff`, `PolarizedDegenerationData.toAmple` |
| `C5/integral-toroidal-space` | `IntegralToroidalModel.descend_hom` |
| `C5/integral-minimal-space` | `IntegralMinimalModel.structureSheaf` |
| `C5/higher-level-toroidal-normalization` | `NormalizedToroidalModel.desc` |
| `C5/prime-Q-generator-cover` | `PrimeQGeneratorCover.isomSections` |
| `C4/semiabelian-tate-module` | `SemiAbelianTateModule.torsionProjection` |
| `C5/projective-normalized-blowup` | `ProjectiveToroidalModel.toMinimal`, `ProjectiveToroidalModel.completion`, `ProjectiveToroidalModel.auxiliaryIndependent`, `ProjectiveToroidalModel.refinement`, `ProjectiveToroidalModel.valuativeExtension` |

## Source issues

`ShimuraCompactifications/E1`: **confirmed**, only for the hashed Pink author PDF. Definition 2.1(v) is printed p. 30, one-based PDF p. **31**, not 32. The rendered filtration displays `Lie V` at -1 and `Lie W` at the top; the required steps are `Lie W` and `Lie P`. The pure-datum exhaustivity test and the subspace/quotient distinction independently confirm the correction. The packet already used the right filtration. The [author dissertation page](https://people.math.ethz.ch/~pink/dissertation.html) was checked for errata; no corresponding author erratum was located. The publisher edition was not inspected.

`ShimuraCompactifications/E2`: **added and confirmed**, only for the hashed [Lan author revision](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Lemma 6.1.2.6, printed p. 444 / one-based PDF p. 472. The rendered reduced complement is equated to the unreduced orthogonal-character Spec over arbitrary Z, permitted explicitly by Remark 6.1.2.2. For `Z=Spec(Z/4Z)` and the positive-ray trivial G_m chart, the two schemes are `Spec(F2)` and `Spec(Z/4Z)`. Use the scheme-theoretic monomial quotient, or reduce both sides. The packet's existing nonzero-nilpotent tests already implement this corrected convention. The [book errata](https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf), author bibliography and relevant thesis errata were searched; no corresponding correction was located. No error is asserted in an uninspected publisher edition.

Both source issues have the required `review.verdict`, `reason` and `by`. The five existing routed source corrections were checked in their author/public copies and retained, including the subcanonical blow-up ideal failure and the corrected Klingen first projection/subgroup.

## Suggested Lean file and checks

Seven C0 node declarations and ten API lemmas use actual native coefficient-algebra carriers. The two native constructions have eight packet `example` tests. The file also contains two native Spec helpers, their identity/composition lemmas, two blow-up monomial regression examples and three Tau Ceti baseline examples. Those extra examples do not constitute signatures for the geometric targets.

**83 of 90 node declarations, 109 of 119 API items and 84 of 92 packet tests are only comment-ledger entries.** In particular, 25 of 27 definitions/constructions lack their suggested signatures/API lemmas/examples. The ledger correctly says these are omissions; it avoids fake Prop fields and implementation claims. Nevertheless, PROTOCOL §13 requires actual signatures and named theorem declarations. Its allowance to omit an unstatable condition does not turn omission of an entire declaration or example into a supplied signature. This is the outstanding revision requirement. Supply honest carrier-based prototypes where statable, retain missing conditions as explicit gaps, and do not invent theorem-as-field carriers. This requirement is separate from proving the 21 mathematical gaps.

Independent checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraCompactifications--C0.json`: zero errors, zero warnings.
- Full `lean-check` attempted after checking memory: import failure because the shared build lacks `TauCeti.Geometry.Toric.Algebraic.Fan.Basic.olean`. Its Tau Ceti checkout is not the pinned commit. The full file was **not** compiled successfully, and no build/update/cache/LSP was started.
- The Mathlib-only slice was checked in the **allowed suggested file**, temporarily excluding the three Tau Ceti imports, their three examples and their `CategoryTheory.MonObj` scope line. It elaborated successfully with **28 `sorry` warnings and no errors**. The full file was restored byte-for-byte after the temporary filtering. An initial slice attempt that left the Tau-dependent scope line in place failed on that namespace; correcting the slice exclusion resolved it. This is not a full-file check.
- Read-only reader comparison found all 89 original node statements verbatim. Its mathematical narrative matches the original packet and therefore needs the corrections above synchronized by an authorized revision/orchestrator.
- Packet-local dependency validation, API/test counts and planet limits pass. The known cross-packet R11.3 carrier cycle and missing supplier contracts remain explicit; no global proof of closure is claimed.
- `git diff --check` passed; the intake file/path check passed for all four files with zero problems. Only this job's packet, suggested file, review report and own handoff are changed.

## RS-32 and confirmed red-team findings

RS-32's title/scope and unchanged finite complex analytic toric anchors are retained. C0 extends coefficients/torsors and arithmetic cone systems; C4 imports local Raynaud theory. C6 is outside this part.

RT-AREA-algebraicgeometry/3: packet and original reader explicitly request the actual nilpotent-preserving analytic carrier and retain the incomplete PR196 integration gap. The epsilon regression detects reduction to manifolds. Other consumers' links are outside this issue.

RT-AREA-algebraicgeometry/27: C1 imports the exact HodgeStructures L2 milestone and the two pinned native mixed Hodge declarations, rather than making a second carrier. The outgoing links to D1/D3, Selmer L4 and Abelian A5 remain a link-map action; this issue cannot edit those owner files.

RT-AREA-algebraicgeometry/34: C0 owns the uniform arbitrary-ring finite-fan scheme, including valuation rings. The Binda–Kato–Vezzani/nonarchimedean Part II starts at formal/adic/perfectoid geometry and imports C0. Packet and original reader agree on this ownership; no duplicate scheme construction was introduced.

## Orchestrator handoff

1. Route a revision for the explicit §13 signature/API/example omissions. The review is complete with `needs_changes`, not a request to finish every recorded proof gap.
2. The issue does **not** authorize editing `research/blueprint/readmes/ShimuraCompactifications--C0.md`. Synchronize that read-only reader with the 37 corrected nodes, the added normalized-blowup target/API/tests, source metadata/issues and changed requests/gaps before any accepted promotion. Do not promote the stale narrative.
3. Keep local R11.3 ownership, mixed canonical boundary models, ramified M4 input, exact formal minimal-contraction comparison and the outside-owner RT links with their current named suppliers. Do not close those gaps by borrowing downstream results circularly.

All durable facts needed to resume are in this report, the packet and the handoff. Scratch source downloads/logs are removed when the pull request opens.
