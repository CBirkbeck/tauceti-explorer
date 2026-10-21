# Counting bundles over function fields

This roadmap connects three descriptions of the same invariant: the number of geometrically indecomposable vector bundles on a curve, a partition-residue expression extracted from its spherical Hall algebra, and the cohomology of coprime stable canonical Higgs moduli. The first description is a finite-field count without automorphism weights. The Hall calculation passes through weighted groupoids of nilpotent pairs; the Higgs comparison returns to points of a coarse moduli space. Keeping these three counting conventions separate is essential.

The arithmetic route first transfers existing module decomposition results to coherent sheaves, then evaluates nilpotent-pair groupoids by two methods. One method uses endomorphism radicals and a plethystic exponential; the other uses Jordan filtrations, spherical Hall products and residues. Equating them gives a finite rank-by-rank algorithm. The geometric route identifies a coprime Higgs point count, proves purity using a contracting action and reads off Betti numbers and nilpotent-cone components. Mellit's deformation of the partition kernel proves integrality and degree independence, transferring the coprime positivity conclusion to every degree. Quasi-parabolic counts and Euler-characteristic Hall algebras form a separate final layer with explicitly distinguished conjectures.

The document specifies targets rather than asserting formalisation. Each target below has a stable packet identifier, hypotheses, prerequisites, source locators and a proof route. Every new definition or construction has its API, three discriminating checks and consumers. The complete planning pass has twelve stages and retains the supplier contracts and proof-closure gaps listed at the end. Those gaps concern unverified source reductions or missing supplier interfaces; they are distinct from the mathematical conjectures in CB.11.

## Conventions and boundary cases

Throughout, k is a finite field of cardinality q and X/k is smooth, projective and geometrically connected of genus g. A vector bundle has rank r>0 and integral degree d. Coherent torsion sheaves have rank zero and slope +∞. HN factors are ordered by decreasing slope. We use

χ((r,d),(s,e))=(1−g)rs+re−sd.

The coefficient parameters are the geometric-Frobenius eigenvalues α₁,…,α₂g of H¹(X), paired so that α₂i−1 α₂i=q. Write P_X(t)=∏(1−α_j t) and ζ_X(t)=P_X(t)/((1−t)(1−qt)). Universal expressions use the corresponding reciprocal-coordinate torus and Weyl invariants; q remains a variable even in genus zero. Adams operations raise q, every α_j and all series variables to the same power. Thus the Adams operation on 1−∑α_j+q specializes to the point count over the corresponding extension field.

Hall multiplication puts the quotient in the left slot and the subobject in the right slot. Its coefficient twist uses v=q^(1/2). Completions are coefficientwise HN completions, and each multiplication must have a finite coefficient sum. Untruncated degree series can be bilateral distributions; they are multiplied by Laurent polynomials when clearing denominators, without requiring a general product of distributions. Exp and Log always denote the plethystic operations for the stated Adams structure.

Residues have two distinct conventions. If h=1−z/u, rRes at z=u is the coefficient of h⁻¹ in the function. dRes is the ordinary residue of the differential f(z) dz/z. At a simple pole dRes=−rRes. They differ at higher poles: f=h⁻² has rRes=0 and dRes=−1. Iterated Hall residues are ordered, starting with the highest specified index. The roots-of-unity extraction of CB.6 uses dRes, whereas the block kernels use rRes.

For g≥1 and coprime (r,d), write D=1+(g−1)r². Stable canonical Higgs coarse moduli have dimension 2D, their scalar-gerbe stack has dimension 2D−1, and the nilpotent cone has dimension D. We use geometric Frobenius, so the twist (−a) contributes q^a. Compact Poincaré polynomials are signed unless explicitly called unsigned. Genus-zero bundles are treated directly by splitting on the projective line; the positive-genus Mellit theorem is not needed for them.

## Existing owners and the pinned starting point

General vector bundles come from the current upstream AlgebraicVectorBundles roadmap: its locally free sheaves, tensor operations, pullbacks and total spaces are not reconstructed here. Generic quiver representations and their module comparison come from the current QuiverRepresentations roadmap. Both current reader documents were checked, together with the relevant suggested declarations and the newer roadmap tree at upstream commit 0d144d044dacebca17b654695b6f1ad58f159b27. The atlas snapshot alone does not contain all of that work.

| Interface | Owner used here | New work in this roadmap |
| --- | --- | --- |
| Coherent sheaves, HN theory and fixed-degree bundle masses | GS.0, using the current bundle owner | Coherent add(M) transfer, nilpotent pairs and Jordan fibre exponents |
| Curve arithmetic, Picard torsors, zeta function and degree-one divisor | SF.3 and the exact FA.5 nodes | Counting normalization and cutoff consequences |
| Quot charts, character quotients and deformation theory | R09.2, requested R09.5 continuation, SF.4 | Canonical Higgs moduli, two-line chart and central deformation |
| Good-line generation and Lang theorem | Existing ET.2b canonical boundedness and RG2.3/lang-theorem, with the fixed-source integration below | Computable sufficient framing bound and its indecomposability application |
| Adams series and modified Macdonald machinery | Requested QM.0 continuation and Part II | Curve partition kernels and Mellit's curve-specific deformation |
| Weights, six operations and duality | DWP.0/8, SF.2 and EDC.2:pairings | Higgs purity, trace extraction and component count |
| Universal curve monodromy and equidistribution | Requested LPV.5 continuation/Part II | Uniqueness of universal counting functions |

These are contracts, not assertions that the current broad stages already export every item. Their exact missing content is recorded below.

Mathlib is pinned to 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti to f790474821cf4256814db967cb154e7af3d0c369. The following declarations were read at those pins:


- `tauceti:TauCeti.exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end` in `TauCeti/RingTheory/KrullSchmidt/DirectSum.lean`: For finite indexing types, two external module decompositions, local endomorphism rings on one side and indecomposable nonzero summands on the other give a bijection of summands and componentwise linear equivalences. The ambient module need not be finite length.

- `tauceti:TauCeti.isLocalRing_end_of_isIndecomposable` in `TauCeti/RingTheory/KrullSchmidt/Indecomposable.lean`: For an A-module M over a ring, IsFiniteLength A M and IsIndecomposableModule A M imply IsLocalRing (Module.End A M). This is a module theorem; transferring it to coherent sheaves is a new target.

- `mathlib:IsArtinianRing.isNilpotent_jacobson_bot` in `Mathlib/RingTheory/Artinian/Ring.lean`: For an Artinian ring, the Jacobson radical of the zero ideal is a nilpotent ideal.

- `mathlib:IsArtinianRing.isSemisimpleRing_iff_jacobson` in `Mathlib/RingTheory/Artinian/Module.lean`: For an Artinian ring R, semisimplicity is equivalent to Ring.jacobson R=0.

- `mathlib:Matrix.card_GL_field` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean`: For a finite field of cardinality q, Nat.card(GL(Fin n) F)=∏_{i:Fin n}(q^n−q^i). It counts units, not nilpotent matrices.

- `mathlib:YoungDiagram` in `Mathlib/Combinatorics/Young/YoungDiagram.lean`: A finite lower-closed set of pairs of natural numbers, with row and column lengths; used as the existing partition carrier.

- `mathlib:YoungDiagram.transpose` in `Mathlib/Combinatorics/Young/YoungDiagram.lean`: Transpose swaps the two coordinates of cells and exchanges row and column lengths.

- `tauceti:YoungDiagram.armLength` in `TauCeti/Combinatorics/Young/HookLength/Basic.lean`: At a cell s, armLength is rowLen(s.1)−s.2−1, with natural-number subtraction and the cell-membership simplification lemmas.

- `tauceti:YoungDiagram.legLength` in `TauCeti/Combinatorics/Young/HookLength/Basic.lean`: At a cell s, legLength is colLen(s.2)−s.1−1; it is the arm length after transpose.

- `mathlib:Finite.isDomain_to_isField` in `Mathlib/RingTheory/LittleWedderburn.lean`: A finite ring that is a domain satisfies IsField. Apply it to the finite residue division ring, which has the required domain instance.


In particular, the coherent category is not assumed to have finite length. The transfer through Hom(M,−) lands in finite-dimensional modules over End(M)ᵒᵖ, where the pinned module results apply. The GL-cardinality formula counts units and does not replace the nilpotent-matrix enumeration. Existing YoungDiagram cells, transpose, arms and legs supply the partition carrier throughout.

## Worked checks and the arithmetic suggested file

Rank one checks every normalization at once. A_X(1,d)=#Pic⁰_X(k)=P_X(1), including curves without a rational point: a degree-one divisor and finite-field Picard-torsor arguments provide the needed degree shift. Higgs moduli are Pic^d×A^g, so their point count is q^g P_X(1). Their signed compact Poincaré polynomial is t^(2g)(1−t)^(2g). The nilpotent cone is Pic^d; its reciprocal formula is q^g P_X(α⁻¹)=P_X(1), and its top cohomology is in degree 2g. These examples detect both the missing factor of two in a cohomological shift and the wrong q^(2D) prefactor in the published corollary.

In genus zero, A_X(1,d)=1 and all higher-rank counts vanish. In genus one, every positive rank and every degree has count P_X(1). Substituting one reciprocal pair (a,q/a) into the rank-two expression gives P_X(1), while the empty pair list gives zero. The genus polynomials 4·binom(g,2)+g and 32·binom(g,3)+20·binom(g,2)+g are origin constants for ranks three and four: for g=2 they are 6 and 22, not the full Weil-parameter counts.

The proposed computable framing choice in CB.8 is deliberately stronger than the source's existential choice. For g=2,r=2,d=1 it gives B=−3/2, d₁=5, l₁=9, d₂=24, l₂=47 and C=423. The congruence d₂−d₁≡1 mod l₁ makes l₂≡r mod l₁; coprimality of r,d then forces coprime frame dimensions. The kernel bound concerns K⊂L₁^l₁ with this fixed l₁. It is not a bound for arbitrary source dimension. The slope and fixed-source kernel calculation in CB.8 verifies this sufficient recipe using the requested strong-generation criterion, including torsion and zero-kernel cases. Only existence of a sufficient bound is attributed to Schiffmann.

The suggested Lean file contains seven light definitions over existing integers, natural numbers, finite functions and fields. They name arithmetic subexpressions of the targets rather than introducing geometric carriers. Their interface and examples are:

| Definition and target | API signatures | Checks |
| --- | --- | --- |
| `higgsHalfDimension g r = 1+(g−1)r²` (CB.7/9) | rank one equals g; genus one equals 1; g≥1 implies positivity | (2,2)↦5; (0,1)↦0; twice the (3,1) value is 6 |
| `frameDimension g r d a = (1−g+a)r+d` (CB.8) | add a degree b adds br; rank-one formula; coprime r,d implies coprime frame dimension and r | (2,2,1,3)↦5; (1,1,0,0)↦0; increasing a by 1 adds 2 for rank 2 |
| `kingWeight l₁ l₂ a₁ a₂ = l₁a₂−l₂a₁` (CB.8) | additivity; the two-frame expression equals (b−a)(dr′−rd′); a nonzero proper bounded dimension pair has nonzero weight for positive coprime total dimensions | totals (2,3), subpairs (1,1)↦−1, (1,2)↦1, (2,3)↦0 |
| `jordanSize m = ∑i i·m_i` (CB.2/5) | zero; single block; additivity | multiplicities single(2,1)↦2, single(1,2)↦2, single(0,3)↦0 |
| `rankTwoFormula q α` (CB.6) | permutation invariance; empty tuple gives zero for q≠±1; pair (a,b) with q=ab≠0,±1 gives (1−a)(1−b) | q=2 with empty tuple gives 0; pairs (−1,−2) and (−2,−1) both give 6 |
| `rankThreeConstant g` (CB.6) | genus-one value; displayed binomial expansion; monotonicity in g | genera 1,2,3 give 1,6,15 |
| `rankFourConstant g` (CB.6) | genus-one value; displayed binomial expansion; monotonicity in g | genera 1,2,3 give 1,22,95 |

The rank-two function is an expression over a field with total division. Its geometric use is the regular rational expression of CB.6; the interfaces do not assert that pointwise total division implements extension across every pole. The nilpotent-matrix end theorem is also statable directly on pinned matrices, with size-zero, size-one and size-two examples. Three final checks use the imported YoungDiagram arm and leg formulas. All geometric definitions, their full APIs and their tests are specified in the layers below.


## CB.0 — Universal coefficients and bundle counts


Specialize the existing reciprocal GSp torus and full character ring to curve Weil data, with an explicit genus-zero convention, and form K_g by inverting q^m−1. Define geometric-indecomposable counts and their HN truncations. Basic finiteness, rank-one, genus-zero, duality and periodicity theorems follow in CB.1, using a degree-one divisor rather than a rational point. Density is an explicitly requested universal-family input, not a new monodromy proof here.


The stage requires `ClassicalGroupsPartII:CG.0/diagonal-torus`, `ClassicalGroupsPartII:CG.0/weyl-action`, `ClassicalGroupsPartII:CG.2/rational-character-isomorphism`, `DeligneWeightsAndPurity:DWP.0`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `QSeriesPartitionsAndMockModularForms:QM.0`, `SchemeAndStackFoundations:SF.1`.


### Universal counting coefficient ring


Target `CB.0/coefficient-frame` (construction); proposed name `TauCeti.CurveCounting.coefficient_frame`.


For g≥1 use the diagonal torus and reciprocal Weyl action of ClassicalGroupsPartII, rationalize its full integral invariant ring to R_g=Q[q±1,a_1±1,…,a_g±1]^W with paired coordinates α=(a_1,q/a_1,…,a_g,q/a_g). Set K_g=R_g[(q^m−1)⁻¹:m≥1]. For g=0 take T_0=G_m with coordinate q, W_0=1. Curve specialization sends q to #k and α to the geometric-Frobenius eigenvalues of H¹(X). Adams ψ_l raises all torus coordinates to the l-th power and extends to K_g.


Prerequisites: `ClassicalGroupsPartII:CG.0/diagonal-torus`, `ClassicalGroupsPartII:CG.0/weyl-action`, `ClassicalGroupsPartII:CG.2/rational-character-isomorphism`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `DeligneWeightsAndPurity:DWP.0`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §1.1, p.299; §1.3, pp.302–303.


Proof route:


1. Base-change the supplier lattice and invariant presentation to Q.

2. Localize at the W-fixed elements q^m−1 and use their nonvanishing at prime powers.

3. Check ψ_l preserves the multiplicative set and sends a curve specialization to the corresponding finite extension.


Check: q is retained when g=0. Specialization has no pole at any finite-field Weil tuple.


API:


- `coefficientSpecialization` (universal-property): Any reciprocal tuple over a Q-algebra with q and all q^m−1 invertible induces the unique K_g algebra map extending its invariant evaluation.

- `adams_specialize` (compatibility): ev_X∘ψ_l=ev_(X_Fq^l) on K_g.

- `fullCharacterRing` (equivalence): For g≥1, R_g is Q tensored with the full algebraic GSp character ring, through the supplier restrictionCharacter map; it is not Yu’s positive tensor-constituent subring.


Unit tests:


- `rank_zero_torus` (degenerate): R_0=Q[q±1], not Q.

- `one_pair` (small): For g=1, a+q/a is Weyl fixed while a alone is not.

- `adams_denominator` (compatibility): ψ_2((q−1)⁻¹)=(q²−1)⁻¹, not (q−1)⁻².


Consumers: CB.4–CB.6: Universal flag volumes and residue coefficients specialize along this map.; YuCountingPartII: Consumes the same paired Weil coordinates and the full-versus-positive character-ring distinction..


Atlas planet: Universal counting coefficient ring.


### Geometrically indecomposable counts


Target `CB.0/indecomposable-counts` (definition); proposed name `TauCeti.CurveCounting.indecomposable_counts`.


For r>0 and d∈Z, A_X(r,d) is the cardinality of the set of k-isomorphism classes of rank-r degree-d vector bundles whose pullback to k̄ is nonzero and indecomposable. A_X^{≥ν}(r,d) imposes μ_min≥ν, and A_X^{≤ν} imposes μ_max≤ν. A_X^{≥0}(0,d)=#X(k) for d>0 counts coherent torsion objects; set the zero-object indecomposable count to zero. Positive-rank A without a slope decoration always counts bundles.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`.


Source: S16 §1.1, p.299; §2.1, pp.307–308; §5.7, p.334; §8.1, p.353.


Proof route:


1. Define the isomorphism-invariant geometric predicate and its class cardinality.

2. Use HN subcategories for the decorated counts; finiteness is the separate CB.1/count-normalizations theorem.


Check: Zero is excluded. Absolute indecomposability is tested after k̄, not merely over k.


API:


- `absoluteIndecomposable_iso` (compatibility): The predicate is preserved by bundle isomorphism and finite extension, with extension to k̄ canonically identified.

- `count_truncation` (characterisation): A_X^{≥ν} counts exactly the subset of absolute indecomposables satisfying the imported μ_min bound.

- `torsion_absolute_count` (simp): For d>0 the only absolute indecomposable torsion objects are length-d modules at k-rational points, so their number is #X(k).


Unit tests:


- `line_bundles` (small): A_X(1,d)=#Pic⁰_X(k), independently of whether X(k) is empty.

- `zero_excluded` (degenerate): The zero sheaf contributes neither to A_X(0,0) nor to any indecomposable Euler product.

- `extension_field_point` (non-example): A torsion sheaf simple over a closed point of degree e>1 is k-indecomposable but splits over k̄ and is not counted in A_X(0,e).


Consumers: CB.2/nilpotent-exponential: Counts absolute summands in the finite-field tower Euler product.; CB.8/stable-higgs-count: Gives the invariant identified with stable Higgs points..


Atlas planet: Geometrically indecomposable counts.


### Normalized and differential residues


Target `CB.0/residue-conventions` (definition); proposed name `TauCeti.CurveCounting.residue_conventions`.


For u≠0, expand a rational function f(z) in h=1−z/u and define rRes_(z=u) f as its h⁻¹ coefficient. Separately dRes_(z=u)(f(z)dz/z) is the ordinary differential residue. For a simple pole dRes(f dz/z)=−rRes f; for higher-order poles no such equality is asserted. An iterated block residue uses the specified descending variable order with other variables in the coefficient field.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`.


Source: S16 §1.3, p.303; Theorem 1.6, p.304.


Proof route:


1. Use the local Laurent expansion at a nonzero point.

2. For differential residue substitute dz/z=−dh/(1−h).

3. Iterate one-variable normalized residues in the exact block order.


Check: Function and differential residues have distinct names. The kernel residues use rRes, while count extraction uses dRes.


API:


- `normalizedResidue_linear` (structure): rRes and dRes are linear over the coefficient field.

- `residue_simple_pole` (compatibility): For f with pole order ≤1 at u, dRes(f dz/z)=−rRes f.

- `iteratedResidue_order` (data): The descending list of variables and pole equations is part of an iterated residue operation, not a permutation-invariant set.


Unit tests:


- `simple_binomial` (small): rRes at z=u of 1/(1−z/u) is 1, and dRes of that function times dz/z is −1.

- `double_pole` (non-example): For f=(1−z/u)⁻², rRes f=0 but dRes(f dz/z)=−1.

- `regular_function` (degenerate): A function regular at u has both residues zero.


Consumers: CB.4/bundle-residue: Fixes the source’s nonstandard function-residue normalization.; CB.6/residue-extraction: Fixes the Fourier extraction sign..


Stage closure obligations: Discharge the exact supplier contracts from GlobalShtukasAndFunctionFieldLanglands:GS.0, SchemeAndStackFoundations:SF.1, QSeriesPartitionsAndMockModularForms:QM.0, DeligneWeightsAndPurity:DWP.0.


## CB.1 — Coherent decompositions and finite-field descent


Transfer finite-length module Krull–Schmidt to the additive subcategory generated by one coherent sheaf. Compute the endomorphism radical, nilpotent-to-unit ratio and finite-field Galois orbits. Establish the large-degree HN bound and the coprime absolute-indecomposability criterion. General bundle and HN definitions remain imports.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `FunctionFieldArithmetic:FA.5/schmidt-degree-one`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `QSeriesPartitionsAndMockModularForms:QM.0`, `ReductiveGroupsPartII:RG2.3/lang-theorem`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`, `mathlib:Finite.isDomain_to_isField`, `mathlib:IsArtinianRing.isNilpotent_jacobson_bot`, `mathlib:IsArtinianRing.isSemisimpleRing_iff_jacobson`, `mathlib:Matrix.card_GL_field`, `tauceti:TauCeti.exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end`, `tauceti:TauCeti.isLocalRing_end_of_isIndecomposable`.


### Basic count normalizations


Target `CB.1/count-normalizations` (theorem); proposed name `TauCeti.CurveCounting.count_normalizations`.


For r>0 the count is finite, A_X(r,d+r)=A_X(r,d), and A_X(r,−d)=A_X(r,d). For r=1 it equals P_X(1)=#Pic⁰_X(k). For X of genus zero it is 1 for r=1 and 0 for r>1. No choice of rational point on X is required.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.0/indecomposable-counts`, `FunctionFieldArithmetic:FA.5/schmidt-degree-one`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.3`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/large-degree`.


Source: S16 §1.1, p.299; §5.8, pp.334–335.


Proof route:


1. Tensor with O(D_1) for a degree-one integer divisor, preserving all decompositions after base change.

2. Dualization reverses degree and preserves absolute indecomposability.

3. Use the Picard torsor and finite-field descent for rank one; use the genus-zero splitting theorem for higher ranks. Finiteness follows from CB.1/large-degree and HN boundedness.


Check: Check genus one: every coprime rank-degree count equals #Pic⁰(k), while the general rank count is established through the explicit formula. Distinguish period r from full degree independence.


### Coherent additive Hom transfer


Target `CB.1/hom-transfer` (construction); proposed name `TauCeti.CurveCounting.hom_transfer`.


For M∈Coh(X), let add(M) consist of direct summands of finite sums of M. Hom(M,−) is a fully faithful additive functor from add(M) to finite projective left modules over End(M)^op, and is essentially surjective. End(M) is a finite-dimensional k-algebra. Its functor sends decompositions and idempotent splittings to the corresponding module decompositions.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.3`, `tauceti:TauCeti.exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end`.


Source: S16 §2.2, Lemma 2.3, p.309; transfer of the pinned module theorem.


Proof route:


1. Use proper coherent Hom finiteness and the abelian category’s splitting of idempotents.

2. On finite sums compute Hom by matrices over End(M)^op; restrict to idempotent images for full faithfulness.

3. A finite projective module is an idempotent image of a finite free module, which lifts to an idempotent of a sum of M.


Check: Do not assert Coh(X) is a finite-length category. Track the opposite ring in the action.


API:


- `homTransfer_fullFaithful` (equivalence): The natural Hom map is bijective and additive on add(M).

- `homTransfer_biproduct` (compatibility): A finite biproduct maps to the corresponding finite direct sum of modules.

- `homTransfer_end` (equivalence): The endomorphism ring of N∈add(M) identifies with the module endomorphism ring of Hom(M,N).


Unit tests:


- `regular_module` (small): M maps to the regular rank-one End(M)^op-module.

- `zero_object` (degenerate): The zero summand maps to the zero module, and conversely by full faithfulness.

- `torsion_warning` (non-example): For a positive-degree line bundle L, its coherent subsheaf chain L(−nx) does not make L an Artinian object of Coh(X); no such premise enters this transfer.


Consumers: CB.1/krull-schmidt: Imports local-endomorphism and uniqueness theorems through this equivalence..


Atlas planet: Coherent additive Hom transfer.


### Krull–Schmidt for coherent sheaves


Target `CB.1/krull-schmidt` (theorem); proposed name `TauCeti.CurveCounting.krull_schmidt`.


Every coherent sheaf is a finite direct sum of nonzero indecomposables, uniquely up to permutation and isomorphism. The endomorphism algebra of an indecomposable is local with finite residue division field k_M/F_q. Every endomorphism of an indecomposable is either a unit or nilpotent.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.1/hom-transfer`, `tauceti:TauCeti.isLocalRing_end_of_isIndecomposable`, `tauceti:TauCeti.exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end`, `mathlib:Finite.isDomain_to_isField`.


Source: S16 §2.2, Lemma 2.3 and Corollary 2.5, p.309.


Proof route:


1. Find a minimal finite decomposition by splitting idempotents; the dimension of End decreases on proper summands.

2. Apply the finite-length module local-ring theorem through hom-transfer; apply direct-sum uniqueness in the same way.

3. Use Wedderburn’s finite division-ring theorem for the residue field.


Check: A rank-one bundle may have arbitrarily long coherent subsheaf chains. Repeated isomorphic summands are grouped before forming the residue algebra.


### Radical and semisimple matrix quotient


Target `CB.1/endomorphism-radical` (theorem); proposed name `TauCeti.CurveCounting.endomorphism_radical`.


If M=⊕_i M_i^{n_i} with pairwise nonisomorphic indecomposable M_i, then rad End(M) has every off-diagonal Hom block and diagonal block M_{n_i}(rad End(M_i)). Consequently End(M)/rad≃∏_i M_{n_i}(k_{M_i}). The radical is nilpotent, and an endomorphism is nilpotent iff its image in every matrix quotient is nilpotent.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.1/krull-schmidt`, `mathlib:IsArtinianRing.isNilpotent_jacobson_bot`, `mathlib:IsArtinianRing.isSemisimpleRing_iff_jacobson`.


Source: S16 §2.2, Lemma 2.4, p.309 (matrix-block correction).


Proof route:


1. Write composition in block matrices and identify the ideal by its action on the distinct simple projective tops.

2. Use the semisimple quotient and nilpotent radical of the Artinian endomorphism algebra.

3. Lift nilpotence through a nilpotent ideal.


Check: For M=L⊕L the quotient is M₂(k), not k×k. Off-diagonal maps between different isomorphism types vanish in the quotient.


Atlas planet: Radical and semisimple matrix quotient.


### Finite-field nilpotent matrix count


Target `CB.1/nilpotent-matrix-count` (theorem); proposed name `TauCeti.CurveCounting.nilpotent_matrix_count`.


For a finite field K of cardinality Q and n≥0, #{u∈M_n(K):u is nilpotent}=Q^{n(n−1)}. Also #GL_n(K)=∏_{j=0}^{n−1}(Q^n−Q^j), with both empty counts equal to 1.


Prerequisites: `mathlib:Matrix.card_GL_field`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §2.2, Corollary 2.5, p.309; Appendix A, p.356 (Fine–Herstein input).


Proof route:


1. Classify nilpotent modules by Jordan partitions and compute their centralizer units.

2. Sum the reciprocal centralizer masses by the q-binomial/Heine identity.

3. Multiply by #GL_n(K); the exact primary proof of the partition summation is an explicit source-closure gap G2.


Check: n=1 gives exactly one nilpotent. n=2 over F₂ gives four nilpotents.


### Nilpotent-to-automorphism ratio


Target `CB.1/nilpotent-unit-ratio` (theorem); proposed name `TauCeti.CurveCounting.nilpotent_unit_ratio`.


For the decomposition above, #End_nil(M)/#Aut(M)=∏_i Q_i^{n_i(n_i−1)}/#GL_{n_i}(F_{Q_i}), where Q_i=#k_{M_i}. The identical radical-fibre factor cancels from numerator and denominator.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.1/endomorphism-radical`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/nilpotent-matrix-count`.


Source: S16 §2.2, Corollary 2.5, p.309.


Proof route:


1. Push nilpotents and units to the semisimple quotient; both maps have fibres of size #rad.

2. Factor over simple matrix components and apply the matrix count.


Check: For an absolute indecomposable this ratio is 1/(q−1), even when End(M) is larger than k. For L⊕L the ratio is q²/#GL₂(k).


### Neutrality for connected finite-field bands


Target `CB.1/finite-field-neutrality` (theorem); proposed name `TauCeti.CurveCounting.finite_field_neutrality`.


Let k be finite and G a smooth connected linear algebraic k-group, or a smooth connected band arising as the automorphism group of a coherent object. Every nonabelian H²(k,G)-class arising in its descent gerbe is neutral. Thus a Frobenius-stable geometric isomorphism class of coherent sheaves admits a k-form. Uniqueness of that form uses the separately imported H¹(k,G)=1.


Prerequisites: `SchemeAndStackFoundations:SF.1`, `ReductiveGroupsPartII:RG2.3/lang-theorem`.


Source: S16 §2.2, proof of Lemma 2.6, p.311, citing Springer 1966 Theorem 3.5.


Proof route:


1. Realize the isomorphism-class descent problem as a gerbe banded by the unit group of a finite-dimensional endomorphism algebra.

2. Apply the finite-field neutrality theorem; then apply Lang to the set of forms.

3. The full primary proof of this nonabelian H² input was unavailable; retain gap G1 rather than identify H² with an ordinary group.


Check: H¹ vanishing alone is not an existence proof. Finite-field G_m-gerbes are neutral.


Atlas planet: Neutrality for connected finite-field bands.


### Galois orbits of absolute summands


Target `CB.1/galois-orbits` (theorem); proposed name `TauCeti.CurveCounting.galois_orbits`.


A k-indecomposable M with residue field F_{q^e} becomes over k̄ the sum of e pairwise nonisomorphic absolute indecomposables, permuted transitively by Frobenius, each of class [M]/e. Conversely a length-e Frobenius orbit of absolute indecomposables descends to exactly one k-indecomposable. If c_e(α) counts those orbits in geometric class α, then A_{X_Fq^l}(α)=∑_{e|l} e c_e(α). In particular e divides both r and d for a bundle of class (r,d).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.1/krull-schmidt`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/endomorphism-radical`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/finite-field-neutrality`, `ReductiveGroupsPartII:RG2.3/lang-theorem`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/indecomposable-counts`.


Source: S16 §2.2, Lemma 2.6 and equations (2.4)–(2.5), pp.310–311.


Proof route:


1. Split the residue field under base extension and lift primitive idempotents across the radical.

2. Indecomposability forces transitivity; identify the Frobenius orbit and its residue degree.

3. Use neutrality for existence of descent and connected-unit-group Lang for uniqueness; count fixed points over Fq^l.


Check: For e=2 the geometric summands have half the rank and degree. A field-rational absolute object is an orbit of length one.


### Coprime indecomposables are absolute


Target `CB.1/coprime-absolute` (theorem); proposed name `TauCeti.CurveCounting.coprime_absolute`.


If r>0 and gcd(r,d)=1, every k-indecomposable bundle of class (r,d) is absolutely indecomposable and End(M)/rad=k. Every f∈End(M) has a unique expression c·Id+n with c∈k and n nilpotent. This conclusion does not assert End(M)=k.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.1/galois-orbits`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/endomorphism-radical`.


Source: S16 §2.2, Lemma 2.6, pp.310–311; §6.5, Lemma 6.2, p.341.


Proof route:


1. The residue degree divides gcd(r,d), hence is one.

2. Use the nilpotent radical and its scalar quotient to split each endomorphism.


Check: A nontrivial self-extension can have nonzero radical. The zero bundle is outside r>0.


### Large degree and nonnegative HN slopes


Target `CB.1/large-degree` (theorem); proposed name `TauCeti.CurveCounting.large_degree`.


If M is an indecomposable vector bundle of rank r>0 and d>(g−1)r(r−1), then μ_min(M)≥0. Thus A_X^{≥0}(r,d)=A_X(r,d) in that range. For g≥1 adjacent HN slopes of an indecomposable differ by at most 2g−2; genus zero uses the splitting theorem separately.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.3`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/krull-schmidt`.


Source: S16 §2.1, Proposition 2.1, p.308; Mozgovoy–Schiffmann §4, Lemma 4.1 and Corollary 4.2, p.8; MS14 §4, Lemma 4.1 and Corollary 4.2, p.8.


Proof route:


1. A larger slope gap kills the relevant Ext¹ by Serre duality and forces a direct-sum decomposition.

2. Bound the spread of at most r positive-rank HN factors and compare the mean degree to the minimum.

3. Use genus-zero splitting for the exceptional negative value of 2g−2.


Check: Keep the strict bound on d. A direct sum of very positive and very negative lines is excluded by indecomposability.


Stage closure obligations: Verify primary-proof obligations G1: Finite-field nonabelian H² neutrality; G2: Primary nilpotent-matrix enumeration. Discharge the exact supplier contracts from GlobalShtukasAndFunctionFieldLanglands:GS.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, QSeriesPartitionsAndMockModularForms:QM.0, ReductiveGroupsPartII:RG2.3.


## CB.2 — Nilpotent pairs and Jordan fibre masses


Define automorphism-weighted finite groupoid masses, nilpotent-pair groupoids, Jordan types, filtered-sheaf groupoids and the three grading functors. Prove the finite-field tower exponential identity and the Jordan-fibre Euler exponents. Fibre masses use homotopy fibres with chosen grading identifications.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.1`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `QSeriesPartitionsAndMockModularForms:QM.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`, `mathlib:YoungDiagram`.


### Finite groupoid mass


Target `CB.2/groupoid-mass` (definition); proposed name `TauCeti.CurveCounting.groupoid_mass`.


For an essentially finite groupoid G, mass(G)=∑_[x] 1/#Aut(x)∈Q. For a functor F:G→H its fibre over h is the homotopy fibre of pairs (x,φ:F(x)≅h), with the commuting isomorphisms. For an arbitrary nonnegative mass sum, define convergence separately before using a real value.


Prerequisites: `SchemeAndStackFoundations:SF.1`.


Source: S16 §2.1–2.2, pp.308–309; §3.2–3.3, pp.313–315 (fibre convention made explicit).


Proof route:


1. Choose a finite skeleton and prove invariance under equivalence.

2. Identify the fibre of a finite group action by orbit-stabilizer.

3. Derive Fubini mass(G)=∑_[h] mass(F⁻¹(h))/#Aut(h).


Check: The identity functor has fibre mass 1. The mass of BG is 1/#G, not #G.


API:


- `mass_equivalence` (functoriality): Equivalent essentially finite groupoids have equal mass.

- `mass_fibre_sum` (compatibility): Fubini holds for essentially finite homotopy fibres and base.

- `mass_actionGroupoid` (simp): For a finite G-set S, mass([S/G])=#S/#G.


Unit tests:


- `classifying_groupoid` (small): mass(BGL₁(F₃))=1/2.

- `identity_fibre` (non-example): The homotopy fibre of Id:BG→BG is equivalent to a point and has mass 1, although BG has mass 1/#G.

- `empty_and_union` (degenerate): The empty groupoid has mass 0; disjoint union adds masses.


Consumers: CB.2/jordan-fibres: Prevents losing a stabilizer factor in fibre computations.; CB.3/hall-algebra: Defines pushforward along the exact-sequence correspondence..


Atlas planet: Finite groupoid mass.


### Nilpotent-pair groupoids


Target `CB.2/nilpotent-pairs` (definition); proposed name `TauCeti.CurveCounting.nilpotent_pairs`.


Nil_α has objects (F,θ), F∈Coh_α(X), θ∈End(F), θ^s=0 for some s≥1; arrows are isomorphisms intertwining θ. Nil_α^{≥0} requires F∈Coh^{≥0}. For each fixed α=(r,d) with r,d≥0 the truncated groupoid is essentially finite and mass(Nil_α^{≥0})=∑_[F] #End_nil(F)/#Aut(F). Include (0,0) as the unit pair.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/groupoid-mass`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/large-degree`.


Source: S16 §2.1, p.308; §2.2, Proposition 2.2, pp.308,311–312.


Proof route:


1. Form the action groupoid of Aut(F) on nilpotent endomorphisms over each sheaf class.

2. Use finite-type HN boundedness and finite endomorphism sets.

3. Apply mass_actionGroupoid on each isomorphism class.


Check: Automorphisms centralize θ. The nilpotency bound may be chosen classwise, not globally for all sheaves.


API:


- `nilPair_forget` (projection): Forget θ and retain the underlying coherent sheaf, compatibly with field extension.

- `nilPair_mass` (compatibility): The action-groupoid mass is #nilpotents/#Aut, not a count of conjugacy classes.

- `nilPair_zero` (simp): The unique zero pair has trivial automorphism group and mass 1.


Unit tests:


- `line_pair` (small): On a fixed line bundle only θ=0 is nilpotent, and its mass is 1/(q−1).

- `scalar_nonexample` (non-example): Id_L is excluded from Nil for nonzero L.

- `torsion_length_two` (small): For k[t]/t² supported at a rational point, multiplication by t is a nonzero nilpotent pair.


Consumers: CB.2/nilpotent-exponential: Reorganizes the nilpotent mass by indecomposable summands.; CB.5/jordan-sum: Reorganizes it by Jordan type..


Atlas planet: Nilpotent-pair groupoids.


### Nilpotent-pair exponential identity


Target `CB.2/nilpotent-exponential` (theorem); proposed name `TauCeti.CurveCounting.nilpotent_exponential`.


In Q[[u,v]] with α=(r,d), r,d≥0, ∑_α mass(Nil_α^{≥0})u^r v^d = exp(∑_{l≥1}∑_{α≠0} A_{X_Fq^l}^{≥0}(α)u^{lr}v^{ld}/(l(q^l−1))). After universal Adams-compatible coefficients exist this is Exp(∑_{α≠0} A_{g,α}^{≥0}u^r v^d/(q−1)). The first identity is an ordinary exponential of a tower of numerical counts.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/nilpotent-pairs`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/nilpotent-unit-ratio`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/galois-orbits`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §2.2, Proposition 2.2 and its proof, pp.308,311–312.


Proof route:


1. Factor the sum into one Euler factor per k-indecomposable, using Krull–Schmidt and the unit ratio.

2. Use Heine’s series for each multiplicity.

3. Regroup Frobenius orbits with the divisor identity from galois-orbits.


Check: The constant term is 1. Do not apply a fictitious Adams operation to an arbitrary single numerical count.


Atlas planet: Nilpotent-pair exponential identity.


### Jordan type of a coherent nilpotent pair


Target `CB.2/jordan-type` (definition); proposed name `TauCeti.CurveCounting.jordan_type`.


Let K_i=ker θ^i and F_i=im θ^i, with θ^s=0. Define α_i=[F_{i−1}/F_i]−[F_i/F_{i+1}] for 1≤i≤s (F_s=0). These are classes of actual coherent kernel quotients, satisfy ∑i iα_i=[F], and allow zero internal terms; only trailing zero terms are removed. Their rank multiplicities r_i give λ=(1^{r_1}2^{r_2}…).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/nilpotent-pairs`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `mathlib:YoungDiagram`.


Source: S16 §3.1, pp.312–313; §5.6, pp.331–332.


Proof route:


1. Use the surjection F_{i−1}/F_i→F_i/F_{i+1} to realize each difference as its kernel class.

2. Telescope the class identities with weights i.

3. At the generic point recover the usual nilpotent Jordan-block partition.


Check: Keep degrees as well as ranks. The rank multiplicity sequence has weighted size r.


API:


- `jordanType_weight` (compatibility): ∑i iα_i equals the full rank-degree class of F.

- `jordanType_baseChange` (functoriality): Flat finite-field extension preserves image, kernel and the Jordan class tuple.

- `jordanType_generic` (compatibility): Generic fibre has r_i blocks of size i, in the imported YoungDiagram convention.


Unit tests:


- `zero_map` (small): For θ=0 on nonzero F, α_1=[F] and every α_i with i>1 is zero.

- `one_length_two_block` (small): For a two-dimensional nilpotent Jordan block over the generic field, ranks are r_1=0,r_2=1, giving total rank 2 rather than 1.

- `torsion_only` (degenerate): For rank-zero F all r_i vanish but the nonzero degree components of α_i must be retained.


Consumers: CB.2/jordan-functors: Provides the exact graded classes.; CB.5/jordan-sum: Groups the class sum by the associated partition..


Atlas planet: Jordan type of a coherent nilpotent pair.


### Filtered-sheaf groupoids


Target `CB.2/filtered-sheaves` (definition); proposed name `TauCeti.CurveCounting.filtered_sheaves`.


For a finite tuple α=(α_1,…,α_s), Filt_α consists of flags 0=H_0⊂H_1⊂…⊂H_s=H with [H_i/H_{i−1}]=α_i, allowing equality for zero class. Filt_α^{≥0} restricts the total H to Coh^{≥0}, not every quotient to a semistability condition. Coh_α is the product ∏_i Coh_{α_i}.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/groupoid-mass`.


Source: S16 §3.2–3.3, pp.313–315.


Proof route:


1. Use the supplier abelian category and flag isomorphisms.

2. Define the graded-object functor and the full subcategory on a total-sheaf HN cutoff.


Check: A flag is not a Harder–Narasimhan filtration. Zero-length flags have the unique zero sheaf.


API:


- `filteredSheaf_graded` (projection): Send a flag to the ordered tuple of quotients H_i/H_{i−1}.

- `filteredSheaf_total` (projection): The total class is ∑α_i and is preserved by flag isomorphisms.

- `filteredSheaf_zeroStep` (equivalence): Deleting a zero graded step gives an equivalent groupoid with the same total-sheaf cutoff.


Unit tests:


- `one_step` (small): Filt_(α)≃Coh_α.

- `zero_step` (degenerate): A zero quotient forces H_i=H_{i−1}.

- `not_HN` (non-example): A flag of a decomposable bundle in increasing slope order is still a flag; no decreasing-slope axiom belongs in Filt.


Consumers: CB.2/jordan-fibres: The intermediate target controls the truncated nilpotent mass.; CB.3/flag-pairing: Hall products count these flags..


### Jordan grading functors


Target `CB.2/jordan-functors` (construction); proposed name `TauCeti.CurveCounting.jordan_functors`.


For (F,θ) of Jordan type α, set H=F/im θ and H_i=ker θ^i/(ker θ^i∩im θ)⊂H. The functor π′ maps to this flag, π″ takes its graded quotients, and π=π″∘π′ maps to Coh_α. The cutoff square Nil_α^{≥0}→Nil_α over Filt_α^{≥0}→Filt_α is cartesian.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/jordan-type`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/filtered-sheaves`.


Source: S16 §3.2, pp.313–314.


Proof route:


1. Identify the i-th graded quotient with the kernel quotient defining α_i.

2. Check intertwining isomorphisms preserve all terms.

3. Use quotient and extension closure of Coh^{≥0} to prove the cutoff equivalence.


Check: π′ records a full flag. A cutoff imposed independently on all graded pieces is not substituted.


API:


- `jordanProjection_comp` (compatibility): π equals π″ composed with π′ on objects and morphisms.

- `jordanProjection_grade` (compatibility): The i-th output has class α_i.

- `jordanProjection_cutoff` (characterisation): F∈Coh^{≥0} iff F/im θ∈Coh^{≥0}.


Unit tests:


- `zero_endomorphism` (small): θ=0 gives the one-step identity flag on F.

- `length_two` (small): A length-two block gives H_1=0,H_2=H.

- `truncated_cartesian` (compatibility): The inverse image of the total-H cutoff is exactly the total-F cutoff, including torsion objects.


Consumers: CB.2/jordan-fibres: Uses these functors and their homotopy fibres..


### Jordan fibre mass formula


Target `CB.2/jordan-fibres` (theorem); proposed name `TauCeti.CurveCounting.jordan_fibres`.


Write E(α,β)=(1−g)rr′+rd′−r′d and S(α,β)=E(α,β)+E(β,α). Set d=−∑_i(i−1)E(α_i,α_i)−∑_{i<j}iS(α_i,α_j), d″=−∑_{i<j}E(α_j,α_i), d′=d−d″. Every homotopy fibre of π,π′,π″ has respective mass q^d,q^{d′},q^{d″}. In particular mass(Nil_α^{≥0})=q^{d′}mass(Filt_α^{≥0}).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/jordan-functors`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/groupoid-mass`, `SchemeAndStackFoundations:SF.3`.


Source: S16 §3.2–3.3, Proposition 3.1, pp.313–315.


Proof route:


1. Build the nilpotent diagram from its last nonzero step by extension torsors.

2. At each stage the automorphisms and possible lifts contribute q^(dim Ext¹−dim Hom).

3. Apply Euler–Riemann–Roch and telescope to the displayed exponents; apply Fubini to the cutoff square.


Check: For a one-step type all three functors have fibre mass 1. The exponents retain the nonsymmetric Euler order.


Atlas planet: Jordan fibre mass formula.


Stage closure obligations: Discharge the exact supplier contracts from GlobalShtukasAndFunctionFieldLanglands:GS.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, QSeriesPartitionsAndMockModularForms:QM.0.


## CB.3 — Curve Hall algebra and flag integration


Construct the curve-specific completed Hall algebra, its exact-sequence product, extended coproduct and Green pairing. Fix quotient-left/subobject-right order, Euler powers and automorphism weights. Define characteristic functions and recover filtered-sheaf masses by pairing. Import Siegel and torsion-stack masses from their designated GS.0 owner.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.2`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `QSeriesPartitionsAndMockModularForms:QM.0`, `SchemeAndStackFoundations:SF.3`.


### Hall algebra of a curve


Target `CB.3/hall-algebra` (construction); proposed name `TauCeti.CurveCounting.hall_algebra`.


For each class α let H_α be all Q(v)-valued functions on coherent isomorphism classes, v²=q, and H_fin its finitely supported part. For f∈H_β,g∈H_α set (fg)(F)=v^{E(β,α)}∑_{A⊂F,[A]=α} f(F/A)g(A). Define Δ′h(B,A)=v^{E(β,α)}∑_{ξ∈Ext¹(B,A)}h(F_ξ)/#Hom(B,A). Adjoin k_γ,γ∈Z² with k_γ f k_−γ=v^{S(γ,α)}f for f∈H_α and Δh=∑_{β+α=[h]}Δ′_{β,α}(h)(k_α⊗1), Δk_γ=k_γ⊗k_γ. Products on completions are defined only with support conditions giving finite coefficients.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/groupoid-mass`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.3`.


Source: S16 §4.1, pp.315–316.


Proof route:


1. Push and pull along the groupoid of short exact sequences, using homotopy-fibre mass.

2. Identify the product with actual subobjects and the coproduct with extension classes divided by Hom.

3. Adjoin the numerical group algebra and prove the stated commutation relations.


Check: The left product input is the quotient. No unconditional product of arbitrary bilateral distributions is introduced.


API:


- `hallProduct_subobjects` (characterisation): The product coefficient is the displayed finite subobject sum whenever the support conditions hold.

- `hallProduct_assoc` (structure): Associativity follows from the two ways of forgetting a length-two flag; the zero sheaf is the unit.

- `hallCoproduct_extensions` (compatibility): The extension-groupoid formula agrees with Δ′, including the Hom denominator.

- `hallScalarExtension` (functoriality): Coefficient-ring extension preserves product, coproduct and group-like elements wherever both sides are defined.


Unit tests:


- `zero_unit` (degenerate): δ_0 f=f=f δ_0.

- `split_extension_weight` (small): If Ext¹(B,A)=0, Δ′δ_(A⊕B)(B,A)=v^{E(β,α)}/#Hom(B,A).

- `order_test` (non-example): Switching A and B changes E(β,α) to E(α,β); these exponents need not agree for unequal degrees.


Consumers: CB.4/eisenstein-series: Multiplies bundle and torsion characteristic series.; CB.3/flag-pairing: Converts ordered Hall products into flag masses..


Atlas planet: Hall algebra of a curve.


### Green bialgebra and Hopf pairing


Target `CB.3/green-pairing` (theorem); proposed name `TauCeti.CurveCounting.green_pairing`.


The extended curve Hall algebra with the specified graded completion is a bialgebra. On finite support, (f|g)=∑_[F] f(F)g(F)/#Aut(F); its compatibility is (fg|h)=(f⊗g|Δ′h), and the extended pairing uses the corresponding v-power on k_γ. Coproduct/product continuity is proved in the HN support completion, not an unqualified algebraic tensor product.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.3/hall-algebra`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.3`.


Source: S16 §4.1, p.316; HN10 §1.2–1.3, pp.2–3.


Proof route:


1. Compare two-step exact-sequence diagrams and their homotopy fibres; hereditary Coh(X) eliminates Ext².

2. Prove Green’s coefficient identity with the numerical Euler twist.

3. Verify pairing adjunction on delta functions and extend to the stated support domains.


Check: ⟨δ_F,δ_F⟩=1/#Aut(F). The hereditary assertion is for coherent sheaves on a smooth curve, not for all Higgs sheaves.


Atlas planet: Green bialgebra and Hopf pairing.


### Hall characteristic functions


Target `CB.3/characteristic-functions` (definition); proposed name `TauCeti.CurveCounting.characteristic_functions`.


Write 1_α,1_α^vec,1_α^{≥0},1_α^{<0} for the characteristic functions of all sheaves, bundles and the indicated total-HN cutoffs in class α; use superscripts together for intersections. The symbol 1_0 denotes δ_0. These may lie in the HN completion rather than H_fin. Pairing a cutoff characteristic with itself gives its groupoid mass.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.3/hall-algebra`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/green-pairing`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`.


Source: S16 §4.2, pp.315–316; §4.5, p.319.


Proof route:


1. Pull the characteristic predicates back to isomorphism classes.

2. Verify their support in each finite HN quotient and establish evaluation by delta functions.

3. Identify the pairing with the mass sum on its convergence domain.


Check: Bundle functions exclude positive-degree torsion. HN≥0 on a coherent sheaf allows torsion.


API:


- `characteristic_eval` (simp): Evaluation is 1 exactly on the named isomorphism-invariant subcategory and 0 outside it.

- `characteristic_pair_mass` (compatibility): The self-pairing equals the mass of that subgroupoid when finite or proved convergent.

- `characteristic_torsion_factor` (relation): For γ=(r,d), r>0, 1_γ=∑_{l≥0}v^{−rl}1^vec_(r,d−l)1_(0,l) in the HN completion.


Unit tests:


- `rank_zero` (small): 1_(0,d) is a torsion characteristic for d>0, and 1^vec_(0,d)=0.

- `empty_class` (degenerate): For rank 0 and degree <0, all these functions vanish.

- `torsion_factor_rank_two` (non-example): For r=2,l=1 the coefficient is v^−2; replacing it by v^−1 fails to cancel the Hall Euler twist.


Consumers: CB.4/eisenstein-series: Supplies coefficients of the generating series.; CB.3/flag-pairing: Uses total-HN characteristic functions in the last pairing..


### Hall expression for filtered masses


Target `CB.3/flag-pairing` (theorem); proposed name `TauCeti.CurveCounting.flag_pairing`.


For α=(α_1,…,α_s), mass(Filt_α^{≥0})=q^{−(1/2)∑_{i>j}E(α_i,α_j)}(1_{α_s}⋯1_{α_1}|1^{≥0}_{∑α_i}). The same formula applies to other total-HN cutoffs whose masses are finite.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/filtered-sheaves`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/characteristic-functions`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/green-pairing`.


Source: S16 §4.2, equation (4.1), p.316.


Proof route:


1. Expand the ordered Hall product by successive subobjects.

2. Compute its accumulated Euler exponent.

3. Pair with the total-HN characteristic and divide by automorphisms of the total sheaf.


Check: A one-step flag recovers the cutoff sheaf mass. The order α_s,…,α_1 is fixed.


### Curve stack mass interfaces


Target `CB.3/basic-masses` (comparison); proposed name `TauCeti.CurveCounting.basic_masses`.


Use GS.0 to obtain V_r=mass(Bun_{r,d})=q^{(g−1)(r²−1)}P_X(1)/(q−1)∏_{i=2}^r ζ_X(q^−i), independent of d, and ∑_{l≥0}mass(Coh_(0,l))s^l=exp(∑_{m≥1}#X(Fq^m)s^m/(m(q^m−1))). The latter equals ∏_{i≥1}ζ_X(q^−i s). For r>0, mass(Coh_(r,d))=q^{(g−1)(r²−1)}P_X(1)/(q−1)∏_{i≥2}ζ_X(q^−i). Set V_0=1 in series formulas; it is not the mass of all rank-zero coherent objects.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/characteristic-functions`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §4.2, Theorem 4.1, pp.316–317; Appendix A, p.356.


Proof route:


1. Invoke the separately routed Siegel and torsion mass theorems from GS.0, with their exact normalization requested below.

2. Combine the torsion splitting with the product formula for the coherent mass.

3. Prove real convergence at q>1 before using infinite products; treat formal s-coefficients through the tower formula.


Check: V_1=P_X(1)/(q−1). An infinite numerical zeta product is not silently treated as an element of K_g.


Stage closure obligations: Discharge the exact supplier contracts from GlobalShtukasAndFunctionFieldLanglands:GS.0, SchemeAndStackFoundations:SF.3, QSeriesPartitionsAndMockModularForms:QM.0.


## CB.4 — Eisenstein series and universal spherical form


Define bundle, coherent and truncated Eisenstein series with their regional expansions. Prove Hecke commutation, coproduct, residue and HN identities. Construct the spherical subalgebra and its generic coefficient form, then descend flag, Jordan and truncated count formulas to K_g. Density supplies uniqueness; square-root normalization descent is an explicit proof obligation.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `LefschetzPencilsAndVanishingCycles:LPV.5`, `QSeriesPartitionsAndMockModularForms:QM.0`.


### Curve Eisenstein series


Target `CB.4/eisenstein-series` (definition); proposed name `TauCeti.CurveCounting.eisenstein_series`.


Set E_r(z)=∑_{d∈Z}1_(r,d)z^d and E_r^vec(z)=∑_d1^vec_(r,d)z^d for r>0. Set E_0(z)=1+∑_{l>0}1_(0,l)z^l and E_0^vec(z)=1. A superscript ≥0 or <0 restricts the total sheaf by HN slopes. The positive-rank untruncated series are bilateral distributions; rational identities mean identities after evaluation with the specified regional expansions. They are not all elements of one Laurent-series field.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.3/characteristic-functions`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/basic-masses`.


Source: S16 §4.3, pp.317–318; §4.4, p.319.


Proof route:


1. Package homogeneous characteristic coefficients as formal distributions.

2. For products specify coefficientwise finite HN restrictions, or evaluate on one fixed sheaf to obtain a rational expression.

3. Use torsion-factor normalization to get E_r(z)=E_r^vec(z)E_0(q^{−r/2}z).


Check: The r=0 convention is separate. Every expansion states the order of its variables.


API:


- `eisenstein_coeff` (projection): The z^d coefficient is the named characteristic function in class (r,d).

- `eisenstein_torsion` (relation): E_r(z)=E_r^vec(z)E_0(q^{−r/2}z), for r≥0 in its valid support completion.

- `eisenstein_truncation` (compatibility): HN restriction of each coefficient gives the corresponding ≥0 or <0 series.


Unit tests:


- `rank_zero_unit` (degenerate): E_0^vec(z)=1, whereas E_0(z) has nonzero torsion coefficients.

- `rank_one_degree` (small): The coefficient of z^d in E_1^vec is the characteristic of Pic^d.

- `bilateral_not_laurent` (non-example): E_1^vec has arbitrarily negative degrees, so it is not declared to be a formal power series in z.


Consumers: CB.4/harder-identities: Appears in the Hall rational identities.; CB.5/pairing-series: Forms the two slots of the generating pairing..


Atlas planet: Curve Eisenstein series.


### Harder Hecke commutation


Target `CB.4/harder-hecke` (theorem); proposed name `TauCeti.CurveCounting.harder_hecke`.


With |z|≪|w| and r≥0, E_0(z)E_r^vec(w)=∏_{i=0}^{r−1}ζ_X(q^{−r/2+i}z/w) E_r^vec(w)E_0(z). The zeta factors are expanded at z/w=0.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/eisenstein-series`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/hall-algebra`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`.


Source: S16 §4.3, Theorem 4.2(ii), p.318.


Proof route:


1. Compute the torsion modification correspondence on bundles.

2. Factor by closed points and apply the local Hecke calculation.

3. Assemble the Euler product with the displayed rank-dependent q-shifts.


Check: r=0 has empty zeta product. For r=1 the shift is q^−1/2.


Atlas planet: Harder Hecke commutation.


### Harder Eisenstein coproduct


Target `CB.4/harder-coproduct` (theorem); proposed name `TauCeti.CurveCounting.harder_coproduct`.


For r=s+t, Δ′E_r(z)=∑_{s+t=r}q^{st(g−1)/2}E_s(q^{t/2}z)⊗E_t(q^{−s/2}z). For bundles replace the first factor by E_s^vec(q^{t/2}z)E_0(q^{(t−s)/2}z)E_0(q^{−(t+s)/2}z)⁻¹ and the second by E_t^vec(q^{−s/2}z). The sums include s=0,t=0 with the rank-zero conventions.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/eisenstein-series`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/green-pairing`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/harder-hecke`.


Source: S16 §4.3, Theorem 4.2(iii), p.318.


Proof route:


1. Expand Δ′ by extensions and apply the Euler form to fix q-powers.

2. For bundle factors remove the torsion factor using E_r=E_r^vec E_0 and its invertible constant term.

3. Check the first factor’s quotient placement against the chosen Hall order.


Check: r=0 gives group-like E_0. Terms with one rank zero retain the correct torsion ratio.


### Bundle Eisenstein residue presentation


Target `CB.4/bundle-residue` (theorem); proposed name `TauCeti.CurveCounting.bundle_residue`.


For r≥1, E_r^vec(q^{(1−r)/2}z_1)=q^{−(g−1)r(r−1)/4}V_1^{−r}V_r · rRes_(z_r/z_(r−1)=q⁻¹,…,z_2/z_1=q⁻¹)[E_1^vec(z_r)⋯E_1^vec(z_1)]. Here rRes is the coefficient of (1−z_i/(q⁻¹z_(i−1)))⁻¹, taken in descending variable order; it is not the usual differential residue.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/harder-coproduct`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/basic-masses`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/residue-conventions`.


Source: S16 §4.3, Theorem 4.2(iv), p.318; §1.3, p.303.


Proof route:


1. Use Harder’s rank-one Eisenstein residue theorem.

2. Normalize the coefficient by comparing the Green pairing with the known V_r.

3. Apply the fixed descending-variable normalized residues.


Check: r=1 is the identity, with constant 1. Do not move the residue to an opposite expansion region.


Atlas planet: Bundle Eisenstein residue presentation.


### HN relations for truncated Eisenstein series


Target `CB.4/hn-relations` (theorem); proposed name `TauCeti.CurveCounting.hn_relations`.


In the HN completion E_r(z)=∑_{s+t=r}q^{(g−1)st/2}E_s^{<0}(q^{t/2}z)E_t^{≥0}(q^{−s/2}z), and the same identity holds for the bundle series. Also E_r^{≥0}(z)=E_r^{vec,≥0}(z)E_0(q^{−r/2}z).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/eisenstein-series`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/hall-algebra`.


Source: S16 §4.4, equation (4.4), p.319.


Proof route:


1. Use the unique HN split into negative-slope quotient and nonnegative-slope subobject.

2. Evaluate its Hall Euler factor.

3. Separate the torsion piece of the nonnegative part.


Check: All torsion is in the ≥0 factor. The rank-zero bundle factor remains 1.


### Spherical curve Hall algebra


Target `CB.4/spherical-algebra` (definition); proposed name `TauCeti.CurveCounting.spherical_algebra`.


H_sph is the subalgebra of H_fin generated by 1^vec_(1,d),d∈Z, and 1_(0,l),l>0. Its extension includes all k_γ. Its HN completion is obtained using the same slope-bounded quotients as H. The word integral in an R_g-form concerns its coefficient ring; it does not assert every counting polynomial has integer monomial coefficients.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.3/hall-algebra`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/characteristic-functions`.


Source: S16 §4.5, pp.319–320; HN10 §1.3, p.3.


Proof route:


1. Take the generated subalgebra in the imported function space.

2. Restrict the Hall operations and specify the completion.

3. Use the HN membership theorem below rather than assume completed characteristic functions have finite support.


Check: Rank-one degree generators run over all integers. The full Hall algebra contains additional cuspidal data.


API:


- `spherical_inclusion` (coercion): The inclusion into H_fin is an injective algebra map compatible with the extended group algebra.

- `spherical_generated` (universal-property): An algebra map out of H_sph is determined by its values on the rank-one and torsion generators satisfying their Hall relations.

- `spherical_HN_completion` (compatibility): The closure is computed in the HN support topology, not by a degree-only completion.


Unit tests:


- `generator_rank_one` (small): Every line-bundle characteristic sum in one degree belongs to H_sph.

- `torsion_generator` (small): 1_(0,1) belongs to H_sph and is not a bundle generator.

- `completion_warning` (non-example): The full characteristic 1_(r,d) need not be finitely supported, so membership is asserted in the completed spherical space.


Consumers: CB.4/generic-form: Constructs a universal form with these generators.; CB.11/euler-hall-lie: Uses the corresponding spherical generators in the Euler-characteristic setting..


Atlas planet: Spherical curve Hall algebra.


### HN strata are spherical


Target `CB.4/hn-membership` (theorem); proposed name `TauCeti.CurveCounting.hn_membership`.


For every fixed HN type τ the finite-support characteristic 1_τ belongs to H_sph. Consequently the total ≥0 and <0 characteristics and fixed-class bundle characteristics belong to its HN completion.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/spherical-algebra`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/hn-relations`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/bundle-residue`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`.


Source: HN10 Theorem 3.1 and its proof, pp.5–8; Corollary 3.5, p.8; S16 §4.5, Theorem 4.3, p.319.


Proof route:


1. Apply the source’s induction on rank and HN polygon to recover semistable characteristics from rank-one generators.

2. Recover a fixed HN stratum by its ordered semistable Hall product.

3. Pass to HN-finite coefficient sums for the completed characteristics.


Check: For a fixed class and HN lower bound only finitely many HN types enter. Do not replace a type by a slope interval.


### Universal spherical Hall form


Target `CB.4/generic-form` (theorem); proposed name `TauCeti.CurveCounting.generic_form`.


There is a torsion-free generic spherical form generated by the rank-one, torsion and k_γ symbols, whose Hall multiplication and Green pairings are rational functions of the reciprocal Weil coordinates. After the Euler normalization is removed from scalar flag masses, these masses lie in K_g and specialize to the curve values. The standard v²=q normalization may first be constructed over R_g[v±1]; descent of the normalized scalar invariants to R_g and localization at only q^m−1 is part of this target, not an assumed square-root cancellation.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/spherical-algebra`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/hn-membership`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/harder-hecke`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/harder-coproduct`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`.


Source: S16 §4.5, Theorem 4.4, pp.319–320; §4.6, p.321; SV12 §1.11, preprint pp.13–14.


Proof route:


1. Use the shuffle presentation to construct the torus coefficient algebra and its torsion-free generated form.

2. Extend by the torsion Hecke algebra and numerical group algebra, preserving the pairing.

3. Descend the reciprocal-invariant scalar expressions and track every allowed denominator. The comparison between the torus form in SV and the invariant Hopf form quoted in S16 is gap G3.


Check: The specialization to a fixed curve is a surjection onto the spherical algebra, not onto the full Hall algebra. The scalar count must be independent of the chosen square root of q.


Atlas planet: Universal spherical Hall form.


### Universal truncated and bundle counts


Target `CB.4/universal-counts` (theorem); proposed name `TauCeti.CurveCounting.universal_counts`.


There are unique elements C_α(K_g) for the truncated coherent masses and N_α(K_g) for the truncated nilpotent masses, and A_{g,α}^{≥0}∈K_g, whose specializations are their named finite-field values. Their plethystic relation is Exp(∑_{α≠0}A_{g,α}^{≥0}u^r z^d/(q−1))=∑_α N_αu^r z^d. For r>0 eventual periodicity defines a unique A_{g,r,d}∈K_g specializing to A_X(r,d).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/generic-form`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/flag-pairing`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/jordan-fibres`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/nilpotent-exponential`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/large-degree`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/count-normalizations`, `QSeriesPartitionsAndMockModularForms:QM.0`, `LefschetzPencilsAndVanishingCycles:LPV.5`.


Source: S16 §4.5, Corollaries 4.5–4.6, pp.320–321; §4.6, p.321; Theorem 1.1, p.299.


Proof route:


1. Express every fixed-cutoff flag mass by spherical pairings and apply generic-form.

2. Sum finitely many Jordan types in each class and apply the plethystic logarithm coefficient recursion.

3. Use large-degree and tensor periodicity to remove the cutoff; use the universal-family density input G4 for uniqueness.


Check: Use density over a fixed odd residue characteristic and all finite extensions. Every coefficient sum is finite after the cutoff.


Atlas planet: Universal truncated and bundle counts.


Stage closure obligations: Verify primary-proof obligations G3: Invariant generic Hall form and pairing; G4: Universal curve monodromy and Weil density. Discharge the exact supplier contracts from GlobalShtukasAndFunctionFieldLanglands:GS.0, QSeriesPartitionsAndMockModularForms:QM.0, LefschetzPencilsAndVanishingCycles:LPV.5.


## CB.5 — Shuffle pairings and the Jordan sum


Introduce the G and Y pairing series with exact variable order and expansion regions. Separate the torsion factor, compute the bilateral series and rank-one shuffle functions, and pass to arbitrary ranks by block residues. Sum Jordan types coefficientwise and identify the Young-diagram product. No unrestricted multiplication of bilateral distributions is used. Define the normalized partition residue kernels here, before their Jordan-product and generating-identity uses.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `QSeriesPartitionsAndMockModularForms:QM.0`, `mathlib:YoungDiagram`, `mathlib:YoungDiagram.transpose`, `tauceti:YoungDiagram.armLength`, `tauceti:YoungDiagram.legLength`.


### Eisenstein pairing series


Target `CB.5/pairing-series` (definition); proposed name `TauCeti.CurveCounting.pairing_series`.


For a finite rank tuple r=(r_1,…,r_s) with n=∑r_i, define G_r^{≥0}(z_s,…,z_1;w)=(E_{r_s}(z_s)⋯E_{r_1}(z_1)|E_n^{≥0}(w)), and Y_r^*(z_s,…,z_1;w)=(E^vec_{r_s}(z_s)⋯E^vec_{r_1}(z_1)|E_n^*(w)), for *=empty,≥0,<0. Write r_<i=∑_{j<i}r_j,r_>i=∑_{j>i}r_j. The ≥0 rational function is expanded with z_1≫⋯≫z_s≫w⁻¹; the <0 expression has w large relative to all z_i⁻¹. Coefficients specify the degree in each slot, so this notation is a distribution where n>0 and *=empty.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.4/eisenstein-series`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/green-pairing`.


Source: S16 §5.1–5.2, pp.321–324.


Proof route:


1. Pair each graded coefficient using finite HN cutoffs.

2. Use the coproduct to establish rationality in the two specified regions.

3. Distinguish the source’s reversed tuple notation from the order of the z_i symbols.


Check: The leftmost Hall factor has index s. Zero ranks are allowed through the E_0 conventions.


API:


- `pairingSeries_coefficient` (projection): The z_1^{d_1}⋯z_s^{d_s}w^{∑d_i} coefficient is the named ordered Hall pairing.

- `pairingSeries_rankZero` (simp): A zero bundle rank slot contributes the unit and may be deleted from Y, while a coherent rank-zero slot contributes torsion in G.

- `pairingSeries_regions` (compatibility): The rational representative and its regional expansions agree coefficientwise with the defining pairing on the indicated domains.


Unit tests:


- `one_slot` (small): Y_(r)(z;w)=V_r∑_{d∈Z}(zw)^d for r>0.

- `zero_slot` (degenerate): Y_(0,r) and Y_(r) agree after forgetting the unused zero-rank variable.

- `order_discriminates` (non-example): For two unequal ranks reversing the Hall order also reverses the cross-term q-shifts; simply reversing the displayed tuple is invalid.


Consumers: CB.5/torsion-separation: Separates G from Y.; CB.5/jordan-sum: Substitutes weighted degree variables in G and Y..


Atlas planet: Eisenstein pairing series.


### Separation of the torsion factor


Target `CB.5/torsion-separation` (theorem); proposed name `TauCeti.CurveCounting.torsion_separation`.


With n=∑r_i and X=[1−∑α_j+q], set X_r(z;w)=Exp(X/(q−1)·[∑_i q^{−(n+r_i)/2}z_iw+∑_{i>j}(z_i/z_j)(q^{r_j/2}−q^{−r_j/2})q^{−r_i/2}]). Then G_r^{≥0}=X_r Y_r^{≥0} in the ordered expansion region; ev_X(X)=#X(k), and Adams on X gives #X(Fq^l).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/pairing-series`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/harder-hecke`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/harder-coproduct`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/basic-masses`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §5.1, Proposition 5.1 and proof, pp.321–323.


Proof route:


1. Insert E_r=E_r^vec E_0(q^−r/2 z) in the ordered product.

2. Commute all torsion factors to the right using the Hecke identity.

3. Pair them against E_n^{≥0}; collect cross terms and use the torsion mass exponential.


Check: The tuple and z variables keep their order. For one rank-one slot the first exponential argument has q⁻¹zw.


Atlas planet: Separation of the torsion factor.


### Untruncated bundle pairing


Target `CB.5/bilateral-pairing` (theorem); proposed name `TauCeti.CurveCounting.bilateral_pairing`.


For all r_i≥0, Y_r(z_s,…,z_1;w)=q^{(g−1)∑_{i>j}r_ir_j/2}(∏_i V_{r_i})∏_i ∑_{l∈Z}(z_iw q^{(r_<i−r_>i)/2})^l, deleting zero-rank bundle slots before interpreting their bilateral factor.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/pairing-series`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/harder-coproduct`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/basic-masses`.


Source: S16 §5.3, Lemma 5.2, p.324.


Proof route:


1. Iterate the coherent Eisenstein coproduct.

2. Pair each bundle factor using the degree-independent mass V_r.

3. Read the remaining coefficient constraints as separate bilateral delta distributions.


Check: The source formula’s unrestricted integer sum is used only for positive-rank slots. For s=1 recover V_r∑(zw)^l.


### Rank-one truncated shuffle formulas


Target `CB.5/rank-one-shuffle` (theorem); proposed name `TauCeti.CurveCounting.rank_one_shuffle`.


Let s≥1, Z=∏_{i<j}ζ̃(z_i/z_j) and C=q^{(g−1)s(s−1)/4}V_1^s/Z. Then Y_(1^s)^{≥0}=C·∑_{σ∈S_s}σ[Z/(∏_{i<s}(1−qz_(i+1)/z_i)·(1−q^{(1−s)/2}z_1w))]. For <0 the formula is (−1)^s C·∑_σ σ[Z/(∏_{i<s}(1−q⁻¹z_i/z_(i+1))·(1−q^{(s−1)/2}z_sw))]. ζ̃(t)=t^{1−g}ζ(t). The ≥0 and <0 functions are expanded in their respective regions.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/pairing-series`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/bilateral-pairing`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/hn-relations`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/expansion-separation`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`.


Source: S16 §5.4, Proposition 5.3, pp.325–331.


Proof route:


1. Induct on s using the HN convolution relation and the known untruncated distribution.

2. Compute each nontrivial split contribution by Hecke commutation.

3. Identify the rational positive and negative parts using expansion-separation and their pole bounds.


Check: At s=1 the positive function is V_1/(1−zw). The negative expression expands as V_1∑_{d<0}(zw)^d.


Atlas planet: Rank-one truncated shuffle formulas.


### Separation of regional expansions


Target `CB.5/expansion-separation` (lemma); proposed name `TauCeti.CurveCounting.expansion_separation`.


Let f_1,…,f_m be rational functions with denominators products of nonzero binomials in the degree variables, and let each be expanded in an admissible monomial order as a formal distribution. If the sum of these distributions is zero, then ∑_i f_i=0 as a rational function. Only multiplication of a distribution by a Laurent polynomial is required.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/pairing-series`.


Source: S16 §5.4, Lemma 5.4, pp.328–329.


Proof route:


1. Choose a common Laurent-polynomial denominator.

2. Multiplication clears each expansion to the same Laurent polynomial.

3. Inject Laurent polynomials into the distribution module and cancel the nonzero denominator in the rational function field.


Check: Two expansions of 1/(1−z) differ as distributions but have the same rational representative. No arbitrary product of distributions occurs.


### Arbitrary-rank block residue formula


Target `CB.5/block-residue-pairing` (theorem); proposed name `TauCeti.CurveCounting.block_residue_pairing`.


For r_i>0, n=∑r_i and a(r)=−(g−1)∑r_i(r_i−1)/4, let R_r take descending normalized residues inside each block z_j^(i)/z_(j−1)^(i)=q⁻¹, largest block first. Then Y_r^{≥0}(q^{(1−r_s)/2}z_1^(s),…,q^{(1−r_1)/2}z_1^(1);w)=q^{a(r)}V_1^{−n}(∏_iV_{r_i}) R_r[Y_(1^n)^{≥0}(z_n,…,z_1;w)]. Equivalently, after scaling each surviving variable by q^−1/2, the prefactor is q^{b(r)}∏V_{r_i}, b(r)=(g−1)∑_{i<j}r_ir_j/2, and the shuffle denominator’s final factor is 1−q^−n/2 z_1w. Zero-rank slots are deleted.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/rank-one-shuffle`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/bundle-residue`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/residue-conventions`.


Source: S16 §5.5, equations (5.14)–(5.15), pp.331–332.


Proof route:


1. Replace each higher-rank bundle series by its rank-one residue presentation.

2. Commute the finitely many formal residues with the valid pairing coefficients.

3. Collect the a(r) and rank-one prefactors to derive b(r) and the surviving-variable scaling.


Check: All r_i=1 recovers the rank-one formula. A single block of size two has prefactor q^{−(g−1)/2}V_2/V_1² in the first form.


Atlas planet: Arbitrary-rank block residue formula.


### Generic Jordan-type generating sum


Target `CB.5/jordan-sum` (definition); proposed name `TauCeti.CurveCounting.jordan_sum`.


A generic Jordan type is a finitely supported sequence r_i≥0, with weighted size |λ|=∑i i r_i and λ=(1^{r_1}2^{r_2}…). Define Ξ_r(z,T)=∑_{α:rank α_i=r_i} mass(Nil_α^{≥0}) z^{∑i i deg α_i}T^{∑i i r_i}, allowing additional rank-zero Jordan steps. Set e(r)=(g−1)[∑(i−1)r_i²+∑_{i<j}(2i−1/2)r_ir_j] and x_l=z^l q^{(r_>l−r_<l)/2}. The weight is the class of the underlying F, not its quotient F/im θ.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.2/jordan-type`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/jordan-fibres`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/pairing-series`, `mathlib:YoungDiagram`.


Source: S16 §5.6, equations (5.16)–(5.18), pp.331–333 (weighted exponent made explicit).


Proof route:


1. Identify finite rank multiplicities with the imported partitions.

2. Define the classwise finite coefficient sum and retain all possible torsion tails.

3. Use the flag-pairing expression to substitute x_l for degree variables.


Check: A size-two Jordan block contributes T². Rank-zero steps still change the degree exponent.


API:


- `genericJordan_partition` (equivalence): The weighted-size-r multiplicity sequences correspond bijectively to partitions of r, retaining internal zeros.

- `jordanSum_coeff` (projection): The coefficient of T^r z^d sums exactly nilpotent-pair masses of class (r,d) with the chosen generic type.

- `jordanSum_torsionTail` (compatibility): Truncating the number of Jordan steps stabilizes each fixed coefficient, because the total torsion degree bounds the extra nonzero rank-zero steps.


Unit tests:


- `empty_type` (degenerate): At rank zero Ξ_empty is the nontrivial torsion nilpotent series, not just 1.

- `size_two` (small): r_2=1,r_i=0 otherwise gives T² and not T.

- `degree_weight` (non-example): A nonzero degree in α_2 contributes twice that degree to the underlying sheaf class.


Consumers: CB.5/jordan-product: Computes the sum by a Young-diagram product.; CB.6/generating-identity: Sums over all partitions and cancels the torsion tail..


Atlas planet: Generic Jordan-type generating sum.


### Positive-arm plethystic product


Target `CB.5/positive-arm-product` (theorem); proposed name `TauCeti.CurveCounting.positive_arm_product`.


For λ=(1^{r_1}2^{r_2}…) and r_[i,j]=∑_{k=i}^j r_k, Exp(X/(q−1)·∑_{i,l≥1}q^{−r_[i,i+l]}(q^{r_(i+l)}−1)z^l)=∏_{s∈λ,arm(s)>0}ζ(q^{−1−leg(s)}z^{arm(s)}). The product excludes precisely the cells of arm length zero.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/jordan-sum`, `QSeriesPartitionsAndMockModularForms:QM.0`, `tauceti:YoungDiagram.armLength`, `tauceti:YoungDiagram.legLength`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`.


Source: S16 §5.6, Lemma 5.5, p.333.


Proof route:


1. Group the cells by their positive arm length and by the multiplicity blocks of their row lengths.

2. Telescope the powers of q for fixed arm length.

3. Apply ζ(t)=Exp(Xt) and additivity of Exp.


Check: For λ=(1^n) the product is empty and equals 1. For λ=(2) there is exactly one positive-arm cell.


### Jordan sum as a partition product


Target `CB.5/jordan-product` (theorem); proposed name `TauCeti.CurveCounting.jordan_product`.


For λ associated with r, Ξ_r=q^{(g−1)⟨λ,λ⟩}J_λ(z)H_λ(z) Exp(Xz/((q−1)(1−z)))T^{|λ|}, where ⟨λ,λ⟩=∑_j(λ′_j)²=∑_i i r_i²+2∑_{i<j}i r_ir_j. Before simplification Ξ_r=q^{e(r)}Exp(X/(q−1)[∑_{i,l≥1}q^{−r_[i,i+l]}(q^{r_(i+l)}−1)z^l+z/(1−z)])Y_r^{≥0}(x_s,…,x_1;1)T^{|λ|}.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/jordan-sum`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/torsion-separation`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/block-residue-pairing`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/positive-arm-product`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/partition-kernels`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/basic-masses`.


Source: S16 §5.6, equations (5.16)–(5.18), pp.332–333.


Proof route:


1. Apply the finite-step flag formula and torsion separation.

2. Take the coefficientwise-stable torsion-tail limit, producing z/(1−z).

3. Use the positive-arm identity, Siegel factors for zero-arm cells, and block residues to obtain J_λH_λ.


Check: The residual torsion exponential is independent of λ. Check the exponent with λ=(2) and λ=(1,1).


### Partition residue kernels


Target `CB.5/partition-kernels` (construction); proposed name `TauCeti.CurveCounting.partition_kernels`.


For λ=(1^{r_1}2^{r_2}…), n=∑r_i, set J_λ(z)=∏_{s∈λ}ζ*(q^{−1−leg(s)}z^{arm(s)}). Define ζ*(q⁻¹)=∏_j(1−α_j⁻¹)/(1−q⁻¹), ζ*(1)=∏_j(1−α_j)/(1−q), and ζ* equal to ζ at other specified monomials. With Z_n=∏_{i<j}ζ̃(z_i/z_j), L_n=Z_n⁻¹∑_{σ∈S_n}σ[Z_n/(∏_{i<n}(1−qz_(i+1)/z_i)(1−z_1))]. Take normalized residues along adjacent variables within each multiplicity block, starting from the largest indices, and substitute each surviving z_(1+r_<i)=z^i q^{−r_<i}; the result is H_λ(z). Define J_empty=H_empty=1. The symmetric sum is unaveraged.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.0/residue-conventions`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`, `FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality`, `tauceti:YoungDiagram.armLength`, `tauceti:YoungDiagram.legLength`, `mathlib:YoungDiagram.transpose`.


Source: S16 §1.3, equations (1.1)–(1.3), pp.303–304.


Proof route:


1. Use the baseline YoungDiagram arms and legs; enumerate multiplicities without replacing the carrier.

2. Form the rational shuffle kernel over the localization and apply ordered normalized residues.

3. Prove the specialization is well defined after taking residues, including vanished multiplicity blocks.


Check: n is the number of parts, not the partition size. The evaluation of a pole uses the specified regularization, not a partial function.


API:


- `partitionKernel_empty` (simp): For the empty diagram both kernels are 1.

- `partitionKernel_single` (simp): J_(1)=ζ*(q⁻¹)=q^{1−g}P(1)/(q−1), and H_(1)=1/(1−z), using paired reciprocal coordinates.

- `partitionKernel_baseChange` (functoriality): Coefficient specialization commutes with each rational operation and ordered residue wherever the indicated denominators specialize nontrivially.

- `partitionKernel_blocks` (compatibility): Zero multiplicity blocks introduce neither a variable nor a residue, and the surviving-variable substitution is unchanged.


Unit tests:


- `one_box` (small): For λ=(1), q^{g−1}J_(1)H_(1)=P(1)/((q−1)(1−z)); omitting q^{1−g} in J_(1) fails this test.

- `two_shapes` (non-example): λ=(2) has n=1 and no block residue; λ=(1,1) has n=2 and one block residue.

- `empty_kernel` (degenerate): The constant coefficient of the partition generating series is exactly 1, enabling Log.


Consumers: CB.5/jordan-product: Combines the complete box product with the shuffle-residue factor.; CB.6/explicit-count: Gives the computable universal answer..


Atlas planet: Partition residue kernels.


Stage closure obligations: Discharge the exact supplier contracts from QSeriesPartitionsAndMockModularForms:QM.0.


## CB.6 — Explicit residues and constant terms


Use normalized and ordinary residues separately, and the J_λ,L_n,H_λ kernels on the imported Young diagrams. Establish the universal generating identity and the periodic residue extraction theorem, including genus-zero and elliptic rank-two checks. Prove regularity at the coordinate origin before defining the constant term, then derive its companion partition formula and the first four values.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5`, `QSeriesPartitionsAndMockModularForms:QM.0`.


### Universal partition generating identity


Target `CB.6/generating-identity` (theorem); proposed name `TauCeti.CurveCounting.generating_identity`.


In K_g[[T,z]], Exp(∑_{r>0,d≥0} A_{g,r,d}^{≥0}T^rz^d/(q−1))=∑_λ q^{(g−1)⟨λ,λ⟩}J_λ(z)H_λ(z)T^{|λ|}, with each rational coefficient expanded at z=0. The rank-zero part of the coherent nilpotent series is Exp(Xz/((q−1)(1−z))) and cancels from both sides.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/jordan-product`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/nilpotent-exponential`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/universal-counts`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §5.7, equations (5.19)–(5.21), pp.333–334.


Proof route:


1. Sum the Jordan product over all partitions, coefficientwise.

2. Identify absolute indecomposable torsion sheaves over every extension field and cancel their exponential.

3. Use the universal coefficient specialization and density to obtain equality in K_g.


Check: The r=0 torsion identity is over every finite extension. At T¹ recover P(1)/(1−z).


Atlas planet: Universal partition generating identity.


### Eventually periodic residue extraction


Target `CB.6/residue-extraction` (theorem); proposed name `TauCeti.CurveCounting.residue_extraction`.


If a_d∈K, d≥0, is eventually r-periodic, r>0, and its eventual values are b_j for j mod r, then F(z)=∑a_dz^d=P(z)+∑_{j=0}^{r−1}b_j z^j/(1−z^r), with P polynomial. It has at most simple poles in μ_r, and b_d=−∑_{ξ∈μ_r}ξ^{−d}dRes_(z=ξ)(F(z)dz/z), computed after a cyclotomic extension and descending to K. For bundle counts a_d=A_{g,r,d}^{≥0} and b_d=A_{g,r,d}.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.0/residue-conventions`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/count-normalizations`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/large-degree`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/universal-counts`.


Source: S16 §5.8, equation (5.22), pp.334–335.


Proof route:


1. Remove the finite nonperiodic prefix to get the rational form.

2. Compute each simple differential residue as −∑_j b_j ξ^j/r.

3. Use finite Fourier orthogonality to recover b_d and Galois invariance to descend.


Check: For constant b the only pole is z=1 and its residue is −b. For r=2 opposite parity values produce a pole at −1 unless they coincide.


### Schiffmann partition residue formula


Target `CB.6/explicit-count` (theorem); proposed name `TauCeti.CurveCounting.explicit_count`.


Define A_{g,r}(z) by ∑_{r≥1}A_{g,r}(z)T^r=(q−1)Log(∑_λq^{(g−1)⟨λ,λ⟩}J_λ(z)H_λ(z)T^{|λ|}). For all d∈Z, A_{g,r,d}=−∑_{ξ∈μ_r}ξ^{−d}dRes_(z=ξ)(A_{g,r}(z)dz/z). Each coefficient has at most simple poles, all in μ_r. This is a finite algorithm in each rank.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.6/generating-identity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6/residue-extraction`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/partition-kernels`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §1.3, Theorem 1.6, p.304; §5.7–5.8, pp.333–335.


Proof route:


1. Apply Log to the universal generating identity.

2. Identify A_{g,r}(z) with the generating series of truncated counts.

3. Apply residue-extraction; finite rank bounds the partition sum and all Adams divisors.


Check: A_{g,1,d}=P(1). Mellit’s theorem below removes all poles at nontrivial roots of unity.


Atlas planet: Schiffmann partition residue formula.


### Rank-two universal check


Target `CB.6/rank-two-check` (theorem); proposed name `TauCeti.CurveCounting.rank_two_check`.


Put P=∏(1−α_i), U=∏(1−qα_i), V=∏(1+α_i), S=∑(1−α_i)⁻¹. The rank-two count is P[U/((q−1)(q²−1))−V/(4(1+q))+P/(2(q−1))(1/2−1/(q−1)−S)], independently of d; the displayed apparent α_i=1 poles cancel after multiplying by P². At g=0 it is 0; at g=1 it is P.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.6/explicit-count`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`.


Source: S16 §1.3, rank-two example, p.305; Appendix C, p.358.


Proof route:


1. Enumerate λ=(2),(1,1) in the partition formula.

2. Compute the T² logarithmic coefficient, including ψ_2 of the rank-one term.

3. Take its residues and simplify using α_iα_(paired i)=q.


Check: Use the pair (a,q/a) for the genus-one specialization, without treating the two coordinates as algebraically independent. Check g=0 symbolically before any finite-field substitution.


### Origin constant of the bundle invariant


Target `CB.6/origin-constant` (definition); proposed name `TauCeti.CurveCounting.origin_constant`.


Work in the paired-coordinate affine cone Q[q,α_1,…,α_(2g)]/(α_(2i−1)α_(2i)−q), with the origin q=α_i=0 and g≥1. The rational functions A_{g,r,d} from the partition formula extend regularly to that origin. Define A_{g,r,d}(0) by that local evaluation. This is not evaluation of an arbitrary element of K_g or of an arbitrary character Laurent polynomial at zero.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.6/explicit-count`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/partition-kernels`.


Source: S16 §5.9, proof of Corollary 1.9, pp.335–336.


Proof route:


1. Rewrite the complete q^{(g−1)⟨λ,λ⟩}J_λH_λ factors with denominators whose specialization in Q(z) is nonzero.

2. Track each permutation term after the ordered residues; all nonidentity contributions vanish at the origin.

3. Prove regularity survives the logarithmic coefficients and differential residue extraction.


Check: No algebra homomorphism K_g→Q sending units α_i to zero is claimed. Genus zero is evaluated by its separate count convention.


API:


- `count_origin_regular` (characterisation): The count belongs to the subring of rational functions regular at the affine-cone origin.

- `count_origin_representative` (compatibility): Any two regular rational representatives give the same value at the origin.

- `count_origin_degree` (compatibility): Degree periodicity and Mellit degree independence commute with this evaluation once regularity is established.


Unit tests:


- `rank_one_origin` (small): A_{g,1,d}(0)=1 for every g≥1.

- `laurent_nonexample` (non-example): q⁻¹ is a valid torus function but is not regular at the origin and has no origin constant.

- `paired_relation` (compatibility): α_1α_2 and q both specialize to zero, consistently with their relation.


Consumers: CB.6/constant-formula: Extracts explicit constant values.; CB.11/open-assertions: Uses constants only when the relevant regularity is proved or included in the conjecture..


Atlas planet: Origin constant of the bundle invariant.


### Constant-term partition formula


Target `CB.6/constant-formula` (theorem); proposed name `TauCeti.CurveCounting.constant_formula`.


For g≥1 set K_λ(z)=∏_i∏_{j=1}^{r_i}(1−z^−j)⁻¹ and define ∑_{r≥1}A^0_{g,r}(z)T^r=−Log(∑_λ z^{(g−1)⟨λ,λ⟩−length(λ)}K_λ(z)T^{|λ|}). Then A_{g,r,d}(0)=∑_{ξ∈μ_r}ξ^−d dRes_(z=ξ)(A^0_{g,r}(z)dz/z). For r=1,2,3,4 these values are 1,g,4·binom(g,2)+g,32·binom(g,3)+20·binom(g,2)+g. For fixed r the value is a polynomial in g of degree r−1 on g≥1.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.6/origin-constant`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6/residue-extraction`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §1.3, Corollary 1.9 and examples, pp.305–306; §5.9, pp.335–336.


Proof route:


1. Evaluate the regular partition factors at the origin and combine surviving binomial factors into K_λ.

2. Apply the logarithm with its minus sign; the count-extraction sign is now positive.

3. Enumerate partitions through rank four and bound the genus polynomial degree.


Check: The rank-three and rank-four expressions are constants, not full A-polynomials. For g=1 every displayed constant equals 1.


Atlas planet: Constant-term partition formula.


Stage closure obligations: Verify primary-proof obligations G9: Universal monomial positivity and origin evaluation. Discharge the exact supplier contracts from QSeriesPartitionsAndMockModularForms:QM.0.


## CB.7 — Canonical Higgs moduli and two-line charts


Import the canonical GL_r bundle Higgs carrier and existential good-line theorem from ET.2b. Specify the coherent and positive exact-category interfaces, the stable canonical coarse space and its proper Hitchin map. Import general bundles from current AlgebraicVectorBundles, and Quot geometry from R09.2. Construct the two-line framed charts, cotangent sequence and Kronecker embedding specific to this counting proof.


The stage requires `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`.


### Canonical Higgs sheaves and stability


Target `CB.7/canonical-higgs` (definition); proposed name `TauCeti.CurveCounting.canonical_higgs`.


A canonical Higgs sheaf is (F,θ:F→F⊗Ω_X), with morphisms commuting with θ. For rank r>0 its slope is d/r. It is semistable if every nonzero proper θ-invariant coherent subsheaf W has μ(W)≤μ(F), and stable if all such inequalities are strict, assigning torsion slope +∞. Saturated subsheaves suffice for bundles. Positive-rank semistable Higgs sheaves are bundles. This category has HN filtrations by Higgs subsheaves; its Ext groups are hypercohomology of the two-term Hom complex and need not vanish in degree 2. On locally free objects this reuses ET.2b/hitchin-moduli-stack for G=GL_r and D=Ω_X. Also define the full positive subcategory A_K^+ by μ_min(F)≥0, with the exact structure induced from coherent Higgs sheaves. Relative (semi)stability tests invariant subobjects belonging to A_K^+ (the quotient is then positive). It is not defined by intersecting the usual semistable locus with A_K^+. For g≥1 and d>binom(r,2)(2g−2), the relative and usual semistable moduli agree; outside that range no equality is asserted.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b/hitchin-moduli-stack`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b/schiffmann-boundedness`.


Source: S16 §6.2, pp.336–337; MS14 §1, p.2; §2.1, Theorem 2.1 and Corollaries 2.2–2.4, pp.3–4; §3, pp.5–7, especially Corollary 3.3, p.6.


Proof route:


1. Reuse the canonical GL_r bundle Higgs carrier from ET.2b; extend its interface to coherent sheaves and the HN-nonnegative exact subcategory without defining another bundle carrier.

2. Show the torsion subsheaf is invariant; it destabilizes every positive-rank object with torsion.

3. Establish bounded maximal Higgs slopes and the HN induction; compute the two-term deformation complex with the supplier coherent cohomology.

4. For a semistable Higgs bundle of rank s, consecutive underlying HN slopes differ by at most 2g−2. The binomial degree bound forces positivity; applying the same bound to a semistable destabilizer proves the converse comparison of the two stability conditions (MS14 Corollary 3.3).


Check: Do not require every underlying bundle to be semistable. The Higgs category is not asserted hereditary.


API:


- `higgs_forget` (projection): Forget θ to the upstream coherent category; kernels and cokernels carry induced Higgs fields.

- `higgs_stability_saturated` (characterisation): For a bundle it suffices to test saturated proper positive-rank invariant subsheaves.

- `higgs_coprime` (compatibility): For gcd(r,d)=1, Higgs semistability implies stability.

- `higgs_baseChange` (functoriality): Geometric (semi)stability is preserved and detected by field extension; the definition used for moduli is geometric.

- `higgs_morphism_ext` (extensionality): Two Higgs morphisms are equal when their underlying coherent maps agree; a coherent isomorphism lifts to a Higgs isomorphism exactly when it intertwines the two fields.

- `positiveHiggs_exact` (structure): A short exact coherent Higgs sequence with positive endpoints has positive middle object; positivity is preserved by quotients. Do not assert that every coherent subobject of a positive object is positive.

- `positiveHiggs_stability_comparison` (compatibility): For g≥1 and d>binom(r,2)(2g−2), the relative semistable positive moduli identify with the usual semistable Higgs moduli, compatibly with field extension.


Unit tests:


- `rank_one_higgs` (small): Every line bundle with any Ω-valued field is stable.

- `split_zero_field` (non-example): (L⊕L,0) is semistable of equal slope but not stable.

- `torsion_destabilizes` (non-example): A nonzero torsion summand in a positive-rank Higgs sheaf is invariant and violates semistability.

- `positive_not_subobject_closed` (non-example): On P¹, O(−1) injects into O² with quotient O(1). The middle object and quotient are positive but the subobject is not; for zero Higgs fields the induced exact category must not be treated as an abelian subcategory.

- `relative_test_domain` (non-example): The relative stability predicate quantifies only over invariant subobjects with μ_min≥0. A test with μ_min<0 belongs to the usual predicate but is excluded from the relative predicate, even when its average slope is positive.


Consumers: CB.7/higgs-moduli: Defines the stable moduli problem.; CB.8/king-slope: Compares the stability condition to framed quiver stability.; YuCountingPartII: Imports canonical stable Higgs spaces from this owner..


Atlas planet: Canonical Higgs sheaves and stability.


### Serre-dual Higgs criterion


Target `CB.7/serre-higgs` (comparison); proposed name `TauCeti.CurveCounting.serre_higgs`.


For coherent V,W on the smooth projective curve, Ext¹(V,W)*≃Hom(W,V⊗Ω_X), naturally. For a subsheaf W⊂V, write a:Ext¹(V,V)*→Ext¹(V,W)* and b:Ext¹(W,W)*→Ext¹(V,W)* for the dual restriction and pushout maps. A functional ν corresponds to a Higgs field preserving W iff a(ν)∈im b.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/canonical-higgs`, `SchemeAndStackFoundations:SF.3`.


Source: S16 §6.2, equation (6.1), p.337.


Proof route:


1. Import Serre duality in its natural coherent form, not an isomorphism chosen separately for each pair.

2. Identify the two maps with restriction and the inclusion of W⊗Ω in V⊗Ω.

3. Read preservation as factorization.


Check: For W=0 the criterion is automatic. For W=V it is automatic, but stability tests exclude that case.


### Stable canonical Higgs moduli


Target `CB.7/higgs-moduli` (construction); proposed name `TauCeti.CurveCounting.higgs_moduli`.


For g≥1,r>0,gcd(r,d)=1, construct the finite-type stable Higgs stack and its coarse smooth geometrically connected quasiprojective scheme H_(r,d), of dimension 2D, D=1+(g−1)r². The stack is a G_m-gerbe over H and has stable-locus dimension 2D−1. Construct h:H→⊕_{i=1}^r H⁰(X,Ω_X^i) by characteristic coefficients and prove it proper. Its zero fibre Λ is projective Lagrangian of pure dimension D. For g=0 use H_(1,d)=A⁰ and H_(r,d)=empty for r>1 in coprime classes.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/canonical-higgs`, `SchemeAndStackFoundations:SF.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`.


Source: S16 §6.2, p.337; §6.10–6.11, pp.349–352.


Proof route:


1. Construct the stable quotient by a framed Quot chart and the specified GIT supplier contract.

2. Compute the tangent-obstruction complex; scalar automorphisms and their dual obstruction yield the smooth coarse dimension 2D.

3. Use the Hitchin properness and nilpotent-Lagrangian theorems with canonical twist. Their primary-proof verification is gap G6, not implied by ET.2b’s positive twist.


Check: Rank one is Pic^d(X)×H⁰(Ω_X). The stable stack is not a scheme and its dimension differs by one from the coarse space.


API:


- `higgsCoarse_universal` (universal-property): The coarse map is universal to algebraic spaces and identifies geometric points with stable Higgs isomorphism classes.

- `higgsScalarGerbe` (compatibility): The stabilizer is exactly G_m; over a finite field the rational-point fibre is neutral, so stack mass is #H(k)/(q−1).

- `hitchin_scaling` (functoriality): Under θ↦tθ, the i-th Hitchin coefficient scales by t^i.

- `nilpotentCone_fibre` (characterisation): Λ=h⁻¹(0) consists precisely of Higgs fields nilpotent under iterated Ω-twisted composition.


Unit tests:


- `rank_one_geometry` (small): H_(1,d)=Pic^d×A^g, D=g, and Λ=Pic^d.

- `gerbe_mass` (non-example): For a rational stable Higgs object the stack weight is 1/(q−1), whereas its coarse point counts as 1.

- `weighted_hitchin` (compatibility): For rank two, trace scales with weight 1 and determinant with weight 2; the whole Hitchin base does not have weight 1.


Consumers: CB.8/deformation-family: Identifies the zero fibre with this coarse scheme.; CB.9/nilpotent-cone: Uses properness, Lagrangian dimension and the weighted scaling action..


Atlas planet: Stable canonical Higgs moduli.


### Two-line framed Quot chart


Target `CB.7/two-line-chart` (construction); proposed name `TauCeti.CurveCounting.two_line_chart`.


Choose L_i of degree −d_i with the good-line properties of S16 Lemma 6.1, l_i=χ(L_i,F)=(1−g+d_i)r+d>0 and V_i=k^{l_i}. In Quot((L_1⊗V_1)⊕(L_2⊗V_2),(r,d)), let Q°° be the open on which both restricted maps L_i⊗V_i→F are epimorphisms and both frame maps V_i→Hom(L_i,F) are isomorphisms. This explicitly imposes strong generation; frame isomorphisms alone do not imply surjective evaluation. It is smooth; Q°°→Q°_(L1) is a principal GL(V_2)-bundle. With G=GL(V_1)×GL(V_2), [Q°°/G] is the open coherent stack of sheaves strongly generated by L_1. The good-line kernel bound is used only for epimorphisms from L_1^{⊕l_1}, a fixed source rank.


Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.1`.


Source: S16 §6.3–6.4, pp.337–339, especially Lemma 6.1 and the framed Quot opens.


Proof route:


1. Import strong generation as Ext¹(L,F)=0 plus surjective evaluation, and the routed good-line theorem.

2. Use cohomology-and-base-change to make the frame-isomorphism condition open.

3. Identify fibres of forgetting the second frame with GL(V_2) and use the Quot tangent and obstruction groups to prove smoothness.


Check: A good-line source with unrestricted frame dimension is not asserted uniformly bounded. The smoothness statement is for Q°°, not the entire projective Quot scheme.


API:


- `twoLineChart_forgetFrame` (projection): Forgetting the second frame gives the stated principal GL(V_2)-bundle.

- `twoLineChart_quotient` (equivalence): The quotient groupoid over every test scheme is the strongly L_1-generated sheaf groupoid, with descent respected.

- `twoLineChart_tangent` (compatibility): At φ the Quot tangent space is Hom(kerφ,F), with the imported scheme tangent identification.


Unit tests:


- `frame_change` (small): Changing either chosen basis changes the chart point but not the sheaf in [Q°°/G].

- `missing_generation` (non-example): A quotient with a nonisomorphic frame map lies outside Q°° even when the combined quotient is surjective.

- `fixed_kernel_rank` (compatibility): The kernel has rank l_1−r and degree −d_1l_1−d for the one-line presentation; allowing arbitrary larger V would change this bound.


Consumers: CB.7/cotangent-moment: Provides the smooth presentation for the Higgs cotangent construction.; CB.7/kronecker-chart: Provides the two vector spaces and frame action..


Atlas planet: Two-line framed Quot chart.


### Cotangent sequence and Higgs zero level


Target `CB.7/cotangent-moment` (theorem); proposed name `TauCeti.CurveCounting.cotangent_moment`.


At φ in Q°°, with L=(L_1⊗V_1)⊕(L_2⊗V_2), the dual tangent sequence is 0→Ext¹(F,F)*→Hom(kerφ,F)*→Hom(L,F)*→End(F)*→0. Dualizing the infinitesimal G-action defines μ:T*Q°°→g*, and [μ⁻¹(0)/G] identifies with the canonical Higgs stack on the strongly generated coherent open.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/two-line-chart`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/serre-higgs`, `SchemeAndStackFoundations:SF.4`.


Source: S16 §6.4, equation (6.2), p.340; §6.6, equation (6.3), p.341.


Proof route:


1. Apply Hom(−,F) to the universal quotient and use strong-generation Ext vanishing.

2. Dualize the finite-dimensional exact sequence and identify the infinitesimal frame action.

3. Use Serre duality to identify the moment-map zero fibre with Higgs fields, naturally in families.


Check: The map μ includes the chosen tangent/frame map, not an arbitrary map of cotangent fibres. The zero-level quotient retains scalar stabilizers.


### Kronecker chart and doubled moment map


Target `CB.7/kronecker-chart` (construction); proposed name `TauCeti.CurveCounting.kronecker_chart`.


Let H=Hom(L_2,L_1), h=dim H and E=Hom(V_1⊗H,V_2). The two-line chart has the equivariant composition map j into E, induced by Hom(L_1,F)⊗Hom(L_2,L_1)→Hom(L_2,F). Let P be the closure of its specified locally closed image; the generated/frame locus is a smooth open of P. On T*E choose coordinates x_a:V_1→V_2,y_a:V_2→V_1, a=1,…,h, and moment map μ(x,y)=(∑y_ax_a,−∑x_ay_a). On T*P the cotangent class is taken modulo the conormal relation. μ always lies in ann(k·(Id,Id))⊂g*.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/two-line-chart`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/cotangent-moment`, `AlgebraicModuliForArithmeticGeometry:R09.2`.


Source: S16 §6.6–6.7, pp.341–344.


Proof route:


1. Realize the Quot chart as the prescribed locally closed Kronecker locus using strong generation of kernels.

2. Pass to the closure and identify its smooth open; do not replace P by all of E.

3. Use the trace pairing to compute the doubled-quiver moment map and show it kills diagonal scalars.


Check: The moment-map signs come from a fixed cotangent symplectic convention. A representative y in T*E is not unique for a point of T*P.


API:


- `kroneckerChart_composition` (characterisation): The a-th arrow is the Hom-composition map associated with the a-th basis vector of H.

- `doubledMoment_equivariant` (functoriality): μ(g·(x,y))=Ad_g*μ(x,y), and μ(t·y)=tμ(x,y).

- `doubledMoment_trace` (compatibility): Tr(μ_1)+Tr(μ_2)=0; thus the natural target is (Lie(G/G_m))*.

- `cotangent_representative` (compatibility): Changing a lift by the conormal subspace does not change the moment functional or its induced stability inequalities.


Unit tests:


- `one_arrow_scalars` (small): If V_1=V_2=k,h=1, μ(x,y)=(xy,−xy).

- `zero_cotangent` (degenerate): All y_a=0 gives μ=0, regardless of x.

- `trace_target` (non-example): A functional with total scalar trace nonzero cannot occur as μ; submersivity onto all g* is impossible.


Consumers: CB.8/moment-indecomposable: Tests the central line through λ.; CB.8/king-stability: Reads invariant subrepresentations on the doubled chart..


Atlas planet: Kronecker chart and doubled moment map.


Stage closure obligations: Verify primary-proof obligations G6: Canonical Higgs moduli and tight quiver comparison. Discharge the exact supplier contracts from GlobalShtukasAndFunctionFieldLanglands:GS.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.4, AlgebraicModuliForArithmeticGeometry:R09.2, EndoscopicTransferAndUnitaryTraceComparison:ET.2b, AlgebraicModuliForArithmeticGeometry:R09.5.


## CB.8 — Central deformation and stable Higgs counts


Choose an explicit safe pair of framing dimensions, fix λ and King’s character, prove the moment-map indecomposability criterion and the stability comparison, and form the central-line GIT quotient. Prove smoothness, contraction and equality of zero/nonzero fibre point counts, yielding Schiffmann’s characteristic-bounded theorem. Add the Mozgovoy–Schiffmann Hall-integration route for the all-characteristic coprime count, with relative positive-category semistability distinguished from usual semistability and genus zero handled separately.


The stage requires `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `FunctionFieldArithmetic:FA.5/schmidt-degree-one`, `QSeriesPartitionsAndMockModularForms:QM.0`, `ReductiveGroupsPartII:RG2.3/lang-theorem`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.


### Framing dimensions and characteristic cutoff


Target `CB.8/framing-cutoff` (construction); proposed name `TauCeti.CurveCounting.framing_cutoff`.


For g≥1, r>0, gcd(r,d)=1 put l=2g−2 and B=d/r−(r−1)l. Choose the least integer d_1≥0 with d_1>2g−1−B and (1−g+d_1)r+d>0. Set l_1=(1−g+d_1)r+d. Choose the least integer d_2≥max(d_1+2g,2g+d+(r+1)d_1,0) with d_2−d_1≡1 mod l_1, and set l_2=(1−g+d_2)r+d. Degree −d_i line bundles from the degree-one divisor satisfy the requested good-line conditions. Then l_i>0,gcd(l_1,l_2)=1. Define C(g,r,d)=l_1l_2; p>C is a safe sufficient characteristic bound for the central deformation.


Prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `SchemeAndStackFoundations:SF.3`, `FunctionFieldArithmetic:FA.5/schmidt-degree-one`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/large-degree`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/canonical-higgs`.


Source: S16 §6.1, p.336; §6.3, Lemma 6.1, pp.338–339; §6.5, pp.340–341; §6.7, p.344; explicit sufficient bound derived here.


Proof route:


1. For an indecomposable bundle or semistable canonical Higgs bundle, the adjacent HN gaps are ≤l=2g−2, so μ_min≥μ−(r−1)l≥B. A positive-rank semistable destabilizer has rank s≤r and slope>d/r, hence the same bound B. Every torsion sheaf is strongly generated by any line: its H¹ vanishes and its evaluation is surjective.

2. Use the requested degree-only criterion μ_min(F)+d_i>2g−1 for strong generation. For a nonzero kernel K of L1^{l1}↠F, let t=rk K=l1−r. Since μ_max(K)≤−d1 and deg K=−l1d1−d, μ_min(K)≥deg K−(t−1)μ_max(K)≥−d−(r+1)d1. If t=0, K is the zero bundle and is strongly generated.

3. The bound on d2 is strictly stronger than the generation threshold for these kernels and for L1. The congruence gives l2≡r mod l1, while l1≡d mod r, so gcd(l1,l2)=1. Every nonzero proper bounded dimension vector has nonzero integer determinant, of absolute value at most l1l2; characteristic p>l1l2 preserves nonvanishing.


Check: The cutoff depends on g as well as r,d. The explicit degree inequalities are verified by the displayed slope and fixed-source kernel argument, relative to the requested generation criterion; Lemma 6.1 supplies existence rather than this numerical recipe. The proof includes torsion destabilizers, zero kernels and l1=1. For g=2,r=2,d=1 the choice is d1=5,l1=9,d2=24,l2=47,C=423.


API:


- `framing_positive_coprime` (compatibility): The chosen l_1,l_2 are positive and coprime.

- `framing_goodLines` (compatibility): Every degree −d_i line with these bounds has the strong-generation properties stated in two-line-chart.

- `framing_characteristic` (characterisation): If p>l_1l_2, then for 0≤a_i≤l_i, (a_1,a_2) neither zero nor full, the integer l_2a_1−l_1a_2 is nonzero in k.


Unit tests:


- `coprime_dimension` (small): l_2≡r mod l_1 forces gcd(l_1,l_2)=1, including l_1=1.

- `excluded_vectors` (non-example): The zero and full dimension vectors have determinant zero and must be excluded.

- `bound_not_necessary` (compatibility): The theorem uses p>C as sufficient; a smaller p may also work when none of the proper determinants vanish.


Consumers: CB.8/moment-indecomposable: Ensures λ pairs nontrivially with every proper idempotent.; CB.8/king-stability: Separates stable from strictly semistable dimension vectors..


### King character and slope determinant


Target `CB.8/king-stability` (definition); proposed name `TauCeti.CurveCounting.king_stability`.


For G=GL(V_1)×GL(V_2) use γ(g_1,g_2)=det(g_1)^{l_2}det(g_2)^{−l_1} and λ(u_1,u_2)=l_2Tr(u_1)−l_1Tr(u_2). Define δ(a_1,a_2)=l_1a_2−l_2a_1. King semistability on the doubled Kronecker chart means δ(dimW_1,dimW_2)≥0 for every nonzero proper invariant pair W_i; stability means >0. On T*P use the induced representation criterion modulo conormal lifts and the GIT linearization with this exact sign.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/kronecker-chart`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/framing-cutoff`, `AlgebraicModuliForArithmeticGeometry:R09.5`.


Source: S16 §6.7, Lemma 6.3, pp.343–344.


Proof route:


1. Apply the specified character-linearized affine GIT supplier theorem and Hilbert–Mumford criterion.

2. Identify one-parameter subgroups with invariant flags and compute their γ-weight.

3. Fix the sign by comparing with the sheaf-slope determinant in king-slope.


Check: γ is trivial on diagonal scalars. The character sign is not determined by an unspecified convention.


API:


- `kingWeight_add` (structure): δ is additive in the dimension vector.

- `kingWeight_slope` (compatibility): For a strongly generated sheaf W of rank r′ and degree d′, δ(χ(L_1,W),χ(L_2,W))=(d_2−d_1)(dr′−rd′).

- `king_coprime` (characterisation): For positive coprime l_i, no nonzero proper dimension vector has δ=0; hence semistable equals stable in the source’s valid GIT setting.


Unit tests:


- `full_vector` (degenerate): δ(l_1,l_2)=0, and stability excludes the whole representation.

- `destabilizing_slope` (non-example): If d′/r′>d/r and d_2>d_1, then δ for its section vector is negative.

- `proper_vector` (small): For (l_1,l_2)=(2,3), δ(1,1)=−1 and δ(1,2)=1.


Consumers: CB.8/king-slope: Uses the exact determinant identity to identify stability.; CB.8/deformation-family: Chooses the stable GIT locus in the central moment level..


Atlas planet: King character and slope determinant.


### Moment-map criterion for indecomposability


Target `CB.8/moment-indecomposable` (theorem); proposed name `TauCeti.CurveCounting.moment_indecomposable`.


Assume p>C(g,r,d). For a framed F∈Q°° of class (r,d), λ lies in the image of the linear cotangent moment map μ_φ iff F is indecomposable. If so μ_φ⁻¹(λ) is a torsor under Ext¹(F,F)* and has q^{dim Ext¹(F,F)} rational points over F_q.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/cotangent-moment`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/king-stability`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/coprime-absolute`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/framing-cutoff`.


Source: S16 §6.5, Lemma 6.2, pp.340–341.


Proof route:


1. The cotangent exact sequence says λ belongs to the image iff it vanishes on End(F).

2. For indecomposable F, write every endomorphism as scalar plus nilpotent; both have zero λ-trace.

3. For a proper direct summand, its projector has λ-value l_2a_1−l_1a_2, nonzero by the characteristic bound. The fibre is an affine translate of the kernel.


Check: End(F)/rad=k is enough; End(F)=k is not assumed. The fibre count is a count of a nonempty affine torsor over the finite field.


Atlas planet: Moment-map criterion for indecomposability.


### Semistable points lie in the framed smooth open


Target `CB.8/smooth-locus` (theorem); proposed name `TauCeti.CurveCounting.smooth_locus`.


Every γ-semistable point in the central-line locus μ⁻¹(kλ)⊂T*P lies in the cotangent chart T*Q°°. The induced G/G_m action is free there, and the moment map on that chart is submersive onto (Lie(G/G_m))*, the annihilator of diagonal scalars.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.8/king-stability`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/kronecker-chart`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/framing-cutoff`.


Source: S16 §6.7, Lemma 6.4 and Lemma 6.5, pp.344–345 (correct moment target).


Proof route:


1. Test the subrepresentation generated by all images of x and the common kernel of x; King inequalities force generation and injectivity of the frame maps.

2. Use the stability criterion to identify automorphisms with scalars.

3. The cotangent derivative is dual to the injective infinitesimal projective-group action, giving smoothness onto the effective dual Lie algebra.


Check: The entire closure P is not declared smooth. Submersivity onto g* is not asserted.


### Higgs stability versus quiver stability


Target `CB.8/king-slope` (theorem); proposed name `TauCeti.CurveCounting.king_slope`.


For a canonical Higgs field in the zero moment level, Higgs stability of (F,θ) is equivalent to γ-stability of its framed cotangent point. A Higgs destabilizer strongly generated by both L_i gives a destabilizing invariant pair. Conversely every destabilizing invariant pair is dominated by a tight pair arising from an actual invariant coherent subsheaf; its slope violates stability.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.8/king-stability`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/serre-higgs`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/two-line-chart`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`.


Source: S16 §6.8, Lemmas 6.7–6.8 and proof of Proposition 6.6, pp.346–348.


Proof route:


1. Use natural Serre duality to translate preservation of a subsheaf to the cotangent-invariant pair.

2. Compute δ=(d_2−d_1)(dr′−rd′) on section spaces.

3. Use the tight-subrepresentation comparison of Álvarez-Cónsul–King, Lemma 5.5, and the good-line destabilizer property. The primary proof and exact tightness hypotheses are gap G6.


Check: An arbitrary subrepresentation is not simply declared equal to the section spaces of its image sheaf. Check both implications of the stability equivalence.


### Central-line Higgs deformation


Target `CB.8/deformation-family` (construction); proposed name `TauCeti.CurveCounting.deformation_family`.


Restrict the equivariant moment map to the central line kλ before taking a quotient. Define Y=μ⁻¹(kλ)^{γ-ss}//G with f:Y→A¹ given by μ=tλ. It is a smooth family with geometric quotient by G/G_m, Y_0≃H_(r,d), and every nonzero fibre parametrizes framed indecomposable bundles with a cotangent point mapping to tλ. Cotangent scaling gives t·Y_s≃Y_(ts), hence Y minus Y_0≃Y_1×G_m. A general coadjoint-equivariant map on all T*P does not descend to g* through a G-quotient.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.8/smooth-locus`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/moment-indecomposable`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/king-slope`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/higgs-moduli`, `AlgebraicModuliForArithmeticGeometry:R09.5`.


Source: S16 §6.7–6.9, Lemma 6.5, Proposition 6.6 and Proposition 6.9, pp.345–348.


Proof route:


1. Use affine character GIT on the invariant central-level subscheme, where the moment value is fixed by G.

2. Apply the effective moment-map smoothness and projective-group freeness.

3. Identify Y_0 by king-slope and the stable coarse universal property; trivialize nonzero fibres by cotangent scaling.


Check: The central restriction precedes the quotient. The scalar subgroup is removed in the geometric quotient, and gerbe weights are restored in point counting.


API:


- `deformation_zero` (equivalence): Y_0 identifies with the stable canonical Higgs coarse space, respecting its rational points.

- `deformation_nonzero` (equivalence): The map Y_1×G_m→f⁻¹(G_m), (y,t)↦t·y, is an isomorphism over G_m.

- `deformation_smooth` (structure): f is smooth with relative dimension 2D on the stated characteristic range.

- `deformation_contracting` (compatibility): The action has proper limit locus and a projective fixed locus, as established by the GIT-to-affine-quotient map.


Unit tests:


- `rank_one_fibres` (small): The count of every fibre is q^g#Pic⁰_X(k).

- `central_only` (non-example): A noncentral μ-value is moved by the coadjoint action and does not define a coordinate on the GIT quotient.

- `nonzero_scaling` (compatibility): For t≠0 the inverse of the nonzero-fibre trivialization scales the cotangent coordinate by t⁻¹.


Consumers: CB.8/deformation-count: Uses contraction and the nonzero trivialization to compare point counts..


Atlas planet: Central-line Higgs deformation.


### Białynicki–Birula deformation comparison


Target `CB.8/bb-deformation` (theorem); proposed name `TauCeti.CurveCounting.bb_deformation`.


Let f:Y→A¹ be the preceding smooth quasiprojective G_m-equivariant family, with f(t·y)=t f(y), a projective fixed locus, limits as t→0 for all geometric points, and an equivariant projective morphism to an affine scheme with positive weights. The BB–Hesselink strata are affine bundles of ranks n_i over smooth projective fixed components Z_i; the zero-fibre strata have ranks n_i−1 over the same Z_i. Over every finite extension k′/k, #Y(k′)=#k′·#Y_0(k′). Together with the nonzero-fibre trivialization this gives #Y_1(k′)=#Y_0(k′).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.8/deformation-family`, `SchemeAndStackFoundations:SF.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`.


Source: S16 §6.9, Proposition 6.9 and proof following it, pp.348–349.


Proof route:


1. Use the GIT projective map to the affine quotient to prove existence and properness of limits.

2. Apply the smooth quasiprojective BB–Hesselink theorem with all strata defined over the base field, grouping Galois orbits of fixed components when necessary.

3. The weight-one smooth base direction lowers each positive rank by one on Y_0. Count affine fibres and combine #Y=#Y_0+(Q−1)#Y_1. Primary BB source closure is G5.


Check: Contraction by itself without the projectivity/limit hypotheses is insufficient. The identity holds over all finite extensions, not just k.


Atlas planet: Białynicki–Birula deformation comparison.


### Stable Higgs point count


Target `CB.8/stable-higgs-count` (theorem); proposed name `TauCeti.CurveCounting.stable_higgs_count`.


For g≥1,r>0,gcd(r,d)=1 and p>C(g,r,d), #H_(r,d)(F_q)=q^D A_X(r,d), D=1+(g−1)r². The same equation holds after every finite extension. Genus zero is handled directly: rank one has both counts 1, and higher-rank stable and absolute-indecomposable loci are empty.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.8/bb-deformation`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/moment-indecomposable`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/coprime-absolute`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/indecomposable-counts`, `ReductiveGroupsPartII:RG2.3/lang-theorem`, `SchemeAndStackFoundations:SF.3`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/finite-field-neutrality`.


Source: S16 §1.2, Theorem 1.2, p.300; §6.5–6.9, pp.341–349.


Proof route:


1. By Lang and neutrality, identify rational coarse points of Y_1 with the corresponding quotient groupoid and its scalar gerbe factor.

2. For each indecomposable F the contribution is (q−1)q^{dim Ext¹(F,F)}/#Aut(F). Since #Aut(F)=(q−1)q^{dim End(F)−1}, its value is q^{1−χ(F,F)}=q^D.

3. Apply the BB fibre-count equality.


Check: The exponent is D, not 2D. This geometric proof retains its characteristic hypothesis.


Atlas planet: Stable Higgs point count.


### HN integration for canonical Higgs sheaves


Target `CB.8/higgs-hall-integration` (theorem); proposed name `TauCeti.CurveCounting.higgs_hall_integration`.


For g≥1 use A_K^+ and its relative semistability from CB.7/canonical-higgs. Define I_K^+(r,d)=q^{(1−g)r²}mass(all canonical Higgs bundles of class (r,d) with underlying μ_min≥0). Define Ω_K^+ by 1+∑I_K^+(r,d)T^rz^d=Exp(∑Ω_K^+(r,d)T^rz^d/(q−1)). MS14 Theorem 1.2 identifies each fixed-slope Exp factor with the q^{(1−g)r²}-normalized mass of relatively semistable positive Higgs bundles. With quotient-left/subobject-right multiplication, the HN product places smaller slopes on the left. For usual semistable E,F with μ(E)<μ(F), Ext²(E,F)=Hom(F,E)*=0; the positive-category factorization uses the ordered integration theorem of MS14 §3.1, rather than identifying relative factors with usual ones. No Green bialgebra for the whole Higgs category is inferred. The untruncated DT invariants are defined separately by 1+∑_{r>0,d/r=τ}q^{(1−g)r²}mass(Higgs^ss_(r,d))T^rz^d=Exp(∑_{d/r=τ}Ω_K(r,d)T^rz^d/(q−1)).


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/canonical-higgs`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/hall-algebra`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/hn-relations`, `SchemeAndStackFoundations:SF.3`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: MS14 Theorem 1.2, p.2; §2.1–2.3, pp.3–5; §3.1, pp.6–7.


Proof route:


1. Use the two-term Higgs deformation complex and Serre duality to prove Ext² vanishing for usual semistable factors in the displayed slope order.

2. Apply MS14 Theorem 1.2 and §3.1 to the positive-category HN factorization, with relative semistable factors and the normalization q^{(1−g)r²}; keep this separate from any claim that relative semistability is usual semistability.

3. Take the coefficientwise plethystic logarithm and its slope factors to define Ω_K^+. Define Ω_K by the independent usual-semistable same-slope formula; compare them only in the eventual degree range.


Check: State the order of slopes in the Ext² vanishing. For a coprime class, Ω_K=(q−1)q^{(1−g)r²}mass(Higgs^st). Relative positive semistable masses are not obtained merely by restricting the usual semistable stack to underlying μ_min≥0.


### All-characteristic coprime Higgs count


Target `CB.8/all-characteristic-count` (theorem); proposed name `TauCeti.CurveCounting.all_characteristic_count`.


For every finite field and g≥1, Ω_K(r,d)=q A_X(r,d). Hence for r>0,gcd(r,d)=1, #H_(r,d)(F_q)=q^D A_X(r,d) with no characteristic restriction. This strengthens the characteristic-bounded geometric theorem without extending that particular deformation proof to small characteristic.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.8/higgs-hall-integration`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/nilpotent-exponential`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/galois-orbits`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/large-degree`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/count-normalizations`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/serre-higgs`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7/higgs-moduli`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: MS14 Mozgovoy–Schiffmann §4, Theorem 4.3 and Corollaries 4.4–4.5, pp.8–9.


Proof route:


1. For the positive bundle cutoff, apply the same Krull–Schmidt Euler product to the Serre-dual cotangent fibre: ∑I_K^+=Exp(∑q A_X^{≥0}/(q−1)).

2. Compare the relative positive-category slope factors using MS14 Theorem 1.2. For d>binom(r,2)(2g−2), MS14 Corollary 3.3 and Theorem 1.2 identify both the positive Higgs invariants and the indecomposable cutoff counts with the untruncated ones.

3. Remove the cutoff by degree-r periodicity; in a coprime class convert the stable stack mass to coarse points by its neutral G_m-gerbe.


Check: The canonical twist is essential to the duality comparison. Genus zero uses stable-higgs-count’s direct case, since deg K<0.


Atlas planet: All-characteristic coprime Higgs count.


Stage closure obligations: Verify primary-proof obligations G5: BB–Hesselink primary proof; G6: Canonical Higgs moduli and tight quiver comparison. Discharge the exact supplier contracts from SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, AlgebraicModuliForArithmeticGeometry:R09.2, EndoscopicTransferAndUnitaryTraceComparison:ET.2b, AlgebraicModuliForArithmeticGeometry:R09.5, QSeriesPartitionsAndMockModularForms:QM.0, ReductiveGroupsPartII:RG2.3.


## CB.9 — Purity, cohomology and the nilpotent cone


Derive pure compactly supported Higgs cohomology from the contracting symplectic action. Separate all-extension trace identities from weight arguments. State the signed compact Poincaré polynomial, reciprocal nilpotent-cone trace and component count with the corrected dimensions and Tate shifts. Spread out and compare to complex cohomology through explicit supplier contracts.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6`, `CountingBundlesAndHallAlgebrasOfCurves:CB.7`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8`, `DeligneWeightsAndPurity:DWP.0`, `DeligneWeightsAndPurity:DWP.8`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `SchemeAndStackFoundations:SF.2`.


### Pure Higgs cohomology and BB shifts


Target `CB.9/higgs-purity` (theorem); proposed name `TauCeti.CurveCounting.higgs_purity`.


For g≥1,r>0,gcd(r,d)=1 and ℓ≠p, the geometric compactly supported cohomology H_c^n(H,Q_ℓ) is pure of weight n. For the scaling fixed components Z_i, put m_i=dim Z_i and b_i=dim T_{Z_i}^{<0}. The weight-one symplectic form gives m_i+b_i=D and dim T^{>0}=D. In the Grothendieck group of continuous Frobenius representations, [H_c^n(H)]=∑_i[H^{n−2D}(Z_i)(−D)] and [H^n(Λ)]=∑_i[H^{n−2b_i}(Z_i)(−b_i)]. These are identities of semisimplified representations; a canonical splitting is not claimed.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.7/higgs-moduli`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/bb-deformation`, `DeligneWeightsAndPurity:DWP.0`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.8`.


Source: S16 §6.10–6.11, pp.349–352, equations (6.11)–(6.13), with doubled cohomological shifts.


Proof route:


1. The proper weighted Hitchin map gives limits and projective smooth fixed components.

2. Use the symplectic form of scaling weight one to pair tangent weights a and 1−a and obtain the dimension identities.

3. Apply the BB filtrations and the compact cohomology of affine bundles. Purity of the projective bases forces the spectral sequences to degenerate by weights; use the opposite action for Λ.


Check: Rank one has H=Pic^d×A^g and Λ=Pic^d, so the first shift must be 2g. A Tate twist by −a contributes q^a to geometric Frobenius.


Atlas planet: Pure Higgs cohomology and BB shifts.


### Trace reconstruction and coprime positivity


Target `CB.9/trace-positivity` (theorem); proposed name `TauCeti.CurveCounting.trace_positivity`.


In coprime classes, the universal count A_{g,r,d} extends regularly to the paired affine cone and A_{g,r,d}(−α_1,…,−α_{2g}) is represented by a Weyl-invariant polynomial with nonnegative integer coefficients in the α_j. Its total degree is 2D and its diagonal specialization has leading coefficient 1. The Higgs Frobenius eigenvalues are products q^D∏α_j^{e_j} with total weight n in H_c^n, and their multiplicities are recovered from the signed count polynomial; equal specialized monomials are grouped before comparing multiplicities.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.9/higgs-purity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.8/all-characteristic-count`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/universal-counts`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6/origin-constant`, `DeligneWeightsAndPurity:DWP.0`.


Source: S16 Corollary 1.5, pp.301–302; §6.10, equations (6.9)–(6.10), pp.349–350; §6.11, p.352.


Proof route:


1. Clear the q^m−1 denominators by a monic polynomial in q.

2. Use equality of all power sums from finite extensions to identify signed eigenvalue multisets.

3. Separate weights by purity and cancel the highest-weight terms inductively; use universal Weil density to identify the resulting invariant polynomial.

4. Connectedness and smooth dimension 2D fix the top coefficient. Record the monomial-representative issue and denominator cancellation as proof-closure gap G9.


Check: Positivity is established here only for gcd(r,d)=1. Individual monomials may coincide after evaluation on one curve; no linear independence at a single Weil tuple is assumed.


Atlas planet: Trace reconstruction and coprime positivity.


### Compact Poincaré polynomial over C


Target `CB.9/complex-poincare` (theorem); proposed name `TauCeti.CurveCounting.complex_poincare`.


For a smooth connected projective complex curve of genus g≥1 and gcd(r,d)=1, define the signed polynomial P_c(H;t)=∑_n(−1)^n dim H_c^n(H(C),Q)t^n. Then P_c(H;t)=t^{2D}A_{g,r,d}(t,…,t), with q=t² in the paired relation. The unsigned polynomial is t^{2D}A_{g,r,d}(−t,…,−t). The top compact degree is 4D.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.9/trace-positivity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9/higgs-purity`, `SchemeAndStackFoundations:SF.2`.


Source: S16 Corollary 1.3, p.300; §6.10, pp.350–351.


Proof route:


1. Spread a curve and stable Higgs moduli over a finite-type integral Z-algebra with good reduction.

2. Use constructibility of the six-operation compact cohomology complex to choose a stratum on which its ranks are constant.

3. Compare geometric generic and closed fibres, then apply étale–singular comparison and genus-wise local topological constancy. Primary comparison and local constancy are requested, not inferred merely from the finite-field trace formula.


Check: For rank one the signed answer is t^{2g}(1−t)^{2g}. Replacing t by −t changes only the signed A factor, since 2D is even.


### Nilpotent-cone trace and components


Target `CB.9/nilpotent-cone` (theorem); proposed name `TauCeti.CurveCounting.nilpotent_cone`.


For g≥1 and gcd(r,d)=1, Λ is pure and #Λ(F_q)=q^D A_{g,r,d}(α_1⁻¹,…,α_{2g}⁻¹), where inversion also sends q to q⁻¹. Moreover dim H^{2D}(Λ_kbar,Q_ℓ)=dim H^{2D}(H_kbar,Q_ℓ)=A_{g,r,d}(0), the number of geometric irreducible components of Λ. The same component number holds over C. The reciprocal trace formula holds after every finite extension.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.9/higgs-purity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9/trace-positivity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9/complex-poincare`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `SchemeAndStackFoundations:SF.2`.


Source: S16 Corollary 1.4, pp.301–302 (corrected exponent); §6.11, pp.351–352.


Proof route:


1. Combine the two BB formulas using m_i+b_i=D and projective Poincaré duality on each Z_i.

2. Take traces to obtain the reciprocal formula with q^D.

3. Use purity and the corrected degree shifts to identify top cohomology with the origin coefficient; use top cohomology of a proper equidimensional scheme to count geometric components.


Check: Rank one gives #Pic^d=q^g∏(1−α_j⁻¹)=P_X(1). The exponent 2D fails already for a genus-one rank-one example.


Atlas planet: Nilpotent-cone trace and components.


Stage closure obligations: Verify primary-proof obligations G5: BB–Hesselink primary proof; G9: Universal monomial positivity and origin evaluation; G12: Spread-out and complex Higgs cohomology comparison. Discharge the exact supplier contracts from DeligneWeightsAndPurity:DWP.0, DeligneWeightsAndPurity:DWP.8, EtaleDualityAndPerverseSheaves:EDC.2:pairings, SchemeAndStackFoundations:SF.2.


## CB.10 — Mellit integrality and degree independence


Implement the curve-specific deformation of the partition kernel, with its normalization and variable exchange made explicit. Import modified Macdonald functions and admissibility closure through a requested continuation of the formal-series owner. Prove global Laurent pole control and the z=1 comparison and identify every degree count with a single Laurent polynomial; retain source-closure gaps for the generic combinatorial machinery.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9`, `LefschetzPencilsAndVanishingCycles:LPV.5`, `QSeriesPartitionsAndMockModularForms:QM.0`, `tauceti:YoungDiagram.armLength`, `tauceti:YoungDiagram.legLength`.


### Mellit partition generating function


Target `CB.10/mellit-kernel` (definition); proposed name `TauCeti.CurveCounting.mellit_kernel`.


For g≥1 define Ω_g(T;z,q,α)=∑_λ T^{|λ|}∏_{s∈λ}{∏_{i=1}^g[(z^{a(s)+1}−α_i q^{l(s)})(z^{a(s)}−α_i⁻¹q^{l(s)+1})]}/{[(z^{a(s)+1}−q^{l(s)})(z^{a(s)}−q^{l(s)+1})]}. Put H_g=−(1−q)(1−z)Log Ω_g and H_{g,r}=[T^r]H_g. Use one coordinate α_i of each reciprocal pair; ψ_m acts on T,z,q,α_i simultaneously by m-th powers.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.0/coefficient-frame`, `QSeriesPartitionsAndMockModularForms:QM.0`, `tauceti:YoungDiagram.armLength`, `tauceti:YoungDiagram.legLength`.


Source: M20 Mellit 2020 §1, Theorem 1.1, pp.302–303.


Proof route:


1. Form the partition products over the existing finite Young diagrams.

2. Work coefficientwise in T over the generic rational function field, then apply the imported plethystic logarithm.

3. Check reciprocal-coordinate and normalization compatibility with the S16 kernel.


Check: The two parameters of Mellit §5 are (q_M,t_M)=(z,q) in this displayed formula. The zero partition contributes 1.


API:


- `mellitKernel_empty` (simp): The empty coefficient of Ω_g is 1 and H_g has zero constant coefficient.

- `mellitKernel_rankOne` (simp): H_{g,1}=∏_{i=1}^g(z−α_i)(1−q/α_i); at z=1 this equals P_X(1).

- `mellitKernel_reciprocal` (compatibility): Replacing α_i by q/α_i for any i preserves the recovered z=1 counting function.

- `mellitKernel_adams` (functoriality): Finite-extension specialization commutes with the Adams operations used in Log.


Unit tests:


- `single_box` (small): The one-box term gives H_{g,1}(q,1,α)=P_X(1).

- `constant_partition` (degenerate): Taking T=0 gives Ω_g=1 and H_g=0.

- `g1_count` (compatibility): For genus one the z=1 count in every positive rank is #Pic⁰(k).


Consumers: CB.10/mellit-identification: Gives the degree-independent candidate.; CB.10/z-one-regularity: Makes the z=1 evaluation legitimate..


Atlas planet: Mellit partition generating function.


### Schiffmann kernel as a regular deformation


Target `CB.10/partition-deformation` (theorem); proposed name `TauCeti.CurveCounting.partition_deformation`.


Write N_λ(u)=∏_{s∈λ}(z^{a(s)}−u q^{l(s)+1})(z^{a(s)+1}−u⁻¹q^{l(s)}). The S16 partition coefficient is a product of ∏_i N_λ(α_i⁻¹)/N_λ(1) and a symmetric rational factor f_λ obtained by evaluation of Mellit’s shuffle function f_n at the n monomials z^{λ_i}q^{−n+i}. After replacing each α_i⁻¹ by uα_i⁻¹, f_λ is a formal u-series with constant term 1. Its coefficients come from symmetric Laurent function sequences satisfying f_{n+1}(1,x_1,…,x_n)=f_n(qx_1,…,qx_n). The numerator-clearing product of Proposition 4.2 gives a uniform finite denominator bound for each partition coefficient.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.5/partition-kernels`, `CountingBundlesAndHallAlgebrasOfCurves:CB.10/mellit-kernel`, `CountingBundlesAndHallAlgebrasOfCurves:CB.5/jordan-product`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: M20 Mellit 2020 §3, Proposition 3.1, pp.310–312; §4, Proposition 4.2 and Corollaries 4.3,4.5, pp.312–315.


Proof route:


1. Rewrite the S16 J and H factors using the explicit permutation shuffle sum in equation (5); verify the factors rather than identify similarly named kernels.

2. Prove the pole cancellation and padding identity from §4.

3. Use the degree bound of the symmetric shuffle numerator to obtain f_λ(0)=1 and bounded denominators.


Check: The regular-sequence shift multiplies variables by q here, which is t_M in §5. No termwise substitution z=1 into a pole is allowed.


### Regular-sequence deformation at z=1


Target `CB.10/admissible-deformation` (theorem); proposed name `TauCeti.CurveCounting.admissible_deformation`.


Let R be a λ-ring containing Q(t)[q±1] and inject into R*=R⊗_{Q(t)[q±1]}Q(q,t). Suppose Ω[X]=∑_λ c_λ H̃_λ[X] has c_empty=1 and (q−1)Log Ω with coefficients in R. For a regular symmetric Laurent sequence f(u)=1+∑_{j>0}u^j f^(j), put Ω_f[X]=∑_λ c_λ H̃_λ[X] f_λ(u). Then (q−1)Log Ω_f has coefficients in R[[u]], and its reduction modulo q−1 equals that of (q−1)Log Ω. In this theorem q is Mellit’s deformation parameter, hence z in the curve formula.


Hypotheses: R is a rational λ-ring with Adams operations compatible with Q(t)[q±1] and the imported symmetric-function completion; R→R* is injective.


Prerequisites: `QSeriesPartitionsAndMockModularForms:QM.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.10/partition-deformation`.


Source: M20 §5, Definition 5.1, p.315, and Lemma 5.1, pp.316–319.


Proof route:


1. Use modified Macdonald orthogonality for the Hall pairing with S=−(q−1)(t−1).

2. Build the integration kernel using τ and ∇ and apply admissibility under integration.

3. Expand regular sequences in symmetric functions and use the shift relation to show each positive u coefficient vanishes modulo q−1. The generic admissibility closure is a requested QM.0 continuation with proof-closure gap G8.


Check: The coefficient-ring injection is a hypothesis. The conclusion concerns the logarithm and divisibility, not termwise regularity of Ω_f. A ring containing Q(t)[q±1] without the specified λ-ring and Adams structure is not an admissible input.


Atlas planet: Regular-sequence deformation at z=1.


### Laurent integrality of the Mellit coefficients


Target `CB.10/z-one-regularity` (theorem); proposed name `TauCeti.CurveCounting.z_one_regularity`.


For every g≥1,r>0, H_{g,r} belongs to Z[q±1,z±1,α_1±1,…,α_g±1]. In particular it is regular at z=1. Separately, let H^Sch_{g,r}=(1−z)A_{g,r}(z), where A_{g,r}(z) is the Schiffmann logarithmic count series of CB.6/explicit-count. Mellit Theorem 5.2(i), with q_M=z and t_M=q, gives H^Sch_{g,r}∈Q(q)[z±1,α_1±1,…,α_g±1]. Theorem 5.2(ii) gives H^Sch_{g,r}(q,1,α)=H_{g,r}(q,1,α). Thus A_{g,r}(z) has no poles at nonzero finite z other than possibly z=1. No integral-coefficient assertion for H^Sch before specialization is inferred.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.10/admissible-deformation`, `CountingBundlesAndHallAlgebrasOfCurves:CB.10/partition-deformation`, `CountingBundlesAndHallAlgebrasOfCurves:CB.10/mellit-kernel`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: M20 §5, Theorem 5.2(i)–(ii), pp.319–321; M18 §7, Theorem 7.1 and Corollary 7.2, pp.29–31.


Proof route:


1. Apply HLV-kernel admissibility to remove denominators from H_g.

2. Apply the regular-sequence deformation and finite denominator bounds to obtain the global Laurent conclusion of Mellit Theorem 5.2(i); use part (ii) for equality at z=1. Keep q_M=z and t_M=q throughout.

3. Upgrade rational coefficients to integral coefficients through the integral modified-Macdonald expansion. This last generic input remains within G8.


Check: Laurent integrality does not itself define evaluation at the affine-cone origin. No genus-zero claim is imported from Mellit’s g≥1 theorem. The function F(z)=1/(1−z²) has (1−z)F(z)=1/(1+z), regular at 1 but with a pole at −1. Local regularity alone would not imply degree independence; the global Laurent statement excludes this example.


Atlas planet: Laurent integrality of the Mellit coefficients.


### Degree-independent universal bundle count


Target `CB.10/mellit-identification` (theorem); proposed name `TauCeti.CurveCounting.mellit_identification`.


For every g≥1,r>0,d∈Z, A_{g,r,d}=H_{g,r}(q,1,α)∈R_g. Thus A_X(r,d) is independent of d, and the universal count lies in the unlocalized invariant Laurent ring, with integral Laurent coefficients. Genus zero has the separate rank-one/empty classification. Together with the coprime result, degree independence transfers positivity and origin regularity to all degrees (the following application). It supplies no analogous theorem for parabolic or fixed-HN counts.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.10/z-one-regularity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6/explicit-count`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6/residue-extraction`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/universal-counts`, `CountingBundlesAndHallAlgebrasOfCurves:CB.1/count-normalizations`, `LefschetzPencilsAndVanishingCycles:LPV.5`.


Source: M20 Mellit 2020 §1, Theorem 1.1, pp.302–303; §5, Theorem 5.2, pp.319–321.


Proof route:


1. Compare the S16 logarithmic numerator and Mellit H using the regular deformation.

2. Global Laurentness of H^Sch=(1−z)A removes every nonzero finite pole of A except possibly 1. The CB.6 Taylor expansion at 0 removes negative powers there. Its rational form is therefore a polynomial plus H^Sch(1)/(1−z); the polynomial changes only finitely many truncated coefficients. Fourier residue extraction gives the same eventual count H(1) in every degree class.

3. Use universal density to promote equality at every curve to equality in R_g.


Check: Distinguish equality in R_g from an unjustified polynomial presentation in 2g independent variables. For g=1 all ranks give P_X(1). Equality at z=1 without global pole control does not establish the theorem; the nontrivial roots in the μ_r residue sum must first be excluded.


Atlas planet: Degree-independent universal bundle count.


### Positivity and constants in every degree


Target `CB.10/all-degree-positivity` (application); proposed name `TauCeti.CurveCounting.all_degree_positivity`.


For g≥1 and every r>0,d∈Z, A_{g,r,d}=A_{g,r,1}. Consequently it has a nonnegative invariant representative in the variables −α_j, is regular at the affine-cone origin, has total degree 2D with monic diagonal specialization, and its origin value is independent of d. This comparison does not identify a noncoprime stable Higgs moduli space with a coprime one.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.10/mellit-identification`, `CountingBundlesAndHallAlgebrasOfCurves:CB.9/trace-positivity`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6/origin-constant`.


Source: M20 Mellit 2020 Theorem 1.1, pp.302–303, combined with S16 Corollary 1.5, pp.301–302.


Proof route:


1. Apply degree independence with d′=1, which is coprime to every positive r.

2. Transfer each universal polynomial and local-ring property from that coprime class.


Check: The noncoprime count inherits positivity through an equality of universal functions. No stable noncoprime Higgs point count is deduced.


Stage closure obligations: Verify primary-proof obligations G4: Universal curve monodromy and Weil density; G8: Generic Macdonald admissibility and integral kernel. Discharge the exact supplier contracts from QSeriesPartitionsAndMockModularForms:QM.0, LefschetzPencilsAndVanishingCycles:LPV.5.


## CB.11 — Parabolic counts and Hall-Lie questions


Own the quasi-parabolic counting specialization, fixed-HN and slope-cut refinements, Euler-characteristic spherical Hall algebra and its primitive Lie algebra. Keep the stated parabolic R_g theorem distinct from the K_g argument available in the main source. Package the remaining positivity, HN and root-multiplicity questions as conjectural propositions, never as proved results or consequences of Mellit.


The stage requires `CountingBundlesAndHallAlgebrasOfCurves:CB.0`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `QSeriesPartitionsAndMockModularForms:QM.0`, `SchemeAndStackFoundations:SF.1`.


### Quasi-parabolic bundles and absolute counts


Target `CB.11/quasi-parabolic` (definition); proposed name `TauCeti.CurveCounting.quasi_parabolic`.


Fix distinct k-rational marked points x_i and integers p_i≥1. A quasi-parabolic bundle is a bundle V with a possibly non-strict flag 0⊆F_1^(i)⊆…⊆F_{p_i}^(i)=V|_{x_i}. Its type is (r,d,d^(i)_j), with 0≤d^(i)_1≤…≤d^(i)_{p_i}=r. Isomorphisms preserve every flag. Absolute indecomposability is tested in this additive category after k̄ extension; its count is A_{X,p,α}. No weights or parabolic stability condition are part of this definition.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.0/indecomposable-counts`.


Source: S16 §7.1, pp.352–353.


Proof route:


1. Use the upstream bundle and fibre functors and relative flag schemes.

2. Define direct sums componentwise and scalar extension on flags.

3. Apply boundedness for indecomposable parabolic objects to obtain a finite class set; its proof is part of G10.


Check: Repeated flag dimensions are allowed. A decomposable underlying bundle can be indecomposable with its flags.


API:


- `parabolic_forget` (projection): Forget flags to a bundle of the same rank and degree.

- `parabolic_baseChange` (functoriality): Scalar extension preserves the type at the specified rational marked points and commutes with sums.

- `parabolic_trivialFlags` (equivalence): If all p_i=1, the category and its absolute count identify with ordinary bundles.

- `parabolic_degreeTwist` (compatibility): Tensoring by a degree-one line bundle preserves flags and shifts d by r.


Unit tests:


- `no_marks` (degenerate): N=0 recovers A_X(r,d).

- `line_flags` (small): For rank one every admissible flag is unique and the count is #Pic⁰(k).

- `nonrational_mark` (non-example): A closed point of residue degree e>1 is outside this theorem and needs extra arithmetic parameters.


Consumers: CB.11/parabolic-universality: Supplies the moduli category and count.; YuCountingPartII: Provides the absolute counting input, without identifying arbitrary parabolic local types with full flags..


Atlas planet: Quasi-parabolic bundles and absolute counts.


### Universal parabolic counting functions


Target `CB.11/parabolic-universality` (theorem); proposed name `TauCeti.CurveCounting.parabolic_universality`.


For a fixed genus, flag lengths and admissible class α, there is a unique A_{g,p,α}∈R_g specializing to A_{X,p,α} for every curve with distinct rational marked points of that type. The literal R_g conclusion is the target of S16 Theorem 7.1; its asserted parallel Hall argument and denominator removal require the missing inputs in G10. A construction in K_g alone does not close this target.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.11/quasi-parabolic`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/generic-form`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/universal-counts`, `QSeriesPartitionsAndMockModularForms:QM.0`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`.


Source: S16 §7.1–7.2, Theorem 7.1, pp.352–353.


Proof route:


1. Construct the parabolic coherent Hall algebra with local flag generators, Euler form and hereditary correspondence.

2. Prove its generic form, HN membership and shuffle specialization, then repeat the nilpotent groupoid calculation.

3. Supply a separate denominator-removal argument for R_g and a density statement for marked curves. These are explicit obligations, not deductions from the ordinary Mellit theorem.


Check: Trivial flags recover the ordinary theorem. Do not assert a parabolic Higgs point-count theorem from this result.


Atlas planet: Universal parabolic counting functions.


### Slope-cut and fixed-HN absolute counts


Target `CB.11/hn-refined-counts` (definition); proposed name `TauCeti.CurveCounting.hn_refined_counts`.


For a rational ν define A_X^{≥ν}(r,d) and A_X^{≤ν}(r,d) by the supplier HN extremes. For a decreasing HN type β=(α_1,…,α_t) of total (r,d), define A_X,β by requiring the exact HN type β. The objects counted are absolutely indecomposable bundles, although their HN graded objects can be decomposable. A slope cut is a finite union of HN strata in each fixed bounded rank-degree range.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.0/indecomposable-counts`, `GlobalShtukasAndFunctionFieldLanglands:GS.0`.


Source: S16 §8.1–8.2, Corollary 8.1 and Conjecture 8.2, pp.353–354.


Proof route:


1. Use the imported HN type and its scalar-extension compatibility.

2. Intersect each type or slope condition with the absolute-indecomposable class set.

3. Use the HN spread bound to make the relevant unions finite.


Check: When ν=d/r, the ≥ν cutoff is exactly the semistable underlying-bundle condition. No Higgs field is involved in this refinement.


API:


- `hnCount_partition` (characterisation): An absolute count on a bounded union of distinct HN types is the sum of the type counts.

- `hnCount_dual` (compatibility): Dualization identifies ≥ν counts at (r,d) with ≤−ν counts at (r,−d).

- `hnCount_twist` (functoriality): Degree-one tensoring shifts each HN slope by one and the total degree by r.


Unit tests:


- `semistable_boundary` (small): If ν=d/r the ≥ν count equals the count of absolute indecomposable semistable bundles.

- `empty_cut` (degenerate): If ν>d/r the ≥ν count is zero.

- `hn_not_directSum` (non-example): A nontrivial HN filtration is not a direct-sum decomposition; an indecomposable may have several HN factors.


Consumers: CB.11/cutoff-universality: Specifies the counts which have universal K_g representatives.; CB.11/open-assertions: States the stronger fixed-type regularity problem..


### Universal slope-cut counting functions


Target `CB.11/cutoff-universality` (theorem); proposed name `TauCeti.CurveCounting.cutoff_universality`.


For every rational ν and class (r,d) with r>0, there are unique elements A_{g,r,d}^{≥ν},A_{g,r,d}^{≤ν}∈K_g specializing to the two slope-cut absolute counts. Degree-one twist and duality hold universally. This theorem does not assert membership in R_g or a universal element for each exact HN type.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.11/hn-refined-counts`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/hn-membership`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/generic-form`, `CountingBundlesAndHallAlgebrasOfCurves:CB.2/nilpotent-exponential`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/universal-counts`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §8.1, Corollary 8.1, p.353; §4.5–4.6, pp.319–321.


Proof route:


1. Use HN characteristic functions in the generic spherical Hall algebra for the specified cutoff.

2. Apply truncated nilpotent counting and coefficientwise plethystic logarithms.

3. Identify the specialization and use universal density for uniqueness.


Check: The codomain is K_g. Mellit’s ordinary untruncated identity supplies no denominator cancellation for these cuts.


Atlas planet: Universal slope-cut counting functions.


### Euler-characteristic spherical Hall Lie algebra


Target `CB.11/euler-hall-lie` (construction); proposed name `TauCeti.CurveCounting.euler_hall_lie`.


Over an algebraically closed field of characteristic zero, use constructible functions on coherent moduli, with Hall convolution defined by compact Euler-characteristic integration over subsheaf varieties. Direct sum defines the cocommutative coproduct. Take the graded Hopf subalgebra generated by torsion constants and all line-bundle constants, and let h_X^sph be its primitive subspace with commutator bracket. A finite-field numerical specialization at α_j=1 is not used to define this algebra.


Prerequisites: `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `SchemeAndStackFoundations:SF.1`, `CountingBundlesAndHallAlgebrasOfCurves:CB.3/hall-algebra`.


Source: S16 §8.3, pp.354–355, citing Lusztig §10.20 and Bridgeland–Toledano Laredo Theorem 4.3.


Proof route:


1. Construct Euler pushforward on the relevant finite-type constructible correspondences, checking independence of stack presentations.

2. Prove the direct-sum/Hall compatibility using Euler localization, giving a cocommutative graded Hopf algebra.

3. Restrict to the generated subalgebra and show primitives are closed under commutators. Primary constructible-Hall proof closure is G11.


Check: The algebra uses Euler characteristic, not 1/#Aut weights over C. Finite-dimensionality of primitive graded pieces is conjectural here.


API:


- `eulerHall_unit` (structure): The zero-sheaf delta function is the convolution unit and the degree-zero primitive part is zero.

- `eulerHall_primitiveBracket` (structure): If Δx=x⊗1+1⊗x and similarly for y, then [x,y] is primitive.

- `eulerHall_curveIso` (functoriality): A curve isomorphism induces a grading-preserving Hopf equivalence and a primitive Lie equivalence.


Unit tests:


- `zero_primitive` (degenerate): Over characteristic zero a scalar multiple of the Hopf unit is primitive only when it is zero.

- `primitive_bracket` (compatibility): The mixed x⊗y and y⊗x terms cancel in Δ[x,y].

- `numerical_limit` (non-example): The K_g function (q−1)⁻¹ has a pole at the proposed α=1 limit, so naive numerical evaluation does not define the Euler Hall product.


Consumers: CB.11/open-assertions: Makes the proposed constant-term/root-multiplicity equality precise..


Atlas planet: Euler-characteristic spherical Hall Lie algebra.


### Precise remaining Hall and HN conjectures


Target `CB.11/open-assertions` (definition); proposed name `TauCeti.CurveCounting.open_assertions`.


Define the following propositions, without proofs: (i) for every exact HN type β its absolute count is a specialization of some A_{g,β}∈R_g; (ii) each difference A^{≥i}_{g,r,d}−A^{≥i+1}_{g,r,d}, i≥0, has a nonnegative invariant representative in the variables −α_j; (iii) h_X^sph is independent of X of genus g, has finite-dimensional graded pieces, and dim h^sph_(r,d)=A_{g,r,d}(0); (iv) for H_sph^{≥0}, the subalgebra of spherical functions supported on the nonnegative HN category, ∑_β dim H_sph,β^{≥0}z^β=Exp(∑_β A_{g,β}^{≥0}(0)z^β). Any origin evaluation in (ii)–(iv) includes the regularity assertion needed to define it. The commuting-variety K-theory/cohomology degeneration mentioned in S16 is a separate proposed geometric mechanism, not a proved consequence.


Prerequisites: `CountingBundlesAndHallAlgebrasOfCurves:CB.11/hn-refined-counts`, `CountingBundlesAndHallAlgebrasOfCurves:CB.11/cutoff-universality`, `CountingBundlesAndHallAlgebrasOfCurves:CB.11/euler-hall-lie`, `CountingBundlesAndHallAlgebrasOfCurves:CB.6/origin-constant`, `CountingBundlesAndHallAlgebrasOfCurves:CB.4/spherical-algebra`, `QSeriesPartitionsAndMockModularForms:QM.0`.


Source: S16 §8.1 remarks and §8.2–8.3, Conjectures 8.2–8.4, pp.353–355.


Proof route:


1. Form each proposition using the imported graded coefficient and algebra notions.

2. Keep the underlying universal count, denominator-removal and finite-dimensionality assertions separate.

3. Record current theorem support and the exact conjectural remainder; no node uses these propositions as established hypotheses.


Check: Conjectures are visibly distinct from theorem nodes. The ordinary Mellit result is recorded as established, rather than repeated among the open propositions.


API:


- `hnConjecture_specialize` (characterisation): The fixed-type proposition includes equality for every finite field and curve, not just a chosen X.

- `hallLieConjecture_regular` (projection): The Hall-Lie statement entails origin regularity and finite-dimensionality before equating two integers.

- `hallHilbertConjecture_coefficient` (characterisation): The Hilbert-series statement is equivalent to equality of every finite bidegree coefficient after the specified Exp expansion.


Unit tests:


- `ordinary_degree` (non-example): Degree independence of the untruncated A does not imply fixed-HN polynomiality.

- `rank_one_component` (small): In coprime rank one the proposed root multiplicity is 1, the proved nilpotent-cone component count.

- `origin_pole` (non-example): A slope-cut coefficient with an uncancelled q⁻¹ has no origin value; it cannot be inserted in the Hilbert identity.


Consumers: future-Hall-Lie-work: These propositions describe the remaining mathematical research targets and are never an unconditional prerequisite..


Stage closure obligations: Verify primary-proof obligations G10: Parabolic Hall computation and denominator removal; G11: Constructible Hall Hopf algebra. Discharge the exact supplier contracts from GlobalShtukasAndFunctionFieldLanglands:GS.0, SchemeAndStackFoundations:SF.1, QSeriesPartitionsAndMockModularForms:QM.0.


## Exact supplier contracts

These are precise exports to integrate or extend at their existing owners; they are not claims that all supplier stages are already closed.

### `GlobalShtukasAndFunctionFieldLanglands:GS.0`

Specialize Bun_G to fixed-rank fixed-degree GL_r bundles, with scalar-extension compatible rank, degree, coherent Hom/Ext and hereditary Coh(X), χ((r,d),(s,e))=(1−g)rs+re−sd, coherent HN filtrations with torsion slope +∞, bounded finite-type HN opens and finite-field groupoid finiteness. Supply the routed numerical Siegel mass q^{(g−1)(r²−1)}P_X(1)∏_{i=2}^r ζ_X(q⁻i)/(q−1), the coherent/bundle torsion factor and torsion mass Exp(#X(k)z/(q−1)). Infinite products require their numerical/completed coefficient topology. These quantitative extensions are not yet nodes of the current GS.0 packet; fixed central degree is essential.

Consumed by: `CB.0/indecomposable-counts`, `CB.1/count-normalizations`, `CB.1/hom-transfer`, `CB.1/large-degree`, `CB.2/nilpotent-pairs`, `CB.2/jordan-type`, `CB.2/filtered-sheaves`, `CB.3/hall-algebra`, `CB.3/green-pairing`, `CB.3/characteristic-functions`, `CB.3/basic-masses`, `CB.4/hn-relations`, `CB.4/hn-membership`, `CB.7/canonical-higgs`, `CB.7/two-line-chart`, `CB.11/quasi-parabolic`, `CB.11/parabolic-universality`, `CB.11/hn-refined-counts`, `CB.11/euler-hall-lie`.


### `SchemeAndStackFoundations:SF.1`

Effective descent for coherent objects and flags, quotient stacks with stabilizers and atlas independence; a stable rational geometric class gives a gerbe, and the separate connected-band H² neutrality input supplies existence of a form. Do not replace a coarse moduli space by its stack.

Consumed by: `CB.0/indecomposable-counts`, `CB.1/finite-field-neutrality`, `CB.2/groupoid-mass`, `CB.2/filtered-sheaves`, `CB.7/canonical-higgs`, `CB.7/higgs-moduli`, `CB.7/two-line-chart`, `CB.8/bb-deformation`, `CB.11/quasi-parabolic`, `CB.11/euler-hall-lie`.


### `SchemeAndStackFoundations:SF.3`

Riemann–Roch and natural Serre duality for coherent sheaves on a smooth projective geometrically connected curve, Picard schemes and degree-d torsors, canonical bundle of degree 2g−2, finite-dimensional proper coherent cohomology, genus-zero bundle splitting, and the criterion μ_min(F)>2g−1 for strong generation by O_X. Use the existing AlgebraicCurves/JacobianChallenge owners; no second bundle carrier. The existing SF.3/vector-bundle-riemann-roch and SF.3/curve-serre-duality nodes supply the locally free cases; the requested Ext¹(V,W)*≃Hom(W,V⊗Ω) must also cover coherent V,W, naturally in both variables.

Consumed by: `CB.1/count-normalizations`, `CB.1/hom-transfer`, `CB.1/large-degree`, `CB.2/jordan-fibres`, `CB.3/hall-algebra`, `CB.3/green-pairing`, `CB.7/canonical-higgs`, `CB.7/serre-higgs`, `CB.8/framing-cutoff`, `CB.8/stable-higgs-count`, `CB.8/higgs-hall-integration`.


### `SchemeAndStackFoundations:SF.4`

Quot tangent-obstruction sequences with natural Ext maps, dual tangent sequence for a smooth framed coherent chart, and compatibility under changing the frame; use the supplied infinitesimal deformation formalism, rather than treating cotangent points as arbitrary chosen Serre-duality isomorphisms.

Consumed by: `CB.7/cotangent-moment`.


### `AlgebraicModuliForArithmeticGeometry:R09.2`

Strong generation by a line bundle means Ext¹(L,F)=0 and surjectivity of Hom(L,F)⊗L→F. Supply projective Quot of a fixed source, the open locus with prescribed Hom frames, its tangent/obstruction interpretation and base-change compatibility, and relative flag schemes. The fixed source dimension in the good-line kernel bound cannot vary arbitrarily.

Consumed by: `CB.7/higgs-moduli`, `CB.7/two-line-chart`, `CB.7/kronecker-chart`, `CB.8/bb-deformation`.


### `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`

Reuse ET.2b/hitchin-moduli-stack, whose carrier allows D=Ω_X, and ET.2b/schiffmann-boundedness, which already states canonical good-line existence. Integrate the corrected fixed-source form: L2 must strongly generate every kernel of L1^{l1}↠F for this fixed l1, rather than arbitrary source dimension. Export the degree-only strong-generation criterion needed by the explicit bound of CB.8/framing-cutoff. The new work here is the computable sufficient choice, positive Higgs category, stable canonical coarse geometry and two-line comparison; positive-twist smoothness or anisotropic properness does not supply the full canonical stable coarse result.

Consumed by: `CB.7/canonical-higgs`, `CB.7/higgs-moduli`, `CB.7/two-line-chart`, `CB.8/framing-cutoff`, `CB.8/king-slope`.


### `AlgebraicModuliForArithmeticGeometry:R09.5`

Requested Part II extension beyond the present finite-inertia/coarse-space stage: character-linearized reductive GIT for GL(V1)×GL(V2) acting on the Kronecker presentation, Hilbert–Mumford/King inequalities with base change, stable=semistable for coprime dimensions, geometric free projective-group quotients and the projective map from character quotient to affine quotient. A G_m-gerbe is not covered by a finite-inertia theorem.

Consumed by: `CB.7/higgs-moduli`, `CB.8/king-stability`, `CB.8/deformation-family`.


### `QSeriesPartitionsAndMockModularForms:QM.0`

Requested continuation of QM.0: complete filtered rational λ-rings with commuting Adams operations, coefficientwise Exp and Log as inverse group isomorphisms, ψ_m acting on all coefficient and degree variables, Heine’s partition identity, and the Möbius finite-extension formula. A further Part II supplies modified Macdonald H̃_λ, the Hall S pairing with S=−(q−1)(t−1), ∇ and τ, S-admissibility preserved by composition/integration/trace, and integral HLV-kernel logarithms (Mellit 2018 Theorem 7.1/Corollary 7.2). The present QM.0 packet has no node supplying these interfaces; G8 records that fact.

Consumed by: `CB.0/coefficient-frame`, `CB.1/nilpotent-matrix-count`, `CB.2/nilpotent-exponential`, `CB.3/basic-masses`, `CB.4/universal-counts`, `CB.5/torsion-separation`, `CB.5/positive-arm-product`, `CB.6/generating-identity`, `CB.6/explicit-count`, `CB.6/constant-formula`, `CB.8/higgs-hall-integration`, `CB.8/all-characteristic-count`, `CB.10/mellit-kernel`, `CB.10/partition-deformation`, `CB.10/admissible-deformation`, `CB.10/z-one-regularity`, `CB.11/parabolic-universality`, `CB.11/cutoff-universality`, `CB.11/open-assertions`.


### `ReductiveGroupsPartII:RG2.3`

Integrate the existing RG2.3/lang-theorem node: smooth connected algebraic groups over finite fields have surjective Lang map and trivial H¹, including extension fields. For a finite-dimensional endomorphism algebra, its unit group is a smooth geometrically connected open in affine space, so the theorem applies. This is use of an existing planned result, not a request for a new general Lang theorem. Connected-band H² neutrality remains the separate G1 obligation.

Consumed by: `CB.1/finite-field-neutrality`, `CB.1/galois-orbits`, `CB.8/stable-higgs-count`.


### `DeligneWeightsAndPurity:DWP.0`

Weil q-eigenvalues, reciprocal pairs, finite-extension power operations and integral weights with the geometric-Frobenius convention. Distinct pure weights have disjoint spectra, including Tate twists. Power sums identify finite signed multisets in characteristic zero without assuming diagonalizability.

Consumed by: `CB.0/coefficient-frame`, `CB.9/higgs-purity`, `CB.9/trace-positivity`.


### `DeligneWeightsAndPurity:DWP.8`

Pure cohomology of smooth projective fixed loci via proper direct-image purity, and degeneration of the BB compact-cohomology filtration by disjoint weights. Use DWP.7/8 and the specified ℓ-adic coefficients; no canonical splitting or arithmetic Frobenius semisimplicity is inferred.

Consumed by: `CB.9/higgs-purity`.


### `EtaleDualityAndPerverseSheaves:EDC.2:pairings`

Frobenius-equivariant projective Poincaré duality H^{2m−j}(Z)* (−m)≃H^j(Z), compact cohomology of rank-a affine bundles shifted by 2a and twisted by −a, and top cohomology of a proper pure-D-dimensional scheme counting geometric irreducible components. The latter two standard consequences must be exported with their localization hypotheses.

Consumed by: `CB.9/higgs-purity`, `CB.9/nilpotent-cone`.


### `SchemeAndStackFoundations:SF.2`

Integrate the existing CohomologicalPointCounting six-operation and trace-formula suppliers: compact cohomology, localization, affine-bundle Thom shift, trace of geometric Frobenius and constructibility in a spread-out finite-type family. Requested comparison extension: étale–singular compact-cohomology comparison over C and genus-wise topological local constancy of coprime Higgs moduli; G12 records that this last geometric input is not supplied by site comparison alone.

Consumed by: `CB.9/higgs-purity`, `CB.9/complex-poincare`, `CB.9/nilpotent-cone`.


### `LefschetzPencilsAndVanishingCycles:LPV.5`

Requested Part II UniversalHypersurfaceMonodromy, already routed by the Schiffmann extraction but with no reserved stage/node: Katz–Sarnak 10.1.16 for y²=f(x)(x−t), deg f=2g squarefree over one fixed odd finite field, gives full Sp_2g geometric monodromy. Combine the half-Tate normalization, Weil II 3.5.3 equidistribution and S16 Appendix B radial argument to prove Zariski density of all genus-g Weil tuples in T_g/W_g. Current LPV.5 only treats pencil radical quotients; it does not supply this universal-family theorem. The extraction’s DWP.8:equidistribution identifier is also absent, so no phantom fine node is cited; see G4.

Consumed by: `CB.4/universal-counts`, `CB.10/mellit-identification`.


## Proof-closure gaps

These obligations must be discharged before calling the dependency graph closed. They do not mark established results as conjectural; they record the exact part of the supporting proof or supplier theory that this planning pass has not verified.

### G1 — Finite-field nonabelian H² neutrality

Read S16 Lemma 2.6, p.311, but not Springer 1966 Theorem 3.5 in primary full proof. Prove neutrality for the smooth connected bands arising as units of finite endomorphism algebras. Lang H¹ gives uniqueness only after existence. This is the exact descent-existence obligation.

Needed by: `CB.1/finite-field-neutrality`.


### G2 — Primary nilpotent-matrix enumeration

S16 uses Fine–Herstein’s Q^{n(n−1)} count. Close its primary proof through Jordan centralizer enumeration and Heine’s identity, with n=0 included. The baseline GL-cardinality formula alone is insufficient.

Needed by: `CB.1/nilpotent-matrix-count`.


### G3 — Invariant generic Hall form and pairing

SV12 §1.11 supplies a torsion-free generic vector-bundle algebra over its representation ring and specialization, but the exact invariant R_g, q^(1/2) normalization, K_g pairing/comultiplication and descent required by S16 Theorem 4.4 have not been derived here. Verify that comparison and all denominator bounds; do not equate the two formulations by name.

Needed by: `CB.4/generic-form`.


### G4 — Universal curve monodromy and Weil density

The S16 Appendix B argument was read. Weil II §3.5.1–3.5.3, pp.210–211, was also read to verify the equidistribution attribution. Its Katz–Sarnak universal-family monodromy, normalization and equidistribution application still need a supplier continuation; no UniversalHypersurfaceMonodromy stage or DWP.8:equidistribution node exists in the current atlas. Fixed odd q and all finite extensions suffice for uniqueness; char-2 family monodromy is not needed.

Needed by: `CB.4/universal-counts`, `CB.10/mellit-identification`.


### G5 — BB–Hesselink primary proof

S16 pp.348–352 gives the application, but the full primary proof of Hesselink 1981 Theorem 5.7 was not read. Supply the smooth quasiprojective filtration under the stated projective-to-affine and limit hypotheses, affine-bundle ranks, opposite-action core decomposition and base-field descent. Contracting orbits alone do not substitute for that theorem.

Needed by: `CB.8/bb-deformation`, `CB.9/higgs-purity`.


### G6 — Canonical Higgs moduli and tight quiver comparison

The complete S16 application was read, but Hitchin properness, nilpotent Lagrangian equidimensionality, connectedness and characteristic-uniform stable moduli, and Álvarez-Cónsul–King Lemma 5.5 under the exact two-line tightness hypotheses need primary-proof closure. The requested GIT extension is also required. ET.2b already supplies the canonical carrier and existential good lines; its positive-twist smoothness and anisotropic properness statements do not give this full canonical stable coarse theorem.

Needed by: `CB.7/higgs-moduli`, `CB.8/king-slope`.


### G8 — Generic Macdonald admissibility and integral kernel

Mellit 2020 was read in full and the precise required interfaces in Mellit 2018 were read. The generic graph-combinatorial proof of S-admissibility and integral HLV coefficients has not been fully read, and QM.0 has no such nodes. It belongs to a requested formal-series/Macdonald continuation, not an assumed baseline.

Needed by: `CB.10/admissible-deformation`, `CB.10/z-one-regularity`.


### G9 — Universal monomial positivity and origin evaluation

Verify S16 pp.335–336 and 349–350 as a universal statement on the paired-coordinate cone: denominator clearing, descending weight cancellation, independence of a chosen monomial representative, and compatibility of the origin local ring. Numeric power-sum identities on one curve do not by themselves identify universal coefficients. Keep this proof-closure obligation separate from Mellit’s Laurent integrality.

Needed by: `CB.9/trace-positivity`, `CB.6/origin-constant`.


### G10 — Parabolic Hall computation and denominator removal

S16 §7 only sketches a parallel proof. Read and verify the needed parabolic spherical Hall/shuffle results cited to Lin, establish boundedness of absolute indecomposables and marked-curve density, and prove the stated R_g conclusion. The ordinary K_g proof or Mellit’s unmarked theorem does not prove this stronger parabolic claim.

Needed by: `CB.11/quasi-parabolic`, `CB.11/parabolic-universality`.


### G11 — Constructible Hall Hopf algebra

S16 §8.3 cites Lusztig §10.20 and Bridgeland–Toledano Laredo Theorem 4.3. Those primary proofs were not read. Establish constructible Euler pushforward on the stack correspondences, convolution finiteness, direct-sum coproduct and the bialgebra compatibility before taking primitives. Curve independence and root multiplicities remain explicit conjectures.

Needed by: `CB.11/euler-hall-lie`.


### G12 — Spread-out and complex Higgs cohomology comparison

S16 pp.350–351 uses compact-cohomology constructibility, comparison and genus-wise diffeomorphism of complex coprime Higgs moduli. The generic six-operation results are requested from SF.2; the last geometric local constancy input needs its primary nonabelian-Hodge/topological proof and exact hypotheses. No fixed-fibre trace computation alone supplies it.

Needed by: `CB.9/complex-poincare`.


## Source corrections and safeguards

The following entries paraphrase the published formulation and state the normalization used here. They identify a source defect or an unclosed argument at the stated locator; none asserts a new counterexample to a correctly normalized main counting theorem. The published PDF, the existing extraction/correction register and the journal landing page were checked; no separate journal correction was located in the public search on 19 October 2026.


- **E1 (misprint), Lemma 2.4, p.309.** The diagonal radical block on an n-fold repeated indecomposable is displayed as n copies of its endomorphism radical. Use the full n×n matrix algebra over the radical, together with all off-diagonal blocks between distinct isomorphism types. For M=N⊕N with nonzero radical J of End(N), the diagonal radical block has dimension 4 dim J, whereas two copies have dimension 2 dim J. Matrix-block multiplication determines the required ideal. Observed in this pass; not present among the extraction’s twelve findings; no journal correction located.

- **E2 (misprint), §4.2, p.316, product of bundle and torsion constants.** The displayed torsion-product coefficient has a q^(−l/2) factor independent of the bundle rank. For bundle rank r and torsion degree l the Hall Euler twist is q^(−rl/2). χ((r,d),(0,l))=rl and v=q^(1/2), so the inverse Hall twist is q^(−rl/2); the Eisenstein identity on p.317 uses q^(−r/2) in its argument. Observed in this pass; no journal correction located.

- **E3 (misprint), Proposition 5.1, p.322.** The X factor reverses the rank index order relative to its own definition, and the Y factor starts with a variable indexed by total rank rather than number of arguments. Use the same ordered rank tuple (r_s,…,r_1) and variables (z_s,…,z_1) in G, X and Y. The immediately defined functions have s arguments; the common ordering is required by the Hall flag convention. Already recorded as PAPER-SCHIFFMANN-16/E2; rechecked in print.

- **E4 (misprint), §5.6, p.332, Jordan-type sum.** The sheaf degree constraint is written as an unweighted sum of Jordan classes. Require the total class ∑_i i α_i=(r,d), consistently with the power T^{∑i rank α_i}. A Jordan block of length two with one rank-one quotient has total rank two, not one. Observed in this pass; no journal correction located.

- **E5 (misprint), §5.7, p.334, description of universal truncated counts.** The characterization of the ≥0 coefficient omits the ≥0 cutoff from the specialized count. The coefficient specializes to A_X^{≥0}(r,d); it equals the untruncated count only in the established large-degree range. A negative-degree line bundle is absolutely indecomposable but fails the nonnegative HN cutoff. Observed in this pass; no journal correction located.

- **E6 (error), §6.2, p.337, Higgs-stack dimension.** The stated dimension of the full Higgs stack uses the naive doubled bundle-stack dimension. On the coprime stable locus the coarse dimension is 2D and the G_m-gerbe stack has dimension 2D−1. Make no uniform dimension assertion about the entire unstable stack from this calculation. Rank one has coarse Pic^d×A^g of dimension 2g and its stack dimension is 2g−1. Observed in this pass; no journal correction located.

- **E7 (error), §6.7, Lemma 6.5, p.345, moment-map target and quotient.** The moment-map quotient discussion uses the full dual Lie algebra as target and suppresses the central restriction before quotienting. The effective target is the annihilator of diagonal scalars; restrict to the invariant central line kλ before forming the quotient Y→A¹. The scalar action is trivial, so its infinitesimal moment component is identically zero; a general coadjoint-equivariant map is not constant on G-orbits as a map to g*. Observed in this pass; no journal correction located.

- **E8 (misprint), §6.11, p.351, scaling on the Hitchin base.** The proof assigns weight one to the whole Hitchin base. The characteristic coefficient of degree i has weight i under θ↦tθ. For a rank-two field, trace scales by t and determinant by t². These positive weights still give the needed contraction. Observed in this pass; no journal correction located.

- **E9 (misprint), §6.11, equations (6.11)–(6.12), pp.351–352.** The affine-fibre ranks are subtracted once from cohomological degree in the BB displays. Subtract twice each rank: n−2D and n−2b_i, keeping Tate twists −D and −b_i. H_c of A^a is supported in degree 2a with twist −a; rank one Pic^d×A^g detects the first shift. Observed in this pass; no journal correction located.

- **E10 (error), Corollary 1.4 (i)–(ii), p.301.** The reciprocal-count prefactor is q^{2D} and the component-count cohomology degree is D. The prefactor is q^D; the component-count degree is 2D for both Λ and ordinary cohomology of H. Rank one gives Λ=Pic^d, q^g A(α⁻¹)=P_X(1), and top cohomology H^{2g} has dimension one. Already recorded and confirmed as PAPER-SCHIFFMANN-16/E8; rechecked in print.

- **E11 (misprint), Examples after Corollary 1.9, p.306.** The rank-three and rank-four values omit the origin-evaluation argument. The displayed genus polynomials are A_{g,3,d}(0) and A_{g,4,d}(0), rather than the entire counting functions. All four examples are introduced as constants; the full rank-one count already varies with Weil eigenvalues. Already recorded as PAPER-SCHIFFMANN-16/E3; rechecked in print.

- **E12 (misprint), Appendix B, p.357, Deligne reference.** The equidistribution theorem is attributed through the bibliography’s Weil I entry. Use Deligne, Weil II, Theorem 3.5.3, p.211, rather than Weil I. The independent review read §3.5.1–3.5.3, pp.210–211, to confirm this attribution. The required compact-group Frobenius equidistribution is the Weil II theorem identified in the extraction; the current DWP atlas has no promised equidistribution substage. Already recorded as PAPER-SCHIFFMANN-16/E5; the primary input remains G4.

- **E13 (gap), Theorem 7.1 and §7.2, pp.352–353.** The target lies in R_g, while the only argument described repeats a construction with values in K_g. Supply parabolic denominator removal separately; retain the published R_g target with G10 instead of declaring it proved by the sketch. With no marks, the stronger conclusion already needs the ordinary denominator-removal theorem, now supplied by Mellit for g≥1. Already recorded as PAPER-SCHIFFMANN-16/E12; no new disproof is asserted.

- **E14 (error), §6.3–6.4, p.339, definition of the doubly framed Quot open.** The displayed open only requires both maps on Hom spaces to be isomorphisms and then asserts strong generation by L1. Also require each restricted evaluation L_i⊗V_i→F to be surjective, or start over the already strongly generated L1 open. Use this corrected open in the principal-bundle and cotangent statements. In genus two choose a nonspecial effective degree-two line M with h⁰(M)=1. For L1 of degree −5 and F=(L1⊗M)⊕B with deg B=4, the rank-two degree-one sheaf has Ext¹(L1,F)=0 but L1 evaluation has basepoints. A sufficiently negative L2 strongly generates F. Choosing bases of both Hom spaces gives a quotient from the sum and both frame isomorphisms, while its first restricted map is not surjective. This example exists after a finite extension and satisfies the fixed frame dimensions. Observed in this pass; no journal correction located.


## Ownership continuations

LPV.5 supplies pencil radical-quotient monodromy, whereas the accepted source route requests universal curve families; UniversalHypersurfaceMonodromy has no current definition or reserved identifiers. Create the routed Part II UniversalHypersurfaceMonodromy for universal-family geometric monodromy and the Weil-density application. Its density input includes a correctly owned Weil II 3.5.3 equidistribution interface. This packet requests the extension through the real LPV.5 stage and records G4, without inventing a supplied node.

Formal-series QM.0 lacks the accepted shared plethystic input and the generic modified-Macdonald admissibility machinery. Extend QM.0 with complete filtered Adams/Exp/Log interfaces; put modified Macdonald functions, Hall pairings and HLV admissibility in its Part II. CB.10 retains only the curve partition deformation and its application.

R09.5 does not yet supply reductive character GIT. ET.2b already plans the canonical Higgs carrier and existential good lines, but its kernel clause needs the fixed-source interpretation used here. RG2.3/lang-theorem already supplies general finite-field Lang and needs no new planning. Request a R09.5 Part II for reductive character quotients. Integrate ET.2b’s existing canonical carrier and good-line theorem with the fixed-l1 kernel condition and degree-only generation criterion, rather than planning either again. Stable canonical coarse geometry, the positive exact category and central deformation remain CB.7–CB.8.


## Sources and read scope

- **WII.** Pierre Deligne, [La conjecture de Weil : II](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf), Publications Mathématiques de l’IHÉS 52 (1980), 137–252. Independent review read §3.5.1–3.5.3, pp.210–211, for the equidistribution attribution; its preceding proof inputs remain outside this review’s closure claim. SHA-256: `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`.

All target statements and proof routes above are written for this roadmap. The references below supply mathematical provenance; their unread supporting arguments remain identified as gaps rather than being attributed to the pinned libraries.


- **S16.** Olivier Schiffmann, [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf), Annals of Mathematics 183 (2016), 297–362; version of record. Read scope: Entire published article, pp.297–362, including Appendices A–C. PDF page 1 is printed p.297. SHA-256: `8e486963410368afe461a6f2a848eb7ddb618aa48fda7db2c0bd51710286c7a5`.

- **M20.** Anton Mellit, [Poincaré polynomials of moduli spaces of Higgs bundles and character varieties (no punctures)](https://link.springer.com/content/pdf/10.1007/s00222-020-00950-1.pdf), Inventiones mathematicae 221 (2020), 301–327; version of record. Read scope: Entire article, pp.301–327; especially Proposition 3.1, §4, Lemma 5.1 and Theorem 5.2. SHA-256: `8e7392833b24e278460971757b682643d09010bade65a76f91cb663e7c2b83af`.

- **MS14.** Sergey Mozgovoy and Olivier Schiffmann, [Counting Higgs bundles](https://arxiv.org/pdf/1411.2101v1), arXiv:1411.2101v1 (2014), 13 pages; this preprint version is the cited source. Read scope: Entire preprint, pp.1–13; Theorem 2.1, ordered HN integration in §2–3, Theorem 4.3 and Corollaries 4.4–4.5. SHA-256: `7a4efa7f705b57d7e9966a58148fd47b31566b62c1931fd0b84273888679b318`.

- **HN10.** Olivier Schiffmann, [Spherical Hall algebras of curves and Harder–Narasimhan stratas](https://arxiv.org/pdf/1002.0987v1), arXiv:1002.0987v1 (2010); preprint of J. Korean Math. Soc. 48 (2011), 953–967. Read scope: Preprint pp.1–8, through the proof of Theorem 3.1 and Corollary 3.5; remaining geometric discussion not used. SHA-256: `735988898b476d4bbb4234eb7374aa466d2ce272269dec22d4b6f88a9ce58ffd`.

- **SV12.** Olivier Schiffmann and Eric Vasserot, [Hall algebras of curves, commuting varieties and Langlands duality](https://arxiv.org/pdf/1009.0678v1), arXiv:1009.0678v1; preprint of Math. Ann. 353 (2012), 1399–1451. Read scope: §1.11, preprint pp.13–14, generic form and specialization. Other sections were not read as proof closure; G3 records the difference from the form needed here. SHA-256: `4e929e99fc1041423016d12362008e99a52b4320a01e26958e9049f50fef29eb`.

- **M18.** Anton Mellit, [Integrality of Hausel–Letellier–Rodriguez-Villegas kernels](https://arxiv.org/pdf/1605.01299v2), arXiv:1605.01299v2 (December 2018). Read scope: Selected §5 pp.19–21, §6 pp.23–26, §7 pp.29–31: admissibility interfaces and integral HLV conclusion. The graph-combinatorial proof in earlier sections is not fully read; G8 retains it as an imported prerequisite. SHA-256: `5d38ebaad1f7eeee913c9f616f4a96f35ff42ab8f55844b7c4c7be602288123b`.


The packet records all 58 assigned catalogue items, their target nodes, the exact source versions and the ten pinned baseline declarations. The reader and compact suggested file accompany that target-level plan; no implementation-complete claim is made.



## Independent review clarification

The canonical GL_r Higgs bundle carrier and existential good-line theorem are imported from ET.2b/hitchin-moduli-stack and ET.2b/schiffmann-boundedness. The general finite-field Lang theorem is already planned at RG2.3/lang-theorem. The positive exact category, corrected two-line chart and full stable canonical coarse comparison are the additional interfaces used here. The numerical framing recipe was checked from the displayed slope estimates; G7 is discharged relative to the requested degree-only strong-generation criterion. Eleven primary-proof/interface gaps remain, with their original identifiers. The reviewer independently read all target locators, selected proof passages and all fourteen source-issue locators; the longer full-article read scopes above record the design worker’s source coverage, not a claim that this reviewer reread every unreferenced page.
