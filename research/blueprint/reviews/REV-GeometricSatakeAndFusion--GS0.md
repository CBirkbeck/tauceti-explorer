# Independent review: Geometric Satake, GS0–GS2

Job: `REV-GeometricSatakeAndFusion--GS0`. Issue: [#418](https://github.com/CBirkbeck/tauceti-explorer/issues/418). Reviewer: Codex, session `codex-UDgnFm`. Date: 2026-10-07.

## Verdict and completion

**needs_changes. This review job is complete.** Every node now has an individual verified or corrected verdict, and the clear mathematical corrections are applied to the packet and suggested file. The unresolved contradiction is between those corrected deliverables and `research/blueprint/readmes/GeometricSatakeAndFusion--GS0.md`, which issue #418 does not authorize this reviewer to edit. The required revision is specified below. This is not a checkpoint of an unfinished source audit.

The packet remains a complete target-level pass, with all eight stages planned and none closed. Its named supplier gaps and requests remain honest. Neither these open refinements nor the absence of fully typed diamond/sheaf carriers alone warrants rejection under PROTOCOL §§0 and 13. Acceptance must wait for the reader to agree: `scripts/promote.py` copies that document verbatim, rather than regenerating its corrected mathematics from the packet.

Read the full packet, reader and suggested file; the reviewed library audit; each in-scope stage target; the referenced fine supplier nodes and stage contracts; and the upstream AdicSpaces and RootSystems documents, with ReductiveGroups layers 2 and 7 checked for ownership. The initial structural checker already passed; the independent mathematical review found corrections that the checker cannot detect.

## Counts

| Item | Count |
| --- | --- |
| Nodes | 59 |
| Verified nodes | 32 |
| Corrected nodes | 27 |
| Added / removed / unverifiable nodes | 0 / 0 / 0 |
| Definitions / constructions | 2 / 21 |
| Theorems / comparisons / applications | 27 / 8 / 1 |
| API items | 73 (was 71) |
| Planned mathematical unit tests | 70 (was 69) |
| Planets | 25, retained |
| Pinned baseline declarations | 30 (was 29) |
| Sources | 8 |
| Source issues | 22 (was 19), all independently confirmed with qualifications |
| Open requests / recorded gaps | 21 / 9 (was 20 / 8) |
| Planned / closed stages | 8 / 0 |

The node budget is 300; the 59-node pass covers the stated targets. Proofs were not split into lemma nodes. Definitions and constructions retain at least three tests each. New split-kernel/cokernel results are API items of the existing cohomology construction, not new target nodes.

## Public source audit

All eight PDFs were independently fetched; their SHA256 values exactly matched the packet’s `sourceVersions`. The checks concern the relevant passages and their proof dependencies, not an assertion of a line-by-line review of all eight papers. Each node’s heading/excerpt, locator, hypotheses and proof outline was checked. Short source headings serve only as passage identifiers; the actual mathematical contracts were read.

| Public version | Passage audit |
| --- | --- |
| [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | VI.1–VI.8, pp.190–226; IV.1.18; IV.2.23–26 and IV.6.1–14 for ULA kernels/duals. |
| [BS17-witt-grassmannian](https://arxiv.org/pdf/1507.06490v3) | arXiv v3, §§2–4 and 6–10; statements, descent/positivity proofs and Appendix use distinguished. |
| [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | March 27, 2020 author copy, §§19–21, especially 20.3/20.5 and 21.1–21.5; printed pages differ from PDF pages by ten. |
| [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf) | Published pp.412–440, Appendix A pp.464–482 and Appendix B pp.482–488; visually checked the closure bar on p.433. |
| [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | §3.4, pp.684–686, including the minuscule convention and period-module construction. |
| [GLX26](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf) | §§3.2–3.4, pp.822–824, with the standing parahoric/local-model hypotheses. |
| [VH24](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf) | §§2.2.6–2.2.15, PDF pp.12–16; admissible unions are in 2.2.14–15. |
| [He21](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf) | Standing setting §2.2 and §§5.3–5.4, PDF pp.9–12; simple quasi-split hypotheses retained. |

## Corrections applied

1. **Ownership and closure.** Six Lie-weight/parabolic prerequisites cited RG2.5, whose target is the integral dual group. They now request relative/integral compatibility from RG2.1 and explicitly import the existing absolute Lie/adjoint/root/parabolic theory. RF2’s finite-thickening bundle descent is not completed-module algebraization: the RF4 torsor request now names effective compatible inverse-system algebraization, continuous complete ring maps, uniform rank, Tannakian transfer and Anschütz extension. The RF4 vector-bundle request includes the open-cell proof, not just the minuscule comparison. Three proof outlines no longer use later cell smoothness, bounded-action factorization or the CT criterion to construct their earlier inputs.
2. **Locators and geometric scope.** Truncated loops cite VI.1.10–11; open cells cite VI.2.4–5, pp.198–200. BS Theorem 8.3 is stated on p.32 and proved on pp.35–36. The Witt model/étale node now owns only the Witt application of SF’s general model theory. Added van Hoften’s actual admissible-set paragraphs and the connected parahoric/model-morphism requirements. He’s convolution estimates retain his simple quasi-split standing setting, with further transfers explicitly requested.
3. **Semi-infinite geometry.** Dimension equalities are qualified by nonemptiness. The proof uses FS’s closed height filtration with affine successive complements and the total dimension drop. It does not rely on the later rational minimal-generation argument. The corrected rank-two cone factor is `A⁻¹X`; the source’s adjugate calculation already proves its integrality and unit determinant. The remaining gap now concerns the typed truncated-Witt/lift-independence interface.
4. **Filtered equivariance.** FS VI.4.1 concerns an infinite complete congruence filtration with finite filtrations of its successive quotients, and an action factoring through a finite truncation. The packet now states the actual equivalence from finite-quotient to full equivariance. Its proof requires ordinary cohomology, spatial ball-subgroup presentations and inverse-limit continuity. Relative affine-space compact support has a shift and twist and cannot supply unshifted acyclicity. These missing inputs are explicitly requested from VS1.
5. **Perfectness and perverse coefficients.** The Lean CT stalk is now a derived object represented by a bounded complex of finite projective terms. Individual cohomology need not be projective: a two-term multiplication-by-two complex over Z/4 gives the regression. The existing EDC5 perverse node covers finite fields, self-injective finite DVR quotients and rational coefficients, not unrestricted integral/adic coefficients. A new precise EDC5 request and gap record coefficient reduction, derived adic compatibility and integral torsion-pair conventions. Early shifted CT perversity uses field devissage, the affine-intersection dimension bound and hyperbolic duality, rather than later rational concentration or EDC7 decomposition.
6. **Satake and convolution.** Added both split kernel and split cokernel lifting, including preservation of their universal cone/cocone, from FS VI.7.10(ii)/(iii). Faithfulness now uses the kernel property together with conservativity. The total fibre needs bounded finite support; finite projectivity in each degree alone is insufficient, witnessed by an infinite direct sum. The torsion signature uses a Z_ell-algebra and a uniform ell-power exponent; an arbitrary natural exponent would permit zero. The kernel-convolution core assumes right duals of its two input objects instead of rigidity of the whole ambient category. VI.8.1(ii) is restored for all bounded perverse-nonpositive inputs, with ordered collision/cell devissage reducing to the ULA-cell case.
7. **Definition tests.** Strengthened the Hecke stabilizer test to exhibit a nonidentity diagonal automorphism. Canonical Witt models now require a perfect characteristic-p field and valid jet depth; their tests distinguish the zero and rank-one point models and exhibit a nonzero square-zero thickening, showing that perfection does not determine an ordinary finite model. Clarified the quasi-minuscule multiplicity as short simple coroots of G in the relevant orbit, equivalently the corresponding roots of the dual root system.

Every changed node appears as corrected in the following ledger. Source-version hashes were rechecked; all baseline checked fields, request consumers, coverage refinements, the existing restructuring note and the upstream ownership note were updated. No upstream file, atlas data, reader document or unrelated roadmap was edited.

## Node-by-node verdicts

The order is the packet’s order. Full stable IDs are recorded in `review.checked`; the titles below identify the same nodes. Source locators are in the corrected packet. “Verified” means verified as a target-level plan with its explicitly recorded supplier refinements, not implemented or fully closed.

| # | Node | Verdict and independent check |
| --- | --- | --- |
| 1 | Positive and full loop spaces | **verified** — Checked FS VI.1.5: completed-divisor evaluation is an RF input, not a new Witt-ring definition. |
| 2 | Local Hecke stack | **corrected** — Strengthened the stabilizer test to a nonidentity element of the diagonal group, detecting replacement of the Hecke groupoid by its set of orbits. |
| 3 | Beilinson–Drinfeld Grassmannian | **verified** — Checked FS VI.1.8–1.9: the Grassmannian includes the trivialization, unlike the double-quotient Hecke groupoid. |
| 4 | Ordered legs and divisor base change | **verified** — Checked disjoint factorization and collision addition; ordered-leg geometry is available before symmetric fusion. |
| 5 | Generic Schubert bounds | **verified** — Checked generic bounds separately from the mixed-characteristic Witt projectivity argument. |
| 6 | Galois descent of bounded modifications | **corrected** — Specified finite Galois splitting and removed cohomological smoothness as an earlier proof input; smoothness is proved and descended at the later cell node. |
| 7 | Affine flags and Demazure spaces over Spd O_C | **verified** — Checked FS VI.5: Spd O_C flags and Demazure spaces are not asserted to be ordinary finite-type schemes. |
| 8 | Smooth scheme loops over a divisor | **verified** — Checked FS VI.1.12–1.13: loop evaluation on a smooth scheme uses RF divisor rings and the stated chart argument. |
| 9 | Congruence filtration of positive loops | **corrected** — Replaced RG2.5 by RG2.1 for relative Lie weights; absolute adjoint/root theory is imported from existing ReductiveGroups layers. |
| 10 | Truncated positive loop groups | **corrected** — Corrected the locator to VI.1.10–1.11 and removed the later bounded-action theorem from the construction argument. |
| 11 | Open Schubert cell smoothness | **corrected** — Corrected the locator to pp.198–200 and added the RF4 vector-bundle/finite-projectivity input; relative weights belong to RG2.1. |
| 12 | Finite truncation of bounded actions | **corrected** — Routed the weight bound to RG2.1, retaining the strict finite congruence-depth condition and collision sums. |
| 13 | Minuscule Bialynicki–Birula isomorphism | **corrected** — Routed minuscule Lie/parabolic compatibility to RG2.1; checked the CS/FS opposite-parabolic and coweight sign conventions. |
| 14 | Witt lattice functor | **verified** — Checked perfect-characteristic-p lattice representability, retaining the distinction between the original algebraic space and BS projective schemes. |
| 15 | Witt torsion module types | **verified** — Checked type inequalities, perfect-field fibre tests, and the identity-isogeny projective-dimension convention in E14. |
| 16 | Zhu finite-jet presentation | **verified** — Checked the determinant-jet presentation and finite-depth bound; truncated Witt coefficients are supplied, not replaced by ordinary polynomials. |
| 17 | Original perfect algebraic-space construction | **verified** — Checked Zhu 1.12/1.19/1.20 and Appendix A representability; this is the original algebraic-space construction, preceding BS projectivity. |
| 18 | Witt Demazure filtration space | **verified** — Checked decreasing lattice-chain conventions, graded ranks and the Demazure proper map; no K-theory determinant construction is duplicated. |
| 19 | Fibres of the Witt resolution | **verified** — Checked connected fibres, RΓ(O)=k, and the exact-type isomorphism; the positive-dimension claim is restricted to Zhu’s full chain resolution. |
| 20 | Descent on Witt resolution fibres | **verified** — Checked BS finite/formal bundle descent and the fibre-trivial criterion; the general theorem remains owned by SF. |
| 21 | Geometric determinant line | **verified** — Checked BS 6.11/8.8: the positive graded-quotient determinant descends uniquely to the Witt bound using the existing invertible-sheaf carrier. |
| 22 | Positivity of the determinant line | **verified** — Checked BS 8.9–8.11: weighted ampleness, exact-type sections and positive degree on nonconstant proper curves have distinct uses. |
| 23 | Projectivity of the Witt Grassmannian | **corrected** — Corrected Theorem 8.3’s statement/proof pages; general Keel, model and descent machinery stays in SF, with the boundary-pinching obligation explicit. |
| 24 | Perfect models and étale realization | **corrected** — Restricted this node to applying imported SF model/perfection theory to the Witt diamond comparison; it does not re-plan the general theorem. |
| 25 | Integral bounded Grassmannian families | **verified** — Checked SW 20.3.6/20.5.4: integral bounds use special/generic fibres and the mixed-characteristic construction, not generic closed bounds alone. |
| 26 | Witt affine flags and components | **verified** — Checked SW 21.1 parahoric Witt ind-projectivity and inertia-coinvariant component indexing. |
| 27 | Integral parahoric ind-properness | **verified** — Checked SW 21.2–21.5: integral parahoric ind-properness needs Anschütz extension and its group-model assumptions. |
| 28 | Canonical determinant models | **corrected** — Typed the perfect characteristic-p coefficient field and valid jet depth; replaced tautological tests by zero/rank-one models and a nilpotent counterexample. |
| 29 | Rank-two quadratic cone model | **corrected** — Recorded the corrected right-factor adjugate calculation proving integrality; narrowed the remaining gap to the truncated-Witt/lift interface. |
| 30 | Normalized determinant on SL_n lattices | **verified** — Checked the SL_n normalization of the extended determinant and corrected E19; an ordinary R-determinant of a p-torsion quotient is not used. |
| 31 | Sections of the Witt determinant line | **verified** — Checked Zhu Appendix B section/determinant claims with their sketch-only scope; the Hodge comparison remains an explicit supplier refinement. |
| 32 | Bounded admissible affine flag loci | **corrected** — Added VH 2.2.14–2.2.15 and corrected GLX locators; imposed connected parahoric/local-model morphism hypotheses for functoriality. |
| 33 | Relative-position flag correspondences | **verified** — Checked relative-position incidence relations and multiplication order; the admissible union is downward closed, not a single exact stratum. |
| 34 | Affine flag convolution fibre bounds | **corrected** — Made He’s simple quasi-split standing hypotheses explicit; transfer beyond that setting requires the requested componentwise comparison. |
| 35 | Semi-infinite strata and constant terms | **verified** — Checked FS VI.3 hyperbolic localization, shifts and weight indexing; enhanced six operations and scheme normalization are supplier inputs. |
| 36 | Affine semi-infinite intersections | **corrected** — Added nonemptiness to dimension equalities, routed Lie weights to RG2.1, and used FS’s closed affine filtration rather than later rational generation. |
| 37 | Mirković–Vilonen intersections | **verified** — Checked MV component counting and the qualified closure/dimension corrections; empty intersections have component count zero. |
| 38 | Prounipotent equivariance invariance | **corrected** — Replaced a finite-filtration assertion on H by the actual complete congruence filtration and truncated-action equivalence; added VS1 ordinary-cohomology continuity. |
| 39 | Conservativity of constant terms | **verified** — Checked FS VI.4.2: maximal weight and hyperbolic localization prove conservativity after the corrected deep-equivariance input. |
| 40 | ULA Hecke complexes | **corrected** — Removed the later constant-term criterion from the category construction; smooth-chart descent and VI.6.5 cell restrictions give the earlier definition. |
| 41 | ULA recognition by constant terms | **corrected** — Replaced projective individual cohomology by a derived stalk with a bounded finite-projective model; added the needed baseline references and a Z/4 regression. |
| 42 | One-leg ULA special/generic comparison | **verified** — Checked one-leg ULA special/generic transport; this alone is not a tensor comparison or a fusion structure. |
| 43 | Relative perverse t-structure | **corrected** — Added the EDC5 coefficient-change/adic request: the existing scheme perverse node does not cover arbitrary integral coefficients. |
| 44 | Equivariant perverse descent and constant terms | **corrected** — Added EDC5 and affine intersections directly; replaced later rational concentration by FS field devissage, dimension bounds and hyperbolic duality. |
| 45 | Flat perverse objects | **corrected** — Added EDC5 coefficient/torsion-pair compatibility, retaining the all-module tensor test rather than tensoring only with flat modules. |
| 46 | Standard and costandard objects | **corrected** — Added EDC5 coefficient compatibility, retaining the intermediate-image and standard/costandard conventions. |
| 47 | Rational parity and integral torsion bounds | **corrected** — Typed a Z_ell-algebra and a uniform ell-power exponent; added the pinned PadicInt carrier rather than the vacuous exponent N=0. |
| 48 | Rational special-fibre weights | **corrected** — Clarified the quasi-minuscule zero-weight multiplicity as short simple coroots of G in the relevant orbit; retained the corrected excision argument. |
| 49 | Satake category | **verified** — Checked finite support, ULA and flat perversity in the Satake category; neither the entire perverse heart nor generic rigid categories are substituted. |
| 50 | Satake cohomology functor | **corrected** — Added split kernel/cokernel lifting and preservation APIs, repaired the faithfulness argument, added an infinite-grading non-example, and requested EDC5 scope. |
| 51 | Verdier duality of Satake objects | **corrected** — Routed relative Lie/root conventions to RG2.1; checked inversion, duality and flat finite-Tor conditions, without assuming all perverse objects dualize. |
| 52 | Ambient Hecke convolution | **verified** — Checked ambient convolution correspondence and p_! with bounded proper support; exact coherence is requested from EDS/VS1. |
| 53 | Associativity and unit of convolution | **verified** — Checked associativity/unit from correspondence base change and projection formulas before GS3 symmetric fusion. |
| 54 | Rational Witt convolution and semismallness | **verified** — Checked Zhu rational Witt convolution/semismallness under its finite-type and coefficient hypotheses; it is not used to justify earlier integral perversity. |
| 55 | ULA preservation by convolution | **corrected** — Replaced global rigidity in the Lean core by right duals of the two kernel objects; proper ULA kernel composition proves the geometric assertion. |
| 56 | Nonpositive perverse convolution | **corrected** — Restored VI.8.1(ii) for all bounded perverse-nonpositive inputs; ordered collision/cell devissage reduces the proof to ULA cells and the two-leg family. |
| 57 | Closure of Satake under convolution | **verified** — Checked integral convolution closure using ULA plus perverse bounds and the DVR flatness test before tensor/fusion in GS3. |
| 58 | Duals of Satake objects | **verified** — Checked both duals and triangle identities through proper-relative ULA kernels; Verdier/inversion duals do not presuppose fusion. |
| 59 | One-leg Satake equivalence | **verified** — Checked the one-leg Satake equivalence through ULA comparison and shifted constant terms; tensor compatibility is explicitly reserved for GS3. |

## Pinned baseline audit

Read actual declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including hypotheses. All 29 original citations exist; none was removed or replaced. `Module.Projective`’s claimed provision was corrected to strict perfect terms rather than arbitrary ULA cohomology. Added `PadicInt` for the explicitly stated integral coefficient algebra. The reviewed `AUDIT-21` coverage reports partial categorical/algebraic substrates; no geometric Satake result was mistaken for an existing implementation.

| Declaration | Confirmed scope / limitation |
| --- | --- |
| `mathlib:WittVector` | Coefficient sequences; ring/perfectness laws are separate existing APIs. |
| `mathlib:PerfectRing` | Bijective Frobenius; the characteristic-p assumption is stated separately. |
| `mathlib:AlgebraicGeometry.Scheme` | Locally ringed spaces locally affine, with the existing category. |
| `mathlib:AlgebraicGeometry.IsProper` | Separated, universally closed, locally finite-type scheme morphisms. |
| `mathlib:ValuationRing` | Domain valuation-ring divisibility; no geometric descent theorem follows. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | Full subcategory of locally free rank-one sheaf modules; not positivity/Picard representability. |
| `mathlib:CoxeterSystem` | Abstract Coxeter presentation equivalence; not affine flag geometry. |
| `tauceti:TauCeti.TitsSystem.bruhatCell` | Tits-system double coset; not a geometric Schubert space. |
| `mathlib:RootPairing` | Paired roots/coroots and reflections; not reductive-group representability. |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | Reductive affine group schemes over a field; not integral/parahoric models. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | Abstract t-structure data; not a relative perverse construction. |
| `mathlib:CategoryTheory.Triangulated.TStructure.Heart` | A full additive heart image; no generic abelian-heart theorem claimed. |
| `mathlib:CategoryTheory.Pretriangulated` | Distinguished-triangle structure on a category. |
| `mathlib:DerivedCategory` | Derived localization of cochain complexes of an abelian category, with the required existence instance. |
| `mathlib:CategoryTheory.Sheaf` | Category-valued sheaves on a Grothendieck site; not a geometric v-site. |
| `mathlib:CategoryTheory.GrothendieckTopology` | Abstract covering-sieve topology; not geometric descent. |
| `mathlib:CategoryTheory.MonoidalCategory` | Tensor, associator and unit coherence data. |
| `mathlib:CategoryTheory.LeftRigidCategory` | Left-dual data only; no right dual inferred from it. |
| `mathlib:CategoryTheory.Equivalence` | Functor equivalence with inverse, unit and counit. |
| `mathlib:CategoryTheory.Comma` | Objects and commuting morphisms of a comma category. |
| `mathlib:Module.Flat` | Module flatness via tensor injectivity. |
| `mathlib:Module.Projective` | Projective module splitting; finite projective terms of perfect complexes, not their cohomology modules. |
| `mathlib:Module.Free` | Existence of a basis; finiteness is a separate assumption. |
| `mathlib:CategoryTheory.RigidCategory` | Both left and right duals. |
| `mathlib:CategoryTheory.ActionCategory` | Action groupoid with labels retained; not the quotient set. |
| `mathlib:Action` | Monoid action through the endomorphism monoid. |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | Full subcategory specified by an object property. |
| `mathlib:Module.Finite` | Finite generation of the top submodule; finite total cohomology is a stronger boundedness claim. |
| `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ` | Flatness equivalence for tensoring injective linear maps, with the stated Small assumption. |
| `mathlib:PadicInt` | Norm-at-most-one p-adic subtype and its prime-p commutative ring; added for Z_ell coefficients. |

The modules remain recorded in each baseline entry. Additional existing APIs read while typing the proposed signatures include the module category’s abelian instance, kernel/cokernel preservation, split mono/epi classes, the scheme spectrum and the trivial square-zero extension. These are existing typing infrastructure, not new geometric targets.

## API, unit tests and planets

All 23 definition/construction nodes were checked against their recorded downstream uses, API and at least three mathematical tests. The following totals exclude the additional suggested-file regression for a perfect complex with nonprojective cohomology. Tests are planned specifications with `sorry`, not executable evidence of the mathematical results.

| Object | API / tests | Test coverage |
| --- | --- | --- |
| Positive and full loop spaces | 3 / 3 | computation, degenerate, compatibility |
| Local Hecke stack | 3 / 3 | degenerate, non-example, computation |
| Beilinson–Drinfeld Grassmannian | 4 / 3 | degenerate, computation, compatibility |
| Generic Schubert bounds | 3 / 3 | degenerate, computation, non-example |
| Affine flags and Demazure spaces over Spd O_C | 3 / 3 | degenerate, computation, non-example |
| Truncated positive loop groups | 3 / 3 | computation, degenerate, compatibility |
| Witt lattice functor | 3 / 3 | degenerate, compatibility, non-example |
| Witt torsion module types | 3 / 3 | degenerate, computation, non-example |
| Zhu finite-jet presentation | 3 / 3 | degenerate, computation, non-example |
| Witt Demazure filtration space | 3 / 3 | degenerate, computation, non-example |
| Geometric determinant line | 3 / 3 | degenerate, compatibility, computation |
| Canonical determinant models | 3 / 3 | degenerate, computation, non-example |
| Normalized determinant on SL_n lattices | 3 / 3 | degenerate, computation, compatibility |
| Bounded admissible affine flag loci | 3 / 3 | degenerate, computation, non-example |
| Relative-position flag correspondences | 3 / 3 | computation, degenerate, non-example |
| Semi-infinite strata and constant terms | 3 / 3 | degenerate, computation, compatibility |
| ULA Hecke complexes | 3 / 3 | degenerate, non-example, compatibility |
| Relative perverse t-structure | 3 / 3 | degenerate, computation, compatibility |
| Flat perverse objects | 3 / 3 | degenerate, computation, non-example |
| Standard and costandard objects | 3 / 3 | degenerate, computation, non-example |
| Satake category | 3 / 3 | degenerate, compatibility, non-example |
| Satake cohomology functor | 5 / 4 | computation, degenerate, compatibility, non-example |
| Ambient Hecke convolution | 4 / 3 | degenerate, computation, compatibility |

The 25 planet names identify definitions, central constructions or named theorem topics, rather than page locators or implementation tickets. They remain unchanged. Together they cover loop/Hecke and Schubert geometry, Witt/Demazure/determinant/projectivity, constant terms/perversity, and Satake/convolution/rigidity. The general perfection, Keel and six-functor infrastructure is still owned by its suppliers.

## Six handed red-team findings

Each finding was checked in both the original packet and the original reader; all six were already addressed correctly. The additional changes above preserve those fixes.

| Finding | Confirmed handling in packet and reader |
| --- | --- |
| RT-AREA-padic-1/3 | Integral divisor/loop geometry requests the nonanalytic diamond extension D6; it does not identify integral Spd with an analytic generic diamond. |
| RT-AREA-geomlanglands/1 | ULA, perverse and Satake convolution closure/duals are planned in GS2 before GS3 symmetric fusion and tensor reconstruction. |
| RT-AREA-geomlanglands/14 | Generic bounds do not prove Witt projectivity; separate Witt resolution, determinant, positivity and special-fibre projectivity precede integral properness. |
| RT-AREA-geomlanglands/15 | General Keel, fibre descent and positivity machinery remains requested from SF3/SF4/SF5; GS0 owns its Witt application. |
| RT-AREA-geomlanglands/18 | EDC4 duality is not a perverse construction; EDC5 supplies the latter. VS3 descent/fusion is not an early convolution input. |
| RT-AREA-geomlanglands/28 | Early v-stack sheaf and lisse input uses VS0/VS1 with precise requests, including missing consumers; VS3 is reserved for later descent/fusion. |

## Source-issue verification

All 19 original entries now carry this review’s own verdict and reason. Added E20–E22 with `addedBy` and an independent verdict. “Confirmed” is qualified for convention-dependent entries and proof obligations: E13 is harmless if connectedness is part of the definition of pro-unipotent; E16/E18 identify omitted arguments and do not refute the conclusions. No author-endorsed erratum is claimed for the new findings.

| Entry | Independent verdict and reason |
| --- | --- |
| E1 (p412, coweight order) | **confirmed** — Coweight dominance is an order in X_*(T), hence positive coroots; printed p.412 uses roots. |
| E2 (p. 424, proof of Lemma 1.17, definition of X(R′)) | **confirmed** — The displayed chain orientation and reversed sequence require F_i→F_{i−1} with μ*_{N+1−i}; checked the p.424 construction. |
| E3 (p488, determinant unit inB.11) | **confirmed** — The determinant equation forces det X=p²[λ]⁻¹, agreeing with the corrected rank-two factorization. |
| E4 (p. 488, proof of the claim in Lemma B.11 (display defining g̃)) | **confirmed** — For X=Ag the right factor is A⁻¹X. The 2×2 adjugate of X* A proves integrality in the corrected order and its determinant is a unit. |
| E5 (p. 482, Appendix B opening paragraph (not p. 484)) | **confirmed** — Appendix opening is p.482; B.1/B.9 are announced and several other results sketched, whereas B.10/B.11 have proofs. The qualified correction accurately separates these. |
| E6 (p. 425, proof of Lemma 1.18 (positive dimension of fibres); also p. 425, proof of Lemma 1.18 (last paragraph)) | **confirmed** — The displayed intersection quotients sit inside the final lattice and cannot parametrize the chain. The sum quotients have dimension #{j:l_j≥i+1}, giving the needed lower-stratum fibre. |
| E7 (p. 433, Proposition 2.5 (second sentence)) | **confirmed** — Visually checked the published p.433 display: the overline covers the intersection. The empty GL₂ example makes the asserted closure equality false; closure of S_λ intersected with the bound is the safe replacement. |
| E8 (p. 434, Corollary 2.8; p. 439, Corollary 2.14) | **confirmed** — An empty intersection has no asserted nonnegative equidimension. The dimension equality needs nonemptiness; the zero component count remains valid. |
| E9 (p. 435, Corollary 2.9) | **confirmed** — The basis occurs only in degree ⟨2ρ,λ⟩ by 2.7; the unbound index i in 2.9 is a misprint. |
| E10 (p. 436, proof of Corollary 2.10) | **confirmed** — The printed opposite filtration contains higher weights rather than the complementary λ-piece. The GL₂ minuscule point-support example confirms the proof error; use support in the opposite orbit closure. |
| E11 (p. 437, item (2) before Lemma 2.12) | **confirmed** — In type A₂ the point −θ/2 lies in an edge rather than a vertex, so its parahoric is not maximal. The statement is unused in the needed proof. |
| E12 (p. 439, proof of Lemma 2.11 (μ = θ): display for π^{-1}(S_0 ∩ Gr_{≤μ}) and (2.2.13)) | **confirmed** — The infinity section contributes the omitted cohomology. The SL₃ flag resolution yields zero-weight multiplicity two; retain the excision sequence and avoid a claimed canonical splitting. |
| E13 (A.3.5, last paragraph, p. 482) | **confirmed** — Confirmed as a missing convention: under the broad convention allowing disconnected unipotent groups, the constant group F_p gives inequivalent representation categories. Require connected congruence kernels, or define pro-unipotent with connected quotients. This is not an error if connectedness is already built into that term. |
| E14 (arXivv3 Lemmas7.7–7.8 pp28–29; Definition7.10 convention) | **confirmed** — The identity isogeny has zero cokernel. The intended projective-dimension condition is ≤1; equality one is not literally true for this degenerate case. |
| E15 (arXiv v3, Lemma 7.9, p. 29) | **confirmed** — The p.29 display specifies the whole type-bound locus, whose closedness is proved later; replace the ambiguous inclusion by the defining equality. |
| E16 (p. 35, proof of Theorem 8.3, second paragraph) | **confirmed** — The p.35 induction invokes representability of the lower-bound union before the pinching step is supplied. Confirmed as a recorded proof obligation, not a counterexample to projectivity. |
| E17 (p. 37, the sentence introducing Kottwitz' map and Proposition 9.7 ([Zhu14, Proposition 1.21])) | **confirmed** — Geometric components use inertia coinvariants. An unramified restriction-of-scalars torus separates these from full-Galois coinvariants; the issue is scoped to the non-algebraically-closed base. |
| E18 (p. 37, Proposition 10.1 (second assertion) and its proof) | **confirmed** — Proposition10.1 constructs the line but does not prove its stated ampleness. A finite restriction-of-scalars map to an ordinary Witt bound supplies the missing argument, under the listed lattice/model hypotheses. |
| E19 (p. 37, last paragraph (after Proposition 10.1)) | **confirmed** — The quotient is p-power torsion, not an R-module in general; det_R is undefined. The extended determinant and its normalized constant factor are the intended expression. |
| E20 (A.3.1, p.478) | **confirmed** — The normalized IC in the paper’s Satake construction is perverse. On a smooth curve Q_ℓ[2] lies one degree away from the perverse constant Q_ℓ[1]. This printed formula confuses IC normalization with the smooth dualizing complex. |
| E21 (A.3.3, pp.479–480) | **confirmed** — Relative Frobenius P¹→P¹ has degree p and pulls c₁(O(1)) to p·c₁(O(1)). It induces an étale-topos equivalence and an isomorphism on rational top cohomology, but does not preserve the scalar trace normalization. Thus the claimed model independence fails. |
| E22 (Corollary VI.3.8, p.207) | **confirmed** — For GL₂ μ=(1,0), λ=(2,−1) is outside the weights of the minuscule bound, so S_λ∩Gr_{≤μ} is empty while ⟨ρ,μ+λ⟩=2. The closed-filtration proof applies to the nonempty strata. |

E20 distinguishes perverse IC from the smooth dualizing complex. E21 distinguishes étale equivalence under Frobenius from trace-normalization compatibility; rational top cohomology is isomorphic but the trace scalar changes. E22 only qualifies the nonempty intersection dimension equality; component counting still gives zero for empty intersections. These corrections are already respected in the packet’s IC/trace/dimension conventions.

## Validation and its limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS0.json`: no errors or warnings after corrections.
- `lean-check research/blueprint/suggested/GeometricSatakeAndFusion--GS0.lean`: full file could not elaborate because the shared build lacks the prebuilt `TauCeti.AlgebraicGeometry.LineBundle.Basic` object. The shared Mathlib checkout is at the exact pin; the shared Tau Ceti checkout is not at the recorded source pin. Pinned Tau Ceti statements were read separately. No library build, cache operation or language server was started.
- A limited validation temporarily omitted that import and the geometric determinant-line/fibral-descent blocks from this same suggested file. The Mathlib-only projection elaborated successfully with 182 `sorry` warnings, no other warnings and no errors. The complete file was restored after the check. This does not establish elaboration of the two omitted blocks or the full pinned Tau Ceti file.
- The revised signatures include the perfect-complex, split kernel/cokernel, Z_ell coefficient and object-specific dual inputs. Omitted geometric supplier conditions are documented according to PROTOCOL §13; no unknown `Prop` fields or invented supplier carriers were introduced.
- The intake file checker reports four files and zero problems; `git diff --check` passes.

## Required revision and orchestrator actions

Authorize a revision that includes the reader document. Synchronize every **corrected** row of the node ledger above, its hypotheses/proof/prerequisites, the revised API/tests/prototype notes and the non-node ledgers (baseline, requests, gaps, coverage, restructuring/upstream notes, and all 22 source issues). Then run the packet checker and submit an independent re-review. Do not infer acceptance from this review’s completed status.

The most consequential stale reader passages are the finite-filtration claim on the full prounipotent group, the earlier proof dependencies on later cell/action/CT results, RG2.5 as supplier for geometric Lie weights, completed descent attributed to RF2, coefficient-general perversity attributed to the existing EDC5 node, and the ULA-only restriction in the nonpositive convolution theorem. Preserve the six confirmed red-team fixes while synchronizing. Also update its suggested-file validation description and counts.

Supplier follow-up should route the exact EDC5 coefficient scope and VS1 ordinary-cohomology continuity refinements, as well as RF4 completed-module algebraization, without re-planning existing upstream absolute reductive-group theory. The upstream RG2.5 atlas-edge observation belongs to the maintainer and was only recorded in `upstreamNotes`.

No additional mathematical choice is needed from the orchestrator to finish this review. The remaining publication decision is an authorized reader revision and independent acceptance. Full Lean validation additionally needs an already-built Tau Ceti baseline containing the line-bundle module; this run must not build it.
