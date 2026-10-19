# Independent review: Dwork switching motives

Job: REV-DESIGN-PotentialAutomorphyDworkMotivesPartII; issue #7106. Reviewer: Codex, session codex-bzmdcH. Date: 19 October 2026. This reviewer did not write the design under review.

## Verdict and counts

Accepted as a complete target-level planning pass under Protocol §0. All 81 targets are justified statements in the stated scope, with their proof chains ending in checked library statements, read supplier contracts or ten explicit gaps. Acceptance does not assert proof closure: every implementationStatus remains unchecked, all ten stages are planned, and none is closed. The missing hypergeometric, finite-group, rank-two and supplier arguments remain requirements rather than claimed proofs.

| Item | Reviewed result |
| --- | --- |
| Nodes | 81: 4 definitions, 15 constructions, 62 theorems |
| Node verdicts | 60 corrected, 21 verified; no added or removed nodes |
| Definition/construction API | 133 entries on 19 objects |
| Definition/construction tests | 82, at least four for every object |
| Baseline declarations | 37 confirmed at the pin; one near miss removed and six correct references added |
| Stages and planets | 10 planned stages; 16 planets; at most six per stage; names at most 60 characters |
| Source findings | 30 inherited plus E31; 28 confirmed, 3 rejected as not independently verified |
| Open inputs | 10 explicit gaps and 13 precise requests; no claim that pending upstream proposals are implemented |

## Material mathematical corrections

Invertibility is now part of a pseudo-reflection’s endomorphism predicate. The companion target imports CA.2 characteristic/minimal-polynomial and power-basis descriptions and adds only the rank-one pair consequence. The Levelt proof includes the first-dependence argument and its n=1 boundary. Existing Mathlib U/SU carriers replace duplicate notions; the general-unitary multiplier requires positive dimension. Hermitian coordinates, conjugation direction, scalar cancellation and the characteristic-two norm/trace argument are corrected. The simplicity sketch uses the abelian long-root centre, and records its generation input instead of treating the whole unipotent radical as abelian. The Artin statement is restricted to the same-rank cross-characteristic cases used by the sources. Goursat’s argument handles Sp₂(𝔽₃) through its solvable quotients.

General exponent data are separated from the selected zero-shaped data. Fermat cohomology distinguishes dimension N−2, the (h⁻¹)* action, rank-two Hesse behavior, integral projectivity, and the separately localized self-dual Betti form. Hypergeometric rank-one tests are outside the product-one determinant theorem where appropriate. The comparison map is t↦t⁻ᴺ on U=T₀−{0}. Pure-sheaf semisimplicity and Clifford theory justify irreducibility after the cyclic pullback. Hecke-character recognition has an explicit algebraicity hypothesis gap and cannot be proved circularly from the Hodge theory that uses it.

Complex monodromy now carries an explicit dictionary between BelyiMaps’ product order, the chosen peripheral order and Beukers–Heckman’s triple. Residual irreducibility uses the companion model directly. The self-dual rank-two quotient is BLGHT’s middle-coordinate quotient. Level structures are represented through finite π₁-sets, not the coherent-module Isom scheme, and pairing/determinant compatibility is required for nonempty fibres.

Good-fibre Frobenius polynomials are first M-rational and integral away from the residue characteristic. Full integrality is proved later using crystallinity and nonnegative slopes. Gauss-product descent avoids an unjustified locally prescribed cyclotomic automorphism. The auxiliary determinant ratio is checked in its fixed residue field, and l′≡1 mod n is labelled sufficient, not necessary. Character roots keep finite coefficient fields and simultaneous avoidance explicit. Period modules tensor over ℚ_l and carry the appropriate local tensor-product scalar algebra. Ordinarity needs consecutive labelled weights in addition to maximal nilpotence.

New E31 detects the fundamental-character sign in BCGNT Lemma4.4.4 by its determinant: direct Artin characters give ε̄^{+n(n−1)/2}, whereas det W is ε̄^{−n(n−1)/2}. The corrected inverse characters agree with CEGS §1.4 and the cohomological Lubin–Tate normalization. Berger’s §1.3 p.271 defines D_cris of the dual; the corrected application uses k=m+1, dualizes the reduction and retains semisimplification and the small-weight range. The rank-two torsion level uses the dual CM seed. Arithmetic monodromy is specialized onto its actual quotient containing SU, with determinant and multiplier plus perfectness proving the cyclotomic-kernel equality; full GU is not asserted.

## Source verification and its limits

Qian arXiv:2104.09761v1, the companion arXiv:2103.00106v1, the BLGHT author copy, BCGNT arXiv v3, Katz’s 2009 author copy, Drinfeld–Kedlaya v11, BLGGT v4, A’Campo v1, the updated Deligne Chapter I §7, Beukers–Heckman pp.330–332, Katz–Messing pp.76–77 and Berger pp.271,277–278 were read at the target locators. ACC Lemmas7.1.7–7.1.8 and Corollary7.2.4 were read in the maintainer-cleared published-pagination author copy; the repository records its public bibliographic URL, not the cleared file or a passage. CEGS §1.4 pp.5–6 independently fixes the inertia normalization. The packet records the actual source versions, public URLs and available PDF hashes.

The full published Qian PDF could not be retrieved. E2, E4 and E17 therefore receive rejected verdicts specifically for lack of independent verification of their published wording. Their mathematical safeguards are retained and justified without asserting that the allegations are false. The published final paragraph supporting E3 was available as indexed text and its counterpart was read in v1. Other Qian findings are scoped to v1. BCGNT findings are scoped to v3; inherited claims to have checked journal pages or earlier versions are removed.

Katz90 was not cleared or read. ZS76 and Artin55 full originals were unavailable; their specialized applications were checked in the read sources, with original-proof and exception-list work recorded as a gap. Lewis’s original is unnecessary for the independent finite-field norm/trace proof. Kisin’s stronger theorem is not claimed: the finite-level consequence uses a finite étale Isom cover and an explicitly missing local inverse/Hensel input. BH, KM, Berger and Deligne are no longer labelled unread. Source excerpts and inherited quoted passages were removed; every diagnostic is paraphrased.

## Supplier and current-library audit

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed library audit and every baseline statement were read, rather than relying on declaration-name matches. The 31 surviving original citations are confirmed. FiniteField.exists_root_sum_quadratic was removed: its odd-characteristic quadratic-polynomial existence statement is not norm/trace surjectivity in the required range. It is replaced by FiniteField.unitsMap_norm_surjective and Algebra.trace_surjective. Matrix.unitaryGroup, Matrix.specialUnitaryGroup, Matrix.mem_specialUnitaryGroup_iff and Matrix.mem_unitaryGroup_iff' are the other four added imports. The report below records exact scopes, including the max(n,1) centre convention and the small rank-two exceptions.

Current read-only upstream main was 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti was a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The RepresentationTheory overview, its ClassicalGroups README/Suggested contracts, and the nine post-snapshot roadmaps were audited. BelyiMaps’ §5.6 product relation and ModularCurves’ §5C were read. No current target is replanned. The latter supplies geometric irreducibility conditionally; CM base, connectedness, the universal family’s good reduction, mod-p geometric SL₂ and local component neighborhoods remain explicit requirements.

Exact supplier statements were read for R23.1, R24.5, L7, R02.4, FF.1, CA.2, EDC.2 and the period/log/Hodge suppliers. Existing R24.5 converse recognition is reused, with a request only for its unchecked algebraicity hypotheses. Existing L7 local-model and component nodes are imported directly. SF.4’s alteration target does not prove the needed equivariant toroidal subdivision. RD.7 must expose its correspondence/projector form of Katz–Messing; DK17’s curve companions are not an arbitrary-dimensional theorem.

EtaleCohomologyFoundations PR #938 at f6257a790885024c5a61e106bc128bd81e994d52 and CohomologicalPointCounting PR #196 at 4bd72379658126cbe9be935656396f0c9dac4de0 were open at review. Their read interfaces supply the proposed finite étale Galois category, arithmetic sequence, base change, adic realization, compact convolution operations, comparison and trace. They are neither merged-main content nor pinned declarations. The atlas snapshot has no IDs for these proposals; following the reviewed EDC import pattern, SF.2 is only a graph adapter. Each actual owner is recorded separately in upstreamContracts/upstreamImports and the reader. No schema workaround is described as a mathematical proof.

## Per-node verdicts

Source locators throughout were aligned to the editions actually read. The corrected verdicts below identify substantive statement, proof, API, test or ownership changes; the other nodes were independently checked without substantive mathematical change.

| Node | Verdict | Change or check |
| --- | --- | --- |
| DM.0/pseudo-reflection | corrected | Require invertibility in the endomorphism API and explain the determinant-one diagonal step in elementary generation. |
| DM.0/companion-normal-form | corrected | Import companion matrices and their characteristic/minimal polynomials from CA.2; retain the pairwise rank-one consequence as the local target. |
| DM.0/levelt-rigidity | corrected | Give the exact rank-one identity and use the first dependence to justify the common invariant subspace. |
| DM.0/hypergeometric-group-irreducible | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.0/finite-unitary-group | corrected | Use existing U/SU carriers, require positive dimension for the multiplier, and correct A=P†P and the conjugation direction. |
| DM.0/hermitian-form | corrected | Fix scalar cancellation, Mathlib convention, Gram indexing, and uniqueness hypotheses for similitudes. |
| DM.0/hermitian-forms-unique | corrected | Replace the odd-characteristic quadratic-form near miss by actual norm and trace surjectivity; correct the F₉ norm example. |
| DM.0/conjugate-self-dual-is-unitary | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.0/special-linear-unitary-simple | corrected | Correct the nonabelian unipotent-radical argument and make the finite unitary generation input explicit. |
| DM.0/artin-non-isomorphism | corrected | State the unitary–unitary case actually used by the consequence, and restrict the Artin claim to the source applications instead of all Lie types. |
| DM.0/zalesskii-serezhkin-classification | corrected | Remove the unsupported assertion that an element of order N eliminates every small-characteristic exception. |
| DM.0/product-of-simple-images | corrected | Use the asymmetric Goursat hypothesis actually needed by the two-prime application. |
| DM.1/auxiliary-modulus | corrected | Replace the unstated primitive-divisor input by the elementary cyclotomic argument in Qian Lemma 2.3, including l=2. |
| DM.1/dwork-pencil | corrected | Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.1/dwork-symmetry-groups | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.1/dwork-exponent-datum | corrected | Separate rank data from the zero-shaped representatives used in comparison and Hodge theorems; add positive bounds and a counterexample. |
| DM.1/asymmetric-stabiliser-trivial | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.1/three-punctured-cover | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.2/fermat-hypersurface-cohomology | corrected | Limit the Hodge assertion to characteristic zero, distinguish integral projectivity from freeness, and fix the character action convention. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.2/integral-cohomology-torsion-free | corrected | Supply the lifting and base-change argument for the positive-characteristic conclusion. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.2/dwork-eigensheaves | corrected | Correct the Hesse test and the integral Betti coefficient claim. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.2/eigensheaf-duality | corrected | Distinguish H-eigenline duality from the trivial H₀-action in the cubic example. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.2/self-dual-real-forms | corrected | Clarify projectivity over the global real coefficient ring and the excluded cubic boundary. |
| DM.2/fermat-fibre-splitting | corrected | Correct the deck eigenvalue for an arbitrary coordinate and avoid global rank-one freeness claims. |
| DM.2/eigensheaf-rank | corrected | State the correct projective Betti conclusion and free local coefficient conclusions. |
| DM.3/katz-hypergeometric-sheaf | corrected | Make the rank-one constructor tests admissible and correct the j_!/j_* boundary example. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.3/hypergeometric-sheaf-properties | corrected | Separate the rank-one Kummer test from the product-one determinant theorem; the old n=1 determinant example had inconsistent hypotheses. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.3/hypergeometric-local-monodromy | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.3/katz-dwork-comparison | corrected | Separate the punctured parameter space U from the quotient T′₀ and make the shape condition explicit. |
| DM.3/twisting-hecke-character | corrected | Identify the missing converse Hecke-character recognition theorem instead of treating the forward construction as its proof. Reuse the converse recognition target already owned by R24.5, and isolate the unchecked algebraicity input to avoid a circular use of DM.7. |
| DM.3/twisted-dwork-local-system | corrected | Justify irreducibility after finite pullback and repair the compatible-system layer reference. State the comparison on U=T₀−{0} with the map t↦t⁻ᴺ, rather than treating the quotient line T′₀ as an open subset of T₀. |
| DM.4/dwork-monodromy-representations | corrected | Give the explicit conjugation converting the existing BelyiMaps peripheral-product convention. |
| DM.4/monodromy-at-zero | corrected | Restrict the simplified deck eigenvalue and determinant-one formula to the selected zero-coordinate quotients. |
| DM.4/picard-lefschetz-at-one | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.4/unipotent-monodromy-at-infinity | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.4/companion-model-of-monodromy | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.4/maximal-unipotent-monodromy-at-infinity | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.4/residual-monodromy-absolutely-irreducible | corrected | Use Levelt over the residue field to justify the integral reduction comparison directly. |
| DM.5/residual-monodromy-sl | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.5/residual-monodromy-sp | corrected | Distinguish the valid self-dual quotient monodromy from the incorrect rank-two last-coordinate quotient. |
| DM.5/hermitian-poincare-pairing | corrected | Separate preservation of the form from determinant one and avoid a circular determinant-descent argument. |
| DM.5/residual-monodromy-su | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.5/determinant-descends | corrected | Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.5/level-structure-torsor | corrected | Remove the coherent-sheaf Isom citation that does not construct a finite-coefficient lisse Isom torsor. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.5/two-prime-product-monodromy | corrected | Handle the permitted solvable Sp₂(𝔽₃) factor separately in the Goursat proof. |
| DM.5/level-structure-torsor-irreducible | corrected | Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.6/fermat-frobenius-gauss-sums | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.6/dwork-determinant-gauss-formula | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.6/gauss-product-descent | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.6/determinant-nth-power | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.6/determinant-matching-at-l | corrected | Distinguish the proved finite-field power condition from the stronger finite-coefficient character-root theorem still requested from its owner. |
| DM.6/determinant-matching-at-auxiliary-prime | corrected | Treat the auxiliary congruence as sufficient and expose the same fixed-coefficient supplier requirement. |
| DM.6/frobenius-polynomials-independent | corrected | Remove the hidden DM.6–DM.7 cycle and use equivariant traces, with the precise requested extension of Katz–Messing. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.7/twisted-de-rham-eigenspaces | corrected | Replace the undefined tensor over K by a labelled component of D_dR over K⊗E and pin the supplier sign dictionary. |
| DM.7/hodge-grades-of-fermat-eigenlines | corrected | State the multiplicity shape needed for the consecutive-grade calculation, rather than extending it to every rank-n datum. |
| DM.7/consecutive-hodge-numbers | corrected | State the multiplicity shape needed for the consecutive-grade calculation, rather than extending it to every rank-n datum. |
| DM.7/dwork-hodge-tate-weights | corrected | Make the Hodge–Tate sign bridge explicit at the numerical conclusion. |
| DM.7/crystalline-at-good-reduction | corrected | Supply the missing integrality argument after crystalline comparison, with the correct slope normalization and no dependency cycle. |
| DM.7/ordinary-near-fermat-point | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.7/fermat-fibre-inertia-at-minus-one | corrected | Separate the n>2 W system from the rank-two self-dual boundary and retain the inertia-only character domain. Invert the printed Artin fundamental characters: their product is cyclotomic, while det W is its negative n(n−1)/2 power; record the independent source issue E31. |
| DM.7/steinberg-monodromy-away-from-coefficient-prime | corrected | Add the missing good-base hypothesis on the residue characteristic of the place, distinct from the coefficient prime. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.7/dwork-compatible-system | corrected | Finish Frobenius integrality here and distinguish the untwisted purity weight N−2 from W’s weight n−1. |
| DM.7/drinfeld-kedlaya-slope-bound | corrected | Correct the proof’s companion scope and avoid implying every curve meets the generic-slope locus. |
| DM.7/generic-crystalline-ordinarity | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.8/dwork-semistable-blowup | corrected | Replace the false N=3 singularity test by the actual singular locus and the already semistable cubic boundary. |
| DM.8/equivariant-semistable-model | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.8/log-special-fibre-witt-lift | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.8/hyodo-kato-description-near-infinity | corrected | Use D_st over K₀⊗E, distinguish φ from φ^f on labels, and place the filtration after extension to F′. |
| DM.8/ordinary-near-infinity | corrected | Import the existing maximal-monodromy criterion instead of replanning it, and justify descent by the canonical N-kernel flag. |
| DM.8/conditional-regular-ordinarity | corrected | Require positive rank and cite the existing consecutive-weight criterion explicitly. |
| DM.9/switching-determinant-data | corrected | Remove the impossible disjointness of L from E=LM, correct the root-congruence test, and expose the finite-coefficient supplier gap. |
| DM.9/weil-restricted-local-conditions | corrected | Replace the unit-valued example incorrectly described as near the Fermat point. |
| DM.9/qian-switching-theorem | verified | Statement, source match, direct supplier contract and proof outline verified; API/tests checked where applicable. |
| DM.9/self-dual-switching | corrected | Correct the parameter base and meaningless disjointness condition; add distinct-prime, large-prime and good-place guards needed by the cited nodes. |
| DM.9/kisin-local-constancy | corrected | Specify an integral congruence exponent and give the finite-étale/Hensel proof of exactly the finite-level constancy used here. Identify exact pending upstream contracts; retain SF.2 only as the atlas graph routing point, not as the provider of their statements. |
| DM.9/berger-reduction-small-weight | corrected | Check Berger’s actual range and dual convention and specify semisimplified reduction and the inertia-character extensions. Make the dualization in Berger explicit and correct the supersingular H¹ sign test; retain semisimplified reduction and the exact small-weight range. |
| DM.9/bcgnt-local-dwork-points | corrected | State what the sufficiently large preliminary local extensions must contain and exclude use of the n>2 W constructor at m=2. Import the existing L7 component and local-model targets by node ID rather than requesting their replanning. |
| DM.9/cm-induced-seed | corrected | Qualify the rank-one boundary test and specify the local and disjointness hypotheses ensuring residual induction stays irreducible. |
| DM.9/bcgnt-switching-primes | corrected | State the base field for the avoidance intersection in the switching-prime construction. |
| DM.9/bcgnt-auxiliary-dwork-systems | corrected | Prove the cyclotomic-kernel image using determinant, multiplier and perfectness, rather than the false multiplier-kernel inference. |
| DM.9/rank-two-auxiliary-system | corrected | Fix the avoidance intersection and remove the unsupported inference from a supersingular CM point to the required local component. Use the dual seed for torsion level structure and preserve the current ModularCurves connectedness condition as a supplier gap. |


## Baseline statement verdicts

| Declaration | Verdict and module | Scope actually supplied |
| --- | --- | --- |
| mathlib:AlgebraicGeometry.Smooth | confirmed; Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean | Smooth morphisms of schemes |
| mathlib:FiniteField.frobenius_pow | confirmed; Mathlib/FieldTheory/Finite/Basic.lean | For a field of characteristic p, with p prime and cardinality p^r, the r-th power of its Frobenius ring homomorphism is the identity. |
| mathlib:FundamentalGroup | confirmed; Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean | The endomorphism group of the chosen point in the fundamental groupoid of a topological space; multiplication is p*q=q.trans p, which fixes the peripheral-order dictionary. |
| mathlib:IsPrimitiveRoot | confirmed; Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean | Primitive roots of unity |
| mathlib:LinearMap.IsSymm | confirmed; Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean | For a sesquilinear form semilinear first and linear second with scalar homomorphism I, symmetry is I(B(x,y))=B(y,x). Use the flipped linear-first form here. |
| mathlib:LinearMap.SeparatingLeft | confirmed; Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean | For a sesquilinear form, the only vector annihilating every vector in the right slot is zero; this is the nondegeneracy condition used for forms here. |
| mathlib:Matrix.GeneralLinearGroup | confirmed; Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean | GL_n(R) as the units of the matrix ring |
| mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec | confirmed; Mathlib/LinearAlgebra/Matrix/Transvection.lean | Every finite square matrix over a field, including singular matrices, factors as a list of elementary transvections times a diagonal matrix times another list. For an SL matrix its diagonal is invertible with determinant one; the elementary two-by-two identity in DM.0 supplies the remaining step. |
| mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple | confirmed; Mathlib/LinearAlgebra/Projectivization/PSL/PSL2.lean | For a field F with 4≤Nat.card F, PSL₂(F) is a simple group; this does not cover F₃. |
| mathlib:Matrix.SL2.commutator_eq_top | confirmed; Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | Over a field F, if a≠0 and a²≠1 for some a, the commutator subgroup of SL₂(F) is all of SL₂(F). Such an a exists when #F>3; this does not apply to SL₂(𝔽₃). |
| mathlib:Matrix.SpecialLinearGroup | confirmed; Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | SL_n(R), matrices of determinant one |
| mathlib:Matrix.SpecialLinearGroup.center_equiv_rootsOfUnity | confirmed; Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | For a commutative coefficient ring and a finite matrix index, the centre of SL is equivalent to the roots of unity of order max(card(index),1). In the positive-dimensional uses here this is the scalar n-th roots of unity. |
| mathlib:Matrix.TransvectionStruct | confirmed; Mathlib/LinearAlgebra/Matrix/Transvection.lean | Bundled data of an elementary transvection |
| mathlib:Matrix.charpoly | confirmed; Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean | Characteristic polynomial of a square matrix |
| mathlib:Matrix.conjTranspose | confirmed; Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean | Conjugate transpose with respect to a star structure |
| mathlib:Matrix.rank | confirmed; Mathlib/LinearAlgebra/Matrix/Rank.lean | Rank of a matrix over a commutative ring |
| mathlib:Matrix.transvection | confirmed; Mathlib/LinearAlgebra/Matrix/Transvection.lean | Elementary transvection matrices 1 + c·E_{ij} |
| mathlib:MonoidAlgebra | confirmed; Mathlib/Algebra/MonoidAlgebra/Defs.lean | Group (monoid) algebras R[G] |
| mathlib:MulAction.IwasawaStructure.isSimpleGroup | confirmed; Mathlib/GroupTheory/GroupAction/Iwasawa.lean | A nontrivial perfect group with a faithful quasi-preprimitive action and an IwasawaStructure is simple. The required abelian normal stabilizer subgroups and generation are hypotheses, not consequences of this criterion. |
| mathlib:MvPolynomial | confirmed; Mathlib/Algebra/MvPolynomial/Basic.lean | Multivariate polynomials |
| mathlib:Nat.exists_prime_and_dvd | confirmed; Mathlib/Data/Nat/Prime/Defs.lean | Every integer other than 1 has a prime divisor |
| mathlib:Polynomial.cyclotomic | confirmed; Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean | Cyclotomic polynomials |
| mathlib:Subgroup.goursat | confirmed; Mathlib/GroupTheory/Goursat.lean | Goursat's lemma: subgroups of a product are graphs of isomorphisms between subquotients |
| mathlib:ZMod | confirmed; Mathlib/Data/ZMod/Defs.lean | The ring ℤ/nℤ |
| mathlib:ZMod.pow_totient | confirmed; Mathlib/FieldTheory/Finite/Basic.lean | Euler's theorem in (ℤ/nℤ)^× |
| mathlib:gaussSum | confirmed; Mathlib/NumberTheory/GaussSum.lean | Gauss sums of a multiplicative and an additive character of a finite ring |
| mathlib:gaussSum_mul_gaussSum_eq_card | confirmed; Mathlib/NumberTheory/GaussSum.lean | Over a finite field, for nontrivial multiplicative χ and primitive additive ψ, gaussSum(χ,ψ) gaussSum(χ⁻¹,ψ⁻¹)=#F. DM.6 must also translate Qian’s leading minus and use the odd-order value χ(−1)=1. |
| mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units | confirmed; Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean | For a finite field extension L/K and a multiplicative 1-cocycle on Aut_K(L) valued in L×, there is β∈L× with f(g)=g(β)/β. This is the matrix-free Hilbert90 scalar descent used in DM.0. |
| mathlib:jacobiSum | confirmed; Mathlib/NumberTheory/JacobiSum/Basic.lean | Jacobi sums of two multiplicative characters |
| mathlib:minpoly | confirmed; Mathlib/FieldTheory/Minpoly/Basic.lean | Minimal polynomial of an element of an algebra |
| mathlib:orderOf | confirmed; Mathlib/GroupTheory/OrderOfElement.lean | Order of an element of a monoid |
| mathlib:FiniteField.unitsMap_norm_surjective | confirmed; Mathlib/FieldTheory/Finite/GaloisField.lean | For fields K⊆K′ with K′ finite, the norm on units K′×→K× is surjective, with no odd-characteristic restriction. |
| mathlib:Algebra.trace_surjective | confirmed; Mathlib/RingTheory/Trace/Basic.lean | The trace of a finite-dimensional separable field extension is surjective; finite fields are perfect. |
| mathlib:Matrix.unitaryGroup | confirmed; Mathlib/LinearAlgebra/UnitaryGroup.lean | Existing unitary matrix carrier over a star ring, with its group structure; use the quadratic finite-field automorphism for star. |
| mathlib:Matrix.specialUnitaryGroup | confirmed; Mathlib/LinearAlgebra/UnitaryGroup.lean | Existing determinant-one unitary matrix carrier; no new U or SU definition is needed. |
| mathlib:Matrix.mem_specialUnitaryGroup_iff | confirmed; Mathlib/LinearAlgebra/UnitaryGroup.lean | Membership is exactly membership in unitaryGroup together with determinant one. |
| mathlib:Matrix.mem_unitaryGroup_iff' | confirmed; Mathlib/LinearAlgebra/UnitaryGroup.lean | For square matrices over a commutative star ring, M∈Matrix.unitaryGroup iff star M * M=1; the matrix star is conjugate transpose. The companion criterion mem_unitaryGroup_iff uses M * star M=1. |


## Source-finding verdicts

| Finding | Verdict | Locator and check |
| --- | --- | --- |
| E1 | confirmed | Definition4.3.1, arXiv v3 p.45. In 𝔽₉ choose a norm-one ζ≠1. The matrix diag(ζ,1) has multiplier one and determinant ζ, so it is in U and outside SU. |
| E2 | rejected | Published Lemma3.12, pp.1267–1268 (unread in this review). The safeguard is necessary: t=0 has smooth proper reduction when the residue characteristic is prime to N, so an ℓ-adic representation with ℓ different from that characteristic is unramified and has monodromy operator zero. This does not independently establish what the unread published lemma says. |
| E3 | confirmed | §4, final disjointness paragraph, arXiv v1 p. 26; published final paragraph after Remark 4.4, p. 1274 (indexed text); ACC Lemma 7.1.7 p.1091. Both F′ and the normal closure contain the nontrivial CM field F, so disjointness over ℚ is impossible. The preceding intersection calculation is for K, which is exactly the extension permitted by ACC. |
| E4 | rejected | Published Lemma2.3 proof, pp.1249–1250 (unread in this review). The arXiv v1 proof has the plus-sign conclusion and does not verify the alleged publication-only misprint. Retain the correct mathematical condition without asserting that this review read the published line. |
| E5 | confirmed | §4, arXiv v1 pp. 21–22 (published p.1270 cross-reference). The order l^r−1 is prime to l. For n=l=3 the stated n-divisibility is impossible, whereas cubing is bijective on the field units and m=1 is the correct roots-of-unity condition. |
| E6 | confirmed | §4, arXiv v1 p.22; Lemma 3.8 and formulas (3.1)–(3.3), pp.16–18 (published Lemma3.9). An element of 𝔽_l′× can be a square in 𝔽_l′² without being a square in 𝔽_l′. The ratio must be checked in the fixed coefficient field; separate estimates on its two determinants do not suffice. |
| E7 | confirmed | Lemma 2.1, arXiv v1 pp.5–8; Proposition4.1 and its application pp.21–22. This is a missing hypothesis check, not a necessary congruence: for n=3 and l′≡2 mod3, cubing is already bijective on 𝔽_l′×. The roadmap uses the sufficient congruence consistently. |
| E8 | confirmed | Lemma 3.10, arXiv v1 pp.20–21 (published Lemma3.11). The coefficient-linear representation has no F_v-scalar action merely from being a representation of G_{F_v}. Replacing F_v by its unramified subfield in a tensor of V is still ill-typed. B_cris is not generally an F_v-algebra. |
| E9 | confirmed | §4, arXiv v1 pp.21–22. The Weil pairing gives det H¹=ε̄⁻¹. At geometric Frobenius its value is q; the dual Tate module has value q⁻¹. This also fixes E6’s determinant ratio. |
| E10 | confirmed | Qian companion arXiv:2103.00106v1, Lemma4.2, p.20; BLGHT Lemma2.2(2), pp.16–18. A weakly admissible rank-two counterexample over ℚ_p has φe₁=pe₁, φe₂=p²e₂, Ne₂=e₁, Ne₁=0 and filtration jumps 0,3 with Fil¹=Fil²=Fil³=⟨e₁+e₂⟩. Its total Hodge and Newton numbers are 3; the only nonzero proper (φ,N)-stable line has Hodge number 0 and Newton number 1. It is weakly admissible with maximal N and nonconsecutive weights, and its monodromy flag is not ordinary. |
| E11 | confirmed | Proposition3.2, arXiv v1 p.13 (published p.1257). Smooth proper base change alone does not exclude torsion in integral cohomology. A direct summand of a free module is projective; it is free locally, but global freeness over a Dedekind ring must not be inferred. |
| E12 | confirmed | After Proposition3.2, arXiv v1 p.13; BLGHT Lemma4.1 pp.25–26. BLGHT’s projector and descent construction invert 2N. The localization changes the Betti coefficient ring, while its specified prime-to-2N completions and quotients are unaffected. |
| E13 | confirmed | Lemma3.3(2), arXiv v1 pp.13–14; Katz09 Theorem5.3 pp.95–97. A scalar nontrivial N-th root of unity has unipotent N-th power but is not unipotent. A semistable model after the covering does not remove this ambiguity on the quotient line. |
| E14 | confirmed | Lemma3.3(3), arXiv v1 pp.13–14. An individual non-self-dual eigenspace is paired with its conjugate rather than with itself. For g=1+v⊗f, det g=1+f(v); determinant one gives f(v)=0 and (g−1)²=0. The rank-one equality requires the additional irreducibility argument. |
| E15 | confirmed | Lemma3.6, arXiv v1 pp.15–16 (published Lemma3.7); BLGHT Lemma4.6 pp.31–32. BLGHT’s quotient has zero exponent on its distinguished middle coordinate. Qian’s last-coordinate quotient does not satisfy that property for the rank-two self-dual data. The two sheaves cannot be identified by their notation alone. |
| E16 | confirmed | Lemma3.8, arXiv v1 p.18, formula(3.3) (published Lemma3.9). The two cyclotomic local fields need not be disjoint, so that prescribed local automorphism need not exist. The inverse-pair Gauss identity proves the real-subfield claim without that choice. |
| E17 | rejected | Published Remark3.13, p.1268 (unread in this review); compare companion Theorem1.4 and §2, pp.3–13. The companion constructs an extension using a toroidal subdivision with uncontrolled e. This justifies the roadmap’s weaker formulation but does not verify the exact wording or scope of the unread published remark. |
| E18 | confirmed | Proposition4.1, arXiv v1 pp.21–22; ACC Corollary7.2.4 p.1100. ACC Corollary 7.2.4, p.1100, requires this in its first auxiliary-prime paragraph. A field containing F can ramify where F does not; this finite extra exclusion preserves the density argument. |
| E19 | confirmed | Lemma2.1 and §4, arXiv v1 pp.5–8,22–23. Independent disjointness of L₁ and L₂ from F₀ does not imply disjointness of their compositum. The second enlarged avoidance field gives (L₁L₂)∩F₀=ℚ and supplies the missing simultaneous construction. |
| E20 | confirmed | Qian companion arXiv:2103.00106v1, Remark1.2, p.2; A’Campo v1 Definitions2.1.1–2.1.2 pp.7–8 and Proposition2.5.7 pp.19–20. For N=5, a=(1,2,2,0,0) has rank two. A’Campo’s parameters α=(0,3), β=(1,2) give two distinct singleton Jordan blocks at infinity after the fifth-power covering, hence identity rather than a size-two block. Adding a constant to every a_i preserves the H₀-character and can always create a zero, so zero occurrence is not an intrinsic criterion. |
| E21 | confirmed | Lemma4.2.4 and proof, arXiv v3 pp.41–42. The hypersurface dimension is N−2, while the hypergeometric weight is n−1. Their weight difference is N−n−1. The printed 1−N twist would give weight N instead of N−2. |
| E22 | confirmed | Proof of Proposition4.2.6, arXiv v3 p.44. There are exactly the variables r₀,…,r_{d−1}; the adjoining expansion and definition of the integer r use this range. This is an indexing error, not a change to the argument. |
| E23 | confirmed | Proof of Lemma4.4.4, arXiv v3 p.48. The fibre is a hypersurface of dimension N−2 and the local system throughout §4 is its middle cohomology. The degree N−1 group cannot supply these eigenlines. |
| E24 | confirmed | §4.1, arXiv v3 p.40. The ordinary π_* on connected fibres gives degree-zero cohomology with trivial symmetry action; its nontrivial χ-part vanishes rather than giving rank n. |
| E25 | confirmed | Definition4.4.1, arXiv v3 pp.46–47. The W systems are defined over M and may have larger coefficient fields than the cyclotomic subfield. Each pairing is over the prime field of its own residue characteristic. |
| E26 | confirmed | Definition4.4.1 and Proposition4.4.2, arXiv v3 pp.46–47. For Hermitian spaces the determinants of isometries form a norm-one coset. A determinant identification outside that coset makes the fibre empty. Uniqueness of the underlying Hermitian space does not remove the determinant obstruction. |
| E27 | confirmed | Proposition4.2.5(1), arXiv v3 pp.42–43. The twisting scalar can be a nonunit at the residue characteristic. The full integrality conclusion is true with the additional slope argument, but does not follow from untwisted integral coefficients alone. |
| E28 | confirmed | Proposition6.2.3(13), arXiv v3 pp.61–62; proof of Theorem6.2.4 pp.66–67. The determinant is constrained to 𝔽_p×. Full GU contains diagonal matrices with norm-one determinant outside 𝔽_p×, contradicting that constraint. The multiplier equation alone also has too large a kernel to prove the restricted SU equality. |
| E29 | confirmed | Proof of Theorem6.2.4, arXiv v3 pp.67–68. Disjointness from the earlier field does not preserve a residual image constructed only afterwards. The added finite extension keeps the required cyclotomic-kernel SU image through the remaining base changes. |
| E30 | confirmed | §4, definition of the cover T_W, p. 27 (author copy; p. 54 of the published version). The unrestricted fibre is a GL torsor, and the symplectic geometric image has multiple orbits on it. Restricting to symplectic isomorphisms gives the transitive fibre used in the connectedness proof. BLGGT records this correction. |
| E31 | confirmed | Lemma4.4.4, arXiv v3 p.48; §1.6 p.12; CEGS §1.4 pp.5–6. BCGNT §1.6 and CEGS §1.4 fix geometric Artin normalization: the direct fundamental characters multiply to ε̄_l. Thus the printed positive powers have determinant ε̄_l^{n(n−1)/2}, whereas det W=ε̄_l^{−n(n−1)/2}. For n=3 and l>7 these differ. The inverse-character formula agrees with the paired crystalline weights and with supersingular H¹. |


## Required inputs for the orchestrator

The packet retains the following exact gaps. They are requirements for completing the mathematical development, not reasons to re-plan existing upstream targets.

1. **Hypergeometric convolution rank, local monodromy and determinant.** Katz90 Chapter 8 was not cleared or read. The exact specialized statements are checked in BCGNT §4.2, BLGHT Lemma 4.3 and Katz09 Theorem 5.3. The convolution construction is specified here, but proofs of its rank, irreducibility, purity, tame local monodromy and determinant require the Katz Chapter 8 arguments. Import the existing lower-shriek/base-change/trace contracts; do not count those imports as a proof of Katz’s theorem.

2. **Finite classical-group classification, unitary generation and cross-characteristic orders.** The odd-characteristic n>2 transvection classification and restricted order comparisons are checked in their Qian/BLGHT/BCGNT applications, not against unread ZS76 and Artin55 originals. Supply the precise classification with exceptional cases, the unitary long-root generation/perfectness proof and the rank-two Dickson input used by BLGHT. A large-order element is not a substitute for checking the exception list. Handle Sp₂(𝔽₃) by its solvable composition factors, not by claiming it perfect.

3. **Twisted modular-curve rank-two construction.** Current ModularCurves §5C supplies a fine curve over ℚ and only conditional geometric connectedness. Supply its CM-base version, the connectedness contract and universal elliptic curve with the required integral good reduction. Prove full geometric mod-p SL₂ monodromy and nonempty ordinary/supersingular component neighbourhoods after the prescribed finite local extensions. Use A[r]≅r̄_CM,r∨, equivalently H¹(A,𝔽_r)≅r̄_CM,r. Existence of a supersingular CM point alone does not establish the component comparison.

4. **General-character ordinarity remains conditional.** Retain maximal nilpotence for every conjugate eigenspace and consecutive labelled Hodge–Tate weights as separate hypotheses. Qian21 Lemma 4.2 omits the latter (E10), and zero occurring in the exponent vector is not sufficient for maximal unipotence (E20). The selected zero-shaped data have the separate DM.4 and DM.7 proofs. No general limiting-mixed-Hodge argument supplying consecutive weights is asserted.

5. **Equivariant correspondence comparison.** KM74 Theorem 2(1)–(2), pp. 76–77, was read directly. The rational Künneth projectors and algebraic-correspondence comparison must be exposed by RD.7 for the H-character projector, rather than inferred from its untwisted Frobenius statement. This gap concerns the supplier API, not unavailability of KM74 or Deligne §7.

6. **Tame specialization and curvewise crystalline companions.** LPV.0–LPV.1 must supply the tame specialization formula near ∞, giving the nonzero valuation multiple of N∞ when v(t)<0 and residue characteristic is prime to N. DK17 §§5.1–5.3 transfer slopes by companions on smooth curves; they do not provide arbitrary-dimensional crystalline companions. Supply Abe’s curve companion input and the required full-faithfulness/restriction arguments in RD.2–RD.3; justify the choice of a curve meeting the needed open, since an arbitrary such intersection can be empty.

7. **Recognition and coefficient control of the comparison character.** R24.5 owns the Hecke-character converse for algebraic/de Rham characters. Show the comparison characters satisfy its algebraicity and finite-ramification hypotheses without using DM.7, or state the precise compatible-character Henniart theorem used in BCGNT §4.2. The forward AG2.0 construction and compatible rational Frobenius values by themselves are insufficient. This is a supplier-hypothesis gap, not a new Hecke-character target.

8. **Fixed finite coefficient field in root extraction.** The read R02.4 root statement permits values in an algebraic closure. Establish the stronger finite-field-valued root with the prescribed disjointness, or its primary-component variant; a root outside the chosen coefficient field does not define the required fixed-coefficient level torsor.

9. **Equivariant toroidal subdivision.** SF.4 supplies strictly semistable schemes and alterations, but the needed equivariant unimodular subdivision after a ramified base change is an additional contract, requested there. General alteration existence does not prove an equivariant blowup preserving this generic fibre. Retain the extension degree e, and assert semistability over the resulting F′ rather than over F.

10. **Nonarchimedean local inverse for a finite étale cover.** The fixed finite-level proof reduces to the local analytic inverse/Hensel statement at an F_v-rational point of a finite étale cover. Record this analytic contract explicitly in the supplier interface. Kisin’s stronger theorem is not used, and Berger’s §1.3 and Theorem 3.2.1 were read directly.

The maintainer should register the pending upstream import IDs when those roadmap proposals are integrated, route the fixed-finite-field root strengthening to R02.4 and the comparison-character algebraicity check to R24.5, and retain the current ModularCurves conditional connectedness boundary. Finite-group proof ownership may be moved to a future finite Lie-type roadmap, but no existing ClassicalGroups target should be duplicated. No external maintainer was contacted and no upstream file was edited.

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyDworkMotivesPartII.json --index <pinned declaration index>`: 0 errors, 0 warnings. The graph is acyclic and all ten stages have their stated targets. JSON, node/review/source-finding inventories, reader-to-packet target/API/test agreement, planet bounds and deliverable-only scope are checked before submission.

`lean-check research/blueprint/suggested/PotentialAutomorphyDworkMotivesPartII.lean`: exit 0 at the pins; only declaration-uses-sorry warnings. Memory available before elaboration exceeded 20 GiB. The suggested file has fewer than 5,000 lines, no data definition with a placeholder body, no development of geometric carriers, and no language server or library build was started. This validates the suggested signatures only.

All five named deliverables are aligned. No checkpoint or unfinished review is being submitted. The ten gaps and the version/ownership notes above are the persistent handoff; nothing needed by the next worker exists only in scratch.
