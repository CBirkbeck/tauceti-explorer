# Semistable AΩ and cohomological Breuil–Kisin descent

This roadmap specifies the semistable integral cohomology functor and the smooth cohomological Breuil–Kisin functor in **AInfCohomology:AI.6–AI.7**. Its purpose is to retain integral information through the logarithmic de Rham, logarithmic crystalline and generic étale comparisons, and to identify the actual comparison maps under the normalized Breuil–Kisin coefficient maps. The two stages have separate domains: AI.6 allows the prescribed semistable models; AI.7 applies the ordinary relative prismatic and trace constructions to smooth formal schemes.

The [packet](../packets/AInfCohomology--AI.6.json) and the declaration register below give every target and its direct prerequisites. The [suggested file](../suggested/AInfCohomology--AI.6.lean) supplies concrete algebraic prototypes and an explicit inventory of signatures whose geometric supplier types are unavailable. The roadmap is definitive. All implementation statuses are unchecked. Both stages are **planned**, with the five gaps listed below; neither stage is closed.

## Conventions and ownership

Fix a prime p, an algebraically closed field k̄ of characteristic p, and C the completed algebraic closure of Frac W(k̄), with the compatible roots of p and the compatible primitive roots of unity ε of CK §1.5. Write A_inf=W(O_C^♭), μ=[ε]−1, θ:A_inf→O_C, θ̃=θ∘φ_A⁻¹, ξ for the specified generator of ker θ, and ξ̃=φ_A(ξ) for the corresponding generator of ker θ̃. AI.0 owns these rings, maps, twists and their foundational identities. A_inf{1}, its étale realization Z_p(1), and O_C{1} retain that supplier's distinct meanings.

For the arithmetic statements, K is a complete discretely valued mixed-characteristic field with perfect residue field k₀, O_K its ring of integers, π a uniformizer, and C the completion of an algebraic closure of K. Retain the fixed embedding W(k₀)→W(k̄), with k̄ the residue field of C. A statement over W(k̄) is not silently restated over W(k₀). The arithmetic log point is ℕ→W(k₀), 1↦0; the valuation-field presentation first has a Q≥0 log point. CR.6 supplies their comparison.

A CK model is p-adic, O_C-flat and locally of finite presentation, and is étale locally formally étale over

R□=O_C{t₀,…,tᵣ,tᵣ₊₁^{±1},…,t_d^{±1}}/(t₀⋯tᵣ−p^q), with q∈Q>0 and 0≤r≤d.

The chosen roots specify p^q. Write s=d−r. The algebraic prototype uses a positive and inverse variable for each torus coordinate, so its quotient relations are t₀⋯tᵣ=π and Y_jZ_j=1. Ordinary p-adic completion gives the restricted-power-series chart. Its universal property and finite-level quotient maps use Mathlib's existing multivariate polynomial, ideal quotient and adic completion constructions.

Equip the model with the divisorial log structure associated to O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét. The base chart O_C∖{0} need not be fine. The chart is the pushout of ℕ^{r+1} and O_C∖{0} over the diagonal ℕ with 1↦p^q. CR.5 owns associated log structures, integral monoid pushouts, log sites, exactification and log PD Poincaré. AI.6 owns the application to these charts and the semistable comparison maps.

All derived sheaves, products and coefficient changes use the shared enhancement from EnhancedDerivedSheaves:E1. Completed tensor products and completed colimits use its E4 interfaces. An ordinary unbounded derived category does not by itself supply the monoidal enhancement, completed tensor or relative spectral construction. Lη and continuous Koszul calculations are imported from AI.1. Smooth period sheaves and toric perfectoid constructions are imported from AI.3–AI.5. PR.1 supplies relative prismatic cohomology; PR.3 supplies its Frobenius and relative trace interface; PR.6 supplies the smooth AΩ comparison and perfect-prism uniqueness. RT.6 supplies relative THH, TC⁻ and TP. R07.4 supplies the coefficient prism and the module theory, including the broad cohomological category needed for torsion modules.

The canonical B_dR⁺ crystalline/deformation complex of a smooth proper analytic generic fibre belongs to CohomologyComparisons:CP.3. AI.6 constructs its semistable comparison to that object. CP.4 assembles the rational semistable B_st comparison from the AI.6 and CR.6 maps. CP.5 consumes the torsion and lattice consequences. These ownership boundaries determine the direction of the stage links.

## AI.6: local analysis, logarithmic maps and integral lattices

The integral root tower is a new local calculation. At level m adjoin p^m-th roots of each branch and invertible coordinate, impose the branch product p^{q/p^m}, and p-complete the filtered union. The generic tower is pro-étale with Δ≃Z_p^d. Its integral maps need not be flat: for a node at p=2 and m=1, the generic rank is two while the closed-node fibre has basis 1,a,b and relations a²=b²=ab=0. The length-three fibre distinguishes the integral tower from a flat Kummer cover.

Normalize a branch exponent tuple by subtracting its minimum; record the removed scalar p^{q·min(a)/p^m}. Torus exponents are signed integers. The witness of a zero branch exponent does not create a second index. Integral indices are exactly those divisible by p^m in every branch and torus direction. Completed monomial expansions split R_∞ and A_inf(R_∞) as modules into their integral and nonintegral parts. They are not products of rings. CK Proposition 3.19 and Proposition 3.25 supply the p-torsion and almost-torsion conditions and the μ-annihilation that make the décalage of the almost edge comparison integral.

The (p,μ)-complete chart lift A(R) has branch relation ∏X_i=[(p^{1/p∞})^q], Frobenius X_i↦X_i^p and the Δ-action inherited from the root cover. Its θ reduction is R. Under the embedding into A_inf(R_∞), θ̃(X_i) is the chosen p-th root coordinate in R_∞. This distinction determines the two reductions of AΩ. The θ̃ reduction has logarithmic Hodge–Tate cohomology Ω^i_log{−i}; the Bockstein of that reduction supplies the actual differential in the θ reduction Ω^•_log. A rank comparison alone would not identify that differential.

The logarithmic crystalline map requires an explicit PD construction. For the finite A_cris approximants the local base-change theorem assumes m≥p; the exponential comparison of the logarithmic derivations requires m≥p². Branch derivations are X_i∂_i−X₀∂₀, and torus derivations are Y_j∂_{Y_j}−Z_j∂_{Z_j}. They preserve the quotient relations. Their Frobenius identity is D_iφ=pφD_i, so the degree-j logarithmic Frobenius is p^jφ.

The all-coordinates index consists of finite invertible coordinates and a nonempty finite family of eligible semistable charts. Use CK §5.17's localization before comparing nonsmooth chart valuations. Exactify the log immersion with the monoids of CK §§5.26–5.27, take the ordinary PD envelope over (Z_p,p), and then p-complete. The completed all-coordinates envelope may have p-torsion. Its change-of-chart ratio units, completion maps and Frobenius maps must be retained. Form the two filtered models and the actual morphism of CK §5.38, and prove its quasi-isomorphism and its specialization to log de Rham. Unrestricted tensor commutation with Lη is not a substitute for these steps.

For a proper model, RΓ_Ainf is perfect but its cohomology can have torsion. Degreewise specialization includes the adjacent-degree ξ-torsion or Tor₁ term. Freeness of log de Rham in one degree is equivalent to freeness of log crystalline in that degree, and implies freeness of A_inf and étale cohomology there; it does not remove the adjacent term by itself. The two torsion comparisons use, respectively, Witt-module length and the normalized valuation length v(p)=1. Neither comparison asserts a canonical injection.

The arithmetic lattice theorem assumes that H^i_logdR and H^{i+1}_logdR are both O_K-free. It identifies the G_K-equivariant Fargues pair and its invariant θ-lattice with the logarithmic de Rham lattice inside generic-fibre de Rham cohomology. Model independence is asserted precisely among models satisfying those hypotheses. The acceptance model is the completed conic XY=πZ², with nodal special fibre and rational generic fibre, compared with a smooth P¹ model. Its predicted H¹ is zero; singular special fibre alone does not imply nonzero monodromy. The separate rank-two matrix test checks Nφ=pφN and does not identify a geometric H¹.

The six planets are **Semistable AΩ complex**, **Log Hodge–Tate comparison**, **Log de Rham comparison**, **Log PD all-coordinates construction**, **Log crystalline comparison**, and **Semistable B_dR⁺ comparison**. The declaration register gives their exact packet names.

## AI.7: normalized Breuil–Kisin descent and comparison agreement

Use the existing ring 𝔖=W(k₀)[[u]], its Eisenstein polynomial E and Frobenius φ_𝔖, with Witt Frobenius on coefficients and u↦u^p. This is an endomorphism, not an automorphism. The coefficient of u vanishes in every image when p>1. Distinguish the copy 𝔖^(−1) containing 𝔖 via φ_𝔖 from the source 𝔖 of cohomological descent.

| Map | On coefficients | Image of u | Role |
| --- | --- | --- | --- |
| θ̃_𝔖:𝔖→O_K | standard Cohen embedding | π | quotient of the Breuil–Kisin prism |
| θ_𝔖=θ̃_𝔖∘φ_𝔖 | Witt Frobenius then the embedding | π^p | cohomological de Rham comparison |
| g:𝔖^(−1)→A_inf | standard Witt embedding | [π^♭] | untwisted trace extension |
| f=g∘φ_𝔖:𝔖→A_inf | Witt Frobenius then the embedding | [π^♭]^p | cohomological A_inf extension |
| c:𝔖→W(k₀) | Witt Frobenius | 0 | cohomological crystalline comparison |

The squares θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖 commute. The ideal f(E) is (ξ̃), while g(E) is (ξ). The crystalline map c=φ_W∘constantCoeff includes the Frobenius pullback of the prismatic crystalline comparison. A Teichmüller coefficient outside F_p detects omission of φ_W. The flatness theorem for f permits the cohomological A_inf extension and faithful-flat detection of equivalences. Descent of a morphism requires its Čech compatibility datum as well as scalar extension.

For smooth formal 𝔛/O_K, define RΓ_𝔖 through PR.1's relative prismatic cohomology of (𝔖,(E)). This bounded prism is nonperfect. Along f, prismatic base change targets the ξ̃ prism and yields the Frobenius pullback of the ξ-prism object. PR.6 identifies that pullback with AΩ. Thus the normalization agrees with AΩ≃φ_A^*Δ for the base prism ker θ. The θ_𝔖 and c reductions are ordinary de Rham and crystalline cohomology with their actual differentials and Frobenius, respectively. Properness removes the extra completion and yields a perfect complex with broad, potentially torsion, cohomological Breuil–Kisin modules.

For the trace realization, keep the relative base 𝕊[z] throughout. On the quasiregular semiperfectoid site, unfold gr⁰TC⁻ and gr⁰TP to obtain the twisted complex D̂_tw over 𝔖^(−1). For O_K the coefficient computation is 𝔖^(−1)[b,v]/(bv−E) and 𝔖^(−1)[σ^{±1}], with can(b)=Eσ and cyclotomic φ(b)=σ. Here b is the degree-two Bott class; u is the coefficient variable. BMS2's descent inverts b, which its proof calls u. It does not invert our coefficient u. RT.6 supplies the evenness, unfolding, cyclotomic extension and relative Segal input. PR.3 and RT.6 supply the comparison to the relative prismatic complex with its actual specialization maps.

The Nygaard filtration belongs to φ_𝔖^*D_𝔖≃D̂_tw. BMS2 Remark 11.16 rules out its functorial descent to D_𝔖: the claimed descent would force smooth formal schemes to descend to W(k₀)[π^p], contradicted by a good-reduction elliptic curve with j outside that subring. Remark 11.17 nevertheless identifies the canonical Frobenius-image map φ_𝔖^*D_𝔖≃Lη_E D_𝔖→D_𝔖, via the Beilinson connective-cover interpretation. These are different statements.

Compare choices of π and compatible roots after extension to a common A_inf, through the intrinsic AΩ object. The resulting transport has identity and cocycle laws, preserves Frobenius and products, and carries the comparison diagrams. It does not assert an identification between unrelated 𝔖 coefficient rings. The final comparison agreement imports PR.6's uniqueness over the perfect A_inf prism, checks the Hodge–Tate structure map η on polynomial and torus charts, and checks the crystalline map on the PD/Koszul generators. BS22 §18 does not apply perfect-prism uniqueness directly to 𝔖, and equivalence of the functors alone does not identify every crystalline comparison map.

As a concrete arithmetic consequence, for K=Q_p(p^{1/p}) the θ_𝔖 map factors through Z_p. De Rham cohomology is therefore the scalar extension of a perfect Z_p-complex. Every cyclic torsion summand has O_K-length divisible by p. This acceptance test concerns each elementary divisor, as well as total length.

The six planets are **Breuil–Kisin coefficient normalization**, **Breuil–Kisin cohomology**, **Frobenius-twisted trace complex**, **Breuil–Kisin Frobenius descent**, **Breuil–Kisin A_inf comparison**, and **Comparison-map agreement**.

## Declaration register

Each entry specifies its proposed declaration name, statement, additional hypotheses, proof or construction, direct prerequisites and acceptance. Definitions and constructions also list their consumer uses, named API and discriminating unit tests. The fixed conventions above apply throughout. Algebraic prototypes can be more general than their CK applications. Supplier-stage prerequisites are explicit requests in the packet; fine node prerequisites import the supplier's declaration without duplicating it.

### AInfCohomology:AI.6

#### Standard semistable chart ring

**Semistable.chartRing** — definition; node `AInfCohomology:AI.6/chart-ring`.

For a commutative ring R, π∈R and integers r,s≥0, let P=R[T₀,…,Tᵣ,Y₁,Z₁,…,Yₛ,Zₛ]. Let J be generated by ∏Tᵢ−π and YⱼZⱼ−1. The algebraic chart Q=P/J and its ordinary p-adic completion R□=AdicCompletion((p),Q) give the restricted-power-series chart. In CK use R=O_C and π=p^q, q∈Q>0; the torus coordinates are Yⱼ. The construction here is this chart, not a general formal scheme.

Additional hypotheses: p-adic completion is along the image of the integer p; π=p^q with the fixed roots in the CK application.

Construction or proof:

1. Use Mathlib multivariable polynomials and Ideal.Quotient for Q.
2. Use the existing AdicCompletion ring instance and quotient projections; identify it with CK (1.5.1) by its inverse-limit description.

Uses:

- **CK §§3.1,5.9**: The chart controls the root tower and its Frobenius lift.
- **AInfCohomology:AI.6**: A nodal chart detects singular special fibre without replacing the generic fibre by it.

API:

- **Semistable.chartRing.branch_relation** (relation): In the completion, ∏ᵢTᵢ equals the image of π.
- **Semistable.chartRing.torus_inverse** (simp): The images of Yⱼ and Zⱼ multiply to 1.
- **Semistable.chartRing.reduction** (compatibility): Projection to level n sends a polynomial class to its class in Q/(p)^n, agreeing with AdicCompletion.evalₐ and Ideal.Quotient.mk.
- **Semistable.chartRing.lift** (universal-property): A ring map R→B and branch/torus values satisfying the relations induce a unique map Q→B; a compatible family Q→B/I^n induces the corresponding completion map.

Unit tests:

- **Semistable.chartRing.nodal** (computation): For r=1,s=0, T₀T₁=π in R□.
- **Semistable.chartRing.unit_coordinate** (computation): For s=1, Y₁Z₁=1, including after reduction modulo p.
- **Semistable.chartRing.point** (degenerate): For r=s=0, Q≃R by T₀↦π, and R□≃AdicCompletion((p),R).

Acceptance:

- The completed nodal relation is T₀T₁=π.
- At r=s=0 the completion is the p-adic completion of R.

Direct prerequisites: `mathlib:MvPolynomial`; `mathlib:Ideal.Quotient.mk`; `mathlib:AdicCompletion`; `mathlib:AdicCompletion.evalₐ`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §1.5, (1.5.1), pp.4–5.

#### Divisorial semistable log structure

**Semistable.divisorialLog** — construction; node `AInfCohomology:AI.6/divisorial-log`.

For a CK formal model 𝔛, take the associated log structure of O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét; the base prelog monoid is O_C∖{0}. On a chart it is the pushout of ℕ^{r+1} along the diagonal ℕ→ℕ^{r+1} and 1↦p^q in O_C∖{0}. It is quasi-coherent and integral; the base need not be fine. Its generic-fibre restriction is trivial.

Additional hypotheses: 𝔛 is p-adic, locally of finite presentation, O_C-flat and étale locally admits the specified charts.

Construction or proof:

1. Import associated log structures and integral monoid pushouts from CR.5:log-algebra.
2. Apply CK Claims 1.6.1–1.6.3 to identify the chart and the divisorial structure; use fine versions only when the log-crystalline site requires them.

Uses:

- **CK Theorems 4.11,4.17,5.4**: Log differentials and log crystalline cohomology require the actual divisorial chart.
- **CrystallineCohomology:CR.6**: The arithmetic log special fibre must be matched to Hyodo–Kato conventions.

API:

- **Semistable.divisorialLog.chart** (characterisation): The associated chart is ℕ^{r+1}⊔_ℕ(O_C∖{0}) with the displayed maps.
- **Semistable.divisorialLog.pullback** (functoriality): Strict étale chart pullback agrees with the divisorial log structure, and composes under refinement.
- **Semistable.divisorialLog.generic** (compatibility): After p-inversion its associated log structure is the units log structure.

Unit tests:

- **Semistable.divisorialLog.node** (computation): At the closed node of T₀T₁=p^q the relative characteristic chart has two branch generators modulo the base diagonal.
- **Semistable.divisorialLog.smooth** (compatibility): At r=0 the relative log differentials are the ordinary differentials of the torus chart.
- **Semistable.divisorialLog.nonfine** (non-example): The base chart O_C∖{0} has value monoid Q≥0 in the CK setup, which is not finitely generated; no fine hypothesis is asserted for this chart.

Acceptance:

- At a node the two branch generators satisfy dlogT₀+dlogT₁=0 over the log base.

Direct prerequisites: `AInfCohomology:AI.6/chart-ring`; `CrystallineCohomology:CR.5:log-algebra`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §1.6, Claims 1.6.1–1.6.3, pp.5–6.

#### Semistable perfectoid root tower

**Semistable.rootTower** — construction; node `AInfCohomology:AI.6/root-tower`.

Given R□→R p-adically formally étale, form R_m by base change from the chart adjoining p^m-th roots of every branch and invertible coordinate and imposing ∏Tᵢ^{1/p^m}=p^{q/p^m}. Set R_∞ to the p-adic completion of colim_mR_m. Its generic fibre is a pro-étale cover with group Δ={(ε₀,…,ε_d):∏_{i=0}^rεᵢ=1}≃Z_p^d; R_∞ is integral perfectoid.

Additional hypotheses: R is p-completely formally étale over the chart; roots use the fixed compatible systems.

Construction or proof:

1. Use the root tower and perfectoid/pro-étale criteria supplied by AI.3 and PerfectoidSpaces:P3.
2. Impose the product relation and compute the action and CK §3.2 group; do not assert integral flatness of the tower.

Uses:

- **CK §§3.14–3.25**: Continuous cochains on this actual cover give the local AΩ comparison.

API:

- **Semistable.rootTower.transition** (data): Level m embeds into level m+1 by sending each root to the p-th power of the next root.
- **Semistable.rootTower.action** (structure): The continuous Δ-action scales each compatible root and preserves the branch-product relation.
- **Semistable.rootTower.perfectoid** (compatibility): The completed tower uses the shared integral perfectoid carrier, and its associated generic-fibre cover uses the shared pro-étale carrier.

Unit tests:

- **Semistable.rootTower.node_action** (computation): For T₀T₁=p^q, δ(T₀^{1/p^m})=ζ_{p^m}^{-1}T₀^{1/p^m} and δ(T₁^{1/p^m})=ζ_{p^m}T₁^{1/p^m}.
- **Semistable.rootTower.point** (degenerate): For r=s=0 the tower is O_C with trivial Δ.
- **Semistable.rootTower.nonflat** (non-example): For the nodal chart at p=2,m=1, the generic root cover has rank 2 but its closed-node special-fibre algebra has basis 1,a,b and length 3 (a²=b²=ab=0); the integral map is not flat.

Acceptance:

- The group has rank d rather than d+1; the node remains nonflat integrally.

Direct prerequisites: `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.3`; `PerfectoidSpaces:P3`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§3.1–3.3, pp.9–10.

#### Normalized semistable monomial indices

**Semistable.monomialExponents** — definition; node `AInfCohomology:AI.6/monomial-exponents`.

At root level m, an index consists of a∈ℕ^{r+1}, b∈ℤ^s and a branch j with a_j=0, modulo equality of a and b (the witness j is not extra data). It represents ∏Tᵢ^{aᵢ/p^m}∏Yⱼ^{bⱼ/p^m}. Normalize an arbitrary a by subtracting min_i a_i; the removed factor is p^{q·min(a)/p^m}. The index is integral precisely when p^m divides every a_i and b_j.

Additional hypotheses: r+1 is nonempty; signed torus exponents are essential; normalization acts on branch exponents only.

Construction or proof:

1. Use finite tuples and integer divisibility from the baseline.
2. Apply the unique branch-product normal form in CK (3.1.1); retain the removed coefficient instead of deleting it.

Uses:

- **CK §§3.1,3.14–3.16**: The integral/nonintegral splitting and Δ-eigencharacters use these normalized indices.

API:

- **Semistable.monomialExponents.normalize** (constructor): Normalization sends a to a−min(a) coordinatewise and records min(a).
- **Semistable.monomialExponents.normalized** (characterisation): A branch exponent is normalized iff at least one coordinate is zero; normalize fixes such tuples.
- **Semistable.monomialExponents.integral** (characterisation): At level m integrality means simultaneous divisibility by p^m of branch and signed torus numerators.

Unit tests:

- **Semistable.monomialExponents.node** (computation): normalize(2,3)=(0,1) and the removed minimum is 2.
- **Semistable.monomialExponents.point** (degenerate): For r=s=0 the sole normalized branch exponent is 0 and every level has only the integral index.
- **Semistable.monomialExponents.fractional_torus** (non-example): At p=2,m=1, branch tuple (0,2) and torus numerator −1 give a nonintegral index; ignoring negative torus exponents would give the wrong answer.

Acceptance:

- The normalized node monomial T₀²T₁³ has coefficient p^{2q} and exponent (0,1).

Direct prerequisites: `AInfCohomology:AI.6/chart-ring`; `mathlib:Finset.max'`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §3.1, (3.1.1), p.9.

#### Integral and nonintegral monomial splitting

**Semistable.monomialSplitting** — theorem; node `AInfCohomology:AI.6/monomial-splitting`.

The completed monomial expansion yields Δ-equivariant decompositions R_∞=R⊕M_∞ and A_inf(R_∞)=A(R)⊕N_∞, with integral indices in the first summand and nonintegral indices in the second; A(R) is the (p,μ)-complete lift below. These are completed module decompositions, not a direct product of rings.

Additional hypotheses: The chart and its formally étale lift satisfy CK §3.1; completions are the ones in §3.14.

Construction or proof:

1. Apply the normalized expansion to the chart and pass through p-completely étale base change as in CK §§3.14–3.16.
2. Use the Witt/perfectoid interfaces from AI.0 and AI.3 to identify the completed integral lift and action on each nonintegral monomial.

Acceptance:

- The product of two nonintegral monomials can be integral, so N_∞ is not asserted to be an ideal.

Direct prerequisites: `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/monomial-exponents`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.0`; `AInfCohomology:AI.3`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§3.14–3.16, pp.13–14.

#### Integral A_inf chart lift

**Semistable.ainfChartLift** — construction; node `AInfCohomology:AI.6/ainf-chart-lift`.

Let A(R□)=A_inf{X₀,…,Xᵣ,X_{r+1}^{±1},…,X_d^{±1}}/(∏Xᵢ−[(p^{1/p∞})^q]), completed for (p,μ). Lift the formally étale map R□→R uniquely to a (p,μ)-complete formally étale A(R□)-algebra A(R). It has Frobenius Xᵢ↦Xᵢ^p and the integral Δ-action from the root tower; reduction along θ is R.

Additional hypotheses: Use the fixed compatible roots; the lift is of the specified formally étale chart, not an arbitrary singular A_inf-algebra.

Construction or proof:

1. Apply AI.0 period-ring reductions and AI.3 unique complete étale lifting to the algebraic chart.
2. Use CK §§3.14–3.16 to identify the lift with the integral monomial summand.

Uses:

- **CK §§3.19–3.25,5.10–5.16**: Integral continuous cochains and log derivations act on A(R).

API:

- **Semistable.ainfChartLift.theta** (compatibility): A(R)⊗̂_{A_inf,θ}O_C≃R, agreeing with the imported θ.
- **Semistable.ainfChartLift.frobenius** (simp): φ(Xᵢ)=Xᵢ^p and φ acts by Witt Frobenius on coefficients.
- **Semistable.ainfChartLift.etale** (universal-property): Complete formally étale chart lift maps are unique and commute with chart restriction.

Unit tests:

- **Semistable.ainfChartLift.node** (computation): At r=1, X₀X₁=[(p^{1/p∞})^q] before θ-reduction.
- **Semistable.ainfChartLift.point** (degenerate): At R=O_C the lift is A_inf.
- **Semistable.ainfChartLift.theta_tilde** (non-example): Under the embedding into A_inf(R_∞), θ̃(Xᵢ) is the chosen p-th root coordinate in R_∞; it is not in general the coordinate tᵢ of R. Thus the θ lift-to-R map cannot be relabelled θ̃.

Acceptance:

- Frobenius raises the lifted relation to its p-th power and lifts absolute Frobenius mod p.

Direct prerequisites: `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.0`; `AInfCohomology:AI.3`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§3.14–3.16 and §5.9, pp.13–14,36.

#### Nonintegral cohomology annihilation

**Semistable.nonintegralAnnihilation** — theorem; node `AInfCohomology:AI.6/nonintegral-annihilation`.

For every i, μ annihilates H^i_cont(Δ,N_∞). Moreover H^i_cont(Δ,A_inf(R_∞)/μ) is p-torsion-free and has no nonzero W(m^♭)-torsion. These are the exact inputs that turn the almost edge comparison into an integral Lη_μ equivalence.

Construction or proof:

1. Compute each Δ-eigencharacter on the normalized monomial summands using AI.3 continuous Koszul cochains.
2. Use CK Proposition 3.19 and Proposition 3.25, including their completed direct-sum limits; import the almost-to-integral Lη criterion from AI.1/AI.3.

Acceptance:

- A fractional branch eigencharacter is removed after Lη_μ; merely applying almost purity is insufficient.

Direct prerequisites: `AInfCohomology:AI.6/monomial-splitting`; `AInfCohomology:AI.6/monomial-exponents`; `AInfCohomology:AI.3`; `AInfCohomology:AI.1`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Propositions 3.19 and 3.25 with proofs, pp.16–22.

#### Integral semistable local edge comparison

**Semistable.localEdge** — theorem; node `AInfCohomology:AI.6/local-edge`.

The natural edge map gives Lη_μ RΓ_cont(Δ,A_inf(R_∞))≃Lη_μ RΓ_proét((SpfR)_C^ad,A_inf,X), and the left side is computed by Lη_μ on the integral Koszul complex for A(R). It is natural under the eligible chart maps.

Construction or proof:

1. AI.3 almost purity identifies the cone up to W(m^♭)-torsion.
2. Apply the annihilation and no-almost-torsion estimates, then AI.1 derived décalage; remove the nonintegral summand using CK Theorem 3.20.

Acceptance:

- The comparison is integral; it must not be weakened to an almost quasi-isomorphism.

Direct prerequisites: `AInfCohomology:AI.6/nonintegral-annihilation`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.3`; `AInfCohomology:AI.1/derived-decalage`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 3.20 and Remark 3.21, pp.18–19.

#### Semistable AΩ complex

**Semistable.aOmega** — construction; node `AInfCohomology:AI.6/aomega`.

For ν:X_C,proét^ad→𝔛_ét define AΩ_𝔛=Lη_μRν_*A_inf,X in the imported monoidal derived sheaf category. The semistable extension uses the same integral sheaf and décalage as AI.3, now on the CK charts. It is a multiplicative, ξ-derived-complete complex, functorial in eligible semistable model morphisms; RΓ_Ainf(𝔛)=RΓ(𝔛_ét,AΩ_𝔛).

Additional hypotheses: 𝔛 is as in CK §1.5, not required proper for this sheaf definition.

Construction or proof:

1. Import the actual period sheaf, ν and multiplicative pushforward from AI.3/E1.
2. Apply AI.1 lax monoidal décalage, and use local-edge for the semistable local computation and CK Proposition 4.6 for completeness.

Uses:

- **CK §§4–7**: All specializations start with this actual complex.
- **CohomologyComparisons:CP.4 and CohomologyComparisons:CP.5**: Rational assembly and torsion/lattice applications import these maps.

API:

- **Semistable.aOmega.local** (equivalence): Restriction to a framed affine is the local-edge Koszul computation, independently of the framing.
- **Semistable.aOmega.functorial** (functoriality): Pullback maps along eligible model morphisms preserve products and satisfy identity/composition.
- **Semistable.aOmega.complete** (structure): AΩ is derived ξ-complete, with the source completion convention; this is not arbitrary commutation of décalage and completion.
- **Semistable.aOmega.smooth** (compatibility): For smooth models the ν/period-sheaf/Lη construction agrees with AI.3 under the same site comparison.

Unit tests:

- **Semistable.aOmega.point** (degenerate): For SpfO_C the global complex is A_inf concentrated in degree 0.
- **Semistable.aOmega.node** (computation): For the node T₀T₁=p^q its local computation uses the rank-one Δ action with opposite weights on T₀,T₁.
- **Semistable.aOmega.good_reduction** (compatibility): For a smooth formal torus its local complex is the AI.3 toric AΩ complex with identical coefficient maps.

Acceptance:

- On a good reduction chart this construction agrees with AI.3, including the map from pro-étale cochains.

Direct prerequisites: `AInfCohomology:AI.3`; `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/decalage-products`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.6/local-edge`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §4.1 and Proposition 4.6, pp.23–25.

Planet: **Semistable AΩ complex**.

#### Semistable AΩ Frobenius

**Semistable.aOmegaFrobenius** — theorem; node `AInfCohomology:AI.6/aomega-frobenius`.

The period-sheaf Frobenius induces φ_A^*AΩ≃Lη_{ξ̃}AΩ→AΩ. The linearized map becomes an equivalence after inverting ξ̃, and is compatible with products and eligible pullback. It need not be an integral equivalence.

Construction or proof:

1. Use μ=ξ·φ_A⁻¹(μ) and AI.1 composition of décalage with period-sheaf Frobenius.
2. Apply CK (2.1.4), §4.2 and the local torsion-free representatives; the monoidal compatibility comes from AI.1.

Acceptance:

- The degree-j crystalline Frobenius is p^jφ on j-forms, not coefficient Frobenius alone.

Direct prerequisites: `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.0`; `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/decalage-products`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §2.1, (2.1.4), §4.2.

#### Log Hodge–Tate reduction

**Semistable.hodgeTateComparison** — theorem; node `AInfCohomology:AI.6/hodge-tate-comparison`.

AΩ_𝔛⊗^L_{A_inf,θ̃}O_C≃Lη_{ζ_p−1}Rν_*Ô_X^+. Its cohomology sheaves in degree i are Ω^i_{𝔛/O_C,log}{−i}, with H^0=O_𝔛 and H^1 as the canonical twisted log differential identification; multiplication is exterior product.

Construction or proof:

1. Apply AI.1 base-change/Bockstein criteria to local-edge and CK §§4.3–4.6.
2. Use CK Theorem 4.11 log Kummer calculation; its extension argument uses the formal-GAGA input G-GAGA and log geometry from CR.5.

Acceptance:

- At a node dlogT₀+dlogT₁=0, so Ω^1_log has rank 1; ordinary singular differentials are the wrong answer.

Direct prerequisites: `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/divisorial-log`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.0`; `AInfCohomology:AI.1`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 4.11 and preceding reductions, pp.25–29.

Planet: **Log Hodge–Tate comparison**.

#### Log de Rham specialization

**Semistable.logDeRhamComparison** — theorem; node `AInfCohomology:AI.6/log-de-rham`.

AΩ_𝔛⊗^L_{A_inf,θ}O_C≃Ω^•_{𝔛/O_C,log} as multiplicative complexes. The differential is the log de Rham differential, obtained from the Bockstein of the θ̃ reduction; on sections it sends f to d_log f. The sheaf equivalence globalizes to RΓ_Ainf⊗^L_{θ}O_C≃RΓ_logdR for qcqs 𝔛, with the source completed sheaf convention.

Construction or proof:

1. Apply the AI.1 Bockstein-reduction node, retaining its differential, to hodge-tate-comparison.
2. Identify the degree-one Bockstein using the local Kummer calculation and CR.5 log differentials, then use multiplicativity and CK Theorems 4.17–4.18.

Acceptance:

- On T₀T₁=p^q the relation dlogT₀+dlogT₁=0 is respected by the actual differential.

Direct prerequisites: `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.1/bockstein-reduction`; `CrystallineCohomology:CR.5`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorems 4.17–4.18, pp.30–32.

Planet: **Log de Rham comparison**.

#### Perfect semistable A_inf cohomology

**Semistable.properPerfectness** — theorem; node `AInfCohomology:AI.6/proper-perfectness`.

If 𝔛 is proper over O_C, RΓ_Ainf(𝔛) is a perfect A_inf-complex. If the special fibre is pure of dimension d it is represented by finite free terms in degrees 0,…,2d. This does not imply that its cohomology modules are free.

Additional hypotheses: Properness and pure dimension d apply only to the bounded-range assertion.

Construction or proof:

1. Use log-de-rham, proper coherent/log differential finiteness from CR.5 and G-GAGA.
2. Apply AI.5 derived Nakayama/perfect lifting to the derived ξ-complete complex as in CK Proposition 4.20.

Acceptance:

- A perfect two-term multiplication-by-p complex has torsion cohomology; the theorem must allow it.

Direct prerequisites: `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.5`; `CrystallineCohomology:CR.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 4.20 with proof, pp.32–33.

#### Finite PD décalage base change

**Semistable.finitePDBaseChange** — theorem; node `AInfCohomology:AI.6/finite-pd-base-change`.

Write A_cris^(m) for AI.0/CR.0’s p-completed subalgebra adjoining ξ^s/s! for s≤m. For m≥p, on a CK chart the natural map from (Lη_μRΓ_cont(Δ,A_inf(R_∞)))⊗̂^L_{A_inf}A_cris^(m) to Lη_μRΓ_cont(Δ,A_cris^(m)(R_∞)) is an equivalence. The same local edge comparison holds after this finite PD extension.

Additional hypotheses: m≥p; every tensor here is derived p-completed; no unrestricted Lη/tensor commutation is asserted.

Construction or proof:

1. Use CK §§3.30–3.35: nonintegral annihilation survives the finite PD extension and the reduced cohomology has no almost torsion.
2. Apply the exact local criterion of AI.1, then CK Proposition 5.6; pass to the p-completed filtered colimit only using E4/EC.

Acceptance:

- The statement cannot be used with an arbitrary coefficient ring or without completion.

Direct prerequisites: `AInfCohomology:AI.6/local-edge`; `AInfCohomology:AI.6/nonintegral-annihilation`; `AInfCohomology:AI.0`; `CrystallineCohomology:CR.0`; `AInfCohomology:AI.1`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`; `EnhancedDerivedSheaves:E4/completed-colimits`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 3.32, Theorem 3.34, Proposition 5.6, pp.22–23,35.

#### Local logarithmic derivations

**Semistable.logDerivations** — construction; node `AInfCohomology:AI.6/log-derivations`.

On the chart polynomial ring, for branch direction 1≤i≤r let D_i=X_i∂_i−X₀∂₀; for each torus pair Y_j,Z_j let D_j=Y_j∂_{Y_j}−Z_j∂_{Z_j}. These derivations preserve the chart ideal and commute. They extend continuously to A(R) and the eligible finite PD/log envelopes. The associated log de Rham complex is their Koszul complex, with degree-j Frobenius p^jφ.

Additional hypotheses: Indices distinguish branches from torus directions; p-completed PD extensions are those of CK §5.10, not arbitrary completions.

Construction or proof:

1. Use Mathlib MvPolynomial.pderiv and the Leibniz rule to check the two defining relations.
2. Use CR.5 unique log/PD lifting and AI.1’s Koszul carrier to form the completed complex as CK §§5.10–5.13.

Uses:

- **CK Lemmas 5.15–5.16**: The exponential comparison relates these derivations to Δ-cochains.
- **CrystallineCohomology:CR.6**: Frobenius normalization must agree with the Hyodo–Kato export.

API:

- **Semistable.logDerivations.generators** (simp): D_i(X_i)=X_i, D_i(X₀)=−X₀ and all other branch values are zero; torus direction sends Y to Y and Z to −Z.
- **Semistable.logDerivations.relations** (relation): Each D annihilates ∏X_i−a and Y_jZ_j−1, hence descends to the quotient.
- **Semistable.logDerivations.frobenius** (compatibility): D_iφ=pφD_i; on the log differential complex the degree-j lift is p^jφ.

Unit tests:

- **Semistable.logDerivations.node** (computation): On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀X₁−a)=0 for every integer a.
- **Semistable.logDerivations.torus** (computation): On Z[Y,Z], (Y∂_Y−Z∂_Z)(YZ−1)=0.
- **Semistable.logDerivations.zero_rank** (degenerate): For r=s=0 there are no log directions, and the Koszul complex has only degree 0.

Acceptance:

- The branch sum relation is killed; degree-one Frobenius multiplies by p.

Direct prerequisites: `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.6/divisorial-log`; `mathlib:MvPolynomial.pderiv`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.1`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§5.10–5.13, pp.36–38.

#### Local logarithmic crystalline comparison

**Semistable.localCrystalline** — theorem; node `AInfCohomology:AI.6/local-crystalline`.

For m≥p² the exponential identity δ_i=exp(log[ε]·D_i) gives an invertible comparison between η_μK(δ_i−1) on the finite PD chart lift and K(D_i). After completed colimit in m this gives the local A_cris comparison with log crystalline cohomology. The map in degree j intertwines φ with p^jφ on log forms.

Additional hypotheses: m≥p² for the exponential argument; the smaller bound m≥p of finite-pd-base-change is distinct.

Construction or proof:

1. Use CK Lemma 5.15 to factor (δ_i−1)/μ=D_i·U_i with U_i a convergent unit operator.
2. Apply CK Lemma 5.16 and CR.5’s log PD Poincaré lemma to the commuting Koszul complexes, then finite-pd-base-change and completed-colimit descent.

Acceptance:

- The scaling in degree j is part of the map; an unscaled differential comparison fails Frobenius compatibility.

Direct prerequisites: `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.6/log-derivations`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.1`; `EnhancedDerivedSheaves:E4/completed-colimits`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Lemmas 5.15–5.16, pp.38–40.

#### All-coordinates semistable presentations

**Semistable.allCoordinates** — definition; node `AInfCohomology:AI.6/all-coordinates`.

For an affine SpfR admitting CK charts, an index (Σ,Λ) consists of a finite set Σ of invertible functions giving a closed immersion into a formal torus, and a nonempty finite family Λ of formally étale semistable chart maps. Refine by adjoining coordinates/charts. After the CK §5.17 localization, any two distinct special-fibre components meet, so nonsmooth charts have the same branch-product valuation. Form the product chart algebra A□_{Σ,Λ}, with diagonal base log elements identified.

Additional hypotheses: Use the local class of CK §5.17; arbitrary unrelated semistable charts are not substituted.

Construction or proof:

1. Use the shared formal-scheme/étale carriers from AI.3 and CR.5; construct only the eligible presentation index.
2. Apply CK §§5.17–5.21 to obtain the cofinal chart refinements and common root cover.

Uses:

- **CK §§5.22–5.40**: Presentation-independent crystalline maps are made by colimit over this index.

API:

- **Semistable.allCoordinates.refine** (constructor): Finite union of invertible coordinates and finite union of chart families define a common refinement of eligible indices.
- **Semistable.allCoordinates.maps** (functoriality): Refinement gives compatible maps of chart algebras and root covers, satisfying identity/composition.
- **Semistable.allCoordinates.single** (compatibility): With one chart and its invertible coordinates, the product presentation reduces to that chart and its root tower.

Unit tests:

- **Semistable.allCoordinates.two_charts** (characterisation): Two distinct eligible node charts are both refined by the index containing their union.
- **Semistable.allCoordinates.no_chart** (non-example): Λ=∅ is excluded; torus coordinates alone do not constitute the logarithmic semistable presentation.
- **Semistable.allCoordinates.smooth** (compatibility): For a smooth torus chart the construction specializes to AI.4’s all-coordinates smooth presentation.

Acceptance:

- Adjoining two allowed framings yields a common refinement, without choosing one framing as canonical.

Direct prerequisites: `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.3`; `CrystallineCohomology:CR.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§5.17–5.21, pp.40–43.

#### Log exactification of all-coordinates charts

**Semistable.logExactification** — construction; node `AInfCohomology:AI.6/log-exactification`.

Choose λ₀∈Λ and the fine monoid Q from CK §5.25. Use P_{λ₀} from (5.26.1) in the smooth case, or (5.27.2) indexed by the generic points Y of the special fibre in the nonsmooth case. The immersion Spec(R/p)→Spec(A□_{Σ,Λ}) factors as an exact log closed immersion j_{λ₀} into Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]), followed by a log étale map. The canonical changes λ₀→λ₀′ commute with Frobenius and satisfy the cocycle law.

Additional hypotheses: All-coordinates presentations satisfy CK §5.17; use the fine versions, not a PD envelope with p nonnilpotent and a nonexact immersion.

Construction or proof:

1. Import CR.5 chart/log-étale criteria; construct P_{λ₀} with branch ratios U_{λ,λ₀,y} and their product relations.
2. Apply CK §§5.26–5.27, using U_{λ,λ₀′,y}=U_{λ,λ₀,y}/U_{λ₀′,λ₀,y} to check the change maps.

Uses:

- **CK §§5.28–5.34**: An ordinary envelope after exactification computes the completed log PD envelope.

API:

- **Semistable.logExactification.factor** (data): The displayed factorization is exact-closed followed by log étale and commutes with the map to R/p.
- **Semistable.logExactification.units** (simp): In the nonsmooth case X_{λ,iλ(y)}=U_{λ,λ₀,y}X_{λ₀,iλ₀(y)} and U_{λ₀,λ₀,y}=1.
- **Semistable.logExactification.change** (functoriality): Changing λ₀ uses the displayed ratios and composes by the cocycle law, preserving log charts and Frobenius.

Unit tests:

- **Semistable.logExactification.single** (degenerate): For a single nonsmooth chart the ratio units are 1 and exactification retains the original chart.
- **Semistable.logExactification.node** (computation): For two node charts x′=ax,y′=a⁻¹y with a a unit, the ratio units are a and a⁻¹ and their product is 1.
- **Semistable.logExactification.nonexact_pd** (non-example): The uncompleted envelope of the original possibly nonexact log immersion is not invoked with p nonnilpotent; exactification must precede the ordinary PD construction.

Acceptance:

- The envelope computation is independent of λ₀ through actual change maps.

Direct prerequisites: `AInfCohomology:AI.6/all-coordinates`; `CrystallineCohomology:CR.5:log-algebra`; `CrystallineCohomology:CR.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§5.25–5.27, pp.44–47.

#### All-coordinates log PD envelope

**Semistable.allCoordinatesPD** — construction; node `AInfCohomology:AI.6/all-coordinates-pd`.

Let D_{jλ₀} be CR.0’s ordinary divided power envelope of the exactified immersion over (Z_p,pZ_p), equivalently over the compatible uncompleted A_cris^0. Its p-adic completion D_{Σ,Λ} is the completed log PD envelope used for R/p. CK §§5.29–5.34 define finite PD subalgebras D_{Σ,Λ}^{(m)} with completed colimit D_{Σ,Λ}, independent of λ₀ and functorial under refinement. No p-torsion-freeness of D is assumed.

Construction or proof:

1. Apply the imported universal ordinary PD envelope after log-exactification, then use CR.5’s exact-immersion comparison to the log envelope.
2. Use CK Proposition 5.29 and §§5.30–5.34 for p-completion, finite PD approximants and inherited Δ-action/log derivations.

Uses:

- **CK §§5.35–5.40**: The log crystalline complex and its comparison map use this envelope.

API:

- **Semistable.allCoordinatesPD.universal** (universal-property): Maps to compatible p-complete log PD thickenings factor uniquely through D_{Σ,Λ} under the source exactness/nilpotence hypotheses.
- **Semistable.allCoordinatesPD.refine** (functoriality): Refinement and change of λ₀ commute with PD structure, Frobenius and log derivations.
- **Semistable.allCoordinatesPD.finite** (characterisation): D is the p-completed colimit of the specified finite PD subalgebras; termwise completion alone is not substituted for a derived comparison.

Unit tests:

- **Semistable.allCoordinatesPD.single** (compatibility): For one chart D is the log PD lift used in local-crystalline.
- **Semistable.allCoordinatesPD.ratio** (computation): For two node charts differing by a unit a the ratio variable U reduces to a and the two λ₀ constructions are canonically isomorphic.
- **Semistable.allCoordinatesPD.point** (degenerate): For SpfO_C the compatible envelope gives A_cris with its imported divided powers.

Acceptance:

- Replacing the log envelope with the original nonexact ordinary envelope changes the answer.

Direct prerequisites: `AInfCohomology:AI.6/log-exactification`; `CrystallineCohomology:CR.0`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.6/log-derivations`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`; `EnhancedDerivedSheaves:E4/completed-colimits`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§5.28–5.34, pp.47–50.

Planet: **Log PD all-coordinates construction**.

#### All-coordinates AΩ comparison model

**Semistable.allCoordinatesAOmega** — construction; node `AInfCohomology:AI.6/all-coordinates-aomega`.

Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1). In the shared derived enhancement this is a multiplicative model for AΩ_R⊗̂^L_{A_inf}A_cris with coherent refinement maps; CK §5.35 and finite-pd-base-change justify the termwise model.

Construction or proof:

1. Use the combined root covers from all-coordinates and AI.3 continuous Koszul cochains.
2. Apply finite-pd-base-change at each m and CK §5.35; take completed colimits through EC, retaining actual coherent maps.

Uses:

- **CK Proposition 5.39**: This is the AΩ side of the functorial log crystalline map.

API:

- **Semistable.allCoordinatesAOmega.edge** (equivalence): The comparison with AΩ_R⊗̂^L A_cris is the local edge map, compatible with chart restriction.
- **Semistable.allCoordinatesAOmega.refine** (functoriality): Refinement maps commute with cochain differentials and the completed colimit structure.
- **Semistable.allCoordinatesAOmega.frobenius** (compatibility): The model’s Frobenius agrees with aomega-frobenius after PD base change.

Unit tests:

- **Semistable.allCoordinatesAOmega.point** (degenerate): At SpfO_C the complex is A_cris in degree 0.
- **Semistable.allCoordinatesAOmega.single** (compatibility): For one node chart the model restricts to η_μ of its local rank-one Δ cochain complex.
- **Semistable.allCoordinatesAOmega.refinement** (characterisation): The two chart embeddings into a common refinement induce the same equivalence with the intrinsic AΩ target.

Acceptance:

- The maps agree for two different chart families under their union.

Direct prerequisites: `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.1`; `EnhancedDerivedSheaves:E4/completed-colimits`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §5.35, (5.35.2), pp.50–51.

#### All-coordinates log crystalline model

**Semistable.allCoordinatesLogCrystalline** — construction; node `AInfCohomology:AI.6/all-coordinates-log-crystalline`.

Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of K_{D_{Σ,Λ}^{(m)}}(D_τ). CR.5’s log PD Poincaré lemma identifies this model with Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}; the source’s envelope-completion arguments justify the explicit terms. Degree-j Frobenius is p^jφ.

Construction or proof:

1. Use the log derivations and the finite PD subalgebras of all-coordinates-pd.
2. Apply CR.5’s log PD Poincaré lemma and CK (5.36.2); use E1/EC for the coherent completed colimit.

Uses:

- **CK Proposition 5.39 and Theorem 5.4**: This is the target of the intrinsic log crystalline comparison.

API:

- **Semistable.allCoordinatesLogCrystalline.poincare** (equivalence): The model identifies with the imported log crystalline pushforward via the log PD Poincaré morphism.
- **Semistable.allCoordinatesLogCrystalline.refine** (functoriality): Envelope refinement gives coherent maps of these complexes and composes with chart restriction.
- **Semistable.allCoordinatesLogCrystalline.frobenius** (simp): On degree j forms the map is p^jφ, agreeing with log crystalline Frobenius.

Unit tests:

- **Semistable.allCoordinatesLogCrystalline.point** (degenerate): At SpfO_C the model is A_cris in degree 0.
- **Semistable.allCoordinatesLogCrystalline.node** (computation): For one node chart the degree-one forms have the relation dlogX₀+dlogX₁=0.
- **Semistable.allCoordinatesLogCrystalline.smooth** (compatibility): For r=0 the log model identifies with the ordinary smooth crystalline all-coordinates complex of AI.4.

Acceptance:

- Frobenius on one log direction multiplies its differential by p.

Direct prerequisites: `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/log-derivations`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.1`; `EnhancedDerivedSheaves:E4/completed-colimits`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §5.36, (5.36.2), pp.51–52.

#### All-coordinates comparison morphism

**Semistable.allCoordinatesComparisonMap** — construction; node `AInfCohomology:AI.6/all-coordinates-map`.

Use the canonical map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK §5.38, including its logarithmic ratio variables, and the exponential comparison to construct the natural multiplicative map from the all-coordinates log crystalline model to the all-coordinates AΩ model. It commutes with φ, refinements and specialization to log de Rham.

Construction or proof:

1. Use unique p-divisible log lifts and PD universal properties from CR.5/CR.0 to map exactification units into A_cris(R_∞).
2. Apply local-crystalline’s exponential operator and CK §5.38; passage to all-coordinates colimits preserves the specified maps.

Uses:

- **CK Proposition 5.39 and Proposition 5.41**: Its equivalence and its reduction square give canonical global comparisons.

API:

- **Semistable.allCoordinatesComparisonMap.coefficients** (data): The degree-zero map is the canonical compatible PD/log map D→A_cris(R_∞).
- **Semistable.allCoordinatesComparisonMap.frobenius** (compatibility): The comparison intertwines p^jφ on j-forms with the AΩ Frobenius.
- **Semistable.allCoordinatesComparisonMap.natural** (functoriality): The map commutes with all-coordinates refinement and with eligible model pullback.

Unit tests:

- **Semistable.allCoordinatesComparisonMap.point** (degenerate): At SpfO_C the map is the identity of A_cris.
- **Semistable.allCoordinatesComparisonMap.node** (computation): In one node direction the comparison is the unit-operator exponential comparison of local-crystalline.
- **Semistable.allCoordinatesComparisonMap.de_rham** (compatibility): After A_cris→O_C the induced morphism is the log de Rham specialization, including its differential.

Acceptance:

- Both arrows come from the same compatible PD/log lift; an arbitrary quasi-isomorphism is insufficient.

Direct prerequisites: `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates-aomega`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `AInfCohomology:AI.6/local-crystalline`; `CrystallineCohomology:CR.5`; `CrystallineCohomology:CR.0`; `EnhancedDerivedSheaves:E4/completed-colimits`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §5.38, pp.52–55.

#### Absolute log crystalline comparison

**Semistable.absoluteCrystallineComparison** — theorem; node `AInfCohomology:AI.6/absolute-crystalline`.

The all-coordinates comparison morphism is a quasi-isomorphism and sheafifies to AΩ_𝔛⊗̂^L_{A_inf}A_cris≃Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}, functorially and multiplicatively, with Frobenius. The tensor is derived p-completed.

Construction or proof:

1. Reduce by cofinal single-chart refinements and CK Proposition 5.39 to local-crystalline, using log PD Poincaré homotopies on the extra coordinates.
2. Sheafify by CK §5.40 in E1; the explicit map remains the map of all-coordinates-map.

Acceptance:

- The equivalence recovers AI.4 for smooth charts and retains the node log differential.

Direct prerequisites: `AInfCohomology:AI.6/all-coordinates-map`; `AInfCohomology:AI.6/local-crystalline`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `CrystallineCohomology:CR.5`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 5.4, Proposition 5.39 and §5.40, pp.34–35,55–57.

Planet: **Log crystalline comparison**.

#### Log crystalline and de Rham agreement

**Semistable.crystallineDeRhamSquare** — theorem; node `AInfCohomology:AI.6/crystalline-de-rham-square`.

After A_cris→O_C, absolute-crystalline agrees with log-de-rham and CR.5’s log crystalline-to-log de Rham comparison. The square commutes as a natural map of multiplicative derived complexes, rather than only an equality of cohomology ranks.

Construction or proof:

1. Use the PD/log generator maps in all-coordinates-map; reduce its exponential operators along θ.
2. Apply CK Proposition 5.41 and CR.5’s explicit log PD Poincaré reduction.

Acceptance:

- On a node, the square carries dlogT₁ to dlogT₁ with the same relation and differential.

Direct prerequisites: `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.6/all-coordinates-map`; `AInfCohomology:AI.6/log-de-rham`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.0`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 5.41, pp.57–58.

#### Global crystalline and Witt specializations

**Semistable.globalCrystallineComparison** — theorem; node `AInfCohomology:AI.6/global-crystalline`.

For qcqs 𝔛, RΓ_Ainf(𝔛)⊗̂^L A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) and RΓ_Ainf(𝔛)⊗̂^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)). If 𝔛 is proper the ordinary derived tensors suffice, and H^i_logcrys(𝔛_{O_C/p}/A_cris)[1/p] is finite free over A_cris[1/p]. The W(k̄) log base first uses Q≥0→W(k̄); the arithmetic normalization is the next node.

Additional hypotheses: qcqs for the completed form; properness for dropping completion and the p-inverted freeness assertion.

Construction or proof:

1. Globalize absolute-crystalline using E1/E4 and CR.5 log crystalline base change.
2. Use proper-perfectness and CK Corollary 5.43 to remove the extra completion in the proper case; use the source crystalline finiteness/isogeny results supplied by CR.5/CR.6 for the p-inverted freeness.

Acceptance:

- The proper and qcqs formulas must not be interchanged; finite freeness is after p-inversion here.

Direct prerequisites: `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.6/proper-perfectness`; `CrystallineCohomology:CR.5`; `CrystallineCohomology:CR.6`; `AInfCohomology:AI.0`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Corollary 5.43 and §5.42, pp.58–60.

#### Arithmetic Hyodo–Kato interface

**Semistable.hyodoKatoInterface** — theorem; node `AInfCohomology:AI.6/hyodo-kato-interface`.

For an arithmetic semistable descent 𝔛₀/O_K with perfect residue k₀, the W(k̄) specialization identifies with RΓ_logcrys(𝔛₀,k₀/W(k₀))⊗^L_{W(k₀)}W(k̄), where the arithmetic log base is ℕ→W(k₀), 1↦0. Use CR.6’s change-of-log-base and Hyodo–Kato identifications, Frobenius, monodromy Nφ=pφN and uniformizer-change maps. CK §9’s rational B_st comparison is assembled in CP.4, importing these maps rather than rebuilt here.

Additional hypotheses: 𝔛₀ has the CK arithmetic charts; base extension W(k₀)→W(k̄) is explicit; N is supplied on the descended Hyodo–Kato object, not asserted on AΩ itself.

Construction or proof:

1. Apply CK Proposition 5.44 to compare the rational-monoid and standard log-point cohomology.
2. Import CR.6’s HK/descent and Beilinson comparison as used by CK Proposition 9.2; hand off the rational assembly and filtration agreement (CK Theorem 9.5, Remark 9.6) to CP.4.

Acceptance:

- For k₀ finite, retain its nontrivial Witt Frobenius; a coefficient identity on W(k̄) alone is insufficient.
- The explicit rank-two F,N test in the suggested file satisfies Nφ=pφN with N≠0.

Direct prerequisites: `AInfCohomology:AI.6/global-crystalline`; `CrystallineCohomology:CR.5`; `CrystallineCohomology:CR.6`; `AInfCohomology:AI.0`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 5.44, Proposition 9.2, Theorem 9.5, pp.60–61,75–76.

#### Canonical semistable B_dR⁺ comparison map

**Semistable.bdrComparisonMap** — construction; node `AInfCohomology:AI.6/bdr-comparison-map`.

For proper 𝔛, use CP.3’s canonical B_dR⁺ crystalline/deformation complex RΓ_crys(X_C^ad/B_dR⁺) of its smooth proper generic fibre. The canonical all-coordinates PD/log maps after p-inversion and ξ-completion induce RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). Compose with global-crystalline to obtain the A_inf-to-B_dR⁺ map. This is a comparison to CP.3’s object, not its construction.

Additional hypotheses: 𝔛 proper; the generic fibre is smooth; completion of the rational period rings uses AI.0’s actual maps.

Construction or proof:

1. Import CP.3’s canonical generic deformation and its all-coordinates description.
2. Use CK Proposition 6.5, comparing the log PD maps from all-coordinates-map with the canonical generic lift and their log de Rham reductions.

Uses:

- **CK Theorem 6.6, Proposition 6.8, Theorem 8.7**: The exact B_dR⁺ lattice and agreement with the étale comparison determine the integral lattice.
- **CohomologyComparisons:CP.4**: Rational semistable assembly uses this canonical map and its reduction square.

API:

- **Semistable.bdrComparisonMap.reduce** (compatibility): Modulo ξ it agrees with log de Rham-to-generic-fibre de Rham and CP.3’s canonical deformation reduction.
- **Semistable.bdrComparisonMap.natural** (functoriality): Eligible proper model maps induce a commutative diagram with the canonical generic deformation maps.
- **Semistable.bdrComparisonMap.coefficients** (data): The map is induced by the common A_inf→A_cris→B_dR⁺ coefficient maps, not an arbitrary isomorphism of equal-rank modules.

Unit tests:

- **Semistable.bdrComparisonMap.point** (degenerate): For SpfO_C the map is the identity of B_dR⁺.
- **Semistable.bdrComparisonMap.good_reduction** (compatibility): For a proper smooth model the map agrees with AI.5 and CP.3’s good reduction B_dR⁺ comparison.
- **Semistable.bdrComparisonMap.node** (compatibility): On a node chart the logarithmic differential relation maps to dlogT₀+dlogT₁=0 on its smooth generic fibre.

Acceptance:

- This node requires the explicit CP.3→AI.6 link confirmed by RT-AREA-padic-2/13.

Direct prerequisites: `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/all-coordinates-map`; `AInfCohomology:AI.6/crystalline-de-rham-square`; `CohomologyComparisons:CP.3`; `AInfCohomology:AI.0:period-comparison`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 6.5, pp.63–64.

#### Semistable B_dR⁺ comparison

**Semistable.bdrComparison** — theorem; node `AInfCohomology:AI.6/bdr-comparison`.

For proper 𝔛, bdr-comparison-map is an equivalence RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺). In every degree it gives H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺≃H^i_crys(X_C^ad/B_dR⁺), a finite free B_dR⁺-module. Under reduction by ξ its comparison with generic de Rham agrees with log-de-rham and the source’s generic-fibre comparison.

Construction or proof:

1. Use CP.3 finite freeness and ξ-completeness of its canonical deformation.
2. Apply CK Theorem 6.6 to bdr-comparison-map, using its mod-ξ comparison and proper-perfectness; use the source Tor/freeness argument for the degreewise equality.

Acceptance:

- The complex comparison and the degreewise finite-free statement are both required.

Direct prerequisites: `AInfCohomology:AI.6/bdr-comparison-map`; `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/log-de-rham`; `CohomologyComparisons:CP.3`; `AInfCohomology:AI.5`; `EnhancedDerivedSheaves:E4/mod-ideal-detection`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 6.6, pp.64–65.

Planet: **Semistable B_dR⁺ comparison**.

#### Semistable étale specialization

**Semistable.etaleComparison** — theorem; node `AInfCohomology:AI.6/etale-comparison`.

For qcqs 𝔛, RΓ_Ainf(𝔛)[1/μ]≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf[1/μ], with the source’s derived p-completion where required. For proper 𝔛 the finite complex formula uses the ordinary derived tensor. It is natural, multiplicative and Frobenius compatible. It is generic-fibre p-adic étale cohomology, not special-fibre étale cohomology and not mere p-inversion.

Construction or proof:

1. Import AI.3’s period-sheaf μ-inverted étale comparison and its completed tensor convention.
2. Apply CK Theorem 2.3 to aomega; décalage is unchanged after μ-inversion, and proper-perfectness yields the proper global finite formula.

Acceptance:

- Replacing μ-inversion by p-inversion must fail the acceptance check.

Direct prerequisites: `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.3`; `AInfCohomology:AI.4`; `AInfCohomology:AI.0`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 2.3, pp.7–8.

#### Étale and B_dR comparison agreement

**Semistable.etaleBdrAgreement** — theorem; node `AInfCohomology:AI.6/etale-bdr-agreement`.

After base change to B_dR, the étale map from etale-comparison and the B_dR⁺ map from bdr-comparison agree with CP.3’s étale–de Rham comparison under its canonical generic deformation. For descended 𝔛₀/O_K this agrees with H_dR(X_K/K)⊗_KB_dR and its filtration using the canonical K→B_dR⁺ lift.

Construction or proof:

1. Track the all-coordinates period-sheaf maps through CK Proposition 6.8, including the rational local P8 comparison imported by CP.3.
2. Use bdr-comparison-map’s reduction compatibility and CP.3’s descent identification; no new rational local comparison is constructed.

Acceptance:

- Equality of these actual maps, rather than existence of some isomorphism, is the lattice input.

Direct prerequisites: `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.6/crystalline-de-rham-square`; `CohomologyComparisons:CP.3`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 6.8, pp.66–68.

#### Semistable cohomological BKF modules

**Semistable.cohomologicalBKF** — theorem; node `AInfCohomology:AI.6/cohomological-bkf`.

For proper 𝔛, each H^i_Ainf(𝔛) is finitely presented over A_inf and finite free after p-inversion, with the Frobenius isomorphism after ξ̃-inversion required by AI.2. If the special fibre is pure d-dimensional the module is zero outside 0,…,2d. These are finitely presented BKF modules, with possible p-torsion, not automatically finite free BKF lattices.

Construction or proof:

1. Use proper-perfectness and global-crystalline’s A_cris[1/p] freeness.
2. Apply the AI.5 linear-algebra criterion (BMS1 Proposition 4.20 as used in CK Theorem 7.4) and aomega-frobenius; import AI.2’s module definition.

Acceptance:

- A p-torsion cohomology module remains allowed; the finite-free Fargues classification is not applied to it.

Direct prerequisites: `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/aomega-frobenius`; `AInfCohomology:AI.5`; `AInfCohomology:AI.2`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 7.4 with proof, pp.68–69.

#### Degreewise semistable specialization sequences

**Semistable.degreewiseSpecializations** — theorem; node `AInfCohomology:AI.6/degreewise-specializations`.

For proper 𝔛 and every i, H_A^i⊗_{A_inf}W(C^♭)≃H_ét^i(X_C,Z_p)⊗_{Z_p}W(C^♭). There are natural exact sequences 0→H_A^i⊗_{θ}O_C→H_logdR^i→H_A^{i+1}[ξ]→0 and 0→H_A^i⊗W(k̄)→H_logcrys^i→Tor₁^{A_inf}(H_A^{i+1},W(k̄))→0. The W(k̄) cohomology uses hyodo-kato-interface’s log base normalization.

Construction or proof:

1. Use log-de-rham and global-crystalline with AI.5’s specialization/Tor exact sequences.
2. Apply CK Proposition 7.6 and the flat W(C^♭) étale specialization; retain the adjacent-degree terms rather than collapsing derived base change.

Acceptance:

- H_A^{i+1}[ξ] and Tor₁ must appear explicitly when no adjacent freeness is assumed.

Direct prerequisites: `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/hyodo-kato-interface`; `AInfCohomology:AI.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 7.6, pp.69–70.

#### One-degree semistable freeness criterion

**Semistable.freenessCriterion** — theorem; node `AInfCohomology:AI.6/freeness-criterion`.

For proper 𝔛 and fixed i, H_logdR^i(𝔛/O_C) is O_C-free iff H_logcrys^i(𝔛_{k̄}/W(k̄)) is W(k̄)-free. Under either condition H_A^i is A_inf-free and H_ét^i(X_C,Z_p) is Z_p-free. This alone does not remove the adjacent-degree terms from degreewise-specializations.

Construction or proof:

1. Apply CK Proposition 7.7 to degreewise-specializations and AI.5 torsion/freeness linear algebra.
2. Use the proper rank equality below and the source p-adic/ξ-adic Nakayama arguments, without assuming H_A^{i+1} free.

Acceptance:

- For full degree-i specialization identities additionally impose the required adjacent-degree freeness.

Direct prerequisites: `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/rank-equality`; `AInfCohomology:AI.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 7.7, pp.70–71.

#### Semistable cohomology rank equality

**Semistable.rankEquality** — theorem; node `AInfCohomology:AI.6/rank-equality`.

For proper 𝔛, the generic ranks of H_A^i, H_ét^i(X_C,Z_p), H_logdR^i and H_logcrys^i over A_inf, Z_p, O_C and W(k̄), respectively, are equal. Rank is computed after the relevant fraction-field or p-inverted free specialization; it does not assert equality of torsion.

Construction or proof:

1. Use etale-comparison, global-crystalline and bdr-comparison to identify the rational finite free ranks.
2. Apply CK Proposition 7.5 and AI.5 rank invariance under the indicated faithfully flat coefficient comparisons.

Acceptance:

- A torsion summand changes lengths while leaving these ranks unchanged.

Direct prerequisites: `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Proposition 7.5, p.69.

#### Étale–log crystalline torsion inequalities

**Semistable.crystallineTorsion** — theorem; node `AInfCohomology:AI.6/crystalline-torsion`.

For proper 𝔛, all i and n≥1, length_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤length_{W(k̄)}(H_logcrys^i(W(k̄))_tors/p^n), and length_{Z_p}H_ét^i(Z/p^n)≤length_{W(k̄)}H_logcrys^i(W_n(k̄)). These are length inequalities, not a canonical injection or a subquotient assertion.

Construction or proof:

1. Apply AI.5’s torsion comparison linear algebra to the actual semistable perfect complex and degreewise-specializations.
2. Use CK Theorem 7.9, including the finite-coefficient argument through two adjacent torsion groups and rank equality.

Acceptance:

- At n=1 distinguish torsion quotients from finite-coefficient cohomology.

Direct prerequisites: `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/rank-equality`; `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 7.9 with proof, pp.71–72.

#### Étale–log de Rham torsion inequalities

**Semistable.deRhamTorsion** — theorem; node `AInfCohomology:AI.6/de-rham-torsion`.

For proper 𝔛, all i and n≥1, v_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤v_{O_C}(H_logdR^i(O_C)_tors/p^n), and v_{Z_p}H_ét^i(Z/p^n)≤v_{O_C}H_logdR^i(O_C/p^n). Here v(p)=1 and v(⊕O_C/(a_j))=Σv(a_j); this normalized valuation length is not ordinary O_C-module length. Over O_K it is length_{O_K}/length_{O_K}(O_K/p).

Construction or proof:

1. Import AI.5’s generic valuation/Fitting-ideal length and integral Witt comparison from CK §§7.10–7.11.
2. Apply those inputs to degreewise-specializations and crystalline-torsion exactly as CK Theorem 7.12.

Acceptance:

- For O_K/(π), normalized length is 1/e, not 1 when e>1.

Direct prerequisites: `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/crystalline-torsion`; `AInfCohomology:AI.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §§7.10–7.11 and Theorem 7.12, pp.72–73.

#### Model-independent logarithmic de Rham lattice

**Semistable.modelIndependentLattice** — theorem; node `AInfCohomology:AI.6/model-independent-lattice`.

Let 𝔛₀/O_K be proper, flat, p-adic, with strict étale standard semistable charts ∏t_i=π′ for nonzero nonunits π′ allowed to depend on the chart, and its divisorial log structure. If H_logdR^i(𝔛₀/O_K) and H_logdR^{i+1}(𝔛₀/O_K) are both O_K-free, set T=H_ét^i(X_C,Z_p). AI.2’s G_K-equivariant Fargues module M(T) for (T,H_dR^i(X_K/K)⊗B_dR⁺) identifies with H_A^i(𝔛₀⊗̂O_C), and its invariant θ-lattice L_dR(T) equals H_logdR^i(𝔛₀/O_K) inside H_dR^i(X_K/K). Two models of the same generic fibre satisfying these hypotheses therefore give the same lattice.

Additional hypotheses: Both adjacent degrees i and i+1 are free; the invariant construction and its descent are imported from AI.2.

Construction or proof:

1. Use degreewise-specializations and freeness-criterion in both degrees to remove the ξ/Tor error terms.
2. Use bdr-comparison and etale-bdr-agreement to identify the actual G_K-equivariant Fargues pair.
3. Apply AI.2 equivariant classification/descent (CK §§8.5–8.6), CR.5 proper flat log de Rham base change and the invariant comparison as in CK Theorem 8.7.

Acceptance:

- Model independence is not asserted for arbitrary torsion models or for arbitrary torsion-free quotients.

Direct prerequisites: `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/freeness-criterion`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.6/etale-bdr-agreement`; `AInfCohomology:AI.2`; `CrystallineCohomology:CR.5`; `CohomologyComparisons:CP.3`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), Theorem 8.7 with proof and Remark 8.8, pp.73–75.

#### Nodal conic and good reduction model test

**Semistable.nodalConic** — application; node `AInfCohomology:AI.6/nodal-conic`.

For a uniformizer π of O_K, the proper conic 𝔛₀=Proj O_K[X,Y,Z]/(XY−πZ²), p-adically completed, is flat and semistable. Its special fibre is two projective lines meeting at one node; its generic fibre is a smooth rational curve. The log de Rham groups are O_K,0,O_K in degrees 0,1,2 and zero otherwise. Its A_inf groups are A_inf,0,A_inf{−1}, with the corresponding logarithmic/Witt specializations. The degree-0 and degree-2 lattices agree with a smooth P¹ model under a fixed generic-fibre identification, by model-independent-lattice. This nodal genus-zero example has N=0; the separate rank-two monodromy algebra test does not claim to be its H¹.

Construction or proof:

1. Check the node chart x y=π on Z≠0 and the two smooth charts at infinity using chart-ring/divisorial-log.
2. Compute log de Rham cohomology by proper semistable-curve normalization/Čech and trace calculations requested from CR.5 (G-CURVE).
3. Apply freeness-criterion, degreewise-specializations and AI.2 Tate-twist compatibility; apply model-independent-lattice in degrees 0 and 2 (degree 3 vanishes).

Acceptance:

- The H¹ group is zero despite the special-fibre node; no nonzero monodromy is inferred merely from singular reduction.

Direct prerequisites: `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/freeness-criterion`; `AInfCohomology:AI.6/model-independent-lattice`; `AInfCohomology:AI.2`; `CrystallineCohomology:CR.5`.

Source: [CK](https://arxiv.org/pdf/1710.06145v3), §1.5 charts; Proposition 7.7 and Theorem 8.7, pp.4–5,70–71,73–75.

### AInfCohomology:AI.7

#### Cohomological Breuil–Kisin coefficient maps

**CohomologicalBK.coefficientNormalization** — construction; node `AInfCohomology:AI.7/coefficient-normalization`.

On the R07.4 coefficient ring 𝔖, distinguish θ̃_𝔖:W(k₀)[[u]]→O_K, u↦π, from θ_𝔖=θ̃_𝔖∘φ_𝔖. Let g:𝔖^(−1)→A_inf be W(k₀)-linear with u↦[π^♭], and f=g∘φ_𝔖:𝔖→A_inf, acting by φ_W on coefficients and u↦[π^♭]^p. Then θ̃_A∘f=θ̃_𝔖, θ_A∘f=θ_𝔖, f(E) generates (ξ̃), and the cohomological crystalline map is c=φ_W∘constantCoeff:𝔖→W(k₀). These maps use the existing rings, rather than new coefficient constants.

Construction or proof:

1. Import R07.4/bk-coefficient-rings and AI.0 Witt/θ maps.
2. Compute the composite maps on coefficients and u using BMS1 §4.4 and BMS2 Notation 11.1; use E’s kernel to identify f(E).

Uses:

- **BMS2 Theorems 1.2 and 11.2**: All three specializations have these Frobenius-normalized coefficient maps.
- **HabiroCohomologyFoundations:HQ.8**: The comparison diagram must preserve θ versus θ̃ and the Frobenius twist.

API:

- **CohomologicalBK.coefficientNormalization.frobenius** (simp): For any coefficient endomorphism F and p>0, the power-series map is Σa_nu^n↦ΣF(a_n)u^{pn}; it sends C(a) to C(F(a)) and u to u^p.
- **CohomologicalBK.coefficientNormalization.theta** (compatibility): The two displayed θ-squares commute; θ_𝔖(u)=π^p whereas θ̃_𝔖(u)=π.
- **CohomologicalBK.coefficientNormalization.crystalline** (simp): The normalized residue map is F∘constantCoeff: C(a)↦F(a), u↦0, and c∘φ_𝔖=φ_W∘c.
- **CohomologicalBK.coefficientNormalization.eisenstein** (relation): f(E) generates kerθ̃_A=(ξ̃); g(E) generates kerθ_A=(ξ).

Unit tests:

- **CohomologicalBK.coefficientNormalization.variable** (computation): At p=2, the map with coefficient identity sends u to u².
- **CohomologicalBK.coefficientNormalization.twisted_constant** (computation): For arbitrary F, the normalized residue of C(a) is F(a), not a.
- **CohomologicalBK.coefficientNormalization.constant_identity** (compatibility): At F=id, c is exactly Mathlib PowerSeries.constantCoeff.
- **CohomologicalBK.coefficientNormalization.nonsurjective** (non-example): Over Z with p=2, the coefficient of u in every image of φ is zero, so u is not an image.

Acceptance:

- On k₀=F_{p²}, c on a Teichmüller coefficient is [a^p], which differs from [a] for a∉F_p.
- φ_𝔖 is an endomorphism and is not surjective onto u.

Direct prerequisites: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`; `AInfCohomology:AI.0`; `mathlib:PowerSeries.map`; `mathlib:PowerSeries.substAlgHom`; `mathlib:PowerSeries.constantCoeff`; `mathlib:WittVector.frobenius`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS1 §4.4, pp.280–281; BMS2 Notation 11.1, p.298.

Planet: **Breuil–Kisin coefficient normalization**.

#### Flat Breuil–Kisin to A_inf extension

**CohomologicalBK.flatCoefficientExtension** — theorem; node `AInfCohomology:AI.7/flat-coefficient-extension`.

The normalized map f:𝔖→A_inf is faithfully flat and topologically free as in BMS2 Notation 11.1. In particular M⊗^L_𝔖 A_inf is concentrated in degree 0 for every 𝔖-module M, and equality/equivalence of 𝔖-linear maps can be detected after this extension.

Construction or proof:

1. Apply BMS1 Lemma 4.30: finite modules over the regular noetherian 𝔖 are perfect; Artin–Rees reduces p-complete flatness to the DVR map k₀[[u]]→O_C^♭, which is torsion-free.
2. Use the faithful/topologically free strengthening recorded in BMS2 Notation 11.1; tensor detection is imported from the shared enhanced descent interface.

Acceptance:

- Derived A_inf base change cannot silently be treated as flat until this node is available.

Direct prerequisites: `AInfCohomology:AI.7/coefficient-normalization`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `AInfCohomology:AI.5`; `EnhancedDerivedSheaves:E1`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS1 Lemma 4.30 with proof, p.281; BMS2 Notation 11.1, p.298.

#### Cohomological Breuil–Kisin complex

**CohomologicalBK.cohomology** — construction; node `AInfCohomology:AI.7/cohomology`.

For smooth p-adic 𝔛/O_K, use the existing bounded nonperfect prism (𝔖,(E)) and define RΓ_𝔖(𝔛) to be PR.1’s relative prismatic RΓ_Δ(𝔛/𝔖). On affines write D_𝔖(R)=Δ_{R/𝔖}. It is a (p,E)-complete, equivalently (p,u)-complete, multiplicative complex with φ_𝔖-semilinear Frobenius whose linearization is an equivalence after E-inversion. The geometric application imports the site, Frobenius and relative cohomology rather than defining them again.

Additional hypotheses: Smoothness is required here; the semistable complex of AI.6 is not obtained by applying this ordinary relative site to singular models.

Construction or proof:

1. Apply PR.0/breuil-kisin-prism and PR.1/relative-prismatic-cohomology to the fixed uniformizer quotient θ̃_𝔖.
2. Use PR.3’s Frobenius-image theorem and the sheaf/global comparison; compare to BMS2 by trace-prismatic-agreement below.

Uses:

- **BMS2 Theorem 1.2 and BS22 Example 1.9(3)**: This is the geometric cohomology functor, distinct from R07.4’s classification of representations/groups.
- **HabiroCohomologyFoundations:HQ.8**: The same functor enters the cross-theory comparison diagram.

API:

- **CohomologicalBK.cohomology.affine** (characterisation): For SpfR, the object is precisely Δ_{R/𝔖} in the shared enhancement.
- **CohomologicalBK.cohomology.functorial** (functoriality): Pullback on eligible smooth formal schemes gives contravariant maps preserving products, with identity/composition.
- **CohomologicalBK.cohomology.frobenius** (structure): The linearized φ_𝔖^*D→D is the imported prismatic Frobenius and becomes an isomorphism after E-inversion.
- **CohomologicalBK.cohomology.global** (compatibility): On qcqs formal schemes the local complex sheafifies and its global sections are PR.1’s relative RΓ_Δ.

Unit tests:

- **CohomologicalBK.cohomology.point** (degenerate): For SpfO_K the complex is 𝔖 in degree 0 with φ_𝔖.
- **CohomologicalBK.cohomology.polynomial** (compatibility): For O_K⟨t⟩ its Hodge–Tate reduction has H⁰=O_K⟨t⟩ and H¹=Ω¹{−1}; the Frobenius-twisted de Rham reduction carries the actual derivative dt.
- **CohomologicalBK.cohomology.torus** (compatibility): For O_K⟨t^{±1}⟩ the degree-one de Rham differential is dlogt and its integral coefficients are retained.

Acceptance:

- The theory depends on the chosen 𝔖-prism; canonical choice comparison is only asserted after the specified transport.

Direct prerequisites: `PrismaticCohomology:PR.0/breuil-kisin-prism`; `PrismaticCohomology:PR.1/relative-prismatic-cohomology`; `PrismaticCohomology:PR.3/leta-frobenius-factorisation`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `AInfCohomology:AI.7/coefficient-normalization`.

Source: [BS22](https://arxiv.org/pdf/1905.08229v4), BS22 Example 1.9(3), Theorem 1.8; BMS2 Theorem 11.2.

Planet: **Breuil–Kisin cohomology**.

#### Frobenius-twisted relative trace complex

**CohomologicalBK.twistedTrace** — construction; node `AInfCohomology:AI.7/twisted-trace`.

For a p-completely smooth O_K-algebra R, let 𝔖^(−1) be the copy of 𝔖 containing 𝔖 via φ_𝔖 and embedded in A_inf by g. Define D̂_tw(R)=gr⁰TC⁻(R/𝕊[z];Z_p)≃gr⁰TP(R/𝕊[z];Z_p), by unfolding π₀ from the quasiregular semiperfectoid site as in BMS2 §§11.1–11.2. It is a (p,u)-complete E∞-𝔖^(−1)-algebra; its Frobenius linearization is invertible after φ(E)-inversion. RT.6 supplies the relative spectra, filtration, unfolding and coefficient computations.

Additional hypotheses: 𝕊[z] is the sphere-spectrum monoid algebra; the Bott class b of degree 2 is distinct from the coefficient variable u.

Construction or proof:

1. Import RT.6’s relative THH/TC⁻/TP computation and its quasisyntomic descent, using the map z↦π.
2. Apply BMS2 Corollary 11.12; do not replace relative TC⁻ by absolute TC⁻ or gr⁰ by a raw π₀ on smooth algebras.

Uses:

- **BMS2 Proposition 11.15 and proof of Theorem 11.2**: The twisted trace complex descends only after Bott inversion and the cyclotomic map.

API:

- **CohomologicalBK.twistedTrace.coefficients** (compatibility): For R=O_K, π_*TC⁻=𝔖^(−1)[b,v]/(bv−E), π_*TP=𝔖^(−1)[σ^{±1}], can(b)=Eσ and cyclotomic φ(b)=σ.
- **CohomologicalBK.twistedTrace.specializations** (equivalence): Along g it is AΩ_{R⊗̂O_C}; along u↦π with untwisted coefficients it is completed de Rham; along constantCoeff it is crystalline cohomology.
- **CohomologicalBK.twistedTrace.frobenius** (structure): Its linearized Frobenius is invertible after φ(E), matching Corollary 11.12(4).

Unit tests:

- **CohomologicalBK.twistedTrace.point** (degenerate): For O_K the gr⁰ complex is 𝔖^(−1) in degree 0.
- **CohomologicalBK.twistedTrace.bott** (computation): On O_K the cyclotomic map takes the Bott class b to σ, which is invertible in TP; can takes b to Eσ.
- **CohomologicalBK.twistedTrace.relative** (non-example): Absolute TC⁻(O_K) is not substituted: its coefficient base lacks the relative 𝔖^(−1) variable and the displayed relative Bott relation.

Acceptance:

- The missing relative-base symbol in the proof display is corrected by source issue AInfCohomology/E-AI6-2.

Direct prerequisites: `RefinedTraceMethods:RT.6`; `AInfCohomology:AI.7/coefficient-normalization`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E1`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Corollary 11.12 and Proposition 11.11, pp.303–304.

Planet: **Frobenius-twisted trace complex**.

#### Bott-inverted Breuil–Kisin descent

**CohomologicalBK.traceDescent** — theorem; node `AInfCohomology:AI.7/trace-descent`.

D_𝔖^tr(R)=gr⁰(TC⁻(R/𝕊[z];Z_p)[1/b]), unfolded from the quasiregular semiperfectoid site, has φ_𝔖^*D_𝔖^tr≃D̂_tw. The cyclotomic Frobenius extends over b-inversion and z^{1/p}; for p-completed smooth R the resulting map to gr⁰TP is an equivalence. The descent Frobenius is the composite D̂_tw≃gr⁰TP≃gr⁰TC⁻→gr⁰TC⁻[1/b], and is invertible after E-inversion.

Construction or proof:

1. Use RT.6’s evenness, acyclicity and cyclotomic extension in BMS2 Proposition 11.15; the source’s Segal input Corollary 8.18 belongs to RT.6.
2. Apply the unfolding/descent of the proof of Theorem 11.2, retaining its relative base and its canonical Frobenius composite.

Acceptance:

- Invert the degree-two Bott class b (source notation u), not the coefficient variable z (our u).

Direct prerequisites: `AInfCohomology:AI.7/twisted-trace`; `RefinedTraceMethods:RT.6`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `AInfCohomology:AI.1`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 11.15 and proof of Theorem 11.2, pp.305–306.

Planet: **Breuil–Kisin Frobenius descent**.

#### Trace and prismatic Breuil–Kisin agreement

**CohomologicalBK.tracePrismaticAgreement** — theorem; node `AInfCohomology:AI.7/trace-prismatic-agreement`.

For p-completely smooth R/O_K there is a natural Frobenius-equivariant multiplicative equivalence D_𝔖^tr(R)≃D_𝔖(R)=Δ_{R/𝔖}, compatible with the specified A_inf, de Rham and crystalline maps. It sheafifies and globalizes for qcqs 𝔛. The proof uses the relative THH/prismatic bridge of RT.6 and the relative-prismatic Nygaard comparison from PR.3; BS22 §18’s perfect-prism uniqueness is used only after A_inf extension with the Hodge–Tate structure map checked.

Construction or proof:

1. Import the actual relative comparison from RT.6 and PR.3, including BS22 §15’s Breuil–Kisin specialization; it is not derived from the mere existence of two perfect complexes.
2. After flat-coefficient-extension, identify both comparisons with the PR.6 AΩ map and check their Hodge–Tate structure maps on polynomial/torus charts.
3. Use PR.6/comparison-uniqueness over the perfect A_inf prism, then faithful-flat descent of compatible maps; do not apply perfect-prism uniqueness to nonperfect 𝔖.

Acceptance:

- The supplier request includes compatibility of the actual maps and descent data; bare scalar-extension equivalences are insufficient.

Direct prerequisites: `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/trace-descent`; `AInfCohomology:AI.7/flat-coefficient-extension`; `RefinedTraceMethods:RT.6`; `PrismaticCohomology:PR.3`; `PrismaticCohomology:PR.6/ainf-omega-comparison`; `PrismaticCohomology:PR.6/comparison-uniqueness`; `EnhancedDerivedSheaves:E1`.

Source: [BS22](https://arxiv.org/pdf/1905.08229v4), BS22 Example 1.9(3), §15 and §18; BMS2 Theorem 11.2.

#### Breuil–Kisin A_inf base change

**CohomologicalBK.ainfBaseChange** — theorem; node `AInfCohomology:AI.7/ainf-base-change`.

For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), where f uses Witt Frobenius and [π^♭]^p. Prismatic base change targets (A_inf,(ξ̃)), and PR.6 identifies its result with φ_A^*Δ_{𝔛_C/(A_inf,(ξ))}≃AΩ. For proper 𝔛 the ordinary derived tensor suffices; all maps are multiplicative and Frobenius compatible.

Construction or proof:

1. Use PR.1/prismatic-base-change for the normalized map f into the ξ̃-prism.
2. Use PR.6/ainf-omega-comparison and its θ/θ̃ square, then AI.5’s proper global/perfect base-change interface.

Acceptance:

- Replacing f by g without twisting the cohomology would give Δ rather than AΩ.

Direct prerequisites: `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/coefficient-normalization`; `PrismaticCohomology:PR.1/prismatic-base-change`; `PrismaticCohomology:PR.6/ainf-omega-comparison`; `PrismaticCohomology:PR.6/theta-theta-tilde-square`; `AInfCohomology:AI.5`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Theorems 1.2(1), 11.2(1); BS22 Example 1.9(2)–(3).

Planet: **Breuil–Kisin A_inf comparison**.

#### Frobenius-twisted Breuil–Kisin de Rham map

**CohomologicalBK.deRhamBaseChange** — theorem; node `AInfCohomology:AI.7/de-rham-base-change`.

For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K), where θ_𝔖=θ̃_𝔖∘φ_𝔖 acts by φ_W on coefficients and u↦π^p. Properness removes the extra completion. Under A_inf extension this is exactly AI.5’s θ specialization, including its differential and cup product.

Construction or proof:

1. Apply PR.3/de-rham-comparison-general to the prism (𝔖,(E)); its composite coefficient map is θ_𝔖.
2. Use coefficient-normalization’s θ square and comparison-diagram-agreement for agreement with the earlier AΩ map.

Acceptance:

- The untwisted quotient u↦π is the Hodge–Tate coefficient map for the prism, not this de Rham map.

Direct prerequisites: `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/coefficient-normalization`; `PrismaticCohomology:PR.3/de-rham-comparison-general`; `PrismaticCohomology:PR.6/theta-theta-tilde-square`; `AInfCohomology:AI.5`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Theorems 1.2(2), 11.2(2); BS22 Theorem 1.8(3).

#### Frobenius-normalized Witt specialization

**CohomologicalBK.crystallineBaseChange** — theorem; node `AInfCohomology:AI.7/crystalline-base-change`.

For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,c}W(k₀)≃RΓ_crys(𝔛_{k₀}/W(k₀)), where c=φ_W∘constantCoeff. Properness removes the extra completion. This is Frobenius equivariant and agrees with AI.5’s W(k̄) comparison after W(k₀)→W(k̄). The φ_W factor is the crystalline comparison’s Frobenius pullback, not a dispensable coordinate choice.

Construction or proof:

1. First use PR.1/prismatic-base-change along constantCoeff to the crystalline prism (W(k₀),(p)).
2. Then apply PR.1/crystalline-comparison’s φ_W pullback, giving the composite c; use trace-prismatic-agreement and polynomial/torus map checks for agreement with the actual AΩ crystalline map.

Acceptance:

- A coefficient in F_{p²} detects the missing φ_W, even though k₀=F_p hides it.

Direct prerequisites: `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/coefficient-normalization`; `PrismaticCohomology:PR.1/prismatic-base-change`; `PrismaticCohomology:PR.1/crystalline-comparison`; `AInfCohomology:AI.7/trace-prismatic-agreement`; `AInfCohomology:AI.5`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Theorems 1.2(3), 11.2(3); BS22 Theorem 1.8(1).

#### Perfect complex and cohomological Breuil–Kisin modules

**CohomologicalBK.perfectCohomologicalModules** — theorem; node `AInfCohomology:AI.7/perfect-cohomological-modules`.

For proper smooth 𝔛/O_K, RΓ_𝔖 is perfect, and every H^i_𝔖 is a finitely generated 𝔖-module with an isomorphism (φ_𝔖^*H^i_𝔖)[1/E]≃H^i_𝔖[1/E]. These are the broad cohomological Breuil–Kisin modules of BMS2 Definition 1.1, potentially with p-torsion. They are not assigned the finite-free Kisin-module classification of R07.4. Their A_inf extension is H^i_Ainf by flatness.

Construction or proof:

1. Use ainf-base-change and AI.5 perfectness with faithful-flat perfect descent.
2. Use noetherianness of 𝔖 and flatness of φ_𝔖 (finite free of rank p) to pass Frobenius to cohomology; apply BMS2 Theorem 1.2(1).

Acceptance:

- The perfect complex [𝔖→ᵖ𝔖] has H¹=𝔖/p and is an explicit counterexample to perfect implies free cohomology.

Direct prerequisites: `AInfCohomology:AI.7/ainf-base-change`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.5`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `EnhancedDerivedSheaves:E1`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Definition 1.1, Theorem 1.2(1), pp.201–202.

#### Exact cohomological BK to BKF tensor functor

**CohomologicalBK.bkfTensorFunctor** — theorem; node `AInfCohomology:AI.7/bkf-tensor-functor`.

For the broad category of finitely presented 𝔖-modules M with (φ_𝔖^*M)[1/E]≃M[1/E], extension M↦M⊗_{𝔖,f}A_inf is an exact symmetric monoidal functor to AI.2’s finitely presented BKF modules. R07.4 supplies BMS1 Proposition 4.3 that M[1/p] is free; f(E) generates ξ̃. This identifies the Frobenius structure on H^i_𝔖⊗A_inf with the earlier cohomological BKF module.

Construction or proof:

1. Import the broad-module finite-generation/p-inverted-freeness input from R07.4, which its current finite-free module node alone does not supply.
2. Apply BMS1 Proposition 4.32, using flat-coefficient-extension, coefficient-normalization and AI.2’s ξ̃-linearized presentation; specialize to perfect-cohomological-modules.

Acceptance:

- Exactness is scalar extension, not a claim that Kisin’s representation-to-lattice functor is exact.

Direct prerequisites: `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/coefficient-normalization`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `AInfCohomology:AI.2`.

Source: [BMS1](https://www.numdam.org/item/10.1007/s10240-019-00102-z.pdf), BMS1 Proposition 4.32 with proof, p.281.

#### Breuil–Kisin twist base change

**CohomologicalBK.twistCompatibility** — theorem; node `AInfCohomology:AI.7/twist-compatibility`.

The imported 𝔖{1} has 𝔖{1}⊗_{𝔖,f}A_inf≃A_inf{1} as BKF objects, compatibly with φ and the G_{K∞} action; tensor powers and dual twists are preserved. R07.4 owns the representation classification identifying Z_p(1) with 𝔖{1}; AI.0/AI.2 own the A_inf twist and étale realization.

Construction or proof:

1. Use the cotangent/twist comparison from R07.4 and AI.0 in BMS1 Corollary 4.33.
2. Apply bkf-tensor-functor and AI.2 Tate realization; no second twist or classification is constructed.

Acceptance:

- The inverse twist recovers H² of P¹, while the unit twist gives degree-zero coefficients.

Direct prerequisites: `AInfCohomology:AI.7/bkf-tensor-functor`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `AInfCohomology:AI.0`; `AInfCohomology:AI.2`.

Source: [BMS1](https://www.numdam.org/item/10.1007/s10240-019-00102-z.pdf), BMS1 Corollary 4.33 with proof, pp.281–282.

#### Breuil–Kisin Frobenius décalage identity

**CohomologicalBK.frobeniusDecalage** — theorem; node `AInfCohomology:AI.7/frobenius-decalage`.

For p-completely smooth R/O_K, the Frobenius factors canonically as φ_𝔖^*D_𝔖(R)≃Lη_E D_𝔖(R)→D_𝔖(R). Under trace-prismatic-agreement this is BMS2 Remark 11.17’s Beilinson connective cover map from the Nygaard filtration of D̂_tw to the E-adic filtration of D_𝔖. It does not assert a Nygaard filtration on D_𝔖 itself.

Construction or proof:

1. Import PR.3/leta-frobenius-factorisation and AI.1’s filtered décalage/Beilinson connective cover (BMS2 Proposition 5.8).
2. Use RT.6’s filtered relative trace map, then trace-prismatic-agreement and the topologically free A_inf check as in Remark 11.17.

Acceptance:

- The canonical inclusion after décalage is part of the identity, not merely an isomorphism of underlying graded modules.

Direct prerequisites: `AInfCohomology:AI.7/trace-prismatic-agreement`; `AInfCohomology:AI.7/twisted-trace`; `PrismaticCohomology:PR.3/leta-frobenius-factorisation`; `AInfCohomology:AI.1`; `RefinedTraceMethods:RT.6`; `AInfCohomology:AI.7/flat-coefficient-extension`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Remark 11.17, pp.307–308.

#### Nygaard filtration non-descent test

**CohomologicalBK.nygaardNonDescent** — theorem; node `AInfCohomology:AI.7/nygaard-nondescent`.

The Nygaard filtration on φ_𝔖^*D_𝔖≃D̂_tw has no functorial descent along φ_𝔖 to a filtration on D_𝔖 with the same degree-zero projection. Such a descent would canonically descend every smooth formal O_K-scheme to W(k₀)[π^p]. A good reduction elliptic curve with j∈O_K∖W(k₀)[π^p] contradicts it.

Additional hypotheses: The negative statement is about functorial descent of the filtration/projection; it does not prohibit accidental descents for individual objects.

Construction or proof:

1. Use BMS2 Remark 11.16’s degree-zero Nygaard projection and its implied canonical scheme descent.
2. Choose p≥5, K=Q_p(p^{1/p}) and j=c+π with j and j−1728 units; the standard elliptic Weierstrass equation has good reduction and this j is not in Z_p.

Acceptance:

- The example detects a wrong API asserting that the Nygaard filtration descends merely because the complex does.

Direct prerequisites: `AInfCohomology:AI.7/twisted-trace`; `AInfCohomology:AI.7/trace-descent`; `AInfCohomology:AI.7/coefficient-normalization`; `RefinedTraceMethods:RT.6`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Remark 11.16, p.307.

#### Uniformizer-choice transport after A_inf extension

**CohomologicalBK.choiceTransport** — construction; node `AInfCohomology:AI.7/choice-transport`.

For two choices (π,π^♭) and (π′,π′^♭), extend their respective 𝔖-valued complexes along the normalized maps f,f′ to the same A_inf. Define the transport as the first ainf-base-change equivalence followed by the inverse of the second, through the intrinsic AΩ complex. It preserves products, Frobenius and the comparison diagram, and satisfies identity/cocycle. An A_inf morphism descends to either 𝔖 only when it respects that map’s faithful-flat Čech descent datum; no 𝔖-linear identification of unrelated coefficient rings is asserted.

Construction or proof:

1. Use the intrinsic AI.3/AI.5 functor and ainf-base-change for both choices.
2. Compose those canonical equivalences and use their naturality; import the faithful-flat descent criterion from E5:abstract to state exactly when a morphism comes from a given coefficient ring.

Uses:

- **AI.7 acceptance and HabiroCohomologyFoundations:HQ.8**: Consumers need the canonical shared comparison diagram without pretending the uniformizer was never chosen.

API:

- **CohomologicalBK.choiceTransport.identity** (simp): Transport for the same choice is the identity under its fixed comparison.
- **CohomologicalBK.choiceTransport.cocycle** (functoriality): For three choices transport₍₂₃₎∘transport₍₁₂₎=transport₍₁₃₎.
- **CohomologicalBK.choiceTransport.descend** (characterisation): For a fixed f, a morphism between the extended objects comes from 𝔖 precisely when it commutes with the induced faithful-flat Čech descent datum.

Unit tests:

- **CohomologicalBK.choiceTransport.point** (degenerate): For SpfO_K every extension identifies with A_inf and the transport is its identity.
- **CohomologicalBK.choiceTransport.root_change** (compatibility): Replacing π^♭ by another compatible system gives the same intrinsic AΩ after the displayed common extension and its canonical transport.
- **CohomologicalBK.choiceTransport.different_uniformizers** (non-example): Transport does not identify the two source variables in 𝔖 without a coefficient map; f(u) and f′(u) need not agree.

Acceptance:

- Choice-independent transport is on the common A_inf extension; the unextended rings have explicitly different maps u↦[π^♭]^p.

Direct prerequisites: `AInfCohomology:AI.7/ainf-base-change`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.3`; `AInfCohomology:AI.5`; `EnhancedDerivedSheaves:E1`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Notation 11.1 and Theorem 11.2(1); BS22 §18.

#### Agreement of smooth comparison maps

**CohomologicalBK.comparisonDiagramAgreement** — theorem; node `AInfCohomology:AI.7/comparison-diagram-agreement`.

For p-completely smooth R/O_C, import AΩ_R≃φ_A^*Δ_{R/(A_inf,kerθ)} from PR.6. The induced θ̃ Hodge–Tate map agrees with the actual map R→H⁰ and its log-free polynomial/torus Kummer differential maps; the Bockstein gives the same θ de Rham map as AI.4. The crystalline, étale and B_dR⁺ maps of AI.4–AI.5 and the Breuil–Kisin/trace maps agree under these identified functors and common coefficient maps. The crystalline agreement is checked on the same PD/Koszul generators; uniqueness of the A_inf functor alone is not claimed to prove it.

Additional hypotheses: Smooth R, not the singular semistable models of AI.6; the prism for §18 uniqueness is perfect, and the Hodge–Tate structure transformation η is part of the comparison datum.

Construction or proof:

1. Use PR.6/theta-theta-tilde-square and check η on O_C⟨t⟩ and O_C⟨t^{±1}⟩, including dt/dlogt and the Bockstein differential.
2. Apply PR.6/comparison-uniqueness over the perfect A_inf prism; Frobenius compatibility is not an extra hypothesis of that uniqueness theorem.
3. Use PR.1 crystalline/base change, AI.4’s actual PD maps and the RT.6 relative map to check crystalline generators; AI.5/CP.3 supplies the generic étale/B_dR square. Globalize through E1 descent.

Acceptance:

- On a torus, θ̃ H⁰ is R, whereas the θ de Rham H⁰ is O_C; the tests detect the omitted φ_A twist.
- The polynomial test checks dt, and the torus test checks dlogt; checking H⁰ alone is insufficient.

Direct prerequisites: `PrismaticCohomology:PR.6/ainf-omega-comparison`; `PrismaticCohomology:PR.6/theta-theta-tilde-square`; `PrismaticCohomology:PR.6/comparison-uniqueness`; `PrismaticCohomology:PR.1/crystalline-comparison`; `PrismaticCohomology:PR.1/prismatic-base-change`; `AInfCohomology:AI.4`; `AInfCohomology:AI.5`; `CohomologyComparisons:CP.3`; `RefinedTraceMethods:RT.6`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [BS22](https://arxiv.org/pdf/1905.08229v4), BS22 Theorem 17.2, Remark 17.3, Theorem 18.2 and proof, pp.119–123.

Planet: **Comparison-map agreement**.

#### De Rham torsion divisibility constraint

**CohomologicalBK.deRhamTorsionDivisibility** — application; node `AInfCohomology:AI.7/de-rham-torsion-divisibility`.

Let K=Q_p(p^{1/p}) with uniformizer π=p^{1/p} and 𝔛/O_K proper smooth. The map θ_𝔖 has u↦π^p=p and factors through Z_p. Therefore RΓ_dR(𝔛/O_K) is the scalar extension of a perfect Z_p-complex. Each cyclic indecomposable summand of H^i_dR(𝔛/O_K)_tors has O_K-length divisible by p; equivalently it is O_K/(π^{pa}) for some a≥1. The total torsion length is a multiple of p.

Construction or proof:

1. Use de-rham-base-change and the coefficient-normalization map; take RΓ_𝔖⊗^L_{u↦p}Z_p.
2. Use O_K finite free of ramification degree p over Z_p, so cohomology commutes with this extension. Apply the DVR structure theorem supplied by AI.5: Z_p/(p^a) extends to O_K/(π^{pa}).

Acceptance:

- For p=3 a cyclic summand of length 1 or 2 is excluded, while length 3a is allowed.
- This is a geometric constraint, not a claim that an arbitrary O_K-complex has divisible torsion length.

Direct prerequisites: `AInfCohomology:AI.7/de-rham-base-change`; `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.5`.

Source: [BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), BMS2 Remark 1.4, p.202.

## Supplier requests and closure

The following requests name precisely the mathematics consumed by these declarations. Exact fine-node imports are retained in the register; requests cover additional statements that those nodes do not supply.

### AInfCohomology:AI.0

Actual A_inf(R_∞), θ/θ̃, μ, ξ/ξ̃, W(k₀)→W(k̄), twists, completeness and nonzerodivisor interfaces with these conventions; the semistable tower values and compatible roots are included.

Consumers: `AInfCohomology:AI.6/monomial-splitting`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.6/aomega-frobenius`; `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.6/crystalline-de-rham-square`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/hyodo-kato-interface`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.7/twist-compatibility`.

### AInfCohomology:AI.0:period-comparison

The common A_inf→A_cris→B_dR⁺ maps, ξ-adic completion after p-inversion and the canonical K→B_dR⁺ lift, using the existing period rings.

Consumers: `AInfCohomology:AI.6/bdr-comparison-map`.

### AInfCohomology:AI.1

The exact almost-to-integral/base-change criterion for Lη_μ, completed continuous Koszul cochains, and the filtered Beilinson connective-cover form of BMS2 Proposition 5.8; no unrestricted completion or tensor commutation.

Consumers: `AInfCohomology:AI.6/nonintegral-annihilation`; `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.6/log-derivations`; `AInfCohomology:AI.6/local-crystalline`; `AInfCohomology:AI.6/all-coordinates-aomega`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `AInfCohomology:AI.7/trace-descent`; `AInfCohomology:AI.7/frobenius-decalage`.

### AInfCohomology:AI.2

Finitely presented BKF modules in the ξ̃-linearized convention; finite-free Fargues classification with continuous G_K action; CK §§8.5–8.6 equivariant pair (T,D_dR(T)⊗B_dR⁺), its θ-lattice/invariants and Tate-twist compatibility. No classification for arbitrary torsion BKF objects.

Consumers: `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/model-independent-lattice`; `AInfCohomology:AI.6/nodal-conic`; `AInfCohomology:AI.7/bkf-tensor-functor`; `AInfCohomology:AI.7/twist-compatibility`.

### AInfCohomology:AI.3

Shared actual integral period sheaf, eligible ν/site maps, toric perfectoid covers and their continuous-cochain/almost-purity maps; complete formally étale A_inf lifting used by CK §§3.14–3.16. Smooth objects are imported and only the CK chart extension is owned here.

Consumers: `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/monomial-splitting`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.6/nonintegral-annihilation`; `AInfCohomology:AI.6/local-edge`; `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.7/choice-transport`.

### AInfCohomology:AI.4

The already constructed smooth θ/θ̃, A_cris/PD all-coordinates and generic étale maps, including generator formulas and their multiplicative Bockstein compatibility, for the AI.7 map-agreement proof.

Consumers: `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.7/comparison-diagram-agreement`.

### AInfCohomology:AI.5

Generic proper perfectness, derived Nakayama, finite presentation/BKF criterion, Tor exact sequences and torsion/freeness/rank linear algebra. Also CK §§7.10–7.11 normalized valuation/Fitting lengths and integral Witt inequality, plus DVR elementary divisors for the AI.7 torsion constraint.

Consumers: `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/freeness-criterion`; `AInfCohomology:AI.6/rank-equality`; `AInfCohomology:AI.6/crystalline-torsion`; `AInfCohomology:AI.6/de-rham-torsion`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/ainf-base-change`; `AInfCohomology:AI.7/de-rham-base-change`; `AInfCohomology:AI.7/crystalline-base-change`; `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/choice-transport`; `AInfCohomology:AI.7/comparison-diagram-agreement`; `AInfCohomology:AI.7/de-rham-torsion-divisibility`.

### CohomologyComparisons:CP.3

The canonical B_dR⁺ crystalline/deformation complex for any smooth proper analytic generic fibre, its multiplicative functorial all-coordinates model, ξ-reduction to generic de Rham, finite freeness, descended K→B_dR⁺ identification and actual étale comparison. The current good-reduction node alone does not supply CK Proposition 6.5/Theorem 6.6 for a semistable model.

Consumers: `AInfCohomology:AI.6/bdr-comparison-map`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.6/etale-bdr-agreement`; `AInfCohomology:AI.6/model-independent-lattice`; `AInfCohomology:AI.7/comparison-diagram-agreement`.

### CrystallineCohomology:CR.0

Universal ordinary PD envelopes compatible with (Z_p,p), A_cris^0 and its p-completion; CK finite approximants A_cris^(m), m≥p, and their completed colimits. Mathlib DividedPowerAlgebra alone does not provide these envelopes.

Consumers: `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates-map`.

### CrystallineCohomology:CR.5

Actual log crystalline sites and completed envelopes for exactified immersions; log PD Poincaré, lifting of p-divisible log maps, proper finiteness/base change and de Rham specialization. Include the explicit nodal-conic log Čech/trace computation G-CURVE; do not assume p-torsion-freeness of the all-coordinates envelope.

Consumers: `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/log-derivations`; `AInfCohomology:AI.6/local-crystalline`; `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/log-exactification`; `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `AInfCohomology:AI.6/all-coordinates-map`; `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.6/crystalline-de-rham-square`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/hyodo-kato-interface`; `AInfCohomology:AI.6/model-independent-lattice`; `AInfCohomology:AI.6/nodal-conic`.

### CrystallineCohomology:CR.5:log-algebra

Associated integral/quasi-coherent log structures, pushout charts with non-fine valuation base, strict pullbacks, exactification charts and log-étale criteria, including CK §1.6 and §§5.25–5.27 conventions.

Consumers: `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.6/log-exactification`.

### CrystallineCohomology:CR.6

Change from the Q≥0 log point to the standard ℕ log point in CK Proposition 5.44; W(k₀)→W(k̄) descent, Hyodo–Kato Frobenius/monodromy Nφ=pφN, uniformizer-change maps and CK Proposition 9.2’s log crystalline B_st⁺ interface. CP.4 owns the rational assembly.

Consumers: `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/hyodo-kato-interface`.

### EnhancedDerivedSheaves:E1

Faithful-flat descent/detection for perfect complexes, algebra maps and coherent comparison diagrams used with 𝔖→A_inf, extending E1’s existing coefficient-change and monoidal interface. Ordinary DerivedCategory is not an E∞ or completed tensor substitute.

Consumers: `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/twisted-trace`; `AInfCohomology:AI.7/trace-prismatic-agreement`; `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/choice-transport`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

The broad BMS1 Proposition 4.3/BMS2 Definition 1.1 category of finitely presented 𝔖-modules with Frobenius invertible after E, and the proof that M[1/p] is free; finite-flat φ_𝔖 and cotangent/Tate twist comparison. The existing finite-free kisin-modules node is too narrow for torsion cohomology.

Consumers: `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/bkf-tensor-functor`; `AInfCohomology:AI.7/twist-compatibility`.

### PerfectoidSpaces:P3

Integral perfectoid criterion and generic-fibre pro-étale carrier for p-completed compatible root towers; local CK semistable monomial analysis stays in AI.6.

Consumers: `AInfCohomology:AI.6/root-tower`.

### PrismaticCohomology:PR.3

The relative THH/prismatic comparison in the nonperfect Breuil–Kisin specialization of BS22 §15, with trace/prismatic Frobenius and specialization-map compatibility and descent data. Import the existing generic décalage/twist nodes rather than redefine them.

Consumers: `AInfCohomology:AI.7/trace-prismatic-agreement`.

### RefinedTraceMethods:RT.6

BMS2 §§11.1–11.3 relative THH/TC⁻/TP over sphere[z], coefficient formulas bv=E, even QRS descent, Bott-inverted cyclotomic extension and Segal Corollary 8.18, filtered Nygaard→E-adic map. Supply the actual relative THH/prismatic equivalence and its Hodge–Tate/PD generator maps used by BS22 §15; keep Bott b distinct from coefficient u.

Consumers: `AInfCohomology:AI.7/twisted-trace`; `AInfCohomology:AI.7/trace-descent`; `AInfCohomology:AI.7/trace-prismatic-agreement`; `AInfCohomology:AI.7/frobenius-decalage`; `AInfCohomology:AI.7/nygaard-nondescent`; `AInfCohomology:AI.7/comparison-diagram-agreement`.

### Recorded gaps

**G-GAGA — Formal GAGA over a rank-one valuation ring.** CK Theorem 4.12: for a height-one valuation ring V complete for a nonzero nonunit a, and a proper finitely presented V-scheme Y, finitely presented O_Y-modules are equivalent to compatible finitely presented modules on Y_{V/a^n}; locally free systems algebraize to locally free modules. CK’s deduction and references were read; the Fujiwara–Kato proof and a supplier blueprint are not available here. This lies beyond the upstream AdicSpaces elementary layer and needs the Part II extension proposed below.

**G-CURVE — Nodal conic log cohomology calculation.** The explicit log Čech/normalization/trace calculation giving H_logdR=(O_K,0,O_K) and the compatible Tate-twist generator for Proj(XY−πZ²) must be furnished by CR.5’s proper semistable-curve API. The chart and expected comparison consequences are specified, but this packet does not certify that imported curve calculation.

**G-MAPS — Supplier proof of relative trace comparison maps.** RT.6 and PR.3 must provide the relative THH/prismatic comparison with the actual Hodge–Tate structure map, PD/log-free generator compatibility and faithful-flat descent datum. PR.6’s comparison/uniqueness contracts, including their Frobenius twists, are planning dependencies; its proposed Lean carriers do not supply actual geometric APIs. BS22 §18 alone proves uniqueness only over a perfect prism after η has been checked.

**G-LEAN-GEOMETRY — Unavailable actual geometric Lean signatures.** The pinned baseline does not provide formal semistable schemes with the shared log/prismatic/relative spectral objects needed to state these full definitions and maps. Suggested Lean records every omitted declaration/API/test name and its mathematical signature in comments, as required by the honest omission rule of PROTOCOL §13. No arbitrary FormalScheme carrier, unconstrained comparison package, assumed theorem field or proposition-valued stand-in is introduced. Follow-up must replace these named omissions using the actual supplier APIs.

**G-LEAN-CONTINUATIONS — Geometric continuation of algebraic prototypes.** The compiled polynomial quotient/completion is an actual chart algebra. Extending the polynomial log derivations through the actual (p,μ)-complete étale lift/PD envelope and specializing power-series maps into O_K/A_inf require CR.5/AI.0/R07.4’s actual types. The algebraic components, generator relations and normalized coefficient maps are prototyped concretely; the missing completions, θ-squares and Eisenstein period-ideal signature are explicitly inventoried as omissions.

The proposed **AdicSpaces, Part II: Formal GAGA over valuation rings** starts from the existing elementary adic geometry and supplies CK Theorem 4.12, locally free algebraization, and coherent cohomology comparison. No existing AdicSpaces layer is replanned. AI.6's local analysis, log PD comparisons and proper lattice consequences form three reading groups while retaining the existing stage ID. AI.7 supplies no prerequisite back into AI.0–AI.6.

The A_inf stage's canonical-generic-fibre dependency is CP.3→AI.6; the rational and lattice consumers are AI.6→CP.4 and AI.6→CP.5. An audit against the atlas stage graph and all direct prerequisite edges of this packet found no cycle introduced by these dependencies. The actual diagram agreement and faithful-flat descent supplier proofs remain requirements, not assumptions stored as comparison data.

## Baseline and suggested signatures

The pinned baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed library-coverage file has no AInfCohomology entry. Keyword and declaration searches at those commits do not supply the formal semistable geometry, log crystalline sites, prisms or relative trace spectra used here. The elementary algebraic ingredients are existing APIs and are cited rather than recreated.

- **mathlib:MvPolynomial**, `Mathlib/Algebra/MvPolynomial/Basic.lean`: For a commutative semiring R, multivariate polynomials indexed by σ are AddMonoidAlgebra R (σ→₀ℕ); used for the actual chart quotient.
- **mathlib:Ideal.Quotient.mk**, `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`: Canonical ring homomorphism R→R/I for a commutative ring; the chart uses the ideal generated by its explicit equations.
- **mathlib:AdicCompletion**, `Mathlib/RingTheory/AdicCompletion/Basic.lean`: Compatible inverse-limit families in M/(I^n·M). This is ordinary module completion, not derived completion. For the principal ideal (p) it gives the chart completion.
- **mathlib:AdicCompletion.evalₐ**, `Mathlib/RingTheory/AdicCompletion/Algebra.lean`: For a commutative ring R and ideal I, the canonical R-algebra map AdicCompletion I R→R/I^n.
- **mathlib:Finset.max'**, `Mathlib/Data/Finset/Max.lean`: Maximum of a nonempty finite set in a linear order. Applied in the order dual it gives the minimum of a branch tuple; the generated min declaration is absent from the static declaration index but present in Lean.
- **mathlib:MvPolynomial.pderiv**, `Mathlib/Algebra/MvPolynomial/PDeriv.lean`: Bundled R-derivation ∂_i of MvPolynomial σ R. Weighted linear combinations give the semistable logarithmic chart derivations.
- **mathlib:PowerSeries**, `Mathlib/RingTheory/PowerSeries/Basic.lean`: Univariate power series as MvPowerSeries Unit R; the existing R07.4 coefficient ring uses this carrier.
- **mathlib:PowerSeries.map**, `Mathlib/RingTheory/PowerSeries/Basic.lean`: A coefficient ring homomorphism R→S induces a ring homomorphism R[[X]]→S[[X]], acting coefficientwise.
- **mathlib:PowerSeries.substAlgHom**, `Mathlib/RingTheory/PowerSeries/Substitution.lean`: For an R-algebra S and a substitutable series a, substitution gives R[[X]]→ₐ[R]MvPowerSeries τ S; X^p is substitutable for p≠0.
- **mathlib:PowerSeries.constantCoeff**, `Mathlib/RingTheory/PowerSeries/Basic.lean`: Constant coefficient R[[X]]→+*R; its composite with Witt Frobenius is the normalized crystalline coefficient map.
- **mathlib:WittVector**, `Mathlib/RingTheory/WittVector/Defs.lean`: The p-typical Witt-vector carrier with coefficients ℕ→R. Its ring structure and period-ring applications are imported, not reconstructed.
- **mathlib:WittVector.frobenius**, `Mathlib/RingTheory/WittVector/Frobenius.lean`: Under Fact p.Prime, Witt-vector Frobenius is a bundled ring endomorphism; the perfect-field specialization is used in the coefficient normalization.
- **mathlib:DerivedCategory**, `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`: For an abelian category with a chosen localization, the ordinary unbounded derived category of cochain complexes. This does not supply the E∞, derived tensor or completion interfaces required here.
- **mathlib:DividedPowers**, `Mathlib/RingTheory/DividedPowers/Basic.lean`: A divided power structure on an ideal, with null/zero/one/membership/addition/multiplication/composition axioms. This is not a universal completed PD envelope.
- **mathlib:DividedPowerAlgebra**, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`: The ring-congruence quotient of MvPolynomial (ℕ×M) R for the universal divided-power algebra relations; it is not a PD envelope of a closed immersion.

For exponent normalization the source also provides the generated order-dual minimum declaration; the baseline citation uses the explicitly indexed Finset.max′ declaration. Ordinary DerivedCategory, DividedPowers and DividedPowerAlgebra document the exact reuse boundary. A divided power algebra of a module does not supply a divided power envelope of an immersion.

The suggested file elaborates against the pinned Mathlib build with only standard proof-placeholder warnings. It concretely prototypes the chart quotient and ordinary completion, normalized exponent indices, polynomial log derivations, and normalized power-series coefficient maps, with their algebraic tests. It also has the rank-two monodromy identity and a scalar divisibility test. The unavailable geometric signatures, their API items and their tests appear by name and mathematical specification in the omission inventory. Compilation verifies the concrete signatures only. It verifies none of the omitted signatures or geometric comparison proofs. G-LEAN-GEOMETRY and G-LEAN-CONTINUATIONS record the full replacement work using the actual supplier types.

## Sources and reading boundary

All sources below were accessed on 6 October 2026. Paper pagination is used in the register. The packet records the exact versions, SHA-256 hashes, source passages and short locator excerpts.

- **CK**: Kęstutis Česnavičius and Teruhisa Koshikawa, [The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145v3). arXiv:1710.06145v3, 4 October 2018; paper pagination 1–78. Reading: §§1.5–1.7, 2.1–2.3; §§3.1–3.3, 3.14–3.25, 3.30–3.35; §§4.1–4.6, 4.11–4.21; §§5.1–5.7, 5.9–5.16, 5.17–5.34, 5.38–5.44; §§6.5–6.8; §§7.1–7.12, 8.1–8.8, 9.1–9.6.
- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00102-z.pdf). Published, Publications Mathématiques de l’IHÉS 128 (2018), 219–397; DOI 10.1007/s10240-019-00102-z. Reading: §4.4, pp.280–283; Lemma 4.30, Proposition 4.32, Corollary 4.33 with proofs; §13 through the CP.3 supplier contract; §§4,6,14 through audited supplier contracts, not a direct full reading of those sections.
- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf). Published, Publications Mathématiques de l’IHÉS 129 (2019), 199–310; DOI 10.1007/s10240-019-00106-9. Reading: Theorem 1.2 and Remarks 1.3–1.4; §11, pp.298–308, including all proofs and Remarks 11.16–11.17.
- **BS22**: Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4). arXiv:1905.08229v4, 12 January 2022; §18 paper pp.122–123. Reading: §18 with proof; §17 comparison statement checked against PR.6 corrected supplier nodes; Theorem 1.8 and Examples 1.3(3), 1.9(2)–(3), pp.2–6, including the crystalline Frobenius pullback.

The CK deduction and references for formal GAGA were read; the underlying Fujiwara–Kato book proof is the explicit G-GAGA input. The relative trace/prismatic bridge beyond the audited supplier contracts is the explicit G-MAPS input. The conic's full logarithmic Čech/trace computation is the explicit G-CURVE input. Source contracts imported from AI.0–AI.5, CR.0/CR.5/CR.6, PR.1/PR.3/PR.6 and RT.6 are distinguished from passages read directly.

Two source misprints are recorded against the versions of record. BMS1's §4.4 calls φ_𝔖 an automorphism; the correction is endomorphism, as BMS2 Notation 11.1 states. BMS2's first defining display in the proof of Theorem 11.2 omits the relative base of TC⁻; its referenced Proposition 11.15 and following Frobenius composite require the relative spectrum over 𝕊[z]. Neither correction changes a stated result. The packet records correction searches and their limits.
