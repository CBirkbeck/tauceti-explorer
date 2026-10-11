# Independent review: geometric unipotent paths (NC.2)

**Verdict: accepted as a completed planning pass, with NC.2 still planned and open.**

Reviewer: Codex, session `codex-gvtYL9`, 2026-10-11. Job: `REV-AnabelianGeometryAndNonabelianChabauty--NC.2`, issue #6300. The input was written by the different session `codex-OyL4F0` in #8706, commit `d3d0e7f57`. This review changes only its named packet and suggested file, this report and its handoff.

All nodes have a justified statement or a corrected statement/proof route. Every baseline citation was confirmed by reading its declaration at the exact pin. The remaining mathematical and native-signature dependencies are explicit gaps and requests; there is no claim that the stage is closed or implemented. Acceptance follows the issue's allowance for a finished, accurate planning pass with honestly recorded open work.

## Inventory and coverage

| Item | Reviewed result |
| --- | --- |
| Nodes | 30: three definitions, ten constructions, twelve theorems, five comparisons |
| Per-node verdicts | 19 verified, 11 corrected, zero added, zero unverifiable |
| API outlines | 63 items across all thirteen definitions/constructions |
| Unit tests | 39, three for each definition/construction |
| Planets | Six, all key constructions or named theorems |
| Baseline declarations | Twelve confirmed; zero removed or replaced |
| Public source versions | Seven read; all seven PDF hashes match the packet |
| Source routes | All seventeen BDMTV routes accounted for |
| Source issues | Four inherited findings, independently confirmed |
| Closure boundary | Three explicit gaps, seven open supplier requests |
| Stage coverage | NC.2 `planned`; zero stages `closed` |

The thirty nodes cover the three realization categories, their tensor groups and path schemes, both finite towers, universal pointed objects and path modules, affine and proper connections, filtered extension/Hodge structure, rigid fibres and Frobenius, Lang invertibility and canonical continuation, nonlinear and finite crystalline comparisons, depth-one Jacobian compatibility and the finite-cover boundary. The prerequisite chains terminate in the recorded baseline, supplier nodes/layers, precise requests or gaps. No proof was split into implementation lemmas.

The six retained planets are Unipotent fundamental group, Unipotent path torsor, Universal unipotent object, Frobenius Lang theorem, Canonical Frobenius path and Crystalline path comparison. Their names and density meet section 14. The universal-object planet sits on the algebra construction that supplies the regular geometric object; the separate universal-property and existence nodes explain it.

## Corrections made

1. **Word-algebra variance.** Coleman L1 supplies shuffle coordinates. The affine universal connection uses concatenation. The packet now obtains the finite concatenation algebra by dualizing the bounded-word deconcatenation coalgebra. Quotienting shuffle multiplication by long words is not the construction being imported. The left-prepending connection, negative sign and horizontal right multiplication remain consistent.
2. **Rigid finiteness and fibre interfaces.** A restricted Coleman integration H1 datum cannot supply all realization-category hypotheses. The rigid unit imports RD.5 finiteness with its canonical Frobenius and CLS Remark 2.3.4(iii), pp. 93–94. The general de Rham/étale curve Ext/H1 interfaces remain explicit work. The suggested unit test now identifies the strong monoidal fibre of the unit with the coefficient field.
3. **Neutral tensor paths.** Expanded the proof's reduction through neutral reconstruction before using MC.6's fixed-Hopf tensor-isomorphism torsor. A tensor-point carrier alone does not establish affine representability or fpqc descent.
4. **Proper quotient proof.** Explained how a generic horizontal subspace extends to a saturated connection-stable subbundle across the local DVRs of a smooth curve. Intersecting the generic subspace with the regular bundle gives this extension; its quotient is locally free. Full faithfulness and universal pointed uniqueness then justify the maximal extendable quotient and surjectivity. Proper grades remain tensor quotients.
5. **Filtered extension citation.** The classifier is Hadian's thesis Proposition 2.2.3, p. 29, supported by Lemma 2.2.1, p. 27. The later Proposition 2.2.7 and Remark 2.2.8 concern the universal filtered construction. The proof distinguishes an extension class from an actual rigidified filtration.
6. **Tests with stronger mathematical content.** The native trivial horizontal-section test now characterizes derivative-zero polynomials as constants. The nilpotent test exhibits a polynomial solution of the connection with prescribed initial value and positive transport sign. The two-sided Frobenius test uses a function space and separate source/target equivalences. At equal endpoints, identity is selected by the group endomorphism and fixed-point uniqueness.
7. **Current upstream ownership.** Vector-bundle imports now name AlgebraicVectorBundles L0A/L0B. JacobianChallenge B, E and F supply coherent/geometric constructions, not the stated Tate, de Rham and endpoint Kummer comparisons. Added the exact SF.3 `tate-module-etale-h1` prerequisite and explained the division-cover Kummer argument. A proper de Rham Abel–Jacobi/Hodge bridge is recorded separately.
8. **Nonlinear comparison supplier scope.** CP.2 currently supplies proper degreewise comparisons and an enhanced derived square. It does not state the multiplicative comparison with two endpoint augmentations needed by the Olsson route. Corrected the request, ownership and gap: the enhancement remains open even in the proper case, as does its logarithmic open-pair extension. Ordinary H1 comparison and arbitrary extension closure of crystalline representations cannot fill it.
9. **Minor source-route locators.** Changed Lemma 4.3 to p. 911 and Theorem 5.3 to p. 920. No new source passage was copied into the repository.

No node was added or removed. All implementation statuses remain `unchecked`.

## Exact baseline check

Pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Every cited source file was compared with the supplied exact-pin tree, and every declaration statement was read. The packet's `checked` entries now record this independent confirmation.

| Declaration | Source at the pin | Confirmed scope |
| --- | --- | --- |
| `TauCeti.Tannaka.fgPointTensorIsoEquiv` | Tannaka/Equivalence.lean, line 188 | Tensor automorphisms for an already given commutative Hopf algebra, with convolution; additional neutral reconstruction is required. |
| `TauCeti.SmoothUnipotentAffineGroupSchemeCat` | AffineGroupScheme/Unipotent.lean, line 88 | Smooth finite-type geometrically unipotent affine groups; additional pro-geometric construction is required. |
| `ModuleCat.of` | ModuleCat/Basic.lean, line 76 | Native bundled coefficient modules. |
| `CategoryTheory.ShortComplex.Exact` | ShortComplex/Exact.lean, line 45 | Native exactness; mono/epi conditions are separately retained in extension signatures. |
| `UniversalEnvelopingAlgebra` | Lie/UniversalEnveloping.lean, line 65 | Tensor algebra modulo bracket relations; additional augmentation completion is required. |
| `CategoryTheory.Aut` | CategoryTheory/Endomorphism.lean, line 119 | Automorphism multiplication in function order: categorical composition is reversed. |
| `CategoryTheory.Limits.biproduct` | Limits/Shapes/Biproducts.lean, line 425 | Finite sums with the required biproduct instance. |
| `CategoryTheory.NatTrans.appLinearMap` | Linear/FunctorCategory.lean, line 75 | Linear evaluation of natural transformations. |
| `CategoryTheory.LaxMonoidalFunctor.Hom` | Monoidal/NaturalTransformation.lean, line 176 | Bundled monoidal natural transformations and their native composition. |
| `CategoryTheory.ObjectProperty.FullSubcategory` | ObjectProperty/FullSubcategory.lean, line 39 | Property-selected objects with all ambient morphisms. |
| `Subgroup.lowerCentralSeries` | GroupTheory/Nilpotent.lean, line 397 | Index zero is the original subgroup; supplies abstract indexing, not schematic quotients. |
| `Derivation` | Derivation/Basic.lean, line 45 | Coefficient-linear derivation with the actual Leibniz rule. |

The reviewed `AUDIT-08` NC.2 entry in `data/library-coverage.json` agrees with these boundaries: fixed-Hopf Tannaka is partial support, and geometric paths and their Jacobian comparison are absent. Coleman L1, p-adic Hodge R06.5, Periods PS9 and MC.6 overlap through imports. None is replanned here.

Current read-only upstream was separately checked at TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read JacobianChallenge and AlgebraicVectorBundles, their suggested signatures, and relevant ReductiveGroups L3/L5 interfaces. Screened the nine newer roadmap families named in WORKERS.md and the current library for these geometric constructions. No matching geometric unipotent-path implementation was found. Current fixed-Hopf reconstruction support remains the same restricted interface. Nothing upstream was edited or built.

## Sources and supplier statements

These are the public editions actually read. The packet records their SHA-256 hashes, edition distinctions and read ranges. The following locators describe the verification evidence, rather than summaries of the sources.

| Source | Locators checked |
| --- | --- |
| [Balakrishnan–Dogra–Müller–Tuitman–Vonk, published Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) | §§1.2–1.4, pp. 889–891; §2.1, pp. 896–898; §§4.1–4.3, pp. 909–913; §§5.1–5.2, pp. 918–921; Lemma 5.4 proof, pp. 923–924; Appendix A, pp. 934–938. |
| [Kim, published RIMS paper](https://ems.press/content/serial-article-files/41066?nt=1) | Introduction and §1, pp. 89–111, especially Lemmas 2–3, pp. 107–110; §2, pp. 114–119. |
| [Besser, arXiv v1](https://arxiv.org/pdf/math/0011269v1) | §2, PDF pp. 3–7; Theorems 3.1/3.6, Corollaries 3.2–3.3, Proposition 3.4 and the Lang argument, PDF pp. 7–12. |
| [Chiarellotto–Le Stum, published Compositio paper](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7CD9502BBD4CC7DA8B364C29B371E0EF/S0010437X99000159a.pdf/div-class-title-f-isocristaux-unipotents-div.pdf) | Propositions 2.3.2–2.3.5 and Remark 2.3.4, pp. 93–95; Propositions 2.4.1–2.4.2 and proofs, pp. 95–97. |
| [Hadian, 2010 thesis](https://d-nb.info/1007452307/34) | §2.2, printed pp. 27–32; Proposition 2.2.3, p. 29; Proposition 2.2.7 and Remark 2.2.8, pp. 31–32. |
| [Olsson, author manuscript dated 24 March 2008](https://drive.google.com/file/d/1oKDHVwLEl1xvwZ23l49R6qJrXjjCVNSg/view) | §§1.1–1.2, pp. 1–2; §§1.5–1.14, pp. 4–6; Sub-Lemma 7.19, pp. 69–70; §§8.27–8.32, pp. 83–85; Appendix D, pp. 130–132, especially Theorem D.3. |
| [Balakrishnan–Dogra II, 2019 author manuscript](https://kclpure.kcl.ac.uk/ws/portalfiles/portal/149873897/QC2.pdf) | Lemma 6.1, p. 29; filtered extension/universal results, pp. 30–31; Theorem 6.3, pp. 31–32; Lemma 6.7, p. 33. |

The Olsson check establishes the statement, the finite Galois-stable coordinate-piece argument and the cited path-comparison/descent route. It does not claim an audit of every proof in his schematic-homotopy engine. That remaining decomposition is the explicit nonlinear gap. Its unramified smooth proper pair, finite étale boundary and integral-endpoint hypotheses are retained; ramified extensions are allowed only after descent from an established pair.

All four inherited source findings were reread at the published BDMTV locators: equation (40), p. 921, has an inconsistent alphabet endpoint; Definition A.2, p. 935, omits the uniqueness needed by its subsequent universal argument; Definition A.1, p. 934, requires the nonzero qualification for the invariant-vector test; Theorem 4.2, p. 910, must use a base-fibre vector. The packet has confirmed reviewer reasons and counterexamples where appropriate. This is verification of inherited findings, not a new published-erratum search.

Supplier statements were read, with their actual scope and current status:

- Parent NC.0 supplies arithmetic/geometric paths; NC.3 supplies equivariant point torsors, with no scheme descent conclusion.
- IG.0 supplies finite étale covers and continuous rational local systems/representations, with its scheme and stable-lattice hypotheses.
- Coleman L1 supplies shuffle coordinates, local word expansion, scalar Frobenius data and Coleman realization. The geometric group/path construction remains NC.2.
- MC.3/MC.6 supply the planned neutral-category/reconstruction interfaces and the fixed-Hopf torsor specialization. Their present `needs_changes` reviews are not accepted implementations.
- RD.3/4 supply isocrystals and rigid cohomology, RD.5 supplies finiteness for Frobenius-equipped coefficients, and RD.6 supplies the relevant proper/open H1 weights.
- P-adic Hodge R06.2/R06.5 supply planned period-functor tensor exactness, filtered comparison and abelian-scheme linear comparison. Some packets still need changes or lack review; none is promoted by this review.
- SF.2 supplies cohomological machinery. SF.3's exact Tate/H1 node supplies the untwisted Tate-dual and Abel–Jacobi étale statements, but its packet currently `needs_changes`. AbelianSchemes A4 and R06.5 give the abelian de Rham target; the proper curve-to-Jacobian de Rham bridge still needs an owner.
- CP.2's accepted degreewise comparisons and derived square are narrower than the additional multiplicative two-point request. ReductiveGroups L3 supports represented quotient work; L5 does not already export the requested exponential/pronilpotent interface.

## Suggested file, tests and validation

Each definition/construction has three packet tests that detect an indexing, variance, order, sign, zero-object, uniqueness or filtration error. All test names are accounted for in the suggested file. Its actual native signatures cover categorical length and evaluation, tensor-natural point carriers, finite natural-transformation modules, associative augmentation quotients, word operators, filtered linear spaces and finite transport models.

The file explicitly omits unavailable geometric signatures by name. The nonsplit-extension/Jordan models test native nilpotent operators; they do not yet instantiate an exact sequence of geometric connections or its exact fibre. Representability, fpqc torsors, completed geometric algebras, isocrystal evaluation, geometric Hodge construction and nonlinear period comparison are also outside its native elaboration boundary. The packet's native-signature gap records this. No missing geometric condition is encoded as an opaque proposition or an assumed theorem field.

Validation on 2026-10-11:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.2.json --index "$TAUCETI_BASELINE/declarations.tsv"`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.2.lean`: successful elaboration at the supplied pinned build, with 67 warnings, all `declaration uses sorry`, and no other diagnostics. Memory was checked before compiling; no build, update, cache fetch or language server was started.
- `git diff --check`: passed.

Elaboration checks the proposed native signatures, not the admitted proofs or the omitted geometric instantiations.

## Follow-up for the orchestrator

1. Synchronize the reader document with this reviewed packet during an authorized assembly/package task. Its path was not a deliverable of #6300, so this review did not edit it. Carry over the shuffle/concatenation distinction, current layer names, Hadian locator, supplier scopes and all three gaps.
2. Assign the proper curve de Rham Abel–Jacobi/Hodge bridge and general curve Ext/H1 interfaces to the appropriate cohomological owner, with exact supplier nodes. Do not attribute them to existing JacobianChallenge B/E/F.
3. Resolve the CP.2 multiplicative two-augmentation enhancement and its logarithmic extension, then decompose the remaining Olsson proof engine at target level. Preserve ind-crystalline finite subobjects rather than invoking arbitrary extension closure.
4. Obtain the additional ReductiveGroups exponential/pronilpotent interface and instantiate the native geometric signatures when their actual supplier declarations exist. Seven requests remain open; none is silently discharged by this acceptance.

The packet's top-level review contains a verdict and a specific reason for every node. There are no further changes required to finish this independent review pass.
