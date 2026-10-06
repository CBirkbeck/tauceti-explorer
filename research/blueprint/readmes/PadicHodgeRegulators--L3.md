# P-adic regulators: big logarithms and signed extensions

## Scope and mathematical ownership

This part of **P-adic regulators and the local K₃ calculation** covers `PadicHodgeRegulators:L3` and `PadicHodgeRegulators:L4`. Its main analytic objects are the crystalline vector-valued Perrin–Riou regulator and the bounded Coleman coordinates which express it in a chosen Wach basis. A scalar regulator requires an additional functional or refinement; it is not determined by a representation alone. The noncrystalline extension is a separate, domain-qualified theorem.

The common input is supplied by the `(φ,Γ)` roadmap: `PG.4` supplies the integral ψ operator, `PG.5` the comparison with inverse-corestriction Iwasawa cochains, and `PG.6` Wach existence, lattice reconstruction and freeness in its stated unramified crystalline range. `PadicHodgeRegulators:L1` supplies Bloch–Kato maps; `L2` supplies regulator-specific normalization comparisons. The analytic Mellin equivalence belongs to `LocallyAnalyticDistributions:L3`. The bounded Iwasawa algebra and its division theory belong to `PadicMeasuresIwasawaAlgebras:L2` and `L4`. None of these carriers is defined again here. The good ψ-zero basis required by LLZ must be proved using their Theorem 2.12; ordinary Wach freeness is not that assertion.

The source for the declaration-level algebra below is Lei–Loeffler–Zerbes, *Coleman maps and the p-adic regulator*, Algebra & Number Theory **5** (2011), 1095–1131, especially §§3, 4A and 5A–5C. The publication and arXiv:1006.5163v2 are separate versions. Their local differences and the extent of source reading are recorded in the packet and handoff.

## Conventions

For the LLZ application, p is odd, E is a finite extension of Q_p, O is its ring of integers, and G=Δ×Γ₁ is the cyclotomic Galois group. Fix γ generating Γ₁ and write X=γ−1. The convention is HT(Q_p(1))=+1. Every use of a theorem about nonnegative Hodge–Tate weights retains that restriction and its admitted twist.

The bounded ring is R=O[[X]][1/ϖ], consisting of power series with bounded E-coefficients. It is **not** the ring of all formal series E[[X]]. Evaluation at x∈m_O is an algebra map on R, and division by X−x must be proved to remain in R. The analytic distribution algebra H(G) is another carrier. The Mellin identification used in the regulator construction is a module identification; it must not be treated as multiplicative for the ordinary product of analytic power series.

Coefficient vectors are rows and ordered vectors of basis elements are columns. For n′=Un and ν′=Bν, the coordinate row and matrix laws are

    c′ = c U⁻¹,           M′ = U M B⁻¹.

Apply the coefficient embedding R→H to U and c where necessary. These formulas imply c′M′=cMB⁻¹. Integral lattice invariance requires U∈GL_d(O), not just GL_d(E). A determinant generator is specified up to a unit unless an additional normalization is supplied.

## L3. Vector regulator and Euler operators

Construct the actual map

    L_V : H¹_Iw(Q_p,V) → H(G) ⊗_E D_cris(V)

by composing the inverse Iwasawa comparison, 1−φ, and the inverse Mellin module comparison. The direction of the Iwasawa isomorphism is important: in LLZ Definition 3.4 it is h_Iw:N(V)^(ψ=1)→H¹_Iw(Q_p,V), so the construction uses h_Iw⁻¹. Restrict this expression to the representation range in which that identification has been established. An arbitrary linear map between vector spaces of the expected dimensions is not an instance of this construction.

The full analytic targets include auxiliary-h comparison with the big exponential; every finite-order-character and integral-twist interpolation; Bloch–Kato exponential and dual-exponential formulas; growth, integrality, coefficient extension and reciprocity/determinant formulas; and the rank-one Coleman comparison with its actual sign and twist. Singular Euler operators must have their kernels and domains retained. All these targets are decomposed below. Both stages are planned, with the exact unresolved proof inputs and supplier signatures listed at the end; neither is closed.

### Leading Gamma factor

**Declaration:** `gammaLeadingFactor` (definition).

For j in Z define Gamma*(1+j)=j! if j>=0 and (-1)^(-j-1)/(-j-1)! if j<=-1, as a nonzero rational number, then map it into E. This is the leading Laurent coefficient of the classical Gamma function; it is not the p-adic Gamma function.

**Hypotheses.** E has characteristic zero.

**Construction or proof.** Define the two integer ranges using factorials; cast the rational factor to E.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Appendix B before Proposition B.1, PDF p.37.

**API.** `gammaLeadingFactor_nonneg`: For n in N its value at j=n is n!. `gammaLeadingFactor_neg`: Its value at j=-n-1 is (-1)^n/n!. `gammaLeadingFactor_ne_zero`: It is nonzero for every integral j.

**Uses.** LZ Theorem B.5 and RJ Theorem I.27: Normalize interpolation in both weight ranges.

**Tests.** `gamma_zero`: At j=0 the factor is 1. `gamma_minus_two`: At j=-2 it is -1. `gamma_minus_three`: At j=-3 it is 1/2, not 2.

**Acceptance.** At j=-1 the factor is +1, at j=-2 it is -1.

### Logarithmic factors

**Declaration:** `logarithmicFactors` (definition).

In each H_E(Gamma_1) component set ell_i=log(1+X)/log(chi(gamma))-i for i in Z, lambda_k=product_(0<=i<k) ell_i for k>=0, and delta_i=ell_i/(X+1-chi(gamma)^i). The apparent pole of delta_i is removable at x_i=chi(gamma)^i-1; its value there is 1/(chi(gamma)^i log(chi(gamma))). Put n_k=log(chi(gamma))^k lambda_k/product_(0<=i<k)(X-x_i).

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly.

**Construction or proof.** Use convergent open-disc logarithms from the analytic supplier. Divide the simple zero at x_i in the analytic algebra, retaining the removable value. The empty products are one.

**Imports.** `LocallyAnalyticDistributions:L1`, `LocallyAnalyticDistributions:L3`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Sections 1C3, 2.1 and 4.16, pp.1101,1107,1124.

**API.** `ellFactor_eval_weight`: ell_i(chi^j eta)=j-i for any finite-order eta on Gamma_1. `lambdaFactor_succ`: lambda_(k+1)=lambda_k ell_k, lambda_0=1. `deltaFactor_cleared`: (X-x_i)delta_i=ell_i, including the removable point. `ellFactor_generator`: log(gamma)/log(chi(gamma)) is independent of the chosen topological generator under the group-algebra change of variable.

**Uses.** LLZ Theorems 2.10,4.6,4.16: Record precisely the analytic determinant factors. LZ Appendix B and general twist extension: Control auxiliary weights and their zeros.

**Tests.** `ell_at_zero`: ell_0 at the trivial character is 0, whereas ell_1 there is -1. `delta_at_node`: delta_0 at X=0 is 1/log(chi(gamma)), not zero or an undefined inverse. `lambda_empty`: lambda_0=n_0=1; lambda_2 at chi^3 is 6.

**Acceptance.** delta_i(x_i) is a nonzero scalar; ell_i is not a unit because it vanishes at every chi^i finite-order twist.

### Crystalline Perrin–Riou regulator

**Declaration:** `crystallineRegulator` (construction).

Define L_V=(Mellin_inverse tensor 1) composed with (1-phi) composed with h_Iw^(-1), from H^1_Iw(Q_p,V) to H_E(G) tensor_E D_cris(V). Here h_Iw:N(V)^(psi=1)~=H^1_Iw is the actual PG/L2 comparison, and the Wach embedding takes (1-phi)x into (B_rig^+)^(psi=0) tensor D_cris(V). This is a Lambda_E-linear continuous map; its analytic scalar extension is H_E-linear.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution.

**Construction or proof.** Berger A.3 places the genuine Iwasawa class in N(V)^(psi=1). LLZ Lemma1.7 gives N(V) subset phi*N(V) in the stated weight range. The left inverse psi phi=id proves psi((1-phi)x)=0. Apply the actual Wach-to-period embedding and the Mellin module equivalence; Mellin respects the G action, rather than ordinary power-series multiplication.

**Imports.** `PadicHodgeRegulators:L2`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-one-to-zero`, `PhiGammaModulesAndIwasawaCohomology:PG.5`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `LocallyAnalyticDistributions:L3`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section 3A, Definition 3.4, pp.1116-1117.

**API.** `crystallineRegulator_apply`: Mellin(L_V(z))=(1-phi)h_Iw^(-1)(z) in the specified period module. `crystallineRegulator_linear`: L_V(a z+b w)=a L_V(z)+b L_V(w) for a,b in Lambda_E, acting by convolution. `crystallineRegulator_ext`: The Mellin identity determines the map uniquely. `crystallineRegulator_coefficient`: The map commutes with finite coefficient extension using the supplier comparison squares.

**Uses.** GeneralizedHeegnerCycles:GH.4 and GH.7; KatoEulerSystems:L3; RankZeroOneBSD:BSD.6a and BSD.7a: The vector map is the local output to pair with a specified period functional. LLZ Section3: Supply the unbounded side of the bounded decomposition.

**Tests.** `regulator_zero`: The zero Iwasawa class has zero regulator. `regulator_phi_fixed`: An actual phi-fixed psi-one class is killed by 1-phi; for E(1) this kills the Kummer Tate tower. `regulator_composition_order`: In the finite linear-map model h(x)=2x, boundary(x)=3x, Mellin_inverse(x)=5x, L(2)=15; using h instead of h inverse would give 60.

**Acceptance.** Do not identify an arbitrary linear map of the same rank with this composite. The no-trivial-quotient assumption is not deleted.

### Derivative obstruction module

**Declaration:** `bigExponentialObstruction` (definition).

For h>=1 with Fil^(-h)D_cris(V)=D_cris(V), define Delta_h on (B_rig^+)^(psi=0) tensor D_cris(V) by the derivative values partial^k f(0) modulo (1-p^k phi)D_cris(V), 0<=k<=h, with their k twists. The admissible source is ker Delta_h. The kernel of 1-phi on the psi-one period module is direct_sum_(0<=k<=h)t^k D_cris(V)^(phi=p^(-k)).

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is crystalline; h>=1 and Fil^(-h)D_cris(V)=D_cris(V).

**Construction or proof.** Form the actual quotient of D_cris by the image of each Euler endomorphism and the finite derivative map. Prove Berger p.120 exact sequence, rather than infer surjectivity of 1-phi from psi phi=id.

**Imports.** `PadicHodgeRegulators:L0`, `PhiGammaModulesAndIwasawaCohomology:PG.4`, `LocallyAnalyticDistributions:L1`.

**Source.** [Berger2003](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Section II.5, exact sequence and Definition II.12, p.120.

**API.** `bigExponentialObstruction_mem`: f is admissible iff partial^k f(0) lies in image(1-p^k phi) for every indicated k. `bigExponentialObstruction_nonsingular`: If all these Euler maps are invertible, Delta_h=0 and its kernel is the whole source. `bigExponentialObstruction_lift`: An admissible f has a psi-one lift y with (1-phi)y=f; any two lifts differ in the displayed kernel.

**Uses.** Berger Definition II.12: Use the exact source of the big exponential. L3 singular specializations: Express the kernel instead of a total inverse.

**Tests.** `obstruction_phi_one`: For rank-one phi=1, k=0 forces f(0)=0, so a nonzero constant derivative is inadmissible. `obstruction_nonsingular`: For phi=2 over Q_5 and h=1, both 1-2 and 1-10 are invertible; no derivative obstruction remains. `obstruction_lift_nonunique`: At phi=1 two lifts differing by a constant have the same boundary; no unique inverse is inferred.

**Acceptance.** Derivative values belong to quotients, not chosen complements.

### Perrin–Riou big exponential

**Declaration:** `bigExponential` (construction).

For admissible f in ker Delta_h choose a psi-one lift y with (1-phi)y=f and define Omega_(V,h)(f)=nabla_(h-1)...nabla_0(y), with nabla_i=t partial-i. Its value is well-defined in D_rig^+(V)^(psi=1)/V^(H_Qp). If D_cris(V)^(phi=p^(-h))=0 (in particular no E(h) subrepresentation), the unquotiented value is well-defined. Map to H_E tensor_Lambda H^1_Iw using the established comparison.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; h>=1 with Fil^(-h) full; the source is ker Delta_h, not an arbitrary period vector.

**Construction or proof.** The kernel of 1-phi consists of the t^k eigenvectors just recorded. nabla_(h-1)...nabla_0 kills those with k<h. The surviving k=h vectors represent E(h) invariants and vanish in the target quotient. Apply Berger TheoremII.13 and its h/gamma-normalized comparison with Iwasawa cohomology.

**Imports.** `PadicHodgeRegulators:L3/big-exponential-obstruction`, `PadicHodgeRegulators:L2`, `PadicHodgeRegulators:L3/logarithmic-factors`.

**Source.** [Berger2003](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), Definition II.12, Theorem II.13 and Remark II.14, pp.120-121.

**API.** `bigExponential_lift`: Every valid lift gives the stated differential product in the quotient. `bigExponential_linear`: Omega_(V,h) is H_E-linear in the specified Mellin convention. `bigExponential_no_tate`: If no E(h) lies in V, the differential lift is independent in the unquotiented psi-one module. `bigExponential_h_succ`: nabla_h Omega_(V,h)=Omega_(V,h+1) with the natural obstruction-source comparison.

**Uses.** Berger TheoremII.10 and II.16: Interpolate and pair the big exponential. LLZ Theorem4.6: Compare it with the intrinsic regulator.

**Tests.** `bigexp_zero`: Omega_(V,h)(0)=0 in the quotient. `bigexp_kernel_killed`: For a lift difference t^k v with 0<=k<h, the differential product is zero. `bigexp_top_kernel`: For k=h the product is h! t^h v, nonzero before passing to invariants; the quotient cannot be dropped.

**Acceptance.** A chosen inverse of 1-phi is not the definition.

### Auxiliary weight and twist comparison

**Declaration:** `bigExponential_regulator` (comparison).

Under the nonnegative, no-trivial-quotient hypotheses and the nonsingular Euler assumptions of LLZ4.5, over Frac(H_E) one has Omega_(V,h) L_V(z)=lambda_h z after identifying its Mellin source, for any admitted h>=1. Omega_(V,h+1)=ell_h Omega_(V,h); twisting sends Omega_(V,h)(f) tensor e_j to Omega_(V(j),h+j)(partial^(-j)f tensor t^(-j)e_j), on the common domain. Thus the intrinsic L_V is independent of h.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked. Choose h>=max(1,r_d); interpret equalities in the analytic scalar extension and its localization.

**Construction or proof.** Unfold Berger differential lift and (1-phi)h_Iw inverse; their composite yields lambda_h. Use RemarkII.15 for h and twist laws. Specializing when ell_h vanishes does not permit division.

**Imports.** `PadicHodgeRegulators:L3/big-exponential`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/logarithmic-factors`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorem4.6, p.1120; [Berger2003](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), RemarkII.15, p.121.

**Acceptance.** h=0/r_d=0 is compared using h=1 and localization, never a nonexistent unqualified inverse.

### Crystalline twist extension

**Declaration:** `meromorphicRegulator` (construction).

For arbitrary E-linear crystalline V choose m>>0 so V(m) has nonnegative weights and no trivial quotient. Define L_V(z)=(ell_-1...ell_-m)^(-1) Tw_(chi^m)(L_(V(m))(z tensor e_m)) tensor t^m e_-m. The value lies in the total fraction algebra of H_E(G), component by component; it is independent of m. No general H_E-valued assertion follows without proving cancellation of these factors.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; use an admitted m and the actual twist comparison maps.

**Construction or proof.** Use LZ4.4 and the one-step twisting relation to compare m with m+1; telescope the denominator factors. Localize at their nonzero-divisors.

**Imports.** `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/auxiliary-h-comparison`, `PadicHodgeRegulators:L3/logarithmic-factors`, `PadicHodgeRegulators:L2`.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Section4.4 and AppendixB equation(10), pp.21,39.

**API.** `meromorphicRegulator_choice`: The value is independent of every admitted twist m. `meromorphicRegulator_cleared`: Multiplication by ell_-1...ell_-m gives the stated twisted positive-range map. `meromorphicRegulator_positive`: For V in the intrinsic range it equals L_V after localization.

**Uses.** LZ explicit reciprocity with V*(1): Permit negative dual weights in the exact fractional algebra. StageL3 full crystalline scope: Expose the extra cancellation assertion an H-valued extension would require.

**Tests.** `twist_extension_identity`: An admitted m=0 recovers the intrinsic positive-range regulator. `twist_extension_one_step`: The m=1 and m=2 formulas agree by the one-step ell_-2 relation. `twist_extension_pole_control`: In a scalar analytic model a nonzero numerator at the zero of ell_-1 gives a pole, so localization alone is not an H-valued result.

**Acceptance.** Unrestricted negative weights are not silently assigned the positive-range codomain.

### Ramified character interpolation

**Declaration:** `crystallineRegulator_ramified` (theorem).

Let eta=chi^j omega, j in Z, omega finite order of conductor p^n, n>=1; extend coefficients to contain omega. Write z_(eta,0) for the actual specialization in H^1(Q_p,V(eta^(-1))). Then L_V(z)(eta)=Gamma*(1+j) tau(omega)^(-1) p^(n(1+j)) phi^n (B_(j)(z_(eta,0)) tensor t^(-j)e_j), with the finite-character de Rham descent understood. B_j=exp*_(Q_p,V(eta^(-1))*(1)) for j>=0 and the Bloch–Kato logarithm on the finite part for j<=-1. The log is the inverse of exp only on its isomorphism range; source condition (dagger) supplies the finite-part class for this formula.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. z lies in the analytic Wach psi-one image (dagger of LZ AppendixB); in particular every z in the stated intrinsic range does. The Gauss sum uses the chosen roots and omega, not omega inverse.

**Construction or proof.** LZ B.1 expresses the BK maps by p^-n times constant coefficients of phi^-n partial^j x. B.2 applies the unnormalized omega^-1 trace and identifies it with tau(omega)phi^-n times evaluation. Use B.4 descent and the Tate factor phi^n(t^j e_-j)=p^(nj)t^j e_-j. Combine to obtain B.5, retaining (dagger) and the logarithm domain.

**Imports.** `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/gamma-leading-factor`, `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2`.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB PropositionsB.1-B.2, LemmaB.4 and TheoremB.5, pp.36-39.

**Acceptance.** Check Gamma*(0)=1 and conductor power n(j+1); a formula valid only for j>=0 does not cover the target.

### Unramified character interpolation

**Declaration:** `crystallineRegulator_unramified` (theorem).

For eta=chi^j and j in Z put A_j=1-p^j phi and B_j=1-p^(-1-j)phi^(-1) on D_cris(V). If B_j is invertible then L_V(z)(chi^j)=Gamma*(1+j) A_j B_j^(-1) b_j(z_(chi^j,0)), where b_j is the exp*/log value with its Tate descent from the preceding theorem. No invertibility of A_j is required for this direction.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The same Wach-image condition (dagger) holds; B_j is bijective; for the negative range retain the actual finite-class logarithm domain.

**Construction or proof.** Apply LZ B.1 at n=0 and B.2 at the origin. The commuting Euler polynomials give the stated product; invert B_j only using its explicit bijectivity hypothesis.

**Imports.** `PadicHodgeRegulators:L3/ramified-interpolation`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L1`.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB TheoremB.5 and the parenthesis immediately following it, pp.39-40.

**Acceptance.** When phi=1,j=0, A_j=0 while B_j=1-p^-1 is invertible; a vanishing specialization is valid.

### Specialization with singular Euler operators

**Declaration:** `crystallineRegulator_singular` (theorem).

For every integral j under (dagger), with no Euler invertibility assumption, B_j L_V(z)(chi^j)=Gamma*(1+j) A_j b_j(z_(chi^j,0)). More precisely, if u_j is the constant coefficient of partial^j h_Iw^(-1)(z) after Tate descent, the unsimplified identities are L_V(z)(chi^j)=A_j u_j and B_j u_j=Gamma*(1+j)b_j. They determine a relation, including the image of A_j(ker B_j); replacing B_j^(-1) by a total inverse is not a formula. For the big-exponential inverse keep ker Delta_h and the invariant quotient.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. Use b_j and the negative-weight log on precisely the domains in ramified-interpolation.

**Construction or proof.** Retain the constant coefficient before any division in LZ B.1-B.2 at n=0; compose the two commuting Euler maps. If B_j is singular, two lifts differ by ker B_j and the corresponding outputs differ by A_j of that kernel. The authentic period lift fixes this value; BK data alone need not determine it.

**Imports.** `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/big-exponential-obstruction`, `PadicHodgeRegulators:L3/big-exponential`, `PadicHodgeRegulators:L3/ramified-interpolation`.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB PropositionsB.1-B.2, pp.37-38; [Berger2003](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), SectionII.5 exact sequence, p.120.

**Acceptance.** For rank-one phi=p^(-1),j=0, B_j=0 and A_j=1-p^-1; the cleared equality gives no unique output. An exceptional derivative formula requires separate input.

### Regulator growth on Frobenius quotients

**Declaration:** `crystallineRegulator_growth` (theorem).

Let W subset D_cris(V) be phi-stable and h>=0. If every phi eigenvalue on Q=D_cris(V)/W has v_p(alpha)>=-h, the projection of L_V(z) to Q belongs to distributions of order h on the cyclotomic group, with the LAD C^h-dual convention. In particular take h=max(0,-min v_p(alpha)). State the seminorm bound on each finite-character component; no universal bounded (order zero) assertion is made.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. W is phi-stable; h is a nonnegative real number and the slope bound holds on Q.

**Construction or proof.** LZ Proposition4.8 reduces to the one-variable growth statement. Prove the coefficient/annulus estimate for the actual Wach inclusion and phi iterates, then transfer it by Mellin to the requested C^h-dual norm. The one-variable estimate must be established, not assumed because LZ calls it well known.

**Imports.** `PadicHodgeRegulators:L3/crystalline-regulator`, `LocallyAnalyticDistributions:L2`, `PhiGammaModulesAndIwasawaCohomology:PG.6`.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Proposition4.8 and AppendixC, pp.17,41-43.

**Acceptance.** A slope -1 gives order 1, not a bounded measure; a scalar projection inherits a slope bound only from its admitted quotient.

### Regulator naturality and integral lattice

**Declaration:** `crystallineRegulator_naturality` (theorem).

For finite E extensions and equivariant morphisms of crystalline representations in the intrinsic range, L commutes with the actual D_cris and Iwasawa comparison maps. For a G-stable T its image lies in the Mellin inverse of (phi*N(T))^(psi=0) embedded in the analytic period target. It need not lie in Lambda_O tensor an arbitrary D_cris lattice. Changing gamma only changes X by (1+X)^a-1; changing roots zeta to sigma_a zeta multiplies the regulator distribution by [sigma_a]^(-1). These assertions compose and respect identities.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. For lattice statements use an integral good psi-zero basis; coefficient extension is finite and flat, and all cohomological base-change hypotheses are supplied by L2.

**Construction or proof.** Check the actual h_Iw, Wach embedding, phi/psi and Mellin squares individually. Integral (1-phi) preserves the phi* lattice. Basis coordinates are integral, while the embedding matrix is analytic. Use LZ Remark4.16 for roots and the chart homomorphism for generators. Do not use PG.7 as blanket base change for arbitrary families.

**Imports.** `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L4/good-wach-basis`, `PadicHodgeRegulators:L2`, `LocallyAnalyticDistributions:L3`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section3A, pp.1116-1117; [LZ2014](https://arxiv.org/pdf/1108.5954v3), Remark4.16, p.20.

**Acceptance.** Test a root change by a, then b, obtaining [sigma_ab]^-1, and distinguish it from multiplying by [sigma_a].

### Perrin–Riou explicit reciprocity formula

**Declaration:** `crystallineRegulator_reciprocity` (theorem).

With the crystalline pairing extended linearly in the first and via iota(g)=g^-1 in the second variable, [L_V(x),L_(V*(1))(y)]_cris=-sigma_-1 ell_0 <x,y>_Iw in the total fraction algebra of H_E(G). sigma_-1 is the inertia element with chi=-1; the dual regulator uses the admitted meromorphic twist extension. Equivalently Berger II.16 states (-1)^h <Omega_(V,h)(f),[-1]Omega_(V*(1),1-h)(g)>=-[f,iota(g)].

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; x,y are actual Iwasawa classes and the pairings are the L2/L1 local-duality pairings with these normalizations.

**Construction or proof.** Use BergerII.16 with its sign warningII.17, or LZ B.6 proof: specialize at sufficiently large integral j, cancel the factorial and adjoint Euler factors using BK local duality, then use analytic uniqueness from LAD. Extend the dual regulator by LZ equation(10). Semilinearity and sigma_-1 account for the sign; omit neither.

**Imports.** `PadicHodgeRegulators:L3/meromorphic-twist-extension`, `PadicHodgeRegulators:L3/big-exponential`, `PadicHodgeRegulators:L3/logarithmic-factors`, `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2`, `PadicHodgeRegulators:L3/unramified-interpolation`.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), AppendixB equation(10) and TheoremB.6, pp.39-40; [Berger2003](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf), TheoremII.16 and RemarkII.17, pp.122-123.

**Acceptance.** Changing the second variable by g multiplies the pairing by g^-1.

### Determinant of the crystalline regulator

**Declaration:** `crystallineRegulator_determinant` (theorem).

Under NC, for each Delta component the determinant ideal of the H_E-linear scalar extension of L_V, with actual rank-d Iwasawa source, is generated up to H_E-unit by product_(i=0..r_d-1) ell_i^(d-n_i), where n_i=dim_E Fil^(-i)D_cris(V)=#{j:r_j<=i}. The determinant is an ideal in the analytic algebra, not a chosen equality of basis determinants.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Construction or proof.** LLZ4.7 derives this from det Omega_(V,r_d)=product ell_i^n_i (Perrin–Riou delta(V) theorem), itself obtained from reciprocity and the determinant comparison of dual cohomology. Record the exact determinant comparison input as a gap; a scalar-valued pairing identity alone is not a proof of its integral determinant normalization.

**Imports.** `PadicHodgeRegulators:L3/auxiliary-h-comparison`, `PadicHodgeRegulators:L3/explicit-reciprocity`, `PadicHodgeRegulators:L3/logarithmic-factors`, `PadicHodgeRegulators:L2`, `PadicMeasuresIwasawaAlgebras:L5`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Corollary4.7 and proof, p.1120.

**Acceptance.** Weights (0,2) give ell_0 ell_1, whereas (1,1) give ell_0^2; these cases discriminate a rank-only formula.

### Scalar projection of a regulator

**Declaration:** `scalarRegulator` (construction).

Given an explicitly chosen E-linear functional ell:D_cris(V)->E, define scalarRegulator_(V,ell)=(1 tensor ell) L_V. A differential or refinement supplies ell only after its pairing and period normalization are proved. The vector regulator is canonical with its cyclotomic choices; this scalar projection is not chosen from V alone.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. ell is specified, including every period scalar when it is derived from a geometric differential.

**Construction or proof.** Apply the actual tensor-product linear map to the vector regulator; coefficient extension transports both the map and the functional.

**Imports.** `PadicHodgeRegulators:L3/crystalline-regulator`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section3 equation(2), p.1117; Section1C6 modular bases.

**API.** `scalarRegulator_apply`: The output is (1 tensor ell)(L_V(z)). `scalarRegulator_add_functional`: Projection for ell1+ell2 is the sum of the two projections; scaling ell scales the output. `scalarRegulator_base_change`: Finite coefficient extension commutes after transporting ell. `scalarRegulator_growth`: The vector seminorm bound gives the projected bound times the functional norm; a stronger eigenline bound needs the specified phi-stable quotient.

**Uses.** GeneralizedHeegnerCycles:GH.7; KatoEulerSystems:L3; RankZeroOneBSD:BSD.7a: Record the extra period/differential data that arithmetic consumers must supply.

**Tests.** `scalar_zero_functional`: The zero functional gives the zero map. `scalar_ordered_projection`: For vector (2,3), first projection gives 2 and second gives 3. `scalar_period_scaling`: Replacing a functional by twice itself doubles every value; it cannot be silently treated as the same normalized scalar regulator.

**Acceptance.** Two nonproportional functionals can give different scalar outputs for the same class.

### Rank-one Tate and Coleman comparison

**Declaration:** `tateRegulator_coleman` (comparison).

For V=E(1), d=t^-1 e_1 and principal norm-compatible cyclotomic units u, the actual Kummer map satisfies L_(E(1))(kappa_Iw(u))=ell_0 Col_0(u) tensor d=-ell_0 Col(u) tensor d. Col_0 is exactly the raw ColemanPowerSeries composite and Col=-Col_0. Equivalently Mellin(Col_0(u))=(1-phi/p)log(f_u) and partial of this equals (1-phi)Delta(f_u). On psi-zero partial inverse is multiplication by x^-1 under Amice; no integration constant is chosen. The regulator kills the Tate-root tower and the coefficient-extended fundamental Coleman sequence gives the moment cokernel.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V=E(1), u lies in the actual principal inverse-limit unit module; use the same roots, norm operator, Kummer cocycle and Tate basis.

**Construction or proof.** Use the commuting Kummer/Coleman diagram of LZ6.4.2. Differentiate its (1-phi/p)log(f_u), use partial phi=p phi partial, and compare it with the exact imported raw map. The Mellin relation t partial corresponds to ell_0, giving the multiplier; the imported sign-adjusted map introduces the minus sign. Match Kummer to h_Iw using the L2 comparison, not a rank argument.

**Imports.** `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/logarithmic-factors`, `PadicHodgeRegulators:L2`, `ColemanPowerSeries:L2/raw-coleman-map`, `ColemanPowerSeries:L2/normalized-coleman-map`, `ColemanPowerSeries:L3/principal-coleman-sequence`, `ColemanPowerSeries:L3/finite-flat-coleman-sequence`, `PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence`.

**Source.** [LZ2014](https://arxiv.org/pdf/1108.5954v3), Section6.4.2 diagram and text, pp.28-29.

**Acceptance.** Test the roots-of-unity kernel and distinguish ell_0 Col_0 from either Col_0 alone or +ell_0 Col.

### Ordinary and multiplicative Coleman map

**Declaration:** `rubinColemanMap` (construction).

For an elliptic curve A/Q with good ordinary or multiplicative reduction at odd p, T=T_p A, let alpha in Z_p^times be the ordinary root and beta=p/alpha. In split multiplicative reduction set (alpha,beta)=(1,p), in nonsplit (-1,-p). On the actual inverse-corestriction singular quotients H^1_(infty,s)(Q_p,T) define Col_infty into Lambda(Z_p-extension) with its injection and Rubin III.5.14 normalization. For nontrivial finite chi of conductor p^k its value is alpha^-k tau(chi) sum_(g in G_n)chi(g)^-1 exp*_(omega_A)(g z_n). At chi=1 it is (1-alpha^-1)(1-beta^-1)^-1 exp*_(omega_A)(z_0).

**Hypotheses.** p is odd; A has the stated reduction; use Rubin cyclotomic Z_p-extension indexing Q_n and compatible p-power roots. omega_A is the specified Neron differential; local finite quotients and integral H^1_s are inherited from L1/Selmer.

**Construction or proof.** Construct via the ordinary/multiplicative rank-one local duality and formal-group Coleman series, with integral singular quotient descent. Rubin cites the appendix of Rubin1998 for this explicit construction; that proof input is recorded as a gap, not replaced by interpolation as an axiom. Verify the displayed finite-character identities and injection on the actual singular inverse limit. Characters determine bounded outputs using the correct uniqueness theorem.

**Imports.** `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2`, `SelmerIwasawaCohomology:L3`, `PadicHodgeRegulators:L3/tate-coleman-comparison`.

**Source.** [RubinES](https://swc-math.github.io/notes/files/99RubinES.pdf), III Section5.8, Proposition5.14, printed p.52.

**API.** `rubinColemanMap_specialization`: Finite-character values are exactly the displayed Gauss-sum/differential formulas. `rubinColemanMap_injective`: Its kernel on the singular inverse-limit module is zero. `rubinColemanMap_linear`: It is Lambda-linear on that actual source. `rubinColemanMap_period`: Rescaling the differential by c rescales its scalar dual-exponential coordinate by c^-1, and hence the map by c^-1.

**Uses.** Rubin III.5.15 and supplied source extraction r3-prop-5.14-b: Provides the construction consumed by the noncrystalline augmentation assertion.

**Tests.** `rubin_zero`: Col_infty(0)=0. `rubin_split_trivial`: At split multiplicative alpha=1 the trivial specialization is zero. `rubin_nonsplit_trivial`: At p=5 and alpha=-1,beta=-5 the trivial Euler multiplier is 5/3, so it is not automatically zero.

**Acceptance.** The ramified exponent uses the conductor k, not the chosen level n; the unramified denominator 1-beta^-1 is nonzero in the stated cases.

### Quadratic Euler calculation

The finite-dimensional input to LLZ Lemma 5.6 can be isolated without pretending to construct the regulator. Let Φ²+aΦ+bI=0 and put s=1+a+b. Define

    P = −b⁻¹(Φ+aI),          Q = s⁻¹(Φ+(1+a)I).

If b≠0, expansion of the quadratic relation proves ΦP=PΦ=I. If s≠0, it proves (I−Φ)Q=Q(I−Φ)=I. With p,b,s nonzero,

    Q(I−p⁻¹P)
      = ((1+a+pb)Φ + (a(1+a+pb)+b(p−1))I)/(pb(1+a+b)).

All inverses here are scalar inverses with stated nonvanishing conditions. For Φ=1 the second denominator can vanish; for Φ=0 the first can vanish. Neither case is repaired by using a total inverse operation that returns zero. Matrix multiplication is never assumed commutative; P and Q commute with Φ because they are polynomials in it.

The declarations are `quadraticFrobeniusInverse`, `quadraticFrobeniusInverse_spec`, `quadraticEulerInverse`, `quadraticEulerInverse_spec` and `quadraticEulerProduct`. The two inverse specifications are separate lemma nodes used by the product theorem. Scalar extension is expressed by applying a field embedding entrywise.

## L4. Coleman images and changes of basis

### A finite-evaluation module

The algebraic proof has the following precise interface. Let E be a field, R a nonzero commutative E-algebra which is a domain, t∈R, x_j∈E pairwise distinct, and ev_j:R→E E-algebra homomorphisms such that

    ev_j(t)=x_j,       q_j=t−x_j ≠ 0,
    ev_j(f)=0  if and only if  q_j divides f.

Scalars x_j are mapped into R in the expression q_j. Let V_j⊆E^d be subspaces. For a finite set J of indices define

    S_J(V) = { F∈R^d : ev_j(F)∈V_j for every j∈J }.

This is `evaluationConstraints`, an R-submodule because every ev_j respects multiplication. The nonzero-q_j hypothesis is substantive: allowing R=E and t=x_j can turn S into a proper E-subspace, defeating the rank-d conclusion. The domain hypothesis is also substantive: a nonzero zero-divisor need not identify R with q_jR. Pairwise distinctness is separate again: two conditions at the same point do not supply a doubled zero or a jet condition.

**One point — `singleConstraintBasisExists`.** Extend a basis of V_j to one of E^d, with row matrix C. In those coordinates the complementary entries must lie in q_jR. Consequently the rows of diag(1,…,1,q_j,…,q_j)C form a basis of S_{j}(V). Injectivity uses q_j≠0 and the domain assumption; surjectivity uses the evaluation-kernel division theorem. Its determinant is associated to q_j^codim(V_j). Use Mathlib's `Module.Basis` and `Module.Basis.extend`, not a private basis type.

**Several points — `constraintBasis`.** Suppose B is the row matrix of the basis for the old conditions. `constraintBasisEvaluationInvertible` proves that at a new point x_j its determinant is a unit times a product of nonzero differences x_j−x_i, so B(x_j) is invertible. The new condition on the coefficient row is the inverse image of V_j under row multiplication by B(x_j), namely V_jB(x_j)⁻¹. This is `transportedSpecialization`; `transportedSpecialization_finrank` exhibits the equivalence to V_j and proves equal codimension.

Apply the one-point construction to that coefficient module. The updated matrix is **CB**, with C on the left. The induction proves the basis and its determinant invariant together, so it does not assume the final determinant theorem to construct the basis. `constraintBasis_determinant` extracts the principal determinant ideal

    ( ∏_(j∈J) q_j^codim(V_j) ).

For any other basis, the determinant changes by a unit. This is an equality of ideals, or association of generators, not an assertion that every basis has the same determinant.

**A coordinate image — `coordinateImage_eq`.** For coordinate k set

    J_k = { j∈J : every v∈V_j has v_k=0 },
    g_k = ∏_(j∈J_k) q_j.

This is `projectionGenerator`. Then pr_k(S_J(V))=g_kR. The forward inclusion uses `divisibleByEvaluationProduct`: after dividing by q_j, the quotient still vanishes at x_i because x_i−x_j≠0. The reverse inclusion uses `projectionWitness`. Choose a vector in each V_j whose k-th coordinate is g_k(x_j), rescaling a vector with nonzero k-th coordinate; at a forced-zero point choose zero. Interpolate the other coordinates with Mathlib's `Lagrange.interpolate` and set the k-th coordinate to g_k itself. `Lagrange.eval_interpolate_at_node` verifies membership and gives the generator. Multiplication by R gives every element of g_kR.

This witness proof is over E. Values 0 and 1 at 0 and 5 require X/5 and cannot be interpolated by a polynomial over Z_5. Therefore the argument does not give integral surjectivity. Nor does coordinatewise surjectivity imply S_J(V)=R^d: the condition F(0)=G(0) is a simple counterexample.

### Actual Coleman coordinates and the logarithmic matrix

First supply the genuine ψ=1 source and ψ=0 Wach target and prove the good-basis result. If e is the coordinate map of that target, `colemanCoordinates` is Col=e∘(1−φ). `colemanCoordinates_reconstruct` recovers (1−φ)x using e⁻¹. The prototype also states this identity for arbitrary actual linear maps; that generality does not implement the arithmetic input.

Let j be the actual map into the analytic scalar extension and b the coordinate map of a fixed crystalline basis. Define `logarithmicMatrix` by its rows

    M_i = b(j(e⁻¹(e_i))).

`logarithmicMatrix_expansion` follows by finite basis expansion:

    b(j(w)) = algebraMap(e(w)) M.

Use `Module.Basis.constr_apply_fintype` and the existing bilinear row-multiplication API. `regulatorCoordinateDecomposition` applies this equality to (1−φ)x, and then uses the actual Iwasawa comparison to express the vector regulator. No determinant, dimension count or arbitrary functional substitutes for these maps.

At a specialization, l(x_j)∈V_j and l=cM with M(x_j) invertible give the Coleman condition c(x_j)∈V_jM(x_j)⁻¹. The two subspaces must not be identified without this transport. The determinant and image arguments identifying the genuine Coleman image with these constraints require LLZ's representation hypotheses and reciprocity input; the preceding algebra only computes the module once those subspaces have been determined.

`constantBasisCovariance` states both coordinate changes and invariance under simultaneous domain and target basis changes. The source's fixed-crystalline-basis case has B=I. A constant integral change is not a proof that every power-series Wach basis is good: LLZ Remark 2.14 leaves that larger assertion outside the theorem used here.

### Integral shear and rational versus integral images

For a two-dimensional coefficient row define `shearMatrix` by

    A = [[1,e₂],[e₁,1]],       (F′,G′)=(F+e₁G,G+e₂F).

`shearSpecializationLines` gives

    F=rG  if and only if  (1+e₂r)F′=(e₁+r)G′,

with the separate axis formulas F′=e₁G′ and G′=e₂F′. Nonzero determinant is sufficient over E, but over O the determinant must be a **unit**.

`integralShearChoice` chooses nonzero e₁,e₂ in the maximal ideal of O, avoiding the finitely many exceptional values −r and −r⁻¹. There are infinitely many choices even for a small residue field: positive powers of a uniformizer are distinct. Since e₁e₂ lies in the maximal ideal, `IsLocalRing.isUnit_one_sub_self_of_mem_nonunits` proves that 1−e₁e₂ is a unit. The maximal ideal is Mathlib's existing `IsLocalRing.maximalIdeal`.

All transformed lines have both projections nonzero. `shearedCoordinateSurjectivity` identifies S(V)A with S(VA) by evaluation and uses `coordinateImage_eq` to prove rational surjectivity. For the integral conclusion retain the actual lower inclusion used in LLZ Theorem 5.10, obtained from their earlier integral argument. Combine that inclusion with rational equality and the finite O-module quotient to prove finite cokernel. Theorem 5.13 concerns the pseudo-null correction, not automatic integral surjectivity. The ideal (5,X) in Z_5[[X]] is proper, has quotient F_5, and becomes full after inverting 5; it detects the invalid inference.

### Noncrystalline branch

The de Rham extension uses Rodrigues Jacinto, *(φ,Γ)-modules de de Rham et fonctions L p-adiques*, Algebra & Number Theory **12** (2018), 885–934, arXiv:1702.05636. Its construction belongs on its proved open character domain, with the actual ramification, growth and interpolation restrictions. It is not a globally defined scalar distribution for every de Rham representation. Prove comparison with crystalline Perrin–Riou theory only on the common domain. The source theorem, differential powers, convergence domain and interpolation restrictions are decomposed below. The arithmetic Lean signatures remain comments until their authentic supplier carriers exist.

### Good integral Wach bases

**Declaration:** `exists_goodWachBasis` (theorem).

For a crystalline V and G-stable T, each integral Wach basis n_i^0 admits a replacement n_i congruent n_i^0 mod pi such that b_i=(1+pi)phi(n_i) is a Lambda_O(G)-basis of (phi*N(T))^(psi=0). Rationally every E-basis nu_i of D_cris(V) has such a lift n_i mod pi. Analytically H_E tensor_Lambda (phi*N(V))^(psi=0) is (phi*N_rig(V))^(psi=0), and these b_i form its H_E-basis. This is an existence theorem, not a statement about all Wach bases.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; T stable; for the analytic closure argument use finite free modules with their canonical Frechet topology.

**Construction or proof.** Use the integral correction in LLZ2010 Lemma3.9 to improve Gamma invariance modulo pi^2. Proposition3.11 lifts generators successively modulo phi(pi)^k, using the Mellin identification of the products (1-chi(gamma)^(-i)gamma) with phi(pi)^k. Complete the successive lifts; equality of finite Z_p ranks at each quotient and intersection of the ideals equal to zero prove independence. Constant E basis transport supplies prescribed nu_i. For LLZ2.11 the scalar-extension image is finitely generated and closed, and bounded-series density makes it dense in the analytic target. Import the Frechet–Stein closedness theorem explicitly.

**Imports.** `PhiGammaModulesAndIwasawaCohomology:PG.6`, `LocallyAnalyticDistributions:L3`, `PadicMeasuresIwasawaAlgebras:L2`.

**Source.** [LLZWach2010](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf), Theorem3.5, Lemmas3.7-3.10, Proposition3.11, Lemma3.15, pp.10-13; [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Proposition2.11, Theorem2.12, Corollary2.13, Remark2.14, pp.1115-1116.

**Acceptance.** Changing by a constant GL_d(O_E) matrix preserves goodness. An arbitrary power-series change does not follow from this theorem.

### Noncritical crystalline refinement

**Declaration:** `noncriticalRefinement` (definition).

A refinement is a full phi-stable flag 0=Y_0 subset Y_1 subset ... subset Y_d=D_cris(V), dim Y_i=i. It is noncritical if each Y_i has the i smallest filtration weights in LLZ’s positive representation convention (weights -s_1>=...>=-s_d with 0<=s_1<=...<=s_d); Equivalently dim Fil^j(Y_i)=max(0,dim Fil^j(D_cris(V))-d+i), for every j, with multiplicities retained. On W=V(m) nonnegative weights are r_1<=...<=r_d with s_i=m-r_(d+1-i). Existence after finite E extension is a separate hypothesis.

**Hypotheses.** V is crystalline, initially with nonpositive weights -s_i. Repeated weights are allowed.

**Construction or proof.** Use the full induced filtered subspace, not only the list of phi eigenvalues. Interpret noncriticality using LLZ Section1C5 and the equivalent dimension equalities of the flag and filtration.

**Imports.** `PadicHodgeRegulators:L0`, `PadicHodgeTheory:R06.2`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section1C5, pp.1104-1105; Section2C before Proposition2.7, p.1112.

**API.** `noncriticalRefinement_flag`: Every step is phi-stable and has dimension i. `noncriticalRefinement_weights`: The induced filtration on Y_i has weights -s_1,...,-s_i. `noncriticalRefinement_extension`: Finite field extension transports a noncritical flag and its filtration dimensions.

**Uses.** LLZ Theorem2.10: Supplies the saturated flag used to compute elementary divisors. LLZ Section1D: Prevents treating Frobenius eigenvalues alone as a refinement.

**Tests.** `refinement_rank_one`: The unique flag of a rank-one filtered phi module is noncritical. `refinement_wrong_line`: For weights 0,-2 with Fil^1 the second eigenline, the flag starting in that line is critical in the LLZ positive convention. `refinement_scalar_phi`: With scalar phi any flag is stable, but only flags with the required filtration dimensions are noncritical.

**Acceptance.** A phi-stable line lying in the wrong filtration step fails noncriticality even if phi has distinct eigenvalues.

### Saturated Wach flag comparison

**Declaration:** `wachFlag_comparison` (theorem).

For a noncritical refinement of a positive V, put mathcalY_i=B_rig^+ tensor Y_i and X_i=N_rig(V) intersect mathcalY_i[(t/pi)^(-1)]. Then X_i is saturated, rank i, and has weights -s_1,...,-s_i. For m>=s_d put A_i=pi^-m X_i e_m and B_i=t^-m mathcalY_i e_m. B_i is the saturation of A_i; A_d/A_(i-1) embeds in B_d/B_(i-1), with quotient annihilated by (t/pi)^(m-s_i). Passing to phi* and psi-zero gives cyclic successive quotients Btilde_i/(Btilde_(i-1)+Atilde_i) with exact annihilator n_(m-s_i); n_(m-s_i) annihilates the remaining quotient.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the noncritical flag and m>=s_d; all intersections are in the same localized period module.

**Construction or proof.** LLZ2.4 proves saturation by intersecting a phi-stable period subspace and records equality of filtrations in 2.5 using the crystalline reduction theorem2.2. The supplier must give the t/pi comparison elementary divisors of 2.3. Use the dimension count in Lemma2.6 to bound the last quotient. Proposition2.7 converts it to the twisted flag. Lemma2.9 and Proposition1.6 transfer (t/phi(pi)) powers to n_k under Mellin; the rank-one quotient proves exact annihilation.

**Imports.** `PadicHodgeRegulators:L4/noncritical-refinement`, `PadicHodgeRegulators:L3/logarithmic-factors`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `LocallyAnalyticDistributions:L3`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Propositions2.4-2.5, Lemma2.6, Proposition2.7, Lemma2.9, pp.1110-1114.

**Acceptance.** In rank one the exact annihilator is n_r, not ell_0...ell_(r-1); its removable weight-node factors have been divided out.

### Elementary divisors of the logarithmic matrix

**Declaration:** `logarithmicMatrix_elementaryDivisors` (theorem).

For W with nonnegative weights r_1<=...<=r_d admitting a noncritical refinement after finite coefficient extension, the H_E(Gamma_1) elementary divisors of (B_rig^+)^(psi=0) tensor D_cris(W)/(phi*N_rig(W))^(psi=0), and hence of the row-oriented logarithmic matrix M, are n_(r_1),...,n_(r_d). Consequently det M is associated to their product. In particular M(x_i) is invertible for x_i=chi(gamma)^i-1, 0<=i<r_d, since n_r has a removable nonzero value there.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The refinement hypothesis holds after finite extension; work componentwise in H_E, with its actual elementary-divisor theorem.

**Construction or proof.** Apply the flag cyclic-annihilator criterion LLZ1.12 to the psi-zero filtration of2.9. Descend elementary-divisor ideals by faithful flatness and uniqueness under finite coefficient extension. Corollary3.2 transfers the lattice quotient calculation to the actual chosen basis matrix. Evaluate the removable n_r factors, including i>=r where numerator and denominator have no zero.

**Imports.** `PadicHodgeRegulators:L4/refinement-saturated-flag`, `PadicHodgeRegulators:L4/good-wach-basis`, `PadicHodgeRegulators:L4/logarithmic-matrix`, `PadicHodgeRegulators:L3/logarithmic-factors`, `LocallyAnalyticDistributions:L2`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Corollary1.12, Theorem2.10 and Corollary3.2, pp.1103,1114,1117.

**Acceptance.** Weights (0,2) give (1,n_2); the matrix has nonzero determinant but is not an analytic isomorphism everywhere.

### Coleman specialization subspaces

**Declaration:** `colemanSpecializationSubspaces` (definition).

Under NC define V_(i,eta) in D_cris(V) as (1-p^i phi)(1-p^(-1-i)phi^-1)^(-1) Fil^(-i) if eta=chi_0^i, and phi Fil^(-i) otherwise, for 0<=i<r_d. Identify D_cris with row coordinates through the chosen ordered nu basis. The constraint on Coleman rows is W_(i,eta)={v in E^d: v M(x_i) belongs to V_(i,eta)}=V_(i,eta) M(x_i)^(-1). It has codimension d-dim Fil^(-i).

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Construction or proof.** LLZ4.8 derives the filtration condition from reciprocity and the fact that the BK exponential vanishes on Fil^0. Corollaries4.9-4.10 identify the isotypical specialization. Transport by the actual evaluated matrix using the row convention. The coefficient-space subspace in Proposition4.11 must be this transported subspace, not the untransported V_(i,eta).

**Imports.** `PadicHodgeRegulators:L3/unramified-interpolation`, `PadicHodgeRegulators:L3/ramified-interpolation`, `PadicHodgeRegulators:L4/logarithmic-elementary-divisors`, `PadicHodgeRegulators:L4/logarithmic-matrix`, `PadicHodgeRegulators:L0`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Proposition4.8, Corollaries4.9-4.10 and Proposition4.11, pp.1120-1123.

**API.** `colemanSpecializationSubspaces_mem`: v is in W_(i,eta) iff v M(x_i) is in V_(i,eta). `colemanSpecializationSubspaces_codim`: codim W_(i,eta)=d-dim Fil^(-i). `colemanSpecializationSubspaces_covariance`: If M becomes U M B^-1 then W becomes W U^-1, with the period subspace transported by B^-1.

**Uses.** LLZ Theorems4.12,4.15: Defines the exact subspaces of the bounded image. ModularIwasawaMainConjectures:L0: Signed local conditions must use the coordinates in this chosen good basis.

**Tests.** `specialization_transport`: For V=span(1,0) and M=[[0,1],[1,0]], W=span(0,1), so the first Coleman coordinate is forced zero. `specialization_full_filtration`: If Fil^(-i) is full and both Euler maps invertible then W=E^d. `specialization_singular_exclusion`: A phi eigenvalue p^-1 at i=0 violates NC and forbids using the displayed inverse.

**Acceptance.** Using the raw period subspace as the Coleman constraint can give the wrong coordinate vanishing.

### Image of the Coleman vector map

**Declaration:** `colemanMap_image` (theorem).

Under NC, in each eta component the image of the actual Col:N(V)^(psi=1)->Lambda_E(Gamma_1)^d is exactly S={F:F(x_i) belongs to W_(i,eta),0<=i<r_d}. Its determinant ideal is product_i(X-x_i)^(d-n_i). Each coordinate image equals product_(i: W_(i,eta) subset {v:v_j=0})(X-x_i) Lambda_E. The kernel of 1-phi is zero under the excluded Frobenius eigenvalues, giving a bounded Lambda_E exact sequence with quotient direct_sum_i E^d/W_(i,eta), with Gamma action evaluated at x_i. Analytic scalar extension gives the corresponding H_E exact sequence.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Construction or proof.** The actual decomposition and filtration condition give containment in S. Compare regulator, logarithmic-matrix and constraint determinants as in LLZ4.12. The printed determinant argument needs the analytic lattice/descent criterion: equal determinants over H_E cannot by itself erase a possible proper bounded quotient. Record this precise input as a gap/request rather than treating equality as a generic determinant theorem over arbitrary rings. Apply the algebraic projection witness to the exact bounded equality. Use the kernel description of 1-phi for injectivity; evaluation and bounded Lagrange interpolation give the quotient. Write bounded and analytically extended sequences on their respective rings.

**Imports.** `PadicHodgeRegulators:L4/specialization-subspaces`, `PadicHodgeRegulators:L4/constraint-basis`, `PadicHodgeRegulators:L4/constraint-determinant`, `PadicHodgeRegulators:L4/projection-witness`, `PadicHodgeRegulators:L3/regulator-determinant`, `PadicHodgeRegulators:L4/logarithmic-elementary-divisors`, `PadicHodgeRegulators:L4/coleman-coordinates`, `PadicMeasuresIwasawaAlgebras:L4`, `LocallyAnalyticDistributions:L2`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorem4.12, Corollaries4.13-4.15, pp.1123-1124.

**Acceptance.** The coordinate ideal must come from transported W_(i,eta). The exact sequence is not a map onto a field with scalar ring forgotten.

### Elementary divisors of the regulator

**Declaration:** `crystallineRegulator_elementaryDivisors` (theorem).

Under NC the H_E(G)-module cokernel of the H_E-linear extension of the actual L_V has elementary divisors lambda_(r_1),...,lambda_(r_d). These are analytic cokernel invariants, not bounded Coleman coordinate images. For each component the determinant specializes to the L3 formula.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.

**Construction or proof.** Combine the elementary divisors of the image-constraint matrix and M. Their zero divisors are disjoint after the removable weight zeros are removed from n_r. Use the analytic elementary-divisor product criterion of LLZ4.16, with the nested weight multiplicities.

**Imports.** `PadicHodgeRegulators:L4/actual-coleman-image`, `PadicHodgeRegulators:L4/logarithmic-elementary-divisors`, `PadicHodgeRegulators:L3/logarithmic-factors`, `PadicHodgeRegulators:L4/regulator-coordinate-decomposition`, `LocallyAnalyticDistributions:L2`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorem4.16 and proof, p.1124.

**Acceptance.** Weights (0,2) give (1,ell_0 ell_1), not (1,(X-x_0)(X-x_1)) and not two identical factors.

### Rank-two modular specialization relation

**Declaration:** `modularColeman_specialization` (theorem).

For the nonordinary modular representation V=V_(fbar)(k-1) in LLZ Section1C6 (p odd, weight k>=2, p not dividing N, coefficient E containing eigenvalues, source Frobenius exclusions), use the prescribed ordered bases and M(0)=[[0,p^(k-1)],[-1,a_p]]. Then at the trivial Delta component (1-a_p+p^(k-2)) Col_2(z)(0)=p^(k-2)(p-1) Col_1(z)(0); at nontrivial eta, Col_2(z)^eta(0)=0. For k=2 the quotient functional on the ordered pair (Col_1,Col_2) is rho(g,h)=(p-1)g(0)-(2-a_p)h(0), valued in E. Its kernel is the actual rational image, and it is surjective when the coefficients are not both zero.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. f and V have LLZ1C6 hypotheses; phi has no eigenvalue in p^Z and the refinement input for image equality holds. The period/Frobenius comparison for the modular form is a proved external dependency.

**Construction or proof.** Use the quadratic Euler calculation with the source period basis, as in Lemmas5.6-5.7. Insert M(0) and set the unwanted filtration coordinate to zero. At k=2 compute the annihilator of that line directly. E303 records the printed swapped functional and coefficient field. The quotient sequence follows from the general image theorem in its stated range.

**Imports.** `PadicHodgeRegulators:L3/quadratic-euler-product`, `PadicHodgeRegulators:L4/actual-coleman-image`, `PadicHodgeRegulators:L4/specialization-subspaces`, `AutomorphicGaloisRepresentations:R19.5`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Lemma5.6, Corollary5.7, text before Proposition5.9 and Proposition5.9, pp.1126-1127.

**Acceptance.** At p=5,k=2,a_p=0 the vector (1,2) satisfies 2 h=4 g and our rho=0, while the printed rho is -6.

### Integral Coleman image has finite cokernel

**Declaration:** `integralColemanImage_finite` (theorem).

In the modular range of LLZ5.10 let X_j^eta be the rational coordinate generator and X_k=product_(i=0..k-2)(X-chi(gamma)^i+1). For the prescribed integral good basis, X_k Lambda_O subset Im Col_j^eta subset X_j^eta Lambda_O, and X_j^eta Lambda_O/Im Col_j^eta has finite O_E length, hence is pseudo-null over O_E[[X]]. After the integral shear of Proposition5.11 all X_j^eta become 1, so each coordinate cokernel is finite; integral surjectivity is not asserted.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the actual modular lattice and good basis of LLZ Section5; supply the integral lower inclusion for that lattice, including any extra (C),(D) restrictions required by the proof in LLZ2010.

**Construction or proof.** The lower inclusion is phi(pi)^(k-1)(phi*N(T))^(psi=0) subset (1-phi)N(T)^(psi=1). Its integral convergence proof is a specific unresolved input: LLZ2011 cites the proof of LLZ2010 Proposition4.11, whose stated scope is more restricted. Mellin transports the lower inclusion to X_k. The quotient X_j Lambda_O/X_k Lambda_O is finite free over O_E, and rational equality makes its further quotient torsion. Finite generation gives finite O_E length. Take the shear coefficients in the maximal ideal, avoid the finitely many forbidden ratios, and use inverse coordinate-basis transport. This removes rational zero factors, retaining the finite integral defect.

**Imports.** `PadicHodgeRegulators:L4/actual-coleman-image`, `PadicHodgeRegulators:L4/integral-shear-choice`, `PadicMeasuresIwasawaAlgebras:L4`, `PhiGammaModulesAndIwasawaCohomology:PG.6`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Theorems5.10,5.13 and preprint Remark5.12, pp.1128-1129; [LLZWach2010](https://antoniolei.com/wp-content/uploads/2014/09/modularforms.pdf), Proposition4.11 and proof, pp.26-27.

**Acceptance.** The proper ideal (varpi,X) becomes the full ring after inverting varpi but is not integrally surjective.

### Signed local conditions from Coleman maps

**Declaration:** `signedColemanLocalCondition` (construction).

For a specified actual good integral Wach basis and coordinate j, export the closed Lambda_O-submodule ker Col_j of H^1_Iw(Q_p,T) via the proved h_Iw comparison. Its Tate-orthogonal local condition on the dual torsion representation is owned by ModularIwasawaMainConjectures. Under basis n prime=U n its row maps become Col prime=Col U^-1; the new kernel need not equal the old kernel. A basis or named signed normalization is part of the input.

**Hypotheses.** p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The h_Iw lattice comparison and chosen integral good basis are specified; continuity gives the closed kernel.

**Construction or proof.** Transport the exact map, then take its genuine kernel. Export its pairing interface; do not reconstruct global Selmer groups here. No arbitrary good coordinate is identified with Pollack plus/minus without a separate source comparison.

**Imports.** `PadicHodgeRegulators:L4/coleman-coordinates`, `PadicHodgeRegulators:L4/good-wach-basis`, `PadicHodgeRegulators:L4/constant-basis-covariance`, `PadicHodgeRegulators:L2`.

**Source.** [LLZ2011](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), Section3A and Section1A applications, pp.1096-1097,1116.

**API.** `signedColemanLocalCondition_mem`: A class lies in the condition iff its specified Col_j value is zero. `signedColemanLocalCondition_closed`: The kernel is a closed Lambda_O submodule. `signedColemanLocalCondition_covariance`: Its transported description is {z:(Col(z) U^-1)_j=0}.

**Uses.** ModularIwasawaMainConjectures:L0; ModularIwasawaMainConjectures:L4: Local kernels and their exact basis dependence are the regulator-side export.

**Tests.** `signed_zero`: The zero class lies in every condition. `signed_basis_mix`: For Col(z)=(1,0) and U^-1=[[1,1],[0,1]], the second new coordinate is 1, so the second condition changes. `signed_scalar_basis`: Multiplying a coordinate by an O_E unit leaves its kernel unchanged; a noninvertible operation is not a basis change.

**Acceptance.** Equal rational images do not imply equal integral kernels.

### Admitted de Rham character domain

**Declaration:** `deRhamCharacterDomain` (definition).

Let D be a de Rham (phi,Gamma)-module over R_E, Delta=N_rig(D) its differential module, and m(Delta) an overconvergence/localization threshold. On a torsion weight component write a character kappa by z_kappa=kappa(exp(q)), q=p for odd p and q=4 for p=2. If the torsion components differ set v_p(z_kappa-z_eta)=-infinity. For a primitive finite character eta of conductor p^c set B(eta,N)={kappa:v_p(z_kappa-z_eta)>p^(N-c)}. Choose the source threshold N(D); put U_D=union_(c>m(Delta)) B(eta,N(D)). Choices give admissible domains with compatible restriction, not a maximal canonical domain or all weight space. N(D) can be bounded in terms of the conductor of an extension where D becomes semistable.

**Hypotheses.** E/Q_p finite; D is de Rham; the locally analytic character space is the actual PMIA weight space. Localization and Robba norms are provided by PHT/PG.

**Construction or proof.** Use RJ0E3 for weight coordinates and IC4/I.17 for convergence. Choose N(D) so its annulus estimate gives convergence on every indicated ball. Threshold dependence is bounded by the potentially semistable localization extension.

**Imports.** `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PadicHodgeTheory:P7`, `PadicMeasuresIwasawaAlgebras:L0a`, `LocallyAnalyticDistributions:L1`.

**Source.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), Sections0E3, IC4, IC6; TheoremI.1 and LemmaI.17, pp.896-898,910-916.

**API.** `deRhamCharacterDomain_mem`: Membership is existence of an admitted primitive eta with the stated coordinate valuation inequality. `deRhamCharacterDomain_open`: U_D is an admissible open of character space. `deRhamCharacterDomain_restrict`: Two valid threshold choices define compatible restrictions of the same regulator on their common admitted domain.

**Uses.** RJ TheoremsI.15 and I.27: The regulator is defined only on this convergence domain. AutomorphicGaloisRepresentations:R19.5; modular bad-reduction consumers: Do not export a global scalar distribution from an arbitrary de Rham representation.

**Tests.** `domain_center`: Each admitted eta has infinite valuation difference from itself and lies in its ball. `domain_wrong_torsion`: A character on another torsion component has valuation difference -infinity and lies outside this ball. `domain_threshold`: A character with valuation difference exactly p^(N-c) is excluded by the strict inequality; the trivial character is not supplied by a high-conductor center argument.

**Acceptance.** Finite characters of conductor c>m(Delta) lie in U_D; the trivial character is not guaranteed to do so.

### Analytic powers of the differential operator

**Declaration:** `analyticDifferentialPower` (construction).

On Delta^(psi=0), for a sufficiently small weight affinoid and N large define kappa(partial) by the convergent series sum_(i in (Z/p^N)^times) sum_(j>=0) binom(omega_kappa,j) kappa(i) i^-j (1+T)^i p^(Nj) phi^N(partial^j z_i), where z_i=psi^N((1+T)^(-i)z). The value is independent of large N and representatives and is rigid analytic in kappa; for kappa=x^k, k in Z, it equals partial^k on psi-zero (negative powers use its inverse there).

**Hypotheses.** Delta=N_rig(D) is the genuine differential Robba module; partial=nabla/t and psi/phi satisfy the source relations. Restrict to a weight affinoid and annulus where RJ PropositionI.13 proves convergence.

**Construction or proof.** Decompose psi-zero over units modulo p^N. On each piece p^N partial is a small perturbation of the scalar i. Expand its analytic binomial power. RJ I.13 proves convergence by Robba differential bounds and bounded binomial coefficients, then checks refinement of N and representative changes. At algebraic weights finite binomial identities or the psi-zero inverse yield integral powers.

**Imports.** `PadicHodgeTheory:P7`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.4`, `PadicMeasuresIwasawaAlgebras:L0a`, `PadicHodgeRegulators:L4/derham-character-domain`.

**Source.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), SectionIC2, PropositionI.13 and proof, pp.911-913.

**API.** `analyticDifferentialPower_integer`: At x^k the operator is partial^k for every integer k. `analyticDifferentialPower_linear`: It is E-linear in z and analytic in kappa on the specified affinoid. `analyticDifferentialPower_choices`: Changing N or residue representatives preserves the value on the common annulus.

**Uses.** RJ equation(3): Apply it to (1-phi)z before localization. RJ TheoremsI.15,I.27: Provides analytic interpolation rather than only integer values.

**Tests.** `differential_weight_zero`: At k=0 the operator is the identity on psi-zero. `differential_weight_one`: At k=1 it is partial, not t partial. `differential_inverse`: At k=-1, partial composed with the operator is identity on psi-zero; no inverse is asserted on all Delta.

**Acceptance.** This construction acts on the imported Delta; no second differential-module carrier is defined here.

### Rodrigues Jacinto de Rham regulator

**Declaration:** `deRhamRegulator` (construction).

For z in Delta^(psi=1), define Lambda_(D,z)(eta kappa)=G(eta)^(-1) sum_(a in (Z/p^m)^times) eta(a) sigma_a [phi^(-m) kappa(partial)(1-phi)z]_0, for m sufficiently large and the admitted high-conductor ball. The constant term is taken in E_m tensor D_dR(D) after localization; the sum descends to D_dR(D). These definitions glue to a rigid analytic D_dR(D)-valued function on U_D. For positive-weight D and z in D^(psi=1), use its actual inclusion in Delta; an Iwasawa version is through the proved PG.5/L2 map.

**Hypotheses.** D is de Rham; use the actual Delta, localization embeddings, q coordinates and Gauss periods G(eta)=sum eta(a) zeta_(p^c)^a. On each ball retain the threshold needed for its analytic powers.

**Construction or proof.** RJ I.15 and I.17 establish local convergence of equation(3). Constant coefficients after localization lie in the indicated de Rham realization. Changing m, residue representatives and admitted charts gives the same analytic function; use the Gauss-sum transformation under Gamma to prove descent. Glue the ball functions in actual rigid analytic weight space.

**Imports.** `PadicHodgeRegulators:L4/analytic-differential-powers`, `PadicHodgeRegulators:L4/derham-character-domain`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.5`, `PadicHodgeRegulators:L2`, `PadicHodgeTheory:P7`.

**Source.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), Equation(3), TheoremI.15, LemmaI.17 and proofs, pp.914-916.

**API.** `deRhamRegulator_formula`: Its value on an admitted ball is the displayed localized constant-term Gauss sum. `deRhamRegulator_linear`: It is E-linear in z; the Gamma action induces the source character-equivariance convention. `deRhamRegulator_descent`: Its finite-level expression descends to D_dR(D) and is independent of a larger localization level. `deRhamRegulator_restrict`: Two admitted thresholds give equal functions on their common domain.

**Uses.** RJ TheoremsI.27,I.29: Supplies bad-reduction interpolation and the crystalline comparison. Modular and Euler-system consumers via scalar projection: A differential must still be specified to obtain a scalar function.

**Tests.** `derham_zero`: The zero psi-one vector gives the zero analytic function. `derham_phi_fixed`: A psi-one vector fixed by phi is killed by 1-phi and gives zero. `derham_period_normalization`: Replacing G(eta) by G(eta)^-1 would multiply the expression by G(eta)^2; the stated denominator is essential.

**Acceptance.** An arbitrary analytic function with the expected values is not the construction.

### De Rham interpolation and convergence bound

**Declaration:** `deRhamRegulator_interpolation` (theorem).

For D with nonnegative Hodge–Tate weights, z in D^(psi=1), and eta x^j in U_D with eta primitive of conductor p^n, RJ I.27 gives Lambda_(D,z)(eta x^j)=Gamma*(j+1) p^(n(j+1)) exp*(integral_G eta chi^(-j) mu_z) tensor e_(eta,-j)^(dR,dual) for j>=0, and the analogous exp^(-1) value for j sufficiently negative that the indicated Bloch–Kato exponential is bijective. Gauss bases are e_(eta,j)^dR=G(eta)t^-j e_(eta,j), dual=G(eta)^-1 t^j e_(eta^-1,-j). For general z in Delta use TheoremI.15 after nabla_h, with Gamma*(j-h+1) and j>=h or j sufficiently negative. Its growth statement is the local Robba annulus convergence estimate of LemmaI.17; it is not a global finite-order distribution bound.

**Hypotheses.** D is de Rham; positivity and z in D^(psi=1) are required for I.27. Negative j belongs to the proved isomorphism range, not every j<0. All characters lie in the admitted open.

**Construction or proof.** RJ I.22-I.26 compute localized differential coefficients and compare the actual cohomological exponential/dual exponential using Nakamura’s comparison, with the source Gauss/Tate bases. I.17 bounds each binomial-series term on an annulus by C+j(v_p(binom(omega_kappa,j))/j+N+C_partial), with the differential bound and domain inequality ensuring its limit tends to infinity. This is the proved local growth control. For general Delta vectors use nabla_h Delta subset D (PropositionI.9) and TheoremI.15. The required Nakamura map comparison is an explicit supplier gap.

**Imports.** `PadicHodgeRegulators:L4/derham-regulator`, `PadicHodgeRegulators:L3/gamma-leading-factor`, `PadicHodgeRegulators:L1`, `PadicHodgeRegulators:L2`, `PadicHodgeTheory:P7`, `LocallyAnalyticDistributions:L1`.

**Source.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), LemmaI.17, PropositionsI.22-I.26, TheoremI.27 and footnotes10,25, pp.914-920.

**Acceptance.** Do not supply an exp inverse at j=-1 merely because the negative Gamma factor exists; verify the finite-class map is bijective.

### Crystalline extension of the de Rham regulator

**Declaration:** `deRhamRegulator_crystalline` (comparison).

For any crystalline de Rham D and z in N_rig(D)^(psi=1), Rodrigues Jacinto TheoremI.15/CorollaryI.29 assert that Lambda_(D,z) extends from U_D to the entire weight space. In the explicitly computed subcase with strictly negative phi slopes and an eigenbasis after finite coefficient extension, write z=sum A_lambda_i tensor e_i, phi(e_i)=alpha_i e_i and psi(lambda_i)=alpha_i lambda_i. PropositionI.28 identifies its value at ramified eta x^j, j>0, with sum_i alpha_i^-n (integral_Zp^times eta^-1 x^j lambda_i)e_i. This analytic integral expression gives the global extension in that subcase. The broader crystalline extension requires a proof of the reductions beyond that subcase; it is recorded as a gap, rather than deleting the source’s general target. On the common L3 range, the comparison to the LLZ/LZ regulator is a map-level equality after explicitly converting the Amice/Mellin, inverse finite-character and Gauss/Tate period conventions.

**Hypotheses.** D crystalline de Rham; z in the authentic differential module psi-one source. For the explicit I.28 formula additionally assume strictly negative phi slopes and a genuine eigenbasis, not just that eigenvalues lie in E. For the LLZ/LZ comparison retain their nonnegative/no-trivial-quotient range.

**Construction or proof.** RJ IC9 identifies N_rig(D) with the crystalline period module; under negative slopes the psi-one vectors lie in the positive Robba part. In an eigenbasis apply PropositionI.28’s Amice integral expression, which is analytic on the whole weight space. The printed CorollaryI.29 asserts the general crystalline case, although this argument was introduced in a strict-slope eigenbasis subcase. Supply an explicit twist/nonsemisimple reduction or alternate proof as the recorded follow-up input. Compare ramified integral characters with LZ B.5, carrying actual alpha powers, coefficient embeddings, and Gauss/Tate dual bases through the Fourier/Mellin square. Prove equality by analytic uniqueness on a justified dense subset of each admitted ball.

**Imports.** `PadicHodgeRegulators:L4/derham-regulator`, `PadicHodgeRegulators:L4/derham-interpolation-growth`, `PadicHodgeRegulators:L3/ramified-interpolation`, `PadicHodgeRegulators:L3/crystalline-regulator`, `LocallyAnalyticDistributions:L3`, `PadicHodgeRegulators:L2`.

**Source.** [RJ2018](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf), TheoremI.15, p.914; SectionIC9, PropositionI.28, CorollaryI.29, p.920.

**Acceptance.** A general de Rham D has no alpha_i eigenbasis in D_dR and does not satisfy this global-extension theorem.

### Split multiplicative Coleman augmentation

**Declaration:** `rubinColemanMap_augmentation` (theorem).

For an elliptic curve A with split multiplicative reduction at odd p, the actual Col_infty:H^1_(infty,s)(Q_p,T_p A)->Lambda is injective and its image is contained in the augmentation ideal ker(Lambda->Z_p). This is containment, not image equality or an exceptional-zero derivative formula.

**Hypotheses.** Use the source, differential, roots, indexing and lattice of rubinColemanMap. Split multiplicative reduction gives alpha=1,beta=p.

**Construction or proof.** Specialize the authentic formula at chi=1: (1-alpha^-1)=0, while (1-beta^-1)=1-p^-1 is nonzero. The value vanishes; the bounded character value is the augmentation. Injection is the previously constructed map’s theorem.

**Imports.** `PadicHodgeRegulators:L3/rubin-coleman-map`, `PadicMeasuresIwasawaAlgebras:L2`.

**Source.** [RubinES](https://swc-math.github.io/notes/files/99RubinES.pdf), III Section5.8, Proposition5.14(b), printed p.52.

**Acceptance.** Nonsplit alpha=-1 does not force augmentation zero. A derivative or L-invariant theorem needs its own additional input.

## Definition API and discriminating tests

The packet gives one declaration per node, including the nonroutine inverse, basis, transport, image and matrix lemmas. The following API and tests apply to each definition or construction. Tests bearing the same names appear in the suggested file: executable algebraic examples where native carriers exist and explicit commented arithmetic contracts where they do not. The algebraic file elaborates at pinned Mathlib with unproved theorem bodies; no arithmetic implementation is claimed.

### `quadraticFrobeniusInverse`

API: `quadraticFrobeniusInverse_formula` gives −b⁻¹(Φ+aI); `quadraticFrobeniusInverse_spec` proves the two inverse identities under b≠0 and the quadratic relation; `quadraticFrobeniusInverse_map` commutes with a field embedding.

Tests: `frobenius_scalar_two` uses Φ=2,a=−5,b=6 and gives 1/2; `frobenius_scalar_minus_one` uses Φ=−1,a=0,b=−1 and gives −1; `frobenius_singular_excluded` uses Φ=a=b=0 and verifies that the candidate is not an inverse.

### `quadraticEulerInverse`

API: `quadraticEulerInverse_formula` gives s⁻¹(Φ+(1+a)I); `quadraticEulerInverse_spec` proves the two inverse identities for I−Φ under s≠0; `quadraticEulerInverse_map` commutes with a field embedding.

Tests: `euler_scalar_two` gives −1 for Φ=2,a=−5,b=6; `euler_scalar_zero` gives I for Φ=a=b=0, showing b≠0 is not needed for this inverse alone; `euler_singular_excluded` takes Φ=1,a=−3,b=2 and detects s=0.

### `evaluationConstraints`

API: `evaluationConstraints_mem` is the exact componentwise condition; `evaluationConstraints_empty` gives the full module; `evaluationConstraints_antitone` proves that adding conditions shrinks the submodule.

Tests: `constraints_none` checks the empty family; `constraints_zero_at_zero` excludes 1 and includes X for one zero condition over Q[X]; `constraints_diagonal` includes (1,1) and excludes (1,0) for the diagonal condition at zero.

### `transportedSpecialization`

API: `transportedSpecialization_mem` says c∈W iff cC∈V; `transportedSpecialization_one` gives V; `transportedSpecialization_comp` transports first by C and then by D through the matrix DC, in that order.

Tests: `transport_identity` checks I; `transport_shear` takes V=Q(1,0), C=[[1,1],[0,1]] and obtains Q(1,−1); `transport_singular` takes C=0,V=0 and obtains E^d, detecting the missing invertibility hypothesis in any dimension claim.

### `constraintBasis`

API: `constraintBasis_rows_mem` certifies row membership; `constraintBasis_expansion` gives unique coordinates for each member; `constraintBasis_determinant` gives association to the product of q_j^codim(V_j), for any basis.

Tests: `basis_single_zero_condition` gives basis X of the kernel at zero; `basis_two_zero_conditions` gives X(X−5), not X²; `basis_two_coordinates` imposes span(e1) at zero and span(e2) at five, with basis rows (X−5,0),(0,X). All use the polynomial ring Q[X], where the hypotheses can be checked explicitly.

### `projectionGenerator`

API: `projectionGenerator_formula` gives the product over the forced-zero set; `projectionGenerator_empty` gives one when no point forces that coordinate to vanish; `projectionGenerator_eval` characterizes its zeros at the distinct evaluation nodes.

Tests: `projection_no_constraints` gives one; `projection_all_zero` gives X(X−5) for the scalar two-point problem; `projection_mixed` gives X−5 and X for the two coordinates of the mixed-axis problem.

### `projectionWitness`

API: `projectionWitness_coordinate` fixes the k-th coordinate to g_k; `projectionWitness_mem` gives membership in the actual constrained submodule; `projectionWitness_multiples` gives every multiple rg_k by multiplying the witness.

Tests: `witness_empty` uses the standard vector; `witness_diagonal` uses (1,1) for the condition F(0)=G(0); `witness_integral_denominators` computes X/5 and verifies that no polynomial over Z_5 can have values 0 and 1 at 0 and 5. The last test prevents an invalid integral interpretation of the rational interpolation proof.

### `colemanCoordinates`

API: `colemanCoordinates_apply` gives e(f(z)); `colemanCoordinates_reconstruct` recovers f(z); `colemanCoordinates_precomp` commutes with precomposition of the source map.

Tests: `coleman_zero` gives zero; `coleman_standard` gives identity for the standard coordinate model; `coleman_shear_inverse` distinguishes cU⁻¹=(1,−1) from cU=(1,1) when c=(1,0) and U=[[1,1],[0,1]].

### `logarithmicMatrix`

API: `logarithmicMatrix_entry` defines each entry from the image of a coordinate basis vector; `logarithmicMatrix_expansion` gives the actual vector identity after coefficient extension; `logarithmicMatrix_zero` gives zero when j=0.

Tests: `matrix_identity` gives I; `matrix_non_diagonal` recovers [[1,2],[3,4]], not its transpose; `matrix_singular_inclusion` takes j with row matrix diag(1,0) and verifies determinant zero, preventing an unsupported invertibility claim.

### `shearMatrix`

API: `shearMatrix_action` specifies the ordered row formula; `shearMatrix_det` gives 1−e₁e₂; `shearMatrix_unit` constructs invertibility only with a unit determinant.

Tests: `shear_identity` gives I; `shear_order` sends (7,11) to (29,32) for e₁=2,e₂=3; `shear_nonunit_determinant` uses e₁=1,e₂=−4 over Z_5, giving determinant 5 and a matrix that is not an integral automorphism.

## Acceptance and source boundaries

The algebraic core is accepted only with exact maps, row orientation, coefficient embeddings, all evaluation/division hypotheses and generator witnesses. A rank calculation alone does not discharge these contracts. For the analytic application, supply the bounded-series instance, the good Wach basis and actual ψ/Iwasawa/Mellin comparisons, and prove LLZ's genuine image equality before applying the constraint-module theorems. The integral lower inclusion, source determinant normalization and supplier differential-module interfaces remain exact proof obligations, recorded below and in the packet.

## Source corrections and acceptance examples

Five LLZ findings remain unreviewed. E301 repairs the integral shear proof: nonzero 1−e₁e₂ is insufficient over O; selecting both coefficients in the maximal ideal makes it a unit. The sufficient selection is already in arXiv v2 Remark 5.12. E302 reverses the printed inclusion in Proposition 4.2: adding the last condition gives S⊆S′. E303 concerns Proposition 5.9: with the preceding ordered coordinates the quotient row is ((p−1),−(2−a_p)), valued in E. At p=5 and a_p=0 the allowed vector (1,2) is killed by this row but not by the printed row. E304 distinguishes the bounded Lambda-module sequence of Corollary4.13 from its analytic H_E extension. E305 makes the matrix transport in Proposition4.11 explicit: its fixed Coleman coefficient subspace is V_(i,eta) M(x_i)^(-1). In the same p=5 example, the Coleman line span(1,2) maps to the distinct period line span(-2,5). These are submitted findings, not independently confirmed errata or novelty claims.

The source supplied under the Kolyvagin1990 label is Rubin’s *Euler Systems*. Its Proposition III.5.14 construction and augmentation containment are planned in L3 and L4 respectively. The source’s split-multiplicative assertion is containment only. GSWZ’s D.1–D.4 results and RT-AREA-ktheory-2/15 belong outside this part; the handoff records their exact graph and normalization obligations.

Further discriminating acceptance calculations are: Gamma*(0)=1, Gamma*(−1)=−1 and Gamma*(−2)=1/2; at a singular B₀ with phi=p⁻¹ the denominator-cleared relation does not uniquely recover the regulator; nontrivial eta and trivial eta use different transported filtration subspaces; the determinant for weights (0,2) is ell₀ ell₁, while weights (1,1) give ell₀²; a constant inverse shear changes the basis, so its coefficient rows change by the forward shear; nonsplit multiplicative alpha=−1 does not force the augmentation value to vanish. None is a numerical p-adic approximation.

## Completion and remaining inputs

This target-level pass is complete: L3 and L4 are **planned**, not closed. All 26 inherited node ids are retained; there are 59 declaration nodes, 78 API items and 72 discriminating tests. The 12 planets are six per layer. Twelve existing Mathlib declarations are used at the pinned commits; the reviewed library audit supplies no existing arithmetic regulator implementation. The suggested file’s algebraic declarations elaborate; its unavailable arithmetic contracts are explicit comments, as required by the roadmap’s public API contract.

**Bounded evaluation, division and image descent.** The authentic O_E[[X]][1/varpi] instance needs bounded division, evaluation kernels and nonzero X-x. The LLZ4.12 determinant argument additionally needs a bounded-to-analytic image equality/descent theorem; equal H_E determinants do not prove equality of arbitrary bounded submodules.

**Actual arithmetic carrier signatures.** Pinned libraries have no native Wach, D_cris/D_dR, H_Iw, full analytic-distribution or differential Robba-module carrier. Supplier PG/PHT/Regulator L0-L2/LAD interfaces must first be elaborated. Suggested arithmetic contracts are comments; only genuine algebraic carrier signatures are compiled.

**Derivative obstruction exactness.** Berger p.120 cites Perrin–Riou1994 Section2.2 for exactness of the derivative-obstruction sequence. That proof was not independently acquired/read here; prove solvability and kernel on authentic period modules, including the top t^h eigenvectors and invariant quotient.

**Determinant normalization.** LLZ4.7 imports Perrin–Riou delta(V), Proposition3.6.7 and Colmez1998 IX.4.5. Berger/LZ supply the read reciprocity route, but the exact determinant-line normalization and rank-d Iwasawa comparison are still required. Pairing equality alone is not the determinant theorem.

**Cyclotomic growth estimate.** LZ4.8 reduces its quotient-slope bound to a one-variable statement called well known. Supply the actual Wach coefficient/annulus seminorm estimate and identify its Mellin image with LAD order-h distributions; order-zero boundedness is not automatic.

**Integral lower inclusion.** Supply phi(pi)^(k-1)(phi*N(T))^psi0 subset (1-phi)N(T)^psi1 over O_E for the actual modular lattice. LLZ2011 cites the proof of LLZ2010 Prop4.11; the latter’s printed (C),(D) hypotheses and rational one-coordinate proof do not by themselves establish the wider integral assertion. Retain those restrictions until integral convergence and coefficient descent are proved.

**N_rig and exponential comparison.** PHT/PG must supply the authentic N_rig(D), partial, localization, annulus norms, nabla_h Delta subset D and the Nakamura2014 cohomological exponential comparison cited by RJ I.10/I.22. RJ’s downstream formulas were read; Nakamura’s proof was not acquired/read in this run.

**Crystalline/de Rham normalization square.** Prove the map-level conversion of RJ Amice lambda_i, inverse finite-character convention, alpha_i^-n and Gauss dual bases to LLZ/LZ Mellin. Also prove the general crystalline extension asserted by RJ I.15/I.29: the displayed IC9 calculation starts in a strict-negative-slope eigenbasis subcase. A finite coefficient extension alone does not diagonalize a nonsemisimple phi. No global extension is inferred for general de Rham D.

**Rubin ordinary/multiplicative construction.** The supplied public Rubin book states PropositionIII.5.14 and refers to the appendix of Rubin1998, Euler systems and modular elliptic curves, LMS Lecture Notes254, pp.351–367, for the construction. That appendix was not acquired/read. Supply its integral singular-quotient descent and injectivity, including the ordinary/multiplicative differential normalization.

**Unrestricted crystalline codomain.** StageL3 prints H_E-valued output for all crystalline V. LZ Section4.4 equation(10) constructs the normalized map for arbitrary weights into Frac(H_E) via logarithmic-factor division. Extra H_E-valued cancellation is not proved here and must not be asserted for every V. The packet proposes an explicit scope qualification and retains this target gap.

The 16 supplier requests in the packet pin the exact missing interfaces. PG supplies cohomology, Wach and the differential-module engine; PHT supplies realizations, localization and annulus bounds; PMIA supplies bounded evaluation, integral module theory, weights and determinant lines; LAD supplies full analytic Mellin, distribution orders, uniqueness and analytic elementary divisors. ColemanPowerSeries’ existing raw/normalized maps and principal/finite-flat sequences are reused by exact node id. ModularIwasawaMainConjectures consumes signed kernels, while AutomorphicGaloisRepresentations must supply the proved modular geometric comparison and ordered periods. No arbitrary-family conclusion is imported from PG.7.
