# Finite fields and character sums — FF.1

This part completes a target-level planning pass on the three remaining items of the accepted FiniteFieldsAndCharacterSums blueprint: the Hasse–Davenport product proof, the actual finite-field use of the general Fourier interface, and the two-point polynomial interpolation sum used by Bergström–Faber–Payne. It also states the elementary Gauss-sum comparison for a presented product of finite fields. The existing character constructions, normalization dictionary, lifting proof and Stickelberger theory are imported with their original node ids. The part has eight nodes and no replacement character, Fourier, polynomial or p-adic carrier.

FF.1 has coverage **planned**. The Fourier transport, trivial boundary and interpolation plans end in existing declarations or exact owner nodes. The product proof has one recorded gap containing two precise analytic supplier requests. Completing the planning pass does not assert gap-free source closure, and none of the proposed declarations is formalised. The suggested file checks the types and native constructions; its theorem proofs and API proofs are admitted.

The style and level follow the upstream CharacterTheory and Completed/OrthogonalL2Bases documents. The applicable accepted RS-03 narrowing keeps trace, norm, character and Gauss/Jacobi comparisons in FF.1, imports built identities and assigns general finite-abelian Fourier analysis to AdditiveCombinatorics:AC.0. CodingTheoryMacWilliamsWeightEnumerators owns MacWilliams identities; its overlap record ACT-O02 does not make coding theory an input to this layer.

## Baseline and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each of the packet’s 32 baseline declarations was checked in its source at those commits. The reviewed library audit calls FF.1 partly built. The following mathematical resources are already available and receive no new nodes here.

| Resource | Existing declaration or owner |
| --- | --- |
| Additive characters and primitive trace construction | Mathlib `AddChar`, `AddChar.IsPrimitive`, `AddChar.FiniteField.primitiveChar` |
| Multiplicative characters extended by zero | Mathlib `MulChar` |
| Additive row and complex column orthogonality | Mathlib `AddChar.sum_eq_ite`, `AddChar.sum_apply_eq_ite` |
| Multiplicative row orthogonality | Mathlib `MulChar.sum_eq_zero_of_ne_one` |
| Multiplicative column orthogonality for every prime power | Tau Ceti `CommGroup.sum_monoidHom_apply_eq_ite`, on the group of units |
| Gauss sums and complex conjugation | Mathlib `gaussSum`, `star_gaussSum_eq` |
| Gauss inverse pair and quadratic square | Mathlib `gaussSum_mul_gaussSum_eq_card`, `gaussSum_sq` |
| Jacobi/Gauss quotient and Jacobi inverse pair | Mathlib `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_mul_jacobiSum_inv` |
| Iterated Jacobi product for a character of order n | Mathlib `gaussSum_pow_eq_prod_jacobiSum` |
| Quadratic reciprocity | Mathlib `legendreSym.quadratic_reciprocity` |
| General Fourier transform and Parseval | `AdditiveCombinatorics:AC.0/fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-parseval` |
| Bounded-degree polynomials and coefficient coordinates | Mathlib `Polynomial.degreeLT`, `Polynomial.degreeLTEquiv` |

The Gauss inverse-pair identity requires a nontrivial multiplicative character and a primitive additive character. The quadratic-square identity also requires the multiplicative character to be quadratic. The Jacobi quotient requires χφ nontrivial and the field cardinality nonzero in the coefficient field; the Jacobi inverse-pair identity requires χ, φ and χφ nontrivial and different source/target characteristics. These hypotheses are part of the imported statements. They are not silently erased by the phrase “norm identities.” The iterated Jacobi identity uses n equal to the order of χ, with n≥2, and the product runs from i=1 to n−2.

The predecessor’s `FiniteFieldsAndCharacterSums:FF.1/trivial-character-conventions` owns the dictionary with Deligne’s source-negative inverse-character sum and with the convention ε(0)=1 used in some elementary sources. Its `/gauss-sum-absolute-value` and `/jacobi-sum-absolute-value` own the complex absolute-value comparisons. Its `/hasse-davenport-lifting` and `/hasse-davenport-lifting-for-jacobi-sums` already supply the elementary extension-field lifting route. Those nodes are retained, including their sign. This continuation adds no duplicate lifting theorem.

Lang torsors, character sheaves and the cohomological realization of a Gauss sum belong to FF.2. Euler–Poincare with Swan conductors belongs to the external owner requested by FF.2. The exact analytic Dwork input below is a scalar series interface, rather than an import of an entire cohomology layer. It gives no dependency from FF.1 to étale cohomology or Poincare duality.

## Conventions and declarations

Let F be a finite field of cardinality q and characteristic p. Additive characters ψ:F→ℂ satisfy ψ(x+y)=ψ(x)ψ(y) and ψ(0)=1. The trivial additive character is written 1 in multiplicative notation; some native additive-group statements call it 0. A primitive character has every nonzero multiplicative shift nontrivial. Over a field this is equivalent to being nontrivial, without any injectivity requirement on ψ itself.

A native multiplicative character χ is a monoid homomorphism that vanishes on nonunits. Thus χ(0)=0 for **every** χ on F, including the trivial character. Write

\[
g(\chi,\psi)=\sum_{x\in F}\chi(x)\psi(x).
\]

For nontrivial ψ, the native value g(1,ψ) is −1. Native Jacobi sums satisfy J(1,1)=q−2. A source defining the trivial character to equal 1 at zero has a different trivial Jacobi boundary; its formulas cannot be copied into native MulChar without conversion.

The following declarations live in the proposed namespace `TauCeti.FiniteFieldSums`. The packet uses the prefix `FiniteFieldsAndCharacterSums:FF.1/` for every new id.

| New node suffix | Declaration | Purpose |
| --- | --- | --- |
| finite-field-fourier-transport | `finiteField_fourier_transport` | Reindex the owned inversion and Parseval identities by field elements |
| multiplicative-fourier-boundary-coefficients | `mulChar_fourier_boundary` | Include the zero coefficient of the trivial MulChar |
| digit-product-distribution | `digit_product_distribution` | Digit sums and digit factorial distribution, with the binary boundary |
| hasse-davenport-product-completion | `hasseDavenport_product` | Attach the exact Gamma proof route to the existing product target |
| projective-polynomial-evaluation | `projectiveEval` | Degree-d section evaluation in a fixed chart |
| projective-two-evaluation-uniform | `projectiveEval_pair_uniform` | Surjectivity and exact fibre cardinality |
| projective-two-point-character-sum | `projectiveEval_character_correlation` | The all-polynomial two-point vanishing ingredient |
| gauss-sum-finite-product-factorisation | `gaussSum_finiteProduct` | Native positive-sum factorisation on a product algebra |

The accompanying `projectiveEval_character_correlation_all` belongs to the same two-point target node. It records the formula before imposing nontriviality. No small coefficient-solving or finite-sum lemma becomes a separate target-level node.

## Fourier transport on the actual additive field

Fix a primitive ψ and put ψ_a(x)=ψ(ax). The predecessor’s `/additive-characters-are-shifts` identifies a↦ψ_a with a bijection F→AddChar(F,ℂ). The baseline independently gives its injectivity and the equality of the dual cardinality with q. This identification concerns the additive group of F. For a proper prime-power field it is not the cyclic group ZMod q; for example, F₄ has additive exponent two.

The owner’s transform is dual-indexed and normalized by 1/q. Its `fourier_eq_basis_repr` API identifies it with the coordinates of the native complex character basis. Consequently the field-indexed coefficient is

\[
 C_f(a)=q^{-1}\sum_{y\in F}f(y)\overline{\psi(ay)}.
\]

No new transform is defined here. `finiteField_fourier_transport` transports both of the following identities through the same shift bijection:

\[
 \sum_{a\in F}C_f(a)\psi(ax)=f(x),\qquad
 q^{-1}\sum_{y\in F}f(y)\overline{g(y)}
 =\sum_{a\in F}C_f(a)\overline{C_g(a)}.
\]

The negative sign is inside the conjugated coefficient kernel; the inversion kernel is positive. Parseval retains q⁻¹ on the field-side sum and no extra cardinality on the dual-side sum. This agrees with Kowalski’s normalized character inner product, Proposition 1.10, and its field parametrisation in Proposition 1.13. The general inversion and Parseval proofs remain with AC.0.

The delta function δ_b has coefficient q⁻¹ conjugate(ψ(ab)); its inversion is δ_b and its normalized square norm is q⁻¹. The constant function has coefficient 1 at a=0 and zero at the other indices. These acceptance cases detect a missing normalization or a conjugation on the wrong kernel. The F₄ case detects an incorrect use of a cyclic order-q Fourier transform.

For multiplicative characters the explicit coefficient formula is

\[
 C_\chi(a)=
 \begin{cases}
 (q-1)/q,&a=0,\ \chi=1,\\
 0,&a=0,\ \chi\ne1,\\
 q^{-1}\chi^{-1}(-a)g(\chi,\psi),&a\ne0.
 \end{cases}
\]

At nonzero a, conjugation changes ψ(ay) to ψ(−ay), and native Gauss transport with the unit −a gives this formula. At a=0, the two native multiplicative row-sum declarations supply the two cases. In particular the trivial character has nonzero-index coefficients −1/q; inversion reconstructs its value zero at the origin. Applying the nontrivial-character formula blindly to χ=1 would lose its constant coefficient.

The old `/fourier-expansion-of-multiplicative-character` remains the nontrivial target. Assembly replaces its coarse `AdditiveCombinatorics:AC.0` prerequisite with the two exact owner ids and the field-coordinate transport. This discharges its generic Fourier supplier question. The part does not modify the accepted predecessor packet or construct another dual equivalence.

## Digit distribution and the exact product route

Put M=p^f−1, with f>0, and let m>0 divide M. Then p∤m and d=M/m>0. For a nonnegative integer r let s(r) be its base-p digit sum and h(r) the product of the factorials of its digits, using the native `Nat.digits`. Zero has an empty digit list, so s(0)=0 and h(0)=1. Padding with leading zero digits changes neither value.

For 0≤b<d, `digit_product_distribution` states simultaneously

\[
 \sum_{j=0}^{m-1}s(b+jd)
 =s(mb)+\sum_{j=1}^{m-1}s(jd),
\]

and the congruence in ZMod p

\[
 m^{s(mb)}\prod_{j=0}^{m-1}h(b+jd)
 =h(mb)\prod_{j=1}^{m-1}h(jd).
\]

All arguments are less than M. Multiplication by p modulo M rotates their f padded digits. The identity expressing a digit sum as (p−1) times the sum of the cyclic fractional parts reduces the first equality to distribution on the grid j/m. For each rotation p is a unit modulo m and therefore permutes that grid. This proves the needed cancellation of the powers of the chosen p-adic uniformizer.

The factorial assertion uses an **existing** exact Gamma multiplication node, `DirichletPadicLFunctions:L3/gross-koblitz-source-multiplication-theorem`. For b>0 substitute k=mb. The source preimages, after permutation, are precisely the cyclic fractions attached to b+jd. Reducing Gamma modulo p at precision one gives Γ_p(r/M)=1/r₀! modulo p, where r₀ is the low digit: r/M is −r₀ modulo p and the native Gamma recurrence evaluates at that negative integer. Multiplication over all rotations gives 1/h(r). The Teichmuller factor reduces to m^{mb}, which equals m^{s(mb)} modulo p. Every digit factorial is a unit because its argument is smaller than p.

For b=0, split off the zero-index term and both identities are tautologies. This keeps Γ_p(0)=1 distinct from Γ_p(1)=−1 in sources using positive fractional parts. For m=1 both identities are also immediate. At p=2 all digit factorials equal one, as does the residue of m. The congruence alone therefore carries no information about a possible binary root of unity.

For p=5,f=1,m=2,b=1 the factorial test compares 2²·1!·3! with 2!·2!, both 4 modulo 5. The opposite power of m fails this example. For p=3,f=2,m=2,b=1 the digit sums are 1+3=2+2, and the factorial test is 2²·1·2=2·1 modulo 3. Exhaustive arithmetic checks for p∈{2,3,5,7}, 1≤f≤3, all divisors m of M and all 0≤b<d tested 1,280 instances. These checks test conventions, rather than prove the general theorem.

The desired Hasse–Davenport product formula is, for a character ρ of exact order m and primitive ψ,

\[
 g(\chi^m,\psi)\prod_{j=1}^{m-1}g(\rho^j,\psi)
 =\chi(m)^m\prod_{j=0}^{m-1}g(\chi\rho^j,\psi).
\]

There is no assumption that χ or χ^m is nontrivial. The integer m represents a unit of F. The formula holds for every prime characteristic and agrees with Conrad’s (A.6). Including j=0 in the product of the powers of ρ introduces g(1,ψ)=−1; this is the source of the alternative displayed minus sign.

The new node gives a completion route for the predecessor’s `/hasse-davenport-product-relation`, rather than introducing another mathematical target at promotion. Choose the predecessor’s Teichmuller character generator and prime above p. Write χ=ω^{-a} and ρ=ω^{-td}, with t prime to m. Reindexing j removes t. Reducing a modulo d to b permutes the numerator factors and preserves χ^m and χ(m)^m. If b=0, χ is a power of ρ; both sides agree by permutation and the trivial Gauss factor. This includes every χ^m=1 boundary.

For 0<b<d, the owned Robert Gross–Koblitz comparison identifies the **source-negative** Gauss sum with π^{s(r)} times a product of actual Morita Gamma values. It applies to exponents 0≤r<M, with π^{p−1}=−p and a compatible primitive p-th root. The comparison takes place in the completion of the cyclotomic character-value field at the chosen prime. Injectivity of the coefficient-field embeddings brings the resulting algebraic equality back to complex Gauss sums. It does not identify a positive real square root with an arbitrary p-adic square root.

The digit identity cancels the π powers. The owned Gamma multiplication quotient is exactly ω(m)^{mb}=χ(m)^{-m}. Both sides contain m source-negative sums, so their signs cancel. The resulting equality is the stated product formula. Finally use the predecessor shift parametrisation and native Gauss transport to replace the standard trace character by an arbitrary primitive ψ. Both sides pick up the same multiplicative factor.

The important root step is stronger than a congruence modulo the cyclotomic prime. L3’s `/morita-gamma-multiplication-orbit-power` and `/gross-koblitz-multiplication-teichmuller` prove that the normalized Gamma quotient has (p−1)st power one and identify its residue. Reduction is injective on these prime-to-p roots. When p=2 the exponent is one, and the quotient is identified exactly. This excludes the p-power ambiguity that a bare congruence cannot exclude. The Gamma objects, recurrence, sharp congruence and multiplication proof all remain with L3.

The elementary norm/trace lifting theorem is also retained from the predecessor. In native normalization its formula is −g(χ∘N,ψ∘Tr)=(−g(χ,ψ))^n. The product theorem above is distinct from lifting. Neither formula is attributed to Deligne’s twisted reinterpretation in §4.12; the lifting statement in that source is Théorème 1.15. No cohomological proof is needed for this continuation.

## Exact supplier boundary and source corrections

The imported `DirichletPadicLFunctions:L3/robert-gross-koblitz-comparison` still assumes two inputs that `PadicDifferentialEquationsAndRigidCohomology:RD.6/dwork-isocrystal` does not export as native series theorems. The packet inherits the two precise questions, with this product node as consumer.

First, let K be a complete ultrametric characteristic-zero normed field with a norm-preserving Q_p embedding, q=p^f, π^{p−1}=−p and r=‖π‖. For the actual native formal series

\[
 \Theta_q(X)=\exp(\pi X)\exp(-\pi X^q),\qquad A_n=[X^n]\Theta_q,
\]

the supplier must prove ‖A_n‖≤r^{n(p−1)²/(pq)}. The displayed exponentials describe formal coefficients. Evaluating an analytic sum at a boundary point is a separate operation; a substitution into a formal exponent cannot justify that value.

Second, for the actual residue field F of cardinality q and native Teichmuller lift τ, the supplier must prove

\[
 \sum_{n\ge0}A_n\tau(u)^n
 =\zeta^{\operatorname{Tr}_{F/\mathbf F_p}(u)}\quad(u\in F^\times),
\]

with ζ the chosen primitive p-th root and π chosen compatibly. The requested normalization is Θ_p(1)=ζ, with π congruent to ζ−1 modulo (ζ−1)². The application needs existence of this compatible choice in its cyclotomic completion. At p=2, π=−2 and ζ=−1. The Robert-sign series is the inverse of the Frobenius factor described by the current isocrystal node; that sign conversion is explicit. L3 already handles convergence, finite orthogonality and the Gamma comparison after these inputs are supplied.

These two requests constitute one recorded gap. The unconditional product formula is the target signature, rather than an extra assumed theorem in its proof. It cannot be marked closed while its actual analytic inputs are still questions. A follow-up must obtain the two native supplier interfaces and instantiate the comparison at the compatible cyclotomic data. It need not rebuild Gamma theory or all of rigid cohomology.

The source audit distinguishes a known erratum from a rejected allegation. Cohen’s *Number Theory, Volume II* (Springer, 2007), Lemma 11.7.12, printed pp.390–391, gives the chosen-root ratio congruence modulo the fraktur prime ideal 𝔭. This is the maximal-ideal normalization needed here, equivalently π≡ζ_p−1 modulo (ζ_p−1)². The recorded inspection of the page images and fonts distinguishes 𝔭 from the rational integer p. The earlier E750 allegation misread that symbol: its p=3 valuation calculation tests the stronger congruence modulo the rational prime, which the source does not assert. E750 is retained as a rejected allegation; this passage needs no source correction.

The genuine n/N mismatch in the first line of Theorem 11.6.14, printed p.372, is E751. Cohen’s errata dated 30 November 2008, PDF p.4, corrects both occurrences to N. This plan consistently uses N. The Gamma argument uses the printed maximal-ideal condition together with the exact prime-to-p root identity above; it never infers that an arbitrary root of unity reducing to one must be trivial.

## Projective evaluation and interpolation

The polynomial carrier is the existing submodule V_d=Polynomial.degreeLT F(d+1): polynomials of degree at most d, including zero and every lower-degree polynomial. A point is represented by Option F, with some a denoting [a:1] and none denoting [1:0]. Define the linear functional

\[
 E_d(a,P)=P(a),\qquad E_d(\infty,P)=\operatorname{coeff}_d(P).
\]

This evaluates the prescribed-degree homogenization ∑_{i≤d}a_iX^iZ^{d−i}. The degree bound is part of the data. A polynomial of degree strictly below d has value zero at infinity, even if its leading coefficient is nonzero. There is no scalar-valued evaluation independent of projective representatives: rescaling a representative by λ multiplies the degree-d section value by λ^d. The chosen chart makes the scalar sum well-defined.

`projectiveEval` is an F-linear map, formed by composing the native submodule inclusion with `Polynomial.leval` or `Polynomial.lcoeff`. Users obtain the following six API declarations without unfolding the constructor; every name below has prefix `TauCeti.FiniteFieldSums.`.

| API name | Statement |
| --- | --- |
| projectiveEval_some | E_d(some a,P)=P.eval a |
| projectiveEval_none | E_d(none,P)=P.coeff d |
| projectiveEval_monomial | On cX^i, finite evaluation is ca^i; infinity gives c if i=d and 0 otherwise |
| projectiveEval_add | Evaluation respects addition |
| projectiveEval_smul | E_d(x,cP)=cE_d(x,P) |
| projectiveEval_of_degree_lt | Degree P<d implies E_d(none,P)=0 |

The constructor has five tests, named identically in the packet and suggested file. `projectiveEvalTests.lower_degree_infinity` evaluates X over F₃ at ambient degree two and expects zero; using Polynomial.leadingCoeff fails. `top_degree_infinity` evaluates X² there and expects one; an always-zero infinity rule fails. `degree_zero_constant` evaluates the degree-zero constant c at infinity and expects c. `finite_zero_constant` compares evaluation at some 0 with the native constant coefficient for every degree bound. `finite_nonzero_linear` evaluates X at some 2 over F₃, with ambient degree two, and expects 2. That fifth test rules out evaluating every finite point at zero. The native monomial-membership theorem supplies the small test polynomials.

For d≥1 and distinct x,y, the two-evaluation map V_d→F² is onto, and each fibre has size q^{d−1}. Native `Polynomial.degreeLTEquiv` identifies V_d with its d+1 coefficients. At two finite points a≠b, choose all coefficients except a₀,a₁ arbitrarily; the remaining two equations have determinant b−a and a unique solution. At a finite point and infinity, fix a_d to the infinity value, choose the other d−1 free coefficients, then solve a₀ from the finite evaluation. Reversing the ordered points just swaps the target coordinates.

Thus d=1 has singleton fibres, including a pair containing infinity. Over F₃ at d=2, prescribing the values at 0 and infinity leaves exactly three polynomials. Constants, d=0, give only a diagonal image; repeated points cannot support independently prescribed unequal values. These are essential hypotheses of `projectiveEval_pair_uniform`, while the constructor itself supports d=0.

Partitioning the all-polynomial sum by those fibres gives the stronger declaration

\[
 \sum_{P\in V_d}\chi(E_d(x,P))\phi(E_d(y,P))
 =q^{d-1}\left(\sum_u\chi(u)\right)\left(\sum_v\phi(v)\right).
\]

When χ≠1, native multiplicative row orthogonality makes the first factor zero. The other character φ can be trivial. The product is not conjugated. When both characters are trivial the value is q^{d−1}(q−1)², which detects a missing nontriviality hypothesis.

For odd q, specialize to the nontrivial quadratic character and transport its integer values to ℂ. The sum is zero for each ordered distinct pair; summing over pairs gives exactly the all-polynomial interpolation ingredient in BFP’s Lemma 5.2 proof, arXiv v2 pp.8–9. The paper uses d≥2; this ingredient works already at d=1. No statement about a monic or squarefree family follows from uniform fibres of the entire coefficient space. In particular this does not prove the separate squarefree induction or the automorphism-weighted hyperelliptic moment in the rest of Lemma 5.2. The field-specific routed item is `PAPER-BERGSTROM-FABER-PAYNE-24/char-sum-interpolation`; generic evaluation and orthogonality retain their existing owners.

## Products of finite fields

For a finite family of finite fields K_i, let A be their native product ring. Given actual native χ and ψ on A and actual component characters satisfying χ(x)=∏χ_i(x_i) and ψ(x)=∏ψ_i(x_i), `gaussSum_finiteProduct` states

\[
 g_A(\chi,\psi)=\prod_i g_{K_i}(\chi_i,\psi_i).
\]

Its proof unfolds the native Gauss sum and applies the baseline `Fintype.prod_sum`. It requires no nontriviality or primitivity assumption. It consumes the component factorisations explicitly. For an already presented finite étale algebra, a norm-induced multiplicative character and a trace-induced additive character have those factorisations; their finite-field component lifts are imported from the predecessor. The comparison does not construct or classify finite étale algebras.

Two trivial multiplicative components with nontrivial additive components each have native Gauss sum −1, so the product-algebra Gauss sum is 1. The source-negative convention on the whole algebra gives −1, and is distinct from taking a negative sign on each component. The empty product is a singleton ring; both sides equal one. These boundary cases check component counts and prevent a field-only nontriviality condition from being imposed on the elementary product identity.

## Sources, validation and assembly

The packet contains URLs, access date 2026-10-05 and SHA-256 hashes for every downloaded cited source. The proof locators are [Kowalski’s author notes](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf), Propositions 1.10 and 1.13 and §2.1; [Conrad’s notes](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf), Appendix (A.6), p.19; the [public 2007 Cohen scan](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf), §§11.6.3 and 11.7.4 and the chosen-root comparison; and [BFP arXiv v2](https://arxiv.org/pdf/2206.07759v2), Lemma 5.2 proof, pp.8–9. The [author’s errata](https://www.math.u-bordeaux.fr/~cohen/deabookerrata.pdf) identifies the known distribution-variable correction. The complete product proof and Gamma distribution proof were read. Cohen Volume I’s digit-distribution proof was not available in the fetched author material; this part supplies its elementary fractional-part argument and uses the exact L3 multiplication node for factorials instead of claiming that unread proof was checked.

The suggested file imports individual native Mathlib modules and elaborates against the exact pinned Mathlib with admission warnings only. Packet validation with the pinned declaration index reports zero errors and zero warnings. The arithmetic examples and polynomial boundary checks support the convention review; elaboration does not prove the mathematical assertions.

The part chooses four planets: Finite-field Fourier inversion, Hasse–Davenport product formula, Projective polynomial evaluation and Two-point character orthogonality. Assembly reconciles the product planet with the retained predecessor target and replaces the obsolete coarse Fourier request with exact node imports. It also carries the one supplier gap into the assembled coverage until RD.6 supplies both inputs. All eight nodes remain unchecked. The completed planning pass is ready for independent review; its precise remaining work is source-interface closure and assembly reconciliation.
