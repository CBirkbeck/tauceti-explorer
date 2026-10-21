# GL₂ Modularity Lifting, Part II: Minimal Defect-One R = T

This Part II extends the defect-zero GL₂ modularity-lifting roadmap by its minimal defect-one applications. Its new objects are arithmetic specializations: the weight-one Hecke data, dual coherent homology, doubling image, global doubling ideal, vexing coefficient bundles, Jacobian character datum and Bianchi minimal-level package. The balanced predicate, patching theorem, deformation representability, local eigenvalue rings, Katz/Hasse/theta theory, generic Hecke-image algebra and locally symmetric-space topology retain their existing owners.

The stages are in construction order. D1.0–D1.4 handle weight one without vexing primes, D1.5–D1.6 add the corrected coefficient types, D1.7 handles scalar multiplicity with an explicit missing local comparison, and D1.8–D1.10 give the conditional Bianchi theorem. Bianchi Conjecture A is an input on all required auxiliary levels. The planning route for Bianchi uses p≥5 and no principal-type P primes; extensions need Gap O or Gap P respectively. All arithmetic implementation claims are unchecked. Read the companion reader for hypotheses, API contracts, discriminating tests and corrected source locators.

Use CG18, Invent. Math. 211 (2018), 297–433, §§1,3,4.1,4.2,5, and the weight-one projection refinement CG20, Duke Math. J. 169 (2020), Lemma 8.14, pp. 865–866. The 2022 Correction repairs bracket typography; the other mathematical issues recorded here have individual independent-review verdicts in the packet. The supplied extraction route name GL2ModularityLiftingDefectOne is an alias of this issue’s canonical id GL2ModularityLiftingPartII. The nonminimal positive-defect continuation and the GL_n complex-patching continuation import this minimal arithmetic theory; their new targets are outside this roadmap.

## Conventions and scope

O, K, π and k always denote a finite p-adic coefficient DVR, its fraction field, a uniformizer and its residue field; p≥3. Matrices act on columns. Frob is arithmetic Frobenius. An unramified character λ(u) sends arithmetic Frobenius to u. The imported geometric Artin map is the inverse normalization: whenever a diamond is expressed by local reciprocity, specify whether its character is evaluated on the selected eigenline or its inverse. For example Conjecture A writes ρ_v=φ_v ε⊕φ_v⁻¹ and U_v=φ_v(Art_geom(π_v)); consequently U_v=φ_v(Frob_arith)⁻¹ on the corresponding unramified specialization. This is compatible with the selected other eigenline, and is not the identity U_v=φ_v(Frob_arith).

Every weight-one stage retains the ramified-reducible invariant-line normalization. The no-vexing specialization is used only in D1.3–D1.4; D1.6 re-establishes the same doubling proof on type coefficients. At the actual conductor, use the Katz/descent object; a fine Γ₁(r) model is a proof device. Its prime-to-p r-diamond quotient and the harmless oldform comparison can leave one or two copies according to the residual roots. A repeated root is not split into two idempotent factors. Rank statements are made after recovering the conductor module.

Write H_i(X,L)=Hⁱ(X,(Ω¹⊗L∨)_{K/O})∨. Thus H₀ corresponds to coherent H¹ and H₁ to coherent H⁰. Type duality additionally transposes Hecke, inverting diamonds. In the Bianchi stages use group/orbifold homology and fixed cyclotomic determinant. The ordinary/flat distinction is imposed on all Artinian quotients. Conjecture A includes all auxiliary levels and is an explicit hypothesis. Minimal residual modularity means a proper ideal at the prescribed minimal level, including torsion classes.

## Ownership and baseline

This is a complete target-level planning pass: every layer is planned, while all mathematical implementation statuses remain unchecked. No layer is marked closed because supplier contracts and the three gaps remain. The README gives heavy arithmetic carriers and their complete contracts; the compact suggested file contains only real-bodied matrix definitions and milestone statements over carriers present at the pins, as WORKERS.md requires.

Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. The following declarations were read at those pins:

- **tauceti:TauCeti.MonoidAlgebra.augmentation** — For a ring R and monoid K, the coefficient-sum ring homomorphism R[K]→+*R; each basis element [g] maps to 1. Used for the arithmetic diamond augmentation. Source module: `TauCeti/Algebra/MonoidAlgebra/Exactness.lean`.
- **mathlib:groupHomology.indIso** — For a subgroup S≤G and a k-representation A of S, the categorical isomorphism H_n(G,ind_S^G A)≅H_n(S,A). Used only for the group-homology form of the arithmetic cover, not geometric vanishing. Source module: `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean`.
- **mathlib:Matrix.charpoly** — The characteristic polynomial det(XI−M) for a finite square matrix over a commutative ring. The suggested file specializes it to the two oldform matrices. Source module: `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`.
- **mathlib:Matrix.aeval_self_charpoly** — Cayley–Hamilton for finite square matrices over a commutative ring; supplies the quadratic endomorphism relation after the arithmetic matrix computation. Source module: `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`.
- **mathlib:Matrix.det_fin_two** — The determinant formula A₀₀A₁₁−A₀₁A₁₀ for Fin 2 matrices; used for the degeneracy pairing. Source module: `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`.

The reviewed library audit and the current upstream audit are recorded in the packet. Current Chebotarev and ProfiniteArithmetic readers, ClassFieldTheory Layers 7 and 12, LocalGaloisGroups, ModularForms, ModularCurves, IntegralHeckeAndGaloisDeterminants and the newer nine-roadmap Suggested files were checked before assigning ownership. A search hit on geometric Bianchi identities does not supply arithmetic Bianchi cohomology.

Exact imported blueprint nodes:

- **DeformationAndDerivedPatchingAlgebra:R03.5/balanced-modules** — Exact finite presentation-defect definition d_S(M)=dim Tor₀−dim Tor₁ and its balanced presentation equivalence.
- **DeformationAndDerivedPatchingAlgebra:R03.5/balanced-module-patching-theorem** — Defect-one balanced patching with S_a=O[(Z/p^a)^q], q≥1, A∞ of relative dimension q−1, compatible images and augmentation, no O-flatness of H.
- **AlgebraicModularFormsAndSerreWeights:R15.3/twisted-serre-duality-hecke** — Twisted coherent Serre duality with the x^{1−n} Hecke scalar, cusp ideal and inverse diamonds.
- **SerreWeightAndLevelOptimisation:R20.3/minimal-weight-one-ideal** — Actual minimal Katz weight-one witness for a residual representation unramified at p, not a generic Serre-weight label.
- **GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type** — CDT finite type lattice with the regular-character normalization; the exact minimal selector is also requested from its stage.
- **LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue** — Chosen ordinary Frobenius eigenvalue local deformation ring in the scalar residual case.
- **LocalGaloisDeformationRings:L7/eigenvalue-ring-normal-cm-type-three** — Normal O-flat eigenvalue ring of relative dimension four, Cohen–Macaulay type three.
- **LocalGaloisDeformationRings:L8/doubling-equals-unramified** — The local doubling-annihilator ideal equals the unramified quotient ideal; actual owner is L8, not the extraction’s older L7 route.
- **SerreWeightAndLevelOptimisation:R20.3/gross-ordinary-tate-sequence** — Connected/étale ordinary Tate sequence: the connected Tate module is T-free rank one and the étale Tate module is its Z_p-dual; no assertion that the whole Tate module is T-free rank two.
- **SerreWeightAndLevelOptimisation:R20.3/weight-one-forms-unramified-at-p** — The field-valued Katz weight-one representation is unramified at p>2 with the T_p/diamond arithmetic-Frobenius polynomial, including repeated roots. This supplies the residual ordinary-root calculation, not the new torsion-Hecke-valued result.

## Layer overview

| Layer | Targets | Planets | Coverage |
|---|---:|---:|---|
| D1.0 — Weight-one levels and coherent homology | 5 | 4 | planned |
| D1.1 — Degeneracy, descent and balancedness | 5 | 3 | planned |
| D1.2 — Hasse doubling and ordinary projections | 5 | 4 | planned |
| D1.3 — Unramified Galois representations in weight one | 5 | 5 | planned |
| D1.4 — Minimal weight-one R = T | 5 | 3 | planned |
| D1.5 — Vexing-prime coefficient bundles | 6 | 5 | planned |
| D1.6 — Weight-one R = T with vexing primes | 5 | 3 | planned |
| D1.7 — Scalar Frobenius and Jacobian multiplicity | 5 | 4 | planned |
| D1.8 — Bianchi deformation and Hecke data | 5 | 4 | planned |
| D1.9 — Bianchi homology and balancedness | 4 | 4 | planned |
| D1.10 — Conditional Bianchi R = T and lifting | 6 | 3 | planned |

## D1.0 — Weight-one levels and coherent homology

Fix p≥3, coefficient DVR O and an odd absolutely irreducible residual representation unramified at p. Specialize the existing fine modular curves, Hodge bundle and Hecke images to conductor level and Taylor–Wiles covers, with a harmless rigidifying prime. Define the arithmetic Hecke data and dual coherent homology; prove non-Eisenstein boundary vanishing and the correctly twisted weight-one duality. Finite O-modules and Hecke algebras may have O-torsion.

**Dependencies:** `AlgebraicModularFormsAndSerreWeights:R15.1`, `GlobalGaloisDeformations:R04.5`, `LocalGaloisDeformationRings:R08.2`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `SerreWeightAndLevelOptimisation:R20.3`, `AlgebraicModularFormsAndSerreWeights:R15.3`.

### Weight-one level data

**Declaration:** `GL2ModularityLiftingPartII:D1.0/weight-one-level-data` (definition).

For p≥3, O the integers of a finite extension K/Q_p, uniformizer π and residue field k, fix odd absolutely irreducible continuous barρ:G_Q→GL₂(k), unramified at p, with prime-to-p Artin conductor N. A level datum consists of the conductor-level Katz/descent object X, a fixed auxiliary prime r≥5 away from Np with r≢1 mod p and residual Frobenius eigenvalue ratio different from r and r⁻¹, a finite set Q disjoint from Npr, chosen distinct residual roots α_x,β_x for x∈Q, and a p-power quotient Δ of ∏_{x∈Q}(Z/xZ)×. Write X₀(Q), X₁(Q), X_Δ(Q) for the corresponding imported curves over O. The prime r is removed only by the selected-oldform comparison; it is not a Taylor–Wiles variable. At each ramified x with barρ|D_x reducible require barρ^{I_x}≠0, the standing hypothesis of §3.1. At conductor level quotient Γ₁(N) by the p-primary diamond subgroup H_N; use its genuine Katz/descent object, not a coarse Hodge line without descent. The fine rigidified model has extra Γ₁(r) level, denoted X^(r). Statements at conductor level mean the module recovered from this model by the harmless-prime comparison (one or two old copies); the fine model and the conductor object are not identified.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Import the fine moduli and smooth compactification, Hodge bundle ω and reduced cusp divisor C from R15.1.
2. Apply Chebotarev through R04.5 to the full residual representation together with the cyclotomic character to choose r. Unramifiedness of barρ at p supplies the required disjointness.
3. Specialize the standard level functors and p-power diamond quotient; keep Q empty and Δ=1 valid.
4. Use the R15.1 representability/descent contract and the D1.1 harmless-prime comparison to transport conclusions to conductor level. A repeated auxiliary root gives two old copies; divide the defect inequality by two, rather than calling this a one-copy selected factor.

**Direct inputs:** `AlgebraicModularFormsAndSerreWeights:R15.1`, `GlobalGaloisDeformations:R04.5`, `LocalGaloisDeformationRings:R08.2`.

**Source:** cg18, §3.1, pp. 310–312; §3.2.1, pp. 312–314; Remark 3.10, pp. 325–326. These levels isolate minimal weight-one lifts and make the auxiliary-level geometry representable.

**Uses:**

- D1.1 degeneracy and D1.4 patching: Supply the fine curves and their diamond covers; distinguish r from the number of patching variables.

**API:**

- `WeightOneLevelData.curves` (data): Return the conductor Katz/descent object X and its level variants, separately from the fine rigidified curves X^(r), X₀^(r)(Q), X₁^(r)(Q), X_Δ^(r)(Q), with finite maps, ω and C on the fine models.
- `WeightOneLevelData.deck` (characterisation): On the fine models, X_Δ^(r)(Q)→X₀^(r)(Q) has deck group Δ; specify the induced descent module at conductor level and retain any cusp stabilizers.
- `WeightOneLevelData.change` (functoriality): For Q⊂Q′ and compatible Δ′→Δ, identify level-forgetting maps and the Hodge pullback on the fine models, compatibly with conductor descent.
- `WeightOneLevelData.rigidification` (compatibility): Compare two admissible fine rigidifications through a common refinement; the descended conductor module and its away-r Hecke action are independent of the proof model, with the stated one- or two-copy multiplicity.

**Unit tests:**

- **emptyAuxiliary** (degenerate): Q=∅ and Δ=1 recover the conductor Katz/descent object; its fine proof model still has the separate rigidifying r-level.
- **smallCoarseLevel** (non-example): The coarse level-one curve at p=3 is not accepted as fine Hodge data without rigidification/descent.
- **auxiliaryRatio** (non-example): If barρ(Frob_r) has eigenvalue ratio r, reject r even when r∤Np.

**Check:**

- Q=∅ and Δ=1 recover the conductor Katz/descent object; its fine proof model still has the separate rigidifying r-level.
- The coarse level-one curve at p=3 is not accepted as fine Hodge data without rigidification/descent.
- If barρ(Frob_r) has eigenvalue ratio r, reject r even when r∤Np.

**Planet:** Weight-one level data.


### Weight-one arithmetic Hecke data

**Declaration:** `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-data` (definition).

On H⁰(X₁(Q),(ωⁿ)_{K/O}) and its finite π^m-torsion use normalized operators with q-expansion a_j(T_x f)=a_{xj}(f)+x^{n−1}⟨x⟩a_{j/x}(f) for x∤NprQ. The arithmetic Hecke datum is the image of the polynomial algebra on these T_x, the diamonds, and U_x for x∈Q; its anaemic image omits U_x. At weight one let m_∅ be the residual ideal supplied by the minimal Katz eigenform and m_Q add U_x−α_x. Take finite π^m images and then the inverse limit. The resulting local images are finite O-algebras; flatness is not imposed.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Use the existing image/local-factor construction IHG.2 rather than a new generic Hecke-algebra carrier.
2. The conductor-level Katz witness makes m_∅ proper. Prescribe roots only after adjoining U_x.
3. Compare the torsion images with the action on the Pontryagin-dual finite module; transition maps preserve the chosen local factor.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/weight-one-level-data`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `SerreWeightAndLevelOptimisation:R20.3/minimal-weight-one-ideal`.

**Source:** cg18, §3.2.3–3.2.4, pp. 315–317, 321; §3.3, pp. 326–327. The images and residual ideals used in the weight-one proof differ from full classical Hecke algebras at p.

**Uses:**

- Theorem 3.11, pp. 326–338: The representation and T_p descent are proved over this particular image.
- D1.4 and D1.6: These local factors are the patching module actions.

**API:**

- `WeightOneHeckeData.image` (characterisation): The algebra is the image of exactly the displayed away-level operators, diamonds and selected U_x.
- `WeightOneHeckeData.residual` (projection): The residue map sends T_x to tr barρ(Frob_x), diamonds to det barρ, and U_x to α_x.
- `WeightOneHeckeData.reduce` (compatibility): Reduction and change of coefficient quotient commute with the represented action, using image-to-image surjections rather than flat base change.
- `WeightOneHeckeData.lift` (universal-property): A map from the displayed abstract operator algebra into B factors uniquely through the represented image exactly when it kills the kernel of its action on the specified module; maps out of the image agree if they agree on the displayed generators.

**Unit tests:**

- **torsionHecke** (non-example): The image acting on a nonzero O/π module may be killed by π; no O-flat instance follows.
- **emptyQ** (comparison): At Q=∅ the anaemic and full auxiliary images agree; neither automatically contains T_p.
- **rootChoice** (value): For residual U-polynomial (X−1)(X−2) over F₅ the ideals U−1 and U−2 select different factors.

**Check:**

- The image acting on a nonzero O/π module may be killed by π; no O-flat instance follows.
- At Q=∅ the anaemic and full auxiliary images agree; neither automatically contains T_p.
- For residual U-polynomial (X−1)(X−2) over F₅ the ideals U−1 and U−2 select different factors.

**Planet:** Weight-one Hecke algebra.


### Non-Eisenstein coherent boundary vanishing

**Declaration:** `GL2ModularityLiftingPartII:D1.0/coherent-boundary-vanishing` (theorem).

For the weight-n fine curves above, every simultaneous Hecke eigensystem on cusp-supported sections has away-level trace ψ₁(x)+x^{n−1}ψ₂(x), for finite-order characters ψ₁,ψ₂ with the prescribed diamond product. Consequently its associated semisimple two-dimensional representation is reducible, so all cusp-supported cohomology vanishes at an absolutely irreducible residual ideal. Thus Hⁱ(ωⁿ(−C))_m→Hⁱ(ωⁿ)_m is an isomorphism for i=0,1 over O, O/π^m and K/O.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Decompose cusps by their local double-coset types; diamonds need not act transitively on the entire boundary.
2. Compute each unramified T_x as a sum of two commuting multiplicative cusp translations, including the x^{n−1} factor.
3. Apply residual absolute irreducibility and the long exact sequence for the cusp divisor.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-data`, `AlgebraicModularFormsAndSerreWeights:R15.2`.

**Source:** cg18, Remark 3.4, p. 316; Lemma 3.7(2), pp. 321–322. The boundary is Eisenstein; its proof requires the reducible two-character argument rather than transitivity on all cusps.

**Check:**

- Test the cusp fibre above 0 as well as the fibre above infinity: both must be reducible, even when their ordered characters differ.

**Planet:** Coherent boundary vanishing.


### Dual coherent homology

**Declaration:** `GL2ModularityLiftingPartII:D1.0/dual-coherent-homology` (definition).

For a finite locally free sheaf L on a smooth proper relative curve X/O put H_i(X,L)=Hom_O(Hⁱ(X,(Ω¹_{X/O}⊗L^∨)_{K/O}),K/O), with its compact O-module topology and transpose Hecke action. Serre duality identifies it with H^{1−i}(X,L), including torsion. Define pullback/trace maps by transposing the corresponding cohomological adjoints, not by an unexplained identification with sections.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Specialize the existing coherent duality to the divisible coefficient sequence K/O.
2. Track contravariance of both the sheaf dual and Pontryagin dual in finite level maps.
3. Use cohomological dimension one to identify degrees and preserve torsion.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/weight-one-level-data`, `AlgebraicModularFormsAndSerreWeights:R15.3/twisted-serre-duality-hecke`.

**Source:** cg18, §3.2.4, p. 322; §3.9.2, pp. 351–352. This homological convention is the finite module patched in degree zero.

**Uses:**

- Proposition 3.8 and Theorem 3.26: The degree-zero finite module and degree-one O-torsion-freeness enter balancedness.

**API:**

- `CoherentHomology.duality` (equivalence): H_i(X,L)≅H^{1−i}(X,L), for i=0,1, naturally in L with the specified adjoint convention.
- `CoherentHomology.trace` (functoriality): The homological map attached to a finite cover is dual to its cohomological pullback on Ω¹⊗L^∨.
- `CoherentHomology.hecke` (compatibility): The action of a correspondence is the transpose of its adjoint, including its degree and diamond normalization.
- `CoherentHomology.coefficients` (functoriality): A map of coefficient sheaves gives the corresponding covariant homology map by double contravariance. For an exact finite-coefficient sequence retain the derived long exact sequence; do not assert arbitrary tensor base change for torsion homology.

**Unit tests:**

- **degreeReversal** (comparison): For L=ω, H₀ is coherent H¹ and H₁ is coherent H⁰; swapping them is rejected.
- **torsionDetected** (non-example): A π-torsion class in coherent H¹ remains visible in H₀; tensoring with K before dualizing loses it.
- **identityCover** (degenerate): The degree-one identity correspondence induces the identity on both degrees.

**Check:**

- For L=ω, H₀ is coherent H¹ and H₁ is coherent H⁰; swapping them is rejected.
- A π-torsion class in coherent H¹ remains visible in H₀; tensoring with K before dualizing loses it.
- The degree-one identity correspondence induces the identity on both degrees.

**Planet:** Dual coherent homology.


### Weight-one Hecke duality

**Declaration:** `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-duality` (comparison).

After adjoining ζ_{NQ}, apply the imported W_{ζ}-twisted Serre duality Ψ:H⁰(X,ωⁿ)≅H₁(X,ωⁿ) with ΨT_x=x^{1−n}T_xΨ in that convention and the compatible diamond action. At n=1, use boundary vanishing to obtain an O-linear Hecke-equivariant isomorphism H₀(X,ω)_m≅H¹(X,ω)_m and equality of the generic ranks of H₀ and H₁. Untwisted type coefficients require the contragredient convention of D1.6.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Use the exact R15.3 twisted-duality statement, not bare Serre duality as a Hecke-linear map.
2. At weight one the scalar x^{1−n} is one; eliminate the cusp twist only after localization.
3. Descend the rank equality from a finite coefficient extension.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/dual-coherent-homology`, `GL2ModularityLiftingPartII:D1.0/coherent-boundary-vanishing`, `AlgebraicModularFormsAndSerreWeights:R15.3/twisted-serre-duality-hecke`.

**Source:** cg18, §3.2.4, pp. 322–323; §3.8, p. 340. The special weight-one normalization gives the self-duality needed for balancedness and for the final coherent statement.

**Check:**

- At n=1 the good-prime Hecke scalar is one; at n>1 retain x^{1−n} and do not infer an untwisted Hecke-linear map.


**Work needed to close this layer:** Discharge the exact small-level Katz/descent and twisted-duality supplier contracts.

## D1.1 — Degeneracy, descent and balancedness

Construct the normalized oldform maps and their pairing matrix. Prove the selected-root comparison at Taylor–Wiles primes and the distinct/equal-root multiplicities at harmless primes. Specialize Hochschild–Serre to coherent diamond covers and prove balancedness over O[Δ], importing the generic balanced-module and patching algebra.

**Dependencies:** `GL2ModularityLiftingPartII:D1.0`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `AlgebraicModularFormsAndSerreWeights:R15.1`.

### Normalized weight-one degeneracy maps

**Declaration:** `GL2ModularityLiftingPartII:D1.1/oldform-degeneracy` (construction).

For a base level L prime to p and x∤Lp, work on an imported fine model (or its genuine Katz/descent object) X and the degeneracy maps π₁,π₂:X₀(x)→X. Put V_x=φ₁₂π₂*, ψ(f,g)=π₁*f+V_xg and ψ^∨=(trπ₁,trπ₁W_x)/x. In column coordinates on the source, ψ^∨ψ=[[x⁻¹(x+1),T_x],[T_x,(x+1)⟨x⟩]], and U_x acts as [[T_x,x⟨x⟩],[−x⁻¹,0]]. These are identities of the imported geometric correspondences on weight-one sections.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Allow x=r when removing the rigidifying prime: in that application the base is level N, not level Nr. Make the correspondence calculation on a common fine refinement and descend it through R15.1.
2. Define pullback using the universal isogeny and trace using the finite map; normalize both maps consistently.
3. Compute U_xπ₁*=π₁*T_x−x⁻¹V_x and U_xV_x=x⟨x⟩π₁*.
4. Prove π₁*trπ₁W_x=xU_x+W_x directly by summing the cyclic subgroups in the moduli correspondence. No cancellation of a possibly noninjective π₁* is used.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-data`, `GL2ModularityLiftingPartII:D1.0/dual-coherent-homology`, `mathlib:Matrix.det_fin_two`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `AlgebraicModularFormsAndSerreWeights:R15.1`.

**Source:** cg18, Lemma 3.5, pp. 318–320; Lemma 3.6, p. 321. The two oldform coordinates and their trace pairing control the absence of localized newforms.

**Uses:**

- Lemmas 3.5–3.6: The pairing and W_x identity eliminate the complement of the selected oldforms.

**API:**

- `Oldform.psi` (constructor): Return ψ with its ordered coordinates (π₁*,V_x).
- `Oldform.pairingMatrix` (characterisation): The trace pairing in these coordinates is exactly the displayed 2×2 matrix.
- `Oldform.upMatrix` (compatibility): U_x intertwines ψ with the displayed column matrix; its characteristic polynomial is X²−T_xX+⟨x⟩.
- `Oldform.characterisation` (extensionality): The linear degeneracy map is determined by its two columns π₁* and V_x; coefficient maps preserve both columns and their trace adjoints, with x retained as a unit.

**Unit tests:**

- **unitNorm** (value): For x=1 in the coefficient ring, the U-matrix is [[T,d],[−1,0]], whose determinant is d.
- **asymmetricCoordinates** (value): For x=2,T=0,d=3 over Q the upper-right entry is 6 and lower-left −1/2, excluding the transposed formula.
- **pairingDegenerate** (non-example): If α=xβ, the specialized pairing determinant is zero; the construction alone does not assert ψ invertible.

**Check:**

- For x=1 in the coefficient ring, the U-matrix is [[T,d],[−1,0]], whose determinant is d.
- For x=2,T=0,d=3 over Q the upper-right entry is 6 and lower-left −1/2, excluding the transposed formula.
- If α=xβ, the specialized pairing determinant is zero; the construction alone does not assert ψ invertible.

**Planet:** Oldform degeneracy maps.


### Selected-root oldform comparison

**Declaration:** `GL2ModularityLiftingPartII:D1.1/selected-root-oldform-comparison` (theorem).

Suppose x≡1 mod p and barρ(Frob_x) has distinct eigenvalues α,β. Localizing at the ideal extending m_∅ with U_x−α gives H⁰(X,(ω)_{K/O})_{m_∅}≅H⁰(X₀(x),(ω)_{K/O})_m. Iteration gives the same result for Q. The localized anaemic Hecke image surjects onto the selected U-image. The full oldspace before selecting α has two copies, not one.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. The pairing determinant reduces to −(α−β)², a unit, so ψ splits off the two-copy oldspace.
2. Use the correspondence identity for W_x to show a nonzero complementary localized quotient would force a forbidden Frobenius ratio.
3. Select one Hensel root of U_x; compare finite π^m-torsion lengths before passing to K/O.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.1/oldform-degeneracy`, `GL2ModularityLiftingPartII:D1.0/coherent-boundary-vanishing`.

**Source:** cg18, Lemma 3.5, pp. 317–320. At Taylor–Wiles primes only the chosen oldform factor survives.

**Check:**

- For residual roots 1 and 2 over F₅ with x≡1, selecting U_x−1 yields one copy, while the unselected oldspace has two.

**Planet:** Selected-root level comparison.


### Harmless-prime oldform multiplicity

**Declaration:** `GL2ModularityLiftingPartII:D1.1/harmless-prime-comparison` (theorem).

Let x∤Lp for the base level L, with residual Frobenius eigenvalues α,β satisfying α/β∉{x,x⁻¹}. As modules for the away-x Hecke algebra, the U_x=α local factor at level X₀(x) is one copy of the base weight-one module if α≠β and two copies if α=β. The repeated-root factor need not have scalar U_x action and is not a pair of idempotent factors. To remove r from a fine Γ₁(r) model of conductor N, take L=N and x=r, first taking invariants under the full r-diamond group (of order r−1, a unit in O) to reach Γ₀(r). The conductor object and its comparison are supplied by genuine small-level descent.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. The determinant is x⁻¹(α−xβ)(β−xα), hence invertible under the stated ratio condition.
2. Eliminate the complement using W_x and the same forbidden-ratio argument.
3. Separate the two residual roots only when their difference is invertible.
4. For x=r use exact prime-to-p diamond invariants and the R15.1 common-fine-refinement descent; the hypothesis x∤Lp now permits the required comparison.
5. If the repeated-root comparison gives two old copies, transport balancedness by additivity of d_S under direct sums and divide the resulting inequality by two. Rank and freeness conclusions concern the conductor module; the auxiliary U_r is omitted from that comparison algebra.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.1/oldform-degeneracy`, `AlgebraicModularFormsAndSerreWeights:R15.1`.

**Source:** cg18, Lemma 3.6, pp. 320–321. The auxiliary fine-level prime can be introduced and removed without changing the intended localized system.

**Check:**

- Allow a repeated residual root at a harmless x≢1 and recover two old copies in its single local factor.


### Coherent diamond-cover descent

**Declaration:** `GL2ModularityLiftingPartII:D1.1/coherent-cover-descent` (theorem).

For S=O[Δ] and M=H₀(X_Δ(Q),ω)_m the homological Hochschild–Serre spectral sequence is Tor_i^S(H_j(X_Δ(Q),ω)_m,O)⇒H_{i+j}(X₀(Q),ω)_m. In particular M_Δ≅H₀(X₀(Q),ω)_m, and H₁(X_Δ(Q),ω)_{m,Δ}→H₁(X₀(Q),ω)_m→Tor₁^S(M,O)→0 is exact. The maps commute with away-level Hecke and the chosen U_x.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Use R15.1 coherent descent for the actual compactified finite étale diamond cover and Hodge sheaf, with its equivariant cohomology action and compatible degeneracy correspondences. This is a coherent Cartan–Leray statement on modular curves, not a specialization of topological local-system homology.
2. Dualize the first-quadrant cohomological descent sequence with exact Pontryagin duality.
3. Extract total degrees zero and one; do not replace the displayed right-exact segment by a short exact sequence.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/dual-coherent-homology`, `GL2ModularityLiftingPartII:D1.1/oldform-degeneracy`, `AlgebraicModularFormsAndSerreWeights:R15.1`.

**Source:** cg18, Proof of Proposition 3.8, pp. 323–324. The low-degree Tor term measures the presentation defect of the patched coherent module.

**Check:**

- The low-degree segment ends in Tor₁→0; do not assert injectivity at its left endpoint. At Δ=1 the Tor term vanishes.


### Balanced coherent homology

**Declaration:** `GL2ModularityLiftingPartII:D1.1/coherent-balancedness` (theorem).

For the preceding M, d_S(M)=dim_k Tor₀^S(M,k)−dim_k Tor₁^S(M,k)≥0. Equivalently the imported balanced predicate holds. After using M_Δ and O-base change, d_S(M)=rank_O M_Δ−dim_k(Tor₁^S(M,O)/π); this formula and nonnegativity hold even when M has π-torsion.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. H₁(X₀(Q),ω)_m is O-torsion-free: dualize divisibility of H¹((Ω¹⊗ω⁻¹)_{K/O}), which follows from H²=0 on a curve.
2. Use the right-exact low-degree sequence to bound the k-dimension of Tor₁/π by rank H₁ at base level.
3. Apply the weight-one generic rank equality and the imported defect/base-change formula.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.1/coherent-cover-descent`, `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-duality`, `DeformationAndDerivedPatchingAlgebra:R03.5/balanced-modules`.

**Source:** cg18, Proposition 3.8, pp. 323–325. The coherent cohomology module satisfies precisely the square-presentation condition required by defect-one patching.

**Check:**

- A module killed by π is allowed: cancel its equal minimal-generator and O-torsion contributions before applying the Tor₁ bound.

**Planet:** Balanced coherent homology.


**Work needed to close this layer:** Discharge the coherent finite-cover specialization and normalized correspondence contracts.

## D1.2 — Hasse doubling and ordinary projections

For each finite coefficient quotient, embed two copies of weight one into sufficiently high weight with the Hasse invariant. Prove injectivity, the corrected column formula for U_p and the two ordinary-factor injections of CG20 Lemma 8.14. Construct the actual ordinary Hecke image, retaining its kernel, and prove the rank-two quadratic doubling statement in the repeated-root factor.

**Dependencies:** `GL2ModularityLiftingPartII:D1.0`, `AlgebraicModularFormsAndSerreWeights:R15.3`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `SerreWeightAndLevelOptimisation:R20.3`, `AutomorphicGaloisRepresentations:R19.5`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `AutomorphicGaloisRepresentations:R19.6`.

### Hasse doubling map

**Declaration:** `GL2ModularityLiftingPartII:D1.2/hasse-doubling-map` (construction).

Fix m≥1. Choose n>1 sufficiently large, n≡1 modulo (p−1)p^{m−1}, and a high-weight Hasse lift A with q-expansion 1 modulo π^m, after increasing the exponent as required by O/Q_p. Let M=H⁰(X₁(Q),ω_{O/π^m})_{m_Q} and φ(f)=Af in weight n. Define ψ:M⊕M→H⁰(X₁(Q),ωⁿ_{O/π^m}) by ψ(f,g)=φ(f)+(φT_p−U_pφ)(g). The second summand has q-expansion ⟨p⟩V_p(g), where V_p sends ∑a_jq^j to ∑a_jq^{pj}. No factor π or p is divided out.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Use the imported Hasse form and powers to arrange both q-expansion congruence and ε^{n−1}≡1 modulo π^m.
2. Define φ and the second map using coefficient Hecke formulas; keep the ordered coordinates (φ,φT_p−U_pφ).
3. Check the construction at all relevant cusps and its compatibility with away-p Hecke and diamonds.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-data`, `AlgebraicModularFormsAndSerreWeights:R15.3`, `AlgebraicModularFormsAndSerreWeights:R15.2`.

**Source:** cg18, Proof of Theorem 3.11, pp. 327–328. The high-weight space contains a doubled weight-one module with a controlled U_p action.

**Uses:**

- D1.3 Theorem 3.11: The doubled image receives the ordinary Galois representations used to remove ramification at p.

**API:**

- `HasseDoubling.first` (constructor): The first column is multiplication by A and commutes with away-p Hecke modulo π^m.
- `HasseDoubling.secondQExpansion` (characterisation): At the chosen cusp the second column is ⟨p⟩∑a_jq^{pj}; the same geometric formula holds at each cusp.
- `HasseDoubling.coefficients` (compatibility): Changing the coefficient quotient commutes with ψ after using compatible powers of A; changing A does not change the q-expansion-defined map modulo π^m.
- `HasseDoubling.characterisation` (extensionality): The q-expansion principle at all cusps characterizes the two columns, including the diamond on the q↦q^p column. Equality of their expansions gives equality of the finite-coefficient maps.

**Unit tests:**

- **secondColumn** (value): For a₁(g)=1 and p∤j, the second column has coefficient 0 at q^j and coefficient ⟨p⟩ at q^p.
- **noDivision** (non-example): The map is defined over O/π even when p=0 there; an expression requiring 1/p is rejected.
- **firstColumn** (comparison): At m=1 the first column agrees with the imported Hasse multiplication map on weight-one forms.

**Check:**

- For a₁(g)=1 and p∤j, the second column has coefficient 0 at q^j and coefficient ⟨p⟩ at q^p.
- The map is defined over O/π even when p=0 there; an expression requiring 1/p is rejected.
- At m=1 the first column agrees with the imported Hasse multiplication map on weight-one forms.

**Planet:** Hasse doubling.


### Injectivity of Hasse doubling

**Declaration:** `GL2ModularityLiftingPartII:D1.2/doubling-injective` (theorem).

The map ψ above is injective for every m≥1. In the chosen column basis U_pψ=ψ·[[T_p,⟨p⟩],[−1,0]], so on im ψ one has U_p²−T_pU_p+⟨p⟩=0 and U_p+⟨p⟩U_p⁻¹=T_p acting diagonally. These formulas use the matrix with upper-right ⟨p⟩ and lower-left −1. If α,β are the residual arithmetic-Frobenius roots of barρ at p, then ⟨p⟩≡αβ and (U_p−α̃)(U_p−β̃) acts nilpotently on the localized doubled image. Since its determinant is the unit diamond, only α,β occur there; zero is excluded.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. In characteristic p, a relation between the two columns makes θ of the first weight-one form vanish. The weight-one theta-kernel theorem forces that form to vanish, then q-expansion forces the other to vanish.
2. For O/π^m, any nonzero kernel has nonzero π-socle; apply the characteristic-p argument.
3. Compute U_p on each column directly. The lower-left −1 and the upper-right diamond are fixed by those two computations.
4. Import the field-valued Katz unramifiedness/Frobenius-polynomial theorem from R20.3 to identify residual T_p and the ordinary roots. The quadratic relation and the Artinian coefficient algebra give nilpotence of the lifted residual polynomial; its constant term is a unit, so the doubled image is ordinary. This field-valued input is distinct from the new torsion-Hecke-valued theorem of D1.3.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.2/hasse-doubling-map`, `mathlib:Matrix.charpoly`, `mathlib:Matrix.aeval_self_charpoly`, `SerreWeightAndLevelOptimisation:R20.3/weight-one-forms-unramified-at-p`, `AutomorphicGaloisRepresentations:R19.5`.

**Source:** cg18, Proof of Theorem 3.11, p. 328. The injective doubling and its U_p polynomial are the common input to all three local cases.

**Check:**

- The matrix has upper-right diamond and lower-left −1; checking a diamond value different from −1 must distinguish it from the printed swap.

**Planet:** Injective weight-one doubling.


### Two ordinary projections are injective

**Declaration:** `GL2ModularityLiftingPartII:D1.2/ordinary-projection-injective` (theorem).

In characteristic p, suppose the weight-one Frobenius polynomial X²−T_pX+⟨p⟩ has distinct nonzero residual roots α,β. In the special case n=p (multiplication by the Hasse invariant), let e_α and e_β be the high-weight ordinary projectors. Each map e_αφ:M→e_αH⁰(X,ω^p) and e_βφ:M→e_βH⁰(X,ω^p) is injective after localizing the prescribed away-p system. For higher finite coefficient quotients with distinct residual roots, the same injections follow from π-socles and compatible Hasse powers.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Decompose the doubled module using the two Hensel roots of its U_p polynomial.
2. If one projection of φ(f) vanishes, use the other root relation to get a weight-one q-expansion supported on p-divisible exponents.
3. Apply theta-kernel vanishing in weight one, then the π-socle argument for finite quotients.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.2/hasse-doubling-map`, `GL2ModularityLiftingPartII:D1.2/doubling-injective`, `AlgebraicModularFormsAndSerreWeights:R15.3`, `AutomorphicGaloisRepresentations:R19.5`.

**Source:** cg20, Lemma 8.14 and proof, pp. 865–866; compare CG18 §3.5, p. 331. The later paper isolates the two separate injections, not merely the injectivity of their direct sum.

**Check:**

- For each of two distinct roots require injection of that individual projector, rather than injection only into their sum.

**Planet:** Two ordinary-factor injections.


### Ordinary high-weight image algebras

**Declaration:** `GL2ModularityLiftingPartII:D1.2/ordinary-image-algebras` (definition).

For a sufficiently large n as above, let T_n be the localized high-weight Hecke image generated by good-prime T_x, diamonds and the chosen Q-level U_x, omitting U_p. Thus it is p-anaemic; the smaller good-prime-only image is kept distinct. Let T̃_{n,α} be the ordinary factor after adjoining U_p and selecting α. Define A_n=im(T_n→T̃_{n,α}) and write T̃_n=T̃_{n,α}. The injected finite weight-one Hasse subquotient induces a quotient map from A_n to its p-anaemic image A. Do not identify A_n with T_n without a kernel calculation. The weight-one operator T_p exists on the forms but is not assumed to belong to A; initially write B=A[T_p] as an endomorphism algebra.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Import ordinary idempotents and Hecke-valued high-weight representations, then restrict the action to the selected factor.
2. Form A_n as an algebra image; localizing the p-factor can kill other ordinary or nonordinary factors.
3. Use the injected Hasse subquotient to identify its anaemic quotient and its compatible Galois trace functions.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.2/hasse-doubling-map`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `AutomorphicGaloisRepresentations:R19.5`, `AutomorphicGaloisRepresentations:R19.6`, `GL2ModularityLiftingPartII:D1.2/doubling-injective`, `GL2ModularityLiftingPartII:D1.2/ordinary-projection-injective`.

**Source:** cg18, §§3.4–3.6, pp. 329–333. The image algebra is the base of the ordinary quadratic extension and of the subsequent unramified quotient.

**Uses:**

- Lemmas 3.16 and 3.24: The extension and local comparison are over the image A_n, so quotient maps must retain their kernels.

**API:**

- `OrdinaryImage.factor` (projection): T_n maps to the selected T̃_n and A_n is its range, with a canonical surjection T_n↠A_n.
- `OrdinaryImage.weightOneQuotient` (projection): The p-anaemic action A on the injected finite weight-one Hasse subquotient is a quotient of A_n, retaining the chosen Q-level U_x and diamonds but not assuming T_p∈A.
- `OrdinaryImage.galois` (compatibility): The high-weight Galois representation over A_n specializes to all trace-compatible finite quotients, including nonreduced ones.
- `OrdinaryImage.kernel` (universal-property): The kernel of T_n→A_n is exactly the kernel of its action on the selected high-weight factor. Maps from T_n descend uniquely to A_n if and only if they kill that kernel; the finite quotient A can have a larger kernel.

**Unit tests:**

- **killedFactor** (non-example): For B=O×O with projection to the first factor, the image is O, not an injective copy of B.
- **nilpotentAction** (comparison): On the finite module O/π², multiplication by π is a nonzero image operator although it reduces to zero on the mod-π fibre; reduction of traces alone does not determine the finite-quotient image.
- **singleFactor** (degenerate): If the selected factor is already the whole Hecke algebra, A_n equals that algebra through the range isomorphism.

**Check:**

- For B=O×O with projection to the first factor, the image is O, not an injective copy of B.
- On the finite module O/π², multiplication by π is a nonzero image operator although it reduces to zero on the mod-π fibre; reduction of traces alone does not determine the finite-quotient image.
- If the selected factor is already the whole Hecke algebra, A_n equals that algebra through the range isomorphism.

**Planet:** Ordinary Hecke image.


### Quadratic Hecke doubling

**Declaration:** `GL2ModularityLiftingPartII:D1.2/quadratic-doubling` (theorem).

Let M be the finite weight-one module, A its faithful p-anaemic image and B=A[T_p] its image after adjoining the already-defined weight-one operator T_p. On the full doubled space ψ(M²), the U_p-stable image is first B[U_p]≅B[X]/(X²−T_pX+⟨p⟩), finite free of rank two over B. In the repeated-root case this is the selected ordinary local factor; with distinct roots it is the whole two-factor algebra before projection. The high-weight Galois Frobenius trace then proves T_p∈A, so B=A and the quadratic algebra is free rank two over A. Only after that identification may one use this rank-two statement over the p-anaemic image. A single distinct-root factor has rank one.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Work first over B=A[T_p]. The corrected column matrix gives U_p²−T_pU_p+⟨p⟩=0, and ⟨p⟩ is a unit.
2. If a+bU_p with a,b∈B annihilates ψ(M²), the lower-left entry gives bM=0 and then aM=0. Since B is the image on M, it acts faithfully. This proves B[U_p]≅B[X]/(X²−T_pX+⟨p⟩) without assuming T_p∈A.
3. Use the R19.5 ordinary triangular description and the R19.6 integral high-weight representation: its trace at a p-Frobenius lift maps to U_p+⟨p⟩U_p⁻¹=T_p on this finite quotient. The cyclotomic factor is trivial there by the chosen high weight (one may choose a lift with ε(Frob_p)=1). That trace comes from T_n and therefore lands in its image A. This uses ordinary local compatibility, not the later conclusion that the weight-one representation is unramified.
4. Conclude B=A. Preserve the full doubled module for the rank-two argument; select distinct-root factors only afterwards, when each has rank one.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.2/ordinary-image-algebras`, `GL2ModularityLiftingPartII:D1.2/doubling-injective`, `AutomorphicGaloisRepresentations:R19.5`, `AutomorphicGaloisRepresentations:R19.6`.

**Source:** cg18, Lemma 3.16 and the following Frobenius-trace paragraph, pp. 332–333. First double over A[T_p], then descend T_p using the integral ordinary representation; the selected distinct-root factors are not individually doubled.

**Check:**

- A selected distinct-root factor has rank one, so it must fail the repeated-root rank-two contract.
- The proof must establish B=A[T_p] first and T_p∈A by high-weight traces; using the D1.3 weight-one unramifiedness theorem here would be circular.


**Work needed to close this layer:** Discharge the Hasse/theta, high-weight ordinary and Hecke-image contracts.

## D1.3 — Unramified Galois representations in weight one

Prove Theorem 3.11 over finite torsion Hecke images and their inverse limit. Treat distinct Frobenius roots, repeated nonscalar Frobenius and scalar Frobenius separately. The scalar proof imports the local eigenvalue ring and the equality of its doubling and unramified ideals; it does not replan those rings. Include T_p descent, the determinant-normalizing twist and local diamond characters at Taylor–Wiles primes.

**Dependencies:** `GL2ModularityLiftingPartII:D1.2`, `LocalGaloisDeformationRings:L7`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `LocalGaloisDeformationRings:L8`, `AutomorphicGaloisRepresentations:R19.6`, `AutomorphicGaloisRepresentations:R19.5`, `LocalGaloisDeformationRings:R08.2`, `AutomorphicGaloisRepresentations:R19.4`, `GlobalGaloisDeformations:R04.3`.

### Wiese doubled-representation criterion

**Declaration:** `GL2ModularityLiftingPartII:D1.3/wiese-doubling-criterion` (theorem).

Let R be a local ring, M and N finite free rank-two R-modules with a group action, and 0→N→M⊕M→L→0 an exact sequence split as R-modules, with all terms free rank two except the middle. If L/m_RL is indecomposable as a group module, then N,M,L are isomorphic as R[group]-modules. In particular, if L is unramified at p, so is M.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. Reduce the two coordinate maps N→M and M→L modulo m_R.
2. If no coordinate induces an isomorphism, the two rank-one images force a decomposition of L/m_RL; exclude it.
3. Lift an invertible coordinate by Nakayama, then split the sequence equivariantly and identify the other quotient.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.2/quadratic-doubling`.

**Source:** cg18, Lemma 3.17, p. 333. The local algebra lemma removes ramification when residual Frobenius is a nonscalar Jordan block.

**Check:**

- A decomposable residual quotient is outside the theorem; a nontrivial rank-two Jordan quotient meets the indecomposability requirement.

**Planet:** Wiese doubling criterion.


### Global doubling ideal

**Declaration:** `GL2ModularityLiftingPartII:D1.3/global-doubling-ideal` (definition).

In the scalar case, after twisting by the unique unramified λ(c⁻¹) with c²=⟨p⟩ and c≡α, view A_n and T̃_n as algebras over the imported scalar-residual local ring R†. Put J_glob=Ann_{R†}(T̃_n/A_n). Here the quotient is an R†-module, not a quotient ring. Its action factors through R†/J_glob. Compare this ideal with J_loc=Ann_{R†}(R̃†/R†).

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. Normalize the U_p eigenvalue by c so that the residual representation is trivial and the determinant is ε^{n−1} modulo the required finite coefficients.
2. Form the quotient module and its annihilator.
3. Use the local eigenvalue-ring action to compare annihilators without requiring R†→A_n injective.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.2/ordinary-image-algebras`, `LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Source:** cg18, Definition 3.25, p. 338; scalar normalization, pp. 334–335. The annihilator extracts exactly the quotient on which quadratic doubling is forced.

**Uses:**

- Scalar case of Theorem 3.11, p. 338: J_loc=I_unr forces every doubled quotient through the unramified local deformation ring.

**API:**

- `GlobalDoublingIdeal.mem` (characterisation): r∈J_glob iff rT̃_n⊂A_n.
- `GlobalDoublingIdeal.quotientAction` (structure): T̃_n/A_n is an R†/J_glob-module with the induced faithful action.
- `GlobalDoublingIdeal.localContainment` (compatibility): The map R̃†⊗_{R†}A_n↠T̃_n implies J_loc⊂J_glob.
- `GlobalDoublingIdeal.largest` (universal-property): J_glob is the largest ideal of R† annihilating the relative module T̃_n/A_n. An R† action on this module factors through R†/I exactly when I⊂J_glob.

**Unit tests:**

- **noDoubling** (degenerate): If A_n=T̃_n, the annihilator is the unit ideal and the quotient action is zero.
- **freeQuadratic** (comparison): For A→A[X]/(monic quadratic) with basis 1,X, the relative quotient is free rank one, hence its annihilator in A is zero.
- **moduleNotRing** (non-example): A need not be an ideal of T̃; no ring multiplication is imposed on T̃/A.

**Check:**

- If A_n=T̃_n, the annihilator is the unit ideal and the quotient action is zero.
- For A→A[X]/(monic quadratic) with basis 1,X, the relative quotient is free rank one, hence its annihilator in A is zero.
- A need not be an ideal of T̃; no ring multiplication is imposed on T̃/A.

**Planet:** Global doubling ideal.


### Scalar local comparison

**Declaration:** `GL2ModularityLiftingPartII:D1.3/scalar-local-comparison` (theorem).

For the normalized scalar case there is a surjection A_n⊗̂_{R†}R̃†↠T̃_n carrying the local eigenvalue to normalized U_p. Therefore J_loc⊂J_glob. By the imported equality J_loc=I_unr, every quotient of A_n on which the ordinary algebra is doubled is unramified at p. On that quotient T_p=U_p+⟨p⟩U_p⁻¹ belongs to the anaemic algebra.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. Use the ordinary high-weight local triangular representation with the chosen Frobenius eigenvalue to define the map from R̃†.
2. Show A_n and the eigenvalue U_p generate T̃_n; this proves surjectivity, not a tensor-product isomorphism.
3. Apply the annihilator containment and I_unr=J_loc, then read the quadratic trace relation.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.3/global-doubling-ideal`, `GL2ModularityLiftingPartII:D1.2/quadratic-doubling`, `LocalGaloisDeformationRings:L8/doubling-equals-unramified`, `AutomorphicGaloisRepresentations:R19.6`, `AutomorphicGaloisRepresentations:R19.5`.

**Source:** cg18, Lemma 3.24 and Definition 3.25, pp. 337–338. The global scalar case reduces to the already-owned explicit local-ring calculation.

**Check:**

- An unramified normalized twist must preserve unramifiedness after undoing it, and the local eigenvalue maps to c⁻¹U_p.

**Planet:** Scalar doubling becomes unramified.


### Unramifiedness in the three Frobenius cases

**Declaration:** `GL2ModularityLiftingPartII:D1.3/three-unramified-cases` (theorem).

For every finite weight-one Hecke quotient of D1.0 the representation reconstructed from high-weight trace functions is unramified at p. If α≠β, the two ordinary factors give opposite unramified rank-one quotients and hence an unramified split representation. If α=β and barρ(Frob_p) is nonscalar, quadratic doubling gives an unramified indecomposable quotient and the Wiese criterion applies. If barρ(Frob_p) is scalar, use the normalized local doubling ideal. In all three cases T_p descends to the anaemic weight-one algebra.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. Construct compatible trace functions on the finite Hasse subquotients using high-weight representations and residual absolute irreducibility; reconstruct an actual representation over the whole image.
2. For distinct roots apply both ordinary projections, not only their direct sum. At finite coefficients ε^{n−1}=1 makes both diagonal characters unramified.
3. For repeated nonscalar Frobenius use the residual Jordan block for indecomposability. For scalar Frobenius use the local-comparison theorem.
4. Compute the unramified Frobenius trace and pass to the finite coefficient quotient.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.2/ordinary-projection-injective`, `GL2ModularityLiftingPartII:D1.2/quadratic-doubling`, `GL2ModularityLiftingPartII:D1.3/wiese-doubling-criterion`, `GL2ModularityLiftingPartII:D1.3/scalar-local-comparison`, `AutomorphicGaloisRepresentations:R19.6`, `AutomorphicGaloisRepresentations:R19.5`.

**Source:** cg18, §3.5, pp. 331–332; §3.6, pp. 333–334; §3.7, p. 338. The three-case argument supplies unramifiedness and the missing T_p operator without a p-distinguished hypothesis.

**Check:**

- Run the proof in each root pattern, including scalar Frobenius; no p-distinguished assumption can remain in the output.

**Planet:** Weight-one unramifiedness at p.


### Weight-one Hecke-valued Galois representation

**Declaration:** `GL2ModularityLiftingPartII:D1.3/weight-one-galois-representation` (theorem).

Assume Q consists of primes x≡1 mod p, with barρ unramified at x and distinct chosen roots. Over the finite local weight-one image T_Q,m there is a continuous lift ρ_Q of barρ unramified outside NQ, with arithmetic-Frobenius trace T_x away from NpQ and trace T_p at p. There is a unique character η≡1 with η²=Teich(det barρ)/(detρ_Q); ρ_Q⊗η has fixed Teichmüller determinant and is minimal outside Q. At x∈Q it splits into two lifted eigenlines; on inertia the selected line is the diamond character and the other is its inverse after determinant normalization, with geometric-Artin/arithmetic-Frobenius conversion explicit. The diamond character belongs to the image of R_Q. A surjection onto the full U-image at auxiliary level requires the stated local compatibility, not traces alone.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. The preceding three cases and high-weight interpolation give compatible representations over all π^m quotients.
2. Apply the unique square-root automorphism on characters valued in 1+m, using p odd, to normalize the determinant.
3. Use Carayol-type away-p compatibility to verify the precise minimal local condition and diagonalize at Q by the distinct residual roots.
4. Pass to the inverse limit and compare local reciprocity on units with the diamond action.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.3/three-unramified-cases`, `GL2ModularityLiftingPartII:D1.2/ordinary-image-algebras`, `LocalGaloisDeformationRings:R08.2`, `AutomorphicGaloisRepresentations:R19.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `GlobalGaloisDeformations:R04.3`.

**Source:** cg18, Theorem 3.11 and Remarks 3.12–3.13, pp. 326–327; proof, pp. 327–338. The arithmetic output is the local–global compatibility input for minimal weight-one patching.

**Check:**

- At Q=∅ obtain unramifiedness at p and T_p descent. At nonempty Q retain Q-ramification and verify the diamond image without an unsupported full auxiliary surjection.

**Planet:** Weight-one Galois representation.


**Work needed to close this layer:** Discharge integral Hecke-valued reconstruction and exact local minimality/reciprocity contracts.

## D1.4 — Minimal weight-one R = T

Instantiate the balanced-module patching theorem with weight-one coherent homology, the correct dual-Selmer twist and q−1 deformation variables. Prove minimal R = T without O-flatness, rank one even for purely torsion no-vexing modules, and the minimal characteristic-zero and complete-local finite-image consequences.

**Dependencies:** `GL2ModularityLiftingPartII:D1.3`, `GL2ModularityLiftingPartII:D1.1`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `GlobalGaloisDeformations:R04.6`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `GL2ModularityLiftingPartII:D1.0`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `AutomorphicGaloisRepresentations:R19.4`, `AutomorphicGaloisRepresentations:R19.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `LocalGaloisDeformationRings:R08.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

### Weight-one Taylor–Wiles system

**Declaration:** `GL2ModularityLiftingPartII:D1.4/weight-one-patching-system` (construction).

Let q=dim_k H¹_dual(ad⁰barρ(1)) for the unramified-at-p minimal problem over Q, with q≥1. For every a≥1 choose Q_a of size q, x≡1 mod p^a, killing the dual Selmer group, and chosen roots. With S_a=O[(Z/p^aZ)^q] and A_∞=O[[z₁,…,z_{q−1}]], take H_a=H₀(X_{Δ_a}(Q_a),ω)_{m_a} and H=H₀(X,ω)_{m_∅}. The system includes A_∞↠R_min, compatible A_∞ actions on H_a, H_a,Δ_a≅H, balancedness over S_a, and image(S_a)⊂image(A_∞) with augmentation mapping into the minimal kernel.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. Import the CG18 Proposition 3.2/3.3 presentation and prime-selection contract from R04.3/R04.5/R04.6, retaining ad⁰barρ(1) and the exact residual-image hypotheses.
2. Use the selected residual eigenline at every Taylor–Wiles prime to define O[Δ_a]→R_{Q_a}; killing its augmentation gives R_min.
3. Use coherent descent and selected-root comparison for coinvariants and balancedness. Identify the algebra image condition on H_a through the diamond characters of ρ_{Q_a}.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.3/weight-one-galois-representation`, `GL2ModularityLiftingPartII:D1.1/selected-root-oldform-comparison`, `GL2ModularityLiftingPartII:D1.1/coherent-balancedness`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `GlobalGaloisDeformations:R04.6`, `tauceti:TauCeti.MonoidAlgebra.augmentation`.

**Source:** cg18, Theorem 3.26, pp. 339–340; Propositions 3.2–3.3, pp. 311–312. These are the arithmetic hypotheses of the existing balanced patching engine.

**Uses:**

- Theorem 3.26: The balanced patching theorem consumes this exact finite-level system.

**API:**

- `WeightOnePatchingSystem.level` (data): For each a return Q_a, Δ_a, H_a and its commuting S_a and A_∞ actions.
- `WeightOnePatchingSystem.coinvariants` (equivalence): H_a⊗_{S_a}O≅H with its A_∞ action through R_min.
- `WeightOnePatchingSystem.augmentation` (compatibility): The inertia/diamond map factors S_a→R_{Q_a}, and augmentation specializes it to the minimal deformation ring.
- `WeightOnePatchingSystem.transition` (compatibility): Record compatibility of the finite coefficient and diamond quotients with the A_∞ actions and selected residual roots; any system comparison used in patching must preserve the coinvariant identification with the same H.

**Unit tests:**

- **oneVariableDefect** (value): For q=1, A_∞=O; inserting one power-series variable gives the defect-zero presentation and is rejected.
- **augmentationBasis** (comparison): Every group basis element of S_a maps to 1 under TauCeti.MonoidAlgebra.augmentation; augmentation is not coefficient extraction at the identity.
- **torsionSystem** (non-example): A nonzero H killed by a power of π is admissible; requiring O-flat H excludes the main defect-one case.

**Check:**

- For q=1, A_∞=O; inserting one power-series variable gives the defect-zero presentation and is rejected.
- Every group basis element of S_a maps to 1 under TauCeti.MonoidAlgebra.augmentation; augmentation is not coefficient extraction at the identity.
- A nonzero H killed by a power of π is admissible; requiring O-flat H excludes the main defect-one case.

**Planet:** Weight-one patching system.


### Minimal weight-one R = T

**Declaration:** `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-rt` (theorem).

Assume the no-vexing minimal problem and the Katz witness of D1.0. The map R_min→T_∅,m_∅ induced by the determinant-normalized representation is an isomorphism of complete local O-algebras; H₀(X,ω)_{m_∅} is a nonzero finite free R_min-module. Neither R_min nor T is required to be O-flat. Via the weight-one duality the same Hecke algebra acts on H¹(X,ω)_m.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. Apply the imported balanced-module patching theorem to H_a and A_∞.
2. A positive-rank free module is faithful over R_min, while the Hecke algebra is its action image. Thus the surjective minimal map has zero kernel.
3. Transport the result to coherent cohomology using the chosen Hecke-equivariant weight-one duality.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.4/weight-one-patching-system`, `DeformationAndDerivedPatchingAlgebra:R03.5/balanced-module-patching-theorem`, `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-duality`, `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-data`.

**Source:** cg18, Theorem 3.26, pp. 339–340; Theorem 1.4, p. 303. The first arithmetic defect-one R = T theorem includes nonflat finite Hecke rings.

**Check:**

- Permit a nonzero ring killed by π; freeness is over R_min, and the conclusion does not force O-flatness.

**Planet:** Minimal weight-one R = T.


### No-vexing rank one including torsion

**Declaration:** `GL2ModularityLiftingPartII:D1.4/no-vexing-rank-one` (theorem).

After removing the harmless rigidifying prime r and returning to the conductor-level Katz module, under the preceding no-vexing hypotheses, H₀(X,ω)_m is free of rank one over T_m, including when H₀[1/p]=0. In the torsion case the m-eigenspace in H⁰(X,ω_k(−C)) has k-dimension one. All bad U_x belong to the anaemic localized algebra: on the rank-one inertia-invariant line they are Frobenius scalars; if the invariant space is zero the minimal newvector operator is zero. This case split uses invariant dimensions, not merely the exponent of N.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. In characteristic zero use GL₂ global multiplicity one and exact conductor newvectors.
2. For the torsion case recover U_x from the precise local representation and minimality; recover T_p from D1.3.
3. A simultaneous eigenform is determined by a₁ and all Hecke recursions. The q-expansion principle at the localized conductor level gives an eigenspace of dimension one; finish by Nakayama.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-rt`, `GL2ModularityLiftingPartII:D1.3/weight-one-galois-representation`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `AutomorphicGaloisRepresentations:R19.4`, `GL2ModularityLiftingPartII:D1.1/harmless-prime-comparison`.

**Source:** cg18, Final paragraph of §3.8, p. 340. A q-expansion argument handles the torsion case where generic-fibre multiplicity one is unavailable.

**Check:**

- If the generic fibre is zero, use the dimension-one Katz eigenspace; a generic-fibre multiplicity argument cannot prove this case.

**Planet:** Torsion weight-one rank one.


### Minimal weight-one modularity lifting

**Declaration:** `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-lifting` (application).

Assume the no-vexing and ramified-reducible invariant-line standing hypotheses. Let ρ:G_Q→GL₂(O′), with O′ finite over O, be an odd continuous lift of an absolutely irreducible barρ unramified at p, with fixed Teichmüller determinant, unramified at p and genuinely minimal at every other prime in the deformation condition of R_min. Then ρ is attached to a characteristic-zero weight-one cuspidal eigenform, hence has finite image. A lift with only dimρ^{I_x}=dimbarρ^{I_x}=1 is not accepted as minimal if its inertial character acquires new p-power ramification.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. The minimal lifting datum defines an O′-point of R_min=T_m.
2. Interpret the corresponding generic-fibre Hecke system by the geometric/classical weight-one comparison.
3. Apply the imported Deligne–Serre Artin representation and trace uniqueness. The vexing version uses D1.6.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-rt`, `AutomorphicGaloisRepresentations:R19.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `LocalGaloisDeformationRings:R08.2`.

**Source:** cg18, Corollary 1.5, p. 304; §3.9.2, p. 354. The corrected minimal hypothesis excludes additional p-power inertial characters hidden by the printed invariant-dimension condition.

**Check:**

- Reject a lift with unchanged invariant dimension but new p-power inertial determinant; genuine minimality is necessary.


### Finite image over complete local coefficient rings

**Declaration:** `GL2ModularityLiftingPartII:D1.4/minimal-complete-local-finite-image` (application).

Under the no-vexing and ramified-reducible invariant-line hypotheses, for p≥3 and odd absolutely irreducible barρ unramified at p, every minimal lift to a complete Noetherian local O-algebra A with residue k has finite image. The argument must control the universal ring, including its π-torsion and nilpotents; finiteness of its characteristic-zero point images alone is insufficient.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.
- For the untyped Galois and R = T assertions the vexing set is empty. Auxiliary fine-level copies are compared with the conductor-level module as in D1.0–D1.1.

**Proof or construction:**

1. R_min is finite over O by R = T. There are finitely many characteristic-zero systems and their representations have finite image.
2. Apply the unramified-at-p class-field argument of Lemma 4.14 to show the minimal characteristic-zero deformation ring is reduced: a nontrivial infinitesimal self-extension over a splitting field would define a Z_p-extension unramified at p and outside finitely many primes away from p. Its abelianization has no Z_p quotient.
3. Embed R_min modulo its finite π-torsion ideal in the product of its finitely many generic fields. The universal image there is finite; the kernel of the induced matrix map is a finite set because the torsion ideal is finite.
4. Every A-valued minimal lift is a specialization of this finite universal image.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-rt`, `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-lifting`, `GlobalGaloisDeformations:R04.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Source:** cg18, Corollary 1.6, p. 304; Lemma 4.14 and proof, pp. 366–368. Reduced generic fibres together with finite integral torsion give the complete-local finite-image conclusion.

**Check:**

- A finite set of generic-field images is not enough: the universal π-torsion matrix kernel must also be finite.


**Work needed to close this layer:** Discharge the fixed-determinant global presentation, prime-selection and finite-image rigidity contracts.

## D1.5 — Vexing-prime coefficient bundles

Specialize the CDT finite type to a lattice W_σ and the corrected level groups U,V. Construct invariant pushforward bundles and their subcuspidal variants separately at every auxiliary level. Prove local freeness, arbitrary coefficient base change, cusp duality, high-weight vanishing and normalized Hecke functoriality. Ramification at cusps is handled by explicit tame-inertia eigenspaces, rather than a false compactified pullback identity.

**Dependencies:** `GL2ModularityLiftingPartII:D1.0`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `LocalGaloisDeformationRings:R08.2`, `AlgebraicModularFormsAndSerreWeights:R15.1`, `AlgebraicModularFormsAndSerreWeights:R15.3`, `AlgebraicModularFormsAndSerreWeights:R15.2`.

### Vexing-prime levels and coefficient datum

**Declaration:** `GL2ModularityLiftingPartII:D1.5/vexing-level-data` (definition).

For barρ as in D1.0 let T be the primes x≠p with barρ|D_x absolutely irreducible, barρ|I_x reducible and x≡−1 mod p. Put c_x=a_x(barρ), even for x∈T. At x∈T set U_x=GL₂(Z_x), V_x=ker(GL₂(Z_x)→GL₂(Z/x^{c_x/2}Z)). At each nonvexing ramified x use the upper-triangular conductor-level group with lower-right entry of p-power order for U_x=V_x; retain the printed specializations at the other primes. Together with the fixed fine-level auxiliary prime form V◁U and G=U/V. The coefficient datum is the imported CDT minimal-type lattice W_σ=⊗_{x∈T}W_{σ_x}, finite free over O, with its G-action and contragredient W_{σ*}.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Compute the vexing set from the local representation, not the norm congruence alone.
2. Use the full finite GL₂ type supplied by R16.2, keeping its normalization so minimal forms lie in the W_σ* isotypic part of sections upstairs.
3. Assemble U,V and the same Q,Δ modifications at all levels; retain the nonvexing p-power diamond conditions at every ramified prime.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.0/weight-one-level-data`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `LocalGaloisDeformationRings:R08.2`.

**Source:** cg18, §3.9, pp. 341–343; §3.9.2, pp. 350, 354. The local types exclude the nonminimal supercuspidal lifts present at naive conductor level.

**Uses:**

- Theorem 3.30: These are the levels and coefficient representations that isolate minimal characteristic-zero lifts.

**API:**

- `VexingDatum.group` (data): Return V◁U, G and the finite free G-representations W_σ and W_σ*.
- `VexingDatum.selector` (characterisation): In characteristic zero Hom_G(W_σ*,sections upstairs) selects exactly the minimal local automorphic lifts, by the R16.2 CDT contract.
- `VexingDatum.empty` (compatibility): For T=∅ the coefficient type and quotient G are trivial and recover the no-vexing datum.
- `VexingDatum.latticeChange` (functoriality): An isomorphism of the chosen integral G-lattices induces compatible coefficient-bundle isomorphisms. A mere characteristic-zero isomorphism does not identify two integral lattices.

**Unit tests:**

- **normNotEnough** (non-example): An x≡−1 mod p with barρ|D_x reducible is not vexing.
- **trivialType** (degenerate): T=∅ gives the rank-one trivial lattice, not a missing coefficient space.
- **nonminimalType** (non-example): A p-power ramified twist of the same residual supercuspidal representation is excluded unless its inertial type equals the fixed minimal lift.

**Check:**

- An x≡−1 mod p with barρ|D_x reducible is not vexing.
- T=∅ gives the rank-one trivial lattice, not a missing coefficient space.
- A p-power ramified twist of the same residual supercuspidal representation is excluded unless its inertial type equals the fixed minimal lift.

**Planet:** Vexing-prime coefficient datum.


### Vexing-prime coefficient bundles

**Declaration:** `GL2ModularityLiftingPartII:D1.5/vexing-coefficient-bundles` (construction).

For f:X_V→X_U and its G-action define L_σ=(f_*(O_{X_V}⊗_O W_σ))^G and L_σ^sub=(f_*(O_{X_V}(−C_V)⊗_O W_σ))^G, with invariants as sheaves. Define L_{σ,Q,Δ} and L_{σ,Q,Δ}^sub by the same pushforward formula on each corresponding cover. On the interior these are the usual descended vector bundles. No identity with the ordinary pullback of a compactified base bundle is built into the definition.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Use the finite morphism and its actual G-action to form the equivariant pushforward.
2. Take invariants sheafwise and define the natural inclusion of the subcuspidal version.
3. Repeat at auxiliary levels; compare on the open curves first, then extend using the cusp calculation of the next target.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.5/vexing-level-data`, `AlgebraicModularFormsAndSerreWeights:R15.1`.

**Source:** cg18, §3.9.1, pp. 343–344. The coefficient bundles are invariant pushforwards; ramification at the cusps makes compactified pullback a separate issue.

**Uses:**

- Lemmas 3.27–3.28 and Theorem 3.30: These bundles replace trivial coefficients while preserving integral duality and Hecke actions.

**API:**

- `VexingBundle.sections` (characterisation): For every open W⊂X_U, Γ(W,L_σ)=(Γ(f⁻¹W,O)⊗W_σ)^G, and similarly with the cusp ideal.
- `VexingBundle.openDescent` (equivalence): On Y_U the bundle agrees with G-torsor descent of O_{Y_V}⊗W_σ.
- `VexingBundle.subInclusion` (structure): The cusp-ideal inclusion induces L_σ^sub↪L_σ and is an isomorphism away from C_U.
- `VexingBundle.coefficientMap` (functoriality): A G-equivariant O-linear map W→W′ induces full and subcuspidal bundle maps, compatible with identity, composition and the cusp inclusion. After the local-freeness theorem these commute with arbitrary O-base change.

**Unit tests:**

- **trivialCover** (degenerate): For G=1 and rank-one W, L=O_X and L^sub=O_X(−C).
- **characterCusp** (value): For inertia μ_e acting by q↦ζq, a χ_i eigenspace of functions is q^iO[[q^e]], with the inverse character paired in W.
- **ramifiedPullback** (non-example): When q_base=q_cover^e, the compactified character extension need not equal naive pullback; do not infer such an isomorphism from agreement on the open curve.

**Check:**

- For G=1 and rank-one W, L=O_X and L^sub=O_X(−C).
- For inertia μ_e acting by q↦ζq, a χ_i eigenspace of functions is q^iO[[q^e]], with the inverse character paired in W.
- When q_base=q_cover^e, the compactified character extension need not equal naive pullback; do not infer such an isomorphism from agreement on the open curve.

**Planet:** Vexing-prime bundles.


### Local freeness and coefficient base change

**Declaration:** `GL2ModularityLiftingPartII:D1.5/bundle-local-freeness-base-change` (theorem).

For any finite free O[G]-representation W in this construction, L_W and L_W^sub are finite locally free O_X-modules. For every O-algebra B, including nonflat B, their formation commutes with base change to B, and H⁰(X_B,L_W⊗ωⁿ)=(H⁰(X_{V,B},ωⁿ)⊗_O W)^G. The subcuspidal version uses the upstairs cusp divisor. No general exactness of G-invariants is asserted when p divides |G|.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. On the open curve use finite étale torsor descent, which works without averaging by |G|.
2. At a cusp use its inertia subgroup I, whose order e is prime to p, and completed local rings O[[q^e]]⊂O[[q]].
3. After a finite étale coefficient extension split W into I-characters; each invariant summand is q^iO[[q^e]]⊗W_{χ_i⁻¹}. These free summands commute with arbitrary coefficient extension.
4. Descend local freeness and base-change isomorphisms and identify global sections by the sheaf definition.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.5/vexing-coefficient-bundles`, `AlgebraicModularFormsAndSerreWeights:R15.1`.

**Source:** cg18, Lemma 3.27(1)–(2), pp. 345–347. The special torsor-and-tame-cusp geometry, not a Reynolds operator for G, makes these invariant bundles well behaved.

**Check:**

- Base change to O/π must commute with the invariant-pushforward bundle even when p divides the global type-group order; use torsor and tame-cusp descent rather than averaging over that group.

**Planet:** Integral type-bundle base change.


### Cusp-corrected type-bundle duality

**Declaration:** `GL2ModularityLiftingPartII:D1.5/bundle-cusp-duality` (theorem).

The natural map L_{σ*}→L_σ^∨ is injective and is an isomorphism on the interior, but can fail at a cusp. It restricts to L_{σ*}^sub≅L_σ^∨(−C_U); equivalently (L_σ^sub)^∨(−C_U)≅L_{σ*}. These identities hold after arbitrary O-base change and at every independently defined auxiliary level.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Use evaluation W⊗W*→O to define the natural comparison and torsor descent on the open curve.
2. In a cusp character summand dualize q^iO[[q^e]] to q⁻ⁱO[[q^e]]. Multiplication by the downstairs cusp parameter q^e changes the exponent to e−i.
3. Match these exponents with the subcuspidal invariants; reverse σ and σ* for the second identity.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.5/bundle-local-freeness-base-change`, `GL2ModularityLiftingPartII:D1.5/vexing-coefficient-bundles`.

**Source:** cg18, Lemma 3.28 and proof, pp. 347–349. The cusp twist restores the duality needed for integral coherent homology.

**Check:**

- At a ramified cusp the full dual comparison may be proper; the stated subcuspidal formula must still be an isomorphism.

**Planet:** Cusp-corrected type duality.


### High-weight vanishing with types

**Declaration:** `GL2ModularityLiftingPartII:D1.5/type-high-weight-vanishing` (theorem).

For n>1, H¹(X_U,ωⁿ⊗L_σ)=0 and H⁰(X_U,ωⁿ⊗L_σ)⊗O/π^m≅H⁰(X_{U,O/π^m},ωⁿ⊗L_σ). For L_σ^sub the same assertions hold for n>2. The n=1 boundary is not covered. These statements hold at the auxiliary levels as well.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Apply coherent duality and the cusp-corrected dual-bundle formulas.
2. The dual spaces are cusp forms upstairs in nonpositive weight, which vanish in the stated ranges.
3. Apply the coefficient exact sequence to deduce H⁰ base change.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.5/bundle-cusp-duality`, `GL2ModularityLiftingPartII:D1.5/bundle-local-freeness-base-change`, `AlgebraicModularFormsAndSerreWeights:R15.3/twisted-serre-duality-hecke`.

**Source:** cg18, Corollary 3.29 and proof, pp. 349–350. High-weight forms with these coefficients lift integrally; weight-one torsion remains allowed.

**Check:**

- n=1 is outside the vanishing statement, and n=2 is outside the subcuspidal statement; their torsion must remain admissible.


### Hecke correspondences with type coefficients

**Declaration:** `GL2ModularityLiftingPartII:D1.5/type-hecke-correspondences` (construction).

For the away-type correspondences at U,Q,Δ, construct T_x,U_y and diamond actions on ωⁿ⊗L_σ and on its subcuspidal version by equivariant pullback/isogeny/trace on X_V. Use the natural equivariant bundle identifications on the open correspondence and verify their extension at every cusp through the invariant pushforward model. With normalized trace, T_x^t=⟨x⁻¹⟩T_x and ⟨a⟩^t=⟨a⁻¹⟩ for a prime to the level. The factor 1/x occurs in both T_x and its transpose.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. The correspondences commute with G, so act on invariant pushforward sections.
2. Verify the maps at cusp formal neighborhoods and keep the separately defined coefficient bundles on both sides.
3. Compute dual isogenies and trace to get the transpose normalization; descend finite-level actions.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.5/vexing-coefficient-bundles`, `GL2ModularityLiftingPartII:D1.5/bundle-local-freeness-base-change`, `GL2ModularityLiftingPartII:D1.5/bundle-cusp-duality`, `AlgebraicModularFormsAndSerreWeights:R15.2`.

**Source:** cg18, §3.9.1, pp. 344–345; §3.9.2, pp. 351–353. This functoriality is sufficient for patching without a false compactified pullback assertion.

**Uses:**

- Theorem 3.30, steps (1)–(4): The operators must commute with descent, duality and Hasse multiplication for the type-coefficient patching system.

**API:**

- `TypeHecke.action` (structure): The normalized double-coset operators act on the invariant-pushforward sections and preserve L^sub.
- `TypeHecke.qExpansion` (compatibility): At each cusp and each component, the upstairs q-expansion formulas descend G-equivariantly.
- `TypeHecke.transpose` (characterisation): The trace-pairing adjoint of T_x is ⟨x⁻¹⟩T_x, including the same 1/x normalization.
- `TypeHecke.coefficientMap` (compatibility): Equivariant maps of the integral type lattice intertwine the descended Hecke actions and their transpose pairings at every level and coefficient quotient.

**Unit tests:**

- **trivialCoefficient** (comparison): For W=O with trivial G, recover the normalized operators of D1.0.
- **inverseDiamond** (non-example): If a diamond eigenvalue d has d²≠1, transposition sends it to d⁻¹, not d.
- **allComponents** (non-example): An equality of q-expansions on one component is insufficient until the type group action transports it to all components.

**Check:**

- For W=O with trivial G, recover the normalized operators of D1.0.
- If a diamond eigenvalue d has d²≠1, transposition sends it to d⁻¹, not d.
- An equality of q-expansions on one component is insufficient until the type group action transports it to all components.

**Planet:** Hecke action with types.


**Work needed to close this layer:** Discharge the CDT selector and modular-curve descent/completed-cusp contracts.

## D1.6 — Weight-one R = T with vexing primes

Prove the four type-coefficient modifications of the no-vexing proof, with corrected contragredient localization and q-expansions on every component. Deduce minimal R = T and freeness on the correct coherent module; state rank one under the nonzero-generic-fibre hypothesis. Extend the minimal lifting and complete-local finite-image consequences to all vexing types.

**Dependencies:** `GL2ModularityLiftingPartII:D1.5`, `GL2ModularityLiftingPartII:D1.1`, `GL2ModularityLiftingPartII:D1.0`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `AlgebraicModularFormsAndSerreWeights:R15.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2ModularityLiftingPartII:D1.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `AutomorphicGaloisRepresentations:R19.6`, `AutomorphicGaloisRepresentations:R19.4`, `GL2ModularityLiftingPartII:D1.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `AutomorphicGaloisRepresentations:R19.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

### Boundary and degeneracy with types

**Declaration:** `GL2ModularityLiftingPartII:D1.6/type-boundary-and-degeneracy` (theorem).

At an absolutely irreducible residual ideal the cusp/full comparison and the selected-root auxiliary-level isomorphism hold with ωⁿ⊗L_σ. At a Taylor–Wiles prime x the same normalized oldform/W_x identities hold on these coefficients. The cusp-supported cokernels are Eisenstein because every eigensystem upstairs is a two-character sum, and tensoring with W_σ then taking G-invariants preserves this property.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Apply the correspondence identities on X_V before taking G-invariants.
2. Compute cusp eigencharacters type by type; the type group does not act transitively on all cusps.
3. Use finite π^m-torsion lengths and distinct-root localization exactly as in D1.1.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.5/type-hecke-correspondences`, `GL2ModularityLiftingPartII:D1.1/selected-root-oldform-comparison`, `GL2ModularityLiftingPartII:D1.0/coherent-boundary-vanishing`.

**Source:** cg18, Theorem 3.30, steps (1)–(2), pp. 350–351. The oldform and boundary parts of the argument extend to the special coefficient bundles.

**Check:**

- Use two different cusp types upstairs; neither the type group nor all diamonds may be assumed transitive on their union.


### Balancedness with contragredient types

**Declaration:** `GL2ModularityLiftingPartII:D1.6/type-balancedness` (theorem).

Define H_i(X,ω⊗L_{σ*}) using the dual coherent convention. Its coefficient dual is ω⊗L_σ^sub, by the cusp formula. On the non-Eisenstein m-part, coherent descent and boundary vanishing give balanced H₀ over O[Δ]. The needed generic rank equality compares the σ and σ* spaces at residual ideals m and m*, where m* sends T_x to trbarρ(Frob_x)/detbarρ(Frob_x) and diamonds to their inverses. It follows from contragredient automorphic representations, not a presumed self-duality of W_σ.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Use the cusp duality to identify the actual coefficient sheaf occurring in homological descent.
2. Track the adjoints T_x^t=⟨x⁻¹⟩T_x and inverse diamonds in the duality map.
3. Over K apply automorphic contragredients to compare dimensions at m and m*.
4. Use the same low-degree Tor bound as D1.1 and the torsion-free degree-one group.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.6/type-boundary-and-degeneracy`, `GL2ModularityLiftingPartII:D1.5/bundle-cusp-duality`, `GL2ModularityLiftingPartII:D1.1/coherent-cover-descent`, `DeformationAndDerivedPatchingAlgebra:R03.5/balanced-modules`, `AlgebraicModularFormsAndSerreWeights:R15.3/twisted-serre-duality-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Source:** cg18, Theorem 3.30, step (3), pp. 351–353. Contragredient localization supplies the correct rank equality and the balanced module.

**Check:**

- For a non-self-dual type, check the inverse-diamond residual ideal and use contragredients to compare dimensions.

**Planet:** Balanced type-coefficient homology.


### Galois representations with vexing coefficients

**Declaration:** `GL2ModularityLiftingPartII:D1.6/type-weight-one-galois` (theorem).

The weight-one local Hecke image acting on the Pontryagin dual of H⁰(X_U,(ω⊗L_σ)_{K/O})_m admits the same determinant-normalized ρ_Q as D1.3, minimal at every vexing prime in the fixed CDT type. The high-weight Hasse subquotient has W_σ*-isotypic characteristic-zero automorphic lifts. The component argument and the CDT selector ensure the local type before descent; unramifiedness at p follows from the three-case doubling proof.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Embed type-coefficient weight-one torsion in the high-weight G-invariant space using Hasse multiplication and high-weight base change.
2. Prove the q-expansion and doubling identities on every connected component upstairs: the product of the vexing GL₂ groups transports components and commutes with the p-operators.
3. Use the exact minimal-type selector supplied by R16.2 (CDT Lemma 5.1.1), then descend the high-weight Galois representation and its determinant-normalizing twist.
4. The reference to D1.3 is to its three-case proof with this coefficient system: re-establish doubling and ordinary projection on the type space using the preceding component argument; it does not apply a no-vexing theorem to a representation with vexing primes.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.5/vexing-level-data`, `GL2ModularityLiftingPartII:D1.5/type-hecke-correspondences`, `GL2ModularityLiftingPartII:D1.5/type-high-weight-vanishing`, `GL2ModularityLiftingPartII:D1.3/three-unramified-cases`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/cdt-vexing-type`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `AutomorphicGaloisRepresentations:R19.6`, `AutomorphicGaloisRepresentations:R19.4`.

**Source:** cg18, Theorem 3.30, step (4), pp. 353–354. The Galois representation must act on the coefficient module selected by the correct dual type.

**Check:**

- An equality of q-expansions on one connected component cannot be used before transporting it through the commuting type-group action.

**Planet:** Vexing-type Galois representation.


### Minimal weight-one R = T with vexing types

**Declaration:** `GL2ModularityLiftingPartII:D1.6/minimal-vexing-weight-one-rt` (theorem).

Let W_σ be normalized so that minimal lifts occur in the W_σ*-isotypic space of sections upstairs. Then R_min(barρ)≅T_m on H₀(X_U,ω⊗L_{σ*})_m, a nonzero finite free module over this ring. By duality with the inverse-diamond transpose, equivalently R_min(barρ)≅T_m on H¹(X_U,ω⊗L_σ)_m. In the homological formulation one must swap σ and σ* relative to the printed Theorem 3.30. If the coherent module has nonzero generic fibre, its free rank is one; no assertion of torsion rank one with nontrivial type is made. The rank-one conclusion is at the intended conductor/type level after the harmless rigidifying prime has been removed; a fine auxiliary realization can have two old copies.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Repeat the arithmetic Taylor–Wiles construction on the independently defined type bundles using D1.6 balancedness and Galois compatibility.
2. Apply the existing balanced patching theorem; faithfulness of the Hecke image proves R = T.
3. Transport across the explicitly twisted duality, with m* when needed, to the coherent H¹ formulation.
4. For rank one use the characteristic-zero CDT selector and global multiplicity one; retain the nonzero-generic-fibre hypothesis.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.6/type-balancedness`, `GL2ModularityLiftingPartII:D1.6/type-weight-one-galois`, `GL2ModularityLiftingPartII:D1.4/weight-one-patching-system`, `DeformationAndDerivedPatchingAlgebra:R03.5/balanced-module-patching-theorem`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Source:** cg18, Theorem 3.30, pp. 350–354; Theorem 1.4, p. 303. The corrected coefficient convention gives the advertised coherent theorem without silently identifying a type and its dual.

**Check:**

- When σ is not isomorphic to σ*, the homological carrier must use σ* at barρ, with the coherent H¹ output using the stated adjoint localization.

**Planet:** Minimal R = T with vexing types.


### Minimal lifting and finite image with types

**Declaration:** `GL2ModularityLiftingPartII:D1.6/vexing-minimal-finite-image` (application).

For the same residual barρ, including nonempty vexing set, genuinely minimal lifts unramified at p over finite coefficient extensions are weight-one Artin representations. Every genuinely minimal lift to a complete Noetherian local O-algebra with residue k has finite image. All local minimality conditions and the fixed determinant are retained; dropping them is outside these statements. More generally first twist barρ by a finite-order character unramified at p so that every ramified reducible local restriction has a nonzero inertia invariant; use its Teichmüller lift on ρ. Require genuine minimality for this twisted problem, normalize its determinant by the unique square root of the determinant quotient, and undo both finite-order twists after applying the theorem. The quotient character is finite by the global unramified-at-p class-field argument. This gives the corrected minimal-up-to-finite-order-twist versions of Corollaries 1.5 and 1.6; the curve, conductor and residual ideal belong to the normalized twist.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- The weight-one residual representation is continuous, odd, absolutely irreducible and unramified at p; at a ramified reducible decomposition group its inertia invariants are nonzero. Determinant-normalized minimal lifts have Teichmüller determinant.

**Proof or construction:**

1. Replace the no-vexing R = T input in D1.4 by the corrected type-coefficient theorem.
2. Apply the same generic-fibre Artin comparison and global unramified-at-p infinitesimal-rigidity argument.
3. The finite π-torsion kernel in the universal ring controls specializations to arbitrary complete local A.
4. Use ray-class reciprocity to extend the prescribed finite prime-to-p local unit characters away from p to a finite-order global character unramified at p; enlarge coefficients if necessary. The determinant quotient has values in 1+m, is unramified at p and outside finitely many primes, so factors through a finite ray-class p-quotient. Twisting preserves finite image and the corrected minimal local problem; use the normalized conductor when invoking R = T.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.6/minimal-vexing-weight-one-rt`, `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-lifting`, `GL2ModularityLiftingPartII:D1.4/minimal-complete-local-finite-image`, `AutomorphicGaloisRepresentations:R19.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Source:** cg18, Corollaries 1.5–1.6, p. 304; §3.9.2, p. 354; Lemma 4.14, pp. 366–368. The type construction supplies the missing generality for the two introductory consequences.

**Check:**

- First apply the theorem to the normalized finite-order twist and its own conductor; undoing finite-order twists must preserve the finite-image conclusion.


**Work needed to close this layer:** Discharge contragredient multiplicity and the type-coefficient compatibility contracts.

## D1.7 — Scalar Frobenius and Jacobian multiplicity

For the minimal-conductor-among-twists residual problem, assemble the scalar ordinary eigenvalue ring, character-twisting Hecke algebras and canonical-module calculation. Prove the integral group-ring identity by generators and deduce multiplicity two from the Gross sequence using left exactness and evenness. Keep the nonharmless ramified self-extension case as an explicit gap in the general theorem; import the already-known multiplicity-one alternatives.

**Dependencies:** `SerreWeightAndLevelOptimisation:R20.3`, `LocalGaloisDeformationRings:R08.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `LocalGaloisDeformationRings:L7`, `GlobalGaloisDeformations:R04.3`, `GL2ModularityLifting:R22.4`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `AutomorphicGaloisRepresentations:R19.6`.

### Multiplicity character datum

**Declaration:** `GL2ModularityLiftingPartII:D1.7/multiplicity-character-data` (definition).

Fix p≥3 and an odd absolutely irreducible modular barρ of Serre weight 2≤w≤p+1 whose prime-to-p conductor N is minimal among all local twists at every x≠p. Put N*=N for w=2 and N*=Np otherwise. Let T_m be the full Hecke algebra of J₁(N*), including U_p. For the scalar unramified-at-p case, let M be the conductor factor supported on harmless primes x≡1 mod p with barρ|D_x absolutely irreducible, and Φ the p-primary quotient of ∏_{x|M}(Z/xZ)×. After adjoining its character values, for φ∈Φ^∨ set χ_φ=ε·Teich(detbarρ·barε⁻¹)·φ; the ordinary weight-two spaces S_φ fix only this harmless diamond restriction.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

**Proof or construction:**

1. Use the weight-two realization and full Hecke algebra supplied by the modular-curve/Gross input.
2. Separate harmless determinant characters from the complementary p-primary tame characters ψ.
3. Since p is odd, φ↦φ² and ψ↦ψ² are automorphisms; normalize determinants by the unique ψ^{-1/2} twist.

**Direct inputs:** `SerreWeightAndLevelOptimisation:R20.3/gross-ordinary-tate-sequence`, `LocalGaloisDeformationRings:R08.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Source:** cg18, Theorem 4.8 and proof, pp. 361–363. The character bookkeeping fixes the ordinary local-global comparison needed to recover full-level multiplicity.

**Uses:**

- Proof of Theorem 4.8: The φ² decomposition and complementary ψ normalization compare the fixed-determinant eigenvalue ring to the full Hecke algebra.

**API:**

- `MultiplicityDatum.level` (data): Return N*, T_m and the Gross ordinary connected–étale sequence.
- `MultiplicityDatum.harmlessCharacters` (characterisation): Φ contains precisely the indicated p-primary tame determinant characters at harmless primes.
- `MultiplicityDatum.twist` (compatibility): Twisting by φ carries S₁ to S_{φ²}; T_ℓ scales by φ(ℓ), diamonds by φ(d)², and conductor is preserved under the stated harmless hypothesis.
- `MultiplicityDatum.twistComposition` (simp): The trivial character acts as the identity; twisting successively by φ and ψ equals twisting by φψ on the matched levels, and its inverse is twisting by φ⁻¹. These identities include the squared diamond character.

**Unit tests:**

- **weightTwoLevel** (value): If w=2 then N*=N; if barρ is unramified scalar at p, its weight-two realization uses Np.
- **squareAutomorphism** (comparison): For a cyclic group of order 3, squaring permutes all three characters; the same assertion fails for order 2.
- **nonharmlessSelfExtension** (non-example): A reducible nontrivial unramified-character self-extension at x≡1 mod p is not harmless and is not included in Φ.

**Check:**

- If w=2 then N*=N; if barρ is unramified scalar at p, its weight-two realization uses Np.
- For a cyclic group of order 3, squaring permutes all three characters; the same assertion fails for order 2.
- A reducible nontrivial unramified-character self-extension at x≡1 mod p is not harmless and is not included in Φ.

**Planet:** Multiplicity character datum.


### Global scalar eigenvalue ring and type

**Declaration:** `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type` (theorem).

In the scalar unramified-at-p setting, impose the additional restriction that no nonharmless x≡1 mod p has barρ|D_x a nontrivial ramified extension of an unramified character by itself. For each φ let R̃_φ be the global ordinary deformation ring with chosen Frobenius eigenvalue at p, determinant χ_φ, and the conductor-compatible local quotients away from p (in particular the unipotent/Steinberg quotient for ramified Steinberg residual type at x≡−1 mod p). Subject to the exact generic-fibre component comparison requested from R22.4, R̃_φ is finite flat over O, Cohen–Macaulay of type three, and maps isomorphically to the matching T_{φ,m}. The unrestricted theorem requires Gap M.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

**Proof or construction:**

1. Import global finiteness, presentation and generic-fibre support with these precise local quotients, not an unrestricted local ring containing nonminimal components.
2. The completed tensor product of the type-three eigenvalue ring at p with the O-flat local complete intersections away from p is Cohen–Macaulay of type three. Retain O-Tor independence in this tensor-product step.
3. The global parameter quotient is regular; including π in a parameter system proves O-flatness and preserves the canonical-module type.
4. The surjective map to the matching integral Hecke image is a generic-fibre isomorphism, hence injective by O-flatness.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.7/multiplicity-character-data`, `LocalGaloisDeformationRings:L7/eigenvalue-ring-normal-cm-type-three`, `GlobalGaloisDeformations:R04.3`, `LocalGaloisDeformationRings:R08.2`, `GL2ModularityLifting:R22.4`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Source:** cg18, Proof of Theorem 4.8, pp. 362–365; Lemma 4.11, pp. 364–365. The local type-three singularity accounts for failure of Gorensteinness globally; the nonharmless twisting collision must be excluded or repaired.

**Check:**

- At a norm −1 ramified Steinberg prime use only the unipotent quotient; the unrestricted nonminimal component cannot enter the Hecke comparison.

**Planet:** Scalar Hecke algebra of type three.


### Integral character-twisting identity

**Declaration:** `GL2ModularityLiftingPartII:D1.7/integral-character-twisting` (theorem).

With the matching character-restricted Hecke algebras of the preceding target, the full ordinary algebra satisfies T_m≅T_{1,m}⊗_O O[Φ] integrally. The map sends T_ℓ to T_ℓ⊗[ℓ] for good ℓ, the relevant bad U_x according to their conductor-newvector formulas, and ⟨d⟩ to ⟨d⟩⊗[d]². This assertion uses generation of the full integral image; an isomorphism after inverting p between torsion-free lattices alone does not prove it.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

**Proof or construction:**

1. Construct the map by the universal character twist and check every Hecke generator, including bad U and diamonds.
2. Use squaring on Φ to recover 1⊗[d] from the diamond images and units in T₁; these elements generate O[Φ].
3. Untwist the good generators to recover T_ℓ⊗1; use bad-newvector formulas for the remaining generators. This proves surjectivity.
4. Use the characteristic-zero character decomposition and integral torsion-freeness to prove injectivity.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.7/multiplicity-character-data`, `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Source:** cg18, Proof of Theorem 4.8, pp. 365–366. A generator computation supplies the missing integral step in the printed character argument.

**Check:**

- For Φ=C₃ the diamond squares must recover every group basis element integrally; equality after inverting p is insufficient.

**Planet:** Integral character-twisting identity.


### Scalar-Frobenius multiplicity two

**Declaration:** `GL2ModularityLiftingPartII:D1.7/scalar-multiplicity-two` (theorem).

Under the restricted scalar hypotheses of the type-three target, J₁(N*)[m]≅barρ⊕barρ as k[G_Q]-modules. More generally this conclusion follows whenever the matching full localized ordinary Hecke algebra is finite flat Cohen–Macaulay of type three and the Gross sequence/isotypy hypotheses hold. The general Theorem 4.8 without the restriction is a target blocked by Gap M, rather than an unconditional corollary of the printed generic-fibre identification.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

**Proof or construction:**

1. The group algebra O[Φ] is finite flat Gorenstein; tensoring preserves canonical-module type three. Hence Hom_Zp(T_m,Z_p)/m has residue dimension three.
2. The Gross sequence gives dim_k G⁰[m]=3 and dim_k Gᵉ[m]=1, but m-torsion is only left exact. It yields 3≤dim_k G[m]≤4.
3. Import the Jacobian residual-isotypy theorem from R20.3: at this full non-Eisenstein Hecke ideal, J₁(N*)[m] is a direct sum of copies of the absolutely irreducible barρ. This requires the Jacobian/Eichler–Shimura annihilator input, not merely reconstruction of one rank-two representation over the Hecke ring. Its dimension is even, hence four and the multiplicity is two.
4. Do not assert that the full Tate module is free of rank two over the non-Gorenstein Hecke algebra.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.7/integral-character-twisting`, `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type`, `SerreWeightAndLevelOptimisation:R20.3/gross-ordinary-tate-sequence`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `AutomorphicGaloisRepresentations:R19.6`, `SerreWeightAndLevelOptimisation:R20.3`.

**Source:** cg18, Theorem 4.8 and closing calculation, pp. 361–366. Left exactness plus evenness repairs the torsion calculation while preserving the multiplicity-two conclusion in the matched cases.

**Check:**

- Taking m-torsion yields only the interval 3≤dimension≤4; the evenness of barρ-isotypy must force dimension four.

**Planet:** Scalar-Frobenius multiplicity two.


### Multiplicity-one alternatives and quotient Jacobians

**Declaration:** `GL2ModularityLiftingPartII:D1.7/multiplicity-one-and-quotients` (application).

For the same conductor-minimal residual datum, if barρ is ramified at p, or unramified with nonscalar Frobenius, import the existing multiplicity-one theorem to get J₁(N*)[m]≅barρ. For the smallest diamond quotient J_H(N*) retain the precise Carayol restriction: p≠3 and barρ not induced from Q(√−3), as printed in Remark 4.12. Its scalar branch uses the same matched type-three input and Gap M as above.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.

**Proof or construction:**

1. Import the Gross/Edixhoven/Buzzard/Wiese alternatives through the Serre-weight supplier with their exact residual and level hypotheses.
2. For J_H use the separate diamond-quotient comparison and retain the exceptional-prime/induction exclusion.
3. Apply the scalar multiplicity argument only when its local-global input is established.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.7/multiplicity-character-data`, `GL2ModularityLiftingPartII:D1.7/scalar-multiplicity-two`, `SerreWeightAndLevelOptimisation:R20.3`.

**Source:** cg18, Theorem 4.8 and Remark 4.9, p. 361; Remark 4.12, p. 366. The known multiplicity-one cases and the quotient application are separate from the scalar contribution.

**Check:**

- For the quotient-Jacobian comparison retain the p=3 and Q(√−3)-induction exclusions; do not infer that comparison solely from the full-level theorem.


**Work needed to close this layer:** Gap M: repair the nonharmless self-extension twisting collision for unrestricted multiplicity two. Discharge the restricted conductor-compatible global comparison and CM-type contracts.

## D1.8 — Bianchi deformation and Hecke data

Fix imaginary quadratic F, p≥3 unramified in F and cyclotomic determinant. Specify the S/P/M/H local hypotheses and the minimal flat/ordinary problem, importing its representability and Taylor–Wiles numerology. Specialize PGL₂ arithmetic orbifolds, components, corrected local-type spaces and Hecke images. Define the precise Conjecture A contract for all auxiliary levels as a hypothesis; record the type-P correction and the failure of unrestricted generic rank one.

**Dependencies:** `GlobalGaloisDeformations:R04.3`, `LocalGaloisDeformationRings:R08.2`, `LocalGaloisDeformationRings:R08.4`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

### Minimal Bianchi datum

**Declaration:** `GL2ModularityLiftingPartII:D1.8/bianchi-minimal-datum` (definition).

Fix imaginary quadratic F and p≥3 unramified in F, with O,k as above. Let barρ:G_F→GL₂(k) be continuous, detbarρ=barε, and barρ|G_{F(ζ_p)} absolutely irreducible. At each v|p it is finite flat or ordinary; the minimal lifts are finite flat when barρ is finite flat, and ordinary otherwise. Finite flat means a finite flat group scheme over O_{F_v}, with the given Galois generic fibre. At x∤p where barρ ramifies, after a sufficiently large coefficient extension require exactly the applicable S/P/M/H case: unipotent inertia S; reducible D_x and semisimple inertia ψ⊕ψ⁻¹ P; irreducible D_x, reducible inertia and N(x)≢−1 mod p M; or absolutely irreducible inertia H. Exclude nontrivial quadratic-twisted unipotent inertia unless an additional local type is supplied. R_Q is the imported fixed-ε deformation ring, minimal outside Q, with Q disjoint from ramification and p.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.

**Proof or construction:**

1. Translate the local cases into the existing local deformation-condition interface.
2. Impose the finite-flat precedence at v|p and the fixed cyclotomic determinant.
3. Form the global deformation problem through R04.3, retaining absolute local classification rather than reducibility over a too-small residue field.

**Direct inputs:** `GlobalGaloisDeformations:R04.3`, `LocalGaloisDeformationRings:R08.2`, `LocalGaloisDeformationRings:R08.4`.

**Source:** cg18, §5.1, pp. 368–370; compare Theorem 1.3, p. 302. The local problem, including the missing type restriction in the introduction, must be fixed before choosing automorphic levels.

**Uses:**

- D1.10 Bianchi R = T: The Hecke-valued representation must satisfy exactly this local problem to yield a deformation-ring map.

**API:**

- `BianchiMinimalDatum.localCondition` (data): Return the minimal local condition at each place and its tangent subspace L_{Q,x}.
- `BianchiMinimalDatum.representingRing` (universal-property): Maps R_Q→A correspond to strict-equivalence classes of continuous fixed-ε lifts satisfying these local conditions on all Artinian quotients.
- `BianchiMinimalDatum.augmentation` (compatibility): At a Taylor–Wiles x, the selected eigenline inertia character defines O[Δ_Q]→R_Q; quotient by augmentation is R_min.
- `BianchiMinimalDatum.coefficientMap` (functoriality): Local coefficient maps carry strict-equivalence classes of lifts to lifts with the same fixed determinant and local conditions; the representing-ring equivalence is natural in every Artinian coefficient algebra.

**Unit tests:**

- **finiteFlatBase** (non-example): A group scheme over the global coefficient ring O is not a substitute for a finite flat group scheme over O_{F_v}.
- **flatPrecedence** (non-example): When barρ is both flat and ordinary, an ordinary lift which is not finite flat is excluded from the minimal flat problem.
- **twistedUnipotent** (non-example): A ramified inertia image χ⊗[[1,*],[0,1]] with χ nontrivial quadratic and nonzero extension is neither S nor semisimple P and is rejected.

**Check:**

- A group scheme over the global coefficient ring O is not a substitute for a finite flat group scheme over O_{F_v}.
- When barρ is both flat and ordinary, an ordinary lift which is not finite flat is excluded from the minimal flat problem.
- A ramified inertia image χ⊗[[1,*],[0,1]] with χ nontrivial quadratic and nonzero extension is neither S nor semisimple P and is rejected.

**Planet:** Minimal Bianchi deformation datum.


### Bianchi arithmetic levels and matched types

**Declaration:** `GL2ModularityLiftingPartII:D1.8/bianchi-level-and-type-spaces` (definition).

For G=Res_{F/Q}PGL₂ let Y(K)=G(Q)\G(A)/(K_∞⁰K), using orbifold/group homology on each arithmetic lattice component. Define Γ₀(v^c), Γ₁(v^c), Γ_p(v^c) in PGL₂(O_{F_v}) by normalized matrices [[1,*],[0,d]] modulo v^c, with d arbitrary, d=1 and d of p-power order, respectively. At Q take K_Q=Γ₁(v), L_Q=Γ₀(v); outside Q,Sp take maximal level; at v|p take maximal PGL₂(O_{F_v}) if barρ is flat and Γ₀(v) otherwise; at S take Γ₀(v). For M,H retain Γ_p(v^{a(barρ_v)}). At P the printed Γ_p(v^{2a(ψ)}) is not minimal-type matching: for ψ²≠1 request the Γ₀(v^{a(ψ)}) character type ψ(a/d), and for ψ²=1 request the twisted spherical type ψ∘det on PGL₂(O_{F_v}). Denote by H_i^min the homology after a supplied integral minimal-type projector; the S-only case needs no P correction.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.

**Proof or construction:**

1. Specialize the existing PGL₂ quotient and its finite arithmetic-lattice components, retaining stabilizers.
2. Define Γ-groups on projective matrix classes, so the scalar normalization is well defined.
3. At type P separate the printed level from the corrected local-type spaces. Their integral Hecke/cover/duality compatibility is the explicit supplier request and Gap P; do not silently replace one space by the other.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.8/bianchi-minimal-datum`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Source:** cg18, §§5.2–5.2.1, pp. 371–373; Theorem 1.3, p. 302. The arithmetic space is an orbifold, and its level must match the local deformation problem.

**Uses:**

- Lemma 5.9 and Theorem 5.11: The homology, duality and Taylor–Wiles covers must all be built on this same local-type space.

**API:**

- `BianchiLevel.components` (characterisation): π₀Y(K)=F×\A_{F,f}×/(A_{F,f}×²detK); Hecke operators may permute these components.
- `BianchiLevel.cover` (structure): Normal level inclusions give orbifold covers with their actual deck group; the coefficient homology is group homology even with stabilizers.
- `BianchiLevel.minimalType` (compatibility): The integral type projector, when supplied, commutes with the Q-cover and Hecke correspondences, and selects exactly the prescribed local deformation types in characteristic zero.
- `BianchiLevel.typeComparison` (compatibility): For a supplied integral minimal-type model, specify the comparison with each characteristic-zero local selector and its actual dimension. No canonical integral projector is inferred from characteristic-zero type decomposition alone.

**Unit tests:**

- **projectiveScalar** (comparison): Multiplying a representative matrix by a unit does not change Γ₀,Γ₁ or Γ_p membership after normalizing its upper-left entry.
- **orbifoldTorsion** (non-example): At order-3 stabilizers with p=3, group homology can be nonzero above the manifold dimension; coarse-space homology is not substituted.
- **principalLevel** (non-example): For principal type ψ⊕ψ⁻¹ of a(ψ)=1 and ψ²≠1, Γ_p(v²) admits more than the minimal-type vectors; it is not identified with the corrected type space.

**Check:**

- Multiplying a representative matrix by a unit does not change Γ₀,Γ₁ or Γ_p membership after normalizing its upper-left entry.
- At order-3 stabilizers with p=3, group homology can be nonzero above the manifold dimension; coarse-space homology is not substituted.
- For principal type ψ⊕ψ⁻¹ of a(ψ)=1 and ψ²≠1, Γ_p(v²) admits more than the minimal-type vectors; it is not identified with the corrected type space.

**Planet:** Bianchi arithmetic orbifolds.


### Bianchi Hecke data and residual ideals

**Declaration:** `GL2ModularityLiftingPartII:D1.8/bianchi-hecke-data` (definition).

On H₁(Y₁(Q),O), or on a supplied H₁^min type summand, let T_Q^an be the finite O-image of T_α away from Q∪S∪{v|p}; let T_Q also include operators supported at Q and the relevant diamonds. A residual minimal modularity datum is the assertion that m_∅=(π,T_λ−trbarρ(Frob_λ)) is proper at Q=∅. Extend it by U_x−α_x at Q, using chosen uniformizers; the residual class of U_x is independent of the uniformizer only when the residual diamond character is trivial. An ideal is Eisenstein if T_λ≡2 at almost all primes splitting in one fixed finite abelian extension of F.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.

**Proof or construction:**

1. Use the existing integral Hecke-image construction on the arithmetic homology, not a generic new algebra.
2. For each prime away from the level fix the ideal Hecke operator; for a level prime record the uniformizer dependence through diamonds.
3. Treat properness at minimal level as an input. Residual modularity at some higher level does not supply it.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.8/bianchi-level-and-type-spaces`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `ArithmeticLocallySymmetricSpaces:ALS.3`.

**Source:** cg18, Definition 5.4–5.5 and Remark 5.7, pp. 374–375; §5.4, pp. 378–379. The particular images and ideals express minimal residual modularity without characteristic-zero lifting.

**Uses:**

- Lemma 5.6 and Theorem 5.11: The Galois-representation contract and the patching module refer to precisely these images.

**API:**

- `BianchiHecke.image` (characterisation): T_Q is the image of the displayed operators and includes the Q-diamond action needed for augmentation.
- `BianchiHecke.residualIdeal` (projection): The residue map sends T_λ to trbarρ(Frob_λ) and U_x to the selected α_x; properness is part of the modularity datum.
- `BianchiHecke.uniformizer` (compatibility): Replacing π_x by uπ_x multiplies U_x by the diamond ⟨u⟩, hence preserves its residual eigenvalue exactly when that diamond is residually trivial.
- `BianchiHecke.lift` (universal-property): The represented Hecke image is the abstract operator algebra modulo the kernel of its action on the specified homology. A homomorphism descends exactly when it kills that kernel, and is determined by the displayed operators and diamonds.

**Unit tests:**

- **componentTransfer** (non-example): T_λ on H₀ is degree times a component permutation; it is scalar degree only on preserved components.
- **uniformizerChange** (value): If the residual diamond at u equals c≠1, the residual U_{uπ} eigenvalue is cα, so uniformizer independence is rejected.
- **nonflatImage** (comparison): If localized H₁ is nonzero and killed by π, its Hecke image is allowed to be a finite k-algebra.

**Check:**

- T_λ on H₀ is degree times a component permutation; it is scalar degree only on preserved components.
- If the residual diamond at u equals c≠1, the residual U_{uπ} eigenvalue is cα, so uniformizer independence is rejected.
- If localized H₁ is nonzero and killed by π, its Hecke image is allowed to be a finite k-algebra.

**Planet:** Bianchi Hecke algebra.


### Conjecture A local–global contract

**Declaration:** `GL2ModularityLiftingPartII:D1.8/bianchi-conjecture-a-contract` (definition).

For every Q of Taylor–Wiles primes and every non-Eisenstein residual factor m_Q associated to barρ, ConjectureA(Q,m_Q) asserts an actual continuous ρ_m:G_F→GL₂(T_{Q,m_Q}) lifting barρ with determinant ε, unramified outside SpQ and polynomial X²−T_λX+N(λ) at arithmetic Frobenius away from SpQ. At S inertia is unipotent; at P it is Teich(ψ)⊕Teich(ψ)⁻¹. At x∈Q the invertible T_a define, via geometric Artin reciprocity, a character φ_x residually unramified; when φ_x(Frob_x)≢±1, ρ_m|D_x has the two characters φ_xε and φ_x⁻¹ with the stated normalization. At v|p, barρ finite flat implies ρ_m finite flat, and barρ ordinary implies ρ_m ordinary, with flat precedence in the minimal problem. Require the remaining M,H minimality from the local classification, or explicitly supply it in the matched-type contract. The assumption for patching is this contract for every auxiliary Q, not only Q=∅.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.

**Proof or construction:**

1. Package this statement as a proposition about the particular image algebras; do not claim a proof or weaken to a representation modulo nilpotents.
2. State the local character through the geometric Artin map, and convert the arithmetic Frobenius polynomial with its inverse convention.
3. For corrected type-P spaces require the same compatibility contract on those spaces; its availability is part of Gap P.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.8/bianchi-minimal-datum`, `GL2ModularityLiftingPartII:D1.8/bianchi-hecke-data`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `LocalGaloisDeformationRings:R08.2`.

**Source:** cg18, Conjecture A(1)–(4), pp. 374–375. The Bianchi theorem is conditional on an integral torsion local–global statement at every auxiliary level.

**Uses:**

- Lemma 5.6 and Theorem 5.11: The contract supplies both R_Q→T_Q and the inclusion of diamond actions in the deformation-ring image.

**API:**

- `ConjectureA.representation` (data): Extract the actual continuous rank-two representation over the full localized image.
- `ConjectureA.localAtAuxiliary` (characterisation): Extract the selected inertial diamond character and the two-character local description when the residual eigenvalue is not ±1.
- `ConjectureA.coefficientPrime` (compatibility): The finite-flat and ordinary implications are conditioned on the residual representation; finite flat is over O_{F_v}.
- `ConjectureA.quotient` (compatibility): Base change of a supplied representation to a finite local quotient retains the good-prime polynomials and the specified local identities; keep all Artinian finite-flat conditions. This does not supply the contract at a different auxiliary level Q.

**Unit tests:**

- **nilpotentError** (non-example): A representation only over T/I for a nonzero nilpotent I does not satisfy this contract over T.
- **auxiliaryRange** (non-example): A proof at Q=∅ alone supplies no contract at Q_a and cannot instantiate the patching theorem.
- **residualFlat** (comparison): If barρ is not finite flat but is ordinary at v|p, the contract asks for ordinary compatibility and does not assert an unconditional flat lift.

**Check:**

- A representation only over T/I for a nonzero nilpotent I does not satisfy this contract over T.
- A proof at Q=∅ alone supplies no contract at Q_a and cannot instantiate the patching theorem.
- If barρ is not finite flat but is ordinary at v|p, the contract asks for ordinary compatibility and does not assert an unconditional flat lift.

**Planet:** Conjecture A.


### Conjectural Galois representation generates Hecke

**Declaration:** `GL2ModularityLiftingPartII:D1.8/bianchi-galois-surjection` (theorem).

Assume the Conjecture A contract and minimal residual modularity. For each Q with N(x)≡1 mod p and distinct residual roots α_x,β_x, α_xβ_x=1, there is a surjection R_Q↠T_{Q,m_Q} with the local diamond map agreeing with the selected eigenline inertia character. The corresponding arithmetic traces generate this full selected auxiliary image, not only the anaemic subalgebra.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.

**Proof or construction:**

1. Distinct roots with product one imply α_x≠±1, enabling Conjecture A(3).
2. Use Hensel uniqueness to recover the chosen U_x root from the trace and local determinant.
3. Recover the diamond characters by the local decomposition and reciprocity, then apply the global universal property and topological generation by traces.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.8/bianchi-conjecture-a-contract`, `GlobalGaloisDeformations:R04.3`.

**Source:** cg18, Lemma 5.6, p. 375; §5.4, pp. 379–380. The local auxiliary clause is what upgrades an anaemic trace map to the surjection needed for patching.

**Check:**

- At norm one with distinct residual roots and determinant one the selected α is not ±1, so the derivative needed by Hensel is invertible.


**Work needed to close this layer:** Gap P: provide the integral principal-type model and Conjecture A on those spaces; Conjecture A remains a stated input, not a theorem.

## D1.9 — Bianchi homology and balancedness

Construct p-power diamond covers and coefficient descent. Prove selected-root level comparison, localized boundary vanishing, degree-zero/three vanishing and torsion-freeness of H₂ for p≥5; retain the p=3 stabilizer gap. Apply Poincaré/Borel–Moore duality and low-degree Hochschild–Serre to obtain balanced H₁ over O[Δ].

**Dependencies:** `GL2ModularityLiftingPartII:D1.8`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.6`, `GL2ModularityLiftingPartII:D1.1`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ArithmeticLocallySymmetricSpaces:ALS.2`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `DeformationAndDerivedPatchingAlgebra:R03.5`.

### Bianchi diamond-cover datum

**Declaration:** `GL2ModularityLiftingPartII:D1.9/bianchi-diamond-cover` (construction).

For Q as above set Δ_Q=∏_{x∈Q}(O_F/x)×, choose a p-power quotient Δ, and let Y_Δ(Q)→Y₀(Q) be the associated orbifold cover between Y₁(Q) and Y₀(Q). Put S=O[Δ]. Every finite O[Δ]-module μ gives a local coefficient system on Y₀(Q), and Shapiro identifies H_i(Y₀(Q),S)≅H_i(Y_Δ(Q),O). The chosen Hecke ideal includes U_x−α_x and the residual trivial diamond conditions.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. Use the actual quotient of K/L at the auxiliary places and form the groupoid cover component by component.
2. Identify the regular local system with induced trivial coefficients on each arithmetic lattice.
3. Apply the pinned group-homology Shapiro isomorphism, then assemble the Hecke-compatible component maps. A type projector requires the compatibility supplied in D1.8.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.8/bianchi-level-and-type-spaces`, `GL2ModularityLiftingPartII:D1.8/bianchi-hecke-data`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.6`, `mathlib:groupHomology.indIso`.

**Source:** cg18, §5.3.1, p. 376. The cover and its coefficient system give the finite group-ring module used in the defect-one argument.

**Uses:**

- Proposition 5.10 and Theorem 5.11: Shapiro and diamond descent identify the module and its coinvariants.

**API:**

- `BianchiDiamondCover.deck` (data): Return Δ_Q↠Δ, the normal intermediate level and its deck action.
- `BianchiDiamondCover.shapiro` (equivalence): H_i(Y₀(Q),O[Δ])≅H_i(Y_Δ(Q),O), as S-modules with the same normalized Hecke action.
- `BianchiDiamondCover.change` (functoriality): Quotients Δ↠Δ′ induce the expected covering transfer maps and augmenting to Δ′=1 recovers base level.
- `BianchiDiamondCover.augmentation` (simp): Under the Shapiro equivalence, the map to base level uses the coefficient-sum augmentation S→O: every deck basis element [δ] maps to 1, including in residue characteristic dividing |Δ|.

**Unit tests:**

- **trivialDeck** (degenerate): Δ=1 gives Y_Δ=Y₀ and the identity Shapiro comparison.
- **regularRank** (value): For Δ=C₃, the regular O-module has rank three, even when p=3; it is not replaced by its rank-one coinvariants before descent.
- **nonneatCover** (comparison): A normal lattice cover remains an orbifold cover with deck group Δ even when its map of coarse spaces is ramified.

**Check:**

- Δ=1 gives Y_Δ=Y₀ and the identity Shapiro comparison.
- For Δ=C₃, the regular O-module has rank three, even when p=3; it is not replaced by its rank-one coinvariants before descent.
- A normal lattice cover remains an orbifold cover with deck group Δ even when its map of coarse spaces is ramified.

**Planet:** Bianchi diamond covers.


### Bianchi selected-root comparison

**Declaration:** `GL2ModularityLiftingPartII:D1.9/bianchi-selected-root-comparison` (theorem).

At Taylor–Wiles primes Q with N(x)≡1 mod p and distinct residual roots, the ideal selecting U_x=α_x gives H₁(Y₀(Q),O)_m≅H₁(Y,O)_{m_∅}, compatible with the anaemic Hecke action. The assertion is for the selected local factor and is valid on a supplied compatible minimal-type summand. It does not identify the entire two-copy oldspace with base level.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. Use universal coefficients to dualize H₁ to H¹ with K/O coefficients.
2. Apply the two degeneracy correspondences and the determinant identity with x replaced by N(x); it is a unit at the distinct-root Taylor–Wiles ideal.
3. Eliminate the complementary newspace by the local correspondence identity, then select one root.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.9/bianchi-diamond-cover`, `GL2ModularityLiftingPartII:D1.1/selected-root-oldform-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.3`.

**Source:** cg18, Lemma 5.8, p. 376. The homological level comparison is the Bianchi counterpart of the selected weight-one oldform comparison.

**Check:**

- Before root selection there are two oldform factors; after imposing U_x−α_x the comparison is with one minimal-level module.

**Planet:** Bianchi selected-root comparison.


### Localized Bianchi amplitude and boundary

**Declaration:** `GL2ModularityLiftingPartII:D1.9/bianchi-localized-amplitude` (theorem).

Assume p≥5, the non-Eisenstein residual ideal of D1.8 and finite μ over O[Δ]. Then H₀(Y₀(Q),μ)_m=H₃(Y₀(Q),μ)_m=0 and H_i(Y₀(Q),μ)_m≅H_i^{BM}(Y₀(Q),μ)_m for every i. If μ is O-flat, H₂(Y₀(Q),μ)_m is O-torsion-free. Retain the same assertions on a compatible direct minimal-type summand. For p=3 these claims require localized control of 3-primary stabilizer homology and duality; that extension is Gap O.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. For p≥5 finite stabilizers in these PGL₂ arithmetic lattices have order prime to p (possible torsion element orders are 1,2,3,4,6). Group homology may therefore be computed by the orbifold cellular chains over O. Noncompactness and dimension three give H₃ with residual coefficients zero.
2. H₀ carries degree times a permutation of determinant components; its eigensystems are Eisenstein. Induct on finite coefficient quotients and then use completeness for μ.
3. Boundary components are torus orbifolds; compute their two-character Hecke eigensystems through the Borel–Serre boundary and localize them away. This gives ordinary/Borel–Moore comparison.
4. For O-flat μ, use the homology coefficient exact sequence and H₃(Y,μ/π)_m=0 to deduce H₂(Y,μ)_m[π]=0.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.9/bianchi-diamond-cover`, `ArithmeticLocallySymmetricSpaces:ALS.2`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `ArithmeticLocallySymmetricSpaces:ALS.3`.

**Source:** cg18, Lemma 5.9 and proof, pp. 376–377. The printed dimension argument needs prime-to-p stabilizers; it does not prove the p=3 orbifold assertion.

**Check:**

- At p=3 an order-three stabilizer is a counterexample to the unlocalized manifold argument; the planned p≥5 proof must not invoke it there.

**Planet:** Localized Bianchi amplitude.


### Balanced Bianchi homology

**Declaration:** `GL2ModularityLiftingPartII:D1.9/bianchi-balancedness` (theorem).

Under p≥5 and the preceding level, coefficient and localization hypotheses, M=H₁(Y_Δ(Q),O)_m is a finite balanced S=O[Δ]-module. Explicitly, with r=rank_O M_Δ, d_S(M)=r−dim_k(Tor₁^S(M,O)/π)≥0. If p=3 the same implication holds after supplying the localized vanishing and duality missing in Gap O.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. Hochschild–Serre gives Tor_i^S(H_j(Y_Δ,O)_m,O)⇒H_{i+j}(Y₀,O)_m. H₀=0 gives M_Δ≅H₁(Y₀,O)_m and H₂(Y_Δ,O)_{m,Δ}→H₂(Y₀,O)_m→Tor₁^S(M,O)→0.
2. The preceding theorem makes H₂(Y₀,O)_m O-free. Poincaré duality and ordinary/Borel–Moore comparison give its rank equal to rank H₁(Y₀,O)_m. Track the dual Hecke ideal: for PGL₂ the inverse correspondence differs only by the matching trivial-central-character normalization.
3. Apply the low-degree Tor dimension formula from the imported balanced-module API; the right-exact segment bounds Tor₁/π by r.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.9/bianchi-diamond-cover`, `GL2ModularityLiftingPartII:D1.9/bianchi-localized-amplitude`, `DeformationAndDerivedPatchingAlgebra:R03.5/balanced-modules`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `ArithmeticLocallySymmetricSpaces:ALS.6`.

**Source:** cg18, Proposition 5.10, pp. 377–378. Balancedness follows from two neighboring homology degrees and integral torsion control.

**Check:**

- At Δ=1 recover the O-module defect identity. At general Δ retain the right-exact Tor edge sequence and its H₂ rank bound.

**Planet:** Balanced Bianchi homology.


**Work needed to close this layer:** Gap O: prove the localized 3-primary stabilizer vanishing and duality; supply compatible principal types through Gap P.

## D1.10 — Conditional Bianchi R = T and lifting

Using Conjecture A at every Taylor–Wiles level, the exact dual-Selmer presentation and balanced Bianchi homology, deduce minimal R = T and freeness. Prove the dimension-zero complete-intersection consequence. State generic rank by the actual local invariant dimensions and rank one at S-only minimal levels. Deduce the minimal semistable modularity theorem for p≥5 and retain explicit targets for p=3 and corrected type-P coefficients. Explain the GL/PGL class-group obstruction without presenting the paper’s heuristic GL example as a theorem.

**Dependencies:** `GL2ModularityLiftingPartII:D1.8`, `GL2ModularityLiftingPartII:D1.9`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `GlobalGaloisDeformations:R04.6`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `AutomorphicGaloisRepresentations:R19.4`, `AutomorphicGaloisRepresentations:R19.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

### Bianchi Taylor–Wiles system

**Declaration:** `GL2ModularityLiftingPartII:D1.10/bianchi-patching-system` (construction).

For the Bianchi minimal datum, let q=dim_k H¹_∅(F,ad⁰barρ(1)), which is at least one. For each a≥1 choose Q_a with |Q_a|=q, norms 1 mod p^a and distinct residual roots, killing this dual Selmer group. With Δ_a=(Z/p^aZ)^q, S_a=O[Δ_a], A_∞=O[[z₁,…,z_{q−1}]], let H_a=H₁(Y_{Δ_a}(Q_a),O)_{m_a} and H=H₁(Y,O)_{m_∅}. Assume Conjecture A for all Q_a and p≥5, or supply the missing localized p=3 amplitude/duality. With compatible minimal-type summands when needed, this is a balanced patching system: H_a,Δ_a≅H, diamond images lie in the A_∞ image, and augmentation specializes R_{Q_a} to R_min.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. Import the imaginary-quadratic tangent bound dim t_{R_Q}≤dim dualSelmer−1+Σ_{x∈Q}dim H⁰(F_x,ad⁰barρ(1)) and the simultaneous prime-selection theorem from R04.3/R04.5/R04.6.
2. Choose the q−1-variable surjections onto R_{Q_a}, then act on H_a through the Conjecture A surjections.
3. Use localized H₀=0 and Hochschild–Serre for coinvariants, followed by the selected-root comparison.
4. Use Conjecture A(3) and the geometric-Artin diamond comparison for the scalar-image and augmentation conditions.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.8/bianchi-galois-surjection`, `GL2ModularityLiftingPartII:D1.9/bianchi-selected-root-comparison`, `GL2ModularityLiftingPartII:D1.9/bianchi-balancedness`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `GlobalGaloisDeformations:R04.6`, `tauceti:TauCeti.MonoidAlgebra.augmentation`.

**Source:** cg18, Propositions 5.1–5.2, pp. 370–371; proof of Theorem 5.11, pp. 379–380. The dual Selmer group has the Tate twist missing in the displayed q on p. 379.

**Uses:**

- Theorem 5.11: This supplies every hypothesis of the imported balanced patching theorem in the Bianchi arithmetic setting.

**API:**

- `BianchiPatchingSystem.level` (data): Return Q_a, the surjection Δ_{Q_a}↠Δ_a, H_a and its commuting A_∞ and S_a actions.
- `BianchiPatchingSystem.coinvariants` (equivalence): H_a⊗_{S_a}O≅H equivariantly, after localizing the chosen U-roots.
- `BianchiPatchingSystem.diamond` (compatibility): The group-ring action is induced by the selected Galois inertial characters, and augmentation gives the fixed-determinant minimal problem.
- `BianchiPatchingSystem.coefficientChange` (compatibility): Keep finite-coefficient and deck-quotient transition maps compatible with the chosen U_x factors and A_∞ action; the base H is the same minimal-level module for every patching index.

**Unit tests:**

- **tateTwist** (non-example): The variable count uses H¹_dual(ad⁰barρ(1)), not the untwisted adjoint Selmer group printed at p. 379.
- **zeroDualSelmer** (non-example): q=0 is excluded by the tangent bound and existence of R_min; A_∞ is not assigned a negative number of variables.
- **selectedCoinvariants** (comparison): Coinvariants recover the selected H₁(Y₀(Q_a)) factor and then H; using the entire two-copy oldspace gives the wrong rank.

**Check:**

- The variable count uses H¹_dual(ad⁰barρ(1)), not the untwisted adjoint Selmer group printed at p. 379.
- q=0 is excluded by the tangent bound and existence of R_min; A_∞ is not assigned a negative number of variables.
- Coinvariants recover the selected H₁(Y₀(Q_a)) factor and then H; using the entire two-copy oldspace gives the wrong rank.

**Planet:** Bianchi patching system.


### Conditional minimal Bianchi R = T

**Declaration:** `GL2ModularityLiftingPartII:D1.10/minimal-bianchi-rt` (theorem).

Assume the Bianchi minimal datum, proper residual minimal ideal, Conjecture A for every auxiliary Q and p≥5. At levels with no P primes, the map R_min→T_{m_∅} is an isomorphism and H₁(Y,O)_{m_∅} is nonzero finite free over it. The corrected minimal-type version with P primes has the same conclusion provided its integral projector/Hecke/duality/Conjecture A package is supplied (Gap P). The intended p=3 theorem requires Gap O to be resolved. O-flatness of H or T is not an assumption.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. Apply the balanced patching engine to the exact Bianchi system.
2. Use the surjective deformation-to-Hecke map and positive-rank freeness to identify their faithful action images.
3. Keep the coefficient-type and stabilizer hypotheses explicit in both the module and ring statements.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.10/bianchi-patching-system`, `DeformationAndDerivedPatchingAlgebra:R03.5/balanced-module-patching-theorem`.

**Source:** cg18, Theorem 5.11, pp. 379–380; Theorem 1.3, p. 302. The minimal theorem is conditional on the full integral Galois contract, with two independent geometric/local-level qualifications.

**Check:**

- A proper minimal residual ideal with purely torsion H₁ remains admissible. Conjecture A must be assumed on every Taylor–Wiles level.

**Planet:** Minimal Bianchi R = T.


### Dimension-zero Bianchi complete intersection

**Declaration:** `GL2ModularityLiftingPartII:D1.10/bianchi-dimension-zero-ci` (theorem).

Under the hypotheses of the Bianchi R = T target, if dim T_m=0, then T_m is a complete intersection. The patching presentation is T_m≅O[[z₁,…,z_{q−1}]]/(f₁,…,f_q); its regular ambient ring has dimension q and the ideal is m-primary, so f₁,…,f_q form a regular sequence. This does not say that every positive-dimensional T_m is a complete intersection.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. Keep the q augmentation equations in the conclusion of the balanced patching proof.
2. Dimension zero makes them a parameter system in the q-dimensional regular local ambient ring.
3. Apply the requested regular-local/CM parameter-sequence criterion.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.10/minimal-bianchi-rt`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Source:** cg18, Closing remarks after Theorem 5.11, p. 380. The codimension-one presentation yields a complete intersection only in this dimension-zero case.

**Check:**

- When q=1 the ambient ring is O and the dimension-zero quotient has one parameter equation; the argument does not assert the positive-dimensional case.

**Planet:** Dimension-zero complete intersection.


### Bianchi generic rank with local multiplicities

**Declaration:** `GL2ModularityLiftingPartII:D1.10/bianchi-generic-rank` (comparison).

If H₁(Y,O)_m[1/p]≠0 under the Bianchi R = T hypotheses, its free rank equals the contribution of the characteristic-zero automorphic representation at the actual chosen finite-level type spaces. In the S-only Γ₀ minimal-level situation each local factor is one-dimensional and the free rank is one. At printed Γ_p levels for P/M/H there can be a prime-to-p diamond orbit of several local vectors, so global automorphic multiplicity one does not imply module rank one. For corrected types, rank one needs a separately verified one-dimensional type/newvector selector.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. Decompose characteristic-zero homology by cuspidal automorphic representations and the degree-one cohomology at infinity.
2. Apply global multiplicity one, then retain dim π_f^K or its type-selected analogue rather than replacing it by one.
3. Use the exact local invariant calculation at each place; Γ_p/Γ₁ retains prime-to-p diamond multiplicities.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.10/minimal-bianchi-rt`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

**Source:** cg18, Theorem 1.3, p. 302; remarks after Theorem 5.11, p. 380. The printed generic rank-one assertion needs minimal local newvector spaces, beyond global multiplicity one.

**Check:**

- At a printed M or H Γ_p level with a nontrivial prime-to-p diamond orbit, keep its invariant-space dimension instead of replacing it by one.


### Minimal semistable Bianchi modularity lifting

**Declaration:** `GL2ModularityLiftingPartII:D1.10/minimal-semistable-bianchi-lifting` (application).

Let p≥5 be unramified in imaginary quadratic F. Assume Conjecture A for all auxiliary levels. Let ρ:G_F→GL₂(O) be continuous, determinant ε, unramified outside finitely many places, semistable at every finite place (unipotent inertia away from p), and at each v|p finite flat or ordinary. Suppose barρ|G_{F(ζ_p)} is absolutely irreducible, barρ occurs in mod-p homology at its minimal level N(barρ), and ρ satisfies the minimal local conditions including finite-flat precedence. Then ρ is associated to a regular algebraic cuspidal GL₂/F representation π with matching unramified local factors and L-function under the fixed normalization. At p=3 the stated target additionally depends on Gap O.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. The lift defines an O-point of the minimal deformation ring; semistability away from p uses only the S-type part of the local classification.
2. R = T produces a characteristic-zero cuspidal Hecke class; non-Eisenstein localization and the automorphic/cohomological comparison exclude boundary classes.
3. Compare the associated Galois representation with ρ by Frobenius density and residual absolute irreducibility; use local compatibility for the bad factors.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.10/minimal-bianchi-rt`, `GL2ModularityLiftingPartII:D1.8/bianchi-minimal-datum`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `AutomorphicGaloisRepresentations:R19.4`, `AutomorphicGaloisRepresentations:R19.5`.

**Source:** cg18, Theorem 1.2, p. 301; Theorem 1.3, p. 302; §5.4, pp. 378–380. The modularity input is a minimal-level torsion class, not a characteristic-zero eigenform.

**Check:**

- Residual modularity must occur at N(barρ), and an ordinary lift of a flat residual representation must satisfy the minimal flat condition.


### GL/PGL class-group obstruction

**Declaration:** `GL2ModularityLiftingPartII:D1.10/gl-pgl-class-group-obstruction` (application).

PGL₂ removes the odd p-primary unramified central-character twists that would remain in the same residual GL₂ Hecke factor. If such twists are modeled by a cyclic C_p, their universal character algebra O[C_p] has O-rank p and cannot be the image of the scalar coefficient map O→O[C_p]. This algebraic obstruction explains the source’s expected GL example; no unconditional automorphic isomorphism T=O[C_p] is asserted. In a GL ray-class replacement, for a class a of order h=p^b with a^h=(α), splitting the ray-class extension requires the h-th-power Kummer condition α^{(N(x)−1)/h}≡1 at primes with h|N(x)−1, equivalently the corresponding splitting in F(α^{1/h},ζ_h). A p-th-power condition alone is insufficient when b>1.

**Hypotheses:**

- O is the ring of integers in a finite extension of Q_p, p≥3, with uniformizer π, fraction field K and finite residue field k; all CNL maps are continuous local O-algebra maps inducing the identity on k.
- F is imaginary quadratic, p is unramified in F, detbarρ=barε and barρ|G_{F(ζ_p)} is absolutely irreducible; the local S/P/M/H and coefficient hypotheses of D1.8 apply.
- Geometric vanishing and duality are proved here for p≥5; use at p=3 needs Gap O. A corrected P-type summand needs Gap P and all its Hecke/cover/duality compatibilities.

**Proof or construction:**

1. The residual p-power characters are all trivial modulo π, so localization does not separate them.
2. The PGL determinant-component quotient is modulo squares; p odd removes the p-primary central twisting contribution.
3. For the proposed GL alternative, compute the order-h lifting relation in the ray class extension; verify the required Kummer exponent is h and note that the source gives only a sketch of this alternative.

**Direct inputs:** `GL2ModularityLiftingPartII:D1.8/bianchi-hecke-data`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `ArithmeticLocallySymmetricSpaces:ALS.0`.

**Source:** cg18, §5.5 and Remark 5.12, pp. 380–382. The fixed-determinant PGL choice avoids a genuine character obstruction; the suggested GL repair is not a proved extension theorem.

**Check:**

- For a class of order p², the p-th-power residue condition is insufficient; use the p²-th-power splitting criterion.


**Work needed to close this layer:** Resolve Gap O for the p=3 extension and Gap P for principal primes. Verify local type dimension before asserting generic rank one.

## Supplier contracts

Each stage citation below is an open contract with its existing mathematical owner. Exact existing nodes above are used directly. This list does not assign new generic foundations to the present roadmap.

### AlgebraicModularFormsAndSerreWeights:R15.1

Supply conductor and fine-rigidified Katz modular curves, Hodge bundle, cusp ideal and Kodaira–Spencer Ω¹=ω²(−C), with genuine small-level descent. Verify the Remark 3.10 harmless-prime repair on cohomology: distinct roots give one chosen old copy, repeated roots two copies, and the arithmetic conductor module is recovered without descending a nonexistent coarse Hodge bundle. For G-equivariant finite covers provide sheaf pushforward/invariants, finite étale descent and tame-cusp completed rings used by the coefficient bundles. For removal of r, include exact invariants for Γ₁(r)→Γ₀(r), the common-fine-refinement comparison with base conductor N, and transport of correspondence identities; the comparison algebra omits U_r. Supply coherent Cartan–Leray descent for the compactified finite étale p-power diamond cover and Hodge sheaf, including the first-quadrant cohomology spectral sequence, finite/divisible coefficient compatibility, commuting normalized Hecke action and the low-degree Tor sequence after Pontryagin duality. This modular-curve coherent input is owned here; ALS.6 supplies the distinct orbifold/group-homology cover theorem.

**Consumers:** `GL2ModularityLiftingPartII:D1.0/weight-one-level-data`, `GL2ModularityLiftingPartII:D1.5/vexing-coefficient-bundles`, `GL2ModularityLiftingPartII:D1.5/bundle-local-freeness-base-change`, `GL2ModularityLiftingPartII:D1.1/oldform-degeneracy`, `GL2ModularityLiftingPartII:D1.1/harmless-prime-comparison`, `GL2ModularityLiftingPartII:D1.1/coherent-cover-descent`.

### GlobalGaloisDeformations:R04.5

Supply CG18 Propositions 3.3 and 5.2 prime selection: q=dim dualSelmer(ad⁰barρ(1))≥1, exactly q primes with norm 1 mod p^a and distinct roots, killing the dual Selmer group under the stated cyclotomic absolute irreducibility hypotheses. Also supply the harmless fine-level prime of Remark 3.10 using the full residual field and cyclotomic character. Do not substitute an unstated adequacy hypothesis.

**Consumers:** `GL2ModularityLiftingPartII:D1.0/weight-one-level-data`, `GL2ModularityLiftingPartII:D1.4/weight-one-patching-system`, `GL2ModularityLiftingPartII:D1.10/bianchi-patching-system`.

### LocalGaloisDeformationRings:R08.2

Supply representable minimal away-p local conditions, their dimensions and base change, fixed Teichmüller inertial images and the rank-one-invariant-line condition of CG18 Definition 3.1. For Bianchi supply the absolute S/P/M/H classification and the fixed-ε local implications for M,H, including why the excluded norm −1 cases are not silently admitted. For multiplicity use conductor-compatible quotients; residual ramified Steinberg at norm −1 requires the Steinberg/unipotent quotient, not the unrestricted ring.

**Consumers:** `GL2ModularityLiftingPartII:D1.0/weight-one-level-data`, `GL2ModularityLiftingPartII:D1.3/weight-one-galois-representation`, `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-lifting`, `GL2ModularityLiftingPartII:D1.5/vexing-level-data`, `GL2ModularityLiftingPartII:D1.7/multiplicity-character-data`, `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type`, `GL2ModularityLiftingPartII:D1.8/bianchi-minimal-datum`, `GL2ModularityLiftingPartII:D1.8/bianchi-conjecture-a-contract`.

### IntegralHeckeAndGaloisDeterminants:IHG.2

Use the current upstream IntegralHeckeAndGaloisDeterminants IHG.2 algebra-image, annihilator and finite-local-factor API for finite torsion modules and their complete inverse limits, including nonflat images and coefficient quotient comparisons. This request imports the existing upstream roadmap rather than replanning those generic objects.

**Consumers:** `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-data`, `GL2ModularityLiftingPartII:D1.2/ordinary-image-algebras`, `GL2ModularityLiftingPartII:D1.8/bianchi-hecke-data`.

### AlgebraicModularFormsAndSerreWeights:R15.2

Supply q-expansion injectivity at all required cusps/components over O/π^m and K/O; normalized T_x,V_x,U_x,W_x, pullback/trace formulas and their bad-prime newvector comparison. In the finite torsion rank-one argument show that Hasse multiplication respects U_x and high-weight conductor minimality identifies its Frobenius scalar integrally.

**Consumers:** `GL2ModularityLiftingPartII:D1.0/weight-one-hecke-data`, `GL2ModularityLiftingPartII:D1.0/coherent-boundary-vanishing`, `GL2ModularityLiftingPartII:D1.1/oldform-degeneracy`, `GL2ModularityLiftingPartII:D1.2/hasse-doubling-map`, `GL2ModularityLiftingPartII:D1.4/no-vexing-rank-one`, `GL2ModularityLiftingPartII:D1.5/type-hecke-correspondences`, `GL2ModularityLiftingPartII:D1.7/integral-character-twisting`.

### ArithmeticLocallySymmetricSpaces:ALS.6

Supply Hochschild–Serre for finite normal orbifold covers with the exact low-degree Tor edge maps, Hecke and coefficient compatibility, using group homology at non-neat levels.

**Consumers:** `GL2ModularityLiftingPartII:D1.9/bianchi-diamond-cover`, `GL2ModularityLiftingPartII:D1.9/bianchi-balancedness`.

### AlgebraicModularFormsAndSerreWeights:R15.3

Supply Hasse sections/powers with q-expansion 1 modulo π^m for large n≡1, compatibility with U and diamonds, theta-kernel vanishing on weight-one forms in characteristic p, and the q-expansion V_p formula. No construction of Hasse/Igusa/theta is repeated in this Part II.

**Consumers:** `GL2ModularityLiftingPartII:D1.2/hasse-doubling-map`, `GL2ModularityLiftingPartII:D1.2/ordinary-projection-injective`.

### AutomorphicGaloisRepresentations:R19.5

Supply high-weight ordinary projector/local triangular representation with unramified quotient λ(U_p) and subcharacter ε^{n−1}λ(⟨p⟩/U_p). The subcharacter becomes unramified only after ε^{n−1}=1 modulo the chosen coefficient quotient. Supply the local finite-flat/ordinary compatibility needed for the characteristic-zero Bianchi lifting conclusion.

**Consumers:** `GL2ModularityLiftingPartII:D1.2/ordinary-projection-injective`, `GL2ModularityLiftingPartII:D1.2/ordinary-image-algebras`, `GL2ModularityLiftingPartII:D1.3/scalar-local-comparison`, `GL2ModularityLiftingPartII:D1.3/three-unramified-cases`, `GL2ModularityLiftingPartII:D1.10/minimal-semistable-bianchi-lifting`, `GL2ModularityLiftingPartII:D1.2/quadratic-doubling`.

### AutomorphicGaloisRepresentations:R19.6

Supply actual continuous integral high-weight/ordinary Hecke-valued GL₂ representations, including nilpotents and finite-coefficient specializations, over the anaemic image and adjoining the selected Frobenius eigenvalue. Use residual absolute irreducibility for reconstruction and Frobenius-trace uniqueness. This is not a request to prove Bianchi Conjecture A, which remains an explicit hypothesis.

**Consumers:** `GL2ModularityLiftingPartII:D1.2/ordinary-image-algebras`, `GL2ModularityLiftingPartII:D1.3/scalar-local-comparison`, `GL2ModularityLiftingPartII:D1.3/three-unramified-cases`, `GL2ModularityLiftingPartII:D1.6/type-weight-one-galois`, `GL2ModularityLiftingPartII:D1.7/scalar-multiplicity-two`, `GL2ModularityLiftingPartII:D1.2/quadratic-doubling`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Import current ClassFieldTheory Layer 7: its geometricArtinMap is the inverse normalization of the arithmetic map. State the conversion on units and uniformizers for the eigenline/diamond characters of CG18; never equate arithmetic and geometric Frobenius without inversion.

**Consumers:** `GL2ModularityLiftingPartII:D1.3/global-doubling-ideal`, `GL2ModularityLiftingPartII:D1.3/weight-one-galois-representation`, `GL2ModularityLiftingPartII:D1.8/bianchi-conjecture-a-contract`.

### AutomorphicGaloisRepresentations:R19.4

Supply Carayol/Langlands compatibility with monodromy, determinant and exact conductor, on high-weight Hecke images before descent. In particular recover bad U_x as Frobenius on the invariant line, including wildly ramified reducible residual cases, and verify the fixed vexing inertial type and auxiliary eigencharacter.

**Consumers:** `GL2ModularityLiftingPartII:D1.3/weight-one-galois-representation`, `GL2ModularityLiftingPartII:D1.4/no-vexing-rank-one`, `GL2ModularityLiftingPartII:D1.6/type-weight-one-galois`, `GL2ModularityLiftingPartII:D1.10/minimal-semistable-bianchi-lifting`.

### GlobalGaloisDeformations:R04.3

Supply the fixed-determinant global CNL deformation rings with exact minimal conditions and quotient by the auxiliary inertia augmentation. For weight one use CG18 Definition 3.1: unramified outside SQ (including p), Teichmüller determinant, fixed inertial image at vexing primes and a rank-one invariant direct summand at ramified reducible primes; the other nonvexing local cases use the existing minimal-condition classification. For Bianchi use the S/P/M/H and finite-flat-precedence datum in D1.8. Supply trace-generation, tangent/obstruction comparison and the finite-over-O global presentation used in the scalar multiplicity calculation; prove the unramified-at-p characteristic-zero infinitesimal-rigidity implication from the class-field input.

**Consumers:** `GL2ModularityLiftingPartII:D1.3/weight-one-galois-representation`, `GL2ModularityLiftingPartII:D1.4/weight-one-patching-system`, `GL2ModularityLiftingPartII:D1.4/minimal-complete-local-finite-image`, `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type`, `GL2ModularityLiftingPartII:D1.8/bianchi-minimal-datum`, `GL2ModularityLiftingPartII:D1.8/bianchi-galois-surjection`, `GL2ModularityLiftingPartII:D1.10/bianchi-patching-system`.

### GlobalGaloisDeformations:R04.6

Supply the defect-one numerical specializations CG18 Propositions 3.2 and 5.1: over Q the tangent dimension equals dualSelmer−1+ΣH⁰(ad⁰barρ(1)); over imaginary quadratic F the corresponding bound is ≤ that expression, using flat/ordinary tangent spaces at p and complex-place contribution −3. After killing dual Selmer, give O[[q−1 variables]]↠R_Q. These are arithmetic numerology inputs, not new patching theorems.

**Consumers:** `GL2ModularityLiftingPartII:D1.4/weight-one-patching-system`, `GL2ModularityLiftingPartII:D1.10/bianchi-patching-system`.

### GL2AutomorphicRepresentationsAndTransfer:R16.2

Supply the exact CDT Lemma 5.1.1 minimal-type selector for W_σ* and all local conductor/newvector/U_x formulas. For Bianchi principal types distinguish Γ_p(v^{2aψ}) from the half-exponent ψ-type and handle ψ²=1 by the twisted spherical type. Give integral prime-to-p character projectors and their duals, their dimensions, and the Γ_p prime-to-p diamond multiplicity at M,H; no rank-one claim follows from global multiplicity one alone.

**Consumers:** `GL2ModularityLiftingPartII:D1.4/no-vexing-rank-one`, `GL2ModularityLiftingPartII:D1.5/vexing-level-data`, `GL2ModularityLiftingPartII:D1.6/type-weight-one-galois`, `GL2ModularityLiftingPartII:D1.7/multiplicity-character-data`, `GL2ModularityLiftingPartII:D1.7/integral-character-twisting`, `GL2ModularityLiftingPartII:D1.8/bianchi-level-and-type-spaces`, `GL2ModularityLiftingPartII:D1.10/bianchi-generic-rank`.

### AutomorphicGaloisRepresentations:R19.1

Supply the Deligne–Serre finite-image representation of characteristic-zero weight-one forms and its Hecke trace/determinant normalization. It is used only after producing a characteristic-zero system, not to assert that every torsion Katz form lifts.

**Consumers:** `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-lifting`, `GL2ModularityLiftingPartII:D1.6/vexing-minimal-finite-image`.

### GL2AutomorphicRepresentationsAndTransfer:R16.6

Supply the geometric/coherent/classical weight-one dictionary at exact conductor and the Bianchi degree-one cuspidal cohomology dictionary with coefficient field and L-factor normalization; use the existing R16.6 weight-one comparison, and keep characteristic-zero Bianchi local invariant dimensions visible.

**Consumers:** `GL2ModularityLiftingPartII:D1.4/minimal-weight-one-lifting`, `GL2ModularityLiftingPartII:D1.6/minimal-vexing-weight-one-rt`, `GL2ModularityLiftingPartII:D1.10/bianchi-generic-rank`, `GL2ModularityLiftingPartII:D1.10/minimal-semistable-bianchi-lifting`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

Import current ClassFieldTheory Layer 12 ray-class reciprocity and finiteness for number fields. Deduce that a Z_p-extension unramified at all p-adic places and ramified at only finitely many primes away from p is trivial (the permitted local unit p-parts and class group are finite). Supply the order-h Kummer criterion for splitting the GL ray-class extension when h is a p-power.

**Consumers:** `GL2ModularityLiftingPartII:D1.4/minimal-complete-local-finite-image`, `GL2ModularityLiftingPartII:D1.6/vexing-minimal-finite-image`, `GL2ModularityLiftingPartII:D1.10/gl-pgl-class-group-obstruction`.

### GL2AutomorphicRepresentationsAndTransfer:R16.4

Supply GL₂ global multiplicity one and contragredients with exact finite-level invariant/type multiplicities. For the type-bundle rank equality identify the σ and σ* generic spaces at inverse-diamond residual ideals; for Bianchi retain dim π_f^K and the trivial-central-character PGL₂ normalization.

**Consumers:** `GL2ModularityLiftingPartII:D1.6/type-balancedness`, `GL2ModularityLiftingPartII:D1.6/minimal-vexing-weight-one-rt`, `GL2ModularityLiftingPartII:D1.10/bianchi-generic-rank`.

### GL2ModularityLifting:R22.4

Supply the scalar ordinary weight-two eigenvalue-adorned global generic-fibre R̃_φ=T_{φ,m} comparison and component support with the exact conductor-compatible local rings of D1.7; global finiteness and framed parameter presentation are required. Exclude the nonharmless ramified unramified-character self-extension case until Gap M is repaired; the printed twist normalization need not be injective there.

**Consumers:** `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type`.

### DeformationAndDerivedPatchingAlgebra:R03.3

Supply Cohen–Macaulay type, canonical modules for finite flat Z_p-algebras, preservation of type under regular sequences and O-Tor-independent completed tensor products with complete intersections. Require at least one O-flat factor where needed. For the Bianchi dimension-zero consequence supply the regular-local parameter-sequence criterion and track the q augmentation equations.

**Consumers:** `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type`, `GL2ModularityLiftingPartII:D1.7/scalar-multiplicity-two`, `GL2ModularityLiftingPartII:D1.10/bianchi-dimension-zero-ci`.

### SerreWeightAndLevelOptimisation:R20.3

Supply the exact known multiplicity-one cases of CG18 Remark 4.9 and the Carayol diamond-quotient comparison for Remark 4.12, with its p≠3 and Q(√−3)-induction exclusions. The new scalar type-three argument is owned by this Part II. Also supply Jacobian residual isotypy at the full non-Eisenstein ideal m: J₁(N*)[m] is a direct sum of barρ, with the Eichler–Shimura annihilator/Galois-module argument at this exact level and ideal. Rank-two Hecke-valued reconstruction by itself does not imply this assertion for all Jacobian m-torsion.

**Consumers:** `GL2ModularityLiftingPartII:D1.7/multiplicity-one-and-quotients`, `GL2ModularityLiftingPartII:D1.7/scalar-multiplicity-two`.

### LocalGaloisDeformationRings:R08.4

Supply the flat/ordinary local deformation functors on all Artinian quotients over the unramified Bianchi coefficient-prime fields, finite flat over O_{F_v}, including the precedence of flat residual conditions and the tangent inequality used in CG18 Proposition 5.1. Import bounded-height geometry from its owner; do not infer this finite torsion condition from characteristic-zero points alone.

**Consumers:** `GL2ModularityLiftingPartII:D1.8/bianchi-minimal-datum`.

### ArithmeticLocallySymmetricSpaces:ALS.0

Supply the PGL₂ imaginary-quadratic symmetric-space quotient, finite arithmetic-lattice decomposition, determinant-component quotient and Hecke component permutations, with finite stabilizers retained. The scalar matrix centre is removed before the quotient is formed.

**Consumers:** `GL2ModularityLiftingPartII:D1.8/bianchi-level-and-type-spaces`, `GL2ModularityLiftingPartII:D1.10/gl-pgl-class-group-obstruction`.

### ArithmeticLocallySymmetricSpaces:ALS.1

Supply local systems from finite integral O[Δ]-modules, group/orbifold chain homology and universal coefficients, with compact support and Borel–Moore comparisons. Do not replace group homology at non-neat level by coarse singular homology at p-torsion stabilizers.

**Consumers:** `GL2ModularityLiftingPartII:D1.8/bianchi-level-and-type-spaces`, `GL2ModularityLiftingPartII:D1.9/bianchi-diamond-cover`.

### ArithmeticLocallySymmetricSpaces:ALS.3

Supply normalized transfer/conjugation/pushforward Hecke correspondences on groupoid chains, their determinant-component action and compatibility with local coefficients, Q-covers, boundary and type projectors; compute the two local degeneracy relations needed in Lemma 5.8.

**Consumers:** `GL2ModularityLiftingPartII:D1.8/bianchi-hecke-data`, `GL2ModularityLiftingPartII:D1.9/bianchi-selected-root-comparison`, `GL2ModularityLiftingPartII:D1.9/bianchi-localized-amplitude`.

### ArithmeticLocallySymmetricSpaces:ALS.2

Supply the Borel–Serre compactification and boundary triangle for these arithmetic lattices, boundary tori/torus orbifolds and their Hecke actions. Compute the boundary two-character eigensystems; at p=3 retain stabilizer terms instead of using the manifold theorem.

**Consumers:** `GL2ModularityLiftingPartII:D1.9/bianchi-localized-amplitude`.

### ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality

Supply finite-level Poincaré/ordinary–Borel–Moore duality and Hecke adjoints for the oriented PGL₂ three-dimensional orbifolds when stabilizers have order prime to p. Establish the inverse-correspondence PGL normalization identifying the dual residual ideal. An extension at p=3 requires Gap O, not a blanket neatness assumption.

**Consumers:** `GL2ModularityLiftingPartII:D1.9/bianchi-localized-amplitude`, `GL2ModularityLiftingPartII:D1.9/bianchi-balancedness`.

## Mathematical gaps

### Gap M — nonharmless twisting collision in scalar multiplicity

At x≡1 mod p with a ramified nonsplit self-extension of an unramified residual character, the determinant-normalizing ψ^{-1/2} twist can identify two distinct conductor-minimal characteristic-zero automorphic lifts (the ψ and ψ^{-1} choices). Thus the printed fixed-determinant generic-fibre map in Theorem 4.8, p. 363, need not be injective. To obtain the unrestricted multiplicity-two theorem, construct the conductor≤1 local deformation ring with variable p-primary inertial determinant over the local diamond algebra, patch that ring/module with its matching types, and prove its Cohen–Macaulay type is still three after the global parameter quotient. The source proves none of these repairs. D1.7 gives the matched restricted version and the general theorem as an unresolved target. Extraction lead: PAPER-CALEGARI-GERAGHTY-18/E85; this plan does not certify the general statement.

**Consumers:** `GL2ModularityLiftingPartII:D1.7/scalar-global-cm-type`, `GL2ModularityLiftingPartII:D1.7/scalar-multiplicity-two`, `GL2ModularityLiftingPartII:D1.7/multiplicity-one-and-quotients`.

### Gap O — localized 3-primary orbifold homology

At p=3 the fixed arithmetic levels can have order-three stabilizers; group/orbifold H₃ is not zero merely because the coarse quotient is a noncompact three-manifold. Prove the 3-primary Farrell/stabilizer homology vanishes at the selected residual ideals and establish the resulting localized boundary/duality package compatibly at all Taylor–Wiles levels. A possible approach is to identify its Hecke systems as induced from F(ζ₃), then use the absolute irreducibility after restriction hypothesis; that identification is not proved here. Non-Eisensteinness alone does not exclude irreducible induced systems, and the fixed Γ₀ Taylor–Wiles levels need not admit the required torsion-free replacement. Results here use p≥5 or this additional package. Extraction lead: PAPER-CALEGARI-GERAGHTY-18/E116.

**Consumers:** `GL2ModularityLiftingPartII:D1.9/bianchi-localized-amplitude`, `GL2ModularityLiftingPartII:D1.9/bianchi-balancedness`, `GL2ModularityLiftingPartII:D1.10/bianchi-patching-system`, `GL2ModularityLiftingPartII:D1.10/minimal-bianchi-rt`, `GL2ModularityLiftingPartII:D1.10/minimal-semistable-bianchi-lifting`.

### Gap P — integral minimal type at Bianchi principal primes

The printed Γ_p(v^{a(barρ)}) level at type P contains nonminimal inertial lifts. Its correction needs both local type selection and a compatible integral homology model: for ψ²≠1 use the half-conductor ψ character type, and for ψ²=1 use the ψ∘det twisted spherical type. Supply the integral projector/local-system construction, base-change and duality, compatibility with the auxiliary covers and Hecke correspondences, and Conjecture A on these exact spaces. Local characteristic-zero newvector calculations alone do not give that package. This pass plans the no-P Bianchi formulation conditionally on Conjecture A, and states the corrected general one with this explicit input. Extraction leads: PAPER-CALEGARI-GERAGHTY-18/E106,E121.

**Consumers:** `GL2ModularityLiftingPartII:D1.8/bianchi-level-and-type-spaces`, `GL2ModularityLiftingPartII:D1.8/bianchi-conjecture-a-contract`, `GL2ModularityLiftingPartII:D1.10/minimal-bianchi-rt`, `GL2ModularityLiftingPartII:D1.10/bianchi-generic-rank`.

## Source corrections

All descriptions below are in our own words. The packet records locators, extraction leads, the versions read and correction searches for each finding. “New” means no correction was located in those searches; it is not a priority claim. The individual findings were independently checked against the published author PDF. The complete 2022 Correction fixes bracket typography; it does not resolve Gaps M, O or P. The paragraph following CG18 Lemma 4.4 already supplies the correction recorded in E30.

### GL2ModularityLiftingPartII/E1 — gap

**Locator:** Theorem 1.4, p. 303; §3.1, p. 310 (published author PDF).

**Printed assertion:** The introduction does not include the invariant-line assumption used in the weight-one proof.

**Correction:** Impose nonzero inertia invariants at each ramified reducible decomposition group, or first make the finite-order twist described in D1.6; the conductor and curve then belong to that twist.

**Reason:** Definition 3.1 and the conductor-level Katz input use precisely this normalization.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. The introductory theorem omits a normalization that is explicitly present in §3.1; the finite-order twist repair changes the relevant conductor problem.

### GL2ModularityLiftingPartII/E2 — gap

**Locator:** Corollary 1.5(1), p. 304 (published author PDF).

**Printed assertion:** Equality of the two dimensions of inertia invariants is used as a replacement for a genuine minimal local condition.

**Correction:** Require minimality up to finite-order twist, including the determinant/inertial-character condition, then make the fixed-determinant normalization before applying R = T.

**Reason:** New p-power inertial characters can preserve invariant dimension without defining a minimal lift.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. Equality of invariant dimensions does not fix inertial characters or determinant: a new p-primary ramified character can preserve that dimension.

### GL2ModularityLiftingPartII/E3 — error

**Locator:** §3.2.3, p. 315 (published author PDF).

**Printed assertion:** The displayed square of W_x has a weight-independent scalar.

**Correction:** Use W_x²=x^n⟨x⟩ in weight n; the weight-one argument uses x⟨x⟩.

**Reason:** Pullback on ω^n takes the nth tensor power of the isogeny scalar.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. The isogeny scalar is raised to the nth tensor power on ωⁿ; the weight-independent display fails outside n=1.

### GL2ModularityLiftingPartII/E4 — misprint

**Locator:** §3.2.3, p. 315 (published author PDF).

**Printed assertion:** The W_x composite changes cohomological degree and mixes two names for the same auxiliary curve.

**Correction:** Keep H⁰ as both source and target, and use X_Δ(Q;x) throughout the composite.

**Reason:** The isogeny defines an operator on sections, not a map to unspecified Hⁱ.

**Effect:** nothing. **Known correction:** new.

**Independent review:** confirmed. The displayed construction is an operator on sections of a single auxiliary curve; its changed cohomological degree and mixed level label have no corresponding map.

### GL2ModularityLiftingPartII/E5 — error

**Locator:** Remark 3.4, p. 316; Theorem 3.30(2), p. 351 (published author PDF).

**Printed assertion:** The boundary argument uses transitivity of diamonds, or of the displayed type group, on all cusps.

**Correction:** Work fibre by fibre over cusp types. The general eigentrace is ψ₁(x)+x^{n−1}ψ₂(x); its reducibility suffices for non-Eisenstein vanishing.

**Reason:** Different cusp types are preserved, and the fibres above 0 and infinity need not have the same ordered characters.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. Diamonds preserve cusp types rather than acting transitively on all cusps. The two-character reducible trace is enough for the stated localized boundary vanishing.

### GL2ModularityLiftingPartII/E6 — misprint

**Locator:** Lemma 3.5, pp. 318–320; Lemma 3.6, p. 321 (published author PDF).

**Printed assertion:** The oldform computations omit the x factor in U_xV_x, change the source of the two coordinates and lose an inverse x in one coordinate.

**Correction:** Use U_xV_x=x⟨x⟩π₁*, the source H⁰(X,ω)², and lower-left entry −x⁻¹. Put both copies inside ψ before adjoining the complement.

**Reason:** These formulas must give the displayed determinant ⟨x⟩ and intertwine ψ with U_x.

**Effect:** nothing. **Known correction:** new.

**Independent review:** confirmed. The two correspondence identities force upper-right x⟨x⟩ and lower-left −x⁻¹, with determinant ⟨x⟩; the source also changes the domain of the coordinate pair.

### GL2ModularityLiftingPartII/E7 — gap

**Locator:** Lemma 3.5, p. 319; its reuse in Theorem 3.30(1), p. 350, and Lemma 5.8, p. 376 (published author PDF).

**Printed assertion:** The length comparison is applied directly to a K/O-coefficient module.

**Correction:** Compare its finite π^m-torsion lengths for every m, then take the union.

**Reason:** A K/O-coefficient module can have infinite O-length even though every π^m-torsion submodule has finite length.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The K/O module is not of finite O-length. The finite π-power pieces have finite length and their compatible equalities pass to the union.

### GL2ModularityLiftingPartII/E8 — gap

**Locator:** Lemma 3.5, p. 320; Theorem 3.30(1), p. 350 (published author PDF).

**Printed assertion:** The W_x correspondence identity is inferred by cancelling a pullback.

**Correction:** Compute π₁*trπ₁W_x=xU_x+W_x directly, summing order-x cyclic subgroups and separating the distinguished subgroup.

**Reason:** Faithfulness as a functor is not the required cancellation property for the map on sections.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. Functorial faithfulness does not allow cancellation of this map on cohomology; the cyclic-subgroup computation proves the necessary correspondence identity directly.

### GL2ModularityLiftingPartII/E9 — misprint

**Locator:** Proposition 3.8, pp. 323–325 (published author PDF).

**Printed assertion:** The descent quadrant and the generic-fibre dimensions are inconsistently labeled.

**Correction:** Use first-quadrant cohomological descent and its homological Tor dual. Compare dim_K H₀(X_K,ω) with dim_K H₁(X_K,ω), equivalently the corresponding coherent dimensions after tensoring with K.

**Reason:** The homological degree-one edge map bounds Tor₁, and the rank comparison must have the same coefficient field.

**Effect:** nothing. **Known correction:** new.

**Independent review:** confirmed. The low-degree Tor edge map fixes the quadrant after Pontryagin duality, and the rank comparison is a dimension over K on both sides.

### GL2ModularityLiftingPartII/E10 — misprint

**Locator:** Remark 3.10, footnote 3, pp. 325–326 (published author PDF).

**Printed assertion:** The genus-zero example is phrased using weight-two sections without the cusp ideal.

**Correction:** Use ω²(−C) in the X_H(13) comparison, or explicitly localize at the relevant non-Eisenstein ideal.

**Reason:** Kodaira–Spencer identifies differentials with cusp forms; genus zero does not eliminate all weight-two sections.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. Genus zero controls H⁰(Ω¹)=H⁰(ω²(−C)), not the full Eisenstein-containing weight-two section space.

### GL2ModularityLiftingPartII/E11 — misprint

**Locator:** Remark 3.10, p. 326 (published author PDF).

**Printed assertion:** The disjointness argument refers to the residual determinant field alone.

**Correction:** Use the field fixed by the kernel of the full residual representation when choosing the auxiliary prime.

**Reason:** The required Frobenius eigenvalue ratio depends on the full representation.

**Effect:** nothing. **Known correction:** new.

**Independent review:** confirmed. A determinant field does not determine the residual Frobenius eigenvalue ratio. The full residual fixed field is the required Chebotarev input.

### GL2ModularityLiftingPartII/E12 — gap

**Locator:** Theorem 3.11 and Remark 3.12, pp. 326–327 (published author PDF).

**Printed assertion:** The auxiliary-prime splitting claim lacks the Taylor–Wiles norm restriction.

**Correction:** Assume x≡1 mod p and distinct residual roots, or the stronger explicit ratio exclusion x^{±1}.

**Reason:** Distinct roots without the ratio exclusion can still admit ramified special lifts.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. Distinct roots alone do not exclude ratio x or x⁻¹. Norm x≡1 mod p does exclude these ratios and is the intended Taylor–Wiles hypothesis.

### GL2ModularityLiftingPartII/E13 — misprint

**Locator:** Theorem 3.11, p. 328; Lemma 3.16, p. 332 (published author PDF).

**Printed assertion:** The displayed U_p matrix does not match the ordered doubling pair.

**Correction:** For ψ=(φ,φT_p−U_pφ) use column matrix [[T_p,⟨p⟩],[−1,0]].

**Reason:** Its second column is the action on ⟨p⟩V_p; the lower-left coefficient −1 also proves quadratic linear independence.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. With the stated ordered columns the second column is the diamond times V_p, yielding [[T_p,⟨p⟩],[−1,0]]. The printed entries use a different convention.

### GL2ModularityLiftingPartII/E14 — error

**Locator:** §3.4, p. 329; Lemma 3.24, pp. 337–338 (published author PDF).

**Printed assertion:** Injectivity into a selected ordinary factor is asserted in the repeated-root case.

**Correction:** Define A_n as the image in that factor in every case.

**Reason:** An anaemic high-weight algebra can have other components even when the selected ordinary residual polynomial has a repeated root.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. Selecting one ordinary factor can kill other high-weight components. Repeated residual roots in that factor do not prove injectivity from the original image algebra.

### GL2ModularityLiftingPartII/E15 — misprint

**Locator:** §3.4, pp. 329–330 (published author PDF).

**Printed assertion:** The specialization character is given on the anaemic algebra although it must also specialize U_p, and the determinant statement includes Q.

**Correction:** Use a character of the full ordinary eigenvalue-adorned algebra; restrict the prime-to-p inertia determinant claim to x∤pQ. State possible extra ramification at the vexing primes, not their complement.

**Reason:** At Q the diamond character can have p-power order, and a specialization of U_p needs its domain.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The character used to specialize U_p must be defined on the eigenvalue-adorned algebra. Q diamonds allow determinant ramification at Q, so the displayed range must exclude Q.

### GL2ModularityLiftingPartII/E16 — error

**Locator:** Lemma 3.15(4), p. 330 (published author PDF).

**Printed assertion:** The ordinary subcharacter is described as unramified at arbitrary weight.

**Correction:** It is ε^{n−1}λ(⟨p⟩/U_p). It becomes unramified only on the finite coefficient quotient with ε^{n−1}=1.

**Reason:** The cyclotomic factor is ramified before this specialization.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. The ε^(n−1) factor in the ordinary subcharacter is ramified in characteristic zero; it disappears only after the specified finite-coefficient specialization.

### GL2ModularityLiftingPartII/E17 — misprint

**Locator:** Lemma 3.16, p. 332 (published author PDF).

**Printed assertion:** The local quadratic doubling assertion is stated without restricting the root pattern.

**Correction:** Use the repeated-root local factor, or the whole semilocal algebra before separating distinct roots.

**Reason:** A chosen distinct-root factor is rank one over the anaemic image, whereas the full quadratic algebra is rank two.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. After Hensel separation a chosen distinct-root factor has rank one. The rank-two quadratic argument needs the repeated-root factor or both factors together.

### GL2ModularityLiftingPartII/E18 — gap

**Locator:** Scalar case, p. 334; Lemma 3.24, pp. 337–338 (published author PDF).

**Printed assertion:** The representation is treated as scalar-residual-trivial without tracking the normalizing eigenvalue.

**Correction:** Choose c²=⟨p⟩ with c≡α, twist by unramified λ(c⁻¹), and send the local eigenvalue to c⁻¹U_p.

**Reason:** The normalized determinant is ε^{n−1} and the residual representation is then trivial, as required by the local ring.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The scalar residual representation must first be twisted by the residual Frobenius scalar, lifted by c²=⟨p⟩; the eigenvalue parameter then maps to c⁻¹U_p.

### GL2ModularityLiftingPartII/E19 — misprint

**Locator:** Nonscalar repeated-root case, p. 334 (published author PDF).

**Printed assertion:** Indecomposability is deduced from U_p being a unit.

**Correction:** Use that U_p is nonscalar in k[U_p]/(U_p−α)².

**Reason:** A scalar unit has no nontrivial Jordan block; quadratic doubling supplies the needed nilpotent part.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. An invertible scalar operator is decomposable. The nonzero nilpotent part of the doubled Jordan block supplies the indecomposability actually used.

### GL2ModularityLiftingPartII/E20 — gap

**Locator:** Proof of Theorem 3.26, p. 339 (published author PDF).

**Printed assertion:** A full auxiliary Hecke-algebra surjection is attributed to the trace theorem without identifying U_x.

**Correction:** For patching it suffices that the deformation-ring image contains the Q diamonds. A full surjection needs the additional chosen-eigenline/Frobenius identification.

**Reason:** The patching image condition concerns the diamond group algebra, and does not follow for all generators merely from good-prime traces.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. Good-prime trace generation alone omits chosen bad U_x. The diamond-image condition suffices for patching, while the full surjection needs the specified local compatibility.

### GL2ModularityLiftingPartII/E21 — gap

**Locator:** Rank-one argument, p. 340 (published author PDF).

**Printed assertion:** Bad-prime U_x is split into cases according to the conductor exponent and its compatibility is not justified integrally.

**Correction:** Split by dim barρ^{I_x}; a line gives the Frobenius scalar by Hasse-compatible high-weight newness and Carayol compatibility, and zero invariants gives U_x=0.

**Reason:** Wild reducible inertia can have conductor exponent greater than one while retaining an invariant line. The conductor-minimal high-weight space is new at x.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. Wild ramification can give conductor exponent above one with a one-dimensional invariant line. Integral Frobenius/newvector compatibility must use invariant dimension.

### GL2ModularityLiftingPartII/E22 — error

**Locator:** §3.9 level groups, p. 342 (published author PDF).

**Printed assertion:** Some nonvexing ramified level groups omit the p-primary lower-right diamond subgroup.

**Correction:** Use lower-right entry of p-power order for every nonvexing ramified prime, with U_x=V_x.

**Reason:** When the vexing set is empty this must recover X₁(N)/H_N and the minimal determinant normalization.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. The displayed level would specialize to the wrong diamond quotient when there are no vexing primes; retaining the p-primary lower-right subgroup restores the minimal problem.

### GL2ModularityLiftingPartII/E23 — misprint

**Locator:** Type-bundle constructions, pp. 343–346 (published author PDF).

**Printed assertion:** The base curve, cusp ideal, coefficient tensor base and upstairs stalk level are inconsistently written.

**Correction:** Put the coefficient sheaf on its actual level X_W, use −C upstairs for the subcuspidal sheaf, tensor over the new-level structure sheaf, and compute on the corresponding X(V).

**Reason:** These expressions are otherwise not the invariant-pushforward construction used in the proof.

**Effect:** nothing. **Known correction:** new.

**Independent review:** confirmed. Checking each sheaf domain in §3.9.1 exhibits the missing cusp ideal and mismatched level/tensor bases. The independently defined invariant pushforwards fix the domains.

### GL2ModularityLiftingPartII/E24 — error

**Locator:** Lemma 3.27 proof, p. 346 (published author PDF).

**Printed assertion:** The descended interior coefficient bundle is identified with a globally trivial bundle.

**Correction:** Its pullback to the G-torsor is trivial; downstairs it is the vector bundle attached to the local system.

**Reason:** Nontrivial monodromy survives descent.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. The G-torsor trivializes the pullback of the associated bundle. Its descent can have nontrivial monodromy and need not be globally trivial.

### GL2ModularityLiftingPartII/E25 — gap

**Locator:** Lemma 3.27 proof, p. 346 (published author PDF).

**Printed assertion:** A direct decomposition over points in a finite fibre is used on Zariski stalks.

**Correction:** Work on completed or henselian local rings, decompose there, then descend local freeness by faithful flatness.

**Reason:** A finite algebra need not split into its local fibre factors over a nonhenselian local base.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. A finite algebra over a Zariski local ring need not split into its fibre factors; henselization or completion gives that decomposition and faithfully flat descent recovers local freeness.

### GL2ModularityLiftingPartII/E26 — misprint

**Locator:** Lemma 3.28 proof, p. 348 (published author PDF).

**Printed assertion:** A point on the interior is used for a calculation of cusp ramification.

**Correction:** Make the completed-ring calculation at a cusp.

**Reason:** On the interior the map is a torsor and the cusp correction is absent.

**Effect:** nothing. **Known correction:** new.

**Independent review:** confirmed. The local exponent calculation requires a cusp point; at an interior point the finite map is an étale torsor and gives no cusp correction.

### GL2ModularityLiftingPartII/E27 — error

**Locator:** Theorem 3.30 and proof, pp. 350–354 (published author PDF).

**Printed assertion:** The homological coefficient type is the same symbol as the section type although homological duality takes its contragredient.

**Correction:** Use H₀(ω⊗L_{σ*}) at barρ, or H₀(ω⊗L_σ) at the inverse-diamond ideal for barρ∨; transport to the claimed coherent H¹ statement with the twisted adjoints.

**Reason:** The CDT normalization selects W_σ*-isotypic sections, so the section and homological constructions select different types unless the type is self-dual.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. Dualizing the CDT section selector takes W_σ to W_σ*, and the Hecke transpose inverts diamonds; retaining the same type/ideal without this transport is unjustified.

### GL2ModularityLiftingPartII/E28 — misprint

**Locator:** Theorem 3.30(2)–(4), pp. 351–353 (published author PDF).

**Printed assertion:** Several coefficient, operator-range, dual eigenvalue and generic-fibre labels omit their necessary twists.

**Correction:** Use the Hodge sheaf on the Q,Δ curve; reference Lemma 3.7(2); restrict T_x to good primes; take diamonds prime to level, include 1/x in the transpose, and use β(T_x)=α(⟨x⁻¹⟩T_x) at m*. Retain ramification at Q in the Galois statement.

**Reason:** These are the domains and normalizations required by the displayed duality and by the actual Q-level Galois representation.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The listed formulas require the sheaf on its actual Q,Δ level, the good-prime operator range, inverse-diamond adjoints and retained Q ramification.

### GL2ModularityLiftingPartII/E29 — error

**Locator:** Lemma 4.2, p. 355 (published author PDF).

**Printed assertion:** Completed tensoring with an arbitrary complete-intersection O-algebra is claimed to preserve the Cohen–Macaulay property and type.

**Correction:** Add O-Tor independence, for example O-flatness of at least one factor, before transporting the regular sequence.

**Reason:** Take B=O[[x]]/(πx), a Cohen–Macaulay hypersurface of dimension one, and C=O/π², a complete intersection. Their completed tensor product is D=O[[x]]/(πx,π²). It still has dimension one, but its nonzero element π is annihilated by the maximal ideal (π,x), so depth D=0. Thus even Cohen–Macaulayness fails without Tor independence; B=C=O/π only invalidated the printed proof and was not a counterexample to the conclusion.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. Take B=O[[x]]/(πx), a Cohen–Macaulay hypersurface of dimension one, and C=O/π², a complete intersection. Their completed tensor product is D=O[[x]]/(πx,π²). It still has dimension one, but its nonzero element π is annihilated by the maximal ideal (π,x), so depth D=0. Thus even Cohen–Macaulayness fails without Tor independence; B=C=O/π only invalidated the printed proof and was not a counterexample to the conclusion.

### GL2ModularityLiftingPartII/E30 — error

**Locator:** Lemma 4.4, pp. 356–357 (published author PDF).

**Printed assertion:** The first equality criterion for the Hilbert-series inequality is stated in both directions without a homogeneous hypothesis.

**Correction:** Equality implies regularity. The reverse direction needs the specified homogeneous associated-graded situation, as the following paragraph itself explains.

**Reason:** A regular element can have nonregular initial form in the associated graded. This is an input-owner correction, not a new local-ring plan here.

**Effect:** a stated result. **Known correction:** The paragraph following the proof of Lemma 4.4, CG18 pp. 357–358, explicitly gives the nongraded counterexample and the required graded qualification..

**Independent review:** confirmed. The first equivalence is contradicted by the explicit nongraded example immediately following its proof. The paper itself records the graded qualification; this is not an unreported correction.

### GL2ModularityLiftingPartII/E31 — gap

**Locator:** Proof of Theorem 4.8, p. 363 (published author PDF).

**Printed assertion:** The harmless primes are declared to be the only exceptions to uniqueness of conductor-minimal twists.

**Correction:** Also exclude ramified self-extensions of unramified characters at x≡1 mod p; the unrestricted theorem requires Gap M.

**Reason:** The two ψ and ψ⁻¹ conductor-minimal twists can normalize to the same fixed-determinant point, so the proposed eigenform-to-ring comparison need not be injective.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. For a ramified residual self-extension at norm one, the ψ and ψ⁻¹ characteristic-zero branches may coincide after determinant normalization. The proposed fixed-determinant comparison therefore lacks injectivity; Gap M is retained.

### GL2ModularityLiftingPartII/E32 — gap

**Locator:** Proof of Theorem 4.8, pp. 363–365 (published author PDF).

**Printed assertion:** The away-p local ring is unrestricted even at residual ramified Steinberg primes of norm −1 mod p.

**Correction:** Use the Steinberg/unipotent quotient at these primes; request the corresponding component comparison.

**Reason:** The unrestricted ring has additional nonminimal supercuspidal components, so it cannot be compared to the conductor-minimal Hecke space.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. At residual ramified Steinberg type and norm −1, additional supercuspidal lift components are not conductor-minimal. A matching comparison must use the stated Steinberg/unipotent quotient.

### GL2ModularityLiftingPartII/E33 — misprint

**Locator:** Theorem 4.8 proof and Lemma 4.11 footnote, pp. 363–365 (published author PDF).

**Printed assertion:** The proof appears to terminate too early, mixes full and character-restricted Hecke subscripts, and misdescribes the unipotent and root-of-unity components.

**Correction:** Continue the proof through p. 366, retain T_{φ,m} in each φ comparison, use the canonical module of the power-series local ring, distinguish unipotent inertia from trivial inertia, and allow every nontrivial p-power root, not just primitive ones.

**Reason:** The missing lower-order roots and the omitted Steinberg component change the component count; the intermediate ring is not yet the full T_m.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The calculation continues through the character-twisting and Gross-sequence paragraph. Its local factors include unipotent inertia and roots of every nontrivial p-power order, with the indicated intermediate subscripts.

### GL2ModularityLiftingPartII/E34 — gap

**Locator:** Integral twisting identity, p. 366 (published author PDF).

**Printed assertion:** The integral equality of Hecke orders is inferred from a generic-fibre isomorphism and torsion-freeness.

**Correction:** Check all Hecke generators. The diamond images give 1⊗[d]², squaring is bijective on Φ, and good operators can then be untwisted. Include the residue-field coefficient extension.

**Reason:** Torsion-free orders can have the same generic fibre and different integral index.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. A generic-fibre isomorphism between torsion-free orders need not have index one. Squared diamonds generate O[Φ] because Φ has odd order, allowing an integral generator proof.

### GL2ModularityLiftingPartII/E35 — gap

**Locator:** Multiplicity calculation, p. 366 (published author PDF).

**Printed assertion:** Taking maximal-ideal torsion in the Gross sequence is treated as right exact.

**Correction:** Use 3≤dim G[m]≤4 and residual two-dimensional isotypy to force the even value four.

**Reason:** Maximal-ideal torsion is left exact; the evenness step supplies the missing surjectivity numerically.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The m-torsion functor is left exact. The Gross sequence only bounds dimension between three and four; Jacobian residual isotypy supplies the missing evenness.

### GL2ModularityLiftingPartII/E36 — misprint

**Locator:** Lemma 4.14 proof, pp. 367–368 (published author PDF).

**Printed assertion:** The generic-fibre decomposition and restriction argument use imprecise finiteness and inflation labels.

**Correction:** The generic fibre is zero-dimensional Noetherian, hence Artinian; its finite-image kernel leads to a Z_p^r extension unramified at all p-adic places, and restriction on characteristic-zero H¹ is injective through the finite quotient.

**Reason:** Vanishing of finite-group H¹ in characteristic zero gives restriction injectivity, and the class-field argument rules out the torsion-free abelian pro-p extension.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. A zero-dimensional noetherian generic fibre is Artinian; finite-group H¹ vanishing gives restriction injectivity. The class-field argument concerns an extension unramified at every place above p.

### GL2ModularityLiftingPartII/E37 — misprint

**Locator:** Bianchi local hypotheses, §5.1, p. 369 (published author PDF).

**Printed assertion:** Local reducibility is stated without the necessary coefficient closure and residual/lift symbols are mixed.

**Correction:** After enlarging k use absolute inertia/decomposition classifications; put barρ in the residual H condition and residual ψ in the P hypothesis.

**Reason:** The classification and the claim that p-torsion inertia belongs to S depend on absolute local irreducibility.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The local classification is an absolute one after enlarging coefficients; residual and lifted characters/representations cannot be interchanged. Quadratic-twisted nontrivial unipotent inertia is not semisimple P.

### GL2ModularityLiftingPartII/E38 — misprint

**Locator:** Proposition 5.2 and arithmetic quotient notation, pp. 371–375 (published author PDF).

**Printed assertion:** The fixing action on cyclotomic roots, finite-adelic compact level, projective local group and several level/coefficient labels are inconsistent.

**Correction:** Choose σ acting trivially on ζ_{p^a}; levels lie in G(A_f), flat p-level is PGL₂(O_v), spaces Y have no coefficient argument, use Frob_λ for T_λ, and define Y=Y₀(∅).

**Reason:** These repairs make the prime selection, group quotient and residual ideal refer to the same objects.

**Effect:** nothing. **Known correction:** new.

**Independent review:** confirmed. The simultaneous prime-selection element must fix the specified cyclotomic roots. The quotient and Hecke formulas then need finite adeles, PGL₂ local groups and the actual prime/empty-level labels.

### GL2ModularityLiftingPartII/E39 — error

**Locator:** Type-P levels, §5.2.1, p. 373 (published author PDF).

**Printed assertion:** The printed full-conductor Γ_p level is assumed to select the minimal principal inertial type.

**Correction:** For ψ²≠1 use the half-conductor character type, and for ψ²=1 the twisted spherical type. The compatible integral homology package is Gap P.

**Reason:** The printed level also contains nonminimal p-power inertial twists and, in quadratic cases, other congruent local representations.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. The full-conductor Γ_p space need not have the prescribed minimal principal inertial type. The half-conductor character or twisted-spherical selector addresses the characteristic-zero defect; its integral version remains Gap P.

### GL2ModularityLiftingPartII/E40 — gap

**Locator:** Lemma 5.6 and Remark 5.7, p. 375; Lemma 5.8, p. 376 (published author PDF).

**Printed assertion:** The Hensel step and uniformizer independence omit conditions on the selected U_x class and diamonds.

**Correction:** Choose U_x≡α_x with α_x a distinct root of X²−T_xX+1, and require residual diamonds to be trivial. Then α_x≠±1 and the Hensel derivative is invertible.

**Reason:** Distinct roots of the norm-one residual polynomial rule out α=α⁻¹; changing a uniformizer multiplies U by a diamond.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. At norm one the distinct-root polynomial has simple roots not equal to ±1; those conditions make Hensel selection valid. Residual diamonds must be trivial for the claimed uniformizer independence.

### GL2ModularityLiftingPartII/E41 — misprint

**Locator:** Conjecture A(4), p. 375 (published author PDF).

**Printed assertion:** The finite-flat assertion has an incorrect residual/lift placement and can be read as unconditional.

**Correction:** If barρ at v|p is flat, require the Hecke-valued lift to be flat on every Artinian quotient; require ordinarity when the residual representation is ordinary.

**Reason:** An ordinary residual representation need not be flat; forcing every lift to be flat would exclude an allowed residual case.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. Flatness of the residual representation is the antecedent of the finite-flat implication. The intended Artinian lift condition is over the local integer ring O_(F_v), not the coefficient ring.

### GL2ModularityLiftingPartII/E42 — error

**Locator:** Lemma 5.9 proof, p. 377 (published author PDF).

**Printed assertion:** Top-degree group homology is set to zero by noncompact three-manifold reasoning for all odd p.

**Correction:** For p≥5 stabilizers have order prime to p and the argument applies. At p=3 supply the localized stabilizer/Farrell package of Gap O.

**Reason:** An order-three stabilizer can contribute group homology above the coarse-space dimension; non-Eisensteinness alone is not a proof of its disappearance.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. The raw noncompact-manifold H₃ argument does not apply to mod-3 group homology with order-three stabilizers. This confirms a failure of the proof, not a counterexample to localized vanishing; the missing localized statement remains Gap O.

### GL2ModularityLiftingPartII/E43 — misprint

**Locator:** Lemma 5.9 proof, p. 377 (published author PDF).

**Printed assertion:** The torsion-freeness argument takes cohomology rather than the required homology sequence, and every Hecke operator is said to preserve components.

**Correction:** Use H₃(Y,μ/π)_m in the homology coefficient sequence. On H₀ a Hecke operator is degree times its actual component permutation.

**Reason:** The boundary map into H₂[π] comes from H₃ with reduced coefficients; component-preserving Hecke primes suffice for the Eisenstein test.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The coefficient sequence for homology has H₃(μ/π) mapping to H₂(μ)[π]. Hecke correspondences can permute components; component-preserving primes suffice for the boundary Eisenstein argument.

### GL2ModularityLiftingPartII/E44 — misprint

**Locator:** Theorem 5.11 proof, pp. 379–380 (published author PDF).

**Printed assertion:** The dual Selmer twist and a Tor argument are missing from the patching display.

**Correction:** Use ad⁰barρ(1) in q and Tor_i^{S_a}(H_j(Y_{Δ_a}(Q_a),O)_m,O) in descent.

**Reason:** These are the numerical group and augmentation module in Propositions 5.1–5.2 and in the cover spectral sequence.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. The preceding dual-Selmer formula contains ad⁰barρ(1). The cover Tor functor also requires its augmentation argument O; both disappear in the printed patching display.

### GL2ModularityLiftingPartII/E45 — error

**Locator:** Theorem 1.3, p. 302; following Theorem 5.11, p. 380 (published author PDF).

**Printed assertion:** Global automorphic multiplicity one is used to claim free rank one at every printed level.

**Correction:** Retain μ=dim π_f^K. Rank one holds at S-only minimal Γ₀ level, or after a supplied one-dimensional local selector.

**Reason:** Prime-to-p diamond orbits give several vectors at the printed P/M/H Γ_p levels. This does not affect the balanced-patching R = T or dimension-zero complete-intersection conclusion.

**Effect:** a stated result. **Known correction:** new.

**Independent review:** confirmed. Automorphic multiplicity one counts representations, not the dimension of π_f^K. Printed Γ_p levels admit several prime-to-p diamond vectors, so the universal rank-one claim is too strong.

### GL2ModularityLiftingPartII/E46 — error

**Locator:** §5.5, p. 381 (published author PDF).

**Printed assertion:** The GL ray-class splitting sketch uses a p-th-power test even for an ideal class of order p^b.

**Correction:** Use h=p^b and the h-th-power Kummer condition, with h|N(x)−1, for each generator of the p-class group.

**Reason:** A p-th-power test need not lift a class of higher p-power order.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. For a class of order h=p^b the lifting obstruction is h-divisibility in the residue unit group. p-divisibility alone cannot split the extension if b>1.

### GL2ModularityLiftingPartII/E47 — gap

**Locator:** Coefficient bundles at new levels, §3.9.1, pp. 344–345 (published author PDF).

**Printed assertion:** An identification with plain pullback of the compactified base type bundle is used without accounting for cusp ramification.

**Correction:** Define each new-level coefficient bundle by invariant pushforward from its own V-level; use the natural inclusion from pullback and the level-V trace for Hecke operators.

**Reason:** Flat base change does not identify the normalization of the ramified cusp fibre product with the fibre product. For example take tame indices e=5 and f=7, parameters t=q⁵=u⁷ and normalized parameter w with q=w⁷,u=w⁵. An old character line generated by q pulls back to w⁷O[[u]], whereas its independently normalized character line is w²O[[u]]; the former is u times the latter. Thus the full coefficient extension, as well as the subcuspidal one, can change at a doubly ramified cusp.

**Effect:** the proof. **Known correction:** new.

**Independent review:** confirmed. Flat base change does not identify the normalization of the ramified cusp fibre product with the fibre product. For example take tame indices e=5 and f=7, parameters t=q⁵=u⁷ and normalized parameter w with q=w⁷,u=w⁵. An old character line generated by q pulls back to w⁷O[[u]], whereas its independently normalized character line is w²O[[u]]; the former is u times the latter. Thus the full coefficient extension, as well as the subcuspidal one, can change at a doubly ramified cusp.

### GL2ModularityLiftingPartII/E48 — misprint

**Locator:** Completion and q-expansion notation, pp. 327, 336, 348–349, 355, 363–365 (published author PDF).

**Printed assertion:** Several formal power-series rings and q-expansion targets use ordinary polynomial brackets.

**Correction:** Use completed power-series rings in local deformation and cusp calculations, and formal q-series for q-expansions. Keep the finite diamond group algebra uncompleted where it is genuinely finite.

**Reason:** Completion is needed for the CNL universal properties and cusp formal neighborhoods.

**Effect:** nothing. **Known correction:** Calegari–Geraghty, Correction to Modularity lifting beyond the Taylor–Wiles method, Invent. Math. 227 (2022), 855–856, https://doi.org/10.1007/s00222-021-01095-5.

**Independent review:** confirmed. The complete published correction lists the lost double brackets. It concerns formal completions and q-series, not a need to complete every finite group algebra.

## Sources and routing

- [Frank Calegari and David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Inventiones Mathematicae 211 (2018), 297–433; published author PDF. Read 2026-10-19: Introduction, pp. 297–306; §2, pp. 306–312 (supplier boundary); §§3.1–3.9, pp. 310–354; §4.1, Theorem 4.8 and proof, pp. 361–366; §4.2 and §5, pp. 366–382; Lemma 4.2, p. 355, and Lemma 4.4 statement/proof, pp. 356–357, for imported CM-type hypotheses.
- [Frank Calegari and David Geraghty, Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Duke Mathematical Journal 169 (2020), 801–896; published author PDF. Read 2026-10-19: §8, Lemma 8.14 and proof, pp. 865–866.

The packet routes all 114 CG18 items and the one CG20 projection item to their targets or existing supplier contracts. The aliases in the extraction are reconciled to GL2ModularityLiftingPartII, with the local doubling ideal correctly imported from L8. This inventory is not a section-by-section summary of either paper: the targets are organized by their construction dependencies, with the general algebra and geometry imported.

## Whole-roadmap acceptance checks

- Keep a nonzero π-torsion coherent Hecke module admissible. In particular, the Mestre torsion phenomenon cited in CG18 §3.2.4, p. 323, is not ruled out by a false O-flatness hypothesis; the example itself is not being reconstructed from an unread source here.
- At p=3 and level 13, distinguish a genuine Katz/descent Hodge object from an assumed coarse Hodge bundle; use the cusp ideal in the weight-two genus comparison (Remark 3.10, pp. 325–326).
- Exercise all three Frobenius cases: distinct roots, repeated nonscalar, and scalar. Each must return an unramified weight-one representation and T_p in the anaemic image.
- In scalar multiplicity, the maximal-ideal torsion argument uses left exactness and an even dimension, and the local comparison excludes the nonharmless collision until Gap M is resolved.
- At Bianchi level require the residual ideal to be proper, use the dual Selmer twist ad⁰barρ(1), and include the augmentation O in Tor. A class number divisible by p is compatible with the PGL determinant-component quotient; do not infer an unproved GL theorem.
- For Bianchi p=3 retain Gap O. For principal local types retain Gap P. A nonzero generic fibre implies rank one only when its actual local type spaces have dimension one.

Independent review accepted this complete planning pass on 2026-10-19 after checking every target, source finding, API and test. All eleven layers remain planned, none closed; Gaps M, O and P and the all-level Conjecture A input remain explicit. See [the review report](../reviews/REV-DESIGN-GL2ModularityLiftingPartII.md) for the corrections and verification limits.
