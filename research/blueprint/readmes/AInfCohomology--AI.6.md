# Semistable AΩ and cohomological Breuil–Kisin descent

This part plans **AInfCohomology:AI.6–AI.7**. AI.6 constructs integral AΩ for semistable formal models, its logarithmic comparisons, and the torsion and lattice consequences for proper models. AI.7 constructs smooth Breuil–Kisin cohomology using the shared prismatic theory, relates it to relative trace cohomology, and specifies the comparison maps whose agreement still needs proof. Their domains differ: the ordinary relative prismatic and trace constructions in AI.7 apply to smooth formal schemes.

The [packet](../packets/AInfCohomology--AI.6.json) is the mathematical register. This reader follows its corrected statements, proof outlines, direct prerequisites, API items, tests and locators. It has 60 nodes: 4 definitions, 16 constructions, 38 theorems and 2 applications, with 103 API items, 76 unit tests and 12 planets. Both stages are **planned**, with 18 supplier requests and six recorded gaps; neither stage is closed. Every implementation status is **unchecked**.

The [suggested file](../suggested/AInfCohomology--AI.6.lean) contains algebraic prototypes and a named inventory for geometry whose supplier types are missing. At Mathlib 082e2d3 it elaborates with 205 declarations and examples, 182 proved and 23 with unfinished proofs. Only 17 API items and 18 tests are active declarations or labelled examples; the rest appear in the inventory. Compilation certifies that boundary, not the geometric comparisons. The pinned Tau Ceti baseline is f790474; this file imports Mathlib only.

## Conventions and ownership

The common hypothesis block below applies to every node. Fix a prime p, an algebraically closed residue field k̄ of characteristic p, and C the completed algebraic closure of W(k̄)[1/p]. Fix p^Q⊂C, using compatible ℓ-power roots of p for every prime ℓ, and fix ε=(1,ζ_p,ζ_{p²},…) as in CK §1.5, p.4, and §2.1, pp.7–8. Write A_inf=W(O_C^♭), μ=[ε]−1, ξ=μ/φ_A⁻¹(μ), ξ̃=φ_A(ξ), θ:A_inf→O_C and θ̃=θ∘φ_A⁻¹. The integral coefficient leaf **AI.0:integral**, rather than the unsplit AI.0, supplies these objects and their identities under the accepted RS-01 ownership. Its twists A_inf{1}, O_C{1} and the étale realization Z_p(1) retain their separate meanings.

In arithmetic statements K is complete and discretely valued, of mixed characteristic (0,p), with perfect residue field k₀, ring O_K and uniformizer π; C is the completion of K̄. Keep W(k₀)→W(k̄) explicit. The logarithmic specialization first uses the Q≥0 log point over W(k̄); the ℕ log point over W(k₀) is reached by the stated log-structure and coefficient changes. The W(k₀)→W(k̄) cohomological base change in `hyodo-kato-interface` remains an input in G-INPUTS, not a theorem attributed to CK.

A CK model 𝔛 has étale-local charts

R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q), with q∈Q>0 and 0≤r≤d.

The braces mean restricted power series: complete along p, not along all coordinate variables (CK §1.7, p.6). The algebraic prototype uses a polynomial variable for each branch and a pair Y_j,Z_j for each torus coordinate, quotients by ∏T_i−π and Y_jZ_j−1, then p-completes. Mathlib supplies multivariate polynomials, ideal quotients and ordinary adic completion; AI.6 plans their semistable application and its universal property.

The divisorial log structure is associated to O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét. Its chart is the pushout of ℕ^{r+1} and O_C∖{0} over the diagonal ℕ with 1↦p^q; the base chart need not be fine (CK §1.6, pp.4–6). CR.5 and CR.5:log-algebra supply associated log structures, monoid pushouts, log differentials, exactification and log PD Poincaré. AI.6 owns the chart application and the comparison maps.

EnhancedDerivedSheaves:E1 supplies the shared derived tensor and coherent algebra enhancement. E4 supplies completed extension of scalars where requested. The log PD envelopes and their complexes below use **classical, termwise p-adic completion**: they do not acquire derived-completion statements from E4, whose replete-topos hypotheses do not cover 𝔛_ét. AI.1 supplies décalage, Bockstein reduction and Koszul calculations; AI.3–AI.5 supply period sheaves and the smooth integral comparisons. AI.6 adds the semistable analysis.

PR.1 supplies relative prismatic cohomology; the specified PR.3 nodes supply Frobenius, Nygaard, twists and the trace comparison inputs. RT.6 supplies relative THH, TC⁻ and TP over 𝕊[z], including filtration and unfolding. R07.4 supplies coefficient rings and representation classification. The broader category of finitely generated cohomological Breuil–Kisin modules, allowing torsion, is a request to R07.4; its finite-free bounded-height category alone does not supply it.

**CohomologyComparisons:CP.3→AInfCohomology:AI.6** is required: CP.3 constructs the canonical B_dR⁺ crystalline/deformation cohomology of the smooth generic fibre (BMS1 §13). AI.6 constructs a comparison to it, including the étale-topology version and embeddings with non-unit coordinates (CK §§6.2–6.6, pp.60–66). CP.4 consumes the resulting rational semistable interfaces; CP.5 consumes the torsion and lattice theorems.

## AI.6: local analysis, logarithmic maps and integral lattices

The local calculation starts with the integral root tower, its monomial indices and its A_inf lift. At level m the branch relation is ∏t_i^{1/p^m}=p^{q/p^m}; the p-completed union is perfectoid and the generic cover has Δ≃Z_p^d (CK §§3.1–3.3, pp.10–11). The integral transitions need not be flat. The p=2 nodal example has generic rank two and a closed-node fibre of length three; it prevents treating this as an integral flat Kummer cover.

Normalizing branch exponents by subtracting their minimum gives the monomial decomposition into integral and nonintegral parts. Δ acts through the specified weights; the nonintegral continuous cohomology is annihilated by μ on the A_inf side. The structure-sheaf edge comparison is needed first, including the torsion-freeness criterion modulo ζ_p−1. These calculations convert the almost comparison into the integral comparison after décalage (CK Propositions 3.8, 3.19 and 3.25, Theorems 3.9 and 3.20, pp.12–21).

AΩ is defined through the presheaf site of coordinate affines and sheafification (CK §4.1, pp.24–25). The Hodge–Tate comparison identifies the θ̃-reduction cohomology with logarithmic forms and their twists. **Sheaf completeness is a downstream theorem**: Remark 4.5 and Corollary 4.6 use the Hodge–Tate calculation to establish derived ξ-completeness and presheaf-to-sheaf agreement. The Zariski comparison also requires that coordinates exist Zariski locally (Corollary 4.21, pp.31–32). The log de Rham comparison follows from Frobenius and the Bockstein differential (Theorem 4.17, Corollary 4.18, pp.30–31). For proper models, coherent finiteness and derived completeness give perfectness (Corollary 4.20, p.31); perfectness of a complex does not make every cohomology module free.

For crystalline comparison, the finite-level rings A_cris^(m) and their relative versions are separate constructions (CK §§3.26–3.29, pp.21–23, and §§5.35–5.37, pp.52–55). After m≥p² the exponential of log([ε]) times a log derivation matches the Δ-action, and the resulting unit operators identify the local Koszul complexes (Lemma 5.15, Proposition 5.16, pp.39–41). Globalization uses filtered all-coordinates presentations, exactification and log PD envelopes. Enlarging the coordinate sets is part of the construction; a one-element index does not automatically recover a single-chart object.

The comparison map is retained at chain level through these models. Its globalization gives the Frobenius-equivariant logarithmic crystalline comparison of CK Theorem 5.4, p.33. Global multiplicativity and functoriality for non-étale morphisms are not asserted. The crystalline-to-de Rham triangle commutes (Proposition 5.41, pp.56–58); here the proof uses the local multiplicative specialization map that CK does establish. This does not make the exponential comparison itself a morphism of differential graded algebras.

For qcqs models, global crystalline specializations use p-completed tensor products; properness removes the extra completion and gives finite freeness after inverting p (CK Corollary 5.43, pp.58–59). The B_dR⁺ comparison uses the topology and non-unit-coordinate construction before constructing the map. For proper models it is an equivalence (Theorem 6.6, p.66), with finite freeness obtained from Corollary 5.43 and Beilinson, not imported from CP.3. The generic-fibre étale comparison after μ-inversion likewise requires **properness** (Theorem 2.3, p.9). The nonproper torus test rules out the earlier qcqs claim. Proposition 6.8, pp.66–67, checks agreement of these maps after extension to B_dR.

The cohomological Breuil–Kisin–Fargues theorem allows torsion (CK Theorem 7.4, pp.68–69). The degreewise de Rham and crystalline specializations keep the adjacent-degree terms H_A^{i+1}[ξ] and Tor₁(H_A^{i+1},W(k̄)) (§7.6, pp.69–70). Proposition 7.7 gives a single-degree freeness criterion; Corollary 7.5 gives ranks by the étale, de Rham and crystalline specializations. The torsion comparisons are inequalities of ordinary or normalized valuation lengths (Theorems 7.9 and 7.12, pp.70–72), not canonical injections.

The arithmetic endpoint first constructs the equivariant Fargues correspondence, T↦M(T), and its invariant de Rham lattice (CK Proposition 8.4, §§8.5–8.6, p.73). Model independence then needs log de Rham freeness in **both degrees i and i+1** (Theorem 8.7, p.74). The nodal conic has log de Rham groups O_K,0,O_K and the same lattices as the smooth P¹ model. Its nodal genus-zero fibre has N=0; the separate rank-two monodromy algebra test is not its H¹. Coherent base change and the curve computation remain explicit gaps.

## AI.7: coefficient normalization and smooth Breuil–Kisin descent

Use the existing ring 𝔖=W(k₀)[[u]], its Eisenstein polynomial E, and φ_𝔖 with Witt Frobenius on coefficients and u↦u^p. Distinguish θ̃_𝔖(u)=π from θ_𝔖=θ̃_𝔖∘φ_𝔖, with θ_𝔖(u)=π^p. Write g(u)=[π^♭], W(k₀)-linearly, and f=g∘φ_𝔖=φ_A∘g. Thus f uses Witt Frobenius and u↦[π^♭]^p; θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖. The crystalline coefficient map is c=φ_W∘constantCoeff. R07.4 calls its u↦π map θ_𝔖; the register spells out the dictionary with this θ̃_𝔖 (BMS1 §4.4, pp.280–283; BMS2 Notation 11.1, p.298).

BMS1 Lemma 4.30 proves flatness of f. Faithful flatness and topological freeness, asserted in BMS2 Notation 11.1, need the separate arguments in `flat-coefficient-extension`. The topological basis includes 1 and gives a linear retraction, allowing the stated detection for modules, perfect complexes and completed derived complexes. The Čech descent statement concerns mapping spaces, including coherent descent data for derived maps.

Define Breuil–Kisin cohomology by relative prismatic cohomology of the bounded non-perfect prism (𝔖,(E)). Frobenius becomes invertible after E-inversion. The trace construction first yields the Frobenius-twisted complex from gr⁰ of relative TC⁻/TP unfolded over the quasiregular semiperfectoid site, then descends through φ_𝔖 using b-inversion and the cyclotomic Frobenius (BMS2 §11, pp.298–308). Absolute TC⁻ cannot substitute for the relative base 𝕊[z], and gr⁰ on a smooth algebra is not simply π₀.

BS22 Proposition 15.7 and §15.2, p.105, identify trace and prismatic cohomology. Agreement of their three specialization **maps** is clause (b) of `trace-prismatic-agreement` and remains G-MAPS. The prismatic A_inf specialization uses the ξ̃-prism and φ_A-pullback; it depends on PR.6's naturality and multiplicativity. The de Rham and crystalline specializations use ordinary derived tensor products through θ_𝔖 and c: no extra completion is required. Proper smooth cohomology is perfect and yields broad finitely presented Breuil–Kisin modules, possibly with p-torsion (BMS2 Theorem 1.2, pp.201–202, Theorem 11.2, pp.298–299; BS22 Theorem 1.8).

Nygaard filtration is on the Frobenius pullback, not functorially on the descended complex. For unramified K, the ideal (E) already fails to descend along φ_𝔖; an elliptic curve outside W(k₀)[π^p]=O_K cannot witness that case. When (E) does descend, the ramified example K=Q_p(p^{1/p}) uses a good-reduction elliptic curve with j outside Z_p (BMS2 Remark 11.16, p.307, with the repair in the register). In the same extension, each cyclic de Rham torsion summand has length divisible by p.

Transport between coefficient choices is defined after extension to A_inf through intrinsic AΩ. It has identity and cocycle; descending it to 𝔖 is extra descent data. BS22 Theorem 18.2, pp.122–123, gives uniqueness over a **perfect prism**, for functors on **all** p-completely smooth algebras over the corresponding perfectoid ring. It does not apply to functors only on smooth O_K-algebras or over (A_cris,(p)). The remaining de Rham, crystalline, étale and B_dR⁺ map agreements therefore stay explicit in `comparison-diagram-agreement` and G-MAPS.

## Declaration register

Every entry inherits the following common hypothesis, with additional hypotheses listed separately. The order is the corrected packet's register order; prerequisites determine the proof order. In particular, `aomega-sheaf-completeness` also uses `log-de-rham` for its Zariski comparison. Names and proposed module paths are planning interfaces, not declarations claimed to exist in the baseline. A node marked as a planet still has the same unchecked implementation status as the other nodes.

p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained.

### Standard semistable chart ring

`AInfCohomology:AI.6/chart-ring` · definition · declaration `Semistable.chartRing`

**Statement.** For a commutative ring R, π∈R and integers r,s≥0, let P=R[T₀,…,Tᵣ,Y₁,Z₁,…,Yₛ,Zₛ]. Let J be generated by ∏Tᵢ−π and YⱼZⱼ−1. The algebraic chart Q=P/J and its ordinary p-adic completion R□=AdicCompletion((p),Q) give the restricted-power-series chart. In CK use R=O_C and π=p^q, q∈Q>0; the torus coordinates are Yⱼ. The construction here is this chart, not a general formal scheme.

**Additional hypotheses.**

- p-adic completion is along the image of the integer p; π=p^q with the fixed roots in the CK application.

**Proof or construction.**

1. Use Mathlib multivariable polynomials and Ideal.Quotient for Q.

2. Use the existing AdicCompletion ring instance and quotient projections. Identification with CK (1.5.1) (CK does not spell this out; it uses the explicit decomposition (3.2.1)): f=T₀⋯Tᵣ−p^q is a nonzerodivisor modulo p, because as a polynomial in T₀ its leading coefficient T₁⋯Tᵣ is a nonzerodivisor (for r=0 it is monic); hence the principal ideal (f) of O_C{t₀,…,tᵣ,t_{r+1}^{±1},…,t_d^{±1}} is p-adically closed, the quotient is p-torsion-free and p-adically complete, and it equals lim_n Q/p^n.

**Uses.**

- `CK §§3.1,5.9`: The chart controls the root tower and its Frobenius lift.

- `AInfCohomology:AI.6`: A nodal chart detects singular special fibre without replacing the generic fibre by it.

**API.**

- `Semistable.chartRing.branch_relation` (relation): In the completion, ∏ᵢTᵢ equals the image of π.

- `Semistable.chartRing.torus_inverse` (simp): The images of Yⱼ and Zⱼ multiply to 1.

- `Semistable.chartRing.reduction` (compatibility): Projection to level n sends a polynomial class to its class in Q/(p)^n, agreeing with AdicCompletion.evalₐ and Ideal.Quotient.mk.

- `Semistable.chartRing.lift` (universal-property): A ring map R→B and branch/torus values satisfying the relations induce a unique map Q→B. If moreover I⊂B is an ideal containing the image of p, a compatible family of ring maps Q→B/I^n induces a unique ring map from AdicCompletion((p),Q) to lim_n B/I^n compatible with the projections evalₐ.

**Unit tests.**

- `Semistable.chartRing.nodal` (computation): For r=1,s=0, T₀T₁=π in R□.

- `Semistable.chartRing.unit_coordinate` (computation): For s=1, Y₁Z₁=1, including after reduction modulo p.

- `Semistable.chartRing.point` (degenerate): For r=s=0, Q≃R by T₀↦π, and R□≃AdicCompletion((p),R).

- `Semistable.chartRing.restricted` (non-example): For R=Z_p, π=p, r=1, s=0: evalₐ at level 1 induces R□/pR□≅F_p[T₀,T₁]/(T₀T₁), and 1−T₀ is not a unit of R□ (its image in F_p[T₀,T₁]/(T₀T₁,T₁)=F_p[T₀] is not a unit). In the completion along (p,T₀,T₁) it would be a unit.

**Acceptance.**

- The completed nodal relation is T₀T₁=π.

- At r=s=0 the completion is the p-adic completion of R.

**Direct prerequisites.** `mathlib:MvPolynomial`, `mathlib:Ideal.Quotient.mk`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.evalₐ`, `mathlib:AdicCompletion.evalₐ_of`, `mathlib:AdicCompletion.liftRingHom`, `mathlib:IsAdicComplete.liftRingHom`, `mathlib:AdicCompletion.isAdicComplete`.

**Sources.**

- CK: §1.5, (1.5.1), p.4; §1.5, sentence after (1.5.1), p.4; §1.5, p.4; §1.7, p.6.

**Suggested-file boundary (algebraic).** Typed in the suggested file: the chart quotient, its p-adic completion, the coordinates, and the universal property in three statements (for the quotient; for the completion with a target complete and separated for (p); for an ideal I containing the image of p and a compatible family of maps to the quotients by I^n). The comparison with CK's restricted power series is typed only as the test restricted.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Divisorial semistable log structure

`AInfCohomology:AI.6/divisorial-log` · construction · declaration `Semistable.divisorialLog`

**Statement.** For a CK formal model 𝔛, take the associated log structure of O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét; the base prelog monoid is O_C∖{0}. On a chart it is the pushout of ℕ^{r+1} along the diagonal ℕ→ℕ^{r+1} and 1↦p^q in O_C∖{0}. It is quasi-coherent and integral; the base need not be fine. Every local section of the log structure becomes a unit after inverting p.

**Additional hypotheses.**

- 𝔛 is a p-adic formal scheme over O_C that étale locally admits the charts (1.5.1); flatness and local finite presentation of each 𝔛⊗O_C/p^n over O_C/p^n follow from the charts.

**Proof or construction.**

1. Import associated log structures and integral monoid pushouts from CR.5:log-algebra.

2. CK Claim 1.6.1 (chart (1.6.2)), for a scheme U étale over Spec O[t₀,…,tᵣ,t_{r+1}^{±1},…,t_d^{±1}]/(t₀⋯tᵣ−π) with O a valuation subring of the integral closure of W(k̄) and π a nonzero nonunit: by a limit argument O may be taken discretely valued; then U with the chart log structure is logarithmically regular (Kato, Toric singularities, 2.1), its locus of triviality is U[1/p], and Kato, Toric singularities, Theorem 11.6 identifies it with the log structure of O_U∩(O_U[1/p])×. (Kato’s results: CR.5:log-algebra.)

3. CK Claim 1.6.3: for a flat O-scheme the p-adic completion morphism is strict for these log structures (comparison of stalks modulo units, using Stacks Project 04D1). Since the chart (1.5.1) is the p-adic completion of the base change of an étale O-morphism (1.5.2), the chart (1.6.2) with O replaced by O_C and π=p^q is a chart on 𝔛; quasi-coherence and integrality follow. Use fine versions only when the log-crystalline site requires them.

**Uses.**

- `CK Theorems 4.11,4.17,5.4`: Log differentials and log crystalline cohomology require the actual divisorial chart.

- `CrystallineCohomology:CR.6`: The arithmetic log special fibre must be matched to Hyodo–Kato conventions.

**API.**

- `Semistable.divisorialLog.chart` (characterisation): The associated chart is ℕ^{r+1}⊔_ℕ(O_C∖{0}) with the displayed maps.

- `Semistable.divisorialLog.pullback` (functoriality): Strict étale chart pullback agrees with the divisorial log structure, and composes under refinement.

- `Semistable.divisorialLog.generic` (compatibility): Every local section of the log structure is invertible in O_𝔛,ét[1/p]; for the algebraic model U of CK Claim 1.6.1 the locus of triviality of the log structure is U[1/p].

**Unit tests.**

- `Semistable.divisorialLog.node` (computation): At the closed node of T₀T₁=p^q the stalk of M/O^× is ℕ²⊔_ℕℚ≥0 (classes e₀, e₁ of T₀, T₁ and the value monoid ℚ≥0 of O_C∖{0}, with e₀+e₁=q), and its quotient by the image of the base monoid ℚ≥0 is ℕ²/ℕ(1,1)≅ℤ via (a,b)↦a−b.

- `Semistable.divisorialLog.smooth` (compatibility): At r=0 (t₀=p^q, R□≅O_C{t₁^{±1},…,t_d^{±1}}) the chart monoid is ℕ⊔_ℕ(O_C∖{0})=O_C∖{0}, the map to Spf O_C is strict, and the relative log differentials are the ordinary differentials, free on dt₁/t₁,…,dt_d/t_d.

- `Semistable.divisorialLog.nonfine` (non-example): The base chart O_C∖{0} has value monoid Q≥0 in the CK setup, which is not finitely generated; no fine hypothesis is asserted for this chart.

**Acceptance.**

- At a node the two branch generators satisfy dlogT₀+dlogT₁=0 over the log base.

**Direct prerequisites.** `AInfCohomology:AI.6/chart-ring`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.**

- CK: §1.6 (1), p.5; §1.6 (2), p.5; §1.6, p.5; Claim 1.6.1 (proof), p.6; Claim 1.6.3, (1.6.4), p.6.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Semistable perfectoid root tower

`AInfCohomology:AI.6/root-tower` · construction · declaration `Semistable.rootTower`

**Statement.** Given an étale morphism Spf(R)→Spf(R□) of p-adic formal schemes, form R_m by base change from the chart adjoining p^m-th roots of every branch and invertible coordinate and imposing ∏Tᵢ^{1/p^m}=p^{q/p^m}. Set R_∞ to the p-adic completion of colim_mR_m. Its generic fibre is an affinoid perfectoid pro-(finite étale) cover with group Δ={(ε₀,…,ε_d)∈(lim_m μ_{p^m}(O_C))^{d+1}:∏_{i=0}^rεᵢ=1}≃Z_p^d; R_∞ is integral perfectoid.

**Additional hypotheses.**

- R is a p-adically complete O_C-algebra with an étale morphism Spf(R)→Spf(R□) as in CK (3.1.1): each R/p^n is étale over R□/p^n (étale, not merely formally étale); roots use the fixed compatible systems.

**Proof or construction.**

1. CK (3.2.1): R□_m is the p-adically completed direct sum of O_C·t^a over the normalized exponents a of monomial-exponents with p^m·a integral, and R□_∞ is the p-adically completed direct sum of O_C·t^a over all a in (Z[1/p]≥0)^{r+1}⊕Z[1/p]^{d−r} with a_j=0 for some 0≤j≤r; each R□_m→R□_∞ is the inclusion of the direct summand formed by those summands. Do not assert integral flatness of the tower over R□.

2. Perfectoidness (CK §1.7 and §3.2; BMS1 Lemmas 3.9 and 3.10): R□_∞ is p-torsion-free and p-adically complete and Frobenius R□_∞/p^{1/p}→R□_∞/p is bijective on the monomial basis, so R□_∞ is integral perfectoid by the criterion of PerfectoidSpaces:P4/integral-perfectoid-criterion-for-annuli applied to the pair (R□_∞,p^{1/p}); the annulus worked out in that node is the case r=1, d=1 with exponent in Z[1/p], and for general r, d and q∈Q>0 the hypothesis of the criterion is checked on the basis of step 1. R is R□-flat and each R_m=R⊗_{R□}R□_m is p-torsion-free, p-adically formally étale over R□_m and p-adically complete (Gabber–Ramero, Almost ring theory, 7.1.6); hence R_∞ is p-adically formally étale over R□_∞, p-adically complete and integral perfectoid.

3. Group and action (CK §3.2): Δ acts R□-linearly on R□_m by scaling t_j^{1/p^m} by the μ_{p^m}-component of ε_j; compute the generators δᵢ and the isomorphism Δ≃Z_p^d.

4. Cover (CK §3.2): R□_m[1/p] is obtained from R□[1/p] by adjoining p^m-th roots of the units t₁,…,t_d, hence is finite étale of degree p^{md}, and R□_m=(R□_m[1/p])°; so lim Spa(R_m[1/p],R_m) is a finite-étale tower over the adic generic fibre, a covering of AdicEtaleGeometry:A1/pro-etale-site-corrected, with group Δ. That it is affinoid perfectoid and that Ô⁺ takes the value R_∞ on it (Scholze, p-adic Hodge theory for rigid-analytic varieties, 4.10(iii)) is supplied by AI.3.

**Uses.**

- `CK §§3.14–3.25`: Continuous cochains on this actual cover give the local AΩ comparison.

**API.**

- `Semistable.rootTower.transition` (data): Level m embeds into level m+1 by sending each root to the p-th power of the next root.

- `Semistable.rootTower.action` (structure): The continuous Δ-action scales each compatible root t_j^{1/p^m} by the μ_{p^m}-component of ε_j and preserves the branch-product relation because ε₀⋯εᵣ=1. Δ is topologically freely generated by δᵢ=(ε⁻¹,1,…,1,ε,1,…,1) (entries 0 and i) for 1≤i≤r and δᵢ=(1,…,1,ε,1,…,1) (entry i) for r<i≤d.

- `Semistable.rootTower.perfectoid` (compatibility): R_∞ is p-torsion-free, p-adically complete and integral perfectoid (Frobenius R_∞/p^{1/p}→R_∞/p is bijective), and the tower lim Spa(R_m[1/p],R_m) is a finite-étale tower over the adic generic fibre, hence a covering in its pro-étale site, with group Δ.

- `Semistable.rootTower.generic_finite_etale` (characterisation): For each m, R□_m[1/p] is the direct sum of R□[1/p]·t₁^{a₁}⋯t_d^{a_d} over a₁,…,a_d∈{0,1/p^m,…,(p^m−1)/p^m}; it is finite étale of degree p^{md} over R□[1/p], and R□_m is the ring of power-bounded elements of R□_m[1/p].

**Unit tests.**

- `Semistable.rootTower.node_action` (computation): For T₀T₁=p^q and the generator δ₁=(ε⁻¹,ε) of Δ, δ₁(T₀^{1/p^m})=ζ_{p^m}^{-1}T₀^{1/p^m} and δ₁(T₁^{1/p^m})=ζ_{p^m}T₁^{1/p^m}, where ζ_{p^m} is the p^m-th component of ε.

- `Semistable.rootTower.point` (degenerate): For r=s=0 the tower is O_C with trivial Δ.

- `Semistable.rootTower.nonflat` (non-example): For the nodal chart at p=2,m=1, the generic root cover has rank 2 but its closed-node special-fibre algebra has basis 1,a,b and length 3 (a²=b²=ab=0); the integral map is not flat.

**Acceptance.**

- The group has rank d rather than d+1; the node remains nonflat integrally.

**Direct prerequisites.** `AInfCohomology:AI.6/chart-ring`, `AInfCohomology:AI.6/monomial-exponents`, `AInfCohomology:AI.3`, `PerfectoidSpaces:P4/integral-perfectoid-criterion-for-annuli`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`.

**Sources.**

- CK: §3.1, (3.1.1), p.10; §3 (introduction), p.10; §3.2, p.10; §1.7, p.7; §3.2, p.11.

**Suggested-file boundary (partial).** Typed in the suggested file: compatible systems of roots, the level-m chart, the transition maps and the non-flatness test. The formally étale base change, R_∞, Δ and the perfectoid statements are in the named inventory.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Normalized semistable monomial indices

`AInfCohomology:AI.6/monomial-exponents` · definition · declaration `Semistable.monomialExponents`

**Statement.** At root level m, an index consists of a∈ℕ^{r+1}, b∈ℤ^s and a branch j with a_j=0, modulo equality of a and b (the witness j is not extra data). It represents ∏Tᵢ^{aᵢ/p^m}∏Yⱼ^{bⱼ/p^m}. Normalize an arbitrary a by subtracting min_i a_i; the removed factor is p^{q·min(a)/p^m}. The index is integral precisely when p^m divides every a_i and b_j. Level-m and level-(m+1) indices are identified by (a,b)↦(pa,pb); the union over m is the index set of CK (3.2.1), namely (Z[1/p]≥0)^{r+1}⊕Z[1/p]^{d−r} with a_j=0 for some branch j (s=d−r).

**Additional hypotheses.**

- r+1 is nonempty; signed torus exponents are essential; normalization acts on branch exponents only.

**Proof or construction.**

1. Use finite tuples and integer divisibility from the baseline.

2. Apply the unique normal form of the completed direct sum decomposition CK (3.2.1) (monomials with a_j=0 for some 0≤j≤r); retain the removed coefficient p^{q·min(a)/p^m} instead of deleting it.

3. The Δ-weights are those of CK (3.19.3) and the exact level is the m of CK §3.22 (the least m with p^m·a integral, equivalently with p^m·b integral for the weights b); both are definitions on indices and need no further input.

**Uses.**

- `CK §3.2, §3.11, §3.14, proof of Proposition 3.19, §3.22`: The integral/nonintegral splitting, the exact-level decomposition and the Δ-eigencharacters use these normalized indices.

**API.**

- `Semistable.monomialExponents.normalize` (constructor): Normalization sends a to a−min(a) coordinatewise and records min(a).

- `Semistable.monomialExponents.normalized` (characterisation): A branch exponent is normalized iff at least one coordinate is zero; normalize fixes such tuples.

- `Semistable.monomialExponents.integral` (characterisation): At level m integrality means simultaneous divisibility by p^m of branch and signed torus numerators.

- `Semistable.monomialExponents.transition` (functoriality): (a,b)↦(pa,pb) maps level-m indices to level-(m+1) indices, preserves normalization and integrality, and represents the same monomial.

- `Semistable.monomialExponents.level` (data): The exact level of a level-m index is the least m′≤m such that p^{m−m′} divides every a_i and b_j; the index is integral iff its exact level is 0, and the exact level is unchanged by transition.

- `Semistable.monomialExponents.weight` (data): The Δ-weights of a level-m index are w_j=a_j−a₀ for 1≤j≤r and w_j=b_j for the torus directions (CK (3.19.3), in units of 1/p^m); the generator δ_j of Δ scales the monomial by ε^{w_j/p^m}. The exact level is also the least m′≤m such that p^{m−m′} divides every w_j; in particular a nonintegral index has a weight not divisible by p^m.

**Unit tests.**

- `Semistable.monomialExponents.node` (computation): normalize(2,3)=(0,1) and the removed minimum is 2.

- `Semistable.monomialExponents.point` (degenerate): For r=s=0 the sole normalized branch exponent is 0 and every level has only the integral index.

- `Semistable.monomialExponents.fractional_torus` (non-example): At p=2,m=1, branch tuple (0,2) and torus numerator −1 give a nonintegral index; ignoring negative torus exponents would give the wrong answer.

- `Semistable.monomialExponents.level_weight` (computation): For p=2, r=1, s=1: the level-1 index ((0,2),(4)) is the transition of the level-0 index ((0,1),(2)) and has exact level 0; the level-2 index ((0,2),(1)) has exact level 2 and weights (2,1); the level-1 index ((1,0),(0)) has weights (−1,0) and exact level 1.

**Acceptance.**

- The normalized node monomial T₀²T₁³ has coefficient p^{2q} and exponent (0,1).

**Direct prerequisites.** `AInfCohomology:AI.6/chart-ring`, `mathlib:Finset.max'`.

**Sources.**

- CK: §3.2, (3.2.1), p.10; §3.2, p.10; §3.14, p.15; Proposition 3.19 (proof), (3.19.3), p.17; §3.22, p.18.

**Suggested-file boundary (algebraic).** Typed in the suggested file: the index type at a fixed level, normalisation, integrality, the transition between levels, the exact level and the Δ-weights, with all four tests.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Integral and nonintegral monomial splitting

`AInfCohomology:AI.6/monomial-splitting` · theorem · declaration `Semistable.monomialSplitting`

**Statement.** The completed monomial expansion yields Δ-equivariant decompositions R_∞=R⊕M_∞ of R-modules and A_inf(R_∞)=A(R)⊕N_∞ of A(R)-modules, with integral indices in the first summand and nonintegral indices in the second; A(R) is the (p,μ)-complete lift of ainf-chart-lift. Modulo ξ the second decomposition reduces to the first, so N_∞/ξ≅M_∞. These are completed module decompositions, not a direct product of rings.

**Additional hypotheses.**

- X=Spf(R) with an étale coordinate map as in CK (3.1.1); completions are p-adic in (3.2.1)–(3.2.2) and (p,μ)-adic in §3.14.

**Proof or construction.**

1. CK (3.2.1)–(3.2.2): R□_∞ is the p-adically completed direct sum of O_C·t^a over the normalized exponents (root-tower, monomial-exponents); the summands with some a_j∉Z form the R□-submodule M□_∞, and base change along the étale map R□→R gives M_∞:=R⊗̂_{R□}M□_∞ and R_∞≅R⊕M_∞. Δ preserves the decompositions.

2. CK §3.11 and §3.14: the tilt (R□_∞)^♭ is the p^{1/p^∞}-adically completed direct sum of O_C^♭·x^a, where x_i^{1/p^m} is the compatible system (…,t_i^{1/p^{m+1}},t_i^{1/p^m}), and R_∞^♭ is the completed étale lift of R_∞/p. Since W(A) is the unique p-adically complete p-torsion-free Z_p-algebra lifting a perfect F_p-algebra A, with Teichmüller lifts computed as limits of p^n-th powers (Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic p, 2.4–2.5; AI.0:integral), A_inf(R□_∞) is the (p,μ)-adically completed direct sum of A_inf·X^a with X_i^{1/p^m}=[x_i^{1/p^m}]; the integral summands form the subring A(R□), the others the A(R□)-submodule N□_∞.

3. CK (3.14.3)–(3.14.5): with the lift A(R) of ainf-chart-lift, A_inf(R_∞)≅A_inf(R□_∞)⊗̂_{A(R□)}A(R), completion (p,μ)-adic (the value of A_inf,X on the cover is W(R_∞^♭), Scholze, p-adic Hodge theory for rigid-analytic varieties, 6.5(i); AI.3); set N_∞:=N□_∞⊗̂_{A(R□)}A(R). The decompositions are Δ-equivariant and reduce modulo ξ to (3.2.2).

**Acceptance.**

- The product of two nonintegral monomials can be integral, so N_∞ is not asserted to be an ideal.

- Under the embedding of A(R□) into A_inf(R□_∞), Xᵢ=[xᵢ] with xᵢ=(…,tᵢ^{1/p},tᵢ); on the nonintegral monomial X₁^{1/p} of the node chart, δ₁−1 is multiplication by [ε^{1/p}]−1=φ⁻¹(μ), which is not divisible by μ, whereas on the integral summand A(R□) every δ−1 is divisible by μ.

**Direct prerequisites.** `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/monomial-exponents`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.3`.

**Sources.**

- CK: §3.2, (3.2.2), p.10; §3.2, p.11; §3.11, p.14; §3.14, p.15; §3.14, (3.14.5), p.15.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Integral A_inf chart lift

`AInfCohomology:AI.6/ainf-chart-lift` · construction · declaration `Semistable.ainfChartLift`

**Statement.** Let A(R□)=A_inf{X₀,…,Xᵣ,X_{r+1}^{±1},…,X_d^{±1}}/(∏Xᵢ−[(p^{1/p∞})^q]), completed for (p,μ), with the surjection θ:A(R□)→R□, Xᵢ↦tᵢ. Using θ, lift the étale R□/p-algebra R/p uniquely to a (p,μ)-adically complete, formally étale A(R□)-algebra A(R). It has Frobenius Xᵢ↦Xᵢ^p and the integral Δ-action from the root tower, which is trivial modulo μ; reduction along θ is R.

**Additional hypotheses.**

- X=Spf(R) with an étale coordinate map as in CK (3.1.1). Use the fixed compatible roots; the lift is of the specified étale chart algebra, not an arbitrary singular A_inf-algebra.

**Proof or construction.**

1. Define A(R□) by the presentation CK (3.14.2), convergence being (p,μ)-adic, with Frobenius semilinear over that of A_inf and Xᵢ↦Xᵢ^p, and with Δ acting by Xⱼ↦[εⱼ]Xⱼ (the relation is preserved because ε₀⋯εᵣ=1). The map θ of CK (3.14.3) is Xᵢ↦tᵢ over θ:A_inf→O_C (AI.0:integral); its kernel is generated by ξ.

2. The ideal (p,ξ) of A(R□) is topologically nilpotent for the (p,μ)-adic topology and A(R□)/(p,ξ)=R□/p, so the étale R□/p-algebra R/p lifts uniquely to a (p,μ)-adically complete formally étale A(R□)-algebra A(R) (CK §3.14; unique lifting of étale algebras, Stacks Project 04D1; AI.3). By the same uniqueness the Frobenius and the Δ-action lift uniquely, the Δ-action being Frobenius-equivariant, and A(R)/ξ≅R.

3. Δ acts trivially on A(R□)/μ because [εⱼ]≡1 modulo μ, hence trivially on A(R)/μ by uniqueness of lifts (CK §3.14). A(R) is μ-torsion-free: A(R□) is the (p,μ)-adic completion of a free A_inf-module on the integral monomials, so each (p^n,μ^{n′}) is a regular sequence on it with quotient free over A_inf/(p^n,μ^{n′}); A(R)/(p^n,μ^{n′}) is étale over A(R□)/(p^n,μ^{n′}), which gives the same regularity and flatness for A(R), and μ-torsion-freeness follows by (p,μ)-adic completeness (compare CK Lemma 3.13 and the proof of Proposition 5.6), so (δ−1)/μ is a well-defined A_inf-linear endomorphism of A(R) (CK §3.27). The identification of A(R) with the integral summand of A_inf(R_∞) is monomial-splitting, not this node.

**Uses.**

- `CK §§3.19–3.25,5.10–5.16`: Integral continuous cochains and log derivations act on A(R).

**API.**

- `Semistable.ainfChartLift.theta` (compatibility): A(R)⊗̂_{A_inf,θ}O_C≃R, agreeing with the imported θ.

- `Semistable.ainfChartLift.frobenius` (simp): φ(Xᵢ)=Xᵢ^p and φ acts by Witt Frobenius on coefficients.

- `Semistable.ainfChartLift.etale` (universal-property): The lift A(R) of the étale R□/p-algebra R/p is unique up to unique isomorphism; for a map R→R′ of étale R□-algebras there is a unique compatible map A(R)→A(R′), and the Frobenius and the Δ-action of A(R) are the unique lifts of those of A(R□).

- `Semistable.ainfChartLift.delta_monomial` (simp): (ε₀,…,ε_d)∈Δ sends Xⱼ to [εⱼ]Xⱼ; the action is continuous, A_inf-linear and commutes with φ.

- `Semistable.ainfChartLift.delta_trivial_mod_mu` (relation): Δ acts trivially on A(R)/μ; for δ∈Δ the A_inf-linear map (δ−1)/μ:A(R)→A(R) is defined and δ=1+μ·(δ−1)/μ.

**Unit tests.**

- `Semistable.ainfChartLift.node` (computation): At r=1, X₀X₁=[(p^{1/p∞})^q] before θ-reduction.

- `Semistable.ainfChartLift.point` (degenerate): At R=O_C the lift is A_inf.

- `Semistable.ainfChartLift.theta_tilde` (non-example): θ(Xᵢ)=tᵢ, and the reduction map A(R□)→R□ is θ. The formula θ̃=θ∘φ_A⁻¹ of A_inf does not define a map on A(R□): the Frobenius of A(R□) is not surjective, since Xᵢ is not in its image for a torus coordinate, nor for a branch coordinate when r≥1. So the reduction cannot be relabelled θ̃.

- `Semistable.ainfChartLift.delta_mod_mu` (computation): On the node chart, for δ₁=(ε⁻¹,ε): δ₁(X₁)−X₁=μ·X₁ and δ₁(X₀)−X₀=([ε]⁻¹−1)·X₀=−[ε]⁻¹·μ·X₀, both divisible by μ; so (δ₁−1)/μ sends X₁ to X₁ and X₀ to −[ε]⁻¹X₀.

**Acceptance.**

- Frobenius raises the lifted relation to its p-th power and lifts absolute Frobenius mod p.

**Direct prerequisites.** `AInfCohomology:AI.6/chart-ring`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.3`.

**Sources.**

- CK: §3.14, (3.14.2), p.15; §3.14, p.15; §3.14, (3.14.3), p.15.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Integral structure-sheaf edge comparison

`AInfCohomology:AI.6/structure-sheaf-edge` · theorem · declaration `Semistable.structureSheafEdge`

**Statement.** Let e: RΓ_cont(Δ,R_∞)→RΓ_proét(X_C^ad,Ô⁺) be the edge map of CK (3.3.1) for the Δ-cover of root-tower; by almost purity the maximal ideal m of O_C kills the cohomology of its cone. An O_C-module has no nonzero m-torsion if no nonzero element is annihilated by all of m. (a) For every i, ζ_p−1 kills H^i_cont(Δ,M_∞); for every b∈O_C, the O_C-modules R_∞/b and H^i_cont(Δ,R_∞/b) have no nonzero m-torsion (CK Proposition 3.8). (b) For every b∈O_C^♭∖{0}, R_∞^♭/b and H^i_cont(Δ,R_∞^♭/b) have no nonzero m^♭-torsion (CK Lemma 3.12). (c) Lη_{ζ_p−1}(e): Lη_{ζ_p−1}RΓ_cont(Δ,R_∞)→Lη_{ζ_p−1}RΓ_proét(X_C^ad,Ô⁺) is an isomorphism (CK Theorem 3.9). (d) The same holds for the edge map e′ of any pro-(finite étale) affinoid perfectoid Δ′-cover Spa(R′_∞[1/p],R′_∞)→X_C^ad that refines the Δ-cover compatibly with a continuous surjection Δ′→Δ of profinite groups (CK Remark 3.10).

**Additional hypotheses.**

- X=Spf(R) with an étale coordinate map as in CK (3.1.1); R_∞, Δ and M_∞ are those of root-tower and monomial-splitting, and R_∞^♭ is the tilt of R_∞.

**Proof or construction.**

1. Edge map (CK §3.3): the Čech complex of Ô⁺ for the cover is RΓ_cont(Δ,R_∞) (Scholze, p-adic Hodge theory for rigid-analytic varieties, 3.5, 3.7(iii) and 6.6, with its corrigendum), which gives e; by almost purity (loc. cit. 4.10(v); AI.3) m kills the cohomology of Cone(e).

2. Single summand (proof of CK Proposition 3.8): for a summand S=O_C·t^a of (3.2.1), CK Lemma 3.7 (BMS1 Lemma 7.3(ii); AI.3) computes H^i_cont(Δ,S) as the cohomology of a tensor product of d complexes O_C→O_C, each multiplication by ζ−1 for a p-power root of unity ζ; these are defined over a discrete valuation subring of O_C, so CK Lemma 3.5 (for a discrete valuation ring o inside a non-discrete valuation ring O of rank 1 with maximal ideal M, (N⊗_o O)[M]=0) gives (3.8.1). If S is nonintegral some ζ is not 1, and ζ−1, hence ζ_p−1, kills H^i_cont(Δ,S) ((3.8.2)).

3. Completed sums and base change: group the summands by exact level into M□_m (monomial-exponents). CK Lemma 3.6 (for p-adically complete p-torsion-free continuous modules M_j whose H^i_cont are all p-torsion-free, or all killed by one power of p, H^i_cont of the p-adically completed direct sum injects into the product of the H^i_cont(M_j)) gives (3.8.3). R is R□-flat, so H^i_cont(Δ,R⊗_{R□}M□_m)≅R⊗_{R□}H^i_cont(Δ,M□_m) ((3.8.4)), and Lemma 3.6 again shows that ζ_p−1 kills H^i_cont(Δ,M_∞). For b≠0 the summands of R_∞/(b,p^n) and the Δ-action on them are defined over discrete valuation subrings, so Lemmas 3.5 and 3.7 give the absence of m-torsion in R_∞/b and H^i_cont(Δ,R_∞/b); the case b=0 follows from the injection H^i_cont(Δ,M_∞)→H^i_cont(Δ,M_∞/(ζ_p−1)) and from H^i_cont(Δ,R) being a direct sum of copies of R. This proves (a).

4. (b): one may assume b∈m^♭ and, using Frobenius, that b divides p^{1/p^∞} in O_C^♭; then R_∞^♭/b≅R_∞/b^♯ Δ-equivariantly for some b^♯∈O_C (tilt of monomial-splitting, CK §3.11), and (a) applies.

5. (c): put M=H^i_cont(Δ,R_∞)=H^i_cont(Δ,R)⊕H^i_cont(Δ,M_∞). By (a), M has no nonzero m-torsion, and M/(ζ_p−1)M=H^i_cont(Δ,R)/(ζ_p−1)⊕H^i_cont(Δ,M_∞), a finite direct sum of copies of R/(ζ_p−1) plus a submodule of M, has none either. Since m kills the kernel and cokernel of H^i(e), CK Lemma 3.4 (BMS1 Lemma 8.11(i); AI.1) gives M/M[ζ_p−1]≅H^i(X_C^ad,Ô⁺)/H^i(X_C^ad,Ô⁺)[ζ_p−1], and these quotients compute the cohomology of Lη_{ζ_p−1} (AI.1/decalage-cohomology). CK's written proof checks the absence of m-torsion in M/M[ζ_p−1] instead of M/(ζ_p−1)M; the hypothesis of Lemma 3.4 is the latter, verified here from (a).

6. (d): by almost purity m kills the cohomology of Cone(e′) as well, so by the octahedral axiom it kills that of the cone of RΓ_cont(Δ,R_∞)→RΓ_cont(Δ′,R′_∞); Lemma 3.4 applies to this map, with the same M, and combines with (c).

**Acceptance.**

- For the torus chart R=O_C{t^{±1}} and S=O_C·t^{1/p}: the generator δ acts by ζ_p, so H⁰_cont(Δ,S)=0 and H¹_cont(Δ,S)=O_C/(ζ_p−1), which is killed by ζ_p−1 and has no nonzero m-torsion. For S=O_C·t^{1/p²} one gets O_C/(ζ_{p²}−1), killed by ζ_{p²}−1, which divides ζ_p−1.

- For R=O_C{t^{±1}}, Lη_{ζ_p−1}RΓ_cont(Δ,R_∞) has H⁰=R and H¹≅R (from the integral summand), so by (c) the same holds for Lη_{ζ_p−1}RΓ_proét(X_C^ad,Ô⁺), in agreement with H¹(Ω̃_𝔛)≅Ω¹{−1}.

- The statement is integral: before Lη_{ζ_p−1} the kernel and cokernel of H^i(e) are only known to be killed by m.

**Direct prerequisites.** `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/monomial-exponents`, `AInfCohomology:AI.6/monomial-splitting`, `AInfCohomology:AI.3`, `AInfCohomology:AI.1`, `AInfCohomology:AI.1/decalage-cohomology`.

**Sources.**

- CK: §3.3, (3.3.1), p.11; Lemma 3.5, p.12; Lemma 3.6, p.12; Lemma 3.7, p.12; Proposition 3.8, p.12; Theorem 3.9, p.13; Theorem 3.9 (proof), p.13; Remark 3.10, p.13; Lemma 3.12, p.14.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Nonintegral cohomology annihilation

`AInfCohomology:AI.6/nonintegral-annihilation` · theorem · declaration `Semistable.nonintegralAnnihilation`

**Statement.** For every i∈Z: (a) μ annihilates H^i_cont(Δ,N_∞) (CK Proposition 3.25); equivalently Lη_μ of the Koszul complex of N_∞ on δ₁−1,…,δ_d−1 vanishes. (b) H^i_cont(Δ,A_inf(R_∞)/μ) is p-torsion-free and p-adically complete, the natural maps H^i_cont(Δ,A_inf(R_∞)/μ)⊗_{A_inf}A_inf/p^n→H^i_cont(Δ,A_inf(R_∞)/(μ,p^n)) are isomorphisms for n>0, and H^i_cont(Δ,A_inf(R_∞)/(μ,p^n)) and H^i_cont(Δ,A_inf(R_∞)/μ) have no nonzero W(m^♭)-torsion (CK Proposition 3.19). (c) For n,m≥0, H^i_cont(Δ,N_m/(μ,p^n)) is killed by φ^{−m}(μ) and is a flat A_inf/(φ^{−m}(μ),p^n)-module (CK Corollary 3.23). Part (b) is the input of the integral edge comparison (CK Theorem 3.20); part (a) removes the nonintegral summand.

**Additional hypotheses.**

- X=Spf(R) with an étale coordinate map as in CK (3.1.1); R_∞, Δ, A(R) and N_∞ are those of root-tower, ainf-chart-lift and monomial-splitting. For m≥0, N_m is the (p,μ)-adically completed summand of A_inf(R_∞) formed by the monomials of exact level m, base changed to A(R) (CK §3.22); N_0=A(R) and N_∞ is the completed direct sum of the N_m with m>0.

**Proof or construction.**

1. Single summand (proof of CK Proposition 3.19, (3.19.3)–(3.19.6)): for S=A_inf·X^a contributing to N□_∞, with weights b_j of (3.19.3) and exact level m>0, the Koszul description of continuous cohomology of Δ≃Z_p^d (CK Lemma 3.7 = BMS1 Lemma 7.3(ii); AI.3) gives H^i_cont(Δ,S/μ) as a direct sum of copies of A_inf/φ^{−m}(μ); it is p-torsion-free and H^i_cont(Δ,S/μ)⊗A_inf/p^n≅H^i_cont(Δ,S/(μ,p^n)) (Stacks Project 061Z, 0662).

2. Completed sums and base change (CK (3.19.7)–(3.19.10)): pass to N□_∞/μ by CK Lemma 3.6(i) (H^i_cont of a p-adically completed direct sum injects into the product), to N_∞ by flatness of A(R)/(μ,p^n) over A(R□)/(μ,p^n) ((3.19.8)), and to the limit over n by Stacks Project 0D6K. On the summand A(R), Δ acts trivially modulo μ (ainf-chart-lift) and A(R)/(μ,p^n) has no nonzero W(m^♭)-torsion (CK (3.14.1), from Lemmas 3.12 and 3.13). For N_∞, the absence of W(m^♭)-torsion in H^i_cont(Δ,N_∞/(μ,p^n)) reduces by dévissage to n=1, where N_∞/(μ,p) is a direct summand of R_∞^♭/μ and CK Lemma 3.12 applies (structure-sheaf-edge). This proves (b).

3. (c): CK §3.22 and Corollary 3.23, from (3.19.5)–(3.19.6) for N□_m, the base change (3.19.8) and Lazard's theorem for the flat A(R□)/(μ,p^n)-algebra A(R)/(μ,p^n).

4. (a): CK Proposition 3.25. By Lemma 3.7 it suffices that Lη_μ(K_{N_∞}(δ₁−1,…,δ_d−1))=0 ((3.25.1)). By (b) the cohomology of this Koszul complex modulo μ is p-torsion-free, so the base-change lemma for Lη (CK Lemma 3.24 = Bhatt, Specializing varieties…, 5.16; AI.1; applied with f=μ and g=ξ̃, which is congruent to p modulo μ) identifies its reduction modulo ξ̃ with Lη_{ζ_p−1} of the Koszul complex of N_∞/ξ̃. Since φ⁻¹ maps N_∞/ξ̃ isomorphically onto a direct summand of N_∞/ξ≅M_∞ (monomial-splitting), ζ_p−1 kills the cohomology of that complex by CK Proposition 3.8 (structure-sheaf-edge), so both sides are acyclic. N_∞ is (p,μ)-adically, hence ξ̃-adically complete (Stacks Project 090T), so the Koszul complex and its Lη_μ are derived ξ̃-complete (BMS1 Lemma 6.19; AI.1/preservation-derived-completeness), and the vanishing follows.

**Acceptance.**

- A fractional branch eigencharacter is removed after Lη_μ; merely applying almost purity is insufficient.

- For the node chart (r=d=1) and S=A_inf·X₁^{1/p} (a=(0,1/p), weight 1/p): δ₁ acts on S by [ε^{1/p}], so H⁰_cont(Δ,S)=0 and H¹_cont(Δ,S)=A_inf/([ε^{1/p}]−1)=A_inf/φ⁻¹(μ), which is nonzero, killed by μ, and hence removed by Lη_μ.

**Direct prerequisites.** `AInfCohomology:AI.6/monomial-splitting`, `AInfCohomology:AI.6/monomial-exponents`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.6/structure-sheaf-edge`, `AInfCohomology:AI.3`, `AInfCohomology:AI.1`, `AInfCohomology:AI.1/preservation-derived-completeness`.

**Sources.**

- CK: Proposition 3.19, p.16; Proposition 3.19 (last sentence), p.16; Proposition 3.19 (proof), (3.19.5), p.17; Corollary 3.23, p.19; Proposition 3.25, p.19; Proposition 3.25 (proof), p.19; Lemma 3.24, p.19.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Integral semistable local edge comparison

`AInfCohomology:AI.6/local-edge` · theorem · declaration `Semistable.localEdge`

**Statement.** The edge map e of CK (3.15.1) induces an isomorphism Lη_μ(e): Lη_μRΓ_cont(Δ,A_inf(R_∞))≃Lη_μRΓ_proét((Spf R)_C^ad,A_inf,X) (CK Theorem 3.20). Moreover Lη_μRΓ_cont(Δ,A_inf(R_∞))≅Lη_μRΓ_cont(Δ,A(R)) is represented by the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ). The comparison is compatible with refinement of the cover: for a continuous surjection Δ′→Δ of profinite groups and a pro-(finite étale) affinoid perfectoid Δ′-cover Spa(R′_∞[1/p],R′_∞) refining the Δ-cover compatibly, the edge map e′ also becomes an isomorphism after Lη_μ, and so does RΓ_cont(Δ,A_inf(R_∞))→RΓ_cont(Δ′,A_inf(R′_∞)) (CK Remark 3.21).

**Additional hypotheses.**

- X=Spf(R) with an étale coordinate map as in CK (3.1.1).

**Proof or construction.**

1. Edge map (CK §3.15): the Čech complex of A_inf,X for the Δ-cover of root-tower is RΓ_cont(Δ,A_inf(R_∞)), which gives e. By almost purity (Scholze, p-adic Hodge theory for rigid-analytic varieties, 6.5(ii); AI.3) the Teichmüller elements [m^♭] kill the cohomology of Cone(e); these modules are derived p-adically complete (Bhatt–Scholze, The pro-étale topology for schemes, 3.4.4 and 3.4.14), so the ideal W(m^♭) kills them (CK Lemmas 3.16 and 3.17).

2. By the projection formula (3.20.1) (Stacks Project 0944) and nonintegral-annihilation (b), the cohomology of RΓ_cont(Δ,A_inf(R_∞))⊗^L A_inf/μ has no nonzero W(m^♭)-torsion. The almost-to-integral criterion CK Lemma 3.18 (from Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic p; supplied by AI.1) then gives CK Theorem 3.20; AI.1/derived-decalage supplies Lη_μ.

3. Koszul description (not part of Theorem 3.20; it is what CK does in the proof of Proposition 5.6): by (3.14.5) (monomial-splitting) the left side splits as the sum of the parts of A(R) and of N_∞; Lη_μ of the N_∞-part vanishes by nonintegral-annihilation (a); Δ acts trivially on A(R)/μ and A(R) is μ-torsion-free (ainf-chart-lift), so by CK Lemma 3.7 the A(R)-part is η_μK_{A(R)}(δ₁−1,…,δ_d−1)≅K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ).

4. Refinements (CK Remark 3.21, under the conditions of Remark 3.10): by almost purity and the octahedral axiom [m^♭] kills the cohomology of the cone of RΓ_cont(Δ,A_inf(R_∞))→RΓ_cont(Δ′,A_inf(R′_∞)); Lemma 3.17 upgrades this to W(m^♭) and Lemma 3.18 applies to this map.

**Acceptance.**

- The comparison is integral; it must not be weakened to an almost quasi-isomorphism.

- For R=O_C (d=0) both sides are A_inf in degree 0. For the torus chart R=O_C{t^{±1}} the left side is A_inf{X^{±1}}→A_inf{X^{±1}} with differential X^n↦(([ε]^n−1)/μ)·X^n; ([ε]^n−1)/μ is a unit when p∤n, so only the monomials with p∣n contribute to H¹, and the n=0 part of H¹ is A_inf.

**Direct prerequisites.** `AInfCohomology:AI.6/nonintegral-annihilation`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/monomial-splitting`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.3`, `AInfCohomology:AI.1`, `AInfCohomology:AI.1/derived-decalage`.

**Sources.**

- CK: Theorem 3.20, p.18; Theorem 3.20 (proof), p.18; Lemma 3.16, p.16; Lemma 3.18, p.16; Proposition 3.25 (proof), (3.25.1), p.19; Proposition 5.6 (proof), p.34; Remark 3.21, p.18.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Semistable AΩ complex

`AInfCohomology:AI.6/aomega` · construction · declaration `Semistable.aOmega`

Atlas planet: **Semistable AΩ complex**.

**Statement.** For ν:X_C,proét^ad→𝔛_ét define AΩ_𝔛=Lη_μRν_*A_inf,X∈D^{≥0}(𝔛_ét,A_inf) in the imported monoidal derived sheaf category. The semistable extension uses the same integral sheaf and décalage as AI.3, now on the étale site of 𝔛 and the CK charts; the same formula with the Zariski site as target of ν defines AΩ_{𝔛_Zar}, the object used in BMS1. AΩ_𝔛 is a commutative algebra object of D(𝔛_ét,A_inf), contravariantly functorial for O_C-morphisms of formal schemes as in CK §1.5 and, semilinearly, for isomorphisms lying over a continuous automorphism of O_C (API item semilinear); RΓ_Ainf(𝔛)=RΓ(𝔛_ét,AΩ_𝔛), and AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]. Its presheaf version AΩ^psh=Lη_μRν^psh_*A_inf,X, on the site 𝔛^psh_ét of connected affine étale opens admitting a coordinate map (1.5.1) with isomorphisms as coverings, satisfies φ⁻¹AΩ^psh≅AΩ_𝔛 and RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X), and is derived ξ-adically and ξ̃-adically complete. Derived ξ-completeness of the sheaf AΩ_𝔛 and AΩ^psh≅Rφ_*AΩ_𝔛 are not asserted here; they are aomega-sheaf-completeness.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5, not required proper for this sheaf definition.

**Proof or construction.**

1. Import the period sheaf A_inf,X=W(Ô^{+,♭}) and the multiplicative pushforward from AI.3/E1; ν is the morphism of sites of CK (1.5.5), sending an étale 𝔘→𝔛 to its adic generic fibre (it preserves coverings, fibre products and final objects by Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1). Define AΩ_𝔛 by CK (2.2.3) and AΩ_{𝔛_Zar} by (2.2.4), with AI.1/derived-decalage for the ideal (μ) of the constant sheaf A_inf.

2. Commutative algebra structure (not discussed in CK): Rν_* of the sheaf of rings A_inf,X is a commutative algebra object and Lη_μ is lax symmetric monoidal (BMS1 Proposition 6.7; AI.1/decalage-products), exactly as for the smooth case in BMS1 Definition 9.1; algebra objects are taken in the sense of E5:abstract/algebra-objects. BMS1 proves the lax structure on the derived category; nothing beyond what AI.1/decalage-products supplies is used.

3. Functoriality (CK §7.2) and inversion of μ (CK (2.2.7)): Lη commutes with pullback along flat morphisms of ringed topoi (BMS1 Lemma 6.14; AI.1); this gives the pullback maps for 𝔛′→𝔛 and, for the localisation A_inf→A_inf[1/μ] where Lη_μ is the identity, the isomorphism AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]. The same argument applies to an isomorphism 𝔛′→𝔛 lying over a continuous automorphism σ of O_C: it induces an isomorphism of the pro-étale sites of the generic fibres under which A_inf,X pulls back to A_inf,X′, semilinearly over W(σ^♭), and the ideal (μ) is stable under W(σ^♭) because it does not depend on the choice of ε (CK §2.1, §8.1).

4. Presheaf version (CK §4.1): on 𝔛^psh_ét every presheaf is a sheaf, φ_* is restriction, φ⁻¹ is sheafification and φ⁻¹∘φ_*≅id; (4.1.2) follows from BMS1 Lemma 6.14 and (4.1.3) from the definition. RΓ_proét(𝔘_C^ad,A_inf,X) is derived ξ- and ξ̃-adically complete, and AI.1/preservation-derived-completeness (BMS1 Lemma 6.19), applied in the replete topos of sets, shows that AΩ^psh is.

5. Local computation: for 𝔘=Spf(R) in 𝔛^psh_ét, (4.1.3) and local-edge identify RΓ(𝔘,AΩ^psh) with the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ).

**Uses.**

- `CK §§4–7`: All specializations start with this actual complex.

- `CohomologyComparisons:CP.4 and CohomologyComparisons:CP.5`: Rational assembly and torsion/lattice applications import these maps.

**API.**

- `Semistable.aOmega.local` (equivalence): For 𝔘=Spf(R) in 𝔛^psh_ét, RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X) (CK (4.1.3)), which by local-edge is the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ); the right side does not involve the framing. That RΓ(𝔘_ét,AΩ_𝔛) is the same complex is aomega-sheaf-completeness.

- `Semistable.aOmega.functorial` (functoriality): An O_C-morphism 𝔛′→𝔛 of formal schemes as in CK §1.5 induces a pullback map on AΩ and on RΓ_Ainf, compatible with products and satisfying identity/composition.

- `Semistable.aOmega.complete` (structure): AΩ^psh is derived ξ-adically and ξ̃-adically complete (CK §4.1); this is preservation of derived completeness by Lη sectionwise, in the topos of sets, not commutation of décalage and completion. Derived ξ-completeness of the sheaf AΩ_𝔛 is aomega-sheaf-completeness.

- `Semistable.aOmega.smooth` (compatibility): For a chart with r=0 the local complex Lη_μRΓ_cont(Δ,A_inf(R_∞)) is the AI.3 toric complex with the same Δ, tower and coefficient maps. The global comparison of the étale-site AΩ_𝔛 with the Zariski-site AΩ_{𝔛_Zar} used in BMS1 is CK Corollary 4.21, in aomega-sheaf-completeness.

- `Semistable.aOmega.psh` (compatibility): φ⁻¹(AΩ^psh)≅AΩ_𝔛 for the morphism of topoi φ from 𝔛_ét to 𝔛^psh_ét (CK (4.1.2)).

- `Semistable.aOmega.invert_mu` (compatibility): AΩ_𝔛⊗^L_{A_inf}A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L_{A_inf}A_inf[1/μ] (CK (2.2.7)).

- `Semistable.aOmega.zariski` (data): AΩ_{𝔛_Zar}=Lη_μRν^Zar_*A_inf,X∈D^{≥0}(𝔛_Zar,A_inf), with ν^Zar the projection to the Zariski site (CK (2.2.4)); it is the object of BMS1. Its comparison with AΩ_𝔛 is aomega-sheaf-completeness.

- `Semistable.aOmega.semilinear` (functoriality): Let σ be a continuous automorphism of O_C and g:𝔛′→𝔛 an isomorphism of formal schemes lying over Spf(σ). Then W(σ^♭) is an automorphism of A_inf commuting with φ_A and preserving the ideals (μ), (ξ) and (ξ̃), and pullback of period sheaves along the isomorphism of adic generic fibres induced by g gives a W(σ^♭)-semilinear isomorphism RΓ_Ainf(𝔛)→RΓ_Ainf(𝔛′), compatible with composition. For 𝔛=𝔛₀⊗̂_{O_K}O_C with 𝔛₀ a formal O_K-scheme and σ∈G_K=Gal(K̄/K), taking g=id⊗Spf(σ) gives an A_inf-semilinear action of G_K on each H^i_Ainf(𝔛). CK §8.1 obtains this action from the functoriality of §7.2, which is stated there for O_C-morphisms only.

**Unit tests.**

- `Semistable.aOmega.point` (degenerate): For SpfO_C the global complex is A_inf concentrated in degree 0.

- `Semistable.aOmega.node` (computation): For the node T₀T₁=p^q (r=d=1), RΓ(𝔘,AΩ^psh) is the two-term complex A(R□)→A(R□) with differential (δ₁−1)/μ, where δ₁ multiplies X₀ by [ε]⁻¹ and X₁ by [ε].

- `Semistable.aOmega.good_reduction` (compatibility): For the torus chart R□=O_C{t₁^{±1},…,t_d^{±1}} (r=0), RΓ(𝔘,AΩ^psh) is K_{A(R□)}((δ₁−1)/μ,…,(δ_d−1)/μ) with δᵢ(Xᵢ)=[ε]Xᵢ, the AI.3 toric AΩ complex with identical coefficient maps.

- `Semistable.aOmega.decalage_torsion` (non-example): For the torus chart with d=1 and p∤n, the X^n-summand of H¹(𝔘,AΩ^psh) is A_inf/(([ε]^n−1)/μ)=0, whereas the X^n-summand of H¹_cont(Δ,A_inf(R_∞)) is A_inf/([ε]^n−1)=A_inf/μ, which is not killed by W(m^♭): the Teichmüller lift of (p^♭)^{1/p^j} lies in W(m^♭) and, for j large, not in (μ), because modulo p the element μ is ε−1, whose valuation is p/(p−1) times that of p^♭. Since H¹_cont→H¹_proét(𝔘_C^ad,A_inf,X) has kernel killed by W(m^♭), the image of this summand is a nonzero μ-torsion submodule of H¹_proét. So without Lη_μ the first cohomology would have nonzero μ-torsion classes in every monomial degree n prime to p.

**Acceptance.**

- On a chart with r=0 the complex RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_cont(Δ,A_inf(R_∞)) agrees with the AI.3 toric complex, including the map from pro-étale cochains.

**Direct prerequisites.** `AInfCohomology:AI.3`, `AInfCohomology:AI.1`, `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.1/decalage-products`, `AInfCohomology:AI.1/preservation-derived-completeness`, `AInfCohomology:AI.6/local-edge`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `AdicEtaleGeometry:A1`.

**Sources.**

- CK: §1.5, (1.5.5), p.5; §2.2, (2.2.3), p.9; §2.2, (2.2.4), p.9; §2.2, (2.2.7), p.9; §4.1, p.24; §4.1, (4.1.2), p.25; §4.1, p.25; §7.2, p.68; §8.1, p.72.

- BMS1: Proposition 6.7, p.290.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Semistable AΩ Frobenius

`AInfCohomology:AI.6/aomega-frobenius` · theorem · declaration `Semistable.aOmegaFrobenius`

**Statement.** The Frobenius automorphism of the period sheaf A_inf,X induces φ_A^*AΩ_𝔛:=AΩ_𝔛⊗^L_{A_inf,φ_A}A_inf≃Lη_{ξ̃}AΩ_𝔛→AΩ_𝔛 in D^{≥0}(𝔛_ét,A_inf) (CK (2.2.5)). The linearized map becomes an isomorphism after inverting ξ̃ (CK (2.2.6)); it need not be an integral equivalence. It is compatible with the pullback maps of aomega. Compatibility with products is not asserted: CK does not state it.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5; no properness is needed.

**Proof or construction.**

1. φ_A(μ)=ξ̃·μ, so Lη_{φ_A(μ)}≅Lη_{ξ̃}∘Lη_μ (BMS1 Lemma 6.11; AI.1). φ_A is an automorphism of A_inf and the Frobenius of A_inf,X is an automorphism semilinear over it, so φ_A^*AΩ_𝔛≅Lη_{φ_A(μ)}Rν_*A_inf,X≅Lη_{ξ̃}AΩ_𝔛 (CK (2.2.5); AI.1/derived-decalage).

2. AΩ_𝔛 lies in D^{≥0} and H⁰(AΩ_𝔛)=ν_*A_inf,X has no ξ̃-torsion, because ξ̃ divides φ_A(μ) and μ is a nonzerodivisor on A_inf of a perfectoid ring (BMS1 Proposition 3.17(ii)); so BMS1 Lemma 6.10 (AI.1) gives the canonical map Lη_{ξ̃}AΩ_𝔛→AΩ_𝔛.

3. After inverting ξ̃ the map is an isomorphism, since Lη commutes with the flat localisation A_inf→A_inf[1/ξ̃] (BMS1 Lemma 6.14; AI.1) and Lη_{ξ̃} is the identity where ξ̃ is invertible (CK (2.2.6)).

4. Compatibility with pullback (not stated in CK): the three constructions above are defined on torsion-free representatives and commute with the exact pullback functors used for the functoriality of aomega.

**Acceptance.**

- On the local Koszul model K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)=η_μK_{A(R)}(δ₁−1,…,δ_d−1) of local-edge the Frobenius acts in degree j by ξ̃^j·φ (an element μ^j·x is sent to φ_A(μ)^j·φ(x)=μ^j·ξ̃^j·φ(x)); it is an isomorphism only after inverting ξ̃ and reduces modulo μ to p^j·φ, since ξ̃≡p modulo μ.

**Direct prerequisites.** `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.1`, `AInfCohomology:AI.1/derived-decalage`.

**Sources.**

- CK: §2.1, p.8; §2.2, (2.2.5), p.9; §2.2, (2.2.6), p.9; §7.2, p.68.

- BMS1: Lemma 6.10, p.292; Lemma 6.11, p.292.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Log Hodge–Tate reduction

`AInfCohomology:AI.6/hodge-tate-comparison` · theorem · declaration `Semistable.hodgeTateComparison`

Atlas planet: **Log Hodge–Tate comparison**.

**Statement.** AΩ_𝔛⊗^L_{A_inf,θ̃}O_C≃Ω̃_𝔛:=Lη_{ζ_p−1}Rν_*Ô_X^+, the décalage being for the ideal sheaf (ζ_p−1)O_𝔛,ét (CK Theorem 4.2). For every i≥0 the O_𝔛,ét-module H^i(Ω̃_𝔛) is locally free, of rank binom(d,i) at a closed point of 𝔛_k̄ where 𝔛_k̄ has dimension d, and H^0(Ω̃_𝔛)=O_𝔛 via ν^♯ (CK Proposition 4.4); for i>0 the cup product induces ∧^iH^1(Ω̃_𝔛)≅H^i(Ω̃_𝔛) (CK Proposition 4.8). The map Ω¹_{𝔛/O_C}{−1}→H^1(Ω̃_𝔛) of CK (4.10.3), an isomorphism over the smooth locus 𝔛^sm, extends uniquely from 𝔛^sm to an isomorphism Ω¹_{𝔛/O_C,log}{−1}≅H^1(Ω̃_𝔛), and this induces Ω^i_{𝔛/O_C,log}{−i}≅H^i(Ω̃_𝔛) for every i≥0, with multiplication corresponding to exterior product (CK Theorem 4.11). Here {1} denotes the tensor product with the free rank-one O_C-module O_C{1}=lim_n Ω¹_{O_C/Z_p}[p^n] (transition maps multiplication by p).

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 (no properness or quasi-compactness), with the log structure of divisorial-log.

**Proof or construction.**

1. CK Theorem 4.2. The kernel of θ̃ on the period sheaf is generated by the nonzerodivisor ξ̃, so the projection formula (Stacks Project 0944) gives Rν_*A_inf,X⊗^L_{A_inf,θ̃}O_C≅Rν_*Ô⁺; since θ̃(μ)=ζ_p−1 this induces the map, and by aomega ((4.1.2)) it suffices to show that its presheaf version is an isomorphism on each 𝔘=Spf(R) of 𝔛^psh_ét. There nonintegral-annihilation (b) with (3.20.1) shows that the cohomology of RΓ_cont(Δ,A_inf(R_∞))⊗^L A_inf/μ is p-torsion-free, so, ξ̃ being congruent to p modulo μ, the base-change lemma for Lη (CK Lemma 3.24; AI.1) gives Lη_μRΓ_cont(Δ,A_inf(R_∞))⊗^L_{A_inf,θ̃}O_C≅Lη_{ζ_p−1}RΓ_cont(Δ,R_∞). The edge maps (3.3.1) and (3.15.1) are compatible, so local-edge (CK Theorem 3.20) and structure-sheaf-edge (CK Theorem 3.9) conclude.

2. CK Propositions 4.4 and 4.8. Étale locally, by CK Lemma 3.7 and structure-sheaf-edge (Proposition 3.8, Theorem 3.9), H^i_cont(Δ,R_∞) modulo its (ζ_p−1)-torsion is H^i_cont(Δ,R)≅R^{binom(d,i)}, compatibly with étale maps R→R′ ((4.4.3)–(4.4.5)); this gives local freeness, and for i=0 that R=(R_∞)^Δ, the complement M_∞^Δ being p-torsion-free and killed by ζ_p−1. The edge maps are compatible with cup products, and H^i_cont(Δ,R)≅∧^i(R^d) by BMS1 Lemmas 7.3 and 7.5 (AI.3).

3. CK §§4.9–4.10 and Theorem 4.11. The p-completed cotangent complex of Ô⁺ over Z_p is Ô⁺{1}[1] ((4.9.1): BMS1 Lemma 3.14; Gabber–Ramero, Almost ring theory, 6.5.12(ii); Fontaine, Formes différentielles et modules de Tate des variétés abéliennes sur les corps locaux, Théorème 1′(ii)), and functoriality of the cotangent complex gives Ω¹_{𝔛/O_C}{−1}→R¹ν_*Ô⁺→H^1(Ω̃_𝔛) ((4.10.2)), whose restriction to 𝔛^sm is an isomorphism onto (ζ_p−1)·H^1(Ω̃_𝔛) by the smooth case (BMS1 Proposition 8.15; AI.4); dividing by ζ_p−1 gives (4.10.3). For the extension (CK §4.15) uniqueness allows one to assume that 𝔛 is the chart, which is an open of the p-adic completion of a proper flat scheme 𝒳 over the integral closure of W(k̄) with Zariski-local coordinates (1.5.2). Formal GAGA over O_C (CK Theorem 4.12 and Remark 4.13, after Fujiwara–Kato; it has no supplier among the prerequisites) algebraises (4.10.3) to a map f of vector bundles on 𝒳_{O_C}; this is the only use of formal GAGA, and it serves (4.11.1) only. By adic GAGA and Scholze's isomorphism between R¹ν_*Ô⁺[1/p] and Ω¹ on the smooth proper generic fibre (CK Claim 4.15.1), source and target of f_C are isomorphic vector bundles, so the determinant of the generically surjective f_C is a nowhere vanishing constant on each component and f_C is an isomorphism; hence f is an isomorphism over the smooth locus, whose complement has codimension ≥2, the target is the unique vector bundle extension of its restriction (EGA IV₂ 5.10.5 with limit arguments), and it is identified with Ω¹_log{−1} using divisorial-log (Claims 1.6.1, 1.6.3) and log smoothness (Kato, Logarithmic structures of Fontaine–Illusie, 3.7(2) and 3.10; CR.5). Then (4.4.1) and Proposition 4.8 give (4.11.2).

**Acceptance.**

- At a node dlogT₀+dlogT₁=0, so Ω^1_log has rank 1; ordinary singular differentials are the wrong answer.

**Direct prerequisites.** `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/divisorial-log`, `AInfCohomology:AI.6/structure-sheaf-edge`, `AInfCohomology:AI.6/local-edge`, `AInfCohomology:AI.6/nonintegral-annihilation`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.1`, `AInfCohomology:AI.3`, `AInfCohomology:AI.4`, `AdicSpacesPartII:R3`.

**Sources.**

- CK: Theorem 4.2, (4.2.1), p.25; Theorem 4.2 (proof), p.25; Proposition 4.4, p.26; Proposition 4.8, p.27; §4.10, p.28; §4.10, (4.10.3), p.28; Theorem 4.11, p.28; Theorem 4.12, p.29; §4.15, p.30; Claim 4.15.1 (proof), p.30.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Derived completeness and sheaf property of AΩ

`AInfCohomology:AI.6/aomega-sheaf-completeness` · theorem · declaration `Semistable.aOmegaSheafCompleteness`

**Statement.** (a) If 𝔛 is affine, connected and admits a coordinate map (1.5.1), then for every i the presheaf assigning H^i(𝔛′^ad_C,Ô⁺)/H^i(𝔛′^ad_C,Ô⁺)[ζ_p−1] to an affine étale 𝔛-scheme 𝔛′ is a sheaf (CK Remark 4.5). (b) For every 𝔛 as in CK §1.5, AΩ_𝔛 is derived ξ-adically complete and the adjunction map AΩ^psh→Rφ_*(AΩ_𝔛)≅Rφ_*φ⁻¹(AΩ^psh) is an isomorphism (CK Corollary 4.6). Hence RΓ(𝔘_ét,AΩ_𝔛)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X) for every object 𝔘 of 𝔛^psh_ét, and RΓ_Ainf(𝔛) is derived ξ-adically complete. (c) If the coordinate morphisms (1.5.1) exist Zariski locally on 𝔛 (for instance if 𝔛 is smooth over O_C, or Zariski locally arises from a strictly semistable scheme over a discrete valuation ring), then H^i(Ω̃_{𝔛_Zar})≅H^i(Ω̃_𝔛)|_{𝔛_Zar} for every i, the identifications of hodge-tate-comparison and log-de-rham hold for AΩ_{𝔛_Zar}, AΩ_{𝔛_Zar} is derived ξ-adically complete, and RΓ(𝔛_Zar,AΩ_{𝔛_Zar})≅RΓ(𝔛_ét,AΩ_𝔛) (CK Remarks 4.5 and 4.16, Theorems 4.2 and 4.17, Corollary 4.21, Example 4.22).

**Additional hypotheses.**

- 𝔛 is as in CK §1.5; (a) and (c) carry the additional hypotheses stated in them. AΩ^psh, φ and AΩ_{𝔛_Zar} are those of aomega; Ω̃_{𝔛_Zar} is defined as Ω̃_𝔛 with the Zariski site in place of the étale site.

**Proof or construction.**

1. (a): by the proof of CK Proposition 4.4 in hodge-tate-comparison ((4.4.3)–(4.4.5)), for 𝔛=Spf(R) with coordinates and an affine étale 𝔛′=Spf(R′), H^i(𝔛′^ad_C,Ô⁺) modulo its (ζ_p−1)-torsion is the base change to R′ of the free R□-module H^i((Spf R□)^ad_C,Ô⁺) modulo its (ζ_p−1)-torsion, compatibly with restriction; so the presheaf is the sheaf attached to a free module, namely H^i(Ω̃_𝔛).

2. (b), reduction: φ⁻¹∘Rφ_*≅id, so it suffices to prove that AΩ^psh→Rφ_*φ⁻¹(AΩ^psh) is an isomorphism; the derived ξ-completeness of AΩ^psh (aomega) then passes to AΩ_𝔛. For this one may assume 𝔛 affine, connected, with a coordinate map. AΩ^psh is derived ξ̃-adically complete (aomega), so by the analogue for 𝔛^psh_ét of BMS1 Lemma 9.15 (a derived limit of sheaves is a sheaf; AI.3) and the five lemma it suffices that AΩ^psh⊗^L A_inf/ξ̃→Rφ_*φ⁻¹(AΩ^psh⊗^L A_inf/ξ̃) is an isomorphism.

3. (b), the case modulo ξ̃: by the proof of CK Theorem 4.2 (presheaf form (4.2.2), hodge-tate-comparison), AΩ^psh⊗^L A_inf/ξ̃≅Lη_{ζ_p−1}Rφ_*Rν_*Ô⁺, whose cohomology presheaves are the presheaves of (a); these are sheaves, and being vector bundles (CK Proposition 4.4) they have no higher cohomology on affine objects, so the adjunction map is an isomorphism. CK states only that the cohomology presheaves are sheaves; the vanishing of their higher cohomology on affines is left implicit there.

4. Sections: RΓ(𝔘_ét,AΩ_𝔛)=RΓ(𝔘,Rφ_*AΩ_𝔛)≅RΓ(𝔘,AΩ^psh), and (4.1.3) of aomega gives the formula; RΓ(𝔛_ét,−) commutes with derived limits (Stacks Project 0A07), so RΓ_Ainf(𝔛) is derived ξ-adically complete.

5. (c): the sheaf property (a) for Zariski opens gives (4.5.1). The proofs of hodge-tate-comparison and log-de-rham apply with the Zariski presheaf site of opens admitting coordinates (CK Theorem 4.2, second sentence; Remark 4.16; Theorem 4.17, second sentence, whose proof CK describes as the same), and so do the two preceding steps, giving the Zariski analogue of Corollary 4.6. Then (CK Corollary 4.21) the reduction modulo ξ of RΓ(𝔛_Zar,AΩ_{𝔛_Zar})→RΓ(𝔛_ét,AΩ_𝔛) is RΓ(𝔛_Zar,Ω^•_log)→RΓ(𝔛_ét,Ω^•_log) by log-de-rham, an isomorphism because the Ω^i_log are vector bundles; both sides being derived ξ-complete, the map is an isomorphism.

**Acceptance.**

- For 𝔛=Spf O_C, AΩ^psh and AΩ_𝔛 have global sections A_inf in degree 0, which is ξ-adically complete.

- For the torus chart 𝔘=Spf O_C{t^{±1}}, (b) gives RΓ(𝔘_ét,AΩ_𝔛)≅K_{A(R□)}((δ−1)/μ): H⁰=A_inf and the X^n-summand of H¹ is A_inf/(([ε]^n−1)/μ).

- (c) applies to every smooth 𝔛 (CK Example 4.22); there it identifies the étale-site RΓ_Ainf(𝔛) with the Zariski-site complex of BMS1.

**Direct prerequisites.** `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.3`.

**Sources.**

- CK: Remark 4.5, p.26; Corollary 4.6, p.26; Corollary 4.6 (proof), p.26; Corollary 4.6 (proof), p.27; Theorem 4.2 (second sentence), p.25; Remark 4.16, p.30; Theorem 4.17 (second sentence), p.30; Corollary 4.21, p.31; Corollary 4.21 (proof), p.32; Example 4.22, p.32.

- BMS1: Lemma 9.15, p.331.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Log de Rham specialization

`AInfCohomology:AI.6/log-de-rham` · theorem · declaration `Semistable.logDeRhamComparison`

Atlas planet: **Log de Rham comparison**.

**Statement.** AΩ_𝔛⊗^L_{A_inf,θ}O_C≃Ω^•_{𝔛/O_C,log} in D(𝔛_ét,O_C) (CK Theorem 4.17). Under this identification the term in degree i is Ω^i_{𝔛/O_C,log} and the differential is the log de Rham differential, obtained as the Bockstein of the θ̃-reduction; in degree 0 it is f↦df. Consequently, for every 𝔛 as in CK §1.5, RΓ_Ainf(𝔛)⊗^L_{A_inf,θ}O_C≃RΓ_logdR(𝔛/O_C):=RΓ(𝔛_ét,Ω^•_{𝔛/O_C,log}), with the ordinary derived tensor product (CK Corollary 4.18). Compatibility of these identifications with products, as isomorphisms in D(𝔛_ét,O_C), is not asserted. CK prove only a local form, which crystalline-de-rham-square uses: on the Koszul complexes η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) the specialisation is represented by a map of differential graded algebras to Ω^•_{Spf(R)/O_C,log} that is θ in degree 0 (proof of CK Proposition 5.41, by BMS1 Lemmas 6.13 and 7.5).

**Additional hypotheses.**

- 𝔛 is as in CK §1.5; neither properness nor quasi-compactness is needed.

**Proof or construction.**

1. Since φ_A(μ)=ξ̃·μ, aomega-frobenius gives AΩ_𝔛⊗^L_{A_inf,θ}O_C≅(φ_A^*AΩ_𝔛)⊗^L_{A_inf,θ̃}O_C≅(Lη_{ξ̃}AΩ_𝔛)⊗^L_{A_inf,θ̃}O_C (BMS1 Lemma 6.11), and AI.1/bockstein-reduction (BMS1 Proposition 6.12) identifies the right side with the complex whose i-th term is H^i(AΩ_𝔛⊗^L_{A_inf,θ̃}O_C)⊗(Ker θ̃/(Ker θ̃)²)^{⊗i}, with Bockstein differentials.

2. Ker θ̃/(Ker θ̃)²≅O_C{1}: the p-completed cotangent complex of A_inf over Z_p vanishes because O_C^♭ is perfect, and that of O_C over Z_p is O_C{1}[1] by CK (4.9.1) for Spf O_C; hence that of O_C over A_inf (via θ̃) is O_C{1}[1] (Illusie, Complexe cotangent et déformations I, III.3.2.4(iii)). With hodge-tate-comparison ((4.2.1) and (4.11.2)) the i-th term is Ω^i_{𝔛/O_C,log}.

3. Each Ω^i_{𝔛/O_C,log} is a vector bundle and no nonzero local section of a vector bundle vanishes on 𝔛^sm, so the Bockstein differentials agree with those of Ω^•_log as soon as they do over 𝔛^sm, where this is the smooth case with its differential (BMS1 Theorem 14.1(ii), or Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic p, proof of Proposition 7.9; AI.4). This proves CK Theorem 4.17.

4. CK Corollary 4.18: apply RΓ(𝔛_ét,−) and the projection formula (Stacks Project 0944) for the perfect A_inf-module O_C=A_inf/(ξ) (E1/presentability-and-derived-tensor); CR.5 supplies the log de Rham complex.

**Acceptance.**

- On T₀T₁=p^q the relation dlogT₀+dlogT₁=0 is respected by the actual differential.

- For 𝔛=Spf O_C{t^{±1}} the global statement reads RΓ_Ainf(𝔛)⊗^L_θ O_C≃[O_C{t^{±1}}→O_C{t^{±1}}·dlog t], Σaₙtⁿ↦Σn·aₙtⁿ·dlog t; H¹ modulo p is free of infinite rank over O_C/p on the classes of tⁿ·dlog t with p∣n, so no finiteness holds without properness.

**Direct prerequisites.** `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/aomega-frobenius`, `AInfCohomology:AI.1/bockstein-reduction`, `AInfCohomology:AI.4`, `CrystallineCohomology:CR.5`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources.**

- CK: Theorem 4.17, (4.17.1), p.30; Theorem 4.17 (proof), p.30; Theorem 4.17 (proof), p.31; Corollary 4.18, p.31.

- BMS1: Theorem 14.1, p.388.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Perfect semistable A_inf cohomology

`AInfCohomology:AI.6/proper-perfectness` · theorem · declaration `Semistable.properPerfectness`

**Statement.** If 𝔛 is proper over O_C, RΓ_Ainf(𝔛) is a perfect A_inf-complex (CK Corollary 4.20). If moreover 𝔛_k̄ has dimension at most d, then H^i_Ainf(𝔛)=0 for i∉[0,2d] (CK Theorem 7.4, under CK §7.1) and RΓ_Ainf(𝔛) is represented by a complex of finite free A_inf-modules in degrees 0,…,2d. This does not imply that its cohomology modules are free.

**Additional hypotheses.**

- 𝔛 is proper over O_C; this is needed for both assertions. The bound dim 𝔛_k̄≤d is needed only for the range assertion (CK §7.1 assumes 𝔛_k̄ purely d-dimensional).

**Proof or construction.**

1. By log-de-rham (CK Corollary 4.18), RΓ_Ainf(𝔛)⊗^L_{A_inf}A_inf/ξ≅RΓ_logdR(𝔛/O_C). The sheaves Ω^i_{𝔛/O_C,log} are vector bundles (CR.5), so by the finiteness theorem for proper formal schemes over O_C (Ullrich, The direct image theorem in formal and rigid geometry, 5.3) and the Hodge–de Rham spectral sequence the O_C-modules H^j(RΓ_logdR(𝔛/O_C)) are finitely presented, hence perfect (Stacks Project 0ASP), and RΓ_logdR(𝔛/O_C) is a perfect O_C-complex (Stacks Project 066U).

2. RΓ_Ainf(𝔛) is derived ξ-adically complete (aomega-sheaf-completeness, CK Corollary 4.6). A derived ξ-complete complex whose reduction modulo ξ is perfect is perfect (Stacks Project 09AW; AI.5). This is CK Corollary 4.20. Formal GAGA is not used in this proof; it enters only through hodge-tate-comparison.

3. Range. The vanishing of H^i_Ainf(𝔛) outside [0,2d] is CK Theorem 7.4. The finite free representative is not in CK; it follows thus: A_inf is local with residue field k̄, and by Corollary 4.18 and base change through O_C/p (𝔛⊗O_C/p is a quasi-compact separated scheme, flat over O_C/p, and the Ω^i_log are flat) RΓ_Ainf(𝔛)⊗^L_{A_inf}k̄≅RΓ(𝔛_k̄,Ω^•_{𝔛_k̄/k̄,log}), which lies in degrees [0,2d] because Ω^i_log vanishes for i>d and coherent cohomology of 𝔛_k̄ vanishes above its dimension. A perfect complex over a local ring is represented by a bounded complex of finite free modules whose differentials vanish modulo the maximal ideal, the rank in degree i being the dimension of H^i of its reduction to the residue field (AI.5).

**Acceptance.**

- A perfect two-term multiplication-by-p complex has torsion cohomology; the theorem must allow it.

- Properness is necessary: for 𝔛=Spf O_C{t^{±1}}, the θ-specialisation of RΓ_Ainf(𝔛) has H¹ whose reduction modulo p is free of infinite rank over O_C/p (log-de-rham), so RΓ_Ainf(𝔛) is not perfect.

**Direct prerequisites.** `AInfCohomology:AI.6/aomega-sheaf-completeness`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.5`, `CrystallineCohomology:CR.5`.

**Sources.**

- CK: Corollary 4.20, p.31; Corollary 4.20 (proof), p.31; §7.1, p.68; Theorem 7.4, p.69; Theorem 7.4 (proof), p.69.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Finite-level crystalline period rings A_cris^(m)

`AInfCohomology:AI.6/finite-level-acris` · definition · declaration `Semistable.finiteLevelAcris`

**Statement.** For an integer m≥1 let A_cris^{0,(m)}⊂A_inf[1/p] be the A_inf-subalgebra generated by the elements ξ^s/s! with s≤m, and let A_cris^(m) be its p-adic completion (CK §3.26; it is the ring of BMS1 Lemma 12.8). Thus A_cris^{0,(m)} is contained in the subalgebra A_cris^0 generated by all ξ^n/n!, A_cris^(m)=A_inf for m<p, A_cris^0 is the union of the A_cris^{0,(m)}, and A_cris is the p-adic completion of colim_m A_cris^(m) (CK (5.1.1)). In the local setup of CK §3.1 put A_cris^(m)(R):=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris^(m)(R_∞):=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m), the completions being (p,μ)-adic, equivalently p-adic if m≥p (CK §3.27). The ring A_cris^(m) carries the surjection θ to O_C extending that of A_inf; the three rings carry Frobenius endomorphisms compatible with each other and with varying m; and Δ acts continuously, Frobenius-equivariantly and A_cris^(m)-linearly on A_cris^(m)(R) and A_cris^(m)(R_∞). More generally, for an affinoid perfectoid Spa(R′_∞[1/p],R′_∞) over Spa(C,O_C), such as the R_{Σ,Λ,∞} of all-coordinates, put A_cris^(m)(R′_∞):=A_inf(R′_∞)⊗̂_{A_inf}A_cris^(m), the completion being (p,μ)-adic, equivalently p-adic if m≥p (CK (5.19.3)); it is the completion of the A_inf(R′_∞)-subalgebra A_cris^{0,(m)}(R′_∞)≅A_inf(R′_∞)⊗_{A_inf}A_cris^{0,(m)} of A_inf(R′_∞)[1/p] generated by the ξ^n/n! with n≤m (CK (5.35.1), (5.35.2)), it is p-torsion-free and μ-torsion-free, A_cris^(m)(R′_∞)/μ is p-adically complete (CK §5.19), and the ring homomorphisms A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR⁺(R′_∞) are injective, where B_dR⁺(R′_∞) is the ξ-adic completion of A_inf(R′_∞)[1/p] (CK Proposition 5.36, (5.36.1)).

**Additional hypotheses.**

- m≥1 is an integer. For the relative rings: X=Spf(R) with an étale coordinate map as in CK (3.1.1), with A(R) of ainf-chart-lift and A_inf(R_∞) of monomial-splitting.

**Proof or construction.**

1. Definition and first properties (CK §3.26): A_cris^{0,(m)} is p-torsion-free as a subring of A_inf[1/p], hence so is A_cris^(m); for m<p the generators lie in A_inf because s! is a p-adic unit for s<p; for m≥p, μ=ξ·φ_A⁻¹(μ) gives μ^p/p!=(ξ^p/p!)·φ_A⁻¹(μ)^p∈A_cris^{0,(m)}, so μ^p∈pA_cris^(m) and the p-adic and (p,μ)-adic topologies agree. θ extends because θ(ξ)=0 (AI.0:integral).

2. (3.26.2) is BMS1 Lemma 12.8(ii) (AI.4); taking the inverse limit over n of the exact sequences 0→(A_cris^(m)/p^n)[μ]→A_cris^(m)/p^n→A_cris^(m)/p^n→A_cris^(m)/(μ,p^n)→0 ((3.26.3)) gives (3.26.4).

3. Frobenius (CK §3.26): φ_A(ξ)=ξ̃ is congruent to ξ^p modulo p, and for m≥p, ξ^p=p!·(ξ^p/p!)∈pA_cris^{0,(m)}; hence ξ̃∈pA_cris^{0,(m)}, ξ̃^s/s!∈A_cris^{0,(m)} for all s, and φ_A preserves A_cris^{0,(m)}.

4. Relative rings (CK §3.27): the monomial decomposition of A_inf(R□_∞) (monomial-splitting) gives (3.27.1), and A_cris^(m)(R_∞) is (p,μ)-adically formally étale over A_cris^(m)(R□_∞); so (3.26.2) holds for both, (3.27.2) follows as (3.26.4) did, and A_cris^(m)(R_∞) is p-torsion-free. By (3.14.5), A_cris^(m)(R) is a direct summand of A_cris^(m)(R_∞). The Frobenius, the Δ-action and the endomorphisms (δ−1)/μ come from ainf-chart-lift by base change; for m<p, CK Lemma 3.13 gives A_cris^(m)(R)=A(R) and A_cris^(m)(R_∞)=A_inf(R_∞).

5. CK Proposition 3.29 (m≥p): Z_p[[T]]→A_inf, T↦[ε^{1/p}]−1, is faithfully flat (BMS1 Remark 4.31), and A_cris^(m)(R_∞)/(μ,p^n) is the base change of a module M over Z_p[[T]]/((T+1)^p−1,p^n) along the flat map to A_inf(R_∞)/(μ,p^n) (CK Lemma 3.13); so its φ_A⁻¹(μ)-torsion is the base change of M[T], and filtering M[T] p-adically reduces the claim to R_∞^♭/φ_A⁻¹(μ) having no nonzero m^♭-torsion, which is structure-sheaf-edge (b). The statement for A_cris^(m)(R_∞)/μ follows by p-adic completeness ((3.27.2)).

6. Colimit (CK (5.1.1)): A_cris^0 is the union of the A_cris^{0,(m)} by definition, and p-adic completion gives A_cris; CR.0 supplies A_cris^0 as the divided power envelope of A_inf→O_C/p and A_cris as its p-adic completion (CK §5.1).

7. General affinoid perfectoid R′_∞ (CK §5.19, §5.35, Proposition 5.36): A_inf(R′_∞) is (p,μ)-adically formally flat over A_inf (CK Lemma 3.13), which gives p-torsion-freeness, and (3.26.2), (3.26.3) give μ-torsion-freeness and the completeness of the quotient by μ. Since (p,ξ) is a regular sequence on A_inf(R′_∞), the quotient of A_inf(R′_∞)[T^n/n!]_{n≥1} by A_inf(R′_∞)[T^n/n!]_{m≥n≥1} has no (T−ξ)-torsion, which gives (5.35.1) and (5.35.2). Injectivity: A_inf(R′_∞)[1/p] is ξ-adically separated, so it and A_cris^{0,(m)}(R′_∞) inject into B_dR⁺(R′_∞). For A_cris(R′_∞) use the ideals Fil_n⁰ of A_cris⁰(R′_∞) generated by the ξ^{n′}/n′! with n′≥n: each quotient A_cris⁰(R′_∞)/Fil_n⁰ is p-torsion-free and p-adically complete (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.9(2), whose proof applies to R′_∞), the filtration is separated modulo p by the explicit description (5.36.4) of A_cris⁰(R′_∞)/p, hence its completion is a separated filtration of A_cris(R′_∞), and A_cris⁰(R′_∞)/Fil_n⁰ injects into B_dR⁺(R′_∞)/ξ^n. For A_cris^(m)(R′_∞)→A_cris(R′_∞) the same argument is run with the induced filtration of A_cris^{0,(m)}(R′_∞): the kernel lies in p·A_cris^(m)(R′_∞), and A_cris(R′_∞) is p-torsion-free while A_cris^(m)(R′_∞) is p-adically separated.

**Uses.**

- `CK §3.28, Propositions 3.32 and 3.33, Theorem 3.34`: The base-changed edge map and its Lη_μ-isomorphism are stated for A_cris^(m)(R_∞) with m≥p.

- `CK Proposition 5.6, Corollary 5.7, Proposition 5.13, Lemmas 5.15–5.16`: Lη_μ and the completed base change are commuted at finite level and A_cris is reached by completed colimit over m.

- `AInfCohomology:AI.6/finite-pd-base-change and AInfCohomology:AI.6/local-crystalline`: Both are stated for A_cris^(m)(R_∞) and A_cris^(m)(R).

**API.**

- `Semistable.finiteLevelAcris.small` (compatibility): For m<p: A_cris^{0,(m)}=A_inf, A_cris^(m)=A_inf, A_cris^(m)(R)=A(R) and A_cris^(m)(R_∞)=A_inf(R_∞).

- `Semistable.finiteLevelAcris.topology` (characterisation): For m≥p: μ^p/p!∈A_cris^(m), so the p-adic and (p,μ)-adic topologies of A_cris^(m) agree, and for each n one has A_cris^(m)/p^n=A_cris^(m)/(p^n,μ^{n′}) for n′ large.

- `Semistable.finiteLevelAcris.intertwined` (relation): The systems of ideals (p^nA_cris^(m))_n and ({x:μx∈p^nA_cris^(m)})_n are intertwined; equivalently, for every n the map (A_cris^(m)/p^{n′})[μ]→A_cris^(m)/p^n vanishes for n′ large (CK (3.26.2)). The same holds for A_cris^(m)(R□_∞) and A_cris^(m)(R_∞).

- `Semistable.finiteLevelAcris.mu_torsion_free` (structure): A_cris^(m) and A_cris^(m)(R_∞) are p-torsion-free and μ-torsion-free, and A_cris^(m)/μ and A_cris^(m)(R_∞)/μ are p-adically complete (CK (3.26.4), (3.27.2)).

- `Semistable.finiteLevelAcris.theta` (projection): θ:A_inf→O_C extends to a surjection θ:A_cris^(m)→O_C (CK (3.26.1)), compatibly in m.

- `Semistable.finiteLevelAcris.frobenius` (structure): φ_A preserves A_cris^{0,(m)} and induces a Frobenius endomorphism of A_cris^(m) which, through θ, is compatible with the absolute Frobenius of O_C/p; A_cris^(m)(R) and A_cris^(m)(R_∞) carry compatible A_cris^(m)-semilinear Frobenius endomorphisms, compatible as m varies.

- `Semistable.finiteLevelAcris.monomials` (characterisation): A_cris^(m)(R□_∞) is the (p,μ)-adically completed direct sum of A_cris^(m)·X^a over the normalized exponents (CK (3.27.1)); A_cris^(m)(R_∞) is (p,μ)-adically formally étale over it, and A_cris^(m)(R) is a direct summand of A_cris^(m)(R_∞) as an A_cris^(m)(R)-module.

- `Semistable.finiteLevelAcris.delta_trivial_mod_mu` (relation): Δ acts continuously, Frobenius-equivariantly and A_cris^(m)-linearly on A_cris^(m)(R) and A_cris^(m)(R_∞). For δ∈Δ the endomorphism (δ−1)/μ of A(R) induces an A_cris^(m)-linear endomorphism (δ−1)/μ of A_cris^(m)(R) with δ=1+μ·(δ−1)/μ; hence Δ acts trivially on A_cris^(m)(R)/μ.

- `Semistable.finiteLevelAcris.no_almost_torsion` (relation): For m≥p, A_cris^(m)(R_∞)/(μ,p^n) for every n and A_cris^(m)(R_∞)/μ have no nonzero W(m^♭)-torsion (CK Proposition 3.29); for m<p this is CK (3.14.1).

- `Semistable.finiteLevelAcris.colimit` (compatibility): A_cris is the p-adic completion of colim_m A_cris^(m), Frobenius-equivariantly and compatibly with the maps θ (CK (5.1.1)).

- `Semistable.finiteLevelAcris.injective` (characterisation): For an affinoid perfectoid Spa(R′_∞[1/p],R′_∞) over Spa(C,O_C) and m≥1 the maps A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR⁺(R′_∞)=(A_inf(R′_∞)[1/p])^ (ξ-adic completion) are injective; in particular none of these rings has nonzero μ-torsion, μ/ξ being a unit of B_dR⁺(R′_∞) (CK Proposition 5.36).

**Unit tests.**

- `Semistable.finiteLevelAcris.below_p` (degenerate): For m<p every generator ξ^s/s! with s≤m lies in A_inf, since s! is a unit of Z_p; hence A_cris^{0,(m)}=A_inf.

- `Semistable.finiteLevelAcris.first_divided_power` (computation): ξ^p/p! lies in A_cris^{0,(p)} but not in A_inf: A_inf/p=O_C^♭ is a domain in which the image of ξ is nonzero, so ξ^p is not divisible by p in A_inf. Moreover A_cris^{0,(p)}≅A_inf[T]/(p!·T−ξ^p) via T↦ξ^p/p!.

- `Semistable.finiteLevelAcris.mu_divided_power` (computation): For m≥p: μ=ξ·φ_A⁻¹(μ) gives μ^p/p!=(ξ^p/p!)·φ_A⁻¹(μ)^p∈A_cris^{0,(m)}, hence μ^p∈p·A_cris^(m).

- `Semistable.finiteLevelAcris.frobenius_xi` (computation): For m≥p: ξ̃=φ_A(ξ) is congruent to ξ^p modulo p·A_inf and ξ^p=p!·(ξ^p/p!), so ξ̃/p∈A_cris^{0,(m)} and φ_A(ξ^s/s!)=(p^s/s!)·(ξ̃/p)^s∈A_cris^{0,(m)} for every s.

- `Semistable.finiteLevelAcris.mod_p_torsion` (computation): A_cris^(p)/p≅O_C^♭[T]/(ξ̄^p), with ξ̄=(ε^{1/p}−1)^{p−1} the image of ξ; the image μ̄=(ε^{1/p}−1)^p of μ satisfies μ̄^{p−1}=ξ̄^p=0, so A_cris^(p)/p has nonzero μ-torsion (the class of 1 if p=2, of μ̄^{p−2} if p>2), while A_cris^(p) itself is μ-torsion-free.

- `Semistable.finiteLevelAcris.small_not_p_adic` (non-example): For m<p the p-adic and (p,μ)-adic topologies of A_cris^(m)=A_inf differ: no power of μ is divisible by p, because the image ε−1 of μ in the domain O_C^♭ is nonzero. So the statements made for m≥p with p-adic completions do not extend to m<p without replacing them by (p,μ)-adic ones.

**Acceptance.**

- For m<p the construction returns A_inf, A(R) and A_inf(R_∞).

- For m≥p the p-adic and (p,μ)-adic topologies of A_cris^(m) agree, and A_cris^(m)/p has nonzero μ-torsion although A_cris^(m) is μ-torsion-free; this is why (3.26.2) is needed to pass to the limit.

**Direct prerequisites.** `CrystallineCohomology:CR.0`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.6/monomial-splitting`, `AInfCohomology:AI.6/structure-sheaf-edge`, `AInfCohomology:AI.4`.

**Sources.**

- CK: §3.26, p.19; §3.26, p.20; §3.26, (3.26.4), p.20; §3.27, (3.27.2), p.20; §3.27, p.20; Proposition 3.29, p.21; §5.1, (5.1.1), p.32; §5.19, (5.19.3), p.42; §5.35, p.52; Proposition 5.36, p.52.

- BMS1: Lemma 12.8, p.364.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Finite PD décalage base change

`AInfCohomology:AI.6/finite-pd-base-change` · theorem · declaration `Semistable.finitePDBaseChange`

**Statement.** Let A_cris^(m), A_cris^(m)(R) and A_cris^(m)(R_∞)=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m) be as in finite-level-acris. For every m≥p: (a) the base change e⊗̂^L A_cris^(m): RΓ_cont(Δ,A_cris^(m)(R_∞))→RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m) of the edge map (CK (3.28.1)) becomes an isomorphism after Lη_μ (CK Theorem 3.34); (b) the natural map (Lη_μRΓ_cont(Δ,A_inf(R_∞)))⊗̂^L_{A_inf}A_cris^(m)→Lη_μRΓ_cont(Δ,A_cris^(m)(R_∞)) is an isomorphism, and both sides are the Koszul complex K_{A_cris^(m)(R)}((δ₁−1)/μ,…,(δ_d−1)/μ) (proof of CK Proposition 5.6); (c) consequently Lη_μ(RΓ_proét(X_C^ad,A_inf,X))⊗̂^L_{A_inf}A_cris^(m)≃Lη_μ(RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m)) (CK Proposition 5.6). The target of (a) is a completed tensor product of the cohomology of A_inf,X, not the cohomology of a sheaf of rings A_cris^(m) on the pro-étale site.

**Additional hypotheses.**

- X=Spf(R) with an étale coordinate map as in CK (3.1.1) (CK §5.5 moreover assumes X connected); m≥p; ⊗̂^L is the derived p-adic completion of the derived tensor product, as in CK (1.7.1); no unrestricted Lη/tensor commutation is asserted.

**Proof or construction.**

1. Base change of the edge map (CK §3.28): for m≥p the projection formula (Stacks Project 0944) with CK Lemmas 3.7 and 3.13 gives RΓ_cont(Δ,A_inf(R_∞))⊗̂^L_{A_inf}A_cris^(m)≅RΓ_cont(Δ,A_cris^(m)(R_∞)), whence the map (3.28.1); the completed tensor products are formed with E4/completed-sheaf-tensor in the topos of sets. [m^♭] kills the cohomology of Cone(e)⊗^L A_cris^(m)/p^n, hence of the completed cone (Stacks Project 0D6K), and CK Lemma 3.17 upgrades this to W(m^♭) ((3.28.2)).

2. CK Lemmas 3.30 and 3.31: for A_inf-modules satisfying the Mittag-Leffler condition (⋆) on the systems Tor_j^{A_inf}(−,A_cris^(m)/p^n), cohomology of a bounded complex commutes with −⊗̂_{A_inf}A_cris^(m); (⋆) holds for A_inf(R_∞) and A_inf(R_∞)/μ (CK Lemma 3.13), and for H^i_cont(Δ,A_inf(R_∞)/μ) and H^i_cont(Δ,N_∞) by nonintegral-annihilation (a)–(c), Lazard's theorem and the intertwining property (3.26.2) of finite-level-acris. This gives CK Proposition 3.32 (μ kills H^i_cont(Δ,N_∞⊗̂A_cris^(m))) and the identifications of CK Proposition 3.33.

3. CK Proposition 3.33, torsion: using (3.19.1), the decomposition (3.22.1), CK Corollary 3.23 and Proposition 3.29 (finite-level-acris), and approximation over Z_p[[T]] with T↦[ε^{1/p^j}]−1, H^i_cont(Δ,A_cris^(m)(R_∞)/μ) has no nonzero W(m^♭)-torsion. With (3.28.2) and the projection formula ((3.27.2)), the almost-to-integral criterion CK Lemma 3.18 (AI.1) gives (a).

4. (b) and (c), CK Proposition 5.6: the map of (c) exists because its target is derived p-adically complete (BMS1 Lemma 6.19; AI.1). By local-edge and (a) it suffices to prove (b). By nonintegral-annihilation (a) and CK Proposition 3.32 the summand N_∞ contributes to neither side. On the summand A(R), Δ acts trivially modulo μ on A(R) and on A_cris^(m)(R) (ainf-chart-lift, finite-level-acris), so by CK Lemma 3.7 both sides are Koszul complexes on the (δᵢ−1)/μ; the completed tensor product is termwise because each (p^n,μ^{n′}) is A(R)-regular with A(R)/(p^n,μ^{n′}) flat over A_inf/(p^n,μ^{n′}) (CK Lemma 3.13), and the two complexes agree termwise (CK §3.27).

**Acceptance.**

- For m<p, A_cris^(m)=A_inf and (a)–(c) reduce to local-edge; for m≥p the p-adic and (p,μ)-adic topologies of A_cris^(m) agree, which is what makes the completed tensor product of the A(R)-Koszul complex termwise.

- For R=O_C (d=0, Δ trivial) the three maps are the identity of A_cris^(m), which is p-adically complete and μ-torsion-free.

- The statement is for the rings A_cris^(m) with m≥p and derived p-completed tensor products; CK does not prove the analogue of (a) for A_cris itself, the W(m^♭)-torsion of the cohomology modulo μ being out of reach for A_cris/μ.

**Direct prerequisites.** `AInfCohomology:AI.6/local-edge`, `AInfCohomology:AI.6/nonintegral-annihilation`, `AInfCohomology:AI.6/finite-level-acris`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.0:integral`, `CrystallineCohomology:CR.0`, `AInfCohomology:AI.1`, `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, `EnhancedDerivedSheaves:E4`.

**Sources.**

- CK: §3.28, (3.28.1), p.21; Proposition 3.32, p.23; Proposition 3.32 (last sentence), p.23; Proposition 3.33, p.23; Proposition 3.33 (last sentence), p.23; Theorem 3.34, p.24; Proposition 5.6, p.34; Proposition 5.6 (proof), p.34; §5.5, p.34.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Local logarithmic derivations

`AInfCohomology:AI.6/log-derivations` · construction · declaration `Semistable.logDerivations`

**Statement.** On the chart polynomial ring, for a branch direction 1≤i≤r let D_i=X_i∂_i−X₀∂₀; for each torus pair Y_j,Z_j let D_j=Y_j∂_{Y_j}−Z_j∂_{Z_j}. These derivations kill ∏X_i−a (a in the coefficient ring) and Y_jZ_j−1, hence preserve the chart ideal, and they commute. On A(R□) they are the (p,μ)-adically continuous extensions of these derivations. On A(R) they are the basis ∂/∂log(X_i), i=1,…,d (d=r+s), dual to the basis dlog X₁,…,dlog X_d of the free A(R)-module Ω¹_{A(R)/A_inf,log} (CK (5.10.1)–(5.10.2)); equivalently, the unique A_inf-derivations of A(R) extending those of A(R□) along the (p,μ)-adically formally étale map A(R□)→A(R). By base change they give A_cris^(m)-derivations of A_cris^(m)(R)=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris-derivations of A_cris(R). The log de Rham complex Ω•_{A(R)/A_inf,log} is their Koszul complex (CK (5.10.3)), with degree-j Frobenius p^jφ. The derivations of the all-coordinates envelopes (CK §5.31) are constructed in all-coordinates-pd, not here.

**Additional hypotheses.**

- Spf R→Spf R□ is an étale coordinate map as in ainf-chart-lift (CK (5.5.1)), with Spf R connected (the local setting of CK §5.5). Indices distinguish the r branch directions from the s=d−r torus directions. The PD extensions are A_cris^(m)(R) of CK §3.27 (m≥1; A_cris^(m)=A_inf for m<p) and A_cris(R) of CK §5.8 and §5.11, not arbitrary completions.

**Proof or construction.**

1. Use Mathlib MvPolynomial.pderiv and the Leibniz rule to check the two defining relations: D_i(∏_{k≤r}X_k)=∏X_k−∏X_k=0 and D_j(Y_jZ_j)=0. Each derivation is diagonal on monomials (D_i(X^a)=(a_i−a₀)X^a), so the derivations preserve the chart ideal and commute.

2. By CK §5.9 (Kato, Logarithmic structures of Fontaine–Illusie, 3.5–3.6; supplied by CR.5:log-algebra) A(R□) is (p,μ)-adically formally log smooth over A_inf for the chart ℕ→ℕ^{r+1} of divisorial-log, and A(R) is formally étale over A(R□) (ainf-chart-lift). Hence Ω¹_{A(R)/A_inf,log}, formed as in CK §5.10 as the inverse limit of the log differentials modulo (p^n,μ^{n′}) (Ogus, Lectures on Logarithmic Algebraic Geometry, V.2.1.1; CR.5), is free on dlog X₁,…,dlog X_d. Define ∂/∂log(X_i) as the dual basis; the relation dlog X₀+…+dlog X_r=0 gives CK (5.10.2), which are the formulas of the first step. That these are the unique extensions of the polynomial derivations is not stated in CK; it follows from the density of the polynomial ring in A(R□) and the formal étaleness of A(R□)→A(R).

3. Form the Koszul complex with AI.1’s Koszul carrier and identify it with Ω•_{A(R)/A_inf,log} as in CK (5.10.3). Frobenius multiplies each dlog X_i by p (CK §5.9), so it acts as p^jφ in degree j; equivalently ∂/∂log(X_i)∘φ=p·φ∘∂/∂log(X_i). Base change along A_inf→A_cris^(m) (finite-level-acris) and A_inf→A_cris (CR.0) gives the derivations of CK Proposition 5.13 and the complex of CK §5.11.

**Uses.**

- `CK Lemma 5.15 and Proposition 5.16`: The exponential comparison relates these derivations to Δ-cochains.

- `CK §5.31`: The PD derivations of the all-coordinates envelopes extend these derivations.

- `CrystallineCohomology:CR.6`: Frobenius normalization must agree with the Hyodo–Kato export.

**API.**

- `Semistable.logDerivations.generators` (simp): D_i(X_i)=X_i, D_i(X₀)=−X₀ and all other branch values are zero; torus direction sends Y to Y and Z to −Z.

- `Semistable.logDerivations.relations` (relation): Each D annihilates ∏X_i−a and Y_jZ_j−1, hence descends to the quotient.

- `Semistable.logDerivations.frobenius` (compatibility): D_iφ=pφD_i; on the log differential complex the degree-j lift is p^jφ.

- `Semistable.logDerivations.dual_basis` (characterisation): On A(R) the derivations ∂/∂log(X_i), i=1,…,d, are the basis dual to dlog X₁,…,dlog X_d of Ω¹_{A(R)/A_inf,log}; they restrict on A(R□) to the continuous extensions of the D_i and commute with each other.

**Unit tests.**

- `Semistable.logDerivations.node` (computation): On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀X₁−a)=0 for every integer a.

- `Semistable.logDerivations.torus` (computation): On Z[Y,Z], (Y∂_Y−Z∂_Z)(YZ−1)=0.

- `Semistable.logDerivations.zero_rank` (degenerate): For r=s=0 there are no log directions, and the Koszul complex has only degree 0.

- `Semistable.logDerivations.monomial` (computation): On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀^aX₁^b)=(b−a)X₀^aX₁^b for all a,b≥0; in particular D(X₁)=X₁ and D(X₀)=−X₀, which fixes the normalisation.

**Acceptance.**

- The branch sum relation is killed; degree-one Frobenius multiplies by p.

**Direct prerequisites.** `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.6/divisorial-log`, `mathlib:MvPolynomial.pderiv`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.1`, `CrystallineCohomology:CR.5:log-algebra`, `CrystallineCohomology:CR.0`, `AInfCohomology:AI.6/finite-level-acris`.

**Sources.**

- CK: §5.9, p.36; §5.10, (5.10.1), p.36; §5.10, (5.10.2), p.37; §5.10, (5.10.3), p.37; Proposition 5.13, p.38.

**Suggested-file boundary (algebraic).** Typed in the suggested file: the derivations of the chart polynomial ring, their values on generators and on monomials, that they commute and preserve the chart ideal, their descent to the chart quotient and the Frobenius relation. The dual basis property and the derivations of A(R) and of the divided power rings are in the named inventory.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Local logarithmic crystalline comparison

`AInfCohomology:AI.6/local-crystalline` · theorem · declaration `Semistable.localCrystalline`

**Statement.** Let m≥p². On A_cris^(m)(R) each generator δ_i of Δ (i=1,…,d) acts as exp(log([ε])·D_i)=∑_{n≥0}(log([ε]))^n/n!·D_i^n, where D_i=∂/∂log(X_i) is the derivation of log-derivations and log([ε])=μ−μ²/2+μ³/3−…∈A_cris^(m). Hence (δ_i−1)/μ=D_i·U_i, where U_i=∑_{n≥1}(log([ε]))^n/(μ·n!)·D_i^{n−1} is an A_cris^(m)-linear automorphism of A_cris^(m)(R) (CK Lemma 5.15). The maps (id, ∑_{n≥1}(log([ε]))^n/n!·D_i^{n−1}) from [D_i] to [δ_i−1] induce an isomorphism of complexes K_{A_cris^(m)(R)}(D_1,…,D_d)≅η_μK_{A_cris^(m)(R)}(δ_1−1,…,δ_d−1) and a quasi-isomorphism onto η_μK_{A_cris^(m)(R_∞)}(δ_1−1,…,δ_d−1); they intertwine p^jφ in degree j of the source with φ (CK Proposition 5.16). After the termwise colimit over m and termwise p-adic completion this gives a Frobenius-equivariant identification RΓ_logcrys((Spf R)_{O_C/p}/A_cris)≅AΩ_R⊗̂^L_{A_inf}A_cris (CK (5.16.3)), where AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf) is the value on Spf R of the presheaf AΩ^psh of CK §4.1.

**Additional hypotheses.**

- The local setting of CK §5.5: Spf R is connected with an étale chart R□→R; A_cris^(m)(R)=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris^(m)(R_∞)=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m) (CK §3.27).

- m≥p² for log([ε]) and the exponential argument (CK §5.14); the smaller bound m≥p of finite-pd-base-change is distinct. The colimit over m≥p is computed over the cofinal range m≥p².

**Proof or construction.**

1. Use finite-level-acris (CK §§3.26–3.27; the vanishing (3.26.2) is BMS1 Lemma 12.8(ii)): A_cris^(m)(R) is p- and μ-torsion free, Δ acts trivially on A_cris^(m)(R)/μ, and A_cris^(m)(R) is formally étale over A_cris^(m)(R□). Use CK §5.14 (the proof of BMS1 Lemma 12.2, compare BMS1 Lemma 12.8(i); AI.4): for m≥p² the elements μ^n/(n+1)! lie in A_cris^(m), are topologically nilpotent and tend to 0 p-adically, so log([ε]) is defined, is a unit multiple of μ, and φ(log([ε]))=p·log([ε]).

2. Use CK Lemma 5.15 to factor (δ_i−1)/μ=D_i·U_i with U_i a convergent unit operator: the series exp(log([ε])·D_i) is a ring endomorphism by the Leibniz rule; for R=R□ it agrees with δ_i on the generators X_j by CK (5.10.2); for general R both sides are trivial modulo (p,ξ), so they agree by formal étaleness; dividing by μ uses μ-torsion-freeness.

3. Apply CK Proposition 5.16: since Δ acts trivially modulo μ, the j-th term of η_μK_{A_cris^(m)(R)}(δ_i−1) consists of the μ^j-multiples, and the maps (id, μ·U_i) give the isomorphism (5.16.4); Frobenius-equivariance follows from D_i∘φ=p·φ∘D_i and φ(log([ε]))=p·log([ε]). By CK Proposition 3.32 with Lemma 3.7 (finite-pd-base-change; Koszul cochains from AI.1) the inclusion into η_μK_{A_cris^(m)(R_∞)}(δ_i−1) is a quasi-isomorphism.

4. Identify the source with log crystalline cohomology by CK Proposition 5.13: A_cris(R)/p^n is a PD smooth log PD thickening of R/p over A_cris/p^n (CK Lemma 5.12; Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.4, Remarks (ii)), so its log de Rham complex computes RΓ_logcrys (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1), for quasi-coherent integral log structures; supplied by CR.5). Identify the target by CK Corollary 5.7 (finite-pd-base-change, i.e. CK Proposition 5.6 and Theorem 3.34, with aomega for AΩ^psh). Then pass to the termwise colimit over m and the termwise p-adic completion (E4/completed-colimits).

**Acceptance.**

- The scaling in degree j is part of the map; an unscaled differential comparison fails Frobenius compatibility.

- For R=R□ both sides of δ_i=exp(log([ε])·D_i) send X_i to [ε]X_i, fix X_j for 0<j≠i, and send X₀ to [ε]^{-1}X₀ if i≤r and to X₀ if i>r.

**Direct prerequisites.** `AInfCohomology:AI.6/finite-pd-base-change`, `AInfCohomology:AI.6/log-derivations`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.1`, `EnhancedDerivedSheaves:E4/completed-colimits`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.0:integral`, `CrystallineCohomology:CR.0`, `AInfCohomology:AI.6/finite-level-acris`, `AInfCohomology:AI.4`.

**Sources.**

- CK: §5.14, p.38; §3.27, (3.27.2), p.20; Lemma 5.15, pp.38–39; Lemma 5.15, proof, p.39; Proposition 5.16, (5.16.1)–(5.16.2), pp.39–40; Proposition 5.16, proof, p.40; Proposition 5.13, proof, p.38; Corollary 5.7, p.35.

- BMS1: Lemma 12.8, p.364.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### All-coordinates semistable presentations

`AInfCohomology:AI.6/all-coordinates` · definition · declaration `Semistable.allCoordinates`

**Statement.** Let Spf R be an affine nonempty étale open of 𝔛 such that every two irreducible components of Spec(R⊗_{O_C}k̄) meet. An index (Σ,Λ) consists of a finite set Σ, a nonempty finite set Λ, for each λ∈Λ a chart ring R□_λ=O_C{t_{λ,0},…,t_{λ,r_λ},t_{λ,r_λ+1}^{±1},…,t_{λ,d}^{±1}}/(t_{λ,0}⋯t_{λ,r_λ}−p^{q_λ}) with q_λ∈Q_{>0} (the same d for all λ; r_λ and q_λ may vary), and a closed immersion Spf R→Spf O_C{t_σ^{±1}:σ∈Σ}×∏_{λ∈Λ}Spf R□_λ over Spf O_C such that already Spf R→Spf O_C{t_σ^{±1}:σ∈Σ} is a closed immersion and each Spf R→Spf R□_λ is étale (CK §5.17). Indices are refined by enlarging Σ and Λ and form a filtered system. Each irreducible component of Spec(R⊗k̄) is cut out by a unique t_{λ,i} with 0≤i≤r_λ. If R⊗k̄ is not k̄-smooth, then R determines q_λ, so q_λ does not depend on λ; if R⊗k̄ is smooth, q_λ may depend on λ and r_λ>0 is allowed. The product chart algebra is A□_{Σ,Λ}=A(R□_Σ)⊗̂_{A_inf}⊗̂_{λ∈Λ}A(R□_λ), completed (p,μ)-adically (CK (5.22.1)). The root cover R_{Σ,Λ,∞} is the base change to R of the product of the root towers of R□_Σ=O_C{t_σ^{±1}} and of the R□_λ; it is a perfectoid pro-(finite étale) cover of the generic fibre with group Δ_{Σ,Λ}=Δ_Σ×∏_{λ∈Λ}Δ_λ, topologically freely generated by the δ_σ (σ∈Σ) and δ_{λ,i} (λ∈Λ, 1≤i≤d), and it contains each chart tower R_{λ,∞} as a subcover (CK §5.18).

**Additional hypotheses.**

- Spf R is affine, nonempty and étale over 𝔛, and every two irreducible components of Spec(R⊗_{O_C}k̄) meet (so Spf R is connected). Only the indices of CK §5.17 are used: Λ≠∅, all charts have the same relative dimension d, the map to the torus alone is a closed immersion, and each chart map is étale; arbitrary unrelated semistable charts are not substituted.

**Proof or construction.**

1. Use the formal-scheme and étale carriers from AI.3 and CR.5 and the chart rings of chart-ring; construct only the eligible presentation index. Existence on a basis of 𝔛_ét (CK §5.17): a chart (5.17.3) exists étale locally (CK §1.5); R is then the p-adic completion of a finite type O_C-algebra, so small Zariski opens of Spf R embed into a formal torus. The condition on components is obtained by shrinking around a point so that the finitely many components not passing through it are removed; this last step is not spelled out in CK.

2. By (5.17.3) the irreducible components of Spec(R⊗k̄) are the connected components of the loci t_{λ,i}=0, so the assumption on components gives the unique t_{λ,i} cutting out each component. If R⊗k̄ is not smooth, R determines q_λ by CK §1.5, footnote 2 (a Fitting-ideal computation), so q_λ does not depend on λ.

3. Apply CK §5.18: form the towers of root-tower for R□_Σ and each R□_λ, their product and its base change R_{Σ,Λ,∞} to R; it is perfectoid by almost purity (Scholze, Perfectoid spaces, 7.9 (iii); supplied by PerfectoidSpaces:P3). Apply CK (5.22.1): A□_{Σ,Λ} is the (p,μ)-completed product over A_inf of the lifts of ainf-chart-lift. Enlarging (Σ,Λ) gives the transition maps, and the union of two indices for the same R is an index, so the system is filtered (CK §5.21).

**Uses.**

- `CK §§5.22–5.40`: Presentation-independent crystalline maps are made by colimit over this index.

**API.**

- `Semistable.allCoordinates.refine` (constructor): Finite union of invertible coordinates and finite union of chart families define a common refinement of eligible indices.

- `Semistable.allCoordinates.maps` (functoriality): For (Σ,Λ)⊂(Σ′,Λ′) the projections give maps A□_{Σ,Λ}→A□_{Σ′,Λ′} and R_{Σ,Λ,∞}→R_{Σ′,Λ′,∞}, compatible with Frobenius and with Δ_{Σ′,Λ′}→Δ_{Σ,Λ}, satisfying identity and composition. For a p-adically formally étale R→R′ with index (Σ′,Λ′), the (Σ,Λ)-objects of R map to the (Σ∪Σ′,Λ∪Λ′)-objects of R′.

- `Semistable.allCoordinates.single` (compatibility): For each λ∈Λ the chart tower R_{λ,∞} is a subcover of R_{Σ,Λ,∞}, compatibly with the projection Δ_{Σ,Λ}→Δ_λ. The presentation does not reduce to that chart and its tower: Σ must by itself give a closed immersion, and the group is Δ_Σ×∏_λΔ_λ.

- `Semistable.allCoordinates.components` (characterisation): For every λ∈Λ each irreducible component of Spec(R⊗k̄) is cut out by a unique t_{λ,i} with 0≤i≤r_λ.

- `Semistable.allCoordinates.valuation` (characterisation): If R⊗k̄ is not smooth, q_λ is the same for all λ∈Λ; if R⊗k̄ is smooth, there is for each λ a unique i_λ with t_{λ,i_λ}∉R^×, and q_λ may depend on λ.

**Unit tests.**

- `Semistable.allCoordinates.two_charts` (characterisation): Two distinct eligible node charts are both refined by the index containing their union.

- `Semistable.allCoordinates.no_chart` (non-example): Λ=∅ is excluded; torus coordinates alone do not constitute the logarithmic semistable presentation.

- `Semistable.allCoordinates.smooth` (compatibility): Let R be smooth with Spf R connected, and let Σ⊂R^× be a finite set as in BMS1 §12.2: it gives a closed embedding into a torus and contains d elements giving an étale framing λ. Then (Σ,{λ}), with r_λ=0, is an index, and the Δ_Σ-cover of the generic fibre obtained by adjoining p-power roots of the elements of Σ is the quotient of R_{Σ,{λ},∞} by Δ_λ. This is a comparison map of presentations, not an identification with the smooth all-coordinates presentation, and it is not a statement of CK.

- `Semistable.allCoordinates.smooth_valuations` (non-example): For R=O_C{t^{±1}} and any q∈Q_{>0}, the map t₀↦p^q·t, t₁↦t^{-1} from O_C{t₀,t₁}/(t₀t₁−p^q) is an étale chart with r_λ=1 (the completed localisation at t₁). Two such charts with different q, together with Σ={t}, form an index; so q_λ is not constant on Λ when R⊗k̄ is smooth.

**Acceptance.**

- Adjoining two allowed framings yields a common refinement, without choosing one framing as canonical.

**Direct prerequisites.** `AInfCohomology:AI.6/chart-ring`, `AInfCohomology:AI.6/divisorial-log`, `AInfCohomology:AI.3`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/ainf-chart-lift`, `PerfectoidSpaces:P3`.

**Sources.**

- CK: §5.17, p.40; §5.17, (5.17.2)–(5.17.3), p.40; §1.5, footnote 2, p.4; §5.18, (5.18.1), p.41; §5.18, p.41; §5.21, p.42; §5.22, (5.22.1), p.43.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Log exactification of all-coordinates charts

`AInfCohomology:AI.6/log-exactification` · construction · declaration `Semistable.logExactification`

**Statement.** Fix the unique q∈Q_{>0} with Z·q=∑_{λ∈Λ}Z·q_λ, and give O_C/p and A_inf the fine log structures ℕ→O_C/p, 1↦p^q and ℕ→A_inf, 1↦[(p^{1/p^∞})^q]. Let Q be the fine monoid of CK §5.25, the product of the monoids Q_λ with their diagonal elements identified; it is a chart of A□_{Σ,Λ}. Choose λ₀∈Λ and let P_{λ₀} be the monoid (5.26.1) if R⊗k̄ is smooth, or the monoid (5.27.2), indexed by the generic points Y of the special fibre, if it is not. The fine version of the log closed immersion Spec(R/p)→Spec(A□_{Σ,Λ}) factors Frobenius-equivariantly as an exact log closed immersion j_{λ₀} into Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]), followed by the log étale projection q_{λ₀} (CK (5.26.5), (5.27.5)). The algebra A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] is the initial A□_{Σ,Λ}-algebra with units satisfying the relations (5.26.3), respectively (5.27.3), and R is an algebra over it. The canonical changes λ₀→λ₀′, isomorphisms over A□_{Σ,Λ} compatible with the maps from Spec(R/p) (CK (5.26.6)–(5.26.7)), commute with Frobenius and satisfy the cocycle law.

**Additional hypotheses.**

- (Σ,Λ) is an index of all-coordinates for Spf R (CK §5.17). The fine versions of the log structures are used. No PD envelope is formed here; in particular the log PD envelope of the nonexact immersion, with p not nilpotent, is not used (CK footnote 11).

**Proof or construction.**

1. Import the chart and log-étale criteria from CR.5:log-algebra and CR.5. Following CK §5.25, build Q_λ⊂(q/q_λ)·ℕ^{r_λ+1}, generated by ℕ^{r_λ+1} and the diagonal element (q/q_λ,…,q/q_λ), with the chart Q_λ→A(R□_λ) sending the standard generators to the X_{λ,i} and the diagonal element to [(p^{1/p^∞})^q]; Q is obtained by identifying the diagonal elements.

2. Smooth case (CK §5.26): for each λ there is a unique i_λ with t_{λ,i_λ}∉R^×; write t_{λ,i}=(p^q)^{n_{λ,i}}·v_{λ,i} with v_{λ,i}∈R^×, n_{λ,i_λ}=q_λ/q and n_{λ,i}=0 otherwise. Then P_{λ₀}→R/p, 1↦p^q, 1_{(λ,i)}↦v_{λ,i}, is a chart, Q→P_{λ₀} is a Frobenius-equivariant chart of the immersion, and A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] has the universal property (5.26.3).

3. Nonsmooth case (CK §5.27): q_λ=q for all λ, and by all-coordinates each generic point y determines an index i_λ(y) with t_{λ,i_λ(y)}=u_{λ,λ₀,y}·t_{λ₀,i_{λ₀}(y)} for a unique u_{λ,λ₀,y}∈R^× (5.27.1). The chart P_{λ₀}→R/p sends 1_y to t_{λ₀,i_{λ₀}(y)}, 1_{(λ,i)} to t_{λ,i} for i∉i_λ(Y) and to u_{λ,λ₀,y} for i=i_λ(y); this gives the universal property (5.27.3) with branch ratios U_{λ,λ₀,y} and their product relations.

4. j_{λ₀} is exact by construction and q_{λ₀} is log étale by Kato, Logarithmic structures of Fontaine–Illusie, 3.5 (CR.5:log-algebra). For the change maps: in the smooth case the relations (5.26.3) do not involve λ₀; in the nonsmooth case use U_{λ,λ₀′,y}=U_{λ,λ₀,y}/U_{λ₀′,λ₀,y}. The cocycle law is not stated in CK; it follows from this formula, since U_{λ,λ₀″,y}=U_{λ,λ₀′,y}/U_{λ₀″,λ₀′,y}=U_{λ,λ₀,y}/U_{λ₀″,λ₀,y}, and from the universal properties.

**Uses.**

- `CK §§5.28–5.34`: An ordinary envelope after exactification computes the completed log PD envelope.

**API.**

- `Semistable.logExactification.factor` (data): The displayed factorization is exact-closed followed by log étale and commutes with the map to R/p.

- `Semistable.logExactification.units` (simp): Nonsmooth case (CK (5.27.3)): X_{λ,i} is a unit for i∉i_λ(Y); X_{λ,i_λ(y)}=U_{λ,λ₀,y}·X_{λ₀,i_{λ₀}(y)}; U_{λ₀,λ₀,y}=1; and ∏_{y∈Y}U_{λ,λ₀,y}=∏_{i∉i_{λ₀}(Y)}X_{λ₀,i}/∏_{i∉i_λ(Y)}X_{λ,i}. Smooth case (CK (5.26.3)): X_{λ,i}=[((p^{1/p^∞})^q)^{n_{λ,i}}]·V_{λ,i} with units V_{λ,i} and ∏_{0≤i≤r_λ}V_{λ,i}=1, where n_{λ,i_λ}=q_λ/q and n_{λ,i}=0 for i≠i_λ.

- `Semistable.logExactification.change` (functoriality): Changing λ₀ uses the displayed ratios and composes by the cocycle law, preserving log charts and Frobenius.

- `Semistable.logExactification.algebra` (compatibility): R is an algebra over A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}], with V_{λ,i}↦v_{λ,i} in the smooth case and U_{λ,λ₀,y}↦u_{λ,λ₀,y} in the nonsmooth case, compatibly with change of λ₀ (CK (5.26.4), (5.27.4)).

**Unit tests.**

- `Semistable.logExactification.single` (degenerate): For Λ={λ₀} in the nonsmooth case the units U_{λ₀,λ₀,y} are 1 and A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] is the localization of A□_{Σ,Λ} inverting X_{λ₀,i} for those i with t_{λ₀,i}∈R^×; it equals A□_{Σ,Λ} exactly when every t_{λ₀,i}, 0≤i≤r_{λ₀}, is a nonunit of R.

- `Semistable.logExactification.node` (computation): For two node charts x′=ax, y′=a⁻¹y of the same R with a∈R^× (for instance a∈O_C^×), with branches y₁: x=0 and y₂: y=0, the images in R of the ratio units are u_{λ,λ₀,y₁}=a and u_{λ,λ₀,y₂}=a⁻¹, and the product relation reads U_{λ,λ₀,y₁}·U_{λ,λ₀,y₂}=1.

- `Semistable.logExactification.nonexact_pd` (non-example): For the two node charts of the previous test, when the node x=y=0 lies in Spf R the immersion Spec(R/p)→Spec(A□_{Σ,Λ}) is not exact: there is no V∈A□_{Σ,Λ} with X′=V·X (modulo (X,Y,Y′) the element X′ is nonzero), although x′=ax in R. The exactified algebra adjoins exactly the unit U with X′=U·X and Y=U·Y′.

- `Semistable.logExactification.smooth` (computation): For R=O_C{t^{±1}}, Σ={t} and Λ={λ₀,λ₁}, where λ₀ has r=0, q_{λ₀}=1 (t_{λ₀,0}=p, t_{λ₀,1}=t) and λ₁ has r=1, q_{λ₁}=1/2 (t_{λ₁,0}=p^{1/2}t, t_{λ₁,1}=t^{-1}): q=1/2, n_{λ₀,0}=2, n_{λ₁,0}=1, n_{λ₁,1}=0, v_{λ₀,0}=1, v_{λ₁,0}=t, v_{λ₁,1}=t^{-1}, and the exactified algebra is A□_{Σ,Λ}[X_{λ₁,1}^{-1}] with V_{λ₁,1}=X_{λ₁,1}, V_{λ₁,0}=X_{λ₁,1}^{-1}, V_{λ₀,0}=1.

**Acceptance.**

- The envelope computation is independent of λ₀ through actual change maps.

**Direct prerequisites.** `AInfCohomology:AI.6/all-coordinates`, `CrystallineCohomology:CR.5:log-algebra`, `CrystallineCohomology:CR.5`.

**Sources.**

- CK: §5.25, p.45; §5.26, (5.26.3), p.46; §5.26, (5.26.5), p.46; §5.26, (5.26.6)–(5.26.7), p.46; §5.27, (5.27.2), p.47; §5.27, (5.27.3), p.47; §5.27, (5.27.5), p.47; §5.25, footnote 11, p.45.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### All-coordinates log PD envelope

`AInfCohomology:AI.6/all-coordinates-pd` · construction · declaration `Semistable.allCoordinatesPD`

**Statement.** Let D_{jλ₀} be CR.0’s ordinary divided power envelope over (Z_p,pZ_p) of the exact closed immersion j_{λ₀}: Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]) of log-exactification (CK §5.28); by the universal property of the uncompleted A_cris^0 it is equally the divided power envelope of j_{λ₀,cris} over Spec(O_C/p)→Spec(A_cris^0). Let D_{Σ,Λ}=lim_nD_{Σ,Λ,n}, where D_{Σ,Λ,n} is the log PD envelope of Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) over Spec(O_C/p)→Spec(A_cris/p^n) (CK §5.22); it is the completed log PD envelope used for R/p, with an A_cris-semilinear Frobenius, a Δ_{Σ,Λ}-action and a map D_{Σ,Λ}→R. The map q_{λ₀} induces isomorphisms D_{Σ,Λ,n}≅D_{jλ₀}/p^n and D_{Σ,Λ}≅(D_{jλ₀})^∧ (p-adic completion), A_cris-linear and compatible with divided powers, Frobenius, Δ_{Σ,Λ}, the maps to R and change of λ₀ (CK Lemma 5.29). For m≥1 let D^{(m)}_{jλ₀}⊂D_{jλ₀} be the subalgebra generated by the divided powers of degree ≤m of elements of the ideal of j_{λ₀}, and D^{0,(m)}_{Σ,Λ} its image in D_{Σ,Λ}, which is independent of λ₀. For m≥p let D^{(m)}_{Σ,Λ} be the p-adic completion of D^{0,(m)}_{Σ,Λ}; it is an A_cris^(m)-algebra with Frobenius and Δ_{Σ,Λ}-action, and D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧ over A_cris (CK (5.30.1)). The derivations ∂/∂log(X_τ) of log-derivations (τ=σ∈Σ or τ=(λ,i), 1≤i≤d) extend to divided power derivations of D_{jλ₀} and D_{Σ,Λ} and to A_cris^(m)-derivations of D^{(m)}_{Σ,Λ} (CK §5.31). All of this is functorial under enlarging (Σ,Λ). No p-torsion-freeness of D_{Σ,Λ} is assumed, and D^{(m)}_{Σ,Λ}→D_{Σ,Λ} is not asserted to be injective.

**Additional hypotheses.**

- (Σ,Λ) is an index of all-coordinates for Spf R and λ₀∈Λ. D^{(m)}_{Σ,Λ} is defined for m≥p.

**Proof or construction.**

1. CK §5.22: for n,n′>0 the A_inf/(p^n,μ^{n′})-base change of Spec(R/p)→Spf(A□_{Σ,Λ}) has a log PD envelope D_{Σ,Λ,n,n′} over (Z/p^n,pZ/p^n) (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.3, Theorem; for the fine version Kato, Logarithmic structures of Fontaine–Illusie, 5.4; supplied by CR.5). For n′ large it is the log PD envelope over Spec(O_C/p)→Spec(A_cris/p^n) and does not depend on n′; put D_{Σ,Λ}=lim_nD_{Σ,Λ,n}. Frobenius and Δ_{Σ,Λ} act by functoriality, and the universal property gives Spec(R/p)→Spf R→Spf D_{Σ,Λ} (CK (5.22.3)).

2. Apply the imported universal ordinary PD envelope (CR.0) after log-exactification: D_{jλ₀} is the envelope of j_{λ₀} over (Z_p,pZ_p); by the universal property of A_cris^0 (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.8; CR.0) it is the envelope of j_{λ₀,cris} over A_cris^0, and because j_{λ₀} is exact it is also the log PD envelope (Kato, Logarithmic structures of Fontaine–Illusie, 5.5.1; CR.5).

3. Use CK Lemma 5.29: for a log PD thickening T₀→T over A_cris/p^n with integral quasi-coherent log structure, units lift uniquely from T₀ to T (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.1, Exercises (iii); CR.5); so by the universal properties (5.26.3) and (5.27.3) a map T→Spec(A□_{Σ,Λ}⊗A_cris/p^n) compatible with T₀→Spec(R/p) lifts uniquely through q_{λ₀}. Hence the log PD envelopes of the nonexact immersion and of j_{λ₀} agree, D_{Σ,Λ,n}≅D_{jλ₀}/p^n; pass to the limit over n.

4. Use CK §§5.30–5.31 for the finite PD approximants and the inherited Δ_{Σ,Λ}-action and log derivations: D_{jλ₀}→D^0_{Σ,Λ}→D_{Σ,Λ} are isomorphisms modulo p^n, which gives (5.30.1); the derivations of log-derivations extend uniquely to A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] because q_{λ₀} is log étale, then to divided power derivations of D_{jλ₀} (Stacks Project 07HW), compatibly with those of D_{Σ,Λ}. Functoriality under enlarging (Σ,Λ) is CK §5.32.

5. The acceptance comparison with the ordinary envelope of the nonexact immersion is not in CK, which only notes that the uncompleted log PD envelope is unavailable (footnote 11). It follows by reducing modulo (X,Y): there the exactified algebra becomes a Laurent polynomial ring in U over the image of A□_{Σ,Λ}, and its divided power envelope is a divided power polynomial algebra in U−α over the envelope of that image.

6. All completions in this node are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of D_{Σ,Λ} is not known (CK §5.22), so the derived completion could differ.

**Uses.**

- `CK §§5.35–5.40`: The log crystalline complex and its comparison map use this envelope.

**API.**

- `Semistable.allCoordinatesPD.universal` (universal-property): For each n, D_{Σ,Λ,n}=D_{Σ,Λ}/p^n is the log PD envelope of Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) over Spec(O_C/p)→Spec(A_cris/p^n): for a log PD thickening T₀→T over A_cris/p^n with integral quasi-coherent log structure, compatible log maps T₀→Spec(R/p) and T→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) factor uniquely through a log PD map T→Spec(D_{Σ,Λ,n}).

- `Semistable.allCoordinatesPD.refine` (functoriality): Refinement and change of λ₀ commute with PD structure, Frobenius and log derivations.

- `Semistable.allCoordinatesPD.finite` (characterisation): D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧ over A_cris (CK (5.30.1)), where D^{(m)}_{Σ,Λ} is the p-adic completion of the subalgebra D^{0,(m)}_{Σ,Λ}⊂D_{Σ,Λ}; D^{(m)}_{Σ,Λ}→D_{Σ,Λ} is not asserted to be injective, and termwise completion alone is not substituted for a derived comparison.

- `Semistable.allCoordinatesPD.exact` (equivalence): q_{λ₀} induces D_{Σ,Λ,n}≅D_{jλ₀}/p^n for n>0 and D_{Σ,Λ}≅(D_{jλ₀})^∧, A_cris-linearly and compatibly with divided powers, Frobenius, the Δ_{Σ,Λ}-action, the maps to R/p^n and R, and change of λ₀ (CK Lemma 5.29).

- `Semistable.allCoordinatesPD.toR` (data): There is a map D_{Σ,Λ}→R lifting D_{Σ,Λ}→R/p, induced by the factorization Spec(R/p)→Spf R→Spf D_{Σ,Λ} (CK (5.22.3)) and agreeing with D_{jλ₀}→R of CK (5.28.2).

- `Semistable.allCoordinatesPD.derivations` (structure): The commuting derivations ∂/∂log(X_τ) act on D_{jλ₀} and D_{Σ,Λ} as divided power derivations (∂(x^{[n]})=x^{[n−1]}∂(x)) and on D^{(m)}_{Σ,Λ}, m≥p, as A_cris^(m)-derivations, compatibly with each other and with those of A□_{Σ,Λ} (CK §5.31).

**Unit tests.**

- `Semistable.allCoordinatesPD.single` (compatibility): For each λ∈Λ and m≥p there is a unique map of A_cris^(m)(R□_λ)-algebras A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} lifting the identity of R/p (CK (5.39.1)); it is Δ_{Σ,Λ}-equivariant through Δ_{Σ,Λ}→Δ_λ and commutes with ∂/∂log(X_{λ,i}). D_{Σ,Λ} is not identified with the lift A_cris(R)_λ used in local-crystalline.

- `Semistable.allCoordinatesPD.ratio` (computation): For two node charts differing by a unit a, under D_{jλ₀}→R the ratio units U_{λ,λ₀,y} map to a and a⁻¹ on the two branches, and the constructions for the two choices of λ₀ are canonically isomorphic (CK (5.28.1)).

- `Semistable.allCoordinatesPD.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, A□_{Σ,Λ}=A_inf and D_{Σ,Λ}=A_cris with its divided powers.

- `Semistable.allCoordinatesPD.torus_coordinate` (computation): For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, A□_{Σ,Λ}=A_inf{X_σ^{±1}} and D_{Σ,Λ} is the p-adically completed divided power polynomial algebra over A_cris in the variable X_σ−[u^♭]; in particular D_{Σ,Λ}≠A_cris, and ∂/∂log(X_σ) sends X_σ−[u^♭] to X_σ.

**Acceptance.**

- For two node charts (x,y) and (ax,a⁻¹y) with a∈O_C^× and α=[a^♭], D_{Σ,Λ} contains the unit U with X′=U·X and the divided powers of U−α. When the node lies in Spf R, the ordinary PD envelope of the kernel of A□_{Σ,Λ}→R/p maps to D_{Σ,Λ} by (X′−αX)^{[n]}↦X^n·(U−α)^{[n]}, and this map is not surjective: modulo (X,Y) its image does not contain U−α.

**Direct prerequisites.** `AInfCohomology:AI.6/log-exactification`, `CrystallineCohomology:CR.0`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.6/log-derivations`, `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/finite-level-acris`.

**Sources.**

- CK: §5.22, p.43; §5.22, (5.22.2), p.43; §5.22, p.44; §5.28, p.47; §5.28, p.48; Lemma 5.29, (5.29.1), p.48; Lemma 5.29, proof, p.48; §5.30, p.49; §5.30, (5.30.1), p.49; §5.31, (5.31.3), p.49; §5.31, (5.31.4), p.50; §5.32, p.50.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### All-coordinates AΩ comparison model

`AInfCohomology:AI.6/all-coordinates-aomega` · construction · declaration `Semistable.allCoordinatesAOmega`

**Statement.** For an index (Σ,Λ) of all-coordinates and m≥p let A_cris^(m)(R_{Σ,Λ,∞})=A_inf(R_{Σ,Λ,∞})⊗̂_{A_inf}A_cris^(m), and form η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1), where τ runs over σ∈Σ and (λ,i) with λ∈Λ, 1≤i≤d. Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of these complexes; the colimits and the completion are termwise (CK (5.21.1)). The result carries an A_cris-semilinear Frobenius. For each (Σ,Λ) and m≥p the edge map of the cover R_{Σ,Λ,∞} identifies the m-th complex, Frobenius-equivariantly, with AΩ_R⊗̂^L_{A_inf}A_cris^(m), where AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf) is the value on Spf R of the presheaf AΩ^psh (CK Proposition 5.20). Hence in the shared derived enhancement the model is canonically and Frobenius-equivariantly identified with AΩ_R⊗̂^L_{A_inf}A_cris, compatibly with enlarging (Σ,Λ) and functorially in R for p-adically formally étale maps R→R′ (CK §5.21). The termwise completion agrees with the derived one because A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free. No multiplicative structure on the model or on this identification is asserted.

**Additional hypotheses.**

- Spf R and the indices (Σ,Λ) are as in all-coordinates (CK §5.17); m≥p throughout.

**Proof or construction.**

1. Use the combined root covers from all-coordinates and AI.3 continuous Koszul cochains. By CK §5.19, A_inf(R_{Σ,Λ,∞})=W(R_{Σ,Λ,∞}^♭) (AI.0) and, by CK Lemma 3.13, (p^n,μ^{n′}) is a regular sequence on it with flat quotient over A_inf/(p^n,μ^{n′}); so A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free, and by CK (3.26.2)–(3.26.3) (finite-level-acris, API item intertwined) it is μ-torsion free with A_cris^(m)(R_{Σ,Λ,∞})/μ p-adically complete. Δ_{Σ,Λ} acts continuously and Frobenius-equivariantly.

2. Prove CK Proposition 5.20. For one chart λ∈Λ, finite-pd-base-change (CK Proposition 5.6) gives AΩ_R⊗̂^L_{A_inf}A_cris^(m)≅Lη_μ(RΓ_proét((Spf R)_C^ad,A_inf)⊗̂^L_{A_inf}A_cris^(m)), with AΩ_R from aomega (CK (4.1.3)). Since R_{Σ,Λ,∞} contains R_{λ,∞} as a subcover, CK Remark 3.35 applies: by almost purity (AI.3) and CK Lemma 3.17 the ideal W(𝔪^♭) kills the cohomology of the cone of RΓ_cont(Δ_λ,A_cris^(m)(R_{λ,∞}))→RΓ_cont(Δ_{Σ,Λ},A_cris^(m)(R_{Σ,Λ,∞})), and CK Lemma 3.18 with Proposition 3.33 (finite-pd-base-change) shows that Lη_μ of this map is an isomorphism. CK Lemma 3.7 (BMS1 Lemma 7.3(ii); AI.1) replaces continuous cochains by Koszul complexes, which gives (5.20.1).

3. Follow CK §5.21: the identifications are compatible with enlarging (Σ,Λ) and with p-adically formally étale R→R′ (using the index (Σ∪Σ′,Λ∪Λ′) for R′). Take the termwise colimit over m, the termwise p-adic completion (equal to the derived one by p-torsion-freeness) and the filtered colimit over (Σ,Λ) through E4/completed-colimits and E1, retaining actual coherent maps.

**Uses.**

- `CK Proposition 5.39`: This is the AΩ side of the functorial log crystalline map.

**API.**

- `Semistable.allCoordinatesAOmega.edge` (equivalence): For m≥p the edge map of the cover R_{Σ,Λ,∞} induces a Frobenius-equivariant identification of η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) with AΩ_R⊗̂^L_{A_inf}A_cris^(m) (CK (5.20.1)), and of the model with AΩ_R⊗̂^L_{A_inf}A_cris; it is compatible with p-adically formally étale maps R→R′.

- `Semistable.allCoordinatesAOmega.refine` (functoriality): Refinement maps commute with cochain differentials and the completed colimit structure.

- `Semistable.allCoordinatesAOmega.frobenius` (compatibility): The model’s Frobenius agrees with aomega-frobenius after PD base change.

- `Semistable.allCoordinatesAOmega.chart` (compatibility): For λ∈Λ and m≥p the map η_μK_{A_cris^(m)(R_{λ,∞})}((δ_{λ,i}−1)_{1≤i≤d})→η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) induced by the subcover R_{λ,∞} and the projection Δ_{Σ,Λ}→Δ_λ is a quasi-isomorphism (CK Lemma 3.7 and Remark 3.35).

- `Semistable.allCoordinatesAOmega.torsion_free` (structure): A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free and μ-torsion free, and its quotient by μ is p-adically complete (CK §5.19); so η_μ of the Koszul complex computes Lη_μ and the termwise p-adic completion is the derived one.

**Unit tests.**

- `Semistable.allCoordinatesAOmega.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, the group Δ_{Σ,Λ} is trivial, R_{Σ,Λ,∞}=O_C and the complex is A_cris in degree 0.

- `Semistable.allCoordinatesAOmega.single` (compatibility): For one node chart λ (d=1) and m≥p, the rank-one complex η_μK_{A_cris^(m)(R_{λ,∞})}(δ_{λ,1}−1) maps quasi-isomorphically to the (Σ,{λ})-term, which is the Koszul complex on the |Σ|+1 operators δ_σ−1, δ_{λ,1}−1; the two are not equal unless Σ=∅.

- `Semistable.allCoordinatesAOmega.refinement` (characterisation): The two chart embeddings into a common refinement induce the same equivalence with the intrinsic AΩ target.

- `Semistable.allCoordinatesAOmega.torus_point` (computation): For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, the group is Δ_{Σ,Λ}=Δ_σ≅Z_p and the m-th term is η_μ of the two-term complex δ_σ−1 on A_cris^(m)(R_{Σ,Λ,∞}); for m≥p it is quasi-isomorphic to A_cris^(m) in degree 0, although it is not concentrated in degree 0.

**Acceptance.**

- The maps agree for two different chart families under their union.

**Direct prerequisites.** `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/finite-pd-base-change`, `AInfCohomology:AI.1`, `EnhancedDerivedSheaves:E4/completed-colimits`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/aomega-frobenius`, `AInfCohomology:AI.3`, `AInfCohomology:AI.0:integral`, `CrystallineCohomology:CR.0`, `AInfCohomology:AI.6/finite-level-acris`.

**Sources.**

- CK: §5.19, p.42; Proposition 5.20, (5.20.1), p.42; Proposition 5.20, proof, p.42; Remark 3.35, p.24; §5.21, (5.21.1), p.42; §5.21, p.43; §4.1, (4.1.3), p.25.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### All-coordinates log crystalline model

`AInfCohomology:AI.6/all-coordinates-log-crystalline` · construction · declaration `Semistable.allCoordinatesLogCrystalline`

**Statement.** For an index (Σ,Λ) and m≥p form the Koszul complex K_{D_{Σ,Λ}^{(m)}}(D_τ) of the derivations D_τ=∂/∂log(X_τ) of all-coordinates-pd, where τ runs over σ∈Σ and (λ,i) with λ∈Λ, 1≤i≤d. Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of these complexes; the colimits and the completion are termwise (CK (5.32.1)). Degree-j Frobenius is p^jφ. For each (Σ,Λ) the completed colimit over m is K_{D_{Σ,Λ}}(D_τ), the log PD de Rham complex Ω•_{D_{Σ,Λ}/A_cris,log,PD}, which is canonically and Frobenius-equivariantly identified in the derived category with RΓ_logcrys((Spf R)_{O_C/p}/A_cris) (CK Proposition 5.23, (5.31.5)). The identification is compatible with enlarging (Σ,Λ) and functorial in R for p-adically formally étale maps R→R′, and under it the map to RΓ_logdR(Spf R/O_C) is induced by D_{Σ,Λ}→R (CK (5.23.2)). After sheafification on 𝔛_ét the model represents Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}.

**Additional hypotheses.**

- Spf R and (Σ,Λ) are as in all-coordinates; m≥p. The log crystalline site is that of 𝔛_{O_C/p} over A_cris with quasi-coherent integral log structures (CK §5.3).

**Proof or construction.**

1. Use the log derivations and the rings D^{(m)}_{Σ,Λ} of all-coordinates-pd.

2. Prove CK Proposition 5.23 with CR.5’s log PD Poincaré lemma: A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n is a log smooth thickening of R/p over A_cris/p^n (CK §5.11), so its log PD envelope D_{Σ,Λ,n} is PD smooth over A_cris/p^n (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.4, Remarks (ii)); hence the log PD de Rham complex of D_{Σ,Λ,n} computes log crystalline cohomology over A_cris/p^n (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1)) and equals Ω•_{(A□_{Σ,Λ}⊗A_cris/p^n)/(A_cris/p^n),log}⊗D_{Σ,Λ,n} (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.7, Exercises, (i)); all three for quasi-coherent integral log structures, supplied by CR.5. The limit over n gives (5.23.1), and CK (5.10.3) (log-derivations) gives the Koszul form (5.23.3). The same argument for the log smooth thickenings R/p^n over O_C/p^n gives (5.23.2).

3. By CK (5.30.1) and §5.31 rewrite (5.23.3) as (5.31.5). By CK §5.32 the formation is compatible with enlarging (Σ,Λ) and with p-adically formally étale R→R′ (through the universal properties (5.26.3), (5.27.3)); take the filtered colimit, using E1 for the coherent filtered colimit.

4. All completions in this node are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of D_{Σ,Λ} is not known (CK §5.22), so the derived completion could differ.

**Uses.**

- `CK Proposition 5.39 and Theorem 5.4`: This is the target of the intrinsic log crystalline comparison.

**API.**

- `Semistable.allCoordinatesLogCrystalline.poincare` (equivalence): For each (Σ,Λ), K_{D_{Σ,Λ}}(D_τ)=Ω•_{D_{Σ,Λ}/A_cris,log,PD} is identified with RΓ_logcrys((Spf R)_{O_C/p}/A_cris) by the log PD de Rham comparison for the PD smooth envelope (CK (5.23.1), (5.23.3)); after sheafification the model identifies with the imported log crystalline pushforward Ru_*O.

- `Semistable.allCoordinatesLogCrystalline.refine` (functoriality): Envelope refinement gives coherent maps of these complexes and composes with chart restriction.

- `Semistable.allCoordinatesLogCrystalline.frobenius` (simp): On degree j forms the map is p^jφ, agreeing with log crystalline Frobenius.

- `Semistable.allCoordinatesLogCrystalline.de_rham` (compatibility): Under the identification, the map RΓ_logcrys((Spf R)_{O_C/p}/A_cris)→RΓ_logdR(Spf R/O_C) is the map Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} induced by D_{Σ,Λ}→R (CK (5.23.2)).

**Unit tests.**

- `Semistable.allCoordinatesLogCrystalline.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, the term is A_cris in degree 0.

- `Semistable.allCoordinatesLogCrystalline.node` (computation): For one node chart the degree-one forms have the relation dlogX₀+dlogX₁=0.

- `Semistable.allCoordinatesLogCrystalline.smooth` (compatibility): If R is smooth and every λ∈Λ has r_λ=0, then the exactification is trivial (Q→P_{λ₀} is an isomorphism), A□_{Σ,Λ} is a (p,μ)-completed torus over A_inf, D_{Σ,Λ} is the p-completed divided power envelope of R/p in it over A_cris, and K_{D_{Σ,Λ}}(D_τ) is its PD de Rham complex in the coordinates X_τ∂/∂X_τ. For Σ as in BMS1 §12.2 the projection to the torus on Σ maps the corresponding complex for Σ alone into it. This is a comparison map, not an identification with the smooth all-coordinates complex, and it is not a statement of CK.

- `Semistable.allCoordinatesLogCrystalline.torus_point` (computation): For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, the complex K_{D_{Σ,Λ}}(∂/∂log X_σ) is the two-term complex D_{Σ,Λ}→D_{Σ,Λ} with D_{Σ,Λ} the completed divided power polynomial algebra over A_cris in X_σ−[u^♭]; it is quasi-isomorphic to A_cris in degree 0 but not concentrated in degree 0.

**Acceptance.**

- Frobenius on one log direction multiplies its differential by p.

**Direct prerequisites.** `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.6/log-derivations`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.1`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `AInfCohomology:AI.6/all-coordinates`.

**Sources.**

- CK: Proposition 5.23, (5.23.1), p.44; Proposition 5.23, proof, p.44; Proposition 5.23, (5.23.2), proof, p.44; §5.31, (5.31.5), p.50; §5.32, (5.32.1), p.50; §5.32, p.50.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### All-coordinates comparison morphism

`AInfCohomology:AI.6/all-coordinates-map` · construction · declaration `Semistable.allCoordinatesComparisonMap`

**Statement.** Use the canonical map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK §5.38, including its logarithmic ratio variables: it is the p-adic completion of the divided power morphism D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}) of CK Lemma 5.37, which sends the exactification units to Teichmüller units of A_inf(R_{Σ,Λ,∞}); it does not depend on λ₀, is Δ_{Σ,Λ}- and Frobenius-equivariant, is compatible with D_{Σ,Λ}→R and θ, and restricts to maps D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞}) for m≥p (CK (5.38.1)–(5.38.3)). For m≥p² the maps (id, ∑_{n≥1}(log([ε]))^n/n!·D_τ^{n−1}), D_τ=∂/∂log(X_τ), define a Frobenius-equivariant morphism K_{D^{(m)}_{Σ,Λ}}(D_τ)→η_μK_{D^{(m)}_{Σ,Λ}}(δ_τ−1), where the target is the subcomplex given by formula (1.7.3) of CK (CK Proposition 5.34). Composing with η_μ of the maps of Koszul complexes induced by (5.38.3), and passing to the termwise colimit over m, the termwise p-adic completion and the filtered colimit over (Σ,Λ), gives the comparison map from the all-coordinates log crystalline model to the all-coordinates AΩ model (CK (5.38.4)). It is a map of complexes that commutes with φ, with refinements and with p-adically formally étale maps R→R′. It is not a map of differential graded algebras, and no multiplicativity is asserted.

**Additional hypotheses.**

- Spf R and (Σ,Λ) are as in all-coordinates. The ring maps (5.38.3) exist for m≥p; the exponential maps of CK Proposition 5.34 require m≥p²; the colimits over m≥p are computed over the cofinal range m≥p².

**Proof or construction.**

1. CK §5.35 and Proposition 5.36 (finite-level-acris, API item injective; A_cris⁰(R′_∞) from CR.0): for an affinoid perfectoid R′_∞ over O_C, A_cris^0(R′_∞)≅A_inf(R′_∞)[T^n/n!]_{n≥1}/(T−ξ) is the divided power envelope of (A_inf(R′_∞),Ker θ+p) over (Z_p,pZ_p) (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, proof of A2.8); A_cris^{0,(m)}(R′_∞)≅A_inf(R′_∞)⊗_{A_inf}A_cris^{0,(m)} with completion A_cris^(m)(R′_∞) ((5.35.1)–(5.35.2)); and the maps A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR^+(R′_∞) are injective (using Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.9 (2), for the filtration by divided powers of ξ).

2. CK Lemma 5.37: make A_inf(R_{Σ,Λ,∞}) an algebra over A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] (log-exactification), Δ_{Σ,Λ}- and Frobenius-equivariantly and compatibly with change of λ₀. Smooth case: X_{λ,i} is a unit when t_{λ,i}∈R^×, because A_inf(R_{Σ,Λ,∞}) is ξ-adically complete, so (5.26.3) has a unique solution. Nonsmooth case: t_{λ,i_λ(y)}^{1/p^m}/t_{λ₀,i_{λ₀}(y)}^{1/p^m} is a unit of R_{Σ,Λ,∞} for every m, because R_{Σ,Λ,∞} is integrally closed in R_{Σ,Λ,∞}[1/p] (perfectoid input, PerfectoidSpaces:P3); the compatible system defines u^♭_{λ,λ₀,y}, and [u^♭_{λ,λ₀,y}] solves (5.27.3) because the X_{λ,i} are nonzerodivisors in A_inf(R_{Σ,Λ,∞}). The universal property of the PD envelope D_{jλ₀} (CR.0, all-coordinates-pd) then gives (5.37.1).

3. CK §5.38: complete p-adically to get (5.38.1), using CK Lemma 5.29; by the first step its restriction to D^{0,(m)}_{Σ,Λ} lands in A_cris^{0,(m)}(R_{Σ,Λ,∞})⊂A_cris(R_{Σ,Λ,∞}), and completion gives (5.38.3).

4. Apply local-crystalline’s exponential operator in the form of CK Lemma 5.33 and Proposition 5.34: for m≥p², δ_τ acts on D^{(m)}_{Σ,Λ} as ∑_{n≥0}(log([ε]))^n/n!·D_τ^n (from CK Lemma 5.15, the universal properties (5.26.3), (5.27.3) and that of D_{jλ₀}); since (log([ε]))^n/(μ·n!) lies in A_cris^(m), the degree-one components land in μ·D^{(m)}_{Σ,Λ}, which gives the morphism to the subcomplex (1.7.3). D^{(m)}_{Σ,Λ} is not known to be μ-torsion free, so this subcomplex is not asserted to compute Lη_μ. Frobenius-equivariance is as in CK Proposition 5.16.

5. Compose and pass to the colimits; passage to all-coordinates colimits preserves the specified maps (CK §5.38, last two paragraphs). That (5.38.4) is not a map of differential graded algebras is CK’s remark in the proof of Proposition 5.41: it would be one only if the terms with n≥1 of the degree-one component log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·D_τ^n could be disregarded.

6. All completions in this node are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of D_{Σ,Λ} is not known (CK §5.22), so the derived completion could differ.

**Uses.**

- `CK Proposition 5.39 and Proposition 5.41`: Its equivalence and its reduction square give canonical global comparisons.

**API.**

- `Semistable.allCoordinatesComparisonMap.coefficients` (data): The degree-zero map is the ring map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK (5.38.1), the p-adic completion of the divided power morphism D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}); it is independent of λ₀, Δ_{Σ,Λ}- and Frobenius-equivariant, compatible with D_{Σ,Λ}→R and θ, and restricts to D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞}) for m≥p.

- `Semistable.allCoordinatesComparisonMap.frobenius` (compatibility): The comparison intertwines p^jφ on j-forms with the AΩ Frobenius.

- `Semistable.allCoordinatesComparisonMap.natural` (functoriality): The map commutes with all-coordinates refinement and with p-adically formally étale maps R→R′.

- `Semistable.allCoordinatesComparisonMap.units` (simp): Under D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}) each X_τ maps to the Teichmüller lift [t_τ^♭] of the system of p-power roots of t_τ and, in the nonsmooth case, U_{λ,λ₀,y} maps to [u^♭_{λ,λ₀,y}], where u^♭_{λ,λ₀,y} is the system of units t_{λ,i_λ(y)}^{1/p^m}/t_{λ₀,i_{λ₀}(y)}^{1/p^m} of R_{Σ,Λ,∞} (CK Lemma 5.37).

- `Semistable.allCoordinatesComparisonMap.exponential` (relation): For m≥p², δ_τ=∑_{n≥0}(log([ε]))^n/n!·D_τ^n as endomorphisms of D^{(m)}_{Σ,Λ} (CK Lemma 5.33).

**Unit tests.**

- `Semistable.allCoordinatesComparisonMap.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, both models are A_cris in degree 0 and the map is the identity of A_cris.

- `Semistable.allCoordinatesComparisonMap.node` (computation): For λ∈Λ and m≥p² the square (5.39.2) commutes: the comparison map precomposed with the map of Koszul complexes induced by A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} equals the unit-operator exponential comparison (5.16.2) of local-crystalline followed by the map induced by the subcover R_{λ,∞}⊂R_{Σ,Λ,∞}.

- `Semistable.allCoordinatesComparisonMap.de_rham` (compatibility): The square formed by D_{Σ,Λ}→R (CK (5.22.3)), the degree-zero map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}), θ: A_cris(R_{Σ,Λ,∞})→R_{Σ,Λ,∞} and R→R_{Σ,Λ,∞} commutes (CK (5.38.2)). The agreement of the whole map with the log de Rham specialization, including its differential, is the content of crystalline-de-rham-square and is not part of this construction.

- `Semistable.allCoordinatesComparisonMap.torus_generator` (computation): For σ∈Σ the degree-zero map sends X_σ to [t_σ^♭]∈A_inf(R_{Σ,Λ,∞}), on which δ_σ acts by multiplication by [ε]; correspondingly ∑_{n≥0}(log([ε]))^n/n!·D_σ^n(X_σ)=[ε]·X_σ in D^{(m)}_{Σ,Λ} for m≥p².

**Acceptance.**

- In degree 0 the map is the ring map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of (5.38.1), and the square formed with D_{Σ,Λ}→R, R→R_{Σ,Λ,∞} and θ: A_cris(R_{Σ,Λ,∞})→R_{Σ,Λ,∞} commutes (CK (5.38.2)); an arbitrary quasi-isomorphism is insufficient.

- In degree 1 the component for τ is log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·D_τ^n followed by the ring map; the terms with n≥1 are what prevents the map from being a map of differential graded algebras.

**Direct prerequisites.** `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/all-coordinates-log-crystalline`, `AInfCohomology:AI.6/local-crystalline`, `CrystallineCohomology:CR.0`, `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/log-exactification`, `PerfectoidSpaces:P3`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.6/finite-level-acris`.

**Sources.**

- CK: Lemma 5.33, p.51; Proposition 5.34, (5.34.1), p.51; §1.7, (1.7.3), p.7; §5.35, (5.35.2), p.52; Proposition 5.36, (5.36.1), p.52; Lemma 5.37, (5.37.1), p.53; Lemma 5.37, proof, p.54; §5.38, (5.38.1), p.54; §5.38, (5.38.3), p.54; §5.38, (5.38.4), p.55; §5.38, p.55; Proposition 5.41, proof, p.58.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Absolute log crystalline comparison

`AInfCohomology:AI.6/absolute-crystalline` · theorem · declaration `Semistable.absoluteCrystallineComparison`

Atlas planet: **Log crystalline comparison**.

**Statement.** The all-coordinates comparison morphism is a quasi-isomorphism: for every index (Σ,Λ) the map (5.38.4) of all-coordinates-map is a quasi-isomorphism (CK Proposition 5.39). It sheafifies to a Frobenius-equivariant isomorphism Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}≃AΩ_𝔛⊗̂^L_{A_inf}A_cris in the derived category of sheaves of A_cris-modules on 𝔛_ét (CK Theorem 5.4, (5.40.1)), where u is the projection from the log crystalline topos of 𝔛_{O_C/p} over A_cris. The tensor is derived p-completed: AΩ_𝔛⊗̂^L_{A_inf}A_cris=Rlim_n(AΩ_𝔛⊗^L_{A_inf}A_cris/p^n). By construction the isomorphism is compatible with étale localisation on 𝔛. Multiplicativity, and functoriality for morphisms of semistable formal schemes that are not étale, are not asserted.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5; neither properness nor quasi-compactness is needed for the sheaf statement. In the proof the ring maps use m≥p and the single-chart comparison of local-crystalline uses m≥p².

**Proof or construction.**

1. Prove CK Proposition 5.39 by reduction to local-crystalline. Fix λ∈Λ. For m≥p the ideal of D^{(m)}_{Σ,Λ} cutting out R/p is finitely generated and has divided powers, hence is p-adically topologically nilpotent; so the formal étaleness of A_cris^(m)(R□_λ)→A_cris^(m)(R)_λ (CK §3.14) gives a unique map A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} lifting the identity of R/p (CK (5.39.1)), compatible with Δ_{Σ,Λ}→Δ_λ, with the derivations ∂/∂log(X_{λ,i}) and with the maps to A_cris^(m)(R_{Σ,Λ,∞}). In the resulting commutative square (5.39.2) the top map is the quasi-isomorphism (5.16.2) of local-crystalline for m≥p² (CK Proposition 5.16); the right map is a quasi-isomorphism by CK Lemma 3.7 and Remark 3.35 (all-coordinates-aomega); and the left map becomes a quasi-isomorphism after the colimit over m and termwise p-adic completion, because both sides then compute RΓ_logcrys((Spf R)_{O_C/p}/A_cris) (CK Proposition 5.13 and (5.31.5); all-coordinates-log-crystalline, CR.5). Hence the bottom map (5.38.4) is a quasi-isomorphism.

2. Take the filtered colimit over (Σ,Λ): the comparison map between the two models is a quasi-isomorphism, functorially in R for p-adically formally étale maps (CK §5.38).

3. Sheafify by CK §5.40 in E1; the explicit map remains the map of all-coordinates-map. The two models are complexes of presheaves on the basis of 𝔛_ét formed by the Spf R of all-coordinates, with values AΩ_R⊗̂^L_{A_inf}A_cris and RΓ_logcrys((Spf R)_{O_C/p}/A_cris). The sheafification of the second represents Ru_*O (CR.5). For the first CK refers to §5.21; in detail, by CK Corollary 4.6 (aomega-sheaf-completeness) AΩ_R=RΓ(Spf R,AΩ_𝔛), and by the argument at the start of the proof of CK Corollary 5.43 (affine opens are quasi-compact and quasi-separated) RΓ(Spf R,AΩ_𝔛)⊗̂^L_{A_inf}A_cris=RΓ(Spf R,AΩ_𝔛⊗̂^L_{A_inf}A_cris), so the sheafification is AΩ_𝔛⊗̂^L_{A_inf}A_cris (E4/completed-sheaf-tensor).

**Acceptance.**

- For a node chart the degree-one term of the log crystalline model is free on dlog X₁, with dlog X₀+dlog X₁=0, and on the single-chart complex the comparison is μ·U₁ in degree one, with U₁ the unit operator of local-crystalline.

- For 𝔛=Spf O_C the isomorphism is the identity of A_cris.

- For smooth 𝔛 the agreement of this isomorphism with that of BMS1 Theorem 12.1 along the comparison of presentations of all-coordinates is not proved in CK and is not asserted here.

**Direct prerequisites.** `AInfCohomology:AI.6/all-coordinates-map`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.6/all-coordinates-log-crystalline`, `CrystallineCohomology:CR.5`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.6/all-coordinates`, `EnhancedDerivedSheaves:E4`, `AInfCohomology:AI.6/aomega-sheaf-completeness`.

**Sources.**

- CK: Theorem 5.4, (5.4.1), p.33; Theorem 5.4, p.33; Proposition 5.39, p.55; Proposition 5.39, proof, p.55; Proposition 5.39, proof, p.56; §5.38, p.55; §5.40, p.56; §5.40, (5.40.1), p.56; Corollary 4.6, (4.6.1), p.26.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Log crystalline and de Rham agreement

`AInfCohomology:AI.6/crystalline-de-rham-square` · theorem · declaration `Semistable.crystallineDeRhamSquare`

**Statement.** The triangle formed by the isomorphism Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→AΩ_𝔛⊗̂^L_{A_inf}A_cris of absolute-crystalline, the de Rham specialization AΩ_𝔛⊗̂^L_{A_inf}A_cris→Ω•_{𝔛/O_C,log} of log-de-rham (CK (4.17.1)) and the map Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→Ω•_{𝔛/O_C,log} induced by CR.5’s log crystalline-to-log de Rham comparison Ru_*O⊗̂^L_{A_cris,θ}O_C≅Ω•_{𝔛/O_C,log} commutes in the derived category of sheaves on 𝔛_ét (CK Proposition 5.41). Equivalently, after A_cris→O_C, absolute-crystalline agrees with log-de-rham and CR.5’s comparison. This is an equality of maps of complexes, rather than only an equality of cohomology ranks. On the presheaf complexes of all-coordinates both composites are the unique map of differential graded algebras Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} that is D_{Σ,Λ}→R in degree 0; the comparison isomorphism of absolute-crystalline itself is not asserted to be multiplicative.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5. The statement concerns maps in the derived category of sheaves on 𝔛_ét and is proved on the functorial presheaf complexes attached to the Spf R and indices (Σ,Λ) of all-coordinates.

**Proof or construction.**

1. Work on the functorial presheaf complexes over the Spf R of all-coordinates: CK writes that the claim is local, and since commutativity in a derived category of sheaves is not a local property in general, the argument is run on chain maps that are functorial in R. By CK Proposition 5.23 (all-coordinates-log-crystalline, API de_rham) the map from CR.5 (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1) and (1.11.1); CK Remark 5.24) is the map of differential graded algebras Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} induced by D_{Σ,Λ}→R.

2. Uniqueness (CK (5.41.2)): the dlog X_σ and dlog X_{λ,i} generate Ω•_{D_{Σ,Λ}/A_cris,log,PD} as a differential graded algebra over D_{Σ,Λ}, the terms of Ω•_{Spf(R)/O_C,log} are p-torsion free, and the t_σ and t_{λ,i} are units in R[1/p]; so there is at most one map of differential graded algebras lying over D_{Σ,Λ}→R.

3. Describe the de Rham specialization of log-de-rham on the complexes η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) of all-coordinates-aomega, as in the proof of CK Theorem 4.17: apply Frobenius (aomega-frobenius), reduce modulo φ(ξ) to H•(η_μK/φ(ξ)) with its Bockstein differential (BMS1 Proposition 6.12; AI.1/bockstein-reduction), and map by θ∘φ^{-1} to H•(η_{ζ_p−1}K_{R_{Σ,Λ,∞}}(δ_τ−1))≅Ω•_{Spf(R)/O_C,log} (hodge-tate-comparison: CK Theorem 4.11, Remark 4.5, (4.2.2), with Remarks 3.10 and 3.21 for the cover R_{Σ,Λ,∞}). The Bockstein differentials agree because the cohomology is p-torsion free and the comparison can be made after inverting p. By BMS1 Lemma 6.13 and the differential graded algebra structure of BMS1 Lemma 7.5 on Koszul complexes (AI.1), the resulting map (5.41.4) is a map of differential graded algebras that is θ in degree 0.

4. Reduce the exponential operators of all-coordinates-map along θ: the degree-one component of the comparison map is log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·(∂/∂log X_τ)^n, and in the composite with (5.41.4) the terms with n≥1 can be ignored because log([ε]) is a unit multiple of μ and θ(μ^n/(n+1)!)=0 for n≥1. So the composite is a map of differential graded algebras, equal to D_{Σ,Λ}→R in degree 0 by CK (5.38.2), hence the unique one of the second step.

**Acceptance.**

- On a node chart the composite carries dlog X₁ to dlog t₁, with the relation dlog t₀+dlog t₁=0 and the log de Rham differential.

**Direct prerequisites.** `AInfCohomology:AI.6/absolute-crystalline`, `AInfCohomology:AI.6/all-coordinates-map`, `AInfCohomology:AI.6/log-de-rham`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/aomega-frobenius`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/all-coordinates-log-crystalline`, `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.1/bockstein-reduction`, `AInfCohomology:AI.1`.

**Sources.**

- CK: Proposition 5.41, (5.41.1), p.56; Proposition 5.41, p.56; Remark 5.24, (5.24.1), p.44; Proposition 5.41, proof, (5.41.2), p.56; Proposition 5.41, proof, p.57; Proposition 5.41, proof, (5.41.4), p.58; Proposition 5.41, proof, p.58.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Global crystalline and Witt specializations

`AInfCohomology:AI.6/global-crystalline` · theorem · declaration `Semistable.globalCrystallineComparison`

**Statement.** For qcqs 𝔛 there are Frobenius-equivariant identifications RΓ_Ainf(𝔛)⊗̂^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) and RΓ_Ainf(𝔛)⊗̂^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)), where W(k̄) carries the pullback of the log structure of A_cris, associated to Q≥0→W(k̄), 0≠q↦0, 0↦1. If 𝔛 is proper over O_C the same identifications hold with the ordinary derived tensors, and H^i_logcrys(𝔛_{O_C/p}/A_cris)[1/p] is finite free over A_cris[1/p] for every i (CK Corollary 5.43). The W(k̄) log base first uses Q≥0→W(k̄); the arithmetic normalization is the next node.

**Additional hypotheses.**

- qcqs for the completed form; properness over O_C for dropping completion and the p-inverted freeness assertion.

**Proof or construction.**

1. Globalize absolute-crystalline using E1/E4: for qcqs 𝔛 and an A_inf/p^n-module M one has RΓ(𝔛_ét,AΩ_𝔛⊗^L_{A_inf}M)≅RΓ(𝔛_ét,AΩ_𝔛)⊗^L_{A_inf}M, because M is a filtered colimit of perfect A_inf-modules (BMS1 Lemma 4.9(i)) and cohomology of a qcqs site commutes with filtered colimits (Stacks Project 0739). With M=A_cris/p^n and the limit over n this gives the first identification (aomega for RΓ_Ainf).

2. Descend 𝔛_{O_C/p}: using the étale charts and CK Claims 1.6.1 and 1.6.3 (divisorial-log), a limit argument gives the ring of integers O of a finite extension of W(k̄)[1/p] in C and a quasi-compact quasi-separated, fine, log smooth log scheme 𝒳 over O/p of Cartier type (Kato, Logarithmic structures of Fontaine–Illusie, 4.8) with 𝒳⊗_{O/p}O_C/p≅𝔛_{O_C/p}. CK gives no details of the limit argument. The base change theorem (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.11.1), in the quasi-separated form of CK footnote 17; CR.5 log crystalline base change) gives RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗̂^L_{A_cris}W(k̄)≅RΓ_logcrys(𝔛_{k̄}/W(k̄)), hence the second identification.

3. Use proper-perfectness (CK Corollary 4.20) to remove the extra completion in the proper case. For the p-inverted freeness, 𝒳 can then be taken proper over O/p, and Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.18, Theorem (supplied by CR.6) shows that the cohomology groups of RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}A_cris[1/p] are finite free over A_cris[1/p].

**Acceptance.**

- The proper and qcqs formulas must not be interchanged; finite freeness is after p-inversion here.

- For 𝔛=Spf O_C both sides of the first identification are A_cris and both sides of the second are W(k̄).

**Direct prerequisites.** `AInfCohomology:AI.6/absolute-crystalline`, `AInfCohomology:AI.6/proper-perfectness`, `CrystallineCohomology:CR.5`, `CrystallineCohomology:CR.6`, `AInfCohomology:AI.0:integral`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/divisorial-log`, `EnhancedDerivedSheaves:E4`.

**Sources.**

- CK: §5.42, p.58; Corollary 5.43, (5.43.1), p.58; Corollary 5.43, (5.43.2), p.58; Corollary 5.43, p.58; Corollary 5.43, proof, p.58; Corollary 5.43, proof, (5.43.3), p.59; Corollary 5.43, proof, footnote 17, p.59; Corollary 5.43, proof, p.59; Corollary 4.20, p.31.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Arithmetic Hyodo–Kato interface

`AInfCohomology:AI.6/hyodo-kato-interface` · theorem · declaration `Semistable.hyodoKatoInterface`

**Statement.** Let 𝔛₀ be a proper arithmetic semistable model over O_K, with perfect residue field k₀, and 𝔛=𝔛₀⊗̂_{O_K}O_C. There are Frobenius-equivariant identifications: (i) RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)) for the log base Q≥0→W(k̄) (CK (5.43.2)); (ii) RΓ_logcrys(𝔛_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k̄}/W(k̄)) for the log base ℕ→W(k̄), 1↦0 (CK Remark 5.44, (5.44.1)), the change of log structure being ℕ→Q≥0, 1↦v(π_K) for a uniformizer π_K of K; (iii) RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄), where the arithmetic log base is ℕ→W(k₀), 1↦0. Identification (iii) is not stated in CK, which has only its consequence (8.8.1) for the Galois invariants of one cohomology group under the freeness hypotheses of Theorem 8.7; it is base change of log crystalline cohomology of a fine, log smooth log scheme of Cartier type along the map of log divided power bases W(k₀)→W(k̄). So the W(k̄) specialization identifies with RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄). If 𝔛₀ is only quasi-compact and quasi-separated, (i)–(iii) hold with p-completed tensor products throughout. (iv) (CK Proposition 9.2, (9.2.2)) For proper 𝔛₀: RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}B_st⁺≃RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_st⁺, compatibly with φ, which acts on both factors on each side, and with N, which is N⊗1+1⊗N on the left and the monodromy of B_st⁺ on the right, with Nφ=pφN; the identification is G_K-equivariant (CK §9.4). The rational comparison with étale cohomology over B_st (CK Theorem 9.5) is not part of this statement.

**Additional hypotheses.**

- K⊂C is a complete discretely valued subfield with perfect residue field k₀, and C is the completion of an algebraic closure of K (CK §9.4). 𝔛₀ is a proper p-adic formal O_K-scheme with an étale cover by affines étale over Spf(O_K{t₀,…,t_d}/(t₀⋯t_r−π)) for nonunits π∈O_K∖{0} (CK Theorem 9.5), with the log structure O_{𝔛₀,ét}∩(O_{𝔛₀,ét}[1/p])^×. Properness is used for the uncompleted tensor products.

- The base extension W(k₀)→W(k̄) is explicit; N is supplied on the descended Hyodo–Kato object RΓ_logcrys((𝔛₀)_{k₀}/W(k₀)) and on B_st⁺, not asserted on AΩ itself.

**Proof or construction.**

1. By global-crystalline (CK (5.43.2)), RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)) with the log base Q≥0→W(k̄).

2. Apply CK Remark 5.44 to compare the rational-monoid and standard log-point cohomology. Let K̆ be the completion of the maximal unramified extension of K in C; it is a finite extension of W(k̄)[1/p]. By CK Claims 1.6.1 and 1.6.3 (divisorial-log) and Kato, Logarithmic structures of Fontaine–Illusie, 4.8, the reduction of 𝔛₀ over O_K/p, hence over O_{K̆}/p, is fine, log smooth and of Cartier type, and it descends 𝔛_{O_C/p}. The base change theorem (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.11.1); CR.5/CR.6) gives (5.44.1).

3. Base change along W(k₀)→W(k̄): RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄), p-completed in general. This step is not written out in CK, which uses it in Remark 8.8 to pass to Galois invariants; it is base change of log crystalline cohomology for the map of log divided power bases W(k₀)→W(k̄) (CR.6), identification (iii) of the statement. For proper 𝔛₀ the complex RΓ_logcrys((𝔛₀)_{k₀}/W(k₀)) is perfect (proper finiteness from CR.5), so no completion is needed; the last acceptance item shows that it is needed otherwise.

4. CK Proposition 9.2: the ring A_st, initial among A_cris-algebras trivialising the Fontaine–Hyodo–Kato torsor, is A_cris[T] for a choice of trivialisation, with N=−d/dT and φ(T)=pT, and B_st⁺=A_st[1/p] (CK §9.1); by Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.17, it agrees with Fontaine’s ring (PadicHodgeTheory:R06.1/semistable-period-ring, where B_st⁺=B_cris⁺[u], N=−d/du and φ(u)=pu). The descent Y=(𝔛₀)_{O_K/p} of 𝔛_{O_C/p} is fine, log smooth and of Cartier type (second step), and (9.2.2) is Beilinson, (1.16.2) and (1.18.5) (CR.6); N acts as N⊗1+1⊗N on the left and through B_st⁺ on the right, and G_K-equivariance holds because G_K acts on both sides by functoriality (CK §9.4).

**Acceptance.**

- For k₀ finite, retain its nontrivial Witt Frobenius; a coefficient identity on W(k̄) alone is insufficient.

- For φ=diag(1,p) and N=[[0,1],[0,0]] on Q² one has Nφ=pφN, N≠0 and N²=0, while for the transposed N the relation fails; this fixes the orientation of the monodromy relation.

- For 𝔛₀=Spf O_K{T^{±1}}, which is not proper, and k₀ not algebraically closed: RΓ_logcrys((𝔛₀)_{k₀}/W(k₀)) is computed by W(k₀){T^{±1}}→W(k₀){T^{±1}}·dlog T, and its uncompleted base change to W(k̄) does not surject on H¹ onto the cohomology of W(k̄){T^{±1}}→W(k̄){T^{±1}}·dlog T: the class of ∑_j p^{⌊j/2⌋}[x_j]T^{p^j}dlog T, with x_j∈k̄ linearly independent over k₀, is not in the image. So the completed tensor product is needed without properness.

**Direct prerequisites.** `AInfCohomology:AI.6/global-crystalline`, `CrystallineCohomology:CR.5`, `CrystallineCohomology:CR.6`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.6/divisorial-log`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

**Sources.**

- CK: Corollary 5.43, (5.43.2), p.58; Remark 5.44, p.59; Remark 5.44, (5.44.1), p.59; Remark 8.8, (8.8.1), p.74; §9.1, p.75; Proposition 9.2, (9.2.2), p.76; Proposition 9.2, proof, p.76; §9.4, p.76; Theorem 9.5, p.76; Theorem 9.5, (9.5.1), p.76; Theorem 9.5, proof, p.76; Remark 9.6, p.77.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### B_dR⁺-cohomology in the étale topology and with non-unit coordinates

`AInfCohomology:AI.6/bdr-cohomology-etale-embeddings` · theorem · declaration `Semistable.bdrCohomologyEtaleEmbeddings`

**Statement.** Let X be a smooth adic space over C. (1) Étale topology (CK §6.2). The analytic, respectively étale, topology of X has a basis of affinoids Spa(A,A°) that admit a map to a torus Spa(C⟨T_1^{±1},…,T_d^{±1}⟩,O_C⟨T_1^{±1},…,T_d^{±1}⟩) which is a composite of a rational embedding, a finite étale map and a rational embedding, and a finite set Ψ⊂(A°)^× with C⟨(X_u^{±1})_{u∈Ψ}⟩→A, X_u↦u, surjective. For such data put B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩=lim_n (B_dR⁺/ξⁿ)⟨(X_u^{±1})_{u∈Ψ}⟩, let s be its surjection onto A, D_Ψ(A)=lim_n B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩/(Ker s)ⁿ, let Ω^•_{D_Ψ(A)/B_dR⁺} be the Koszul complex of the commuting derivations ∂/∂log X_u=X_u·∂/∂X_u of D_Ψ(A), and Ω^•_{A/B_dR⁺}=colim_Ψ Ω^•_{D_Ψ(A)/B_dR⁺}. Let RΓ_crys(X/B_dR⁺), respectively RΓ_crys(X_ét/B_dR⁺), be the hypercohomology of the associated complex of sheaves for the analytic, respectively étale, topology; the first agrees with the complex of BMS1 §13 supplied by CP.3. Then both are derived ξ-adically complete (6.2.5); their reductions modulo ξ are canonically and compatibly identified with RΓ(X,Ω^{•,cont}_{X/C})=RΓ_dR(X/C) and RΓ(X_ét,Ω^{•,cont}_{X/C}) (6.2.6); and pullback is an isomorphism RΓ_crys(X/B_dR⁺)≃RΓ_crys(X_ét/B_dR⁺) (6.2.7). (2) Non-unit coordinates (CK §§6.3–6.4). The étale topology of X has a basis of affinoids Spa(A,A°) with the following data: an étale map (6.3.1) to Spa(C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q), O_C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q)) for some d≥r≥0 and q∈Q_{>0}; a finite extension K of W(k̄)[1/p] in C with ring of integers O∋p^q and a finite type O[T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r−p^q)-algebra A_0, étale after inverting p, O-flat, normal, with no connected component of Spec A_0 on which p is a unit, such that (6.3.1) is the base change to C of an étale map (6.3.2) from Spa(Â_0[1/p],Â_0) and A_0⊗̂_O O_C≃A° (6.3.3); and finite sets Ψ_0⊂(Â_0)^×, Ξ_0⊂Â_0∩(Â_0[1/p])^× with K⟨(x_u^{±1})_{u∈Ψ_0},(x_a)_{a∈Ξ_0}⟩→Â_0[1/p] surjective (6.3.4). For finite Ψ⊂(A°)^× and Ξ⊂A°∩A^× with C⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩→A surjective (6.3.5), let D_{Ψ,Ξ,n}(A)=B_dR⁺⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩/(Ker s)ⁿ, D_{Ψ,Ξ}(A)=lim_n D_{Ψ,Ξ,n}(A), and let Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} be the Koszul complex of the derivations ∂/∂log X_a, a∈Ψ∪Ξ. Let B_dR⁺⊗̂_K A_0[1/p]=lim_n(((B_dR⁺/ξⁿ)_0⊗̂_O A_0)[1/p]), where (B_dR⁺/ξⁿ)_0 is the A_inf/ξⁿ-subalgebra of B_dR⁺/ξⁿ generated by the image of O; it has no ξ-torsion, is ξ-adically complete and reduces to A modulo ξ (6.3.6). (a) Lemma 6.3.8: suppose that Ψ, respectively Ξ, contains the images of the T_i for r+1≤i≤d, respectively 1≤i≤r, under a coordinate map (6.3.1), and that Ψ and Ξ are large enough in the sense of CK §6.4, namely: for some choice of (Ψ_0,Ξ_0) as in (6.3.4) such that Ψ_0, respectively Ξ_0, contains the images of the T_i for r+1≤i≤d, respectively 1≤i≤r, under (6.3.2), Ψ contains the image of Ψ_0 in A° and Ξ contains the image of Ξ_0. Then D_{Ψ,Ξ}(A)≃(B_dR⁺⊗̂_K A_0[1/p])[[(X_a−ã)_{a∈(Ψ∪Ξ)∖{T_1,…,T_d}}]] (6.3.9), where ã is a fixed lift of a in lim_n((B_dR⁺/ξⁿ)_0⊗̂_O A_0); in particular D_{Ψ,Ξ}(A) has no nonzero ξ-torsion and is ξ-adically complete. (b) For such Ψ and Ξ, Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C} in the derived category, compatibly with enlarging Ψ and Ξ (6.3.10), and for Ψ′⊇Ψ, Ξ′⊇Ξ the map Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}→Ω^•_{D_{Ψ′,Ξ′}(A)/B_dR⁺} is a quasi-isomorphism. (c) If Spa(A,A°) also belongs to the basis of (1), the map Ω^•_{A/B_dR⁺}→colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} is a quasi-isomorphism, functorial in Spa(A,A°) (6.3.11). Such affinoids form a basis of X_ét, so the hypercohomology of the sheafification of Spa(A,A°)↦colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} is RΓ_crys(X_ét/B_dR⁺)≃RΓ_crys(X/B_dR⁺), and under this identification the maps (6.3.10) recover (6.2.6) ((6.3.12)). No multiplicative structure on these complexes is asserted.

**Additional hypotheses.**

- X is a smooth adic space over C; it is not assumed proper and is not assumed to be the generic fibre of a formal model. In part (2), K runs over finite extensions of W(k̄)[1/p] inside C; B_dR⁺ is a K-algebra through AI.0’s canonical lift, and its ξ-adic topology and the rings B_dR⁺/ξⁿ=(A_inf/ξⁿ)[1/p] are AI.0’s.

**Proof or construction.**

1. Bases for part (1): by Huber, Étale cohomology of rigid analytic varieties and adic spaces, 1.6.10 and 2.2.8, the analytic and the étale topology of X have bases of affinoids with coordinate maps (6.2.1); localising further gives the surjections (6.2.2). Huber’s results are those of AdicEtaleGeometry:A1.

2. By BMS1 Lemma 13.12(ii) and Lemma 13.13 (CP.3), for fixed Spa(A,A°) and Ψ large, D_Ψ(A) is ξ-torsion-free and ξ-adically complete, Ω^•_{D_Ψ(A)/B_dR⁺}→Ω^•_{A/B_dR⁺} is a quasi-isomorphism and Ω^•_{D_Ψ(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C}. By BMS1 Lemma 9.15 (CP.3; for the étale site its analogue, as in the proof of CK Corollary 4.6), the definition with sheafification agrees with that of BMS1 §13, both complexes are derived ξ-complete (6.2.5), and their reductions modulo ξ are the de Rham complexes (6.2.6).

3. (6.2.7): by the Hodge-to-de Rham spectral sequence and Scholze, p-adic Hodge theory for rigid-analytic varieties, Proposition 9.2(ii) (coherent cohomology is the same in the analytic and in the étale topology; AdicSpacesPartII:R3), RΓ(X,Ω^{•,cont}_{X/C})→RΓ(X_ét,Ω^{•,cont}_{X/C}) is an isomorphism. Both sides of (6.2.7) are derived ξ-complete and the pullback map is an isomorphism modulo ξ, hence an isomorphism.

4. Descent for part (2): by Huber 1.7.3 iii) and limit arguments, (6.3.1) descends to (6.3.2) over a finite extension K of W(k̄)[1/p]; by the reduced fibre theorem (Stacks Project 09IL) K can be enlarged so that (6.3.3) holds. By BMS1 Lemma 13.4(ii) (CP.3) each D_{Ψ,Ξ,n}(A) is a complete strongly noetherian Tate ring, with the image of (A_inf/ξⁿ)⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩ as a ring of definition. By the proof of BMS1 Lemma 13.11, which simplifies here because A_0 is a free O-module (Raynaud–Gruson, Critères de platitude et de projectivité, I.3.3.5, and Stacks Project 0593), the ring B_dR⁺⊗̂_K A_0[1/p] is ξ-torsion-free and ξ-adically complete with reduction A, and lim_n((B_dR⁺/ξⁿ)_0⊗̂_O A_0) surjects onto A° ((6.3.6), (6.3.7)). The K-algebra structure of B_dR⁺ is AI.0:period-comparison’s.

5. Lemma 6.3.8 (CK §6.4, adapting BMS1 Lemma 13.12(ii)): put D_{0,n}=K⟨(x_u^{±1})_{u∈Ψ_0},(x_a)_{a∈Ξ_0}⟩/(Ker s_0)ⁿ and D_0=lim_n D_{0,n}. Since A_0[1/p] is étale over K[T_1,…,T_r,T_{r+1}^{±1},…,T_d^{±1}], the map A_0[1/p]→Â_0[1/p] lifts to A_0[1/p]→D_0 with T_i↦x_{T_i} ((6.4.1)). By Gabber–Ramero, Almost ring theory, 7.3.15, the power-bounded elements of D_{0,n} are the preimage of those of Â_0[1/p], so A_0 maps into a ring of definition; composing with D_{0,n}→D_{Ψ,Ξ,n}(A) gives a continuous map y from the right side of (6.3.9) to D_{Ψ,Ξ}(A). A continuous map z in the other direction is defined from X_{T_i}↦T_i, the expansion X_u^{−1}=ũ^{−1}(1−ũ^{−1}(X_u−ũ)+…) for u∈Ψ and ξ-adic completeness. Then y∘z=id by construction and z∘y=id by étaleness, so z is the isomorphism (6.3.9).

6. (6.3.10) and enlargement: every a∈Ψ∪Ξ is a unit of A, so the proof of BMS1 Lemma 13.13 gives Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C}, compatibly with enlarging Ψ and Ξ; by the ξ-completeness and ξ-torsion-freeness of Lemma 6.3.8 the enlargement maps are quasi-isomorphisms.

7. (6.3.11) and (6.3.12): for Spa(A,A°) in both bases, D_Ψ(A)=D_{Ψ,∅}(A), and the map from colim_Ψ to colim_{Ψ,Ξ} is a quasi-isomorphism because for large indices both sides are computed by ξ-torsion-free, ξ-complete terms with the same reduction modulo ξ (CK state (6.3.11) as a consequence without further argument). The affinoids with r=0 already form a basis of X_ét, so sheafifying gives RΓ_crys(X_ét/B_dR⁺), and (6.2.7) gives (6.3.12).

**Acceptance.**

- Node chart: for A=C⟨T_0,T_1⟩/(T_0T_1−p^q), A°=O_C⟨T_0,T_1⟩/(T_0T_1−p^q), the coordinate T_1 lies in A°∩A^× (its inverse is T_0/p^q) but not in (A°)^× (its image in A°/𝔪A°=k̄[T_0,T_1]/(T_0T_1) is a zero divisor). So T_1 cannot belong to any Ψ, while Ψ=∅, Ξ={T_0,T_1} satisfy (6.3.5) and the hypotheses of Lemma 6.3.8 with K=W(k̄)[1/p](p^q), O its ring of integers, A_0=O[T_0,T_1]/(T_0T_1−p^q), Ψ_0=∅ and Ξ_0={T_0,T_1}; then (6.3.9) reads D_{∅,{T_0,T_1}}(A)≃(B_dR⁺⊗̂_K A_0[1/p])[[X_{T_0}−T̃_0]].

- Case r=0, Ξ=∅: the chart (6.3.1) is an étale map to a torus, D_{Ψ,∅}(A)=D_Ψ(A), and (6.3.9) has the form of BMS1 Lemma 13.12(ii), with the B_dR⁺-lift B_dR⁺⊗̂_K A_0[1/p] of A, obtained by descent to a discretely valued K, in place of the lift used in BMS1; in particular D_Ψ(A) is again ξ-torsion-free and ξ-adically complete for Ψ large.

- Both parts hold for every smooth adic space over C; properness is not used. For X=Spa(C,O_C) all the complexes are B_dR⁺ in degree 0 and (6.2.6) is reduction modulo ξ.

- The reduction (6.3.10) for the data (Ψ,Ξ) agrees with (6.2.6) under (6.3.11); a complex with the right cohomology but a different identification modulo ξ does not satisfy (6.3.12).

**Direct prerequisites.** `CohomologyComparisons:CP.3`, `AInfCohomology:AI.0:period-comparison`, `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R3`.

**Sources.**

- CK: §6.2, p.60; §6.2, (6.2.1), p.60; §6.2, (6.2.5), p.61; §6.2, (6.2.7), p.61; §6.3, p.61; §6.3, (6.3.2), p.61; §6.3, (6.3.3), p.61; §6.3, (6.3.5), p.62; Lemma 6.3.8, p.62; Lemma 6.3.8, last sentence, p.62; §6.4, p.63; §6.4, proof of Lemma 6.3.8, p.63; §6.3, (6.3.10), p.62; §6.3, (6.3.11)–(6.3.12), p.63.

- BMS1: Lemma 13.12(ii), p.378; Lemma 13.4, p.370; Lemma 13.11, p.376; Lemma 9.15, p.331.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Canonical semistable B_dR⁺ comparison map

`AInfCohomology:AI.6/bdr-comparison-map` · construction · declaration `Semistable.bdrComparisonMap`

**Statement.** Let 𝔛 be as in CK §1.5; its adic generic fibre X_C^ad is then smooth over C. Let RΓ_crys(X_C^ad/B_dR⁺) be CP.3’s B_dR⁺-cohomology (BMS1 §13), computed in the étale topology with the rings D_{Ψ,Ξ}(A) of bdr-cohomology-etale-embeddings. For an affine Spf R in 𝔛_ét with all-coordinates data (Σ,Λ) as in CK §5.17, put A=R[1/p], Ξ=⋃_{λ∈Λ}{t_{λ,1},…,t_{λ,r_λ}} and Ψ={t_σ}_{σ∈Σ}∪⋃_{λ∈Λ}{t_{λ,r_λ+1},…,t_{λ,d}}, enlarged by the images of the units Ψ₀ obtained by descending the closed immersion (5.17.2) to a finite extension of W(k̄)[1/p]; the coordinates t_{λ,0} are omitted. CK §6.5 constructs continuous ring maps D_{Σ,Λ}→D_{Ψ,Ξ}(A) over A_cris→B_dR⁺ (6.5.5), independent of the auxiliary chart λ₀, compatible with the maps to R[1/p] and with the logarithmic derivations ∂/∂log X_σ and ∂/∂log X_{λ,i}, 1≤i≤d. The induced maps of Koszul complexes (6.5.6) are compatible with enlarging (Σ,Λ) and (Ψ,Ξ) and with replacing R by a p-adically formally étale R-algebra; after sheafification they give the map (6.5.1) RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_crys(X_C^ad/B_dR⁺) over A_cris→B_dR⁺, hence a B_dR⁺-linear map RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). It sits in the commutative square (6.5.7) with the reduction RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C) of (5.23.2), the reduction modulo ξ of (6.2.6) and the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C) to the generic fibre. If 𝔛 is proper, compose with global-crystalline’s RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) to obtain the A_inf-to-B_dR⁺ map RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). This is a comparison to CP.3’s object, not its construction. Naturality for arbitrary morphisms of models, Galois equivariance and multiplicativity of the map are not asserted.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 (étale-locally étale over a chart R□). No properness is needed for the map (6.5.1) or the square (6.5.7); properness of 𝔛 over O_C is assumed only for the composite with the uncompleted identification of global-crystalline. The maps A_inf→A_cris→B_dR⁺ are AI.0’s.

**Proof or construction.**

1. The adic generic fibre X_C^ad is smooth over C by the charts (1.5.1) and Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1 (CK §1.5). Import RΓ_crys(X_C^ad/B_dR⁺) from CP.3 and, from bdr-cohomology-etale-embeddings, its computation in the étale topology by the complexes Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} ((6.2.7), (6.3.11), (6.3.12)).

2. Local data (CK (6.5.2)): for Spf R with data (Σ,Λ) as in CK §5.17 (all-coordinates) set A=R[1/p], so that A°≃R, and Ψ, Ξ as in the statement. Descend the étale maps (5.17.3) to the ring of integers of a finite extension K of W(k̄)[1/p] in C (CK (1.5.2)) to obtain the descended coordinate map (6.3.2); after enlarging K, descend the closed immersion (5.17.2) to a surjection (6.3.4) with Ξ₀=∅ and adjoin the image of the resulting Ψ₀ to Ψ. Then Spa(A,A°) lies in the refined basis and Lemma 6.3.8 applies to Ψ and Ξ (bdr-cohomology-etale-embeddings).

3. By the descent and Gabber–Ramero, Almost ring theory, 7.3.15, the elements [(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}}) of D_{Ψ,Ξ,n}(A) are power-bounded. Hence (D_{Ψ,Ξ,n}(A))° is an algebra over the ring A□_{Σ,Λ} of (5.22.1), with X_σ↦X_{t_σ}, X_{λ,i}↦X_{t_{λ,i}} for 1≤i≤d and X_{λ,0}↦[(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}}) (CK leave the formulas implicit; they follow from the presentation (5.19.2)). Since D_{Ψ,Ξ,n}(A) is a Q-algebra in which ξ^m=0 for m≥n and each X_a is a unit of D_{Ψ,Ξ}(A), the universal relations (5.26.3) and (5.27.3) of log-exactification make it an algebra over (A□_{Σ,Λ}⊗_{A_inf}A_cris⁰)⊗_{Z[Q]}Z[P_{λ₀}], compatibly with the maps to R ((6.5.3)) and with the change-of-λ₀ isomorphisms (5.26.7).

4. The kernel of (D_{Ψ,Ξ,n}(A))°→R/p has a unique divided power structure (Stacks Project 07GM), so the universal property of the divided power envelope D_{j_{λ₀}} of CK §5.28 (all-coordinates-pd) gives D_{j_{λ₀}}→(D_{Ψ,Ξ,n}(A))° (6.5.4), which factors through a p-adically complete ring of definition. By Lemma 5.29, (5.29.1), D_{Σ,Λ} is the p-adic completion of D_{j_{λ₀}}; this gives continuous maps D_{Σ,Λ}→D_{Ψ,Ξ,n}(A), compatible in n and independent of λ₀, hence D_{Σ,Λ}→D_{Ψ,Ξ}(A) (6.5.5).

5. The derivations ∂/∂log X_σ and ∂/∂log X_{λ,i} (1≤i≤d) of D_{j_{λ₀}} (CK §5.31, all-coordinates-pd) are compatible with the corresponding derivations of D_{Ψ,Ξ}(A); by density of D_{j_{λ₀}} in D_{Σ,Λ} the same holds on D_{Σ,Λ}. This gives maps of Koszul complexes, compatible with enlarging the data and with p-adically formally étale localisation of R ((6.5.6)). The source computes RΓ_logcrys(𝔛_{O_C/p}/A_cris) by CK Proposition 5.23, (5.23.3), and §5.32 (all-coordinates-log-crystalline); the target computes RΓ_crys(X_C^ad/B_dR⁺) by (6.3.12). Sheafify on 𝔛_ét and apply RΓ(𝔛_ét,−) to obtain (6.5.1).

6. Square (6.5.7): by construction and Lemma 5.29 the map (6.5.5) is compatible with the maps to R[1/p]; BMS1 Lemma 13.13, as used for (6.3.10), then shows that (6.5.6) is compatible with the maps to Ω^{•,cont}_{R[1/p]/C} given by (5.23.2) (last display of CK §5.32) and by (6.3.10).

7. For proper 𝔛, compose with the identification (5.43.2) of global-crystalline (CK Corollary 5.43).

**Uses.**

- `CK Theorem 6.6, Proposition 6.8, Theorem 8.7`: The exact B_dR⁺ lattice and agreement with the étale comparison determine the integral lattice.

- `CohomologyComparisons:CP.4`: Rational semistable assembly uses this canonical map and its reduction square.

**API.**

- `Semistable.bdrComparisonMap.reduce` (compatibility): The square (6.5.7) commutes: (6.5.1) followed by the reduction modulo ξ, RΓ_crys(X_C^ad/B_dR⁺)→RΓ_dR(X_C^ad/C) of (6.2.6), equals the reduction RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C) of (5.23.2) followed by the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C) to the generic fibre.

- `Semistable.bdrComparisonMap.natural` (functoriality): The local maps (6.5.5) and (6.5.6) are compatible with enlarging (Σ,Λ) and (Ψ,Ξ) and with replacing R by a p-adically formally étale R-algebra R′ with data as in CK §5.17; this is what makes them glue to (6.5.1). Compatibility with arbitrary morphisms of models, and with the semilinear action of Gal(K̄/K) on a model defined over O_K, is not asserted.

- `Semistable.bdrComparisonMap.coefficients` (data): The map is induced by the common A_inf→A_cris→B_dR⁺ coefficient maps, not an arbitrary isomorphism of equal-rank modules.

- `Semistable.bdrComparisonMap.local` (data): For data (Σ,Λ) on Spf R and (Ψ,Ξ) as in (6.5.2), the map D_{Σ,Λ}→D_{Ψ,Ξ}(R[1/p]) of (6.5.5) is a continuous A_cris-algebra map sending the images of X_σ, X_{λ,i} (1≤i≤d) and X_{λ,0} to X_{t_σ}, X_{t_{λ,i}} and [(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}}); it commutes with the maps D_{Σ,Λ}→R and D_{Ψ,Ξ}(R[1/p])→R[1/p] and intertwines ∂/∂log X_σ and ∂/∂log X_{λ,i} with ∂/∂log X_{t_σ} and ∂/∂log X_{t_{λ,i}}.

**Unit tests.**

- `Semistable.bdrComparisonMap.point` (degenerate): For 𝔛=Spf O_C (d=0, Σ=∅, one chart with r=0) both sides are concentrated in degree 0: RΓ_logcrys(Spec(O_C/p)/A_cris)=A_cris and RΓ_crys(Spa(C,O_C)/B_dR⁺)=B_dR⁺. The map (6.5.1) is the inclusion A_cris→B_dR⁺ of CK §6.1, and its B_dR⁺-linearisation is the identity of B_dR⁺.

- `Semistable.bdrComparisonMap.good_reduction` (compatibility): For 𝔛 proper and smooth over O_C (the log structure is then pulled back from the base, so Ω^j_{𝔛/O_C,log}=Ω^j_{𝔛/O_C}), the reduction modulo ξ of the B_dR⁺-linear map is identified by (5.23.2) and (6.2.6) with the canonical isomorphism RΓ_dR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C); hence the map is an isomorphism, as in BMS1 Proposition 13.23. For the p-adic completion of P¹_{O_C} both sides have cohomology B_dR⁺, 0, B_dR⁺ in degrees 0, 1, 2. Equality with the map of BMS1 Proposition 13.23 is not asserted: BMS1 does not write that map down.

- `Semistable.bdrComparisonMap.node` (compatibility): On the chart R□=O_C{t_0,t_1}/(t_0t_1−p^q), with A=R□[1/p]: Ω¹_{R□/O_C,log} is free on dlog t_1=−dlog t_0, Ω^{1,cont}_{A/C} is free on dT_1/T_1=−dT_0/T_0, and the lower arrow of (6.5.7) is in degree 1 the R□-linear map dlog t_1↦dT_1/T_1. So the relation dlog t_0+dlog t_1=0 goes to dT_0/T_0+dT_1/T_1=0, and the arrow becomes an isomorphism after inverting p. On the B_dR⁺ side t_1 is a coordinate in Ξ and t_0 is omitted.

**Acceptance.**

- The square (6.5.7) commutes in the derived category: the map followed by the reduction modulo ξ of (6.2.6) equals the reduction (5.23.2) to RΓ_logdR(𝔛/O_C) followed by the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C).

- The map and the square are constructed without properness; properness enters only in the composite with RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris.

- On a node chart the coordinate t_{λ,1} is placed in Ξ (it is invertible in R[1/p] but not in R) and t_{λ,0} is omitted; the target is therefore one of the rings D_{Ψ,Ξ}(A) with Ξ≠∅ of bdr-cohomology-etale-embeddings.

**Direct prerequisites.** `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/log-exactification`, `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.6/all-coordinates-log-crystalline`, `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `CohomologyComparisons:CP.3`, `AInfCohomology:AI.0:period-comparison`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `AdicEtaleGeometry:A1`.

**Sources.**

- CK: §6.5, map (6.5.1), p.64; §6.5, (6.5.2), p.64; §6.5, (6.5.4)–(6.5.5), p.65; §6.5, (6.5.6), p.65; §6.5, square (6.5.7), p.65; Corollary 5.43, (5.43.2), p.58.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Semistable B_dR⁺ comparison

`AInfCohomology:AI.6/bdr-comparison` · theorem · declaration `Semistable.bdrComparison`

Atlas planet: **Semistable B_dR⁺ comparison**.

**Statement.** For proper 𝔛, bdr-comparison-map is an equivalence RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺), and hence RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺). In every degree it gives H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺≃H^i_crys(X_C^ad/B_dR⁺), a finite free B_dR⁺-module. Modulo ξ the second equivalence is compatible with the identifications of both sides with RΓ_dR(X_C^ad/C): on the source the log de Rham specialization (4.18.1) of log-de-rham followed by RΓ_logdR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C), on the target the reduction (6.2.6).

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C.

**Proof or construction.**

1. By proper-perfectness (CK Corollary 4.20) and global-crystalline (CK Corollary 5.43, whose freeness assertion rests on Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.18, Theorem), RΓ_logcrys(𝔛_{O_C/p}/A_cris) is a perfect complex over A_cris whose cohomology modules are finite free after inverting p. Hence its base change to B_dR⁺ is derived ξ-complete with finite free cohomology. The finite freeness is not imported from CP.3.

2. By CK Remark 5.24, (5.24.1) (Beilinson, (1.11.1); CR.5), the map (5.23.2) is an isomorphism after ⊗^L O_C/p; both RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}O_C and RΓ_logdR(𝔛/O_C) are perfect over O_C, hence derived p-complete, so RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}O_C≃RΓ_logdR(𝔛/O_C). By bdr-cohomology-etale-embeddings ((6.2.5), (6.2.6)), RΓ_crys(X_C^ad/B_dR⁺) is derived ξ-complete with reduction RΓ_dR(X_C^ad/C).

3. By the square (6.5.7) of bdr-comparison-map, the reduction modulo ξ of the map is RΓ_logdR(𝔛/O_C)⊗_{O_C}C→RΓ_dR(X_C^ad/C). This is an isomorphism: coherent cohomology of the proper formal scheme and of its adic generic fibre agree after inverting p, and Ω^j_{𝔛/O_C,log}[1/p] is the sheaf of continuous differentials of the generic fibre. CK use this without citation; it is the statement taken from AdicSpacesPartII:R3. By derived Nakayama for ξ (E4/mod-ideal-detection, AI.5) the map is an isomorphism; this is (6.6.1), and the freeness of the H^i_crys(X_C^ad/B_dR⁺) follows from the first step.

4. Combine with (5.43.2) of global-crystalline to obtain (6.6.2). The degreewise form is not in the statement of CK Theorem 6.6; it follows from the flatness of B_dR⁺ over A_inf (CK §6.1, by Raynaud–Gruson, Critères de platitude et de projectivité, II.1.4.2.1; AI.0:period-comparison), which gives H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺)=H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺. CK use it in this form in the proof of Theorem 8.7.

5. The compatibility modulo ξ with (4.18.1) follows from crystalline-de-rham-square (CK Proposition 5.41) and the commutativity of (6.5.7) (CK Theorem 6.6).

**Acceptance.**

- The complex comparison and the degreewise finite-free statement are both required.

- The reduction modulo ξ of the equivalence is the isomorphism RΓ_logdR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C); for the p-adic completion of P¹_{O_C} both sides have cohomology B_dR⁺, 0, B_dR⁺ in degrees 0, 1, 2.

**Direct prerequisites.** `AInfCohomology:AI.6/bdr-comparison-map`, `AInfCohomology:AI.6/proper-perfectness`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/crystalline-de-rham-square`, `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `CohomologyComparisons:CP.3`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.0:period-comparison`, `AInfCohomology:AI.5`, `EnhancedDerivedSheaves:E4/mod-ideal-detection`, `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `AdicSpacesPartII:R3`.

**Sources.**

- CK: Theorem 6.6, p.66; Theorem 6.6, mod-ξ clause, p.66; Theorem 6.6, proof, p.66; Corollary 5.43, p.58; Remark 5.24, (5.24.1), p.44; Proposition 5.41, p.56; §6.1, p.60.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Semistable étale specialization

`AInfCohomology:AI.6/etale-comparison` · theorem · declaration `Semistable.etaleComparison`

**Statement.** If 𝔛 is proper over O_C, then RΓ_Ainf(𝔛)⊗^L_{A_inf}A_inf[1/μ]≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf[1/μ] (CK Theorem 2.3); both tensor products are ordinary derived tensor products. The identification is induced by the map RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf→RΓ_proét(X_C^ad,A_inf,X) coming from the inclusion of Z_p in A_inf,X, whose cone has cohomology killed by W(m^♭), and by AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]; it is compatible with Frobenius, acting through A_inf,X on the left and through A_inf on the right. It is natural for isomorphisms lying over continuous automorphisms of O_C (aomega, API item semilinear); in particular for 𝔛=𝔛₀⊗̂_{O_K}O_C it is G_K-equivariant, G_K acting on the right side through both factors, which CK use in the proof of Theorem 8.7. Compatibility with products is not asserted. For non-proper 𝔛 it fails in general. It is generic-fibre p-adic étale cohomology, not special-fibre étale cohomology and not mere p-inversion.

**Additional hypotheses.**

- 𝔛 is proper over O_C; then X_C^ad is smooth and proper over C (CK §1.5).

**Proof or construction.**

1. By aomega (CK (2.2.7)), AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]; 𝔛 being quasi-compact and quasi-separated, RΓ(𝔛_ét,−) commutes with inverting μ, so RΓ_Ainf(𝔛)⊗^L A_inf[1/μ]≅RΓ_proét(X_C^ad,A_inf,X)⊗^L A_inf[1/μ].

2. Primitive comparison (Scholze; BMS1 Theorem 5.7, cited by CK as [BMS18, 5.6]; AI.3): X_C^ad is a proper smooth adic space over the algebraically closed field C (Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1 and 1.3.18 ii)), so the cone of the map CK (2.3.2) has cohomology killed by W(m^♭) (almost purity gives [m^♭]; derived p-completeness, as in CK Lemma 3.17, gives W(m^♭)).

3. μ lies in W(m^♭), so (2.3.2) becomes an isomorphism after inverting μ; with the first step this is (2.3.1). Frobenius compatibility is read off from the construction, as CK does when it uses (2.3.1) in §9. Naturality for isomorphisms over automorphisms of O_C: the maps (2.2.7) and (2.3.2) are induced by maps of sheaves on the pro-étale site of the generic fibre that are defined for every pair (C,X_C^ad), hence commute with the pullback isomorphisms of aomega (API item semilinear).

**Acceptance.**

- For 𝔛=Spf O_C both sides are A_inf[1/μ] and the map is the identity.

- Properness is necessary. For 𝔛=Spf O_C{t^{±1}}, base change of both sides along A_inf[1/μ]→A_inf[1/μ]/ξ̃=C gives H⁰=C⟨t^{±1}⟩ on the left (by hodge-tate-comparison, H⁰(Ω̃_𝔛)=O_𝔛) and H⁰=C on the right (the generic fibre is connected and C is flat over Z_p), so the two sides are not isomorphic.

- After inverting only p there is no natural, Frobenius-compatible comparison: it would specialise along A_inf[1/p]→W(k̄)[1/p] to a Frobenius-equivariant isomorphism of H^i_logcris(𝔛_k̄/W(k̄))[1/p] with H^i_ét(X_C^ad,Z_p)⊗W(k̄)[1/p], on which Frobenius acts through W(k̄) only, forcing all slopes to be 0; for 𝔛=P¹_{O_C} and i=2 the slope is 1. (A non-canonical isomorphism of complexes does exist after inverting p, both sides then having finite free cohomology of equal ranks by CK Theorem 7.4 and Corollary 7.5.)

**Direct prerequisites.** `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.3`, `AInfCohomology:AI.0:integral`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `AdicEtaleGeometry:A1`.

**Sources.**

- CK: §1.5, p.5; §2.2, p.9; Theorem 2.3, p.9; Theorem 2.3 (sketch of proof), p.9; Theorem 9.5 (proof), p.76; Theorem 8.7 (proof), p.74.

- BMS1: Theorem 5.7, p.287.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Étale and B_dR comparison agreement

`AInfCohomology:AI.6/etale-bdr-agreement` · theorem · declaration `Semistable.etaleBdrAgreement`

**Statement.** Let 𝔛 be proper. Let c: RΓ_crys(X_C^ad/B_dR⁺)→RΓ_ét(X_C^ad,Z_p)⊗_{Z_p}B_dR⁺ be the map of BMS1 (proof of Theorem 13.1) supplied by CP.3; it becomes an isomorphism after ⊗_{B_dR⁺}B_dR, the identification (6.7.1), and is not asserted to be an isomorphism over B_dR⁺. Then the diagram of CK Proposition 6.8 commutes: the composite of bdr-comparison-map’s (6.5.1), of c and of the isomorphism RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}B_dR⁺≃RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ induced by (2.3.2) equals the composite of the isomorphism RΓ_logcrys(𝔛_{O_C/p}/A_cris)≃RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris ((5.43.2) of global-crystalline, the global form of absolute-crystalline’s (5.40.1), which is the label in CK’s diagram) and the map to RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ induced by Lη_μ→id (BMS1 Lemma 6.10). Consequently, after base change to B_dR, the identification RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}B_dR obtained from etale-comparison equals the one obtained from bdr-comparison and (6.7.1). If moreover X_C^ad≃X₀⊗̂_K C for a proper smooth adic space X₀ over K, with K as in the hypotheses, then under RΓ_crys(X_C^ad/B_dR⁺)≃RΓ_dR(X₀/K)⊗_K B_dR⁺ ((6.2.8), using the canonical K→B_dR⁺) the identification (6.7.1) becomes the de Rham comparison (6.7.2) RΓ_ét(X_C^ad,Z_p)⊗_{Z_p}B_dR≃RΓ_dR(X₀/K)⊗_K B_dR; when C is the completion of K̄ it is Gal(K̄/K)-equivariant, recovers Scholze’s comparison isomorphism and is compatible with filtrations (the valuation filtration of B_dR, the Hodge filtration on RΓ_dR(X₀/K) and the trivial filtration on étale cohomology).

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C.

- For the last sentence only: K⊂C is a complete discretely valued subfield with perfect residue field and X₀ is a proper smooth adic space over K with X_C^ad≃X₀⊗̂_K C (CK (6.2.8)); for Galois equivariance, agreement with Scholze’s isomorphism and compatibility with filtrations, C is the completion of K̄ (CK §6.7).

**Proof or construction.**

1. (2.3.2)⊗B_dR⁺ is an isomorphism: the cohomology of the cone of (2.3.2) is killed by W(𝔪^♭) (etale-comparison; discussion after CK Theorem 2.3), and φ⁻¹(μ)∈W(𝔪^♭) is a unit of B_dR⁺.

2. Recall c from BMS1, proof of Theorem 13.1 (CP.3): for Spa(A,A°) in the basis of CK §6.2 and Ψ large, the perfectoid ∏_Ψ Z_p(1)-cover Spa(A_{Ψ,∞},A⁺_{Ψ,∞}) gives a continuous B_dR⁺-map D_Ψ(A)→B_dR⁺(A⁺_{Ψ,∞}), X_u↦[u^{1/p^∞}] (6.8.2), which intertwines exp(log([ε])·∂/∂log X_u) with the generator γ_u of the u-th copy of Z_p(1). The formula of (5.16.1) then gives maps of complexes Ω^•_{D_Ψ(A)/B_dR⁺}→K_{B_dR⁺(A⁺_{Ψ,∞})}((γ_u−1)_{u∈Ψ}) (6.8.3), whose target computes RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ by the almost purity theorem (AI.3). Passing to the colimit over Ψ, sheafifying and taking cohomology gives the composite f of c with (2.3.2).

3. Extend the construction of (6.8.3) to the étale basis of CK §6.2 and to the data (Ψ,Ξ) of CK §6.3, with the cover that adjoins p-power roots of the X_u (u∈Ψ) and of the X_a (a∈Ξ). By (6.2.7) and (6.3.12) of bdr-cohomology-etale-embeddings both variants give the same f. CK say that the remaining modifications are mild; they have to be carried out here, so a local comparison for non-unit coordinates is constructed in this node.

4. Since f is now built in the setting of CK §6.3 by the same pattern as (5.40.1) (absolute-crystalline; the map of (5.16.1)), the proposition reduces to the commutativity of the square of rings (6.8.4): D_{Σ,Λ}→D_{Ψ,Ξ}(A)→B_dR⁺(A⁺_{Ψ,Ξ,∞}), by (6.5.5) of bdr-comparison-map and (6.8.2), equals D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞})→B_dR⁺(A⁺_{Ψ,Ξ,∞}), by (5.38.1) of all-coordinates-map and (5.36.1). Check it modulo ξⁿ, then on D_{j_{λ₀}}, then, the target being a Q-algebra, on (A□_{Σ,Λ}⊗_{A_inf}A_cris⁰)⊗_{Z[Q]}Z[P_{λ₀}]: both maps send X_τ to the unit [X_τ^{1/p^∞}] for τ=σ∈Σ and τ=(λ,i), 1≤i≤d (CK Proposition 6.8).

5. The statement over B_dR follows by inverting ξ, using bdr-comparison ((6.6.2)) and CP.3’s (6.7.1).

6. Descended case (CK §6.7): (6.2.8) is BMS1 Remark 13.20 (CP.3), with the unique continuous lift K→B_dR⁺ of K→C; combined with (6.7.1) it gives (6.7.2). If C is the completion of K̄, then (6.7.2) is Galois equivariant by transport of structure and, by BMS1 Theorem 13.1, recovers the isomorphism of Scholze, p-adic Hodge theory for rigid-analytic varieties, Theorem 8.4; hence it is compatible with filtrations.

**Acceptance.**

- Equality of these actual maps, rather than existence of some isomorphism, is the lattice input.

- The map c is an isomorphism only after inverting ξ: for X_C^ad=P¹_C in degree 2 its image is ξ·(H²_ét(P¹_C,Z_p)⊗_{Z_p}B_dR⁺).

**Direct prerequisites.** `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/bdr-comparison`, `AInfCohomology:AI.6/bdr-comparison-map`, `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `AInfCohomology:AI.6/all-coordinates-map`, `AInfCohomology:AI.6/absolute-crystalline`, `AInfCohomology:AI.3`, `CohomologyComparisons:CP.3`, `AInfCohomology:AI.6/finite-level-acris`, `AInfCohomology:AI.1`, `AInfCohomology:AI.0:period-comparison`, `AInfCohomology:AI.6/global-crystalline`.

**Sources.**

- CK: Proposition 6.8, p.66 (proof pp.67–68); Proposition 6.8, conclusion, p.66; Proposition 6.8, proof, p.67; §6.7, (6.7.1), p.66; §6.7, (6.7.2), p.66; §6.2, (6.2.8), p.61.

- BMS1: Theorem 13.1, p.368; Remark 13.20, p.384; Lemma 6.10, p.292.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Semistable cohomological BKF modules

`AInfCohomology:AI.6/cohomological-bkf` · theorem · declaration `Semistable.cohomologicalBKF`

**Statement.** For proper 𝔛, each H^i_Ainf(𝔛) is finitely presented over A_inf and finite free after p-inversion, with the Frobenius isomorphism after ξ̃-inversion required by AI.2. If 𝔛_k̄ has dimension at most d the module is zero outside 0,…,2d (proper-perfectness; CK Theorem 7.4 assumes pure dimension d). If 𝔛=𝔛₀⊗̂_{O_K}O_C for a formal O_K-scheme 𝔛₀, with K as in CK §8.1, the semilinear action of G_K on H^i_Ainf(𝔛) (aomega, API item semilinear) commutes with the Frobenius isomorphism (CK §8.3). These are finitely presented BKF modules, with possible p-torsion, not automatically finite free BKF lattices.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C. Pure dimension d of the special fibre 𝔛_{k̄} (CK §7.1) is assumed only for the vanishing outside 0,…,2d.

**Proof or construction.**

1. By proper-perfectness (CK Corollary 4.20), RΓ_Ainf(𝔛) is a perfect complex. By etale-comparison (CK Theorem 2.3) and flatness of A_inf→A_inf[1/μ], H^i_Ainf(𝔛)[1/pμ]≃H^i_ét(X_C^ad,Z_p)⊗_{Z_p}A_inf[1/pμ] is free over A_inf[1/pμ]. By global-crystalline (CK Corollary 5.43), the cohomology modules of RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris[1/p] are free over A_cris[1/p].

2. Apply BMS1 Corollary 4.20 (AI.5; its proof uses BMS1 Lemma 4.19, Corollary 4.17 and Lemma 4.9): each H^i_Ainf(𝔛) is finitely presented and H^i_Ainf(𝔛)[1/p] is free over A_inf[1/p]. The Frobenius of aomega-frobenius (CK (2.2.5), (2.2.6)) is an isomorphism after inverting ξ̃=φ(ξ) and passes to cohomology because φ is an automorphism of A_inf. Hence each H^i_Ainf(𝔛) is a Breuil–Kisin–Fargues module in the sense of BMS1 Definition 4.22, the definition imported from AI.2 (CK §7.3, Theorem 7.4).

3. Vanishing outside 0,…,2d is part of proper-perfectness (CK Theorem 7.4). Galois action (CK §8.1, §8.3): the Frobenius of aomega-frobenius is induced by the Frobenius of the period sheaf A_inf,X, which commutes with the pullback isomorphisms of aomega (API item semilinear); so the action of G_K on H^i_Ainf(𝔛) commutes with the Frobenius isomorphism.

**Acceptance.**

- A p-torsion cohomology module remains allowed; the finite-free Fargues classification is not applied to it.

**Direct prerequisites.** `AInfCohomology:AI.6/proper-perfectness`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/aomega-frobenius`, `AInfCohomology:AI.5`, `AInfCohomology:AI.2`, `AInfCohomology:AI.6/aomega`.

**Sources.**

- CK: Theorem 7.4 with proof, p.69; §7.3, p.69; §7.2, Frobenius, p.68; §7.1, p.68; §8.3, p.72.

- BMS1: Corollary 4.20, pp.275–276.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Degreewise semistable specialization sequences

`AInfCohomology:AI.6/degreewise-specializations` · theorem · declaration `Semistable.degreewiseSpecializations`

**Statement.** For proper 𝔛 and every i, H_A^i⊗_{A_inf}W(C^♭)≃H_ét^i(X_C,Z_p)⊗_{Z_p}W(C^♭). There are exact sequences 0→H_A^i⊗_{θ}O_C→H_logdR^i→H_A^{i+1}[ξ]→0 and, Frobenius-equivariantly, 0→H_A^i⊗W(k̄)→H_logcrys^i→Tor₁^{A_inf}(H_A^{i+1},W(k̄))→0. Here H_logcrys^i=H_logcrys^i(𝔛_{k̄}/W(k̄)) is taken over W(k̄) with the log structure associated with Q≥0→W(k̄), 0≠q↦0, 0↦1, of CK §5.42, as in global-crystalline; the passage to the ℕ log point is hyodo-kato-interface and is not used here.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Proof or construction.**

1. Étale: by etale-comparison and flatness of A_inf→A_inf[1/μ], H_A^i[1/μ]≃H_ét^i(X_C,Z_p)⊗_{Z_p}A_inf[1/μ] ((7.6.1)). Since μ is a unit of W(C^♭) and W(C^♭) is A_inf-flat (the localisation of A_inf at (p) is a discrete valuation ring with completion W(C^♭)), base change gives (7.6.2).

2. De Rham: apply the universal-coefficient sequence (Stacks Project 0662; AI.5) to RΓ_Ainf(𝔛)⊗^L_{A_inf,θ}O_C≃RΓ_logdR(𝔛/O_C) (log-de-rham, CK Corollary 4.18). Since O_C=A_inf/ξ with ξ a nonzerodivisor, Tor₁^{A_inf}(M,O_C)=M[ξ] and the higher Tor groups vanish; this gives (7.6.3).

3. Crystalline: apply the same to RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)) (global-crystalline, CK (5.43.2), Frobenius-equivariant). By cohomological-bkf (CK Theorem 7.4) each H_A^j is finitely presented with H_A^j[1/p] free, so by BMS1 Lemma 4.9(iii) (AI.5) it has Tor-dimension at most 2 and Tor₂^{A_inf}(H_A^j,W(k̄))=0. The spectral sequence therefore has only the Tor₀ and Tor₁ columns and gives (7.6.4). The adjacent-degree terms are retained, not collapsed (CK §7.6).

**Acceptance.**

- H_A^{i+1}[ξ] and Tor₁ must appear explicitly when no adjacent freeness is assumed.

- If 𝔛_{k̄} is purely d-dimensional, then in the top degree both error terms vanish: H_A^{2d}⊗_{θ}O_C≃H_logdR^{2d} and H_A^{2d}⊗W(k̄)≃H_logcrys^{2d}.

**Direct prerequisites.** `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.5`.

**Sources.**

- CK: §7.6, (7.6.1)–(7.6.2), p.69; §7.6, (7.6.3), p.69; §7.6, (7.6.4), p.69; §7.6, top degree, p.69; §5.42, p.58.

- BMS1: Lemma 4.9(iii), p.269.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### One-degree semistable freeness criterion

`AInfCohomology:AI.6/freeness-criterion` · theorem · declaration `Semistable.freenessCriterion`

**Statement.** For proper 𝔛 and fixed i, H_logdR^i(𝔛/O_C) is O_C-free iff H_logcrys^i(𝔛_{k̄}/W(k̄)) is W(k̄)-free. Under either condition H_A^i is A_inf-free and H_ét^i(X_C,Z_p) is Z_p-free. This alone does not remove the adjacent-degree terms from degreewise-specializations.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Proof or construction.**

1. By proper-perfectness and cohomological-bkf (CK Theorem 7.4), RΓ_Ainf(𝔛) is a perfect complex all of whose cohomology modules are free after inverting p. BMS1 Lemma 4.18 (AI.5) then says, for the fixed i, that H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)) is p-torsion-free if and only if H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}O_C) is. By the specializations (7.2.1) (global-crystalline, log-de-rham) these groups are H_logcrys^i(𝔛_{k̄}/W(k̄)) and H_logdR^i(𝔛/O_C). Both are finitely presented modules over valuation rings, so p-torsion-free is equivalent to free.

2. When these conditions hold, BMS1 Corollary 4.17 (AI.5; it uses BMS1 Proposition 4.13 and Lemma 4.16) gives that H_A^i is finite free and that H_A^i⊗_{A_inf}W(C^♭) is p-torsion-free; by (7.6.1), (7.6.2) of degreewise-specializations this module is H_ét^i(X_C,Z_p)⊗_{Z_p}W(C^♭), so H_ét^i(X_C,Z_p) is Z_p-free. No hypothesis on degree i+1 is used (CK Proposition 7.7).

3. The last sentence of the statement is a caution, not part of CK Proposition 7.7: the terms H_A^{i+1}[ξ] and Tor₁^{A_inf}(H_A^{i+1},W(k̄)) of degreewise-specializations depend on degree i+1, and CK §7.6 notes that they vanish when H_A^{i+1} is A_inf-free.

4. Alternative route for the equivalence, not used here (CK Remark 7.8): the derived reductions to k̄ of RΓ_logdR(𝔛/O_C) and RΓ_logcrys(𝔛_{k̄}/W(k̄)) agree, the ranks agree by CK Corollary 7.5, and universal coefficients over the two valuation rings show by descending induction on the degree that the two modules have the same number of cyclic torsion summands.

**Acceptance.**

- For full degree-i specialization identities additionally impose the required adjacent-degree freeness.

**Direct prerequisites.** `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.6/proper-perfectness`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.5`.

**Sources.**

- CK: Proposition 7.7, p.70; Proposition 7.7, proof, p.70; §7.6, p.70; Remark 7.8, p.70.

- BMS1: Lemma 4.18, p.274; Corollary 4.17, p.274.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Semistable cohomology rank equality

`AInfCohomology:AI.6/rank-equality` · theorem · declaration `Semistable.rankEquality`

**Statement.** For proper 𝔛, the generic ranks of H_A^i, H_ét^i(X_C,Z_p), H_logdR^i and H_logcrys^i over A_inf, Z_p, O_C and W(k̄), respectively, are equal. Rank is computed after the relevant fraction-field or p-inverted free specialization; it does not assert equality of torsion.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Proof or construction.**

1. By cohomological-bkf (CK Theorem 7.4) every H_A^j[1/p] is finite free over A_inf[1/p]. Hence, after inverting p, each base change of the perfect complex RΓ_Ainf(𝔛) is computed degree by degree. The maps θ: A_inf→O_C and A_inf→W(k̄) are not flat; freeness of the H_A^j[1/p], not flatness, is what is used.

2. Apply this to the three specializations (7.2.1): etale-comparison (over A_inf[1/μ]), log-de-rham (along θ, CK (4.18.1)) and global-crystalline (over W(k̄), CK (5.43.2)). They give H_ét^i(X_C,Z_p)⊗_{Z_p}A_inf[1/pμ]≃H_A^i[1/pμ], H_logdR^i[1/p]≃H_A^i[1/p]⊗_{A_inf[1/p],θ}C and H_logcrys^i[1/p]≃H_A^i[1/p]⊗_{A_inf[1/p]}W(k̄)[1/p], so all the ranks equal the rank of the free A_inf[1/p]-module H_A^i[1/p] (CK Corollary 7.5). The rank of H_A^i itself is not in the statement of Corollary 7.5; it is in its proof.

3. Finite presentation of H_ét^i, H_logdR^i and H_logcrys^i, needed to speak of their ranks, follows from the perfectness of RΓ_Ainf(𝔛), (7.2.1) and the coherence of O_C (CK Corollary 7.5, proof).

**Acceptance.**

- A torsion summand changes lengths while leaving these ranks unchanged.

**Direct prerequisites.** `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.5`.

**Sources.**

- CK: Corollary 7.5, p.69; Corollary 7.5, proof, p.69; §7.2, (7.2.1), p.68.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Étale–log crystalline torsion inequalities

`AInfCohomology:AI.6/crystalline-torsion` · theorem · declaration `Semistable.crystallineTorsion`

**Statement.** For proper 𝔛, all i and n≥0, length_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤length_{W(k̄)}(H_logcrys^i(W(k̄))_tors/p^n), and length_{Z_p}H_ét^i(Z/p^n)≤length_{W(k̄)}H_logcrys^i(W_n(k̄)). These are length inequalities, not a canonical injection or a subquotient assertion.

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this. The log crystalline cohomology of 𝔛_{k̄} is taken over W(k̄), resp. W_n(k̄), with the log structure of CK §5.42, as in degreewise-specializations.

**Proof or construction.**

1. By rank-equality (CK Corollary 7.5), H_ét^i(X_C^ad,Z_p) and H_logcrys^i(𝔛_{k̄}/W(k̄)) have the same rank r; for a finitely generated module H over a discrete valuation ring with uniformizer p, length(H/p^n)=nr+length(H_tors/p^n), so the torsion subscripts may be dropped.

2. By cohomological-bkf (CK Theorem 7.4), M=H_A^i is finitely presented with M[1/p] free. BMS1 Corollary 4.15(ii) (AI.5; deduced from BMS1 Lemma 4.14) gives length((M⊗_{A_inf}W(C^♭))/p^n)≤length_{W(k̄)}((M⊗_{A_inf}W(k̄))/p^n), and by (7.6.2) of degreewise-specializations the left side is length_{Z_p}(H_ét^i(X_C^ad,Z_p)/p^n). This is (7.9.2).

3. In the sequence (7.6.4) of degreewise-specializations, 0→M⊗W(k̄)→H_logcrys^i→Q→0, the module Q=Tor₁^{A_inf}(H_A^{i+1},W(k̄)) is finite and torsion. The exact sequence Tor₁^{W(k̄)}(Q,W(k̄)/p^n)→(M⊗W(k̄))/p^n→H_logcrys^i/p^n→Q/p^n→0 and the equality length(Q/p^n)=length(Tor₁^{W(k̄)}(Q,W(k̄)/p^n)) give length((M⊗W(k̄))/p^n)≤length(H_logcrys^i/p^n). This proves the first inequality.

4. Second inequality: the universal-coefficient sequences (Stacks Project 0662) 0→H^i/p^n→H^i(−,Z/p^n), resp. H_logcrys^i(𝔛_{k̄}/W_n(k̄)), →H^{i+1}[p^n]→0 hold on both sides, and length(T[p^n])=length(T/p^n) for a torsion module T of finite length. So the second inequality follows from the first in degrees i and i+1 together with rank-equality (CK Theorem 7.9). CK cite no result for the identification of the finite-coefficient groups with the derived reductions modulo p^n, and it has no supplier among the prerequisites.

**Acceptance.**

- At n=1 distinguish torsion quotients from finite-coefficient cohomology.

**Direct prerequisites.** `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.6/rank-equality`, `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.5`.

**Sources.**

- CK: Theorem 7.9, p.70; Theorem 7.9, proof, p.70; Theorem 7.9, end of proof, p.70.

- BMS1: Corollary 4.15, p.272; Theorem 14.5(ii), p.393.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Étale–log de Rham torsion inequalities

`AInfCohomology:AI.6/de-rham-torsion` · theorem · declaration `Semistable.deRhamTorsion`

**Statement.** For proper 𝔛, all i and n≥0, v_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤v_{O_C}(H_logdR^i(O_C)_tors/p^n), and v_{Z_p}H_ét^i(Z/p^n)≤v_{O_C}H^i(𝔛_{O_C/p^n},Ω^•_{𝔛_{O_C/p^n}/(O_C/p^n),log}), the logarithmic de Rham cohomology of the reduction of 𝔛 modulo p^n. Here v(p)=1 and v(⊕O_C/(a_j))=Σv(a_j); this normalized valuation length is not ordinary O_C-module length. Over O_K it is length_{O_K}/length_{O_K}(O_K/p).

**Additional hypotheses.**

- 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Proof or construction.**

1. Import from AI.5 the normalized length of CK §7.10 for a valuation ring 𝔬 of rank 1 and mixed characteristic (0,p): finitely presented 𝔬-modules are direct sums of cyclic modules (Stacks Project 0ASP; Gabber–Ramero, Almost ring theory, 6.1.14), v_𝔬 of a finitely presented torsion module is the valuation of a generator of its zeroth Fitting ideal, and v_𝔬 is additive in short exact sequences (Gabber–Ramero 6.3.1 and 6.3.5(i)). Import also CK Lemma 7.11: for a finitely presented W_n(O_C^♭)-module M, v_{W(C^♭)}(M⊗_{A_inf}W(C^♭))=v_{O_C}(M/ξM)−v_{O_C}(M[ξ]); its proof uses the coherence of W_n(O_C^♭) (BMS1 Proposition 3.24).

2. By rank-equality (CK Corollary 7.5) the torsion subscripts may be dropped. By cohomological-bkf (CK Theorem 7.4), M=H_A^i/p^n is a finitely presented W_n(O_C^♭)-module; Lemma 7.11 and (7.6.2) of degreewise-specializations give v_{Z_p}(H_ét^i(X_C^ad,Z_p)/p^n)≤v_{O_C}(H_A^i/(p^n,ξ)).

3. In the sequence (7.6.3) of degreewise-specializations the module Q=H_A^{i+1}[ξ] is finitely presented and torsion, and v_{O_C}(Q/p^n)=v_{O_C}(Tor₁^{O_C}(Q,O_C/p^n)) by the presentation (7.10.1). Hence v_{O_C}(H_A^i/(p^n,ξ))≤v_{O_C}(H_logdR^i(𝔛/O_C)/p^n), which proves the first inequality.

4. The second inequality follows from the first in degrees i and i+1 by the universal-coefficient sequences (Stacks Project 0662), as in CK Theorem 7.9. Here RΓ_logdR(𝔛/O_C)⊗^L_{O_C}O_C/p^n≃RΓ(𝔛_{O_C/p^n},Ω^•_log) because 𝔛 is O_C-flat and the sheaves Ω^j_{𝔛/O_C,log} are locally free (CK Theorem 7.12). The proof is parallel to that of CK Theorem 7.9 and does not use its conclusion.

5. The formula over O_K is not in CK. It follows from CK §7.10: for a discrete valuation ring O_K with e=length_{O_K}(O_K/p), v_{O_K}(O_K/π^m)=m/e, and both v_{O_K} and length are additive.

**Acceptance.**

- For O_K/(π), normalized length is 1/e, not 1 when e>1.

**Direct prerequisites.** `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.6/rank-equality`, `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.5`.

**Sources.**

- CK: §7.10, p.71; §7.10, Fitting ideal, p.71; Lemma 7.11, p.71; Theorem 7.12, p.71; Theorem 7.12, proof, p.71.

- BMS1: Proposition 3.24, p.258.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### The de Rham lattice attached to an étale lattice

`AInfCohomology:AI.6/de-rham-lattice-functor` · construction · declaration `Semistable.deRhamLatticeFunctor`

**Statement.** Let K, C and G be as in the hypotheses. (a) A Breuil–Kisin–Fargues G-module is a Breuil–Kisin–Fargues module (M,φ_M) (AI.2) with an A_inf-semilinear G-action on M for which φ_M is G-equivariant; morphisms are the G-equivariant morphisms of Breuil–Kisin–Fargues modules. Its étale realization M_ét=(M⊗_{A_inf}W(C^♭))^{φ_M⊗φ=1} carries the induced Z_p-linear G-action. (b) (CK Proposition 8.4) The functor (M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺) is an equivalence from the category of A_inf-free Breuil–Kisin–Fargues G-modules to the category of pairs (T,Ξ), where T is a finite free Z_p-module with a G-action and Ξ⊂T⊗_{Z_p}B_dR is a G-stable B_dR⁺-lattice. (c) Let T be a finite free Z_p-module with a continuous G-action such that T[1/p] is de Rham, and D_dR(T)=(T⊗_{Z_p}B_dR)^G, so that T⊗_{Z_p}B_dR≃D_dR(T)⊗_K B_dR G-equivariantly. Then D_dR(T)⊗_K B_dR⁺ is a G-stable B_dR⁺-lattice in T⊗_{Z_p}B_dR, and M(T) is the A_inf-free Breuil–Kisin–Fargues G-module corresponding under (b) to the pair (T, D_dR(T)⊗_K B_dR⁺). It depends functorially on T. (d) The de Rham realization M(T)_dR=M(T)⊗_{A_inf,θ}O_C is an O_C-lattice in (M(T)⊗_{A_inf}B_dR⁺)/ξ≃(D_dR(T)⊗_K B_dR⁺)/ξ≃D_dR(T)⊗_K C, and L_dR(T)=(M(T)_dR)^G is an O_K-lattice in the K-vector space D_dR(T), functorial in T. (e) (CK Example 8.6) For X proper and smooth over K, a K-scheme or a rigid space over K viewed as an adic space, put L^i_ét(X)=H^i_ét(X_{K̄},Z_p)/torsion≃H^i_ét(X_C,Z_p)/torsion for i≥0. Then L^i_ét(X)[1/p] is de Rham and D_dR(L^i_ét(X))≃H^i_dR(X/K) by the de Rham comparison (6.7.2), functorially in X ((8.6.1)); L^i_dR(X)=L_dR(L^i_ét(X))⊂H^i_dR(X/K) is an O_K-lattice, functorial in X; and for a finite Galois extension K′/K, L^i_dR(X)=(L^i_dR(X_{K′}))^{Gal(K′/K)} inside H^i_dR(X/K)=(H^i_dR(X_{K′}/K′))^{Gal(K′/K)}. Continuity of the G-action on M(T) and the equality L_dR(T)⊗_{O_K}O_C=M(T)_dR are not asserted.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀; C is the completion of K̄ and G=Gal(K̄/K) acts continuously on C and on A_inf; φ and θ are G-equivariant and the ideals (ξ), (φ(ξ)) and (μ) of A_inf are G-stable (CK §8.1).

- In (c) and (d): T is a finite free Z_p-module with a continuous G-action whose rationalisation T[1/p] is a de Rham representation of G (CK §8.5). In (e): X is proper and smooth over K (CK Example 8.6).

**Proof or construction.**

1. Imported from AI.2 (CK §8.2): for a Breuil–Kisin–Fargues module M, the étale realization M_ét is a finitely generated Z_p-module with M⊗_{A_inf}W(C^♭)≃M_ét⊗_{Z_p}W(C^♭) and M⊗_{A_inf}A_inf[1/μ]≃M_ét⊗_{Z_p}A_inf[1/μ] (BMS1 Lemma 4.26); hence M⊗_{A_inf}B_dR≃M_ét⊗_{Z_p}B_dR, and M⊗_{A_inf}B_dR⁺ is a B_dR⁺-lattice in it because M[1/p] is free. Fargues’ theorem (BMS1 Theorem 4.28): (M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺) is an equivalence from A_inf-free Breuil–Kisin–Fargues modules to pairs (T,Ξ).

2. Equivariant form (CK §8.3, Proposition 8.4): G acts on A_inf, W(C^♭) and B_dR⁺ compatibly with φ and θ (CK §8.1). A semilinear G-action on M commuting with φ_M is a compatible family of isomorphisms between M and its twists by the elements of G; Fargues’ equivalence is compatible with these twists by transport of structure, so it gives the equivalence with pairs carrying a G-action. CK’s proof is the one sentence that the claim follows from §8.2.

3. Construction of M(T) (CK §8.5): D_dR(T) and the G-equivariant isomorphism T⊗_{Z_p}B_dR≃D_dR(T)⊗_K B_dR for de Rham T[1/p] are imported (CP.3 for the geometric case (6.7.2); the general formalism of de Rham representations has no supplier among the prerequisites). With the canonical G-equivariant map K→B_dR⁺ of AI.0:period-comparison, D_dR(T)⊗_K B_dR⁺ is a G-stable B_dR⁺-lattice; define M(T) by Proposition 8.4. Functoriality: a G-equivariant Z_p-linear map T→T′ induces D_dR(T)→D_dR(T′), so it carries the lattice into the lattice and is a morphism of pairs.

4. De Rham realization (CK §8.5): M(T) is A_inf-free, so M(T)⊗_{A_inf,θ}O_C is a free O_C-module and an O_C-lattice in M(T)⊗_{A_inf,θ}C=(M(T)⊗_{A_inf}B_dR⁺)/ξ; this is identified with D_dR(T)⊗_K C through B_dR⁺/ξ=C and K→B_dR⁺→C. All maps are G-equivariant because θ is G-equivariant and (ξ) is G-stable.

5. L_dR(T) is an O_K-lattice. CK state the functorial O_K-lattice conclusion without an argument. Argument: (D_dR(T)⊗_K C)^G=D_dR(T) because C^G=K (Ax–Sen–Tate; PadicHodgeTheory:R06.1/ax-sen-tate-invariants), so L_dR(T)=M(T)_dR∩D_dR(T). Choose an O_K-lattice L_0 of D_dR(T). Two O_C-lattices of one finite-dimensional C-vector space are commensurable, so p^N(L_0⊗_{O_K}O_C)⊂M(T)_dR⊂p^{−N}(L_0⊗_{O_K}O_C) for some N, and (L_0⊗_{O_K}O_C)∩D_dR(T)=L_0 because O_C∩K=O_K. Hence p^N L_0⊂L_dR(T)⊂p^{−N}L_0; as O_K is a discrete valuation ring, L_dR(T) is a free O_K-module of rank dim_K D_dR(T)=rank_{Z_p}T. The inclusion L_dR(T)⊗_{O_K}O_C⊂M(T)_dR can be strict (see the tests).

6. Example 8.6: the de Rham comparison (6.7.2) for X proper and smooth over K, functorial in X, G-equivariant and compatible with filtrations, is imported from CP.3 (Scholze; BMS1 Theorem 13.1 and Remark 13.20). It shows that L^i_ét(X)[1/p] is de Rham and gives (8.6.1). Define L^i_dR(X)=L_dR(L^i_ét(X)); functoriality in X follows from that of (6.7.2) and of T↦L_dR(T). The identification of the étale cohomology of X_{K̄} and of X_C is used as in CK.

7. Finite Galois extensions: for K′/K finite Galois inside K̄ and G′=Gal(K̄/K′), D_dR for G′ is K′⊗_K D_dR(T) (Galois descent for K′/K), so the lattice D_dR(T)⊗_K B_dR⁺ and the Breuil–Kisin–Fargues module M(T) are the same for G and for G′, the G′-action being the restriction. Taking invariants in two stages gives L_dR(T)=(L_dR(T|_{G′}))^{Gal(K′/K)}. CK state this consequence of the definition for L^i_dR(X).

8. Tate twists (not in CK; they follow from the above): the functor to pairs and D_dR on de Rham representations are compatible with tensor products, so M(T⊗T′)≃M(T)⊗_{A_inf}M(T′) by Proposition 8.4. For T=Z_p(1) with basis ε and t=log[ε], D_dR=K·(t^{−1}⊗ε) and the lattice is ξ^{−1}(Z_p(1)⊗B_dR⁺), which is the pair of A_inf{1}=μ^{−1}(A_inf⊗Z_p(1)) (BMS1 Example 4.24 and the sentence after Remark 4.29; AI.2). Hence M(T(n))≃M(T){n}. Since t/μ=1−μ/2+μ²/3−… in B_dR⁺ and θ(μ)=0, the generator μ^{−1}⊗ε reduces to t^{−1}⊗ε in D_dR(Q_p(1))⊗_K C; so L_dR(Z_p(1))=O_K·(t^{−1}⊗ε), and L_dR(T(n))=L_dR(T)·(t^{−n}⊗ε^{⊗n}) because t^{−n}⊗ε^{⊗n} is G-invariant.

**Uses.**

- `CK Theorem 8.7`: For a semistable formal model with H^i and H^{i+1} of log de Rham cohomology free, M(L^i_ét) is identified with H^i_Ainf and L^i_dR with the log de Rham cohomology of the model; the characterisation of M(T) by its pair is what is applied.

- `CohomologyComparisons:CP.5`: Lattice applications use the O_K-lattice L_dR(T) attached to the étale lattice T and its independence of the model.

**API.**

- `Semistable.deRhamLatticeFunctor.equivalence` (equivalence): (M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺) is an equivalence between A_inf-free Breuil–Kisin–Fargues G-modules and pairs (T,Ξ) of a finite free Z_p-module with G-action and a G-stable B_dR⁺-lattice Ξ⊂T⊗_{Z_p}B_dR; morphisms of pairs are the G-equivariant Z_p-linear maps carrying Ξ into Ξ′ (CK Proposition 8.4).

- `Semistable.deRhamLatticeFunctor.bkfModule` (constructor): For a finite free Z_p-module T with continuous G-action and T[1/p] de Rham, M(T) is the A_inf-free Breuil–Kisin–Fargues G-module corresponding to the pair (T, D_dR(T)⊗_K B_dR⁺).

- `Semistable.deRhamLatticeFunctor.map` (functoriality): A G-equivariant Z_p-linear map f:T→T′ between such lattices induces a morphism M(f):M(T)→M(T′) of Breuil–Kisin–Fargues G-modules, with M(id)=id and M(g∘f)=M(g)∘M(f); its étale realization is f.

- `Semistable.deRhamLatticeFunctor.etale_realization` (projection): M(T)_ét=(M(T)⊗_{A_inf}W(C^♭))^{φ⊗φ=1} is identified with T G-equivariantly, and M(T)⊗_{A_inf}A_inf[1/μ]≃T⊗_{Z_p}A_inf[1/μ].

- `Semistable.deRhamLatticeFunctor.bdr_lattice` (characterisation): Inside M(T)⊗_{A_inf}B_dR≃T⊗_{Z_p}B_dR one has M(T)⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺. Conversely an A_inf-free Breuil–Kisin–Fargues G-module M with a G-equivariant isomorphism M_ét≃T under which M⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺ is isomorphic to M(T) by a unique isomorphism inducing M_ét≃T.

- `Semistable.deRhamLatticeFunctor.deRhamRealization` (data): M(T)_dR=M(T)⊗_{A_inf,θ}O_C is a G-stable free O_C-module of rank rank_{Z_p}T and an O_C-lattice in D_dR(T)⊗_K C, through (M(T)⊗_{A_inf}B_dR⁺)/ξ≃(D_dR(T)⊗_K B_dR⁺)/ξ≃D_dR(T)⊗_K C.

- `Semistable.deRhamLatticeFunctor.lattice` (structure): L_dR(T)=(M(T)_dR)^G=M(T)_dR∩D_dR(T) is a free O_K-module of rank rank_{Z_p}T with L_dR(T)[1/p]=D_dR(T). CK assert this; the proof (C^G=K, commensurability with L_0⊗_{O_K}O_C, O_C∩K=O_K) is in the proof steps. One has L_dR(T)⊗_{O_K}O_C⊂M(T)_dR, and equality is not asserted.

- `Semistable.deRhamLatticeFunctor.lattice_map` (functoriality): For a G-equivariant Z_p-linear map f:T→T′, the K-linear map D_dR(f):D_dR(T)→D_dR(T′) carries L_dR(T) into L_dR(T′).

- `Semistable.deRhamLatticeFunctor.finite_extension` (compatibility): For a finite Galois extension K′/K in K̄ and G′=Gal(K̄/K′): M(T|_{G′}) is M(T) with the action restricted to G′, D_dR for G′ is K′⊗_K D_dR(T), and L_dR(T)=(L_dR(T|_{G′}))^{Gal(K′/K)}. CK state this for L^i_dR(X) in Example 8.6; for general T it follows in the same way.

- `Semistable.deRhamLatticeFunctor.tate_twist` (relation): M(T(n))≃M(T){n}=M(T)⊗_{A_inf}A_inf{1}^{⊗n} as Breuil–Kisin–Fargues G-modules, and L_dR(T(n))=L_dR(T)·(t^{−n}⊗ε^{⊗n}) inside D_dR(T(n))=D_dR(T)·(t^{−n}⊗ε^{⊗n}), where ε is a basis of Z_p(1) and t=log[ε]; the element t^{−n}⊗ε^{⊗n} does not depend on ε. This is not in CK; it is derived in the proof steps.

- `Semistable.deRhamLatticeFunctor.geometric` (example): For X proper and smooth over K and i≥0, L^i_ét(X)=H^i_ét(X_{K̄},Z_p)/torsion is a lattice in a de Rham representation with D_dR(L^i_ét(X))≃H^i_dR(X/K) by (6.7.2), and L^i_dR(X)=L_dR(L^i_ét(X))⊂H^i_dR(X/K); a morphism X→Y over K induces H^i_dR(Y/K)→H^i_dR(X/K) carrying L^i_dR(Y) into L^i_dR(X) (CK Example 8.6).

**Unit tests.**

- `Semistable.deRhamLatticeFunctor.trivial` (degenerate): For T=Z_p with trivial action: D_dR(T)=K, the pair is (Z_p,B_dR⁺), M(T)=A_inf with φ the Frobenius of A_inf and the natural G-action, M(T)_dR=O_C⊂C, and L_dR(T)=(O_C)^G=O_K⊂K.

- `Semistable.deRhamLatticeFunctor.cyclotomic` (computation): For T=Z_p(1) with basis ε and t=log[ε]: D_dR(T)=K·(t^{−1}⊗ε), the lattice is ξ^{−1}(T⊗_{Z_p}B_dR⁺), M(T)=A_inf{1}=μ^{−1}(A_inf⊗_{Z_p}Z_p(1)), M(T)_dR=O_C·(t^{−1}⊗ε) because θ(t/μ)=1, and L_dR(Z_p(1))=O_K·(t^{−1}⊗ε); dually L_dR(Z_p(−1))=O_K·(t⊗ε^∨). The generator does not depend on the choice of ε. A definition using the lattice T⊗_{Z_p}B_dR⁺ instead of D_dR(T)⊗_K B_dR⁺ would give M=A_inf⊗T and no G-invariants at all.

- `Semistable.deRhamLatticeFunctor.ramified_quadratic` (computation): Let π be a uniformizer of K, K′=K(√π) and T=Z_p·e with G acting through the quadratic character η of K′/K. Then D_dR(T)=K·(√π⊗e), D_dR(T)⊗_K B_dR⁺=T⊗_{Z_p}B_dR⁺ because √π is a unit of B_dR⁺, M(T)=A_inf⊗_{Z_p}T with the diagonal action, M(T)_dR=O_C⊗T, and L_dR(T)=O_K·(√π⊗e). So L_dR(T)⊗_{O_K}O_C=√π·M(T)_dR is strictly smaller than M(T)_dR, and L_dR(T)=(O_{K′}⊗T)^{Gal(K′/K)} as the compatibility with K′/K predicts.

- `Semistable.deRhamLatticeFunctor.not_de_rham` (non-example): If T[1/p] is not de Rham then dim_K(T⊗_{Z_p}B_dR)^G<rank_{Z_p}T, so D⊗_K B_dR⁺ is a B_dR⁺-lattice of T⊗_{Z_p}B_dR for no K-subspace D of (T⊗_{Z_p}B_dR)^G, and M(T) is not defined. Example: K contains the 2p-th roots of unity, s∈Z_p is not an integer and T=Z_p(χ^s) for the cyclotomic character χ; then χ^{s+n} has infinite image on inertia for every integer n, so (T⊗_{Z_p}B_dR)^G=0 by the theorem of Tate and Sen on the invariants of C(η).

**Acceptance.**

- M(T) is determined up to unique isomorphism by three properties: it is an A_inf-free Breuil–Kisin–Fargues G-module, its étale realization is T G-equivariantly, and M(T)⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺ inside T⊗_{Z_p}B_dR. This is the form in which CK Theorem 8.7 uses it.

- The lattice property of L_dR(T) is proved, not only asserted; the proof uses C^G=K.

- The construction is defined only when T[1/p] is de Rham, and L_dR(T)⊗_{O_K}O_C=M(T)_dR is not part of it: it fails for the ramified quadratic character of the tests.

- The pair uses the covariant D_dR(T)=(T⊗_{Z_p}B_dR)^G and the lattice D_dR(T)⊗_K B_dR⁺, and the de Rham realization is taken along θ, not along θ̃=θ∘φ_A⁻¹; with these conventions L_dR(Z_p(1))=O_K·(t^{−1}⊗ε).

**Direct prerequisites.** `AInfCohomology:AI.2`, `CohomologyComparisons:CP.3`, `AInfCohomology:AI.0:period-comparison`, `AInfCohomology:AI.0:integral`, `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`, `PadicHodgeTheory:R06.1/tate-sen-theorem`.

**Sources.**

- CK: §8.1, p.72; §8.1, Galois action, p.72; §8.2, étale realization, p.72; §8.2, Fargues’ theorem, p.72; §8.3, p.72; Proposition 8.4, p.73; Proposition 8.4, proof, p.73; §8.5, hypotheses on T, p.73; §8.5, M(T), p.73; §8.5, de Rham realization, p.73; §8.5, the O_K-lattice, p.73; Example 8.6, p.73; Example 8.6, (8.6.1), p.73; Example 8.6, finite Galois extensions, p.73.

- BMS1: Lemma 4.26, p.278; Theorem 4.28, p.279; Example 4.24, p.276; §4.3, sentence after Remark 4.29, p.280.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Model-independent logarithmic de Rham lattice

`AInfCohomology:AI.6/model-independent-lattice` · theorem · declaration `Semistable.modelIndependentLattice`

Atlas planet: **Functorial de Rham lattice**.

**Statement.** Let 𝔛₀/O_K be proper, flat, p-adic, with its divisorial log structure and with an étale cover by affines, each étale over Spf O_K{t_0,…,t_d}/(t_0⋯t_r−π′) for a nonzero nonunit π′∈O_K, where d, r and π′ may depend on the affine. If H_logdR^i(𝔛₀/O_K) and H_logdR^{i+1}(𝔛₀/O_K) are both O_K-free, then T=H_ét^i(X_C,Z_p) is Z_p-free. Let M(T) and L_dR(T) be the Breuil–Kisin–Fargues G_K-module and the O_K-lattice of de-rham-lattice-functor, attached to the pair (T, D_dR(T)⊗_K B_dR⁺⊂T⊗_{Z_p}B_dR), where D_dR(T)=(T⊗_{Z_p}B_dR)^{G_K} is identified with H_dR^i(X_K/K) by the de Rham comparison (6.7.2). Then M(T) identifies with H_A^i(𝔛₀⊗̂O_C) as a Breuil–Kisin–Fargues G_K-module, and L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K} equals H_logdR^i(𝔛₀/O_K) inside H_dR^i(X_K/K); in the notation of de-rham-lattice-functor, L^i_dR(X_K)=H_logdR^i(𝔛₀/O_K). Two models of the same generic fibre satisfying these hypotheses therefore give the same lattice.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀; C is the completion of K̄ and G_K=Gal(K̄/K) acts continuously on C and on A_inf (CK §8.1).

- Both adjacent degrees i and i+1 are free; M(T) and L_dR(T) are those of de-rham-lattice-functor.

**Proof or construction.**

1. Working locally one may replace t_i by t_i^{±1} for r<i≤d, so 𝔛=𝔛₀⊗̂_{O_K}O_C satisfies the chart hypotheses of CK §1.5. By the Grothendieck comparison theorem and flat base change (CK Remark 4.19; CR.5), H_logdR^j(𝔛/O_C)≃H_logdR^j(𝔛₀/O_K)⊗_{O_K}O_C for j=i and j=i+1, hence H_logdR^j(𝔛₀/O_K)=(H_logdR^j(𝔛/O_C))^{G_K} ((8.7.4)). The passage to invariants uses (O_C)^{G_K}=O_K, that is, the theorem of Ax–Sen–Tate C^{G_K}=K (PadicHodgeTheory:R06.1/ax-sen-tate-invariants, stated there for K finite over Q_p with the general case in its hypotheses), which CK do not cite.

2. By freeness-criterion (CK Proposition 7.7) in degrees i and i+1, H_A^i(𝔛) and H_A^{i+1}(𝔛) are A_inf-free; by cohomological-bkf, with the semilinear action of G_K of aomega (API item semilinear) and its compatibility with Frobenius stated there, they are Breuil–Kisin–Fargues G_K-modules in the sense of de-rham-lattice-functor (CK §§8.1, 8.3). By (7.6.2) of degreewise-specializations and the Frobenius-compatibility and G_K-equivariance of etale-comparison, the étale realization of H_A^i(𝔛) is H_ét^i(X_C,Z_p), G_K-equivariantly; so T is Z_p-free.

3. By etale-bdr-agreement (CK Proposition 6.8), the B_dR-base change of this identification equals the composite of bdr-comparison ((6.6.2)), CP.3’s identification (6.2.8) (BMS1 Remark 13.20) and the de Rham comparison (6.7.2). Hence the B_dR⁺-lattice H_A^i(𝔛)⊗_{A_inf}B_dR⁺ of T⊗_{Z_p}B_dR is D_dR(T)⊗_K B_dR⁺, with D_dR(T)≃H_dR^i(X_K/K) ((8.6.1)). So H_A^i(𝔛) is an A_inf-free Breuil–Kisin–Fargues G_K-module with étale realization T and B_dR⁺-lattice D_dR(T)⊗_K B_dR⁺, and the characterisation of M(T) in de-rham-lattice-functor (CK Proposition 8.4 and §8.5) gives M(T)≃H_A^i(𝔛), which is (8.7.3).

4. Under this identification, by the compatibility modulo ξ in bdr-comparison (CK Theorem 6.6) and the sentence after (6.2.8), the identifications of M(T)⊗_{A_inf,θ}C and of H_A^i(𝔛)⊗_{A_inf,θ}C with H_dR^i(X_C^ad/C) agree. Since H_A^{i+1}(𝔛) is free, (7.6.3) gives H_A^i(𝔛)⊗_{A_inf,θ}O_C=H_logdR^i(𝔛/O_C) inside H_dR^i(X_C^ad/C). Taking G_K-invariants and using the first step gives (8.7.2) (CK Theorem 8.7).

5. Model independence: by de-rham-lattice-functor, L_dR(T)=L^i_dR(X_K) depends only on T with its G_K-action, hence only on the generic fibre (CK Example 8.6, (8.6.2)).

**Acceptance.**

- Model independence is not asserted for arbitrary torsion models or for arbitrary torsion-free quotients.

**Direct prerequisites.** `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.6/freeness-criterion`, `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/bdr-comparison`, `AInfCohomology:AI.6/etale-bdr-agreement`, `AInfCohomology:AI.6/de-rham-lattice-functor`, `CrystallineCohomology:CR.5`, `CohomologyComparisons:CP.3`, `AInfCohomology:AI.6/aomega`, `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`.

**Sources.**

- CK: Theorem 8.7, p.74; Theorem 8.7, freeness hypothesis, p.74; §8.1, p.72; Example 8.6, (8.6.2), p.73; §8, introduction, p.72.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Nodal conic and good reduction model test

`AInfCohomology:AI.6/nodal-conic` · application · declaration `Semistable.nodalConic`

**Statement.** For a uniformizer π of O_K, the proper conic 𝔛₀=Proj O_K[X,Y,Z]/(XY−πZ²), p-adically completed, is flat and semistable. Its special fibre is two projective lines meeting at one node; its generic fibre is a smooth rational curve. The log de Rham groups are O_K,0,O_K in degrees 0,1,2 and zero otherwise. Its A_inf groups are A_inf,0,A_inf{−1}, with the corresponding logarithmic/Witt specializations. The degree-0 and degree-2 lattices agree with a smooth P¹ model under a fixed generic-fibre identification, by model-independent-lattice. This nodal genus-zero example has N=0; the separate rank-two monodromy algebra test does not claim to be its H¹.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π is a uniformizer of O_K and C is the completion of K̄ (CK §8.1), as model-independent-lattice requires.

**Proof or construction.**

1. Check the node chart x y=π on Z≠0 and the two smooth charts at infinity using chart-ring/divisorial-log.

2. Compute the log de Rham cohomology directly. Ω¹_log of 𝔛₀ over O_K is an invertible sheaf, generated at the node by dlog x=−dlog y and on the two smooth charts by the differential of the coordinate; it is the relative dualizing sheaf ω (CR.5). The special fibre is the union of two lines L₁, L₂ over k₀ meeting in one point: the sequence 0→O→O_{L₁}⊕O_{L₂}→k₀→0 gives H⁰(O)=k₀ and H¹(O)=0, and ω restricts to O(−1) on each line, so H⁰(ω)=0 and, by duality, H¹(ω)=k₀. The generic fibre is P¹_K and has the same dimensions, so by cohomology and base change for the proper flat curve H⁰(O)=O_K, H¹(O)=0, H⁰(ω)=0 and H¹(ω)≅O_K. The Hodge–de Rham spectral sequence then has E₁^{0,1}=E₁^{1,0}=0, and the log de Rham groups are O_K, 0, O_K in degrees 0, 1, 2. The inputs of this step (Čech cohomology on the two-chart cover, cohomology and base change, the identification of Ω¹_log with ω) have no supplier among the prerequisites.

3. Apply freeness-criterion and degreewise-specializations for the freeness and the ranks of the A_inf groups. Apply model-independent-lattice, (8.7.3), in degrees 0 and 2, and the cases M(Z_p)=A_inf and M(Z_p(−1))=A_inf{−1} of de-rham-lattice-functor (its trivial and Tate-twist computations; A_inf{−1} is AI.2’s Tate twist) to identify the Breuil–Kisin–Fargues structures; degree 3 vanishes, so the hypothesis on degree i+1 holds for i=2. The common lattices are L⁰_dR(P¹_K)=O_K and L²_dR(P¹_K)=L_dR(Z_p(−1))=O_K·(t⊗ε^∨).

**Acceptance.**

- The H¹ group is zero despite the special-fibre node; no nonzero monodromy is inferred merely from singular reduction.

**Direct prerequisites.** `AInfCohomology:AI.6/chart-ring`, `AInfCohomology:AI.6/divisorial-log`, `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.6/freeness-criterion`, `AInfCohomology:AI.6/model-independent-lattice`, `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.2`, `CrystallineCohomology:CR.5`.

**Sources.**

- CK: §1.5, (1.5.1), p.4; §1.5, (1.5.3), p.4; Proposition 7.7, p.70; Theorem 8.7, p.74.

- BMS1: §4.3, sentence after Remark 4.29, p.280.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/Semistable`; namespace `TauCeti.AInfBlueprint`.

### Cohomological Breuil–Kisin coefficient maps

`AInfCohomology:AI.7/coefficient-normalization` · construction · declaration `CohomologicalBK.coefficientNormalization`

Atlas planet: **Breuil–Kisin coefficient normalization**.

**Statement.** On the R07.4 coefficient ring 𝔖=W(k₀)[[u]], distinguish θ̃_𝔖:𝔖→O_K, the W(k₀)-linear map with u↦π, from θ_𝔖=θ̃_𝔖∘φ_𝔖, which acts by φ_W on coefficients and has u↦π^p. Let 𝔖^(−1) be the copy of 𝔖 regarded as an 𝔖-algebra through φ_𝔖, let g:𝔖^(−1)→A_inf be W(k₀)-linear with u↦[π^♭], and f=g∘φ_𝔖=φ_A∘g:𝔖→A_inf, acting by φ_W on coefficients and u↦[π^♭]^p. Then θ̃_A∘f=θ̃_𝔖, θ_A∘f=θ_𝔖, θ_A∘g=θ̃_𝔖, f(E) generates ker θ̃_A=(ξ̃), g(E) generates ker θ_A=(ξ), and the cohomological crystalline map is c=φ_W∘constantCoeff:𝔖→W(k₀), with c∘φ_𝔖=φ_W∘c. These maps use the existing rings, rather than new coefficient constants. Dictionary: R07.4 (bk-coefficient-rings) writes θ_𝔖 for the map u↦π, which is this node’s θ̃_𝔖, and its embedding 𝔖→W(R), u↦[π̃], is this node’s g. PrismaticCohomology PR.7 (breuil-kisin-and-ainf-covers, kisin-functor-comparison) already supplies f as the map of prisms (𝔖,(E))→(A_inf,ker θ̃_A), u↦[π^♭]^p and Frobenius on W(k₀), with f=φ_A∘g. Not in those nodes: the name θ_𝔖 for θ̃_𝔖∘φ_𝔖 with θ_A∘f=θ_𝔖, the map c, and the statement for g(E). The variable u is T in BMS1 and z in BMS2; BMS2 writes θ^(−1) for the map u↦π on 𝔖^(−1).

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Proof or construction.**

1. Import R07.4/bk-coefficient-rings (𝔖, φ_𝔖, E, the map u↦π and the embedding u↦[π̃]) and, from AI.0:integral, A_inf, θ_A, θ̃_A=θ_A∘φ_A^{-1}, ξ, ξ̃ and the inclusion W(k₀)⊂A_inf; the map of prisms f and the relation f=φ_A∘g are those of PR.7/breuil-kisin-and-ainf-covers and PR.7/kisin-functor-comparison.

2. Compute the composite maps on coefficients and on u, using that θ_A is W(k₀)-linear on W(k₀)⊂A_inf and θ_A([x])=x^♯: θ̃_A(f(a))=θ_A(a)=a and θ̃_A(f(u))=θ_A([π^♭])=π; θ_A(f(a))=φ_W(a) and θ_A(f(u))=π^p; c(φ_𝔖(Σa_nu^n))=φ_W(φ_W(a_0))=φ_W(c(Σa_nu^n)). These are the Frobenius and θ̃ compatibilities in BMS1 §4.4 and the θ/θ̃ compatibilities in BMS2 Notation 11.1.

3. Eisenstein claim: θ_A(g(E))=E(π)=0, and g(E)=[π^♭]^e+p·y with y congruent to the unit E(0)/p modulo [π^♭], so in the Witt vector expansion g(E)=(ξ₀,ξ₁,…) one has ξ₀=(π^♭)^e and ξ₁=(y mod p)^p, a unit of O_C^♭. By the distinguished-element criterion (BMS1 Remark 3.11: an element ξ=(ξ₀,ξ₁,…) of ker θ generates it if and only if ξ₁ is a unit; AI.0:integral) g(E) generates ker θ_A=(ξ), and f(E)=φ_A(g(E)) generates φ_A(ker θ_A)=ker θ̃_A=(ξ̃). BMS1 asserts the statement for f(E) without argument in the proof of Proposition 4.32; it also follows from f being a map of prisms. The statement for g(E) is not printed in BMS1 or BMS2; it follows from this computation.

**Uses.**

- `BMS2 Theorems 1.2 and 11.2`: All three specializations have these Frobenius-normalized coefficient maps.

- `HabiroCohomologyFoundations:HQ.8`: The comparison diagram must preserve θ versus θ̃ and the Frobenius twist.

**API.**

- `CohomologicalBK.coefficientNormalization.frobenius` (simp): For any coefficient endomorphism F and p>0, the power-series map is Σa_nu^n↦ΣF(a_n)u^{pn}; it sends C(a) to C(F(a)) and u to u^p.

- `CohomologicalBK.coefficientNormalization.theta` (compatibility): θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖 as maps 𝔖→O_C (through O_K⊂O_C), and θ_A∘g=θ̃_𝔖; θ_𝔖(u)=π^p whereas θ̃_𝔖(u)=π.

- `CohomologicalBK.coefficientNormalization.crystalline` (simp): The normalized residue map is F∘constantCoeff: C(a)↦F(a), u↦0, and c∘φ_𝔖=φ_W∘c.

- `CohomologicalBK.coefficientNormalization.eisenstein` (relation): f(E) generates kerθ̃_A=(ξ̃); g(E) generates kerθ_A=(ξ).

**Unit tests.**

- `CohomologicalBK.coefficientNormalization.variable` (computation): At p=2, the map with coefficient identity sends u to u².

- `CohomologicalBK.coefficientNormalization.twisted_constant` (computation): For an arbitrary coefficient endomorphism F, the normalized residue of C(a) is F(a); for k₀=F_{p²}, F=φ_W and a=[ζ] with ζ∉F_p this is [ζ^p], which differs from a.

- `CohomologicalBK.coefficientNormalization.constant_identity` (compatibility): At F=id, c is exactly Mathlib PowerSeries.constantCoeff.

- `CohomologicalBK.coefficientNormalization.nonsurjective` (non-example): Over Z with p=2, the coefficient of u in every image of φ is zero, so u is not an image.

**Acceptance.**

- On k₀=F_{p²}, c on a Teichmüller coefficient is [a^p], which differs from [a] for a∉F_p.

- φ_𝔖 is an endomorphism and is not surjective onto u.

**Direct prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`, `AInfCohomology:AI.0:integral`, `PrismaticCohomology:PR.7/breuil-kisin-and-ainf-covers`, `PrismaticCohomology:PR.7/kisin-functor-comparison`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.constantCoeff`, `mathlib:WittVector.frobenius`, `mathlib:PowerSeries`, `mathlib:WittVector`, `mathlib:PowerSeries.expand`, `mathlib:PowerSeries.HasSubst.X_pow`, `mathlib:PowerSeries.coeff_subst_X_pow`, `mathlib:PowerSeries.constantCoeff_subst_X_pow`, `mathlib:PowerSeries.substAlgHom_X`, `mathlib:WittVector.frobeniusEquiv`, `mathlib:WittVector.fontaineTheta`, `mathlib:PreTilt`, `mathlib:PreTilt.untilt`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.map`.

**Sources.**

- BMS1: §4.4, first paragraph, pp.280–281; Remark 3.11, p.250.

- BMS2: §1.1, p.200; Notation 11.1, p.298; §11.2, first two paragraphs, p.302; §11.2, second paragraph, p.302; Theorem 1.2(3), p.201.

**Suggested-file boundary (algebraic).** Typed in the suggested file: φ_𝔖, c, and, with Mathlib's fontaineTheta and PreTilt, the maps g, f, θ̃_𝔖, θ_𝔖, θ̃_A with the squares θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖 and the membership of g(E), f(E) in the kernels. That g(E) and f(E) generate the kernels is in the named inventory.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Flat Breuil–Kisin to A_inf extension

`AInfCohomology:AI.7/flat-coefficient-extension` · theorem · declaration `CohomologicalBK.flatCoefficientExtension`

**Statement.** The normalized map f:𝔖→A_inf is flat (BMS1 Lemma 4.30). It is moreover faithfully flat and topologically free: A_inf is isomorphic as an 𝔖-module to the (p,u)-adic completion of a free 𝔖-module, with 1 part of a topological basis, so that f has an 𝔖-linear retraction. These two properties are asserted in BMS2 Notation 11.1, with a reference to Lemma 4.30 and its proof, and are proved here. In particular M⊗^L_𝔖 A_inf is concentrated in degree 0 for every 𝔖-module M. Detection: a map that becomes zero, respectively an equivalence, after extension along f is zero, respectively an equivalence, in each of three domains: maps of 𝔖-modules with the ordinary tensor product; maps of perfect complexes of 𝔖-modules with the derived tensor product; maps of derived (p,u)-complete complexes with the (p,u)-completed derived tensor product. The same holds for g=φ_A^{-1}∘f. Finally f is p-completely faithfully flat and the p-completed tensor powers of A_inf over 𝔖 are flat over 𝔖 (BMS1 Remark 4.31), so the Čech descent of complete-flat-descent applies to derived p-complete 𝔖-complexes, with the p-completed Čech nerve of f.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Proof or construction.**

1. Flatness is BMS1 Lemma 4.30: by approximation one may take M finitely generated; finite modules over the regular noetherian ring 𝔖 (R07.4/bk-coefficient-rings) are perfect; Artin–Rees reduces p-complete flatness to the DVR map k₀[[u]]→O_C^♭, which is torsion-free.

2. Faithful flatness (asserted in BMS2 Notation 11.1, not proved in the sources): f is a local homomorphism of local rings (A_inf is local; AI.0:integral), since f(p)=p and f(u)=[π^♭]^p lie in the maximal ideal of A_inf, and a flat local homomorphism is faithfully flat.

3. Topological freeness (asserted in BMS2 Notation 11.1 and used in the proof of BMS2 Corollary 11.12(4) and in Remark 11.17; not proved in the sources): (p,u) is a regular sequence in 𝔖, and (p,[π^♭]^p) is a regular sequence in A_inf, which is (p,[π^♭])-adically complete. Choose a basis (e_i)_{i∈I} of A_inf/(p,[π^♭]^p) over k₀, acting through f, with e_{i₀} the class of 1, and lifts ẽ_i∈A_inf with ẽ_{i₀}=1. The induced map from the (p,u)-adic completion of ⊕_I𝔖 to A_inf is an isomorphism modulo (p,u); both sides are derived (p,u)-complete and (p,u) is a regular sequence on them, so the map is an isomorphism by derived Nakayama (mod-ideal-detection). The coordinate at i₀ is an 𝔖-linear retraction of f.

4. Detection (not in the sources): for modules use faithful flatness; for perfect complexes use Hom_{D(𝔖)}(P,Q)⊗_𝔖A_inf=Hom_{D(A_inf)}(P⊗^LA_inf,Q⊗^LA_inf) and faithful flatness; for a derived (p,u)-complete complex N the retraction of the previous step makes N a retract of N⊗̂^L_𝔖A_inf, naturally in N, so a map killed by the extension is zero and a cone killed by it is zero. For g use that φ_A is an automorphism of A_inf.

5. p-complete descent: A_inf⊗^L_𝔖𝔖/p=O_C^♭ is faithfully flat over k₀[[u]] by the first two steps, and 𝔖, A_inf are p-adically complete and p-torsion-free; these are the hypotheses of complete-flat-descent. The p-completed tensor powers of A_inf over 𝔖 are p-adically complete, p-torsion-free and flat over k₀[[u]] modulo p, hence flat over the noetherian ring 𝔖 by BMS1 Remark 4.31.

**Acceptance.**

- For M=𝔖/(p,u)=k₀ the derived tensor product M⊗^L_𝔖A_inf is A_inf/(p,[π^♭]^p) in degree 0: the higher Tor groups vanish because (p,[π^♭]^p) is a regular sequence in A_inf.

- The retraction A_inf→𝔖 is only 𝔖-linear: there is no ring homomorphism A_inf→𝔖 retracting f, since modulo p it would make u=f(u) the p-th power of the image of π^♭ in k₀[[u]].

**Direct prerequisites.** `AInfCohomology:AI.7/coefficient-normalization`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E4/mod-ideal-detection`, `DerivedDeRhamCohomology:DD.1/complete-flat-descent`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`, `AInfCohomology:AI.0:integral`, `mathlib:Module.FaithfullyFlat.zero_iff_lTensor_zero`, `mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective`.

**Sources.**

- BMS1: Lemma 4.30, p.281; Lemma 4.30, proof, p.281; Remark 4.31, p.281.

- BMS2: Notation 11.1, p.298; Corollary 11.12, proof of part (4), p.305.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Cohomological Breuil–Kisin complex

`AInfCohomology:AI.7/cohomology` · construction · declaration `CohomologicalBK.cohomology`

Atlas planet: **Breuil–Kisin cohomology**.

**Statement.** For a smooth p-adic formal scheme 𝔛 over O_K, let (𝔖,(E)) be the bounded non-perfect prism of PrismaticCohomology PR.0 (breuil-kisin-prism) on the ring 𝔖=W(k₀)[[u]] of R07.4, with 𝔖/E≅O_K through θ̃_𝔖, and define RΓ_𝔖(𝔛) to be PR.1’s relative prismatic RΓ_Δ(𝔛/𝔖). On affines write D_𝔖(R)=Δ_{R/𝔖}. It is a derived (p,E)-complete, equivalently (p,u)-complete, commutative algebra object of D(𝔖) with a φ_𝔖-semilinear Frobenius endomorphism. For 𝔛 affine or, more generally, quasi-compact and quasi-separated, the linearization φ_𝔖^*RΓ_𝔖(𝔛)→RΓ_𝔖(𝔛) is an equivalence after E-inversion, with an inverse up to E^i on H^i.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- Smoothness is required here; the semistable complex of AI.6 is not obtained by applying this ordinary relative site to singular models.

**Proof or construction.**

1. Apply PR.0/breuil-kisin-prism and PR.1/relative-prismatic-cohomology to the fixed uniformizer quotient θ̃_𝔖; the ring 𝔖 and φ_𝔖 are those of R07.4 as recorded in coefficient-normalization, and the commutative algebra structure is that of PR.1’s construction, in the sense of algebra-objects.

2. Frobenius: PR.3/leta-frobenius-factorisation (BS22 Theorem 15.3) and PR.3/image-of-frobenius (BS22 Corollary 15.5 and Theorem 1.8(6)) give maps V_i on the truncations τ^{≤i} of the sheaf Δ_{𝔛/𝔖} with V_iφ=φV_i=E^i and, for quasi-compact quasi-separated 𝔛, the equivalence of the linearized Frobenius after inverting E. Completeness: (p,E) and (p,u) have the same radical because E≡u^e modulo p. The comparison with the complex of BMS2 is trace-prismatic-agreement and is not used here.

**Uses.**

- `BMS2 Theorem 1.2 and BS22 Example 1.9(3)`: This is the geometric cohomology functor, distinct from R07.4’s classification of representations/groups.

- `HabiroCohomologyFoundations:HQ.8`: The same functor enters the cross-theory comparison diagram.

**API.**

- `CohomologicalBK.cohomology.affine` (characterisation): For SpfR, the object is precisely Δ_{R/𝔖} in the shared enhancement.

- `CohomologicalBK.cohomology.functorial` (functoriality): Pullback on eligible smooth formal schemes gives contravariant maps preserving products, with identity/composition.

- `CohomologicalBK.cohomology.frobenius` (structure): The linearized φ_𝔖^*D→D is the imported prismatic Frobenius and becomes an isomorphism after E-inversion.

- `CohomologicalBK.cohomology.global` (compatibility): For every smooth 𝔛, RΓ_𝔖(𝔛)=RΓ(𝔛_ét,Δ_{𝔛/𝔖}), where Δ_{𝔛/𝔖} is PR.1’s étale sheaf with value Δ_{R/𝔖} on an affine open Spf R. No quasi-compactness is needed for this identification; it is needed for completed base change of global sections (ainf-base-change) and for the global Frobenius isogeny.

**Unit tests.**

- `CohomologicalBK.cohomology.point` (degenerate): For SpfO_K the complex is 𝔖 in degree 0 with φ_𝔖.

- `CohomologicalBK.cohomology.polynomial` (compatibility): For R=O_K⟨t⟩ the Hodge–Tate reduction D_𝔖(R)⊗^L_{𝔖,θ̃_𝔖}O_K has H⁰=R and H¹=Ω¹_{R/O_K}{−1}, and no other cohomology; the reduction along θ_𝔖 is the de Rham complex R→R·dt, t^n↦n·t^{n−1}dt.

- `CohomologicalBK.cohomology.torus` (compatibility): For R=O_K⟨t^{±1}⟩: H⁰(D_𝔖(R)⊗^L_{𝔖,θ̃_𝔖}O_K)=R, whereas H⁰(D_𝔖(R)⊗^L_{𝔖,θ_𝔖}O_K)=O_K, the kernel of d:R→R·dlog t, t^n↦n·t^n·dlog t.

**Acceptance.**

- For Spf O_K and two uniformizers π, π′ the complex is 𝔖 for both, but as prisms (𝔖,(E)) and (𝔖,(E′)), which differ unless E′=E; the two theories are identified only after extension to A_inf, by choice-transport.

**Direct prerequisites.** `PrismaticCohomology:PR.0/breuil-kisin-prism`, `PrismaticCohomology:PR.1/relative-prismatic-cohomology`, `PrismaticCohomology:PR.3/leta-frobenius-factorisation`, `PrismaticCohomology:PR.3/image-of-frobenius`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `AInfCohomology:AI.7/coefficient-normalization`, `PrismaticCohomology:PR.1/hodge-tate-comparison`, `PrismaticCohomology:PR.3/de-rham-comparison-general`.

**Sources.**

- BS22: Example 1.3(3), pp.2–3; Theorem 1.8, opening, p.4; Theorem 1.8(6), p.5; Example 1.9(3), pp.5–6.

- BMS2: Theorem 1.2(2), p.201.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Frobenius-twisted relative trace complex

`AInfCohomology:AI.7/twisted-trace` · construction · declaration `CohomologicalBK.twistedTrace`

Atlas planet: **Frobenius-twisted trace complex**.

**Statement.** For a p-completely smooth O_K-algebra R, let 𝔖^(−1) be the copy of 𝔖 containing 𝔖 via φ_𝔖 and embedded in A_inf by g. Define D̂_tw(R)=gr⁰TC⁻(R/𝕊[z];Z_p)≃gr⁰TP(R/𝕊[z];Z_p), by unfolding π₀ from the quasiregular semiperfectoid site as in BMS2 §§11.1–11.2; here O_K is an 𝕊[z]-algebra through z↦π. It is a (p,u)-complete E∞-𝔖^(−1)-algebra, the algebra structure coming from π₀TC⁻(O_K/𝕊[z];Z_p)=𝔖^(−1), in which the variable z of 𝕊[z] is the coefficient variable u; its Frobenius linearization is invertible after φ(E)-inversion. RT.6 supplies the relative spectra, filtration, unfolding and coefficient computations.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- 𝕊[z] is the sphere-spectrum monoid algebra; the Bott class b of degree 2 is distinct from the coefficient variable u.

**Proof or construction.**

1. Import RT.6’s relative THH/TC⁻/TP computation and its quasisyntomic descent, using the map z↦π: the cyclotomic structure on THH(−/𝕊[z]) (BMS2 Construction 11.5), the coefficient computation BMS2 Proposition 11.10, and evenness and the sheaf property on quasiregular semiperfectoid O_K-algebras, BMS2 Proposition 11.11, which rests on BMS2 Theorem 7.2.

2. Apply BMS2 Corollary 11.12, with the relative TC⁻(−/𝕊[z];Z_p) and with gr⁰ of the filtration obtained by unfolding from quasiregular semiperfectoid algebras; on smooth algebras this is not π₀, and absolute TC⁻ carries no 𝔖-module structure. Its proof uses, besides §§11.1–11.2, the absolute results BMS2 Theorem 1.17 for part (2), Theorem 1.8 for part (1) and Theorem 1.10 for part (3), with BMS2 Corollary 11.8 and Lemma 11.6 for base change in 𝕊[z]; all belong to RT.6. Part (4) is deduced from part (1) because 𝔖^(−1)→A_inf is a topological direct summand, which is flat-coefficient-extension applied to g.

**Uses.**

- `BMS2 Proposition 11.15 and proof of Theorem 11.2`: The twisted trace complex descends only after Bott inversion and the cyclotomic map.

**API.**

- `CohomologicalBK.twistedTrace.coefficients` (compatibility): For R=O_K, with all spectra relative to 𝕊[z] and p-completed: π_*THH=O_K[b]; π_*TC⁻=𝔖^(−1)[b,v]/(bv−E) with b of degree 2 and v of degree −2; π_*TP=𝔖^(−1)[σ^{±1}] with σ of degree 2; can(b)=Eσ and can(v)=σ^{−1}; the cyclotomic Frobenius π_*TC⁻→π_*TP is φ_𝔖 on 𝔖^(−1), with φ(b)=σ and φ(v)=φ_𝔖(E)σ^{−1}.

- `CohomologicalBK.twistedTrace.specializations` (equivalence): BMS2 Corollary 11.12(1)–(3): along g, with the (p,u)-completed tensor product, it is AΩ_{R⊗̂O_C}; along the W(k₀)-linear map u↦π (untwisted coefficients) it is the p-completed de Rham complex of R over O_K; along constantCoeff (identity on W(k₀), u↦0) it is crystalline cohomology of R⊗_{O_K}k₀ over W(k₀).

- `CohomologicalBK.twistedTrace.frobenius` (structure): Its linearized Frobenius is invertible after φ(E), matching Corollary 11.12(4).

**Unit tests.**

- `CohomologicalBK.twistedTrace.point` (degenerate): For O_K the gr⁰ complex is 𝔖^(−1) in degree 0.

- `CohomologicalBK.twistedTrace.bott` (computation): On O_K the cyclotomic map takes the Bott class b to σ, which is invertible in TP; can takes b to Eσ.

- `CohomologicalBK.twistedTrace.relative` (non-example): Absolute TC⁻(R;Z_p) is not substituted for the relative theory: the class b∈π₂ and the 𝔖^(−1)-algebra structure of BMS2 Proposition 11.10 belong to TC⁻(−/𝕊[z];Z_p), and the absolute theory appears only after base change, as gr⁰TC⁻(R⊗̂_{O_K}O_{K_∞};Z_p)≃D̂_tw(R)⊗̂^L_{𝔖^(−1)}A_inf(O_{K_∞}) (BMS2 Corollary 11.12(1), Remark 11.9).

**Acceptance.**

- For R=O_K the complex is 𝔖^(−1), and its three specialisations of BMS2 Corollary 11.12(1)–(3), along g, u↦π and u↦0, are A_inf, O_K and W(k₀).

**Direct prerequisites.** `RefinedTraceMethods:RT.6`, `AInfCohomology:AI.7/coefficient-normalization`, `AInfCohomology:AI.7/flat-coefficient-extension`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

**Sources.**

- BMS2: §11.2, first two paragraphs, p.302; Proposition 11.10, pp.302–303; Proposition 11.10, p.303; Proposition 11.10, p.303, top arrow of the last diagram; Proposition 11.11, p.303; paragraph after Proposition 11.11, p.303; Corollary 11.12, p.304; Corollary 11.12(3), p.304; Corollary 11.12, proof of part (4), p.305; Remark 11.9, p.302.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Bott-inverted Breuil–Kisin descent

`AInfCohomology:AI.7/trace-descent` · theorem · declaration `CohomologicalBK.traceDescent`

Atlas planet: **Breuil–Kisin Frobenius descent**.

**Statement.** Let 𝔖 act on TC⁻(R/𝕊[z];Z_p)[1/b] through π₀(TC⁻(O_K/𝕊[z];Z_p)[1/b])=W(k₀)[[z]], the variable z of 𝕊[z] being the coefficient variable u; the cyclotomic Frobenius makes π₀TP(O_K/𝕊[z];Z_p)=𝔖^(−1) an 𝔖-algebra through φ_𝔖. D_𝔖^tr(R)=gr⁰(TC⁻(R/𝕊[z];Z_p)[1/b]), unfolded from the quasiregular semiperfectoid site, has φ_𝔖^*D_𝔖^tr≃D̂_tw, the tensor product being the ordinary one since φ_𝔖 is finite free. The cyclotomic Frobenius extends over b-inversion and z^{1/p}; for p-completed smooth R the resulting map to gr⁰TP is an equivalence. The linearised descent Frobenius φ_𝔖^*D_𝔖^tr→D_𝔖^tr is the composite of φ_𝔖^*D_𝔖^tr≃gr⁰TP(R/𝕊[z];Z_p), the inverse of the canonical equivalence gr⁰TC⁻≃gr⁰TP and the localisation gr⁰TC⁻→gr⁰(TC⁻[1/b])=D_𝔖^tr. Its base change along φ_𝔖 is, under the identification above, the linearised Frobenius of D̂_tw, so that the pair (D̂_tw,φ) descends to D_𝔖^tr with this Frobenius; it is invertible after E-inversion.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- R is the p-adic completion of a smooth O_K-algebra for the equivalence with gr⁰TP (BMS2 Proposition 11.15, last sentence); the extension of the cyclotomic Frobenius over b-inversion holds for every O_K-algebra.

**Proof or construction.**

1. Use RT.6’s evenness, acyclicity and cyclotomic extension in BMS2 Proposition 11.15, with Propositions 11.10 and 11.11 and, for the reduction modulo z^{1/p}, Lemma 11.6; the source’s Segal input Corollary 8.18 belongs to RT.6.

2. Apply the unfolding/descent of the proof of BMS2 Theorem 11.2, retaining its relative base and its canonical Frobenius composite; the first display of that proof must be read with TC⁻(A/𝕊[z];Z_p), as in Proposition 11.15 and in the composite display of the same proof.

3. Compatibility with the Frobenius of D̂_tw, whose verification BMS2 leaves implicit: let Φ:D_𝔖^tr→gr⁰TP be the φ_𝔖-semilinear map of Proposition 11.15 and loc:gr⁰TC⁻→D_𝔖^tr the b-inversion. By construction Φ∘loc is the cyclotomic Frobenius φ^{hT}:gr⁰TC⁻→gr⁰TP. The semilinear descent Frobenius is F=loc∘can^{-1}∘Φ, so Φ∘F=φ^{hT}∘can^{-1}∘Φ, and φ^{hT}∘can^{-1} is the Frobenius endomorphism of gr⁰TP≃D̂_tw.

4. Invertibility after E: the linearized Frobenius of D̂_tw is invertible after inverting φ_𝔖(E) (twisted-trace, BMS2 Corollary 11.12(4)); φ_𝔖 is finite free of rank p (R07.4/bk-coefficient-rings), hence faithfully flat, so the cone of the linearized Frobenius of D_𝔖^tr vanishes after inverting E.

**Acceptance.**

- For R=O_K: π_*(TC⁻(O_K/𝕊[z];Z_p)[1/b])=𝔖^(−1)[b^{±1}], because v=E·b⁻¹ once b is inverted; its degree-zero part is W(k₀)[[z]], in which nothing has been inverted. The class inverted is the degree-two class b (written u in BMS2), not the coefficient variable z.

- The first display of the proof of BMS2 Theorem 11.2 must be read with the relative TC⁻(A/𝕊[z];Z_p); with the absolute TC⁻(A;Z_p), as printed, the class b and the 𝔖-module structure are not defined.

- For R=O_K: D_𝔖^tr=𝔖, the map Φ is φ_𝔖:𝔖→𝔖^(−1), and the descent Frobenius is φ_𝔖.

**Direct prerequisites.** `AInfCohomology:AI.7/twisted-trace`, `RefinedTraceMethods:RT.6`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`.

**Sources.**

- BMS2: Proposition 11.15, p.305; Proposition 11.15, p.305, last sentence; Proposition 11.15, proof, p.305; Proposition 11.15, proof, p.306; Theorem 11.2, proof, p.306; Theorem 11.2, p.298.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Trace and prismatic Breuil–Kisin agreement

`AInfCohomology:AI.7/trace-prismatic-agreement` · theorem · declaration `CohomologicalBK.tracePrismaticAgreement`

**Statement.** (a) [BS22 Example 1.9(3) and §15.2, with Proposition 15.7] For p-completely smooth R/O_K there is a natural Frobenius-equivariant equivalence D_𝔖^tr(R)≃D_𝔖(R)=Δ_{R/𝔖}. It sheafifies and globalizes for qcqs 𝔛. It is an equivalence of commutative algebra objects; this is not printed in BS22 and follows from the construction, which induces it from ring maps on quasiregular semiperfectoid algebras. (b) [Not in the sources.] That under (a) the A_inf, de Rham and crystalline specialisation equivalences of the trace complex (BMS2 Theorem 11.2(1)–(3)) correspond to those of Δ_{R/𝔖} (BS22 Theorem 1.8(5), (3), (1)) is neither stated nor proved in BS22 or BMS2; it is the open part of this target. BS22 §18’s perfect-prism uniqueness does not give it: that theorem concerns functors defined on all p-completely smooth O_C-algebras, whereas the A_inf-extensions of the Breuil–Kisin functors are defined on smooth O_K-algebras only.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- R is the p-adic completion of a smooth O_K-algebra; for (a) no properness is needed.

**Proof or construction.**

1. For quasiregular semiperfectoid quasisyntomic O_K-algebras S use BS22 Proposition 15.7 (RT.6, with the prismatic input PR.3/bms2-comparison): the cyclotomic Frobenius on π₀TP(S/𝕊[z];Z_p) is the Frobenius of a δ-structure; the universal property of Δ_{S/𝔖} as initial object of the prismatic site of S over 𝔖 (BS22 Theorem 15.2(1)) gives a map Δ^{(1)}_{S/𝔖}→π₀TP(S/𝕊[z];Z_p); and this map identifies the target with the Nygaard completion, compatibly with Nygaard filtrations (relative-nygaard-filtration). Both checks are made after the (p,u)-completed base change 𝔖→W(k₀)[[u^{1/p^∞}]], where relative THH becomes absolute THH of S⟨π^{1/p^∞}⟩ (BMS2 Corollary 11.8) and BS22 Theorem 13.1 applies.

2. Under this identification and the canonical map, π_{2i}TC⁻(S/𝕊[z];Z_p) is the i-th step Fil^i_N of the Nygaard filtration of π₀TP(S/𝕊[z];Z_p) and b corresponds to E (twisted-trace: can(b)=Eσ). Hence π₀(TC⁻(S/𝕊[z];Z_p)[1/b]) is the union of the E^{−i}Fil^i_N, and the relative Frobenius φ_{S/𝔖}, which maps Fil^i_N into E^iΔ_{S/𝔖}, induces ring maps π₀(TC⁻(S/𝕊[z];Z_p)[1/b])→Δ_{S/𝔖}, n/E^i↦φ_{S/𝔖}(n)/E^i, natural in S. They commute with the Frobenius endomorphisms: the extended cyclotomic Frobenius of trace-descent is this ring map followed by Δ_{S/𝔖}→Δ^{(1)}_{S/𝔖}, x↦x⊗1.

3. Unfold over the quasisyntomic site of R: BMS2 Proposition 11.15 for the trace side (trace-descent), and BS22 Theorem 15.3, first display, for RΓ_Δ(X/𝔖)≃RΓ(X_qsyn,Δ_{−/𝔖}). For i at least the dimension of R the map φ:Fil^i_N→E^iΔ_{−/𝔖} induces an equivalence on RΓ(X_qsyn,−), because both sides are complete for compatible filtrations and the graded pieces agree by BS22 Theorem 15.3 (relative-nygaard-graded-pieces, leta-frobenius-factorisation). So the colimit over i stabilises and the ring maps of the previous step induce the equivalence (a). This is the argument of BS22 §15.2, whose reference to [BMS19, Proposition 11.5] is to BMS2 Proposition 11.15.

4. Multiplicativity in (a) is not printed in BS22: it holds because the equivalence is induced on derived global sections by the ring maps of the second step.

5. (b) is not proved. Towards it the listed inputs give only this. The maps of the first step come from a universal property, so their base change along 𝔖→W(k₀)[[u^{1/p^∞}]]→A_inf is the map given by the same universal property over the base-changed prism; this is how BS22 reduces to Theorem 13.1. PR.6/comparison-uniqueness (BS22 Theorem 18.2) applies to the comparison isomorphisms between AΩ, the absolute trace complex and φ_A^*Δ_{−/A_inf} as functors on all p-completely smooth O_C-algebras (BS22 Theorems 13.1 and 17.2, PR.6/ainf-omega-comparison); it applies neither to functors defined only on smooth O_K-algebras nor over A_inf⊗̂_𝔖A_inf, which is not a perfect prism. Equalities of maps over 𝔖 can be tested after extension along f by flat-coefficient-extension.

**Acceptance.**

- For R=O_K both sides are 𝔖 with φ_𝔖, and the equivalence is the identity: π₀(TC⁻(O_K/𝕊[z];Z_p)[1/b])=𝔖 and Δ_{O_K/𝔖}=𝔖.

- The double overlap A_inf⊗̂_𝔖A_inf is not a perfect prism: modulo p the element π^♭⊗1−1⊗π^♭ is nonzero and has p-th power u⊗1−1⊗u=0.

**Direct prerequisites.** `AInfCohomology:AI.7/cohomology`, `AInfCohomology:AI.7/trace-descent`, `AInfCohomology:AI.7/twisted-trace`, `AInfCohomology:AI.7/flat-coefficient-extension`, `RefinedTraceMethods:RT.6`, `PrismaticCohomology:PR.3/leta-frobenius-factorisation`, `PrismaticCohomology:PR.3/relative-nygaard-filtration`, `PrismaticCohomology:PR.3/relative-nygaard-graded-pieces`, `PrismaticCohomology:PR.3/bms2-comparison`, `PrismaticCohomology:PR.6/ainf-omega-comparison`, `PrismaticCohomology:PR.6/comparison-uniqueness`.

**Sources.**

- BS22: Example 1.9(3), pp.5–6; §15.2, first paragraph, p.105; Proposition 15.7, p.105; Proposition 15.7, proof, p.105; §15.2, last paragraph, p.105; Theorem 15.2(1), p.102; Theorem 15.3, p.103; Theorem 13.1, p.94; §18, first paragraph, p.122; Notation 18.1, p.122.

- BMS2: Corollary 11.8, p.301; Proposition 11.15, p.305.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Breuil–Kisin A_inf base change

`AInfCohomology:AI.7/ainf-base-change` · theorem · declaration `CohomologicalBK.ainfBaseChange`

Atlas planet: **Breuil–Kisin A_inf comparison**.

**Statement.** For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), where f uses Witt Frobenius and [π^♭]^p and the tensor product is (p,u)-completed. Prismatic base change targets (A_inf,(ξ̃)), and PR.6 identifies its result with φ_A^*Δ_{𝔛_{O_C}/(A_inf,(ξ))}≃AΩ_{𝔛_{O_C}}. The equivalence is Frobenius compatible. That it is an equivalence of E∞-algebras and that the affine equivalences are natural in R, which the gluing over 𝔛 uses, rest on the same two properties of the comparison AΩ_R≃φ_A^*Δ_{R/A_inf} of PR.6/ainf-omega-comparison; BS22 assert both (Theorem 17.2, Remark 17.3), and they are not established here. The passage to the ordinary derived tensor product for proper 𝔛 is in perfect-cohomological-modules.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- 𝔛 is a smooth p-adic formal scheme over O_K, quasi-compact and quasi-separated.

**Proof or construction.**

1. Use PR.1/prismatic-base-change for the normalized map f into the ξ̃-prism: f is a map of bounded prisms (𝔖,(E))→(A_inf,(ξ̃)) inducing O_K⊂O_C on the quotients (coefficient-normalization), so for an affine open Spf R of 𝔛, Δ_{R/𝔖}⊗̂^L_{𝔖,f}A_inf≃Δ_{R_{O_C}/(A_inf,(ξ̃))} (BS22 Theorem 1.8(5), Corollary 4.12).

2. φ_A is an isomorphism of prisms (A_inf,(ξ))→(A_inf,(ξ̃)) over the identity of O_C, because θ̃_A∘φ_A=θ_A; hence Δ_{R_{O_C}/(A_inf,(ξ̃))}=φ_A^*Δ_{R_{O_C}/(A_inf,(ξ))}. Use PR.6/ainf-omega-comparison and its θ/θ̃ square (BS22 Theorem 17.2) to identify this with AΩ_{R_{O_C}}, compatibly with Frobenius.

3. Gluing: the affine equivalences are natural in R as far as PR.6/ainf-omega-comparison is, and then define an equivalence between the (p,u)-completed base change of the sheaf Δ_{𝔛/𝔖} and AΩ on 𝔛_{O_C}. Since 𝔛 is quasi-compact and quasi-separated, derived global sections are a finite limit over affine opens and commute with the completed tensor product (completed-sheaf-tensor); RΓ_Ainf(𝔛⊗̂O_C) is the derived global sections of AΩ (AI.3).

**Acceptance.**

- Replacing f by g without twisting the cohomology would give Δ rather than AΩ.

**Direct prerequisites.** `AInfCohomology:AI.7/cohomology`, `AInfCohomology:AI.7/coefficient-normalization`, `PrismaticCohomology:PR.1/prismatic-base-change`, `PrismaticCohomology:PR.6/ainf-omega-comparison`, `PrismaticCohomology:PR.6/theta-theta-tilde-square`, `AInfCohomology:AI.3`, `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, `EnhancedDerivedSheaves:E4`.

**Sources.**

- BS22: Theorem 1.8(5), p.4; Example 1.9(2), p.5; Theorem 17.2, p.117.

- BMS2: Theorem 1.2(1), p.201; Theorem 11.2(1), p.298.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Frobenius-twisted Breuil–Kisin de Rham map

`AInfCohomology:AI.7/de-rham-base-change` · theorem · declaration `CohomologicalBK.deRhamBaseChange`

**Statement.** For every smooth p-adic formal scheme 𝔛/O_K, RΓ_𝔖(𝔛)⊗^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K), the cohomology of the p-completed de Rham complex, where θ_𝔖=θ̃_𝔖∘φ_𝔖 acts by φ_W on coefficients and u↦π^p; on 𝔛_ét it is an equivalence Δ_{𝔛/𝔖}⊗^L_{𝔖,θ_𝔖}O_K≃Ω^•_{𝔛/O_K} of commutative algebra objects. No completion of the tensor product and no quasi-compactness are needed: O_K is a perfect 𝔖-module through θ_𝔖, because φ_𝔖 is finite free and 𝔖 is regular, so the tensor product preserves derived completeness and commutes with derived global sections. After the p-completed base change O_K→O_C, for qcqs 𝔛, the left side becomes RΓ_Ainf(𝔛⊗̂O_C)⊗^L_{A_inf,θ_A}O_C, by ainf-base-change and θ_A∘f=θ_𝔖, so the statement yields an identification of the θ specialization of AΩ with de Rham cohomology of 𝔛⊗̂O_C. That this identification coincides, as a map, with the θ specialization of AI.5 is not in the sources; it is clause (b) of comparison-diagram-agreement.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- 𝔛 is a smooth p-adic formal scheme over O_K; quasi-compactness and quasi-separatedness are assumed only in the sentence about base change to O_C.

**Proof or construction.**

1. Apply PR.3/de-rham-comparison-general to the prism (𝔖,(E)); its composite coefficient map is θ_𝔖. It is a statement about sheaves on 𝔛_ét for every smooth 𝔛 (BS22 Corollary 15.4; Theorem 1.8(3)). Since φ_𝔖 is finite free of rank p (R07.4/bk-coefficient-rings), 𝔖/E is a finitely generated module over 𝔖 through φ_𝔖, hence a perfect complex over the regular ring 𝔖; so neither the pullback along φ_𝔖 nor the reduction modulo E needs a completion, and tensoring with O_K commutes with derived global sections. BMS2 Theorem 11.2(2) has the uncompleted tensor product for the same reason.

2. For the sentence about O_C use ainf-base-change and coefficient-normalization’s identity θ_A∘f=θ_𝔖; the comparison of PR.3/de-rham-comparison-general is the composite of φ̃⊗A/I, the Bockstein reduction and the Hodge–Tate comparison; φ̃ is compatible with base change of prisms (PR.3/leta-frobenius-factorisation), the complexes are by PR.1/prismatic-base-change, and the Hodge–Tate comparison of PR.1/hodge-tate-comparison is, because it is the unique map of commutative differential graded algebras out of the de Rham complex extending the structure map in degree 0. Applied to f:(𝔖,(E))→(A_inf,(ξ̃)) and to the isomorphism of prisms φ_A:(A_inf,(ξ))→(A_inf,(ξ̃)), this identifies the base change with the de Rham corner of PR.6/theta-theta-tilde-square. Agreement with the θ specialization map of AI.5 is not proved.

**Acceptance.**

- The untwisted quotient u↦π is the Hodge–Tate coefficient map for the prism, not this de Rham map.

**Direct prerequisites.** `AInfCohomology:AI.7/cohomology`, `AInfCohomology:AI.7/coefficient-normalization`, `AInfCohomology:AI.7/ainf-base-change`, `PrismaticCohomology:PR.3/de-rham-comparison-general`, `PrismaticCohomology:PR.6/theta-theta-tilde-square`, `AInfCohomology:AI.5`, `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, `EnhancedDerivedSheaves:E4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`, `PrismaticCohomology:PR.3/leta-frobenius-factorisation`, `PrismaticCohomology:PR.1/prismatic-base-change`, `PrismaticCohomology:PR.1/hodge-tate-comparison`.

**Sources.**

- BS22: Theorem 1.8(3), p.4; Theorem 1.8(3), p.4, second sentence; Corollary 15.4, p.104.

- BMS2: Theorem 1.2(2), p.201; Theorem 11.2(2), p.298.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Frobenius-normalized Witt specialization

`AInfCohomology:AI.7/crystalline-base-change` · theorem · declaration `CohomologicalBK.crystallineBaseChange`

**Statement.** For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗^L_{𝔖,c}W(k₀)≃RΓ_crys(𝔛_{k₀}/W(k₀)), where c=φ_W∘constantCoeff. No completion of the tensor product is needed: through c, W(k₀) is the 𝔖-module 𝔖/u, a perfect complex. This is Frobenius equivariant. The φ_W factor is the crystalline comparison’s Frobenius pullback, not a dispensable coordinate choice. After the p-completed extension W(k₀)→W(k̄) the left side becomes the specialization of RΓ_Ainf(𝔛⊗̂O_C) along A_inf→W(k̄), by ainf-base-change and the identity (A_inf→W(k̄))∘f=(W(k₀)→W(k̄))∘c, so the statement yields an identification of that specialization with crystalline cohomology of 𝔛_{k̄} over W(k̄). That this identification coincides, as a map, with AI.5’s W(k̄) comparison is not in the sources; it is clause (b) of comparison-diagram-agreement.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- 𝔛 is a smooth p-adic formal scheme over O_K, quasi-compact and quasi-separated.

**Proof or construction.**

1. First use PR.1/prismatic-base-change along constantCoeff to the crystalline prism (W(k₀),(p)); constantCoeff sends E to E(0), a unit multiple of p, and W(k₀)=𝔖/u is a perfect 𝔖-module, so the base change needs no completion.

2. Then apply PR.1/crystalline-comparison’s φ_W pullback, giving the composite c; φ_W is an automorphism of W(k₀), and c∘φ_𝔖=φ_W∘c gives Frobenius equivariance (BS22 Theorem 1.8(1), (5); BMS2 Theorem 11.2(3) states the result for the trace complex with the same map). For the last sentence use ainf-base-change and the identity of coefficient maps, which holds because A_inf→W(k̄) kills [π^♭]. Agreement with the comparison map of AI.5 is not proved.

**Acceptance.**

- A coefficient in F_{p²} detects the missing φ_W, even though k₀=F_p hides it.

**Direct prerequisites.** `AInfCohomology:AI.7/cohomology`, `AInfCohomology:AI.7/coefficient-normalization`, `AInfCohomology:AI.7/ainf-base-change`, `PrismaticCohomology:PR.1/prismatic-base-change`, `PrismaticCohomology:PR.1/crystalline-comparison`, `AInfCohomology:AI.5`, `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, `EnhancedDerivedSheaves:E4`.

**Sources.**

- BS22: Theorem 1.8(1), p.4; Theorem 1.8(5), p.4.

- BMS2: Theorem 1.2(3), p.201; Theorem 11.2(3), p.299; Remark 1.3, pp.201–202.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Perfect complex and cohomological Breuil–Kisin modules

`AInfCohomology:AI.7/perfect-cohomological-modules` · theorem · declaration `CohomologicalBK.perfectCohomologicalModules`

**Statement.** For proper smooth 𝔛/O_K, RΓ_𝔖 is perfect, and every H^i_𝔖 is a finitely generated (equivalently finitely presented, 𝔖 being noetherian) 𝔖-module with an isomorphism (φ_𝔖^*H^i_𝔖)[1/E]≃H^i_𝔖[1/E]. These are the broad cohomological Breuil–Kisin modules of BMS2 Definition 1.1, potentially with p-torsion. They are not assigned the finite-free Kisin-module classification of R07.4. Consequently, for proper 𝔛, the completed tensor product of ainf-base-change is the ordinary derived tensor product, RΓ_𝔖(𝔛)⊗^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), and the A_inf extension of H^i_𝔖 is H^i_Ainf by flatness.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- 𝔛 is a proper smooth p-adic formal scheme over O_K.

**Proof or construction.**

1. Perfectness, independently of A_inf, by reduction modulo (p,u) as in BMS2 Theorem 11.2, footnote 18 (which uses the crystalline comparison) and in the sentence after BS22 Theorem 1.8 (which uses the Hodge–Tate comparison); here the de Rham comparison is used: RΓ_𝔖(𝔛) is derived (p,u)-complete (cohomology). By PR.3/de-rham-comparison-general, RΓ_𝔖(𝔛)⊗^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K), with no completion since O_K is a perfect 𝔖-module through θ_𝔖; reducing modulo π gives (RΓ_𝔖(𝔛)⊗^L_𝔖k₀)⊗_{k₀,Frob}k₀≃RΓ_dR(𝔛_{k₀}/k₀), which has finite-dimensional total cohomology because 𝔛_{k₀} is proper and smooth over k₀ (finiteness of the coherent cohomology of a proper scheme over a field). Frobenius of k₀ is bijective, so RΓ_𝔖(𝔛)⊗^L_𝔖k₀ is perfect over k₀.

2. A derived (p,u)-complete complex over 𝔖 whose derived reduction modulo (p,u) is perfect is perfect: its reductions modulo (p^n,u^n) have finite-length cohomology in a range of degrees independent of n, so by completeness and the Mittag-Leffler property its cohomology is the inverse limit of these, vanishes outside that range and is finitely generated by Nakayama for complete modules (AI.5); finitely generated modules over the regular noetherian ring 𝔖 are perfect.

3. Use noetherianness of 𝔖 and flatness of φ_𝔖 (finite free of rank p) to pass Frobenius to cohomology: the linearized Frobenius of RΓ_𝔖(𝔛) is an equivalence after inverting E (cohomology; BS22 Theorem 1.8(6)), and φ_𝔖^* and localisation are exact. This is the statement of BMS2 Theorem 1.2(1) for BMS2’s complex.

4. A_inf extension: a perfect complex tensored with the (p,[π^♭])-adically complete ring A_inf is derived complete, so by ainf-base-change RΓ_𝔖(𝔛)⊗^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C); by flatness of f (flat-coefficient-extension) H^i_𝔖⊗_{𝔖,f}A_inf≃H^i_Ainf.

**Acceptance.**

- The perfect complex [𝔖→ᵖ𝔖] has H¹=𝔖/p and is an explicit counterexample to perfect implies free cohomology.

**Direct prerequisites.** `AInfCohomology:AI.7/ainf-base-change`, `AInfCohomology:AI.7/flat-coefficient-extension`, `AInfCohomology:AI.7/cohomology`, `PrismaticCohomology:PR.3/de-rham-comparison-general`, `AInfCohomology:AI.5`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`.

**Sources.**

- BMS2: Definition 1.1, p.201; Theorem 1.2(1), p.201; Theorem 11.2, footnote 18, p.299.

- BS22: sentence after Theorem 1.8, p.5.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Exact cohomological BK to BKF tensor functor

`AInfCohomology:AI.7/bkf-tensor-functor` · theorem · declaration `CohomologicalBK.bkfTensorFunctor`

**Statement.** For the broad category of finitely presented 𝔖-modules M with (φ_𝔖^*M)[1/E]≃M[1/E], extension M↦M⊗_{𝔖,f}A_inf is an exact symmetric monoidal functor to AI.2’s finitely presented BKF modules. R07.4 supplies BMS1 Proposition 4.3 that M[1/p] is free; f(E) generates ξ̃. This identifies the Frobenius structure on H^i_𝔖⊗A_inf with the earlier cohomological BKF module.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Proof or construction.**

1. Import from R07.4 the category of finitely generated 𝔖-modules of BMS1 Definition 4.1, with BMS1 Proposition 4.3 (M[1/p] is finite free over 𝔖[1/p]).

2. Apply BMS1 Proposition 4.32, using flat-coefficient-extension, coefficient-normalization and AI.2’s ξ̃-linearized presentation; specialize to perfect-cohomological-modules. The source writes f(E) for the image of E under the map 𝔖→A_inf fixed before Lemma 4.30, which is the map f of coefficient-normalization. The identification of the Frobenius structures on H^i (last sentence of the statement) is not part of Proposition 4.32; it uses the Frobenius compatibility of ainf-base-change.

**Acceptance.**

- Exactness is scalar extension, not a claim that Kisin’s representation-to-lattice functor is exact.

**Direct prerequisites.** `AInfCohomology:AI.7/perfect-cohomological-modules`, `AInfCohomology:AI.7/flat-coefficient-extension`, `AInfCohomology:AI.7/coefficient-normalization`, `AInfCohomology:AI.7/ainf-base-change`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `AInfCohomology:AI.2`.

**Sources.**

- BMS1: Proposition 4.32, p.281; Proposition 4.32, proof, p.281; Proposition 4.3, p.263; Lemma 4.30, p.281; Definition 4.22, p.276.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Breuil–Kisin twist base change

`AInfCohomology:AI.7/twist-compatibility` · theorem · declaration `CohomologicalBK.twistCompatibility`

**Statement.** The Breuil–Kisin twist 𝔖{1} of the prism (𝔖,(E)) (PR.3/breuil-kisin-twist; BMS1 Example 4.2) has 𝔖{1}⊗_{𝔖,f}A_inf≃A_inf{1} as BKF objects, compatibly with φ and the G_{K∞} action; tensor powers and dual twists are preserved. This is the first step of the proof of BMS1 Corollary 4.33, whose statement is that Z_p(1) is sent to 𝔖{1} by the functor of BMS1 Theorem 4.4. R07.4 owns that representation classification, and PR.7/etale-realization supplies the corresponding statement that the étale realisation of the twist is Z_p(1); AI.0:integral and AI.2 own the A_inf twist and étale realization.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Proof or construction.**

1. 𝔖{1} is the twist of the prism (𝔖,(E)) of PR.3/breuil-kisin-twist: the inverse limit of the conormal modules E_r𝔖/E_r²𝔖, E_r=Eφ(E)⋯φ^{r−1}(E), along the canonical maps divided by p (BMS1 Example 4.2). A_inf{1} is the same construction for (A_inf,(ξ̃)) with ξ̃_r=ξ̃φ(ξ̃)⋯φ^{r−1}(ξ̃) (BMS1 Example 4.24; AI.0:integral).

2. f is a map of prisms (𝔖,(E))→(A_inf,(ξ̃)) commuting with φ (coefficient-normalization), so f(E_r) generates (ξ̃_r) and E_r𝔖/E_r²𝔖⊗_𝔖A_inf≅ξ̃_rA_inf/ξ̃_r²A_inf, both sides being free of rank one on the class of E_r, respectively f(E_r). These isomorphisms are compatible with the transition maps and with the Frobenius and give 𝔖{1}⊗_{𝔖,f}A_inf≅A_inf{1} in the limit; this is the functoriality of PR.3/breuil-kisin-twist for maps of prisms. BMS1 refers to the cotangent-complex definition for this step of Corollary 4.33 without expanding the argument. G_{K∞} fixes [π^♭], hence f(𝔖), and acts on A_inf{1} through automorphisms of the prism (A_inf,(ξ̃)), so the isomorphism is G_{K∞}-equivariant.

3. Tensor powers and duals: bkf-tensor-functor is symmetric monoidal and 𝔖{1} is ⊗-invertible (BMS1 Example 4.2). This is not stated in Corollary 4.33; it follows from BMS1 Proposition 4.32.

4. Z_p(1) and 𝔖{1}: A_inf{1}=(1/μ)(Z_p(1)⊗A_inf) (BMS1 Example 4.24; AI.0:integral, AI.2 Tate realization) gives a φ, G_{K∞}-equivariant identification 𝔖{1}⊗_𝔖W(C^♭)≅Z_p(1)⊗W(C^♭), which by the characterisation in BMS1 Theorem 4.4 shows that Z_p(1) is sent to 𝔖{1} (Kisin’s functor and the uniqueness of a lattice of finite E-height: R07.4/finite-height-lattices and R07.4/semistable-finite-height; the passage between Kisin’s embedding u↦[π^♭] and f, and the covariant normalisation: PR.7/kisin-functor-comparison); PR.7/etale-realization states the same for the étale realisation of the twist. No second twist or classification is constructed.

**Acceptance.**

- H² of the Breuil–Kisin cohomology of the p-adic completion of P¹ over O_K is 𝔖{−1}, and its extension along f is A_inf{−1}=H²_Ainf of P¹ over O_C.

- A generator of 𝔖{1}, on which φ acts by a unit multiple of 1/E, maps under f to a generator of A_inf{1}, on which φ acts by a unit multiple of 1/ξ̃ (BMS1 Examples 4.2 and 4.24).

**Direct prerequisites.** `AInfCohomology:AI.7/bkf-tensor-functor`, `AInfCohomology:AI.7/coefficient-normalization`, `PrismaticCohomology:PR.3/breuil-kisin-twist`, `PrismaticCohomology:PR.7/etale-realization`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.2`, `PrismaticCohomology:PR.7/kisin-functor-comparison`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/finite-height-lattices`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/semistable-finite-height`.

**Sources.**

- BMS1: Corollary 4.33, proof, pp.281–282; Corollary 4.33, p.281; Example 4.2, pp.262–263; Example 4.24, pp.276–277; Theorem 4.4, p.265.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Breuil–Kisin Frobenius décalage identity

`AInfCohomology:AI.7/frobenius-decalage` · theorem · declaration `CohomologicalBK.frobeniusDecalage`

**Statement.** For p-completely smooth R/O_K, the Frobenius factors canonically as φ_𝔖^*D_𝔖(R)≃Lη_E D_𝔖(R)→D_𝔖(R) (BS22 Theorem 15.3). For the trace complex, BMS2 Remark 11.17 gives the factorisation φ_𝔖^*D_𝔖^tr(R)≃Lη_E D_𝔖^tr(R)→D_𝔖^tr(R) from the Beilinson connective cover map from the Nygaard filtration of D̂_tw to the E-adic filtration of D_𝔖^tr. Under trace-prismatic-agreement, which respects the Nygaard filtrations on the Frobenius twists (BS22 Proposition 15.7), the two factorisations correspond. It does not assert a Nygaard filtration on D_𝔖 itself.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- R is the p-adic completion of a smooth O_K-algebra.

**Proof or construction.**

1. Import PR.3/leta-frobenius-factorisation (BS22 Theorem 15.3) for the prismatic statement and AI.1’s filtered décalage/Beilinson connective cover (BMS2 Proposition 5.8).

2. For the trace complex follow BMS2 Remark 11.17. RT.6 supplies the filtered map from the Nygaard filtration of D̂_tw (BMS2 Remark 11.14) to the E-adic filtration of D_𝔖^tr: the restriction of the Frobenius to the i-th Nygaard step is divisible by E^i because v^i=E^i/b^i in π_*TC⁻(O_K/𝕊[z];Z_p)[1/b], and E is a non-zero-divisor on π_*TC⁻(S/𝕊[z];Z_p) for quasiregular semiperfectoid S. Its source is connective for the Beilinson t-structure as in BMS2 Corollary 7.10(1). That it is a connective cover is checked after extension to A_inf, where it is BMS2 Proposition 9.10; equivalences are detected there because 𝔖→A_inf is topologically free (flat-coefficient-extension).

3. That the two factorisations correspond is not stated in the sources. Under trace-prismatic-agreement the filtered Frobenius of the previous step goes to the prismatic one: on quasiregular semiperfectoid algebras both send an element n of the i-th Nygaard step to E^i times the class n/E^i. The factorisation of a filtered map from a Beilinson-connective object through the connective cover is unique (PR.3/leta-frobenius-factorisation).

**Acceptance.**

- The canonical inclusion after décalage is part of the identity, not merely an isomorphism of underlying graded modules.

**Direct prerequisites.** `AInfCohomology:AI.7/trace-prismatic-agreement`, `AInfCohomology:AI.7/twisted-trace`, `AInfCohomology:AI.7/trace-descent`, `PrismaticCohomology:PR.3/leta-frobenius-factorisation`, `AInfCohomology:AI.1`, `RefinedTraceMethods:RT.6`, `AInfCohomology:AI.7/flat-coefficient-extension`.

**Sources.**

- BS22: Theorem 15.3, p.103; Theorem 15.3, p.103, last sentence.

- BMS2: Remark 11.17, p.307; Remark 11.14, p.305; Proposition 5.8, p.238.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Nygaard filtration non-descent test

`AInfCohomology:AI.7/nygaard-nondescent` · theorem · declaration `CohomologicalBK.nygaardNonDescent`

**Statement.** The Nygaard filtration on φ_𝔖^*D_𝔖^tr≃D̂_tw has no functorial descent along φ_𝔖 to a filtration on D_𝔖^tr with the same degree-zero projection D̂_tw(R)→gr⁰≃R. For R=O_K the projection is 𝔖^(−1)→O_K, and a descent of it is a quotient 𝔖/J with φ_𝔖(J)𝔖=(E). There are two cases. (i) If (E) is not of the form φ_𝔖(J)𝔖, which is so whenever p does not divide the degree e of E, in particular for unramified K, no descent exists even for R=O_K. (ii) If (E)=φ_𝔖(J)𝔖, as for K=Q_p(p^{1/p}) with π=p^{1/p} and J=(u−p), then J=ker θ_𝔖, the ring O₀=𝔖/J is identified by θ_𝔖 with the subring W(k₀)[π^p] of O_K, and O_K=O₀⊗_{𝔖,φ_𝔖}𝔖 is free of rank p over O₀. A functorial descent would then canonically descend every smooth formal O_K-scheme to O₀, and a good-reduction elliptic curve with j∈O_K∖O₀ contradicts it.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- The negative statement is about functorial descent of the filtration/projection; it does not prohibit accidental descents for individual objects.

- The elliptic-curve argument of BMS2 Remark 11.16 is complete in case (ii) only; K=Q_p(p^{1/p}) with π=p^{1/p}, E=u^p−p, k₀=F_p is the worked instance.

**Proof or construction.**

1. Use BMS2 Remark 11.16’s degree-zero Nygaard projection and its implied canonical scheme descent: a descent R₀ of the 𝔖^(−1)-algebra R along φ_𝔖 satisfies R≅R₀⊗_{𝔖,φ_𝔖}𝔖 and is killed by ker θ_𝔖=φ_𝔖^{-1}(E𝔖), because R is killed by E and φ_𝔖 is faithfully flat.

2. The dichotomy is not in the source. BMS2 Remark 11.16 argues uniformly in K: a functorial descent would descend every smooth formal O_K-scheme to W(k₀)[π^p], the image of θ_𝔖, and an elliptic curve with good reduction and j∈O_K∖W(k₀)[π^p] contradicts this. That argument is complete only in case (ii). In case (i) no quotient O₀ of 𝔖 has O₀⊗_{𝔖,φ_𝔖}𝔖≅O_K, so there is no ring to which the schemes would descend, and for K unramified W(k₀)[π^p]=O_K, so that no such elliptic curve exists; there the non-descent is the statement that (E) is not extended along φ_𝔖. For R=O_K a descent of the surjection 𝔖^(−1)→O_K is a surjection 𝔖→𝔖/J with φ_𝔖(J)𝔖=(E), by faithful flatness of φ_𝔖. Modulo p the ideal φ_𝔖(J)𝔖 of k₀[[u]] is generated by a power u^{pm}, while E≡u^e, so p divides e in case (ii). There J⊂ker θ_𝔖 and both ideals have the same extension along φ_𝔖, so J=ker θ_𝔖; and O_K=𝔖/E=O₀⊗_{𝔖,φ_𝔖}𝔖 is free of rank p over O₀ because φ_𝔖 is finite free of rank p. In particular O₀≠O_K.

3. Worked instance of case (ii): K=Q_p(p^{1/p}), π=p^{1/p}, E=u^p−p, θ_𝔖(u)=p, J=(u−p), φ_𝔖(u−p)=E, O₀=Z_p. Choose c∈Z_p with c and c−1728 units (any unit c if p≤3) and put j=c+π; then j∉Z_p because [K:Q_p]=p>1. The curve y²+xy=x³−36x/(j−1728)−1/(j−1728) over O_K has c₄=j/(j−1728), discriminant j²/(j−1728)³, which is a unit, and j-invariant j; it has good reduction. A descent of its p-adic completion to Z_p would be a smooth proper formal curve of genus one over Z_p; it has a section, by Lang’s theorem on the special fibre and smoothness, hence algebraizes to an elliptic curve over Z_p with the same j-invariant, which forces j∈Z_p.

**Acceptance.**

- For K=Q_p(p^{1/p}), π=p^{1/p}: O₀=Z_p, O_K is free over Z_p on 1,π,…,π^{p−1}, and the elliptic curve of the proof has j=c+π, which is not in Z_p.

- For K=Q_p with π=p (E=u−p) case (i) applies: W(k₀)[π^p]=Z_p=O_K, so no elliptic curve with j∈O_K∖W(k₀)[π^p] exists, and the non-descent comes from the fact that (u−p) is not generated by a power series in u^p.

**Direct prerequisites.** `AInfCohomology:AI.7/twisted-trace`, `AInfCohomology:AI.7/trace-descent`, `AInfCohomology:AI.7/coefficient-normalization`, `RefinedTraceMethods:RT.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`.

**Sources.**

- BMS2: Remark 11.16, p.307; Remark 11.14, p.305.

**Suggested-file boundary (partial).** Typed in the suggested file: the algebraic core of the example (c+π is not in the image of ℤ_p in ℤ_p[π]/(π^p−p)). The statement about filtrations is in the named inventory.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Uniformizer-choice transport after A_inf extension

`AInfCohomology:AI.7/choice-transport` · construction · declaration `CohomologicalBK.choiceTransport`

**Statement.** For two choices (π,π^♭) and (π′,π′^♭), extend their respective 𝔖-valued complexes along the normalized maps f,f′ to the same A_inf. Define the transport as the first ainf-base-change equivalence followed by the inverse of the second, through the intrinsic AΩ complex. It is Frobenius compatible and satisfies identity/cocycle; being defined through AΩ, it is compatible with products and natural in 𝔛 as far as ainf-base-change is, and it identifies the specialisations of the two extensions along θ_A, θ̃_A and A_inf→W(k̄). Descent of a morphism to either 𝔖 is extra structure for derived objects, not a property: by complete-flat-descent, which applies because f is p-completely faithfully flat, the 𝔖-linear maps between derived p-complete complexes are the points of the totalisation of the mapping spaces of their p-completed base changes to the p-completed Čech nerve of f; for perfect complexes, as for proper 𝔛, these base changes are the ordinary ones. For finitely presented 𝔖-modules, such as the H^i_𝔖 of a proper 𝔛, a morphism of the A_inf-extensions comes from a unique 𝔖-linear morphism exactly when its two pullbacks to the p-completion of A_inf⊗_𝔖A_inf agree. No 𝔖-linear identification of unrelated coefficient rings is asserted. The construction is not in BMS2 or BS22.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- (π,π^♭) and (π′,π′^♭) are two choices of a uniformizer of O_K with a compatible system of p-power roots in O_C; E, E′ are their Eisenstein polynomials, f, f′ the normalized maps of coefficient-normalization, and the two Breuil–Kisin prisms are (W(k₀)[[u]],(E)) and (W(k₀)[[u]],(E′)). 𝔛 is smooth, quasi-compact and quasi-separated over O_K, as in ainf-base-change.

**Proof or construction.**

1. Use the intrinsic AI.3/AI.5 functor and ainf-base-change for both choices.

2. Compose those canonical equivalences and use their naturality; identity and cocycle hold by construction, the transport from choice i to choice j being α_j^{-1}∘α_i for the equivalences α_i of ainf-base-change. The descent statements are complete-flat-descent applied to f, whose hypotheses are checked in flat-coefficient-extension. For finitely presented modules the mapping spaces are discrete, so the totalisation is an equaliser; this uses that the p-completed tensor powers of A_inf over 𝔖 are flat over 𝔖 (flat-coefficient-extension, BMS1 Remark 4.31), so that the base changes of the modules stay discrete.

**Uses.**

- `AI.7 acceptance and HabiroCohomologyFoundations:HQ.8`: Consumers need the canonical shared comparison diagram without pretending the uniformizer was never chosen.

**API.**

- `CohomologicalBK.choiceTransport.identity` (simp): Transport for the same choice is the identity under its fixed comparison.

- `CohomologicalBK.choiceTransport.cocycle` (functoriality): For three choices transport₍₂₃₎∘transport₍₁₂₎=transport₍₁₃₎.

- `CohomologicalBK.choiceTransport.descend` (characterisation): For a fixed f and derived p-complete 𝔖-complexes D, D′, the space of 𝔖-linear maps D→D′ is the totalisation of the mapping spaces between the p-completed base changes of D and D′ to the terms of the p-completed Čech nerve of f (complete-flat-descent); so for derived objects a morphism over A_inf descends only together with coherence data on the higher terms. For finitely presented 𝔖-modules M, M′ a morphism M⊗_𝔖A_inf→M′⊗_𝔖A_inf comes from a unique 𝔖-linear morphism precisely when its two pullbacks to the p-completion of A_inf⊗_𝔖A_inf agree.

**Unit tests.**

- `CohomologicalBK.choiceTransport.point` (degenerate): For SpfO_K every extension identifies with A_inf and the transport is its identity.

- `CohomologicalBK.choiceTransport.root_change` (compatibility): For the same π and two compatible systems of roots, π′^♭=ε^a·π^♭ with a∈Z_p and ε=(1,ζ_p,ζ_{p²},…), one has f′(u)=[ε]^{ap}·f(u), so f≠f′ when a≠0, while both extensions are identified with the same AΩ; for 𝔛=Spf O_K the transport is the identity of A_inf although the two 𝔖-algebra structures on A_inf differ.

- `CohomologicalBK.choiceTransport.different_uniformizers` (non-example): For two uniformizers π≠π′ one has θ̃_A(f(u))=π and θ̃_A(f′(u))=π′, so f(u)≠f′(u): the transport is not 𝔖-linear for the identification of the two copies of W(k₀)[[u]] that sends u to u.

**Acceptance.**

- Choice-independent transport is on the common A_inf extension; the unextended rings have explicitly different maps u↦[π^♭]^p.

**Direct prerequisites.** `AInfCohomology:AI.7/ainf-base-change`, `AInfCohomology:AI.7/flat-coefficient-extension`, `AInfCohomology:AI.3`, `AInfCohomology:AI.5`, `DerivedDeRhamCohomology:DD.1/complete-flat-descent`.

**Sources.**

- BMS2: §1.1, p.200; Notation 11.1, p.298; Theorem 11.2(1), p.298.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### Agreement of smooth comparison maps

`AInfCohomology:AI.7/comparison-diagram-agreement` · theorem · declaration `CohomologicalBK.comparisonDiagramAgreement`

Atlas planet: **Comparison-map agreement**.

**Statement.** (a) [BS22 Theorem 17.2, Remark 17.3, Lemma 17.4, Theorem 18.2] For p-completely smooth R/O_C, import AΩ_R≃φ_A^*Δ_{R/(A_inf,kerθ)} from PR.6; equivalently AΩ_R is prismatic cohomology of R over the perfect prism (A_inf,(ξ̃)), with A_inf/ξ̃≅O_C through θ̃. Under it the Hodge–Tate structure map η:R→H⁰(AΩ_R⊗^L_{A_inf,θ̃}O_C) of AI.4 agrees with the prismatic one, and the two Hodge–Tate isomorphisms of commutative differential graded algebras between (Ω^*_{R/O_C},d) and the cohomology of the θ̃ reduction with its Bockstein differential correspond; in particular the classes of dt on O_C⟨t⟩ and of dlog t on O_C⟨t^{±1}⟩ correspond. The comparison is the only isomorphism of such functors on p-completely smooth O_C-algebras that is compatible with η. The Breuil–Kisin twists are trivialised by the generator ξ̃, as in the proof of BS22 Theorem 17.2. The uniqueness statement, and the correspondence of the Hodge–Tate isomorphisms as natural isomorphisms of differential graded algebras, use that the comparison is natural in R and symmetric monoidal; BS22 assert both (Theorem 17.2, Remark 17.3) and they are not proved here. For a fixed R the isomorphism and its compatibility with η do not depend on them. (b) [Not in the sources.] It is neither stated nor proved in BS22, BMS1 or BMS2 that under these identifications the θ de Rham, crystalline, étale and B_dR⁺ comparison maps of AI.4–AI.5 correspond to those induced from the prismatic comparisons, nor that the Breuil–Kisin and trace specialisation maps of AI.7 correspond. These agreements are the open part of this target: the stage has to prove them, and no source does. BS22 Theorem 18.2 does not give them: it concerns functors, defined on all p-completely smooth algebras over the perfectoid ring, with values in complexes over a perfect prism, so it applies neither over the non-perfect prism (A_cris,(p)) nor to functors defined only on smooth O_K-algebras. The crystalline agreement is to be checked on the same PD/Koszul generators; uniqueness of the A_inf functor alone is not claimed to prove it.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- Smooth R, not the singular semistable models of AI.6; the prism for §18 uniqueness is perfect, and the Hodge–Tate structure transformation η is part of the comparison datum.

- C, the completed algebraic closure of K, is a perfectoid field of characteristic 0 containing μ_{p^∞}, as BS22 §17 requires. The perfect prism for the uniqueness statement is (A_inf,(ξ̃)), and η is the map from R to H⁰ of the reduction along θ̃.

**Proof or construction.**

1. (a) Import AΩ_R≃φ_A^*Δ_{R/A_inf} with its Frobenius compatibility from PR.6/ainf-omega-comparison (BS22 Theorem 17.2, Remark 17.3). The comparison map intertwines the two Hodge–Tate structure maps η; BS22 leaves the reduction to the completed torus R = O_C[x^{±1}]^∧ to the reader, and PR.6/theta-theta-tilde-square records it. By BS22 Lemma 17.4 a multiplicative map that intertwines the maps η induces an isomorphism of the cohomology algebras of the θ̃ reductions with their Bockstein differentials, both identified with (Ω^*_{R/O_C},d) through the universal property of the de Rham complex; so compatibility with dt on O_C⟨t⟩ and dlog t on O_C⟨t^{±1}⟩ is a consequence of compatibility on H⁰, not an additional condition.

2. (a) Apply PR.6/comparison-uniqueness (BS22 Theorem 18.2) over the perfect A_inf prism (A_inf,(ξ̃)): the pair formed by prismatic cohomology and η has no nontrivial endomorphism among pairs (G,η) with G a symmetric monoidal functor on all p-completely smooth O_C-algebras; Frobenius compatibility is not an extra hypothesis of that uniqueness theorem. This step needs the comparison as a morphism of pairs (G,η) of symmetric monoidal functors, hence its naturality in R and its multiplicativity.

3. (b) is not proved. A possible route: for the θ de Rham map, compare the two factorisations of Frobenius through Lη_{ξ̃} (that of AΩ in BMS1 and BS22 Theorem 15.3), noting that BMS1 Theorem 14.1 deduces its de Rham comparison from the A_cris comparison and mentions the route through Lη only as an alternative; for the crystalline maps use PR.1 crystalline/base change and AI.4’s actual PD maps and check on PD/Koszul generators; for the Breuil–Kisin and trace maps use ainf-base-change, trace-prismatic-agreement and the RT.6 relative map; AI.5/CP.3 supplies the generic étale/B_dR square.

**Acceptance.**

- On a torus, θ̃ H⁰ is R, whereas the θ de Rham H⁰ is O_C; the tests detect the omitted φ_A twist.

- The comparison datum is η on H⁰ of the θ̃ (Hodge–Tate) reduction, natural and multiplicative in R; the polynomial and torus tests check its consequences on dt and dlog t through the Bockstein differential. H⁰ of the θ de Rham reduction, which is O_C on a torus, tests nothing.

**Direct prerequisites.** `PrismaticCohomology:PR.6/ainf-omega-comparison`, `PrismaticCohomology:PR.6/theta-theta-tilde-square`, `PrismaticCohomology:PR.6/comparison-uniqueness`, `PrismaticCohomology:PR.1/crystalline-comparison`, `PrismaticCohomology:PR.1/prismatic-base-change`, `AInfCohomology:AI.4`, `AInfCohomology:AI.5`, `CohomologyComparisons:CP.3`, `RefinedTraceMethods:RT.6`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `AInfCohomology:AI.7/ainf-base-change`, `AInfCohomology:AI.7/trace-prismatic-agreement`, `AInfCohomology:AI.7/de-rham-base-change`, `AInfCohomology:AI.7/crystalline-base-change`.

**Sources.**

- BS22: §17, first paragraph, p.117; Theorem 17.2, p.117; Remark 17.3, p.117; Theorem 17.2, proof, p.120; Lemma 17.4, p.120; Notation 18.1, p.122; Theorem 18.2, p.122; Example 1.9(2), p.5.

- BMS1: Theorem 14.1, proof, p.389.

**Suggested-file boundary (omitted).** Named mathematical signature/API/test inventory is present in the suggested file. Missing supplier types are omitted under PROTOCOL §13, not replaced by arbitrary data or proposition fields.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

### De Rham torsion divisibility constraint

`AInfCohomology:AI.7/de-rham-torsion-divisibility` · application · declaration `CohomologicalBK.deRhamTorsionDivisibility`

**Statement.** Let K=Q_p(p^{1/p}) with uniformizer π=p^{1/p} and 𝔛/O_K proper smooth. The map θ_𝔖 has u↦π^p=p and factors through Z_p. Therefore RΓ_dR(𝔛/O_K) is the scalar extension of a perfect Z_p-complex. Each cyclic indecomposable summand of H^i_dR(𝔛/O_K)_tors has O_K-length divisible by p; equivalently it is O_K/(π^{pa}) for some a≥1. The total torsion length is a multiple of p.

**Additional hypotheses.**

- K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

- In this node K=Q_p(p^{1/p}), π=p^{1/p}, so k₀=F_p, W(k₀)=Z_p and E=u^p−p; 𝔛 is proper and smooth over O_K.

**Proof or construction.**

1. Use de-rham-base-change and the coefficient-normalization map; take RΓ_𝔖⊗^L_{u↦p}Z_p.

2. Use O_K finite free of ramification degree p over Z_p, so cohomology commutes with this extension. Apply the structure theorem for finitely generated modules over the principal ideal domain Z_p (Mathlib) to the cohomology of the perfect Z_p-complex: Z_p/(p^a) extends to O_K/(π^{pa}); uniqueness of the elementary divisors of a finitely generated torsion module over the discrete valuation ring O_K is taken from AI.5.

**Acceptance.**

- For p=3 a cyclic summand of length 1 or 2 is excluded, while length 3a is allowed.

- For K=Q_p(p^{1/p}): O_K/π is not of the form M⊗_{Z_p}O_K for a Z_p-module M, since its length 1 is not divisible by p; so not every finitely generated torsion O_K-module can occur.

**Direct prerequisites.** `AInfCohomology:AI.7/de-rham-base-change`, `AInfCohomology:AI.7/perfect-cohomological-modules`, `AInfCohomology:AI.7/coefficient-normalization`, `AInfCohomology:AI.5`, `mathlib:Module.equiv_free_prod_directSum`, `mathlib:Module.equiv_directSum_of_isTorsion`.

**Sources.**

- BMS2: Remark 1.4, p.202; Theorem 1.2(2), p.201; Remark 11.13, p.305.

**Suggested-file boundary (partial).** Typed in the suggested file: π^p=p and the lengths of O_K/π^n and O_K/p^a for O_K=ℤ_p[π]/(π^p−p). The geometric statement is in the named inventory.

Proposed module: `TauCeti/AlgebraicGeometry/AInf/BreuilKisin`; namespace `TauCeti.AInfBlueprint`.

## Supplier contracts

The following 18 requests describe the exact imported interfaces and their consumers. They remain requests; this part creates no duplicate supplier nodes. Named cross-roadmap prerequisites in the register refer to existing packet nodes; the contracts below cover stage interfaces without suitable nodes.

### AInfCohomology:AI.0:integral

From the leaf that owns the O_C-specialised integral coefficients (accepted restructuring RS-01). (1) A_inf=W(O_C^♭) with θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ), ξ̃=φ_A(ξ); μ, ξ, ξ̃ are nonzerodivisors, φ_A(μ)=ξ̃·μ, ξ̃≡p mod μ, θ̃(μ)=ζ_p−1, and A_inf is (p,μ)-adically complete; A_inf is a local ring, p-torsion-free, with A_inf/p=O_C^♭ a valuation ring, and for a nonzero nonunit x of O_C^♭ the sequence (p,[x]) is regular and A_inf is (p,[x])-adically complete. (2) The ideal W(𝔪^♭)=ker(A_inf→W(k̄)), the residue map and its factorisation through A_cris. (3) The criterion that an element ξ=(ξ₀,ξ₁,…) of ker θ with ξ₁ a unit generates ker θ (BMS1 Remark 3.11), used for g(E) and f(E). (4) The twists A_inf{1} and O_C{1}, with ker θ̃/(ker θ̃)²≅O_C{1} (CK (4.9.1)) and the pair (Z_p(1), ξ⁻¹(Z_p(1)⊗B_dR⁺)) of A_inf{1} (BMS1 Example 4.24). (5) For an affinoid perfectoid R′_∞ over O_C, in particular the R_∞ of root-tower and the R_{Σ,Λ,∞} of all-coordinates: A_inf(R′_∞)=W(R′_∞^♭) with θ and A_inf(R′_∞)/ξ≅R′_∞, the regular sequences (p^n,μ^{n′}) (CK Lemma 3.13), and the ξ-adic separatedness of A_inf(R′_∞) (Stacks Project 090T). The injectivity statement CK Proposition 5.36 is planned in this packet (finite-level-acris). (6) Flatness of Z_p[[T]]→A_inf, T↦[ε^{1/p^j}]−1 (the criterion of BMS1 Remark 4.31), and its faithful flatness, the map being local; used in CK Propositions 3.29 and 3.33. Parts of (1) and (5) are already nodes of another packet (PrismaticCohomology:PR.0/ainf-prism: A_inf(R) of an integral perfectoid ring with its distinguished generator) and the carriers are in Mathlib (WittVector, PreTilt, WittVector.fontaineTheta); the plan of this stage should import them.

**Needed by.** `AInfCohomology:AI.6/monomial-splitting`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.6/aomega-frobenius`, `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/finite-level-acris`, `AInfCohomology:AI.6/finite-pd-base-change`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/all-coordinates-map`, `AInfCohomology:AI.6/crystalline-de-rham-square`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/hyodo-kato-interface`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.7/coefficient-normalization`, `AInfCohomology:AI.7/flat-coefficient-extension`, `AInfCohomology:AI.7/twist-compatibility`.

### AInfCohomology:AI.0:period-comparison

Compatibility of the rational period-ring maps with the integral structures, beyond what the nodes of PadicHodgeTheory:R06.1 state (A_cris→B_dR⁺, B_dR⁺ a complete discrete valuation ring with uniformiser ξ, the canonical K̄→B_dR⁺; these are cited by node): B_dR⁺ is flat over A_inf (CK §6.1, by Raynaud–Gruson II.1.4.2.1); B_dR⁺ is an algebra over every finite extension of W(k̄)[1/p] in C; B_dR⁺/ξⁿ=(A_inf/ξⁿ)[1/p] with the topology for which A_inf/ξⁿ, p-adically topologised, is an open subring (CK §6.2).

**Needed by.** `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `AInfCohomology:AI.6/bdr-comparison-map`, `AInfCohomology:AI.6/bdr-comparison`, `AInfCohomology:AI.6/etale-bdr-agreement`, `AInfCohomology:AI.6/de-rham-lattice-functor`.

### AInfCohomology:AI.1

Exact statements, by source label. (1) BMS1 Lemma 6.10: for K∈D^{≥0} with H⁰(K) f-torsion-free, the natural map Lη_fK→K. (2) BMS1 Lemma 6.11: Lη_{fg}≅Lη_f∘Lη_g. (3) BMS1 Proposition 6.12 (the integrated node bockstein-reduction) with its multiplicative form Lemma 6.13: η_f preserves differential graded algebras with f-torsion-free terms and the map to the Bockstein complex is a map of differential graded algebras. (4) BMS1 Lemma 6.14: Lη commutes with flat pullback of ringed topoi and with localisation. (5) BMS1 Lemma 6.19 on a replete topos (the integrated node preservation-derived-completeness), applied here in the topos of sets. (6) The almost-to-integral criterion CK Lemma 3.18: if each H^i(B⊗^L_{A_inf}A_inf/μ) has no nonzero W(𝔪^♭)-torsion and W(𝔪^♭) kills each H^i(Cone(b)), then Lη_μ(b) is an isomorphism. (7) The base-change lemma CK Lemma 3.24 (Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic p, Lemma 5.16): for g a nonzerodivisor, if the H^i(K⊗^L A/f) have no nonzero g-torsion then Lη_f(K)⊗^L A/g≅Lη_f(K⊗^L A/g). (8) BMS1 Lemma 7.3(ii) (CK Lemma 3.7): continuous cohomology of Z_p^d on a p-adically complete module is computed by the Koszul complex K_M(γ_1−1,…,γ_d−1), with the differential graded algebra structure of BMS1 Lemma 7.5; and CK Lemma 3.6 on completed direct sums. (9) BMS2 Proposition 5.8 (the Beilinson connective cover form of filtered décalage), for the Frobenius décalage identity. (10) BMS1 Lemma 8.11 (CK Lemma 3.4): a map M→N with kernel and cokernel killed by an ideal I induces M/M[f]≅N/N[f] when M and M/fM have no nonzero I-torsion. Finer nodes used where they exist: AI.1/decalage-filtered-colimits and AI.1/decalage-cohomology.

**Needed by.** `AInfCohomology:AI.6/structure-sheaf-edge`, `AInfCohomology:AI.6/nonintegral-annihilation`, `AInfCohomology:AI.6/local-edge`, `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/aomega-frobenius`, `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/finite-pd-base-change`, `AInfCohomology:AI.6/log-derivations`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/all-coordinates-log-crystalline`, `AInfCohomology:AI.6/crystalline-de-rham-square`, `AInfCohomology:AI.6/etale-bdr-agreement`, `AInfCohomology:AI.7/frobenius-decalage`.

### AInfCohomology:AI.2

Finitely presented Breuil–Kisin–Fargues modules in the convention of BMS1 Definition 4.22 (a finitely presented A_inf-module M with M[1/p] free and an isomorphism (φ_A^*M)[1/ξ̃]≅M[1/ξ̃]); the étale realisation M_ét=(M⊗W(C^♭))^{φ=1} with M⊗A_inf[1/μ]≅M_ét⊗A_inf[1/μ] (BMS1 Lemma 4.26); Fargues' equivalence between A_inf-free such modules and pairs (T,Ξ) with Ξ a B_dR⁺-lattice in T⊗B_dR, in the normalisation M↦(M_ét, M⊗_{A_inf}B_dR⁺) of CK §8.2 (BMS1 Theorem 4.28) — the lattice is M⊗B_dR⁺, not (φ_A^*M)⊗B_dR⁺, and the relation between the two normalisations must be stated, since another consumer asks for the second —; and the dictionary A_inf{1}↔(Z_p(1), ξ⁻¹(Z_p(1)⊗B_dR⁺)) (BMS1 Example 4.24). No classification of torsion modules is asked. Compatibility of the equivalence with tensor products, (M⊗M′)_ét=M_ét⊗M′_ét and (M⊗M′)⊗B_dR⁺=(M⊗B_dR⁺)⊗(M′⊗B_dR⁺), used for Tate twists. The G_K-equivariant form and the lattice functor of CK §§8.3–8.6 are planned in this packet (de-rham-lattice-functor).

**Needed by.** `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.6/nodal-conic`, `AInfCohomology:AI.7/bkf-tensor-functor`, `AInfCohomology:AI.7/twist-compatibility`.

### AInfCohomology:AI.3

The integral period sheaf A_inf,X on the pro-étale site of the smooth adic generic fibre and the morphism ν to the étale site of the formal model (CK (1.5.5); the stage text uses the Zariski site, CK needs the étale one); the edge maps from continuous cohomology of an affinoid perfectoid pro-(finite étale) cover to pro-étale cohomology, for Ô⁺ and for A_inf, with almost purity in the form that [𝔪^♭] kills the cohomology of their cones (Scholze, p-adic Hodge theory for rigid-analytic varieties, 4.10(v), 6.5(ii)), also for covers refining a chart tower (CK Remarks 3.10, 3.21, 3.35); the primitive comparison RΓ_ét(X,Z_p)⊗^L A_inf→RΓ_proét(X,A_inf,X) with cone killed by W(𝔪^♭) for X proper smooth over C (BMS1 Theorem 5.7; CK cites it as 5.6); the unique lift of an étale R□/p-algebra to a (p,μ)-adically complete formally étale A(R□)-algebra; and, for a chart with r=0, the toric local complex with which the semistable one is compared; derived p-completeness of the cohomology of the cones (Bhatt–Scholze, The pro-étale topology for schemes, 3.4.4 and 3.4.14); and the analogue on the presheaf site 𝔛^psh_ét of BMS1 Lemma 9.15, used in CK Corollary 4.6. The pro-étale site itself is cited by node (AdicEtaleGeometry:A1/pro-etale-site-corrected).

**Needed by.** `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/monomial-splitting`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.6/structure-sheaf-edge`, `AInfCohomology:AI.6/nonintegral-annihilation`, `AInfCohomology:AI.6/local-edge`, `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/aomega-sheaf-completeness`, `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/etale-bdr-agreement`, `AInfCohomology:AI.7/ainf-base-change`, `AInfCohomology:AI.7/choice-transport`.

### AInfCohomology:AI.4

The smooth-case comparison maps, by their BMS1 labels, each with the map it is induced by: the Hodge–Tate comparison with its generator formulas (Theorem 8.3, Proposition 8.15), the de Rham comparison with its differential (Theorem 14.1(ii)), the A_cris all-coordinates comparison (Theorem 12.1, with §12.3 for multiplicativity) and the μ-inverted étale comparison. Used (i) on the smooth locus in hodge-tate-comparison and log-de-rham and (ii) in the map-agreement statements of AI.7. Also the rings A_cris^(m) of BMS1 Lemma 12.8 with parts (i) and (ii) of that lemma and Lemma 12.2: for m≥p the systems of ideals (p^n) and {x: μx∈p^n} of A_cris^(m) are intertwined; for m≥p², μ^n/(n+1)!∈A_cris^(m) tends to 0 p-adically, so log([ε]) is defined, is a unit multiple of μ and φ(log([ε]))=p·log([ε]). The relative rings A_cris^(m)(R) and A_cris^(m)(R′_∞) and what CK prove about them are planned in this packet (finite-level-acris).

**Needed by.** `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/finite-level-acris`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.7/comparison-diagram-agreement`.

### AInfCohomology:AI.5

Generic linear algebra over A_inf (BMS1 §4.2), by label: Lemma 4.9 (a finitely presented M with M[1/p] free is perfect, has Tor-dimension ≤2 and Tor_2(M,W(k̄))=0; in particular finitely presented A_inf/p^n-modules are perfect), Proposition 4.13, Lemma 4.14 and Corollary 4.15(ii) (length inequality between M⊗W(C^♭) and M⊗W(k̄)), Lemma 4.16, Corollary 4.17 and Lemma 4.18 (freeness criteria for a perfect complex C with all H^j(C)[1/p] free), Lemma 4.19 and Corollary 4.20 (finite presentation, and freeness after inverting p, from freeness over A_inf[1/pμ] and over A_cris[1/p]). These exist as reviewed nodes of the CohomologyComparisons packet marked as supplier material owned by this stage (perfectness-and-tor-bounds-for-ainf-modules, specialization-length-inequality, witt-versus-tilt-specialization-inequality, derived-to-degreewise-witt-specialization, finite-presentation-and-freeness-criterion, mu-inverted-freeness-criterion). Also: the criterion that a derived ξ-complete, respectively (p,u)-complete, complex with perfect reduction is perfect (Stacks Project 09AW); and, extending the stage's smooth scope, the normalised length val_o of finitely presented torsion modules over a rank-one valuation ring with val_o(p)=1, its additivity (Gabber–Ramero, Almost ring theory, 6.3.1 and 6.3.5(i)) and CK Lemma 7.11. For the nodes of AI.7: the complex RΓ_Ainf(𝔛) of a smooth formal O_C-scheme as derived global sections of AΩ, with its θ specialisation map to de Rham cohomology and its comparison map with crystalline cohomology over W(k̄) (BMS1 Theorem 14.1 and its global forms), as maps; and uniqueness of the elementary divisors of a finitely generated torsion module over a discrete valuation ring.

**Needed by.** `AInfCohomology:AI.6/proper-perfectness`, `AInfCohomology:AI.6/bdr-comparison`, `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.6/freeness-criterion`, `AInfCohomology:AI.6/rank-equality`, `AInfCohomology:AI.6/crystalline-torsion`, `AInfCohomology:AI.6/de-rham-torsion`, `AInfCohomology:AI.7/de-rham-base-change`, `AInfCohomology:AI.7/crystalline-base-change`, `AInfCohomology:AI.7/perfect-cohomological-modules`, `AInfCohomology:AI.7/choice-transport`, `AInfCohomology:AI.7/comparison-diagram-agreement`, `AInfCohomology:AI.7/de-rham-torsion-divisibility`.

### AdicEtaleGeometry:A1

From Huber, Étale cohomology of rigid analytic varieties and adic spaces: 1.6.10 and 2.2.8 (the étale topology of a smooth adic space over C has a basis of affinoids with a map to a torus that is a composite of a rational embedding, a finite étale map and a rational embedding); 1.7.3 iii) (an étale map to the semistable torus chart Spa of C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q) descends to the ring of integers of a finite extension of W(k̄)[1/p] in C); 3.5.1 and 1.3.18 ii) (the adic generic fibre of 𝔛 is smooth, and proper when 𝔛 is). The pro-étale site is cited by node.

**Needed by.** `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `AInfCohomology:AI.6/bdr-comparison-map`, `AInfCohomology:AI.6/etale-comparison`.

### AdicSpacesPartII:R3

(i) For a quasi-compact quasi-separated formal scheme 𝔛 over O_C as in CK §1.5 and a locally free coherent sheaf F: RΓ(𝔛,F)[1/p]≅RΓ(X_C^ad,F^ad) (acyclicity on affinoids), hence RΓ_logdR(𝔛/O_C)⊗_{O_C}C≅RΓ_dR(X_C^ad/C); CK uses this without citation in the proof of Theorem 6.6. (ii) Adic GAGA for proper schemes over C (Scholze, p-adic Hodge theory for rigid-analytic varieties, 9.1(i)), used in CK Claim 4.15.1. (iii) Coherent cohomology of a smooth adic space over C is the same in the analytic and in the étale topology (loc. cit., 9.2(ii)), used for CK (6.2.7); if this lies outside the stage's coherent-sheaf scope it needs an owner of its own.

**Needed by.** `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `AInfCohomology:AI.6/bdr-comparison`.

### CohomologyComparisons:CP.3

For a smooth adic space X over C, the complex RΓ_crys(X/B_dR⁺) of BMS1 §13 with the facts CK uses, by label: Lemma 13.4(ii) (the rings D_n are complete strongly noetherian Tate rings), Lemma 13.11, Lemma 13.12(ii) and Lemma 13.13 (structure of D_Ψ(A), ξ-torsion-freeness and completeness, reduction modulo ξ to Ω^{•,cont}_{A/C}), Lemma 9.15 (cohomology of a presheaf of complexes on a basis). For X proper: Theorem 13.1 with the map RΓ_crys(X/B_dR⁺)→RΓ_ét(X,Z_p)⊗B_dR⁺ of its proof and the identification after inverting ξ (CK (6.7.1)); Remark 13.20 (RΓ_crys(X/B_dR⁺)≅RΓ_dR(X₀/K)⊗_KB_dR⁺ for a descent X₀ over a complete discretely valued K with perfect residue field) and its agreement with Scholze's de Rham comparison, including filtrations (CK (6.7.2)); Proposition 13.23 for a smooth model. The existing node good-reduction-bdr-lattice-identification quotes Theorem 13.1/13.19 and Remark 13.20 only as inputs for good reduction; the complex and the listed lemmas are not yet nodes. The étale-topology variant and the embeddings with non-unit coordinates of CK §§6.2–6.4 are planned in this packet (bdr-cohomology-etale-embeddings) and are not requested.

**Needed by.** `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `AInfCohomology:AI.6/bdr-comparison-map`, `AInfCohomology:AI.6/bdr-comparison`, `AInfCohomology:AI.6/etale-bdr-agreement`, `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.6/model-independent-lattice`, `AInfCohomology:AI.7/comparison-diagram-agreement`.

### CrystallineCohomology:CR.0

Ordinary divided power envelopes over (Z_p,pZ_p) with their universal property and base change (Stacks Project 07HB) and the extension of a derivation preserving the ideal to a divided power derivation (Stacks Project 07HW); A_cris^0 as the divided power envelope of A_inf→O_C/p and A_cris as its p-adic completion (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.8), also for an affinoid perfectoid R′_∞: A_cris^0(R′_∞)≅A_inf(R′_∞)[T^n/n!]/(T−ξ) (CK §5.35). Mathlib's DividedPowers and DividedPowerAlgebra do not provide envelopes.

**Needed by.** `AInfCohomology:AI.6/finite-level-acris`, `AInfCohomology:AI.6/finite-pd-base-change`, `AInfCohomology:AI.6/log-derivations`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/all-coordinates-map`.

### CrystallineCohomology:CR.5

Log crystalline cohomology for integral quasi-coherent, not necessarily fine, log structures, by label from Beilinson, On the crystalline period map (arXiv:1111.3316v4): 1.3, Theorem (existence of log PD envelopes; Kato, Logarithmic structures of Fontaine–Illusie, 5.4, for fine structures); 1.1, Exercises (iii) (unique lifting of units along log PD thickenings); §1.4, Remarks (ii) (PD smoothness of log smooth log PD thickenings and of log PD envelopes of log smooth thickenings); (1.8.1) and 1.7, Exercises (i) (the log PD de Rham complex of a PD smooth thickening computes log crystalline cohomology, Frobenius-equivariantly, and for the envelope D of a log smooth thickening P it is Ω^•_{P,log}⊗_PD); (1.11.1) (base change for fine log smooth log schemes of Cartier type, in the quasi-compact quasi-separated form of CK footnote 17), giving CK (5.24.1) and (5.43.3). From Kato, Logarithmic structures of Fontaine–Illusie: 5.5.1 (for an exact closed immersion the log PD envelope is the ordinary one) and 4.8 (Cartier type: the reduction modulo p of a semistable formal scheme over the ring of integers of a discretely valued field is fine, log smooth and of Cartier type), used in global-crystalline and hyodo-kato-interface. The log de Rham complex Ω^•_{𝔛/O_C,log} of the formal scheme with its divisorial log structure, local freeness of Ω^i_log of rank binom(d,i), finiteness of its coherent cohomology for proper 𝔛 once the finiteness theorem of gap G-GAGA is available, and the identification of Ω¹_log of a semistable curve with its relative dualizing sheaf. The cohomology computation for the nodal conic is done in the node nodal-conic and is not requested.

**Needed by.** `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/proper-perfectness`, `AInfCohomology:AI.6/log-derivations`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/log-exactification`, `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.6/all-coordinates-log-crystalline`, `AInfCohomology:AI.6/absolute-crystalline`, `AInfCohomology:AI.6/crystalline-de-rham-square`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/hyodo-kato-interface`, `AInfCohomology:AI.6/bdr-comparison`, `AInfCohomology:AI.6/model-independent-lattice`, `AInfCohomology:AI.6/nodal-conic`.

### CrystallineCohomology:CR.5:log-algebra

Prelog rings, associated log structures on the étale site, charts, integral and fine monoids and their pushouts, strict maps and exact closed immersions. From Kato, Logarithmic structures of Fontaine–Illusie: the chart criteria 3.5–3.6 for log smooth and log étale maps (applied to ℕ→ℕ^{r+1} over A_inf and to Q→P_{λ₀}), and 4.1 and 4.4 (integrality). From Kato, Toric singularities: log regularity (2.1) and Theorem 11.6 (on a log regular scheme the log structure is O∩j_*O^× for the open of triviality), used in CK Claim 1.6.1. The Claims 1.6.1 and 1.6.3 themselves are the content of divisorial-log.

**Needed by.** `AInfCohomology:AI.6/divisorial-log`, `AInfCohomology:AI.6/log-derivations`, `AInfCohomology:AI.6/log-exactification`.

### CrystallineCohomology:CR.6

Log crystalline cohomology of the special fibre over the standard log point (ℕ→W(k₀), 1↦0) with its Frobenius and monodromy, Nφ=pφN. From Beilinson, On the crystalline period map (arXiv:1111.3316v4): the base change theorem (1.11.1) in the two instances CK Remark 5.44, (5.44.1) (change of log base from Q≥0 to ℕ over W(k̄)) and base change along the map of log divided power bases W(k₀)→W(k̄) (completed in general, uncompleted for proper models), which is identification (iii) of hyodo-kato-interface: CK does not state it and uses its consequence (8.8.1), and whether (1.11.1) covers it was not checked in Beilinson's paper; 1.18, Theorem, in the form of CK Corollary 5.43 (for a proper fine log smooth log scheme of Cartier type over O/p the rational log crystalline cohomology over A_cris is finite free over A_cris[1/p]); (1.16.2) and (1.18.5) for the identification (9.2.2) of CK Proposition 9.2 over B_st⁺, with the Fontaine–Hyodo–Kato torsor and the ring A_st of CK §9.1 and the identification of A_st[1/p] with Fontaine's B_st⁺, Frobenius and monodromy included (§1.17 there); Fontaine's ring is cited by node (PadicHodgeTheory:R06.1/semistable-period-ring). The rational comparison of CK Theorem 9.5 and Remark 9.6 is not requested.

**Needed by.** `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/hyodo-kato-interface`.

### EnhancedDerivedSheaves:E4

Completed extension of scalars along a map of rings with ideals (R,I)→(S,J): K↦K⊗̂^L_RS, the derived J-completion of K⊗^L_RS, with values in derived J-complete S-modules (commutative algebra objects when K is one), its transitivity, and its agreement with the ordinary derived tensor product when K is perfect; and the completion Rlim_n(−⊗^L Z/p^n) of complexes of sheaves on a site that is not replete (CK (1.7.1)), as used for AΩ_𝔛⊗̂^L_{A_inf}A_cris on 𝔛_ét. The existing node completed-sheaf-tensor is a bifunctor over one ring on a replete topos and supplies neither.

**Needed by.** `AInfCohomology:AI.6/finite-pd-base-change`, `AInfCohomology:AI.6/absolute-crystalline`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.7/ainf-base-change`, `AInfCohomology:AI.7/de-rham-base-change`, `AInfCohomology:AI.7/crystalline-base-change`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

The category of BMS1 Definition 4.1 and BMS2 Definition 1.1: finitely generated 𝔖-modules M with an isomorphism (φ_𝔖^*M)[1/E]≅M[1/E], with BMS1 Proposition 4.3 (structure 0→M_tor→M→M_free→M̄→0 and M[1/p] finite free over 𝔖[1/p]). This widens the stage beyond its finite free Kisin modules of bounded E-height (node kisin-modules), which cannot hold torsion cohomology. Also BMS1 Theorem 4.4 in the form used by twist-compatibility: for a lattice T in a crystalline representation the module M(T) is the finite free module with a φ- and G_{K∞}-equivariant identification M(T)⊗_𝔖W(C^♭)≅T⊗W(C^♭), the tensor product being taken along f (the nodes finite-height-lattices, semistable-finite-height and PR.7/kisin-functor-comparison are cited for its ingredients). And an API item for the finite freeness of rank p of φ_𝔖 with basis 1,u,…,u^{p−1}, which is a proof step of the node bk-coefficient-rings; that node is cited where the fact is used.

**Needed by.** `AInfCohomology:AI.7/perfect-cohomological-modules`, `AInfCohomology:AI.7/bkf-tensor-functor`, `AInfCohomology:AI.7/twist-compatibility`.

### PerfectoidSpaces:P3

Almost purity in the form used by CK §5.18 and Lemma 5.37: the base change R_{Σ,Λ,∞} to R of a product of root towers is perfectoid (Scholze, Perfectoid spaces, 7.9(iii)) and is integrally closed in R_{Σ,Λ,∞}[1/p].

**Needed by.** `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/all-coordinates-map`.

### RefinedTraceMethods:RT.6

BMS2 §11 by label: relative THH, TC⁻ and TP over 𝕊[z] with their cyclotomic structure (Construction 11.5) and base change in 𝕊[z] (Lemma 11.6, Corollary 11.8); Proposition 11.10 (for O_K: π_*THH=O_K[b], π_*TC⁻=𝔖^(−1)[b,v]/(bv−E), π_*TP=𝔖^(−1)[σ^{±1}], can(b)=Eσ, can(v)=σ⁻¹, φ(b)=σ, φ(v)=φ(E)σ⁻¹; this packet writes b for the class BMS2 calls u, and u for BMS2's variable z); Proposition 11.11 (evenness on quasiregular semiperfectoid O_K-algebras and the filtrations); Corollary 11.12(1)–(4) with the absolute inputs of its proof (BMS2 Theorems 1.8 (9.6), 1.10, 1.17 and 7.2); Proposition 11.15 (the cyclotomic Frobenius extends over b-inversion; Segal input Corollary 8.18); the filtered map of Remark 11.17 with Corollary 7.10(1) and Proposition 9.10; Remark 11.14 (the complete multiplicative filtration of gr⁰TC⁻(−/𝕊[z];Z_p) coming from the homotopy fixed point spectral sequence, with gr⁰≅R, and its compatibility with the Nygaard and Hodge filtrations). Jointly with PrismaticCohomology:PR.3: the identification of π₀TP(S/𝕊[z];Z_p) with the Nygaard completion of the Frobenius twist of Δ_{S/𝔖}, compatibly with Nygaard filtrations, for quasiregular semiperfectoid quasisyntomic O_K-algebras S (BS22 Proposition 15.7, Theorem 13.1), natural in S and compatible with the base change of BMS2 Corollary 11.8.

**Needed by.** `AInfCohomology:AI.7/twisted-trace`, `AInfCohomology:AI.7/trace-descent`, `AInfCohomology:AI.7/trace-prismatic-agreement`, `AInfCohomology:AI.7/frobenius-decalage`, `AInfCohomology:AI.7/nygaard-nondescent`, `AInfCohomology:AI.7/comparison-diagram-agreement`.

## Coverage and open gaps

### AInfCohomology:AI.6 — planned

43 target nodes. Remaining:

- Supply the requested interfaces of AI.0:integral, AI.0:period-comparison, AI.1–AI.5, CR.0, CR.5, CR.5:log-algebra, CR.6, CP.3, AdicEtaleGeometry:A1, AdicSpacesPartII:R3, EnhancedDerivedSheaves:E4 and PerfectoidSpaces:P3 with their statements and proofs.

- Close the gaps G-GAGA, G-INPUTS and G-CURVE.

- Multiplicativity of the semistable log de Rham and log crystalline comparisons, and their functoriality for morphisms that are not étale, are not proved in CK and are not planned here; a consumer that needs them needs an argument in the style of BMS1 §12.3.

- Replace the omitted geometric signatures of the suggested file once the supplier types exist (G-LEAN-GEOMETRY).

### AInfCohomology:AI.7 — planned

17 target nodes. Remaining:

- Prove clause (b) of trace-prismatic-agreement and of comparison-diagram-agreement (gap G-MAPS (a), (b)), and obtain naturality in R and multiplicativity of PR.6/ainf-omega-comparison (G-MAPS (c)).

- Receive BS22 Proposition 15.7 and BMS2 §11 from RT.6 and PR.3, the module category of BMS1 Definition 4.1 from R07.4, and the requested interfaces of AI.0:integral, AI.2, AI.4, AI.5 and EnhancedDerivedSheaves:E4; close the parts of G-INPUTS used by nygaard-nondescent and perfect-cohomological-modules.

- Replace the omitted geometric signatures of the suggested file once the supplier types exist (G-LEAN-GEOMETRY); state that f(E) and g(E) generate the kernels once integral perfectoid rings are available in the library (G-LEAN-CONTINUATIONS).

### G-GAGA: Formal GAGA and coherent finiteness over a rank-one valuation ring

Three statements about a proper formal scheme over a complete rank-one valuation ring that is not noetherian. (a) CK Theorem 4.12 with Remark 4.13 (Fujiwara–Kato, Foundations of rigid geometry I, I.10.1.2): for a height-one valuation ring V complete for a nonzero nonunit a and a proper finitely presented V-scheme Y, finitely presented O_Y-modules are equivalent to compatible systems of finitely presented modules on the Y_{V/a^n}, and locally free systems algebraise to locally free modules. CK uses it once, in §4.15, to algebraise the map (4.10.3); among the nodes only hodge-tate-comparison uses it directly, and only for the identification (4.11.1). (b) The finiteness theorem for proper formal schemes over O_C (Ullrich, The direct image theorem in formal and rigid geometry, 5.3), used in CK Corollary 4.20 for proper-perfectness. (c) The comparison theorem and flat base change from O_K to O_C for coherent cohomology (EGA III 4.1.7 with limit arguments, or Fujiwara–Kato I.9.2.1), used in CK Remark 4.19 and for (8.7.4) in model-independent-lattice. CK's deductions were read; the proofs in Fujiwara–Kato and Ullrich were not. AdicSpacesPartII:F0 plans formal functions and formal GAGA for Noetherian adic rings only; the restructure entry proposes to extend it.

**Needed by.** `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/proper-perfectness`, `AInfCohomology:AI.6/model-independent-lattice`.

### G-INPUTS: External inputs with no located supplier

Named results that the proofs use and for which no stage of the atlas was found to state them. For divisorial-log and hodge-tate-comparison (CK §1.5): the algebraisation (1.5.2) of a chart and of an étale map to it over a discrete valuation subring of the integral closure of W(k̄) (Stacks Project 04D1 with limit arguments). For root-tower and structure-sheaf-edge (CK §1.5, §3.2): Gabber–Ramero, Almost ring theory, 7.1.6 (R is flat over R□ and each R⊗_{R□}R□_m is p-adically complete). For hodge-tate-comparison (CK §4.10, §4.15): the identification of (R¹ν_*Ô⁺)[1/p] with Ω¹(−1) on a smooth proper adic space over C (Scholze, Perfectoid spaces: a survey, 3.23–3.24); the extension of a vector bundle across a closed subset of codimension ≥2 over a non-noetherian valuation base (EGA IV₂ 5.10.5 with limit arguments); the existence of a proper flat compactification of the chart with Zariski-local semistable coordinates. For global-crystalline (CK, proof of Corollary 5.43): the descent of 𝔛_{O_C/p} to a quasi-compact quasi-separated fine log smooth log scheme of Cartier type over O/p, proper when 𝔛 is, for the ring of integers O of a finite extension of W(k̄)[1/p] in C; CK says only that limit arguments give it. For hyodo-kato-interface: base change of log crystalline cohomology of a fine, log smooth log scheme of Cartier type along W(k₀)→W(k̄) (identification (iii) of the node), which CK does not state; it is requested from CR.6, and whether Beilinson's (1.11.1) covers it was not checked. For local-crystalline and aomega-sheaf-completeness (CK, proofs of Proposition 5.13 and Corollary 4.6): acyclicity of quasi-coherent sheaves on an affine formal scheme (Fujiwara–Kato I.1.1.23(2)). For bdr-cohomology-etale-embeddings and bdr-comparison-map (CK §§6.3–6.5): the reduced fibre theorem (Stacks Project 09IL), Raynaud–Gruson I.3.3.5 (freeness of A₀ over O), Gabber–Ramero, Almost ring theory, 7.3.15 (power-bounded elements of a nilpotent thickening) and, for bdr-comparison-map, the descent (1.5.2) of the charts. For de-rham-lattice-functor and model-independent-lattice (CK §8.5, (8.7.4)): the theorems of Ax–Sen–Tate (C^{G_K}=K, hence (O_C)^{G_K}=O_K) and of Tate and Sen ((C(η))^{G_K}=0 for a character η with infinite image on inertia) are cited from PadicHodgeTheory:R06.1/ax-sen-tate-invariants and R06.1/tate-sen-theorem, which state them for K finite over Q_p; CK's K is any complete discretely valued field with perfect residue field, and that generality is the gap. Also the formalism of de Rham representations of G_K (D_dR(V)=(V⊗B_dR)^{G_K}, injectivity of D_dR(V)⊗_KB_dR→V⊗B_dR, compatibility with tensor products, duals and finite extensions), which CK uses without reference; and the G_K-equivariant identification H^i_ét(X_{K̄},Z_p)≅H^i_ét(X_C,Z_p) for X proper smooth over K. For crystalline-torsion and de-rham-torsion (second inequalities of CK Theorems 7.9 and 7.12): RΓ_ét(X_C^ad,Z_p)⊗^L Z/p^n≅RΓ_ét(X_C^ad,Z/p^n) and the analogous base change of log crystalline and log de Rham cohomology to W_n(k̄) and O_C/p^n, for which CK cites only the universal coefficient sequences. For nygaard-nondescent (the worked example): the j-invariant of a Weierstrass curve and its invariance under base change, and the algebraisation of a smooth proper formal curve of genus one over ℤ_p. For perfect-cohomological-modules: finiteness of the coherent cohomology of a proper scheme over a field (EGA III 3.2.1), hence of its de Rham cohomology.

**Needed by.** `AInfCohomology:AI.6/divisorial-log`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/structure-sheaf-edge`, `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/aomega-sheaf-completeness`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/hyodo-kato-interface`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `AInfCohomology:AI.6/bdr-comparison-map`, `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.6/model-independent-lattice`, `AInfCohomology:AI.6/crystalline-torsion`, `AInfCohomology:AI.6/de-rham-torsion`, `AInfCohomology:AI.7/nygaard-nondescent`, `AInfCohomology:AI.7/perfect-cohomological-modules`.

### G-CURVE: Coherent cohomology of the nodal conic

The node nodal-conic computes the log de Rham groups O_K, 0, O_K of the completed conic XY=πZ² from H⁰(O)=O_K, H¹(O)=0, H⁰(ω)=0, H¹(ω)≅O_K, where ω=Ω¹_log is the relative dualizing sheaf. The computation is written out in the node; its inputs — Čech cohomology of O and ω on the two-chart cover of the special fibre, cohomology and base change for the proper flat curve, and the identification of Ω¹_log with the dualizing sheaf (requested from CR.5) — have no supplier node yet, so the example is not certified.

**Needed by.** `AInfCohomology:AI.6/nodal-conic`.

### G-MAPS: Relative trace comparison and agreement of comparison maps

(a) The equivalence between BMS2's trace-theoretic Breuil–Kisin complex and Δ_{R/𝔖} is stated in BS22 (Example 1.9(3), §15.2 with Proposition 15.7) with a sketch of proof; trace-prismatic-agreement proves it from BS22 Proposition 15.7, which is requested from RT.6 and PR.3. Its compatibility with the three specialisation maps (A_inf, de Rham, crystalline) is stated in no source and is to be proved in this stage. (b) The agreement of the crystalline (A_cris), étale and B_dR⁺ comparison maps of AI.4–AI.5 with those induced from the prismatic side is stated in no source: BS22 Theorem 18.2 applies to symmetric monoidal functors on all p-completely smooth O_C-algebras over a perfect prism, hence neither over the non-perfect prism (A_cris,(p)) nor to functors defined only on smooth O_K-algebras; each agreement has to be checked on explicit generators. (c) The supplier node PrismaticCohomology:PR.6/ainf-omega-comparison is used with its multiplicativity and its naturality in R; both are open points of that node's own review (the source asserts multiplicativity in BS22 Remark 17.3 without proof, and the comparison map is shown natural only for maps injective on the chosen units).

**Needed by.** `AInfCohomology:AI.7/trace-prismatic-agreement`, `AInfCohomology:AI.7/comparison-diagram-agreement`, `AInfCohomology:AI.7/ainf-base-change`.

### G-LEAN-GEOMETRY: Geometric signatures not stated in the suggested file

The pinned libraries have no formal schemes, no log structures, no pro-étale site of an adic space, no derived categories of sheaves with décalage, and no relative topological Hochschild homology; the earlier stages AI.0–AI.5 of this roadmap, which will define A_inf,X and AΩ in the smooth case, have no suggested file yet. The suggested file therefore records each of these declarations, with its API and tests, in a named inventory instead of a signature over invented carriers. For three of the listed nodes (root-tower, nygaard-nondescent, de-rham-torsion-divisibility) only an algebraic core is stated in Lean; their geometric statements (the completed tower with its group action, the non-descent of the filtration, the divisibility theorem) are in the inventory.

**Needed by.** `AInfCohomology:AI.6/divisorial-log`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/monomial-splitting`, `AInfCohomology:AI.6/ainf-chart-lift`, `AInfCohomology:AI.6/structure-sheaf-edge`, `AInfCohomology:AI.6/nonintegral-annihilation`, `AInfCohomology:AI.6/local-edge`, `AInfCohomology:AI.6/aomega`, `AInfCohomology:AI.6/aomega-frobenius`, `AInfCohomology:AI.6/hodge-tate-comparison`, `AInfCohomology:AI.6/aomega-sheaf-completeness`, `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/proper-perfectness`, `AInfCohomology:AI.6/finite-level-acris`, `AInfCohomology:AI.6/finite-pd-base-change`, `AInfCohomology:AI.6/local-crystalline`, `AInfCohomology:AI.6/all-coordinates`, `AInfCohomology:AI.6/log-exactification`, `AInfCohomology:AI.6/all-coordinates-pd`, `AInfCohomology:AI.6/all-coordinates-aomega`, `AInfCohomology:AI.6/all-coordinates-log-crystalline`, `AInfCohomology:AI.6/all-coordinates-map`, `AInfCohomology:AI.6/absolute-crystalline`, `AInfCohomology:AI.6/crystalline-de-rham-square`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/hyodo-kato-interface`, `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`, `AInfCohomology:AI.6/bdr-comparison-map`, `AInfCohomology:AI.6/bdr-comparison`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/etale-bdr-agreement`, `AInfCohomology:AI.6/cohomological-bkf`, `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.6/freeness-criterion`, `AInfCohomology:AI.6/rank-equality`, `AInfCohomology:AI.6/crystalline-torsion`, `AInfCohomology:AI.6/de-rham-torsion`, `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.6/model-independent-lattice`, `AInfCohomology:AI.6/nodal-conic`, `AInfCohomology:AI.7/flat-coefficient-extension`, `AInfCohomology:AI.7/cohomology`, `AInfCohomology:AI.7/twisted-trace`, `AInfCohomology:AI.7/trace-descent`, `AInfCohomology:AI.7/trace-prismatic-agreement`, `AInfCohomology:AI.7/ainf-base-change`, `AInfCohomology:AI.7/de-rham-base-change`, `AInfCohomology:AI.7/crystalline-base-change`, `AInfCohomology:AI.7/perfect-cohomological-modules`, `AInfCohomology:AI.7/bkf-tensor-functor`, `AInfCohomology:AI.7/twist-compatibility`, `AInfCohomology:AI.7/frobenius-decalage`, `AInfCohomology:AI.7/nygaard-nondescent`, `AInfCohomology:AI.7/choice-transport`, `AInfCohomology:AI.7/comparison-diagram-agreement`, `AInfCohomology:AI.7/de-rham-torsion-divisibility`.

### G-LEAN-CONTINUATIONS: Continuations of the algebraic prototypes

Typed in the suggested file at the pinned Mathlib: the chart quotient, its p-adic completion and its universal property; the monomial indices with their transition, exact level and Δ-weights; the polynomial log derivations, their action on monomials and their descent to the chart quotient; the levels and transition maps of the root tower before completion, with the non-flatness test; the coefficient maps f, g, θ̃_𝔖, θ_𝔖 and c with the squares θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖, stated with Mathlib's fontaineTheta and PreTilt, and the membership of g(E) and f(E) in the kernels; the algebra of the two arithmetic examples of AI.7. Not typed: the dual basis property of the derivations and their extension to A(R) and to the divided power envelopes (it needs the formally étale lift and CR.5); the completed tower R_∞ with the action of Δ; the construction of g and θ̃_𝔖 (evaluation of a power series at a topologically nilpotent element; the pinned Mathlib has no topology on these rings, so the two maps are declared by their values on generators and their uniqueness); and the statement that f(E) and g(E) generate ker θ̃_A and ker θ_A (Mathlib has no integral perfectoid rings, and the principality of ker θ is not in the library at the pin).

**Needed by.** `AInfCohomology:AI.6/chart-ring`, `AInfCohomology:AI.6/root-tower`, `AInfCohomology:AI.6/monomial-exponents`, `AInfCohomology:AI.6/log-derivations`, `AInfCohomology:AI.7/coefficient-normalization`, `AInfCohomology:AI.7/nygaard-nondescent`, `AInfCohomology:AI.7/de-rham-torsion-divisibility`.

## Baseline and library audit

Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`. The 34 baseline entries provide primitives and the explicitly stated algebraic interfaces. They do not implement the geometric nodes. `DerivedCategory`, `DividedPowers` and `DividedPowerAlgebra` record existing notions whose interfaces are insufficient for the enhanced comparisons and universal envelopes.

- `mathlib:MvPolynomial` (`Mathlib/Algebra/MvPolynomial/Basic.lean`): For a commutative semiring R, multivariate polynomials indexed by σ are AddMonoidAlgebra R (σ→₀ℕ); used for the actual chart quotient.

- `mathlib:Ideal.Quotient.mk` (`Mathlib/RingTheory/Ideal/Quotient/Defs.lean`): Canonical ring homomorphism R→R/I for a commutative ring; the chart uses the ideal generated by its explicit equations.

- `mathlib:AdicCompletion` (`Mathlib/RingTheory/AdicCompletion/Basic.lean`): Compatible inverse-limit families in M/(I^n·M). This is ordinary module completion, not derived completion. For the principal ideal (p) it gives the chart completion.

- `mathlib:AdicCompletion.evalₐ` (`Mathlib/RingTheory/AdicCompletion/Algebra.lean`): For a commutative ring R and ideal I, the canonical R-algebra map AdicCompletion I R→R/I^n.

- `mathlib:Finset.max'` (`Mathlib/Data/Finset/Max.lean`): Maximum of a nonempty finite set in a linear order. The declaration is tagged @[to_dual], which generates Finset.min' (the minimum, with its own docstring at lines 131–134 of the same file); monomial-exponents uses that generated declaration for min_i a_i. The declaration index lists only names written in the source, so the generated name Finset.min' cannot be cited directly; this entry cites the declaration that generates it.

- `mathlib:MvPolynomial.pderiv` (`Mathlib/Algebra/MvPolynomial/PDeriv.lean`): Bundled R-derivation ∂_i of MvPolynomial σ R. Weighted linear combinations give the semistable logarithmic chart derivations.

- `mathlib:PowerSeries` (`Mathlib/RingTheory/PowerSeries/Basic.lean`): Univariate power series as MvPowerSeries Unit R; the existing R07.4 coefficient ring uses this carrier.

- `mathlib:PowerSeries.map` (`Mathlib/RingTheory/PowerSeries/Basic.lean`): A coefficient ring homomorphism R→S induces a ring homomorphism R[[X]]→S[[X]], acting coefficientwise.

- `mathlib:PowerSeries.substAlgHom` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`): For an R-algebra S and a substitutable series a, substitution gives R[[X]]→ₐ[R]MvPowerSeries τ S; X^p is substitutable for p≠0.

- `mathlib:PowerSeries.constantCoeff` (`Mathlib/RingTheory/PowerSeries/Basic.lean`): Constant coefficient R[[X]]→+*R; its composite with Witt Frobenius is the normalized crystalline coefficient map.

- `mathlib:WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean`): The p-typical Witt-vector carrier with coefficients ℕ→R. Its ring structure and period-ring applications are imported, not reconstructed.

- `mathlib:WittVector.frobenius` (`Mathlib/RingTheory/WittVector/Frobenius.lean`): Under Fact p.Prime, Witt-vector Frobenius is a bundled ring endomorphism; the perfect-field specialization is used in the coefficient normalization.

- `mathlib:DerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`): For an abelian category with a chosen localization, the ordinary unbounded derived category of cochain complexes. This does not supply the E∞, derived tensor or completion interfaces required here.

- `mathlib:DividedPowers` (`Mathlib/RingTheory/DividedPowers/Basic.lean`): A divided power structure on an ideal, with null/zero/one/membership/addition/multiplication/composition axioms. This is not a universal completed PD envelope.

- `mathlib:DividedPowerAlgebra` (`Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): The ring-congruence quotient of MvPolynomial (ℕ×M) R for the universal divided-power algebra relations; it is not a PD envelope of a closed immersion.

- `mathlib:AdicCompletion.evalₐ_of` (`Mathlib/RingTheory/AdicCompletion/Algebra.lean`): evalₐ I n (of I R x) = Ideal.Quotient.mk _ x: the projection of the completion to R/I^n restricted to R is the quotient map. The API item Semistable.chartRing.reduction is this library lemma for the chart quotient.

- `mathlib:AdicCompletion.liftRingHom` (`Mathlib/RingTheory/AdicCompletion/Algebra.lean`): A compatible family of ring maps R →+* S ⧸ I^n lifts to R →+* AdicCompletion I S: the completed half of the chart universal property.

- `mathlib:IsAdicComplete.liftRingHom` (`Mathlib/RingTheory/AdicCompletion/RingHom.lean`): For an I-adically complete commutative ring S, a compatible family R →+* S ⧸ I^n lifts to R →+* S.

- `mathlib:AdicCompletion.isAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Completeness.lean`): AdicCompletion I M is I-adically complete when I is finitely generated; applied to the principal ideal (p) it shows that the chart ring is p-adically complete.

- `mathlib:PowerSeries.expand` (`Mathlib/RingTheory/PowerSeries/Expand.lean`): For p ≠ 0 the R-algebra endomorphism f(X) ↦ f(X^p) of R⟦X⟧, with expand_apply (it is subst (X^p)) and coeff_expand. This is the substitution half of φ_𝔖.

- `mathlib:PowerSeries.HasSubst.X_pow` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`): For n ≠ 0 the series X^n is substitutable; the hypothesis of substAlgHom used for u ↦ u^p.

- `mathlib:PowerSeries.coeff_subst_X_pow` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`): coeff n (subst (X^k) f) = if k ∣ n then algebraMap R S (coeff (n/k) f) else 0 for k ≠ 0: the coefficient formula of the API item coefficientNormalization.frobenius.

- `mathlib:PowerSeries.constantCoeff_subst_X_pow` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`): constantCoeff (subst (X^k) f) = algebraMap R S (constantCoeff f) for k ≠ 0: gives c∘φ_𝔖 = φ_W∘c.

- `mathlib:PowerSeries.substAlgHom_X` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`): substAlgHom ha X = a: the value of the substitution on the variable.

- `mathlib:WittVector.frobeniusEquiv` (`Mathlib/RingTheory/WittVector/Frobenius.lean`): For a perfect ring R of characteristic p, the Witt vector Frobenius as a ring automorphism of 𝕎 R; supplies φ_A⁻¹ in θ̃ = θ∘φ_A⁻¹ on A_inf = 𝕎(O_C^♭).

- `mathlib:WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean`): For a commutative ring R that is p-adically complete with p not a unit, Fontaine's map θ : 𝕎(PreTilt R p) →+* R, with fontaineTheta_teichmuller (θ([x]) = untilt x). The carrier of A_inf and θ; the suggested file states the θ-squares of the coefficient maps with it. That ker θ is principal is not in Mathlib at the pin.

- `mathlib:PreTilt` (`Mathlib/RingTheory/Perfection.lean`): PreTilt O p is the perfection of O/p: the tilt O^♭ as a perfect ring of characteristic p.

- `mathlib:PreTilt.untilt` (`Mathlib/RingTheory/Perfectoid/Untilt.lean`): The multiplicative map x ↦ x^♯ from PreTilt O p to a p-adically complete ring O; π = (π^♭)^♯.

- `mathlib:WittVector.teichmuller` (`Mathlib/RingTheory/WittVector/Teichmuller.lean`): The Teichmüller lift R →* 𝕎 R; [π^♭] and [ε] are values of it.

- `mathlib:WittVector.map` (`Mathlib/RingTheory/WittVector/Basic.lean`): A ring homomorphism f : R →+* S induces 𝕎 R →+* 𝕎 S coefficientwise; gives W(k₀) → A_inf from k₀ → O_C^♭.

- `mathlib:Module.FaithfullyFlat.zero_iff_lTensor_zero` (`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`): For a faithfully flat R-module M a linear map f is zero iff M ⊗ f is zero; with lTensor_bijective_iff_bijective in the same file this is the module-level detection used after extension along 𝔖 → A_inf.

- `mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective` (`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`): For a faithfully flat R-module M, M ⊗ f is bijective iff f is.

- `mathlib:Module.equiv_free_prod_directSum` (`Mathlib/Algebra/Module/PID.lean`): Structure theorem: a finitely generated module over a principal ideal domain is isomorphic to the product of a free module and a direct sum of modules R ⧸ (p_i^{e_i}) with p_i irreducible. Applied to ℤ_p and to O_K in the torsion divisibility constraint.

- `mathlib:Module.equiv_directSum_of_isTorsion` (`Mathlib/Algebra/Module/PID.lean`): A finitely generated torsion module over a principal ideal domain is a direct sum of modules R ⧸ (p_i^{e_i}) with p_i irreducible; the structure theorem behind the torsion divisibility constraint over ℤ_p and O_K.

data/library-coverage.json contains no entry for AInfCohomology at this checkout; there is consequently no accepted AInf audit to cite.

AUDIT-35 has no accepted review and was used only to locate searches.

Read the exact Mathlib sources at 082e2d3. Searched TauCeti at f790474 by declaration patterns, ring/cohomology keywords and relevant filenames; no formal-scheme, logarithmic cohomology, prismatic or relative THH implementation supplies these targets. Ordinary derived categories, Witt vectors, divided power algebra and ordinary adic completion are present; they do not supply the enhanced comparisons. Checked again by the review REV-AInfCohomology--AI.6 at the same commits: every baseline declaration was read in its source file. Present at the pin and now cited: Fontaine's θ on 𝕎(PreTilt R p) (WittVector.fontaineTheta), PreTilt and PreTilt.untilt, WittVector.teichmuller, WittVector.map, WittVector.frobeniusEquiv, the universal property of adic completion (AdicCompletion.liftRingHom, IsAdicComplete.liftRingHom), PowerSeries.expand and the faithfully flat detection lemmas. Also present, owned by suppliers: BDeRhamPlus (Mathlib/RingTheory/Perfectoid/BDeRham.lean), the divided power structure on (p)⊂ℤ_p (PadicInt.dividedPowers), continuous group cohomology and restricted power series. Absent from both libraries: formal schemes, log structures, perfectoid rings as a class, the pro-étale site of an adic space, derived completion and décalage, Koszul complexes, divided power envelopes, Fitting ideals, δ-rings and prisms, topological Hochschild homology.

## Stage links and structure

- `CohomologyComparisons:CP.3` → `AInfCohomology:AI.6`: CK §6.5 and Theorem 6.6 compare the log crystalline cohomology of the semistable model with the B_dR⁺-cohomology of the smooth generic fibre of BMS1 §13, which CP.3 constructs; AI.6 adds the étale-topology variant and the embeddings with non-unit coordinates of CK §§6.2–6.4.

- `AInfCohomology:AI.6` → `CohomologyComparisons:CP.4`: CK §9 rational semistable assembly imports the AI.6 A_cris/HK/étale/B_dR maps.

- `AInfCohomology:AI.6` → `CohomologyComparisons:CP.5`: CP.5 imports the torsion inequalities and the adjacent-degree model-independent lattice theorem.

### Formal GAGA and finiteness over rank-one valuation rings belong with AdicSpacesPartII:F0

CK Theorem 4.12 (formal GAGA over a complete rank-one valuation ring, after Fujiwara–Kato), the finiteness theorem for proper formal schemes over O_C and the comparison theorem used in CK Remark 4.19 are needed by hodge-tate-comparison, proper-perfectness and model-independent-lattice (gap G-GAGA). The proposed roadmap AdicSpacesPartII already continues the Tau Ceti roadmap AdicSpaces, and its layer F0 plans formal functions and formal GAGA for Noetherian adic rings only. A separate new roadmap is not needed.

Extend AdicSpacesPartII:F0, or add a layer directly after it, by the case of a complete rank-one valuation ring: Fujiwara–Kato, Foundations of rigid geometry I, I.9.2.1 (comparison), I.10.1.2 (existence, with local freeness as in CK Remark 4.13) and the finiteness theorem (Ullrich 5.3). The three AI.6 nodes then take that layer as a prerequisite and G-GAGA closes. No Tau Ceti roadmap changes.

### Sub-layers of AInfCohomology:AI.6 for reading

AI.6 has 43 declarations, too many to read as one layer. The stage id and its scope are unchanged; the grouping is for display only.

Three sub-layers of AInfCohomology:AI.6: 'Local semistable AΩ' (chart-ring, divisorial-log, root-tower, monomial-exponents, monomial-splitting, ainf-chart-lift, structure-sheaf-edge, nonintegral-annihilation, local-edge, aomega, aomega-frobenius, hodge-tate-comparison, aomega-sheaf-completeness, log-de-rham, proper-perfectness, etale-comparison); 'Log PD and crystalline maps' (finite-level-acris, finite-pd-base-change, log-derivations, local-crystalline, all-coordinates, log-exactification, all-coordinates-pd, all-coordinates-aomega, all-coordinates-log-crystalline, all-coordinates-map, absolute-crystalline, crystalline-de-rham-square, global-crystalline, hyodo-kato-interface); 'Proper torsion and arithmetic lattices' (bdr-cohomology-etale-embeddings, bdr-comparison-map, bdr-comparison, etale-bdr-agreement, cohomological-bkf, degreewise-specializations, freeness-criterion, rank-equality, crystalline-torsion, de-rham-torsion, de-rham-lattice-functor, model-independent-lattice, nodal-conic).

The two proposals above are requests to the maintainer, not applied atlas edits. Existing stage ids and all 60 node ids are retained.

**Upstream note (`tauceti:TauCetiRoadmap/AdicSpaces`).** CK Theorem 4.12 (formal GAGA over a rank-one valuation ring, after Fujiwara–Kato) and the finiteness theorem for proper formal schemes over O_C (Ullrich) lie beyond the elementary geometry of the AdicSpaces roadmap. Nothing of that roadmap is re-planned here; the need is recorded as the gap G-GAGA and as a proposal to extend the layer AdicSpacesPartII:F0 of the proposed roadmap that already continues AdicSpaces.

## Sources and versions

Results and proof outlines above are stated in the plan’s own words, with theorem, section, equation and page locators. Bibliographic reading records in the packet describe the original planning and independent review; this revision synchronizes their corrected register. It does not claim a new full reading of every cited supplier or source. CK findings are scoped to arXiv v3; the published CK version was unavailable to the review.

- **CK**: Kęstutis Česnavičius and Teruhisa Koshikawa, [The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145v3). arXiv:1710.06145v3, 4 October 2018; paper pagination 1–78. Packet source accessed 2026-10-06; SHA-256 `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57`.

- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00102-z.pdf). Published, Publications Mathématiques de l’IHÉS 128 (2018), 219–397; DOI 10.1007/s10240-019-00102-z. Packet source accessed 2026-10-06; SHA-256 `a924d36c8ef92888d9739011f8cc6675f846544c88edb9f670c7ecf2052702bb`.

- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf). Published, Publications Mathématiques de l’IHÉS 129 (2019), 199–310; DOI 10.1007/s10240-019-00106-9. Packet source accessed 2026-10-06; SHA-256 `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.

- **BS22**: Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4). arXiv:1905.08229v4, 12 January 2022; §18 paper pp.122–123. Packet source accessed 2026-10-06; SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

## Source issues

The corrected packet records 14 confirmed findings: 11 misprints and three proof gaps. Their independent-review verdicts are retained. A confirmed source gap is distinct from an unresolved roadmap gap; the register gives the repaired arguments. Searches and version scope are recorded in the packet. No author contact is part of this job.

### AInfCohomology/E-AI6-1 — misprint

BMS1, Published §4.4 opening, p.280, immediately before Lemma 4.30. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source equips S = W(k)[[T]] with ϕ, described as a Frobenius automorphism.

**Correction.** Frobenius endomorphism of 𝔖=W(k)[[T]]: the Witt vector Frobenius on W(k) and T↦T^p (BMS1 writes T for the variable this packet calls u).

**Reason.** The image of ϕ lies in W(k)[[T^p]], so T is not in it and ϕ is not surjective. BMS1 §4.1 (p.262) specifies Witt Frobenius on the coefficients and T↦T^p, and BMS2 Notation 11.1 calls it an endomorphism; nothing in §4.4 uses surjectivity.

### AInfCohomology/E-AI6-2 — misprint

BMS2, Published proof of Theorem 11.2, p.306, first defining display. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source uses gr0 (TC− (A;Zp)[1/u]) and cites Proposition 11.15.

**Correction.** Use relative TC⁻(A/𝕊[z];Z_p) in the Bott-inverted gr⁰ definition.

**Reason.** The referenced Proposition 11.15 is relative, and both the following Frobenius composite and the 𝔖-module structure require the same relative spectrum; absolute TC⁻ cannot supply that base.

### AInfCohomology/E-AI6-3 — misprint

CK, §6.3, sentence citing [BMS18, 13.4 (ii)] after the definition of D_{Ψ,Ξ,n}(A), p.62, arXiv:1710.06145v3. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source takes the image of (A_inf/ξ^n)⟨(X_u^{±1})_{u∈Σ},(X_a)_{a∈Ξ}⟩ as a ring of definition, assigning it the p-adic topology.

**Correction.** (A_inf/ξⁿ)⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩: the first family is indexed by Ψ, not by Σ.

**Reason.** The ring concerned is D_{Ψ,Ξ,n}(A), defined two lines earlier as a quotient of B_dR⁺⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩; Σ is the index set of the formal torus of §5.17 and does not occur in §6.3. In the typeset text the expression is (A_inf/ξⁿ)⟨(X_u^{±1})_{u∈Σ},(X_a)_{a∈Ξ}⟩; the text extraction drops the angle brackets.

### AInfCohomology/E-AI6-4 — misprint

CK, §6.3, footnote 18, p.61, arXiv:1710.06145v3. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source chooses A⁺ := W̄(k)[T_1,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r − p^q).

**Correction.** A⁺ := W̄(k)[T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r−p^q), where W̄(k) is W(k) with an overline as in the typeset text: the variable T_0 is missing from the list.

**Reason.** The relation T_0⋯T_r−p^q involves T_0, and the chart (6.3.1) on the same page has the variables T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}. The overline on W(k) is lost in the text extraction.

### AInfCohomology/E-AI6-5 — misprint

CK, §7.2, sentence introducing (7.2.1), p.68, arXiv:1710.06145v3. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source attributes the subsequent identifications to (2.3), (4.18.1), and (5.43.2).

**Correction.** Cite displays (2.3.1), (4.18.1), and (5.43.2).

**Reason.** The paper has no display numbered (2.3); the étale identification in the first line of (7.2.1) is display (2.3.1) of Theorem 2.3.

### AInfCohomology/E-AI6-6 — misprint

CK, Question 7.13, p.72, arXiv:1710.06145v3. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** val_{W(k)}(H^i_logcris(𝔛/W(k))_tors) ≠ val_{O_C}(H^i_logdR(𝔛/O_C)_tors)?

**Correction.** val_{W(k)}(H^i_logcris(𝔛_k/W(k))_tors) ≠ val_{O_C}(H^i_logdR(𝔛/O_C)_tors): the special fibre 𝔛_k, not 𝔛.

**Reason.** Logarithmic crystalline cohomology over W(k) is that of the special fibre 𝔛_k everywhere else in §7 ((7.2.1), (7.6.4), (7.8.1), (7.9.1)), and the question is prompted by (7.8.1) and Theorems 7.9 and 7.12. The text extraction also misrenders the inequality symbol.

### AInfCohomology/E-AI6-7 — misprint

CK, Proof of Proposition 3.33, first line of p.24, arXiv:1710.06145v3. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source asserts that A_inf is flat over Z[[T]].

**Correction.** Flatness should be over Z_p[[T]].

**Reason.** The morphism just defined is Z_p[[T]]→A_inf, T↦[ε]^{1/p^j}−1 (last line of p.23), and the flatness meant is the one invoked in the proof of Proposition 3.29 (p.21: by [BMS18, 4.31], A_inf is a faithfully flat Z_p[[T]]-algebra); the next sentence again writes Z_p[[T]]. The subscript p is missing in the PDF itself (checked on PDF p.24), not only in the extracted text.

### AInfCohomology/E-AI6-8 — misprint

CK, §4.15 (proof of Theorem 4.11), p.30, arXiv:1710.06145v3. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source invokes Theorem 4.12 to algebraize (4.10.3), obtaining the O_𝒳-module map f: Ω¹_{𝒳/O_C}{−1} → ℋ.

**Correction.** 𝒳 should be its base change 𝒳_{O_C} throughout the algebraisation step: f is a map of O_{𝒳_{O_C}}-modules Ω¹_{𝒳_{O_C}/O_C}{−1}→ℋ on 𝒳_{O_C}, and likewise in (4.15.2) and in the extension across the non-smooth locus.

**Reason.** 𝒳 is introduced on p.29 as a proper flat scheme over the integral closure of W(k), which is not p-adically complete; Theorem 4.12 requires a proper finitely presented scheme over an a-adically complete valuation ring, and Ω¹_{𝒳/O_C} has no meaning for a scheme that is not over O_C. Remark 4.19 (p.31) writes 𝒳_{O_C} for the same object. Checked on PDF p.30. The intended meaning is clear and the argument is unaffected.

### AInfCohomology/E-AI6-9 — misprint

BS22, §15.2, last paragraph, p.105 (arXiv:1905.08229v4). Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source refers to [BMS19, Proposition 11.5].

**Correction.** Refer to BMS2 Proposition 11.15 together with the proof of Theorem 11.2.

**Reason.** BS22 identifies its construction with the BMS2 definition of RΓ_𝔖(X) through the Nygaard filtration on the higher homotopy groups of TC⁻. In BMS2 that definition is Proposition 11.15 (the u-inverted gr⁰TC⁻(−/𝕊[z]; Z_p), p.305) together with the proof of Theorem 11.2 (p.306). BMS2 Construction 11.5, p.300, constructs the cyclotomic structure on relative THH: it is not a proposition and does not define RΓ_𝔖.

### AInfCohomology/E-AI6-10 — misprint

BMS2, Notation 11.1, p.298 (the same wording in the abstract and in §1, p.199). Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source takes K to be an extension of Qp with a discrete valuation and perfect residue field k.

**Correction.** Add completeness to the hypotheses on the discretely valued field K/Q_p with perfect residue field k.

**Reason.** The next sentence uses a surjection θ̃ : W(k)[[z]] → O_K, which requires O_K to be p-adically complete and to contain W(k): the maximal unramified extension of Q_p is a discretely valued extension of Q_p with perfect residue field whose ring of integers does not contain W(F̄_p). BMS1 §4.1 and BS22 Example 1.3(3) explicitly require completeness.

### AInfCohomology/E-AI6-11 — misprint

BMS1, §4.1, paragraph before Theorem 4.4, p.265. Review verdict: **confirmed**; affects nothing; correction status `new`.

**Finding.** The source sends T to [π^♭]^p in a map 𝔖 → A_inf. It declares the square with 𝔖 → O on top and A_inf → O_C below to commute, with θ̃ labeling each horizontal arrow.

**Correction.** Specify Witt Frobenius on W(k) alongside T↦[π^♭]^p for the map 𝔖→A_inf.

**Reason.** The diagram following the map has θ̃ : 𝔖 → O on top and θ̃ : A_inf → O_C below, and is asserted to commute. On A_inf, θ̃ = θ∘φ^{-1}; for a ∈ W(k) a W(k)-linear map would give θ̃(a) = φ^{-1}(a), which differs from a unless k = F_p, so the square commutes only for the map that is the Frobenius on W(k). The action on W(k) is not specified on p.265; §4.4, pp.280–281, does specify Witt Frobenius on coefficients together with T↦[π^♭]^p.

### AInfCohomology/E-AI6-12 — gap

CK, Proof of Theorem 3.9, p.13 (with Lemma 3.4, p.11), arXiv:1710.06145v3. Review verdict: **confirmed**; affects the proof; correction status `new`.

**Finding.** The source uses the trivial action of Δ on R and Lemma 3.7 to identify the last quotient as a finite direct sum of R-copies. Proposition 3.8 is then invoked to exclude nonzero 𝔪-torsion, and Lemma 3.4 is claimed to apply to the maps and yield the conclusion.

**Correction.** Lemma 3.4 (BMS1 Lemma 8.11(i)) requires that M and M/(ζ_p−1)M have no nonzero 𝔪-torsion, for M=H^i_cont(Δ,R_∞); the proof checks M and the quotient M/M[ζ_p−1], which is a different module. The required statement holds: R_∞ has no (ζ_p−1)-torsion, so M/(ζ_p−1)M injects into H^i_cont(Δ,R_∞/(ζ_p−1)), which has no nonzero 𝔪-torsion by the case b=ζ_p−1 of Proposition 3.8.

**Reason.** For M=H^i_cont(Δ,R)⊕H^i_cont(Δ,M_∞) the quotient M/M[ζ_p−1] is the image of the first summand, whereas M/(ζ_p−1)M is H^i_cont(Δ,R)/(ζ_p−1) plus the whole second summand; a module without 𝔪-torsion always has M/M[f] without 𝔪-torsion, so the check made is not the hypothesis of the lemma. The theorem is correct.

### AInfCohomology/E-AI6-13 — gap

BMS2, Remark 11.16, p.307 (Publ. math. IHÉS 129). Review verdict: **confirmed**; affects the proof; correction status `new`.

**Finding.** The source claims globalization would give canonical descent of every smooth formal scheme X/O_K to W(k)[π^p] ⊂ O_K, the θ-image of 𝔖 → O_K. It calls this impossible, citing as a counterexample elliptic curves having good reduction and j invariant in O_K − W(k)[π^p].

**Correction.** A descent along φ of the projection for A=O_K is a quotient 𝔖/J with φ(J)𝔖=(E). If no such J exists, which is so whenever p does not divide the degree e of E (in particular for K unramified, where moreover W(k)[π^p]=O_K and no elliptic curve as described exists), there is no descent already for A=O_K, for a different reason. If it exists, J=ker θ, 𝔖/J≅W(k)[π^p], O_K is free of rank p over it, and the elliptic-curve argument applies.

**Reason.** K=Q_p, π=p, E=z−p: W(k)[π^p]=Z_p=O_K, so the set O_K−W(k)[π^p] is empty and the printed counterexample does not exist; and (z−p) is not generated by a power series in z^p, so the projection for A=O_K has no descent at all. For p∤e, e>1, O_K is not the base change along φ of any quotient of 𝔖, so descent to W(k)[π^p] does not describe a descent along φ in this case. The conclusion of the remark, that no functorial descent exists, is true in every case.

### AInfCohomology/E-AI6-14 — gap

BMS2, Notation 11.1, p.298 (Publ. math. IHÉS 129). Review verdict: **confirmed**; affects the proof; correction status `new`.

**Finding.** The source claims faithful flatness and topological freeness for the resulting map 𝔖 → A_inf, citing [BMS18, Lemma 4.30 and its proof].

**Correction.** BMS1 Lemma 4.30 and its proof give flatness only. Faithful flatness follows because the map is a flat local homomorphism of local rings. Topological freeness follows by lifting a basis of A_inf/(p,[π^♭]^p) over k that contains 1 and applying derived Nakayama for the regular sequence (p,z); this argument is in neither paper.

**Reason.** BMS1 Lemma 4.30 (p.281) asserts flatness of 𝔖→A_inf, and its proof shows that M⊗^L_𝔖 A_inf is concentrated in degree 0; neither faithful flatness nor a topological basis occurs in the statement or the proof. BMS2 uses topological freeness in the proof of Corollary 11.12(4) and in Remark 11.17.
