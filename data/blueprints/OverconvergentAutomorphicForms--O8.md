# Siegel and toroidal automorphic coefficients

O8 instantiates the public coefficient construction beyond Hilbert modular varieties. It supplies the arbitrary-genus Siegel automorphy factor, its determinant-character line, and the comparison of finite algebraic coefficients with Hodge and automorphic bundles. It also accepts an actual analytic torsor reduction on another Shimura domain and applies the construction on the general toroidal tower diamond. The generic coefficient module and sheaf remain the constructions of O0 and O1; the varieties, canonical subgroups, Hodge–Tate maps and toroidal towers remain the constructions of their geometry owners.

This is a complete target-level planning pass. O8 has coverage **planned**, with three explicit gaps and eight supplier requests; it is not closed. The packet preserves the ten declarations in the preceding checkpoint and adds the missing coefficient-level instances. Every declaration has implementation status unchecked. The only new native construction is the determinant eigenline embedding, with six API items and four discriminating unit tests. The mathematical interfaces for the eleven geometric declarations are specified here; their suggested Lean signatures require actual supplier types absent from the pinned baseline.

The targets are accounted for as follows:

| O8 target | Declarations and imported inputs |
| --- | --- |
| Arbitrary-genus Siegel forms on proven anticanonical domains | Siegel analytic instance, graph factor and Atkin–Lehner chart; S1/S3 and the quantitative T3 theorem |
| Scalar determinant factor and Hodge powers | Determinant-character cocycle, determinant line map, scalar equalizer and integer-weight Hodge-line comparison |
| Algebraic Levi coefficient recovery | Finite associated-bundle comparison and algebraic-to-analytic injection; exact B4 and B2 nodes |
| Other supplied datum-specific domains | Associated coefficients on an actual analytic reduction; the Boxer–Pilloni Bruhat-domain family is an explicit instance |
| General toroidal diamond coefficients | Pullback coefficient instance and finite canonical-bundle comparison retaining the cyclotomic twist; S6 and T6:comparison |

## Sources, baseline and scope

The Siegel source is Hansheng Diao, Giovanni Rosso and Ju-Feng Wu, [Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism](https://arxiv.org/pdf/2106.00094v3), arXiv:2106.00094v3, 9 April 2026. The relevant reading comprises §§2.1–2.5, §3.1, §§3.3–3.4, §§3.6–3.7 and Appendix B, with the normalization and parameter discrepancies checked at their exact locators. The fresh reading includes the canonical-chart change, canonical-subgroup bounds and the AIP comparison hypotheses. The version of record has not been compared page by page; all fourteen recorded findings concern only the hashed public preprint. Its cohomology, eigenvariety, Eichler–Shimura, Hecke-compactness and classicality arguments are outside the O8 targets. The site and logarithmic comparison proofs in Appendix A are imported through their owners.

The toroidal and non-Siegel source is George Boxer and Vincent Pilloni, [Higher Coleman Theory](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), the 180-page author manuscript whose hash is recorded in the packet. The exact inputs are §3.5.1 (level subgroups), §4.4.38–4.4.40 (general toroidal period map and torsors), §4.6.1–4.6.17 (integral and finer reductions), and §6.3.1–6.3.8 (analytic coefficient families and finite coefficient inclusions). The local cohomology and slope theorems are not needed to construct these coefficient instances. Ding's added 2025 source is assigned to O0 by the job brief; its Jacquet-module eigenvariety is not a new O8 target.

The reviewed library audit is AUDIT-15, O8: not built. Its four targets have no Siegel geometry, Hodge torsor or general-diamond implementation in the pinned libraries. Its B4 and S6 duplication warnings are respected. The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Searches of the complete source trees found complex modular slash actions, complex Tate Hodge structures and algebraic symplectic operations, which do not supply these geometric constructions. Ordinary matrix operations, determinant, bundled linear maps and integer powers are reused. Each cited baseline declaration was read with its actual hypotheses. The two upstream style models read in full are AdicSpaces and AnalyticToricGeometry.

## Geometric and action conventions

For the concrete open Siegel construction fix g≥1, an odd prime p, and principal tame level N≥3 coprime to p, and work over C_p. A compatible system of p-power roots of unity is a choice when trivializing a Tate line; it does not trivialize arithmetic Galois descent. The period-domain definition and finite matrix calculations are separate from a canonical-subgroup identification. The latter uses the quantitative theorem of T3 and retains p>2g wherever DRW §3.6 uses it. The comparison in DRW Theorem 3.7.1 has additional n,v,w and uniform weight-radius inequalities and is not claimed here as a proved AIP equivalence.

The ambient symplectic vectors are rows. With W the antidiagonal permutation matrix, the pairing is [0,−W;W,0]. The graph is [I,Z], with WZᵀW=Z. For a right-acting matrix γ=[A,B;C,D] put Jγ(Z)=A+ZC and Zγ=Jγ(Z)⁻¹(B+ZD), on the locus where det Jγ(Z) is a unit. These are expressions in the existing matrix operations. Total matrix inversion does not remove the unit hypothesis. The source's graph-basis pairing normalization has the sign discrepancy E-O8-2; the leading block remains I and that pairing matrix is −I.

The strict Iwahori K is the inverse image of the full diagonal torus of GSp(2g,F_p), as defined in DRW §2.1. It is defined through the full-level tower quotient. A collection of only g disjoint order-p subgroups is inadequate: already in genus one its line stabilizer contains unipotents and is larger than the torus. This is E-O8-1. S1 must supply the group-theoretic quotient even when a source moduli description is repaired.

For rational w>0 let Fl×_w be the graph-coordinate neighbourhood whose entries lie within p^(−w) of Z_p. S3 supplies Y_w=π_HT⁻¹(Fl×_w), its stability, the denominator bounds and X_w=Y_w/K. The imported Hodge comparison identifies π_HT*W∨ with the pulled-back cohomological Hodge bundle ω. Write its frame as the row s. It transforms by γ*s=sJγ. Thus the determinant frame η transforms by det Jγ, while the coefficient of a descended section transforms by the inverse representation. Composition retains the shifted point: Jγδ(Z)=Jγ(Z)Jδ(Zγ).

On the actual canonical chart the Atkin–Lehner matrix [0,I;−pI,0] gives [I,Z]AL=[−pZ,I] and Z′=−pZ. DRW Proposition 3.6.12 requires c_g+n−1<w≤n, where c_g=(2g−1)p/(2g(p−1)); it bounds the Hodge height by 1/(2p^(n−1)). Corollary 3.6.13 omits n−1 and its proof also needs a uniform strict bound across the domain. The requested T3 export must establish that uniform domain statement instead of importing the printed corollary unchanged. An open pro-étale frame does not provide a boundary theorem. At the boundary, S6 and T6:comparison supply the actual logarithmic and diamond-site torsors.

## Finite identities, determinant line and Siegel instances

The checkpoint's five matrix lemmas are retained at their useful algebraic generality, including the empty finite index set. Geometric genus is positive. The Atkin–Lehner lemma adds the canonical-chart conversion. The determinant line is a concrete map into the existing pointwise function module; it has no hidden analytic hypothesis. An analytic restriction is made only after O0 supplies a uniform analytic character extension.

The finite rank determinant line and the entire analytic induced module have different roles. For a determinant character χ, the function ℓ↦χ(det ℓ) spans an equivariant line. The O1 equalizer for that line is the scalar coefficient sheaf, and at χ(u)=u^m it gives det(ω)^m for every integer m, using duals for negative m. In genus at least two the full induced module has analytic functions in lower-unipotent coordinates; a constant determinant weight does not make all those functions disappear. Algebraic highest-weight coefficients map into analytic induction by restriction, and the source comparison supplies an injection rather than a general isomorphism of the full fibres.

The right-torsor fibre relation is (qh,v)∼(q,ρ(h)v), equivalently (q,v)∼(qh,ρ(h)⁻¹v). A section corresponds to f(qh)=ρ(h)⁻¹f(q). This is the exact B0 sections-equivariant convention. The full upper-unipotent invariance accompanies a Borel character; imposing only a torus character on the full frame torsor yields too many regular functions. B2 fixes the highest-weight/dual conversion, while B4/siegel-coefficient owns the Schur and determinant bundle definition. The scalar and finite representation comparisons use this associated-bundle route, without asserting that the printed antidiagonal intertwiners in DRW Proposition 3.3.10 are valid.

### Normalisation of a Siegel row graph

Declaration: `TauCeti.Overconvergent.Siegel.graph_normalisation` (`OverconvergentAutomorphicForms:O8/graph-normalisation`).

Put J=A+ZC and Zγ=J⁻¹(B+ZD). If det J is a unit, then [I,Z][A,B;C,D]=J[I,Zγ]. Here [I,Z] is Matrix.fromCols I Z and J⁻¹ is the nonsingular matrix inverse.

Hypotheses:

- R is a commutative ring; the matrix index set n is finite with decidable equality.
- All displayed blocks and Z are square n by n matrices. These algebraic statements include the empty index set; the geometric application has g≥1.
- det(A+ZC) is a unit.

Construction or proof route:

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

Construction or proof route:

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

Construction or proof route:

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

Construction or proof route:

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

Construction or proof route:

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

### Transformation of the Hodge–Tate frame

Declaration: `TauCeti.Overconvergent.Siegel.hodge_frame_transformation` (`OverconvergentAutomorphicForms:O8/hodge-frame-transformation`).

On Y_w let s=(s₁,…,s_g) be the frame of the pulled-back Hodge bundle obtained from the first g coordinate sections of the dual universal Lagrangian by the S3 isomorphism π_HT*W∨≅h*ω. Then, for γ=[A,B;C,D]∈K, γ*s=s(A+ZC). Consequently the right frame torsor is trivialized by s, with transition matrix Jγ(Z)=A+ZC.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- The open period domain is defined by the supplied S3 map. When calling it a proven canonical/anticanonical neighbourhood, use the T3 comparison with p>2g and its stated radii; the mere period-domain definition requires no canonical-subgroup theorem.

Construction or proof route:

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
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.

Construction or proof route:

1. Apply the top exterior power to hodge-frame-transformation.
2. In a local determinant-line trivialization, Module.Basis.det_apply identifies the coefficient with det J; AlternatingMap.eq_smul_basis_det identifies every alternating coordinate evaluation with that determinant.
3. The determinant-line constructions and gluing are imported from B4; invertibility of J shows η remains a frame.

Dependencies: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`, `mathlib:Module.Basis.det_apply`, `mathlib:AlternatingMap.eq_smul_basis_det`, `mathlib:Matrix.GeneralLinearGroup.det`, `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B0/sections-equivariant`.

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
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.
- An actual O0 analytic character and its extension to the determinant neighbourhood are supplied.
- For a character initially on Z_p× use an O0 r-analytic extension and w>r+1; no assertion for a merely continuous character without that extension.
- O1 supplies the sheaf-category equalizer on this quotient and the relevant completed coefficient functions.

Construction or proof route:

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
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.
- The B4 determinant line, its duals and tensor powers, and O1 effective descent for this finite-rank coefficient object are supplied.

Construction or proof route:

1. determinant-frame-transformation gives γ*(η^⊗m)=det(Jγ)^mη^⊗m, using duals for negative weights.
2. Multiply by the coefficient law det(Jγ)^(−m); the product is invariant and descends through O1.
3. Conversely pull back a determinant-line section and express it uniquely in the frame η^⊗m. Invariance gives exactly the scalar coefficient law.
4. The two maps are inverse on the torsor. Faithfulness in the imported descent equivalence gives the isomorphism downstairs.

Dependencies: `OverconvergentAutomorphicForms:O8/scalar-coefficient-identification`, `OverconvergentAutomorphicForms:O8/determinant-frame-transformation`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`, `mathlib:mul_zpow`, `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B0/sections-equivariant`.

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
- Use the genuine open period domain from S3; an identification with canonical/anticanonical Hasse domains additionally requires the quantitative T3 comparison, including p>2g where DRW §3.6 uses it. Boundary statements use the separate toroidal nodes below.
- V is finite-dimensional and ρ algebraic; O0 supplies its analytic restriction.
- B4 supplies Q and its associated bundle with the stated right-torsor convention, and O1 supplies effective descent.

Construction or proof route:

1. Pull back Q and trivialize it by the actual frame s from hodge-frame-transformation.
2. The associated-bundle relation converts sγ=sJγ into the coefficient change ρ(Jγ)⁻¹. factor-composition proves that these changes compose correctly; O1 supplies the generic representation-valued descent theorem.
3. Apply the O1 equivalence to the equivariant trivial bundle and the pullback of Eρ, whose transition maps agree. This proves the isomorphism.
4. For comparison with the induced highest-weight model, keep the corrected antidiagonal_dual_factor available, but do not infer equality with its infinite-dimensional analytic enlargement.

Dependencies: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`, `OverconvergentAutomorphicForms:O8/factor-composition`, `OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`, `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B2/levi-highest-weight-convention`.

Acceptance:

- The standard representation recovers ω with its rank g.
- The determinant representation agrees with determinant-hodge-specialisation at m=1.
- The dual standard representation recovers ω∨.
- A Schur representation recovers the corresponding B4 Schur-functor bundle.
- For g≥2, specializing an analytic induced module at an algebraic weight is not asserted to collapse to this finite-rank representation.

Source: DRW v3, Corollary 2.4.2, p. 17; §3.4 and Proposition 3.4.3, pp. 37–38. The finite-representation recovery is proved through the frame torsor with an explicit associated-bundle convention. The source motivates the comparison; its printed highest-weight torsor description and intertwiner require the recorded corrections.

### Determinant eigenline in Siegel coefficients

Declaration: `TauCeti.Overconvergent.Siegel.determinantLineMap` (`OverconvergentAutomorphicForms:O8/determinant-line-map`).

For a finite index set n, commutative rings R,S and a homomorphism χ:R×→S×, construct the S-linear map Lχ:S→(GL(n,R)→S), Lχ(a)(g)=a·χ(det g). Its image is the rank-one free determinant-character line, canonically isomorphic to S. This is the specific Siegel scalar eigenline embedding, not a new definition of induction or analytic functions. For an O0 character defined only on the determinant neighbourhood of an analytic Iwahori, the same formula is constructed directly on that group. Its multiplicativity and analyticity use the local O0 extension; no extension to every unit of C_p is asserted.

Hypotheses:

- n is finite with decidable equality; R,S are commutative rings; χ is a homomorphism into units.
- No analyticity or geometric assertion is made about the unrestricted function module.

Construction or proof route:

1. Use the pointwise S-module on functions and the existing determinant homomorphism to construct the bundled LinearMap.
2. Evaluate at the identity to obtain a left inverse, hence injectivity; use multiplicativity of determinant for both translation laws.
3. For analytic coefficients, repeat this formula on the actual Iwahori group using the O0 local character extension on its determinant image; use determinant multiplicativity and evaluation at the identity there. A globally defined χ is required only for the unrestricted finite prototype. No identification with the whole induced module follows.

Dependencies: `mathlib:LinearMap`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.GeneralLinearGroup.mkOfDetNeZero`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_transpose`.

Acceptance:

- Evaluation at the identity recovers a, including over a ring with zero divisors.
- For χ=id over Q and g=diag(2,3), Lχ(1)(g)=6; a constant-function embedding gives the wrong answer.
- Every upper-unipotent genus-two g has value 1 for L_id(1).

Uses and API:

- O8 scalar determinant weights and DRW Definition 3.1.14: Identifies the finite determinant line inside the induced coefficient space and derives its inverse descent factor.
- O8 determinant Hodge specialization and DRW Proposition 3.4.3: Tests the distinction between the rank-one classical subobject and the full analytic sheaf.

- `TauCeti.Overconvergent.Siegel.determinantLineMap_apply` (simp): Lχ(a)(g)=a·χ(det g).
- `TauCeti.Overconvergent.Siegel.determinantLineMap_at_one` (projection): Lχ(a)(1)=a.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_injective` (characterisation): Lχ is injective; its image is canonically a copy of S.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_left_translate` (relation): Lχ(a)(hg)=χ(det h)·Lχ(a)(g).
- `TauCeti.Overconvergent.Siegel.determinantLineMap_right_translate` (relation): Lχ(a)(gb)=χ(det b)·Lχ(a)(g); this includes the full upper-unipotent invariance used in Borel induction.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_trivial` (compatibility): For the trivial character, Lχ(a) is the constant function with value a.

Unit tests:

- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_trivial` (degenerate): For χ=1, every a and g satisfy Lχ(a)(g)=a.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_diagonal` (computation): For R=S=Q, χ=id, a=1 and the genuine GL₂ element diag(2,3), Lχ(1)(g)=6.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_unipotent` (computation): For R=S=Q, χ=id and g=[1,7;0,1], Lχ(1)(g)=1.
- `TauCeti.Overconvergent.Siegel.determinantLineMap_test_evaluation` (characterisation): For any χ and a,b, equality Lχ(a)=Lχ(b) implies a=b, by evaluation at 1.

Source: DRW v3, Definitions 3.1.10 and 3.1.14, pp.23–24; Proposition 3.4.3, p.38. The determinant function gives a concrete finite-character submodule of the displayed induced coefficient module. The unrestricted algebraic map is its directly derived reusable interface.

### Analytic Siegel coefficient sheaves

Declaration: `TauCeti.Overconvergent.Siegel.siegel_analytic_instance` (`OverconvergentAutomorphicForms:O8/siegel-analytic-instance`).

Let U=Spa(A,A+) be a bounded smooth weight family on the diagonal torus of GL_g with an O0 uniform r-analytic character κ, trivial on the upper-unipotent subgroup. For rational w>1+r, use the O0 coefficient module Cκ^(w-an)(Iw_GLg,B) of analytic functions satisfying f(ℓb)=κ(b)f(ℓ), with representation ρκ(h)f(ℓ)=f(hᵀℓ). On the supplied Siegel domain X_w, O1 applied to Jγ=Aγ+ZCγ yields the sheaf whose sections on V are analytic coefficients F on Y_w×_Xw V satisfying γ*F=ρκ(Jγ)⁻¹F. Its restriction and bounded family maps are the O1 maps. For κ=χ∘det the determinantLineMap formula, evaluated directly on the actual Iwahori with the O0 local extension of χ, identifies a rank-one subobject with scalar-coefficient-identification, not the entire induced sheaf.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- w>1+r; the family has a uniform character extension, analytic action of all occurring Jγ, and completed coefficients supplied by O0.
- The period-domain application uses p odd. A canonical-domain assertion uses the T3 quantitative comparison with p>2g. Integral assertions require the analytic Gauss lattice, not pointwise integral values.

Construction or proof route:

1. Import the analytic Iwahori module, transpose-left representation and bounded base-change interface from O0.
2. Use hodge-frame-transformation and factor-composition to supply the actual right-action factor to O1; the inverse representation order is ρ(Jδ(Zγ))⁻¹ρ(Jγ(Z))⁻¹.
3. Apply the O1 sheaf/restriction/family construction; evaluate the determinantLineMap formula on the actual analytic group using the local O0 character to obtain the scalar subobject. A character initially on Z_p× is not assumed to extend to all C_p×.

Dependencies: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`, `OverconvergentAutomorphicForms:O8/factor-composition`, `OverconvergentAutomorphicForms:O8/determinant-line-map`, `OverconvergentAutomorphicForms:O8/scalar-coefficient-identification`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`.

Acceptance:

- The identity group element acts identically and two noncommuting genus-two elements satisfy the correct shifted cocycle.
- At κ=1 and g≥2, analytic functions in the lower-unipotent coordinate survive; the entire fibre is not the one-dimensional constant line.
- At g=1 the unipotent coordinate set is empty and the determinant induced module is a character line.
- Restriction to a smaller supplied radius domain and bounded weight specialization agree with O1, under its analytic hypotheses.

Source: DRW v3, Definition 3.1.10, Remark 3.1.13 and Definition 3.1.14, pp.23–25. The displayed induced-module sheaf is instantiated through O0/O1; the inverse factor and genus are retained.

### Algebraic coefficients inside analytic Siegel coefficients

Declaration: `TauCeti.Overconvergent.Siegel.algebraic_induced_injection` (`OverconvergentAutomorphicForms:O8/algebraic-induced-injection`).

For a dominant polynomial weight k=(k₁≥⋯≥k_g≥0), take the algebraic Borel-equivariant realization P_k of regular functions GL_g→A¹ with f(ℓb)=k(b)f(ℓ), using the transpose-left representation ρ_k of DRW Definition 3.4.2. On the same X_w with w>1+r_k, restriction of regular functions to the analytic Iwahori group induces a monomorphism E_{ρ_k}|X_w→ω_k,w, functorial in open restriction. E_{ρ_k} is the B4 bundle after the B2 highest-weight/dual conversion has identified this specific realization. This is an injection; no equality with the entire analytic induced module is asserted for g≥2. The scalar polynomial weight k=(m,…,m), m≥0, gives the determinant Hodge line subobject. Negative determinant weights are handled by finite-line dual descent, independently of this polynomial-weight source theorem.

Hypotheses:

- g≥1, p odd, N≥3 prime to p; work over C_p with a fixed compatible system of p-power roots of unity when identifying Hodge–Tate twists.
- K is the group-theoretic strict Iwahori, the inverse image of the diagonal torus of GSp(2g,F_p). Its definition uses the full tower quotient, not the inadequate moduli data in source issue E-O8-1.
- Y_w is the open Siegel infinite-level domain π_HT⁻¹(Fl×_w), X_w=Y_w/K, w>0 rational; S1/S3 supply the actual spaces, action, quotient torsor and period-map equivariance. Fl×_w consists of graph coordinates whose entries are within p^(−w) of Z_p.
- The O0 restriction map from the algebraic induced realization to analytic induction is an equivariant injection; it includes full right-Borel equivariance, not merely torus eigenvectors.
- The B2 weight convention identifies ρ_k with the required B4 coefficient; no unproved equality of a representation and its dual is assumed.

Construction or proof route:

1. Use the genuine regular-function/Borel-equivariant algebraic realization from O0 and B4/B2, together with its analytic restriction monomorphism.
2. Apply algebraic-levi-specialisation to its finite fibre representation; compare with siegel-analytic-instance under the same Jγ.
3. Descend the equivariant injection by O1. The finite associated-bundle route bypasses the incorrect frame-factor order in the printed Proposition 3.3.10.

Dependencies: `OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation`, `OverconvergentAutomorphicForms:O8/siegel-analytic-instance`, `AutomorphicBundles:B2/levi-highest-weight-convention`, `AutomorphicBundles:B4/siegel-coefficient`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`.

Acceptance:

- For g=1 the map identifies the character fibre, and for constant dominant weights its finite source is det(ω)^m.
- For g=2, k=0, nonconstant analytic functions of the lower-unipotent coordinate show why surjectivity must not be claimed.
- The regular function x11*x22/det(x) is torus invariant but not right-upper-unipotent invariant; it is excluded from P_0.

Source: DRW v3, Definition 3.4.2 and Proposition 3.4.3, p.38. The finite realization and its analytic inclusion are retained; the classical frame sheaf is corrected to full Borel equivariance.

### Atkin–Lehner change of Siegel graph chart

Declaration: `TauCeti.Overconvergent.Siegel.atkin_lehner_chart` (`OverconvergentAutomorphicForms:O8/atkin-lehner-chart`).

For a finite index set n and commutative ring R, let q∈R. Then [I,Z][0,I;−qI,0]=[−qZ,I]. Thus over a p-adic coefficient field the Atkin–Lehner matrix with q=p changes the anticanonical graph coordinate Z to the canonical-chart coordinate Z′=−pZ. The graph identity alone says nothing about canonical subgroups or domain quotients.

Hypotheses:

- n finite with decidable equality; R commutative; q any element for the first identity and q a unit for the inverse formula.

Construction or proof route:

1. Apply Matrix.fromCols_mul_fromBlocks and simplify the scalar block products.
2. Verify both block inverse products with Matrix.fromBlocks_multiply; specialize q to p in the coefficient field.
3. Import the actual quotient/domain map from T3/S3 when using this identity to transport sheaves.

Dependencies: `mathlib:Matrix.fromCols_mul_fromBlocks`, `mathlib:Matrix.fromBlocks_multiply`.

Acceptance:

- At genus one [1,z] maps to [−qz,1]; the sign and factor q are both visible.
- The formula holds at Z=0, including q=0; invertibility is asserted only for units q.

Source: DRW v3, §3.6, Atkin–Lehner display and canonical-chart coordinates, p.42. The finite chart identity isolates the coordinate conversion from the imported canonical-subgroup theorem.

## Toroidal and datum-specific instances

For general toroidal coefficients the infinite tower is the inverse limit in diamonds supplied by S6. BP Theorem 4.4.40 identifies the pullback canonical Levi torsor with M_HT, and T6:comparison owns its relation M_HT=M_dR×^{μ,Zp×}Zp(1). The finite associated-bundle consequence retains that μ-cyclotomic twist. On a μ-weight-j representation summand it appears as a Tate factor Qp(j); an untwisted arithmetic identity is not substituted. B3.general/general-canonical-extension supplies the normalized canonical boundary extension. An arbitrary extension of an open vector bundle is insufficient.

The datum-specific application takes an actual reduction Q_H→U as input. It does not define a class of geometries through a proposition saying that a desired theorem holds. Unitary domains are included under this supplied-input contract. The explicit broader instance read here is BP's quasi-split abelian-type Bruhat-period-domain construction. Its level group Kp,m′,b′ is defined from a chosen integral model and reduction to the Borel and unipotent radical; it is not a generic principal congruence subgroup. The projected Levi compact group can differ from a full independently chosen Iwahori, as BP Example 4.6.10 demonstrates.

The finer torsor reduction requires 0≤m−n≤m′−1. The analytic family uses the m=n reduction and its affinoid-group pushout. After making the cyclotomic containment choice of field, its coefficient functions satisfy the specific Borel equation in §6.3.1. The conversion ν→κ includes the Weyl and root correction −w0,Mwν−(w0,Mwρ+ρ). Keeping that conversion is essential to the finite coefficient injection. No locally projective Banach conclusion is imported from §6.3.3 without its finite trivialization/affinoid conditions; the O8 target here is the coefficient construction and its finite comparison. This avoids converting a coefficient instance into a general representability, ordinary-locus or classicality theorem.

### Coefficients on the toroidal tower diamond

Declaration: `TauCeti.Overconvergent.Siegel.toroidal_coefficient_instance` (`OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance`).

For the genuine toroidal tower diamond D and period map π_HT^tor:D→FL supplied by S6, pull back the canonical M^c_μ-torsor on FL. Given a representation V in the O0/O1 coefficient category with an actual analytic action of M^c_μ (or a supplied reduction), form its associated coefficient object on D using O1. It is functorial in equivariant representation maps and agrees with the open-domain construction on the open Shimura subdiamond. Finite-level descent is asserted only for the effective descent data exported by O1; infinite Banach descent is not deduced from a pro-étale torsor alone. The construction uses diamonds and does not assert representability of D by a perfectoid space.

Hypotheses:

- A Shimura datum (G,X), neat finite level K=K^pKp and a smooth admissible toroidal cone system Σ in characteristic zero; F/Qp finite contains the reflex field and splits G and μ as in BP §4.4.
- Use G^c and M^c_μ, the central quotient and Levi of the imported canonical coefficient construction; the Hodge and Hodge–Tate parabolics are opposite.
- S6 supplies the inverse-limit toroidal diamond D, its G(Qp) action and period map; T6:comparison supplies the canonical torsor comparison including the μ-cyclotomic twist. The relevant completed structure sheaf and descent category are supplied by O1.
- The chosen fibre object belongs to the supplied descent category; a torus character alone is not an action of the full Levi.

Construction or proof route:

1. Import S6 and T6:comparison, specifically BP Theorem 4.4.40, rather than reconstructing logarithmic period sheaves or the period map.
2. Apply the existing O1 associated coefficient functor to the actual pullback torsor and the specified full group action/reduction.
3. Use functoriality and restriction in O1 for representation morphisms and the open embedding; retain the boundary site.

Dependencies: `PerfectoidShimuraVarieties:S6`, `HodgeTateAndCanonicalSubgroups:T6:comparison`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B0/sections-equivariant`.

Acceptance:

- The trivial finite fibre gives the completed structure sheaf on D.
- The Siegel open restriction with its chosen graph frame gives the same Jγ as hodge-frame-transformation.
- A character given only on a compact torus cannot be used on the full Levi without an analytic extension or an actual reduced torsor.

Source: Boxer–Pilloni author version, §4.4.38–4.4.40, pp.79–80. The geometry/torsor identification is imported from S6/T6; O8 applies the generic coefficient functor.

### Toroidal algebraic coefficients and the cyclotomic twist

Declaration: `TauCeti.Overconvergent.Siegel.toroidal_algebraic_comparison` (`OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison`).

For a finite-dimensional algebraic representation ρ of M^c_μ, the finite coefficient object associated to π_HT^tor* (G^c,an/U_P) on D is isomorphic to the pullback of the canonical toroidal automorphic bundle Eρ^can associated to M_dR, twisted by the μ-action on Zp(1). On a μ-central summand where ρ∘μ has character t↦t^j, this is h*Eρ^can⊗Qp(j) after completed scalar extension. Without a chosen compatible root system the Tate line must remain in the statement. The comparison is compatible with tensor products, duals, representation morphisms and restriction to the open subdiamond.

Hypotheses:

- A Shimura datum (G,X), neat finite level K=K^pKp and a smooth admissible toroidal cone system Σ in characteristic zero; F/Qp finite contains the reflex field and splits G and μ as in BP §4.4.
- Use G^c and M^c_μ, the central quotient and Levi of the imported canonical coefficient construction; the Hodge and Hodge–Tate parabolics are opposite.
- S6 supplies the inverse-limit toroidal diamond D, its G(Qp) action and period map; T6:comparison supplies the canonical torsor comparison including the μ-cyclotomic twist. The relevant completed structure sheaf and descent category are supplied by O1.
- ρ is algebraic and finite-dimensional; canonical toroidal extension is the normalized one supplied by B3.general. On an arithmetic base retain the Tate line; on C_p an untwisted formula requires a fixed trivialization.

Construction or proof route:

1. Use the S6/T6 identification M_HT=M_dR×^{μ,Zp×}Zp(1) from BP Theorem 4.4.40.
2. Apply the associated finite coefficient functor and B0 sections-equivariant, and use the B3.general canonical extension rather than an arbitrary boundary extension.
3. Decompose according to the central μ-weights when giving the explicit Tate-summand formula; use tensor/dual compatibility of the imported torsor equivalence.

Dependencies: `OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance`, `PerfectoidShimuraVarieties:S6`, `HodgeTateAndCanonicalSubgroups:T6:comparison`, `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B0/sections-equivariant`.

Acceptance:

- The trivial representation has j=0 and gives the structure sheaf comparison.
- For a μ-weight-one line the comparison retains Qp(1); dropping it changes arithmetic Galois descent.
- After the specified Siegel twist trivialization, restriction to the graph domain agrees with determinant-hodge-specialisation and algebraic-levi-specialisation.

Source: Boxer–Pilloni author version, §4.4.38–4.4.40, pp.79–80. The torsor identity is transported through the finite associated-bundle functor; Tate weights are retained.

### Coefficients on a supplied datum-specific reduction

Declaration: `TauCeti.Overconvergent.Siegel.supplied_domain_instance` (`OverconvergentAutomorphicForms:O8/supplied-domain-instance`).

For a unitary or other Shimura datum, let U be an actual analytic domain in its finite-level variety or toroidal diamond, Q_H→U an actual analytic H-torsor reduction of the canonical Levi torsor supplied by its geometry owner, and V an O0 analytic coefficient with an action of H. The O1 coefficient sheaf associated to (Q_H,V) is the datum-specific instance on U. For finite algebraic V extending to the Levi, extension of structure group identifies this sheaf with the canonical B4 datum-specific bundle restricted to U, with any T6 cyclotomic twist retained. A morphism of supplied domains/reductions induces the O1 coefficient pullback map. This statement constructs no ordinary locus and assumes no canonical subgroup for arbitrary data.

Hypotheses:

- The datum, characteristic-zero coefficient base, level, actual domain and topology are supplied, not encoded by an unspecified proposition.
- Q_H is a genuine reduction and V has an analytic H-action at its proven radius; O1 supplies effective descent in this category.
- For the finite comparison, V extends algebraically to the full Levi and B4 supplies that datum-specific associated bundle.

Construction or proof route:

1. Import the supplied analytic reduction and its map to the canonical Levi torsor.
2. Instantiate O1 on this reduction with the supplied O0 fibre action; use associated-torsor extension of structure group for finite algebraic V.
3. Transport the B4 bundle through that equivalence and the T6 twist; obtain pullback naturality directly from O1.

Dependencies: `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`, `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B4`, `PerfectoidShimuraVarieties:S6`, `HodgeTateAndCanonicalSubgroups:T6:comparison`.

Acceptance:

- With a trivial reduction the coefficient sheaf is the corresponding function sheaf tensored with V.
- With the Siegel Hodge-frame reduction the result recovers the Siegel nodes in this packet.
- Changing a frame by h changes coefficient coordinates by ρ(h)⁻¹; a noncommuting pair tests the order.
- An arbitrary unitary datum without a supplied analytic reduction is outside the hypotheses.

Source: Boxer–Pilloni author version, §4.6.12, pp.94–95 and §6.3.1, p.153. The analytic reduction is imported as data; its associated coefficient formalism supplies the instance. BP proves a specific such reduction under its own hypotheses.

### Coefficient families on Bruhat period domains

Declaration: `TauCeti.Overconvergent.Siegel.bruhat_reduced_family` (`OverconvergentAutomorphicForms:O8/bruhat-reduced-family`).

In the BP quasi-split abelian-type setting, choose a split finite coefficient field F, compatible reductive O_F model and rational Borel/torus, neat tame level and toroidal Σ. Let Kp=Kp,m′,0 with m′>0 and w∈^M W. For n≥0 use the supplied étale reduction M_dR,n,Kp on U_w,n=(π_HT,Kp^tor)⁻¹(]C_w,k[_n,n Kp), under H=Kp,w,Mμ^c Mμ,n^c. For a complete Tate affinoid (A,A+) over (F,O_F) and n-analytic ν_A:T^c(Zp)→A×, put κ_A=−w0,M wν_A−(w0,M wρ+ρ), using BP additive weight notation and the same positive roots. The O0/O1 coefficient sheaf on U_w,n is the BP §6.3.1 sheaf of functions on M_dR,n,Kp×Spa(A,A+) satisfying f(mb)=(w0,M κ_A)(b⁻¹)f(m) for b∈B^c∩H. When ν is algebraic and κ is Mμ-dominant, it admits the finite canonical coefficient injection Vκ→Vν^(n-an) of BP Proposition 6.3.6. This supplies a proved datum-specific reduction instance beyond a universal ordinary neighbourhood claim.

Hypotheses:

- G_Qp is quasi-split; G splits over F; use the actual integral model and Kp,m′,0 of BP §3.5.1, not a guessed principal-congruence subgroup.
- The toroidal setup is of abelian type as in the reduction section; F is enlarged when needed so the μ-cyclotomic image lies in the reduction group.
- For the precursor reduction with m,n≥0 require 0≤m−n≤m′−1 (BP Proposition 4.6.12); the family uses m=n and the pushout on p.95.
- O0 supplies the analytic induction with precisely this character, root shift and action; O1 supplies completed analytic descent. No local projectivity claim is made without the finite-trivializing cover conditions.

Construction or proof route:

1. Import the S6 reduction theorem with the BP radius/level and cyclotomic hypotheses, then push out the m=n reduction to the affinoid thickening group H.
2. Use the O0 analytic induced realization with ν→κ and the exact Borel-equivariance convention; instantiate supplied-domain-instance.
3. For algebraic κ dominant, restrict regular Borel-equivariant functions to analytic ones, then apply O1 to the finite injection; import the canonical coefficient from B4/B2.

Dependencies: `OverconvergentAutomorphicForms:O8/supplied-domain-instance`, `PerfectoidShimuraVarieties:S6`, `OverconvergentAutomorphicForms:O0`, `OverconvergentAutomorphicForms:O1`, `AutomorphicBundles:B2/levi-highest-weight-convention`, `AutomorphicBundles:B4`.

Acceptance:

- The root correction w0,M wρ+ρ remains visible; replacing ν by κ without it gives the wrong finite coefficient.
- For a torus Levi there are no unipotent analytic coordinates; the fibre is the character line.
- The n=n radius choice satisfies the reduction inequality for every m′>0, whereas m−n>m′−1 is excluded.
- For G=Res_Qp²/Qp GL₂ and the mixed cocharacter of BP Example 4.6.10, Kp,w,Mμ is the actual projected subgroup, not an independently chosen full product Iwahori.

Source: Boxer–Pilloni author version, §4.6.8–4.6.15, pp.92–95; §6.3.1 and Proposition 6.3.6, pp.153–154. The source proves the explicit Bruhat-domain reduction and instantiates analytic induction; only this coefficient-level application belongs to O8.

## Supplier interfaces and ownership

Every external proof leaf is an exact packet node or an explicit stage request. The current B0 packet supplies B0/sections-equivariant, B0/hodge-parabolic-convention, B2/levi-highest-weight-convention, B4/siegel-coefficient and B3.general/general-canonical-extension. Their full statements were read before importing them. The current O0 packet is specific to Hilbert unit/norm characters; it does not provide the general GL_g induced module needed here. Generic analytic induction, logarithmic comparison, canonical subgroups and period maps are not planned again in O8.

### PerfectoidShimuraVarieties:S1

Open Siegel infinite-level tower with a right group action, the group-theoretic strict-Iwahori quotient and the pro-étale torsor on the open domain. Use inverse image of the full diagonal torus modulo p; source E-O8-1 rules out defining that quotient by only g order-p subgroups.

Consumers: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`.

### PerfectoidShimuraVarieties:S3

Actual equivariant Siegel period map, row-graph chart, stable domains Fl×_w and π_HT*W∨≅h*ω with first-g-coordinate frame and specified Tate trivialization. Include the determinant-neighbourhood bound for A+ZC at strict-Iwahori level.

Consumers: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`.

### HodgeTateAndCanonicalSubgroups:T3

Siegel extension of the quantitative canonical-subgroup domain interface: DRW §3.6 uses p>2g, Z′=−pZ, and Proposition 3.6.12 requires c_g+n−1<w≤n, c_g=(2g−1)p/(2g(p−1)). Export the cofinal Hasse/period-domain comparison with actual radius bounds and a uniform affinoid argument; do not use Corollary 3.6.13 under its weaker printed inequality or infer a uniform strict bound from pointwise bounds. This is additional Siegel input in the existing T3 direction, not an O8 construction.

Consumers: `OverconvergentAutomorphicForms:O8/hodge-frame-transformation`, `OverconvergentAutomorphicForms:O8/siegel-analytic-instance`.

### OverconvergentAutomorphicForms:O0

Export uniform analytic characters and full GL_g/Levi Iwahori induced coefficient modules, transpose-left actions, bounded family/radius maps, Gauss lattices, analytic restriction of finite algebraic representations, and injectivity of restriction of regular full-Borel-equivariant functions. For BP retain κ=−w0,M wν−(w0,M wρ+ρ). The current O0 packet treats Hilbert unit/norm characters and does not provide these higher-rank interfaces.

Consumers: `OverconvergentAutomorphicForms:O8/scalar-coefficient-identification`, `OverconvergentAutomorphicForms:O8/determinant-hodge-specialisation`, `OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation`, `OverconvergentAutomorphicForms:O8/siegel-analytic-instance`, `OverconvergentAutomorphicForms:O8/algebraic-induced-injection`, `OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance`, `OverconvergentAutomorphicForms:O8/supplied-domain-instance`, `OverconvergentAutomorphicForms:O8/bruhat-reduced-family`.

### OverconvergentAutomorphicForms:O1

Export the genuine coefficient-sheaf/associated-torsor functor with open restriction, bounded family maps, equivariant monomorphism descent and effective finite-rank descent on the supplied analytic, pro-Kummer-étale and diamond/v-site categories. Retain Jγδ(x)=Jγ(x)Jδ(xγ), hence inverse coefficient order ρ(Jδ(xγ))⁻¹ρ(Jγ(x))⁻¹. No effectivity of arbitrary Banach pro-étale descent may be assumed.

Consumers: `OverconvergentAutomorphicForms:O8/scalar-coefficient-identification`, `OverconvergentAutomorphicForms:O8/determinant-hodge-specialisation`, `OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation`, `OverconvergentAutomorphicForms:O8/siegel-analytic-instance`, `OverconvergentAutomorphicForms:O8/algebraic-induced-injection`, `OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance`, `OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison`, `OverconvergentAutomorphicForms:O8/supplied-domain-instance`, `OverconvergentAutomorphicForms:O8/bruhat-reduced-family`.

### AutomorphicBundles:B4

Supply the analytification of the genuine Siegel Hodge-frame associated bundles and the unitary/other datum-specific canonical finite coefficient for the supplied analytic reduction. Reuse B4/siegel-coefficient, B0/sections-equivariant and B2/levi-highest-weight-convention for existing algebraic definitions; only analytic compatibility and the precise non-Siegel instance are requested.

Consumers: `OverconvergentAutomorphicForms:O8/supplied-domain-instance`, `OverconvergentAutomorphicForms:O8/bruhat-reduced-family`.

### PerfectoidShimuraVarieties:S6

Export the actual toroidal inverse-limit diamond, its group action and canonical Levi-torsor pullback of BP Theorem 4.4.40. Also export the abelian-type quasi-split Bruhat-domain reduction of BP Proposition 4.6.12 with 0≤m−n≤m′−1, the cyclotomic containment after enlarging F, the m=n pushout on p.95 and the projected Kp,w,Mμ group. Its proof is geometry owned by S6, not a second O8 period-map construction.

Consumers: `OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance`, `OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison`, `OverconvergentAutomorphicForms:O8/supplied-domain-instance`, `OverconvergentAutomorphicForms:O8/bruhat-reduced-family`.

### HodgeTateAndCanonicalSubgroups:T6:comparison

Canonical logarithmic local-system/de Rham comparison and M_HT=M_dR×^{μ,Zp×}Zp(1), tensor/dual compatible over the toroidal boundary, as BP §4.4.38–4.4.40. Retain the opposite parabolics, G^c quotient, Tate weight and arithmetic descent; an open abelian comparison cannot replace this boundary theorem.

Consumers: `OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance`, `OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison`, `OverconvergentAutomorphicForms:O8/supplied-domain-instance`.

## Source findings

The following findings preserve all eleven checkpoint IDs and add three exact local discrepancies found during the canonical-domain and boundary reading. They are unreviewed, confined to arXiv v3, and make no claim of priority. The arXiv version history and author research page, together with public title/author correction searches, were checked on 6 October 2026; no relevant correction was located. The author page's linked erratum is for a different article. Earlier preprint versions and the publisher PDF were not compared. Independent verification must distinguish a local misprint or proof gap from a counterexample to a main theorem.

### E-O8-1 — Definition 2.2.1(iv) and Remark 2.2.2, pp. 10–11 (rendered); arXiv v3 only

Error. Printed fragment: “{Ci : i = 1, ..., g}”. Define the strict-Iwahori level by the full-level tower quotient by the inverse image of the diagonal torus. A moduli description needs enough ordered symplectic line data to have that stabilizer, not only g pairwise-disjoint order-p subgroups.

For g=1 a single order-p subgroup is one line in F_p². Its stabilizer is a Borel, which contains nontrivial unipotents and is strictly larger than the diagonal torus. Under the source row convention the matrix [1,0;1,1] fixes the first row line and is not diagonal. The displayed block-diagonal stabilizer assertion therefore fails already in genus one. For larger g, pairwise disjointness also does not assert joint independence or isotropy.

### E-O8-2 — §2.3 normalized basis, p. 14 (rendered), against §2.1 p. 7; arXiv v3 only

Misprint. Printed fragment: “(⟨w□i , e2g+1−j ⟩)1≤i,j≤g = 1g”. With the pairing matrix [0,−W;W,0] and graph basis e_i+Σ_j Z_ij e_{g+j}, normalize this pairing matrix to −I. Equivalently reverse the pairing arguments. Keep the [I,Z] graph convention used in the subsequent calculations.

At Z=0, the displayed graph basis is e_i and §2.1 gives ⟨e_i,e_{2g+1−j}⟩=−δ_ij. The equations on p. 14 cannot simultaneously have the stated +I normalization and the positive e_i leading term.

### E-O8-3 — Lemma 2.2.5, final identity, p. 13; arXiv v3 only

Misprint. Printed fragment: “hIw,∗”. The final strict-Iwahori identity must use h_Iw+,∗.

The left-hand side is a sheaf on X_Iw+; h_Iw,∗ has target X_Iw. The proof describes the second pair as the same construction at strict-Iwahori level.

### E-O8-4 — Remark 3.1.7, p. 22 (rendered); arXiv v3 only

Misprint. Printed fragment: “p⌈r⌉”. The closed balls partitioning Z_p^n have radius p^(−ceil(r)) under |p|=p^(−1).

Their underlying cosets are a+p^ceil(r) Z_p^n. A ball of radius p^ceil(r)>1 is not such a coset; the surrounding formulas use the negative exponent.

### E-O8-5 — Definition 3.1.6(iii) and Remark 3.1.7, p. 22 (rendered); arXiv v3 only

Error. Printed fragment: “with value in B◦”. The unit ball for the displayed analytic Gauss norm requires integral bounds on the analytic extension to each C_p-disc, equivalently on all scaled coefficients. Pointwise values on Z_p^n alone do not give that lattice.

Take r=1,n=1,B=C_p and an odd prime p. On pZ_p set f(x)=((x/p)^p−x/p)/p and set f=0 on each other residue class. This is 1-analytic and O_Cp-valued on every Z_p point by Fermat reduction. On the 0+pZ_p chart its series in T/p has coefficients 1/p and −1/p, so its radius-p^(−1) Gauss norm is p>1. Thus the stated pointwise lattice is larger than the analytic Gauss unit ball.

### E-O8-6 — Remark 3.1.12, p. 23 (rendered); arXiv v3 only

Misprint. Printed fragment: “κU|U(w)GLg,0 = 0”. The multiplicative character restricts to 1 on the unipotent subgroup, as in Definition 3.1.10(ii).

A homomorphism into units sends the identity to 1, not 0; the formula f(ντν′)=κ(τ)f(ν) on p. 24 requires the trivial multiplicative character.

### E-O8-7 — Definition 3.1.14(v), first colimit, p. 25 (rendered); arXiv v3 only

Misprint. Printed fragment: “MκU Iw,w”. Use M^κU_Iw+,w on the right side when defining forms of strict-Iwahori level.

The preceding definition fixes strict-Iwahori level; the other adjacent colimit and cuspform formulas retain the plus. A change of level cannot be omitted from a definition.

### E-O8-8 — Remark 3.3.9, p. 34 (rendered); arXiv v3 only

Misprint. Printed fragment: “γ ∈ Γ(pn)”. Use γ∈Iw+_GSp for representatives of the Iw+_GSp/Γ(p^n) quotient action.

The principal congruence subgroup already acts trivially under the twisted action on the displayed invariant sheaf. Its elements alone cannot define the remaining finite quotient action.

### E-O8-9 — Proposition 3.3.10, construction Ψ2 and display defining Φ, p. 36 (rendered); arXiv v3 only

Error. Printed fragment: “g|U(w)GLg,0 = 1”. Functions descending through the quotient must be invariant under right translation by U^(w), meaning g(xu)=g(x); they need not take the value 1 there.

The claimed map is an isomorphism of modules. The zero function on the source maps to zero on the quotient parametrization, while the printed target excludes zero. Right-unipotent invariance gives the requisite linear subspace.

### E-O8-10 — Proposition 3.3.10, constructions Ψ1 and Ψ2, pp. 35–36 (rendered p. 36); arXiv v3 only

Error. Printed fragment: “γ‡a + z γ‡c”. Replace the antidiagonal transpose of J=a+zc by J‡=a‡+c‡z when z‡=z. Recheck both intertwiners, their representation convention and ensuing comparison rather than changing a single occurrence.

Transpose is an antihomomorphism. With W=[0,1;1,0], z=E12, c=qE21, a=d=I,b=0, q=p^n≠0, the symplectic principal-level element has J=diag(1+q,1). Therefore J‡=diag(1,1+q), whereas a‡+zc‡=diag(1+q,1). The printed Ψ2 equality s W W J W=s W transpose(a‡+zc‡) fails in these coordinates. The corrected finite identity is a node with two genus-two acceptance examples.

### E-O8-11 — §3.4 definition of the classical sheaf, pp. 37–38 (rendered p. 38); arXiv v3 only

Gap. Printed fragment: “ϑ∗OM[k∨]”. On the full GL_g frame torsor, specify right-unipotent invariance as well as the torus character, or work on the corresponding flag quotient with its torus torsor. Use B4 associated finite-dimensional representations for the bundle comparison.

A torus eigenspace of regular functions on GL_g is generally larger than the finite-dimensional Borel-equivariant induced representation used in Definition 3.4.2(ii). For g=2, weight zero, the regular function x11*x22/det(x) is invariant under right diagonal multiplication but not under a general right upper-unipotent multiplication. Thus torus equivariance alone does not give the coefficient space appearing in Proposition 3.4.3.

### E-O8-12 — Remark 3.6.5(i), p.44 (rendered), against Definition 3.6.4(ii)

Misprint. Printed fragment: “w′ > w”. The immediate implication from the definition is w-ordinary implies w′-ordinary for 0<w′≤w.

The defining condition is HT(α(e_i))∈p^wω. For w′>w, p^wω contains p^w′ω, so membership in the former gives no membership in the latter. The decreasing-domain direction agrees with the period-radius definition.

### E-O8-13 — Corollary 3.6.13 and its proof, p.47 (rendered), against Proposition 3.6.12 on the same page

Gap. Printed fragment: “((2g−1)p)/(2g(p−1)) < w ≤ n”. The stated invocation of Proposition 3.6.12 requires c_g+n−1<w≤n. Use that stronger inequality for this argument. A uniform v<1/(2p^(n−1)) additionally needs a uniform-domain argument, not just a v chosen separately for each point.

For n>1 the printed corollary omits the n−1 term required by its cited proposition. The final sentence finds a strict Hodge bound pointwise and then uses a single v for the inclusion without supplying the uniform step. This extraction establishes a proof gap, not a counterexample to the corollary or to cofinality.

### E-O8-14 — Appendix B.2, p.104, universal 1-motive, compared with §B.1 p.102

Misprint. Printed fragment: “[V′⊥/V′ → G_V′]”. Use [V/V′⊥→G_V′], as in the boundary-chart construction on p.102.

For V′ of rank r the lattice in the chart 1-motive has rank r, while V′⊥/V′ has rank 2g−2r. In the maximal isotropic case r=g the printed lattice is zero although the chart requires a rank-g lattice. The earlier display has the correct quotient.

## Coverage, signature limits and acceptance

The six planets are Siegel automorphy factor, Determinant Hodge bundle, Algebraic automorphic bundles, Analytic Siegel coefficient sheaves, Toroidal diamond coefficients, Bruhat-domain coefficient families. They name the coefficient constructions and comparison targets rather than checks or source locators. No sub-layer restructuring is needed for this single stage.

The suggested file gives six finite matrix declarations, the determinant line construction and all of its six API signatures and four named unit-test examples. Additional concrete examples retain the checkpoint's identity, singular-denominator, noncommuting-factor, anti-transpose and integer-weight tests, and add the Atkin–Lehner chart tests. Eleven geometric signatures cannot yet be stated against genuine supplier types; their names and exact mathematical statements are recorded without proposition-valued substitutes. Elaborating this finite file validates signatures, not the mathematical proofs or the absent sheaf interfaces.

### Genuine geometric and analytic suggested signatures

The baseline lacks the actual Siegel spaces, canonical coefficient sheaves, analytic induced modules and toroidal diamonds required for these eleven geometric declarations. Their mathematical interfaces are fully specified by the nodes and owner requests, but their Lean signatures are omitted until the genuine supplier types exist. No Prop-valued stand-ins are used. The suggested file states the six finite matrix lemmas, determinant-line construction, all six API items, four named unit tests and concrete acceptance examples.

### Uniform Siegel canonical-domain comparison

The period domains and supplied-domain applications are planned. Closure of the claimed canonical/Hasse-domain identification requires the T3 Siegel extension, including p>2g and repairs to E-O8-12/13. The BP Bruhat reduction does not substitute for this genus-specific canonical-subgroup theorem.

### Corrected analytic induction and source verification

O0/O1 must export the full analytic Iwahori module with the correct Gauss lattice and Borel action. The finite associated-bundle comparison is specified independently of DRW Proposition 3.3.10; its printed antidiagonal intertwiners and unipotent normalization are not treated as verified proofs. All fourteen source findings require independent review and version-of-record/correction verification. No AIP sheaf equivalence or classicality theorem is included in the O8 targets.

The target-level pass is complete, and O8 is planned. Its remaining closure obligations are:

- Implement/export the exact higher-rank O0/O1 and S1/S3/S6/T6 supplier interfaces; replace stage prerequisites by verified node IDs as those owners supply them.
- Resolve the uniform quantitative Siegel canonical-domain gap and independently verify the fourteen version-scoped source findings.
- State the eleven genuine geometric suggested signatures once supplier types exist; the finite prototype is not a sheaf implementation.
- Validate the declared highest-weight, opposite-parabolic, central-character and cyclotomic conventions in the assembled owner interfaces.

Final assembly acceptance requires the following combined instances: g=1 agrees with the character/Hodge-line picture; g=2 exposes noncommuting matrix order and the difference between finite and analytic fibres; negative determinant weights use dual lines; a μ-weight-one toroidal coefficient retains its Tate factor; and a supplied Bruhat-domain reduction retains its level, radius and root-shift data. These instances test the interfaces consumed by O8, while supplier implementations and source verification remain the stated closure obligations.
