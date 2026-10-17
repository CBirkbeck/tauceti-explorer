# Roadmap: GL₂ modularity lifting

**Summary.** This roadmap turns residual modularity and local geometric conditions on a two-dimensional Galois representation into a characteristic-zero modularity theorem. It starts with the actual quaternionic Hecke modules, constructs their compatible Taylor–Wiles actions, and carries the arithmetic data through patching, support comparison and specialisation. The end results include the classical Khare–Wintenberger and Kisin weight-two theorems, lifting of regular de Rham representations at every odd prime and at two, Pan's residually reducible theorem, the ordinary exceptional branch at three, and directed transfer between explicitly given families of Frobenius polynomials. Residual modularity, oddness in characteristic zero, local component conditions and the different conclusions called R = T remain separate hypotheses and conclusions throughout.

## Scope and ownership

The arithmetic comparison between a global deformation ring and its specified Hecke action image belongs here. This includes the compatibility of diamond and Galois characters, the framed arithmetic modules used in patching, the extra determinant data needed at two, the multiplicity and support arguments that detect the required automorphic components, and the lifting theorems themselves. The restricted GL₂(Q_p) Banach and completed local–global statements needed for these arguments are specified in Layers 8–10. They are required mathematical targets, rather than consequences of generic completed-cohomology control.

The following objects and theorems are supplied elsewhere. They are not targets of this roadmap.

- **ArithmeticGaloisRepresentations**, R01.1–R01.5, owns continuous arithmetic representations, descent to finite coefficient fields, stable lattices, residual semisimplification, geometric rank-one characters, Clifford theory and recognition from Frobenius polynomials. Its R01.4 quadratic-cyclotomic irreducibility criterion supplies the equivalence of the two residual irreducibility conditions used below. The proof uses Clifford theory; a normal subgroup with cyclic quotient need not be a diagonal torus.
- **ArithmeticGaloisDuality**, R02.4 and R02.6, owns Grunwald–Wang and finite-order determinant-character adjustment, including the simultaneous prescription at a finite set of places. The character-extension theorem itself is not reproved here.
- **GlobalGaloisDeformations**, R04.1–R04.6, owns the universal deformation and pseudodeformation rings, framed/unframed presentations, the trace-generation theorem, local-condition quotients, Taylor–Wiles prime selection, the twisting functors and global dimension bounds. This roadmap checks those structures on the automorphic modules.
- **LocalGaloisDeformationRings**, R08.2–R08.6, owns the local type rings, ordinary and nonordinary components, local dimensions, tensor-product geometry and real-place rings. **FiniteFlatGroupsAndIntegralPadicHodgeTheory** R07.4 and **PadicHodgeTheory** R06.2–R06.4 supply the geometric local predicates and their comparison theorems.
- **DeformationAndDerivedPatchingAlgebra**, R03.1 and R03.3–R03.6, owns the complete-local algebra, structured finite patching, depth, Hilbert–Samuel multiplicities and support lemmas. The new data here are the actual scalar, framing, Hecke and determinant maps to which that algebra is applied.
- **HilbertModularVarietiesAndShimuraCurves**, R18.3 and R18.6, owns the definite quaternionic spaces, finite Hecke actions, isotropy bounds, selected-root Iwahori comparison, integral Taylor–Wiles freeness and coinvariants, and quadratic norm twists. Their arithmetic compatibility with the deformation ring is owned here. **GL2AutomorphicRepresentationsAndTransfer** R17.3–R17.4 supplies Jacquet–Langlands and solvable base change; **AutomorphicGaloisRepresentations** R19.1–R19.6 supplies the Hecke-valued representations and classical local–global compatibility.
- **SerreWeightAndLevelOptimisation**, R20.3–R20.6, owns allowable changes of field, the optimisation data, the weight-two to weight-p+1 construction, quaternionic level raising, and KW II Theorems 8.2 and 8.4. In particular its `R20.6/kw-minimal-modular-lifts` is the entire minimal-lift existence theorem. Here only its stated output is used; no duplicate lifting construction or comparison target is introduced.
- **OrdinaryAutomorphicFormsAndModularityLifting**, R21.3–R21.5, owns the ordinary modularity theorems, including the precise Skinner–Wiles theorem over Q. **PadicHodgeTheory** R06.4 owns the local crystalline-to-ordinary criterion, including the Q_p weight-p+1 endpoint. The ordinary conclusions below are applications with explicit local hypotheses.
- **CompletedCohomologyPartII**, Layers 1–6 and 8, owns the tower limits, compact duals, admissibility, classical evaluation, completed Hecke action image and residual localisation. Its degree-zero definite adapter is Layer 3.17. **IntegralHeckeAndGaloisDeterminants**, IHG.1–IHG.2, owns integral determinants/pseudorepresentations and the finite Hecke factors. Neither supplier asserts the GL₂ local–global compatibility or full typed support required in Layers 8–10.
- **ModularCurvesPartII** R14.3 and R14.6, the Tau Ceti roadmap **ModularForms** Layers 4 and 9, and **AlgebraicModularFormsAndSerreWeights** R15.2, R15.5 and R15.6 supply classical eigenforms, twisting and passage to a primitive associate, coefficient lattices, and genuine residual eigenform witnesses. Twisting a newform does not automatically give a newform of the naively predicted level.

The current Tau Ceti roadmaps **LocalGaloisGroups**, **ProfiniteArithmetic**, **RestrictedProducts**, **ClassFieldTheory** and **Chebotarev** supply the underlying local Galois groups, cyclotomic character construction, profinite character assembly, finite ideles, reciprocity and approximation/density inputs. These are used through their existing interfaces. The completed-cohomology supplier owns the general compact-module and completed-group-algebra infrastructure; it is not reconstructed here. No general p-adic local Langlands theory, general compatible-system existence theorem, potential modularity theorem or proof of Serre's conjecture is an end theorem of this roadmap. The last layer takes its families and congruences as data.

## Conventions

Fix a rational prime p. The coefficient ring O is the ring of integers of a finite extension E/Q_p, with uniformizer varpi and finite residue field k. Finite coefficient enlargement is allowed only with the induced embeddings, lattices and residue-field maps. A representation valued in Qbar_p is required to descend continuously to a finite coefficient field before a lattice or a deformation problem is chosen. Write bar-rho for an actual reduction when an absolutely irreducible residual representation is fixed, and bar-rho^ss for the lattice-independent semisimplification in the reducible case. Isomorphisms between residual representations are taken after a specified common residue-field extension.

Unless a source-specific convention is explicitly retained, Frobenius is arithmetic and the p-adic cyclotomic character epsilon has Hodge–Tate weight +1. The Hecke-valued representation at a place v outside S has characteristic polynomial

```text
X² − T_v X + N(v) psi(varpi_v).
```

Thus the classical fixed determinant is psi epsilon. For a normalised weight-k newform g it is nebentype(g) epsilon^(k−1). The local Artin map and the labelled tame character are chosen so that gamma_alpha(varpi_v) maps to U_v. Replacing arithmetic Frobenius by its inverse inverts the two roots: a polynomial X²−tX+d becomes X²−(t/d)X+d^(-1), with d nonzero. For roots 2 and 3 this changes X²−5X+6 into X²−(5/6)X+1/6; changing the convention in only the trace is incorrect.

Pan's intermediate completed-Hecke construction in Layer 10 retains the conventions of Pan §1.0.5 and §3.5: geometric Frobenius, Hodge–Tate weight −1 for epsilon, and determinant psi epsilon^(-1). There its fixed determinant is denoted chi, so its central character is psi=chi epsilon. The block representation is bar-rho tensor epsilon, and its automorphic pseudodeformation action is transported back by tensor epsilon^(-1). This local convention is named explicitly; it is not substituted into the classical determinant formula above. Conversion to a normalised classical newform must compare Frobenius polynomials and Hodge–Tate weights through the classical realisation in R19, as required in Layer 10. Merely changing the sign of the written weight does not dualise a representation.

For F totally real, odd means det rho(c_v)=−1 at each real place. At p=2 this is a characteristic-zero condition. The residual determinant of complex conjugation is then 1, which carries no oddness information. Over characteristic zero diag(1,−1) is odd and I₂ is even; both reduce to I₂ modulo two. A quadratic twist multiplies a two-dimensional determinant by chi² and therefore preserves oddness.

Write R=bar-R_S^psi for the unframed fixed-local-condition ring, R^square for its framed version and j=4|S|−1 for the chosen framing dimension. The same framing presentation R^square=R[[y_(h+1),…,y_(h+j)]] is used throughout a Taylor–Wiles system. Put S_infty=O[[y_1,…,y_(h+j)]] and J=(y_1,…,y_h). The first h variables encode diamonds; the last j encode framings. The rank s is always the positive finite O-rank of the **unframed** minimal Hecke module, equivalently the finite free rank of its framed module over O[[y_(h+1),…,y_(h+j)]]. A framed module with j>0 has no such finite O-rank.

For a local ring C, m_C^(r) denotes the ideal generated by r-th powers of individual elements of m_C. Ordinary ideal powers are written m_C^r. These differ: in F₂[[x,y]], m_C^(2)=(x²,y²) whereas xy belongs to m_C². Statements involving inversion of p are unchanged by inversion of varpi, since p is a unit times a positive power of varpi in O; integral truncations still use varpi, including when O/Z_p is ramified.

Finiteness over O, full support, faithfulness, nilpotent kernel, a p-power-torsion kernel, equality of reduced rings and an integral R=T are distinct conclusions. Every occurrence below specifies which is obtained. Positive finite module rank, finite generation over the relevant action image, and the actual scalar map are retained in depth and fibre arguments.

Proposed library names are given relative to `TauCeti.ModularityLifting` or `TauCeti.GL2Lifting` when a source family uses that namespace. The representative signatures in `Suggested.lean` are in `TauCetiRoadmap.GL2ModularityLifting`; their short names agree with the named targets below. A definition that requires the arithmetic carriers built by this roadmap is specified in the README even when it cannot yet be stated against the pinned Lean APIs.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Matrix.det_smul` gives det(uA)=u^n det(A), with n the finite matrix dimension; `Matrix.det_fin_two` gives ad−bc. `Relation.ReflTransGen` is reflexive transitive reachability, with constructors `refl` and `tail`; its reflexive case supplies no seed. `PrimeSpectrum.comap`, `PrimeSpectrum.comap_id` and `PrimeSpectrum.comap_comp` give the contravariant spectrum maps. `minimalPrimes` and `minimalPrimes.equivIrreducibleComponents` identify minimal-prime points with irreducible components, with the order dual in the latter equivalence. These exact carriers suffice for the component-incidence definitions in Layer 10. Generic modules, group algebras, finite matrix representations and power-series rings are library inputs; none is an arithmetic deformation ring or an automorphic Hecke module by itself.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti.UpperTriangularGroup.instIsSolvable` in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperTriangular/Solvable.lean` supplies solvability of the upper triangular group over a commutative ring, for a finite linearly ordered index set. Mathlib's `Group.isSolvable_of_isSolvable_injective` then passes solvability to a subgroup. The arithmetic use is to exclude a preserved line in a two-dimensional representation with nonsolvable image, after extending scalars. Tau Ceti's `TauCeti.GlobalNumberFields.weakApproximation_denseRange` supplies simultaneous approximation in a finite product of finite-place adic completions and infinite-place completions. The open square-class argument in Layer 1 applies this declaration, with Chebotarev to choose the avoidance prime; it is not a new approximation theorem.

### Arithmetic representations, duality and classical realisations

`ArithmeticGaloisRepresentations:R01.1` must provide finite coefficient descent, continuous stable lattices, coefficient-extension invariance and residual semisimplification independent of lattice. R01.2 supplies the rank-one geometric-character theorem: a Qbar_p-valued global p-adic character, unramified outside finitely many primes and de Rham at p, is epsilon^m times finite order, with m its Hodge–Tate weight in the convention above. Its hypothesis that the character itself is de Rham cannot be inferred solely from a list of weights of two other representations. R01.4 supplies preservation of the residual image over an extension disjoint from its kernel field and the odd-prime quadratic-cyclotomic absolute-irreducibility criterion. R01.5 supplies Chebotarev/Brauer–Nesbitt recognition after embeddings into a **single fixed residue-characteristic** algebraic closure.

`ArithmeticGaloisDuality:R02.4/grunwald-wang` supplies extension of finite local cyclic characters with the possible doubling of global order; no fixed cyclic degree is prescribed in the soluble-completion theorem. R02.6 supplies a finite-order global character with the required determinant corrections simultaneously at every specified finite place, subject to the compatibility conditions of KW II Lemma 7.10. For Pan's cyclotomic extension argument it must also supply the exact global-to-local H¹ isomorphism for the relevant odd geometric rank-one character, including the treatment of the extra places of S. A vanishing theorem stated only for the minimal S is insufficient.

`AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, R19.3/classical-newform-irreducibility and R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime supply the characteristic-zero representations of actual weight-at-least-two newforms, their absolute irreducibility and their Hodge–Tate/Weil–Deligne comparisons. R19.6/hecke-algebra-representation-quaternionic supplies a representation over each finite reduced O-flat non-Eisenstein quaternionic Hecke factor and its unramified characteristic polynomials. At the places in S, at Taylor–Wiles places, and for a specified type, the required local–global compatibility includes the actual extension, tame eigencharacter or potentially semistable condition, not merely equality of residual traces.

### Deformation and local geometry

`GlobalGaloisDeformations:R04.2` supplies the universal unframed and framed fixed-determinant problems and one compatible formal power-series framing presentation. R04.6/trace-subring-universal-representation asserts that away-from-S traces topologically generate the relevant **unframed** ring under absolute residual irreducibility. Its factorisation-through-local-conditions statement applies to a finite reduced O-flat coefficient algebra when every characteristic-zero point satisfies the selected conditions. R04.3 supplies the local-to-global presentation and dimension lower bound. R04.5–R04.6 supply Q_n, the labelled distinct residual eigenvalues, N(v)≡1 mod p^n, the auxiliary inertia characters, generator bounds and augmentation maps. The dyadic output also includes the ambient variable-determinant rings, free twist actions and numerical identity used in Layer 6. No ring-module freeness follows from this ring-theoretic output alone.

`LocalGaloisDeformationRings:R08.3` supplies potentially semistable and crystalline fixed-Hodge/type quotients, their pointwise characterisation and generic regularity, including the BCDT admissible branches. R08.4 supplies ordinary/nonordinary Barsotti–Tate components and their coefficient-field hypotheses; an ordinary component also remembers the selected unramified quotient character. R08.5 supplies the dyadic component comparison used by Kisin. R08.6 supplies the KW type-(A), (B), (C) rings, real-place odd ring and completed tensor B with dimension d+1, d=3|S|, O-flatness, domain and regular generic fibre in the minimal semistable setting. The real-place dyadic equation is O[[X₁,X₂,X₃]]/(X₁²+X₂X₃+2X₁); it is not formally smooth over O. For the Fontaine–Laffaille application over an unramified local extension of Q_p, the local supplier must give the formally smooth fixed-Hodge ring over that extension, rather than only the case F_v=Q_p.

`R08.2/ihara-avoidance-components` supplies the two away-from-p local quotients with inertial polynomials (X−1)² and (X−zeta)(X−zeta^(-1)), their common special fibre, the primed irreducibility and the required generic/special component correspondence. This statement includes the residual triviality and residue-cardinality congruence; it is not an arbitrary change-of-type theorem.

### Patching algebra and finite automorphic modules

`DeformationAndDerivedPatchingAlgebra:R03.1/flat-completion-and-finite-module-comparison` compares ordinary and completed tensor products with power series for a finite, hence finitely presented, module over a complete Noetherian base. R03.3 supplies the finite-map depth comparison, Auslander–Buchsbaum with its finite-projective-dimension hypothesis, Hilbert–Samuel additivity/associativity, regular-sequence and type comparisons. R03.4 supplies finiteness of a ring acting faithfully on a finite module over the scalar base. R03.5/kisin-patch-datum, /finite-decorated-data, /patching-extraction and /kisin-ring-module-patching supply compatible finite truncations and limit patching **with** scalar maps and augmentations. The characteristic-zero criterion also supplies the local depth/dimension argument making the patched module projective; regularity alone does not do so. R03.6 supplies component support, cycle specialisation, near faithfulness, torsion kernels and faithful quotient comparisons. Its connectedness and finite-quotient results are consumed with the displayed bounds in Layer 10.

`HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`, /isotropy-exponent and /tw-stabilisers supply the quotient Delta'_Q/Delta'_Q[N]. The exports /iwahori-selected-root and /tw-localised-control supply Hensel's selected root A_v, the integral degeneracy map, finite freeness over O[Delta_Q] and canonical coinvariants, after distinct residual roots and the isotropy quotient are checked. R18.6 exports the finite spaces, reduced O-flat Hecke factors and localised modules. The dyadic norm, Hecke and level-square exports supply the quadratic twist on the actual functions and its operator formulas. The present roadmap proves equality with the deformation-side action.

`SerreWeightAndLevelOptimisation:R20.6/kw-optimisation-data` supplies allowable soluble towers preserving both the full and cyclotomic residual images. Its /kw-minimal-modular-lifts supplies KW II Theorem 8.2: alpha and beta at odd p, beta at two and also alpha at two in residual weight two; a chosen Steinberg set Sigma; after an allowable extension, a residual modular lift with the prescribed spherical/Steinberg levels and central character. The extension is split at p for odd p, but need not split at two in residual weight four. The weight-p+1 case uses weight two with U₀ invariants, not the U₁ case for smaller residual weight. Its /prescribed-local-type-lifts supplies Theorem 8.4 fitting an actual cuspidal witness to the KW lifting data. The finite-set determinant correction and the selected square root at two are retained in this contract. R20.3 and R20.4 supply the residual weight theorem and level/weight adjustments used over Q.

`OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q` and /theorem-a-at-three supply Skinner–Wiles with characteristic-zero irreducibility, oddness, finite ramification, a genuine ordinary unramified quotient, residual distinction on the decomposition group and determinant finite-order times epsilon^(k−1), k≥2. `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`, represented by §6.4 of its package, supplies the crystalline residual-ordinary implication for 2≤k≤p over an unramified field and also k=p+1 over Q_p. At p=3 this is precisely the range needed for weights two and four. R21.3–R21.4 supply ordinary arithmetic loci and their modularity in Pan's global setup; scalar and distinguished ordinary branches retain their separate hypotheses.

### Completed modules and the restricted local–global interfaces

`CompletedCohomologyPartII`, Layers 1–3, 5–6 and 8, supplies the fixed-tame-level coefficient colimit followed by coefficient completion, its continuous dual with inverse action, finite generation/admissibility when its hypotheses hold, classical algebraic evaluation, completed Hecke image and non-Eisenstein residual factor. The order of limits and left/right dual actions are part of the contract. The definite degree-zero construction applies to the finite quaternionic double-coset sets here; central quotients and stabilisers must be checked on those sets. `PadicMeasuresIwasawaAlgebras:L1` supplies the general compact/discrete duality and admissible unitary E-Banach category required by that supplier. `SmoothRepresentationsOfLocalGroups:SR.0–SR.1` supplies smooth O-representations, compact-open invariants and the central-character categories. The additional block, Banach local–global and typed support assertions are targets of Layers 8–10 below, with their own source hypotheses.


### Checks on the imported arithmetic contracts

The R01.4 quadratic-cyclotomic criterion is used over algebraically closed residual coefficients. For p=3 the two fields are the same, Q(sqrt(−3))=Q(zeta₃). A representation induced from Q(sqrt(pStar p)) is reducible on both subgroups. The criterion is not proved by assuming every normal subgroup with cyclic quotient lies in a diagonal torus: with A=diag(1,−1), W=((0,1),(1,0)) in odd characteristic, H=〈−I,W〉 is normal in 〈A,W〉 with cyclic quotient but contains the off-diagonal W. The supplier uses Clifford theory. (Source: [DP, Lemma 1.13 and proof, p. 8][DIEULEFAIT-PACETTI-PUBLISHED], with this explicit correction to its proof route.)

For the R20.6 minimal-lift contract, Sigma is a subset of the chosen witness's Steinberg places, containing its Steinberg places above p in the beta branch with residual weight two. For residual weight p+1 the weight-two conclusion has U₀(v) invariants rather than the U₁(v) invariants used for smaller residual weights. At two in residual weight four it is Steinberg above two, with the chosen unramified square root of psi_v; the final allowable extension need not split there. The actual alpha/beta witnesses and finite-set determinant adjustment are part of the input. The fitting theorem used for the Hecke map is the supplier's Theorem 8.4. (Source: [KW II, Theorem 8.2, pp. 71–74, and Theorem 8.4, pp. 74–77][KW2-2009].)

## How to read the build

Layers 1–2 assemble the witnesses, finite Hecke maps and module systems; the alpha and beta predicates are introduced before they are used in minimal-level existence. Layers 3–4 carry the complete arithmetic diagrams through patching and support transfer. Layers 5–6 apply those comparisons to the classical odd and dyadic local conditions. Layer 7 fixes the modern statements and normalisations. Layers 8–9 supply the corrected multiplicity and completed-support arguments for arbitrary regular de Rham lifts, and Layer 10 gives the nice-prime method for reducible residual representations. Layer 11 isolates the ordinary exceptional branch at three. Layer 12 combines these results into directed congruence and Frobenius-polynomial transfer without requiring the existence of a compatible system. Each definition includes the API needed by its consumers and concrete checks that distinguish its intended meaning.


## Layer 1: Witnesses, minimal level and the Hecke map

### 1.1 Residual modularity of minimal weight and unramified level

For the KW residual representation over a totally real F, define `ResidualModularAlpha` by existence of a cuspidal automorphic representation pi of GL₂(A_F), discrete series at every real place of parallel weight k(bar-rho), with bar-rho_pi isomorphic to bar-rho and pi_v unramified for every v|p. This is an existential statement about an actual automorphic witness and its Galois realisation. It contains no assertion about the deformation ring. The weight is the fixed normalised residual weight in KW's setup.

F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions).

Define the existential predicate using the Hilbert automorphic representation and its attached Galois representation from R19.2. It precedes construction of minimal-level-data; no residual-modularity theorem or optimized witness is part of the definition.

The intended named interface is:

- `ResidualModularAlpha`: (α): ρ̄ ≅ ρ̄_π with π unramified above p, of weight k(ρ̄).
- `residualModularAlpha_iff`: The predicate holds iff a cuspidal witness of weight k(ρ̄), unramified at all v|p, with residual representation ρ̄ exists.
- `residualModularAlpha_of_witness`: A witness with the stated residual representation, weight and level gives ResidualModularAlpha(ρ̄).

(Source: [KW2-2009, §8.2, p. 70][KW2-2009].) *Needs:* GlobalGaloisDeformations:R04.6/kw-deformation-data; AutomorphicGaloisRepresentations:R19.2.

**Checks.**

- ρ̄ = ρ̄_E for an elliptic curve E/ℚ with good reduction at p: E's newform is unramified at p of weight 2, so (α) holds when k(ρ̄) = 2 and (β) holds.
- At weight two an α-witness also witnesses β. A Steinberg witness has conductor p, so that particular witness satisfies β's local condition but not α's; another unramified witness for the same residual representation is not ruled out.
- A residual witness of weight k(ρ̄) + p − 1, unramified at p, witnesses neither (α) nor (β): the weight at infinity must be k(ρ̄), resp. 2.
- A modular elliptic curve with good reduction at p and k(ρ̄)=2 supplies an α-witness.
- An unramified weight k(ρ̄)+p−1 eigenform is not itself an α-witness, since its weight differs from k(ρ̄).
- A Steinberg eigenform at p is not an α-witness, while its conductor-p component is allowed in a β-witness. This concerns that witness, not nonexistence of every α-witness for ρ̄.

### 1.2 Residual modularity of weight two and conductor at most one

Define `ResidualModularBeta` by existence of a cuspidal parallel-weight-two representation pi with residual representation bar-rho and conductor exponent at most one at every v|p. Thus both an unramified component and a Steinberg component are permitted in this witness. In the lifting theorems alpha and beta are separately quantified: they need not have the same automorphic witness, and a weight-two beta witness with a Steinberg component is not itself an alpha witness.

F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions).

Define the existential predicate using the Hilbert automorphic representation and its attached Galois representation from R19.2. It precedes construction of minimal-level-data; no residual-modularity theorem or optimized witness is part of the definition.

The intended named interface is:

- `ResidualModularBeta`: The existential predicate with the stated weight-two and conductor conditions.
- `residualModularBeta_iff`: ResidualModularBeta(ρ̄) iff a cuspidal π with residual representation ρ̄, weight two and local conductor exponent ≤1 exists.
- `residualModularBeta_of_witness`: A π satisfying those three conditions gives ResidualModularBeta(ρ̄).

(Source: [KW2-2009, §8.2, p. 70][KW2-2009].) *Needs:* GlobalGaloisDeformations:R04.6/kw-deformation-data; AutomorphicGaloisRepresentations:R19.2.

**Checks.**

- ρ̄ = ρ̄_E for an elliptic curve E/ℚ with good reduction at p: E's newform is unramified at p of weight 2, so (α) holds when k(ρ̄) = 2 and (β) holds.
- At weight two an α-witness also witnesses β. A Steinberg witness has conductor p, so that particular witness satisfies β's local condition but not α's; another unramified witness for the same residual representation is not ruled out.
- A residual witness of weight k(ρ̄) + p − 1, unramified at p, witnesses neither (α) nor (β): the weight at infinity must be k(ρ̄), resp. 2.
- A weight-two unramified local witness has conductor exponent zero and hence satisfies the β local bound.
- A weight-two Steinberg component of conductor exponent one is allowed in a β-witness.
- A weight-two eigenform with conductor exponent two at a place above p is not itself a β-witness; this does not preclude another witness.

### 1.3 Soluble extensions with prescribed completions

Prove the soluble prescribed-completion theorem in the following unrestricted-degree form. Given a number field F, a finite Galois avoidance extension D/F, a finite set S of places, and a finite Galois extension E_v/F_v at each v in S, construct a finite soluble Galois extension E/F disjoint from D such that E_w is F_v-isomorphic to E_v for every w above v. At a real place the choices are R and C. In particular, prescribing R at all real places of a totally real field gives a totally real E. No assertion that E/F is cyclic of a preassigned degree is made. Local finite Galois groups are soluble; the global construction must preserve the avoidance condition at each step.

At a real place v, E_v is ℝ or ℂ; at a finite place E_v/F_v is any finite Galois extension, hence soluble. D/F is finite Galois.

Add split conditions at a nonsplit prime for each simple Galois subextension of D, by Chebotarev. Induct on the maximum of the local extension degrees. Finite Galois groups of nonarchimedean local fields are soluble, so choose a nontrivial cyclic quotient at each nonsplit place. Realise each cyclic local first step: by local class field theory (Tau Ceti ClassFieldTheory, Layer 7) choose a finite-order character χ_S of ∏_{v∈S} F_v^× whose kernel at v corresponds to the cyclic E_v/F_v; extend it to a finite-order idele class character by the Grunwald–Wang theorem (ArithmeticGaloisDuality R02.4/grunwald-wang; the possible doubling of the order is harmless); let the cyclic extension be its class field (Layer 12). Apply induction to the remaining local extensions. Take the normal closure of the composite over F; local normality ensures the completions remain E_v, solvability is preserved, and the added split conditions force disjointness.

(Source: [CHT-2008, Lemma 4.1.2, statement p. 116 and proof p. 117][CHT-2008].) *Needs:* ArithmeticGaloisDuality:R02.4/grunwald-wang; tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

**Checks.**

- For all L_v=K_v check complete splitting, and for a real place prescribed R check that all resulting real completions remain R. The avoidance field must be included at each cyclic tower step.
- If every E_v = F_v, the lemma gives a soluble E/F, linearly disjoint from D, in which every v ∈ S splits completely; E = F is allowed.
- Prescribing E_v = ℝ at every real place of a totally real F makes E totally real.

### 1.4 Existence of allowable base changes with prescribed completions

Starting with the KW residual data over F, construct allowable changes that realise specified unramified completions at a finite set S₀, with the completions at p chosen to preserve the required split or unramified condition. Apply the preceding theorem with avoidance field the Galois closure of the chosen auxiliary field together with the residual kernel and cyclotomic fields. Include the real places with trivial completion, and one extra finite place with prescribed unramified quadratic completion. The resulting soluble Galois extension is totally real, has even degree, and preserves both bar-rho(G_F) and bar-rho(G_(F(mu_p))). The local and disjointness conditions, rather than solvability by itself, make the extension allowable.

When every prescribed local extension has degree at most two, also construct a genuinely quadratic allowable change. Choose a finite odd-residue-characteristic place z split in the avoidance field, prescribe a nonsquare local unit there, prescribe the desired square classes at S₀ and positivity at all real places, and use weak approximation to choose d. Then F(sqrt(d)) has exactly those local completions, is real quadratic, and is disjoint from the avoidance field because z is inert in it. This quadratic refinement is necessary when a later counting argument requires degree two.

At a place above p only an unramified E_v may be prescribed, and only the trivial one when ρ̄|_{D_p} is irreducible. A nontrivial unramified E_v above p occurs in Lemma 8.1 (to make ρ̄ trivial above p when it is unramified there), in the dyadic branch with k(ρ̄) = 4 and in type (C) with k(ρ̄) = 2, the two cases in which Theorem 8.4 does not promise splitting at p. Evenness comes from one auxiliary place with the unramified quadratic extension prescribed, not from the places of S₀; without it F′ = F would satisfy (1), (3) and (4). KW II's second criterion, for dihedral projective image (a prime split in the field cut out by the projective image and inert in F(μ_p)), is not needed: disjointness from K(μ_p) preserves the image over the cyclotomic field. KW II cite Lemma 2.2 of Taylor's 'On icosahedral Artin representations II' for this; that paper was not read. The statement is derived here from Clozel–Harris–Taylor's Lemma 4.1.2 (§1.3), whose cyclic steps use the Grunwald–Wang theorem of ArithmeticGaloisDuality R02.4. No automorphic input is used: this is existence of a field, not GL2AutomorphicRepresentationsAndTransfer R17.4's base change. 'ρ̄|_{D_p} is irreducible' means absolutely irreducible, as everywhere in KW II §§7–8: an unramified ρ̄|_{D_p} has cyclic image and is reducible over 𝔽̄_p. Clause (5) matters: Lemma 4.1.2 controls the completions but not the global degree, and the proof of Theorem 8.4 needs extensions of degree exactly 2 (KW II p. 77: each F_i/F_{i−1} is quadratic, with one place above v_i's neighbours and two above v_i). For exponent 2 no class field theory is needed, only weak approximation.

Auxiliary place. Choose a finite place u of F outside S₀, not above p, and let E_u be the unramified quadratic extension of F_u. Apply Clozel–Harris–Taylor's Lemma 4.1.2 (§1.3) to F, to D the Galois closure over F of L·K(μ_p), and to the set S = S₀ ∪ {u} ∪ {real places of F}, with the given E_v at S₀, E_u at u and E_v = F_v = ℝ at the real places. It gives a finite soluble Galois F′/F, linearly disjoint from D, with F′_w ≅ E_v for all w | v ∈ S. Totally real: every real place of F splits completely in F′. Even degree: F′/F is Galois, so the local degree [F′_w : F_u] = 2 divides [F′ : F]. The conditions at p are read off (3). Images. F′ is linearly disjoint from K(μ_p) over F, so restriction is an isomorphism Gal(F′K(μ_p)/F′) ≅ Gal(K(μ_p)/F) carrying the subgroup that fixes μ_p to the subgroup that fixes μ_p. Hence ρ̄(G_{F′}) = ρ̄(G_F) and ρ̄(G_{F′(μ_p)}) = ρ̄(G_{F(μ_p)}); absolute irreducibility over F′(μ_p), and non-solvability at p = 2, are properties of these images (ArithmeticGaloisRepresentations R01.4). Quadratic case (5). Write E_v = F_v(√d_v) with d_v ∈ F_v^× (d_v = 1 if E_v = F_v). Choose a finite place z of F outside S₀, not above 2, that splits completely in D (Chebotarev for the trivial class; Tau Ceti Chebotarev, Layer 10), and a non-square unit d_z of F_z. The squares are open in each F_v^×, so by weak approximation there is d ∈ F^× that is totally positive, lies in d_v·(F_v^×)² for v ∈ S₀ and in d_z·(F_z^×)². Put F′ = F(√d). It is totally real, quadratic (z is inert), with completions E_v at S₀; and F′ is not contained in D, because z is inert in F′ and splits completely in D, so F′ ∩ D = F. No auxiliary place u is needed, since the degree is 2. Iteration. F′ is totally real, unramified at p and split at p when required, with the same residual images, so §7.6.2 holds over F′; a tower of such steps is allowable over F by the composition of allowable changes (SerreWeightAndLevelOptimisation R20.6/kw-optimisation-data, kwOptimisationData_allowable_comp).

(Source: [CHT-2008, Lemma 4.1.2, statement p. 116 and proof p. 117][CHT-2008]; [KW2-2009, §7.6.2, paragraph after Definition 7.9, p. 68][KW2-2009]; [KW2-2009, §7.6.2, p. 68][KW2-2009].) *Needs:* SerreWeightAndLevelOptimisation:R20.6/kw-optimisation-data; §1.3; ArithmeticGaloisRepresentations:R01.4; tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev; tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange.

**Checks.**

- F = ℚ, p = 5, S₀ = {5} with E₅ = ℚ₅, u = 3: ℚ(√11) is real quadratic, 5 splits in it (11 ≡ 1 mod 5) and 3 is inert (11 ≡ 2 mod 3). Disjointness from K is a further condition, which is why D enters the construction.
- With S₀ = {v | p} and every E_v = F_v the lemma gives the allowable base changes 'split at p' of Theorem 8.2.
- Prescribing the unramified extension of degree m at the places of a finite set makes the p-part of the residue-field unit groups there as large as required; this is the use in the proof of Theorem 8.2 (order divisible by the p-part of 2p(4N_w)).
- Over the field F_{i−1} of the proof of Theorem 8.4, clause (5) with the trivial extension at the places above v_i and the unramified quadratic extension at the places above the other v_j gives a quadratic F_i, with v_j inert for j ≠ i and split for j = i. Without clause (5) the degree of F_i could be a larger even number, and the count of places above v_1, …, v_i in the proof would be wrong.
- Without the real places in S the extension could be totally complex, and the Hilbert modular setting would be lost.

### 1.5 The residual hypotheses (α) and (β) persist under allowable base change

Show that an allowable soluble tower F'/F transports an alpha witness to an alpha witness and a beta witness to a beta witness. Refine the tower to cyclic prime-degree steps and apply automorphic base change at each step. The resulting representation remains cuspidal because the residual restriction remains absolutely irreducible; its parallel weight is unchanged. At w|v|p the local extension is unramified, so an unramified component remains unramified and conductor exponent at most one remains at most one. Comparison of Frobenius polynomials identifies the residual Galois representation with bar-rho restricted to G_(F').

Allowable changes are those of SerreWeightAndLevelOptimisation R20.6/kw-optimisation-data (KW II Definition 7.9). KW II do not define "solvable"; what their constructions give, and what is used here, is a tower F = F₀ ⊂ … ⊂ F_n = F′ of Galois steps with soluble groups, so that base change can be applied along cyclic steps of prime degree. Image preservation is the relative condition ρ̄(G_{F′}) = ρ̄(G_F) with ρ̄|G_{F′(μ_p)} absolutely irreducible. Cuspidality of each base change uses that the restriction of ρ̄ stays absolutely irreducible (the image condition of an allowable change): a cuspidal π whose base change along a cyclic extension is not cuspidal is automorphically induced from that extension, and then ρ_π restricted to it is reducible. F′/F is unramified above p, and for an unramified local extension the conductor exponent of the local base change equals that of π_v. The definitions of (α) and (β) do not contain this transport; KW II use it without comment whenever they 'reinitialise' the base field.

Refine the soluble tower of the allowable change to cyclic steps of prime degree, each Galois over the previous field and totally real. For one cyclic step apply Langlands' base change (GL2AutomorphicRepresentationsAndTransfer R17.4): it exists, is compatible with local base change at every place, and is cuspidal by the irreducibility remark above. Local behaviour. At infinite places the extension of completions is ℝ/ℝ and the weight is unchanged. At w | v | p the extension F′_w/F_v is unramified: an unramified principal series stays unramified, and the conductor exponent is unchanged in general. Galois side. ρ_{π_{F′}} ≅ ρ_π|_{G_{F′}} by comparison of Frobenius traces at the unramified places (AutomorphicGaloisRepresentations R19.2), hence the same for the residual representations.

(Source: [KW2-2009, §7.6.2, after Definition 7.9, p. 68][KW2-2009].) *Needs:* §1.1; §1.2; SerreWeightAndLevelOptimisation:R20.6/kw-optimisation-data; GL2AutomorphicRepresentationsAndTransfer:R17.4; AutomorphicGaloisRepresentations:R19.2.

**Checks.**

- F′/F quadratic, π unramified at v | p inert in F′: π_{F′,w} is unramified, so an (α)-witness base-changes to an (α)-witness.
- A Steinberg component at v | p (conductor exponent 1) base-changes along an unramified extension to a Steinberg component: a (β)-witness stays a (β)-witness and does not become an (α)-witness.
- If the residual image shrank over F′ so that ρ̄|_{G_{F′}} were reducible, π_{F′} could fail to be cuspidal; this is excluded by the definition of allowable.

### 1.6 Minimal-level data for a modular residual representation

For fixed KW local lifting data and determinant psi epsilon, define `MinimalLevelData` to record the quaternion algebra D, level U, coefficient module W_k, residual Hecke ideal m and an actual cuspidal representation pi fitting the data. After the allowable extension, F has even degree and [F:Q]+|Sigma| is even. The algebra D is ramified precisely at Sigma and the real places. Sigma contains the Steinberg primes away from p and, in the semistable type-(C) branch, the primes above p; the dyadic residual-weight-four branch also includes the primes above two. Put S=Sigma union {v|p} union {real places}, together with the specified exceptional level places if present.

Away from S use maximal compact level. At v in Sigma use (O_D)_v^× for odd p and D_v^× for p=2. At v|p outside Sigma use maximal compact for type (A) and U₁(v) for type (B). The dyadic coefficient has weight two and the required extension to the enlarged, possibly noncompact, level. Jacquet–Langlands transports the witness pi to D^× and its eigenvalues determine m, with bar-rho_m isomorphic to bar-rho. The localised algebra T and module M are obtained from this datum. An isomorphism R=T is not a field of the datum.

The spaces S_{k,ψ}(U, 𝒪), the Hecke algebra 𝕋_ψ(U) and non-Eisenstein ideals are HilbertModularVarietiesAndShimuraCurves R18.3, exported by R18.6 . The existence of the cuspidal π fitting KW lifting data is SerreWeightAndLevelOptimisation R20.6/prescribed-local-type-lifts (KW II Theorem 8.4), conditional on its α/β witnesses and admissible local data.

A definite D ramified exactly at Σ ∪ {∞} exists because [F : ℚ] + |Σ| is even (Hasse's parity condition). π transfers to D^× by Jacquet–Langlands (π is discrete series at Σ), and its Hecke eigenvalues cut out 𝔪.

The intended named interface is:

- `MinimalLevelData`: (D, U, W_k, ψ, 𝔪) with ρ̄_𝔪 ≅ ρ̄ and 𝔪 from π fitting the lifting data.
- `MinimalLevelData.heckeAlgebra`: 𝕋 = 𝕋_ψ(U)_𝔪.
- `MinimalLevelData.heckeModule`: M = S_{k,ψ}(U, 𝒪)_𝔪.
- `MinimalLevelData.residual_iso`: ρ̄_𝔪 ≅ ρ̄.

(Source: [KW2-2009, §9.1.1, pp. 78–79][KW2-2009]; [GEE-MLT-2022, §5.6, p. 35][GEE-MLT-2022].) *Needs:* GlobalGaloisDeformations:R04.6/kw-deformation-data; HilbertModularVarietiesAndShimuraCurves:R18.6; SerreWeightAndLevelOptimisation:R20.6/prescribed-local-type-lifts; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl.

**Checks.**

- p=2 with Sigma nonempty: U_v=D_v^× at v in Sigma, so U is not compact, and W_2 is extended in one of 2^{|Σ|} ways (KW II §7).
- Gee's setting (p ≥ 5): Σ = ∅ after base change, and U_v = GL_2(𝒪_{F_v}) outside T.
- A datum whose fields assert R ≅ 𝕋 is not minimal-level data: only π and 𝔪 are recorded.
- At p=2, U_v=D_v^× at v in Sigma; if Sigma is nonempty this makes U noncompact.
- The residual representation attached to 𝔪 is ρ̄.
- No field of the structure states R̄^ψ_S ≅ 𝕋_ψ(U)_𝔪.

### 1.7 Hecke eigen-systems satisfy the lifting data at every place of S

For every characteristic-zero eigensystem of the finite reduced O-flat factor T attached to minimal-level data, prove that the associated Galois representation has determinant psi epsilon and satisfies the prescribed condition at each place of S. At finite places use the precise local–global comparison, including crystalline, potentially Barsotti–Tate, semistable or selected Steinberg data as appropriate. At real places retain the characteristic-zero odd condition. It is this check on all characteristic-zero points, with reducedness and O-flatness, that allows the universal Hecke representation to factor through the chosen local-condition quotient.

ρ_𝔪 over 𝕋_ψ(U)_𝔪, and the compatibility of π ↦ ρ_π with the local Langlands correspondence away from p (Carayol, Taylor) and at p (Kisin, Saito, Skinner; KW II Lemma 7.7 and Corollary 7.8), are supplied by AutomorphicGaloisRepresentations R19.6. The local conditions and their rings are LocalGaloisDeformationRings R08.6 .

𝒪′-points of 𝕋_ψ(U)_𝔪 correspond to the Hecke eigenforms in S_{k,ψ}(U, 𝒪)_𝔪, hence to cuspidal π with ρ̄_π ≅ ρ̄ (Jacquet–Langlands, R18.3). At v ∈ Σ: π_v is a twist of Steinberg by an unramified character, fixed independently of the eigenform (KW II Lemma 7.2, p = 2 via U_v = D_v^×). At v | p: U_v maximal compact means π_v unramified, so ρ_x|D_v is crystalline of weight k; U_1(v) gives weight two with the tame inertial type; v ∈ Σ above p gives semistable weight two (Corollary 7.8). At ∞: ρ_π is totally odd.

(Source: [KW2-2009, §9.1.1 and the proof of Lemma 9.1, pp. 79–80][KW2-2009]; [KW2-2009, Lemma 7.2, pp. 60–61][KW2-2009].) *Needs:* §1.6; AutomorphicGaloisRepresentations:R19.6; LocalGaloisDeformationRings:R08.6; AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic.

**Checks.**

- For type (A) at v | p with k = 2 and π_v unramified, the specialisation is crystalline with Hodge–Tate weights {0, 1}.
- γ_v does not depend on the eigenform, which is what makes a single local ring R̄^{□,ψ}_v work for all points.
- Without local–global compatibility at p, the points would satisfy the condition only on inertia at almost all places, which does not identify the local problem.

### 1.8 The deformation-to-Hecke map

Construct `defToHecke : R → T` as the continuous local O-algebra map classifying the Hecke-valued representation. Absolute residual irreducibility supplies the global deformation problem, while the preceding pointwise verification supplies factorisation through its local conditions. The result is the specified classifying map; its surjectivity is a separate theorem. All determinant, residual and local-condition identifications are part of the construction.

The factorisation through the local-condition quotient is GlobalGaloisDeformations R04.6/factorization-through-local-conditions, applied to A = 𝕋_ψ(U)_𝔪, which is reduced, 𝒪-flat and finite (R18.3). The universal property of R^ψ_S is GlobalGaloisDeformations R04.2.

ρ_𝔪 is a lift of ρ̄ with determinant ψχ_p, unramified outside S, so the universal property gives π′ : R^ψ_S → 𝕋_ψ(U)_𝔪. Its points satisfy the local conditions (hecke-points-local-conditions), so π′ factors through R̄^ψ_S (R04.6/factorization-through-local-conditions). Traces: π(tr ρ̄^univ(Frob_v)) = tr ρ_𝔪(Frob_v) = T_v, by the Eichler–Shimura relation.

The intended named interface is:

- `defToHecke`: π : R̄^ψ_S →ₐ[𝒪] 𝕋_ψ(U)_𝔪.
- `defToHecke_trace`: π(tr ρ̄^univ(Frob_v)) = T_v for v ∉ S.
- `defToHecke_unique`: Unique with π ∘ ρ̄^univ ≅ ρ_𝔪.

(Source: [KW2-2009, Lemma 9.1, p. 80][KW2-2009]; [GEE-MLT-2022, §5.6, p. 35][GEE-MLT-2022].) *Needs:* §1.7; GlobalGaloisDeformations:R04.6/factorization-through-local-conditions; GlobalGaloisDeformations:R04.6/trace-subring-universal-representation; GlobalGaloisDeformations:R04.2/universal-deformation-ring; AutomorphicGaloisRepresentations:R19.6; AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic.

**Checks.**

- Composing with an 𝒪′-point x of 𝕋 gives the point of R̄^ψ_S classifying ρ_x.
- The map is not asserted injective: R = T is the conclusion of Layer 3 and Layer 4.
- Without the local-condition factorisation one only gets R^ψ_S → 𝕋, whose kernel need not contain the local-condition ideal.
- Traces of Frobenius map to T_v.
- Composing with the point of π gives the lift ρ_π.
- No injectivity is part of the construction.

### 1.9 Trace characterization of the Hecke map

Prove that `defToHecke` sends tr rho_univ(Frob_v) to T_v and det rho_univ(Frob_v) to N(v)psi(varpi_v) for v outside S. The universal-property comparison identifies the specialised representation, and the trace-generation theorem implies uniqueness of this continuous map from its away-from-S trace values. The trace-generation assertion concerns the unframed ring; additional framing variables are not generated by those traces.

ρ̄ is absolutely irreducible, so the unframed ring is generated topologically by traces (GlobalGaloisDeformations R04.6/trace-subring-universal-representation); T_v and S_v are the Hecke operators at the places v ∉ S, with S_v acting by ψ(π_v).

The classifying property identifies the specialized universal representation with the fixed Hecke-valued representation. Apply its Frobenius characteristic-polynomial identities outside S. The trace-subring theorem says that these traces topologically generate the unframed deformation ring; continuity then gives uniqueness of the map.

(Source: [KW2-2009, Lemma 9.1 and proof, pp. 79–80][KW2-2009].) *Needs:* §1.8; GlobalGaloisDeformations:R04.6/trace-subring-universal-representation.

**Checks.**

- KW II use arithmetic Frobenius: the characteristic polynomial of ρ_𝔪(Frob_v) is X² − T_vX + N(v)ψ(π_v); with geometric Frobenius the eigenvalues are inverted and both coefficients change, so the convention is part of the statement.
- Two continuous maps R̄^ψ_S → 𝕋 agreeing on all tr ρ_univ(Frob_v), v ∉ S, are equal, by Chebotarev density and continuity.

### 1.10 Surjectivity of the deformation-to-Hecke map

Prove surjectivity of `defToHecke` onto the specified local Hecke action image. The away-from-S Frobenius traces give its generating T_v, with the determinant operators already fixed by psi. Complete-local generation and continuity give the desired surjection. This argument uses absolute residual irreducibility and the actual trace-generated image; it does not assert surjectivity onto an unrelated abstract algebra of Hecke symbols.

𝕋_ψ(U) is generated over 𝒪 by T_v and S_v for v ∉ S, and S_v acts by the scalar ψ(π_v) ∈ 𝒪^× (R18.3).

The image of π contains T_v = π(tr ρ̄^univ(Frob_v)) for all v ∉ S, and 𝒪. 𝕋_ψ(U)_𝔪 is finite over 𝒪 and the image of a complete local ring is closed, so the image is all of 𝕋_ψ(U)_𝔪. π^□ is the base change of π along the flat map R̄^ψ_S → R̄^{□,ψ}_S, so it is surjective as well.

(Source: [KW2-2009, proof of Lemma 9.1, p. 81][KW2-2009].) *Needs:* §1.8; §1.9.

**Checks.**

- Gee's form: surjective 'because local-global compatibility shows that the Hecke operators generating T∅ are in the image'.
- At Taylor–Wiles level the same argument gives R̄^ψ_{S∪Q} ↠ 𝕋_{ψ,Q}(U_Q)_𝔪 (auxiliary-hecke-algebra).
- If 𝕋 included U_v at a place of S outside the image of the traces, surjectivity could fail; KW II's 𝕋_ψ(U) uses only v ∉ S.

### 1.11 Framed Hecke algebra

For the single chosen framing presentation R^square=R[[y_(h+1),…,y_(h+j)]], define `framedHecke` as T tensor_R R^square. The ring T is finite over O, hence finite and finitely presented over the complete Noetherian R. Prove that this ordinary tensor product agrees with the completed tensor product and is T[[y_(h+1),…,y_(h+j)]]. Quotienting all framing variables recovers T with its original map from R. Finite presentation is essential to the tensor/power-series comparison.

T = 𝕋_ψ(U)_𝔪 is finite over O, reduced and O-flat, and receives the surjection from R̄^ψ_S (deformation-to-hecke-surjective); the framing presentation of R̄_S^{□,ψ} over R̄^ψ_S is fixed once (GlobalGaloisDeformations R04.2/framed-unframed-comparison).

Use the chosen framed/unframed presentation and the unframed surjection. The finite O-module T is finite over R̄, hence finitely presented because R̄ is Noetherian. Apply the finite-module completion comparison to identify T⊗R̄ R̄[[y]] with T[[y]]. The quotient by the variables is T. No tensor–infinite-product interchange is used without finite presentation.

The intended named interface is:

- `framedHecke`: The O-algebra T⊗_R̄ R̄^□ with its specified deformation and Hecke maps.
- `framedHecke_series`: T^□≅T[[y_1,…,y_j]] as T-algebras, for the chosen framing presentation and finite presentation of T.
- `framedHecke_augmentation`: Quotienting by all framing variables gives T with its original map from R̄.

(Source: [KW2-2009, Lemma 9.1 and §9.1.1, pp. 79–80][KW2-2009].) *Needs:* §1.10; GlobalGaloisDeformations:R04.2/framed-unframed-comparison; DeformationAndDerivedPatchingAlgebra R03.1/flat-completion-and-finite-module-comparison.

**Checks.**

- T^□ is not finite over O when |S| ≥ 1: it has j = 4|S| − 1 free framing variables.
- For a module that is not finitely presented the ordinary tensor with a power-series ring need not be the module of power series; the identification is used only for the finite T.
- For |S|=1 the ring is T[[y_1,y_2,y_3]].
- Killing every framing variable recovers T.
- The interchange of a tensor product with infinite coefficient products requires finite presentation; no unrestricted tensor–power-series identity is asserted.

### 1.12 Framed Hecke module

Define `framedHeckeModule` to be M tensor_R R^square, with the specified action of `framedHecke` and coefficient map. Because M is finite over O, it identifies with M[[y_(h+1),…,y_(h+j)]]. Its quotient by the framing variables is M, compatibly with the original Hecke action. The construction uses the same framing presentation as the ring and preserves the augmentation diagram.

M is finite O-free; T is its faithful Hecke action image. Fix the same framing presentation used to define T^□. All tensor–completion comparisons use finite presentation.

Use the finite-module tensor–completion comparison, then transport the two commuting actions. The action, not just the underlying O-module, is preserved under the augmentation.

The intended named interface is:

- `framedHeckeModule`: M^□ with its T^□-action and O[[y]]-scalar action.
- `framedHeckeModule_series`: M^□≅M[[y]] as modules with both actions.
- `framedHeckeModule_augmentation`: M^□/(y)≅M, T^□/(y)≅T equivariantly.

(Source: [KW2-2009, Lemma 9.1 and §9.1.1, p. 80][KW2-2009].) *Needs:* §1.11; DeformationAndDerivedPatchingAlgebra R03.1/flat-completion-and-finite-module-comparison.

**Checks.**

- |S| = 1: three framing variables.
- M^□/(y_{h+1}, …, y_{h+j}) = S_{k,ψ}(U, 𝒪)_𝔪.
- 𝕋^□_𝔪 is not finite over 𝒪: the framing variables are free.
- If M≅O^s, then M^□≅O[[y]]^s.
- Augmentation recovers the original Hecke module with its action.
- Replacing the faithful Hecke action on a nonzero M by the zero action fails the required unital T^□-module compatibility.

### 1.13 Faithfulness and freeness after framing

Suppose M is nonzero, finite O-free of rank s and faithful over its finite reduced O-flat action image T. Prove that T^square is reduced and O-flat, and M^square is faithful over T^square and finite free of rank s over O[[y_(h+1),…,y_(h+j)]]. For faithfulness, a nonzero coefficient of a power series in T acts nontrivially on M; finite presentation gives the power-series description used in this argument. This is finite rank over the framing ring, not over O when j>0.

M ≠ 0 is finite free over O and faithful over its Hecke action image T, which is finite, reduced and O-flat; the framing presentation is the one used for T^□ and M^□.

Use the finite-presentation power-series identifications T^□≅T[[y]] and M^□≅M[[y]]. A basis of the finite O-free module M gives a basis of M^□ over O[[y]]. A nonzero power series acting on M[[y]] has a first nonzero coefficient, which acts nontrivially on some element of M by faithfulness. Thus the framed action is faithful. Reducedness of T[[y]] and O-flatness follow coefficientwise from reducedness and O-torsion-freeness of T.

(Source: [KW2-2009, Lemma 9.1 and §9.1.1, p. 80][KW2-2009].) *Needs:* §1.12; §1.11; DeformationAndDerivedPatchingAlgebra R03.1/flat-completion-and-finite-module-comparison.

**Checks.**

- For M = O and T = O the conclusions read: O[[y]] is reduced, O-flat, and O[[y]] acts faithfully on itself.
- Faithfulness of M^□ over T^□ uses faithfulness of M over T: the zero action of T on M would give a non-faithful framed action.

### 1.14 Framed deformation-to-Hecke map

Define `defToHeckeFramed : R^square → T^square` by r↦1 tensor r. It is the base change of the unframed surjection and therefore surjective. In the chosen power-series coordinates it applies `defToHecke` to coefficients and sends each framing variable to the corresponding framing variable. Its quotient by those variables is the original map R→T. Setting the variables to zero defines the augmentation, not this framed map.

The unframed π : R̄^ψ_S ↠ T and the framing presentation R̄_S^{□,ψ} ≅ R̄^ψ_S[[y_1,…,y_j]] are fixed; π^□ is defined on the framed ring by base change, not by a choice of images of the framing variables.

Base change the unframed surjective map R̄→T along R̄→R̄^□. Right exactness of tensor gives surjectivity. The selected power-series presentations identify this map with coefficientwise π. Taking the quotient by the variables recovers π and proves the augmentation square.

The intended named interface is:

- `defToHeckeFramed`: The continuous O-algebra map r↦1⊗r.
- `defToHeckeFramed_coeff`: Its restriction to R̄ is π followed by T→T^□.
- `defToHeckeFramed_aug`: Its quotient by all framing variables is π.

(Source: [KW2-2009, §9.1.1 after Lemma 9.1, p. 80][KW2-2009].) *Needs:* §1.11; §1.10.

**Checks.**

- Right exactness: the base change of a surjective ring map is surjective, so π^□ is onto T^□.
- Composing π^□ with the quotient by (y_{h+1},…,y_{h+j}) recovers π.
- Each chosen framing variable maps to the matching variable in T[[y]].
- At augmentation the map is the unframed map.
- For j>0 and T≠0, sending all framing variables to zero does not give the specified base-change map.

### Examples

For |S|=1 there are j=3 framing variables. A finite O-free M of rank s becomes M[[y₁,y₂,y₃]], free of rank s over the framing ring. Killing the variables recovers the original action and residual witness; the framed module is generally infinite over O. A weight-two Steinberg witness satisfies beta but is not itself an unramified alpha witness.

### Dependencies

R01 stable lattices; R02 characters; R04/R08 deformation data; R17 transfer; R18 finite Hecke spaces; R19 Galois realisations; R20 prescribed witnesses; Tau Ceti approximation and Chebotarev.


## Layer 2: Auxiliary levels and the arithmetic module system

### 2.1 Auxiliary levels at Taylor–Wiles places

For an R04 Taylor–Wiles datum Q disjoint from S, assemble the supplied quaternionic auxiliary levels with the fixed coefficient lattice, central character, uniformizers and residual root labels. Write Delta'_v for the maximal p-quotient of k(v)^× and N for the uniform isotropy exponent. Set Delta_v=Delta'_v/Delta'_v[N] and Delta_Q=product_(v in Q) Delta_v. At v in Q use U₀(v) for U_Q^0 and the kernel of a/d→Delta_v for U_Q; elsewhere keep U. Record the induced isomorphism U_Q^0/U_Q=Delta_Q. With sufficient roots of unity in the coefficient field, the corresponding characters of Delta'_Q are N-th powers and kill the isotropy. This arithmetic assembly checks the R04 primes against the R18 level construction.

The finiteness of the isotropy groups and the bound on the exponent of their Sylow p-subgroups are KW II §7.2 (R18.3, via R18.6). For p ≥ 5 unramified in F they have order prime to p (Gee §5.3), so N is prime to p and Δ_v = Δ′_v. Quotienting by the N-torsion is what makes characters of Δ_Q kill the isotropy groups; the congruence N(v) ≡ 1 mod p^n alone does not.

U_Q is normal in U^0_Q, and a ↦ ad^{−1} induces U^0_Q/U_Q ≅ ∏_v Δ_v. Every character of Δ_v, viewed on Δ′_v, kills the N-torsion, so it is an N-th power.

The intended named interface is:

- `auxLevel`: U_Q ⊆ U^0_Q ⊆ U for a Taylor–Wiles datum Q.
- `auxDelta`: Δ_Q = ∏_v Δ′_v/(N-torsion).
- `auxLevel_quotient`: U^0_Q/U_Q ≃ Δ_Q.
- `auxDelta_char_pow`: Under the fixed coefficient extension containing the needed roots of unity, the supplier’s Δ_Q characters are N-th powers on Δ′_Q, for these arithmetic levels.

(Source: [KW2-2009, §7.4, p. 63][KW2-2009]; [GEE-MLT-2022, §5.6, p. 35][GEE-MLT-2022].) *Needs:* §1.6; GlobalGaloisDeformations:R04.5/taylor-wiles-datum; HilbertModularVarietiesAndShimuraCurves:R18.6; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level; HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers.

**Checks.**

- Q = ∅: U_Q = U^0_Q = U and Δ_∅ = 1.
- For p ≥ 5 unramified (Gee), N is prime to p and Δ_v is the full p-part of k(v)^×.
- Using Δ′_v when the isotropy groups have p-torsion (possible for p = 2, 3) breaks the freeness of Lemma 7.4: a character of Δ′_v need not kill the isotropy.
- Q = ∅ gives U.
- U^0_Q/U_Q ≅ Δ_Q.
- With Δ′_v in place of Δ_v, characters need not kill p-torsion isotropy.

### 2.2 Auxiliary Hecke action image

Define `auxHecke` before localising as the O-subalgebra of End_O(S_(k,psi)(U_Q,O)) generated by T_w and S_w away from S union Q, by the specified U_v for v in Q, and by the Delta_Q diamonds. Its action is faithful by the definition as an image. The coefficient lattice, central action and uniformizers remain fixed. For Q empty the unlocalised construction is the original unlocalised image; after choosing m_Q it gives T. A separate maximal ideal selects the residual branch.

Fix the level, central character, coefficient lattice and uniformizers. The diamond action factors through Δ_Q; the global deformation ring still carries the larger Δ′_Q action.

Take the algebra generated by the specified Hecke operators on the finite O-module. The branch localization, eigenvalue identities and comparison with the smaller Hecke algebra are separate targets.

The intended named interface is:

- `auxHecke`: The generated O-subalgebra of End_O S(U_Q,O).
- `auxHecke_action_faithful`: The tautological action is faithful because this is its action image.
- `auxHecke_diamonds`: Diamonds give O[Δ_Q]→T_{ψ,Q}(U_Q), compatible with right translation.

(Source: [KW2-2009, §7.4 before Corollary 7.5, p. 65; §9.1.1, p. 80][KW2-2009]; [KW2-2009, Remark after Lemma 9.1, p. 81][KW2-2009].) *Needs:* §2.1; HilbertModularVarietiesAndShimuraCurves:R18.6.

**Checks.**

- Q = ∅ recovers 𝕋_ψ(U)_𝔪 and deformation-to-hecke-map.
- U_v ↦ A_v under the map to level U (delta-freeness-at-taylor-wiles-level), not U_v ↦ B_v.
- With equal residual eigenvalues the simple-root Hensel argument and separation into two residual eigenlines fail; this does not assert that a maximal ideal cannot exist.
- For Q empty this is the original Hecke algebra.
- A scalar central operator acts by the fixed central character.
- An element of Δ′_Q[N] acts trivially after passage to Δ_Q; retaining an independent nontrivial diamond for it gives the wrong algebra.

### 2.3 Auxiliary residual branch ideal

Given the residual eigensystem away from Q, include varpi in its ideal m^away and choose a distinct-root label alpha_v at each v in Q. For any coefficient lift alpha-tilde_v define `auxMaxIdeal` by (m^away, U_v−alpha-tilde_v : v in Q). The selected-root comparison provides the nonzero residual eigenspace, so this is the required maximal ideal, and one takes its complete local factor. Prove independence from the lifts of each fixed alpha_v. Replacing alpha_v with beta_v changes the branch and is not independence from a coefficient lift.

For each v ∈ Q the residual Frobenius eigenvalues α_v ≠ β_v are fixed and N(v) ≡ 1 mod p; the residual eigensystem away from Q is the non-Eisenstein 𝔪 of the minimal level.

Apply the supplied selected-root Iwahori comparison to the distinct residual eigenvalues to obtain the nonzero residual eigenspace with U_v=α_v. Its Hecke character defines the required maximal ideal. Two coefficient representatives differ by the coefficient maximal ideal, already in m^away. They generate the same ideal. The other residual root defines a different residual character; it is a different branch, rather than another lift of the same root.

The intended named interface is:

- `auxMaxIdeal`: The branch ideal (m^away,U_v−α̃_v:v∈Q).
- `auxMaxIdeal_lift_independent`: Replacing α̃_v by a congruent representative leaves the ideal and its local factor unchanged.
- `auxMaxIdeal_residue`: In the residue field U_v acts by the chosen α_v and the away-from-Q operators by the fixed residual eigensystem.

(Source: [KW2-2009, §7.4, pp. 64–65; Lemma 9.1, p. 80][KW2-2009].) *Needs:* §2.2; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control; HilbertModularVarietiesAndShimuraCurves:R18.3/iwahori-selected-root.

**Checks.**

- Q = ∅ gives back 𝔪.
- Choosing β_v instead of α_v at one place gives a different maximal ideal: the residues of U_v differ.
- When Q is empty the branch ideal is m.
- Changing α̃_v to α̃_v+πc adds an element already in m^away and gives the same ideal.
- If α_v≠β_v, the two branch ideals cannot be identified: their U_v residues differ.

### 2.4 Auxiliary deformation-to-Hecke map

Construct the continuous local O-algebra map `defToAuxHecke : bar-R_(S union Q)^psi → T_(psi,Q)(U_Q)_(m_Q)`. Its representation is the Hecke-valued one, with the original conditions at S and the labelled tame character gamma_(alpha_v) at Q. Check these conditions at all characteristic-zero points of the reduced O-flat target. The source carries O[Delta'_Q]; its action on the target factors through the specified diamonds of Delta_Q. The character comparison needed for that last assertion is proved at the selected eigenline.

The Hecke algebra 𝕋_{ψ,Q}(U_Q)_{𝔪_Q} is finite, reduced and O-flat, and its characteristic-zero points satisfy the lifting data at S and are unramified-principal-series with a tame inertia character at each v ∈ Q (local–global compatibility, AutomorphicGaloisRepresentations R19.6).

The localized Hecke-valued representation has the specified determinant and residual representation. Check its characteristic-zero points using local–global compatibility, including the selected tame inertia line at every v∈Q. Apply the global universal property and local-condition factorization for a finite reduced O-flat Hecke algebra. The labelled line identifies the Δ′_Q-character. Comparison with module diamonds is proved separately by auxiliary-eigenvalue-compatibility.

The intended named interface is:

- `defToAuxHecke`: The continuous local O-algebra homomorphism π_Q.
- `defToAuxHecke_trace`: π_Q(tr ρ_univ(Frob_w))=T_w for w outside S∪Q.
- `defToAuxHecke_universal`: Pullback of the Hecke representation is the universal deformation with its labelled local conditions.

(Source: [KW2-2009, Lemma 9.1 and proof, pp. 79–81][KW2-2009].) *Needs:* §2.3; §1.7; GlobalGaloisDeformations:R04.6/factorization-through-local-conditions; AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic.

**Checks.**

- Q = ∅ recovers deformation-to-hecke-map.
- At p = 2 the map is also compatible with the twisting actions of Hom(G_{Q_n,2}, O^×) (dyadic-twists-of-forms).
- For Q empty π_Q is π.
- Every unramified Frobenius trace has the specified T_w image.
- Labelling γ by β_v while retaining the α_v branch is incompatible with the selected residual line.

### 2.5 Auxiliary eigencharacter compatibility

On the alpha_v branch, prove the Hecke-algebra equalities pi_Q(gamma_(alpha_v)(varpi_v))=U_v and pi_Q(gamma_(alpha_v)(h))=diamond(h) on tame inertia. At a characteristic-zero point the principal-series local–global comparison identifies the selected Frobenius and inertia line. Distinct residual roots distinguish it from the beta_v line. Reducedness and O-flatness promote the pointwise identities to identities in the finite complete Hecke algebra. The chosen representative alpha-tilde_v only specifies the residue of U_v.

The Hecke algebra at level U_Q is reduced and O-flat, so an identity holds in it as soon as it holds at every characteristic-zero point; at each point local–global compatibility at v ∈ Q is available (AutomorphicGaloisRepresentations R19.6).

At every characteristic-zero Hecke point, local–global compatibility identifies the selected inertia/Frobenius line with the U_v branch reducing to α_v. Compare the resulting U_v and tame-character functions in the finite reduced O-flat localized Hecke algebra. Its embedding in the product of characteristic-zero points gives equality in that algebra, not merely equality after reduction.

(Source: [KW2-2009, proof of Lemma 9.1, pp. 80–81][KW2-2009].) *Needs:* §2.4; GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action; AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic.

**Checks.**

- The operator U_v depends on the uniformiser π_v; the identity γ_{α_v}(π_v) ↦ U_v is stated for that same π_v.
- An arbitrary lift α̃_v of α_v is not U_v; only its reduction is fixed.

### 2.6 The diamond and Galois actions of Δ_Q agree

Prove that the diamond Delta_Q-action on the localised auxiliary module equals its action through the deformation ring and pi_Q. With the chosen Artin convention, the matrix diag(h-tilde,1) acts on the line whose U_v eigenvalue reduces to alpha_v by the tame character gamma_(alpha_v). The characteristic-zero eigenvalue, rather than alpha-tilde_v, enters this comparison. On switching to the beta_v line one gets the inverse inertia character, since the fixed determinant is unramified at this auxiliary place.

The needed local–global compatibility at v ∈ Q (π_v ≅ χ₁ × χ₂ tamely ramified principal series, with eigenvalues of ρ_π(Frob_v) equal to #k(v)^{1/2}χ_i(ϖ_v)) is AutomorphicGaloisRepresentations R19.6. The lift α̃_v defining 𝔪_Q is arbitrary and is not asserted to equal the actual U_v-eigenvalue (KW II p. 65; Gee Proposition 5.8, p. 36).

A point θ of 𝕋_Q gives π with π_v^{U_{Q,v}} ≠ 0, so π_v is a subquotient of χ₁ × χ₂ with χ_i tamely ramified. (χ₁ × χ₂)^{U_{Q,v}} = ℂφ₁ ⊕ ℂφ_w, with U_ϖ φ_w = #k(v)^{1/2}χ₂(ϖ)φ_w and U_ϖ φ₁ = #k(v)^{1/2}χ₁(ϖ)φ₁ + Xφ_w. αv ≠ βv forces χ₁/χ₂ ≠ |·|^{±1}, so π_v = χ₁ × χ₂ is irreducible and one may take χ₂(ϖ) ↔ α_v. The U_v-eigenline with eigenvalue #k(v)^{1/2}χ₂(π_v) reducing to α_v is ℂφ_w, on which (δ 0; 0 1) acts by χ₂(δ) = χ_α ∘ Art (Gee Proposition 5.8(1)).

(Source: [GEE-MLT-2022, Proposition 5.8(1) and its proof, p. 36][GEE-MLT-2022]; [KW2-2009, Lemma 9.1 (compatibility with 𝒪[Δ′_{Q_n}]), p. 80][KW2-2009].) *Needs:* §2.2; GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action; AutomorphicGaloisRepresentations:R19.6; §2.5; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control.

**Checks.**

- Q = ∅: nothing to check.
- If one used the β_v-eigenvalue, the diamond action would match γ_{β_v} = γ_{α_v}^{−1} on inertia instead.
- The agreement is what lets the patched Hecke module be a module over the patched deformation ring compatibly with 𝒪⟦y_1, …, y_h⟧.

### 2.7 Surjectivity at auxiliary level

Prove that `defToAuxHecke` is surjective. Away-from-Q Hecke generators are universal traces; the selected U_v and diamond generators are images of the labelled local character by the preceding identities. These together generate precisely the auxiliary action image. The proof uses the complete local residual branch and does not obtain the U_v values by identifying them with arbitrary lifts of their residues.

The auxiliary Hecke algebra is generated over O by T_w, S_w (w ∉ S ∪ Q), U_v and the diamond operators (v ∈ Q), and is complete local after localisation at 𝔪_Q.

Away-from-Q Hecke operators are images of universal Frobenius traces; the determinant operators are prescribed coefficient scalars. The eigenvalue-compatibility theorem places every U_v and diamond generator in the image. These generators topologically generate the complete local action algebra, so the continuous map is surjective.

(Source: [KW2-2009, Lemma 9.1 and following remark, pp. 80–81][KW2-2009].) *Needs:* §2.4; §2.5; §2.2; GlobalGaloisDeformations:R04.6/trace-subring-universal-representation.

**Checks.**

- Q = ∅: this is deformation-to-hecke-surjective.
- Without the identity γ_{α_v}(π_v) ↦ U_v the operators U_v need not lie in the image of the trace map.

### 2.8 Comparison with the trace-generated Hecke algebra

Let T'_Q be the complete local subalgebra generated by the away-from-S-union-Q trace operators. Prove T'_Q→T_Q is an isomorphism: the universal trace ring already reconstructs the residual absolutely irreducible representation, and the selected-root local character identities recover the auxiliary U_v and diamonds. This comparison permits either description of the Hecke factor while preserving its map from the same deformation problem.

ρ̄ is absolutely irreducible, so a representation whose traces lie in a closed subalgebra is defined over that subalgebra (Carayol, GlobalGaloisDeformations R04.2/carayol-trace-theorem).

Work in the selected local factor of the enlarged action image. Its Hecke representation has traces in the closed away-from-Q trace algebra and absolutely irreducible residual representation. Carayol trace descent gives a representation over that smaller algebra. Its labelled local eigenspaces recover U_v and the diamond characters there by the same distinct-root and inertia argument. Thus the inclusion contains every extra generator and is surjective as well as injective.

(Source: [KW2-2009, remark following Lemma 9.1, p. 81][KW2-2009].) *Needs:* §2.7; §2.5; GlobalGaloisDeformations:R04.2/carayol-trace-theorem.

**Checks.**

- Q = ∅: both algebras are 𝕋_ψ(U)_𝔪.
- The comparison is at the selected branch 𝔪_Q; at the other branch (β_v instead of α_v) it is a different local factor.

### 2.9 Freeness at the arithmetic Taylor–Wiles levels

Apply the integral selected-root control theorem to these actual R04 primes: N(v)≡1 mod p^n, alpha_v≠beta_v, and the isotropy quotient Delta_Q. Obtain a finite free O[Delta_Q]-module S_(k,psi)(U_Q,O)_(m_Q) of rank s=rank_O(M), independent of Q, with canonical Delta_Q-coinvariants M. The degeneracy map uses the selected Hensel root A_v in xi_v(f)=A_v f−diag(1,varpi_v)f. This is the arithmetic verification of the supplier's hypotheses and its compatibility with the ring action; the geometric freeness and Hensel construction remain with R18.

The localized freeness and coinvariant control, with the Hensel root A_v and the Steinberg exclusion through local–global compatibility, are HilbertModularVarietiesAndShimuraCurves R18.3/tw-localised-control (KW II Corollary 7.5); geometric freeness is R18.3/tw-freeness (Lemma 7.4). The congruence N(v) ≡ 1 mod p^n alone does not give freeness: the isotropy quotient of auxiliary-level-groups is used.

The R04.5 Taylor–Wiles primes are prime to S, have N(v) ≡ 1 mod p^n and distinct residual Frobenius eigenvalues α_v ≠ β_v; the branch m_Q contains U_v − α̃_v (auxiliary-maximal-ideal). With Δ_Q = Δ′_Q/Δ′_Q[N] as in auxiliary-level-groups, these are the hypotheses of R18.3/tw-localised-control, which gives freeness of rank s and the coinvariant isomorphism through ξ_v.

(Source: [KW2-2009, Corollary 7.5 and its proof, pp. 65–66][KW2-2009]; [GEE-MLT-2022, Proposition 5.8(2) and Proposition 5.9, pp. 36–37][GEE-MLT-2022].) *Needs:* §2.1; §2.2; HilbertModularVarietiesAndShimuraCurves:R18.6; AutomorphicGaloisRepresentations:R19.6; mathlib:Module.Free; mathlib:MonoidAlgebra; §2.3; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control; HilbertModularVarietiesAndShimuraCurves:R18.3/iwahori-selected-root; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness.

**Checks.**

- Q = ∅: the statement is the tautology S(U)_𝔪 = S(U)_𝔪.
- The rank over 𝒪[Δ_Q] does not depend on Q or n, which is what patching needs.
- Gee Proposition 5.9 is the same control statement, ∏_{v∈Q}(U_ϖ_v − B_v) : S_∅ ≅ S(U_{Q,0}, 𝒪)_{𝔪_Q}, with the other eigenvalue B_v.

### 2.10 The system of Hecke modules at Taylor–Wiles levels

For Q_n with fixed cardinality h, define `twModule n` by framing the corresponding localised auxiliary Hecke module over bar-R_(S union Q_n)^psi. It is finite free of rank s over O[Delta_(Q_n)][[y_(h+1),…,y_(h+j)]]. The coefficient map from S_infty agrees with the deformation-ring action by the diamond comparison. Its first-h-variable coinvariants recover M^square, and further killing the j framing variables recovers M. Fix the presentation and all these comparison maps simultaneously for every n.

The patching of the system (M_∞, R_∞) is Layer 3, with DeformationAndDerivedPatchingAlgebra R03.5 and R03.6.

Freeness over 𝒪[Δ_{Q_n}] with the right rank and coinvariants is delta-freeness-at-taylor-wiles-level; tensoring with the framing variables keeps it free. Compatibility of the two 𝒪[Δ]-actions is delta-actions-agree; the y-structure on the ring side is R04.6.

The intended named interface is:

- `twModule`: M_n = S(U_{Q_n})_𝔪 ⊗ R̄^{□,ψ}_{S∪Q_n}.
- `twModule_free`: Finite free over 𝒪[Δ_{Q_n}]⟦y⟧ of rank s.
- `twModule_coinv`: Coinvariants for the first h auxiliary variables recover M^square; killing the j framing variables as well recovers the unframed S(U)_m=M, compatibly with the deformation-ring and Hecke actions.

(Source: [KW2-2009, proof of Proposition 9.2, p. 82][KW2-2009].) *Needs:* §2.9; §2.6; §1.12; GlobalGaloisDeformations:R04.6/taylor-wiles-deformation-system; §1.13; §1.14; §2.5; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control.

**Checks.**

- Q_n = ∅: the system is the framed module of framed-hecke-module.
- The annihilator 𝔟_n of M_n in 𝒪⟦y⟧ lies in ((1 + y_i)^{p^{n−a}} − 1)_{i≤h} (KW II §9.1.3, with 2^a > N for p = 2).
- Without freeness over 𝒪[Δ], the patched module would not be finite free over 𝒪⟦y⟧, and the depth argument of Layer 3 fails.
- Q = ∅ gives the framed module at level U.
- The rank does not depend on n.
- With Δ′ instead of Δ and p-torsion isotropy, freeness can fail.

### 2.11 Freeness and specialization of the module system

Prove uniform finite-level control for the framed rings R_n and modules M_n: the rank over O[Delta_(Q_n)][[framing variables]] is s; the S_infty-action is the restriction of the R_n-action; M_n/J M_n is M^square; and M_n/(all y)M_n is M. Every identification is equivariant for the deformation, local and Hecke maps and uses the same chosen framings. At p-torsion isotropy, the annihilator bound loses the fixed exponent a described in Layer 3; it is not silently replaced by the full unquotiented group-ring relation.

One framing presentation is fixed for all n; the Δ_{Q_n}-module structure comes from the diamond operators and agrees with the Δ′_{Q_n}-action on the ring side through delta-actions-agree.

Base change the finite free O[Δ_Q]-module along the fixed framing presentation. Finite presentation identifies this base change with power series in the j framing variables. Use delta-actions-agree to identify the first h scalar variables with the chosen diamond generators. Their augmentation is the integral coinvariant isomorphism of HilbertModularVarietiesAndShimuraCurves R18.3/tw-localised-control (through delta-freeness-at-taylor-wiles-level). The remaining j variables are the framing variables, so their further augmentation gives M.

(Source: [KW2-2009, Proposition 9.2, proof pp. 81–83][KW2-2009].) *Needs:* §2.10; HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control; §2.6; §1.13.

**Checks.**

- Q_n = ∅: M_n = M^□ and killing the framing variables gives M.
- The rank s over O[Δ_{Q_n}][[y_{h+1},…,y_{h+j}]] does not depend on n, which the patching argument needs.

### 2.12 Dyadic Hecke twists agree with deformation twists

At p=2, compare the deformation twists with the quadratic norm twists on the actual auxiliary functions. Identify the class-field characters in R04 with finite-idelic characters trivial at infinity and on Nrd(U_Q), and use R18's operator formulas. Multiplying Frobenius traces by chi(varpi_v), twisting diamonds by the corresponding order-two character, and fixing framings give the same semilinear action under pi_Q. Since chi²=1 the central character and determinant are unchanged; since chi reduces to 1, the residual branch m_Q is preserved. A nontrivial quadratic character at odd p generally changes the residual branch.

The quadratic character is trivial at the real places and on the specified level norms.

Apply R18.3’s exported order-two idele-character twist and Hecke formulas (Proposition 7.6), after identifying the R04.5 class-field-theory characters with the finite-idelic characters trivial at infinity and unramified outside Q. Their invariance/formula proof stays with R18.3. Since χ ≡ 1 mod 𝔪, the action preserves 𝔪. Compatibility with the R-side twists holds because both sides multiply Frobenius traces by χ(π_v) and act on Δ by χ (Lemma 5.12).

(Source: [KW2-2009, §7.5, Proposition 7.6 and the following paragraph, pp. 66–67][KW2-2009]; [KW2-2009, proof of Lemma 9.1, p. 81][KW2-2009].) *Needs:* §2.2; GlobalGaloisDeformations:R04.4/twisting-action; GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action; GlobalGaloisDeformations:R04.6/dyadic-patching-data; HilbertModularVarietiesAndShimuraCurves:R18.6; §2.4; §2.5; HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist; HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist; HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-level-norm-squares.

**Checks.**

- χ trivial: the identity action.
- (f|⟨h⟩)_χ = χ^{−1}(h)f_χ|⟨h⟩: the diamond operators are twisted by χ^{−1}, matching a_χ ∘ δ = χ(δ)(δ ∘ a_χ).
- For p odd, order-2 characters are not residually trivial, so there is no such action on the localisation.

### Examples

At one auxiliary prime the two distinct roots alpha_v,beta_v select different residual U_v branches. Changing the chosen lift alpha-tilde_v by varpi c leaves the branch unchanged. In the alpha branch the diamond character is gamma_alpha, while in the beta branch it is its inverse on inertia when the determinant is unramified. Empty Q gives the original level, algebra and module.

### Dependencies

Layer 1; R04.5–R04.6 auxiliary deformation systems; R18.3 selected-root control, isotropy quotients and norm twists; R19 local–global compatibility.


## Layer 3: Arithmetic finite patching and the minimal comparison

### 3.1 Patching data of level m from the Taylor–Wiles systems

Define `PatchingDatum m` by adding the arithmetic maps to the R03 Kisin finite patching datum. Use S_infty=O[[y_1,…,y_(h+j)]], J=(y_1,…,y_h), B=bar-R_S^(loc,psi), dim B=d+1, A=B[[x_1,…,x_(h+j−d)]], and the framed minimal objects R^square and M^square. The integer s>0 is rank_O(M), not rank_O(M^square). Require h+j≥d. Put

```text
c_m = (varpi^m, (1+y_i)^(p^m)−1 for i≤h,
 y_(h+i)^(p^m) for i≤j),
r_m = s m p^(m(h+j)).
```

The datum consists of S_infty/c_m→D_m, A→>D_m, a D_m-module L_m finite free of rank s over S_infty/c_m, and equivariant augmentations with D_m/JD_m=R^square/(c_m R^square+m_(R^square)^(r_m)) and L_m→>M^square/c_m M^square. The power-generated maximal ideal m_(D_m)^(r_m) is zero. Isomorphisms and reductions retain both scalar structures, presentation, augmentation, framing and Hecke maps. In the dyadic case the ambient A' has t additional variables before imposing determinant one.

O has finite residue field, B is complete Noetherian local, O-flat, a domain of dimension d + 1 with B[1/p] formally smooth (KW II §9.1.1; LocalGaloisDeformationRings R08.6/export-completed-tensor-product), and all maps are continuous local O-algebra maps. A fixed presentation and all framing choices are part of the datum. For dyadic data replace A by B[[x_1,…,x_{h+j+t−d}]] before taking the determinant-one quotient; m ≥ 3 in the action-chunk construction.

Instantiate DeformationAndDerivedPatchingAlgebra R03.5/kisin-patch-datum with the displayed parameters; its cutoff ideal, element-power ideal and finite-free module condition are used unchanged. Add the arithmetic augmentation, framing and Hecke maps; reduction from level m + 1 to m is the owner's reduction together with the reduction of these maps. That the actual Taylor–Wiles system gives such data is finite-level-patching-realization.

The intended named interface is:

- `PatchingDatum`: The displayed level-m rings, module, presentations, scalar maps and augmentation maps.
- `PatchingDatum.reduce`: The level-(m+1) datum reduces via D/(c_m+m_D^{(r_m)}) and L/c_m, preserving every structure map.
- `PatchingDatum.isomorphism`: An isomorphism preserves both coefficient maps, the A-presentation, the R-augmentation, the module action and the augmentation to M^□/c_m.

(Source: [KISIN-FFLAT-2009, Proposition (3.3.1), proof pp. 62–64, equations (3.3.2)–(3.3.3)][KISIN-FFLAT-2009]; [KW2-2009, proof of Proposition 9.3, pp. 84–86][KW2-2009].) *Needs:* §2.10; GlobalGaloisDeformations:R04.6/taylor-wiles-deformation-system; GlobalGaloisDeformations:R04.6/patching-numerology; DeformationAndDerivedPatchingAlgebra R03.5/characteristic-zero-open-quotient-patching; §2.11; DeformationAndDerivedPatchingAlgebra R03.5/kisin-patch-datum.

**Checks.**

- For h=0 and Q_n empty with fixed framings, the untruncated input system is constant in n; its quotients still vary with m.
- The rank s of L_m over 𝒪⟦y⟧/c_m does not depend on m or n.
- The shifted bound b_(n+a)⊆((1+y_i)^(p^n)−1:i≤h) is needed for the prescribed free scalar quotient; using an unshifted full-Delta relation can fail with p-torsion isotropy.
- For s=1,p=3,m=2,h+j=1 one has r_m=18.
- Over F₂[[x,y]], m^{(2)}=(x²,y²), whereas m² also contains xy.
- The identity of the underlying finite module is not a datum isomorphism unless it intertwines the specified S∞ and D_m actions.
- The ordinary-power bound with b=2 and r_m=3 is m^6⊆(element-wise cubes); degree-six monomials have an exponent at least three.

### 3.2 Arithmetic realization of each finite patching level

Choose once a with p^a>N; at p=2 also impose a≥2. For n sufficiently large relative to m, use the shifted level n+a and set D_(m,n)=R_(n+a)/(c_m R_(n+a)+m_(R_(n+a))^(r_m)) and L_(m,n)=M_(n+a)/c_m M_(n+a). At p=2 take n≥m≥3 and the further fixed lower bound from the global twist data. The actual annihilator b_l is contained in ((1+y_i)^(p^(l−a))−1:i≤h), so b_(n+a) is contained in c_m. This makes L_(m,n) free of rank s over the prescribed finite scalar quotient.

If m_A has b generators, put r'_m=b r_m. The pigeonhole bound m_A^(b r_m)⊆m_A^(r_m), with the left side the ordinary power and the right side the power-generated ideal, makes D_(m,n) a quotient of the finite ring A/m_A^(r'_m). Prove all augmentations and scalar equivariances. The nilpotence estimate defining the D-action is the one for the actual finite module, rather than an assumption of freeness over the unquotiented Delta'_Q.

N is the isotropy exponent of KW II §7.4 and a is fixed with p^a > N (a ≥ 2 at p = 2); M_ℓ is finite free over O[[y]]/𝔟_ℓ of rank s with 𝔟_ℓ ⊂ ((1+y_i)^{p^{ℓ−a}} − 1)_{i≤h} for ℓ > a (Corollary 7.5).

Use Δ_Q=Δ′_Q/Δ′_Q[N] and the fixed shift a, so that reduction of M_{n+a} modulo c_m is free of rank s. The unshifted level-n bound with p^n is not available for the isotropy quotient. A maximal-ideal element acts nilpotently on the s-dimensional residual augmentation of M_n. The nilpotence estimate in Kisin (3.3.1) gives its r_m-th power zero on L_{m,n}; thus the D_{m,n}-action is defined. Surjectivity of the global presentation gives A↠D_{m,n}. The pigeonhole bound on b maximal-ideal generators gives m_A^{b r_m}⊂m_A^{(r_m)}, yielding a finite ambient truncation. Quotient the known augmentation kernels and retain all scalar actions.

(Source: [KW2-2009, Proposition 9.2 proof, pp. 81–83; Proposition 9.3 proof, pp. 84–86][KW2-2009].) *Needs:* §3.1; §2.11; GlobalGaloisDeformations:R04.6/taylor-wiles-deformation-system; DeformationAndDerivedPatchingAlgebra R03.5/kisin-patch-datum.

**Checks.**

- If the isotropy groups have order prime to p (Gee's case p ≥ 5 unramified), Δ_v = Δ′_v and 𝔟_n ⊂ ((1+y_i)^{p^n} − 1) without a shift, which is Kisin's unshifted D_{m,n} = R_n/(c_mR_n + m^{(r_m)}); the shift by a is needed only when the isotropy groups have p-torsion.
- For b = 2 generators and r_m = 3, m_A^6 ⊂ m_A^{(3)}: a monomial of degree 6 in two generators has an exponent at least 3.

### 3.3 Finite stabilization with all comparison maps

At each m prove finiteness of isomorphism classes of the entire structured data, not just of their underlying rings and modules. Both A/m_A^(r'_m) and S_infty/c_m are finite, and the rank and all map domains are bounded. Choose a diagonal subsequence with compatible identifications under reduction. Ring reduction is by c_m+m_D^(r_m); module reduction is by c_m. Every local, scalar, augmentation and Hecke square must commute. For the dyadic construction retain also the determinant map, free action chunks, ambient embeddings and small-kernel comparison. These are part of the finite data that must stabilise together.

Each level-m datum is a finite set of finite rings, modules and maps of bounded cardinality (a quotient of A/m_A^{r′_m} and a free S∞/c_m-module of rank s with chosen basis), so there are finitely many isomorphism classes.

A/m_A^{r′_m} and S∞/c_m are finite sets, so there are finitely many ring quotients, free-module action tables and structure maps of the required cardinalities. The same argument applies to the truncated dyadic action data. At successive m choose infinite subsequences and identifications of the complete structured data, not just their isomorphism classes after forgetting maps. Diagonalize and choose compatible reductions. Apply the owner’s cofinal open-quotient patching with scalar action through the deformation ring. The ideals contain powers of the full maximal ideal; no passage using only π-power truncations is made.

(Source: [KW2-2009, Proposition 9.3 proof, pp. 86–87][KW2-2009].) *Needs:* §3.2; DeformationAndDerivedPatchingAlgebra R03.5/characteristic-zero-open-quotient-patching; DeformationAndDerivedPatchingAlgebra R03.5/finite-decorated-data; DeformationAndDerivedPatchingAlgebra R03.5/patching-extraction.

**Checks.**

- Stabilising isomorphism classes after forgetting the Hecke or augmentation maps would not give compatible transition maps on those structures in the limit.
- At p = 2 the determinant map, the action chunk and the comparison D″_m ↠ D_m are stabilised together with the pair (D_m, L_m).

### 3.4 The patched ring and module

Apply structured patching to obtain A→>R_infty→>R^square, the S_infty-algebra structure on R_infty and a compatible R_infty-module M_infty finite free of rank s>0 over S_infty. Prove R_infty/JR_infty=R^square and M_infty/JM_infty=M^square equivariantly for the local, framing and Hecke structures. Killing all h+j variables gives the unframed ring R and module M. The inverse limits are taken along the compatible finite reductions just constructed; their existence is not inferred from unstructured isomorphism classes.

Use the fixed presentations, positive constant rank s, scalar-compatible module actions and the full structured stabilization. The limit construction is DeformationAndDerivedPatchingAlgebra R03.5/kisin-ring-module-patching (Kisin Proposition (3.3.1)); this theorem applies it to the arithmetic data and carries the augmentation, framing and Hecke maps through the limit.

Apply DeformationAndDerivedPatchingAlgebra R03.5/kisin-ring-module-patching to the arithmetic data of finite-level-patching-realization, stabilised by patching-data-finite-and-compatible: R∞ = lim D_m and M∞ = lim L_m along the transition maps, with A ↠ R∞ from the A-presentations. Pass the augmentation identities and scalar action diagrams to the limit: R∞/J≅R̄_S^{□,ψ}, M∞/J≅M^□. Killing the framing variables recovers the unframed ring and module. Freeness over S∞ follows from the compatible rank-s trivializations.

(Source: [KW2-2009, Proposition 9.2 (I), p. 81][KW2-2009]; [GEE-MLT-2022, §5.6, p. 40][GEE-MLT-2022].) *Needs:* §3.1; §1.12; DeformationAndDerivedPatchingAlgebra R03.5/characteristic-zero-open-quotient-patching; §1.13; §1.14; §3.2; §3.3; DeformationAndDerivedPatchingAlgebra R03.5/kisin-ring-module-patching.

**Checks.**

- With h = 0, R_∞ = R̄^{□,ψ}_S and M_∞ = M^□.
- M_∞/(y_1, …, y_{h+j}) ≅ S_{k,ψ}(U, 𝒪)_𝔪.
- Integral and inverted-π assertions are kept separate: M_∞ is free over 𝒪⟦y⟧ integrally.

### 3.5 Support of the patched module

For these data show dim R_infty≤1+h+j and depth_(R_infty)(M_infty)≥1+h+j. The nonzero finite module therefore has support a union of maximal-dimensional irreducible components. When B is an O-flat domain of dimension d+1, A=B[[x]] is a domain of dimension 1+h+j. The finite action image contains S_infty faithfully and has that dimension; consequently the composite A→R_infty→End(M_infty) has zero kernel. Thus A=R_infty and M_infty is faithful with full support. For reducible B retain only the union-of-components conclusion until an independent component argument supplies the missing components.

R∞ is complete Noetherian local; M∞≠0 is finite over R∞ and finite free of positive rank over the regular local S∞. The S∞ scalar action factors through R∞. The image of R∞ in End_{S∞}(M∞) is finite over S∞. Use the Global R04.6 dimension upper bound dim R∞≤1+h+j. For the stronger isomorphism assume B is an O-flat domain of dimension d+1, so A=B[[x]] is a domain of dimension 1+h+j. Use DeformationAndDerivedPatchingAlgebra R03.5/kisin-patching-criterion (regular-base depth and dimension), the R03.3 finite-map depth comparison for the action image and the R03.6 maximal-CM component-support theorem. No full-support claim is inferred from maximal depth alone when A is reducible.

Pass to the finite action image to compare depth with S∞; this yields depth_{R∞}M∞≥1+h+j. The dimension inequality makes M∞ maximal Cohen–Macaulay, so its support is a union of top-dimensional components. In the domain case the action image has dimension 1+h+j because it is finite over, and contains faithfully, S∞. A nonzero kernel in A would lower the dimension. Thus A→R∞→End(M∞) is injective and A≅R∞ with faithful module. In the reducible case retain only the union-of-components conclusion until the separate component-matching or Ihara-avoidance target proves every component occurs.

(Source: [KW2-2009, proof of Proposition 9.2 (II), p. 83][KW2-2009]; [GEE-MLT-2022, §5.6, pp. 40–41][GEE-MLT-2022].) *Needs:* §3.4; GlobalGaloisDeformations:R04.6/patching-numerology; DeformationAndDerivedPatchingAlgebra R03.6/nearly-faithful-and-component-support-conclusions; DeformationAndDerivedPatchingAlgebra R03.3/finite-map-cm-transfer; DeformationAndDerivedPatchingAlgebra R03.3/cohen-macaulay-and-full-support; DeformationAndDerivedPatchingAlgebra R03.3/cm-completion-and-equidimensionality; DeformationAndDerivedPatchingAlgebra R03.5/kisin-patching-criterion.

**Checks.**

- Gee's setting: dim R_∞ = dim J_∞ = 4#T + r, and R′_∞ has a unique minimal prime, so Supp S′_∞ = Spec R′_∞.
- If B has several components (for example with an inertia-rigid place), the support is only known to be a union of components; component matching is Layer 4.
- Maximal depth alone does not give full support: R03.6's example k⟦x, y⟧/(xy) with M = A/(x).
- For A=k[[x,y]]/(xy), the module A/(x) is maximal Cohen–Macaulay of dimension one but misses the other component; maximal depth alone does not give full support.

### 3.6 Finiteness of the minimal deformation ring

In the domain case, prove R^square finite over O[[y_(h+1),…,y_(h+j)]] and R finite over O. Faithfulness embeds R_infty into the finite S_infty-module End_(S_infty)(M_infty), giving finiteness over S_infty, and the two successive augmentations give the assertions. This theorem concerns the minimal ring of the specified modular residual representation. It does not assert finiteness for arbitrary residual representations or finiteness of the framed ring over O when j>0.

R_∞ ≅ B⟦x⟧ acts faithfully on M_∞, which is finite over 𝒪⟦y⟧, so R_∞ is finite over 𝒪⟦y⟧ (DeformationAndDerivedPatchingAlgebra R03.4/finite-of-faithful-finite-module). Killing y_1, …, y_h gives R̄^{□,ψ}_S finite over 𝒪⟦y_{h+1}, …, y_{h+j}⟧; killing the framing variables gives R̄^ψ_S finite over 𝒪.

(Source: [KW2-2009, Proposition 9.2 (II), p. 81][KW2-2009].) *Needs:* §3.5; DeformationAndDerivedPatchingAlgebra R03.4/finite-of-faithful-finite-module.

**Checks.**

- R̄^{□,ψ}_S itself is never finite over 𝒪 (it has j = 4|S| − 1 framing variables).
- With finiteness and dim ≥ 1 (GlobalGaloisDeformations R04.3), R̄^ψ_S has characteristic-zero points.
- The statement is for the minimal-level ring of a modular ρ̄ only.

### 3.7 R = T after inverting p

Under the domain and generic-regularity hypotheses, prove that the framed surjection R^square→T^square has kernel killed by one power of p, and hence becomes an isomorphism after inverting p. The same holds after unframing. Localise the finite-map depth comparison at the generic-fibre primes and apply Auslander–Buchsbaum, with the patching dimension equality, to obtain a faithful finite projective M_infty[1/p] of positive local rank over R_infty[1/p]. This property survives augmentation and identifies its Hecke action image. Finite generation of the kernel makes the torsion exponent uniform. The integral conclusion at this point is identification of the maximal O-flat quotient with T.

B is O-flat, a domain and has regular generic fibre; R∞≅B[[x]] is Noetherian and its generic fibre is regular. M∞ is nonzero, finite over R∞, free of positive rank over S∞=O[[y_1,…,y_{h+j}]], with the S∞ action factoring through R∞. Use the finite action image, localize at each prime and apply the owner’s finite-map depth comparison and Auslander–Buchsbaum. The dimension equality and regular scalar parameters are part of the patching numerology; regularity of the ring alone does not make every finite module projective.

R∞≅B[[x]] by the domain dimension argument. The local deformation supplier gives regularity of R∞[1/p]. M∞[1/p] is finite projective and faithful over R∞[1/p]: this is the conclusion of DeformationAndDerivedPatchingAlgebra R03.5/kisin-characteristic-zero-patching for the arithmetic data, whose proof uses the R03.3 finite-map depth comparison and Auslander–Buchsbaum at each point; its local rank is positive by patched-support. The augmentation R∞ → R̄_S^{□,ψ} is the quotient by J, and base change preserves a finite projective module of positive rank, hence faithfulness after inverting p. Its action factors through the framed Hecke image, so the kernel of R̄_S^{□,ψ} → 𝕋^□ is p-power torsion (DeformationAndDerivedPatchingAlgebra R03.6/torsion-in-kernel); finite generation gives a single power, and unframing gives the unframed comparison.

(Source: [KW2-2009, Proposition 9.2 (III) and its proof, pp. 81 and 83][KW2-2009].) *Needs:* §3.5; §1.10; DeformationAndDerivedPatchingAlgebra R03.6/faithful-quotient-ring-identification; DeformationAndDerivedPatchingAlgebra R03.6/maximal-flat-quotient; DeformationAndDerivedPatchingAlgebra R03.3/depth-auslander-buchsbaum-and-dimension-bounds; DeformationAndDerivedPatchingAlgebra R03.3/finite-map-cm-transfer; DeformationAndDerivedPatchingAlgebra R03.3/regularity-localization-and-descent; DeformationAndDerivedPatchingAlgebra R03.5/kisin-characteristic-zero-patching; DeformationAndDerivedPatchingAlgebra R03.6/torsion-in-kernel.

**Checks.**

- Since T is O-flat and reduced, the comparison identifies the maximal O-flat quotient of R̄_S^ψ with T (R03.6/maximal-flat-quotient and faithful-quotient-ring-identification).
- The integral isomorphism needs more: see integral-r-equals-t-when-smooth (Layer 4).
- If B is not a domain, one gets only a component-by-component statement (Layer 4).

### Examples

With s=1,p=3,m=2 and h+j=1, r_m=18. If m_A has two generators and r_m=3, ordinary degree-six monomials have a cube factor, giving m_A^6⊆m_A^(3). Over F₂[[x,y]], xy is in the ordinary square but not in (x²,y²), so those two truncation conventions cannot be interchanged.

### Dependencies

Layers 1–2; R03.1 and R03.3–R03.6 finite structured patching, depth, support and torsion kernels; R04 numerical presentations; R08.6 local tensors.


## Layer 4: Avoidance and integral refinements

### 4.1 Two deformation problems that agree modulo λ

Construct an avoidance pair from one global residual problem, with identical auxiliary primes, framings, coefficient lattices and determinant. At each place v of T_r away from p assume the local residual representation is trivial and N(v)≡1 mod p. On one side impose inertial polynomial (X−1)²; on the other impose (X−zeta)(X−zeta^(-1)) for a chosen primitive p-th root zeta in the enlarged coefficient field. Use the specified local quotients and matching automorphic coefficient characters. Include their finite comparison maps in the arithmetic data. The generic types differ, while zeta≡1 mod varpi makes the residual data agree.

The local geometry used is LocalGaloisDeformationRings R08.2/ihara-avoidance-components (Taylor II Proposition 3.1): (R^{loc,′})^red is irreducible, O-flat of Krull dimension 1 + 3#T + [F : ℚ], and the components of R^loc biject with those of R^loc/λ. This is Taylor's Ihara avoidance, which replaces Ihara's lemma in passing to nonminimal levels.

Use Local R08.2’s avoidance rings with their specified residual identifications and the compatible global local-condition quotients. Choose corresponding coefficient lattices/levels and the same auxiliary primes and framings for the two problems. Include their comparison maps in the finite structured data. The special-fibre comparison theorem verifies that these maps induce the required equivariant isomorphisms; local generic component geometry is imported from R08.2/ihara-avoidance-components.

The intended named interface is:

- `avoidancePair`: The problems 𝒮_Q and 𝒮′_Q with their local rings and levels.
- `avoidancePair_mod_lambda`: R^loc/λ = R^{loc,′}/λ and S/λ = S′/λ.
- `avoidancePair_irreducible`: (R^{loc,′})^red is irreducible.

(Source: [GEE-MLT-2022, §5.6, pp. 33–35][GEE-MLT-2022].) *Needs:* §3.4; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components.

**Checks.**

- T_r = ∅: the two problems coincide.
- Each ring's generic fibre sees a different inertial type (unipotent versus (ζ, ζ^{−1})), although the special fibres coincide.
- Without #k(v) ≡ 1 mod p there is no nontrivial ζ-type at v.
- T_r = ∅ gives equal problems.
- The local conditions agree modulo λ.
- The generic fibres carry different inertial types.

### 4.2 Transfer of full support across the special fibre

Use the primed local geometry and maximal depth to obtain full support of M'_infty. Transfer it across the equivariant special-fibre isomorphisms. The unprimed support is already a union of components; the local generic/special component correspondence forces this union to include every component. Therefore M_infty has full support, and the support theorem for augmentation descends this to the unpatched minimal module. This is near faithfulness; nilpotent annihilators have not been eliminated.

The components of Spec R_∞ versus Spec R_∞/λ come from R^loc (R08.2/ihara-avoidance-components, Gee Theorem 3.38). The lift of near faithfulness from the special fibre and its descent along the patching ideal are DeformationAndDerivedPatchingAlgebra R03.6.

R′_∞ has a unique minimal prime and S′_∞ has maximal depth, so its support is all of Spec R′_∞ (patched-support, R03.6/maximal-cm-nearly-faithful-irreducible). Reduce mod λ: S′_∞/λ = S_∞/λ and R′_∞/λ = R_∞/λ, so S_∞/λ has full support. Supp S_∞ is a union of components (maximal depth) containing all of Spec R_∞/λ, and the components biject, so Supp S_∞ = Spec R_∞ (R03.6/nearly-faithful-lift-from-special-fibre). Descend along 𝔞_∞ = (𝔞, y_1, …, y_r) (R03.6/patching-nearly-faithful-descends).

(Source: [GEE-MLT-2022, §5.6, p. 41][GEE-MLT-2022].) *Needs:* §4.1; §3.5; DeformationAndDerivedPatchingAlgebra R03.6/nearly-faithful-and-component-support-conclusions; §4.5; DeformationAndDerivedPatchingAlgebra R03.6/completion-generic-special-components.

**Checks.**

- T_r = ∅: the primed and unprimed problems agree, and the argument is patched-support.
- The unprimed R^loc may have several components (unipotent types); the primed one is irreducible, which is the point of the comparison.
- The conclusion is support, that is near faithfulness, not an integral R = T.

### 4.3 Modularity from full support

Suppose the finite minimal Hecke module has full support over its Noetherian deformation ring. Its Hecke algebra is its faithful action image, finite, reduced and O-flat. Prove that the kernel R→T is nilpotent and R^red=T. Every O-point of this particular local-condition ring kills nilpotents, factors through T, and therefore comes from a cuspidal automorphic representation of the specified weight and type. This is a modularity theorem for those points, not for lifts with different local conditions.

𝕋_∅ acts faithfully on S_∅ by definition; the ring-theoretic step is DeformationAndDerivedPatchingAlgebra R03.6 (r-to-t-kernel-nil, r-red-equals-t-red).

Full support means S_∅ is nearly faithful over R^univ_∅ (DeformationAndDerivedPatchingAlgebra R03.6/nearly-faithful-iff-support-eq-univ), so the kernel of R^univ_∅ → 𝕋_∅ ⊆ End(S_∅) is nil (R03.6/r-to-t-kernel-nil). An 𝒪-point of R^univ_∅ factors through the reduced quotient, which is 𝕋_∅, and 𝒪-points of 𝕋_∅ are eigenforms (R18.3 via R18.6, Jacquet–Langlands).

(Source: [GEE-MLT-2022, Lemma 5.7, p. 35][GEE-MLT-2022].) *Needs:* §4.2; DeformationAndDerivedPatchingAlgebra R03.6/faithful-quotient-ring-identification; HilbertModularVarietiesAndShimuraCurves:R18.6; DeformationAndDerivedPatchingAlgebra R03.6/nearly-faithful-iff-support-eq-univ.

**Checks.**

- This is Gee Lemma 5.7.
- Only the reduced quotient is identified: nilpotents in R^univ_∅ are not excluded.
- The conclusion is modularity of points of the given type, not of arbitrary lifts.

### 4.4 When the R = T statement is integral

If B is formally smooth over O in the minimal domain situation, prove the stronger integral conclusion. The patched ring A=R_infty is regular and M_infty has maximal depth, so it is finite free of positive rank. Its full augmentation gives a free faithful R-module M, whence R=T integrally, M is free over T, and R is a complete intersection. More generally, transfer Cohen–Macaulay, Gorenstein or complete-intersection properties from the local factors only in the KW global presentation with its exact generator–relation bound and dimension equality, together with finiteness of R over O. That equality puts the relations, framing parameters and varpi in a system of parameters; arbitrary finite quotients of a Cohen–Macaulay ring do not satisfy the conclusion.

Maximal depth over a regular local ring gives freeness (DeformationAndDerivedPatchingAlgebra R03.3/free-of-maximal-depth-regular-local); integral R = T from a free module is R03.6/r-equals-t-of-free and patched-module-r-equals-t. The Cohen–Macaulay/Gorenstein/complete-intersection clause is in the KW II global deformation presentation with its generator–relation dimension bound, not an arbitrary finite quotient of B⟦x⟧.

R_∞ ≅ B⟦x⟧ is regular, and M_∞ has maximal depth, so M_∞ is free over R_∞ (R03.3). M_∞ is free over R_∞, and y_1, …, y_{h+j} is regular on it, so S(U)_𝔪 = M_∞/(y) is free over R_∞/(y) = R̄^ψ_S. Hence R̄^ψ_S → 𝕋 is an isomorphism (R03.6/r-equals-t-of-free). For the additional CM/Gorenstein/CI clause, use the Global R04.3 fixed-determinant presentation and the explicit KW II Proposition 4.5/Lemma 4.6 bound. Let g be the number of added variables, r the number of displayed relations and j the framing dimension. Finiteness over O gives dim R̄^□=j+1. The dimension lower bound and the relation bound force dim(B[[x]])=j+1+r. The relations together with j framing parameters and π form a system of parameters. When B is CM they are a regular sequence; the owner’s regular-quotient and type/base-change facts transfer CM, Gorenstein and CI as applicable. Finiteness without that equality is insufficient. Complete intersection: a regular ring modulo a regular sequence.

(Source: [KW2-2009, §4.2, remarks after Lemma 4.6, p. 45][KW2-2009].) *Needs:* §3.5; DeformationAndDerivedPatchingAlgebra R03.3/depth-auslander-buchsbaum-and-dimension-bounds; DeformationAndDerivedPatchingAlgebra R03.6/faithful-quotient-ring-identification; LocalGaloisDeformationRings:R08.6; GlobalGaloisDeformations:R04.3/local-to-global-presentation; GlobalGaloisDeformations:R04.3/global-dimension-lower-bound; DeformationAndDerivedPatchingAlgebra R03.3/dimension-count-ci-flatness; DeformationAndDerivedPatchingAlgebra R03.3/flat-depth-dimension-formulas; DeformationAndDerivedPatchingAlgebra R03.3/gorenstein-local-rings; DeformationAndDerivedPatchingAlgebra R03.3/canonical-type-and-base-change.

**Checks.**

- Wiles and Taylor–Wiles minimal case: R ≅ 𝕋 is a complete intersection.
- With a non-smooth local factor (for example Savitt's 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p)), only the generic-fibre statement generic-fibre-r-equals-t is obtained without further input.
- Faithfulness of S(U)_𝔪 over R̄ is exactly equivalent to integral R = T (R03.6/r-equals-t-free); freeness is stronger.

### 4.5 Special-fibre comparison for the avoidance pair

Prove equivariant isomorphisms between the two finite-level local/global rings and Hecke modules modulo varpi for the chosen avoidance pair. The local comparison uses precisely the specified avoidance quotients, not merely equality of their written residual characteristic polynomials. Choose one common stabilising subsequence carrying these maps. Finite quotient compatibility then gives R_infty/varpi=R'_infty/varpi and M_infty/varpi=M'_infty/varpi, preserving the common local and S_infty-actions. Independent choices of patching subsequence do not suffice.

At v ∈ T_r, ρ̄|G_{F_v} is trivial and #k(v) ≡ 1 mod p; ζ is a fixed primitive p-th root of unity in L, so ζ ≡ 1 mod λ. The same auxiliary primes Q, framings and coefficient choices are used for both problems.

The chosen root ζ reduces to one; the specified local quotients therefore have the same special fibre by the local avoidance theorem. The chosen coefficient characters and their lattices also reduce compatibly. Apply the global quotient universal property and the equivariant finite-level coefficient comparison with identical primes and labels. Add these maps and their commuting squares to the finite structured isomorphism classes before passing to a common subsequence. The compatible inverse limit and finite-module quotient exactness identify the two patched special fibres and modules with their common scalar action. Patching unrelated subsequences would not provide these comparisons.

(Source: [GEE-MLT-2022, §5.6, pp. 33–35 and 40–41][GEE-MLT-2022].) *Needs:* §4.1; §3.4; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; LocalGaloisDeformationRings:R08.2/ihara-avoidance-rings-p2.

**Checks.**

- T_r = ∅: the two problems coincide and the comparison is the identity.
- If the two patching systems were stabilised along unrelated subsequences, the mod-λ identification of R∞ and R′∞ would not follow.

### Examples

For A=k[[x,y]]/(xy), A/(x) has maximal depth and support on only one component. Avoidance must supply the missing component; depth alone does not. Full support yields a nilpotent annihilator, while a nonzero nilpotent can still survive before passing to the reduced quotient.

### Dependencies

Layers 1–3; R08.2 avoidance geometry; R03.3 and R03.6 specialisation, component support and complete-intersection criteria; R18 coefficient characters.


## Layer 5: Classical lifting at odd primes

### 5.1 Reduction to a solvable totally real extension

For continuous rho over a totally real F, prescribe finite Galois completions L_v/F_v at finitely many finite places and real completions at infinity. Construct a totally real, solvable Galois F'/F with those completions, disjoint from a specified finite extension. Include the fields of bar-rho and mu_p in that extension to preserve the full residual image and cyclotomic absolute irreducibility. Assuming rho restricted to F' is irreducible, prove modularity over F equivalent to modularity over F'. Apply this to kill finite inertia away from p, leave unipotent inertia for rho, remove residual ramification away from p, and arrange even degree and the required p-adic splitting. The existence theorem and the automorphic descent theorem have separate hypotheses: descent is along the solvable tower, with the character ambiguity identified by Clifford theory and removed by the automorphic character twist.

Existence of the field is not an automorphic statement: it is Clozel–Harris–Taylor's Lemma 4.1.2 (§1.3; Gee quotes it as Fact 4.27), and in the allowable case §1.4. The descent of modularity along soluble extensions (Gee Proposition 4.25, from Langlands' cyclic base change and strong multiplicity one) is supplied by GL2AutomorphicRepresentationsAndTransfer R17.4. KW II call such extensions allowable base changes; Kisin calls them admissible extensions. For the modularity equivalence impose that ρ|G_{F′} is irreducible, as in Gee Proposition 4.25 (automatic under the retained residual-image hypotheses used here). Local prescription and preservation of the residual image require separate finite splitting conditions.

Existence: Clozel–Harris–Taylor's Lemma 4.1.2 with the real places of F in the prescribed set (E_v = ℝ) gives a totally real soluble Galois F′/F with F′_w ≅ L_v, linearly disjoint from a given finite Galois extension; taking that extension to contain the field cut out by ρ̄ and μ_p keeps the residual image and cyclotomic irreducibility, as in §1.4, which adds evenness and the conditions at p. Modularity descends: for a cyclic step E/F, if ρ|G_E ≅ ρ_π then π ∘ σ ≅ π by strong multiplicity one, so π is a base change from F, and ρ ≅ ρ_{π′} ⊗ χ for a character χ by Schur's lemma; induct along the solvable tower. Unipotent inertia: by Grothendieck's monodromy theorem ρ|I_v acts unipotently on an open subgroup of I_v, which a finite L_v cuts out.

(Source: [GEE-MLT-2022, Proposition 4.25 and Fact 4.27, p. 29][GEE-MLT-2022].) *Needs:* §1.6; §1.4; §1.3; GL2AutomorphicRepresentationsAndTransfer:R17.4.

**Checks.**

- F = ℚ, L_3 = ℚ_3(√−3): F′ = ℚ(√6) works, since 6/(−3) = −2 is a square in ℚ_3; ℚ(√−3) itself is not allowed, as F′ must be totally real.
- Modularity of ρ|G_{F′} descends to ρ only because F′/F is solvable: for a non-solvable F′/F descent is not available.
- Without linear disjointness the image hypothesis can fail over F′: if ρ̄ is induced from a real quadratic K/F with K ≠ F(√p*), then ρ̄|G_{F(ζ_p)} can be irreducible while ρ̄|G_{F′} is reducible for F′ ⊇ K.

### 5.2 Patching on a chosen local component

Let B be the completed tensor of fixed local component quotients B_v over a common O and residue field. Require each B_v to be O-flat with geometrically integral, formally smooth generic fibre. Let R_B be the corresponding framed global quotient and let an actual modular Hecke point and module factor through these same components. With the compatible Taylor–Wiles system, prove that R_B→T^square has p-power-torsion kernel and that the framed automorphic module over R_B[1/p] is finite projective and faithful. Thus every integral point on those components is modular. The completed-tensor theorem and characteristic-zero depth comparison are required, and geometric integrality is retained under coefficient enlargement. Merely knowing that rho and the modular point have the same inertial type does not identify their ordinary/nonordinary components or the selected ordinary quotient character.

For KW II's rings B_v is the whole ring R̄^{□,ψ}_v (Layer 3). Kisin's refinement chooses B_v to be one irreducible component: the potentially Barsotti–Tate lifts of a fixed type, ordinary or not ordinary, whose geometry is supplied by LocalGaloisDeformationRings R08.4 (and at p = 2 from R08.5).

Import the completed-tensor theorem for complete Noetherian O-flat local algebras with geometrically integral, formally smooth generic fibres and the stated common coefficient/residue field. Use the fixed quotient components and coefficient enlargements; integrality of individual generic fibres without geometric integrality is insufficient. Kisin Proposition (3.3.1) with this B: patching (§3.4, with R^{□,loc} replaced by B) gives B⟦x⟧ ↠ R_∞ and M_∞ finite free over 𝒪⟦y⟧ of equal dimension; DeformationAndDerivedPatchingAlgebra R03.5/kisin-characteristic-zero-patching (Kisin Proposition (3.3.1) with Lemma (3.3.4), Auslander–Buchsbaum through R03.3) makes M_∞ ⊗ E projective and faithful over B⟦x⟧[1/p], and B⟦x⟧ ≅ R_∞. Reduce modulo (y_1, …, y_h) to obtain the faithfulness of M ⊗ E over R_B[1/p] (Kisin Theorem (3.4.11)); modular points are then all of Spec R_B[1/p].

(Source: [KISIN-FFLAT-2009, Proposition (3.3.1), p. 62; Theorem (3.4.11) and Lemma (3.4.12), pp. 69–70][KISIN-FFLAT-2009]; [KISIN-FFLAT-2009, Lemma (3.4.12), p. 69][KISIN-FFLAT-2009].) *Needs:* §3.4; §3.5; §3.7; §2.10; LocalGaloisDeformationRings:R08.4; DeformationAndDerivedPatchingAlgebra R03.3/depth-auslander-buchsbaum-and-dimension-bounds; LocalGaloisDeformationRings:R08.4/rank-two-bt-components; DeformationAndDerivedPatchingAlgebra R03.4/completed-tensor-domains-and-components; DeformationAndDerivedPatchingAlgebra R03.5/kisin-characteristic-zero-patching.

**Checks.**

- B_v = R̄^{□,ψ}_v for KW II's conditions recovers §3.7.
- If the modular point and ρ lie on different components (one ordinary, the other not), the lemma says nothing: this is why Kisin matches ordinarity.
- Geometric integrality matters: an integral but not geometrically integral B[1/p] can split into several components after enlarging E.

### 5.3 Strong residual modularity

For p>2 define `StronglyResiduallyModular rho` to require all three of the following. The lift is potentially Barsotti–Tate at every v|p; det rho=epsilon times a finite-order character; and there is an actual parallel-weight-two Hilbert eigenform f with bar-rho_f isomorphic to bar-rho, with f not special at any v|p and rho_f potentially ordinary at exactly the places where rho is potentially ordinary. The quantifier ranges over a single global witness satisfying every local condition at once. The predicate does not merely assert that bar-rho occurs at some weight.

The potentially Barsotti–Tate and potentially ordinary predicates, and determinant convention, are those of Kisin (3.5.4).

Use actual Hilbert eigenform and local representation data; the predicate remembers existence of a witness, not a choice of component. Component matching requires the further character conditions in component-patching.

The intended named interface is:

- `StronglyResiduallyModular`: The existential predicate with all the stated local and determinant conditions.
- `strongResidual_witness`: A proof supplies a weight-two residual modularity witness not special above p, with the specified ordinarity equivalence.
- `strongResidual_of_witness`: The pBT conditions, finite-order determinant factor and such an f yield the predicate.

(Source: [KISIN-FFLAT-2009, (3.5.4)–Theorem (3.5.5), pp. 72–73][KISIN-FFLAT-2009].) *Needs:* §1.6; LocalGaloisDeformationRings:R08.4/rank-two-bt-components.

**Checks.**

- The witness must match ordinarity at every v|p, not merely somewhere above p.
- This definition alone does not choose between two ordinary components for split distinct residual characters.
- A weight-two Hilbert eigenform not special above p, whose representation is pBT with the required determinant, witnesses strong residual modularity of its own representation.
- A witness ordinary at v cannot witness strong residual modularity of a nonordinary ρ there.
- A form special at a place above p is excluded even if its residual representation matches.

### 5.4 The Khare–Wintenberger lifting theorem for odd p

Prove the following conditional lifting theorem. Let p>2 and let F be totally real and unramified at p; require splitting at p in the residual locally irreducible or residual Serre-weight-p+1 branches. Fix the KW lifting datum and determinant psi epsilon. Suppose bar-rho restricted to G_(F(mu_p)) is absolutely irreducible and has both `ResidualModularAlpha` and `ResidualModularBeta`. Let rho lift it, be totally odd and ramify at only finitely many places. At every p-adic place its condition is one of: (A) crystalline with weights {0,k−1}, 2≤k≤p+1, allowing k=p+1 here only when the residual Serre weight is p+1; (B) weight two and crystalline over Q_p^nr(mu_p); (C) semistable noncrystalline weight two, upper triangular with diagonal gamma_v epsilon and gamma_v for an unramified gamma_v. Then rho is modular. First make the local datum uniform by allowable base change, obtain the fitting automorphic point, and apply the generic-fibre comparison for that datum before descending. Type (B) is a specific potentially Barsotti–Tate condition, not the entire potentially Barsotti–Tate locus. Neither potential modularity nor unconditional finiteness of deformation rings is used in this argument.

F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions). The residual input is (α) and (β) of kw-residual-modularity, not 'ρ̄ is modular'. KW I Theorem 4.1(2), stated with 'ρ̄ modular', is the output §5.17 of this layer, derived from this theorem, the weight part of Serre's conjecture and the cited cases as in KW II §10.2. Case (B) of weight two is only the part of the potentially Barsotti–Tate case that becomes semistable over ℚ_p(μ_p) (KW II §10.2, remark). The general potentially Barsotti–Tate case is kisin-potentially-bt-lifting.

After a solvable base change (solvable-base-change-reduction; Taylor's Lemma 2.2), ρ_F is totally odd, uniform above p of type (A), (B) or (C), of the form (γ_vχ_p ∗; 0 γ_v) at the ramified places away from p, and ρ̄ is trivial above p when ρ̄ is unramified at p. Then ρ_F and det ρ_F prescribe lifting data and ψ, so ρ_F is an 𝒪-point of R̄^{□,ψ}_S. After a further base change, SerreWeightAndLevelOptimisation R20.6/prescribed-local-type-lifts (KW II Theorem 8.4) gives a cuspidal π′ of parallel weight fitting the same lifting data and ψ. R̄^{□,loc,ψ}_S is a domain (semistable conditions away from p; LocalGaloisDeformationRings R08.6/export-completed-tensor-product), so §3.7 gives R̄^{□,ψ}_S[1/p] ≅ 𝕋^□_𝔪[1/p]; the point ρ_F factors through 𝕋 and is modular. Solvable base change descends modularity to F.

(Source: [KW2-2009, §9.2, Theorem 9.7 and its proof, pp. 89–90][KW2-2009]; [KW2-2009, §10.2, p. 92][KW2-2009].) *Needs:* §1.1; §5.1; §3.7; §3.5; §1.6; GlobalGaloisDeformations:R04.6/kw-deformation-data; GlobalGaloisDeformations:R04.5/image-hypotheses; LocalGaloisDeformationRings:R08.6/kw-local-conditions; LocalGaloisDeformationRings:R08.6/export-completed-tensor-product; §1.2; SerreWeightAndLevelOptimisation:R20.6/prescribed-local-type-lifts.

**Checks.**

- F = ℚ, p = 3, ρ = the 3-adic Tate module of 11a1: crystalline of weight 2 (case (A)), the mod-3 image is GL_2(𝔽_3), so ρ̄|G_{ℚ(ζ_3)} (image SL_2(𝔽_3)) is absolutely irreducible, and (α), (β) hold with 11a1's own form; the theorem recovers its modularity.
- Weight p + 2 is outside (A): the theorem says nothing about crystalline lifts of weight > p + 1.
- If ρ̄|G_{F(μ_p)} is reducible (for example ρ̄ induced from ℚ(√−3) at p = 3), Taylor–Wiles primes are unavailable (GlobalGaloisDeformations R04.5/image-hypotheses) and the theorem does not apply.

### 5.5 From 'ρ̄ modular' over ℚ to the residual hypotheses (α) and (β)

For a modular S-type residual representation over Q, twist into the range 2≤k(bar-rho)≤p+1 when p is odd. Produce actual characteristic-zero cuspidal witnesses: weight k(bar-rho) and level prime to p for alpha, and weight two of p-conductor exponent at most one for beta. At two, beta exists in residual weights two and four, whereas alpha is asserted only in weight two. Carry these witnesses to a solvable totally real extension unramified at p on which the residual representation remains absolutely irreducible; they remain cuspidal, with the stated parallel weights and p-levels. This uses the weight theorem and level optimisation, followed by integral reduction surjectivity and eigenform lifting after enlarging the tame level to at least five. A Katz eigenform alone is not the alpha witness. No optimal tame conductor is claimed or needed.

'Modular' is in the sense of KW I §1: ρ̄ arises from a newform of some weight k ≥ 2 and some level. The optimal prime-to-p level N(ρ̄) is not needed, only some level prime to p; this is why Gross's hypothesis N > 4 is harmless (KW II §10.2). This is the weight part of Serre's conjecture, imported from SerreWeightAndLevelOptimisation: Edixhoven's theorem (weight k(ρ̄) at a level prime to p, from Gross's Theorem 13.10 and Coleman–Voloch), removal of the p-part of the level, and the passage to weight 2 at level Np (Gross's Propositions 8.13 and 8.18; Ribet). The supplier results for p = 2 and p = 3 have restrictions (ℓ ≥ 3 for the level step, ℓ > 3 or N > 3 for weight two); the cases they leave are supplied by R20.6. No potential modularity (KW II Theorem 6.1) and no finiteness of deformation rings (Theorem 10.1) enter. Edixhoven's theorem produces a Katz form in characteristic p, while (α) and (β) ask for automorphic representations; the lift to characteristic zero in weight ≥ 2 is a step of the proof, not part of the weight theorem.

Level prime to p: ρ̄ arises from Γ₁(Np^a) for some a ≥ 0, hence from Γ₁(N) in some weight (SerreWeightAndLevelOptimisation R20.4/strip-ell-power-from-level, for p ≥ 3; R20.6 for p = 2). Weight k(ρ̄) at level N: Edixhoven's theorem (R20.3/edixhoven-weight-theorem), with the normalisation 2 ≤ k(ρ̄) ≤ p + 1, gives a Katz eigenform over 𝔽̄_p of type (N, k(ρ̄), ε). Lift it to characteristic zero: after enlarging N to a multiple N ≥ 5 prime to p, the reduction map on cusp forms of weight k(ρ̄) ≥ 2 is onto (AlgebraicModularFormsAndSerreWeights R15.2/integral-lattice-and-reduction-image; the cusp-sheaf H¹ has no torsion in weight ≥ 2), and the Deligne–Serre lemma gives a characteristic-zero eigenform with the same eigenvalues modulo p, hence a newform of weight k(ρ̄) and level dividing N from which ρ̄ arises (R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform). This is where the hypothesis N > 4 of KW II §10.2 enters. Weight 2 at level Np: R20.4/weight-two-at-level-n-ell (p > 3 or N > 3; enlarge N by an auxiliary prime if N ≤ 3). The p-component of the resulting newform has conductor exponent at most 1. Over F: take the cuspidal automorphic representations of GL₂(𝔸_ℚ) of these newforms and base-change them along the soluble tower (GL2AutomorphicRepresentationsAndTransfer R17.4); they stay cuspidal because ρ̄|_{G_F} is irreducible, their weights are parallel k(ρ̄), resp. 2, and above p they are unramified, resp. of conductor exponent at most 1, because F is unramified at p. These are witnesses for (α) and (β).

(Source: [KW2-2009, §10.2, p. 92][KW2-2009]; [KW2-2009, Proof of Theorem 6.1, solvable-image paragraph, p. 54][KW2-2009].) *Needs:* §1.1; §1.2; SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem; SerreWeightAndLevelOptimisation:R20.4/strip-ell-power-from-level; SerreWeightAndLevelOptimisation:R20.4/weight-two-at-level-n-ell; SerreWeightAndLevelOptimisation:R20.6; AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular; AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image; AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform; GL2AutomorphicRepresentationsAndTransfer:R17.4.

**Checks.**

- ρ̄ = E[p] for an elliptic curve E/ℚ of conductor prime to p, p ≥ 5, with E[p] irreducible: k(ρ̄) = 2, and the newform of E is at once the (α)- and the (β)-witness over ℚ.
- k(ρ̄) = p + 1 (très ramifiée): the (α)-witness has weight p + 1 and level prime to p, the (β)-witness has weight 2 and is Steinberg at p.
- For p = 2 and k(ρ̄) = 4 no (α) is asserted, as in KW II.

### 5.6 Kisin's potentially Barsotti–Tate lifting theorem

Let p>2 and F be totally real. Let rho:G_(F,S)→GL₂(E) be continuous, with absolutely irreducible residual representation. Assume strong residual modularity, absolute irreducibility of bar-rho on G_(F(zeta_p)), and residue field F_p at every p-adic place where rho is not potentially ordinary. In the case p=5 with projective residual image PGL₂(F₅), additionally require that the kernel of the projective representation does not fix F(zeta₅). Prove rho modular by matching the potentially ordinary/nonordinary components after the specified solvable base change and applying component patching. Keep the residue-field and exceptional projective-image clauses in this formulation; removing them requires a separate theorem.

The residue-field condition in (1) comes from the connectedness result Kisin (2.5.6); Kisin notes that Gee removed it, which was not used to weaken this formulation, so it is kept.

Base change (solvable-base-change-reduction; Kisin (3.5.2), (3.5.3)): arrange [F : ℚ] even, f and ρ with matching types at 𝔭 | p, unipotent ramification away from p on both sides with the same characters, and f unramified outside Σ. After the base changes in Kisin (3.5.5), arrange that an ordinary residual local representation is indecomposable or trivial (condition (iii), DVI p. 73). Then the ordinary component is unique in that setup. In general, matching ordinarity alone is insufficient: for split distinct unramified residual characters also match the ordinary quotient character (equivalently, with fixed determinant, the cyclotomic line). Choose each B_v by this refined condition and verify both ρ and ρ_f lie on it. component-patching gives modularity of ρ over the base-changed field; descend.

(Source: [KISIN-FFLAT-2009, (3.5.4)–Theorem (3.5.5), pp. 72–73][KISIN-FFLAT-2009].) *Needs:* §5.2; §5.1; §1.6; GlobalGaloisDeformations:R04.5/image-hypotheses; LocalGaloisDeformationRings:R08.4; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; SerreWeightAndLevelOptimisation:R20.6; AutomorphicGaloisRepresentations:R19.6; LocalGaloisDeformationRings:R08.4/rank-two-bt-components; §5.3.

**Checks.**

- An elliptic curve over ℚ that acquires good reduction over a wildly ramified extension of ℚ_3: its 3-adic Tate module is potentially Barsotti–Tate at 3, the case Kisin's abstract singles out.
- Matching ordinary components requires the residual-character refinement or the source's indecomposable/trivial condition.
- Potentially semistable non-crystalline lifts of weight two with an ordinary Steinberg component at p are outside the potentially Barsotti–Tate hypothesis; KW II's case (C) covers them (kw-odd-prime-lifting).

### 5.7 Kisin's nonordinary potentially Barsotti–Tate theorem

Under the same p>2, totally real, cyclotomic-irreducibility and exceptional p=5 image conditions, let rho be potentially Barsotti–Tate and not potentially ordinary at every v|p, with det rho=epsilon times finite order and residue field F_p at all these places. If bar-rho occurs in a parallel-weight-two Hilbert eigenform, prove rho modular. Use the type-changing cuspidal lift at every p-adic place and classical local–global compatibility to obtain a witness which is nonordinary everywhere, hence strong residual modularity. The initial witness need not already have the required types, but producing its replacement is a necessary input.

(2) uses local–global compatibility at p for the level-changed form ([Sa] in Kisin), supplied by AutomorphicGaloisRepresentations R19.6. Part (2) replaces 'strongly residually modular' by residual modularity in parallel weight 2, using a level change to a form cuspidal at p (Kisin (3.1.6)) and the fact that an irreducible Weil–Deligne type at p forces non-ordinarity.

(2): after base change f may be taken unramified or special of conductor 1 at 𝔭 | p; Jacquet–Langlands and (3.1.6) give f′ cuspidal at every 𝔭 | p, whose ρ_{f′}|G_{F_𝔭} is not potentially ordinary, so ρ is strongly residually modular. Apply kisin-potentially-bt-lifting to the resulting strongly residually modular representation and descend.

(Source: [KISIN-FFLAT-2009, Theorem (3.5.7) and Corollary (3.5.8), pp. 74–75][KISIN-FFLAT-2009].) *Needs:* §5.6; §5.1; SerreWeightAndLevelOptimisation:R20.6; AutomorphicGaloisRepresentations:R19.6.

**Checks.**

- Every place above p must be nonordinary; one ordinary place is outside this statement.
- The residue-field condition 𝔽_p remains imposed at every v|p.
- The modular witness need not initially have matching local types; the level-change input must construct one.

### 5.8 Kisin's potentially Barsotti–Tate theorem over ℚ

For p>2, prove modularity of a continuous finitely ramified potentially Barsotti–Tate rho over Q with determinant epsilon times finite order, modular residual representation and absolutely irreducible restriction of bar-rho to G_(Q(sqrt(pStar p))). In the nonordinary branch use the preceding theorem, whose local residue-field condition is automatic over Q; in the potentially ordinary branch use Diamond's matching modular lift from R20.6. The Q statement is the source's corollary, including its treatment of the exceptional image case; do not attempt to drop that case from the totally real theorem independently.

Part (3) uses Diamond's potentially ordinary modular lift in the potentially ordinary case ([Di 1, 6.4] in Kisin), which is supplied with the level and type changes from SerreWeightAndLevelOptimisation R20.6.

(3): if ρ|G_{ℚ_p} is irreducible use (2); otherwise ρ is potentially ordinary and Diamond's lift makes ρ strongly residually modular. The nonordinary case uses kisin-nonordinary-pbt-lifting; the ordinary case uses Diamond's lift and kisin-potentially-bt-lifting.

(Source: [KISIN-FFLAT-2009, Theorem (3.5.7) and Corollary (3.5.8), pp. 74–75][KISIN-FFLAT-2009].) *Needs:* §5.6; §5.7; SerreWeightAndLevelOptimisation:R20.6.

**Checks.**

- At p=3 the quadratic field in the irreducibility condition is ℚ(√−3).
- A weight-two potentially semistable noncrystalline Steinberg lift is not potentially Barsotti–Tate.
- The residue-field condition is automatic over ℚ; the ordinary and nonordinary proof branches are distinct.

### 5.9 Modularity lifting in the Fontaine–Laffaille range

Let p>3, F be totally real and unramified at p, and rho,rho₀ be continuous integral representations with the same reduction. Suppose rho₀ is modular, rho is geometric, both are crystalline at every p-adic place, and at each embedding their Hodge–Tate weight sets agree and consist of two distinct integers at distance at most p−2. Assume the residual image contains SL₂(F_p). Prove rho modular using the formally smooth fixed-Hodge Fontaine–Laffaille rings over each unramified F_v, the integral comparison or avoidance argument, and solvable descent. This residual image hypothesis is stronger than cyclotomic absolute irreducibility and is not replaced by it.

The residual hypothesis is Gee's big image, GlobalGaloisDeformations R04.5/image-hypotheses (2), which is different from KW II's cyclotomic irreducibility. The local rings are the Fontaine–Laffaille rings, formally smooth: R08.6/export-fontaine-laffaille-irreducible covers F_v = ℚ_p with ρ̄_v irreducible, and the general unramified case is supplied by LocalGaloisDeformationRings R08.6.

Base change as in Gee §5.5, preserving the residual image and remaining unramified above p, to arrange even [F:ℚ], residual unramifiedness away from p, unipotent inertia for ρ and ρ₀ away from p, equal determinants, and ρ̄|G_{F_v} trivial with #k(v)≡1 mod p at the ramified auxiliary places v∈T_r. These are not the Taylor–Wiles places Q: Q is disjoint from T and ρ̄(Frob_v) has distinct eigenvalues there (Gee §5.6, p. 33). Patch with Ihara avoidance: the pair of problems of §4.1, full support in the unipotent problem transferred from the irreducible 𝒮′ problem (§4.2). §4.3.

(Source: [GEE-MLT-2022, Theorem 5.2, p. 29][GEE-MLT-2022].) *Needs:* §4.1; §4.2; §4.3; §4.4; §5.1; GlobalGaloisDeformations:R04.5/image-hypotheses; LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible; LocalGaloisDeformationRings:R08.6.

**Checks.**

- The p-adic Tate module of an elliptic curve over F with good reduction above p ≥ 5, p unramified in F and ρ̄(G_F) ⊇ SL_2(𝔽_p), once some crystalline weight-two modular ρ₀ lifts ρ̄: the Hodge–Tate weights {0, 1} differ by 1 ≤ p − 2.
- Weights differing by p − 1 are outside the range: Fontaine–Laffaille theory stops at p − 2.
- p = 3 is excluded even when the image is GL_2(𝔽_3): the theorem needs p > 3.

### 5.10 Corrected type-sensitive Hecke module

For the CDT global problem with the BCDT type modification, define `bcdtHeckeModule` as the I'_S-part of Hom_(O[U_S/V_S])(M_S,H¹(X_(V_S),O)), with the auxiliary prime r when required. The coefficient local system uses the O-dual of the integral type lattice. For residual support form the comparison module with U'_(S,q)=V'_(S,q)=U₁(q^(c_q)) at q in T(bar-rho), leaving other local levels unchanged. For an extended type use the extended compact group generated by w_ell, its invariant lattice and the finite quotient after dividing by ell^(sZ). On the localised coefficient cohomology w_ell²=1 and ell is odd, so use its positive direct summand, cut out by (1+w_ell)/2. Make this same choice in compactly supported cohomology, duality and every auxiliary-level map. The definition includes continuous coefficient actions and the normality needed for descent between levels; it does not silently reuse the uncorrected residual comparison subgroup.

ℓ>2; O is large enough to define every local type, lattice and pairing. The residual representation is modular and absolutely irreducible on G_{Q(√ℓ*)}; its local centralizer is k. Use the exact BCDT type and admission predicates supplied by Local R08.3. The extended-type w_ℓ satisfies w_ℓ²=1 on the relevant localized coefficient cohomology. Because 2 is a unit, the invariant summand is cut out by (1+w_ℓ)/2. The type extension and central power ℓ^s are part of the input.

Import the modular-curve/local-system and compact-type lattice constructions from their owners. Form the displayed Hom action image and its Hecke-ideal submodule. Use the corrected auxiliary levels in the residual comparison. Descent of invariants along V′⊂V requires V′ normal in V; all coefficient actions are continuous for the ℓ-adic topology. For extended types use the extended compact group in every Hom and level comparison, and restrict duality, level-control and auxiliary-module maps to the + summand.

The intended named interface is:

- `bcdtHeckeModule`: The type Hom-module with its Hecke action, corrected auxiliary level and residual-support comparison module.
- `bcdtHeckeModule_dual_coefficients`: The coefficient local system uses Hom_O(M_ℓ,O), and the group-cohomology Serre coefficient is L_n⊗k.
- `bcdtExtendedHeckeModule_invariants`: For extended types the module is identified with the localized w_ℓ=1 direct summand; its dual pairing is restricted to that same summand.

(Source: [BCDT-2001, Theorems 1.4.1–1.4.2 and their proofs, author pp. 12–15; §10, pp. 77–78][BCDT-2001].) *Needs:* LocalGaloisDeformationRings:R08.3/bcdt-type-rings; ModularCurvesPartII:R14.3; ModularCurvesPartII:R14.6; AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive; AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image; LocalGaloisDeformationRings:R08.3.

**Checks.**

- With the corrected U′_S = V′_S = U_1(q^{c_q}) at q ∈ T(ρ̄), Γ = SL₂(ℤ) ∩ U′_S satisfies the hypotheses of CDT Theorem 6.1.1; with the original U_S it need not (BCDT §10).
- For an extended type the w_ℓ = 1 summand is a direct summand because w_ℓ² = 1 on the localised H¹ and ℓ is odd.
- For trivial rank-one type lattice the Hom construction gives the corresponding invariant cohomology with the specified Hecke ideal.
- For an involution on an O-module with ℓ odd, the projectors (1±w)/2 are complementary and the + projector gives the extended-type summand.
- At a prime of T(ρ̄), keeping the old U_S instead of U_1(q^{c_q}) does not supply the congruence-subgroup hypotheses needed by the residual-support theorem.

### 5.11 Residual support for an admitted type

In the BCDT global setup, assume ell>2, residual modularity, absolute irreducibility over Q(sqrt(pStar ell)), local scalar centralizer, and admission of bar-rho at ell by the chosen type or extended type through an integral type lattice and one of its residual constituents. Prove nonvanishing of the corrected localised coefficient module and nonemptiness of the characteristic-zero automorphic set N_S. Transfer support using the corrected congruence subgroup, the dual coefficient lattice, non-Eisenstein exactness and normal-subgroup descent. For an extended type keep the distinct-character, irreducible/peu-ramified and très-ramified alternatives and their w_ell eigenvalues separate. This proves support, before any R=T argument; existence of a local type point by itself is not the admission hypothesis.

ℓ is odd, ρ̄ is modular and absolutely irreducible on G_{ℚ(√ℓ*)}, ρ̄|G_ℓ has centraliser k, and τ (resp. τ′) admits ρ̄|G_ℓ in BCDT's sense: it admits an irreducible representation σ of GL₂(ℤ_ℓ), U₀(ℓ) or Ũ₀(ℓ) over 𝔽̄_ℓ which admits ρ̄|G_ℓ.

Use the corrected Γ from U′_S and Serre’s coefficient module L_n⊗k to obtain nonzero residual localized cohomology. Transfer support from the admitting constituent to the dual integral type lattice using exactness after non-Eisenstein localization and the corrected normal-subgroup descent. The extended-type proof additionally projects by w_ℓ and uses the appropriate local admission alternative. Lift the nonzero residual support to L′_S, use the type-sensitive automorphic decomposition and the comparison with L_S, and deduce N_S nonempty. No conjectural equivalence between admission and existence of a local lift is used.

(Source: [BCDT-2001, Theorems 1.4.1–1.4.2 proofs, author pp. 12–15, and §10, pp. 77–78][BCDT-2001].) *Needs:* §5.10; LocalGaloisDeformationRings:R08.3/bcdt-type-rings; SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem; SerreWeightAndLevelOptimisation:R20.4/strip-ell-power-from-level; ModularCurvesPartII:R14.3.

**Checks.**

- The conclusion is nonvanishing of the localised corrected module and nonemptiness of N_S; it is not an R = T statement.
- In the extended case with ρ̄|G_ℓ reducible and très ramifié, BCDT use ρ̄_{I_ℓ}(Frob_ℓ) = −a in the w_ℓ-eigenvalue comparison; the peu ramifié/irreducible case uses ã + w_ℓ.

### 5.12 Type-sensitive global comparison

With the preceding residual and admission assumptions, a weakly acceptable type or extended type, and an actual nonzero potentially Barsotti–Tate lift of it, prove R_S=T_S, that T_S is a complete intersection and that the corrected L_S is finite free over T_S. The lift excludes the zero-ring alternative in weak acceptability. Apply the CDT numerical criterion with the perfect pairing, residual level-change injectivity, congruence factors and auxiliary diamond freeness checked for this type module. In the extended case use the enlarged finite groups and the positive w_ell summand throughout, including compact support and the duality pairing. Retain the BCDT corrections to group and character labels and the patched algebra; the withdrawn claim that sigma_n is semisimple plays no role. No general conjectural equivalence between admission and existence of local lifts is assumed.

The CDT global setup of §§1.3–5.3 with the BCDT changes on p. 12 (resp. pp. 13–14 for extended types): U_{S,ℓ} = U_τ, V_{S,ℓ} = ker σ_τ, σ_{S,ℓ} = σ_τ (resp. U₀(ℓ), Ũ_S generated with w_ℓ, and the finite quotient G̃_S = Ũ_S/V_Sℓ^{sℤ}).

Use the local weak-acceptability quotient and the actual lift to enter the nonzero acceptable branch, and use admission to obtain a nonempty automorphic set. Apply the classical Taylor–Wiles numerical/module criterion supplied by the patching owner to the corrected type module. Its hypotheses include the perfect pairing, residual injectivity of level change, congruence ideal factors and auxiliary diamond freeness, as in CDT Propositions 5.5.1/5.6.1. For an extended type use the enlarged groups in all Hom and level-change maps, take w_ℓ=1 in compact and ordinary cohomology, identify invariants with coinvariants using ℓ odd, and retain the resulting direct summand in the freeness argument. Use the remaining BCDT §10 label/hypothesis corrections in the local-type and numerical setup: the real group, η-character labels and patched algebra A∞. The discarded σ_n semisimplicity assertion is not an input. Elliptic-curve j-invariant consequences are outside this target.

(Source: [BCDT-2001, Theorems 1.4.1–1.4.2 and their proofs, author pp. 12–15; §10, author pp. 77–78][BCDT-2001]; [CDT-1999, Theorem 5.4.2, author p. 22; §§5.5–6.4, author pp. 22–31][CDT-1999].) *Needs:* §5.11; §5.10; GlobalGaloisDeformations:R04.3/local-to-global-presentation; DeformationAndDerivedPatchingAlgebra R03.5; DeformationAndDerivedPatchingAlgebra R03.3/dimension-count-ci-flatness; ModularCurvesPartII:R14.6.

**Checks.**

- The existence of the potentially Barsotti–Tate lift ρ of type τ makes τ acceptable for ρ̄, so the R^D = 0 branch of weak acceptability is excluded.
- For an extended type the self-duality L_S ≅ Hom_O(L_S, O) is taken on the w_ℓ = 1 parts; using all of H¹ would compare the wrong modules.

### 5.13 BCDT modularity lifting for a type

Let ell>2, E/Q_ell be finite and rho:G_Q→GL₂(E) be continuous, odd and finitely ramified. Suppose bar-rho is modular, remains absolutely irreducible over Q(sqrt(pStar ell)), and has scalar local endomorphisms at ell. If rho is potentially Barsotti–Tate of BCDT ell-type tau, and tau both admits bar-rho locally and is weakly acceptable for it, prove rho modular. Type includes the source's finite-order prime-to-ell determinant factor. Use the actual lift, corrected residual support and type comparison, then identify rho with the eigenform representation by traces. The admission conjecture is not used to erase the admission hypothesis.

K/ℚ_ℓ finite with residue field k, ℓ odd; ρ : G_ℚ → GL₂(K) odd, continuous, ramified at finitely many primes; ρ̄ modular and absolutely irreducible on G_{ℚ(√((−1)^{(ℓ−1)/2}ℓ))}; ρ̄|G_ℓ has centraliser k; ρ|G_ℓ potentially Barsotti–Tate of ℓ-type τ, which admits ρ̄|G_ℓ and is weakly acceptable for it.

Choose a stable integral lattice and apply the admitted-type residual support theorem to obtain a nonzero localized corrected coefficient module. Use weak acceptability to compare the prescribed local type ring with the weak ring in the numerical argument. The corrected coefficient module and CDT criterion identify the relevant deformation ring with its Hecke action image. The point defined by ρ therefore gives a characteristic-zero Hecke eigensystem. The automorphic Galois representation attached to it is ρ by its trace identities.

(Source: [BCDT-2001, Theorem 1.4.1 and proof, author pp. 12–13; §10, pp. 77–78][BCDT-2001].) *Needs:* §5.12; LocalGaloisDeformationRings:R08.3/bcdt-type-rings.

**Checks.**

- Admission is a hypothesis: BCDT Conjecture 1.3.1(1) predicts that τ admits ρ̄|G_ℓ whenever a lift of type τ exists, but the paper verifies it only in special cases (§2.1), and the theorem does not use it.
- Absolute irreducibility is required over ℚ(√((−1)^{(ℓ−1)/2}ℓ)), not merely over ℚ; for ℓ = 3 this field is ℚ(√−3).

### 5.14 BCDT modularity lifting for an extended type

With the same odd-prime global, residual and scalar-centralizer hypotheses, replace tau by an extended type tau' with irreducible inertial restriction. Require its admission through the extended compact group and its weak acceptability for the local residual representation. Prove a lift rho of that extended type modular via the corrected positive-normalizer-summand comparison. The acceptability condition makes the central power act trivially after a suitable finite exponent s, so the extended type factors through the required finite group. The full cohomology module, without projection to w_ell=1, does not supply the needed self-duality.

As for bcdt-type-lifting with an extended ℓ-type τ′ whose restriction to inertia is irreducible: τ′ admits ρ̄|G_ℓ through an irreducible representation of Ũ₀(ℓ) and is weakly acceptable for it.

Use extended-type admission to select the appropriate normalizer action and corrected w_ℓ-positive coefficient module, with the distinct/peu/très residual cases retained. Apply weak acceptability and the extended-type version of the numerical module argument to that summand. Read the resulting point of the Hecke algebra as an eigenform and identify its representation using Frobenius traces.

(Source: [BCDT-2001, Theorem 1.4.2 and proof, author pp. 13–15; §10, pp. 77–78][BCDT-2001].) *Needs:* §5.12; LocalGaloisDeformationRings:R08.3/bcdt-type-rings.

**Checks.**

- Because τ′ is acceptable, det τ′ of a Frobenius lift is ℓζ for a root of unity ζ, so σ_{τ′}(ℓ^s) = 1 for some s > 0 and σ̃_S factors through a finite group.
- The w_ℓ = 1 restriction is needed in CDT Lemma 6.1.3 and in the duality on p. 547; without it the self-duality of L_S fails.

### 5.15 Kisin crystalline lifting over Q in the medium-weight range

Let p>2 and rho over Q be continuous and finitely ramified, crystalline at p with weights {0,k−1} for 2≤k≤2p−1. Assume bar-rho occurs in a weight-k cuspidal modular form, is absolutely irreducible on G_(Q(zeta_p)), and has scalar endomorphisms on G_(Q_p). Prove rho modular using the fixed-determinant crystalline domain of Durham Proposition 3.13, its component patching and the Q level comparison. This is the Q specialization of Theorem 3.14: the source explicitly leaves a higher-weight Hilbert level-lowering limitation, so no totally real extension of this statement is claimed.

ρ is continuous, unramified outside a finite set S, with coefficients O the integers of a finite extension E/ℚ_p; the residual representation at p has scalar endomorphisms (End_{𝔽[G_{ℚ_p}]} ρ̄ = 𝔽), which is the hypothesis of Proposition (3.13).

Use the fixed-determinant crystalline domain of Proposition (3.13), with its scalar-centralizer and weight-range hypotheses. Request this precise local extension from Local R08.5; formal smoothness of the generic fibre alone is insufficient. Apply component patching with the same-weight modular point, then the Q-level raising/lowering supplier. The source warns that the Skinner–Wiles level-lowering argument it uses is written only in weight two, so the totally real case is not fully established; no such generalization is used.

(Source: [KISIN-DURHAM, Proposition (3.13), author pp. 19–20; Theorem (3.14) and proof, pp. 20–21][KISIN-DURHAM].) *Needs:* §5.2; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; LocalGaloisDeformationRings:R08.5; SerreWeightAndLevelOptimisation:R20.4.

**Checks.**

- Kisin remarks that the level-lowering arguments of Skinner–Wiles [SW] are carried out only in weight two, so a cautious reader should take (3.14) as fully proven only for F = ℚ; this assertion is that case.
- Weight k = 2p is outside the range 2 ≤ k ≤ 2p − 1 of (3.13)–(3.14).

### 5.16 The nonordinary weight-p-plus-one endpoint

For p>2 let rho over Q be crystalline of weights {0,p}, nonordinary, finitely ramified and residually modular with cyclotomic absolutely irreducible reduction. In the residual Serre-weight-two branch, use the BLZ endpoint reduction Ind(omega₂^p)=Ind(omega₂) to obtain local absolute irreducibility and scalar endomorphisms. Take the residual weight-two form at tame level, multiply by the Hasse invariant of weight p−1, and lift the resulting weight-p+1 eigensystem to characteristic zero. This gives the same-weight witness required by the Q Durham theorem, hence modularity of rho. The ordinary endpoint requires its distinct theorem and is not included in this reduction.

p > 2 and ρ|G_{ℚ_p} is crystalline with Hodge–Tate weights {0, p} and not ordinary; ρ̄ is modular with ρ̄|G_{ℚ(ζ_p)} absolutely irreducible, and the residual Serre weight is 2.

Import the precise BLZ endpoint reduction, with the nonordinary assumption, from PadicHodgeTheory R06.4; this is distinct from the local endpoint ring for residual Serre weight p+1. Import weight-two realization, the weight-p−1 Hasse multiplication preserving the residual eigensystem, and the Deligne–Serre lifting of that weight-p+1 eigensystem from the weight owner. Verify local scalar endomorphisms and the same-weight modularity hypothesis, then apply the Q-specialized Durham theorem.

(Source: [KW2-2009, §10.2, p. 92; Kisin Durham Theorem (3.14), author pp. 20–21][KW2-2009].) *Needs:* §5.15; PadicHodgeTheory:R06.4; SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem; SerreWeightAndLevelOptimisation:R20.3/hasse-localised-injection; SerreWeightAndLevelOptimisation:R20.4.

**Checks.**

- For nonordinary crystalline weight p + 1 the reduction is Ind ω₂^p ≅ Ind ω₂ (Kisin Durham (3.9)(1)), which is irreducible with Serre weight 2; so the residual weight-two branch is the only nonordinary one.
- The Hasse invariant has weight p − 1, so multiplying a weight-two form by it gives weight p + 1 with the same q-expansion and the same Hecke eigenvalues away from p.

### 5.17 KW I Theorem 4.1(2): modularity lifting over ℚ for odd p

For p>2 let bar-rho over Q be modular and absolutely irreducible on G_(Q(mu_p)). Prove modularity of every finitely ramified continuous lift rho which is either crystalline with weights {0,k−1}, 2≤k≤p+1, or potentially semistable with weights {0,1}. Oddness follows from the modular residual determinant because p is odd. In the KW type-(A), (B), (C) cases use alpha/beta, allowable base change and descent. A potentially crystalline weight-two lift uses the Q potentially Barsotti–Tate theorem. With nonzero Weil–Deligne monodromy, first construct a finite-order global character with the required local inertia, compare determinants and residual representations, and reduce to (C). The crystalline k=p+1, residual-weight-two branch uses the nonordinary endpoint below or the exact Diamond ordinary endpoint from R21.5. The restricted Skinner–Wiles theorem alone does not cover every induced residual case in that ordinary branch.

Weight k means Hodge–Tate weights (k − 1, 0). The lift is odd because ρ̄ is and p is odd. Cases given by Theorem 9.7 (KW II §10.2, Remark): (i) for 2 ≤ k ≤ p, and for k = p + 1 when k(ρ̄) = p + 1 (type (A)); (ii) when ρ restricted to ℚ_p(μ_p) is semistable of weight 2, that is, crystalline over ℚ_p^{nr}(μ_p) (type (B)) or semistable non-crystalline (type (C)). Cases KW II take from the literature: (i) with k = p + 1 and k(ρ̄) = 2 (Kisin's Durham paper when the lift is non-ordinary at p, Diamond's Annals paper when it is ordinary); (ii) potentially Barsotti–Tate (Kisin, §5.8); and the semistable weight-two case 'goes back to' Wiles, Taylor–Wiles and Diamond. For k ≤ p − 1 they also cite Diamond–Flach–Guo, which Theorem 9.7 covers again. Case (ii) is covered completely. A potentially semistable lift of weight 2 is either potentially crystalline, hence potentially Barsotti–Tate (Kisin's theorem), or its Weil–Deligne representation has N ≠ 0; then ρ|_{D_p} is the twist of a semistable non-crystalline representation by a character η of finite order on inertia, η|_{I_p} is the restriction of a Dirichlet character of p-power conductor, and twisting ρ and ρ̄ by its inverse preserves the hypotheses and the conclusion and gives type (C). KW II do not print this reduction. For the ordinary crystalline weight-p+1, residual-weight-two branch, use the exact Diamond ordinary lifting extension supplied by Ordinary R21.5. The restricted Skinner–Wiles supplier does not automatically discharge every CM-induced residual case.

Residual input. ρ̄ modular gives (α) and (β) over every soluble totally real F unramified at p on which ρ̄ stays absolutely irreducible (§5.5). Base change. Choose an allowable F/ℚ (§1.4), split at p when ρ̄|_{D_p} is irreducible or k(ρ̄) = p + 1, over which ρ|_{G_F} has the uniform shape that the proof of Theorem 9.7 starts from (§5.1). Theorem 9.7 (§5.4) makes ρ|_{G_F} modular in the cases of types (A), (B), (C). Descent along the soluble tower returns to ℚ (GL2AutomorphicRepresentationsAndTransfer R17.4, through §5.1). For potentially crystalline weight two use the Q potentially Barsotti–Tate theorem. When monodromy is nonzero, request the finite-order global twist taking the local condition to type (C), with determinant and residual comparisons. For k=p+1, residual weight two, use nonordinary-weight-p-plus-one in the nonordinary branch and the precise ordinary endpoint request in the ordinary branch.

(Source: [KW2-2009, §10.2, p. 92][KW2-2009]; [KW2-2009, §10.2, Remark, p. 92][KW2-2009]; [KW1-2009, Theorem 4.1, p. 7][KW1-2009].) *Needs:* §5.5; §5.4; §5.1; §1.4; §1.5; §5.8; GL2AutomorphicRepresentationsAndTransfer:R17.4; §5.16; OrdinaryAutomorphicFormsAndModularityLifting:R21.5.

**Checks.**

- p = 3, ρ the 3-adic Tate module of 11a1: crystalline of weight 2, residual image GL₂(𝔽₃), absolutely irreducible over ℚ(μ₃); the theorem recovers its modularity through type (A).
- Crystalline of weight p + 2 is outside (i).
- The Tate module of an elliptic curve with additive, potentially multiplicative reduction at p ≥ 5: potentially semistable with N ≠ 0, and its quadratic twist has multiplicative reduction, type (C).

### 5.18 The exact overlap with ordinary modularity lifting

In each classical crystalline lifting theorem, state the ordinary subcase only after checking the precise R21 theorem's residual distinction, cyclotomic restriction, determinant, finite-ramification and ordinary quotient hypotheses. Where both component patching and ordinary lifting apply, identify the resulting modular representation by its Frobenius polynomials. In particular a split residual representation with two distinct characters can still admit different ordinary components, labelled by the chosen quotient. No theorem for arbitrary ordinary lifts is inferred from their being on the same inertial-type locus.

Preserve the stable ordinary line and its quotient character under base change; split distinct unramified residual characters can label different ordinary components. Check residual distinguishedness and the non-CM-induction restriction individually. Cyclotomic absolute irreducibility alone does not imply the latter. The finite-order determinant factor and ordinary witness must match the normalization of the chosen Ordinary supplier.

Type (C) has the ordinary line gamma_v epsilon and quotient gamma_v. The endpoint local calculation makes a crystalline lift of residual weight p+1 ordinary, and the fitting automorphic witness is ordinary at each p-adic place. Steinberg witnesses have the same ordinary shape by R19.6 local–global compatibility. An application of R21 must still verify its labelled quotient, residual distinguishedness and any non-CM-induction restriction. The classical Kisin/Diamond endpoint used in §5.17 requires the exact ordinary theorem in the supplier contract; a restricted Skinner–Wiles theorem does not by itself replace it.

(Source: [KW2-2009, §10.2, p. 92][KW2-2009].) *Needs:* §5.4; LocalGaloisDeformationRings:R08.6/export-endpoint-weight; LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p; AutomorphicGaloisRepresentations:R19.6; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting.

**Checks.**

- 11a1 at p = 11 (split multiplicative reduction, a Tate curve): its 11-adic representation is (γχ_11 ∗; 0 γ) at 11 with γ unramified, of type (C), inside the overlap.
- A non-ordinary crystalline weight-2 lift (a_p divisible by p) is of type (A) but outside the overlap.
- A crystalline lift of weight p + 1 with k(ρ̄) = 2 is not treated by KW II's argument (their §10.2 remark) and is not in the overlap either.

### Examples

At p=3 the crystalline weight-four nonordinary endpoint is in the Q Durham range 2≤k≤5. Its residual weight-two witness becomes weight four after Hasse multiplication of weight two. An ordinary lift in that endpoint uses the distinct ordinary theorem. A potentially multiplicative elliptic curve becomes type (C) after the actual quadratic character twist; the determinant changes by its square.

### Dependencies

Layers 1–4; R06 endpoint reduction; R07 weight-two comparison; R08.3–R08.6 local components and types; R14/R15 integral cohomology and coefficients; R17/R19 transfer and compatibility; R20/R21 weight and ordinary results.


## Layer 6: Dyadic determinants, twists and classical lifting

### 6.1 Oddness in residue characteristic two

For a two-dimensional characteristic-zero representation and a complex conjugation c, prove that rho(c)²=1 makes the conditions det rho(c)=−1 and charpoly(rho(c))=X²−1 equivalent. At p=2 the residual determinant is always 1. If bar-rho(c) is not the identity, every lift is odd: either even involution in characteristic zero is I or −I, both reducing to I. Conversely an odd lift may reduce to I. Impose oddness using the real-place local quotient, smooth when bar-rho(c)≠I and equal to O[[X₁,X₂,X₃]]/(X₁²+X₂X₃+2X₁) in the identity-reduction case. The representative predicate `matrixOdd` is simply det(A)=−1; its theorem `matrixOdd_involution_iff` uses the involution and characteristic-zero hypotheses.

The archimedean ring of odd lifts is LocalGaloisDeformationRings R08.6/export-archimedean: formally smooth when ρ̄(c) ≠ 1, and 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁) when p = 2 and ρ̄(c) = 1.

ρ(c)² = 1 in characteristic 0 gives eigenvalues in {±1}. det ρ(c) = −1 forces {1, −1}, hence characteristic polynomial X² − 1; conversely X² − 1 has determinant −1. If ρ̄(c) ≠ 1 then ρ(c) ≠ ±1 (both reduce to 1), so its eigenvalues are 1 and −1 and det ρ(c) = −1. diag(1, −1) and 1 both reduce to the identity mod 2, so ρ̄(c) = 1 does not decide oddness.

(Source: [KW2-2009, §3.1, Proposition 3.3, pp. 19–20][KW2-2009].) *Needs:* LocalGaloisDeformationRings:R08.6/export-archimedean; GlobalGaloisDeformations:R04.6/kw-deformation-data.

**Checks.**

- ρ(c) = (1 1; 0 −1): odd, with ρ̄(c) = (1 1; 0 1) ≠ 1.
- ρ(c) = diag(1, −1): odd, with ρ̄(c) = 1.
- ρ(c) = −1: even (det = 1), with ρ̄(c) = 1; so 'ρ̄(c) = 1' does not distinguish odd from even lifts.
- Over Z, diag(1,−1) has determinant −1 and polynomial X²−1, while I₂ has determinant 1 and polynomial (X−1)².
- Modulo two those two matrices both become I₂; lifting that residual matrix does not determine oddness.
- A scalar twist uA with u²=1 has the same determinant as A.

### 6.2 Enhanced dyadic patching data

For m≥3 define `DyadicPatchingDatum m` by enhancing `PatchingDatum m` with a surjection A'=B[[x₁,…,x_(h+j+t−d)]]→D'_m, an ordinary nilpotence bound m_(D'_m)^(r'_m)=0 with r'_m=b r_m, a closed embedding Sp D_m→Sp D'_m, and a determinant map d_m:Sp D'_m→T, T=Hom(Z^t,Ghat_m). Specify a free T_(2^m) action chunk in the category cut out by that nilpotence bound and require d_m(ell x)=ell²d_m(x). The determinant-one quotient D''_m maps onto D_m with kernel contained in the ordinary m-th maximal-ideal power. Retain the determinant map, embeddings, action chunks, kernel estimate and all Layer 3 scalar/module maps in morphisms and reductions. The kernel need not vanish at a fixed truncation, even when t=0; its vanishing is a separated-limit conclusion.

p = 2, ρ̄ has non-solvable image, and the level-n inputs (R′_n, d_n, the free twisting action of G*_n) are GlobalGaloisDeformations R04.6/dyadic-patching-data; m ≥ 3 and r′_m = b r_m with b the number of generators of m_{A′}.

Record the ambient finite quotient, determinant map and the free truncated twist action from the global dyadic datum. Its square on determinants gives the displayed equivariance identity. Keep the determinant-one comparison quotient and its kernel bound as part of the datum. Its kernel is allowed to be nonzero at finite level. Morphisms preserve these maps, in addition to all the ordinary patching maps.

The intended named interface is:

- `DyadicPatchingDatum`: A pair (D_m,L_m) with its truncated ambient ring, determinant, free action chunk and small-kernel comparison.
- `DyadicPatchingDatum.determinantOne`: The closed determinant-one fibre D″_m with its specified quotient onto D_m.
- `DyadicPatchingDatum.reduce`: Reduction preserves the determinant, action chunk, embedding and all pair-data maps.

(Source: [KW2-2009, §2.6, pp. 13–14; Proposition 9.3 proof, pp. 84–87][KW2-2009].) *Needs:* §3.1; GlobalGaloisDeformations:R04.4/truncated-actions; GlobalGaloisDeformations:R04.6/dyadic-patching-data.

**Checks.**

- For t=0 the torus and determinant map are trivial, so D″_m=D′_m, but the comparison onto D_m can still have a nonzero kernel contained in m^m.
- A datum with D″_m = D_m imposed at finite level is not KW's: only the inclusion of the kernel in m^m is required.
- For t=0 the torus and determinant constraint are trivial.
- A surjection C→C/(ε), C=k[ε]/(ε^{m+1}), has kernel (ε) not contained in m_C^m for m≥2 and fails the required comparison.
- D′_m is truncated by an ordinary maximal-ideal power, while D_m is killed by a power-generated ideal; exchanging these requirements changes the datum.
- For C=k[e]/(e^(m+1)), the quotient C→C/(e^m) has a nonzero kernel (e^m) contained in m_C^m; thus the permitted small kernel need not be zero.

### 6.3 Realizing the dyadic action chunks

Fix a≥2 with 2^a>N. For n≥m≥3 and the fixed lower bound n≥n₀+1, choose compatible generators Z^t→G_(n+a), inducing G'_(n+a)=(Z/2^(n+a−2))^t. Use D'_(m,n)=R'_(n+a)/m_(R'_(n+a))^(r'_m), with the ordinary power, alongside the shifted D_(m,n),L_(m,n) of Layer 3. Prove the restricted torus action chunk is free, the determinant map is equivariant for squaring, and D''_(m,n)→D_(m,n) has kernel in m^m. The generator identity 2h+1=h+j+t−d supplies the ambient surjection. The inequality a≥2 is needed for T_(2^n) to lie in the dual of G'_(n+a).

p = 2, a ≥ 2 with 2^a > N, and n ≥ m ≥ 3 with n ≥ n₀ + 1; the generator count of R′_n over B is 2h + 1 = h + j + t − d (GlobalGaloisDeformations R04.6/patching-numerology).

The fixed shift a supplies enough cyclic 2-power quotients after both the isotropy loss and the two-power twist loss. Restrict the free G* action to the displayed action chunk. Use the ordinary maximal-ideal truncation r′_m to descend the action and determinant map. The global determinant comparison gives a quotient of the determinant-one fibre whose residual kernel lies in m^m. All module/scalar compatibilities are inherited from the shifted arithmetic construction.

(Source: [KW2-2009, Proposition 9.3 proof, pp. 85–87][KW2-2009].) *Needs:* §6.2; §3.2; GlobalGaloisDeformations:R04.6/dyadic-patching-data; GlobalGaloisDeformations:R04.4/twist-action-free.

**Checks.**

- The determinant map d_{m,n} is the reduction of d_{R′_{n+a}} : ρ ↦ det ρ·(χ_pψ)^{−1}, which lands in G*_{n+a} ⊂ T.
- Without a ≥ 2 the 2^n-torsion of T would not sit inside (G′_{n+a})*, and the T_{2^m} action chunk could not be restricted from the twisting action.

### 6.4 Dyadic patched rings

Stabilise the full enhanced finite data, not just their rings. Obtain B-algebra surjections B[[x₁,…,x_(h+j+t−d)]]→R'_infty→R_infty→R^square, with the fixed S_infty-structure on R_infty and R_infty/J=R^square. Prove that Sp R_infty is exactly the determinant-one fibre of Sp R'_infty: the finite comparison kernels lie in ordinary m^m and vanish in the separated inverse limit. Here d=3|S|, j=4|S|−1 and h,t are the same global dyadic numerical data at every level. The module and torus action are additional constructions below, not consequences of this bare ring limit.

The level-n inputs (R′_n, R_n, d_n, the free twisting action of G*_n and the Δ′_{Q_n}-structure) are GlobalGaloisDeformations R04.6/dyadic-patching-data; the Hecke side and its twist action are §2.12. The patching is the diagonal-subsequence argument of §3.1 (supplied by DeformationAndDerivedPatchingAlgebra R03.5), carried out with the extra data D′_m and the determinant maps.

Level-m data: D′_m with determinant morphism d_m, its determinant-one quotient D″_m, a surjection D″_m ↠ D_m with kernel contained in 𝔪_{D″_m}^m, and the D_m-module L_m. The action chunks on Sp D′_m come from the finite twisting groups. Do not identify D_m with D″_m at finite level (KW II pp. 85–86). Finitely many isomorphism classes at each level; a compatible subsequence gives a projective system with limits R′_∞, R_∞, M_∞. The action chunks assemble to a free T-action (GlobalGaloisDeformations R04.4/truncated-actions), and the d_m to d. The identification X_∞ = d^{−1}(1) holds because D′′_m ↠ D_m has kernel in 𝔪^m.

The intended named interface is:

- `dyadicPatchedRing`: The inverse-limit surjections R′∞↠R∞↠R̄_S^{□,ψ} with their B- and S∞-maps.
- `dyadicPatchedRing_augmentation`: R∞/J≅R̄_S^{□,ψ} preserving local deformation and framing maps.
- `dyadicPatchedRing_fibre`: R∞ is the quotient of R′∞ cut out by d=1, obtained from the vanishing small kernels in the limit.

(Source: [KW2-2009, §9.1.3, Proposition 9.3 (I) and its proof, pp. 83–87][KW2-2009].) *Needs:* GlobalGaloisDeformations:R04.6/dyadic-patching-data; GlobalGaloisDeformations:R04.4/truncated-actions; GlobalGaloisDeformations:R04.4/twist-action-free; §2.12; §3.1; §1.12; DeformationAndDerivedPatchingAlgebra R03.5/characteristic-zero-open-quotient-patching; §1.13; §1.14; §6.3; §3.3.

**Checks.**

- For t = 0 the torus and determinant constraint are trivial in the limiting construction. This recovers the shape of ordinary module patching, not an identification between rings in characteristics 2 and p > 2.
- d(λx) = λ²d(x): twisting by a character multiplies the determinant by its square.
- The torus action is not free on the unframed rings without the non-solvable image hypothesis (GlobalGaloisDeformations R04.4/twist-action-free).
- For t=0 there is no determinant torus parameter.
- Further quotient by the j framing variables gives the unframed fixed-determinant ring.
- The datum permits a nonzero kernel D″_m→D_m in m^m; finite-level equality is not an axiom.

### 6.5 Dyadic patched module

Construct `dyadicPatchedModule` as the inverse limit of the compatible L_m. Prove it is an R_infty-module finite free of rank s>0 over S_infty, with action through the specified scalar homomorphism. Its J-augmentation is M^square and its full augmentation is M, equivariantly for the deformation and Hecke actions. Include compatible finite-level bases and surjective reduction maps in this construction. At this stage the faithful Hecke action is that of T^square on M^square; faithfulness of the patched deformation action is a separate theorem.

The enhanced dyadic data have been stabilised compatibly (patching-data-finite-and-compatible); each L_m is free of rank s over S∞/c_m with chosen basis, and the transition maps are surjective.

Choose bases for the finite free scalar modules together with the other finite structured data. The stabilization and compatible reductions give M∞≅S∞^s and a continuous R∞ action. Pass the equivariant augmentation maps to the inverse limit using the supplied finite-module exactness statement. Quotient first by J, then by the framing variables. Faithfulness over R∞ is established in dyadic-patched-module-faithful.

The intended named interface is:

- `dyadicPatchedModule`: The inverse-limit module with its R∞ and S∞ actions.
- `dyadicPatchedModule_free`: It is finite free of rank s over S∞.
- `dyadicPatchedModule_aug`: Augmentation by J gives the framed Hecke module with both deformation and Hecke actions.

(Source: [KW2-2009, Proposition 9.3(I), pp. 83–87][KW2-2009].) *Needs:* §6.4; §3.3; §1.13.

**Checks.**

- M∞/(y_1,…,y_h) ≅ M^□ and M∞/(y_1,…,y_{h+j}) ≅ S_{k,ψ}(U,O)_𝔪.
- Faithfulness of M∞ over R∞ is not part of this construction; it is dyadic-patched-module-faithful.
- Rank s=1 gives an S∞-module isomorphic to S∞.
- Quotient by J and then framing equals quotient by all y at once.
- The zero module is excluded by s>0; it cannot prove faithfulness or a dimension lower bound.

### 6.6 Free patched determinant torus action

Assemble the compatible free action chunks into a free action of T on Sp R'_infty and a determinant map d with d(ell x)=ell²d(x). Identify d^(-1)(1) with Sp R_infty. Only the subgroup T[2] acts on this fibre. The full formal torus acts on the variable-determinant space, and attempting to act on the determinant-one fibre would change the fixed determinant.

T = Hom(ℤ^t, Ĝ_m) is the formal torus of KW II §9.1.3; the stabilised action chunks of T_{2^m} on Sp D′_m are free and compatible under reduction.

The finite action laws and freeness are among the stabilized compatible maps. Any Artinian test algebra is seen by a sufficiently deep action chunk, so their limit gives the formal torus action and its freeness. The determinant-squaring identities hold at every finite level and hence in the limit. The determinant-one comparison kernels tend to zero. Thus the fibre is Sp R∞, and its preserving subgroup is the kernel T[2] of squaring.

The intended named interface is:

- `dyadicTorusAction`: The free formal T-action on the ambient patched formal spectrum.
- `dyadicDet_smul`: The determinant morphism is equivariant for squaring on T.
- `dyadicTorusAction_two_torsion`: Restriction to T[2] preserves d=1 and acts on Sp R∞.

(Source: [KW2-2009, Proposition 9.3(I)(3), pp. 84–87][KW2-2009].) *Needs:* §6.4; §6.3; GlobalGaloisDeformations:R04.4/truncated-actions; GlobalGaloisDeformations:R04.4/free-action-quotient.

**Checks.**

- For t = 1 and λ ∈ T(A), d(λx) = λ²d(x); so λ = −1 preserves the fibre d = 1 and λ with λ² ≠ 1 does not.
- The action is on Sp R′∞; R∞ is only stable under T[2].
- At t=0 the acting formal group is trivial.
- For t=1, multiplying by ℓ changes the determinant parameter by ℓ².
- An element with ℓ²≠1 does not preserve the determinant-one fibre.

### 6.7 The torsor structure of the dyadic patched ring

Let R_infty^inv represent the quotient of the free T-space Sp R'_infty. Prove that Sp R_infty→Sp R_infty^inv is a T[2]-torsor. It is finite flat of degree 2^t, and becomes etale after inverting two. The assertion follows from the squaring equivariance and the determinant-one fibre, rather than from freeness of T on that fibre. The trivial-torus case has degree one.

The free T-action and determinant-squaring map are the data of dyadic-patched-ring; X∞ is its determinant-one fibre.

Lemma 9.4: the fibre product X′_∞ ×_T T of pairs (x, λ) with d(x) = λ² is a T × T[2]-torsor over Sp R^inv_∞; (x, λ) ↦ (λ^{−1}x, λ) identifies it with X_∞ × T, and quotienting by T gives the free T[2]-action on X_∞ with quotient Sp R^inv_∞ (GlobalGaloisDeformations R04.4/determinant-twist-torsor).

(Source: [KW2-2009, §9.1.3, Lemmas 9.4–9.6, pp. 87–88][KW2-2009].) *Needs:* §6.4; GlobalGaloisDeformations:R04.4/determinant-twist-torsor; GlobalGaloisDeformations:R04.4/free-action-quotient; §6.5; §6.6.

**Checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.

### 6.8 The dyadic patched power-series presentation

Assume the KW minimal local tensor B is an O-flat domain of dimension d+1 with regular generic fibre. Use the scalar-free module of rank s>0 and the global dimension identity to prove A'=B[[x₁,…,x_(h+j+t−d)]]=R'_infty. The quotient description then makes R_infty^inv an O-flat domain and the patched module faithful over it. This is the domain argument for the minimal dyadic local conditions; for Kisin's possibly reducible local tensor use the component-support argument instead.

B is a domain of dimension d + 1 with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings R08.6/export-completed-tensor-product). Faithfulness over R_∞ uses the action of T[2](𝒪) ≅ (±1)^t by twists on the modular forms at every level (§2.12), compatible with its action on 𝒪⟦y⟧ by χ·y_i = χ(δ_i)(1 + y_i) − 1 (KW II Lemma 5.12).

Lemma 9.5: if B⟦x⟧ → R′_∞ were not injective, dim R′_∞ < h + j + t + 1, so dim R^inv_∞ < h + j + 1 (free-action-quotient), and dim R_∞ < h + j + 1 since R_∞ is finite over R^inv_∞. This contradicts the faithful action of 𝒪⟦y_1, …, y_{h+j}⟧, of dimension h + j + 1, on the finite module M_∞ through R_∞. If the action of the domain R^inv_∞ on M∞ factored through a proper quotient, its dimension would fall, contradicting faithful action of 𝒪[[y₁,…,y_{h+j}]] on a finite module. Retain all dimension and finiteness hypotheses of KW II Lemma 9.5.

(Source: [KW2-2009, Lemma 9.5 and following paragraph, p.87][KW2-2009].) *Needs:* §6.4; §6.7; GlobalGaloisDeformations:R04.4/free-action-quotient; LocalGaloisDeformationRings:R08.6/export-completed-tensor-product; §6.5; §6.6; DeformationAndDerivedPatchingAlgebra R03.3/finite-map-cm-transfer; DeformationAndDerivedPatchingAlgebra R03.3/depth-auslander-buchsbaum-and-dimension-bounds.

**Checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.
- Without the twist compatibility, full support on one component would not propagate to the others.

### 6.9 Regularity of the dyadic patched generic fibres

In the same minimal domain setting, prove R_infty^inv[1/2] regular from the torus quotient and regularity of R'_infty[1/2]. The finite etale T[2]-torsor then gives regularity of R_infty[1/2]. Neither conclusion asserts integral smoothness: at two the torsor is not etale and the real-place odd lifting ring is singular.

B is a domain of dimension d + 1 with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings R08.6/export-completed-tensor-product). Faithfulness over R_∞ uses the action of T[2](𝒪) ≅ (±1)^t by twists on the modular forms at every level (§2.12), compatible with its action on 𝒪⟦y⟧ by χ·y_i = χ(δ_i)(1 + y_i) − 1 (KW II Lemma 5.12).

Lemma 9.6(a): R^inv_∞ → R′_∞ ≅ B⟦x⟧ is formally smooth, so R^inv_∞[1/2] is regular, and R^inv_∞[1/2] → R_∞[1/2] is étale.

(Source: [KW2-2009, Lemma 9.6, p. 88][KW2-2009].) *Needs:* §6.8; §6.7; LocalGaloisDeformationRings:R08.6/export-completed-tensor-product; §6.5; §6.6; DeformationAndDerivedPatchingAlgebra R03.3/regularity-localization-and-descent.

**Checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.
- Without the twist compatibility, full support on one component would not propagate to the others.

### 6.10 Faithfulness of the dyadic patched module

Prove faithfulness of M_infty over R_infty using the actual semilinear action of T[2](O)=(±1)^t on the module and its scalar ring. For a chosen diamond generator delta_i the scalar variable transforms by y_i↦chi(delta_i)(1+y_i)−1. The twist action is compatible with the deformation action, permutes the generic components transitively over the invariant domain, and makes the support contain them all. The O-flat finite-flat torsor and the support/depth argument then remove the integral annihilator. Faithfulness over the invariant ring alone is not this conclusion.

B is a domain of dimension d + 1 with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings R08.6/export-completed-tensor-product). Faithfulness over R_∞ uses the action of T[2](𝒪) ≅ (±1)^t by twists on the modular forms at every level (§2.12), compatible with its action on 𝒪⟦y⟧ by χ·y_i = χ(δ_i)(1 + y_i) − 1 (KW II Lemma 5.12).

Lemma 9.6(b): Supp M_∞[1/2] contains a component of Spec R_∞[1/2]; T[2](𝒪) acts transitively on these components (R^inv_∞[1/2] is a regular domain) and preserves the support (the twist compatibility at each level), so the support is everything (DeformationAndDerivedPatchingAlgebra R03.6/completion-generic-special-components). The algebra is DeformationAndDerivedPatchingAlgebra R03.6/faithful-group-transitive, applied to the reduced ring R∞[1/2] with the T[2](𝒪)-action. The T[2]-torsor is finite flat, and becomes étale after inverting 2 over the regular domain R^inv∞[1/2]. Its torsor group permutes components transitively: invariants of the nonempty stable union are a nonempty open-and-closed subset of the connected base. Twist-equivariance makes the support such a stable union. Reducedness gives generic faithfulness, then O-flatness of R∞ makes the localization map injective and gives integral faithfulness.

(Source: [KW2-2009, Lemma 9.6, p. 88][KW2-2009].) *Needs:* §6.7; §6.8; §6.9; §2.12; DeformationAndDerivedPatchingAlgebra R03.6/completion-generic-special-components; §6.5; §6.6; DeformationAndDerivedPatchingAlgebra R03.6/faithful-quotient-ring-identification; DeformationAndDerivedPatchingAlgebra R03.6/faithful-group-transitive.

**Checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.
- Without the twist compatibility, full support on one component would not propagate to the others.

### 6.11 R = T after inverting 2

In this minimal dyadic setting with nonsolvable residual image, prove R^square finite over O[[framing variables]], R finite over O, and the surjection R^square→T^square has kernel killed by one power of two. After inverting two use regularity and the finite-map depth comparison to obtain a faithful finite projective patched module; descend this along the augmentations. Finite generation makes the exponent uniform. The conclusion is generic-fibre R=T and identification of the maximal O-flat quotient, not an unsupported integral R=T assertion.

The Auslander–Buchsbaum step (Kisin's Lemma 3.3.4) is supplied by DeformationAndDerivedPatchingAlgebra R03.3, as for Layer 3.

R_∞ injects into End_{𝒪⟦y⟧}(M_∞), which is finite over 𝒪⟦y⟧; so R_∞ is finite over 𝒪⟦y⟧ and its quotients R̄^{□,ψ}_S = R_∞/(y_1, …, y_h) and R̄^ψ_S = R_∞/(y_1, …, y_{h+j}) are finite over 𝒪⟦y_{h+1}, …⟧ and 𝒪. On each connected component of Spec R_∞[1/2] (regular, dyadic-patched-torsor) the corresponding summand of M_∞[1/2] is finite projective, nonzero by faithfulness; so M_∞[1/2] is faithful and projective over R_∞[1/2], and its reduction mod (y_1, …, y_h) is faithful over R̄^{□,ψ}_S[1/2]. Generic-fibre faithfulness makes the map to 𝕋^□ injective after inverting 2, so the integral kernel is contained in the 2-power torsion ideal. Conversely, torsion-in-kernel puts that ideal in the kernel since the Hecke module is 𝒪-torsion-free. Apply r-equals-t-torsion-free-quotient. The lemma torsion-in-kernel alone proves only the converse containment.

(Source: [KW2-2009, Proposition 9.3 (II)–(III) and the end of its proof, pp. 84 and 88–89][KW2-2009].) *Needs:* §6.7; §6.4; §1.12; DeformationAndDerivedPatchingAlgebra R03.6/faithful-quotient-ring-identification; DeformationAndDerivedPatchingAlgebra R03.3/depth-auslander-buchsbaum-and-dimension-bounds; DeformationAndDerivedPatchingAlgebra R03.6/maximal-flat-quotient; §6.8; §6.9; §6.10; §6.5; §6.6.

**Checks.**

- If R̄^{□,ψ}_S is 𝒪-flat the kernel vanishes and R̄^{□,ψ}_S ≅ 𝕋^□; in general DeformationAndDerivedPatchingAlgebra R03.6/r-equals-t-torsion-free-quotient gives the torsion-free quotient version.
- The kernel may be nonzero integrally, but every element in it is killed by a power of 2; non-torsion kernel elements are excluded.
- The finiteness of R̄^ψ_S here is at the level of KW II's lifting data; the finiteness for arbitrary local rings (KW II Theorem 10.1) belongs to PotentialModularityAndCompatibleSystems.

### 6.12 The Khare–Wintenberger 2-adic lifting theorem

Let F be totally real and unramified at two, split there when the local residual representation is irreducible. Let bar-rho have nonsolvable image and the KW beta witness, together with alpha in residual weight two. Suppose rho is a totally odd, finitely ramified lift with the fixed KW datum. At each place above two assume it is crystalline weight two or semistable noncrystalline weight two, allowing the latter only when the local residual representation is not finite, the residual-weight-four case. Prove rho modular by fitting an automorphic witness to the local datum, applying the dyadic comparison and descending. The archimedean odd condition is on rho itself.

F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions). Oddness is imposed on the lift, through the archimedean rings of odd lifts (dyadic-oddness); it cannot be read off ρ̄(c). The local rings at 2 and the twisting calculations are LocalGaloisDeformationRings R08.6 (export-semistable-weight-two-at-p, export-fontaine-laffaille-irreducible at p = 2) and R08.5 .

Allowable base change (solvable-base-change-reduction), as for odd p, so that ρ_F prescribes lifting data and ψ and is an 𝒪-point of R̄^{□,ψ}_S; the non-solvable image survives by linear disjointness. SerreWeightAndLevelOptimisation R20.6/prescribed-local-type-lifts (KW II Theorem 8.4) gives π′ fitting the same lifting data. dyadic-r-equals-t: R̄^{□,ψ}_S[1/2] ≅ 𝕋^□[1/2], so ρ_F is modular; descend along the solvable extension.

(Source: [KW2-2009, §9.2, Theorem 9.7 and its proof, pp. 89–90][KW2-2009]; [KW1-2009, Theorem 4.1(1), p. 7][KW1-2009].) *Needs:* §6.11; §6.1; §1.1; §5.1; §1.6; LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p; LocalGaloisDeformationRings:R08.5/rank-two-connected-components; LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2; LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison; §1.2; SerreWeightAndLevelOptimisation:R20.6/prescribed-local-type-lifts.

**Checks.**

- ρ̄ with image SL_2(𝔽_4) ≅ A_5 satisfying (α) and (β), and a crystalline weight-two odd lift: covered.
- A lift with ρ(c) = −1 at some real place is excluded: it is even, whatever ρ̄(c) is.
- Semistable non-crystalline lifts when ρ̄ is finite at 2 are excluded by the theorem's hypothesis.

### 6.13 KW I Theorem 4.1(1): 2-adic modularity lifting over ℚ

For a modular residual representation over Q of characteristic two and nonsolvable image, prove modularity of an odd, finitely ramified lift which is crystalline weight two, or semistable weight two in the residual Serre-weight-four branch. Use the weight theorem to produce beta and, in residual weight two, alpha, then apply the KW dyadic lifting theorem over an allowable field and descend. Residual weight four is precisely the nonfinite-at-two branch. Potential modularity and finiteness for a nonmodular global deformation problem are not inputs.

Oddness is a hypothesis on the lift: det ρ(c) = −1. It cannot be read off ρ̄ in characteristic 2 (§6.1). k(ρ̄) = 4 exactly when ρ̄ is not finite at 2; this matches the condition of Theorem 9.7 that the semistable non-crystalline case is considered only when the residual representation is not finite at the places above 2. The residual input over ℚ is 'ρ̄ modular'; it gives (β), and (α) when k(ρ̄) = 2, by §5.5. KW II remark that some results towards this statement are due to Dickinson; they are not used.

(β), and (α) if k(ρ̄) = 2, over every soluble totally real F unramified at 2 on which the image stays non-solvable (§5.5). An allowable F/ℚ (§1.4) over which ρ|_{G_F} has the shape required at the start of the proof of Theorem 9.7 (§5.1); the non-solvable image is preserved. Theorem 9.7 at p = 2 (§6.12): ρ|_{G_F} is modular. Descent to ℚ along the soluble tower (GL2AutomorphicRepresentationsAndTransfer R17.4).

(Source: [KW2-2009, §10.2, p. 92][KW2-2009]; [KW1-2009, Theorem 4.1, p. 7][KW1-2009].) *Needs:* §5.5; §6.12; §6.1; §5.1; §1.4; §1.5; GL2AutomorphicRepresentationsAndTransfer:R17.4.

**Checks.**

- ρ̄ with image SL₂(𝔽₄) ≅ A₅, modular, and an odd crystalline lift of weight 2: covered.
- A semistable non-crystalline lift when ρ̄ is finite at 2 (k(ρ̄) = 2) is not covered.
- An even lift is not covered, whatever ρ̄(c) is.

### 6.14 Kisin's dyadic component criterion

Let bar-rho over a totally real F have nonsolvable image and at each v|2 either be locally trivial or have local residue field F₂. Use a definite quaternion algebra unramified above two and ramified at the finite set Sigma, and a weight-two eigenform f with the same residual representation at a level maximal above two. Let rho be Barsotti–Tate at every v|2 with the same fixed determinant. Require rho_f at v in Sigma to have the specified extension of gamma_v by gamma_v(1); away from Sigma and two require f unramified; and above two require rho_f ordinary exactly where rho is ordinary. Prove rho is rho_g for an eigenform g at the stated level. Here the local tensor may be reducible: patch its components, pass to the invariant ring, compare rho and rho_f on the same local components, and use the quadratic-twist action to descend their support through the torsor.

The Barsotti–Tate local rings at v | 2 and their components (ordinary and non-ordinary, flat with the connectedness of Kisin's §§2.3–2.4) are supplied by LocalGaloisDeformationRings R08.4 (p = 2) and R08.5; the rings away from 2 are R08.6/export-away-from-p.

Patch as in dyadic-patched-ring with B the completed tensor product of the chosen components; component-patching and dyadic-patched-torsor apply unchanged, with T[2] acting transitively on the components of Spec R_∞[1/2]. The conditions (1)–(3) put ρ and ρ_f on the same component of each local ring (Kisin (2.3.13), (2.4.6), (2.5.2)–(2.5.6)); the point of ρ_f is in the support, so the point of ρ is, by the transitivity of T[2].

(Source: [KISIN-2ADIC-2009, Proposition (3.2.9) and its proof, pp. 40–42][KISIN-2ADIC-2009].) *Needs:* §6.7; §5.2; LocalGaloisDeformationRings:R08.4; LocalGaloisDeformationRings:R08.6/export-away-from-p; LocalGaloisDeformationRings:R08.4/rank-two-bt-components; LocalGaloisDeformationRings:R08.5/rank-two-connected-components; LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2; LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison.

**Checks.**

- ρ and f both non-ordinary at every v | 2 with κ(v) = 𝔽_2: covered.
- ρ ordinary and f non-ordinary at some v | 2: condition (3) fails, and the two points lie on different components.
- κ(v) = 𝔽_4 with ρ̄|G_{F_v} non-trivial is excluded (the connectedness input needs 𝔽_2 or trivial ρ̄|G_{F_v}).

### 6.15 Kisin's 2-adic Barsotti–Tate lifting theorem

Let F be totally real and rho be a finitely ramified continuous two-adic representation, with modular nonsolvable residual image and determinant epsilon psi for a totally even finite-order psi. Assume rho is potentially Barsotti–Tate at every v|2 and F_v=Q₂ wherever it is potentially ordinary. Prove rho comes from a parallel-weight-two Hilbert eigenform. Distinguish the statements and the reduction: Theorems 0.9 and 3.3.5 in the linked DVI literally state Barsotti–Tate; Theorem 0.1 states the potentially Barsotti–Tate conclusion over Q. For the displayed general potentially Barsotti–Tate formulation carry out the argument of 3.3.5: first use Lemmas 3.3.1–3.3.3 over the original Q₂ ordinary places to match potential ordinarity of the modular witness, then take an admissible local-prescribed extension making both representations Barsotti–Tate with trivial local reduction and matching ordinary components. Use Lemma 3.3.4 to remove the extra finite levels, match determinants by the finite-order character extension, apply 3.2.9 over that extension and descend. Thus the general formulation includes this additional local-type/base-change reduction as a proof obligation; it is not a quotation of the printed Barsotti–Tate hypothesis. Over Q the explicit potentially Barsotti–Tate Theorem 0.1 supplies the conclusion directly.

The version read prints hypothesis (2) of Theorem (0.9) and Theorem (3.3.5) as 'Barsotti-Tate'; the proof treats potentially Barsotti–Tate ρ, and Theorem (0.1) over ℚ says 'potentially Barsotti–Tate'. The statement here is the potentially Barsotti–Tate one. The type and level changes of quaternionic eigenforms (Kisin Lemmas (3.3.1)–(3.3.4)) are supplied by SerreWeightAndLevelOptimisation R20.6.

Admissible extension F′/F (solvable-base-change-reduction) and a definite quaternion algebra D over F′, unramified above 2, with: unipotent inertia away from 2, nontrivial exactly at Σ; potentially ordinary places v | 2 split completely; and an eigenform f on D with ρ̄_f ≅ ρ̄|G_{F′}. Lemma (3.3.2): make the types of f cuspidal at the non-potentially-ordinary v | 2; Lemma (3.3.1): at the potentially ordinary v (where F_v = ℚ_2) make f potentially ordinary of type Ind θ. After a further admissible extension the types are trivial, and ρ_f is ordinary at v | 2 exactly when ρ is; also ρ̄|G_{F′_v} is trivial for v | 2. At v ∈ Σ, the unramified characters of ρ_f and ρ agree after a composite of quadratic extensions. Lemma (3.3.4): make π_f unramified outside Σ; match ψ. kisin-dyadic-component-criterion gives modularity over F′; descend. The case F = ℚ is Theorem (0.1).

(Source: [KISIN-2ADIC-2009, Theorem (0.1), p. 2][KISIN-2ADIC-2009]; [KISIN-2ADIC-2009, Theorem (3.3.5) and its proof, pp. 45–46][KISIN-2ADIC-2009].) *Needs:* §6.14; §5.1; §6.1; SerreWeightAndLevelOptimisation:R20.6.

**Checks.**

- The 2-adic Tate module of an elliptic curve E/ℚ with ρ̄_{E,2} of image S_3 is excluded: the image is solvable.
- An elliptic curve over a totally real F with potentially good ordinary reduction at a prime v | 2 with F_v ≠ ℚ_2 is excluded by (3).
- ψ must be totally even: det ρ = χψ with ψ odd at some real place would make ρ even there.

### 6.16 Hypothesis (H) of Khare–Wintenberger

At p=2 prove the following weight-two lifting assertion: a continuous odd, irreducible, finitely ramified rho over Q, potentially crystalline with weights {0,1} at two, and with modular nonsolvable residual representation, is modular. Use the finite-flat comparison to identify this local condition with potential Barsotti–Tate, and the rank-one geometric determinant theorem to write det rho=epsilon psi with psi finite order. Oddness makes psi even. Apply the explicit Q theorem just stated. This is the conditional modularity assertion needed for the two-adic member in the KW argument; no existence or compatibility of other members is asserted here.

Potentially crystalline of weight 2 (Hodge–Tate weights {0, 1}) is the same as potentially Barsotti–Tate: a crystalline representation of G_K with Hodge–Tate weights {0, 1} arises from a p-divisible group (Breuil for p > 2, Kisin for all p). This is supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4. Oddness here is det ρ(c) = −1 (dyadic-oddness); irreducibility of ρ is implied by the non-solvable residual image and is not used.

det ρ = χ_2·ψ with ψ of finite order: det ρ·χ_2^{−1} is a character of G_ℚ, unramified outside a finite set and of Hodge–Tate weight 0 and potentially crystalline at 2, hence finite on an open subgroup of every inertia group; since G_ℚ^{ab} ≅ ℤ̂^× is generated by the inertia groups, ψ has finite order. ψ is even: χ_2(c) = −1 and det ρ(c) = −1. Potentially crystalline of weight 2 gives potentially Barsotti–Tate (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4). kisin-dyadic-bt-lifting over ℚ applies.

(Source: [KW1-2009, §9, Hypothesis (H) and the proof of Theorem 9.1, pp. 18–19][KW1-2009].) *Needs:* §6.15; §6.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt.

**Checks.**

- The 2-adic Tate module of an elliptic curve E/ℚ whose mod-2 image is GL_2(𝔽_2) ≅ S_3 is outside (H): the image is solvable (the mod-2 image of any elliptic curve over ℚ lies in GL_2(𝔽_2) ≅ S_3), so KW apply (H) to 2-adic members of compatible systems with non-solvable residual image.
- An even ρ (det ρ(c) = 1) is excluded, even though its residual det ρ̄(c) = 1 = −1 looks odd.
- Weight 3 potentially crystalline ρ is outside (H): Hodge–Tate weights {0, 2} are not Barsotti–Tate.

### Examples

Over a two-adic O, both I₂ and diag(1,−1) reduce to I₂, but only the latter is odd. For a one-dimensional twist torus, ell=−1 fixes the determinant-one fibre because ell²=1; a general ell does not. At t=0 the torus disappears, but a finite truncation can still have a nonzero comparison kernel in m^m.

### Dependencies

Layers 1–3 and 5; R04.4–R04.6 truncated twists, free actions and numerical data; R08.4–R08.6 dyadic/real components; R03.3–R03.6 torsors, regularity, support and patching; R18 quadratic norm twists; R20 type changes.


## Layer 7: Modern lifting statements and normalisation

### 7.1 The signed prime p*

Define `pStar p : Z` for every natural p by (-1)^((p−1)/2) p, with natural subtraction and division in the exponent. Prove its absolute value is p. The total function includes p=0,1,2; only odd primes are used in the quadratic-field statements. The subfield of Q(zeta_p) is supplied by the separate arithmetic criterion, not by this numerical definition.

Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition.

The intended named interface is:

- `pStar`: The integer (-1)^((p−1)/2)·p.
- `pStar_eq`: pStar(p)=(-1)^((p−1)/2)·p.
- `pStar_natAbs`: The natural absolute value of pStar(p) is p, for every natural p; only the sign depends on p modulo four.

(Source: [DIEULEFAIT-PACETTI-PUBLISHED, §1.2, definition immediately before Theorem1.4, published p.4][DIEULEFAIT-PACETTI-PUBLISHED].) *Needs:* Mathlib natural arithmetic, integer powers and Int.natAbs.

**Checks.**

- pStar(3)=−3.
- The arithmetic definition gives pStar(2)=2; the odd-prime quadratic-subfield assertion is not asserted at p=2.
- pStar(5)=5.
- pStar(7)=−7, so replacing the signed prime by p would be wrong.

### 7.2 The odd-prime modularity-lifting proposition

For an odd prime p define `OddPrimeLifting p` as the following universal implication. A continuous odd rho:G_Q→GL₂(Qbar_p), descended to a finite coefficient field, ramified at finitely many primes, de Rham at p with weights {0,k−1}, k>1, with an actual cuspidal residual modularity witness and bar-rho absolutely irreducible on G_(Q(sqrt(pStar p))), comes from a weight-k cuspidal eigenform. The data include a stable lattice and the common residual coefficient embedding. This predicate retains residual modularity; it is the conditional formulation proved by Layer 8.

Only the forms that assume ρ̄ modular are declared (§7.10); (c) and (d) need no residual modularity. 'de Rham', Hodge–Tate weights and p-adic Hodge types are LocalGaloisDeformationRings R08.3/hodge-and-galois-types; ρ_g is de Rham at p with Hodge–Tate weights {0, k − 1} by AutomorphicGaloisRepresentations R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime. A residual modularity witness is actual eigenform data, as in §1.6.

Define this proposition; its proof is odd-prime-statement-over-q, not an assumption inside the proposition.

The intended named interface is:

- `OddPrimeLifting`: For an odd prime p, OddPrimeLifting(p) is the following proposition: every continuous odd ρ:G_ℚ→GL₂(ℚ̄_p), ramified at finitely many primes, whose residual representation restricted to G_{ℚ(√p*)} is absolutely irreducible, whose restriction at p is de Rham with weights {0,k−1} for k>1, and whose residual representation is that of a cuspidal newform, is the representation of a weight-k cuspidal eigenform.
- `oddPrimeLifting_apply`: A proof of OddPrimeLifting(p) applied to a representation, k and every listed hypothesis produces a weight-k modularity witness.
- `oddPrimeLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.4, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime; §1.6; §7.1; ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field; ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices; ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence.

**Checks.**

- (a) is stated at p = 3: none of its hypotheses restricts p ≥ 5.
- (c) is stated only for p ≥ 5. At p = 3 the case ρ̄^{ss} ≅ 1 ⊕ χ̄₃ is (d); Pan's Theorem 1.0.2 excludes it (Layer 11).
- A statement that assumes only that ρ̄ is odd, and takes its modularity from Khare–Wintenberger, is not in the table.
- The proposition at p=3 uses ℚ(√−3)=ℚ(ζ₃) and has no p≥5 restriction.
- Residual oddness alone is not a witness for the residual modularity hypothesis.
- At k=2 the Hodge–Tate hypothesis is exactly the weight multiset {0,1}.

### 7.3 The dyadic modularity-lifting proposition

Define `DyadicLifting` by the same characteristic-zero continuity, finite-coefficient descent, finite ramification, oddness and regular de Rham weights {0,k−1}, k>1, at p=2, replacing the quadratic restriction by a modular residual representation with nonsolvable image. Its conclusion is a weight-k cuspidal eigenform over Q. Characteristic-zero oddness is an independent premise even if the residual representation is called odd in a source.

Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition.

The intended named interface is:

- `DyadicLifting`: The stated dyadic proposition with oddness of the lift separate from its residual image.
- `dyadicLifting_apply`: A proof applied to the listed representation data gives a weight-k eigenform.
- `dyadicLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.5, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime; §1.6; ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field; ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices; ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence.

**Checks.**

- For k=2 the weights are {0,1}.
- Determinant −1 reduces to +1 in characteristic two; residual oddness cannot replace oddness of the lift.
- A modular residual representation with dihedral image does not meet the nonsolvable-image hypothesis.

### 7.4 The residually reducible lifting proposition

For a prime p≥5 define `ResiduallyReducibleLifting p` to assert modularity of a continuous irreducible odd rho over Qbar_p, descended to finite coefficients, finitely ramified and de Rham at p with weights {0,k−1}, k>1, whose residual semisimplification is a sum chi₁⊕chi₂ of characters. The conclusion is a weight-k cuspidal eigenform. Neither a residual cuspidal modularity witness nor residual absolute irreducibility is a premise. Characteristic-zero irreducibility is essential.

Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition.

The intended named interface is:

- `ResiduallyReducibleLifting`: The stated proposition for prime p≥5.
- `residuallyReducibleLifting_apply`: A proof applied to all listed data yields a weight-k eigenform without a residual cuspidal modularity hypothesis.
- `residuallyReducibleLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.6, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime; §1.6; ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field; ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices; ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence.

**Checks.**

- The proposition's range excludes p=3.
- The endpoint p=5 is included.
- A reducible characteristic-zero ρ cannot be substituted for the required irreducible lift merely because its residual semisimplification is χ₁⊕χ₂.

### 7.5 The ordinary residually reducible 3-adic proposition

Define `OrdinaryThreeLifting` for continuous irreducible odd finitely ramified rho over Qbar₃ with finite coefficient descent, residual semisimplification 1⊕omega₃, inertia shape upper triangular with quotient 1, and det rho=psi epsilon₃^(k−1), with psi of finite order and k≥2. Its conclusion is a weight-k eigenform. The ordinary shape is an actual invariant line and unramified quotient, not merely a residual diagonalisation; the displayed inertia condition supplies the unramified quotient after restriction to the decomposition group as required by the ordinary theorem. The residual characters are distinct already on inertia because omega₃ is nontrivial there. No arbitrary-character replacement for finite-order psi is allowed.

Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition. Its theorem-level use imports R21.5/theorem-a-at-three. The existing Arithmetic R01.1 Baire coefficient-field descent, stable-lattice theorem and lattice-independent residual semisimplification transport the algebraic-closure formulation to the supplier’s finite coefficient formulation.

The intended named interface is:

- `OrdinaryThreeLifting`: The stated ordinary 3-adic proposition with finite-order ψ.
- `ordinaryThreeLifting_apply`: A proof applied to the inertia, determinant, irreducibility and residual data gives a weight-k eigenform.
- `ordinaryThreeLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.7, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three; ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field; ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices; ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence.

**Checks.**

- χ̄₃ has image containing −1≠1 on the local decomposition group at 3.
- At k=2 the determinant has form ψχ₃.
- Residual semisimplification 1⊕χ̄₃ alone does not imply the required ordinary inertia condition for the characteristic-zero lift.

### 7.6 Consequences of non-solvable residual image

For any p, including two, show that a continuous finite residual image in GL₂(Qbar_p) which is nonsolvable is absolutely irreducible. A preserved line conjugates the image into the solvable upper triangular group. If K/Q is finite solvable Galois, its restricted image remains nonsolvable: its normal quotient is a quotient of Gal(K/Q), so solvability of the restricted image would imply solvability of the original image. Deduce absolute irreducibility over every Q(zeta_(p^n)), and the quadratic irreducibility condition when p is odd. This implication does not have a converse: an irreducible dihedral image may be solvable.

Solvability is Mathlib's Group.IsSolvable. Subgroups and extensions: Group.isSolvable_of_isSolvable_injective and Group.isSolvable_of_ker_le_range.

A reducible subgroup preserves a line; in an adapted basis it is contained in Tau Ceti’s upper-triangular subgroup, whose solvability is already proved by UpperTriangularGroup.instIsSolvable. Solvability passes to subgroups and conjugates, giving (i). Im(ρ̄|G_K) is normal in Im ρ̄, with quotient a quotient of Gal(K/ℚ). If it were solvable, Im ρ̄ would be solvable. Then apply (i) to ρ̄|G_K; this gives (ii). ℚ(ζ_{p^n})/ℚ is abelian, and ℚ(√p*) ⊂ ℚ(ζ_p); this gives (iii).

(Source: [DIEULEFAIT-PACETTI, Theorem 1.5, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI]; [DIEULEFAIT-PACETTI, Proof of Theorem 1.5, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* mathlib:Group.IsSolvable; mathlib:Group.isSolvable_of_ker_le_range; mathlib:Group.isSolvable_of_isSolvable_injective; tauceti:TauCeti.UpperTriangularGroup.instIsSolvable.

**Checks.**

- p = 2: GL₂(𝔽₂) ≅ S₃ is solvable, so statement (b) excludes it, while SL₂(𝔽₄) ≅ A₅ is not solvable.
- The converse fails: an absolutely irreducible dihedral ρ̄ has solvable image.

### 7.7 Normalisation of distinct Hodge–Tate weights

With HT(epsilon)=1, prove that twisting a regular de Rham representation of weights a<b by epsilon^(−a) gives weights {0,k−1}, k=b−a+1≥2. Record the exact determinant twist epsilon^(−2a), the residual twist and the effect at complex conjugation: oddness is unchanged because the determinant is multiplied by a square of a sign. The argument uses the tensor and dual formulas for de Rham representations, not just the existence of a Hodge-type predicate.

The tensor-product and cyclotomic-twist formula for de Rham Hodge–Tate weights must be supplied; the definition of Hodge type alone is not that formula.

(i) Hodge–Tate weights shift by −a under ⊗ ε^{−a}.

(Source: [KISIN-FM-2009, Introduction, the main theorem, p. 2 (DVI)][KISIN-FM-2009].) *Needs:* LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; PadicHodgeTheory:R06.2.

**Checks.**

- Hodge–Tate weights {3, 7} normalise to {0, 4}, so k = 5.

### 7.8 Oddness of a lift at odd residue characteristic

For a characteristic-zero integral two-dimensional representation with residue characteristic p>2, prove that odd residual determinant at complex conjugation implies odd determinant of the lift. The determinant of an involution is ±1 and these have distinct reductions for odd p. At p=2 they coincide, so that argument supplies no oddness assertion. The representative `matrixOdd_scalar_twist` records invariance under scalar twists u with u²=1.

ρ takes values in GL₂ over a valuation ring with residue characteristic p>2; determinant commutes with reduction.

(iii) c² = 1 gives det ρ(c) ∈ {±1}, and its reduction det ρ̄(c) = −1 ≠ 1 when p is odd.

(Source: [TUNG-2021-P3, Theorem 4.7 (1), p. 15 (arXiv v4)][TUNG-2021-P3].) *Needs:* mathlib:ZMod.neg_one_ne_one; §6.1.

**Checks.**

- p = 3: −1 ≠ 1 in 𝔽₃.
- p = 2: diag(1, −1) is odd and reduces to the identity (§6.1).

### 7.9 The weight of a normalised modular twist

Suppose rho has weights {0,k−1}, k≥2, and rho=rho_g tensor chi for an actual weight-k' cuspidal eigenform, k'≥2. First show that the character chi itself is geometric: the chosen isomorphism embeds chi as the line of scalar multiples of that isomorphism in Hom(rho_g,rho); de Rham representations are closed under duals, tensors and subrepresentations, and both representations are unramified away from a finite set. Apply the global rank-one theorem to obtain chi=epsilon^m mu with mu finite order. Then {m,m+k'−1}={0,k−1} forces m=0 and k'=k. Convert mu to a Dirichlet character, twist g and pass to its primitive associate, retaining the fixed coefficient embedding. Thus rho is the representation of a weight-k newform, with its actual conductor rather than a guessed twisting level. If the source's 'up to twist' output has not yet produced an actual weight-at-least-two g, the algebraic-vector/classicality target in Layer 8 or 9 is needed before this argument.

ρ_g ⊗ ε^m μ has Hodge–Tate weights {m, m + k′ − 1} (AutomorphicGaloisRepresentations R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime). Twisting an eigenform by a Dirichlet character gives an eigenform of the same weight. The global finite-order Galois character corresponds to a Dirichlet character; k,k′≥2 fix the order of the two weights.

The isomorphism line is a Galois-stable subrepresentation of Hom(rho_g,rho); use R06 closure under duals, tensors and subobjects to prove it de Rham. Finite ramification follows from both representations. R01 rank-one classification gives chi=epsilon^m mu. Comparing the two ordered distinct weight pairs forces m=0 and k_prime=k. Use the existing ModularForms Layer 9 twist, R19 compatibility of its attached representation, and ModularForms Layer 4 passage to the primitive associate. Keep the coefficient embedding and discard the finite twisting level from the good-prime recognition set.

(Source: [DIEULEFAIT-PACETTI, Remark 2, p. 5 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* §7.7; R01.2 geometric rank-one character classification; R06.2 de Rham subobjects and tensor rules; R19.2 and R19.5 classical realisation and twisting; Tau Ceti ModularForms Layers 4 and 9.

**Checks.**

- Weights {0,4} of a twist of a weight-five form force cyclotomic exponent zero.
- Distinct weights exclude a weight-one witness.
- A general character twist is not automatically finite order times cyclotomic without a character-classification input.
- Weights {3,7} normalise to {0,4}, hence k=5; a finite character twist has weight zero and cannot change k.

### 7.10 Which forms of the lifting theorems assume residual modularity

Use the explicitly residual-modular versions of the odd-prime lifting theorems: Kisin's DVI Theorem 2.2.17 (published 2.2.18), Hu–Tan Theorem 6.3, Tung Theorem 4.7, and Dieulefait–Pacetti Theorem 1.4. Separate them from the introductory formulations which obtain residual modularity from the full Serre theorem. In particular Emerton's Theorem 1.2.4 passes through promodularity in Theorem 1.2.3, whose proof in §7.3 uses Serre. The conditional statement is available for an independent Serre argument only after its proof inputs have the restricted dependency closure specified in Layer 12; the wording of the introduction does not establish that closure.

§12.8 carries the audit of the proofs. This assertion fixes which statements are admissible.

For each paper, locate the theorem that assumes ρ̄ modular, and the step that deduces the introduction theorem from it by Khare–Wintenberger. Kisin: (2.2.17) and the sentence of the introduction on Khare–Wintenberger. Hu–Tan: Theorem 6.3 and the last line of its proof. Tung: Theorem 4.7, obtained by the method of Kisin and Hu–Tan. Emerton: Theorem 1.2.3 and §7.3.

(Source: [KISIN-FM-2009, Introduction, p. 2 (DVI)][KISIN-FM-2009]; [KISIN-FM-2009, Theorem (2.2.17) (2), p. 45 (DVI)][KISIN-FM-2009]; [HU-TAN-2015, Proof of Theorem 6.3, p. 35 (arXiv v2)][HU-TAN-2015]; [TUNG-2021-P3, Theorem 4.7, p. 15 (arXiv v4)][TUNG-2021-P3]; [EMERTON-LGC-2011, §7.3, proof of Theorem 1.2.3, p. 96][EMERTON-LGC-2011].) *Needs:* §7.2; §1.2; §7.3; §7.4; §7.5.

**Checks.**

- Hu–Tan's Theorem 1.4 is their Theorem 6.3 plus Khare–Wintenberger.
- Emerton's Corollary 1.2.2 assumes V promodular, and his route to promodularity uses Serre's conjecture, so his Fontaine–Mazur route is not used.
- Tung's Theorem 4.7 covers p = 3.

### 7.11 The local exclusions at p in the odd-prime sources, and how they are removed

Keep the local exclusions and orientations separate. Kisin's conditional theorem excludes bar-rho_p of shape chi tensor ((omega,*),(0,1)), including a zero extension class, and uses the semistable-over-an-abelian-extension hypothesis where his local input is known. His local lattice result also has the p=3 induced omega₂² and extension exceptions. Emerton's older global statement excludes the opposite orientation chi tensor ((1,*),(0,omega)). Paskunas's original Breuil–Mezard theorem has p≥5 and scalar local endomorphisms; Hu–Tan adds the split 1⊕omega case for p≥5; Tung supplies all local residual representations for every odd p, including p=3. The locally algebraic vector theorem removes the abelian-semista-bility restriction, and the corrected block/multiplicity results remove the local residual exceptions. These restricted local interfaces are specified in Layer 8. Pan's exclusion at p=3 concerns a globally reducible residual representation with local character ratio omega; it is a different lifting branch.

The local theorems (Breuil–Mézard in cycle form, Colmez's functor, locally algebraic vectors) are supplied by Layer 8 restricted block, algebraic-vector and all-block cycle targets.

Tabulate each source's exclusion with its locator. For each ρ̄_p, name a source that covers it: p ≥ 5 by Kisin, Paškūnas and Hu–Tan; p = 3 by Tung.

(Source: [KISIN-FM-2009, Introduction, the main theorem (2)–(4), p. 2 (DVI)][KISIN-FM-2009]; [KISIN-FM-2009, (1.2.7), p. 9 (DVI)][KISIN-FM-2009]; [PASKUNAS-BM-2015, Abstract, p. 1 (arXiv v3)][PASKUNAS-BM-2015]; [HU-TAN-2015, Introduction, after Theorem 1.4, p. 5 (arXiv v2)][HU-TAN-2015]; [TUNG-2021-P3, Remark 4.8, p. 15 (arXiv v4)][TUNG-2021-P3]; [EMERTON-LGC-2011, Theorem 3.3.22, p. 28][EMERTON-LGC-2011].) *Needs:* §7.2; Layer 8 restricted block, algebraic-vector and all-block cycle targets; §7.3; §7.4; §7.5.

**Checks.**

- p = 3, ρ̄_p = 1 ⊕ ω: excluded by (i) and (iii), covered only by (vi).
- p ≥ 5, ρ̄_p = 1 ⊕ ω: excluded by (i) and (iii), covered by (v) and (vi).
- p ≥ 5, ρ̄_p absolutely irreducible: covered by Kisin together with Emerton's Theorem 3.3.22.

### Examples

The signed values are pStar(3)=−3, pStar(5)=5 and pStar(7)=−7; the total numerical definition gives pStar(2)=2 without any quadratic-subfield assertion at two. Weights {3,7} become {0,4} after epsilon^(-3), hence classical weight five. If det rho=psi epsilon^4, oddness requires psi(c)=−1.

### Dependencies

Layer 1 witness meaning and Layer 6 oddness; R01.1–R01.5 coefficient descent, Clifford theory and rank-one classification; R06 Hodge–Tate tensor rules; R19 classical irreducibility and weights; Tau Ceti upper triangular solvability; ModularForms twisting and primitive associates.


## Layer 8: Corrected multiplicities and regular odd-prime lifting

### 8.1 Local types, weight multiplicities and the all-block cycle theorem

For G=GL₂(Q_p), K=GL₂(Z_p), fix a regular Hodge pair lambda=(a,b), a>b, an inertial type tau of finite image and a compatible determinant psi epsilon. Define `LocalTypeLattice` to record a K-stable lattice in sigma(lambda,tau)=Sym^(a−b−1)(E²) tensor det^b tensor sigma(tau), or in its crystalline version. Its residual multiplicities m_s(lambda,tau) count Jordan–Hölder occurrences, not just distinct weights. The smooth type is characterised by occurrence in an infinite-dimensional irreducible smooth G-representation with the corresponding inertial Weil–Deligne restriction; the crystalline version additionally requires zero monodromy. For scalar tau=eta⊕eta the semistable type is inflated Steinberg tensor eta∘det, while the crystalline type is eta∘det.

- `localTypeLattice.residualMultiplicity`: the nonnegative integer multiplicity of each irreducible K-weight.
- `localTypeLattice.lattice_independent`: semisimplification and those multiplicities are independent of stable lattice.
- `localTypeLattice.scalar_semistable`, `localTypeLattice.scalar_crystalline`: the two different scalar-type formulas.

**Checks.**

- For trivial scalar inertia, weight pair (1,0), the crystalline type is the trivial character of K and the semistable type is the inflated Steinberg representation; exchanging them changes the monodromy condition.
- For trivial crystalline inertia and 1≤a−b≤p, the residual algebraic type is the single irreducible Sym^(a−b−1)(k²) tensor det^b, with multiplicity one.
- Two occurrences of the same residual weight in a composition series contribute two to its multiplicity; replacing the series by its set of factors loses that value.

For every odd p and every residual two-dimensional representation, prove the Breuil–Mezard identities for both potentially semistable and potentially crystalline local quotients: their special-fibre cycles are the sums of the type multiplicities times cycles C_s depending only on the residual representation and the weight s. Taking multiplicities gives e(R_type/varpi)=sum_s m_s mu_s. Use cycles in the dimension of these special fibres: the fixed-determinant type ring has dimension four over O in the sense of total Krull dimension, so a nonzero O-flat special fibre has dimension three. Tung Theorem 1.2 labels these cycles four-dimensional; the dimension-compatible formulation here uses the same cycle identities in this dimension. The p=3 extension and induced blocks are included. Derive the elementary crystalline-weight formula mu_s=e(R_crystalline(s)/varpi) in the above irreducible-weight range, and retain zero rings/zero cycles.

(Source: [Tung, §1, Theorem 1.2 and Remark 1.3, pp. 3–4][TUNG-2021-P3]; [Hu–Tan, §1.1–§1.2, pp. 2–4][HU-TAN-2015].) *Needs:* R08.3 local type quotients; R17 local smooth correspondence/type characterisation; R15 integral algebraic weights; R03.3 cycles and multiplicities; the restricted patching/detection targets below for the all-block proof.

### 8.2 The compact block functor and regular algebraic vectors

In the fixed-central-character compact dual category supplied by smooth representation theory, form blocks using chains of nonzero Ext¹ between irreducible smooth representations. Define `GL2BlockData` by its block, a projective generator and its endomorphism ring; for the exceptional odd block take the quotient by the thick subcategory on which SL₂(Q_p) acts trivially when required. Construct the exact modified Colmez functor checkV on compact objects, in Tung's §2.2 normalisation, commuting with the inverse limits used here and with finite character twists. It kills the character objects removed by that quotient and induces the Hom isomorphisms and Ext¹ injections of Tung Lemma 2.7 and the equivalence onto its essential Galois image in Proposition 2.8, including the p=3 exceptional block.

- `gl2BlockData.projectiveGenerator`: its universal lifting property for epimorphisms in the block.
- `gl2BlockData.endomorphismAction`: the continuous endomorphism-ring action on the generator and its transported Galois object.
- `checkV.exact`, `checkV.twist`, `checkV.quotientHom`: exactness, finite-twist compatibility and the Hom comparison on the stated quotient.

**Checks.**

- Distinct irreducibles joined by a nonzero Ext¹ lie in one block, even if they are nonisomorphic; singleton isomorphism classes give the wrong blocks.
- The quotient kills a compact dual of a character factoring through determinant, while checkV of the Steinberg dual is nonzero in Tung's normalisation.
- At p=3 the block containing 1, Steinberg, omega∘det and its Steinberg twist must retain both noncharacter simple objects and their extension comparisons.

For an absolutely irreducible regular de Rham two-dimensional local representation V, construct its associated admissible unitary Banach representation B(V), with central character det(V) epsilon^(-1) via the stated Artin convention, and prove that its locally algebraic part is the tensor of the smooth representation attached to WD(V) and Sym^(a−b−1)E² tensor det^b in Tung's smooth-correspondence normalisation. In Emerton's source normalisation the formula is Sym^(a−b−1)E² tensor det^(b+1) tensor pi_p(V); the smooth factor and reciprocity convention must be transported together before identifying these formulas. This includes nonabelian potentially semistable types. Use the actual determinant/reciprocity conversion when passing to the global arithmetic-Frobenius convention. Only this correspondence, its block action, exact compact functor and algebraic-vector detection are required; the target is not the general p-adic Langlands programme.

For this Banach comparison also check: at weights (1,0) the algebraic tensor factor is Sym⁰ tensor det⁰, hence trivial in Tung's normalisation; at (4,1) it is Sym² tensor det, so its central algebraic exponent is four; and a finite character twist mu changes the central character by mu² and the smooth factor by mu∘det without changing the two Hodge–Tate weights. The type-Hecke and reciprocity conversion must preserve all three computations.

(Source: [Tung, §2.2–§2.4, Proposition 2.8, pp. 5–8, and Theorem 4.1, pp. 12–13][TUNG-2021-P3]; [Emerton, Theorem 3.3.22 and Remark 3.3.23, p. 28][EMERTON-LGC-2011]; [Pan, Theorems 3.4.5–3.4.6, pp. 28–29][PAN-2022].) *Needs:* R06 de Rham and (phi,Gamma)-module comparisons; R17 smooth local correspondence; the Banach category and compact duality contracts in the opening; R04 local universal determinant action. Pan's block statements retain their p=3 exclusions when used in Layer 10; Tung's all-block replacement is used for Layer 8.

### 8.3 Arithmetic patching with a GL₂(Q_p) action and finite detection

Construct `ArithmeticGL2PatchedModule` from the definite-unitary globalisation of a given residual local representation used in Tung §3. Keep its polarised residual representation, the distinguished Q_p-place, potentially Barsotti–Tate components at the other p-adic places, the auxiliary place and all local/global maps. The restricted globalisation target is the rank-two, K=Q_p case of Emerton–Gee Corollary A.7: after enlarging k, construct a CM extension F/F⁺ with every p-adic completion of F⁺ equal to Q_p and split in F, and an automorphic polarised residual representation restricting to the given local one at each chosen place. It is unramified away from p, has adequate cyclotomic image, and its fixed field does not contain F(zeta_p). For the patching multiplicity-one choice arrange image GL₂(k′) with |k′|>6, as in CEG §2.1. At the other p-adic places choose actual potentially Barsotti–Tate lifts and potentially diagonalizable components. Build the definite rank-two unitary form of GL₂ over F⁺, compact at infinity, with its integral split-place identifications and the finite double-coset function spaces of CEG §§2.3–2.8. Choose v₁ split in F, not split in F(zeta_p), with distinct residual eigenvalues whose ratio is not N(v₁)^(±1). The small level, dual coefficient action and auxiliary diamonds are retained when forming the completed tower. These unitary-specific arithmetic constructions are part of this target; the quaternionic constructions in Layers 1–5 supply the patching pattern but do not construct them.

For its proof, the local potentially Barsotti–Tate lift exists by the irreducible case in the proof of Snowden Proposition 7.8.1, and by BLGG Lemma 6.1.6 in the reducible case; Gee–Kisin Lemma 4.4.1 makes each such lift potentially diagonalizable. The reducible construction lifts the actual extension class using local Tate duality and adjusted potentially unramified diagonal characters, including the cyclotomic-ratio case; it does not follow merely by lifting its semisimplification. Then Emerton–Gee Appendix A first constructs the polarised finite-image globalisation (Proposition A.2), then a lift (Lemma A.5) and potential automorphy preserving the p-adic fields (Proposition A.6), and finally the required unitary automorphic globalisation. The restricted lift and potential-automorphy argument in those two intermediate results must be formalised here for this auxiliary representation. It is not an import of a general compatible-system or potential-modularity theorem. Its exact proof-input independence remains part of §12.8.

Its O[G]-module M_infty has an arithmetic action of R_infty with these properties: finite generation over R_infty[[K]]; projectivity as a pseudocompact O[[K]]-module; finite type-specialisations M_infty(sigma°)=(Hom_cont,O[[K]](M_infty,(sigma°)^d))^d which are maximal Cohen–Macaulay over the corresponding typed quotient and generically of rank one on supported regular components; and the type-Hecke action given by the universal local–global map. The support is a union of components. Fixing the centre gives M_infty^psi over R_infty^psi. The quotient and the dual action are included in the data.

- `arithmeticGL2PatchedModule.typeSpecialisation`: the continuous Hom dual with its finite quotient-ring action.
- `arithmeticGL2PatchedModule.centralQuotient`: specialisation of the central character, with the prescribed fixed determinant.
- `arithmeticGL2PatchedModule.heckeCompatibility`: equality of the two type-Hecke actions.

**Checks.**

- At a supported regular generic point the typed fibre has rank one; the underlying completed module need not be finite over R_infty.
- Killing the central-character parameter changes the determinant by the matching character; using an unrelated fixed-determinant quotient does not give the required action.
- A type whose deformation quotient is zero has zero specialised module; projectivity over O[[K]] does not make every typed specialisation nonzero.

Prove faithfulness of the R_infty action using capture/density together with the local geometry and component comparison, as required in Tung Proposition 3.9, and then prove the stronger finite-detection assertion: checkV(M_infty^psi) is finite and faithful over R_infty^psi. Its Galois action factors through the completed Cayley–Hamilton quotient with relations g²−tr(r_univ(g))g+det(r_univ(g)), giving finiteness; faithfulness is the separate capture/density step. Consequently its fibre and the Banach fibre Pi_y are nonzero at every characteristic-zero point. For an absolutely irreducible local fibre r_x prove checkV(Pi_y)=r_x^(⊕n_y), n_y≥1; algebraic-vector detection supplies every nonordinary typed component. Supply the ordinary components by the restricted ordinary globalisation in BLGG Theorem A.4.1, and treat the remaining semistable noncrystalline scalar-type exception by the explicit multiplicity calculation in Tung §4. Then obtain the all-block cycle identities above. The source-independence audit in Layer 12 is required before treating this auxiliary globalisation as an independent Serre input.

(Source: [Tung, §3, arithmetic action conditions, pp. 8–10; Theorem 3.7, Corollary 3.8, Proposition 3.9 and Corollary 3.10, pp. 10–12; Theorem 4.1, Proposition 4.4 and Theorem 4.6, pp. 12–15][TUNG-2021-P3]; [CEG, §§2.1–2.8, pp. 15–33, and §4, pp. 49–75][CEG-2016]; [Emerton–Gee, Appendix A, Proposition A.2, Lemma A.5, Proposition A.6 and Corollary A.7, pp. 32–35][EMERTON-GEE-2014]; [Snowden, proof of Proposition 7.8.1, pp. 24–25][SNOWDEN-2009]; [BLGG, Lemma 6.1.6, pp. 41–43][BLGG-2012-ORDINARY]; [Gee–Kisin, Lemma 4.4.1, pp. 19–20, and proof of Theorem A.2, p. 36][GEE-KISIN-2014]; [Emerton–Paskunas, Theorem 5.3 and Theorem 6.3, pp. 25–26][EMERTON-PASKUNAS-2020]; [BLGG, Theorem A.4.1, pp. 36–40][BLGG-2013].) *Needs:* Layers 1–5 arithmetic patching; R03 finite/compact algebra and capture; R04 global deformation presentations; R08 component geometry; R15 coefficient lattices and R17 transfer; the rank-two unitary arithmetic construction specified here and the preceding compact functor. The general completed tower and Banach category are consumed from the opening contracts.

### 8.4 Patched Serre-weight filtration

Choose a stable integral lattice sigma° in the tensor of locally algebraic types, and a Jordan–Hölder filtration of sigma°/varpi whose factors are tensor products of Serre weights, with every occurrence retained with its multiplicity. For the corrected non-Eisenstein levels satisfying Kisin's isotropy condition, the coefficient-form functor is exact. Define the induced filtrations on all auxiliary modules modulo varpi and stabilise their inclusions and scalar maps as part of patching. Obtain 0=M_infty^0⊂…⊂M_infty^q=M_infty/varpi, with N_i=M_infty^i/M_infty^(i−1) carrying the corresponding weight-ring action R_infty^i. Independence of the semisimplified weight multiplicities from lattice does not mean the chosen integral filtration can be omitted.

p > 2 is totally split in F, ρ̄|G_{F(ζ_p)} is absolutely irreducible, 𝔪 is non-Eisenstein and S_{σ,ψ}(U,O)_𝔪 ≠ 0; U satisfies Kisin's (2.1.2), under which S_{σ,ψ}(U, A) is finite projective and W_σ ↦ S_{σ,ψ}(U, A) is exact (p. 36).

Import exactness of the localized coefficient functor and the chosen integral type lattices. Apply it to the filtration at each finite auxiliary level. Include the finitely many filtration maps and their action compatibilities in structured stabilization. The finite module transition maps are surjective; use the owner’s exact inverse-limit criterion to preserve each short exact sequence. Retain the factorization through the weight-specific deformation ring on each quotient; this is needed to state its support correctly.

The intended named interface is:

- `patchedWeightFiltration`: The finite filtration of M∞/πM∞ induced by the fixed type-lattice filtration, with all scalar actions.
- `patchedWeightFiltration_graded`: Its i-th quotient is the patched weight-σ_i module N_i over R̄^i_∞.
- `patchedWeightFiltration_specialise`: Augmentation specializes the filtration, inclusions and graded terms to the localized coefficient-form filtration.

(Source: [KISIN-FM-2009, §2.2, filtration of M∞ ⊗ 𝔽, pp. 40–41 (DVI); Proposition (2.2.14), pp. 44–45 (DVI)][KISIN-FM-2009].) *Needs:* §3.3; §5.2; HilbertModularVarietiesAndShimuraCurves:R18.3; SerreWeightAndLevelOptimisation:R20.6; DeformationAndDerivedPatchingAlgebra R03.5 structured inverse-limit exactness.

**Checks.**

- If σ°/π is irreducible the filtration has one step, N_1 = M∞/πM∞.
- The filtration is of M∞ ⊗ 𝔽, not of M∞: its graded pieces are modules over R̄∞/π.
- For an irreducible lattice reduction there is one term N_1=M∞/πM∞.
- Repeated Jordan–Hölder factors retain their multiplicities; replacing the filtration by the set of distinct weights changes its additive multiplicity.
- At every step the inclusion and quotient maps form a short exact sequence of modules with the specified deformation action.

### 8.5 Corrected generic rank of a patched type module

Use the corrected Kisin setup: p>2 completely split in F; residual cyclotomic absolute irreducibility; nonzero modular localisation; trivial isotropy; and, at the nonmaximal compact places outside Sigma_p, 1−N(v) a unit and the residual eigenvalue ratio different from N(v) and its inverse. Equal residual eigenvalues are allowed. Let R be the subset with equal eigenvalues, and r=2^|R|. Prove every fibre of M_infty on its support has dimension at least r, equality holds at supported minimal primes, and the module is locally free of rank r on the smooth locus of each supported component. Use purity and smoothness at the actual automorphic points. Do not assert smoothness at every potentially semistable point or replace r by one.

The places of S ∖ Σ_p are those where U_v is not maximal compact; R ⊂ S ∖ Σ_p is the set of those v at which the eigenvalues of ρ̄(Frob_v) are equal. Kisin's condition (2.1.2) on U is kept.

The patched module is free over the regular scalar power-series ring, so its support is a union of top-dimensional components, each surjecting to that scalar base. At augmentation points import local–global compatibility and the purity/monodromy–weight statement for principal-series and Steinberg local factors. The local deformation geometry then makes those points smooth. These precise arithmetic inputs are supplier extensions, not consequences of generic smoothness for potentially crystalline rings. On the smooth locus use the finite-level automorphic rank r and the patching specialization. Upper semicontinuity of fibre dimension gives the lower bound at all supported primes.

(Source: [GEE-KISIN-2014, Appendix B, Lemma B.5.1 and proof, pp. 39–40][GEE-KISIN-2014].) *Needs:* §5.2; §3.5; LocalGaloisDeformationRings:R08.3/pst-generic-fibre; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime; HilbertModularVarietiesAndShimuraCurves:R18.6; LocalGaloisDeformationRings:R08.3; AutomorphicGaloisRepresentations:R19.5.

**Checks.**

- If R = ∅ the rank is one, which is Kisin's printed Lemma (2.2.10) (DVI numbering; (2.2.11) in print).
- Gee–Kisin's footnote 4: omitting the U_{π_w} for w ∈ S ∖ Σ_p from the Hecke algebra gives rank 2^{|R|} with R = S ∖ Σ_p.

### 8.6 Support of a patched weight quotient

For the corrected weight filtration, prove N_i≠0 if and only if each local weight multiplicity mu_(n_(i,v),m_(i,v))(bar-rho_v) is nonzero. When nonzero its support equals Spec R_infty^i, viewed in the common patched special fibre, and every fibre there has dimension at least r. This identifies the support for the particular weight ring; it does not assert that this weight covers every component of the original typed ring. The statement keeps the complete corrected setup and exactness hypotheses of the preceding two targets.

As for patched-weight-filtration and patched-generic-rank; σ_i = ⊗_{v|p} σ_{n_{i,v},m_{i,v}} are the graded pieces, and R̄^i_∞ is the patched deformation ring of the corresponding weight (Kisin's Proposition (2.2.14), DVI; (2.2.15) in print).

Use the weight theorem and Kisin’s weight-specific support calculation, Proposition (2.2.14) of the DVI ((2.2.15) in print), with the B.5 correction, for nonvanishing and full support on R̄^i_∞. Request the auxiliary irreducible smooth characteristic-zero representation σ̃_i of ∏GL₂(κ(v)), with σ_i in its reduction and S_{σ̃_i,ψ}(U,O)_m⊗k≅S_{σ_i,ψ}(U,k)_m as in Gee §§4.6.3–4.6.6. Keep the chosen lattice and localized comparison maps. Apply the corrected generic-rank theorem to σ̃_i and transport the lower bound through the coefficient comparison and patching.

(Source: [GEE-KISIN-2014, Appendix B, Lemma B.5.2 and proof, pp. 40–41][GEE-KISIN-2014].) *Needs:* §8.4; §8.5; SerreWeightAndLevelOptimisation:R20.6; Layer 8 restricted block, algebraic-vector and all-block cycle targets.

**Checks.**

- If μ_{n_{i,v},m_{i,v}}(ρ̄|G_{F_v}) = 0 for one v | p then N_i = 0.
- The support statement is for Spec R̄^i_∞; N_i need not be supported on the other components of Spec R̄∞/π.

### 8.7 The corrected multiplicity bound for patched graded pieces

In the same corrected setup, retain the nonvanishing and fibre bounds for every N_i. Only for the following additional multiplicity inequality assume that no local bar-rho_v at p is a twist of an extension of 1 by omega, including the split extension. Put e_Sigma=product_(v in Sigma)e(R_v/varpi) and r=2^|R|. Prove r^(-1)e(N_i,R_infty/varpi)≥e_Sigma product_(v|p)mu_(n_(i,v),m_(i,v))(bar-rho_v). The stronger exclusion belongs to this inequality, not to the preceding nonvanishing or support assertions. Preserve the B.3 congruence N(v)≠−1 mod p and B.4 irreducible, generically reduced local special fibres at Sigma.

Kisin's statements are used as Gee–Kisin Appendix B corrects them: N(v) ≢ −1 (mod p) at v ∈ Σ (B.3, the source correction stated here); R̄_v/π irreducible and generically reduced at v ∈ Σ (B.4); and the rank 2^{|R|} in place of rank one, with Lemma (2.2.1) withdrawn (B.5). The Breuil–Mézard multiplicities, and the Hilbert–Samuel and cycle formalism, are supplied by Layer 8 restricted block, algebraic-vector and all-block cycle targets. The patching itself is Layer 3 and §5.2, with the local rings of LocalGaloisDeformationRings R08.3. Use the corrected Kisin §2.2 setup in Gee–Kisin B.5: for v∈S∖Σ_p, 1−N(v) is a unit and the eigenvalue ratio is not N(v)^{±1}; equal eigenvalues are allowed. Retain absolute residual irreducibility on G_{F(ζ_p)}, nonzero modular Hecke localization, the isotropy condition and the full finite-level/filtration data. The stronger exclusion at v|p is needed for the displayed graded-piece bound.

Apply patched-weight-nonvanishing-and-support to obtain exactly its weight-specific full-support conclusion and the fibre bound r=2^{|R|}. Under the additional local exclusion, apply the local Breuil–Mézard input and generic reducedness of the Σ factors to the multiplicity associativity formula. This gives r⁻¹e(N_i)≥e_Σ∏μ, with the same normalization for every filtration term. No equality is inferred.

(Source: [GEE-KISIN-2014, Appendix B, Lemma B.5.2 and final correction paragraph, pp. 40–41 (arXiv v5)][GEE-KISIN-2014].) *Needs:* §8.8; Layer 8 restricted block, algebraic-vector and all-block cycle targets; SerreWeightAndLevelOptimisation:R20.6; §8.4; §8.6; DeformationAndDerivedPatchingAlgebra R03.3/hilbert-samuel-additivity-and-associativity; DeformationAndDerivedPatchingAlgebra R03.6/cycle-specialization-multiplicity.

**Checks.**

- The formula is an inequality, not equality.
- The bound carries the factor 2^(−|R|).
- The local excluded extension shape is needed for the multiplicity inequality, not for the two preceding statements.

### 8.8 Kisin's multiplicity criterion for faithfulness of the patched module, as corrected by Gee–Kisin

In the corrected totally definite quaternionic setup, assume p>2 splits completely in F, the residual representation is absolutely irreducible on G_(F(zeta_p)), the modular localisation is nonzero, isotropy is trivial, and the finite-level modules and filtration have the stated compatibilities. At Sigma impose N(v)≠−1 mod p and the corrected irreducible, generically reduced local special fibres. At the nonmaximal level places outside Sigma_p impose 1−N(v) a unit and residual eigenvalue ratio different from N(v)^(±1), allowing equal eigenvalues. Let r=2^|R| as above. Prove the equivalence of faithfulness of M_infty, e(R_infty/varpi)=r^(-1)e(M_infty/varpi), and e(R_infty/varpi)≤r^(-1)e(M_infty/varpi). Use generic rank, multiplicity associativity and the corrected local geometry; the reverse inequality is already forced by these data. Under these equivalent conditions every global lift with exactly the selected Steinberg and p-adic Hodge/type conditions is modular. This applies Gee–Kisin Appendix B.5 in place of the withdrawn Kisin Lemma 2.2.1.

Kisin's statements are used as Gee–Kisin Appendix B corrects them: N(v) ≢ −1 (mod p) at v ∈ Σ (B.3, the source correction stated here); R̄_v/π irreducible and generically reduced at v ∈ Σ (B.4); and the rank 2^{|R|} in place of rank one, with Lemma (2.2.1) withdrawn (B.5). The Breuil–Mézard multiplicities, and the Hilbert–Samuel and cycle formalism, are supplied by Layer 8 restricted block, algebraic-vector and all-block cycle targets. The patching itself is Layer 3 and §5.2, with the local rings of LocalGaloisDeformationRings R08.3. Use the corrected Kisin §2.2 setup in Gee–Kisin B.5: for v∈S∖Σ_p, 1−N(v) is a unit and the eigenvalue ratio is not N(v)^{±1}; equal eigenvalues are allowed. Retain absolute residual irreducibility on G_{F(ζ_p)}, nonzero modular Hecke localization, the isotropy condition and the full finite-level/filtration data.

Use the separately specified corrected generic-rank theorem, including purity and the rank r=2^{|R|}. The faithful action image is supported on a union of components. Apply Hilbert–Samuel additivity and associativity to that union, using local reducedness and the characteristic-zero rank calculation. The normalized multiplicity is bounded above by the ring multiplicity and equals it exactly when no component is missing. Full support and reducedness identify the action image with the deformation ring. Augment to recover the Hecke action and modularity of every point satisfying the displayed local types.

(Source: [KISIN-FM-2009, §2.2, before Lemma (2.2.10), p. 42 (DVI)][KISIN-FM-2009]; [KISIN-FM-2009, Corollary (2.2.16), p. 45 (DVI)][KISIN-FM-2009]; [GEE-KISIN-2014, Appendix B, B.5, p. 39 (arXiv v5)][GEE-KISIN-2014]; [GEE-KISIN-2014, Appendix B, B.3, p. 38 (arXiv v5)][GEE-KISIN-2014].) *Needs:* §3.4; §3.5; §5.2; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pst-generic-fibre; Layer 8 restricted block, algebraic-vector and all-block cycle targets; §8.5; DeformationAndDerivedPatchingAlgebra R03.3/hilbert-samuel-additivity-and-associativity; DeformationAndDerivedPatchingAlgebra R03.6/cycle-specialization-multiplicity.

**Checks.**

- With R = ∅ this is Kisin's printed Lemma (2.2.10), with rank one.
- A place v ∈ Σ with N(v) ≡ −1 (mod p) is excluded (B.3). Base change reduces to N(v) ≡ 1.
- The global argument alone gives only e(𝕋∞/π) ≤ e(R̄∞/π); the reverse inequality is the local input.

### 8.9 Kisin's Fontaine–Mazur theorem over totally split fields (Theorem (2.2.17))

Let p>2 split completely in a totally real F and let rho be continuous and finitely ramified with modular reduction absolutely irreducible on G_(F(zeta_p)). At every v|p require distinct Hodge–Tate weights, semistability over an abelian extension, and exclude every local residual twist of ((omega,*),(0,1)). Prove rho modular by the corrected multiplicity criterion, the local inequality supplied by Colmez's functor and the algebraic-vector comparison, and the prescribed-weight automorphic lift theorem. This is the DVI Theorem 2.2.17, published 2.2.18. With the full regular de Rham algebraic-vector result below, the abelian extension condition can be removed; removal of the residual exclusion additionally needs the all-block Breuil–Mezard theorem, not just that algebraic-vector result.

Gee’s Theorem 4.6.9 (the older citation is numbered 4.4.12) of 'Automorphic lifts of prescribed types' makes ρ̄ modular of weight σ once μ_Aut ≠ 0. It is supplied by SerreWeightAndLevelOptimisation R20.6. The choice of U and of the auxiliary primes follows Gee–Kisin B.5 (the source correction stated here), not Kisin's Lemma (2.2.1). The local inequality e(R̄_v/π) ≤ μ_Aut (Kisin §§1.6–1.7, through Colmez's functor and (1.2.6)) is supplied by Layer 8 restricted block, algebraic-vector and all-block cycle targets.

Make a quadratic base change so that [F : ℚ] is even, and let D be the definite quaternion algebra split at all finite places. The existence of ρ gives μ_Aut(k_v, τ_v, ρ̄ ⊗ ω^{−w_v}) ≠ 0 (Kisin (1.7.2), (1.7.8), (1.7.9)). Gee's theorem then makes ρ̄ modular of weight σ. Kisin's local inequality e(R̄_v/π) ≤ μ_Aut and §8.8 give faithfulness, so ρ is modular at the auxiliary level (Corollary (2.2.16)). Level raising and lowering at v ∤ p, and descent by the base change arguments of Kisin's Annals §3.5 (§5.1).

(Source: [KISIN-FM-2009, Theorem (2.2.17), p. 45 (DVI)][KISIN-FM-2009]; [KISIN-FM-2009, Proof of Theorem (2.2.17), p. 46 (DVI)][KISIN-FM-2009]; [KISIN-FM-2009, Hypothesis (1.2.6), p. 9 (DVI)][KISIN-FM-2009]; [EMERTON-LGC-2011, Theorem 3.3.22, p. 28][EMERTON-LGC-2011]; [GEE-TYPES, Theorem 4.6.9 and Remark 3.1.6, author pp. 26 and 9][GEE-TYPES].) *Needs:* §8.8; §5.1; §7.11; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; Layer 8 restricted block, algebraic-vector and all-block cycle targets; SerreWeightAndLevelOptimisation:R20.6; §8.7.

**Checks.**

- F = ℚ with ρ̄ modular: this is the introduction theorem without its appeal to Khare–Wintenberger.
- Excluded: ρ̄|G_{ℚ_p} ≅ 1 ⊕ ω (χ = 1, ∗ = 0). Hu–Tan (p ≥ 5) and Tung (p = 3) cover it.
- Numbering: the published version is (2.2.18), the DVI's is (2.2.17).

### 8.10 Modularity lifting for de Rham representations at odd p (Kisin, Emerton, Paškūnas, Hu–Tan, Tung)

For any odd p, let F be totally real with p completely split and rho:G_(F,S)→GL₂(O) continuous. Assume residual modularity, absolute irreducibility of bar-rho on G_(F(zeta_p)), and potentially semistable local representations with distinct Hodge–Tate weights at every v|p. Prove that rho is attached to a Hilbert cuspidal eigenform up to a character twist. This is the residual-modular Theorem 4.7 of Tung, and for p≥5 also Hu–Tan Theorem 6.3. There is no local residual exclusion, including at p=3. Oddness of the characteristic-zero lift follows from residual modularity because p is odd. The local all-block result, ordinary-component contribution and restricted global patching closure are the targets specified in this layer; no unconditional Serre theorem is an input to this formulation.

Use §8.1 for every local residual representation. For exceptional residual representations the nonexceptional inequality in §8.7 cannot be substituted for this all-block input. The required arithmetic module, capture/density, finite detection and ordinary-component contribution are the targets in §§8.2–8.3. Hu–Tan §6 proves the relevant support statement in Lemma 6.1 before Proposition 6.2, including semistable noncrystalline factors. Tung Theorem 4.7 supplies the all-odd-prime result; the base change and descent step is the one in Kisin’s conditional theorem. The extra proof-input closure needed by an independent Serre argument is the separate target §12.8.

(Source: [TUNG-2021-P3, Theorem 4.7, p. 15 (arXiv v4)][TUNG-2021-P3]; [TUNG-2021-P3, Theorem 1.2, p. 4 (arXiv v4)][TUNG-2021-P3]; [HU-TAN-2015, Theorem 6.3, p. 35 (arXiv v2)][HU-TAN-2015]; [HU-TAN-2015, §6, p. 33 (arXiv v2)][HU-TAN-2015].) *Needs:* §8.8; §8.9; §7.11; §7.10; Layer 8 restricted block, algebraic-vector and all-block cycle targets; §8.3 restricted arithmetic patching; §8.7.

**Checks.**

- p = 3, ρ̄|G_{ℚ₃} ≅ (ω ∗; 0 1) ⊗ χ: covered (Tung, Remark 4.8).
- p ≥ 5, ρ̄|G_{ℚ_p} ≅ χ ⊗ (1 ⊕ ω): covered (Hu–Tan).
- Non-example: ρ̄|G_{F(ζ_p)} reducible (bad dihedral) is not covered.

### 8.11 Dieulefait–Pacetti's Theorem 1.4 holds at every odd prime, including 3

Prove `OddPrimeLifting p` for every odd prime p, including three. Convert the quadratic residual condition to cyclotomic absolute irreducibility using R01, use the p-adic monodromy theorem to pass from de Rham to potentially semistable, and apply the preceding theorem for F=Q. Its output is an actual weight-at-least-two cusp form up to twist by the algebraic-vector/classicality comparison. Apply the geometric-character and weight normalisation of Layer 7 to obtain exactly the weight-k newform representation in the predicate. No bound on k and no crystallinity or ordinarity hypothesis is added.

de Rham representations are potentially semistable (PadicHodgeTheory R06.3/p-adic-monodromy-theorem).

Use the R01.1 finite-coefficient descent, stable-lattice and coefficient-extension theorems, followed by R06.3 p-adic monodromy. Apply §8.10 with F=Q, and use §7.9 to classify the actual twist and absorb its finite-order factor into a primitive associate. This gives a weight-k newform with the specified coefficient embedding.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.4 and its proof, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI]; [DIEULEFAIT-PACETTI, Proof of Theorem 1.4, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* §8.10; ArithmeticGaloisRepresentations R01.4 quadratic-cyclotomic criterion (opening contract); §7.7; §7.2; PadicHodgeTheory:R06.3/p-adic-monodromy-theorem; §7.9; §7.8; ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field; ArithmeticGaloisRepresentations:R01.1/continuous-representations-have-stable-lattices; ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence.

**Checks.**

- p = 3: the hypothesis is over ℚ(√−3) = ℚ(ζ₃).
- k = 2 with ρ|G_{ℚ_p} semistable and not crystalline, such as the p-adic Tate module of an elliptic curve with multiplicative reduction at p: covered. This is not a potentially Barsotti–Tate case, so Kisin's Annals theorem (§5.6) does not reach it.

### 8.12 What an application of Theorem 1.4 must verify, and where Dieulefait–Pacetti's proof applies it

For a congruent pair at odd p, check separately finite ramification and coefficient descent, oddness of both lifts, regular de Rham weights {0,k−1} with possibly different k≥2, and absolute residual irreducibility over Q(sqrt(pStar p)). Supply actual residual modularity, for example from a modular member of the pair or an applicable solvable-image modularity theorem. No crystallinity, ordinarity or upper bound on k is needed. If det rho=psi epsilon^(k−1), oddness requires psi(c)=(-1)^k; finite order of psi alone does not give that parity. The explicit-family version of Layer 12 is enough to transport a known modular member from another residue characteristic. The applications in Dieulefait–Pacetti §2 use this theorem at w in Step 1, q in Step 2, the odd ramification primes p_i in Step 3, three in Lemma 2.3, N in Step 5, five in Step 6 and the odd-characteristic final step. Their large-prime/bad-dihedral and good-dihedral checks belong to each application. At three the potentially semistable lift need not be potentially Barsotti–Tate and may have the exceptional local residual extension; that is precisely why the full odd-prime theorem is needed.

(Source: [DIEULEFAIT-PACETTI, §2, Paso 1, p. 10 (arXiv v2)][DIEULEFAIT-PACETTI]; [DIEULEFAIT-PACETTI, Proof of Lemma 2.3, p. 13 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* §8.11; ArithmeticGaloisRepresentations R01.4 quadratic-cyclotomic criterion (opening contract); §7.6; §7.3; §7.4; §7.5.

**Checks.**

- k = 3, w = 7: 7 ∉ {3, 5}, so ρ̄₇ is not bad dihedral.
- w > 2k ≥ 4 gives w ≥ 5, the range of Theorem 1.6.
- Lemma 2.3 is an application of Theorem 1.4 at p = 3, so the p ≥ 5 results alone would not suffice.

### Examples

If exactly two corrected auxiliary places have equal residual eigenvalues then r=4. The generic multiplicity criterion is e(R/varpi)=(1/4)e(M/varpi), rather than equality without the factor. A repeated residual weight contributes twice to the filtration sum. At p=3 the local 1-by-omega block is retained in the all-block theorem even though older lifting statements excluded it.

### Dependencies

Layers 1–5 and 7; the restricted local block, arithmetic patching and finite-detection targets of this layer; R03 multiplicities; R08 local Hodge/type rings; R15 integral weights; R20 prescribed-type modular points. The source-independence target is §12.8.


## Layer 9: Regular dyadic lifting from typed support

### 9.1 Typed completed modules and all dyadic components

In Tung's §§4–5 global data, define `DyadicTypedCompletedModule sigma°` from the completed definite quaternionic tower and its compact dual with the fixed central character, odd real-place deformation quotients, specified Steinberg levels and auxiliary place v₁. Keep the arithmetic maps and form M_infty(sigma°) by the continuous K-equivariant Hom dual. It is finite over the typed patched quotient, Cohen–Macaulay, and has characteristic-zero support a union of components; the unpatched M(sigma) is its actual augmentation in the finite space of algebraic quaternionic forms. Specify the comparison of its type-Hecke action with the universal Galois action, not just a formal tensor product of a generic completed object.

- `dyadicTypedCompletedModule.specialise`: the finite typed module and its quotient-ring action.
- `dyadicTypedCompletedModule.augment`: the equivariant map to the finite algebraic-form module.
- `dyadicTypedCompletedModule.support_union`: the typed generic support is a union of components.

**Checks.**

- A zero type quotient gives a zero typed module; claims of positive rank apply on supported components.
- Replacing the coefficient representation by zero gives zero continuous Hom and hence zero typed module. A nonzero unrestricted completed module does not change this value.
- If a central element acts on the torsion-free coefficient dual by a scalar different from its scalar on the compact module, every intertwiner is zero; forgetting the central character gives the wrong type-specialisation.
- The involution diag(1,−1) and the identity have the same residual matrix at two but lie in different characteristic-zero parity conditions; only the odd real-place quotient is used.

Construct the fixed-determinant compact Colmez action in this dyadic setting and prove the finite-detection theorem for nonordinary components (Tung Theorem 6.3.7). Prove the separate ordinary component occurrence by Theorem 7.3.1; retain its ordinary modularity and auxiliary-globalisation inputs. Use Proposition 5.4.1 at v₁ to obtain all choices of that local component. Together these give Theorem 8.0.1 for every locally algebraic type, including residual local self-extensions. Since support is a union of components, meeting every component now gives full generic support, and the finite augmentation yields the specialisation target below. Mere near faithfulness of the unrestricted completed module does not prove its typed fibres nonzero.

(Source: [Tung, Propositions 5.2.2 and 5.4.1, Lemma 5.3.2, pp. 27–29; Theorem 6.3.7, pp. 32–33; Theorem 7.3.1 and Theorem 8.0.1, pp. 36–38][TUNG-2021-DYADIC]; [Paskunas, Theorem 1.1, pp. 1–2][PASKUNAS-2016].) *Needs:* Layer 6 determinant/twist patching and Layer 8 compact functor/detection with the dyadic adjustments proved here; R08 dyadic local components; R21 ordinary theorem; CompletedCohomologyPartII degree-zero adapter and compact dual; R03 support/augmentation; R18 finite algebraic forms and R19 local–global compatibility.

### 9.2 Automorphy from typed dyadic component support

In Tung's dyadic global setup, let F be totally real with two completely split, with a modular nonsolvable residual representation, determinant psi epsilon totally odd, odd local deformation quotients at every real place, the prescribed Steinberg conditions away from two and the specified auxiliary place v₁. Fix the tensor sigma of locally algebraic types. Apply the typed full-support theorem in §9.1: the typed patched module's generic support is a union containing every irreducible component. Prove the unpatched global ring R_S^psi(sigma) finite over O and M(sigma)[1/2] faithful over it. Its characteristic-zero points occur in the actual algebraic quaternionic forms and are automorphic by the type comparison and Jacquet–Langlands. The proof uses finite typed modules and exact augmentation, not bare faithfulness of an infinite completed module. A support that merely intersects each component need not equal the whole spectrum unless the union-of-components assertion is also established.

The characteristic-zero deformation points satisfy det ρ(c_v)=−1 at every real place. Residual oddness in characteristic two cannot replace these odd local deformation conditions (Tung §3.2.5, Proposition 3.2.7, p.15). Full component support is required: the type-specialized patched module is supported on the union of all irreducible components. A nonempty intersection with each component alone is not a general algebraic full-support criterion.

Use §9.1 for Tung Theorem 8.0.1, with both nonordinary detection (Theorem 6.3.7) and ordinary occurrence (Theorem 7.3.1). Apply Lemma 5.3.2(1)–(3) to the finite typed module and its exact augmentation. The finite faithful generic action makes every fibre nonzero by localisation and Nakayama. Its type-Hecke comparison identifies that fibre with algebraic quaternionic forms; use R19 for the attached representation and R17.3 for Jacquet–Langlands. Pan’s completed Hecke setup in Layer 10 is not used.

(Source: [TUNG-2021-DYADIC, §3.2.5, Proposition 3.2.7, p.15; §5.2, Proposition 5.2.2(3), p.28; §5.3, Lemma 5.3.2, p.28; §8, Theorems 8.0.1 and 8.0.3 with proof, pp.38–39 (arXiv v3)][TUNG-2021-DYADIC].) *Needs:* §9.1 typed full support and finite augmentation; R03.6 support and faithful quotient comparison; R18 finite quaternionic forms; R19 local–global compatibility; R17.3 Jacquet–Langlands.

**Checks.**

- Faithfulness of a nonfinite completed module alone is insufficient to justify nonzero fibres; the imported type-specialized finite-module argument must be used.
- Both ordinary and nonordinary components occur, including residual self-extensions at 2.

### 9.3 Tung’s totally real dyadic lifting theorem

Let F be totally real with F_v=Q₂ at every v|2, and rho:G_F→GL₂(O) be continuous, totally odd and finitely ramified. Assume bar-rho modular with nonsolvable image and rho potentially semistable with distinct Hodge–Tate weights at every v|2. Prove rho comes from a Hilbert modular form up to a character twist, with no local exclusion of self-extensions. Use typed full support, finite specialisation and classicality, then descend from the auxiliary soluble field. In arXiv v3 Theorem 8.0.3(3) the oddness bar is incompatible with characteristic-two determinant parity: the condition used here is the characteristic-zero odd quotient in §3.2.5, det rho(c_v)=−1.

Total oddness means det ρ(c_v)=−1 for every real place v. The bar on ρ in arXiv v3 Theorem 8.0.3(3) is recorded as the parity correction explained above; use the odd characteristic-zero local deformation condition from §3.2.5, not residual determinant parity at two.

Choose a totally real solvable extension F′/F, disjoint from the residual fixed field with ζ₂, of even degree, split at 2, killing residual ramification away from 2 and making the remaining lift inertia unipotent. Preserve nonsolvable residual image using the general-field restriction export supplied by R04.4. Choose the definite quaternion algebra ramified at the real places and the even set Σ of remaining ramified finite places, an auxiliary v₁ with distinct residual Frobenius eigenvalues, and the level of Tung §8. Total oddness of ρ puts its real-place points in D_v^odd (Proposition 3.2.7). The determinant, types and Steinberg local conditions put ρ|G_F′ in the situation of typed-component-specialisation. Apply that theorem and descend using solvable base change, with irreducibility guaranteed by nonsolvable residual image.

(Source: [TUNG-2021-DYADIC, §3.2.5, Proposition 3.2.7, p.15; §8, Theorem 8.0.3 and proof, pp.38–39 (arXiv v3)][TUNG-2021-DYADIC].) *Needs:* §9.2; GlobalGaloisDeformations:R04.4; GL2AutomorphicRepresentationsAndTransfer:R17.4.

**Checks.**

- Let F be totally real with every F_v ≅ ℚ₂ for v|2. Let ρ:G_F→GL₂(𝒪) be continuous, totally odd and finitely ramified, with modular residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then ρ is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).
- The local characteristic-two reductions of I₂ and diag(1,−1) coincide, although their characteristic-zero determinants are +1 and −1. Thus residual determinant data alone does not verify the total-oddness premise.

### 9.4 The 2-adic de Rham modularity lifting theorem (Kisin, Paškūnas, Tung)

For a continuous finitely ramified odd two-adic rho over Q, with regular de Rham local representation and modular nonsolvable residual image, prove modularity up to twist by the totally real dyadic theorem with F=Q. Residual nonsolvability already implies characteristic-zero irreducibility. After the Layer 7 weight normalisation, prove `DyadicLifting`. This result allows all distinct Hodge–Tate weights, not only potential Barsotti–Tate weight two. Paskunas's earlier Theorem 1.1 excluded local self-extensions of a character; Tung's ordinary plus nonordinary component arguments remove that exclusion. The conclusion is conditional on residual modularity, even where an introductory statement invokes Serre to supply it.

Apply p-adic monodromy to the de Rham regular local representation, preserving the Hodge–Tate weights. Apply totally-real-dyadic-lifting with F=ℚ. Its residual modularity remains an explicit hypothesis, not a use of the general Serre endpoint. For normalized weights {0,k−1}, translate the classical form’s weight through the imported global-character twist and algebraic-vector convention; do not identify this theorem with the weight-two potentially Barsotti–Tate theorem.

(Source: [TUNG-2021-DYADIC, Introduction, Theorem A, p. 2 (arXiv v3)][TUNG-2021-DYADIC]; [TUNG-2021-DYADIC, Introduction, p. 3 (arXiv v3)][TUNG-2021-DYADIC]; [PASKUNAS-2016, §1, Theorem 1.1, pp.1–2 (arXiv v2; hypothesis (iv) and conclusion on p.2)][PASKUNAS-2016].) *Needs:* §9.3; PadicHodgeTheory:R06.3; ArithmeticGaloisRepresentations:R01.2.

**Checks.**

- A ρ with ρ̄|_{G_{ℚ₂}} ≅ (χ ∗; 0 χ) (for instance ρ̄ unipotent at 2) is covered by Tung's Theorem A but not by Paškūnas' Theorem 1.1.
- A potentially Barsotti–Tate ρ is the case already covered by Kisin's (0.1), used in the classical proof through Hypothesis (H).

### Examples

A typed module with support merely meeting each component need not have full support. In the dyadic construction its support is proved to be a union of components first; the nonordinary and ordinary theorems then supply all those components. The finite typed augmentation, rather than an unrestricted infinite module, is what detects the classical point.

### Dependencies

Layers 6–8; the typed completed construction and ordinary/nonordinary support targets of this layer; CompletedCohomologyPartII tower/duality; R03 finite augmentation; R08 dyadic geometry; R18/R19 classical forms; R21 ordinary lifting.


## Layer 10: Nice primes and the residually reducible theorem

### 10.1 The completed Hecke quotient, block action and classical points

For Pan's definite quaternionic setup define `PanCompletedHeckeData` from the degree-zero completed tower with fixed central character psi=chi epsilon in Pan's convention. Its ring T_m is the completed Hecke action image, localised at the actual maximal ideal (varpi,T_v−1−chi(Frob_v)). Construct the continuous determinant-fixed pseudorepresentation with trace T_v at geometric Frobenius and determinant chi, and the surjection R^(ps,{xi_v})→T_m. At each p-adic place give the action of the appropriate compact GL₂(Q_p) block centre and its local pseudodeformation ring on the same dual module. The block residual representation is bar-rho tensor epsilon; transport the local action back by epsilon^(-1) to compare with the global determinant chi. Prove equality of those local pseudodeformation actions. At p=3 retain Pan's exclusion of the cyclotomic block.

- `panCompletedHeckeData.pseudodeformationMap`: the continuous surjection and its trace/determinant formulas.
- `panCompletedHeckeData.blockCompatibility`: equality of the two actions after the specified cyclotomic transport.
- `panCompletedHeckeData.classicalEvaluation`: the finite algebraic-weight eigenspace, its Hecke and Galois polynomial comparison, and the matching central character.

**Checks.**

- The coefficient of X⁰ at a good geometric Frobenius is chi(Frob_v), with psi=chi epsilon; the arithmetic formula psi epsilon from Layer 1 cannot be substituted here.
- If the indicated Hecke ideal is not maximal with a nonzero localisation, there is no such datum; a formal pseudodeformation ring alone does not supply it.
- Tensoring the local block by epsilon and then by epsilon^(-1) returns the global determinant; a single twist would change it by epsilon² and fails the compatibility check.

For a nice Hecke prime q prove Pan's localised R^ps→T_m comparison with nilpotent kernel (Theorem 4.1.7). For a promodular characteristic-zero point with locally irreducible regular de Rham representations prove the algebraic-vector/classicality theorem of §3.5.12, using the exact block comparison, and identify the resulting classical cuspidal representation by Jacquet–Langlands. A two-dimensional irreducible regular de Rham representation over Q_p is absolutely irreducible after coefficient extension: otherwise its conjugate one-dimensional constituents have equal Hodge–Tate weight, contradicting regularity; include the scalar-extension argument before applying the absolutely irreducible algebraic-vector theorem. Compare the resulting classical Frobenius polynomials with the arithmetic convention via R19, then apply Layer 7 to normalise the weight and finite character twist.

(Source: [Pan, §§3.3–3.5, Theorems 3.4.5–3.4.6, pp. 26–29; Corollary 3.5.12, pp. 33–34; §4.1 and Theorem 4.1.7, pp. 35–39][PAN-2022].) *Needs:* Layer 8 restricted Banach/block and algebraic-vector comparison; CompletedCohomologyPartII Layers 3, 5–6 and 8; IHG integral determinant and residual localisation; R04 pseudodeformations; R17 Jacquet–Langlands; R19 classical polynomial comparison. The nice-prime condition below is part of the localised theorem's hypotheses, not an assumed modularity conclusion.

### 10.2 Pan’s nice Hecke prime

In Pan's completed setup fix p odd, F totally real of even degree and completely split at p, S containing the p-adic places with N(v)≡1 mod p outside p, a totally odd determinant chi unramified outside p with chi(Frob_v)≡1 at these extra places, and p-power tame characters xi_v. Use the definite quaternion algebra ramified exactly at infinity, central character psi=chi epsilon in Pan's convention, and an actual maximal ideal m generated by varpi and T_v−1−chi(Frob_v). Define `PanNicePrime q` for q in the completed Hecke factor to mean: p lies in q; dim(T_m/q)=1; over the normalisation of T_m/q in its fraction field there is a stable lattice with irreducible generic representation and nonsplit residual extension; any quadratic inducing field L satisfies L intersect F(zeta_p)=F; and at every extra place away from p the lattice representation is the constant lift of its reduction. On the pseudodeformation ring a nice prime means the contraction of such a Hecke prime, retaining that witness. Finite inertia or finite image alone is weaker than the constant-lift clause.

Retain Pan §4.1.2 Assumption 1: the ideal generated by ϖ and T_v−1−χ(Frob_v), v∉S, is an actual maximal ideal m of the completed Hecke algebra. Its central character is ψ=χε and the quaternion algebra is ramified exactly at the infinite places.

Use R04.1–R04.2 for the determinant-fixed pseudodeformation problem and §10.1 for the Hecke quotient; use IHG.1/R01.1 for reconstruction and lattices. Define the predicate by the existence of the lattice with these four properties, keeping the characteristic-p dimension-one condition and the cyclotomic intersection condition. Record the contraction separately from a prime satisfying only the Galois properties.

The intended named interface is:

- `PanNicePrime.char_p_dimension`: A nice Hecke prime contains p and has quotient dimension one.
- `PanNicePrime.lattice`: Extract a normalization lattice with irreducible generic fibre, nonsplit reduction and the stated away-p restrictions.
- `PanNicePrime.is_proModular`: The contraction of a nice Hecke prime is pro-modular for Pan’s direct pseudodeformation-to-Hecke quotient from §10.1, equivalently its prime contains the kernel of that quotient.
- `PanNicePrime.dihedral_disjoint`: If the associated representation is induced from a quadratic L, then L∩F(ζ_p)=F.
- `PanNicePrime.mk`: In the stated setup, p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition imply the predicate. For a pseudo-ring nice prime, also supply its Hecke prime and contraction equality.
- `PanNicePrime.iff`: The predicate is equivalent to p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition. Hecke and pseudo-ring primes are distinguished; the latter has an existential contracted Hecke witness.

(Source: [PAN-2022, §4.1, Definition 4.1.4 and Remarks 4.1.5–4.1.6, p.39][PAN-2022].) *Needs:* GlobalGaloisDeformations:R04.1; GlobalGaloisDeformations:R04.2; §10.1 completed Hecke and local block compatibility; ArithmeticGaloisRepresentations:R01.1; IntegralHeckeAndGaloisDeterminants:IHG.1.

**Checks.**

- A prime not containing p is not nice, even if it is a classical automorphic point.
- A proposed witness lattice with split residual reduction does not satisfy PanNicePrime.lattice; irreducible generic fibre alone does not validate that witness.
- With all other clauses satisfied, the away-p clause is equivalent to equality of ρ(q)°|G_Fv with the constant residual lift for every v∈S\Σ_p; finite image alone does not suffice.

### 10.3 Potentially nice pseudodeformation primes

For Pan's determinant-fixed pseudodeformation ring over a totally real abelian F split at p, define `PanPotentiallyNicePrime q` by p in q, dim(R^ps/q)=1, irreducibility of the associated semisimple generic representation, and finite local image at every place of S away from p. This definition uses only Galois data. It supplies neither a Hecke point, a nonsplit normalisation lattice nor the constant-lift condition. Those extra properties are obtained only after the specified base change and automorphic occurrence argument.

Import the pseudodeformation ring and pointwise semisimple representation from R04.2 and IHG.1. Conjoin the four stated properties; keep the passage from potentially nice to nice as the separate arithmetic theorem potentially-nice-base-change.

The intended named interface is:

- `PanPotentiallyNicePrime.char_p_dimension`: Extract p∈q and dim R^{ps}/q=1.
- `PanPotentiallyNicePrime.finite_away`: Each away-p local restriction has finite image.
- `PanPotentiallyNicePrime.of_nice`: A contracted Pan nice prime, in the same §7 global problem with its finite residual away-p lift, is potentially nice.
- `PanPotentiallyNicePrime.coefficient_extension`: For a finite unramified coefficient extension and a prime above q, the predicate is preserved when the generic representation remains irreducible.
- `PanPotentiallyNicePrime.mk`: In the stated setup, p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place imply the predicate.
- `PanPotentiallyNicePrime.iff`: The predicate is equivalent to p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place; no Hecke-image premise is added.

(Source: [PAN-2022, §7.2.4, p.114][PAN-2022].) *Needs:* GlobalGaloisDeformations:R04.2; IntegralHeckeAndGaloisDeterminants:IHG.1; ArithmeticGaloisRepresentations:R01.1.

**Checks.**

- For Pan §7.1’s global determinant-fixed ring R^{ps} over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if p∈q, dim(R^{ps}/q)=1, the associated semisimple representation ρ(q) is irreducible, and ρ(q)|G_Fv has finite image for every v∈S\Σ_p. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.
- A dimension-one characteristic-p prime with a sum-of-characters generic representation is not potentially nice.
- When S=Σ_p, the finite-away-p clause is vacuous; the other three clauses remain necessary.
- For fixed q and associated representation, changing the candidate Hecke quotient does not change the potentially-nice predicate; it changes whether q is a contracted nice Hecke prime.

### 10.4 Good components of the pseudodeformation space

Let C_i be the irreducible components of the pseudodeformation spectrum, N its potentially nice point set and A the closure of its irreducible regular de Rham ordinary arithmetic points. Define `panAdjacent C N i j` by a point of N in C_i intersect C_j. Define `panGoodComponent C N A i` by the existence of an initial component C_j containing a point of N intersect A and a finite, possibly zero-length, adjacency path from j to i. This is exactly seeded reflexive transitive reachability. For the arithmetic specialization it is Pan's good-component predicate. A single seeded component is good, while reflexive reachability without a seed gives no good component.

Import potentially-nice-prime and the ordinary arithmetic locus from R21.4; goodness is an incidence predicate, with modularity of that locus used in the separate good-component-to-automorphy argument. Use Mathlib Relation.ReflTransGen for finite reachability. A starting component contains a point in the intersection of the potentially-nice and seed sets; adjacency requires a potentially nice point in both components. The reflexive case encodes t=1, not an empty unseeded chain.

The intended named interface is:

- `panGoodComponent_iff`: Goodness is equivalent to a seeded component followed by Relation.ReflTransGen of potentially-nice-point adjacency.
- `panGoodComponent_seed`: A component containing a potentially nice seed point is good by a length-one chain.
- `panGoodComponent_step`: If C is good and C,C′ contain a common potentially nice point, then C′ is good.
- `panGoodComponent_mono`: Enlarging the potentially-nice point set and the seed-point set preserves goodness.
- `panGoodComponent_congr`: Pointwise equality of component subsets and equality of the nice and seed sets give equivalent goodness predicates.

(Source: [PAN-2022, §7.4, Definition 7.4.1, p.116][PAN-2022].) *Needs:* §10.3; mathlib:Relation.ReflTransGen; mathlib:Relation.ReflTransGen.trans; mathlib:Relation.reflTransGen_iff_eq; OrdinaryAutomorphicFormsAndModularityLifting:R21.4.

**Checks.**

- Pan Definition 7.4.1: a component C of Spec R^{ps} is good if a finite chain C₁,…,C_t=C has potentially nice q₁,…,q_t, with q_i∈C_{i−1}∩C_i for i≥2, and q₁∈C₁∩closure(A^{ord}), where A^{ord} is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in closure(A^{ord}). The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.
- For a one-component, one-point incidence system with the point in both sets, the component is good.
- With empty seed-point set, no component is good, even when every pair is adjacent.
- For components {0}, {0,1}, {1,2}, nice points {0,1}, and seed points {0}, all three are good; the third is reached through the middle component.
- For components {0,1} and {1,2}, nice points {0}, seed points {0}, only the first is good: the common point 1 is not potentially nice.

### 10.5 Components detected by an extension deformation

For a ring homomorphism f:A→B define `panExtensionComponents f` as the minimal-prime points of Spec A that are in the range of Spec(f):Spec B→Spec A. It records actual generic-point incidence, not just nonempty intersection with the closed image. For a nonzero global extension class B of psi₁ by psi₂, use the determinant-fixed deformation ring R_B of its nonsplit representation and the trace map f_B:R^ps→R_B; define Z_B by this incidence construction. Prove scalar-equivalent nonzero extension classes give the same set under their deformation comparison. The word 'component' here refers to the component's generic point.

Use the imported characteristic-zero deformation ring and trace map, not a new representation deformation functor. Identify components with minimal prime ideals using the pinned Mathlib order equivalence. Intersect those generic points with the image of PrimeSpectrum.comap f_B.

The intended named interface is:

- `panExtensionComponents_mem_iff`: P lies in the set iff P is a minimal prime point of A and P=comap f Q for some Q in Spec B.
- `panExtensionComponents_minimal`: Every member indexes an actual irreducible component of Spec A.
- `panExtensionComponents_id`: For the identity map, this set is exactly the minimal-prime points of A.
- `panExtensionComponents_kernel_le`: The kernel of f is contained in every member P.asIdeal.
- `panExtensionComponents_comp_subset`: For ring maps f:A→B and g:B→C, panExtensionComponents (g.comp f) is a subset of panExtensionComponents f, by composition of spectrum comaps.

(Source: [PAN-2022, §7.4, Definition 7.4.21, p.121][PAN-2022].) *Needs:* GlobalGaloisDeformations:R04.2; IntegralHeckeAndGaloisDeterminants:IHG.1; mathlib:PrimeSpectrum.comap; mathlib:minimalPrimes; mathlib:minimalPrimes.equivIrreducibleComponents.

**Checks.**

- Pan Definition 7.4.21: for a nonzero extension class B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂), let R_B be the imported determinant-fixed characteristic-zero deformation ring of the nonsplit extension ρ_B. Under its trace map f_B:R^{ps}→R_B, define Z_B to be the components of Spec R^{ps} whose generic points lie in the image of Spec R_B→Spec R^{ps}. For a general ring map f:A→B the underlying incidence construction is the set of prime points P with P.asIdeal∈minimalPrimes A and P in range(Spec f). The arithmetic specialization uses f_B; scalar-equivalent extension classes have the same Z_B under the deformation comparison.
- For f=id_A the result equals {P∈Spec A | P.asIdeal∈minimalPrimes A}, via Mathlib’s component correspondence.
- If B is the zero ring, Spec B is empty and the component set is empty.
- If ker f is not contained in a minimal P, then P is not detected, so using all minimal primes instead of the image intersection fails.

### 10.6 Modularity along a component through a nice prime

In the completed setup defining nice primes, let x be a characteristic-zero maximal point whose p-adic local representations are irreducible regular de Rham. If one component contains x and a nice prime q, and at p=3 the residual local ratio is not omega^(±1), prove rho(x) regular algebraic cuspidal automorphic. First apply the localised comparison R^ps→T_m with nilpotent kernel at the nice prime, then carry the component through x to obtain promodularity. Apply the local–global algebraic-vector/classicality theorem and Jacquet–Langlands to x. Mere finite-image Galois data at q are not a replacement for niceness or Hecke occurrence.

Import Theorem 4.1.7’s surjection (R^{ps,{ξ_v}})_q→T_q with nilpotent kernel from §8.3 and §10.1. A minimal prime on a component through q contains the kernel, so the component is in the closed Hecke image. The point x is therefore pro-modular. Over F_v=Q_p, an irreducible two-dimensional de Rham representation with distinct Hodge–Tate weights is absolutely irreducible: otherwise its character constituents after finite coefficient extension are conjugate and have equal integer weights. Use the R06.2 coefficient/weight comparison, then §10.1’s Pan Corollary 3.5.12 with its absolutely irreducible local hypothesis and Jacquet–Langlands.

(Source: [PAN-2022, §4.1, Corollary 4.1.8, pp.39–40][PAN-2022].) *Needs:* §10.2; §8.3 restricted arithmetic patching; §10.1 nice-prime comparison and classicality; GL2AutomorphicRepresentationsAndTransfer:R17.3; §10.1 completed Hecke and local block compatibility; PadicHodgeTheory:R06.2.

**Checks.**

- The conclusion uses a common component, not just arbitrary connectedness of Spec R.
- Nilpotent kernel is sufficient; a literal global integral R=T assertion is not assumed.

### 10.7 The large component through the geometric point

Use Pan's setup with F abelian totally real, split at p, chi=det rho totally odd and de Rham at p, residual trace 1+bar-chi with bar-chi extending to G_Q, and rho irreducible regular de Rham at p. After the soluble/coefficient enlargement impose d=[F:Q]>|S away from p|+2. For the characteristic-zero trace point x prove dim(R^ps)_x≥2d and select a component C through x with dim C≥1+2d. After coefficient enlargement, generic inertia away from p on C is a sum of finite-order characters. Keep the determinant, degree and extension-of-residual-ratio hypotheses for the ordinary-density and trace-cut arguments which use this C.

For the component used in this proof, retain Pan §7.1.1–7.1.2: χ is de Rham at the p-places, the odd residual ratio χ̄ extends to G_Q, and the solvable field/coefficient enlargement has been performed with d=[F:Q]>|S\Σ_p|+2. These are the setup hypotheses used by the downstream ordinary-density and trace-cut arguments.

Use the characteristic-zero trace/deformation comparison of Pan Corollary 2.2.3, supplied by R04.2, to present the completed local ring by h¹ variables and h² relations. Apply the global Euler characteristic formula to ad⁰ρ: irreducibility gives h⁰=0 and total oddness gives one real-place invariant, hence h¹−h²=2[F:ℚ]. Use the dimension comparison to the integral component. Use Pan Lemma 5.7.3’s finite inertia characters at the generic point, supplied by R04.3’s away-p deformation analysis.

(Source: [PAN-2022, §7.1, Lemma 7.1.3 and §7.1.4, p.112][PAN-2022].) *Needs:* GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; ArithmeticGaloisDuality:R02.6.

**Checks.**

- In Pan §7.1, let F be totally real abelian, p split, χ=det ρ totally odd, and ρ:G_F,S→GL₂(𝒪) irreducible with residual trace 1+χ̄. Let x be the prime of its trace in the determinant-fixed R^{ps}. Then dim (R^{ps})_x≥2[F:ℚ], and there is a component C through x with dim C≥1+2[F:ℚ]. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

### 10.8 The generic ordinary intersection

For that C, suppose at every p-adic place the residual local ratio is different from 1, omega and omega^(-1). The ordinary local ideal is principal in this generic branch. Prove dim C^ord≥1+d and obtain a component finite and surjective over the weight Iwasawa algebra Lambda_F, of dimension 1+d, with dense irreducible regular de Rham ordinary points, all modular by the ordinary theorem. The reducible locus has dimension two and cannot fill this component when d>2. Both cyclotomic ratios are excluded here because their local ordinary ideal needs two generators.

The degree enlargement of §7.1.2 ensures [F:ℚ]>|S\Σ_p|+2. The local ratio hypothesis excludes both cyclotomic ratios; that branch has a two-generator ideal and a separate proof.

The generic local reducibility ideal is principal (Paškūnas Appendix B, Corollary B.20; request R08.6), so imposing ordinarity loses at most [F:ℚ] dimensions. Pan Theorem 5.1.2, supplied by R21.4–R21.5, gives finiteness over Λ_F. Equal dimension and the domain property give surjectivity on a chosen component. Leopoldt for the abelian F bounds the global reducible locus by dimension two; since [F:ℚ]>2 after the stated base change, it does not fill the component. Arithmetic weights with the appropriate local character ordering give the dense regular de Rham subset, and Theorem 5.1.2 makes it modular.

(Source: [PAN-2022, §7.2, Lemma 7.2.1, Corollary 7.2.3 and proof, pp.113–114][PAN-2022].) *Needs:* §10.7; LocalGaloisDeformationRings:R08.6; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5.

**Checks.**

- With C as in large-component-at-regular-point and χ̄|G_Fv≠1,ω^{±1} at every v|p, form C^{ord}=C∩Spec R^{ps,ord} using the imported local reducibility quotients. Then dim C^{ord}≥1+[F:ℚ]. There is a component C₁^{ord} finite and surjective over Spec Λ_F, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

### 10.9 The scalar local ordinary cover

When every residual local ratio is 1, use the ordinary cover recording a chosen lifting character psi_(v,1), with trace psi_(v,1)+chi psi_(v,1)^(-1). This is stronger data than reducibility of the pseudorepresentation. Locally compare O[[t₁,t₂,t₃]] with the chosen-character ordinary O[[x₁,x₂]] using three relations in the fibre product. The global dimension estimate is 1+2d+2d−3d=1+d. Obtain a component finite surjective over Lambda_F with dense modular regular ordinary points, using the scalar ordinary theorem. A principal-ideal calculation would give the wrong justification in this branch.

Import the chosen-character ordinary cover from R21.3, including Pan §6.1.1 and its distinction from the unordered reducible pseudodeformation locus. The local pseudo ring is 𝒪[[t₁,t₂,t₃]], the chosen-character ring 𝒪[[x₁,x₂]], and the comparison after adjoining the latter has a three-generator kernel. Thus the dimension estimate is 1+2d+2d−3d=1+d, not the generic principal-ideal estimate. Use Pan Theorem 6.1.2’s finiteness and modularity, supplied by R21.4–R21.5, to obtain the dense arithmetic points on the cover; project to the global component.

(Source: [PAN-2022, §7.3, Lemma 7.3.1 and Corollary 7.3.2, pp.115–116][PAN-2022].) *Needs:* §10.7; OrdinaryAutomorphicFormsAndModularityLifting:R21.3; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; LocalGaloisDeformationRings:R08.6.

**Checks.**

- The scalar local case is covered although the original Skinner–Wiles distinguished-character theorem does not cover it.

### 10.10 Producing a nice prime after solvable base change

Take the finite-surjective ordinary component or its chosen-character cover from the preceding branches, with dense irreducible modular regular points and d>|S away from p|+2. Cut by p and the away-from-p trace conditions to construct a potentially nice point; use the Leopoldt-based reducible-locus estimate to ensure its generic representation is irreducible. Choose a finite solvable totally real extension, split at p and of even degree, which kills the necessary finite local images, gives N(v)≡1 mod p and the constant away-p lift, and arranges the nonsplit lattice and dihedral disjointness. Prove the restricted points x' and q' lie on one component and q' is nice. The nonzero completed Hecke quotient and Hecke occurrence come from the dense ordinary modular points, not from the Galois definition of potentially nice.

Impose p and the away-p Frobenius trace conditions on C₁. The dimension bound and Leopoldt exclude the reducible locus and leave a dimension-one irreducible prime. The local away-p deformation analysis proves finite local images, giving potentially-nice-prime. Apply Taylor’s solvable field selection (Pan cites Taylor 2003 Lemma 2.2) to kill these finite images, force N(w)≡1 mod p and trivialize the generic inertia characters; request the exact deformation-problem restriction from R04.4. Use the dense ordinary modular points and solvable automorphic base change to produce the Hecke maximal ideal and make the image of C₁ pro-modular. The nonsplit-lattice and dihedral-disjointness checks are Pan §5.7.9’s argument, included in the R04.4 request. Contract along R^{ps,1}_{F₁}→R^{ps}/P. Since x and q lie on C, their images lie on one component; q′ satisfies all clauses of nice-prime.

(Source: [PAN-2022, §7.2.4–7.2.5, pp.114–115; §7.3 after Corollary 7.3.2, p.116][PAN-2022].) *Needs:* §10.3; §10.2; §10.7; GlobalGaloisDeformations:R04.4; GL2AutomorphicRepresentationsAndTransfer:R17.4; §10.1 completed Hecke and local block compatibility; GlobalGaloisDeformations:R04.3.

**Checks.**

- In Pan §7.1–§7.2, suppose C^{ord} (or its chosen-character cover) has a component C₁ finite surjective over Λ_F, with dense irreducible modular regular de Rham points, and [F:ℚ]>|S\Σ_p|+2. Then C₁ contains a potentially nice q. A finite totally real solvable F₁/F, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem R^{ps,1}_{F₁} lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

### 10.11 Geometry of nonsplit extension deformations

In the p≥5 cyclotomic branch take F abelian totally real split at p with d>|S away from p|+2 and psi₁/psi₂=epsilon theta, theta finite order, this ratio totally odd. For each nonzero extension class B, prove that the reduced closed reducible locus in Spec R_B has dimension at most d+1; each component of Spec R_B has dimension at least 2d; and its connectedness dimension is at least 2d−1. For a prime Q outside that closed reducible locus prove dim R^ps/(Q intersect R^ps)≥1+dim(R_B/Q), and prove minimal primes of R_B contract to minimal primes of R^ps. The source's superscript 'red' here denotes the reduced reducible locus, not the quotient of R_B by its nilradical. Use the global-to-local H¹ isomorphism for this exact S and odd geometric ratio, including its treatment of extra ramification places.

Use the R02.6 supplier contract for the exact cohomological calculation of Pan Lemma 7.4.15: restriction H¹(G_F,S,E(ψ₂/ψ₁))→⊕_{v|p}H¹(G_Fv,E(ψ₂/ψ₁)) is an isomorphism of dimension d, using Poitou–Tate and the stated Lichtenbaum vanishing with extra S-places accounted for. Use R04.2–R04.3 for Pan Lemmas 7.4.17–7.4.19: reducible-locus dimension, comparison of R_B with the completed integral deformation ring of a nonsplit residual lattice, and its Euler-characteristic presentation. Apply the R03 connectedness-dimension algebra and Pan Corollary 2.3.7’s trace comparison to obtain all four conclusions of Corollary 7.4.20.

(Source: [PAN-2022, §7.4, Lemmas 7.4.15–7.4.19 and Corollary 7.4.20, pp.119–121][PAN-2022].) *Needs:* §10.5; GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; ArithmeticGaloisDuality:R02.6; DeformationAndDerivedPatchingAlgebra R03.6.

**Checks.**

- In Pan §7.4.14–7.4.20, p≥5, F is abelian totally real, split at p, d=[F:ℚ]>|S\Σ_p|+2, and ψ₁/ψ₂=εθ with θ finite order and εθ totally odd. For nonzero B, the determinant-fixed R_B satisfies dim R_B^{red}≤d+1, every component has dimension ≥2d, and its connectedness dimension is ≥2d−1. If Q∉Spec R_B^{red}, then dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q; minimal primes of R_B contract to minimal primes of R^{ps}. Here R_B^{red} denotes the reduced closed reducible locus, not the reduced ring R_B modulo its nilradical.

### 10.12 Goodness within the extension component set

Under those cyclotomic extension bounds, show that if one component in Z_B is good then every component in Z_B is good. The connectedness lower bound 2d−1 exceeds the reducible-locus upper bound d+1 only when d>2, as arranged before this argument. Intersections outside that locus project to sufficiently large intersections in the pseudodeformation spectrum; use the trace-cut construction to place potentially nice points there and propagate seeded reachability. No such dimension inequality is asserted over the degree-one starting field.

The degree is enlarged sufficiently for the strict dimension inequalities of the proof; they are not asserted for d=1.

Partition the union of components in Z_B into nonempty unions Z₁,Z₂ and pull the partition back to Spec R_B. Connectedness dimension ≥2d−1 gives an intersection point Q of that dimension. Since 2d−1>d+1 in the degree-enlarged setting, Q is outside the reducible locus. The trace-map dimension gain gives an intersection in the pseudodeformation space of dimension at least 2d. Use the R04.3 trace-cut prime-selection export on this intersection, with the |S\Σ_p| equations, reducible-locus bound and finite-away-p-image check, to obtain a potentially nice common point. The step API of good-component propagates across the partition, ruling out a good/bad partition.

(Source: [PAN-2022, §7.4, Corollary 7.4.22 and proof, p.121][PAN-2022].) *Needs:* §10.11; §10.4; §10.3; §10.10; GlobalGaloisDeformations:R04.3.

**Checks.**

- Under extension-component-control’s hypotheses, for each nonzero B, if one component in Z_B is good then all components in Z_B are good (Pan Corollary 7.4.22).

### 10.13 Goodness in the cyclotomic residual branch

For p≥5 in the enlarged Pan setup, with residual ratio omega at every p-adic place and C the large component through the nonordinary regular point, prove C good. The local model O[[x₀,x₁,y₀,y₁]]/(x₀y₁−x₁y₀) has ordinary ideal (x₀,x₁), so the initial ordinary intersection gives only a dimension-at-least-one statement. Treat the resulting point according as it is irreducible, reducible nongeometric or cyclotomic geometric. In the last case use the H¹ comparison to choose a one-place class B₀ and a lattice class B₁, propagate goodness through Z_B, and use the off-diagonal GMA ideal of height at most one to obtain an intersection of dimension at least d+2 containing a potentially nice point. A final soluble extension takes the good chain to a nice Hecke component. Obtain the inverse-cyclotomic orientation by relabelling and a finite character twist. This is not the exceptional p=3 case.

Use the local ring R_v^{ps}≅𝒪[[x₀,x₁,y₀,y₁]]/(x₀y₁−x₁y₀), with ordinary quotient by (x₀,x₁), from R08.6. This initially gives only dim C^{ord}≥1. Choose a dimension-one ordinary q. If ρ(q) is irreducible, Pan Lemmas 7.4.8–7.4.10 use a deformation presentation to bound connectedness by 2d−1; the correctly oriented ordinary deformation component supplies a seed. A hypothetical good/bad partition then contains a potentially nice intersection point. If ρ(q)=ψ₁⊕ψ₂ with ratio not ε^{±1} times finite order, Lemma 7.4.12 makes the local ordinary ideal principal after localization away from the singular cyclotomic point. The dimension and ordinary-density argument gives a seed component. In the remaining ratio ψ₁/ψ₂=εθ case, use extension-component-control and extension-component-propagation. Choose B₀ supported at one p-place via the cohomological restriction isomorphism, find a good component in Z_B₀, and realize C in Z_B₁ via a normalized one-dimensional deformation lattice. Pan Lemma 7.4.23’s height-at-most-one off-diagonal ideal yields an intersection of a component of Z_B₀ with one of Z_B₁ of dimension at least d+2. Choose a potentially nice point there and propagate goodness. The GMA and height calculation are precise IHG.1/R04.2 requests.

(Source: [PAN-2022, §7.4, Proposition 7.4.3 and proof, Lemmas 7.4.4–7.4.23, pp.117–124][PAN-2022].) *Needs:* §10.7; §10.4; §10.8; §10.10; §10.5; §10.11; §10.12; LocalGaloisDeformationRings:R08.6; GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; IntegralHeckeAndGaloisDeterminants:IHG.1; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; DeformationAndDerivedPatchingAlgebra R03.6.

**Checks.**

- The local ordinary ideal has two generators globally in this branch; treating it as principal globally fails.
- The exceptional p=3 branch is not included.

### 10.14 Pan’s nonordinary Hilbert modularity theorem

Let p>2 and F/Q be abelian totally real and completely split at p. Suppose rho over F is continuous, irreducible and finitely ramified, with residual semisimplification bar-chi₁⊕bar-chi₂ whose ratio extends to G_Q and is odd. At each p-adic place require an irreducible regular de Rham local representation; at p=3 exclude residual ratios omega^(±1). Prove rho is a twist of a Hilbert modular representation. Normalise the residual ratio by a finite-order character lift, enlarge the degree as above, and apply the generic, scalar or cyclotomic component argument, the nice-prime bridge and soluble descent. A cyclotomic weight twist is not substituted for the finite character normalisation in that reduction.

Normalize χ̄₁=1 by its finite-order lift. Use the solvable field and coefficient enlargements of §7.1.2, keeping total reality, p splitting and characteristic-zero irreducibility, then find the large component at ρ. The residual representation remains reducible. In the generic ratio branch use generic-ordinary-intersection; in the scalar branch use scalar-ordinary-intersection. Produce a nice prime after base change and apply nice-prime-component-bridge. For the cyclotomic branch at p≥5 use cyclotomic-component-connectedness. Lemma 7.4.2 chooses one solvable extension simultaneously for the finite component chain, starts from the ordinary modular seed, and repeatedly applies the nilpotent-kernel bridge. Apply nonordinary classicality and Jacquet–Langlands over the auxiliary field, then descend by solvable base change and untwist. No global residual modularity assumption is introduced.

(Source: [PAN-2022, §7.1, Theorem 7.1.1; §7.4, Lemma 7.4.2, pp.111–116][PAN-2022].) *Needs:* §10.7; §10.8; §10.9; §10.10; §10.4; §10.13; §10.6; ArithmeticGaloisRepresentations:R01.1; GL2AutomorphicRepresentationsAndTransfer:R17.4; GlobalGaloisDeformations:R04.4.

**Checks.**

- Let p>2, F/ℚ abelian totally real with p completely split, and ρ:G_F→GL₂(𝒪) continuous irreducible and finitely ramified. Assume ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂ extends to G_ℚ and takes value −1 at every complex conjugation. At every v|p, require ρ|G_Fv irreducible de Rham with distinct Hodge–Tate weights, and when p=3 require the local residual ratio not ω^{±1}. Then ρ is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

### 10.15 Pan's theorem: the Fontaine–Mazur conjecture in the residually reducible case

For p odd let rho over Q have finite coefficients, be continuous, irreducible, odd and finitely ramified, and potentially semistable with distinct local Hodge–Tate weights. Suppose its residual semisimplification is bar-chi₁⊕bar-chi₂ and, if p=3, their local ratio is not omega. Prove rho comes from a cuspidal eigenform up to twist. Use the distinguished ordinary theorem, Pan's scalar ordinary theorem, or the nonordinary Hilbert theorem followed by descent, according to the actual local branch. Residual modularity is not a premise. After Layer 7 normalisation this proves `ResiduallyReducibleLifting p` for p≥5. Characteristic-zero irreducibility is retained even though the residual semisimplification is reducible.

irreducibility of ρ is kept: ρ̄ being a sum of characters does not make ρ a sum of characters. no residual modularity is assumed: residually reducible representations are handled with pseudo-representations. at p = 3 the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω is excluded throughout the paper, for lack of p-adic local Langlands input (Pan's Theorems 3.4.5–3.4.6); Dieulefait–Pacetti quote the theorem only for p ≥ 5. For p≥5 this is the residually reducible lifting form used by transfer-residually-reducible; it does not need the Layer 7 statement predicates.

Split by whether the local characteristic-zero representation at p is reducible. In the reducible local case apply the exact ordinary theorems of Pan 5.1.2 (distinguished) or 6.1.2 (scalar residual local ratio), supplied by R21.5. These include their finite Λ-algebra inputs from R21.4. In the irreducible local case apply nonordinary-hilbert-modularity with F=ℚ; the generic, scalar and cyclotomic components have separate proof paths. Untwist using the global geometric-character convention. At p=3, ω=ω^{−1}, so swapping residual characters leaves the excluded case unchanged.

(Source: [PAN-2022, Introduction, Theorem 1.0.2, p. 3 (arXiv v2)][PAN-2022]; [PAN-2022, Introduction, after Theorem 1.0.2, p. 3 (arXiv v2)][PAN-2022].) *Needs:* §10.14; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

**Checks.**

- ρ̄^{ss} ≅ 1 ⊕ χ̄₅ at p = 5 with ρ|_{G_{ℚ₅}} irreducible and de Rham of distinct weights: covered (non-ordinary case).
- p = 3 with ρ̄^{ss} ≅ 1 ⊕ χ̄₃: excluded (χ̄₃|_{G_{ℚ₃}} = ω); this is Dieulefait–Pacetti's p = 3 branch, §11.2.

### 10.16 Pan’s residually irreducible lifting theorem with residual modularity

For p odd, let rho over Q be continuous, irreducible, odd and finitely ramified, with modular residual representation absolutely irreducible on G_(Q(zeta_p)) and locally absolutely irreducible regular de Rham rho at p. At p=3 exclude both orientations of residual local extensions of eta by eta omega, including split ones. Prove rho modular by Pan's conditional Theorem 8.0.1. This is an alternative lifting result in its exact scope. The broader introductory Theorem 1.0.4 combines other cases and uses full Serre modularity through Remark 8.0.4, and is not an independent input here.

Residual modularity is kept in the lifting statement.

Construct the residual-modular completed-homology patching argument of Pan §8 from the arithmetic patching and block/classical-point comparisons in §§8.2–8.3 and §10.1, with its explicit exclusions at three. Its output is the conditional Theorem 8.0.1, with residual modularity retained. Remark 8.0.4 replaces that hypothesis by the full Serre theorem and is excluded from the independent proof-input closure.

(Source: [PAN-2022, §8, Theorem 8.0.1 and Remark 8.0.4, pp.124–125][PAN-2022].) *Needs:* §§8.2–8.3 and §10.1; §10.1 nice-prime comparison and classicality.

**Checks.**

- A merely residually irreducible representation is not admitted unless its cyclotomic restriction and residual modularity satisfy the theorem.
- An application in an independent proof of Serre modularity uses the residually reducible theorem with its explicit hypotheses, without invoking the unconditional Theorem 1.0.4.

### Examples

For component sets {0},{0,1},{1,2}, potentially nice points {0,1} and seed points {0}, all three are good. If the only common point of two components is not potentially nice, it cannot be an adjacency edge. For f=id_A every minimal-prime point is detected; for a map to the zero ring no point is detected.

### Dependencies

Layers 7–9 and the completed Hecke/block target of this layer; R01 coefficient and character normalisation; R02 exact H¹ comparison; R03 connectedness; R04 global pseudodeformation geometry; R08 local ordinary/GMA models; R17/R19 classical comparison; R21 ordinary arithmetic density; CompletedCohomologyPartII and IHG for the general completed action image.


## Layer 11: The ordinary exceptional branch at three

### 11.1 Normalization by the ordinary quotient character

Let rho be continuous irreducible odd and finitely ramified at p=3, with an actual ordinary unramified local quotient beta, global residual characters bar-alpha,bar-beta, and det rho=psi epsilon^(k−1), psi finite order, k≥2. Require bar-beta locally to be the reduction of that actual quotient. Its global Teichmuller lift eta is finite order and unramified at three. Twist rho by eta^(-1). Prove its residual semisimplification is bar-alpha bar-beta^(-1)⊕1, its local quotient is unramified and inertia quotient trivial, its determinant is (psi eta^(-2))epsilon^(k−1), and its Hodge–Tate weights and oddness are unchanged. If the ratio is globally omega₃, this is the exact exceptional ordinary-three interface. A general nontrivial local ratio instead uses the general distinguished ordinary theorem. Choosing either residual character arbitrarily may normalise the wrong quotient.

Import finite-order character lifts, twists, determinant and weight formulas from R01.1–R01.2. Choose β̄ by the actual local ordinary quotient, rather than an arbitrary labelling of the two residual characters. Since β is unramified at 3, its reduction and Teichmüller lift are trivial on inertia; this preserves the quotient condition. Apply the imported distinguished Skinner–Wiles theorem. The source residual 1⊕ω₃ specialization requires the ratio globally, while the theorem over ℚ needs only its nontrivial local restriction.

(Source: [SKINNER-WILES-1999, Introduction, Theorem, printed p.6 (Numdam page image)][SKINNER-WILES-1999]; [DIEULEFAIT-PACETTI, §1.2, Theorem 1.7, arXiv p.4; publisher PDF p.5][DIEULEFAIT-PACETTI].) *Needs:* ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three.

**Checks.**

- A finite-order twist preserves weight k; an inverse cyclotomic twist generally shifts both weights and cannot be silently substituted.
- After twisting an arbitrarily chosen residual character, the inertia quotient need not be trivial.

### 11.2 The p = 3 residually reducible branch: Skinner–Wiles, and why Pan's theorem does not cover it

Prove `OrdinaryThreeLifting`. Use finite coefficient descent and the genuine ordinary quotient just specified. For a lift with residual semisimplification 1⊕omega₃, inertia quotient 1, odd determinant and det rho=psi epsilon₃^(k−1) for finite-order psi and k≥2, verify every hypothesis of Skinner–Wiles at three and obtain a weight-k modular form. Residual distinction on the decomposition group is automatic from nontrivial omega₃ on inertia. Pan's theorem at three excludes this local ratio, so the ordinary input is essential. The finite-order condition on psi comes from Skinner–Wiles even though DP Theorem 1.7 does not repeat it. No claim is made for an arbitrary nonordinary de Rham lift of residual type 1⊕omega₃.

Skinner–Wiles' hypothesis (i) χ|_{D₃} ≠ 1 holds automatically for χ = χ̄₃, which is ramified at 3; Dieulefait–Pacetti print it as 'ρ|_{D₃} ≠ (1 0; 0 1)' . The inertia-quotient condition is an explicit hypothesis of this theorem. The crystalline-to-ordinary criterion is used separately in crystalline-weights-two-four-completion. Pan Theorem 1.0.2 includes odd p=3 but excludes local residual ratio ω; the existing R21.5/theorem-a-at-three already records this accurately. ψ is of finite order, as stated in Skinner–Wiles. DP Theorem 1.7 does not repeat this qualification; the source correction stated here records it. The representation is defined over a finite extension E/Q_3, as required by Skinner–Wiles; the Q̄_3 notation denotes its coefficient embedding.

Import R21.5/theorem-a-at-three, proved from Skinner–Wiles’ introduction theorem with finite-order ψ and nontrivial residual ratio on the decomposition group. The ratio of 1 and ω₃ is ω₃ in either order because it has order two. Thus Pan Theorem 1.0.2’s p=3 exclusion applies exactly here, even though Skinner–Wiles covers the ordinary lift. Use ordinary-character-normalisation only for the explicit extension to other globally labelled character pairs; its finite-order twist preserves the inertia quotient and the weight.

(Source: [SKINNER-WILES-1999, Introduction, the Theorem, printed p. 6 (on the page image)][SKINNER-WILES-1999]; [DIEULEFAIT-PACETTI, Theorem 1.7 and its proof, pp. 4–5 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three; §11.1.

**Checks.**

- ρ̄^{ss} ≅ 1 ⊕ χ̄₃ with ρ crystalline of Hodge–Tate weights {0, 1} at 3: ordinary by the local calculation, hence modular by this branch; Pan's theorem does not apply.
- The same residual sum written χ̄₃⊕1 is covered by relabelling its two summands. Relabelling does not twist the characteristic-zero representation; an inverse 3-adic cyclotomic twist would change the weights and can destroy the trivial inertia quotient.

### 11.3 The crystalline p=3 completion in weights two and four

Let rho over Q be continuous irreducible odd and finitely ramified, crystalline at three with weights {0,k−1}, k=2 or 4, and globally reducible residual semisimplification. The crystalline-to-ordinary theorem in the exact range 2≤k≤p+1 makes rho ordinary, and its residual inertia characters are distinguished. The geometric determinant theorem gives the finite-order determinant factor. Normalise by the actual quotient's Teichmuller lift and apply the distinguished Skinner–Wiles theorem, then undo the finite-order twist to obtain a weight-k eigenform. In the level-one situation the normalised global characters are 1 and omega₃; the general statement only needs the distinguished ratio. The inference from residual reducibility to ordinarity is asserted here only in this crystalline range.

Use the existing R06.4/two-dimensional-ordinarity-criterion calculation in the precise interval 2≤k≤p+1. Its two local characters are unramified times ε^{k−1} and an unramified quotient. At p=3 and k=2 or 4, k−1 is odd, so the residual ratio on inertia is ω₃≠1. Thus this is the distinguished ordinary case. The determinant of a global geometric character is finite order times ε^{k−1}, supplied by R01.2. Apply ordinary-character-normalisation and the general Skinner–Wiles theorem. In DP’s level-one specialization, the normalized residual global ratio is ω₃, so apply p-three-residually-reducible-branch.

(Source: [DIEULEFAIT-PACETTI, §2, Paso 6, arXiv p.14 / publisher PDF p.14; §1.2, Theorem 1.7, arXiv p.4 / publisher PDF p.5][DIEULEFAIT-PACETTI].) *Needs:* §11.1; PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; ArithmeticGaloisRepresentations:R01.2; §11.2.

**Checks.**

- Weights 2 and 4 at 3 are covered even though they lie in Pan’s excluded local ω branch.
- The statement does not cover arbitrary crystalline weights, nor arbitrary noncrystalline de Rham representations with residual 1⊕ω₃.

### Examples

At three omega₃ is nontrivial on inertia, so the residual characters 1 and omega₃ are distinguished. Normalising by the Teichmuller lift eta of the actual ordinary quotient changes psi to psi eta^(-2); this finite-order factor preserves the weight. Residual type 1⊕omega₃ by itself supplies no ordinary structure on the lift.

### Dependencies

Layer 7 predicates and weight normalisation; R01 finite characters and determinant classification; R06.4 crystalline-to-ordinary criterion in weights 2 through p+1; the exact Skinner–Wiles theorem at three.


## Layer 12: Directed congruence and polynomial-family transfer

### 12.1 Modularity transfer along a congruence at an odd prime with cyclotomically irreducible residual representation

Let p be odd and rho,rho' be continuous odd finitely ramified representations over finite p-adic coefficient fields with isomorphic residual representations after common coefficient extension. Suppose their common reduction is absolutely irreducible over Q(sqrt(pStar p)) and both local lifts are de Rham with weights {0,k−1} and {0,k'−1}, k,k'≥2. Prove rho modular if and only if rho' modular: either direction supplies actual residual modularity for the other and applies `OddPrimeLifting p`. Weight, inertial type and ordinary status may differ. Independence from a full Serre theorem additionally requires the proof-input audit below; the logical implication as a conditional lifting result is separate from that proof audit.

absolute irreducibility over ℚ(√p*) is equivalent to that over ℚ(ζ_p) (Dieulefait–Pacetti Lemma 1.13, R01.4 quadratic-cyclotomic criterion); it is the hypothesis in the combined theorem as Tung states it. Residual modularity remains an explicit hypothesis; independence of the full Serre modularity endpoint requires the proof-input closure in §12.8. Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Theorem 1.4 (Kisin, Emerton, Paškūnas, Hu–Tan, Tung) applied to ρ′, whose residual representation is that of the modular ρ.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.4 and its proof, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI]; [TUNG-2021-DYADIC, Introduction, the theorem of Kisin, Paškūnas, Hu–Tan and Tung, pp. 1–2 (arXiv v3)][TUNG-2021-DYADIC]; [TUNG-2021-P3, Theorem 4.7, p. 15 (arXiv v4)][TUNG-2021-P3].) *Needs:* §8.11; ArithmeticGaloisRepresentations R01.4 quadratic-cyclotomic criterion (opening contract); ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

**Checks.**

- A newform f and a congruent de Rham lift ρ′ of ρ̄_f of a different Hodge–Tate weight: ρ′ is modular.
- Non-example: ρ̄ bad dihedral (ρ̄|_{G_{ℚ(√p*)}} reducible) is excluded; A later application must verify its absence separately, for example by the applicable Fontaine–Laffaille argument.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

### 12.2 Modularity transfer along a congruence at 2 with non-solvable residual image

For continuous odd finitely ramified two-adic rho,rho' with regular de Rham local restrictions and isomorphic residual representations of nonsolvable image, prove modularity equivalent. Characteristic-zero irreducibility follows from residual nonsolvability; oddness remains a premise on each lift. Use `DyadicLifting` in each direction with the other modular lift as residual witness, allowing different weights after cyclotomic normalisation and restoring their geometric twists. A congruence with solvable residual image does not satisfy this theorem.

non-solvable residual image is needed at p = 2. irreducibility of ρ, ρ′ follows from that of ρ̄. Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

§9.4 applied to ρ′ with ρ̄′ = ρ̄ modular.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.5 and its proof, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* §9.4; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

**Checks.**

- Dieulefait–Pacetti §3: a weight-2 system through a dyadic lift of a non-solvable ρ̄ transfers modularity from an odd member back to the 2-adic one.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

### 12.3 Modularity of residually reducible representations at a ramified coefficient prime

For p≥5, a continuous irreducible odd finitely ramified regular de Rham lift over Q with reducible residual semisimplification is modular up to its geometric normalisation, by Pan. The same holds at three outside the local ratio omega. As a congruence step this conclusion applies to the selected target itself, without any modular source lift, residual modularity witness or ordinary hypothesis. In weights {0,k−1} the Layer 7 argument gives a weight-k newform. The exceptional ratio at three requires the actual ordinary hypotheses of Layer 11.

Dieulefait–Pacetti state p ≥ 5; Pan's theorem also covers p = 3 when χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω, and the p = 3 case with ω is §11.2. Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Ordinary case: Skinner–Wiles (OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q) and Pan §6; non-ordinary case: Pan's Theorem 7.1.1.

(Source: [DIEULEFAIT-PACETTI, Theorem 1.6 and its proof, p. 4 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* §10.15; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

**Checks.**

- A member ρ_ℓ of a compatible system with ρ̄_ℓ reducible at a prime ℓ ≥ 5 of the ramification set: modular without any local comparison at ℓ.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

### 12.4 Ordinary congruence transfer at three

For two continuous irreducible odd finitely ramified three-adic lifts, suppose each has its own specified finite-order quotient-character normalisation to residual 1⊕omega₃, inertia quotient 1 and determinant finite order times epsilon^(k−1), for its own k≥2. Prove both modular by the ordinary-three theorem and undo their finite-order twists. Hence their modularity is equivalent, even with different weights or local types. Congruence alone does not give the ordinary or finite-order determinant hypotheses on either lift; the theorem in fact applies separately to each.

Apply ordinary-character-normalisation to each lift with its own designated quotient. Apply p-three-residually-reducible-branch to each normalized lift and untwist; both conclusions give the equivalence.

(Source: [DIEULEFAIT-PACETTI, §1.2, Theorem 1.7, arXiv pp.4–5 / published p.5][DIEULEFAIT-PACETTI].) *Needs:* §11.1; §11.2; ArithmeticGaloisRepresentations:R01.1.

**Checks.**

- Let ρ,ρ′ be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification 1⊕ω₃, is of inertia shape (∗ ∗;0 1), and has determinant finite order times ε^{k−1} for its own integer k≥2. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

### 12.5 Directed modularity transfer between families linked by one residual congruence

Give two indexed families, indexed by finite places lambda of number fields E_A and E_B. Each rho_(i,lambda) is a continuous two-dimensional representation over a finite extension of (E_i)_lambda, semisimple after extension to the algebraic closure. Give a finite set S_i and P_(i,q) in E_i[X] for q outside S_i. For q different from the residue characteristic of lambda, require rho_(i,lambda) unramified at q and its arithmetic Frobenius polynomial equal to the image of P_(i,q). These are explicit representation and polynomial data; no compatible-system existence theorem is used.

Choose lambda_A,lambda_B over one rational p, embeddings into Qbar_p and stable lattices with isomorphic residual semisimplifications over Fbar_p. Require both selected characteristic-zero representations absolutely irreducible, odd, finitely ramified and de Rham at p with weights {0,k_A−1} and {0,k_B−1}, k_A,k_B≥2. If any A-member is attached to an actual normalised cuspidal newform of weight at least two, prove that every B-member is attached to one normalised cuspidal newform g of weight k_B, provided one of these branches holds:

- p odd and the common residual representation is absolutely irreducible over Q(zeta_p);
- p=2 and the common residual image is nonsolvable;
- the B-reduction is a sum of characters with p≥5, or p=3 and nonexceptional local ratio;
- p=3 and the B-member has a specified finite-order normalisation justified by its actual ordinary quotient, giving residual 1⊕omega₃, inertia quotient 1 and determinant finite order times epsilon₃^(k_B−1).

For the last two branches the B-data suffice: the A-family, congruence and modular seed may all be omitted. Only the selected members need regular de Rham hypotheses. The coefficient prime may lie in S_i, and no coefficient-prime Weil–Deligne comparison is assumed.

The proof compares number-field coefficients first. At the known modular A-place, common good-prime polynomials and the eigenform polynomials agree after embeddings in one local algebraic closure. Injectivity of that algebraic embedding identifies them in a common algebraic coefficient field. Embed that field at the selected p-adic place, and apply Frobenius recognition there to make the selected A-member modular. The congruence supplies residual modularity for B in the first two branches; in the last two apply the target theorem directly. Normalise the resulting B-form by the geometric-character argument. Its good-prime polynomials agree with P_(B,q); embed this algebraic identity separately at each B-place and apply semisimple Frobenius recognition in that one residue characteristic. No comparison is an isomorphism of p-adic fields of different residue characteristics.

Odd irreducible branch: p is odd and the common residual representation restricted to G_Q(ζ_p) is absolutely irreducible. A known modular A-member is the modularity seed; congruence supplies residual modularity for B. Dyadic branch: p=2 and the common residual image is nonsolvable. Oddness is imposed on the characteristic-zero representations; reduction modulo two cannot detect its determinant sign. Reducible Pan branch: p≥5 and the selected B-residual semisimplification is χ̄_1⊕χ̄_2; also allow p=3 if (χ̄_1χ̄_2^−1)|G_Q3 differs from ω_3. Irreducibility over Q̄_p remains required, rather than irreducibility only over a finite coefficient field. No ordinarity, residual modularity or coefficient-prime Weil–Deligne comparison is assumed. Exceptional ordinary-three branch: p=3; a specified finite-order character η gives τ=ρ_B,λB⊗η^−1 with residual semisimplification 1⊕ω_3 globally, τ|I_3 upper triangular with quotient 1, and det τ=ψ ε_3^(k_B−1) for ψ of finite order. The normalization is justified by the actual ordinary quotient. Congruence does not establish these hypotheses. For all good-prime identities, enlarge coefficient number fields and local fields before comparing. No isomorphism between different-characteristic coefficient fields is asserted. Frobenius recognition is applied separately in each fixed residue characteristic. The family hypotheses are ordinary indexed representation and polynomial data, not an invocation of a compatible-system carrier, existence theorem, strict compatibility or all-member de Rham predicate. Only the selected members need the stated de Rham condition.

Form each compositum using the embeddings determined by the given modular realisation, and extend the chosen embedding at the next coefficient place to that compositum. R01.5 recognition applies to semisimple representations in one fixed local algebraic closure; R19.3 gives absolute irreducibility of each classical newform representation. R01.1 then identifies the lattice-independent residual semisimplifications. For the B-modularity witness, §7.9 proves that the actual scalar-isomorphism character is de Rham and finitely ramified, invokes rank-one classification, compares weights, and absorbs its finite-order part by the ModularForms twist and primitive-associate constructions. Apply the same argument when undoing the specified ordinary-three finite twist. Good-prime identities in the resulting compositum then transport separately to every B-place. Removing finitely many primes for each recognition step is sufficient; no uniform coefficient-prime Weil–Deligne comparison is needed.

(Source: [DIEULEFAIT-PACETTI, Theorems 1.4–1.7, pp.4–5; Definition 1.10 and Remark 4, pp.6–7; §2, pp.9–14 (arXiv v2)][DIEULEFAIT-PACETTI]; [PAN-2022, Theorem 1.0.2, p.3 (arXiv v2)][PAN-2022]; [SKINNER-WILES-1999, Introduction main theorem, printed p.6 / PDF p.3][SKINNER-WILES-1999].) *Needs:* §12.1; §12.2; §12.3; §11.2; §11.1; §7.9; ArithmeticGaloisRepresentations:R01.1/coefficient-extension; ArithmeticGaloisRepresentations:R01.1/reduction-and-residual-semisimplification; ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent; AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation; ArithmeticGaloisRepresentations:R01.1/residual-representation-well-defined; AutomorphicGaloisRepresentations:R19.3/classical-newform-irreducibility; Layer 7; tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer.

**Checks.**

- A bridge at p=5 may have p in S_B and reducible residual B-member. Given characteristic-zero irreducibility, oddness and de Rham weights {0,3}, Pan produces a weight-four witness without coefficient-prime WD data or a modular A-family.
- At p=3 a normalized residual sum 1⊕ω_3 has excluded Pan ratio ω_3 in either ordering. The ordinary-three branch works only after the inertia-quotient and finite-order determinant hypotheses have been checked on B.
- At p=2 an isomorphism of residual representations with solvable image does not enter the dyadic branch; nor does residual determinant 1 establish characteristic-zero oddness.
- A modular A-family and a residual congruence alone do not enter any branch when B is missing the required local or residual-image conditions.
- Within one family, modularity of a member propagates using only good polynomials and semisimplicity, without de Rham conditions at the other coefficient primes. A claimed equality of good polynomials must be checked after specified coefficient embeddings.
- A finite chain is handled edge by edge, recording the prime, embeddings, lattices, selected weights and the applicable branch for each directed edge. Reverse traversal requires hypotheses for its new target; a reducible branch can instead start modularity without a seed.
- Frobenius recognition alone returns semisimplifications on both sides. The actual newform realization is identified using its separate R19.3 absolute-irreducibility export; the R19.1 good-polynomial construction alone is not that export.
- The classification of the actual twist in §7.9 precedes comparison of weights: comparing two weight multisets alone does not show that an arbitrary character is geometric.
- A finite-order Dirichlet twist of a newform need not itself be new at the displayed twist level. Take its normalized primitive associate, preserving weight and the good-prime eigenvalues, before claiming the conclusion is a newform.
- The selected p may lie in S_B: the lifting step uses its de Rham condition rather than a coefficient-prime WD identity.
- Without semisimplicity, equality of every good-prime polynomial only identifies semisimplifications, so it cannot identify a nontrivial extension with a direct sum.
- In a Pan branch the B-family needs no modular A-member; in the odd irreducible branch removing the modular seed leaves residual modularity unproved.

### 12.6 Why de Rham lifting suffices when an almost strictly compatible system lacks the Weil–Deligne comparison at the coefficient prime

Apply the explicit-family theorem to DP-style almost strictly compatible data by forgetting the extra structure and keeping the representations, common good-prime polynomials and selected congruence. If every member is known odd, absolutely irreducible, finite-coefficient and de Rham with common regular weights, select any member for which the relevant lifting branch holds. DP Definition 1.10(4)–(5) supplies the all-member de Rham assertion for its systems; the historical KW almost-strict label alone does not. The lifting step itself only needs the selected member's de Rham property, and still applies when the coefficient-prime Weil–Deligne comparison is absent. Once it is modular, good-prime polynomial recognition identifies every semisimple member with its modular-form representation. This theorem consumes the family; it does not construct one through every regular de Rham lift or validate a general system-existence claim.

(Source: [DIEULEFAIT-PACETTI, §1.4, Definition 1.10 and the definition of almost strictly compatible systems, pp. 6–7 (arXiv v2)][DIEULEFAIT-PACETTI]; [DIEULEFAIT-PACETTI, Remark 4, p. 7 (arXiv v2)][DIEULEFAIT-PACETTI].) *Needs:* §12.5 explicit polynomial-family data; §12.5 semisimple polynomial recognition and absolute irreducibility of the selected member; §12.1; §12.2; §12.3; §12.4; §12.7; ArithmeticGaloisRepresentations:R01.5; AutomorphicGaloisRepresentations:R19.3.

**Checks.**

- At ramified p≥5 and reducible residual representation, use de Rham plus Pan, without a WD equality.
- A KW almost-strict system missing de Rham at that member fails the premise.
- Good-prime recognition compares characteristic polynomials after common coefficient extension and semisimplification.

### 12.7 Transfer at a ramified reducible coefficient prime

Let an explicit polynomial family have a selected member at lambda|p with p in its finite ramification set. Require that member absolutely irreducible, odd, finitely ramified, finite-coefficient and regular de Rham, with reducible residual semisimplification. For p≥5 apply Pan directly, and identify all other semisimple members by their common good-prime polynomials. At p=3 require either Pan's nonexceptional ratio or the exact ordinary-three normalisation. No coefficient-prime Weil–Deligne comparison and no modular A-family is required. A DP Definition 1.10 family supplies the de Rham data; bare weak or historical almost-strict compatibility does not supply them.

(Source: [DIEULEFAIT-PACETTI, §1.4, Definition 1.10 and Remark 4, arXiv pp.6–7 / publisher PDF p.7][DIEULEFAIT-PACETTI].) *Needs:* §12.5 explicit polynomial-family data; §12.3; §11.2; PadicHodgeTheory:R06.3; ArithmeticGaloisRepresentations:R01.5; AutomorphicGaloisRepresentations:R19.3.

**Checks.**

- A p∈S member with reducible residual representation is covered at p≥5 without assuming it is crystalline.
- For a historical KW almost-strict carrier lacking an all-member de Rham assertion, this application requires an explicit additional de Rham hypothesis.

### 12.8 Dependency audit: which globalisations in the lifting theorems use the general Serre theorem

Prove a source-dependency closure for any use of these lifting theorems inside an independent proof of Serre's conjecture. Start from the conditional residual-modular statements and Pan's residually reducible theorem. Exclude Emerton §7.3 unconditional promodularity and Pan's unconditional residually irreducible consequence through Remark 8.0.4. For the auxiliary local-to-global constructions inspect their proofs, not merely their final residual-modularity clauses.

The exact additional obligations are: the definite-unitary arithmetic patching module, capture and faithfulness used in Tung's odd-prime §3; its restricted CM globalisation through Emerton–Gee Proposition A.2, Lemma A.5, Proposition A.6 and Corollary A.7, including the Calegari finite-image construction, the prescribed potentially diagonalizable lift, and the potential-automorphy step preserving the p-adic completions; the ordinary reducible-component globalisation in BLGG Theorem A.4.1; prescribed-weight modular lifting in Gee Theorem 4.6.9 (older numbering 4.4.12); and the restricted globalisations in the proof of Emerton's algebraic-vector theorem. In the dyadic argument inspect Tung Lemma 4.3.3 through Calegari Theorem 3.2, Snowden Theorem 8.2.1 and the HBAV construction in KW II Theorem 6.1; separately inspect Lemma 4.3.4 through Paskunas Theorem 3.29 and KW II Lemma 3.5. These auxiliary uses are different from the assumed residual modularity of the representation being lifted.

The desired output is a dependency derivation using only the finite residual input, the specified local/global algebra and the restricted auxiliary constructions, with none of the full Serre endpoint, a consumer's chain of congruences, or a general compatible-system existence theorem. This audit is a mathematical target with named proof obligations. The cited conditional lifting statements alone do not certify it. For every named auxiliary construction, supply the complete dependency derivation before invoking this closure theorem; verification of only its immediate citations is insufficient.

(Source: [Emerton–Gee, Appendix A, pp. 32–35][EMERTON-GEE-2014]; [TUNG-2021-DYADIC, Introduction, p. 2 (arXiv v3)][TUNG-2021-DYADIC]; [PASKUNAS-2016, §1.1.2 'Global part', p. 5 (arXiv v2)][PASKUNAS-2016]; [PAN-2022, Remark 8.0.4, p. 125 (arXiv v2)][PAN-2022]; [EMERTON-LGC-2011, §7.3, proof of Theorem 1.2.3, p. 96][EMERTON-LGC-2011]; [EMERTON-LGC-2011, §7.4, completion of the proof of Theorem 3.3.22, p. 97][EMERTON-LGC-2011]; [HU-TAN-2015, Proof of Theorem 6.3, p. 35 (arXiv v2)][HU-TAN-2015]; [TUNG-2021-DYADIC, §4.3, Lemmas 4.3.3–4.3.4, pp.20–21][TUNG-2021-DYADIC].) *Needs:* §§8.1–8.3; §9.1; §10.1; SerreWeightAndLevelOptimisation R20.6; the individual auxiliary constructions named above.

**Checks.**

- An unresolved source-independence request prevents certification of an independent Serre proof, while leaving the target-level lifting plan usable conditionally.
- The transfer lemmas use the selected-member hypotheses and polynomial recognition, without a general Serre modularity theorem.

### Examples

A modular A-member at residue characteristic ell supplies algebraic good-prime polynomial identities, not an ell-adic-to-p-adic field isomorphism. Re-embed those algebraic coefficients at p, identify the selected A-member there, lift across the residual congruence to B, and then re-embed the B-polynomial identity separately at every other place. In the Pan and ordinary-three branches the B-member can start this chain without A.

### Dependencies

Layers 7–11; R01.1 finite coefficients, lattices and semisimplification; R01.5 fixed-characteristic Frobenius recognition; R19 representations of normalised newforms. Family existence and any downstream congruence construction are not prerequisites.

## Downstream consumers

ClassicalSerreModularity consumes the four lifting branches and the explicit polynomial-family transfer theorem. PotentialModularityAndCompatibleSystems may supply families to which the last layer applies, but neither its existence theorem nor its compatible-system carrier is used to state or prove that transfer. Hilbert and unitary automorphy arguments may consume the component and typed-support comparisons only after checking their local hypotheses and coefficient conventions. Use inside an independent Serre proof additionally requires the restricted proof-input closure in §12.8; this roadmap does not certify uninspected globalisation proofs by appealing to their final lifting statements.

## References

Page numbers are the author/arXiv page numbers of the linked version unless a published page is explicitly given. Kisin's Fontaine–Mazur DVI uses prepublication numbering: 2.2.9, 2.2.10, 2.2.14, 2.2.16 and 2.2.17 correspond to published 2.2.10, 2.2.11, 2.2.15, 2.2.17 and 2.2.18. The DVI locators below refer to that linked version. Gee–Kisin Appendix B supplies the corrections to the older patching statements; the corrected assertions, not the superseded ones, are used above.

- **KW2-2009.** Chandrashekhar Khare and Jean-Pierre Wintenberger *Serre's modularity conjecture (II)*. Authors' final version (PDF dated 30 May 2009), 98 pages, on Khare's UCLA page; published as Invent. Math. 178 (2009), 505–586. Printed page = PDF page. Its numbering is the published one. [KW2-2009 source](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf).
- **GEE-MLT-2022.** Toby Gee *Modularity lifting theorems*. Essential Number Theory 1 (2022), no. 1, 73–126; arXiv:2202.05818v2, 45 pages. Author pagination is used. [GEE-MLT-2022 source](https://arxiv.org/pdf/2202.05818v2).
- **KW1-2009.** Chandrashekhar Khare and Jean-Pierre Wintenberger *Serre's modularity conjecture (I)*. Authors' version on Khare's UCLA page (23 pages); published as Invent. Math. 178 (2009), 485–504. Printed page = PDF page (the file's own numbering). [KW1-2009 source](https://www.math.ucla.edu/~shekhar/papers/results.pdf).
- **KISIN-2ADIC-2009.** Mark Kisin *Modularity of 2-adic Barsotti–Tate representations*. Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), with prepublication numbering; printed page = DVI page (the preprint's own numbering). Published as Invent. Math. 178 (2009), 587–634. [KISIN-2ADIC-2009 source](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi).
- **KISIN-FFLAT-2009.** Mark Kisin *Moduli of finite flat group schemes, and modularity*. Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), with prepublication numbering; printed page = DVI page (the preprint's own numbering). Published as Ann. of Math. 170 (2009), 1085–1180. [KISIN-FFLAT-2009 source](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi).
- **DIEULEFAIT-PACETTI.** Luis Victor Dieulefait and Ariel Martín Pacetti *A simplified proof of Serre's conjecture*. arXiv:2108.07577v2 (3 May 2022); printed page = PDF page. [DIEULEFAIT-PACETTI source](https://arxiv.org/pdf/2108.07577v2).
- **KISIN-FM-2009.** Mark Kisin *The Fontaine–Mazur conjecture for GL₂*. Author's preprint as a DVI file on Kisin's Harvard page (fmc.dvi), with prepublication numbering; printed page = DVI page. Published as J. Amer. Math. Soc. 22 (2009), no. 3, 641–690. In §2.2 the DVI's (2.2.9), Lemma (2.2.10), Proposition (2.2.14), Corollary (2.2.16) and Theorem (2.2.17) are cited by Gee–Kisin, Hu–Tan and Tung as (2.2.10), (2.2.11), (2.2.15), (2.2.17) and (2.2.18). [KISIN-FM-2009 source](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi).
- **TUNG-2021-P3.** Shen-Ning Tung *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_{Q_p}*. Algebra Number Theory 15 (2021), no. 9, 2173–2194; arXiv:1803.07451v4 (21 March 2021). Author pagination is used. [TUNG-2021-P3 source](https://arxiv.org/pdf/1803.07451v4).
- **HU-TAN-2015.** Yongquan Hu and Fucheng Tan *The Breuil–Mézard conjecture for non-scalar split residual representations*. Ann. Sci. Éc. Norm. Supér. (4) 48 (2015), no. 6, 1383–1421; arXiv:1309.1658v2 (13 November 2014). Author pagination is used. [HU-TAN-2015 source](https://arxiv.org/pdf/1309.1658v2).
- **PASKUNAS-BM-2015.** Vytautas Paškūnas *On the Breuil–Mézard conjecture*. Duke Math. J. 164 (2015), no. 2, 297–359; arXiv:1209.5205v3 (20 March 2014). Author pagination is used. [PASKUNAS-BM-2015 source](https://arxiv.org/pdf/1209.5205v3).
- **EMERTON-LGC-2011.** Matthew Emerton *Local-global compatibility in the p-adic Langlands programme for GL₂/ℚ*. Preprint, draft of 23 March 2011, 119 pages, on Emerton's University of Chicago page; not published in a journal. Printed page = PDF page. [EMERTON-LGC-2011 source](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf).
- **GEE-KISIN-2014.** Toby Gee and Mark Kisin *The Breuil–Mézard conjecture for potentially Barsotti–Tate representations*. Forum Math. Pi 2 (2014), e1; arXiv:1208.3179v5 (12 June 2026). Appendices A–B and Lemma 4.4.1 use author pagination; printed page = PDF page. [GEE-KISIN-2014 source](https://arxiv.org/pdf/1208.3179v5).
- **DIEULEFAIT-PACETTI-PUBLISHED.** Luis Victor Dieulefait and Ariel Martín Pacetti *A simplified proof of Serre's conjecture*. Rev. Real Acad. Cienc. Exactas Fis. Nat. Ser. A-Mat.117 (2023), article153; version of record [DIEULEFAIT-PACETTI-PUBLISHED source](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf).
- **CHT-2008.** Laurent Clozel, Michael Harris and Richard Taylor *Automorphy for some l-adic lifts of automorphic mod l Galois representations*. Publ. Math. Inst. Hautes Études Sci. 108 (2008), 1–181, published version from Numdam. Printed page = PDF page. [CHT-2008 source](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf).
- **BCDT-2001.** Christophe Breuil, Brian Conrad, Fred Diamond and Richard Taylor *On the modularity of elliptic curves over Q: wild 3-adic exercises*. Author copy, 79 pages; JAMS 14 (2001), 843–939. Locators here use author pagination. [BCDT-2001 source](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf).
- **CDT-1999.** Brian Conrad, Fred Diamond and Richard Taylor *Modularity of certain potentially Barsotti–Tate Galois representations*. Author copy, 47 pages; JAMS 12 (1999), 521–567. Locators use author pagination unless explicitly marked published. [CDT-1999 source](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf).
- **KISIN-DURHAM.** Mark Kisin *Modularity for some geometric Galois representations*. Author DVI; in L-functions and Galois representations, Durham 2004 proceedings (2007), pp. 438–470. Author pagination used. [KISIN-DURHAM source](https://people.math.harvard.edu/~kisin/dvifiles/dur.dvi).
- **GEE-TYPES.** Toby Gee *Automorphic lifts of prescribed types*. Author PDF; Math. Ann. 350 (2011), 107–144. This version numbers the weight theorem 4.6.9, not the earlier 4.4.12. [GEE-TYPES source](https://www.ma.imperial.ac.uk/~tsg/Index_files/prescribedlifts.pdf).
- **SKINNER-WILES-1999.** C. M. Skinner and A. J. Wiles *Residually reducible representations and modular forms*. Publ. Math. IHÉS 89 (1999), 5–126; Numdam scan (printed page = PDF page + 3). [SKINNER-WILES-1999 source](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf).
- **PAN-2022.** Lue Pan *The Fontaine–Mazur conjecture in the residually reducible case*. J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2. Locators give arXiv PDF pages. [PAN-2022 source](https://arxiv.org/pdf/1901.07166v2).
- **PASKUNAS-2016.** Vytautas Paškūnas *On 2-dimensional 2-adic Galois representations of local and global fields*. Algebra Number Theory 10 (2016), no. 6, 1301–1358; arXiv:1509.00332v2, dated 25 April 2016 on its first page and version record. Author pagination is used. [PASKUNAS-2016 source](https://arxiv.org/pdf/1509.00332v2).
- **TUNG-2021-DYADIC.** Shen-Ning Tung *On the modularity of 2-adic potentially semi-stable deformation rings*. Math. Z. 298 (2021), 107–159; arXiv:1908.06174v3. Author pagination is used. [TUNG-2021-DYADIC source](https://arxiv.org/pdf/1908.06174v3).
- **CALEGARI-2012.** Frank Calegari *Even Galois representations and the Fontaine–Mazur conjecture II*. arXiv:1012.4819v2; printed pages used [CALEGARI-2012 source](https://arxiv.org/pdf/1012.4819v2).
- **SNOWDEN-2009.** Andrew Snowden *On two dimensional weight two odd representations of totally real fields*. Author preprint wt2-052609.pdf, 26 May 2009; printed pages used [SNOWDEN-2009 source](https://websites.umich.edu/~asnowden/papers/wt2-052609.pdf).
- **BLGG-2013.** Thomas Barnet-Lamb, Toby Gee and David Geraghty *Serre weights for rank two unitary groups*. Author PDF; printed pagination is used [BLGG-2013 source](https://www.ma.imperial.ac.uk/~tsg/Index_files/U2.pdf).
- **CEG-2016.** Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin *Patching and the p-adic local Langlands correspondence*. Author PDF; printed pagination is used [CEG-2016 source](https://www.ma.imperial.ac.uk/~tsg/Index_files/Gpatching.pdf).
- **EMERTON-PASKUNAS-2020.** Matthew Emerton and Vytautas Paškūnas *On the density of supercuspidal points of fixed regular weight in local deformation rings and global Hecke algebras*. arXiv:1809.06598v3 [EMERTON-PASKUNAS-2020 source](https://arxiv.org/pdf/1809.06598v3).
- **BLGG-2012-ORDINARY.** Thomas Barnet-Lamb, Toby Gee and David Geraghty *Congruences between Hilbert modular forms: constructing ordinary lifts*. Author PDF, 48 pages; Lemma 6.1.6 uses author pp. 41–43. [BLGG-2012-ORDINARY source](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf).
- **EMERTON-GEE-2014.** Matthew Emerton and Toby Gee *A geometric perspective on the Breuil–Mezard conjecture*. Author PDF; Appendix A locators use its pp. 32–35. [EMERTON-GEE-2014 source](https://www.math.uchicago.edu/~emerton/pdffiles/refinedbm.pdf).

[KW2-2009]: https://www.math.ucla.edu/~shekhar/papers/proofs.pdf
[GEE-MLT-2022]: https://arxiv.org/pdf/2202.05818v2
[KW1-2009]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[KISIN-2ADIC-2009]: https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi
[KISIN-FFLAT-2009]: https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi
[DIEULEFAIT-PACETTI]: https://arxiv.org/pdf/2108.07577v2
[KISIN-FM-2009]: https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi
[TUNG-2021-P3]: https://arxiv.org/pdf/1803.07451v4
[HU-TAN-2015]: https://arxiv.org/pdf/1309.1658v2
[PASKUNAS-BM-2015]: https://arxiv.org/pdf/1209.5205v3
[EMERTON-LGC-2011]: https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf
[GEE-KISIN-2014]: https://arxiv.org/pdf/1208.3179v5
[DIEULEFAIT-PACETTI-PUBLISHED]: https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf
[CHT-2008]: https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf
[BCDT-2001]: https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf
[CDT-1999]: https://math.stanford.edu/~conrad/papers/cdtmaster.pdf
[KISIN-DURHAM]: https://people.math.harvard.edu/~kisin/dvifiles/dur.dvi
[GEE-TYPES]: https://www.ma.imperial.ac.uk/~tsg/Index_files/prescribedlifts.pdf
[SKINNER-WILES-1999]: https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf
[PAN-2022]: https://arxiv.org/pdf/1901.07166v2
[PASKUNAS-2016]: https://arxiv.org/pdf/1509.00332v2
[TUNG-2021-DYADIC]: https://arxiv.org/pdf/1908.06174v3
[DP-PUBLISHED]: https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf
[CALEGARI-2012]: https://arxiv.org/pdf/1012.4819v2
[SNOWDEN-2009]: https://websites.umich.edu/~asnowden/papers/wt2-052609.pdf
[GEE-PRESCRIBED]: https://www.ma.imperial.ac.uk/~tsg/Index_files/prescribedlifts.pdf
[BLGG-2013]: https://www.ma.imperial.ac.uk/~tsg/Index_files/U2.pdf
[CEG-2016]: https://www.ma.imperial.ac.uk/~tsg/Index_files/Gpatching.pdf
[EMERTON-PASKUNAS-2020]: https://arxiv.org/pdf/1809.06598v3
[BLGG-2012-ORDINARY]: https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf
[EMERTON-GEE-2014]: https://www.math.uchicago.edu/~emerton/pdffiles/refinedbm.pdf
