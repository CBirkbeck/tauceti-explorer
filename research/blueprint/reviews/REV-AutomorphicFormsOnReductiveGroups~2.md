# Independent review: Automorphic forms on reductive groups, revision 2

**Completed review; verdict: needs_changes.** Job `REV-AutomorphicFormsOnReductiveGroups~2`, issue #6989; Codex session `codex-ULSv2d`, 8 October 2026. This session wrote neither the original plan nor revision 2. The reviewed revision is Codex session `codex-OGlhV1`’s PR #6923, following [the first independent review](REV-AutomorphicFormsOnReductiveGroups.md). The intervening narrow fix review is preserved in `reviewHistory`.

The mathematical catalogue is substantially stronger than the first version. Its native carriers now express smoothness, differentiation, tensor colimits, coefficient covariance and actual integrals. Clear source/hypothesis errors are corrected here. The remaining rejection is the explicit **PROTOCOL §13** requirement that every packet definition, API name, theorem and specified test have its faithful suggested signature. The file still omits 256 distinct names across 82 nodes. Some existing named statements also cover only part of their advertised contract. Listing those omissions honestly is valuable, but does not satisfy that requirement.

This is a finished review, not a checkpoint. It does not ask for implementation of the proofs, completion of all suppliers, or closure of the seven stages in this revision. Honest source-proof gaps are permitted at the assigned target granularity. Every `implementationStatus` remains `unchecked`.

## Counts and verification scope

| Item | Result |
|---|---|
| Nodes | 100: 26 definitions, 25 constructions, 49 theorems; none added or deleted |
| Full checked ledger | 77 verified and 23 corrected; no unverifiable statement silently accepted |
| Changed node records | 23; corrections include source locators and hypothesis/API synchronization |
| API / specified tests | 310 / 209; four compact-basis API statements and two discriminating matrix examples added |
| Planets | 30; all seven stage selections checked, at most six per stage |
| Pinned declarations | 56 statements read at Mathlib `082e2d3` / Tau Ceti `f790474`; one module corrected |
| Supplier requests | 43 inspected against supplier statements; missing exact exports remain requests/gaps |
| Source records / findings | 34 source records; 18 findings independently checked, 17 confirmed and E8 rejected |
| Proof/supplier gaps | 23, including the added automorphic product-factor extraction obligation |
| Stage coverage | Seven planned, zero closed; no count of formalized mathematics |
| Suggested file | 4168 lines inspected; `lean-check` exit 0, 499 `sorry` warnings and no other warnings/errors |

All 100 statements, hypotheses, proof sketches, direct prerequisites, acceptance clauses, APIs and tests were inspected. The 56 baseline claims were checked in the actual pinned Lean source, including their surrounding parameters. The seven reviewed library-audit stages were read; existing cochain degrees, tensor/colimit foundations, highest-weight centre and compact-group results are imported, not replanned. Source checks mean the cited statements/passages and their hypotheses; they do not mean every page or every original proof in the bibliography was read.

## Required revision

1. **Complete the §13 correspondence.** Supply faithful native signatures under every promised name in the inventory below. A generic helper can be retained under its distinct name; it cannot stand in for the missing algebraic real-points datum, integrated discrete series, adelic/classical map, global lattice family or geometric/cohomological comparison. Do not replace unavailable conditions by arbitrary `Prop` fields or choose an arbitrary equivalence. The packet’s existing `suggestedOmissions` includes each name, its intended statement and supplier owner. Reconcile the mathematical scope with the prototype without deleting legitimate stage targets just to shrink the inventory.
2. **Reconcile contracts for names already present.** In normalized induction, `normalizedInduction.compactEquiv` currently takes bijectivity as a hypothesis and returns a linear equivalence, whereas the packet promises a canonical Fréchet topological equivalence with a proved compact-picture comparison. `longExact` supplies the long exact sequence part of its node, while relative Ext, pair restriction and cup products remain missing. The relative complex is native, but some quotient operations and differential compatibility are admitted construction obligations, not proved comparisons. Constant-term rational-normalizer invariance and the conditional fibre/Fubini formula do not yet supply the full parabolic automorphic-preservation/transitivity contract. The present GL₂ two-ray model does not supply its O(2) reflection extension or integrated classification. State each remaining part faithfully and retain the recorded mathematical gaps.
3. **Keep compilation scope explicit.** This machine’s shared build supplies pinned Mathlib, not pinned Tau Ceti modules. The existing file imports Mathlib modules only. All Tau Ceti baseline statements were source-checked; elaboration here is not a check against a locally installed Tau Ceti build. The actual Tau Ceti adapters/imports remain required by the prototype contract. Do not install or build another library copy for this job.

These are interface/specification obligations. The unread original proofs of Harish-Chandra finiteness/decay, general classification, relative Ext, BHR and Clozel, and unaccepted AA/Shimura/ALS/AS suppliers, remain precise gaps rather than independent reasons to reject a target-level completed pass.

## Corrections made in place

| Region | Correction and evidence |
|---|---|
| Baseline | `leftInvariantDerivationLieEquivGroupLieAlgebra` is declared in `TauCeti/Geometry/Lie/Tangent/LieEquiv.lean`, line 103, not the importing `Functor.lean`. Its real finite-dimensional model and identity-interior hypotheses are retained. Borel–Jacquet’s article ends at p.202, not p.207. |
| AF.0 growth | C>0, N≥0 and normalized height≥1 now agree with the bounded-function/N=0 API and tests. |
| AF.1 centre | Full real K fixes the enveloping centre for a connected reductive algebraic group, including disconnected real components. The abstract-pair extension requires K-invariant χ; disconnectedness alone does not require switching to a smaller centre. |
| AF.1 induction | Casselman §10, Proposition 10.8, pp.26–27 fixes integral normalized ν with ν≡ε+1 modulo 2, including zero and negative values. |
| AF.1 classification | Jiang–Zhang’s GL_n generic-unitary formula is (B.6), not the classical-group formula (B.5). |
| AF.1a forms | Wockel Lemma 3.2, p.12, supports relative group cochains, not by itself the invariant de Rham/relative Lie identification. The existing forms/Maurer–Cartan gap now limits the attribution explicitly. |
| AF.2 module | Corrected projector attribution to d·dual-character/vol(K). The noncompact translation nonexample now uses GL₂ discrete series; noncompact tori alone do not force loss of K-finiteness. |
| AF.2 admissibility | Only irreducible subquotients are deduced admissible via cyclic finite-type pieces. The whole A(G) and all its arbitrary subquotients are not declared admissible. Borel–Jacquet §§4.5–4.6 is p.196. |
| AF.2 holomorphic forms | Zhang §1.2, pp.6–7, gives Q̄, with a number-field L coefficient model and Hilbert fractional-ideal indexing. Removed the residual universal ℚ-structure and one-variable Hilbert-series claims. |
| AF.3 / AF.5 GL₁ | The Hilbert cuspidal convention requires unitary characters. Arbitrary characters remain in the algebraic cuspidal form module and its norm-twist convention. |
| AF.4 weights | Chenevier–Taïbi’s coefficient-weight definition is §1.3, p.8; Buzzard–Gee Proposition 5.2.2 is p.29; Scholze’s holomorphic theorem is Proposition V.1.1, p.79. Ding’s lattice use is §5.1.1, p.72. |
| AF.4 purity | First remove the positive central-character part by a global norm twist before using Vogan’s unitary theorem; restore the common twist in the purity weight. |
| AF.4 rationality | The newform coefficient-field example uses π_coh=π_unit⊗\|det\|^((2−k)/2), with D_k(2−k), rather than identifying the normalized unitary finite-part field with ℚ(a_n). |
| AF.4 uniqueness | E8 remains rejected. Removed its false genus-two equal-length counterexample and its residual proposal to delete parameterized source uniqueness. The full (κ,w) and component/central conventions remain. |
| AF.5 central branch | Replaced compactness modulo A∞ by compactness modulo the full real centre in the new central-character branch and its AA request. Real-quadratic G_m is compact modulo its full centre but fails the previous split-centre compactness hypothesis. Corrected overlap scalar compatibility to ψ⁻¹. The ordinary Gross branch retains its stronger centre hypotheses. |
| AF.5 products | Restriction at the identity in the other factor need not extract an irreducible automorphic factor. Added a finite-type slice/coefficient-functional constituent-extraction gap. Flath proves abstract factorization, not this automorphic realization by itself. |
| Compact basis | Added actual 2×2 compact H/X/Y matrices, their bracket signature and two examples distinguishing the circle generator from the split diagonal. The GL₂ Casimir proof now explicitly uses this triple and its direct prerequisite. |

The source-issue section and every affected statement, API, acceptance clause, omission contract and request in the reader were synchronized. No source quotation or source-by-source digest was added. The previous narrow fix review is preserved as history; this full review supplies the current verdict.

## Previous review and assigned red-team obligations

| Obligation | Independent result |
|---|---|
| First review: growth/convolution | Finite levels, inverse-dual height, Gaussian decay at both GL₁ ends, augmentation condition, anti-involution sign and actual Haar integrability are retained. Analytic completeness/refinement obligations remain explicit. |
| First review: native real/cochain data | Genuine differentiated compatible pairs/modules, all-degree relative/absolute complexes, Banach realizations and induction are present. Countability/local finiteness and compact/Hodge stabilizers remain distinct. Missing classification signatures remain the §13 blocker. |
| First review: tensor and automorphic carrier | Genuine module colimit and finite corners replace pure-sequence/point products. Automorphic modules have actual function/subquotient carriers; some full arithmetic signatures remain absent. The residual admissibility and rational-q-expansion errors are corrected here. |
| First review: Maass prototype | Actual hyperbolic Laplacian, smoothness, L² carrier, normalized Hecke action and real-r Fourier coefficients now replace the earlier inadequate carrier. DIT values stay numerical; imaginary-r/adelization remain gaps. |
| First review: weights/coherent/rationality | Algebraic integration/isogeny constraints, dual signs, both GSp₄ lattices, central balancing, Harris component correction and distinct fields/models are retained. E8 and normalized rationality examples required further correction here. |
| First review: algebraic modular forms | Actual coefficient covariance, full stabilizers, semigroup extension and weighted cosets are present. The central-character arithmetic extension is separately requested; its torus hypothesis is corrected here. |
| RT-AREA-automorphic-1/2 | AF.1 is the single real-classification owner, with Weil group and real/complex GL_n LLC nodes. Knapp Theorems 2 and 5 are at printed pp.403 and 406. AF.1b remains an unapplied split proposal; AL.2/AL.3 imports classification and owns factor bridges, not a duplicate classification. |
| RT-AREA-automorphic-1/25 | Wigner uses the contragredient coefficient, Borel–Wallach uses the balanced central quotient, and Vogan–Zuckerman retains unitarity/coefficient/equal-rank qualifications. Harris’s full-group concentration error is not reinstated. |
| RT-AREA-automorphic-1/26 | Hyperspecial places almost everywhere require the RG2.3 reductive model, not AA.1’s bare integral Hopf model. The prerequisite/request and reader all retain this correction; spherical dimension is ≤1. |
| RT-AREA-automorphic-1/29 | AF.1a alone owns compatible modules and relative/absolute cochains; AF.1 consumes them. Countability is not local finiteness. The Ext proof gap remains genuine. |
| RT-AREA-automorphic-1/30 | AF.4’s local weight prefix imports no ALS/AS cohomological application. The rationality suffix imports ALS.1/3/5 and AS.5. Unapplied prefix splits are explicitly recorded; no unsplit external stage acyclicity is claimed. |
| RT-AREA-automorphic-1/31 | Gross rational and level-action carriers are distinct, with continuous p-adic coefficient actions, full stabilizers and semigroup extension. Base change is conditional on invertible orders or trivial stabilizers. Weighted Hecke representatives lie in the actual double coset. The new central-character branch uses effective central-quotient stabilizers and corrected ψ⁻¹ overlap. |

The twelve AF reader discrepancies listed by `REV-FIX-RT-AREA-automorphic-1~4` were checked in the rewritten revision reader: local finiteness/countability, invariant base change, nonsplitting of W_R, Knapp availability, Hodge central balancing, Borel–Wallach and Vogan–Zuckerman scope, continuous p-adic actions, class number versus type number, compact-mod-centre convention, definite-quaternion cuspidality and RG2.3 attribution. None is restored here. This review edits no supplier or consumer files.

## Source findings and access limits

Every finding was checked at its locator in the recorded version. E1–E15 now carry this review’s independent verdict; E16–E18 are added here. E14 also records the repeated product-decomposition overstatement in Getz §3.4, p.18.

| Finding | Verdict | Discriminating evidence |
|---|---|---|
| E1 | confirmed | k=2 gives Casimir zero, not 3/4; k=12 gives 30. |
| E2 | confirmed | An irreducible nonspherical module has no K-fixed vector; only ≤1 is unconditional. |
| E3 | confirmed | The compact-root sign is still a choice after fixing all holomorphic noncompact roots. |
| E4 | confirmed | The adjacent enumeration has exactly C₀,C₁,C₂,C₃. |
| E5 | confirmed | The later printed inequalities are empty; exclude the compact wall and use −λ₁≥λ₂>λ₁. |
| E6 | confirmed | The subsequent k=−λ₁−1 application identifies −λ₁≥R. |
| E7 | confirmed | Genus-two ρ fails the character-lattice parity constraint; use the rational character space. |
| E8 | rejected | Genus-two minimal Siegel representatives have lengths 0,1,2,3, so the alleged length-one pair does not exist. |
| E9 | confirmed | The next group action requires the tensor product/lattice over every other p-adic place. |
| E10 | confirmed | Goldring–Koskivirta supplies the published full-GL₂ obstruction to Harris’s other-degree vanishing claim. |
| E11 | confirmed | Scalar matrices approaching zero escape through their inverses while the naive forward norm stays bounded. |
| E12 | confirmed | A sum of independent elementary tensors need not be elementary; a sequence-of-pure-vectors carrier is not linear. |
| E13 | confirmed | An arbitrary vector-space complement is not an invariant complement; generate the submodule before cutting by the idempotent. |
| E14 | confirmed | A rank-two diagonal C₂×C₂ character multiplicity matrix cannot be a single rank-one exterior tensor product. |
| E15 | confirmed | The Siegel-Levi longest element swaps the two weights; the full longest element negates them and changes the determinant coordinate. |
| E16 | confirmed, added | Reciprocal dimension rescales a self-dual d-dimensional projector by 1/d²; an undualized circle character selects the opposite weight. |
| E17 | confirmed, added | −i(E₁₂−E₂₁), not the split diagonal, is the clockwise SO₂ weight operator. The explicit compact triple has the required brackets. |
| E18 | confirmed, added | Knapp’s direct-sum epsilon factor must multiply epsilon factors, not meromorphic L-factors. |

For E17, [Getz–Hahn’s published-book errata](https://sites.duke.edu/jgetz/files/2024/11/Errata-2.pdf), §4.7, independently requires the appropriate Cayley transforms. That is corroboration from a different edition; it is not a claim to have read the uncleared book. Author-hosted correction/publication pages and adjacent source formulas were checked for the other new findings; no separate correction for E16 or E18 was located in the sources inspected.

Flath pp.179–183, Borel–Jacquet pp.189–202 and Langlands pp.203–207 were read in the maintainer-cleared Corvallis volume in place, as authorized for this session. No private file, page image or passage was copied into scratch or the repository. Their public DOI/author-note URLs remain in the packet. Harris pp.58–63, Knapp pp.399–406, Kostant’s complex/harmonic/Laplacian and Theorem 5.14 passages, Vogan–Zuckerman Theorems 5.5–5.6 and Proposition 6.19, and the public secondary statements were checked directly. The gaps distinguish these inspected statements from unread proof interiors. The public downloaded PDF hashes match the recorded hashes; the Goldring–Koskivirta rendered publisher text was checked by its theorem/remark labels rather than assigning it a PDF hash.

## Baseline inventory

All entries below were independently checked at their pin. The `provides` contracts in the packet remain limited to their actual hypotheses. In particular, low-degree Lie cochains do not supply an all-degree complex; semisimple Lie highest-weight classification does not integrate arbitrary reductive algebraic representations; finite-dimensional compact averaging does not by itself supply every Fréchet comparison; a left-invariant derivation/tangent equivalence requires its manifold hypotheses. No baseline declaration was removed or invented.

| Pinned declaration | Defining module |
|---|---|
| `mathlib:ContMDiff` | `Mathlib/Geometry/Manifold/ContMDiff/Defs.lean` |
| `mathlib:ContRepresentation` | `Mathlib/RepresentationTheory/Continuous/Basic.lean` |
| `mathlib:CuspForm` | `Mathlib/NumberTheory/ModularForms/Basic.lean` |
| `mathlib:ExteriorAlgebra` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` |
| `mathlib:GroupLieAlgebra` | `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean` |
| `mathlib:HasCompactMulSupport` | `Mathlib/Topology/Algebra/Support.lean` |
| `mathlib:IsCompactOperator` | `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean` |
| `mathlib:LieAlgebra.rank` | `Mathlib/Algebra/Lie/Rank.lean` |
| `mathlib:LieGroup` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean` |
| `mathlib:LieModule` | `Mathlib/Algebra/Lie/Basic.lean` |
| `mathlib:LieSubalgebra` | `Mathlib/Algebra/Lie/Subalgebra.lean` |
| `mathlib:Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` |
| `mathlib:Matrix.SpecialLinearGroup` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` |
| `mathlib:ModularForm` | `Mathlib/NumberTheory/ModularForms/Basic.lean` |
| `mathlib:NumberField.IdeleClassGroup` | `Mathlib/NumberTheory/NumberField/AdeleRing.lean` |
| `mathlib:NumberField.InfinitePlace` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` |
| `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` |
| `mathlib:RestrictedProduct` | `Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean` |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` |
| `mathlib:SlashAction` | `Mathlib/NumberTheory/ModularForms/SlashActions.lean` |
| `mathlib:Subalgebra.center` | `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean` |
| `mathlib:TopRep.homogeneousCochains` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` |
| `mathlib:UniversalEnvelopingAlgebra` | `Mathlib/Algebra/Lie/UniversalEnveloping.lean` |
| `mathlib:continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` |
| `tauceti:HeckeRing.GL2.heckeSlashModularFormEnd` | `TauCeti/NumberTheory/ModularForms/HeckeSlash/ModularForm.lean` |
| `tauceti:HeckeRing.GL2.twistedHeckeSlashModularFormCharEnd` | `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/ModularForm.lean` |
| `tauceti:TauCeti.Lie.lieSubalgebraOfSubgroup` | `TauCeti/Geometry/Lie/Subgroup/LieAlgebra.lean` |
| `tauceti:TauCeti.dominantChamber` | `TauCeti/LinearAlgebra/RootSystem/Chamber.lean` |
| `tauceti:TauCeti.exists_mem_dominantChamber` | `TauCeti/LinearAlgebra/RootSystem/Chamber.lean` |
| `tauceti:TauCeti.haarAverage` | `TauCeti/RepresentationTheory/Compact/Averaging.lean` |
| `tauceti:TauCeti.peterWeylBasis` | `TauCeti/RepresentationTheory/Compact/PeterWeyl.lean` |
| `tauceti:TauCeti.vermaCentralCharacter` | `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter.lean` |
| `tauceti:lieMap` | `TauCeti/Geometry/Lie/Tangent/LieEquiv.lean` |
| `mathlib:PiTensorProduct` | `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean` |
| `mathlib:Module.DirectLimit` | `Mathlib/Algebra/Colimit/Module.lean` |
| `mathlib:LieModule.Cohomology.oneCochain` | `Mathlib/Algebra/Lie/Cochain.lean` |
| `mathlib:LieModule.Cohomology.twoCochain` | `Mathlib/Algebra/Lie/Cochain.lean` |
| `mathlib:LieModule.Cohomology.d₁₂` | `Mathlib/Algebra/Lie/Cochain.lean` |
| `mathlib:jacobson_density` | `Mathlib/RingTheory/SimpleModule/Basic.lean` |
| `mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective` | `Mathlib/RingTheory/SimpleModule/Basic.lean` |
| `mathlib:LinearMap.bijective_or_eq_zero` | `Mathlib/RingTheory/SimpleModule/Basic.lean` |
| `mathlib:Module.End.exists_eigenvalue` | `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean` |
| `mathlib:IsIdempotentElem.Corner` | `Mathlib/RingTheory/Idempotents.lean` |
| `tauceti:leftInvariantDerivationLieEquivGroupLieAlgebra` | `TauCeti/Geometry/Lie/Tangent/LieEquiv.lean` |
| `mathlib:Finsupp.linearCombination` | `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean` |
| `mathlib:LinearMap.baseChange` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` |
| `mathlib:UpperHalfPlane.volume_def` | `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean` |
| `mathlib:PiTensorProduct.instRing` | `Mathlib/RingTheory/PiTensorProduct.lean` |
| `mathlib:Function.MulExact` | `Mathlib/Algebra/Exact/Basic.lean` |
| `mathlib:MeasureTheory.Lp` | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` |
| `mathlib:Circle.coeHom` | `Mathlib/Analysis/Complex/Circle.lean` |
| `mathlib:PadicInt` | `Mathlib/NumberTheory/Padics/PadicIntegers.lean` |
| `mathlib:ContinuousCohomology.d₀kerIso` | `Mathlib/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` |
| `mathlib:DoubleCoset.Quotient` | `Mathlib/GroupTheory/DoubleCoset.lean` |
| `mathlib:DoubleCoset.mk` | `Mathlib/GroupTheory/DoubleCoset.lean` |

## Supplier and coverage audit

Every request was read against the exact source stage/packet where available. Upstream roadmap statements are intended suppliers, not completed implementations. AA/Shimura packet review limits and absent exact SR/ALS/AS/RG2 exports are retained in the supplier gap. An owner’s rough thematic overlap does not discharge a requested refinement. The table below identifies all 43 reviewed contracts; the full requested mathematical statements and consumer lists remain in the packet.

| Request | Supplier | Required contract |
|---|---|---|
| 1 | `ShimuraData:D3` | Kostant representatives ^MW of W_M\W, the longest element w_{0,M} of the Levi M_μ of the Siegel parabolic, and the coordinates of X^*(T) for GSp_{2g} used by Boxer–Pilloni §1.3, as data that AF.4 can quote. |
| 2 | `ShimuraData:D5` | ρ, the dominant and antidominant rational cones, and the explicit GSp₄ root datum with both coordinate lattices: the split algebraic torus has X^*(T)=ℤ³ with coordinates (a,b;c_T); the compact Cartan has coordinates (a,b;c_H) with c_H≡a+b modulo 2. Supply the conversion c_H=a+b+2c_T, ρ_T=(2,1;−3/2) and ρ_H=(2,1;0) for the chosen positive roots, for the chambers C₀–C₃. |
| 3 | `ArithmeticLocallySymmetricSpaces:ALS.1` | Betti cohomology H^•(X_K, L) with coefficients in local systems attached to J_f-stable lattices L of algebraic representations (AF.4/coefficient-lattices supplies the lattices), with its E-rational structure. |
| 4 | `ArithmeticLocallySymmetricSpaces:ALS.3` | Hecke action of the abstract Hecke algebra on H^•(X_K, L) and on its reductions, compatible with change of lattice. |
| 5 | `ArithmeticLocallySymmetricSpaces:ALS.5` | The comparison of Betti cohomology with relative Lie algebra cohomology of automorphic forms in characteristic zero, Hecke equivariant, as needed to realise cuspidal cohomological π in H^•(X_K, V_λ). |
| 6 | `AutomorphicSpectralTheory:AS.5` | The identification of cuspidal cohomology H^•_cusp(X_K, V_λ ⊗ ℂ) with ⊕_π m(π)H^•(𝔤, K; π_∞ ⊗ V_λ) ⊗ (π^∞)^K and its Hecke stability. |
| 7 | `AutomorphicSpectralTheory:AS.4` | The space A_{(2)}(G) of square-integrable automorphic forms (discrete spectrum) as a (𝔤, K) × G(𝔸_f)-module, for the coherent L²-cohomology H^i_{(2),σ}. |
| 8 | `AutomorphicLFunctionsAndLocalFactors:AL.3` | Genericity (existence of a global Whittaker model) of cuspidal automorphic representations of GL_n, used in Clozel's purity lemma to apply Vogan's generic unitary dual at infinity. |
| 9 | `ArithmeticLocallySymmetricSpaces:ALS.0` | A Cartan involution θ of G(F_∞) for connected reductive G over a number field, the maximal compact subgroup K_∞ = G(F_∞)^θ, G°-conjugacy of maximal compact subgroups, and the diffeomorphism K_∞ × 𝔭 → G(F_∞), so that G(F_∞)/K_∞ ≅ 𝔭. AF.1 builds (𝔤, K_∞)-modules for this K_∞ and AF.1a uses G/K ≅ 𝔭 for van Est. |
| 10 | `AutomorphicLFunctionsAndLocalFactors:AL.0` | The integral representation K_ν(y) = ½∫_ℝ e^{−y cosh t − νt}dt of the K-Bessel function with K_{−ν} = K_ν, and the fact that the solutions of the Fourier-coefficient ODE of a Laplace eigenfunction of moderate growth on y > 0 are multiples of √y K_{ir}(2π\|n\|y) (PAPER-ZHANG-21/98 route to AL.0). |
| 11 | `ReductiveGroupsPartII:RG2.0a` | Weil restriction Res_{E/F} of affine group schemes with (Res_{E/F}G)(R) = G(R ⊗_F E) functorially, used to identify Res_{E/F}G(𝔸_F) with G(𝔸_E). |
| 12 | `ReductiveGroupsPartII:RG2.4` | The Iwasawa and Cartan decompositions of SL_2 over a nonarchimedean local field (SL_2 = N·T·SL_2(O) and SL_2(O)·diag(ϖ^n, ϖ^{−n})·SL_2(O)), used to show that N(ϖ^{−c−1}O) and N^-(ϖ^cO) generate SL_2. |
| 13 | `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category` | The abelian category of smooth complex representations of G(F_v), compact-open invariants V^K and admissibility, and the Aut(ℂ)-twist of smooth representations; used for Flath's theorem and fields of rationality. |
| 14 | `SmoothRepresentationsOfLocalGroups:SR.1` | The Hecke algebra C_c^∞(G(F_v)) of locally constant compactly supported functions with convolution and the idempotents e_K = vol(K)⁻¹1_K, and H(G//K) = e_K C_c^∞ e_K, for the finite factors of adelic test functions. |
| 15 | `SmoothRepresentationsOfLocalGroups:SR.3` | Admissibility of irreducible smooth complex representations of G(F_v) (dim π^K < ∞) and Schur's lemma for them, as inputs to Flath's factorization. |
| 16 | `SmoothRepresentationsOfLocalGroups:SR.4` | Commutativity of the spherical Hecke algebra C_c^∞(G(F_v)//K_v) for K_v hyperspecial (through the Satake isomorphism), so that dim π_v^{K_v} ≤ 1 (RT-AREA-automorphic-1/26). |
| 17 | `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic` | Import: classification of continuous characters of ℝ^× and ℂ^×, ContinuousInfinityType and AlgebraicInfinityType, HeckeCharacter.IsAlgebraic (type A_0). |
| 18 | `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient` | Import: K discrete in 𝔸_K and 𝔸_K/K compact, with the Haar probability measure on 𝔸_K/K and Fourier analysis (character orthogonality) on it. |
| 19 | `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters` | Import: the carrier HeckeCharacter K = ContinuousMonoidHom(IdeleClassGroup K, ℂˣ), local components, finite conductor, shift and unitary part. |
| 20 | `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus` | Import: modular forms with character (nebentypus) for Γ_0(N), Γ_1(N) and diamond operators. |
| 21 | `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra` | Import: Hecke operators T_p on modular forms with character and their coset description. |
| 22 | `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor` | Import newform existence and conductor packaging; consume Layer 5 separately for multiplicity one and cross-level uniqueness. |
| 23 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules` | Import the algebraic group representation/comodule carrier and its tensor/dual API. Highest-weight integration/classification is not supplied by this layer; see the explicit algebraic-group classification gap. |
| 24 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation` | Import: Lie(G), the differential of homomorphisms and the Lie algebra of a closed subgroup, for comparison with the real Lie algebra of G(ℝ). |
| 25 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical` | Import: the structure of unipotent groups in characteristic zero (composition series with vector-group quotients). |
| 26 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` | Import: reductive and semisimple groups and their centres. |
| 27 | `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory` | Import: Borel subgroups, maximal tori, parabolic subgroups and Levi decompositions, root data with Weyl group; the dynamic description P(λ) of parabolics. |
| 28 | `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-0-normalized-haar-measure-and-averaging` | Import: normalised Haar measure and averaging on compact groups. |
| 29 | `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-2-complete-reducibility` | Import: complete reducibility of continuous finite-dimensional representations of compact groups. |
| 30 | `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem` | Import: the Peter–Weyl theorem (density of matrix coefficients and the L² Hilbert basis). |
| 31 | `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem` | Import: the closed-subgroup theorem (closed subgroups of finite-dimensional real Lie groups are embedded Lie subgroups with Lie algebra lieSubalgebraOfSubgroup). |
| 32 | `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms` | Import: complexification of Lie algebras of real Lie groups and real forms. |
| 33 | `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions` | Import: the Cartan decomposition K × 𝔭 → G and the Iwasawa decomposition G = KAN for real reductive groups. |
| 34 | `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition` | Import: root space decompositions of complex reductive Lie algebras with respect to a Cartan subalgebra. |
| 35 | `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles` | Import the finite-dimensional highest-weight classification under its split Killing-semisimple characteristic-zero hypotheses. For general reductive Lie algebras combine Layer 9 and impose the algebraic group character lattice separately. |
| 36 | `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations` | Import: the centre Z(U(L)), central characters χ_λ and the Harish-Chandra isomorphism with the dot action. |
| 37 | `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-9-reductive-lie-algebras-and-gl_n` | Import: reductive Lie algebras (𝔤 = 𝔷 ⊕ [𝔤,𝔤]) and their irreducible representations, for the Harish-Chandra isomorphism of reductive 𝔤_ℂ. |
| 38 | `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element` | Import: chambers, the strict fundamental domain property of the closed dominant chamber and the longest element w_0. |
| 39 | `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization` | Import fixed-character newspace multiplicity one and newform–newform cross-level strong multiplicity one, with normalization a₁=1 and the allowed finite exceptional set. |
| 40 | `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality` | Import the algebraic finite Hecke-algebra/rational coefficient-field comparison and conjugate newform construction. Discontinuous Aut(ℂ) is not applied to analytic limits. Use the cohomological finite-part normalization. |
| 41 | `ReductiveGroupsPartII:RG2.3` | For connected reductive G over a number field F, a smooth model with connected reductive fibres over O_{F,S} for some finite S, so that G(O_v) is a hyperspecial maximal compact subgroup for every finite v∉S. AF.2 uses it to place the spherical Gelfand-pair statement at almost all places; AdelicAlgebraicGroups requests the same spreading-out for AA.3/good-maximal-compact. The bare Hopf model of AA.1/integral-model-exists does not give it. |
| 42 | `AdelicAlgebraicGroups:AA.3` | For G(F_∞)/Z_G(F_∞) compact, give precise arithmetic hypotheses proving finiteness of G(F)\G(𝔸_f)/(Z_G(𝔸_f)J) and of effective stabilizers modulo rational central pairs. Include the real-quadratic G_m case; compactness modulo the F-split A_∞ alone excludes that example. |
| 43 | `AdelicAlgebraicGroups:AA.4` | Central-character descent of double-coset Hecke and level correspondences, with full effective stabilizer action and coefficient semigroup transport compatible with ψ. |

The internal node graph passes the checker. At target granularity all stage targets are represented and their prerequisite paths terminate at a checked baseline, an exact node or precise request, or an explicit gap. Thus all seven `planned` statuses are retained; zero stages are `closed`. The remaining lists name analytic, original-proof, native-type and cross-owner refinements. The AF.1/AA prefix and AF.4/ALS application split proposals remain for maintainer integration; unsplit stage-graph cycles are explicitly acknowledged. This review neither duplicates nor edits an upstream Tau Ceti roadmap. All thirty planets denote definitions, constructions or named results, with conventional names rather than source-section labels; no additional planet is needed for the compact-basis helper.

## Complete node ledger

“Verified” below checks the mathematical specification and its stated source/supplier boundary. It does not claim that a named Lean signature is present, that an admitted construction has been proved, or that a recorded original-proof gap has disappeared. Missing signatures are explicitly flagged per node. The same 100 entries appear in `review.checked`.

| Node | Verdict | Check/correction |
|---|---|---|
| `AF.0/smooth-adelic-function` | verified | The finite-level union and smooth archimedean slices are correct; the p-adic continuity example is independent of the nonsmooth real-log example. Derived right action uses the actual Lie derivative. |
| `AF.0/adelic-test-functions` | verified | Compact support is imposed on the native smooth carrier. LF/support pieces are specified, while the place-indexed restricted tensor adapter remains a supplier-dependent omission. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.0/adelic-schwartz-space` | verified | The two-sided derivative estimates and finite support are needed for Haar smoothing; they are not merely one-sided boundedness or a finite-dimensional replacement. |
| `AF.0/moderate-growth` | corrected | Changed the constants to C>0 and N≥0 for a normalized height, reconciling the N=0 API/tests. Closed image in End, or inverse-dual enlargement, remains essential. |
| `AF.0/uniform-moderate-growth-space` | verified | One exponent controls all enveloping derivatives, with derivative-dependent constants. The topology and missing analytic completeness/strictness inputs are distinguished. Section 13 correspondence remains incomplete: 2 promised names are explicitly absent for this node. |
| `AF.0/growth-translation-differentiation` | verified | Right translation uses inverse adjoint transport of derivatives; enveloping differentiation uses the correct product order. Height estimates retain the supplied submultiplicativity hypotheses. |
| `AF.0/convolution-to-uniform-growth` | verified | Differentiation of the test factor and polynomial Haar integrability produce one growth exponent. The native carrier states the actual integral and arithmetic invariance. |
| `AF.0/finite-hecke-action` | verified | The finite integral is level-compatible; coset-volume and local restricted-tensor comparisons remain explicit refinements rather than automatic consequences of its definition. |
| `AF.1a/gk-pair` | verified | The native pair includes an injective differentiated compact Lie inclusion, adjoint action and derivative equality. Its compactness hypothesis does not apply directly to a Hodge stabilizer containing A∞. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.1a/gk-module` | verified | Local finiteness, smoothness on orbit spans, differentiated restriction and adjoint covariance are retained. Countability is separate; the long-exact/category API is not inferred from countability. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1a/relative-lie-cochain-complex` | verified | Horizontal full-K-equivariant alternating maps and the bracket-first sign define the relative complex in every degree; the Mathlib low-degree bridge has its own compatibility statement. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.1a/relative-cohomology-functoriality` | verified | The long-exact construction is sound for exact compatible modules. Cup products, pair restriction and relative Ext require their separately recorded resolution/API inputs. |
| `AF.1a/differentiable-cochains` | verified | The homogeneous cochain differential and smooth/continuous comparison match Wockel’s hypotheses. Native vector/discrete group examples distinguish continuous group cohomology from Lie-only cohomology. |
| `AF.1a/invariant-forms-complex` | corrected | Corrected the Wockel locator’s advertised support: Lemma 3.2 concerns relative group cochains. The invariant de Rham comparison additionally needs forms and Maurer–Cartan, already recorded as a gap. Section 13 correspondence remains incomplete: 7 promised names are explicitly absent for this node. |
| `AF.1a/van-est-isomorphism` | verified | Contractible homogeneous quotient and coefficient/smoothing conditions are required. No comparison with arbitrary lattice-quotient de Rham cohomology or disconnected-K invariants is silently substituted. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1a/cartan-iwasawa-malcev` | verified | The almost-connected Lie-group statement is distinguished from the reductive Cartan theorem supplied by LieGroups. The unread general proof remains recorded. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1a/van-est-acceptance` | verified | Vector, compact and noncompact reductive examples target the actual comparison. The upper-half-plane invariant area class is not the cohomology of its arbitrary arithmetic quotient. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/real-points-lie-group` | verified | The finite-dimensional smooth real-point construction requires the reductive algebraic-group supplier and tangent comparison; existing LieGroup/GroupLieAlgebra is imported rather than replanned. Section 13 correspondence remains incomplete: 11 promised names are explicitly absent for this node. |
| `AF.1/real-reductive-group` | verified | Reductive, Cartan, maximal-compact and component conditions are mathematical data. The native integrated datum is still omitted, with the precise supplier boundary exposed. Section 13 correspondence remains incomplete: 9 promised names are explicitly absent for this node. |
| `AF.1/k-finite-vectors` | verified | Finite compact-orbit spans define K-finiteness. Actual circle L² vectors with infinitely many Fourier modes distinguish it from all smooth or all Hilbert vectors. Section 13 correspondence remains incomplete: 2 promised names are explicitly absent for this node. |
| `AF.1/admissible-gk-module` | verified | Finite K-type multiplicities and enveloping finite generation are distinct conditions. Irreducibility/admissibility and closure require the real reductive inputs; generic compatible modules need not be HC. Section 13 correspondence remains incomplete: 6 promised names are explicitly absent for this node. |
| `AF.1/infinitesimal-character` | corrected | Corrected full-K stability: disconnected real points of a connected algebraic group still act inner on the complex group and fix the enveloping centre. Abstract pairs need explicit invariant-character hypotheses. Section 13 correspondence remains incomplete: 8 promised names are explicitly absent for this node. |
| `AF.1/harish-chandra-admissibility` | verified | The irreducible unitary real reductive assertion keeps the proper admissibility setting. No blanket claim for arbitrary topological group representations is used. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/principal-series` | corrected | Corrected normalized SL₂ reducibility to integral ν with ν≡ε+1 modulo 2, including zero/negative parameters; added Casselman Proposition 10.8. Compact-picture/topology inputs remain exposed. Section 13 correspondence remains incomplete: 9 promised names are explicitly absent for this node. |
| `AF.1/casselman-embedding` | verified | The embedding is for HC modules and principal-series data, not an arbitrary abstract Lie module. Bernstein–Krötz supplies the theorem statement; original proof refinements remain open. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/sf-representation` | verified | Smooth Fréchet moderate-growth carriers are genuine countable Banach-product realizations with derivative conditions. Admissibility and finite generation are additional, not part of every SF carrier. Section 13 correspondence remains incomplete: 2 promised names are explicitly absent for this node. |
| `AF.1/g-continuous-norms` | verified | The norm is tied to a dense isometric Banach completion carrying the actual continuous group representation and differentiated HC action. An arbitrary norm without realization does not satisfy it. Section 13 correspondence remains incomplete: 5 promised names are explicitly absent for this node. |
| `AF.1/casselman-wallach-globalization` | verified | The SAF/HC equivalence includes functoriality and uniqueness, while the analytic classification inputs remain recorded. A chosen vector-space equivalence is not counted as globalization. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/dixmier-malliavin` | verified | Finite sums of convolution vectors are the statement; compact-support and smooth-vector hypotheses are retained. Secondary statement sources do not close the unread original proof. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/real-reductive-representation-theory` | verified | The classification interface names its tempered, discrete and standard modules with the appropriate central realization. It does not duplicate the cochain owner or the nonarchimedean owner. Section 13 correspondence remains incomplete: 4 promised names are explicitly absent for this node. |
| `AF.1/tempered-square-integrable` | verified | Coefficient integrability is on the actual central quotient with Haar measure and a unitary central character. L² and all L²+ε conditions remain distinct, with realization comparison a gap. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.1/discrete-series` | verified | Existence uses compact-Cartan absolute-rank equality modulo centre, not equality of split ranks. Parameters, component extension and analytic character proofs remain explicit inputs. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/langlands-classification` | verified | Positive Langlands parameters, standard induced modules and their unique irreducible quotient are specified. Normalized induction precedes classification; theorem-only source gaps are retained. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/weil-group-real` | verified | The native nonsplit extension has j²=−1 and conjugation on complex units. The absence of an order-two lift follows from (zj)²=−\|z\|², not merely the order of one selected j. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/archimedean-llc-gln` | verified | Knapp Theorems 1–5, pp.400–406, verify the real/complex parameter classification and factor compatibility. The new epsilon-product typo is recorded separately; the full factor bridge remains open. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1/gl2-real-discrete-series` | verified | Two SO(2) rays and an O(2) extension distinguish the real GL₂ representation from one connected-group ray. The central twist and corrected k(k−2)/4 scalar are retained. Section 13 correspondence remains incomplete: 9 promised names are explicitly absent for this node. |
| `AF.1/vogan-generic-unitary-dual` | corrected | Corrected the Jiang–Zhang quotation to (B.6), the GL_n formula. Unitarity, genericity and complementary exponents below 1/2 remain hypotheses; the original Vogan proof is unread. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/automorphic-form` | verified | The native space imposes rational left invariance, smoothness, growth, K-finiteness and central finiteness by actual equations. These are not independent Boolean tags. Section 13 correspondence remains incomplete: 4 promised names are explicitly absent for this node. |
| `AF.2/automorphic-forms-uniform-growth` | verified | Borel–Jacquet’s reconstruction-kernel referral justifies the named theorem statement; the original derivative estimate remains a proof gap, rather than an elementary finiteness consequence. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/smooth-automorphic-forms` | verified | Dropping K-finiteness gives a smooth group-action carrier with the other analytic conditions. K-finite vectors and globalizing a fixed HC subquotient require the recorded comparison theorem. Section 13 correspondence remains incomplete: 4 promised names are explicitly absent for this node. |
| `AF.2/harish-chandra-finiteness` | verified | Fixed finite level, K-type and cofinite central ideal all occur in the finite-dimensional theorem. Dropping the central ideal would incorrectly make the full automorphic union admissible. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/adelic-classical-bijection` | verified | The finite adelic class representatives and arithmetic subgroups come from AA, with compatible archimedean type/central conditions. The classical modular specialization uses its existing owner. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/automorphic-forms-module` | corrected | Corrected the projector source convention and the noncompact-group nonexample. A(G) carries compatible Lie/K and finite-adelic actions; a noncompact torus alone does not obstruct full translation. Section 13 correspondence remains incomplete: 4 promised names are explicitly absent for this node. |
| `AF.2/automorphic-representation` | corrected | Corrected admissibility to irreducible subquotients of admissible cyclic finite-type pieces, and corrected the Borel–Jacquet locator. Multiplicity is genuine Hom dimension, with finite multiplicity a separate theorem. Section 13 correspondence remains incomplete: 7 promised names are explicitly absent for this node. |
| `AF.2/restricted-tensor-product` | verified | The native module direct limit of finite PiTensorProducts is the algebraic restricted tensor, not a restricted product of points or a set of pure sequences. Idempotent stabilization gives a nonunital algebra. |
| `AF.2/spherical-dimension-one` | verified | The Gelfand-pair bound is at most one, conditional on the reductive hyperspecial model supplied by RG2.3/SR.4. A bare Hopf model does not produce those places. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/flath-factorization` | verified | Irreducibility, admissibility and spherical vectors almost everywhere are all retained. The finite-corner proof is genuine; archimedean distribution/PBW and Hilbert comparisons remain gaps. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/nongeneric-automorphic` | verified | The trivial SL₂ representation has no nondegenerate Whittaker functional. This refutes a universal genericity claim without challenging the GL_n cuspidal theorem owned by AL.3. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/holomorphic-sl2-forms` | corrected | Corrected the rationality/coefficient model to Q̄ or a supplied number field L and Hilbert fractional-ideal q-indexing. Zhang pp.6–7 does not supply a universal ℚ-model at arbitrary level. Section 13 correspondence remains incomplete: 9 promised names are explicitly absent for this node. |
| `AF.3/unipotent-quotient-compact` | verified | Compactness concerns rational unipotent adelic quotients; it is not compactness of the entire reductive quotient. AA supplies the quotient and normalized measure. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/constant-term` | verified | Integration uses N(F)\N(𝔸) with probability measure. The native rational-normalizer invariance does not yet provide every N(𝔸)-invariance or automorphic-preservation API item. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.3/constant-term-transitivity` | verified | Compatible parabolics and their quotient measures are required. The native Fubini statement assumes the multiplication pushforward; constructing that parabolic comparison remains a refinement. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/cusp-form` | verified | Vanishing of constant terms for all proper rational parabolics is the definition. Checking maximal standard parabolics needs the transitivity/conjugation theorem, not a replacement definition. Section 13 correspondence remains incomplete: 6 promised names are explicitly absent for this node. |
| `AF.3/anisotropic-cuspidal` | verified | Absence of proper rational parabolics makes the cuspidality condition vacuous. This does not imply noncentral compactness without the separate centre convention. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/cusp-form-rapid-decay` | verified | Rapid decay is stated on Siegel sets with the relevant central normalization and derivative conditions. Borel–Jacquet supplies adelic transport, not the unread original analytic estimate. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/cusp-forms-square-integrable` | verified | Rapid decay and reduction theory imply square integrability on the fixed central quotient. Without a unitary/balanced central character the unrestricted full-centre assertion would fail. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/cuspidal-spectrum-discrete` | verified | Discrete decomposition and finite multiplicities are AS inputs with fixed unitary centre. They are not deduced from the algebraic form-space definition alone. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/cuspidal-automorphic-representation` | corrected | Corrected the GL₁ acceptance example to unitary Hecke characters in the Hilbert-space convention. Nonunitary twists are separately permitted in the algebraic A₀ convention. Section 13 correspondence remains incomplete: 8 promised names are explicitly absent for this node. |
| `AF.3/sl2-generation` | verified | The closure of the generated upper/lower unipotents is the full SL₂ group in the stated topology; it is the required input to the Fourier-vanishing argument. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/sl2-fourier-vanishing` | verified | Fourier completeness and unipotent generation identify the surviving constant representation. This is distinct from asserting every automorphic representation is generic. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.3/maass-cusp-forms` | verified | Hyperbolic Laplacian, quotient L² measure, zero constant term and normalized Hecke operators are retained. DIT’s five values are numerical data; imaginary spectral parameters and adelization remain gaps. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/algebraic-weight` | corrected | Corrected Chenevier–Taïbi’s defining locator to §1.3, p.8. Integral algebraic-group characters and integration/isogeny constraints cannot be inferred from semisimple Lie highest weights alone. Section 13 correspondence remains incomplete: 10 promised names are explicitly absent for this node. |
| `AF.4/infinitesimal-character-of-weight` | verified | The μ+ρ normalization agrees with the pinned highest-weight centre statement. Algebraic integration and central character-lattice restrictions are separately requested. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/c-l-algebraic` | corrected | Corrected Buzzard–Gee Proposition 5.2.2 to p.29. Half-sum ρ and integral twisting element θ remain distinct; the GL₂ determinant normalization fixes the C/L comparison. Section 13 correspondence remains incomplete: 9 promised names are explicitly absent for this node. |
| `AF.4/cohomological-representation` | verified | The full predicate requires an irreducible algebraic coefficient, unlike the separate supplied-coefficient helper. Nonzero cohomology and dominant-weight provenance are both required. Section 13 correspondence remains incomplete: 8 promised names are explicitly absent for this node. |
| `AF.4/wigner-lemma` | verified | Nonzero relative cohomology of A⊗B equates the characters of A and B∨, with the differentiated dual minus sign. Relative Ext/PBW resolution closure remains recorded. |
| `AF.4/l0-q0-invariants` | verified | Ranks are absolute Lie ranks and the central quotient determines the dimension. GL_n/PGL_n special formulas do not use real split rank in place of absolute rank. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.4/borel-wallach-tempered-range` | verified | Temperedness, matching central/infinitesimal coefficient character and the stated equal-rank/range conventions are retained. The secondary statement is verified; the original proof remains a gap. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/vogan-zuckerman` | verified | Primary Theorems 5.5–5.6, pp.74–75, verify the unitary/coefficient-compatible A_q(λ) statement; Proposition 6.19, p.84, verifies the Hermitian bidegree formula. Full proof refinements remain open. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/gln-tempered-cohomological` | verified | The real/complex local coefficient convention and essentially tempered normalization are fixed. The corresponding relative cohomology range retains central balancing and components. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/clozel-purity` | corrected | Corrected the proof to first unitarize a cuspidal representation by a global norm twist, apply the generic unitary theorem, and restore that twist. The common purity weight depends on this normalization. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/hermitian-positive-system` | verified | The compact-Borel choice, noncompact holomorphic roots and Hodge stabilizer are distinct. The latter contains A∞ and needs the quotient-pair comparison rather than a compact Pair directly. Section 13 correspondence remains incomplete: 9 promised names are explicitly absent for this node. |
| `AF.4/coherent-relative-cohomology` | verified | Coherent coefficients use the Hodge parabolic/stabilizer and central balancing; they are not ordinary (g,K)-cohomology with an arbitrary theta-stable parabolic substituted. Section 13 correspondence remains incomplete: 7 promised names are explicitly absent for this node. |
| `AF.4/gsp4-discrete-series` | verified | Both algebraic split-torus and compact-Cartan coordinate lattices and their parity/central transport are explicit. A compact wall cannot be treated as a two-chamber noncompact limit. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.4/bhr-coherent-cohomology` | verified | Contributing degrees and contragredient weight conventions are checked against CG/Harris/Goldring. Full disconnected-group concentration is excluded by the published Harris correction. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/mirkovic-tempered-coherent` | verified | Harris Theorem 3.5, p.63, retains derived-group unitarity and the identity-component coherent setting. The Mirković proof is not supplied by the citation alone. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/bhr-large-weight` | verified | Pilloni’s corrected negative-weight threshold and excluded compact wall are necessary. The classification is in the stated regular/large-weight range, not an arbitrary small-weight assertion. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/harris-limits-gsp2g` | corrected | Removed the rejected genus-two same-length counterexample and the claimed correction of parameterized uniqueness. Full (κ,w), component and central conventions remain; degree alone does not define the module. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/holomorphic-ds-sp2n-unn` | corrected | Corrected the source label to Scholze Proposition V.1.1, p.79. The strict sufficiently-positive holomorphic discrete-series range and integral compact weights are retained. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/coefficient-lattices` | corrected | A global family of stable coefficient lattices requires almost-everywhere integral-model data. The local p-adic lattice construction has separate names and is not counted as that global family. Section 13 correspondence remains incomplete: 9 promised names are explicitly absent for this node. |
| `AF.4/rationality-field` | verified | The fixed field of the Aut(ℂ)-twist stabilizer is distinguished from a descent model. The native twist uses semilinear scalar transport of the actual representation. Section 13 correspondence remains incomplete: 2 promised names are explicitly absent for this node. |
| `AF.4/clozel-rationality` | corrected | Corrected the newform example to the cohomological D_k(2−k) finite-part normalization. Rationality field and existence of a model are different conclusions, with general-group rational-summand hypotheses. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.4/torsion-hecke-eigenclasses` | verified | The data include a nonzero eigenclass and a ring character. Transport requires nonzero image; maximal kernel over a finite residue field does not require eigenvalue surjectivity or a characteristic-zero lift. Section 13 correspondence remains incomplete: 5 promised names are explicitly absent for this node. |
| `AF.5/gl1-dictionary` | corrected | Clarified that arbitrary Hecke characters belong to the algebraic cuspidal form module, while the Hilbert convention requires unitarity. Generalized logarithmic eigenspaces and finite conductor remain explicit. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.5/gl2-classical-to-adelic` | verified | Positive determinant, clockwise rotation, nebentypus inverse action and Mathlib slash normalization are all fixed. The actual adelic/classical component map still requires its supplier types. Section 13 correspondence remains incomplete: 11 promised names are explicitly absent for this node. |
| `AF.5/gl2-dictionary` | corrected | Lowering, cusp vanishing and growth at every cusp match the classical form conditions. Casimir uses the compact weight basis; integrated GL₂/real discrete series is not the two-ray helper alone. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.5/gl2-hecke-normalisation` | verified | The unitary adelization gives R_p=p^(1−k/2)T_p, and p^(−1/2)R_p has eigenvalue a_p/p^((k−1)/2). Classical diamonds use inverse right translation. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.5/algebraic-modular-forms` | corrected | Gross rational and level-action covariance are linked only when the coefficient action extends. Discrete rational centre and split-centre compactness remain in this ordinary class-set branch. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.5/algebraic-modular-forms-structure` | verified | Evaluation uses full arithmetic stabilizers and sufficiently small levels. Base change needs invertible stabilizer orders or trivial stabilizers; divisibility alone is not an automatic failure. |
| `AF.5/transport-compatibilities` | corrected | Corrected the product proof: identity slicing does not establish automorphy of abstract factors. Added the finite-type constituent-extraction gap; Weil restriction and generalized central decomposition keep their supplied inputs. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.1a/absolute-lie-cochain-complex` | verified | The full characteristic-zero alternating complex has the bracket-first sign and compatible coefficient/Levi action. Pinned Mathlib supplies degrees 0–2, not the full all-degree complex. |
| `AF.4/kostant-parabolic-cohomology` | verified | Primary Theorems 4.4, 5.7 and 5.14 and Proposition 5.13 verify the Laplacian, dot action, left-W_M cosets, lengths and multiplicity one. Reductive extension and rational descent remain refinements. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.2/finite-corner-tensor-factorization` | verified | Primitive idempotents and genuine finite-dimensional simple corners give the algebraic tensor factorization. No arbitrary complements or admissibility-only product factorization are used. |
| `AF.2/archimedean-hecke-algebra` | verified | The supported bi-K-finite distribution carrier, corrected projectors and U(k)-balanced quotient are native. The PBW/transverse-order comparison is a real analytic input still recorded as a gap. |
| `AF.1/normalized-real-parabolic-induction` | verified | The native delta-half covariance fixes normalized induction and the dual parameter sign. The compact-picture map assumes bijectivity and gives only a linear equivalence; its promised topological equivalence is still missing. Section 13 correspondence remains incomplete: 3 promised names are explicitly absent for this node. |
| `AF.2/central-translation-finiteness` | verified | Central translations stay in the same fixed-level/type/central-ideal finite-dimensional piece. Borel–Jacquet §4.3(iv), p.195, supports joint generalized characters; differential Z-finiteness alone is not enough. Section 13 correspondence remains incomplete: 1 promised names are explicitly absent for this node. |
| `AF.5/central-character-algebraic-modular-forms` | corrected | Corrected compactness to modulo the full real centre, so real-quadratic G_m meets the hypothesis, and corrected overlap compatibility to ψ⁻¹. Central-quotient finiteness/effective stabilizers remain a precise AA request. |
| `AF.4/local-stable-lattice` | corrected | Compactness gives a finite lattice orbit, whose sum spans and is stable. Full span, finite generation, conjugation, p-power commensurability and rank-zero/scaling tests distinguish this from arbitrary invariant submodules. |
| `AF.1/gl2-algebraic-weight-model` | corrected | Specified the compact-Cartan matrices, added their native brackets and two matrix tests, and distinguished the SO(2) model from its unimplemented O(2) extension. Casimir and raising/lowering boundary coefficients are correct. |
| `AF.4/cohomological-with-coefficient` | verified | The native existential cohomology predicate has a supplied finite-dimensional compatible coefficient. It deliberately does not assert algebraic irreducibility or replace the full IsCohomological target. |

## Suggested-file name inventory

The following counts are occurrences of promised names, not proof counts or full-contract completion. Main/API duplicates and names shared across nodes mean the missing-name union is smaller than the sum of category deficits. Namespace-qualified declarations, generated structure projections and named instances were checked; test names count only comments attached to actual following `example` statements. Bare comment mentions are excluded. The independently inspected declarations/examples agree with every listed omission; no claimed omission was actually present.

| Contract category | Names represented | Promised occurrences |
|---|---:|---:|
| Main node declarations | 43 | 100 |
| API occurrences | 201 | 310 |
| Attached named examples | 104 | 209 |

**256 distinct names are omitted across 82 nodes.** Each missing name below has its full required statement, native input and owner in the packet’s `suggestedOmissions` and the synchronized reader. This durable inventory lets a revision proceed without relying on this run’s deleted scratch files.

| Node | Missing promised names |
|---|---|
| `AF.0/adelic-test-functions` | `TauCeti.Automorphic.TestFunction.restrictedTensor`, `TauCeti.Automorphic.TestFunction.ofLocal`, `testFunction_local_compat` |
| `AF.0/uniform-moderate-growth-space` | `TauCeti.Automorphic.UniformModerateGrowth.ofParabolic`, `uniformModerateGrowth_arthur_compat` |
| `AF.1a/gk-pair` | `TauCeti.RelativeLieCohomology.Pair.identityComponent`, `pair_gl2_O2`, `pair_not_without_k` |
| `AF.1a/gk-module` | `gkModule_sl2_weight` |
| `AF.1a/relative-lie-cochain-complex` | `TauCeti.RelativeLieCohomology.disconnected`, `relativeCochains_sl2_trivial`, `relativeCochains_O2_component` |
| `AF.1a/invariant-forms-complex` | `TauCeti.VanEst.invariantForms`, `TauCeti.VanEst.invariantFormsEquivRelative`, `TauCeti.VanEst.invariantForms_d`, `TauCeti.VanEst.invariantForms_componentAction`, `invariantForms_vector_group`, `invariantForms_compact`, `invariantForms_not_all_forms` |
| `AF.1a/van-est-isomorphism` | `TauCeti.VanEst.vanEstIso` |
| `AF.1a/cartan-iwasawa-malcev` | `TauCeti.VanEst.quotient_maximalCompact_euclidean` |
| `AF.1a/van-est-acceptance` | `TauCeti.VanEst.acceptance` |
| `AF.1/real-points-lie-group` | `TauCeti.RealReductive.realPoints`, `TauCeti.RealReductive.realPoints_lieAlgebra`, `TauCeti.RealReductive.realPoints_map`, `TauCeti.RealReductive.realPoints_Ad`, `TauCeti.RealReductive.realPoints_orbitMap`, `TauCeti.RealReductive.realPoints_finite_components`, `TauCeti.RealReductive.realPoints_GL_compat`, `realPoints_gl1`, `realPoints_trivial`, `realPoints_SO2_not_dense`, `realPoints_deligne_torus` |
| `AF.1/real-reductive-group` | `TauCeti.RealReductive.Datum`, `TauCeti.RealReductive.Datum.cartanDecomp`, `TauCeti.RealReductive.Datum.componentGroup`, `TauCeti.RealReductive.Datum.ofAlgebraic`, `TauCeti.RealReductive.Datum.conj`, `datum_GLn`, `datum_compact`, `datum_not_any_compact`, `datum_lie_compat` |
| `AF.1/k-finite-vectors` | `TauCeti.RealReductive.kFinite_iff_lie`, `kFinite_peterWeyl_compat` |
| `AF.1/admissible-gk-module` | `TauCeti.RealReductive.HCModule.dual`, `TauCeti.RealReductive.HCModule.tensorFinite`, `TauCeti.RealReductive.HCModule.iff_zFinite`, `hcModule_discrete_series_SL2`, `hcModule_tensor_not_fg`, `hcModule_finiteDim_compat` |
| `AF.1/infinitesimal-character` | `TauCeti.RealReductive.infCharOf`, `TauCeti.RealReductive.infCharOf_eq_iff`, `TauCeti.RealReductive.infChar_highestWeight`, `TauCeti.RealReductive.infChar_casimir`, `infChar_trivial_gl2`, `infChar_weyl_invariant`, `infChar_k_weight`, `infChar_not_linear_action` |
| `AF.1/harish-chandra-admissibility` | `TauCeti.RealReductive.admissible_of_irreducible` |
| `AF.1/principal-series` | `TauCeti.RealReductive.principalSeries`, `TauCeti.RealReductive.principalSeries_kFinite`, `TauCeti.RealReductive.principalSeries_restrictK`, `TauCeti.RealReductive.principalSeries_map`, `TauCeti.RealReductive.principalSeries_dual`, `principalSeries_GL1`, `principalSeries_SL2_ktypes`, `principalSeries_not_irreducible`, `principalSeries_hc_compat` |
| `AF.1/casselman-embedding` | `TauCeti.RealReductive.casselman_embedding` |
| `AF.1/sf-representation` | `sfRep_principalSeries`, `sfRep_L2_not_smooth` |
| `AF.1/g-continuous-norms` | `TauCeti.RealReductive.exists_gContinuousNorm`, `TauCeti.RealReductive.smoothCompletion_nuclear`, `gContinuous_finiteDim`, `gContinuous_principalSeries`, `gContinuous_not_arbitrary` |
| `AF.1/casselman-wallach-globalization` | `TauCeti.RealReductive.casselmanWallach` |
| `AF.1/dixmier-malliavin` | `TauCeti.RealReductive.dixmierMalliavin` |
| `AF.1/real-reductive-representation-theory` | `TauCeti.RealReductive.IrrAdmissible.dual`, `TauCeti.RealReductive.IrrAdmissible.twist`, `irr_compact`, `irr_GL1R` |
| `AF.1/tempered-square-integrable` | `tempered_SL2_ds`, `tempered_trivial_not`, `tempered_GL1` |
| `AF.1/discrete-series` | `TauCeti.RealReductive.discreteSeries` |
| `AF.1/langlands-classification` | `TauCeti.RealReductive.langlandsClassification` |
| `AF.1/weil-group-real` | `weilReal_character_compat` |
| `AF.1/archimedean-llc-gln` | `TauCeti.RealReductive.recGL` |
| `AF.1/gl2-real-discrete-series` | `TauCeti.RealReductive.GL2.discreteSeries`, `TauCeti.RealReductive.GL2.discreteSeries_casimir`, `TauCeti.RealReductive.GL2.discreteSeries_ktypes`, `TauCeti.RealReductive.GL2.discreteSeries_irreducible`, `TauCeti.RealReductive.GL2.classification`, `gl2DS_casimir_k2`, `gl2DS_casimir_k12`, `gl2DS_lowest`, `gl2DS_not_k2_minus_1` |
| `AF.1/vogan-generic-unitary-dual` | `TauCeti.RealReductive.voganGenericUnitary` |
| `AF.2/automorphic-form` | `automorphicForm_gl1_character`, `automorphicForm_log_not_eigen`, `automorphicForm_not_K_finite`, `automorphicForm_classical_compat` |
| `AF.2/automorphic-forms-uniform-growth` | `TauCeti.Automorphic.AutomorphicForm.mem_uniformModerateGrowth` |
| `AF.2/smooth-automorphic-forms` | `TauCeti.Automorphic.SmoothAutomorphicForm.kFinite_eq`, `TauCeti.Automorphic.SmoothAutomorphicForm.globalization`, `smoothAutomorphic_kfinite_compat`, `smoothAutomorphic_not_kfinite` |
| `AF.2/harish-chandra-finiteness` | `TauCeti.Automorphic.AutomorphicForm.finiteDimensional_fixedType` |
| `AF.2/adelic-classical-bijection` | `TauCeti.Automorphic.AutomorphicForm.classicalEquiv` |
| `AF.2/automorphic-forms-module` | `TauCeti.Automorphic.AutomorphicForm.heckeAction_compat`, `automorphicModule_trivial`, `automorphicModule_gl1`, `automorphicModule_not_G_infty` |
| `AF.2/automorphic-representation` | `TauCeti.Automorphic.AutomorphicRepresentation.multiplicity_finite`, `TauCeti.Automorphic.AutomorphicRepresentation.centralCharacter`, `TauCeti.Automorphic.AutomorphicRepresentation.smooth`, `TauCeti.Automorphic.AutomorphicRepresentation.twist`, `autRep_trivial`, `autRep_gl1`, `autRep_mult_not_one` |
| `AF.2/spherical-dimension-one` | `TauCeti.Automorphic.finrank_spherical_le_one` |
| `AF.2/flath-factorization` | `TauCeti.Automorphic.flath` |
| `AF.2/nongeneric-automorphic` | `TauCeti.Automorphic.trivial_not_generic` |
| `AF.2/holomorphic-sl2-forms` | `TauCeti.Automorphic.SL2.HolomorphicForm`, `TauCeti.Automorphic.SL2.HolomorphicForm.qExpansion`, `TauCeti.Automorphic.SL2.HolomorphicForm.rationalStructure`, `TauCeti.Automorphic.SL2.HolomorphicForm.flat`, `TauCeti.Automorphic.SL2.HolomorphicForm.coefficient`, `sl2Hol_weight12`, `sl2Hol_negative`, `sl2Hol_flat_compat`, `sl2Hol_not_exp_growth` |
| `AF.3/unipotent-quotient-compact` | `TauCeti.Automorphic.isCompact_unipotentQuotient` |
| `AF.3/constant-term` | `TauCeti.Automorphic.constantTerm_automorphic`, `constantTerm_gl2_eisenstein`, `constantTerm_cusp_compat` |
| `AF.3/constant-term-transitivity` | `TauCeti.Automorphic.constantTerm_constantTerm` |
| `AF.3/cusp-form` | `TauCeti.Automorphic.CuspForm.iff_maximal_standard`, `TauCeti.Automorphic.CuspForm.submodule`, `TauCeti.Automorphic.L2Cusp`, `TauCeti.Automorphic.CuspForm.classical_compat`, `cuspForm_delta`, `cuspForm_eisenstein_not` |
| `AF.3/anisotropic-cuspidal` | `TauCeti.Automorphic.cuspForm_eq_top_of_anisotropic` |
| `AF.3/cusp-form-rapid-decay` | `TauCeti.Automorphic.CuspForm.rapidDecay` |
| `AF.3/cusp-forms-square-integrable` | `TauCeti.Automorphic.CuspForm.memL2` |
| `AF.3/cuspidal-spectrum-discrete` | `TauCeti.Automorphic.L2Cusp.discrete` |
| `AF.3/cuspidal-automorphic-representation` | `TauCeti.Automorphic.CuspidalRepresentation`, `TauCeti.Automorphic.CuspidalRepresentation.multiplicity`, `TauCeti.Automorphic.CuspidalRepresentation.toAutomorphic`, `TauCeti.Automorphic.CuspidalRepresentation.kFinite`, `cuspidalRep_gl1`, `cuspidalRep_delta`, `cuspidalRep_trivial_not`, `cuspidalRep_subquotient_not` |
| `AF.3/sl2-generation` | `TauCeti.Automorphic.SL2.closure_unipotent_eq_top` |
| `AF.3/sl2-fourier-vanishing` | `TauCeti.Automorphic.SL2.eq_const_of_fourierCoeff_eq_zero` |
| `AF.3/maass-cusp-forms` | `TauCeti.Automorphic.MaassCuspForm.toAdelic` |
| `AF.4/algebraic-weight` | `TauCeti.Automorphic.AlgebraicWeight`, `TauCeti.Automorphic.AlgebraicWeight.IsDominant`, `TauCeti.Automorphic.AlgebraicWeight.rep`, `TauCeti.Automorphic.AlgebraicWeight.rep_dual`, `TauCeti.Automorphic.AlgebraicWeight.IsRegular`, `TauCeti.Automorphic.AlgebraicWeight.rep_highestWeight`, `algWeight_gl2_dim`, `algWeight_zero`, `algWeight_dual_gl3`, `algWeight_not_nondominant` |
| `AF.4/infinitesimal-character-of-weight` | `TauCeti.Automorphic.AlgebraicWeight.infChar_rep` |
| `AF.4/c-l-algebraic` | `TauCeti.Automorphic.IsCAlgebraic`, `TauCeti.Automorphic.IsLAlgebraic`, `TauCeti.Automorphic.isCAlgebraic_iff_isLAlgebraic_twist`, `TauCeti.Automorphic.isLAlgebraic_iff_of_rho_integral`, `TauCeti.Automorphic.IsAlgebraicCT_compat`, `algebraic_gl1`, `algebraic_trivial_gl2`, `algebraic_sl2_rho_integral`, `algebraic_maass_not` |
| `AF.4/cohomological-representation` | `TauCeti.Automorphic.IsCohomological`, `TauCeti.Automorphic.IsCohomological.coefficient`, `TauCeti.Automorphic.IsCohomological.infChar`, `TauCeti.Automorphic.IsCohomological.twist`, `cohomological_trivial`, `cohomological_D_k`, `cohomological_D1_not`, `cohomological_ip_compat` |
| `AF.4/l0-q0-invariants` | `ell0_PGL2_Q`, `ell0_imag_quad`, `ell0_not_split_rank` |
| `AF.4/borel-wallach-tempered-range` | `TauCeti.Automorphic.relativeCohomology_tempered_range` |
| `AF.4/vogan-zuckerman` | `TauCeti.Automorphic.voganZuckerman` |
| `AF.4/gln-tempered-cohomological` | `TauCeti.Automorphic.GLn.temperedCohomological` |
| `AF.4/clozel-purity` | `TauCeti.Automorphic.clozelPurity` |
| `AF.4/hermitian-positive-system` | `TauCeti.Automorphic.Hermitian.IsHCPositive`, `TauCeti.Automorphic.Hermitian.compactRoots`, `TauCeti.Automorphic.Hermitian.noncompactRoots`, `TauCeti.Automorphic.Hermitian.hodgeParabolic`, `TauCeti.Automorphic.Hermitian.gsp4_roots`, `hermitian_sl2`, `hermitian_gsp4_count`, `hermitian_choice_not_forced`, `hermitian_pilloni_compat` |
| `AF.4/coherent-relative-cohomology` | `TauCeti.Automorphic.coherentCohomology`, `TauCeti.Automorphic.coherentCohomology_eq`, `TauCeti.Automorphic.coherentCohomology_L2`, `TauCeti.Automorphic.coherentCohomology_cusp_to_L2`, `coherent_sl2_H0`, `coherent_trivial_module`, `coherent_not_gK` |
| `AF.4/gsp4-discrete-series` | `TauCeti.Automorphic.GSp4.dsRep`, `TauCeti.Automorphic.GSp4.dsRep_dual`, `TauCeti.Automorphic.GSp4.holomorphicLimit` |
| `AF.4/bhr-coherent-cohomology` | `TauCeti.Automorphic.coherentCohomology_discreteSeries` |
| `AF.4/mirkovic-tempered-coherent` | `TauCeti.Automorphic.isDiscreteSeries_of_coherentCohomology_ne_zero` |
| `AF.4/bhr-large-weight` | `TauCeti.Automorphic.GSp4.coherent_classification_largeWeight` |
| `AF.4/harris-limits-gsp2g` | `TauCeti.Automorphic.GSp2g.limitDiscreteSeries` |
| `AF.4/holomorphic-ds-sp2n-unn` | `TauCeti.Automorphic.holomorphicDiscreteSeries_minimalKType` |
| `AF.4/coefficient-lattices` | `TauCeti.Automorphic.StableLattice`, `TauCeti.Automorphic.StableLattice.exists`, `TauCeti.Automorphic.StableLattice.eq_localization`, `TauCeti.Automorphic.StableLattice.map`, `TauCeti.Automorphic.StableLattice.reduction`, `lattice_trivial`, `lattice_sym2`, `lattice_not_unique`, `lattice_chevalley_compat` |
| `AF.4/rationality-field` | `rationality_not_definition`, `rationality_modularForms_compat` |
| `AF.4/clozel-rationality` | `TauCeti.Automorphic.clozelRationality` |
| `AF.4/torsion-hecke-eigenclasses` | `TauCeti.Automorphic.TorsionEigenSystem.of_char_zero`, `TauCeti.Automorphic.TorsionEigenSystem.lattice_indep`, `torsion_trivial_coeff`, `torsion_reduction`, `torsion_not_lift` |
| `AF.5/gl1-dictionary` | `TauCeti.Automorphic.GL1.automorphicRepresentationEquiv` |
| `AF.5/gl2-classical-to-adelic` | `TauCeti.Automorphic.GL2.adelize`, `TauCeti.Automorphic.GL2.adelize_left`, `TauCeti.Automorphic.GL2.adelize_weight`, `TauCeti.Automorphic.GL2.adelize_level`, `TauCeti.Automorphic.GL2.adelize_central`, `TauCeti.Automorphic.GL2.adelize_slash_compat`, `TauCeti.Automorphic.GL2.adelize_injective`, `adelize_Delta_level`, `adelize_zero`, `adelize_weight_sign`, `adelize_slash_mathlib` |
| `AF.5/gl2-dictionary` | `TauCeti.Automorphic.GL2.modularFormEquiv` |
| `AF.5/gl2-hecke-normalisation` | `TauCeti.Automorphic.GL2.hecke_adelize` |
| `AF.5/algebraic-modular-forms` | `amf_definite_quaternion` |
| `AF.5/transport-compatibilities` | `TauCeti.Automorphic.automorphicForm_resScalarsEquiv` |
| `AF.4/kostant-parabolic-cohomology` | `TauCeti.RelativeLieCohomology.kostant` |
| `AF.1/normalized-real-parabolic-induction` | `TauCeti.RealReductive.normalizedInduction.transitivity`, `TauCeti.RealReductive.normalizedInduction.minimal_compat`, `TauCeti.RealReductive.normalizedInduction.globalization` |
| `AF.2/central-translation-finiteness` | `TauCeti.Automorphic.centralTranslationFinite` |

## Validation and orchestrator action

`python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json` reports zero errors and zero warnings. `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean` exits zero in the shared pinned-Mathlib build, with 499 `sorry` warnings and no other warnings. More than 20 GB was available before compilation; no language server or Lake build/update/cache command was used. The original unmodified prototype also passed, so the verdict is based on mathematical/interface review rather than an elaboration failure.

The next orchestrator action is a revision of this same packet/reader/suggested file to satisfy the three interface requirements above. Preserve the clear corrections and all eighteen independent source-issue verdicts. The source-proof/supplier gaps and proposed owner/prefix integration are continuation work at their existing owners. This review requests no new source purchase and changes no atlas/promoted/upstream data. Its own job is complete.
