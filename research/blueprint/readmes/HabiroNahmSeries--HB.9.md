# HB.9 — Frobenius congruences and Habiro module membership

This part develops the proof contracts connecting the Nahm-series construction to Frobenius congruences and indexed Habiro modules. It imports the seventeen accepted HB.9 nodes from [the base packet](../packets/HabiroNahmSeries.json); their IDs, including the main theorem IDs, remain their owners. Its eighteen additional nodes refine the outstanding coefficient, regulator, constant-term and gluing arguments.

The planning pass is complete and HB.9 is planned in the sense of PROTOCOL §0. It is not closed. Five gaps and six supplier requests delimit the remaining proofs. All declarations are unchecked planning items. The finite first coefficient and the general-rank auxiliary system are specified explicitly; their use in the full membership theorem depends on the all-order and descent contracts stated below.

## Sources, baseline and ownership

The primary source is Garoufalidis–Scholze–Wheeler–Zagier, [The Habiro ring of a number field](https://arxiv.org/pdf/2412.04241v2), arXiv:2412.04241v2, posted 27 August 2025, PDF dated 13 August 2025. The PDF read on 6 October 2026 has SHA-256 308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9. The relevant reading comprises Definitions 1.3–1.4 and §§1.6–1.7; the root/Bernoulli expansion (59)–(60); §§2.4–2.7 in full; §§3.1–3.3 through Remark 3.11 in full; and the convention and first-coefficient checks (222) and (242). Write GSWZ for this version.

The constant comparison also uses Calegari–Garoufalidis–Zagier, [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://arxiv.org/pdf/1712.04887v3), arXiv:1712.04887v3, 6 April 2021. Its PDF hash is 024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5. The reading covers the introductory comparison and excluded primes, §2.2 in full, and Lemma 2.10/Theorem 2.11 for normalization and restriction. Write CGZ for this version. The packet records source versions separately: the new findings concern the GSWZ preprint and the checked author copy, without making claims about an unread published version.

The reviewed library audit is AUDIT-14, in data/library-coverage.json. None of the three HB.9 targets is implemented at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 or Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The actual pinned statements were read for the eleven cited baseline declarations: RingHom; MvPowerSeries; its rescale, expand and map operations; coeff_rescale, coeff_expand_smul, coeff_expand_of_not_dvd and constantCoeff_expand; PowerSeries.coeff and coeff_one_mul. These provide the generic series algebra used here. They do not provide Nahm admissibility, the completed coefficient Frobenius, indexed Habiro modules or regulator comparisons. The suggested file imports only Mathlib modules.

The document follows the explicit objects, named API and small computations of the upstream [ArithmeticDirichletSeries](../../../content/tau-ceti/ArithmeticDirichletSeries/README.md) and [AlgebraicCodingTheory](../../../content/tau-ceti/AlgebraicCodingTheory/README.md) documents, both read in full. Ownership is as follows.

| Input | Owner and precise use |
| --- | --- |
| Nahm series, Gaussian operation, refined pieces, level admissibility and identification | HabiroNahmSeries:HB.8; use the accepted nodes and request their corrected all-order extension |
| Euler expansion at a root | HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity; fixes the scalar regular factor |
| Coefficient Frobenius and root reexpansion | HabiroNumberFields:HB.6 and HabiroRings:HR.1 |
| Habiro completion and indexed modules | HabiroRings:HR.2 and HabiroNumberFields:HB.7 |
| Cyclic dilogarithm, Kummer value and finite Chern class | HabiroNumberFields:HB.2 |
| Integral modified polylogarithms, good-disc analyticity, reflection and Frobenius identities | The specific accepted ColemanIntegration:L2 nodes named in the packet |
| Bloch/K₃ regulator normalization and localization | Requested PadicHodgeRegulators:D.1, D.3 and D.4 |

The accepted HB.7 follow-up supplies field pullback and first-coefficient contracts, but leaves effective global descent and arithmetic naturality open. Its field statement does not cover a split quadratic coefficient algebra. The HB.2 follow-up with a needs_changes verdict is a lead for its orientation question; it is not imported as an accepted signed comparison.

## Conventions and the targets

Let A be a symmetric integral N by N matrix. The deformed Nahm equations, with column j in the product, are
\[
1-z_j=(-1)^{A_{jj}}t_j\prod_i z_i^{A_{ij}}.
\]
The formal branch has z_j(0)=1. Set
\[
\Lambda=-A-\operatorname{diag}\!\left(\frac{z_j}{1-z_j}\right),\qquad
C=\Lambda^{-1},\qquad
\delta=\left(\prod_jz_j^{-A_{jj}}\right)
 \det\!\left(\operatorname{diag}(1-z)A+\operatorname{diag}(z)\right).
\]
Consequently det(−Λ)=δ∏_j z_j^{A_jj}/(1−z_j). Gaussian integration uses covariance C, with positive operator hC/2 in (110).

The universal coefficient algebra S has invertible t_j and z_j and a square-root generator T subject to δT²=1. Its level-m version includes ζ_m and t_j^{1/m}; adjoining w_j with w_j^m=z_j gives the Kummer algebra used for individual refined pieces. Keep the full algebra, including all square-root factors. A normalized formal branch is a map from this algebra, not an identification with it.

At t=1 choose a nondegenerate isolated solution in a number field K, so δ≠0, and put ξ=Σ_j[z_j]. Choose a common integer Δ divisible by 6, the field discriminants, M_K, all denominators needed for z_j, z_j^{-1}, δ^{-1}, and the excluded-prime sets of the resulting field factors. Put R=O_K[1/Δ] and B=R[T]/(δT²−1). This is finite quadratic étale; if δ is a square in K its generic fibre is K×K. For the module theorem use p∤Δ and root orders m coprime to Δ, hence p>3 and p∤m.

At a root write q=ζ_m+x=ζ_m e^h and h=log(1+x/ζ_m). Completion in p precedes the indicated formal x-series construction. For coefficient-transfer questions the p-adically completed Laurent target is the inverse limit of Laurent series rings in t^{1/m} over (Z/p^r)[ζ_m]; it permits unbounded negative exponents whose coefficients tend p-adically to zero. An ordinary Laurent series over Z_p has a uniform lower exponent bound and is too small.

| Target retained from the base | Refinements in this part | Remaining obligations |
| --- | --- | --- |
| frobenius-congruence, GSWZ Theorem 4 and (39) | Saturated transfer; branch-loss counterexample; corrected regularization; explicit modified potential | Faithful coefficient transfer and corrected HB.8 identification |
| module-membership, GSWZ Theorem 5 | Integral first coefficient; arbitrary-rank product system and uniqueness; regulator specialization; Kummer and étale contracts | Signed constants, all-order integrality and global descent |
| verifying-the-defining-conditions | Separate shape, local span and product/Frobenius gluing checks | Each condition consumes its named coefficient and supplier inputs |

The seventeen imported nodes also retain descendants, constants, torsion powers, symmetrization and the conditional Bloch-torsion converse. Their hypotheses are preserved. The converse requires nonzero constants at infinitely many permitted prime orders; the plan does not assert an unconditional equivalence.

## Coefficient transfer and the lost branch

The node followup-saturation-transfer isolates the exact elementary argument needed for the intersection in (170). Let ι:S→T be a ring map, T a domain, and ι(p)≠0. Assume that ι(a)∈ι(p)T implies a∈pS for every a∈S. Then the same implication holds for every power p^n. To prove it, write a=pc after applying the first-power hypothesis, cancel the nonzero factor ι(p) in T, and induct. For an element a/p^n whose image is integral this clears the denominator; proving that its image is divisible by p requires the p^{n+1} version. Injectivity after inverting p does not supply the first-power hypothesis.

An injective reduction map S/pS→T/ι(p)T is a sufficient hypothesis. A collection of domain factors can be used when its reductions are jointly faithful. This is an acceptance condition on the actual completed coefficient model. Étaleness by itself does not imply it.

The node followup-branch-loss shows why the proposed full-ring, single-branch repair of the inherited E59 cannot work. Take N=m=1, A=(5), p=5. Then
\[
t=(z-1)z^{-5},\qquad \delta=z^{-5}(5-4z).
\]
Modulo 5, δ=z^{-4}, so the square-root relation is T²=z⁴. With z and z−1 inverted, the algebra has two maps sending T to ±z². On the normalized formal branch z(0)=T(0)=1, T=z². Thus T−z² vanishes on this branch. On the other factor it is −2z², a nonzero unit. The full algebra therefore does not inject into that branch.

This refines E59 rather than recording a second erratum for the same source gap. The outstanding proof must establish the canonical logarithmic defect on every component, or build a jointly faithful integral family of branches and prove its reduction saturation. Selecting one component and then transporting to every t=1 solution is insufficient. The suggested finite-field examples express the factorization and the two different images.

## Correct regularization and the Euler factor

The node followup-regularisation-jet derives the needed factor directly from (59), fixing the convention before any first-coefficient calculation. Put Z=θ^m, y_a=ζ_m^{k+1+a}θ and s_a=(k+1+a)/m. The logarithmic Pochhammer expansion is
\[
\sum_{a=0}^{m-1}\sum_{r\ge0}
 \frac{B_r(s_a)m^{r-1}}{r!}\,
 \operatorname{Li}_{2-r}(y_a e^w)\,h^{r-1}.
\]
Here B₁(s)=s−1/2 and B₂(s)=s²−s+1/6. Root distribution and expansion of e^{mw} give the quadratic pole
\[
\frac{\operatorname{Li}_2(Z)}{m^2h}
+\frac{\operatorname{Li}_1(Z)}{mh}w
+\frac{\operatorname{Li}_0(Z)}{2h}w^2.
\]
The h⁰w⁰ term is −Σ_a B₁(s_a)log(1−y_a). Subtract precisely these four terms. The residual logarithm has the vertices
\[
\frac{m\operatorname{Li}_{-1}(Z)}{6h}w^3,\quad
\frac{m^2\operatorname{Li}_{-2}(Z)}{24h}w^4,\quad
\sum_a B_1(s_a)\operatorname{Li}_0(y_a)w,\quad
\frac12\sum_a B_1(s_a)\operatorname{Li}_{-1}(y_a)w^2,\quad
\frac m2\sum_a B_2(s_a)\operatorname{Li}_0(y_a)h.
\]
Use the Gaussian completion with weight(w)=1 and weight(h)=2. In particular w³/h has positive weight one and is retained; normalization does not mean that the factor is 1 plus an ordinary multiple of x.

Finding E64 records three errors in (114): the linear pole denominator m² should be m, the quadratic coefficient should be 1/2, and the constant-log subtraction has the opposite sign. At m=1 the printed factor changes the Hessian and fails constant normalization. The correction belongs to HB.8's existing regularized-factor construction; HB.9 requests its all-order compatibility with periodicity, difference equations and identification.

Finding E65 records the missing exp(Nh/24) scalar regular factor in Definition 2.11, once E64 is corrected. The inverse Euler denominator in (112) contributes it. The accepted HB.4 root expansion gives exp(−ε/(24m)) for q=ζ_m exp(−ε/m), hence exp(h/24) per coordinate. The added first coefficient is N/24. This is the Euler-denominator mechanism of the previously recorded GZ normalization issue, in the separate GSWZ definition.

An exact check uses A=(3), m=1, t=(z−1)z^{-3} and δ=(3−2z)z^{-3}. The corrected-regularization Gaussian first coefficient plus 1/24 equals the coefficient in (242), with its exponential prefactor corrected as in inherited E41, identically as a rational function over Q(z). Omitting 1/24 leaves that exact discrepancy. This compares the principal-part-free series in the h coordinate: converting an exp(V/x) normalization instead would introduce additional volume terms.

E64 and E65 require independent review. The arXiv versions and the author's linked PDF were checked, together with public correction searches and the existing register. The relevant author-copy displays retain the same formulas; no correction was found in those searches. The packet gives the locators, printed expressions, proposed corrections, reasons and version scope.

## The finite first-coefficient polynomial

The definition followup-gaussian-first-jet is a finite polynomial over a characteristic-zero field L, on a finite coordinate type I. For symmetric C and diagonal vertex vectors b,Q,T,U define
\[
\begin{aligned}
J(C,b,Q,T,U,c)={}&c+\frac12\sum_iQ_iC_{ii}
+\frac12\sum_{i,j}b_ib_jC_{ij}
+\frac12\sum_{i,j}T_ib_jC_{ii}C_{ij}\\
&+\frac18\sum_iU_iC_{ii}^2
+\frac18\sum_{i,j}T_iT_jC_{ii}C_{jj}C_{ij}
+\frac1{12}\sum_{i,j}T_iT_jC_{ij}^3 .
\end{aligned}
\]
It is the h coefficient of the Gaussian expectation of
\[
\exp\!\left(\sum_i b_iw_i+\frac12\sum_iQ_iw_i^2
+\frac1{6h}\sum_iT_iw_i^3
+\frac1{24h}\sum_iU_iw_i^4+hc\right)
\]
through Gaussian weight two. This specializes the existing Gaussian operation; it introduces no competing integration theory.

The contractions are E[w_iw_j]=hC_ij, E[w_i³w_j]=3h²C_iiC_ij, E[w_i⁴]=3h²C_ii² and
\[
E[w_i^3w_j^3]=h^3(9C_{ii}C_{jj}C_{ij}+6C_{ij}^3).
\]
The last identity follows by separating pairings with one and three cross edges. It includes i=j, where its coefficients total fifteen. Expanding the exponential gives the displayed J, including the cubic-linear cross term. An independent enumeration of the three and fifteen matchings checks these formulas for two rational covariance matrices.

| API name | Mathematical contract |
| --- | --- |
| gaussianFirstJet | Construct the displayed finite polynomial |
| gaussianFirstJet_map | A field homomorphism sends its value to the value on the mapped entries |
| gaussianFirstJet_zero_covariance | At C=0 its value is c |
| gaussianFirstJet_integral | If a subring O contains 1/2 and 1/3 and all inputs, it contains J |

The motivating uses are the local shape condition (195), the inherited E58 linear-coefficient obligation, and the first-coefficient prerequisite of the HB.7 Dwork argument. There is no claim about higher coefficients from this finite formula.

| Test name | Inputs and expected value |
| --- | --- |
| gaussianFirstJet_linear | I=Fin 1, C=b=1, all other data zero: 1/2 |
| gaussianFirstJet_cubic | I=Fin 1, C=T=1, all other data zero: 5/24 |
| gaussianFirstJet_quartic | I=Fin 1, C=U=1, all other data zero: 1/8 |
| gaussianFirstJet_empty | I=Fin 0: value c |
| gaussianFirstJet_mixed | I=Fin 1, C=b=T=1, Q=U=c=0: 29/24 |

The mixed test detects omission of the cubic-linear term; the cubic test detects a wrong Wick multiplicity. The functoriality and integral-subring statements expose the library interface without requiring users to unfold the summation formula.

For followup-refined-linear-integrality take the principal-part-free refined piece Ω̄, remove exp(V/(m²h)) before specializing its coefficient data, and divide by its individual nonzero constant. Its first x coefficient is ζ_m^{-1}J with
\[
\begin{aligned}
b_j&=(Ak)_j+A_{jj}/2+\sum_aB_1(s_{j,a})\operatorname{Li}_0(y_{j,a}),\\
Q_j&=\sum_aB_1(s_{j,a})\operatorname{Li}_{-1}(y_{j,a}),\\
T_j&=m\operatorname{Li}_{-1}(z_j),\qquad
U_j=m^2\operatorname{Li}_{-2}(z_j),\\
c&=N/24+\sum_j\frac m2\sum_aB_2(s_{j,a})\operatorname{Li}_0(y_{j,a})
-\sum_j\sum_{r=1}^{k_j}\frac{r\zeta_m^r}{1-\zeta_m^r}.
\end{aligned}
\]
Here 0≤k_j<m, y_{j,a}=ζ_m^{k_j+1+a}w_j and s_{j,a}=(k_j+1+a)/m. The finite Pochhammer product in the refined piece gives the final sum; its q-phase cancels. The conversion factor follows from h=x/ζ_m+O(x²).

All entries lie in O=B_p[ζ_m,w]/(w_j^m−z_j). The factors 1−ζ_m^a w_j are units because their product is 1−z_j, a unit by Nahm's equation. The factors 1−ζ_m^r for 0<r<m are p-units. The adjugate formula and det(−Λ) show that C is integral. Bernoulli denominators contribute only 2,3,m, which are units at p. The integral API therefore proves this first coefficient belongs to O. Any additional finite root needed to represent the individual algebraic constant is kept as a torsor factor; the normalized coefficient itself has the displayed O-valued formula.

This supplies E58 for the corrected construction. It does not establish agreement with the imported HB.8 construction at all orders. The whole constant can vanish, so it is never divided out in this argument.

## Arbitrary-rank auxiliary products and uniqueness

Two products must be distinguished before using their shift equations. Let γ≥1, q∈L× for a field L, and let F⁺,F⁻ be formal series on finite I. In the Nahm application F⁺=F_A(t,q^γ) and F⁻=F_A(t,q^{-1}). Let μ=(μ₁,…,μ_γ), μ_i∈Z^I, and ν∈Z^I. Negative entries of A and negative shifts are allowed.

The powered construction followup-auxiliary-product, named auxiliaryProduct, is
\[
\Psi_{\mu,\nu}(t)=
 \prod_{i=1}^{\gamma}F^+(q^{\gamma\mu_i}t^\gamma)
 \,F^-(q^{-\nu}t).
\]
Use Mathlib rescale by q^{γμ_i}, then expand by γ. Reversing that order with the same scale inserts γ². This generalizes the powered repair in accepted E47. Its recurrences are valid, but its universal principal part does not cancel.

| Powered API name | Contract |
| --- | --- |
| auxiliaryProduct | Construct the product by existing series homomorphisms |
| auxiliaryProduct_constantCoeff | Constant is constant(F⁺)^γ constant(F⁻) |
| auxiliaryProduct_one | γ=1 is the product of the two indicated rescalings |
| auxiliaryProduct_covariance | Replacing t_j by qt_j increments every μ_ij by one and decrements ν_j by one |
| auxiliaryProduct_map | Coefficient maps commute with the construction and map the unit q |

| Powered test name | Computation |
| --- | --- |
| auxiliaryProduct_units | F⁺=F⁻=1 gives 1 for all shifts |
| auxiliaryProduct_gamma_two | q=2, γ=2, I=Fin 1, F⁺=t, F⁻=1, both μ_i=1, ν=0 gives 16t⁴ |
| auxiliaryProduct_inverse_shift | q=2, γ=1, F⁺=1, F⁻=t, μ=0, ν=1 gives t/2 |
| auxiliaryProduct_two_coordinates | q=2, γ=1, F⁺=t₀+t₁, F⁻=1, μ=(1,−1), ν=0 gives 2t₀+t₁/2 |
| auxiliaryProduct_covariance_test | At γ=2 and F⁺=t, rescaling t by 2 equals incrementing both μ entries |

The γ=2 test gives 16 rather than 256 and detects the substitution-order error. The inverse-shift test detects the sign on ν. The construction supplies the powered q-system and diagnoses the limitation of the inherited gluing repair.

Write A_j for column j, E_ij for the unit increment in the μ array, and e_i⊗A_j for adding that column only to μ_i. The node followup-product-system proves
\[
\begin{aligned}
\Psi_{\mu,\nu}-\Psi_{\mu+E_{ij},\nu}
 &=(-1)^{A_{jj}}q^{\gamma(A_{jj}+\mu_{ij})}t_j^\gamma
   \Psi_{\mu+e_i\otimes A_j,\nu},\\
\Psi_{\mu,\nu}-\Psi_{\mu,\nu+e_j}
 &=(-1)^{A_{jj}}q^{-(A_{jj}+\nu_j)}t_j
   \Psi_{\mu,\nu+A_j},\\
\Psi_{\mu,\nu}(t_1,\ldots,qt_j,\ldots)
 &=\Psi_{\mu+\mathbf1\otimes e_j,\nu-e_j}.
\end{aligned}
\]
For the Nahm series the constant is one. Each first difference comes from the HB.8 q-difference equation on the corresponding factor. The factors q^{γμ_ij}, q^{-ν_j} and t_j^γ are essential.

The node followup-product-uniqueness assumes q^n≠1 for all n>0. For two normalized families, induct on total degree α of their difference. The first two equations imply invariance under each unit parameter increment, because their right sides contain lower-degree differences. Integer increments generate all μ and ν shifts, so the coefficient is parameter-independent. Covariance then gives (q^{α_j}−1)c_α=0. At positive degree choose α_j>0 and conclude c_α=0 in L.

The construction followup-unpowered-auxiliary-product is the product actually needed for universal volume cancellation:
\[
P_{\mu,\nu}(t)=
 \prod_{i=1}^{\gamma}F^+(q^{\gamma\mu_i}t)
 \,F^-(q^{-\nu}t).
\]
It keeps the source's common t in (212). Instead of inserting t^γ to make the printed q covariance true, its covariance uses q^γ. This is a refinement of E47's proof repair, not a duplicate erratum against the already recorded erroneous source display.

| Unpowered API name | Contract |
| --- | --- |
| unpoweredAuxiliaryProduct | Construct the finite product of rescaled series |
| unpoweredAuxiliaryProduct_constantCoeff | Constant is constant(F⁺)^γ constant(F⁻) |
| unpoweredAuxiliaryProduct_covariance | Replacing t_j by q^γt_j increments every μ_ij by one and decrements ν_j by γ |
| unpoweredAuxiliaryProduct_map | Coefficient field homomorphisms commute with the product |

| Unpowered test name | Computation |
| --- | --- |
| unpoweredAuxiliaryProduct_gamma_two | q=2, γ=2, F⁺=t, F⁻=1, both μ_i=1, ν=0 gives 16t² |
| unpoweredAuxiliaryProduct_units | F⁺=F⁻=1 gives 1 for every shift |
| unpoweredAuxiliaryProduct_inverse_shift | q=2, γ=1, F⁺=1, F⁻=t, μ=0, ν=1 gives t/2 |

The first test distinguishes the unpowered and powered constructions. Its uses are the HB.7 product condition, HB.9 coefficient gluing and descendants, and the γ=1 symmetrization for HB.10.

The theorem followup-unpowered-product-system states
\[
\begin{aligned}
P_{\mu,\nu}-P_{\mu+E_{ij},\nu}
 &=(-1)^{A_{jj}}q^{\gamma(A_{jj}+\mu_{ij})}t_j
   P_{\mu+e_i\otimes A_j,\nu},\\
P_{\mu,\nu}-P_{\mu,\nu+e_j}
 &=(-1)^{A_{jj}}q^{-(A_{jj}+\nu_j)}t_j
   P_{\mu,\nu+A_j},\\
P_{\mu,\nu}(t_1,\ldots,q^\gamma t_j,\ldots)
 &=P_{\mu+\mathbf1\otimes e_j,\nu-\gamma e_j}.
\end{aligned}
\]
These follow directly by applying the same imported recurrence and comparing the arguments. In the positive factor q^{γμ_ij}q^γ=q^{γ(μ_ij+1)}; in the negative factor q^{-ν_j}q^γ=q^{-(ν_j−γ)}.

The theorem followup-unpowered-product-uniqueness uses the same total-degree induction. The first two equations again remove all parameter dependence. The last gives (q^{γα_j}−1)c_α=0; since γ≥1 and α_j>0, the non-root hypothesis kills the coefficient. This proves uniqueness in arbitrary rank while preserving the unpowered construction.

Both uniqueness statements apply to q=ζ_m+x in Q(ζ_m)((x)). Even if ζ_m^n=1, the first x coefficient of q^n is nζ_m^{n−1}≠0, so q has infinite order. An exact coefficient check through total degree four at q=2, γ=2 tests every equation for both families, for three coupled rank-two matrices including negative entries and nonzero shifts.

The comparison followup-integral-gluing-contract consumes the unpowered family. At level m and zero shifts its γ positive volumes cancel the negative volume:
\[
\gamma\frac{V(t)}{m^2\gamma h}
+\frac{V(t)}{-m^2h}=0.
\]
In contrast, the powered family's principal part is (V(t^γ)−V(t))/(m²h). This is nonzero in general. Already at A=0, m=1, γ=2, V(t)=−Li₂(t), so it is (−Li₂(t²)+Li₂(t))/h. More concretely, at A=0, γ=2 the powered t coefficient is q/(q−1), whereas the unpowered t coefficient is (q+2)/(q+1), regular at q=1. The accepted base's assertion that the powered family lies universally in S_p^(m)[[x]] cannot be used as a proof.

At t=1 the two common arguments agree, which explains why the product condition can still be the correct target. The universal proof uses the unpowered Gaussian family and its q^γ covariance. It must satisfy the system, have t-constant one, have integral coefficients at every p∤Δ, and obey the HB.6 coefficient-Frobenius root reexpansion. Uniqueness identifies such a family; cancellation and uniqueness alone do not prove coefficient integrality. Global coefficients then belong to S^(m)[1/Δ], correcting E63. All-order Frobenius gluing and Kummer descent remain G-all-order-gluing.

## An algebraic modified potential and its regulator specialization

The finite identity followup-coleman-potential-sign pins the regulator convention. At t=1, Iwasawa log annihilates roots of unity and the Nahm equations give log(1−z_j)=Σ_i A_ij log(z_i). The p-adic reflection identity has no complex ζ(2) constant:
Li₂(z)+Li₂(1−z)=−log(z)log(1−z). Substitution gives
\[
-\sum_j\operatorname{Li}_2(1-z_j)
-\frac12\sum_{i,j}A_{ij}\log(z_i)\log(z_j)
=\sum_jD_p(z_j),
\quad
D_p(z)=\operatorname{Li}_2(z)+\tfrac12\log(z)\log(1-z).
\]
The potential has the positive Bloch-class sign. This establishes an algebraic reduction from the actual Coleman identities, without treating an arbitrary function as their definition.

For followup-modified-potential-formula work in the p-completed coefficient algebra, p>3. Put y_j=1−z_j, write φ_p(z_i)=z_i^p exp(pη_i), and let β_j=Σ_i A_ijη_i. The logarithm defining η_i is the principal-unit logarithm on φ_p(z_i)/z_i^p∈1+pS_p. No logarithm on arbitrary units of S_p is assumed. The Nahm equations imply φ_p(y_j)=y_j^p exp(pβ_j).

Use the imported integral modified polylogarithm ℓ_s. The explicit convergent expression is
\[
W_p=p\sum_j\ell_2(y_j)+p\sum_j\beta_j\ell_1(y_j)
-\frac p2\sum_{i,j}A_{ij}\eta_i\eta_j
-\sum_j\sum_{r\ge2}\frac{p^{r-1}\beta_j^r}{r!}
 \operatorname{Li}_{2-r}(y_j^p).
\]
For s≤0 the polylogarithm is the integral rational function obtained by applying (u∂_u)^{−s} to u/(1−u). Its denominator is a power of 1−y_j^p, a unit. Every Taylor coefficient has p-adic valuation at least one, and v_p(p^{r−1}/r!) tends to infinity. Thus W_p∈pS_p on the full algebra.

On the normalized formal branch W_p equals V(t^p)/p−pV(t). Expand Li₂(y_j^p exp(pβ_j)) and use
Li₂(y^p)−p²Li₂(y)=−p²ℓ₂(y) and
Li₁(y^p)−pLi₁(y)=−pℓ₁(y).
The linear Taylor term cancels the quadratic-log cross term except for +pβ_jℓ₁(y_j), leaving −pηᵗAη/2. This fixes the signs and factors in inherited E60. It also makes the expression available on every component without relying on an injective formal branch.

The theorem followup-regulator-specialisation applies S_p→B_p at the nondegenerate solution. Since z_j and 1−z_j are units, y_j is in a good Coleman residue disc and |1−y_j|=1. The specific L2 Frobenius-relation node identifies ℓ_s(y_j) with Li_s(y_j)−p^{−s}Li_s(y_j^p). The points y_j^p and φ_p(y_j) lie in the same good disc; their difference has the principal-unit Taylor parameter pβ_j. Reversing the displayed calculation and applying the positive potential identity at z and φ_p(z) gives
\[
\operatorname{specOne}(W_p)=
 \frac{\varphi_pD_p(\xi)}p-pD_p(\xi)\in pB_p.
\]
The requested D.1/D.4 normalization and localization identify the symbol sum with the K₃ regulator and give its coefficient-Frobenius equivariance. D.3 supplies the unramified integral regulator input used by the local module.

This proof uses one-variable Coleman disc identities. It does not evaluate the formal series V(t)∈Q[[t]] at t=1 or assume an analytic continuation theorem on the entire Nahm variety. Inserting the common principal part D_p(ξ)/(m²log(q/ζ_m)) compares (39) with the local-section condition (21). The case ξ=0 gives zero regulator defect, but does not resolve the separate finite-Chern orientation question.

## Constants, full étale coefficients and descendants

The comparison followup-kummer-orientation-contract keeps the fixed exported class ε_m(ξ)=c_ζ(ξ)² from HB.2. GSWZ's cyclic dilogarithm has exponents a/m; CGZ's has exponents a. Thus D_GSWZ(w)^m=D_CGZ(w). The cyclic prefactor of U_m in (121) has the inverse of the product P_ζ(ξ)=∏_jD_CGZ(w_j)/D_CGZ(1), modulo m-th powers.

A signed comparison must track the entire formula: powers of z, the finite k-sum, integer q-phase, and square-root normalization. It must establish that individual refined constants are units of the required ε_m torsor, that the sum descends, and that the module index is the fixed finite Chern class. A comparison up to an unspecified exponent does not determine that index. Choosing c_ζ or its inverse to fit the desired answer is not a proof. The positive p-adic regulator identity does not decide this finite comparison.

The whole constant is allowed to vanish. Its coefficient field includes δ^{-1/2}; for the figure-eight datum the familiar (−3)^{-1/4} constant illustrates why dropping that factor fails. Every assertion about a unit applies to an individual refined section with its torsor, not to a possibly zero sum.

The comparison followup-etale-module-contract requests the actual HB.7 indexed module for B=R[T]/(δT²−1). Its local coefficient rings are the full products B_p[ζ_m]. Frobenius, K₃ restriction and finite-Chern torsors must operate on every component, and effective descent must preserve the actual Kummer action on B_p[ζ_m,w]/(w_j^m−z_j). At p∤m this Kummer extension is finite étale. Local sections with integral constant and linear coefficients are used as a span, so sums remain valid even when they vanish. Product/Frobenius gluing is a separate global condition. The existing field pullback theorem cannot alone establish this split-algebra extension.

The comparison followup-descendant-pullback-contract fixes the level convention. A shift in the original Nahm variable is t_j^{1/m}=q^{ν_j}, hence in the level-m Gaussian coordinate
\[
t_j=q^{m\nu_j},\qquad q=\zeta_m+x.
\]
This curve starts at t=1. Lift it in the completed coefficient algebra by formal étaleness at the chosen nondegenerate point, retaining the selected z_j, T and w_j constants. Differentiating the Nahm equations gives
\[
\left.\frac{d\log z}{dx}\right|_{x=0}
 =\Lambda^{-1}\frac{m\nu}{\zeta_m}.
\]
Indeed the logarithmic Jacobian of t as a function of z is Λ. The lifted principal part, δ, cyclic prefactors and refined constants all vary; a constant t=1 specialization does not supply the descendant series.

Three acceptance computations pin this contract: ν=0 recovers the fixed series; at m=2, q=−1+x, ν=1 the curve is t=q²=1−2x+x², whereas t=q starts at −1; at m=1, ν=−1 it is t=1−x+O(x²). All-order transport must also track the indices and algebraic data under q↦q^p, q^γ and q^{-1}. This is G-descendant-transport. HB.10 retains ownership of the resulting integer-shift ring elements.

## Proof order, planets and remaining work

The dependency order starts with the corrected HB.8 Gaussian data and the faithful coefficient model. The finite first-coefficient and explicit W_p formulas then supply the local shape and regulator inputs. Signed Kummer constants identify the correct module index. The unpowered auxiliary product system identifies the corrected product once its integral construction is proved. Full étale indexed modules, Kummer descent and global Frobenius gluing give membership. Descendants consume the same ingredients along their nonconstant level-m curves.

The five recorded gaps are G-coefficient-transfer, G-HB8-identification, G-kummer-orientation, G-all-order-gluing and G-descendant-transport. The six requests go to HB.8, HB.2, HB.7 and PadicHodgeRegulators D.1/D.3/D.4. Coleman L2 is used through its existing named nodes, rather than requested again. These are proof obligations in the scope of the final result, each with exact consumers in the packet.

The layer retains its three accepted planets: Frobenius congruence, Habiro module membership and Bloch-torsion powers in the Habiro ring. It adds Auxiliary Nahm product and p-adic regulator identity, for a total of five. Routine coefficient computations and unresolved contracts are not additional planets.

The [suggested file](../suggested/HabiroNahmSeries--HB.9.lean) prototypes real finite sums, ring maps and multivariable formal series, with all thirteen API items and thirteen definition tests. Its general-rank system and uniqueness statements are typed. Named results whose Gaussian, completed coefficient, Coleman or indexed-module carriers are absent have explicit omissions naming those actual missing imports. The file elaborated at the pinned Mathlib with only the expected proof-placeholder warnings. This check validates prototype signatures; it does not implement the mathematical proofs or close the five gaps.
