# Siegel coefficients and algebraic Hodge bundles

The O8 construction starts with the Hodge–Tate frame on a proven open Siegel anticanonical domain. It uses the coefficient representations of O0 and the equivariant sheaf construction of O1 to recover determinant Hodge lines and finite-rank algebraic automorphic bundles. The matrix calculation works in every finite rank. Its geometry requires the actual Siegel tower and its period-map comparison from S1/S3, with the quantitative domain theorem from T3.

This packet treats the finite matrix calculation and the resulting open-domain comparison statements. It remains partial: the geometric supplier declarations have not been constructed in the pinned libraries, the analytic induced-module comparison needs the recorded source corrections, and the toroidal, unitary and general-diamond cases require the exact source work listed below. Every declaration has implementation status unchecked. There are no new object definitions: the frame torsor, analytic representations, coefficient sheaves and algebraic bundles belong to their existing owners. Consequently this part introduces no definition API or definition unit tests. Its theorem acceptance conditions and ten suggested examples test the new identities.

## Sources and conventions

The primary source is Hansheng Diao, Giovanni Rosso and Ju-Feng Wu, [Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism](https://arxiv.org/pdf/2106.00094v3), arXiv:2106.00094v3, 9 April 2026. The read portions are physical/printed pages 1–27 and 31–39. These include the full geometric setup in §2, the perfectoid coefficient definition in §3.1, the full admissibility/comparison calculation of §3.3, and the classical comparison in §3.4. Pages 28–30 and the material after page 39 were not read. In particular, this is not an extraction of the paper's cohomology, eigenvariety or Eichler–Shimura theorems. The source PDF hash and exact rendered-page checks are in the packet. The publisher PDF endpoint returned an HTML landing page; no finding below is attributed to an inspected version-of-record PDF.

The geometric setting has genus g≥1, an odd prime p, and principal tame level N≥3 prime to p. Work over C_p. Fixing compatible p-power roots of unity trivializes the Tate twist in the source's Hodge–Tate description; this does not make a statement Galois-equivariant. The source's AIP comparison imposes p>2g, which must be retained when that comparison is extracted. None of the finite matrix identities needs that prime bound, and this part makes no p=2 geometric claim.

Vectors in the ambient rank-2g symplectic module are rows. Let W be the antidiagonal permutation matrix and let the pairing matrix be [0,−W;W,0]. The graph of Z is represented by [I,Z], with W Zᵀ W=Z. The group acts on the right. For γ=[A,B;C,D] set

Jγ(Z)=A+ZC, Zγ=Jγ(Z)⁻¹(B+ZD).

These are mathematical abbreviations for expressions in existing matrix operations, not new matrix types or a new generic action definition. Their domain includes the condition that det Jγ(Z) is a unit. General matrix inversion is total in Mathlib; writing an inverse without this condition does not justify cancellation. The source's graph-basis normalization has a sign discrepancy, recorded as E-O8-2. Keep the positive leading block I and normalize its displayed pairing matrix to −I.

The group K is defined intrinsically as the inverse image of the diagonal torus of GSp(2g,F_p) in GSp(2g,Z_p). It is the strict Iwahori, rather than the usual inverse image of a Borel. The tower quotient is the definition of the level used here. A tuple of only g pairwise-disjoint order-p subgroups does not have this stabilizer; in genus one it specifies a line with Borel stabilizer. This distinction is source finding E-O8-1 and must be resolved in S1 before using a moduli description.

For rational w>0 the graph neighbourhood Fl×_w consists of coordinates whose entries are within p^(−w) of Z_p. Put Y_w=π_HT⁻¹(Fl×_w) inside the open infinite-level tower, and X_w=Y_w/K. The S3 contract supplies the stability and matrix denominator bounds; T3 supplies the quantitative comparison with the anticanonical domains. Naming these domains does not establish those theorems. The selected comparisons are away from the toroidal boundary: a pro-étale torsor on the open variety cannot establish the pro-Kummer-étale boundary statement.

## Finite matrix calculation

The five finite declarations use ordinary matrices, their existing general linear group of units, and the existing determinant homomorphism. They do not construct an alternative representation or cocycle library. The geometric coefficient functor remains O1's construction.

### Normalisation of a Siegel row graph

Declaration: `TauCeti.Overconvergent.Siegel.graph_normalisation` (`OverconvergentAutomorphicForms:O8/graph-normalisation`).

Put J=A+ZC and Zγ=J⁻¹(B+ZD). If det J is a unit, then [I,Z][A,B;C,D]=J[I,Zγ]. Here [I,Z] is Matrix.fromCols I Z and J⁻¹ is the nonsingular matrix inverse.

Hypotheses:

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- det(A+ZC) is a unit.

Proof route:

1. Expand the left-hand side by Matrix.fromCols_mul_fromBlocks.
2. Expand the right-hand side by Matrix.mul_fromCols and cancel JJ⁻¹ using Matrix.mul_nonsing_inv. No symplectic hypothesis is needed for this finite algebra identity.

Dependencies: `mathlib:Matrix.fromCols`, `mathlib:Matrix.fromCols_mul_fromBlocks`, `mathlib:Matrix.mul_fromCols`, `mathlib:Matrix.mul_nonsing_inv`.

Acceptance:

- For γ=I the coordinate is Z and the factor is I.
- For g=1 the coordinate is (a+zc)⁻¹(b+zd).
- For g=1, Z=0 and γ=[0,1;1,0], the factor is zero and the normalisation equation fails; the unit hypothesis is essential.

Source: DRW v3, Lemma 2.3.1 and its displayed proof, p. 15. The chart calculation is restated over an arbitrary commutative ring with its exact unit hypothesis.

### Siegel matrix automorphy factor

Declaration: `TauCeti.Overconvergent.Siegel.factor_composition` (`OverconvergentAutomorphicForms:O8/factor-composition`).

For γ=[A,B;C,D], δ=[E,F;G,H], put Jγ(Z)=A+ZC and Zγ=Jγ(Z)⁻¹(B+ZD). If det Jγ(Z) is a unit, then Jγδ(Z)=Jγ(Z)(E+ZγG), where Jγδ(Z)=(AE+BG)+Z(CE+DG). Thus Jγδ(Z)=Jγ(Z)Jδ(Zγ), in this order.

Hypotheses:

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- det Jγ(Z) is a unit.

Proof route:

1. Use Matrix.fromBlocks_multiply for the top-left and bottom-left entries of γδ.
2. Distribute (A+ZC)(E+Jγ(Z)⁻¹(B+ZD)G). Cancel JJ⁻¹ using graph-normalisation and compare the four summands.

Dependencies: `OverconvergentAutomorphicForms:O8/graph-normalisation`, `mathlib:Matrix.fromBlocks_multiply`, `mathlib:Matrix.mul_nonsing_inv`.

Acceptance:

- Verify Jγδ(Z)=Jγ(Z)Jδ(Zγ), not the reversed product.
- Genus-two upper and lower elementary unipotent matrices do not commute, so a scalar-only test cannot establish the matrix order.
- With either block matrix the identity, the factor law reduces to the identity law.

Source: DRW v3, Lemma 2.3.1, p. 15; equation (5), p. 20; Remark 3.1.15, p. 25. Derived by composing the source row-graph calculation. This supplies the specific Siegel factor to O1; it does not redefine general cocycles.

### Composition on the Siegel graph chart

Declaration: `TauCeti.Overconvergent.Siegel.coordinate_composition` (`OverconvergentAutomorphicForms:O8/coordinate-composition`).

With γ,δ,Jγ and Zγ as above, assume det Jγ(Z) and det(E+ZγG) are units. Then Z(γδ)=(Zγ)δ: explicitly [(AE+BG)+Z(CE+DG)]⁻¹[(AF+BH)+Z(CF+DH)]=(E+ZγG)⁻¹(F+ZγH).

Hypotheses:

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- Both consecutive denominator determinants are units.

Proof route:

1. factor-composition expresses the denominator of γδ as a product of units; Matrix.isUnit_iff_isUnit_det supplies its invertibility.
2. Apply graph-normalisation twice and associate [I,Z]γδ. The two resulting graph matrices have the same unit leading factor.
3. Cancel that factor by Matrix.nonsing_inv_mul and read the right block, giving the displayed identity.

Dependencies: `OverconvergentAutomorphicForms:O8/graph-normalisation`, `OverconvergentAutomorphicForms:O8/factor-composition`, `mathlib:Matrix.isUnit_iff_isUnit_det`, `mathlib:Matrix.nonsing_inv_mul`, `mathlib:Matrix.fromBlocks_multiply`.

Acceptance:

- Three chart coordinates compose in the same right-action order as their block matrices.
- If a consecutive denominator is not a unit, no assertion of chart preservation is made.

Source: DRW v3, Lemma 2.3.1, p. 15. The right-action law follows from the source graph normalisation and ordinary matrix associativity.

### Antidiagonal dual of the Siegel factor

Declaration: `TauCeti.Overconvergent.Siegel.antidiagonal_dual_factor` (`OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor`).

Let W be an involutive square matrix, W²=I, with W Zᵀ W=Z. Then W(A+ZC)ᵀW=W AᵀW+(W CᵀW)Z. For the reversal matrix W=breve I, this is Jγ(Z)‡=A‡+C‡Z, where M‡=W Mᵀ W.

Hypotheses:

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- W²=I and W Zᵀ W=Z.

Proof route:

1. Apply Matrix.transpose_mul to ZC; it gives CᵀZᵀ.
2. Insert W² between Cᵀ and Zᵀ and use the antidiagonal symmetry of Z.
3. The resulting C‡Z order corrects the expressions used in the two intertwining computations of Proposition 3.3.10; source issue E-O8-10 records the counterexample.

Dependencies: `mathlib:Matrix.transpose_mul`.

Acceptance:

- For W=[0,1;1,0], Z=[0,1;0,0], C=[0,0;3,0], A=I, the left side is diag(1,4), while A‡+ZC‡=diag(4,1).
- For general q=pⁿ≠0 the same example is a strict-Iwahori, indeed principal-level, lower unipotent symplectic element.
- For g=1 the two orders coincide, so this test must use g≥2.

Source: DRW v3, Proof of Proposition 3.3.10, constructions Ψ1 and Ψ2, pp. 35–36. Corrected finite identity underlying the displayed proof; the printed product order fails for noncommuting genus-two matrices.

### Determinant character of the Siegel factor

Declaration: `TauCeti.Overconvergent.Siegel.determinant_character_cocycle` (`OverconvergentAutomorphicForms:O8/determinant-character-cocycle`).

Let R,S be commutative rings and χ:R×→S× a group homomorphism. For consecutive invertible denominator matrices j=Jγ(Z), k=Jδ(Zγ), and l=Jγδ(Z), let d=det:GL(n,R)→R× be the baseline determinant homomorphism. Then χ(d(l))⁻¹=χ(d(j))⁻¹χ(d(k))⁻¹. In particular, χ(u)=uᵐ gives d(l)^(−m)=d(j)^(−m)d(k)^(−m) for every integer m.

Hypotheses:

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- S is commutative; j,k,l are matrix units with the three displayed underlying matrices.
- χ is a homomorphism, not an arbitrary function on units.

Proof route:

1. factor-composition identifies l=jk; equality of matrix units is detected by their underlying matrices.
2. Apply Matrix.GeneralLinearGroup.det and χ, then inversion in the commutative group S×.
3. Use mul_zpow for the integer-weight consequence. This establishes the scalar inverse factor used for coefficient functions, not a reversed matrix cocycle.

Dependencies: `OverconvergentAutomorphicForms:O8/factor-composition`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.det_mul`, `mathlib:map_inv`, `mathlib:mul_zpow`.

Acceptance:

- Weight zero gives factor one.
- Weight one gives det(J)⁻¹ on coefficients; weight minus one gives det(J).
- On the empty matrix index set det=1.
- For g=1 this recovers (a+zc)^(−m).

Source: DRW v3, Equation (5), p. 20; Definition 3.1.14(iii), p. 24. Specialization of the displayed representation factor to the one-dimensional determinant representation, derived algebraically.

## From the frame to coefficient sheaves

The Hodge bundle ω and its right frame torsor Q=Isom(O^g,ω) are imported from B4. The S3 period-map theorem identifies the dual universal Lagrangian with the pullback of ω; the first g coordinate sections give a frame s on Y_w. This imported tensor comparison is the substantive bridge from linear algebra to geometry. An unspecified period map is not enough.

For an algebraic representation ρ, use the associated-bundle relation (qg,v)~(q,ρ(g)v). If γ*s=sJγ, the invariant section represented by f has the coefficient law γ*f=ρ(Jγ)⁻¹f. Applying two group elements places the inverse factors in reverse order. Scalar determinant characters commute, but a vector-valued comparison must retain the matrix order.

An algebraic coefficient representation and an analytic induced coefficient module are different inputs to O0. The recovery statements below concern the finite-rank algebraic representation. For g≥2 the analytic induced module has functions on a positive-dimensional opposite-unipotent neighbourhood even at an algebraic weight; it does not become finite-dimensional merely by specializing the weight. The corrected classical-to-induced comparison is a separate inclusion problem. In particular, a determinant character as a one-dimensional GL_g representation must not be silently replaced by the whole induced representation with the same torus weight.

### Transformation of the Hodge–Tate frame

Declaration: `TauCeti.Overconvergent.Siegel.hodge_frame_transformation` (`OverconvergentAutomorphicForms:O8/hodge-frame-transformation`).

On Y_w let s=(s₁,…,s_g) be the frame of the pulled-back Hodge bundle obtained from the first g coordinate sections of the dual universal Lagrangian by the S3 isomorphism π_HT*W∨≅h*ω. Then, for γ=[A,B;C,D]∈K, γ*s=s(A+ZC). Consequently the right frame torsor is trivialized by s, with transition matrix Jγ(Z)=A+ZC.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the proven domain supplied by T3/S3 and its identification with the required anticanonical neighbourhood. The selected scope is the open variety, away from the toroidal boundary.

Proof route:

1. S3 provides the tautological dual-Lagrangian identification with h*ω, including its equivariance; this identity is not assumed as an O8 conclusion.
2. On the row-graph chart [I,Z], compute the first g columns after right multiplication by γ. graph-normalisation identifies the coefficient matrix as A+ZC.
3. Pull this computation through π_HT. This is the source Corollary 2.4.2 followed by equation (5).

Dependencies: `OverconvergentAutomorphicForms:O8/graph-normalisation`, `OverconvergentAutomorphicForms:O8/coordinate-composition`, `PerfectoidShimuraVarieties:S1`, `PerfectoidShimuraVarieties:S3`, `HodgeTateAndCanonicalSubgroups:T3`.

Acceptance:

- For γ=1 the frame is fixed.
- The coefficient transformation is inverse to the frame transformation.
- No GSp(Q_p) action at fixed toroidal cone decomposition or Galois-equivariance after suppressing Tate twists is inferred.

Source: DRW v3, Corollary 2.4.2, p. 17; Proposition 2.5.2, pp. 18–19; equation (5), p. 20. The source explicitly identifies the dual tautological bundle with the Hodge bundle and states this frame transformation.

### Transformation of the determinant Hodge frame

Declaration: `TauCeti.Overconvergent.Siegel.determinant_frame_transformation` (`OverconvergentAutomorphicForms:O8/determinant-frame-transformation`).

In the preceding setting put η=s₁∧…∧s_g, a nowhere-vanishing section of h*det(ω) on Y_w. For γ∈K, γ*η=det(Jγ(Z))η.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the proven domain supplied by T3/S3 and its identification with the required anticanonical neighbourhood. The selected scope is the open variety, away from the toroidal boundary.

Proof route:

1. Apply the top exterior power to hodge-frame-transformation.
2. In a local determinant-line trivialization, Module.Basis.det_apply identifies the coefficient with det J; AlternatingMap.eq_smul_basis_det identifies every alternating coordinate evaluation with that determinant.
3. The determinant-line constructions and gluing are imported from B4; invertibility of J shows η remains a frame.

Dependencies: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`, `AutomorphicBundles:B4`, `mathlib:Module.Basis.det_apply`, `mathlib:AlternatingMap.eq_smul_basis_det`, `mathlib:Matrix.GeneralLinearGroup.det`.

Acceptance:

- For diagonal J with entries u₁,…,u_g, the factor is the product of the u_i.
- For g=1, η=s₁.
- The frame transforms by det J, while invariant coefficient functions transform by its inverse.

Source: DRW v3, Corollary 2.4.2, p. 17; equation (5), p. 20. Taking determinant is a stated consequence here, not a separately numbered source theorem.

### Scalar Siegel coefficients on the anticanonical domain

Declaration: `TauCeti.Overconvergent.Siegel.scalar_coefficient_identification` (`OverconvergentAutomorphicForms:O8/scalar-coefficient-identification`).

Let E be a complete coefficient field containing C_p, or a reduced affinoid coefficient algebra over C_p, and let χ be an analytic character of the unit neighbourhood containing det Jγ(Z). Suppose O0 supplies its extension and analytic scalar action on that neighbourhood, uniformly at the chosen radius. The O1 coefficient sheaf attached to this character and the Siegel Hodge-frame reduction has, on every open V⊂X_w, sections exactly the analytic coefficient functions f on h⁻¹(V) satisfying γ*f=χ(det Jγ(Z))⁻¹f for every γ∈K. The equality is compatible with restrictions in V.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the proven domain supplied by T3/S3 and its identification with the required anticanonical neighbourhood. The selected scope is the open variety, away from the toroidal boundary.
- An actual O0 analytic character and its extension to the determinant neighbourhood are supplied.
- For a character initially on Z_p× use an O0 r-analytic extension and w>r+1; no assertion for a merely continuous character without that extension.
- O1 supplies the sheaf-category equalizer on this quotient and the relevant completed coefficient functions.

Proof route:

1. hodge-frame-transformation identifies the actual transition matrix. Apply determinant-character-cocycle to obtain the scalar descent law.
2. Invoke the O1 equalizer construction for that law. Its equalizer condition, under the actual frame trivialization, is exactly the displayed equation.
3. O1 sheaf and pullback laws identify restrictions; do not replace the analytic section space by all set-theoretic functions.

Dependencies: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`, `OverconvergentAutomorphicForms:O8/determinant-character-cocycle`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`.

Acceptance:

- χ=1 gives the structure sheaf after applying the supplied quotient descent theorem.
- The defining relation contains the inverse scalar factor.
- A radius outside the supplied extension domain is rejected.
- This statement does not assert coherence of an infinite-dimensional analytic induced module.

Source: DRW v3, Definition 3.1.14(iii), p. 24; Remark 3.1.15, p. 25. The source equivariance condition is specialized to the finite-rank determinant representation supplied by O0. It is not an identification with the full analytic induced coefficient module.

### Determinant Hodge bundle at integral weights

Declaration: `TauCeti.Overconvergent.Siegel.determinant_hodge_specialisation` (`OverconvergentAutomorphicForms:O8/determinant-hodge-specialisation`).

Under the same actual torsor and descent hypotheses, take the algebraic character χ_m(u)=uᵐ, m∈Z, using its O0 specialization. Then the O1 scalar coefficient sheaf in scalar-coefficient-identification is canonically isomorphic to (det ω)^⊗m restricted to X_w. For negative m this denotes the corresponding tensor power of the dual line. On Y_w the map is f↦fη^⊗m; for m<0 use the dual frame. It is an isomorphism of sheaves, not a classicality theorem for global forms.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the proven domain supplied by T3/S3 and its identification with the required anticanonical neighbourhood. The selected scope is the open variety, away from the toroidal boundary.
- The B4 determinant line, its duals and tensor powers, and O1 effective descent for this finite-rank coefficient object are supplied.

Proof route:

1. determinant-frame-transformation gives γ*(η^⊗m)=det(Jγ)^mη^⊗m, using duals for negative weights.
2. Multiply by the coefficient law det(Jγ)^(−m); the product is invariant and descends through O1.
3. Conversely pull back a determinant-line section and express it uniquely in the frame η^⊗m. Invariance gives exactly the scalar coefficient law.
4. The two maps are inverse on the torsor. Faithfulness in the imported descent equivalence gives the isomorphism downstairs.

Dependencies: `OverconvergentAutomorphicForms:O8/scalar-coefficient-identification`, `OverconvergentAutomorphicForms:O8/determinant-frame-transformation`, `AutomorphicBundles:B4`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`, `mathlib:mul_zpow`.

Acceptance:

- m=0 gives O_Xw.
- m=1 gives det ω, not its dual.
- m=−1 gives (det ω)∨.
- In genus one this gives powers of the Hodge line.
- In genus two m=1 has local factor det(A+ZC), not one chosen matrix entry.

Source: DRW v3, Equation (5), p. 20; §3.4, pp. 37–38. Independent determinant-line descent consequence of the verified frame formula. The integer extension uses the imported dual-line functor; no reliance on the flawed induced-module comparison in Proposition 3.3.10.

### Algebraic Levi coefficients recover the automorphic bundle

Declaration: `TauCeti.Overconvergent.Siegel.algebraic_levi_specialisation` (`OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation`).

Let ρ:GL_g→GL(V) be a finite-dimensional algebraic representation over the coefficient field, restricted analytically to the actual O0 frame reduction. Let Q=Isom(O^g,ω) be the B4 right Hodge-frame torsor and Eρ=Q×^{GL_g}V with relation (qg,v)~(q,ρ(g)v). Then the O1 coefficient sheaf for this finite-rank representation and the Siegel factor Jγ(Z) is canonically isomorphic to Eρ|X_w. Its pulled-back coefficients satisfy γ*f=ρ(Jγ(Z))⁻¹f. For a Levi with a separate similitude character this statement uses the trivial character on that extra factor; extra twists must be included explicitly.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- Use the proven domain supplied by T3/S3 and its identification with the required anticanonical neighbourhood. The selected scope is the open variety, away from the toroidal boundary.
- V is finite-dimensional and ρ algebraic; O0 supplies its analytic restriction.
- B4 supplies Q and its associated bundle with the stated right-torsor convention, and O1 supplies effective descent.

Proof route:

1. Pull back Q and trivialize it by the actual frame s from hodge-frame-transformation.
2. The associated-bundle relation converts sγ=sJγ into the coefficient change ρ(Jγ)⁻¹. factor-composition proves that these changes compose correctly; O1 supplies the generic representation-valued descent theorem.
3. Apply the O1 equivalence to the equivariant trivial bundle and the pullback of Eρ, whose transition maps agree. This proves the isomorphism.
4. For comparison with the induced highest-weight model, keep the corrected antidiagonal_dual_factor available, but do not infer equality with its infinite-dimensional analytic enlargement.

Dependencies: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`, `OverconvergentAutomorphicForms:O8/factor-composition`, `OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor`, `AutomorphicBundles:B4`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`.

Acceptance:

- The standard representation recovers ω with its rank g.
- The determinant representation agrees with determinant-hodge-specialisation at m=1.
- The dual standard representation recovers ω∨.
- A Schur representation recovers the corresponding B4 Schur-functor bundle.
- For g≥2, specializing an analytic induced module at an algebraic weight is not asserted to collapse to this finite-rank representation.

Source: DRW v3, Corollary 2.4.2, p. 17; §3.4 and Proposition 3.4.3, pp. 37–38. The finite-representation recovery is proved through the frame torsor with an explicit associated-bundle convention. The source motivates the comparison; its printed highest-weight torsor description and intertwiner require the recorded corrections.

## Ownership, baseline and closure

The reviewed AUDIT-15 O8 row finds all four targets absent. Its B4 and S6 overlap warnings determine ownership here. B4 supplies the algebraic bundles; O8 compares their restriction with analytic coefficients. S6 supplies the general toroidal-diamond period map and Levi-torsor pullback; O8 does not reconstruct them or infer global perfectoid representability. O0 owns weight spaces, analytic extensions, finite coefficient representations and analytic induction. O1 owns sheaf equalizers and their general descent API. S1/S3 own the actual tower, quotient and period-map geometry; T3 owns the canonical-subgroup estimates. No restructuring is proposed.

The integrated AutomorphicBundles B2 and B4 nodes were read. They describe classical representation-valued bundles and a complex scalar automorphy condition, respectively. Neither supplies the exact p-adic Hodge-frame comparison requested here. The existing B5 packet concerns Hecke extensions; the LocallyAnalyticDistributions packet concerns L4 Fredholm theory. Neither is used as a substitute for the missing O0 analytic-character interface. There are no O0/O1/S1/S3/T3 packet nodes or applicable reserved IDs at this snapshot. All 27 atlas stage edges touching this roadmap were read. The link maps contain no entry naming one of its stages; roadmap-only negative screens add no edge.

Mathlib is pinned at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti at f790474821cf4256814db967cb154e7af3d0c369. Fourteen baseline declarations were checked in their actual source and their source blobs verified. Block multiplication, column concatenation, inverse cancellation, transpose, determinant multiplicativity, integer powers, and basis determinants are imported. The Tau Ceti rank-two symplectic-multiplier result and complex modular-form APIs do not provide these higher-rank p-adic spaces or coefficients. The packet contains no new general linear group, determinant, exterior algebra or generic cocycle definition.

The six precise supplier requests are:

- `PerfectoidShimuraVarieties:S1`: Open Siegel infinite-level tower with a right group action, the group-theoretic strict-Iwahori quotient and the pro-étale torsor on the open domain. Use inverse image of the full diagonal torus modulo p; source E-O8-1 rules out defining that quotient by only g order-p subgroups.
- `PerfectoidShimuraVarieties:S3`: Actual equivariant Siegel period map, row-graph chart, stable domains Fl×_w and π_HT*W∨≅h*ω with first-g-coordinate frame and specified Tate trivialization. Include the determinant-neighbourhood bound for A+ZC at strict-Iwahori level.
- `HodgeTateAndCanonicalSubgroups:T3`: Identify the specific open w-ordinary/anticanonical Siegel domains with the proven canonical-subgroup neighbourhoods, retaining genus, prime and quantitative radius hypotheses. DRW Remark 2.5.4 alone is not the quantitative identification; inspect §3.6 and its canonical-subgroup references.
- `OverconvergentAutomorphicForms:O0`: Analytic character extension at a stated uniform radius to determinants of A+ZC, analytic scalar coefficient module, and restriction of each finite-dimensional algebraic GL_g representation to the actual analytic Hodge-frame reduction. Integral Gauss lattices must not be replaced by pointwise Z_p-valued bounds (E-O8-5).
- `OverconvergentAutomorphicForms:O1`: Right-torsor equalizer coefficient sheaf with restriction and representation-valued functoriality; effective finite-rank descent on the supplied open Siegel torsor and descent of an equivariant isomorphism. Adopt Jγδ(x)=Jγ(x)Jδ(xγ), hence coefficient order ρ(Jδ(xγ))⁻¹ρ(Jγ(x))⁻¹.
- `AutomorphicBundles:B4`: The algebraic Siegel Hodge-frame torsor Q, determinant and dual/tensor/Schur functor bundles, their analytification on the open Siegel domain, and Q×^{GL_g}V with (qg,v)~(q,ρ(g)v). Integrated B2/B4 nodes describe broader classical constructions but do not supply this exact p-adic comparison.

## Source findings

These eleven findings concern the inspected arXiv v3 and are unreviewed. The corrections specify what must change locally; they do not assert that the source main theorems are false. The packet records the correction search, including the latest arXiv history, the author research page, and the publisher landing metadata. No correction for this paper was found in that search, which is not exhaustive.

### E-O8-1 — Definition 2.2.1(iv) and Remark 2.2.2, pp. 10–11 (rendered); arXiv v3 only

Define the strict-Iwahori level by the full-level tower quotient by the inverse image of the diagonal torus. A moduli description needs enough ordered symplectic line data to have that stabilizer, not only g pairwise-disjoint order-p subgroups.

For g=1 a single order-p subgroup is one line in F_p². Its stabilizer is a Borel, which contains nontrivial unipotents and is strictly larger than the diagonal torus. Under the source row convention the matrix [1,0;1,1] fixes the first row line and is not diagonal. The displayed block-diagonal stabilizer assertion therefore fails already in genus one. For larger g, pairwise disjointness also does not assert joint independence or isotropy.

### E-O8-2 — §2.3 normalized basis, p. 14 (rendered), against §2.1 p. 7; arXiv v3 only

With the pairing matrix [0,−W;W,0] and graph basis e_i+Σ_j Z_ij e_{g+j}, normalize this pairing matrix to −I. Equivalently reverse the pairing arguments. Keep the [I,Z] graph convention used in the subsequent calculations.

At Z=0, the displayed graph basis is e_i and §2.1 gives ⟨e_i,e_{2g+1−j}⟩=−δ_ij. The equations on p. 14 cannot simultaneously have the stated +I normalization and the positive e_i leading term.

### E-O8-3 — Lemma 2.2.5, final identity, p. 13; arXiv v3 only

The final strict-Iwahori identity must use h_Iw+,∗.

The left-hand side is a sheaf on X_Iw+; h_Iw,∗ has target X_Iw. The proof describes the second pair as the same construction at strict-Iwahori level.

### E-O8-4 — Remark 3.1.7, p. 22 (rendered); arXiv v3 only

The closed balls partitioning Z_p^n have radius p^(−ceil(r)) under |p|=p^(−1).

Their underlying cosets are a+p^ceil(r) Z_p^n. A ball of radius p^ceil(r)>1 is not such a coset; the surrounding formulas use the negative exponent.

### E-O8-5 — Definition 3.1.6(iii) and Remark 3.1.7, p. 22 (rendered); arXiv v3 only

The unit ball for the displayed analytic Gauss norm requires integral bounds on the analytic extension to each C_p-disc, equivalently on all scaled coefficients. Pointwise values on Z_p^n alone do not give that lattice.

Take r=1,n=1,B=C_p and an odd prime p. On pZ_p set f(x)=((x/p)^p−x/p)/p and set f=0 on each other residue class. This is 1-analytic and O_Cp-valued on every Z_p point by Fermat reduction. On the 0+pZ_p chart its series in T/p has coefficients 1/p and −1/p, so its radius-p^(−1) Gauss norm is p>1. Thus the stated pointwise lattice is larger than the analytic Gauss unit ball.

### E-O8-6 — Remark 3.1.12, p. 23 (rendered); arXiv v3 only

The multiplicative character restricts to 1 on the unipotent subgroup, as in Definition 3.1.10(ii).

A homomorphism into units sends the identity to 1, not 0; the formula f(ντν′)=κ(τ)f(ν) on p. 24 requires the trivial multiplicative character.

### E-O8-7 — Definition 3.1.14(v), first colimit, p. 25 (rendered); arXiv v3 only

Use M^κU_Iw+,w on the right side when defining forms of strict-Iwahori level.

The preceding definition fixes strict-Iwahori level; the other adjacent colimit and cuspform formulas retain the plus. A change of level cannot be omitted from a definition.

### E-O8-8 — Remark 3.3.9, p. 34 (rendered); arXiv v3 only

Use γ∈Iw+_GSp for representatives of the Iw+_GSp/Γ(p^n) quotient action.

The principal congruence subgroup already acts trivially under the twisted action on the displayed invariant sheaf. Its elements alone cannot define the remaining finite quotient action.

### E-O8-9 — Proposition 3.3.10, construction Ψ2 and display defining Φ, p. 36 (rendered); arXiv v3 only

Functions descending through the quotient must be invariant under right translation by U^(w), meaning g(xu)=g(x); they need not take the value 1 there.

The claimed map is an isomorphism of modules. The zero function on the source maps to zero on the quotient parametrization, while the printed target excludes zero. Right-unipotent invariance gives the requisite linear subspace.

### E-O8-10 — Proposition 3.3.10, constructions Ψ1 and Ψ2, pp. 35–36 (rendered p. 36); arXiv v3 only

Replace the antidiagonal transpose of J=a+zc by J‡=a‡+c‡z when z‡=z. Recheck both intertwiners, their representation convention and ensuing comparison rather than changing a single occurrence.

Transpose is an antihomomorphism. With W=[0,1;1,0], z=E12, c=qE21, a=d=I,b=0, q=p^n≠0, the symplectic principal-level element has J=diag(1+q,1). Therefore J‡=diag(1,1+q), whereas a‡+zc‡=diag(1+q,1). The printed Ψ2 equality s W W J W=s W transpose(a‡+zc‡) fails in these coordinates. The corrected finite identity is a node with two genus-two acceptance examples.

### E-O8-11 — §3.4 definition of the classical sheaf, pp. 37–38 (rendered p. 38); arXiv v3 only

On the full GL_g frame torsor, specify right-unipotent invariance as well as the torus character, or work on the corresponding flag quotient with its torus torsor. Use B4 associated finite-dimensional representations for the bundle comparison.

A torus eigenspace of regular functions on GL_g is generally larger than the finite-dimensional Borel-equivariant induced representation used in Definition 3.4.2(ii). For g=2, weight zero, the regular function x11*x22/det(x) is invariant under right diagonal multiplication but not under a general right upper-unipotent multiplication. Thus torus equivariance alone does not give the coefficient space appearing in Proposition 3.4.3.

The determinant and finite-representation comparison statements above use the independently specified associated-bundle descent proof. They do not assume the printed Proposition 3.3.10 is established. The antidiagonal dual-factor lemma exposes its matrix-order defect directly in the ordinary baseline matrix language.

## Acceptance and remaining source work

The suggested file contains five named matrix lemma signatures and ten acceptance examples, with four baseline declaration checks. It elaborates with zero errors and fifteen placeholder warnings. All 1,757 imported Mathlib source files match the pinned tree and the local cache sources; no Tau Ceti module is imported by this finite slice. This validates signatures and examples, not proofs. The five geometric signatures are absent because the actual supplier APIs do not exist at the baseline; no proposition-valued stand-in or premise containing the desired conclusion is used.

The atlas planets are **Siegel automorphy factor**, **Determinant Hodge bundle**, and **Algebraic automorphic bundles**, attached to the three geometric theorems. A planet does not mark a declaration implemented or a stage closed.

The coverage record remains partial with these exact obligations:

- Replace the six stage-level requests with verified declaration IDs and prove the actual analytic and geometric inputs, especially quantitative anticanonical-domain identification.
- Supply suggested signatures for the five geometric declarations against the genuine supplier APIs. The current suggested file elaborates only the five finite matrix lemmas and ten acceptance examples.
- Extract and repair the analytic induced-module construction and its comparison, including the integral Gauss lattice, corrected antidiagonal intertwiner, and unipotent-invariance conditions. Read DRW §§3.5–3.7 and the necessary AIP/CHJ/BHW sources; retain p>2g wherever the source comparison requires it.
- Extend the verified open-domain finite-coefficient comparisons over the toroidal boundary only after reading the pro-Kummer-étale and 1-motive/modified-integral-structure input in DRW Appendices A–B and the owning S6/B4 contracts.
- Read Boxer–Pilloni Theorem 4.4.40 and its torsor-reduction hypotheses; instantiate general toroidal-diamond coefficients through S6. Read a datum-specific unitary source and supply its actual analytic reduction before adding that example.
- Resolve the eleven version-scoped source findings independently, including whether a published correction exists. No conclusion that the source main theorems are false is drawn from the local proof errors.
