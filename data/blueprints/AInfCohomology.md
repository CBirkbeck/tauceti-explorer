# Integral A_inf cohomology and Breuil–Kisin–Fargues structures

This roadmap connects integral perfectoid coefficients to smooth and semistable cohomology, its canonical de Rham lattices, and Breuil–Kisin descent. The full specification below has 226 targets: 197 targets imported from the accepted AI.0 and AI.6 parts, with 29 additional coefficient, sheaf, infinitesimal and trace inputs. Every target, hypothesis, API, definition test and comparison-map check is stated here in original mathematical prose. All ten layers are planned; the supplier extensions and proof gaps at the end keep them from being closed.

The coefficient, module and integral-sheaf targets use the pinned Mathlib/Tau Ceti carriers. The current upstream AdicSpaces and AlgebraicVectorBundles roadmaps are reused. The companion suggested file contains ten light definitions, nine coefficient milestone statements and seven examples on existing carriers. The geometric, enhanced and spectral targets below remain fully specified in this reader; elaboration of the companion file verifies their coefficient signatures, not the roadmap’s mathematical implementation.

## Conventions and coefficient maps

Fix a prime p and a complete algebraically closed nonarchimedean C/Q_p. Its valuation ring is O_C, its maximal ideal is m, and its perfect tilt is O_C^flat. Take a compatible primitive cyclotomic system ε=(1,ζ_p,ζ_{p²},…). Cochain complexes have cohomological integer grading; trace homotopy has homological grading. Tate-line shifts and completions are retained in every specialization.

| Symbol | Convention |
| --- | --- |
| A_inf | W(O_C^flat), using the existing Witt-vector ring |
| φ_A | Witt Frobenius equivalence |
| θ, θ̃ | Fontaine untilt map; θ̃=θ∘φ_A⁻¹ |
| μ, ξ, ξ̃ | μ=[ε]−1; ξ=Σ_{j=0}^{p−1}[ε^{1/p}]^j; ξ̃=φ_A(ξ) |
| ξ_r, ξ̃_r | ξ_r=∏_{j=0}^{r−1}φ_A⁻ʲ(ξ); ξ̃_r=∏_{j=1}^{r}φ_Aʲ(ξ) |
| A_inf{1}, O_C{1} | Breuil–Kisin lines; O_C{1}=A_inf{1}⊗_{A_inf,θ̃}O_C |
| A_inf,X^cl, A_inf,X | ordinary Witt sheaf and its derived p-completion |
| B_dR⁺ | the existing ker-θ-adic completion after p-inversion, with R06.1’s complete-DVR extension |
| K_dR⁺(X) | canonical embedding-independent B_dR⁺ deformation cohomology |
| 𝔖, φ_𝔖 | W(k)[[u]], with Witt Frobenius on coefficients and u↦u^p |
| 𝔖^(−1) | a copy of 𝔖 viewed as a 𝔖-algebra along φ_𝔖 |
| g, f | g(u)=[π^flat]; f=g∘φ_𝔖=φ_A∘g, so f(u)=[π^flat]^p |
| θ̃_𝔖, θ_𝔖, c | θ̃_𝔖(u)=π with identity Witt coefficients; θ_𝔖=θ̃_𝔖∘φ_𝔖; c=φ_W∘constantCoeff |
| z, b, v, σ | z is the sphere-monoid base parameter; |b|=|σ|=2 and |v|=−2; u remains the degree-zero power-series parameter |

The topology comparison with AdicSpaces Layer 6 applies to (p,μ) and (p,[ϖ]) only after their reductions are nonzero topologically nilpotent elements of the rank-one tilt and the defining ideals are shown cofinal. It gives no automatic ξ-adic or derived-completion identification. The current analytic locus is D(p)∪D([ϖ]), while the existing interior spaY is D(p)∩D([ϖ]); use the proved locus equalities and request the missing endpoint neighborhoods, interval section rings and stalks.

## Dependencies and layer milestones

The primary chains are coefficient/Witt inputs → décalage and generic module structure → integral AΩ → local and proper comparisons; semistable chart/all-coordinate inputs → logarithmic comparisons → canonical generic-fibre lattice; relative traces and the bundled prismatic interfaces → Breuil–Kisin descent and normalized specializations. Generic Koszul complexes belong to DD.1, ordinary/log PD foundations to CR.0/CR.5, and rational period-ring structure to R06.1. AInf is in tier 13 with PadicHodgeTheory, PerfectoidQuotients and PrismaticCohomology. The needed canonical deformation and relative trace prefixes move here from CP.3 and RT.6; neither higher owner is a prerequisite.

| Layer | Targets | Selected planets | Status |
| --- | ---: | --- | --- |
| AI.0 | 18 | Cyclotomic period elements; Finite Witt coefficient maps; Coherence of finite Witt vectors | planned |
| AI.0:integral | 6 | Breuil–Kisin twist; Fontaine dlog theorem | planned |
| AI.0:period-comparison | 2 | Common rational period maps | planned |
| AI.1 | 44 | Principal décalage; Ideal décalage; Derived décalage; Lax monoidal décalage; Filtered décalage; Koszul décalage calculation | planned |
| AI.2 | 24 | Kedlaya punctured-spectrum triviality; A_inf module structure theorem; Breuil–Kisin–Fargues module; Étale and de Rham lattice pair; Fargues classification; Minuscule crystalline triple | planned |
| AI.3 | 17 | Completed integral structure sheaf; Derived A_inf sheaf; AΩ complex; Framed q-de Rham model; Integral Witt period sheaf | planned |
| AI.4 | 18 | Hodge–Tate specialization; Relative de Rham–Witt comparison; De Rham specialization; Absolute crystalline comparison; Mu-inverted étale specialization | planned |
| AI.5 | 16 | Proper A_inf cohomology; Perfectness of proper A_inf cohomology; Adjacent-degree freeness criterion; BKF structure on proper cohomology | planned |
| AI.6 | 55 | Semistable AΩ complex; Log Hodge–Tate comparison; Log de Rham comparison; Log crystalline comparison; Semistable B_dR⁺ comparison; Functorial de Rham lattice | planned |
| AI.7 | 26 | Breuil–Kisin coefficient normalization; Breuil–Kisin cohomology; Frobenius-twisted trace complex; Breuil–Kisin Frobenius descent; Breuil–Kisin A_inf comparison; Comparison-map agreement | planned |

Dependencies below use stable node IDs. Import the hash-pinned historical targets, then apply importedNodeCorrections and importedPrerequisites as authoritative field replacements. The corrected target specifications below include those replacements. Lower-owner Part II contracts remain visible in the supplier section.

## AI.0 — Period-ring interfaces and normalization

Reuse the Witt ring and its Frobenius. The extra coefficient formulas, finite-Witt kernels, coherence and shared almost lemmas belong here before both module structure and toric descent. Restriction R and Witt Frobenius F are separate transition maps; Verschiebung powers of the unit are not replaced by powers of p.

### cyclotomic-coefficients — Cyclotomic period elements

Target `AInfCohomology:AI.0/cyclotomic-coefficients` (construction).

**Statement.** For C complete algebraically closed over Q_p and epsilon=(1,zeta_p,zeta_p2,...) in O_C^flat, define mu=[epsilon]-1, xi=sum_{j=0}^{p-1}[epsilon^(1/p)]^j, and tilde-xi=phi(xi). Thus mu=xi*phi^(-1)(mu); division is the proven factorization in A_inf, never division in a fraction field.

**Hypotheses.** C is a complete algebraically closed nonarchimedean extension of Q_p p is prime roots are compatible and primitive.

**Dependencies.** `mathlib:WittVector.teichmuller`; `mathlib:WittVector.frobeniusEquiv`; `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Proof or construction.** Use the geometric sum identity in Witt vectors. Evaluate theta(xi) using the primitive p-th root and use the primitive-kernel criterion.

**Uses.**

- AInfCohomology:AI.3/aomega: mu defines the local decalage.
- AInfCohomology:AI.4/hodge-tate: The two kernels specify distinct specializations.

**API.**

- `TauCeti.AInf.cyclotomic_mu` (projection): The first component is [epsilon]-1.
- `TauCeti.AInf.cyclotomic_factorization` (relation): mu=xi*phi^(-1)(mu).
- `TauCeti.AInf.cyclotomic_frobenius` (relation): tilde-xi=phi(xi).
- `TauCeti.AInf.cyclotomic_kernel` (characterisation): ker(theta)=(xi); ker(theta∘phi^(-1))=(tilde-xi).

**Definition tests.**

- `TauCeti.AInf.cyclotomic_test_unit` (non-example): epsilon=1 makes mu=0 and does not give an admissible primitive root system.
- `TauCeti.AInf.cyclotomic_test_theta` (computation): theta(mu)=0 and theta(tilde-xi)=p.
- `TauCeti.AInf.cyclotomic_test_tildeTheta` (computation): tilde-theta(mu)=zeta_p-1; tilde-theta(tilde-xi)=0.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Example 3.16 and Proposition 3.17; printed p.25.

### tilde-theta — Frobenius-shifted Fontaine map

Target `AInfCohomology:AI.0/tilde-theta` (construction).

**Statement.** Define tilde-theta=theta∘phi^(-1): A_inf(S)→S on a perfectoid ring. Its kernel is phi(ker theta); for the cyclotomic O_C normalization it is (tilde-xi).

**Hypotheses.** S is integral perfectoid with p-adic topology and surjective Frobenius mod p.

**Dependencies.** `mathlib:WittVector.fontaineTheta`; `mathlib:WittVector.frobeniusEquiv`; `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Proof or construction.** Compose the existing ring maps. Transport the principal kernel through the Frobenius equivalence.

**Uses.**

- AInfCohomology:AI.4/hodge-tate: Hodge–Tate reduction uses tilde-theta.

**API.**

- `TauCeti.AInf.tildeTheta_apply` (simp): tilde-theta(x)=theta(phi^(-1)x).
- `TauCeti.AInf.tildeTheta_surjective` (characterisation): tilde-theta is surjective.
- `TauCeti.AInf.tildeTheta_ker` (characterisation): Its kernel is generated by phi(xi).

**Definition tests.**

- `TauCeti.AInf.tildeTheta_test_teich` (computation): tilde-theta([a])=(a^(1/p))^sharp.
- `TauCeti.AInf.tildeTheta_test_p` (computation): tilde-theta(p)=p.
- `TauCeti.AInf.tildeTheta_test_mu` (non-example): For O_C, tilde-theta(mu)=zeta_p-1 rather than zero.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Following Lemma 3.2; Lemma 3.3 and Lemma 3.4; printed pp.19–21.

### theta-witt-family — Finite Witt coefficient maps

Target `AInfCohomology:AI.0/theta-witt-family` (construction).

**Statement.** Using A_inf(S)≅lim_F W_r(S), let tilde-theta_r be projection and theta_r=tilde-theta_r∘phi^r. These are surjective ring maps to W_r(S), including theta_1=theta and tilde-theta_1=tilde-theta.

**Hypotheses.** S is integral perfectoid in the sense of BMS1 Definition 3.5; r≥1.

**Dependencies.** `mathlib:TruncatedWittVector`; `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`; `AInfCohomology:AI.0/tilde-theta`.

**Proof or construction.** Identify the Frobenius limit of finite Witt vectors using inverse limits and untilting. Check components on Teichmuller elements and prove surjectivity inductively. For Verschiebung choose a lift of V(1) under theta_(r+1); transport it by phi^(r+1) for tilde-theta. Do not replace this lift by p.

**Uses.**

- AInfCohomology:AI.4/fv-precomplex: The F,R,V maps use these coefficient compatibilities.
- AInfCohomology:AI.3/witt-toric-cohomology: Finite-level toric calculation uses W_r(S).

**API.**

- `TauCeti.AInf.thetaWitt_level_one` (compatibility): theta_1=theta; tilde-theta_1=tilde-theta.
- `TauCeti.AInf.thetaWitt_surjective` (characterisation): Both maps onto W_r(S) are surjective.
- `TauCeti.AInf.thetaWitt_F` (compatibility): F∘tilde-theta_(r+1)=tilde-theta_r; F∘theta_(r+1)=theta_r∘phi.
- `TauCeti.AInf.thetaWitt_R` (compatibility): R∘theta_(r+1)=theta_r; R∘tilde-theta_(r+1)=tilde-theta_r∘phi^(-1).
- `TauCeti.AInf.thetaWitt_V` (compatibility): Choose lambda_(r+1) with theta_(r+1)(lambda_(r+1))=V(1). Then V theta_r(x)=theta_(r+1)(lambda_(r+1)*phi^(-1)(x)), and V tilde-theta_r(x)=tilde-theta_(r+1)(phi^(r+1)(lambda_(r+1))*x). In the cyclotomic normalization xi is such a lift; p is not a lift over a characteristic-zero untilt.

**Definition tests.**

- `TauCeti.AInf.thetaWitt_test_r1` (compatibility): For r=1 recover the existing Fontaine map, not an independent theta.
- `TauCeti.AInf.thetaWitt_test_teich` (computation): tilde-theta_r([a])=[(a^(1/p^r))^sharp] and theta_r([a])=[a^sharp].
- `TauCeti.AInf.thetaWitt_test_FnotR` (non-example): For a non-Frobenius-fixed Teichmuller input, F and R compatibility differ by phi.
- `TauCeti.AInf.thetaWitt_test_VnotP` (non-example): Over a characteristic-zero untilt, V(1) in W_2 has first Witt coordinate zero, whereas the first coordinate of p is p≠0; theta_2(p) cannot be used as V(1).

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemmas 3.2–3.4, printed pp.19–21; Definition 3.5, p.21; Lemmas 3.12–3.13, pp.23–24; Lemma 3.9(v), printed pp.21–22 (surjectivity).

### witt-kernel-generators — Finite Witt kernel generators

Target `AInfCohomology:AI.0/witt-kernel-generators` (construction).

**Statement.** Set xi_r=product_{i=0}^{r-1}phi^(-i)(xi), and tilde-xi_r=phi^r(xi_r)=product_{i=1}^{r}phi^i(xi). Then ker(theta_r)=(xi_r), ker(tilde-theta_r)=(tilde-xi_r). Compatible unit choices are allowed for general perfectoid S. Both generators are nonzerodivisors.

**Hypotheses.** S and r as in theta-witt-family; xi generates ker(theta).

**Dependencies.** `AInfCohomology:AI.0/theta-witt-family`; `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Proof or construction.** Induct using the finite Witt projection and kernel calculation. Transport the product by phi^r to obtain the shifted formula. Use the primitive-kernel nonzerodivisor theorem and transport regularity along Frobenius; products of regular factors remain regular.

**Uses.**

- AInfCohomology:AI.4/relative-witt-comparison: Finite reductions are along tilde-theta_r.

**API.**

- `TauCeti.AInf.xiWitt_recursion` (simp): xi_(r+1)=xi_r*phi^(-r)(xi).
- `TauCeti.AInf.xiWitt_tilde_recursion` (simp): tilde-xi_(r+1)=tilde-xi_r*phi^(r+1)(xi).
- `TauCeti.AInf.xiWitt_ker_theta` (characterisation): theta_r induces A_inf/(xi_r)≅W_r(S).
- `TauCeti.AInf.xiWitt_ker_tilde` (characterisation): tilde-theta_r induces A_inf/(tilde-xi_r)≅W_r(S).
- `TauCeti.AInf.xiWitt_regular` (structure): xi_r and tilde-xi_r are nonzerodivisors for integral perfectoid S, as are the distinguished generators after perfectoid base change.

**Definition tests.**

- `TauCeti.AInf.xiWitt_test_one` (computation): xi_1=xi; tilde-xi_1=tilde-xi.
- `TauCeti.AInf.xiWitt_test_two` (computation): xi_2=xi*phi^(-1)(xi), tilde-xi_2=tilde-xi*phi(tilde-xi).
- `TauCeti.AInf.xiWitt_test_orientation` (non-example): The shifted r=2 product uses positive Frobenius powers, not xi*phi^(-1)(xi).

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemmas 3.12–3.13; printed pp.23–24.

### witt-limit-and-mu-kernel — Infinite Witt specialization kernel

Target `AInfCohomology:AI.0/witt-limit-and-mu-kernel` (theorem).

**Statement.** For O_C, theta_infinity:A_inf→lim_R W_r(O_C)=W(O_C) has kernel (mu), equivalently the intersection over r≥1 of (xi_r)=(mu/phi^(-r)(mu)) is (mu). Its cokernel is killed by W(m_C^flat); if C is spherically complete, it induces A_inf/(mu)≅W(O_C). The ideal (mu) is independent of the compatible primitive roots. Ordinary completeness alone does not imply surjectivity.

**Hypotheses.** Cyclotomic coefficients; p-adic and weak topologies as in §3.

**Dependencies.** `AInfCohomology:AI.0/witt-kernel-generators`; `AInfCohomology:AI.0/cyclotomic-coefficients`.

**Proof or construction.** Compute xi_r=mu/phi^(-r)(mu), and reduce the intersection modulo p using regularity of (p,xi_r). Identify the intersection of the resulting valuation ideals in O_C^flat. Pass the finite-level short exact sequences to the R-inverse limit, identifying the cokernel with lim^1_r xi_r A_inf. Reduce modulo p^s and use factorization of multiplication by any m∈m_C^flat through the constant mu system to kill lim^1; spherical completeness makes this lim^1 vanish.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.23; printed p.27.

### period-regularity — Regularity and completeness of integral periods

Target `AInfCohomology:AI.0/period-regularity` (theorem).

**Statement.** The elements p,mu,xi,tilde-xi and their finite Frobenius products are nonzerodivisors in A_inf(O_C). A_inf is p-adically and (p,xi)-adically complete; A_inf/(xi)=O_C is p-torsion-free. Record analogous (p,tilde-xi) completeness and regular pairs needed for finite derived reductions.

**Hypotheses.** C as above; do not assert O_C is noetherian.

**Dependencies.** `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `mathlib:WittVector.isAdicCompleteIdealSpanP`.

**Proof or construction.** Reduce the Witt statements modulo p to the valuation domain O_C^flat. Use regular-sequence induction and completeness, retaining the topological-nilpotence assumption in Lemma 3.20.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.10, Proposition 3.17; Lemma 3.23 (regular-sequence argument); printed pp.22–27.

### witt-base-change — Tor independence for finite Witt vectors

Target `AInfCohomology:AI.0/witt-base-change` (theorem).

**Statement.** For a map S→S′ of integral perfectoid rings and 1≤j≤r, the canonical maps W_j(S) tensor^L_(A_inf(S)) A_inf(S′)→W_j(S′) and W_j(S) tensor^L_(W_r(S)) W_r(S′)→W_j(S′) are quasi-isomorphisms. In the second map W_j(S) is a W_r(S)-module along either iterated Frobenius or restriction. This is Tor independence for the specified quotients, not flatness of every Witt map.

**Hypotheses.** Integral perfectoid rings S,S′; finite lengths 1≤j≤r; use the same Frobenius or restriction convention on both sides.

**Dependencies.** `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/witt-kernel-generators`.

**Proof or construction.** A distinguished generator xi of ker(theta) remains distinguished after base change. Resolve A_inf(S)/(tilde-xi_j), or A_inf(S)/(xi_j), by its regular two-term A_inf resolution; the corresponding quotient over S′ is again regular. Apply the same calculation at length r and derived tensor associativity to obtain the W_r(S) formula for either transition map.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.13; printed p.24.

### witt-coherence — Coherence of Witt vectors of perfectoid integers

Target `AInfCohomology:AI.0/witt-coherence` (theorem).

**Statement.** W_r(O_C) and W_r(O_C^flat) are coherent for every finite r. Kernels of maps between finite free modules are finitely generated; hence finitely presented modules form an abelian category at these finite Witt levels.

**Hypotheses.** Finite r≥1; the base is the valuation ring O_C or its tilt, not every perfectoid ring.

**Dependencies.** `mathlib:TruncatedWittVector`; `AInfCohomology:AI.0/coherent-square-zero-extension`; `AInfCohomology:AI.0/coherence-artin-rees`; `AInfCohomology:AI.0/artin-rees-bounded-isogeny`.

**Proof or construction.** Use the valuation-ring kernel estimates, finite Witt truncation and induction on r. Do not infer coherence of the infinite ring A_inf from this theorem.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 3.24; printed p.28.

### witt-finite-presentation-devissage — Finite-presentation devissage over Witt rings

Target `AInfCohomology:AI.0/witt-finite-presentation-devissage` (lemma).

**Statement.** If I⊂R is finitely generated and M is an R/I-module, M is finitely presented over R/I iff it is finitely presented over R.

**Hypotheses.** Commutative ring R; finitely generated ideal I; M annihilated by I.

**Dependencies.** `mathlib:ModuleCat`.

**Proof or construction.** Lift a finite presentation over R/I to R, adding the finitely many generators of I for each free generator. Reduce a finite R presentation modulo I for the converse.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.25(i); printed p.28.

### no-almost-zero-witt-sections — Absence of almost-zero finite Witt sections

Target `AInfCohomology:AI.0/no-almost-zero-witt-sections` (lemma).

**Statement.** Every finitely presented W_r(O_C)-module M has no nonzero element killed by W_r(m), for finite r≥1. In particular this applies to the finitely presented toric cohomology modules; it is stronger than just the free-module case.

**Hypotheses.** M finitely presented over finite W_r(O_C); m the non-finitely-generated maximal ideal of the nondiscrete valuation ring.

**Dependencies.** `AInfCohomology:AI.0/witt-coherence`; `AInfCohomology:AI.0/witt-almost-ideal`.

**Proof or construction.** A cyclic submodule generated by an almost-zero element is finitely presented by coherence. Its quotient of W_r(k) would force the residue kernel and then m to be finitely generated, a contradiction.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Corollary 3.29; printed p.30.

### witt-polynomial-calculation — Finite Witt polynomial decomposition

Target `AInfCohomology:AI.0/witt-polynomial-calculation` (lemma).

**Statement.** For any commutative ring S and finite Witt length r≥1, there are natural inclusions W_r(S[T_1^(p^r),…,T_d^(p^r)])⊂W_r(S)[U_1,…,U_d]⊂W_r(S[T_1,…,T_d]), where U_i=[T_i], and likewise for Laurent variables. Taking the union over all p-power roots gives W_r(S[T_i^(1/p^infinity)])=W_r(S)[U_i^(1/p^infinity)] and the Laurent version. The p-adic completed versions used in AI.3 follow by completion; this does not identify W_r(S[T]) with W_r(S)[T].

**Hypotheses.** S any commutative ring; p prime; finite Witt length r≥1 and finitely many variables. For the completed variants use the p-adic completion comparison, not an unrestricted monomial product.

**Dependencies.** `AInfCohomology:AI.0/theta-witt-family`; `mathlib:TruncatedWittVector`.

**Proof or construction.** Use Witt polynomial coordinates and the Teichmuller multiplicative lift to establish the two inclusions. Localize to obtain the Laurent statement. Pass to the filtered union of all p-power root variables, then to the specified p-adic completion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 9.8; printed p.74.

### witt-almost-ideal — The Witt almost ideal

Target `AInfCohomology:AI.0/witt-almost-ideal` (lemma).

**Statement.** For the maximal ideal m⊂O_C, W_r(m)=ker(W_r(O_C)→W_r(k)) is generated by Teichmuller elements [a], a∈m; it is idempotent and flat over W_r(O_C), by Lemma 10.1 and Corollary 10.2. Separately, for 0≤j≤r, Ann(V^j(1))=ker(F^j:W_r(O_C)→W_(r-j)(O_C))=(q_(r,j)), where q_(r,j)=([zeta_(p^j)]−1)/([zeta_(p^r)]−1) is the polynomial quotient supplied by cyclotomic divisibility, and Ann(q_(r,j))=(V^j(1))=V^j W_(r-j)(O_C), by Corollary 3.18. The first annihilator/kernel equality and the V-image equality hold for any perfectoid ring by Remark 3.19.

**Hypotheses.** Finite r≥1; O_C valuation ring with divisible value group and the fixed compatible primitive p-power roots. For the cyclotomic annihilator formulas, O_C is p-torsion-free; W_0=0.

**Dependencies.** `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0/witt-kernel-generators`; `AInfCohomology:AI.0/period-regularity`.

**Proof or construction.** Use Lemma 10.1 to compare powers of Witt ideals with ideals of Teichmuller lifts; apply Corollary 10.2 to the idempotent increasing union of principal ideals m. Deduce flatness from the filtered union of principal ideals generated by nonzerodivisors. For the separate Corollary 3.18 formulas, use x V^j(1)=V^j(F^j(x)), injectivity of V^j and surjectivity of F^j; compute ker(F^j) through the shifted theta kernels. Use nonzerodivisibility of [zeta_(p^r)]−1 and the restriction map to identify Ann(q_(r,j)) with V^j W_(r-j).

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 10.1 and Corollary 10.2; printed p.80; bms1-v3, Corollary 3.18 and Remark 3.19; printed pp.25–26.

### witt-etale-base-change — Étale base change of Witt vectors

Target `AInfCohomology:AI.0/witt-etale-base-change` (theorem).

**Statement.** For any étale map A→B of commutative rings, W_r(A)→W_r(B) is étale. For any map A→A′ with B′=B⊗_A A′, the natural map W_r(A′)⊗_(W_r(A)) W_r(B)→W_r(B′) is an isomorphism. This coefficient theorem precedes both AI.3 and the CR.4 relative de Rham–Witt comparison.

**Hypotheses.** Commutative rings; p prime; finite Witt length r≥1; A→B étale; A′ arbitrary.

**Dependencies.** `mathlib:TruncatedWittVector`.

**Proof or construction.** Use the ghost-coordinate product description after inverting p; use localization to reduce to Z_(p)-algebras. Use finite presentation to descend A→B to an étale A_0→B_0 with A_0 finitely generated over Z_(p). Apply the finite-type Witt étale lifting/base-change result, then use tensor associativity for arbitrary A and A′. The supplier refinement must expose the finite-type proof interior.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 10.4; printed p.81.

### coherent-quotient — Coherence of a finitely generated quotient

Target `AInfCohomology:AI.0/coherent-quotient` (lemma).

**Statement.** If R is coherent and I⊂R finitely generated, then R/I is coherent.

**Hypotheses.** Coherent commutative R; finitely generated I.

**Dependencies.** `AInfCohomology:AI.0/witt-finite-presentation-devissage`.

**Proof or construction.** Lift a finitely generated ideal to R and use its finite presentation plus I/I² to present the quotient ideal.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.25(ii); printed p.28.

### coherent-square-zero-extension — Coherence of a square-zero extension

Target `AInfCohomology:AI.0/coherent-square-zero-extension` (lemma).

**Statement.** If S→R is surjective with square-zero kernel I, R coherent and I finitely presented as an R-module, then S is coherent.

**Hypotheses.** I²=0; R coherent; I finitely presented over R.

**Dependencies.** `AInfCohomology:AI.0/witt-finite-presentation-devissage`.

**Proof or construction.** For a finitely generated J⊂S, present its image in R and then J∩I as a submodule of a finitely presented coherent module. Use the short exact sequence to present J.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.26; printed p.29.

### coherence-artin-rees — Coherence from Artin–Rees and two charts

Target `AInfCohomology:AI.0/coherence-artin-rees` (lemma).

**Statement.** If f is regular in R, (R,f) has the Artin–Rees property on every inclusion of finitely generated modules, and R[1/f] and R/f are coherent, then R is coherent.

**Hypotheses.** Artin–Rees means the induced f-adic topology equals the intrinsic topology for every finitely generated module inclusion.

**Dependencies.** `AInfCohomology:AI.0/coherent-quotient`; `AInfCohomology:AI.0/coherent-square-zero-extension`.

**Proof or construction.** Reduce the finite-generation of a relation kernel to a mod-f statement with uniformly bounded f-torsion. Use Artin–Rees again to present I/fI inside a coherent finite quotient.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.27; printed p.29.

### artin-rees-bounded-isogeny — Artin–Rees under a bounded isogeny

Target `AInfCohomology:AI.0/artin-rees-bounded-isogeny` (lemma).

**Statement.** For an injection R→S with both f-torsion-free and cokernel killed by f^n, (R,f) has the Artin–Rees property iff (S,f) does.

**Hypotheses.** f∈R regular on R,S; one fixed bound n on the cokernel.

**Dependencies.** `AInfCohomology:AI.0/coherence-artin-rees`.

**Proof or construction.** Compare scalar extension and restriction modulo bounded f-torsion. Translate equality of induced and intrinsic topologies across these functors.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 3.28; printed p.30.

### local-power-series-flatness — Flat cyclotomic power-series specialization

Target `AInfCohomology:AI.0/local-power-series-flatness` (theorem).

**Statement.** For j≥0, the continuous map Z_p[[T]]→A_inf, T↦[ε^(1/p^j)]−1, is faithfully flat. The criterion used is BMS1 Remark 4.31: a map A→B of p-adically complete p-torsion-free rings is flat when A is noetherian and A/p→B/p is flat. Only the displayed cyclotomic maps are exported here; this is not a claim that all maps of perfectoid rings are flat.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. A compatible primitive system ε is fixed. Completeness on A_inf is for (p,[ε^(1/p^j)]−1).

**Dependencies.** `AInfCohomology:AI.0/period-regularity`; `mathlib:PowerSeries`; `mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective`.

**Proof or construction.** Modulo p, use the injective map F_p[[T]]→O_C^flat and torsion-freeness over the DVR F_p[[T]]. The image of T is a nonzero nonunit. Z_p[[T]] is noetherian, and it and A_inf are p-adically complete and p-torsion-free. Apply BMS1 Remark 4.31 to the flat map modulo p. The map is local, so flatness is faithful.

**Check.** For j=0 the map sends T to mu, and p,T remain a regular sequence. Use faithful flatness for descent of an isomorphism, not for replacing derived scalar extension by an arbitrary degreewise tensor.

**Source.** bms1-v3, Remark 4.31 and proof of Lemma 4.30, printed pp.43–44; CK, Propositions 3.29 and 3.33 proofs, printed pp.21–24.

## AI.0:integral — Integral coefficient interfaces and twists

Construct the residue map and the integral lines before rational period comparisons. Distinguish A_inf{1}, its étale realization Z_p(1) and O_C{1}; dlog has image (ζ_p−1)O_C{1}. Keep the perfectoid cotangent result in the completed derived category.

### residue-map — Witt residue specialization

Target `AInfCohomology:AI.0:integral/residue-map` (construction).

**Statement.** The residue map O_C^flat→k induces A_inf=W(O_C^flat)→W(k); it commutes with Frobenius and sends mu to 0 and xi,tilde-xi to p. This is the coefficient map for the crystalline special fiber.

**Hypotheses.** k is the perfect residue field of O_C; C as above.

**Dependencies.** `mathlib:WittVector.map`; `AInfCohomology:AI.0/cyclotomic-coefficients`.

**Proof or construction.** Use functoriality of Witt vectors on the residue homomorphism. Evaluate epsilon and its roots at 1 in k.

**Uses.**

- AInfCohomology:AI.5/global-witt: Specifies the derived W(k) specialization.

**API.**

- `TauCeti.AInf.residue_teich` (simp): [a] maps to [bar a].
- `TauCeti.AInf.residue_frobenius` (compatibility): Residue commutes with phi.
- `TauCeti.AInf.residue_periods` (simp): mu↦0 and xi,tilde-xi↦p.
- `TauCeti.AInf.residue_surjective` (characterisation): The Witt residue map is surjective.

**Definition tests.**

- `TauCeti.AInf.residue_test_one` (computation): 1 maps to 1.
- `TauCeti.AInf.residue_test_mu` (computation): mu maps to 0, making mu-inverted residue specialization impossible.
- `TauCeti.AInf.residue_test_xi` (non-example): xi maps to p, not 0 in W(k).

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Introduction, printed pp.2–3; §4.2, pp.34–44.

### breuil-kisin-line — Intrinsic Breuil–Kisin twist

Target `AInfCohomology:AI.0:integral/breuil-kisin-line` (construction).

**Statement.** Define A_inf{1}=lim_r (ker tilde-theta_r/(ker tilde-theta_r)^2) with the divided transition maps normalized by p; set A_inf{n} to its tensor powers for n≥0 and dual powers for n<0. The cyclotomic trivialization gives A_inf{1}=(1/mu) A_inf(1); the linearized Frobenius on the intrinsic line has factor 1/tilde-xi. Distinguish this rank-one A_inf module from Z_p(1) and O_C{1}.

**Hypotheses.** C as above; compatible roots only for a displayed trivialization, not for the intrinsic line.

**Dependencies.** `AInfCohomology:AI.0/witt-kernel-generators`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Proof or construction.** Construct the conormal transition maps and divide their p factors, proving integrality. Compare a compatible system of conormal generators with dlog(epsilon)/mu. Use tensor-dual evaluation to extend to all integer powers.

**Uses.**

- AInfCohomology:AI.4/hodge-tate: H^i has the inverse twist {−i}.
- AInfCohomology:AI.2/fargues-classification: Tate twists must be preserved by the equivalence.

**API.**

- `TauCeti.AInf.bkTwist_zero` (simp): A_inf{0} is the unit line.
- `TauCeti.AInf.bkTwist_add` (equivalence): A_inf{a}⊗A_inf{b}≅A_inf{a+b}, coherently.
- `TauCeti.AInf.bkTwist_dual` (equivalence): Dual of A_inf{a} is A_inf{-a}.
- `TauCeti.AInf.bkTwist_frobenius` (compatibility): The linearized phi on the chosen basis of A_inf{1} is multiplication by 1/tilde-xi.
- `TauCeti.AInf.bkTwist_epsilon_change` (compatibility): Changing epsilon transports the generator by the ratio dictated by dlog(epsilon)/mu; the intrinsic line is unchanged.
- `TauCeti.AInf.bkTwist_etale` (compatibility): Étale realization of the line is Z_p(1); tilde-theta reduction is O_C{1}.

**Definition tests.**

- `TauCeti.AInf.bkTwist_test_zero` (degenerate): The zero tensor power is A_inf, with identity phi.
- `TauCeti.AInf.bkTwist_test_one` (computation): dlog(epsilon) spans mu*A_inf{1}; after tilde-theta its image is (zeta_p-1)O_C{1}.
- `TauCeti.AInf.bkTwist_test_negative` (compatibility): A_inf{1}⊗A_inf{-1}≅A_inf, whereas a rule omitting duals fails for negative powers.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Example 4.24 (intrinsic conormal-limit construction); printed p.41; bms2, Proposition 6.5 and Remark 6.6 (agreement of the intrinsic twists); printed pp.40–41.

### fontaine-dlog — Fontaine dlog theorem

Target `AInfCohomology:AI.0:integral/fontaine-dlog` (theorem).

**Statement.** O_C{1}=T_p(Omega^1_(O_C/Z_p)) is free of rank one; dlog:O_C(1)→O_C{1} is injective with image (zeta_p−1)O_C{1}. There is no canonical trivialization of the Galois Tate line.

**Hypotheses.** C complete algebraically closed over Q_p; zeta_p primitive; continuous Galois action when C is a completed algebraic closure.

**Dependencies.** `AInfCohomology:AI.0:integral/breuil-kisin-line`; `DerivedDeRhamCohomology:DD.0/cotangent-complex`.

**Proof or construction.** Use the completed cotangent calculation and the exact sequence of roots of unity. For general C reduce from C_p via the vanishing of the relative completed cotangent complex.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** zavyalov, Theorem 3.3.3 and proof, printed pp.35–36; twist conventions in §1, pp.9–10.

### completed-cotangent-twist — Completed cotangent description of the twist

Target `AInfCohomology:AI.0:integral/completed-cotangent-twist` (comparison).

**Statement.** The derived p-completed cotangent complex of O_C/Z_p is O_C{1}[1], and for an integral perfectoid O_C-algebra S the derived p-completed relative cotangent complex of S/O_C vanishes. These use cohomological degree −1, so the twist is the shift by −1 of the completed complex.

**Hypotheses.** Integral perfectoid S over O_C, with p-adic completion; do not replace the derived completion by ordinary differentials.

**Dependencies.** `AInfCohomology:AI.0:integral/breuil-kisin-line`; `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`; `DerivedDeRhamCohomology:DD.1/derived-completion`; `DerivedDeRhamCohomology:DD.0`.

**Proof or construction.** Use the perfectoid cotangent theorem from DD.0 together with transitivity. Identify the surviving degree with the Tate module of differentials.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** zavyalov, §1 twist conventions, printed pp.9–10; Theorem 3.3.3 proof, pp.35–36.

### integral-crystalline-ring-interface — Integral crystalline coefficient interface

Target `AInfCohomology:AI.0:integral/integral-crystalline-ring-interface` (comparison).

**Statement.** Import the p-completed PD envelope A_crys of (A_inf,ker theta) from CR.0, with its theta augmentation and Witt residue map. Show the common coefficient maps commute and the Frobenius extends; no rational period-ring comparison is needed to construct this integral prefix.

**Hypotheses.** PD structure extends the canonical structure on p where required; C as above.

**Dependencies.** `CrystallineCohomology:CR.0/fontaine-envelope`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0/period-regularity`.

**Proof or construction.** Invoke the PD envelope universal property for the coefficient maps. Check Frobenius on xi and the divided powers before p-completion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Definition 3.22(i), printed p.27; §12.1, pp.96–97; supplier CR.0/fontaine-envelope (principal regular case and coefficient maps).

### perfectoid-coefficient-regularity — Regularity of affinoid perfectoid coefficients

Target `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity` (theorem).

**Statement.** For an affinoid perfectoid Spa(S[1/p],S) over Spa(C,O_C), A_inf(S)=W(S^flat) is (p,mu)-adically complete, A_inf(S)/mu is p-adically complete, and (p^n,mu^m) is a regular sequence for every n,m>0. Its quotient by this sequence is flat over A_inf/(p^n,mu^m). Theta is surjective with kernel generated by the image of xi. The coefficient ring is xi-adically separated. These assertions apply to the chart and all-coordinate towers; they are not asserted for an arbitrary p-complete algebra.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. S is the integral ring in the stated affinoid perfectoid pair; S^flat has no nonzero O_C^flat-torsion.

**Dependencies.** `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`; `PerfectoidSpaces:P2/affinoid-perfectoid-space`; `EnhancedDerivedSheaves:E4`.

**Proof or construction.** Use torsion-freeness of S^flat over the valuation ring O_C^flat, the Witt reduction modulo p, and regular-sequence dévissage to get regularity and finite-quotient flatness. The Witt coordinate topology proves (p,mu)-completeness; the finite Witt theta sequences prove p-completeness after mod mu. Apply the ideal-completeness/separatedness criterion to xi in the radical of (p,mu).

**Check.** At S=O_C this specializes to the coefficient-ring regularity target. Flatness is stated for the finite quotients; no unrestricted completed-tensor exactness follows.

**Source.** CK, Lemma 3.13 and §3.14, printed pp.14–15; §5.35, p.51.

## AI.0:period-comparison — Rational period-ring compatibility

Use the existing BDeRhamPlus and BDeRham carriers with the R06.1 complete-DVR and common-map extensions. A_inf→B_dR⁺ is flat, but rational period comparisons do not define the integral prefix. Its finite ξ-quotient Tate topology controls the infinitesimal envelopes.

### common-rational-period-maps — Comparison with rational period rings

Target `AInfCohomology:AI.0:period-comparison/common-rational-period-maps` (theorem).

**Statement.** Extend the common integral A_inf and A_crys maps to the rational rings supplied by R06.1. Identify B_dR^+ with completion of A_inf[1/p] at ker(theta[1/p]), B_dR=B_dR^+[1/xi], and the compatible A_crys→B_dR^+ and B_crys maps. Establish the Frobenius-twisted scalar-extension identities, not a second set of unrelated period constants.

**Hypotheses.** Construct the integral prefix first; use the rational topology, separatedness and kernel-generator theorems supplied by R06.1.

**Dependencies.** `AInfCohomology:AI.0:integral/integral-crystalline-ring-interface`; `PadicHodgeTheory:R06.1`; `mathlib:BDeRhamPlus`; `mathlib:BDeRham`.

**Proof or construction.** Compare the existing Mathlib completion/localization carriers with the supplier universal properties. Extend maps only after their continuity and denominator conditions are checked. Transport xi and tilde-xi along phi when changing scalar maps.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Definition 3.22(ii–iii), printed p.27; §4.3, printed pp.41–43; sw20, Definition 12.4.3 and Remark 12.4.4, printed pp.105–106 (PDF pp.115–116).

### bdr-finite-level-compatibility — Finite de Rham coefficient quotients and flatness

Target `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility` (theorem).

**Statement.** The common map A_inf→B_dR⁺ is flat. For n≥1, B_dR⁺/ξ^n identifies with (A_inf/ξ^n)[1/p], as a complete Tate Q_p-algebra, with A_inf/ξ^n an open p-adic ring of definition. A finite extension of W(k)[1/p] embedded in C has its unique continuous lift into B_dR⁺. The same quotient topology is used in all infinitesimal-envelope completions. These are properties of the existing BDeRhamPlus carrier, not a new period ring.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common complete-DVR and algebraic-closure embeddings supplied by R06.1; n>0.

**Dependencies.** `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`; `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`; `mathlib:BDeRhamPlus`.

**Proof or construction.** Identify the finite ξ-quotients before passing to the inverse limit; carry the p-adic ring-of-definition topology through localization. Flatness uses the valuation-ring flatness input cited in CK §6.1 and the period-ring presentation; keep its nonnoetherian hypotheses as supplier contract R06.1.

**Check.** At n=1 the quotient is C, while the ξ-adic inverse limit is B_dR⁺. Completing first for (p,ξ) and then inverting p is not silently substituted for the ξ-adic topology after p-inversion.

**Source.** CK, §6.1, printed p.60; §6.2, pp.60–61; bms1-v3, §13.1 before Lemma 13.4, printed p.105.

## AI.1 — The derived décalage operator

Start with the principal normalized divisibility model in all cohomological integer degrees, then descend to invertible ideal sheaves and the enhanced derived category. Lη is nonlinear as a triangulated operation. Its Bockstein, monoidal, completeness and nonflat-base-change hypotheses are part of the exports.

### principal-term — Divisibility submodule

Target `AInfCohomology:AI.1/principal-term` (definition).

**Statement.** E_f(C)^i is the R-submodule of C^i consisting of x for which there exists y in C^(i+1) with f y=d x. No torsion-freeness is needed to define this submodule.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one.

**Dependencies.** `mathlib:ModuleCat`; `mathlib:CochainComplex`.

**Proof or construction.** Use the preimage under d of the image of scalar multiplication by f. For sums add the witnesses; for scalar multiples multiply the witness by that scalar. Commutativity of R supplies scalar linearity.

**Uses.**

- AInfCohomology:AI.1/principal-differential: A witness supplies division of the differential by f.
- AInfCohomology:AI.1/principal-complex: These submodules are the normalized terms.

**API.**

- `TauCeti.Decalage.etaTerm_mk` (constructor): If f y=d x then x belongs to E_f(C)^i.
- `TauCeti.Decalage.etaTerm_coe` (coercion): The inclusion E_f(C)^i→C^i is R-linear and injective.
- `TauCeti.Decalage.etaTerm_ext` (extensionality): Two elements of E_f(C)^i agree exactly when their images in C^i agree.

**Definition tests.**

- `term_unit` (computation): For f=1, E_f(C)^i=C^i.
- `term_zero` (degenerate): For f=0, E_f(C)^i=ker(d_i).
- `term_nondivisible` (non-example): For C=[Z --1→ Z] in degrees 0,1 and f=2, the element 1 does not belong to E_f(C)^0.

**Check.** The ambient carrier is the existing module C^i, not a replacement module type. The zero-divisor case is admitted for this definition only.

**Source.** bms1-v3, Definition 6.2 and Remark 6.3, printed p.49.

### principal-differential — Divided differential

Target `AInfCohomology:AI.1/principal-differential` (construction).

**Statement.** For x in E_f(C)^i, define δ_i(x) to be the unique y satisfying f y=d_i x, regarded as an element of E_f(C)^(i+1). This is an R-linear map.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Dependencies.** `AInfCohomology:AI.1/principal-term`; `mathlib:HomologicalComplex.d_comp_d`.

**Proof or construction.** Existence is the defining divisibility condition; uniqueness uses injectivity on C^(i+1). Apply d to f y=d x. Injectivity on C^(i+2) gives d y=0, so y belongs to the next divisibility submodule. Uniqueness applied to sums and scalar multiples proves linearity.

**Uses.**

- AInfCohomology:AI.1/principal-complex: It is the adjacent differential of the normalized cochain complex.

**API.**

- `TauCeti.Decalage.etaDifferential_spec` (characterisation): The underlying value satisfies f δ_i(x)=d_i x; promoted as principal-differential-spec.
- `TauCeti.Decalage.etaDifferential_unique` (universal-property): Any y in the next term satisfying f y=d_i x equals δ_i(x).
- `TauCeti.Decalage.etaDifferential_add` (simp): δ_i(x+x′)=δ_i(x)+δ_i(x′).

**Definition tests.**

- `divided_unit` (computation): For f=1 the underlying differential is d.
- `divided_cycle` (degenerate): For a genuine cocycle x, δ_i(x)=0.
- `divided_once` (computation): For [Z --4→Z] and f=2, δ_0(1)=2, not 0 or 1.

**Check.** Do not select arbitrary preimages without proving uniqueness. The derivative of the selected preimage vanishes before it is re-bundled.

**Source.** bms1-v3, Definition 6.2, differential diagram, printed p.49.

### principal-differential-spec — Divisibility equation

Target `AInfCohomology:AI.1/principal-differential-spec` (lemma).

**Statement.** For every i and x in E_f(C)^i, f δ_i(x)=d_i x in C^(i+1).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Dependencies.** `AInfCohomology:AI.1/principal-differential`.

**Proof or construction.** Unpack the unique preimage used to define δ_i.

**Check.** Use the equation after applying any R-linear map.

**Source.** bms1-v3, Definition 6.2, printed p.49.

### principal-differential-square — Square-zero divided differential

Target `AInfCohomology:AI.1/principal-differential-square` (lemma).

**Statement.** δ_(i+1) composed with δ_i is zero for every integer i.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Dependencies.** `AInfCohomology:AI.1/principal-differential-spec`; `mathlib:HomologicalComplex.d_comp_d`.

**Proof or construction.** The equation f δ_i(x)=d x and d²=0 give d δ_i(x)=0 by f-injectivity. Apply the divisibility equation once more: f δ_(i+1)δ_i(x)=0. Injectivity implies the value is zero.

**Check.** Retain injectivity on both required target terms.

**Source.** bms1-v3, Definition 6.2, printed p.49.

### principal-complex — Principal décalage complex

Target `AInfCohomology:AI.1/principal-complex` (construction).

**Statement.** Define the normalized principal complex E_f(C) with terms E_f(C)^i and differential δ_i. For a nonzerodivisor f in R it identifies with η_f C inside C[1/f] by x↦f^i x in degree i, using inverse powers for i<0.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Dependencies.** `AInfCohomology:AI.1/principal-term`; `AInfCohomology:AI.1/principal-differential-square`; `mathlib:CochainComplex.of`.

**Proof or construction.** Apply CochainComplex.of to the existing module objects and adjacent maps. A submodule of an f-torsion-free module is f-torsion-free. For the localized comparison, injectivity of C^i→C^i[1/f] follows from termwise f-injectivity. The map x↦f^i x has the required image and intertwines δ with d.

**Uses.**

- AInfCohomology:AI.1/principal-map: Source and target of restricted chain maps.
- AInfCohomology:AI.1/ideal-decalage-complex: Local model with transition factors.

**API.**

- `TauCeti.Decalage.etaComplex_term` (data): The ith term is the existing ModuleCat object associated to E_f(C)^i.
- `TauCeti.Decalage.etaComplex_d` (projection): Its adjacent differential is δ_i.
- `TauCeti.Decalage.etaComplex_torsionFree` (structure): Multiplication by f is injective on every term.

**Definition tests.**

- `complex_two_term` (computation): For regular f, normalized décalage of [R --f²→R] is [R --f→R] in the same two degrees.
- `complex_negative_degree` (computation): The same calculation holds in degrees -3,-2; no nonnegative-degree hypothesis is introduced.
- `complex_zero` (degenerate): The zero complex has zero décalage.

**Check.** The construction is indexed by Z, including negative degrees. The normalized model alone is not the generator-independent global ideal construction.

**Source.** bms1-v3, Remark 6.3, printed p.49.

### principal-map — Restriction of chain maps

Target `AInfCohomology:AI.1/principal-map` (construction).

**Statement.** For an R-linear chain map u:C→D between termwise f-torsion-free complexes, define E_f(u):E_f(C)→E_f(D) by restricting u_i in every degree.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C. D is also termwise f-torsion-free; u is a chain map.

**Dependencies.** `AInfCohomology:AI.1/principal-complex`; `AInfCohomology:AI.1/principal-differential-spec`; `mathlib:CochainComplex.ofHom`.

**Proof or construction.** If f y=d x, then f u(y)=d u(x), so restriction lands in the target submodule. The chain-map square for divided differentials follows after multiplying both sides by f and using injectivity in the target. Bundle the components with CochainComplex.ofHom.

**Uses.**

- AInfCohomology:AI.1/quasi-isomorphism-preservation: It supplies the map whose cohomology is compared.

**API.**

- `TauCeti.Decalage.etaMap_component` (projection): The underlying component is u_i; promoted as principal-map-component.
- `TauCeti.Decalage.etaMap_id` (functoriality): Restriction of an identity chain map is the identity.
- `TauCeti.Decalage.etaMap_comp` (functoriality): Restriction preserves composition.

**Definition tests.**

- `map_identity` (computation): The identity on [Z --4→Z] restricts to the identity on its f=2 décalage.
- `map_zero` (degenerate): The zero chain map restricts to zero.
- `map_composition` (compatibility): A composite of two chain maps restricts to the composite, also in negative degrees.

**Check.** This construction is on the category of complexes, prior to localization.

**Source.** bms1-v3, Lemma 6.4 and Corollary 6.5, printed p.50.

### principal-map-component — Restricted component equation

Target `AInfCohomology:AI.1/principal-map-component` (lemma).

**Statement.** The image in D^i of E_f(u)_i(x) equals u_i applied to the image of x in C^i.

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C. u:C→D is an R-linear chain map and D is termwise f-torsion-free.

**Dependencies.** `AInfCohomology:AI.1/principal-map`.

**Proof or construction.** The component is the restriction of u_i; forget its membership witness.

**Check.** Use this equality to establish naturality on cycles and quotients.

**Source.** bms1-v3, Lemma 6.4, printed p.50.

### principal-cycles — Cycles of principal décalage

Target `AInfCohomology:AI.1/principal-cycles` (lemma).

**Statement.** Under E_f(C)^i→C^i, the cycles of E_f(C) identify with Z^i(C).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Dependencies.** `AInfCohomology:AI.1/principal-differential-spec`.

**Proof or construction.** If δx=0, the divisibility equation gives d x=0. If d x=0, use the zero witness to see x belongs to E_f(C)^i; uniqueness of division gives δx=0.

**Check.** The identification is on actual submodules, before passing to cohomology.

**Source.** bms1-v3, Lemma 6.4, proof, printed p.50.

### principal-boundaries — Boundaries after division

Target `AInfCohomology:AI.1/principal-boundaries` (lemma).

**Statement.** Within Z^i(C), the boundaries of E_f(C) are exactly the z such that f z belongs to B^i(C).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Dependencies.** `AInfCohomology:AI.1/principal-differential-spec`; `AInfCohomology:AI.1/principal-cycles`.

**Proof or construction.** If z=δy, then f z=d y is a boundary of C. If f z=d y, then y lies in E_f(C)^(i-1) by definition, and division uniqueness gives δy=z.

**Check.** Only f-annihilated cohomology is removed; this is not removal of all f-power torsion.

**Source.** bms1-v3, Lemma 6.4, proof, printed p.50.

### principal-cohomology — Principal cohomology quotient

Target `AInfCohomology:AI.1/principal-cohomology` (comparison).

**Statement.** There is a natural R-linear isomorphism H^i(E_f(C))≅H^i(C)/H^i(C)[f], where H^i(C)[f]=ker(f:H^i(C)→H^i(C)).

**Hypotheses.** R is a commutative ring; f is an element of R. C is a cochain complex of R-modules indexed by all integers; d raises degree by one. Multiplication by f is injective on every term of C.

**Dependencies.** `AInfCohomology:AI.1/principal-cycles`; `AInfCohomology:AI.1/principal-boundaries`; `AInfCohomology:AI.1/principal-map-component`.

**Proof or construction.** Identify the cycle modules by principal-cycles. The new boundary submodule is the inverse image of H^i(C)[f] under Z^i(C)→H^i(C), by principal-boundaries. Apply the module quotient isomorphism theorem. Naturality follows from the component equation.

**Check.** For [Z --4→Z], f=2, H^1 becomes Z/2 rather than zero.

**Source.** bms1-v3, Lemma 6.4, printed pp.49–50.

### ideal-decalage-complex — Ideal décalage

Target `AInfCohomology:AI.1/ideal-decalage-complex` (construction).

**Statement.** For a termwise I-torsion-free O-complex C, define η_I C in degree i as {x in C^i : d x belongs to I C^(i+1)} tensor I^⊗i, with the differential obtained by factoring d through I C^(i+1). This construction is functorial in C and independent of local generators.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. The map I tensor C^i→C^i is monic in every degree.

**Dependencies.** `AInfCohomology:AI.1/principal-complex`; `AInfCohomology:AI.1/principal-map`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** Form the divisibility subobject intrinsically as a kernel/preimage in O-modules and tensor it with the invertible sheaf I^⊗i. Locally trivialize I=(f). The preceding normalized complex gives the differential and its square-zero identity. If f′=u f, the comparison of normalized coordinates in degree i multiplies by u^(-i). These factors intertwine differentials and satisfy the cocycle identity. Use the sheaf-module descent and tensor-invertible-object interface requested from E1. This is an explicit unresolved supplier, not a formalized construction.

**Uses.**

- AInfCohomology:AI.1/decalage-cohomology: Its line twist determines the global quotient formula.
- CrystallineCohomology:CR.4: The intrinsic ideal construction specializes to (p).

**API.**

- `TauCeti.Decalage.idealEta_term` (data): The degree-i term is the intrinsic divisibility subobject tensor I^⊗i.
- `TauCeti.Decalage.idealEta_changeGenerator` (compatibility): In normalized coordinates f′=u f gives the degree-i factor u^(-i).
- `TauCeti.Decalage.idealEta_map` (functoriality): A chain map restricts on the divisibility subobjects and tensors with the identity of I^⊗i.

**Definition tests.**

- `ideal_unit` (computation): For I=O, η_I C is canonically C.
- `ideal_overlap` (compatibility): Changes by units u and v compose to the change by uv, including in degree -1.
- `ideal_two_term` (computation): On a principal chart, [R --f²→R] gives [R --f→R] after trivializing the two line factors.

**Check.** Keep the inherited node ID. Negative tensor powers use the dual line, and overlap transitions must be checked.

**Source.** bms1-v3, Definition 6.2 and Remark 6.3, printed p.49.

### decalage-cohomology — Cohomology of ideal décalage

Target `AInfCohomology:AI.1/decalage-cohomology` (lemma).

**Statement.** H^i(η_I C)≅(H^i(C)/H^i(C)[I]) tensor I^⊗i, naturally in a termwise I-torsion-free C. Here H[I] is the kernel of H→H tensor I^(-1) induced by I→O.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C is termwise I-torsion-free.

**Dependencies.** `AInfCohomology:AI.1/ideal-decalage-complex`; `AInfCohomology:AI.1/principal-cohomology`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** Use the principal-cohomology isomorphism on each trivializing chart. Flatness of the invertible line allows it to commute with cycles, boundaries and quotients. Naturality and the u^(-i) transition law glue the local quotient maps.

**Check.** Keep the tensor factor even when a principal computation suppresses it.

**Source.** bms1-v3, Lemma 6.4, printed pp.49–50.

### quasi-isomorphism-preservation — Preservation of quasi-isomorphisms

Target `AInfCohomology:AI.1/quasi-isomorphism-preservation` (lemma).

**Statement.** If u:C→D is a quasi-isomorphism between termwise I-torsion-free O-complexes, η_I u is a quasi-isomorphism.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C and D are termwise I-torsion-free; u is a quasi-isomorphism.

**Dependencies.** `AInfCohomology:AI.1/decalage-cohomology`; `AInfCohomology:AI.1/principal-map-component`.

**Proof or construction.** Each H^i(u) is an isomorphism and identifies the I-annihilator submodules. Pass to the quotient, tensor with the invertible line, and use the natural cohomology formula.

**Check.** No assertion about arbitrary maps with merely almost-isomorphic cohomology.

**Source.** bms1-v3, Lemma 6.4, final assertion, printed p.50.

### derived-decalage — Derived décalage

Target `AInfCohomology:AI.1/derived-decalage` (construction).

**Statement.** Construct Lη_I:D(O)→D(O) by applying η_I to termwise-flat K-flat representatives and inverting quasi-isomorphisms. On any I-torsion-free representative C, its value is represented by η_I C.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Dependencies.** `AInfCohomology:AI.1/quasi-isomorphism-preservation`; `EnhancedDerivedSheaves:E1`; `mathlib:DerivedCategory`; `mathlib:DerivedCategory.Q`.

**Proof or construction.** Use E1 to choose strongly K-flat replacements and comparison roofs; their termwise flatness implies I-torsion-freeness. Use quasi-isomorphism-preservation and the localization universal property to descend the complex-level construction. Compare an arbitrary I-torsion-free representative with a strongly K-flat one and use the same invariance. Do not give this functor an exact-functor instance: the short exact sequence 0→Z/p→Z/p²→Z/p→0 is a countertest.

**Uses.**

- AInfCohomology:AI.3: Applied with I=(μ) to the integral derived pushforward.
- CrystallineCohomology:CR.4: Applied with I=(p) independently of geometric AΩ comparisons.

**API.**

- `TauCeti.Decalage.derivedEta_objIso` (compatibility): For an I-torsion-free representative C, Lη_I(Q C)≅Q(η_I C).
- `TauCeti.Decalage.derivedEta_naturality` (functoriality): The representative comparison commutes with the image of a chain map.
- `TauCeti.Decalage.derivedEta_identityIdeal` (equivalence): For I=O the derived functor is naturally isomorphic to the identity.

**Definition tests.**

- `derived_kills_once` (computation): For a prime p, Lη_p((Z/p)[0])=0.
- `derived_retains_power_torsion` (non-example): Lη_p((Z/p²)[0])≅(Z/p)[0], so it is not zero.
- `derived_nonexact` (non-example): The exact sequence with end terms Z/p and middle term Z/p² is not sent to a distinguished triangle.

**Check.** The existing Mathlib derived category and Q are used, not redefined. K-flat existence and its restriction/localization interface remain named E1 requests.

**Source.** bms1-v3, Lemma 6.1, Corollary 6.5 and Remark 6.6, printed pp.49–50.

### decalage-filtered-colimits — Filtered colimits of décalage

Target `AInfCohomology:AI.1/decalage-filtered-colimits` (lemma).

**Statement.** Lη_I commutes with filtered colimits in D(O).

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Dependencies.** `AInfCohomology:AI.1/derived-decalage`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** At the module level a filtered colimit is exact, hence preserves the kernel defining the divisibility subobject and tensoring by I^⊗i. Apply the filtered K-flat replacement/coherent-colimit comparison supplied by E1. Identify the resulting comparison on cohomology using exactness of filtered colimits and the annihilator quotient formula.

**Check.** This is not a claim that every limit or totalization is preserved.

**Source.** bms1-v3, Corollary 6.5, printed p.50.

### decalage-truncations — Canonical truncations

Target `AInfCohomology:AI.1/decalage-truncations` (lemma).

**Statement.** For a≤b in Z together with infinite endpoints, Lη_I(τ^[a,b] C)≅τ^[a,b](Lη_I C), naturally in C.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Dependencies.** `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/decalage-cohomology`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** Use the good-truncation construction on torsion-free models, replacing the boundary quotient term when necessary rather than assuming it is I-torsion-free. The maps induced by lower and upper good truncation give the comparison through the localization model. In the retained degrees the cohomology quotient formula is unchanged; outside them it vanishes. E1 supplies the t-structure comparison that identifies the resulting maps.

**Check.** Stupid truncation is not substituted for canonical truncation. The replacement-and-comparison construction at the quotient term is an explicit unresolved proof detail in the handoff.

**Source.** bms1-v3, Corollary 6.5, printed p.50.

### decalage-products — Lax symmetric monoidal structure

Target `AInfCohomology:AI.1/decalage-products` (construction).

**Statement.** Construct the natural maps Lη_I C tensor^L Lη_I D→Lη_I(C tensor^L D) and O→Lη_I O, with the associativity, symmetry and unit coherence of a lax symmetric monoidal functor.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual.

**Dependencies.** `AInfCohomology:AI.1/derived-decalage`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** Choose strongly K-flat models C,D. Locally send x tensor y in normalized degrees i,j to x tensor y in degree i+j. The signed Leibniz identity puts it in the required divisibility submodule. Globally combine the line factors I^⊗i tensor I^⊗j→I^⊗(i+j). The complexes η_I C and η_I D need not be K-flat. Resolve them before forming the derived source tensor and map that tensor to the ordinary tensor used by the element-level formula. Check coherence before passing to localization; E1 supplies independence of resolution and monoidal coherence in the shared category.

**Uses.**

- AInfCohomology:AI.3: Multiplication on AΩ comes from the lax structure.
- CrystallineCohomology:CR.4: The p-instance transports multiplicative data.

**API.**

- `TauCeti.Decalage.derivedEta_tensorMap` (constructor): The map has direction Lη_I C tensor^L Lη_I D→Lη_I(C tensor^L D).
- `TauCeti.Decalage.derivedEta_tensor_naturality` (functoriality): The map commutes with a pair of input morphisms.
- `TauCeti.Decalage.derivedEta_tensor_coherence` (compatibility): Associativity, braiding with the cochain sign, and the unit diagrams commute.

**Definition tests.**

- `tensor_unit` (computation): For C=O in degree 0 the tensor map agrees with the unit constraint.
- `tensor_sign` (computation): Interchanging two degree-one cycles introduces a minus sign.
- `tensor_zero` (degenerate): A tensor map with a zero input is the unique zero map.

**Check.** No universal tensor equivalence is asserted. Do not silently identify the derived source with its ordinary tensor product.

**Source.** bms1-v3, Proposition 6.7, printed pp.50–51.

### bockstein-differential — Bockstein complex

Target `AInfCohomology:AI.1/bockstein-differential` (construction).

**Statement.** Construct B_I(C) with degree-i term H^i(C tensor^L O/I) tensor I^⊗i and differential the connecting map for 0→I/I²→O/I²→O/I→0, with its conormal factor absorbed in the next line twist.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C is an object of D(O).

**Dependencies.** `AInfCohomology:AI.1/derived-decalage`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** Use a termwise I-torsion-free model to compute reduction by the two-term flat resolution of O/I. On a principal chart a cocycle modulo f is lifted to x with d x=f y; send its class to the class of y modulo f. Changing the lift or a cohomology representative changes y by a boundary. Since d y=0 by f-injectivity, repeating the boundary operation gives zero. The line factors make this description independent of a chosen generator.

**Uses.**

- AInfCohomology:AI.1/bockstein-reduction: Target of the reduction comparison.
- AInfCohomology:AI.4: The Bockstein records the differential, not only graded Hodge–Tate groups.

**API.**

- `TauCeti.Decalage.bockstein_term` (data): The degree-i module is H^i(C tensor^L O/I) tensor I^⊗i.
- `TauCeti.Decalage.bockstein_lift` (characterisation): Locally, d x=f y gives β([x])=[y].
- `TauCeti.Decalage.bockstein_square` (structure): The composite of consecutive Bockstein maps is zero.

**Definition tests.**

- `bockstein_identity` (computation): For C=[Z --p→Z] in degrees 0,1, reduction has two Z/p groups and β between them is the identity.
- `bockstein_zero` (computation): For C=[Z --p²→Z], β is zero.
- `bockstein_shift` (compatibility): For the cochain shift C[1], the source differential and hence the normalized Bockstein acquire the cochain shift sign.

**Check.** The differential is the Bockstein, not zero by definition. The construction does not assume that C itself has torsion-free cohomology.

**Source.** bms1-v3, Proposition 6.12, printed p.52.

### bockstein-reduction — Reduction to the Bockstein complex

Target `AInfCohomology:AI.1/bockstein-reduction` (comparison).

**Statement.** There is a natural quasi-isomorphism (Lη_I C) tensor^L O/I→B_I(C). On an I-torsion-free representative it is induced by sending a divided-differential term to its cohomology class modulo I.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. C is an object of D(O).

**Dependencies.** `AInfCohomology:AI.1/ideal-decalage-complex`; `AInfCohomology:AI.1/bockstein-differential`; `AInfCohomology:AI.1/derived-decalage`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** Both C/I and (η_I C)/I compute their derived reductions: the flat resolution [I→O] is bounded and scalar multiplication is termwise injective. This is not an assertion that the complexes themselves are K-flat. The assignment x↦[x mod f] in normalized coordinates kills fE and intertwines the divided differential with β. Injectivity on cohomology: write a reduced cycle x with d x=f² z. If [x] is a Bockstein boundary, choose y with d y=f w and x−w=d v+f a. Replacing y by y+f v gives x−δ(y+f v)=f a. Differentiation gives f d a=f² z, so a belongs to E and x is a boundary modulo fE. Surjectivity: a β-closed class has a lift x with d x=f y and y=d z+f w. Replace x by x−f z. Its differential is f² w; d w=0, so the corrected lift is a cycle of E/fE. The argument works in every degree with the prescribed line factors and is natural under chain maps.

**Check.** The [Z --p→Z] test is acyclic on both sides; replacing β by zero would fail it. The chain-map and injectivity/surjectivity helper declarations need further splitting in the continuation.

**Source.** bms1-v3, Proposition 6.12 and proof, printed pp.52–53.

### preservation-derived-completeness — Preservation of derived completeness

Target `AInfCohomology:AI.1/preservation-derived-completeness` (lemma).

**Statement.** If J is a locally finitely generated ideal and C is derived J-complete, then Lη_I C is derived J-complete.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. T is replete. J is locally finitely generated; C is derived J-complete.

**Dependencies.** `AInfCohomology:AI.1/decalage-cohomology`; `AInfCohomology:AI.1/derived-decalage`; `DerivedDeRhamCohomology:DD.1/derived-completion`; `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`; `EnhancedDerivedSheaves:E2/replete-topoi`; `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`; `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`; `EnhancedDerivedSheaves:E4/complete-module-weak-serre`; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

**Proof or construction.** Use the replete-sheaf cohomology criterion supplied by E4 from the affine DD.1 theory. The map H^i(C)→H^i(C) tensor I^(-1) has complete source and target. Its kernel is complete; the quotient by that kernel is complete. Tensor with the invertible line I^⊗i, locally a free rank-one module, and apply the cohomology criterion again.

**Check.** Closure is under kernels/cokernels of maps BETWEEN complete modules and extensions; arbitrary submodules are not covered. This statement does not commute Lη_I with J-completion.

**Source.** bms1-v3, §6.2 standing assumptions and Lemma 6.19, printed pp.53–55.

### completion-at-decalage-ideal — Completion at the décalage ideal

Target `AInfCohomology:AI.1/completion-at-decalage-ideal` (comparison).

**Statement.** For derived I-completion C→Ĉ, the canonical comparison completion_I(Lη_I C)→Lη_I Ĉ is a quasi-isomorphism.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. T is replete.

**Dependencies.** `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/bockstein-reduction`; `DerivedDeRhamCohomology:DD.1/derived-completion`; `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`; `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`; `EnhancedDerivedSheaves:E4/complete-module-weak-serre`; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

**Proof or construction.** The target is complete by preservation-derived-completeness, so the map extends along the completion unit. On a principal chart both objects are derived f-complete; reduce the comparison modulo f by derived Nakayama. Completion preserves the mod-f² coefficient sequence and its mod-f reduction, so the cohomology classes and Bockstein agree. Apply bockstein-reduction. Glue the comparison using the sheaf completion interface.

**Check.** The ideal is I on BOTH sides; an unrelated J is excluded. This inherited ID now names the first map of Lemma 6.20; its second map is completion-limit-model.

**Source.** bms1-v3, Lemma 6.20, first map, printed p.55.

### completion-limit-model — Inverse-limit comparison

Target `AInfCohomology:AI.1/completion-limit-model` (comparison).

**Statement.** The canonical map Lη_I Ĉ→Rlim_n Lη_I(C tensor^L O/I^n) is a quasi-isomorphism, where Ĉ is derived I-completion.

**Hypotheses.** (T,O) is a ringed topos. I is an invertible ideal subsheaf of O, locally generated by a nonzerodivisor. Negative tensor powers of I mean powers of its dual. T is replete.

**Dependencies.** `AInfCohomology:AI.1/completion-at-decalage-ideal`; `AInfCohomology:AI.1/bockstein-reduction`; `DerivedDeRhamCohomology:DD.1/derived-completion`; `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`; `EnhancedDerivedSheaves:E2/replete-topoi`; `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`; `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`; `EnhancedDerivedSheaves:E4/complete-module-weak-serre`; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

**Proof or construction.** All objects are derived I-complete; derived tensor with O/I commutes with this limit because O/I has the finite flat resolution [I→O]. Locally use f and a complex D of O/f-modules. Compute D tensor^L O/f^n using [O --f^n→O], so it has the zero-differential extra shifted summand. The transition n+1→n is identity on the unshifted summand and multiplication by f on the shifted summand, hence zero there on D. The extra pro-system is pro-zero. This identifies the mod-f Bockstein towers; the inverse-limit and repleteness comparison is requested from E2/E4. Conclude by the complete-object reduction criterion.

**Check.** Do not replace the derived tensor factors by naive quotients of a torsion complex. Record the transition maps: a termwise splitting alone does not prove a pro-isomorphism.

**Source.** bms1-v3, Lemma 6.20, second map and last proof paragraph, printed p.55.

### finite-shift-injective — Injectivity before completion

Target `AInfCohomology:AI.1/finite-shift-injective` (lemma).

**Statement.** Let B=Q[x], M=direct sum over n≥0 of B e_n, and S(e_0)=0, S(e_(n+1))=e_n. The B-linear endomorphism F=S−x is injective on M.

**Hypotheses.** Only the coefficient/category conventions explicitly present in the statement.

**Dependencies.** `mathlib:Finsupp`.

**Proof or construction.** For a nonzero finite sequence a choose the largest N in its support. The coefficient of e_N in F(a) is −x a_N. It is nonzero because B is a domain and a_N≠0.

**Check.** The same assertion fails on the x-adic completion, as computed below. This lemma does not use a finite-dimensional truncation with an artificial boundary condition.

**Source.** bms1-v3, Warning after Lemma 6.19, printed p.55; independent regression calculation in the companion roadmap AI.1 §7.

### restricted-sequence-completion — Completion of the test module

Target `AInfCohomology:AI.1/restricted-sequence-completion` (comparison).

**Statement.** With B,M as above, let A=B[t] act on M by t=F. The derived (x)-completion of M[0] is concentrated in degree zero and equals N={(a_n) in product Q[[x]] : for each r, all but finitely many a_n lie in x^r Q[[x]]}. The A-action extends by t(a)_n=a_(n+1)−x a_n.

**Hypotheses.** Only the coefficient/category conventions explicitly present in the statement.

**Dependencies.** `AInfCohomology:AI.1/finite-shift-injective`; `DerivedDeRhamCohomology:DD.1/derived-completion`; `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`; `mathlib:PowerSeries`; `mathlib:PowerSeries.coeff`.

**Proof or construction.** The endomorphism F is B-linear, so polynomial evaluation defines an A-module structure. Both x and t are nonzerodivisors of A; x is injective on M. The free A-resolution [A --x^r→A] of A/x^r shows M tensor^L A/x^r=(M/x^rM)[0]. The quotient transition maps are surjective, so their derived limit is their ordinary limit in degree zero. Use the regular-principal completion comparison from DD.1. Taking coordinates identifies this inverse limit with N: each finite-level vector has finite support; conversely this support condition makes every truncation a finite vector. Shift and multiplication by x preserve the restricted-sequence condition and agree with the original action on finite sequences.

**Check.** N is a restricted product, not the entire product. The natural map M→N is the usual coefficientwise inclusion.

**Source.** bms1-v3, After Lemma 6.19, printed p.55; affine completion framework in Stacks 091N.

### completed-shift-kernel — Kernel created by completion

Target `AInfCohomology:AI.1/completed-shift-kernel` (lemma).

**Statement.** For N and F in restricted-sequence-completion, ker F={ (a,xa,x²a,...) : a in Q[[x]] }. This kernel is nonzero.

**Hypotheses.** Only the coefficient/category conventions explicitly present in the statement.

**Dependencies.** `AInfCohomology:AI.1/restricted-sequence-completion`; `mathlib:PowerSeries`.

**Proof or construction.** The equation F(v)=0 is v_(n+1)=x v_n; induction gives v_n=x^n v_0. Every such sequence satisfies the restricted condition: n≥r implies x^n a is divisible by x^r. Choose a=1 to obtain a nonzero kernel element whose zeroth coordinate is 1.

**Check.** No convergence of a numerical series is being assumed: the condition is x-adic divisibility of coordinates.

**Source.** bms1-v3, Warning after Lemma 6.19, printed p.55; independent regression calculation in companion roadmap AI.1 §7.

### unrelated-completion-counterexample — Failure of unrelated completion

Target `AInfCohomology:AI.1/unrelated-completion-counterexample` (application).

**Statement.** For A=Q[x,t], I=(t), J=(x), and the module M defined above, the canonical map completion_J(Lη_t M[0])→Lη_t(completion_J M[0]) is not a quasi-isomorphism. On H^0 it is N→N/N[t], with nonzero kernel generated as Q[[x]]-module by (1,x,x²,...).

**Hypotheses.** Only the coefficient/category conventions explicitly present in the statement.

**Dependencies.** `AInfCohomology:AI.1/finite-shift-injective`; `AInfCohomology:AI.1/restricted-sequence-completion`; `AInfCohomology:AI.1/completed-shift-kernel`; `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/decalage-cohomology`; `AInfCohomology:AI.1/preservation-derived-completeness`.

**Proof or construction.** F is injective on M, so Lη_t M[0]=M[0]. Its derived J-completion is N[0]. The cohomology formula gives Lη_t N[0]=(N/N[t])[0]. Naturality of the quotient formula and the completion adjunction identify the canonical comparison with the quotient map N→N/N[t]. The displayed kernel is nonzero, so that comparison is not a quasi-isomorphism.

**Check.** This refutes the canonical comparison, not the stronger claim that the two objects can never be abstractly isomorphic. Noetherianity of A does not repair the example: M is not finitely generated. Finite truncations v_N=sum_(n<N)x^n e_n satisfy F(v_N)=−x^N e_(N−1), recording the disappearing defect.

**Source.** bms1-v3, Independent counterexample motivated by the warning after Lemma 6.19, printed p.55; not BMS1 Example 6.5.

### strongly-k-flat-replacements — Strongly K-flat representatives

Target `AInfCohomology:AI.1/strongly-k-flat-replacements` (lemma).

**Statement.** Every complex of modules on a ringed topos admits a quasi-isomorphism from a K-flat complex whose terms are flat. Such terms are I-torsion-free for an invertible ideal I; a K-flat complex alone need not have flat terms.

**Hypotheses.** Ringed topos; unbounded complexes; the enhancement supplies functorial roofs.

**Dependencies.** `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`; `EnhancedDerivedSheaves:E1`.

**Proof or construction.** Use a termwise-flat K-flat replacement, requested as a refinement of E1. The inclusion I→O is injective. Tensor it with each flat term; in a local trivialization of I this proves injectivity of multiplication by its generator. No splitting of I→O is required.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 6.1; printed p.49.

### valuation-monoidality — Monoidality over a valuation ring

Target `AInfCohomology:AI.1/valuation-monoidality` (theorem).

**Statement.** For a valuation ring R and nonzero f, the lax product map Lη_f(C) tensor^L Lη_f(D)→Lη_f(C tensor^L D) is an equivalence. For a general ring only the lax map is exported.

**Hypotheses.** R valuation ring; f nonzero; derived tensor computed with eligible replacements.

**Dependencies.** `AInfCohomology:AI.1/decalage-products`; `AInfCohomology:AI.1/principal-cohomology`.

**Proof or construction.** Reduce by filtered colimits and flat pullback to finitely presented modules over a valuation ring. Compute the cyclic torsion summands using the relative divisibility of f,g,h.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 6.8; printed p.50.

### truncation-comparison-maps — Truncation bounds for décalage

Target `AInfCohomology:AI.1/truncation-comparison-maps` (lemma).

**Statement.** There is a natural I^m⊗τ≤m C→τ≤m Lη_I C, and, if H^n(C) is I-torsion-free, τ≥n Lη_I C→I^n⊗τ≥n C. On [n,m] the two composites are multiplication by I^(m−n) under the line identifications.

**Hypotheses.** Invertible ideal I; integers n≤m; H^n(C)[I]=0 for the second map.

**Dependencies.** `AInfCohomology:AI.1/ideal-decalage-complex`; `AInfCohomology:AI.1/decalage-cohomology`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Proof or construction.** Use the explicit upper-truncated termwise-flat complex for the first map. For the lower map descend to the good-truncation boundary quotient: f[z]=0 implies [z]=0, not containment of every degree n−1 term. Check the composite on an interval in a local generator, then glue line factors.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 6.9, with repair of its printed intermediate quotient identity; printed p.51.

### connective-comparison — Connective comparison and localization

Target `AInfCohomology:AI.1/connective-comparison` (lemma).

**Statement.** For connective C whose H^0 is I-torsion-free, the lower-truncation map Lη_I C→C is natural; after inverting I it is an equivalence. An unbounded complex has the localized comparison, not an unjustified integral map in all degrees.

**Hypotheses.** Same lower-bound/torsion condition as Lemma 6.10; local inversion of the line ideal.

**Dependencies.** `AInfCohomology:AI.1/truncation-comparison-maps`.

**Proof or construction.** Take n=0 in the lower-truncation map. After inversion the termwise normalized construction agrees with the original complex.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 6.10; printed p.51.

### decalage-composition — Composition of décalage

Target `AInfCohomology:AI.1/decalage-composition` (comparison).

**Statement.** For invertible ideals I,J, Lη_I Lη_J C≃Lη_(IJ) C, naturally and compatibly with products. Locally this is division of the differential successively by generators f and g.

**Hypotheses.** Invertible ideals in the common ringed topos; eligible representatives.

**Dependencies.** `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/strongly-k-flat-replacements`.

**Proof or construction.** Use a complex termwise regular for both factors and compare the divisibility conditions. Glue the equality via the degree-i line factors.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 6.11; printed p.52.

### bockstein-comparison-map — Bockstein comparison chain map

Target `AInfCohomology:AI.1/bockstein-comparison-map` (construction).

**Statement.** For I-torsion-free C locally with generator f, send x=f^i y in (η_I C)^i to the class of y modulo f in H^i(C/f)⊗I^i. This defines a chain map from η_I C⊗O/I to the Bockstein complex; division records the trivialization and glues intrinsically.

**Hypotheses.** Termwise I-torsion-free C; quotient and line factors as in Proposition 6.12.

**Dependencies.** `AInfCohomology:AI.1/ideal-decalage-complex`; `AInfCohomology:AI.1/bockstein-differential`.

**Proof or construction.** Check dy=fz and beta[y]=[z]. Changing f by a unit rescales the degree-i factors correctly.

**Uses.**

- AInfCohomology:AI.1/bockstein-reduction: Supplies the actual comparison map.

**API.**

- `TauCeti.Decalage.bocksteinMap_component` (characterisation): Degree i sends f^i y to [y]⊗f^i.
- `TauCeti.Decalage.bocksteinMap_chain` (compatibility): The next component carries the divided differential to beta.
- `TauCeti.Decalage.bocksteinMap_natural` (functoriality): Commutes with maps of termwise regular complexes.

**Definition tests.**

- `TauCeti.Decalage.bocksteinMap_test_unit` (degenerate): For I=O both reductions are zero.
- `TauCeti.Decalage.bocksteinMap_test_zero_d` (computation): For the zero-differential two-term regular complex R in degrees 0 and 1, the comparison modulo f is a quasi-isomorphism; both cohomologies are the ordinary quotient R/f.
- `TauCeti.Decalage.bocksteinMap_test_f2` (computation): For [R --f²→R], reduction after eta has zero differential, while the original f-complex Bockstein calculation detects the correct scaling.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 6.12 proof; printed p.52.

### bockstein-map-injectivity — Injectivity of the Bockstein comparison

Target `AInfCohomology:AI.1/bockstein-map-injectivity` (lemma).

**Statement.** The comparison map induces injective cohomology maps; a class mapping to a Bockstein boundary is a boundary modulo I in η_I C.

**Hypotheses.** Proposition 6.12 hypotheses.

**Dependencies.** `AInfCohomology:AI.1/bockstein-comparison-map`.

**Proof or construction.** Lift the Bockstein boundary in C and use termwise regularity to remove the residual I multiple.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 6.12 proof, injectivity argument; printed p.52.

### bockstein-map-surjectivity — Surjectivity of the Bockstein comparison

Target `AInfCohomology:AI.1/bockstein-map-surjectivity` (lemma).

**Statement.** Every Bockstein cocycle class lifts to a cocycle modulo I in η_I C, giving the surjectivity of the comparison on cohomology.

**Hypotheses.** Proposition 6.12 hypotheses.

**Dependencies.** `AInfCohomology:AI.1/bockstein-comparison-map`.

**Proof or construction.** Lift a representative with differential divisible by I. The vanishing beta condition permits a correction whose new divided differential is an I multiple.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 6.12 proof, surjectivity argument; printed p.53.

### flat-and-nonflat-base-change — Base-change criterion for décalage

Target `AInfCohomology:AI.1/flat-and-nonflat-base-change` (theorem).

**Statement.** Lη commutes with flat pullback of ringed topoi. For the nonflat coefficient reductions used in AΩ, prove the specific comparison by the finite Witt toric calculation and the Bockstein/Tor criterion; no universal base-change theorem is asserted without its own hypotheses.

**Hypotheses.** For flat pullback, pullback of the ideal remains invertible and pullback is exact. For the nonflat applications use the regular finite coefficient quotient, termwise flat representative and injectivity/Tor conditions explicitly verified in AI.3–AI.4.

**Dependencies.** `AInfCohomology:AI.1/strongly-k-flat-replacements`; `AInfCohomology:AI.1/bockstein-reduction`.

**Proof or construction.** For flat maps, pullback preserves termwise I-torsion-freeness and the defining kernel/image submodules. The nonflat applications use the explicitly computed comparison maps, not Lemma 6.15, which is the completeness criterion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 6.14; Theorem 9.4(i); printed pp.53–70.

### completed-sum-cohomology — Cohomology of completed direct sums

Target `AInfCohomology:AI.1/completed-sum-cohomology` (lemma).

**Statement.** In a replete ringed topos with J locally principal, let C_i be derived J-complete, H^0(C_i) classically J-complete, and H^0(C_i)[J^infinity]=H^0(C_i)[J^n] for a single n independent of i. The H^0 of the derived J-completed direct sum is the classical completion lim_k direct-sum_i H^0(C_i)/J^k. The analogous degree-q statement follows by shifting each C_i and imposing these hypotheses on H^q.

**Hypotheses.** Replete ringed topos; J locally generated by one element. Each indicated cohomology module classically complete and its J-power torsion uniformly bounded in the family.

**Dependencies.** `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`; `EnhancedDerivedSheaves:E4/complete-cohomology-criterion`; `DerivedDeRhamCohomology:DD.1/filtered-completion`.

**Proof or construction.** Derived completion of a direct sum of derived complete modules has no negative cohomology: its possible inverse-limit torsion obstruction injects into the zero product obstruction. Use the cohomology/completion spectral sequence and the uniform bound to get ordinary separated completion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 6.17; Lemma 6.18; printed p.54.

### filtered-beilinson-description — Filtered décalage as Beilinson truncation

Target `AInfCohomology:AI.1/filtered-beilinson-description` (theorem).

**Statement.** For an invertible ideal I, the filtered object Fil^i=I^i⊗K (i∈Z, transitions from I→O) has Beilinson connective cover τ_B≤0 Fil whose underlying object is Lη_I K. Underlying means the colimit as i tends to minus infinity. The graded pieces agree with the Bockstein/good-truncation description, compatibly with products.

**Hypotheses.** K in the enhanced unbounded derived category; Cartier ideal I.

**Dependencies.** `DerivedDeRhamCohomology:DD.1/beilinson-t-structure`; `DerivedDeRhamCohomology:DD.1/beilinson-heart`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/derived-decalage`.

**Proof or construction.** Apply Beilinson truncation to the explicit I-power filtration. Identify the local divided-differential model and compute its graded pieces. Use the symmetric monoidal filtered enhancement for the lax product coherence.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms2, Proposition 5.8; Remark 5.9; Corollary 5.10; printed pp.32–33.

### koszul-decalage-calculation — Dé­calage of commuting Koszul operators

Target `AInfCohomology:AI.1/koszul-decalage-calculation` (theorem).

**Statement.** For f regular and a complex M of f-torsion-free modules, let regular scalars g_i each divide f or be divisible by f. If some g_i divides f, η_f(M tensor K(g_i)) is acyclic. If f divides every g_i, η_f(M tensor K(g_i))≅η_f M tensor K(g_i/f). The toric gamma_i−1 calculation is obtained weightwise from these scalar statements; a general commuting-endomorphism Koszul carrier is requested from DD.1.

**Hypotheses.** f and every g_i regular; M termwise f-torsion-free; pairwise commuting scalar operators; exterior signs and cohomological degrees 0 through d.

**Dependencies.** `DerivedDeRhamCohomology:DD.1/koszul-complex`; `DerivedDeRhamCohomology:DD.1`; `AInfCohomology:AI.1/principal-complex`.

**Proof or construction.** In the divides-f case multiplication by f is null-homotopic on the Koszul complex, so its cohomology is killed by f. In the divisible-by-f case compare termwise divided differentials and the degree scaling. For toric operators first decompose into scalar weight summands.

**Check.** For commuting scalars f² and f³ on R, eta gives K(R;f,f²), including the degree-two differential (−f²,f). For a unit first operator the Koszul pair is contractible.

**Source.** bms1-v3, Definitions 7.1–7.2; Lemma 7.9; printed pp.56–59.

### koszul-products-and-cohomology — Koszul products and integral cohomology

Target `AInfCohomology:AI.1/koszul-products-and-cohomology` (theorem).

**Statement.** For commuting A-algebra automorphisms gamma_i of a possibly noncommutative A-algebra R, K_R(gamma_i−1) has the source DGA product: x_i x_j=−x_j x_i, x_i²=0, x_i a=gamma_i(a)x_i, d(x_i)=0 and d(a)=sum_i(gamma_i(a)−a)x_i. It induces the group-cohomology cup product. If multiplication by g on a complex M is nullhomotopic, 0→H^(n−1)(M)→H^n(M tensor K_R(g))→H^n(M)→0 splits. If all scalar g_i are divisible by g and one is g times a unit, H^n(K_M(g_1,…,g_m))≅Ann_M(g)^(binom(m−1,n)) ⊕ (M/gM)^(binom(m−1,n−1)).

**Hypotheses.** For the product: A commutative, R an A-algebra, and gamma_i commuting A-algebra automorphisms. For the split sequence: a specified nullhomotopy of multiplication by g. For the scalar formula: m≥1, all g_i divisible by g and one g_i equal to g times a unit; binomial terms outside their range are zero.

**Dependencies.** `DerivedDeRhamCohomology:DD.1/koszul-complex`; `AInfCohomology:AI.1/koszul-decalage-calculation`.

**Proof or construction.** Construct the twisted DGA by the displayed relations and verify the Leibniz rule and group-cohomology product. Use the nullhomotopy to split the mapping-cone cohomology sequence. Reorder the unit-multiple scalar first and induct to get the annihilator/quotient formula.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 7.5, Remark 7.8, Lemma 7.10; printed pp.57–59.

### continuous-cochains-koszul — Continuous cochains and Koszul complexes

Target `AInfCohomology:AI.1/continuous-cochains-koszul` (comparison).

**Statement.** Let Gamma_disc=Z^d with generators gamma_i and Gamma=Z_p^d. If N=lim_k N_k is a topological abelian group, each N_k a discrete continuous Gamma-module killed by p^k, then RΓ_cont(Gamma,N)→RΓ(Gamma_disc,N) is a quasi-isomorphism and both are computed by K_N(gamma_1−1,…,gamma_d−1). The topology on N is the limit topology; this does not identify cohomology for arbitrary discrete Gamma-modules.

**Hypotheses.** N=lim_{k≥1} N_k with its inverse-limit topology; N_k discrete continuous Gamma-modules killed by p^k. Replace N_k by the images of N if needed to make the transitions surjective.

**Dependencies.** `mathlib:continuousCohomology`; `DerivedDeRhamCohomology:DD.1/koszul-complex`; `AInfCohomology:AI.1/completed-sum-cohomology`.

**Proof or construction.** For each finite reduction use the standard completed Iwasawa resolution; compare it with the ordinary resolution for Gamma_disc. Pass to the inverse limit with surjective transitions and the controlled completed-sum comparison. The pinned continuousCohomology carrier still needs the recorded forgetful/derived-limit interface.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 7.3 and its finite-reduction hypotheses; printed p.56.

### dieudonne-consumer-contract — Dé­calage interface for Dieudonné consumers

Target `AInfCohomology:AI.1/dieudonne-consumer-contract` (comparison).

**Statement.** The generic p-complete Lη_p and Bockstein/filtered interfaces specialize to the η_p used for saturation and the Beilinson construction of the Nygaard filtration in BLM. CR.4 owns the strict Dieudonné fixed-point equivalence and the Nygaard filtration itself; AI.1 supplies the completion-compatible lax functor.

**Hypotheses.** p a nonzerodivisor on the complex; derived p-completion for the fixed-point category.

**Dependencies.** `AInfCohomology:AI.1/completion-at-decalage-ideal`; `AInfCohomology:AI.1/filtered-beilinson-description`; `CrystallineCohomology:CR.4/leta-fixed-point`; `CrystallineCohomology:CR.4/nygaard-filtration-comparisons`.

**Proof or construction.** Identify normalized eta with the saturated-complex definition on termwise p-torsion-free representatives. Check Bockstein and filtered products before applying the CR.4 equivalences.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** blm, §§2.2–2.4, printed pp.14–18; §§7.2–7.4, pp.86–94; §8.4, pp.104–107.

### eta-quotient-base-change — Nonflat quotient base change for décalage

Target `AInfCohomology:AI.1/eta-quotient-base-change` (theorem).

**Statement.** Let f and g be nonzerodivisors in A. If every H^i(K⊗^L_A A/f) has no nonzero g-torsion, the natural map (Lη_f K)⊗^L_A A/g→Lη_f(K⊗^L_A A/g) is an equivalence. On the right f denotes its image and décalage is computed on representatives on which division is defined. The condition concerns derived reduction of K, not just H^i(K)/f.

**Hypotheses.** A commutative ring, f and g nonzerodivisors; K∈D(A). The f-décalage on A/g has its usual invertible-ideal interpretation where required by the application; in CK applications (f,g) is the specified regular coefficient pair.

**Dependencies.** `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/bockstein-reduction`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Proof or construction.** Compare the two complexes on termwise-flat representatives. Use the g-torsion-free hypothesis on derived mod-f cohomology to remove the Tor obstruction in the divided differential. This is the base-change lemma CK applies, not general commutation of Lη with completion.

**Check.** Taking g a unit gives the zero comparison on both sides. The hypothesis must be tested on derived mod-f cohomology; ordinary reduction is not an acceptable replacement.

**Source.** CK, Lemma 3.24, printed p.19.

### semistable-almost-decalage — Derived-reduction almost-to-integral criterion

Target `AInfCohomology:AI.1/semistable-almost-decalage` (theorem).

**Statement.** If b:B→B′ in D(A_inf) has W(m^flat)-annihilated cone cohomology and every H^i(B⊗^L A_inf/mu) has no nonzero W(m^flat)-annihilated element, then Lη_mu(b) is an equivalence. This criterion uses the source derived reduction; it does not identify Lη of a cone with the cone of Lη.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Both conditions hold in every cohomological degree. W(m^flat) is the Witt residue-kernel ideal, without an idempotence assumption.

**Dependencies.** `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/decalage-cohomology`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0/witt-almost-ideal`.

**Proof or construction.** Derived mod-mu reduction gives the short exact sequence of Bockstein complexes in CK proof 3.18, using the source no-almost-zero hypothesis. The mod-mu cone of Lη_mu(b) vanishes. Thus mu acts invertibly on its cohomology. After mu-localization b is already an equivalence because mu belongs to W(m^flat); conclude that the cone vanishes.

**Check.** Do not invoke exactness of Lη as a triangulated functor. Almostness alone, without the derived-reduction source hypothesis, is insufficient.

**Source.** CK, Lemma 3.18 and proof, printed p.16.

### completed-continuous-sum — Continuous cohomology of completed coefficient sums

Target `AInfCohomology:AI.1/completed-continuous-sum` (theorem).

**Statement.** Let H be profinite, i≥0 and M_j p-adically complete p-torsion-free continuous H-modules. If either every H^i_cont(H,M_j) is p-torsion-free, or a single p^n annihilates them all, the coordinate map H^i_cont(H,⊕̂_j M_j)→∏_j H^i_cont(H,M_j) is injective. Consequently the completed-sum cohomology is respectively p-torsion-free or killed by that same p^n. Completion is p-adic and the bound is uniform in j.

**Hypotheses.** The topology on ⊕̂_j M_j is the completed direct-sum topology; all actions are continuous. The alternatives and p-torsion-freeness of the coefficient modules are part of the hypotheses.

**Dependencies.** `AInfCohomology:AI.1/continuous-cochains-koszul`; `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`.

**Proof or construction.** Write a cocycle coordinatewise. Its coordinate p-adic orders tend to infinity. Choose primitives at those orders, or with the fixed loss n in the bounded-torsion case. The primitives still tend to zero and form a cochain in the completed sum.

**Check.** A nonuniform family of exponents cannot be used to conclude one fixed annihilator. This is injectivity into a product, not surjectivity or a claim of commutation with an arbitrary direct sum.

**Source.** CK, Lemma 3.6 and proof, printed p.12.

## AI.2 — BKF modules, lattices and modifications

Generic A_inf commutative algebra precedes BKF realization and proper cohomology. Classify finite free BKF modules by pairs (T,Ξ); use integral Witt descent for torsion modules without claiming a torsion Fargues classification. Essential surjectivity retains the SW annulus, Robba and analytic-boundary extension chain.

### valuation-special-fiber-bound — Valuation submodule dimension bound

Target `AInfCohomology:AI.2/valuation-special-fiber-bound` (lemma).

**Statement.** For E⊂(C^flat)^d an O_C^flat-submodule, dim_k(E⊗k)≤d.

**Hypotheses.** No finite generation assumed for E.

**Dependencies.** `PerfectoidSpaces:P1`; `mathlib:ModuleCat`.

**Proof or construction.** Every finitely generated torsion-free submodule is finite free of rank≤d. A hypothetical larger independent residue family would lift to such a submodule.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.7, printed pp.35–36.

### valuation-lattice-criterion — Residue-dimension criterion for a lattice

Target `AInfCohomology:AI.2/valuation-lattice-criterion` (lemma).

**Statement.** If D⊂(C^flat)^d and dim_k(D⊗k)=d, then D is finite free of rank d.

**Hypotheses.** D an O_C^flat-submodule; C^flat algebraically closed valuation field.

**Dependencies.** `AInfCohomology:AI.2/valuation-special-fiber-bound`.

**Proof or construction.** In rank one distinguish a principal fractional ideal, m times a principal fractional ideal, and the field. Induct by a saturated rank-one submodule and its torsion-free quotient.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.8, printed pp.35–36; fractional-ideal correction PAPER-BHATT-MORROW-SCHOLZE-18/E2.

### linear-module-patching — Linear module patching across a principal divisor

Target `AInfCohomology:AI.2/linear-module-patching` (theorem).

**Statement.** For any commutative ring R and non-zero-divisor f, let Rhat be its f-adic completion. Base extension is an equivalence from f-torsion-free R-modules to triples (N,P,beta), with N an f-torsion-free Rhat-module, P an R[1/f]-module and beta:N[1/f]≅P tensor_R Rhat. The inverse is the fiber product in the common overlap. A module is finite projective exactly when both members of its triple are finite projective; morphisms are pairs commuting with beta.

**Hypotheses.** No Noetherian hypothesis. Completion need not be flat. The specified overlap is Rhat[1/f], and f is regular on N.

**Dependencies.** `mathlib:ModuleCat`; `mathlib:AdicCompletion`; `mathlib:TensorProduct`.

**Proof or construction.** Form the equalizer of the two maps N⊕P→N[1/f], using beta. Use regularity of f and the f-adic approximation argument to recover both scalar extensions, then the Hom equalizer. Apply the finite-projective patching criterion to obtain the restriction of the equivalence used by BKF lattices.

**Check.** Keep f-torsion-freeness, the overlap map and morphism compatibility; a bare pair of modules is insufficient.

**Source.** sw20, Lemma 5.2.9, printed p.38 (PDF p.48).

### punctured-spectrum-triviality — Kedlaya triviality on the punctured spectrum

Target `AInfCohomology:AI.2/punctured-spectrum-triviality` (theorem).

**Statement.** Finite free A_inf-modules restrict equivalently to vector bundles on U=Spec(A_inf) minus its closed point; the inverse is H^0(U,−). This algebraic U is distinguished from the analytic punctured Spa used subsequent.

**Hypotheses.** C as above; vector bundles of finite rank.

**Dependencies.** `AInfCohomology:AI.2/valuation-lattice-criterion`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.2/linear-module-patching`.

**Proof or construction.** Patch on the source two opens and compute the intersection lattice. Use the valuation residue-dimension criterion and p-completeness to prove it is finite free.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.6, printed pp.34–35.

### ainf-module-perfectness — Perfectness of finitely presented A_inf modules

Target `AInfCohomology:AI.2/ainf-module-perfectness` (lemma).

**Statement.** A finitely presented A_inf-module M with M[1/p] finite free is perfect as an A_inf complex.

**Hypotheses.** M finitely presented; M[1/p] finite free; C as above; x=[varpi^flat] nonzero topologically nilpotent.

**Dependencies.** `AInfCohomology:AI.0/witt-coherence`; `AInfCohomology:AI.0/witt-finite-presentation-devissage`; `AInfCohomology:AI.0/period-regularity`.

**Proof or construction.** Use finite Witt coherence for p-power-torsion modules, then devissage after embedding into a p-local free module.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.9(i); printed p.35.

### ainf-bounded-torsion — Bounded and finitely presented A_inf torsion

Target `AInfCohomology:AI.2/ainf-bounded-torsion` (lemma).

**Statement.** For such M, M_tor is killed by p^n for some n and is finitely presented and perfect.

**Hypotheses.** M finitely presented; M[1/p] finite free; C as above; x=[varpi^flat] nonzero topologically nilpotent.

**Dependencies.** `AInfCohomology:AI.0/witt-coherence`; `AInfCohomology:AI.0/witt-finite-presentation-devissage`; `AInfCohomology:AI.0/period-regularity`.

**Proof or construction.** Bound p-torsion by a finite presentation and use the finite Witt coherent submodule criterion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.9(ii); printed p.35.

### ainf-tor-bounds — Tor bounds for A_inf modules

Target `AInfCohomology:AI.2/ainf-tor-bounds` (lemma).

**Statement.** Such M has Tor-dimension≤2, Tor_2^(A_inf)(M,W(k))=0; if M has no x-torsion, Tor_i(M,W(k))=0 for i>0, where x=[varpi^flat] is a topologically nilpotent Teichmuller parameter.

**Hypotheses.** M finitely presented; M[1/p] finite free; C as above; x=[varpi^flat] nonzero topologically nilpotent.

**Dependencies.** `AInfCohomology:AI.0/witt-coherence`; `AInfCohomology:AI.0/witt-finite-presentation-devissage`; `AInfCohomology:AI.0/period-regularity`.

**Proof or construction.** Resolve over finite Witt valuation rings and use the x-root filtered quotient model of W(k).

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.9(iii); printed p.35.

### punctured-vector-bundle-criterion — Vector-bundle criterion and p-local freeness

Target `AInfCohomology:AI.2/punctured-vector-bundle-criterion` (lemma).

**Statement.** A finitely generated p-torsion-free M with M[1/p] finite projective defines a vector bundle on U. Consequently every finite projective A_inf[1/p]-module is finite free.

**Hypotheses.** A_inf=W(O_C^flat) for C complete algebraically closed of characteristic zero; U is Spec(A_inf) minus its closed point. M is finitely generated and p-torsion-free, with M[1/p] finite projective.

**Dependencies.** `AInfCohomology:AI.2/punctured-spectrum-triviality`.

**Proof or construction.** On D(p), use the assumed projectivity. The only remaining prime of U containing p is (p). Show A_inf,(p) is a DVR with uniformizer p: a nonzero Witt vector has a first nonzero p-adic coefficient, whose Teichmuller representative is a unit after localization at (p). A finite p-torsion-free module over this DVR is free. Apply punctured-spectrum triviality; extend a finite projective A_inf[1/p]-module by a finitely generated p-torsion-free lattice to prove Corollary 4.12.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.10, printed pp.36–37; Corollary 4.12, p.37.

### ainf-module-structure — A_inf module structure theorem

Target `AInfCohomology:AI.2/ainf-module-structure` (theorem).

**Statement.** For finitely presented M with M[1/p] finite projective, there is a functorial exact sequence 0→M_tor→M→M_free→M_bar→0. M_free is finite free; M_tor is perfect and bounded p-power torsion; M_bar is finitely presented perfect and killed by a power of (p,x). If M⊗W(k) is p-torsion-free, or M⊗O_C is p-torsion-free in mixed characteristic, then M is finite free.

**Hypotheses.** Source hypotheses on M; ordinary scalar extensions in the last criterion.

**Dependencies.** `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-bounded-torsion`; `AInfCohomology:AI.2/punctured-vector-bundle-criterion`.

**Proof or construction.** Extend M/M_tor from U by global sections. Its finite closed-point-supported cokernel yields the four-term exact sequence. Compare generic and residue rank by Fitting ideals for the freeness criterion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 4.13, printed pp.37–38.

### bkf-module — Breuil–Kisin–Fargues module

Target `AInfCohomology:AI.2/bkf-module` (definition).

**Statement.** A BKF module is a finitely presented A_inf-module M, finite free after inverting p, with a phi-semilinear isomorphism M[1/xi]→M[1/tilde-xi]. Equivalently its linearization is phi^*M[1/tilde-xi]≅M[1/tilde-xi]; morphisms commute with the linearized Frobenius. Finite free and minuscule are additional conditions.

**Hypotheses.** Perfectoid field and chosen kernel generator; p-local finite freeness; semilinearity uses the existing Witt Frobenius.

**Dependencies.** `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `mathlib:LocalizedModule`.

**Proof or construction.** Use localization and scalar restriction/extension on existing ModuleCat objects. Transport xi to tilde-xi under Frobenius and prove the linearization dictionary.

**Uses.**

- AInfCohomology:AI.5/global-bkf: Proper cohomology is a BKF object.
- AInfCohomology:AI.2/fargues-classification: Finite free objects are classified by pairs.

**API.**

- `TauCeti.BKF.Module_linearized` (equivalence): Semilinear and linearized Frobenius presentations agree with localization at tilde-xi.
- `TauCeti.BKF.Module_hom` (characterisation): Morphisms are A_inf-linear maps commuting with localized Frobenius.
- `TauCeti.BKF.Module_ext` (extensionality): A morphism is determined by its underlying A_inf-linear map.
- `TauCeti.BKF.Module_unit` (constructor): The unit is A_inf with Witt Frobenius.
- `TauCeti.BKF.Module_twist` (constructor): A_inf{n} is finite free BKF with the source Frobenius factor.
- `TauCeti.BKF.Module_base_change` (compatibility): Eligible perfectoid coefficient change preserves the linearized presentation.
- `TauCeti.BKF.Module_twist_frobenius` (compatibility): On the conormal basis of A_inf{1}, the linearized Frobenius coefficient is tilde-xi^(-1), not 1; use the Frobenius-pulled source basis.

**Definition tests.**

- `TauCeti.BKF.Module_test_unit` (compatibility): The unit has étale realization Z_p and de Rham lattice B_dR^+.
- `TauCeti.BKF.Module_test_twist` (computation): A_inf{1} has étale realization Z_p(1), not the untwisted unit with identity Frobenius.
- `TauCeti.BKF.Module_test_torsion` (non-example): The object A_inf/p with Frobenius is allowed in the finitely presented category but is outside the finite-free Fargues equivalence.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Definition 4.22; printed p.40.

### bkf-valid-operations — Operations in valid BKF subcategories

Target `AInfCohomology:AI.2/bkf-valid-operations` (lemma).

**Statement.** The finite free BKF subcategory has tensor products, duals and internal Homs with localized Frobenius; the larger finitely presented BKF category is an exact tensor category with invertible Tate twist, but is not closed under arbitrary cokernels. The map A_inf⊗Z_p(1)→A_inf{1} has cokernel modeled by A_inf/(mu), which fails p-local projectivity. Kernel/cokernel closure is asserted only for the variant with specified compatible crystalline rigidification discussed after Lemma 4.27.

**Hypotheses.** C complete algebraically closed of characteristic zero for the cyclotomic counterexample. Tensor-dual/internal-Hom closure here is in the finite free subcategory. For abelian closure retain the specified crystalline comparison and require morphisms to respect it; this variant is not the unrigidified BKF category.

**Dependencies.** `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/ainf-module-structure`.

**Proof or construction.** Tensor and dualize the localized Frobenius equivalences of finite free modules. Use the dlog inclusion into the intrinsic twist and Example 4.23 to exhibit failure of cokernel closure. For the separately rigidified variant use Lemma 4.19 and the compatible crystalline map to check the p-local condition on kernels and cokernels.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Examples 4.23–4.24, Remark 4.25; discussion following Lemma 4.27; printed pp.40–42.

### lattice-pair — Étale lattice and de Rham lattice pair

Target `AInfCohomology:AI.2/lattice-pair` (definition).

**Statement.** A lattice pair (T,Xi) has T finite free over Z_p and Xi a finite free B_dR^+-submodule of T⊗Z_p B_dR spanning that ambient B_dR-vector space. Morphisms are Z_p-linear maps whose B_dR scalar extensions preserve Xi.

**Hypotheses.** Common B_dR^+ discrete valuation ring and B_dR supplied by R06.1; finite ranks.

**Dependencies.** `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `mathlib:TensorProduct`.

**Proof or construction.** Use a submodule of the existing scalar-extension carrier, with lattice conditions. Use tensor and dual lattices with their actual ambient identifications.

**Uses.**

- AInfCohomology:AI.2/fargues-classification: This is the target category of the classification.

**API.**

- `TauCeti.BKF.LatticePair_standard` (constructor): The standard pair is (T,T⊗B_dR^+).
- `TauCeti.BKF.LatticePair_hom` (characterisation): A Z_p-linear map is a pair morphism exactly when its scalar extension carries Xi into Xi′.
- `TauCeti.BKF.LatticePair_ext` (extensionality): Morphisms agree if their maps on T agree.
- `TauCeti.BKF.LatticePair_tensor` (constructor): Tensor pairs use Xi⊗Xi′ inside (T⊗T′)⊗B_dR.
- `TauCeti.BKF.LatticePair_dual` (constructor): The dual lattice consists of functionals taking Xi into B_dR^+.
- `TauCeti.BKF.LatticePair_bounds` (characterisation): Every lattice lies between xi^n and xi^(-n) multiples of the standard lattice for some n.

**Definition tests.**

- `TauCeti.BKF.LatticePair_test_zero` (degenerate): The rank-zero pair is the zero module and zero lattice.
- `TauCeti.BKF.LatticePair_test_shift` (computation): (Z_p,xi^(-1)B_dR^+) is a nonstandard rank-one modification.
- `TauCeti.BKF.LatticePair_test_nospan` (non-example): The zero submodule of B_dR is not a lattice for T=Z_p.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 4.28, printed pp.42–43; sw20, Proposition 12.4.6, printed pp.106–107; Theorem 14.1.1, printed pp.115–116.

### integral-frobenius-descent — Integral Witt Frobenius descent

Target `AInfCohomology:AI.2/integral-frobenius-descent` (theorem).

**Statement.** For an algebraically closed perfect characteristic-p field F, invariants and W(F) scalar extension give inverse equivalences between finite W(F)-modules with bijective semilinear Witt Frobenius and finite Z_p-modules. The canonical map W(F) tensor_Z_p M^(phi=1)→M is an isomorphism, including p-power-torsion modules. It preserves the finite-free subcategories, morphisms and tensor products.

**Hypotheses.** p prime. Witt Frobenius is an automorphism. The Z_p coefficient map is canonical and Frobenius-fixed; F=C^flat is the BKF application.

**Dependencies.** `mathlib:WittVector`; `mathlib:ModuleCat`; `mathlib:TensorProduct`.

**Proof or construction.** In the free case apply Artin–Schreier–Witt descent and algebraic closedness to trivialize the Frobenius module. Apply the finite-level descent statement over W_n(F) to torsion modules and pass through finite p-power filtrations; finite W(F)-modules split into free and bounded-torsion parts over the DVR. Identify the natural invariant/scalar-extension maps, including morphisms and tensor compatibility. This integral assertion precedes and differs from rational isocrystal classification.

**Check.** Retain finite torsion modules: W(F)/p descends to F_p, not to a free Z_p-module.

**Source.** bms1-v3, Lemma 4.26 and its proof, printed pp.41–42; sw20, Theorem 12.3.4 and proof, printed p.104 (PDF p.114).

### bkf-etale-realization — Étale realization of BKF modules

Target `AInfCohomology:AI.2/bkf-etale-realization` (construction).

**Statement.** For any BKF module M, T(M)=(M⊗A_inf W(C^flat))^(phi=1) is finite over Z_p, and T(M)⊗Z_p W(C^flat)≅M⊗A_inf W(C^flat). For finite free M, T(M) is finite free; Xi(M)=M⊗A_inf B_dR^+ embeds as a lattice in T(M)⊗B_dR. Moreover M tensor A_inf[1/mu]=T(M) tensor A_inf[1/mu] as submodules of the common W(C^flat) extension.

**Hypotheses.** C algebraically closed; use the source completed Witt localization W(C^flat), not the fraction field of A_inf.

**Dependencies.** `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.2/lattice-pair`; `AInfCohomology:AI.2/integral-frobenius-descent`.

**Proof or construction.** Apply the integral Frobenius descent theorem in this AI.2 layer to finite W(C^flat)-modules, including torsion; do not infer it from rational isocrystal classification. Reduce the mu-inverted equality to finite free M via Proposition 4.13. Twist to make inverse Frobenius integral, use minimal valuations of Witt coefficients to put invariants in M, and apply the argument to the dual for the reverse inclusion. Use the common map to B_dR to obtain the finite-free lattice.

**Uses.**

- AInfCohomology:AI.2/fargues-classification: The forward functor is (T(M),Xi(M)).

**API.**

- `TauCeti.BKF.etale_finite` (characterisation): T(M) is finite; finite free when M is finite free.
- `TauCeti.BKF.etale_descent` (equivalence): The Frobenius-invariant reconstruction holds over W(C^flat).
- `TauCeti.BKF.etale_lattice` (constructor): For finite free M the B_dR^+ realization is the lattice Xi(M).
- `TauCeti.BKF.etale_tensor` (compatibility): Étale realization preserves finite-free tensor products and twists.
- `TauCeti.BKF.etale_mu_comparison` (equivalence): M tensor A_inf[1/mu]≅T(M) tensor A_inf[1/mu] in the common W(C^flat) extension.

**Definition tests.**

- `TauCeti.BKF.etale_test_unit` (computation): T(A_inf)=Z_p.
- `TauCeti.BKF.etale_test_twist` (compatibility): T(A_inf{1})=Z_p(1).
- `TauCeti.BKF.etale_test_p_torsion` (computation): T(A_inf/p)=F_p, so finite presentation does not imply a free Z_p realization.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemmas 4.26–4.27, printed pp.41–43.

### fargues-full-faithfulness — Full faithfulness of Fargues realization

Target `AInfCohomology:AI.2/fargues-full-faithfulness` (theorem).

**Statement.** The functor from finite free BKF modules to pairs (T,Xi) is fully faithful. Its early algebraic intersection proof depends on §4.2 and period maps, independently of the subsequent proper cohomology theorem.

**Hypotheses.** C algebraically closed; finite free source objects.

**Dependencies.** `AInfCohomology:AI.2/bkf-etale-realization`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.0/witt-limit-and-mu-kernel`.

**Proof or construction.** Identify a map after W(C^flat) extension by its map on T. Intersect the integral A_inf lattice with the B_dR^+ condition to recover an A_inf-linear Frobenius-compatible map.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Remark 4.29, using Lemmas 3.23 and 4.26 (Theorem 4.28 is the statement only); printed pp.27–43.

### integral-robba-frobenius-descent — Integral Robba Frobenius descent and no-leg shtukas

Target `AInfCohomology:AI.2/integral-robba-frobenius-descent` (theorem).

**Statement.** On the punctured analytic Y^an for C^flat, finite free phi-modules over the integral extended Robba ring Rtilde_int, finite free phi-modules over W(C^flat), and finite free Z_p-modules are equivalent. The first functor is coefficient extension and the second is phi-invariants. Shtukas over Spa(C^flat) with no legs, namely phi-vector bundles on Y_[0,infinity), are equivalent to these categories.

**Hypotheses.** C complete algebraically closed perfectoid of characteristic zero. Use the existing Y and its intervals and Frobenius, with the integral Robba rings of SW Definition 12.3.1. Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Dependencies.** `AInfCohomology:AI.2/integral-frobenius-descent`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`; `PerfectoidSpaces:P1`.

**Proof or construction.** Show equality of integral Robba and Witt Frobenius invariants by the Newton-polygon argument. Use integral Witt descent for essential surjectivity. Descend a phi^-1-module to a sufficiently small Y_[0,r] and extend successively by inverse Frobenius to Y_[0,infinity); these extensions recover the given localization.

**Check.** Keep the integral coefficient ring and bijective semilinear Frobenius; rational isocrystals alone do not supply this equivalence.

**Source.** sw20, Definition 12.3.1, Theorem 12.3.4 and Proposition 12.3.5, printed pp.103–104 (PDF pp.113–114).

### annulus-isocrystal-classification — Isocrystal origin of analytic annulus Frobenius modules

Target `AInfCohomology:AI.2/annulus-isocrystal-classification` (theorem).

**Statement.** Fix a section k→O_C^flat of the residue map, inducing L=W(k)[1/p]→A_inf[1/p]. For a phi-vector bundle E on Y_[r,infinity), 0≤r<infinity, there is a finite-dimensional isocrystal M over L and a phi-equivariant isomorphism E≅M tensor_L O_Y_[r,infinity). The isocrystal carrier and its Witt Frobenius already exist in Mathlib; the new target is this analytic classification.

**Hypotheses.** C complete algebraically closed perfectoid, k its residue field, and the specified section. Use the shared analytic intervals and their Frobenius pullbacks. Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Dependencies.** `mathlib:WittVector.Isocrystal`; `mathlib:WittVector.FractionRing.frobenius`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`; `AInfCohomology:AI.2/integral-robba-frobenius-descent`.

**Proof or construction.** Use Frobenius pullback to extend the interval toward zero without changing its phi-module category. Identify phi-vector bundles with phi-modules over the extended Robba ring. Apply Kedlaya’s analytic classification in the stated residue-field section; retain the induced L-coefficient map. Smaller Newton-polygon and slope arguments remain inside this proof.

**Check.** Do not substitute an algebraic vector-bundle classification on the curve for the analytic interval theorem.

**Source.** sw20, Theorem 13.4.1, Remark 13.4.2 and Definition 13.4.3, printed pp.111–113 (PDF pp.121–123).

### frobenius-extension-infinity — Unique Frobenius extension across infinity

Target `AInfCohomology:AI.2/frobenius-extension-infinity` (theorem).

**Statement.** For 0≤r<infinity, restriction from phi-vector bundles on Y_[r,infinity] to phi-vector bundles on Y_[r,infinity) is an equivalence. In particular a one-leg shtuka becomes a phi-module beyond the radius of its leg and extends uniquely across x_L; this is the extension at infinity required by finite-free BKF reconstruction.

**Hypotheses.** Shared Y, x_L, radius function and Frobenius. The algebraically closed C used for analytic classification supplies essential surjectivity; full faithfulness also holds over a general perfectoid field. Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Dependencies.** `AInfCohomology:AI.2/annulus-isocrystal-classification`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

**Proof or construction.** For full faithfulness reduce to invariant sections of an internal Hom. Use the Newton-polygon argument of Proposition 13.3.2 to extend Frobenius eigenvectors across x_L. For essential surjectivity extend the isocrystal representative by scalar extension to Y_[r,infinity], then glue it to the shtuka on its bounded part.

**Check.** Retain both interval endpoints and uniqueness; the leg is outside the phi-module tail.

**Source.** sw20, Theorem 13.2.1, Remark 13.2.2, Proposition 13.3.2 and Theorem 13.4.1, printed pp.109–111 (PDF pp.119–121).

### analytic-vector-bundle-extension — Finite free A_inf modules and bundles on punctured analytic Y

Target `AInfCohomology:AI.2/analytic-vector-bundle-extension` (theorem).

**Statement.** Restriction of finite free A_inf-modules to the punctured analytic Y^an induces an equivalence with finite-rank vector bundles on Y^an. This is distinct from the algebraic punctured spectrum U=Spec(A_inf) minus its closed point. Applying it to the extended one-leg shtuka recovers the finite free underlying module; its Frobenius is then linearized after inverting tilde-xi.

**Hypotheses.** C complete algebraically closed of characteristic zero. Y^an is the punctured analytic locus of SW §12.2, printed pp.101–102; topology and endpoint carriers remain owned by upstream AdicSpaces. Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Dependencies.** `AInfCohomology:AI.2/linear-module-patching`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`; `AdicSpacesPartII:R3`.

**Proof or construction.** Use the source two-open cover and the associated equalizer for sections; import the affinoid finite-projective/vector-bundle equivalence from the lower adic foundations. Recover a finite free A_inf-module from a vector bundle by the source lattice and approximation argument. Identify scalar extension back to Y and the Hom equalizer, giving essential surjectivity and full faithfulness.

**Check.** Reuse the existing interior spaY and request the two endpoints and their sheaf interfaces from its owner. The equivalence here is on Y^an, not on the interior Fargues–Fontaine cover alone.

**Source.** sw20, Theorem 14.2.1 and proof, printed pp.116–117 (PDF pp.126–127).

### fargues-essential-surjectivity — Analytic reconstruction of a finite free BKF module

Target `AInfCohomology:AI.2/fargues-essential-surjectivity` (construction).

**Statement.** Reconstruct a finite free BKF module from a pair (T,Xi) using the one-leg shtuka, unique extension across infinity and finite-free/vector-bundle equivalence on the punctured analytic Y^an. AI.2 owns these linear patching and reconstruction theorems; the upstream AdicSpaces roadmap supplies the interior and is asked for the punctured endpoint extension and its Frobenius, so no new curve is constructed.

**Hypotheses.** C algebraically closed; pair as defined; in SW the leg is at phi^(-1)(x_C). Translate this to linearization inverted at tilde-xi=phi(xi), retaining the direction of Frobenius. Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied.

**Dependencies.** `AInfCohomology:AI.2/lattice-pair`; `AInfCohomology:AI.2/linear-module-patching`; `AInfCohomology:AI.2/integral-robba-frobenius-descent`; `AInfCohomology:AI.2/frobenius-extension-infinity`; `AInfCohomology:AI.2/analytic-vector-bundle-extension`; `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

**Proof or construction.** Use Proposition 12.4.6 to build the one-leg shtuka from (T,Xi): patch Xi at x_C and its successive Frobenius translates, with the leg at phi^-1(x_C). No-leg descent is supplied by integral-robba-frobenius-descent. Use frobenius-extension-infinity to extend its phi-module tail across x_L; glue with the bounded part. Use analytic-vector-bundle-extension to recover the finite free A_inf-module, then SW Theorem 14.1.1 to identify its Frobenius linearization after tilde-xi inversion.

**Uses.**

- AInfCohomology:AI.2/fargues-classification: Gives an inverse, beyond merely a faithful realization.

**API.**

- `TauCeti.BKF.reconstruct_pair` (equivalence): The reconstructed BKF module realizes to the given pair.
- `TauCeti.BKF.reconstruct_morphism` (functoriality): Pair morphisms induce Frobenius-compatible maps.
- `TauCeti.BKF.reconstruct_tensor` (compatibility): Reconstruction preserves tensor products in the finite-free category.
- `TauCeti.BKF.reconstruct_modification` (compatibility): Under the canonical realization-pair isomorphism, the image of the reconstructed B_dR^+-lattice equals the specified Xi, element by element. This identifies the completed-stalk lattice of the associated modification on the punctured analytic Y^an; it is not merely freeness of the underlying module.

**Definition tests.**

- `TauCeti.BKF.reconstruct_test_standard` (compatibility): The standard pair reconstructs the unit as a BKF object: the comparison and inverse commute with linearized Frobenius and have inverse underlying maps.
- `TauCeti.BKF.reconstruct_test_shift` (computation): A xi-shifted rank-one lattice reconstructs the corresponding BK twist with the source sign convention: the comparison has a BKF morphism and inverse whose underlying maps are inverse and whose linearized Frobenius squares commute.
- `TauCeti.BKF.reconstruct_test_zero` (degenerate): The zero pair reconstructs the zero finite-free BKF object.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** sw20, Theorem 11.4.5, printed p.97; Theorem 12.3.4 and Proposition 12.3.5, p.104; Proposition 12.4.6, pp.106–107; Theorems 13.2.1,13.4.1, pp.109–113; Theorems 14.1.1,14.2.1, pp.115–117.

### fargues-classification — Fargues classification of finite free BKF modules

Target `AInfCohomology:AI.2/fargues-classification` (theorem).

**Statement.** Over algebraically closed C, finite free BKF modules are tensor equivalent to lattice pairs (T,Xi). The inverse and comparison preserve Tate twists and the associated FF modifications. No such equivalence is asserted for every finitely presented torsion BKF object.

**Hypotheses.** Common rational period rings and supplied analytic patching; finite free modules.

**Dependencies.** `AInfCohomology:AI.2/fargues-full-faithfulness`; `AInfCohomology:AI.2/fargues-essential-surjectivity`.

**Proof or construction.** Combine full faithfulness with reconstruction and its two unit/counit comparisons. Check tensor and twist identities in the two realizations.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 4.28, printed pp.42–43; sw20, Theorem 14.1.1, printed pp.115–116.

### bkf-galois-descent — Continuous Galois descent of BKF pairs

Target `AInfCohomology:AI.2/bkf-galois-descent` (theorem).

**Statement.** For a discretely valued K with C its completed algebraic closure, retain a continuous semilinear G_K action on the BKF module and compatible continuous action on T and Xi. The Fargues correspondence respects this descent data; discarding the action does not recover the K-object.

**Hypotheses.** K complete discretely valued with perfect residue field; continuity for the p-adic and period topologies. Finite free BKF modules and their lattice pairs for transport by Fargues classification. The explicit crystalline case begins with a G_K-stable Z_p lattice in a crystalline representation.

**Dependencies.** `AInfCohomology:AI.2/fargues-classification`; `PadicHodgeTheory:R06.1`.

**Proof or construction.** Transport semilinear actions by the fully faithful Fargues functor. Check continuity using the requested coefficient topologies, rather than infer it from algebraic equivariance. For lattices in crystalline G_K representations, use the Frobenius on W(k) and T↦[pi-flat]^p in Proposition 4.32; Proposition 4.34 identifies the crystalline/de Rham lattice and its compatible action.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, §4.4, Lemma 4.30, Proposition 4.32 and Proposition 4.34; printed pp.33–44.

### minuscule-prismatic-dictionary — Minuscule BKF and prismatic Dieudonné dictionary

Target `AInfCohomology:AI.2/minuscule-prismatic-dictionary` (comparison).

**Statement.** Over a perfectoid ring, admissible prismatic Dieudonné modules evaluated on the initial prism are precisely minuscule BKF modules. For O_C use (A_inf,tilde-xi) and a finite free linearized phi whose integral image lies in M with cokernel killed by tilde-xi and finite projective over O_C. This is a Frobenius-shifted dictionary with the theta prism.

**Hypotheses.** Perfectoid ring; finite projective/free conventions exactly as in the Dieudonné supplier; minuscule weights [0,1].

**Dependencies.** `AInfCohomology:AI.2/bkf-module`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `PrismaticCohomology:PR.0`.

**Proof or construction.** Import admissible prismatic Dieudonné objects and their perfectoid evaluation from the owner. Identify the window filtration with the minuscule integral Frobenius image; check the conormal ideal orientation.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** alb, Definition 4.1.24, printed p.34; §4.3 perfectoid dictionary, pp.47–49.

### minuscule-crystalline-triple — Crystalline determination of a minuscule BKF module

Target `AInfCohomology:AI.2/minuscule-crystalline-triple` (theorem).

**Statement.** A minuscule BKF module over O_C is determined up to isomorphism by (T_M,M_crys,alpha_M), where T_M=M[1/tilde-xi]^(phi=1), M_crys=M⊗A_inf A_crys and alpha is the Frobenius-compatible B_crys comparison. The natural map M→M_crys is part of the realization; the theorem is faithfulness of the triple, not essential surjectivity for arbitrary triples.

**Hypotheses.** C algebraically closed; minuscule finite free BKF; period maps as normalized in the prismatic dictionary.

**Dependencies.** `AInfCohomology:AI.2/minuscule-prismatic-dictionary`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.2/fargues-classification`.

**Proof or construction.** Use the minuscule classification to recover the integral lattice from the compatible crystalline and étale realizations. Separate the author erratum to Proposition 5.23 from this result; no nilpotence of divided Frobenius on the full crystalline kernel is assumed.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** alb, Proposition 4.3.5, printed p.48 (preprint v4; published Proposition 4.47).

## AI.3 — Integral pro-étale sheaves and AΩ

The corrected analytic pro-étale site comes from A1. Construct classical integral Witt coefficients and their derived completion separately. Define AΩ by derived pushforward and Lη_mu, then prove the integral toric model and framing independence. Rational structural period sheaves are supplied by the early P8 child when a comparison needs them.

### completed-integral-sheaf — Completed integral structure sheaf

Target `AInfCohomology:AI.3/completed-integral-sheaf` (construction).

**Statement.** On X_proet for a locally noetherian analytic adic X over Spa(Q_p,Z_p), define hat O_X^+=lim_n O_X^+/p^n as a sheaf of rings. There are compatible O_X^+/p^n≅hat O_X^+/p^n, p-flatness and rational localization hat O_X=hat O_X^+[1/p]. The site uses the corrected transfinite covers.

**Hypotheses.** The corrected pro-étale site is supplied by AdicEtaleGeometry A1; smoothness is not required here.

**Dependencies.** `AdicEtaleGeometry:A1`; `PerfectoidSpaces:P6/scholze-2013-affinoid-perfectoid-comparison`; `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`.

**Proof or construction.** Import the corrected site and its affinoid perfectoid basis. Form the sheaf inverse limit and prove its finite-reduction properties.

**Uses.**

- AInfCohomology:AI.3/tilt-sheaf: The tilt is the Frobenius limit of its mod-p quotient.

**API.**

- `TauCeti.AInfSheaf.completedIntegral_mod_pn` (equivalence): hat O^+/p^n≅O^+/p^n as sheaves.
- `TauCeti.AInfSheaf.completedIntegral_sections` (characterisation): For affinoid perfectoid Uhat=Spa(R,R+), hat O^+(U)=R+.
- `TauCeti.AInfSheaf.completedIntegral_localization` (compatibility): Inverting p gives hat O.
- `TauCeti.AInfSheaf.completedIntegral_pullback` (functoriality): The completed integral sheaf is functorial under eligible adic morphisms.

**Definition tests.**

- `TauCeti.AInfSheaf.completedIntegral_test_point` (compatibility): On Spa(C,O_C) the canonical affinoid-perfectoid sections are O_C.
- `TauCeti.AInfSheaf.completedIntegral_test_mod_p` (computation): The mod-p quotient is O^+/p, with no extra inverse-limit Tor.
- `TauCeti.AInfSheaf.completedIntegral_test_profinite` (compatibility): On U×S for profinite S, sections are continuous maps S→R+ with the p-adic topology.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** sch13, Lemma 4.2, printed pp.21–22; Definition 4.3, pp.22–23; bms1-v3, Definition 5.4, Remark 5.5 and Lemma 5.6, printed pp.46–48; sch13-erratum, 2016 corrigendum, pp.1–3.

### tilt-sheaf — Tilted integral structure sheaf

Target `AInfCohomology:AI.3/tilt-sheaf` (construction).

**Statement.** Define hat O_X^{+,flat}=lim_F (hat O_X^+/p); it is a perfect characteristic-p sheaf of rings. For an affinoid perfectoid Uhat=Spa(R,R+), its sections identify with R^{+,flat} and its higher cohomology is almost zero.

**Hypotheses.** X as above; quotient and Frobenius limit in the corrected pro-étale topos.

**Dependencies.** `AInfCohomology:AI.3/completed-integral-sheaf`; `mathlib:PreTilt`; `PerfectoidSpaces:P6/scholze-2013-affinoid-perfectoid-comparison`.

**Proof or construction.** Compute sections and limits on the perfectoid basis. Use the source almost acyclicity and inverse-limit argument, not exactness of arbitrary sheaf limits.

**Uses.**

- AInfCohomology:AI.3/derived-ainf-sheaf: Witt vectors of the tilt give the coefficient sheaf.

**API.**

- `TauCeti.AInfSheaf.tilt_sections` (equivalence): On affinoid perfectoids, sections are the existing PreTilt R+ p.
- `TauCeti.AInfSheaf.tilt_frobenius` (equivalence): Frobenius is an automorphism of the tilt sheaf.
- `TauCeti.AInfSheaf.tilt_untilt` (compatibility): The multiplicative sharp map agrees with the existing untilt on sections.
- `TauCeti.AInfSheaf.tilt_pullback` (functoriality): Compatible with pullback and rational restriction.

**Definition tests.**

- `TauCeti.AInfSheaf.tilt_test_char_p` (compatibility): For a perfect characteristic-p section ring the tilt is that ring.
- `TauCeti.AInfSheaf.tilt_test_zero` (degenerate): The tilt of the zero section ring is zero.
- `TauCeti.AInfSheaf.tilt_test_sharp_add` (non-example): Sharp is multiplicative and generally not additive; do not expose a ring homomorphism sharp.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** sch13, Lemma 5.10, printed p.33; bms1-v3, Lemma 5.6, printed pp.47–48.

### derived-ainf-sheaf — Derived p-completed A_inf sheaf

Target `AInfCohomology:AI.3/derived-ainf-sheaf` (construction).

**Statement.** Let A_inf,X be the derived p-completion of the Witt sheaf W(hat O_X^{+,flat}) in the shared enhancement. BMS1 Definition 5.4 uses this derived object, distinct from presuming an everywhere discrete ordinary limit. Its H^0 on affinoid perfectoids is W(R^{+,flat}), and H^{>0} of sections is almost zero.

**Hypotheses.** Corrected pro-étale topos; shared enhancement and derived p-completion; almost ideal determined by the perfectoid base.

**Dependencies.** `AInfCohomology:AI.3/tilt-sheaf`; `mathlib:WittVector`; `EnhancedDerivedSheaves:E4/derived-complete-sheaves`.

**Proof or construction.** Take Witt vectors sectionwise, sheafify and derive p-completion. Use finite Witt acyclicity and the surjective-system inverse-limit theorem.

**Uses.**

- AInfCohomology:AI.3/aomega: Supplies the actual object to Rnu_* and Lη_mu.
- PadicHodgeTheory:P8:local-rational: Rational sheaves extend these common coefficients.

**API.**

- `TauCeti.AInfSheaf.ainf_mod_pn` (compatibility): Finite derived p reductions agree with the finite Witt sheaf reductions.
- `TauCeti.AInfSheaf.ainf_sections_H0` (equivalence): H^0 of sections on an affinoid perfectoid is W(R^{+,flat}).
- `TauCeti.AInfSheaf.ainf_theta` (constructor): The common theta and finite theta_r maps define sheaf coefficient specializations.
- `TauCeti.AInfSheaf.ainf_frobenius` (equivalence): The Witt Frobenius gives an equivalence of A_inf,X with its scalar-twisted form.
- `TauCeti.AInfSheaf.ainf_complete` (characterisation): A_inf,X is derived p-complete.

**Definition tests.**

- `TauCeti.AInfSheaf.ainf_test_point` (compatibility): On the canonical point affinoid, H^0 is the existing W(O_C^flat).
- `TauCeti.AInfSheaf.ainf_test_higher` (non-example): The comparison is almost acyclicity, not a claim that all higher sheaf cohomology vanishes integrally.
- `TauCeti.AInfSheaf.ainf_test_level_one` (compatibility): The theta_1 map on sections is the already fixed Fontaine map.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Definition 5.4, Remark 5.5, Lemma 5.6; printed pp.46–47.

### perfectoid-period-sections — Integral period sections and profinite products

Target `AInfCohomology:AI.3/perfectoid-period-sections` (theorem).

**Statement.** On an affinoid perfectoid Uhat=Spa(R,R+), the completed integral and tilt sections are R+ and R+flat, and H^0(Uhat,A_inf,X)=W(R+flat). Their higher integral cohomology is almost zero, not asserted zero. For Uhat×S with S profinite, the integral sections are continuous S-valued maps with the specified inverse-limit topology. Rational period-sheaf acyclicity is a subsequent P8:local-rational theorem.

**Hypotheses.** X locally noetherian over a perfectoid field; Uhat affinoid perfectoid in the corrected pro-etale site; S profinite.

**Dependencies.** `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/completed-integral-sheaf`; `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`.

**Proof or construction.** Use the completed integral and tilt descriptions on the perfectoid basis. Induct through finite Witt lengths and use the controlled derived inverse limit for A_inf,X; retain the almost-zero higher cohomology.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** sch13, Theorem 6.5 and Corollary 6.6, printed p.36; bms1-v3, Lemma 5.6, printed pp.47–48.

### aomega — The AΩ complex

Target `AInfCohomology:AI.3/aomega` (construction).

**Statement.** For a smooth p-adic formal O_C-scheme mathfrak X with analytic generic fiber X and nu:X_proet→mathfrak X_Zar, define AΩ_mathfrak X=Lη_mu Rnu_* A_inf,X in the shared enhanced derived category of A_inf-module sheaves. The ideal (mu), hence the object, is independent of epsilon.

**Hypotheses.** Smooth p-adic formal scheme; corrected site; derived p-completed coefficients; common enhancement.

**Dependencies.** `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.0/witt-limit-and-mu-kernel`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `AdicEtaleGeometry:A1`.

**Proof or construction.** Construct the morphism of ringed topoi and its derived pushforward using E1. Apply generic Lη to the intrinsic ideal (mu). Use change-of-generator descent to identify different root choices.

**Uses.**

- AInfCohomology:AI.4/hodge-tate: Local specializations reduce this object.
- AInfCohomology:AI.5/proper-ainf-complex: Proper cohomology is its derived global sections.

**API.**

- `TauCeti.AOmega.local_definition` (characterisation): AΩ=Lη_mu Rnu_* A_inf,X in the enhancement.
- `TauCeti.AOmega.local_roots` (equivalence): Changing epsilon gives a canonical comparison through the ideal (mu).
- `TauCeti.AOmega.local_restriction` (functoriality): Restriction to a Zariski open agrees with its AΩ construction.
- `TauCeti.AOmega.local_multiplication` (structure): There is coherent unital E_infinity multiplication from the lax functors.
- `TauCeti.AOmega.local_frobenius` (constructor): The Witt Frobenius yields phi^*AΩ→AΩ, factoring through Lη_tilde-xi AΩ.
- `TauCeti.AOmega.local_complete` (characterisation): AΩ is derived (p,xi)-complete in the smooth setting.

**Definition tests.**

- `TauCeti.AOmega.local_test_point` (computation): For mathfrak X=Spf O_C, AΩ≃A_inf in degree 0.
- `TauCeti.AOmega.local_test_torus` (compatibility): For a framed formal torus the toric q-Koszul model computes AΩ.
- `TauCeti.AOmega.local_test_framings` (compatibility): Two framings on the same smooth affine yield equivalences through the single sheaf AΩ, not coordinatewise equality of formulas.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Definition 9.1; printed p.69.

### toric-perfectoid-cover — Toric perfectoid cover

Target `AInfCohomology:AI.3/toric-perfectoid-cover` (construction).

**Statement.** For a small framed smooth R over O_C, set R_infinity=R completed-tensor_(O_C<T_i±1>) O_C<T_i±1/p^infinity>. It gives an affinoid perfectoid pro-étale cover with continuous Gamma=Z_p(1)^d action. Its integral and nonintegral monomial weight summands are completed, not unrestricted products.

**Hypotheses.** R p-complete, p-torsion-free and formally étale over the displayed torus; choose compatible roots for the action.

**Dependencies.** `PerfectoidSpaces:P6/scholze-2013-affinoid-perfectoid-comparison`; `PerfectoidSpaces:P3/almost-purity-theorem`; `AInfCohomology:AI.1/completed-sum-cohomology`.

**Proof or construction.** Adjoin roots of all torus coordinates and p-complete. Use étale base change and perfectoid completion to prove the cover properties.

**Uses.**

- AInfCohomology:AI.3/toric-cohomology: The cover gives the continuous cochains.

**API.**

- `TauCeti.AOmega.toricCover_action` (constructor): gamma_i scales the p-power roots of T_i by the compatible roots of unity.
- `TauCeti.AOmega.toricCover_perfectoid` (characterisation): The completed cover is affinoid perfectoid.
- `TauCeti.AOmega.toricCover_integral_part` (projection): Integral weights give the completed original torus part.
- `TauCeti.AOmega.toricCover_transition` (compatibility): Finite root covers and their transition maps give the corrected pro-étale cover.

**Definition tests.**

- `TauCeti.AOmega.toricCover_test_d0` (degenerate): In relative dimension 0 the coordinate tower and Gamma are trivial.
- `TauCeti.AOmega.toricCover_test_d1` (computation): gamma(T^(1/p^n))=zeta_(p^n)T^(1/p^n).
- `TauCeti.AOmega.toricCover_test_continuity` (non-example): Giving Gamma the discrete topology does not supply the required continuous completed cochain comparison.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, §8.1; Definition 9.3 (framing and root tower); printed pp.61–69.

### toric-cohomology — Integral toric cohomology computation

Target `AInfCohomology:AI.3/toric-cohomology` (theorem).

**Statement.** The continuous cohomology of R_infinity decomposes by weights. Integral weights have the source exterior cohomology, and nonintegral weights have the bounded root-of-unity annihilation estimates of Proposition 8.9 and Lemma 8.10. After Lη_(zeta_p−1), only the predicted differential-form part survives.

**Hypotheses.** Framed small smooth R; completed weight decomposition; continuous Gamma.

**Dependencies.** `AInfCohomology:AI.3/toric-perfectoid-cover`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-decalage-calculation`.

**Proof or construction.** Compute each one-variable gamma−1 eigenvalue. Use the scalar Koszul divisibility alternatives for each weight and tensor with correct signs. Pass to completed direct sums using the uniform torsion estimate.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 8.9; Lemma 8.10; printed pp.63–64.

### witt-toric-cohomology — Finite Witt toric cohomology

Target `AInfCohomology:AI.3/witt-toric-cohomology` (theorem).

**Statement.** For finite r, the toric W_r(R_infinity) cohomology has the integral-part and completed nonintegral weight decomposition in Lemma 9.7, with the annihilators used by Lη_[zeta_(p^r)]−1. The resulting cohomology modules have no almost-zero elements where Corollary 3.29 is invoked.

**Hypotheses.** Small framed R; r≥1; finite-level almost setting W_r(m).

**Dependencies.** `AInfCohomology:AI.3/toric-perfectoid-cover`; `AInfCohomology:AI.0/witt-polynomial-calculation`; `AInfCohomology:AI.0/no-almost-zero-witt-sections`; `AInfCohomology:AI.1/completed-sum-cohomology`.

**Proof or construction.** Use the finite Witt polynomial weight decomposition. Compute the gamma eigenvalues and apply finite Witt no-almost-zero results.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 9.7; Lemmas 9.8–9.9; printed pp.73–74.

### almost-to-honest — Almost-to-honest décalage criterion

Target `AInfCohomology:AI.3/almost-to-honest` (lemma).

**Statement.** Let f∈I be regular in A. If g:C→D induces cohomology maps with I-annihilated kernel/cokernel, and H^i(C) and H^i(C)/f have no nonzero I-annihilated elements for every i, then Lη_f g is an equivalence. The assumptions are on C, not an unsupported assertion about all almost maps.

**Hypotheses.** A commutative ring; ideal I; regular f∈I; source no-almost-zero conditions.

**Dependencies.** `AInfCohomology:AI.1/decalage-cohomology`.

**Proof or construction.** Identify H/H[f] with fH. Prove fH(C)=fH(D) using the absence of I-annihilated elements in H(C)/f.

**Check.** The almost map m→O_C fails the source quotient condition and does not become an integral equivalence after Lη_(zeta_p−1).

**Source.** bms1-v3, Lemma 8.11; printed p.64.

### ainf-almost-criterion — The A_inf almost comparison criterion

Target `AInfCohomology:AI.3/ainf-almost-criterion` (lemma).

**Statement.** For g:C→D between derived p-complete A_inf complexes, Lη_mu g is an equivalence if (i) g mod p is almost an equivalence over O_C^flat, (ii) H^i(Lη_mu g) is injective for every i, and (iii) intersection_{a∈W(m^flat), a divides mu}(mu/a)H^i(C)=mu H^i(C) for every i. W(m^flat) is not treated as an idempotent ideal in A_inf.

**Hypotheses.** All three displayed conditions; derived p-completeness of C,D.

**Dependencies.** `AInfCohomology:AI.1/decalage-cohomology`; `AInfCohomology:AI.0/witt-almost-ideal`.

**Proof or construction.** Lift finite Witt almost multipliers and pass through derived p-completion. Use the intersection condition to show that every cokernel class lifts from mu-torsion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 9.12, printed pp.75–76.

### toric-almost-purity-comparison — Almost purity comparison for integral toric cochains

Target `AInfCohomology:AI.3/toric-almost-purity-comparison` (comparison).

**Statement.** Continuous Gamma cochains on the toric perfectoid cover map to pro-finite-étale and pro-étale cohomology. Almost purity gives the finite-level almost comparisons; the toric injectivity and no-almost-zero/intersection estimates upgrade them under Lη to honest integral equivalences.

**Hypotheses.** Smooth framed affine; derived p-complete A_inf coefficients; exact source conditions in the almost criteria.

**Dependencies.** `PerfectoidSpaces:P3/almost-purity-theorem`; `AInfCohomology:AI.3/toric-cohomology`; `AInfCohomology:AI.3/witt-toric-cohomology`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.3/ainf-almost-criterion`.

**Proof or construction.** Use Faltings/Scholze almost purity to identify the almost cone. Verify each independent hypothesis of Lemma 8.11 or 9.12 in the toric model.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, §§8.2–8.3; Theorem 9.4(ii–iii), Lemma 9.13; printed pp.61–76.

### q-de-rham-model — Framed q-de Rham model

Target `AInfCohomology:AI.3/q-de-rham-model` (construction).

**Statement.** For a framed torus algebra over A_inf, q=[epsilon], the normalized complex is η_(q−1)K(A_inf<T_i±1>;gamma_i−1), where gamma_i(T_i)=qT_i. In one variable d(T^n)=[n]_q T^n dlog_q T and dlog_q T*f(T)=f(qT)*dlog_q T. The model depends on the framing; it is not a commutative dga.

**Hypotheses.** Chosen framing and compatible roots; the smooth lift and completion are the source ones.

**Dependencies.** `AInfCohomology:AI.3/toric-almost-purity-comparison`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.0/cyclotomic-coefficients`.

**Proof or construction.** Split integral and nonintegral toric weights after eta. Compute the divided gamma differential on monomials. Check the twisted multiplication rather than assuming strict commutativity.

**Uses.**

- AInfCohomology:AI.4/de-rham: The specialized differential is the usual derivative.

**API.**

- `TauCeti.AOmega.qModel_monomial` (characterisation): d(T^n)=[n]_q T^n dlog_q T, also for negative n with the Laurent q-integer.
- `TauCeti.AOmega.qModel_product` (relation): dlog_q T*f(T)=f(qT)*dlog_q T.
- `TauCeti.AOmega.qModel_tensor` (compatibility): Several coordinates use the signed tensor product of one-variable models.
- `TauCeti.AOmega.qModel_comparison` (equivalence): The framed model computes the sheaf AΩ on the small affine.
- `TauCeti.AOmega.qModel_q_one` (compatibility): At q=1 the formula specializes to the ordinary de Rham differential after eligible derived coefficient change.

**Definition tests.**

- `TauCeti.AOmega.qModel_test_T` (computation): d(T)=T dlog_q T.
- `TauCeti.AOmega.qModel_test_T2` (computation): d(T²)=(1+q)T² dlog_q T.
- `TauCeti.AOmega.qModel_test_noncommutative` (non-example): For q≠1, dlog_q T*T=qT*dlog_q T, so a strictly commutative product is wrong.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Example 7.7, Remark 7.8; §9 toric description; printed p.58.

### framing-independence-and-descent — Framing independence and sheaf descent

Target `AInfCohomology:AI.3/framing-independence-and-descent` (theorem).

**Statement.** The toric, profinite-étale and pro-étale AΩ complexes on a small smooth affine map equivalently to RΓ(mathfrak X,AΩ). Their canonical comparisons imply independence of framing, étale restriction and descent for general smooth formal schemes.

**Hypotheses.** Small affine comparisons first; descent and limit conditions from the shared enhancement.

**Dependencies.** `AInfCohomology:AI.3/aomega`; `AInfCohomology:AI.3/toric-almost-purity-comparison`; `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`; `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`; `AInfCohomology:AI.0/witt-etale-base-change`.

**Proof or construction.** Prove étale base change at finite Witt level. Use Scholze Lemma 3.18 with explicit acyclic-basis and Mittag-Leffler hypotheses for the sheaf limits. Pass to p-complete A_inf and glue via the common sheaf object.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 9.9, printed p.74; Lemmas 9.13–9.15, pp.76–78; Theorem 9.4(iii), pp.70–71.

### aomega-frobenius — AΩ Frobenius and completeness

Target `AInfCohomology:AI.3/aomega-frobenius` (theorem).

**Statement.** Frobenius gives phi^*AΩ≃Lη_tilde-xi AΩ and thus a map phi^*AΩ→AΩ that becomes an equivalence after tilde-xi inversion. AΩ is derived (p,xi)-complete; its coherent multiplication is obtained in the enhancement.

**Hypotheses.** Smooth formal O_C-scheme; local boundedness and regular coefficients.

**Dependencies.** `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/preservation-derived-completeness`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Proof or construction.** Check phi(mu)=mu*tilde-xi in the toric calculation. Use composition of eta and local descent to get the factorization. Use finite reductions and derived completeness detection.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, §9, printed pp.69–79; Theorem 1.10, pp.7–8; Theorem 14.3, pp.119–120.

### enhanced-noncommutative-regression — Failure of a strictly commutative q-model

Target `AInfCohomology:AI.3/enhanced-noncommutative-regression` (application).

**Statement.** The E_infinity q-de Rham algebra in characteristic two cannot in general be represented by a commutative dga: in the source example Sq^0 on the degree-one q-log class is nonzero. The twisted cochain product is retained; E_infinity enhancement is the multiplicative target.

**Hypotheses.** A=F_2[q±1], R=A[T±1], q-variable as in Remark 7.8.

**Dependencies.** `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.1/decalage-products`; `EnhancedDerivedSheaves:E5`.

**Proof or construction.** Import coherent algebra objects and Steenrod operations from the enhancement supplier. Use the map to group cochains and the Frobenius-semilinearity of Sq^0 to detect the nonzero image.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Remark 7.8 (E1=Lη_(q−1) E2 correction PAPER-BHATT-MORROW-SCHOLZE-18/E6); printed p.58.

### classical-ainf-sheaf — Classical integral Witt period sheaf

Target `AInfCohomology:AI.3/classical-ainf-sheaf` (construction).

**Statement.** On the corrected pro-étale site of a locally noetherian analytic adic space X over Spa(Q_p,Z_p), set A_inf,X^cl=W(Ô_X^{+,flat})=lim_R W_r(Ô_X^{+,flat}) in sheaves of rings. Sheafifying BMS1 Lemma 3.2 gives its identification with lim_F W_r(Ô_X⁺), with projections tilde-theta_r and theta_r=tilde-theta_r∘phi^r. It is a discrete sheaf, distinct from the derived p-completed A_inf,X used in AΩ.

**Hypotheses.** The corrected analytic pro-étale site and inverse limits in its ringed topos are imported. No smoothness or formal model is needed. Derived completeness of this ordinary sheaf is not assumed.

**Dependencies.** `AInfCohomology:AI.3/completed-integral-sheaf`; `AInfCohomology:AI.3/tilt-sheaf`; `AInfCohomology:AI.0/theta-witt-family`; `mathlib:WittVector`; `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`.

**Proof or construction.** Form finite Witt-vector sheaves and their restriction limit. Sheafify the perfectoid Witt-limit identities; use the Frobenius limit rather than identifying Witt vectors with a coordinatewise ring product.

**Uses.**

- AInfCohomology:AI.3/classical-derived-ainf-comparison: The completion map starts with this ordinary sheaf.
- AInfCohomology:AI.6/aomega: Supplies the same integral coefficient normalization on the étale formal-model site.

**API.**

- `AInf.classical_ainf_sheaf.restriction` (functoriality): For V→U on X_proet, restriction is the Witt map induced by Ô^{+,flat}(U)→Ô^{+,flat}(V).
- `AInf.classical_ainf_sheaf.theta_r` (compatibility): Projection to W_r(Ô⁺) is tilde-theta_r; composing with phi^r gives theta_r, whose length-one map is theta.
- `AInf.classical_ainf_sheaf.perfectoid_sections` (compatibility): On an affinoid perfectoid U with completed integral ring R⁺, A_inf,X^cl(U)=W(R^{+,flat}) with its Witt Frobenius.

**Definition tests.**

- `classical_ainf_sheaf_point` (computation): On Spa(C,O_C) with its affinoid perfectoid presentation, sections are W(O_C^flat), not W(C).
- `classical_ainf_sheaf_r1` (computation): At r=1, theta_1 is theta and tilde-theta_1=theta∘phi^−1; their cyclotomic kernels differ.
- `classical_ainf_sheaf_sheaf_not_complex` (non-example): The classical sheaf is concentrated in degree zero; its definition alone supplies no vanishing theorem for derived inverse-limit or section functors.
- `classical_ainf_sheaf_units` (computation): The Witt unit restricts to the unit at every finite level.

**Check.** Keep the ordinary sheaf in degree zero before derived completion. All theta_r use the same scalar normalization as AI.0.

**Source.** bms1-v3, Definition 5.4, Remark 5.5 and the paragraph after Lemma 5.6, printed pp.46–47; sch13, Definitions 6.1 and 6.3, printed pp.35–36.

### classical-derived-ainf-comparison — Classical-to-derived integral period comparison

Target `AInfCohomology:AI.3/classical-derived-ainf-comparison` (comparison).

**Statement.** There is a canonical multiplicative map A_inf,X^cl[0]→A_inf,X=Rlim_n(A_inf,X^cl⊗^L Z/p^n). Its cone has [m^flat]-torsion cohomology over a perfectoid base C. On affinoid perfectoids the induced map on H^0 of sections identifies both sides with W(R^{+,flat}); higher cohomology of the derived object is almost zero. No global equality of the classical sheaf with its derived completion is asserted.

**Hypotheses.** X as in classical-ainf-sheaf, over a perfectoid C for the almost statement; m^flat is the maximal ideal of O_C^flat. Use the derived p-completion functor of the shared enhancement.

**Dependencies.** `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `EnhancedDerivedSheaves:E4/derived-complete-sheaves`.

**Proof or construction.** Take the derived-completion unit on the ordinary Witt sheaf. Use perfectoid basis computations and the almost derived-completeness argument of Remark 5.5 to bound its failure; retain the cone rather than asserting it vanishes. Extend finite-Witt theta_r to the completion because their targets are already derived complete.

**Check.** The point computation is the usual A_inf coefficient ring. An almost vanishing cone does not become an integral equivalence without the specific no-almost-zero hypotheses of the décalage comparison.

**Source.** bms1-v3, Definition 5.4(vi), Remark 5.5 and Lemma 5.6, printed pp.46–47.

## AI.4 — Local specializations and crystalline comparison

All specializations refer to actual maps from the same AΩ object. Hodge–Tate reduction has the shifted coefficient convention; mod-xi has the de Rham differential. Retain the F–V procomplex identities, the bounded-PD comparison and the explicit degree-zero maps in the saturated and crystalline routes.

### hodge-tate — Hodge–Tate specialization

Target `AInfCohomology:AI.4/hodge-tate` (theorem).

**Statement.** AΩ tensor^L_(A_inf,tilde-theta) O_C≃tilde-Omega:=Lη_(zeta_p−1) Rnu_* hat O_X^+. Its cohomology sheaves are Omega^i_(mathfrak X/O_C),cont{−i}; the comparison is canonical and multiplicative, not an arbitrary splitting of the graded object.

**Hypotheses.** Smooth p-adic formal O_C-scheme; continuous differentials; tilde-theta scalar extension.

**Dependencies.** `AInfCohomology:AI.3/aomega`; `AInfCohomology:AI.3/toric-cohomology`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.0:integral/breuil-kisin-line`.

**Proof or construction.** Check the tilde-theta reduction of the q-Koszul calculation. Use the almost-to-honest criterion and coordinate-free cotangent map to identify the degree-one generator. Use exterior products and descent for all degrees.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorems 8.3,8.7 and 9.2(i); printed pp.61–69.

### hodge-tate-cotangent — Cotangent description of the first Hodge–Tate truncation

Target `AInfCohomology:AI.4/hodge-tate-cotangent` (comparison).

**Statement.** For small smooth R, the canonical transitivity map induces Lhat_(R/Z_p)[−1]{−1}≃τ≤1 tilde-Omega_R. In degree zero it is R and in degree one Omega^1_(R/O_C),cont{−1}.

**Hypotheses.** Small formally smooth R; p-completed cotangent complex; source cohomological shifts.

**Dependencies.** `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `DerivedDeRhamCohomology:DD.0/cotangent-transitivity`.

**Proof or construction.** Construct the transitivity map on the perfectoid cover. Use the unique-factorization lemma and the Fontaine dlog normalization to factor it through eta.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Remark 8.4, printed pp.61–62; Proposition 8.15, pp.66–67.

### eta-factorization-criterion — Factorization criterion through connective décalage

Target `AInfCohomology:AI.4/eta-factorization-criterion` (lemma).

**Statement.** If C∈D≤1(A), D∈D≥0(A), H^0(D) is f-torsion-free and f is regular, a map C→D factors through Lη_f D in at most one way. It factors exactly when H^1(C tensor^L A/f)→H^1(D tensor^L A/f) is zero, equivalently H^1(C)→H^1(D) factors through fH^1(D).

**Hypotheses.** The stated t-structure bounds and H^0 regularity are essential.

**Dependencies.** `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-cohomology`; `mathlib:DerivedCategory`.

**Proof or construction.** Compute the distinguished triangle Lη_f D→D→H^1(D/f)[−1] after truncating D. Apply Hom(C,−); the preceding Hom vanishes by the t-structure bounds.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 8.16, printed pp.66–68.

### hodge-tate-lifting-obstruction — Hodge–Tate extension and lifting obstruction

Target `AInfCohomology:AI.4/hodge-tate-lifting-obstruction` (comparison).

**Statement.** Under the cotangent identification, the extension class of τ≤1 tilde-Omega_R is the obstruction to lifting R to A_inf/(tilde-xi²), with the source twist and normalization. A chosen lift gives the corresponding splitting; existence of a canonical splitting is not asserted for every R.

**Hypotheses.** Smooth p-adic formal O_C-scheme, with the local statement on a small smooth R; the square-zero tilde-theta thickening; obstruction in Ext² of continuous differentials with the conormal line.

**Dependencies.** `AInfCohomology:AI.4/hodge-tate-cotangent`; `DerivedDeRhamCohomology:DD.0/cotangent-complex`; `DerivedDeRhamCohomology:DD.0/derivations-cotangent-comparison`.

**Proof or construction.** Use cotangent transitivity for A_inf/(tilde-xi²)→O_C. Identify the connecting morphism with the square-zero lifting obstruction and compare the conormal line.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Remark 8.4, printed pp.61–62; Proposition 8.15, pp.66–67.

### local-kunneth — Local Künneth and multiplicativity

Target `AInfCohomology:AI.4/local-kunneth` (comparison).

**Statement.** For two small smooth O_C-algebras R_1,R_2 and their completed tensor product R, the completed tensor maps for tilde-Omega and AΩ are equivalences; finite Witt reductions satisfy the compatible source tensor comparison. These are maps of coherent multiplicative objects.

**Hypotheses.** Smoothness, completed products and eligible bounded/perfect coefficient extensions as in Proposition 8.14 and Lemmas 9.16,9.18.

**Dependencies.** `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AInfCohomology:AI.1/valuation-monoidality`; `DerivedDeRhamCohomology:DD.1/completed-filtered-tensor`.

**Proof or construction.** Use a product framing and the continuous Koszul tensor calculation. Apply valuation monoidality and same-ideal completion where justified. Prove finite-level tensor exchange with the source Tor conditions.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 8.14, printed pp.65–66; Lemmas 9.16 and 9.18, pp.78–79.

### finite-witt-specialization — Finite Witt specialization of AΩ

Target `AInfCohomology:AI.4/finite-witt-specialization` (comparison).

**Statement.** For r≥1, AΩ tensor^L_(A_inf,tilde-theta_r) W_r(O_C)≃tilde-W_r-Omega:=L_eta_([zeta_(p^r)]−1) Rnu_* W_r(hat O_X^+), compatibly on framed affines and after sheaf descent. The subsequent cohomology identification with relative de Rham–Witt is the separate relative-witt-comparison node; it is not used to prove this early finite reduction.

**Hypotheses.** Smooth formal scheme; r≥1; derived scalar extension and continuous relative de Rham–Witt.

**Dependencies.** `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.3/witt-toric-cohomology`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`.

**Proof or construction.** Prove the finite coefficient reduction comparison on framed affines by the special nonflat eta/base-change criterion and explicit toric injectivity estimates. Descend the compatible canonical finite Witt maps via the common sheaf construction.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 9.2(ii); Theorem 9.4(i–iii). Theorem 9.4(iv)/11.1 is exported separately by relative-witt-comparison.; printed pp.69–86.

### fv-precomplex — Witt Bockstein precomplex

Target `AInfCohomology:AI.4/fv-precomplex` (construction).

**Statement.** For a commutative algebra object D over A_inf(S), with D and D/xi connective and a Frobenius automorphism, set W_r^n(D)_pre=H^n(D tensor^L A_inf/(tilde-xi_r)). The differential is the Bockstein, and F,V,R have the source coefficient-twisted definitions. This precomplex may contain nonintegral-weight torsion.

**Hypotheses.** D is a commutative algebra object in D(A_inf(S)) with phi-semilinear automorphism and H^i(D)=H^i(D tensor^L A_inf/(xi))=0 for i<0; equivalently D and D/xi are connective. Integral perfectoid S with the source chosen xi normalized so theta_r(xi)=V(1) for every r≥1. The initial precomplex is graded-anticommutative; odd squares need not vanish until the improvement hypotheses are imposed.

**Dependencies.** `AInfCohomology:AI.0/witt-kernel-generators`; `AInfCohomology:AI.1/bockstein-differential`; `CrystallineCohomology:CR.4/relative-witt-complex`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `AInfCohomology:AI.0/theta-witt-family`.

**Proof or construction.** Define finite coefficient cohomology and its Bockstein. Transport F,V,R through the finite Witt coefficient maps and Frobenius on D.

**Uses.**

- AInfCohomology:AI.4/fv-improved-complex: The improved object maps into this precomplex.

**API.**

- `TauCeti.AOmega.wittPre_term` (projection): W_r^n(D)_pre=H^n(D/tilde-xi_r).
- `TauCeti.AOmega.wittPre_d` (characterisation): The differential is the coefficient Bockstein.
- `TauCeti.AOmega.wittPre_FVR` (compatibility): RF=FR, RV=VR, FV=p, FdV=d; VF uses V(1), not automatically p.
- `TauCeti.AOmega.wittPre_lambda` (universal-property): A family lambda_r:W_r(B)→W_r^0(D)_pre preserving the unit, multiplication and coefficient maps, compatible with F,V,R and satisfying F(d lambda_(r+1)([b]))=lambda_r([b])^(p−1) d lambda_r([b]) for every r≥1, induces a unique compatible family of relative de Rham–Witt maps. Require odd squares to vanish when using the relative F-V-procomplex universal property; this is a genuine extra condition for the unimproved precomplex.

**Definition tests.**

- `TauCeti.AOmega.wittPre_test_degree_zero` (computation): W_r^0(D)_pre=H^0(D/tilde-xi_r).
- `TauCeti.AOmega.wittPre_test_point` (compatibility): For D=A_inf, it is W_r(S) in degree zero.
- `TauCeti.AOmega.wittPre_test_torsion` (non-example): On the toric nonintegral weight summands the precomplex has torsion that the improved construction removes.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Definition 10.5, printed p.81; Proposition 11.2 and §11.1.1, printed p.86.

### fv-improved-complex — Improved Witt Bockstein complex

Target `AInfCohomology:AI.4/fv-improved-complex` (construction).

**Statement.** Set W_r^n(D)=H^n((Lη_mu D) tensor^L A_inf/(tilde-xi_r)). Under Assumption 11.4 (p-torsion-free W_r^n(D) for every r≥1,n≥0; at p=2 this forces the odd squares to vanish), this is a relative F-V-procomplex with d,F,R,V and multiplication. The injection into the precomplex has the source scaled image; R is constructed using eta_(phi(mu)) and inverse Frobenius.

**Hypotheses.** D and D/xi are connective; D is an enhanced commutative algebra over A_inf(S) with phi-semilinear automorphism and H^0(D) mu-torsion-free. S p-torsion-free integral perfectoid with the chosen compatible primitive roots. Assumption 11.4: W_r^n(D) is p-torsion-free for every r≥1,n≥0; for p=2 this also forces odd squares to vanish.

**Dependencies.** `AInfCohomology:AI.4/fv-precomplex`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/truncation-comparison-maps`.

**Proof or construction.** Apply eta before the finite quotient and define the Bockstein. Prove injection into the precomplex with the bounded comparison maps. Construct R on regular representatives, correcting the source eta_(phi(mu)) target.

**Uses.**

- AInfCohomology:AI.4/relative-witt-comparison: This F-V-procomplex is the target of the universal comparison map.

**API.**

- `TauCeti.AOmega.wittImproved_term` (projection): W_r^n(D)=H^n((Lη_mu D)/tilde-xi_r).
- `TauCeti.AOmega.wittImproved_inclusion` (constructor): The map to W_r^n(D)_pre is injective under Assumption 11.4.
- `TauCeti.AOmega.wittImproved_FVR` (compatibility): The induced F,V,R obey the F-V-procomplex identities.
- `TauCeti.AOmega.wittImproved_restriction` (characterisation): R is induced by multiplication by tilde-xi^n, eta_(phi(mu)) and inverse Frobenius.
- `TauCeti.AOmega.wittImproved_universal_map` (universal-property): Under Assumption 11.4, a unit-preserving multiplicative family lambda_r:W_r(B)→W_r^0(D), compatible with F,V,R and the Teichmuller differential identity, extends uniquely to relative de Rham–Witt maps in every degree. The improved p-torsion-free hypotheses imply the odd-square condition, including at p=2. Uniqueness and all F,V,R/lambda compatibilities are part of the export.

**Definition tests.**

- `TauCeti.AOmega.wittImproved_test_point` (compatibility): For D=A_inf the improved and precomplex agree in degree zero.
- `TauCeti.AOmega.wittImproved_test_weight` (non-example): Toric nonintegral weights removed by eta cannot be reintroduced by using the precomplex.
- `TauCeti.AOmega.wittImproved_test_r1` (compatibility): At r=1 the source differential is the Bockstein, not a zero differential on the graded modules.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Assumption 11.4; Proposition 11.5; Remark 11.6; printed pp.89–90.

### torus-witt-realization — Torus realization of the improved Witt complex

Target `AInfCohomology:AI.4/torus-witt-realization` (comparison).

**Statement.** For D=RΓ(Z^d,A_inf[U_i±1/p^infinity]), the improved W_r^n(D) is p-torsion-free and canonically W_r Omega^n_(O_C[T_i±1]/O_C), compatible with d,F,R,V and multiplication. The degree-zero lambda has domain W_r(O_C[T_i±1]) and sends [T_i] to U_i^(p^r) in the source coordinate normalization.

**Hypotheses.** Uncompleted torus calculation first; no replacement of W_r(O[T]) by W_r(O)[T].

**Dependencies.** `AInfCohomology:AI.4/fv-improved-complex`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.0/witt-polynomial-calculation`; `CrystallineCohomology:CR.4/torus-integral-part`.

**Proof or construction.** Compute eta on every weight by Lemma 7.9. Use Lemmas 11.9 and 11.14 for the finite Witt weight decomposition. Construct corrected lambda and reduce to the perfect residue field with the corrected Tor-independence statement.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 11.8; Lemmas 11.9,11.11,11.14,11.16; Corollary 11.12; Theorem 11.13; printed pp.91–93.

### relative-witt-comparison — Relative de Rham–Witt comparison

Target `AInfCohomology:AI.4/relative-witt-comparison` (theorem).

**Statement.** The universal F-V-procomplex maps give H^i(tilde-W_r-Omega_R)≅W_r Omega^i_(R/O_C),cont{−i} for i≥0. For r≥1,s≥0, Proposition 11.17 instead uses the restriction map W_(r+s)(O_C)→W_r(O_C): H^i(Lη_([ζ_(p^(r+s))]−1) RΓ_proet(X,W_r(Ô⁺))) identifies, through the source φ^s scalar twist, with H^i(tilde-W_(r+s)-Omega_R tensor^L_(W_(r+s)(O_C)) W_r(O_C)), and hence with (W_(r+s) Omega^i_(R/O_C),cont / V^r W_s Omega^i_(R/O_C),cont){−i}. This is a finite-Witt restriction comparison of cohomology groups, not reduction modulo p^s of W_r(O_C). The relative Witt objects and their Cartier theory are imported from CR.4.

**Hypotheses.** Small smooth p-complete R; r≥1; source finite-level Tor-independence and ordinary p-completion of the continuous relative Witt terms.

**Dependencies.** `AInfCohomology:AI.4/torus-witt-realization`; `AInfCohomology:AI.0/witt-etale-base-change`; `CrystallineCohomology:CR.4/perfectoid-base-change`; `CrystallineCohomology:CR.4/continuous-relative-witt`; `AInfCohomology:AI.4/finite-witt-specialization`.

**Proof or construction.** Extend the torus comparison by étale base change. Use the source completed coefficient exchange and Bockstein compatibility. Descend as sheaves, retaining all twists. For the variant, apply Lemma 9.18 with E=W_r(O_C) as a W_(r+s)(O_C)-module via restriction and use Lemma 3.13. The exact coefficient triangle and injectivity of V^r, from p-torsion-freeness and F^r V^r=p^r, give the stated quotient; retain the φ^s identification and the Breuil–Kisin twist.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 11.1; §11.3; Proposition 11.17; printed pp.86–95.

### de-rham — De Rham specialization

Target `AInfCohomology:AI.4/de-rham` (theorem).

**Statement.** AΩ tensor^L_(A_inf,theta) O_C≃Omega^bullet_(mathfrak X/O_C),cont as multiplicative complexes. The ordinary de Rham differential is recovered by the appropriate Bockstein after the Frobenius/eta_(tilde-xi) identification; this theta statement is different from the tilde-theta Hodge–Tate graded cohomology description.

**Hypotheses.** Smooth p-adic formal scheme; derived theta extension; source Frobenius normalization.

**Dependencies.** `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.3/aomega-frobenius`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.4/relative-witt-comparison`.

**Proof or construction.** Use phi^*AΩ≃Lη_tilde-xi AΩ and reduce the latter along tilde-theta. Identify the Bockstein on the degree-one cotangent generator with the ordinary derivation.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 1.10, printed pp.7–8; Theorem 12.1 and discussion, pp.96–98.

### bounded-pd-coefficients — Bounded divided-power coefficient subrings

Target `AInfCohomology:AI.4/bounded-pd-coefficients` (lemma).

**Statement.** Define A_crys^(m) as the p-adic completion of the A_inf-subalgebra of A_crys generated by xi^j/j! for 0≤j≤m. A_crys is the p-completion of colim_m A_crys^(m). For m≥p², tilde-xi_r=p^r times a unit and Lemma 12.2 holds in A_crys^(m); the filtrations ({a | mu*a belongs to p^s A_crys^(m)})_s and (p^s A_crys^(m))_s are intertwined, and intersection_r (mu/phi^(-r)(mu))A_crys^(m)=mu A_crys^(m). In particular the bounded quotient by mu is p-adically separated; the unbounded A_crys/mu is not assumed separated.

**Hypotheses.** Cyclotomic A_inf over O_C, completed integral PD coefficients; m≥p² and r≥1.

**Dependencies.** `CrystallineCohomology:CR.0/fontaine-envelope`; `AInfCohomology:AI.0/period-regularity`.

**Proof or construction.** Establish Lemma 12.2 in the bounded subring and the unit formula for tilde-xi_r. Descend the topology estimate to the noetherian bounded PD algebra over A_0=Z_p[[T]], with T mapping to [epsilon]^(1/p); use Artin–Rees and topological freeness over A_0. Reduce the intersection statement modulo (mu,p^s), then to the tilt valuation calculation, before taking the separated inverse limit.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 12.8(i–iii), printed pp.100–101; Lemma 12.2, pp.96–97.

### pd-toric-eta-comparison — Toric décalage after crystalline coefficient change

Target `AInfCohomology:AI.4/pd-toric-eta-comparison` (comparison).

**Statement.** For the toric complex, eta_mu after completed extension to A_crys^(m) compares equivalently with the extended q-de Rham model for m≥p². The bounded-coefficient annihilation and injectivity estimates justify this particular exchange; no unrestricted eta/base-change commutation is used.

**Hypotheses.** Small framed smooth R; bounded PD coefficients; source completion and regularity conditions.

**Dependencies.** `AInfCohomology:AI.4/bounded-pd-coefficients`; `AInfCohomology:AI.3/ainf-almost-criterion`; `AInfCohomology:AI.3/q-de-rham-model`.

**Proof or construction.** Recompute every weight with the bounded PD estimates. Use the almost-comparison criterion and finite reduction injectivity. Use Lemma 12.8(iv) for each m≥p², and (v) for the all-coordinate comparison map before p-completing the filtered colimit.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 12.8(iv–v); Lemmas 12.4,12.6 and Corollaries 12.5,12.7; printed pp.97–100.

### pd-logarithmic-coordinate — Crystalline logarithmic coordinate change

Target `AInfCohomology:AI.4/pd-logarithmic-coordinate` (lemma).

**Statement.** In the eligible bounded PD extension, log([epsilon])=log(1+mu) is mu times a unit, so the q-Koszul operators compare with ordinary logarithmic de Rham operators. The coordinate is log([epsilon]), not log(mu).

**Hypotheses.** PD convergence and bounded-subring hypotheses of Corollary 12.7.

**Dependencies.** `AInfCohomology:AI.4/pd-toric-eta-comparison`.

**Proof or construction.** Expand log(1+mu) by its convergent PD series. Compare the gamma action and ordinary logarithmic derivation using this unit.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 12.2(iii), Lemma 12.8(i), and Corollary 12.7 (correction PAPER-BHATT-MORROW-SCHOLZE-18/E15); printed pp.96–100.

### absolute-crystalline-comparison — Absolute A_crys comparison

Target `AInfCohomology:AI.4/absolute-crystalline-comparison` (theorem).

**Statement.** There is a functorial multiplicative equivalence AΩ completed-tensor^L A_crys≃Ru_* O_crys for the absolute crystalline site of mathfrak X_(O_C/p) over A_crys. The all-coordinate PD-envelope construction and its cocycle comparisons make the framed maps presentation-independent.

**Hypotheses.** Smooth formal O_C-scheme; absolute crystalline base A_crys and its PD ideal; derived p-completion.

**Dependencies.** `AInfCohomology:AI.4/pd-toric-eta-comparison`; `AInfCohomology:AI.4/pd-logarithmic-coordinate`; `CrystallineCohomology:CR.2/embedding-computation`; `CrystallineCohomology:CR.2/embedding-independence`; `CrystallineCohomology:CR.2/crystalline-cohomology`.

**Proof or construction.** Use the corrected PD envelope of A_0→A_0/xi_0 in Lemma 12.8. Identify the toric comparison map by Proposition 12.9. Add all coordinates and use the PD universal property to prove common refinements and descent.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 12.1, printed pp.96–98; Lemma 12.8, pp.100–101; Proposition 12.9, pp.102–103.

### crystalline-witt-special-fiber — Derived crystalline special-fiber specialization

Target `AInfCohomology:AI.4/crystalline-witt-special-fiber` (comparison).

**Statement.** Further derived extension of the absolute A_crys comparison along A_crys→W(k), with its correct Frobenius scalar map, gives crystalline cohomology of mathfrak X_k. The identification uses CR.3 base change and relative/absolute Witt comparison; ordinary degreewise tensor is not substituted.

**Hypotheses.** Smooth formal scheme; source Tor/derived completion conditions.

**Dependencies.** `AInfCohomology:AI.4/absolute-crystalline-comparison`; `CrystallineCohomology:CR.3/derived-base-change`; `CrystallineCohomology:CR.4/crystalline-comparison`; `AInfCohomology:AI.0:integral/residue-map`.

**Proof or construction.** Apply the crystalline base-change theorem to the common PD map. Identify the special-fiber model and Frobenius through CR.4.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 1.10, printed pp.7–8; §12, pp.96–103; Theorem 14.3, pp.119–120.

### blm-crystalline-route — Agreement with the saturated de Rham–Witt route

Target `AInfCohomology:AI.4/blm-crystalline-route` (comparison).

**Statement.** The BLM saturated-de-Rham–Witt crystalline comparison for the smooth special fiber agrees with the AΩ crystalline map, including Frobenius and cup products. AI.1 supplies Lη_p completion and Bockstein; CR.4 supplies saturated complexes, Cartier/Nygaard theory and their crystalline equivalence.

**Hypotheses.** Smooth characteristic-p special fiber; the multiplicative comparison maps, not just an abstract isomorphism of groups.

**Dependencies.** `AInfCohomology:AI.4/crystalline-witt-special-fiber`; `AInfCohomology:AI.1/dieudonne-consumer-contract`; `CrystallineCohomology:CR.4/leta-fixed-point`; `CrystallineCohomology:CR.4/crystalline-comparison`; `CrystallineCohomology:CR.4`.

**Proof or construction.** Compare the degree-zero universal Witt maps and Bockstein normalization. Request the precise agreement of BLM §10.3 maps with the all-coordinate AΩ construction from CR.4; record this proof-audit boundary as a gap.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** blm, Theorem 10.2.1, printed p.128; §§10.3–10.4 and Theorem 10.4.4, pp.129–138.

### mu-inverted-etale — Mu-inverted étale specialization

Target `AInfCohomology:AI.4/mu-inverted-etale` (theorem).

**Statement.** For a smooth formal scheme mathfrak X over O_C, with analytic generic fiber X and nu:X_proet→mathfrak X_Zar, AΩ tensor A_inf[1/mu]≃(Rnu_* A_inf,X) tensor A_inf[1/mu], compatibly with multiplication. This is the local pro-etale A_inf-sheaf comparison of Theorem 14.1(iv). The comparison with RΓ_et(X,Z_p) is the separate proper theorem in AI.5/global-etale.

**Hypotheses.** C perfectoid of characteristic zero with compatible primitive p-power roots; mathfrak X smooth over O_C. A_inf,X is the derived p-completed Witt sheaf.

**Dependencies.** `AInfCohomology:AI.3/aomega`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `EnhancedDerivedSheaves:E4/derived-complete-sheaves`.

**Proof or construction.** Invert mu in the defining L_eta_mu complex; eta becomes the identity after its parameter is a unit. Use the natural comparison map to Rnu_* A_inf,X and retain the source derived sheaf. No primitive proper comparison is used locally.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Definition 9.1, printed p.69; Theorem 14.1(iv) and Remark 14.2, printed p.118.

## AI.5 — Proper A_inf cohomology and torsion control

Properness enters through perfectness and the exchange of cohomology with derived scalar extension. The cohomological BKF property uses the nonnoetherian rational crystalline bridge. Torsion bounds and degreewise lattice identifications retain their adjacent-degree Tor corrections and freeness hypotheses.

### proper-ainf-complex — Proper A_inf cohomology complex

Target `AInfCohomology:AI.5/proper-ainf-complex` (construction).

**Statement.** For smooth proper mathfrak X/O_C set RΓ_Ainf(mathfrak X)=RΓ(mathfrak X,AΩ_mathfrak X) in the common enhancement. It carries functorial cup products and linearized Frobenius, and its cohomology modules are denoted H_Ainf^i.

**Hypotheses.** Smooth proper p-adic formal O_C-scheme; the common AΩ sheaf and derived global sections.

**Dependencies.** `AInfCohomology:AI.3/aomega`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Proof or construction.** Apply enhanced derived global sections to the canonical sheaf AΩ. Transport the coherent product and Frobenius factorization.

**Uses.**

- AInfCohomology:AI.5/global-bkf: Finite cohomology modules with Frobenius become BKF modules.
- CohomologyComparisons:CP.5: Consumes the torsion and lattice interfaces.

**API.**

- `TauCeti.AOmega.proper_cohomology` (projection): H_Ainf^i=H^i(RΓ_Ainf).
- `TauCeti.AOmega.proper_pullback` (functoriality): Formal morphisms induce pullback maps compatible with cup products.
- `TauCeti.AOmega.proper_cup` (structure): The unit and cup products come from the enhanced AΩ algebra.
- `TauCeti.AOmega.proper_frobenius` (constructor): Linearized phi on RΓ_Ainf becomes an equivalence after tilde-xi inversion.
- `TauCeti.AOmega.proper_base_change` (compatibility): Eligible proper smooth coefficient change uses derived scalar extension with the specified completion.

**Definition tests.**

- `TauCeti.AOmega.proper_test_point` (computation): RΓ_Ainf(Spf O_C)=A_inf in degree 0.
- `TauCeti.AOmega.proper_test_projective_line` (compatibility): The expected degree 0 and degree 2 lines for formal P^1 carry the unit and inverse degree twist.
- `TauCeti.AOmega.proper_test_torsion` (non-example): Perfectness of the complex does not assert that all H_Ainf^i are finite free.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, §14, Theorem 1.8; printed p.5.

### proper-perfectness — Perfectness of proper A_inf cohomology

Target `AInfCohomology:AI.5/proper-perfectness` (theorem).

**Statement.** RΓ_Ainf is a perfect A_inf complex. It is derived xi-complete and its theta reduction is the proper de Rham complex, which is perfect over O_C; the lifted bounded finite-projective criterion proves perfectness over A_inf.

**Hypotheses.** Smooth proper formal O_C-scheme; derived completeness and finite-reduction criterion from E4/DD.1.

**Dependencies.** `AInfCohomology:AI.5/proper-ainf-complex`; `AInfCohomology:AI.3/aomega-frobenius`; `AInfCohomology:AI.4/de-rham`; `EnhancedDerivedSheaves:E4/mod-ideal-detection`; `DerivedDeRhamCohomology:DD.1/derived-completion`; `DerivedDeRhamCohomology:DD.5/proper-smooth-cohomological-control`.

**Proof or construction.** Import the lower-tier coefficient-free proper smooth de Rham perfectness theorem DD.5/proper-smooth-cohomological-control. Its finite-level Hodge filtration and compatible perfect-complex lifting apply over O_C without a Noetherian hypothesis. Lift a bounded finite-projective complex through the regular xi-adic tower. Use completeness to identify the lift.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 14.3(i) and proof, printed pp.119–120.

### global-de-rham — Proper de Rham specialization

Target `AInfCohomology:AI.5/global-de-rham` (comparison).

**Statement.** RΓ_Ainf tensor^L_(A_inf,theta) O_C≃RΓ_dR(mathfrak X/O_C), with cup products and functoriality. Perfect coefficient exchange justifies globalizing the local comparison.

**Hypotheses.** Proper smooth; derived scalar extension.

**Dependencies.** `AInfCohomology:AI.5/proper-perfectness`; `AInfCohomology:AI.4/de-rham`; `DerivedDeRhamCohomology:DD.1/completion-exchanges`.

**Proof or construction.** Use perfect tensor exchange with derived global sections and the local de Rham comparison.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 14.3; printed p.119.

### global-acrys — Proper A_crys specialization

Target `AInfCohomology:AI.5/global-acrys` (comparison).

**Statement.** RΓ_Ainf completed-tensor^L A_crys≃RΓ_crys(mathfrak X_(O_C/p)/A_crys), compatibly with Frobenius and products. Bounded divided-power Frobenius diagrams use phi^r-twisted coefficient subrings A_crys^(m), as corrected in Theorem 14.1.

**Hypotheses.** Proper smooth; derived p-completion; explicit Frobenius scalar twisting.

**Dependencies.** `AInfCohomology:AI.5/proper-perfectness`; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `CrystallineCohomology:CR.3/derived-base-change`.

**Proof or construction.** Globalize the all-coordinate local equivalence via proper perfect tensor exchange. Track phi^r on each bounded coefficient stage before the colimit.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorems 14.1 and 14.3 (PAPER-BHATT-MORROW-SCHOLZE-18/E18); printed pp.118–119.

### global-witt — Proper Witt special-fiber specialization

Target `AInfCohomology:AI.5/global-witt` (comparison).

**Statement.** RΓ_Ainf tensor^L A_inf W(k)≃RΓ_crys(mathfrak X_k/W(k)), using the fixed Witt residue map. It respects semilinear Frobenius and cup products; torsion remains in the derived object.

**Hypotheses.** Proper smooth; perfect complex; k perfect.

**Dependencies.** `AInfCohomology:AI.5/global-acrys`; `AInfCohomology:AI.4/crystalline-witt-special-fiber`; `CrystallineCohomology:CR.3/derived-base-change`.

**Proof or construction.** Apply crystalline derived base change along the common A_crys→W(k) map.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 14.3; printed p.119.

### global-etale — Proper mu-inverted étale comparison

Target `AInfCohomology:AI.5/global-etale` (comparison).

**Statement.** RΓ_Ainf[1/mu]≃RΓ_et(X,Z_p) tensor_Z_p A_inf[1/mu] for the analytic generic fiber X; proper finite étale cohomology allows the final source simplification of completion. The integral primitive A_inf comparison is requested as an early primitive-comparison extension of P8:local-rational, independent of its subsequent proper rational suffix.

**Hypotheses.** Smooth proper formal scheme; actual generic-fiber p-adic étale cohomology; primitive comparison theorem as in BMS1 Theorem 5.7.

**Dependencies.** `AInfCohomology:AI.5/proper-perfectness`; `AInfCohomology:AI.4/mu-inverted-etale`; `PadicHodgeTheory:P8:local-rational`.

**Proof or construction.** Use the primitive comparison with A_inf coefficients and invert the almost parameter. Use proper finiteness to exchange finite cohomology and the required coefficient completion.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 5.7; Theorem 14.3; printed pp.47–119.

### rational-crystalline-frobenius — Primitive rational crystalline Frobenius input

Target `AInfCohomology:AI.5/rational-crystalline-frobenius` (lemma).

**Statement.** Fix a section k→O_C/p. For Y=mathfrak X_(O_C/p) with mathfrak X proper smooth, there is a canonical phi-equivariant isomorphism H_crys^i(Y/A_crys)[1/p]≅H_crys^i(mathfrak X_k/W(k)) tensor_W(k) A_crys[1/p]. In particular the left side is finite free over A_crys[1/p], hence its B_crys^+ realization is free as required by Corollary 4.20. This is BMS1 Proposition 13.21, requested from CR.3 as an early Berthelot–Ogus bridge; it is not a consequence of the existing rational-frobenius node alone.

**Hypotheses.** C complete algebraically closed of characteristic zero, residue field k, and a specified section k→O_C/p. mathfrak X proper smooth over O_C; use the specified section-induced W(k)→A_crys map.

**Dependencies.** `AInfCohomology:AI.5/global-acrys`; `CrystallineCohomology:CR.3/derived-base-change`; `CrystallineCohomology:CR.3:Frobenius-isogeny/rational-frobenius`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`.

**Proof or construction.** Request the non-Noetherian A_crys version of rational Frobenius bijectivity for qcqs smooth O_C/p-schemes, using affine reduction and descent along p^(1/p^n) thickenings to the residue field. Iterate Frobenius-twisted crystalline base change. Use finite presentation to descend Y to its special fiber modulo p^(1/p^n); after enlarging n the choices agree. Apply proper crystalline finiteness over W(k) and extend to A_crys[1/p] and B_crys^+. Retain the fixed residue-field section and do not assume H_Ainf[1/p] free beforehand.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Proposition 13.21, printed pp.116–117; Theorem 14.3 proof, pp.119–120.

### finite-level-length-bound — Length increase under Witt specialization

Target `AInfCohomology:AI.5/finite-level-length-bound` (lemma).

**Statement.** For a finitely presented W_n(O_C^flat)-module M, the generic and residue specializations have finite length and l(M_eta)=l(M_s)−l(Tor_1(M,W_n(k)))≤l(M_s).

**Hypotheses.** n≥1; generic W_n(C^flat) and residue W_n(k); finite presentation.

**Dependencies.** `AInfCohomology:AI.2/ainf-tor-bounds`.

**Proof or construction.** Use Tor-dimension and Euler characteristic additivity. Devise by p and the finitely presented valuation-module classification.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.14; printed p.37.

### specialization-rank-and-length — Rank and torsion-length comparison

Target `AInfCohomology:AI.5/specialization-rank-and-length` (lemma).

**Statement.** For finitely presented M with M[1/p] finite free, M⊗W(C^flat) and M⊗W(k) have equal rank; for every n≥1, l((M⊗W(k))/p^n)≥l((M⊗W(C^flat))/p^n).

**Hypotheses.** Ordinary scalar extensions; source finite presentation; no assertion that either torsion group is a subquotient of the other.

**Dependencies.** `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.2/ainf-module-structure`.

**Proof or construction.** Compare ranks after p-inversion. Apply the finite-level length bound to M/p^n.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Corollary 4.15; printed p.38.

### derived-witt-cohomology-injection — Injection into derived Witt specialization

Target `AInfCohomology:AI.5/derived-witt-cohomology-injection` (lemma).

**Statement.** For C with every H^j(C)[1/p] free, H^i(C)⊗W(k)→H^i(C tensor^L W(k)) is injective and an isomorphism after p-inversion. It is an integral isomorphism if H^(i+1)(C) has no x-torsion.

**Hypotheses.** Unbounded C allowed as in the source; all p-local cohomology free; x=[varpi^flat].

**Dependencies.** `AInfCohomology:AI.2/ainf-tor-bounds`; `AInfCohomology:AI.0:integral/residue-map`.

**Proof or construction.** First use the filtered x-root quotient model and its Koszul resolution. Compare its p-completion with W(k); the kernel is p-inverted and tensor-exact under the source hypothesis.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.16; printed p.38.

### adjacent-degree-freeness — Finite presentation and adjacent-degree freeness

Target `AInfCohomology:AI.5/adjacent-degree-freeness` (theorem).

**Statement.** For a perfect C with all H^j(C)[1/p] free, every H^j(C) is finitely presented. If H^i(C tensor^L W(k)) is p-torsion-free, H^i(C) is finite free. If also H^(i+1)(C)⊗W(k) is p-torsion-free, H^i(C)⊗W(k)≅H^i(C tensor^L W(k)).

**Hypotheses.** Perfect C; all p-local cohomology free; retain the adjacent-degree hypothesis.

**Dependencies.** `AInfCohomology:AI.5/derived-witt-cohomology-injection`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.2/ainf-module-perfectness`.

**Proof or construction.** Descend in cohomological degree using perfectness of the next truncation. Apply the structure theorem for degree-i freeness and use degree i+1 to eliminate the Tor obstruction.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Corollary 4.17; printed p.39.

### de-rham-crystalline-torsion-equivalence — De Rham and crystalline torsion-freeness criterion

Target `AInfCohomology:AI.5/de-rham-crystalline-torsion-equivalence` (lemma).

**Statement.** For perfect C over A_inf with every H^j(C)[1/p] free, H^i(C tensor^L W(k)) is p-torsion-free iff H^i(C tensor^L_(theta) O_C) is p-torsion-free.

**Hypotheses.** Mixed characteristic and all p-power roots of unity; perfect C and free p-local cohomology.

**Dependencies.** `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.2/ainf-tor-bounds`.

**Proof or construction.** Apply the finite-free criterion to H^i(C). Compare good truncations after the two scalar extensions and then reduce to the common residue field k.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.18; printed p.39.

### p-local-freeness-from-periods — p-local freeness from two period realizations

Target `AInfCohomology:AI.5/p-local-freeness-from-periods` (lemma).

**Statement.** For finitely presented M, if M[1/(p mu)] is finite projective and M⊗B_crys^+ is finite projective, then M[1/p] is finite free.

**Hypotheses.** Mixed characteristic cyclotomic base; common B_crys^+ and its map to the mu-adic completion of A_inf[1/p].

**Dependencies.** `AInfCohomology:AI.2/punctured-vector-bundle-criterion`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.2/linear-module-patching`.

**Proof or construction.** Construct the factorization through B_crys^+ using bounded divided-power estimates. Apply Beauville–Laszlo and prove absence of mu-torsion by the source flat coefficient sequence.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Lemma 4.19; printed p.39.

### cohomology-finiteness-from-periods — Cohomology finiteness from period realizations

Target `AInfCohomology:AI.5/cohomology-finiteness-from-periods` (lemma).

**Statement.** For perfect C with H^j(C)[1/(p mu)] free and H^j(C tensor^L B_crys^+) free for every j, every H^j(C) is finitely presented and free after p-inversion. The finite-free and adjacent-degree conclusions of Corollary 4.17 then apply.

**Hypotheses.** Perfect C and both free realization hypotheses; neither deduced merely from finiteness.

**Dependencies.** `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/adjacent-degree-freeness`.

**Proof or construction.** Use descending induction on top cohomology and the module criterion. Apply the already proved adjacent-degree package.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Corollary 4.20; printed p.40.

### global-bkf — BKF structure on proper cohomology

Target `AInfCohomology:AI.5/global-bkf` (theorem).

**Statement.** Each H_Ainf^i is finitely presented and free after p-inversion, and the localized linearized Frobenius makes it a BKF module. This follows from the two period realizations and rational crystalline Frobenius, without assuming all integral cohomology is free.

**Hypotheses.** Smooth proper formal scheme; all proper comparisons and primitive inputs established.

**Dependencies.** `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `AInfCohomology:AI.5/global-etale`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.3/aomega-frobenius`.

**Proof or construction.** Use proper perfectness and the free p-mu and B_crys^+ realizations. Apply Corollary 4.20 and then the localized Frobenius factorization.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorem 14.3; §14; printed p.119.

### torsion-and-lattice-export — Torsion and lattice exports to CP.5

Target `AInfCohomology:AI.5/torsion-and-lattice-export` (application).

**Statement.** Export the generic length inequality and adjacent-degree recovery maps to CP.5. For the proper complex they give crystalline torsion-length bounds against generic-fiber étale torsion and finite-free lattice recovery when the source consecutive crystalline degrees are torsion-free. CP.5 owns the uniform geometric formulation and examples.

**Hypotheses.** Use H^i and H^(i+1) hypotheses exactly where the recovery map needs them.

**Dependencies.** `AInfCohomology:AI.5/global-bkf`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.2/fargues-full-faithfulness`.

**Proof or construction.** Apply the generic module estimates to the proper BKF cohomology. Use the derived-specialization injection and adjacent-degree criterion before extracting an ordinary lattice. Check the BMS §2 strict-inequality and non-subquotient examples as CP.5 acceptance cases, not prerequisites upstream of AI.2.

**Check.** Retain every hypothesis, coefficient map, grading and completion in the displayed mathematical export.

**Source.** bms1-v3, Theorems 1.1,1.8, printed pp.2–3,5–7; Theorems 14.5–14.6, pp.120–122; §2, pp.11–18.

## AI.6 — Semistable AΩ and logarithmic specializations

First compute a semistable chart and its nonflat root tower, then the integral/logarithmic comparisons on all-coordinate models. The canonical generic-fibre B_dR⁺ deformation is owned here: complete along the full embedding ideal, contract redundant coordinates, and prove proper finite freeness by spreading out. Compare the specified maps before deriving torsion inequalities or a model-independent lattice.

### chart-ring — Standard semistable chart ring

Target `AInfCohomology:AI.6/chart-ring` (definition).

**Statement.** For a commutative ring R, π∈R and integers r,s≥0, let P=R[T₀,…,Tᵣ,Y₁,Z₁,…,Yₛ,Zₛ]. Let J be generated by ∏Tᵢ−π and YⱼZⱼ−1. The algebraic chart Q=P/J and its ordinary p-adic completion R□=AdicCompletion((p),Q) give the restricted-power-series chart. In CK use R=O_C and π=p^q, q∈Q>0; the torus coordinates are Yⱼ. The construction here is this chart, not a general formal scheme.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. p-adic completion is along the image of the integer p; π=p^q with the fixed roots in the CK application.

**Dependencies.** `mathlib:MvPolynomial`; `mathlib:Ideal.Quotient.mk`; `mathlib:AdicCompletion`; `mathlib:AdicCompletion.evalₐ`; `mathlib:AdicCompletion.evalₐ_of`; `mathlib:AdicCompletion.liftRingHom`; `mathlib:IsAdicComplete.liftRingHom`; `mathlib:AdicCompletion.isAdicComplete`.

**Proof or construction.** Use Mathlib multivariable polynomials and Ideal.Quotient for Q. Use the existing AdicCompletion ring instance and quotient projections. Identification with CK (1.5.1) (CK does not spell this out; it uses the explicit decomposition (3.2.1)): f=T₀⋯Tᵣ−p^q is a nonzerodivisor modulo p, because as a polynomial in T₀ its leading coefficient T₁⋯Tᵣ is a nonzerodivisor (for r=0 it is monic); hence the principal ideal (f) of O_C{t₀,…,tᵣ,t_{r+1}^{±1},…,t_d^{±1}} is p-adically closed, the quotient is p-torsion-free and p-adically complete, and it equals lim_n Q/p^n.

**Uses.**

- CK §§3.1,5.9: The chart controls the root tower and its Frobenius lift.
- AInfCohomology:AI.6: A nodal chart detects singular special fibre without replacing the generic fibre by it.

**API.**

- `Semistable.chartRing.branch_relation` (relation): In the completion, ∏ᵢTᵢ equals the image of π.
- `Semistable.chartRing.torus_inverse` (simp): The images of Yⱼ and Zⱼ multiply to 1.
- `Semistable.chartRing.reduction` (compatibility): Projection to level n sends a polynomial class to its class in Q/(p)^n, agreeing with AdicCompletion.evalₐ and Ideal.Quotient.mk.
- `Semistable.chartRing.lift` (universal-property): A ring map R→B and branch/torus values satisfying the relations induce a unique map Q→B. If moreover I⊂B is an ideal containing the image of p, a compatible family of ring maps Q→B/I^n induces a unique ring map from AdicCompletion((p),Q) to lim_n B/I^n compatible with the projections evalₐ.

**Definition tests.**

- `Semistable.chartRing.nodal` (computation): For r=1,s=0, T₀T₁=π in R□.
- `Semistable.chartRing.unit_coordinate` (computation): For s=1, Y₁Z₁=1, including after reduction modulo p.
- `Semistable.chartRing.point` (degenerate): For r=s=0, Q≃R by T₀↦π, and R□≃AdicCompletion((p),R).
- `Semistable.chartRing.restricted` (non-example): For R=Z_p, π=p, r=1, s=0: evalₐ at level 1 induces R□/pR□≅F_p[T₀,T₁]/(T₀T₁), and 1−T₀ is not a unit of R□ (its image in F_p[T₀,T₁]/(T₀T₁,T₁)=F_p[T₀] is not a unit). In the completion along (p,T₀,T₁) it would be a unit.

**Check.** The completed nodal relation is T₀T₁=π. At r=s=0 the completion is the p-adic completion of R.

**Source.** CK, §1.5, (1.5.1), p.4; CK, §1.5, sentence after (1.5.1), p.4; CK, §1.5, p.4; CK, §1.7, p.6.

### divisorial-log — Divisorial semistable log structure

Target `AInfCohomology:AI.6/divisorial-log` (construction).

**Statement.** For a CK formal model 𝔛, take the associated log structure of O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét; the base prelog monoid is O_C∖{0}. On a chart it is the pushout of ℕ^{r+1} along the diagonal ℕ→ℕ^{r+1} and 1↦p^q in O_C∖{0}. It is quasi-coherent and integral; the base need not be fine. Every local section of the log structure becomes a unit after inverting p.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is a p-adic formal scheme over O_C that étale locally admits the charts (1.5.1); flatness and local finite presentation of each 𝔛⊗O_C/p^n over O_C/p^n follow from the charts.

**Dependencies.** `AInfCohomology:AI.6/chart-ring`; `CrystallineCohomology:CR.5:log-algebra`.

**Proof or construction.** Import associated log structures and integral monoid pushouts from CR.5:log-algebra. CK Claim 1.6.1 (chart (1.6.2)), for a scheme U étale over Spec O[t₀,…,tᵣ,t_{r+1}^{±1},…,t_d^{±1}]/(t₀⋯tᵣ−π) with O a valuation subring of the integral closure of W(k̄) and π a nonzero nonunit: by a limit argument O may be taken discretely valued; then U with the chart log structure is logarithmically regular (Kato, Toric singularities, 2.1), its locus of triviality is U[1/p], and Kato, Toric singularities, Theorem 11.6 identifies it with the log structure of O_U∩(O_U[1/p])×. (Kato’s results: CR.5:log-algebra.) CK Claim 1.6.3: for a flat O-scheme the p-adic completion morphism is strict for these log structures (comparison of stalks modulo units, using Stacks Project 04D1). Since the chart (1.5.1) is the p-adic completion of the base change of an étale O-morphism (1.5.2), the chart (1.6.2) with O replaced by O_C and π=p^q is a chart on 𝔛; quasi-coherence and integrality follow. Use fine versions only when the log-crystalline site requires them.

**Uses.**

- CK Theorems 4.11,4.17,5.4: Log differentials and log crystalline cohomology require the actual divisorial chart.
- CrystallineCohomology:CR.6: The arithmetic log special fibre must be matched to Hyodo–Kato conventions.

**API.**

- `Semistable.divisorialLog.chart` (characterisation): The associated chart is ℕ^{r+1}⊔_ℕ(O_C∖{0}) with the displayed maps.
- `Semistable.divisorialLog.pullback` (functoriality): Strict étale chart pullback agrees with the divisorial log structure, and composes under refinement.
- `Semistable.divisorialLog.generic` (compatibility): Every local section of the log structure is invertible in O_𝔛,ét[1/p]; for the algebraic model U of CK Claim 1.6.1 the locus of triviality of the log structure is U[1/p].

**Definition tests.**

- `Semistable.divisorialLog.node` (computation): At the closed node of T₀T₁=p^q the stalk of M/O^× is ℕ²⊔_ℕℚ≥0 (classes e₀, e₁ of T₀, T₁ and the value monoid ℚ≥0 of O_C∖{0}, with e₀+e₁=q), and its quotient by the image of the base monoid ℚ≥0 is ℕ²/ℕ(1,1)≅ℤ via (a,b)↦a−b.
- `Semistable.divisorialLog.smooth` (compatibility): At r=0 (t₀=p^q, R□≅O_C{t₁^{±1},…,t_d^{±1}}) the chart monoid is ℕ⊔_ℕ(O_C∖{0})=O_C∖{0}, the map to Spf O_C is strict, and the relative log differentials are the ordinary differentials, free on dt₁/t₁,…,dt_d/t_d.
- `Semistable.divisorialLog.nonfine` (non-example): The base chart O_C∖{0} has value monoid Q≥0 in the CK setup, which is not finitely generated; no fine hypothesis is asserted for this chart.

**Check.** At a node the two branch generators satisfy dlogT₀+dlogT₁=0 over the log base.

**Source.** CK, §1.6 (1), p.5; CK, §1.6 (2), p.5; CK, §1.6, p.5; CK, §1.6, p.5; CK, Claim 1.6.1 (proof), p.6; CK, Claim 1.6.3, (1.6.4), p.6.

### root-tower — Semistable perfectoid root tower

Target `AInfCohomology:AI.6/root-tower` (construction).

**Statement.** Given an étale morphism Spf(R)→Spf(R□) of p-adic formal schemes, form R_m by base change from the chart adjoining p^m-th roots of every branch and invertible coordinate and imposing ∏Tᵢ^{1/p^m}=p^{q/p^m}. Set R_∞ to the p-adic completion of colim_mR_m. Its generic fibre is an affinoid perfectoid pro-(finite étale) cover with group Δ={(ε₀,…,ε_d)∈(lim_m μ_{p^m}(O_C))^{d+1}:∏_{i=0}^rεᵢ=1}≃Z_p^d; R_∞ is integral perfectoid.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. R is a p-adically complete O_C-algebra with an étale morphism Spf(R)→Spf(R□) as in CK (3.1.1): each R/p^n is étale over R□/p^n (étale, not merely formally étale); roots use the fixed compatible systems.

**Dependencies.** `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.6/monomial-exponents`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PerfectoidSpaces:P4/integral-perfectoid-criterion-for-annuli`; `AdicEtaleGeometry:A1/pro-etale-site-corrected`.

**Proof or construction.** CK (3.2.1): R□_m is the p-adically completed direct sum of O_C·t^a over the normalized exponents a of monomial-exponents with p^m·a integral, and R□_∞ is the p-adically completed direct sum of O_C·t^a over all a in (Z[1/p]≥0)^{r+1}⊕Z[1/p]^{d−r} with a_j=0 for some 0≤j≤r; each R□_m→R□_∞ is the inclusion of the direct summand formed by those summands. Do not assert integral flatness of the tower over R□. Perfectoidness (CK §1.7 and §3.2; BMS1 Lemmas 3.9 and 3.10): R□_∞ is p-torsion-free and p-adically complete and Frobenius R□_∞/p^{1/p}→R□_∞/p is bijective on the monomial basis, so R□_∞ is integral perfectoid by the criterion of PerfectoidSpaces:P4/integral-perfectoid-criterion-for-annuli applied to the pair (R□_∞,p^{1/p}); the annulus worked out in that node is the case r=1, d=1 with exponent in Z[1/p], and for general r, d and q∈Q>0 the hypothesis of the criterion is checked on the basis of step 1. R is R□-flat and each R_m=R⊗_{R□}R□_m is p-torsion-free, p-adically formally étale over R□_m and p-adically complete (Gabber–Ramero, Almost ring theory, 7.1.6); hence R_∞ is p-adically formally étale over R□_∞, p-adically complete and integral perfectoid. Group and action (CK §3.2): Δ acts R□-linearly on R□_m by scaling t_j^{1/p^m} by the μ_{p^m}-component of ε_j; compute the generators δᵢ and the isomorphism Δ≃Z_p^d. Cover (CK §3.2): R□_m[1/p] is obtained from R□[1/p] by adjoining p^m-th roots of the units t₁,…,t_d, hence is finite étale of degree p^{md}, and R□_m=(R□_m[1/p])°; so lim Spa(R_m[1/p],R_m) is a finite-étale tower over the adic generic fibre, a covering of AdicEtaleGeometry:A1/pro-etale-site-corrected, with group Δ. That it is affinoid perfectoid and that Ô⁺ takes the value R_∞ on it (Scholze, p-adic Hodge theory for rigid-analytic varieties, 4.10(iii)) is supplied by AI.3.

**Uses.**

- CK §§3.14–3.25: Continuous cochains on this actual cover give the local AΩ comparison.

**API.**

- `Semistable.rootTower.transition` (data): Level m embeds into level m+1 by sending each root to the p-th power of the next root.
- `Semistable.rootTower.action` (structure): The continuous Δ-action scales each compatible root t_j^{1/p^m} by the μ_{p^m}-component of ε_j and preserves the branch-product relation because ε₀⋯εᵣ=1. Δ is topologically freely generated by δᵢ=(ε⁻¹,1,…,1,ε,1,…,1) (entries 0 and i) for 1≤i≤r and δᵢ=(1,…,1,ε,1,…,1) (entry i) for r<i≤d.
- `Semistable.rootTower.perfectoid` (compatibility): R_∞ is p-torsion-free, p-adically complete and integral perfectoid (Frobenius R_∞/p^{1/p}→R_∞/p is bijective), and the tower lim Spa(R_m[1/p],R_m) is a finite-étale tower over the adic generic fibre, hence a covering in its pro-étale site, with group Δ.
- `Semistable.rootTower.generic_finite_etale` (characterisation): For each m, R□_m[1/p] is the direct sum of R□[1/p]·t₁^{a₁}⋯t_d^{a_d} over a₁,…,a_d∈{0,1/p^m,…,(p^m−1)/p^m}; it is finite étale of degree p^{md} over R□[1/p], and R□_m is the ring of power-bounded elements of R□_m[1/p].

**Definition tests.**

- `Semistable.rootTower.node_action` (computation): For T₀T₁=p^q and the generator δ₁=(ε⁻¹,ε) of Δ, δ₁(T₀^{1/p^m})=ζ_{p^m}^{-1}T₀^{1/p^m} and δ₁(T₁^{1/p^m})=ζ_{p^m}T₁^{1/p^m}, where ζ_{p^m} is the p^m-th component of ε.
- `Semistable.rootTower.point` (degenerate): For r=s=0 the tower is O_C with trivial Δ.
- `Semistable.rootTower.nonflat` (non-example): For the nodal chart at p=2,m=1, the generic root cover has rank 2 but its closed-node special-fibre algebra has basis 1,a,b and length 3 (a²=b²=ab=0); the integral map is not flat.

**Check.** The group has rank d rather than d+1; the node remains nonflat integrally.

**Source.** CK, §3.1, (3.1.1), p.10; CK, §3 (introduction), p.10; CK, §3.2, p.10; CK, §1.7, p.7; CK, §3.2, p.11; CK, §3.2, p.11.

### monomial-exponents — Normalized semistable monomial indices

Target `AInfCohomology:AI.6/monomial-exponents` (definition).

**Statement.** At root level m, an index consists of a∈ℕ^{r+1}, b∈ℤ^s and a branch j with a_j=0, modulo equality of a and b (the witness j is not extra data). It represents ∏Tᵢ^{aᵢ/p^m}∏Yⱼ^{bⱼ/p^m}. Normalize an arbitrary a by subtracting min_i a_i; the removed factor is p^{q·min(a)/p^m}. The index is integral precisely when p^m divides every a_i and b_j. Level-m and level-(m+1) indices are identified by (a,b)↦(pa,pb); the union over m is the index set of CK (3.2.1), namely (Z[1/p]≥0)^{r+1}⊕Z[1/p]^{d−r} with a_j=0 for some branch j (s=d−r).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. r+1 is nonempty; signed torus exponents are essential; normalization acts on branch exponents only.

**Dependencies.** `AInfCohomology:AI.6/chart-ring`; `mathlib:Finset.max'`.

**Proof or construction.** Use finite tuples and integer divisibility from the baseline. Apply the unique normal form of the completed direct sum decomposition CK (3.2.1) (monomials with a_j=0 for some 0≤j≤r); retain the removed coefficient p^{q·min(a)/p^m} instead of deleting it. The Δ-weights are those of CK (3.19.3) and the exact level is the m of CK §3.22 (the least m with p^m·a integral, equivalently with p^m·b integral for the weights b); both are definitions on indices and need no further input.

**Uses.**

- CK §3.2, §3.11, §3.14, proof of Proposition 3.19, §3.22: The integral/nonintegral splitting, the exact-level decomposition and the Δ-eigencharacters use these normalized indices.

**API.**

- `Semistable.monomialExponents.normalize` (constructor): Normalization sends a to a−min(a) coordinatewise and records min(a).
- `Semistable.monomialExponents.normalized` (characterisation): A branch exponent is normalized iff at least one coordinate is zero; normalize fixes such tuples.
- `Semistable.monomialExponents.integral` (characterisation): At level m integrality means simultaneous divisibility by p^m of branch and signed torus numerators.
- `Semistable.monomialExponents.transition` (functoriality): (a,b)↦(pa,pb) maps level-m indices to level-(m+1) indices, preserves normalization and integrality, and represents the same monomial.
- `Semistable.monomialExponents.level` (data): The exact level of a level-m index is the least m′≤m such that p^{m−m′} divides every a_i and b_j; the index is integral iff its exact level is 0, and the exact level is unchanged by transition.
- `Semistable.monomialExponents.weight` (data): The Δ-weights of a level-m index are w_j=a_j−a₀ for 1≤j≤r and w_j=b_j for the torus directions (CK (3.19.3), in units of 1/p^m); the generator δ_j of Δ scales the monomial by ε^{w_j/p^m}. The exact level is also the least m′≤m such that p^{m−m′} divides every w_j; in particular a nonintegral index has a weight not divisible by p^m.

**Definition tests.**

- `Semistable.monomialExponents.node` (computation): normalize(2,3)=(0,1) and the removed minimum is 2.
- `Semistable.monomialExponents.point` (degenerate): For r=s=0 the sole normalized branch exponent is 0 and every level has only the integral index.
- `Semistable.monomialExponents.fractional_torus` (non-example): At p=2,m=1, branch tuple (0,2) and torus numerator −1 give a nonintegral index; ignoring negative torus exponents would give the wrong answer.
- `Semistable.monomialExponents.level_weight` (computation): For p=2, r=1, s=1: the level-1 index ((0,2),(4)) is the transition of the level-0 index ((0,1),(2)) and has exact level 0; the level-2 index ((0,2),(1)) has exact level 2 and weights (2,1); the level-1 index ((1,0),(0)) has weights (−1,0) and exact level 1.

**Check.** The normalized node monomial T₀²T₁³ has coefficient p^{2q} and exponent (0,1).

**Source.** CK, §3.2, (3.2.1), p.10; CK, §3.2, (3.2.1), p.10; CK, §3.2, p.10; CK, §3.14, p.15; CK, Proposition 3.19 (proof), (3.19.3), p.17; CK, §3.22, p.18.

### monomial-splitting — Integral and nonintegral monomial splitting

Target `AInfCohomology:AI.6/monomial-splitting` (theorem).

**Statement.** The completed monomial expansion yields Δ-equivariant decompositions R_∞=R⊕M_∞ of R-modules and A_inf(R_∞)=A(R)⊕N_∞ of A(R)-modules, with integral indices in the first summand and nonintegral indices in the second; A(R) is the (p,μ)-complete lift of ainf-chart-lift. Modulo ξ the second decomposition reduces to the first, so N_∞/ξ≅M_∞. These are completed module decompositions, not a direct product of rings.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. X=Spf(R) with an étale coordinate map as in CK (3.1.1); completions are p-adic in (3.2.1)–(3.2.2) and (p,μ)-adic in §3.14.

**Dependencies.** `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/monomial-exponents`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`.

**Proof or construction.** CK (3.2.1)–(3.2.2): R□_∞ is the p-adically completed direct sum of O_C·t^a over the normalized exponents (root-tower, monomial-exponents); the summands with some a_j∉Z form the R□-submodule M□_∞, and base change along the étale map R□→R gives M_∞:=R⊗̂_{R□}M□_∞ and R_∞≅R⊕M_∞. Δ preserves the decompositions. CK §3.11 and §3.14: the tilt (R□_∞)^♭ is the p^{1/p^∞}-adically completed direct sum of O_C^♭·x^a, where x_i^{1/p^m} is the compatible system (…,t_i^{1/p^{m+1}},t_i^{1/p^m}), and R_∞^♭ is the completed étale lift of R_∞/p. Since W(A) is the unique p-adically complete p-torsion-free Z_p-algebra lifting a perfect F_p-algebra A, with Teichmüller lifts computed as limits of p^n-th powers (Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic p, 2.4–2.5; AI.0:integral), A_inf(R□_∞) is the (p,μ)-adically completed direct sum of A_inf·X^a with X_i^{1/p^m}=[x_i^{1/p^m}]; the integral summands form the subring A(R□), the others the A(R□)-submodule N□_∞. CK (3.14.3)–(3.14.5): with the lift A(R) of ainf-chart-lift, A_inf(R_∞)≅A_inf(R□_∞)⊗̂_{A(R□)}A(R), completion (p,μ)-adic (the value of A_inf,X on the cover is W(R_∞^♭), Scholze, p-adic Hodge theory for rigid-analytic varieties, 6.5(i); AI.3); set N_∞:=N□_∞⊗̂_{A(R□)}A(R). The decompositions are Δ-equivariant and reduce modulo ξ to (3.2.2).

**Check.** The product of two nonintegral monomials can be integral, so N_∞ is not asserted to be an ideal. Under the embedding of A(R□) into A_inf(R□_∞), Xᵢ=[xᵢ] with xᵢ=(…,tᵢ^{1/p},tᵢ); on the nonintegral monomial X₁^{1/p} of the node chart, δ₁−1 is multiplication by [ε^{1/p}]−1=φ⁻¹(μ), which is not divisible by μ, whereas on the integral summand A(R□) every δ−1 is divisible by μ.

**Source.** CK, §3.2, (3.2.2), p.10; CK, §3.2, p.11; CK, §3.11, p.14; CK, §3.14, p.15; CK, §3.14, (3.14.5), p.15; CK, §3.14, p.15; CK, §3.14, p.15.

### ainf-chart-lift — Integral A_inf chart lift

Target `AInfCohomology:AI.6/ainf-chart-lift` (construction).

**Statement.** Let A(R□)=A_inf{X₀,…,Xᵣ,X_{r+1}^{±1},…,X_d^{±1}}/(∏Xᵢ−[(p^{1/p∞})^q]), completed for (p,μ), with the surjection θ:A(R□)→R□, Xᵢ↦tᵢ. Using θ, lift the étale R□/p-algebra R/p uniquely to a (p,μ)-adically complete, formally étale A(R□)-algebra A(R). It has Frobenius Xᵢ↦Xᵢ^p and the integral Δ-action from the root tower, which is trivial modulo μ; reduction along θ is R.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. X=Spf(R) with an étale coordinate map as in CK (3.1.1). Use the fixed compatible roots; the lift is of the specified étale chart algebra, not an arbitrary singular A_inf-algebra.

**Dependencies.** `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`.

**Proof or construction.** Define A(R□) by the presentation CK (3.14.2), convergence being (p,μ)-adic, with Frobenius semilinear over that of A_inf and Xᵢ↦Xᵢ^p, and with Δ acting by Xⱼ↦[εⱼ]Xⱼ (the relation is preserved because ε₀⋯εᵣ=1). The map θ of CK (3.14.3) is Xᵢ↦tᵢ over θ:A_inf→O_C (AI.0:integral); its kernel is generated by ξ. The ideal (p,ξ) of A(R□) is topologically nilpotent for the (p,μ)-adic topology and A(R□)/(p,ξ)=R□/p, so the étale R□/p-algebra R/p lifts uniquely to a (p,μ)-adically complete formally étale A(R□)-algebra A(R) (CK §3.14; unique lifting of étale algebras, Stacks Project 04D1; AI.3). By the same uniqueness the Frobenius and the Δ-action lift uniquely, the Δ-action being Frobenius-equivariant, and A(R)/ξ≅R. Δ acts trivially on A(R□)/μ because [εⱼ]≡1 modulo μ, hence trivially on A(R)/μ by uniqueness of lifts (CK §3.14). A(R) is μ-torsion-free: A(R□) is the (p,μ)-adic completion of a free A_inf-module on the integral monomials, so each (p^n,μ^{n′}) is a regular sequence on it with quotient free over A_inf/(p^n,μ^{n′}); A(R)/(p^n,μ^{n′}) is étale over A(R□)/(p^n,μ^{n′}), which gives the same regularity and flatness for A(R), and μ-torsion-freeness follows by (p,μ)-adic completeness (compare CK Lemma 3.13 and the proof of Proposition 5.6), so (δ−1)/μ is a well-defined A_inf-linear endomorphism of A(R) (CK §3.27). The identification of A(R) with the integral summand of A_inf(R_∞) is monomial-splitting, not this node.

**Uses.**

- CK §§3.19–3.25,5.10–5.16: Integral continuous cochains and log derivations act on A(R).

**API.**

- `Semistable.ainfChartLift.theta` (compatibility): A(R)⊗̂_{A_inf,θ}O_C≃R, agreeing with the imported θ.
- `Semistable.ainfChartLift.frobenius` (simp): φ(Xᵢ)=Xᵢ^p and φ acts by Witt Frobenius on coefficients.
- `Semistable.ainfChartLift.etale` (universal-property): The lift A(R) of the étale R□/p-algebra R/p is unique up to unique isomorphism; for a map R→R′ of étale R□-algebras there is a unique compatible map A(R)→A(R′), and the Frobenius and the Δ-action of A(R) are the unique lifts of those of A(R□).
- `Semistable.ainfChartLift.delta_monomial` (simp): (ε₀,…,ε_d)∈Δ sends Xⱼ to [εⱼ]Xⱼ; the action is continuous, A_inf-linear and commutes with φ.
- `Semistable.ainfChartLift.delta_trivial_mod_mu` (relation): Δ acts trivially on A(R)/μ; for δ∈Δ the A_inf-linear map (δ−1)/μ:A(R)→A(R) is defined and δ=1+μ·(δ−1)/μ.

**Definition tests.**

- `Semistable.ainfChartLift.node` (computation): At r=1, X₀X₁=[(p^{1/p∞})^q] before θ-reduction.
- `Semistable.ainfChartLift.point` (degenerate): At R=O_C the lift is A_inf.
- `Semistable.ainfChartLift.theta_tilde` (non-example): θ(Xᵢ)=tᵢ, and the reduction map A(R□)→R□ is θ. The formula θ̃=θ∘φ_A⁻¹ of A_inf does not define a map on A(R□): the Frobenius of A(R□) is not surjective, since Xᵢ is not in its image for a torus coordinate, nor for a branch coordinate when r≥1. So the reduction cannot be relabelled θ̃.
- `Semistable.ainfChartLift.delta_mod_mu` (computation): On the node chart, for δ₁=(ε⁻¹,ε): δ₁(X₁)−X₁=μ·X₁ and δ₁(X₀)−X₀=([ε]⁻¹−1)·X₀=−[ε]⁻¹·μ·X₀, both divisible by μ; so (δ₁−1)/μ sends X₁ to X₁ and X₀ to −[ε]⁻¹X₀.

**Check.** Frobenius raises the lifted relation to its p-th power and lifts absolute Frobenius mod p.

**Source.** CK, §3.14, (3.14.2), p.15; CK, §3.14, (3.14.2), p.15; CK, §3.14, p.15; CK, §3.14, (3.14.3), p.15; CK, §3.14, p.15; CK, §3.14, p.15; CK, §3.14, p.15.

### structure-sheaf-edge — Integral structure-sheaf edge comparison

Target `AInfCohomology:AI.6/structure-sheaf-edge` (theorem).

**Statement.** Let e: RΓ_cont(Δ,R_∞)→RΓ_proét(X_C^ad,Ô⁺) be the edge map of CK (3.3.1) for the Δ-cover of root-tower; by almost purity the maximal ideal m of O_C kills the cohomology of its cone. An O_C-module has no nonzero m-torsion if no nonzero element is annihilated by all of m. (a) For every i, ζ_p−1 kills H^i_cont(Δ,M_∞); for every b∈O_C, the O_C-modules R_∞/b and H^i_cont(Δ,R_∞/b) have no nonzero m-torsion (CK Proposition 3.8). (b) For every b∈O_C^♭∖{0}, R_∞^♭/b and H^i_cont(Δ,R_∞^♭/b) have no nonzero m^♭-torsion (CK Lemma 3.12). (c) Lη_{ζ_p−1}(e): Lη_{ζ_p−1}RΓ_cont(Δ,R_∞)→Lη_{ζ_p−1}RΓ_proét(X_C^ad,Ô⁺) is an isomorphism (CK Theorem 3.9). (d) The same holds for the edge map e′ of any pro-(finite étale) affinoid perfectoid Δ′-cover Spa(R′_∞[1/p],R′_∞)→X_C^ad that refines the Δ-cover compatibly with a continuous surjection Δ′→Δ of profinite groups (CK Remark 3.10).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. X=Spf(R) with an étale coordinate map as in CK (3.1.1); R_∞, Δ and M_∞ are those of root-tower and monomial-splitting, and R_∞^♭ is the tilt of R_∞.

**Dependencies.** `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/monomial-exponents`; `AInfCohomology:AI.6/monomial-splitting`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.1/decalage-cohomology`.

**Proof or construction.** Edge map (CK §3.3): the Čech complex of Ô⁺ for the cover is RΓ_cont(Δ,R_∞) (Scholze, p-adic Hodge theory for rigid-analytic varieties, 3.5, 3.7(iii) and 6.6, with its corrigendum), which gives e; by almost purity (loc. cit. 4.10(v); AI.3) m kills the cohomology of Cone(e). Single summand (proof of CK Proposition 3.8): for a summand S=O_C·t^a of (3.2.1), CK Lemma 3.7 (BMS1 Lemma 7.3(ii); AI.3) computes H^i_cont(Δ,S) as the cohomology of a tensor product of d complexes O_C→O_C, each multiplication by ζ−1 for a p-power root of unity ζ; these are defined over a discrete valuation subring of O_C, so CK Lemma 3.5 (for a discrete valuation ring o inside a non-discrete valuation ring O of rank 1 with maximal ideal M, (N⊗_o O)[M]=0) gives (3.8.1). If S is nonintegral some ζ is not 1, and ζ−1, hence ζ_p−1, kills H^i_cont(Δ,S) ((3.8.2)). Completed sums and base change: group the summands by exact level into M□_m (monomial-exponents). CK Lemma 3.6 (for p-adically complete p-torsion-free continuous modules M_j whose H^i_cont are all p-torsion-free, or all killed by one power of p, H^i_cont of the p-adically completed direct sum injects into the product of the H^i_cont(M_j)) gives (3.8.3). R is R□-flat, so H^i_cont(Δ,R⊗_{R□}M□_m)≅R⊗_{R□}H^i_cont(Δ,M□_m) ((3.8.4)), and Lemma 3.6 again shows that ζ_p−1 kills H^i_cont(Δ,M_∞). For b≠0 the summands of R_∞/(b,p^n) and the Δ-action on them are defined over discrete valuation subrings, so Lemmas 3.5 and 3.7 give the absence of m-torsion in R_∞/b and H^i_cont(Δ,R_∞/b); the case b=0 follows from the injection H^i_cont(Δ,M_∞)→H^i_cont(Δ,M_∞/(ζ_p−1)) and from H^i_cont(Δ,R) being a direct sum of copies of R. This proves (a). (b): one may assume b∈m^♭ and, using Frobenius, that b divides p^{1/p^∞} in O_C^♭; then R_∞^♭/b≅R_∞/b^♯ Δ-equivariantly for some b^♯∈O_C (tilt of monomial-splitting, CK §3.11), and (a) applies. (c): put M=H^i_cont(Δ,R_∞)=H^i_cont(Δ,R)⊕H^i_cont(Δ,M_∞). By (a), M has no nonzero m-torsion, and M/(ζ_p−1)M=H^i_cont(Δ,R)/(ζ_p−1)⊕H^i_cont(Δ,M_∞), a finite direct sum of copies of R/(ζ_p−1) plus a submodule of M, has none either. Since m kills the kernel and cokernel of H^i(e), CK Lemma 3.4 (BMS1 Lemma 8.11(i); AI.1) gives M/M[ζ_p−1]≅H^i(X_C^ad,Ô⁺)/H^i(X_C^ad,Ô⁺)[ζ_p−1], and these quotients compute the cohomology of Lη_{ζ_p−1} (AI.1/decalage-cohomology). CK's written proof checks the absence of m-torsion in M/M[ζ_p−1] instead of M/(ζ_p−1)M; the hypothesis of Lemma 3.4 is the latter, verified here from (a). (d): by almost purity m kills the cohomology of Cone(e′) as well, so by the octahedral axiom it kills that of the cone of RΓ_cont(Δ,R_∞)→RΓ_cont(Δ′,R′_∞); Lemma 3.4 applies to this map, with the same M, and combines with (c).

**Check.** For the torus chart R=O_C{t^{±1}} and S=O_C·t^{1/p}: the generator δ acts by ζ_p, so H⁰_cont(Δ,S)=0 and H¹_cont(Δ,S)=O_C/(ζ_p−1), which is killed by ζ_p−1 and has no nonzero m-torsion. For S=O_C·t^{1/p²} one gets O_C/(ζ_{p²}−1), killed by ζ_{p²}−1, which divides ζ_p−1. For R=O_C{t^{±1}}, Lη_{ζ_p−1}RΓ_cont(Δ,R_∞) has H⁰=R and H¹≅R (from the integral summand), so by (c) the same holds for Lη_{ζ_p−1}RΓ_proét(X_C^ad,Ô⁺), in agreement with H¹(Ω̃_𝔛)≅Ω¹{−1}. The statement is integral: before Lη_{ζ_p−1} the kernel and cokernel of H^i(e) are only known to be killed by m.

**Source.** CK, §3.3, (3.3.1), p.11; CK, Lemma 3.5, p.12; CK, Lemma 3.6, p.12; CK, Lemma 3.7, p.12; CK, Proposition 3.8, p.12; CK, Theorem 3.9, p.13; CK, Theorem 3.9 (proof), p.13; CK, Remark 3.10, p.13; CK, Lemma 3.12, p.14.

### nonintegral-annihilation — Nonintegral cohomology annihilation

Target `AInfCohomology:AI.6/nonintegral-annihilation` (theorem).

**Statement.** For every i∈Z: (a) μ annihilates H^i_cont(Δ,N_∞) (CK Proposition 3.25); equivalently Lη_μ of the Koszul complex of N_∞ on δ₁−1,…,δ_d−1 vanishes. (b) H^i_cont(Δ,A_inf(R_∞)/μ) is p-torsion-free and p-adically complete, the natural maps H^i_cont(Δ,A_inf(R_∞)/μ)⊗_{A_inf}A_inf/p^n→H^i_cont(Δ,A_inf(R_∞)/(μ,p^n)) are isomorphisms for n>0, and H^i_cont(Δ,A_inf(R_∞)/(μ,p^n)) and H^i_cont(Δ,A_inf(R_∞)/μ) have no nonzero W(m^♭)-torsion (CK Proposition 3.19). (c) For n,m≥0, H^i_cont(Δ,N_m/(μ,p^n)) is killed by φ^{−m}(μ) and is a flat A_inf/(φ^{−m}(μ),p^n)-module (CK Corollary 3.23). Part (b) is the input of the integral edge comparison (CK Theorem 3.20); part (a) removes the nonintegral summand.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. X=Spf(R) with an étale coordinate map as in CK (3.1.1); R_∞, Δ, A(R) and N_∞ are those of root-tower, ainf-chart-lift and monomial-splitting. For m≥0, N_m is the (p,μ)-adically completed summand of A_inf(R_∞) formed by the monomials of exact level m, base changed to A(R) (CK §3.22); N_0=A(R) and N_∞ is the completed direct sum of the N_m with m>0.

**Dependencies.** `AInfCohomology:AI.6/monomial-splitting`; `AInfCohomology:AI.6/monomial-exponents`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.6/structure-sheaf-edge`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`.

**Proof or construction.** Single summand (proof of CK Proposition 3.19, (3.19.3)–(3.19.6)): for S=A_inf·X^a contributing to N□_∞, with weights b_j of (3.19.3) and exact level m>0, the Koszul description of continuous cohomology of Δ≃Z_p^d (CK Lemma 3.7 = BMS1 Lemma 7.3(ii); AI.3) gives H^i_cont(Δ,S/μ) as a direct sum of copies of A_inf/φ^{−m}(μ); it is p-torsion-free and H^i_cont(Δ,S/μ)⊗A_inf/p^n≅H^i_cont(Δ,S/(μ,p^n)) (Stacks Project 061Z, 0662). Completed sums and base change (CK (3.19.7)–(3.19.10)): pass to N□_∞/μ by CK Lemma 3.6(i) (H^i_cont of a p-adically completed direct sum injects into the product), to N_∞ by flatness of A(R)/(μ,p^n) over A(R□)/(μ,p^n) ((3.19.8)), and to the limit over n by Stacks Project 0D6K. On the summand A(R), Δ acts trivially modulo μ (ainf-chart-lift) and A(R)/(μ,p^n) has no nonzero W(m^♭)-torsion (CK (3.14.1), from Lemmas 3.12 and 3.13). For N_∞, the absence of W(m^♭)-torsion in H^i_cont(Δ,N_∞/(μ,p^n)) reduces by dévissage to n=1, where N_∞/(μ,p) is a direct summand of R_∞^♭/μ and CK Lemma 3.12 applies (structure-sheaf-edge). This proves (b). (c): CK §3.22 and Corollary 3.23, from (3.19.5)–(3.19.6) for N□_m, the base change (3.19.8) and Lazard's theorem for the flat A(R□)/(μ,p^n)-algebra A(R)/(μ,p^n). (a): CK Proposition 3.25. By Lemma 3.7 it suffices that Lη_μ(K_{N_∞}(δ₁−1,…,δ_d−1))=0 ((3.25.1)). By (b) the cohomology of this Koszul complex modulo μ is p-torsion-free, so the base-change lemma for Lη (CK Lemma 3.24 = Bhatt, Specializing varieties…, 5.16; AI.1; applied with f=μ and g=ξ̃, which is congruent to p modulo μ) identifies its reduction modulo ξ̃ with Lη_{ζ_p−1} of the Koszul complex of N_∞/ξ̃. Since φ⁻¹ maps N_∞/ξ̃ isomorphically onto a direct summand of N_∞/ξ≅M_∞ (monomial-splitting), ζ_p−1 kills the cohomology of that complex by CK Proposition 3.8 (structure-sheaf-edge), so both sides are acyclic. N_∞ is (p,μ)-adically, hence ξ̃-adically complete (Stacks Project 090T), so the Koszul complex and its Lη_μ are derived ξ̃-complete (BMS1 Lemma 6.19; AI.1/preservation-derived-completeness), and the vanishing follows.

**Check.** A fractional branch eigencharacter is removed after Lη_μ; merely applying almost purity is insufficient. For the node chart (r=d=1) and S=A_inf·X₁^{1/p} (a=(0,1/p), weight 1/p): δ₁ acts on S by [ε^{1/p}], so H⁰_cont(Δ,S)=0 and H¹_cont(Δ,S)=A_inf/([ε^{1/p}]−1)=A_inf/φ⁻¹(μ), which is nonzero, killed by μ, and hence removed by Lη_μ.

**Source.** CK, Proposition 3.19, p.16; CK, Proposition 3.19 (last sentence), p.16; CK, Proposition 3.19 (proof), (3.19.5), p.17; CK, Corollary 3.23, p.19; CK, Proposition 3.25, p.19; CK, Proposition 3.25 (proof), p.19; CK, Lemma 3.24, p.19; CK, Proposition 3.25 (proof), p.19.

### local-edge — Integral semistable local edge comparison

Target `AInfCohomology:AI.6/local-edge` (theorem).

**Statement.** The edge map e of CK (3.15.1) induces an isomorphism Lη_μ(e): Lη_μRΓ_cont(Δ,A_inf(R_∞))≃Lη_μRΓ_proét((Spf R)_C^ad,A_inf,X) (CK Theorem 3.20). Moreover Lη_μRΓ_cont(Δ,A_inf(R_∞))≅Lη_μRΓ_cont(Δ,A(R)) is represented by the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ). The comparison is compatible with refinement of the cover: for a continuous surjection Δ′→Δ of profinite groups and a pro-(finite étale) affinoid perfectoid Δ′-cover Spa(R′_∞[1/p],R′_∞) refining the Δ-cover compatibly, the edge map e′ also becomes an isomorphism after Lη_μ, and so does RΓ_cont(Δ,A_inf(R_∞))→RΓ_cont(Δ′,A_inf(R′_∞)) (CK Remark 3.21).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. X=Spf(R) with an étale coordinate map as in CK (3.1.1).

**Dependencies.** `AInfCohomology:AI.6/nonintegral-annihilation`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/monomial-splitting`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.1/derived-decalage`.

**Proof or construction.** Edge map (CK §3.15): the Čech complex of A_inf,X for the Δ-cover of root-tower is RΓ_cont(Δ,A_inf(R_∞)), which gives e. By almost purity (Scholze, p-adic Hodge theory for rigid-analytic varieties, 6.5(ii); AI.3) the Teichmüller elements [m^♭] kill the cohomology of Cone(e); these modules are derived p-adically complete (Bhatt–Scholze, The pro-étale topology for schemes, 3.4.4 and 3.4.14), so the ideal W(m^♭) kills them (CK Lemmas 3.16 and 3.17). By the projection formula (3.20.1) (Stacks Project 0944) and nonintegral-annihilation (b), the cohomology of RΓ_cont(Δ,A_inf(R_∞))⊗^L A_inf/μ has no nonzero W(m^♭)-torsion. The almost-to-integral criterion CK Lemma 3.18 (from Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic p; supplied by AI.1) then gives CK Theorem 3.20; AI.1/derived-decalage supplies Lη_μ. Koszul description (not part of Theorem 3.20; it is what CK does in the proof of Proposition 5.6): by (3.14.5) (monomial-splitting) the left side splits as the sum of the parts of A(R) and of N_∞; Lη_μ of the N_∞-part vanishes by nonintegral-annihilation (a); Δ acts trivially on A(R)/μ and A(R) is μ-torsion-free (ainf-chart-lift), so by CK Lemma 3.7 the A(R)-part is η_μK_{A(R)}(δ₁−1,…,δ_d−1)≅K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ). Refinements (CK Remark 3.21, under the conditions of Remark 3.10): by almost purity and the octahedral axiom [m^♭] kills the cohomology of the cone of RΓ_cont(Δ,A_inf(R_∞))→RΓ_cont(Δ′,A_inf(R′_∞)); Lemma 3.17 upgrades this to W(m^♭) and Lemma 3.18 applies to this map.

**Check.** The comparison is integral; it must not be weakened to an almost quasi-isomorphism. For R=O_C (d=0) both sides are A_inf in degree 0. For the torus chart R=O_C{t^{±1}} the left side is A_inf{X^{±1}}→A_inf{X^{±1}} with differential X^n↦(([ε]^n−1)/μ)·X^n; ([ε]^n−1)/μ is a unit when p∤n, so only the monomials with p∣n contribute to H¹, and the n=0 part of H¹ is A_inf.

**Source.** CK, Theorem 3.20, p.18; CK, Theorem 3.20 (proof), p.18; CK, Lemma 3.16, p.16; CK, Lemma 3.18, p.16; CK, Proposition 3.25 (proof), (3.25.1), p.19; CK, Proposition 5.6 (proof), p.34; CK, Remark 3.21, p.18.

### aomega — Semistable AΩ complex

Target `AInfCohomology:AI.6/aomega` (construction).

**Statement.** For ν:X_C,proét^ad→𝔛_ét define AΩ_𝔛=Lη_μRν_*A_inf,X∈D^{≥0}(𝔛_ét,A_inf) in the imported monoidal derived sheaf category. The semistable extension uses the same integral sheaf and décalage as AI.3, now on the étale site of 𝔛 and the CK charts; the same formula with the Zariski site as target of ν defines AΩ_{𝔛_Zar}, the object used in BMS1. AΩ_𝔛 is a commutative algebra object of D(𝔛_ét,A_inf), contravariantly functorial for O_C-morphisms of formal schemes as in CK §1.5 and, semilinearly, for isomorphisms lying over a continuous automorphism of O_C (API item semilinear); RΓ_Ainf(𝔛)=RΓ(𝔛_ét,AΩ_𝔛), and AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]. Its presheaf version AΩ^psh=Lη_μRν^psh_*A_inf,X, on the site 𝔛^psh_ét of connected affine étale opens admitting a coordinate map (1.5.1) with isomorphisms as coverings, satisfies φ⁻¹AΩ^psh≅AΩ_𝔛 and RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X), and is derived ξ-adically and ξ̃-adically complete. Derived ξ-completeness of the sheaf AΩ_𝔛 and AΩ^psh≅Rφ_*AΩ_𝔛 are not asserted here; they are aomega-sheaf-completeness.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5, not required proper for this sheaf definition.

**Dependencies.** `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/decalage-products`; `AInfCohomology:AI.6/local-edge`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

**Proof or construction.** Import the period sheaf A_inf,X=W(Ô^{+,♭}) and the multiplicative pushforward from AI.3/E1; ν is the morphism of sites of CK (1.5.5), sending an étale 𝔘→𝔛 to its adic generic fibre (it preserves coverings, fibre products and final objects by Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1). Define AΩ_𝔛 by CK (2.2.3) and AΩ_{𝔛_Zar} by (2.2.4), with AI.1/derived-decalage for the ideal (μ) of the constant sheaf A_inf. Commutative algebra structure (not discussed in CK): Rν_* of the sheaf of rings A_inf,X is a commutative algebra object and Lη_μ is lax symmetric monoidal (BMS1 Proposition 6.7; AI.1/decalage-products), exactly as for the smooth case in BMS1 Definition 9.1; algebra objects are taken in the sense of E5:abstract/algebra-objects. BMS1 proves the lax structure on the derived category; nothing beyond what AI.1/decalage-products supplies is used. Functoriality (CK §7.2) and inversion of μ (CK (2.2.7)): Lη commutes with pullback along flat morphisms of ringed topoi (BMS1 Lemma 6.14; AI.1); this gives the pullback maps for 𝔛′→𝔛 and, for the localisation A_inf→A_inf[1/μ] where Lη_μ is the identity, the isomorphism AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]. The same argument applies to an isomorphism 𝔛′→𝔛 lying over a continuous automorphism σ of O_C: it induces an isomorphism of the pro-étale sites of the generic fibres under which A_inf,X pulls back to A_inf,X′, semilinearly over W(σ^♭), and the ideal (μ) is stable under W(σ^♭) because it does not depend on the choice of ε (CK §2.1, §8.1). Presheaf version (CK §4.1): on 𝔛^psh_ét every presheaf is a sheaf, φ_* is restriction, φ⁻¹ is sheafification and φ⁻¹∘φ_*≅id; (4.1.2) follows from BMS1 Lemma 6.14 and (4.1.3) from the definition. RΓ_proét(𝔘_C^ad,A_inf,X) is derived ξ- and ξ̃-adically complete, and AI.1/preservation-derived-completeness (BMS1 Lemma 6.19), applied in the replete topos of sets, shows that AΩ^psh is. Local computation: for 𝔘=Spf(R) in 𝔛^psh_ét, (4.1.3) and local-edge identify RΓ(𝔘,AΩ^psh) with the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ).

**Uses.**

- CK §§4–7: All specializations start with this actual complex.
- CohomologyComparisons:CP.4 and CohomologyComparisons:CP.5: Rational assembly and torsion/lattice applications import these maps.

**API.**

- `Semistable.aOmega.local` (equivalence): For 𝔘=Spf(R) in 𝔛^psh_ét, RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X) (CK (4.1.3)), which by local-edge is the Koszul complex K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ); the right side does not involve the framing. That RΓ(𝔘_ét,AΩ_𝔛) is the same complex is aomega-sheaf-completeness.
- `Semistable.aOmega.functorial` (functoriality): An O_C-morphism 𝔛′→𝔛 of formal schemes as in CK §1.5 induces a pullback map on AΩ and on RΓ_Ainf, compatible with products and satisfying identity/composition.
- `Semistable.aOmega.complete` (structure): AΩ^psh is derived ξ-adically and ξ̃-adically complete (CK §4.1); this is preservation of derived completeness by Lη sectionwise, in the topos of sets, not commutation of décalage and completion. Derived ξ-completeness of the sheaf AΩ_𝔛 is aomega-sheaf-completeness.
- `Semistable.aOmega.smooth` (compatibility): For a chart with r=0 the local complex Lη_μRΓ_cont(Δ,A_inf(R_∞)) is the AI.3 toric complex with the same Δ, tower and coefficient maps. The global comparison of the étale-site AΩ_𝔛 with the Zariski-site AΩ_{𝔛_Zar} used in BMS1 is CK Corollary 4.21, in aomega-sheaf-completeness.
- `Semistable.aOmega.psh` (compatibility): φ⁻¹(AΩ^psh)≅AΩ_𝔛 for the morphism of topoi φ from 𝔛_ét to 𝔛^psh_ét (CK (4.1.2)).
- `Semistable.aOmega.invert_mu` (compatibility): AΩ_𝔛⊗^L_{A_inf}A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L_{A_inf}A_inf[1/μ] (CK (2.2.7)).
- `Semistable.aOmega.zariski` (data): AΩ_{𝔛_Zar}=Lη_μRν^Zar_*A_inf,X∈D^{≥0}(𝔛_Zar,A_inf), with ν^Zar the projection to the Zariski site (CK (2.2.4)); it is the object of BMS1. Its comparison with AΩ_𝔛 is aomega-sheaf-completeness.
- `Semistable.aOmega.semilinear` (functoriality): Let σ be a continuous automorphism of O_C and g:𝔛′→𝔛 an isomorphism of formal schemes lying over Spf(σ). Then W(σ^♭) is an automorphism of A_inf commuting with φ_A and preserving the ideals (μ), (ξ) and (ξ̃), and pullback of period sheaves along the isomorphism of adic generic fibres induced by g gives a W(σ^♭)-semilinear isomorphism RΓ_Ainf(𝔛)→RΓ_Ainf(𝔛′), compatible with composition. For 𝔛=𝔛₀⊗̂_{O_K}O_C with 𝔛₀ a formal O_K-scheme and σ∈G_K=Gal(K̄/K), taking g=id⊗Spf(σ) gives an A_inf-semilinear action of G_K on each H^i_Ainf(𝔛). CK §8.1 obtains this action from the functoriality of §7.2, which is stated there for O_C-morphisms only.

**Definition tests.**

- `Semistable.aOmega.point` (degenerate): For SpfO_C the global complex is A_inf concentrated in degree 0.
- `Semistable.aOmega.node` (computation): For the node T₀T₁=p^q (r=d=1), RΓ(𝔘,AΩ^psh) is the two-term complex A(R□)→A(R□) with differential (δ₁−1)/μ, where δ₁ multiplies X₀ by [ε]⁻¹ and X₁ by [ε].
- `Semistable.aOmega.good_reduction` (compatibility): For the torus chart R□=O_C{t₁^{±1},…,t_d^{±1}} (r=0), RΓ(𝔘,AΩ^psh) is K_{A(R□)}((δ₁−1)/μ,…,(δ_d−1)/μ) with δᵢ(Xᵢ)=[ε]Xᵢ, the AI.3 toric AΩ complex with identical coefficient maps.
- `Semistable.aOmega.decalage_torsion` (non-example): For the torus chart with d=1 and p∤n, the X^n-summand of H¹(𝔘,AΩ^psh) is A_inf/(([ε]^n−1)/μ)=0, whereas the X^n-summand of H¹_cont(Δ,A_inf(R_∞)) is A_inf/([ε]^n−1)=A_inf/μ, which is not killed by W(m^♭): the Teichmüller lift of (p^♭)^{1/p^j} lies in W(m^♭) and, for j large, not in (μ), because modulo p the element μ is ε−1, whose valuation is p/(p−1) times that of p^♭. Since H¹_cont→H¹_proét(𝔘_C^ad,A_inf,X) has kernel killed by W(m^♭), the image of this summand is a nonzero μ-torsion submodule of H¹_proét. So without Lη_μ the first cohomology would have nonzero μ-torsion classes in every monomial degree n prime to p.

**Check.** On a chart with r=0 the complex RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_cont(Δ,A_inf(R_∞)) agrees with the AI.3 toric complex, including the map from pro-étale cochains.

**Source.** CK, §1.5, (1.5.5), p.5; CK, §2.2, (2.2.3), p.9; CK, §2.2, (2.2.4), p.9; CK, §2.2, (2.2.7), p.9; CK, §4.1, p.24; CK, §4.1, (4.1.2), p.25; CK, §4.1, p.25; CK, §7.2, p.68; BMS1, Proposition 6.7, p.290; CK, §8.1, p.72.

### aomega-frobenius — Semistable AΩ Frobenius

Target `AInfCohomology:AI.6/aomega-frobenius` (theorem).

**Statement.** The Frobenius automorphism of the period sheaf A_inf,X induces φ_A^*AΩ_𝔛:=AΩ_𝔛⊗^L_{A_inf,φ_A}A_inf≃Lη_{ξ̃}AΩ_𝔛→AΩ_𝔛 in D^{≥0}(𝔛_ét,A_inf) (CK (2.2.5)). The linearized map becomes an isomorphism after inverting ξ̃ (CK (2.2.6)); it need not be an integral equivalence. It is compatible with the pullback maps of aomega. Compatibility with products is not asserted: CK does not state it.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5; no properness is needed.

**Dependencies.** `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.1/derived-decalage`.

**Proof or construction.** φ_A(μ)=ξ̃·μ, so Lη_{φ_A(μ)}≅Lη_{ξ̃}∘Lη_μ (BMS1 Lemma 6.11; AI.1). φ_A is an automorphism of A_inf and the Frobenius of A_inf,X is an automorphism semilinear over it, so φ_A^*AΩ_𝔛≅Lη_{φ_A(μ)}Rν_*A_inf,X≅Lη_{ξ̃}AΩ_𝔛 (CK (2.2.5); AI.1/derived-decalage). AΩ_𝔛 lies in D^{≥0} and H⁰(AΩ_𝔛)=ν_*A_inf,X has no ξ̃-torsion, because ξ̃ divides φ_A(μ) and μ is a nonzerodivisor on A_inf of a perfectoid ring (BMS1 Proposition 3.17(ii)); so BMS1 Lemma 6.10 (AI.1) gives the canonical map Lη_{ξ̃}AΩ_𝔛→AΩ_𝔛. After inverting ξ̃ the map is an isomorphism, since Lη commutes with the flat localisation A_inf→A_inf[1/ξ̃] (BMS1 Lemma 6.14; AI.1) and Lη_{ξ̃} is the identity where ξ̃ is invertible (CK (2.2.6)). Compatibility with pullback (not stated in CK): the three constructions above are defined on torsion-free representatives and commute with the exact pullback functors used for the functoriality of aomega.

**Check.** On the local Koszul model K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)=η_μK_{A(R)}(δ₁−1,…,δ_d−1) of local-edge the Frobenius acts in degree j by ξ̃^j·φ (an element μ^j·x is sent to φ_A(μ)^j·φ(x)=μ^j·ξ̃^j·φ(x)); it is an isomorphism only after inverting ξ̃ and reduces modulo μ to p^j·φ, since ξ̃≡p modulo μ.

**Source.** CK, §2.1, p.8; CK, §2.2, (2.2.5), p.9; CK, §2.2, (2.2.6), p.9; CK, §7.2, p.68; BMS1, Lemma 6.10, p.292; BMS1, Lemma 6.11, p.292.

### hodge-tate-comparison — Log Hodge–Tate reduction

Target `AInfCohomology:AI.6/hodge-tate-comparison` (theorem).

**Statement.** AΩ_𝔛⊗^L_{A_inf,θ̃}O_C≃Ω̃_𝔛:=Lη_{ζ_p−1}Rν_*Ô_X^+, the décalage being for the ideal sheaf (ζ_p−1)O_𝔛,ét (CK Theorem 4.2). For every i≥0 the O_𝔛,ét-module H^i(Ω̃_𝔛) is locally free, of rank binom(d,i) at a closed point of 𝔛_k̄ where 𝔛_k̄ has dimension d, and H^0(Ω̃_𝔛)=O_𝔛 via ν^♯ (CK Proposition 4.4); for i>0 the cup product induces ∧^iH^1(Ω̃_𝔛)≅H^i(Ω̃_𝔛) (CK Proposition 4.8). The map Ω¹_{𝔛/O_C}{−1}→H^1(Ω̃_𝔛) of CK (4.10.3), an isomorphism over the smooth locus 𝔛^sm, extends uniquely from 𝔛^sm to an isomorphism Ω¹_{𝔛/O_C,log}{−1}≅H^1(Ω̃_𝔛), and this induces Ω^i_{𝔛/O_C,log}{−i}≅H^i(Ω̃_𝔛) for every i≥0, with multiplication corresponding to exterior product (CK Theorem 4.11). Here {1} denotes the tensor product with the free rank-one O_C-module O_C{1}=lim_n Ω¹_{O_C/Z_p}[p^n] (transition maps multiplication by p).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 (no properness or quasi-compactness), with the log structure of divisorial-log.

**Dependencies.** `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.6/structure-sheaf-edge`; `AInfCohomology:AI.6/local-edge`; `AInfCohomology:AI.6/nonintegral-annihilation`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.4/hodge-tate-cotangent`; `AInfCohomology:AI.4/de-rham`; `AInfCohomology:AI.4/bounded-pd-coefficients`; `AInfCohomology:AI.4/pd-toric-eta-comparison`; `AInfCohomology:AI.4/pd-logarithmic-coordinate`; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `AInfCohomology:AI.4/mu-inverted-etale`; `AdicSpacesPartII:R3`.

**Proof or construction.** CK Theorem 4.2. The kernel of θ̃ on the period sheaf is generated by the nonzerodivisor ξ̃, so the projection formula (Stacks Project 0944) gives Rν_*A_inf,X⊗^L_{A_inf,θ̃}O_C≅Rν_*Ô⁺; since θ̃(μ)=ζ_p−1 this induces the map, and by aomega ((4.1.2)) it suffices to show that its presheaf version is an isomorphism on each 𝔘=Spf(R) of 𝔛^psh_ét. There nonintegral-annihilation (b) with (3.20.1) shows that the cohomology of RΓ_cont(Δ,A_inf(R_∞))⊗^L A_inf/μ is p-torsion-free, so, ξ̃ being congruent to p modulo μ, the base-change lemma for Lη (CK Lemma 3.24; AI.1) gives Lη_μRΓ_cont(Δ,A_inf(R_∞))⊗^L_{A_inf,θ̃}O_C≅Lη_{ζ_p−1}RΓ_cont(Δ,R_∞). The edge maps (3.3.1) and (3.15.1) are compatible, so local-edge (CK Theorem 3.20) and structure-sheaf-edge (CK Theorem 3.9) conclude. CK Propositions 4.4 and 4.8. Étale locally, by CK Lemma 3.7 and structure-sheaf-edge (Proposition 3.8, Theorem 3.9), H^i_cont(Δ,R_∞) modulo its (ζ_p−1)-torsion is H^i_cont(Δ,R)≅R^{binom(d,i)}, compatibly with étale maps R→R′ ((4.4.3)–(4.4.5)); this gives local freeness, and for i=0 that R=(R_∞)^Δ, the complement M_∞^Δ being p-torsion-free and killed by ζ_p−1. The edge maps are compatible with cup products, and H^i_cont(Δ,R)≅∧^i(R^d) by BMS1 Lemmas 7.3 and 7.5 (AI.3). CK §§4.9–4.10 and Theorem 4.11. The p-completed cotangent complex of Ô⁺ over Z_p is Ô⁺{1}[1] ((4.9.1): BMS1 Lemma 3.14; Gabber–Ramero, Almost ring theory, 6.5.12(ii); Fontaine, Formes différentielles et modules de Tate des variétés abéliennes sur les corps locaux, Théorème 1′(ii)), and functoriality of the cotangent complex gives Ω¹_{𝔛/O_C}{−1}→R¹ν_*Ô⁺→H^1(Ω̃_𝔛) ((4.10.2)), whose restriction to 𝔛^sm is an isomorphism onto (ζ_p−1)·H^1(Ω̃_𝔛) by the smooth case (BMS1 Proposition 8.15; AI.4); dividing by ζ_p−1 gives (4.10.3). For the extension (CK §4.15) uniqueness allows one to assume that 𝔛 is the chart, which is an open of the p-adic completion of a proper flat scheme 𝒳 over the integral closure of W(k̄) with Zariski-local coordinates (1.5.2). Formal GAGA over O_C (CK Theorem 4.12 and Remark 4.13, after Fujiwara–Kato; it has no supplier among the prerequisites) algebraises (4.10.3) to a map f of vector bundles on 𝒳_{O_C}; this is the only use of formal GAGA, and it serves (4.11.1) only. By adic GAGA and Scholze's isomorphism between R¹ν_*Ô⁺[1/p] and Ω¹ on the smooth proper generic fibre (CK Claim 4.15.1), source and target of f_C are isomorphic vector bundles, so the determinant of the generically surjective f_C is a nowhere vanishing constant on each component and f_C is an isomorphism; hence f is an isomorphism over the smooth locus, whose complement has codimension ≥2, the target is the unique vector bundle extension of its restriction (EGA IV₂ 5.10.5 with limit arguments), and it is identified with Ω¹_log{−1} using divisorial-log (Claims 1.6.1, 1.6.3) and log smoothness (Kato, Logarithmic structures of Fontaine–Illusie, 3.7(2) and 3.10; CR.5). Then (4.4.1) and Proposition 4.8 give (4.11.2).

**Check.** At a node dlogT₀+dlogT₁=0, so Ω^1_log has rank 1; ordinary singular differentials are the wrong answer.

**Source.** CK, Theorem 4.2, (4.2.1), p.25; CK, Theorem 4.2 (proof), p.25; CK, Theorem 4.2 (proof), p.25; CK, Proposition 4.4, p.26; CK, Proposition 4.8, p.27; CK, §4.10, p.28; CK, §4.10, (4.10.3), p.28; CK, Theorem 4.11, p.28; CK, Theorem 4.12, p.29; CK, §4.15, p.30; CK, Claim 4.15.1 (proof), p.30; CK, Claim 4.15.1 (proof), p.30; CK, §4.15, p.30.

### aomega-sheaf-completeness — Derived completeness and sheaf property of AΩ

Target `AInfCohomology:AI.6/aomega-sheaf-completeness` (theorem).

**Statement.** (a) If 𝔛 is affine, connected and admits a coordinate map (1.5.1), then for every i the presheaf assigning H^i(𝔛′^ad_C,Ô⁺)/H^i(𝔛′^ad_C,Ô⁺)[ζ_p−1] to an affine étale 𝔛-scheme 𝔛′ is a sheaf (CK Remark 4.5). (b) For every 𝔛 as in CK §1.5, AΩ_𝔛 is derived ξ-adically complete and the adjunction map AΩ^psh→Rφ_*(AΩ_𝔛)≅Rφ_*φ⁻¹(AΩ^psh) is an isomorphism (CK Corollary 4.6). Hence RΓ(𝔘_ét,AΩ_𝔛)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X) for every object 𝔘 of 𝔛^psh_ét, and RΓ_Ainf(𝔛) is derived ξ-adically complete. (c) If the coordinate morphisms (1.5.1) exist Zariski locally on 𝔛 (for instance if 𝔛 is smooth over O_C, or Zariski locally arises from a strictly semistable scheme over a discrete valuation ring), then H^i(Ω̃_{𝔛_Zar})≅H^i(Ω̃_𝔛)|_{𝔛_Zar} for every i, the identifications of hodge-tate-comparison and log-de-rham hold for AΩ_{𝔛_Zar}, AΩ_{𝔛_Zar} is derived ξ-adically complete, and RΓ(𝔛_Zar,AΩ_{𝔛_Zar})≅RΓ(𝔛_ét,AΩ_𝔛) (CK Remarks 4.5 and 4.16, Theorems 4.2 and 4.17, Corollary 4.21, Example 4.22).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5; (a) and (c) carry the additional hypotheses stated in them. AΩ^psh, φ and AΩ_{𝔛_Zar} are those of aomega; Ω̃_{𝔛_Zar} is defined as Ω̃_𝔛 with the Zariski site in place of the étale site.

**Dependencies.** `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`.

**Proof or construction.** (a): by the proof of CK Proposition 4.4 in hodge-tate-comparison ((4.4.3)–(4.4.5)), for 𝔛=Spf(R) with coordinates and an affine étale 𝔛′=Spf(R′), H^i(𝔛′^ad_C,Ô⁺) modulo its (ζ_p−1)-torsion is the base change to R′ of the free R□-module H^i((Spf R□)^ad_C,Ô⁺) modulo its (ζ_p−1)-torsion, compatibly with restriction; so the presheaf is the sheaf attached to a free module, namely H^i(Ω̃_𝔛). (b), reduction: φ⁻¹∘Rφ_*≅id, so it suffices to prove that AΩ^psh→Rφ_*φ⁻¹(AΩ^psh) is an isomorphism; the derived ξ-completeness of AΩ^psh (aomega) then passes to AΩ_𝔛. For this one may assume 𝔛 affine, connected, with a coordinate map. AΩ^psh is derived ξ̃-adically complete (aomega), so by the analogue for 𝔛^psh_ét of BMS1 Lemma 9.15 (a derived limit of sheaves is a sheaf; AI.3) and the five lemma it suffices that AΩ^psh⊗^L A_inf/ξ̃→Rφ_*φ⁻¹(AΩ^psh⊗^L A_inf/ξ̃) is an isomorphism. (b), the case modulo ξ̃: by the proof of CK Theorem 4.2 (presheaf form (4.2.2), hodge-tate-comparison), AΩ^psh⊗^L A_inf/ξ̃≅Lη_{ζ_p−1}Rφ_*Rν_*Ô⁺, whose cohomology presheaves are the presheaves of (a); these are sheaves, and being vector bundles (CK Proposition 4.4) they have no higher cohomology on affine objects, so the adjunction map is an isomorphism. CK states only that the cohomology presheaves are sheaves; the vanishing of their higher cohomology on affines is left implicit there. Sections: RΓ(𝔘_ét,AΩ_𝔛)=RΓ(𝔘,Rφ_*AΩ_𝔛)≅RΓ(𝔘,AΩ^psh), and (4.1.3) of aomega gives the formula; RΓ(𝔛_ét,−) commutes with derived limits (Stacks Project 0A07), so RΓ_Ainf(𝔛) is derived ξ-adically complete. (c): the sheaf property (a) for Zariski opens gives (4.5.1). The proofs of hodge-tate-comparison and log-de-rham apply with the Zariski presheaf site of opens admitting coordinates (CK Theorem 4.2, second sentence; Remark 4.16; Theorem 4.17, second sentence, whose proof CK describes as the same), and so do the two preceding steps, giving the Zariski analogue of Corollary 4.6. Then (CK Corollary 4.21) the reduction modulo ξ of RΓ(𝔛_Zar,AΩ_{𝔛_Zar})→RΓ(𝔛_ét,AΩ_𝔛) is RΓ(𝔛_Zar,Ω^•_log)→RΓ(𝔛_ét,Ω^•_log) by log-de-rham, an isomorphism because the Ω^i_log are vector bundles; both sides being derived ξ-complete, the map is an isomorphism.

**Check.** For 𝔛=Spf O_C, AΩ^psh and AΩ_𝔛 have global sections A_inf in degree 0, which is ξ-adically complete. For the torus chart 𝔘=Spf O_C{t^{±1}}, (b) gives RΓ(𝔘_ét,AΩ_𝔛)≅K_{A(R□)}((δ−1)/μ): H⁰=A_inf and the X^n-summand of H¹ is A_inf/(([ε]^n−1)/μ). (c) applies to every smooth 𝔛 (CK Example 4.22); there it identifies the étale-site RΓ_Ainf(𝔛) with the Zariski-site complex of BMS1.

**Source.** CK, Remark 4.5, p.26; CK, Remark 4.5, p.26; CK, Corollary 4.6, p.26; CK, Corollary 4.6 (proof), p.26; CK, Corollary 4.6 (proof), p.26; CK, Corollary 4.6 (proof), p.27; CK, Theorem 4.2 (second sentence), p.25; CK, Remark 4.16, p.30; CK, Theorem 4.17 (second sentence), p.30; CK, Corollary 4.21, p.31; CK, Corollary 4.21 (proof), p.32; CK, Example 4.22, p.32; BMS1, Lemma 9.15, p.331.

### log-de-rham — Log de Rham specialization

Target `AInfCohomology:AI.6/log-de-rham` (theorem).

**Statement.** AΩ_𝔛⊗^L_{A_inf,θ}O_C≃Ω^•_{𝔛/O_C,log} in D(𝔛_ét,O_C) (CK Theorem 4.17). Under this identification the term in degree i is Ω^i_{𝔛/O_C,log} and the differential is the log de Rham differential, obtained as the Bockstein of the θ̃-reduction; in degree 0 it is f↦df. Consequently, for every 𝔛 as in CK §1.5, RΓ_Ainf(𝔛)⊗^L_{A_inf,θ}O_C≃RΓ_logdR(𝔛/O_C):=RΓ(𝔛_ét,Ω^•_{𝔛/O_C,log}), with the ordinary derived tensor product (CK Corollary 4.18). Compatibility of these identifications with products, as isomorphisms in D(𝔛_ét,O_C), is not asserted. CK prove only a local form, which crystalline-de-rham-square uses: on the Koszul complexes η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) the specialisation is represented by a map of differential graded algebras to Ω^•_{Spf(R)/O_C,log} that is θ in degree 0 (proof of CK Proposition 5.41, by BMS1 Lemmas 6.13 and 7.5).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5; neither properness nor quasi-compactness is needed.

**Dependencies.** `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/aomega-frobenius`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.4/hodge-tate-cotangent`; `AInfCohomology:AI.4/de-rham`; `AInfCohomology:AI.4/bounded-pd-coefficients`; `AInfCohomology:AI.4/pd-toric-eta-comparison`; `AInfCohomology:AI.4/pd-logarithmic-coordinate`; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `AInfCohomology:AI.4/mu-inverted-etale`; `CrystallineCohomology:CR.5`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Proof or construction.** Since φ_A(μ)=ξ̃·μ, aomega-frobenius gives AΩ_𝔛⊗^L_{A_inf,θ}O_C≅(φ_A^*AΩ_𝔛)⊗^L_{A_inf,θ̃}O_C≅(Lη_{ξ̃}AΩ_𝔛)⊗^L_{A_inf,θ̃}O_C (BMS1 Lemma 6.11), and AI.1/bockstein-reduction (BMS1 Proposition 6.12) identifies the right side with the complex whose i-th term is H^i(AΩ_𝔛⊗^L_{A_inf,θ̃}O_C)⊗(Ker θ̃/(Ker θ̃)²)^{⊗i}, with Bockstein differentials. Ker θ̃/(Ker θ̃)²≅O_C{1}: the p-completed cotangent complex of A_inf over Z_p vanishes because O_C^♭ is perfect, and that of O_C over Z_p is O_C{1}[1] by CK (4.9.1) for Spf O_C; hence that of O_C over A_inf (via θ̃) is O_C{1}[1] (Illusie, Complexe cotangent et déformations I, III.3.2.4(iii)). With hodge-tate-comparison ((4.2.1) and (4.11.2)) the i-th term is Ω^i_{𝔛/O_C,log}. Each Ω^i_{𝔛/O_C,log} is a vector bundle and no nonzero local section of a vector bundle vanishes on 𝔛^sm, so the Bockstein differentials agree with those of Ω^•_log as soon as they do over 𝔛^sm, where this is the smooth case with its differential (BMS1 Theorem 14.1(ii), or Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic p, proof of Proposition 7.9; AI.4). This proves CK Theorem 4.17. CK Corollary 4.18: apply RΓ(𝔛_ét,−) and the projection formula (Stacks Project 0944) for the perfect A_inf-module O_C=A_inf/(ξ) (E1/presentability-and-derived-tensor); CR.5 supplies the log de Rham complex.

**Check.** On T₀T₁=p^q the relation dlogT₀+dlogT₁=0 is respected by the actual differential. For 𝔛=Spf O_C{t^{±1}} the global statement reads RΓ_Ainf(𝔛)⊗^L_θ O_C≃[O_C{t^{±1}}→O_C{t^{±1}}·dlog t], Σaₙtⁿ↦Σn·aₙtⁿ·dlog t; H¹ modulo p is free of infinite rank over O_C/p on the classes of tⁿ·dlog t with p∣n, so no finiteness holds without properness.

**Source.** CK, Theorem 4.17, (4.17.1), p.30; CK, Theorem 4.17 (proof), p.30; CK, Theorem 4.17 (proof), p.31; CK, Theorem 4.17 (proof), p.31; CK, Corollary 4.18, p.31; BMS1, Theorem 14.1, p.388.

### proper-perfectness — Perfect semistable A_inf cohomology

Target `AInfCohomology:AI.6/proper-perfectness` (theorem).

**Statement.** If 𝔛 is proper over O_C, RΓ_Ainf(𝔛) is a perfect A_inf-complex (CK Corollary 4.20). If moreover 𝔛_k̄ has dimension at most d, then H^i_Ainf(𝔛)=0 for i∉[0,2d] (CK Theorem 7.4, under CK §7.1) and RΓ_Ainf(𝔛) is represented by a complex of finite free A_inf-modules in degrees 0,…,2d. This does not imply that its cohomology modules are free.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is proper over O_C; this is needed for both assertions. The bound dim 𝔛_k̄≤d is needed only for the range assertion (CK §7.1 assumes 𝔛_k̄ purely d-dimensional).

**Dependencies.** `AInfCohomology:AI.6/aomega-sheaf-completeness`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `CrystallineCohomology:CR.5`.

**Proof or construction.** By log-de-rham (CK Corollary 4.18), RΓ_Ainf(𝔛)⊗^L_{A_inf}A_inf/ξ≅RΓ_logdR(𝔛/O_C). The sheaves Ω^i_{𝔛/O_C,log} are vector bundles (CR.5), so by the finiteness theorem for proper formal schemes over O_C (Ullrich, The direct image theorem in formal and rigid geometry, 5.3) and the Hodge–de Rham spectral sequence the O_C-modules H^j(RΓ_logdR(𝔛/O_C)) are finitely presented, hence perfect (Stacks Project 0ASP), and RΓ_logdR(𝔛/O_C) is a perfect O_C-complex (Stacks Project 066U). RΓ_Ainf(𝔛) is derived ξ-adically complete (aomega-sheaf-completeness, CK Corollary 4.6). A derived ξ-complete complex whose reduction modulo ξ is perfect is perfect (Stacks Project 09AW; AI.5). This is CK Corollary 4.20. Formal GAGA is not used in this proof; it enters only through hodge-tate-comparison. Range. The vanishing of H^i_Ainf(𝔛) outside [0,2d] is CK Theorem 7.4. The finite free representative is not in CK; it follows thus: A_inf is local with residue field k̄, and by Corollary 4.18 and base change through O_C/p (𝔛⊗O_C/p is a quasi-compact separated scheme, flat over O_C/p, and the Ω^i_log are flat) RΓ_Ainf(𝔛)⊗^L_{A_inf}k̄≅RΓ(𝔛_k̄,Ω^•_{𝔛_k̄/k̄,log}), which lies in degrees [0,2d] because Ω^i_log vanishes for i>d and coherent cohomology of 𝔛_k̄ vanishes above its dimension. A perfect complex over a local ring is represented by a bounded complex of finite free modules whose differentials vanish modulo the maximal ideal, the rank in degree i being the dimension of H^i of its reduction to the residue field (AI.5).

**Check.** A perfect two-term multiplication-by-p complex has torsion cohomology; the theorem must allow it. Properness is necessary: for 𝔛=Spf O_C{t^{±1}}, the θ-specialisation of RΓ_Ainf(𝔛) has H¹ whose reduction modulo p is free of infinite rank over O_C/p (log-de-rham), so RΓ_Ainf(𝔛) is not perfect.

**Source.** CK, Corollary 4.20, p.31; CK, Corollary 4.20 (proof), p.31; CK, Corollary 4.20 (proof), p.31; CK, §7.1, p.68; CK, Theorem 7.4, p.69; CK, Theorem 7.4 (proof), p.69.

### finite-level-acris — Finite-level crystalline period rings A_cris^(m)

Target `AInfCohomology:AI.6/finite-level-acris` (definition).

**Statement.** For an integer m≥1 let A_cris^{0,(m)}⊂A_inf[1/p] be the A_inf-subalgebra generated by the elements ξ^s/s! with s≤m, and let A_cris^(m) be its p-adic completion (CK §3.26; it is the ring of BMS1 Lemma 12.8). Thus A_cris^{0,(m)} is contained in the subalgebra A_cris^0 generated by all ξ^n/n!, A_cris^(m)=A_inf for m<p, A_cris^0 is the union of the A_cris^{0,(m)}, and A_cris is the p-adic completion of colim_m A_cris^(m) (CK (5.1.1)). In the local setup of CK §3.1 put A_cris^(m)(R):=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris^(m)(R_∞):=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m), the completions being (p,μ)-adic, equivalently p-adic if m≥p (CK §3.27). The ring A_cris^(m) carries the surjection θ to O_C extending that of A_inf; the three rings carry Frobenius endomorphisms compatible with each other and with varying m; and Δ acts continuously, Frobenius-equivariantly and A_cris^(m)-linearly on A_cris^(m)(R) and A_cris^(m)(R_∞). More generally, for an affinoid perfectoid Spa(R′_∞[1/p],R′_∞) over Spa(C,O_C), such as the R_{Σ,Λ,∞} of all-coordinates, put A_cris^(m)(R′_∞):=A_inf(R′_∞)⊗̂_{A_inf}A_cris^(m), the completion being (p,μ)-adic, equivalently p-adic if m≥p (CK (5.19.3)); it is the completion of the A_inf(R′_∞)-subalgebra A_cris^{0,(m)}(R′_∞)≅A_inf(R′_∞)⊗_{A_inf}A_cris^{0,(m)} of A_inf(R′_∞)[1/p] generated by the ξ^n/n! with n≤m (CK (5.35.1), (5.35.2)), it is p-torsion-free and μ-torsion-free, A_cris^(m)(R′_∞)/μ is p-adically complete (CK §5.19), and the ring homomorphisms A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR⁺(R′_∞) are injective, where B_dR⁺(R′_∞) is the ξ-adic completion of A_inf(R′_∞)[1/p] (CK Proposition 5.36, (5.36.1)).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. m≥1 is an integer. For the relative rings: X=Spf(R) with an étale coordinate map as in CK (3.1.1), with A(R) of ainf-chart-lift and A_inf(R_∞) of monomial-splitting.

**Dependencies.** `CrystallineCohomology:CR.0`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.6/monomial-splitting`; `AInfCohomology:AI.6/structure-sheaf-edge`; `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.4/hodge-tate-cotangent`; `AInfCohomology:AI.4/de-rham`; `AInfCohomology:AI.4/bounded-pd-coefficients`; `AInfCohomology:AI.4/pd-toric-eta-comparison`; `AInfCohomology:AI.4/pd-logarithmic-coordinate`; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `AInfCohomology:AI.4/mu-inverted-etale`.

**Proof or construction.** Definition and first properties (CK §3.26): A_cris^{0,(m)} is p-torsion-free as a subring of A_inf[1/p], hence so is A_cris^(m); for m<p the generators lie in A_inf because s! is a p-adic unit for s<p; for m≥p, μ=ξ·φ_A⁻¹(μ) gives μ^p/p!=(ξ^p/p!)·φ_A⁻¹(μ)^p∈A_cris^{0,(m)}, so μ^p∈pA_cris^(m) and the p-adic and (p,μ)-adic topologies agree. θ extends because θ(ξ)=0 (AI.0:integral). (3.26.2) is BMS1 Lemma 12.8(ii) (AI.4); taking the inverse limit over n of the exact sequences 0→(A_cris^(m)/p^n)[μ]→A_cris^(m)/p^n→A_cris^(m)/p^n→A_cris^(m)/(μ,p^n)→0 ((3.26.3)) gives (3.26.4). Frobenius (CK §3.26): φ_A(ξ)=ξ̃ is congruent to ξ^p modulo p, and for m≥p, ξ^p=p!·(ξ^p/p!)∈pA_cris^{0,(m)}; hence ξ̃∈pA_cris^{0,(m)}, ξ̃^s/s!∈A_cris^{0,(m)} for all s, and φ_A preserves A_cris^{0,(m)}. Relative rings (CK §3.27): the monomial decomposition of A_inf(R□_∞) (monomial-splitting) gives (3.27.1), and A_cris^(m)(R_∞) is (p,μ)-adically formally étale over A_cris^(m)(R□_∞); so (3.26.2) holds for both, (3.27.2) follows as (3.26.4) did, and A_cris^(m)(R_∞) is p-torsion-free. By (3.14.5), A_cris^(m)(R) is a direct summand of A_cris^(m)(R_∞). The Frobenius, the Δ-action and the endomorphisms (δ−1)/μ come from ainf-chart-lift by base change; for m<p, CK Lemma 3.13 gives A_cris^(m)(R)=A(R) and A_cris^(m)(R_∞)=A_inf(R_∞). CK Proposition 3.29 (m≥p): Z_p[[T]]→A_inf, T↦[ε^{1/p}]−1, is faithfully flat (BMS1 Remark 4.31), and A_cris^(m)(R_∞)/(μ,p^n) is the base change of a module M over Z_p[[T]]/((T+1)^p−1,p^n) along the flat map to A_inf(R_∞)/(μ,p^n) (CK Lemma 3.13); so its φ_A⁻¹(μ)-torsion is the base change of M[T], and filtering M[T] p-adically reduces the claim to R_∞^♭/φ_A⁻¹(μ) having no nonzero m^♭-torsion, which is structure-sheaf-edge (b). The statement for A_cris^(m)(R_∞)/μ follows by p-adic completeness ((3.27.2)). Colimit (CK (5.1.1)): A_cris^0 is the union of the A_cris^{0,(m)} by definition, and p-adic completion gives A_cris; CR.0 supplies A_cris^0 as the divided power envelope of A_inf→O_C/p and A_cris as its p-adic completion (CK §5.1). General affinoid perfectoid R′_∞ (CK §5.19, §5.35, Proposition 5.36): A_inf(R′_∞) is (p,μ)-adically formally flat over A_inf (CK Lemma 3.13), which gives p-torsion-freeness, and (3.26.2), (3.26.3) give μ-torsion-freeness and the completeness of the quotient by μ. Since (p,ξ) is a regular sequence on A_inf(R′_∞), the quotient of A_inf(R′_∞)[T^n/n!]_{n≥1} by A_inf(R′_∞)[T^n/n!]_{m≥n≥1} has no (T−ξ)-torsion, which gives (5.35.1) and (5.35.2). Injectivity: A_inf(R′_∞)[1/p] is ξ-adically separated, so it and A_cris^{0,(m)}(R′_∞) inject into B_dR⁺(R′_∞). For A_cris(R′_∞) use the ideals Fil_n⁰ of A_cris⁰(R′_∞) generated by the ξ^{n′}/n′! with n′≥n: each quotient A_cris⁰(R′_∞)/Fil_n⁰ is p-torsion-free and p-adically complete (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.9(2), whose proof applies to R′_∞), the filtration is separated modulo p by the explicit description (5.36.4) of A_cris⁰(R′_∞)/p, hence its completion is a separated filtration of A_cris(R′_∞), and A_cris⁰(R′_∞)/Fil_n⁰ injects into B_dR⁺(R′_∞)/ξ^n. For A_cris^(m)(R′_∞)→A_cris(R′_∞) the same argument is run with the induced filtration of A_cris^{0,(m)}(R′_∞): the kernel lies in p·A_cris^(m)(R′_∞), and A_cris(R′_∞) is p-torsion-free while A_cris^(m)(R′_∞) is p-adically separated.

**Uses.**

- CK §3.28, Propositions 3.32 and 3.33, Theorem 3.34: The base-changed edge map and its Lη_μ-isomorphism are stated for A_cris^(m)(R_∞) with m≥p.
- CK Proposition 5.6, Corollary 5.7, Proposition 5.13, Lemmas 5.15–5.16: Lη_μ and the completed base change are commuted at finite level and A_cris is reached by completed colimit over m.
- AInfCohomology:AI.6/finite-pd-base-change and AInfCohomology:AI.6/local-crystalline: Both are stated for A_cris^(m)(R_∞) and A_cris^(m)(R).

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

**Definition tests.**

- `Semistable.finiteLevelAcris.below_p` (degenerate): For m<p every generator ξ^s/s! with s≤m lies in A_inf, since s! is a unit of Z_p; hence A_cris^{0,(m)}=A_inf.
- `Semistable.finiteLevelAcris.first_divided_power` (computation): ξ^p/p! lies in A_cris^{0,(p)} but not in A_inf: A_inf/p=O_C^♭ is a domain in which the image of ξ is nonzero, so ξ^p is not divisible by p in A_inf. Moreover A_cris^{0,(p)}≅A_inf[T]/(p!·T−ξ^p) via T↦ξ^p/p!.
- `Semistable.finiteLevelAcris.mu_divided_power` (computation): For m≥p: μ=ξ·φ_A⁻¹(μ) gives μ^p/p!=(ξ^p/p!)·φ_A⁻¹(μ)^p∈A_cris^{0,(m)}, hence μ^p∈p·A_cris^(m).
- `Semistable.finiteLevelAcris.frobenius_xi` (computation): For m≥p: ξ̃=φ_A(ξ) is congruent to ξ^p modulo p·A_inf and ξ^p=p!·(ξ^p/p!), so ξ̃/p∈A_cris^{0,(m)} and φ_A(ξ^s/s!)=(p^s/s!)·(ξ̃/p)^s∈A_cris^{0,(m)} for every s.
- `Semistable.finiteLevelAcris.mod_p_torsion` (computation): A_cris^(p)/p≅O_C^♭[T]/(ξ̄^p), with ξ̄=(ε^{1/p}−1)^{p−1} the image of ξ; the image μ̄=(ε^{1/p}−1)^p of μ satisfies μ̄^{p−1}=ξ̄^p=0, so A_cris^(p)/p has nonzero μ-torsion (the class of 1 if p=2, of μ̄^{p−2} if p>2), while A_cris^(p) itself is μ-torsion-free.
- `Semistable.finiteLevelAcris.small_not_p_adic` (non-example): For m<p the p-adic and (p,μ)-adic topologies of A_cris^(m)=A_inf differ: no power of μ is divisible by p, because the image ε−1 of μ in the domain O_C^♭ is nonzero. So the statements made for m≥p with p-adic completions do not extend to m<p without replacing them by (p,μ)-adic ones.

**Check.** For m<p the construction returns A_inf, A(R) and A_inf(R_∞). For m≥p the p-adic and (p,μ)-adic topologies of A_cris^(m) agree, and A_cris^(m)/p has nonzero μ-torsion although A_cris^(m) is μ-torsion-free; this is why (3.26.2) is needed to pass to the limit.

**Source.** CK, §3.26, p.19; CK, §3.26, p.19; CK, §3.26, p.20; CK, §3.26, (3.26.4), p.20; CK, §3.27, (3.27.2), p.20; CK, §3.27, p.20; CK, Proposition 3.29, p.21; CK, §5.1, (5.1.1), p.32; BMS1, Lemma 12.8, p.364; CK, §5.19, (5.19.3), p.42; CK, §5.35, p.52; CK, Proposition 5.36, p.52.

### finite-pd-base-change — Finite PD décalage base change

Target `AInfCohomology:AI.6/finite-pd-base-change` (theorem).

**Statement.** Let A_cris^(m), A_cris^(m)(R) and A_cris^(m)(R_∞)=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m) be as in finite-level-acris. For every m≥p: (a) the base change e⊗̂^L A_cris^(m): RΓ_cont(Δ,A_cris^(m)(R_∞))→RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m) of the edge map (CK (3.28.1)) becomes an isomorphism after Lη_μ (CK Theorem 3.34); (b) the natural map (Lη_μRΓ_cont(Δ,A_inf(R_∞)))⊗̂^L_{A_inf}A_cris^(m)→Lη_μRΓ_cont(Δ,A_cris^(m)(R_∞)) is an isomorphism, and both sides are the Koszul complex K_{A_cris^(m)(R)}((δ₁−1)/μ,…,(δ_d−1)/μ) (proof of CK Proposition 5.6); (c) consequently Lη_μ(RΓ_proét(X_C^ad,A_inf,X))⊗̂^L_{A_inf}A_cris^(m)≃Lη_μ(RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m)) (CK Proposition 5.6). The target of (a) is a completed tensor product of the cohomology of A_inf,X, not the cohomology of a sheaf of rings A_cris^(m) on the pro-étale site.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. X=Spf(R) with an étale coordinate map as in CK (3.1.1) (CK §5.5 moreover assumes X connected); m≥p; ⊗̂^L is the derived p-adic completion of the derived tensor product, as in CK (1.7.1); no unrestricted Lη/tensor commutation is asserted.

**Dependencies.** `AInfCohomology:AI.6/local-edge`; `AInfCohomology:AI.6/nonintegral-annihilation`; `AInfCohomology:AI.6/finite-level-acris`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `CrystallineCohomology:CR.0`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`; `EnhancedDerivedSheaves:E4`.

**Proof or construction.** Base change of the edge map (CK §3.28): for m≥p the projection formula (Stacks Project 0944) with CK Lemmas 3.7 and 3.13 gives RΓ_cont(Δ,A_inf(R_∞))⊗̂^L_{A_inf}A_cris^(m)≅RΓ_cont(Δ,A_cris^(m)(R_∞)), whence the map (3.28.1); the completed tensor products are formed with E4/completed-sheaf-tensor in the topos of sets. [m^♭] kills the cohomology of Cone(e)⊗^L A_cris^(m)/p^n, hence of the completed cone (Stacks Project 0D6K), and CK Lemma 3.17 upgrades this to W(m^♭) ((3.28.2)). CK Lemmas 3.30 and 3.31: for A_inf-modules satisfying the Mittag-Leffler condition (⋆) on the systems Tor_j^{A_inf}(−,A_cris^(m)/p^n), cohomology of a bounded complex commutes with −⊗̂_{A_inf}A_cris^(m); (⋆) holds for A_inf(R_∞) and A_inf(R_∞)/μ (CK Lemma 3.13), and for H^i_cont(Δ,A_inf(R_∞)/μ) and H^i_cont(Δ,N_∞) by nonintegral-annihilation (a)–(c), Lazard's theorem and the intertwining property (3.26.2) of finite-level-acris. This gives CK Proposition 3.32 (μ kills H^i_cont(Δ,N_∞⊗̂A_cris^(m))) and the identifications of CK Proposition 3.33. CK Proposition 3.33, torsion: using (3.19.1), the decomposition (3.22.1), CK Corollary 3.23 and Proposition 3.29 (finite-level-acris), and approximation over Z_p[[T]] with T↦[ε^{1/p^j}]−1, H^i_cont(Δ,A_cris^(m)(R_∞)/μ) has no nonzero W(m^♭)-torsion. With (3.28.2) and the projection formula ((3.27.2)), the almost-to-integral criterion CK Lemma 3.18 (AI.1) gives (a). (b) and (c), CK Proposition 5.6: the map of (c) exists because its target is derived p-adically complete (BMS1 Lemma 6.19; AI.1). By local-edge and (a) it suffices to prove (b). By nonintegral-annihilation (a) and CK Proposition 3.32 the summand N_∞ contributes to neither side. On the summand A(R), Δ acts trivially modulo μ on A(R) and on A_cris^(m)(R) (ainf-chart-lift, finite-level-acris), so by CK Lemma 3.7 both sides are Koszul complexes on the (δᵢ−1)/μ; the completed tensor product is termwise because each (p^n,μ^{n′}) is A(R)-regular with A(R)/(p^n,μ^{n′}) flat over A_inf/(p^n,μ^{n′}) (CK Lemma 3.13), and the two complexes agree termwise (CK §3.27).

**Check.** For m<p, A_cris^(m)=A_inf and (a)–(c) reduce to local-edge; for m≥p the p-adic and (p,μ)-adic topologies of A_cris^(m) agree, which is what makes the completed tensor product of the A(R)-Koszul complex termwise. For R=O_C (d=0, Δ trivial) the three maps are the identity of A_cris^(m), which is p-adically complete and μ-torsion-free. The statement is for the rings A_cris^(m) with m≥p and derived p-completed tensor products; CK does not prove the analogue of (a) for A_cris itself, the W(m^♭)-torsion of the cohomology modulo μ being out of reach for A_cris/μ.

**Source.** CK, §3.28, (3.28.1), p.21; CK, Proposition 3.32, p.23; CK, Proposition 3.32 (last sentence), p.23; CK, Proposition 3.33, p.23; CK, Proposition 3.33 (last sentence), p.23; CK, Theorem 3.34, p.24; CK, Proposition 5.6, p.34; CK, Proposition 5.6 (proof), p.34; CK, Proposition 5.6 (proof), p.34; CK, Proposition 5.6 (proof), p.34; CK, §5.5, p.34.

### log-derivations — Local logarithmic derivations

Target `AInfCohomology:AI.6/log-derivations` (construction).

**Statement.** On the chart polynomial ring, for a branch direction 1≤i≤r let D_i=X_i∂_i−X₀∂₀; for each torus pair Y_j,Z_j let D_j=Y_j∂_{Y_j}−Z_j∂_{Z_j}. These derivations kill ∏X_i−a (a in the coefficient ring) and Y_jZ_j−1, hence preserve the chart ideal, and they commute. On A(R□) they are the (p,μ)-adically continuous extensions of these derivations. On A(R) they are the basis ∂/∂log(X_i), i=1,…,d (d=r+s), dual to the basis dlog X₁,…,dlog X_d of the free A(R)-module Ω¹_{A(R)/A_inf,log} (CK (5.10.1)–(5.10.2)); equivalently, the unique A_inf-derivations of A(R) extending those of A(R□) along the (p,μ)-adically formally étale map A(R□)→A(R). By base change they give A_cris^(m)-derivations of A_cris^(m)(R)=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris-derivations of A_cris(R). The log de Rham complex Ω•_{A(R)/A_inf,log} is their Koszul complex (CK (5.10.3)), with degree-j Frobenius p^jφ. The derivations of the all-coordinates envelopes (CK §5.31) are constructed in all-coordinates-pd, not here.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. Spf R→Spf R□ is an étale coordinate map as in ainf-chart-lift (CK (5.5.1)), with Spf R connected (the local setting of CK §5.5). Indices distinguish the r branch directions from the s=d−r torus directions. The PD extensions are A_cris^(m)(R) of CK §3.27 (m≥1; A_cris^(m)=A_inf for m<p) and A_cris(R) of CK §5.8 and §5.11, not arbitrary completions.

**Dependencies.** `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.6/divisorial-log`; `mathlib:MvPolynomial.pderiv`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `CrystallineCohomology:CR.5:log-algebra`; `CrystallineCohomology:CR.0`; `AInfCohomology:AI.6/finite-level-acris`.

**Proof or construction.** Use Mathlib MvPolynomial.pderiv and the Leibniz rule to check the two defining relations: D_i(∏_{k≤r}X_k)=∏X_k−∏X_k=0 and D_j(Y_jZ_j)=0. Each derivation is diagonal on monomials (D_i(X^a)=(a_i−a₀)X^a), so the derivations preserve the chart ideal and commute. By CK §5.9 (Kato, Logarithmic structures of Fontaine–Illusie, 3.5–3.6; supplied by CR.5:log-algebra) A(R□) is (p,μ)-adically formally log smooth over A_inf for the chart ℕ→ℕ^{r+1} of divisorial-log, and A(R) is formally étale over A(R□) (ainf-chart-lift). Hence Ω¹_{A(R)/A_inf,log}, formed as in CK §5.10 as the inverse limit of the log differentials modulo (p^n,μ^{n′}) (Ogus, Lectures on Logarithmic Algebraic Geometry, V.2.1.1; CR.5), is free on dlog X₁,…,dlog X_d. Define ∂/∂log(X_i) as the dual basis; the relation dlog X₀+…+dlog X_r=0 gives CK (5.10.2), which are the formulas of the first step. That these are the unique extensions of the polynomial derivations is not stated in CK; it follows from the density of the polynomial ring in A(R□) and the formal étaleness of A(R□)→A(R). Form the Koszul complex with AI.1’s Koszul carrier and identify it with Ω•_{A(R)/A_inf,log} as in CK (5.10.3). Frobenius multiplies each dlog X_i by p (CK §5.9), so it acts as p^jφ in degree j; equivalently ∂/∂log(X_i)∘φ=p·φ∘∂/∂log(X_i). Base change along A_inf→A_cris^(m) (finite-level-acris) and A_inf→A_cris (CR.0) gives the derivations of CK Proposition 5.13 and the complex of CK §5.11.

**Uses.**

- CK Lemma 5.15 and Proposition 5.16: The exponential comparison relates these derivations to Δ-cochains.
- CK §5.31: The PD derivations of the all-coordinates envelopes extend these derivations.
- CrystallineCohomology:CR.6: Frobenius normalization must agree with the Hyodo–Kato export.

**API.**

- `Semistable.logDerivations.generators` (simp): D_i(X_i)=X_i, D_i(X₀)=−X₀ and all other branch values are zero; torus direction sends Y to Y and Z to −Z.
- `Semistable.logDerivations.relations` (relation): Each D annihilates ∏X_i−a and Y_jZ_j−1, hence descends to the quotient.
- `Semistable.logDerivations.frobenius` (compatibility): D_iφ=pφD_i; on the log differential complex the degree-j lift is p^jφ.
- `Semistable.logDerivations.dual_basis` (characterisation): On A(R) the derivations ∂/∂log(X_i), i=1,…,d, are the basis dual to dlog X₁,…,dlog X_d of Ω¹_{A(R)/A_inf,log}; they restrict on A(R□) to the continuous extensions of the D_i and commute with each other.

**Definition tests.**

- `Semistable.logDerivations.node` (computation): On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀X₁−a)=0 for every integer a.
- `Semistable.logDerivations.torus` (computation): On Z[Y,Z], (Y∂_Y−Z∂_Z)(YZ−1)=0.
- `Semistable.logDerivations.zero_rank` (degenerate): For r=s=0 there are no log directions, and the Koszul complex has only degree 0.
- `Semistable.logDerivations.monomial` (computation): On Z[X₀,X₁], (X₁∂₁−X₀∂₀)(X₀^aX₁^b)=(b−a)X₀^aX₁^b for all a,b≥0; in particular D(X₁)=X₁ and D(X₀)=−X₀, which fixes the normalisation.

**Check.** The branch sum relation is killed; degree-one Frobenius multiplies by p.

**Source.** CK, §5.9, p.36; CK, §5.10, (5.10.1), p.36; CK, §5.10, (5.10.2), p.37; CK, §5.10, (5.10.3), p.37; CK, §5.9, p.36; CK, Proposition 5.13, p.38.

### local-crystalline — Local logarithmic crystalline comparison

Target `AInfCohomology:AI.6/local-crystalline` (theorem).

**Statement.** Let m≥p². On A_cris^(m)(R) each generator δ_i of Δ (i=1,…,d) acts as exp(log([ε])·D_i)=∑_{n≥0}(log([ε]))^n/n!·D_i^n, where D_i=∂/∂log(X_i) is the derivation of log-derivations and log([ε])=μ−μ²/2+μ³/3−…∈A_cris^(m). Hence (δ_i−1)/μ=D_i·U_i, where U_i=∑_{n≥1}(log([ε]))^n/(μ·n!)·D_i^{n−1} is an A_cris^(m)-linear automorphism of A_cris^(m)(R) (CK Lemma 5.15). The maps (id, ∑_{n≥1}(log([ε]))^n/n!·D_i^{n−1}) from [D_i] to [δ_i−1] induce an isomorphism of complexes K_{A_cris^(m)(R)}(D_1,…,D_d)≅η_μK_{A_cris^(m)(R)}(δ_1−1,…,δ_d−1) and a quasi-isomorphism onto η_μK_{A_cris^(m)(R_∞)}(δ_1−1,…,δ_d−1); they intertwine p^jφ in degree j of the source with φ (CK Proposition 5.16). After the termwise colimit over m and termwise p-adic completion this gives a Frobenius-equivariant identification RΓ_logcrys((Spf R)_{O_C/p}/A_cris)≅AΩ_R⊗̂^L_{A_inf}A_cris (CK (5.16.3)), where AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf) is the value on Spf R of the presheaf AΩ^psh of CK §4.1.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. The local setting of CK §5.5: Spf R is connected with an étale chart R□→R; A_cris^(m)(R)=A(R)⊗̂_{A_inf}A_cris^(m) and A_cris^(m)(R_∞)=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m) (CK §3.27). m≥p² for log([ε]) and the exponential argument (CK §5.14); the smaller bound m≥p of finite-pd-base-change is distinct. The colimit over m≥p is computed over the cofinal range m≥p².

**Dependencies.** `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.6/log-derivations`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `EnhancedDerivedSheaves:E4/completed-colimits`; `AInfCohomology:AI.6/ainf-chart-lift`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `CrystallineCohomology:CR.0`; `AInfCohomology:AI.6/finite-level-acris`; `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.4/hodge-tate-cotangent`; `AInfCohomology:AI.4/de-rham`; `AInfCohomology:AI.4/bounded-pd-coefficients`; `AInfCohomology:AI.4/pd-toric-eta-comparison`; `AInfCohomology:AI.4/pd-logarithmic-coordinate`; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `AInfCohomology:AI.4/mu-inverted-etale`.

**Proof or construction.** Use finite-level-acris (CK §§3.26–3.27; the vanishing (3.26.2) is BMS1 Lemma 12.8(ii)): A_cris^(m)(R) is p- and μ-torsion free, Δ acts trivially on A_cris^(m)(R)/μ, and A_cris^(m)(R) is formally étale over A_cris^(m)(R□). Use CK §5.14 (the proof of BMS1 Lemma 12.2, compare BMS1 Lemma 12.8(i); AI.4): for m≥p² the elements μ^n/(n+1)! lie in A_cris^(m), are topologically nilpotent and tend to 0 p-adically, so log([ε]) is defined, is a unit multiple of μ, and φ(log([ε]))=p·log([ε]). Use CK Lemma 5.15 to factor (δ_i−1)/μ=D_i·U_i with U_i a convergent unit operator: the series exp(log([ε])·D_i) is a ring endomorphism by the Leibniz rule; for R=R□ it agrees with δ_i on the generators X_j by CK (5.10.2); for general R both sides are trivial modulo (p,ξ), so they agree by formal étaleness; dividing by μ uses μ-torsion-freeness. Apply CK Proposition 5.16: since Δ acts trivially modulo μ, the j-th term of η_μK_{A_cris^(m)(R)}(δ_i−1) consists of the μ^j-multiples, and the maps (id, μ·U_i) give the isomorphism (5.16.4); Frobenius-equivariance follows from D_i∘φ=p·φ∘D_i and φ(log([ε]))=p·log([ε]). By CK Proposition 3.32 with Lemma 3.7 (finite-pd-base-change; Koszul cochains from AI.1) the inclusion into η_μK_{A_cris^(m)(R_∞)}(δ_i−1) is a quasi-isomorphism. Identify the source with log crystalline cohomology by CK Proposition 5.13: A_cris(R)/p^n is a PD smooth log PD thickening of R/p over A_cris/p^n (CK Lemma 5.12; Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.4, Remarks (ii)), so its log de Rham complex computes RΓ_logcrys (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1), for quasi-coherent integral log structures; supplied by CR.5). Identify the target by CK Corollary 5.7 (finite-pd-base-change, i.e. CK Proposition 5.6 and Theorem 3.34, with aomega for AΩ^psh). Then pass to the termwise colimit over m and the termwise p-adic completion (E4/completed-colimits).

**Check.** The scaling in degree j is part of the map; an unscaled differential comparison fails Frobenius compatibility. For R=R□ both sides of δ_i=exp(log([ε])·D_i) send X_i to [ε]X_i, fix X_j for 0<j≠i, and send X₀ to [ε]^{-1}X₀ if i≤r and to X₀ if i>r.

**Source.** CK, §5.14, p.38; BMS1, Lemma 12.8, p.364; CK, §3.27, (3.27.2), p.20; CK, Lemma 5.15, pp.38–39; CK, Lemma 5.15, proof, p.39; CK, Proposition 5.16, (5.16.1)–(5.16.2), pp.39–40; CK, Proposition 5.16, proof, p.40; CK, Proposition 5.13, proof, p.38; CK, Corollary 5.7, p.35.

### all-coordinates — All-coordinates semistable presentations

Target `AInfCohomology:AI.6/all-coordinates` (definition).

**Statement.** Let Spf R be an affine nonempty étale open of 𝔛 such that every two irreducible components of Spec(R⊗_{O_C}k̄) meet. An index (Σ,Λ) consists of a finite set Σ, a nonempty finite set Λ, for each λ∈Λ a chart ring R□_λ=O_C{t_{λ,0},…,t_{λ,r_λ},t_{λ,r_λ+1}^{±1},…,t_{λ,d}^{±1}}/(t_{λ,0}⋯t_{λ,r_λ}−p^{q_λ}) with q_λ∈Q_{>0} (the same d for all λ; r_λ and q_λ may vary), and a closed immersion Spf R→Spf O_C{t_σ^{±1}:σ∈Σ}×∏_{λ∈Λ}Spf R□_λ over Spf O_C such that already Spf R→Spf O_C{t_σ^{±1}:σ∈Σ} is a closed immersion and each Spf R→Spf R□_λ is étale (CK §5.17). Indices are refined by enlarging Σ and Λ and form a filtered system. Each irreducible component of Spec(R⊗k̄) is cut out by a unique t_{λ,i} with 0≤i≤r_λ. If R⊗k̄ is not k̄-smooth, then R determines q_λ, so q_λ does not depend on λ; if R⊗k̄ is smooth, q_λ may depend on λ and r_λ>0 is allowed. The product chart algebra is A□_{Σ,Λ}=A(R□_Σ)⊗̂_{A_inf}⊗̂_{λ∈Λ}A(R□_λ), completed (p,μ)-adically (CK (5.22.1)). The root cover R_{Σ,Λ,∞} is the base change to R of the product of the root towers of R□_Σ=O_C{t_σ^{±1}} and of the R□_λ; it is a perfectoid pro-(finite étale) cover of the generic fibre with group Δ_{Σ,Λ}=Δ_Σ×∏_{λ∈Λ}Δ_λ, topologically freely generated by the δ_σ (σ∈Σ) and δ_{λ,i} (λ∈Λ, 1≤i≤d), and it contains each chart tower R_{λ,∞} as a subcover (CK §5.18).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. Spf R is affine, nonempty and étale over 𝔛, and every two irreducible components of Spec(R⊗_{O_C}k̄) meet (so Spf R is connected). Only the indices of CK §5.17 are used: Λ≠∅, all charts have the same relative dimension d, the map to the torus alone is a closed immersion, and each chart map is étale; arbitrary unrelated semistable charts are not substituted.

**Dependencies.** `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/ainf-chart-lift`; `PerfectoidSpaces:P3`.

**Proof or construction.** Use the formal-scheme and étale carriers from AI.3 and CR.5 and the chart rings of chart-ring; construct only the eligible presentation index. Existence on a basis of 𝔛_ét (CK §5.17): a chart (5.17.3) exists étale locally (CK §1.5); R is then the p-adic completion of a finite type O_C-algebra, so small Zariski opens of Spf R embed into a formal torus. The condition on components is obtained by shrinking around a point so that the finitely many components not passing through it are removed; this last step is not spelled out in CK. By (5.17.3) the irreducible components of Spec(R⊗k̄) are the connected components of the loci t_{λ,i}=0, so the assumption on components gives the unique t_{λ,i} cutting out each component. If R⊗k̄ is not smooth, R determines q_λ by CK §1.5, footnote 2 (a Fitting-ideal computation), so q_λ does not depend on λ. Apply CK §5.18: form the towers of root-tower for R□_Σ and each R□_λ, their product and its base change R_{Σ,Λ,∞} to R; it is perfectoid by almost purity (Scholze, Perfectoid spaces, 7.9 (iii); supplied by PerfectoidSpaces:P3). Apply CK (5.22.1): A□_{Σ,Λ} is the (p,μ)-completed product over A_inf of the lifts of ainf-chart-lift. Enlarging (Σ,Λ) gives the transition maps, and the union of two indices for the same R is an index, so the system is filtered (CK §5.21).

**Uses.**

- CK §§5.22–5.40: Presentation-independent crystalline maps are made by colimit over this index.

**API.**

- `Semistable.allCoordinates.refine` (constructor): Finite union of invertible coordinates and finite union of chart families define a common refinement of eligible indices.
- `Semistable.allCoordinates.maps` (functoriality): For (Σ,Λ)⊂(Σ′,Λ′) the projections give maps A□_{Σ,Λ}→A□_{Σ′,Λ′} and R_{Σ,Λ,∞}→R_{Σ′,Λ′,∞}, compatible with Frobenius and with Δ_{Σ′,Λ′}→Δ_{Σ,Λ}, satisfying identity and composition. For a p-adically formally étale R→R′ with index (Σ′,Λ′), the (Σ,Λ)-objects of R map to the (Σ∪Σ′,Λ∪Λ′)-objects of R′.
- `Semistable.allCoordinates.single` (compatibility): For each λ∈Λ the chart tower R_{λ,∞} is a subcover of R_{Σ,Λ,∞}, compatibly with the projection Δ_{Σ,Λ}→Δ_λ. The presentation does not reduce to that chart and its tower: Σ must by itself give a closed immersion, and the group is Δ_Σ×∏_λΔ_λ.
- `Semistable.allCoordinates.components` (characterisation): For every λ∈Λ each irreducible component of Spec(R⊗k̄) is cut out by a unique t_{λ,i} with 0≤i≤r_λ.
- `Semistable.allCoordinates.valuation` (characterisation): If R⊗k̄ is not smooth, q_λ is the same for all λ∈Λ; if R⊗k̄ is smooth, there is for each λ a unique i_λ with t_{λ,i_λ}∉R^×, and q_λ may depend on λ.

**Definition tests.**

- `Semistable.allCoordinates.two_charts` (characterisation): Two distinct eligible node charts are both refined by the index containing their union.
- `Semistable.allCoordinates.no_chart` (non-example): Λ=∅ is excluded; torus coordinates alone do not constitute the logarithmic semistable presentation.
- `Semistable.allCoordinates.smooth` (compatibility): Let R be smooth with Spf R connected, and let Σ⊂R^× be a finite set as in BMS1 §12.2: it gives a closed embedding into a torus and contains d elements giving an étale framing λ. Then (Σ,{λ}), with r_λ=0, is an index, and the Δ_Σ-cover of the generic fibre obtained by adjoining p-power roots of the elements of Σ is the quotient of R_{Σ,{λ},∞} by Δ_λ. This is a comparison map of presentations, not an identification with the smooth all-coordinates presentation, and it is not a statement of CK.
- `Semistable.allCoordinates.smooth_valuations` (non-example): For R=O_C{t^{±1}} and any q∈Q_{>0}, the map t₀↦p^q·t, t₁↦t^{-1} from O_C{t₀,t₁}/(t₀t₁−p^q) is an étale chart with r_λ=1 (the completed localisation at t₁). Two such charts with different q, together with Σ={t}, form an index; so q_λ is not constant on Λ when R⊗k̄ is smooth.

**Check.** Adjoining two allowed framings yields a common refinement, without choosing one framing as canonical.

**Source.** CK, §5.17, p.40; CK, §5.17, p.40; CK, §5.17, (5.17.2)–(5.17.3), p.40; CK, §5.17, p.40; CK, §5.17, p.40; CK, §1.5, footnote 2, p.4; CK, §5.17, p.40; CK, §5.18, (5.18.1), p.41; CK, §5.18, p.41; CK, §5.21, p.42; CK, §5.22, (5.22.1), p.43.

### log-exactification — Log exactification of all-coordinates charts

Target `AInfCohomology:AI.6/log-exactification` (construction).

**Statement.** Fix the unique q∈Q_{>0} with Z·q=∑_{λ∈Λ}Z·q_λ, and give O_C/p and A_inf the fine log structures ℕ→O_C/p, 1↦p^q and ℕ→A_inf, 1↦[(p^{1/p^∞})^q]. Let Q be the fine monoid of CK §5.25, the product of the monoids Q_λ with their diagonal elements identified; it is a chart of A□_{Σ,Λ}. Choose λ₀∈Λ and let P_{λ₀} be the monoid (5.26.1) if R⊗k̄ is smooth, or the monoid (5.27.2), indexed by the generic points Y of the special fibre, if it is not. The fine version of the log closed immersion Spec(R/p)→Spec(A□_{Σ,Λ}) factors Frobenius-equivariantly as an exact log closed immersion j_{λ₀} into Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]), followed by the log étale projection q_{λ₀} (CK (5.26.5), (5.27.5)). The algebra A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] is the initial A□_{Σ,Λ}-algebra with units satisfying the relations (5.26.3), respectively (5.27.3), and R is an algebra over it. The canonical changes λ₀→λ₀′, isomorphisms over A□_{Σ,Λ} compatible with the maps from Spec(R/p) (CK (5.26.6)–(5.26.7)), commute with Frobenius and satisfy the cocycle law.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. (Σ,Λ) is an index of all-coordinates for Spf R (CK §5.17). The fine versions of the log structures are used. No PD envelope is formed here; in particular the log PD envelope of the nonexact immersion, with p not nilpotent, is not used (CK footnote 11).

**Dependencies.** `AInfCohomology:AI.6/all-coordinates`; `CrystallineCohomology:CR.5:log-algebra`; `CrystallineCohomology:CR.5`.

**Proof or construction.** Import the chart and log-étale criteria from CR.5:log-algebra and CR.5. Following CK §5.25, build Q_λ⊂(q/q_λ)·ℕ^{r_λ+1}, generated by ℕ^{r_λ+1} and the diagonal element (q/q_λ,…,q/q_λ), with the chart Q_λ→A(R□_λ) sending the standard generators to the X_{λ,i} and the diagonal element to [(p^{1/p^∞})^q]; Q is obtained by identifying the diagonal elements. Smooth case (CK §5.26): for each λ there is a unique i_λ with t_{λ,i_λ}∉R^×; write t_{λ,i}=(p^q)^{n_{λ,i}}·v_{λ,i} with v_{λ,i}∈R^×, n_{λ,i_λ}=q_λ/q and n_{λ,i}=0 otherwise. Then P_{λ₀}→R/p, 1↦p^q, 1_{(λ,i)}↦v_{λ,i}, is a chart, Q→P_{λ₀} is a Frobenius-equivariant chart of the immersion, and A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] has the universal property (5.26.3). Nonsmooth case (CK §5.27): q_λ=q for all λ, and by all-coordinates each generic point y determines an index i_λ(y) with t_{λ,i_λ(y)}=u_{λ,λ₀,y}·t_{λ₀,i_{λ₀}(y)} for a unique u_{λ,λ₀,y}∈R^× (5.27.1). The chart P_{λ₀}→R/p sends 1_y to t_{λ₀,i_{λ₀}(y)}, 1_{(λ,i)} to t_{λ,i} for i∉i_λ(Y) and to u_{λ,λ₀,y} for i=i_λ(y); this gives the universal property (5.27.3) with branch ratios U_{λ,λ₀,y} and their product relations. j_{λ₀} is exact by construction and q_{λ₀} is log étale by Kato, Logarithmic structures of Fontaine–Illusie, 3.5 (CR.5:log-algebra). For the change maps: in the smooth case the relations (5.26.3) do not involve λ₀; in the nonsmooth case use U_{λ,λ₀′,y}=U_{λ,λ₀,y}/U_{λ₀′,λ₀,y}. The cocycle law is not stated in CK; it follows from this formula, since U_{λ,λ₀″,y}=U_{λ,λ₀′,y}/U_{λ₀″,λ₀′,y}=U_{λ,λ₀,y}/U_{λ₀″,λ₀,y}, and from the universal properties.

**Uses.**

- CK §§5.28–5.34: An ordinary envelope after exactification computes the completed log PD envelope.

**API.**

- `Semistable.logExactification.factor` (data): The displayed factorization is exact-closed followed by log étale and commutes with the map to R/p.
- `Semistable.logExactification.units` (simp): Nonsmooth case (CK (5.27.3)): X_{λ,i} is a unit for i∉i_λ(Y); X_{λ,i_λ(y)}=U_{λ,λ₀,y}·X_{λ₀,i_{λ₀}(y)}; U_{λ₀,λ₀,y}=1; and ∏_{y∈Y}U_{λ,λ₀,y}=∏_{i∉i_{λ₀}(Y)}X_{λ₀,i}/∏_{i∉i_λ(Y)}X_{λ,i}. Smooth case (CK (5.26.3)): X_{λ,i}=[((p^{1/p^∞})^q)^{n_{λ,i}}]·V_{λ,i} with units V_{λ,i} and ∏_{0≤i≤r_λ}V_{λ,i}=1, where n_{λ,i_λ}=q_λ/q and n_{λ,i}=0 for i≠i_λ.
- `Semistable.logExactification.change` (functoriality): Changing λ₀ uses the displayed ratios and composes by the cocycle law, preserving log charts and Frobenius.
- `Semistable.logExactification.algebra` (compatibility): R is an algebra over A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}], with V_{λ,i}↦v_{λ,i} in the smooth case and U_{λ,λ₀,y}↦u_{λ,λ₀,y} in the nonsmooth case, compatibly with change of λ₀ (CK (5.26.4), (5.27.4)).

**Definition tests.**

- `Semistable.logExactification.single` (degenerate): For Λ={λ₀} in the nonsmooth case the units U_{λ₀,λ₀,y} are 1 and A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] is the localization of A□_{Σ,Λ} inverting X_{λ₀,i} for those i with t_{λ₀,i}∈R^×; it equals A□_{Σ,Λ} exactly when every t_{λ₀,i}, 0≤i≤r_{λ₀}, is a nonunit of R.
- `Semistable.logExactification.node` (computation): For two node charts x′=ax, y′=a⁻¹y of the same R with a∈R^× (for instance a∈O_C^×), with branches y₁: x=0 and y₂: y=0, the images in R of the ratio units are u_{λ,λ₀,y₁}=a and u_{λ,λ₀,y₂}=a⁻¹, and the product relation reads U_{λ,λ₀,y₁}·U_{λ,λ₀,y₂}=1.
- `Semistable.logExactification.nonexact_pd` (non-example): For the two node charts of the previous test, when the node x=y=0 lies in Spf R the immersion Spec(R/p)→Spec(A□_{Σ,Λ}) is not exact: there is no V∈A□_{Σ,Λ} with X′=V·X (modulo (X,Y,Y′) the element X′ is nonzero), although x′=ax in R. The exactified algebra adjoins exactly the unit U with X′=U·X and Y=U·Y′.
- `Semistable.logExactification.smooth` (computation): For R=O_C{t^{±1}}, Σ={t} and Λ={λ₀,λ₁}, where λ₀ has r=0, q_{λ₀}=1 (t_{λ₀,0}=p, t_{λ₀,1}=t) and λ₁ has r=1, q_{λ₁}=1/2 (t_{λ₁,0}=p^{1/2}t, t_{λ₁,1}=t^{-1}): q=1/2, n_{λ₀,0}=2, n_{λ₁,0}=1, n_{λ₁,1}=0, v_{λ₀,0}=1, v_{λ₁,0}=t, v_{λ₁,1}=t^{-1}, and the exactified algebra is A□_{Σ,Λ}[X_{λ₁,1}^{-1}] with V_{λ₁,1}=X_{λ₁,1}, V_{λ₁,0}=X_{λ₁,1}^{-1}, V_{λ₀,0}=1.

**Check.** The envelope computation is independent of λ₀ through actual change maps.

**Source.** CK, §5.25, p.45; CK, §5.25, p.45; CK, §5.26, (5.26.3), p.46; CK, §5.26, (5.26.5), p.46; CK, §5.26, (5.26.6)–(5.26.7), p.46; CK, §5.27, (5.27.2), p.47; CK, §5.27, (5.27.3), p.47; CK, §5.27, (5.27.5), p.47; CK, §5.25, footnote 11, p.45.

### all-coordinates-pd — All-coordinates log PD envelope

Target `AInfCohomology:AI.6/all-coordinates-pd` (construction).

**Statement.** Let D_{jλ₀} be CR.0’s ordinary divided power envelope over (Z_p,pZ_p) of the exact closed immersion j_{λ₀}: Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]) of log-exactification (CK §5.28); by the universal property of the uncompleted A_cris^0 it is equally the divided power envelope of j_{λ₀,cris} over Spec(O_C/p)→Spec(A_cris^0). Let D_{Σ,Λ}=lim_nD_{Σ,Λ,n}, where D_{Σ,Λ,n} is the log PD envelope of Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) over Spec(O_C/p)→Spec(A_cris/p^n) (CK §5.22); it is the completed log PD envelope used for R/p, with an A_cris-semilinear Frobenius, a Δ_{Σ,Λ}-action and a map D_{Σ,Λ}→R. The map q_{λ₀} induces isomorphisms D_{Σ,Λ,n}≅D_{jλ₀}/p^n and D_{Σ,Λ}≅(D_{jλ₀})^∧ (p-adic completion), A_cris-linear and compatible with divided powers, Frobenius, Δ_{Σ,Λ}, the maps to R and change of λ₀ (CK Lemma 5.29). For m≥1 let D^{(m)}_{jλ₀}⊂D_{jλ₀} be the subalgebra generated by the divided powers of degree ≤m of elements of the ideal of j_{λ₀}, and D^{0,(m)}_{Σ,Λ} its image in D_{Σ,Λ}, which is independent of λ₀. For m≥p let D^{(m)}_{Σ,Λ} be the p-adic completion of D^{0,(m)}_{Σ,Λ}; it is an A_cris^(m)-algebra with Frobenius and Δ_{Σ,Λ}-action, and D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧ over A_cris (CK (5.30.1)). The derivations ∂/∂log(X_τ) of log-derivations (τ=σ∈Σ or τ=(λ,i), 1≤i≤d) extend to divided power derivations of D_{jλ₀} and D_{Σ,Λ} and to A_cris^(m)-derivations of D^{(m)}_{Σ,Λ} (CK §5.31). All of this is functorial under enlarging (Σ,Λ). No p-torsion-freeness of D_{Σ,Λ} is assumed, and D^{(m)}_{Σ,Λ}→D_{Σ,Λ} is not asserted to be injective.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. (Σ,Λ) is an index of all-coordinates for Spf R and λ₀∈Λ. D^{(m)}_{Σ,Λ} is defined for m≥p.

**Dependencies.** `AInfCohomology:AI.6/log-exactification`; `CrystallineCohomology:CR.0`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.6/log-derivations`; `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/finite-level-acris`.

**Proof or construction.** CK §5.22: for n,n′>0 the A_inf/(p^n,μ^{n′})-base change of Spec(R/p)→Spf(A□_{Σ,Λ}) has a log PD envelope D_{Σ,Λ,n,n′} over (Z/p^n,pZ/p^n) (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.3, Theorem; for the fine version Kato, Logarithmic structures of Fontaine–Illusie, 5.4; supplied by CR.5). For n′ large it is the log PD envelope over Spec(O_C/p)→Spec(A_cris/p^n) and does not depend on n′; put D_{Σ,Λ}=lim_nD_{Σ,Λ,n}. Frobenius and Δ_{Σ,Λ} act by functoriality, and the universal property gives Spec(R/p)→Spf R→Spf D_{Σ,Λ} (CK (5.22.3)). Apply the imported universal ordinary PD envelope (CR.0) after log-exactification: D_{jλ₀} is the envelope of j_{λ₀} over (Z_p,pZ_p); by the universal property of A_cris^0 (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.8; CR.0) it is the envelope of j_{λ₀,cris} over A_cris^0, and because j_{λ₀} is exact it is also the log PD envelope (Kato, Logarithmic structures of Fontaine–Illusie, 5.5.1; CR.5). Use CK Lemma 5.29, p.48: in an integral quasi-coherent log PD thickening T₀→T, let t,t′ be sections of the log structure on T and let u₀ be a unit on T₀ relating their restrictions. There is a unique unit u on T restricting to u₀ and satisfying t=u·t′ (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.1, Exercises (iii); CR.5). Uniqueness concerns this prescribed log-section relation; an ordinary unit can have many lifts. Applying this lifting property to the ratios in (5.26.3) and (5.27.3) gives the unique lift through q_{λ₀} of a log morphism T→Spec(A□_{Σ,Λ}⊗A_cris/p^n) compatible with T₀→Spec(R/p). Thus the two log PD envelopes agree, D_{Σ,Λ,n}≅D_{jλ₀}/p^n; pass to the limit over n. Use CK §§5.30–5.31 for the finite PD approximants and the inherited Δ_{Σ,Λ}-action and log derivations: D_{jλ₀}→D^0_{Σ,Λ}→D_{Σ,Λ} are isomorphisms modulo p^n, which gives (5.30.1); the derivations of log-derivations extend uniquely to A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] because q_{λ₀} is log étale, then to divided power derivations of D_{jλ₀} (Stacks Project 07HW), compatibly with those of D_{Σ,Λ}. Functoriality under enlarging (Σ,Λ) is CK §5.32. The acceptance comparison with the ordinary envelope of the nonexact immersion is not in CK, which only notes that the uncompleted log PD envelope is unavailable (footnote 11). It follows by reducing modulo (X,Y): there the exactified algebra becomes a Laurent polynomial ring in U over the image of A□_{Σ,Λ}, and its divided power envelope is a divided power polynomial algebra in U−α over the envelope of that image. All completions in this node are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of D_{Σ,Λ} is not known (CK §5.22), so the derived completion could differ.

**Uses.**

- CK §§5.35–5.40: The log crystalline complex and its comparison map use this envelope.

**API.**

- `Semistable.allCoordinatesPD.universal` (universal-property): For each n, D_{Σ,Λ,n}=D_{Σ,Λ}/p^n is the log PD envelope of Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) over Spec(O_C/p)→Spec(A_cris/p^n): for a log PD thickening T₀→T over A_cris/p^n with integral quasi-coherent log structure, compatible log maps T₀→Spec(R/p) and T→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n) factor uniquely through a log PD map T→Spec(D_{Σ,Λ,n}).
- `Semistable.allCoordinatesPD.refine` (functoriality): Refinement and change of λ₀ commute with PD structure, Frobenius and log derivations.
- `Semistable.allCoordinatesPD.finite` (characterisation): D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧ over A_cris (CK (5.30.1)), where D^{(m)}_{Σ,Λ} is the p-adic completion of the subalgebra D^{0,(m)}_{Σ,Λ}⊂D_{Σ,Λ}; D^{(m)}_{Σ,Λ}→D_{Σ,Λ} is not asserted to be injective, and termwise completion alone is not substituted for a derived comparison.
- `Semistable.allCoordinatesPD.exact` (equivalence): q_{λ₀} induces D_{Σ,Λ,n}≅D_{jλ₀}/p^n for n>0 and D_{Σ,Λ}≅(D_{jλ₀})^∧, A_cris-linearly and compatibly with divided powers, Frobenius, the Δ_{Σ,Λ}-action, the maps to R/p^n and R, and change of λ₀ (CK Lemma 5.29).
- `Semistable.allCoordinatesPD.toR` (data): There is a map D_{Σ,Λ}→R lifting D_{Σ,Λ}→R/p, induced by the factorization Spec(R/p)→Spf R→Spf D_{Σ,Λ} (CK (5.22.3)) and agreeing with D_{jλ₀}→R of CK (5.28.2).
- `Semistable.allCoordinatesPD.derivations` (structure): The commuting derivations ∂/∂log(X_τ) act on D_{jλ₀} and D_{Σ,Λ} as divided power derivations (∂(x^{[n]})=x^{[n−1]}∂(x)) and on D^{(m)}_{Σ,Λ}, m≥p, as A_cris^(m)-derivations, compatibly with each other and with those of A□_{Σ,Λ} (CK §5.31).

**Definition tests.**

- `Semistable.allCoordinatesPD.single` (compatibility): For each λ∈Λ and m≥p there is a unique map of A_cris^(m)(R□_λ)-algebras A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} lifting the identity of R/p (CK (5.39.1)); it is Δ_{Σ,Λ}-equivariant through Δ_{Σ,Λ}→Δ_λ and commutes with ∂/∂log(X_{λ,i}). D_{Σ,Λ} is not identified with the lift A_cris(R)_λ used in local-crystalline.
- `Semistable.allCoordinatesPD.ratio` (computation): For two node charts differing by a unit a, under D_{jλ₀}→R the ratio units U_{λ,λ₀,y} map to a and a⁻¹ on the two branches, and the constructions for the two choices of λ₀ are canonically isomorphic (CK (5.28.1)).
- `Semistable.allCoordinatesPD.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, A□_{Σ,Λ}=A_inf and D_{Σ,Λ}=A_cris with its divided powers.
- `Semistable.allCoordinatesPD.torus_coordinate` (computation): For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, A□_{Σ,Λ}=A_inf{X_σ^{±1}} and D_{Σ,Λ} is the p-adically completed divided power polynomial algebra over A_cris in the variable X_σ−[u^♭]; in particular D_{Σ,Λ}≠A_cris, and ∂/∂log(X_σ) sends X_σ−[u^♭] to X_σ.

**Check.** For two node charts (x,y) and (ax,a⁻¹y) with a∈O_C^× and α=[a^♭], D_{Σ,Λ} contains the unit U with X′=U·X and the divided powers of U−α. When the node lies in Spf R, the ordinary PD envelope of the kernel of A□_{Σ,Λ}→R/p maps to D_{Σ,Λ} by (X′−αX)^{[n]}↦X^n·(U−α)^{[n]}, and this map is not surjective: modulo (X,Y) its image does not contain U−α.

**Source.** CK, §5.22, p.43; CK, §5.22, (5.22.2), p.43; CK, §5.22, p.44; CK, §5.28, p.47; CK, §5.28, p.48; CK, Lemma 5.29, (5.29.1), p.48; CK, Lemma 5.29, proof, p.48; CK, §5.30, p.49; CK, §5.30, (5.30.1), p.49; CK, §5.31, (5.31.3), p.49; CK, §5.31, (5.31.4), p.50; CK, §5.32, p.50.

### all-coordinates-aomega — All-coordinates AΩ comparison model

Target `AInfCohomology:AI.6/all-coordinates-aomega` (construction).

**Statement.** For an index (Σ,Λ) of all-coordinates and m≥p let A_cris^(m)(R_{Σ,Λ,∞})=A_inf(R_{Σ,Λ,∞})⊗̂_{A_inf}A_cris^(m), and form η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1), where τ runs over σ∈Σ and (λ,i) with λ∈Λ, 1≤i≤d. Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of these complexes; the colimits and the completion are termwise (CK (5.21.1)). The result carries an A_cris-semilinear Frobenius. For each (Σ,Λ) and m≥p the edge map of the cover R_{Σ,Λ,∞} identifies the m-th complex, Frobenius-equivariantly, with AΩ_R⊗̂^L_{A_inf}A_cris^(m), where AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf) is the value on Spf R of the presheaf AΩ^psh (CK Proposition 5.20). Hence in the shared derived enhancement the model is canonically and Frobenius-equivariantly identified with AΩ_R⊗̂^L_{A_inf}A_cris, compatibly with enlarging (Σ,Λ) and functorially in R for p-adically formally étale maps R→R′ (CK §5.21). The termwise completion agrees with the derived one because A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free. No multiplicative structure on the model or on this identification is asserted.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. Spf R and the indices (Σ,Λ) are as in all-coordinates (CK §5.17); m≥p throughout.

**Dependencies.** `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `EnhancedDerivedSheaves:E4/completed-colimits`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/aomega-frobenius`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `CrystallineCohomology:CR.0`; `AInfCohomology:AI.6/finite-level-acris`.

**Proof or construction.** Use the combined root covers from all-coordinates and AI.3 continuous Koszul cochains. By CK §5.19, A_inf(R_{Σ,Λ,∞})=W(R_{Σ,Λ,∞}^♭) (AI.0) and, by CK Lemma 3.13, (p^n,μ^{n′}) is a regular sequence on it with flat quotient over A_inf/(p^n,μ^{n′}); so A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free, and by CK (3.26.2)–(3.26.3) (finite-level-acris, API item intertwined) it is μ-torsion free with A_cris^(m)(R_{Σ,Λ,∞})/μ p-adically complete. Δ_{Σ,Λ} acts continuously and Frobenius-equivariantly. Prove CK Proposition 5.20. For one chart λ∈Λ, finite-pd-base-change (CK Proposition 5.6) gives AΩ_R⊗̂^L_{A_inf}A_cris^(m)≅Lη_μ(RΓ_proét((Spf R)_C^ad,A_inf)⊗̂^L_{A_inf}A_cris^(m)), with AΩ_R from aomega (CK (4.1.3)). Since R_{Σ,Λ,∞} contains R_{λ,∞} as a subcover, CK Remark 3.35 applies: by almost purity (AI.3) and CK Lemma 3.17 the ideal W(𝔪^♭) kills the cohomology of the cone of RΓ_cont(Δ_λ,A_cris^(m)(R_{λ,∞}))→RΓ_cont(Δ_{Σ,Λ},A_cris^(m)(R_{Σ,Λ,∞})), and CK Lemma 3.18 with Proposition 3.33 (finite-pd-base-change) shows that Lη_μ of this map is an isomorphism. CK Lemma 3.7 (BMS1 Lemma 7.3(ii); AI.1) replaces continuous cochains by Koszul complexes, which gives (5.20.1). Follow CK §5.21: the identifications are compatible with enlarging (Σ,Λ) and with p-adically formally étale R→R′ (using the index (Σ∪Σ′,Λ∪Λ′) for R′). Take the termwise colimit over m, the termwise p-adic completion (equal to the derived one by p-torsion-freeness) and the filtered colimit over (Σ,Λ) through E4/completed-colimits and E1, retaining actual coherent maps.

**Uses.**

- CK Proposition 5.39: This is the AΩ side of the functorial log crystalline map.

**API.**

- `Semistable.allCoordinatesAOmega.edge` (equivalence): For m≥p the edge map of the cover R_{Σ,Λ,∞} induces a Frobenius-equivariant identification of η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) with AΩ_R⊗̂^L_{A_inf}A_cris^(m) (CK (5.20.1)), and of the model with AΩ_R⊗̂^L_{A_inf}A_cris; it is compatible with p-adically formally étale maps R→R′.
- `Semistable.allCoordinatesAOmega.refine` (functoriality): Refinement maps commute with cochain differentials and the completed colimit structure.
- `Semistable.allCoordinatesAOmega.frobenius` (compatibility): The model’s Frobenius agrees with aomega-frobenius after PD base change.
- `Semistable.allCoordinatesAOmega.chart` (compatibility): For λ∈Λ and m≥p the map η_μK_{A_cris^(m)(R_{λ,∞})}((δ_{λ,i}−1)_{1≤i≤d})→η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) induced by the subcover R_{λ,∞} and the projection Δ_{Σ,Λ}→Δ_λ is a quasi-isomorphism (CK Lemma 3.7 and Remark 3.35).
- `Semistable.allCoordinatesAOmega.torsion_free` (structure): A_cris^(m)(R_{Σ,Λ,∞}) is p-torsion free and μ-torsion free, and its quotient by μ is p-adically complete (CK §5.19); so η_μ of the Koszul complex computes Lη_μ and the termwise p-adic completion is the derived one.

**Definition tests.**

- `Semistable.allCoordinatesAOmega.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, the group Δ_{Σ,Λ} is trivial, R_{Σ,Λ,∞}=O_C and the complex is A_cris in degree 0.
- `Semistable.allCoordinatesAOmega.single` (compatibility): For one node chart λ (d=1) and m≥p, the rank-one complex η_μK_{A_cris^(m)(R_{λ,∞})}(δ_{λ,1}−1) maps quasi-isomorphically to the (Σ,{λ})-term, which is the Koszul complex on the |Σ|+1 operators δ_σ−1, δ_{λ,1}−1; the two are not equal unless Σ=∅.
- `Semistable.allCoordinatesAOmega.refinement` (characterisation): The two chart embeddings into a common refinement induce the same equivalence with the intrinsic AΩ target.
- `Semistable.allCoordinatesAOmega.torus_point` (computation): For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, the group is Δ_{Σ,Λ}=Δ_σ≅Z_p and the m-th term is η_μ of the two-term complex δ_σ−1 on A_cris^(m)(R_{Σ,Λ,∞}); for m≥p it is quasi-isomorphic to A_cris^(m) in degree 0, although it is not concentrated in degree 0.

**Check.** The maps agree for two different chart families under their union.

**Source.** CK, §5.19, p.42; CK, Proposition 5.20, (5.20.1), p.42; CK, Proposition 5.20, proof, p.42; CK, Remark 3.35, p.24; CK, Proposition 5.20, proof, p.42; CK, §5.21, (5.21.1), p.42; CK, §5.21, p.43; CK, §4.1, (4.1.3), p.25.

### all-coordinates-log-crystalline — All-coordinates log crystalline model

Target `AInfCohomology:AI.6/all-coordinates-log-crystalline` (construction).

**Statement.** For an index (Σ,Λ) and m≥p form the Koszul complex K_{D_{Σ,Λ}^{(m)}}(D_τ) of the derivations D_τ=∂/∂log(X_τ) of all-coordinates-pd, where τ runs over σ∈Σ and (λ,i) with λ∈Λ, 1≤i≤d. Take the filtered all-coordinates colimit of the p-completed filtered colimit, m≥p, of these complexes; the colimits and the completion are termwise (CK (5.32.1)). Degree-j Frobenius is p^jφ. For each (Σ,Λ) the completed colimit over m is K_{D_{Σ,Λ}}(D_τ), the log PD de Rham complex Ω•_{D_{Σ,Λ}/A_cris,log,PD}, which is canonically and Frobenius-equivariantly identified in the derived category with RΓ_logcrys((Spf R)_{O_C/p}/A_cris) (CK Proposition 5.23, (5.31.5)). The identification is compatible with enlarging (Σ,Λ) and functorial in R for p-adically formally étale maps R→R′, and under it the map to RΓ_logdR(Spf R/O_C) is induced by D_{Σ,Λ}→R (CK (5.23.2)). After sheafification on 𝔛_ét the model represents Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. Spf R and (Σ,Λ) are as in all-coordinates; m≥p. The log crystalline site is that of 𝔛_{O_C/p} over A_cris with quasi-coherent integral log structures (CK §5.3).

**Dependencies.** `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/log-derivations`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `AInfCohomology:AI.6/all-coordinates`.

**Proof or construction.** Use the log derivations and the rings D^{(m)}_{Σ,Λ} of all-coordinates-pd. Prove CK Proposition 5.23 with CR.5’s log PD Poincaré lemma: A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n is a log smooth thickening of R/p over A_cris/p^n (CK §5.11), so its log PD envelope D_{Σ,Λ,n} is PD smooth over A_cris/p^n (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.4, Remarks (ii)); hence the log PD de Rham complex of D_{Σ,Λ,n} computes log crystalline cohomology over A_cris/p^n (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1)) and equals Ω•_{(A□_{Σ,Λ}⊗A_cris/p^n)/(A_cris/p^n),log}⊗D_{Σ,Λ,n} (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.7, Exercises, (i)); all three for quasi-coherent integral log structures, supplied by CR.5. The limit over n gives (5.23.1), and CK (5.10.3) (log-derivations) gives the Koszul form (5.23.3). The same argument for the log smooth thickenings R/p^n over O_C/p^n gives (5.23.2). By CK (5.30.1) and §5.31 rewrite (5.23.3) as (5.31.5). By CK §5.32 the formation is compatible with enlarging (Σ,Λ) and with p-adically formally étale R→R′ (through the universal properties (5.26.3), (5.27.3)); take the filtered colimit, using E1 for the coherent filtered colimit. All completions in this node are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of D_{Σ,Λ} is not known (CK §5.22), so the derived completion could differ.

**Uses.**

- CK Proposition 5.39 and Theorem 5.4: This is the target of the intrinsic log crystalline comparison.

**API.**

- `Semistable.allCoordinatesLogCrystalline.poincare` (equivalence): For each (Σ,Λ), K_{D_{Σ,Λ}}(D_τ)=Ω•_{D_{Σ,Λ}/A_cris,log,PD} is identified with RΓ_logcrys((Spf R)_{O_C/p}/A_cris) by the log PD de Rham comparison for the PD smooth envelope (CK (5.23.1), (5.23.3)); after sheafification the model identifies with the imported log crystalline pushforward Ru_*O.
- `Semistable.allCoordinatesLogCrystalline.refine` (functoriality): Envelope refinement gives coherent maps of these complexes and composes with chart restriction.
- `Semistable.allCoordinatesLogCrystalline.frobenius` (simp): On degree j forms the map is p^jφ, agreeing with log crystalline Frobenius.
- `Semistable.allCoordinatesLogCrystalline.de_rham` (compatibility): Under the identification, the map RΓ_logcrys((Spf R)_{O_C/p}/A_cris)→RΓ_logdR(Spf R/O_C) is the map Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} induced by D_{Σ,Λ}→R (CK (5.23.2)).

**Definition tests.**

- `Semistable.allCoordinatesLogCrystalline.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, the term is A_cris in degree 0.
- `Semistable.allCoordinatesLogCrystalline.node` (computation): For one node chart the degree-one forms have the relation dlogX₀+dlogX₁=0.
- `Semistable.allCoordinatesLogCrystalline.smooth` (compatibility): If R is smooth and every λ∈Λ has r_λ=0, then the exactification is trivial (Q→P_{λ₀} is an isomorphism), A□_{Σ,Λ} is a (p,μ)-completed torus over A_inf, D_{Σ,Λ} is the p-completed divided power envelope of R/p in it over A_cris, and K_{D_{Σ,Λ}}(D_τ) is its PD de Rham complex in the coordinates X_τ∂/∂X_τ. For Σ as in BMS1 §12.2 the projection to the torus on Σ maps the corresponding complex for Σ alone into it. This is a comparison map, not an identification with the smooth all-coordinates complex, and it is not a statement of CK.
- `Semistable.allCoordinatesLogCrystalline.torus_point` (computation): For R=O_C, Σ={σ} with t_σ↦u∈O_C^× and Λ={λ} with d=0, the complex K_{D_{Σ,Λ}}(∂/∂log X_σ) is the two-term complex D_{Σ,Λ}→D_{Σ,Λ} with D_{Σ,Λ} the completed divided power polynomial algebra over A_cris in X_σ−[u^♭]; it is quasi-isomorphic to A_cris in degree 0 but not concentrated in degree 0.

**Check.** Frobenius on one log direction multiplies its differential by p.

**Source.** CK, Proposition 5.23, (5.23.1), p.44; CK, Proposition 5.23, (5.23.1), p.44; CK, Proposition 5.23, proof, p.44; CK, Proposition 5.23, proof, p.44; CK, Proposition 5.23, (5.23.2), proof, p.44; CK, §5.31, (5.31.5), p.50; CK, §5.31, (5.31.5), p.50; CK, §5.32, (5.32.1), p.50; CK, §5.32, p.50.

### all-coordinates-map — All-coordinates comparison morphism

Target `AInfCohomology:AI.6/all-coordinates-map` (construction).

**Statement.** Use the canonical map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK §5.38, including its logarithmic ratio variables: it is the p-adic completion of the divided power morphism D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}) of CK Lemma 5.37, which sends the exactification units to Teichmüller units of A_inf(R_{Σ,Λ,∞}); it does not depend on λ₀, is Δ_{Σ,Λ}- and Frobenius-equivariant, is compatible with D_{Σ,Λ}→R and θ, and restricts to maps D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞}) for m≥p (CK (5.38.1)–(5.38.3)). For m≥p² the maps (id, ∑_{n≥1}(log([ε]))^n/n!·D_τ^{n−1}), D_τ=∂/∂log(X_τ), define a Frobenius-equivariant morphism K_{D^{(m)}_{Σ,Λ}}(D_τ)→η_μK_{D^{(m)}_{Σ,Λ}}(δ_τ−1), where the target is the subcomplex given by formula (1.7.3) of CK (CK Proposition 5.34). Composing with η_μ of the maps of Koszul complexes induced by (5.38.3), and passing to the termwise colimit over m, the termwise p-adic completion and the filtered colimit over (Σ,Λ), gives the comparison map from the all-coordinates log crystalline model to the all-coordinates AΩ model (CK (5.38.4)). It is a map of complexes that commutes with φ, with refinements and with p-adically formally étale maps R→R′. It is not a map of differential graded algebras, and no multiplicativity is asserted.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. Spf R and (Σ,Λ) are as in all-coordinates. The ring maps (5.38.3) exist for m≥p; the exponential maps of CK Proposition 5.34 require m≥p²; the colimits over m≥p are computed over the cofinal range m≥p².

**Dependencies.** `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates-aomega`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `AInfCohomology:AI.6/local-crystalline`; `CrystallineCohomology:CR.0`; `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/log-exactification`; `PerfectoidSpaces:P3`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.6/finite-level-acris`.

**Proof or construction.** CK §5.35 and Proposition 5.36 (finite-level-acris, API item injective; A_cris⁰(R′_∞) from CR.0): for an affinoid perfectoid R′_∞ over O_C, A_cris^0(R′_∞)≅A_inf(R′_∞)[T^n/n!]_{n≥1}/(T−ξ) is the divided power envelope of (A_inf(R′_∞),Ker θ+p) over (Z_p,pZ_p) (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, proof of A2.8); A_cris^{0,(m)}(R′_∞)≅A_inf(R′_∞)⊗_{A_inf}A_cris^{0,(m)} with completion A_cris^(m)(R′_∞) ((5.35.1)–(5.35.2)); and the maps A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR^+(R′_∞) are injective (using Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.9 (2), for the filtration by divided powers of ξ). CK Lemma 5.37: make A_inf(R_{Σ,Λ,∞}) an algebra over A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}] (log-exactification), Δ_{Σ,Λ}- and Frobenius-equivariantly and compatibly with change of λ₀. Smooth case: X_{λ,i} is a unit when t_{λ,i}∈R^×, because A_inf(R_{Σ,Λ,∞}) is ξ-adically complete, so (5.26.3) has a unique solution. Nonsmooth case: t_{λ,i_λ(y)}^{1/p^m}/t_{λ₀,i_{λ₀}(y)}^{1/p^m} is a unit of R_{Σ,Λ,∞} for every m, because R_{Σ,Λ,∞} is integrally closed in R_{Σ,Λ,∞}[1/p] (perfectoid input, PerfectoidSpaces:P3); the compatible system defines u^♭_{λ,λ₀,y}, and [u^♭_{λ,λ₀,y}] solves (5.27.3) because the X_{λ,i} are nonzerodivisors in A_inf(R_{Σ,Λ,∞}). The universal property of the PD envelope D_{jλ₀} (CR.0, all-coordinates-pd) then gives (5.37.1). CK §5.38: complete p-adically to get (5.38.1), using CK Lemma 5.29; by the first step its restriction to D^{0,(m)}_{Σ,Λ} lands in A_cris^{0,(m)}(R_{Σ,Λ,∞})⊂A_cris(R_{Σ,Λ,∞}), and completion gives (5.38.3). Apply local-crystalline’s exponential operator in the form of CK Lemma 5.33 and Proposition 5.34: for m≥p², δ_τ acts on D^{(m)}_{Σ,Λ} as ∑_{n≥0}(log([ε]))^n/n!·D_τ^n (from CK Lemma 5.15, the universal properties (5.26.3), (5.27.3) and that of D_{jλ₀}); since (log([ε]))^n/(μ·n!) lies in A_cris^(m), the degree-one components land in μ·D^{(m)}_{Σ,Λ}, which gives the morphism to the subcomplex (1.7.3). D^{(m)}_{Σ,Λ} is not known to be μ-torsion free, so this subcomplex is not asserted to compute Lη_μ. Frobenius-equivariance is as in CK Proposition 5.16. Compose and pass to the colimits; passage to all-coordinates colimits preserves the specified maps (CK §5.38, last two paragraphs). That (5.38.4) is not a map of differential graded algebras is CK’s remark in the proof of Proposition 5.41: it would be one only if the terms with n≥1 of the degree-one component log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·D_τ^n could be disregarded. All completions in this node are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of D_{Σ,Λ} is not known (CK §5.22), so the derived completion could differ.

**Uses.**

- CK Proposition 5.39 and Proposition 5.41: Its equivalence and its reduction square give canonical global comparisons.

**API.**

- `Semistable.allCoordinatesComparisonMap.coefficients` (data): The degree-zero map is the ring map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of CK (5.38.1), the p-adic completion of the divided power morphism D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}); it is independent of λ₀, Δ_{Σ,Λ}- and Frobenius-equivariant, compatible with D_{Σ,Λ}→R and θ, and restricts to D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞}) for m≥p.
- `Semistable.allCoordinatesComparisonMap.frobenius` (compatibility): The comparison intertwines p^jφ on j-forms with the AΩ Frobenius.
- `Semistable.allCoordinatesComparisonMap.natural` (functoriality): The map commutes with all-coordinates refinement and with p-adically formally étale maps R→R′.
- `Semistable.allCoordinatesComparisonMap.units` (simp): Under D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞}) each X_τ maps to the Teichmüller lift [t_τ^♭] of the system of p-power roots of t_τ and, in the nonsmooth case, U_{λ,λ₀,y} maps to [u^♭_{λ,λ₀,y}], where u^♭_{λ,λ₀,y} is the system of units t_{λ,i_λ(y)}^{1/p^m}/t_{λ₀,i_{λ₀}(y)}^{1/p^m} of R_{Σ,Λ,∞} (CK Lemma 5.37).
- `Semistable.allCoordinatesComparisonMap.exponential` (relation): For m≥p², δ_τ=∑_{n≥0}(log([ε]))^n/n!·D_τ^n as endomorphisms of D^{(m)}_{Σ,Λ} (CK Lemma 5.33).

**Definition tests.**

- `Semistable.allCoordinatesComparisonMap.point` (degenerate): For R=O_C and the index Σ=∅, Λ={λ} with d=0, both models are A_cris in degree 0 and the map is the identity of A_cris.
- `Semistable.allCoordinatesComparisonMap.node` (computation): For λ∈Λ and m≥p² the square (5.39.2) commutes: the comparison map precomposed with the map of Koszul complexes induced by A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} equals the unit-operator exponential comparison (5.16.2) of local-crystalline followed by the map induced by the subcover R_{λ,∞}⊂R_{Σ,Λ,∞}.
- `Semistable.allCoordinatesComparisonMap.de_rham` (compatibility): The square formed by D_{Σ,Λ}→R (CK (5.22.3)), the degree-zero map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}), θ: A_cris(R_{Σ,Λ,∞})→R_{Σ,Λ,∞} and R→R_{Σ,Λ,∞} commutes (CK (5.38.2)). The agreement of the whole map with the log de Rham specialization, including its differential, is the content of crystalline-de-rham-square and is not part of this construction.
- `Semistable.allCoordinatesComparisonMap.torus_generator` (computation): For σ∈Σ the degree-zero map sends X_σ to [t_σ^♭]∈A_inf(R_{Σ,Λ,∞}), on which δ_σ acts by multiplication by [ε]; correspondingly ∑_{n≥0}(log([ε]))^n/n!·D_σ^n(X_σ)=[ε]·X_σ in D^{(m)}_{Σ,Λ} for m≥p².

**Check.** In degree 0 the map is the ring map D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞}) of (5.38.1), and the square formed with D_{Σ,Λ}→R, R→R_{Σ,Λ,∞} and θ: A_cris(R_{Σ,Λ,∞})→R_{Σ,Λ,∞} commutes (CK (5.38.2)); an arbitrary quasi-isomorphism is insufficient. In degree 1 the component for τ is log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·D_τ^n followed by the ring map; the terms with n≥1 are what prevents the map from being a map of differential graded algebras.

**Source.** CK, Lemma 5.33, p.51; CK, Proposition 5.34, (5.34.1), p.51; CK, §1.7, (1.7.3), p.7; CK, §5.35, (5.35.2), p.52; CK, Proposition 5.36, (5.36.1), p.52; CK, Lemma 5.37, (5.37.1), p.53; CK, Lemma 5.37, proof, p.54; CK, Lemma 5.37, proof, p.54; CK, §5.38, (5.38.1), p.54; CK, §5.38, (5.38.3), p.54; CK, §5.38, (5.38.4), p.55; CK, §5.38, p.55; CK, Proposition 5.41, proof, p.58; CK, Proposition 5.41, proof, p.58.

### absolute-crystalline — Absolute log crystalline comparison

Target `AInfCohomology:AI.6/absolute-crystalline` (theorem).

**Statement.** The all-coordinates comparison morphism is a quasi-isomorphism: for every index (Σ,Λ) the map (5.38.4) of all-coordinates-map is a quasi-isomorphism (CK Proposition 5.39). It sheafifies to a Frobenius-equivariant isomorphism Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}≃AΩ_𝔛⊗̂^L_{A_inf}A_cris in the derived category of sheaves of A_cris-modules on 𝔛_ét (CK Theorem 5.4, (5.40.1)), where u is the projection from the log crystalline topos of 𝔛_{O_C/p} over A_cris. The tensor is derived p-completed: AΩ_𝔛⊗̂^L_{A_inf}A_cris=Rlim_n(AΩ_𝔛⊗^L_{A_inf}A_cris/p^n). By construction the isomorphism is compatible with étale localisation on 𝔛. Multiplicativity, and functoriality for morphisms of semistable formal schemes that are not étale, are not asserted.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5; neither properness nor quasi-compactness is needed for the sheaf statement. In the proof the ring maps use m≥p and the single-chart comparison of local-crystalline uses m≥p².

**Dependencies.** `AInfCohomology:AI.6/all-coordinates-map`; `AInfCohomology:AI.6/local-crystalline`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `CrystallineCohomology:CR.5`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`; `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/all-coordinates-aomega`; `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates`; `EnhancedDerivedSheaves:E4`; `AInfCohomology:AI.6/aomega-sheaf-completeness`.

**Proof or construction.** Prove CK Proposition 5.39 by reduction to local-crystalline. Fix λ∈Λ. For m≥p the ideal of D^{(m)}_{Σ,Λ} cutting out R/p is finitely generated and has divided powers, hence is p-adically topologically nilpotent; so the formal étaleness of A_cris^(m)(R□_λ)→A_cris^(m)(R)_λ (CK §3.14) gives a unique map A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ} lifting the identity of R/p (CK (5.39.1)), compatible with Δ_{Σ,Λ}→Δ_λ, with the derivations ∂/∂log(X_{λ,i}) and with the maps to A_cris^(m)(R_{Σ,Λ,∞}). In the resulting commutative square (5.39.2) the top map is the quasi-isomorphism (5.16.2) of local-crystalline for m≥p² (CK Proposition 5.16); the right map is a quasi-isomorphism by CK Lemma 3.7 and Remark 3.35 (all-coordinates-aomega); and the left map becomes a quasi-isomorphism after the colimit over m and termwise p-adic completion, because both sides then compute RΓ_logcrys((Spf R)_{O_C/p}/A_cris) (CK Proposition 5.13 and (5.31.5); all-coordinates-log-crystalline, CR.5). Hence the bottom map (5.38.4) is a quasi-isomorphism. Take the filtered colimit over (Σ,Λ): the comparison map between the two models is a quasi-isomorphism, functorially in R for p-adically formally étale maps (CK §5.38). Sheafify by CK §5.40 in E1; the explicit map remains the map of all-coordinates-map. The two models are complexes of presheaves on the basis of 𝔛_ét formed by the Spf R of all-coordinates, with values AΩ_R⊗̂^L_{A_inf}A_cris and RΓ_logcrys((Spf R)_{O_C/p}/A_cris). The sheafification of the second represents Ru_*O (CR.5). For the first CK refers to §5.21; in detail, by CK Corollary 4.6 (aomega-sheaf-completeness) AΩ_R=RΓ(Spf R,AΩ_𝔛), and by the argument at the start of the proof of CK Corollary 5.43 (affine opens are quasi-compact and quasi-separated) RΓ(Spf R,AΩ_𝔛)⊗̂^L_{A_inf}A_cris=RΓ(Spf R,AΩ_𝔛⊗̂^L_{A_inf}A_cris), so the sheafification is AΩ_𝔛⊗̂^L_{A_inf}A_cris (E4/completed-sheaf-tensor).

**Check.** For a node chart the degree-one term of the log crystalline model is free on dlog X₁, with dlog X₀+dlog X₁=0, and on the single-chart complex the comparison is μ·U₁ in degree one, with U₁ the unit operator of local-crystalline. For 𝔛=Spf O_C the isomorphism is the identity of A_cris. For smooth 𝔛 the agreement of this isomorphism with that of BMS1 Theorem 12.1 along the comparison of presentations of all-coordinates is not proved in CK and is not asserted here.

**Source.** CK, Theorem 5.4, (5.4.1), p.33; CK, Theorem 5.4, p.33; CK, Proposition 5.39, p.55; CK, Proposition 5.39, proof, p.55; CK, Proposition 5.39, proof, p.56; CK, Proposition 5.39, proof, p.56; CK, §5.38, p.55; CK, §5.40, p.56; CK, §5.40, (5.40.1), p.56; CK, Corollary 4.6, (4.6.1), p.26.

### crystalline-de-rham-square — Log crystalline and de Rham agreement

Target `AInfCohomology:AI.6/crystalline-de-rham-square` (theorem).

**Statement.** The triangle formed by the isomorphism Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→AΩ_𝔛⊗̂^L_{A_inf}A_cris of absolute-crystalline, the de Rham specialization AΩ_𝔛⊗̂^L_{A_inf}A_cris→Ω•_{𝔛/O_C,log} of log-de-rham (CK (4.17.1)) and the map Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→Ω•_{𝔛/O_C,log} induced by CR.5’s log crystalline-to-log de Rham comparison Ru_*O⊗̂^L_{A_cris,θ}O_C≅Ω•_{𝔛/O_C,log} commutes in the derived category of sheaves on 𝔛_ét (CK Proposition 5.41). Equivalently, after A_cris→O_C, absolute-crystalline agrees with log-de-rham and CR.5’s comparison. This is an equality of maps of complexes, rather than only an equality of cohomology ranks. On the presheaf complexes of all-coordinates both composites are the unique map of differential graded algebras Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} that is D_{Σ,Λ}→R in degree 0; the comparison isomorphism of absolute-crystalline itself is not asserted to be multiplicative.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5. The statement concerns maps in the derived category of sheaves on 𝔛_ét and is proved on the functorial presheaf complexes attached to the Spf R and indices (Σ,Λ) of all-coordinates.

**Dependencies.** `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.6/all-coordinates-map`; `AInfCohomology:AI.6/log-de-rham`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/aomega-frobenius`; `AInfCohomology:AI.6/all-coordinates-aomega`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`.

**Proof or construction.** Work on the functorial presheaf complexes over the Spf R of all-coordinates: CK writes that the claim is local, and since commutativity in a derived category of sheaves is not a local property in general, the argument is run on chain maps that are functorial in R. By CK Proposition 5.23 (all-coordinates-log-crystalline, API de_rham) the map from CR.5 (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1) and (1.11.1); CK Remark 5.24) is the map of differential graded algebras Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log} induced by D_{Σ,Λ}→R. Uniqueness (CK (5.41.2)): the dlog X_σ and dlog X_{λ,i} generate Ω•_{D_{Σ,Λ}/A_cris,log,PD} as a differential graded algebra over D_{Σ,Λ}, the terms of Ω•_{Spf(R)/O_C,log} are p-torsion free, and the t_σ and t_{λ,i} are units in R[1/p]; so there is at most one map of differential graded algebras lying over D_{Σ,Λ}→R. Describe the de Rham specialization of log-de-rham on the complexes η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1) of all-coordinates-aomega, as in the proof of CK Theorem 4.17: apply Frobenius (aomega-frobenius), reduce modulo φ(ξ) to H•(η_μK/φ(ξ)) with its Bockstein differential (BMS1 Proposition 6.12; AI.1/bockstein-reduction), and map by θ∘φ^{-1} to H•(η_{ζ_p−1}K_{R_{Σ,Λ,∞}}(δ_τ−1))≅Ω•_{Spf(R)/O_C,log} (hodge-tate-comparison: CK Theorem 4.11, Remark 4.5, (4.2.2), with Remarks 3.10 and 3.21 for the cover R_{Σ,Λ,∞}). The Bockstein differentials agree because the cohomology is p-torsion free and the comparison can be made after inverting p. By BMS1 Lemma 6.13 and the differential graded algebra structure of BMS1 Lemma 7.5 on Koszul complexes (AI.1), the resulting map (5.41.4) is a map of differential graded algebras that is θ in degree 0. Reduce the exponential operators of all-coordinates-map along θ: the degree-one component of the comparison map is log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·(∂/∂log X_τ)^n, and in the composite with (5.41.4) the terms with n≥1 can be ignored because log([ε]) is a unit multiple of μ and θ(μ^n/(n+1)!)=0 for n≥1. So the composite is a map of differential graded algebras, equal to D_{Σ,Λ}→R in degree 0 by CK (5.38.2), hence the unique one of the second step.

**Check.** On a node chart the composite carries dlog X₁ to dlog t₁, with the relation dlog t₀+dlog t₁=0 and the log de Rham differential.

**Source.** CK, Proposition 5.41, (5.41.1), p.56; CK, Proposition 5.41, p.56; CK, Remark 5.24, (5.24.1), p.44; CK, Proposition 5.41, proof, (5.41.2), p.56; CK, Proposition 5.41, proof, p.57; CK, Proposition 5.41, proof, p.57; CK, Proposition 5.41, proof, (5.41.4), p.58; CK, Proposition 5.41, proof, p.58; CK, Proposition 5.41, proof, p.58.

### global-crystalline — Global crystalline and Witt specializations

Target `AInfCohomology:AI.6/global-crystalline` (theorem).

**Statement.** For qcqs 𝔛 there are Frobenius-equivariant identifications RΓ_Ainf(𝔛)⊗̂^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) and RΓ_Ainf(𝔛)⊗̂^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)), where W(k̄) carries the pullback of the log structure of A_cris, associated to Q≥0→W(k̄), 0≠q↦0, 0↦1. If 𝔛 is proper over O_C the same identifications hold with the ordinary derived tensors, and H^i_logcrys(𝔛_{O_C/p}/A_cris)[1/p] is finite free over A_cris[1/p] for every i (CK Corollary 5.43). The W(k̄) log base first uses Q≥0→W(k̄); the arithmetic normalization is the next node.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. qcqs for the completed form; properness over O_C for dropping completion and the p-inverted freeness assertion.

**Dependencies.** `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.6/proper-perfectness`; `CrystallineCohomology:CR.5`; `CrystallineCohomology:CR.6`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`; `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/divisorial-log`; `EnhancedDerivedSheaves:E4`.

**Proof or construction.** Globalize absolute-crystalline using E1/E4: for qcqs 𝔛 and an A_inf/p^n-module M one has RΓ(𝔛_ét,AΩ_𝔛⊗^L_{A_inf}M)≅RΓ(𝔛_ét,AΩ_𝔛)⊗^L_{A_inf}M, because M is a filtered colimit of perfect A_inf-modules (BMS1 Lemma 4.9(i)) and cohomology of a qcqs site commutes with filtered colimits (Stacks Project 0739). With M=A_cris/p^n and the limit over n this gives the first identification (aomega for RΓ_Ainf). Descend 𝔛_{O_C/p}: using the étale charts and CK Claims 1.6.1 and 1.6.3 (divisorial-log), a limit argument gives the ring of integers O of a finite extension of W(k̄)[1/p] in C and a quasi-compact quasi-separated, fine, log smooth log scheme 𝒳 over O/p of Cartier type (Kato, Logarithmic structures of Fontaine–Illusie, 4.8) with 𝒳⊗_{O/p}O_C/p≅𝔛_{O_C/p}. CK gives no details of the limit argument. The base change theorem (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.11.1), in the quasi-separated form of CK footnote 17; CR.5 log crystalline base change) gives RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗̂^L_{A_cris}W(k̄)≅RΓ_logcrys(𝔛_{k̄}/W(k̄)), hence the second identification. Use proper-perfectness (CK Corollary 4.20) to remove the extra completion in the proper case. For the p-inverted freeness, 𝒳 can then be taken proper over O/p, and Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.18, Theorem (supplied by CR.6) shows that the cohomology groups of RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}A_cris[1/p] are finite free over A_cris[1/p].

**Check.** The proper and qcqs formulas must not be interchanged; finite freeness is after p-inversion here. For 𝔛=Spf O_C both sides of the first identification are A_cris and both sides of the second are W(k̄).

**Source.** CK, §5.42, p.58; CK, Corollary 5.43, (5.43.1), p.58; CK, Corollary 5.43, (5.43.2), p.58; CK, Corollary 5.43, p.58; CK, Corollary 5.43, proof, p.58; CK, Corollary 5.43, proof, (5.43.3), p.59; CK, Corollary 5.43, proof, footnote 17, p.59; CK, Corollary 5.43, proof, p.59; CK, Corollary 4.20, p.31.

### hyodo-kato-interface — Arithmetic Hyodo–Kato interface

Target `AInfCohomology:AI.6/hyodo-kato-interface` (theorem).

**Statement.** Let 𝔛₀ be a proper arithmetic semistable model over O_K, with perfect residue field k₀, and 𝔛=𝔛₀⊗̂_{O_K}O_C. There are Frobenius-equivariant identifications: (i) RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)) for the log base Q≥0→W(k̄) (CK (5.43.2)); (ii) RΓ_logcrys(𝔛_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k̄}/W(k̄)) for the log base ℕ→W(k̄), 1↦0 (CK Remark 5.44, (5.44.1)), the change of log structure being ℕ→Q≥0, 1↦v(π_K) for a uniformizer π_K of K; (iii) RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄), where the arithmetic log base is ℕ→W(k₀), 1↦0. Identification (iii) is not stated in CK, which has only its consequence (8.8.1) for the Galois invariants of one cohomology group under the freeness hypotheses of Theorem 8.7; it is base change of log crystalline cohomology of a fine, log smooth log scheme of Cartier type along the map of log divided power bases W(k₀)→W(k̄). So the W(k̄) specialization identifies with RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄). If 𝔛₀ is only quasi-compact and quasi-separated, (i)–(iii) hold with p-completed tensor products throughout. (iv) (CK Proposition 9.2, (9.2.2)) For proper 𝔛₀: RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}B_st⁺≃RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_st⁺, compatibly with φ, which acts on both factors on each side, and with N, which is N⊗1+1⊗N on the left and the monodromy of B_st⁺ on the right, with Nφ=pφN; the identification is G_K-equivariant (CK §9.4). The rational comparison with étale cohomology over B_st (CK Theorem 9.5) is not part of this statement.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. K⊂C is a complete discretely valued subfield with perfect residue field k₀, and C is the completion of an algebraic closure of K (CK §9.4). 𝔛₀ is a proper p-adic formal O_K-scheme with an étale cover by affines étale over Spf(O_K{t₀,…,t_d}/(t₀⋯t_r−π)) for nonunits π∈O_K∖{0} (CK Theorem 9.5), with the log structure O_{𝔛₀,ét}∩(O_{𝔛₀,ét}[1/p])^×. Properness is used for the uncompleted tensor products. The base extension W(k₀)→W(k̄) is explicit; N is supplied on the descended Hyodo–Kato object RΓ_logcrys((𝔛₀)_{k₀}/W(k₀)) and on B_st⁺, not asserted on AΩ itself.

**Dependencies.** `AInfCohomology:AI.6/global-crystalline`; `CrystallineCohomology:CR.5`; `CrystallineCohomology:CR.6`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.6/divisorial-log`; `PadicHodgeTheory:R06.1/semistable-period-ring`.

**Proof or construction.** By global-crystalline (CK (5.43.2)), RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)) with the log base Q≥0→W(k̄). Apply CK Remark 5.44 to compare the rational-monoid and standard log-point cohomology. Let K̆ be the completion of the maximal unramified extension of K in C; it is a finite extension of W(k̄)[1/p]. By CK Claims 1.6.1 and 1.6.3 (divisorial-log) and Kato, Logarithmic structures of Fontaine–Illusie, 4.8, the reduction of 𝔛₀ over O_K/p, hence over O_{K̆}/p, is fine, log smooth and of Cartier type, and it descends 𝔛_{O_C/p}. The base change theorem (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.11.1); CR.5/CR.6) gives (5.44.1). Base change along W(k₀)→W(k̄): RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄), p-completed in general. This step is not written out in CK, which uses it in Remark 8.8 to pass to Galois invariants; it is base change of log crystalline cohomology for the map of log divided power bases W(k₀)→W(k̄) (CR.6), identification (iii) of the statement. For proper 𝔛₀ the complex RΓ_logcrys((𝔛₀)_{k₀}/W(k₀)) is perfect (proper finiteness from CR.5), so no completion is needed; the last acceptance item shows that it is needed otherwise. CK Proposition 9.2: the ring A_st, initial among A_cris-algebras trivialising the Fontaine–Hyodo–Kato torsor, is A_cris[T] for a choice of trivialisation, with N=−d/dT and φ(T)=pT, and B_st⁺=A_st[1/p] (CK §9.1); by Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.17, it agrees with Fontaine’s ring (PadicHodgeTheory:R06.1/semistable-period-ring, where B_st⁺=B_cris⁺[u], N=−d/du and φ(u)=pu). The descent Y=(𝔛₀)_{O_K/p} of 𝔛_{O_C/p} is fine, log smooth and of Cartier type (second step), and (9.2.2) is Beilinson, (1.16.2) and (1.18.5) (CR.6); N acts as N⊗1+1⊗N on the left and through B_st⁺ on the right, and G_K-equivariance holds because G_K acts on both sides by functoriality (CK §9.4).

**Check.** For k₀ finite, retain its nontrivial Witt Frobenius; a coefficient identity on W(k̄) alone is insufficient. For φ=diag(1,p) and N=[[0,1],[0,0]] on Q² one has Nφ=pφN, N≠0 and N²=0, while for the transposed N the relation fails; this fixes the orientation of the monodromy relation. For 𝔛₀=Spf O_K{T^{±1}}, which is not proper, and k₀ not algebraically closed: RΓ_logcrys((𝔛₀)_{k₀}/W(k₀)) is computed by W(k₀){T^{±1}}→W(k₀){T^{±1}}·dlog T, and its uncompleted base change to W(k̄) does not surject on H¹ onto the cohomology of W(k̄){T^{±1}}→W(k̄){T^{±1}}·dlog T: the class of ∑_j p^{⌊j/2⌋}[x_j]T^{p^j}dlog T, with x_j∈k̄ linearly independent over k₀, is not in the image. So the completed tensor product is needed without properness.

**Source.** CK, Corollary 5.43, (5.43.2), p.58; CK, Remark 5.44, p.59; CK, Remark 5.44, p.59; CK, Remark 5.44, (5.44.1), p.59; CK, Remark 8.8, (8.8.1), p.74; CK, §9.1, p.75; CK, Proposition 9.2, (9.2.2), p.76; CK, Proposition 9.2, proof, p.76; CK, §9.4, p.76; CK, Theorem 9.5, p.76; CK, Theorem 9.5, (9.5.1), p.76; CK, Theorem 9.5, proof, p.76; CK, Remark 9.6, p.77.

### bdr-cohomology-etale-embeddings — B_dR⁺-cohomology in the étale topology and with non-unit coordinates

Target `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings` (theorem).

**Statement.** Let X be a smooth adic space over C. (1) Étale topology (CK §6.2). The analytic, respectively étale, topology of X has a basis of affinoids Spa(A,A°) that admit a map to a torus Spa(C⟨T_1^{±1},…,T_d^{±1}⟩,O_C⟨T_1^{±1},…,T_d^{±1}⟩) which is a composite of a rational embedding, a finite étale map and a rational embedding, and a finite set Ψ⊂(A°)^× with C⟨(X_u^{±1})_{u∈Ψ}⟩→A, X_u↦u, surjective. For such data put B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩=lim_n (B_dR⁺/ξⁿ)⟨(X_u^{±1})_{u∈Ψ}⟩, let s be its surjection onto A, D_Ψ(A)=lim_n B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩/(Ker s)ⁿ, let Ω^•_{D_Ψ(A)/B_dR⁺} be the Koszul complex of the commuting derivations ∂/∂log X_u=X_u·∂/∂X_u of D_Ψ(A), and Ω^•_{A/B_dR⁺}=colim_Ψ Ω^•_{D_Ψ(A)/B_dR⁺}. Let RΓ_crys(X/B_dR⁺), respectively RΓ_crys(X_ét/B_dR⁺), be the hypercohomology of the associated complex of sheaves for the analytic, respectively étale, topology; the first agrees with the complex of BMS1 §13 supplied by AI.6 canonical deformation. Then both are derived ξ-adically complete (6.2.5); their reductions modulo ξ are canonically and compatibly identified with RΓ(X,Ω^{•,cont}_{X/C})=RΓ_dR(X/C) and RΓ(X_ét,Ω^{•,cont}_{X/C}) (6.2.6); and pullback is an isomorphism RΓ_crys(X/B_dR⁺)≃RΓ_crys(X_ét/B_dR⁺) (6.2.7). (2) Non-unit coordinates (CK §§6.3–6.4). The étale topology of X has a basis of affinoids Spa(A,A°) with the following data: an étale map (6.3.1) to Spa(C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q), O_C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q)) for some d≥r≥0 and q∈Q_{>0}; a finite extension K of W(k̄)[1/p] in C with ring of integers O∋p^q and a finite type O[T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r−p^q)-algebra A_0, étale after inverting p, O-flat, normal, with no connected component of Spec A_0 on which p is a unit, such that (6.3.1) is the base change to C of an étale map (6.3.2) from Spa(Â_0[1/p],Â_0) and A_0⊗̂_O O_C≃A° (6.3.3); and finite sets Ψ_0⊂(Â_0)^×, Ξ_0⊂Â_0∩(Â_0[1/p])^× with K⟨(x_u^{±1})_{u∈Ψ_0},(x_a)_{a∈Ξ_0}⟩→Â_0[1/p] surjective (6.3.4). For finite Ψ⊂(A°)^× and Ξ⊂A°∩A^× with C⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩→A surjective (6.3.5), let D_{Ψ,Ξ,n}(A)=B_dR⁺⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩/(Ker s)ⁿ, D_{Ψ,Ξ}(A)=lim_n D_{Ψ,Ξ,n}(A), and let Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} be the Koszul complex of the derivations ∂/∂log X_a, a∈Ψ∪Ξ. Let B_dR⁺⊗̂_K A_0[1/p]=lim_n(((B_dR⁺/ξⁿ)_0⊗̂_O A_0)[1/p]), where (B_dR⁺/ξⁿ)_0 is the A_inf/ξⁿ-subalgebra of B_dR⁺/ξⁿ generated by the image of O; it has no ξ-torsion, is ξ-adically complete and reduces to A modulo ξ (6.3.6). (a) Lemma 6.3.8: suppose that Ψ, respectively Ξ, contains the images of the T_i for r+1≤i≤d, respectively 1≤i≤r, under a coordinate map (6.3.1), and that Ψ and Ξ are large enough in the sense of CK §6.4, namely: for some choice of (Ψ_0,Ξ_0) as in (6.3.4) such that Ψ_0, respectively Ξ_0, contains the images of the T_i for r+1≤i≤d, respectively 1≤i≤r, under (6.3.2), Ψ contains the image of Ψ_0 in A° and Ξ contains the image of Ξ_0. Then D_{Ψ,Ξ}(A)≃(B_dR⁺⊗̂_K A_0[1/p])[[(X_a−ã)_{a∈(Ψ∪Ξ)∖{T_1,…,T_d}}]] (6.3.9), where ã is a fixed lift of a in lim_n((B_dR⁺/ξⁿ)_0⊗̂_O A_0); in particular D_{Ψ,Ξ}(A) has no nonzero ξ-torsion and is ξ-adically complete. (b) For such Ψ and Ξ, Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C} in the derived category, compatibly with enlarging Ψ and Ξ (6.3.10), and for Ψ′⊇Ψ, Ξ′⊇Ξ the map Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}→Ω^•_{D_{Ψ′,Ξ′}(A)/B_dR⁺} is a quasi-isomorphism. (c) If Spa(A,A°) also belongs to the basis of (1), the map Ω^•_{A/B_dR⁺}→colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} is a quasi-isomorphism, functorial in Spa(A,A°) (6.3.11). Such affinoids form a basis of X_ét, so the hypercohomology of the sheafification of Spa(A,A°)↦colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} is RΓ_crys(X_ét/B_dR⁺)≃RΓ_crys(X/B_dR⁺), and under this identification the maps (6.3.10) recover (6.2.6) ((6.3.12)). No multiplicative structure on these complexes is asserted.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. X is a smooth adic space over C; it is not assumed proper and is not assumed to be the generic fibre of a formal model. In part (2), K runs over finite extensions of W(k̄)[1/p] inside C; B_dR⁺ is a K-algebra through AI.0’s canonical lift, and its ξ-adic topology and the rings B_dR⁺/ξⁿ=(A_inf/ξⁿ)[1/p] are AI.0’s.

**Dependencies.** `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`; `AInfCohomology:AI.6/smooth-integral-bdr-agreement`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`; `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`; `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`; `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`; `AdicEtaleGeometry:A1`; `AdicSpacesPartII:R3`.

**Proof or construction.** Bases for part (1): by Huber, Étale cohomology of rigid analytic varieties and adic spaces, 1.6.10 and 2.2.8, the analytic and the étale topology of X have bases of affinoids with coordinate maps (6.2.1); localising further gives the surjections (6.2.2). Huber’s results are those of AdicEtaleGeometry:A1. By BMS1 Lemma 13.12(ii) and Lemma 13.13 (AI.6 canonical deformation), for fixed Spa(A,A°) and Ψ large, D_Ψ(A) is ξ-torsion-free and ξ-adically complete, Ω^•_{D_Ψ(A)/B_dR⁺}→Ω^•_{A/B_dR⁺} is a quasi-isomorphism and Ω^•_{D_Ψ(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C}. By BMS1 Lemma 9.15 (AI.6 canonical deformation; for the étale site its analogue, as in the proof of CK Corollary 4.6), the definition with sheafification agrees with that of BMS1 §13, both complexes are derived ξ-complete (6.2.5), and their reductions modulo ξ are the de Rham complexes (6.2.6). (6.2.7): by the Hodge-to-de Rham spectral sequence and Scholze, p-adic Hodge theory for rigid-analytic varieties, Proposition 9.2(ii) (coherent cohomology is the same in the analytic and in the étale topology; AdicSpacesPartII:R3), RΓ(X,Ω^{•,cont}_{X/C})→RΓ(X_ét,Ω^{•,cont}_{X/C}) is an isomorphism. Both sides of (6.2.7) are derived ξ-complete and the pullback map is an isomorphism modulo ξ, hence an isomorphism. Descent for part (2): by Huber 1.7.3 iii) and limit arguments, (6.3.1) descends to (6.3.2) over a finite extension K of W(k̄)[1/p]; by the reduced fibre theorem (Stacks Project 09IL) K can be enlarged so that (6.3.3) holds. By BMS1 Lemma 13.4(ii) (AI.6 canonical deformation) each D_{Ψ,Ξ,n}(A) is a complete strongly noetherian Tate ring, with the image of (A_inf/ξⁿ)⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩ as a ring of definition. By the proof of BMS1 Lemma 13.11, which simplifies here because A_0 is a free O-module (Raynaud–Gruson, Critères de platitude et de projectivité, I.3.3.5, and Stacks Project 0593), the ring B_dR⁺⊗̂_K A_0[1/p] is ξ-torsion-free and ξ-adically complete with reduction A, and lim_n((B_dR⁺/ξⁿ)_0⊗̂_O A_0) surjects onto A° ((6.3.6), (6.3.7)). The K-algebra structure of B_dR⁺ is AI.0:period-comparison’s. Lemma 6.3.8 (CK §6.4, adapting BMS1 Lemma 13.12(ii)): put D_{0,n}=K⟨(x_u^{±1})_{u∈Ψ_0},(x_a)_{a∈Ξ_0}⟩/(Ker s_0)ⁿ and D_0=lim_n D_{0,n}. Since A_0[1/p] is étale over K[T_1,…,T_r,T_{r+1}^{±1},…,T_d^{±1}], the map A_0[1/p]→Â_0[1/p] lifts to A_0[1/p]→D_0 with T_i↦x_{T_i} ((6.4.1)). By Gabber–Ramero, Almost ring theory, 7.3.15, the power-bounded elements of D_{0,n} are the preimage of those of Â_0[1/p], so A_0 maps into a ring of definition; composing with D_{0,n}→D_{Ψ,Ξ,n}(A) gives a continuous map y from the right side of (6.3.9) to D_{Ψ,Ξ}(A). A continuous map z in the other direction is defined from X_{T_i}↦T_i, the expansion X_u^{−1}=ũ^{−1}(1−ũ^{−1}(X_u−ũ)+…) for u∈Ψ and ξ-adic completeness. Then y∘z=id by construction and z∘y=id by étaleness, so z is the isomorphism (6.3.9). (6.3.10) and enlargement: every a∈Ψ∪Ξ is a unit of A, so the proof of BMS1 Lemma 13.13 gives Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C}, compatibly with enlarging Ψ and Ξ; by the ξ-completeness and ξ-torsion-freeness of Lemma 6.3.8 the enlargement maps are quasi-isomorphisms. (6.3.11) and (6.3.12): for Spa(A,A°) in both bases, D_Ψ(A)=D_{Ψ,∅}(A), and the map from colim_Ψ to colim_{Ψ,Ξ} is a quasi-isomorphism because for large indices both sides are computed by ξ-torsion-free, ξ-complete terms with the same reduction modulo ξ (CK state (6.3.11) as a consequence without further argument). The affinoids with r=0 already form a basis of X_ét, so sheafifying gives RΓ_crys(X_ét/B_dR⁺), and (6.2.7) gives (6.3.12).

**Check.** Node chart: for A=C⟨T_0,T_1⟩/(T_0T_1−p^q), A°=O_C⟨T_0,T_1⟩/(T_0T_1−p^q), the coordinate T_1 lies in A°∩A^× (its inverse is T_0/p^q) but not in (A°)^× (its image in A°/𝔪A°=k̄[T_0,T_1]/(T_0T_1) is a zero divisor). So T_1 cannot belong to any Ψ, while Ψ=∅, Ξ={T_0,T_1} satisfy (6.3.5) and the hypotheses of Lemma 6.3.8 with K=W(k̄)[1/p](p^q), O its ring of integers, A_0=O[T_0,T_1]/(T_0T_1−p^q), Ψ_0=∅ and Ξ_0={T_0,T_1}; then (6.3.9) reads D_{∅,{T_0,T_1}}(A)≃(B_dR⁺⊗̂_K A_0[1/p])[[X_{T_0}−T̃_0]]. Case r=0, Ξ=∅: the chart (6.3.1) is an étale map to a torus, D_{Ψ,∅}(A)=D_Ψ(A), and (6.3.9) has the form of BMS1 Lemma 13.12(ii), with the B_dR⁺-lift B_dR⁺⊗̂_K A_0[1/p] of A, obtained by descent to a discretely valued K, in place of the lift used in BMS1; in particular D_Ψ(A) is again ξ-torsion-free and ξ-adically complete for Ψ large. Both parts hold for every smooth adic space over C; properness is not used. For X=Spa(C,O_C) all the complexes are B_dR⁺ in degree 0 and (6.2.6) is reduction modulo ξ. The reduction (6.3.10) for the data (Ψ,Ξ) agrees with (6.2.6) under (6.3.11); a complex with the right cohomology but a different identification modulo ξ does not satisfy (6.3.12).

**Source.** CK, §6.2, p.60; CK, §6.2, (6.2.1), p.60; CK, §6.2, (6.2.5), p.61; CK, §6.2, (6.2.7), p.61; CK, §6.3, p.61; CK, §6.3, (6.3.2), p.61; CK, §6.3, (6.3.3), p.61; CK, §6.3, (6.3.5), p.62; CK, Lemma 6.3.8, p.62; CK, Lemma 6.3.8, last sentence, p.62; CK, §6.4, p.63; CK, §6.4, proof of Lemma 6.3.8, p.63; CK, §6.3, (6.3.10), p.62; CK, §6.3, (6.3.11)–(6.3.12), p.63; BMS1, Lemma 13.12(ii), p.378; BMS1, Lemma 13.4, p.370; BMS1, Lemma 13.11, p.376; BMS1, Lemma 9.15, p.331.

### bdr-comparison-map — Canonical semistable B_dR⁺ comparison map

Target `AInfCohomology:AI.6/bdr-comparison-map` (construction).

**Statement.** Let 𝔛 be as in CK §1.5; its adic generic fibre X_C^ad is then smooth over C. Let RΓ_crys(X_C^ad/B_dR⁺) be AI.6 canonical deformation’s B_dR⁺-cohomology (BMS1 §13), computed in the étale topology with the rings D_{Ψ,Ξ}(A) of bdr-cohomology-etale-embeddings. For an affine Spf R in 𝔛_ét with all-coordinates data (Σ,Λ) as in CK §5.17, put A=R[1/p], Ξ=⋃_{λ∈Λ}{t_{λ,1},…,t_{λ,r_λ}} and Ψ={t_σ}_{σ∈Σ}∪⋃_{λ∈Λ}{t_{λ,r_λ+1},…,t_{λ,d}}, enlarged by the images of the units Ψ₀ obtained by descending the closed immersion (5.17.2) to a finite extension of W(k̄)[1/p]; the coordinates t_{λ,0} are omitted. CK §6.5 constructs continuous ring maps D_{Σ,Λ}→D_{Ψ,Ξ}(A) over A_cris→B_dR⁺ (6.5.5), independent of the auxiliary chart λ₀, compatible with the maps to R[1/p] and with the logarithmic derivations ∂/∂log X_σ and ∂/∂log X_{λ,i}, 1≤i≤d. The induced maps of Koszul complexes (6.5.6) are compatible with enlarging (Σ,Λ) and (Ψ,Ξ) and with replacing R by a p-adically formally étale R-algebra; after sheafification they give the map (6.5.1) RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_crys(X_C^ad/B_dR⁺) over A_cris→B_dR⁺, hence a B_dR⁺-linear map RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). It sits in the commutative square (6.5.7) with the reduction RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C) of (5.23.2), the reduction modulo ξ of (6.2.6) and the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C) to the generic fibre. If 𝔛 is proper, compose with global-crystalline’s RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris) to obtain the A_inf-to-B_dR⁺ map RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺). This is a comparison to AI.6 canonical deformation’s object, not its construction. Naturality for arbitrary morphisms of models, Galois equivariance and multiplicativity of the map are not asserted.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 (étale-locally étale over a chart R□). No properness is needed for the map (6.5.1) or the square (6.5.7); properness of 𝔛 over O_C is assumed only for the composite with the uncompleted identification of global-crystalline. The maps A_inf→A_cris→B_dR⁺ are AI.0’s.

**Dependencies.** `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/log-exactification`; `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`; `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`; `AInfCohomology:AI.6/smooth-integral-bdr-agreement`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`; `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`; `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`; `AdicEtaleGeometry:A1`.

**Proof or construction.** The adic generic fibre X_C^ad is smooth over C by the charts (1.5.1) and Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1 (CK §1.5). Import RΓ_crys(X_C^ad/B_dR⁺) from AI.6 canonical deformation and, from bdr-cohomology-etale-embeddings, its computation in the étale topology by the complexes Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺} ((6.2.7), (6.3.11), (6.3.12)). Local data (CK (6.5.2)): for Spf R with data (Σ,Λ) as in CK §5.17 (all-coordinates) set A=R[1/p], so that A°≃R, and Ψ, Ξ as in the statement. Descend the étale maps (5.17.3) to the ring of integers of a finite extension K of W(k̄)[1/p] in C (CK (1.5.2)) to obtain the descended coordinate map (6.3.2); after enlarging K, descend the closed immersion (5.17.2) to a surjection (6.3.4) with Ξ₀=∅ and adjoin the image of the resulting Ψ₀ to Ψ. Then Spa(A,A°) lies in the refined basis and Lemma 6.3.8 applies to Ψ and Ξ (bdr-cohomology-etale-embeddings). By the descent and Gabber–Ramero, Almost ring theory, 7.3.15, the elements [(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}}) of D_{Ψ,Ξ,n}(A) are power-bounded. Hence (D_{Ψ,Ξ,n}(A))° is an algebra over the ring A□_{Σ,Λ} of (5.22.1), with X_σ↦X_{t_σ}, X_{λ,i}↦X_{t_{λ,i}} for 1≤i≤d and X_{λ,0}↦[(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}}) (CK leave the formulas implicit; they follow from the presentation (5.19.2)). Since D_{Ψ,Ξ,n}(A) is a Q-algebra in which ξ^m=0 for m≥n and each X_a is a unit of D_{Ψ,Ξ}(A), the universal relations (5.26.3) and (5.27.3) of log-exactification make it an algebra over (A□_{Σ,Λ}⊗_{A_inf}A_cris⁰)⊗_{Z[Q]}Z[P_{λ₀}], compatibly with the maps to R ((6.5.3)) and with the change-of-λ₀ isomorphisms (5.26.7). The kernel of (D_{Ψ,Ξ,n}(A))°→R/p has a unique divided power structure (Stacks Project 07GM), so the universal property of the divided power envelope D_{j_{λ₀}} of CK §5.28 (all-coordinates-pd) gives D_{j_{λ₀}}→(D_{Ψ,Ξ,n}(A))° (6.5.4), which factors through a p-adically complete ring of definition. By Lemma 5.29, (5.29.1), D_{Σ,Λ} is the p-adic completion of D_{j_{λ₀}}; this gives continuous maps D_{Σ,Λ}→D_{Ψ,Ξ,n}(A), compatible in n and independent of λ₀, hence D_{Σ,Λ}→D_{Ψ,Ξ}(A) (6.5.5). The derivations ∂/∂log X_σ and ∂/∂log X_{λ,i} (1≤i≤d) of D_{j_{λ₀}} (CK §5.31, all-coordinates-pd) are compatible with the corresponding derivations of D_{Ψ,Ξ}(A); by density of D_{j_{λ₀}} in D_{Σ,Λ} the same holds on D_{Σ,Λ}. This gives maps of Koszul complexes, compatible with enlarging the data and with p-adically formally étale localisation of R ((6.5.6)). The source computes RΓ_logcrys(𝔛_{O_C/p}/A_cris) by CK Proposition 5.23, (5.23.3), and §5.32 (all-coordinates-log-crystalline); the target computes RΓ_crys(X_C^ad/B_dR⁺) by (6.3.12). Sheafify on 𝔛_ét and apply RΓ(𝔛_ét,−) to obtain (6.5.1). Square (6.5.7): by construction and Lemma 5.29 the map (6.5.5) is compatible with the maps to R[1/p]; BMS1 Lemma 13.13, as used for (6.3.10), then shows that (6.5.6) is compatible with the maps to Ω^{•,cont}_{R[1/p]/C} given by (5.23.2) (last display of CK §5.32) and by (6.3.10). For proper 𝔛, compose with the identification (5.43.2) of global-crystalline (CK Corollary 5.43).

**Uses.**

- CK Theorem 6.6, Proposition 6.8, Theorem 8.7: The exact B_dR⁺ lattice and agreement with the étale comparison determine the integral lattice.
- CohomologyComparisons:CP.4: Rational semistable assembly uses this canonical map and its reduction square.

**API.**

- `Semistable.bdrComparisonMap.reduce` (compatibility): The square (6.5.7) commutes: (6.5.1) followed by the reduction modulo ξ, RΓ_crys(X_C^ad/B_dR⁺)→RΓ_dR(X_C^ad/C) of (6.2.6), equals the reduction RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C) of (5.23.2) followed by the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C) to the generic fibre.
- `Semistable.bdrComparisonMap.natural` (functoriality): The local maps (6.5.5) and (6.5.6) are compatible with enlarging (Σ,Λ) and (Ψ,Ξ) and with replacing R by a p-adically formally étale R-algebra R′ with data as in CK §5.17; this is what makes them glue to (6.5.1). Compatibility with arbitrary morphisms of models, and with the semilinear action of Gal(K̄/K) on a model defined over O_K, is not asserted.
- `Semistable.bdrComparisonMap.coefficients` (data): The map is induced by the common A_inf→A_cris→B_dR⁺ coefficient maps, not an arbitrary isomorphism of equal-rank modules.
- `Semistable.bdrComparisonMap.local` (data): For data (Σ,Λ) on Spf R and (Ψ,Ξ) as in (6.5.2), the map D_{Σ,Λ}→D_{Ψ,Ξ}(R[1/p]) of (6.5.5) is a continuous A_cris-algebra map sending the images of X_σ, X_{λ,i} (1≤i≤d) and X_{λ,0} to X_{t_σ}, X_{t_{λ,i}} and [(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}}); it commutes with the maps D_{Σ,Λ}→R and D_{Ψ,Ξ}(R[1/p])→R[1/p] and intertwines ∂/∂log X_σ and ∂/∂log X_{λ,i} with ∂/∂log X_{t_σ} and ∂/∂log X_{t_{λ,i}}.

**Definition tests.**

- `Semistable.bdrComparisonMap.point` (degenerate): For 𝔛=Spf O_C (d=0, Σ=∅, one chart with r=0) both sides are concentrated in degree 0: RΓ_logcrys(Spec(O_C/p)/A_cris)=A_cris and RΓ_crys(Spa(C,O_C)/B_dR⁺)=B_dR⁺. The map (6.5.1) is the inclusion A_cris→B_dR⁺ of CK §6.1, and its B_dR⁺-linearisation is the identity of B_dR⁺.
- `Semistable.bdrComparisonMap.good_reduction` (compatibility): For 𝔛 proper and smooth over O_C (the log structure is then pulled back from the base, so Ω^j_{𝔛/O_C,log}=Ω^j_{𝔛/O_C}), the reduction modulo ξ of the B_dR⁺-linear map is identified by (5.23.2) and (6.2.6) with the canonical isomorphism RΓ_dR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C); hence the map is an isomorphism, as in BMS1 Proposition 13.23. For the p-adic completion of P¹_{O_C} both sides have cohomology B_dR⁺, 0, B_dR⁺ in degrees 0, 1, 2. Equality with the map of BMS1 Proposition 13.23 is not asserted: BMS1 does not write that map down.
- `Semistable.bdrComparisonMap.node` (compatibility): On the chart R□=O_C{t_0,t_1}/(t_0t_1−p^q), with A=R□[1/p]: Ω¹_{R□/O_C,log} is free on dlog t_1=−dlog t_0, Ω^{1,cont}_{A/C} is free on dT_1/T_1=−dT_0/T_0, and the lower arrow of (6.5.7) is in degree 1 the R□-linear map dlog t_1↦dT_1/T_1. So the relation dlog t_0+dlog t_1=0 goes to dT_0/T_0+dT_1/T_1=0, and the arrow becomes an isomorphism after inverting p. On the B_dR⁺ side t_1 is a coordinate in Ξ and t_0 is omitted.

**Check.** The square (6.5.7) commutes in the derived category: the map followed by the reduction modulo ξ of (6.2.6) equals the reduction (5.23.2) to RΓ_logdR(𝔛/O_C) followed by the map RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C). The map and the square are constructed without properness; properness enters only in the composite with RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris. On a node chart the coordinate t_{λ,1} is placed in Ξ (it is invertible in R[1/p] but not in R) and t_{λ,0} is omitted; the target is therefore one of the rings D_{Ψ,Ξ}(A) with Ξ≠∅ of bdr-cohomology-etale-embeddings.

**Source.** CK, §6.5, map (6.5.1), p.64; CK, §6.5, (6.5.2), p.64; CK, §6.5, (6.5.4)–(6.5.5), p.65; CK, §6.5, (6.5.6), p.65; CK, §6.5, square (6.5.7), p.65; CK, Corollary 5.43, (5.43.2), p.58.

### bdr-comparison — Semistable B_dR⁺ comparison

Target `AInfCohomology:AI.6/bdr-comparison` (theorem).

**Statement.** For proper 𝔛, bdr-comparison-map is an equivalence RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺), and hence RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺). In every degree it gives H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺≃H^i_crys(X_C^ad/B_dR⁺), a finite free B_dR⁺-module. Modulo ξ the second equivalence is compatible with the identifications of both sides with RΓ_dR(X_C^ad/C): on the source the log de Rham specialization (4.18.1) of log-de-rham followed by RΓ_logdR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C), on the target the reduction (6.2.6).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C.

**Dependencies.** `AInfCohomology:AI.6/bdr-comparison-map`; `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/crystalline-de-rham-square`; `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`; `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`; `AInfCohomology:AI.6/smooth-integral-bdr-agreement`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `EnhancedDerivedSheaves:E4/mod-ideal-detection`; `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`; `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`; `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`; `AdicSpacesPartII:R3`.

**Proof or construction.** By proper-perfectness (CK Corollary 4.20) and global-crystalline (CK Corollary 5.43, whose freeness assertion rests on Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.18, Theorem), RΓ_logcrys(𝔛_{O_C/p}/A_cris) is a perfect complex over A_cris whose cohomology modules are finite free after inverting p. Hence its base change to B_dR⁺ is derived ξ-complete with finite free cohomology. The finite freeness is not imported from AI.6 canonical deformation. By CK Remark 5.24, (5.24.1) (Beilinson, (1.11.1); CR.5), the map (5.23.2) is an isomorphism after ⊗^L O_C/p; both RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}O_C and RΓ_logdR(𝔛/O_C) are perfect over O_C, hence derived p-complete, so RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}O_C≃RΓ_logdR(𝔛/O_C). By bdr-cohomology-etale-embeddings ((6.2.5), (6.2.6)), RΓ_crys(X_C^ad/B_dR⁺) is derived ξ-complete with reduction RΓ_dR(X_C^ad/C). By the square (6.5.7) of bdr-comparison-map, the reduction modulo ξ of the map is RΓ_logdR(𝔛/O_C)⊗_{O_C}C→RΓ_dR(X_C^ad/C). This is an isomorphism: coherent cohomology of the proper formal scheme and of its adic generic fibre agree after inverting p, and Ω^j_{𝔛/O_C,log}[1/p] is the sheaf of continuous differentials of the generic fibre. CK use this without citation; it is the statement taken from AdicSpacesPartII:R3. By derived Nakayama for ξ (E4/mod-ideal-detection, AI.5) the map is an isomorphism; this is (6.6.1), and the freeness of the H^i_crys(X_C^ad/B_dR⁺) follows from the first step. Combine with (5.43.2) of global-crystalline to obtain (6.6.2). The degreewise form is not in the statement of CK Theorem 6.6; it follows from the flatness of B_dR⁺ over A_inf (CK §6.1, by Raynaud–Gruson, Critères de platitude et de projectivité, II.1.4.2.1; AI.0:period-comparison), which gives H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺)=H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺. CK use it in this form in the proof of Theorem 8.7. The compatibility modulo ξ with (4.18.1) follows from crystalline-de-rham-square (CK Proposition 5.41) and the commutativity of (6.5.7) (CK Theorem 6.6).

**Check.** The complex comparison and the degreewise finite-free statement are both required. The reduction modulo ξ of the equivalence is the isomorphism RΓ_logdR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C); for the p-adic completion of P¹_{O_C} both sides have cohomology B_dR⁺, 0, B_dR⁺ in degrees 0, 1, 2.

**Source.** CK, Theorem 6.6, p.66; CK, Theorem 6.6, mod-ξ clause, p.66; CK, Theorem 6.6, proof, p.66; CK, Corollary 5.43, p.58; CK, Remark 5.24, (5.24.1), p.44; CK, Proposition 5.41, p.56; CK, §6.1, p.60.

### etale-comparison — Semistable étale specialization

Target `AInfCohomology:AI.6/etale-comparison` (theorem).

**Statement.** If 𝔛 is proper over O_C, then RΓ_Ainf(𝔛)⊗^L_{A_inf}A_inf[1/μ]≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf[1/μ] (CK Theorem 2.3); both tensor products are ordinary derived tensor products. The identification is induced by the map RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}A_inf→RΓ_proét(X_C^ad,A_inf,X) coming from the inclusion of Z_p in A_inf,X, whose cone has cohomology killed by W(m^♭), and by AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]; it is compatible with Frobenius, acting through A_inf,X on the left and through A_inf on the right. It is natural for isomorphisms lying over continuous automorphisms of O_C (aomega, API item semilinear); in particular for 𝔛=𝔛₀⊗̂_{O_K}O_C it is G_K-equivariant, G_K acting on the right side through both factors, which CK use in the proof of Theorem 8.7. Compatibility with products is not asserted. For non-proper 𝔛 it fails in general. It is generic-fibre p-adic étale cohomology, not special-fibre étale cohomology and not mere p-inversion.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is proper over O_C; then X_C^ad is smooth and proper over C (CK §1.5).

**Dependencies.** `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Proof or construction.** By aomega (CK (2.2.7)), AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]; 𝔛 being quasi-compact and quasi-separated, RΓ(𝔛_ét,−) commutes with inverting μ, so RΓ_Ainf(𝔛)⊗^L A_inf[1/μ]≅RΓ_proét(X_C^ad,A_inf,X)⊗^L A_inf[1/μ]. Primitive comparison (Scholze; BMS1 Theorem 5.7, cited by CK as [BMS18, 5.6]; AI.3): X_C^ad is a proper smooth adic space over the algebraically closed field C (Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1 and 1.3.18 ii)), so the cone of the map CK (2.3.2) has cohomology killed by W(m^♭) (almost purity gives [m^♭]; derived p-completeness, as in CK Lemma 3.17, gives W(m^♭)). μ lies in W(m^♭), so (2.3.2) becomes an isomorphism after inverting μ; with the first step this is (2.3.1). Frobenius compatibility is read off from the construction, as CK does when it uses (2.3.1) in §9. Naturality for isomorphisms over automorphisms of O_C: the maps (2.2.7) and (2.3.2) are induced by maps of sheaves on the pro-étale site of the generic fibre that are defined for every pair (C,X_C^ad), hence commute with the pullback isomorphisms of aomega (API item semilinear).

**Check.** For 𝔛=Spf O_C both sides are A_inf[1/μ] and the map is the identity. Properness is necessary. For 𝔛=Spf O_C{t^{±1}}, base change of both sides along A_inf[1/μ]→A_inf[1/μ]/ξ̃=C gives H⁰=C⟨t^{±1}⟩ on the left (by hodge-tate-comparison, H⁰(Ω̃_𝔛)=O_𝔛) and H⁰=C on the right (the generic fibre is connected and C is flat over Z_p), so the two sides are not isomorphic. After inverting only p there is no natural, Frobenius-compatible comparison: it would specialise along A_inf[1/p]→W(k̄)[1/p] to a Frobenius-equivariant isomorphism of H^i_logcris(𝔛_k̄/W(k̄))[1/p] with H^i_ét(X_C^ad,Z_p)⊗W(k̄)[1/p], on which Frobenius acts through W(k̄) only, forcing all slopes to be 0; for 𝔛=P¹_{O_C} and i=2 the slope is 1. (A non-canonical isomorphism of complexes does exist after inverting p, both sides then having finite free cohomology of equal ranks by CK Theorem 7.4 and Corollary 7.5.)

**Source.** CK, §1.5, p.5; CK, §2.2, p.9; CK, Theorem 2.3, p.9; CK, Theorem 2.3 (sketch of proof), p.9; CK, Theorem 9.5 (proof), p.76; BMS1, Theorem 5.7, p.287; CK, Theorem 8.7 (proof), p.74.

### etale-bdr-agreement — Étale and B_dR comparison agreement

Target `AInfCohomology:AI.6/etale-bdr-agreement` (theorem).

**Statement.** Let 𝔛 be proper. Let c: RΓ_crys(X_C^ad/B_dR⁺)→RΓ_ét(X_C^ad,Z_p)⊗_{Z_p}B_dR⁺ be the map of BMS1 (proof of Theorem 13.1) supplied by AI.6 canonical deformation; it becomes an isomorphism after ⊗_{B_dR⁺}B_dR, the identification (6.7.1), and is not asserted to be an isomorphism over B_dR⁺. Then the diagram of CK Proposition 6.8 commutes: the composite of bdr-comparison-map’s (6.5.1), of c and of the isomorphism RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}B_dR⁺≃RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ induced by (2.3.2) equals the composite of the isomorphism RΓ_logcrys(𝔛_{O_C/p}/A_cris)≃RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris ((5.43.2) of global-crystalline, the global form of absolute-crystalline’s (5.40.1), which is the label in CK’s diagram) and the map to RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ induced by Lη_μ→id (BMS1 Lemma 6.10). Consequently, after base change to B_dR, the identification RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR≃RΓ_ét(X_C^ad,Z_p)⊗^L_{Z_p}B_dR obtained from etale-comparison equals the one obtained from bdr-comparison and (6.7.1). If moreover X_C^ad≃X₀⊗̂_K C for a proper smooth adic space X₀ over K, with K as in the hypotheses, then under RΓ_crys(X_C^ad/B_dR⁺)≃RΓ_dR(X₀/K)⊗_K B_dR⁺ ((6.2.8), using the canonical K→B_dR⁺) the identification (6.7.1) becomes the de Rham comparison (6.7.2) RΓ_ét(X_C^ad,Z_p)⊗_{Z_p}B_dR≃RΓ_dR(X₀/K)⊗_K B_dR; when C is the completion of K̄ it is Gal(K̄/K)-equivariant, recovers Scholze’s comparison isomorphism and is compatible with filtrations (the valuation filtration of B_dR, the Hodge filtration on RΓ_dR(X₀/K) and the trivial filtration on étale cohomology).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C. For the last sentence only: K⊂C is a complete discretely valued subfield with perfect residue field and X₀ is a proper smooth adic space over K with X_C^ad≃X₀⊗̂_K C (CK (6.2.8)); for Galois equivariance, agreement with Scholze’s isomorphism and compatibility with filtrations, C is the completion of K̄ (CK §6.7).

**Dependencies.** `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.6/bdr-comparison-map`; `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`; `AInfCohomology:AI.6/all-coordinates-map`; `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`; `AInfCohomology:AI.6/smooth-integral-bdr-agreement`; `AInfCohomology:AI.6/finite-level-acris`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`; `AInfCohomology:AI.6/global-crystalline`.

**Proof or construction.** (2.3.2)⊗B_dR⁺ is an isomorphism: the cohomology of the cone of (2.3.2) is killed by W(𝔪^♭) (etale-comparison; discussion after CK Theorem 2.3), and φ⁻¹(μ)∈W(𝔪^♭) is a unit of B_dR⁺. Recall c from BMS1, proof of Theorem 13.1 (AI.6 canonical deformation): for Spa(A,A°) in the basis of CK §6.2 and Ψ large, the perfectoid ∏_Ψ Z_p(1)-cover Spa(A_{Ψ,∞},A⁺_{Ψ,∞}) gives a continuous B_dR⁺-map D_Ψ(A)→B_dR⁺(A⁺_{Ψ,∞}), X_u↦[u^{1/p^∞}] (6.8.2), which intertwines exp(log([ε])·∂/∂log X_u) with the generator γ_u of the u-th copy of Z_p(1). The formula of (5.16.1) then gives maps of complexes Ω^•_{D_Ψ(A)/B_dR⁺}→K_{B_dR⁺(A⁺_{Ψ,∞})}((γ_u−1)_{u∈Ψ}) (6.8.3), whose target computes RΓ_ét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺ by the almost purity theorem (AI.3). Passing to the colimit over Ψ, sheafifying and taking cohomology gives the composite f of c with (2.3.2). Extend the construction of (6.8.3) to the étale basis of CK §6.2 and to the data (Ψ,Ξ) of CK §6.3, with the cover that adjoins p-power roots of the X_u (u∈Ψ) and of the X_a (a∈Ξ). By (6.2.7) and (6.3.12) of bdr-cohomology-etale-embeddings both variants give the same f. CK say that the remaining modifications are mild; they have to be carried out here, so a local comparison for non-unit coordinates is constructed in this node. Since f is now built in the setting of CK §6.3 by the same pattern as (5.40.1) (absolute-crystalline; the map of (5.16.1)), the proposition reduces to the commutativity of the square of rings (6.8.4): D_{Σ,Λ}→D_{Ψ,Ξ}(A)→B_dR⁺(A⁺_{Ψ,Ξ,∞}), by (6.5.5) of bdr-comparison-map and (6.8.2), equals D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞})→B_dR⁺(A⁺_{Ψ,Ξ,∞}), by (5.38.1) of all-coordinates-map and (5.36.1). Check it modulo ξⁿ, then on D_{j_{λ₀}}, then, the target being a Q-algebra, on (A□_{Σ,Λ}⊗_{A_inf}A_cris⁰)⊗_{Z[Q]}Z[P_{λ₀}]: both maps send X_τ to the unit [X_τ^{1/p^∞}] for τ=σ∈Σ and τ=(λ,i), 1≤i≤d (CK Proposition 6.8). The statement over B_dR follows by inverting ξ, using bdr-comparison ((6.6.2)) and AI.6 canonical deformation’s (6.7.1). Descended case (CK §6.7): (6.2.8) is BMS1 Remark 13.20 (AI.6 canonical deformation), with the unique continuous lift K→B_dR⁺ of K→C; combined with (6.7.1) it gives (6.7.2). If C is the completion of K̄, then (6.7.2) is Galois equivariant by transport of structure and, by BMS1 Theorem 13.1, recovers the isomorphism of Scholze, p-adic Hodge theory for rigid-analytic varieties, Theorem 8.4; hence it is compatible with filtrations.

**Check.** Equality of these actual maps, rather than existence of some isomorphism, is the lattice input. The map c is an isomorphism only after inverting ξ: for X_C^ad=P¹_C in degree 2 its image is ξ·(H²_ét(P¹_C,Z_p)⊗_{Z_p}B_dR⁺).

**Source.** CK, Proposition 6.8, p.66 (proof pp.67–68); CK, Proposition 6.8, conclusion, p.66; CK, Proposition 6.8, proof, p.67; CK, §6.7, (6.7.1), p.66; CK, §6.7, (6.7.2), p.66; CK, §6.2, (6.2.8), p.61; BMS1, Theorem 13.1, p.368; BMS1, Remark 13.20, p.384; BMS1, Lemma 6.10, p.292.

### cohomological-bkf — Semistable cohomological BKF modules

Target `AInfCohomology:AI.6/cohomological-bkf` (theorem).

**Statement.** For proper 𝔛, each H^i_Ainf(𝔛) is finitely presented over A_inf and finite free after p-inversion, with the Frobenius isomorphism after ξ̃-inversion required by AI.2. If 𝔛_k̄ has dimension at most d the module is zero outside 0,…,2d (proper-perfectness; CK Theorem 7.4 assumes pure dimension d). If 𝔛=𝔛₀⊗̂_{O_K}O_C for a formal O_K-scheme 𝔛₀, with K as in CK §8.1, the semilinear action of G_K on H^i_Ainf(𝔛) (aomega, API item semilinear) commutes with the Frobenius isomorphism (CK §8.3). These are finitely presented BKF modules, with possible p-torsion, not automatically finite free BKF lattices.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C. Pure dimension d of the special fibre 𝔛_{k̄} (CK §7.1) is assumed only for the vanishing outside 0,…,2d.

**Dependencies.** `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/aomega-frobenius`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/bkf-valid-operations`; `AInfCohomology:AI.2/bkf-etale-realization`; `AInfCohomology:AI.2/fargues-classification`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.6/aomega`.

**Proof or construction.** By proper-perfectness (CK Corollary 4.20), RΓ_Ainf(𝔛) is a perfect complex. By etale-comparison (CK Theorem 2.3) and flatness of A_inf→A_inf[1/μ], H^i_Ainf(𝔛)[1/pμ]≃H^i_ét(X_C^ad,Z_p)⊗_{Z_p}A_inf[1/pμ] is free over A_inf[1/pμ]. By global-crystalline (CK Corollary 5.43), the cohomology modules of RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris[1/p] are free over A_cris[1/p]. Apply BMS1 Corollary 4.20 (AI.5; its proof uses BMS1 Lemma 4.19, Corollary 4.17 and Lemma 4.9): each H^i_Ainf(𝔛) is finitely presented and H^i_Ainf(𝔛)[1/p] is free over A_inf[1/p]. The Frobenius of aomega-frobenius (CK (2.2.5), (2.2.6)) is an isomorphism after inverting ξ̃=φ(ξ) and passes to cohomology because φ is an automorphism of A_inf. Hence each H^i_Ainf(𝔛) is a Breuil–Kisin–Fargues module in the sense of BMS1 Definition 4.22, the definition imported from AI.2 (CK §7.3, Theorem 7.4). Vanishing outside 0,…,2d is part of proper-perfectness (CK Theorem 7.4). Galois action (CK §8.1, §8.3): the Frobenius of aomega-frobenius is induced by the Frobenius of the period sheaf A_inf,X, which commutes with the pullback isomorphisms of aomega (API item semilinear); so the action of G_K on H^i_Ainf(𝔛) commutes with the Frobenius isomorphism.

**Check.** A p-torsion cohomology module remains allowed; the finite-free Fargues classification is not applied to it.

**Source.** CK, Theorem 7.4 with proof, p.69; CK, §7.3, p.69; CK, §7.2, Frobenius, p.68; CK, §7.1, p.68; BMS1, Corollary 4.20, pp.275–276; CK, §8.3, p.72.

### degreewise-specializations — Degreewise semistable specialization sequences

Target `AInfCohomology:AI.6/degreewise-specializations` (theorem).

**Statement.** For proper 𝔛 and every i, H_A^i⊗_{A_inf}W(C^♭)≃H_ét^i(X_C,Z_p)⊗_{Z_p}W(C^♭). There are exact sequences 0→H_A^i⊗_{θ}O_C→H_logdR^i→H_A^{i+1}[ξ]→0 and, Frobenius-equivariantly, 0→H_A^i⊗W(k̄)→H_logcrys^i→Tor₁^{A_inf}(H_A^{i+1},W(k̄))→0. Here H_logcrys^i=H_logcrys^i(𝔛_{k̄}/W(k̄)) is taken over W(k̄) with the log structure associated with Q≥0→W(k̄), 0≠q↦0, 0↦1, of CK §5.42, as in global-crystalline; the passage to the ℕ log point is hyodo-kato-interface and is not used here.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Dependencies.** `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`.

**Proof or construction.** Étale: by etale-comparison and flatness of A_inf→A_inf[1/μ], H_A^i[1/μ]≃H_ét^i(X_C,Z_p)⊗_{Z_p}A_inf[1/μ] ((7.6.1)). Since μ is a unit of W(C^♭) and W(C^♭) is A_inf-flat (the localisation of A_inf at (p) is a discrete valuation ring with completion W(C^♭)), base change gives (7.6.2). De Rham: apply the universal-coefficient sequence (Stacks Project 0662; AI.5) to RΓ_Ainf(𝔛)⊗^L_{A_inf,θ}O_C≃RΓ_logdR(𝔛/O_C) (log-de-rham, CK Corollary 4.18). Since O_C=A_inf/ξ with ξ a nonzerodivisor, Tor₁^{A_inf}(M,O_C)=M[ξ] and the higher Tor groups vanish; this gives (7.6.3). Crystalline: apply the same to RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄)) (global-crystalline, CK (5.43.2), Frobenius-equivariant). By cohomological-bkf (CK Theorem 7.4) each H_A^j is finitely presented with H_A^j[1/p] free, so by BMS1 Lemma 4.9(iii) (AI.5) it has Tor-dimension at most 2 and Tor₂^{A_inf}(H_A^j,W(k̄))=0. The spectral sequence therefore has only the Tor₀ and Tor₁ columns and gives (7.6.4). The adjacent-degree terms are retained, not collapsed (CK §7.6).

**Check.** H_A^{i+1}[ξ] and Tor₁ must appear explicitly when no adjacent freeness is assumed. If 𝔛_{k̄} is purely d-dimensional, then in the top degree both error terms vanish: H_A^{2d}⊗_{θ}O_C≃H_logdR^{2d} and H_A^{2d}⊗W(k̄)≃H_logcrys^{2d}.

**Source.** CK, §7.6, (7.6.1)–(7.6.2), p.69; CK, §7.6, (7.6.3), p.69; CK, §7.6, (7.6.4), p.69; CK, §7.6, top degree, p.69; CK, §5.42, p.58; BMS1, Lemma 4.9(iii), p.269.

### freeness-criterion — One-degree semistable freeness criterion

Target `AInfCohomology:AI.6/freeness-criterion` (theorem).

**Statement.** For proper 𝔛 and fixed i, H_logdR^i(𝔛/O_C) is O_C-free iff H_logcrys^i(𝔛_{k̄}/W(k̄)) is W(k̄)-free. Under either condition H_A^i is A_inf-free and H_ét^i(X_C,Z_p) is Z_p-free. This alone does not remove the adjacent-degree terms from degreewise-specializations.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Dependencies.** `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`.

**Proof or construction.** By proper-perfectness and cohomological-bkf (CK Theorem 7.4), RΓ_Ainf(𝔛) is a perfect complex all of whose cohomology modules are free after inverting p. BMS1 Lemma 4.18 (AI.5) then says, for the fixed i, that H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)) is p-torsion-free if and only if H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}O_C) is. By the specializations (7.2.1) (global-crystalline, log-de-rham) these groups are H_logcrys^i(𝔛_{k̄}/W(k̄)) and H_logdR^i(𝔛/O_C). Both are finitely presented modules over valuation rings, so p-torsion-free is equivalent to free. When these conditions hold, BMS1 Corollary 4.17 (AI.5; it uses BMS1 Proposition 4.13 and Lemma 4.16) gives that H_A^i is finite free and that H_A^i⊗_{A_inf}W(C^♭) is p-torsion-free; by (7.6.1), (7.6.2) of degreewise-specializations this module is H_ét^i(X_C,Z_p)⊗_{Z_p}W(C^♭), so H_ét^i(X_C,Z_p) is Z_p-free. No hypothesis on degree i+1 is used (CK Proposition 7.7). The last sentence of the statement is a caution, not part of CK Proposition 7.7: the terms H_A^{i+1}[ξ] and Tor₁^{A_inf}(H_A^{i+1},W(k̄)) of degreewise-specializations depend on degree i+1, and CK §7.6 notes that they vanish when H_A^{i+1} is A_inf-free. Alternative route for the equivalence, not used here (CK Remark 7.8): the derived reductions to k̄ of RΓ_logdR(𝔛/O_C) and RΓ_logcrys(𝔛_{k̄}/W(k̄)) agree, the ranks agree by CK Corollary 7.5, and universal coefficients over the two valuation rings show by descending induction on the degree that the two modules have the same number of cyclic torsion summands.

**Check.** For full degree-i specialization identities additionally impose the required adjacent-degree freeness.

**Source.** CK, Proposition 7.7, p.70; CK, Proposition 7.7, proof, p.70; CK, §7.6, p.70; CK, Remark 7.8, p.70; BMS1, Lemma 4.18, p.274; BMS1, Corollary 4.17, p.274.

### rank-equality — Semistable cohomology rank equality

Target `AInfCohomology:AI.6/rank-equality` (theorem).

**Statement.** For proper 𝔛, the generic ranks of H_A^i, H_ét^i(X_C,Z_p), H_logdR^i and H_logcrys^i over A_inf, Z_p, O_C and W(k̄), respectively, are equal. Rank is computed after the relevant fraction-field or p-inverted free specialization; it does not assert equality of torsion.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Dependencies.** `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`.

**Proof or construction.** By cohomological-bkf (CK Theorem 7.4) every H_A^j[1/p] is finite free over A_inf[1/p]. Hence, after inverting p, each base change of the perfect complex RΓ_Ainf(𝔛) is computed degree by degree. The maps θ: A_inf→O_C and A_inf→W(k̄) are not flat; freeness of the H_A^j[1/p], not flatness, is what is used. Apply this to the three specializations (7.2.1): etale-comparison (over A_inf[1/μ]), log-de-rham (along θ, CK (4.18.1)) and global-crystalline (over W(k̄), CK (5.43.2)). They give H_ét^i(X_C,Z_p)⊗_{Z_p}A_inf[1/pμ]≃H_A^i[1/pμ], H_logdR^i[1/p]≃H_A^i[1/p]⊗_{A_inf[1/p],θ}C and H_logcrys^i[1/p]≃H_A^i[1/p]⊗_{A_inf[1/p]}W(k̄)[1/p], so all the ranks equal the rank of the free A_inf[1/p]-module H_A^i[1/p] (CK Corollary 7.5). The rank of H_A^i itself is not in the statement of Corollary 7.5; it is in its proof. Finite presentation of H_ét^i, H_logdR^i and H_logcrys^i, needed to speak of their ranks, follows from the perfectness of RΓ_Ainf(𝔛), (7.2.1) and the coherence of O_C (CK Corollary 7.5, proof).

**Check.** A torsion summand changes lengths while leaving these ranks unchanged.

**Source.** CK, Corollary 7.5, p.69; CK, Corollary 7.5, proof, p.69; CK, §7.2, (7.2.1), p.68.

### crystalline-torsion — Étale–log crystalline torsion inequalities

Target `AInfCohomology:AI.6/crystalline-torsion` (theorem).

**Statement.** For proper 𝔛, all i and n≥0, length_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤length_{W(k̄)}(H_logcrys^i(W(k̄))_tors/p^n), and length_{Z_p}H_ét^i(Z/p^n)≤length_{W(k̄)}H_logcrys^i(W_n(k̄)). These are length inequalities, not a canonical injection or a subquotient assertion.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this. The log crystalline cohomology of 𝔛_{k̄} is taken over W(k̄), resp. W_n(k̄), with the log structure of CK §5.42, as in degreewise-specializations.

**Dependencies.** `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/rank-equality`; `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`.

**Proof or construction.** By rank-equality (CK Corollary 7.5), H_ét^i(X_C^ad,Z_p) and H_logcrys^i(𝔛_{k̄}/W(k̄)) have the same rank r; for a finitely generated module H over a discrete valuation ring with uniformizer p, length(H/p^n)=nr+length(H_tors/p^n), so the torsion subscripts may be dropped. By cohomological-bkf (CK Theorem 7.4), M=H_A^i is finitely presented with M[1/p] free. BMS1 Corollary 4.15(ii) (AI.5; deduced from BMS1 Lemma 4.14) gives length((M⊗_{A_inf}W(C^♭))/p^n)≤length_{W(k̄)}((M⊗_{A_inf}W(k̄))/p^n), and by (7.6.2) of degreewise-specializations the left side is length_{Z_p}(H_ét^i(X_C^ad,Z_p)/p^n). This is (7.9.2). In the sequence (7.6.4) of degreewise-specializations, 0→M⊗W(k̄)→H_logcrys^i→Q→0, the module Q=Tor₁^{A_inf}(H_A^{i+1},W(k̄)) is finite and torsion. The exact sequence Tor₁^{W(k̄)}(Q,W(k̄)/p^n)→(M⊗W(k̄))/p^n→H_logcrys^i/p^n→Q/p^n→0 and the equality length(Q/p^n)=length(Tor₁^{W(k̄)}(Q,W(k̄)/p^n)) give length((M⊗W(k̄))/p^n)≤length(H_logcrys^i/p^n). This proves the first inequality. Second inequality: the universal-coefficient sequences (Stacks Project 0662) 0→H^i/p^n→H^i(−,Z/p^n), resp. H_logcrys^i(𝔛_{k̄}/W_n(k̄)), →H^{i+1}[p^n]→0 hold on both sides, and length(T[p^n])=length(T/p^n) for a torsion module T of finite length. So the second inequality follows from the first in degrees i and i+1 together with rank-equality (CK Theorem 7.9). CK cite no result for the identification of the finite-coefficient groups with the derived reductions modulo p^n, and it has no supplier among the prerequisites.

**Check.** At n=1 distinguish torsion quotients from finite-coefficient cohomology.

**Source.** CK, Theorem 7.9, p.70; CK, Theorem 7.9, proof, p.70; CK, Theorem 7.9, end of proof, p.70; BMS1, Corollary 4.15, p.272; BMS1, Theorem 14.5(ii), p.393.

### de-rham-torsion — Étale–log de Rham torsion inequalities

Target `AInfCohomology:AI.6/de-rham-torsion` (theorem).

**Statement.** For proper 𝔛, all i and n≥0, v_{Z_p}(H_ét^i(Z_p)_tors/p^n)≤v_{O_C}(H_logdR^i(O_C)_tors/p^n), and v_{Z_p}H_ét^i(Z/p^n)≤v_{O_C}H^i(𝔛_{O_C/p^n},Ω^•_{𝔛_{O_C/p^n}/(O_C/p^n),log}), the logarithmic de Rham cohomology of the reduction of 𝔛 modulo p^n. Here v(p)=1 and v(⊕O_C/(a_j))=Σv(a_j); this normalized valuation length is not ordinary O_C-module length. Over O_K it is length_{O_K}/length_{O_K}(O_K/p).

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. 𝔛 is as in CK §1.5 and proper over O_C. CK §7.1 also assumes that the special fibre 𝔛_{k̄} is purely d-dimensional; the proof does not use this.

**Dependencies.** `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/rank-equality`; `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `AInfCohomology:AI.6/normalized-valuation-length`; `AInfCohomology:AI.6/valuation-length-specialization`.

**Proof or construction.** Import from AI.5 the normalized length of CK §7.10 for a valuation ring 𝔬 of rank 1 and mixed characteristic (0,p): finitely presented 𝔬-modules are direct sums of cyclic modules (Stacks Project 0ASP; Gabber–Ramero, Almost ring theory, 6.1.14), v_𝔬 of a finitely presented torsion module is the valuation of a generator of its zeroth Fitting ideal, and v_𝔬 is additive in short exact sequences (Gabber–Ramero 6.3.1 and 6.3.5(i)). Import also CK Lemma 7.11: for a finitely presented W_n(O_C^♭)-module M, v_{W(C^♭)}(M⊗_{A_inf}W(C^♭))=v_{O_C}(M/ξM)−v_{O_C}(M[ξ]); its proof uses the coherence of W_n(O_C^♭) (BMS1 Proposition 3.24). By rank-equality (CK Corollary 7.5) the torsion subscripts may be dropped. By cohomological-bkf (CK Theorem 7.4), M=H_A^i/p^n is a finitely presented W_n(O_C^♭)-module; Lemma 7.11 and (7.6.2) of degreewise-specializations give v_{Z_p}(H_ét^i(X_C^ad,Z_p)/p^n)≤v_{O_C}(H_A^i/(p^n,ξ)). In the sequence (7.6.3) of degreewise-specializations the module Q=H_A^{i+1}[ξ] is finitely presented and torsion, and v_{O_C}(Q/p^n)=v_{O_C}(Tor₁^{O_C}(Q,O_C/p^n)) by the presentation (7.10.1). Hence v_{O_C}(H_A^i/(p^n,ξ))≤v_{O_C}(H_logdR^i(𝔛/O_C)/p^n), which proves the first inequality. The second inequality follows from the first in degrees i and i+1 by the universal-coefficient sequences (Stacks Project 0662), as in CK Theorem 7.9. Here RΓ_logdR(𝔛/O_C)⊗^L_{O_C}O_C/p^n≃RΓ(𝔛_{O_C/p^n},Ω^•_log) because 𝔛 is O_C-flat and the sheaves Ω^j_{𝔛/O_C,log} are locally free (CK Theorem 7.12). The proof is parallel to that of CK Theorem 7.9 and does not use its conclusion. The formula over O_K is not in CK. It follows from CK §7.10: for a discrete valuation ring O_K with e=length_{O_K}(O_K/p), v_{O_K}(O_K/π^m)=m/e, and both v_{O_K} and length are additive.

**Check.** For O_K/(π), normalized length is 1/e, not 1 when e>1.

**Source.** CK, §7.10, p.71; CK, §7.10, Fitting ideal, p.71; CK, Lemma 7.11, p.71; CK, Theorem 7.12, p.71; CK, Theorem 7.12, proof, p.71; BMS1, Proposition 3.24, p.258.

### de-rham-lattice-functor — The de Rham lattice attached to an étale lattice

Target `AInfCohomology:AI.6/de-rham-lattice-functor` (construction).

**Statement.** Let K, C and G be as in the hypotheses. (a) A Breuil–Kisin–Fargues G-module is a Breuil–Kisin–Fargues module (M,φ_M) (AI.2) with an A_inf-semilinear G-action on M for which φ_M is G-equivariant; morphisms are the G-equivariant morphisms of Breuil–Kisin–Fargues modules. Its étale realization M_ét=(M⊗_{A_inf}W(C^♭))^{φ_M⊗φ=1} carries the induced Z_p-linear G-action. (b) (CK Proposition 8.4) The functor (M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺) is an equivalence from the category of A_inf-free Breuil–Kisin–Fargues G-modules to the category of pairs (T,Ξ), where T is a finite free Z_p-module with a G-action and Ξ⊂T⊗_{Z_p}B_dR is a G-stable B_dR⁺-lattice. (c) Let T be a finite free Z_p-module with a continuous G-action such that T[1/p] is de Rham, and D_dR(T)=(T⊗_{Z_p}B_dR)^G, so that T⊗_{Z_p}B_dR≃D_dR(T)⊗_K B_dR G-equivariantly. Then D_dR(T)⊗_K B_dR⁺ is a G-stable B_dR⁺-lattice in T⊗_{Z_p}B_dR, and M(T) is the A_inf-free Breuil–Kisin–Fargues G-module corresponding under (b) to the pair (T, D_dR(T)⊗_K B_dR⁺). It depends functorially on T. (d) The de Rham realization M(T)_dR=M(T)⊗_{A_inf,θ}O_C is an O_C-lattice in (M(T)⊗_{A_inf}B_dR⁺)/ξ≃(D_dR(T)⊗_K B_dR⁺)/ξ≃D_dR(T)⊗_K C, and L_dR(T)=(M(T)_dR)^G is an O_K-lattice in the K-vector space D_dR(T), functorial in T. (e) (CK Example 8.6) For X proper and smooth over K, a K-scheme or a rigid space over K viewed as an adic space, put L^i_ét(X)=H^i_ét(X_{K̄},Z_p)/torsion≃H^i_ét(X_C,Z_p)/torsion for i≥0. Then L^i_ét(X)[1/p] is de Rham and D_dR(L^i_ét(X))≃H^i_dR(X/K) by the de Rham comparison (6.7.2), functorially in X ((8.6.1)); L^i_dR(X)=L_dR(L^i_ét(X))⊂H^i_dR(X/K) is an O_K-lattice, functorial in X; and for a finite Galois extension K′/K, L^i_dR(X)=(L^i_dR(X_{K′}))^{Gal(K′/K)} inside H^i_dR(X/K)=(H^i_dR(X_{K′}/K′))^{Gal(K′/K)}. Continuity of the G-action on M(T) and the equality L_dR(T)⊗_{O_K}O_C=M(T)_dR are not asserted.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀; C is the completion of K̄ and G=Gal(K̄/K) acts continuously on C and on A_inf; φ and θ are G-equivariant and the ideals (ξ), (φ(ξ)) and (μ) of A_inf are G-stable (CK §8.1). In (c) and (d): T is a finite free Z_p-module with a continuous G-action whose rationalisation T[1/p] is a de Rham representation of G (CK §8.5). In (e): X is proper and smooth over K (CK Example 8.6).

**Dependencies.** `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/bkf-valid-operations`; `AInfCohomology:AI.2/bkf-etale-realization`; `AInfCohomology:AI.2/fargues-classification`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`; `AInfCohomology:AI.6/smooth-integral-bdr-agreement`; `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`; `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`; `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`; `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`; `PadicHodgeTheory:R06.1/tate-sen-theorem`.

**Proof or construction.** Imported from AI.2 (CK §8.2): for a Breuil–Kisin–Fargues module M, the étale realization M_ét is a finitely generated Z_p-module with M⊗_{A_inf}W(C^♭)≃M_ét⊗_{Z_p}W(C^♭) and M⊗_{A_inf}A_inf[1/μ]≃M_ét⊗_{Z_p}A_inf[1/μ] (BMS1 Lemma 4.26); hence M⊗_{A_inf}B_dR≃M_ét⊗_{Z_p}B_dR, and M⊗_{A_inf}B_dR⁺ is a B_dR⁺-lattice in it because M[1/p] is free. Fargues’ theorem (BMS1 Theorem 4.28): (M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺) is an equivalence from A_inf-free Breuil–Kisin–Fargues modules to pairs (T,Ξ). Equivariant form (CK §8.3, Proposition 8.4): G acts on A_inf, W(C^♭) and B_dR⁺ compatibly with φ and θ (CK §8.1). A semilinear G-action on M commuting with φ_M is a compatible family of isomorphisms between M and its twists by the elements of G; Fargues’ equivalence is compatible with these twists by transport of structure, so it gives the equivalence with pairs carrying a G-action. CK’s proof is the one sentence that the claim follows from §8.2. Construction of M(T) (CK §8.5): D_dR(T) and the G-equivariant isomorphism T⊗_{Z_p}B_dR≃D_dR(T)⊗_K B_dR for de Rham T[1/p] are imported (AI.6 canonical deformation for the geometric case (6.7.2); the general formalism of de Rham representations has no supplier among the prerequisites). With the canonical G-equivariant map K→B_dR⁺ of AI.0:period-comparison, D_dR(T)⊗_K B_dR⁺ is a G-stable B_dR⁺-lattice; define M(T) by Proposition 8.4. Functoriality: a G-equivariant Z_p-linear map T→T′ induces D_dR(T)→D_dR(T′), so it carries the lattice into the lattice and is a morphism of pairs. De Rham realization (CK §8.5): M(T) is A_inf-free, so M(T)⊗_{A_inf,θ}O_C is a free O_C-module and an O_C-lattice in M(T)⊗_{A_inf,θ}C=(M(T)⊗_{A_inf}B_dR⁺)/ξ; this is identified with D_dR(T)⊗_K C through B_dR⁺/ξ=C and K→B_dR⁺→C. All maps are G-equivariant because θ is G-equivariant and (ξ) is G-stable. L_dR(T) is an O_K-lattice. CK state the functorial O_K-lattice conclusion without an argument. Argument: (D_dR(T)⊗_K C)^G=D_dR(T) because C^G=K (Ax–Sen–Tate; PadicHodgeTheory:R06.1/ax-sen-tate-invariants), so L_dR(T)=M(T)_dR∩D_dR(T). Choose an O_K-lattice L_0 of D_dR(T). Two O_C-lattices of one finite-dimensional C-vector space are commensurable, so p^N(L_0⊗_{O_K}O_C)⊂M(T)_dR⊂p^{−N}(L_0⊗_{O_K}O_C) for some N, and (L_0⊗_{O_K}O_C)∩D_dR(T)=L_0 because O_C∩K=O_K. Hence p^N L_0⊂L_dR(T)⊂p^{−N}L_0; as O_K is a discrete valuation ring, L_dR(T) is a free O_K-module of rank dim_K D_dR(T)=rank_{Z_p}T. The inclusion L_dR(T)⊗_{O_K}O_C⊂M(T)_dR can be strict (see the tests). Example 8.6: the de Rham comparison (6.7.2) for X proper and smooth over K, functorial in X, G-equivariant and compatible with filtrations, is imported from AI.6 canonical deformation (Scholze; BMS1 Theorem 13.1 and Remark 13.20). It shows that L^i_ét(X)[1/p] is de Rham and gives (8.6.1). Define L^i_dR(X)=L_dR(L^i_ét(X)); functoriality in X follows from that of (6.7.2) and of T↦L_dR(T). The identification of the étale cohomology of X_{K̄} and of X_C is used as in CK. Finite Galois extensions: for K′/K finite Galois inside K̄ and G′=Gal(K̄/K′), D_dR for G′ is K′⊗_K D_dR(T) (Galois descent for K′/K), so the lattice D_dR(T)⊗_K B_dR⁺ and the Breuil–Kisin–Fargues module M(T) are the same for G and for G′, the G′-action being the restriction. Taking invariants in two stages gives L_dR(T)=(L_dR(T|_{G′}))^{Gal(K′/K)}. CK state this consequence of the definition for L^i_dR(X). Tate twists (not in CK; they follow from the above): the functor to pairs and D_dR on de Rham representations are compatible with tensor products, so M(T⊗T′)≃M(T)⊗_{A_inf}M(T′) by Proposition 8.4. For T=Z_p(1) with basis ε and t=log[ε], D_dR=K·(t^{−1}⊗ε) and the lattice is ξ^{−1}(Z_p(1)⊗B_dR⁺), which is the pair of A_inf{1}=μ^{−1}(A_inf⊗Z_p(1)) (BMS1 Example 4.24 and the sentence after Remark 4.29; AI.2). Hence M(T(n))≃M(T){n}. Since t/μ=1−μ/2+μ²/3−… in B_dR⁺ and θ(μ)=0, the generator μ^{−1}⊗ε reduces to t^{−1}⊗ε in D_dR(Q_p(1))⊗_K C; so L_dR(Z_p(1))=O_K·(t^{−1}⊗ε), and L_dR(T(n))=L_dR(T)·(t^{−n}⊗ε^{⊗n}) because t^{−n}⊗ε^{⊗n} is G-invariant.

**Uses.**

- CK Theorem 8.7: For a semistable formal model with H^i and H^{i+1} of log de Rham cohomology free, M(L^i_ét) is identified with H^i_Ainf and L^i_dR with the log de Rham cohomology of the model; the characterisation of M(T) by its pair is what is applied.
- CohomologyComparisons:CP.5: Lattice applications use the O_K-lattice L_dR(T) attached to the étale lattice T and its independence of the model.

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

**Definition tests.**

- `Semistable.deRhamLatticeFunctor.trivial` (degenerate): For T=Z_p with trivial action: D_dR(T)=K, the pair is (Z_p,B_dR⁺), M(T)=A_inf with φ the Frobenius of A_inf and the natural G-action, M(T)_dR=O_C⊂C, and L_dR(T)=(O_C)^G=O_K⊂K.
- `Semistable.deRhamLatticeFunctor.cyclotomic` (computation): For T=Z_p(1) with basis ε and t=log[ε]: D_dR(T)=K·(t^{−1}⊗ε), the lattice is ξ^{−1}(T⊗_{Z_p}B_dR⁺), M(T)=A_inf{1}=μ^{−1}(A_inf⊗_{Z_p}Z_p(1)), M(T)_dR=O_C·(t^{−1}⊗ε) because θ(t/μ)=1, and L_dR(Z_p(1))=O_K·(t^{−1}⊗ε); dually L_dR(Z_p(−1))=O_K·(t⊗ε^∨). The generator does not depend on the choice of ε. A definition using the lattice T⊗_{Z_p}B_dR⁺ instead of D_dR(T)⊗_K B_dR⁺ would give M=A_inf⊗T and no G-invariants at all.
- `Semistable.deRhamLatticeFunctor.ramified_quadratic` (computation): Let π be a uniformizer of K, K′=K(√π) and T=Z_p·e with G acting through the quadratic character η of K′/K. Then D_dR(T)=K·(√π⊗e), D_dR(T)⊗_K B_dR⁺=T⊗_{Z_p}B_dR⁺ because √π is a unit of B_dR⁺, M(T)=A_inf⊗_{Z_p}T with the diagonal action, M(T)_dR=O_C⊗T, and L_dR(T)=O_K·(√π⊗e). So L_dR(T)⊗_{O_K}O_C=√π·M(T)_dR is strictly smaller than M(T)_dR, and L_dR(T)=(O_{K′}⊗T)^{Gal(K′/K)} as the compatibility with K′/K predicts.
- `Semistable.deRhamLatticeFunctor.not_de_rham` (non-example): If T[1/p] is not de Rham then dim_K(T⊗_{Z_p}B_dR)^G<rank_{Z_p}T, so D⊗_K B_dR⁺ is a B_dR⁺-lattice of T⊗_{Z_p}B_dR for no K-subspace D of (T⊗_{Z_p}B_dR)^G, and M(T) is not defined. Example: K contains the 2p-th roots of unity, s∈Z_p is not an integer and T=Z_p(χ^s) for the cyclotomic character χ; then χ^{s+n} has infinite image on inertia for every integer n, so (T⊗_{Z_p}B_dR)^G=0 by the theorem of Tate and Sen on the invariants of C(η).

**Check.** M(T) is determined up to unique isomorphism by three properties: it is an A_inf-free Breuil–Kisin–Fargues G-module, its étale realization is T G-equivariantly, and M(T)⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺ inside T⊗_{Z_p}B_dR. This is the form in which CK Theorem 8.7 uses it. The lattice property of L_dR(T) is proved, not only asserted; the proof uses C^G=K. The construction is defined only when T[1/p] is de Rham, and L_dR(T)⊗_{O_K}O_C=M(T)_dR is not part of it: it fails for the ramified quadratic character of the tests. The pair uses the covariant D_dR(T)=(T⊗_{Z_p}B_dR)^G and the lattice D_dR(T)⊗_K B_dR⁺, and the de Rham realization is taken along θ, not along θ̃=θ∘φ_A⁻¹; with these conventions L_dR(Z_p(1))=O_K·(t^{−1}⊗ε).

**Source.** CK, §8.1, p.72; CK, §8.1, Galois action, p.72; CK, §8.2, étale realization, p.72; CK, §8.2, Fargues’ theorem, p.72; CK, §8.3, p.72; CK, Proposition 8.4, p.73; CK, Proposition 8.4, proof, p.73; CK, §8.5, hypotheses on T, p.73; CK, §8.5, M(T), p.73; CK, §8.5, de Rham realization, p.73; CK, §8.5, the O_K-lattice, p.73; CK, Example 8.6, p.73; CK, Example 8.6, (8.6.1), p.73; CK, Example 8.6, finite Galois extensions, p.73; BMS1, Lemma 4.26, p.278; BMS1, Theorem 4.28, p.279; BMS1, Example 4.24, p.276; BMS1, §4.3, sentence after Remark 4.29, p.280.

### model-independent-lattice — Model-independent logarithmic de Rham lattice

Target `AInfCohomology:AI.6/model-independent-lattice` (theorem).

**Statement.** Let 𝔛₀/O_K be proper, flat, p-adic, with its divisorial log structure and with an étale cover by affines, each étale over Spf O_K{t_0,…,t_d}/(t_0⋯t_r−π′) for a nonzero nonunit π′∈O_K, where d, r and π′ may depend on the affine. If H_logdR^i(𝔛₀/O_K) and H_logdR^{i+1}(𝔛₀/O_K) are both O_K-free, then T=H_ét^i(X_C,Z_p) is Z_p-free. Let M(T) and L_dR(T) be the Breuil–Kisin–Fargues G_K-module and the O_K-lattice of de-rham-lattice-functor, attached to the pair (T, D_dR(T)⊗_K B_dR⁺⊂T⊗_{Z_p}B_dR), where D_dR(T)=(T⊗_{Z_p}B_dR)^{G_K} is identified with H_dR^i(X_K/K) by the de Rham comparison (6.7.2). Then M(T) identifies with H_A^i(𝔛₀⊗̂O_C) as a Breuil–Kisin–Fargues G_K-module, and L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K} equals H_logdR^i(𝔛₀/O_K) inside H_dR^i(X_K/K); in the notation of de-rham-lattice-functor, L^i_dR(X_K)=H_logdR^i(𝔛₀/O_K). Two models of the same generic fibre satisfying these hypotheses therefore give the same lattice.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀; C is the completion of K̄ and G_K=Gal(K̄/K) acts continuously on C and on A_inf (CK §8.1). Both adjacent degrees i and i+1 are free; M(T) and L_dR(T) are those of de-rham-lattice-functor.

**Dependencies.** `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/freeness-criterion`; `AInfCohomology:AI.6/cohomological-bkf`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.6/etale-bdr-agreement`; `AInfCohomology:AI.6/de-rham-lattice-functor`; `CrystallineCohomology:CR.5`; `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`; `AInfCohomology:AI.6/smooth-integral-bdr-agreement`; `AInfCohomology:AI.6/aomega`; `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`.

**Proof or construction.** Working locally one may replace t_i by t_i^{±1} for r<i≤d, so 𝔛=𝔛₀⊗̂_{O_K}O_C satisfies the chart hypotheses of CK §1.5. By the Grothendieck comparison theorem and flat base change (CK Remark 4.19; CR.5), H_logdR^j(𝔛/O_C)≃H_logdR^j(𝔛₀/O_K)⊗_{O_K}O_C for j=i and j=i+1, hence H_logdR^j(𝔛₀/O_K)=(H_logdR^j(𝔛/O_C))^{G_K} ((8.7.4)). The passage to invariants uses (O_C)^{G_K}=O_K, that is, the theorem of Ax–Sen–Tate C^{G_K}=K (PadicHodgeTheory:R06.1/ax-sen-tate-invariants, stated there for K finite over Q_p with the general case in its hypotheses), which CK do not cite. By freeness-criterion (CK Proposition 7.7) in degrees i and i+1, H_A^i(𝔛) and H_A^{i+1}(𝔛) are A_inf-free; by cohomological-bkf, with the semilinear action of G_K of aomega (API item semilinear) and its compatibility with Frobenius stated there, they are Breuil–Kisin–Fargues G_K-modules in the sense of de-rham-lattice-functor (CK §§8.1, 8.3). By (7.6.2) of degreewise-specializations and the Frobenius-compatibility and G_K-equivariance of etale-comparison, the étale realization of H_A^i(𝔛) is H_ét^i(X_C,Z_p), G_K-equivariantly; so T is Z_p-free. By etale-bdr-agreement (CK Proposition 6.8), the B_dR-base change of this identification equals the composite of bdr-comparison ((6.6.2)), AI.6 canonical deformation’s identification (6.2.8) (BMS1 Remark 13.20) and the de Rham comparison (6.7.2). Hence the B_dR⁺-lattice H_A^i(𝔛)⊗_{A_inf}B_dR⁺ of T⊗_{Z_p}B_dR is D_dR(T)⊗_K B_dR⁺, with D_dR(T)≃H_dR^i(X_K/K) ((8.6.1)). So H_A^i(𝔛) is an A_inf-free Breuil–Kisin–Fargues G_K-module with étale realization T and B_dR⁺-lattice D_dR(T)⊗_K B_dR⁺, and the characterisation of M(T) in de-rham-lattice-functor (CK Proposition 8.4 and §8.5) gives M(T)≃H_A^i(𝔛), which is (8.7.3). Under this identification, by the compatibility modulo ξ in bdr-comparison (CK Theorem 6.6) and the sentence after (6.2.8), the identifications of M(T)⊗_{A_inf,θ}C and of H_A^i(𝔛)⊗_{A_inf,θ}C with H_dR^i(X_C^ad/C) agree. Since H_A^{i+1}(𝔛) is free, (7.6.3) gives H_A^i(𝔛)⊗_{A_inf,θ}O_C=H_logdR^i(𝔛/O_C) inside H_dR^i(X_C^ad/C). Taking G_K-invariants and using the first step gives (8.7.2) (CK Theorem 8.7). Model independence: by de-rham-lattice-functor, L_dR(T)=L^i_dR(X_K) depends only on T with its G_K-action, hence only on the generic fibre (CK Example 8.6, (8.6.2)).

**Check.** Model independence is not asserted for arbitrary torsion models or for arbitrary torsion-free quotients.

**Source.** CK, Theorem 8.7, p.74; CK, Theorem 8.7, freeness hypothesis, p.74; CK, §8.1, p.72; CK, Example 8.6, (8.6.2), p.73; CK, §8, introduction, p.72.

### nodal-conic — Nodal conic and good reduction model test

Target `AInfCohomology:AI.6/nodal-conic` (application).

**Statement.** For a uniformizer π of O_K, the proper conic 𝔛₀=Proj O_K[X,Y,Z]/(XY−πZ²), p-adically completed, is flat and semistable. Its special fibre is two projective lines meeting at one node; its generic fibre is a smooth rational curve. The log de Rham groups are O_K,0,O_K in degrees 0,1,2 and zero otherwise. Its A_inf groups are A_inf,0,A_inf{−1}, with the corresponding logarithmic/Witt specializations. The degree-0 and degree-2 lattices agree with a smooth P¹ model under a fixed generic-fibre identification, by model-independent-lattice. This nodal genus-zero example has N=0; the separate rank-two monodromy algebra test does not claim to be its H¹.

**Hypotheses.** p is a prime and k̄ an algebraically closed field of characteristic p; C is the completed algebraic closure of W(k̄)[1/p]. An embedding p^Q⊂C is fixed as in CK §1.5 (compatible ℓ^n-th roots of p in O_C for every prime ℓ, so that p^q∈O_C and (p^{1/p^∞})^q∈O_C^♭ are defined for q∈Q≥0), and a compatible system ε=(1,ζ_p,ζ_{p²},…) of p-power roots of unity is fixed as in CK §2.1. A_inf=W(O_C^♭), θ, θ̃=θ∘φ_A⁻¹, μ=[ε]−1, ξ=μ/φ_A⁻¹(μ) and ξ̃=φ_A(ξ) are imported from AI.0. 𝔛 denotes a p-adic formal O_C-scheme that étale locally has an étale map to Spf of a chart ring R□=O_C{t₀,…,t_r,t_{r+1}^{±1},…,t_d^{±1}}/(t₀⋯t_r−p^q) with q∈Q>0 (CK (1.5.1)). In arithmetic statements K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, C is the completion of K̄, and the extension W(k₀)→W(k̄) is retained. K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π is a uniformizer of O_K and C is the completion of K̄ (CK §8.1), as model-independent-lattice requires.

**Dependencies.** `AInfCohomology:AI.6/chart-ring`; `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.6/degreewise-specializations`; `AInfCohomology:AI.6/freeness-criterion`; `AInfCohomology:AI.6/model-independent-lattice`; `AInfCohomology:AI.6/de-rham-lattice-functor`; `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/bkf-valid-operations`; `AInfCohomology:AI.2/bkf-etale-realization`; `AInfCohomology:AI.2/fargues-classification`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `CrystallineCohomology:CR.5`.

**Proof or construction.** Check the node chart x y=π on Z≠0 and the two smooth charts at infinity using chart-ring/divisorial-log. Compute the log de Rham cohomology directly. Ω¹_log of 𝔛₀ over O_K is an invertible sheaf, generated at the node by dlog x=−dlog y and on the two smooth charts by the differential of the coordinate; it is the relative dualizing sheaf ω (CR.5). The special fibre is the union of two lines L₁, L₂ over k₀ meeting in one point: the sequence 0→O→O_{L₁}⊕O_{L₂}→k₀→0 gives H⁰(O)=k₀ and H¹(O)=0, and ω restricts to O(−1) on each line, so H⁰(ω)=0 and, by duality, H¹(ω)=k₀. The generic fibre is P¹_K and has the same dimensions, so by cohomology and base change for the proper flat curve H⁰(O)=O_K, H¹(O)=0, H⁰(ω)=0 and H¹(ω)≅O_K. The Hodge–de Rham spectral sequence then has E₁^{0,1}=E₁^{1,0}=0, and the log de Rham groups are O_K, 0, O_K in degrees 0, 1, 2. The inputs of this step (the normalization exact sequence for the two components, Serre duality, cohomology and base change, and the identification of Ω¹_log with ω) have no supplier among the prerequisites. Apply freeness-criterion and degreewise-specializations for the freeness and the ranks of the A_inf groups. Apply model-independent-lattice, (8.7.3), in degrees 0 and 2, and the cases M(Z_p)=A_inf and M(Z_p(−1))=A_inf{−1} of de-rham-lattice-functor (its trivial and Tate-twist computations; A_inf{−1} is AI.2’s Tate twist) to identify the Breuil–Kisin–Fargues structures; degree 3 vanishes, so the hypothesis on degree i+1 holds for i=2. The common lattices are L⁰_dR(P¹_K)=O_K and L²_dR(P¹_K)=L_dR(Z_p(−1))=O_K·(t⊗ε^∨).

**Check.** The H¹ group is zero despite the special-fibre node; no nonzero monodromy is inferred merely from singular reduction.

**Source.** CK, §1.5, (1.5.1), p.4; CK, §1.5, (1.5.3), p.4; CK, Proposition 7.7, p.70; CK, Theorem 8.7, p.74; BMS1, §4.3, sentence after Remark 4.29, p.280.

### bdr-tate-thickenings — Finite infinitesimal Tate thickenings

Target `AInfCohomology:AI.6/bdr-tate-thickenings` (theorem).

**Statement.** For n≥1 a complete Tate B_dR⁺/ξ^n-algebra B is topologically of finite type iff B/ξ is topologically of finite type over C. Such B is strongly noetherian and every ideal is closed. A p-complete p-torsion-free A_inf/ξ^n-algebra B_0 of topologically finite type is coherent; any ideal I with B_0/I p-torsion-free is finitely generated. Its p-localization is a topologically finite-type Tate algebra, and every B as above admits such a ring of definition. Strong noetherianity means noetherianity after adjoining each finite set of Tate variables.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. n≥1; finite type always means topological finite type for the displayed Tate or p-adic topology.

**Dependencies.** `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`; `AInfCohomology:AI.0/coherent-square-zero-extension`; `AInfCohomology:AI.0/witt-finite-presentation-devissage`; `AdicSpacesPartII:R0`.

**Proof or construction.** Induct on n through square-zero ξ-extensions of the Tate C-algebra. Adjoining more Tate variables proves the strong form. For integral rings use coherent square-zero extension and bounded ξ-torsion. Construct a ring of definition as the image of A_inf/ξ^n⟨X_i⟩, then use finite generation of I∩B_0 to prove closedness of I.

**Check.** n=1 recovers the finite-type Tate C-algebra theorem. Noetherianity is asserted for the rational finite-level Tate rings, not for A_inf or O_C.

**Source.** bms1-v3, Lemma 13.4(i–iv) and proof, printed pp.105–106; CK, §6.2, p.60, application of BMS1 Lemma 13.4(ii).

### bdr-infinitesimal-envelope — Infinitesimal envelope of a very small affinoid

Target `AInfCohomology:AI.6/bdr-infinitesimal-envelope` (construction).

**Statement.** For very small R and Σ put P_Σ=lim_n(B_dR⁺/ξ^n)⟨X_u^{±1}:u∈Σ⟩, with e_Σ:P_Σ→R sending X_u to u. Define D_Σ(R)=lim_m P_Σ/(ker e_Σ)^m with the induced inverse-limit topology. The commuting logarithmic derivations ∂_u=X_u∂/∂X_u extend continuously; their cohomological Koszul complex is denoted Ω^•_{D_Σ(R)/B_dR⁺}. This is completion at the full embedding ideal, including the relations between the coordinates. It is not merely ξ-completion of P_Σ.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. R is a smooth complete Tate C-algebra. It is very small: finite units T_1,…,T_d∈Σ⊂(R°)× give a surjection C⟨X_u^{±1}:u∈Σ⟩→R, and the T_i map to the torus factors as rational embeddings and a finite étale map. Σ may be enlarged.

**Dependencies.** `AInfCohomology:AI.6/bdr-tate-thickenings`; `mathlib:AdicCompletion`; `DerivedDeRhamCohomology:DD.1/koszul-complex`; `AdicSpacesPartII:R0`.

**Proof or construction.** Closedness of all finite-level embedding ideals gives a complete separated topological algebra after taking both limits. A derivation carries the m-th power of the embedding ideal into its (m−1)-st power, so it extends continuously. Import the generic commuting-endomorphism Koszul signs from DD.1.

**Uses.**

- AInfCohomology:AI.6/bdr-envelope-contraction: Gives the local complex whose redundant variables are contracted.
- AInfCohomology:AI.6/canonical-bdr-etale-map: Supplies the degree-zero Teichmüller coordinate map.

**API.**

- `AInf.bdr_infinitesimal_envelope.coordinates` (projection): The continuous coordinate map P_Σ→D_Σ(R) followed by augmentation gives X_u↦u.
- `AInf.bdr_infinitesimal_envelope.universal_map` (universal-property): A continuous P_Σ-algebra map into a separated complete target for the image embedding ideal extends uniquely to D_Σ(R), compatibly with all quotient projections.
- `AInf.bdr_infinitesimal_envelope.enlarge` (functoriality): For Σ⊂Σ′ satisfying the same very-small conditions, adjoining the additional coordinates gives the compatible envelope and de Rham-complex map.
- `AInf.bdr_infinitesimal_envelope.derivations` (relation): ∂_u(X_v)=δ_uv X_v, the ∂_u commute, and their Koszul differential squares to zero.

**Definition tests.**

- `bdr_infinitesimal_envelope_point` (degenerate): For R=C and Σ empty, P_Σ=B_dR⁺, ker e=(ξ), D_Σ(C)=B_dR⁺ and the complex is concentrated in degree zero.
- `bdr_infinitesimal_envelope_extra_coordinate` (non-example): For R=C and an added unit a, the embedding ideal includes X_a−a_lift as well as ξ; ξ-completion alone does not complete that direction.
- `bdr_infinitesimal_envelope_torus` (computation): For the d-dimensional torus with its standard coordinates, ∂_i(X_j)=δ_ij X_j and the degree-one differential is the usual sum of logarithmic derivatives.
- `bdr_infinitesimal_envelope_transition` (compatibility): The augmentations for Σ⊂Σ′ commute with the coordinate map and the common residue projection to R.

**Check.** The coordinate relation ideal is part of the completion. The complex uses logarithmic derivatives indexed by all Σ; embedding independence uses bdr-envelope-contraction.

**Source.** bms1-v3, Definition 13.5 and Construction 13.6, printed p.106.

### bdr-envelope-normal-form — Smooth lifts and envelope normal form

Target `AInfCohomology:AI.6/bdr-envelope-normal-form` (theorem).

**Statement.** After enlarging Σ, choose a smooth affinoid base A over W(k′)[1/p], a smooth Tate A-algebra R_A and R≅R_A⊗̂_A C as in BMS1 Lemma 13.7, with torus coordinates and the chosen units descending. Lift A→C to A→B_dR⁺. Then R_A⊗̂_A B_dR⁺ is ξ-complete, flat over B_dR⁺, and its ξ^n quotient is R_A⊗̂_A(B_dR⁺/ξ^n), topologically free over B_dR⁺/ξ^n. For sufficiently large Σ there is an augmented topological isomorphism D_Σ(R)≅(R_A⊗̂_A B_dR⁺)[[X_u−ũ: u∈Σ∖{T_1,…,T_d}]], where ũ are chosen lifts of u and X_{T_i} maps to T_i. In particular the envelope is ξ-torsion-free and ξ-complete. The isomorphism depends on the lift; the final cohomology does not.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. R is a smooth complete Tate C-algebra. It is very small: finite units T_1,…,T_d∈Σ⊂(R°)× give a surjection C⟨X_u^{±1}:u∈Σ⟩→R, and the T_i map to the torus factors as rational embeddings and a finite étale map. Σ may be enlarged. The approximation data have all properties of Lemma 13.7, including a descent of sufficiently large unit sets and compatibility of the torus coordinates.

**Dependencies.** `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AdicEtaleGeometry:A1`; `AdicSpacesPartII:R0`; `AInfCohomology:AI.0/local-power-series-flatness`.

**Proof or construction.** Approximate the finitely many equations, étale presentation and units to obtain Lemma 13.7 data. The lift exists by smoothness of A and ξ-adic completeness. For Lemma 13.11, remove bounded p-torsion in an algebraic model, choose a valuation-ring basis, then complete; record the Raynaud–Gruson free-model input as a supplier contract. Extend the formally étale torus lift into the completed envelope. Its inverse is the coordinate map in the displayed power series ring. Check both compositions on the algebraic model and by continuity.

**Check.** The normal form retains the relative ξ-complete coefficient lift, not just R[[variables]]. Choice independence is deferred to the common-envelope contraction, rather than claimed for these lifts.

**Source.** bms1-v3, Lemma 13.7, printed pp.106–108; Lemmas 13.11–13.12, pp.109–111.

### bdr-envelope-contraction — Embedding independence and de Rham reduction

Target `AInfCohomology:AI.6/bdr-envelope-contraction` (theorem).

**Statement.** The natural maps Ω^•_{D_Σ(R)/B_dR⁺}⊗^L C→Ω^•_{D̃_Σ(R)/C}←Ω^{•,cont}_{R/C} are quasi-isomorphisms, where D̃_Σ(R) completes (D_Σ(R)/ξ)⊗̂_C R at its augmentation to R. For a smooth lift R_A the analogous common-envelope maps identify Ω^•_{D_Σ(R)/B_dR⁺} with Ω^{•,cont}_{R_A/A}⊗̂_A B_dR⁺. Consequently an enlargement Σ⊂Σ′ of sufficiently large unit sets induces a quasi-isomorphism of the envelope de Rham complexes. The comparison for two different lifts uses a common further envelope; it does not make the normal-form isomorphism canonical.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. R is a smooth complete Tate C-algebra. It is very small: finite units T_1,…,T_d∈Σ⊂(R°)× give a surjection C⟨X_u^{±1}:u∈Σ⟩→R, and the T_i map to the torus factors as rational embeddings and a finite étale map. Σ may be enlarged. Use the lift and the ξ-torsion-free complete envelopes of bdr-envelope-normal-form; Σ and Σ′ are sufficiently large for Lemmas 13.12–13.13.

**Dependencies.** `AInfCohomology:AI.6/bdr-envelope-normal-form`; `EnhancedDerivedSheaves:E4/mod-ideal-detection`; `DerivedDeRhamCohomology:DD.1/koszul-complex`.

**Proof or construction.** The common envelope has two power-series presentations. Contract each redundant formal de Rham direction in characteristic zero; all divisions are by nonzero integers in C or B_dR⁺. Reduction modulo ξ proves the maps are equivalences. Derived ξ-completeness upgrades the reduction to the coefficient lift. Use the same comparison diagram for enlargements or two lifts.

**Check.** For a point with an extra unit coordinate the extra formal de Rham direction is contractible. The local mod-ξ target has the ordinary de Rham differential; it is not just a graded direct sum of forms.

**Source.** bms1-v3, Lemma 13.13 and proof, printed pp.111–112.

### canonical-bdr-deformation — Canonical B_dR⁺ cohomology of the generic fibre

Target `AInfCohomology:AI.6/canonical-bdr-deformation` (construction).

**Statement.** For a smooth adic X/C, define the presheaf on very small smooth affinoids by R↦colim_Σ Ω^•_{D_Σ(R)/B_dR⁺}. Take its hypercohomology K_dR⁺(X) in the shared enhancement. For proper X this is the BMS1 RΓ_crys(X/B_dR⁺); it is derived ξ-complete, perfect, and K_dR⁺(X)⊗^L C≃RΓ_dR(X/C). Its definition uses no choice of a lift of X to B_dR⁺. The analytic-site construction agrees with the étale-site and nonunit-coordinate extension planned in the imported semistable target.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. For construction X is smooth; properness is imposed for perfectness and finiteness. Use the very-small analytic basis and hyperdescent. Coherent proper cohomology and topology comparison come from AdicSpacesPartII R3.

**Dependencies.** `AInfCohomology:AI.6/bdr-envelope-contraction`; `AdicEtaleGeometry:A1`; `AdicSpacesPartII:R3`; `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`; `EnhancedDerivedSheaves:E4/mod-ideal-detection`.

**Proof or construction.** Take the strictly functorial filtered colimit over embeddings and compute hypercohomology on a basis. Glue the de Rham reduction. Derived ξ-completeness and finite-dimensional bounded proper de Rham cohomology give a perfect lift; finite freeness is a further theorem.

**Uses.**

- AInfCohomology:AI.6/bdr-comparison: This is the canonical generic-fibre target of CK Theorem 6.6.
- AInfCohomology:AI.6/model-independent-lattice: The deformation lattice is constructed from the generic fibre before comparing any semistable model.

**API.**

- `AInf.canonical_bdr_deformation.local_model` (compatibility): On a very small affine, the presheaf is the colimit of the envelope complexes, and each sufficiently large Σ maps by a quasi-isomorphism to that colimit.
- `AInf.canonical_bdr_deformation.pullback` (functoriality): A morphism of smooth C-spaces induces the cohomological pullback compatible with the common-envelope coordinate maps.
- `AInf.canonical_bdr_deformation.reduction` (compatibility): Derived extension along B_dR⁺→C gives RΓ_dR(X/C). The degreewise identification requires the freeness theorem.
- `AInf.canonical_bdr_deformation.products` (structure): The wedge products and unit on the completed envelope de Rham complexes induce the compatible multiplication on hypercohomology.

**Definition tests.**

- `canonical_bdr_deformation_point` (computation): The zero-dimensional point gives B_dR⁺, not C, before residue reduction.
- `canonical_bdr_deformation_torus_reduction` (computation): The local torus complex reduces to the logarithmic de Rham complex with differential d(T^n)=nT^n dlog T.
- `canonical_bdr_deformation_redundant_embedding` (compatibility): Adding a redundant unit coordinate induces an equivalent local complex by the common-envelope contraction.
- `canonical_bdr_deformation_cohomology_not_graded` (non-example): For a nonproper torus one retains its de Rham complex; the definition does not replace it by a sum of its forms or assert proper finite freeness.

**Check.** K_dR⁺(Spa(C,O_C))=B_dR⁺ in degree zero. Perfectness alone is not used as a proof that every cohomology group is free.

**Source.** bms1-v3, Definitions 13.14 and 13.18, printed pp.112,114; CK, §6.2, (6.2.4)–(6.2.7), pp.60–61.

### proper-smooth-spreading — Proper smooth spreading out for the deformation

Target `AInfCohomology:AI.6/proper-smooth-spreading` (theorem).

**Statement.** A proper smooth rigid X/C is a C-valued fibre of a proper smooth morphism of smooth rigid spaces over a complete discretely valued subfield K⊂C with the same residue field. More generally a proper rigid X/C spreads to a proper flat family. The formal input is: for complete noetherian local (W,m), an m-complete local W-algebra O with zero-dimensional O/mO and residue k, every proper flat adic formal X_O/O descends to a proper flat adic formal X_R over a complete noetherian local W-algebra R with residue k and a map R→O. Smoothness is obtained by shrinking only after proper flat descent.

**Hypotheses.** C/K complete nonarchimedean fields with equal residue field; C as above for the discretely valued-subfield choice. The formal input uses m-adic topology on O and maximal-ideal topology on R, and proper flatness, not only a proper special fibre.

**Dependencies.** `AdicSpacesPartII:R2/raynaud-theorem`; `AdicSpacesPartII:R2/admissible-blow-up`; `AdicSpacesPartII:R3`.

**Proof or construction.** Use the versal deformation of the proper special fibre, extend its formally smooth classifying functor from artinian rings to local zero-dimensional rings by filtered colimits, and lift compatible maps R→O/m^nO. This deformation input is the precise supplier extension in G-BDR-SPREAD. Take the inverse limit of the compatible isomorphisms; use proper formal models and generic fibres for rigid spreading. Smoothness is open and allows shrinking the parameter base.

**Check.** Retain the zero-dimensional residue-level hypothesis in the formal statement. The family need not descend to a single K-variety; its base may have positive dimension.

**Source.** bms1-v3, Proposition 13.15 and Corollary 13.16 with proofs, printed pp.112–113.

### canonical-bdr-freeness — Finite freeness of the canonical deformation

Target `AInfCohomology:AI.6/canonical-bdr-freeness` (theorem).

**Statement.** For proper smooth X/C, every H^i(K_dR⁺(X)) is finite free over B_dR⁺ and vanishes outside a bounded range. Base change to C commutes with cohomology and recovers H^i_dR(X/C). If X=X_0⊗̂_K C with X_0/K proper smooth and K complete discretely valued with perfect residue field, the canonical identification is H^i(K_dR⁺(X))≃H^i_dR(X_0/K)⊗_K B_dR⁺ through the continuous lift K→B_dR⁺.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. X proper smooth; the descended identification has the additional hypotheses on X_0 and K.

**Dependencies.** `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AdicSpacesPartII:R3`.

**Proof or construction.** Spread X over a smooth affinoid base A and lift the C-valued point into B_dR⁺. Relative proper de Rham cohomology has an integrable connection and is locally free on the smooth characteristic-zero base. Compare its coefficient extension with K_dR⁺ modulo ξ and use completeness. Finite projective modules over the DVR B_dR⁺ are free. The descended K case is the same construction through its unique continuous lift.

**Check.** For the point the rank is one in degree zero. A general perfect complex over a DVR can have torsion cohomology; the connection/spreading argument is required.

**Source.** bms1-v3, Theorem 13.19 and Remark 13.20, printed p.114.

### canonical-bdr-etale-map — Canonical deformation-to-étale map

Target `AInfCohomology:AI.6/canonical-bdr-etale-map` (construction).

**Statement.** For very small R and Σ, adjoin compatible p-power roots of all its unit coordinates. The resulting perfectoid pro-finite-étale tower has Γ=∏_{u∈Σ}Z_p(1). The degree-zero map D_Σ(R)→B_dR⁺(R_∞,Σ) sends X_u to [u^flat]. Comparing the logarithmic de Rham and continuous Γ-Koszul complexes with the normalized logarithmic operators defines a map K_dR⁺(X)→RΓ_proet(X,B_dR,X⁺). It is independent of Σ and the chosen roots after the common-envelope maps; for proper X the target is RΓ_et(X,Z_p)⊗^L B_dR⁺ by the early primitive comparison.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. R is a smooth complete Tate C-algebra. It is very small: finite units T_1,…,T_d∈Σ⊂(R°)× give a surjection C⟨X_u^{±1}:u∈Σ⟩→R, and the T_i map to the torus factors as rational embeddings and a finite étale map. Σ may be enlarged. The root tower and continuous cochain/Koszul comparison are imported from the corrected site and AI.1. The local operator normalization uses t=log([ε]) in B_dR⁺, a unit multiple of ξ. Rational period-sheaf acyclicity is supplied by P8:local-rational, not used to construct the integral AI.3 sheaf.

**Dependencies.** `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.4/pd-logarithmic-coordinate`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `PadicHodgeTheory:P8:local-rational`; `AdicEtaleGeometry:A1`.

**Proof or construction.** Extend the coordinate Teichmüller map through the embedding-ideal completion. On the common envelope, Γ acts by exp(t∂_u). The divided operator (exp(t∂_u)−1)/∂_u is interpreted as t∑_{n≥0}t^n∂_u^n/(n+1)!, with no inverse derivation. Products of these commuting operators give the degree-indexed Koszul chain map. Use the all-coordinate transition maps to glue. The local map identifies the de Rham complex with η_ξ of the period Koszul complex; after ξ-inversion décalage is the identity.

**Uses.**

- AInfCohomology:AI.6/canonical-bdr-etale-comparison: Gives the actual rational comparison map.
- AInfCohomology:AI.6/etale-bdr-agreement: The CK map is checked against this same coordinate map.

**API.**

- `AInf.canonical_bdr_etale_map.degree_zero` (projection): The degree-zero comparison on coordinates is X_u↦[u^flat], compatible with augmentation to the untilt u.
- `AInf.canonical_bdr_etale_map.normalization` (compatibility): For γ_u=exp(t∂_u), the degree-one correction is t∑t^n∂_u^n/(n+1)!, satisfying F_u∂_u=γ_u−1. All degree-indexed products use the exterior/Koszul signs.
- `AInf.canonical_bdr_etale_map.enlarge` (functoriality): Coordinate enlargements and tower refinements commute with the chain map, so it descends to the canonical presheaf and hypercohomology.
- `AInf.canonical_bdr_etale_map.primitive_target` (compatibility): For proper smooth X, the target agrees with RΓ_et(X,Z_p)⊗^L B_dR⁺ via the early primitive period-sheaf comparison.

**Definition tests.**

- `canonical_bdr_etale_map_point` (degenerate): For the point, the comparison is the identity B_dR⁺→B_dR⁺ in degree zero.
- `canonical_bdr_etale_map_coordinate` (computation): For one torus coordinate, its residue under theta is u and its tower generator acts on [u^flat] by multiplication by [ε].
- `canonical_bdr_etale_map_chain_condition` (computation): On X_u^n, n≠0, F_u∂_u acts by exp(nt)−1=[ε]^n−1, the group-Koszul differential.
- `canonical_bdr_etale_map_inversion` (compatibility): After inverting ξ the local η_ξ comparison becomes an equivalence with the entire period-cochain complex.

**Check.** The degree-zero coordinate map and all higher normalizations belong to the same comparison. An isomorphism of abstract free modules is not a substitute for this canonical map.

**Source.** bms1-v3, Theorem 13.1 proof, printed p.115; comparison with §12.2 and Proposition 12.9, pp.98–103.

### canonical-bdr-etale-comparison — Canonical rational comparison and descended map agreement

Target `AInfCohomology:AI.6/canonical-bdr-etale-comparison` (theorem).

**Statement.** For proper smooth X/C, the canonical map K_dR⁺(X)→RΓ_et(X,Z_p)⊗^L B_dR⁺ becomes an equivalence after ξ-inversion. In the descended K case of canonical-bdr-freeness, this B_dR comparison agrees with Scholze’s de Rham comparison through the common structural-period-sheaf envelope. The CK §6.7 use includes the filtered descended de Rham identification; the general filtered enhancement over C is left to the CohomologyComparisons roadmap.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. X proper smooth; descended comparison requires K complete discretely valued with perfect residue field. For the filtered descended statement use the early P8 structural de Rham comparison with its filtration.

**Dependencies.** `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `PadicHodgeTheory:P8:local-rational`.

**Proof or construction.** The local η_ξ identification proves equivalence after ξ-inversion; use proper finite étale cohomology for the target. Compare the descended lift and the structural period sheaf through D̃_Σ(R_K). The diagram in Theorem 13.1 proves equality of maps. Preserve the filtrations in the descended structural comparison rather than asserting a general filtered theorem not stated in BMS1.

**Check.** The point comparison is the canonical B_dR identity. Integral equality of two B_dR⁺ lattices is not concluded from their equality after ξ-inversion.

**Source.** bms1-v3, Theorem 13.1, printed p.104; proof and comparison diagram, p.115; Remark 13.20, p.114; CK, §6.7, (6.7.1)–(6.7.2), pp.65–66.

### smooth-integral-bdr-agreement — Smooth integral and canonical deformation agreement

Target `AInfCohomology:AI.6/smooth-integral-bdr-agreement` (comparison).

**Statement.** For proper smooth formal 𝔛/O_C with Y=𝔛_{O_C/p} and generic fibre X, the natural map RΓ_crys(Y/A_crys)⊗^L_{A_crys}B_dR⁺→K_dR⁺(X) is an equivalence. After B_dR extension, the AΩ→A_crys comparison and the canonical deformation-to-étale map agree on the common all-coordinate tower. Passage to degreewise crystalline lattices uses the rational crystalline-freeness bridge, not an unproved flat degreewise specialization. Map agreement is checked on the explicit normalized complexes; its proof interior is recorded in G-BDR-MAPS.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. Use the common B_dR⁺ complete DVR, uniformizer ξ, residue map to C and finite-quotient Tate topology; these come from R06.1 and AI.0:period-comparison. 𝔛 proper smooth, not merely semistable; the semistable version is the imported CK Theorem 6.6 target.

**Dependencies.** `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `AInfCohomology:AI.5/rational-crystalline-frobenius`.

**Proof or construction.** Use the same all-coordinate envelopes in the A_crys and B_dR⁺ theories and extend their canonical coordinate maps. Proposition 13.23 identifies the two complexes locally with the smooth-lift de Rham complex. For agreement after inversion compare X_u↦[u^flat] and the logarithmic operator factors, as required in the proof of Theorem 14.5(i).

**Check.** In degree zero of the point all maps are the common coefficient maps. Neither equality of dimensions nor generic finite freeness proves agreement of the comparison maps.

**Source.** bms1-v3, Proposition 13.23, printed p.117; Theorem 14.5(i) proof, p.121.

### normalized-valuation-length — Normalized length over a rank-one valuation ring

Target `AInfCohomology:AI.6/normalized-valuation-length` (construction).

**Statement.** For a rank-one mixed-characteristic valuation ring V with additive valuation val(p)=1 and a finitely presented torsion V-module M≃⊕_i V/(a_i), a_i≠0, define val_V(M)=Σ_i val(a_i). Equivalently take the valuation of a generator of Fitt_0(M). This is independent of presentation, additive on short exact sequences of finitely presented torsion modules, and invariant under valuation-preserving scalar extension. For V a DVR with p uniformizer it is ordinary module length. A free summand is outside this finite-length domain.

**Hypotheses.** V rank one, characteristic zero, residue characteristic p; val is additive and normalized at p. M finitely presented and torsion; scalar extensions preserve the normalized valuation.

**Dependencies.** `PerfectoidSpaces:P1`; `mathlib:ValuationRing`.

**Proof or construction.** Apply the elementary-divisor structure theorem over a valuation ring. Relate the product of the a_i to Fitt_0(M). The Fitting-ideal multiplicativity theorem for these torsion presentations proves additivity; extending the diagonal presentation proves scalar-extension invariance. Both algebraic results are the supplier extension G-LENGTH.

**Uses.**

- AInfCohomology:AI.6/de-rham-torsion: Defines the normalized right side of the étale-to-de Rham bound.
- AInfCohomology:AI.6/valuation-length-specialization: Controls the finite-level A_inf specialization identity.

**API.**

- `AInf.normalized_valuation_length.cyclic` (characterisation): For nonzero a∈V, val_V(V/(a))=val(a); if a is a unit this is zero.
- `AInf.normalized_valuation_length.exact` (relation): An exact sequence 0→M_1→M_2→M_3→0 in the stated domain gives val_V(M_2)=val_V(M_1)+val_V(M_3).
- `AInf.normalized_valuation_length.base_change` (compatibility): For a valuation-preserving extension V→V′, val_V′(M⊗V′)=val_V(M).
- `AInf.normalized_valuation_length.fitting` (characterisation): If Fitt_0(M)=(a), then val_V(M)=val(a), so the definition is intrinsic.

**Definition tests.**

- `normalized_valuation_length_zero` (degenerate): The zero module has normalized length zero.
- `normalized_valuation_length_p_power` (computation): V/(p^n) has normalized length n.
- `normalized_valuation_length_ramified` (computation): If π^e is a unit multiple of p, V/(π^a) has normalized length a/e.
- `normalized_valuation_length_free` (non-example): The free rank-one V-module is not in the finitely presented torsion domain and has no finite normalized length assigned here.

**Check.** Use the same normalization on O_C, W(C^flat) and Z_p. An ordinary integer-valued composition length over nondiscrete O_C is not substituted.

**Source.** CK, §7.10 and (7.10.1)–(7.10.2), printed p.71.

### valuation-length-specialization — Finite-Witt valuation-length specialization identity

Target `AInfCohomology:AI.6/valuation-length-specialization` (theorem).

**Statement.** For n≥1 and M finitely presented over W_n(O_C^flat), val_{W(C^flat)}(M⊗_{A_inf}W(C^flat))=val_{O_C}(M/xi M)−val_{O_C}(M[xi]). Both right-hand modules are finitely presented torsion modules. The target over W(C^flat) uses p normalized to one. This identity includes the xi-Tor correction and underlies the semistable de Rham torsion inequalities.

**Hypotheses.** p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. M finitely presented over the indicated finite Witt ring; all valuation lengths use normalized-valuation-length.

**Dependencies.** `AInfCohomology:AI.6/normalized-valuation-length`; `AInfCohomology:AI.0/witt-coherence`; `AInfCohomology:AI.0/witt-finite-presentation-devissage`; `AInfCohomology:AI.0/period-regularity`.

**Proof or construction.** Coherence gives finite presentation of the xi-torsion. Both expressions are additive on finite-p-level short exact sequences by the snake lemma and normalized length. Reduce to n=1 and a cyclic valuation-ring module. For the free cyclic module both sides are one; for a nonzero relation the localization vanishes and the Tor exact sequence cancels the two O_C lengths.

**Check.** M=O_C^flat gives 1=val(O_C/p)−0. Dropping M[xi] would give a false formula for torsion cyclic modules.

**Source.** CK, Lemma 7.11 and proof, printed p.71.

## AI.7 — Breuil–Kisin descent and trace/prismatic interfaces

Fix the Frobenius-shifted Breuil–Kisin coefficients before comparing theories. The relative trace prefix belongs here because it is needed for Breuil–Kisin descent. Invert the degree-two Bott class b, retain the Nygaard filtration on the twisted object, and prove its non-descent. Prismatic identifications preserve the coefficient maps and their Frobenius twists; map agreement has its own explicit checks.

### coefficient-normalization — Cohomological Breuil–Kisin coefficient maps

Target `AInfCohomology:AI.7/coefficient-normalization` (construction).

**Statement.** On the R07.4 coefficient ring 𝔖=W(k₀)[[u]], distinguish θ̃_𝔖:𝔖→O_K, the W(k₀)-linear map with u↦π, from θ_𝔖=θ̃_𝔖∘φ_𝔖, which acts by φ_W on coefficients and has u↦π^p. Let 𝔖^(−1) be the copy of 𝔖 regarded as an 𝔖-algebra through φ_𝔖, let g:𝔖^(−1)→A_inf be W(k₀)-linear with u↦[π^♭], and f=g∘φ_𝔖=φ_A∘g:𝔖→A_inf, acting by φ_W on coefficients and u↦[π^♭]^p. Then θ̃_A∘f=θ̃_𝔖, θ_A∘f=θ_𝔖, θ_A∘g=θ̃_𝔖, f(E) generates ker θ̃_A=(ξ̃), g(E) generates ker θ_A=(ξ), and the cohomological crystalline map is c=φ_W∘constantCoeff:𝔖→W(k₀), with c∘φ_𝔖=φ_W∘c. These maps use the existing rings, rather than new coefficient constants. Dictionary: R07.4 (bk-coefficient-rings) writes θ_𝔖 for the map u↦π, which is this node’s θ̃_𝔖, and its embedding 𝔖→W(R), u↦[π̃], is this node’s g. PrismaticCohomology PR.7 (breuil-kisin-and-ainf-covers, kisin-functor-comparison) already supplies f as the map of prisms (𝔖,(E))→(A_inf,ker θ̃_A), u↦[π^♭]^p and Frobenius on W(k₀), with f=φ_A∘g. Not in those nodes: the name θ_𝔖 for θ̃_𝔖∘φ_𝔖 with θ_A∘f=θ_𝔖, the map c, and the statement for g(E). The variable u is T in BMS1 and z in BMS2; BMS2 writes θ^(−1) for the map u↦π on 𝔖^(−1).

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Dependencies.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `PrismaticCohomology:PR.7/breuil-kisin-and-ainf-covers`; `PrismaticCohomology:PR.7/kisin-functor-comparison`; `mathlib:PowerSeries.map`; `mathlib:PowerSeries.substAlgHom`; `mathlib:PowerSeries.constantCoeff`; `mathlib:WittVector.frobenius`; `mathlib:PowerSeries`; `mathlib:WittVector`; `mathlib:PowerSeries.expand`; `mathlib:PowerSeries.HasSubst.X_pow`; `mathlib:PowerSeries.coeff_subst_X_pow`; `mathlib:PowerSeries.constantCoeff_subst_X_pow`; `mathlib:PowerSeries.substAlgHom_X`; `mathlib:WittVector.frobeniusEquiv`; `mathlib:WittVector.fontaineTheta`; `mathlib:PreTilt`; `mathlib:PreTilt.untilt`; `mathlib:WittVector.teichmuller`; `mathlib:WittVector.map`.

**Proof or construction.** Import R07.4/bk-coefficient-rings (𝔖, φ_𝔖, E, the map u↦π and the embedding u↦[π̃]) and, from AI.0:integral, A_inf, θ_A, θ̃_A=θ_A∘φ_A^{-1}, ξ, ξ̃ and the inclusion W(k₀)⊂A_inf; the map of prisms f and the relation f=φ_A∘g are those of PR.7/breuil-kisin-and-ainf-covers and PR.7/kisin-functor-comparison. Compute the composite maps on coefficients and on u, using that θ_A is W(k₀)-linear on W(k₀)⊂A_inf and θ_A([x])=x^♯: θ̃_A(f(a))=θ_A(a)=a and θ̃_A(f(u))=θ_A([π^♭])=π; θ_A(f(a))=φ_W(a) and θ_A(f(u))=π^p; c(φ_𝔖(Σa_nu^n))=φ_W(φ_W(a_0))=φ_W(c(Σa_nu^n)). These are the Frobenius and θ̃ compatibilities in BMS1 §4.4 and the θ/θ̃ compatibilities in BMS2 Notation 11.1. Eisenstein claim: θ_A(g(E))=E(π)=0, and g(E)=[π^♭]^e+p·y with y congruent to the unit E(0)/p modulo [π^♭], so in the Witt vector expansion g(E)=(ξ₀,ξ₁,…) one has ξ₀=(π^♭)^e and ξ₁=(y mod p)^p, a unit of O_C^♭. By the distinguished-element criterion (BMS1 Remark 3.11: an element ξ=(ξ₀,ξ₁,…) of ker θ generates it if and only if ξ₁ is a unit; AI.0:integral) g(E) generates ker θ_A=(ξ), and f(E)=φ_A(g(E)) generates φ_A(ker θ_A)=ker θ̃_A=(ξ̃). BMS1 asserts the statement for f(E) without argument in the proof of Proposition 4.32; it also follows from f being a map of prisms. The statement for g(E) is not printed in BMS1 or BMS2; it follows from this computation.

**Uses.**

- BMS2 Theorems 1.2 and 11.2: All three specializations have these Frobenius-normalized coefficient maps.
- HabiroCohomologyFoundations:HQ.8: The comparison diagram must preserve θ versus θ̃ and the Frobenius twist.

**API.**

- `CohomologicalBK.coefficientNormalization.frobenius` (simp): For any coefficient endomorphism F and p>0, the power-series map is Σa_nu^n↦ΣF(a_n)u^{pn}; it sends C(a) to C(F(a)) and u to u^p.
- `CohomologicalBK.coefficientNormalization.theta` (compatibility): θ̃_A∘f=θ̃_𝔖 and θ_A∘f=θ_𝔖 as maps 𝔖→O_C (through O_K⊂O_C), and θ_A∘g=θ̃_𝔖; θ_𝔖(u)=π^p whereas θ̃_𝔖(u)=π.
- `CohomologicalBK.coefficientNormalization.crystalline` (simp): The normalized residue map is F∘constantCoeff: C(a)↦F(a), u↦0, and c∘φ_𝔖=φ_W∘c.
- `CohomologicalBK.coefficientNormalization.eisenstein` (relation): f(E) generates kerθ̃_A=(ξ̃); g(E) generates kerθ_A=(ξ).

**Definition tests.**

- `CohomologicalBK.coefficientNormalization.variable` (computation): At p=2, the map with coefficient identity sends u to u².
- `CohomologicalBK.coefficientNormalization.twisted_constant` (computation): For an arbitrary coefficient endomorphism F, the normalized residue of C(a) is F(a); for k₀=F_{p²}, F=φ_W and a=[ζ] with ζ∉F_p this is [ζ^p], which differs from a.
- `CohomologicalBK.coefficientNormalization.constant_identity` (compatibility): At F=id, c is exactly Mathlib PowerSeries.constantCoeff.
- `CohomologicalBK.coefficientNormalization.nonsurjective` (non-example): Over Z with p=2, the coefficient of u in every image of φ is zero, so u is not an image.

**Check.** On k₀=F_{p²}, c on a Teichmüller coefficient is [a^p], which differs from [a] for a∉F_p. φ_𝔖 is an endomorphism and is not surjective onto u.

**Source.** BMS1, §4.4, first paragraph, pp.280–281; BMS1, Remark 3.11, p.250; BMS2, §1.1, p.200; BMS2, Notation 11.1, p.298; BMS2, §11.2, first two paragraphs, p.302; BMS2, §11.2, second paragraph, p.302; BMS2, Theorem 1.2(3), p.201.

### flat-coefficient-extension — Flat Breuil–Kisin to A_inf extension

Target `AInfCohomology:AI.7/flat-coefficient-extension` (theorem).

**Statement.** The normalized map f:𝔖→A_inf is flat (BMS1 Lemma 4.30). It is moreover faithfully flat and topologically free: A_inf is isomorphic as an 𝔖-module to the (p,u)-adic completion of a free 𝔖-module, with 1 part of a topological basis, so that f has an 𝔖-linear retraction. These two properties are asserted in BMS2 Notation 11.1, with a reference to Lemma 4.30 and its proof, and are proved here. In particular M⊗^L_𝔖 A_inf is concentrated in degree 0 for every 𝔖-module M. Detection: a map that becomes zero, respectively an equivalence, after extension along f is zero, respectively an equivalence, in each of three domains: maps of 𝔖-modules with the ordinary tensor product; maps of perfect complexes of 𝔖-modules with the derived tensor product; maps of derived (p,u)-complete complexes with the (p,u)-completed derived tensor product. The same holds for g=φ_A^{-1}∘f. Finally f is p-completely faithfully flat and the p-completed tensor powers of A_inf over 𝔖 are flat over 𝔖 (BMS1 Remark 4.31), so the Čech descent of complete-flat-descent applies to derived p-complete 𝔖-complexes, with the p-completed Čech nerve of f.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Dependencies.** `AInfCohomology:AI.7/coefficient-normalization`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E4/mod-ideal-detection`; `DerivedDeRhamCohomology:DD.1/complete-flat-descent`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `mathlib:Module.FaithfullyFlat.zero_iff_lTensor_zero`; `mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective`.

**Proof or construction.** Flatness is BMS1 Lemma 4.30: by approximation one may take M finitely generated; finite modules over the regular noetherian ring 𝔖 (R07.4/bk-coefficient-rings) are perfect; Artin–Rees reduces p-complete flatness to the DVR map k₀[[u]]→O_C^♭, which is torsion-free. Faithful flatness (asserted in BMS2 Notation 11.1, not proved in the sources): f is a local homomorphism of local rings (A_inf is local; AI.0:integral), since f(p)=p and f(u)=[π^♭]^p lie in the maximal ideal of A_inf, and a flat local homomorphism is faithfully flat. Topological freeness (asserted in BMS2 Notation 11.1 and used in the proof of BMS2 Corollary 11.12(4) and in Remark 11.17; not proved in the sources): (p,u) is a regular sequence in 𝔖, and (p,[π^♭]^p) is a regular sequence in A_inf, which is (p,[π^♭])-adically complete. Choose a basis (e_i)_{i∈I} of A_inf/(p,[π^♭]^p) over k₀, acting through f, with e_{i₀} the class of 1, and lifts ẽ_i∈A_inf with ẽ_{i₀}=1. The induced map from the (p,u)-adic completion of ⊕_I𝔖 to A_inf is an isomorphism modulo (p,u); both sides are derived (p,u)-complete and (p,u) is a regular sequence on them, so the map is an isomorphism by derived Nakayama (mod-ideal-detection). The coordinate at i₀ is an 𝔖-linear retraction of f. Detection (not in the sources): for modules use faithful flatness; for perfect complexes use Hom_{D(𝔖)}(P,Q)⊗_𝔖A_inf=Hom_{D(A_inf)}(P⊗^LA_inf,Q⊗^LA_inf) and faithful flatness; for a derived (p,u)-complete complex N the retraction of the previous step makes N a retract of N⊗̂^L_𝔖A_inf, naturally in N, so a map killed by the extension is zero and a cone killed by it is zero. For g use that φ_A is an automorphism of A_inf. p-complete descent: A_inf⊗^L_𝔖𝔖/p=O_C^♭ is faithfully flat over k₀[[u]] by the first two steps, and 𝔖, A_inf are p-adically complete and p-torsion-free; these are the hypotheses of complete-flat-descent. The p-completed tensor powers of A_inf over 𝔖 are p-adically complete, p-torsion-free and flat over k₀[[u]] modulo p, hence flat over the noetherian ring 𝔖 by BMS1 Remark 4.31.

**Check.** For M=𝔖/(p,u)=k₀ the derived tensor product M⊗^L_𝔖A_inf is A_inf/(p,[π^♭]^p) in degree 0: the higher Tor groups vanish because (p,[π^♭]^p) is a regular sequence in A_inf. The retraction A_inf→𝔖 is only 𝔖-linear: there is no ring homomorphism A_inf→𝔖 retracting f, since modulo p it would make u=f(u) the p-th power of the image of π^♭ in k₀[[u]].

**Source.** BMS1, Lemma 4.30, p.281; BMS1, Lemma 4.30, proof, p.281; BMS1, Remark 4.31, p.281; BMS2, Notation 11.1, p.298; BMS2, Corollary 11.12, proof of part (4), p.305.

### cohomology — Cohomological Breuil–Kisin complex

Target `AInfCohomology:AI.7/cohomology` (construction).

**Statement.** For a smooth p-adic formal scheme 𝔛 over O_K, let (𝔖,(E)) be the bounded non-perfect prism of PrismaticCohomology PR.0 (breuil-kisin-prism) on the ring 𝔖=W(k₀)[[u]] of R07.4, with 𝔖/E≅O_K through θ̃_𝔖, and define RΓ_𝔖(𝔛) to be PR.1’s relative prismatic RΓ_Δ(𝔛/𝔖). On affines write D_𝔖(R)=Δ_{R/𝔖}. It is a derived (p,E)-complete, equivalently (p,u)-complete, commutative algebra object of D(𝔖) with a φ_𝔖-semilinear Frobenius endomorphism. For 𝔛 affine or, more generally, quasi-compact and quasi-separated, the linearization φ_𝔖^*RΓ_𝔖(𝔛)→RΓ_𝔖(𝔛) is an equivalence after E-inversion, with an inverse up to E^i on H^i.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. Smoothness is required here; the semistable complex of AI.6 is not obtained by applying this ordinary relative site to singular models.

**Dependencies.** `PrismaticCohomology:PR.0/breuil-kisin-prism`; `PrismaticCohomology:PR.1/relative-prismatic-cohomology`; `PrismaticCohomology:PR.3/leta-frobenius-factorisation`; `PrismaticCohomology:PR.3/image-of-frobenius`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`; `AInfCohomology:AI.7/coefficient-normalization`; `PrismaticCohomology:PR.1/hodge-tate-comparison`; `PrismaticCohomology:PR.3/de-rham-comparison-general`.

**Proof or construction.** Apply PR.0/breuil-kisin-prism and PR.1/relative-prismatic-cohomology to the fixed uniformizer quotient θ̃_𝔖; the ring 𝔖 and φ_𝔖 are those of R07.4 as recorded in coefficient-normalization, and the commutative algebra structure is that of PR.1’s construction, in the sense of algebra-objects. Frobenius: PR.3/leta-frobenius-factorisation (BS22 Theorem 15.3) and PR.3/image-of-frobenius (BS22 Corollary 15.5 and Theorem 1.8(6)) give maps V_i on the truncations τ^{≤i} of the sheaf Δ_{𝔛/𝔖} with V_iφ=φV_i=E^i and, for quasi-compact quasi-separated 𝔛, the equivalence of the linearized Frobenius after inverting E. Completeness: (p,E) and (p,u) have the same radical because E≡u^e modulo p. The comparison with the complex of BMS2 is trace-prismatic-agreement and is not used here.

**Uses.**

- BMS2 Theorem 1.2 and BS22 Example 1.9(3): This is the geometric cohomology functor, distinct from R07.4’s classification of representations/groups.
- HabiroCohomologyFoundations:HQ.8: The same functor enters the cross-theory comparison diagram.

**API.**

- `CohomologicalBK.cohomology.affine` (characterisation): For SpfR, the object is precisely Δ_{R/𝔖} in the shared enhancement.
- `CohomologicalBK.cohomology.functorial` (functoriality): Pullback on eligible smooth formal schemes gives contravariant maps preserving products, with identity/composition.
- `CohomologicalBK.cohomology.frobenius` (structure): The sheaf has the imported prismatic Frobenius. For affine or quasi-compact quasi-separated 𝔛, its global linearization φ_𝔖^*D→D becomes an isomorphism after E-inversion; the inverse up to E^i on H^i has the direction stated in PR.3/image-of-frobenius.
- `CohomologicalBK.cohomology.global` (compatibility): For every smooth 𝔛, RΓ_𝔖(𝔛)=RΓ(𝔛_ét,Δ_{𝔛/𝔖}), where Δ_{𝔛/𝔖} is PR.1’s étale sheaf with value Δ_{R/𝔖} on an affine open Spf R. No quasi-compactness is needed for this identification; it is needed for completed base change of global sections (ainf-base-change) and for the global Frobenius isogeny.

**Definition tests.**

- `CohomologicalBK.cohomology.point` (degenerate): For SpfO_K the complex is 𝔖 in degree 0 with φ_𝔖.
- `CohomologicalBK.cohomology.polynomial` (compatibility): For R=O_K⟨t⟩ the Hodge–Tate reduction D_𝔖(R)⊗^L_{𝔖,θ̃_𝔖}O_K has H⁰=R and H¹=Ω¹_{R/O_K}{−1}, and no other cohomology; the reduction along θ_𝔖 is the de Rham complex R→R·dt, t^n↦n·t^{n−1}dt.
- `CohomologicalBK.cohomology.torus` (compatibility): For R=O_K⟨t^{±1}⟩: H⁰(D_𝔖(R)⊗^L_{𝔖,θ̃_𝔖}O_K)=R, whereas H⁰(D_𝔖(R)⊗^L_{𝔖,θ_𝔖}O_K)=O_K, the kernel of d:R→R·dlog t, t^n↦n·t^n·dlog t.

**Check.** For Spf O_K and two uniformizers π, π′ the complex is 𝔖 for both, but as prisms (𝔖,(E)) and (𝔖,(E′)), which differ unless E′=E; the two theories are identified only after extension to A_inf, by choice-transport.

**Source.** BS22, Example 1.3(3), pp.2–3; BS22, Theorem 1.8, opening, p.4; BS22, Theorem 1.8(6), p.5; BS22, Example 1.9(3), pp.5–6; BMS2, Theorem 1.2(2), p.201.

### twisted-trace — Frobenius-twisted relative trace complex

Target `AInfCohomology:AI.7/twisted-trace` (construction).

**Statement.** For a p-completely smooth O_K-algebra R, let 𝔖^(−1) be the copy of 𝔖 containing 𝔖 via φ_𝔖 and embedded in A_inf by g. Define D̂_tw(R)=gr⁰TC⁻(R/𝕊[z];Z_p)≃gr⁰TP(R/𝕊[z];Z_p), by unfolding π₀ from the quasiregular semiperfectoid site as in BMS2 §§11.1–11.2; here O_K is an 𝕊[z]-algebra through z↦π. It is a (p,u)-complete E∞-𝔖^(−1)-algebra, the algebra structure coming from π₀TC⁻(O_K/𝕊[z];Z_p)=𝔖^(−1), in which the variable z of 𝕊[z] is the coefficient variable u; its Frobenius linearization is invertible after φ(E)-inversion. The AI.7 relative trace targets supply the relative spectra, filtration, unfolding and coefficient computations.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. 𝕊[z] is the sphere-spectrum monoid algebra; the Bott class b of degree 2 is distinct from the coefficient variable u.

**Dependencies.** `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`; `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/relative-bott-frobenius`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.7/flat-coefficient-extension`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

**Proof or construction.** Import the AI.7 relative trace targets’ relative THH/TC⁻/TP computation and its quasisyntomic descent, using the map z↦π: the cyclotomic structure on THH(−/𝕊[z]) (BMS2 Construction 11.5), the coefficient computation BMS2 Proposition 11.10, and evenness and the sheaf property on quasiregular semiperfectoid O_K-algebras, BMS2 Proposition 11.11, which rests on BMS2 Theorem 7.2. Apply BMS2 Corollary 11.12, with the relative TC⁻(−/𝕊[z];Z_p) and with gr⁰ of the filtration obtained by unfolding from quasiregular semiperfectoid algebras; on smooth algebras this is not π₀, and absolute TC⁻ carries no 𝔖-module structure. Its proof uses, besides §§11.1–11.2, the absolute results BMS2 Theorem 1.17 for part (2), Theorem 1.8 for part (1) and Theorem 1.10 for part (3), with BMS2 Corollary 11.8 and Lemma 11.6 for base change in 𝕊[z]; all belong to AI.7 relative traces. Part (4) is deduced from part (1) because 𝔖^(−1)→A_inf is a topological direct summand, which is flat-coefficient-extension applied to g.

**Uses.**

- BMS2 Proposition 11.15 and proof of Theorem 11.2: The twisted trace complex descends only after Bott inversion and the cyclotomic map.

**API.**

- `CohomologicalBK.twistedTrace.coefficients` (compatibility): For R=O_K, with all spectra relative to 𝕊[z] and p-completed: π_*THH=O_K[b]; π_*TC⁻=𝔖^(−1)[b,v]/(bv−E) with b of degree 2 and v of degree −2; π_*TP=𝔖^(−1)[σ^{±1}] with σ of degree 2; can(b)=Eσ and can(v)=σ^{−1}; the cyclotomic Frobenius π_*TC⁻→π_*TP is φ_𝔖 on 𝔖^(−1), with φ(b)=σ and φ(v)=φ_𝔖(E)σ^{−1}.
- `CohomologicalBK.twistedTrace.specializations` (equivalence): BMS2 Corollary 11.12(1)–(3): along g, with the (p,u)-completed tensor product, it is AΩ_{R⊗̂O_C}; along the W(k₀)-linear map u↦π (untwisted coefficients) it is the p-completed de Rham complex of R over O_K; along constantCoeff (identity on W(k₀), u↦0) it is crystalline cohomology of R⊗_{O_K}k₀ over W(k₀).
- `CohomologicalBK.twistedTrace.frobenius` (structure): Its linearized Frobenius is invertible after φ(E), matching Corollary 11.12(4).

**Definition tests.**

- `CohomologicalBK.twistedTrace.point` (degenerate): For O_K the gr⁰ complex is 𝔖^(−1) in degree 0.
- `CohomologicalBK.twistedTrace.bott` (computation): On O_K the cyclotomic map takes the Bott class b to σ, which is invertible in TP; can takes b to Eσ.
- `CohomologicalBK.twistedTrace.relative` (non-example): Absolute TC⁻(R;Z_p) is not substituted for the relative theory: the class b∈π₂ and the 𝔖^(−1)-algebra structure of BMS2 Proposition 11.10 belong to TC⁻(−/𝕊[z];Z_p), and the absolute theory appears only after base change, as gr⁰TC⁻(R⊗̂_{O_K}O_{K_∞};Z_p)≃D̂_tw(R)⊗̂^L_{𝔖^(−1)}A_inf(O_{K_∞}) (BMS2 Corollary 11.12(1), Remark 11.9).

**Check.** For R=O_K the complex is 𝔖^(−1), and its three specialisations of BMS2 Corollary 11.12(1)–(3), along g, u↦π and u↦0, are A_inf, O_K and W(k₀).

**Source.** BMS2, §11.2, first two paragraphs, p.302; BMS2, Proposition 11.10, pp.302–303; BMS2, Proposition 11.10, p.303; BMS2, Proposition 11.10, p.303, top arrow of the last diagram; BMS2, Proposition 11.11, p.303; BMS2, paragraph after Proposition 11.11, p.303; BMS2, Corollary 11.12, p.304; BMS2, Corollary 11.12(3), p.304; BMS2, Corollary 11.12, proof of part (4), p.305; BMS2, Remark 11.9, p.302.

### trace-descent — Bott-inverted Breuil–Kisin descent

Target `AInfCohomology:AI.7/trace-descent` (theorem).

**Statement.** Let 𝔖 act on TC⁻(R/𝕊[z];Z_p)[1/b] through π₀(TC⁻(O_K/𝕊[z];Z_p)[1/b])=W(k₀)[[z]], the variable z of 𝕊[z] being the coefficient variable u; the cyclotomic Frobenius makes π₀TP(O_K/𝕊[z];Z_p)=𝔖^(−1) an 𝔖-algebra through φ_𝔖. D_𝔖^tr(R)=gr⁰(TC⁻(R/𝕊[z];Z_p)[1/b]), unfolded from the quasiregular semiperfectoid site, has φ_𝔖^*D_𝔖^tr≃D̂_tw, the tensor product being the ordinary one since φ_𝔖 is finite free. The cyclotomic Frobenius extends over b-inversion and z^{1/p}; for p-completed smooth R the resulting map to gr⁰TP is an equivalence. The linearised descent Frobenius φ_𝔖^*D_𝔖^tr→D_𝔖^tr is the composite of φ_𝔖^*D_𝔖^tr≃gr⁰TP(R/𝕊[z];Z_p), the inverse of the canonical equivalence gr⁰TC⁻≃gr⁰TP and the localisation gr⁰TC⁻→gr⁰(TC⁻[1/b])=D_𝔖^tr. Its base change along φ_𝔖 is, under the identification above, the linearised Frobenius of D̂_tw, so that the pair (D̂_tw,φ) descends to D_𝔖^tr with this Frobenius; it is invertible after E-inversion.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. R is the p-adic completion of a smooth O_K-algebra for the equivalence with gr⁰TP (BMS2 Proposition 11.15, last sentence); the extension of the cyclotomic Frobenius over b-inversion holds for every O_K-algebra.

**Dependencies.** `AInfCohomology:AI.7/twisted-trace`; `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`; `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/relative-bott-frobenius`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`.

**Proof or construction.** Use the AI.7 relative trace targets’ evenness, acyclicity and cyclotomic extension in BMS2 Proposition 11.15, with Propositions 11.10 and 11.11 and, for the reduction modulo z^{1/p}, Lemma 11.6; the source’s Segal input Corollary 8.18 belongs to AI.7 relative traces. Apply the unfolding/descent of the proof of BMS2 Theorem 11.2, retaining its relative base and its canonical Frobenius composite; the first display of that proof must be read with TC⁻(A/𝕊[z];Z_p), as in Proposition 11.15 and in the composite display of the same proof. Compatibility with the Frobenius of D̂_tw, whose verification BMS2 leaves implicit: let Φ:D_𝔖^tr→gr⁰TP be the φ_𝔖-semilinear map of Proposition 11.15 and loc:gr⁰TC⁻→D_𝔖^tr the b-inversion. By construction Φ∘loc is the cyclotomic Frobenius φ^{hT}:gr⁰TC⁻→gr⁰TP. The semilinear descent Frobenius is F=loc∘can^{-1}∘Φ, so Φ∘F=φ^{hT}∘can^{-1}∘Φ, and φ^{hT}∘can^{-1} is the Frobenius endomorphism of gr⁰TP≃D̂_tw. Invertibility after E: the linearized Frobenius of D̂_tw is invertible after inverting φ_𝔖(E) (twisted-trace, BMS2 Corollary 11.12(4)); φ_𝔖 is finite free of rank p (R07.4/bk-coefficient-rings), hence faithfully flat, so the cone of the linearized Frobenius of D_𝔖^tr vanishes after inverting E.

**Check.** For R=O_K: π_*(TC⁻(O_K/𝕊[z];Z_p)[1/b])=𝔖^(−1)[b^{±1}], because v=E·b⁻¹ once b is inverted; its degree-zero part is W(k₀)[[z]], in which nothing has been inverted. The class inverted is the degree-two class b (written u in BMS2), not the coefficient variable z. The first display of the proof of BMS2 Theorem 11.2 must be read with the relative TC⁻(A/𝕊[z];Z_p); with the absolute TC⁻(A;Z_p), as printed, the class b and the 𝔖-module structure are not defined. For R=O_K: D_𝔖^tr=𝔖, the map Φ is φ_𝔖:𝔖→𝔖^(−1), and the descent Frobenius is φ_𝔖.

**Source.** BMS2, Proposition 11.15, p.305; BMS2, Proposition 11.15, p.305, last sentence; BMS2, Proposition 11.15, proof, p.305; BMS2, Proposition 11.15, proof, p.306; BMS2, Theorem 11.2, proof, p.306; BMS2, Theorem 11.2, proof, p.306; BMS2, Theorem 11.2, p.298.

### trace-prismatic-agreement — Trace and prismatic Breuil–Kisin agreement

Target `AInfCohomology:AI.7/trace-prismatic-agreement` (theorem).

**Statement.** (a) [BS22 Example 1.9(3) and §15.2, with Proposition 15.7] For p-completely smooth R/O_K there is a natural Frobenius-equivariant equivalence D_𝔖^tr(R)≃D_𝔖(R)=Δ_{R/𝔖}. It sheafifies and globalizes for qcqs 𝔛. It is an equivalence of commutative algebra objects; this is not printed in BS22 and follows from the construction, which induces it from ring maps on quasiregular semiperfectoid algebras. (b) [Not in the sources.] That under (a) the A_inf, de Rham and crystalline specialisation equivalences of the trace complex (BMS2 Theorem 11.2(1)–(3)) correspond to those of Δ_{R/𝔖} (BS22 Theorem 1.8(5), (3), (1)) is neither stated nor proved in BS22 or BMS2; it is the open part of this target. BS22 §18’s perfect-prism uniqueness does not give it: that theorem concerns functors defined on all p-completely smooth O_C-algebras, whereas the A_inf-extensions of the Breuil–Kisin functors are defined on smooth O_K-algebras only.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. R is the p-adic completion of a smooth O_K-algebra; for (a) no properness is needed.

**Dependencies.** `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/trace-descent`; `AInfCohomology:AI.7/twisted-trace`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`; `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/relative-bott-frobenius`; `PrismaticCohomology:PR.3/leta-frobenius-factorisation`; `PrismaticCohomology:PR.3/relative-nygaard-filtration`; `PrismaticCohomology:PR.3/relative-nygaard-graded-pieces`; `PrismaticCohomology:PR.3/bms2-comparison`; `PrismaticCohomology:PR.6/ainf-omega-comparison`; `PrismaticCohomology:PR.6/comparison-uniqueness`.

**Proof or construction.** For quasiregular semiperfectoid quasisyntomic O_K-algebras S use BS22 Proposition 15.7 (AI.7 relative traces, with the prismatic input PR.3/bms2-comparison): the cyclotomic Frobenius on π₀TP(S/𝕊[z];Z_p) is the Frobenius of a δ-structure; the universal property of Δ_{S/𝔖} as initial object of the prismatic site of S over 𝔖 (BS22 Theorem 15.2(1)) gives a map Δ^{(1)}_{S/𝔖}→π₀TP(S/𝕊[z];Z_p); and this map identifies the target with the Nygaard completion, compatibly with Nygaard filtrations (relative-nygaard-filtration). Both checks are made after the (p,u)-completed base change 𝔖→W(k₀)[[u^{1/p^∞}]], where relative THH becomes absolute THH of S⟨π^{1/p^∞}⟩ (BMS2 Corollary 11.8) and BS22 Theorem 13.1 applies. Under this identification and the canonical map, π_{2i}TC⁻(S/𝕊[z];Z_p) is the i-th step Fil^i_N of the Nygaard filtration of π₀TP(S/𝕊[z];Z_p) and b corresponds to E (twisted-trace: can(b)=Eσ). Hence π₀(TC⁻(S/𝕊[z];Z_p)[1/b]) is the union of the E^{−i}Fil^i_N, and the relative Frobenius φ_{S/𝔖}, which maps Fil^i_N into E^iΔ_{S/𝔖}, induces ring maps π₀(TC⁻(S/𝕊[z];Z_p)[1/b])→Δ_{S/𝔖}, n/E^i↦φ_{S/𝔖}(n)/E^i, natural in S. They commute with the Frobenius endomorphisms: the extended cyclotomic Frobenius of trace-descent is this ring map followed by Δ_{S/𝔖}→Δ^{(1)}_{S/𝔖}, x↦x⊗1. Unfold over the quasisyntomic site of R: BMS2 Proposition 11.15 for the trace side (trace-descent), and BS22 Theorem 15.3, first display, for RΓ_Δ(X/𝔖)≃RΓ(X_qsyn,Δ_{−/𝔖}). For i at least the dimension of R the map φ:Fil^i_N→E^iΔ_{−/𝔖} induces an equivalence on RΓ(X_qsyn,−), because both sides are complete for compatible filtrations and the graded pieces agree by BS22 Theorem 15.3 (relative-nygaard-graded-pieces, leta-frobenius-factorisation). So the colimit over i stabilises and the ring maps of the previous step induce the equivalence (a). This is the argument of BS22 §15.2, whose reference to [BMS19, Proposition 11.5] is to BMS2 Proposition 11.15. Multiplicativity in (a) is not printed in BS22: it holds because the equivalence is induced on derived global sections by the ring maps of the second step. (b) is not proved. Towards it the listed inputs give only this. The maps of the first step come from a universal property, so their base change along 𝔖→W(k₀)[[u^{1/p^∞}]]→A_inf is the map given by the same universal property over the base-changed prism; this is how BS22 reduces to Theorem 13.1. PR.6/comparison-uniqueness (BS22 Theorem 18.2) applies to the comparison isomorphisms between AΩ, the absolute trace complex and φ_A^*Δ_{−/A_inf} as functors on all p-completely smooth O_C-algebras (BS22 Theorems 13.1 and 17.2, PR.6/ainf-omega-comparison); it applies neither to functors defined only on smooth O_K-algebras nor over A_inf⊗̂_𝔖A_inf, which is not a perfect prism. Equalities of maps over 𝔖 can be tested after extension along f by flat-coefficient-extension.

**Check.** For R=O_K both sides are 𝔖 with φ_𝔖, and the equivalence is the identity: π₀(TC⁻(O_K/𝕊[z];Z_p)[1/b])=𝔖 and Δ_{O_K/𝔖}=𝔖. The double overlap A_inf⊗̂_𝔖A_inf is not a perfect prism: modulo p the element π^♭⊗1−1⊗π^♭ is nonzero and has p-th power u⊗1−1⊗u=0.

**Source.** BS22, Example 1.9(3), pp.5–6; BS22, §15.2, first paragraph, p.105; BS22, Proposition 15.7, p.105; BS22, Proposition 15.7, proof, p.105; BS22, §15.2, last paragraph, p.105; BS22, Theorem 15.2(1), p.102; BS22, Theorem 15.3, p.103; BS22, Theorem 13.1, p.94; BS22, §18, first paragraph, p.122; BS22, Notation 18.1, p.122; BMS2, Corollary 11.8, p.301; BMS2, Proposition 11.15, p.305.

### ainf-base-change — Breuil–Kisin A_inf base change

Target `AInfCohomology:AI.7/ainf-base-change` (theorem).

**Statement.** For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗̂^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), where f uses Witt Frobenius and [π^♭]^p and the tensor product is (p,u)-completed. Prismatic base change targets (A_inf,(ξ̃)), and PR.6 identifies its result with φ_A^*Δ_{𝔛_{O_C}/(A_inf,(ξ))}≃AΩ_{𝔛_{O_C}}. The equivalence is Frobenius compatible. That it is an equivalence of E∞-algebras and that the affine equivalences are natural in R, which the gluing over 𝔛 uses, rest on the same two properties of the comparison AΩ_R≃φ_A^*Δ_{R/A_inf} of PR.6/ainf-omega-comparison; BS22 assert both (Theorem 17.2, Remark 17.3), and they are not established here. The passage to the ordinary derived tensor product for proper 𝔛 is in perfect-cohomological-modules.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. 𝔛 is a smooth p-adic formal scheme over O_K, quasi-compact and quasi-separated.

**Dependencies.** `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/coefficient-normalization`; `PrismaticCohomology:PR.1/prismatic-base-change`; `PrismaticCohomology:PR.6/ainf-omega-comparison`; `PrismaticCohomology:PR.6/theta-theta-tilde-square`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `EnhancedDerivedSheaves:E4`.

**Proof or construction.** Use PR.1/prismatic-base-change for the normalized map f into the ξ̃-prism: f is a map of bounded prisms (𝔖,(E))→(A_inf,(ξ̃)) inducing O_K⊂O_C on the quotients (coefficient-normalization), so for an affine open Spf R of 𝔛, Δ_{R/𝔖}⊗̂^L_{𝔖,f}A_inf≃Δ_{R_{O_C}/(A_inf,(ξ̃))} (BS22 Theorem 1.8(5), Corollary 4.12). φ_A is an isomorphism of prisms (A_inf,(ξ))→(A_inf,(ξ̃)) over the identity of O_C, because θ̃_A∘φ_A=θ_A; hence Δ_{R_{O_C}/(A_inf,(ξ̃))}=φ_A^*Δ_{R_{O_C}/(A_inf,(ξ))}. Use PR.6/ainf-omega-comparison and its θ/θ̃ square (BS22 Theorem 17.2) to identify this with AΩ_{R_{O_C}}, compatibly with Frobenius. For the global statement, apply PR.1/prismatic-base-change in its qcqs form directly to RΓ_Δ(𝔛/𝔖) along f: its completed scalar extension is RΓ_Δ(𝔛_{O_C}/(A_inf,(ξ̃))). Identify the latter with RΓ(𝔛_{O_C,ét},AΩ) by the natural sheaf comparison of PR.6/ainf-omega-comparison and the θ/θ̃ square, using the Frobenius twist in step 2. This is RΓ_Ainf by AI.3, while RΓ_𝔖 is the global prismatic complex by cohomology. The argument uses the supplier’s global base-change theorem, not an interchange of completed tensor with an arbitrary affine Čech limit. Naturality and multiplicativity of the PR.6 comparison retain the qualification in the statement and G-MAPS.

**Check.** Replacing f by g without twisting the cohomology would give Δ rather than AΩ.

**Source.** BS22, Theorem 1.8(5), p.4; BS22, Example 1.9(2), p.5; BS22, Theorem 17.2, p.117; BMS2, Theorem 1.2(1), p.201; BMS2, Theorem 11.2(1), p.298.

### de-rham-base-change — Frobenius-twisted Breuil–Kisin de Rham map

Target `AInfCohomology:AI.7/de-rham-base-change` (theorem).

**Statement.** For every smooth p-adic formal scheme 𝔛/O_K, RΓ_𝔖(𝔛)⊗^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K), the cohomology of the p-completed de Rham complex, where θ_𝔖=θ̃_𝔖∘φ_𝔖 acts by φ_W on coefficients and u↦π^p; on 𝔛_ét it is an equivalence Δ_{𝔛/𝔖}⊗^L_{𝔖,θ_𝔖}O_K≃Ω^•_{𝔛/O_K} of commutative algebra objects. No completion of the tensor product and no quasi-compactness are needed: O_K is a perfect 𝔖-module through θ_𝔖, because φ_𝔖 is finite free and 𝔖 is regular, so the tensor product preserves derived completeness and commutes with derived global sections. After the p-completed base change O_K→O_C, for qcqs 𝔛, the left side becomes RΓ_Ainf(𝔛⊗̂O_C)⊗^L_{A_inf,θ_A}O_C, by ainf-base-change and θ_A∘f=θ_𝔖, so the statement yields an identification of the θ specialization of AΩ with de Rham cohomology of 𝔛⊗̂O_C. That this identification coincides, as a map, with the θ specialization of AI.5 is not in the sources; it is clause (b) of comparison-diagram-agreement.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. 𝔛 is a smooth p-adic formal scheme over O_K; quasi-compactness and quasi-separatedness are assumed only in the sentence about base change to O_C.

**Dependencies.** `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.7/ainf-base-change`; `PrismaticCohomology:PR.3/de-rham-comparison-general`; `PrismaticCohomology:PR.6/theta-theta-tilde-square`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`; `EnhancedDerivedSheaves:E4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`; `PrismaticCohomology:PR.3/leta-frobenius-factorisation`; `PrismaticCohomology:PR.1/prismatic-base-change`; `PrismaticCohomology:PR.1/hodge-tate-comparison`.

**Proof or construction.** Apply PR.3/de-rham-comparison-general to the prism (𝔖,(E)); its composite coefficient map is θ_𝔖. It is a statement about sheaves on 𝔛_ét for every smooth 𝔛 (BS22 Corollary 15.4; Theorem 1.8(3)). Since φ_𝔖 is finite free of rank p (R07.4/bk-coefficient-rings), 𝔖/E is a finitely generated module over 𝔖 through φ_𝔖, hence a perfect complex over the regular ring 𝔖; so neither the pullback along φ_𝔖 nor the reduction modulo E needs a completion, and tensoring with O_K commutes with derived global sections. BMS2 Theorem 11.2(2) has the uncompleted tensor product for the same reason. For the sentence about O_C use ainf-base-change and coefficient-normalization’s identity θ_A∘f=θ_𝔖; the comparison of PR.3/de-rham-comparison-general is the composite of φ̃⊗A/I, the Bockstein reduction and the Hodge–Tate comparison; φ̃ is compatible with base change of prisms (PR.3/leta-frobenius-factorisation), the complexes are by PR.1/prismatic-base-change, and the Hodge–Tate comparison of PR.1/hodge-tate-comparison is, because it is the unique map of commutative differential graded algebras out of the de Rham complex extending the structure map in degree 0. Applied to f:(𝔖,(E))→(A_inf,(ξ̃)) and to the isomorphism of prisms φ_A:(A_inf,(ξ))→(A_inf,(ξ̃)), this identifies the base change with the de Rham corner of PR.6/theta-theta-tilde-square. Agreement with the θ specialization map of AI.5 is not proved.

**Check.** The untwisted quotient u↦π is the Hodge–Tate coefficient map for the prism, not this de Rham map.

**Source.** BS22, Theorem 1.8(3), p.4; BS22, Theorem 1.8(3), p.4, second sentence; BS22, Corollary 15.4, p.104; BMS2, Theorem 1.2(2), p.201; BMS2, Theorem 11.2(2), p.298.

### crystalline-base-change — Frobenius-normalized Witt specialization

Target `AInfCohomology:AI.7/crystalline-base-change` (theorem).

**Statement.** For qcqs smooth 𝔛/O_K, RΓ_𝔖(𝔛)⊗^L_{𝔖,c}W(k₀)≃RΓ_crys(𝔛_{k₀}/W(k₀)), where c=φ_W∘constantCoeff. No completion of the tensor product is needed: through c, W(k₀) is the 𝔖-module 𝔖/u, a perfect complex. This is Frobenius equivariant. The φ_W factor is the crystalline comparison’s Frobenius pullback, not a dispensable coordinate choice. After the p-completed extension W(k₀)→W(k̄) the left side becomes the specialization of RΓ_Ainf(𝔛⊗̂O_C) along A_inf→W(k̄), by ainf-base-change and the identity (A_inf→W(k̄))∘f=(W(k₀)→W(k̄))∘c, so the statement yields an identification of that specialization with crystalline cohomology of 𝔛_{k̄} over W(k̄). That this identification coincides, as a map, with AI.5’s W(k̄) comparison is not in the sources; it is clause (b) of comparison-diagram-agreement.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. 𝔛 is a smooth p-adic formal scheme over O_K, quasi-compact and quasi-separated.

**Dependencies.** `AInfCohomology:AI.7/cohomology`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.7/ainf-base-change`; `PrismaticCohomology:PR.1/prismatic-base-change`; `PrismaticCohomology:PR.1/crystalline-comparison`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`; `EnhancedDerivedSheaves:E4`.

**Proof or construction.** First use PR.1/prismatic-base-change along constantCoeff to the crystalline prism (W(k₀),(p)); constantCoeff sends E to E(0), a unit multiple of p, and W(k₀)=𝔖/u is a perfect 𝔖-module, so the base change needs no completion. Then apply PR.1/crystalline-comparison’s φ_W pullback, giving the composite c; φ_W is an automorphism of W(k₀), and c∘φ_𝔖=φ_W∘c gives Frobenius equivariance (BS22 Theorem 1.8(1), (5); BMS2 Theorem 11.2(3) states the result for the trace complex with the same map). For the last sentence use ainf-base-change and the identity of coefficient maps, which holds because A_inf→W(k̄) kills [π^♭]. Agreement with the comparison map of AI.5 is not proved.

**Check.** A coefficient in F_{p²} detects the missing φ_W, even though k₀=F_p hides it.

**Source.** BS22, Theorem 1.8(1), p.4; BS22, Theorem 1.8(5), p.4; BMS2, Theorem 1.2(3), p.201; BMS2, Theorem 11.2(3), p.299; BMS2, Remark 1.3, pp.201–202.

### perfect-cohomological-modules — Perfect complex and cohomological Breuil–Kisin modules

Target `AInfCohomology:AI.7/perfect-cohomological-modules` (theorem).

**Statement.** For proper smooth 𝔛/O_K, RΓ_𝔖 is perfect, and every H^i_𝔖 is a finitely generated (equivalently finitely presented, 𝔖 being noetherian) 𝔖-module with an isomorphism (φ_𝔖^*H^i_𝔖)[1/E]≃H^i_𝔖[1/E]. These are the broad cohomological Breuil–Kisin modules of BMS2 Definition 1.1, potentially with p-torsion. They are not assigned the finite-free Kisin-module classification of R07.4. Consequently, for proper 𝔛, the completed tensor product of ainf-base-change is the ordinary derived tensor product, RΓ_𝔖(𝔛)⊗^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C), and the A_inf extension of H^i_𝔖 is H^i_Ainf by flatness.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. 𝔛 is a proper smooth p-adic formal scheme over O_K.

**Dependencies.** `AInfCohomology:AI.7/ainf-base-change`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/cohomology`; `PrismaticCohomology:PR.3/de-rham-comparison-general`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`.

**Proof or construction.** Perfectness, independently of A_inf, by reduction modulo (p,u) as in BMS2 Theorem 11.2, footnote 18 (which uses the crystalline comparison) and in the sentence after BS22 Theorem 1.8 (which uses the Hodge–Tate comparison); here the de Rham comparison is used: RΓ_𝔖(𝔛) is derived (p,u)-complete (cohomology). By PR.3/de-rham-comparison-general, RΓ_𝔖(𝔛)⊗^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K), with no completion since O_K is a perfect 𝔖-module through θ_𝔖; reducing modulo π gives (RΓ_𝔖(𝔛)⊗^L_𝔖k₀)⊗_{k₀,Frob}k₀≃RΓ_dR(𝔛_{k₀}/k₀), which has finite-dimensional total cohomology because 𝔛_{k₀} is proper and smooth over k₀ (finiteness of the coherent cohomology of a proper scheme over a field). Frobenius of k₀ is bijective, so RΓ_𝔖(𝔛)⊗^L_𝔖k₀ is perfect over k₀. A derived (p,u)-complete complex over 𝔖 whose derived reduction modulo (p,u) is perfect is perfect: its reductions modulo (p^n,u^n) have finite-length cohomology in a range of degrees independent of n, so by completeness and the Mittag-Leffler property its cohomology is the inverse limit of these, vanishes outside that range and is finitely generated by Nakayama for complete modules (AI.5); finitely generated modules over the regular noetherian ring 𝔖 are perfect. Use noetherianness of 𝔖 and flatness of φ_𝔖 (finite free of rank p) to pass Frobenius to cohomology: the linearized Frobenius of RΓ_𝔖(𝔛) is an equivalence after inverting E (cohomology; BS22 Theorem 1.8(6)), and φ_𝔖^* and localisation are exact. This is the statement of BMS2 Theorem 1.2(1) for BMS2’s complex. A_inf extension: a perfect complex tensored with the (p,[π^♭])-adically complete ring A_inf is derived complete, so by ainf-base-change RΓ_𝔖(𝔛)⊗^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C); by flatness of f (flat-coefficient-extension) H^i_𝔖⊗_{𝔖,f}A_inf≃H^i_Ainf.

**Check.** The perfect complex [𝔖→ᵖ𝔖] has H¹=𝔖/p and is an explicit counterexample to perfect implies free cohomology.

**Source.** BMS2, Definition 1.1, p.201; BMS2, Theorem 1.2(1), p.201; BMS2, Theorem 11.2, footnote 18, p.299; BS22, sentence after Theorem 1.8, p.5.

### bkf-tensor-functor — Exact cohomological BK to BKF tensor functor

Target `AInfCohomology:AI.7/bkf-tensor-functor` (theorem).

**Statement.** For the broad category of finitely presented 𝔖-modules M with (φ_𝔖^*M)[1/E]≃M[1/E], extension M↦M⊗_{𝔖,f}A_inf is an exact symmetric monoidal functor to AI.2’s finitely presented BKF modules. R07.4 supplies BMS1 Proposition 4.3 that M[1/p] is free; f(E) generates ξ̃. This identifies the Frobenius structure on H^i_𝔖⊗A_inf with the earlier cohomological BKF module.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Dependencies.** `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.7/ainf-base-change`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/bkf-valid-operations`; `AInfCohomology:AI.2/bkf-etale-realization`; `AInfCohomology:AI.2/fargues-classification`; `AInfCohomology:AI.0:integral/breuil-kisin-line`.

**Proof or construction.** Import from R07.4 the category of finitely generated 𝔖-modules of BMS1 Definition 4.1, with BMS1 Proposition 4.3 (M[1/p] is finite free over 𝔖[1/p]). Apply BMS1 Proposition 4.32, using flat-coefficient-extension, coefficient-normalization and AI.2’s ξ̃-linearized presentation; specialize to perfect-cohomological-modules. The source writes f(E) for the image of E under the map 𝔖→A_inf fixed before Lemma 4.30, which is the map f of coefficient-normalization. The identification of the Frobenius structures on H^i (last sentence of the statement) is not part of Proposition 4.32; it uses the Frobenius compatibility of ainf-base-change.

**Check.** Exactness is scalar extension, not a claim that Kisin’s representation-to-lattice functor is exact.

**Source.** BMS1, Proposition 4.32, p.281; BMS1, Proposition 4.32, proof, p.281; BMS1, Proposition 4.3, p.263; BMS1, Lemma 4.30, p.281; BMS1, Definition 4.22, p.276.

### twist-compatibility — Breuil–Kisin twist base change

Target `AInfCohomology:AI.7/twist-compatibility` (theorem).

**Statement.** The Breuil–Kisin twist 𝔖{1} of the prism (𝔖,(E)) (PR.3/breuil-kisin-twist; BMS1 Example 4.2) has 𝔖{1}⊗_{𝔖,f}A_inf≃A_inf{1} as BKF objects, compatibly with φ and the G_{K∞} action; tensor powers and dual twists are preserved. This is the first step of the proof of BMS1 Corollary 4.33, whose statement is that Z_p(1) is sent to 𝔖{1} by the functor of BMS1 Theorem 4.4. R07.4 owns that representation classification, and PR.7/etale-realization supplies the corresponding statement that the étale realisation of the twist is Z_p(1); AI.0:integral and AI.2 own the A_inf twist and étale realization.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1.

**Dependencies.** `AInfCohomology:AI.7/bkf-tensor-functor`; `AInfCohomology:AI.7/coefficient-normalization`; `PrismaticCohomology:PR.3/breuil-kisin-twist`; `PrismaticCohomology:PR.7/etale-realization`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `AInfCohomology:AI.0/cyclotomic-coefficients`; `AInfCohomology:AI.0/period-regularity`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0/local-power-series-flatness`; `AInfCohomology:AI.0:integral/residue-map`; `AInfCohomology:AI.0:integral/breuil-kisin-line`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `AInfCohomology:AI.0:integral/perfectoid-coefficient-regularity`; `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/bkf-valid-operations`; `AInfCohomology:AI.2/bkf-etale-realization`; `AInfCohomology:AI.2/fargues-classification`; `PrismaticCohomology:PR.7/kisin-functor-comparison`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/finite-height-lattices`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/semistable-finite-height`.

**Proof or construction.** 𝔖{1} is the twist of the prism (𝔖,(E)) of PR.3/breuil-kisin-twist: the inverse limit of the conormal modules E_r𝔖/E_r²𝔖, E_r=Eφ(E)⋯φ^{r−1}(E), along the canonical maps divided by p (BMS1 Example 4.2). A_inf{1} is the same construction for (A_inf,(ξ̃)) with ξ̃_r=ξ̃φ(ξ̃)⋯φ^{r−1}(ξ̃) (BMS1 Example 4.24; AI.0:integral). f is a map of prisms (𝔖,(E))→(A_inf,(ξ̃)) commuting with φ (coefficient-normalization), so f(E_r) generates (ξ̃_r) and E_r𝔖/E_r²𝔖⊗_𝔖A_inf≅ξ̃_rA_inf/ξ̃_r²A_inf, both sides being free of rank one on the class of E_r, respectively f(E_r). These isomorphisms are compatible with the transition maps and with the Frobenius and give 𝔖{1}⊗_{𝔖,f}A_inf≅A_inf{1} in the limit; this is the functoriality of PR.3/breuil-kisin-twist for maps of prisms. BMS1 refers to the cotangent-complex definition for this step of Corollary 4.33 without expanding the argument. G_{K∞} fixes [π^♭], hence f(𝔖), and acts on A_inf{1} through automorphisms of the prism (A_inf,(ξ̃)), so the isomorphism is G_{K∞}-equivariant. Tensor powers and duals: bkf-tensor-functor is symmetric monoidal and 𝔖{1} is ⊗-invertible (BMS1 Example 4.2). This is not stated in Corollary 4.33; it follows from BMS1 Proposition 4.32. Z_p(1) and 𝔖{1}: A_inf{1}=(1/μ)(Z_p(1)⊗A_inf) (BMS1 Example 4.24; AI.0:integral, AI.2 Tate realization) gives a φ, G_{K∞}-equivariant identification 𝔖{1}⊗_𝔖W(C^♭)≅Z_p(1)⊗W(C^♭), which by the characterisation in BMS1 Theorem 4.4 shows that Z_p(1) is sent to 𝔖{1} (Kisin’s functor and the uniqueness of a lattice of finite E-height: R07.4/finite-height-lattices and R07.4/semistable-finite-height; the passage between Kisin’s embedding u↦[π^♭] and f, and the covariant normalisation: PR.7/kisin-functor-comparison); PR.7/etale-realization states the same for the étale realisation of the twist. No second twist or classification is constructed.

**Check.** H² of the Breuil–Kisin cohomology of the p-adic completion of P¹ over O_K is 𝔖{−1}, and its extension along f is A_inf{−1}=H²_Ainf of P¹ over O_C. A generator of 𝔖{1}, on which φ acts by a unit multiple of 1/E, maps under f to a generator of A_inf{1}, on which φ acts by a unit multiple of 1/ξ̃ (BMS1 Examples 4.2 and 4.24).

**Source.** BMS1, Corollary 4.33, proof, pp.281–282; BMS1, Corollary 4.33, p.281; BMS1, Example 4.2, pp.262–263; BMS1, Example 4.24, pp.276–277; BMS1, Theorem 4.4, p.265.

### frobenius-decalage — Breuil–Kisin Frobenius décalage identity

Target `AInfCohomology:AI.7/frobenius-decalage` (theorem).

**Statement.** For p-completely smooth R/O_K, the Frobenius factors canonically as φ_𝔖^*D_𝔖(R)≃Lη_E D_𝔖(R)→D_𝔖(R) (BS22 Theorem 15.3). For the trace complex, BMS2 Remark 11.17 gives the factorisation φ_𝔖^*D_𝔖^tr(R)≃Lη_E D_𝔖^tr(R)→D_𝔖^tr(R) from the Beilinson connective cover map from the Nygaard filtration of D̂_tw to the E-adic filtration of D_𝔖^tr. Under trace-prismatic-agreement, which respects the Nygaard filtrations on the Frobenius twists (BS22 Proposition 15.7), the two factorisations correspond. It does not assert a Nygaard filtration on D_𝔖 itself.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. R is the p-adic completion of a smooth O_K-algebra.

**Dependencies.** `AInfCohomology:AI.7/trace-prismatic-agreement`; `AInfCohomology:AI.7/twisted-trace`; `AInfCohomology:AI.7/trace-descent`; `PrismaticCohomology:PR.3/leta-frobenius-factorisation`; `AInfCohomology:AI.1/connective-comparison`; `AInfCohomology:AI.1/decalage-composition`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/flat-and-nonflat-base-change`; `AInfCohomology:AI.1/preservation-derived-completeness`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/filtered-beilinson-description`; `AInfCohomology:AI.1/eta-quotient-base-change`; `AInfCohomology:AI.1/semistable-almost-decalage`; `AInfCohomology:AI.1/completed-continuous-sum`; `AInfCohomology:AI.3/almost-to-honest`; `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`; `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/relative-bott-frobenius`; `AInfCohomology:AI.7/flat-coefficient-extension`.

**Proof or construction.** Import PR.3/leta-frobenius-factorisation (BS22 Theorem 15.3) for the prismatic statement and AI.1’s filtered décalage/Beilinson connective cover (BMS2 Proposition 5.8). For the trace complex follow BMS2 Remark 11.17. The AI.7 relative trace targets supply the filtered map from the Nygaard filtration of D̂_tw (BMS2 Remark 11.14) to the E-adic filtration of D_𝔖^tr: the restriction of the Frobenius to the i-th Nygaard step is divisible by E^i because v^i=E^i/b^i in π_*TC⁻(O_K/𝕊[z];Z_p)[1/b], and E is a non-zero-divisor on π_*TC⁻(S/𝕊[z];Z_p) for quasiregular semiperfectoid S. Its source is connective for the Beilinson t-structure as in BMS2 Corollary 7.10(1). That it is a connective cover is checked after extension to A_inf, where it is BMS2 Proposition 9.10; equivalences are detected there because 𝔖→A_inf is topologically free (flat-coefficient-extension). That the two factorisations correspond is not stated in the sources. Under trace-prismatic-agreement the filtered Frobenius of the previous step goes to the prismatic one: on quasiregular semiperfectoid algebras both send an element n of the i-th Nygaard step to E^i times the class n/E^i. The factorisation of a filtered map from a Beilinson-connective object through the connective cover is unique (PR.3/leta-frobenius-factorisation).

**Check.** The canonical inclusion after décalage is part of the identity, not merely an isomorphism of underlying graded modules.

**Source.** BS22, Theorem 15.3, p.103; BS22, Theorem 15.3, p.103, last sentence; BMS2, Remark 11.17, p.307; BMS2, Remark 11.17, p.307; BMS2, Remark 11.14, p.305; BMS2, Proposition 5.8, p.238.

### nygaard-nondescent — Nygaard filtration non-descent test

Target `AInfCohomology:AI.7/nygaard-nondescent` (theorem).

**Statement.** The Nygaard filtration on φ_𝔖^*D_𝔖^tr≃D̂_tw has no functorial descent along φ_𝔖 to a filtration on D_𝔖^tr with the same degree-zero projection D̂_tw(R)→gr⁰≃R. For R=O_K the projection is 𝔖^(−1)→O_K, and a descent of it is a quotient 𝔖/J with φ_𝔖(J)𝔖=(E). There are two cases. (i) If (E) is not of the form φ_𝔖(J)𝔖, which is so whenever p does not divide the degree e of E, in particular for unramified K, no descent exists even for R=O_K. (ii) If (E)=φ_𝔖(J)𝔖, as for K=Q_p(p^{1/p}) with π=p^{1/p} and J=(u−p), then J=ker θ_𝔖, the ring O₀=𝔖/J is identified by θ_𝔖 with the subring W(k₀)[π^p] of O_K, and O_K=O₀⊗_{𝔖,φ_𝔖}𝔖 is free of rank p over O₀. A functorial descent would then canonically descend every smooth formal O_K-scheme to O₀, and a good-reduction elliptic curve with j∈O_K∖O₀ contradicts it.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. The negative statement is about functorial descent of the filtration/projection; it does not prohibit accidental descents for individual objects. The elliptic-curve argument of BMS2 Remark 11.16 is complete in case (ii) only; K=Q_p(p^{1/p}) with π=p^{1/p}, E=u^p−p, k₀=F_p is the worked instance.

**Dependencies.** `AInfCohomology:AI.7/twisted-trace`; `AInfCohomology:AI.7/trace-descent`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`; `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/relative-bott-frobenius`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`.

**Proof or construction.** Use BMS2 Remark 11.16’s degree-zero Nygaard projection and its implied canonical scheme descent: a descent R₀ of the 𝔖^(−1)-algebra R along φ_𝔖 satisfies R≅R₀⊗_{𝔖,φ_𝔖}𝔖 and is killed by ker θ_𝔖=φ_𝔖^{-1}(E𝔖), because R is killed by E and φ_𝔖 is faithfully flat. The dichotomy is not in the source. BMS2 Remark 11.16 argues uniformly in K: a functorial descent would descend every smooth formal O_K-scheme to W(k₀)[π^p], the image of θ_𝔖, and an elliptic curve with good reduction and j∈O_K∖W(k₀)[π^p] contradicts this. That argument is complete only in case (ii). In case (i) no quotient O₀ of 𝔖 has O₀⊗_{𝔖,φ_𝔖}𝔖≅O_K, so there is no ring to which the schemes would descend, and for K unramified W(k₀)[π^p]=O_K, so that no such elliptic curve exists; there the non-descent is the statement that (E) is not extended along φ_𝔖. For R=O_K a descent of the surjection 𝔖^(−1)→O_K is a surjection 𝔖→𝔖/J with φ_𝔖(J)𝔖=(E), by faithful flatness of φ_𝔖. Modulo p the ideal φ_𝔖(J)𝔖 of k₀[[u]] is generated by a power u^{pm}, while E≡u^e, so p divides e in case (ii). There J⊂ker θ_𝔖 and both ideals have the same extension along φ_𝔖, so J=ker θ_𝔖; and O_K=𝔖/E=O₀⊗_{𝔖,φ_𝔖}𝔖 is free of rank p over O₀ because φ_𝔖 is finite free of rank p. In particular O₀≠O_K. Worked instance of case (ii): K=Q_p(p^{1/p}), π=p^{1/p}, E=u^p−p, θ_𝔖(u)=p, J=(u−p), φ_𝔖(u−p)=E, O₀=Z_p. Choose c∈Z_p with c and c−1728 units (any unit c if p≤3) and put j=c+π; then j∉Z_p because [K:Q_p]=p>1. The curve y²+xy=x³−36x/(j−1728)−1/(j−1728) over O_K has c₄=j/(j−1728), discriminant j²/(j−1728)³, which is a unit, and j-invariant j; it has good reduction. A descent of its p-adic completion to Z_p would be a smooth proper formal curve of genus one over Z_p; it has a section, by Lang’s theorem on the special fibre and smoothness, hence algebraizes to an elliptic curve over Z_p with the same j-invariant, which forces j∈Z_p.

**Check.** For K=Q_p(p^{1/p}), π=p^{1/p}: O₀=Z_p, O_K is free over Z_p on 1,π,…,π^{p−1}, and the elliptic curve of the proof has j=c+π, which is not in Z_p. For K=Q_p with π=p (E=u−p) case (i) applies: W(k₀)[π^p]=Z_p=O_K, so no elliptic curve with j∈O_K∖W(k₀)[π^p] exists, and the non-descent comes from the fact that (u−p) is not generated by a power series in u^p.

**Source.** BMS2, Remark 11.16, p.307; BMS2, Remark 11.16, p.307; BMS2, Remark 11.14, p.305.

### choice-transport — Uniformizer-choice transport after A_inf extension

Target `AInfCohomology:AI.7/choice-transport` (construction).

**Statement.** For two choices (π,π^♭) and (π′,π′^♭), extend their respective 𝔖-valued complexes along the normalized maps f,f′ to the same A_inf. Define the transport as the first ainf-base-change equivalence followed by the inverse of the second, through the intrinsic AΩ complex. It is Frobenius compatible and satisfies identity/cocycle; being defined through AΩ, it is compatible with products and natural in 𝔛 as far as ainf-base-change is, and it identifies the specialisations of the two extensions along θ_A, θ̃_A and A_inf→W(k̄). Descent of a morphism to either 𝔖 is extra structure for derived objects, not a property: by complete-flat-descent, which applies because f is p-completely faithfully flat, the 𝔖-linear maps between derived p-complete complexes are the points of the totalisation of the mapping spaces of their p-completed base changes to the p-completed Čech nerve of f; for perfect complexes, as for proper 𝔛, these base changes are the ordinary ones. For finitely presented 𝔖-modules, such as the H^i_𝔖 of a proper 𝔛, a morphism of the A_inf-extensions comes from a unique 𝔖-linear morphism exactly when its two pullbacks to the p-completion of A_inf⊗_𝔖A_inf agree. No 𝔖-linear identification of unrelated coefficient rings is asserted. The construction is not in BMS2 or BS22.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. (π,π^♭) and (π′,π′^♭) are two choices of a uniformizer of O_K with a compatible system of p-power roots in O_C; E, E′ are their Eisenstein polynomials, f, f′ the normalized maps of coefficient-normalization, and the two Breuil–Kisin prisms are (W(k₀)[[u]],(E)) and (W(k₀)[[u]],(E′)). 𝔛 is smooth, quasi-compact and quasi-separated over O_K, as in ainf-base-change.

**Dependencies.** `AInfCohomology:AI.7/ainf-base-change`; `AInfCohomology:AI.7/flat-coefficient-extension`; `AInfCohomology:AI.3/classical-ainf-sheaf`; `AInfCohomology:AI.3/classical-derived-ainf-comparison`; `AInfCohomology:AI.3/derived-ainf-sheaf`; `AInfCohomology:AI.3/perfectoid-period-sections`; `AInfCohomology:AI.3/q-de-rham-model`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AdicEtaleGeometry:A1`; `PadicHodgeTheory:P8:local-rational`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `DerivedDeRhamCohomology:DD.1/complete-flat-descent`.

**Proof or construction.** Use the intrinsic AI.3/AI.5 functor and ainf-base-change for both choices. Compose those canonical equivalences and use their naturality; identity and cocycle hold by construction, the transport from choice i to choice j being α_j^{-1}∘α_i for the equivalences α_i of ainf-base-change. The descent statements are complete-flat-descent applied to f, whose hypotheses are checked in flat-coefficient-extension. For finitely presented modules the mapping spaces are discrete, so the totalisation is an equaliser; this uses that the p-completed tensor powers of A_inf over 𝔖 are flat over 𝔖 (flat-coefficient-extension, BMS1 Remark 4.31), so that the base changes of the modules stay discrete.

**Uses.**

- AI.7 acceptance and HabiroCohomologyFoundations:HQ.8: Consumers need the canonical shared comparison diagram without pretending the uniformizer was never chosen.

**API.**

- `CohomologicalBK.choiceTransport.identity` (simp): Transport for the same choice is the identity under its fixed comparison.
- `CohomologicalBK.choiceTransport.cocycle` (functoriality): For three choices transport₍₂₃₎∘transport₍₁₂₎=transport₍₁₃₎.
- `CohomologicalBK.choiceTransport.descend` (characterisation): For a fixed f and derived p-complete 𝔖-complexes D, D′, the space of 𝔖-linear maps D→D′ is the totalisation of the mapping spaces between the p-completed base changes of D and D′ to the terms of the p-completed Čech nerve of f (complete-flat-descent); so for derived objects a morphism over A_inf descends only together with coherence data on the higher terms. For finitely presented 𝔖-modules M, M′ a morphism M⊗_𝔖A_inf→M′⊗_𝔖A_inf comes from a unique 𝔖-linear morphism precisely when its two pullbacks to the p-completion of A_inf⊗_𝔖A_inf agree.

**Definition tests.**

- `CohomologicalBK.choiceTransport.point` (degenerate): For SpfO_K every extension identifies with A_inf and the transport is its identity.
- `CohomologicalBK.choiceTransport.root_change` (compatibility): For the same π and two compatible systems of roots, π′^♭=ε^a·π^♭ with a∈Z_p and ε=(1,ζ_p,ζ_{p²},…), one has f′(u)=[ε]^{ap}·f(u), so f≠f′ when a≠0, while both extensions are identified with the same AΩ; for 𝔛=Spf O_K the transport is the identity of A_inf although the two 𝔖-algebra structures on A_inf differ.
- `CohomologicalBK.choiceTransport.different_uniformizers` (non-example): For two uniformizers π≠π′ one has θ̃_A(f(u))=π and θ̃_A(f′(u))=π′, so f(u)≠f′(u): the transport is not 𝔖-linear for the identification of the two copies of W(k₀)[[u]] that sends u to u.

**Check.** Choice-independent transport is on the common A_inf extension; the unextended rings have explicitly different maps u↦[π^♭]^p.

**Source.** BMS2, §1.1, p.200; BMS2, Notation 11.1, p.298; BMS2, Theorem 11.2(1), p.298.

### comparison-diagram-agreement — Agreement of smooth comparison maps

Target `AInfCohomology:AI.7/comparison-diagram-agreement` (theorem).

**Statement.** (a) [BS22 Theorem 17.2, Remark 17.3, Lemma 17.4, Theorem 18.2] For p-completely smooth R/O_C, import AΩ_R≃φ_A^*Δ_{R/(A_inf,kerθ)} from PR.6; equivalently AΩ_R is prismatic cohomology of R over the perfect prism (A_inf,(ξ̃)), with A_inf/ξ̃≅O_C through θ̃. Under it the Hodge–Tate structure map η:R→H⁰(AΩ_R⊗^L_{A_inf,θ̃}O_C) of AI.4 agrees with the prismatic one, and the two Hodge–Tate isomorphisms of commutative differential graded algebras between (Ω^*_{R/O_C},d) and the cohomology of the θ̃ reduction with its Bockstein differential correspond; in particular the classes of dt on O_C⟨t⟩ and of dlog t on O_C⟨t^{±1}⟩ correspond. The comparison is the only isomorphism of such functors on p-completely smooth O_C-algebras that is compatible with η. The Breuil–Kisin twists are trivialised by the generator ξ̃, as in the proof of BS22 Theorem 17.2. The uniqueness statement, and the correspondence of the Hodge–Tate isomorphisms as natural isomorphisms of differential graded algebras, use that the comparison is natural in R and symmetric monoidal; BS22 assert both (Theorem 17.2, Remark 17.3) and they are not proved here. For a fixed R the isomorphism and its compatibility with η do not depend on them. (b) [Not in the sources.] It is neither stated nor proved in BS22, BMS1 or BMS2 that under these identifications the θ de Rham, crystalline, étale and B_dR⁺ comparison maps of AI.4–AI.5 correspond to those induced from the prismatic comparisons, nor that the Breuil–Kisin and trace specialisation maps of AI.7 correspond. These agreements are the open part of this target: the stage has to prove them, and no source does. BS22 Theorem 18.2 does not give them: it concerns functors, defined on all p-completely smooth algebras over the perfectoid ring, with values in complexes over a perfect prism, so it applies neither over the non-perfect prism (A_cris,(p)) nor to functors defined only on smooth O_K-algebras. The crystalline agreement is to be checked on the same PD/Koszul generators; uniqueness of the A_inf functor alone is not claimed to prove it.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. Smooth R, not the singular semistable models of AI.6; the prism for §18 uniqueness is perfect, and the Hodge–Tate structure transformation η is part of the comparison datum. C, the completed algebraic closure of K, is a perfectoid field of characteristic 0 containing μ_{p^∞}, as BS22 §17 requires. The perfect prism for the uniqueness statement is (A_inf,(ξ̃)), and η is the map from R to H⁰ of the reduction along θ̃.

**Dependencies.** `PrismaticCohomology:PR.6/ainf-omega-comparison`; `PrismaticCohomology:PR.6/theta-theta-tilde-square`; `PrismaticCohomology:PR.6/comparison-uniqueness`; `PrismaticCohomology:PR.1/crystalline-comparison`; `PrismaticCohomology:PR.1/prismatic-base-change`; `AInfCohomology:AI.4/hodge-tate`; `AInfCohomology:AI.4/hodge-tate-cotangent`; `AInfCohomology:AI.4/de-rham`; `AInfCohomology:AI.4/bounded-pd-coefficients`; `AInfCohomology:AI.4/pd-toric-eta-comparison`; `AInfCohomology:AI.4/pd-logarithmic-coordinate`; `AInfCohomology:AI.4/absolute-crystalline-comparison`; `AInfCohomology:AI.4/mu-inverted-etale`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/bdr-envelope-contraction`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`; `AInfCohomology:AI.6/smooth-integral-bdr-agreement`; `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`; `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/relative-bott-frobenius`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `AInfCohomology:AI.7/ainf-base-change`; `AInfCohomology:AI.7/trace-prismatic-agreement`; `AInfCohomology:AI.7/de-rham-base-change`; `AInfCohomology:AI.7/crystalline-base-change`.

**Proof or construction.** (a) Import AΩ_R≃φ_A^*Δ_{R/A_inf} with its Frobenius compatibility from PR.6/ainf-omega-comparison (BS22 Theorem 17.2, Remark 17.3). The comparison map intertwines the two Hodge–Tate structure maps η; BS22 leaves the reduction to the completed torus R = O_C[x^{±1}]^∧ to the reader, and PR.6/theta-theta-tilde-square records it. By BS22 Lemma 17.4 a multiplicative map that intertwines the maps η induces an isomorphism of the cohomology algebras of the θ̃ reductions with their Bockstein differentials, both identified with (Ω^*_{R/O_C},d) through the universal property of the de Rham complex; so compatibility with dt on O_C⟨t⟩ and dlog t on O_C⟨t^{±1}⟩ is a consequence of compatibility on H⁰, not an additional condition. (a) Apply PR.6/comparison-uniqueness (BS22 Theorem 18.2) over the perfect A_inf prism (A_inf,(ξ̃)): the pair formed by prismatic cohomology and η has no nontrivial endomorphism among pairs (G,η) with G a symmetric monoidal functor on all p-completely smooth O_C-algebras; Frobenius compatibility is not an extra hypothesis of that uniqueness theorem. This step needs the comparison as a morphism of pairs (G,η) of symmetric monoidal functors, hence its naturality in R and its multiplicativity. (b) is not proved. A possible route: for the θ de Rham map, compare the two factorisations of Frobenius through Lη_{ξ̃} (that of AΩ in BMS1 and BS22 Theorem 15.3), noting that BMS1 Theorem 14.1 deduces its de Rham comparison from the A_cris comparison and mentions the route through Lη only as an alternative; for the crystalline maps use PR.1 crystalline/base change and AI.4’s actual PD maps and check on PD/Koszul generators; for the Breuil–Kisin and trace maps use ainf-base-change, trace-prismatic-agreement and the AI.7 relative trace comparison map; AI.5 and AI.6 supply the generic étale/B_dR square.

**Check.** On a torus, θ̃ H⁰ is R, whereas the θ de Rham H⁰ is O_C; the tests detect the omitted φ_A twist. The comparison datum is η on H⁰ of the θ̃ (Hodge–Tate) reduction, natural and multiplicative in R; the polynomial and torus tests check its consequences on dt and dlog t through the Bockstein differential. H⁰ of the θ de Rham reduction, which is O_C on a torus, tests nothing.

**Source.** BS22, §17, first paragraph, p.117; BS22, Theorem 17.2, p.117; BS22, Remark 17.3, p.117; BS22, Theorem 17.2, proof, p.120; BS22, Lemma 17.4, p.120; BS22, Notation 18.1, p.122; BS22, Theorem 18.2, p.122; BS22, Example 1.9(2), p.5; BMS1, Theorem 14.1, proof, p.389.

### de-rham-torsion-divisibility — De Rham torsion divisibility constraint

Target `AInfCohomology:AI.7/de-rham-torsion-divisibility` (application).

**Statement.** Let K=Q_p(p^{1/p}) with uniformizer π=p^{1/p} and 𝔛/O_K proper smooth. The map θ_𝔖 has u↦π^p=p and factors through Z_p. Therefore RΓ_dR(𝔛/O_K) is the scalar extension of a perfect Z_p-complex. Each cyclic indecomposable summand of H^i_dR(𝔛/O_K)_tors has O_K-length divisible by p; equivalently it is O_K/(π^{pa}) for some a≥1. The total torsion length is a multiple of p.

**Hypotheses.** K is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, π a fixed uniformizer of O_K and E∈W(k₀)[u] its Eisenstein polynomial. C is the completion of K̄ and π^♭=(π,π^{1/p},π^{1/p²},…)∈O_C^♭ is a fixed compatible system of p-power roots of π. 𝔖=W(k₀)[[u]] with its Frobenius φ_𝔖 (Witt Frobenius on W(k₀), u↦u^p) is the ring of R07.4/bk-coefficient-rings; all derived operations use the shared enhancement of EnhancedDerivedSheaves:E1. In this node K=Q_p(p^{1/p}), π=p^{1/p}, so k₀=F_p, W(k₀)=Z_p and E=u^p−p; 𝔛 is proper and smooth over O_K.

**Dependencies.** `AInfCohomology:AI.7/de-rham-base-change`; `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/coefficient-normalization`; `AInfCohomology:AI.2/ainf-module-perfectness`; `AInfCohomology:AI.2/ainf-module-structure`; `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/finite-level-length-bound`; `AInfCohomology:AI.5/specialization-rank-and-length`; `AInfCohomology:AI.5/adjacent-degree-freeness`; `AInfCohomology:AI.5/p-local-freeness-from-periods`; `AInfCohomology:AI.5/cohomology-finiteness-from-periods`; `mathlib:Module.equiv_free_prod_directSum`; `mathlib:Module.equiv_directSum_of_isTorsion`.

**Proof or construction.** Use de-rham-base-change and the coefficient-normalization map; take RΓ_𝔖⊗^L_{u↦p}Z_p. Use O_K finite free of ramification degree p over Z_p, so cohomology commutes with this extension. Apply the structure theorem for finitely generated modules over the principal ideal domain Z_p (Mathlib) to the cohomology of the perfect Z_p-complex: Z_p/(p^a) extends to O_K/(π^{pa}); uniqueness of the elementary divisors of a finitely generated torsion module over the discrete valuation ring O_K is taken from AI.5.

**Check.** For p=3 a cyclic summand of length 1 or 2 is excluded, while length 3a is allowed. For K=Q_p(p^{1/p}): O_K/π is not of the form M⊗_{Z_p}O_K for a Z_p-module M, since its length 1 is not divisible by p; so not every finitely generated torsion O_K-module can occur.

**Source.** BMS2, Remark 1.4, p.202; BMS2, Remark 1.4, p.202; BMS2, Theorem 1.2(2), p.201; BMS2, Remark 11.13, p.305.

### relative-cyclotomic-traces — Relative cyclotomic traces over the sphere polynomial ring

Target `AInfCohomology:AI.7/relative-cyclotomic-traces` (construction).

**Statement.** Let 𝕊[z]=𝕊[ℕ] be the monoid-algebra sphere spectrum, not the free E∞-ring on a degree-zero element. For a connective E∞-𝕊[z]-algebra A, define THH(A) by the cyclic bar realization and THH(A/𝕊[z])=THH(A)⊗_{THH(𝕊[z])}𝕊[z]. It is a circle-equivariant E∞-algebra. The cyclic bar B^cyℕ has weight-zero point and positive-weight circles with t·(s,n)=(t^n s,n). The cyclotomic map comes from (s,n)↦(s^p,pn), the absolute cyclotomic map and lax monoidality of the finite-group Tate construction. It is semilinear for z↦z^p. Define TC⁻(A/𝕊[z];Z_p)=THH(A/𝕊[z])^{h𝕋} and TP(A/𝕊[z];Z_p)=THH(A/𝕊[z])^{t𝕋}, with canonical map can and cyclotomic Frobenius phi. These two maps have different coefficient normalizations.

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. A has the specified 𝕊[z]-algebra structure. The cyclotomic target circle action uses 𝕋≅𝕋/C_p, not the unchanged residual action.

**Dependencies.** `EnhancedDerivedSheaves:E5:abstract/algebra-objects`; `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`.

**Proof or construction.** Realize the cyclic bar of an E∞-algebra in spectra to obtain THH and its circle action. The needed stable spectral and norm/Tate operations are the supplier extension G-TRACE-FOUNDATIONS, not ordinary derived-category operations at the pin. Compute the monoid cyclic bar weightwise. The square relating its augmentation to z↦z^p allows the relative tensor product to inherit the cyclotomic map by Construction 11.5. Take circle homotopy fixed points and the circle Tate construction; the canonical and Frobenius maps are induced separately.

**Uses.**

- AInfCohomology:AI.7/relative-trace-coefficients: Defines the invariants whose coefficients control Breuil–Kisin descent.
- AInfCohomology:AI.7/relative-trace-base-change: Allows the two sphere-polynomial specializations.

**API.**

- `AInf.relative_cyclotomic_traces.augmentation` (projection): The augmentation THH(𝕊[z])=𝕊[B^cyℕ]→𝕊[z] forgets the circle coordinate and preserves the weight n.
- `AInf.relative_cyclotomic_traces.base_map` (functoriality): A map of E∞-𝕊[z]-algebras induces the relative trace maps, preserving circle action, can and the z^p-semilinear phi.
- `AInf.relative_cyclotomic_traces.relative_tensor` (characterisation): Relative THH is the indicated tensor pushout, hence the universal circle-equivariant E∞-𝕊[z]-algebra receiving a nonequivariant map from A.
- `AInf.relative_cyclotomic_traces.can_phi` (compatibility): can is 𝔖^(−1)-linear on relative coefficients; phi is Witt-Frobenius/u^p-semilinear after the coefficient identification.
- `AInf.relative_cyclotomic_traces.completion` (compatibility): p-completion and compatible base changes use spectral derived tensor and the stated completed limits; no ordinary ungraded tensor replaces them.

**Definition tests.**

- `relative_cyclotomic_traces_base` (degenerate): THH(𝕊[z]/𝕊[z])=𝕊[z] with trivial circle action and cyclotomic Frobenius z↦z^p.
- `relative_cyclotomic_traces_weight_zero` (computation): The cyclic-bar weight-zero component is a single fixed point; it is not a full circle.
- `relative_cyclotomic_traces_weight_p` (computation): On the weight-p component the circle action is t^p, whereas the weight-one component has action t. They cannot be assigned the same circle action.
- `relative_cyclotomic_traces_frobenius` (computation): The monoid cyclotomic map sends the weight-one class to weight p and raises its circle coordinate to the p-th power.
- `relative_cyclotomic_traces_free_ring` (non-example): The free E∞-ring on a degree-zero class has ⊕_n𝕊_{hΣ_n} as its underlying spectrum; it is not substituted for the monoid algebra 𝕊[ℕ].

**Check.** The spectral base has π_*𝕊[z]=π_*𝕊[z]; a free E∞ generator would have symmetric-group homotopy and fail this description. Relative traces remain circle-equivariant and Frobenius-semilinear for z^p throughout base change.

**Source.** BMS2, §1.2, pp.201–203; Proposition 11.3 and Construction 11.5, pp.299–300.

### absolute-perfectoid-trace-coefficients — Perfectoid trace coefficient calculation

Target `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients` (theorem).

**Statement.** For an integral perfectoid R with A_inf(R), one can choose a theta-kernel generator ξ and compatible degree-two generators, with tilde-ξ=phi(ξ), such that π_*THH(R;Z_p)=R[b], π_*TC⁻(R;Z_p)=A_inf(R)[b,v]/(bv−ξ), and π_*TP(R;Z_p)=A_inf(R)[σ^{±1}], with |b|=|σ|=2 and |v|=−2. can is A_inf-linear with b↦ξσ, v↦σ^−1; phi is semilinear for Witt Frobenius with b↦σ, v↦tilde-ξ σ^−1. For connective E∞-R-algebras A, quotient by v gives THH(A;Z_p), while the TP quotient by tilde-ξ gives THH(A;Z_p)^{tC_p}. These formulas use a compatible choice of ξ as well as the graded generators; they do not assert simultaneous normalization for an arbitrary preassigned ξ or a canonical basis of a Tate line.

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. R integral perfectoid, with its primitive theta-kernel generator and the coefficient identification from P1/PR.0.

**Dependencies.** `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.0/theta-witt-family`; `AInfCohomology:AI.0:integral/completed-cotangent-twist`; `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Proof or construction.** The perfectoid completed cotangent calculation gives the HKR filtration. The Bökstedt calculation for F_p and perfectoid base change give the polynomial THH coefficients; the source uses a pseudocoherence/Nakayama induction. Use the homotopy fixed point and Tate spectral sequences to identify the ξ-adic thickening with A_inf by its universal property. Normalize the generators so phi(b)=σ, then multiplicativity determines phi(v). Use the perfect TC⁻-module quotient by v to identify the connective algebra base-change squares. The F_p Bökstedt calculation remains an explicit spectral supplier input.

**Check.** The canonical and Frobenius maps send bv to ξ and tilde-ξ respectively. For characteristic-p perfect R, ξ=p; the formula reduces to the Witt coefficient calculation.

**Source.** BMS2, Theorem 6.1 and Propositions 6.2–6.4, pp.243–248.

### qrsp-trace-unfolding — Quasisyntomic unfolding of the trace coefficient sheaf

Target `AInfCohomology:AI.7/qrsp-trace-unfolding` (construction).

**Statement.** For quasiregular semiperfectoid S over a perfectoid R, put D̂_S=π_0TC⁻(S;Z_p)≃π_0TP(S;Z_p). The spectral sequences are even; multiplication by v^i identifies π_{2i}TC⁻ with the complete descending Nygaard level N^{≥i}D̂_S, with gr_N^iD̂_S≃π_{2i}THH for i≥0. The cohomology groups form acyclic sheaves on the quasiregular semiperfectoid basis. Unfold these sheaves to the quasisyntomic site and define gr^0TC⁻=gr^0TP as D̂_A. For a general A this unfolded object is a derived complex, not π_0TC⁻(A). Its coherent multiplicative filtration and coefficient twists are retained.

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. S quasiregular semiperfectoid; A quasisyntomic and p-complete with bounded p-torsion as in BMS2. The quasisyntomic site, its quasiregular semiperfectoid basis and symmetric monoidal sheaf-unfolding equivalence are supplied by PR.3 and E2.

**Dependencies.** `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `PrismaticCohomology:PR.3`; `DerivedDeRhamCohomology:DD.1/beilinson-t-structure`; `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`.

**Proof or construction.** Use the quasiregular cotangent-amplitude calculation and THH/HKR filtration to prove evenness and the p-complete flatness of the homotopy groups. The fixed-point/Tate spectral sequences degenerate; read the v^i filtration and use flat descent of derived exterior powers to prove sheaf acyclicity. Apply the symmetric monoidal unfolding equivalence on the basis (BMS2 Proposition 4.31). Recover the complete multiplicative filtered complex, not a chosen cochain model.

**Uses.**

- AInfCohomology:AI.7/absolute-trace-aomega-comparison: Gives the absolute trace object compared with AΩ.
- AInfCohomology:AI.7/relative-qrsp-evenness: Supplies the evenness/descent calculation after perfectoid scalar extension.

**API.**

- `AInf.qrsp_trace_unfolding.basis_value` (characterisation): Restriction of the unfolded D̂ to a quasiregular semiperfectoid basis object is π_0TC⁻≃π_0TP.
- `AInf.qrsp_trace_unfolding.nygaard` (structure): N^{≥i} is the v^i image of π_{2i}TC⁻ for i≥0, complete, descending and multiplicative, with the stated graded pieces.
- `AInf.qrsp_trace_unfolding.frobenius` (compatibility): The cyclotomic Frobenius carries N^{≥i} to tilde-ξ^iD̂ and therefore admits the divided Frobenius in the perfectoid coefficient convention.
- `AInf.qrsp_trace_unfolding.restriction` (functoriality): Quasisyntomic pullback and Čech descent preserve the unfolded algebra and its complete filtration.

**Definition tests.**

- `qrsp_trace_unfolding_perfectoid` (computation): For S=R perfectoid, D̂_R=A_inf(R) and N^{≥1} is (ξ).
- `qrsp_trace_unfolding_grade_zero` (computation): The Nygaard graded piece of index zero identifies with π_0THH(S;Z_p)=S on the quasiregular semiperfectoid basis.
- `qrsp_trace_unfolding_positive_degree` (non-example): For a smooth algebra with nonzero differential forms the unfolded D̂ need not be concentrated in degree zero.
- `qrsp_trace_unfolding_degree_shift` (compatibility): Multiplication by v^i takes homotopy degree 2i to degree zero; multiplying by b^i would give the wrong degree and filtration.

**Check.** On a quasiregular semiperfectoid basis object D̂ is discrete and agrees with π_0TP. On a smooth torus the unfolded object has higher cohomology and cannot be replaced by an unproved discrete π_0 object.

**Source.** BMS2, Proposition 4.31, p.230; Theorems 7.1–7.2, Constructions 7.4 and 7.7, and Proposition 7.9, pp.254–257; Corollary 7.10, pp.258–259.

### absolute-trace-aomega-comparison — Absolute trace comparison with AΩ

Target `AInfCohomology:AI.7/absolute-trace-aomega-comparison` (comparison).

**Statement.** For A the p-adic completion of a smooth O_C-algebra, the unfolded trace algebra D̂_A is naturally equivalent to AΩ_A as E∞-A_inf-algebras, compatibly with Frobenius. The map is obtained from perfectoid A-algebra evaluations, factors through Lη_mu using the Nygaard/Frobenius divisibility criterion, and is made integral by quasisyntomic descent and left Kan extension from topologically free covers. It is not an arbitrarily chosen equivalence between the realizations.

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. p prime; C a complete algebraically closed nonarchimedean extension of Q_p; O_C its valuation ring. A_inf=W(O_C^flat), theta, phi, xi, mu and tilde-xi have the normalization of AI.0. No noetherianity of O_C or A_inf is assumed. A the p-adic completion of a smooth O_C-algebra, with the corrected pro-étale AΩ definition.

**Dependencies.** `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.3/aomega`; `AInfCohomology:AI.3/framing-independence-and-descent`; `AInfCohomology:AI.1/filtered-beilinson-description`; `PrismaticCohomology:PR.3`.

**Proof or construction.** Evaluate on perfectoid algebras to obtain D̂_A→RΓ_proet(A,A_inf). Factor by the Frobenius/Nygaard criterion through Lη_mu, first in the almost category. Use topologically free quasiregular covers to remove the almost obstruction, then descend. Compare the de Rham reductions modulo ξ. Claim 9.7 checks the identity in degree zero modulo (p,ξ); Lemma 9.9 uses the Bockstein to obtain the identity in every cohomological degree. Derived ξ-completeness proves equivalence.

**Check.** At A=O_C the comparison is the normalized A_inf identity. The integral comparison requires the almost-to-integral repair and is not a formal consequence of equal reductions.

**Source.** BMS2, Theorem 9.6 with proof, pp.286–289; Theorem 1.8, pp.204–205.

### characteristic-p-trace-comparison — Characteristic-p trace and crystalline comparison

Target `AInfCohomology:AI.7/characteristic-p-trace-comparison` (comparison).

**Statement.** For a quasiregular semiperfect F_p-algebra S, the trace D̂_S is naturally the Nygaard completion of its derived de Rham–Witt/crystalline complex, preserving the Nygaard filtration. Cyclotomic Frobenius agrees with the functorial Frobenius of S and lifts the mod-p Frobenius. By descent, for a smooth algebra A over a perfect field k this gives the de Rham–Witt/crystalline trace comparison. The separate Segal input is: for A smooth of dimension d, THH(A)→THH(A)^{tC_p} is the connective truncation in degrees ≥d, in the precise degree-by-degree form of BMS2 Corollary 8.18; it yields the stable-range Frobenius used by Proposition 11.15. More precisely gr^iTHH(A)≃(τ^{≤i}Ω^•_{A/k})[2i] and gr^iTHH(A)^{tC_p}≃Ω^•_{A/k}[2i], and the map is the truncation inclusion; hence the whole map is an equivalence in homotopy degrees ≥d.

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. For the discrete statement S is quasiregular semiperfect over F_p; for the smooth statement k is perfect and A smooth of finite dimension d.

**Dependencies.** `AInfCohomology:AI.7/qrsp-trace-unfolding`; `CrystallineCohomology:CR.4/nygaard-filtration-comparisons`; `CrystallineCohomology:CR.4/relative-witt-complex`; `DerivedDeRhamCohomology:DD.1/beilinson-t-structure`.

**Proof or construction.** Compare the mod-p trace reduction with derived de Rham. Compute the universal semiperfect torus example to make the thickening a PD thickening and identify the two Frobenius maps. Use the universal PD envelope and extend the map to Nygaard completions, then descend to smooth A. Keep the distinction between the cyclotomic and ring-induced Frobenius until agreement is proved. Apply the THH filtration and characteristic-p Frobenius calculation in the range ≥d to obtain the Segal connective truncation. The exact threshold is checked separately when applying Bott inversion.

**Check.** For a perfect field k the coefficient object is W(k). The crystalline comparison is filtered after Nygaard completion; it is not equality of an uncompleted PD envelope with π_0TP.

**Source.** BMS2, Theorem 8.17 and proof, pp.276–279; Corollary 8.18, pp.279–280; Theorem 1.10, p.205.

### relative-trace-base-change — Relative trace specializations of the sphere polynomial base

Target `AInfCohomology:AI.7/relative-trace-base-change` (theorem).

**Statement.** For an O_K-algebra A with spectral structure z↦π, relative THH base extension along 𝕊[z]→𝕊, z↦0, gives THH(A⊗^L_{O_K}k), preserving the circle action and cyclotomic Frobenius. After base change to 𝕊[z^{1/p^∞}] and p-completion, relative THH identifies with absolute THH of A⊗^L_{O_K}O_{K_∞}, where O_{K_∞} is the p-completed union adjoining compatible p-power roots of π. For the p-completed smooth flat algebras used in AI.7 the derived base changes agree with the ordinary completed ones. No analogous unrestricted base-change commutation for TC⁻ or TP is asserted without the completeness and descent arguments.

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. K is a complete discretely valued extension of Q_p with perfect residue field k; π is a fixed uniformizer with Eisenstein polynomial E over W(k). 𝔖=W(k)[[u]], phi acts by Witt Frobenius and u↦u^p. 𝔖^(−1) is a copy of 𝔖 regarded as a 𝔖-algebra along phi. In the spectral sphere-polynomial base use a separate variable z↦π; in coefficient formulas u is the power-series variable and b is the degree-two class. Derived tensor is taken in E∞-rings; the ordinary quotient identification needs the indicated flatness.

**Dependencies.** `AInfCohomology:AI.7/relative-cyclotomic-traces`; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; `PerfectoidSpaces:P1`.

**Proof or construction.** Use the spectral pushout for z↦0 and the augmentation square to identify the residue algebra. The p-completed cotangent complex of the monoid algebra with all p-power roots vanishes. Its HKR filtration gives THH of that base equal to the base after p-completion; relative-to-absolute base change follows. Preserve the semilinear Frobenius on the base through both pushouts.

**Check.** At A=O_K the z=0 specialization gives THH(k). A torsion O_K-algebra requires derived residue tensor; silently using its ordinary residue quotient would lose Tor.

**Source.** BMS2, Lemma 11.6, Proposition 11.7 and Corollary 11.8, p.301.

### relative-trace-coefficients — Relative Breuil–Kisin trace coefficients

Target `AInfCohomology:AI.7/relative-trace-coefficients` (theorem).

**Statement.** For O_K, the p-completed relative coefficients are π_*THH=O_K[b], π_*TC⁻=𝔖^(−1)[b,v]/(bv−E), and π_*TP=𝔖^(−1)[σ^{±1}], with |b|=|σ|=2 and |v|=−2. can sends b↦Eσ and v↦σ^−1, linearly on 𝔖^(−1); phi acts by Witt Frobenius/u^p on coefficients and sends b↦σ, v↦phi(E)σ^−1. The Tate target of relative THH has coefficients O_K[π^{1/p}][σ^{±1}]; its coefficient map evaluates u at π^{1/p}, rather than π. These equalities use the relative sphere-polynomial construction, not absolute THH(O_K).

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. K is a complete discretely valued extension of Q_p with perfect residue field k; π is a fixed uniformizer with Eisenstein polynomial E over W(k). 𝔖=W(k)[[u]], phi acts by Witt Frobenius and u↦u^p. 𝔖^(−1) is a copy of 𝔖 regarded as a 𝔖-algebra along phi. In the spectral sphere-polynomial base use a separate variable z↦π; in coefficient formulas u is the power-series variable and b is the degree-two class.

**Dependencies.** `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/coefficient-normalization`.

**Proof or construction.** Base change along the perfectoid root base reduces the computation to the perfectoid coefficient theorem. Identify π_0 with the Frobenius-shifted copy of 𝔖 and choose compatible generators. Multiplicativity forces the two formulas on v from the relation bv=E. Track theta^(−1) and tilde-theta^(−1) in the square with THH and its finite Tate construction.

**Check.** can(bv)=E, whereas phi(bv)=phi(E). The target quotient evaluation u↦π^{1/p} distinguishes tilde-theta from theta in this trace diagram.

**Source.** BMS2, Proposition 11.10 and diagram, pp.302–303.

### relative-qrsp-evenness — Relative quasiregular evenness and descent

Target `AInfCohomology:AI.7/relative-qrsp-evenness` (theorem).

**Statement.** For S a quasiregular semiperfectoid quasisyntomic O_K-algebra, the relative THH, TC⁻ and TP spectra over 𝕊[z] have no odd homotopy. Each homotopy group is an acyclic sheaf on the quasiregular semiperfectoid basis. π_0TC⁻≃π_0TP unfolds to an E∞-𝔖^(−1)-algebra D̂_{A/𝔖^(−1)} on QSyn_{O_K}, with the complete descending multiplicative Nygaard filtration from the homotopy fixed point spectral sequence. For smooth A this is the twisted trace complex of the imported AI.7 target; its specializations are those of Corollary 11.12, including the identity Witt map and u↦π on 𝔖^(−1).

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. K is a complete discretely valued extension of Q_p with perfect residue field k; π is a fixed uniformizer with Eisenstein polynomial E over W(k). 𝔖=W(k)[[u]], phi acts by Witt Frobenius and u↦u^p. 𝔖^(−1) is a copy of 𝔖 regarded as a 𝔖-algebra along phi. In the spectral sphere-polynomial base use a separate variable z↦π; in coefficient formulas u is the power-series variable and b is the degree-two class. S is quasiregular semiperfectoid, with bounded p-torsion and quasisyntomic cotangent amplitude; A is in QSyn_{O_K}. Smoothness is required for the stated specialization package.

**Dependencies.** `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`; `PrismaticCohomology:PR.3`.

**Proof or construction.** After p-completed base change to O_{K_∞}, apply absolute quasiregular evenness and descent; coefficient extension is topologically free and detects the needed assertions. Unfold π_0 on the relative quasiregular basis. Use residue and root specialization plus the absolute trace comparisons to obtain Corollary 11.12. Read the complete multiplicative filtration and gr^0 reduction from the fixed-point spectral sequence; its existence on the twisted object does not imply descent of the filtration.

**Check.** At A=O_K, D̂_{A/𝔖^(−1)}=𝔖^(−1) and its first Nygaard level is (E). Replacing the twisted coefficient ring with untwisted 𝔖 changes the de Rham and crystalline coefficient maps.

**Source.** BMS2, Proposition 11.11, Corollary 11.12 and Remark 11.14, pp.303–305.

### relative-bott-frobenius — Bott inversion and Frobenius descent input

Target `AInfCohomology:AI.7/relative-bott-frobenius` (theorem).

**Statement.** The relative cyclotomic Frobenius extends naturally from TC⁻ to TC⁻[1/b]⊗_{𝕊[z]}𝕊[z^{1/p}]→TP because phi(b)=σ is invertible. For quasiregular semiperfectoid A, the Bott-localized source remains even with acyclic homotopy sheaves. After unfolding degree zero, the extended map is an equivalence for A the p-adic completion of a smooth O_K-algebra. This is the Frobenius-descent input defining the untwisted Breuil–Kisin complex in the imported trace-descent target. No Bott inversion of the power-series parameter u is intended.

**Hypotheses.** p is prime. Work in the symmetric monoidal stable enhancement of spectra, with E∞-algebras, geometric realizations, circle actions, homotopy fixed points and Tate constructions supplied by the precise E5:abstract contract. All displayed trace invariants are p-completed; homotopy indices are homological, so the Bott generator has degree +2. K is a complete discretely valued extension of Q_p with perfect residue field k; π is a fixed uniformizer with Eisenstein polynomial E over W(k). 𝔖=W(k)[[u]], phi acts by Witt Frobenius and u↦u^p. 𝔖^(−1) is a copy of 𝔖 regarded as a 𝔖-algebra along phi. In the spectral sphere-polynomial base use a separate variable z↦π; in coefficient formulas u is the power-series variable and b is the degree-two class. The map extension exists for any O_K-algebra A. Evenness/acyclicity needs quasiregular semiperfectoid A; the unfolded equivalence needs p-completed smooth A.

**Dependencies.** `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/relative-trace-coefficients`; `AInfCohomology:AI.7/characteristic-p-trace-comparison`.

**Proof or construction.** Invert b under phi and extend the semilinear z↦z^p scalar map to z^{1/p}. Evenness and acyclic sheaf conditions survive the filtered colimit for b-localization. For smooth A check the stable range of motivic pieces at indices ≥dim(A); after reduction along z^{1/p} use the characteristic-p Segal theorem. Completeness gives the unfolded equivalence and descends the Frobenius.

**Check.** The inverted b has homotopy degree two; it is different from the degree-zero formal parameter u. The stable-range argument proves the unfolded smooth statement and does not assert TC⁻[1/b]≃TP for every input.

**Source.** BMS2, Proposition 11.15 and proof of Theorem 11.2, pp.305–306.

## Worked examples and comparison checks

### The integral point and the two coefficient reductions

For 𝔛=Spf(O_C), AΩ is A_inf in degree zero. Its mod-ξ specialization is O_C through θ, its mod-ξ̃ specialization is O_C through θ̃, and μ-inversion gives the coefficient realization A_inf[1/μ]. Thus θ(μ)=0 while θ̃(μ)=ζ_p−1. At finite Witt length one ξ_1=ξ and ξ̃_1=ξ̃; interchanging them fails this point test. The canonical deformation of Spa(C,O_C) is B_dR⁺ in degree zero and its comparison map is the coefficient identity. Sources: BMS1 v3 Definition 5.4, pp.46–47; §§8–9, pp.58–79; Definition 13.18 and Theorem 13.19, p.114.

### A torus coordinate and its divided differential

For R=O_C⟨T^{±1}⟩, the tower adjoins all T^{1/p^m}. With q=[ε], the divided group-Koszul differential on T^n has coefficient [n]_q=(q^n−1)/(q−1) for n≥0, given by the polynomial Σ_{j<n}q^j. At q=1 it becomes n, recovering d(T^n)=nT^n dlog T. The q-model’s integral multiplication/coherence is not replaced by an arbitrary strictly commutative dga. For the B_dR⁺ comparison the degree-zero map is X_T↦[T^flat] and the operator F=tΣ_{n≥0}t^n∂^n/(n+1)! satisfies F∂=γ−1 on the common envelope. Sources: BMS1 v3 Remark 7.8 and Proposition 7.9, pp.57–58; Theorem 9.4, pp.72–74; Theorem 13.1 proof, p.115.

### A redundant infinitesimal coordinate

For R=C, the empty embedding set gives D(C)=B_dR⁺. Adding a unit a gives an embedding ideal containing both ξ and X_a−ã for a lift ã. The completed envelope has a formal variable in that extra direction; its characteristic-zero formal de Rham direction contracts. Hence the cohomology remains B_dR⁺ and the embedding transition is an equivalence. Completing only in ξ would fail the envelope test before the contraction is applied. Sources: BMS1 v3 Construction 13.6, p.106; Lemmas 13.12–13.13, pp.110–112.

### A nodal semistable conic

For the projective model XY=πZ² with π a nonzero nonunit, the node chart is O_K⟨x,y⟩/(xy−π). Root towers retain xy=π with compatible roots and the relation between the two branch actions; the integral map at the singular point is not flat. The log differential is represented by dlog x=−dlog y. With the proper log-duality and coherent base-change inputs in G-CURVE, logarithmic de Rham cohomology is O_K in degrees zero and two and zero in degree one. The adjacent-degree freeness criterion identifies its generic-fibre lattice, while a proof using a flat singular root tower would be invalid. Sources: CK §3.2, pp.10–11; Example 8.8, pp.75–76, with the imported nodal-conic target and its explicit curve gap.

### Breuil–Kisin shifts and the torsion obstruction

At the coefficient point, the twisted relative trace object is 𝔖^(−1). Its de Rham map has identity Witt coefficients and u↦π; after Frobenius descent the map is θ_𝔖, with Witt Frobenius and u↦π^p. The crystalline map likewise changes from constantCoeff to φ_W∘constantCoeff. If π^p=p, this descended de Rham map factors through Z_p. For a proper perfect complex over Z_p, each torsion summand Z_p/(p^a) extends to O_K/(π^{pa}), so its O_K length is divisible by p. The Nygaard obstruction separately prevents functorial descent of the twisted filtration; an untwisted filtration is not inferred from a Frobenius isomorphism. Sources: BMS2 Theorem 1.2 and Remark 1.4, pp.199–201; Remarks 11.17–11.18, pp.306–307; BS22 v4 Proposition 15.7, p.105.

## Supplier contracts and proof gaps

These contracts specify what a supplier must add beyond its present node. A planned layer reaches existing declarations, imported targets, these requests or the recorded gaps. It does not claim a closed prerequisite chain.

### REQ-01 — EnhancedDerivedSheaves:E1

Refine the existing K-flat replacement node to a termwise-flat K-flat replacement on ringed sites (strongly K-flat, BMS1 Lemma6.1); construct comparison roofs compatible with the chosen ordinary DerivedCategory and the invertible-ideal line-power/coherent tensor interface.

**Used by.** `AInfCohomology:AI.1/ideal-decalage-complex`; `AInfCohomology:AI.1/decalage-cohomology`; `AInfCohomology:AI.1/derived-decalage`; `AInfCohomology:AI.1/decalage-filtered-colimits`; `AInfCohomology:AI.1/decalage-truncations`; `AInfCohomology:AI.1/decalage-products`; `AInfCohomology:AI.1/bockstein-differential`; `AInfCohomology:AI.1/bockstein-reduction`; `AInfCohomology:AI.1/strongly-k-flat-replacements`.

### REQ-02 — DerivedDeRhamCohomology:DD.1

Extend the existing scalar Koszul node to Koszul complexes of commuting endomorphisms, with cohomological exterior signs and the continuous completed-cochain comparison; generic derived completion and Beilinson infrastructure are already imported by exact node ids.

**Used by.** `AInfCohomology:AI.1/koszul-decalage-calculation`; `AInfCohomology:AI.1/koszul-products-and-cohomology`; `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.3/q-de-rham-model`.

### REQ-03 — DerivedDeRhamCohomology:DD.0

Supply the integral perfectoid completed-cotangent results: Lhat_(O_C/Z_p)=O_C{1}[1] and Lhat_(S/O_C)=0 for p-complete integral perfectoid O_C-algebras S. Use cotangent transitivity and derived p-completion, not vanishing of ordinary differentials alone.

**Used by.** `AInfCohomology:AI.0:integral/completed-cotangent-twist`.

### REQ-04 — PadicHodgeTheory:R06.1

Supply the actual topology, principal kernel, discrete valuation and common-map identification for the existing BDeRhamPlus/BDeRham carriers and B_crys^+; continuous Galois actions and coefficient scalar twists. AI.0 integral constructions precede this request and have no dependency on it. Part II for the existing BDeRhamPlus carrier: A_inf→B_dR⁺ flatness by Raynaud–Gruson II.1.4.2.1, finite ξ-quotient Tate topologies and unique continuous lifts of finite W(k)[1/p] extensions in C, all as CK §§6.1–6.2 use them. Keep the finite-extension and continuity hypotheses.

**Used by.** `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`; `AInfCohomology:AI.2/bkf-galois-descent`; `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`.

### REQ-05 — PadicHodgeTheory:P8:local-rational

Supply an early primitive-comparison child, independent of the proper rational suffix: Scholze Theorem 4.9, Lemma 4.12 and Theorem 5.1 (finite etale F_p cohomology and the O^+/p almost comparison), then the derived A_inf version BMS1 Theorem 5.7 by finite p-level induction and derived completion. The current local rational period-sheaf statements alone do not supply it; use the corrected pro-etale covers. Use that early primitive child also for AI.6 integral étale comparison and the canonical B_dR⁺ target, with finite-p-level induction and the classical/derived Witt coefficient map. Supply the structural descended de Rham comparison preserving its filtration, independent of the subsequent comparison assembly that consumes AI.6.

**Used by.** `AInfCohomology:AI.5/global-etale`; `AInfCohomology:AI.6/etale-comparison`; `AInfCohomology:AI.6/canonical-bdr-etale-map`; `AInfCohomology:AI.6/canonical-bdr-etale-comparison`.

### REQ-06 — AdicEtaleGeometry:A1

Supply the corrected analytic pro-etale site, unchanged underlying category, transfinite covering towers in which every positive stage maps by pullback of a finite etale surjection to the limit of all preceding stages (including positive limit ordinals), and the generic-fiber/formal-Zariski morphism of ringed topoi. Do not use deleted 2013 point claims or splitting of arbitrary open profinite surjections. Extend the same corrected-site interface to the formal étale site ν:X_proet→𝔛_et and CK presheaf-basis construction; edge-map cones are derived p-complete, and the period coefficient convention must include both the classical and derived-completed Witt sheaves. An almost edge equivalence requires these precise hypotheses. From Huber, Étale cohomology of rigid analytic varieties and adic spaces: 1.6.10 and 2.2.8 (the étale topology of a smooth adic space over C has a basis of affinoids with a map to a torus that is a composite of a rational embedding, a finite étale map and a rational embedding); 1.7.3 iii) (an étale map to the semistable torus chart Spa of C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q) descends to the ring of integers of a finite extension of W(k̄)[1/p] in C); 3.5.1 and 1.3.18 ii) (the adic generic fibre of 𝔛 is smooth, and proper when 𝔛 is). The pro-étale site is cited by node.

**Used by.** `AInfCohomology:AI.3/completed-integral-sheaf`; `AInfCohomology:AI.3/aomega`; `AInfCohomology:AI.6/aomega`; `AInfCohomology:AI.6/local-edge`; `AInfCohomology:AI.6/aomega-sheaf-completeness`; `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`; `AInfCohomology:AI.6/bdr-comparison-map`; `AInfCohomology:AI.6/etale-comparison`.

### REQ-07 — PerfectoidSpaces:P1

Supply the perfectoid field and valuation-ring setup for O_C^flat, its nondiscrete valuation, residue field and finite-generated torsion-free module lattice criterion; the Fontaine-kernel and perfectoid-basis nodes are imported separately by exact ids. Also supply the p-completed root extension O_{K_∞} adjoining compatible p-power roots of π, its integral perfectoid property and the root-base cotangent vanishing used by BMS2 Corollary 11.8. For normalized length supply elementary-divisor presentations of finitely presented torsion modules over rank-one valuation rings and multiplicativity of Fitt_0 in short exact sequences (CK §7.10; Stacks 0ASP; GR 6.1.14,6.3.1,6.3.5(i)).

**Used by.** `AInfCohomology:AI.2/valuation-special-fiber-bound`; `AInfCohomology:AI.7/relative-trace-base-change`; `AInfCohomology:AI.6/normalized-valuation-length`.

### REQ-08 — FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Early Part II of the field-valued Dieudonne stage: define admissible prismatic windows over the initial perfectoid prism and prove their evaluation dictionary with minuscule linearized BKF modules. This dictionary must precede classification applications that import AI.2; do not import the full subsequent perfectoid p-divisible-group classification backwards.

**Used by.** `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### REQ-09 — PrismaticCohomology:PR.0

Supply only the initial perfectoid prism and its Frobenius-shifted identification (A_inf,tilde-xi); generic delta rings/prisms and their initial-prism theorem stay with PR.0. No final AΩ/prismatic comparison is a prerequisite.

**Used by.** `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### REQ-10 — EnhancedDerivedSheaves:E5

Supply coherent E_infinity algebra objects, lax symmetric monoidal localization and the characteristic-two Sq^0 test for the noncommutative q-model; the q-model is not forced into a strictly commutative dga.

**Used by.** `AInfCohomology:AI.3/enhanced-noncommutative-regression`.

### REQ-11 — CrystallineCohomology:CR.4

Audit the agreement of BLM10.3–10.4 saturated-de-Rham–Witt universal maps with the absolute all-coordinate AΩ crystalline comparison, preserving degree-zero maps, Bockstein differential and Frobenius. Existing relative Witt and crystalline objects are imported by exact node ids.

**Used by.** `AInfCohomology:AI.4/blm-crystalline-route`.

### REQ-12 — CrystallineCohomology:CR.3

Early Berthelot–Ogus bridge BMS1 Proposition 13.21: after fixing k→O_C/p, rational crystalline base change from the proper smooth special fiber over W(k) to A_crys[1/p], with canonical phi-equivariant map. Include rational Frobenius bijectivity for qcqs smooth O_C/p-schemes over non-Noetherian A_crys and descent through p^(1/p^n) thickenings. The existing Noetherian-base Frobenius-isogeny theorem alone is insufficient; the bridge must not depend on AI.5 BKF freeness.

**Used by.** `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/global-bkf`.

### REQ-13 — tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve

Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and reuse the existing analytic union-locus theorem, and request endpoint neighborhoods, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied. In particular supply the Y^an_[0,r] neighborhoods and integral Robba stalk at x_(C^flat), the Y^an_[r,infinity] extension at x_L, and the two-open sheaf interface of SW Theorem 14.2.1. AI.2 owns only module restriction, patching and classification; no duplicate interior or curve construction. Current Tau Ceti Y.lean already identifies the analytic locus with the union; do not re-plan that locus equality.

**Used by.** `AInfCohomology:AI.2/integral-robba-frobenius-descent`; `AInfCohomology:AI.2/annulus-isocrystal-classification`; `AInfCohomology:AI.2/frobenius-extension-infinity`; `AInfCohomology:AI.2/analytic-vector-bundle-extension`; `AInfCohomology:AI.2/fargues-essential-surjectivity`.

### REQ-14 — AdicSpacesPartII:R3

Supply the analytic affinoid finite-projective-module/vector-bundle equivalence for the source two-open cover, including the exact non-Noetherian sheaf descent hypotheses of SW Theorem 5.2.8, printed p.38. The existing analytic coherent-sheaf infrastructure is imported; AI.2 owns the global finite-free A_inf equivalence on the punctured analytic Y^an. Part II: smooth noetherian approximation and formally étale lifts for BMS1 Lemma 13.7; the valuation-ring free model used in Lemma 13.11 (Raynaud–Gruson I.3.3.5); characteristic-zero proper de Rham local freeness from the integrable connection for Theorem 13.19; analytic/étale hypercohomology agreement on the very-small basis. (i) For a quasi-compact quasi-separated formal scheme 𝔛 over O_C as in CK §1.5 and a locally free coherent sheaf F: RΓ(𝔛,F)[1/p]≅RΓ(X_C^ad,F^ad) (acyclicity on affinoids), hence RΓ_logdR(𝔛/O_C)⊗_{O_C}C≅RΓ_dR(X_C^ad/C); CK uses this without citation in the proof of Theorem 6.6. (ii) Adic GAGA for proper schemes over C (Scholze, p-adic Hodge theory for rigid-analytic varieties, 9.1(i)), used in CK Claim 4.15.1. (iii) Coherent cohomology of a smooth adic space over C is the same in the analytic and in the étale topology (loc. cit., 9.2(ii)), used for CK (6.2.7); if this lies outside the stage's coherent-sheaf scope it needs an owner of its own.

**Used by.** `AInfCohomology:AI.2/analytic-vector-bundle-extension`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/canonical-bdr-deformation`; `AInfCohomology:AI.6/canonical-bdr-freeness`; `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`; `AInfCohomology:AI.6/bdr-comparison`.

### REQ-15 — CrystallineCohomology:CR.0

Ordinary divided power envelopes over (Z_p,pZ_p) with their universal property and base change (Stacks Project 07HB) and the extension of a derivation preserving the ideal to a divided power derivation (Stacks Project 07HW); A_cris^0 as the divided power envelope of A_inf→O_C/p and A_cris as its p-adic completion (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.8), also for an affinoid perfectoid R′_∞: A_cris^0(R′_∞)≅A_inf(R′_∞)[T^n/n!]/(T−ξ) (CK §5.35). Mathlib's DividedPowers and DividedPowerAlgebra do not provide envelopes.

**Used by.** `AInfCohomology:AI.6/finite-level-acris`; `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.6/log-derivations`; `AInfCohomology:AI.6/local-crystalline`; `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates-aomega`; `AInfCohomology:AI.6/all-coordinates-map`.

### REQ-16 — CrystallineCohomology:CR.5

Log crystalline cohomology for integral quasi-coherent, not necessarily fine, log structures, by label from Beilinson, On the crystalline period map (arXiv:1111.3316v4): 1.3, Theorem (existence of log PD envelopes; Kato, Logarithmic structures of Fontaine–Illusie, 5.4, for fine structures); 1.1, Exercises (iii) (unique lifting of a unit subject to a prescribed relation t=u·t′ between log sections, as used in CK Lemma 5.29, p.48); §1.4, Remarks (ii) (PD smoothness of log smooth log PD thickenings and of log PD envelopes of log smooth thickenings); (1.8.1) and 1.7, Exercises (i) (the log PD de Rham complex of a PD smooth thickening computes log crystalline cohomology, Frobenius-equivariantly, and for the envelope D of a log smooth thickening P it is Ω^•_{P,log}⊗_PD); (1.11.1) (base change for fine log smooth log schemes of Cartier type, in the quasi-compact quasi-separated form of CK footnote 17), giving CK (5.24.1) and (5.43.3). From Kato, Logarithmic structures of Fontaine–Illusie: 5.5.1 (for an exact closed immersion the log PD envelope is the ordinary one) and 4.8 (Cartier type: the reduction modulo p of a semistable formal scheme over the ring of integers of a discretely valued field is fine, log smooth and of Cartier type), used in global-crystalline and hyodo-kato-interface. The log de Rham complex Ω^•_{𝔛/O_C,log} of the formal scheme with its divisorial log structure, local freeness of Ω^i_log of rank binom(d,i), finiteness of its coherent cohomology for proper 𝔛 once the finiteness theorem of gap G-GAGA is available, and the identification of Ω¹_log of a semistable curve with its relative dualizing sheaf. The cohomology computation for the nodal conic is done in the node nodal-conic and is not requested.

**Used by.** `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/log-de-rham`; `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/log-derivations`; `AInfCohomology:AI.6/local-crystalline`; `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/log-exactification`; `AInfCohomology:AI.6/all-coordinates-pd`; `AInfCohomology:AI.6/all-coordinates-log-crystalline`; `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.6/crystalline-de-rham-square`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/hyodo-kato-interface`; `AInfCohomology:AI.6/bdr-comparison`; `AInfCohomology:AI.6/model-independent-lattice`; `AInfCohomology:AI.6/nodal-conic`.

### REQ-17 — CrystallineCohomology:CR.5:log-algebra

Prelog rings, associated log structures on the étale site, charts, integral and fine monoids and their pushouts, strict maps and exact closed immersions. From Kato, Logarithmic structures of Fontaine–Illusie: the chart criteria 3.5–3.6 for log smooth and log étale maps (applied to ℕ→ℕ^{r+1} over A_inf and to Q→P_{λ₀}), and 4.1 and 4.4 (integrality). From Kato, Toric singularities: log regularity (2.1) and Theorem 11.6 (on a log regular scheme the log structure is O∩j_*O^× for the open of triviality), used in CK Claim 1.6.1. The Claims 1.6.1 and 1.6.3 themselves are the content of divisorial-log.

**Used by.** `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.6/log-derivations`; `AInfCohomology:AI.6/log-exactification`.

### REQ-18 — CrystallineCohomology:CR.6

Log crystalline cohomology of the special fibre over the standard log point (ℕ→W(k₀), 1↦0) with its Frobenius and monodromy, Nφ=pφN. From Beilinson, On the crystalline period map (arXiv:1111.3316v4): the base change theorem (1.11.1) in the two instances CK Remark 5.44, (5.44.1) (change of log base from Q≥0 to ℕ over W(k̄)) and base change along the map of log divided power bases W(k₀)→W(k̄) (completed in general, uncompleted for proper models), which is identification (iii) of hyodo-kato-interface: CK does not state it and uses its consequence (8.8.1), and whether (1.11.1) covers it was not checked in Beilinson's paper; 1.18, Theorem, in the form of CK Corollary 5.43 (for a proper fine log smooth log scheme of Cartier type over O/p the rational log crystalline cohomology over A_cris is finite free over A_cris[1/p]); (1.16.2) and (1.18.5) for the identification (9.2.2) of CK Proposition 9.2 over B_st⁺, with the Fontaine–Hyodo–Kato torsor and the ring A_st of CK §9.1 and the identification of A_st[1/p] with Fontaine's B_st⁺, Frobenius and monodromy included (§1.17 there); Fontaine's ring is cited by node (PadicHodgeTheory:R06.1/semistable-period-ring). The rational comparison of CK Theorem 9.5 and Remark 9.6 is not requested.

**Used by.** `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/hyodo-kato-interface`.

### REQ-19 — EnhancedDerivedSheaves:E4

Completed extension of scalars along a map of rings with ideals (R,I)→(S,J): K↦K⊗̂^L_RS, the derived J-completion of K⊗^L_RS, with values in derived J-complete S-modules (commutative algebra objects when K is one), its transitivity, and its agreement with the ordinary derived tensor product when K is perfect; and the completion Rlim_n(−⊗^L Z/p^n) of complexes of sheaves on a site that is not replete (CK (1.7.1)), as used for AΩ_𝔛⊗̂^L_{A_inf}A_cris on 𝔛_ét. The existing node completed-sheaf-tensor is a bifunctor over one ring on a replete topos and supplies neither.

**Used by.** `AInfCohomology:AI.6/finite-pd-base-change`; `AInfCohomology:AI.6/absolute-crystalline`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.7/ainf-base-change`; `AInfCohomology:AI.7/de-rham-base-change`; `AInfCohomology:AI.7/crystalline-base-change`.

### REQ-20 — FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

The category of BMS1 Definition 4.1 and BMS2 Definition 1.1: finitely generated 𝔖-modules M with an isomorphism (φ_𝔖^*M)[1/E]≅M[1/E], with BMS1 Proposition 4.3 (structure 0→M_tor→M→M_free→M̄→0 and M[1/p] finite free over 𝔖[1/p]). This widens the stage beyond its finite free Kisin modules of bounded E-height (node kisin-modules), which cannot hold torsion cohomology. Also BMS1 Theorem 4.4 in the form used by twist-compatibility: for a lattice T in a crystalline representation the module M(T) is the finite free module with a φ- and G_{K∞}-equivariant identification M(T)⊗_𝔖W(C^♭)≅T⊗W(C^♭), the tensor product being taken along f (the nodes finite-height-lattices, semistable-finite-height and PR.7/kisin-functor-comparison are cited for its ingredients). And an API item for the finite freeness of rank p of φ_𝔖 with basis 1,u,…,u^{p−1}, which is a proof step of the node bk-coefficient-rings; that node is cited where the fact is used.

**Used by.** `AInfCohomology:AI.7/perfect-cohomological-modules`; `AInfCohomology:AI.7/bkf-tensor-functor`; `AInfCohomology:AI.7/twist-compatibility`.

### REQ-21 — PerfectoidSpaces:P3

Almost purity in the form used by CK §5.18 and Lemma 5.37: the base change R_{Σ,Λ,∞} to R of a product of root towers is perfectoid (Scholze, Perfectoid spaces, 7.9(iii)) and is integrally closed in R_{Σ,Λ,∞}[1/p].

**Used by.** `AInfCohomology:AI.6/all-coordinates`; `AInfCohomology:AI.6/all-coordinates-map`.

### REQ-22 — EnhancedDerivedSheaves:E5:abstract

Part II for stable spectra: symmetric monoidal stable presentable spectra, E∞-algebras and cyclic-bar realizations; circle and finite-group actions, norms, homotopy fixed points, finite/group-circle Tate constructions and their lax monoidality; connective p-completion, quotient/base-change squares and multiplicative HKR/fixed-point/Tate spectral sequences. This is a precise carrier extension, not something supplied by ordinary DerivedCategory or algebra-objects alone. AI.7 retains ownership of the actual trace coefficient calculations, including the Bökstedt F_p input to the perfectoid calculation.

**Used by.** `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`.

### REQ-23 — AdicSpacesPartII:R2

Part II: the formal proper-flat versal descent and proper smooth rigid spreading of BMS1 Proposition 13.15 and Corollary 13.16. Retain the zero-dimensional residue ring, maximal-ideal topologies and proper-flat hypotheses; Raynaud formal models alone do not supply this deformation theorem.

**Used by.** `AInfCohomology:AI.6/proper-smooth-spreading`.

### REQ-24 — AdicSpacesPartII:R0

Import the topologically finite-type Tate algebra, ring-of-definition and continuous completion interfaces; extend them to finite nilpotent B_dR⁺ thickenings for BMS1 Lemma 13.4, including closed ideals and strongly noetherian finite Tate-variable extensions.

**Used by.** `AInfCohomology:AI.6/bdr-tate-thickenings`; `AInfCohomology:AI.6/bdr-infinitesimal-envelope`; `AInfCohomology:AI.6/bdr-envelope-normal-form`.

### REQ-25 — PrismaticCohomology:PR.3

Import the quasisyntomic site with bounded p-torsion, quasiregular semiperfectoid basis and symmetric monoidal unfolding equivalence; relative Nygaard completion and BS22 Proposition 15.7 for π_0TP over 𝔖^(−1). Retain the Frobenius twist and completion, then use the concrete AI.7 trace inputs for the comparison; no unrestricted nonperfect-prism uniqueness is assumed.

**Used by.** `AInfCohomology:AI.7/qrsp-trace-unfolding`; `AInfCohomology:AI.7/absolute-trace-aomega-comparison`; `AInfCohomology:AI.7/relative-qrsp-evenness`; `AInfCohomology:AI.7/trace-prismatic-agreement`.

### G-01 — Enhanced ringed-topos and invertible-line signatures

Pinned Mathlib has the ordinary derived category but not the requested coherent stable enhancement, derived sheaf tensor/pushforward, or invertible-ideal line-power interface. The definitive reader retains these hypotheses. The compact suggested file omits the unavailable carriers entirely.

**Required for.** `AInfCohomology:AI.1/ideal-decalage-complex`; `AInfCohomology:AI.1/decalage-products`; `AInfCohomology:AI.3/aomega`.

### G-02 — Continuous completed cochain forgetful comparison

Mathlib continuousCohomology is in TopModuleCat with N-indexed cochains. The comparison must construct the completed p-adic cochain complex and its forgetful functor to Z-indexed ModuleCat complexes, with the finite-reduction hypotheses. It cannot be obtained by an unproved identification of discrete and continuous carriers.

**Required for.** `AInfCohomology:AI.1/continuous-cochains-koszul`; `AInfCohomology:AI.3/toric-perfectoid-cover`.

### G-03 — Perfectoid minuscule-window supplier extension

R07.2 currently states field-valued Dieudonne theory, not the full perfectoid prismatic window interface. Request an early Part II dictionary with the PR.0 initial prism, before the subsequent classification applications that consume AI.2. Its proof is not assumed to follow from the finite-free Fargues equivalence alone.

**Required for.** `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### G-04 — Analytic reconstruction on the punctured adic locus

Use Y^an=Spa(A_inf,A_inf) minus its closed nonanalytic point, equivalently D(p) union D([varpi^flat]). Its endpoints x_(C^flat) (radius 0) and x_L (radius infinity) are retained. Current Tau Ceti spaY is only D(p) intersection D([varpi^flat]), with radii (0,infinity). Import that existing interior, and request its endpoint extension, interval section rings and boundary stalks from AdicSpaces Layer 6; these additional carriers are not claimed already supplied. The SW module chain is planned in AI.2 with its exact sources. Boundary interval rings, Robba/local-ring restrictions and sheaf descent are a lower-owner supplier extension, beyond the existing interior radius windows. Native signatures omit these geometric identifications explicitly; refinement of the classification proofs stays with AI.2, not RF4/VB2. The current analytic union-locus equality is already built; the unresolved extension is its endpoint neighborhoods, section rings and stalks.

**Required for.** `AInfCohomology:AI.2/integral-robba-frobenius-descent`; `AInfCohomology:AI.2/annulus-isocrystal-classification`; `AInfCohomology:AI.2/frobenius-extension-infinity`; `AInfCohomology:AI.2/analytic-vector-bundle-extension`; `AInfCohomology:AI.2/fargues-essential-surjectivity`.

### G-05 — Agreement of the two crystalline comparison maps

BLM10.3–10.4 supplies the canonical saturated realization, but identification with every all-coordinate PD comparison map requires the shared degree-zero/Bockstein universal-map audit. This exact map agreement is requested from CR.4; no equality of unnamed isomorphisms is asserted.

**Required for.** `AInfCohomology:AI.4/blm-crystalline-route`.

### G-06 — Integral Frobenius-descent proof refinement

AI.2 now owns integral Witt descent, including finite torsion modules, and its invariant/scalar-extension signature. Artin–Schreier–Witt descent and the integral coefficient identifications remain source-supported proof refinements; Mathlib’s rational isocrystal carrier does not prove them. No supplier request to the higher/outside VB0 plan remains.

**Required for.** `AInfCohomology:AI.2/integral-frobenius-descent`; `AInfCohomology:AI.2/bkf-etale-realization`.

### G-07 — Primitive proper integral comparison

P8:local-rational supplies local rational period sheaves, not Scholze Theorem 5.1 etale finiteness and primitive almost comparison. The request specifies an early primitive-comparison child and BMS1 Theorem 5.7. Until supplied, proper etale comparison is source-supported planning, not closed.

**Required for.** `AInfCohomology:AI.5/global-etale`.

### G-08 — Non-Noetherian rational crystalline bridge

The inspected CR.3 rational Frobenius theorem assumes a Noetherian PD base (or W(k)). It does not by itself prove BMS1 Proposition 13.21 over A_crys. The section-dependent Berthelot–Ogus bridge and its qcqs Frobenius/descent inputs are requested from an early CR.3 extension.

**Required for.** `AInfCohomology:AI.5/rational-crystalline-frobenius`; `AInfCohomology:AI.5/global-bkf`.

### G-09 — Formal GAGA and coherent finiteness over a rank-one valuation ring

Three statements about a proper formal scheme over a complete rank-one valuation ring that is not noetherian. (a) CK Theorem 4.12 with Remark 4.13 (Fujiwara–Kato, Foundations of rigid geometry I, I.10.1.2): for a height-one valuation ring V complete for a nonzero nonunit a and a proper finitely presented V-scheme Y, finitely presented O_Y-modules are equivalent to compatible systems of finitely presented modules on the Y_{V/a^n}, and locally free systems algebraise to locally free modules. CK uses it once, in §4.15, to algebraise the map (4.10.3); among the nodes only hodge-tate-comparison uses it directly, and only for the identification (4.11.1). (b) The finiteness theorem for proper formal schemes over O_C (Ullrich, The direct image theorem in formal and rigid geometry, 5.3), used in CK Corollary 4.20 for proper-perfectness. (c) The comparison theorem and flat base change from O_K to O_C for coherent cohomology (EGA III 4.1.7 with limit arguments, or Fujiwara–Kato I.9.2.1), used in CK Remark 4.19 and for (8.7.4) in model-independent-lattice. CK's deductions were read; the proofs in Fujiwara–Kato and Ullrich were not. AdicSpacesPartII:F0 plans formal functions and formal GAGA for Noetherian adic rings only; the restructure entry proposes to extend it.

**Required for.** `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/proper-perfectness`; `AInfCohomology:AI.6/model-independent-lattice`.

### G-10 — External inputs with no located supplier

Named results that the proofs use and for which no stage of the atlas was found to state them. For divisorial-log and hodge-tate-comparison (CK §1.5): the algebraisation (1.5.2) of a chart and of an étale map to it over a discrete valuation subring of the integral closure of W(k̄) (Stacks Project 04D1 with limit arguments). For root-tower and structure-sheaf-edge (CK §1.5, §3.2): Gabber–Ramero, Almost ring theory, 7.1.6 (R is flat over R□ and each R⊗_{R□}R□_m is p-adically complete). For hodge-tate-comparison (CK §4.10, §4.15): the identification of (R¹ν_*Ô⁺)[1/p] with Ω¹(−1) on a smooth proper adic space over C (Scholze, Perfectoid spaces: a survey, 3.23–3.24); the extension of a vector bundle across a closed subset of codimension ≥2 over a non-noetherian valuation base (EGA IV₂ 5.10.5 with limit arguments); the existence of a proper flat compactification of the chart with Zariski-local semistable coordinates. For global-crystalline (CK, proof of Corollary 5.43): the descent of 𝔛_{O_C/p} to a quasi-compact quasi-separated fine log smooth log scheme of Cartier type over O/p, proper when 𝔛 is, for the ring of integers O of a finite extension of W(k̄)[1/p] in C; CK says only that limit arguments give it. For hyodo-kato-interface: base change of log crystalline cohomology of a fine, log smooth log scheme of Cartier type along W(k₀)→W(k̄) (identification (iii) of the node), which CK does not state; it is requested from CR.6, and whether Beilinson's (1.11.1) covers it was not checked. For local-crystalline and aomega-sheaf-completeness (CK, proofs of Proposition 5.13 and Corollary 4.6): acyclicity of quasi-coherent sheaves on an affine formal scheme (Fujiwara–Kato I.1.1.23(2)). For bdr-cohomology-etale-embeddings and bdr-comparison-map (CK §§6.3–6.5): the reduced fibre theorem (Stacks Project 09IL), Raynaud–Gruson I.3.3.5 (freeness of A₀ over O), Gabber–Ramero, Almost ring theory, 7.3.15 (power-bounded elements of a nilpotent thickening) and, for bdr-comparison-map, the descent (1.5.2) of the charts. For de-rham-lattice-functor and model-independent-lattice (CK §8.5, (8.7.4)): the theorems of Ax–Sen–Tate (C^{G_K}=K, hence (O_C)^{G_K}=O_K) and of Tate and Sen ((C(η))^{G_K}=0 for a character η with infinite image on inertia) are cited from PadicHodgeTheory:R06.1/ax-sen-tate-invariants and R06.1/tate-sen-theorem, which state them for K finite over Q_p; CK's K is any complete discretely valued field with perfect residue field, and that generality is the gap. Also the formalism of de Rham representations of G_K (D_dR(V)=(V⊗B_dR)^{G_K}, injectivity of D_dR(V)⊗_KB_dR→V⊗B_dR, compatibility with tensor products, duals and finite extensions), which CK uses without reference; and the G_K-equivariant identification H^i_ét(X_{K̄},Z_p)≅H^i_ét(X_C,Z_p) for X proper smooth over K. For crystalline-torsion and de-rham-torsion (second inequalities of CK Theorems 7.9 and 7.12): RΓ_ét(X_C^ad,Z_p)⊗^L Z/p^n≅RΓ_ét(X_C^ad,Z/p^n) and the analogous base change of log crystalline and log de Rham cohomology to W_n(k̄) and O_C/p^n, for which CK cites only the universal coefficient sequences. For nygaard-nondescent (the worked example): the j-invariant of a Weierstrass curve and its invariance under base change, and the algebraisation of a smooth proper formal curve of genus one over ℤ_p. For perfect-cohomological-modules: finiteness of the coherent cohomology of a proper scheme over a field (EGA III 3.2.1), hence of its de Rham cohomology.

**Required for.** `AInfCohomology:AI.6/divisorial-log`; `AInfCohomology:AI.6/root-tower`; `AInfCohomology:AI.6/structure-sheaf-edge`; `AInfCohomology:AI.6/hodge-tate-comparison`; `AInfCohomology:AI.6/aomega-sheaf-completeness`; `AInfCohomology:AI.6/global-crystalline`; `AInfCohomology:AI.6/hyodo-kato-interface`; `AInfCohomology:AI.6/local-crystalline`; `AInfCohomology:AI.6/bdr-cohomology-etale-embeddings`; `AInfCohomology:AI.6/bdr-comparison-map`; `AInfCohomology:AI.6/de-rham-lattice-functor`; `AInfCohomology:AI.6/model-independent-lattice`; `AInfCohomology:AI.6/crystalline-torsion`; `AInfCohomology:AI.6/de-rham-torsion`; `AInfCohomology:AI.7/nygaard-nondescent`; `AInfCohomology:AI.7/perfect-cohomological-modules`.

### G-11 — Coherent cohomology of the nodal conic

The node nodal-conic computes the log de Rham groups O_K, 0, O_K of the completed conic XY=πZ² from H⁰(O)=O_K, H¹(O)=0, H⁰(ω)=0, H¹(ω)≅O_K, where ω=Ω¹_log is the relative dualizing sheaf. The computation is written out in the node; its inputs — the normalization exact sequence of the two special-fibre components and Serre duality for O and ω, cohomology and base change for the proper flat curve, and the identification of Ω¹_log with the dualizing sheaf (requested from CR.5) — have no supplier node yet, so the example is not certified.

**Required for.** `AInfCohomology:AI.6/nodal-conic`.

### G-12 — Relative trace comparison and agreement of comparison maps

(a) The equivalence between BMS2's trace-theoretic Breuil–Kisin complex and Δ_{R/𝔖} is stated in BS22 (Example 1.9(3), §15.2 with Proposition 15.7) with a sketch of proof; trace-prismatic-agreement proves it from BS22 Proposition 15.7, whose trace inputs are now owned in AI.7 and whose prismatic identification is imported from PR.3. Its compatibility with the three specialisation maps (A_inf, de Rham, crystalline) is stated in no source and is to be proved in this stage. (b) The agreement of the crystalline (A_cris), étale and B_dR⁺ comparison maps of AI.4–AI.5 with those induced from the prismatic side is stated in no source: BS22 Theorem 18.2 applies to symmetric monoidal functors on all p-completely smooth O_C-algebras over a perfect prism, hence neither over the non-perfect prism (A_cris,(p)) nor to functors defined only on smooth O_K-algebras; each agreement has to be checked on explicit generators. (c) The supplier node PrismaticCohomology:PR.6/ainf-omega-comparison is used with its multiplicativity and its naturality in R; both are open points of that node's own review (the source asserts multiplicativity in BS22 Remark 17.3 without proof, and the comparison map is shown natural only for maps injective on the chosen units).

**Required for.** `AInfCohomology:AI.7/trace-prismatic-agreement`; `AInfCohomology:AI.7/comparison-diagram-agreement`; `AInfCohomology:AI.7/ainf-base-change`.

### G-TRACE-FOUNDATIONS — Spectral carrier and coefficient inputs

The E5:abstract Part II contract supplies spectra, norm/Tate operations and trace spectral-sequence infrastructure. Its current algebra-objects target does not state these. AI.7 owns the trace coefficient calculations: the proof of the perfectoid calculation also needs Bökstedt’s π_*THH(F_p)=F_p[b], |b|=2, as used in BMS2 Theorem 6.1 (published pp.243–245). Its proof interior is an explicit AI.7 gap, not assigned to the generic enhancement owner. The relative trace targets are specified mathematically and are not claimed closed or implemented.

**Required for.** `AInfCohomology:AI.7/relative-cyclotomic-traces`; `AInfCohomology:AI.7/absolute-perfectoid-trace-coefficients`; `AInfCohomology:AI.7/qrsp-trace-unfolding`.

### G-BDR-SPREAD — Formal versal descent and smooth spreading

BMS1 Proposition 13.15 uses a proper special-fibre versal deformation and extension from artinian to zero-dimensional residue rings. The existing Raynaud-model input does not contain that theorem. Request the lower-owner R2 Part II, then prove the rigid proper-flat descent and shrinking-to-smooth step with the recorded hypotheses.

**Required for.** `AInfCohomology:AI.6/proper-smooth-spreading`; `AInfCohomology:AI.6/canonical-bdr-freeness`.

### G-BDR-ALGEBRA — Topology, flatness and free coefficient lifts

R06.1 must supply the nonnoetherian flat period map and finite-quotient Tate topology. R3 must supply the valuation-ring free-model argument and noetherian smooth approximation used in the envelope normal form. The local targets cite the source proofs, retain their hypotheses and are not deductions from the pinned ordinary AdicCompletion carrier alone.

**Required for.** `AInfCohomology:AI.0:period-comparison/bdr-finite-level-compatibility`; `AInfCohomology:AI.6/bdr-envelope-normal-form`; `AInfCohomology:AI.6/canonical-bdr-freeness`.

### G-BDR-MAPS — Normalized smooth comparison map agreement

Complete the explicit common-envelope diagram identifying the A_crys-to-B_dR⁺ and canonical deformation maps in BMS1 Theorem 14.5(i). Check degree-zero Teichmüller coordinates, logarithmic Koszul corrections, transition maps and descent. The source points to the comparison and the coordinate arguments; an abstract lattice isomorphism is insufficient.

**Required for.** `AInfCohomology:AI.6/smooth-integral-bdr-agreement`.

### G-LENGTH — Valuation-ring presentations and Fitting multiplicativity

The normalized-length target requires the elementary-divisor theorem for finitely presented modules over nondiscrete rank-one valuation rings and Fitting-ideal multiplicativity on the torsion exact sequences. Request these from P1 Part II with the GR and Stacks locators in REQ; the pinned ValuationRing class alone has no such API.

**Required for.** `AInfCohomology:AI.6/normalized-valuation-length`; `AInfCohomology:AI.6/valuation-length-specialization`.

## Existing declarations and the Lean projection

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The accepted AUDIT-35 review records the coefficient carriers as partly built and the subsequent A_inf theory as absent. The whole packet cites the following 59 existing declarations; each is a substrate or imported operation, not an implementation claim for the target that uses it.

- `mathlib:ModuleCat` — Mathlib/Algebra/Category/ModuleCat/Basic.lean: Bundled existing category of modules, not a new carrier.
- `mathlib:ModuleCat.of` — Mathlib/Algebra/Category/ModuleCat/Basic.lean: Bundles an existing R-module.
- `mathlib:ModuleCat.ofHom` — Mathlib/Algebra/Category/ModuleCat/Basic.lean: Converts a linear map to a categorical module morphism.
- `mathlib:ModuleCat.Hom.hom` — Mathlib/Algebra/Category/ModuleCat/Basic.lean: Extracts the linear map from a categorical module morphism.
- `mathlib:CochainComplex` — Mathlib/Algebra/Homology/HomologicalComplex.lean: The existing cochain complex indexed by Z with differential raising degree.
- `mathlib:CochainComplex.of` — Mathlib/Algebra/Homology/HomologicalComplex.lean: Constructor for an arbitrary eligible index type, including Z, from adjacent maps and square-zero proofs.
- `mathlib:CochainComplex.ofHom` — Mathlib/Algebra/Homology/HomologicalComplex.lean: Constructor for chain maps from adjacent commuting squares.
- `mathlib:HomologicalComplex.d_comp_d` — Mathlib/Algebra/Homology/HomologicalComplex.lean: Every composable pair of differentials has zero composite.
- `mathlib:DerivedCategory` — Mathlib/Algebra/Homology/DerivedCategory/Basic.lean: For an abelian category with a chosen localization, the ordinary unbounded derived category of cochain complexes. This does not supply the E∞, derived tensor or completion interfaces required here.
- `mathlib:DerivedCategory.Q` — Mathlib/Algebra/Homology/DerivedCategory/Basic.lean: Existing localization functor on cochain complexes.
- `mathlib:Finsupp` — Mathlib/Data/Finsupp/Defs.lean: Finite-support sequences for the counterexample.
- `mathlib:PowerSeries` — Mathlib/RingTheory/PowerSeries/Basic.lean: Univariate power series as MvPowerSeries Unit R; the existing R07.4 coefficient ring uses this carrier.
- `mathlib:PowerSeries.coeff` — Mathlib/RingTheory/PowerSeries/Basic.lean: Coefficient maps specify the restricted-sequence condition.
- `mathlib:WittVector` — Mathlib/RingTheory/WittVector/Defs.lean: The p-typical Witt-vector carrier with coefficients ℕ→R. Its ring structure and period-ring applications are imported, not reconstructed.
- `mathlib:WittVector.teichmuller` — Mathlib/RingTheory/WittVector/Teichmuller.lean: The Teichmüller lift R →* 𝕎 R; [π^♭] and [ε] are values of it.
- `mathlib:WittVector.frobeniusEquiv` — Mathlib/RingTheory/WittVector/Frobenius.lean: For a perfect ring R of characteristic p, the Witt vector Frobenius as a ring automorphism of 𝕎 R; supplies φ_A⁻¹ in θ̃ = θ∘φ_A⁻¹ on A_inf = 𝕎(O_C^♭).
- `mathlib:WittVector.map` — Mathlib/RingTheory/WittVector/Basic.lean: A ring homomorphism f : R →+* S induces 𝕎 R →+* 𝕎 S coefficientwise; gives W(k₀) → A_inf from k₀ → O_C^♭.
- `mathlib:WittVector.isAdicCompleteIdealSpanP` — Mathlib/RingTheory/WittVector/Complete.lean: p-adic completeness for Witt vectors of a perfect characteristic-p ring.
- `mathlib:TruncatedWittVector` — Mathlib/RingTheory/WittVector/Truncated.lean: Existing finite Witt carrier and truncation APIs.
- `mathlib:PreTilt` — Mathlib/RingTheory/Perfection.lean: PreTilt O p is the perfection of O/p: the tilt O^♭ as a perfect ring of characteristic p.
- `mathlib:WittVector.fontaineTheta` — Mathlib/RingTheory/Perfectoid/FontaineTheta.lean: For a commutative ring R that is p-adically complete with p not a unit, Fontaine's map θ : 𝕎(PreTilt R p) →+* R, with fontaineTheta_teichmuller (θ([x]) = untilt x). The carrier of A_inf and θ; the suggested file states the θ-squares of the coefficient maps with it. That ker θ is principal is not in Mathlib at the pin.
- `mathlib:BDeRhamPlus` — Mathlib/RingTheory/Perfectoid/BDeRham.lean: Existing kernel-adic completion carrier after p-inversion; DVR proof absent.
- `mathlib:BDeRham` — Mathlib/RingTheory/Perfectoid/BDeRham.lean: Existing localization at generator images; principal-kernel proof needed for the familiar single-generator description.
- `mathlib:continuousCohomology` — Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean: Existing topological representation/group cohomology carrier; no automatic p-adic derived completion comparison.
- `mathlib:LocalizedModule` — Mathlib/Algebra/Module/LocalizedModule/Basic.lean: Existing module localization, with scalar-extension comparison.
- `mathlib:HomologicalComplex.homology` — Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean: Chosen homology object of an eligible homological complex.
- `mathlib:KaehlerDifferential` — Mathlib/RingTheory/Kaehler/Basic.lean: Existing ordinary cotangent module I/I² and universal derivation; not the full cotangent complex.
- `mathlib:WittVector.fontaineTheta_teichmuller` — Mathlib/RingTheory/Perfectoid/FontaineTheta.lean: The Fontaine map on Teichmuller lifts equals PreTilt.untilt, under the same prime/nonunit/completeness hypotheses as fontaineTheta.
- `mathlib:surjective_fontaineTheta` — Mathlib/RingTheory/Perfectoid/FontaineTheta.lean: Surjectivity of fontaineTheta additionally assumes surjectivity of Frobenius on O/p; it is not asserted for arbitrary complete rings.
- `mathlib:WittVector.Isocrystal` — Mathlib/RingTheory/WittVector/Isocrystal.lean: Existing isocrystal module/Frobenius carrier; analytic classification is the new AI.2 theorem.
- `mathlib:WittVector.FractionRing.frobenius` — Mathlib/RingTheory/WittVector/Isocrystal.lean: Witt Frobenius automorphism on the existing fraction-field coefficient ring.
- `mathlib:AdicCompletion` — Mathlib/RingTheory/AdicCompletion/Basic.lean: Compatible inverse-limit families in M/(I^n·M). This is ordinary module completion, not derived completion. For the principal ideal (p) it gives the chart completion.
- `mathlib:TensorProduct` — Mathlib/LinearAlgebra/TensorProduct/Defs.lean: Existing tensor product of modules; it is not derived tensor.
- `mathlib:MvPolynomial` — Mathlib/Algebra/MvPolynomial/Basic.lean: For a commutative semiring R, multivariate polynomials indexed by σ are AddMonoidAlgebra R (σ→₀ℕ); used for the actual chart quotient.
- `mathlib:Ideal.Quotient.mk` — Mathlib/RingTheory/Ideal/Quotient/Defs.lean: Canonical ring homomorphism R→R/I for a commutative ring; the chart uses the ideal generated by its explicit equations.
- `mathlib:AdicCompletion.evalₐ` — Mathlib/RingTheory/AdicCompletion/Algebra.lean: For a commutative ring R and ideal I, the canonical R-algebra map AdicCompletion I R→R/I^n.
- `mathlib:Finset.max'` — Mathlib/Data/Finset/Max.lean: Maximum of a nonempty finite set in a linear order. The declaration is tagged @[to_dual], which generates Finset.min' (the minimum, with its own docstring at lines 131–134 of the same file); monomial-exponents uses that generated declaration for min_i a_i. The declaration index lists only names written in the source, so the generated name Finset.min' cannot be cited directly; this entry cites the declaration that generates it.
- `mathlib:MvPolynomial.pderiv` — Mathlib/Algebra/MvPolynomial/PDeriv.lean: Bundled R-derivation ∂_i of MvPolynomial σ R. Weighted linear combinations give the semistable logarithmic chart derivations.
- `mathlib:PowerSeries.map` — Mathlib/RingTheory/PowerSeries/Basic.lean: A coefficient ring homomorphism R→S induces a ring homomorphism R[[X]]→S[[X]], acting coefficientwise.
- `mathlib:PowerSeries.substAlgHom` — Mathlib/RingTheory/PowerSeries/Substitution.lean: For an R-algebra S and a substitutable series a, substitution gives R[[X]]→ₐ[R]MvPowerSeries τ S; X^p is substitutable for p≠0.
- `mathlib:PowerSeries.constantCoeff` — Mathlib/RingTheory/PowerSeries/Basic.lean: Constant coefficient R[[X]]→+*R; its composite with Witt Frobenius is the normalized crystalline coefficient map.
- `mathlib:WittVector.frobenius` — Mathlib/RingTheory/WittVector/Frobenius.lean: Under Fact p.Prime, Witt-vector Frobenius is a bundled ring endomorphism; the perfect-field specialization is used in the coefficient normalization.
- `mathlib:DividedPowers` — Mathlib/RingTheory/DividedPowers/Basic.lean: A divided power structure on an ideal, with null/zero/one/membership/addition/multiplication/composition axioms. This is not a universal completed PD envelope.
- `mathlib:DividedPowerAlgebra` — Mathlib/RingTheory/DividedPowerAlgebra/Init.lean: The ring-congruence quotient of MvPolynomial (ℕ×M) R for the universal divided-power algebra relations; it is not a PD envelope of a closed immersion.
- `mathlib:AdicCompletion.evalₐ_of` — Mathlib/RingTheory/AdicCompletion/Algebra.lean: evalₐ I n (of I R x) = Ideal.Quotient.mk _ x: the projection of the completion to R/I^n restricted to R is the quotient map. The API item Semistable.chartRing.reduction is this library lemma for the chart quotient.
- `mathlib:AdicCompletion.liftRingHom` — Mathlib/RingTheory/AdicCompletion/Algebra.lean: A compatible family of ring maps R →+* S ⧸ I^n lifts to R →+* AdicCompletion I S: the completed half of the chart universal property.
- `mathlib:IsAdicComplete.liftRingHom` — Mathlib/RingTheory/AdicCompletion/RingHom.lean: For an I-adically complete commutative ring S, a compatible family R →+* S ⧸ I^n lifts to R →+* S.
- `mathlib:AdicCompletion.isAdicComplete` — Mathlib/RingTheory/AdicCompletion/Completeness.lean: AdicCompletion I M is I-adically complete when I is finitely generated; applied to the principal ideal (p) it shows that the chart ring is p-adically complete.
- `mathlib:PowerSeries.expand` — Mathlib/RingTheory/PowerSeries/Expand.lean: For p ≠ 0 the R-algebra endomorphism f(X) ↦ f(X^p) of R⟦X⟧, with expand_apply (it is subst (X^p)) and coeff_expand. This is the substitution half of φ_𝔖.
- `mathlib:PowerSeries.HasSubst.X_pow` — Mathlib/RingTheory/PowerSeries/Substitution.lean: For n ≠ 0 the series X^n is substitutable; the hypothesis of substAlgHom used for u ↦ u^p.
- `mathlib:PowerSeries.coeff_subst_X_pow` — Mathlib/RingTheory/PowerSeries/Substitution.lean: coeff n (subst (X^k) f) = if k ∣ n then algebraMap R S (coeff (n/k) f) else 0 for k ≠ 0: the coefficient formula of the API item coefficientNormalization.frobenius.
- `mathlib:PowerSeries.constantCoeff_subst_X_pow` — Mathlib/RingTheory/PowerSeries/Substitution.lean: constantCoeff (subst (X^k) f) = algebraMap R S (constantCoeff f) for k ≠ 0: gives c∘φ_𝔖 = φ_W∘c.
- `mathlib:PowerSeries.substAlgHom_X` — Mathlib/RingTheory/PowerSeries/Substitution.lean: substAlgHom ha X = a: the value of the substitution on the variable.
- `mathlib:PreTilt.untilt` — Mathlib/RingTheory/Perfectoid/Untilt.lean: The multiplicative map x ↦ x^♯ from PreTilt O p to a p-adically complete ring O; π = (π^♭)^♯.
- `mathlib:Module.FaithfullyFlat.zero_iff_lTensor_zero` — Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean: For a faithfully flat R-module M a linear map f is zero iff M ⊗ f is zero; with lTensor_bijective_iff_bijective in the same file this is the module-level detection used after extension along 𝔖 → A_inf.
- `mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective` — Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean: For a faithfully flat R-module M, M ⊗ f is bijective iff f is.
- `mathlib:Module.equiv_free_prod_directSum` — Mathlib/Algebra/Module/PID.lean: Structure theorem: a finitely generated module over a principal ideal domain is isomorphic to the product of a free module and a direct sum of modules R ⧸ (p_i^{e_i}) with p_i irreducible. Applied to ℤ_p and to O_K in the torsion divisibility constraint.
- `mathlib:Module.equiv_directSum_of_isTorsion` — Mathlib/Algebra/Module/PID.lean: A finitely generated torsion module over a principal ideal domain is a direct sum of modules R ⧸ (p_i^{e_i}) with p_i irreducible; the structure theorem behind the torsion divisibility constraint over ℤ_p and O_K.
- `mathlib:ValuationRing` — Mathlib/RingTheory/Valuation/ValuationRing.lean: Integral domain with comparability of divisibility; no rank-one, topology, elementary-divisor or normalized-length API is supplied by this class.

The current upstream read used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. AdicSpaces Layer 6 and the current Y/Window/Quotient declarations supply the curve interior and the analytic-locus equality. The current AlgebraicVectorBundles scheme/QCoh operations do not supply SW’s analytic endpoint-extension theorem. The new plan requests that extension from AdicSpaces, preserving existing work.

The suggested namespace is `TauCeti.AInfSuggested`. Its ten definitions are `mu`, `xi`, `tildeXi`, `xiLevel`, `tildeXiLevel`, `shiftedTheta`, `thetaTilde`, `qInteger`, `coefficientFrobenius` and `crystallineCoefficient`. Their nine milestone statements are the cyclotomic factorizations, shifted-kernel/surjectivity statements, actual Fontaine Teichmüller formulas, divided torus coefficient formula, and the power-series coefficient/Frobenius-residue identities. Seven examples check finite length zero/one, the nonprimitive ε=1 case, integer coefficients, q=1, and the identity/parameter crystalline reductions.

All other targets retain their exact hypotheses above. In particular this file supplies no new derived category of sheaves, completion functor, geometric module category or cyclotomic spectrum. Unavailable carriers are omitted from the suggested file, rather than weakened to assertions about arbitrary coefficient data. All packet implementation statuses are unchecked.

## Sources, editions and corrections

Locators distinguish BMS1 v3 printed pages from published BMS1/BMS2 pagination. The accepted parts’ source readings and 21 earlier findings are retained as provenance; independent review checked them and added four findings, for 25 in total. The additional reading checked the coefficient/sheaf distinctions, the full canonical deformation construction, semistable supporting lemmas and the required trace prefix on 2026-10-13. Only the material needed by the targets is planned; source passages are not reproduced.

- **bms1-v3**: Bhargav Bhatt, Matthew Morrow, Peter Scholze, [Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), arXiv:1602.03148v3 (2019), 124 pages. SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`.
- **bms1-published**: Bhargav Bhatt, Matthew Morrow, Peter Scholze, [Integral p-adic Hodge theory](https://pmihes.centre-mersenne.org/item/10.1007/s10240-019-00102-z.pdf), Publ. Math. IHES 128 (2018), 219–397; online January 2019. SHA-256 `a924d36c8ef92888d9739011f8cc6675f846544c88edb9f670c7ecf2052702bb`.
- **bms2**: Bhargav Bhatt, Matthew Morrow, Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261), Public arXiv:1802.03261 PDF retrieved 2026-10-07. SHA-256 `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038`.
- **sch13**: Peter Scholze, [p-adic Hodge theory for rigid-analytic varieties](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf), Public author copy of Forum Math. Pi 1 (2013), e1. SHA-256 `73dded06286031066e9d98b638e065d650688f1e36e877f4d711331a3508dee3`.
- **sch13-erratum**: Peter Scholze, [Corrigendum to p-adic Hodge theory for rigid-analytic varieties](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf), 2016 complete three-page author corrigendum. SHA-256 `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235`.
- **sw20**: Peter Scholze, Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Public author copy (2020). SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
- **zavyalov**: Bogdan Zavyalov, [Mod-p Poincare Duality in p-adic analytic geometry](https://arxiv.org/pdf/2111.01830v3), arXiv:2111.01830v3; Annals 201 (2025) source route. SHA-256 `a984d973782649972a835b302e20ec91fc9c1abc5e5b43c7eccc5934b9c2c951`.
- **alb**: Johannes Anschutz, Arthur-Cesar Le Bras, [Prismatic Dieudonne Theory](https://arxiv.org/pdf/1907.10525v4), arXiv:1907.10525v4; published Forum Math. Pi (2023). SHA-256 `6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec`.
- **alb-erratum**: Johannes Anschutz, Arthur-Cesar Le Bras, [Erratum to Prismatic Dieudonne Theory](https://lebras.perso.math.cnrs.fr/Erratum_PDT.pdf), Public author erratum. SHA-256 `b4575e5c0885fe52de845ba910cd94ad05499fa97045f4d82aa197fff8311f2b`.
- **blm**: Bhargav Bhatt, Jacob Lurie, Akhil Mathew, [Revisiting the de Rham-Witt complex](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf), Public December 2019 author copy; published Asterisque 424 (2021). SHA-256 `dad4e554ad5847a9c7410a42d8d4f8eb37afffae643ed55ccdf11471278ece0d`.
- **stacks-flat**: The Stacks Project Authors, [Flat resolutions](https://stacks.math.columbia.edu/tag/077J), Online tags 077J, 03EW and 06XX inspected 2026-09-27.
- **stacks-completion**: The Stacks Project Authors, [Derived Completion](https://stacks.math.columbia.edu/tag/091N), Online §15.93 inspected 2026-09-27.
- **CK**: Kęstutis Česnavičius and Teruhisa Koshikawa, [The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145v3), arXiv:1710.06145v3, 4 October 2018; paper pagination 1–78. SHA-256 `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57`.
- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00102-z.pdf), Published, Publications Mathématiques de l’IHÉS 128 (2018), 219–397; DOI 10.1007/s10240-019-00102-z. SHA-256 `a924d36c8ef92888d9739011f8cc6675f846544c88edb9f670c7ecf2052702bb`.
- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Published, Publications Mathématiques de l’IHÉS 129 (2019), 199–310; DOI 10.1007/s10240-019-00106-9. SHA-256 `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.
- **BS22**: Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), arXiv:1905.08229v4, 12 January 2022; §18 paper pp.122–123. SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

New BMS2 trace citations use the published PDF with SHA-256 `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`. CK uses arXiv v3, SHA-256 `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57`. BMS1 v3 uses SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`. The version records separate inherited reading scopes from this pass’s direct reads.

## Source issues

All 25 findings below were checked independently at the stated locators. The inherited findings keep their earlier review history in the packet; the present verdict is by REV-AInfCohomology. Findings against an author copy or preprint remain scoped to that edition. No novelty claim is made for a finding merely because a recorded search found no separate erratum.

### AInfCohomology/E1 — error

**Locator.** bms1-published, Lemma 6.9 proof, published p.292; also arXiv v3 printed p.51

**Issue.** The proof identifies a quotient of the entire eta term in degree n−1 with line-twisted I-torsion in H^n(C).

**Correction.** Use the good-truncation boundary quotient: if x=f^(n−1)y lies in eta and dy=fz, H^n(C)[f]=0 implies z=dw; hence dx=f^n dw maps to zero in the target boundary quotient. Do not identify the entire degree n−1 term quotient with H^n(C)[I].

**Reason.** Take I=(2), n=1 and C=Z in degree0 with zero differential. The printed left quotient is Z/2, while H^1(C)[2]=0. The corrected boundary argument still constructs the lower-truncation comparison, so the theorem remains valid.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E2 — misprint

**Locator.** blm, Lemma 7.1.18 proof, author copy printed p.85; finding scoped to this author copy, published interior unavailable

**Issue.** The displayed boundary identification uses degree n−1 rather than degree n for its target.

**Correction.** The differential restricts to Y^(n−1)≃B^n.

**Reason.** B^n was defined as the image of d:X^(n−1)→X^n; a nonzero two-term differential has B^n nonzero and B^(n−1)=0.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E3 — misprint

**Locator.** blm, Proposition 7.2.4, author copy printed pp.86–87; finding scoped to this author copy, published interior unavailable

**Issue.** The completion premise refers to N again rather than to the domain M of the given map.

**Correction.** The premise says N is the derived p-completion of M.

**Reason.** As printed the premise is satisfied by any map into a p-complete N. For M=0 and N=Z_p it would incorrectly say Lη_p Z_p completes zero; the proof uses the corrected premise.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E4 — misprint

**Locator.** blm, Remark 8.4.3 final sentence, author copy printed p.105; finding scoped to this author copy, published interior unavailable

**Issue.** The final sentence sends the filtration index toward positive infinity to recover the underlying complex.

**Correction.** The underlying complex is the colimit as k→−infinity.

**Reason.** For the p-power filtration of Z[1/p], taking the inverse direction cannot recover the underlying localization; the preceding definition and decreasing-filtration transitions already use minus infinity.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E5 — misprint

**Locator.** blm, Example 8.4.7 proof, author copy printed p.106; finding scoped to this author copy, published interior unavailable

**Issue.** The proof orders the decreasing-filtration quotient using the previous index and truncates the whole complex instead of its associated graded piece.

**Correction.** Use F′k M/F′(k+1) M≃τ≤k(gr^k_F M), not τ≤k M.

**Reason.** The filtration is decreasing, so the printed quotient is not in that order. A filtered complex with two nonzero graded pieces shows that one graded quotient cannot be the truncation of the entire underlying M. The corrected formula follows term by term from the displayed F′ definition.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E6 — misprint

**Locator.** bms1-published, Remark 7.8, published p.302; arXiv v3 printed p.58

**Issue.** The notation for the first enhanced algebra applies the decalage functor to that same, not yet defined algebra.

**Correction.** Set E1=Leta_(q-1)(E2), where E2 is the previously defined derived group cohomology algebra.

**Reason.** The following comparison E1 to E2 and Example 7.7 use the decalage of group cohomology; applying the functor to E1 itself would be circular.

**Status.** PAPER-BHATT-MORROW-SCHOLZE-18/E6, confirmed by REV-PAPER-BHATT-MORROW-SCHOLZE-18; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E7 — misprint

**Locator.** bms1-published, Proof of Lemma 7.9, published p.303; arXiv v3 printed p.59, forward and converse divisibility checks

**Issue.** The two divisibility tests use multiplication by g on the second component y, rather than on the first component x.

**Correction.** For x in degree n and y in degree n-1, use differential (dx,dy+(-1)^n*g*x).

**Reason.** The second differential component has degree n; g*y has degree n-1. The differential displayed immediately before the tests and the intervening divisibility argument both use g*x.

**Status.** PAPER-BHATT-MORROW-SCHOLZE-18/E7, confirmed by REV-PAPER-BHATT-MORROW-SCHOLZE-18; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-1 — misprint

**Locator.** BMS1, Published §4.4 opening, p.280, immediately before Lemma 4.30

**Issue.** The power-series coefficient Frobenius is described as invertible.

**Correction.** Use an endomorphism: Witt Frobenius on W(k) and T↦T^p.

**Reason.** Every image series has exponents divisible by p, so T has no preimage. The earlier coefficient definition and BMS2 Notation 11.1 use this endomorphism, and §4.4 does not need surjectivity.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-2 — misprint

**Locator.** BMS2, Published proof of Theorem 11.2, p.306, first defining display

**Issue.** The source uses gr0 (TC− (A;Zp)[1/u]) and cites Proposition 11.15.

**Correction.** Use relative TC⁻(A/𝕊[z];Z_p) in the Bott-inverted gr⁰ definition.

**Reason.** The referenced Proposition 11.15 is relative, and both the following Frobenius composite and the 𝔖-module structure require the same relative spectrum; absolute TC⁻ cannot supply that base.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-3 — misprint

**Locator.** CK, §6.3, sentence citing [BMS18, 13.4 (ii)] after the definition of D_{Ψ,Ξ,n}(A), p.62, arXiv:1710.06145v3

**Issue.** The source takes the image of (A_inf/ξ^n)⟨(X_u^{±1})_{u∈Σ},(X_a)_{a∈Ξ}⟩ as a ring of definition, assigning it the p-adic topology.

**Correction.** (A_inf/ξⁿ)⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩: the first family is indexed by Ψ, not by Σ.

**Reason.** The ring concerned is D_{Ψ,Ξ,n}(A), defined two lines earlier as a quotient of B_dR⁺⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩; Σ is the index set of the formal torus of §5.17 and does not occur in §6.3. In the typeset text the expression is (A_inf/ξⁿ)⟨(X_u^{±1})_{u∈Σ},(X_a)_{a∈Ξ}⟩; the text extraction drops the angle brackets.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-4 — misprint

**Locator.** CK, §6.3, footnote 18, p.61, arXiv:1710.06145v3

**Issue.** The source chooses A⁺ := W̄(k)[T_1,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r − p^q).

**Correction.** A⁺ := W̄(k)[T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r−p^q), where W̄(k) is W(k) with an overline as in the typeset text: the variable T_0 is missing from the list.

**Reason.** The relation T_0⋯T_r−p^q involves T_0, and the chart (6.3.1) on the same page has the variables T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}. The overline on W(k) is lost in the text extraction.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-5 — misprint

**Locator.** CK, §7.2, sentence introducing (7.2.1), p.68, arXiv:1710.06145v3

**Issue.** The source attributes the subsequent identifications to (2.3), (4.18.1), and (5.43.2).

**Correction.** Replace the reference (2.3) by (2.3.1); retain (4.18.1) and (5.43.2).

**Reason.** The paper has no display numbered (2.3); the étale identification in the first line of (7.2.1) is display (2.3.1) of Theorem 2.3.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-6 — misprint

**Locator.** CK, Question 7.13, p.72, arXiv:1710.06145v3

**Issue.** val_{W(k)}(H^i_logcris(𝔛/W(k))_tors) ≠ val_{O_C}(H^i_logdR(𝔛/O_C)_tors)?

**Correction.** val_{W(k)}(H^i_logcris(𝔛_k/W(k))_tors) ≠ val_{O_C}(H^i_logdR(𝔛/O_C)_tors): the special fibre 𝔛_k, not 𝔛.

**Reason.** Logarithmic crystalline cohomology over W(k) is that of the special fibre 𝔛_k everywhere else in §7 ((7.2.1), (7.6.4), (7.8.1), (7.9.1)), and the question is prompted by (7.8.1) and Theorems 7.9 and 7.12. In the extracted text '6=' stands for ≠.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-7 — misprint

**Locator.** CK, Proof of Proposition 3.33, first line of p.24, arXiv:1710.06145v3

**Issue.** The flat coefficient base is written with integer, rather than p-adic integer, power series.

**Correction.** The intended base in this step is Z_p[[T]].

**Reason.** The morphism on p.23 has source Z_p[[T]], with T mapped to the cyclotomic coefficient. Proposition 3.29 on p.21 and the next sentence on p.24 use that same p-adic base; the missing subscript occurs in the rendered PDF.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-8 — misprint

**Locator.** CK, §4.15 (proof of Theorem 4.11), p.30, arXiv:1710.06145v3

**Issue.** The source invokes Theorem 4.12 to algebraize (4.10.3), obtaining the O_𝒳-module map f: Ω¹_{𝒳/O_C}{−1} → ℋ.

**Correction.** 𝒳 should be its base change 𝒳_{O_C} throughout the algebraisation step: f is a map of O_{𝒳_{O_C}}-modules Ω¹_{𝒳_{O_C}/O_C}{−1}→ℋ on 𝒳_{O_C}, and likewise in (4.15.2) and in the extension across the non-smooth locus.

**Reason.** 𝒳 is introduced on p.29 as a proper flat scheme over the integral closure of W(k), which is not p-adically complete; Theorem 4.12 requires a proper finitely presented scheme over an a-adically complete valuation ring, and Ω¹_{𝒳/O_C} has no meaning for a scheme that is not over O_C. Remark 4.19 (p.31) writes 𝒳_{O_C} for the same object. Checked on PDF p.30. The intended meaning is clear and the argument is unaffected.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-9 — misprint

**Locator.** BS22, §15.2, last paragraph, p.105 (arXiv:1905.08229v4)

**Issue.** The trace definition is attributed to a proposition numbered 11.5 in BMS2.

**Correction.** Refer to BMS2 Proposition 11.15 and the proof of Theorem 11.2.

**Reason.** BMS2 item 11.5, p.300, constructs a relative cyclotomic structure. The Bott-inverted degree-zero definition occurs in Proposition 11.15, p.305, and its use to define cohomology in Theorem 11.2, p.306.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-10 — misprint

**Locator.** BMS2, Notation 11.1, p.298 (the same wording in the abstract and in §1, p.199)

**Issue.** The source takes K to be an extension of Qp with a discrete valuation and perfect residue field k.

**Correction.** Add completeness to the discretely valued mixed-characteristic field hypothesis.

**Reason.** The coefficient-ring surjection requires a complete O_K containing W(k). The maximal unramified algebraic extension of Q_p has perfect residue field but is not complete and does not contain W(F̄_p). BMS1 §4.1 and BS22 Example 1.3(3) impose completeness.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-11 — misprint

**Locator.** BMS1, §4.1, paragraph before Theorem 4.4, p.265

**Issue.** The coefficient map specifies T↦[π^♭]^p and asserts compatibility with both shifted Fontaine maps, without specifying its action on W(k).

**Correction.** The map must act on W(k) through Witt Frobenius.

**Reason.** For a∈W(k), shifted theta applies φ_W⁻¹. A W(k)-linear assignment therefore gives φ_W⁻¹(a), whereas the upper shifted coefficient map gives a. Commutativity requires φ_W on coefficients, which BMS1 §4.4, pp.280–281 specifies.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-12 — gap

**Locator.** CK, Proof of Theorem 3.9, p.13 (with Lemma 3.4, p.11), arXiv:1710.06145v3

**Issue.** The source uses the trivial action of Δ on R and Lemma 3.7 to identify the last quotient as a finite direct sum of R-copies. Proposition 3.8 is then invoked to exclude nonzero 𝔪-torsion, and Lemma 3.4 is claimed to apply to the maps and yield the conclusion.

**Correction.** Lemma 3.4 (BMS1 Lemma 8.11(i)) requires that M and M/(ζ_p−1)M have no nonzero 𝔪-torsion, for M=H^i_cont(Δ,R_∞); the proof checks M and the quotient M/M[ζ_p−1], which is a different module. The required statement holds: R_∞ has no (ζ_p−1)-torsion, so M/(ζ_p−1)M injects into H^i_cont(Δ,R_∞/(ζ_p−1)), which has no nonzero 𝔪-torsion by the case b=ζ_p−1 of Proposition 3.8.

**Reason.** For M=H^i_cont(Δ,R)⊕H^i_cont(Δ,M_∞) the quotient M/M[ζ_p−1] is the image of the first summand, whereas M/(ζ_p−1)M is H^i_cont(Δ,R)/(ζ_p−1) plus the whole second summand; a module without 𝔪-torsion always has M/M[f] without 𝔪-torsion, so the check made is not the hypothesis of the lemma. The theorem is correct.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-13 — gap

**Locator.** BMS2, Remark 11.16, p.307 (Publ. math. IHÉS 129)

**Issue.** The obstruction to functorial Frobenius descent is illustrated for general K by an elliptic j-invariant outside W(k)[π^p].

**Correction.** A descent along φ of the projection for A=O_K is a quotient 𝔖/J with φ(J)𝔖=(E). If no such J exists, which is so whenever p does not divide the degree e of E (in particular for K unramified, where moreover W(k)[π^p]=O_K and no elliptic curve as described exists), there is no descent already for A=O_K, for a different reason. If it exists, J=ker θ, 𝔖/J≅W(k)[π^p], O_K is free of rank p over it, and the elliptic-curve argument applies.

**Reason.** For K=Q_p and π=p, W(k)[π^p]=O_K, so the suggested j-invariant cannot exist. The ideal (z−p) cannot be extended from a series ideal in z^p. More generally p∤e obstructs coefficient-ideal descent already for O_K. The conclusion about absence of functorial descent survives with these separate cases.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E-AI6-14 — gap

**Locator.** BMS2, Notation 11.1, p.298 (Publ. math. IHÉS 129)

**Issue.** The source claims faithful flatness and topological freeness for the resulting map 𝔖 → A_inf, citing [BMS18, Lemma 4.30 and its proof].

**Correction.** BMS1 Lemma 4.30 and its proof give flatness only. Faithful flatness follows because the map is a flat local homomorphism of local rings. Topological freeness follows by lifting a basis of A_inf/(p,[π^♭]^p) over k that contains 1 and applying derived Nakayama for the regular sequence (p,z); this argument is in neither paper.

**Reason.** BMS1 Lemma 4.30, p.281, proves flatness by concentration of derived scalar extension in degree zero. It supplies neither the local-ring argument for faithful flatness nor a lifted topological basis. BMS2 Corollary 11.12(4) and Remark 11.17 use the stronger topological statement.

**Status.** new; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E8 — misprint

**Locator.** BMS2, Definition 5.1 and following graded-piece convention, published p.233; arXiv v2 printed p.28

**Issue.** The decreasing-filtration quotient uses the preceding index.

**Correction.** Use gr^i(F)=cofib(F(i+1)→F(i)).

**Reason.** A Z^op filtration has an arrow F(i+1)→F(i). The step filtration F(0)=A, F(1)=0 must have gr^0=A.

**Status.** DerivedDeRhamCohomology/E5 and the corresponding PrismaticCohomology finding; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E9 — misprint

**Locator.** BMS2, Proof of Corollary 5.10, third functor, published p.239; its verification on p.240; arXiv v2 printed p.33

**Issue.** The third functor takes the positive-infinity limit of the filtration.

**Correction.** Use F↦colim_(i→−∞)F(i)=F(−∞).

**Reason.** Proposition 5.8 identifies the underlying object of the connective cover with Lη_I K. The next page proves monoidality for the negative-infinity colimit. A complete nonzero step filtration has positive-infinity limit zero, so that limit cannot return its underlying object.

**Status.** No separate correction identified in the recorded search; novelty is not established.; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E10 — misprint

**Locator.** BS22, Corollary 15.5, final cohomology display, arXiv:1905.08229v4 printed p.104

**Issue.** The induced inverse-to-Frobenius map has the Frobenius direction after its source and target are interchanged.

**Correction.** Use V_i:H^i(Δ)⊗I^i→H^i(Δ^(1)), inverse to φ up to I^i.

**Reason.** Taking cohomology of the truncation map V_i in the opening sentence gives this direction. It agrees with Theorem 1.8(6), and the composites with φ are multiplication by I^i.

**Status.** PrismaticCohomology:PR.3/image-of-frobenius; PAPER-BHATT-SCHOLZE-22/E25; independently confirmed by REV-AInfCohomology.

### AInfCohomology/E11 — misprint

**Locator.** BS22, Corollary 15.4, arXiv:1905.08229v4 printed p.104

**Issue.** The de Rham target is indexed by an undeclared affine ring R in a statement about a formal scheme X.

**Correction.** Use the sheaf de Rham complex Ω^•_(X/(A/I)).

**Reason.** The corollary starts with X and states an equivalence of complexes on its étale site. Its affine formula is recovered on X=Spf R, rather than defining R for general X.

**Status.** PrismaticCohomology:PR.3/de-rham-comparison-general; PAPER-BHATT-SCHOLZE-22/E1; independently confirmed by REV-AInfCohomology.
