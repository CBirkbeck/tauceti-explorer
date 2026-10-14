# Independent review: EDC.7 / EDC.8, revision 2

**Verdict: accepted after corrections.** Job `REV-EtaleDualityAndPerverseSheaves--EDC.7~2`, issue #9800, Codex session `codex-4xGMCh`, 2026-10-14. This session wrote neither blueprint round nor the preceding review. The verdict concerns a target-level plan; no sheaf theory, weight theorem or geometric trace formula is claimed formalised.

I read the preceding needs-changes report, the revised packet, the full reader and the Suggested file. I checked all 115 submitted nodes against their source statements and proof dependencies, read every one of the 49 baseline declarations with its enclosing hypotheses at the pinned commits, and compared the supplier contracts with current Tau Ceti roadmaps and the current library. One submitted node duplicated an existing lower-tier theorem and is retired below. Every remaining node has an individual verdict in the packet and the table below.

## Counts and validation

| Item | Reviewed result |
| --- | --- |
| Submitted / retained targets | 115 / 114 |
| Kinds | 78 theorems, 20 definitions, 10 constructions, 3 applications, 3 lemmas |
| Node verdicts | 99 verified, 15 corrected, 0 added, 0 unverifiable |
| Definition/construction API and diagnostic tests | 227 API items; 119 tests; each definition/construction has at least three |
| Native baseline | All 49 declarations confirmed; none removed or replaced |
| Planets | 12, six in each layer |
| Coverage | Complete planning pass; both EDC.7 and EDC.8 planned, neither implemented |
| Supplier requests / separate boundaries | 27 / 3 |
| Source findings | Seven independently confirmed, including one newly linked known finding |
| Weight ownership inventory | 65 provenance entries; 56 local weight targets plus proof-step/existing-supplier destinations |
| Suggested Lean | 287 lines; elaborated at the pins, exit 0, only 26 declaration-uses-sorry warnings |

`check_blueprint.py` passes with zero errors and warnings, including with the shared declaration index. `check_sorry_data.py` passes. JSON, reader/packet statement agreement, local prerequisite acyclicity, source hashes, definition-test coverage, allowed paths and whitespace were checked. Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is `f790474821cf4256814db967cb154e7af3d0c369`. The four cited Tau Ceti source files fetched at the pin match the shared build's files byte for byte. The 14 freely downloadable PDF versions match the packet's recorded hashes. The maintainer-cleared Jantzen edition was read in place; no restricted file or passage is included here.

## Resolution of the preceding review

The upward weight dependencies have been moved from tier-11 DWP into tier-10 EDC.7. Local prerequisites no longer import DWP, FunctionFieldArithmetic, FoundationsAndLibraryIntegration or unresolved UPSTREAM aliases. The path through curve Frobenius, positive products, initial and local bounds, coefficient-pencil square improvement, sharp curve purity, tame relative curves and complex weight estimates is explicit. The square improvement precedes and does not invoke the general direct-image theorem. Definitions keep actual sheaf and derived carriers from their EDC suppliers; placeholders do not simulate unavailable geometry.

The prescribed-base embedding gap is closed by the pinned `IsAlgClosure.equivOfEquiv_algebraMap`. I read both the algebraic-closure construction and that compatibility theorem. The rational-function equivalence respects constants; its algebraic-closure extension therefore restricts to the specified embedding. Matching transcendence-basis cardinalities is insufficient without this last compatibility, and the revision now supplies it.

The general singular semisimple fixed-point target now has an independent proof. Let Q be the full Artin ring of the isolated fixed component, I its ideal and B the finite jet A/I². Choose a finite local jet mapping onto B; it is a rational representation of the reduced diagonalizable cyclic closure D. Exact character projection makes the weight-zero part of B surject onto Q. Every nontrivial character part lies in J=I/I². Since J²=0, the fixed ideal of B is generated, as a Q-module, by the nontrivial character parts: a weight-zero multiplier times such a part still has that nontrivial character. Thus J has no trivial character. The surjection Sym_Q(J)→gr_I(A) implies that the algebra quotient defining the cone's fixed scheme kills every positive-degree generator and equals Q. This is an algebra fixed quotient, not the vector-space invariant functor on a symmetric power.

Only finitely many conormal characters occur. Excluding their inverse values gives the no-almost-fixed condition for scaled g. Varshavsky's Theorem 4.10(b), published p.995, applies to the proper Artin component, and étale nilpotent invariance gives the naive stalk term. The proof does not require normality, an invariant affine neighbourhood, finite order or smoothness of X. For the singular example x³+yz with g(x,y,z)=(x,−y,−z), it uses Q=k[x]/(x³), preserving the nilpotents that invalidate the reduced-point cone argument.

## Corrections made in this review

1. Retired `EDC.7/weight-rosati-of-the-frobenius-endomorphism`: current `AbelianSchemesAndArithmeticModuli:A6/frobenius-semisimplicity` already states π†π=q. The abelian weight estimate imports that finite-field clause. Its independent normalization check now uses A2's graph line M with φ_M=2λ over the ground field, rather than applying π*D=qD to an arbitrary divisor over the algebraic closure. Cancellation takes place in rational Hom and works in characteristic two. Generic scheme Frobenius stays at `SF.0/absolute-frobenius`. Both affected ownership-transfer destinations are corrected in the packet and handoff.
2. Corrected proper pushforward of correspondences: in Varshavsky 2007 §1.1.6 case (ii), the square is merely commutative. Ordinary exchange followed by the proper !/* identifications supplies the map; no cartesian-up-to-nilpotents or invertibility assertion remains.
3. Corrected the general specialization pullback to the directed exchange f̃_s*sp→sp f*. Smoothness is needed for its isomorphism claim (Varshavsky §1.3.2).
4. Corrected the constant-sheaf test: smooth connected over the finite field gives geometric semisimplicity; geometric simplicity requires geometric connectedness. Spec F_(q²) exhibits the distinction.
5. Replaced stale DWP names in the relative-curve proof, direct-image proofs, fixed-ι mixed-complex API and primitive comparison with their precise EDC owners. Corrected the malformed point weight-filtration test and duplicated prose in punctual mixedness.
6. Made the eigenvalue-pairing target import the earlier similitude charpoly result. Its additional content remains generalized-primary perfect pairing and weight reciprocity. Form multiplicities/determinant signs belong to EDC.8; WC.2 assembles their zeta consequence.
7. Corrected Verdier's locators: SP1 is on p.352, SP5 on p.353, and the proof continues on p.354. The pure j* curve-complex example now cites Weil II 6.2.5(c), p.248, rather than attributing complex purity to the sharp cohomology theorem.
8. Linked the compact-form weight sign to the existing confirmed findings PAPER-DELIGNE-80/E38 and E72 and recorded it as E707. The corrected target already has weight −2Re(r).
9. Clarified the complex compact-form supplier addition: current ReductiveGroupsPartII already exists and owns nonarchimedean local structure/arithmetic models. This complex-form contract extends beyond the inspected scope; it does not propose that existing content anew.
10. Updated every baseline verification and every source-finding review to this independent job; marked the Lean file explicitly non-exhaustive and synchronized its target count.

No baseline citation was removed or replaced, and no mathematical node was added. The removed duplicate is a supplier import, not a missing theorem. All corrections are synchronized in the reader.

## Closure, APIs and ownership

The local prerequisite graph is acyclic. Every named external node resolves, and every broad layer edge has a specific obligation in the requests. I read the EDC.0 duality/Poincaré carriers, EDC.4 vanishing/weak-Lefschetz interfaces, EDC.5 perverse external-product/smooth-pullback/semismall interfaces, LPV nearby-cycle and monodromy interfaces, and the A2/A6 polarization targets. Adic Hochschild–Serre, coherent product duality, filtered trace additivity, generic base change and full finite-type specialization exchange are requested explicitly where the presently inspected suppliers are narrower. A broad stage name is not treated as a proved implementation of those additions.

The 30 definitions/constructions have usable interfaces and at least three tests each. In particular, rank-two unipotent Frobenius distinguishes arithmetic from geometric semisimplicity; degree shifts and Tate twists distinguish complex weights; ordinary versus geometric nearby cycles distinguish inertia cohomology; nilpotent fixed schemes distinguish algebra fixed quotients from invariant vector spaces; and primitive-string tests exclude an empty/retract-only construction. The finite-set trace application distinguishes arbitrary self-maps from permutations and field coefficients from the ring-coefficient product-basis computation.

The native Suggested file has light real-bodied predicates and end statements on existing categorical, field and finite-dimensional linear-algebra carriers. It contains neither sorry-defined data nor chains of artificial geometric carriers. Its successful elaboration checks the present signatures, not the absent geometric implementation. The reader is the full specification.

Current roadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current library `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only. The nine post-snapshot roadmaps and OperatorTheory's individual Suggested files supply no replacement étale sheaf/weight theory. DifferentialGeometry's Frobenius theorem and OperatorTheory's Frobenius norms are different notions. Existing ReductiveGroups character and reductivity interfaces, CompactGroups matrix-coefficient/character theory, ArithmeticDirichletSeries 8.2's finite positivity interface, ModularCurves 0E spreading and AlgebraicCurves 12 regular-projective-model dictionary remain imports. JacobianChallenge's pointed Abel–Jacobi interface is distinguished from the explicitly requested basepoint-free Picard/H¹ extension. OrthogonalSpinGroups' isometry determinant, ProfiniteCohomology's discrete coefficients and IntegralHeckeAndGaloisDeterminants' determinant-law reciprocity do not supply the general adic and perfect-pairing targets here.

## Explicit remaining boundaries and manager work

The three listed boundaries remain honest: Artin/DM-stack operations and trace/decomposition transport; perfect/equivariant transport; and characteristic-zero semisimplicity over smaller coefficient fields. Scheme EDC.7/8 results alone do not justify the GS.1/GS.3/ET.2b stack applications or the Zhu perfect-scheme application. The proposed stack Part II and perfect transport contract respond to RT-AREA-etale/3 and /16. The HKW finite-order perfect application still requires the stated finite-type/deperfection compatibility. No general scalar-extension semisimplicity descent is silently used; Hom base change can descend a splitting once one has it.

After acceptance, the manager must retire transferred DWP owners and apply the 65-entry map to the consumer inventory in the blueprint revision handoff (157 consumer nodes in 16 packets, including retired owners). Use the corrected two destinations in this review's handoff, and rescan against the latest main before applying. The earlier EDC.4 EDC.7/8 draft nodes also need the already documented retirement/repointing. Those files are outside this issue's deliverables and have not been edited. The exact supplier additions, including complex compact-form comparison and full adic exchange, need fulfilment before geometric implementation/package completion.

## Source verification

Every source locator used by a retained node was inspected, together with the surrounding hypotheses and proof step it supplies. Public editions are linked below; the packet retains exact version URLs and hashes. This table records inspected material, not a section-by-section synopsis.

| Source | Independent check |
| --- | --- |
| [BBD-1982](https://www.numdam.org/item/AST_1982__100__1_0.pdf) | §4.5, pp.117–121; §§5.1–5.4, pp.122–147; §6.1.8–6.2.11, pp.155–165. |
| [Deligne-WeilII-1980](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | Cited statements/proofs in §§1–4 and §6: pp.150–179, 184–211 and 243–248; fixed-ι and integer conclusions kept distinct. |
| [Deligne-WeilI-1974](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | 1.5.3, p.275; 2.3–2.6, pp.281–282; 3.3–3.6, pp.283–285: traces, reciprocity and positive factors. |
| [Milne-LEC-v2.21](https://www.jmilne.org/math/CourseNotes/LEC.pdf) | §27, Theorems 27.12–27.15, p.159, with the geometric Frobenius convention. |
| [Varshavsky-LV-2007](https://arxiv.org/pdf/math/0505564v2) | §§1.1–1.5, 2.1–2.3, §3, §§4.3–4.4 and §§5.1–5.3 at all cited construction/proof locators. |
| [Varshavsky-LocalTerms-2020](https://arxiv.org/pdf/2003.06815v3) | v3 counterpart of Theorem 4.10 and §6; checked against the published version. |
| [Hansen-Kaletha-Weinstein-2022](https://arxiv.org/pdf/1709.06651v4) | v4 Proposition 5.6.2 and proof, pp.61–62; perfection application does not prove the false general cone comparison. |
| [Lu-Zheng-2022](https://arxiv.org/pdf/2005.08522v4) | Construction 2.6, p.13: dual graph legs and exchange order in the categorical trace construction. |
| [deCataldo-Migliorini-2009](https://arxiv.org/pdf/0712.0349v2) | 2.1.1/2.1.4, pp.13–15; 3.1.11, pp.38–39; 4.2.1/4.2.7, pp.56–58; 5.2.1, pp.81–83. |
| [Yun-Zhang-2019](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | Published §§3.3–3.4, pp.443, 445, 448 and 451: pure perverse input and the actual weight application. |
| [Zhu-2017](https://arxiv.org/pdf/1407.8519v3) | §2.1.1 p.20, Lemma 2.11 p.26, Appendix A.2–A.3 pp.54–55: IC normalization and finite-type transport boundary. |
| [Verdier-1983](https://www.numdam.org/item/AST_1983__101-102__332_0.pdf) | Definition 3.1/criterion 3.2, pp.338–340; Proposition 5.1, pp.341–343; SP1/SP5 and proof, pp.352–354. |
| [Varshavsky-LocalTerms-2023](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/AD273B3043D9AADF4A522F51F1178575/S0010437X23007091a.pdf/local-terms-for-transversal-intersections.pdf) | §§1–2, pp.987–989; Theorem 4.10 and §5, pp.994–997, plus the cited proof. |
| [Milne-AbelianVarieties-v2.00](https://www.jmilne.org/math/CourseNotes/AV.pdf) | II §1, pp.75–78; III §11, pp.117–119, including the flagged incomplete degree argument. |
| Jantzen-2003 | Jantzen, Representations of Algebraic Groups, second edition (2003), I §2.11, pp.30–31: rational diagonalizable weight decomposition and exact projection; cleared edition read in place. |

All seven source findings are confirmed with independent reasons in the packet. E703 and E704 refute the general/reduced-point cone implications, not the local-term conclusion now proved independently. E706 is the known IC shift issue. E707 links the already registered Deligne norm-character sign error; it is not presented as a new discovery.

## Baseline declaration ledger

Every row below was read at the stated pins; its supplied interface is retained. This ledger records imports, not newly planned declarations.

| Declaration | Read module / supplied interface |
| --- | --- |
| `mathlib:CategoryTheory.Abelian` | `Mathlib/CategoryTheory/Abelian/Basic.lean` — Abelian categories (kernels, cokernels, every mono/epi normal). |
| `mathlib:CategoryTheory.Simple` | `Mathlib/CategoryTheory/Simple.lean` — Simple objects: nonzero, every mono into it is zero or iso. |
| `mathlib:CategoryTheory.IsArtinianObject` | `Mathlib/CategoryTheory/Subobject/ArtinianObject.lean` — Artinian objects: descending chain condition on subobjects. |
| `mathlib:CategoryTheory.IsNoetherianObject` | `Mathlib/CategoryTheory/Subobject/NoetherianObject.lean` — Noetherian objects: ascending chain condition on subobjects. |
| `mathlib:CategoryTheory.Limits.HasFiniteBiproducts` | `Mathlib/CategoryTheory/Limits/Shapes/Biproducts.lean` — Existence of finite biproducts, used to state semisimplicity as a finite biproduct of simples. |
| `mathlib:IsSemisimpleModule` | `Mathlib/RingTheory/SimpleModule/Basic.lean` — Semisimple modules (complemented submodule lattice), the module-theoretic notion the categorical one is compared with. |
| `mathlib:CategoryTheory.Limits.kernel` | `Mathlib/CategoryTheory/Limits/Shapes/Kernels.lean` — Kernels in categories with zero morphisms; primitive parts are kernels of η-powers. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` — Schemes, the carriers of correspondences. |
| `mathlib:CategoryTheory.Limits.pullback` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean` — Fibre products; Fix(c) is the pullback along the diagonal and composition uses C ×_Y D. |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` — Proper morphisms of schemes, for proper morphisms of correspondences. |
| `mathlib:AlgebraicGeometry.IsSeparated` | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean` — Separated morphisms. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` — Quasi-coherent ideal sheaves on a scheme, used for I_Z in the contraction condition. |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap` | `Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean` — Pullback of an ideal sheaf along a morphism (scheme-theoretic preimage), giving c₂^{−1}(Z). |
| `mathlib:Matrix.trace_permutation` | `Mathlib/LinearAlgebra/Matrix/Permutation.lean` — For σ:Equiv.Perm n on a finite index type, trace of its permutation matrix is the number of fixed indices. This does not cover an arbitrary self-map σ or the block-valued trace formula. |
| `mathlib:Matrix.charpoly_transpose` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` — A matrix and its transpose have the same characteristic polynomial. |
| `mathlib:LinearMap.det_dualMap` | `Mathlib/LinearAlgebra/Determinant.lean` — For a finite free module, the dual map has the same determinant. |
| `mathlib:Matrix.charpoly_inv` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean` — For invertible A, charpoly(A⁻¹) = (−1)^n · det(A)⁻¹ · charpolyRev(A). |
| `mathlib:Matrix.reverse_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean` — The reverse of charpoly(M) is charpolyRev(M) = det(1 − X·M). |
| `mathlib:LinearMap.charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` — Characteristic polynomial of an endomorphism of a finite free module. |
| `mathlib:Module.End.maxGenEigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` — Defines the maximal generalized eigenspace as the union of kernels of powers of f−μ. This definition alone supplies neither primary decomposition nor its dimension/algebraic-multiplicity formula; the two added theorem citations supply those. |
| `mathlib:LinearMap.IsPerfPair` | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean` — A bilinear map M → N → R bijective onto the dual in both arguments (perfect pairing). |
| `tauceti:LinearMap.trace_pi_of_apply_eq` | `TauCeti/LinearAlgebra/Trace/Pi.lean` — Over a field k and finite-dimensional k-module M, for a finite index type and arbitrary self-map σ, the trace of a coordinate-reindexing map on M^I is the sum of fixed-coordinate traces. Its hypotheses exclude ℤ/ℓⁿ; node EDC.8/zero-dimensional-lefschetz-verdier proves that ring case by diagonal blocks. |
| `tauceti:LinearMap.det_eq_of_compl₁₂_self_eq_smul` | `TauCeti/LinearAlgebra/Determinant.lean` — For a nonzero alternating form on a rank-two free module, a similitude with factor d has determinant d (rank-two case of the middle-degree determinant). |
| `tauceti:TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self` | `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean` — For an isometry f of a bilinear form, det(f)² · det(Gram) = det(Gram) (the case c = 1 of det(φ)² = c^b). |
| `mathlib:Module.End.iSup_maxGenEigenspace_eq_top` | `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean` — For a finite-dimensional vector space over an algebraically closed field, all maximal generalized eigenspaces span the whole space. |
| `mathlib:LinearMap.finrank_maxGenEigenspace_eq` | `Mathlib/LinearAlgebra/Eigenspace/Zero.lean` — Over a field and a finite-dimensional module, finrank of the maximal generalized μ-eigenspace is the rootMultiplicity of μ in the characteristic polynomial; algebraic closedness is not required for this equality. |
| `mathlib:minpoly.algHom_eq` | `Mathlib/FieldTheory/Minpoly/Basic.lean` — minpoly A (f x) = minpoly A x for an injective A-algebra map f: the Weil-number predicate, defined through the minimal polynomial over ℚ, is invariant under field homomorphisms. |
| `mathlib:IsAlgClosed.lift` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean` — For algebraic torsion-free domain R-algebras S and an algebraically closed field M carrying a torsion-free R-algebra structure, constructs an R-algebra homomorphism S→M. It extends the chosen base algebra map, not an arbitrary embedding without first installing that algebra structure. |
| `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean` — Kronecker: an algebraic integer of a number field all of whose complex embeddings have norm 1 is a root of unity (integral Weil numbers of weight 0). |
| `mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean` — An uncountable algebraically closed field has a transcendence basis (over a countable ring) of its own cardinality: trdeg(ℂ/σ(k)) = 𝔠. |
| `mathlib:Cardinal.mk_complex` | `Mathlib/Analysis/Complex/Cardinality.lean` — #ℂ = 𝔠. |
| `mathlib:IsAlgClosed.equivOfTranscendenceBasis` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean` — A ring equivalence between algebraically closed R-algebras from equipotent transcendence bases. The declaration returns a ring equivalence and does not state compatibility with a prescribed embedding of R; that compatibility is supplied in EDC.7/weight-embeddings-into-the-complex-numbers using IsAlgClosure.equivOfEquiv_algebraMap. |
| `mathlib:IsAlgClosed.ringEquiv_of_equiv_of_charZero` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean` — Two uncountable algebraically closed fields of characteristic 0 of the same cardinality are isomorphic: ℚ̄_ℓ ≅ ℂ. |
| `mathlib:Algebra.IsAlgebraic.cardinalMk_le_max` | `Mathlib/RingTheory/Algebraic/Cardinality.lean` — #L ≤ max #R ℵ₀ for L algebraic over R: #ℚ̄_ℓ = #ℚ_ℓ. |
| `mathlib:LinearMap.charpoly_baseChange` | `Mathlib/LinearAlgebra/Charpoly/BaseChange.lean` — For a finite free module over a commutative ring R and any commutative R-algebra A, the base-changed characteristic polynomial is the coefficient image under R→A. |
| `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly` | `Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean` — Over a domain, f has eigenvalue μ iff μ is a root of f.charpoly. |
| `mathlib:Module.End.independent_maxGenEigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` — The maximal generalized eigenspaces for distinct eigenvalues are independent. |
| `mathlib:Matrix.charpoly_fromBlocks_zero₂₁` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` — The characteristic polynomial of a block triangular matrix with a zero lower-left block is the product of those of the diagonal blocks. |
| `mathlib:LinearMap.charpoly_prodMap` | `Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean` — (f₁.prodMap f₂).charpoly = f₁.charpoly * f₂.charpoly. |
| `mathlib:Matrix.trace_eq_sum_roots_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean` — Over an algebraically closed field, the trace is the sum of the roots of the characteristic polynomial. |
| `mathlib:Matrix.det_kronecker` | `Mathlib/LinearAlgebra/Matrix/Kronecker.lean` — det (A ⊗ₖ B) = det A ^ card n * det B ^ card m. |
| `mathlib:LinearMap.trace_tensorProduct'` | `Mathlib/LinearAlgebra/Trace.lean` — For the surrounding finite-free commutative-ring module hypotheses, the trace of the tensor-product map is the product of traces; the field case suffices here. |
| `mathlib:MonoidHom.eqLocus` | `Mathlib/Algebra/Group/Subgroup/Ker.lean` — The equalizer subgroup of two monoid homomorphisms from a group to a monoid. The Weil-group pullback core is the equality locus of the two projected arithmetic-degree homomorphisms. |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` — For a linear map f:M→ₗ[R]N over a commutative ring, the induced map on nth exterior powers, with map_apply_ιMulti and map_comp. It supplies the construction, not its characteristic polynomial. |
| `mathlib:Module.Basis.exteriorPower` | `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean` — From a basis indexed by a linearly ordered type, constructs the exterior basis indexed by n-element finsets. It supplies the wedge basis for the triangular-matrix argument, not the spectral theorem. |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` — Representation k G V := G →* (V →ₗ[k] V): the carrier for the monodromy representations of π₁ and of the Weil group on stalks and on cohomology. |
| `mathlib:Representation.asModule` | `Mathlib/RepresentationTheory/Basic.lean` — The underlying module of a representation, viewed as a MonoidAlgebra k G-module; semisimplicity of a representation is IsSemisimpleModule of this module. |
| `tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` | `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean` — Over a field, a finite-dimensional irreducible representation restricted to any normal subgroup is semisimple. For a finite-dimensional semisimple representation, decompose into finitely many irreducibles and apply this theorem to each. No finite-group or characteristic-zero hypothesis. |
| `mathlib:IsAlgClosure.equivOfEquiv_algebraMap` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean` — An algebraic-closure field equivalence extending a given base-field equivalence agrees with it on the algebra maps. Applies to constants in the rational-function equivalence used for prescribed-base complex isomorphisms. |

## Per-node verdicts

IDs below abbreviate the common `EtaleDualityAndPerverseSheaves:` prefix. The retired Rosati identity is accounted for in the corrections and handoff, rather than assigned a verdict as a surviving node.

| Node | Verdict | Independent check |
| --- | --- | --- |
| `EDC.7/frobenius-descent-of-perverse-sheaves` | verified | BBD 5.1.2 and 5.1.5: finite-field descent retains Frobenius invariants and coinvariants; the unipotent rank-two example detects arithmetic extensions. |
| `EDC.7/mixed-perverse-sheaves` | verified | BBD 5.1.8: mixedness is the induced perverse subcategory, not merely a pointwise eigenvalue predicate; the actual EDC hearts are imported. |
| `EDC.7/pointwise-weight-criteria` | verified | BBD 5.1.14: the punctual conditions include the cohomological degree shift and the dual lower-bound convention. |
| `EDC.7/weight-ext-vanishing` | verified | BBD 5.1.15: strict weight separation kills both invariants and coinvariants; equality permits arithmetic Ext¹ but not Ext². |
| `EDC.7/affine-cohomology-weight-criterion` | verified | BBD 5.2.1: the affine hypercohomology condition is applied to all affine test morphisms; its converse uses the perverse support induction. |
| `EDC.7/subquotient-weight-stability` | verified | BBD 5.3.1: perverse subquotients preserve the stated one-sided bounds; duality handles the lower bound. |
| `EDC.7/intersection-complex-purity` | verified | BBD 5.3.2: middle extension of L[d] has weight w+d, with no implicit half-Tate normalization. |
| `EDC.7/simple-mixed-perverse-is-pure` | verified | BBD 5.3.4: irreducible mixed local systems are punctually pure; simple perverse classification then gives an integer pure weight. |
| `EDC.7/torsion-theory-splitting-lemma` | verified | BBD 5.3.5: the torsion-pair order uses vanishing of extensions in the correct weight direction, retaining arithmetic nonsplitting. |
| `EDC.7/weight-filtration` | corrected | BBD 5.3.5: strictness and uniqueness give the largest lower-weight subobject. Corrected the malformed point test to its actual Frobenius-module calculation. |
| `EDC.7/generic-weight-criterion` | verified | BBD 5.3.7: generic lisse restrictions with their degree shifts characterize the upper bound; this is not the semisimplicity theorem. |
| `EDC.7/geometrically-semisimple-perverse-sheaf` | corrected | The finite-biproduct definition and unipotent arithmetic example are sound. Corrected the constant-sheaf simplicity claim: geometric connectedness is required. |
| `EDC.7/pure-perverse-geometric-semisimplicity` | verified | BBD 5.3.8: purity gives semisimplicity after geometric pullback; no semisimplicity of the arithmetic Weil action is inferred. |
| `EDC.7/pure-indecomposables` | verified | BBD 5.3.9: the indecomposable arithmetic factor includes the unipotent Frobenius block, distinct from geometric irreducibility. |
| `EDC.7/pure-open-closed-decomposition` | verified | BBD 5.3.11: purity and support decomposition give the open/closed splitting; the corrected closed-complement letter avoids the source clash. |
| `EDC.7/perverse-cohomology-weights` | verified | BBD 5.4.1: weight bounds pass to perverse cohomology with weight w+i; both directions use the correct truncations. |
| `EDC.7/quasi-finite-intermediate-extension-purity` | verified | BBD 5.4.2: the finite/quasi-finite conditions and ordinary direct-image bound are preserved; duality is used only in its valid setting. |
| `EDC.7/pure-complex-geometric-splitting` | verified | BBD 5.4.5–5.4.6: the splitting is geometric and noncanonical, obtained from the higher-Hom weight vanishing. |
| `EDC.7/decomposition-theorem` | verified | BBD 5.4.7: proper pushforward of a pure complex gives shifted semisimple IC summands geometrically; stack transport is not asserted. |
| `EDC.7/semismall-decomposition` | verified | de Cataldo–Migliorini 4.2.1 and 4.2.7: smooth-source semismallness gives perversity; the top fibre cohomology determines precisely the relevant strata. |
| `EDC.7/graded-lefschetz-object` | verified | BBD 5.4.10 notation: the graded object contains an actual Tate autoequivalence, operator and primitive kernels; tests detect omitted columns. |
| `EDC.7/abstract-primitive-decomposition` | verified | BBD 5.4.10 linear algebra: opposite-degree isomorphisms produce all finite primitive strings with their twists, not merely a retract. |
| `EDC.7/universal-hyperplane-lemma` | verified | BBD 5.4.11–5.4.14: smooth connected hyperplane fibres, perverse exactness and the two endpoint maps give the inductive Lefschetz setup. |
| `EDC.7/relative-hard-lefschetz-theorem` | verified | BBD 5.4.10 and its proof: projectivity, purity and the relatively ample class are retained; the curve case uses 5.3.8, correcting the printed reference. |
| `EDC.7/relative-lefschetz-primitive-decomposition` | corrected | The relative primitive formula follows from the graded target and relative hard Lefschetz. Replaced the stale DWP comparison by the local primitive owner. |
| `EDC.7/intersection-cohomology-hard-lefschetz` | verified | Intersection-cohomology degree j means H^(j−n) of IC; the weight and twist on the hard-Lefschetz isomorphism agree with this normalization. |
| `EDC.7/restricted-constructible-categories` | verified | BBD 6.1.8–6.1.10: finite residual constituent families and good-model base-change conditions are explicit; only specialization germs are asserted. |
| `EDC.7/geometric-origin-class` | verified | BBD 6.2.2–6.2.4: geometric origin starts at the constant sheaf on a point and closes under the specified operations and simple constituents. |
| `EDC.7/pure-specialization-of-geometric-origin` | verified | BBD 6.2.6–6.2.7: the finite-field pure model includes its coefficient descent and specialization witness, rather than presupposing a pure spread. |
| `EDC.7/decomposition-theorem-complex` | verified | BBD 6.2.5 and 6.2.11: specialization transports decomposition for geometric-origin input; arbitrary semisimple complex local systems are not included. |
| `EDC.7/relative-hard-lefschetz-complex` | verified | BBD 6.2.10: complex relative hard Lefschetz follows through the same good-model comparisons with the ample class retained. |
| `EDC.8/scheme-correspondence` | verified | Varshavsky 2007 §1.1: the two legs and scheme equalizer define the correspondence and full fixed scheme, including nilpotents. |
| `EDC.8/cohomological-correspondence-lifting` | verified | Varshavsky 1.1.4: c₁*F₁→c₂!F₂ and its c₂!-adjoint agree; graph and diagonal tests pin the leg convention. |
| `EDC.8/cohomological-correspondence-pushforward` | corrected | Varshavsky 1.1.6: corrected case (ii) to ordinary exchange on an arbitrary commutative proper square; cartesianness and invertibility are not implied. |
| `EDC.8/correspondence-pullback-and-restriction` | verified | Varshavsky 1.1.8 and 1.5: pullback uses the stated right-square hypothesis; invariant restriction and quasi-finite naive terms retain their conditions. |
| `EDC.8/cohomological-correspondence-composition` | verified | Varshavsky 1.1.5: composition uses the actual fibre product and exchange map, with associativity supplied by six-functor coherence. |
| `EDC.8/trace-map-and-local-terms` | verified | Varshavsky 1.2.1–1.2.2: evaluation and coherent product duality land in dualizing cohomology of Fix(c); integration requires a proper component. |
| `EDC.8/trace-pushforward-compatibility` | verified | Varshavsky 1.2.5: proper pushforward commutes with trace through the fixed-scheme map, using the exact correspondence hypotheses. |
| `EDC.8/lefschetz-verdier-trace-formula` | verified | Varshavsky 1.2.3: proper schemes permit the global trace formula; no replacement of general local terms by stalk traces is made. |
| `EDC.8/zero-dimensional-lefschetz-verdier` | verified | The finite product trace formula works for arbitrary self-maps over a field. Ring coefficients use a product basis, not the field-only Tau Ceti theorem. |
| `EDC.8/trace-additivity` | verified | Varshavsky §5: additivity uses the enhanced filtered two-step correspondence, not an unsupported bare triangulated trace assertion. |
| `EDC.8/correspondence-specialization` | corrected | Varshavsky 1.3.2: corrected the general pullback exchange to a directed map; proper/smooth hypotheses give the stated isomorphisms and geometric nearby cycles are used. |
| `EDC.8/normal-cone-specialization` | verified | Varshavsky §1.4: the Rees deformation has the original generic fibre and full normal-cone special fibre; the vertex restriction and duality are explicit. |
| `EDC.8/contracting-correspondence` | verified | Varshavsky 2.1.1: ideal containment defines contraction on a neighbourhood of the fixed locus, preserving the scheme-theoretic invariant condition. |
| `EDC.8/contracting-local-terms` | verified | Varshavsky 2.1.3: contraction gives trace restriction and proper-component integration; the cone step uses the coefficient specialization theorem. |
| `EDC.8/frobenius-twist-contracting` | verified | Varshavsky 2.2.3: a quasi-finite second leg and sufficiently high Frobenius power give contraction near fixed points, with the ramification threshold. |
| `EDC.8/fujiwara-varshavsky-trace-formula` | verified | Varshavsky 2.3.2: the large-power trace formula keeps compactification and boundary hypotheses; it does not claim equality at every small iterate. |
| `EDC.8/finite-order-local-terms` | verified | The tame finite-order graph application uses the full fixed subscheme and the independently justified cone hypothesis; perfection transport stays separate. |
| `EDC.8/similitude-charpoly-reciprocity` | verified | The perfect pairing identifies the adjoint with cF⁻¹ and yields reciprocal charpoly without diagonalizability; native inverse-charpoly assumptions were read. |
| `EDC.8/form-similitude-determinant` | verified | Symmetric and alternating self-pairings control generalized-primary multiplicities and determinant signs; the c=1 orthogonal theorem is an import, not replanned. |
| `EDC.8/graded-frobenius-duality-datum` | verified | The alternating product of degreewise determinants has square q^(dχ); the sign convention matches the selected zeta functional equation. |
| `EDC.8/poincare-reciprocity-export` | verified | Weil I 2.4–2.6: Poincaré duality gives c=q^d, reciprocal polynomials and the middle form sign; no Frobenius semisimplicity is needed. |
| `EDC.8/punctured-tubular-fixed-point-conditions` | verified | Varshavsky 2023 §4: no fixed points and no almost fixed points on the punctured normal cone are distinct hypotheses, detected by scaling examples. |
| `EDC.8/relative-trace-constancy` | verified | Varshavsky Proposition 2.5: ULA and topological constancy of Fix(c) give trace constancy; the target corrects the printed ambient-fibre notation. |
| `EDC.8/normal-cone-trace-comparison` | corrected | Varshavsky Theorem 4.10 and Verdier §8: monodromic scaling gives cone trace comparison. Corrected SP1 to p.352 and SP5 to p.353. |
| `EDC.7/betti-growth-in-etale-towers` | verified | BBD 4.5.1–4.5.5: the affine/quasi-finite and perverse-range hypotheses give the required genus growth; the dual inequality uses compact support. |
| `EDC.8/tame-fixed-subscheme-normal-cone` | verified | The finite-order spectral projectors work even on an infinite-dimensional affine algebra; the full fixed ideal kills all positive-degree cone generators. |
| `EDC.7/weight-characteristic-power-series-and-traces` | verified | Weil I 1.5.3: logarithmic derivatives recover power traces in characteristic zero; constant term one is essential for the determinant series. |
| `EDC.7/weight-eigenvalues-of-exterior-powers` | verified | Triangularization plus the actual exterior basis gives products of roots with multiplicities, without a diagonalizability hypothesis. |
| `EDC.7/weight-embeddings-into-the-complex-numbers` | verified | Read IsAlgClosure.equivOfEquiv_algebraMap at the pin: matching transcendence bases extends the prescribed countable-field embedding on constants. |
| `EDC.7/weight-endomorphism-weights` | verified | Endomorphism weights use the full root multiset and the invertible Frobenius convention; short-exact multiplicativity belongs in the proof rather than a new target. |
| `EDC.7/weight-finite-field-base-extension-of-weights` | verified | Finite constant extension raises Frobenius eigenvalues to the extension degree and changes q compatibly; integer and fixed-ι weights are unchanged. |
| `EDC.7/weight-iota-weight` | verified | The logarithmic fixed-ι weight is defined only for nonzero eigenvalues and q>1; it is real-valued and need not be an integer. |
| `EDC.7/weight-purity-under-subquotients-and-extensions` | verified | Exact-sequence charpolys give subquotient and extension purity bounds; mixed Frobenius blocks need not split. |
| `EDC.7/weight-reciprocal-pairing-of-eigenvalues` | corrected | Imported the earlier similitude charpoly result and corrected determinant ownership. The new content is perfect generalized-primary pairing and its weight consequences. |
| `EDC.7/weight-spectra-of-polynomials-in-an-endomorphism` | verified | Polynomial spectral mapping retains algebraic multiplicities; inverse and power instances include their nonzero hypotheses. |
| `EDC.7/weight-spectra-of-tensor-products-and-duals` | verified | Triangular tensor matrices give pairwise products of roots; the dual gives inverse roots, retaining generalized multiplicities. |
| `EDC.7/weight-twisting-by-rank-one-characters` | verified | Rank-one twists multiply roots by the specified scalar and shift fixed-ι weights additively; Tate twist r subtracts 2r. |
| `EDC.7/weight-weil-number-arithmetic` | verified | The Weil-number arithmetic is stated for algebraic numbers with every complex embedding; sums are not assigned a purity weight. |
| `EDC.7/weight-weil-number-base-extension` | verified | Raising algebraic roots to a finite-extension power preserves the normalized Weil weight; the converse includes algebraicity and all embeddings. |
| `EDC.7/weight-weil-number-iff-iota-pure-for-every-iota` | verified | All prescribed embeddings force algebraicity by moving a transcendental element to incompatible moduli; the base-compatible extension theorem closes the earlier gap. |
| `EDC.7/weight-weil-q-number` | verified | A Weil q-number includes algebraicity and the all-embeddings modulus; fixed-ι purity alone does not meet this definition. |
| `EDC.7/weight-absolute-values-from-the-rosati-involution` | verified | Milne II Lemma 1.3, pp.77–78: positive Rosati excludes nilpotents, preserves field factors and conjugates complex factors; the positive scalar is retained. |
| `EDC.7/weight-weights-of-the-cohomology-of-curves` | verified | Milne III Proposition 11.2: curve H¹/Picard comparison and translation invariance are supplier obligations; the flagged incomplete degree calculation is not used as proof. |
| `EDC.7/weight-weil-estimate-for-abelian-varieties` | corrected | Imported A6’s existing finite-field Rosati identity, corrected the normalization check using A2’s rational graph bundle, and retained H¹ weight +1 versus Tate-module weight −1. |
| `EDC.7/weight-weil-estimate-for-curves` | verified | Milne’s curve estimate follows from the abelian-variety bound via the stated Picard/H¹ comparison, including curves without a rational basepoint through the extension contract. |
| `EDC.7/weight-compact-weil-form` | corrected | Weil II 2.2.4–2.2.8: compact-form comparison is an explicit supplier extension. Recorded the known −2Re(r) sign correction, including its repetition in 3.5.1. |
| `EDC.7/weight-determinantal-weight-functoriality` | verified | Weil II 1.3.13: determinant weights come from rank-one determinants of simple constituents; geometric semisimplicity and finite central degree enter separately. |
| `EDC.7/weight-determinantal-weights` | verified | Weil II 1.3.13: tensor and exterior operations control determinantal weights by constituent ranks; the top exterior power is the determinant. |
| `EDC.7/weight-generalized-majoration` | verified | Weil II 1.5.1–1.5.3: even tensor positivity and exterior determinant bounds force punctual purity of real-sheaf constituents, before the sharp direct-image theorem. |
| `EDC.7/weight-geometric-monodromy-and-central-degree` | verified | Weil II 1.3.9–1.3.15: reductive monodromy and a central degree subgroup use the exact algebraic-group suppliers; complex compact-form additions remain explicit. |
| `EDC.7/weight-hadamard-de-la-vallee-poussin` | verified | Weil II 2.1: the 3-4-1 positivity, normalized Haar and character approximation are imported from existing upstream roadmaps, not recreated. |
| `EDC.7/weight-initial-curve-and-boundary-bounds` | verified | Weil II 1.8 and the curve Euler product: the initial bounds precede local monodromy purity and preserve the fixed-ι real-weight setting. |
| `EDC.7/weight-local-monodromy-purity` | verified | Weil II 1.8.4: the centered monodromy filtration has pure graded weights shifted by its index; no arbitrary inertia representation is assumed quasi-unipotent. |
| `EDC.7/weight-local-weight-corollaries` | verified | Weil II 1.8.5–1.8.8: local invariants carry upper weights and tame formation commutes with relative base change under the divisor hypotheses. |
| `EDC.7/weight-punctual-purity-and-mixedness` | corrected | Weil II 1.2.1–1.2.5: mixedness requires an actual finite sheaf filtration. Corrected a prose duplication; pointwise spectral purity is not substituted for mixedness. |
| `EDC.7/weight-rank-one-normalization` | verified | Weil II 1.3.3–1.3.6: a scalar rank-one twist normalizes an irreducible determinant using the specified Weil group and geometric abelian-image supplier. |
| `EDC.7/weight-real-sheaves` | verified | Weil II 1.5: real means real characteristic-polynomial coefficients under the fixed embedding; adjoining the conjugate representation supplies the needed real sheaf. |
| `EDC.7/weight-specialization-of-monodromy` | verified | Weil II 1.7–1.8: monodromy filtration transport and nilpotent strings preserve the stated Tate/Frobenius relation and center. |
| `EDC.7/weight-strict-initial-h1-bound` | verified | Weil II 2.2.10: compact-character positivity sharpens the initial H¹ bound strictly; uniform approximation and coefficient comparison are separately supplied. |
| `EDC.7/weight-weil-group` | verified | Weil II 1.1.10–1.1.14: the Weil group is the degree pullback with geometric kernel; continuity is specified on that kernel. |
| `EDC.7/weight-weil-sheaf` | verified | Weil II 1.1.10: a Weil sheaf carries actual descent data; geometric sheaves without a Weil action are excluded by the tests. |
| `EDC.7/weight-coefficient-specific-vanishing-cycles` | verified | Weil II §4: the pencil proof is coefficient-specific and preserves the ordinary quadratic and characteristic-two branches supplied by LPV. |
| `EDC.7/weight-real-cohomological-factors` | verified | Weil II §4: real cohomological factors use duality and the precise coefficient pencil decomposition, before invoking the square improvement. |
| `EDC.7/weight-sharp-curve-purity` | verified | Weil II 3.2.3: square improvement and curve duality give exact n+i weights, first for fixed ι and then for all embeddings. |
| `EDC.7/weight-square-improvement` | verified | Weil II §4, pp.197–204: iterate the tensor-square error improvement, then use integrality only at the final Weil-weight step; the direct-image theorem is not imported. |
| `EDC.7/weight-fundamental-direct-image-theorem-3-3-1` | corrected | Weil II 3.3.1: tame relative-curve reduction gives compact direct-image upper bounds. Replaced the stale Weil-sheaf supplier name by its EDC owner. |
| `EDC.7/weight-iota-mixed-direct-image-3-3-10` | corrected | Weil II 3.3.10: fixed-ι bounds and weights modulo integers follow through the same reductions. Corrected the transferred curve and local owner references. |
| `EDC.7/weight-purity-of-the-relative-curve-case` | corrected | Weil II 3.3.9: tame local formation, fibrewise sharp purity and the divisor exact sequence give the relative-curve estimate. Corrected all DWP proof imports. |
| `EDC.7/weight-spreading-out-to-a-tame-relative-curve` | verified | Weil II §3.3: source/target dévissage and finite-presentation spreading reduce to the actual tame relative curve; models are not assumed to exist without suppliers. |
| `EDC.7/weight-tame-cover-of-a-lisse-sheaf-on-a-curve` | verified | Weil II §3.3: the finite cover kills wild local images using lattice residual finiteness and curve compactification, with the étale-open shrink retained. |
| `EDC.7/weight-compact-support-direct-image-upper-weights-6-2-3` | verified | Weil II 6.1.2: noetherian induction patches generic mixedness and closed-complement compact images; the ordinary sheaf bound comes from 3.3.1. |
| `EDC.7/weight-direct-image-preserves-mixedness-6-1-2` | verified | Weil II 6.1.2: compactification and localization give ordinary direct-image mixedness, independent of assuming the later full six-operation theorem. |
| `EDC.7/weight-directional-weight-estimates` | verified | Weil II 6.2.3–6.2.4: f! and f* preserve upper bounds, their duals preserve lower bounds, tensor adds and RHom subtracts the correct bounds. |
| `EDC.7/weight-generic-mixedness-of-direct-images-6-1-3` | verified | Weil II 6.1.3: generic shrinking makes ordinary images mixed through Poincaré/compact-support comparison; this is a first step, not a global purity theorem. |
| `EDC.7/weight-geometric-semisimplicity` | verified | Geometric versus arithmetic semisimplicity is distinguished through the actual Weil representation and monodromy closure; finite-index component handling is explicit. |
| `EDC.7/weight-mixed-complexes` | corrected | Weil II 6.1.1 and 6.2.2: cohomology weights are shifted by degree. Corrected both fixed-ι API and statement references to the local sheaf-purity owner. |
| `EDC.7/weight-potentially-property-p-3-4-10` | verified | Weil II 3.4.10: potentially P includes an actual finite-type model and all closed-fibre witnesses; it is not a label that assumes arithmetic descent. |
| `EDC.7/weight-proper-direct-image-preserves-purity-6-2-6` | corrected | Weil II 6.2.6: properness combines opposite weight bounds. Corrected the j* curve-complex example to cite 6.2.5(c), p.248. |
| `EDC.7/weight-pure-complexes` | verified | Weil II 6.2.2: lower weights use Verdier duality and purity is their intersection with upper weights; ordinary stalk weights alone do not define complex purity. |
| `EDC.7/weight-six-operations-preserve-mixedness-6-1-11` | verified | Weil II 6.1.11: the proof first establishes f! mixedness and then internal Hom/duality, avoiding a circular appeal to all six operations. |
| `EDC.7/weight-twist-shift-and-smooth-lisse-purity-6-2-5` | verified | Weil II 6.2.5: Tate twists subtract 2r and shifts add r to complex weight; smooth lisse purity uses the dualizing [2d](d) normalization. |
| `EDC.7/weight-positive-euler-product-comparison` | verified | Weil I 3.3–3.6: even tensor traces give nonnegative local factors and finite-coefficient product comparison; no alternating-form hypothesis is added. |
| `EDC.8/semisimple-isolated-fixed-subscheme-normal-cone` | verified | Verified the independent finite-jet proof along the full Artin fixed component: diagonalizable weight projection kills positive cone generators and yields the no-almost hypothesis for Theorem 4.10(b). |
