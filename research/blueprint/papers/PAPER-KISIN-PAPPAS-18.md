# Kisin–Pappas: integral models with parahoric level

This is a **partial extraction with a complete read of the main paper**. It records the mathematical contents of Mark Kisin and Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*, Publications mathématiques de l’IHÉS **128** (2018), 121–218, [DOI](https://doi.org/10.1007/s10240-018-0100-0). The published [Numdam PDF](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf) has 98 pages; all were read, including the proofs and references. Printed page numbers are PDF page numbers plus 120. The result JSON records the PDF digest, pinned library evidence, input manifest, precise statements, APIs, tests, dependencies and outstanding proof inputs.

The paper constructs integral models of Shimura varieties of abelian type with connected parahoric level at an odd prime, under a tame-splitting hypothesis. It relates their singularities to group-theoretic local models, proves a tower-level extension property, describes the special fiber, and in an unramified case proves the Kottwitz formula for semisimple Frobenius traces on nearby cycles. The construction requires substantial reusable mathematics before the Shimura application: minuscule representations and integral fixers, torsors on punctured Witt discs, tensor-compatible displays, crystalline lattices, abelian-scheme twists and arithmetic component descent.

The partial status concerns recursive original-source verification and declaration-sized proof closure. It does not mean that the final sections were skipped. Several long proofs still contain named supplier contracts: these are assigned explicit gaps and are not represented as established library declarations. The later [Kisin–Pappas–Zhou paper](https://doi.org/10.1017/fmp.2026.10031), read in full in the preceding job, supplies essential corrections to the display construction and some global arguments. The present extraction retains the original paper’s theorem scopes while incorporating those corrections into the intended proof route.

## The baseline and the existing owners

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Fourteen carrier items cite 22 declarations whose statements were read at those exact pins in this session. They include Witt vectors and fraction-field Frobenius, the reductive and torus predicates, character/cocharacter lattices and pairing, Weyl dominant representatives, Coxeter Bruhat order, divided-power structures and abelian varieties over a field. Their source statements and module digests remain in `baseline.declarations`.

These are deliberately small claims. A Witt-vector type is not a Zink frame; a divided-power structure is not the Breuil divided-power envelope and comparison theorem; an abelian variety over a field is not an integral Siegel moduli space with its universal family. A dominant-representative theorem does not construct a Bruhat–Tits building. No declaration name was used as a substitute for reading its statement.

The reviewed library audit and current roadmap scopes were compared against those carriers. Thirteen additional items are planned imports from actual stage ids: buildings, fixers, Weil restriction, integral pinning, equal-characteristic Grassmannians, Dieudonné/deformation theory, integral p-divisible-group classification, formal moduli, good-level Siegel moduli, canonical generic Shimura models, nearby cycles, Hecke convolution and structured Serre–Tate theory. A planned item means the stage states the relevant scope; it does not mean that stage has been implemented.

The ownership screen preserves the candidates already proposed by the Kisin–Zhou and Kisin–Pappas–Zhou extractions. In particular, `GeometricSatakeLocalModelsPartII` owns mixed-characteristic integral local models, `FiniteFlatGroupsWithTensorsPartII` owns their display applications, and `ShimuraVarietiesHondaTatePartII` owns global integral models and reduction. `ReductiveGroupsIntegralRepresentationsPartII` receives the integral and modular minuscule representations. The generic local building and fixer arguments remain in the existing `ReductiveGroupsPartII`.

The punctured-disc torsor theorem is added as a distinct branch of the arithmetic-torsor candidate `ReductiveGroupsPartIIGrothendieckSerre`, with a proposed broader title. This is a consolidation decision, not a claim that the quasi-split reductive Grothendieck–Serre theorem implies parahoric purity. General torsor descent and Hartogs extension remain with `SchemeAndStackFoundations`.

The additional Hecke-algebra work requires a parahoric-center continuation of `SmoothRepresentationsOfLocalGroups`. Its existing SR.1 owns convolution and normalized corners; SR.4 owns classical spherical Satake. Neither states the exact Bernstein maps between Iwahori, parahoric and spherical centers used here. The previously proposed `SmoothRepresentationsPartIIUnitarySpherical` instead concerns unitary regions and temperedness, so it does not supply this missing interface. The new continuation does not depend on the Shimura trace formula that consumes it.

## Integral representations and full fixers

Section 1 distinguishes the extended building, retaining the split center’s real directions, from the adjoint building. At a point, the full smooth fixer can be larger than the connected parahoric. The Kottwitz homomorphism identifies the connected integral subgroup as the full fixer’s intersection with its kernel. A bounded subgroup can have a nontrivial torsion component; boundedness alone is insufficient. For a semisimple simply connected group the relevant fundamental-group target is zero.

Proposition 1.1.4 is split into its kernel and quotient assertions. For a tame group and central kernel that is a torus or finite of order prime to the residue characteristic, the closure in the connected parahoric is smooth and the connected quotient is fppf exact. The full-fixer map need not be surjective. Its proof needs exactness for torus models and the root-group/big-cell comparison, not merely the generic central quotient. These are local-group statements, while the underlying group schemes and root data are upstream imports.

The chain constructions retain every index, inclusion and grading. Multiplication by the uniformizer shifts the grading by one. An almost self-dual chain has the dual-index reversal and its offset; a symplectic chain stabilizer uses one common multiplier across all summands. The total-lattice construction later rescales the indexed copies by powers of p to obtain a lattice contained in its dual. An unscaled direct sum does not automatically have that property.

A toral building map depends on a specified hyperspecial image. The representation is first decomposed through its irreducible quotient groups, and the map factors through the corresponding block Levi. Equivariance alone leaves central translations undetermined. In the minuscule case, irreducibility of the integral reduction implies homothety of stable lattices: scale to get a nonzero reduction map, use irreducibility, then Nakayama. This yields uniqueness of the relevant toral maps up to a real central translation.

The nonsplit descent uses the division algebra opposite to the representation centralizer, its center field, and a projective Schur cocycle attached to a highest-weight constituent. Restriction of the center field and forgetting noncommutative division-algebra structure are distinct operations. The latter is not a Weil restriction along a commutative field. The equal-characteristic analogue requires the explicit twisted minuscule Weyl-module data of 1.2.27; it does not say that arbitrary modular representations are semisimple.

Proposition 1.3.3 uses the specific compatible toral map. In the split case, the chain decomposes into weight lattices, root strings are trivial or standard SL2 strings, and the root and torus closures yield a smooth schematic big cell. The tame case descends fixed fixer models through Weil restriction. The extraction separates the split proof, fixed-point comparison and final closed immersion. Original Landvogt, Jantzen, Bruhat–Tits and Prasad–Yu proof inputs remain named closure obligations.

## Torsors on the punctured Witt disc

Let S=W(k)[[u]], let D=Spec S, and remove the closed point (p,u). This punctured scheme is not D[1/p]: it includes the generic point of the special fiber. The proof uses the p-adic completion of S localized at (p), whose residue field is k((u)), together with D[1/p]. The transition between trivializations on these pieces is measured by a double-coset problem.

Proposition 1.4.3 proves H1_fppf(D×,G)=1 for the connected parahoric of a tame reductive group without E8 factors, with k either finite or an algebraic closure of Fp. The proof has two logically separate residue-field cases. First it assumes k algebraically closed. It trivializes the completed-boundary torsor using the residue field’s cohomological dimension and the special fiber’s reductive/unipotent structure. A flasque central resolution, induced-torus H1/H2 vanishing and Serre conjecture II then give triviality after inverting p. The remaining transition is eliminated by the double-coset factorization, using Iwahori wall quotients, integral lifting and torus component control.

Only afterwards does the proof descend to finite k. Affineness and Hartogs extension carry the descent datum across the missing point. Effective descent gives a torsor on D, and Lang’s theorem plus smooth henselian lifting makes it trivial. The final finite-field theorem therefore does not require pretending that its fraction field has the same cohomological dimension as the algebraically closed case.

This distinction matters in Lemma 1.4.6. Its proof uses a dimension-two fraction-field bound, although the section’s standing conventions also allow finite k. [Hu’s Theorem 4.5](https://doi.org/10.2140/ant.2013.7.1919), read at PDF page 29, gives prime-to-p cohomological dimension three for the fraction field of a two-dimensional henselian excellent local domain with finite residue field. The extraction uses the algebraically closed version sufficient for the main proof and preserves Step 4’s finite-field descent. It does **not** claim that the lemma’s conclusion over finite k has been disproved; the verified problem is with applying this particular dimension-two argument there.

Likewise a henselian ring with finite residue field is not strictly henselian. The induced-torus/Brauer argument must use the correct residue-field input. The split hyperspecial-contained alternative in Remark 1.4.15 has its own vector-bundle extension and chain-cokernel argument. It does not establish arbitrary parahoric or E8 purity. These distinctions are part of the design brief for the arithmetic-torsor owner.

## Local-model geometry and good embeddings

Section 2 begins with an unramified finite extension of Qp and a tame reductive group. Its polynomial group scheme specializes at u=p and is reductive after inverting u. The global Grassmannian classifies modifications along u=p; its generic local parameter is u−p. The minuscule local model is the flat schematic closure of a generic flag orbit over the reflex integers. The flag descends to the reflex field even when it has no point over that field.

Theorem 2.1.2 retains p∤|π1(Gder)|. Normality of the total local model, geometric reducedness of its special fiber and normal Cohen–Macaulay stratum closures are recorded separately from normality after every finite reflex extension. The last property is used in central and derived-isogeny comparisons. Replacing it with normality of the original base alone would leave a gap when normalizations are transported.

The adjoint map identifies the source with the normalization of the adjoint local model after reflex-field base change. Proposition 2.2.7 compares derived-isogenous models over the composite reflex field with the target fundamental-group hypothesis and derived equivariance retained. These are genuine geometric comparisons, not automatic consequences of an isomorphism of adjoint root data.

For the Hodge representation, the building map must land in the symplectic building. Lemma 2.3.3 treats the primary representation types using hermitian forms, tensor-trace pairings and paired dual representations. The cases abbreviated in the source remain explicit proof work. Proposition 2.3.7 then constructs the polynomial representation and compatible lattice chains, extends by coordinate-ring intersection, and checks the equal-characteristic closure. Tame fixed modules, polynomial vector-bundle freeness and the precise specialization are separate suppliers.

The total polarized lattice yields the ordinary-Grassmannian closed immersion in Corollary 2.3.16. The printed page 162 was visually inspected: the displayed prose gives rank dim(V′), which would make this Grassmannian a point. The Hodge filtration has rank g′=dim(V′)/2. The extraction uses the Hodge multiplicity, with a small Grassmannian-dimension regression that detects the error. This is a localized correction to the description, not a rejection of the closed-immersion theorem.

## Corrected display and tensor deformation theory

The coefficient ring is Zink’s What(R), consisting of the residue-field Witt part and decaying Witt vectors in the maximal ideal. A display records M, M1, F and F1 with the Verschiebung relation and the generating condition. Its base change adds the new augmentation ideal times the base-changed module. The contravariant Dieudonné functor is obtained from the covariant display convention by Cartier duality; variance is not left implicit.

When the Witt coefficient ring is p-torsion-free, the linearized filtration image is φ*L⊕pφ*T for a normal decomposition M1=L⊕I_RT. On a torsion quotient, the comparison diag(1,p) can have a kernel. The sequel’s relative-frame construction therefore uses a free tilde object with a comparison map, rather than defining it as an image in every base. Its block formula and canonical residual-to-universal first-order map are the required replacement for the original Lemma 3.1.9.

The original proof of Lemma 3.1.12 used a connection chosen from a normal decomposition that was not canonical. The corrected versality criterion uses the canonical relative-frame transport. Section 3.2.12 also needs the very-good tensor-preservation condition; smoothness of the stabilizer group alone does not establish that a tensor-preserving display map can be made constant in the required first-order sense. These corrections are carried into Propositions 3.2.17 and 3.3.13 and the Hodge local-model proof that consumes them.

The canonical rational Frobenius section in Lemma 3.1.17 is constructed by a convergent iteration. After inverting p, its topology comes from a p-adic lattice; the ideal generated by p in a ring where p is invertible cannot serve that purpose. The convergence estimate needs the shifted tail explained in the sequel. When proving that the limit preserves tensors, use the telescoping approximations that are compositions of tensor-preserving maps. An arbitrary sum of such maps would not preserve a tensor stabilizer.

Sections 3.2–3.3 assume k algebraically closed. The tensor datum includes a smooth stabilizer with connected reductive generic fiber, a Frobenius-pullback tensor frame, punctured-disc purity for the connected model, and scalar homotheties. The orbit ring is attached to a cocharacter μ_y splitting the filtration; the local-model convention uses its inverse. The corrected Tannakian argument restricts to the category generated by the G-representation rather than declaring the entire tensor automorphism group reductive.

The filtration lattice over W[[u]] is first constructed at a DVR point. Its local description contains both E(u) and μ_y(E(u))^-1, so scalar homotheties are used. The integral tensor isomorphism is obtained over the punctured disc and extended by Hartogs. Evaluating E at the Teichmüller lift of π requires the coefficient Frobenius in higher ghost components; the Eisenstein valuation argument is retained with that qualification.

Passing from all DVR points to a global tensor torsor over normal R_G requires valuative detection, Witt divisibility and a flatness theorem. The flatness citation [65] is **Raynaud–Gruson**, not Seshadri. Seshadri [68] is the separate polynomial vector-bundle input in Section 2. Neither named theorem is hidden inside a blanket claim that all tensor-isomorphism schemes are torsors.

The four infinitesimal adaptedness criteria use strictness in the weakly admissible category and the LieG+LieP description of tangent directions. The interpolation proof of Proposition 3.2.17 additionally needs a precise continuity/cofinality argument for the descending ideal neighborhoods. Its proof must not silently commute the image of a homomorphism with an infinite intersection. This is recorded as an unresolved proof obligation, without claiming an additional published error.

The integral crystalline functor is fully faithful and tensor compatible, but its exactness in this argument is on the punctured disc. That is where Broshi’s tensor-functor torsor is formed. The residual Dieudonné comparison contains a Frobenius pullback; the Tate lattice is the **linear dual** of Tp, as the paper’s footnote specifies. Wintenberger’s Kottwitz-kernel result and the punctured-disc purity theorem then provide the integral tensor trivialization. The original Kisin, Lau, Breuil, Broshi and Wintenberger proof statements remain recursive reading tasks.

## Global normalization, twisting and descent

The Hodge model is the normalization of a closure in an integral Siegel model with the prescribed lattice-chain level. A dedicated supplier item records this parahoric Siegel problem. The existing PEL good-level stage does not by itself provide its universal abelian scheme or its p-level structure. Once supplied, absolute Hodge tensors, structured Serre–Tate deformation and the corrected display construction identify the completed component of the closure with a local-model completion.

The tensor-frame map π is a G-torsor and the Hodge-filtration map q is smooth of relative dimension dimG. In the auxiliary diagram in the proof of Theorem 4.2.7, the sequel corrects the assertion that the action map is a torsor for the specified actions; smoothness is what the argument uses. At connected parahoric level, Lang’s theorem chooses a frame over the same finite residue field, giving the ordinary henselization comparison needed later for Frobenius traces.

The normalization from the full fixer to connected parahoric level is finite étale under the temporary global central-kernel condition. Its proof computes the geometric connected components and uses reflex reciprocity to kill inertia on the component cover. Small prime-to-p level eliminates rational stabilizers outside the connected subgroup. The final auxiliary Hodge cover removes the temporary condition from the resulting abelian-type theorem.

Twisting is developed at the A-isogeny level for A⊂Q, especially A=Z(p). A module twist is (M⊗_A O_P)^Z, with its faithfully flat trivialization. The analogous abelian twist needs the finite integral torsion-free algebra trivializing the torsor and the connected-kernel representability argument. The printed tensor_Q in the general A-linear formula is not used as a definition for a module that is not a Q-vector space. Weak polarizations descend with their character and unit ambiguity retained.

The integral adjoint action is constructed by these twists. It is not justified by importing a hyperspecial extension property that has not been proved for these parahoric models. The arithmetic star product is a semidirect quotient by the inverse graph; its central closure and topology matter. The component stabilizer is a Galois extension, not automatically a split product. Derived-cover comparisons use a connected fiber product over the adjoint group and the composite reflex field.

The induced quotient model must use the conjugated parahoric jKp°j^-1 on the j-component, as the sequel corrects. Its kernel can be infinite. Freeness is proved through all prime-to-p levels and rigidity of polarized isogenies, so a generic finite-group quotient lemma cannot replace the argument. The adjoint tensor-frame torsor and local-model map descend through the resulting action.

Lemma 4.6.22’s auxiliary Hodge cover has five separate outputs: a 2-primary derived fundamental group and the central localization condition; tame splitting; complete splitting of every p-adic reflex prime in E·E2; a connected center; and torsion-free inertia coinvariants of the abelianized cocharacter lattice. The construction assumes abelian type. Deligne’s vertex restrictions, especially type D, cannot be dropped by saying only that the adjoint group is classical. The sequel’s corrected cover construction is linked to these original outputs.

Theorem 4.6.23 is split into its five parts. The intrinsic target-group local model requires p∤π1(G2der); otherwise the auxiliary Hodge local model is used. The extension property concerns the full prime-to-p tower. A tower point trivializes an ℓ-adic Tate module, allowing Néron–Ogg–Shafarevich to establish good reduction. The theorem does not assert the same extension property for an arbitrary finite-level Shimura model.

The no-D^H or unramified-fixer hypotheses produce the connected adjoint local-model diagram. The special fiber is reduced, with normal Cohen–Macaulay geometric analytic branches; a vertex special over the maximal unramified extension gives normality of the whole special fiber. General independence of choices and reduction of the full frame torsor to G° are conjectures in this paper. Proposition 4.6.28 proves independence only for a very special parahoric and absolutely simple adjoint group, using ample automorphic line bundles, compactification and a common Proj comparison. Later all-case canonical models are not retroactively attributed to this source.

Proposition 0.1’s printed page 122 was also visually checked: its finite-level model must be described as **finite type**, not finite over the base DVR. Positive-dimensional Shimura varieties already distinguish those assertions. The body’s actual construction and theorem are used in the extraction.

## Nearby cycles and the test function

The nearby-cycle carrier is imported from `LefschetzPencilsAndVanishingCycles:LPV.0`, with its geometric trait diagram, strict-local stalk formula and Galois action. For an admissible filtration of a representation, semisimple trace is the sum of traces on the inertia invariants of the graded pieces, and for a complex it is alternating in cohomological degree. It is not generally the trace on the invariants of the original representation. The extraction includes a two-dimensional unipotent example that detects this difference.

The original [Pappas–Zhu v4](https://arxiv.org/abs/1110.5588) was acquired, and PDF pages 71–76 were read. These contain the two central-convolution comparisons, splitting-field unipotence, very-special triviality, the semisimple trace definition and the Bernstein characterization. Their numbering is §9, whereas KP18 cites the published §10. The result records this version distinction; the rest of Pappas–Zhu is not claimed read.

Unipotence uses central sheaves and a Wakimoto filtration to show that the nonunipotent summand vanishes when its cohomology vanishes. At a very special vertex, faithfulness of the relevant hypercohomology functor gives triviality of inertia. These are stronger and more specific inputs than the existence of a generic nearby-cycle functor. A special vertex and a very special vertex are not interchangeable in the inertia statement.

For Frobenius, a geometric strict-local identification alone is insufficient. The connected adjoint diagram gives a local-model point over the same Fq and an ordinary henselization isomorphism over the base. This preserves the Frobenius action and hence its semisimple trace. After embedding the local-model points into the matching equal-characteristic parahoric cosets, extension by zero gives a compactly supported biinvariant function. Central convolution of sheaves proves that this function is central.

For unramified groups the equal- and mixed-characteristic double-coset comparison must preserve convolution structure constants, not merely index sets. Bernstein’s center isomorphisms are built through a common Iwahori and normalized idempotents. A characteristic function of a compact subgroup is idempotent only when its Haar volume is one; otherwise the unit is divided by that volume.

Finally, the source’s formula is Trss(Frob_y,RΨQell)=q^(d/2)z_(μ_h,r)(w), with p>2, unramified G, p∤|π1(Gder)|, and no D^H factors or a parahoric contained in a hyperspecial. Here q is the residue-field cardinality, d is the Shimura dimension and r is the extension degree of residue fields. The generic sheaf is unshifted Qell. Converting from IC involves both a shift sign and a half-Tate factor. The smooth minuscule example has raw trace one and IC trace (−1)^d q^(−d/2); it checks the convention without proving the full Bernstein comparison. The remaining normalization work is explicitly assigned to the Pappas–Zhu/Haines/Lusztig source gate.

## Routing briefs

The following briefs are the instructions for the design jobs. A reused candidate id is an ownership commitment, not an installed stage or a declaration already available in Lean.

### Route 1: `ReductiveGroupsPartII`

Existing valued-local-group owner: add the exact central-kernel, minuscule building/fixer and Lang statements as proof inputs to its models and double-coset scope. Do not rebuild upstream reductive groups, pinning or roots.

Supplier stages: `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.1`, `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`.

This route includes 17 items.

### Route 2: `SchemeAndStackFoundations`

Generic Hartogs extension, affine arithmetic descent and module torsor twisting use the existing scheme/descent owner. Import the earlier CESNAVICIUS-22 torsor and patching items before adding statement-specific adapters.

Supplier stages: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

This route includes 4 items.

### Route 3: `AbelianSchemesAndArithmeticModuli`

The A-isogeny twist, weak polarization and structured Serre–Tate comparison extend the existing arithmetic Hom/dual/deformation APIs. General torsor descent stays in SF.1; integral Shimura actions are consumers.

Supplier stages: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A6`.

This route includes 4 items.

### Route 4: `LefschetzPencilsAndVanishingCycles`

LPV owns the actual nearby-cycle functor and its inertia/monodromy filtration. Add semisimple trace on finite-inertia graded pieces with exact-triangle additivity; import the established étale trace and adic-realization suppliers. No second nearby-cycle carrier is created.

Supplier stages: `LefschetzPencilsAndVanishingCycles:LPV.0`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

This route includes 2 items.

### Route 5: `ReductiveGroupsIntegralRepresentationsPartII`

Identical candidate owner to KPZ26; these are the original minuscule-lattice inputs it consumes, not a new parallel representation roadmap.

Reuse the KPZ26 candidate beginning after Reductive groups (tauceti:TauCetiRoadmap/ReductiveGroups), especially integral pinned groups Layer9, and Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems) for the root/weight carrier. Add KP18 minuscule integral highest-weight lattices, irreducible reduction (Jantzen II2.15), homothety of stable lattices, rank-one root strings, projective Schur descent through a division algebra and explicit equal-characteristic twisted Weyl data. Prove Proposition1.2.10 with its split irreducible characteristic-zero hypotheses; supply Proposition1.3.3 through the local-group owner rather than own buildings here. Do not assume arbitrary characteristic-p representations semisimple or replace integral divided powers by rational operators. Resolve the Satake primary symplectic cases and integral root-action source gates before closing this branch.

This route includes 7 items.

### Route 6: `ReductiveGroupsPartIIGrothendieckSerre`

Consolidates a new parahoric purity branch with the existing arithmetic-torsor candidate and proposes a broader title. It neither claims the existing GS theorem covers it nor adds a second generic torsor carrier.

Reuse the CESNAVICIUS-22 arithmetic-torsor candidate, beginning with Reductive groups (tauceti:TauCetiRoadmap/ReductiveGroups). Add a distinct punctured-disc branch: for D=Spec W(k)[[u]], k finite or an algebraic closure of Fp, and connected parahoric G with tame reductive generic fiber without E8, prove H1_fppf(D minus closed point,G)=1 (KP18 Proposition1.4.3). This is not a specialization of the candidate’s regular-semilocal quasi-split REDUCTIVE Grothendieck–Serre theorem: the parahoric need not be reductive over D. Import ReductiveGroupsPartII RG2.1–4 for fixers/root decompositions, SchemeAndStackFoundations SF.0–2/4 for descent, cohomology, Hartogs and patching, and FiniteFlatGroupsAndIntegralPadicHodgeTheory for the Witt coefficient carrier. Split induced-torus H1/H2, flasque cyclic resolution, Serre-II generic triviality over algebraically closed k, completed-boundary triviality, the double-coset factorization and finite-k descent into separate layers. The dimension-two fraction-field argument is only used over algebraically closed k; finite k has prime-to-p cd3. Read the exact Gabber/Kato/Gille/Bayer-Fluckiger–Parimala and Brauer sources and close the no-E8 hypotheses. Export the actual trivialization and tensor-isomorphism extension to display consumers.

This route includes 12 items.

### Route 7: `GeometricSatakeLocalModelsPartII`

Reuses the established integral local-model owner; its later degeneration/central-sheaf branch supplies this paper’s extra arithmetic application without recreating LPV or classical Hecke algebras.

Reuse GeometricSatakeLocalModelsPartII from Kisin–Zhou25/KPZ26, beginning with GeometricSatakeAndFusion. Import GlobalShtukasAndFunctionFieldLanglands GS.1 for equal-characteristic loop geometry, ReductiveGroupsPartII for fixers and integral representations from ReductiveGroupsIntegralRepresentationsPartII. Add the original tame Pappas–Zhu closure, normality under p∤π1derived, geometrically reduced special fiber, normal Cohen–Macaulay Schubert closures and normality after every finite reflex extension; then central/derived-isogeny comparisons, symplectic chain and total-lattice good embeddings. Prove KP18 Theorem2.1.2, Propositions2.2.4/2.2.7/2.3.7 and Corollary2.3.16 with the half-rank flag convention. Add a later nearby-cycle branch importing LPV.0–1 and SmoothRepresentationsOfLocalGroups SR.1/SR.4 plus SmoothRepresentationsPartIIParahoricCenters: prove splitting-field unipotence, very-special triviality, centrality and Bernstein characterization of the local-model trace. Read PZ published10.5/10.9/10.12/10.14/10.16 (v4 §9 numbering) and its Wakimoto/central-sheaf inputs. Keep the raw constant sheaf distinct from IC[d](d/2), and make Haar, Frobenius and shift conventions explicit. Shimura test-function formulas are applications in the integral Shimura owner.

This route includes 18 items.

### Route 8: `FiniteFlatGroupsWithTensorsPartII`

Same tensor/display owner as the two preceding extractions. Original KP18 proofs and their corrections are linked, not counted as independently covered by a carrier stage.

Reuse the Kisin–Zhou25/KPZ26 candidate, beginning with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2/R07.4/R07.6. Import Witt vectors and divided powers from the pinned baseline, local-model rings from GeometricSatakeLocalModelsPartII, parahoric purity from ReductiveGroupsPartIIGrothendieckSerre, and generic Hartogs/descent from SchemeAndStackFoundations. Develop KP18 §3 with algebraically closed k in §§3.2–3.3, contravariant Dieudonné variance and LINEAR dual Tate modules. Replace Lemma3.1.9’s invalid normal-decomposition connection by KPZ26 §5.1.15–19’s relative-frame τ and residual-to-universal canonical map; require very-good first-order tensor preservation in3.2.12. Prove the corrected versality, tangent lifting, rational Frobenius section in its lattice-induced topology, integral tensor torsors, four tangent criteria and Proposition3.2.17/3.3.13 factorization. Split Breuil–Kisin tensor/exactness/comparison statements, exactness only on D×, Wintenberger Kottwitz image and Broshi tensor torsors. Keep Raynaud–Gruson flatness, pointwise integrality, weak-admissibility strictness and interpolation continuity as explicit proof inputs.

This route includes 31 items.

### Route 9: `ShimuraVarietiesHondaTatePartII`

The established integral Shimura candidate owns global descent and arithmetic applications. Canonical all-case results from the sequel remain a later input, never retroactively attributed to the original paper.

Reuse the candidate established by KMPS22, Kisin–Zhou25 and KPZ26; its first prerequisite is ShimuraVarieties V1/V6/V8. Import the local-model, display, parahoric, abelian-scheme twisting and LPV/Hecke owners above. Construct the prescribed Siegel parahoric moduli before normalization (PEL M2 good-level smoothness is insufficient), absolute Hodge realizations, corrected adapted deformation rings, integral tensor frames, smooth local-model diagrams and connected-parahoric finite étale normalization. Develop the arithmetic star products, component Galois extensions, central twisting and free quotient descent including potentially infinite kernel and jKp°j^-1 component levels. Prove Lemma4.6.22’s five separate auxiliary-cover outputs only for abelian type, using KPZ26’s corrected cover; prove Theorem4.6.23’s five parts separately and Corollary4.6.26. The DVR extension property is at the full prime-to-p tower. General independence and connected G°-torsor reduction are conjectures in this source, whereas Proposition4.6.28 proves independence only for very special Kp and absolutely simple Gad. Finally prove Corollary4.7.3 and Theorem4.7.11: unramified G, p>2, p∤π1derived, and no D^H or hyperspecial-contained parahoric give Trss(Frob_y,RΨQell)=q^(d/2)z_(μ_h,r)(w). Same-field henselization is required for Frobenius, unlike the geometric inertia comparison.

This route includes 48 items.

### Route 10: `SmoothRepresentationsPartIIParahoricCenters`

The catalogue supplies classical spherical Satake and generic centers but not these exact parahoric-center isomorphisms and same-type transfer. This is a distinct continuation, with a checked boundary against the unitary-spherical candidate.

Begin after SmoothRepresentationsOfLocalGroups (Smooth representations of local groups), importing SR.1’s convolution/corners, SR.3’s applicable characteristic-zero center carrier, and SR.4’s classical spherical Satake. Import ReductiveGroupsPartII RG2.4–5 for matching unramified valued-root/Frobenius data. Construct the Iwahori Bernstein presentation and the isomorphisms from its center to a parahoric center and spherical Hecke algebra by normalized idempotents (Haines2009 Theorem3.1.1 and change-of-parahoric compatibility). Define z_(μ,r) with explicit coefficient field, geometric Frobenius, sqrt(q), cocharacter sign and hyperspecial minuscule value q^(-d/2)1_(KμK). Prove that the equal/mixed-characteristic matching double-coset bijection preserves convolution constants and z. This algebraic owner exports N10–N12 to the local-model central-sheaf proof; it does not depend on the Shimura trace formula it supplies. The existing SmoothRepresentationsPartIIUnitarySpherical candidate classifies unitary/tempered spherical parameters and does not supply these parahoric center maps. Close the original Haines/Lusztig proof inputs before marking the route complete.

This route includes 3 items.

## Explicit proof-closure gates

- **Q-local** (19 direct consumers): Read the original Bruhat–Tits/Landvogt/Edixhoven/Prasad–Yu and Lang statements used by each minuscule fixer and same-field lifting lemma; split the long G08/G11/G12/G14 proofs and verify scalar/central translations and residue-field generality.
- **Q-representation** (8 direct consumers): Close Jantzen II2.15 and integral highest-weight root operators, Tits division-algebra descent and Satake primary cases including the cases left to the reader in Lemma2.3.3. No general characteristic-p semisimplicity is available.
- **Q-purity** (12 direct consumers): Read the original Serre-II, Gabber–Kato dimension, flasque cyclic lattice, Brauer-purity and boundary-factorization inputs. Retain the algebraically closed first proof and finite-k descent; Hu13 Theorem4.5 rules out cd2 over finite k. Split U09 and U13 further.
- **Q-foundations** (4 direct consumers): Resolve Hartogs extension for the actual affine descent schemes, faithful-flat residue extension, arithmetic coordinate intersections and the exact fpqc descent interfaces at declaration level; import SF.0/SF.1 rather than assume all limits preserve these properties.
- **Q-models** (19 direct consumers): Read Pappas–Zhu normality/reducedness/base-change proofs, polynomial-model central maps, Schubert quasi-finiteness, Görtz symplectic models and Seshadri polynomial vector-bundle freeness. Decompose all three steps of Proposition2.3.7 and verify every specialization map.
- **Q-display** (31 direct consumers): Close the corrected relative-frame functor and very-good construction through KPZ26/Hoff, the pointwise Witt integrality and Raynaud–Gruson4.1.2 flatness argument, weak-admissible tangent strictness and the image/intersection continuity in Proposition3.2.17. Corrected source read is not a closed proof graph.
- **Q-comparison** (6 direct consumers): Read original Lau3.19, Kisin crystalline lattice functor, Breuil comparison, Wintenberger and Broshi sources. Prove punctured-disc exactness and Frobenius support removal, not exactness on all S; preserve Tp linear dual and phi-pullback conventions.
- **Q-shimura** (48 direct consumers): Close integral absolute-Hodge/de Rham/crystalline comparison, analytic horizontal-tensor identification, normalization/completion adapters and the NOS tower extension proof. Specify base rings and variance throughout.
- **Q-twisting** (7 direct consumers): Read Moret-Bailly1.6 and Kisin2010 §§3.1–3.4, including the finite integral trivializing algebra, representability in the A-isogeny category, weak polarization and rigidity of all-level isogenies.
- **Q-components** (10 direct consumers): Read Deligne1979 §§2.0–2.7 and Kisin2017 E.7 for arithmetic completions, reciprocity, possibly infinite free quotients and effective descent. Verify every corrected j-conjugated level and split the multi-page quotient construction.
- **Q-cover** (5 direct consumers): Close the global CM-torus construction, Deligne special-vertex classification and compatible five-output cover, importing the corrected KPZ26 branch. Do not extend from abelian type to every classical adjoint datum.
- **Q-independence** (1 direct consumers): Read Madapusi Pera toroidal compactifications, Milne’s common-open extension argument, ample automorphic line construction and Hartogs/Proj comparison. This is the restricted Proposition4.6.28, not general canonical uniqueness.
- **Q-nearby** (5 direct consumers): PZ13 v4 PDF71–76 read, including central convolution proof, monodromy, semisimple trace and Bernstein characterization. Recursively close its central-sheaf/Wakimoto filtration, faithful hypercohomology, normalized adic functors and sheaf–function dictionary; verify correspondence with published §10 and erratum.
- **Q-hecke** (5 direct consumers): Read Haines2009 Theorem3.1.1/change-of-parahoric and Lusztig’s normalization against the actual published editions. Check every q-half, shift sign, cocharacter inverse, Haar idempotent and equal/mixed-characteristic convolution coefficient. N14 retains KP18’s stated final formula; its full normalization proof is open.
- **Q-siegel** (1 direct consumers): Construct the parahoric Siegel lattice-chain moduli and universal family used by4.1/4.2 from de Jong/Görtz. PEL good-level representability is a prerequisite, not a proof of this p-level model.

## Validation and continuation

There are 171 items: 14 limited library carriers, 13 planned imports and 144 missing items. Each missing item has exactly one route. All 48 definitions/constructions carry three API statements and three unit-test specifications, giving 144 API statements and 144 specified tests. These tests are mathematical acceptance statements, not compiled Lean examples. The internal dependency graph is checked for unresolved ids and cycles, and all planned stage ids are checked against the current atlas.

Seven exact arithmetic diagnostics check the Hodge half-rank Grassmannian, opposite SL2 root valuation bounds for a nontrivial lattice, the mod-p kernel of the tilde comparison, semisimple trace versus invariants for unipotent inertia, normalized Haar idempotents, the IC shift/half-twist convention and conjugated component levels. These are meaningful tests of conventions and tempting incorrect definitions; they do not prove any of the global geometric theorems.

The final checks include the paper schema, the three authorized intake paths, source and pinned declaration digests, current input blob ids and route uniqueness. No Lean file is authorized by this paper issue, and none was written or compiled. Nothing is claimed formalized. The only submitted files are the result, this report and the handoff.

Continue by closing the original torsor and corrected display suppliers, then the Pappas–Zhu/Haines normalization proof, and finally the global cover, component quotient, twisting and restricted independence arguments. Preserve the item ids and candidate owners. Long proof steps and grouped bibliographic leads must be split into exact original-source declarations before changing the status to complete. A full read of the main paper is evidence for this extraction; it is not a substitute for that recursive work.

## Item index

The JSON supplies the full statements, hypotheses, dependencies, APIs, tests, source versions and gaps. This index provides their locators.

| Item | Kind | Status | Mathematical item | Source locator |
|---|---|---|---|---|
| L01 | definition | library | Witt-vector coefficient carrier | §§1–4, foundational carrier imported with the limited scope below |
| L02 | construction | library | Frobenius on the Witt fraction field | §§1–4, foundational carrier imported with the limited scope below |
| L06 | definition | library | Connected reductive group predicate | §§1–4, foundational carrier imported with the limited scope below |
| L07 | definition | library | Algebraic torus predicate | §§1–4, foundational carrier imported with the limited scope below |
| L08 | definition | library | Geometric character lattice | §§1–4, foundational carrier imported with the limited scope below |
| L09 | definition | library | Cocharacter lattice and pairing | §§1–4, foundational carrier imported with the limited scope below |
| L10 | theorem | library | Perfect character-cocharacter pairing | §§1–4, foundational carrier imported with the limited scope below |
| L11 | definition | library | Closed dominant chamber of a root pairing | §§1–4, foundational carrier imported with the limited scope below |
| L12 | theorem | library | Unique dominant representative in a Weyl orbit | §§1–4, foundational carrier imported with the limited scope below |
| L13 | definition | library | Abelian variety over a field | §§1–4, foundational carrier imported with the limited scope below |
| L15 | definition | library | Divided-power structure | §§1–4, foundational carrier imported with the limited scope below |
| L16 | theorem | library | Finite free cocharacter lattice | §§1–4, foundational carrier imported with the limited scope below |
| L17 | theorem | library | Galois invariance of the pairing | §§1–4, foundational carrier imported with the limited scope below |
| L18 | definition | library | Coxeter Bruhat order | §§1–4, foundational carrier imported with the limited scope below |
| P01 | theorem | planned | Extended buildings and facet fixers | §§1–4, foundational carrier imported with the limited scope below |
| P02 | theorem | planned | Bruhat–Tits smooth stabilizers and connected parahorics | §§1–4, foundational carrier imported with the limited scope below |
| P03 | theorem | planned | Affine Weil restriction | §§1–4, foundational carrier imported with the limited scope below |
| P04 | theorem | planned | Pinned root subgroup maps | §§1–4, foundational carrier imported with the limited scope below |
| P05 | theorem | planned | Equal-characteristic affine Grassmannian | §§1–4, foundational carrier imported with the limited scope below |
| P08 | theorem | planned | Dieudonné and nilpotent deformation theory | §§1–4, foundational carrier imported with the limited scope below |
| P09 | theorem | planned | Integral p-divisible group classification | §§1–4, foundational carrier imported with the limited scope below |
| P10 | theorem | planned | Formal moduli and Artin approximation | §§1–4, foundational carrier imported with the limited scope below |
| P12 | theorem | planned | Siegel and PEL good-level moduli | §§1–4, foundational carrier imported with the limited scope below |
| P13 | theorem | planned | Canonical generic Shimura models | §§1–4, foundational carrier imported with the limited scope below |
| G01 | construction | missing | Kottwitz component homomorphism | §1.1.2 |
| G02 | theorem | missing | Extension of a central quotient to fixer models | §1.1.3 |
| G03 | theorem | missing | Smooth central kernel in connected parahorics | Proposition1.1.4, kernel |
| G04 | theorem | missing | Exact central quotient of connected parahorics | Proposition1.1.4, quotient; Remark1.1.8 |
| G05 | construction | missing | Periodic graded lattice chain | §1.1.9 |
| G06 | construction | missing | Almost self-dual symplectic chain | §1.1.11 |
| G07 | theorem | missing | Diagonal chain stabilizer is a closed immersion | §§1.1.9–1.1.11 |
| G08 | construction | missing | Based toral building map | Proposition1.2.3 |
| G09 | theorem | missing | Quotient group preserves the chosen lattice | Lemma1.2.5 |
| R01 | construction | missing | Minuscule representation in characteristic zero | §1.2.9 |
| R02 | theorem | missing | Irreducible reduction of an integral minuscule lattice | Proposition1.2.10 proof |
| R03 | theorem | missing | Stable minuscule lattices are homothetic | Proposition1.2.10 |
| G10 | theorem | missing | Uniqueness up to real translation | Corollary1.2.11 |
| R04 | construction | missing | Integral highest-weight lattice with pinning | §1.2.12 |
| R05 | construction | missing | Tame projective descent of an irreducible representation | §§1.2.14–1.2.20 |
| G11 | theorem | missing | Galois-equivariant minuscule building map | Proposition1.2.21; §§1.2.22–1.2.26 |
| R06 | construction | missing | Equal-characteristic twisted minuscule representation data | §1.2.27 |
| R07 | theorem | missing | Rank-one minuscule root strings | Proposition1.3.3 proof, split case |
| G12 | theorem | missing | Split minuscule fixer immersion | Proposition1.3.3, split proof |
| G13 | theorem | missing | Tame fixed fixer comparison | Proposition1.3.9 |
| G14 | theorem | missing | Tame faithful minuscule fixer immersion | Proposition1.3.3 |
| G15 | theorem | missing | Equal-characteristic fixer immersion | §1.3.13 |
| U01 | construction | missing | Punctured Witt disc and p-adic boundary | §1.4.1 |
| U02 | theorem | missing | Induced-torus H1 vanishing | Lemma1.4.5, first assertion |
| U03 | theorem | missing | Induced-torus H2 restriction vanishes | Lemma1.4.5, second assertion |
| U04 | theorem | missing | Cohomological dimension for the algebraically closed case | Lemma1.4.6 proof; Hu2013 Theorem4.5 for finite-k diagnostic |
| U05 | theorem | missing | Simply connected torsors on the generic puncture | Lemma1.4.6, qualified scope |
| U06 | construction | missing | Flasque resolution for the torsor argument | §1.4 proof Step2 |
| U07 | theorem | missing | Triviality over the completed boundary | Proposition1.4.3 Step1 |
| U08 | theorem | missing | Triviality on D[1/p] for the parahoric torsor | Proposition1.4.3 Step2 |
| U09 | theorem | missing | Witt boundary double-coset factorization | Proposition1.4.3 Step3 |
| U10 | theorem | missing | Parahoric torsor purity over algebraically closed k | Proposition1.4.3 Steps1–3 |
| U11 | theorem | missing | Finite-residue-field descent of parahoric purity | Proposition1.4.3 Step4 |
| U12 | theorem | missing | Hartogs extension of affine torsor descent data | Proposition1.4.3 Step4; Remark1.4.15 |
| U13 | theorem | missing | Vector-bundle and chain proof in the split hyperspecial-contained case | Remark1.4.15 |
| M01 | construction | missing | Pappas–Zhu polynomial group and global Grassmannian | §2.1.1; §2.1.4 |
| M02 | construction | missing | Minuscule flat local model | §2.1.1 |
| M03 | theorem | missing | Normal local model | Theorem2.1.2, normality |
| M04 | theorem | missing | Reduced special fiber and normal Cohen–Macaulay strata | Theorem2.1.2, special fiber |
| M05 | theorem | missing | Normality after finite reflex extension | Corollary2.1.3 |
| M06 | theorem | missing | Central quotient map of polynomial models | Proposition2.2.2 |
| M07 | theorem | missing | Adjoint local-model normalization | Proposition2.2.4 |
| M08 | theorem | missing | Derived-isogeny comparison of local models | Proposition2.2.7 |
| M09 | theorem | missing | Symplectic factorization of the minuscule building map | Lemma2.3.3 |
| M10 | theorem | missing | Polynomial extension of the lattice-chain representation | Proposition2.3.7 proof Steps1–3 |
| M11 | theorem | missing | Closed symplectic local-model embedding | Proposition2.3.7 |
| M12 | construction | missing | Polarized total lattice | §2.3.15 |
| M13 | theorem | missing | Closed ordinary-Grassmannian local-model embedding | Corollary2.3.16 |
| D01 | construction | missing | Zink coefficient frame | §3.1.2 |
| D02 | construction | missing | Contravariant display | §3.1.3 |
| D03 | theorem | missing | Normal decomposition and linearized display map | Lemma3.1.5 |
| D04 | theorem | missing | Display base change compatibility | §3.1.6 |
| D05 | theorem | missing | Dieudonné antiequivalence with displays | §3.1.7, citing Lau Theorem3.19 |
| D06 | construction | missing | Universal filtered deformation pair | §3.1.8 |
| D07 | construction | missing | Corrected relative-frame tilde functor | KP18 Lemma3.1.9 corrected by KPZ26 §5.1.15–19 |
| D08 | theorem | missing | Versal display deformation with the corrected first-order condition | Lemma3.1.12; KPZ26 §5.1 corrections |
| D09 | theorem | missing | Tangent lifting over a DVR | Lemma3.1.15 |
| D10 | theorem | missing | Canonical rational Frobenius-equivariant section | Lemma3.1.17; KPZ26 §7.3.1(2) |
| D11 | theorem | missing | Filtered comparison at a DVR point | §3.1.18 |
| D12 | construction | missing | Integral tensor deformation datum | §§3.2.1–3.2.4 |
| D13 | construction | missing | Tensor orbit deformation ring | §3.2.5 |
| D14 | construction | missing | Breuil–Kisin filtration lattice at a DVR point | Lemma3.2.6 |
| D15 | theorem | missing | Tensor torsor of the filtration lattice | Lemma3.2.6(1)–(2) |
| D16 | theorem | missing | Integral tensors in the tilde lattice | Lemma3.2.9 |
| D17 | theorem | missing | Global integral tensor torsor over normal R_G | Corollary3.2.11 |
| D18 | theorem | missing | Tensor-preserving versal display with very-good input | §3.2.12 corrected by KPZ26 §§5–6 |
| D19 | theorem | missing | Canonical Frobenius section preserves tensors | Lemma3.2.13 |
| D20 | theorem | missing | Four equivalent infinitesimal adaptedness criteria | Lemma3.2.14 |
| D21 | theorem | missing | Adapted DVR deformation factors through R_G | Proposition3.2.17 |
| D22 | construction | missing | Integral Breuil–Kisin module | §3.3.1 |
| D23 | theorem | missing | Fully faithful integral crystalline tensor functor | Theorem3.3.2, functor and exactness |
| D24 | theorem | missing | Crystalline and de Rham realizations of the Kisin module | Theorem3.3.2(1) |
| D25 | theorem | missing | p-divisible Dieudonné comparison and dual convention | Theorem3.3.2(2) and footnote6 |
| D26 | theorem | missing | Galois image lies in the Kottwitz kernel | Proposition3.3.4 |
| D27 | theorem | missing | Tensor trivialization on the Kisin module | Lemma3.3.5 |
| D28 | theorem | missing | Tame no-E8 full-fixer tensor comparison | Corollary3.3.6 |
| D29 | theorem | missing | Integral crystalline and de Rham tensors of a p-divisible group | Proposition3.3.8 |
| D30 | theorem | missing | Cocharacter splitting of the integral Hodge filtration | Corollary3.3.10 |
| D31 | theorem | missing | Étale tensor adaptedness criterion | Proposition3.3.13 |
| S01 | construction | missing | Hodge normalization model | §§4.1–4.2.1 |
| S02 | theorem | missing | Absolute Hodge tensors and their realizations | §4.1.5–§4.2.1 |
| S03 | theorem | missing | Completed component of the Hodge closure | Proposition4.2.2 |
| S04 | theorem | missing | Completed normalized Hodge local rings | Corollary4.2.4 |
| S05 | theorem | missing | Integral de Rham tensors | Proposition4.2.6 |
| S06 | construction | missing | Hodge local-model diagram | Theorem4.2.7 |
| S07 | theorem | missing | Smoothness of the Hodge local-model map | Theorem4.2.7; KPZ26 §7.3.1(1) |
| S08 | theorem | missing | Reduced Hodge special fiber and admissible stratification | Corollary4.2.12 |
| S09 | theorem | missing | Same-field henselization comparison | Corollary4.2.13 |
| S10 | theorem | missing | Reflex norm of local units | Lemma4.3.2 |
| S11 | construction | missing | Temporary global central-kernel condition | §4.3.3–(4.3.4) |
| S12 | theorem | missing | Small-level rational stabilizers are connected | Lemma4.3.5 |
| S13 | construction | missing | Connected-parahoric normalization | §4.3.6 |
| S14 | theorem | missing | Connected normalization is finite étale | Proposition4.3.7 |
| S15 | theorem | missing | Unramified field of connected components | Corollary4.3.9 |
| S16 | construction | missing | Module twist by an affine torsor | §4.4.2–Lemma4.4.3 |
| S17 | theorem | missing | Faithfully flat twist descent | Lemma4.4.3 |
| S18 | construction | missing | Abelian scheme twist up to A-isogeny | §4.4.5–Lemma4.4.6 |
| S19 | theorem | missing | Representability of the abelian twist | Lemma4.4.6 |
| S20 | construction | missing | Weak polarization and character-compatible twist | §4.4.7–Lemma4.4.8 |
| S21 | theorem | missing | Integral central action on the universal abelian scheme | Lemma4.5.2 |
| S22 | theorem | missing | Twisted prime-to-p level descends | Lemma4.5.4 |
| S23 | construction | missing | Arithmetic star product | §4.5.6 |
| S24 | construction | missing | Arithmetic component-action groups | §4.5.6; §4.6.3 |
| S25 | theorem | missing | Adjoint twisting action on the integral model | Lemma4.5.7 |
| S26 | theorem | missing | Lifted action on the adjoint frame torsor | Lemma4.5.9 |
| S27 | theorem | missing | Descent of a rational model to Z(p) | §4.6.1 |
| S28 | theorem | missing | Derived closure and adjoint neutral quotient | Lemma4.6.2 |
| S29 | theorem | missing | Arithmetic completion depends on the derived group | Lemma4.6.4 |
| S30 | construction | missing | Galois component-stabilizer extension | §4.6.5 |
| S31 | theorem | missing | Exact stabilizer extension and amalgamation identity | Lemma4.6.6 |
| S32 | theorem | missing | Derived-cover maps of Galois extensions | Lemma4.6.9 |
| S33 | theorem | missing | Cartesian arithmetic component square | Lemma4.6.10 |
| S34 | construction | missing | Component-indexed induced Shimura model | Lemma4.6.13; Corollary4.6.15, corrected component indexing |
| S35 | theorem | missing | Freeness of the derived-cover descent kernel | Corollary4.6.15 proof; Corollary4.6.18 proof |
| S36 | theorem | missing | Integral abelian-type descent and local geometry | Corollary4.6.15 |
| S37 | theorem | missing | Descent of the adjoint local-model diagram | Corollary4.6.18 |
| S38 | construction | missing | Auxiliary Hodge cover of an abelian-type datum | Lemma4.6.22; KPZ26 Theorem7.2.19 |
| S39 | theorem | missing | Cover fundamental group and localization condition | Lemma4.6.22(1) |
| S40 | theorem | missing | Tame cover splitting | Lemma4.6.22(2) |
| S41 | theorem | missing | Reflex-prime splitting in the composite field | Lemma4.6.22(3) |
| S42 | theorem | missing | Connected cover center | Lemma4.6.22(4) |
| S43 | theorem | missing | Torsion-free abelian coinvariants of the cover | Lemma4.6.22(5) |
| S44 | theorem | missing | Tame abelian-type integral model with auxiliary local model | Theorem4.6.23(1) |
| S45 | theorem | missing | Intrinsic local-model comparison | Theorem4.6.23(2) |
| S46 | theorem | missing | DVR extension at full prime-to-p tower | Theorem4.6.23(3) |
| S47 | theorem | missing | Connected adjoint diagram without D-quaternionic factors | Theorem4.6.23(4) |
| S48 | theorem | missing | Connected diagram in the unramified fixer case | Theorem4.6.23(5); Remark4.2.14(b) |
| S49 | theorem | missing | Reduced abelian-type special fiber | Corollary4.6.26, first statement |
| S50 | theorem | missing | Normal special fiber at a geometric special vertex | Corollary4.6.26, second statement |
| S51 | theorem | missing | Choice independence at a very special simple datum | Proposition4.6.28 |
| N01 | construction | planned | Nearby cycles with geometric Galois action | §4.7.1 |
| N02 | construction | missing | Semisimple Frobenius trace | §4.7.1; PZ13 v4 §9.d.1 pp74–75 |
| N03 | theorem | missing | Local-model splitting-field inertia is unipotent | §4.7.3 citing PZ published10.9; PZ v4 Theorem9.9 pp73–74 |
| N04 | theorem | missing | Very-special local-model inertia is trivial | §4.7.3 citing PZ published10.12; v4 Proposition9.12 p74 |
| N05 | theorem | missing | Shimura nearby-cycle inertia | Corollary4.7.3 |
| N06 | theorem | missing | Frobenius-compatible local trace transfer | §4.7.4–(4.7.7) |
| N07 | construction | planned | Parahoric Hecke algebra | §4.7.8 |
| N08 | construction | missing | Local-model trace function on equal-characteristic cosets | §4.7.8 |
| N09 | theorem | missing | Centrality of the nearby-cycle trace function | §4.7.8 citing PZ published10.14; v4 Theorem9.14 p75 |
| N10 | theorem | missing | Unramified equal/mixed-characteristic Hecke comparison | §4.7.9; (4.7.13) |
| N11 | construction | missing | Bernstein central function for a minuscule class | Theorem4.7.11; PZ v4 Theorem9.16; Haines2009 Theorem3.1.1 |
| N12 | theorem | missing | Bernstein isomorphism between parahoric and spherical centers | Theorem4.7.11 proof, Haines2009 Theorem3.1.1 |
| N13 | theorem | missing | Unique local-model central trace with prescribed spherical image | PZ v4 Theorem9.16 pp75–76; KP18 Theorem4.7.11 proof |
| N14 | theorem | missing | Kottwitz test-function formula for the integral Shimura model | Theorem4.7.11 |
| A01 | theorem | missing | Siegel moduli with the chosen p-lattice chain | §4.1.4–§4.2.1; citing de Jong and Görtz |
| A02 | theorem | missing | Lang torsor triviality over a finite field | Corollary4.2.13; Proposition1.4.3 Step4 |
| A03 | theorem | planned | Serre–Tate comparison with structures | Proposition4.2.2 proof |
