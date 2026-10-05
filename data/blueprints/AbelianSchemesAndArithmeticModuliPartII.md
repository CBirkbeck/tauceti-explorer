# Abelian schemes and arithmetic moduli, PartII

This roadmap continues the parent in three related directions. The first builds
the universal connection and completed Poincaré bundle used in Eisenstein–Kronecker
theory. The second turns complex period coordinates into Betti maps and proves
the non-degeneracy inputs needed by uniform Mordell–Lang. The third develops
finite-field isogeny and lattice classifications before counting abelian varieties
and their principal polarizations. These are extensions of the parent abelian
scheme library; none reconstructs its Picard functor, polarizations, Tate modules
or degree polynomial.

All 94 targets from the six accepted paper routes are retained. The suffix aliases
for Poincaré bundles, finite fields and Betti maps are recorded in the packet's
route provenance. They identify inputs to one issue-authorized design, rather
than roadmaps that already have completed foundational libraries. The 17 layers
below are a breadth-first planning pass. Each target has a declaration and a
chain terminating in a baseline item, an existing supplier or an explicit gap.
The packet is complete as a planning pass and every layer is planned. It is not
closed: the listed proof and interface gaps are part of the plan. Every
implementation status remains unchecked.

## Conventions and boundaries

TSym means permutation invariants in the tensor power. Mathlib's SymmetricPower
is a quotient, and its DividedPowerAlgebra already exists. Only the invariant
construction, its shuffle algebra and comparisons are new. The degree product
completion is used for the moment target. Integral identification with
augmentation-adic completion is a separate gap; factorial arguments apply only
where the factorial is invertible. A formal completion is a formal ind-object
of infinitesimal neighborhoods; its coordinate ring is the inverse limit. Do
not reverse that distinction when writing scheme morphisms.

A♮ is the universal vector extension of A∨. Its kernel is ω_A, its Lie algebra
is H¹_dR(A), and H=(H¹_dR(A))∨ is its invariant cotangent module. The universal
connection retains the imported rigidification. Completion, translation and
base change must be compatible with that unit, rather than identifying
underlying modules without their extra structure. The O_Cp construction starts
from the source's noetherian CM model and uses completed base change; O_Cp is
not asserted noetherian. Integral translations require an étale dual killing
isogeny. A moment-composed torsion splitting is distinguished from the splitting
itself.

The Betti map excludes the base coordinate. All ranks are real ranks on a
subvariety of total complex dimension, including base directions. Period-frame
changes are integral automorphisms. The GH generically special convention
allows a constant algebraic subvariety of the trace, whereas Gao's
special-generically closure uses a constant section and an abelian subgroup.
These distinct notions are not silently equated. Good-cover transport is over
a curve. Constant rank is required on a neighborhood. Null directions of the
Betti form are identified by a pointwise Hessian calculation. Fibre powers use
geometric generic irreducibility, or selected dominating components after
finite cover; the entire reducible product is not called an irreducible variety.

For finite-field foundations q=p^a is arbitrary. The counting applications that
use commutative nonreal endomorphisms and integral order realization specialize
to F_p. Honda–Tate associates a simple class to a conjugacy class of Weil
q-numbers, with P_A=m_π^e and2dimA=e degm_π; the division algebra and real places
determine e. A reciprocal polynomial is not automatically realizable in its
apparent dimension. The imported Dieudonné carrier is contravariant. At q=p
the linear dual with transpose F,V restores covariance; it is not Cartier
duality, which swaps/scales those operators. Point-count orders are isogeny
invariant; rational-point groups are not asserted isomorphic.

The main unpolarized69/4 bound is a conditional target until the exact local
orbit and stabilizer repairs are supplied. Keep the factor2^(34g²). The earlier
17/2 exponent is not restored, and the45/4 theorem is not inferred from its
defective repeated-root proof route. The elliptic-power polarization asymptotic
has coefficient1/2 in front of g²logg. The repeated-factor conclusion retains
the split-prime condition and both the squarefree and X²−p-coprimality conditions.
Statements about characteristic2 are not imported from an odd-characteristic
elliptic argument.

## Sources and actual reading

The source catalogue below records pinned public PDFs and the precise passages
personally read in this job. Historical extraction metadata is provenance, not
a claim that this worker reread every page. Only the exact target passages are
used. Scanned Waterhouse–Milne and Milne pages were viewed as images. The
original Honda existence proof, Mazur–Messing representability input, Sprang
elliptic comparison papers and final Duke counting proof remain named gaps.
The current parent library audit, accepted source corrections, actual supplier
stage descriptions and pinned declaration statements were inspected before
the plan was written.

- [Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation](https://arxiv.org/pdf/1912.03657v4), Guido Kings and Johannes Sprang. Annals of Mathematics (2) 202 (2025), no. 1, 1–109; pinned public PDF. Read: PDF pp.6–9,13–18,28–33,54–55,56–63; target passages read, not the whole paper. SHA-256 fab8e605123cf9c399753b7114c4fd65000e1863e3507abdd4129c8c940fbb72.
- [Algebraic integers with conjugates in a prescribed distribution](https://arxiv.org/pdf/2111.12660v2), Alexander Smith. Annals of Mathematics 200 (2024), no. 1; pinned public PDF. Read: PDF pp.3,40; Honda–Tate consumer statement and citation only. SHA-256 99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9.
- [Uniformity in Mordell–Lang for curves](https://arxiv.org/pdf/2001.10276v3), Vesselin Dimitrov, Ziyang Gao and Philipp Habegger. Annals of Mathematics 194 (2021), no. 1, 237–298; pinned public PDF. Read: PDF pp.8–13,26–28,41–44 read this job; pp.23–25 reused from the preceding Jacobian pass at the same verified hash. SHA-256 5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4.
- [Heights in families of abelian varieties and the Geometric Bogomolov Conjecture](https://arxiv.org/pdf/1801.05762v3), Ziyang Gao and Philipp Habegger. Annals of Mathematics 189 (2019), no. 2, 527–604; pinned public PDF. Read: PDF pp.1–3,5,15–32; complete local-coordinate, curve-monodromy and full-rank target proof passages. SHA-256 ffe408dc6ba034b2a635488600decace1e89d61ad04860c391bef9409f2fd34e.
- [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1), Michael Lipnowski and Jacob Tsimerman. Duke Mathematical Journal 167(18) (2018), 3403–3453; pinned public PDF. Read: All 38 PDF pages of arXiv v1 read; the final Duke proof was not obtained; accepted route corrections retained. SHA-256 5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a.
- [The Uniform Mordell–Lang Conjecture](https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf), Ziyang Gao, Tangli Ge and Lars Kühne. Publications Mathématiques de l'IHÉS 143 (2026), 189–235; pinned public PDF. Read: PDF pp.15–17 (printed202–204),24–26 (printed211–213); the product/difference citations checked separately in Gao survey. SHA-256 4ee5a38b327807289885a1d7292bddc3341b7fc3e0aa8a3682d995d13237834f.
- [Generic rank of Betti maps and unlikely intersections](https://arxiv.org/pdf/1810.12929v6), Ziyang Gao. arXiv1810.12929v6. Read: PDF pp.1–6,14–29,33–35; the target quotient criterion, closedness and v6 fibre-power induction passages. SHA-256 82f37b3f0357a792bdd9d26bb7cf8b9e644f3339dec4490ee76c1fbab833d1ea.
- [Ax–Schanuel for the universal abelian variety](https://arxiv.org/pdf/1806.01408v2), Ziyang Gao. arXiv1806.01408v2. Read: PDF pp.1–5,16–30; growth, stabilizer, normality, quotient induction and finite-data proof spine; the final finite-data continuation is a named gap. SHA-256 29e85eda3c0f5c92d706ef4b65cb7b8ef92e76fb353a7ada231698f4b617988c.
- [On the lower bound of the number of abelian varieties over F_p](https://arxiv.org/pdf/2002.04420v3), Jungin Lee. arXiv2002.04420v3. Read: PDF pp.1–9; corrected69/4 assembly and repeated-root issue in the claimed45/4 route. SHA-256 2521898dfcd96c22950c026058b0b4e68e147aa89989964649eb317718fbbd3b.
- [Real polynomials with all roots on the unit circle and abelian varieties over finite fields](https://arxiv.org/pdf/math/9803097v3), Stephen A. DiPippo and Everett W. Howe. arXivmath/9803097v3. Read: PDF pp.1–4,13–18; Lemmas2.5.1–2.5.3, ordinary realizability and Theorem1.3 proof including its continuation. SHA-256 e72551cc19790a83c516623dcc618e72765dad3eff083294d64115d3fb4642a4.
- [The ambiguous class number formula revisited](https://arxiv.org/pdf/1309.1071v1), Franz Lemmermeyer. arXiv1309.1071v1. Read: PDF pp.1–3; Proposition1 and its ideal Hilbert90 proof. SHA-256 53a80b00b693203386df6ca3350b4d5891159580037ca72a2096d59776300065.
- [Polarizations](https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf), Brian Conrad. 2004 publicly available notes. Read: PDF pp.6–9; Theorem2.6 finite-field polarization descent proof; no full-ten-page reading claim. SHA-256 7156a718e879f7cc752a460ad61c14dbcfd2978a13149b7024c9809ac487af6b.
- [Endomorphisms of abelian varieties over finite fields](https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf), John Tate. Inventiones Mathematicae2 (1966),134–144. Read: All11 PDF pages, printed134–144; Proposition1 compactness and Proposition2 split-prime proof. SHA-256 47f284526522fb48840e1a1383b9bfc0bfc3f6aded39db6119a34a6e02214b87.
- [Abelian varieties over finite fields](https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf), William C. Waterhouse. Annales ENS2 (1969),521–560. Read: PDF pp.1–20,21,31–32,35; banner+printed521–539,540,550–551,554; Honda existence is stated, not its original proof. SHA-256 7be2bf9dde45454afa3dd9a0ea1ba05acbe952b6b573a0c37c2b1b8f0cccbb47.
- [Abelian varieties over finite fields](https://jmilne.org/math/articles/1971a.pdf), William C. Waterhouse and James S. Milne. 1971, PartII, printed60–61. Read: PDF image pages8–9, printed60–61, personally viewed; PartII p-Tate and local-invariant proofs only. SHA-256 e482e1c60ccd76a068057b18ac28cec02f2746f87048947d8c2a4c328f6c88a8.
- [The Tate–Šafarevič group of a constant abelian variety](https://jmilne.org/math/articles/1968a.pdf), James S. Milne. Inventiones Mathematicae6 (1968),63–84. Read: PDF image pages3–4, printed65–66, personally viewed; degree-length, characteristic polynomial and Frobenius semisimplicity; Lang reference not read. SHA-256 8abdaf4fa604d5ed7faee3f9d4e9dc9382dc35d7b79382fe3540f495fe98fc35.
- [Recent developments of the Uniform Mordell–Lang Conjecture](https://arxiv.org/pdf/2104.03431v5), Ziyang Gao. arXiv2104.03431v5. Read: PDF pp.15–16 and22; Lemma6.2 proof, Theorem6.5 and generic-irreducibility footnote, §8.3 difference application. SHA-256 f210cf079e6a6f361cacec1c262719a23ff190091d4ab62aba777efc44fad8b3.

## Library and supplier boundary

- mathlib:TensorPower (Mathlib/LinearAlgebra/TensorPower/Basic.lean): Native Fin n-indexed PiTensorProduct module, with graded tensor concatenation; concatenation is not shuffle multiplication.
- mathlib:PiTensorProduct.reindex (Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean): Linear equivalence reindexing factors by an index equivalence.
- mathlib:PiTensorProduct.reindex_tprod (Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean): Reindex acts on pure tensors by precomposition with the inverse equivalence.
- mathlib:PiTensorProduct.map_reindex (Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean): Tensor maps commute with reindexing in the specified source and target families.
- mathlib:LinearMap.eqLocus (Mathlib/Algebra/Module/Submodule/EqLocus.lean): Submodule of vectors where two semilinear maps agree.
- mathlib:Submodule.mem_iInf (Mathlib/Algebra/Module/Submodule/Lattice.lean): Membership in a submodule infimum is membership in every constituent.
- mathlib:DividedPowerAlgebra (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean): Existing quotient construction for the divided power algebra; invariant tensors and its free-module comparison are additional targets.
- mathlib:AddCircle (Mathlib/Topology/Instances/AddCircle/Defs.lean): Native additive quotient by integer multiples of a period, used as R/Z; no relative torus bundle is implied.
- mathlib:Polynomial.resultant (Mathlib/RingTheory/Polynomial/Resultant/Basic.lean): Determinant of a Sylvester matrix with optional explicit degree bounds; degree parameters are part of the congruence adapter.
- mathlib:PadicInt.appr_spec (Mathlib/NumberTheory/Padics/RingHoms.lean): For prime p and every n, x−appr(x,n) lies in the ideal generated by p^n.
- tauceti:TauCeti.symmetricTensors (TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean): Degree-two flip-fixed submodule; no all-degree TSym or shuffle algebra is supplied.
- mathlib:PadicInt.valuation (Mathlib/NumberTheory/Padics/PadicIntegers.lean): Natural-valued p-adic valuation, normalized by valuation(p)=1; valuation(0)=0 in this native convention, so the recognition theorem explicitly excludes zero resultants.

Parent A0–A5 presently have no finer packet nodes supplying these requested interfaces. Parent A6 and Rosati use the exact existing nodes. Hodge H.2 and H.3, Logic LD.6 and geometry-of-numbers GN.2/GN.3 requests give exact statements beyond their currently supplied finer nodes. The CFT and semisimple algebra layer IDs are the real atlas IDs; their generic theory is imported rather than replanned. The Néron R11.5 mismatch is recorded separately and supplies no trace edge.

## P0. Symmetric tensors and moment coefficients

Define invariant tensor powers, their shuffle multiplication, divided-power comparison and multigrading. Keep degree completion distinct from an unproved integral augmentation-adic comparison.

### Invariant tensor powers

Declaration AbelianSchemesAndArithmeticModuliPartII:P0/tensor-symmetric-power (definition). For a commutative ring R, an R-module M and n≥0, TSymⁿ_R(M) is the submodule of TensorPower R n M fixed by every permutation of Fin n, acting by PiTensorProduct.reindex. It is an invariant submodule, not the symmetric-power quotient.

Proof/construction spine:

1. Intersect LinearMap.eqLocus(reindex σ,id) over permutations σ.
2. Membership is the family of fixed-point equations using Submodule.mem_iInf.
3. Diagonal pure tensors are fixed by reindex_tprod; restriction of tensor maps uses map_reindex.

Inputs: mathlib:TensorPower; mathlib:PiTensorProduct.reindex; mathlib:LinearMap.eqLocus; mathlib:Submodule.mem_iInf; mathlib:PiTensorProduct.reindex_tprod; mathlib:PiTensorProduct.map_reindex.

API:

- AbelianArithmetic.tensorSymmetricPower_mem (characterisation): t∈TSymⁿ(M) iff reindex σ(t)=t for every σ.
- AbelianArithmetic.tensorSymmetricPower_diagonal (constructor): The pure tensor with every factor v lies in TSymⁿ(M).
- AbelianArithmetic.tensorSymmetricPower_map (functoriality): An R-linear f:M→N induces TSymⁿ(f):TSymⁿ(M)→ₗ[R]TSymⁿ(N) by tensoring every factor.
- AbelianArithmetic.tensorSymmetricPower_ext (extensionality): Two elements of TSymⁿ(M) are equal iff their ambient tensors are equal.

Unit tests:

- AbelianArithmetic.tensorSymmetricPower_zero (degenerate): TSym⁰(M)=⊤ in TensorPower R 0 M.
- AbelianArithmetic.tensorSymmetricPower_one (compatibility): TSym¹(M)=⊤ in TensorPower R 1 M, hence agrees with M through the native singleton tensor equivalence.
- AbelianArithmetic.tensorSymmetricPower_nonfixed (non-example): For M=ℤ² the pure tensor e₀⊗e₁ is not in TSym²(M); swapping it gives e₁⊗e₀, distinguished by the coordinate functional.

Acceptance: For a commutative ring R, an R-module M and n≥0, TSymⁿ_R(M) is the submodule of TensorPower R n M fixed by every permutation of Fin n, acting by PiTensorProduct.reindex. It is an invariant submodule, not the symmetric-power quotient..

Source: KingsSprang, Definition 1.6, pp.8–9.

Routed targets: PAPER-KINGS-SPRANG-25/013.

### Degree completion of symmetric tensors

Declaration AbelianSchemesAndArithmeticModuliPartII:P0/degree-completion (definition). Define the degree-completed module TSym̂_degree(M)=∏_{n≥0} TSymⁿ(M), with the product/degree filtration, and finite truncation ∏_{n≤N}TSymⁿ(M). No identification with I-adic completion over an arbitrary integral base is part of this definition.

Proof/construction spine:

1. Use the native dependent function module over the invariant submodules.
2. Projection to each degree gives compatible finite truncations.
3. An augmentation-adic comparison requires a separate cofinality theorem; in characteristic p do not infer it from factorial denominators.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P0/tensor-symmetric-power.

API:

- AbelianArithmetic.degreeCompletion_component (projection): For c:∏n TSymⁿ(M), component_n(c)=c(n).
- AbelianArithmetic.degreeCompletion_ext (extensionality): c=d iff c(n)=d(n) for every n.
- AbelianArithmetic.degreeCompletion_zero (simp): Every component of the zero completed sequence is zero.

Unit tests:

- AbelianArithmetic.degreeCompletion_zero_component (computation): The component in degree zero of the zero sequence is zero.
- AbelianArithmetic.degreeCompletion_single (characterisation): For a sequence supported in degree n with value x, its n-th component is x and every other component is zero.
- AbelianArithmetic.degreeCompletion_product (compatibility): The carrier and module operations agree with the native dependent Pi module on n↦TSymⁿ(M).

Acceptance: Define the degree-completed module TSym̂_degree(M)=∏_{n≥0} TSymⁿ(M), with the product/degree filtration, and finite truncation ∏_{n≤N}TSymⁿ(M). No identification with I-adic completion over an arbitrary integral base is part of this definition..

Source: KingsSprang, Definition 1.6; equation (2.1.3), pp.8,14.

Routed targets: PAPER-KINGS-SPRANG-25/013.

Exact unresolved inputs:

- Integral completion convention: Prove the topology comparison between degree completion and augmentation-ideal completion under explicit hypotheses, or correct the integral source convention. In particular factorial invertibility is unavailable over F_p. The moment targets use degree truncations and their inverse limit.

### Shuffle multiplication and divided powers

Declaration AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers (construction). For tensors invariant under S_m and S_n, sum over (m,n)-shuffles to obtain TSym^m(M)×TSym^n(M)→TSym^(m+n)(M). It is associative and commutative; diagonal divided tensors satisfy v^[m]v^[n]=binom(m+n,m)v^[m+n] and v^n=n!v^[n].

Proof/construction spine:

1. Partition permutations into shuffle cosets.
2. Use the three-block shuffle bijection for associativity and block exchange for commutativity.
3. Count shuffle cosets on diagonal tensors.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P0/tensor-symmetric-power.

API:

- AbelianArithmetic.tensorSymmetricAlgebra_mul (constructor): On ⊕n TSym^n(M), multiply degree m,n by the sum over (m,n)-shuffles.
- AbelianArithmetic.tensorSymmetricAlgebra_unit (data): The unit is 1 in degree zero, using the native empty tensor equivalence.
- AbelianArithmetic.tensorSymmetricAlgebra_divided (relation): For diagonal tensors v^[n], v^[m]v^[n]=binom(m+n,m)v^[m+n].

Unit tests:

- AbelianArithmetic.tensorSymmetricAlgebra_zero_degree (compatibility): The degree-zero subalgebra is the native base ring R.
- AbelianArithmetic.tensorSymmetricAlgebra_char_two (non-example): For M=F₂·v, the shuffle square v·v is zero, but v^[2] is nonzero; ordinary tensor concatenation would fail this test.
- AbelianArithmetic.tensorSymmetricAlgebra_free (compatibility): For a free module, the construction agrees with the existing DividedPowerAlgebra via the separately planned diagonal comparison.

Acceptance: For tensors invariant under S_m and S_n, sum over (m,n)-shuffles to obtain TSym^m(M)×TSym^n(M)→TSym^(m+n)(M). It is associative and commutative; diagonal divided tensors satisfy v^[m]v^[n]=binom(m+n,m)v^[m+n] and v^n=n!v^[n]..

Source: KingsSprang, Definition 1.6, pp.8–9.

Exact unresolved inputs:

- Shuffle and multigraded comparison: Supply the finite coset decomposition, three-block shuffle bijections and arbitrary-basis graded comparison in the native tensor-power API; the source defines the operations without a complete library proof.

### Comparison with the existing divided power algebra

Declaration AbelianSchemesAndArithmeticModuliPartII:P0/divided-power-comparison (comparison). For a free R-module M, the diagonal divided tensors extend to a graded algebra isomorphism DividedPowerAlgebra R M≃TSym_R(M), using shuffle multiplication. For nonfree M only the natural comparison is asserted, with its universal-property hypotheses.

Proof/construction spine:

1. Use the existing divided-power relations and the shuffle identities.
2. On a basis of M compare both graded bases indexed by finite multi-indices.
3. Prove the construction independent of the chosen basis by naturality.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers; mathlib:DividedPowerAlgebra.

Acceptance: For a free R-module M, the diagonal divided tensors extend to a graded algebra isomorphism DividedPowerAlgebra R M≃TSym_R(M), using shuffle multiplication. For nonfree M only the natural comparison is asserted, with its universal-property hypotheses..

Source: KingsSprang, Definition 1.6, pp.8–9.

Exact unresolved inputs:

- Shuffle and multigraded comparison: Supply the finite coset decomposition, three-block shuffle bijections and arbitrary-basis graded comparison in the native tensor-power API; the source defines the operations without a complete library proof.

### Multigrading of invariant tensors

Declaration AbelianSchemesAndArithmeticModuliPartII:P0/multigrading (lemma). For a finite direct-sum decomposition M=⊕σ Mσ, TSym^k(M)≃⊕_{|α|=k}⊗σ TSym^{α(σ)}(Mσ), and v^[α] is the tensor of its component divided powers.

Proof/construction spine:

1. Distribute tensor powers over the finite direct sum.
2. Group words by multiplicities α.
3. Invariants on each transitive word orbit identify with invariants under its product stabilizer.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P0/tensor-symmetric-power; AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers.

Acceptance: For a finite direct-sum decomposition M=⊕σ Mσ, TSym^k(M)≃⊕_{|α|=k}⊗σ TSym^{α(σ)}(Mσ), and v^[α] is the tensor of its component divided powers..

Source: KingsSprang, Definition 1.6, pp.8–9.

Exact unresolved inputs:

- Shuffle and multigraded comparison: Supply the finite coset decomposition, three-block shuffle bijections and arbitrary-basis graded comparison in the native tensor-power API; the source defines the operations without a complete library proof.

### Agreement with the pinned degree-two invariant submodule

Declaration AbelianSchemesAndArithmeticModuliPartII:P0/degree-two-baseline (comparison). Under the native PiTensorProduct binary tensor equivalence, TSym²_R(M) is TauCeti.symmetricTensors R M, the eqLocus of TensorProduct.comm and identity. This compares invariant submodules; it does not identify the invariant lattice with the coinvariant SymmetricPower quotient integrally.

Proof/construction spine:

1. Fin 2 permutations are identity and transposition.
2. The reindex action of the transposition becomes TensorProduct.comm under the binary tensor equivalence.
3. Compare the two eqLocus submodules by membership.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P0/tensor-symmetric-power; tauceti:TauCeti.symmetricTensors.

Acceptance: Under the native PiTensorProduct binary tensor equivalence, TSym²_R(M) is TauCeti.symmetricTensors R M, the eqLocus of TensorProduct.comm and identity. This compares invariant submodules; it does not identify the invariant lattice with the coinvariant SymmetricPower quotient integrally..

Source: KingsSprang, Definition 1.6; pinned Symmetric.lean, lines78–99.

Exact unresolved inputs:

- Degree-two Tau Ceti prototype: The pinned Tau Ceti source statement is read, but no existing compiled Tau build at f790474 is available here. The comparison signature is omitted rather than imported from a different commit or modelled by a replacement submodule.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:P0 is planned; proof and supplier refinements below prevent a closure claim.

## P1. Universal vector extensions

Represent rigidified line bundles with integrable relative connection by the universal vector extension of the dual abelian scheme. Identify its Hodge and cotangent sequences.

### Universal vector extension of the dual

Declaration AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension (construction). For an abelian scheme A/S in the source noetherian setting, A♮ represents rigidified invertible sheaves L on A_T with integrable T-relative connection satisfying the theorem of the square. The forgetful map p:A♮→A∨ has vector kernel ω_A and universal bundle P♮=(id_A×p)^*P with universal connection. Thus A♮ is the extension of A∨, not A.

Proof/construction spine:

1. Form the fppf moduli functor of pairs (L,∇) with the rigidification.
2. The representing smooth group and universal connection require the Mazur–Messing/Laumon representability input recorded as a gap.
3. Forget ∇ to map to A∨; the kernel is the additive vector group of invariant one-forms.

Inputs: AbelianSchemesAndArithmeticModuli:A0; AbelianSchemesAndArithmeticModuli:A2; AbelianSchemesAndArithmeticModuli:A4.

API:

- AbelianArithmetic.universalVectorExtension_forget (projection): p sends a rigidified pair (L,∇) to the class of L in A∨.
- AbelianArithmetic.universalVectorExtension_kernel (characterisation): ker p is the vector group associated to ω_A.
- AbelianArithmetic.universalVectorExtension_represent (universal-property): Hom_S(T,A♮) is naturally the group of rigidified square-compatible line bundles with integrable relative connection on A_T.
- AbelianArithmetic.universalPoincare_pullback (compatibility): The underlying line bundle of P♮ equals (id×p)^*P with its rigidification.

Unit tests:

- AbelianArithmetic.universalVectorExtension_zero (degenerate): For the zero-dimensional abelian scheme the representing group and vector kernel are trivial.
- AbelianArithmetic.universalVectorExtension_elliptic (computation): For an elliptic scheme the vector kernel has rank one and Lie(A♮) has rank two.
- AbelianArithmetic.universalVectorExtension_dual (compatibility): The forgetful target is the imported dual A∨ and the underlying universal sheaf is the imported Poincaré sheaf, not a newly defined Picard functor.

Acceptance: For an abelian scheme A/S in the source noetherian setting, A♮ represents rigidified invertible sheaves L on A_T with integrable T-relative connection satisfying the theorem of the square. The forgetful map p:A♮→A∨ has vector kernel ω_A and universal bundle P♮=(id_A×p)^*P with universal connection. Thus A♮ is the extension of A∨, not A..

Source: KingsSprang, Notation 2.1–2.2, p.13.

Routed targets: PAPER-KINGS-SPRANG-25/014.

Exact unresolved inputs:

- Vector-extension representability: Read and decompose the Mazur–Messing/Laumon proof of representability, integrable universal connection and vector-kernel identification over the precise noetherian base. Kings–Sprang p.13 cites this input; no full proof in that passage is claimed read.

### Lie and cotangent identifications

Declaration AbelianSchemesAndArithmeticModuliPartII:P1/vector-extension-hodge (comparison). Lie(A♮/S)≃H¹_dR(A/S) identifies 0→ω_A→Lie(A♮)→Lie(A∨)→0 with the Hodge exact sequence. Its dual identifies H=(H¹_dR)∨ with ω_A♮ and the dual Gauss–Manin connection.

Proof/construction spine:

1. Differentiate the universal extension and compare the class with the de Rham extension.
2. Use the imported Hodge sequence and dualize finite locally free modules.
3. Connection compatibility needs the universal-connection construction, not an arbitrary vector-space isomorphism.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension; AbelianSchemesAndArithmeticModuli:A4.

Acceptance: Lie(A♮/S)≃H¹_dR(A/S) identifies 0→ω_A→Lie(A♮)→Lie(A∨)→0 with the Hodge exact sequence. Its dual identifies H=(H¹_dR)∨ with ω_A♮ and the dual Gauss–Manin connection..

Source: KingsSprang, Equation (2.1.1), p.13.

Exact unresolved inputs:

- Hodge identification for the vector extension: Decompose the cited extension/de Rham comparison, including signs, universal class and base change of the connection.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:P1 is planned; proof and supplier refinements below prevent a closure claim.

## P2. Completed Poincaré bundles

Specialize imported formal completion to the unit of a smooth group. Construct moment maps, finite and completed Poincaré sheaves, isogeny functoriality, torsion splittings, equivariance, comultiplication and top cohomology.

### Moments of a formal smooth group

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map (construction). For a smooth commutative group G/S, its unit ideal J has J^n/J^(n+1)≃Sym^n(ω_G). Iterating the coproduct and projecting each factor O_G/J²→ω_G gives mom_n:O_G/J^(n+1)→⊕_{b≤n}TSym^b(ω_G), compatible with truncation; their inverse limit lands in degree completion. Over a Q-algebra the moment maps are isomorphisms.

Proof/construction spine:

1. Import formal infinitesimal thickenings from SF.4; the formal functor is the filtered union of the thickenings while its coordinate ring is an inverse limit.
2. Use smoothness for the conormal associated-graded comparison.
3. Cocommutativity makes the iterated linear projection invariant; on degree n its comparison is multiplication by n!, proving the characteristic-zero isomorphism.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P0/tensor-symmetric-power; AbelianSchemesAndArithmeticModuliPartII:P0/degree-completion; SchemeAndStackFoundations:SF.4.

API:

- AbelianArithmetic.momentMap_truncate (functoriality): Projection from the n-th to the m-th formal neighborhood commutes with moments for m≤n.
- AbelianArithmetic.momentMap_degree_one (projection): The degree-one component is the canonical projection O_G/J²→ω_G.
- AbelianArithmetic.momentMap_functorial (compatibility): A homomorphism of smooth commutative groups commutes with moments through its invariant cotangent map.

Unit tests:

- AbelianArithmetic.momentMap_zero (degenerate): At n=0 the moment map is the identity of O_S.
- AbelianArithmetic.momentMap_additive_char_zero (computation): For G_a over a Q-algebra, x^n maps to n! times the nth invariant divided tensor.
- AbelianArithmetic.momentMap_additive_char_p (non-example): For G_a over F_p, the degree-p associated-graded map sends x^p to zero because p!=0; the integral moment map is not automatically an isomorphism.

Acceptance: For a smooth commutative group G/S, its unit ideal J has J^n/J^(n+1)≃Sym^n(ω_G). Iterating the coproduct and projecting each factor O_G/J²→ω_G gives mom_n:O_G/J^(n+1)→⊕_{b≤n}TSym^b(ω_G), compatible with truncation; their inverse limit lands in degree completion. Over a Q-algebra the moment maps are isomorphisms..

Source: KingsSprang, Equations (2.1.2)–(2.1.3), Remark 2.3, p.14.

Exact unresolved inputs:

- Conormal and finite-level moment proof: Decompose the smooth conormal isomorphism and verify the n!-scaled associated-graded formula in the actual sheaf and tensor APIs; the characteristic-zero conclusion may not be asserted integrally.

### Fourier–Mukai input for completed Poincaré cohomology

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input (lemma). For A/S of relative dimension d, the normalized Poincaré transform and its derived completion at the dual unit must identify Rπ_*(P_hat⊗Ω^d) with O_S[−d]. This statement includes derived-limit and ordinary-limit comparison, not merely finite-level cohomology.

Proof/construction spine:

1. Theorem 2.15 is read as a statement in Kings–Sprang.
2. Request proper derived pushforward, duality and inverse-limit comparison from SF.2.
3. The Poincaré transform computation and its normalization are a distinct geometric gap; no vanishing theorem is inferred just from the name Fourier–Mukai.

Inputs: AbelianSchemesAndArithmeticModuli:A2; SchemeAndStackFoundations:SF.2.

Acceptance: For A/S of relative dimension d, the normalized Poincaré transform and its derived completion at the dual unit must identify Rπ_*(P_hat⊗Ω^d) with O_S[−d]. This statement includes derived-limit and ordinary-limit comparison, not merely finite-level cohomology..

Source: KingsSprang, Theorem 2.15 and Remark 2.16, p.18.

Exact unresolved inputs:

- Completed Poincaré cohomology computation: Supply the normalized Poincaré Fourier–Mukai calculation and the exact limit exchange yielding O_S in degree d and zero elsewhere; the cited proof was not obtained.

### Completed sheaves and the completed Poincaré bundles 𝒫̂, 𝒫̂^♮

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/completed-poincare (definition). For coherent ℱ on 𝒢, ℱ̂ = e^{-1}(lim ℱ ⊗ 𝒪_𝒢/𝒥^{n+1}) ≅ ι^*_{𝒢̂}ℱ and ℱ^{(n)} = e^{-1}(ℱ ⊗ 𝒪_𝒢/𝒥^{n+1}) (Definition 2.4). 𝒫̂ = (id × e^∨)^{-1}(lim 𝒫 ⊗ 𝒪_{𝒜×𝒜^{∨(n)}}), an 𝒪_{𝒜×𝒜̂^∨}-module on 𝒜, with 𝒫^{(n)} = (id × π^{∨(n)})_*(𝒫|_{𝒜×𝒜^{∨(n)}}); likewise 𝒫^{♮(n)}, 𝒫̂^♮ with the relative connection ∇ (Definition 2.7). The rigidifications give 𝒫^{(0)} ≅ 𝒪_𝒜, exact sequences 0 → π^*Sym^n(ω_{𝒜^∨}) → 𝒫^{(n)} → 𝒫^{(n−1)} → 0 and 0 → π^*Sym^n(ℋ) → 𝒫^{♮(n)} → 𝒫^{♮(n−1)} → 0, compatible sections 1^{(n)} and 1 : 𝒪_𝒮 → e^*𝒫̂ ≅ 𝒪_{𝒜̂^∨} (equation (2.1.4)), and 𝒫^{(n)} → 𝒫^{♮(n)} ≅ 𝒫^{(n)} ⊗ 𝒪_{𝒜×𝒜^{♮(n)}} (equation (2.1.5)). Completion is along the dual unit and uses the inverse system of finite pushforwards; arbitrary tensor interchange with the limit is not asserted.

Proof/construction spine:

1. Construct the object on the imported carriers in the convention fixed in the statement.
2. Verify the data/projection equations and the three tests below before exposing the interface.
3. The exact geometric or algebraic adapter absent from the pinned libraries is recorded in the accompanying gap; this target-level node does not assert an implementation.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension; AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map.

API:

- AbelianArithmetic.completedPoincare_truncate (projection): P_hat→P(n) is the projection to the n-th infinitesimal dual neighborhood, and similarly for P♮.
- AbelianArithmetic.completedPoincare_unit (data): Rigidification gives the compatible unit sections O_S→e^*P(n).
- AbelianArithmetic.completedPoincare_filtration (structure): The nth kernel is π^*Sym^n(ω_A∨), respectively π^*Sym^n(H) in the connection version.

Unit tests:

- AbelianArithmetic.completedPoincare_zero (degenerate): P(0)≃O_A and P♮(0)≃O_A with trivial relative connection.
- AbelianArithmetic.completedPoincare_first (characterisation): P(1) is an extension of O_A by π^*ω_A∨ with the imported unit rigidification.
- AbelianArithmetic.completedPoincare_base (compatibility): At every finite level the underlying sheaf is pushforward of the imported rigidified Poincaré sheaf restricted to A×A∨(n), rather than a tensor-power replacement.

Acceptance: For coherent ℱ on 𝒢, ℱ̂ = e^{-1}(lim ℱ ⊗ 𝒪_𝒢/𝒥^{n+1}) ≅ ι^*_{𝒢̂}ℱ and ℱ^{(n)} = e^{-1}(ℱ ⊗ 𝒪_𝒢/𝒥^{n+1}) (Definition 2.4). 𝒫̂ = (id × e^∨)^{-1}(lim 𝒫 ⊗ 𝒪_{𝒜×𝒜^{∨(n)}}), an 𝒪_{𝒜×𝒜̂^∨}-module on 𝒜, with 𝒫^{(n)} = (id × π^{∨(n)})_*(𝒫|_{𝒜×𝒜^{∨(n)}}); likewise 𝒫^{♮(n)}, 𝒫̂^♮ with the relative connection ∇ (Definition 2.7). The rigidifications give 𝒫^{(0)} ≅ 𝒪_𝒜, exact sequences 0 → π^*Sym^n(ω_{𝒜^∨}) → 𝒫^{(n)} → 𝒫^{(n−1)} → 0 and 0 → π^*Sym^n(ℋ) → 𝒫^{♮(n)} → 𝒫^{♮(n−1)} → 0, compatible sections 1^{(n)} and 1 : 𝒪_𝒮 → e^*𝒫̂ ≅ 𝒪_{𝒜̂^∨} (equation (2.1.4)), and 𝒫^{(n)} → 𝒫^{♮(n)} ≅ 𝒫^{(n)} ⊗ 𝒪_{𝒜×𝒜^{♮(n)}} (equation (2.1.5)). Completion is along the dual unit and uses the inverse system of finite pushforwards; arbitrary tensor interchange with the limit is not asserted..

Source: KingsSprang, Definition 2.4, p. 14; Definition 2.7, p. 15; equations (2.1.4)–(2.1.5), pp. 15–16.

Routed targets: PAPER-KINGS-SPRANG-25/016.

Exact unresolved inputs:

- Interface proof: Completed sheaves and the completed Poincaré bundles 𝒫̂, 𝒫̂^♮: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: P(0)≃O_A and P♮(0)≃O_A with trivial relative connection.; P(1) is an extension of O_A by π^*ω_A∨ with the imported unit rigidification.; At every finite level the underlying sheaf is pushforward of the imported rigidified Poincaré sheaf restricted to A×A∨(n), rather than a tensor-power replacement.. The source passage is read; its library adapter and any cited external proof remain unresolved.

### Functoriality of the completed Poincaré bundle for isogenies (Theorem 2.8)

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality (theorem). For an isogeny φ : 𝒜 → ℬ, the isomorphisms (φ × id)^*𝒫_ℬ ≅ (id × φ^∨)^*𝒫_𝒜 and their ♮-versions (equation (2.2.1)) give canonical maps φ^{(n)}_# : 𝒫^{(n)}_𝒜 → φ^*𝒫^{(n)}_ℬ and 𝒫^{♮(n)}_𝒜 → φ^*𝒫^{♮(n)}_ℬ, isomorphisms if φ^∨ (resp. φ^♮) is étale (e.g. if deg φ is invertible), and in the limit φ_# : 𝒫̂_𝒜 → φ^*𝒫̂_ℬ, 𝒫̂^♮_𝒜 → φ^*𝒫̂^♮_ℬ.

Proof/construction spine:

1. Pull back the imported Poincaré biextension along φ and φ∨.
2. Restrict to each dual infinitesimal neighborhood and push forward to A.
3. Étaleness of the dual gives an isomorphism of its formal neighborhoods; pass to the compatible inverse system.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P2/completed-poincare; AbelianSchemesAndArithmeticModuli:A3.

Acceptance: For an isogeny φ : 𝒜 → ℬ, the isomorphisms (φ × id)^*𝒫_ℬ ≅ (id × φ^∨)^*𝒫_𝒜 and their ♮-versions (equation (2.2.1)) give canonical maps φ^{(n)}_# : 𝒫^{(n)}_𝒜 → φ^*𝒫^{(n)}_ℬ and 𝒫^{♮(n)}_𝒜 → φ^*𝒫^{♮(n)}_ℬ, isomorphisms if φ^∨ (resp. φ^♮) is étale (e.g. if deg φ is invertible), and in the limit φ_# : 𝒫̂_𝒜 → φ^*𝒫̂_ℬ, 𝒫̂^♮_𝒜 → φ^*𝒫̂^♮_ℬ..

Source: KingsSprang, Theorem 2.8, p. 16; equation (2.2.1), p. 16.

Routed targets: PAPER-KINGS-SPRANG-25/017.

### The splitting principle (Corollary 2.9, Definition 2.10)

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/torsion-splitting (theorem). For an isogeny φ : 𝒜 → ℬ and a φ-torsion section x, φ_# induces φ_{#x} : x^*𝒫̂_𝒜 → x^*φ^*𝒫̂_ℬ ≅ e^*𝒫̂_ℬ ≅ 𝒪_{ℬ̂^∨}; if φ^∨ is étale, 𝒫̂_𝒜|_{ker φ} ≅ π^*_{ker φ}𝒪_{ℬ̂^∨} and there is a canonical ϱ_x : x^*𝒫̂_𝒜 ≅ 𝒪_{𝒜̂^∨}; the same for 𝒫̂^♮ when φ^♮ is étale. Composing with the moment map gives _ϱmom_x : x^*𝒫̂_𝒜 → TSym^̂(ω_{𝒜^∨}) and x^*𝒫̂^♮_𝒜 → TSym^̂(ℋ), with components _ϱmom^b_x.

Proof/construction spine:

1. Evaluate φ_# at a φ-torsion section x and use the unit rigidification on B.
2. Use the étale-dual inverse to obtain ρ_x with independence of the killing isogeny.
3. Compose this splitting with the moment map to define ρmom_x, rather than identifying the two maps.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality; AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map.

Acceptance: For an isogeny φ : 𝒜 → ℬ and a φ-torsion section x, φ_# induces φ_{#x} : x^*𝒫̂_𝒜 → x^*φ^*𝒫̂_ℬ ≅ e^*𝒫̂_ℬ ≅ 𝒪_{ℬ̂^∨}; if φ^∨ is étale, 𝒫̂_𝒜|_{ker φ} ≅ π^*_{ker φ}𝒪_{ℬ̂^∨} and there is a canonical ϱ_x : x^*𝒫̂_𝒜 ≅ 𝒪_{𝒜̂^∨}; the same for 𝒫̂^♮ when φ^♮ is étale. Composing with the moment map gives _ϱmom_x : x^*𝒫̂_𝒜 → TSym^̂(ω_{𝒜^∨}) and x^*𝒫̂^♮_𝒜 → TSym^̂(ℋ), with components _ϱmom^b_x..

Source: KingsSprang, Corollary 2.9, p. 17; Definition 2.10, p. 17.

Routed targets: PAPER-KINGS-SPRANG-25/018.

### Γ-equivariance of the completed Poincaré bundle (Corollary 2.11)

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/gamma-equivariance (theorem). If a discrete group Γ acts on 𝒜/𝒮 by automorphisms, (γ_#)^{-1} : γ^*𝒫̂ ≅ 𝒫̂ and γ^*𝒫̂^♮ ≅ 𝒫̂^♮ make 𝒫̂ and 𝒫̂^♮ Γ-equivariant sheaves.

Proof/construction spine:

1. For each γ take the inverse of γ_#:γ^*P_hat→P_hat.
2. Use identity/composition coherence of the Poincaré functoriality to verify the cocycle equation.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality; SchemeAndStackFoundations:SF.2.

Acceptance: If a discrete group Γ acts on 𝒜/𝒮 by automorphisms, (γ_#)^{-1} : γ^*𝒫̂ ≅ 𝒫̂ and γ^*𝒫̂^♮ ≅ 𝒫̂^♮ make 𝒫̂ and 𝒫̂^♮ Γ-equivariant sheaves..

Source: KingsSprang, Corollary 2.11, p. 17.

Routed targets: PAPER-KINGS-SPRANG-25/019.

### Comultiplication on the completed Poincaré bundle (Proposition 2.12, Corollary 2.14)

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/poincare-comultiplication (theorem). There are canonical 𝒫^{(n+m)} → 𝒫^{(n)} ⊗_{𝒪_𝒜} 𝒫^{(m)} and 𝒫̂ → 𝒫̂ ⊗̂ 𝒫̂, co-commutative, whose associated graded is induced by the diagonal of ω_{𝒜^∨} (Proposition 2.12, reflecting the partial group law of the Poincaré torsor, Remark 2.13); likewise for 𝒫^♮. Hence 𝒫^{(n)} → TSym^n_{𝒪_𝒜}(𝒫^{(1)}) and 𝒫^{♮(n)} → TSym^n(𝒫^{♮(1)}), isomorphisms if n! is invertible on 𝒮 (Corollary 2.14).

Proof/construction spine:

1. Use the partial group law of the Poincaré torsor to obtain the finite-level maps.
2. Prove coassociativity, cocommutativity and the diagonal associated-graded formula.
3. The map P(n)→TSym^n(P(1)) is an isomorphism when n! is invertible; integral injectivity requires that n! be a nonzerodivisor.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality; AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers.

Acceptance: There are canonical 𝒫^{(n+m)} → 𝒫^{(n)} ⊗_{𝒪_𝒜} 𝒫^{(m)} and 𝒫̂ → 𝒫̂ ⊗̂ 𝒫̂, co-commutative, whose associated graded is induced by the diagonal of ω_{𝒜^∨} (Proposition 2.12, reflecting the partial group law of the Poincaré torsor, Remark 2.13); likewise for 𝒫^♮. Hence 𝒫^{(n)} → TSym^n_{𝒪_𝒜}(𝒫^{(1)}) and 𝒫^{♮(n)} → TSym^n(𝒫^{♮(1)}), isomorphisms if n! is invertible on 𝒮 (Corollary 2.14)..

Source: KingsSprang, Proposition 2.12, p. 17; Remark 2.13, p. 18; Corollary 2.14, p. 18.

Routed targets: PAPER-KINGS-SPRANG-25/020.

### Vanishing of the cohomology of 𝒫̂ ⊗ Ω^d (Theorem 2.15)

Declaration AbelianSchemesAndArithmeticModuliPartII:P2/completed-cohomology (theorem). R^iπ_*(𝒫̂ ⊗ Ω^d_{𝒜/𝒮}) ≅ 𝒪_𝒮 for i = d and 0 for i ≠ d (from the known higher direct images of the Poincaré bundle); a similar result holds for 𝒫^♮ over a field of characteristic zero (Scheider, Theorem 1.2.1; Remark 2.16).

Proof/construction spine:

1. Apply the separately requested Poincaré transform computation.
2. Use the derived/ordinary completion comparison to read its cohomology in degree d.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input.

Acceptance: R^iπ_*(𝒫̂ ⊗ Ω^d_{𝒜/𝒮}) ≅ 𝒪_𝒮 for i = d and 0 for i ≠ d (from the known higher direct images of the Poincaré bundle); a similar result holds for 𝒫^♮ over a field of characteristic zero (Scheider, Theorem 1.2.1; Remark 2.16)..

Source: KingsSprang, Theorem 2.15, p. 18; Remark 2.16, p. 18.

Routed targets: PAPER-KINGS-SPRANG-25/021.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:P2 is planned; proof and supplier refinements below prevent a closure claim.

## P3. Logarithm and smooth realizations

Identify the characteristic-zero logarithm sheaf with the completed universal connection. Give the smooth d+ν model and the Dolbeault comparison with its precise analytic prerequisites.

### Square-zero deformation and the logarithm class

Declaration AbelianSchemesAndArithmeticModuliPartII:P3/square-zero-extension-class (lemma). For S=Spec k, char k=0, and finite-dimensional M, the universal connection identifies ker(A♮(k⊕M)→A♮(k))≃Lie(A♮)⊗M≃Hom(H,M) with Ext¹ of O_A by π^*M in integrable connections, compatibly with the split unit. Taking M=H and id_H gives Log¹.

Proof/construction spine:

1. Use the square-zero tangent description of the representing group.
2. Pull back the universal line bundle with connection along its infinitesimal points.
3. Identify the Ext class and its sign with id_H; the cited Mazur–Messing formula is an explicit gap.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension; AbelianSchemesAndArithmeticModuliPartII:P1/vector-extension-hodge.

Acceptance: For S=Spec k, char k=0, and finite-dimensional M, the universal connection identifies ker(A♮(k⊕M)→A♮(k))≃Lie(A♮)⊗M≃Hom(H,M) with Ext¹ of O_A by π^*M in integrable connections, compatibly with the split unit. Taking M=H and id_H gives Log¹..

Source: KingsSprang, Equations (2.7.1)–(2.7.2), Theorem 2.36, pp.28–29.

Exact unresolved inputs:

- Square-zero Ext comparison: Read and decompose Mazur–Messing (4.1.4), including the connection category, the local-to-global Ext sequence and compatibility with the unit splitting. Do not generalize the proof to every vector bundle.

### The smooth d+ν connection

Declaration AbelianSchemesAndArithmeticModuliPartII:P3/smooth-connection-calculation (lemma). Over C, for the Hodge/CM component conventions of §3.1, ν is the identity tensor in H⊗(ω⊕conj ω). On ⊕_{k≤n}TSym^k(H) the connection d+ν has the same rigidified first extension as P♮(1) and induces the higher symmetric constructions.

Proof/construction spine:

1. Choose the dual Lie bases in Definition 3.3.
2. Compute the (1,0) and (0,1) components of ν with the source Hodge splitting.
3. Compare the first extension and propagate by factorial-invertible symmetric powers, retaining the unit.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P3/square-zero-extension-class; AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers; AbelianSchemesAndArithmeticModuli:A5.

Acceptance: Over C, for the Hodge/CM component conventions of §3.1, ν is the identity tensor in H⊗(ω⊕conj ω). On ⊕_{k≤n}TSym^k(H) the connection d+ν has the same rigidified first extension as P♮(1) and induces the higher symmetric constructions..

Source: KingsSprang, Definitions 3.2–3.3, Theorem 3.5, pp.30–32.

Exact unresolved inputs:

- Smooth differential-form dictionary: Provide actual smooth bundle-valued forms and the algebraic/analytic connection dictionary, with curvature computation for d+ν. The identity tensor does not by itself supply a flat bundle formalization.

### The completed Poincaré bundle with connection is the logarithm sheaf (Scheider)

Declaration AbelianSchemesAndArithmeticModuliPartII:P3/logarithm-comparison (theorem). For 𝒮 = Spec k with k of characteristic zero: the first logarithm sheaf is the extension of 𝒟_𝒜-modules 0 → π^*ℋ → Log^{(1)} → 𝒪_𝒜 → 0 mapping to id_ℋ under the local-to-global sequence 0 → Ext^1_{𝒟_𝒮}(𝒪_𝒮, ℋ) → Ext^1_{𝒟_𝒜}(𝒪_𝒜, π^*ℋ) → Hom_{𝒟_𝒮}(ℋ, ℋ) → 0 (equation (2.7.1)), with a fixed splitting 1^{(1)} : e^*Log^{(1)} ≅ 𝒪_𝒮 ⊕ ℋ; Log^{(n)} = Sym^n Log^{(1)} and 𝓛og = lim Log^{(n)} (Huber–Kings). Theorem 2.36 (Scheider, Theorem 2.3.1): there is a canonical isomorphism (Log^{(1)}, ∇, 1^{(1)}) ≅ (𝒫^{♮(1)}, ∇, 1^{(1)}), hence 𝓛og ≅ 𝒫̂^♮ respecting the sections 1 along e. The proof identifies ker(𝒜^♮(𝒮[M]) → 𝒜^♮(𝒮)) = Lie(𝒜^♮/𝒮) ⊗ M ≅ Hom_k(ℋ, M) (Mazur–Messing (4.1.4); equation (2.7.2)) with Ext^1_{𝒟_𝒜}(𝒪_𝒜, π^*M) through pullback of 𝒫^♮. The base here is Spec k with char k=0; no arbitrary-base version is inferred.

Proof/construction spine:

1. Identify the rigidified first extension with the identity Ext class.
2. Take factorial-invertible symmetric powers and compatible unit splittings.
3. Pass to the inverse system and retain its connection.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P3/square-zero-extension-class; AbelianSchemesAndArithmeticModuliPartII:P2/poincare-comultiplication.

Acceptance: For 𝒮 = Spec k with k of characteristic zero: the first logarithm sheaf is the extension of 𝒟_𝒜-modules 0 → π^*ℋ → Log^{(1)} → 𝒪_𝒜 → 0 mapping to id_ℋ under the local-to-global sequence 0 → Ext^1_{𝒟_𝒮}(𝒪_𝒮, ℋ) → Ext^1_{𝒟_𝒜}(𝒪_𝒜, π^*ℋ) → Hom_{𝒟_𝒮}(ℋ, ℋ) → 0 (equation (2.7.1)), with a fixed splitting 1^{(1)} : e^*Log^{(1)} ≅ 𝒪_𝒮 ⊕ ℋ; Log^{(n)} = Sym^n Log^{(1)} and 𝓛og = lim Log^{(n)} (Huber–Kings). Theorem 2.36 (Scheider, Theorem 2.3.1): there is a canonical isomorphism (Log^{(1)}, ∇, 1^{(1)}) ≅ (𝒫^{♮(1)}, ∇, 1^{(1)}), hence 𝓛og ≅ 𝒫̂^♮ respecting the sections 1 along e. The proof identifies ker(𝒜^♮(𝒮[M]) → 𝒜^♮(𝒮)) = Lie(𝒜^♮/𝒮) ⊗ M ≅ Hom_k(ℋ, M) (Mazur–Messing (4.1.4); equation (2.7.2)) with Ext^1_{𝒟_𝒜}(𝒪_𝒜, π^*M) through pullback of 𝒫^♮. The base here is Spec k with char k=0; no arbitrary-base version is inferred..

Source: KingsSprang, Section 2.7, p. 28; equation (2.7.1), p. 28; Theorem 2.36, p. 28; equation (2.7.2), p. 29.

Routed targets: PAPER-KINGS-SPRANG-25/022.

### The C^∞ description of the completed Poincaré bundle (Theorem 3.5)

Declaration AbelianSchemesAndArithmeticModuliPartII:P3/smooth-dolbeault (theorem). Over ℂ, with ℂ-bases (ū_1, …, ū_d, u_1, …, u_d) of ℋ ≅ conj(Lie(𝒜/ℂ)) ⊕ Lie(𝒜/ℂ) dual to ∂/∂z̄_i, ∂/∂z_i (Definition 3.3), ν = ν^{1,0} + ν^{0,1} ∈ ℋ ⊗ (ω ⊕ ω̄) the identity (Definition 3.2), and the smooth pro-bundles 𝒫^{(n)}, 𝒫^{♮(n)} ⊗ 𝒞^∞ (Notation 3.4): there is a compatible system of horizontal isomorphisms (𝒫^{♮(n)}, ∇_{𝒞^∞}) ≅ (⊕_{k≤n} TSym^k(ℋ), d + ν) restricting to 𝒫^{(n)} ≅ ⊕_{k≤n} TSym^k(ℋ(Σ̄)) and compatible with the moment map along e. Corollary 3.6: 𝒫^{(n),an}[0] ≅ (𝒫^{(n)} ⊗ ℰ^{0,•}, ∇″) and (𝒫^{(n),an} ⊗ Ω^p)[0] ≅ (𝒫^{(n)} ⊗ ℰ^{p,•}, ∇″) (Dolbeault resolutions).

Proof/construction spine:

1. Compute the first extension in the smooth Hodge bases.
2. Propagate the d+ν model to all finite symmetric levels.
3. The Dolbeault resolution requires the analytic bundle-valued ∂bar Poincaré lemma; request that input rather than asserting a resolution of an arbitrary sheaf.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P3/smooth-connection-calculation; AbelianSchemesAndArithmeticModuliPartII:P3/logarithm-comparison; ComplexComparisonPartII:C0.

Acceptance: Over ℂ, with ℂ-bases (ū_1, …, ū_d, u_1, …, u_d) of ℋ ≅ conj(Lie(𝒜/ℂ)) ⊕ Lie(𝒜/ℂ) dual to ∂/∂z̄_i, ∂/∂z_i (Definition 3.3), ν = ν^{1,0} + ν^{0,1} ∈ ℋ ⊗ (ω ⊕ ω̄) the identity (Definition 3.2), and the smooth pro-bundles 𝒫^{(n)}, 𝒫^{♮(n)} ⊗ 𝒞^∞ (Notation 3.4): there is a compatible system of horizontal isomorphisms (𝒫^{♮(n)}, ∇_{𝒞^∞}) ≅ (⊕_{k≤n} TSym^k(ℋ), d + ν) restricting to 𝒫^{(n)} ≅ ⊕_{k≤n} TSym^k(ℋ(Σ̄)) and compatible with the moment map along e. Corollary 3.6: 𝒫^{(n),an}[0] ≅ (𝒫^{(n)} ⊗ ℰ^{0,•}, ∇″) and (𝒫^{(n),an} ⊗ Ω^p)[0] ≅ (𝒫^{(n)} ⊗ ℰ^{p,•}, ∇″) (Dolbeault resolutions)..

Source: KingsSprang, Definition 3.2, p. 30; Definition 3.3, p. 31; Notation 3.4, p. 31; Theorem 3.5, p. 32; Corollary 3.6, p. 33.

Routed targets: PAPER-KINGS-SPRANG-25/023.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:P3 is planned; proof and supplier refinements below prevent a closure claim.

## P4. Ordinary CM formal trivializations

Use a noetherian CM model and completed base change to O_Cp. Construct integral ordinary formal trivialization, the projected connection and each translation compatibility.

### Ordinary CM completion and completed base change

Declaration AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-completed-base-change (lemma). Start with the noetherian CM model of Notation 5.1 and an ordinary CM type at p. Base change and complete over O_Cp; its ordinary connected p-divisible subgroup is the formal part used in the infinitesimal trivialization. No noetherian assertion about O_Cp is used.

Proof/construction spine:

1. Import the connected–étale and CM ordinary p-divisible splitting from A4 and R07.1.
2. Prove the identification of the formal functor with the filtered union of finite connected torsion thickenings.
3. Use completed tensor products in the formal coefficient ring; ordinary tensor base change of an inverse limit needs a separate theorem.

Inputs: AbelianSchemesAndArithmeticModuli:A4; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1.

Acceptance: Start with the noetherian CM model of Notation 5.1 and an ordinary CM type at p. Base change and complete over O_Cp; its ordinary connected p-divisible subgroup is the formal part used in the infinitesimal trivialization. No noetherian assertion about O_Cp is used..

Source: KingsSprang, Notation 5.1, Proposition 5.9, pp.54–55,59–60.

Exact unresolved inputs:

- Completed O_Cp base change: Verify the chosen noetherian-model completion, the formal-group identification and coefficient-ring completed tensor comparison used in Proposition 5.9; do not treat O_Cp as noetherian.

### Infinitesimal trivialization of the Poincaré bundle over 𝒪_{ℂ_p} (Proposition 5.9, Lemma 5.11)

Declaration AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization (theorem). For 𝒜 over 𝒪_{ℂ_p} as in Notation 5.1 (CM by 𝒪_L with p-ordinary CM type), let C_n = 𝒜[𝔭_Σ^n], so that lim C_n = 𝒜̂; since [𝔭_Σ^n]^∨ is étale, the splitting principle applied to the diagonal section of 𝒜 × C_n gives a canonical isomorphism 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Proposition 5.9, after Norman's p-adic theta functions). Hence 𝒫^{(1)}|_{𝒜̂} ≅ 𝒪_{𝒜̂} ⊗ (𝒪_{ℂ_p} ⊕ ω_{𝒜^∨}), 𝒫^{♮(1)}|_{𝒜̂} ≅ 𝒪_{𝒜̂} ⊗ (𝒪_{ℂ_p} ⊕ ℋ) and injections 𝒫̂^♮|_{𝒜̂} ↪ 𝒪_{𝒜̂} ⊗̂ TSym^̂(ℋ), 𝒫̂|_{𝒜̂} ↪ 𝒪_{𝒜̂} ⊗̂ TSym^̂(ω_{𝒜^∨}) (equations (5.2.1)–(5.2.4)). On the generic fibre A (Notation 5.10), Lemma 5.11: these become isomorphisms, the splitting of the Hodge filtration gives an 𝒪_Â-linear retraction p of i : 𝒫̂_{ℂ_p}|_Â ↪ 𝒫̂^♮_{ℂ_p}|_Â, and p ∘ ∇ ∘ i corresponds to d ⊗ id on 𝒪_{(A×A^∨)^∧} (equation (5.2.5)); the proof shows the ℋ(Σ)-component η_Σ of ∇(e^{(1)}) satisfies p^2η_Σ = pη_Σ, using [p]_♯.

Proof/construction spine:

1. Apply torsion splitting to the diagonal sections of the ordinary connected CM kernels whose duals are étale.
2. Take the formal coefficient limit with completed tensor products.
3. On the generic fibre use the moment isomorphism and the Hodge retraction p; the p²η=pη calculation kills the unwanted component of ∇.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-completed-base-change; AbelianSchemesAndArithmeticModuliPartII:P2/torsion-splitting; AbelianSchemesAndArithmeticModuliPartII:P3/smooth-connection-calculation.

Acceptance: For 𝒜 over 𝒪_{ℂ_p} as in Notation 5.1 (CM by 𝒪_L with p-ordinary CM type), let C_n = 𝒜[𝔭_Σ^n], so that lim C_n = 𝒜̂; since [𝔭_Σ^n]^∨ is étale, the splitting principle applied to the diagonal section of 𝒜 × C_n gives a canonical isomorphism 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Proposition 5.9, after Norman's p-adic theta functions). Hence 𝒫^{(1)}|_{𝒜̂} ≅ 𝒪_{𝒜̂} ⊗ (𝒪_{ℂ_p} ⊕ ω_{𝒜^∨}), 𝒫^{♮(1)}|_{𝒜̂} ≅ 𝒪_{𝒜̂} ⊗ (𝒪_{ℂ_p} ⊕ ℋ) and injections 𝒫̂^♮|_{𝒜̂} ↪ 𝒪_{𝒜̂} ⊗̂ TSym^̂(ℋ), 𝒫̂|_{𝒜̂} ↪ 𝒪_{𝒜̂} ⊗̂ TSym^̂(ω_{𝒜^∨}) (equations (5.2.1)–(5.2.4)). On the generic fibre A (Notation 5.10), Lemma 5.11: these become isomorphisms, the splitting of the Hodge filtration gives an 𝒪_Â-linear retraction p of i : 𝒫̂_{ℂ_p}|_Â ↪ 𝒫̂^♮_{ℂ_p}|_Â, and p ∘ ∇ ∘ i corresponds to d ⊗ id on 𝒪_{(A×A^∨)^∧} (equation (5.2.5)); the proof shows the ℋ(Σ)-component η_Σ of ∇(e^{(1)}) satisfies p^2η_Σ = pη_Σ, using [p]_♯..

Source: KingsSprang, Proposition 5.9, p. 59; equations (5.2.1)–(5.2.4), p. 60; Notation 5.10, p. 60; Lemma 5.11, p. 60.

Routed targets: PAPER-KINGS-SPRANG-25/024.

Exact unresolved inputs:

- Ordinary connection and translation compatibility: Split Lemma 5.14 into its three diagram calculations on the completed coefficients, and prove each after the ordinary splitting and Hodge projection are constructed. Obtain and compare the Sprang elliptic sources (2019 and 2020) and the product-of-two-elliptic-curves example; those papers are not claimed read.

### Translation invariance and the trivializations ϱ̂_y (Lemmas 5.12, 5.14; Definition 5.13)

Declaration AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization (theorem). For y ∈ 𝒜(𝒪_{ℂ_p}) in the kernel of an isogeny φ with étale dual, T_y^*𝒫̂ ≅ 𝒫̂ (always on the generic fibre; Lemma 5.12), and ϱ̂_y : T_y^*𝒫̂|_{𝒜̂} ≅ 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Definition 5.13). Lemma 5.14: (1) mom_{Â^∨} ∘ e^*ϱ̂_y = ϱ_y; (2) ϱ̂_y ∘ p ∘ ∇ ∘ i = d_Â ∘ ϱ̂_y; (3) for s ∈ 𝒜̂[p^n](𝒪_{ℂ_p}) = 𝒜[𝔭_Σ^n](𝒪_{ℂ_p}), translation by s intertwines ϱ̂_y and ϱ̂_{y+s} with (T_s × id)^* (integrally). Integral translation assumes y killed by an isogeny with étale dual; the generic-fibre extension here is for torsion y, not for every point.

Proof/construction spine:

1. Apply the Poincaré partial group law and the torsion splitting to T_y.
2. At the unit compare the moment-composed splitting, not the bare ρ_x.
3. Prove the projected connection identity and then the integral connected-torsion translation identity.

Inputs: AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization; AbelianSchemesAndArithmeticModuliPartII:P2/torsion-splitting.

Acceptance: For y ∈ 𝒜(𝒪_{ℂ_p}) in the kernel of an isogeny φ with étale dual, T_y^*𝒫̂ ≅ 𝒫̂ (always on the generic fibre; Lemma 5.12), and ϱ̂_y : T_y^*𝒫̂|_{𝒜̂} ≅ 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Definition 5.13). Lemma 5.14: (1) mom_{Â^∨} ∘ e^*ϱ̂_y = ϱ_y; (2) ϱ̂_y ∘ p ∘ ∇ ∘ i = d_Â ∘ ϱ̂_y; (3) for s ∈ 𝒜̂[p^n](𝒪_{ℂ_p}) = 𝒜[𝔭_Σ^n](𝒪_{ℂ_p}), translation by s intertwines ϱ̂_y and ϱ̂_{y+s} with (T_s × id)^* (integrally). Integral translation assumes y killed by an isogeny with étale dual; the generic-fibre extension here is for torsion y, not for every point..

Source: KingsSprang, Lemma 5.12, p. 62; Definition 5.13, p. 62; Lemma 5.14, p. 62.

Routed targets: PAPER-KINGS-SPRANG-25/025.

Exact unresolved inputs:

- Ordinary connection and translation compatibility: Split Lemma 5.14 into its three diagram calculations on the completed coefficients, and prove each after the ordinary splitting and Hodge projection are constructed. Obtain and compare the Sprang elliptic sources (2019 and 2020) and the product-of-two-elliptic-curves example; those papers are not claimed read.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:P4 is planned; proof and supplier refinements below prevent a closure claim.

## B0. Period coordinates and Betti maps

Construct local real analytic period coordinates of polarization type D and Betti projection; prove transition matrices, fixed-coordinate holomorphic leaves and birational rank invariance.

### Period-coordinate trivializations

Declaration AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization (construction). For a polarized abelian scheme A→S of relative dimension g over C, choose connected simply connected U⊂S^an and a symplectic lattice frame of polarization type D=diag(d₁,…,d_g). Its period matrix Z gives (a,b,s)↦(Da+Z(s)b,s), and the inverse induces (b_U,π):A_U^an≃(R/Z)^(2g)×U as real analytic manifolds. b_U alone is projection to the torus.

Proof/construction spine:

1. Trivialize the integral weight-one local system on U.
2. Use holomorphic period matrices and positive definite Im Z to solve uniquely for real a,b modulo the lattice.
3. Check fibrewise group operations and that a constant real (a,b) gives a holomorphic section.

Inputs: AbelianSchemesAndArithmeticModuli:A5; mathlib:AddCircle; PELModuli:M5; PELModuli:M6; ComplexComparisonPartII:C0.

API:

- AbelianArithmetic.periodCoordinates_betti (projection): b_U is the torus-coordinate projection, excluding the base coordinate.
- AbelianArithmetic.periodCoordinates_fibre (equivalence): The restriction b_U:A_s^an→(R/Z)^(2g) is an analytic group isomorphism.
- AbelianArithmetic.periodCoordinates_leaf (characterisation): For fixed torus coordinate β, s↦(b_U,π)^−1(β,s) is holomorphic.
- AbelianArithmetic.periodCoordinates_transition (compatibility): Two choices on connected U differ by a constant element of GL_(2g)(Z); these are automorphisms, not arbitrary endomorphisms.

Unit tests:

- AbelianArithmetic.periodCoordinates_point (compatibility): Over a point the torus-coordinate map is the imported complex uniformization expressed in real period coordinates.
- AbelianArithmetic.periodCoordinates_zero (computation): The zero section has Betti coordinate zero.
- AbelianArithmetic.periodCoordinates_base_not_counted (non-example): On a constant family over a positive-dimensional U, db_U annihilates the base directions although d(b_U,π) is invertible.

Acceptance: For a polarized abelian scheme A→S of relative dimension g over C, choose connected simply connected U⊂S^an and a symplectic lattice frame of polarization type D=diag(d₁,…,d_g). Its period matrix Z gives (a,b,s)↦(Da+Z(s)b,s), and the inverse induces (b_U,π):A_U^an≃(R/Z)^(2g)×U as real analytic manifolds. b_U alone is projection to the torus..

Source: DGH, Proposition 2.1; Appendix B.2; pp.8–9,41–43.

Routed targets: PAPER-DIMITROV-GAO-HABEGGER-21/16, PAPER-DIMITROV-GAO-HABEGGER-21/17, PAPER-GAO-HABEGGER-19/25, PAPER-GAO-GE-KUHNE-26/47.

Exact unresolved inputs:

- Relative period-coordinate interfaces: Supply the integral local-system trivialization, smooth real torus bundle and relative manifold APIs. The source proof is read; no synthetic manifold carrier is used in the prototype.

### Birational invariance of generic Betti rank

Declaration AbelianSchemesAndArithmeticModuliPartII:B0/birational-betti-rank (lemma). A birational base change between irreducible complex bases identifies generic real Betti rank on the corresponding dominating subvarieties.

Proof/construction spine:

1. Choose the common dense Zariski open on which the base change is an isomorphism.
2. Identify period frames and differentials there.
3. Use density of that open and the generic-rank locus, without claiming pointwise rank equality on exceptional fibres.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization.

Acceptance: A birational base change between irreducible complex bases identifies generic real Betti rank on the corresponding dominating subvarieties..

Source: DGH, Lemma B.3, pp.42–43.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:B0 is planned; proof and supplier refinements below prevent a closure claim.

## B1. Betti forms and non-degeneracy

Compute, descend and scale the closed semipositive form. Use a pointwise kernel computation for its rank characterization, and test total complex dimension.

### The descended Betti form

Declaration AbelianSchemesAndArithmeticModuliPartII:B1/betti-form (construction). For a principal polarization upstairs on C^g×H_g set Y=Im Z and ω_hat=i∂∂bar(2(Im w)^tY^−1(Im w)). In real coordinates w=a+Zb it equals 2∑ da_j∧db_j. It descends under the arithmetic semidirect action to the universal family and pulls back to A/S. For type D the alternating polarization form is transported in the D-coordinate convention.

Proof/construction spine:

1. Differentiate Y^−1 and compute the complex Hessian.
2. Substitute real period coordinates to obtain the constant alternating form.
3. Check invariance under translations and Sp action, then descend and pull back via the modular map.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization.

API:

- AbelianArithmetic.bettiForm_pullback (compatibility): The form on A is the pullback of the universal Betti form in the chosen polarization type.
- AbelianArithmetic.bettiForm_closed (structure): dω=0 and ω has type (1,1).
- AbelianArithmetic.bettiForm_nonnegative (characterisation): ω is semipositive on each complex tangent space.
- AbelianArithmetic.bettiForm_scale (functoriality): For every N∈Z, [N]^*ω=N²ω.

Unit tests:

- AbelianArithmetic.bettiForm_elliptic (computation): For w=a+τb, the principal elliptic Betti form is 2 da∧db.
- AbelianArithmetic.bettiForm_zero_multiplication (degenerate): [0]^*ω=0, while [−1]^*ω=ω.
- AbelianArithmetic.bettiForm_single_fibre (compatibility): On a single fibre the form agrees with the translation-invariant positive (1,1) form of its imported principal polarization.

Acceptance: For a principal polarization upstairs on C^g×H_g set Y=Im Z and ω_hat=i∂∂bar(2(Im w)^tY^−1(Im w)). In real coordinates w=a+Zb it equals 2∑ da_j∧db_j. It descends under the arithmetic semidirect action to the universal family and pulls back to A/S. For type D the alternating polarization form is transported in the D-coordinate convention..

Source: DGH, Lemmas 2.3–2.6; pp.10–13.

Routed targets: PAPER-DIMITROV-GAO-HABEGGER-21/18, PAPER-DIMITROV-GAO-HABEGGER-21/19, PAPER-DIMITROV-GAO-HABEGGER-21/20, PAPER-DIMITROV-GAO-HABEGGER-21/21, PAPER-GAO-GE-KUHNE-26/47.

### Pointwise kernel and rank identity

Declaration AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel (lemma). At a smooth point x of a complex subvariety X, ker(ω|T_xX)=ker(db_U|T_xX), and the real rank of db_U is the rank of the restricted alternating form. Thus ω^dim_CX is nonzero exactly when rank_R db_U=2 dim_CX.

Proof/construction spine:

1. Use the explicit positive Hessian: a vector of zero Hermitian norm satisfies dw−dZ·b=0.
2. Express this equation as Da+Z db=0 on the vector; positivity of Im Z forces da=db=0.
3. Restrict to the J-stable complex tangent subspace and use semipositivity to identify the alternating kernel; use finite-dimensional exterior linear algebra for top powers.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B1/betti-form.

Acceptance: At a smooth point x of a complex subvariety X, ker(ω|T_xX)=ker(db_U|T_xX), and the real rank of db_U is the rank of the restricted alternating form. Thus ω^dim_CX is nonzero exactly when rank_R db_U=2 dim_CX..

Source: DGH, Proposition 2.7 and corrected kernel step E14; pp.12–13.

Exact unresolved inputs:

- Pointwise form linear algebra: Implement the restricted semipositive Hermitian/alternating kernel theorem and complex Hessian calculation. The proof must be pointwise: do not deduce equality of kernels by integrating unspecified null directions.

### Non-degenerate subvarieties

Declaration AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate (definition). An irreducible complex X⊂A is non-degenerate if at some x∈X^sm(C), rank_R(db_U|X)_x=2 dim_C X. Equivalently the top restricted Betti form is nonzero somewhere. The dimension is total complex dimension, including base directions. For Qbar varieties use the fixed embedding into C.

Proof/construction spine:

1. Use GL_(2g)(Z) transitions for independence of period frames.
2. Use the pointwise kernel theorem for the top-form equivalence.
3. Nonvanishing is open; intersect with the smooth locus over a smooth base point.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization; AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel.

API:

- AbelianArithmetic.nonDegenerate_rank (characterisation): Non-degeneracy iff generic real Betti rank equals twice total complex dimension.
- AbelianArithmetic.nonDegenerate_form (characterisation): Non-degeneracy iff ω^dim_CX is nonzero on X^sm.
- AbelianArithmetic.nonDegenerate_smooth_point (data): A non-degenerate X has a smooth nonvanishing point over a smooth point of π(X).

Unit tests:

- AbelianArithmetic.nonDegenerate_single_fibre (compatibility): Every irreducible subvariety of a single polarized abelian variety over a point is non-degenerate.
- AbelianArithmetic.nonDegenerate_diagonal (non-example): For an elliptic family E over a curve, Δ(E)⊂E×_S E has dim_C=2 and real Betti rank≤2, so is degenerate.
- AbelianArithmetic.nonDegenerate_torsion (degenerate): A torsion section over a positive-dimensional base has locally constant Betti coordinates and is degenerate.

Acceptance: An irreducible complex X⊂A is non-degenerate if at some x∈X^sm(C), rank_R(db_U|X)_x=2 dim_C X. Equivalently the top restricted Betti form is nonzero somewhere. The dimension is total complex dimension, including base directions. For Qbar varieties use the fixed embedding into C..

Source: DGH, Definition 1.5; Appendix B.4; pp.5,43–44.

Routed targets: PAPER-DIMITROV-GAO-HABEGGER-21/23, PAPER-GAO-GE-KUHNE-26/48.

### Proposition 2.2(iii) and Proposition 2.7 (Betti form versus Betti rank)

Declaration AbelianSchemesAndArithmeticModuliPartII:B1/dgh-22 (theorem). Under (Hyp), for an irreducible X ⊆ A of dimension d and an open Δ ⊆ S^an that is the domain of a Betti map b_Δ with X^{sm,an} ∩ A_Δ ≠ ∅: (ω|_{X^{sm,an}})^{∧d} ≢ 0 iff max_{x} rank_ℝ (db_Δ|_{X^{sm,an}})_x = 2d.

Proof/construction spine:

1. Use the pointwise kernel and exterior-rank identity.
2. Nonvanishing is open on the smooth locus; intersect with the dense open lying over the smooth base.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel; AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate.

Acceptance: Under (Hyp), for an irreducible X ⊆ A of dimension d and an open Δ ⊆ S^an that is the domain of a Betti map b_Δ with X^{sm,an} ∩ A_Δ ≠ ∅: (ω|_{X^{sm,an}})^{∧d} ≢ 0 iff max_{x} rank_ℝ (db_Δ|_{X^{sm,an}})_x = 2d..

Source: DGH, Proposition 2.2(iii), p.8; Proposition 2.7, pp.11–12; general case (2.5)–(2.7), pp.12–13, arXiv v3 (31 March 2021).

Routed targets: PAPER-DIMITROV-GAO-HABEGGER-21/22.

### Non-vanishing of the top power of the Betti form on a non-degenerate subvariety

Declaration AbelianSchemesAndArithmeticModuliPartII:B1/nonzero-smooth-point (theorem). If X ⊆ A → S is non-degenerate, there is a smooth point z ∈ X^{sm}(ℂ), which may be taken over a smooth point of S, with (ω|_X)^{∧ dim X}_z ≠ 0 (an open condition).

Proof/construction spine:

1. Use the rank characterization and openness of top-form nonvanishing.
2. Intersect with the smooth base and smooth fibre-product locus before choosing the point.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel; AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate.

Acceptance: If X ⊆ A → S is non-degenerate, there is a smooth point z ∈ X^{sm}(ℂ), which may be taken over a smooth point of S, with (ω|_X)^{∧ dim X}_z ≠ 0 (an open condition)..

Source: DGH, Proposition 2.2(iii), pp.9–13.

Routed targets: PAPER-GAO-GE-KUHNE-26/66.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:B1 is planned; proof and supplier refinements below prevent a closure claim.

## B2. Curve monodromy and constant traces

Construct curve degeneracy, prove the definable-set and monodromy steps, state a genuine function-field trace and isolate the fixed-part and trace-reduction gaps.

### Degeneracy over a curve

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/curve-degenerate (definition). For an irreducible subvariety Y⊂A over a smooth irreducible complex curve S, x is a degenerate point when it is not isolated in the local fibre of b_U|Y. Y is curve-degenerate when its degenerate points contain a nonempty relatively open subset. This is the GH convention, not a definition using only generic relative dimension.

Proof/construction spine:

1. Use local Betti fibres and transition automorphisms for independence of U.
2. On a constant-rank neighborhood the fibre dimension is positive iff the real rank is below twice total dimension.
3. Do not apply the constant-rank theorem at a point without a neighborhood on which its rank is constant.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization; AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate.

API:

- AbelianArithmetic.curveDegenerate_point (characterisation): DegenerateAt(x) iff x is nonisolated in its local Betti fibre.
- AbelianArithmetic.curveDegenerate_open (characterisation): CurveDegenerate(Y) iff a nonempty open subset of Y consists of degenerate points.
- AbelianArithmetic.curveDegenerate_rank (compatibility): On the smooth generic constant-rank locus curve degeneracy is the failure of the total-dimension Betti rank criterion.

Unit tests:

- AbelianArithmetic.curveDegenerate_torsion (computation): A torsion section over a curve is curve-degenerate.
- AbelianArithmetic.curveDegenerate_fibre (degenerate): A smooth subvariety contained in one fibre has isolated local Betti fibres and is not curve-degenerate.
- AbelianArithmetic.curveDegenerate_full_family (non-example): A constant abelian family over a curve is curve-degenerate, despite positive definite form on each individual fibre.

Acceptance: For an irreducible subvariety Y⊂A over a smooth irreducible complex curve S, x is a degenerate point when it is not isolated in the local fibre of b_U|Y. Y is curve-degenerate when its degenerate points contain a nonempty relatively open subset. This is the GH convention, not a definition using only generic relative dimension..

Source: GaoHabegger, §5, p.18; Lemma 6.2, pp.31–32.

Routed targets: PAPER-GAO-HABEGGER-19/27.

### Function-field trace and constant part

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/function-field-trace (construction). For K=C(S) and an abelian variety A/K, a C-trace is an abelian variety T/C with a K-homomorphism τ:T_K→A universal among maps from constant abelian varieties. In characteristic zero τ has finite kernel. Its image has a complementary abelian subvariety up to isogeny by imported Poincaré reducibility. Universal equivariant Hom, not all fibrewise Hom, detects this trace.

Proof/construction spine:

1. Specify the universal property on constant abelian varieties.
2. Representability/existence and invariance under the covers in the proof are an explicit source gap.
3. Use imported complete reducibility after constructing the trace image; choose a complement without creating a dependency back into Néron-model construction.

Inputs: AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility.

API:

- AbelianArithmetic.functionFieldTrace_map (data): τ:T_K→A is the universal homomorphism from the constant trace.
- AbelianArithmetic.functionFieldTrace_universal (universal-property): For every B/C, Hom_C(B,T)→Hom_K(B_K,A), f↦τ∘f_K, is a bijection.
- AbelianArithmetic.functionFieldTrace_complement (structure): In characteristic zero there is an abelian complement B and a K-isogeny T_K×B→A.

Unit tests:

- AbelianArithmetic.functionFieldTrace_constant (compatibility): The C-trace of a constant B_K is B with identity map.
- AbelianArithmetic.functionFieldTrace_zero (degenerate): The zero abelian variety has zero trace.
- AbelianArithmetic.functionFieldTrace_nonconstant (non-example): For a non-isotrivial elliptic variety over C(S), the trace is zero even though its complex fibres are nonzero elliptic curves.

Acceptance: For K=C(S) and an abelian variety A/K, a C-trace is an abelian variety T/C with a K-homomorphism τ:T_K→A universal among maps from constant abelian varieties. In characteristic zero τ has finite kernel. Its image has a complementary abelian subvariety up to isogeny by imported Poincaré reducibility. Universal equivariant Hom, not all fibrewise Hom, detects this trace..

Source: GaoHabegger, Definition 1.2, pp.2–3; Lemmas 5.6,5.8; Theorem 5.1, pp.25–31.

Exact unresolved inputs:

- Trace existence and reduction: Read the Chow–Lang/Conrad proof of the C(S)/C trace, its finite kernel, finite-cover behavior, extension over a curve and the exact dimension argument in the GH trace reduction. The routed Néron R11.5 citation supplies local factors, not this theorem; no false supplier edge is retained.

### Integer characters and countably many closed torus subgroups

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/torus-annihilators (lemma). Every closed subgroup H of (R/Z)^n is the intersection of kernels of integer characters in its annihilator L⊂Z^n. Since subgroups of Z^n are finitely generated, there are countably many such H. L need not be saturated: H may be disconnected.

Proof/construction spine:

1. Use torus character duality with the genuine continuous compact group.
2. Apply finite generation of subgroups of a finitely generated free abelian group.
3. Enumerate finite integer tuples, retaining nonsaturated annihilators such as 2Z⊂Z.

Inputs: mathlib:AddCircle.

Acceptance: Every closed subgroup H of (R/Z)^n is the intersection of kernels of integer characters in its annihilator L⊂Z^n. Since subgroups of Z^n are finitely generated, there are countably many such H. L need not be saturated: H may be disconnected..

Source: GaoHabegger, Lemma 5.2 proof, pp.20–22; routed auxiliary 84.

Exact unresolved inputs:

- Torus character duality: Prove the continuous integer-character duality and separation of a closed subgroup from an outside point. H={0,1/2} in R/Z must have annihilator 2Z, so saturated lattices are insufficient.

### Free matrix word growth at bounded height

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/free-group-orbit-growth (lemma). Let Γ⊂GL_n(Z) be freely generated by two matrices. Fix c>1 bounding the submultiplicative norms of both generators and both inverses. There are at least 2^k distinct Γ matrices of norm at most c^k, so for sufficiently large T there are at least C T^(log2/logc) matrices of norm at most T for some C>0. This counts matrices; distinct orbit points require the separate collision argument.

Proof/construction spine:

1. Use distinct reduced positive words of length k in the two free generators.
2. Use the submultiplicative norm bound, retaining inverse bounds for the complete word-ball height convention.
3. Choose k=floor(logT/logc) to obtain the displayed polynomial matrix count; make no orbit-injectivity deduction.

Inputs: Routine algebra plus the specifically recorded source gap.

Acceptance: Let Γ⊂GL_n(Z) be freely generated by two matrices. Fix c>1 bounding the submultiplicative norms of both generators and both inverses. There are at least 2^k distinct Γ matrices of norm at most c^k, so for sufficiently large T there are at least C T^(log2/logc) matrices of norm at most T for some C>0. This counts matrices; distinct orbit points require the separate collision argument..

Source: GaoHabegger, Lemma 5.2, pp.19–22.

Exact unresolved inputs:

- Free-orbit collision lemma: Supply the exact collision-kernel bound from GH Lemma 5.2 under its stabilizer hypotheses. Abstract word growth by itself does not establish distinct orbit growth.

### Fixed homology and equivariant Hom

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace (lemma). For an extendable polarized integral weight-one variation of an abelian scheme over a smooth curve, a nonzero integer homology class fixed by a finite-index monodromy subgroup yields a nonzero constant part over its finite étale cover. The invariant-to-geometric map is equivariant Hom, not all Hom of Hodge fibres.

Proof/construction spine:

1. Apply the fixed-part theorem to the extendable polarizable variation.
2. Use weight-one Hodge theory to turn a nonzero fixed Hodge substructure into a constant abelian variety.
3. Apply the trace universal property over the cover.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/function-field-trace; HodgeStructuresPartII:H.2; HodgeStructuresPartII:H.3.

Acceptance: For an extendable polarized integral weight-one variation of an abelian scheme over a smooth curve, a nonzero integer homology class fixed by a finite-index monodromy subgroup yields a nonzero constant part over its finite étale cover. The invariant-to-geometric map is equivariant Hom, not all Hom of Hodge fibres..

Source: GaoHabegger, Lemma 5.6, pp.25–27.

### Generically special subvarieties

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/generically-special (definition). Over the geometric generic point of a complex curve, a GH generically special subvariety is a finite union of translates τ(Z_Kbar)+B+t, where Z is an algebraic subvariety of the constant trace T over C, B is an abelian subvariety and t is torsion. A Gao special-generically subvariety, used for degeneracy loci, instead uses a constant section and an abelian subgroup, not a general constant Z.

Proof/construction spine:

1. Use the actual trace map and geometric generic fibre.
2. Allow finite unions and torsion translations after the indicated finite covers.
3. Keep the two conventions distinct: constant algebraic Z can have positive dimension without being a subgroup.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/function-field-trace.

API:

- AbelianArithmetic.genericallySpecial_components (characterisation): Each geometric generic irreducible component has the stated constant-variety plus torsion-coset description.
- AbelianArithmetic.genericallySpecial_constant (constructor): A constant subvariety of a constant abelian family is generically special.
- AbelianArithmetic.genericallySpecial_torsion (constructor): A torsion translate of an abelian subvariety is generically special.

Unit tests:

- AbelianArithmetic.genericallySpecial_constant_curve (non-example): A constant genus≥2 curve in its constant Jacobian is GH generically special but is not itself a torsion coset.
- AbelianArithmetic.genericallySpecial_torsion_point (degenerate): A torsion point is a zero-dimensional generically special subvariety.
- AbelianArithmetic.genericallySpecial_trace (compatibility): For a constant family with identity trace, every subvariety defined over C is supplied by the imported trace map.

Acceptance: Over the geometric generic point of a complex curve, a GH generically special subvariety is a finite union of translates τ(Z_Kbar)+B+t, where Z is an algebraic subvariety of the constant trace T over C, B is an abelian subvariety and t is torsion. A Gao special-generically subvariety, used for degeneracy loci, instead uses a constant section and an abelian subgroup, not a general constant Z..

Source: GaoHabegger, Definition 1.2, pp.2–3.

### Lemma 5.2 (invariant definable sets of Ax-type)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/definable-ax-set (theorem). Let X ⊆ T^n be closed, definable and of Ax-type, and Γ ⊆ GL_n(ℤ) free on two generators with γ(X) = X for all γ ∈ Γ. Then either X lies in a finite union of proper closed subgroups of T^n, or there are a non-empty open U ⊆ X and a closed connected infinite subgroup G with U + G ⊆ X.

Proof/construction spine:

1. Lift the closed definable torus set to R^n and build its semirational orbit incidence set.
2. Use distinct orbit growth, Pila–Wilkie semirational paths with endpoint γ₀∈Γ, and Ax arcs to obtain positive-dimensional cosets.
3. Use countably many closed torus subgroups and Baire to make one subgroup persist on an open set.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/free-group-orbit-growth; AbelianSchemesAndArithmeticModuliPartII:B2/torus-annihilators; LogicAndDefinabilityInNumberTheory:LD.6.

Acceptance: Let X ⊆ T^n be closed, definable and of Ax-type, and Γ ⊆ GL_n(ℤ) free on two generators with γ(X) = X for all γ ∈ Γ. Then either X lies in a finite union of proper closed subgroups of T^n, or there are a non-empty open U ⊆ X and a closed connected infinite subgroup G with U + G ⊆ X..

Source: GaoHabegger, Lemma 5.2 and proof, pp.19–20, arXiv v3 (28 January 2019) (misprints E4–E5).

Routed targets: PAPER-GAO-HABEGGER-19/32.

Exact unresolved inputs:

- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof.

### Proposition 5.3 (monodromy-invariant subvarieties of an abelian variety)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-invariant-variety (theorem). Let A be a complex abelian variety and Γ ⊆ GL_{2g}(ℤ) act continuously on A^an via a Betti isomorphism, of monodromy type (every abelian subvariety is Γ-stable), containing a free subgroup of rank 2 and with no non-zero invariant vector in ℤ^{2g}. If Z ⊆ A is irreducible closed with Γ(Z(ℂ)) = Z(ℂ), then Z lies in a proper torsion coset, or Z + B = Z for some abelian subvariety B of positive dimension.

Proof/construction spine:

1. Apply the invariant definable-set lemma to Betti coordinates of the irreducible algebraic variety.
2. A persistent positive-dimensional subgroup gives positive-dimensional stabilizer; otherwise a rational annihilator gives a proper torsion coset.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/torus-annihilators; AbelianSchemesAndArithmeticModuliPartII:B2/definable-ax-set.

Acceptance: Let A be a complex abelian variety and Γ ⊆ GL_{2g}(ℤ) act continuously on A^an via a Betti isomorphism, of monodromy type (every abelian subvariety is Γ-stable), containing a free subgroup of rank 2 and with no non-zero invariant vector in ℤ^{2g}. If Z ⊆ A is irreducible closed with Γ(Z(ℂ)) = Z(ℂ), then Z lies in a proper torsion coset, or Z + B = Z for some abelian subvariety B of positive dimension..

Source: GaoHabegger, Proposition 5.3 and proof, pp.21–22, arXiv v3 (28 January 2019).

Routed targets: PAPER-GAO-HABEGGER-19/33.

Exact unresolved inputs:

- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof.

### Proposition 5.4 (monodromy transport along Betti fibres)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-transport (theorem). Glueing Betti maps along loops gives a homomorphism ρ̃ : π₁(S^an, s) → {homeomorphic group automorphisms of 𝒜_s^an} with ρ̃(h)_* = ρ(h), the monodromy on H₁(𝒜_s^an, ℤ). (i) If P ∈ Y^an over s is not isolated in its Betti fibre in Y, then ρ̃(h)(P) ∈ Y^an for all h, and if P has order N then dim_P Y ∩ 𝒜[N] ≥ 1. (ii) ρ̃ commutes with homomorphisms of abelian schemes.

Proof/construction spine:

1. Use a good-cover refinement of the curve and transport the whole holomorphic fixed-Betti section by the complex identity theorem.
2. For torsion of order N, degeneracy gives dimension at least one in Y∩A[N] and hence the entire section over the curve.
3. Continue along each loop and use naturality of homology transport. The dimension-one base is essential.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization; AbelianSchemesAndArithmeticModuliPartII:B2/curve-degenerate; AbelianSchemesAndArithmeticModuliPartII:B2/riemann-good-cover.

Acceptance: Glueing Betti maps along loops gives a homomorphism ρ̃ : π₁(S^an, s) → {homeomorphic group automorphisms of 𝒜_s^an} with ρ̃(h)_* = ρ(h), the monodromy on H₁(𝒜_s^an, ℤ). (i) If P ∈ Y^an over s is not isolated in its Betti fibre in Y, then ρ̃(h)(P) ∈ Y^an for all h, and if P has order N then dim_P Y ∩ 𝒜[N] ≥ 1. (ii) ρ̃ commutes with homomorphisms of abelian schemes..

Source: GaoHabegger, Proposition 5.4, (5.3)–(5.5) and proof, pp.22–24, arXiv v3 (28 January 2019) (misprint E6).

Routed targets: PAPER-GAO-HABEGGER-19/35.

Exact unresolved inputs:

- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof.

### Tits: free subgroups of linear groups

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/tits-free-subgroups (theorem). A subgroup of GL_n over a field of characteristic 0 that is not virtually solvable contains a free subgroup on two generators; in particular a Zariski-dense subgroup of a non-trivial connected semisimple group does ([Tit72, Thm. 3]).

Proof/construction spine:

1. State the characteristic-zero finitely generated linear-group alternative with its exact non-virtually-solvable hypothesis.
2. The Tits primary proof was not obtained; this is a specifically recorded source-proof gap, not a claimed derivation from elementary group theory.

Inputs: Routine algebra plus the specifically recorded source gap.

Acceptance: A subgroup of GL_n over a field of characteristic 0 that is not virtually solvable contains a free subgroup on two generators; in particular a Zariski-dense subgroup of a non-trivial connected semisimple group does ([Tit72, Thm. 3])..

Source: GaoHabegger, Proof of Lemma 5.5, p.25, citing Tits [Tit72, Thm. 3], arXiv v3 (28 January 2019).

Routed targets: PAPER-GAO-HABEGGER-19/37.

Exact unresolved inputs:

- Primary auxiliary proof: Tits: free subgroups of linear groups: Supply the source proof and native hypotheses for this exact auxiliary: A subgroup of GL_n over a field of characteristic 0 that is not virtually solvable contains a free subgroup on two generators; in particular a Zariski-dense subgroup of a non-trivial connected semisimple group does ([Tit72, Thm. 3]).

### Lemma 5.5 (free subgroups in monodromy)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/free-monodromy (theorem). If G⁰_s is non-trivial, every finite-index subgroup of Γ_s = ρ(π₁(S^an, s)) contains a free subgroup on two generators.

Proof/construction spine:

1. Use Deligne semisimple connected monodromy and the fixed-part obstruction to solvability.
2. Apply Tits to every relevant finite-index subgroup and retain nontrivial connected Zariski closure.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace; AbelianSchemesAndArithmeticModuliPartII:B2/free-group-orbit-growth; AbelianSchemesAndArithmeticModuliPartII:B2/tits-free-subgroups.

Acceptance: If G⁰_s is non-trivial, every finite-index subgroup of Γ_s = ρ(π₁(S^an, s)) contains a free subgroup on two generators..

Source: GaoHabegger, Lemma 5.5 and proof, p.25, arXiv v3 (28 January 2019).

Routed targets: PAPER-GAO-HABEGGER-19/38.

Exact unresolved inputs:

- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof.

### Lemma 5.6 (invariant homology forces a non-zero trace)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/invariant-homology-trace (theorem). If H₁(𝒜_s^an, ℤ) has a non-zero monodromy-invariant element, then the ℂ(S)/ℂ-trace of the generic fibre is non-zero (over ℂ(S) itself, as Lemma 5.8 needs).

Proof/construction spine:

1. Apply the invariant equivariant-Hom comparison to the integer invariant.
2. Construct the nonzero constant abelian map and factor through the actual function-field trace.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace.

Acceptance: If H₁(𝒜_s^an, ℤ) has a non-zero monodromy-invariant element, then the ℂ(S)/ℂ-trace of the generic fibre is non-zero (over ℂ(S) itself, as Lemma 5.8 needs)..

Source: GaoHabegger, Lemma 5.6 and proof, p.25, arXiv v3 (28 January 2019).

Routed targets: PAPER-GAO-HABEGGER-19/41.

### Lemma 5.8 (virtually monodromy-invariant subvarieties lie in kernels)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/virtual-invariant-kernel (theorem). Let Y ⊆ 𝒜 be irreducible closed dominating S, virtually monodromy invariant (some component of Y_s is ρ̃-stable under a finite-index subgroup) above every point of an uncountable set of extendable points, and suppose the generic fibre of 𝒜 ×_S S′ has trivial trace for every finite étale S′ → S. Then there is a homomorphism 𝒜 → 𝒞 of abelian schemes over S whose kernel contains Y and has dimension dim Y.

Proof/construction spine:

1. Assume zero trace on every required finite étale cover, not just on the original base.
2. Use uncountably many extendable invariant fibres and countably many subgroup data to obtain a common homomorphism kernel.
3. Treat both zero-relative-dimension cases separately and compare total kernel dimension with dimY.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace; AbelianSchemesAndArithmeticModuliPartII:B2/torus-annihilators; AbelianSchemesAndArithmeticModuliPartII:B2/function-field-trace; AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-invariant-variety; AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-transport; AbelianSchemesAndArithmeticModuliPartII:B2/free-monodromy; AbelianSchemesAndArithmeticModuliPartII:B2/invariant-homology-trace.

Acceptance: Let Y ⊆ 𝒜 be irreducible closed dominating S, virtually monodromy invariant (some component of Y_s is ρ̃-stable under a finite-index subgroup) above every point of an uncountable set of extendable points, and suppose the generic fibre of 𝒜 ×_S S′ has trivial trace for every finite étale S′ → S. Then there is a homomorphism 𝒜 → 𝒞 of abelian schemes over S whose kernel contains Y and has dimension dim Y..

Source: GaoHabegger, Lemma 5.8 and proof, pp.26–28, arXiv v3 (28 January 2019) (misprint E7; degenerate cases of the induction omitted, E8).

Routed targets: PAPER-GAO-HABEGGER-19/43.

Exact unresolved inputs:

- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof.

### Theorem 5.1 (degenerate implies generically special)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/degenerate-generically-special (theorem). Over a smooth irreducible complex curve S, an irreducible closed subvariety of 𝒜 that is degenerate is generically special.

Proof/construction spine:

1. Reduce by the trace image and its Poincaré complement.
2. Apply monodromy transport and the virtual-invariant-kernel lemma to the trace-zero quotient.
3. Pull the constant algebraic subvariety and torsion coset back through the isogeny; retain finite unions on the geometric generic fibre.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/curve-degenerate; AbelianSchemesAndArithmeticModuliPartII:B2/generically-special; AbelianSchemesAndArithmeticModuliPartII:B2/function-field-trace; AbelianSchemesAndArithmeticModuliPartII:B2/virtual-invariant-kernel.

Acceptance: Over a smooth irreducible complex curve S, an irreducible closed subvariety of 𝒜 that is degenerate is generically special..

Source: GaoHabegger, Theorem 5.1, p.18; proof §5.4, pp.28–30, arXiv v3 (28 January 2019) (misprint E9; Lemma 5.8 gap E8).

Routed targets: PAPER-GAO-HABEGGER-19/28.

Exact unresolved inputs:

- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof.

### Lemma 6.2 (non-generically special subvarieties have full Betti rank)

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/full-rank-algebraic-point (theorem). If X ⊆ 𝒜, defined over F and dominating S, is not generically special, there is P ∈ X^{sm}(F) with π(P) ∈ Δ and P ∈ (X_{π(P)})^{sm} such that dim im T_P(b|_{X^{sm,an} ∩ 𝒜_Δ}) = 2 dim X (6.1).

Proof/construction spine:

1. Use the contrapositive of the generically-special theorem to find a smooth generic point of full Betti rank.
2. Use real constant rank only on a constant-rank neighborhood; invariance of domain is used only between equal-dimensional real manifolds.
3. Choose a field-of-definition algebraic point in the resulting open locus, with the source density input separately recorded.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate; AbelianSchemesAndArithmeticModuliPartII:B2/curve-degenerate; AbelianSchemesAndArithmeticModuliPartII:B2/generically-special; AbelianSchemesAndArithmeticModuliPartII:B2/degenerate-generically-special; AbelianSchemesAndArithmeticModuliPartII:B2/invariance-of-domain; AbelianSchemesAndArithmeticModuliPartII:B2/real-constant-rank.

Acceptance: If X ⊆ 𝒜, defined over F and dominating S, is not generically special, there is P ∈ X^{sm}(F) with π(P) ∈ Δ and P ∈ (X_{π(P)})^{sm} such that dim im T_P(b|_{X^{sm,an} ∩ 𝒜_Δ}) = 2 dim X (6.1)..

Source: GaoHabegger, Lemma 6.2 and proof, p.31, arXiv v3 (28 January 2019).

Routed targets: PAPER-GAO-HABEGGER-19/44.

Exact unresolved inputs:

- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof.

### Invariance of domain in equal real dimension

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/invariance-of-domain (theorem). A continuous injective map f:U→ℝ^m from an open subset U⊆ℝ^m is open and is a homeomorphism onto its image. Consequently the same local assertion holds between real m-manifolds.

Proof/construction spine:

1. State Brouwer invariance of domain for continuous injective maps between real manifolds of the same finite dimension.
2. Its primary topological proof and exact native declaration were not established in this pass.

Inputs: Routine algebra plus the specifically recorded source gap.

Acceptance: A continuous injective map f:U→ℝ^m from an open subset U⊆ℝ^m is open and is a homeomorphism onto its image. Consequently the same local assertion holds between real m-manifolds..

Source: GaoHabegger, Proof of Theorem 5.1, arXiv v3 p.29 / Annals p.561..

Routed targets: PAPER-GAO-HABEGGER-19/82.

Exact unresolved inputs:

- Primary auxiliary proof: Invariance of domain in equal real dimension: Supply the source proof and native hypotheses for this exact auxiliary: A continuous injective map f:U→ℝ^m from an open subset U⊆ℝ^m is open and is a homeomorphism onto its image. Consequently the same local assertion holds between real m-manifolds.

### Real constant-rank theorem for Betti fibres

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/real-constant-rank (theorem). For a C^k map f:M^m→N^n of finite-dimensional real manifolds, 1≤k≤∞, with differential of constant rank r on an open neighbourhood, local C^k coordinates put f in projection form. Each nonempty fibre in that neighbourhood is a C^k submanifold of dimension m−r. Apply to the real-analytic Betti map on its smooth maximal-rank locus, where m=2 dim X.

Proof/construction spine:

1. For a C¹ real map of rank r throughout a neighborhood, choose local coordinates in which it is projection to r coordinates.
2. The neighborhood-constant hypothesis is required; rank information at a single point is insufficient.

Inputs: Routine algebra plus the specifically recorded source gap.

Acceptance: For a C^k map f:M^m→N^n of finite-dimensional real manifolds, 1≤k≤∞, with differential of constant rank r on an open neighbourhood, local C^k coordinates put f in projection form. Each nonempty fibre in that neighbourhood is a C^k submanifold of dimension m−r. Apply to the real-analytic Betti map on its smooth maximal-rank locus, where m=2 dim X..

Source: GaoHabegger, Lemma 6.2 proof, arXiv v3 p.31 / Annals p.563; Whitney, Complex Analytic Varieties, Appendix II Corollary 7F..

Routed targets: PAPER-GAO-HABEGGER-19/83.

Exact unresolved inputs:

- Primary auxiliary proof: Real constant-rank theorem for Betti fibres: Supply the source proof and native hypotheses for this exact auxiliary: For a C^k map f:M^m→N^n of finite-dimensional real manifolds, 1≤k≤∞, with differential of constant rank r on an open neighbourhood, local C^k coordinates put f in projection form. Each nonempty fibre in that neighbourhood is a C^k submanifold of dimension m−r. Apply to the real-analytic Betti map on its smooth maximal-rank locus, where m=2 dim X.

### Integer-character description of closed subgroups of a real torus

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/closed-torus-subgroups (theorem). Every closed subgroup H⊆(ℝ/ℤ)^n is the common kernel of a subgroup Λ≤ℤ^n of integer characters: H={x: m·x=0 in ℝ/ℤ for every m∈Λ}. Since Λ is finitely generated, finitely many integer equations suffice, and the set of closed subgroups of this finite-dimensional torus is countable.

Proof/construction spine:

1. Apply the integer-character annihilator theorem with disconnected subgroups retained.
2. Finite generation of the annihilator gives a countable enumeration.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B2/torus-annihilators.

Acceptance: Every closed subgroup H⊆(ℝ/ℤ)^n is the common kernel of a subgroup Λ≤ℤ^n of integer characters: H={x: m·x=0 in ℝ/ℤ for every m∈Λ}. Since Λ is finitely generated, finitely many integer equations suffice, and the set of closed subgroups of this finite-dimensional torus is countable..

Source: GaoHabegger, Lemma 5.2 and Proposition 5.3, arXiv v3 pp.20–21 / Annals pp.550–551 (Kronecker)..

Routed targets: PAPER-GAO-HABEGGER-19/84.

### Good-cover refinement on a Riemann surface

Declaration AbelianSchemesAndArithmeticModuliPartII:B2/riemann-good-cover (theorem). Every open cover of a second-countable Hausdorff Riemann surface has a locally finite refinement by relatively compact coordinate neighbourhoods such that every nonempty finite intersection is contractible. In the connected noncompact intersections used here these are topological open discs.

Proof/construction spine:

1. Refine the chosen finite cover and loop into simply connected coordinate disks with connected intersections.
2. Use actual Riemann-surface charts and compactness of the loop image; do not assert the same good-cover construction for an arbitrary higher-dimensional base.

Inputs: Routine algebra plus the specifically recorded source gap.

Acceptance: Every open cover of a second-countable Hausdorff Riemann surface has a locally finite refinement by relatively compact coordinate neighbourhoods such that every nonempty finite intersection is contractible. In the connected noncompact intersections used here these are topological open discs..

Source: GaoHabegger, §5.2, arXiv v3 p.22 / Annals p.552, citing Weil, Sur les théorèmes de de Rham, §1..

Routed targets: PAPER-GAO-HABEGGER-19/90.

Exact unresolved inputs:

- Primary auxiliary proof: Good-cover refinement on a Riemann surface: Supply the source proof and native hypotheses for this exact auxiliary: Every open cover of a second-countable Hausdorff Riemann surface has a locally finite refinement by relatively compact coordinate neighbourhoods such that every nonempty finite intersection is contractible. In the connected noncompact intersections used here these are topological open discs.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:B2 is planned; proof and supplier refinements below prevent a closure claim.

## B3. Degeneracy loci and quotient criteria

Define special-generically closures and t-degeneracy, decompose the mixed Ax–Schanuel input into exact owner requests, and prove finite-data closedness, descent and the quotient-rank criterion.

### Horizontal and vertical growth in mixed Ax–Schanuel

Declaration AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-growth (lemma). For the graph component in Gao Theorem 4.1, the definable incidence set Θ has polynomially many arithmetic points of bounded height along an unbounded sequence; prove both zero-horizontal and positive-horizontal cases, then the bounded/unbounded vertical dichotomy.

Proof/construction spine:

1. Request the exact general theorem from LogicAndDefinabilityInNumberTheory LD.6, retaining the primary proof stages and their missing leaves.
2. Use the incidence dimension condition and the Hodge-generic/minimal Kuga datum; pure Ax–Schanuel is not a substitute.

Inputs: LogicAndDefinabilityInNumberTheory:LD.6.

Acceptance: For the graph component in Gao Theorem 4.1, the definable incidence set Θ has polynomially many arithmetic points of bounded height along an unbounded sequence; prove both zero-horizontal and positive-horizontal cases, then the bounded/unbounded vertical dichotomy..

Source: GaoAxSchanuel, Theorem 5.2, pp.16–19.

Exact unresolved inputs:

- Mixed Ax–Schanuel proof leaves: The primary proof pp.16–30 is decomposed into four owner-facing uses. The cited hyperbolic-volume theorem, Pila–Wilkie block theorem, o-minimal Chow, mixed bi-algebraic/monodromy theorem and the final Lemma 8.7/8.8 continuation need source-level proofs from the logic owner. No closure or pure-to-mixed transfer is asserted.

### Bigness of the rational stabilizer

Declaration AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-stabilizer (lemma). Unless the mixed Ax–Schanuel dimension inequality already holds, the identity component of the rational Zariski stabilizer of the ambient algebraic graph closure has positive dimension.

Proof/construction spine:

1. Request the exact general theorem from LogicAndDefinabilityInNumberTheory LD.6, retaining the primary proof stages and their missing leaves.
2. Use the incidence dimension condition and the Hodge-generic/minimal Kuga datum; pure Ax–Schanuel is not a substitute.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-growth; LogicAndDefinabilityInNumberTheory:LD.6.

Acceptance: Unless the mixed Ax–Schanuel dimension inequality already holds, the identity component of the rational Zariski stabilizer of the ambient algebraic graph closure has positive dimension..

Source: GaoAxSchanuel, Proposition 5.1, pp.19–20.

Exact unresolved inputs:

- Mixed Ax–Schanuel proof leaves: The primary proof pp.16–30 is decomposed into four owner-facing uses. The cited hyperbolic-volume theorem, Pila–Wilkie block theorem, o-minimal Chow, mixed bi-algebraic/monodromy theorem and the final Lemma 8.7/8.8 continuation need source-level proofs from the logic owner. No closure or pure-to-mixed transfer is asserted.

### Normality and quotient induction

Declaration AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-normality (lemma). After the Hilbert-family and very-general-fibre reduction, the rational stabilizer is normal in the Kuga group: its vector part is a Hodge-stable G-module and its reductive part acts trivially on the quotient; quotienting gives the final dimension inequality.

Proof/construction spine:

1. Request the exact general theorem from LogicAndDefinabilityInNumberTheory LD.6, retaining the primary proof stages and their missing leaves.
2. Use the incidence dimension condition and the Hodge-generic/minimal Kuga datum; pure Ax–Schanuel is not a substitute.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-stabilizer; LogicAndDefinabilityInNumberTheory:LD.6.

Acceptance: After the Hilbert-family and very-general-fibre reduction, the rational stabilizer is normal in the Kuga group: its vector part is a Hodge-stable G-module and its reductive part acts trivially on the quotient; quotienting gives the final dimension inequality..

Source: GaoAxSchanuel, Proposition 6.1; §7; pp.20–27.

Exact unresolved inputs:

- Mixed Ax–Schanuel proof leaves: The primary proof pp.16–30 is decomposed into four owner-facing uses. The cited hyperbolic-volume theorem, Pila–Wilkie block theorem, o-minimal Chow, mixed bi-algebraic/monodromy theorem and the final Lemma 8.7/8.8 continuation need source-level proofs from the logic owner. No closure or pure-to-mixed transfer is asserted.

### Finite weakly optimal quotient data

Declaration AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-finite-data (lemma). For a fixed algebraic subvariety of a Kuga mixed Shimura variety, weakly optimal subvarieties have weakly special closures from a finite set of rational subdata and connected normal subgroups with semisimple reductive parts.

Proof/construction spine:

1. Request the exact general theorem from LogicAndDefinabilityInNumberTheory LD.6, retaining the primary proof stages and their missing leaves.
2. Use the incidence dimension condition and the Hodge-generic/minimal Kuga datum; pure Ax–Schanuel is not a substitute.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-normality; LogicAndDefinabilityInNumberTheory:LD.6.

Acceptance: For a fixed algebraic subvariety of a Kuga mixed Shimura variety, weakly optimal subvarieties have weakly special closures from a finite set of rational subdata and connected normal subgroups with semisimple reductive parts..

Source: GaoAxSchanuel, Theorem 8.2; Lemmas 8.5–8.7; pp.27–30.

Exact unresolved inputs:

- Mixed Ax–Schanuel proof leaves: The primary proof pp.16–30 is decomposed into four owner-facing uses. The cited hyperbolic-volume theorem, Pila–Wilkie block theorem, o-minimal Chow, mixed bi-algebraic/monodromy theorem and the final Lemma 8.7/8.8 continuation need source-level proofs from the logic owner. No closure or pure-to-mixed transfer is asserted.

### Gao t-degeneracy loci

Declaration AbelianSchemesAndArithmeticModuliPartII:B3/degeneracy-locus (construction). For irreducible X⊂A→S and t∈Z, define X^deg(t) as the union of positive-dimensional irreducible Y⊂X with dim⟨Y⟩_sg−dimπ(Y)<dimY+t. Here ⟨Y⟩_sg is the smallest special-generically closure: torsion plus constant section plus abelian subscheme after finite cover. X^deg(t) is a set before its Zariski closedness theorem.

Proof/construction spine:

1. Construct the special-generically closure in the chosen Kuga/abelian family dictionary.
2. Take the union using strict inequality and positive total dimension.
3. Use the finite weakly optimal quotient data for the separate closedness theorem; the definition itself asserts no scheme structure on an arbitrary union.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate; AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-finite-data.

API:

- AbelianArithmetic.degeneracyLocus_member (characterisation): x∈X^deg(t) iff x lies on a positive-dimensional Y satisfying the strict dimension inequality.
- AbelianArithmetic.degeneracyLocus_mono (relation): For t≤u, X^deg(t)⊂X^deg(u).
- AbelianArithmetic.degeneracyLocus_zero (projection): The non-degenerate open is X minus the 0-th degeneracy locus once closedness is proved.

Unit tests:

- AbelianArithmetic.degeneracyLocus_point (degenerate): For a zero-dimensional X all t-degeneracy loci are empty because no positive-dimensional Y exists.
- AbelianArithmetic.degeneracyLocus_torsion_section (computation): A torsion section over a positive-dimensional base belongs to its 0-th degeneracy locus.
- AbelianArithmetic.degeneracyLocus_strict (non-example): If dim⟨Y⟩_sg−dimπY=dimY+t, that Y is excluded; replacing < with ≤ changes the definition.

Acceptance: For irreducible X⊂A→S and t∈Z, define X^deg(t) as the union of positive-dimensional irreducible Y⊂X with dim⟨Y⟩_sg−dimπ(Y)<dimY+t. Here ⟨Y⟩_sg is the smallest special-generically closure: torsion plus constant section plus abelian subscheme after finite cover. X^deg(t) is a set before its Zariski closedness theorem..

Source: GaoBetti, Definition 1.6; §7; pp.3–6,15–18.

Routed targets: PAPER-GAO-GE-KUHNE-26/49.

### Zariski closedness of degeneracy loci

Declaration AbelianSchemesAndArithmeticModuliPartII:B3/degeneracy-closed (lemma). For every t∈Z, X^deg(t) is Zariski closed. On the universal modular image it is a finite union of fibre-dimension-jump loci for the finite normal quotient data; on an arbitrary family use Lemma 9.1 with the relative dimension r of its modular map.

Proof/construction spine:

1. Apply the finite-data theorem to maximal weakly optimal subvarieties.
2. For each quotient use upper semicontinuity of fibre dimension to obtain a closed locus.
3. Use the exact two-case formula in Lemma 9.1: pull back the locus with index t+r when t+r≤0 or r=0; otherwise the locus is all X.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B3/degeneracy-locus; AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-finite-data.

Acceptance: For every t∈Z, X^deg(t) is Zariski closed. On the universal modular image it is a finite union of fibre-dimension-jump loci for the finite normal quotient data; on an arbitrary family use Lemma 9.1 with the relative dimension r of its modular map..

Source: GaoBetti, Theorem 7.1; Lemma 9.1; pp.15–18,22–23.

Exact unresolved inputs:

- Field of definition of degeneracy loci: Prove invariance of the special-generically closure and finite quotient loci under Aut(C/Qbar), then effective descent of the resulting closed subset. The source closedness proof is read; the full field-of-definition argument has not been located in those pages.

### Gao quotient criterion for Betti rank

Declaration AbelianSchemesAndArithmeticModuliPartII:B3/betti-rank-quotient (lemma). Let S be an irreducible complex algebraic variety and X⊂A→S a closed irreducible subvariety dominating S. After the indicated finite cover, translate the smallest torsion translate of an abelian subscheme containing X to obtain the group family A_X. For each integer l≥0, generic real Betti rank of X is <2l iff there is an abelian subscheme B⊂A_X with quotient p_B and its modular map ι/B such that dim((ι/B)∘p_B)(X)<l−dim(B/S).

Proof/construction spine:

1. Use Proposition 6.1 to characterize rank via density of t-degeneracy.
2. Use closedness to replace density by equality.
3. Apply Proposition 8.3 normal-subgroup quotient data, use the fixed-part theorem to interpret the quotient as an abelian subscheme, and use the dimension comparison in §9.3.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B3/degeneracy-closed; AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace; AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-finite-data.

Acceptance: Let S be an irreducible complex algebraic variety and X⊂A→S a closed irreducible subvariety dominating S. After the indicated finite cover, translate the smallest torsion translate of an abelian subscheme containing X to obtain the group family A_X. For each integer l≥0, generic real Betti rank of X is <2l iff there is an abelian subscheme B⊂A_X with quotient p_B and its modular map ι/B such that dim((ι/B)∘p_B)(X)<l−dim(B/S)..

Source: GaoBetti, Propositions 8.2–8.3; Theorem 8.1; §9.3; pp.18–24.

Exact unresolved inputs:

- Kuga quotient and subgroup dictionary: Prove the correspondence between abelian subschemes and G_Q-submodules, quotient modular maps, and isotrivial fibres used in Theorem 8.1. Deligne 4.4.1–4.4.3 is cited but not read; no arbitrary subgroup projection is supplied by the uniformization alone.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:B3 is planned; proof and supplier refinements below prevent a closure claim.

## B4. Fibre powers and differences

Prove the fibre-power induction with geometric generic irreducibility, re-diagonalizing the kernel at every step; prove the product lemma and apply it to differences and universal curves.

### Non-degeneracy of a dominant fibre product

Declaration AbelianSchemesAndArithmeticModuliPartII:B4/non-degenerate-product (lemma). For dominant irreducible X,Y⊂A→S with geometrically irreducible generic fibres, if X is non-degenerate then X×_S Y is non-degenerate in A×_S A. For general fibre products apply the assertion to each dominating component after the requisite finite cover.

Proof/construction spine:

1. Shrink to smooth S and smooth maps from X^sm,Y^sm by generic smoothness.
2. Choose x with injective db_X on its tangent; at y over the same generic s, the vertical tangent of Y injects under its fibrewise Betti differential.
3. If a tangent vector in the fibre product maps to zero, its X-component is zero, so its Y-component is vertical and hence zero. Thus rank is twice dim(X×_S Y).

Inputs: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization; AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate.

Acceptance: For dominant irreducible X,Y⊂A→S with geometrically irreducible generic fibres, if X is non-degenerate then X×_S Y is non-degenerate in A×_S A. For general fibre products apply the assertion to each dominating component after the requisite finite cover..

Source: GaoSurvey, Lemma 6.2, p.15.

### The fibre-power dimension induction

Declaration AbelianSchemesAndArithmeticModuliPartII:B4/fibre-power-induction (lemma). For X→S dominant with geometrically irreducible generic fibre, positive relative dimension, generating fibres and finite generic stabilizer, the quotient-rank criterion applied to X^[m] for m≥dimS and generically finite modular map cannot yield a deficient rank.

Proof/construction spine:

1. Suppose a quotient witnesses deficient rank. After a finite cover choose the generic section and diagonalize the abelian kernel by rational orthogonal projections.
2. For the dimension-drop induction on the diagonal product, re-diagonalize the new kernel at every step. Do not assume the first isogeny preserves recursive coordinate blocks.
3. Use generation and finite stabilizer to contradict the surviving dimension inequality; m≥dimS is the fibre-power threshold.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B3/betti-rank-quotient; AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility.

Acceptance: For X→S dominant with geometrically irreducible generic fibre, positive relative dimension, generating fibres and finite generic stabilizer, the quotient-rank criterion applied to X^[m] for m≥dimS and generically finite modular map cannot yield a deficient rank..

Source: GaoBetti, Theorem 10.1(i), pp.26–29; Appendix B, pp.33–35.

Exact unresolved inputs:

- Recursive kernel diagonalization: Implement the corrected v6 induction with finite covers, connected kernels of the orthogonal endomorphisms and a new diagonalization at each stage. The projections with positive-dimensional kernels are endomorphisms; only their combined product map is an isogeny. Verify all dimension equalities before supplying the endpoint.

### Theorem 6.2 (non-degeneracy of D_M(C_S^{[M+1]}), Gao)

Declaration AbelianSchemesAndArithmeticModuliPartII:B4/dgh-25 (theorem). Let S be an irreducible variety over ℚ̄ with a quasi-finite morphism S → M_g, g ≥ 2, M ≥ 3g − 2 (Gao's theorem is stated over ℂ). Then D_M(C_S^{[M+1]}) ⊆ 𝔄_g^{[M]} ×_{A_g} S is non-degenerate.

Proof/construction spine:

1. Use the imported section-free universal curve difference map.
2. The generating/nonelliptic curve has finite stabilizer; choose a point after finite cover and apply Gao Theorem 10.1(ii).
3. Use threshold M≥dim(jC)=dimS+1; the Betti target torus has dimension 2Mg, not 2g.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B4/fibre-power-induction; JacobianChallengePartII:JC7/universal-faltings-zhang.

Acceptance: Let S be an irreducible variety over ℚ̄ with a quasi-finite morphism S → M_g, g ≥ 2, M ≥ 3g − 2 (Gao's theorem is stated over ℂ). Then D_M(C_S^{[M+1]}) ⊆ 𝔄_g^{[M]} ×_{A_g} S is non-degenerate..

Source: DGH, Theorem 6.2 and proof, pp.26–28, citing Gao [Gao20a, Thm. 1.2′, Thm. 1.3(ii)], arXiv v3 (31 March 2021).

Routed targets: PAPER-DIMITROV-GAO-HABEGGER-21/25.

### Gao's non-degeneracy criterion for fibered powers

Declaration AbelianSchemesAndArithmeticModuliPartII:B4/gao-fibre-power (theorem). Let A → S be an abelian scheme over an irreducible base and X ⊆ A an irreducible subvariety dominating S with (a) relative dimension ≥ 1, (b) X_s generating A_s for all s, (c) X_η of finite stabilizer. If m ≥ dim S and ι^{[m]}|_{X^{[m]}} (the moduli map to 𝔄_g^{[m]}) is generically finite, then X^{[m]} ⊆ A^{[m]} is non-degenerate. Work with a geometrically irreducible generic fibre, or select a dominating component after the quasi-finite étale cover in survey footnote 6; the whole reducible fibre product is not called irreducible.

Proof/construction spine:

1. Apply the corrected fibre-power induction and retain geometric generic irreducibility, m≥dimS and generic finiteness of the modular map.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B4/fibre-power-induction.

Acceptance: Let A → S be an abelian scheme over an irreducible base and X ⊆ A an irreducible subvariety dominating S with (a) relative dimension ≥ 1, (b) X_s generating A_s for all s, (c) X_η of finite stabilizer. If m ≥ dim S and ι^{[m]}|_{X^{[m]}} (the moduli map to 𝔄_g^{[m]}) is generically finite, then X^{[m]} ⊆ A^{[m]} is non-degenerate. Work with a geometrically irreducible generic fibre, or select a dominating component after the quasi-finite étale cover in survey footnote 6; the whole reducible fibre product is not called irreducible..

Source: GaoSurvey, Theorem 6.5(i), p.16; Gao Theorem 10.1(i), pp.26–29.

Routed targets: PAPER-GAO-GE-KUHNE-26/50.

### Non-degeneracy is preserved by the difference construction

Declaration AbelianSchemesAndArithmeticModuliPartII:B4/difference-product (theorem). If X^{[m]}_{S′} is non-degenerate, then so is D(X^{[m(M+2)]}_{S′}) = X^{[m]}_{S′} ×_{S′} D₀((X^{[m]}_{S′})^{[M+1]}) ⊆ A^{[m(M+1)]}_{S′}. For arbitrary abelian families the group-valued difference is the native group-law specialization; the curve case uses the imported Jacobian map. Choose the dominating irreducible components when needed.

Proof/construction spine:

1. Put Y equal to the dominant difference image D₀((X^[m])^[M+1]); retain the geometric generic irreducible component convention.
2. Apply the non-degenerate dominant product lemma to X^[m]×_S Y.
3. The first independent factor is essential to this argument; no dimension-impossible claim that the entire difference morphism is generically injective is used.

Inputs: AbelianSchemesAndArithmeticModuliPartII:B4/non-degenerate-product; JacobianChallengePartII:JC2/curve-difference.

Acceptance: If X^{[m]}_{S′} is non-degenerate, then so is D(X^{[m(M+2)]}_{S′}) = X^{[m]}_{S′} ×_{S′} D₀((X^{[m]}_{S′})^{[M+1]}) ⊆ A^{[m(M+1)]}_{S′}. For arbitrary abelian families the group-valued difference is the native group-law specialization; the curve case uses the imported Jacobian map. Choose the dominating irreducible components when needed..

Source: GaoSurvey, Lemma 6.2, p.15; §8.3 Step 1, p.22.

Routed targets: PAPER-GAO-GE-KUHNE-26/67.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:B4 is planned; proof and supplier refinements below prevent a closure claim.

## F0. Finite-field Frobenius and Tate

Keep q=p^a throughout Tate full faithfulness and Frobenius polynomials, with ℓ independence and point counts. Honda multiplicities follow in F3 after characteristic-prime local invariants.

### Compact preimages and exact lattice limits

Declaration AbelianSchemesAndArithmeticModuliPartII:F0/compact-preimages (lemma). If compact nonempty closed sets of preimages in a fixed compact polarized parameter space form a nested inverse system, their intersection is nonempty. This proves equality of the lattice image with the limiting isotropic subspace only after the compatible preimages are constructed.

Proof/construction spine:

1. Use finite fixed-polarization isomorphism classes, not unpolarized isomorphism counts.
2. Choose preimages of each finite approximation and impose the compatibility equations as nested closed conditions.
3. Use compactness of the preimage system; the image of an intersection cannot be exchanged with intersection of images without this argument.

Inputs: PELModuli:M6.

Acceptance: If compact nonempty closed sets of preimages in a fixed compact polarized parameter space form a nested inverse system, their intersection is nonempty. This proves equality of the lattice image with the limiting isotropic subspace only after the compatible preimages are constructed..

Source: Tate1966, Proposition 1, pp.134–138.

Exact unresolved inputs:

- Tate compactness and finiteness setup: Supply the fixed-polarization finite-type/finiteness theorem, topology on the finite lattice approximations and compatible compact preimages. The proof of Tate Proposition 1 must not use the later unpolarized counting endpoint.

### Tate at a split Frobenius prime

Declaration AbelianSchemesAndArithmeticModuliPartII:F0/split-prime-tate (lemma). For ℓ≠p where the separable Frobenius factors split, Tate Proposition 2 and the isotropic image lemma identify the geometric Hom space with the Frobenius commutant; the dimension is independent of ℓ and the integral image is saturated.

Proof/construction spine:

1. Decompose by distinct Frobenius eigenvalues and identify the split commutant.
2. Use the isotropic-image lemma plus the block dimensions.
3. Recover all ℓ from the rational Hom dimension; obtain Hom(A,B) as the off-diagonal corner for A×B.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/compact-preimages; AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective; AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank; AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple.

Acceptance: For ℓ≠p where the separable Frobenius factors split, Tate Proposition 2 and the isotropic image lemma identify the geometric Hom space with the Frobenius commutant; the dimension is independent of ℓ and the integral image is saturated..

Source: Tate1966, Proposition 2; §3; pp.138–144.

Exact unresolved inputs:

- Split-commutant dimension lemmas: Supply each eigenspace/block dimension in Tate Proposition 2 and the prime-independence comparison; the complete scanned Tate paper is read, but no native proof or resolved linear-algebra chain is claimed.

### Frobenius polynomial and reciprocity

Declaration AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial (definition). For A/F_q of dimension g, P_A(X)=det(X−Frob_q|V_ℓA) is a monic polynomial in Z[X] of degree 2g, independent of ℓ, with all complex roots of absolute value √q and coefficients satisfying a_(2g−i)=q^(g−i)a_i. Coefficients a_i are indexed in descending powers: P_A=∑_(i=0)^(2g) a_i X^(2g−i), with a_0=1 and a_(2g)=q^g.

Proof/construction spine:

1. Construct the object on the imported carriers in the convention fixed in the statement.
2. Verify the data/projection equations and the three tests below before exposing the interface.
3. The exact geometric or algebraic adapter absent from the pinned libraries is recorded in the accompanying gap; this target-level node does not assert an implementation.

Inputs: AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module.

API:

- AbelianArithmetic.frobeniusPolynomial_integral (data): P_A∈Z[X] is independent of ℓ≠p and has degree 2 dim A.
- AbelianArithmetic.frobeniusPolynomial_reciprocal (relation): Writing P_A=∑a_i X^(2g−i), a_(2g−i)=q^(g−i)a_i for 0≤i≤g, a_0=1 and a_(2g)=q^g.
- AbelianArithmetic.frobeniusPolynomial_product (functoriality): P_(A×B)=P_A P_B.
- AbelianArithmetic.frobeniusPolynomial_points (projection): #A(F_(q^r))=det(1−π^r) on V_ℓA.

Unit tests:

- AbelianArithmetic.frobeniusPolynomial_zero (degenerate): For the zero-dimensional abelian variety P_A=1 and the point count is 1.
- AbelianArithmetic.frobeniusPolynomial_elliptic (computation): For an elliptic curve, P_A=X²−tX+q and #A(F_q)=q+1−t.
- AbelianArithmetic.frobeniusPolynomial_native (compatibility): For ℓ≠p its image in Q_ℓ[X] is the imported characteristic polynomial of the Frobenius action on V_ℓA.

Acceptance: For A/F_q of dimension g, P_A(X)=det(X−Frob_q|V_ℓA) is a monic polynomial in Z[X] of degree 2g, independent of ℓ, with all complex roots of absolute value √q and coefficients satisfying a_(2g−i)=q^(g−i)a_i..

Source: Waterhouse, §2; §4.3.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/weil-polynomial.

Exact unresolved inputs:

- Interface proof: Frobenius polynomial and reciprocity: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: For the zero-dimensional abelian variety P_A=1 and the point count is 1.; For an elliptic curve, P_A=X²−tX+q and #A(F_q)=q+1−t.; For ℓ≠p its image in Q_ℓ[X] is the imported characteristic polynomial of the Frobenius action on V_ℓA.. The source passage is read; its library adapter and any cited external proof remain unresolved.

### Weil q-numbers

Declaration AbelianSchemesAndArithmeticModuliPartII:F0/weil-q-number (definition). For q=p^a with p prime and a≥1, a Weil q-number is an algebraic integer π whose image under every complex embedding of Q(π) has absolute value sqrt(q). Classification uses conjugacy classes of these numbers, not arbitrary reciprocal polynomials of degree 2g.

Proof/construction spine:

1. Use algebraic integrality and complex embeddings of the generated number field.
2. Make the conjugacy equivalence independent of a chosen presentation of Q(π).
3. Distinguish a Weil polynomial from a realizable dimension-g Frobenius polynomial through the Honda multiplicity.

Inputs: Routine algebra plus the specifically recorded source gap.

API:

- AbelianArithmetic.weilQNumber_norm (characterisation): For every embedding σ:Q(π)→C, |σπ|²=q.
- AbelianArithmetic.weilQNumber_conjugate (relation): Algebraic conjugates of a Weil q-number are Weil q-numbers.
- AbelianArithmetic.weilQNumber_power (functoriality): π^r is a Weil q^r-number for r≥1.

Unit tests:

- AbelianArithmetic.weilQNumber_real (computation): ±sqrt(p) are Weil p-numbers and have minimal polynomial X²−p.
- AbelianArithmetic.weilQNumber_one (degenerate): For q>1 the algebraic integer 1 is not a Weil q-number.
- AbelianArithmetic.weilQNumber_frobenius (compatibility): Every Frobenius eigenvalue of the imported characteristic polynomial of A/F_q is a Weil q-number.

Acceptance: For q=p^a with p prime and a≥1, a Weil q-number is an algebraic integer π whose image under every complex embedding of Q(π) has absolute value sqrt(q). Classification uses conjugacy classes of these numbers, not arbitrary reciprocal polynomials of degree 2g..

Source: Waterhouse, Chapter 2, pp.525–530.

Exact unresolved inputs:

- Weil estimates and algebraic-number carrier: Supply the ℓ-independent Weil absolute-value theorem from the existing Weil-conjecture roadmap and the embedding/conjugacy carrier for Weil numbers. A bare integer reciprocal polynomial need not be realizable in the same dimension.

### Tate full faithfulness over finite fields

Declaration AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom (theorem). For A,B/F_q and ℓ≠p, Hom_Fq(A,B)⊗Z_ℓ→Hom_Gal(T_ℓA,T_ℓB) is an isomorphism; rationalizing gives the analogous Q_ℓ statement.

Proof/construction spine:

1. Combine split-prime Tate with ℓ-independent rational Hom dimensions.
2. Use the imported injectivity and prove integral saturation; take the off-diagonal corner for A×B.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/split-prime-tate.

Acceptance: For A,B/F_q and ℓ≠p, Hom_Fq(A,B)⊗Z_ℓ→Hom_Gal(T_ℓA,T_ℓB) is an isomorphism; rationalizing gives the analogous Q_ℓ statement..

Source: Tate1966, Propositions 1–2; §3, pp.134–144.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/tate-hom.

### Tate’s isotropic image lemma

Declaration AbelianSchemesAndArithmeticModuliPartII:F0/tate-isotropic-image (theorem). Let A/k have a k-polarization θ of degree d², let ℓ≠char(k), and assume Tate’s Hyp(k,A,d,ℓ): only finitely many k-isomorphism classes B admitting a degree-d² k-polarization and an ℓ-power isogeny B→A. Every Galois-stable maximal isotropic Q_ℓ-subspace W⊆V_ℓ(A) for θ is the image of some u∈End_k(A)⊗Q_ℓ.

Proof/construction spine:

1. Approximate the prescribed isotropic subspace by compatible finite torsion/lattice data.
2. Use the fixed-polarization finite-class pigeonhole argument.
3. Take compact compatible preimages to realize the limit as an isogeny image; do not exchange image with intersection.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/compact-preimages.

Acceptance: Let A/k have a k-polarization θ of degree d², let ℓ≠char(k), and assume Tate’s Hyp(k,A,d,ℓ): only finitely many k-isomorphism classes B admitting a degree-d² k-polarization and an ℓ-power isogeny B→A. Every Galois-stable maximal isotropic Q_ℓ-subspace W⊆V_ℓ(A) for θ is the image of some u∈End_k(A)⊗Q_ℓ..

Source: Tate1966, Proposition 1, pp.134–138.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/tate-isotropic-image.

### Point counts are isogeny invariant

Declaration AbelianSchemesAndArithmeticModuliPartII:F0/point-count-isogeny (theorem). For A/F_q, #A(F_(q^r))=det(1−Frob_q^r|V_ℓA), so point counts are invariant under F_q-isogeny and multiply on products.

Proof/construction spine:

1. An F_q-isogeny identifies rational Tate representations and their Frobenius powers.
2. The characteristic polynomial gives #A(F_(q^r))=det(1−π^r) for every r≥1.
3. Only the orders agree; the groups of rational points need not be isomorphic.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial; AbelianSchemesAndArithmeticModuliPartII:F0/split-prime-tate.

Acceptance: For A/F_q, #A(F_(q^r))=det(1−Frob_q^r|V_ℓA), so point counts are invariant under F_q-isogeny and multiply on products..

Source: Waterhouse, Chapter 2; DPH §3.3.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/point-count-isogeny.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:F0 is planned; proof and supplier refinements below prevent a closure claim.

## F1. Characteristic-prime realization

Use the imported contravariant Dieudonné carrier, the determinant/length formula, integral saturation, resultant recognition and cyclic block algebras to prove p-Tate and local invariants.

### Degree from Dieudonné cokernel length

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/dieudonne-degree-length (lemma). For an isogeny f:A→B over a perfect field, the contravariant map C(f):C(B)→C(A) is injective and length_W coker C(f)=v_p(deg f). For an endomorphism its determinant valuation gives the same value.

Proof/construction spine:

1. Use exactness of the imported finite/p-divisible Dieudonné functor on the finite p-primary kernel.
2. Compare W-length with the finite group scheme order.
3. Only for an endomorphism use the determinant on one fixed lattice; for A→B the invariant is cokernel length.

Inputs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible.

Acceptance: For an isogeny f:A→B over a perfect field, the contravariant map C(f):C(B)→C(A) is injective and length_W coker C(f)=v_p(deg f). For an endomorphism its determinant valuation gives the same value..

Source: Milne1968, §1, printed pp.65–66 (PDF pp.3–4).

### Characteristic polynomial on the p-realization

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/p-characteristic-polynomial (lemma). For every u∈End(A), the W(k)-linear map C(u) has characteristic polynomial in Z_p[X] equal to the imported integer characteristic polynomial of u. No semisimplicity of arbitrary u is assumed.

Proof/construction spine:

1. The σ-semilinear F commutes with C(u), forcing characteristic coefficients to be σ-fixed and hence p-adically integral.
2. For integer polynomial ψ, use Dieudonné degree valuation on ψ(u) whenever it is an isogeny.
3. Use p-adic resultant recognition on the common nonzero tests to identify the polynomial.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/dieudonne-degree-length; AbelianSchemesAndArithmeticModuliPartII:F2/padic-recognition; AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism.

Acceptance: For every u∈End(A), the W(k)-linear map C(u) has characteristic polynomial in Z_p[X] equal to the imported integer characteristic polynomial of u. No semisimplicity of arbitrary u is assumed..

Source: Milne1968, §1, printed pp.65–66 (PDF pp.3–4).

### Rational and integral p-Tate comparison

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof (lemma). For A,B/F_q, Hom(A,B)⊗Q_p≃Hom_(F,V)(C(B)[1/p],C(A)[1/p]); the integral map is an isomorphism onto the F,V-compatible integral morphisms after its injectivity and p-saturation are proved.

Proof/construction spine:

1. Prove saturated integral injectivity by descent through the p-primary finite kernel, retaining contravariance.
2. The q-Frobenius F^a has the imported characteristic polynomial and is semisimple via its centrality in the semisimple rational endomorphism algebra.
3. Decompose Frobenius blocks; compare their semilinear commutants by the cyclic algebra/double-centralizer calculation and use the rational Hom dimension. Saturation then supplies the integral result.

Inputs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible; AbelianSchemesAndArithmeticModuliPartII:F1/p-characteristic-polynomial; AbelianSchemesAndArithmeticModuliPartII:F0/split-prime-tate; AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple; AbelianSchemesAndArithmeticModuliPartII:F1/p-hom-saturation; AbelianSchemesAndArithmeticModuliPartII:F1/cyclic-block-split; AbelianSchemesAndArithmeticModuliPartII:F1/p-commutant-dimension; AbelianSchemesAndArithmeticModuliPartII:F1/q-frobenius-semisimple.

Acceptance: For A,B/F_q, Hom(A,B)⊗Q_p≃Hom_(F,V)(C(B)[1/p],C(A)[1/p]); the integral map is an isomorphism onto the F,V-compatible integral morphisms after its injectivity and p-saturation are proved..

Source: WaterhouseMilne, Part II Theorem 1, printed pp.60–61 (PDF pp.8–9).

Exact unresolved inputs:

- p-Tate saturated injection: Supply the geometric factorization proving p-saturation of Hom into the contravariant Dieudonné Hom group, before using p-Tate. Full faithfulness of the p-divisible functor alone does not imply full faithfulness for abelian varieties.
- Cyclic Frobenius blocks and opposite conventions: Construct each σ-crossed-product block over the unramified coefficient field, split it by the weighted cyclic matrix after algebraic closure, compute dimensions and track the two opposite algebras in the contravariant commutant. The scalar coefficient tensor can be a product; it is not assumed a field.

### Algebra acting on a Frobenius polynomial block

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/frobenius-block-algebra (construction). Let L/Q_p be unramified of degree a≥1 with arithmetic Frobenius σ, and let m∈Q_p[X] be monic irreducible with m(0)≠0. Put K=Q_p[X]/m and θ=X mod m. On ⊕_(0≤j<a)(L⊗Qp K)U^j define multiplication by U b=(σ⊗1)(b)U and U^a=θ. This defines a K-algebra B of dimension a². If a semilinear bijection F on an L-vector space V satisfies m(F^a)=0, the actions of L, θ↦F^a and U↦F define a B-module structure on V. The coefficient tensor L⊗Q_p K may be étale with several factors; preserve the σ action on all factors.

Proof/construction spine:

1. Construct the object on the imported carriers in the convention fixed in the statement.
2. Verify the data/projection equations and the three tests below before exposing the interface.
3. The exact geometric or algebraic adapter absent from the pinned libraries is recorded in the accompanying gap; this target-level node does not assert an implementation.

Inputs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible; AbelianSchemesAndArithmeticModuliPartII:F1/p-characteristic-polynomial.

API:

- AbelianArithmetic.frobeniusBlock_relation (relation): U c=σ(c)U and U^a=θ on L⊗_(Q_p)K; θ is the chosen q-Frobenius root.
- AbelianArithmetic.frobeniusBlock_dimension (data): The algebra has K-dimension a² after the coefficient étale algebra is handled correctly.
- AbelianArithmetic.frobeniusBlock_action (structure): On the corresponding isocrystal block, the semilinear F gives an action of this cyclic algebra.

Unit tests:

- AbelianArithmetic.frobeniusBlock_prime (degenerate): For a=1 the block algebra is K, with U=θ.
- AbelianArithmetic.frobeniusBlock_split (characterisation): After a splitting base extension it is a full a×a matrix algebra, with weighted cyclic U and diagonal coefficient action.
- AbelianArithmetic.frobeniusBlock_product_coeff (non-example): If L⊗Q_p K is a product, the construction retains every idempotent and its σ-permutation; it is not replaced by one arbitrarily selected coefficient field.

Acceptance: Let L/Q_p be unramified of degree a≥1 with arithmetic Frobenius σ, and let m∈Q_p[X] be monic irreducible with m(0)≠0. Put K=Q_p[X]/m and θ=X mod m. On ⊕_(0≤j<a)(L⊗Qp K)U^j define multiplication by U b=(σ⊗1)(b)U and U^a=θ. This defines a K-algebra B of dimension a². If a semilinear bijection F on an L-vector space V satisfies m(F^a)=0, the actions of L, θ↦F^a and U↦F define a B-module structure on V. The coefficient tensor L⊗Q_p K may be étale with several factors; preserve the σ action on all factors..

Source: WaterhouseMilne, WM71 Part II p.60 cyclic quotient and p.61 presentation; explicit finite-sum presentation of handoff P3..

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/p-frobenius-block-algebra.

Exact unresolved inputs:

- Interface proof: Algebra acting on a Frobenius polynomial block: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: For a=1 the block algebra is K, with U=θ.; After a splitting base extension it is a full a×a matrix algebra, with weighted cyclic U and diagonal coefficient action.; If L⊗Q_p K is a product, the construction retains every idempotent and its σ-permutation; it is not replaced by one arbitrarily selected coefficient field.. The source passage is read; its library adapter and any cited external proof remain unresolved.

### Integral Tate full faithfulness at the characteristic prime

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/integral-p-tate (theorem). For abelian varieties A,B/F_q, let C(A),C(B) be the contravariant Dieudonné modules of their p-divisible groups over W(F_q), with their F,V actions. The natural map Hom_Fq(A,B)⊗Z_p→Hom_{W(F_q),F,V}(C(B),C(A)) is an isomorphism.

Proof/construction spine:

1. Use the rational p-Tate result and the separately proved integral saturated injection.
2. Clear denominators and use saturation to obtain the integral contravariant map Hom(A,B)⊗Z_p→Hom_(F,V)(C(B),C(A)).

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof.

Acceptance: For abelian varieties A,B/F_q, let C(A),C(B) be the contravariant Dieudonné modules of their p-divisible groups over W(F_q), with their F,V actions. The natural map Hom_Fq(A,B)⊗Z_p→Hom_{W(F_q),F,V}(C(B),C(A)) is an isomorphism..

Source: WaterhouseMilne, Part II Theorem 1, pp.60–61.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/p-tate-hom.

### Rational p-Tate comparison

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/rational-p-tate (theorem). For A,B/F_(p^a), Hom_k(A,B)⊗Q_p→Hom_(L,F)(C(B)[1/p],C(A)[1/p]) is an isomorphism of Q_p-vector spaces. For A=B it identifies End⁰_k(A)^op⊗Q_p with the equivariant endomorphism algebra.

Proof/construction spine:

1. Apply the cyclic block dimension comparison and the ℓ-independent rational endomorphism dimension.
2. Take the A×B off-diagonal corner, tracking the opposite algebra from contravariance.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof.

Acceptance: For A,B/F_(p^a), Hom_k(A,B)⊗Q_p→Hom_(L,F)(C(B)[1/p],C(A)[1/p]) is an isomorphism of Q_p-vector spaces. For A=B it identifies End⁰_k(A)^op⊗Q_p with the equivariant endomorphism algebra..

Source: WaterhouseMilne, Part II Theorem 1, pp.60–61.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/rational-p-tate-hom.

### Saturated injection on integral p-realization Hom groups

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/p-hom-saturation (theorem). For A,B/F_(p^a), the natural map j:Hom_k(A,B)⊗Z_p→Hom_(W,F,V)(C(B),C(A)) is injective with p-saturated image. This statement does not assume rational p-Tate or equality of ranks.

Proof/construction spine:

1. If an integral realization morphism is divisible by p, prove its geometric abelian map factors through multiplication by p.
2. Use finite-flat p-kernel exactness to descend the factorization.
3. Iterate for p^n; no use of p-Tate is allowed in this prerequisite.

Inputs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible.

Acceptance: For A,B/F_(p^a), the natural map j:Hom_k(A,B)⊗Z_p→Hom_(W,F,V)(C(B),C(A)) is injective with p-saturated image. This statement does not assume rational p-Tate or equality of ranks..

Source: WaterhouseMilne, Part II Theorem 1 proof, p.60.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/p-realization-saturated-hom.

### Semisimplicity of the linear q-Frobenius realization

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/q-frobenius-semisimple (theorem). For A/F_(p^a), C(π_A)=F^a is an L-linear semisimple endomorphism of C(A)[1/p], where π_A is the q-power Frobenius. Its characteristic polynomial is P_A. No semisimplicity claim for arbitrary endomorphisms is included.

Proof/construction spine:

1. The geometric q-Frobenius is central in End⁰_Fq(A).
2. Its image in the center of each semisimple block has separable minimal polynomial in characteristic zero.
3. Transport to the realization using injectivity; this proves semisimplicity of F^a, not of every endomorphism.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/p-characteristic-polynomial; AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple.

Acceptance: For A/F_(p^a), C(π_A)=F^a is an L-linear semisimple endomorphism of C(A)[1/p], where π_A is the q-power Frobenius. Its characteristic polynomial is P_A. No semisimplicity claim for arbitrary endomorphisms is included..

Source: Milne1968, §1, p.66.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/p-frobenius-semisimplicity.

### Central simplicity of a Frobenius block algebra

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/cyclic-block-split (theorem). The algebra B in p-frobenius-block-algebra is central simple over K. For an algebraic closure Ω/K, B⊗K Ω≅M_a(Ω). In particular the conclusion includes the cases where L⊗Qp K is a product of fields.

Proof/construction spine:

1. Over an algebraic closure split the coefficient étale algebra into a diagonal product.
2. Represent U by a weighted cyclic permutation matrix with product θ.
3. The idempotents and cyclic matrix generate all matrix units, giving central simplicity and degree a.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/frobenius-block-algebra; tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-4-central-simple-algebras-and-their-tensor-products.

Acceptance: The algebra B in p-frobenius-block-algebra is central simple over K. For an algebraic closure Ω/K, B⊗K Ω≅M_a(Ω). In particular the conclusion includes the cases where L⊗Qp K is a product of fields..

Source: WaterhouseMilne, Part II Theorem 1 proof, p.60.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/p-frobenius-block-split.

### Dimension of the semilinear Frobenius commutant

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/p-commutant-dimension (theorem). For A/F_(p^a), factor P_A=∏m_i^(e_i) over Q_p into distinct monic irreducibles of degrees d_i. For V=C(A)[1/p] and R=L[F,F^(-1)], dim_Qp End_R(V)=Σ_i d_i e_i².

Proof/construction spine:

1. Apply the central-simple block module decomposition with the correct coefficient field and opposite algebra.
2. Compute the dimension of its commutant from the multiplicity of each simple block.
3. Compare with the characteristic polynomial exponents, not just distinct roots.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/frobenius-block-algebra; AbelianSchemesAndArithmeticModuliPartII:F1/cyclic-block-split; tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-5-skolem-noether-and-the-centralizer-theorem.

Acceptance: For A/F_(p^a), factor P_A=∏m_i^(e_i) over Q_p into distinct monic irreducibles of degrees d_i. For V=C(A)[1/p] and R=L[F,F^(-1)], dim_Qp End_R(V)=Σ_i d_i e_i²..

Source: WaterhouseMilne, Part II Theorem 1 proof, p.60.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/p-frobenius-centralizer-dimension.

### Characteristic-prime invariant of a simple endomorphism algebra

Declaration AbelianSchemesAndArithmeticModuliPartII:F1/p-local-invariant (theorem). Let A/F_(p^a) be simple, with Frobenius π and center Q(π) of E=End⁰_k(A). For v|p put K=Q(π)_v, e_v=ord_v(p) and f_v its residue degree, with ord_v a uniformizer-normalized valuation. Then inv_v(E)=f_v ord_v(π)/a=[K:Q_p]ord_v(π)/ord_v(p^a) in Q/Z.

Proof/construction spine:

1. Identify the p-completion of the simple endomorphism division algebra as the double-opposite commutant of the cyclic block algebra.
2. Normalize ord_v by ord_v(uniformizer)=1.
3. For v|p, compute inv_v(E)=[K_v:Q_p]·ord_v(π)/ord_v(q) mod Z; at real places the invariant is 1/2 and at complex places zero.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/frobenius-block-algebra; AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Acceptance: Let A/F_(p^a) be simple, with Frobenius π and center Q(π) of E=End⁰_k(A). For v|p put K=Q(π)_v, e_v=ord_v(p) and f_v its residue degree, with ord_v a uniformizer-normalized valuation. Then inv_v(E)=f_v ord_v(π)/a=[K:Q_p]ord_v(π)/ord_v(p^a) in Q/Z..

Source: WaterhouseMilne, Part II Theorem 2, p.61.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/p-endomorphism-local-invariant.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:F1 is planned; proof and supplier refinements below prevent a closure claim.

## F2. Resultant recognition

Lift coefficients at fixed ideal-power precision, control fixed-size resultants and recover irreducible factor multiplicities from shifted approximate factors. This adapter is independent of p-Tate.

### Monic coefficient lifting

Declaration AbelianSchemesAndArithmeticModuliPartII:F2/monic-lift (lemma). Let ι:D→O be a ring homomorphism surjective modulo (π^N). For monic R∈O[X], lift every coefficient below degree d=natDegree R modulo π^N and set the leading coefficient to 1; this gives a monic ψ∈D[X] of degree d with ψ≡R mod π^N.

Proof/construction spine:

1. Choose one preimage for each of the finitely many lower coefficients.
2. Form X^d plus the lifted lower-degree polynomial.
3. Coefficient congruence gives polynomial congruence and exact degree without completeness or a finite residue field.

Inputs: Routine algebra plus the specifically recorded source gap.

Acceptance: Let ι:D→O be a ring homomorphism surjective modulo (π^N). For monic R∈O[X], lift every coefficient below degree d=natDegree R modulo π^N and set the leading coefficient to 1; this gives a monic ψ∈D[X] of degree d with ψ≡R mod π^N..

Source: Milne1968, §1, p.65; routed self-contained coefficient adapter.

### Fixed-size resultant congruence

Declaration AbelianSchemesAndArithmeticModuliPartII:F2/fixed-resultant-congruence (lemma). For polynomials P,Q,Q′ with Q≡Q′ mod I, the fixed-size Sylvester resultants Res_(m,n)(P,Q) and Res_(m,n)(P,Q′) are congruent mod I. For the default resultant preserve the actual degrees m,n; degree dropping is not silently allowed.

Proof/construction spine:

1. Each Sylvester entry is a coefficient of P or Q.
2. Reduce the two matrices modulo I and use determinant functoriality.
3. When using the default resultant carry the equality of the degree parameters explicitly.

Inputs: mathlib:Polynomial.resultant.

Acceptance: For polynomials P,Q,Q′ with Q≡Q′ mod I, the fixed-size Sylvester resultants Res_(m,n)(P,Q) and Res_(m,n)(P,Q′) are congruent mod I. For the default resultant preserve the actual degrees m,n; degree dropping is not silently allowed..

Source: Milne1968, §1, p.65; routed resultant-congruence adapter.

### Multiplicity detected by shifted factors

Declaration AbelianSchemesAndArithmeticModuliPartII:F2/shifted-factor-slope (lemma). Let O be a DVR, R,S monic with gcd(R,S)=1 over Frac(O), d=degR>0, and P=R^e S. If monic ψ_n≡R+π^n mod π^(2n) and degψ_n=d, then eventually Res(P,ψ_n)≠0 and v Res(P,ψ_n)=nde+v Res(S,R).

Proof/construction spine:

1. The fixed-degree determinant congruence gives Res(R,ψ_n)≡π^(nd) mod π^(2n) only when 2n exceeds nd; instead use root/eigenvalue perturbation: ψ_n(root R)=π^n(1+π^n a), so the norm has valuation nd.
2. For the S block, resultant congruence and n>v Res(S,R) keep its valuation constant.
3. Use resultant multiplicativity and sufficiently large n; S=1 and e=0 are included.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F2/monic-lift; AbelianSchemesAndArithmeticModuliPartII:F2/fixed-resultant-congruence.

Acceptance: Let O be a DVR, R,S monic with gcd(R,S)=1 over Frac(O), d=degR>0, and P=R^e S. If monic ψ_n≡R+π^n mod π^(2n) and degψ_n=d, then eventually Res(P,ψ_n)≠0 and v Res(P,ψ_n)=nde+v Res(S,R)..

Source: Milne1968, §1, p.65; routed factor-slope self-contained adapter.

Exact unresolved inputs:

- Factor integrality and resultant valuation perturbation: Supply the pinned monic-factor Gauss integrality theorem for a DVR, the quotient-ring norm/resultant formula and valuation invariance for 1+π^n a in the finite integral O-algebra O[X]/(R). A congruence modulo π^(2n) of scalar resultants alone is insufficient when degR>2.

### Recognition from nonzero monic resultant tests

Declaration AbelianSchemesAndArithmeticModuliPartII:F2/resultant-recognition (lemma). If monic P,Q∈O[X] have equal valuations of every common nonzero resultant with monic polynomials lifted from D, and D→O is surjective modulo each π^N, then P=Q. Equal degree, completeness, separability, characteristic zero and finite residue field are unnecessary.

Proof/construction spine:

1. Factor P,Q monically over the fraction field and use monic factor integrality.
2. For every nonconstant irreducible R in PQ, lift R+π^n to precision 2n and apply the factor-slope theorem to each polynomial.
3. Subtract the valuations at consecutive sufficiently large n to identify each exponent. Monicity removes the unit ambiguity; P=1 is covered.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F2/shifted-factor-slope.

Acceptance: If monic P,Q∈O[X] have equal valuations of every common nonzero resultant with monic polynomials lifted from D, and D→O is surjective modulo each π^N, then P=Q. Equal degree, completeness, separability, characteristic zero and finite residue field are unnecessary..

Source: Milne1968, §1, p.65; routed recognition adapter.

### Integer tests for a p-adic polynomial

Declaration AbelianSchemesAndArithmeticModuliPartII:F2/padic-recognition (lemma). For prime p and monic P,Q∈Z_p[X], equality of v_p Res(P,ψ) and v_p Res(Q,ψ) for all monic ψ∈Z[X] with both resultants nonzero implies P=Q.

Proof/construction spine:

1. PadicInt.appr_spec gives coefficient representatives modulo every p^N.
2. Apply resultant recognition with D=Z, O=Z_p and normalized uniformizer p.
3. Do not assume factors of P,Q have integer coefficients; they need only be p-adically integral.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F2/resultant-recognition; mathlib:PadicInt.appr_spec; mathlib:PadicInt.valuation.

Acceptance: For prime p and monic P,Q∈Z_p[X], equality of v_p Res(P,ψ) and v_p Res(Q,ψ) for all monic ψ∈Z[X] with both resultants nonzero implies P=Q..

Source: Milne1968, §1, p.65; routed p-adic adapter.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:F2 is planned; proof and supplier refinements below prevent a closure claim.

## F3. Honda–Tate and lattice classifications

Classify simple classes by Weil numbers with the division-algebra multiplicity, then classify marked finite-support lattices and rational unmarked orbits. Keep the prime-field linear-dual convention explicit.

### Prime-to-p and p lattice spaces

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space (definition). X^p is the restricted product of Frob-stable full Z_ℓ-lattices in V_ℓ(A₀), equal to T_ℓ(A₀) almost everywhere; X_p is the set of W(F_q)-lattices in D(A₀) stable under both F and V.

Proof/construction spine:

1. Construct the object on the imported carriers in the convention fixed in the statement.
2. Verify the data/projection equations and the three tests below before exposing the interface.
3. The exact geometric or algebraic adapter absent from the pinned libraries is recorded in the accompanying gap; this target-level node does not assert an implementation.

Inputs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-groups-as-galois-modules.

API:

- AbelianArithmetic.markedLattice_primeToP (data): For each ℓ≠p choose a Frobenius-stable full Z_ℓ-lattice in V_ℓA equal to T_ℓA at all but finitely many ℓ.
- AbelianArithmetic.markedLattice_p (data): At p choose a full W(k)-lattice in the p-realization stable under F and V, in the stated variance convention.
- AbelianArithmetic.markedLattice_action (functoriality): End⁰(A)^× acts on the tuple through its realization, with the contravariant or linear-dual transport specified.

Unit tests:

- AbelianArithmetic.markedLattice_identity (compatibility): The identity marking gives precisely the imported T_ℓA and C(A) (or its stated linear dual).
- AbelianArithmetic.markedLattice_zero (degenerate): The zero-dimensional abelian variety has one lattice tuple.
- AbelianArithmetic.markedLattice_support (non-example): A tuple differing from the standard lattice at infinitely many primes is excluded from the finite-support space.

Acceptance: X^p is the restricted product of Frob-stable full Z_ℓ-lattices in V_ℓ(A₀), equal to T_ℓ(A₀) almost everywhere; X_p is the set of W(F_q)-lattices in D(A₀) stable under both F and V..

Source: Waterhouse, §3 equations (5)–(6).

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/marked-lattice-space.

Exact unresolved inputs:

- Interface proof: Prime-to-p and p lattice spaces: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: The identity marking gives precisely the imported T_ℓA and C(A) (or its stated linear dual).; The zero-dimensional abelian variety has one lattice tuple.; A tuple differing from the standard lattice at infinitely many primes is excluded from the finite-support space.. The source passage is read; its library adapter and any cited external proof remain unresolved.

### Honda–Tate simple isogeny classification

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate (theorem). Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π. The dimension is determined by 2 dim A=[Q(π):Q] sqrt([End⁰(A):Q(π)]), with the division-algebra local invariants prescribed by π.

Proof/construction spine:

1. Tate identifies isogeny classes with semisimple Frobenius representations and the endomorphism division algebra.
2. For a simple class set K=Q(π), let e be the least common denominator of all local invariants, including real places; P_A=m_π^e and 2dimA=e degm_π.
3. Honda existence for every Weil q-number is a separate source-proof gap; Waterhouse states it but its original proof has not been read.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/weil-q-number; AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof; AbelianSchemesAndArithmeticModuliPartII:F1/p-local-invariant; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants.

Acceptance: Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π. The dimension is determined by 2 dim A=[Q(π):Q] sqrt([End⁰(A):Q(π)]), with the division-algebra local invariants prescribed by π..

Source: Waterhouse, Chapter 2, pp.525–530.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/honda-tate.

Exact unresolved inputs:

- Honda existence: Obtain and decompose Honda 1968 existence for every Weil q-number, including the field-of-definition construction and multiplicity. Waterhouse Chapter 2 states the theorem; Smith cites it. Neither a citation nor arbitrary reciprocal polynomials supply the missing existence proof.

### Frobenius polynomial determines the isogeny class

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/isogeny-polynomial (theorem). Two abelian varieties over F_q are F_q-isogenous exactly when their Frobenius characteristic polynomials agree.

Proof/construction spine:

1. Use Tate Hom and Frobenius semisimplicity to identify equal Frobenius polynomials with equal rational representations.
2. The resulting rational Hom isogeny criterion is geometric, not merely equality of complex root multisets.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial; AbelianSchemesAndArithmeticModuliPartII:F0/split-prime-tate.

Acceptance: Two abelian varieties over F_q are F_q-isogenous exactly when their Frobenius characteristic polynomials agree..

Source: Tate1966, Theorem 1 and corollaries, pp.134–144.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/isogeny-polynomial.

### Commutative endomorphisms in the nonreal prime-field case

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-end-algebra (theorem). If A/F_p is simple and Q(Frob) has no real embedding, End⁰_Fp(A)=Q(Frob) is a CM field.

Proof/construction spine:

1. For nonreal Weil p-number π, K=Q(π) is CM, hence has no real places.
2. At v|p, a=1 makes [K_v:Q_p] ord_vπ/ord_v p an integer (residue-degree times integral valuation).
3. Every local invariant vanishes, so the division algebra is K by the global Brauer injection. Real ±sqrt(p) give a separate quaternionic surface block.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof; AbelianSchemesAndArithmeticModuliPartII:F1/p-local-invariant; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants.

Acceptance: If A/F_p is simple and Q(Frob) has no real embedding, End⁰_Fp(A)=Q(Frob) is a CM field..

Source: Waterhouse, Chapter 2 and Porism 4.3, pp.525–530,540.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/prime-field-end-algebra.

### Realization of nonreal prime-field orders

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-orders (theorem). In the preceding simple F_p-isogeny class, every order R in Q(Frob) containing Frob and p/Frob occurs as End_Fp(A′) for some A′ in that class.

Proof/construction spine:

1. In a nonreal simple F_p class, use the commutative endomorphism algebra and the order containing π,p/π.
2. Realize its local lattices and compute its multiplicator order by Waterhouse Theorem 6.1.
3. Do not extend this assertion to arbitrary q or identify every full lattice with an invertible ideal.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-end-algebra.

Acceptance: In the preceding simple F_p-isogeny class, every order R in Q(Frob) containing Frob and p/Frob occurs as End_Fp(A′) for some A′ in that class..

Source: Waterhouse, Theorem 6.1, pp.550–551.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/waterhouse-orders.

Exact unresolved inputs:

- Finite subgroup quotient and integral order realization: Supply the exact abelian quotient and lattice correspondence over the stated field, including the finite-flat kernel, local multiplicator order and finite support. Waterhouse kernel ideals and maximal-order theorems must not be generalized to all nonmaximal invertible ideals.

### Marked quasi-isogenies classified by lattices

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/marked-quasi-isogeny (theorem). Isomorphism classes of pairs (A,f:A→A₀ a rational quasi-isogeny) correspond to X_p×X^p via covariant realization transport.

Proof/construction spine:

1. Pass a marked quasi-isogeny to its prime-to-p Tate lattices and p-realization lattice.
2. Clear denominators to make a finite-flat kernel and take the abelian quotient.
3. General-q covariance must be reconciled with the imported contravariant carrier before claiming this classification.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-groups-as-galois-modules; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible.

Acceptance: Isomorphism classes of pairs (A,f:A→A₀ a rational quasi-isogeny) correspond to X_p×X^p via covariant realization transport..

Source: Waterhouse, Chapter 1 and §3.1, pp.521–526,530–532.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/marked-quasi-isogeny.

Exact unresolved inputs:

- General-q lattice variance: Prove the general-q covariant realization dictionary against the imported contravariant W(k)-Dieudonné functor. The prime-field linear dual is explicitly constructed separately; it is not silently applied to all q.

### Isomorphism classes as rational orbits

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/rational-orbits (theorem). The underlying F_q-isomorphism classes in the isogeny class of A₀ are End⁰(A₀)^×\(X_p×X^p).

Proof/construction spine:

1. Two markings differ by a rational quasi-automorphism of A.
2. An isomorphism between the underlying targets produces the rational End⁰(A)^× action, and conversely transport its realization to the lattices.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space; AbelianSchemesAndArithmeticModuliPartII:F3/marked-quasi-isogeny.

Acceptance: The underlying F_q-isomorphism classes in the isogeny class of A₀ are End⁰(A₀)^×\(X_p×X^p)..

Source: Waterhouse, §3.1–3.2, pp.530–535.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/forget-marking.

### Prime-field p-realization Frobenius polynomial

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-p-frobenius (theorem). For A/F_p the linear Frobenius F on C(A)⊗Q_p, and hence its transpose on D^lin(A), is semisimple and has characteristic polynomial equal to the intrinsic degree-2dim(A) Frobenius polynomial P_A(T)∈Z[T] occurring on every V_ℓ(A), ℓ≠p.

Proof/construction spine:

1. For q=p use D_lin(A)=Hom_Zp(C(A),Z_p), with transpose F,V.
2. This linear dual restores covariance and preserves the Frobenius characteristic polynomial.
3. It is not Cartier duality: do not swap F,V or multiply the polynomial by p.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/p-characteristic-polynomial; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible.

Acceptance: For A/F_p the linear Frobenius F on C(A)⊗Q_p, and hence its transpose on D^lin(A), is semisimple and has characteristic polynomial equal to the intrinsic degree-2dim(A) Frobenius polynomial P_A(T)∈Z[T] occurring on every V_ℓ(A), ℓ≠p..

Source: WaterhouseMilne, Part II, pp.60–61.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/prime-field-p-frobenius.

### Finite-support lattice tuples are realized over the prime field

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-realization (theorem). Fix A₀/F_p. Let M_ℓ be full π-stable Z_ℓ-lattices in V_ℓ(A₀) for ℓ≠p and M_p a full F,V-stable Z_p-lattice in D^lin(A₀), equal to the reference realization lattices T₀,ℓ at all but finitely many primes. There exist B/F_p and a rational quasi-isogeny f:B→A₀ with transported realization lattices f_ℓ(T_ℓB)=M_ℓ, including D^lin at p.

Proof/construction spine:

1. In the covariant linear-dual convention clear the finite set of denominators.
2. Use the prime-to-p étale and finite Dieudonné equivalences to realize the resulting finite subgroup.
3. Take the abelian quotient and reverse the dual transport to verify every lattice component.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/etale-groups-as-galois-modules; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible; AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-p-frobenius; AbelianSchemesAndArithmeticModuliPartII:F1/integral-p-tate; AlgebraicModuliForArithmeticGeometry:R09.3.

Acceptance: Fix A₀/F_p. Let M_ℓ be full π-stable Z_ℓ-lattices in V_ℓ(A₀) for ℓ≠p and M_p a full F,V-stable Z_p-lattice in D^lin(A₀), equal to the reference realization lattices T₀,ℓ at all but finitely many primes. There exist B/F_p and a rational quasi-isogeny f:B→A₀ with transported realization lattices f_ℓ(T_ℓB)=M_ℓ, including D^lin at p..

Source: Waterhouse, §3.1, pp.530–532.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/prime-field-lattice-realization.

Exact unresolved inputs:

- Finite subgroup quotient and integral order realization: Supply the exact abelian quotient and lattice correspondence over the stated field, including the finite-flat kernel, local multiplicator order and finite support. Waterhouse kernel ideals and maximal-order theorems must not be generalized to all nonmaximal invertible ideals.

### Prime-field marked and unmarked classification

Declaration AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-classification (theorem). For A₀/F_p, the transport map is a bijection from isomorphism classes of marked pairs (B,f:B→A₀ a rational quasi-isogeny) to the finite-support lattice tuples of prime-field-lattice-realization. Here (B,f)≅(B′,f′) means an F_p-isomorphism u:B→B′ with f′u=f. Under this bijection Γ=End⁰_Fp(A₀)^× acts by postcomposition, and Γ-orbits are precisely underlying F_p-isomorphism classes in the isogeny class of A₀.

Proof/construction spine:

1. Prove injectivity by the realization Hom comparison in both variance conventions.
2. Use finite-support lattice realization for surjectivity.
3. Quotient the markings by End⁰(A)^× and use the exact stabilizer groups.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space; AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-realization; AbelianSchemesAndArithmeticModuliPartII:F3/rational-orbits.

Acceptance: For A₀/F_p, the transport map is a bijection from isomorphism classes of marked pairs (B,f:B→A₀ a rational quasi-isogeny) to the finite-support lattice tuples of prime-field-lattice-realization. Here (B,f)≅(B′,f′) means an F_p-isomorphism u:B→B′ with f′u=f. Under this bijection Γ=End⁰_Fp(A₀)^× acts by postcomposition, and Γ-orbits are precisely underlying F_p-isomorphism classes in the isogeny class of A₀..

Source: Waterhouse, §3.1–3.2, pp.530–535.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/prime-field-marked-classification.

Exact unresolved inputs:

- Finite subgroup quotient and integral order realization: Supply the exact abelian quotient and lattice correspondence over the stated field, including the finite-flat kernel, local multiplicator order and finite support. Waterhouse kernel ideals and maximal-order theorems must not be generalized to all nonmaximal invertible ideals.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:F3 is planned; proof and supplier refinements below prevent a closure claim.

## F4. Adelic class sets and local bounds

Define the exact lattice stabilizers and adelic class set. Use ordered unequal-root discriminants, reduced norms, narrow class groups and precise local orbit requests.

### Adelic class set of the endomorphism group

Declaration AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set (definition). For G=(End⁰(A₀))^× and an adelic lattice L, the global orbits inside its G(A_fin)-orbit are G(Q)\G(A_fin)/Stab(L).

Proof/construction spine:

1. Construct the object on the imported carriers in the convention fixed in the statement.
2. Verify the data/projection equations and the three tests below before exposing the interface.
3. The exact geometric or algebraic adapter absent from the pinned libraries is recorded in the accompanying gap; this target-level node does not assert an implementation.

Inputs: Routine algebra plus the specifically recorded source gap.

API:

- AbelianArithmetic.adelicClassSet_mk (constructor): A finite adele in E^×(A_f) determines its double coset modulo left E^×(Q) and right K.
- AbelianArithmetic.adelicClassSet_equiv (characterisation): g,h have the same class iff h=e g k for e∈E^×(Q),k∈K.
- AbelianArithmetic.adelicClassSet_stabilizer (data): K is the restricted product of the automorphism groups of the chosen local lattices, including the p-component.

Unit tests:

- AbelianArithmetic.adelicClassSet_rational (computation): Any rational unit e∈E^×(Q) has the identity class.
- AbelianArithmetic.adelicClassSet_compact (compatibility): Changing a local lattice by conjugation replaces K by its conjugate and induces the corresponding class-set bijection.
- AbelianArithmetic.adelicClassSet_notPic (non-example): For a nonmaximal order include nonprojective full lattices; its class set is not identified with Pic(R).

Acceptance: For G=(End⁰(A₀))^× and an adelic lattice L, the global orbits inside its G(A_fin)-orbit are G(Q)\G(A_fin)/Stab(L)..

Source: LipnowskiTsimerman, §3.2 (15).

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/adelic-class-set.

Exact unresolved inputs:

- Interface proof: Adelic class set of the endomorphism group: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: Any rational unit e∈E^×(Q) has the identity class.; Changing a local lattice by conjugation replaces K by its conjugate and induces the corresponding class-set bijection.; For a nonmaximal order include nonprojective full lattices; its class set is not identified with Pic(R).. The source passage is read; its library adapter and any cited external proof remain unresolved.

### Finite-support adelic stabilizers in a prime-field isogeny class

Declaration AbelianSchemesAndArithmeticModuliPartII:F4/adelic-stabilizers (theorem). For A₀/F_p and the prime-field lattice space X, use Tate full faithfulness at all primes to identify G(Q_ℓ), G=End⁰_Fp(A₀)^×, with the linear Frobenius centralizer. Let D_* be L8’s unequal-root-occurrence discriminant product. There is a compact open K₀=∏H₀,ℓ of G(A_f) such that every M∈X has Stab(M)=∏S_M,ℓ contained in a conjugate K_M=a_M K₀a_M^(−1), with a_M∈G(A_f) supported at finitely many places, S_M,ℓ=H_M,ℓ almost everywhere, and [K_M:Stab(M)]≤D_*. Moreover #G(A_f)\X≤D_*².

Proof/construction spine:

1. For each local lattice take its genuine realization automorphism subgroup.
2. At almost every prime it equals the standard integral unit subgroup; finite support makes the product restricted.
3. At p use the prime-field linear-dual convention to identify the stabilizer with the endomorphism-order units.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set; AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space; AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-classification; AbelianSchemesAndArithmeticModuliPartII:F4/prime-p-centralizer.

Acceptance: For A₀/F_p and the prime-field lattice space X, use Tate full faithfulness at all primes to identify G(Q_ℓ), G=End⁰_Fp(A₀)^×, with the linear Frobenius centralizer. Let D_* be L8’s unequal-root-occurrence discriminant product. There is a compact open K₀=∏H₀,ℓ of G(A_f) such that every M∈X has Stab(M)=∏S_M,ℓ contained in a conjugate K_M=a_M K₀a_M^(−1), with a_M∈G(A_f) supported at finitely many places, S_M,ℓ=H_M,ℓ almost everywhere, and [K_M:Stab(M)]≤D_*. Moreover #G(A_f)\X≤D_*²..

Source: LipnowskiTsimerman, §3.2.1–3.2.3.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/prime-field-adelic-stabilizers.

### The prime-field p-component reduction

Declaration AbelianSchemesAndArithmeticModuliPartII:F4/prime-p-centralizer (theorem). For A₀/F_p, F is Q_p-linear and V=pF^(−1); hence the simultaneous centralizer of F,V is the centralizer of F, and its orbits on F,V-stable lattices form a subset of its orbits on F-stable lattices.

Proof/construction spine:

1. For q=p, F is Q_p-linear and V=pF^−1 on the rational space.
2. The rational F,V commutant is the Frobenius centralizer, but the integral lattice must be stable under both operators.
3. The equality of rational commutants does not eliminate the integral V-stability condition.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof; AbelianSchemesAndArithmeticModuliPartII:F1/p-characteristic-polynomial.

Acceptance: For A₀/F_p, F is Q_p-linear and V=pF^(−1); hence the simultaneous centralizer of F,V is the centralizer of F, and its orbits on F,V-stable lattices form a subset of its orbits on F-stable lattices..

Source: WaterhouseMilne, Part II Theorem 1, pp.60–61.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/prime-p-centralizer.

### Class-set comparison by reduced norms

Declaration AbelianSchemesAndArithmeticModuliPartII:F4/reduced-norm-class-comparison (theorem). Let K₀=Q(√p), D₀/K₀ the quaternion algebra ramified at both real places and split at every finite place, and d≥2. With maximal finite compact U₀,d=∏_v GL_(2d)(O_(K₀,v)), reduced norm identifies GL_d(D₀)(K₀)\GL_d(D₀)(A_(K₀,fin))/U₀,d with the narrow ideal class group Cl⁺(K₀). For each CM field K_i, determinant identifies GL_(n_i)(K_i)\GL_(n_i)(A_(K_i,fin))/GL_(n_i)(Ohat_(K_i)) with Cl(K_i). Their product gives the mixed class set. The d=1 quaternion factor remains its own class set; d=0 omits it.

Proof/construction spine:

1. Split commutative CM blocks from the real quaternion block.
2. For quaternion multiplicity d≥2 apply the reduced-norm class-set comparison with its narrow class group and finite local factors.
3. Treat d=1 by the quaternion class-set estimate and d=0 by omission; no strong approximation assertion is used in the excluded d=1 case.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set; GeometryOfNumbersAndQuadraticArithmetic:GN.2.

Acceptance: Let K₀=Q(√p), D₀/K₀ the quaternion algebra ramified at both real places and split at every finite place, and d≥2. With maximal finite compact U₀,d=∏_v GL_(2d)(O_(K₀,v)), reduced norm identifies GL_d(D₀)(K₀)\GL_d(D₀)(A_(K₀,fin))/U₀,d with the narrow ideal class group Cl⁺(K₀). For each CM field K_i, determinant identifies GL_(n_i)(K_i)\GL_(n_i)(A_(K_i,fin))/GL_(n_i)(Ohat_(K_i)) with Cl(K_i). Their product gives the mixed class set. The d=1 quaternion factor remains its own class set; d=0 omits it..

Source: LipnowskiTsimerman, §3.2.1–3.2.3.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/nonabelian-class-comparison.

### Correct elementary discriminant estimate

Declaration AbelianSchemesAndArithmeticModuliPartII:F4/ordered-root-discriminant (theorem). If K=Q(π), π is an integral p-Weil number of degree d, then |D_K|≤|disc minpoly(π)|≤(2√p)^(d(d−1)).

Proof/construction spine:

1. Take the product over ordered unequal-value root pairs, retaining multiplicities.
2. Each factor has complex norm at most 2sqrt(p).
3. There are at most m(m−1) ordered pairs for m=2g; multiplicities rule out the stronger simple-root estimate used by Lee equation (11).

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial.

Acceptance: If K=Q(π), π is an integral p-Weil number of degree d, then |D_K|≤|disc minpoly(π)|≤(2√p)^(d(d−1))..

Source: Lee, §3.1 equations (3)–(10); §3.2 equation (11), pp.4–9.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/weil-discriminant-bound.

### Conditional rational-orbit bound from local lattices

Declaration AbelianSchemesAndArithmeticModuliPartII:F4/conditional-orbit-bound (theorem). Let a group G_f with subgroup Γ act on a lattice space X, with at most D_*² G_f-orbits. Suppose h=#(Γ\G_f/K₀)<∞ for a fixed compact level K₀. For every orbit representative M assume Stab(M)=∏S_{M,ℓ}, contained in K_M=∏H_{M,ℓ}=a_M K₀ a_M⁻¹ with a_M∈G_f, equality S_{M,ℓ}=H_{M,ℓ} away from finitely many primes, and ∏[H_{M,ℓ}:S_{M,ℓ}]≤D_*. Then Γ\X is finite and #Γ\X≤D_*³h. If the relevant Weil-lattice tuple satisfies these assumptions and D_*≤(2√p)^{m(m−1)}, the resulting conditional bound is #Γ\X≤(2√p)^{3m(m−1)}h.

Proof/construction spine:

1. Disintegrate the rational orbit space over the finite-support local orbit tuples.
2. For each tuple use the stabilizer adelic class-set bound.
3. Sum the bounds, making the local orbit and class-set estimates explicit hypotheses; do not assume the faulty LT weak-composition count.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set; AbelianSchemesAndArithmeticModuliPartII:F4/fixed-level-class-bound; AbelianSchemesAndArithmeticModuliPartII:F4/adelic-stabilizers; GeometryOfNumbersAndQuadraticArithmetic:GN.2.

Acceptance: Let a group G_f with subgroup Γ act on a lattice space X, with at most D_*² G_f-orbits. Suppose h=#(Γ\G_f/K₀)<∞ for a fixed compact level K₀. For every orbit representative M assume Stab(M)=∏S_{M,ℓ}, contained in K_M=∏H_{M,ℓ}=a_M K₀ a_M⁻¹ with a_M∈G_f, equality S_{M,ℓ}=H_{M,ℓ} away from finitely many primes, and ∏[H_{M,ℓ}:S_{M,ℓ}]≤D_*. Then Γ\X is finite and #Γ\X≤D_*³h. In the semisimple Weil-lattice setting of L8 and S3, where these group-identification and finite-support inputs are established, D_*≤(2√p)^{m(m−1)} gives #Γ\X≤(2√p)^{3m(m−1)}h..

Source: LipnowskiTsimerman, §3.1–3.2, with corrected routed local-bound interfaces.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/conditional-rational-orbit-bound.

Exact unresolved inputs:

- Repaired local counting endpoint: The exact repeated-block orbit estimate, adelic aggregation and stabilizer bounds needed for the 69/4 endpoint are not proved by the publicly obtained LT v1. Prove the GN.2 requests or obtain and verify a repaired primary argument. The endpoint is a conditional target; no closed numerical theorem is asserted.

### Coarse prime-field isomorphism count at fixed adelic level

Declaration AbelianSchemesAndArithmeticModuliPartII:F4/fixed-level-class-bound (theorem). For A₀/F_p of dimension g>0, put m=2g, take D_* and K₀ from prime-field-adelic-stabilizers, and suppose h=#(G(Q)\G(A_f)/K₀) is finite. Then the number of F_p-isomorphism classes in the isogeny class of A₀ is at most D_*³h≤(2√p)^{3m(m−1)}h. Class-set finiteness is imported from AA.3 with its exact group hypotheses; no numerical bound on h is included.

Proof/construction spine:

1. Use the reduced-norm class-set comparison at the actual finite adelic level.
2. Bound each field class number and each local index, retaining discriminant squares and powers of 2.
3. This coarse fixed-level estimate is independent of a still-unproved sharper local-orbit count.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set; AbelianSchemesAndArithmeticModuliPartII:F4/reduced-norm-class-comparison; AbelianSchemesAndArithmeticModuliPartII:F4/ordered-root-discriminant; tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets.

Acceptance: For A₀/F_p of dimension g>0, put m=2g, take D_* and K₀ from prime-field-adelic-stabilizers, and suppose h=#(G(Q)\G(A_f)/K₀) is finite. Then the number of F_p-isomorphism classes in the isogeny class of A₀ is at most D_*³h≤(2√p)^{3m(m−1)}h. Class-set finiteness is imported from AA.3 with its exact group hypotheses; no numerical bound on h is included..

Source: Lee, §3.1, equations (3)–(10), pp.4–7.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/prime-field-isogeny-class-bound.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:F4 is planned; proof and supplier refinements below prevent a closure claim.

## F5. Polarizations and CM powers

Import Rosati and principal polarization orbits; descend line bundles over finite fields. Bound squarefree nonreal classes and count CM elliptic-power polarizations with correctly normalized masses.

### Lang surjectivity for an abelian variety

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/finite-field-abelian-lang (lemma). For B/F_q, the morphism Frob_q−1 on B is an étale surjective isogeny, hence H¹(F_q,B)=0 for the actual Galois torsor cohomology.

Proof/construction spine:

1. Its differential is −id, so its kernel is finite étale.
2. Properness plus finite kernel makes Frob−1 an isogeny onto a dimension-d image, hence all B.
3. Use the finite-field procyclic Galois cocycle dictionary to solve the Frobenius torsor equation. This is the abelian specialization, not a duplicate general Lang theorem.

Inputs: AbelianSchemesAndArithmeticModuli:A3.

Acceptance: For B/F_q, the morphism Frob_q−1 on B is an étale surjective isogeny, hence H¹(F_q,B)=0 for the actual Galois torsor cohomology..

Source: Conrad, Theorem 2.6 and proof, pp.6–9.

Exact unresolved inputs:

- Finite-field torsor cocycles: Supply the continuous procyclic Galois cohomology/torsor dictionary used after Lang surjectivity; a set-level surjection on algebraic-closure points is not a descent theorem.

### Line-bundle realization over a finite field

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/polarization-line-bundle-descent (theorem). For A over a finite field, every symmetric isogeny A→A∨ is φ_L for some line bundle over that field.

Proof/construction spine:

1. The geometric line bundles giving a fixed polarization form a Pic⁰(A)-torsor.
2. H¹(F_q,Pic⁰A)=0 by the abelian Lang specialization.
3. A rational Picard class has a rational line bundle since Br(F_q)=0; ampleness is preserved by descent.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F5/finite-field-abelian-lang.

Acceptance: For A over a finite field, every symmetric isogeny A→A∨ is φ_L for some line bundle over that field..

Source: Conrad, Theorem 2.6 and proof, pp.6–9.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/finite-field-polarization-descent.

Exact unresolved inputs:

- Polarization counting and mass leaves: Supply the finite-field Brauer vanishing, exact Rosati principal-polarization orbit dictionary in every characteristic, the local norm/ambiguous ideal sequence, and the weighted-to-unweighted Hermitian mass and residue estimates. The corrected 1/2 coefficient is retained but depends on these requests.

### Units that are norms modulo norms of units (Lemmermeyer)

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/ambiguous-unit-norms (theorem). Let L/K be a cyclic extension of number fields of prime degree. There is an exact sequence 1 → Am_st(L/K) → Am(L/K) → (E_K ∩ N_(L/K)L^×)/N_(L/K)E_L → 1, where Am(L/K) ⊂ Cl(L) is the group of ambiguous ideal classes and Am_st(L/K) its subgroup of strongly ambiguous classes. In particular (E_K ∩ N L^×)/N E_L is a subquotient of Cl(L) and its order is at most h(L).

Proof/construction spine:

1. Define ambiguous and strongly ambiguous ideal classes using the imported number-field ideals.
2. For a stable ideal class choose its principal coboundary generator; its norm is a base-field unit and define the unit-norm quotient map.
3. Use Hilbert 90 for ideals to identify the kernel with strongly ambiguous classes and prove surjectivity; then the quotient order is ≤h(L).

Inputs: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields.

Acceptance: Let L/K be a cyclic extension of number fields of prime degree. There is an exact sequence 1 → Am_st(L/K) → Am(L/K) → (E_K ∩ N_(L/K)L^×)/N_(L/K)E_L → 1, where Am(L/K) ⊂ Cl(L) is the group of ambiguous ideal classes and Am_st(L/K) its subgroup of strongly ambiguous classes. In particular (E_K ∩ N L^×)/N E_L is a subquotient of Cl(L) and its order is at most h(L)..

Source: Lemmermeyer, Proposition 1 and proof, pp.2–3.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/ambiguous-unit-norms.

### Squarefree nonreal polarization bound

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/squarefree-polarization-bound (theorem). For A/F_p of dimension g with no repeated simple isogeny factor and P_A coprime to X²−p, the source proves n_A≪p^(C g²) for some absolute C.

Proof/construction spine:

1. Use the principal-polarization/Rosati orbit dictionary and finite-field line-bundle descent.
2. For squarefree Frobenius polynomial coprime to X²−p, the endomorphism algebra is a product of CM fields.
3. Apply the ambiguous-unit norm bound and class/discriminant bounds, retaining both polynomial hypotheses.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F5/polarization-line-bundle-descent; AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-end-algebra; AbelianSchemesAndArithmeticModuliPartII:F5/ambiguous-unit-norms; AbelianSchemesAndArithmeticModuliPartII:F4/ordered-root-discriminant; tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets; AbelianSchemesAndArithmeticModuli:A6/rosati-positivity; AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties; AbelianSchemesAndArithmeticModuli:A2/rosati-involution.

Acceptance: For A/F_p of dimension g with no repeated simple isogeny factor and P_A coprime to X²−p, the source proves n_A≪p^(C g²) for some absolute C..

Source: LipnowskiTsimerman, §4, Proposition 4.16.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/squarefree-pol-count.

Exact unresolved inputs:

- Polarization counting and mass leaves: Supply the finite-field Brauer vanishing, exact Rosati principal-polarization orbit dictionary in every characteristic, the local norm/ambiguous ideal sequence, and the weighted-to-unweighted Hermitian mass and residue estimates. The corrected 1/2 coefficient is retained but depends on these requests.

### Density of primes splitting in a class-number-one CM field

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/nine-cm-split-density (theorem). The nine imaginary quadratic fields of class number one have independent square classes; outside their finite ramified-prime set, the primes splitting in at least one have natural density 1−2^(−9).

Proof/construction spine:

1. The nine class-number-one imaginary quadratic squareclasses are independent: prime factors force the seven nonspecial signs, and −1,−2 supply the remaining independent classes.
2. Their multiquadratic compositum has Galois group (Z/2)^9.
3. Chebotarev gives density 1−2^−9 for primes splitting in at least one, outside the finite ramified set.

Inputs: Routine algebra plus the specifically recorded source gap.

Acceptance: The nine imaginary quadratic fields of class number one have independent square classes; outside their finite ramified-prime set, the primes splitting in at least one have natural density 1−2^(−9)..

Source: LipnowskiTsimerman, Lemma 5.11, pp.25–26.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/split-prime-density.

Exact unresolved inputs:

- CM split-prime and small-characteristic leaves: Verify the nine class-number-one computations, their squareclass independence, Chebotarev density, and the separate p=3 elliptic trace cases. The density and odd-characteristic statement are targets, not results inferred from a name search.

### Elliptic curve with class-number-one endomorphisms

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/cm-elliptic-existence (theorem). If a prime p splits in an imaginary quadratic class-number-one field L, there exists E/F_p with End_Fp(E)=O_L, obtained from a norm-p algebraic integer and Waterhouse order realization.

Proof/construction spine:

1. For a split prime in a class-number-one imaginary quadratic field choose an integral π of norm p.
2. It is a nonreal Weil p-number and has elliptic Honda multiplicity one.
3. Waterhouse realizes the maximal order, giving E/F_p with End_Fp(E)=O_K.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/weil-q-number; AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate; AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-orders.

Acceptance: If a prime p splits in an imaginary quadratic class-number-one field L, there exists E/F_p with End_Fp(E)=O_L, obtained from a norm-p algebraic integer and Waterhouse order realization..

Source: Waterhouse, Porism 4.3; Theorem 6.1, pp.540,550–551.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/cm-elliptic-existence.

Exact unresolved inputs:

- CM split-prime and small-characteristic leaves: Verify the nine class-number-one computations, their squareclass independence, Chebotarev density, and the separate p=3 elliptic trace cases. The density and odd-characteristic statement are targets, not results inferred from a name search.

### Lemma 5.19, corrected: odd characteristic

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-pgroups (theorem). Let p be an odd prime and E/F_p an elliptic curve. Then E(F_p) and E(F_(p²)) are not both p-groups. For p = 2 the statement is false exactly for the curves with trace a = ±1, for example y²+xy = x³+x²+1 (a = 1), with #E(F_2) = 2 and #E(F_4) = 8.

Proof/construction spine:

1. For odd p, #E(F_p)=p+1−t and #E(F_p²)=(p+1)²−t².
2. If both are p-powers, the Hasse interval and the factorization force a contradiction, with p=3 checked separately.
3. Retain p odd: in characteristic 2 the traces ±1 give the recorded counterexamples.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial.

Acceptance: Let p be an odd prime and E/F_p an elliptic curve. Then E(F_p) and E(F_(p²)) are not both p-groups. For p = 2 the statement is false exactly for the curves with trace a = ±1, for example y²+xy = x³+x²+1 (a = 1), with #E(F_2) = 2 and #E(F_4) = 8..

Source: LipnowskiTsimerman, Lemma 5.19, pp.32–33, corrected E16.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/elliptic-pgroups-large.

Exact unresolved inputs:

- CM split-prime and small-characteristic leaves: Verify the nine class-number-one computations, their squareclass independence, Chebotarev density, and the separate p=3 elliptic trace cases. The density and odd-characteristic statement are targets, not results inferred from a name search.

### Lemma 5.11, corrected: principal polarizations on E^g

Declaration AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-power-polarizations (theorem). Let p be a prime that splits in K = Q(√−d) for one of the nine imaginary quadratic fields of class number one (these primes have density 1−2^(−9)). Then there is an elliptic curve E/F_p with End(E) = O_K, and the number of isomorphism classes of principal polarizations on E^g is exp((1/2)g² log g + O_p(g²)). (Printed: exp(g² log g + O(g²)).)

Proof/construction spine:

1. With End(E)=O_K and class number one, identify principal polarizations on E^g with positive definite unimodular Hermitian forms over O_K modulo GL_g(O_K).
2. Use the correctly normalized weighted mass and uniform automorphism/residue bounds to pass to the unweighted number of classes.
3. Stirling asymptotics of the archimedean product give (1/2)g² logg+O_p(g²), retaining the coefficient 1/2.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F5/cm-elliptic-existence; AbelianSchemesAndArithmeticModuliPartII:F5/nine-cm-split-density; GeometryOfNumbersAndQuadraticArithmetic:GN.3; AbelianSchemesAndArithmeticModuli:A6/rosati-positivity; AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties; AbelianSchemesAndArithmeticModuli:A2/rosati-involution.

Acceptance: Let p be a prime that splits in K = Q(√−d) for one of the nine imaginary quadratic fields of class number one (these primes have density 1−2^(−9)). Then there is an elliptic curve E/F_p with End(E) = O_K, and the number of isomorphism classes of principal polarizations on E^g is exp((1/2)g² log g + O_p(g²)). (Printed: exp(g² log g + O(g²)).).

Source: LipnowskiTsimerman, §5.4–5.5, corrected Lemma 5.11.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/elliptic-power-source.

Exact unresolved inputs:

- Polarization counting and mass leaves: Supply the finite-field Brauer vanishing, exact Rosati principal-polarization orbit dictionary in every characteristic, the local norm/ambiguous ideal sequence, and the weighted-to-unweighted Hermitian mass and residue estimates. The corrected 1/2 coefficient is retained but depends on these requests.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:F5 is planned; proof and supplier refinements below prevent a closure claim.

## F6. Counting isogeny and isomorphism classes

Count reciprocal Weil polynomials and ordinary lattice points. Assemble the conditional repaired 69/4 bound and the repeated-factor comparison with the 1/2 coefficient.

### Lemma 2.1, corrected: counting Weil polynomials

Declaration AbelianSchemesAndArithmeticModuliPartII:F6/weil-polynomial-count (theorem). For q≥2 and g≥1, the number of monic reciprocal integer polynomials of degree 2g with constant q^g and all roots of absolute value √q is at most (4g+1)^g q^(g(g+1)/4).

Proof/construction spine:

1. Use the first g integer power sums, which determine the first g coefficients by Newton recursion and then every coefficient by reciprocity.
2. For i=1,…,g the power sum has absolute value at most 2g q^(i/2), giving an integer interval with at most (4g+1)q^(i/2) values.
3. Multiply these interval bounds to obtain (4g+1)^g q^(g(g+1)/4); this counts power sums rather than independently bounding elementary coefficients.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial; AbelianSchemesAndArithmeticModuliPartII:F6/power-sum-reconstruction.

Acceptance: For q≥2 and g≥1, the number of monic reciprocal integer polynomials of degree 2g with constant q^g and all roots of absolute value √q is at most (4g+1)^g q^(g(g+1)/4)..

Source: LipnowskiTsimerman, Lemma 2.1, pp.3–4, corrected E18.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/power-sum-count.

### Asymptotic count of isogeny classes

Declaration AbelianSchemesAndArithmeticModuliPartII:F6/isogeny-class-asymptotic (theorem). For fixed q, the number of dimension-g F_q-isogeny classes is at most exp((log q)g²/4+O_q(g log g)).

Proof/construction spine:

1. Inject isogeny classes into their Frobenius polynomials by Tate.
2. Use the corrected coefficient upper bound and the fixed-q ordinary lower bound.
3. The g log g error is o(g²) for fixed q, yielding coefficient 1/4.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial; AbelianSchemesAndArithmeticModuliPartII:F6/weil-polynomial-count; AbelianSchemesAndArithmeticModuliPartII:F6/ordinary-isogeny-lower; AbelianSchemesAndArithmeticModuliPartII:F3/isogeny-polynomial.

Acceptance: For fixed q, the number of dimension-g F_q-isogeny classes is at most exp((log q)g²/4+O_q(g log g))..

Source: DiPippoHowe, Theorem 1.3 and §3.1–3.2, pp.2,15–18.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/isogeny-class-upper.

### DiPippo–Howe lower bound for isogeny classes

Declaration AbelianSchemesAndArithmeticModuliPartII:F6/ordinary-isogeny-lower (theorem). For every positive integer n and prime power q, the number #O(q,n) of isogeny classes of ordinary n-dimensional abelian varieties over F_q satisfies #O(q,n) > c_4 (c_5 n)^(−2 log 2/log q) (2^n/n!) (r(q) q^(n/2) − n) q^(n(n−1)/4), where c_4 = e^(−3/2), c_5 = 2+√2 and r(q) = φ(q)/q. Hence, with Lemma 2.1 corrected, the logarithm of the number of isogeny classes of g-dimensional abelian varieties over F_q is (1/4)g² log q (1+o(1)) as g→∞, for every fixed q.

Proof/construction spine:

1. The weighted diamond region of coefficient space lies in the real unit-circle-root region by Lemma 2.5.1.
2. Count the coefficient lattice points with ordinary middle coefficient coprime to p using Lemmas 2.5.2–2.5.3 and §3.2.
3. Apply ordinary Honda realizability and Theorem 1.3; the exact formula is retained for every prime power q.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate.

Acceptance: For every positive integer n and prime power q, the number #O(q,n) of isogeny classes of ordinary n-dimensional abelian varieties over F_q satisfies #O(q,n) > c_4 (c_5 n)^(−2 log 2/log q) (2^n/n!) (r(q) q^(n/2) − n) q^(n(n−1)/4), where c_4 = e^(−3/2), c_5 = 2+√2 and r(q) = φ(q)/q. Hence, with Lemma 2.1 corrected, the logarithm of the number of isogeny classes of g-dimensional abelian varieties over F_q is (1/4)g² log q (1+o(1)) as g→∞, for every fixed q..

Source: DiPippoHowe, Theorem 1.3; Lemmas 2.5.1–2.5.3; §3.2, pp.2,13–18.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/dipippo-howe.

Exact unresolved inputs:

- Ordinary polynomial and lattice-counting proof: Decompose the real-root-region boundary lemma needed by DPH Lemma 2.5.1, the weighted diamond lattice counts, ordinary realizability criterion and exact inequality including its possibly negative finite-n right side. The fixed-q asymptotic follows only after these inputs.

### Theorem 0.1, corrected: abelian varieties over F_p number p^(O(g²))

Declaration AbelianSchemesAndArithmeticModuliPartII:F6/repaired-unpolarized-count (theorem). Fix a prime p and let B(p,g) count isomorphism classes of g-dimensional abelian varieties over F_p. Then log B(p,g)=O_p(g²). The argument corrected in Lee arXiv:2002.04420v3 §3.1 gives B(p,g)≤2^(34g²)·p^((69/4)g²(1+o(1))) (Theorem 1.1). The printed 17/2 exponent is not established (E21). Lee states B(p,g)≤p^((45/4)g²(1+o(1))) in Theorems 1.4/3.4, but the cited v3 proof uses the false repeated-root estimate (11), recorded in E22; that sharper bound is not a verified target on this proof evidence.

Proof/construction spine:

1. Multiply the corrected Weil-polynomial count by the conditional isogeny-class orbit bound.
2. Use the repaired ordered-root discriminant and class-group exponents from Lee §3.1, retaining the factor 2^(34g²).
3. The 69/4 endpoint remains conditional on the exact local-orbit and stabilizer repairs; 17/2 is not restored and 45/4 is not asserted from the defective repeated-root estimate.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F6/weil-polynomial-count; AbelianSchemesAndArithmeticModuliPartII:F4/conditional-orbit-bound; AbelianSchemesAndArithmeticModuliPartII:F4/ordered-root-discriminant.

Acceptance: Fix a prime p and let B(p,g) count isomorphism classes of g-dimensional abelian varieties over F_p. Then log B(p,g)=O_p(g²). The argument corrected in Lee arXiv:2002.04420v3 §3.1 gives B(p,g)≤2^(34g²)·p^((69/4)g²(1+o(1))) (Theorem 1.1). The printed 17/2 exponent is not established (E21). Lee states B(p,g)≤p^((45/4)g²(1+o(1))) in Theorems 1.4/3.4, but the cited v3 proof uses the false repeated-root estimate (11), recorded in E22; that sharper bound is not a verified target on this proof evidence..

Source: Lee, Theorem 1.1; §3.1, pp.1–7.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/main-unpolarized-source.

Exact unresolved inputs:

- Repaired local counting endpoint: The exact repeated-block orbit estimate, adelic aggregation and stabilizer bounds needed for the 69/4 endpoint are not proved by the publicly obtained LT v1. Prove the GN.2 requests or obtain and verify a repaired primary argument. The endpoint is a conditional target; no closed numerical theorem is asserted.
- Exact69/4 numerical assembly: The conditional D_*³h group lemma is a coarse alternate orbit bound. Supply the sharper local/discriminant/stabilizer estimates and verify their exponents separately before deriving69/4; that numerical constant does not follow merely by substituting D_* in the coarse lemma.

### Theorem 0.3 (Proposition 4.17): most ppavs over F_p have a repeated factor

Declaration AbelianSchemesAndArithmeticModuliPartII:F6/repeated-factor-dominance (theorem). Let p be a prime satisfying the corrected conclusion of Lemma 5.11 (for instance, p splits in one of the nine imaginary quadratic fields of class number one). Among isomorphism classes of g-dimensional principally polarized abelian varieties over F_p, the proportion whose underlying abelian variety has no repeated F_p-simple isogeny factor and has Frobenius characteristic polynomial coprime to x²−p tends to 0 as g→∞.

Proof/construction spine:

1. Count the numerator with squarefree Frobenius polynomial coprime to X²−p using the squarefree polarization and isogeny-class bounds.
2. The numerator is exp(O_p(g²)).
3. For the indicated split prime, the E^g denominator is at least exp((1/2)g²logg+O_p(g²)), so the ratio tends to zero.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F5/squarefree-polarization-bound; AbelianSchemesAndArithmeticModuliPartII:F6/isogeny-class-asymptotic; AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-power-polarizations.

Acceptance: Let p be a prime satisfying the corrected conclusion of Lemma 5.11 (for instance, p splits in one of the nine imaginary quadratic fields of class number one). Among isomorphism classes of g-dimensional principally polarized abelian varieties over F_p, the proportion whose underlying abelian variety has no repeated F_p-simple isogeny factor and has Frobenius characteristic polynomial coprime to x²−p tends to 0 as g→∞..

Source: LipnowskiTsimerman, Proposition 4.17; Lemma 5.11, corrected.

Routed targets: PAPER-LIPNOWSKI-TSIMERMAN-18/main-repeated-source.

Exact unresolved inputs:

- Polarization counting and mass leaves: Supply the finite-field Brauer vanishing, exact Rosati principal-polarization orbit dictionary in every characteristic, the local norm/ambiguous ideal sequence, and the weighted-to-unweighted Hermitian mass and residue estimates. The corrected 1/2 coefficient is retained but depends on these requests.

### Reconstruction from integer power sums

Declaration AbelianSchemesAndArithmeticModuliPartII:F6/power-sum-reconstruction (lemma). For a monic degree2g integer polynomial satisfying q-reciprocity in descending coefficient convention, its first g power sums determine the entire polynomial. Newton recurrence i·a_i=−∑_(j=1)^i a_(i−j)s_j determines a_i over Q, and reciprocity determines the remaining coefficients.

Proof/construction spine:

1. Factor over C with root multiplicities.
2. Expand the formal logarithmic derivative of the monic polynomial and compare coefficients to obtain the recurrence.
3. Use induction on i and q-reciprocity; division by i is performed over Q, not modulo p.

Inputs: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial.

Acceptance: For a monic degree2g integer polynomial satisfying q-reciprocity in descending coefficient convention, its first g power sums determine the entire polynomial. Newton recurrence i·a_i=−∑_(j=1)^i a_(i−j)s_j determines a_i over Q, and reciprocity determines the remaining coefficients..

Source: LipnowskiTsimerman, Lemma 2.1 proof, pp.3–4.

Layer exit: every declaration above has its exact source and prerequisite chain. AbelianSchemesAndArithmeticModuliPartII:F6 is planned; proof and supplier refinements below prevent a closure claim.

## Supplier requests

- SchemeAndStackFoundations:SF.4: Unit thickenings of a smooth commutative group, conormal associated graded Sym^n, formal group coproduct and coherent inverse-system completion, including the formal-functor/coordinate-ring direction. Consumers: AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map.
- SchemeAndStackFoundations:SF.2: Proper pushforward and relative duality for the completed coherent inverse system; prove the relevant Mittag–Leffler/derived inverse-limit comparison. Consumers: AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1: Ordinary CM connected p-divisible part, its finite-flat torsion stages and comparison with the formal completion after completed O_Cp base change. Consumers: AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-completed-base-change.
- PELModuli:M5: Fine polarization-type D level ℓ moduli, with ℓ≥3 and (ℓ,d_g)=1, and the universal lattice frame convention. Consumers: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization.
- PELModuli:M6: The Siegel universal abelian scheme and its period-coordinate/modular-map comparison at the same polarization and level convention. Consumers: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization.
- ComplexComparisonPartII:C0: Analytification of the imported abelian scheme as a complex analytic group family, with the smooth manifold and holomorphic-period dictionary; the current coherent pullback nodes alone are insufficient. Consumers: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization.
- HodgeStructuresPartII:H.2: Deligne fixed-part theorem, semisimplicity of connected monodromy and the invariant equivariant-Hom comparison for extendable polarizable integral weight-one variations over a curve; no exact finer supplier is present at this base. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace.
- HodgeStructuresPartII:H.3: Algebraization of the invariant weight-one Hodge substructure into a constant abelian subvariety, with the extension and Hodge-generic hypotheses. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace.
- LogicAndDefinabilityInNumberTheory:LD.6: For the graph component in Gao Theorem 4.1, the definable incidence set Θ has polynomially many arithmetic points of bounded height along an unbounded sequence; prove both zero-horizontal and positive-horizontal cases, then the bounded/unbounded vertical dichotomy. Primary proof locator: Theorem 5.2, pp.16–19. Required leaves: definable uniformization/fundamental sets, hyperbolic volume and height bounds, Pila–Wilkie blocks, o-minimal Chow, algebraic Hilbert-family properness and mixed monodromy normality. Consumers: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-growth.
- LogicAndDefinabilityInNumberTheory:LD.6: Unless the mixed Ax–Schanuel dimension inequality already holds, the identity component of the rational Zariski stabilizer of the ambient algebraic graph closure has positive dimension. Primary proof locator: Proposition 5.1, pp.19–20. Required leaves: definable uniformization/fundamental sets, hyperbolic volume and height bounds, Pila–Wilkie blocks, o-minimal Chow, algebraic Hilbert-family properness and mixed monodromy normality. Consumers: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-stabilizer.
- LogicAndDefinabilityInNumberTheory:LD.6: After the Hilbert-family and very-general-fibre reduction, the rational stabilizer is normal in the Kuga group: its vector part is a Hodge-stable G-module and its reductive part acts trivially on the quotient; quotienting gives the final dimension inequality. Primary proof locator: Proposition 6.1; §7; pp.20–27. Required leaves: definable uniformization/fundamental sets, hyperbolic volume and height bounds, Pila–Wilkie blocks, o-minimal Chow, algebraic Hilbert-family properness and mixed monodromy normality. Consumers: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-normality.
- LogicAndDefinabilityInNumberTheory:LD.6: For a fixed algebraic subvariety of a Kuga mixed Shimura variety, weakly optimal subvarieties have weakly special closures from a finite set of rational subdata and connected normal subgroups with semisimple reductive parts. Primary proof locator: Theorem 8.2; Lemmas 8.5–8.7; pp.27–30. Required leaves: definable uniformization/fundamental sets, hyperbolic volume and height bounds, Pila–Wilkie blocks, o-minimal Chow, algebraic Hilbert-family properness and mixed monodromy normality. Consumers: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-finite-data.
- PELModuli:M6: Finiteness over a fixed finite field of abelian varieties with fixed dimension and fixed polarization degree, via finite-type moduli at admissible full level. This input must precede Tate and is independent of the unpolarized count. Consumers: AbelianSchemesAndArithmeticModuliPartII:F0/compact-preimages.
- SchemeAndStackFoundations:SF.2: Coherent Γ-linearization and pullback cocycle conventions on the formal coefficient sheaf; use the exact linearized-sheaf node once its formal-extension hypotheses are supplied. Consumers: AbelianSchemesAndArithmeticModuliPartII:P2/gamma-equivariance.
- ComplexComparisonPartII:C0: Algebraic/analytic integrable connection and smooth bundle-valued Dolbeault resolution, including the local ∂bar Poincaré lemma for the finite-level bundles. Consumers: AbelianSchemesAndArithmeticModuliPartII:P3/smooth-dolbeault.
- LogicAndDefinabilityInNumberTheory:LD.6: Pila–Wilkie semirational path counting for the GH incidence set with a lattice endpoint, and the Ax analytic-arc to algebraic-coset theorem for a fixed abelian variety. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/definable-ax-set.
- AlgebraicModuliForArithmeticGeometry:R09.3: Effective finite-flat subgroup quotient and Isom descent for the abelian lattice realization, with arbitrary p-primary subgroup retained. Consumers: AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-realization.
- GeometryOfNumbersAndQuadraticArithmetic:GN.2: Prove multiplicity-sensitive repeated-block stable-lattice local orbit counts, restricted adelic local-orbit aggregation and nonisotypic stabilizer indices. Replace LT weak-composition count and failing orbit map; retain local FV stability and finite support. Consumers: AbelianSchemesAndArithmeticModuliPartII:F4/conditional-orbit-bound.
- GeometryOfNumbersAndQuadraticArithmetic:GN.2: Reduced-norm comparison for quaternion multiplicity d≥2 with narrow class group, the separate d=1 quaternion class-set bound, and the finite local index estimates at the actual lattice order. Consumers: AbelianSchemesAndArithmeticModuliPartII:F4/reduced-norm-class-comparison.
- GeometryOfNumbersAndQuadraticArithmetic:GN.3: Correctly normalized weighted mass of unimodular positive definite Hermitian O_K lattices, uniform automorphism bounds for conversion to unweighted classes, and two-sided residue estimates giving (1/2)g²logg+O(g²). Consumers: AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-power-polarizations.
- tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets: Class number h_F≤|d_F|4^[F:Q], discriminant-from-integral-basis bound, and unit-square index ≤2^[F:Q], with actual number-field degree rather than a halved CM degree. Consumers: AbelianSchemesAndArithmeticModuliPartII:F4/fixed-level-class-bound, AbelianSchemesAndArithmeticModuliPartII:F5/squarefree-polarization-bound.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality: Local invariant of the σ-cyclic Frobenius block, normalized by arithmetic Frobenius; include unramified scalar extension and the coefficient étale product case. Consumers: AbelianSchemesAndArithmeticModuliPartII:F1/p-local-invariant.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants: Injectivity of the global Brauer class into all local invariants and period=index for the number-field division algebra with real places retained. Consumers: AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate, AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-end-algebra.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields: Cyclic Hasse norm theorem in the CM quadratic extension and ideal Hilbert 90 for the ambiguous/strongly ambiguous class exact sequence; prove the unit quotient as a subquotient of Cl(L). Consumers: AbelianSchemesAndArithmeticModuliPartII:F5/ambiguous-unit-norms.
- tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-4-central-simple-algebras-and-their-tensor-products: Central simplicity and splitting of the cyclic block algebra over K, preserving the coefficient étale algebra. Consumers: AbelianSchemesAndArithmeticModuliPartII:F1/cyclic-block-split.
- tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-5-skolem-noether-and-the-centralizer-theorem: The central-simple module commutant and double-centralizer dimension formula with the necessary opposite-algebra conventions. Consumers: AbelianSchemesAndArithmeticModuliPartII:F1/p-commutant-dimension.
- AbelianSchemesAndArithmeticModuli:A0: Actual arbitrary-base abelian scheme carrier, smooth proper group structure and base change. Consumers: AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension.
- AbelianSchemesAndArithmeticModuli:A2: Rigidified Poincaré biextension, dual abelian scheme and biduality; not a second Picard definition. Consumers: AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension, AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input.
- AbelianSchemesAndArithmeticModuli:A3: Isogenies, duals, finite-flat kernels and abelian quotients. Consumers: AbelianSchemesAndArithmeticModuliPartII:F5/finite-field-abelian-lang, AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality.
- AbelianSchemesAndArithmeticModuli:A4: Relative H¹_dR, Hodge filtration, dual Gauss–Manin connection and ordinary Serre–Tate splitting. Consumers: AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension, AbelianSchemesAndArithmeticModuliPartII:P1/vector-extension-hodge, AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-completed-base-change.
- AbelianSchemesAndArithmeticModuli:A5: Relative polarized complex uniformization, integral periods and the Siegel-family period convention. Consumers: AbelianSchemesAndArithmeticModuliPartII:P3/smooth-connection-calculation, AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization.

## Remaining proof and prototype gaps

- Integral completion convention: Prove the topology comparison between degree completion and augmentation-ideal completion under explicit hypotheses, or correct the integral source convention. In particular factorial invertibility is unavailable over F_p. The moment targets use degree truncations and their inverse limit. Consumers: AbelianSchemesAndArithmeticModuliPartII:P0/degree-completion.
- Shuffle and multigraded comparison: Supply the finite coset decomposition, three-block shuffle bijections and arbitrary-basis graded comparison in the native tensor-power API; the source defines the operations without a complete library proof. Consumers: AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers, AbelianSchemesAndArithmeticModuliPartII:P0/divided-power-comparison, AbelianSchemesAndArithmeticModuliPartII:P0/multigrading.
- Vector-extension representability: Read and decompose the Mazur–Messing/Laumon proof of representability, integrable universal connection and vector-kernel identification over the precise noetherian base. Kings–Sprang p.13 cites this input; no full proof in that passage is claimed read. Consumers: AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension.
- Hodge identification for the vector extension: Decompose the cited extension/de Rham comparison, including signs, universal class and base change of the connection. Consumers: AbelianSchemesAndArithmeticModuliPartII:P1/vector-extension-hodge.
- Conormal and finite-level moment proof: Decompose the smooth conormal isomorphism and verify the n!-scaled associated-graded formula in the actual sheaf and tensor APIs; the characteristic-zero conclusion may not be asserted integrally. Consumers: AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map.
- Completed Poincaré cohomology computation: Supply the normalized Poincaré Fourier–Mukai calculation and the exact limit exchange yielding O_S in degree d and zero elsewhere; the cited proof was not obtained. Consumers: AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input.
- Square-zero Ext comparison: Read and decompose Mazur–Messing (4.1.4), including the connection category, the local-to-global Ext sequence and compatibility with the unit splitting. Do not generalize the proof to every vector bundle. Consumers: AbelianSchemesAndArithmeticModuliPartII:P3/square-zero-extension-class.
- Smooth differential-form dictionary: Provide actual smooth bundle-valued forms and the algebraic/analytic connection dictionary, with curvature computation for d+ν. The identity tensor does not by itself supply a flat bundle formalization. Consumers: AbelianSchemesAndArithmeticModuliPartII:P3/smooth-connection-calculation.
- Completed O_Cp base change: Verify the chosen noetherian-model completion, the formal-group identification and coefficient-ring completed tensor comparison used in Proposition 5.9; do not treat O_Cp as noetherian. Consumers: AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-completed-base-change.
- Relative period-coordinate interfaces: Supply the integral local-system trivialization, smooth real torus bundle and relative manifold APIs. The source proof is read; no synthetic manifold carrier is used in the prototype. Consumers: AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization.
- Pointwise form linear algebra: Implement the restricted semipositive Hermitian/alternating kernel theorem and complex Hessian calculation. The proof must be pointwise: do not deduce equality of kernels by integrating unspecified null directions. Consumers: AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel.
- Trace existence and reduction: Read the Chow–Lang/Conrad proof of the C(S)/C trace, its finite kernel, finite-cover behavior, extension over a curve and the exact dimension argument in the GH trace reduction. The routed Néron R11.5 citation supplies local factors, not this theorem; no false supplier edge is retained. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/function-field-trace.
- Torus character duality: Prove the continuous integer-character duality and separation of a closed subgroup from an outside point. H={0,1/2} in R/Z must have annihilator 2Z, so saturated lattices are insufficient. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/torus-annihilators.
- Free-orbit collision lemma: Supply the exact collision-kernel bound from GH Lemma 5.2 under its stabilizer hypotheses. Abstract word growth by itself does not establish distinct orbit growth. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/free-group-orbit-growth.
- Mixed Ax–Schanuel proof leaves: The primary proof pp.16–30 is decomposed into four owner-facing uses. The cited hyperbolic-volume theorem, Pila–Wilkie block theorem, o-minimal Chow, mixed bi-algebraic/monodromy theorem and the final Lemma 8.7/8.8 continuation need source-level proofs from the logic owner. No closure or pure-to-mixed transfer is asserted. Consumers: AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-growth, AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-stabilizer, AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-normality, AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-finite-data.
- Field of definition of degeneracy loci: Prove invariance of the special-generically closure and finite quotient loci under Aut(C/Qbar), then effective descent of the resulting closed subset. The source closedness proof is read; the full field-of-definition argument has not been located in those pages. Consumers: AbelianSchemesAndArithmeticModuliPartII:B3/degeneracy-closed.
- Kuga quotient and subgroup dictionary: Prove the correspondence between abelian subschemes and G_Q-submodules, quotient modular maps, and isotrivial fibres used in Theorem 8.1. Deligne 4.4.1–4.4.3 is cited but not read; no arbitrary subgroup projection is supplied by the uniformization alone. Consumers: AbelianSchemesAndArithmeticModuliPartII:B3/betti-rank-quotient.
- Recursive kernel diagonalization: Implement the corrected v6 induction with finite covers, connected kernels of the orthogonal endomorphisms and a new diagonalization at each stage. The projections with positive-dimensional kernels are endomorphisms; only their combined product map is an isogeny. Verify all dimension equalities before supplying the endpoint. Consumers: AbelianSchemesAndArithmeticModuliPartII:B4/fibre-power-induction.
- Tate compactness and finiteness setup: Supply the fixed-polarization finite-type/finiteness theorem, topology on the finite lattice approximations and compatible compact preimages. The proof of Tate Proposition 1 must not use the later unpolarized counting endpoint. Consumers: AbelianSchemesAndArithmeticModuliPartII:F0/compact-preimages.
- Split-commutant dimension lemmas: Supply each eigenspace/block dimension in Tate Proposition 2 and the prime-independence comparison; the complete scanned Tate paper is read, but no native proof or resolved linear-algebra chain is claimed. Consumers: AbelianSchemesAndArithmeticModuliPartII:F0/split-prime-tate.
- Factor integrality and resultant valuation perturbation: Supply the pinned monic-factor Gauss integrality theorem for a DVR, the quotient-ring norm/resultant formula and valuation invariance for 1+π^n a in the finite integral O-algebra O[X]/(R). A congruence modulo π^(2n) of scalar resultants alone is insufficient when degR>2. Consumers: AbelianSchemesAndArithmeticModuliPartII:F2/shifted-factor-slope.
- p-Tate saturated injection: Supply the geometric factorization proving p-saturation of Hom into the contravariant Dieudonné Hom group, before using p-Tate. Full faithfulness of the p-divisible functor alone does not imply full faithfulness for abelian varieties. Consumers: AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof.
- Cyclic Frobenius blocks and opposite conventions: Construct each σ-crossed-product block over the unramified coefficient field, split it by the weighted cyclic matrix after algebraic closure, compute dimensions and track the two opposite algebras in the contravariant commutant. The scalar coefficient tensor can be a product; it is not assumed a field. Consumers: AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof.
- Finite-field torsor cocycles: Supply the continuous procyclic Galois cohomology/torsor dictionary used after Lang surjectivity; a set-level surjection on algebraic-closure points is not a descent theorem. Consumers: AbelianSchemesAndArithmeticModuliPartII:F5/finite-field-abelian-lang.
- Interface proof: Completed sheaves and the completed Poincaré bundles 𝒫̂, 𝒫̂^♮: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: P(0)≃O_A and P♮(0)≃O_A with trivial relative connection.; P(1) is an extension of O_A by π^*ω_A∨ with the imported unit rigidification.; At every finite level the underlying sheaf is pushforward of the imported rigidified Poincaré sheaf restricted to A×A∨(n), rather than a tensor-power replacement.. The source passage is read; its library adapter and any cited external proof remain unresolved. Consumers: AbelianSchemesAndArithmeticModuliPartII:P2/completed-poincare.
- Interface proof: Frobenius polynomial and reciprocity: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: For the zero-dimensional abelian variety P_A=1 and the point count is 1.; For an elliptic curve, P_A=X²−tX+q and #A(F_q)=q+1−t.; For ℓ≠p its image in Q_ℓ[X] is the imported characteristic polynomial of the Frobenius action on V_ℓA.. The source passage is read; its library adapter and any cited external proof remain unresolved. Consumers: AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial.
- Interface proof: Prime-to-p and p lattice spaces: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: The identity marking gives precisely the imported T_ℓA and C(A) (or its stated linear dual).; The zero-dimensional abelian variety has one lattice tuple.; A tuple differing from the standard lattice at infinitely many primes is excluded from the finite-support space.. The source passage is read; its library adapter and any cited external proof remain unresolved. Consumers: AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space.
- Interface proof: Adelic class set of the endomorphism group: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: Any rational unit e∈E^×(Q) has the identity class.; Changing a local lattice by conjugation replaces K by its conjugate and induces the corresponding class-set bijection.; For a nonmaximal order include nonprojective full lattices; its class set is not identified with Pic(R).. The source passage is read; its library adapter and any cited external proof remain unresolved. Consumers: AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set.
- Interface proof: Algebra acting on a Frobenius polynomial block: Supply the construction and its universal/compatibility properties on the actual imported carrier, with these fixed tests: For a=1 the block algebra is K, with U=θ.; After a splitting base extension it is a full a×a matrix algebra, with weighted cyclic U and diagonal coefficient action.; If L⊗Q_p K is a product, the construction retains every idempotent and its σ-permutation; it is not replaced by one arbitrarily selected coefficient field.. The source passage is read; its library adapter and any cited external proof remain unresolved. Consumers: AbelianSchemesAndArithmeticModuliPartII:F1/frobenius-block-algebra.
- Ordinary connection and translation compatibility: Split Lemma 5.14 into its three diagram calculations on the completed coefficients, and prove each after the ordinary splitting and Hodge projection are constructed. Obtain and compare the Sprang elliptic sources (2019 and 2020) and the product-of-two-elliptic-curves example; those papers are not claimed read. Consumers: AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization, AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization.
- Primary auxiliary proof: Tits: free subgroups of linear groups: Supply the source proof and native hypotheses for this exact auxiliary: A subgroup of GL_n over a field of characteristic 0 that is not virtually solvable contains a free subgroup on two generators; in particular a Zariski-dense subgroup of a non-trivial connected semisimple group does ([Tit72, Thm. 3]). Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/tits-free-subgroups.
- Primary auxiliary proof: Invariance of domain in equal real dimension: Supply the source proof and native hypotheses for this exact auxiliary: A continuous injective map f:U→ℝ^m from an open subset U⊆ℝ^m is open and is a homeomorphism onto its image. Consequently the same local assertion holds between real m-manifolds. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/invariance-of-domain.
- Primary auxiliary proof: Real constant-rank theorem for Betti fibres: Supply the source proof and native hypotheses for this exact auxiliary: For a C^k map f:M^m→N^n of finite-dimensional real manifolds, 1≤k≤∞, with differential of constant rank r on an open neighbourhood, local C^k coordinates put f in projection form. Each nonempty fibre in that neighbourhood is a C^k submanifold of dimension m−r. Apply to the real-analytic Betti map on its smooth maximal-rank locus, where m=2 dim X. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/real-constant-rank.
- Primary auxiliary proof: Good-cover refinement on a Riemann surface: Supply the source proof and native hypotheses for this exact auxiliary: Every open cover of a second-countable Hausdorff Riemann surface has a locally finite refinement by relatively compact coordinate neighbourhoods such that every nonempty finite intersection is contractible. In the connected noncompact intersections used here these are topological open discs. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/riemann-good-cover.
- Curve monodromy proof refinements: Verify each collision/good-cover continuation, the constant-dimensional kernel argument including the two exceptional relative-dimension-zero cases, and the density of algebraic points in the resulting full-rank open locus. These are source-decomposed targets with named supplier leaves, not a completed proof. Consumers: AbelianSchemesAndArithmeticModuliPartII:B2/definable-ax-set, AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-invariant-variety, AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-transport, AbelianSchemesAndArithmeticModuliPartII:B2/free-monodromy, AbelianSchemesAndArithmeticModuliPartII:B2/virtual-invariant-kernel, AbelianSchemesAndArithmeticModuliPartII:B2/degenerate-generically-special, AbelianSchemesAndArithmeticModuliPartII:B2/full-rank-algebraic-point.
- Weil estimates and algebraic-number carrier: Supply the ℓ-independent Weil absolute-value theorem from the existing Weil-conjecture roadmap and the embedding/conjugacy carrier for Weil numbers. A bare integer reciprocal polynomial need not be realizable in the same dimension. Consumers: AbelianSchemesAndArithmeticModuliPartII:F0/weil-q-number.
- Honda existence: Obtain and decompose Honda 1968 existence for every Weil q-number, including the field-of-definition construction and multiplicity. Waterhouse Chapter 2 states the theorem; Smith cites it. Neither a citation nor arbitrary reciprocal polynomials supply the missing existence proof. Consumers: AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate.
- General-q lattice variance: Prove the general-q covariant realization dictionary against the imported contravariant W(k)-Dieudonné functor. The prime-field linear dual is explicitly constructed separately; it is not silently applied to all q. Consumers: AbelianSchemesAndArithmeticModuliPartII:F3/marked-quasi-isogeny.
- Finite subgroup quotient and integral order realization: Supply the exact abelian quotient and lattice correspondence over the stated field, including the finite-flat kernel, local multiplicator order and finite support. Waterhouse kernel ideals and maximal-order theorems must not be generalized to all nonmaximal invertible ideals. Consumers: AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-realization, AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-orders, AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-classification.
- Repaired local counting endpoint: The exact repeated-block orbit estimate, adelic aggregation and stabilizer bounds needed for the 69/4 endpoint are not proved by the publicly obtained LT v1. Prove the GN.2 requests or obtain and verify a repaired primary argument. The endpoint is a conditional target; no closed numerical theorem is asserted. Consumers: AbelianSchemesAndArithmeticModuliPartII:F4/conditional-orbit-bound, AbelianSchemesAndArithmeticModuliPartII:F6/repaired-unpolarized-count.
- Exact69/4 numerical assembly: The conditional D_*³h group lemma is a coarse alternate orbit bound. Supply the sharper local/discriminant/stabilizer estimates and verify their exponents separately before deriving69/4; that numerical constant does not follow merely by substituting D_* in the coarse lemma. Consumers: AbelianSchemesAndArithmeticModuliPartII:F6/repaired-unpolarized-count.
- Polarization counting and mass leaves: Supply the finite-field Brauer vanishing, exact Rosati principal-polarization orbit dictionary in every characteristic, the local norm/ambiguous ideal sequence, and the weighted-to-unweighted Hermitian mass and residue estimates. The corrected 1/2 coefficient is retained but depends on these requests. Consumers: AbelianSchemesAndArithmeticModuliPartII:F5/polarization-line-bundle-descent, AbelianSchemesAndArithmeticModuliPartII:F5/squarefree-polarization-bound, AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-power-polarizations, AbelianSchemesAndArithmeticModuliPartII:F6/repeated-factor-dominance.
- CM split-prime and small-characteristic leaves: Verify the nine class-number-one computations, their squareclass independence, Chebotarev density, and the separate p=3 elliptic trace cases. The density and odd-characteristic statement are targets, not results inferred from a name search. Consumers: AbelianSchemesAndArithmeticModuliPartII:F5/nine-cm-split-density, AbelianSchemesAndArithmeticModuliPartII:F5/cm-elliptic-existence, AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-pgroups.
- Ordinary polynomial and lattice-counting proof: Decompose the real-root-region boundary lemma needed by DPH Lemma 2.5.1, the weighted diamond lattice counts, ordinary realizability criterion and exact inequality including its possibly negative finite-n right side. The fixed-q asymptotic follows only after these inputs. Consumers: AbelianSchemesAndArithmeticModuliPartII:F6/ordinary-isogeny-lower.
- Degree-two Tau Ceti prototype: The pinned Tau Ceti source statement is read, but no existing compiled Tau build at f790474 is available here. The comparison signature is omitted rather than imported from a different commit or modelled by a replacement submodule. Consumers: AbelianSchemesAndArithmeticModuliPartII:P0/degree-two-baseline.

## Suggested file and review acceptance

The suggested file contains the native invariant tensor submodule and degree-product carrier, their proposed APIs and six examples, together with monic coefficient lifting, fixed-size resultant congruence and the p-adic recognition theorem. The native valuation sends zero to zero, so both nonzero-resultant guards are explicit. Every other declaration, API and test is individually listed as an omission with its actual missing interface. There are no replacement Prop-valued fields, synthetic geometric carriers or claims that the compiled native subset proves any geometric or counting theorem. Review checks every source convention and proof leaf, every baseline statement, the complete 94-item target mapping, the stage and declaration DAGs, APIs and discriminating examples, and the conditional status of the numerical endpoint. A successful parser or Lean elaboration does not establish mathematical closure.


Compilation receipt: the final whole suggested file elaborated at the pinned Mathlib and Lean commits with zero errors and 17 admission warnings. Two native carriers, three native theorem signatures, seven API signatures and six examples were checked for typing. Preflight available memory was 31 GiB; elapsed 0:07.41, peak RSS 2695540 KiB. The remaining 110 declarations are individually omitted. This is a typing check, not a proof or geometric elaboration claim.
