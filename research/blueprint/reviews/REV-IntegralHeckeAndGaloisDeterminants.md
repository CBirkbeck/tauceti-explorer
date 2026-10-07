# Independent review: Integral Hecke actions, determinants and interpolation

Job `REV-IntegralHeckeAndGaloisDeterminants`, issue #435. Reviewer: Codex, session `codex-uC8kaC`, 7 October 2026. This session did not write the input plan; its preceding author/handoff sessions include `codex-O9kH6x` and Claude checkpoints.

**Verdict: needs_changes. This is a completed independent review, not a checkpoint.** Nine contracts still fail to express the planned mathematics faithfully. Clear fixes were applied in place; the remaining repairs need the actual constituent, specialization or coordinate interfaces described below. The verdict is not caused by the 37 inherited proof gaps or by the use of `sorry`.

The packet remains a `complete` planning pass with seven `planned` stages, zero `closed` stages and `implementationStatus: unchecked`. These meanings are consistent with PROTOCOL §§0 and 3: a represented target with an explicit proof leaf is planned, not proved. No formalization or atlas promotion is claimed.

| Measure | Reviewed result |
| --- | --- |
| Nodes | 249: 26 definitions, 39 constructions, 114 lemmas, 16 comparisons, 54 theorems |
| Per-node verdicts | 212 verified, 27 corrected, 1 added, 9 unverifiable |
| API entries | 211 |
| Unit tests | 196 across all 65 definitions/constructions; at least three per object |
| Planets | 33, at most six per stage |
| Baseline declarations | 51 confirmed; zero removed or replaced |
| Sources / version records | 24 / 29 |
| Source issues | 16 independently confirmed |
| Supplier requests / rescope proposals | 19 / 4 |
| Gaps | 43: 37 retained and six precise additions |

All node IDs occur exactly once in `review.checked`. The ledger in the [packet](../packets/IntegralHeckeAndGaloisDeterminants.json) records each individual verdict. “Verified” approves the stated planning declaration and its recorded proof/supplier obligations; it does not approve an unconditional theorem obtained by deleting an omitted supplier condition from the suggested prototype.

## Required revisions

1. **Invariant-coordinate evaluation** (`IHG.0/reductive-pseudocharacter`, `continuous-reductive-pseudocharacter`, `reductive-pseudocharacter-kernel`). `ofRepresentation` accepts arbitrary algebra homomorphisms evaluating the coordinate rings. They need not commute with the reindexing and multiplication pullbacks, so they cannot produce the required pseudocharacter equations. Those equations can already be stated using `InvariantCoordinateInput`; they are not an unavailable LP3 group-scheme carrier. Package compatible evaluation data and propagate it through constructors, reconstruction APIs and examples. The continuity and invariant-tuple kernel mathematics themselves agree with the sources.

2. **Prescribed reducibility factors** (`IHG.1/reducibility-ideal`). The corrected prototype now uses two blocks, a henselian local base and equality of full polynomial laws. It still asks for some factors rather than the specified residual factors and their uniqueness. Recover the source's residual constituent/partition dictionary, and state its reductions and uniqueness. Equality on ground-ring elements is insufficient in small characteristic and was replaced by `.toLaw` equality.

3. **Actual extension constituents** (`IHG.1/gma-extension-injection`). The prototype permits arbitrary `Mi Mj : ModuleCat R`, with no connection to the GMA, quotient or distinct residual factors. For an upper triangular two-block algebra over a field, the off-diagonal entry module has a nonzero dual; taking both modules zero makes the target Ext group zero, contradicting injectivity. Use the quotient constituent modules, the partition reducibility ideal contained in J and the chosen Cayley–Hamilton quotient. State the image as extensions factoring through that quotient, not all ambient extensions. BC09 §1.5 is the characteristic-zero model; the all-characteristic determinant bridge also needs its exact contract.

4. **Lattice hypotheses and conclusion** (`IHG.1/ribet-lattice`). The prototype drops the complete DVR/fraction-field, compact continuous representation, irreducibility and distinct residual-character data, and does not test the desired nonsplit residual orientation. Even existence of an invariant finite full lattice is false over arbitrary coefficient extensions: on Q², let Z act by `diag(2^n,1)` over A=Z; invariance under the negative generator forces unbounded denominators. The packet's source statement has the intended conditions. Make every already expressible condition explicit, then give an oriented nonsplit example.

5. **Universal specialization test** (`IHG.1/universal-cayley-hamilton-algebra`). `universal_matrix_specialization` uses an arbitrary coefficient map into A but asserts a matrix algebra after specialization. A reducible specialized determinant need not have that Cayley–Hamilton algebra. Tie the map to its specialized universal determinant and include henselian-local, split and absolutely irreducible residual conditions. These predicates are already available in the file; scalar-extension carrier work does not justify deleting them from a test.

6. **Symplectic descent** (`IHG.1/symplectic-coefficient-descent`). The matrix signature permits the zero form and omits complete-local/common-residue, trace, continuity, residual irreducibility and residue-characteristic >2 hypotheses of GG12 Lemma 7.1.1. The zero form makes its form equation vacuous: over Q⊂C, the scalar representation of Z with generator i·I₄ cannot be conjugated into Q, yet satisfies that equation with form zero. Require a nondegenerate alternating form and the coefficient-descent inputs, and distinguish the actual GSp carrier omission from these expressible matrix hypotheses.

7. **Quotient direction in local reconstruction** (`IHG.1/compatible-local-reconstruction`). CN23 Proposition 3.2.4(3) uses a surjection Ã→A, a global A-valued representation and an Ã-valued local lift whose reduction is that representation and whose generic fiber is the selected constituent. The prototype instead uses A→B and concludes that an arbitrary local representation over B is conjugate to base extension of the global representation. In rank one, the trivial representation and the character n↦2^n of Z over Q are not conjugate. Restore the quotient, reduction, disjoint residual constituents and compatible corner/generic-fiber data. This is a direction and conclusion error, not a missing proof of the same statement.

These seven repairs account for the nine ledger entries. Their transitive uses must be updated too. Each is recorded in the new gap list and propagated into stage `coverage.remaining`; the affected node keeps an `unverifiable` verdict even where this review made a partial correction.

## Changes applied

The following signature repairs are clear from the existing packet and sources and are now in the suggested file:

- Absolute irreducibility has positive dimension and is checked over algebraically closed extensions. It no longer forces a representation to split over the ground field. `IsSplit` remains separate. The Hamilton quaternion reduced norm gives the new nonsplit, absolutely irreducible regression; repeated and distinct character tests now also assert their stated splitness.
- Non-Eisenstein means that the same continuous semisimple Frobenius witness is absolutely irreducible. Frobenius uniqueness has conjugacy-saturated density, determinant continuity and Hausdorff coefficients. The twist test checks preservation of irreducibility as well as coefficient scaling.
- The telescope/idempotent comparison requires commutation, an inverse on the selected summand and positive-power nilpotence on the complementary summand. Arbitrary idempotents cannot identify the telescope: t=0 and e=1 already contradict the old signature.
- `CongruenceWitness` now carries compact Hausdorff coefficients, continuous injections and classical coefficient functions, compact G and dense Frobenius conjugacy classes. Continuity and full-law classical comparison were added to its API; coefficient changes are continuous. The single-system example supplies the new fields. This is a fixed-level algebraic witness; geometry must still produce a uniform modulus across levels.
- Nilpotent comparison now assumes a compact Hausdorff coefficient quotient embedded continuously into a Hausdorff target, continuous determinant and coefficient membership on a dense set. It concludes a unique continuous determinant over T/kerφ only. Nilpotence does not supply a lift to T or a geometric comparison. Without coefficient membership, Q→C and a character of C₄ with generator i give a simple failure of the old descent assertion.
- The discrete-coefficient/open-normal-kernel signature explicitly requires Hausdorff G. Compact gluing also carries the continuous quotient embedding and Hausdorff targets.
- Ordinary coefficient descent now states complete noetherian local rings, adic topology, injective coefficients, a compatible common residue field, profinite G, continuity and residual absolute irreducibility. The more precise conjugator for a prescribed ideal is a separate API obligation.
- Brauer–Nesbitt module recognition now states a compatible A[G]-action, annihilation by CH(detρ), residual irreducibility and G-equivariance of the tensor decomposition. Identifying the second factor as E₁₁M remains a separately documented interface.
- Reducibility is restricted to the two-block case with full-law factorization. Quotient base change uses the same primitive matrix units. The residual-factor repair above remains open.
- Ordered determinantal tensor resolution now explicitly requires 0<m_i≤n_i. Ordered regularity and determinant-line/tensor identifications remain genuine supplier-interface omissions.

Added node `IHG.0/degree-one-laws-linear`, marked `addedBy: REV-IntegralHeckeAndGaloisDeterminants`, separates the degree-one coefficient argument used by trace linearity and dimension-one determinants. In the two-variable universal value, homogeneity after replacing X,Y by XT,YT kills all coefficients except degree one; evaluations yield additivity and scalar compatibility. Naturality then handles arbitrary scalar extensions and finite sums of pure tensors. No finite projectivity assumption is used. It reuses the existing law/linear-map API rather than defining another polynomial-law carrier. The characteristic-polynomial and dimension-one nodes now import it directly. Trace injectivity now directly imports Newton identities.

Chenevier Proposition 1.29's proof formerly cited a nonexistent Proposition 1.32. It uses Proposition 1.30. The new integral-transfer gap names the S₄/H idempotent/antisymmetrizer argument over Z[1/2], projectivity over modular fields, and the rational Procesi identity transferred through the split symmetric-group algebra over Z[1/(2d)!] with a torsion-free antisymmetrizer quotient. These are non-routine proof leaves, not a claim that rational identities automatically hold integrally.

## Sources and citation repairs

Every original node's locator, excerpt, hypotheses and proof use was compared with its public source. Text normalization was only a screening aid; mathematical symbols, short excerpts and scanned pages were checked manually. The image-only BUCH64 pages were inspected directly, including the complexes, Lemma 1.1, Proposition 2.1/Corollary 2.2, Theorem 2.9 with its lemmas and proof, and §3 regularity. PDF page 2 is printed page 183.

The public versions used are listed below. Node-specific locators, matching explanations and existing SHA-256 version records remain in the packet. In particular, Chenevier's inherited hash is for the source archive, not the PDF: the distinct v2 PDF hash is correctly recorded separately. I did not claim access to the published LMS chapter. Quast's author v1, arXiv v2 and published HTML were collated at the disputed proofs; the publisher PDF endpoint returned a challenge page.

| Source | Public version |
| --- | --- |
| CHENEVIER-DET | [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/abs/0809.0415) |
| ACC23 | [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) |
| BP26 | [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) |
| BN93 | [Homotopy limits in triangulated categories](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf) |
| BCGP25 | [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1) |
| CG18 | [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224) |
| CGH20 | [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/pdf/1907.08694) |
| SCH15 | [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf) |
| DKSW23 | [The residually indistinguishable case of Ribet’s method for GL₂](https://math.iisc.ac.in/~maheshkakde/rl.pdf) |
| ROBY63 | [Lois polynômes et lois formelles en théorie des modules](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf) |
| EM23 | [Comparison of different definitions of pseudocharacters](https://arxiv.org/pdf/2310.03869) |
| Q23 | [Deformations of G-valued pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf) |
| PQ26 | [On local Galois deformation rings: generalised reductive groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf) |
| BC09 | [Families of Galois representations and Selmer groups](https://arxiv.org/pdf/math/0602340) |
| CN23 | [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3) |
| WE18 | [Algebraic families of Galois representations and potentially semi-stable pseudodeformation rings](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf) |
| CHT08 | [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0.pdf) |
| GG12 | [Companion forms for unitary and symplectic groups](https://arxiv.org/pdf/1001.2044) |
| BHKT19 | [G-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491) |
| BIP23 | [On local Galois deformation rings](https://arxiv.org/pdf/2110.01638) |
| BUCH64 | [A generalized Koszul complex. I](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf) |
| PILLONI20 | [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) |
| GT05 | [Systèmes de Taylor–Wiles pour GSp₄](https://numdam.org/item/AST_2005__302__177_0.pdf) |
| CG20 | [Modularity lifting for non-regular symplectic representations](https://arxiv.org/pdf/1907.08691) |

Additional collations: [DKSW arXiv v2](https://arxiv.org/pdf/2310.16396v2), [Quast arXiv v2](https://arxiv.org/pdf/2310.14886v2), [Quast version of record](https://link.springer.com/article/10.1007/s42543-025-00113-2), and [Chenevier v2 PDF](https://arxiv.org/pdf/0809.0415v2).

| Node suffix | Citation correction |
| --- | --- |
| homogeneous-polynomial-law | §1.1, pp.6–7 |
| determinant-base-change | Remark 1.4, p.9 |
| determinant-trace-bijective-small | Proposition 1.29 and proof, pp.20–22; actual Proposition 1.30 in the proof |
| law-of-linear-map | Literal short excerpt for the stated bijection |
| finite-hecke-local-factors | Literal short localization excerpt |
| determinant-gln-pseudocharacter | EM23 Theorem 4.1 and proof, pp.13–14; introductory phrasing identified as such |
| invariants-base-change-range | EM23 Proposition 2.6 and Lemma 2.7, pp.9–10; flat and Dedekind/connected geometrically reductive ranges kept distinct |
| gma-adapted-coordinate-ring | Literal injectivity-after-base-extension excerpt |
| completed-cayley-hamilton-finite | WE18 Proposition 3.6 and proof, pp.21–23 |
| coefficient-descent | CHT08 Lemma 2.1.10, pp.13–14; trace lies in the smaller ring S, not ambient R |
| symplectic-coefficient-descent | GG12 Lemma 7.1.1 and proof, p.25 |
| universal-reductive-pseudocharacter-ring | Q23 Theorem 3.20, p.20 and Theorem 5.4, pp.27–28; not “Definition 5.4” |
| reductive-pseudodeformation-noetherian | Q23 Theorem 5.7 and proof, p.29 |
| reductive-slice-reconstruction | BHKT19's isomorphism-of-functors wording |
| buchsbaum-rim-complex | Literal complex-name excerpt from the scan |
| buchsbaum-rim-determinantal-complex | Literal p=n, q=1 specialization from the scan |

These changes and the signature/API/test changes account for all 27 corrected nodes; the per-node ledger specifies which changes belong to each node.

## Independently checked source issues

All sixteen findings are confirmed at their locators. The following are independent reasons, not approval by repetition of the original extraction. “Confirmed” says that the described source error or proof gap exists; it does not assert a counterexample to a theorem when only its proof is defective. The packet retains the printed statements, corrections, version searches and `review.by` attribution.

- **E1 (CHENEVIER-DET)**: Confirmed at Proposition 1.27 and its proof. The F_p[X] scalar-matrix counterexample has both traces zero and different norms; invertibility of d! is used by the Newton reconstruction.
- **E2 (CHENEVIER-DET)**: Confirmed at Lemma 1.18(ii): the displayed quotient of a general module and its codomain are incorrectly named R and S. This is notation, not a new algebra hypothesis.
- **E3 (DKSW23)**: Confirmed: the proof displays the negative of the coboundary convention in Theorem 2.1. The packet uses (χψ^{-1}−1)y.
- **E4 (DKSW23)**: Confirmed in equation (47): both diagonal entries are evaluated at τ; ξ_v(ψ)−ψ(σ) is a transcription error.
- **E5 (DKSW23)**: Confirmed: the distinguished σ_v need not lie in inertia, so the individual congruence asserted after (47) is unjustified. For each permitted pair an inertia argument applies to the polarized sum, giving the corrected product congruence without division by 2.
- **E6 (DKSW23)**: Confirmed in Lemma 4.18: the equivariant map from the adjoint module may have a nonzero kernel, and all four generators can vanish. Its image is a quotient, not necessarily an isomorphic adjoint module.
- **E7 (DKSW23)**: Confirmed in Definition 4.6 versus Theorem 4.10: simultaneous conjugation has central weight zero on an infinite-rank polynomial ring. A finite filtration by finite induced modules is impossible; use exhaustive finite polynomial-degree pieces.
- **E8 (DKSW23)**: Confirmed in Corollary 4.13: the preceding long exact sequence needs vanishing also in degree 2, so the written range i>2 misses the necessary i=2 case. The separate integral cokernel proof gap remains recorded.
- **E9 (DKSW23)**: Confirmed by expansion of equation (55): the lower-unipotent parameter multiplies the determinant term. The missing parameter does not spoil membership in the relation ideal.
- **E10 (DKSW23)**: Confirmed in §5.3.1: for g:V→V′ the well-typed compatibility is f′∘g=f.
- **E11 (DKSW23)**: Confirmed in Proposition 5.13: Y_1 is already L_1, so the remaining assignment Y_j=X_j must start at j>1.
- **E12 (Q23)**: Confirmed in the author v1, arXiv v2 and publisher HTML: the standard GL_n representation has central character z, so it is not self-dual; the cited tensor-power/direct-sum assertions cannot supply that identification.
- **E13 (Q23)**: Confirmed in all three checked versions of Theorem 3.8: compactness of imρ is invoked before continuity of the reconstructed ρ has been established. This is a proof gap, not a counterexample to the theorem.
- **E14 (BP26)**: Confirmed by Definitions 2.4.2/2.4.5 and Lemmas 2.4.3/2.4.6: the finite-cohomology factor in 2.4.5 is not required to be bounded, whereas 2.4.3 is. The packet’s bounded repair is valid and does not prove the unbounded statement.
- **E15 (PILLONI20)**: Confirmed at §15.2: Fob is the Frobenius typo.
- **E16 (PILLONI20)**: Confirmed as a uniqueness defect in the polynomial rule, including under absolute irreducibility in odd characteristic. Over F_5, tensor the irreducible Q_8 standard module with the irreducible D_8 module generated by diag(2,−2) and the swap matrix. Its two symmetric forms (off-diagonal and identity) have distinct multiplier characters; tensoring with the Q_8 alternating form gives two GSp_4 realizations with identical GL_4 characteristic polynomials. The trace vanishes wherever the multipliers differ. No characteristic-two residue-field sign ambiguity is asserted.

E16 needs a stronger argument than choosing a square root pointwise, since Pilloni's statement assumes an absolutely irreducible residual representation. Here is the independent counterexample supporting the revised reason. Work over F₅ and put i=2. The two-dimensional standard Q₈ representation V is generated by R=diag(i,−i) and J=((0,1),(−1,0)); it preserves J. The standard D₈ representation W is generated by R and S=((0,1),(1,0)). Its symmetric form S has multiplier 1, whereas I₂ has multiplier η, where η(R)=−1 and η(S)=1. Thus V⊗W, a four-dimensional representation of Q₈×D₈, has two nondegenerate alternating forms J⊗S and J⊗I₂ with multipliers 1 and η. Each factor spans its full matrix algebra, so the tensor representation is absolutely irreducible, including after algebraic closure. Transferring each form to the standard symplectic form gives two GSp₄ realizations with identical GL₄ characteristic polynomials and different similitudes. There is no characteristic-two sign argument here.

This finite group is solvable. The [Schmidt–Wingberg proof of Shafarevich's solvable inverse Galois theorem](https://arxiv.org/abs/math/9809211v1) supplies a realization over Q, so the example also gives continuous Galois representations unramified outside finitely many primes. The spherical polynomial rule admits the corresponding two multiplier choices (the middle Hecke coefficient adjusts); it therefore does not itself distinguish the two Hecke/GSp extensions. Over a characteristic-two field, squaring is injective, so this particular ambiguity is absent. Extra nonreduced or global Hecke relations must be separately specified, not inferred from that rule.

## Baseline and library audit

All 51 declarations below were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared build's Mathlib commit matches. Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` was used for the upstream roadmap comparison. No baseline citation was removed or replaced. The scope confirmed is the precise `provides` field, not every construction in the cited module.

The reviewed AUDIT-33 result and its accepted independent review were read alongside `data/library-coverage.json`, whose aggregate audit status still lags that review. Existing `PolynomialLaw`, `DividedPowerAlgebra`, Azumaya, tensor, derived-category and module infrastructure is reused. The roadmap-specific law structures are comparison/planning wrappers with explicit bridges, not a proposal to replace those library carriers. `ModuleCat.finite_ext` supplies finite Ext over noetherian coefficients with finite modules; it does not supply a finite projective-dimension bound. `Algebra.TensorProduct.rid` was checked in Maps.lean, including its protected declaration name.

| Declaration | Confirmed module | Confirmed scope |
| --- | --- | --- |
| `mathlib:AlgHom` | `Mathlib/Algebra/Algebra/Hom.lean` | Algebra homomorphisms. |
| `mathlib:Algebra.TensorProduct.instRing` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | The ring structure on a tensor product of algebras. |
| `mathlib:Algebra.TensorProduct.rid` | `Mathlib/RingTheory/TensorProduct/Maps.lean` | B ⊗[R] R ≃ B. |
| `mathlib:Equiv.Perm.SameCycle` | `Mathlib/GroupTheory/Perm/Cycle/Basic.lean` | Two points lie in the same cycle of a permutation. |
| `mathlib:Equiv.Perm.sign` | `Mathlib/GroupTheory/Perm/Sign.lean` | The sign of a permutation. |
| `mathlib:Function.minimalPeriod` | `Mathlib/Dynamics/PeriodicPts/Defs.lean` | The least period of a point under iteration. |
| `mathlib:LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean` | Linear maps. |
| `mathlib:Matrix.charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` | The characteristic polynomial of a square matrix. |
| `mathlib:Matrix.det` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | The determinant of a square matrix. |
| `mathlib:Matrix.det_conj` | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` | For a square matrix P with IsUnit P, det(P M P⁻¹)=det M; applying it to a unit matrix meets the invertibility hypothesis. |
| `mathlib:Matrix.det_mul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | det (M N) = det M · det N. |
| `mathlib:Matrix.det_smul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | det (c • M) = c ^ n · det M. |
| `mathlib:Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean` | The trace of a square matrix. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The monoid algebra A[G]. |
| `mathlib:MonoidAlgebra.mapDomainAlgHom` | `Mathlib/Algebra/MonoidAlgebra/Basic.lean` | The algebra map A[H] → A[G] induced by a monoid hom H → G. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | Multivariate polynomials. |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | Multivariate power series. |
| `mathlib:Polynomial` | `Mathlib/Algebra/Polynomial/Basic.lean` | Polynomials in one variable. |
| `mathlib:Polynomial.Monic` | `Mathlib/Algebra/Polynomial/Degree/Defs.lean` | Monic polynomials. |
| `mathlib:PolynomialLaw` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | Polynomial laws between modules (Roby), natural in commutative coefficient algebras in the universe of the base. |
| `mathlib:PolynomialLaw.comp` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | Composition of polynomial laws. |
| `mathlib:PolynomialLaw.ground` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | The underlying map M → N of a polynomial law. |
| `mathlib:PolynomialLaw.id` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | The identity polynomial law. |
| `mathlib:RingHom.map_det` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Ring homomorphisms commute with determinants. |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | Tensor products of modules. |
| `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` | With R→A→B and the module/scalar towers in TensorProduct.Tower, the B-linear equivalence M⊗[A](A⊗[R]N)≃ₗ[B]M⊗[R]N; the polynomial-law specialization uses B=A. |
| `mathlib:Continuous` | `Mathlib/Topology/Defs/Basic.lean` | Continuous maps. |
| `mathlib:Continuous.ext_on` | `Mathlib/Topology/Separation/Hausdorff.lean` | Continuous maps into a Hausdorff space agreeing on a dense set are equal. |
| `mathlib:IsOpen` | `Mathlib/Topology/Defs/Basic.lean` | Open sets. |
| `mathlib:LinearEquiv.rTensor` | `Mathlib/LinearAlgebra/TensorProduct/Map.lean` | For f:N≃ₗ[R]P, the induced equivalence N⊗[R]M≃ₗ[R]P⊗[R]M, with R a commutative semiring and the stated module structures. |
| `mathlib:LinearMap.lTensor` | `Mathlib/LinearAlgebra/TensorProduct/Map.lean` | id ⊗ f. |
| `mathlib:MonoidAlgebra.of` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The monoid hom G → A[G]. |
| `mathlib:MvPolynomial.basisMonomials` | `Mathlib/RingTheory/MvPolynomial/Basic.lean` | The monomial basis of MvPolynomial σ R. |
| `mathlib:Subgroup.Normal` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Normal subgroups. |
| `mathlib:Submodule` | `Mathlib/Algebra/Module/Submodule/Defs.lean` | Submodules. |
| `mathlib:Submodule.mkQ` | `Mathlib/LinearAlgebra/Quotient/Defs.lean` | The quotient map M → M/K. |
| `mathlib:Subring.closure` | `Mathlib/Algebra/Ring/Subring/Basic.lean` | The subring generated by a set. |
| `mathlib:TensorProduct.finsuppScalarLeft` | `Mathlib/LinearAlgebra/DirectSum/Finsupp.lean` | (ι →₀ R) ⊗[R] N ≃ ι →₀ N. |
| `mathlib:TwoSidedIdeal` | `Mathlib/RingTheory/TwoSidedIdeal/Basic.lean` | Two-sided ideals of a (possibly noncommutative) ring. |
| `mathlib:TwoSidedIdeal.span` | `Mathlib/RingTheory/TwoSidedIdeal/Operations.lean` | The two-sided ideal generated by a set. |
| `mathlib:ModuleCat.finite_ext` | `Mathlib/Algebra/Category/ModuleCat/Ext/Finite.lean` | For a commutative noetherian R and finite R-modules N,M, Ext^i_R(N,M) is finite for every natural i; the Small hypothesis handles universes. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The derived category of an abelian category, formed by localization at quasi-isomorphisms; it has its triangulated structure. |
| `mathlib:DerivedCategory.Q` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The localization functor from integer-indexed cochain complexes to the derived category, sending quasi-isomorphisms to isomorphisms. |
| `mathlib:DerivedCategory.Qh` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The localization functor from the homotopy category, factoring the chain localization through homotopy classes. |
| `mathlib:DividedPowerAlgebra` | `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` | The existing quotient algebra by Roby’s divided-power relations for any commutative semiring and module; the homogeneous grading and Roby polynomial-law universal property are not yet provided. |
| `mathlib:DividedPowerAlgebra.dp` | `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` | The existing universal divided-power symbols dp R n m, satisfying scalar, binomial product and addition relations. |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | Functorial linear map ∧ⁿM→∧ⁿN induced by f:M→ₗ[R]N, with compatibility against the canonical alternating map; actual namespace exteriorPower, not ExteriorPower. |
| `mathlib:IsAzumaya` | `Mathlib/Algebra/Azumaya/Defs.lean` | The pinned class already bundles finite projectivity, faithfulness and bijectivity of AlgHom.mulLeftRight; the reduced norm and étale matrix-splitting theorem are missing. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean` | For a list rs and module M, each rs[i] acts injectively on M modulo the preceding elements; IsRegular additionally requires the final quotient to be nontrivial. Definition read at pin, lines 135–148. |
| `mathlib:IsIdempotentElem.Corner` | `Mathlib/RingTheory/Idempotents.lean` | For an idempotent e in a nonunital ring R, the existing carrier of eRe with its inherited ring structure and identity e; it does not yet supply the central A-algebra structure or corner determinant. |
| `mathlib:Subsemigroup.mem_corner_iff` | `Mathlib/RingTheory/Idempotents.lean` | For an idempotent e in a semigroup, r lies in its corner exactly when e*r=r and r*e=r. |

## Closure, ownership, supplier contracts and planets

Every node's statement, explicit hypotheses, direct prerequisites and proof outline was read. All seven planned target sets are represented. Coverage remaining lists were recomputed through direct dependency closure after the additions; no stage was changed to closed. The new degree-one lemma and Newton prerequisite expose elementary steps previously implicit; the integral multiplicativity transfer is recorded as a gap rather than hidden in a routine instruction. The other 37 inherited mathematical leaves remain precise follow-up work.

All 19 requests were checked against their supplier statements. The complete Chebotarev and SemisimpleAlgebras upstream reader documents were read. Chebotarev supplies conjugacy-saturated Frobenius density with a convention; IHG proves the determinant consequence. SemisimpleAlgebras supplies the field Artin–Wedderburn, density and finite-central-simple/separability results; it does not by itself establish finite-dimensionality of an arbitrary faithful determinant quotient over an imperfect field. Its three requests now name those separate contracts and leave bounded-center/inseparable-law work in IHG. General-ring Azumaya/reduced norm descent stays a Part II request, reusing the existing Mathlib Azumaya carrier.

The DerivedDeRhamCohomology DD.1 request now recognizes its existing ordinary-quotient/completion and regular-sequence comparison, and asks for the explicit Koszul augmentation and bounded finite-free K-flat interface needed for tensoring the determinantal resolutions. It does not re-plan the Koszul complex. LP3's existing field good-filtration t-structure is distinguished from the requested integral rational-comodule, possibly disconnected invariant-coordinate and slice interfaces. The completed group algebra, topological continuous cocycle, analytic localization, lattice-building and parahoric requests are not treated as fulfilled by smaller finite/discrete or field-only supplier results.

The 33 planets select key definitions, constructions and named theorems, with at most six per stage. No citation locator is used as a planet name. The four rescope proposals preserve the upstream roadmaps and record requested ownership changes; they do not enact edits to the atlas or another job's files.

The confirmed red-team findings were checked against both their result and independent-verifier entries, then against the packet and read-only reader:

- **RT-AREA-automorphic-1/18:** IHG.2 owns finite-level image/ghost/localization algebra; CC.8 owns completed inverse limits and their topological decomposition, with R31.3 specializing it. Corrected an inherited misidentification as langlands/18. Ordinary localization alone needs no semilocality. The verifier does not establish a duplicated construction in TC.2 from its two imports and does not close CC.4's general chain-model gap with a conditional patched-complex result.
- **RT-AREA-langlands-1/25:** IHG.4 is the missing interpolation supplier for R19.6. IHG.1 already reaches it indirectly through R01.5 and R19.1–5; direct documentation of reuse is optional. R19.6 must produce its geometric congruence, integrality, continuity and deformation data and use the split absolutely irreducible henselian Cayley–Hamilton reconstruction, not identify the raw group algebra with matrices.
- **RT-AREA-langlands-1/26:** AG2.4 imports interpolation and an independent algebraic factor prefix, while supplying its HLTT character family and geometry. Scholze's shared factor theorem needs a determinant on R[G][V^{±1}] and the prescribed factorizations for every g and integer k. Pointwise factors or similarity of the two twisting ideas do not establish this input comparison. The factor prefix must not import TC.2; TC.3's arithmetic realization remains separate. The proposal now retains these verifier qualifications.

The reader's original node statements, API/test names and ownership boundaries were compared with the original packet. It is read-only in this issue and was not edited. The revision owner must regenerate it after adopting the new node, API/test entries, signature hypotheses and rescope qualifications.

## Validation and orchestration

`python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json` reports **0 errors, 0 warnings**. The final unchanged suggested file was checked using `lean-check research/blueprint/suggested/IntegralHeckeAndGaloisDeterminants.lean` at the shared pinned Mathlib: **exit 0; only declaration-uses-sorry warnings**. This validates elaboration, not the truth of prototype statements. `git diff --check` is clean. Only the packet, suggested file, this report and this review's handoff are changed.

The orchestrator should route a revision of the nine contract roots above, preserve the existing proof/supplier gaps, and obtain a fresh independent review after the fixes. No maintainer decision is needed to interpret this verdict. The downstream edge/rescope proposals remain proposed changes for their authorized owner; no atlas, campaign or supplier file was changed.
