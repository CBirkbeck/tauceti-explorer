# Rank-zero and rank-one Birch–Swinnerton-Dyer theory, Part II: CM rank-zero converses and twist nonvanishing

This roadmap extends `RankZeroOneBSD`. Its central endpoint is the rank-zero implication for CM elliptic curves over their imaginary quadratic CM field, at every prime and for every CM order. The modular endpoint works at every even weight at least two. The proof uses an actual Kato class: Selmer vanishing forces a one-dimensional global cohomology space, rational main-conjecture equality makes a correctly signed specialization a basis, and explicit reciprocity detects its nonzero central L-value. The applications concern congruent-number twists and CM quadratic twists in two precisely specified orderings.

This is a complete **planning pass**: seven layers, all planned, none closed. Its two explicit gaps are the unregistered all-prime CM main-conjecture endpoint and the unregistered unconditional Smith corank endpoint. Ten precise supplier requests record the additional interfaces needed from existing roadmaps. Each declaration has implementation status `unchecked`. A planning dependency is not a claim that a library theorem already exists.

## Conventions and imports

For the newform argument, f is a normalized cuspidal newform of even weight k≥2, level N≥1 and coefficient field F. Fix any prime p, λ|p, coefficient completion E=F_λ and h=k/2. Kato’s realization is M_f=ρ_f^∨, rather than the arithmetic realization ρ_f. Write W=M_f(h), W′=W^∨(1)≅M_{f*}(h). The star form has conjugate Fourier coefficients. The completed lattice and its local extension are those in Kato’s j_*T complex; all rational cohomology is taken only after the integral local and real-place conventions have been fixed.

For an elliptic curve, V_pE denotes the rational Tate module. Selmer corank means the ℤ_p-corank of the classical discrete p∞ Kummer Selmer group, measured by the dimension of its rationalized Pontryagin dual. It is not the dimension of Sel_p and is not merely the Mordell–Weil rank. The Kummer comparison used in C.4 is a comparison with the rational Tate module of this Selmer group.

At p=2, retain the real-place Tate terms, finite kernels/cokernels and integral Δ={±1} action. The projectors (1±σ)/2 and the finite-character idempotents are used after passing to characteristic-zero coefficients. No integral direct-sum decomposition at 2 is asserted.

The arithmetic L-functions and their analytic continuations are imports from `RankZeroOneBSD:BSD.0`, ModularForms Layer 7 and CM.4. Analytic rank is the finite order at the centre of those actual functions. The generic derived control theorem, completed group algebra, characteristic ideals, Kato zeta morphism and Bloch–Kato maps also stay with their existing owners. This roadmap owns their proof-specific applications and the four lightweight propositions/conventions plus the cube-sum model.

| Supplier | Output used here |
| --- | --- |
| RankZeroOneBSD BSD.0–BSD.1 | Actual elliptic L-functions, finite analytic order, twists, root numbers, quadratic factorization and rational Selmer descent, including its dyadic maps. |
| ModularForms Layer 7 | Actual arithmetic newform L-functions, continuation, conjugation and omitted-factor identity. |
| EllipticCurves Layers 5 and 7 | Existing twists/model comparison; generic isogeny invariance of Selmer corank and every Euler factor. |
| KatoEulerSystems L2–L4 | Actual rational zeta morphism, conjugation relation, reciprocity, independent Iwasawa module structure and modular local dimensions. |
| SelmerIwasawaCohomology L2–L4 | Corank and Kummer carriers, finite local conditions, completed cyclotomic evaluation and derived specialization with Tor terms. |
| ArithmeticGaloisDuality R02.4 and D7 | Rational Poitou–Tate, rational Euler characteristic and amplitude, compact Shapiro and projection. |
| AutomorphicGaloisRepresentations R19.1/R19.3/R19.4/R19.5 | Cohomological normalization, irreducibility, local factors and bad/coefficient-prime compatibility. |
| PadicHodgeRegulators L1 | H_f, H_g, dual exponential and their dimension comparison. |
| ComplexMultiplicationAndExplicitReciprocity CM.1/CM.4 | CM character, coefficient decomposition, general theta induction, full factorization and the rational self-twist isogeny. |
| ArithmeticStatistics ST.0/ST.5 | Existing arithmetic families/heights and density rules, reduced 3-Selmer input and its corank consequence. |
| CMAllPrimeMainConjectures | BT Theorem 2.6, pending registered stage/node: GAP-CM. |
| ArithmeticStatisticsPartIISmithMethod | Unconditional positive-family Smith corank distribution, pending registered stage/node: GAP-SMITH. |

### Baseline and current upstream check

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The six declarations below were read in source at those pins. The supplied reviewed coverage audit was checked for all relevant supplier directions. Existing raw L-series, finite 2-descent Selmer groups and Dedekind S-unit Selmer groups do not provide the analytic/Bloch–Kato objects used by this proof.

- `tauceti:HeckeRing.GL2.Newform` in `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`: Actual normalized nonzero new cuspidal eigenform, extending EigenformAwayFromLevel and its coefficient-one normalization. Statement at lines 100–107 read from the pinned source; SHA-256 a8990c9ba267bbe0515851799c1ad71bab29cba565832d495a435ca091dbe02d matches the raw pinned GitHub file.
- `mathlib:WeierstrassCurve` in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: The existing five-coefficient Weierstrass model, over which the cube-sum model is defined. Five-field structure at the pinned source line 77 read.
- `mathlib:WeierstrassCurve.Δ` in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: The polynomial discriminant b₂,b₄,b₆,b₈ formula used to compute the cube-sum discriminant. Definition at pinned source line 132 read.
- `mathlib:WeierstrassCurve.IsElliptic` in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: Invertibility of the Weierstrass discriminant, equivalent to nonzero discriminant over ℚ. Class and isUnit_Δ interface at pinned source line 363 read.
- `mathlib:WeierstrassCurve.j` in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: The j-invariant, requiring IsElliptic and defined using the inverse of the discriminant unit times c₄³. Definition and j_mul_Δ at pinned source line 389 read.
- `mathlib:WeierstrassCurve.map` in `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`: Coefficient-wise base change along a ring homomorphism for the existing curve model. Definition at pinned source line 231 read.

The current read-only TauCetiRoadmap and Tau Ceti library were also inspected on 2026-10-18. The nine newer roadmap directions omitted from the atlas snapshot were screened; the relevant LocalGaloisGroups and ProfiniteArithmetic suggested files do not supply the arithmetic duality or CM converse targets. Current completed group-algebra Basic/Map/PowerSeries/DyadicCoordinate belongs to the existing infrastructure supplied to SI. It is imported rather than designed again. The nearby ModularForms and EllipticCurves reader documents supplied the style and carrier conventions.

### Build order and proof obligations

| Layer | Milestone |
| --- | --- |
| C.0 | Central conventions and shared propositions |
| C.1 | Finite-level vanishing and the global line |
| C.2 | Central specialization of the Kato class |
| C.3 | The rational rank-zero newform converse |
| C.4 | CM elliptic curves and quadratic descent |
| C.5 | Congruent-number twists and even Goldfeld |
| C.6 | CM twists, cube sums and non-descent |

C.0 → C.1 → C.2 → C.3 gives the modular converse; C.4 applies it to CM elliptic curves and descends to ℚ. C.5 and C.6 combine it with the independently owned counting results. The individual prerequisites below are the exact dependency specification; the roadmap definition carries their stage-level projection. Its 46 new stage edges introduce no cycle into the existing atlas stage graph.

## Target catalogue

Every target below records its packet identifier, statement, proof route and acceptance check. Definitions/constructions additionally record the API inferred from their consumers and discriminating unit tests. All statements and source descriptions are in our own words. The small proof steps are explanations, not additional roadmap nodes.

## C.0: Central conventions and shared propositions

Define the shared rank-r p-converse implication, the correctly normalized central sign, the central specialization kernel σ_c↦c^(−k/2), and the cohomological/conjugate-dual dictionary. The newform, Selmer, completed-algebra and analytic-rank carriers are imports.

**Stage prerequisites:** `AutomorphicGaloisRepresentations:R19.1`, `AutomorphicGaloisRepresentations:R19.5`, `RankZeroOneBSD:BSD.0`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L3`.

### The rank-r p-converse proposition

`CMRankZeroConverse:C.0/p-converse-property` · definition · planet: **Rank-r p-converse**

For an elliptic curve E/ℚ, a prime p and r ∈ ℕ, pConverse(E,p,r) is the proposition corank_{ℤ_p} Sel_{p∞}(E/ℚ)=r ⇒ analyticRank(E)=r. The analytic rank is the finite order at 1 of the actual arithmetic L-function, not of a freely chosen analytic germ.

**Hypotheses and conventions.** E is elliptic over ℚ; p is prime; the Selmer module is cofinitely generated as in its supplier.

**Construction or proof.**

1. Use the existing p∞ Selmer group, its corank and the existing analytic rank; introduce only the implication.

**Prerequisites:** `RankZeroOneBSD:BSD.0/analytic-rank`, `SelmerIwasawaCohomology:L2/corank`, `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`.
**Check.** The predicate is meaningful at every prime, including 2; its definition proves no rank-r theorem.

**Consumers and API design.**

- BT Theorem 1.1 over ℚ, p. 1: Packages the final r=0 theorem.
- RankOneConverse design brief, issue #951: Provides the shared proposition; that design imports this owner rather than defining it again.

**API.**

- `TauCeti.CMRankZeroConverse.pConverse_iff` (characterisation): pConverse(E,p,r) iff corank Sel_{p∞}=r implies analyticRank(E)=r.
- `TauCeti.CMRankZeroConverse.pConverse_zero_iff` (compatibility): pConverse(E,p,0) iff corank Sel_{p∞}=0 implies L(E,1)≠0, using the parent analytic-rank equivalence.
- `TauCeti.CMRankZeroConverse.pConverse_congr` (functoriality): Equal Selmer coranks and equal analytic ranks transport pConverse at a fixed p and r.
- `TauCeti.CMRankZeroConverse.not_pConverse_iff` (characterisation): Failure is equivalent to corank Sel_{p∞}=r and analyticRank(E)≠r.

**Unit tests.**

- `TauCeti.CMRankZeroConverse.pConverse_zero_test` (characterisation): With corank=0 and L(E,1)≠0, pConverse(E,p,0) is true, including p=2.
- `TauCeti.CMRankZeroConverse.pConverse_wrong_rank_test` (non-example): If corank=0 and analyticRank=1 then pConverse(E,p,0) is false, while pConverse(E,p,1) is vacuously true.
- `TauCeti.CMRankZeroConverse.pConverse_finite_selmer_test` (compatibility): If corank Sel_{2∞}=0 and E[2](ℚ)≅(ℤ/2)², the r=0 antecedent is true while Kummer forces dim Sel_2≥2; replacing corank zero by Sel_2=0 changes the predicate.

**Source locators.** [BT] §1.0.1, equation (1.1), p. 1: The rank-r implication fixes the direction, the corank and the analytic conclusion.

### The sign of the central Kato class

`CMRankZeroConverse:C.0/central-sign` · definition · planet: **Central Kato sign**

Define centralSign(k)=(-1)^(k/2−1) ∈ ℤ for natural k, with natural division and subtraction. Its arithmetic domain is even k≥2; write h=k/2 on that domain. The projection γ^ε is (γ+ε cγ)/2 after extension to the coefficient field.

**Hypotheses and conventions.** Complex conjugation c is the involution on the cohomological realization; rational coefficients allow division by 2 even at p=2.

**Construction or proof.**

1. Use integer powers for the sign and the existing eigenspace projection; no new eigenspace carrier is introduced.


**Check.** On the arithmetic domain ε(-1)^h=-1. The opposite eigenspace cannot contribute to the central specialization.

**Consumers and API design.**

- BT (3.2) and Kato sign relation: Determines which one-dimensional line survives specialization.
- C.2/zeta-basis: Ensures an arbitrary nonzero vector is not mistaken for a generator.

**API.**

- `TauCeti.CMRankZeroConverse.centralSign_sq` (relation): centralSign(k)^2=1 for all k.
- `TauCeti.CMRankZeroConverse.centralSign_mul_halfWeight` (relation): If k≥2 is even and h=k/2 then centralSign(k)·(-1)^h=-1.
- `TauCeti.CMRankZeroConverse.centralSign_add_four` (simp): For k≥2, centralSign(k+4)=centralSign(k).
- `TauCeti.CMRankZeroConverse.centralSign_projection` (compatibility): For ε=centralSign(k), let Pε(v)=(v+εc(v))/2. Then c(Pε(v))=εPε(v), and c(v)=εv implies Pε(v)=v. Thus this formula is the existing projection onto the ε eigenspace; in the arithmetic application k≥2 is even.

**Unit tests.**

- `TauCeti.CMRankZeroConverse.centralSign_weight_two` (computation): centralSign(2)=1; the vector with cγ=−γ is the wrong sign at weight two.
- `TauCeti.CMRankZeroConverse.centralSign_weight_four` (computation): centralSign(4)=−1 and centralSign(6)=1; the untwisted sign (−1)^(k−1) fails these values.
- `TauCeti.CMRankZeroConverse.centralSign_domain` (non-example): centralSign is total, with centralSign(0)=1, but weight 0 and odd weight 3 are excluded from every central-converse theorem.

**Source locators.** [BT] Theorem 3.1 proof, p. 6: The half-weight determines the eigenspace used for the zeta generator. [Kato] Theorem 12.5(1), pp. 221–222; §14.13, p. 242: The period projection uses the same critical sign.

### Kato’s cohomological realization at the centre

`CMRankZeroConverse:C.0/modular-normalization` · comparison

For a normalized newform f of level N≥1 and even weight k≥2, coefficient field F and λ|p, use E=F_λ and M_f=V_Kato(f)=ρ_f^∨. Put h=k/2, W=M_f(h), and W′=W^∨(1). Kato’s conjugate form f* satisfies M_{f*}≅M_f^∨(1−k), so W′≅M_{f*}(h). Both are de Rham at p; complex conjugation has one eigenline of each sign. At good ℓ≠p the geometric-Frobenius polynomial of M_f is X²−a_ℓ(f)X+ε_f(ℓ)ℓ^(k−1).

**Hypotheses and conventions.** All realizations and coefficient embeddings are the ones of R19.1; the fixed newform carrier is the baseline Newform, not a newly defined form.

**Construction or proof.**

1. Read R19.1’s cohomological/arithmetic dictionary and apply Kato (14.10.1). Dualize and twist explicitly. Use R19.5 for the classical coefficient-prime statement without an ordinarity or p∤N restriction.

**Prerequisites:** `tauceti:HeckeRing.GL2.Newform`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`.
**Check.** For a weight-two modular elliptic curve with trivial character, M_f(1) is its rational Tate module via the Weil pairing; M_f alone is its dual.

**Source locators.** [Kato] §8.3; (14.10.1)–(14.10.4), pp. 240–241: Fixes the dual, Tate twist and Frobenius conventions used in the proof. [BT] §2.2.1 and Theorem 3.1, pp. 4–6: The representation is Kato’s realization and the central twist is h.

### The central specialization prime

`CMRankZeroConverse:C.0/central-prime` · definition · planet: **Central specialization prime**

For Λ=O_λ[[G∞]], G∞=Gal(ℚ(μ_{p∞})/ℚ), κ(σ_c)=c, put A=Λ[1/p]. Define ev_h:Λ→O_λ by σ_c↦c^(−h), extend to A→E and set 𝔮=ker(A→E). On the selected finite-character component, 𝔮 is a height-one maximal ideal and A_𝔮 is a discrete valuation ring with residue field E. This uses the supplier’s completed algebra and continuous-character evaluation.

**Hypotheses and conventions.** h=k/2 with even k≥2; O_λ is the integer ring of E; the inverse Galois action and twist convention are fixed.

**Construction or proof.**

1. Specialize the supplied character evaluation to κ^(−h); take its ring-theoretic kernel. Use the procyclic coordinate after rational finite-character decomposition.

**Prerequisites:** `CMRankZeroConverse:C.0/modular-normalization`, `SelmerIwasawaCohomology:L3/rational-specialization`, `SelmerIwasawaCohomology:L3`.
**Check.** At p=2 retain Δ={±1} integrally; take its rational idempotent before using the one-variable local ring.

**Consumers and API design.**

- BT Theorem 3.1 proof, p. 6: Localizes the characteristic-ideal equality at the point defining the finite-level class.
- C.2/specialization-application: Matches the control sequence to W rather than to its opposite twist.

**API.**

- `TauCeti.CMRankZeroConverse.centralEval_sigma` (simp): ev_h(σ_c)=c^(−h); in particular ev_h(σ_{−1})=(−1)^h.
- `TauCeti.CMRankZeroConverse.centralPrime_mem_iff` (characterisation): a∈𝔮 iff ev_h(a)=0.
- `TauCeti.CMRankZeroConverse.centralPrime_residue` (universal-property): A/𝔮≅E as E-algebras, with the quotient map identified with ev_h.
- `TauCeti.CMRankZeroConverse.centralPrime_twist` (compatibility): The supplier’s semilinear twist Tw_h(σ_c)=c^(−h)σ_c followed by augmentation is ev_h.
- `TauCeti.CMRankZeroConverse.centralPrime_component` (structure): The component with σ_{−1} acting by (−1)^h is the only component seen by A→E; at p=2 this decomposition is rational.

**Unit tests.**

- `TauCeti.CMRankZeroConverse.centralPrime_two_test` (computation): At p=2,k=2, ev_h(σ_{−1})=−1 and σ_{−1}+1∈𝔮; replacing Δ by the trivial group fails.
- `TauCeti.CMRankZeroConverse.centralPrime_four_test` (computation): At k=4, ev_h(σ_{−1})=1, so σ_{−1}−1∈𝔮.
- `TauCeti.CMRankZeroConverse.centralPrime_exponent_test` (non-example): For p odd and c=1+p, ev_h(σ_c)=(1+p)^(−h), distinct from (1+p)^h for h≥1; p is a unit in A and is not in 𝔮.

**Source locators.** [BT] Theorem 3.1 proof, definition of q, p. 6: The specialization has the negative half-weight exponent. [Kato] §14.13, p. 242: The twist and finite-level specialization factor through this character.

## C.1: Finite-level vanishing and the global line

For every even weight k≥2 and every λ|p, prove global H⁰ vanishing, H¹_f(ℚ,W)=0 ⇒ H²(Z[1/p],j_*T(h))[1/p]=0 using both Tate-dual applications of rational Poitou–Tate, then the one-dimensional global H¹ theorem. Prove central H_g=H_f, including bad p, by excluding crystalline eigenvalue one on W^∨(1).

**Stage prerequisites:** `ArithmeticGaloisDuality:R02.3`, `ArithmeticGaloisDuality:R02.4`, `AutomorphicGaloisRepresentations:R19.3`, `AutomorphicGaloisRepresentations:R19.5`, `CMRankZeroConverse:C.0`, `KatoEulerSystems:L4`, `PadicHodgeRegulators:L1`.

### Global invariants of modular twists vanish

`CMRankZeroConverse:C.1/modular-h0-vanishing` · lemma

For every normalized cuspidal newform f of weight k≥2, every coefficient place λ and integer r, H⁰(ℚ,M_f(r))=0. In particular H⁰(ℚ,W)=H⁰(ℚ,W′)=0 at the even-weight centre.

**Hypotheses and conventions.** The realization is the actual irreducible two-dimensional newform realization.

**Construction or proof.**

1. Apply classical newform irreducibility after the dual and Tate twist; a nonzero invariant line would contradict irreducibility. At even weight the good-prime weight bound also excludes eigenvalue 1.

**Prerequisites:** `CMRankZeroConverse:C.0/modular-normalization`, `AutomorphicGaloisRepresentations:R19.3/classical-newform-irreducibility`.
**Check.** No assertion is made that all local invariants vanish for arbitrary twists; only the central local statement below is used.

**Source locators.** [Kato] Proposition 14.11(1) and its proof, p. 241: The proof begins with the vanishing of rational global invariants.

### Finite-level H² vanishes under Selmer zero

`CMRankZeroConverse:C.1/selmer-zero-h2` · theorem · planet: **Selmer vanishing and H²**

If H¹_f(ℚ,W)=0 then H²(Z[1/p],j_*T(h))[1/p]=0 for any stable lattice T⊂M_f, in Kato’s étale convention. Here j_* retains the prescribed local extension at bad primes; changing the ramification set without its local corrections is forbidden.

**Hypotheses and conventions.** Even k≥2; W=M_f(h), W′=M_{f*}(h); modular local cohomology has dim H¹(ℚ_p,W)=2, dim H¹_f(ℚ_p,W)=1 and H⁰=H²=0, also for W′.

**Construction or proof.**

1. Use rational Poitou–Tate (Kato 14.9.3) for a lattice in W′ first. Its dual Selmer term is controlled by H¹_f(ℚ,W)=0; the global Euler-characteristic identity and the one-dimensional local quotient force H¹_f(ℚ,W′)=0. The finite difference between Kato’s S(T) and the classical finite Selmer group disappears after rationalization.
2. Apply the same exact sequence to W. Its dual Selmer term now vanishes, and H²(ℚ_p,W)=0, giving the asserted global H² vanishing.
3. At p=2 retain real-place Tate terms and the integral errors killed by 2 through both applications. Only then invert p.

**Prerequisites:** `CMRankZeroConverse:C.1/modular-h0-vanishing`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`, `ArithmeticGaloisDuality:R02.4`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`, `KatoEulerSystems:L4`.
**Check.** Both appearances of the Tate dual and the rationalization at 2 are displayed; Selmer zero is not substituted for its dual without proof.

**Source locators.** [BT] Theorem 3.1 proof, equation (3.1), p. 6: The compressed implication is expanded into its duality applications. [Kato] (14.9.3), (14.9.5), (14.10.1), Proposition 14.12, pp. 239–242: Supplies the exact sequence, Euler identity and local dimensions.

### The global central cohomology line

`CMRankZeroConverse:C.1/global-dimension` · theorem

Under H¹_f(ℚ,W)=0, dim_E H¹(Z[1/p],j_*T(h))[1/p]=1.

**Hypotheses and conventions.** Same conventions as selmer-zero-h2; the cohomology has no rational terms above degree 2.

**Construction or proof.**

1. Use h⁰−h¹+h²=−dim_E W^{c=−1}, with h⁰=h²=0 and dim W^{c=−1}=1. Keep the archimedean corrections until rationalization.

**Prerequisites:** `CMRankZeroConverse:C.1/modular-h0-vanishing`, `CMRankZeroConverse:C.1/selmer-zero-h2`, `ArithmeticGaloisDuality:R02.4`, `CMRankZeroConverse:C.0/modular-normalization`.
**Check.** The dimension is one for every λ|2 as well as for odd p; it is not the dimension of the vanishing finite Selmer subspace.

**Source locators.** [BT] Theorem 3.1 proof after (3.2), p. 6: Identifies the target of specialization as one-dimensional. [Kato] (14.9.5), p. 240: The negative complex-conjugation eigenspace governs the Euler characteristic.

### Geometric and finite conditions coincide at the centre

`CMRankZeroConverse:C.1/central-hg-equals-hf` · theorem · planet: **Central finite local condition**

For W=M_f(k/2), H¹_g(ℚ_p,W)=H¹_f(ℚ_p,W), and exp*_W induces an injection on H¹(ℚ_p,W)/H¹_f(ℚ_p,W). The quotient has E-dimension one.

**Hypotheses and conventions.** k≥2 even, any p and λ; no good-reduction or ordinary hypothesis.

**Construction or proof.**

1. Use R19.3/R19.5 and Kato (14.10.4)–(14.10.5) for f*: each eigenvalue of φ on D_cris(W′) has complex absolute value p^(−1/2) or p^(−1), when present. At a monodromic bad prime use the weight on ker N, not a claim that every invariant has weight −1. Thus D_cris(W′)^{φ=1}=0.
2. Apply the supplied formula dim H_g−dim H_f=dim D_cris(W′)^{φ=1}, the inclusion H_f⊆H_g and ker exp*=H_g. Use the modular local dimensions for the quotient dimension.

**Prerequisites:** `CMRankZeroConverse:C.0/modular-normalization`, `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`, `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeRegulators:L1/dual-exponential`, `PadicHodgeRegulators:L1/dimension-formulas`, `KatoEulerSystems:L4`.
**Check.** The result includes p|N. For a general de Rham representation H_g can exceed H_f, so the Frobenius calculation is a required hypothesis check.

**Source locators.** [BT] Theorem 3.1 proof, final implication from (3.3), p. 6: This local comparison supplies a step suppressed before the use of reciprocity. [Kato] (14.10.4)–(14.10.5), Proposition 14.12, pp. 241–242: The central twist excludes crystalline eigenvalue 1 and fixes local dimensions.

## C.2: Central specialization of the Kato class

Apply imported derived control at the central character, keeping the degree-one and degree-two Tor terms until amplitude and H² vanishing remove them. Define the actual twist-specialized Kato class, prove the correctly signed class spans the global line assuming rational Kato equality, and show its p-localization is not finite.

**Stage prerequisites:** `AutomorphicGaloisRepresentations:R19.3`, `CMRankZeroConverse:C.0`, `CMRankZeroConverse:C.1`, `KatoEulerSystems:L2`, `KatoEulerSystems:L4`, `PadicHodgeRegulators:L1`, `SelmerIwasawaCohomology:L3`, `SelmerIwasawaCohomology:L4`.

### Control at the negative half-weight character

`CMRankZeroConverse:C.2/specialization-application` · comparison

Apply SI L3 rational specialization at 𝔮 to Kato’s actual Iwasawa complex. If H¹_f(ℚ,W)=0, then H²_Iw(M_f)_𝔮=0 and H¹_Iw(M_f)_𝔮/𝔮 ≅ H¹(Z[1/p],j_*T(h))[1/p]. The identification is the semilinear twist by h followed by finite-level evaluation.

**Hypotheses and conventions.** Kato’s complex, local extension convention and compatible induced local conditions agree with the SI complex; finite generation and rational amplitude ≤2 hold.

**Construction or proof.**

1. Import derived control, not an underived quotient assertion. In degree one retain 0→H¹_Iw/𝔮→H¹_finite→Tor₁^A(H²_Iw,E)→0 on the selected component.
2. In degree two retain the possible Tor₁(H³_Iw,E) until the amplitude theorem removes it. Then H²_Iw,𝔮/𝔮 ≅ H²_finite=0; finite generation and Nakayama give H²_Iw,𝔮=0. Its degree-one Tor term vanishes, yielding the stated isomorphism.
3. For p=2 pass to the appropriate rational Δ idempotent before the procyclic computation. The kernel is ev_h, never ev_{−h}.

**Prerequisites:** `CMRankZeroConverse:C.0/central-prime`, `CMRankZeroConverse:C.1/selmer-zero-h2`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/rational-specialization`, `SelmerIwasawaCohomology:L3`.
**Check.** This node specializes an imported control theorem; it owns no second generic control construction. A proof that discards H²[𝔮] before the degree-two calculation is rejected.

**Source locators.** [BT] Theorem 3.1 proof, (3.1)–(3.2) and q, p. 6: The localization statement is an application of the cohomological control interface. [Kato] §14.13, p. 242: The rational central specialization is the one used in the zeta argument.

### The specialized central Kato class

`CMRankZeroConverse:C.2/specialized-zeta` · construction · planet: **Central Beilinson–Kato class**

For γ∈M_f define centralZeta(f,λ,γ) in H¹(Z[1/p],j_*T(h))[1/p] as z_Kato(γ), followed by the supplied semilinear twist by h and finite-level evaluation. The definition uses the actual Kato zeta morphism and is independent of T after rationalization. It is E-linear in γ.

**Hypotheses and conventions.** Even k≥2; p any prime; Kato’s rational module structure and constructed zeta morphism are supplied independently of the converse.

**Construction or proof.**

1. Compose the existing Kato zeta morphism with the SI twist and specialization; introduce no substitute cohomology or formal zeta symbol.

**Prerequisites:** `CMRankZeroConverse:C.0/modular-normalization`, `CMRankZeroConverse:C.0/central-sign`, `CMRankZeroConverse:C.0/central-prime`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `SelmerIwasawaCohomology:L3/rational-specialization`.
**Check.** Linearity, lattice independence and the conjugation relation are preserved by composition.

**Consumers and API design.**

- BT Theorem 3.1 proof, p. 6: The basis and nonfinite-localization argument use this actual finite-level class.
- Kato Theorem 12.5(1): Its period/regulator formula computes the localization of this class.

**API.**

- `TauCeti.CMRankZeroConverse.centralZeta_linear` (structure): γ↦centralZeta(f,λ,γ) is E-linear.
- `TauCeti.CMRankZeroConverse.centralZeta_lattice_independent` (compatibility): Two stable lattices give the same class under the canonical rational cohomology identification.
- `TauCeti.CMRankZeroConverse.centralZeta_specialization` (compatibility): The class is the residue of z_Kato(γ) at 𝔮 under the control map when that map is an isomorphism.
- `TauCeti.CMRankZeroConverse.centralZeta_conjugation` (relation): centralZeta(cγ)=−(−1)^h centralZeta(γ), from z(cγ)=−σ_{−1}z(γ).
- `TauCeti.CMRankZeroConverse.centralZeta_eq_projection` (characterisation): For ε=centralSign(k), centralZeta(γ)=centralZeta(γ^ε); the opposite c-eigenspace maps to zero.

**Unit tests.**

- `TauCeti.CMRankZeroConverse.centralZeta_zero_test` (degenerate): centralZeta(0)=0; a nonzero-class theorem must require γ^ε≠0.
- `TauCeti.CMRankZeroConverse.centralZeta_wrong_weight_two_sign` (non-example): At k=2, a vector satisfying cγ=−γ specializes to zero, including at p=2 after rationalization.
- `TauCeti.CMRankZeroConverse.centralZeta_wrong_weight_four_sign` (non-example): At k=4, a vector satisfying cγ=γ specializes to zero; a correctly signed nonzero vector generates only after the main-conjecture and Selmer hypotheses are supplied.
- `TauCeti.CMRankZeroConverse.centralZeta_scale_test` (compatibility): centralZeta(aγ)=a centralZeta(γ), so scaling a correct-sign generator by a nonzero scalar does not change its span.

**Source locators.** [BT] Theorem 3.1 proof, (3.2), p. 6: Defines the finite-level image of the Beilinson–Kato class. [Kato] Theorem 12.5(1), pp. 221–222; §14.13, p. 242: Identifies the class and its twist-specialization map.

### The specialized Kato class is a basis

`CMRankZeroConverse:C.2/zeta-basis` · theorem · planet: **Specialized zeta basis**

Assume H¹_f(ℚ,W)=0 and the rational Kato equality char_A H²_Iw(M_f)=char_A(H¹_Iw(M_f)/Z(f)), with H¹_Iw free of rank one and H²_Iw torsion. If γ^{centralSign(k)}≠0, then centralZeta(f,λ,γ) is an E-basis of the global cohomology line.

**Hypotheses and conventions.** The characteristic equality is on the same full cyclotomic components and primitive/imprimitive convention as Kato’s complex. Z(f) is generated by the actual z_Kato(δ).

**Construction or proof.**

1. Control kills H²_Iw,𝔮, so its characteristic ideal is a unit at 𝔮. Localize the equality over the discrete valuation ring A_𝔮. The torsion quotient H¹_Iw/Z has length zero there, hence Z_𝔮=H¹_Iw,𝔮.
2. Use the Kato conjugation relation, ev_h(σ_{−1})=(−1)^h, and the one-dimensional c-eigenspaces. The wrong eigenspace dies in the selected component; any γ with nonzero ε projection generates Z_𝔮. Reduce modulo 𝔮 and apply the control isomorphism.

**Prerequisites:** `CMRankZeroConverse:C.2/specialization-application`, `CMRankZeroConverse:C.1/global-dimension`, `CMRankZeroConverse:C.2/specialized-zeta`, `CMRankZeroConverse:C.0/central-sign`, `CMRankZeroConverse:C.0/central-prime`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`.
**Check.** The theorem is conditional on the equality; one divisibility is insufficient. Choosing merely γ≠0 is insufficient.

**Source locators.** [BT] Theorem 2.6, p. 5; Theorem 3.1 proof, p. 6: Localizing the equality turns the correctly signed zeta class into a basis.

### The zeta basis fails the finite condition at p

`CMRankZeroConverse:C.2/nonfinite-localization` · theorem

With the hypotheses of zeta-basis, loc_p(centralZeta(f,λ,γ))∉H¹_f(ℚ_p,W).

**Hypotheses and conventions.** At every finite ℓ≠p the image of the global cohomology under consideration satisfies the finite condition; rational bad-prime comparisons have been made.

**Construction or proof.**

1. The basis class is nonzero. If its p-localization were finite, all its localizations would be finite and the global class would lie in H¹_f(ℚ,W)=0. At bad ℓ≠p use the central local weight bounds and the supplied unramified/finite comparison, not a claim that unrestricted global cohomology has automatic local conditions.

**Prerequisites:** `CMRankZeroConverse:C.2/zeta-basis`, `SelmerIwasawaCohomology:L4`, `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`.
**Check.** The contradiction uses the global class being nonzero, not injectivity of localization on arbitrary cohomology.

**Source locators.** [BT] Theorem 3.1 proof, (3.3), p. 6: The vanishing finite Selmer space excludes the nonzero basis class. [Kato] §14.8 and Proposition 14.12, pp. 238–242: Local extension and finite-condition comparisons retain the bad-prime conditions.

## C.3: The rational rank-zero newform converse

Use the actual Kato reciprocity formula, with f*, the critical period sign and the p-omitted Euler factor, to deduce central nonvanishing. State the non-CM result conditionally on rational Kato equality. Obtain the all-prime CM newform result from the separately owned CM equality; GAP-CM records its absent registered endpoint.

**Stage prerequisites:** `AutomorphicGaloisRepresentations:R19.4`, `CMRankZeroConverse:C.1`, `CMRankZeroConverse:C.2`, `KatoEulerSystems:L3`, `KatoEulerSystems:L4`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

### Reciprocity detects the central L-value

`CMRankZeroConverse:C.3/reciprocity-nonvanishing` · theorem

If loc_p(centralZeta(f,λ,γ)) is not in H¹_f(ℚ_p,W), then L(f,k/2)≠0.

**Hypotheses and conventions.** Even k≥2 and every p; use the actual arithmetic newform L-function and Kato’s coefficient/period embeddings.

**Construction or proof.**

1. The central H_g=H_f theorem makes exp*(loc_p centralZeta) nonzero. Apply the Kato L3 interpolation formula at r=h and the trivial finite character, after the semilinear twist by k−r=h.
2. The period projection is (2πi)^(h−1)L^{(p)}(f*,h)γ^{(−1)^(h−1)}. Nonzero regulator therefore forces the p-omitted value to be nonzero. Period comparison maps on the designated line are isomorphisms.
3. Use L^{(p)}(f*,s)=P_p(f*,p^(−s))L(f*,s), with every bad local factor retained. Nonvanishing of this product implies L(f*,h)≠0. Then L(f*,h)=overline{L(f,h)} under the chosen complex embedding. No division by a possibly zero Euler factor is needed for this implication.

**Prerequisites:** `CMRankZeroConverse:C.2/specialized-zeta`, `CMRankZeroConverse:C.1/central-hg-equals-hf`, `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.
**Check.** The critical value lies in the range 1≤h≤k−1. An unrestricted assertion ker exp*=H_f is not used.

**Source locators.** [BT] Theorem 3.1 proof after (3.3), p. 6: The final nonvanishing implication uses explicit reciprocity. [Kato] Theorem 12.5(1), pp. 221–222; (14.10.1)–(14.10.5), pp. 240–241: Specifies f*, periods, twists and local factors.

### Rank-zero converse from the rational Kato equality

`CMRankZeroConverse:C.3/conditional-converse` · theorem · planet: **Conditional rank-zero converse**

For any normalized newform f of even weight k≥2, any p and λ|p, the rational Kato equality on its actual cohomology, together with its independently supplied rank-one/torsion module structure, implies H¹_f(ℚ,M_f(k/2))=0 ⇒ L(f,k/2)≠0.

**Hypotheses and conventions.** The equality and all module/local-condition conventions are exactly those of zeta-basis. No CM hypothesis is imposed here.

**Construction or proof.**

1. Combine zeta-basis, nonfinite-localization and reciprocity-nonvanishing. The argument is independent of CM once the specified equality and module structure are supplied.

**Prerequisites:** `CMRankZeroConverse:C.2/zeta-basis`, `CMRankZeroConverse:C.2/nonfinite-localization`, `CMRankZeroConverse:C.3/reciprocity-nonvanishing`.
**Check.** This is BT Remark 3.2 as a conditional theorem. It does not supply a main conjecture for a non-CM form.

**Source locators.** [BT] Remark 3.2, p. 6: The rank-zero argument applies whenever Kato’s main conjecture is known.

### All-prime CM newform rank-zero converse

`CMRankZeroConverse:C.3/cm-newform-converse` · theorem · planet: **CM newform p-converse**

For a normalized CM newform f of even weight k≥2, every prime p and every λ|p, H¹_f(ℚ,M_f(k/2))=0 implies L(f,k/2)≠0, equivalently the finite analytic order at k/2 is zero.

**Hypotheses and conventions.** The CMAllPrimeMainConjectures supplier must provide BT Theorem 2.6 with independent early CM module structure and the exact Kato normalization. That supplier has no registered stage or node at the checked snapshot; GAP-CM is explicit.

**Construction or proof.**

1. Import the all-prime rational cohomological CM equality and the independent weak-Leopoldt/rank-one structure from their sole owner, then apply conditional-converse. The elliptic-unit, conductor Euler-factor and exceptional cyclotomic-field cases remain the supplier’s proof, not a proof node here.

**Prerequisites:** `CMRankZeroConverse:C.3/conditional-converse`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`.
**Check.** The theorem includes p=2, p|N, inert and ramified primes. It asserts no integral characteristic ideal or BSD valuation.

**Source locators.** [BT] Theorem 2.6, p. 5; Theorem 3.1, pp. 5–6: The all-prime CM main conjecture supplies the hypothesis of the conditional argument.

## C.4: CM elliptic curves and quadratic descent

Use completed coefficients, CM idempotents, weight-two theta induction and finite-condition Shapiro to prove CM Selmer vanishing implies modular Selmer vanishing for E/K with arbitrary CM order. Deduce BT Theorem 1.1 over K for every p. Prove rational corank and analytic-order doubling for E/ℚ, retaining dyadic integral errors before rationalization, and deduce pConverse(E,p,0).

**Stage prerequisites:** `ArithmeticGaloisDuality:D7`, `CMRankZeroConverse:C.0`, `CMRankZeroConverse:C.3`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `RankZeroOneBSD:BSD.0`, `RankZeroOneBSD:BSD.1`, `SelmerIwasawaCohomology:L4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

### Typed CM Selmer and modular comparison

`CMRankZeroConverse:C.4/cm-selmer-comparison` · comparison

Let K be imaginary quadratic and E/K have CM by any order O⊂K. Choose a finite extension L/ℚ_p containing both embeddings of K and the theta-form coefficient fields. Write V_pE⊗L=η⊕η̄ via the two CM coefficient idempotents, with η̄=η^∨(1) from the Weil pairing. For the weight-two theta forms f_η and f_{η̄}, M_{f_η}⊗L≅Ind_{G_K}^{G_ℚ}η^∨, so M_{f_η}(1)⊗L≅Ind η̄, and conversely for f_{η̄}. Kummer, coefficient extension and finite-condition Shapiro give H¹_f(K,V_pE)⊗L≅H¹_f(ℚ,M_{f_η}(1)⊗L)⊕H¹_f(ℚ,M_{f_{η̄}}(1)⊗L), up to the indicated order of the two summands. Consequently corank Sel_{p∞}(E/K)=0 implies both modular finite Selmer spaces vanish.

**Hypotheses and conventions.** All endomorphisms are defined over K; coefficients are completed p-adic fields, not K used as a scalar extension of a ℤ_p module. There is no integral rank-one freeness at conductor primes.

**Construction or proof.**

1. Use SI’s exact Kummer/Bloch–Kato comparison: H¹_f(K,V_pE)=(lim_m Sel_{p^m},[p])[1/p], zero iff the p∞ corank is zero. This is a Tate-module comparison, not an unidentified isomorphism with the Pontryagin dual.
2. Use CM.4’s actual Hecke character and rational coefficient decomposition. Apply the requested theta/induction extension of CM.4; its current cm-induction-comparison node only treats E/ℚ and does not suffice for a twist over K which does not descend.
3. Apply compact Shapiro, its local Mackey decomposition and the supplied finite-condition compatibility at every place, including places over p. Extend to L and use faithful coefficient extension to reflect vanishing.

**Prerequisites:** `SelmerIwasawaCohomology:L4/elliptic-finite-kummer`, `SelmerIwasawaCohomology:L4`, `ComplexMultiplicationAndExplicitReciprocity:CM.4/cm-hecke-character`, `ComplexMultiplicationAndExplicitReciprocity:CM.4/tate-coefficient-components`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `ArithmeticGaloisDuality:D7/compact-shapiro-projection`, `CMRankZeroConverse:C.0/modular-normalization`.
**Check.** Check p=2,K=ℚ(i), including the order of conductor 2; check ramified p=3,K=ℚ(ζ₃). The comparison requires neither descent to ℚ nor maximal CM order.

**Source locators.** [BT] Proof of Theorem 1.1, p. 6: The needed vanishing implication is reconstructed with the suppressed duals, completions and twist restored.

### CM elliptic rank-zero converse over K

`CMRankZeroConverse:C.4/cm-elliptic-k` · theorem · planet: **CM elliptic p-converse over K**

For E/K with K imaginary quadratic and End_K(E) an order of K, and for any prime p, corank_{ℤ_p}Sel_{p∞}(E/K)=0 implies L(E/K,1)≠0. The analytic order at 1 of the actual full arithmetic L-function is therefore zero.

**Hypotheses and conventions.** The modular theta comparisons and the all-prime CM equality are supplied as recorded.

**Construction or proof.**

1. Apply cm-selmer-comparison to get vanishing for the two weight-two forms. Apply cm-newform-converse to each at every coefficient place. Use CM.4’s full factorization L(E/K,s)=L(f_η,s)L(f_{η̄},s), including bad primes and its analytic continuation, to conclude nonvanishing.

**Prerequisites:** `CMRankZeroConverse:C.4/cm-selmer-comparison`, `CMRankZeroConverse:C.3/cm-newform-converse`, `ComplexMultiplicationAndExplicitReciprocity:CM.4/full-elliptic-l-factorization`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.
**Check.** The conclusion concerns all primes p, not only those prime to #O_K× or to the order index. No finiteness of all of Sha or leading-term valuation is inferred here.

**Source locators.** [BT] Theorem 1.1, p. 1; its proof, p. 6: The newform converse and CM factorization yield the elliptic statement.

### CM Selmer corank doubles over the CM field

`CMRankZeroConverse:C.4/cm-corank-double` · theorem

If E/ℚ has CM by an order of K, then for every p, corank Sel_{p∞}(E/K)=2·corank Sel_{p∞}(E/ℚ).

**Hypotheses and conventions.** K is its imaginary quadratic CM field; E_K denotes base change.

**Construction or proof.**

1. Use the parent odd-primary Selmer decomposition when p≠2, and its two-primary restriction/corestriction maps when p=2. After rationalizing duals they identify the K-corank with the sum of the coranks for E and E^{χ_K} over ℚ.
2. Use CM.1’s rational self-twist isogeny E→E^{χ_K}, then the imported ELL7 isogeny-corank comparison to identify the two summands. The rational projectors (1±σ)/2 are permitted over ℚ_2; they assert no integral splitting.

**Prerequisites:** `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `ComplexMultiplicationAndExplicitReciprocity:CM.1/rational-cm-self-twist`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `RankZeroOneBSD:BSD.1/two-primary-comparison`.
**Check.** At p=2 retain the finite kernels and cokernels killed by 2 before rationalization. The self-twist is an isogeny, not generally an isomorphism.

**Source locators.** [BT] Proof of Theorem 1.1, last paragraph, p. 6: The corank doubling transfers rank-zero information from ℚ to K.

### CM analytic order doubles over the CM field

`CMRankZeroConverse:C.4/cm-order-double` · theorem

If E/ℚ has CM by an order of K, then ord_{s=1} L(E/K,s)=2·analyticRank(E/ℚ).

**Hypotheses and conventions.** Use the unique analytic continuations of the actual arithmetic Euler products.

**Construction or proof.**

1. Use the self-twist isogeny and equality of all Euler factors of isogenous curves to identify L(E^{χ_K},s)=L(E,s). Apply the parent quadratic base-change factorization and order-additivity theorem. Thus the entire base-change L-function is the square of L(E,s), independent of the rank.

**Prerequisites:** `ComplexMultiplicationAndExplicitReciprocity:CM.1/rational-cm-self-twist`, `RankZeroOneBSD:BSD.0/base-change-factorization`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.
**Check.** No rank≤1 hypothesis is used; the parent defect-isogeny-invariance theorem, which assumes rank≤1, cannot replace equality of actual Euler factors.

**Source locators.** [BT] Proof of Theorem 1.1, last paragraph, p. 6: The analytic doubling is the second descent identity.

### CM elliptic rank-zero converse over ℚ

`CMRankZeroConverse:C.4/cm-elliptic-q` · theorem · planet: **CM elliptic p-converse over ℚ**

Every CM elliptic curve E/ℚ satisfies pConverse(E,p,0) for every prime p.

**Hypotheses and conventions.** E is elliptic and has CM by an arbitrary imaginary quadratic order.

**Construction or proof.**

1. Corank zero over ℚ gives corank zero over K by cm-corank-double. Apply cm-elliptic-k, then cm-order-double and the parent analytic-rank equivalence.

**Prerequisites:** `CMRankZeroConverse:C.0/p-converse-property`, `CMRankZeroConverse:C.4/cm-corank-double`, `CMRankZeroConverse:C.4/cm-order-double`, `CMRankZeroConverse:C.4/cm-elliptic-k`.
**Check.** The theorem specializes to p=2 and K=ℚ(i), and to ramified p=3 and K=ℚ(ζ₃). It does not assert pConverse(E,p,r) for arbitrary r.

**Source locators.** [BT] Theorem 1.1 and equation (1.1), p. 1; proof p. 6: The descended statement is precisely the rank-zero instance of the shared proposition.

## C.5: Congruent-number twists and even Goldfeld

Define the even Goldfeld proposition using both-sign fundamental discriminants ordered by absolute value. Combine the unconditional Smith positive-family corank input (GAP-SMITH pending registration) with the CM 2-converse to obtain density one in positive squarefree residues 1,2,3 mod 8. Use the sign obstruction for an exact half-density among positive squarefree parameters and prove its piecewise-height transfer to fundamental discriminants.

**Stage prerequisites:** `ArithmeticStatistics:ST.0`, `ArithmeticStatistics:ST.5`, `CMRankZeroConverse:C.4`, `RankZeroOneBSD:BSD.0`.

### The even parity Goldfeld proposition

`CMRankZeroConverse:C.5/even-goldfeld` · definition · planet: **Even parity Goldfeld conjecture**

For an elliptic curve E/ℚ, EvenGoldfeld(E) asserts that the proportion of fundamental discriminants d with 0<|d|≤X and L(E^{(d)},1)≠0 tends to 1/2 as X→∞. Count both signs, once each and without stabilizer weights. The trivial quadratic character, represented by d=1 when included by the arithmetic convention, changes only a finite set.

**Hypotheses and conventions.** Use ST.0’s arithmetic family, counting and relative density, and the parent actual quadratic twists and L-functions.

**Construction or proof.**

1. Restrict the existing absolute-discriminant family to the analytic-rank-zero subset and use relative density 1/2. Introduce no new density or fundamental-discriminant carrier.

**Prerequisites:** `RankZeroOneBSD:BSD.0/analytic-rank`, `ArithmeticStatistics:ST.0/relative-density`, `ArithmeticStatistics:ST.0`.
**Check.** Positive squarefree parameters are a different height presentation; converting to this proposition requires the comparison theorem below.

**Consumers and API design.**

- BT Theorem 1.2, p. 2: Identifies the exact Goldfeld proposition obtained from its squarefree statement.
- C.5/fundamental-discriminant-goldfeld: Provides the endpoint after sign and height comparison.

**API.**

- `TauCeti.CMRankZeroConverse.evenGoldfeld_iff_count` (characterisation): EvenGoldfeld(E) iff the stated quotient of unweighted counts converges to 1/2.
- `TauCeti.CMRankZeroConverse.evenGoldfeld_iff_rank_zero` (compatibility): The nonzero-value subset equals the subset of twists with analyticRank=0.
- `TauCeti.CMRankZeroConverse.evenGoldfeld_finite_change` (functoriality): Changing finitely many parameters or finite-family conventions preserves the proposition.
- `TauCeti.CMRankZeroConverse.evenGoldfeld_isomorphic` (compatibility): If E and E′ have identical twist L-functions then EvenGoldfeld(E) iff EvenGoldfeld(E′).

**Unit tests.**

- `TauCeti.CMRankZeroConverse.evenGoldfeld_all_zero_test` (non-example): If every twist has analytic rank zero, the limiting proportion is 1, so EvenGoldfeld is false.
- `TauCeti.CMRankZeroConverse.evenGoldfeld_no_zero_test` (degenerate): If no twist has analytic rank zero, the limiting proportion is 0, so EvenGoldfeld is false.
- `TauCeti.CMRankZeroConverse.evenGoldfeld_height_test` (compatibility): The positive squarefree classes n=1,2,3 correspond to discriminants of magnitudes (1,4), (8,8), (12,3) for the two signs. Weighting them all by n is not the definition.
- `TauCeti.CMRankZeroConverse.evenGoldfeld_lower_bound_test` (non-example): A liminf bound ≥1/2 alone does not prove EvenGoldfeld; a family with proportion 3/4 satisfies that bound but fails the proposition.

**Source locators.** [BT] §1.0.2 and footnote 1, p. 2: Defines the even half of the fundamental-discriminant formulation, with both signs.

### Nonvanishing in the positive even-parity family

`CMRankZeroConverse:C.5/congruent-even-nonvanishing` · theorem · planet: **Congruent-number even nonvanishing**

Let E:y²=x³−x and S(X)={n∈ℕ:0<n≤X, n squarefree, n≡1,2,3 mod 8}. Then #{n∈S(X):L(E^{(n)}/ℚ,1)≠0}/#S(X)→1.

**Hypotheses and conventions.** Import the unconditional Smith corank-zero theorem for this positive parity subfamily from ArithmeticStatisticsPartIISmithMethod. ST.5 currently has only a conditional deduction from the Smith law; GAP-SMITH records the missing registered endpoint.

**Construction or proof.**

1. Apply the all-prime CM elliptic converse at p=2 to every twist in the density-one corank-zero subset. The twist remains CM by ℤ[i]. Inclusion of this subset in the analytic-rank-zero set and the upper bound 1 squeeze its relative density to 1.

**Prerequisites:** `CMRankZeroConverse:C.4/cm-elliptic-q`, `ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law`, `ArithmeticStatistics:ST.0/positive-squarefree-family-over-q`, `ArithmeticStatistics:ST.0/relative-density`.
**Check.** The input is 2∞ Selmer corank, not dim Sel_2; the positive restriction is explicit.

**Source locators.** [BT] Theorems 3.3 and 1.2 and proof of Theorem 1.2, pp. 2, 6: Smith’s relative-density-one corank theorem combines with the rank-zero 2-converse.

### Exactly half of positive squarefree twists have rank zero

`CMRankZeroConverse:C.5/congruent-half-density` · theorem

For E:y²=x³−x and P(X)={0<n≤X:n squarefree}, #{n∈P(X):L(E^{(n)},1)≠0}/#P(X)→1/2.

**Hypotheses and conventions.** Use the root-number computation for positive squarefree n and the functional-equation parity theorem.

**Construction or proof.**

1. By the parent root-number calculation, every positive squarefree twist outside residues 1,2,3 mod 8 has sign −1 and vanishes at 1. Thus the zero-rank set is contained in S. Apply the ST.0 density-one-to-half comparison to congruent-even-nonvanishing.

**Prerequisites:** `CMRankZeroConverse:C.5/congruent-even-nonvanishing`, `RankZeroOneBSD:BSD.0/congruent-number-root-numbers`, `RankZeroOneBSD:BSD.0/root-number-parity`, `ArithmeticStatistics:ST.0/density-one-in-the-even-parity-classes-is-half-of-all-squarefree`.
**Check.** This is an exact limiting density. The complementary twists have odd positive analytic rank; no assertion that it is one is made.

**Source locators.** [BT] Abstract, p. 1; Theorem 1.2 and footnote 2, p. 2: The half-density conclusion includes a root-number upper bound, not just a density-one lower bound.

### Goldfeld for the congruent-number curve

`CMRankZeroConverse:C.5/fundamental-discriminant-goldfeld` · theorem · planet: **Goldfeld for the congruent-number curve**

For E:y²=x³−x, EvenGoldfeld(E) holds for fundamental discriminants of both signs ordered by |d|.

**Hypotheses and conventions.** For a positive squarefree n write d_+(n) for the fundamental discriminant of ℚ(√n) and d_−(n) for that of ℚ(√−n), with the trivial class handled finitely.

**Construction or proof.**

1. Use E^{(−n)}≅E^{(n)} and identify the character twist for d with the twist by its signed squarefree part. By ST.0’s squarefree residue counts the six residues 1,2,3,5,6,7 mod 8 each have count X/π²+o(X).
2. For odd n the two |d| cutoffs use multipliers 1 and 4; for even squarefree n both use 4. Summing inverse multipliers, the root-number-positive residues 1,2,3 have weight 5/4+1/2+5/4=3, and all residues have weight 6.
3. Restrict density one to each positive-density residue class, apply ST.0’s piecewise rescaling theorem, and use the root-number upper bound. The resulting zero-rank proportion for the discriminant ordering is exactly 3/6.

**Prerequisites:** `CMRankZeroConverse:C.5/even-goldfeld`, `CMRankZeroConverse:C.5/congruent-even-nonvanishing`, `CMRankZeroConverse:C.5/congruent-half-density`, `RankZeroOneBSD:BSD.0/congruent-number-root-numbers`, `ArithmeticStatistics:ST.0/isomorphism-multiplicity-of-the-twist-family`, `ArithmeticStatistics:ST.0/squarefree-integers-in-residue-classes`, `ArithmeticStatistics:ST.0/piecewise-rescaling-of-a-height`, `ArithmeticStatistics:ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density`.
**Check.** A bound only for positive fundamental discriminants does not match the proposition. Check n=2 gives d=±8 and n=3 gives d=12,−3.

**Source locators.** [BT] §1.0.2 and Theorem 1.2, p. 2: The two formulations need an explicit comparison of parameters and heights.

## C.6: CM twists, cube sums and non-descent

Combine the imported BKLOS corank-zero lower bound and the all-prime CM 3-converse for imaginary quadratic K where 3 is split or ramified, using the precise unweighted odd-valuation support height. Define and check the cube-sum Weierstrass model for each n≠0 and its j=0 CM action. Prove descending parameters lie in at most two rational-squareclass cosets, their O(√X) count and density zero, then retain lower nonvanishing proportion at least 1/2 among non-descending twists.

**Stage prerequisites:** `ArithmeticStatistics:ST.0`, `ArithmeticStatistics:ST.5`, `CMRankZeroConverse:C.4`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

### At least half of the CM twists over K are nonvanishing

`CMRankZeroConverse:C.6/cm-twist-nonvanishing` · theorem · planet: **CM twist nonvanishing**

Let K be imaginary quadratic, 3 split or ramified in K, and E/K have CM by an arbitrary order of K. For H(t)=∏_{v_𝔭(t) odd}N𝔭 on K×/K×², counted once per squareclass, liminf_{X→∞} #{t:H(t)<X,L(E^{(t)}/K,1)≠0}/#{t:H(t)<X}≥1/2.

**Hypotheses and conventions.** Use the unweighted squareclass height of ST.0. The 3∞ corank input is ST.5’s CM theorem, not merely a Mordell–Weil rank bound.

**Construction or proof.**

1. Import ST.5/cm-twists-have-corank-zero-at-least-half. Its maximal-order proof uses a norm-3 ideal isogeny with Selmer ratio one; the passage to nonmaximal orders uses the imported ELL7 isogeny-corank comparison. It includes the ramified case.
2. Apply cm-elliptic-k at p=3 to the corank-zero subset. Monotonicity of counts gives the same lower bound for the nonzero-value subset.

**Prerequisites:** `CMRankZeroConverse:C.4/cm-elliptic-k`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half`, `ArithmeticStatistics:ST.0/squareclass-height`, `ArithmeticStatistics:ST.0/finiteness-of-squareclasses-of-bounded-height`.
**Check.** No exact limiting proportion is asserted. An inert 3 fails the hypothesis; ramified 3 does not. H=1 can contain several classes.

**Source locators.** [BT] Proposition 1.3, p. 2; Theorem 3.5 and proof, p. 7: The corank input combines with the rank-zero 3-converse. [BKLOS] Theorem 2.7, p. 5; §9.2, p. 14; §11, pp. 18–19: The proof yields the Selmer-strength statement used by ST.5, after the maximal-order reduction.

### The cube-sum Weierstrass model

`CMRankZeroConverse:C.6/cube-sum-model` · definition · planet: **Cube-sum elliptic curve**

For n∈ℤ define cubeSumModel(n) to be the existing WeierstrassCurve over ℚ with coefficients (a₁,a₂,a₃,a₄,a₆)=(0,0,0,0,−27n²), so Y²=X³−27n². The definition is total, but its elliptic applications require n≠0. This is a model for the smooth projective completion of x³+y³=2n with origin [1:−1:0].

**Hypotheses and conventions.** Characteristic zero. The projective cubic and its origin belong to the existing elliptic-curve model comparison interface.

**Construction or proof.**

1. Give the five coefficients on Mathlib’s WeierstrassCurve carrier. For n≠0 use the projective linear map [x:y:z]↦[6nz:9n(x−y):x+y], with inverse [X:Y:Z]↦[9nZ+Y:9nZ−Y:3X]. Their composites are the scalar 18n. If F=x³+y³−2nz³ and G=Y²Z−X³+27n²Z³, substitution gives G(forward)=108n²F and F(inverse)=54nG, verifying the claimed projective cubic equation. On the chart x+y≠0 this is X=6n/(x+y), Y=9n(x−y)/(x+y).

**Prerequisites:** `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.map`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.
**Check.** The chosen scale gives −27n² rather than −432n²; both are isomorphic by X↦4X,Y↦8Y in the conventional model.

**Consumers and API design.**

- BT Remark 3.6(i), p. 7: Verifies that each fixed nonzero n supplies an elliptic curve to Proposition 1.3.
- C.6/cube-sum-cm: The j=0 model makes the CM action and ramified prime visible.

**API.**

- `TauCeti.CMRankZeroConverse.cubeSumModel_coefficients` (simp): a₁=a₂=a₃=a₄=0 and a₆=−27n².
- `TauCeti.CMRankZeroConverse.cubeSumModel_discriminant` (simp): Δ(cubeSumModel(n))=−2⁴·3⁹·n⁴.
- `TauCeti.CMRankZeroConverse.cubeSumModel_isElliptic_iff` (characterisation): cubeSumModel(n) is elliptic over ℚ iff n≠0.
- `TauCeti.CMRankZeroConverse.cubeSumModel_neg` (simp): cubeSumModel(−n)=cubeSumModel(n).
- `TauCeti.CMRankZeroConverse.cubeSumModel_j` (compatibility): For n≠0 the Mathlib j-invariant is 0.
- `TauCeti.CMRankZeroConverse.cubeSumModel_cubic_iso` (equivalence): For n≠0 the displayed projective linear maps give a pointed isomorphism from x³+y³=2n, carrying [1:−1:0] to the Weierstrass origin.
- `TauCeti.CMRankZeroConverse.cubeSumModel_map` (functoriality): Base change along ℚ→F is the existing WeierstrassCurve.map applied to these five coefficients; the displayed maps commute with this change of coefficients.

**Unit tests.**

- `TauCeti.CMRankZeroConverse.cubeSumModel_one` (computation): At n=1, a₆=−27, Δ=−314928 and the affine cubic point (1,1) maps to (3,0).
- `TauCeti.CMRankZeroConverse.cubeSumModel_zero` (degenerate): At n=0 the discriminant is zero and the curve is not elliptic; there is no cubic elliptic-isomorphism assertion.
- `TauCeti.CMRankZeroConverse.cubeSumModel_negative` (compatibility): At n=−1 the same Weierstrass model occurs, and (−1,−1) maps to (3,0).
- `TauCeti.CMRankZeroConverse.cubeSumModel_three` (computation): At n=3 the coefficient is −243 and the discriminant is −314928·81, distinguishing n² in a₆ from n or n³.

**Source locators.** [BT] Remark 3.6(i), p. 7: The cube-sum family is an application; these explicit model formulas verify its hypotheses.

### CM and ramified 3 for the cube-sum family

`CMRankZeroConverse:C.6/cube-sum-cm` · theorem

For n≠0, cubeSumModel(n) over K=ℚ(ζ₃) is elliptic with CM by ℤ[ζ₃], and 3 is ramified in K. Its quadratic twists over K satisfy the lower bound of cm-twist-nonvanishing.

**Hypotheses and conventions.** n is fixed; twist parameters are t∈K×/K×² with the stated H height.

**Construction or proof.**

1. Use the discriminant and projective model comparison. The automorphism (X,Y)↦(ζ₃X,Y) fixes the origin, satisfies 1+ζ₃+ζ₃²=0 in the endomorphism ring and gives the full CM ring ℤ[ζ₃] (already maximal). Use disc K=−3 and (3)=𝔭², then apply cm-twist-nonvanishing.

**Prerequisites:** `CMRankZeroConverse:C.6/cube-sum-model`, `CMRankZeroConverse:C.6/cm-twist-nonvanishing`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.
**Check.** The statement concerns twists of each fixed cube-sum curve over K. It gives no density theorem in the integer parameter n and no positive proportion of rational cube sums.

**Source locators.** [BT] Remark 3.6(i), p. 7: The family has the CM field where 3 is ramified.

### Parameters of twists descending to ℚ

`CMRankZeroConverse:C.6/descending-twist-cosets` · theorem

For any elliptic E/K over an imaginary quadratic K=ℚ(√D), let D_E={t∈K×/K×²:E^{(t)} is K-isomorphic to the base change of an elliptic curve over ℚ}. If nonempty, D_E is contained in a union of at most two cosets of the image of ℚ×/ℚ×². If j(E)≠1728 one coset suffices; for j=1728 representatives can be chosen t₀ and t₀√D for any one descending parameter t₀.

**Hypotheses and conventions.** Descending means descent as a pointed elliptic curve; neither descent of a chosen equation nor of its CM action is required.

**Construction or proof.**

1. Choose one descending twist E₀/ℚ and compare all others to its base change. For j≠0,1728, use the existing quadratic twist classification and the fact that two ℚ-curves of this j are rational quadratic twists.
2. For j=0 use models Y²=X³+B with B∈ℚ×. If B·u³/B′ is a sixth power in K, then [u]³ is trivial in K×/(ℚ×K×²); this quotient has exponent 2, so [u] is trivial. Thus all parameters lie in one coset.
3. For j=1728 use Y²=X³+AX with A∈ℚ×. Isomorphism requires u²∈ℚ×K×⁴. Hence u/v² has square in ℚ, and is rational or rational times √D. This gives the two cosets. If there is no descending twist the set is empty.

**Prerequisites:** `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, `ArithmeticStatistics:ST.0/quadratic-twist-squareclass-family`, `ArithmeticStatistics:ST.0/isomorphism-multiplicity-of-the-twist-family`.
**Check.** Treat the exceptional automorphism cases explicitly. No assertion that E itself descends is needed, and j=1728 is not treated as an injective twist parametrization.

**Source locators.** [BT] Remark 3.6(ii), p. 7: The non-descent consequence requires a parameter count; this algebraic reduction supplies its first step.

### Descending twists have height density zero

`CMRankZeroConverse:C.6/descending-twists-thin` · theorem

For fixed E/K with K imaginary quadratic, # {t∈D_E:H(t)<X}=O_{E,K}(√X). As # {t∈K×/K×²:H(t)<X}∼c_K X with c_K>0, descending twists have H-density zero.

**Hypotheses and conventions.** Use the exact odd-valuation support height, not the norm of a chosen representative or the relative discriminant height. The total squareclass asymptotic is requested from ST.0.

**Construction or proof.**

1. For a fixed coset a·im(ℚ×/ℚ×²), represent the rational part by signed squarefree integers n. Outside the finitely many primes dividing disc K and the odd support of a, a rational prime dividing n contributes ℓ² to H_K([n]), whether split or inert. Ramified rational primes contribute only a fixed finite ambiguity, and multiplication by a changes height by bounded factors from its fixed support.
2. Thus H_K(a[n]) is bounded below by a positive constant times n_outside²; there are O(√X) rational squarefree parameters, even allowing the finite ambiguity and duplicate images. Apply descending-twist-cosets.
3. Divide by the ST.0 positive linear asymptotic. Its proof uses finite support-ideal fibers and squarefree ideal counts in the square ideal-class subgroup, not an assumption that every squarefree ideal is principal.

**Prerequisites:** `CMRankZeroConverse:C.6/descending-twist-cosets`, `ArithmeticStatistics:ST.0/squareclass-height`, `ArithmeticStatistics:ST.0/squareclass-height-fibres-are-selmer-cosets`, `ArithmeticStatistics:ST.0`.
**Check.** For a rational prime unramified in K, height is ℓ², not ℓ. The finite kernel of the rational squareclass map cannot enlarge this upper bound.

**Source locators.** [BT] Remark 3.6(ii), p. 7: A zero-density count makes the asserted non-descent proportion quantitative. [BKLOS] §2, p. 2 (author version): Its support height is the ordering used in this count.

### Non-descending twists with analytic rank zero

`CMRankZeroConverse:C.6/nondescent-density` · theorem · planet: **Non-descending nonvanishing twists**

Under the hypotheses of cm-twist-nonvanishing, liminf_{X→∞} #{t:H(t)<X,E^{(t)} does not descend to ℚ,L(E^{(t)}/K,1)≠0}/#{t:H(t)<X}≥1/2. The same lower bound holds with the denominator restricted to non-descending twists.

**Hypotheses and conventions.** Each squareclass is counted once; the denominator is eventually nonzero and tends to infinity.

**Construction or proof.**

1. Subtract the O(√X) descending set from the numerator supplied by cm-twist-nonvanishing and divide by the linear total count. The removed ratio tends to zero, and the restricted denominator has ratio tending to 1.

**Prerequisites:** `CMRankZeroConverse:C.6/cm-twist-nonvanishing`, `CMRankZeroConverse:C.6/descending-twists-thin`, `ArithmeticStatistics:ST.0/relative-density`.
**Check.** This strengthens “positive proportion” only to a lower bound ≥1/2, not to an exact density. It does not count different presentations of the same curve with new weights.

**Source locators.** [BT] Remark 3.6(ii), p. 7: The nonvanishing proposition still supplies a positive proportion after removing the thin descending family.

## Worked comparisons and acceptance matrix

The finite local-condition implication must pass through the Tate dual. For W′ the rational Poitou–Tate sequence maps global H¹ into the one-dimensional local quotient with cokernel controlled by H¹_f(ℚ,W)^∨=0. Local H² vanishes. Exactness first kills global H²(W′), Euler–Poincaré then makes H¹(W′) one-dimensional, and the finite Selmer kernel H¹_f(W′) is zero. Apply the sequence to W to obtain its global H² vanishing. This order of deductions prevents a hidden self-duality assumption for a newform with nontrivial character.

In derived control, H¹_Iw/𝔮 does not initially equal finite-level H¹: its cokernel is Tor₁(H²_Iw,E). The degree-two comparison can also contain Tor₁(H³_Iw,E); rational amplitude removes that term. Finite-level H²=0, finite generation and Nakayama then kill the localized H²_Iw. Only at this point does the degree-one Tor group disappear. Equality of characteristic ideals, rather than one divisibility, then shows the zeta lattice is the full localized global line.

For the congruent-number ordering comparison, each positive squarefree residue 1,2,3,5,6,7 modulo 8 contributes X/π²+o(X). Odd n yields absolute discriminant multipliers 1 and 4, giving combined reciprocal weight 5/4; even squarefree n yields 4 and 4, giving weight 1/2. The three positive-root-number residues contribute 5/4+1/2+5/4=3 and all six contribute 6. The density-one exceptional set remains negligible after restriction to each residue and rescaling X. This proves the fundamental-discriminant half-density without claiming the odd-parity rank-one half.

For n≠0 the cube-sum projective maps have composites equal to multiplication of all coordinates by 18n. They carry the cubic equation to the Weierstrass equation and take the chosen point [1:−1:0] to [0:1:0]. Thus no assertion about extending a merely birational affine map is needed. The numerical coefficient −27n² and discriminant −314928n⁴ fix the scale; the conventional model with −432n² is obtained by multiplying X by 4 and Y by 8.

For non-descent, counting rational parameters in K gives a squared norm contribution: a rational prime ℓ unramified in K contributes ℓ², whether it splits or stays inert. This explains O(√X), rather than an O(X) bound. The fixed ramified primes and the support of a fixed translating class contribute bounded factors. If E has j=1728, the extra possible coset involving √D must be included. The total linear count comes from the requested ST.0 ideal-class argument, not from assuming a principal ideal domain.

| Check | Required outcome |
| --- | --- |
| k=2 versus k=4 | Correct surviving signs +1 and −1; the opposite sign specializes to zero. |
| p=2, K=ℚ(i) | Both integral real-place errors and the finite cyclotomic sign survive until rationalization. |
| p=3, K=ℚ(ζ₃) | Ramified 3 is admitted by the converse and the twist theorem. |
| Order of conductor 2 in ℚ(i), p=2 | Rational CM decomposition is permitted; integral rank-one freeness at the order index is not assumed. |
| Nonmaximal CM order in the twist theorem | Reduction uses a K-isogeny and p∞ corank invariance; finite Sel₃ dimensions are not transported. |
| Finite Sel₂ contains rational 2-torsion | Its dimension can be positive when p∞ corank is zero. |
| n=0 cube-sum model | Discriminant zero and failure of ellipticity. |
| BKLOS lower bound | liminf≥1/2; no exact density follows without an upper bound. |
| Congruent-number positive family | Exact half-density follows from density one plus the root-number upper bound. |
| Cube-sum parameter | n is fixed; the statistical variable is the quadratic-twist squareclass over K. |

## Supplier requests and outstanding interfaces

These are packet-level requests, not messages sent to other workers. Each identifies an existing owner and the exact extra output needed. The two absent owners are recorded separately as gaps because there is no truthful stage identifier to use.

### R1: `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`

Actual arithmetic newform L(f,s), its entire continuation and finite central analytic order for normalized cuspidal newforms of every even weight k≥2; coefficient conjugation gives L(f*,h)=overline{L(f,h)}. Supply the p-omitted identity L^{(p)}(f*,s)=P_p(f*,p^(−s))L(f*,s), using the correct local factor at p|N, and compatibility of theta-form L-functions with Hecke-character L-functions.

Consumers: `CMRankZeroConverse:C.3/reciprocity-nonvanishing`, `CMRankZeroConverse:C.3/cm-newform-converse`, `CMRankZeroConverse:C.4/cm-elliptic-k`.

### R2: `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

For every number field F, isogeny φ:E→E′ and prime p, maps on classical Kummer Sel_{p∞} preserve all local images. Their composites with the dual-isogeny maps are multiplication by deg φ. Their finite kernels/cokernels vanish after rationalizing Pontryagin duals, so the coranks agree, including p|deg φ. Also export equality of the actual full Euler factors and analytic L-functions of isogenous elliptic curves, with no rank bound. These are imported targets, not definitions or theorem nodes of this packet.

Consumers: `CMRankZeroConverse:C.4/cm-corank-double`, `CMRankZeroConverse:C.4/cm-order-double`, `CMRankZeroConverse:C.6/cm-twist-nonvanishing`.

### R3: `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`

The existing characteristic-zero quadratic twist and pointed-model comparison interfaces must include exceptional j=0,1728 forms: j=0 coefficients modulo sixth powers and j=1728 coefficients modulo fourth powers. Accept the displayed invertible linear projective transformation for the cube-sum cubic as a pointed elliptic-curve isomorphism and identify its origin. No second twist, curve, or projective-scheme carrier is introduced here.

Consumers: `CMRankZeroConverse:C.6/cube-sum-model`, `CMRankZeroConverse:C.6/cube-sum-cm`, `CMRankZeroConverse:C.6/descending-twist-cosets`.

### R4: `ArithmeticGaloisDuality:R02.4`

Rational lattice Poitou–Tate and Euler–Poincaré in Kato’s precise j_*T convention: (14.9.3), (14.9.5), printed p. 240; h⁰−h¹+h²=−dim W^{c=−1}. Retain real-place Tate terms and errors killed by 2 integrally, then rationalize. Supply rational cohomological amplitude ≤2. The existing finite-module global-euler-characteristic node is not by itself this rational statement.

Consumers: `CMRankZeroConverse:C.1/selmer-zero-h2`, `CMRankZeroConverse:C.1/global-dimension`.

### R5: `KatoEulerSystems:L4`

Kato Proposition 14.12, printed pp. 241–242: for M_f(r), k≥2 and 1≤r≤k−1, every p, including bad p, local H⁰=H²=0, dim H¹=2, dim H¹_f=1; export it for f and f*. Prove it with the non-exceptional specialization consequence of Theorem 12.5(3), printed p. 222, retaining the k=2 local-H² exception κ^(−2)χ and checking that the central character κ^(−1) is different. Independent CM weak Leopoldt and free rank-one/torsion Iwasawa structure must precede construction/use of zeta classes; Kato 15.13–15.17 is the route, not equality inferred from a conjecture that already uses the zeta map.

Consumers: `CMRankZeroConverse:C.1/selmer-zero-h2`, `CMRankZeroConverse:C.1/central-hg-equals-hf`, `CMRankZeroConverse:C.2/zeta-basis`, `CMRankZeroConverse:C.3/cm-newform-converse`.

### R6: `SelmerIwasawaCohomology:L3`

Apply the existing generic derived-control theorem to Kato’s actual j_* cyclotomic complex, with the same bad-prime local extension. Supply finite generation and rational amplitude ≤2, the degree-one Tor₁(H²,E) and degree-two Tor₁(H³,E) sequences, and compatibility with Tw_h followed by augmentation. For Λ=O[[Gal(ℚ(μ_{p∞})/ℚ)]] and A=Λ[1/p], supply continuous evaluation σ_c↦c^(−h), residue A/𝔮≅E and the DVR A_𝔮 on its selected rational finite-character component; retain Δ={±1} at p=2 until rational idempotents can be used. Use the existing completed group algebra, not a direct group-ring substitute.

Consumers: `CMRankZeroConverse:C.0/central-prime`, `CMRankZeroConverse:C.2/specialization-application`, `CMRankZeroConverse:C.2/specialized-zeta`.

### R7: `SelmerIwasawaCohomology:L4`

At ℓ≠p, compare Kato j_*T cohomology with the finite Bloch–Kato local condition for central modular W, including every bad prime. Use the modular local eigenvalue bounds to remove the rational unramified/inertia obstruction; integral Tamagawa terms may persist. Export coefficient-extension and finite-induction/Shapiro compatibility of H¹_f at every finite and real place. Kummer gives H¹_f(F,V_pE)=T_p Sel_{p∞}(E/F)⊗ℚ_p, not an untyped Pontryagin-dual isomorphism. The existing elliptic-finite-kummer is reused, not reconstructed.

Consumers: `CMRankZeroConverse:C.2/nonfinite-localization`, `CMRankZeroConverse:C.4/cm-selmer-comparison`.

### R8: `ComplexMultiplicationAndExplicitReciprocity:CM.4`

Extend the weight-two theta/induction comparison to an arbitrary E/K with CM by any order of the imaginary quadratic field K, without requiring E to descend to ℚ. For L containing both embeddings, V_pE⊗L=η⊕η̄ and η̄=η^∨(1). Construct the actual normalized theta forms with M_{f_η}⊗L≅Ind η^∨ and hence M_{f_η}(1)⊗L≅Ind η̄. Identify their arithmetic L-functions with L(ψ_η/K,s) and L(ψ_{η̄}/K,s), including conductor primes, so their product is the existing full L(E/K,s). Current CM.4/cm-induction-comparison assumes E/ℚ and does not supply this general case. Rational decomposition suffices at order-index primes.

Consumers: `CMRankZeroConverse:C.4/cm-selmer-comparison`, `CMRankZeroConverse:C.4/cm-elliptic-k`.

### R9: `ComplexMultiplicationAndExplicitReciprocity:CM.1`

For the explicit j=0 cube-sum model, use the existing endomorphism/CM interface to identify (X,Y)↦(ζ₃X,Y) with an injective ℤ[ζ₃] action. This order is maximal, so the characteristic-zero elliptic endomorphism classification gives full CM; export disc ℚ(ζ₃)=−3 and ramification of 3. Reuse the existing CM-order/isogeny theory for nonmaximal-order statistical reduction.

Consumers: `CMRankZeroConverse:C.6/cube-sum-cm`, `CMRankZeroConverse:C.6/cm-twist-nonvanishing`.

### R10: `ArithmeticStatistics:ST.0`

Export the fundamental-discriminant family and finite-change/relative-density rules used in EvenGoldfeld, with both signs and |d| height. For any fixed imaginary quadratic K also supply # {t∈K×/K×²:H(t)<X}∼c_KX with c_K>0 for H the odd-valuation support norm. Prove the latter from the existing finite support-ideal fibers and squarefree ideals whose class lies in Cl(K)², using squarefree ideal counts in ideal classes; do not suppose each ideal is principal. This exact total asymptotic is not among the checked named ST.0 nodes.

Consumers: `CMRankZeroConverse:C.5/even-goldfeld`, `CMRankZeroConverse:C.6/descending-twists-thin`, `CMRankZeroConverse:C.6/nondescent-density`.

### GAP-CM: Register the all-prime CM main-conjecture supplier

The issue assigns BT Theorem 2.6 to CMAllPrimeMainConjectures, but no roadmap definition, stage or reserved node for that owner exists at the checked snapshot. Do not invent a resolvable supplier id. Once registered, replace this gap by its exact equality node, retaining all p, conductor Euler factors, the Kato zeta-element normalization and independent early CM weak Leopoldt. The exceptional K⊂ℚ(μ_{p∞}) cases (ℚ(i),p=2 and ℚ(ζ₃),p=3) belong to that supplier. Kato Proposition 15.17 alone is an inequality and does not discharge the equality.

Consumer: `CMRankZeroConverse:C.3/cm-newform-converse`.

### GAP-SMITH: Register the unconditional Smith corank endpoint

ArithmeticStatisticsPartIISmithMethod is the source route assigned by the extraction but has no registered stage or reserved node in this snapshot. ST.5/even-congruent-twists-have-corank-zero-given-smith-law is expressly conditional on the Smith law. Register and cite the unconditional theorem: for positive squarefree n≡1,2,3 mod 8, the 2∞ Selmer corank-zero subset has relative density one. Its proof must include the parity/subfamily transfer, rather than replacing corank by finite Sel₂ dimension or by Mordell–Weil rank. The statistical proof remains with that owner, not this packet.

Consumer: `CMRankZeroConverse:C.5/congruent-even-nonvanishing`.

## Source checks and corrections

The packet’s legacy `printed` fields contain own-word descriptions, with no quotations. These findings inherit the existing extraction findings and make their repairs explicit in the plan. This job did not establish a separate published erratum; the source version used here is the seven-page author version, so published-page numbers must not be substituted.

- **CMRankZeroConverse/E1** (gap), BT, arXiv:2506.03465v2: Theorem 3.1 proof, equation (3.1), p. 6. Own-word description: The implication from the vanishing Selmer space to global H² is compressed into an appeal to duality. First apply rational Poitou–Tate to W′, use the Euler identity and local dimensions to deduce H¹_f(ℚ,W′)=0, then apply it to W to kill H². Retain real-place 2-torsion errors until rationalization. The first dual Selmer term belongs to W′, whereas the hypothesis concerns W. Interchanging them without this argument omits a nontrivial step. Recorded in PAPER-BURUNGALE-TIAN-26/E5; no separate published correction established in this job.

- **CMRankZeroConverse/E2** (misprint), BT, arXiv:2506.03465v2: Proof of Theorem 1.1, Selmer comparison display, p. 6. Own-word description: The displayed dual Selmer comparison uses the CM field as if it were a coefficient field for a ℤ_p module and suppresses the dual representation and central Tate twist. Use completed coefficient fields L, actual Kummer Tate modules, V_pE⊗L=η⊕η̄, M_{f_η}(1)⊗L≅Ind η̄ and finite-condition Shapiro. Only the resulting Selmer-vanishing implication is needed. A tensor product over ℤ_p cannot be formed with an unspecified complex/number-field scalar action, and Kato’s M_f is the cohomological dual of the arithmetic representation. Recorded in PAPER-BURUNGALE-TIAN-26/E3; no separate published correction established in this job.

- **CMRankZeroConverse/E3** (gap), BT, arXiv:2506.03465v2: Theorem 3.1 final reciprocity step, p. 6. Own-word description: The passage from failure of the finite condition to nonzero dual exponential does not explicitly justify equality of the geometric and finite conditions. Prove D_cris(W^∨(1))^{φ=1}=0 by the central local Frobenius bounds and apply the Bloch–Kato dimension formula, obtaining H_g=H_f=ker exp*. For a general de Rham representation ker exp*=H_g, which can be larger than H_f. A bad-prime purity check is necessary here. Recorded in PAPER-BURUNGALE-TIAN-26/E16; no separate published correction established in this job.

- **CMRankZeroConverse/E4** (gap), BT, arXiv:2506.03465v2: Proof of Theorem 3.1, choice of γ in (3.2), p. 6. Own-word description: The surviving conjugation eigenspace in the finite-level class needs the zeta sign relation to identify its generator. Use z(cγ)=−σ_{−1}z(γ), evaluate σ_{−1} at (−1)^h and impose γ^{(−1)^(h−1)}≠0. The opposite eigenspace specializes to zero. A nonzero vector in the wrong eigenspace cannot generate the one-dimensional central cohomology. Recorded in PAPER-BURUNGALE-TIAN-26/E6; no separate published correction established in this job.

- **CMRankZeroConverse/E5** (gap), BT, arXiv:2506.03465v2: Theorem 3.5 and its use for Proposition 1.3, p. 7. Own-word description: The citation to a rank-zero proportion does not state the Selmer-strength input, and the maximal-order reduction is implicit. Use the reduced 3-Selmer rank-zero output of the BKLOS proof; for a nonmaximal CM order first pass by a K-isogeny to maximal order and preserve 3∞ corank, not finite Sel₃ dimension. Mordell–Weil rank zero does not imply Selmer corank zero; bounded finite Selmer torsion is not an isogeny-invariant dimension. Recorded in PAPER-BURUNGALE-TIAN-26/E7; no separate published correction established in this job.

- **CMRankZeroConverse/E6** (gap), BT, arXiv:2506.03465v2: Theorem 3.3 and proof of Theorem 1.2, p. 6; footnote 2, p. 2. Own-word description: The Smith input and residue-class parity discussion need their precise positive-parameter family to support the stated half-density. Use positive squarefree n≡1,2,3 mod 8 and the 2∞ corank-zero relative-density-one theorem; derive the upper bound by root numbers. Transfer to both-sign fundamental discriminants with the actual piecewise rescaled height. Negative n does not obey the same bare residue table; finite Sel₂ dimension includes rational 2-torsion. A density statement in one ordering is not automatically one in another. Recorded in PAPER-BURUNGALE-TIAN-26/E8; no separate published correction established in this job.

Kato Theorem 12.5 is on printed pp. 221–222, not on pp. 218–219. Proposition 14.12 is on pp. 241–242. The CM preliminary argument needed for independent module structure is in §15.13–15.17, pp. 264–265. Kato’s final §15.17 comparison alone must not be promoted to the all-prime rational equality. The theta form and local conductor factors used in that equality belong to the separately assigned main-conjecture supplier.

## Sources

- **[BT] Ashay A. Burungale and Ye Tian.** [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2). arXiv:2506.03465v2, 11 October 2025, 7 pages; published Annals of Mathematics 203 (2026), no. 1, 1–13. Read 2026-10-18. Read scope: Entire public author version, pp. 1–7; all numbered results and proofs. Locators in this packet refer only to this version. SHA-256: `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.
- **[Kato] Kazuya Kato.** [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/article/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290, Numdam scan. Read 2026-10-18. Read scope: Theorems 12.4–12.5, pp. 221–222; §14.8–14.13, pp. 238–242; §15.6 and §15.13–15.17, pp. 253–255, 264–265. SHA-256: `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.
- **[BKLOS] Manjul Bhargava, Zev Klagsbrun, Robert J. Lemke Oliver and Ari Shnidman.** [Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf). Public author version, 25 pages; Duke Mathematical Journal 168 (2019), 2951–2989. Read 2026-10-18. Read scope: §2, height and Theorems 2.5 and 2.7, pp. 2–5; §9.2, p. 14; §11, pp. 18–19. Statistical proofs and CM reduction are imported, not redeveloped. SHA-256: `af4e5ab9b250700c95c09946509e88b8a3f4a4f7efedf6ddc882a5f742478880`.

No restricted book is needed for the owned proof. The maintainer-cleared library index was checked; no restricted source file or passage is copied here. Statistical distribution proofs and the all-prime CM main-conjecture proof remain imports, with exact missing endpoints identified above.

## Suggested Lean file and review boundary

[`CMRankZeroConverse.lean`](../suggested/CMRankZeroConverse.lean) is a compact signature aid. It defines centralSign and cubeSumModel on actual pinned carriers and gives their available API signatures and seven worked examples. It elaborates through `lean-check` at the pins, with only the permitted proof-placeholder warnings. The projective cubic isomorphism, pConverse, centralPrime, centralZeta, EvenGoldfeld, the main converse and all density theorems require supplier carriers absent at those pins; their full targets, APIs and tests are the README specifications above. No arbitrary predicate, fake cohomology module, or unimplemented data definition stands in for them.

Independent review must check the two Tate-dual uses, rational Tor/Nakayama order, zeta sign, H_g=H_f at bad p, typed theta comparison, two rational doubling identities, both height comparisons and the stated supplier gaps. Closure requires discharging the ten requests and registering the two missing exact inputs. The next process does not need to reconstruct any source notes from scratch space.
