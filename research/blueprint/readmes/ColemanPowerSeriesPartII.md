# Signed anticyclotomic local units

This continuation of **Coleman power series, local units, and cyclotomic-unit quotients** proves the integral local-unit decomposition at an inert prime. For every prime p≥5, with Φ/Q_p unramified quadratic, O its integer ring and π=−p, the target is a Λ-linear homeomorphism

V_∞*,+ ⊕ V_∞*,− ≃ V_∞*,  where Λ=O[[G⁻]].

Each sign is free of rank one. Every generator of a sign has nonzero character derivative at every character of that conductor parity. This is BKO Theorem2.1=Theorem5.8 and Corollary2.2 (pp.949,960), with the integral statement retained before extending coefficients or passing to a fraction field. The proof combines two independent constructions: an optimal plus unit with unit augmentation derivative, and a formal-CM optimal system of local points giving the free minus quotient.

The parent supplies its finite unit/norm and Coleman norm-operator mechanisms. The quadratic Lubin–Tate tower, its torsion, formal logarithm, scalar-Frobenius/Honda comparison, quasi-canonical lifts and lattice neighbours are supplied by LubinTateFormalModulesAndQuasiCanonicalLifts. This roadmap constructs the local-unit and modular-image applications of those inputs. It exports finite-layer signed formal points for the Selmer consumer. The later inert-anticyclotomic p-adic L-function and main conjecture consume this theorem; they are not inputs to the early CM unit construction.

## Standing conventions

Fix the BKO local datum throughout. Φ/Q_p is unramified quadratic, O=O_Φ, π=−p, q=p², and F is a Lubin–Tate O-module for π with normalized logarithm λ′(0)=1. Choose a genuine basis v=(v_n) with [π]v_(n+1)=v_n. The imported fields are Φ_n=Φ(F[π^(n+1)]), the tame group Δ of orderp²−1, Θ_n=Φ_n^Δ, and Θ_∞ with Gal(Θ_∞/Φ)=Γ=G⁺×G⁻. The plus direction is cyclotomic and the minus direction is anticyclotomic. Ψ_n is the degreep^n layer of Ψ_∞=Θ_∞^(G⁺). The separate local ring-class tower Ψ′_s has degree(p+1)p^(s−1) for s≥1, with Ψ′_0=Φ and tame group Δ′ of orderp+1. Thus Ψ_n=(Ψ′_(n+1))^Δ′; Δ and Δ′ are different groups.

Let κ be the Lubin–Tate character and ω its tame restriction. Completed group algebras use their compact topology and are written Λ₂=O[[Γ]], Λ=O[[G⁻]]. The inverse Tate twist is Hom_O(T_πF,−), with contragredient action; a star does not mean Pontryagin dual. Pontryagin duals are explicitly Hom_O^cont(−,Φ/O). Principal-unit groups are written additively using their continuous p-adic module structure; the Coleman series still interpolates multiplicative unit sequences. The extension from such sequences to tensor coefficients is made on logarithmic derivatives, not by choosing fictitious tensor-valued units.

Finite characters are continuous and take values in a finite extension of Φ. Conductors, rather than orders, determine signs: c(1)=0, and a nontrivial exact-orderp^n character of G⁻ has conductor exponentn+1. The trivial character and exact-orderp characters are plus; exact-orderp² characters are minus. V_∞*,ε kills derivatives of opposite parity, whereas A^ε kills logarithms of the same parity. Character derivatives have inverse-character covariance; character logarithms have direct-character covariance. δ is the integral augmentation derivative, while δ₁=(1+p⁻¹)δ is in general Φ-valued. Arithmetic local Artin reciprocity and the genuine π-adic basis are used in the Kummer formula.

Formal-group points mean actual maximal-ideal points with the formal addition law. Elliptic points are actual points of the associated curve. The existing parameter-to-point homomorphism is used only in its stated setting: the adic completion of a height-one prime of a Dedekind domain, with the base-changed Weierstrass curve elliptic. AU.6 supplies number-field completion presentations before applying it. The scalar-Frobenius sign in the imported Honda theorem is q-Frobenius[s p] ↔ parameter s p; trace−2p gives parameter−p.

## Ownership and proof order

| Layer | Mathematical output |
|---|---|
| AU.0 | Lubin–Tate local units and the inverse twist |
| AU.1 | Coleman interpolation and character derivatives |
| AU.2 | Formal Kummer duality |
| AU.3 | Signed characters, formal points and annihilators |
| AU.4 | An optimal signed unit |
| AU.5 | An unramified formal CM point |
| AU.6 | Completion models and modular quasi-canonical points |
| AU.7 | Optimal local points and exact traces |
| AU.8 | Minus-point control and quotient freeness |
| AU.9 | Integral decomposition and nonvanishing |

AU.0–AU.3 provide the unit module, derivatives and duality. AU.4 gives the optimal plus unit through independent CM special values. AU.5–AU.7 give the primitive formal-CM point and trace system; AU.8 gives the minus quotient and kernel. AU.9 combines them by augmentation and compact Nakayama. In particular, signed freeness and the final direct sum are not assumptions of the optimal-unit proof or of character-derivative nonvanishing.

For the independent auxiliary split prime ℓ, write conductor(ν)=ℓ^m; then a nontrivial ℓ-power character has orderℓ^(m−1) and factors through L_(m−1), where L_j has degreeℓ^j. The localization tower and z_(fℓ^m) use this conductor convention throughout.

The alias AnticyclotomicLocalUnits in the accepted extraction is this ColemanPowerSeriesPartII design. A second design of the same Part II from the same route, AnticyclotomicLocalUnits (nine layers ALU.0–ALU.8), was also written; the merge proposal in the packet asks the orchestrator to keep one of the two ids. NonordinaryCMSpecialValues belongs to grouped AutomorphicPadicLFunctionsPartII design #3350; EllipticCurvesPartIISupersingularFiniteFields belongs to grouped EllipticCurvesPartII design #3398. Their stage ids are not present in this checkout. The requests below use existing parent stages as explicit ownership anchors, and the restructure proposals require rewiring to the exact continuation nodes when those designs exist. In particular ordinary Katz L3 is not asserted to supply an inert nonordinary CM theorem. The early zeta-class/Finis result must precede the downstream Rubin p-adic L-function.

## Library baseline and reuse

The build baseline is Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCetif790474821cf4256814db967cb154e7af3d0c369. The reviewed parent audit was checked: finite algebra norms, formal differentiation and finite local-unit pieces do not already implement the BKO tower or its signed decomposition. The pinned declarations actually reused are:

- **tauceti:TauCeti.unitFiltration**, TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean: The subgroup of K× consisting of units congruent to1 modulo the i-th power of the maximal ideal; i=1 is the actual principal-unit group. Definition read at f790474, lines88–90; unitFiltration_succ membership characterization read.
- **mathlib:PowerSeries.derivative**, Mathlib/RingTheory/PowerSeries/Derivative.lean: Formal derivative as a derivation; coefficient n is coefficient n+1 multiplied by n+1. Supplies differentiation, not a Coleman map. Definition and coeff_derivative read at082e2d3, lines60–75.
- **tauceti:WeierstrassCurve.formalPointHomAdicCompletion**, TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean: Additive map from FormalGroupPoint C at the maximal ideal of a height-one Dedekind adic completion into actual affine elliptic points over that completion; requires the base-changed curve elliptic. Full variable context and definition read atf790474, lines227–270. No arbitrary-local-field generalization is claimed.
- **tauceti:WeierstrassCurve.formalPointHomAdicCompletion_injective**, TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean: Injectivity of the preceding additive map with the same Dedekind completion and ellipticity hypotheses. Statement read atf790474, lines283–287.
- **tauceti:WeierstrassCurve.range_formalPointHomAdicCompletion**, TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Range.lean: The image is the set of elliptic points P with P=0 or 1<Valued.v(xCoord P), in the same height-one completion context. Statement and variable context read atf790474, lines140–164.

Current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 already implements completedGroupAlgebra, its compact-module action and the ℤ_p procyclic power-series coordinate. These are reused through the measures/Iwasawa supplier. They are not claimed to exist at the older build pin. Only the O-coefficient and twisting comparisons are requested. Current TauCetiRoadmap0d144d044dacebca17b654695b6f1ad58f159b27 and the post-snapshot roadmap directories were checked for overlap, including LocalGaloisGroups and ProfiniteArithmetic. No new general completed group algebra, profinite arithmetic or Lubin–Tate foundation is planned here.

The suggested Lean file contains only light definitions and conditional algebraic milestones over real pinned carriers. Heavy unit/tower/Kummer carriers are README targets. Its completion-map examples retain the Dedekind-completion hypotheses. Elaboration is a signature check, not an implementation claim.

## Source discipline and open closure

The complete published BKO paper and Rubin1987 article were read. Hazewinkel’s original norm proof and Wintenberger’s local-unit freeness proof were read. The source records give versions, public URLs, hashes and sections actually used. All statements and proof outlines below are in the roadmap’s own words. Wiles’s original height-two reciprocity proof was not obtained; the Kato1993 chapter cited for its normalization is not cleared and was not read. Cox and Narkiewicz are not used as read sources. Abbes–Ullmo (Compositio 1996, Théorème A) is read for the Manin-constant p-unit statement requested in R6, and Fesenko's paper on deeply ramified extensions is read as a lead for G1. The auxiliary quadratic-field estimate instead uses an explicit character-series bound and a finite reduced-form certificate, with the analytic residue and ideal-class comparisons imported under named contracts.

This is a complete target-level planning pass, with all ten layers planned. It is not proof-closed: G1 is the ramified finite-base norm estimate, G2 is the original reciprocity proof/dual-exponential normalization, G3 and G4 are the supersingular finite-field counts and the early nonordinary CM inputs, which no published stage owns yet, and precise external requests remain. Existing supplier packets can have their own proof gaps, notably canonical Gross-character existence. Those gaps are inherited, not repaired by an ownership citation. Every declaration below remains unchecked for implementation.

## AU.0. Lubin–Tate local units and the inverse twist

Fix the imported quadratic Lubin–Tate tower, distinguish conductor from order, construct its norm-compatible principal units and inverse Tate twist, and specialize the cyclotomic-direction action. Prove U_∞ free of Λ₂-rank two and V_∞* free of Λ-rank two. Completed group algebras and their topology are imported, not reconstructed. Targets: Anticyclotomic conductor parity; Norm-compatible principal units; Inverse Tate twist; Anticyclotomic local-unit quotient; Two-variable local-unit freeness. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8; ColemanPowerSeries:L0; PadicMeasuresIwasawaAlgebras:L1; PadicMeasuresIwasawaAlgebras:L4; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity; PadicMeasuresIwasawaAlgebras:L5.

### Anticyclotomic conductor parity

**Target ColemanPowerSeriesPartII:AU.0/conductor-parity (definition).** For finite continuous χ:G⁻→Q̄_p×, define c(1)=0 and c(χ)=n+1 when Φ_n is its first Lubin–Tate level. Put Ξ⁺={χ:c(χ) even}, Ξ⁻={χ:c(χ) odd}. For a nontrivial character of exact order p^n on Gal(Ψ_n/Φ), c(χ)=n+1; the trivial character belongs to Ξ⁺.

**Construction or proof.** (1) Use the conductor and quotient identifications supplied by LT.8/bko-character-data. (2) Assign parity to the conductor exponent; include the trivial character separately.

**Direct inputs:** LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-character-data.

**Source:** BKO2021, §2, p.948 (conductor convention) and p.949 (definition of Ξ⁺, Ξ⁻).

**Uses.** AU.3/signed-units: Select the opposite parity kernels. AU.3/signed-points: Select the same parity logarithm kernels.

**API.**

- **conductorExponent** (data): The least conductor exponent, zero for the trivial character.
- **parity_partition** (characterisation): Every finite character lies in exactly one of Ξ⁺, Ξ⁻.
- **primitive_conductor** (compatibility): Exact order p^n, n≥1, corresponds to conductor p^(n+1).

**Unit tests.**

- **trivial_plus** (degenerate): c(1)=0 and 1∈Ξ⁺.
- **order_p_plus** (computation): A character of exact order p has exponent 2 and belongs to Ξ⁺.
- **order_p_squared_minus** (computation): A character of exact order p² has exponent 3 and belongs to Ξ⁻.

**Acceptance:** Check exact orderp and exact orderp² characters give opposite signs; the trivial conductor is0.

**Atlas planet:** Anticyclotomic character parity.

### Norm-compatible principal units

**Target ColemanPowerSeriesPartII:AU.0/units-limit (definition).** Let P_n be TauCeti.unitFiltration Φ_n 1, written additively via p-adic powering. Define Ũ_∞=lim_N(P_n⊗_{Z_p}O), with its compact inverse-limit topology and O[[Δ×Γ]] action. Let U_∞=e_ω Ũ_∞, where ω is the tame restriction of κ and e_ω=|Δ|⁻¹Σ ω(d)⁻¹d; Γ=G⁺×G⁻ and Λ₂=O[[Γ]].

**Construction or proof.** (1) Use the existing principal-unit group, finite norm maps and p-adic module structure. (2) Extend norms by O and form the closed compatible-family submodule; extend the continuous Galois action to the completed algebra. (3) Apply the prime-to-p idempotent and retain its embedding and projection.

**Direct inputs:** tauceti:TauCeti.unitFiltration; ColemanPowerSeries:L0; PadicMeasuresIwasawaAlgebras:L1; PadicMeasuresIwasawaAlgebras:L4/character-decomposition; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/quadratic-directions.

**Source:** BKO2021, §2, p.948; Rubin1987, §1, p.406.

**Uses.** AU.0/units-free: Apply the local-unit module structure theorem. AU.1/coleman-series: Interpolate the underlying norm-compatible systems.

**API.**

- **units_mk** (constructor): A norm-compatible family u=(u_n) of principal units and a∈O give u⊗a∈Ũ_∞. Since O is Z_p-free of rank two, Ũ_∞=(lim U_n)⊗_(Z_p)O, so every element is u⊗1+u′⊗θ for a Z_p-basis 1,θ of O.
- **units_projection** (projection): Ũ_∞→P_n⊗O is continuous, O-linear and commutes with norm.
- **units_ext** (extensionality): Equality holds if all finite projections agree.
- **omega_projector** (characterisation): d·u=ω(d)u characterizes U_∞; the complementary tame eigenspaces map to zero.
- **units_completed_action** (structure): Continuous finite-level actions extend to a compact Λ₂-module action.

**Unit tests.**

- **unit_sequence** (degenerate): The sequence of multiplicative identities is additive zero at every level.
- **broken_norm** (non-example): A family with N(u_(n+1))≠u_n at one level is excluded.
- **wrong_tame_character** (non-example): An eigenvector for a distinct tame character has e_ω-image zero.

**Acceptance:** Use the existing principal-unit filtration at every coordinate, and reject a family failing one norm square.

**Atlas planet:** Norm-compatible local units.

### Inverse Tate twist

**Target ColemanPowerSeriesPartII:AU.0/inverse-tate-twist (definition).** For a compact O-module M with compatible Galois action, set M*=Hom_O(T_πF,M) with g·h=g_M∘h∘g_T⁻¹ and the compact topology after choosing a Tate basis. Define U_∞*=(Ũ_∞*)^Δ; evaluation at a basis identifies it with U_∞ and changes the Γ-action by κ⁻¹. This is a functorial comparison, not an identification of the original Γ-actions.

**Construction or proof.** (1) Import the actual rank-one Tate O-module and κ. (2) Use the contragredient action on Hom, then identify Δ-invariants with the ω-summand through evaluation. (3) Prove change of basis by b∈O× rescales evaluation and inverse-basis tensors by inverse factors.

**Direct inputs:** ColemanPowerSeriesPartII:AU.0/units-limit; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/lt-character; PadicMeasuresIwasawaAlgebras:L1.

**Source:** BKO2021, §2, p.948.

**Uses.** AU.0/anticyclotomic-quotient: Turn σ−κ(σ) into σ−1. AU.2/formal-points-units-dual: Obtain a scalar-valued Kummer pairing.

**API.**

- **twist_eval_basis** (equivalence): Evaluation at v gives an O-linear homeomorphism to U_∞ with the κ⁻¹-twisted action.
- **twist_action** (simp): g·(u⊗v⁻¹)=g(u)⊗κ(g)⁻¹v⁻¹.
- **twist_change_basis** (compatibility): For v′=bv, the same tensor is represented by bu⊗(v′)⁻¹.
- **twist_map** (functoriality): Continuous equivariant O-linear maps induce maps on inverse twists.

**Unit tests.**

- **trivial_action** (characterisation): Twisting the κ-line makes its Galois action trivial.
- **wrong_twist** (non-example): Using κ rather than κ⁻¹ fails the previous test for κ(g)²≠1.
- **tame_comparison** (compatibility): A Δ-invariant inverse tensor has underlying ω-eigenvector, not an ω⁻¹-eigenvector.

**Acceptance:** The κ-line becomes trivial after inverse twisting; the resulting tame invariant corresponds to ω, not ω⁻¹.

**Atlas planet:** Inverse Tate twist.

### Anticyclotomic local-unit quotient

**Target ColemanPowerSeriesPartII:AU.0/anticyclotomic-quotient (definition).** For a topological generator σ of G⁺, put V_∞=U_∞/(σ−κ(σ))U_∞ and V_∞*=U_∞*/(σ−1)U_∞*. The images are compact and closed. The twist gives (V_∞)*≃V_∞* as Λ=O[[G⁻]] modules; replacing σ by another generator gives the same closed relation ideal.

**Construction or proof.** (1) Extend γ↦κ(γ)⁻¹γ to the completed algebra. (2) Use its automorphism to compare the two relation submodules. (3) Use the universal quotient property and the unit-exponent identity to show independence of σ.

**Direct inputs:** ColemanPowerSeriesPartII:AU.0/inverse-tate-twist; PadicMeasuresIwasawaAlgebras:L1; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/quadratic-directions.

**Source:** BKO2021, §2, p.948.

**Uses.** AU.1/derivative-descent: Descend anticyclotomic character derivatives. AU.2/anticyclotomic-kummer: Pair invariants with coinvariants.

**API.**

- **quotient_mk** (projection): The canonical map U_∞*→V_∞* is continuous and Λ-linear.
- **quotient_lift** (universal-property): A continuous linear map descends exactly when it kills (σ−1)U_∞*.
- **quotient_twist** (equivalence): The twisted σ=κ(σ) quotient is the σ=1 quotient.
- **quotient_generator_independence** (compatibility): Changing σ by a Z_p-unit power preserves the quotient canonically.

**Unit tests.**

- **cyclotomic_relation** (characterisation): The images of σx and x agree in V_∞*.
- **untwisted_relation** (compatibility): In V_∞, σu=κ(σ)u, which need not equal u.
- **unit_generator_change** (compatibility): Replacing σ by σ^a, a∈Z_p×, gives inverse comparison maps.

**Acceptance:** Changing the G⁺ generator by a Z_p-unit preserves the closed quotient; the untwisted relation remains σ=κ(σ).

**Atlas planet:** Anticyclotomic local-unit quotient.

### Two-variable local-unit freeness

**Target ColemanPowerSeriesPartII:AU.0/units-free (theorem).** U_∞ is free of rank two over Λ₂. Consequently U_∞* is free of rank two over the twisted Λ₂, and V_∞* is free of rank two over Λ.

**Construction or proof.** (1) Apply Wintenberger §4 Theorem (i),(iii) for r=2, K=Φ, d=2: the ω-isotypic character is nontrivial and is distinct from the tame cyclotomic character ω^(p+1). (2) Use the local Artin interpretation and finite coinvariant freeness in §5.1–§5.5.3; the relevant character avoids both the valuation summand and the cyclotomic Tate summand. Extend coefficients to O and select ω. (3) Transport freeness through the twist automorphism and specialize the G⁺ variable at 1.

**Direct inputs:** ColemanPowerSeriesPartII:AU.0/anticyclotomic-quotient; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity; PadicMeasuresIwasawaAlgebras:L4; PadicMeasuresIwasawaAlgebras:L5.

**Source:** Rubin1987, Proposition 1.1, p.407; Wintenberger1980, §4 Théorème (i),(iii), pp.91–92; proofs §§5.1–5.5.3, pp.92–98.

**Acceptance:** Show why ω is different from the tame cyclotomic character; do not assume the exceptional character component is free. Exhibit a Λ-module equivalence V_∞*≃Λ², including the quotient topology.

**Atlas planet:** Local-unit freeness.

## AU.1. Coleman interpolation and character derivatives

Construct the Lubin–Tate Coleman series from the imported norm-operator mechanism. Define δ, δ_n and δ_χ with π=−p, prove invariance under a change of Tate basis and inverse-character covariance, then descend to V_∞*. Separate the augmentation δ from the normalized trivial-character derivative δ₁. Targets: Lubin–Tate Coleman series; Coates–Wiles derivatives; Twisted derivative covariance; Character derivatives; Anticyclotomic derivative descent; Trivial-character normalization. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** ColemanPowerSeriesPartII:AU.0; ColemanPowerSeries:L1; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0; PadicMeasuresIwasawaAlgebras:L1; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9.

### Lubin–Tate Coleman series

**Target ColemanPowerSeriesPartII:AU.1/coleman-series (construction).** For each norm-compatible u_n∈1+m_(Φ_n) and genuine basis v=(v_n) of T_πF with [π]v_(n+1)=v_n, there is a unique f_(u,v)∈O[[X]]× satisfying f_(u,v)(v_n)=u_n for all n≥0. It is fixed by the Coleman norm N_F defined by (N_F f)([π]X)=∏_{t∈F[π]}f(X+_F t). Extend its logarithmic derivative O-linearly to the tensor unit module; do not interpret a general tensor as a single multiplicative sequence.

**Construction or proof.** (1) Apply the parent finite-free determinant norm to the finite flat [π] substitution algebra, using the imported LT division polynomial and analytic evaluation. (2) Prove integral norm contraction, construct the norm-fixed limit from finite interpolation, and prove uniqueness by torsion evaluations accumulating at the boundary and the norm-fixed constraint. (3) Check the actual π-adic basis against the p-adic basis: Rubin coordinates differ by (−1)^n.

**Direct inputs:** ColemanPowerSeriesPartII:AU.0/units-limit; ColemanPowerSeries:L1; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1/lt-module; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/primitive-division; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/sign-generator-comparison.

**Source:** BKO2021, §2, p.948 and footnote 2; Rubin1987, §2, p.407.

**Uses.** AU.1/coates-wiles: Take the invariant logarithmic derivative. AU.2/wiles-pairing: Compute the Kummer symbol.

**API.**

- **coleman_eval** (characterisation): f_(u,v)(v_n)=u_n at every level.
- **coleman_norm_fixed** (relation): N_F(f_(u,v))=f_(u,v).
- **coleman_mul** (compatibility): Products of unit systems correspond to products of series.
- **coleman_basis_change** (functoriality): For v′=bv, f_(u,v′)=f_(u,v)∘[b⁻¹]_F.

**Unit tests.**

- **identity** (degenerate): The identity unit sequence has series 1.
- **basis_rescaling** (compatibility): Evaluation at [b]v_n after composition with [b⁻¹] returns u_n.
- **pi_recursion** (non-example): Replacing the genuine π-basis by a p-compatible basis requires the alternating sign correction; using it unchanged fails [π] compatibility.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

**Atlas planet:** Lubin–Tate Coleman series.

### Coates–Wiles derivatives

**Target ColemanPowerSeriesPartII:AU.1/coates-wiles (definition).** For x=u⊗v⁻¹⊗a define δ(x)=a f′(0)/f(0)∈O and δ_n(x)=a f′(v_n)/(λ′(v_n)f(v_n))∈Φ_n, with λ′(0)=1. Extend through the balanced tensor relations to U_∞*. Both maps are independent of the choice of basis representation.

**Construction or proof.** (1) Use dlog(fg)=dlog f+dlog g and the invariant derivation D=λ′(X)⁻¹d/dX. (2) Check balancing and rescaling from the Coleman basis-change law and λ([b]X)=bλ(X). (3) Prove δ integral and finite evaluations continuous, and compare formal differentiation with PowerSeries.derivative.

**Direct inputs:** ColemanPowerSeriesPartII:AU.1/coleman-series; ColemanPowerSeriesPartII:AU.0/inverse-tate-twist; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/formal-log; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log; mathlib:PowerSeries.derivative.

**Source:** BKO2021, §2, p.948.

**Uses.** AU.1/character-derivative: Average finite-level derivatives. AU.4/optimal-unit: Detect integrality at augmentation.

**API.**

- **delta_linear** (structure): δ is a continuous O-linear map U_∞*→O.
- **delta_level_linear** (structure): δ_n is a continuous O-linear map to Φ_n.
- **delta_basis_independent** (compatibility): The value is unchanged when the same tensor is represented using bv.
- **delta_invariant_derivation** (characterisation): δ_n is the evaluation of the invariant derivative of log f.

**Unit tests.**

- **constant_series** (degenerate): A constant Coleman series has δ=δ_n=0.
- **linear_coefficient** (computation): δ(u⊗v⁻¹)=coeff₁(f)/coeff₀(f).
- **basis_balance** (compatibility): For v′=bv, multiplying the unit tensor by b cancels the b⁻¹ chain-rule factor.

**Acceptance:** A constant series has zero derivative, and the origin value agrees with coeff₁(f)/coeff₀(f); rescaling the Tate basis cancels.

**Atlas planet:** Coates–Wiles derivatives.

### Twisted derivative covariance

**Target ColemanPowerSeriesPartII:AU.1/derivative-covariance (theorem).** For x∈U_∞*, β∈Gal(Φ_∞/Φ) and n≥0, δ_n(βx)=β(δ_n(x)). Before the inverse twist the formula includes κ(β); twisting cancels exactly that factor. On G⁺-coinvariants the descended δ satisfies δ(λx)=aug(λ)δ(x) for λ∈Λ.

**Construction or proof.** (1) Compare the Coleman series of βu with substitution by [κ(β)] and use the invariant differential chain rule. (2) Cancel the Tate factor and evaluate at zero and v_n. (3) Extend from group elements to the completed group algebra using continuity.

**Direct inputs:** ColemanPowerSeriesPartII:AU.1/coates-wiles; PadicMeasuresIwasawaAlgebras:L1.

**Source:** BKO2021, §2, pp.948–949; Rubin1987, Lemma 2.1(i), p.407.

**Acceptance:** Before twisting retain the κ(β) factor; after twisting show genuine finite-field Galois covariance and augmentation action at zero.

### Character derivatives

**Target ColemanPowerSeriesPartII:AU.1/character-derivative (definition).** For finite χ of Gal(Φ_∞/Φ) and n≥0 through which χ factors, set δ_χ(x)=π^(−n−1)Σ_{γ∈Gal(Φ_n/Φ)}χ(γ)·δ_n(x)^γ in a finite coefficient extension of Φ. It is independent of n and satisfies δ_χ(βx)=χ(β)⁻¹δ_χ(x). In particular no n=−1 evaluation is used to define δ₁.

**Construction or proof.** (1) Differentiate the Coleman norm identity with the invariant derivation, obtaining Σ_{t∈F[π]}Dlog f(X+_F t)=πDlog f([π]X). (2) Evaluate on torsion to get Tr_(Φ_(n+1)/Φ_n)δ_(n+1)=πδ_n. (3) Use trace transitivity for level independence and reindex the character sum for inverse covariance.

**Direct inputs:** ColemanPowerSeriesPartII:AU.1/coates-wiles; ColemanPowerSeriesPartII:AU.1/derivative-covariance; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/formal-trace.

**Source:** BKO2021, §2, p.949.

**Uses.** AU.3/signed-units: Define the signed derivative kernels. AU.4/xi-values: Match the normalized L-value formula.

**API.**

- **delta_character_level_independence** (compatibility): Any n≥0 containing χ computes the same scalar.
- **delta_character_covariance** (relation): δ_χ(βx)=χ(β)⁻¹δ_χ(x).
- **delta_character_evaluation** (compatibility): δ_χ(λx)=ev_(χ⁻¹)(λ)δ_χ(x).
- **delta_character_coefficients** (functoriality): The definition commutes with finite coefficient extension.

**Unit tests.**

- **trivial_level_zero** (computation): δ₁=π⁻¹Tr_(Φ₀/Φ)δ₀, computed at n=0.
- **inverse_character** (non-example): At a nonquadratic χ, the factor is χ(β)⁻¹, not χ(β).
- **one_level_up** (compatibility): The extra trace factor π cancels the extra denominator π in level n+1.

**Acceptance:** Compute χ=1 at n=0 and a nonquadratic χ at n+1; the π trace factor cancels one extra π denominator and the covariance is inverse.

**Atlas planet:** Character derivatives.

### Anticyclotomic derivative descent

**Target ColemanPowerSeriesPartII:AU.1/derivative-descent (theorem).** For χ factoring through G⁻, δ_χ kills (σ−1)U_∞*, hence gives a continuous O-linear map V_∞*→Φ(χ). The map δ also descends and is Λ-linear for the augmentation action on O.

**Construction or proof.** (1) Apply inverse covariance with χ(σ)=1. (2) Use the quotient universal property, retaining uniqueness. (3) Use covariance at zero for the augmentation map.

**Direct inputs:** ColemanPowerSeriesPartII:AU.1/character-derivative; ColemanPowerSeriesPartII:AU.0/anticyclotomic-quotient; ColemanPowerSeriesPartII:AU.1/derivative-covariance.

**Source:** BKO2021, §2, p.949.

**Acceptance:** The descended map has the same values on x and σx, and its lift back to U_∞* is unique.

### Trivial-character normalization

**Target ColemanPowerSeriesPartII:AU.1/delta-trivial-relation (theorem).** On U_∞* and V_∞*, δ₁=(1−π⁻¹)δ=(1+p⁻¹)δ as Φ-valued maps. Thus δ and δ₁ have the same kernel, although δ₁ need not be O-valued.

**Construction or proof.** (1) Evaluate the invariant norm-derivative identity at zero. The π-torsion sum equals πδ; subtract the zero-torsion contribution δ. (2) The remaining nonzero π-torsion orbit is Tr_(Φ₀/Φ)δ₀=(π−1)δ. (3) Divide by π and substitute π=−p.

**Direct inputs:** ColemanPowerSeriesPartII:AU.1/character-derivative; ColemanPowerSeriesPartII:AU.1/derivative-descent.

**Source:** BKO2021, §2, p.949 (δ_χ at χ=1, n=0); Proposition 3.3(1)–(2), p.953; Rubin1987, Lemma 2.1(iv), p.407.

**Acceptance:** Keep the p-Euler-factor correction at χ=1; do not assert δ₁=δ.

## AU.2. Formal Kummer duality

Apply height-two norm vanishing and elliptic Tate duality to the actual formal module. Construct the full and anticyclotomic perfect Kummer pairings, retaining the inverse/direct limits and the vanishing needed for descent. State both Wiles’s trace formula and the distinct dual-exponential comparison. Targets: Formal Kummer exact sequence; Height-two universal norm vanishing; Formal-to-elliptic Tate duality comparison; Full-tower Kummer pairing; Anticyclotomic Kummer duality; Wiles’s explicit Kummer formula; Wiles’s dual-exponential comparison. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9; ArithmeticGaloisDuality:R02.1; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; ArithmeticGaloisDuality:R02.4; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; ColemanPowerSeriesPartII:AU.0; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity; ArithmeticGaloisDuality:R02.2; ColemanPowerSeriesPartII:AU.1; PadicHodgeRegulators:L1.

### Formal Kummer exact sequence

**Target ColemanPowerSeriesPartII:AU.2/formal-kummer (theorem).** For each finite L in Θ_∞ or Ψ_∞ and k≥1, the multiplication-by-π^k sequence on F(m_(Φ̄)) yields 0→F(m_L)/π^k→H¹(L,F[π^k])→H¹(L,F(m_(Φ̄)))[π^k]→0. These sequences commute with restriction, corestriction/formal trace and k-transition maps.

**Construction or proof.** (1) Use finite-flat torsion and divisibility over the algebraic closure, evaluated in finite complete subfields. (2) Take the continuous cohomology long exact sequence; identify fixed formal points with F(m_L). (3) Check transfer is formal-group norm and that transition maps on torsion and quotients agree.

**Direct inputs:** LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2/primitive-division; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/formal-trace; ArithmeticGaloisDuality:R02.1.

**Source:** BKO2021, §4, (4.1), p.954; Rubin1987, §5, sequence (6), p.411.

**Acceptance:** Track the connecting map on an actual π^k-division point and verify that corestriction is formal trace, not coordinate addition.

**Atlas planet:** Formal Kummer sequence.

### Height-two universal norm vanishing

**Target ColemanPowerSeriesPartII:AU.2/formal-norm-vanishing (theorem).** For the totally ramified pro-p towers Θ_∞/Φ and Ψ_∞/Φ, lim_N F(m_(Θ_n))=0 and lim_N F(m_(Ψ_n))=0. Equivalently every finite-layer universal formal norm subgroup is zero.

**Construction or proof.** (1) Apply Hazewinkel Theorem 1.3 in a cofinal totally ramified Z_p direction and use transitivity/containment for the full two-variable tower. (2) For a fixed ramified finite layer, use the ramified-base version of the height-two norm bound stated by Rubin Proposition 4.5; a depth tending to infinity forces the intersection to zero. (3) Use separatedness of the local-field filtration. Record the precise ramified-base estimate as gap G1 until its proof is supplied; the absolutely unramified base case alone does not prove every inverse-limit coordinate zero. A lead for G1: Θ_∞ and Ψ_∞ are deeply ramified, and deeply ramified theory gives the direct-limit Kummer defect vanishing of formal-kummer-duality directly (see the G1 record).

**Direct inputs:** LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/adic-points; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/formal-trace; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-fields.

**Source:** Rubin1987, Proposition 4.5, p.411; Hazewinkel1977, Theorem 1.3, pp.305–306; universal-norm consequence, p.307; proof §§3–4, pp.309–314.

**Acceptance:** Supply G1’s ramified finite-base/cofinality argument before calling this proof closed.

**Atlas planet:** Height-two norm vanishing.

### Formal-to-elliptic Tate duality comparison

**Target ColemanPowerSeriesPartII:AU.2/formal-kummer-duality (theorem).** There is a good supersingular elliptic model B/O and an integral identification B̂≃F for π=−p. For each finite L in the pro-p towers, the p-primary local cohomology of its formal subgroup compares with that of B so that the direct-limit defect in the formal Kummer sequence is Pontryagin dual to lim_N F(m_L). In particular colim H¹(L,F(m_(Φ̄)))[π^∞]=0 in both towers.

**Construction or proof.** (1) Use the imported supersingular finite-field trace-class existence, lift a smooth Weierstrass equation to O, and apply LT.4/elliptic-honda-comparison with trace −2p. (2) Use 0→B̂(m_L)→B(L)→B̃(k_L)→0 and the analogous separable-closure sequence; reduction terms have bounded finite p-primary contribution and disappear in the relevant tower comparison. (3) Apply local duality for abelian varieties over p-adic fields (ArithmeticGaloisDuality R02.4/abelian-variety-local-duality) to B, identified with its dual by the principal polarization; track the O-action and its adjoint through the formal identification. (4) Pass to limits using ArithmeticGaloisDuality’s compact/discrete comparison and formal-norm-vanishing. Finite class-formation duality alone is not a proof of the elliptic comparison.

**Direct inputs:** ColemanPowerSeriesPartII:AU.2/formal-kummer; ColemanPowerSeriesPartII:AU.2/formal-norm-vanishing; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; ArithmeticGaloisDuality:R02.4/abelian-variety-local-duality; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; ArithmeticGaloisDuality:R02.1/tate-inverse-limit.

**Source:** Rubin1987, Lemma 5.1 and proof, p.411; BKO2021, §4, p.954.

**Acceptance:** Identify the polarization pairing and the formal reduction maps, not an arbitrary nondegenerate pairing. Use one explicit compatible comparison in both Θ and Ψ towers.

### Full-tower Kummer pairing

**Target ColemanPowerSeriesPartII:AU.2/formal-points-units-dual (construction).** There is a continuous perfect O-bilinear Galois-compatible pairing F(m_(Θ_∞))⊗_O Φ/O × U_∞*→Φ/O. It is the Kummer map followed by the local Artin identification, then evaluation on the inverse Tate twist; equivalently F(m_(Θ_∞))⊗Φ/O≃Hom_O^cont(U_∞*,Φ/O).

**Construction or proof.** (1) Pass to limits in the formal Kummer sequences using the vanished defect. (2) Over Φ_∞ all F[π^∞] is rational; apply inflation-restriction, tame invariants and local reciprocity to identify the H¹ group with Hom_O(U_∞,F[π^∞]). (3) Contract the actual Tate factor to obtain Φ/O, retaining the arithmetic Artin convention.

**Direct inputs:** ColemanPowerSeriesPartII:AU.2/formal-kummer-duality; ColemanPowerSeriesPartII:AU.0/inverse-tate-twist; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity; ArithmeticGaloisDuality:R02.2/five-term-transgression.

**Source:** BKO2021, §4, p.954; Rubin1987, Proposition 5.2, p.412.

**Uses.** AU.2/anticyclotomic-kummer: Descend from G⁺-invariants to G⁺-coinvariants. AU.3/signed-annihilator: Identify signed kernels as orthogonal complements.

**API.**

- **kummer_pair** (data): The scalar-valued continuous bilinear pairing.
- **kummer_dual_equiv** (equivalence): The formal divisible points are the full continuous O-dual.
- **kummer_transfer** (compatibility): Formal trace is adjoint to restriction of unit characters.
- **kummer_galois** (relation): ⟨gy,gx⟩=⟨y,x⟩ after the inverse twist.

**Unit tests.**

- **zero_point** (degenerate): The identity formal point pairs to zero with every unit.
- **pi_balance** (characterisation): ⟨[π]y⊗π⁻(k+1),x⟩=⟨y⊗π⁻k,x⟩.
- **detect_nonzero** (non-example): Every nonzero divisible point has a nonzero pairing with some unit; the zero pairing fails.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

**Atlas planet:** Formal Kummer pairing.

### Anticyclotomic Kummer duality

**Target ColemanPowerSeriesPartII:AU.2/anticyclotomic-kummer (theorem).** The preceding pairing induces F(m_(Ψ_∞))⊗Φ/O × V_∞*→Φ/O and is perfect. In particular the G⁺-fixed part of F(m_(Θ_∞))⊗Φ/O is F(m_(Ψ_∞))⊗Φ/O, with its actual embedding.

**Construction or proof.** (1) Use the formal point torsion-freeness in the pro-p tower: a nonzero π-torsion point would require the tame degree p²−1. (2) Apply inflation-restriction and the vanished Ψ-tower Kummer defect to prove H¹(G⁺,F(m_(Θ_∞)))=0. (3) Then invariants commute with this divisible tensor in the stated case; duality takes invariants to the closed σ−1 quotient.

**Direct inputs:** ColemanPowerSeriesPartII:AU.2/formal-points-units-dual; ColemanPowerSeriesPartII:AU.0/anticyclotomic-quotient; ColemanPowerSeriesPartII:AU.2/formal-kummer-duality; ArithmeticGaloisDuality:R02.2/five-term-transgression.

**Source:** BKO2021, §4, p.954; Rubin1987, Proposition 5.4 and proof, p.412; Lemma 4.4, p.410.

**Acceptance:** Prove the divisible-invariant comparison using the Ψ-tower Kummer defect; do not commute invariants with tensor products without this argument.

**Atlas planet:** Anticyclotomic Kummer duality.

### Wiles’s explicit Kummer formula

**Target ColemanPowerSeriesPartII:AU.2/wiles-pairing (theorem).** For y∈F(m_(Θ_r)), k≥0, x∈U_∞* and sufficiently large m≥r, the named Kummer pairing is ⟨y⊗π⁻k,x⟩=π^(−m−1−k)Tr_(Φ_m/Φ)(δ_m(x)λ(y)) modulo O. The expression is independent of sufficiently large m and represents the pairing with the arithmetic Artin and π-adic basis conventions.

**Construction or proof.** (1) Transport Wiles’s Lubin–Tate reciprocity formula to the Coleman interpolation and the genuine π-adic Tate basis. (2) Prove the finite congruence modulo π^(m+1+k), then use trace compatibility to show independence of m. (3) Compare the symbol with the named Kummer/Artin pairing, including its sign; do not infer the formula from abstract nondegeneracy. The original Wiles proof remains source gap G2.

**Direct inputs:** ColemanPowerSeriesPartII:AU.2/formal-points-units-dual; ColemanPowerSeriesPartII:AU.1/coates-wiles; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/sign-generator-comparison; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity.

**Source:** BKO2021, §4, p.955; Rubin1987, Theorem 5.3, p.412.

**Acceptance:** Resolve G2 before closing the reciprocity proof; a height-one cyclotomic formula is insufficient.

**Atlas planet:** Wiles’s explicit reciprocity.

### Wiles’s dual-exponential comparison

**Target ColemanPowerSeriesPartII:AU.2/wiles-dual-exponential (comparison).** Let x=(x_n) be the actual inverse-twisted Kummer classes corresponding to a norm-compatible unit system, with x_n∈H¹(Φ_n,T⁻¹(1)), and identify D_dR⁰(T⁻¹(1)) with the invariant differential line using the specified CM/Lubin–Tate realization. For finite χ of Gal(Φ_n/Φ), the comparison to prove is Σ_(γ∈Gal(Φ_n/Φ)) χ(γ) exp*_n(x_n^γ)=δ_χ(x)ω, where δ_χ=π^(−n−1)Σγ χ(γ)δ_n(x)^γ and λ′(0)=1. This is the dual-exponential normalization used between BKO(3.4) and(3.6), distinct from the modulo-O Kummer trace formula; G2 requires verification of this exact normalization.

**Construction or proof.** (1) Use the exponential/dual-exponential adjunction of PadicHodgeRegulators L1 for the specified Lubin–Tate realization. (2) Evaluate against finite-level formal Kummer classes and apply Wiles’s trace formula, tracking inverse characters and Tate contraction. (3) Match the de Rham differential normalization with the CM period and pass to the character component; the exact Kato II.2.1.7 proof and normalization are gap G2.

**Direct inputs:** ColemanPowerSeriesPartII:AU.2/wiles-pairing; ColemanPowerSeriesPartII:AU.1/character-derivative; PadicHodgeRegulators:L1.

**Source:** BKO2021, §3, (3.4)–(3.6), pp.952–953; cited Kato 1993, Chapter II, Theorem 2.1.7.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

## AU.3. Signed characters, formal points and annihilators

Define character logarithms, finite and infinite signed formal points and opposite-parity signed local units. Prove the divisible-point sum, infinite O-rank, signed annihilator equality, zero intersection and Λ-rank upper bounds. These precede every use of signed freeness. Targets: Character logarithms; Signed formal points; Signed anticyclotomic units; Divisible signed-point sum; Infinite rank of both point signs; Signed annihilator theorem; Signed intersection and rank bounds. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** ColemanPowerSeriesPartII:AU.0; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8; ColemanPowerSeriesPartII:AU.1; ColemanPowerSeriesPartII:AU.2; PadicMeasuresIwasawaAlgebras:L4.

### Character logarithms

**Target ColemanPowerSeriesPartII:AU.3/character-logarithm (definition).** For y∈F(m_(Ψ_∞)) and finite χ of G⁻ choose n with y∈F(m_(Ψ_n)) and χ factoring through Gal(Ψ_n/Φ). Define λ_χ(y)=p⁻nΣ_{γ∈Gal(Ψ_n/Φ)}χ(γ)⁻¹λ(y)^γ. It is independent of a common larger n, O-linear and satisfies λ_χ(βy)=χ(β)λ_χ(y).

**Construction or proof.** (1) Use the formal logarithm on all maximal-ideal points; its inverse is used only on a sufficiently deep lattice. (2) Compare sums at consecutive levels: each lower conjugate appears p times. (3) Reindex to prove covariance and use character orthogonality.

**Direct inputs:** ColemanPowerSeriesPartII:AU.0/conductor-parity; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-fields.

**Source:** BKO2021, §4, p.955; Rubin1987, p.412 (definition) and Lemma 5.5(i)–(iv), p.413.

**Uses.** AU.3/signed-points: Select the signed point subgroups. AU.3/signed-annihilator: Perform Fourier expansion of the reciprocity formula.

**API.**

- **character_log_level_independence** (compatibility): Enlarging the common point/character layer does not change λ_χ.
- **character_log_covariance** (relation): λ_χ(βy)=χ(β)λ_χ(y).
- **character_log_trace** (compatibility): λ_χ(Tr_(Ψ_m/Ψ_n)y)=p^(m−n)λ_χ(y) for χ at level n.
- **character_log_resolution** (characterisation): λ(y)=Σ_χ λ_χ(y) over all characters of the containing finite quotient.

**Unit tests.**

- **base_point** (computation): For y∈F(m_Φ), λ₁(y)=λ(y) and λ_χ(y)=0 for nontrivial χ.
- **new_character** (computation): A character not factoring through the point layer has λ_χ(y)=0 after passage to a common layer.
- **positive_covariance** (non-example): The covariance factor is χ(β), inverse to that for δ_χ.

**Acceptance:** For a base point only the trivial character logarithm survives; taking a common larger layer leaves its value unchanged.

**Atlas planet:** Character logarithms.

### Signed formal points

**Target ColemanPowerSeriesPartII:AU.3/signed-points (definition).** For ε∈{+,−}, define A^ε={y∈F(m_(Ψ_∞)):λ_χ(y)=0 for every χ∈Ξ^ε}, killing the same parity. Define F^ε(Ψ_n)=A^ε∩F(m_(Ψ_n)). Their inclusions are injective O-linear Galois maps and A^ε=⋃_n F^ε(Ψ_n); retain these finite groups as the signed local-condition exports.

**Construction or proof.** (1) Intersect kernels of the linear character logarithms. (2) Use field inclusions and level independence to identify the finite intersection with the finite-level equations. (3) Take the directed union inside the actual formal point group.

**Direct inputs:** ColemanPowerSeriesPartII:AU.3/character-logarithm.

**Source:** BKO2021, §4, p.955 (A^±); §6.0.2, p.962 (F^±(Ψ_n)); Rubin1987, p.413.

**Uses.** AU.8/minus-point-invariants: Control the minus divisible-point invariants. InertAnticyclotomicCMMainConjecture and Selmer consumers: Use these finite local subgroups rather than redefining their signs.

**API.**

- **signed_points_mem** (characterisation): Membership is the same-parity vanishing condition.
- **finite_signed_points_inclusion** (functoriality): Field extension carries F^ε(Ψ_n) into F^ε(Ψ_m).
- **finite_signed_points_trace** (compatibility): Formal trace maps F^ε(Ψ_m) to F^ε(Ψ_n).
- **signed_points_union** (relation): A^ε is the union of the finite signed groups.
- **base_minus_points** (compatibility): F(m_Φ)⊂A⁻, while A⁺∩F(m_Φ)=0.

**Unit tests.**

- **base_plus_zero** (degenerate): Since 1∈Ξ⁺ and λ is injective on the torsion-free pro-p tower, the plus base group is zero.
- **base_minus_all** (computation): All formal Φ-points lie in the minus group.
- **wrong_parity** (non-example): A nonzero pure character component of conductor p³ lies in A⁺ and is excluded from A⁻.

**Acceptance:** At level0 the plus group is0 and the minus group is the full formal point lattice; a conductor3 component has the opposite point sign.

**Atlas planet:** Signed formal points.

### Signed anticyclotomic units

**Target ColemanPowerSeriesPartII:AU.3/signed-units (definition).** Define V_∞*,+=⋂_{χ∈Ξ⁻}ker δ_χ and V_∞*,−=⋂_{χ∈Ξ⁺}ker δ_χ as closed Λ-submodules of V_∞*. Thus the unit sign kills opposite parity, in contrast with the formal point sign.

**Construction or proof.** (1) Use character derivative descent and inverse-character evaluation to prove each kernel is a Λ-submodule. (2) Intersect closed kernels and retain the inherited compact topology. (3) For the minus group, use χ=1 and δ₁=(1+p⁻¹)δ to deduce δ=0.

**Direct inputs:** ColemanPowerSeriesPartII:AU.1/derivative-descent; ColemanPowerSeriesPartII:AU.1/delta-trivial-relation; ColemanPowerSeriesPartII:AU.0/conductor-parity.

**Source:** BKO2021, §2, displayed definition of V*,± , p.949; Rubin1987, §2, p.408.

**Uses.** AU.4/optimal-unit: Locate ξ* in the plus module. AU.9/rubin-decomposition: State the integral direct sum.

**API.**

- **signed_units_mem** (characterisation): v is in sign ε iff every derivative of opposite parity vanishes.
- **signed_units_closed** (structure): Each sign is a closed compact Λ-submodule.
- **minus_delta_zero** (relation): δ vanishes on V_∞*,− because the trivial character is plus.
- **signed_units_base_change** (compatibility): For a finite extension R of O inside C_p, V_∞*,ε⊗_O R is the set of X∈V_∞*⊗_O R whose R-linearly extended derivatives (δ_χ⊗R)(X), evaluated in C_p, vanish for every χ of the opposite parity. Flatness of R gives this with values in Φ_n⊗_O R. Since τ∈Gal(Φ_n/Φ) carries δ_χ(x) to a nonzero multiple of δ_(τ∘χ)(x), the opposite-parity class is stable under such τ, and every embedding of Φ_n⊗_Φ Frac(R) into C_p over the given embedding of R is the given one composed with some τ⊗1, vanishing in C_p implies vanishing in Φ_n⊗_O R. Flatness and exactness alone do not give the C_p-valued statement.

**Unit tests.**

- **trivial_character** (non-example): A vector with δ≠0 cannot belong to V_∞*,−.
- **opposite_parity** (characterisation): A vector in V_∞*,+ must have zero derivative at every exact order p² character.
- **generator_covariance** (characterisation): Multiplying by λ∈Λ preserves a sign, including when ev_(χ⁻¹)(λ)=0.

**Acceptance:** A nonzero augmentation derivative excludes the minus unit module; the χ=1 normalization must be inserted before that inference.

**Atlas planet:** Signed anticyclotomic units.

### Divisible signed-point sum

**Target ColemanPowerSeriesPartII:AU.3/formal-points-parity-sum (theorem).** For n≥0, p^nF(m_(Ψ_n))⊂F⁺(Ψ_n)+F⁻(Ψ_n) and F⁺(Ψ_n)∩F⁻(Ψ_n)=0. Consequently F(m_(Ψ_∞))⊗Φ/O=(A⁺⊗Φ/O)+(A⁻⊗Φ/O). The finite integral lattice sum is only finite index; no integral equality is asserted.

**Construction or proof.** (1) Group character projectors by conductor parity. Multiplying by |Gal(Ψ_n/Φ)|=p^n clears their denominators. (2) Use the integral trace operators and the formal group law to realize the projected points; logarithmic injectivity proves the equality and zero intersection. (3) After tensoring Φ/O, multiplication by p^n is surjective and yields the stated sum.

**Direct inputs:** ColemanPowerSeriesPartII:AU.3/signed-points; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log.

**Source:** BKO2021, §4, (4.2), p.955; Rubin1987, Lemma 5.5(v)–(vi) and (7), p.413.

**Acceptance:** Check levels0 and1 and retain the p^n denominator bound: the integral finite sum is not asserted to be the full lattice.

**Atlas planet:** Signed-point parity sum.

### Infinite rank of both point signs

**Target ColemanPowerSeriesPartII:AU.3/formal-points-infinite-rank (theorem).** Both A⁺ and A⁻ have infinite O-rank. Their rational logarithm spans at finite levels are the sums of precisely the complementary conductor-parity character components, including the trivial component only for A⁻.

**Construction or proof.** (1) Use normal bases for Ψ_n/Φ and character orthogonality to compute the two rational subspaces. (2) Choose deep integral lattices where λ has an analytic inverse, producing independent actual formal points in each permitted component. (3) Their dimensions grow along alternate conductor levels.

**Direct inputs:** ColemanPowerSeriesPartII:AU.3/signed-points; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log.

**Source:** BKO2021, §4, (4.2), p.955; Rubin1987, proof of Proposition 5.6, p.413; Corollary 5.8, p.414.

**Acceptance:** At arbitrarily large alternate conductor levels produce actual independent points using a deep logarithm lattice, not merely abstract character vectors.

### Signed annihilator theorem

**Target ColemanPowerSeriesPartII:AU.3/signed-annihilator (theorem).** Under the named perfect anticyclotomic Kummer pairing, Ann(A^ε⊗Φ/O)=V_∞*,ε for the same displayed sign ε. Hence A^ε⊗Φ/O is the continuous dual of V_∞*/V_∞*,ε.

**Construction or proof.** (1) Expand the Wiles trace pairing into character components; δ_χ and λ_χ have inverse covariance, so only matching components contribute. (2) A^ε has logarithm components of parity opposite ε, giving the inclusion in its annihilator. (3) For the converse, test against sufficiently deep pure-character logarithm lattices and their Galois conjugates. A nonzero δ_χ of that opposite parity produces a nonzero Φ/O pairing after suitable π-division.

**Direct inputs:** ColemanPowerSeriesPartII:AU.2/anticyclotomic-kummer; ColemanPowerSeriesPartII:AU.2/wiles-pairing; ColemanPowerSeriesPartII:AU.3/signed-units; ColemanPowerSeriesPartII:AU.3/character-logarithm; ColemanPowerSeriesPartII:AU.3/formal-points-infinite-rank.

**Source:** BKO2021, §4, p.955; Rubin1987, Proposition 5.6 and proof, p.413; Corollary 5.7, p.414.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

**Atlas planet:** Signed annihilator theorem.

### Signed intersection and rank bounds

**Target ColemanPowerSeriesPartII:AU.3/signed-rank-upper (theorem).** V_∞*,+∩V_∞*,−=0 and rank_Λ V_∞*,ε≤1 for each sign. In particular neither freeness of a sign nor the integral sum is an input here.

**Construction or proof.** (1) The divisible-point sum and perfectness force the intersection of the annihilators to vanish. (2) The quotient Q^ε=V_∞*/V_∞*,ε embeds into a product of characteristic-zero derivative spaces and is O-torsion-free. If its Λ-rank were zero, a nonzero f∈Λ would kill it. Divide f by its largest p-power using O-torsion-freeness; Weierstrass preparation then makes Q^ε finite over O. Its Φ/O-dual would have finite O-corank, contrary to the infinite O-rank of A^ε. Thus each quotient has positive Λ-rank. (3) Combine the positive quotient rank with rank_Λ V_∞*=2.

**Direct inputs:** ColemanPowerSeriesPartII:AU.3/signed-annihilator; ColemanPowerSeriesPartII:AU.3/formal-points-parity-sum; ColemanPowerSeriesPartII:AU.3/formal-points-infinite-rank; ColemanPowerSeriesPartII:AU.0/units-free; PadicMeasuresIwasawaAlgebras:L4; PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local.

**Source:** BKO2021, §4, p.955; Rubin1987, Corollary 5.8 and proof, p.414.

**Acceptance:** Exclude the counterexample Λ/(p) from the torsion-rank argument by proving that these specific quotients are O-torsion-free.

## AU.4. An optimal signed unit

Choose the auxiliary quadratic field and import the early canonical CM character, elliptic zeta classes, functional equation and Finis unit-value theorem. Construct the exact localized and projected element ξ_ν, compute δ and δ_χ, and descend a unit derivative to ξ*∈V_∞*,+. The early analytic supplier must be independent of Rubin’s decomposition and final p-adic L-function. Targets: Auxiliary imaginary quadratic field; Early CM special-value input; Localized auxiliary elliptic unit; Auxiliary-unit derivative formulas; Auxiliary-unit sign; Optimal signed unit. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; ComplexMultiplicationAndExplicitReciprocity:CM.1; AutomorphicLFunctionsAndLocalFactors:AL.1; ComplexMultiplicationAndExplicitReciprocity:CM.4; AutomorphicPadicLFunctions:L3; ColemanPowerSeriesPartII:AU.0; ColemanPowerSeriesPartII:AU.2; ArithmeticGaloisDuality:R02.1; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; ColemanPowerSeriesPartII:AU.1; ColemanPowerSeriesPartII:AU.3; PadicMeasuresIwasawaAlgebras:L4.

### Auxiliary imaginary quadratic field

**Target ColemanPowerSeriesPartII:AU.4/auxiliary-quadratic (theorem).** For every p≥5 there exists an imaginary quadratic K of odd discriminant D≡1 mod 8 such that p is inert and p∤h_K. One may arrange |D|<8p; for p>47 the bound h_K≤√|D|·(2+log|D|)/π_real<p suffices, and p≤47 is checked by explicit reduced-form class numbers.

**Construction or proof.** (1) Choose 1≤m≤p−1 with (−m/p)=−1 and 0≤k≤7 with m+kp≡7 mod8. Remove the odd square factor from −(m+kp) to obtain D. (2) Use ζ_K(s)=ζ_Q(s)L(s,χ_D) and the imported analytic residue formula to obtain h(D)=√|D| L(1,χ_D)/π_real (D<−4 here). Periodicity and zero mean give |Σ_(a≤t)χ_D(a)|≤|D|; split the L-series at |D| and use summation by parts on the tail to obtain L(1,χ_D)≤2+log|D|. The resulting bound is <p at p=53 and its ratio to p decreases for p≥53. (3) For primes 5 through47 use the reader’s table. Enumerate primitive reduced positive binary quadratic forms b²−4ac=D with |b|≤a≤c and a≤√(|D|/3), choosing b≥0 on the boundaries. The reduced-form/ideal-class dictionary of ComplexMultiplicationAndExplicitReciprocity CM.1/quadratic-forms-dictionary, with Pic(O_D)=Cl(K) for fundamental D, certifies the listed class numbers.

**Direct inputs:** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; ComplexMultiplicationAndExplicitReciprocity:CM.1/quadratic-forms-dictionary; AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume.

**Source:** BKO2021, Lemma 3.1 and proof, p.950.

**Acceptance:** For p=5 use D=−7,h=1; for p=7 use D=−15,h=2. Check D≡1mod8 and inertness on every finite table row.

**Atlas planet:** Auxiliary quadratic field.

### Early CM special-value input

**Target ColemanPowerSeriesPartII:AU.4/early-cm-interface (application).** For the auxiliary K choose the canonical type-(1,0) Hecke character φ, a Gross Q-curve E/H with good reduction at p, a Néron differential ω and period Ω with lattice ΩO_K, and a split ℓ≥5 prime to h_K f_φ with p∤(ℓ−1). For ν of ℓ-power anticyclotomic order, import integral norm-compatible zeta classes z_(fℓ^m), their precise Kato (15.9) dual-exponential formula, the local splitting/disjointness comparisons, W(φ)=+1 and the unit theorem Ω⁻¹L_f(φ̄ν,1)∈W× for all but finitely many ν. Here Finis’s tower prime is ℓ, valuation prime is p; no ordinary CM type at p is assumed. Write conductor(ν)=ℓ^m, m≥2 for nontrivial ν, so ord(ν)=ℓ^(m−1) and ν factors through the degree-ℓ^(m−1) layer L_(m−1).

**Construction or proof.** (1) Use CM.4/canonical-gross-character and gross-curve-good-reduction for the algebraic realization. (2) Use the proposed nonordinary CM continuation’s early outputs for the ℓ choice, normalized elliptic-unit class, period, root numbers and Finis specialization. These are explicit requests R-CM, not consequences of the ordinary Katz stage. (3) Check the removed ℓ-factor is 1 for the selected ramified ν and conductor fℓ^m. Keep the prime-to-p denominators and finite coefficient extension visible.

**Direct inputs:** ColemanPowerSeriesPartII:AU.4/auxiliary-quadratic; ComplexMultiplicationAndExplicitReciprocity:CM.4/canonical-gross-character; ComplexMultiplicationAndExplicitReciprocity:CM.4/gross-curve-good-reduction; AutomorphicPadicLFunctions:L3; AutomorphicLFunctionsAndLocalFactors:AL.1; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters.

**Source:** BKO2021, §§3.0.1–3.0.3, (3.1)–(3.5), (3.8)–(3.9), pp.950–954.

**Acceptance:** Check ℓ is the character-tower prime and p the valuation prime in the Finis input. No decomposition or final Rubin p-adic L-function occurs in the input graph.

### Localized auxiliary elliptic unit

**Target ColemanPowerSeriesPartII:AU.4/xi-nu (construction).** Let R/O contain φ and ν and let M_(n,m)=H(E[p^(n+1)])L_(m−1), where conductor(ν)=ℓ^m, m≥2, ord(ν)=ℓ^(m−1) and [L_j:K]=ℓ^j. Define ξ_ν∈U_∞*⊗_O R by the composite: inverse of the untwisting isomorphism (3.5); corestriction from K(fℓ^m p^(n+1)) to M_(n,m); localization at p; the L_m group-ring splitting; evaluation at ν; projection R[Gal(H/K)]→R; Δ-invariants; and the Kummer identification. Its anticyclotomic image is denoted by the same symbol when the target is stated. For ν=1 set m=0 and use L_0=K, z_f and M_(n,0)=H(E[p^(n+1)]); no negative layer is used.

**Construction or proof.** (1) Construct each map on the specified cohomology carrier, with corestriction and norm compatibility at every p-level. (2) Use the imported disjointness and complete splitting at the selected p-adic place for both group-ring decompositions. Reindex the ℓ-layer by conductor minus one; a character of order ℓ^m would require conductor ℓ^(m+1), so it cannot be localized from z_(fℓ^m) unchanged. (3) Track the coefficient representation T⁻¹(1), the actual Tate basis and every Galois action through the composite.

**Direct inputs:** ColemanPowerSeriesPartII:AU.4/early-cm-interface; ColemanPowerSeriesPartII:AU.0/anticyclotomic-quotient; ColemanPowerSeriesPartII:AU.2/formal-points-units-dual; ArithmeticGaloisDuality:R02.1/completed-tensor-comparison; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

**Source:** BKO2021, §3.0.2, displayed composite and (3.5), pp.952–953.

**Uses.** AU.4/xi-values: Compute its two distinct derivative formulas. AU.4/xi-signed: Use the functional equation to place its projection in a sign.

**API.**

- **xi_finite_level** (projection): The n-th projection is the stated corestriction/localization/evaluation composite.
- **xi_norm_compatibility** (compatibility): Corestriction in the p-tower matches the unit norm maps.
- **xi_galois_equivariant** (relation): The complete composite is Γ-equivariant with the inverse Tate action.
- **xi_coefficient_extension** (functoriality): Enlarging R carries ξ_ν to its scalar extension, independently of the choice of enlargement.

**Unit tests.**

- **trivial_evaluation** (degenerate): For ν=1 the L_0 group-ring map is augmentation.
- **nontrivial_evaluation** (non-example): For h∈Gal(L_(m−1)/K), for conductor exponent m≥2, evaluation sends [h] to ν(h), not ν(h)⁻¹.
- **norm_projection_square** (compatibility): Computing at p-level n+1 then norming equals the level n composite.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

**Atlas planet:** Localized auxiliary elliptic unit.

### Auxiliary-unit derivative formulas

**Target ColemanPowerSeriesPartII:AU.4/xi-values (theorem).** For ξ_ν from the preceding construction, δ(ξ_ν)=Ω⁻¹L_(ℓ^m f)(φ̄ν,1), retaining the p-Euler factor, and δ_χ(ξ_ν)=Ω⁻¹L_(ℓ^m p f)(φ̄νχ,1) for every finite χ of Γ, including χ=1. Only φ is conjugated in these formulas; ν and χ are not silently inverted. At χ=1 the formulas agree through δ₁=(1+p⁻¹)δ.

**Construction or proof.** (1) Apply the imported Kato zeta-class formula before local projection. (2) Use the distinct Wiles dual-exponential comparison, then character evaluation and the fixed differential/period normalization. (3) For the augmentation formula restore the p-factor and use φ̄ν(pO_K)=−p.

**Direct inputs:** ColemanPowerSeriesPartII:AU.4/xi-nu; ColemanPowerSeriesPartII:AU.2/wiles-dual-exponential; ColemanPowerSeriesPartII:AU.1/delta-trivial-relation.

**Source:** BKO2021, (3.6)–(3.7) and Proposition 3.3(1)–(2), p.953.

**Acceptance:** At χ=1 compare the two formulas by the factor1+p⁻¹, and conjugate only φ; the nontrivial ν has conductorℓ^m and orderℓ^(m−1).

**Atlas planet:** Auxiliary-unit derivative formulas.

### Auxiliary-unit sign

**Target ColemanPowerSeriesPartII:AU.4/xi-signed (theorem).** If ε=W(φ), the anticyclotomic image of ξ_ν belongs to V_∞*,ε⊗R. For a nontrivial anticyclotomic χ with conductor exponent c, W(φ̄νχ)=(−1)^cW(φ); opposite sign forces the central L-value and δ_χ to vanish. If ε=−, the required trivial-character vanishing follows separately from W(φ̄ν)=−1.

**Construction or proof.** (1) Use the conjugation-stable conductor, χ(fℓ^m)=1 and the imported local root-number formula. (2) Apply the functional equation at the central point and the derivative formula. (3) Handle χ=1 explicitly when the sign is minus (source issue E11). Pass from the vanishing of the C_p-valued derivatives of ξ_ν to membership in V_∞*,ε⊗R by AU.3/signed-units signed_units_base_change: Galois conjugation of the character values preserves conductor parity, so vanishing under the given embedding gives vanishing in Φ_n⊗_O R, and flatness of R identifies the common kernel with V_∞*,ε⊗R.

**Direct inputs:** ColemanPowerSeriesPartII:AU.4/xi-values; ColemanPowerSeriesPartII:AU.4/early-cm-interface; ColemanPowerSeriesPartII:AU.3/signed-units; AutomorphicLFunctionsAndLocalFactors:AL.1.

**Source:** BKO2021, Proposition 3.3(3) and proof, p.953.

**Acceptance:** For root sign− include the trivial-character vanishing; for root sign+ the trivial character is allowed to have a nonzero value.

### Optimal signed unit

**Target ColemanPowerSeriesPartII:AU.4/optimal-unit (theorem).** There exists ξ*∈V_∞*,+ with δ(ξ*)∈O×. This existence is established before any assertion that V_∞*,+ is Λ-free.

**Construction or proof.** (1) Take ν from the early Finis unit theorem and combine xi-values, xi-signed and W(φ)=+1. Then ξ_ν lies in V_∞*,+⊗R and δ(ξ_ν) is a unit of R; BKO write W, and any finite coefficient ring containing the values of φ and ν may be used. (2) Let I=δ(V_∞*,+)⊂O. Its extension IR contains a unit, so IR=R; since O→R is a finite extension of discrete valuation rings, I=O. (3) Choose ξ* mapping to a unit. This avoids using Rubin Proposition 8.1 as an unexplained prior signed-freeness result.

**Direct inputs:** ColemanPowerSeriesPartII:AU.4/xi-signed; ColemanPowerSeriesPartII:AU.4/early-cm-interface; ColemanPowerSeriesPartII:AU.3/signed-units; PadicMeasuresIwasawaAlgebras:L4.

**Source:** BKO2021, Theorem 3.4 and proof, pp.953–954.

**Acceptance:** The image ideal I=δ(V_∞*,+) satisfies IW=W, hence I=O. No choice of a plus-module Λ-generator is an input.

**Atlas planet:** Optimal signed unit.

## AU.5. An unramified formal CM point

Import general supersingular finite-field arithmetic and modular parametrizations. Prove the three BKO ramification/counting applications, the prime-to-p fine-level comparison, and the primitive formal CM point. Scalar Frobenius and Honda theory remain owned by LT.4. Handle p=47 with the exceptional j count. Targets: Auxiliary supersingular rational elliptic curve; Optimal parametrization and separable reduction; Ramification bound; Prime-to-p modular j-fibres; Nonelliptic supersingular count; Exceptional supersingular count; Fine-level unramified lift; Primitive formal CM point. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; EllipticCurveModularity:R29.5; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4; ModularCurvesPartII:R13.4; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula; tauceti:TauCetiRoadmap/ModularCurves#9c-axiomatic-regularity-of-quotients; tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n; tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0.

### Auxiliary supersingular rational elliptic curve

**Target ColemanPowerSeriesPartII:AU.5/supersingular-auxiliary (theorem).** For every p≥5 there is an elliptic curve E/Q with good reduction at p and a_p(E)=0. After replacing it by the optimal curve in its Q-isogeny class it still has good supersingular reduction and trace zero, and Ê⊗O≃F for π=−p.

**Construction or proof.** (1) Import existence of a supersingular j∈F_p and a nonsingular Weierstrass model over F_p from the finite-field supplier. Lift its coefficients to integers; the discriminant remains a p-unit, yielding E/Q. (2) For p≥5, supersingularity over F_p gives p∣a_p and the Hasse bound forces a_p=0. (3) Use isogeny invariance of the local L-factor/good reduction and apply LT.4/elliptic-honda-comparison. No unverified use of Cox’s uncleared book is needed.

**Direct inputs:** tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; EllipticCurveModularity:R29.5/isogeny-to-E; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison.

**Source:** BKO2021, §5.0.1, p.955.

**Acceptance:** The explicit j=0 model covers p≡2mod3 and j=1728 covers p≡3mod4; the remaining residue class uses the stated finite-field existence contract.

**Atlas planet:** Auxiliary supersingular curve.

### Optimal parametrization and separable reduction

**Target ColemanPowerSeriesPartII:AU.5/manin-separability (comparison).** For the optimal E of conductor N with p∤N, let f:X₀(N)→E be its strong Weil parametrization. It extends to the smooth Z_p models, and its reduction f̄ is nonconstant and separable: f*ω_E=c_E f_E(q)dq/q with c_E∈Z_p× and normalized q-coefficient 1. A prime-to-p scalar multiple of f retains separability and being unramified at a chosen point.

**Construction or proof.** (1) Import the exact modular parametrization and Hecke eigendifferential. (2) Use the Néron mapping property and the requested Manin p-unit theorem for optimal curves at odd primes of good reduction. (3) Reduce the nonzero differential to prove separability; compose with a prime-to-p multiplication map, whose differential is a unit.

**Direct inputs:** ColemanPowerSeriesPartII:AU.5/supersingular-auxiliary; EllipticCurveModularity:R29.5/modular-parametrisation; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv; ModularCurvesPartII:R13.4; EllipticCurveModularity:R29.5.

**Source:** BKO2021, §5.0.1, p.955; AbbesUllmo1996, Théorème A, p.269.

**Acceptance:** A merely rational nonzero differential constant could reduce to0. Show the actual optimal Manin constant is a p-unit before claiming separability.

### Ramification bound

**Target ColemanPowerSeriesPartII:AU.5/ramification-count (theorem).** Let μ=[SL₂(Z):Γ₀(N)]=N∏_{ℓ∣N}(1+ℓ⁻¹). The number of geometric points where f̄:X₀(N)_(F_p)→E_(F_p) ramifies is at most 2g(X₀(N))−2≤μ/6. Count points without multiplicity; the different divisor supplies the multiplicities.

**Construction or proof.** (1) Apply separable Riemann–Hurwitz with elliptic target genus one. (2) Each ramification point contributes at least one to the effective different, including possible wild ramification. (3) Use the full Γ₀(N) genus formula, with cusp and elliptic-point terms retained.

**Direct inputs:** ColemanPowerSeriesPartII:AU.5/manin-separability; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula; ModularCurvesPartII:R13.4.

**Source:** BKO2021, Lemma 5.2(i) and proof, pp.956–957.

**Acceptance:** For N=27 and32 the modular curve has genus1, so the separable parametrization has no ramification; the different formula must reproduce this case.

**Atlas planet:** Ramification bound.

### Prime-to-p modular j-fibres

**Target ColemanPowerSeriesPartII:AU.5/moduli-etale (comparison).** For p≥5 and p∤N, the coarse Y₀(N)→A¹_j map is étale above j≠0,1728 and has μ geometric points in each such fibre. Above j=0 and1728 the stabilizer indices are at most3 and2, giving at least μ/3 and μ/2 points respectively. For an elliptic curve with scalar q-Frobenius [±p], every prime-to-p cyclic subgroup is Frobenius-stable, so the corresponding coarse moduli points are F_(p²)-rational. Scalar Frobenius does not make every torsion point rational.

**Construction or proof.** (1) Import the modular quotient and prime-to-p level moduli statements; apply them to the j-map. (2) Use Aut(E)/{±1} of orders3 and2 at the exceptional invariants, and the quotient fibre degree formula. (3) Apply LT.4’s scalar Frobenius: multiplication by an integer stabilizes each subgroup, even when it acts nontrivially on its elements.

**Direct inputs:** tauceti:TauCetiRoadmap/ModularCurves#9c-axiomatic-regularity-of-quotients; tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n; ModularCurvesPartII:R13.4; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1.

**Source:** BKO2021, Lemma 5.1(i), p.956; proof of Lemma 5.2, p.957.

**Acceptance:** Scalar Frobenius preserves every cyclic subgroup, but need not fix every torsion point. Keep μ fibres away from the two exceptional j-values.

### Nonelliptic supersingular count

**Target ColemanPowerSeriesPartII:AU.5/generic-supersingular-count (theorem).** The number of points of X₀(N)(F_(p²)) represented by curves of trace ±2p with j≠0,1728 is at least μ( floor((p−1)/12)−3/2+(−3/p)+(1/2)(−1/p) ). This lower bound exceeds μ/6 for p≡1 mod12 or p≥31 with p≠47, so an unramified point of this kind exists in that range. At p=47 the bound is zero and proves no such conclusion. In fact the same supplied mass/twist classification gives the stronger bound μ floor((p−1)/12), since each nonexceptional supersingular j has scalar-trace models. It gives a generic unramified point for every p≥13, including47; retain the weaker printed bound as a regression check.

**Construction or proof.** (1) Import Deuring’s supersingular j count and Schoof’s F_(p²)-isomorphism-class counts, including twists, from the finite-field continuation. (2) Remove the two exceptional j contributions and multiply the remaining fibre count by μ using moduli-etale. (3) Evaluate the four residue classes modulo12 and check the finite boundary primes; compare with ramification-count. (4) For the stronger count, all trace classes other than ±2p in the supplied classification occur only at j=0 or1728. Every one of the floor((p−1)/12) other supersingular j-values contributes μ rational points represented by scalar-trace models.

**Direct inputs:** ColemanPowerSeriesPartII:AU.5/ramification-count; ColemanPowerSeriesPartII:AU.5/moduli-etale; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1.

**Source:** BKO2021, Lemma 5.2(ii), p.956, and proof, p.957, with correction E2.

**Acceptance:** At p=47 the weaker coefficient is0 and the sharper coefficient is3; no existence claim is deduced from a zero lower bound.

**Atlas planet:** Nonelliptic supersingular count.

### Exceptional supersingular count

**Target ColemanPowerSeriesPartII:AU.5/exceptional-supersingular-count (theorem).** If p≡2 mod3, at least μ/3 points with j=0 in X₀(N)(F_(p²)) have trace ±2p representatives. If p≡3 mod4, at least μ/2 such points have j=1728. Each lower bound exceeds μ/6 and gives an unramified point for f̄. Combined with the generic count, an appropriate point exists for every p≥5, including p=47.

**Construction or proof.** (1) Use the finite-field supersingularity criteria for j=0,1728 and models over F_p; a_p=0 gives a_(p²)=−2p. (2) Use the exceptional fibre bounds and compare with the ramification divisor. (3) Check p mod12=5,7,11 against the exceptional cases and residue1 against the generic case.

**Direct inputs:** ColemanPowerSeriesPartII:AU.5/moduli-etale; ColemanPowerSeriesPartII:AU.5/ramification-count; ColemanPowerSeriesPartII:AU.5/generic-supersingular-count; tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1.

**Source:** BKO2021, Lemma 5.2(iii), p.956, and proof, p.957.

**Acceptance:** At p=5 use j=0 and the μ/3 bound; at p=7 use j=1728 and the μ/2 bound. At47 both exceptional routes are available.

**Atlas planet:** Exceptional supersingular count.

### Fine-level unramified lift

**Target ColemanPowerSeriesPartII:AU.5/fine-level-unramified (theorem).** Choose an unramified supersingular P∈X₀(N)(F_(p²)) with scalar Frobenius and prime-to-p auxiliary Γ₁(M) rigidification, giving P′ on the fine curve X₀(N;M). The forgetful map is unramified at P′. For exceptional j one may choose the auxiliary optimal curve at N=27 (j=0 case) or N=32 (j=1728 case) to remove the relevant elliptic stabilizer. After multiplying f by #E(F_(p²)), P maps to zero and the completed local morphism f′ at P′→0 is an O-isomorphism.

**Construction or proof.** (1) If q-Frobenius is [s p], s∈{±1}, choose M=|s p−1|=p−s≥4. Then A[M] is rational over F_(p²), and an exact-order M point gives fine Γ₁(M) level. Since every prime divisor of M is <p−1, neither φ(M) nor the primitive-level covering degree is divisible by p. Use the prime-to-p level moduli theorem. (2) Away from exceptional j the action has no elliptic stabilizer; in the exceptional cases verify the explicit N=27 or32 models, absence of the relevant elliptic points and a_p=0. (3) The scalar #E(F_(p²))=(p+1)² is a p-unit. The resulting map is unramified between smooth relative curves with the same residue field, so its completed local map is an isomorphism.

**Direct inputs:** ColemanPowerSeriesPartII:AU.5/exceptional-supersingular-count; ColemanPowerSeriesPartII:AU.5/manin-separability; tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves; tauceti:TauCetiRoadmap/ModularCurves#9c-axiomatic-regularity-of-quotients; ModularCurvesPartII:R13.4.

**Source:** BKO2021, §5.0.1, pp.957–958.

**Acceptance:** Verify exact-order M=p−s rational level for scalar Frobenius[s p], prime-to-p cover degree, and the N=27/32 stabilizer checks at the exceptional points.

### Primitive formal CM point

**Target ColemanPowerSeriesPartII:AU.5/primitive-formal-cm-point (construction).** Choose Q∈Ê(m_Φ) with Q∉pÊ(m_Φ), using Ê(m_Φ)≃pO under the formal logarithm at the unramified base. Lift Q through the completed-local isomorphism at P′ to an O-point representing an elliptic scheme A/O with the prescribed prime-to-p levels. Its formal group has CM by O through the imported Honda comparison, while f(P)=Q. No global CM for A is asserted.

**Construction or proof.** (1) For p≥5 and the height-two formal group over the absolutely unramified O, the logarithm is an isomorphism F(pO)≃pO: its higher terms increase valuation and its inverse converges on pO. Choose logarithm p times a unit. A deep inverse alone would not guarantee primitivity in the entire base lattice. (2) Use formal smoothness/properness to algebraize the lifted point on the fine integral curve and read its universal elliptic curve. (3) Apply the scalar-Frobenius/Honda comparison to A; retain the sign of the parameter ±p separately from the fixed target F for −p.

**Direct inputs:** ColemanPowerSeriesPartII:AU.5/fine-level-unramified; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3/elliptic-deformation-comparison; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.0/analytic-log.

**Source:** BKO2021, §5.0.1, (5.1), p.958.

**Uses.** AU.6/quasicanonical-modular-points: Start the marked quasi-canonical quotient system. AU.7/optimal-point-system: Define y=(p+1)Q and its primitive trace system.

**API.**

- **primitive_point_image** (projection): The chosen O-valued moduli point maps to Q in the formal neighbourhood of zero.
- **primitive_point_nondivisible** (characterisation): Q is not in pÊ(m_Φ).
- **formal_cm_comparison** (equivalence): Â has the integral formal O-action and the marked Tate-module comparison.
- **primitive_point_base_change** (compatibility): All level and point data extend to the chosen finite complete extensions.

**Unit tests.**

- **zero_rejected** (degenerate): Q=0 fails primitivity.
- **p_multiple_rejected** (non-example): Q=[p]R fails primitivity for every R.
- **unit_multiple** (characterisation): Multiplication by any b∈O× preserves primitivity, including b=p+1.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

**Atlas planet:** Primitive formal CM point.

## AU.6. Completion models and modular quasi-canonical points

Present Φ and the local ring-class tower as selected Dedekind completions so the pinned formal point map applies. Import the marked quasi-canonical lattice quotients and field identifications from LT.5/LT.7/LT.8; add prime-to-p modular level and prove that their parametrized images lie in the target elliptic formal group. Targets: Dedekind completion models; Modular quasi-canonical points; Formal image of the modular points. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** ColemanPowerSeriesPartII:AU.4; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8; ComplexMultiplicationAndExplicitReciprocity:CM.3; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence; ColemanPowerSeriesPartII:AU.5; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5; ModularCurvesPartII:R13.4; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9.

### Dedekind completion models

**Target ColemanPowerSeriesPartII:AU.6/dedekind-completion-models (comparison).** Choose the inert p-adic place of an auxiliary imaginary quadratic K and a compatible prime in each ring class field H_(p^s) of conductor p^s (the ring class field, not the ray class field written K(g) in BKO §3). Then Φ is the completion K_p and Ψ′_s is the completion of H_(p^s) at that selected prime, over the selected Hilbert-class-field prime. The local norm subgroup is Q_p×(1+p^sO) under local reciprocity, with inertia quotient (O/p^sO)×/(Z/p^sZ)×. For s≥1 its degree is p^(s−1)(p+1); Ψ′_0=Φ. These equivalences commute with inclusions, Galois actions and formal traces. No uniqueness of the prime above p in the entire global ring class field is asserted.

**Construction or proof.** (1) Use that the inert ideal pO_K is principal and hence splits completely in H/K, then select a prime of H once. (2) Apply global/local Artin compatibility and the ring-class idele subgroup to identify the local decomposition quotient and its norm subgroup. (3) Match the quotient with LT.7/bko-quasi-fields and LT.8/field-generator-comparisons, retaining the marking. (4) Transport the valuation ring and maximal ideal to the height-one Dedekind adic-completion carrier in the pinned point-map statement.

**Direct inputs:** ColemanPowerSeriesPartII:AU.4/auxiliary-quadratic; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/bko-quasi-fields; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/field-generator-comparisons; ComplexMultiplicationAndExplicitReciprocity:CM.3/ring-class-generator; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence.

**Source:** BKO2021, §5.0.2, pp.958–959; §3.0.1, p.950.

**Acceptance:** The degree at s=1 is p+1 and at s=0 is1; keep a selected prime rather than asserting a unique global prime above p.

### Modular quasi-canonical points

**Target ColemanPowerSeriesPartII:AU.6/quasicanonical-modular-points (construction).** For the formally CM A/O and an O-basis t of T_pA set T_s=p⁻sZ_p t+T_pA and C_s=T_s/T_pA. Import the marked quotient A_s=A/C_s over O_(Ψ′_s), its formal order Z_p+p^sO, its reduction and the induced prime-to-p Γ₀(N),Γ₁(M) levels. These give moduli points z_s on X₀(N;M), and their coarse images on X₀(N), with z_0=P′. Define x_s=f′(z_s) as an actual elliptic point before identifying its formal parameter.

**Construction or proof.** (1) Import the quotient, marked formal comparison, minimal stabilizer field and base-change compatibility from the LT suppliers; do not reconstruct Gross–Yu quasi-canonical lifts. (2) Transport the prime-to-p levels along the p-power isogeny, where it is an isomorphism on prime-to-p torsion. (3) Apply the fine moduli universal property and the integral modular parametrization.

**Direct inputs:** ColemanPowerSeriesPartII:AU.5/primitive-formal-cm-point; ColemanPowerSeriesPartII:AU.6/dedekind-completion-models; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.5/elliptic-isogeny-comparison; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/bko-quasi-fields; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-fields; ModularCurvesPartII:R13.4.

**Source:** BKO2021, §5.0.2, pp.958–959.

**Uses.** AU.6/formal-image-comparison: Place x_s in the actual target formal group. AU.7/hecke-lattice-relation: Compare Hecke images with marked lattice neighbours.

**API.**

- **modular_point_zero** (simp): z_0 is the original marked lift and x_0=Q.
- **modular_point_field** (data): z_s and x_s are defined over the specified Ψ′_s, with the local ring-class action.
- **modular_point_level** (compatibility): The prime-to-p level is the image of the original level under A→A_s.
- **modular_point_galois** (functoriality): The Galois action on z_s is the marked lattice action from the quasi-canonical supplier.

**Unit tests.**

- **conductor_zero** (degenerate): T_0=T and A_0=A with the original levels.
- **first_degree** (computation): [Ψ′_1:Φ]=p+1, not p.
- **shifted_layers** (non-example): The tame-fixed field (Ψ′_(n+1))^Δ′ equals Ψ_n, so the index shift cannot be removed.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

**Atlas planet:** Modular quasi-canonical points.

### Formal image of the modular points

**Target ColemanPowerSeriesPartII:AU.6/formal-image-comparison (comparison).** Each x_s specializes to zero on E and therefore has a unique formal parameter in Ê(m_(Ψ′_s)); x_0=Q. Through the completion models this parameter-to-point map is exactly WeierstrassCurve.formalPointHomAdicCompletion, with injectivity and range WeierstrassCurve.range_formalPointHomAdicCompletion. The formal, elliptic and Galois trace squares commute.

**Construction or proof.** (1) The special-fibre p^s-isogeny is purely inseparable and identifies the coarse marked reduction of z_s with the p^s-Frobenius twist of the reduction P of z_0. The prime-to-p Γ₀(N) subgroup is transported by this Frobenius. A fine Γ₁(M) marking need not stay fixed. (2) The coarse modular map is defined over F_p and sends P to zero. It therefore sends every Frobenius twist of P to zero as well; hence x_s reduces to zero. This argument does not require every z_s to lie in the same fine formal neighbourhood as z_0. (3) Use the imported formal-point equivalence and the pinned map’s injectivity/range in the Dedekind completion presentation. (4) Use the fact that the pinned map is an additive homomorphism to compare elliptic sums with formal sums.

**Direct inputs:** ColemanPowerSeriesPartII:AU.6/quasicanonical-modular-points; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/trace-compatible-exports; tauceti:WeierstrassCurve.formalPointHomAdicCompletion; tauceti:WeierstrassCurve.formalPointHomAdicCompletion_injective; tauceti:WeierstrassCurve.range_formalPointHomAdicCompletion.

**Source:** BKO2021, §5.0.2 and Definition 5.4, p.959.

**Acceptance:** Allow alternating Frobenius-twisted coarse reductions and moving fine markings. The target image still reduces to zero and the existing parameter map compares all trace sums.

## AU.7. Optimal local points and exact traces

Define y_s as the Δ′-formal trace of x_(s+1), and y=(p+1)Q. Prove primitivity, the Hecke/lattice comparison, y_0=0 and Tr_(Ψ_1/Φ)y_1=−y, and the recurrence Tr_(Ψ_(s+1)/Ψ_s)y_(s+1)=−y_(s−1) for s≥1. All sums use the formal group law. Targets: Optimal local point system; Primitive base point; Hecke relation on marked lattice neighbours; Optimal-point trace identities. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** ColemanPowerSeriesPartII:AU.6; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9; ColemanPowerSeriesPartII:AU.5; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7; ModularCurvesPartII:R14.1; ModularCurvesPartII:R14.5; EllipticCurveModularity:R29.5.

### Optimal local point system

**Target ColemanPowerSeriesPartII:AU.7/optimal-point-system (definition).** Let Δ′ be the order-(p+1) tame subgroup in Gal(Ψ′_∞/Φ). Define y_s=Σ_{d∈Δ′}d·x_(s+1) in Ê(m_(Ψ_s))≃F(m_(Ψ_s)) and y=[p+1]Q∈F(m_Φ). The sum is formal addition, and Ψ_s=(Ψ′_(s+1))^Δ′ fixes it.

**Construction or proof.** (1) Use the formal-image comparison and the exact tame/fixed-field identification. (2) Take the finite formal trace and descend it to Ψ_s. (3) Transport Ê to the fixed F and define the base point by scalar multiplication.

**Direct inputs:** ColemanPowerSeriesPartII:AU.6/formal-image-comparison; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.8/bko-fields; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/tame-descent.

**Source:** BKO2021, Definition 5.4, p.959.

**Uses.** AU.7/optimal-point-trace: Prove the signed trace recurrence. AU.8/minus-point-invariants: Supply the primitive boundary needed for control.

**API.**

- **optimal_point_field** (data): y_s is an actual formal Ψ_s-point.
- **optimal_point_tame_trace** (characterisation): y_s is the Δ′-trace of x_(s+1).
- **optimal_point_base** (simp): y=[p+1]Q.
- **optimal_point_trace_square** (compatibility): Tracing y_s is the same as tracing x_(s+1) through the tame/pro-p field rectangle.

**Unit tests.**

- **degree_p_plus_one** (computation): The tame trace has p+1 terms.
- **index_shift** (non-example): The point at level Ψ_0 is traced from x_1, not x_0.
- **formal_addition** (compatibility): Its parameter is obtained by iterated E.formalAddEval; ordinary parameter addition is not substituted.

**Acceptance:** Establish the stated integral assertion with all standing conventions and the listed comparison maps.

**Atlas planet:** Optimal local points.

### Primitive base point

**Target ColemanPowerSeriesPartII:AU.7/optimal-point-primitive (theorem).** The base point y=[p+1]Q is not divisible by p in F(m_Φ); equivalently its O-span equals F(m_Φ), a free O-module of rank one.

**Construction or proof.** (1) Use the unramified base logarithm identification F(m_Φ)≃pO from the primitive-point construction. (2) Since p+1∈O×, multiplication by p+1 preserves a nonzero class modulo p. (3) A vector outside pO in this rank-one lattice is an O-generator.

**Direct inputs:** ColemanPowerSeriesPartII:AU.7/optimal-point-system; ColemanPowerSeriesPartII:AU.5/primitive-formal-cm-point.

**Source:** BKO2021, Theorem 5.5(i) and proof, p.959.

**Acceptance:** The base point lies outside pF(m_Φ), not just outside p times an arbitrarily deep sublattice; its logarithm is p times a unit.

**Atlas planet:** Primitive base point.

### Hecke relation on marked lattice neighbours

**Target ColemanPowerSeriesPartII:AU.7/hecke-lattice-relation (theorem).** For s≥1 the p forward marked neighbours of T_s form the Gal(Ψ′_(s+1)/Ψ′_s)-orbit of z_(s+1), and the single backward homothety class is z_(s−1). Thus the geometric T_p correspondence gives f(T_p z_s)=Σ_g g·x_(s+1)+x_(s−1)=a_p(E)x_s=0. At s=0 all p+1 neighbours are forward and form Gal(Ψ′_1/Φ)=Δ′. The statement concerns z_s before f and x_s after f; f is never applied a second time to x_s.

**Construction or proof.** (1) Write O=Z_p⊕Z_pθ. For s≥1 the index-p superlattices of T_s=p^(−s)Z_p t+T are the p forward lattices p^(−s−1)Z_p(1+ap^sθ)t+T=(1+ap^sθ)T_(s+1), a mod p, and the backward lattice p^(−s)Z_p t+p^(−1)T=p^(−1)T_(s−1). BKO's printed numerator 1+ap^s is a Z_p-unit, so their list would give the single lattice T_(s+1) (source issue E14). (2) Import the marked index-p neighbour classification and Galois actions from LT.7/lattice-neighbors. (3) Identify the geometric Hecke correspondence with the p-isogeny moduli problem, including inherited prime-to-p levels. (4) Use the modular quotient’s Hecke eigenrelation f∘T_p=a_p(E)f and a_p(E)=0; only then pass from the lattice count to an elliptic-point equality.

**Direct inputs:** ColemanPowerSeriesPartII:AU.6/quasicanonical-modular-points; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/lattice-neighbors; ModularCurvesPartII:R14.1; ModularCurvesPartII:R14.5; EllipticCurveModularity:R29.5/modular-parametrisation.

**Source:** BKO2021, proof of Theorem 5.5(ii), p.959, with corrections E3 and E14.

**Acceptance:** Count p forward plus one backward neighbour for s≥1, and p+1 forward neighbours at s=0, before applying f to the correspondence.

**Atlas planet:** Hecke lattice relation.

### Optimal-point trace identities

**Target ColemanPowerSeriesPartII:AU.7/optimal-point-trace (theorem).** The system satisfies y_0=0, Tr_(Ψ_1/Φ)y_1=−y, and Tr_(Ψ_(s+1)/Ψ_s)y_(s+1)=−y_(s−1) for every s≥1. The first two equations are separate boundary statements, not instances of a recurrence with a fictitious y_(−1).

**Construction or proof.** (1) At the conductor-zero vertex the p+1 forward sum is zero, giving y_0=0. (2) At conductor one the forward trace of x_2 is −x_0=−Q; the tame trace multiplies it by p+1, so Tr y_1=−y. (3) For higher conductor, trace the Hecke neighbour relation through the tame/pro-p rectangle and use injectivity of the formal point map.

**Direct inputs:** ColemanPowerSeriesPartII:AU.7/optimal-point-system; ColemanPowerSeriesPartII:AU.7/hecke-lattice-relation; ColemanPowerSeriesPartII:AU.6/formal-image-comparison; LubinTateFormalModulesAndQuasiCanonicalLifts:LT.9/trace-compatible-exports.

**Source:** BKO2021, Theorem 5.5(ii), p.959; Rubin1987, Proposition 6.1, pp.415–416.

**Acceptance:** Compute y_0=0 and Tr y_1=−y separately; then the recurrence gives Tr_(Ψ_2/Ψ_1)y_2=0 and Tr_(Ψ_3/Φ)y_3=p y.

**Atlas planet:** Optimal-point trace recurrence.

## AU.8. Minus-point control and quotient freeness

Use the primitive trace system to prove the signed minus invariant theorem by cyclic Herbrand quotient and cohomology control, then apply Kummer duality and compact Nakayama to prove V_∞*/V_∞*,− and V_∞*,− free of rank one. Neither conclusion uses the optimal signed unit. Targets: Minus-point invariant theorem; Minus quotient freeness; Minus kernel freeness. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** ColemanPowerSeriesPartII:AU.7; ColemanPowerSeriesPartII:AU.3; ArithmeticGaloisDuality:R02.2; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; ColemanPowerSeriesPartII:AU.0; PadicMeasuresIwasawaAlgebras:L5; PadicMeasuresIwasawaAlgebras:L4.

### Minus-point invariant theorem

**Target ColemanPowerSeriesPartII:AU.8/minus-point-invariants (theorem).** For D⁻=A⁻⊗_O Φ/O one has (D⁻)^(G⁻)=F(m_Φ)⊗_O Φ/O≃Φ/O. For cofinal odd n≥1, H¹(Gal(Ψ_n/Φ),F⁻(Ψ_n))=0; its direct limit gives the equality of divisible invariants.

**Construction or proof.** (1) Use the trace recurrence and character-logarithm trace law to show y_n∈F⁻(Ψ_n) for odd n and Tr_(Ψ_n/Φ)y_n=±p^((n−1)/2)y. (2) Over a finite-index logarithm lattice decompose F⁻(Ψ_n) rationally into O[G_1] and O[G_k]/O[G_(k−1)] for odd3≤k≤n. Compute its cyclic Herbrand quotient h_n=p^(n−1), with residue cardinal p². (3) The primitive trace gives #Hhat⁰≤p^(n−1)[F(m_Φ):Oy]=p^(n−1); hence H¹=0 by the quotient formula. (4) Pass to the cofinal odd layers and use the invariant/divisible-tensor exact sequence from continuous cohomology. This uses the local trace system, not global Heegner points.

**Direct inputs:** ColemanPowerSeriesPartII:AU.7/optimal-point-trace; ColemanPowerSeriesPartII:AU.7/optimal-point-primitive; ColemanPowerSeriesPartII:AU.3/signed-points; ColemanPowerSeriesPartII:AU.3/character-logarithm; ArithmeticGaloisDuality:R02.2/five-term-transgression; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

**Source:** BKO2021, Corollary 5.6 and proof, pp.959–960; Rubin1987, Corollary 6.2, p.416; Lemmas 7.1–7.2 and Propositions 7.3–7.4, pp.416–417.

**Acceptance:** At odd n=1 the Herbrand quotient and Hhat⁰ bound are both1. For general odd n use residue cardinalp² to obtain exponentn−1, not2(n−1).

**Atlas planet:** Minus-point invariant theorem.

### Minus quotient freeness

**Target ColemanPowerSeriesPartII:AU.8/minus-quotient-free (theorem).** The compact Λ-module Q⁻=V_∞*/V_∞*,− is free of rank one. Its augmentation coinvariants are O, through the dual of the preceding invariant theorem.

**Construction or proof.** (1) Dualize the invariant identity using the signed annihilator pairing to obtain Q⁻/(γ−1)Q⁻≃O. (2) Use compact Nakayama to show Q⁻ is cyclic over Λ. (3) The rank bound on V_∞*,− and rank V_∞*=2 give rank Q⁻≥1. A cyclic module Λ/I of positive rank over the domain Λ has I=0, proving freeness.

**Direct inputs:** ColemanPowerSeriesPartII:AU.8/minus-point-invariants; ColemanPowerSeriesPartII:AU.3/signed-annihilator; ColemanPowerSeriesPartII:AU.3/signed-rank-upper; ColemanPowerSeriesPartII:AU.0/units-free; PadicMeasuresIwasawaAlgebras:L5; PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local.

**Source:** BKO2021, proof of Corollary 5.6, p.960; Rubin1987, Lemma 4.3, p.410.

**Acceptance:** From coinvariants O deduce a cyclic Λ-module, then use positive Λ-rank to rule out a nonzero annihilator ideal; O-cyclic coinvariants alone do not imply freeness.

**Atlas planet:** Minus quotient freeness.

### Minus kernel freeness

**Target ColemanPowerSeriesPartII:AU.8/minus-kernel-free (theorem).** V_∞*,− is free of rank one over Λ.

**Construction or proof.** (1) The quotient Q⁻≃Λ is projective, so 0→V_∞*,−→V_∞*→Q⁻→0 splits as Λ-modules. (2) Thus V_∞*,− is a finitely generated projective module over the local ring Λ and is free. (3) Rank additivity gives rank one. This also supplies the saturated rank-one conclusion used in Rubin’s UFD argument.

**Direct inputs:** ColemanPowerSeriesPartII:AU.8/minus-quotient-free; ColemanPowerSeriesPartII:AU.0/units-free; PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local.

**Source:** BKO2021, proof of Corollary 5.6, p.960; Rubin1987, Lemma 4.1, p.410.

**Acceptance:** Use the splitting of the already-free quotient and finite projectivity over local Λ; neither arbitrary submodule freeness nor UFD principality is assumed.

**Atlas planet:** Minus kernel freeness.

## AU.9. Integral decomposition and nonvanishing

Use δ at augmentation and the optimal plus unit to generate the rank-one minus quotient. Prove Rubin’s integral direct-sum theorem and both signed freeness statements, then the correct-parity nonvanishing for every signed generator. Export the finite signed point convention and retain the earlier numerical range only as a historical regression. Targets: Augmentation-unit generation; Rubin’s integral decomposition; Signed local-unit freeness; Nonzero character derivative on the full module; Correct-parity generator nonvanishing; Historical numerical range regression. Exact statements, source locators, APIs, tests and proof steps are in the matching reader and packet.

**Dependencies:** ColemanPowerSeriesPartII:AU.4; ColemanPowerSeriesPartII:AU.8; ColemanPowerSeriesPartII:AU.1; ColemanPowerSeriesPartII:AU.3; PadicMeasuresIwasawaAlgebras:L4; ColemanPowerSeriesPartII:AU.2.

### Augmentation-unit generation

**Target ColemanPowerSeriesPartII:AU.9/augmentation-unit-generation (theorem).** The map δ induces Q⁻→O with δ(λv)=aug(λ)δ(v), and δ(m_ΛQ⁻)⊂pO for m_Λ=(p,γ−1). Therefore the image of ξ* with δ(ξ*)∈O× generates Q⁻.

**Construction or proof.** (1) Use 1∈Ξ⁺ and δ₁=(1+p⁻¹)δ to prove δ kills the minus kernel. (2) Use augmentation covariance and the explicit maximal ideal to prove δ(m_ΛQ⁻)⊂pO. (3) Under Q⁻≃Λ, the class of ξ* lies outside the maximal ideal and is a unit generator.

**Direct inputs:** ColemanPowerSeriesPartII:AU.4/optimal-unit; ColemanPowerSeriesPartII:AU.8/minus-quotient-free; ColemanPowerSeriesPartII:AU.1/delta-trivial-relation; ColemanPowerSeriesPartII:AU.1/derivative-covariance; ColemanPowerSeriesPartII:AU.3/signed-units; PadicMeasuresIwasawaAlgebras:L4/iwasawa-maximal-ideal.

**Source:** BKO2021, proof of Theorem 5.8, p.960; Rubin1987, Lemma 4.2, p.410, with correction E13.

**Acceptance:** The maximal ideal(p,γ−1) maps under δ into pO. A quotient coordinate with unit derivative is outside that ideal and is a unit of Λ.

**Atlas planet:** Augmentation-unit generation.

### Rubin’s integral decomposition

**Target ColemanPowerSeriesPartII:AU.9/rubin-decomposition (theorem).** For every prime p≥5 and the standing unramified quadratic local datum, the addition map V_∞*,+⊕_Λ V_∞*,−→V_∞* is a Λ-linear homeomorphism. Equivalently V_∞*=V_∞*,+⊕V_∞*,− integrally over O[[G⁻]].

**Construction or proof.** (1) The image of ξ* generates Q⁻, so every v is a plus multiple of ξ* plus a minus element. (2) The signed intersection is zero, giving injectivity. (3) The modules are compact Hausdorff and the addition map is continuous; its inverse is continuous.

**Direct inputs:** ColemanPowerSeriesPartII:AU.9/augmentation-unit-generation; ColemanPowerSeriesPartII:AU.3/signed-rank-upper; ColemanPowerSeriesPartII:AU.8/minus-kernel-free.

**Source:** BKO2021, Theorem 2.1, p.949; Theorem 5.8 and proof, p.960; Rubin1987, Conjecture 2.2, p.408; Theorem 8.4, pp.418–419.

**Acceptance:** Establish the equality before tensoring with Φ or passing to the fraction field of Λ. Cover p=47 by the exceptional point construction; no unverified numerical small-prime theorem is an input.

**Atlas planet:** Rubin’s decomposition theorem.

### Signed local-unit freeness

**Target ColemanPowerSeriesPartII:AU.9/signed-free (theorem).** Both V_∞*,+ and V_∞*,− are Λ-free of rank one, and the chosen optimal ξ* generates V_∞*,+.

**Construction or proof.** (1) Use the direct sum and zero intersection to identify the plus module with Q⁻. (2) Its generator is ξ* by augmentation-unit-generation. (3) Combine with minus-kernel-free.

**Direct inputs:** ColemanPowerSeriesPartII:AU.9/rubin-decomposition; ColemanPowerSeriesPartII:AU.8/minus-kernel-free.

**Source:** BKO2021, §2, p.949; Theorem 5.8, p.960; Rubin1987, Proposition 8.1, p.417.

**Acceptance:** Identify the plus module with the already-free minus quotient only after the integral direct sum; retain ξ* as an actual plus generator.

**Atlas planet:** Signed local-unit freeness.

### Nonzero character derivative on the full module

**Target ColemanPowerSeriesPartII:AU.9/delta-chi-nonzero (theorem).** For every finite anticyclotomic χ, δ_χ:V_∞*→Φ(χ) is not the zero map. This can be proved from Kummer duality before using the direct-sum conclusion.

**Construction or proof.** (1) If δ_χ were zero, coefficient-field conjugacy would make all character derivatives in its conductor orbit zero. (2) Use the logarithmic normal-basis lattice to choose a nonzero divisible formal point with only those conductor components. (3) The Wiles Fourier pairing would make this point pair to zero with every unit, contradicting perfectness.

**Direct inputs:** ColemanPowerSeriesPartII:AU.3/character-logarithm; ColemanPowerSeriesPartII:AU.2/wiles-pairing; ColemanPowerSeriesPartII:AU.2/anticyclotomic-kummer; ColemanPowerSeriesPartII:AU.3/formal-points-infinite-rank.

**Source:** Rubin1987, proof of Lemma 10.1, p.421; BKO2021, Corollary 2.2, p.949.

**Acceptance:** The contradiction uses the full module and every conjugate conductor component, not nonvanishing assumed for a signed generator.

### Correct-parity generator nonvanishing

**Target ColemanPowerSeriesPartII:AU.9/generator-nonvanishing (theorem).** For ε∈{+,−}, every Λ-generator v_ε of V_∞*,ε and every χ∈Ξ^ε satisfy δ_χ(v_ε)≠0. For χ of opposite parity the derivative is zero. This includes χ=1 on the plus side.

**Construction or proof.** (1) Decompose the full module into the two signs. The opposite sign has zero δ_χ by definition. (2) Since δ_χ is nonzero on the full module it is nonzero on the matching sign. (3) Every element of that free rank-one sign is λv_ε, and δ_χ(λv_ε)=ev_(χ⁻¹)(λ)δ_χ(v_ε). If the generator derivative vanished, the whole sign map would vanish.

**Direct inputs:** ColemanPowerSeriesPartII:AU.9/signed-free; ColemanPowerSeriesPartII:AU.9/delta-chi-nonzero; ColemanPowerSeriesPartII:AU.1/character-derivative; ColemanPowerSeriesPartII:AU.3/signed-units.

**Source:** BKO2021, Corollary 2.2, p.949; Rubin1987, Lemma 10.1, p.421.

**Acceptance:** Include χ=1 on the plus side and opposite-parity vanishing. A vanishing matching-generator derivative would kill that entire sign and hence the full module.

**Atlas planet:** Signed generator nonvanishing.

### Historical numerical range regression

**Target ColemanPowerSeriesPartII:AU.9/rubin-small-primes (application).** Rubin’s previously checked range 5≤p≤1000 with p≢1 mod12 (Rubin p.418; BKO Remark 2.3 writes 1001, source issue E12) is a historical consistency check for the new universal theorem, not a proof input. The final theorem includes those primes, p≡1 mod12, and p=47 through the corrected exceptional construction.

**Construction or proof.** (1) Read Rubin p.418’s computed range and BKO Remark2.3. (2) Observe that 1001 is composite, so the prime ranges ≤1000 and≤1001 coincide. (3) Check the proof graph has no edge from the decomposition to a numerical verification claim.

**Direct inputs:** ColemanPowerSeriesPartII:AU.9/rubin-decomposition.

**Source:** BKO2021, Remark 2.3, p.949, with correction E12; Rubin1987, Computation, p.418; Theorem 8.4, pp.418–419.

**Acceptance:** The prime sets≤1000 and≤1001 agree because1001 is composite; the universal proof graph has no numerical-range assumption.

## Worked checks

### The auxiliary quadratic-field certificate

For p>47 choose a nonsquare −m modulo p and adjust m by kp, 0≤k≤7, so that m+kp≡7mod8. Removing an odd square factor gives a fundamental D≡1mod8, |D|<8p and (D/p)=−1. For such D, the residue formula and ζ_K=ζ_Q L(χ_D) give h(D)=√|D| L(1,χ_D)/π_real. Splitting the character series after |D| terms, periodic cancellation and summation by parts bound its tail by1, while the initial harmonic sum is at most1+log|D|. Hence h(D)<√(8p)(2+log(8p))/π_real<p at p=53 and thereafter by monotonicity of the ratio. The remaining primes have the following certificates; tuples are the complete primitive reduced forms with b²−4ac=D and the boundary tie rule b≥0.

| p | D | h(D) | Reduced forms (a,b,c) |
|---|---:|---:|---|
| 5 | -7 | 1 | (1, 1, 2) |
| 7 | -15 | 2 | (1, 1, 4); (2, 1, 2) |
| 11 | -23 | 3 | (1, 1, 6); (2, -1, 3); (2, 1, 3) |
| 13 | -15 | 2 | (1, 1, 4); (2, 1, 2) |
| 17 | -71 | 7 | (1, 1, 18); (2, -1, 9); (2, 1, 9); (3, -1, 6); (3, 1, 6); (4, -3, 5); (4, 3, 5) |
| 19 | -39 | 4 | (1, 1, 10); (2, -1, 5); (2, 1, 5); (3, 3, 4) |
| 23 | -47 | 5 | (1, 1, 12); (2, -1, 6); (2, 1, 6); (3, -1, 4); (3, 1, 4) |
| 29 | -31 | 3 | (1, 1, 8); (2, -1, 4); (2, 1, 4) |
| 31 | -7 | 1 | (1, 1, 2) |
| 37 | -39 | 4 | (1, 1, 10); (2, -1, 5); (2, 1, 5); (3, 3, 4) |
| 41 | -167 | 11 | (1, 1, 42); (2, -1, 21); (2, 1, 21); (3, -1, 14); (3, 1, 14); (4, -3, 11); (4, 3, 11); (6, -5, 8); (6, -1, 7); (6, 1, 7); (6, 5, 8) |
| 43 | -87 | 6 | (1, 1, 22); (2, -1, 11); (2, 1, 11); (3, 3, 8); (4, -3, 6); (4, 3, 6) |
| 47 | -95 | 8 | (1, 1, 24); (2, -1, 12); (2, 1, 12); (3, -1, 8); (3, 1, 8); (4, -1, 6); (4, 1, 6); (5, 5, 6) |

The finite enumeration uses a≤√(|D|/3), so these lists can be checked without a class-number database. The reduced-form/ideal-class correspondence is ComplexMultiplicationAndExplicitReciprocity CM.1/quadratic-forms-dictionary, with Pic(O_D)=Cl(K) for fundamental D. All rows have h(D)<p, the stated discriminant parity, and inert p.

### Conductor signs and initial trace boundaries

At Ψ_0 the only character is trivial and is plus; consequently F⁺(Φ)=0 and F⁻(Φ)=F(m_Φ). At Ψ_1 every new character has exponent2 and is plus, so F⁺(Ψ_1)=0 while the full space lies on the minus-point side. At Ψ_2 the new exact-orderp² characters have exponent3 and are minus. These tests detect replacement of conductor parity by character-order parity and detect interchange of point and unit signs.

The local point system begins x_0=Q, y=[p+1]Q, y_0=0, Tr_(Ψ_1/Φ)y_1=−y. The recurrence Tr_(s+1/s)y_(s+1)=−y_(s−1) begins at s=1. Thus Tr_(Ψ_2/Ψ_1)y_2=0 and Tr_(Ψ_3/Φ)y_3=p y; odd levels give alternating ±p^((n−1)/2)y after total trace. These boundary checks would fail if Δ of orderp²−1 replaced Δ′ of orderp+1, or if y_0 were identified with Q.

For p=47 the displayed generic coefficient is0. The exceptional j=0 and1728 fibre estimates are respectively μ/3 andμ/2, both strictly greater than μ/6. Thus the final theorem covers47 without relying on the generic-bound inference or on Rubin’s numerical small-prime range.

### Integral augmentation argument

Identify the already-free quotient Q⁻ with Λ. An element with δ-value in O× lies outside the maximal ideal(p,γ−1), because δ is Λ-linear for augmentation. Its quotient coordinate is therefore a unit of Λ and generates Q⁻. Since it belongs to the plus kernel and the signed intersection is zero, addition gives the integral direct sum. Tensoring with Φ first would lose this unit test and would not establish the target.

## External contracts and remaining work

### R1. ArithmeticGaloisDuality:R02.1

Continuous long exact cohomology sequences for the actual F[π^k] and formal-point modules; compatibility of restriction/corestriction with multiplication and formal trace. Existing tate-inverse-limit and completed-tensor-comparison nodes are cited separately.

**Consumers:** ColemanPowerSeriesPartII:AU.2/formal-kummer.

### R2. AutomorphicLFunctionsAndLocalFactors:AL.1

Hecke L-functions for type-(1,0) imaginary-quadratic characters with named Euler factors, central functional equation, conjugation, and the inert local root-number formula W(φ̄νχ)=(−1)^c W(φ). Include χ=1 separately. General Tate functional equations do not by themselves identify this specialized root number.

**Consumers:** ColemanPowerSeriesPartII:AU.4/early-cm-interface; ColemanPowerSeriesPartII:AU.4/xi-signed.

### R3. AutomorphicPadicLFunctions:L3

OWNERSHIP ANCHOR, NOT A CLAIM ABOUT ORDINARY KATZ: the BKO nonordinary continuation (extraction NonordinaryCMSpecialValues, grouped design AutomorphicPadicLFunctionsPartII #3350) must export early normalized elliptic-unit zeta classes, Kato (15.9) reciprocity, canonical-character existence/root sign/period, auxiliary split ℓ and local disjointness, and the Finis all-but-finitely-many p-unit theorem for ℓ-power anticyclotomic ν at inert p. Its stages do not exist in this checkout. Reserve no fictional stage; rewire to exact early nodes after design. These inputs must be independent of AU.9 and of Rubin’s downstream p-adic L-function.

**Consumers:** ColemanPowerSeriesPartII:AU.4/early-cm-interface.

### R4. ColemanPowerSeries:L0

Finite local principal-unit norm maps, their continuous Z_p-module structure, norm transitivity and completed scalar extension; compare the existing cyclotomic tower without identifying it with the quadratic Lubin–Tate tower.

**Consumers:** ColemanPowerSeriesPartII:AU.0/units-limit.

### R5. ColemanPowerSeries:L1

The finite-free substitution/determinant-norm mechanism, continuity and norm-contraction/interpolation argument, exported in a form applicable to [π]_F of degree p². The LT-specific construction and sign comparison remain AU.1; the parent cyclotomic theorem alone is not the LT theorem.

**Consumers:** ColemanPowerSeriesPartII:AU.1/coleman-series.

### R6. EllipticCurveModularity:R29.5

Continuation in this direction: for an optimal strong Weil parametrization at an odd good prime p, the Manin constant is a p-unit; the optimal isogeny-class replacement preserves good reduction and a_p=0. The existing modular-parametrisation node only supplies a rational nonzero differential constant. Record the additional p-unit theorem as an extension, not as part of that node. A free source for the statement: Abbes–Ullmo 1996, Théorème A (p.269), proves that the Manin constant of a strong Weil curve of conductor N is prime to every p∤N.

**Consumers:** ColemanPowerSeriesPartII:AU.5/manin-separability.

### R7. ModularCurvesPartII:R13.4

Smooth integral prime-to-p X₀(N), fine X₀(N;M) and their proper compactifications for general composite N; degree μ=N∏(1+ℓ⁻¹), full genus formula, reduction and completed-local lifting, universal elliptic curve and prime-to-p level transport. In particular N=27,32 are covered; a prime-level compactification theorem does not suffice.

**Consumers:** ColemanPowerSeriesPartII:AU.5/manin-separability; ColemanPowerSeriesPartII:AU.5/ramification-count; ColemanPowerSeriesPartII:AU.5/moduli-etale; ColemanPowerSeriesPartII:AU.5/fine-level-unramified; ColemanPowerSeriesPartII:AU.6/quasicanonical-modular-points.

### R8. ModularCurvesPartII:R14.1

The integral p-isogeny Hecke correspondence at p∤N, its action on prime-to-p Γ₀(N) markings and coarse points, and the p+1-neighbour description including conductor-zero and conductor-one boundaries.

**Consumers:** ColemanPowerSeriesPartII:AU.7/hecke-lattice-relation.

### R9. ModularCurvesPartII:R14.5

The modular quotient f:X₀(N)→E satisfies the actual point-correspondence identity f(T_p z)=a_p(E) f(z), including integral good reduction. Differential eigenrelations alone are insufficient for the traced elliptic-point identity.

**Consumers:** ColemanPowerSeriesPartII:AU.7/hecke-lattice-relation.

### R10. PadicHodgeRegulators:L1

Exponential/dual-exponential adjunction for the Lubin–Tate inverse-twisted CM representation, its de Rham differential line, trace and finite-character normalization; output must compare the actual Kummer class with δ_χ using π^(−n−1), not just assert a nondegenerate pairing.

**Consumers:** ColemanPowerSeriesPartII:AU.2/wiles-dual-exponential.

### R11. PadicMeasuresIwasawaAlgebras:L1

Reuse the current TauCeti.completedGroupAlgebra and IsCompactModule.completedGroupAlgebraModule implementation. Supply its scalar extension to O and finite coefficient DVR extensions, character evaluation, continuous twisting by κ⁻¹, and the closed-quotient universal property. No reconstruction of completed group algebras or their compact-module action is requested. Status 2026-10-18: PadicMeasuresIwasawaAlgebras is now a Tau Ceti roadmap (merged on TauCetiRoadmap main 2026-10-14); its Layer 1 states the completed group algebra built on TauCeti.completedGroupAlgebra with coefficient extension. What remains is to check the κ⁻¹-twist on the two-variable algebra and the closed-quotient property against that text.

**Consumers:** ColemanPowerSeriesPartII:AU.0/units-limit; ColemanPowerSeriesPartII:AU.0/inverse-tate-twist; ColemanPowerSeriesPartII:AU.0/anticyclotomic-quotient; ColemanPowerSeriesPartII:AU.1/derivative-covariance.

### R12. PadicMeasuresIwasawaAlgebras:L4

Two-variable O[[Z_p²]] rank calculations and one-variable O[[T]] Weierstrass consequences, which the upstream Layer 4 (Weierstrass theory and module structure, with base change of characteristic ideals) states for O[[T]]; the simultaneous-derivative-kernel base change is now proved inside this roadmap (AU.3/signed-units, signed_units_base_change). Existing character-decomposition and regular-local node ids are cited.

**Consumers:** ColemanPowerSeriesPartII:AU.0/units-free; ColemanPowerSeriesPartII:AU.3/signed-rank-upper; ColemanPowerSeriesPartII:AU.4/optimal-unit.

### R13. PadicMeasuresIwasawaAlgebras:L5

Compact Nakayama for a finitely generated O[[G⁻]]-module using augmentation coinvariants, compatible inverse limits and scalar extension; a cyclic module of positive rank over this domain is free rank one. Status 2026-10-18: the upstream Layer 5, §5.2, states topological Nakayama for compact modules over O[[T]]; the remaining clause (a cyclic module of positive rank over the domain Λ is free of rank one) is routine.

**Consumers:** ColemanPowerSeriesPartII:AU.0/units-free; ColemanPowerSeriesPartII:AU.8/minus-quotient-free.

### R14. tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula

Separable Riemann–Hurwitz with the different divisor in characteristic p, including wild ramification: each ramification point contributes at least one and an elliptic target gives total different degree 2g−2.

**Consumers:** ColemanPowerSeriesPartII:AU.5/ramification-count.

### R15. tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

Cyclic Tate cohomology/Herbrand quotient conventions for finite O[G]-lattices (|O/pO|=p²), finite Kummer evaluation, transfer and local Tate pairings. Elliptic/formal Tate duality is separately requested from EllipticCurves layer7; local class formation alone is insufficient.

**Consumers:** ColemanPowerSeriesPartII:AU.2/formal-kummer-duality; ColemanPowerSeriesPartII:AU.4/xi-nu; ColemanPowerSeriesPartII:AU.8/minus-point-invariants.

### R16. tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

Arithmetic local Artin reciprocity on norm-compatible principal units and the full two-variable abelian tower, with norm/restriction adjunction and the rank calculation used by Wintenberger’s nonexceptional tame character theorem.

**Consumers:** ColemanPowerSeriesPartII:AU.0/units-free; ColemanPowerSeriesPartII:AU.2/formal-points-units-dual; ColemanPowerSeriesPartII:AU.2/wiles-pairing.

### R17. tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence

Local existence and global-local Artin compatibility for the norm subgroup Q_p×(1+p^sO), yielding the chosen ring-class completion of degree (p+1)p^(s−1), with its fixed prime and compatible inclusions.

**Consumers:** ColemanPowerSeriesPartII:AU.6/dedekind-completion-models.

### R18. tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

CONTINUATION REQUEST: supersingular trace-class existence over F_(p²) with trace −2p, existence of a supersingular j in F_p, Deuring mass/j-count, Schoof trace/twist counts and exceptional j criteria. These extend the upstream finite-field Hasse/dichotomy layer; the extraction routes them to EllipticCurvesPartIISupersingularFiniteFields, grouped design EllipticCurvesPartII #3398, whose stages are absent here. Use exact continuation nodes after design, never rebuild these counts in AU.5.

**Consumers:** ColemanPowerSeriesPartII:AU.2/formal-kummer-duality; ColemanPowerSeriesPartII:AU.5/supersingular-auxiliary; ColemanPowerSeriesPartII:AU.5/moduli-etale; ColemanPowerSeriesPartII:AU.5/generic-supersingular-count; ColemanPowerSeriesPartII:AU.5/exceptional-supersingular-count.

### R19. tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Good-reduction formal subgroup sequence, reduction kernel, Néron mapping property for maps of smooth integral curves, isogeny invariance of a_p/good reduction and algebraization of the smooth supersingular model. Retain the actual integral hypotheses.

**Consumers:** ColemanPowerSeriesPartII:AU.2/formal-kummer-duality; ColemanPowerSeriesPartII:AU.5/supersingular-auxiliary; ColemanPowerSeriesPartII:AU.5/manin-separability.

### R20. ArithmeticGaloisDuality:R02.4

Compatibility of the local abelian-variety duality of R02.4/abelian-variety-local-duality with restriction and corestriction along finite extensions, with finite Kummer images, and with the adjoint of an O-action, for a principally polarized elliptic curve with good supersingular reduction. Tau Ceti EllipticCurves Layer 7 lists local Tate duality only among stretch prerequisites, so it is not cited.

**Consumers:** ColemanPowerSeriesPartII:AU.2/formal-kummer-duality.

### R21. Withdrawn

The reduced-form census of the auxiliary-field certificate was first requested from tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting, which does not state it. It is supplied by ComplexMultiplicationAndExplicitReciprocity:CM.1/quadratic-forms-dictionary, now a direct input of AU.4/auxiliary-quadratic.

### R22. tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles

A chosen finite-place completion of a number field and compatible finite-extension completions, valuation rings, maximal ideals and trace transport; identify these with the height-one Dedekind adic-completion carrier of the pinned formal-point map.

**Consumers:** ColemanPowerSeriesPartII:AU.6/dedekind-completion-models.

### R23. tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters

Algebraic Hecke-character carriers and conductors, ideal/class character operations and ray class fields for the canonical imaginary-quadratic setup; no implicit canonical-character existence or Finis nonvanishing theorem.

**Consumers:** ColemanPowerSeriesPartII:AU.4/auxiliary-quadratic; ColemanPowerSeriesPartII:AU.4/early-cm-interface.

### R24. tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves

The actual prime-to-p fine Γ₁(M) moduli deformation problem and universal elliptic curve over its smooth one-dimensional completed local ring; étaleness at the chosen point gives the completion isomorphism, not merely a bijection of residue points.

**Consumers:** ColemanPowerSeriesPartII:AU.5/fine-level-unramified.

### R25. tauceti:TauCetiRoadmap/ModularCurves#9c-axiomatic-regularity-of-quotients

Prime-to-p quotient regularity and stabilizer-index fibre counts at j=0,1728; absence of the order3/2 elliptic stabilizer for Γ₀(27)/Γ₀(32), respectively, and unramified fine-to-coarse maps at the chosen points.

**Consumers:** ColemanPowerSeriesPartII:AU.5/moduli-etale; ColemanPowerSeriesPartII:AU.5/fine-level-unramified.

### R26. tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n

The coarse Y₀(N) j-map for general N prime to p is étale away from 0,1728, with μ geometric points there and stabilizer-index bounds at the exceptional j-values.

**Consumers:** ColemanPowerSeriesPartII:AU.5/moduli-etale.

### G1. Height-two universal norms over ramified finite bases

Hazewinkel Theorem1.3 was read with its proof, but assumes an absolutely unramified base. Supply a valid ramified finite-base/cofinality estimate forcing every coordinate of lim_N F(m_(Ψ_n)) and lim_N F(m_(Θ_n)) to vanish. Rubin Proposition4.5 states the vanishing at Φ and cites Hazewinkel; that alone does not justify all finite coordinates. A uniform filtration depth tending to infinity at each fixed ramified layer would close this gap. Lead recorded by the review: Θ_∞ and Ψ_∞ are Galois p-adic Lie extensions with infinite inertia, hence deeply ramified (Fesenko 1998, §2.5 with Proposition 2.3, via Sen's theorem), and for a deeply ramified field Fesenko's Theorem 1.1(4) gives H¹(Gal(F′/F),M_F′)=0 for every finite F′. Coates–Greenberg (Invent. Math. 124, 1996, not read here) derive from this the vanishing of H¹ of formal-group points over deeply ramified fields; that would give the direct-limit Kummer defect vanishing needed in AU.2 directly, without the inverse-limit statement. Source issue E15 records the citation gap in Rubin and BKO.

**Consumers:** ColemanPowerSeriesPartII:AU.2/formal-norm-vanishing.

### G2. Original height-two reciprocity proof and dual-exponential normalization

The BKO trace formula and Rubin Theorem5.3 were read. Wiles 1978, Higher explicit reciprocity laws, Annals107,235–254 (DOI10.2307/1971143) original proof was not obtained. Kato1993 ChapterII Theorem2.1.7 is not cleared in the supplied library and was not read. Supply a lawful original proof or a complete accessible replacement for height-two Lubin–Tate reciprocity, with arithmetic Artin sign, π=−p basis, π^(−m−1−k) trace formula and its character dual-exponential comparison. The height-one Coates–Wiles formula is not a replacement.

**Consumers:** ColemanPowerSeriesPartII:AU.2/wiles-pairing; ColemanPowerSeriesPartII:AU.2/wiles-dual-exponential.

### G3. Supersingular finite-field counts not yet owned

Deuring's supersingular j-count, Schoof's F_(p²) counts N(t) with twists, existence of a supersingular j in F_p and the j=0,1728 criteria are cited through Tau Ceti EllipticCurves Layer 3, which stops at the ordinary/supersingular dichotomy and the Hasse bound. The accepted BKO extraction routes them to Elliptic curves, Part II (design #3398), whose stages do not exist yet. Request R18 and the second restructure entry record the target; until then the input is unowned.

**Consumers:** ColemanPowerSeriesPartII:AU.5/supersingular-auxiliary; ColemanPowerSeriesPartII:AU.5/moduli-etale; ColemanPowerSeriesPartII:AU.5/generic-supersingular-count; ColemanPowerSeriesPartII:AU.5/exceptional-supersingular-count; ColemanPowerSeriesPartII:AU.2/formal-kummer-duality.

### G4. Early nonordinary CM special-value inputs not yet owned

The zeta classes with Kato's dual-exponential formula, the canonical-character root number and period, the auxiliary prime ℓ and Finis's unit theorem at the inert prime are anchored at AutomorphicPadicLFunctions L3, which excludes nonordinary CM types. The accepted BKO extraction routes them to the nonordinary CM continuation (design #3350), whose stages do not exist yet. Request R3 and the first restructure entry record the target; until then the input is unowned.

**Consumers:** ColemanPowerSeriesPartII:AU.4/early-cm-interface.

## Source corrections

- **ColemanPowerSeriesPartII/E1** (misprint), BKO2021, Published Lemma5.1(ii), p.956: For q-Frobenius [s p] and trace2s p, a Lubin–Tate parameter compatible with q-power reduction is s p; the target trace−2p gives parameter−p. A Lubin–Tate π-endomorphism reduces to the q-power Frobenius, so its derivative parameter must correspond to that scalar. The imported LT.4 comparison uses this convention. Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E9; the LT supplier already uses this correction.. Review: confirmed.
- **ColemanPowerSeriesPartII/E2** (gap), BKO2021, Published Lemma5.2(ii), p.956, last inference: The stated lower bound is zero at p=47 and does not establish the existence inference there. Use the exceptional j=0 or1728 bounds at47; the universal theorem is unaffected. floor(46/12)−3/2+(−3/47)+(1/2)(−1/47)=3−3/2−1−1/2=0. This does not disprove the generic existence statement itself. Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E1. Its sharper count also proves the generic existence statement at47.. Review: confirmed.
- **ColemanPowerSeriesPartII/E3** (misprint), BKO2021, Published proof of Theorem5.5(ii), p.959: Forward neighbours are conjugates of x_(s+1), and at conductor zero the orbit group is Δ′ of orderp+1. The displayed Hecke equality immediately below uses x_(s+1); Φ′_1/Φ has degreep+1, whereas the full Lubin–Tate tame Δ has orderp²−1. Status: Confirmed atlas errata PAPER-BURUNGALE-KOBAYASHI-OTA-21/E4 and/E5; not a new discovery.. Review: confirmed.
- **ColemanPowerSeriesPartII/E4** (misprint), Rubin1987, Rubin §2, opening paragraph, p.407 (generator of T_p(E) used for Coleman's series); BKO footnote 2, p.948: Use an actual π-adic Tate basis; the comparison with a p-compatible coordinate sequence has factor(−1)^n. [−p]v_(n+1)=v_n differs from [p]v_(n+1)=v_n by the alternating sign; the Coleman chain rule depends on the chosen basis. Status: BKO2021 footnote2 explicitly records the correction.. Review: confirmed.
- **ColemanPowerSeriesPartII/E5** (misprint), BKO2021, Published §3.0.2–3.0.3, pp.952–954: Use conductor(ν)=ℓ^m, orderℓ^(m−1), and the degreeℓ^(m−1) layer L_(m−1); equivalently keep orderℓ^m and replace the conductor everywhere byℓ^(m+1). At split ℓ≥5 the ℓ-primary ring-class quotient at conductorℓ^m has orderℓ^(m−1). Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E2. Review: confirmed.
- **ColemanPowerSeriesPartII/E6** (misprint), BKO2021, Published Corollary5.6, p.959: Use V_∞*/V_∞*,− throughout. The duality and the proof of Theorem5.8 concern the starred module. Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E6. Review: confirmed.
- **ColemanPowerSeriesPartII/E7** (gap), BKO2021, Published Proof of Theorem5.8, p.960: Insert δ₁=(1+p⁻¹)δ and use 1∈Ξ⁺ to obtain δ(V_∞*,−)=0. The trivial-character equation is part of the minus-unit definition and the factor is nonzero. Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E7. Review: confirmed.
- **ColemanPowerSeriesPartII/E8** (misprint), BKO2021, Published §6.0.2, p.962: Use Gal(Ψ_n/Φ). The finite point exports use the degreep^n anticyclotomic layer overΦ. Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E8. Review: confirmed.
- **ColemanPowerSeriesPartII/E9** (misprint), BKO2021, Published Proof of Lemma5.2, p.957: Attach indices2,3 to X₀(N)→X(1), not f:X₀(N)→E. Those indices come from the j-map stabilizers; f has its separate different divisor bound. Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E10. Review: confirmed.
- **ColemanPowerSeriesPartII/E10** (misprint), BKO2021, Published Quasi-canonical field degree, p.958: Use [Ψ′_s:Φ]=(p+1)p^(s−1). The preceding quotient defines Ψ′_s. Status: Confirmed atlas erratum PAPER-BURUNGALE-KOBAYASHI-OTA-21/E3. Review: confirmed.
- **ColemanPowerSeriesPartII/E11** (gap), BKO2021, Proof of Proposition 3.3(3), p.953, published version, Annals of Mathematics 194 (2021), Caltech repository copy (SHA-256 77ff3290…790e): When W(φ)=−1 the trivial character, which lies in Ξ⁺, must also be treated: W(φ̄ν)=W(φ)=−1 forces L(φ̄ν,1)=0, and then (2) gives δ₁(ξ_ν)=0. V*,− is defined by the vanishing of δ_χ for every χ∈Ξ⁺, including χ=1 (conductor 1, an even power of p); the printed reduction considers only conductor >1. Status: new. Review: confirmed.
- **ColemanPowerSeriesPartII/E12** (misprint), BKO2021, Remark 2.3, p.949, published version, Annals of Mathematics 194 (2021), Caltech repository copy (SHA-256 77ff3290…790e): Rubin's computation (p.418) covers 5≤p≤1000 with p≢1 mod 12. Rubin p.418 states the bound 1000; since 1001=7·11·13, the two prime ranges coincide. Status: new. Review: confirmed.
- **ColemanPowerSeriesPartII/E13** (error), Rubin1987, Lemma 4.2 and proof, p.410: Assume in addition that φ(λx)=aug(λ)φ(x) for λ∈Λ (as for the Coates–Wiles derivative δ); then φ(𝔪X)⊂pO and the conclusion follows by Nakayama. For X=Λ=O[[T]] the coefficient of T is continuous and O-linear, takes the value 1 at T, but T lies in 𝔪 and does not generate Λ. Status: new to the reviewed atlas files; the unreviewed AnticyclotomicLocalUnits design records the same point as its E12. Review: confirmed.
- **ColemanPowerSeriesPartII/E14** (misprint), BKO2021, Proof of Theorem 5.5(ii), forward-lattice list, p.959, published version, Annals of Mathematics 194 (2021), Caltech repository copy (SHA-256 77ff3290…790e): With O=Z_p⊕Z_pθ use ((1+ap^sθ)/p^(s+1))Z_p t+T=(1+ap^sθ)T_(s+1). 1+ap^s is a unit of Z_p, so every printed lattice equals T_(s+1); the p distinct index-p superlattices of T_s other than p^(−1)T_(s−1) need a second coordinate. Status: new to the reviewed atlas files; the unreviewed AnticyclotomicLocalUnits design records the same point as its E13. Review: confirmed.
- **ColemanPowerSeriesPartII/E15** (gap), BKO2021, §4, p.954 (vanishing of the inverse limit of F(Θ_n), citing Hazewinkel), published version, Annals of Mathematics 194 (2021), Caltech repository copy (SHA-256 77ff3290…790e); Rubin 1987, proof of Lemma 5.1, p.411: Hazewinkel's Theorem 1.3 and Rubin's Proposition 4.5(i) give the vanishing of universal norms at the base Φ only; the coordinates at the ramified layers need a separate argument (gap G1), for example the deeply ramified route recorded there. A norm-compatible system with zero base coordinate need not vanish; Hazewinkel's theorem requires an absolutely unramified base, which Θ_n and Ψ_n are not for n≥1. Status: new (the conclusion is expected to hold by Coates–Greenberg's theory of deeply ramified extensions, not read here). Review: confirmed.

## Routed-item coverage

All57 routed items are accounted for below. Grouping means one target proves multiple directly related assertions; it does not remove an assertion.

| Extraction item | Target or exact imported node |
|---|---|
| conductor-parity | ColemanPowerSeriesPartII:AU.0/conductor-parity |
| units-limit | ColemanPowerSeriesPartII:AU.0/units-limit |
| units-free | ColemanPowerSeriesPartII:AU.0/units-free |
| anticyclotomic-quotient | ColemanPowerSeriesPartII:AU.0/anticyclotomic-quotient |
| quotient-free | ColemanPowerSeriesPartII:AU.0/units-free |
| inverse-tate-twist | ColemanPowerSeriesPartII:AU.0/inverse-tate-twist |
| coleman-series | ColemanPowerSeriesPartII:AU.1/coleman-series |
| coates-wiles | ColemanPowerSeriesPartII:AU.1/coates-wiles |
| derivative-covariance | ColemanPowerSeriesPartII:AU.1/derivative-covariance |
| character-derivative | ColemanPowerSeriesPartII:AU.1/character-derivative |
| derivative-descent | ColemanPowerSeriesPartII:AU.1/derivative-descent |
| signed-units | ColemanPowerSeriesPartII:AU.3/signed-units |
| signed-free | ColemanPowerSeriesPartII:AU.9/signed-free |
| signed-disjoint | ColemanPowerSeriesPartII:AU.3/signed-rank-upper |
| rubin-decomposition | ColemanPowerSeriesPartII:AU.9/rubin-decomposition |
| generator-nonvanishing | ColemanPowerSeriesPartII:AU.9/generator-nonvanishing |
| auxiliary-quadratic | ColemanPowerSeriesPartII:AU.4/auxiliary-quadratic |
| xi-nu | ColemanPowerSeriesPartII:AU.4/xi-nu |
| xi-trivial-value | ColemanPowerSeriesPartII:AU.4/xi-values |
| xi-character-value | ColemanPowerSeriesPartII:AU.4/xi-values |
| xi-signed | ColemanPowerSeriesPartII:AU.4/xi-signed |
| optimal-unit | ColemanPowerSeriesPartII:AU.4/optimal-unit |
| formal-kummer | ColemanPowerSeriesPartII:AU.2/formal-kummer |
| formal-kummer-duality | ColemanPowerSeriesPartII:AU.2/formal-kummer-duality |
| formal-norm-vanishing | ColemanPowerSeriesPartII:AU.2/formal-norm-vanishing |
| formal-points-units-dual | ColemanPowerSeriesPartII:AU.2/formal-points-units-dual |
| anticyclotomic-kummer | ColemanPowerSeriesPartII:AU.2/anticyclotomic-kummer |
| character-logarithm | ColemanPowerSeriesPartII:AU.3/character-logarithm |
| signed-formal-points | ColemanPowerSeriesPartII:AU.3/signed-points |
| formal-points-parity-sum | ColemanPowerSeriesPartII:AU.3/formal-points-parity-sum |
| formal-points-infinite-rank | ColemanPowerSeriesPartII:AU.3/formal-points-infinite-rank |
| wiles-pairing | ColemanPowerSeriesPartII:AU.2/wiles-pairing |
| signed-annihilator | ColemanPowerSeriesPartII:AU.3/signed-annihilator |
| signed-rank-upper | ColemanPowerSeriesPartII:AU.3/signed-rank-upper |
| supersingular-auxiliary | ColemanPowerSeriesPartII:AU.5/supersingular-auxiliary |
| manin-separability | ColemanPowerSeriesPartII:AU.5/manin-separability |
| scalar-frobenius | LubinTateFormalModulesAndQuasiCanonicalLifts:LT.4/elliptic-honda-comparison |
| ramification-count | ColemanPowerSeriesPartII:AU.5/ramification-count |
| generic-supersingular-count | ColemanPowerSeriesPartII:AU.5/generic-supersingular-count |
| exceptional-supersingular-count | ColemanPowerSeriesPartII:AU.5/exceptional-supersingular-count |
| moduli-etale | ColemanPowerSeriesPartII:AU.5/moduli-etale |
| primitive-formal-cm-point | ColemanPowerSeriesPartII:AU.5/primitive-formal-cm-point |
| modular-quasicanonical-points | ColemanPowerSeriesPartII:AU.6/quasicanonical-modular-points |
| optimal-point-system | ColemanPowerSeriesPartII:AU.7/optimal-point-system |
| optimal-point-primitive | ColemanPowerSeriesPartII:AU.7/optimal-point-primitive |
| hecke-lattice-relation | ColemanPowerSeriesPartII:AU.7/hecke-lattice-relation |
| optimal-point-trace | ColemanPowerSeriesPartII:AU.7/optimal-point-trace |
| optimal-point-boundary | ColemanPowerSeriesPartII:AU.7/optimal-point-trace |
| minus-point-invariants | ColemanPowerSeriesPartII:AU.8/minus-point-invariants |
| minus-quotient-free | ColemanPowerSeriesPartII:AU.8/minus-quotient-free |
| minus-kernel-free | ColemanPowerSeriesPartII:AU.8/minus-kernel-free |
| augmentation-unit-generation | ColemanPowerSeriesPartII:AU.9/augmentation-unit-generation |
| finite-signed-points | ColemanPowerSeriesPartII:AU.3/signed-points |
| delta-trivial-relation | ColemanPowerSeriesPartII:AU.1/delta-trivial-relation |
| wiles-dual-exponential | ColemanPowerSeriesPartII:AU.2/wiles-dual-exponential |
| delta-chi-nonzero | ColemanPowerSeriesPartII:AU.9/delta-chi-nonzero |
| rubin-small-primes | ColemanPowerSeriesPartII:AU.9/rubin-small-primes |

## References

- **BKO2021**. Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), Annals of Mathematics194(2021),943–966; published version. Read2026-10-18. Entire paper §§1–6, pp.943–966. This roadmap uses §§2–5, especially Theorems2.1,3.4,5.5,5.8, Corollaries2.2,5.6 and equations(3.4)–(3.10). Section6 is read for the export boundary, not planned here.
- **Rubin1987**. Karl Rubin, [Local units, elliptic units, Heegner points and elliptic curves](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0088/LOG_0026.pdf), Inventiones Mathematicae88(1987),405–422. Read2026-10-18. Entire article, pp.405–422, read from page images. In particular Proposition1.1, §§2,4–5, Propositions6.1,7.4, Theorem8.4 and Lemma10.1. The optimal system here is BKO’s formal-CM construction rather than Rubin’s global Heegner construction.
- **Hazewinkel1977**. Michiel Hazewinkel, [On norm maps for one dimensional formal groups III](https://ir.cwi.nl/pub/10014/10014D.pdf), Duke Mathematical Journal44(1977),305–314. Read2026-10-18. Entire article §§1–4, pp.305–314, including Theorem1.3, formal norm estimates and proof. Its absolute-unramified-base hypothesis is retained; see G1.
- **Wintenberger1980**. Jean-Pierre Wintenberger, [Structure galoisienne de limites projectives d’unités locales](https://www.numdam.org/item/CM_1980__42_1_89_0.pdf), Compositio Mathematica42(1980 archive volume; printed heading1981),89–103. Read2026-10-18. §4 theorem, pp.91–92, and its proof §§5.1–5.5.3, pp.92–98; remainder inspected for scope. Nontrivial, noncyclotomic tame components are the freeness input.
- **LIB**. Mathlib and Tau Ceti contributors, [Pinned declarations and current roadmap ownership](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; TauCetif790474821cf4256814db967cb154e7af3d0c369; roadmap0d144d044dacebca17b654695b6f1ad58f159b27. Read2026-10-18. Read pinned unit filtration, power-series derivative and formal-point completion homomorphism/injectivity/range. Read current LocalFieldsRamification, EllipticCurves, LocalGaloisGroups, ProfiniteArithmetic and parent Coleman roadmap documents; searched the nine post-snapshot roadmap directories and current library. Read current completed group algebra Basic, compact-module action and procyclic power-series coordinate statements.
- **AbbesUllmo1996**. Ahmed Abbes and Emmanuel Ullmo, [À propos de la conjecture de Manin pour les courbes elliptiques modulaires](http://www.numdam.org/item/CM_1996__103_3_269_0.pdf), Compositio Mathematica 103 (1996), 269–286; Numdam archive copy. Read2026-10-18. Introduction and Théorème A, p.269; location of the proof, pp.276–279, checked for scope
- **Fesenko1998**. Ivan B. Fesenko, [On deeply ramified extensions](https://ivanfesenko.org/wp-content/uploads/2021/10/drm.pdf), J. London Math. Soc. 57 (1998), 325–335; author's copy. Read2026-10-18. §1, Theorem 1.1 and Remarks 1.2–1.3; §2.5 (p-adic Lie extensions). Used only as a lead for gap G1.
